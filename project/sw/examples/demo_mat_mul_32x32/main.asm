
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0xbc>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	9d438393          	add	t2,t2,-1580 # fa08 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	94058593          	add	a1,a1,-1728 # 80000994 <__crt0_bss_end>
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
     110:	e8040413          	add	s0,s0,-384 # ef8c <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	e7848493          	add	s1,s1,-392 # ef8c <__fini_array_end>

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
     178:	e1840413          	add	s0,s0,-488 # ef8c <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	e1048493          	add	s1,s1,-496 # ef8c <__fini_array_end>

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
     218:	f9050513          	add	a0,a0,-112 # ef90 <__fini_array_end+0x4>
     21c:	4190006f          	j	e34 <printf>
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
     240:	3790e0ef          	jal	edb8 <__muldi3>
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
     270:	3500b0ef          	jal	b5c0 <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	1e90b0ef          	jal	bc6c <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	3200b0ef          	jal	b5c0 <__udivdi3>
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
     2c4:	f9c50513          	add	a0,a0,-100 # ef9c <__fini_array_end+0x10>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     2cc:	3690006f          	j	e34 <printf>

000002d0 <main>:
    }
  }
}
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }

int main(void){
     2d0:	ffffd2b7          	lui	t0,0xffffd
     2d4:	81010113          	add	sp,sp,-2032
     2d8:	f1028293          	add	t0,t0,-240 # ffffcf10 <__crt0_ram_last+0x7ff7cf11>
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     2dc:	0000f537          	lui	a0,0xf
int main(void){
     2e0:	7e112623          	sw	ra,2028(sp)
     2e4:	7e812423          	sw	s0,2024(sp)
     2e8:	7e912223          	sw	s1,2020(sp)
     2ec:	7f212023          	sw	s2,2016(sp)
     2f0:	7d312e23          	sw	s3,2012(sp)
     2f4:	7d412c23          	sw	s4,2008(sp)
     2f8:	7d512a23          	sw	s5,2004(sp)
     2fc:	7d612823          	sw	s6,2000(sp)
     300:	7d712623          	sw	s7,1996(sp)
     304:	7d812423          	sw	s8,1992(sp)
     308:	7d912223          	sw	s9,1988(sp)
     30c:	7da12023          	sw	s10,1984(sp)
     310:	7bb12e23          	sw	s11,1980(sp)
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     314:	02000613          	li	a2,32
int main(void){
     318:	00510133          	add	sp,sp,t0
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     31c:	02000593          	li	a1,32
     320:	fbc50513          	add	a0,a0,-68 # efbc <__fini_array_end+0x30>
     324:	311000ef          	jal	e34 <printf>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     328:	ffeb07b7          	lui	a5,0xffeb0
     32c:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     330:	0000f537          	lui	a0,0xf
     334:	fe050513          	add	a0,a0,-32 # efe0 <__fini_array_end+0x54>
     338:	2fd000ef          	jal	e34 <printf>

  int8_t  A[N][N], B[N][N];
  int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     33c:	ffffd437          	lui	s0,0xffffd
     340:	000047b7          	lui	a5,0x4
     344:	80040413          	add	s0,s0,-2048 # ffffc800 <__crt0_ram_last+0x7ff7c801>
     348:	86078793          	add	a5,a5,-1952 # 3860 <_vfprintf_r+0x1924>
     34c:	008787b3          	add	a5,a5,s0
     350:	04010713          	add	a4,sp,64
     354:	00e78433          	add	s0,a5,a4
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     358:	00040593          	mv	a1,s0
     35c:	00100693          	li	a3,1
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     360:	02000813          	li	a6,32
     364:	02100893          	li	a7,33
     368:	0ff6f613          	zext.b	a2,a3
     36c:	00261793          	sll	a5,a2,0x2
     370:	40f607b3          	sub	a5,a2,a5
     374:	0ff7f793          	zext.b	a5,a5
     378:	00000713          	li	a4,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     37c:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     380:	00e58333          	add	t1,a1,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     384:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     388:	00f607b3          	add	a5,a2,a5
     38c:	00a30023          	sb	a0,0(t1)
     390:	00170713          	add	a4,a4,1
     394:	0ff7f793          	zext.b	a5,a5
     398:	ff0712e3          	bne	a4,a6,37c <main+0xac>
     39c:	00168693          	add	a3,a3,1
     3a0:	02058593          	add	a1,a1,32
     3a4:	fd1692e3          	bne	a3,a7,368 <main+0x98>
     3a8:	ffffd7b7          	lui	a5,0xffffd
     3ac:	00004737          	lui	a4,0x4
     3b0:	c0078793          	add	a5,a5,-1024 # ffffcc00 <__crt0_ram_last+0x7ff7cc01>
     3b4:	86070713          	add	a4,a4,-1952 # 3860 <_vfprintf_r+0x1924>
     3b8:	00f70733          	add	a4,a4,a5
     3bc:	04010793          	add	a5,sp,64
     3c0:	00f707b3          	add	a5,a4,a5
     3c4:	00f12623          	sw	a5,12(sp)
     3c8:	00078613          	mv	a2,a5
     3cc:	00500713          	li	a4,5
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3d0:	02000513          	li	a0,32
     3d4:	0e500813          	li	a6,229
     3d8:	40e007b3          	neg	a5,a4
     3dc:	00179793          	sll	a5,a5,0x1
     3e0:	0ff7f793          	zext.b	a5,a5
     3e4:	00000693          	li	a3,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3e8:	00f7f593          	and	a1,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3ec:	00d608b3          	add	a7,a2,a3
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3f0:	ff858593          	add	a1,a1,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3f4:	00f707b3          	add	a5,a4,a5
     3f8:	00b88023          	sb	a1,0(a7)
     3fc:	00168693          	add	a3,a3,1
     400:	0ff7f793          	zext.b	a5,a5
     404:	fea692e3          	bne	a3,a0,3e8 <main+0x118>
     408:	fff70713          	add	a4,a4,-1
     40c:	0ff77713          	zext.b	a4,a4
     410:	02060613          	add	a2,a2,32
     414:	fd0712e3          	bne	a4,a6,3d8 <main+0x108>

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     418:	dcdff0ef          	jal	1e4 <rdcycle>
     41c:	00050993          	mv	s3,a0
     420:	00058b93          	mv	s7,a1
     424:	dd5ff0ef          	jal	1f8 <rdinstret>
     428:	000047b7          	lui	a5,0x4
     42c:	ffffdab7          	lui	s5,0xffffd
     430:	86078793          	add	a5,a5,-1952 # 3860 <_vfprintf_r+0x1924>
     434:	015787b3          	add	a5,a5,s5
     438:	04010713          	add	a4,sp,64
     43c:	00e78ab3          	add	s5,a5,a4
     440:	00001c37          	lui	s8,0x1
     444:	00050913          	mv	s2,a0
     448:	00058b13          	mv	s6,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     44c:	018a8c33          	add	s8,s5,s8
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     450:	00040c93          	mv	s9,s0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     454:	00000493          	li	s1,0
     458:	03c0006f          	j	494 <main+0x1c4>
     45c:	014c87b3          	add	a5,s9,s4
     460:	000d8583          	lb	a1,0(s11)
     464:	00078503          	lb	a0,0(a5)
     468:	001a0a13          	add	s4,s4,1
     46c:	020d8d93          	add	s11,s11,32
     470:	1250e0ef          	jal	ed94 <__mulsi3>
     474:	02000713          	li	a4,32
     478:	00ad0d33          	add	s10,s10,a0
     47c:	feea10e3          	bne	s4,a4,45c <main+0x18c>
     480:	00249793          	sll	a5,s1,0x2
     484:	00fa87b3          	add	a5,s5,a5
     488:	01a7a023          	sw	s10,0(a5)
     48c:	00148493          	add	s1,s1,1
     490:	01448c63          	beq	s1,s4,4a8 <main+0x1d8>
     494:	00c12783          	lw	a5,12(sp)
     498:	00000d13          	li	s10,0
     49c:	00000a13          	li	s4,0
     4a0:	00978db3          	add	s11,a5,s1
     4a4:	fb9ff06f          	j	45c <main+0x18c>
     4a8:	080a8a93          	add	s5,s5,128 # ffffd080 <__crt0_ram_last+0x7ff7d081>
     4ac:	020c8c93          	add	s9,s9,32
     4b0:	fb5c12e3          	bne	s8,s5,454 <main+0x184>
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     4b4:	d45ff0ef          	jal	1f8 <rdinstret>
     4b8:	00050a93          	mv	s5,a0
     4bc:	00058493          	mv	s1,a1
     4c0:	d25ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     4c4:	413507b3          	sub	a5,a0,s3
     4c8:	41758a33          	sub	s4,a1,s7
     4cc:	00f12823          	sw	a5,16(sp)
     4d0:	00f537b3          	sltu	a5,a0,a5
     4d4:	40fa07b3          	sub	a5,s4,a5
     4d8:	00f12c23          	sw	a5,24(sp)
     4dc:	412a87b3          	sub	a5,s5,s2
     4e0:	00fabab3          	sltu	s5,s5,a5
     4e4:	416484b3          	sub	s1,s1,s6
     4e8:	00f12a23          	sw	a5,20(sp)
     4ec:	415487b3          	sub	a5,s1,s5
     4f0:	00f12e23          	sw	a5,28(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     4f4:	cf1ff0ef          	jal	1e4 <rdcycle>
     4f8:	00050b13          	mv	s6,a0
     4fc:	00058b93          	mv	s7,a1
     500:	cf9ff0ef          	jal	1f8 <rdinstret>
     504:	000047b7          	lui	a5,0x4
     508:	ffffe6b7          	lui	a3,0xffffe
     50c:	86078793          	add	a5,a5,-1952 # 3860 <_vfprintf_r+0x1924>
     510:	00d787b3          	add	a5,a5,a3
     514:	04010713          	add	a4,sp,64
     518:	00058d13          	mv	s10,a1
     51c:	00050a93          	mv	s5,a0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     520:	00e786b3          	add	a3,a5,a4
     524:	40040813          	add	a6,s0,1024
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     528:	00040593          	mv	a1,s0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     52c:	02000893          	li	a7,32
     530:	00000713          	li	a4,0
     534:	02058613          	add	a2,a1,32
     538:	07c0006f          	j	5b4 <main+0x2e4>
         (((uint32_t)(uint8_t)x1) << 8)  |
     53c:	00134783          	lbu	a5,1(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     540:	00234e83          	lbu	t4,2(t1)
     544:	040e4f03          	lbu	t5,64(t3)
         (((uint32_t)(uint8_t)x1) << 8)  |
     548:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     54c:	010e9e93          	sll	t4,t4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     550:	01d7e7b3          	or	a5,a5,t4
  return  ((uint32_t)(uint8_t)x0)        |
     554:	00034e83          	lbu	t4,0(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     558:	010f1f13          	sll	t5,t5,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     55c:	01d7e7b3          	or	a5,a5,t4
         (((uint32_t)(uint8_t)x3) << 24);
     560:	00334e83          	lbu	t4,3(t1)
     564:	018e9e93          	sll	t4,t4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     568:	01d7eeb3          	or	t4,a5,t4
         (((uint32_t)(uint8_t)x1) << 8)  |
     56c:	020e4783          	lbu	a5,32(t3)
     570:	00879793          	sll	a5,a5,0x8
     574:	01e7e7b3          	or	a5,a5,t5
  return  ((uint32_t)(uint8_t)x0)        |
     578:	000e4f03          	lbu	t5,0(t3)
         (((uint32_t)(uint8_t)x1) << 8)  |
     57c:	01e7e7b3          	or	a5,a5,t5
         (((uint32_t)(uint8_t)x3) << 24);
     580:	060e4f03          	lbu	t5,96(t3)
     584:	018f1f13          	sll	t5,t5,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     588:	01e7e7b3          	or	a5,a5,t5
  __asm__ volatile(".insn r 0x0B, %1, %2, %0, %3, %4"
     58c:	02fe878b          	.insn	4, 0x02fe878b
    int32_t acc=0; for(int k=0;k<N;k+=4){
     590:	00430313          	add	t1,t1,4
      acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     594:	00f50533          	add	a0,a0,a5
    int32_t acc=0; for(int k=0;k<N;k+=4){
     598:	080e0e13          	add	t3,t3,128
     59c:	fa6610e3          	bne	a2,t1,53c <main+0x26c>
    } C[i][j]=acc;
     5a0:	00271793          	sll	a5,a4,0x2
     5a4:	00f687b3          	add	a5,a3,a5
     5a8:	00a7a023          	sw	a0,0(a5)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     5ac:	00170713          	add	a4,a4,1
     5b0:	01170c63          	beq	a4,a7,5c8 <main+0x2f8>
    int32_t acc=0; for(int k=0;k<N;k+=4){
     5b4:	00c12783          	lw	a5,12(sp)
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     5b8:	00058313          	mv	t1,a1
    int32_t acc=0; for(int k=0;k<N;k+=4){
     5bc:	00000513          	li	a0,0
     5c0:	00e78e33          	add	t3,a5,a4
     5c4:	f79ff06f          	j	53c <main+0x26c>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     5c8:	08068693          	add	a3,a3,128 # ffffe080 <__crt0_ram_last+0x7ff7e081>
     5cc:	01060663          	beq	a2,a6,5d8 <main+0x308>
     5d0:	00060593          	mv	a1,a2
     5d4:	f5dff06f          	j	530 <main+0x260>
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     5d8:	c21ff0ef          	jal	1f8 <rdinstret>
     5dc:	00050c93          	mv	s9,a0
     5e0:	00058d93          	mv	s11,a1
     5e4:	c01ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     5e8:	41650b33          	sub	s6,a0,s6
     5ec:	016537b3          	sltu	a5,a0,s6
     5f0:	41758bb3          	sub	s7,a1,s7
     5f4:	415c8ab3          	sub	s5,s9,s5
     5f8:	40fb87b3          	sub	a5,s7,a5
     5fc:	015cbcb3          	sltu	s9,s9,s5
     600:	41ad8db3          	sub	s11,s11,s10
     604:	02f12023          	sw	a5,32(sp)
     608:	419d87b3          	sub	a5,s11,s9
     60c:	02f12223          	sw	a5,36(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     610:	bd5ff0ef          	jal	1e4 <rdcycle>
     614:	02a12423          	sw	a0,40(sp)
     618:	02b12623          	sw	a1,44(sp)
     61c:	bddff0ef          	jal	1f8 <rdinstret>
     620:	00004737          	lui	a4,0x4
     624:	fffffcb7          	lui	s9,0xfffff
     628:	86070793          	add	a5,a4,-1952 # 3860 <_vfprintf_r+0x1924>
     62c:	019787b3          	add	a5,a5,s9
     630:	04010693          	add	a3,sp,64
     634:	00d78cb3          	add	s9,a5,a3
    uint32_t Aw[4]={0},Bw[4]={0};
     638:	86070713          	add	a4,a4,-1952
     63c:	ffffc7b7          	lui	a5,0xffffc
     640:	00f70733          	add	a4,a4,a5
     644:	00d707b3          	add	a5,a4,a3
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     648:	02a12823          	sw	a0,48(sp)
     64c:	02b12a23          	sw	a1,52(sp)
  for(int i0=0;i0<N;i0+=4){
     650:	00000d93          	li	s11,0
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     654:	800004b7          	lui	s1,0x80000
    uint32_t Aw[4]={0},Bw[4]={0};
     658:	00f12423          	sw	a5,8(sp)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     65c:	000c8d13          	mv	s10,s9
    for(int j0=0;j0<N;j0+=4){
     660:	00000c13          	li	s8,0
     664:	2700006f          	j	8d4 <main+0x604>
        Bflat[k*LDB+0]=B[k][j0+0];
     668:	0006c583          	lbu	a1,0(a3)
      for(int k=0;k<N;++k){
     66c:	00478793          	add	a5,a5,4 # ffffc004 <__crt0_ram_last+0x7ff7c005>
     670:	02068693          	add	a3,a3,32
        Bflat[k*LDB+0]=B[k][j0+0];
     674:	feb78e23          	sb	a1,-4(a5)
        Bflat[k*LDB+1]=B[k][j0+1];
     678:	fe16c583          	lbu	a1,-31(a3)
     67c:	feb78ea3          	sb	a1,-3(a5)
        Bflat[k*LDB+2]=B[k][j0+2];
     680:	fe26c583          	lbu	a1,-30(a3)
     684:	feb78f23          	sb	a1,-2(a5)
        Bflat[k*LDB+3]=B[k][j0+3];
     688:	fe36c583          	lbu	a1,-29(a3)
     68c:	feb78fa3          	sb	a1,-1(a5)
      for(int k=0;k<N;++k){
     690:	fcf61ce3          	bne	a2,a5,668 <main+0x398>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     694:	ffeb07b7          	lui	a5,0xffeb0
     698:	00200693          	li	a3,2
     69c:	00d7a023          	sw	a3,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     6a0:	0007a783          	lw	a5,0(a5)
  for(int s=0;s<T;++s){
     6a4:	ffffcf37          	lui	t5,0xffffc
     6a8:	ffffcfb7          	lui	t6,0xffffc
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6ac:	ffeb0eb7          	lui	t4,0xffeb0
     6b0:	ffeb0e37          	lui	t3,0xffeb0
     6b4:	ffeb0337          	lui	t1,0xffeb0
     6b8:	ffeb0bb7          	lui	s7,0xffeb0
     6bc:	ffeb08b7          	lui	a7,0xffeb0
     6c0:	ffeb0837          	lui	a6,0xffeb0
     6c4:	ffeb0537          	lui	a0,0xffeb0
     6c8:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0;s<T;++s){
     6cc:	00000793          	li	a5,0
     6d0:	7a0f0f13          	add	t5,t5,1952 # ffffc7a0 <__crt0_ram_last+0x7ff7c7a1>
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     6d4:	01f00913          	li	s2,31
     6d8:	00400993          	li	s3,4
     6dc:	7b0f8f93          	add	t6,t6,1968 # ffffc7b0 <__crt0_ram_last+0x7ff7c7b1>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e0:	ffeb0a37          	lui	s4,0xffeb0
     6e4:	004e8e93          	add	t4,t4,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     6e8:	008e0e13          	add	t3,t3,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     6ec:	00c30313          	add	t1,t1,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     6f0:	010b8b93          	add	s7,s7,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     6f4:	01488893          	add	a7,a7,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     6f8:	01880813          	add	a6,a6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     6fc:	01c50513          	add	a0,a0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     700:	02058593          	add	a1,a1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
    uint32_t Aw[4]={0},Bw[4]={0};
     704:	00812683          	lw	a3,8(sp)
     708:	04010613          	add	a2,sp,64
     70c:	7a06a023          	sw	zero,1952(a3)
     710:	7a06a223          	sw	zero,1956(a3)
     714:	7a06a423          	sw	zero,1960(a3)
     718:	7a06a623          	sw	zero,1964(a3)
     71c:	7a06a823          	sw	zero,1968(a3)
     720:	7a06aa23          	sw	zero,1972(a3)
     724:	7a06ac23          	sw	zero,1976(a3)
     728:	7a06ae23          	sw	zero,1980(a3)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     72c:	000046b7          	lui	a3,0x4
     730:	86068693          	add	a3,a3,-1952 # 3860 <_vfprintf_r+0x1924>
     734:	01e686b3          	add	a3,a3,t5
     738:	00c683b3          	add	t2,a3,a2
     73c:	800006b7          	lui	a3,0x80000
     740:	7b468693          	add	a3,a3,1972 # 800007b4 <Aflat.1>
     744:	00d782b3          	add	t0,a5,a3
     748:	00000693          	li	a3,0
     74c:	40d780b3          	sub	ra,a5,a3
     750:	00000613          	li	a2,0
     754:	00196463          	bltu	s2,ra,75c <main+0x48c>
     758:	00028603          	lb	a2,0(t0)
     75c:	0ff67613          	zext.b	a2,a2
     760:	00c3a023          	sw	a2,0(t2)
     764:	00168693          	add	a3,a3,1
     768:	00438393          	add	t2,t2,4
     76c:	01f28293          	add	t0,t0,31
     770:	fd369ee3          	bne	a3,s3,74c <main+0x47c>
     774:	000046b7          	lui	a3,0x4
     778:	86068693          	add	a3,a3,-1952 # 3860 <_vfprintf_r+0x1924>
     77c:	01f686b3          	add	a3,a3,t6
     780:	04010613          	add	a2,sp,64
     784:	00c683b3          	add	t2,a3,a2
     788:	00070293          	mv	t0,a4
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)?Bflat[k*LDB+j]:0; Bw[j]=(uint32_t)(uint8_t)b; }
     78c:	00000693          	li	a3,0
     790:	40d780b3          	sub	ra,a5,a3
     794:	00000613          	li	a2,0
     798:	00196463          	bltu	s2,ra,7a0 <main+0x4d0>
     79c:	00028603          	lb	a2,0(t0)
     7a0:	0ff67613          	zext.b	a2,a2
     7a4:	00c3a023          	sw	a2,0(t2)
     7a8:	00168693          	add	a3,a3,1
     7ac:	00438393          	add	t2,t2,4
     7b0:	ffd28293          	add	t0,t0,-3
     7b4:	fd369ee3          	bne	a3,s3,790 <main+0x4c0>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7b8:	00812683          	lw	a3,8(sp)
     7bc:	7a06a683          	lw	a3,1952(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7c0:	00dea023          	sw	a3,0(t4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7c4:	00812683          	lw	a3,8(sp)
     7c8:	7a46a683          	lw	a3,1956(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7cc:	00de2023          	sw	a3,0(t3)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7d0:	00812683          	lw	a3,8(sp)
     7d4:	7a86a683          	lw	a3,1960(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7d8:	00d32023          	sw	a3,0(t1)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7dc:	00812683          	lw	a3,8(sp)
     7e0:	7ac6a683          	lw	a3,1964(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7e4:	00dba023          	sw	a3,0(s7)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7e8:	00812683          	lw	a3,8(sp)
     7ec:	7b06a683          	lw	a3,1968(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7f0:	00d8a023          	sw	a3,0(a7)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7f4:	00812683          	lw	a3,8(sp)
     7f8:	7b46a683          	lw	a3,1972(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7fc:	00d82023          	sw	a3,0(a6)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     800:	00812683          	lw	a3,8(sp)
     804:	7b86a683          	lw	a3,1976(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     808:	00d52023          	sw	a3,0(a0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     80c:	00812683          	lw	a3,8(sp)
     810:	7bc6a683          	lw	a3,1980(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     814:	00d5a023          	sw	a3,0(a1)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     818:	000a2683          	lw	a3,0(s4) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     81c:	00100693          	li	a3,1
     820:	00da2023          	sw	a3,0(s4)
  for(int s=0;s<T;++s){
     824:	00178793          	add	a5,a5,1
     828:	02600693          	li	a3,38
     82c:	00470713          	add	a4,a4,4
     830:	ecd79ae3          	bne	a5,a3,704 <main+0x434>
     834:	ffffc5b7          	lui	a1,0xffffc
     838:	000047b7          	lui	a5,0x4
     83c:	7c058593          	add	a1,a1,1984 # ffffc7c0 <__crt0_ram_last+0x7ff7c7c1>
     840:	86078793          	add	a5,a5,-1952 # 3860 <_vfprintf_r+0x1924>
     844:	04010713          	add	a4,sp,64
     848:	00b787b3          	add	a5,a5,a1
     84c:	00e785b3          	add	a1,a5,a4
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     850:	ffeb0637          	lui	a2,0xffeb0
  for(int s=0;s<T;++s){
     854:	00058513          	mv	a0,a1
     858:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     85c:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     860:	01000813          	li	a6,16
     864:	00271693          	sll	a3,a4,0x2
     868:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     86c:	00c686b3          	add	a3,a3,a2
     870:	00f688b3          	add	a7,a3,a5
     874:	0008a303          	lw	t1,0(a7)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     878:	00f508b3          	add	a7,a0,a5
     87c:	00478793          	add	a5,a5,4
     880:	0068a023          	sw	t1,0(a7)
     884:	ff0796e3          	bne	a5,a6,870 <main+0x5a0>
     888:	00470713          	add	a4,a4,4
     88c:	01050513          	add	a0,a0,16
     890:	fcf71ae3          	bne	a4,a5,864 <main+0x594>
     894:	04058713          	add	a4,a1,64
     898:	000d0793          	mv	a5,s10
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
     89c:	00078513          	mv	a0,a5
     8a0:	01000613          	li	a2,16
     8a4:	02e12e23          	sw	a4,60(sp)
     8a8:	02b12c23          	sw	a1,56(sp)
     8ac:	019000ef          	jal	10c4 <memcpy>
     8b0:	03812583          	lw	a1,56(sp)
     8b4:	03c12703          	lw	a4,60(sp)
     8b8:	08050793          	add	a5,a0,128
     8bc:	01058593          	add	a1,a1,16
     8c0:	fcb71ee3          	bne	a4,a1,89c <main+0x5cc>
    for(int j0=0;j0<N;j0+=4){
     8c4:	004c0c13          	add	s8,s8,4 # 1004 <memset+0x1c>
     8c8:	02000793          	li	a5,32
     8cc:	010d0d13          	add	s10,s10,16
     8d0:	02fc0863          	beq	s8,a5,900 <main+0x630>
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     8d4:	08000613          	li	a2,128
     8d8:	00040593          	mv	a1,s0
     8dc:	7b448513          	add	a0,s1,1972 # 800007b4 <Aflat.1>
     8e0:	7e4000ef          	jal	10c4 <memcpy>
     8e4:	00c12783          	lw	a5,12(sp)
     8e8:	00fc06b3          	add	a3,s8,a5
     8ec:	800007b7          	lui	a5,0x80000
     8f0:	73478713          	add	a4,a5,1844 # 80000734 <Bflat.0>
     8f4:	08070613          	add	a2,a4,128
     8f8:	73478793          	add	a5,a5,1844
     8fc:	d6dff06f          	j	668 <main+0x398>
  for(int i0=0;i0<N;i0+=4){
     900:	004d8d93          	add	s11,s11,4
     904:	200c8c93          	add	s9,s9,512 # fffff200 <__crt0_ram_last+0x7ff7f201>
     908:	08040413          	add	s0,s0,128
     90c:	d58d98e3          	bne	s11,s8,65c <main+0x38c>
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     910:	8e9ff0ef          	jal	1f8 <rdinstret>
     914:	00050d93          	mv	s11,a0
     918:	00058d13          	mv	s10,a1
     91c:	8c9ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     920:	02812783          	lw	a5,40(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     924:	00004637          	lui	a2,0x4
     928:	ffffd737          	lui	a4,0xffffd
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     92c:	40f50433          	sub	s0,a0,a5
     930:	02c12783          	lw	a5,44(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     934:	86060693          	add	a3,a2,-1952 # 3860 <_vfprintf_r+0x1924>
     938:	00e686b3          	add	a3,a3,a4
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     93c:	40f58c33          	sub	s8,a1,a5
     940:	03012783          	lw	a5,48(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     944:	04010713          	add	a4,sp,64
     948:	00e68733          	add	a4,a3,a4
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     94c:	40fd8cb3          	sub	s9,s11,a5
     950:	03412783          	lw	a5,52(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     954:	00e12423          	sw	a4,8(sp)
     958:	86060693          	add	a3,a2,-1952
     95c:	ffffe737          	lui	a4,0xffffe
     960:	00e686b3          	add	a3,a3,a4
     964:	04010713          	add	a4,sp,64
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     968:	40fd0d33          	sub	s10,s10,a5
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     96c:	00e68733          	add	a4,a3,a4
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     970:	00853533          	sltu	a0,a0,s0
     974:	019dbdb3          	sltu	s11,s11,s9
     978:	40ac0c33          	sub	s8,s8,a0
     97c:	41bd0d33          	sub	s10,s10,s11
     980:	00000793          	li	a5,0
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     984:	00e12623          	sw	a4,12(sp)
     988:	000016b7          	lui	a3,0x1
     98c:	00812703          	lw	a4,8(sp)
     990:	00f70733          	add	a4,a4,a5
     994:	00072603          	lw	a2,0(a4) # ffffe000 <__crt0_ram_last+0x7ff7e001>
     998:	00c12703          	lw	a4,12(sp)
     99c:	00f70733          	add	a4,a4,a5
     9a0:	00072703          	lw	a4,0(a4)
     9a4:	1ce61e63          	bne	a2,a4,b80 <main+0x8b0>
     9a8:	00478793          	add	a5,a5,4
     9ac:	fed790e3          	bne	a5,a3,98c <main+0x6bc>
     9b0:	00100d93          	li	s11,1
     9b4:	00004637          	lui	a2,0x4
     9b8:	ffffd737          	lui	a4,0xffffd
     9bc:	86060693          	add	a3,a2,-1952 # 3860 <_vfprintf_r+0x1924>
     9c0:	00e686b3          	add	a3,a3,a4
     9c4:	04010713          	add	a4,sp,64
     9c8:	00e68733          	add	a4,a3,a4
     9cc:	00e12423          	sw	a4,8(sp)
     9d0:	86060693          	add	a3,a2,-1952
     9d4:	fffff737          	lui	a4,0xfffff
     9d8:	00e686b3          	add	a3,a3,a4
     9dc:	04010713          	add	a4,sp,64
     9e0:	00e68733          	add	a4,a3,a4
     9e4:	00000793          	li	a5,0
     9e8:	00e12623          	sw	a4,12(sp)
     9ec:	000016b7          	lui	a3,0x1
     9f0:	00812703          	lw	a4,8(sp)
     9f4:	00f70733          	add	a4,a4,a5
     9f8:	00072603          	lw	a2,0(a4) # fffff000 <__crt0_ram_last+0x7ff7f001>
     9fc:	00c12703          	lw	a4,12(sp)
     a00:	00f70733          	add	a4,a4,a5
     a04:	00072703          	lw	a4,0(a4)
     a08:	18e61063          	bne	a2,a4,b88 <main+0x8b8>
     a0c:	00478793          	add	a5,a5,4
     a10:	fed790e3          	bne	a5,a3,9f0 <main+0x720>
     a14:	00100493          	li	s1,1

  int ok1=cmp(&Csw[0][0],&Ccfu[0][0]);
  int ok2=cmp(&Csw[0][0],&Ccfs[0][0]);

  printf("\n%dx%d timing summary\n", N,N);
     a18:	0000f537          	lui	a0,0xf
     a1c:	02000593          	li	a1,32
     a20:	02000613          	li	a2,32
     a24:	ff450513          	add	a0,a0,-12 # eff4 <__fini_array_end+0x68>
     a28:	40c000ef          	jal	e34 <printf>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     a2c:	0000f537          	lui	a0,0xf
     a30:	00c50513          	add	a0,a0,12 # f00c <__fini_array_end+0x80>
     a34:	594000ef          	jal	fc8 <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     a38:	0000f537          	lui	a0,0xf
     a3c:	04c50513          	add	a0,a0,76 # f04c <__fini_array_end+0xc0>
     a40:	588000ef          	jal	fc8 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     a44:	01412703          	lw	a4,20(sp)
     a48:	01c12783          	lw	a5,28(sp)
     a4c:	01012603          	lw	a2,16(sp)
     a50:	01812683          	lw	a3,24(sp)
     a54:	0000f537          	lui	a0,0xf
     a58:	08c50513          	add	a0,a0,140 # f08c <__fini_array_end+0x100>
     a5c:	3d8000ef          	jal	e34 <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     a60:	02412783          	lw	a5,36(sp)
     a64:	02012683          	lw	a3,32(sp)
     a68:	0000f537          	lui	a0,0xf
     a6c:	000a8713          	mv	a4,s5
     a70:	000b0613          	mv	a2,s6
     a74:	0c450513          	add	a0,a0,196 # f0c4 <__fini_array_end+0x138>
     a78:	3bc000ef          	jal	e34 <printf>
     a7c:	02012683          	lw	a3,32(sp)
     a80:	01812583          	lw	a1,24(sp)
     a84:	01012503          	lw	a0,16(sp)
     a88:	000b0613          	mv	a2,s6
     a8c:	0000fb37          	lui	s6,0xf
     a90:	f7cff0ef          	jal	20c <print_speedup_fixed>
     a94:	0e0b0513          	add	a0,s6,224 # f0e0 <__fini_array_end+0x154>
     a98:	39c000ef          	jal	e34 <printf>
     a9c:	01c12583          	lw	a1,28(sp)
     aa0:	02412683          	lw	a3,36(sp)
     aa4:	01412503          	lw	a0,20(sp)
     aa8:	000a8613          	mv	a2,s5
     aac:	f60ff0ef          	jal	20c <print_speedup_fixed>
     ab0:	00a00513          	li	a0,10
     ab4:	3d0000ef          	jal	e84 <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     ab8:	0000f537          	lui	a0,0xf
     abc:	000c8713          	mv	a4,s9
     ac0:	000d0793          	mv	a5,s10
     ac4:	00040613          	mv	a2,s0
     ac8:	000c0693          	mv	a3,s8
     acc:	0ec50513          	add	a0,a0,236 # f0ec <__fini_array_end+0x160>
     ad0:	364000ef          	jal	e34 <printf>
     ad4:	01812583          	lw	a1,24(sp)
     ad8:	01012503          	lw	a0,16(sp)
     adc:	00040613          	mv	a2,s0
     ae0:	000c0693          	mv	a3,s8
     ae4:	f28ff0ef          	jal	20c <print_speedup_fixed>
     ae8:	0e0b0513          	add	a0,s6,224
     aec:	348000ef          	jal	e34 <printf>
     af0:	01412503          	lw	a0,20(sp)
     af4:	01c12583          	lw	a1,28(sp)
     af8:	000c8613          	mv	a2,s9
     afc:	000d0693          	mv	a3,s10
     b00:	f0cff0ef          	jal	20c <print_speedup_fixed>
     b04:	00a00513          	li	a0,10
     b08:	37c000ef          	jal	e84 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     b0c:	080d8263          	beqz	s11,b90 <main+0x8c0>
     b10:	0000f5b7          	lui	a1,0xf
     b14:	fac58593          	add	a1,a1,-84 # efac <__fini_array_end+0x20>
     b18:	08048263          	beqz	s1,b9c <main+0x8cc>
     b1c:	0000f637          	lui	a2,0xf
     b20:	fac60613          	add	a2,a2,-84 # efac <__fini_array_end+0x20>
     b24:	0000f537          	lui	a0,0xf
     b28:	10850513          	add	a0,a0,264 # f108 <__fini_array_end+0x17c>
     b2c:	308000ef          	jal	e34 <printf>
  return (ok1&&ok2)?0:1;
}
     b30:	000032b7          	lui	t0,0x3
     b34:	0f028293          	add	t0,t0,240 # 30f0 <_vfprintf_r+0x11b4>
     b38:	00510133          	add	sp,sp,t0
     b3c:	7ec12083          	lw	ra,2028(sp)
  return (ok1&&ok2)?0:1;
     b40:	01b4f533          	and	a0,s1,s11
}
     b44:	7e812403          	lw	s0,2024(sp)
     b48:	7e412483          	lw	s1,2020(sp)
     b4c:	7e012903          	lw	s2,2016(sp)
     b50:	7dc12983          	lw	s3,2012(sp)
     b54:	7d812a03          	lw	s4,2008(sp)
     b58:	7d412a83          	lw	s5,2004(sp)
     b5c:	7d012b03          	lw	s6,2000(sp)
     b60:	7cc12b83          	lw	s7,1996(sp)
     b64:	7c812c03          	lw	s8,1992(sp)
     b68:	7c412c83          	lw	s9,1988(sp)
     b6c:	7c012d03          	lw	s10,1984(sp)
     b70:	7bc12d83          	lw	s11,1980(sp)
     b74:	00154513          	xor	a0,a0,1
     b78:	7f010113          	add	sp,sp,2032
     b7c:	00008067          	ret
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     b80:	00000d93          	li	s11,0
     b84:	e31ff06f          	j	9b4 <main+0x6e4>
     b88:	00000493          	li	s1,0
     b8c:	e8dff06f          	j	a18 <main+0x748>
  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     b90:	0000f5b7          	lui	a1,0xf
     b94:	fb458593          	add	a1,a1,-76 # efb4 <__fini_array_end+0x28>
     b98:	f81ff06f          	j	b18 <main+0x848>
     b9c:	0000f637          	lui	a2,0xf
     ba0:	fb460613          	add	a2,a2,-76 # efb4 <__fini_array_end+0x28>
     ba4:	f81ff06f          	j	b24 <main+0x854>

00000ba8 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     ba8:	fffff097          	auipc	ra,0xfffff
     bac:	5b008093          	add	ra,ra,1456 # 158 <__crt0_main_exit>
     bb0:	00050513          	mv	a0,a0
     bb4:	00008067          	ret

00000bb8 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     bb8:	fff00513          	li	a0,-1
     bbc:	00008067          	ret

00000bc0 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     bc0:	000027b7          	lui	a5,0x2
     bc4:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     bc8:	00000513          	li	a0,0
     bcc:	00008067          	ret

00000bd0 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     bd0:	00100513          	li	a0,1
     bd4:	00008067          	ret

00000bd8 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     bd8:	00100513          	li	a0,1
     bdc:	00008067          	ret

00000be0 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     be0:	800007b7          	lui	a5,0x80000
     be4:	01600713          	li	a4,22
     be8:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     bec:	fff00513          	li	a0,-1
     bf0:	00008067          	ret

00000bf4 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     bf4:	00000513          	li	a0,0
     bf8:	00008067          	ret

00000bfc <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     bfc:	fe010113          	add	sp,sp,-32
     c00:	00912a23          	sw	s1,20(sp)
     c04:	01212823          	sw	s2,16(sp)
     c08:	00112e23          	sw	ra,28(sp)
     c0c:	00812c23          	sw	s0,24(sp)
     c10:	01312623          	sw	s3,12(sp)
     c14:	01412423          	sw	s4,8(sp)
     c18:	00058913          	mv	s2,a1
     c1c:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     c20:	06051463          	bnez	a0,c88 <_read+0x8c>
     c24:	00050413          	mv	s0,a0
     c28:	fff50537          	lui	a0,0xfff50
     c2c:	1a0000ef          	jal	dcc <neorv32_uart_available>
     c30:	04050c63          	beqz	a0,c88 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c34:	00a00993          	li	s3,10
     c38:	00d00a13          	li	s4,13
    while (len--) {
     c3c:	00941663          	bne	s0,s1,c48 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     c40:	00048413          	mv	s0,s1
     c44:	0200006f          	j	c64 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     c48:	fff50537          	lui	a0,0xfff50
     c4c:	1d0000ef          	jal	e1c <neorv32_uart_getc>
      *ptr++ = c;
     c50:	008907b3          	add	a5,s2,s0
     c54:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     c58:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c5c:	01350463          	beq	a0,s3,c64 <_read+0x68>
     c60:	fd451ee3          	bne	a0,s4,c3c <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     c64:	01c12083          	lw	ra,28(sp)
     c68:	00040513          	mv	a0,s0
     c6c:	01812403          	lw	s0,24(sp)
     c70:	01412483          	lw	s1,20(sp)
     c74:	01012903          	lw	s2,16(sp)
     c78:	00c12983          	lw	s3,12(sp)
     c7c:	00812a03          	lw	s4,8(sp)
     c80:	02010113          	add	sp,sp,32
     c84:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     c88:	fff60537          	lui	a0,0xfff60
     c8c:	140000ef          	jal	dcc <neorv32_uart_available>
  int read_cnt = 0;
     c90:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     c94:	02050863          	beqz	a0,cc4 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c98:	00a00993          	li	s3,10
     c9c:	00d00a13          	li	s4,13
    while (len--) {
     ca0:	fa9400e3          	beq	s0,s1,c40 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     ca4:	fff60537          	lui	a0,0xfff60
     ca8:	174000ef          	jal	e1c <neorv32_uart_getc>
      *ptr++ = c;
     cac:	008907b3          	add	a5,s2,s0
     cb0:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     cb4:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     cb8:	fb3506e3          	beq	a0,s3,c64 <_read+0x68>
     cbc:	ff4512e3          	bne	a0,s4,ca0 <_read+0xa4>
     cc0:	fa5ff06f          	j	c64 <_read+0x68>
    errno = ENOSYS;
     cc4:	800007b7          	lui	a5,0x80000
     cc8:	05800713          	li	a4,88
     ccc:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     cd0:	fff00413          	li	s0,-1
     cd4:	f91ff06f          	j	c64 <_read+0x68>

00000cd8 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     cd8:	ff010113          	add	sp,sp,-16
     cdc:	00812423          	sw	s0,8(sp)
     ce0:	00912223          	sw	s1,4(sp)
     ce4:	00112623          	sw	ra,12(sp)
     ce8:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     cec:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     cf0:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     cf4:	00058413          	mv	s0,a1
     cf8:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     cfc:	04a7ec63          	bltu	a5,a0,d54 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     d00:	fff50537          	lui	a0,0xfff50
     d04:	0c8000ef          	jal	dcc <neorv32_uart_available>
     d08:	00940933          	add	s2,s0,s1
     d0c:	02051463          	bnez	a0,d34 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     d10:	800007b7          	lui	a5,0x80000
     d14:	05800713          	li	a4,88
     d18:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     d1c:	fff00493          	li	s1,-1
     d20:	0180006f          	j	d38 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     d24:	00044583          	lbu	a1,0(s0)
     d28:	fff50537          	lui	a0,0xfff50
     d2c:	00140413          	add	s0,s0,1
     d30:	0d8000ef          	jal	e08 <neorv32_uart_putc>
      while (len--) {
     d34:	fe8918e3          	bne	s2,s0,d24 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     d38:	00c12083          	lw	ra,12(sp)
     d3c:	00812403          	lw	s0,8(sp)
     d40:	00012903          	lw	s2,0(sp)
     d44:	00048513          	mv	a0,s1
     d48:	00412483          	lw	s1,4(sp)
     d4c:	01010113          	add	sp,sp,16
     d50:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     d54:	fff60537          	lui	a0,0xfff60
     d58:	074000ef          	jal	dcc <neorv32_uart_available>
     d5c:	00940933          	add	s2,s0,s1
     d60:	fa0508e3          	beqz	a0,d10 <_write+0x38>
    while (len--) {
     d64:	fd240ae3          	beq	s0,s2,d38 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     d68:	00044583          	lbu	a1,0(s0)
     d6c:	fff60537          	lui	a0,0xfff60
     d70:	00140413          	add	s0,s0,1
     d74:	094000ef          	jal	e08 <neorv32_uart_putc>
      write_cnt++;
     d78:	fedff06f          	j	d64 <_write+0x8c>

00000d7c <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     d7c:	80000737          	lui	a4,0x80000
     d80:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     d84:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     d88:	00050793          	mv	a5,a0
     d8c:	99460613          	add	a2,a2,-1644 # 80000994 <__crt0_bss_end>
  if (curr_heap == NULL) {
     d90:	00069463          	bnez	a3,d98 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     d94:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     d98:	800016b7          	lui	a3,0x80001
     d9c:	99468693          	add	a3,a3,-1644 # 80000994 <__crt0_bss_end>
     da0:	00c69c63          	bne	a3,a2,db8 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     da4:	800007b7          	lui	a5,0x80000
     da8:	00c00713          	li	a4,12
     dac:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     db0:	fff00513          	li	a0,-1
     db4:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     db8:	71472503          	lw	a0,1812(a4)
     dbc:	00f507b3          	add	a5,a0,a5
     dc0:	fed7f2e3          	bgeu	a5,a3,da4 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     dc4:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     dc8:	00008067          	ret

00000dcc <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     dcc:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     dd0:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     dd4:	00e51c63          	bne	a0,a4,dec <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     dd8:	fffe07b7          	lui	a5,0xfffe0
     ddc:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     de0:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     de4:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     de8:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     dec:	fff60737          	lui	a4,0xfff60
    return 0;
     df0:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     df4:	fee79ae3          	bne	a5,a4,de8 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     df8:	fffe07b7          	lui	a5,0xfffe0
     dfc:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     e00:	020007b7          	lui	a5,0x2000
     e04:	fe1ff06f          	j	de4 <neorv32_uart_available+0x18>

00000e08 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     e08:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     e0c:	00a79713          	sll	a4,a5,0xa
     e10:	fe075ce3          	bgez	a4,e08 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     e14:	00b52223          	sw	a1,4(a0)
}
     e18:	00008067          	ret

00000e1c <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     e1c:	00052783          	lw	a5,0(a0)
     e20:	00f79713          	sll	a4,a5,0xf
     e24:	fe075ce3          	bgez	a4,e1c <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     e28:	00452503          	lw	a0,4(a0)
}
     e2c:	0ff57513          	zext.b	a0,a0
     e30:	00008067          	ret

00000e34 <printf>:
     e34:	fc010113          	add	sp,sp,-64
     e38:	02c12423          	sw	a2,40(sp)
     e3c:	02d12623          	sw	a3,44(sp)
     e40:	80000317          	auipc	t1,0x80000
     e44:	8c832303          	lw	t1,-1848(t1) # 80000708 <_impure_ptr>
     e48:	02b12223          	sw	a1,36(sp)
     e4c:	02e12823          	sw	a4,48(sp)
     e50:	02f12a23          	sw	a5,52(sp)
     e54:	03012c23          	sw	a6,56(sp)
     e58:	03112e23          	sw	a7,60(sp)
     e5c:	00832583          	lw	a1,8(t1)
     e60:	02410693          	add	a3,sp,36
     e64:	00050613          	mv	a2,a0
     e68:	00030513          	mv	a0,t1
     e6c:	00112e23          	sw	ra,28(sp)
     e70:	00d12623          	sw	a3,12(sp)
     e74:	0c8010ef          	jal	1f3c <_vfprintf_r>
     e78:	01c12083          	lw	ra,28(sp)
     e7c:	04010113          	add	sp,sp,64
     e80:	00008067          	ret

00000e84 <putchar>:
     e84:	80000797          	auipc	a5,0x80000
     e88:	8847a783          	lw	a5,-1916(a5) # 80000708 <_impure_ptr>
     e8c:	0087a603          	lw	a2,8(a5)
     e90:	00050593          	mv	a1,a0
     e94:	00078513          	mv	a0,a5
     e98:	3c00606f          	j	7258 <_putc_r>

00000e9c <_puts_r>:
     e9c:	fd010113          	add	sp,sp,-48
     ea0:	02812423          	sw	s0,40(sp)
     ea4:	00050413          	mv	s0,a0
     ea8:	00058513          	mv	a0,a1
     eac:	02912223          	sw	s1,36(sp)
     eb0:	02112623          	sw	ra,44(sp)
     eb4:	00058493          	mv	s1,a1
     eb8:	3b0000ef          	jal	1268 <strlen>
     ebc:	00150713          	add	a4,a0,1
     ec0:	0000e697          	auipc	a3,0xe
     ec4:	20068693          	add	a3,a3,512 # f0c0 <__fini_array_end+0x134>
     ec8:	00e12623          	sw	a4,12(sp)
     ecc:	03442783          	lw	a5,52(s0)
     ed0:	01010713          	add	a4,sp,16
     ed4:	00d12c23          	sw	a3,24(sp)
     ed8:	00e12223          	sw	a4,4(sp)
     edc:	00100693          	li	a3,1
     ee0:	00200713          	li	a4,2
     ee4:	00912823          	sw	s1,16(sp)
     ee8:	00a12a23          	sw	a0,20(sp)
     eec:	00d12e23          	sw	a3,28(sp)
     ef0:	00e12423          	sw	a4,8(sp)
     ef4:	00842483          	lw	s1,8(s0)
     ef8:	0c078263          	beqz	a5,fbc <_puts_r+0x120>
     efc:	0644a703          	lw	a4,100(s1)
     f00:	00c49783          	lh	a5,12(s1)
     f04:	00177713          	and	a4,a4,1
     f08:	00071663          	bnez	a4,f14 <_puts_r+0x78>
     f0c:	2007f713          	and	a4,a5,512
     f10:	08070e63          	beqz	a4,fac <_puts_r+0x110>
     f14:	01279713          	sll	a4,a5,0x12
     f18:	02074263          	bltz	a4,f3c <_puts_r+0xa0>
     f1c:	0644a703          	lw	a4,100(s1)
     f20:	ffffe6b7          	lui	a3,0xffffe
     f24:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     f28:	00002637          	lui	a2,0x2
     f2c:	00c7e7b3          	or	a5,a5,a2
     f30:	00d77733          	and	a4,a4,a3
     f34:	00f49623          	sh	a5,12(s1)
     f38:	06e4a223          	sw	a4,100(s1)
     f3c:	00040513          	mv	a0,s0
     f40:	00410613          	add	a2,sp,4
     f44:	00048593          	mv	a1,s1
     f48:	549050ef          	jal	6c90 <__sfvwrite_r>
     f4c:	0644a783          	lw	a5,100(s1)
     f50:	00153413          	seqz	s0,a0
     f54:	40800433          	neg	s0,s0
     f58:	00b47413          	and	s0,s0,11
     f5c:	0017f793          	and	a5,a5,1
     f60:	fff40413          	add	s0,s0,-1
     f64:	00079863          	bnez	a5,f74 <_puts_r+0xd8>
     f68:	00c4d783          	lhu	a5,12(s1)
     f6c:	2007f793          	and	a5,a5,512
     f70:	00078e63          	beqz	a5,f8c <_puts_r+0xf0>
     f74:	02c12083          	lw	ra,44(sp)
     f78:	00040513          	mv	a0,s0
     f7c:	02812403          	lw	s0,40(sp)
     f80:	02412483          	lw	s1,36(sp)
     f84:	03010113          	add	sp,sp,48
     f88:	00008067          	ret
     f8c:	0584a503          	lw	a0,88(s1)
     f90:	054000ef          	jal	fe4 <__retarget_lock_release_recursive>
     f94:	02c12083          	lw	ra,44(sp)
     f98:	00040513          	mv	a0,s0
     f9c:	02812403          	lw	s0,40(sp)
     fa0:	02412483          	lw	s1,36(sp)
     fa4:	03010113          	add	sp,sp,48
     fa8:	00008067          	ret
     fac:	0584a503          	lw	a0,88(s1)
     fb0:	030000ef          	jal	fe0 <__retarget_lock_acquire_recursive>
     fb4:	00c49783          	lh	a5,12(s1)
     fb8:	f5dff06f          	j	f14 <_puts_r+0x78>
     fbc:	00040513          	mv	a0,s0
     fc0:	449050ef          	jal	6c08 <__sinit>
     fc4:	f39ff06f          	j	efc <_puts_r+0x60>

00000fc8 <puts>:
     fc8:	00050593          	mv	a1,a0
     fcc:	7ffff517          	auipc	a0,0x7ffff
     fd0:	73c52503          	lw	a0,1852(a0) # 80000708 <_impure_ptr>
     fd4:	ec9ff06f          	j	e9c <_puts_r>

00000fd8 <__retarget_lock_init_recursive>:
     fd8:	00008067          	ret

00000fdc <__retarget_lock_close_recursive>:
     fdc:	00008067          	ret

00000fe0 <__retarget_lock_acquire_recursive>:
     fe0:	00008067          	ret

00000fe4 <__retarget_lock_release_recursive>:
     fe4:	00008067          	ret

00000fe8 <memset>:
     fe8:	00f00313          	li	t1,15
     fec:	00050713          	mv	a4,a0
     ff0:	02c37e63          	bgeu	t1,a2,102c <memset+0x44>
     ff4:	00f77793          	and	a5,a4,15
     ff8:	0a079063          	bnez	a5,1098 <memset+0xb0>
     ffc:	08059263          	bnez	a1,1080 <memset+0x98>
    1000:	ff067693          	and	a3,a2,-16
    1004:	00f67613          	and	a2,a2,15
    1008:	00e686b3          	add	a3,a3,a4
    100c:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    1010:	00b72223          	sw	a1,4(a4)
    1014:	00b72423          	sw	a1,8(a4)
    1018:	00b72623          	sw	a1,12(a4)
    101c:	01070713          	add	a4,a4,16
    1020:	fed766e3          	bltu	a4,a3,100c <memset+0x24>
    1024:	00061463          	bnez	a2,102c <memset+0x44>
    1028:	00008067          	ret
    102c:	40c306b3          	sub	a3,t1,a2
    1030:	00269693          	sll	a3,a3,0x2
    1034:	00000297          	auipc	t0,0x0
    1038:	005686b3          	add	a3,a3,t0
    103c:	00c68067          	jr	12(a3)
    1040:	00b70723          	sb	a1,14(a4)
    1044:	00b706a3          	sb	a1,13(a4)
    1048:	00b70623          	sb	a1,12(a4)
    104c:	00b705a3          	sb	a1,11(a4)
    1050:	00b70523          	sb	a1,10(a4)
    1054:	00b704a3          	sb	a1,9(a4)
    1058:	00b70423          	sb	a1,8(a4)
    105c:	00b703a3          	sb	a1,7(a4)
    1060:	00b70323          	sb	a1,6(a4)
    1064:	00b702a3          	sb	a1,5(a4)
    1068:	00b70223          	sb	a1,4(a4)
    106c:	00b701a3          	sb	a1,3(a4)
    1070:	00b70123          	sb	a1,2(a4)
    1074:	00b700a3          	sb	a1,1(a4)
    1078:	00b70023          	sb	a1,0(a4)
    107c:	00008067          	ret
    1080:	0ff5f593          	zext.b	a1,a1
    1084:	00859693          	sll	a3,a1,0x8
    1088:	00d5e5b3          	or	a1,a1,a3
    108c:	01059693          	sll	a3,a1,0x10
    1090:	00d5e5b3          	or	a1,a1,a3
    1094:	f6dff06f          	j	1000 <memset+0x18>
    1098:	00279693          	sll	a3,a5,0x2
    109c:	00000297          	auipc	t0,0x0
    10a0:	005686b3          	add	a3,a3,t0
    10a4:	00008293          	mv	t0,ra
    10a8:	fa0680e7          	jalr	-96(a3)
    10ac:	00028093          	mv	ra,t0
    10b0:	ff078793          	add	a5,a5,-16
    10b4:	40f70733          	sub	a4,a4,a5
    10b8:	00f60633          	add	a2,a2,a5
    10bc:	f6c378e3          	bgeu	t1,a2,102c <memset+0x44>
    10c0:	f3dff06f          	j	ffc <memset+0x14>

000010c4 <memcpy>:
    10c4:	00a5c7b3          	xor	a5,a1,a0
    10c8:	0037f793          	and	a5,a5,3
    10cc:	00c508b3          	add	a7,a0,a2
    10d0:	06079463          	bnez	a5,1138 <memcpy+0x74>
    10d4:	00300793          	li	a5,3
    10d8:	06c7f063          	bgeu	a5,a2,1138 <memcpy+0x74>
    10dc:	00357793          	and	a5,a0,3
    10e0:	00050713          	mv	a4,a0
    10e4:	06079a63          	bnez	a5,1158 <memcpy+0x94>
    10e8:	ffc8f613          	and	a2,a7,-4
    10ec:	40e606b3          	sub	a3,a2,a4
    10f0:	02000793          	li	a5,32
    10f4:	08d7ce63          	blt	a5,a3,1190 <memcpy+0xcc>
    10f8:	00058693          	mv	a3,a1
    10fc:	00070793          	mv	a5,a4
    1100:	02c77863          	bgeu	a4,a2,1130 <memcpy+0x6c>
    1104:	0006a803          	lw	a6,0(a3)
    1108:	00478793          	add	a5,a5,4
    110c:	00468693          	add	a3,a3,4
    1110:	ff07ae23          	sw	a6,-4(a5)
    1114:	fec7e8e3          	bltu	a5,a2,1104 <memcpy+0x40>
    1118:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0xc3>
    111c:	40e787b3          	sub	a5,a5,a4
    1120:	ffc7f793          	and	a5,a5,-4
    1124:	00478793          	add	a5,a5,4
    1128:	00f70733          	add	a4,a4,a5
    112c:	00f585b3          	add	a1,a1,a5
    1130:	01176863          	bltu	a4,a7,1140 <memcpy+0x7c>
    1134:	00008067          	ret
    1138:	00050713          	mv	a4,a0
    113c:	05157863          	bgeu	a0,a7,118c <memcpy+0xc8>
    1140:	0005c783          	lbu	a5,0(a1)
    1144:	00170713          	add	a4,a4,1
    1148:	00158593          	add	a1,a1,1
    114c:	fef70fa3          	sb	a5,-1(a4)
    1150:	fee898e3          	bne	a7,a4,1140 <memcpy+0x7c>
    1154:	00008067          	ret
    1158:	0005c683          	lbu	a3,0(a1)
    115c:	00170713          	add	a4,a4,1
    1160:	00377793          	and	a5,a4,3
    1164:	fed70fa3          	sb	a3,-1(a4)
    1168:	00158593          	add	a1,a1,1
    116c:	f6078ee3          	beqz	a5,10e8 <memcpy+0x24>
    1170:	0005c683          	lbu	a3,0(a1)
    1174:	00170713          	add	a4,a4,1
    1178:	00377793          	and	a5,a4,3
    117c:	fed70fa3          	sb	a3,-1(a4)
    1180:	00158593          	add	a1,a1,1
    1184:	fc079ae3          	bnez	a5,1158 <memcpy+0x94>
    1188:	f61ff06f          	j	10e8 <memcpy+0x24>
    118c:	00008067          	ret
    1190:	ff010113          	add	sp,sp,-16
    1194:	00812623          	sw	s0,12(sp)
    1198:	02000413          	li	s0,32
    119c:	0005a383          	lw	t2,0(a1)
    11a0:	0045a283          	lw	t0,4(a1)
    11a4:	0085af83          	lw	t6,8(a1)
    11a8:	00c5af03          	lw	t5,12(a1)
    11ac:	0105ae83          	lw	t4,16(a1)
    11b0:	0145ae03          	lw	t3,20(a1)
    11b4:	0185a303          	lw	t1,24(a1)
    11b8:	01c5a803          	lw	a6,28(a1)
    11bc:	0205a683          	lw	a3,32(a1)
    11c0:	02470713          	add	a4,a4,36
    11c4:	40e607b3          	sub	a5,a2,a4
    11c8:	fc772e23          	sw	t2,-36(a4)
    11cc:	fe572023          	sw	t0,-32(a4)
    11d0:	fff72223          	sw	t6,-28(a4)
    11d4:	ffe72423          	sw	t5,-24(a4)
    11d8:	ffd72623          	sw	t4,-20(a4)
    11dc:	ffc72823          	sw	t3,-16(a4)
    11e0:	fe672a23          	sw	t1,-12(a4)
    11e4:	ff072c23          	sw	a6,-8(a4)
    11e8:	fed72e23          	sw	a3,-4(a4)
    11ec:	02458593          	add	a1,a1,36
    11f0:	faf446e3          	blt	s0,a5,119c <memcpy+0xd8>
    11f4:	00058693          	mv	a3,a1
    11f8:	00070793          	mv	a5,a4
    11fc:	02c77863          	bgeu	a4,a2,122c <memcpy+0x168>
    1200:	0006a803          	lw	a6,0(a3)
    1204:	00478793          	add	a5,a5,4
    1208:	00468693          	add	a3,a3,4
    120c:	ff07ae23          	sw	a6,-4(a5)
    1210:	fec7e8e3          	bltu	a5,a2,1200 <memcpy+0x13c>
    1214:	fff60793          	add	a5,a2,-1
    1218:	40e787b3          	sub	a5,a5,a4
    121c:	ffc7f793          	and	a5,a5,-4
    1220:	00478793          	add	a5,a5,4
    1224:	00f70733          	add	a4,a4,a5
    1228:	00f585b3          	add	a1,a1,a5
    122c:	01176863          	bltu	a4,a7,123c <memcpy+0x178>
    1230:	00c12403          	lw	s0,12(sp)
    1234:	01010113          	add	sp,sp,16
    1238:	00008067          	ret
    123c:	0005c783          	lbu	a5,0(a1)
    1240:	00170713          	add	a4,a4,1
    1244:	00158593          	add	a1,a1,1
    1248:	fef70fa3          	sb	a5,-1(a4)
    124c:	fee882e3          	beq	a7,a4,1230 <memcpy+0x16c>
    1250:	0005c783          	lbu	a5,0(a1)
    1254:	00170713          	add	a4,a4,1
    1258:	00158593          	add	a1,a1,1
    125c:	fef70fa3          	sb	a5,-1(a4)
    1260:	fce89ee3          	bne	a7,a4,123c <memcpy+0x178>
    1264:	fcdff06f          	j	1230 <memcpy+0x16c>

00001268 <strlen>:
    1268:	00357793          	and	a5,a0,3
    126c:	00050713          	mv	a4,a0
    1270:	04079c63          	bnez	a5,12c8 <strlen+0x60>
    1274:	7f7f86b7          	lui	a3,0x7f7f8
    1278:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    127c:	fff00593          	li	a1,-1
    1280:	00072603          	lw	a2,0(a4)
    1284:	00470713          	add	a4,a4,4
    1288:	00d677b3          	and	a5,a2,a3
    128c:	00d787b3          	add	a5,a5,a3
    1290:	00c7e7b3          	or	a5,a5,a2
    1294:	00d7e7b3          	or	a5,a5,a3
    1298:	feb784e3          	beq	a5,a1,1280 <strlen+0x18>
    129c:	ffc74683          	lbu	a3,-4(a4)
    12a0:	40a707b3          	sub	a5,a4,a0
    12a4:	04068463          	beqz	a3,12ec <strlen+0x84>
    12a8:	ffd74683          	lbu	a3,-3(a4)
    12ac:	02068c63          	beqz	a3,12e4 <strlen+0x7c>
    12b0:	ffe74503          	lbu	a0,-2(a4)
    12b4:	00a03533          	snez	a0,a0
    12b8:	00f50533          	add	a0,a0,a5
    12bc:	ffe50513          	add	a0,a0,-2
    12c0:	00008067          	ret
    12c4:	fa0688e3          	beqz	a3,1274 <strlen+0xc>
    12c8:	00074783          	lbu	a5,0(a4)
    12cc:	00170713          	add	a4,a4,1
    12d0:	00377693          	and	a3,a4,3
    12d4:	fe0798e3          	bnez	a5,12c4 <strlen+0x5c>
    12d8:	40a70733          	sub	a4,a4,a0
    12dc:	fff70513          	add	a0,a4,-1
    12e0:	00008067          	ret
    12e4:	ffd78513          	add	a0,a5,-3
    12e8:	00008067          	ret
    12ec:	ffc78513          	add	a0,a5,-4
    12f0:	00008067          	ret

000012f4 <_malloc_trim_r>:
    12f4:	fe010113          	add	sp,sp,-32
    12f8:	00812c23          	sw	s0,24(sp)
    12fc:	00912a23          	sw	s1,20(sp)
    1300:	01212823          	sw	s2,16(sp)
    1304:	01312623          	sw	s3,12(sp)
    1308:	01412423          	sw	s4,8(sp)
    130c:	00058993          	mv	s3,a1
    1310:	00112e23          	sw	ra,28(sp)
    1314:	00050913          	mv	s2,a0
    1318:	7ffffa17          	auipc	s4,0x7ffff
    131c:	e08a0a13          	add	s4,s4,-504 # 80000120 <__malloc_av_>
    1320:	405000ef          	jal	1f24 <__malloc_lock>
    1324:	008a2703          	lw	a4,8(s4)
    1328:	000017b7          	lui	a5,0x1
    132c:	fef78793          	add	a5,a5,-17 # fef <memset+0x7>
    1330:	00472483          	lw	s1,4(a4)
    1334:	00001737          	lui	a4,0x1
    1338:	ffc4f493          	and	s1,s1,-4
    133c:	00f48433          	add	s0,s1,a5
    1340:	41340433          	sub	s0,s0,s3
    1344:	00c45413          	srl	s0,s0,0xc
    1348:	fff40413          	add	s0,s0,-1
    134c:	00c41413          	sll	s0,s0,0xc
    1350:	00e44e63          	blt	s0,a4,136c <_malloc_trim_r+0x78>
    1354:	00000593          	li	a1,0
    1358:	00090513          	mv	a0,s2
    135c:	105060ef          	jal	7c60 <_sbrk_r>
    1360:	008a2783          	lw	a5,8(s4)
    1364:	009787b3          	add	a5,a5,s1
    1368:	02f50863          	beq	a0,a5,1398 <_malloc_trim_r+0xa4>
    136c:	00090513          	mv	a0,s2
    1370:	3c1000ef          	jal	1f30 <__malloc_unlock>
    1374:	01c12083          	lw	ra,28(sp)
    1378:	01812403          	lw	s0,24(sp)
    137c:	01412483          	lw	s1,20(sp)
    1380:	01012903          	lw	s2,16(sp)
    1384:	00c12983          	lw	s3,12(sp)
    1388:	00812a03          	lw	s4,8(sp)
    138c:	00000513          	li	a0,0
    1390:	02010113          	add	sp,sp,32
    1394:	00008067          	ret
    1398:	408005b3          	neg	a1,s0
    139c:	00090513          	mv	a0,s2
    13a0:	0c1060ef          	jal	7c60 <_sbrk_r>
    13a4:	fff00793          	li	a5,-1
    13a8:	04f50a63          	beq	a0,a5,13fc <_malloc_trim_r+0x108>
    13ac:	7ffff717          	auipc	a4,0x7ffff
    13b0:	48870713          	add	a4,a4,1160 # 80000834 <__malloc_current_mallinfo>
    13b4:	00072783          	lw	a5,0(a4)
    13b8:	008a2683          	lw	a3,8(s4)
    13bc:	408484b3          	sub	s1,s1,s0
    13c0:	0014e493          	or	s1,s1,1
    13c4:	408787b3          	sub	a5,a5,s0
    13c8:	00090513          	mv	a0,s2
    13cc:	0096a223          	sw	s1,4(a3)
    13d0:	00f72023          	sw	a5,0(a4)
    13d4:	35d000ef          	jal	1f30 <__malloc_unlock>
    13d8:	01c12083          	lw	ra,28(sp)
    13dc:	01812403          	lw	s0,24(sp)
    13e0:	01412483          	lw	s1,20(sp)
    13e4:	01012903          	lw	s2,16(sp)
    13e8:	00c12983          	lw	s3,12(sp)
    13ec:	00812a03          	lw	s4,8(sp)
    13f0:	00100513          	li	a0,1
    13f4:	02010113          	add	sp,sp,32
    13f8:	00008067          	ret
    13fc:	00000593          	li	a1,0
    1400:	00090513          	mv	a0,s2
    1404:	05d060ef          	jal	7c60 <_sbrk_r>
    1408:	008a2703          	lw	a4,8(s4)
    140c:	00f00693          	li	a3,15
    1410:	40e507b3          	sub	a5,a0,a4
    1414:	f4f6dce3          	bge	a3,a5,136c <_malloc_trim_r+0x78>
    1418:	7ffff697          	auipc	a3,0x7ffff
    141c:	2f46a683          	lw	a3,756(a3) # 8000070c <__malloc_sbrk_base>
    1420:	40d50533          	sub	a0,a0,a3
    1424:	0017e793          	or	a5,a5,1
    1428:	7ffff697          	auipc	a3,0x7ffff
    142c:	40a6a623          	sw	a0,1036(a3) # 80000834 <__malloc_current_mallinfo>
    1430:	00f72223          	sw	a5,4(a4)
    1434:	f39ff06f          	j	136c <_malloc_trim_r+0x78>

00001438 <_free_r>:
    1438:	18058263          	beqz	a1,15bc <_free_r+0x184>
    143c:	ff010113          	add	sp,sp,-16
    1440:	00812423          	sw	s0,8(sp)
    1444:	00912223          	sw	s1,4(sp)
    1448:	00058413          	mv	s0,a1
    144c:	00050493          	mv	s1,a0
    1450:	00112623          	sw	ra,12(sp)
    1454:	2d1000ef          	jal	1f24 <__malloc_lock>
    1458:	ffc42583          	lw	a1,-4(s0)
    145c:	ff840713          	add	a4,s0,-8
    1460:	7ffff517          	auipc	a0,0x7ffff
    1464:	cc050513          	add	a0,a0,-832 # 80000120 <__malloc_av_>
    1468:	ffe5f793          	and	a5,a1,-2
    146c:	00f70633          	add	a2,a4,a5
    1470:	00462683          	lw	a3,4(a2)
    1474:	00852803          	lw	a6,8(a0)
    1478:	ffc6f693          	and	a3,a3,-4
    147c:	1ac80263          	beq	a6,a2,1620 <_free_r+0x1e8>
    1480:	00d62223          	sw	a3,4(a2)
    1484:	0015f593          	and	a1,a1,1
    1488:	00d60833          	add	a6,a2,a3
    148c:	0a059063          	bnez	a1,152c <_free_r+0xf4>
    1490:	ff842303          	lw	t1,-8(s0)
    1494:	00482583          	lw	a1,4(a6)
    1498:	7ffff897          	auipc	a7,0x7ffff
    149c:	c9088893          	add	a7,a7,-880 # 80000128 <__malloc_av_+0x8>
    14a0:	40670733          	sub	a4,a4,t1
    14a4:	00872803          	lw	a6,8(a4)
    14a8:	006787b3          	add	a5,a5,t1
    14ac:	0015f593          	and	a1,a1,1
    14b0:	15180263          	beq	a6,a7,15f4 <_free_r+0x1bc>
    14b4:	00c72303          	lw	t1,12(a4)
    14b8:	00682623          	sw	t1,12(a6)
    14bc:	01032423          	sw	a6,8(t1)
    14c0:	1a058a63          	beqz	a1,1674 <_free_r+0x23c>
    14c4:	0017e693          	or	a3,a5,1
    14c8:	00d72223          	sw	a3,4(a4)
    14cc:	00f62023          	sw	a5,0(a2)
    14d0:	1ff00693          	li	a3,511
    14d4:	06f6ec63          	bltu	a3,a5,154c <_free_r+0x114>
    14d8:	ff87f693          	and	a3,a5,-8
    14dc:	00868693          	add	a3,a3,8
    14e0:	00452583          	lw	a1,4(a0)
    14e4:	00d506b3          	add	a3,a0,a3
    14e8:	0006a603          	lw	a2,0(a3)
    14ec:	0057d813          	srl	a6,a5,0x5
    14f0:	00100793          	li	a5,1
    14f4:	010797b3          	sll	a5,a5,a6
    14f8:	00b7e7b3          	or	a5,a5,a1
    14fc:	ff868593          	add	a1,a3,-8
    1500:	00b72623          	sw	a1,12(a4)
    1504:	00c72423          	sw	a2,8(a4)
    1508:	00f52223          	sw	a5,4(a0)
    150c:	00e6a023          	sw	a4,0(a3)
    1510:	00e62623          	sw	a4,12(a2)
    1514:	00812403          	lw	s0,8(sp)
    1518:	00c12083          	lw	ra,12(sp)
    151c:	00048513          	mv	a0,s1
    1520:	00412483          	lw	s1,4(sp)
    1524:	01010113          	add	sp,sp,16
    1528:	2090006f          	j	1f30 <__malloc_unlock>
    152c:	00482583          	lw	a1,4(a6)
    1530:	0015f593          	and	a1,a1,1
    1534:	08058663          	beqz	a1,15c0 <_free_r+0x188>
    1538:	0017e693          	or	a3,a5,1
    153c:	fed42e23          	sw	a3,-4(s0)
    1540:	00f62023          	sw	a5,0(a2)
    1544:	1ff00693          	li	a3,511
    1548:	f8f6f8e3          	bgeu	a3,a5,14d8 <_free_r+0xa0>
    154c:	0097d693          	srl	a3,a5,0x9
    1550:	00400613          	li	a2,4
    1554:	12d66463          	bltu	a2,a3,167c <_free_r+0x244>
    1558:	0067d693          	srl	a3,a5,0x6
    155c:	03968593          	add	a1,a3,57
    1560:	03868613          	add	a2,a3,56
    1564:	00359593          	sll	a1,a1,0x3
    1568:	00b505b3          	add	a1,a0,a1
    156c:	0005a683          	lw	a3,0(a1)
    1570:	ff858593          	add	a1,a1,-8
    1574:	00d59863          	bne	a1,a3,1584 <_free_r+0x14c>
    1578:	15c0006f          	j	16d4 <_free_r+0x29c>
    157c:	0086a683          	lw	a3,8(a3)
    1580:	00d58863          	beq	a1,a3,1590 <_free_r+0x158>
    1584:	0046a603          	lw	a2,4(a3)
    1588:	ffc67613          	and	a2,a2,-4
    158c:	fec7e8e3          	bltu	a5,a2,157c <_free_r+0x144>
    1590:	00c6a583          	lw	a1,12(a3)
    1594:	00b72623          	sw	a1,12(a4)
    1598:	00d72423          	sw	a3,8(a4)
    159c:	00812403          	lw	s0,8(sp)
    15a0:	00c12083          	lw	ra,12(sp)
    15a4:	00e5a423          	sw	a4,8(a1)
    15a8:	00048513          	mv	a0,s1
    15ac:	00412483          	lw	s1,4(sp)
    15b0:	00e6a623          	sw	a4,12(a3)
    15b4:	01010113          	add	sp,sp,16
    15b8:	1790006f          	j	1f30 <__malloc_unlock>
    15bc:	00008067          	ret
    15c0:	00d787b3          	add	a5,a5,a3
    15c4:	7ffff897          	auipc	a7,0x7ffff
    15c8:	b6488893          	add	a7,a7,-1180 # 80000128 <__malloc_av_+0x8>
    15cc:	00862683          	lw	a3,8(a2)
    15d0:	0f168063          	beq	a3,a7,16b0 <_free_r+0x278>
    15d4:	00c62803          	lw	a6,12(a2)
    15d8:	0017e593          	or	a1,a5,1
    15dc:	00f70633          	add	a2,a4,a5
    15e0:	0106a623          	sw	a6,12(a3)
    15e4:	00d82423          	sw	a3,8(a6)
    15e8:	00b72223          	sw	a1,4(a4)
    15ec:	00f62023          	sw	a5,0(a2)
    15f0:	ee1ff06f          	j	14d0 <_free_r+0x98>
    15f4:	14059063          	bnez	a1,1734 <_free_r+0x2fc>
    15f8:	00862583          	lw	a1,8(a2)
    15fc:	00c62603          	lw	a2,12(a2)
    1600:	00f686b3          	add	a3,a3,a5
    1604:	0016e793          	or	a5,a3,1
    1608:	00c5a623          	sw	a2,12(a1)
    160c:	00b62423          	sw	a1,8(a2)
    1610:	00f72223          	sw	a5,4(a4)
    1614:	00d70733          	add	a4,a4,a3
    1618:	00d72023          	sw	a3,0(a4)
    161c:	ef9ff06f          	j	1514 <_free_r+0xdc>
    1620:	0015f593          	and	a1,a1,1
    1624:	00d786b3          	add	a3,a5,a3
    1628:	02059063          	bnez	a1,1648 <_free_r+0x210>
    162c:	ff842583          	lw	a1,-8(s0)
    1630:	40b70733          	sub	a4,a4,a1
    1634:	00c72783          	lw	a5,12(a4)
    1638:	00872603          	lw	a2,8(a4)
    163c:	00b686b3          	add	a3,a3,a1
    1640:	00f62623          	sw	a5,12(a2)
    1644:	00c7a423          	sw	a2,8(a5)
    1648:	0016e793          	or	a5,a3,1
    164c:	00f72223          	sw	a5,4(a4)
    1650:	00e52423          	sw	a4,8(a0)
    1654:	7ffff797          	auipc	a5,0x7ffff
    1658:	0bc7a783          	lw	a5,188(a5) # 80000710 <__malloc_trim_threshold>
    165c:	eaf6ece3          	bltu	a3,a5,1514 <_free_r+0xdc>
    1660:	7ffff597          	auipc	a1,0x7ffff
    1664:	0cc5a583          	lw	a1,204(a1) # 8000072c <__malloc_top_pad>
    1668:	00048513          	mv	a0,s1
    166c:	c89ff0ef          	jal	12f4 <_malloc_trim_r>
    1670:	ea5ff06f          	j	1514 <_free_r+0xdc>
    1674:	00d787b3          	add	a5,a5,a3
    1678:	f55ff06f          	j	15cc <_free_r+0x194>
    167c:	01400613          	li	a2,20
    1680:	02d67063          	bgeu	a2,a3,16a0 <_free_r+0x268>
    1684:	05400613          	li	a2,84
    1688:	06d66463          	bltu	a2,a3,16f0 <_free_r+0x2b8>
    168c:	00c7d693          	srl	a3,a5,0xc
    1690:	06f68593          	add	a1,a3,111
    1694:	06e68613          	add	a2,a3,110
    1698:	00359593          	sll	a1,a1,0x3
    169c:	ecdff06f          	j	1568 <_free_r+0x130>
    16a0:	05c68593          	add	a1,a3,92
    16a4:	05b68613          	add	a2,a3,91
    16a8:	00359593          	sll	a1,a1,0x3
    16ac:	ebdff06f          	j	1568 <_free_r+0x130>
    16b0:	00e52a23          	sw	a4,20(a0)
    16b4:	00e52823          	sw	a4,16(a0)
    16b8:	0017e693          	or	a3,a5,1
    16bc:	01172623          	sw	a7,12(a4)
    16c0:	01172423          	sw	a7,8(a4)
    16c4:	00d72223          	sw	a3,4(a4)
    16c8:	00f70733          	add	a4,a4,a5
    16cc:	00f72023          	sw	a5,0(a4)
    16d0:	e45ff06f          	j	1514 <_free_r+0xdc>
    16d4:	00452803          	lw	a6,4(a0)
    16d8:	40265613          	sra	a2,a2,0x2
    16dc:	00100793          	li	a5,1
    16e0:	00c797b3          	sll	a5,a5,a2
    16e4:	0107e7b3          	or	a5,a5,a6
    16e8:	00f52223          	sw	a5,4(a0)
    16ec:	ea9ff06f          	j	1594 <_free_r+0x15c>
    16f0:	15400613          	li	a2,340
    16f4:	00d66c63          	bltu	a2,a3,170c <_free_r+0x2d4>
    16f8:	00f7d693          	srl	a3,a5,0xf
    16fc:	07868593          	add	a1,a3,120
    1700:	07768613          	add	a2,a3,119
    1704:	00359593          	sll	a1,a1,0x3
    1708:	e61ff06f          	j	1568 <_free_r+0x130>
    170c:	55400613          	li	a2,1364
    1710:	00d66c63          	bltu	a2,a3,1728 <_free_r+0x2f0>
    1714:	0127d693          	srl	a3,a5,0x12
    1718:	07d68593          	add	a1,a3,125
    171c:	07c68613          	add	a2,a3,124
    1720:	00359593          	sll	a1,a1,0x3
    1724:	e45ff06f          	j	1568 <_free_r+0x130>
    1728:	3f800593          	li	a1,1016
    172c:	07e00613          	li	a2,126
    1730:	e39ff06f          	j	1568 <_free_r+0x130>
    1734:	0017e693          	or	a3,a5,1
    1738:	00d72223          	sw	a3,4(a4)
    173c:	00f62023          	sw	a5,0(a2)
    1740:	dd5ff06f          	j	1514 <_free_r+0xdc>

00001744 <_malloc_r>:
    1744:	fd010113          	add	sp,sp,-48
    1748:	03212023          	sw	s2,32(sp)
    174c:	02112623          	sw	ra,44(sp)
    1750:	02812423          	sw	s0,40(sp)
    1754:	02912223          	sw	s1,36(sp)
    1758:	01312e23          	sw	s3,28(sp)
    175c:	00b58793          	add	a5,a1,11
    1760:	01600713          	li	a4,22
    1764:	00050913          	mv	s2,a0
    1768:	08f76263          	bltu	a4,a5,17ec <_malloc_r+0xa8>
    176c:	01000793          	li	a5,16
    1770:	20b7e663          	bltu	a5,a1,197c <_malloc_r+0x238>
    1774:	7b0000ef          	jal	1f24 <__malloc_lock>
    1778:	01800793          	li	a5,24
    177c:	00200593          	li	a1,2
    1780:	01000493          	li	s1,16
    1784:	7ffff997          	auipc	s3,0x7ffff
    1788:	99c98993          	add	s3,s3,-1636 # 80000120 <__malloc_av_>
    178c:	00f987b3          	add	a5,s3,a5
    1790:	0047a403          	lw	s0,4(a5)
    1794:	ff878713          	add	a4,a5,-8
    1798:	36e40463          	beq	s0,a4,1b00 <_malloc_r+0x3bc>
    179c:	00442783          	lw	a5,4(s0)
    17a0:	00c42683          	lw	a3,12(s0)
    17a4:	00842603          	lw	a2,8(s0)
    17a8:	ffc7f793          	and	a5,a5,-4
    17ac:	00f407b3          	add	a5,s0,a5
    17b0:	0047a703          	lw	a4,4(a5)
    17b4:	00d62623          	sw	a3,12(a2)
    17b8:	00c6a423          	sw	a2,8(a3)
    17bc:	00176713          	or	a4,a4,1
    17c0:	00090513          	mv	a0,s2
    17c4:	00e7a223          	sw	a4,4(a5)
    17c8:	768000ef          	jal	1f30 <__malloc_unlock>
    17cc:	00840513          	add	a0,s0,8
    17d0:	02c12083          	lw	ra,44(sp)
    17d4:	02812403          	lw	s0,40(sp)
    17d8:	02412483          	lw	s1,36(sp)
    17dc:	02012903          	lw	s2,32(sp)
    17e0:	01c12983          	lw	s3,28(sp)
    17e4:	03010113          	add	sp,sp,48
    17e8:	00008067          	ret
    17ec:	ff87f493          	and	s1,a5,-8
    17f0:	1807c663          	bltz	a5,197c <_malloc_r+0x238>
    17f4:	18b4e463          	bltu	s1,a1,197c <_malloc_r+0x238>
    17f8:	72c000ef          	jal	1f24 <__malloc_lock>
    17fc:	1f700793          	li	a5,503
    1800:	4097fa63          	bgeu	a5,s1,1c14 <_malloc_r+0x4d0>
    1804:	0094d793          	srl	a5,s1,0x9
    1808:	18078263          	beqz	a5,198c <_malloc_r+0x248>
    180c:	00400713          	li	a4,4
    1810:	36f76063          	bltu	a4,a5,1b70 <_malloc_r+0x42c>
    1814:	0064d793          	srl	a5,s1,0x6
    1818:	03978593          	add	a1,a5,57
    181c:	03878813          	add	a6,a5,56
    1820:	00359613          	sll	a2,a1,0x3
    1824:	7ffff997          	auipc	s3,0x7ffff
    1828:	8fc98993          	add	s3,s3,-1796 # 80000120 <__malloc_av_>
    182c:	00c98633          	add	a2,s3,a2
    1830:	00462403          	lw	s0,4(a2)
    1834:	ff860613          	add	a2,a2,-8
    1838:	02860863          	beq	a2,s0,1868 <_malloc_r+0x124>
    183c:	00f00513          	li	a0,15
    1840:	0140006f          	j	1854 <_malloc_r+0x110>
    1844:	00c42683          	lw	a3,12(s0)
    1848:	2a075863          	bgez	a4,1af8 <_malloc_r+0x3b4>
    184c:	00d60e63          	beq	a2,a3,1868 <_malloc_r+0x124>
    1850:	00068413          	mv	s0,a3
    1854:	00442783          	lw	a5,4(s0)
    1858:	ffc7f793          	and	a5,a5,-4
    185c:	40978733          	sub	a4,a5,s1
    1860:	fee552e3          	bge	a0,a4,1844 <_malloc_r+0x100>
    1864:	00080593          	mv	a1,a6
    1868:	0109a403          	lw	s0,16(s3)
    186c:	7ffff897          	auipc	a7,0x7ffff
    1870:	8bc88893          	add	a7,a7,-1860 # 80000128 <__malloc_av_+0x8>
    1874:	27140e63          	beq	s0,a7,1af0 <_malloc_r+0x3ac>
    1878:	00442783          	lw	a5,4(s0)
    187c:	00f00693          	li	a3,15
    1880:	ffc7f793          	and	a5,a5,-4
    1884:	40978733          	sub	a4,a5,s1
    1888:	38e6cc63          	blt	a3,a4,1c20 <_malloc_r+0x4dc>
    188c:	0119aa23          	sw	a7,20(s3)
    1890:	0119a823          	sw	a7,16(s3)
    1894:	36075063          	bgez	a4,1bf4 <_malloc_r+0x4b0>
    1898:	1ff00713          	li	a4,511
    189c:	0049a503          	lw	a0,4(s3)
    18a0:	26f76863          	bltu	a4,a5,1b10 <_malloc_r+0x3cc>
    18a4:	ff87f713          	and	a4,a5,-8
    18a8:	00870713          	add	a4,a4,8
    18ac:	00e98733          	add	a4,s3,a4
    18b0:	00072683          	lw	a3,0(a4)
    18b4:	0057d613          	srl	a2,a5,0x5
    18b8:	00100793          	li	a5,1
    18bc:	00c797b3          	sll	a5,a5,a2
    18c0:	00f56533          	or	a0,a0,a5
    18c4:	ff870793          	add	a5,a4,-8
    18c8:	00f42623          	sw	a5,12(s0)
    18cc:	00d42423          	sw	a3,8(s0)
    18d0:	00a9a223          	sw	a0,4(s3)
    18d4:	00872023          	sw	s0,0(a4)
    18d8:	0086a623          	sw	s0,12(a3)
    18dc:	4025d793          	sra	a5,a1,0x2
    18e0:	00100613          	li	a2,1
    18e4:	00f61633          	sll	a2,a2,a5
    18e8:	0ac56a63          	bltu	a0,a2,199c <_malloc_r+0x258>
    18ec:	00a677b3          	and	a5,a2,a0
    18f0:	02079463          	bnez	a5,1918 <_malloc_r+0x1d4>
    18f4:	00161613          	sll	a2,a2,0x1
    18f8:	ffc5f593          	and	a1,a1,-4
    18fc:	00a677b3          	and	a5,a2,a0
    1900:	00458593          	add	a1,a1,4
    1904:	00079a63          	bnez	a5,1918 <_malloc_r+0x1d4>
    1908:	00161613          	sll	a2,a2,0x1
    190c:	00a677b3          	and	a5,a2,a0
    1910:	00458593          	add	a1,a1,4
    1914:	fe078ae3          	beqz	a5,1908 <_malloc_r+0x1c4>
    1918:	00f00813          	li	a6,15
    191c:	00359313          	sll	t1,a1,0x3
    1920:	00698333          	add	t1,s3,t1
    1924:	00030513          	mv	a0,t1
    1928:	00c52783          	lw	a5,12(a0)
    192c:	00058e13          	mv	t3,a1
    1930:	26f50263          	beq	a0,a5,1b94 <_malloc_r+0x450>
    1934:	0047a703          	lw	a4,4(a5)
    1938:	00078413          	mv	s0,a5
    193c:	00c7a783          	lw	a5,12(a5)
    1940:	ffc77713          	and	a4,a4,-4
    1944:	409706b3          	sub	a3,a4,s1
    1948:	26d84263          	blt	a6,a3,1bac <_malloc_r+0x468>
    194c:	fe06c2e3          	bltz	a3,1930 <_malloc_r+0x1ec>
    1950:	00e40733          	add	a4,s0,a4
    1954:	00472683          	lw	a3,4(a4)
    1958:	00842603          	lw	a2,8(s0)
    195c:	00090513          	mv	a0,s2
    1960:	0016e693          	or	a3,a3,1
    1964:	00d72223          	sw	a3,4(a4)
    1968:	00f62623          	sw	a5,12(a2)
    196c:	00c7a423          	sw	a2,8(a5)
    1970:	5c0000ef          	jal	1f30 <__malloc_unlock>
    1974:	00840513          	add	a0,s0,8
    1978:	e59ff06f          	j	17d0 <_malloc_r+0x8c>
    197c:	00c00793          	li	a5,12
    1980:	00f92023          	sw	a5,0(s2)
    1984:	00000513          	li	a0,0
    1988:	e49ff06f          	j	17d0 <_malloc_r+0x8c>
    198c:	20000613          	li	a2,512
    1990:	04000593          	li	a1,64
    1994:	03f00813          	li	a6,63
    1998:	e8dff06f          	j	1824 <_malloc_r+0xe0>
    199c:	0089a403          	lw	s0,8(s3)
    19a0:	01612823          	sw	s6,16(sp)
    19a4:	00442783          	lw	a5,4(s0)
    19a8:	ffc7fb13          	and	s6,a5,-4
    19ac:	009b6863          	bltu	s6,s1,19bc <_malloc_r+0x278>
    19b0:	409b0733          	sub	a4,s6,s1
    19b4:	00f00793          	li	a5,15
    19b8:	0ee7ca63          	blt	a5,a4,1aac <_malloc_r+0x368>
    19bc:	01912223          	sw	s9,4(sp)
    19c0:	7ffffc97          	auipc	s9,0x7ffff
    19c4:	d4cc8c93          	add	s9,s9,-692 # 8000070c <__malloc_sbrk_base>
    19c8:	000ca703          	lw	a4,0(s9)
    19cc:	01412c23          	sw	s4,24(sp)
    19d0:	01512a23          	sw	s5,20(sp)
    19d4:	01712623          	sw	s7,12(sp)
    19d8:	7ffffa97          	auipc	s5,0x7ffff
    19dc:	d54aaa83          	lw	s5,-684(s5) # 8000072c <__malloc_top_pad>
    19e0:	fff00793          	li	a5,-1
    19e4:	01640a33          	add	s4,s0,s6
    19e8:	01548ab3          	add	s5,s1,s5
    19ec:	3ef70263          	beq	a4,a5,1dd0 <_malloc_r+0x68c>
    19f0:	000017b7          	lui	a5,0x1
    19f4:	00f78793          	add	a5,a5,15 # 100f <memset+0x27>
    19f8:	00fa8ab3          	add	s5,s5,a5
    19fc:	fffff7b7          	lui	a5,0xfffff
    1a00:	00fafab3          	and	s5,s5,a5
    1a04:	000a8593          	mv	a1,s5
    1a08:	00090513          	mv	a0,s2
    1a0c:	254060ef          	jal	7c60 <_sbrk_r>
    1a10:	fff00793          	li	a5,-1
    1a14:	00050b93          	mv	s7,a0
    1a18:	46f50663          	beq	a0,a5,1e84 <_malloc_r+0x740>
    1a1c:	01812423          	sw	s8,8(sp)
    1a20:	25456863          	bltu	a0,s4,1c70 <_malloc_r+0x52c>
    1a24:	7ffffc17          	auipc	s8,0x7ffff
    1a28:	e10c0c13          	add	s8,s8,-496 # 80000834 <__malloc_current_mallinfo>
    1a2c:	000c2583          	lw	a1,0(s8)
    1a30:	00ba85b3          	add	a1,s5,a1
    1a34:	00bc2023          	sw	a1,0(s8)
    1a38:	00058713          	mv	a4,a1
    1a3c:	2caa1063          	bne	s4,a0,1cfc <_malloc_r+0x5b8>
    1a40:	01451793          	sll	a5,a0,0x14
    1a44:	2a079c63          	bnez	a5,1cfc <_malloc_r+0x5b8>
    1a48:	0089ab83          	lw	s7,8(s3)
    1a4c:	015b07b3          	add	a5,s6,s5
    1a50:	0017e793          	or	a5,a5,1
    1a54:	00fba223          	sw	a5,4(s7)
    1a58:	7ffff717          	auipc	a4,0x7ffff
    1a5c:	cd070713          	add	a4,a4,-816 # 80000728 <__malloc_max_sbrked_mem>
    1a60:	00072683          	lw	a3,0(a4)
    1a64:	00b6f463          	bgeu	a3,a1,1a6c <_malloc_r+0x328>
    1a68:	00b72023          	sw	a1,0(a4)
    1a6c:	7ffff717          	auipc	a4,0x7ffff
    1a70:	cb870713          	add	a4,a4,-840 # 80000724 <__malloc_max_total_mem>
    1a74:	00072683          	lw	a3,0(a4)
    1a78:	00b6f463          	bgeu	a3,a1,1a80 <_malloc_r+0x33c>
    1a7c:	00b72023          	sw	a1,0(a4)
    1a80:	00812c03          	lw	s8,8(sp)
    1a84:	000b8413          	mv	s0,s7
    1a88:	ffc7f793          	and	a5,a5,-4
    1a8c:	40978733          	sub	a4,a5,s1
    1a90:	3897ec63          	bltu	a5,s1,1e28 <_malloc_r+0x6e4>
    1a94:	00f00793          	li	a5,15
    1a98:	38e7d863          	bge	a5,a4,1e28 <_malloc_r+0x6e4>
    1a9c:	01812a03          	lw	s4,24(sp)
    1aa0:	01412a83          	lw	s5,20(sp)
    1aa4:	00c12b83          	lw	s7,12(sp)
    1aa8:	00412c83          	lw	s9,4(sp)
    1aac:	0014e793          	or	a5,s1,1
    1ab0:	00f42223          	sw	a5,4(s0)
    1ab4:	009404b3          	add	s1,s0,s1
    1ab8:	0099a423          	sw	s1,8(s3)
    1abc:	00176713          	or	a4,a4,1
    1ac0:	00090513          	mv	a0,s2
    1ac4:	00e4a223          	sw	a4,4(s1)
    1ac8:	468000ef          	jal	1f30 <__malloc_unlock>
    1acc:	02c12083          	lw	ra,44(sp)
    1ad0:	00840513          	add	a0,s0,8
    1ad4:	02812403          	lw	s0,40(sp)
    1ad8:	01012b03          	lw	s6,16(sp)
    1adc:	02412483          	lw	s1,36(sp)
    1ae0:	02012903          	lw	s2,32(sp)
    1ae4:	01c12983          	lw	s3,28(sp)
    1ae8:	03010113          	add	sp,sp,48
    1aec:	00008067          	ret
    1af0:	0049a503          	lw	a0,4(s3)
    1af4:	de9ff06f          	j	18dc <_malloc_r+0x198>
    1af8:	00842603          	lw	a2,8(s0)
    1afc:	cb1ff06f          	j	17ac <_malloc_r+0x68>
    1b00:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1b04:	00258593          	add	a1,a1,2
    1b08:	d68780e3          	beq	a5,s0,1868 <_malloc_r+0x124>
    1b0c:	c91ff06f          	j	179c <_malloc_r+0x58>
    1b10:	0097d713          	srl	a4,a5,0x9
    1b14:	00400693          	li	a3,4
    1b18:	14e6f263          	bgeu	a3,a4,1c5c <_malloc_r+0x518>
    1b1c:	01400693          	li	a3,20
    1b20:	32e6e663          	bltu	a3,a4,1e4c <_malloc_r+0x708>
    1b24:	05c70613          	add	a2,a4,92
    1b28:	05b70693          	add	a3,a4,91
    1b2c:	00361613          	sll	a2,a2,0x3
    1b30:	00c98633          	add	a2,s3,a2
    1b34:	00062703          	lw	a4,0(a2)
    1b38:	ff860613          	add	a2,a2,-8
    1b3c:	00e61863          	bne	a2,a4,1b4c <_malloc_r+0x408>
    1b40:	2980006f          	j	1dd8 <_malloc_r+0x694>
    1b44:	00872703          	lw	a4,8(a4)
    1b48:	00e60863          	beq	a2,a4,1b58 <_malloc_r+0x414>
    1b4c:	00472683          	lw	a3,4(a4)
    1b50:	ffc6f693          	and	a3,a3,-4
    1b54:	fed7e8e3          	bltu	a5,a3,1b44 <_malloc_r+0x400>
    1b58:	00c72603          	lw	a2,12(a4)
    1b5c:	00c42623          	sw	a2,12(s0)
    1b60:	00e42423          	sw	a4,8(s0)
    1b64:	00862423          	sw	s0,8(a2)
    1b68:	00872623          	sw	s0,12(a4)
    1b6c:	d71ff06f          	j	18dc <_malloc_r+0x198>
    1b70:	01400713          	li	a4,20
    1b74:	10f77863          	bgeu	a4,a5,1c84 <_malloc_r+0x540>
    1b78:	05400713          	li	a4,84
    1b7c:	2ef76663          	bltu	a4,a5,1e68 <_malloc_r+0x724>
    1b80:	00c4d793          	srl	a5,s1,0xc
    1b84:	06f78593          	add	a1,a5,111
    1b88:	06e78813          	add	a6,a5,110
    1b8c:	00359613          	sll	a2,a1,0x3
    1b90:	c95ff06f          	j	1824 <_malloc_r+0xe0>
    1b94:	001e0e13          	add	t3,t3,1
    1b98:	003e7793          	and	a5,t3,3
    1b9c:	00850513          	add	a0,a0,8
    1ba0:	10078063          	beqz	a5,1ca0 <_malloc_r+0x55c>
    1ba4:	00c52783          	lw	a5,12(a0)
    1ba8:	d89ff06f          	j	1930 <_malloc_r+0x1ec>
    1bac:	00842603          	lw	a2,8(s0)
    1bb0:	0014e593          	or	a1,s1,1
    1bb4:	00b42223          	sw	a1,4(s0)
    1bb8:	00f62623          	sw	a5,12(a2)
    1bbc:	00c7a423          	sw	a2,8(a5)
    1bc0:	009404b3          	add	s1,s0,s1
    1bc4:	0099aa23          	sw	s1,20(s3)
    1bc8:	0099a823          	sw	s1,16(s3)
    1bcc:	0016e793          	or	a5,a3,1
    1bd0:	0114a623          	sw	a7,12(s1)
    1bd4:	0114a423          	sw	a7,8(s1)
    1bd8:	00f4a223          	sw	a5,4(s1)
    1bdc:	00e40733          	add	a4,s0,a4
    1be0:	00090513          	mv	a0,s2
    1be4:	00d72023          	sw	a3,0(a4)
    1be8:	348000ef          	jal	1f30 <__malloc_unlock>
    1bec:	00840513          	add	a0,s0,8
    1bf0:	be1ff06f          	j	17d0 <_malloc_r+0x8c>
    1bf4:	00f407b3          	add	a5,s0,a5
    1bf8:	0047a703          	lw	a4,4(a5)
    1bfc:	00090513          	mv	a0,s2
    1c00:	00176713          	or	a4,a4,1
    1c04:	00e7a223          	sw	a4,4(a5)
    1c08:	328000ef          	jal	1f30 <__malloc_unlock>
    1c0c:	00840513          	add	a0,s0,8
    1c10:	bc1ff06f          	j	17d0 <_malloc_r+0x8c>
    1c14:	0034d593          	srl	a1,s1,0x3
    1c18:	00848793          	add	a5,s1,8
    1c1c:	b69ff06f          	j	1784 <_malloc_r+0x40>
    1c20:	0014e693          	or	a3,s1,1
    1c24:	00d42223          	sw	a3,4(s0)
    1c28:	009404b3          	add	s1,s0,s1
    1c2c:	0099aa23          	sw	s1,20(s3)
    1c30:	0099a823          	sw	s1,16(s3)
    1c34:	00176693          	or	a3,a4,1
    1c38:	0114a623          	sw	a7,12(s1)
    1c3c:	0114a423          	sw	a7,8(s1)
    1c40:	00d4a223          	sw	a3,4(s1)
    1c44:	00f407b3          	add	a5,s0,a5
    1c48:	00090513          	mv	a0,s2
    1c4c:	00e7a023          	sw	a4,0(a5)
    1c50:	2e0000ef          	jal	1f30 <__malloc_unlock>
    1c54:	00840513          	add	a0,s0,8
    1c58:	b79ff06f          	j	17d0 <_malloc_r+0x8c>
    1c5c:	0067d713          	srl	a4,a5,0x6
    1c60:	03970613          	add	a2,a4,57
    1c64:	03870693          	add	a3,a4,56
    1c68:	00361613          	sll	a2,a2,0x3
    1c6c:	ec5ff06f          	j	1b30 <_malloc_r+0x3ec>
    1c70:	07340c63          	beq	s0,s3,1ce8 <_malloc_r+0x5a4>
    1c74:	0089a403          	lw	s0,8(s3)
    1c78:	00812c03          	lw	s8,8(sp)
    1c7c:	00442783          	lw	a5,4(s0)
    1c80:	e09ff06f          	j	1a88 <_malloc_r+0x344>
    1c84:	05c78593          	add	a1,a5,92
    1c88:	05b78813          	add	a6,a5,91
    1c8c:	00359613          	sll	a2,a1,0x3
    1c90:	b95ff06f          	j	1824 <_malloc_r+0xe0>
    1c94:	00832783          	lw	a5,8(t1)
    1c98:	fff58593          	add	a1,a1,-1
    1c9c:	28679063          	bne	a5,t1,1f1c <_malloc_r+0x7d8>
    1ca0:	0035f793          	and	a5,a1,3
    1ca4:	ff830313          	add	t1,t1,-8
    1ca8:	fe0796e3          	bnez	a5,1c94 <_malloc_r+0x550>
    1cac:	0049a703          	lw	a4,4(s3)
    1cb0:	fff64793          	not	a5,a2
    1cb4:	00e7f7b3          	and	a5,a5,a4
    1cb8:	00f9a223          	sw	a5,4(s3)
    1cbc:	00161613          	sll	a2,a2,0x1
    1cc0:	ccc7eee3          	bltu	a5,a2,199c <_malloc_r+0x258>
    1cc4:	cc060ce3          	beqz	a2,199c <_malloc_r+0x258>
    1cc8:	00f67733          	and	a4,a2,a5
    1ccc:	00071a63          	bnez	a4,1ce0 <_malloc_r+0x59c>
    1cd0:	00161613          	sll	a2,a2,0x1
    1cd4:	00f67733          	and	a4,a2,a5
    1cd8:	004e0e13          	add	t3,t3,4
    1cdc:	fe070ae3          	beqz	a4,1cd0 <_malloc_r+0x58c>
    1ce0:	000e0593          	mv	a1,t3
    1ce4:	c39ff06f          	j	191c <_malloc_r+0x1d8>
    1ce8:	7ffffc17          	auipc	s8,0x7ffff
    1cec:	b4cc0c13          	add	s8,s8,-1204 # 80000834 <__malloc_current_mallinfo>
    1cf0:	000c2703          	lw	a4,0(s8)
    1cf4:	00ea8733          	add	a4,s5,a4
    1cf8:	00ec2023          	sw	a4,0(s8)
    1cfc:	000ca683          	lw	a3,0(s9)
    1d00:	fff00793          	li	a5,-1
    1d04:	18f68663          	beq	a3,a5,1e90 <_malloc_r+0x74c>
    1d08:	414b87b3          	sub	a5,s7,s4
    1d0c:	00e787b3          	add	a5,a5,a4
    1d10:	00fc2023          	sw	a5,0(s8)
    1d14:	007bfc93          	and	s9,s7,7
    1d18:	0c0c8c63          	beqz	s9,1df0 <_malloc_r+0x6ac>
    1d1c:	419b8bb3          	sub	s7,s7,s9
    1d20:	000017b7          	lui	a5,0x1
    1d24:	00878793          	add	a5,a5,8 # 1008 <memset+0x20>
    1d28:	008b8b93          	add	s7,s7,8
    1d2c:	419785b3          	sub	a1,a5,s9
    1d30:	015b8ab3          	add	s5,s7,s5
    1d34:	415585b3          	sub	a1,a1,s5
    1d38:	01459593          	sll	a1,a1,0x14
    1d3c:	0145da13          	srl	s4,a1,0x14
    1d40:	000a0593          	mv	a1,s4
    1d44:	00090513          	mv	a0,s2
    1d48:	719050ef          	jal	7c60 <_sbrk_r>
    1d4c:	fff00793          	li	a5,-1
    1d50:	18f50063          	beq	a0,a5,1ed0 <_malloc_r+0x78c>
    1d54:	41750533          	sub	a0,a0,s7
    1d58:	01450ab3          	add	s5,a0,s4
    1d5c:	000c2703          	lw	a4,0(s8)
    1d60:	0179a423          	sw	s7,8(s3)
    1d64:	001ae793          	or	a5,s5,1
    1d68:	00ea05b3          	add	a1,s4,a4
    1d6c:	00bc2023          	sw	a1,0(s8)
    1d70:	00fba223          	sw	a5,4(s7)
    1d74:	cf3402e3          	beq	s0,s3,1a58 <_malloc_r+0x314>
    1d78:	00f00693          	li	a3,15
    1d7c:	0b66f063          	bgeu	a3,s6,1e1c <_malloc_r+0x6d8>
    1d80:	00442703          	lw	a4,4(s0)
    1d84:	ff4b0793          	add	a5,s6,-12
    1d88:	ff87f793          	and	a5,a5,-8
    1d8c:	00177713          	and	a4,a4,1
    1d90:	00f76733          	or	a4,a4,a5
    1d94:	00e42223          	sw	a4,4(s0)
    1d98:	00500613          	li	a2,5
    1d9c:	00f40733          	add	a4,s0,a5
    1da0:	00c72223          	sw	a2,4(a4)
    1da4:	00c72423          	sw	a2,8(a4)
    1da8:	00f6e663          	bltu	a3,a5,1db4 <_malloc_r+0x670>
    1dac:	004ba783          	lw	a5,4(s7)
    1db0:	ca9ff06f          	j	1a58 <_malloc_r+0x314>
    1db4:	00840593          	add	a1,s0,8
    1db8:	00090513          	mv	a0,s2
    1dbc:	e7cff0ef          	jal	1438 <_free_r>
    1dc0:	0089ab83          	lw	s7,8(s3)
    1dc4:	000c2583          	lw	a1,0(s8)
    1dc8:	004ba783          	lw	a5,4(s7)
    1dcc:	c8dff06f          	j	1a58 <_malloc_r+0x314>
    1dd0:	010a8a93          	add	s5,s5,16
    1dd4:	c31ff06f          	j	1a04 <_malloc_r+0x2c0>
    1dd8:	4026d693          	sra	a3,a3,0x2
    1ddc:	00100793          	li	a5,1
    1de0:	00d797b3          	sll	a5,a5,a3
    1de4:	00f56533          	or	a0,a0,a5
    1de8:	00a9a223          	sw	a0,4(s3)
    1dec:	d71ff06f          	j	1b5c <_malloc_r+0x418>
    1df0:	015b85b3          	add	a1,s7,s5
    1df4:	40b005b3          	neg	a1,a1
    1df8:	01459593          	sll	a1,a1,0x14
    1dfc:	0145da13          	srl	s4,a1,0x14
    1e00:	000a0593          	mv	a1,s4
    1e04:	00090513          	mv	a0,s2
    1e08:	659050ef          	jal	7c60 <_sbrk_r>
    1e0c:	fff00793          	li	a5,-1
    1e10:	f4f512e3          	bne	a0,a5,1d54 <_malloc_r+0x610>
    1e14:	00000a13          	li	s4,0
    1e18:	f45ff06f          	j	1d5c <_malloc_r+0x618>
    1e1c:	00812c03          	lw	s8,8(sp)
    1e20:	00100793          	li	a5,1
    1e24:	00fba223          	sw	a5,4(s7)
    1e28:	00090513          	mv	a0,s2
    1e2c:	104000ef          	jal	1f30 <__malloc_unlock>
    1e30:	00000513          	li	a0,0
    1e34:	01812a03          	lw	s4,24(sp)
    1e38:	01412a83          	lw	s5,20(sp)
    1e3c:	01012b03          	lw	s6,16(sp)
    1e40:	00c12b83          	lw	s7,12(sp)
    1e44:	00412c83          	lw	s9,4(sp)
    1e48:	989ff06f          	j	17d0 <_malloc_r+0x8c>
    1e4c:	05400693          	li	a3,84
    1e50:	04e6e463          	bltu	a3,a4,1e98 <_malloc_r+0x754>
    1e54:	00c7d713          	srl	a4,a5,0xc
    1e58:	06f70613          	add	a2,a4,111
    1e5c:	06e70693          	add	a3,a4,110
    1e60:	00361613          	sll	a2,a2,0x3
    1e64:	ccdff06f          	j	1b30 <_malloc_r+0x3ec>
    1e68:	15400713          	li	a4,340
    1e6c:	04f76463          	bltu	a4,a5,1eb4 <_malloc_r+0x770>
    1e70:	00f4d793          	srl	a5,s1,0xf
    1e74:	07878593          	add	a1,a5,120
    1e78:	07778813          	add	a6,a5,119
    1e7c:	00359613          	sll	a2,a1,0x3
    1e80:	9a5ff06f          	j	1824 <_malloc_r+0xe0>
    1e84:	0089a403          	lw	s0,8(s3)
    1e88:	00442783          	lw	a5,4(s0)
    1e8c:	bfdff06f          	j	1a88 <_malloc_r+0x344>
    1e90:	017ca023          	sw	s7,0(s9)
    1e94:	e81ff06f          	j	1d14 <_malloc_r+0x5d0>
    1e98:	15400693          	li	a3,340
    1e9c:	04e6e463          	bltu	a3,a4,1ee4 <_malloc_r+0x7a0>
    1ea0:	00f7d713          	srl	a4,a5,0xf
    1ea4:	07870613          	add	a2,a4,120
    1ea8:	07770693          	add	a3,a4,119
    1eac:	00361613          	sll	a2,a2,0x3
    1eb0:	c81ff06f          	j	1b30 <_malloc_r+0x3ec>
    1eb4:	55400713          	li	a4,1364
    1eb8:	04f76463          	bltu	a4,a5,1f00 <_malloc_r+0x7bc>
    1ebc:	0124d793          	srl	a5,s1,0x12
    1ec0:	07d78593          	add	a1,a5,125
    1ec4:	07c78813          	add	a6,a5,124
    1ec8:	00359613          	sll	a2,a1,0x3
    1ecc:	959ff06f          	j	1824 <_malloc_r+0xe0>
    1ed0:	ff8c8c93          	add	s9,s9,-8
    1ed4:	019a8ab3          	add	s5,s5,s9
    1ed8:	417a8ab3          	sub	s5,s5,s7
    1edc:	00000a13          	li	s4,0
    1ee0:	e7dff06f          	j	1d5c <_malloc_r+0x618>
    1ee4:	55400693          	li	a3,1364
    1ee8:	02e6e463          	bltu	a3,a4,1f10 <_malloc_r+0x7cc>
    1eec:	0127d713          	srl	a4,a5,0x12
    1ef0:	07d70613          	add	a2,a4,125
    1ef4:	07c70693          	add	a3,a4,124
    1ef8:	00361613          	sll	a2,a2,0x3
    1efc:	c35ff06f          	j	1b30 <_malloc_r+0x3ec>
    1f00:	3f800613          	li	a2,1016
    1f04:	07f00593          	li	a1,127
    1f08:	07e00813          	li	a6,126
    1f0c:	919ff06f          	j	1824 <_malloc_r+0xe0>
    1f10:	3f800613          	li	a2,1016
    1f14:	07e00693          	li	a3,126
    1f18:	c19ff06f          	j	1b30 <_malloc_r+0x3ec>
    1f1c:	0049a783          	lw	a5,4(s3)
    1f20:	d9dff06f          	j	1cbc <_malloc_r+0x578>

00001f24 <__malloc_lock>:
    1f24:	7fffe517          	auipc	a0,0x7fffe
    1f28:	7f850513          	add	a0,a0,2040 # 8000071c <__lock___malloc_recursive_mutex>
    1f2c:	8b4ff06f          	j	fe0 <__retarget_lock_acquire_recursive>

00001f30 <__malloc_unlock>:
    1f30:	7fffe517          	auipc	a0,0x7fffe
    1f34:	7ec50513          	add	a0,a0,2028 # 8000071c <__lock___malloc_recursive_mutex>
    1f38:	8acff06f          	j	fe4 <__retarget_lock_release_recursive>

00001f3c <_vfprintf_r>:
    1f3c:	e7010113          	add	sp,sp,-400
    1f40:	18112623          	sw	ra,396(sp)
    1f44:	00b12423          	sw	a1,8(sp)
    1f48:	00c12623          	sw	a2,12(sp)
    1f4c:	00d12a23          	sw	a3,20(sp)
    1f50:	17312e23          	sw	s3,380(sp)
    1f54:	18812423          	sw	s0,392(sp)
    1f58:	00050993          	mv	s3,a0
    1f5c:	3d9050ef          	jal	7b34 <_localeconv_r>
    1f60:	00052783          	lw	a5,0(a0)
    1f64:	00078513          	mv	a0,a5
    1f68:	02f12a23          	sw	a5,52(sp)
    1f6c:	afcff0ef          	jal	1268 <strlen>
    1f70:	00050713          	mv	a4,a0
    1f74:	00800613          	li	a2,8
    1f78:	00000593          	li	a1,0
    1f7c:	09010513          	add	a0,sp,144
    1f80:	02e12823          	sw	a4,48(sp)
    1f84:	864ff0ef          	jal	fe8 <memset>
    1f88:	00c12783          	lw	a5,12(sp)
    1f8c:	00098863          	beqz	s3,1f9c <_vfprintf_r+0x60>
    1f90:	0349a703          	lw	a4,52(s3)
    1f94:	00071463          	bnez	a4,1f9c <_vfprintf_r+0x60>
    1f98:	29d0106f          	j	3a34 <_vfprintf_r+0x1af8>
    1f9c:	00812703          	lw	a4,8(sp)
    1fa0:	06472683          	lw	a3,100(a4)
    1fa4:	00c71703          	lh	a4,12(a4)
    1fa8:	0016f693          	and	a3,a3,1
    1fac:	00069863          	bnez	a3,1fbc <_vfprintf_r+0x80>
    1fb0:	20077693          	and	a3,a4,512
    1fb4:	00069463          	bnez	a3,1fbc <_vfprintf_r+0x80>
    1fb8:	3ec0106f          	j	33a4 <_vfprintf_r+0x1468>
    1fbc:	01271693          	sll	a3,a4,0x12
    1fc0:	0206c863          	bltz	a3,1ff0 <_vfprintf_r+0xb4>
    1fc4:	00812503          	lw	a0,8(sp)
    1fc8:	000025b7          	lui	a1,0x2
    1fcc:	ffffe637          	lui	a2,0xffffe
    1fd0:	06452683          	lw	a3,100(a0)
    1fd4:	00b76733          	or	a4,a4,a1
    1fd8:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1fdc:	01071713          	sll	a4,a4,0x10
    1fe0:	41075713          	sra	a4,a4,0x10
    1fe4:	00c6f6b3          	and	a3,a3,a2
    1fe8:	00e51623          	sh	a4,12(a0)
    1fec:	06d52223          	sw	a3,100(a0)
    1ff0:	00877693          	and	a3,a4,8
    1ff4:	2a068063          	beqz	a3,2294 <_vfprintf_r+0x358>
    1ff8:	00812683          	lw	a3,8(sp)
    1ffc:	0106a683          	lw	a3,16(a3)
    2000:	28068a63          	beqz	a3,2294 <_vfprintf_r+0x358>
    2004:	01a77693          	and	a3,a4,26
    2008:	00a00613          	li	a2,10
    200c:	2ac68c63          	beq	a3,a2,22c4 <_vfprintf_r+0x388>
    2010:	0ac10713          	add	a4,sp,172
    2014:	17512a23          	sw	s5,372(sp)
    2018:	17812423          	sw	s8,360(sp)
    201c:	15b12e23          	sw	s11,348(sp)
    2020:	18912223          	sw	s1,388(sp)
    2024:	19212023          	sw	s2,384(sp)
    2028:	17412c23          	sw	s4,376(sp)
    202c:	17612823          	sw	s6,368(sp)
    2030:	17712623          	sw	s7,364(sp)
    2034:	17912223          	sw	s9,356(sp)
    2038:	17a12023          	sw	s10,352(sp)
    203c:	0ae12023          	sw	a4,160(sp)
    2040:	0a012423          	sw	zero,168(sp)
    2044:	0a012223          	sw	zero,164(sp)
    2048:	00012c23          	sw	zero,24(sp)
    204c:	02012423          	sw	zero,40(sp)
    2050:	02012623          	sw	zero,44(sp)
    2054:	00070413          	mv	s0,a4
    2058:	02012c23          	sw	zero,56(sp)
    205c:	04012023          	sw	zero,64(sp)
    2060:	02012e23          	sw	zero,60(sp)
    2064:	04012623          	sw	zero,76(sp)
    2068:	04012423          	sw	zero,72(sp)
    206c:	00012623          	sw	zero,12(sp)
    2070:	7fffea97          	auipc	s5,0x7fffe
    2074:	4c4a8a93          	add	s5,s5,1220 # 80000534 <__global_locale>
    2078:	02500d93          	li	s11,37
    207c:	00078c13          	mv	s8,a5
    2080:	000c0913          	mv	s2,s8
    2084:	0e4aa483          	lw	s1,228(s5)
    2088:	2a1050ef          	jal	7b28 <__locale_mb_cur_max>
    208c:	00050693          	mv	a3,a0
    2090:	09010713          	add	a4,sp,144
    2094:	00090613          	mv	a2,s2
    2098:	08010593          	add	a1,sp,128
    209c:	00098513          	mv	a0,s3
    20a0:	000480e7          	jalr	s1
    20a4:	2c050a63          	beqz	a0,2378 <_vfprintf_r+0x43c>
    20a8:	2a054a63          	bltz	a0,235c <_vfprintf_r+0x420>
    20ac:	08012783          	lw	a5,128(sp)
    20b0:	01b78663          	beq	a5,s11,20bc <_vfprintf_r+0x180>
    20b4:	00a90933          	add	s2,s2,a0
    20b8:	fcdff06f          	j	2084 <_vfprintf_r+0x148>
    20bc:	00050493          	mv	s1,a0
    20c0:	41890cb3          	sub	s9,s2,s8
    20c4:	2d891063          	bne	s2,s8,2384 <_vfprintf_r+0x448>
    20c8:	fff00313          	li	t1,-1
    20cc:	00000e93          	li	t4,0
    20d0:	00194e03          	lbu	t3,1(s2)
    20d4:	06010ba3          	sb	zero,119(sp)
    20d8:	00190913          	add	s2,s2,1
    20dc:	00000b93          	li	s7,0
    20e0:	05a00493          	li	s1,90
    20e4:	000e8a13          	mv	s4,t4
    20e8:	00030b13          	mv	s6,t1
    20ec:	00190913          	add	s2,s2,1
    20f0:	fe0e0793          	add	a5,t3,-32
    20f4:	04f4ea63          	bltu	s1,a5,2148 <_vfprintf_r+0x20c>
    20f8:	0000d717          	auipc	a4,0xd
    20fc:	32070713          	add	a4,a4,800 # f418 <_ctype_+0x104>
    2100:	00279793          	sll	a5,a5,0x2
    2104:	00e787b3          	add	a5,a5,a4
    2108:	0007a783          	lw	a5,0(a5)
    210c:	00e787b3          	add	a5,a5,a4
    2110:	00078067          	jr	a5
    2114:	00000b93          	li	s7,0
    2118:	fd0e0713          	add	a4,t3,-48
    211c:	00900693          	li	a3,9
    2120:	00094e03          	lbu	t3,0(s2)
    2124:	002b9793          	sll	a5,s7,0x2
    2128:	017787b3          	add	a5,a5,s7
    212c:	00179793          	sll	a5,a5,0x1
    2130:	00f70bb3          	add	s7,a4,a5
    2134:	fd0e0713          	add	a4,t3,-48
    2138:	00190913          	add	s2,s2,1
    213c:	fee6f2e3          	bgeu	a3,a4,2120 <_vfprintf_r+0x1e4>
    2140:	fe0e0793          	add	a5,t3,-32
    2144:	faf4fae3          	bgeu	s1,a5,20f8 <_vfprintf_r+0x1bc>
    2148:	000a0e93          	mv	t4,s4
    214c:	260e0a63          	beqz	t3,23c0 <_vfprintf_r+0x484>
    2150:	0fc10623          	sb	t3,236(sp)
    2154:	06010ba3          	sb	zero,119(sp)
    2158:	00100c93          	li	s9,1
    215c:	00000613          	li	a2,0
    2160:	00012823          	sw	zero,16(sp)
    2164:	00100d13          	li	s10,1
    2168:	00000313          	li	t1,0
    216c:	02012223          	sw	zero,36(sp)
    2170:	02012023          	sw	zero,32(sp)
    2174:	00000a13          	li	s4,0
    2178:	0ec10c13          	add	s8,sp,236
    217c:	002ef293          	and	t0,t4,2
    2180:	00028463          	beqz	t0,2188 <_vfprintf_r+0x24c>
    2184:	002c8c93          	add	s9,s9,2
    2188:	084eff93          	and	t6,t4,132
    218c:	0a812483          	lw	s1,168(sp)
    2190:	000f9663          	bnez	t6,219c <_vfprintf_r+0x260>
    2194:	419b8733          	sub	a4,s7,s9
    2198:	40e04663          	bgtz	a4,25a4 <_vfprintf_r+0x668>
    219c:	02060a63          	beqz	a2,21d0 <_vfprintf_r+0x294>
    21a0:	0a412703          	lw	a4,164(sp)
    21a4:	07710613          	add	a2,sp,119
    21a8:	00148493          	add	s1,s1,1
    21ac:	00170713          	add	a4,a4,1
    21b0:	00100793          	li	a5,1
    21b4:	00c42023          	sw	a2,0(s0)
    21b8:	00f42223          	sw	a5,4(s0)
    21bc:	0a912423          	sw	s1,168(sp)
    21c0:	0ae12223          	sw	a4,164(sp)
    21c4:	00700613          	li	a2,7
    21c8:	00840413          	add	s0,s0,8
    21cc:	4ce64863          	blt	a2,a4,269c <_vfprintf_r+0x760>
    21d0:	02028a63          	beqz	t0,2204 <_vfprintf_r+0x2c8>
    21d4:	0a412703          	lw	a4,164(sp)
    21d8:	07810613          	add	a2,sp,120
    21dc:	00c42023          	sw	a2,0(s0)
    21e0:	00248493          	add	s1,s1,2
    21e4:	00200613          	li	a2,2
    21e8:	00170713          	add	a4,a4,1
    21ec:	00c42223          	sw	a2,4(s0)
    21f0:	0a912423          	sw	s1,168(sp)
    21f4:	0ae12223          	sw	a4,164(sp)
    21f8:	00700613          	li	a2,7
    21fc:	00840413          	add	s0,s0,8
    2200:	5ce644e3          	blt	a2,a4,2fc8 <_vfprintf_r+0x108c>
    2204:	08000713          	li	a4,128
    2208:	3aef80e3          	beq	t6,a4,2da8 <_vfprintf_r+0xe6c>
    220c:	41a30b33          	sub	s6,t1,s10
    2210:	4b604ae3          	bgtz	s6,2ec4 <_vfprintf_r+0xf88>
    2214:	100ef713          	and	a4,t4,256
    2218:	1a0710e3          	bnez	a4,2bb8 <_vfprintf_r+0xc7c>
    221c:	0a412783          	lw	a5,164(sp)
    2220:	01a484b3          	add	s1,s1,s10
    2224:	01842023          	sw	s8,0(s0)
    2228:	00178793          	add	a5,a5,1
    222c:	01a42223          	sw	s10,4(s0)
    2230:	0a912423          	sw	s1,168(sp)
    2234:	0af12223          	sw	a5,164(sp)
    2238:	00700713          	li	a4,7
    223c:	58f74c63          	blt	a4,a5,27d4 <_vfprintf_r+0x898>
    2240:	00840413          	add	s0,s0,8
    2244:	004eff13          	and	t5,t4,4
    2248:	000f0663          	beqz	t5,2254 <_vfprintf_r+0x318>
    224c:	419b8d33          	sub	s10,s7,s9
    2250:	5ba04ce3          	bgtz	s10,3008 <_vfprintf_r+0x10cc>
    2254:	000b8e93          	mv	t4,s7
    2258:	019bd463          	bge	s7,s9,2260 <_vfprintf_r+0x324>
    225c:	000c8e93          	mv	t4,s9
    2260:	00c12783          	lw	a5,12(sp)
    2264:	01d787b3          	add	a5,a5,t4
    2268:	00f12623          	sw	a5,12(sp)
    226c:	18049663          	bnez	s1,23f8 <_vfprintf_r+0x4bc>
    2270:	01012783          	lw	a5,16(sp)
    2274:	0a012223          	sw	zero,164(sp)
    2278:	00078863          	beqz	a5,2288 <_vfprintf_r+0x34c>
    227c:	01012583          	lw	a1,16(sp)
    2280:	00098513          	mv	a0,s3
    2284:	9b4ff0ef          	jal	1438 <_free_r>
    2288:	0ac10413          	add	s0,sp,172
    228c:	00090c13          	mv	s8,s2
    2290:	df1ff06f          	j	2080 <_vfprintf_r+0x144>
    2294:	00812403          	lw	s0,8(sp)
    2298:	00098513          	mv	a0,s3
    229c:	00f12623          	sw	a5,12(sp)
    22a0:	00040593          	mv	a1,s0
    22a4:	3a4050ef          	jal	7648 <__swsetup_r>
    22a8:	00050463          	beqz	a0,22b0 <_vfprintf_r+0x374>
    22ac:	5600206f          	j	480c <_vfprintf_r+0x28d0>
    22b0:	00c41703          	lh	a4,12(s0)
    22b4:	00a00613          	li	a2,10
    22b8:	00c12783          	lw	a5,12(sp)
    22bc:	01a77693          	and	a3,a4,26
    22c0:	d4c698e3          	bne	a3,a2,2010 <_vfprintf_r+0xd4>
    22c4:	00812603          	lw	a2,8(sp)
    22c8:	00e61683          	lh	a3,14(a2)
    22cc:	d406c2e3          	bltz	a3,2010 <_vfprintf_r+0xd4>
    22d0:	06462683          	lw	a3,100(a2)
    22d4:	0016f693          	and	a3,a3,1
    22d8:	00069863          	bnez	a3,22e8 <_vfprintf_r+0x3ac>
    22dc:	20077713          	and	a4,a4,512
    22e0:	00071463          	bnez	a4,22e8 <_vfprintf_r+0x3ac>
    22e4:	53d0106f          	j	4020 <_vfprintf_r+0x20e4>
    22e8:	01412683          	lw	a3,20(sp)
    22ec:	00812583          	lw	a1,8(sp)
    22f0:	00098513          	mv	a0,s3
    22f4:	00078613          	mv	a2,a5
    22f8:	0e5020ef          	jal	4bdc <__sbprintf>
    22fc:	18c12083          	lw	ra,396(sp)
    2300:	18812403          	lw	s0,392(sp)
    2304:	00a12623          	sw	a0,12(sp)
    2308:	00c12503          	lw	a0,12(sp)
    230c:	17c12983          	lw	s3,380(sp)
    2310:	19010113          	add	sp,sp,400
    2314:	00008067          	ret
    2318:	00098513          	mv	a0,s3
    231c:	019050ef          	jal	7b34 <_localeconv_r>
    2320:	00452783          	lw	a5,4(a0)
    2324:	00078513          	mv	a0,a5
    2328:	04f12423          	sw	a5,72(sp)
    232c:	f3dfe0ef          	jal	1268 <strlen>
    2330:	00050793          	mv	a5,a0
    2334:	00098513          	mv	a0,s3
    2338:	00078c93          	mv	s9,a5
    233c:	04f12623          	sw	a5,76(sp)
    2340:	7f4050ef          	jal	7b34 <_localeconv_r>
    2344:	00852703          	lw	a4,8(a0)
    2348:	02e12e23          	sw	a4,60(sp)
    234c:	000c8463          	beqz	s9,2354 <_vfprintf_r+0x418>
    2350:	1ec0106f          	j	353c <_vfprintf_r+0x1600>
    2354:	00094e03          	lbu	t3,0(s2)
    2358:	d95ff06f          	j	20ec <_vfprintf_r+0x1b0>
    235c:	00800613          	li	a2,8
    2360:	00000593          	li	a1,0
    2364:	09010513          	add	a0,sp,144
    2368:	c81fe0ef          	jal	fe8 <memset>
    236c:	00100513          	li	a0,1
    2370:	00a90933          	add	s2,s2,a0
    2374:	d11ff06f          	j	2084 <_vfprintf_r+0x148>
    2378:	00050493          	mv	s1,a0
    237c:	41890cb3          	sub	s9,s2,s8
    2380:	05890063          	beq	s2,s8,23c0 <_vfprintf_r+0x484>
    2384:	0a812683          	lw	a3,168(sp)
    2388:	0a412703          	lw	a4,164(sp)
    238c:	01842023          	sw	s8,0(s0)
    2390:	019686b3          	add	a3,a3,s9
    2394:	00170713          	add	a4,a4,1
    2398:	01942223          	sw	s9,4(s0)
    239c:	0ad12423          	sw	a3,168(sp)
    23a0:	0ae12223          	sw	a4,164(sp)
    23a4:	00700693          	li	a3,7
    23a8:	00840413          	add	s0,s0,8
    23ac:	02e6c863          	blt	a3,a4,23dc <_vfprintf_r+0x4a0>
    23b0:	00c12783          	lw	a5,12(sp)
    23b4:	019787b3          	add	a5,a5,s9
    23b8:	00f12623          	sw	a5,12(sp)
    23bc:	d00496e3          	bnez	s1,20c8 <_vfprintf_r+0x18c>
    23c0:	0a812783          	lw	a5,168(sp)
    23c4:	00078463          	beqz	a5,23cc <_vfprintf_r+0x490>
    23c8:	4090106f          	j	3fd0 <_vfprintf_r+0x2094>
    23cc:	00812783          	lw	a5,8(sp)
    23d0:	0a012223          	sw	zero,164(sp)
    23d4:	00c79783          	lh	a5,12(a5)
    23d8:	0500006f          	j	2428 <_vfprintf_r+0x4ec>
    23dc:	00812583          	lw	a1,8(sp)
    23e0:	0a010613          	add	a2,sp,160
    23e4:	00098513          	mv	a0,s3
    23e8:	211020ef          	jal	4df8 <__sprint_r>
    23ec:	02051a63          	bnez	a0,2420 <_vfprintf_r+0x4e4>
    23f0:	0ac10413          	add	s0,sp,172
    23f4:	fbdff06f          	j	23b0 <_vfprintf_r+0x474>
    23f8:	00812583          	lw	a1,8(sp)
    23fc:	0a010613          	add	a2,sp,160
    2400:	00098513          	mv	a0,s3
    2404:	1f5020ef          	jal	4df8 <__sprint_r>
    2408:	e60504e3          	beqz	a0,2270 <_vfprintf_r+0x334>
    240c:	01012283          	lw	t0,16(sp)
    2410:	00028863          	beqz	t0,2420 <_vfprintf_r+0x4e4>
    2414:	00028593          	mv	a1,t0
    2418:	00098513          	mv	a0,s3
    241c:	81cff0ef          	jal	1438 <_free_r>
    2420:	00812783          	lw	a5,8(sp)
    2424:	00c79783          	lh	a5,12(a5)
    2428:	00812703          	lw	a4,8(sp)
    242c:	06472703          	lw	a4,100(a4)
    2430:	00177713          	and	a4,a4,1
    2434:	3c070463          	beqz	a4,27fc <_vfprintf_r+0x8c0>
    2438:	0407f793          	and	a5,a5,64
    243c:	18412483          	lw	s1,388(sp)
    2440:	18012903          	lw	s2,384(sp)
    2444:	17812a03          	lw	s4,376(sp)
    2448:	17412a83          	lw	s5,372(sp)
    244c:	17012b03          	lw	s6,368(sp)
    2450:	16c12b83          	lw	s7,364(sp)
    2454:	16812c03          	lw	s8,360(sp)
    2458:	16412c83          	lw	s9,356(sp)
    245c:	16012d03          	lw	s10,352(sp)
    2460:	15c12d83          	lw	s11,348(sp)
    2464:	00078463          	beqz	a5,246c <_vfprintf_r+0x530>
    2468:	3d00206f          	j	4838 <_vfprintf_r+0x28fc>
    246c:	18c12083          	lw	ra,396(sp)
    2470:	18812403          	lw	s0,392(sp)
    2474:	00c12503          	lw	a0,12(sp)
    2478:	17c12983          	lw	s3,380(sp)
    247c:	19010113          	add	sp,sp,400
    2480:	00008067          	ret
    2484:	008a7713          	and	a4,s4,8
    2488:	000a0e93          	mv	t4,s4
    248c:	000b0313          	mv	t1,s6
    2490:	00070463          	beqz	a4,2498 <_vfprintf_r+0x55c>
    2494:	0200106f          	j	34b4 <_vfprintf_r+0x1578>
    2498:	01412783          	lw	a5,20(sp)
    249c:	00778b13          	add	s6,a5,7
    24a0:	ff8b7b13          	and	s6,s6,-8
    24a4:	000b2783          	lw	a5,0(s6)
    24a8:	02f12423          	sw	a5,40(sp)
    24ac:	004b2783          	lw	a5,4(s6)
    24b0:	02f12623          	sw	a5,44(sp)
    24b4:	008b0793          	add	a5,s6,8
    24b8:	00f12a23          	sw	a5,20(sp)
    24bc:	02c12a03          	lw	s4,44(sp)
    24c0:	7fffe717          	auipc	a4,0x7fffe
    24c4:	1e070713          	add	a4,a4,480 # 800006a0 <__global_locale+0x16c>
    24c8:	00072c83          	lw	s9,0(a4)
    24cc:	00472d03          	lw	s10,4(a4)
    24d0:	02812b03          	lw	s6,40(sp)
    24d4:	001a1493          	sll	s1,s4,0x1
    24d8:	0014d493          	srl	s1,s1,0x1
    24dc:	000b0513          	mv	a0,s6
    24e0:	00048593          	mv	a1,s1
    24e4:	000c8613          	mv	a2,s9
    24e8:	000d0693          	mv	a3,s10
    24ec:	02612223          	sw	t1,36(sp)
    24f0:	03c12023          	sw	t3,32(sp)
    24f4:	01d12823          	sw	t4,16(sp)
    24f8:	26c0c0ef          	jal	e764 <__unorddf2>
    24fc:	01012e83          	lw	t4,16(sp)
    2500:	02012e03          	lw	t3,32(sp)
    2504:	02412303          	lw	t1,36(sp)
    2508:	00050463          	beqz	a0,2510 <_vfprintf_r+0x5d4>
    250c:	4080106f          	j	3914 <_vfprintf_r+0x19d8>
    2510:	000b0513          	mv	a0,s6
    2514:	00048593          	mv	a1,s1
    2518:	000c8613          	mv	a2,s9
    251c:	000d0693          	mv	a3,s10
    2520:	0a40b0ef          	jal	d5c4 <__ledf2>
    2524:	01012e83          	lw	t4,16(sp)
    2528:	02012e03          	lw	t3,32(sp)
    252c:	02412303          	lw	t1,36(sp)
    2530:	00a04463          	bgtz	a0,2538 <_vfprintf_r+0x5fc>
    2534:	3e00106f          	j	3914 <_vfprintf_r+0x19d8>
    2538:	000b0513          	mv	a0,s6
    253c:	000a0593          	mv	a1,s4
    2540:	00000613          	li	a2,0
    2544:	00000693          	li	a3,0
    2548:	07c0b0ef          	jal	d5c4 <__ledf2>
    254c:	01012e83          	lw	t4,16(sp)
    2550:	02012e03          	lw	t3,32(sp)
    2554:	00055463          	bgez	a0,255c <_vfprintf_r+0x620>
    2558:	6650106f          	j	43bc <_vfprintf_r+0x2480>
    255c:	07714603          	lbu	a2,119(sp)
    2560:	04700713          	li	a4,71
    2564:	0000dc17          	auipc	s8,0xd
    2568:	bc4c0c13          	add	s8,s8,-1084 # f128 <__fini_array_end+0x19c>
    256c:	01c74663          	blt	a4,t3,2578 <_vfprintf_r+0x63c>
    2570:	0000dc17          	auipc	s8,0xd
    2574:	bb4c0c13          	add	s8,s8,-1100 # f124 <__fini_array_end+0x198>
    2578:	00012823          	sw	zero,16(sp)
    257c:	02012223          	sw	zero,36(sp)
    2580:	02012023          	sw	zero,32(sp)
    2584:	f7fefe93          	and	t4,t4,-129
    2588:	00300c93          	li	s9,3
    258c:	00300d13          	li	s10,3
    2590:	00000313          	li	t1,0
    2594:	00000a13          	li	s4,0
    2598:	be0602e3          	beqz	a2,217c <_vfprintf_r+0x240>
    259c:	001c8c93          	add	s9,s9,1
    25a0:	bddff06f          	j	217c <_vfprintf_r+0x240>
    25a4:	01000593          	li	a1,16
    25a8:	0a412603          	lw	a2,164(sp)
    25ac:	0000db17          	auipc	s6,0xd
    25b0:	080b0b13          	add	s6,s6,128 # f62c <blanks.1>
    25b4:	0ae5dc63          	bge	a1,a4,266c <_vfprintf_r+0x730>
    25b8:	00040793          	mv	a5,s0
    25bc:	00048693          	mv	a3,s1
    25c0:	01000893          	li	a7,16
    25c4:	000b0493          	mv	s1,s6
    25c8:	00700393          	li	t2,7
    25cc:	000a0b13          	mv	s6,s4
    25d0:	04512223          	sw	t0,68(sp)
    25d4:	05f12823          	sw	t6,80(sp)
    25d8:	05d12a23          	sw	t4,84(sp)
    25dc:	05c12c23          	sw	t3,88(sp)
    25e0:	00070413          	mv	s0,a4
    25e4:	00030a13          	mv	s4,t1
    25e8:	00c0006f          	j	25f4 <_vfprintf_r+0x6b8>
    25ec:	ff040413          	add	s0,s0,-16
    25f0:	0488da63          	bge	a7,s0,2644 <_vfprintf_r+0x708>
    25f4:	01068693          	add	a3,a3,16
    25f8:	00160613          	add	a2,a2,1
    25fc:	0097a023          	sw	s1,0(a5)
    2600:	0117a223          	sw	a7,4(a5)
    2604:	0ad12423          	sw	a3,168(sp)
    2608:	0ac12223          	sw	a2,164(sp)
    260c:	00878793          	add	a5,a5,8
    2610:	fcc3dee3          	bge	t2,a2,25ec <_vfprintf_r+0x6b0>
    2614:	00812583          	lw	a1,8(sp)
    2618:	0a010613          	add	a2,sp,160
    261c:	00098513          	mv	a0,s3
    2620:	7d8020ef          	jal	4df8 <__sprint_r>
    2624:	de0514e3          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2628:	01000893          	li	a7,16
    262c:	ff040413          	add	s0,s0,-16
    2630:	0a812683          	lw	a3,168(sp)
    2634:	0a412603          	lw	a2,164(sp)
    2638:	0ac10793          	add	a5,sp,172
    263c:	00700393          	li	t2,7
    2640:	fa88cae3          	blt	a7,s0,25f4 <_vfprintf_r+0x6b8>
    2644:	04412283          	lw	t0,68(sp)
    2648:	05012f83          	lw	t6,80(sp)
    264c:	05412e83          	lw	t4,84(sp)
    2650:	05812e03          	lw	t3,88(sp)
    2654:	000a0313          	mv	t1,s4
    2658:	00040713          	mv	a4,s0
    265c:	000b0a13          	mv	s4,s6
    2660:	00078413          	mv	s0,a5
    2664:	00048b13          	mv	s6,s1
    2668:	00068493          	mv	s1,a3
    266c:	00e484b3          	add	s1,s1,a4
    2670:	00160613          	add	a2,a2,1
    2674:	00e42223          	sw	a4,4(s0)
    2678:	01642023          	sw	s6,0(s0)
    267c:	0a912423          	sw	s1,168(sp)
    2680:	0ac12223          	sw	a2,164(sp)
    2684:	00700713          	li	a4,7
    2688:	00c75463          	bge	a4,a2,2690 <_vfprintf_r+0x754>
    268c:	2380106f          	j	38c4 <_vfprintf_r+0x1988>
    2690:	07714603          	lbu	a2,119(sp)
    2694:	00840413          	add	s0,s0,8
    2698:	b05ff06f          	j	219c <_vfprintf_r+0x260>
    269c:	00812583          	lw	a1,8(sp)
    26a0:	0a010613          	add	a2,sp,160
    26a4:	00098513          	mv	a0,s3
    26a8:	04612e23          	sw	t1,92(sp)
    26ac:	05c12c23          	sw	t3,88(sp)
    26b0:	05d12a23          	sw	t4,84(sp)
    26b4:	05f12823          	sw	t6,80(sp)
    26b8:	04512223          	sw	t0,68(sp)
    26bc:	73c020ef          	jal	4df8 <__sprint_r>
    26c0:	d40516e3          	bnez	a0,240c <_vfprintf_r+0x4d0>
    26c4:	0a812483          	lw	s1,168(sp)
    26c8:	05c12303          	lw	t1,92(sp)
    26cc:	05812e03          	lw	t3,88(sp)
    26d0:	05412e83          	lw	t4,84(sp)
    26d4:	05012f83          	lw	t6,80(sp)
    26d8:	04412283          	lw	t0,68(sp)
    26dc:	0ac10413          	add	s0,sp,172
    26e0:	af1ff06f          	j	21d0 <_vfprintf_r+0x294>
    26e4:	0a412d03          	lw	s10,164(sp)
    26e8:	01812783          	lw	a5,24(sp)
    26ec:	00100693          	li	a3,1
    26f0:	01842023          	sw	s8,0(s0)
    26f4:	00148493          	add	s1,s1,1
    26f8:	001d0d13          	add	s10,s10,1
    26fc:	00840b13          	add	s6,s0,8
    2700:	32f6d0e3          	bge	a3,a5,3220 <_vfprintf_r+0x12e4>
    2704:	00100693          	li	a3,1
    2708:	00d42223          	sw	a3,4(s0)
    270c:	0a912423          	sw	s1,168(sp)
    2710:	0ba12223          	sw	s10,164(sp)
    2714:	00700693          	li	a3,7
    2718:	01a6d463          	bge	a3,s10,2720 <_vfprintf_r+0x7e4>
    271c:	0680106f          	j	3784 <_vfprintf_r+0x1848>
    2720:	03012783          	lw	a5,48(sp)
    2724:	03412703          	lw	a4,52(sp)
    2728:	001d0d13          	add	s10,s10,1
    272c:	00f484b3          	add	s1,s1,a5
    2730:	00eb2023          	sw	a4,0(s6)
    2734:	00fb2223          	sw	a5,4(s6)
    2738:	0a912423          	sw	s1,168(sp)
    273c:	0ba12223          	sw	s10,164(sp)
    2740:	00700693          	li	a3,7
    2744:	008b0b13          	add	s6,s6,8
    2748:	01a6d463          	bge	a3,s10,2750 <_vfprintf_r+0x814>
    274c:	0680106f          	j	37b4 <_vfprintf_r+0x1878>
    2750:	02812603          	lw	a2,40(sp)
    2754:	02c12683          	lw	a3,44(sp)
    2758:	01812783          	lw	a5,24(sp)
    275c:	00060513          	mv	a0,a2
    2760:	00068593          	mv	a1,a3
    2764:	00000613          	li	a2,0
    2768:	00000693          	li	a3,0
    276c:	03d12023          	sw	t4,32(sp)
    2770:	fff78413          	add	s0,a5,-1
    2774:	4c50a0ef          	jal	d438 <__eqdf2>
    2778:	02012e83          	lw	t4,32(sp)
    277c:	2e0506e3          	beqz	a0,3268 <_vfprintf_r+0x132c>
    2780:	001c0793          	add	a5,s8,1
    2784:	001d0d13          	add	s10,s10,1
    2788:	008484b3          	add	s1,s1,s0
    278c:	00fb2023          	sw	a5,0(s6)
    2790:	008b2223          	sw	s0,4(s6)
    2794:	0a912423          	sw	s1,168(sp)
    2798:	0ba12223          	sw	s10,164(sp)
    279c:	00700793          	li	a5,7
    27a0:	008b0b13          	add	s6,s6,8
    27a4:	29a7cce3          	blt	a5,s10,323c <_vfprintf_r+0x1300>
    27a8:	04012703          	lw	a4,64(sp)
    27ac:	08810793          	add	a5,sp,136
    27b0:	001d0d13          	add	s10,s10,1
    27b4:	009704b3          	add	s1,a4,s1
    27b8:	00fb2023          	sw	a5,0(s6)
    27bc:	00eb2223          	sw	a4,4(s6)
    27c0:	0a912423          	sw	s1,168(sp)
    27c4:	0ba12223          	sw	s10,164(sp)
    27c8:	00700793          	li	a5,7
    27cc:	008b0413          	add	s0,s6,8
    27d0:	a7a7dae3          	bge	a5,s10,2244 <_vfprintf_r+0x308>
    27d4:	00812583          	lw	a1,8(sp)
    27d8:	0a010613          	add	a2,sp,160
    27dc:	00098513          	mv	a0,s3
    27e0:	03d12023          	sw	t4,32(sp)
    27e4:	614020ef          	jal	4df8 <__sprint_r>
    27e8:	c20512e3          	bnez	a0,240c <_vfprintf_r+0x4d0>
    27ec:	0a812483          	lw	s1,168(sp)
    27f0:	02012e83          	lw	t4,32(sp)
    27f4:	0ac10413          	add	s0,sp,172
    27f8:	a4dff06f          	j	2244 <_vfprintf_r+0x308>
    27fc:	2007f713          	and	a4,a5,512
    2800:	c2071ce3          	bnez	a4,2438 <_vfprintf_r+0x4fc>
    2804:	00812403          	lw	s0,8(sp)
    2808:	05842503          	lw	a0,88(s0)
    280c:	fd8fe0ef          	jal	fe4 <__retarget_lock_release_recursive>
    2810:	00c41783          	lh	a5,12(s0)
    2814:	c25ff06f          	j	2438 <_vfprintf_r+0x4fc>
    2818:	00094e03          	lbu	t3,0(s2)
    281c:	020a6a13          	or	s4,s4,32
    2820:	8cdff06f          	j	20ec <_vfprintf_r+0x1b0>
    2824:	01412703          	lw	a4,20(sp)
    2828:	04300793          	li	a5,67
    282c:	000a0e93          	mv	t4,s4
    2830:	00470493          	add	s1,a4,4
    2834:	64fe08e3          	beq	t3,a5,3684 <_vfprintf_r+0x1748>
    2838:	010a7793          	and	a5,s4,16
    283c:	640794e3          	bnez	a5,3684 <_vfprintf_r+0x1748>
    2840:	01412783          	lw	a5,20(sp)
    2844:	00100c93          	li	s9,1
    2848:	00100d13          	li	s10,1
    284c:	0007a783          	lw	a5,0(a5)
    2850:	0ec10c13          	add	s8,sp,236
    2854:	0ef10623          	sb	a5,236(sp)
    2858:	06010ba3          	sb	zero,119(sp)
    285c:	00912a23          	sw	s1,20(sp)
    2860:	00000613          	li	a2,0
    2864:	00012823          	sw	zero,16(sp)
    2868:	00000313          	li	t1,0
    286c:	02012223          	sw	zero,36(sp)
    2870:	02012023          	sw	zero,32(sp)
    2874:	00000a13          	li	s4,0
    2878:	905ff06f          	j	217c <_vfprintf_r+0x240>
    287c:	01412783          	lw	a5,20(sp)
    2880:	06010ba3          	sb	zero,119(sp)
    2884:	000b0313          	mv	t1,s6
    2888:	0007ac03          	lw	s8,0(a5)
    288c:	000a0e93          	mv	t4,s4
    2890:	00478b13          	add	s6,a5,4
    2894:	5a0c0ce3          	beqz	s8,364c <_vfprintf_r+0x1710>
    2898:	05300713          	li	a4,83
    289c:	00ee1463          	bne	t3,a4,28a4 <_vfprintf_r+0x968>
    28a0:	1d00106f          	j	3a70 <_vfprintf_r+0x1b34>
    28a4:	010a7a13          	and	s4,s4,16
    28a8:	000a0463          	beqz	s4,28b0 <_vfprintf_r+0x974>
    28ac:	1c40106f          	j	3a70 <_vfprintf_r+0x1b34>
    28b0:	00035463          	bgez	t1,28b8 <_vfprintf_r+0x97c>
    28b4:	6d40106f          	j	3f88 <_vfprintf_r+0x204c>
    28b8:	00030613          	mv	a2,t1
    28bc:	00000593          	li	a1,0
    28c0:	000c0513          	mv	a0,s8
    28c4:	03d12023          	sw	t4,32(sp)
    28c8:	00612a23          	sw	t1,20(sp)
    28cc:	0ec050ef          	jal	79b8 <memchr>
    28d0:	00a12823          	sw	a0,16(sp)
    28d4:	01412303          	lw	t1,20(sp)
    28d8:	02012e83          	lw	t4,32(sp)
    28dc:	00051463          	bnez	a0,28e4 <_vfprintf_r+0x9a8>
    28e0:	1780206f          	j	4a58 <_vfprintf_r+0x2b1c>
    28e4:	01012783          	lw	a5,16(sp)
    28e8:	07714603          	lbu	a2,119(sp)
    28ec:	01612a23          	sw	s6,20(sp)
    28f0:	41878d33          	sub	s10,a5,s8
    28f4:	fffd4813          	not	a6,s10
    28f8:	41f85813          	sra	a6,a6,0x1f
    28fc:	02012223          	sw	zero,36(sp)
    2900:	02012023          	sw	zero,32(sp)
    2904:	00012823          	sw	zero,16(sp)
    2908:	010d7cb3          	and	s9,s10,a6
    290c:	00000313          	li	t1,0
    2910:	07300e13          	li	t3,115
    2914:	860604e3          	beqz	a2,217c <_vfprintf_r+0x240>
    2918:	c85ff06f          	j	259c <_vfprintf_r+0x660>
    291c:	01412783          	lw	a5,20(sp)
    2920:	0007ab83          	lw	s7,0(a5)
    2924:	00478793          	add	a5,a5,4
    2928:	2a0bdae3          	bgez	s7,33dc <_vfprintf_r+0x14a0>
    292c:	41700bb3          	neg	s7,s7
    2930:	00f12a23          	sw	a5,20(sp)
    2934:	00094e03          	lbu	t3,0(s2)
    2938:	004a6a13          	or	s4,s4,4
    293c:	fb0ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2940:	02b00793          	li	a5,43
    2944:	00094e03          	lbu	t3,0(s2)
    2948:	06f10ba3          	sb	a5,119(sp)
    294c:	fa0ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2950:	000b0313          	mv	t1,s6
    2954:	010a6613          	or	a2,s4,16
    2958:	02067793          	and	a5,a2,32
    295c:	1c0780e3          	beqz	a5,331c <_vfprintf_r+0x13e0>
    2960:	01412783          	lw	a5,20(sp)
    2964:	00778b13          	add	s6,a5,7
    2968:	ff8b7b13          	and	s6,s6,-8
    296c:	000b2d03          	lw	s10,0(s6)
    2970:	004b2c83          	lw	s9,4(s6)
    2974:	008b0793          	add	a5,s6,8
    2978:	00f12a23          	sw	a5,20(sp)
    297c:	00100793          	li	a5,1
    2980:	00000713          	li	a4,0
    2984:	06e10ba3          	sb	a4,119(sp)
    2988:	34034c63          	bltz	t1,2ce0 <_vfprintf_r+0xda4>
    298c:	019d6733          	or	a4,s10,s9
    2990:	f7f67e93          	and	t4,a2,-129
    2994:	34071463          	bnez	a4,2cdc <_vfprintf_r+0xda0>
    2998:	3a031a63          	bnez	t1,2d4c <_vfprintf_r+0xe10>
    299c:	5c079ee3          	bnez	a5,3778 <_vfprintf_r+0x183c>
    29a0:	00167d13          	and	s10,a2,1
    29a4:	15010c13          	add	s8,sp,336
    29a8:	2c0d10e3          	bnez	s10,3468 <_vfprintf_r+0x152c>
    29ac:	07714603          	lbu	a2,119(sp)
    29b0:	00030c93          	mv	s9,t1
    29b4:	01a35463          	bge	t1,s10,29bc <_vfprintf_r+0xa80>
    29b8:	000d0c93          	mv	s9,s10
    29bc:	00012823          	sw	zero,16(sp)
    29c0:	02012223          	sw	zero,36(sp)
    29c4:	02012023          	sw	zero,32(sp)
    29c8:	00000a13          	li	s4,0
    29cc:	fa060863          	beqz	a2,217c <_vfprintf_r+0x240>
    29d0:	bcdff06f          	j	259c <_vfprintf_r+0x660>
    29d4:	00094e03          	lbu	t3,0(s2)
    29d8:	080a6a13          	or	s4,s4,128
    29dc:	f10ff06f          	j	20ec <_vfprintf_r+0x1b0>
    29e0:	00094e03          	lbu	t3,0(s2)
    29e4:	02a00793          	li	a5,42
    29e8:	00190693          	add	a3,s2,1
    29ec:	00fe1463          	bne	t3,a5,29f4 <_vfprintf_r+0xab8>
    29f0:	1100206f          	j	4b00 <_vfprintf_r+0x2bc4>
    29f4:	fd0e0713          	add	a4,t3,-48
    29f8:	00900793          	li	a5,9
    29fc:	00000b13          	li	s6,0
    2a00:	00900613          	li	a2,9
    2a04:	02e7e463          	bltu	a5,a4,2a2c <_vfprintf_r+0xaf0>
    2a08:	0006ce03          	lbu	t3,0(a3)
    2a0c:	002b1793          	sll	a5,s6,0x2
    2a10:	016787b3          	add	a5,a5,s6
    2a14:	00179793          	sll	a5,a5,0x1
    2a18:	00e78b33          	add	s6,a5,a4
    2a1c:	fd0e0713          	add	a4,t3,-48
    2a20:	00168693          	add	a3,a3,1
    2a24:	fee672e3          	bgeu	a2,a4,2a08 <_vfprintf_r+0xacc>
    2a28:	320b4ce3          	bltz	s6,3560 <_vfprintf_r+0x1624>
    2a2c:	00068913          	mv	s2,a3
    2a30:	ec0ff06f          	j	20f0 <_vfprintf_r+0x1b4>
    2a34:	00094e03          	lbu	t3,0(s2)
    2a38:	001a6a13          	or	s4,s4,1
    2a3c:	eb0ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2a40:	07714783          	lbu	a5,119(sp)
    2a44:	00094e03          	lbu	t3,0(s2)
    2a48:	ea079263          	bnez	a5,20ec <_vfprintf_r+0x1b0>
    2a4c:	02000793          	li	a5,32
    2a50:	06f10ba3          	sb	a5,119(sp)
    2a54:	e98ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2a58:	00094e03          	lbu	t3,0(s2)
    2a5c:	06c00793          	li	a5,108
    2a60:	3afe00e3          	beq	t3,a5,3600 <_vfprintf_r+0x16c4>
    2a64:	010a6a13          	or	s4,s4,16
    2a68:	e84ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2a6c:	00094e03          	lbu	t3,0(s2)
    2a70:	008a6a13          	or	s4,s4,8
    2a74:	e78ff06f          	j	20ec <_vfprintf_r+0x1b0>
    2a78:	000b0313          	mv	t1,s6
    2a7c:	010a6e93          	or	t4,s4,16
    2a80:	020ef793          	and	a5,t4,32
    2a84:	0c0786e3          	beqz	a5,3350 <_vfprintf_r+0x1414>
    2a88:	01412783          	lw	a5,20(sp)
    2a8c:	00778b13          	add	s6,a5,7
    2a90:	ff8b7b13          	and	s6,s6,-8
    2a94:	004b2783          	lw	a5,4(s6)
    2a98:	000b2d03          	lw	s10,0(s6)
    2a9c:	008b0713          	add	a4,s6,8
    2aa0:	00e12a23          	sw	a4,20(sp)
    2aa4:	00078c93          	mv	s9,a5
    2aa8:	0c07cee3          	bltz	a5,3384 <_vfprintf_r+0x1448>
    2aac:	000e8613          	mv	a2,t4
    2ab0:	02034263          	bltz	t1,2ad4 <_vfprintf_r+0xb98>
    2ab4:	019d67b3          	or	a5,s10,s9
    2ab8:	f7fef613          	and	a2,t4,-129
    2abc:	00079c63          	bnez	a5,2ad4 <_vfprintf_r+0xb98>
    2ac0:	02031063          	bnez	t1,2ae0 <_vfprintf_r+0xba4>
    2ac4:	00000d13          	li	s10,0
    2ac8:	00060e93          	mv	t4,a2
    2acc:	15010c13          	add	s8,sp,336
    2ad0:	eddff06f          	j	29ac <_vfprintf_r+0xa70>
    2ad4:	520c90e3          	bnez	s9,37f4 <_vfprintf_r+0x18b8>
    2ad8:	00900793          	li	a5,9
    2adc:	51a7ece3          	bltu	a5,s10,37f4 <_vfprintf_r+0x18b8>
    2ae0:	030d0d13          	add	s10,s10,48
    2ae4:	15a107a3          	sb	s10,335(sp)
    2ae8:	00060e93          	mv	t4,a2
    2aec:	00100d13          	li	s10,1
    2af0:	14f10c13          	add	s8,sp,335
    2af4:	eb9ff06f          	j	29ac <_vfprintf_r+0xa70>
    2af8:	000b0313          	mv	t1,s6
    2afc:	010a6e93          	or	t4,s4,16
    2b00:	020ef793          	and	a5,t4,32
    2b04:	7e078463          	beqz	a5,32ec <_vfprintf_r+0x13b0>
    2b08:	01412783          	lw	a5,20(sp)
    2b0c:	00778b13          	add	s6,a5,7
    2b10:	ff8b7b13          	and	s6,s6,-8
    2b14:	000b2d03          	lw	s10,0(s6)
    2b18:	004b2c83          	lw	s9,4(s6)
    2b1c:	008b0793          	add	a5,s6,8
    2b20:	00f12a23          	sw	a5,20(sp)
    2b24:	bffef613          	and	a2,t4,-1025
    2b28:	00000793          	li	a5,0
    2b2c:	e55ff06f          	j	2980 <_vfprintf_r+0xa44>
    2b30:	00094e03          	lbu	t3,0(s2)
    2b34:	06800793          	li	a5,104
    2b38:	2cfe0ce3          	beq	t3,a5,3610 <_vfprintf_r+0x16d4>
    2b3c:	040a6a13          	or	s4,s4,64
    2b40:	dacff06f          	j	20ec <_vfprintf_r+0x1b0>
    2b44:	01412703          	lw	a4,20(sp)
    2b48:	000087b7          	lui	a5,0x8
    2b4c:	83078793          	add	a5,a5,-2000 # 7830 <__fputwc+0xa4>
    2b50:	06f11c23          	sh	a5,120(sp)
    2b54:	00470793          	add	a5,a4,4
    2b58:	00f12a23          	sw	a5,20(sp)
    2b5c:	0000c797          	auipc	a5,0xc
    2b60:	5d878793          	add	a5,a5,1496 # f134 <__fini_array_end+0x1a8>
    2b64:	02f12c23          	sw	a5,56(sp)
    2b68:	00072d03          	lw	s10,0(a4)
    2b6c:	000b0313          	mv	t1,s6
    2b70:	00000c93          	li	s9,0
    2b74:	002a6613          	or	a2,s4,2
    2b78:	00200793          	li	a5,2
    2b7c:	07800e13          	li	t3,120
    2b80:	e01ff06f          	j	2980 <_vfprintf_r+0xa44>
    2b84:	020a7793          	and	a5,s4,32
    2b88:	180784e3          	beqz	a5,3510 <_vfprintf_r+0x15d4>
    2b8c:	01412783          	lw	a5,20(sp)
    2b90:	00c12683          	lw	a3,12(sp)
    2b94:	0007a783          	lw	a5,0(a5)
    2b98:	41f6d713          	sra	a4,a3,0x1f
    2b9c:	00d7a023          	sw	a3,0(a5)
    2ba0:	00e7a223          	sw	a4,4(a5)
    2ba4:	01412783          	lw	a5,20(sp)
    2ba8:	00090c13          	mv	s8,s2
    2bac:	00478793          	add	a5,a5,4
    2bb0:	00f12a23          	sw	a5,20(sp)
    2bb4:	cccff06f          	j	2080 <_vfprintf_r+0x144>
    2bb8:	06500713          	li	a4,101
    2bbc:	b3c754e3          	bge	a4,t3,26e4 <_vfprintf_r+0x7a8>
    2bc0:	02812683          	lw	a3,40(sp)
    2bc4:	02c12703          	lw	a4,44(sp)
    2bc8:	00000613          	li	a2,0
    2bcc:	00068513          	mv	a0,a3
    2bd0:	00070593          	mv	a1,a4
    2bd4:	00000693          	li	a3,0
    2bd8:	05d12223          	sw	t4,68(sp)
    2bdc:	05d0a0ef          	jal	d438 <__eqdf2>
    2be0:	04412e83          	lw	t4,68(sp)
    2be4:	4e051463          	bnez	a0,30cc <_vfprintf_r+0x1190>
    2be8:	0a412783          	lw	a5,164(sp)
    2bec:	0000c717          	auipc	a4,0xc
    2bf0:	57870713          	add	a4,a4,1400 # f164 <__fini_array_end+0x1d8>
    2bf4:	00e42023          	sw	a4,0(s0)
    2bf8:	00148493          	add	s1,s1,1
    2bfc:	00100713          	li	a4,1
    2c00:	00178793          	add	a5,a5,1
    2c04:	00e42223          	sw	a4,4(s0)
    2c08:	0a912423          	sw	s1,168(sp)
    2c0c:	0af12223          	sw	a5,164(sp)
    2c10:	00700713          	li	a4,7
    2c14:	00840413          	add	s0,s0,8
    2c18:	62f746e3          	blt	a4,a5,3a44 <_vfprintf_r+0x1b08>
    2c1c:	07c12783          	lw	a5,124(sp)
    2c20:	01812703          	lw	a4,24(sp)
    2c24:	78e7de63          	bge	a5,a4,33c0 <_vfprintf_r+0x1484>
    2c28:	03412783          	lw	a5,52(sp)
    2c2c:	03012703          	lw	a4,48(sp)
    2c30:	00840413          	add	s0,s0,8
    2c34:	fef42c23          	sw	a5,-8(s0)
    2c38:	0a412783          	lw	a5,164(sp)
    2c3c:	00e484b3          	add	s1,s1,a4
    2c40:	fee42e23          	sw	a4,-4(s0)
    2c44:	00178793          	add	a5,a5,1
    2c48:	0a912423          	sw	s1,168(sp)
    2c4c:	0af12223          	sw	a5,164(sp)
    2c50:	00700713          	li	a4,7
    2c54:	1cf746e3          	blt	a4,a5,3620 <_vfprintf_r+0x16e4>
    2c58:	01812783          	lw	a5,24(sp)
    2c5c:	fff78d13          	add	s10,a5,-1
    2c60:	dfa05263          	blez	s10,2244 <_vfprintf_r+0x308>
    2c64:	01000713          	li	a4,16
    2c68:	0a412783          	lw	a5,164(sp)
    2c6c:	0000d297          	auipc	t0,0xd
    2c70:	9b028293          	add	t0,t0,-1616 # f61c <zeroes.0>
    2c74:	77a752e3          	bge	a4,s10,3bd8 <_vfprintf_r+0x1c9c>
    2c78:	00048713          	mv	a4,s1
    2c7c:	01000c13          	li	s8,16
    2c80:	00700b13          	li	s6,7
    2c84:	000e8493          	mv	s1,t4
    2c88:	00028a13          	mv	s4,t0
    2c8c:	00c0006f          	j	2c98 <_vfprintf_r+0xd5c>
    2c90:	ff0d0d13          	add	s10,s10,-16
    2c94:	73ac5ce3          	bge	s8,s10,3bcc <_vfprintf_r+0x1c90>
    2c98:	01070713          	add	a4,a4,16
    2c9c:	00178793          	add	a5,a5,1
    2ca0:	01442023          	sw	s4,0(s0)
    2ca4:	01842223          	sw	s8,4(s0)
    2ca8:	0ae12423          	sw	a4,168(sp)
    2cac:	0af12223          	sw	a5,164(sp)
    2cb0:	00840413          	add	s0,s0,8
    2cb4:	fcfb5ee3          	bge	s6,a5,2c90 <_vfprintf_r+0xd54>
    2cb8:	00812583          	lw	a1,8(sp)
    2cbc:	0a010613          	add	a2,sp,160
    2cc0:	00098513          	mv	a0,s3
    2cc4:	134020ef          	jal	4df8 <__sprint_r>
    2cc8:	f4051263          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2ccc:	0a812703          	lw	a4,168(sp)
    2cd0:	0a412783          	lw	a5,164(sp)
    2cd4:	0ac10413          	add	s0,sp,172
    2cd8:	fb9ff06f          	j	2c90 <_vfprintf_r+0xd54>
    2cdc:	000e8613          	mv	a2,t4
    2ce0:	00100713          	li	a4,1
    2ce4:	dee788e3          	beq	a5,a4,2ad4 <_vfprintf_r+0xb98>
    2ce8:	00200713          	li	a4,2
    2cec:	06e78c63          	beq	a5,a4,2d64 <_vfprintf_r+0xe28>
    2cf0:	15010c13          	add	s8,sp,336
    2cf4:	01dc9793          	sll	a5,s9,0x1d
    2cf8:	007d7713          	and	a4,s10,7
    2cfc:	003d5d13          	srl	s10,s10,0x3
    2d00:	03070713          	add	a4,a4,48
    2d04:	01a7ed33          	or	s10,a5,s10
    2d08:	003cdc93          	srl	s9,s9,0x3
    2d0c:	feec0fa3          	sb	a4,-1(s8)
    2d10:	019d67b3          	or	a5,s10,s9
    2d14:	000c0593          	mv	a1,s8
    2d18:	fffc0c13          	add	s8,s8,-1
    2d1c:	fc079ce3          	bnez	a5,2cf4 <_vfprintf_r+0xdb8>
    2d20:	00167693          	and	a3,a2,1
    2d24:	06068a63          	beqz	a3,2d98 <_vfprintf_r+0xe5c>
    2d28:	03000693          	li	a3,48
    2d2c:	06d70663          	beq	a4,a3,2d98 <_vfprintf_r+0xe5c>
    2d30:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0xc2>
    2d34:	15010793          	add	a5,sp,336
    2d38:	fedc0fa3          	sb	a3,-1(s8)
    2d3c:	40b78d33          	sub	s10,a5,a1
    2d40:	00060e93          	mv	t4,a2
    2d44:	00058c13          	mv	s8,a1
    2d48:	c65ff06f          	j	29ac <_vfprintf_r+0xa70>
    2d4c:	00100713          	li	a4,1
    2d50:	00e79463          	bne	a5,a4,2d58 <_vfprintf_r+0xe1c>
    2d54:	2b10106f          	j	4804 <_vfprintf_r+0x28c8>
    2d58:	00200713          	li	a4,2
    2d5c:	000e8613          	mv	a2,t4
    2d60:	f8e798e3          	bne	a5,a4,2cf0 <_vfprintf_r+0xdb4>
    2d64:	03812683          	lw	a3,56(sp)
    2d68:	15010c13          	add	s8,sp,336
    2d6c:	00fd7793          	and	a5,s10,15
    2d70:	00f687b3          	add	a5,a3,a5
    2d74:	0007c703          	lbu	a4,0(a5)
    2d78:	004d5d13          	srl	s10,s10,0x4
    2d7c:	01cc9793          	sll	a5,s9,0x1c
    2d80:	01a7ed33          	or	s10,a5,s10
    2d84:	004cdc93          	srl	s9,s9,0x4
    2d88:	feec0fa3          	sb	a4,-1(s8)
    2d8c:	019d67b3          	or	a5,s10,s9
    2d90:	fffc0c13          	add	s8,s8,-1
    2d94:	fc079ce3          	bnez	a5,2d6c <_vfprintf_r+0xe30>
    2d98:	15010793          	add	a5,sp,336
    2d9c:	41878d33          	sub	s10,a5,s8
    2da0:	00060e93          	mv	t4,a2
    2da4:	c09ff06f          	j	29ac <_vfprintf_r+0xa70>
    2da8:	419b8b33          	sub	s6,s7,s9
    2dac:	c7605063          	blez	s6,220c <_vfprintf_r+0x2d0>
    2db0:	01000593          	li	a1,16
    2db4:	0a412603          	lw	a2,164(sp)
    2db8:	0000d297          	auipc	t0,0xd
    2dbc:	86428293          	add	t0,t0,-1948 # f61c <zeroes.0>
    2dc0:	0b65d463          	bge	a1,s6,2e68 <_vfprintf_r+0xf2c>
    2dc4:	00040793          	mv	a5,s0
    2dc8:	00048713          	mv	a4,s1
    2dcc:	000b0413          	mv	s0,s6
    2dd0:	01000893          	li	a7,16
    2dd4:	000a0b13          	mv	s6,s4
    2dd8:	00700f93          	li	t6,7
    2ddc:	05d12223          	sw	t4,68(sp)
    2de0:	05c12823          	sw	t3,80(sp)
    2de4:	00030a13          	mv	s4,t1
    2de8:	00028493          	mv	s1,t0
    2dec:	00c0006f          	j	2df8 <_vfprintf_r+0xebc>
    2df0:	ff040413          	add	s0,s0,-16
    2df4:	0488da63          	bge	a7,s0,2e48 <_vfprintf_r+0xf0c>
    2df8:	01070713          	add	a4,a4,16
    2dfc:	00160613          	add	a2,a2,1
    2e00:	0097a023          	sw	s1,0(a5)
    2e04:	0117a223          	sw	a7,4(a5)
    2e08:	0ae12423          	sw	a4,168(sp)
    2e0c:	0ac12223          	sw	a2,164(sp)
    2e10:	00878793          	add	a5,a5,8
    2e14:	fccfdee3          	bge	t6,a2,2df0 <_vfprintf_r+0xeb4>
    2e18:	00812583          	lw	a1,8(sp)
    2e1c:	0a010613          	add	a2,sp,160
    2e20:	00098513          	mv	a0,s3
    2e24:	7d5010ef          	jal	4df8 <__sprint_r>
    2e28:	de051263          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2e2c:	01000893          	li	a7,16
    2e30:	ff040413          	add	s0,s0,-16
    2e34:	0a812703          	lw	a4,168(sp)
    2e38:	0a412603          	lw	a2,164(sp)
    2e3c:	0ac10793          	add	a5,sp,172
    2e40:	00700f93          	li	t6,7
    2e44:	fa88cae3          	blt	a7,s0,2df8 <_vfprintf_r+0xebc>
    2e48:	04412e83          	lw	t4,68(sp)
    2e4c:	05012e03          	lw	t3,80(sp)
    2e50:	000a0313          	mv	t1,s4
    2e54:	00048293          	mv	t0,s1
    2e58:	000b0a13          	mv	s4,s6
    2e5c:	00070493          	mv	s1,a4
    2e60:	00040b13          	mv	s6,s0
    2e64:	00078413          	mv	s0,a5
    2e68:	016484b3          	add	s1,s1,s6
    2e6c:	00160613          	add	a2,a2,1
    2e70:	00542023          	sw	t0,0(s0)
    2e74:	01642223          	sw	s6,4(s0)
    2e78:	0a912423          	sw	s1,168(sp)
    2e7c:	0ac12223          	sw	a2,164(sp)
    2e80:	00700713          	li	a4,7
    2e84:	00840413          	add	s0,s0,8
    2e88:	b8c75263          	bge	a4,a2,220c <_vfprintf_r+0x2d0>
    2e8c:	00812583          	lw	a1,8(sp)
    2e90:	0a010613          	add	a2,sp,160
    2e94:	00098513          	mv	a0,s3
    2e98:	04612a23          	sw	t1,84(sp)
    2e9c:	05c12823          	sw	t3,80(sp)
    2ea0:	05d12223          	sw	t4,68(sp)
    2ea4:	755010ef          	jal	4df8 <__sprint_r>
    2ea8:	d6051263          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2eac:	0a812483          	lw	s1,168(sp)
    2eb0:	05412303          	lw	t1,84(sp)
    2eb4:	05012e03          	lw	t3,80(sp)
    2eb8:	04412e83          	lw	t4,68(sp)
    2ebc:	0ac10413          	add	s0,sp,172
    2ec0:	b4cff06f          	j	220c <_vfprintf_r+0x2d0>
    2ec4:	01000713          	li	a4,16
    2ec8:	0a412603          	lw	a2,164(sp)
    2ecc:	0000c297          	auipc	t0,0xc
    2ed0:	75028293          	add	t0,t0,1872 # f61c <zeroes.0>
    2ed4:	0b675063          	bge	a4,s6,2f74 <_vfprintf_r+0x1038>
    2ed8:	00040793          	mv	a5,s0
    2edc:	00048693          	mv	a3,s1
    2ee0:	000b0413          	mv	s0,s6
    2ee4:	01000713          	li	a4,16
    2ee8:	00700893          	li	a7,7
    2eec:	05d12223          	sw	t4,68(sp)
    2ef0:	000e0493          	mv	s1,t3
    2ef4:	00028b13          	mv	s6,t0
    2ef8:	00c0006f          	j	2f04 <_vfprintf_r+0xfc8>
    2efc:	ff040413          	add	s0,s0,-16
    2f00:	04875e63          	bge	a4,s0,2f5c <_vfprintf_r+0x1020>
    2f04:	01068693          	add	a3,a3,16
    2f08:	00160613          	add	a2,a2,1
    2f0c:	0000c597          	auipc	a1,0xc
    2f10:	71058593          	add	a1,a1,1808 # f61c <zeroes.0>
    2f14:	00b7a023          	sw	a1,0(a5)
    2f18:	00e7a223          	sw	a4,4(a5)
    2f1c:	0ad12423          	sw	a3,168(sp)
    2f20:	0ac12223          	sw	a2,164(sp)
    2f24:	00878793          	add	a5,a5,8
    2f28:	fcc8dae3          	bge	a7,a2,2efc <_vfprintf_r+0xfc0>
    2f2c:	00812583          	lw	a1,8(sp)
    2f30:	0a010613          	add	a2,sp,160
    2f34:	00098513          	mv	a0,s3
    2f38:	6c1010ef          	jal	4df8 <__sprint_r>
    2f3c:	cc051863          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2f40:	01000713          	li	a4,16
    2f44:	ff040413          	add	s0,s0,-16
    2f48:	0a812683          	lw	a3,168(sp)
    2f4c:	0a412603          	lw	a2,164(sp)
    2f50:	0ac10793          	add	a5,sp,172
    2f54:	00700893          	li	a7,7
    2f58:	fa8746e3          	blt	a4,s0,2f04 <_vfprintf_r+0xfc8>
    2f5c:	04412e83          	lw	t4,68(sp)
    2f60:	00048e13          	mv	t3,s1
    2f64:	000b0293          	mv	t0,s6
    2f68:	00068493          	mv	s1,a3
    2f6c:	00040b13          	mv	s6,s0
    2f70:	00078413          	mv	s0,a5
    2f74:	016484b3          	add	s1,s1,s6
    2f78:	00160613          	add	a2,a2,1
    2f7c:	00542023          	sw	t0,0(s0)
    2f80:	01642223          	sw	s6,4(s0)
    2f84:	0a912423          	sw	s1,168(sp)
    2f88:	0ac12223          	sw	a2,164(sp)
    2f8c:	00700713          	li	a4,7
    2f90:	00840413          	add	s0,s0,8
    2f94:	a8c75063          	bge	a4,a2,2214 <_vfprintf_r+0x2d8>
    2f98:	00812583          	lw	a1,8(sp)
    2f9c:	0a010613          	add	a2,sp,160
    2fa0:	00098513          	mv	a0,s3
    2fa4:	05c12823          	sw	t3,80(sp)
    2fa8:	05d12223          	sw	t4,68(sp)
    2fac:	64d010ef          	jal	4df8 <__sprint_r>
    2fb0:	c4051e63          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2fb4:	0a812483          	lw	s1,168(sp)
    2fb8:	05012e03          	lw	t3,80(sp)
    2fbc:	04412e83          	lw	t4,68(sp)
    2fc0:	0ac10413          	add	s0,sp,172
    2fc4:	a50ff06f          	j	2214 <_vfprintf_r+0x2d8>
    2fc8:	00812583          	lw	a1,8(sp)
    2fcc:	0a010613          	add	a2,sp,160
    2fd0:	00098513          	mv	a0,s3
    2fd4:	04612c23          	sw	t1,88(sp)
    2fd8:	05c12a23          	sw	t3,84(sp)
    2fdc:	05d12823          	sw	t4,80(sp)
    2fe0:	05f12223          	sw	t6,68(sp)
    2fe4:	615010ef          	jal	4df8 <__sprint_r>
    2fe8:	c2051263          	bnez	a0,240c <_vfprintf_r+0x4d0>
    2fec:	0a812483          	lw	s1,168(sp)
    2ff0:	05812303          	lw	t1,88(sp)
    2ff4:	05412e03          	lw	t3,84(sp)
    2ff8:	05012e83          	lw	t4,80(sp)
    2ffc:	04412f83          	lw	t6,68(sp)
    3000:	0ac10413          	add	s0,sp,172
    3004:	a00ff06f          	j	2204 <_vfprintf_r+0x2c8>
    3008:	01000713          	li	a4,16
    300c:	0a412783          	lw	a5,164(sp)
    3010:	0000cb17          	auipc	s6,0xc
    3014:	61cb0b13          	add	s6,s6,1564 # f62c <blanks.1>
    3018:	07a75c63          	bge	a4,s10,3090 <_vfprintf_r+0x1154>
    301c:	000b0713          	mv	a4,s6
    3020:	01000c13          	li	s8,16
    3024:	00090b13          	mv	s6,s2
    3028:	00700a13          	li	s4,7
    302c:	00070913          	mv	s2,a4
    3030:	00c0006f          	j	303c <_vfprintf_r+0x1100>
    3034:	ff0d0d13          	add	s10,s10,-16
    3038:	05ac5663          	bge	s8,s10,3084 <_vfprintf_r+0x1148>
    303c:	01048493          	add	s1,s1,16
    3040:	00178793          	add	a5,a5,1
    3044:	01242023          	sw	s2,0(s0)
    3048:	01842223          	sw	s8,4(s0)
    304c:	0a912423          	sw	s1,168(sp)
    3050:	0af12223          	sw	a5,164(sp)
    3054:	00840413          	add	s0,s0,8
    3058:	fcfa5ee3          	bge	s4,a5,3034 <_vfprintf_r+0x10f8>
    305c:	00812583          	lw	a1,8(sp)
    3060:	0a010613          	add	a2,sp,160
    3064:	00098513          	mv	a0,s3
    3068:	591010ef          	jal	4df8 <__sprint_r>
    306c:	ba051063          	bnez	a0,240c <_vfprintf_r+0x4d0>
    3070:	ff0d0d13          	add	s10,s10,-16
    3074:	0a812483          	lw	s1,168(sp)
    3078:	0a412783          	lw	a5,164(sp)
    307c:	0ac10413          	add	s0,sp,172
    3080:	fbac4ee3          	blt	s8,s10,303c <_vfprintf_r+0x1100>
    3084:	00090713          	mv	a4,s2
    3088:	000b0913          	mv	s2,s6
    308c:	00070b13          	mv	s6,a4
    3090:	01a484b3          	add	s1,s1,s10
    3094:	00178793          	add	a5,a5,1
    3098:	01642023          	sw	s6,0(s0)
    309c:	01a42223          	sw	s10,4(s0)
    30a0:	0a912423          	sw	s1,168(sp)
    30a4:	0af12223          	sw	a5,164(sp)
    30a8:	00700713          	li	a4,7
    30ac:	9af75463          	bge	a4,a5,2254 <_vfprintf_r+0x318>
    30b0:	00812583          	lw	a1,8(sp)
    30b4:	0a010613          	add	a2,sp,160
    30b8:	00098513          	mv	a0,s3
    30bc:	53d010ef          	jal	4df8 <__sprint_r>
    30c0:	b4051663          	bnez	a0,240c <_vfprintf_r+0x4d0>
    30c4:	0a812483          	lw	s1,168(sp)
    30c8:	98cff06f          	j	2254 <_vfprintf_r+0x318>
    30cc:	07c12683          	lw	a3,124(sp)
    30d0:	30d05c63          	blez	a3,33e8 <_vfprintf_r+0x14ac>
    30d4:	01812783          	lw	a5,24(sp)
    30d8:	000a0b13          	mv	s6,s4
    30dc:	0147d463          	bge	a5,s4,30e4 <_vfprintf_r+0x11a8>
    30e0:	00078b13          	mv	s6,a5
    30e4:	03605863          	blez	s6,3114 <_vfprintf_r+0x11d8>
    30e8:	0a412683          	lw	a3,164(sp)
    30ec:	016484b3          	add	s1,s1,s6
    30f0:	01842023          	sw	s8,0(s0)
    30f4:	00168693          	add	a3,a3,1
    30f8:	01642223          	sw	s6,4(s0)
    30fc:	0a912423          	sw	s1,168(sp)
    3100:	0ad12223          	sw	a3,164(sp)
    3104:	00700613          	li	a2,7
    3108:	00840413          	add	s0,s0,8
    310c:	00d65463          	bge	a2,a3,3114 <_vfprintf_r+0x11d8>
    3110:	5c40106f          	j	46d4 <_vfprintf_r+0x2798>
    3114:	fffb4693          	not	a3,s6
    3118:	41f6d693          	sra	a3,a3,0x1f
    311c:	00db7733          	and	a4,s6,a3
    3120:	40ea0b33          	sub	s6,s4,a4
    3124:	35604ae3          	bgtz	s6,3c78 <_vfprintf_r+0x1d3c>
    3128:	400ef713          	and	a4,t4,1024
    312c:	014c0333          	add	t1,s8,s4
    3130:	00070463          	beqz	a4,3138 <_vfprintf_r+0x11fc>
    3134:	2980106f          	j	43cc <_vfprintf_r+0x2490>
    3138:	07c12d03          	lw	s10,124(sp)
    313c:	01812783          	lw	a5,24(sp)
    3140:	5afd4063          	blt	s10,a5,36e0 <_vfprintf_r+0x17a4>
    3144:	001ef713          	and	a4,t4,1
    3148:	58071c63          	bnez	a4,36e0 <_vfprintf_r+0x17a4>
    314c:	01812703          	lw	a4,24(sp)
    3150:	00ec07b3          	add	a5,s8,a4
    3154:	41a70d33          	sub	s10,a4,s10
    3158:	40678b33          	sub	s6,a5,t1
    315c:	016d5463          	bge	s10,s6,3164 <_vfprintf_r+0x1228>
    3160:	000d0b13          	mv	s6,s10
    3164:	03605863          	blez	s6,3194 <_vfprintf_r+0x1258>
    3168:	0a412703          	lw	a4,164(sp)
    316c:	016484b3          	add	s1,s1,s6
    3170:	00642023          	sw	t1,0(s0)
    3174:	00170713          	add	a4,a4,1
    3178:	01642223          	sw	s6,4(s0)
    317c:	0a912423          	sw	s1,168(sp)
    3180:	0ae12223          	sw	a4,164(sp)
    3184:	00700693          	li	a3,7
    3188:	00840413          	add	s0,s0,8
    318c:	00e6d463          	bge	a3,a4,3194 <_vfprintf_r+0x1258>
    3190:	5880106f          	j	4718 <_vfprintf_r+0x27dc>
    3194:	fffb4713          	not	a4,s6
    3198:	41f75713          	sra	a4,a4,0x1f
    319c:	00eb77b3          	and	a5,s6,a4
    31a0:	40fd0d33          	sub	s10,s10,a5
    31a4:	8ba05063          	blez	s10,2244 <_vfprintf_r+0x308>
    31a8:	01000713          	li	a4,16
    31ac:	0a412783          	lw	a5,164(sp)
    31b0:	0000c297          	auipc	t0,0xc
    31b4:	46c28293          	add	t0,t0,1132 # f61c <zeroes.0>
    31b8:	23a750e3          	bge	a4,s10,3bd8 <_vfprintf_r+0x1c9c>
    31bc:	00048713          	mv	a4,s1
    31c0:	01000c13          	li	s8,16
    31c4:	00700b13          	li	s6,7
    31c8:	000e8493          	mv	s1,t4
    31cc:	00028a13          	mv	s4,t0
    31d0:	00c0006f          	j	31dc <_vfprintf_r+0x12a0>
    31d4:	ff0d0d13          	add	s10,s10,-16
    31d8:	1fac5ae3          	bge	s8,s10,3bcc <_vfprintf_r+0x1c90>
    31dc:	01070713          	add	a4,a4,16
    31e0:	00178793          	add	a5,a5,1
    31e4:	01442023          	sw	s4,0(s0)
    31e8:	01842223          	sw	s8,4(s0)
    31ec:	0ae12423          	sw	a4,168(sp)
    31f0:	0af12223          	sw	a5,164(sp)
    31f4:	00840413          	add	s0,s0,8
    31f8:	fcfb5ee3          	bge	s6,a5,31d4 <_vfprintf_r+0x1298>
    31fc:	00812583          	lw	a1,8(sp)
    3200:	0a010613          	add	a2,sp,160
    3204:	00098513          	mv	a0,s3
    3208:	3f1010ef          	jal	4df8 <__sprint_r>
    320c:	a0051063          	bnez	a0,240c <_vfprintf_r+0x4d0>
    3210:	0a812703          	lw	a4,168(sp)
    3214:	0a412783          	lw	a5,164(sp)
    3218:	0ac10413          	add	s0,sp,172
    321c:	fb9ff06f          	j	31d4 <_vfprintf_r+0x1298>
    3220:	001ef613          	and	a2,t4,1
    3224:	ce061063          	bnez	a2,2704 <_vfprintf_r+0x7c8>
    3228:	00d42223          	sw	a3,4(s0)
    322c:	0a912423          	sw	s1,168(sp)
    3230:	0ba12223          	sw	s10,164(sp)
    3234:	00700793          	li	a5,7
    3238:	d7a7d863          	bge	a5,s10,27a8 <_vfprintf_r+0x86c>
    323c:	00812583          	lw	a1,8(sp)
    3240:	0a010613          	add	a2,sp,160
    3244:	00098513          	mv	a0,s3
    3248:	03d12023          	sw	t4,32(sp)
    324c:	3ad010ef          	jal	4df8 <__sprint_r>
    3250:	9a051e63          	bnez	a0,240c <_vfprintf_r+0x4d0>
    3254:	0a812483          	lw	s1,168(sp)
    3258:	0a412d03          	lw	s10,164(sp)
    325c:	02012e83          	lw	t4,32(sp)
    3260:	0ac10b13          	add	s6,sp,172
    3264:	d44ff06f          	j	27a8 <_vfprintf_r+0x86c>
    3268:	01812703          	lw	a4,24(sp)
    326c:	00100793          	li	a5,1
    3270:	d2e7dc63          	bge	a5,a4,27a8 <_vfprintf_r+0x86c>
    3274:	01100793          	li	a5,17
    3278:	0000c297          	auipc	t0,0xc
    327c:	3a428293          	add	t0,t0,932 # f61c <zeroes.0>
    3280:	18e7d4e3          	bge	a5,a4,3c08 <_vfprintf_r+0x1ccc>
    3284:	00040a13          	mv	s4,s0
    3288:	01000793          	li	a5,16
    328c:	00700c13          	li	s8,7
    3290:	03d12023          	sw	t4,32(sp)
    3294:	00028413          	mv	s0,t0
    3298:	00c0006f          	j	32a4 <_vfprintf_r+0x1368>
    329c:	ff0a0a13          	add	s4,s4,-16
    32a0:	1547dee3          	bge	a5,s4,3bfc <_vfprintf_r+0x1cc0>
    32a4:	01048493          	add	s1,s1,16
    32a8:	001d0d13          	add	s10,s10,1
    32ac:	008b2023          	sw	s0,0(s6)
    32b0:	00fb2223          	sw	a5,4(s6)
    32b4:	0a912423          	sw	s1,168(sp)
    32b8:	0ba12223          	sw	s10,164(sp)
    32bc:	008b0b13          	add	s6,s6,8
    32c0:	fdac5ee3          	bge	s8,s10,329c <_vfprintf_r+0x1360>
    32c4:	00812583          	lw	a1,8(sp)
    32c8:	0a010613          	add	a2,sp,160
    32cc:	00098513          	mv	a0,s3
    32d0:	329010ef          	jal	4df8 <__sprint_r>
    32d4:	92051c63          	bnez	a0,240c <_vfprintf_r+0x4d0>
    32d8:	0a812483          	lw	s1,168(sp)
    32dc:	0a412d03          	lw	s10,164(sp)
    32e0:	0ac10b13          	add	s6,sp,172
    32e4:	01000793          	li	a5,16
    32e8:	fb5ff06f          	j	329c <_vfprintf_r+0x1360>
    32ec:	01412703          	lw	a4,20(sp)
    32f0:	010ef793          	and	a5,t4,16
    32f4:	00072d03          	lw	s10,0(a4)
    32f8:	00470713          	add	a4,a4,4
    32fc:	00e12a23          	sw	a4,20(sp)
    3300:	1a079663          	bnez	a5,34ac <_vfprintf_r+0x1570>
    3304:	040ef793          	and	a5,t4,64
    3308:	18078e63          	beqz	a5,34a4 <_vfprintf_r+0x1568>
    330c:	010d1d13          	sll	s10,s10,0x10
    3310:	010d5d13          	srl	s10,s10,0x10
    3314:	00000c93          	li	s9,0
    3318:	80dff06f          	j	2b24 <_vfprintf_r+0xbe8>
    331c:	01412703          	lw	a4,20(sp)
    3320:	01067793          	and	a5,a2,16
    3324:	00072d03          	lw	s10,0(a4)
    3328:	00470713          	add	a4,a4,4
    332c:	00e12a23          	sw	a4,20(sp)
    3330:	14079a63          	bnez	a5,3484 <_vfprintf_r+0x1548>
    3334:	04067793          	and	a5,a2,64
    3338:	14078063          	beqz	a5,3478 <_vfprintf_r+0x153c>
    333c:	010d1d13          	sll	s10,s10,0x10
    3340:	010d5d13          	srl	s10,s10,0x10
    3344:	00000c93          	li	s9,0
    3348:	00100793          	li	a5,1
    334c:	e34ff06f          	j	2980 <_vfprintf_r+0xa44>
    3350:	01412703          	lw	a4,20(sp)
    3354:	010ef793          	and	a5,t4,16
    3358:	00072d03          	lw	s10,0(a4)
    335c:	00470713          	add	a4,a4,4
    3360:	00e12a23          	sw	a4,20(sp)
    3364:	12079a63          	bnez	a5,3498 <_vfprintf_r+0x155c>
    3368:	040ef793          	and	a5,t4,64
    336c:	12078263          	beqz	a5,3490 <_vfprintf_r+0x1554>
    3370:	010d1d13          	sll	s10,s10,0x10
    3374:	410d5d13          	sra	s10,s10,0x10
    3378:	41fd5c93          	sra	s9,s10,0x1f
    337c:	000c8793          	mv	a5,s9
    3380:	f207d663          	bgez	a5,2aac <_vfprintf_r+0xb70>
    3384:	01a037b3          	snez	a5,s10
    3388:	419000b3          	neg	ra,s9
    338c:	40f08cb3          	sub	s9,ra,a5
    3390:	41a00d33          	neg	s10,s10
    3394:	000e8613          	mv	a2,t4
    3398:	02d00713          	li	a4,45
    339c:	00100793          	li	a5,1
    33a0:	de4ff06f          	j	2984 <_vfprintf_r+0xa48>
    33a4:	00812403          	lw	s0,8(sp)
    33a8:	00f12623          	sw	a5,12(sp)
    33ac:	05842503          	lw	a0,88(s0)
    33b0:	c31fd0ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    33b4:	00c41703          	lh	a4,12(s0)
    33b8:	00c12783          	lw	a5,12(sp)
    33bc:	c01fe06f          	j	1fbc <_vfprintf_r+0x80>
    33c0:	001ef793          	and	a5,t4,1
    33c4:	00079463          	bnez	a5,33cc <_vfprintf_r+0x1490>
    33c8:	e7dfe06f          	j	2244 <_vfprintf_r+0x308>
    33cc:	85dff06f          	j	2c28 <_vfprintf_r+0xcec>
    33d0:	000a0e93          	mv	t4,s4
    33d4:	000b0313          	mv	t1,s6
    33d8:	ea8ff06f          	j	2a80 <_vfprintf_r+0xb44>
    33dc:	00094e03          	lbu	t3,0(s2)
    33e0:	00f12a23          	sw	a5,20(sp)
    33e4:	d09fe06f          	j	20ec <_vfprintf_r+0x1b0>
    33e8:	0a412703          	lw	a4,164(sp)
    33ec:	0000c617          	auipc	a2,0xc
    33f0:	d7860613          	add	a2,a2,-648 # f164 <__fini_array_end+0x1d8>
    33f4:	00c42023          	sw	a2,0(s0)
    33f8:	00148493          	add	s1,s1,1
    33fc:	00100613          	li	a2,1
    3400:	00170713          	add	a4,a4,1
    3404:	00c42223          	sw	a2,4(s0)
    3408:	0a912423          	sw	s1,168(sp)
    340c:	0ae12223          	sw	a4,164(sp)
    3410:	00700613          	li	a2,7
    3414:	00840413          	add	s0,s0,8
    3418:	2ee64ce3          	blt	a2,a4,3f10 <_vfprintf_r+0x1fd4>
    341c:	7e069e63          	bnez	a3,3c18 <_vfprintf_r+0x1cdc>
    3420:	01812783          	lw	a5,24(sp)
    3424:	001ef713          	and	a4,t4,1
    3428:	00f76733          	or	a4,a4,a5
    342c:	00071463          	bnez	a4,3434 <_vfprintf_r+0x14f8>
    3430:	e15fe06f          	j	2244 <_vfprintf_r+0x308>
    3434:	03412703          	lw	a4,52(sp)
    3438:	03012783          	lw	a5,48(sp)
    343c:	00700693          	li	a3,7
    3440:	00e42023          	sw	a4,0(s0)
    3444:	0a412703          	lw	a4,164(sp)
    3448:	009784b3          	add	s1,a5,s1
    344c:	00f42223          	sw	a5,4(s0)
    3450:	00170713          	add	a4,a4,1
    3454:	0a912423          	sw	s1,168(sp)
    3458:	0ae12223          	sw	a4,164(sp)
    345c:	38e6c8e3          	blt	a3,a4,3fec <_vfprintf_r+0x20b0>
    3460:	00840413          	add	s0,s0,8
    3464:	7e80006f          	j	3c4c <_vfprintf_r+0x1d10>
    3468:	03000793          	li	a5,48
    346c:	14f107a3          	sb	a5,335(sp)
    3470:	14f10c13          	add	s8,sp,335
    3474:	d38ff06f          	j	29ac <_vfprintf_r+0xa70>
    3478:	20067793          	and	a5,a2,512
    347c:	00078463          	beqz	a5,3484 <_vfprintf_r+0x1548>
    3480:	0ffd7d13          	zext.b	s10,s10
    3484:	00000c93          	li	s9,0
    3488:	00100793          	li	a5,1
    348c:	cf4ff06f          	j	2980 <_vfprintf_r+0xa44>
    3490:	200ef793          	and	a5,t4,512
    3494:	2c0796e3          	bnez	a5,3f60 <_vfprintf_r+0x2024>
    3498:	41fd5c93          	sra	s9,s10,0x1f
    349c:	000c8793          	mv	a5,s9
    34a0:	e08ff06f          	j	2aa8 <_vfprintf_r+0xb6c>
    34a4:	200ef793          	and	a5,t4,512
    34a8:	2a0790e3          	bnez	a5,3f48 <_vfprintf_r+0x200c>
    34ac:	00000c93          	li	s9,0
    34b0:	e74ff06f          	j	2b24 <_vfprintf_r+0xbe8>
    34b4:	01412783          	lw	a5,20(sp)
    34b8:	06010513          	add	a0,sp,96
    34bc:	03612223          	sw	s6,36(sp)
    34c0:	0007a703          	lw	a4,0(a5)
    34c4:	03c12023          	sw	t3,32(sp)
    34c8:	00478b13          	add	s6,a5,4
    34cc:	00072683          	lw	a3,0(a4)
    34d0:	01412823          	sw	s4,16(sp)
    34d4:	06d12023          	sw	a3,96(sp)
    34d8:	00472683          	lw	a3,4(a4)
    34dc:	06d12223          	sw	a3,100(sp)
    34e0:	00872683          	lw	a3,8(a4)
    34e4:	06d12423          	sw	a3,104(sp)
    34e8:	00c72703          	lw	a4,12(a4)
    34ec:	06e12623          	sw	a4,108(sp)
    34f0:	4c80b0ef          	jal	e9b8 <__trunctfdf2>
    34f4:	02012e03          	lw	t3,32(sp)
    34f8:	02412303          	lw	t1,36(sp)
    34fc:	02a12423          	sw	a0,40(sp)
    3500:	02b12623          	sw	a1,44(sp)
    3504:	01612a23          	sw	s6,20(sp)
    3508:	000a0e93          	mv	t4,s4
    350c:	fb1fe06f          	j	24bc <_vfprintf_r+0x580>
    3510:	010a7793          	and	a5,s4,16
    3514:	6c079a63          	bnez	a5,3be8 <_vfprintf_r+0x1cac>
    3518:	040a7793          	and	a5,s4,64
    351c:	24079ce3          	bnez	a5,3f74 <_vfprintf_r+0x2038>
    3520:	200a7f13          	and	t5,s4,512
    3524:	6c0f0263          	beqz	t5,3be8 <_vfprintf_r+0x1cac>
    3528:	01412783          	lw	a5,20(sp)
    352c:	00c12703          	lw	a4,12(sp)
    3530:	0007a783          	lw	a5,0(a5)
    3534:	00e78023          	sb	a4,0(a5)
    3538:	e6cff06f          	j	2ba4 <_vfprintf_r+0xc68>
    353c:	03c12783          	lw	a5,60(sp)
    3540:	00094e03          	lbu	t3,0(s2)
    3544:	00079463          	bnez	a5,354c <_vfprintf_r+0x1610>
    3548:	ba5fe06f          	j	20ec <_vfprintf_r+0x1b0>
    354c:	0007c783          	lbu	a5,0(a5)
    3550:	00079463          	bnez	a5,3558 <_vfprintf_r+0x161c>
    3554:	b99fe06f          	j	20ec <_vfprintf_r+0x1b0>
    3558:	400a6a13          	or	s4,s4,1024
    355c:	b91fe06f          	j	20ec <_vfprintf_r+0x1b0>
    3560:	fff00b13          	li	s6,-1
    3564:	00068913          	mv	s2,a3
    3568:	b89fe06f          	j	20f0 <_vfprintf_r+0x1b4>
    356c:	0000c797          	auipc	a5,0xc
    3570:	bdc78793          	add	a5,a5,-1060 # f148 <__fini_array_end+0x1bc>
    3574:	000a0e93          	mv	t4,s4
    3578:	000b0313          	mv	t1,s6
    357c:	02f12c23          	sw	a5,56(sp)
    3580:	020ef793          	and	a5,t4,32
    3584:	1c078263          	beqz	a5,3748 <_vfprintf_r+0x180c>
    3588:	01412783          	lw	a5,20(sp)
    358c:	00778b13          	add	s6,a5,7
    3590:	ff8b7b13          	and	s6,s6,-8
    3594:	000b2d03          	lw	s10,0(s6)
    3598:	004b2c83          	lw	s9,4(s6)
    359c:	008b0793          	add	a5,s6,8
    35a0:	00f12a23          	sw	a5,20(sp)
    35a4:	001ef793          	and	a5,t4,1
    35a8:	00078e63          	beqz	a5,35c4 <_vfprintf_r+0x1688>
    35ac:	019d67b3          	or	a5,s10,s9
    35b0:	00078a63          	beqz	a5,35c4 <_vfprintf_r+0x1688>
    35b4:	03000793          	li	a5,48
    35b8:	06f10c23          	sb	a5,120(sp)
    35bc:	07c10ca3          	sb	t3,121(sp)
    35c0:	002eee93          	or	t4,t4,2
    35c4:	bffef613          	and	a2,t4,-1025
    35c8:	00200793          	li	a5,2
    35cc:	bb4ff06f          	j	2980 <_vfprintf_r+0xa44>
    35d0:	000b0313          	mv	t1,s6
    35d4:	000a0613          	mv	a2,s4
    35d8:	b80ff06f          	j	2958 <_vfprintf_r+0xa1c>
    35dc:	000a0e93          	mv	t4,s4
    35e0:	000b0313          	mv	t1,s6
    35e4:	d1cff06f          	j	2b00 <_vfprintf_r+0xbc4>
    35e8:	0000c797          	auipc	a5,0xc
    35ec:	b4c78793          	add	a5,a5,-1204 # f134 <__fini_array_end+0x1a8>
    35f0:	000a0e93          	mv	t4,s4
    35f4:	000b0313          	mv	t1,s6
    35f8:	02f12c23          	sw	a5,56(sp)
    35fc:	f85ff06f          	j	3580 <_vfprintf_r+0x1644>
    3600:	00194e03          	lbu	t3,1(s2)
    3604:	020a6a13          	or	s4,s4,32
    3608:	00190913          	add	s2,s2,1
    360c:	ae1fe06f          	j	20ec <_vfprintf_r+0x1b0>
    3610:	00194e03          	lbu	t3,1(s2)
    3614:	200a6a13          	or	s4,s4,512
    3618:	00190913          	add	s2,s2,1
    361c:	ad1fe06f          	j	20ec <_vfprintf_r+0x1b0>
    3620:	00812583          	lw	a1,8(sp)
    3624:	0a010613          	add	a2,sp,160
    3628:	00098513          	mv	a0,s3
    362c:	03d12023          	sw	t4,32(sp)
    3630:	7c8010ef          	jal	4df8 <__sprint_r>
    3634:	00050463          	beqz	a0,363c <_vfprintf_r+0x1700>
    3638:	dd5fe06f          	j	240c <_vfprintf_r+0x4d0>
    363c:	0a812483          	lw	s1,168(sp)
    3640:	02012e83          	lw	t4,32(sp)
    3644:	0ac10413          	add	s0,sp,172
    3648:	e10ff06f          	j	2c58 <_vfprintf_r+0xd1c>
    364c:	00600793          	li	a5,6
    3650:	00030c93          	mv	s9,t1
    3654:	0e67e6e3          	bltu	a5,t1,3f40 <_vfprintf_r+0x2004>
    3658:	01612a23          	sw	s6,20(sp)
    365c:	00012823          	sw	zero,16(sp)
    3660:	000c8d13          	mv	s10,s9
    3664:	00000613          	li	a2,0
    3668:	00000313          	li	t1,0
    366c:	02012223          	sw	zero,36(sp)
    3670:	02012023          	sw	zero,32(sp)
    3674:	00000a13          	li	s4,0
    3678:	0000cc17          	auipc	s8,0xc
    367c:	ae4c0c13          	add	s8,s8,-1308 # f15c <__fini_array_end+0x1d0>
    3680:	afdfe06f          	j	217c <_vfprintf_r+0x240>
    3684:	00800613          	li	a2,8
    3688:	00000593          	li	a1,0
    368c:	09810513          	add	a0,sp,152
    3690:	03c12023          	sw	t3,32(sp)
    3694:	01d12823          	sw	t4,16(sp)
    3698:	951fd0ef          	jal	fe8 <memset>
    369c:	01412783          	lw	a5,20(sp)
    36a0:	0ec10c13          	add	s8,sp,236
    36a4:	09810693          	add	a3,sp,152
    36a8:	0007a603          	lw	a2,0(a5)
    36ac:	000c0593          	mv	a1,s8
    36b0:	00098513          	mv	a0,s3
    36b4:	530070ef          	jal	abe4 <_wcrtomb_r>
    36b8:	fff00793          	li	a5,-1
    36bc:	01012e83          	lw	t4,16(sp)
    36c0:	02012e03          	lw	t3,32(sp)
    36c4:	00050d13          	mv	s10,a0
    36c8:	00f51463          	bne	a0,a5,36d0 <_vfprintf_r+0x1794>
    36cc:	4980106f          	j	4b64 <_vfprintf_r+0x2c28>
    36d0:	fff54813          	not	a6,a0
    36d4:	41f85813          	sra	a6,a6,0x1f
    36d8:	01057cb3          	and	s9,a0,a6
    36dc:	97cff06f          	j	2858 <_vfprintf_r+0x91c>
    36e0:	03412703          	lw	a4,52(sp)
    36e4:	03012783          	lw	a5,48(sp)
    36e8:	00700693          	li	a3,7
    36ec:	00e42023          	sw	a4,0(s0)
    36f0:	0a412703          	lw	a4,164(sp)
    36f4:	00f484b3          	add	s1,s1,a5
    36f8:	00f42223          	sw	a5,4(s0)
    36fc:	00170713          	add	a4,a4,1
    3700:	0a912423          	sw	s1,168(sp)
    3704:	0ae12223          	sw	a4,164(sp)
    3708:	00840413          	add	s0,s0,8
    370c:	a4e6d0e3          	bge	a3,a4,314c <_vfprintf_r+0x1210>
    3710:	00812583          	lw	a1,8(sp)
    3714:	0a010613          	add	a2,sp,160
    3718:	00098513          	mv	a0,s3
    371c:	02612223          	sw	t1,36(sp)
    3720:	03d12023          	sw	t4,32(sp)
    3724:	6d4010ef          	jal	4df8 <__sprint_r>
    3728:	00050463          	beqz	a0,3730 <_vfprintf_r+0x17f4>
    372c:	ce1fe06f          	j	240c <_vfprintf_r+0x4d0>
    3730:	07c12d03          	lw	s10,124(sp)
    3734:	0a812483          	lw	s1,168(sp)
    3738:	02412303          	lw	t1,36(sp)
    373c:	02012e83          	lw	t4,32(sp)
    3740:	0ac10413          	add	s0,sp,172
    3744:	a09ff06f          	j	314c <_vfprintf_r+0x1210>
    3748:	01412703          	lw	a4,20(sp)
    374c:	010ef793          	and	a5,t4,16
    3750:	00072d03          	lw	s10,0(a4)
    3754:	00470713          	add	a4,a4,4
    3758:	00e12a23          	sw	a4,20(sp)
    375c:	08079863          	bnez	a5,37ec <_vfprintf_r+0x18b0>
    3760:	040ef793          	and	a5,t4,64
    3764:	08078063          	beqz	a5,37e4 <_vfprintf_r+0x18a8>
    3768:	010d1d13          	sll	s10,s10,0x10
    376c:	010d5d13          	srl	s10,s10,0x10
    3770:	00000c93          	li	s9,0
    3774:	e31ff06f          	j	35a4 <_vfprintf_r+0x1668>
    3778:	00000d13          	li	s10,0
    377c:	15010c13          	add	s8,sp,336
    3780:	a2cff06f          	j	29ac <_vfprintf_r+0xa70>
    3784:	00812583          	lw	a1,8(sp)
    3788:	0a010613          	add	a2,sp,160
    378c:	00098513          	mv	a0,s3
    3790:	03d12023          	sw	t4,32(sp)
    3794:	664010ef          	jal	4df8 <__sprint_r>
    3798:	00050463          	beqz	a0,37a0 <_vfprintf_r+0x1864>
    379c:	c71fe06f          	j	240c <_vfprintf_r+0x4d0>
    37a0:	0a812483          	lw	s1,168(sp)
    37a4:	0a412d03          	lw	s10,164(sp)
    37a8:	02012e83          	lw	t4,32(sp)
    37ac:	0ac10b13          	add	s6,sp,172
    37b0:	f71fe06f          	j	2720 <_vfprintf_r+0x7e4>
    37b4:	00812583          	lw	a1,8(sp)
    37b8:	0a010613          	add	a2,sp,160
    37bc:	00098513          	mv	a0,s3
    37c0:	03d12023          	sw	t4,32(sp)
    37c4:	634010ef          	jal	4df8 <__sprint_r>
    37c8:	00050463          	beqz	a0,37d0 <_vfprintf_r+0x1894>
    37cc:	c41fe06f          	j	240c <_vfprintf_r+0x4d0>
    37d0:	0a812483          	lw	s1,168(sp)
    37d4:	0a412d03          	lw	s10,164(sp)
    37d8:	02012e83          	lw	t4,32(sp)
    37dc:	0ac10b13          	add	s6,sp,172
    37e0:	f71fe06f          	j	2750 <_vfprintf_r+0x814>
    37e4:	200ef793          	and	a5,t4,512
    37e8:	76079663          	bnez	a5,3f54 <_vfprintf_r+0x2018>
    37ec:	00000c93          	li	s9,0
    37f0:	db5ff06f          	j	35a4 <_vfprintf_r+0x1668>
    37f4:	00000793          	li	a5,0
    37f8:	15010b13          	add	s6,sp,336
    37fc:	01212823          	sw	s2,16(sp)
    3800:	00078913          	mv	s2,a5
    3804:	00098793          	mv	a5,s3
    3808:	04812823          	sw	s0,80(sp)
    380c:	000b0993          	mv	s3,s6
    3810:	03c12403          	lw	s0,60(sp)
    3814:	40067493          	and	s1,a2,1024
    3818:	0ff00a13          	li	s4,255
    381c:	03c12023          	sw	t3,32(sp)
    3820:	02c12223          	sw	a2,36(sp)
    3824:	04612223          	sw	t1,68(sp)
    3828:	00078b13          	mv	s6,a5
    382c:	0280006f          	j	3854 <_vfprintf_r+0x1918>
    3830:	00a00613          	li	a2,10
    3834:	00000693          	li	a3,0
    3838:	000d0513          	mv	a0,s10
    383c:	000c8593          	mv	a1,s9
    3840:	581070ef          	jal	b5c0 <__udivdi3>
    3844:	6a0c8ee3          	beqz	s9,4700 <_vfprintf_r+0x27c4>
    3848:	00050d13          	mv	s10,a0
    384c:	00058c93          	mv	s9,a1
    3850:	000c0993          	mv	s3,s8
    3854:	00a00613          	li	a2,10
    3858:	00000693          	li	a3,0
    385c:	000d0513          	mv	a0,s10
    3860:	000c8593          	mv	a1,s9
    3864:	408080ef          	jal	bc6c <__umoddi3>
    3868:	03050513          	add	a0,a0,48
    386c:	fea98fa3          	sb	a0,-1(s3)
    3870:	fff98c13          	add	s8,s3,-1
    3874:	00190913          	add	s2,s2,1
    3878:	fa048ce3          	beqz	s1,3830 <_vfprintf_r+0x18f4>
    387c:	00044783          	lbu	a5,0(s0)
    3880:	faf918e3          	bne	s2,a5,3830 <_vfprintf_r+0x18f4>
    3884:	fb4906e3          	beq	s2,s4,3830 <_vfprintf_r+0x18f4>
    3888:	560c9ae3          	bnez	s9,45fc <_vfprintf_r+0x26c0>
    388c:	00900793          	li	a5,9
    3890:	57a7e6e3          	bltu	a5,s10,45fc <_vfprintf_r+0x26c0>
    3894:	02412603          	lw	a2,36(sp)
    3898:	15010793          	add	a5,sp,336
    389c:	02812e23          	sw	s0,60(sp)
    38a0:	01212c23          	sw	s2,24(sp)
    38a4:	02012e03          	lw	t3,32(sp)
    38a8:	01012903          	lw	s2,16(sp)
    38ac:	04412303          	lw	t1,68(sp)
    38b0:	05012403          	lw	s0,80(sp)
    38b4:	000b0993          	mv	s3,s6
    38b8:	41878d33          	sub	s10,a5,s8
    38bc:	00060e93          	mv	t4,a2
    38c0:	8ecff06f          	j	29ac <_vfprintf_r+0xa70>
    38c4:	00812583          	lw	a1,8(sp)
    38c8:	0a010613          	add	a2,sp,160
    38cc:	00098513          	mv	a0,s3
    38d0:	04612e23          	sw	t1,92(sp)
    38d4:	05c12c23          	sw	t3,88(sp)
    38d8:	05d12a23          	sw	t4,84(sp)
    38dc:	05f12823          	sw	t6,80(sp)
    38e0:	04512223          	sw	t0,68(sp)
    38e4:	514010ef          	jal	4df8 <__sprint_r>
    38e8:	00050463          	beqz	a0,38f0 <_vfprintf_r+0x19b4>
    38ec:	b21fe06f          	j	240c <_vfprintf_r+0x4d0>
    38f0:	07714603          	lbu	a2,119(sp)
    38f4:	0a812483          	lw	s1,168(sp)
    38f8:	05c12303          	lw	t1,92(sp)
    38fc:	05812e03          	lw	t3,88(sp)
    3900:	05412e83          	lw	t4,84(sp)
    3904:	05012f83          	lw	t6,80(sp)
    3908:	04412283          	lw	t0,68(sp)
    390c:	0ac10413          	add	s0,sp,172
    3910:	88dfe06f          	j	219c <_vfprintf_r+0x260>
    3914:	02812883          	lw	a7,40(sp)
    3918:	02c12703          	lw	a4,44(sp)
    391c:	02612223          	sw	t1,36(sp)
    3920:	00088613          	mv	a2,a7
    3924:	00088513          	mv	a0,a7
    3928:	00070693          	mv	a3,a4
    392c:	00070593          	mv	a1,a4
    3930:	03c12023          	sw	t3,32(sp)
    3934:	01d12823          	sw	t4,16(sp)
    3938:	62d0a0ef          	jal	e764 <__unorddf2>
    393c:	01012e83          	lw	t4,16(sp)
    3940:	02012e03          	lw	t3,32(sp)
    3944:	02412303          	lw	t1,36(sp)
    3948:	00050463          	beqz	a0,3950 <_vfprintf_r+0x1a14>
    394c:	0e00106f          	j	4a2c <_vfprintf_r+0x2af0>
    3950:	06100713          	li	a4,97
    3954:	08ee0263          	beq	t3,a4,39d8 <_vfprintf_r+0x1a9c>
    3958:	04100713          	li	a4,65
    395c:	05800793          	li	a5,88
    3960:	06ee0e63          	beq	t3,a4,39dc <_vfprintf_r+0x1aa0>
    3964:	fff00713          	li	a4,-1
    3968:	00e31463          	bne	t1,a4,3970 <_vfprintf_r+0x1a34>
    396c:	01c0106f          	j	4988 <_vfprintf_r+0x2a4c>
    3970:	fdfe7713          	and	a4,t3,-33
    3974:	04700693          	li	a3,71
    3978:	00012823          	sw	zero,16(sp)
    397c:	00d71663          	bne	a4,a3,3988 <_vfprintf_r+0x1a4c>
    3980:	00031463          	bnez	t1,3988 <_vfprintf_r+0x1a4c>
    3984:	00100313          	li	t1,1
    3988:	100ee793          	or	a5,t4,256
    398c:	00078b13          	mv	s6,a5
    3990:	02c12783          	lw	a5,44(sp)
    3994:	04012223          	sw	zero,68(sp)
    3998:	00078493          	mv	s1,a5
    399c:	0007da63          	bgez	a5,39b0 <_vfprintf_r+0x1a74>
    39a0:	800004b7          	lui	s1,0x80000
    39a4:	00f4c4b3          	xor	s1,s1,a5
    39a8:	02d00793          	li	a5,45
    39ac:	04f12223          	sw	a5,68(sp)
    39b0:	fbfe0713          	add	a4,t3,-65
    39b4:	02500693          	li	a3,37
    39b8:	3ae6e463          	bltu	a3,a4,3d60 <_vfprintf_r+0x1e24>
    39bc:	0000c697          	auipc	a3,0xc
    39c0:	bc868693          	add	a3,a3,-1080 # f584 <_ctype_+0x270>
    39c4:	00271713          	sll	a4,a4,0x2
    39c8:	00d70733          	add	a4,a4,a3
    39cc:	00072703          	lw	a4,0(a4)
    39d0:	00d70733          	add	a4,a4,a3
    39d4:	00070067          	jr	a4
    39d8:	07800793          	li	a5,120
    39dc:	03000713          	li	a4,48
    39e0:	06e10c23          	sb	a4,120(sp)
    39e4:	06f10ca3          	sb	a5,121(sp)
    39e8:	06300713          	li	a4,99
    39ec:	00012823          	sw	zero,16(sp)
    39f0:	002eee93          	or	t4,t4,2
    39f4:	0ec10c13          	add	s8,sp,236
    39f8:	f86758e3          	bge	a4,t1,3988 <_vfprintf_r+0x1a4c>
    39fc:	00130593          	add	a1,t1,1
    3a00:	00098513          	mv	a0,s3
    3a04:	03c12023          	sw	t3,32(sp)
    3a08:	01d12c23          	sw	t4,24(sp)
    3a0c:	00612823          	sw	t1,16(sp)
    3a10:	d35fd0ef          	jal	1744 <_malloc_r>
    3a14:	01012303          	lw	t1,16(sp)
    3a18:	01812e83          	lw	t4,24(sp)
    3a1c:	02012e03          	lw	t3,32(sp)
    3a20:	00050c13          	mv	s8,a0
    3a24:	00051463          	bnez	a0,3a2c <_vfprintf_r+0x1af0>
    3a28:	13c0106f          	j	4b64 <_vfprintf_r+0x2c28>
    3a2c:	00a12823          	sw	a0,16(sp)
    3a30:	f59ff06f          	j	3988 <_vfprintf_r+0x1a4c>
    3a34:	00098513          	mv	a0,s3
    3a38:	1d0030ef          	jal	6c08 <__sinit>
    3a3c:	00c12783          	lw	a5,12(sp)
    3a40:	d5cfe06f          	j	1f9c <_vfprintf_r+0x60>
    3a44:	00812583          	lw	a1,8(sp)
    3a48:	0a010613          	add	a2,sp,160
    3a4c:	00098513          	mv	a0,s3
    3a50:	03d12023          	sw	t4,32(sp)
    3a54:	3a4010ef          	jal	4df8 <__sprint_r>
    3a58:	00050463          	beqz	a0,3a60 <_vfprintf_r+0x1b24>
    3a5c:	9b1fe06f          	j	240c <_vfprintf_r+0x4d0>
    3a60:	0a812483          	lw	s1,168(sp)
    3a64:	02012e83          	lw	t4,32(sp)
    3a68:	0ac10413          	add	s0,sp,172
    3a6c:	9b0ff06f          	j	2c1c <_vfprintf_r+0xce0>
    3a70:	00800613          	li	a2,8
    3a74:	00000593          	li	a1,0
    3a78:	09810513          	add	a0,sp,152
    3a7c:	02612023          	sw	t1,32(sp)
    3a80:	01c12a23          	sw	t3,20(sp)
    3a84:	01d12823          	sw	t4,16(sp)
    3a88:	09812223          	sw	s8,132(sp)
    3a8c:	d5cfd0ef          	jal	fe8 <memset>
    3a90:	02012303          	lw	t1,32(sp)
    3a94:	01012e83          	lw	t4,16(sp)
    3a98:	01412e03          	lw	t3,20(sp)
    3a9c:	3a0340e3          	bltz	t1,463c <_vfprintf_r+0x2700>
    3aa0:	00000d13          	li	s10,0
    3aa4:	01212823          	sw	s2,16(sp)
    3aa8:	000c0c93          	mv	s9,s8
    3aac:	fff00493          	li	s1,-1
    3ab0:	000b0c13          	mv	s8,s6
    3ab4:	000e8a13          	mv	s4,t4
    3ab8:	00040b13          	mv	s6,s0
    3abc:	000d0913          	mv	s2,s10
    3ac0:	00030413          	mv	s0,t1
    3ac4:	0300006f          	j	3af4 <_vfprintf_r+0x1bb8>
    3ac8:	09810693          	add	a3,sp,152
    3acc:	0ec10593          	add	a1,sp,236
    3ad0:	00098513          	mv	a0,s3
    3ad4:	110070ef          	jal	abe4 <_wcrtomb_r>
    3ad8:	68950ae3          	beq	a0,s1,496c <_vfprintf_r+0x2a30>
    3adc:	00a907b3          	add	a5,s2,a0
    3ae0:	02f44263          	blt	s0,a5,3b04 <_vfprintf_r+0x1bc8>
    3ae4:	004d0d13          	add	s10,s10,4
    3ae8:	00879463          	bne	a5,s0,3af0 <_vfprintf_r+0x1bb4>
    3aec:	7990006f          	j	4a84 <_vfprintf_r+0x2b48>
    3af0:	00078913          	mv	s2,a5
    3af4:	08412783          	lw	a5,132(sp)
    3af8:	01a787b3          	add	a5,a5,s10
    3afc:	0007a603          	lw	a2,0(a5)
    3b00:	fc0614e3          	bnez	a2,3ac8 <_vfprintf_r+0x1b8c>
    3b04:	00090d13          	mv	s10,s2
    3b08:	01412e03          	lw	t3,20(sp)
    3b0c:	01012903          	lw	s2,16(sp)
    3b10:	000b0413          	mv	s0,s6
    3b14:	000a0e93          	mv	t4,s4
    3b18:	000c0b13          	mv	s6,s8
    3b1c:	000c8c13          	mv	s8,s9
    3b20:	340d0ce3          	beqz	s10,4678 <_vfprintf_r+0x273c>
    3b24:	06300793          	li	a5,99
    3b28:	59a7dee3          	bge	a5,s10,48c4 <_vfprintf_r+0x2988>
    3b2c:	001d0593          	add	a1,s10,1
    3b30:	00098513          	mv	a0,s3
    3b34:	01c12a23          	sw	t3,20(sp)
    3b38:	01d12823          	sw	t4,16(sp)
    3b3c:	c09fd0ef          	jal	1744 <_malloc_r>
    3b40:	01012e83          	lw	t4,16(sp)
    3b44:	01412e03          	lw	t3,20(sp)
    3b48:	00050c13          	mv	s8,a0
    3b4c:	620500e3          	beqz	a0,496c <_vfprintf_r+0x2a30>
    3b50:	00a12823          	sw	a0,16(sp)
    3b54:	00800613          	li	a2,8
    3b58:	00000593          	li	a1,0
    3b5c:	09810513          	add	a0,sp,152
    3b60:	03c12023          	sw	t3,32(sp)
    3b64:	01d12a23          	sw	t4,20(sp)
    3b68:	c80fd0ef          	jal	fe8 <memset>
    3b6c:	09810713          	add	a4,sp,152
    3b70:	000d0693          	mv	a3,s10
    3b74:	08410613          	add	a2,sp,132
    3b78:	000c0593          	mv	a1,s8
    3b7c:	00098513          	mv	a0,s3
    3b80:	0f0070ef          	jal	ac70 <_wcsrtombs_r>
    3b84:	01412e83          	lw	t4,20(sp)
    3b88:	02012e03          	lw	t3,32(sp)
    3b8c:	00ad0463          	beq	s10,a0,3b94 <_vfprintf_r+0x1c58>
    3b90:	0240106f          	j	4bb4 <_vfprintf_r+0x2c78>
    3b94:	01ac0733          	add	a4,s8,s10
    3b98:	00070023          	sb	zero,0(a4)
    3b9c:	07714603          	lbu	a2,119(sp)
    3ba0:	fffd4813          	not	a6,s10
    3ba4:	41f85813          	sra	a6,a6,0x1f
    3ba8:	01612a23          	sw	s6,20(sp)
    3bac:	02012223          	sw	zero,36(sp)
    3bb0:	02012023          	sw	zero,32(sp)
    3bb4:	010d7cb3          	and	s9,s10,a6
    3bb8:	00000313          	li	t1,0
    3bbc:	00000a13          	li	s4,0
    3bc0:	00061463          	bnez	a2,3bc8 <_vfprintf_r+0x1c8c>
    3bc4:	db8fe06f          	j	217c <_vfprintf_r+0x240>
    3bc8:	9d5fe06f          	j	259c <_vfprintf_r+0x660>
    3bcc:	00048e93          	mv	t4,s1
    3bd0:	000a0293          	mv	t0,s4
    3bd4:	00070493          	mv	s1,a4
    3bd8:	01a484b3          	add	s1,s1,s10
    3bdc:	00178793          	add	a5,a5,1
    3be0:	00542023          	sw	t0,0(s0)
    3be4:	e48fe06f          	j	222c <_vfprintf_r+0x2f0>
    3be8:	01412783          	lw	a5,20(sp)
    3bec:	00c12703          	lw	a4,12(sp)
    3bf0:	0007a783          	lw	a5,0(a5)
    3bf4:	00e7a023          	sw	a4,0(a5)
    3bf8:	fadfe06f          	j	2ba4 <_vfprintf_r+0xc68>
    3bfc:	02012e83          	lw	t4,32(sp)
    3c00:	00040293          	mv	t0,s0
    3c04:	000a0413          	mv	s0,s4
    3c08:	008484b3          	add	s1,s1,s0
    3c0c:	001d0d13          	add	s10,s10,1
    3c10:	005b2023          	sw	t0,0(s6)
    3c14:	b7dfe06f          	j	2790 <_vfprintf_r+0x854>
    3c18:	03412703          	lw	a4,52(sp)
    3c1c:	03012783          	lw	a5,48(sp)
    3c20:	00700613          	li	a2,7
    3c24:	00e42023          	sw	a4,0(s0)
    3c28:	0a412703          	lw	a4,164(sp)
    3c2c:	009784b3          	add	s1,a5,s1
    3c30:	00f42223          	sw	a5,4(s0)
    3c34:	00170713          	add	a4,a4,1
    3c38:	0a912423          	sw	s1,168(sp)
    3c3c:	0ae12223          	sw	a4,164(sp)
    3c40:	00840413          	add	s0,s0,8
    3c44:	3ae64463          	blt	a2,a4,3fec <_vfprintf_r+0x20b0>
    3c48:	3e06cee3          	bltz	a3,4844 <_vfprintf_r+0x2908>
    3c4c:	01812783          	lw	a5,24(sp)
    3c50:	00170713          	add	a4,a4,1
    3c54:	01842023          	sw	s8,0(s0)
    3c58:	009784b3          	add	s1,a5,s1
    3c5c:	00f42223          	sw	a5,4(s0)
    3c60:	0a912423          	sw	s1,168(sp)
    3c64:	0ae12223          	sw	a4,164(sp)
    3c68:	00700793          	li	a5,7
    3c6c:	00e7c463          	blt	a5,a4,3c74 <_vfprintf_r+0x1d38>
    3c70:	dd0fe06f          	j	2240 <_vfprintf_r+0x304>
    3c74:	b61fe06f          	j	27d4 <_vfprintf_r+0x898>
    3c78:	01000613          	li	a2,16
    3c7c:	0a412683          	lw	a3,164(sp)
    3c80:	0000c297          	auipc	t0,0xc
    3c84:	99c28293          	add	t0,t0,-1636 # f61c <zeroes.0>
    3c88:	09665463          	bge	a2,s6,3d10 <_vfprintf_r+0x1dd4>
    3c8c:	00040793          	mv	a5,s0
    3c90:	00048713          	mv	a4,s1
    3c94:	00812403          	lw	s0,8(sp)
    3c98:	01000893          	li	a7,16
    3c9c:	00700d13          	li	s10,7
    3ca0:	05d12223          	sw	t4,68(sp)
    3ca4:	00028493          	mv	s1,t0
    3ca8:	00c0006f          	j	3cb4 <_vfprintf_r+0x1d78>
    3cac:	ff0b0b13          	add	s6,s6,-16
    3cb0:	0568d863          	bge	a7,s6,3d00 <_vfprintf_r+0x1dc4>
    3cb4:	01070713          	add	a4,a4,16
    3cb8:	00168693          	add	a3,a3,1
    3cbc:	0097a023          	sw	s1,0(a5)
    3cc0:	0117a223          	sw	a7,4(a5)
    3cc4:	0ae12423          	sw	a4,168(sp)
    3cc8:	0ad12223          	sw	a3,164(sp)
    3ccc:	00878793          	add	a5,a5,8
    3cd0:	fcdd5ee3          	bge	s10,a3,3cac <_vfprintf_r+0x1d70>
    3cd4:	0a010613          	add	a2,sp,160
    3cd8:	00040593          	mv	a1,s0
    3cdc:	00098513          	mv	a0,s3
    3ce0:	118010ef          	jal	4df8 <__sprint_r>
    3ce4:	00050463          	beqz	a0,3cec <_vfprintf_r+0x1db0>
    3ce8:	f24fe06f          	j	240c <_vfprintf_r+0x4d0>
    3cec:	0a812703          	lw	a4,168(sp)
    3cf0:	0a412683          	lw	a3,164(sp)
    3cf4:	0ac10793          	add	a5,sp,172
    3cf8:	01000893          	li	a7,16
    3cfc:	fb1ff06f          	j	3cac <_vfprintf_r+0x1d70>
    3d00:	04412e83          	lw	t4,68(sp)
    3d04:	00048293          	mv	t0,s1
    3d08:	00078413          	mv	s0,a5
    3d0c:	00070493          	mv	s1,a4
    3d10:	016484b3          	add	s1,s1,s6
    3d14:	00168693          	add	a3,a3,1
    3d18:	00542023          	sw	t0,0(s0)
    3d1c:	01642223          	sw	s6,4(s0)
    3d20:	0a912423          	sw	s1,168(sp)
    3d24:	0ad12223          	sw	a3,164(sp)
    3d28:	00700713          	li	a4,7
    3d2c:	00840413          	add	s0,s0,8
    3d30:	bed75c63          	bge	a4,a3,3128 <_vfprintf_r+0x11ec>
    3d34:	00812583          	lw	a1,8(sp)
    3d38:	0a010613          	add	a2,sp,160
    3d3c:	00098513          	mv	a0,s3
    3d40:	05d12223          	sw	t4,68(sp)
    3d44:	0b4010ef          	jal	4df8 <__sprint_r>
    3d48:	00050463          	beqz	a0,3d50 <_vfprintf_r+0x1e14>
    3d4c:	ec0fe06f          	j	240c <_vfprintf_r+0x4d0>
    3d50:	0a812483          	lw	s1,168(sp)
    3d54:	04412e83          	lw	t4,68(sp)
    3d58:	0ac10413          	add	s0,sp,172
    3d5c:	bccff06f          	j	3128 <_vfprintf_r+0x11ec>
    3d60:	02812703          	lw	a4,40(sp)
    3d64:	09810893          	add	a7,sp,152
    3d68:	08410813          	add	a6,sp,132
    3d6c:	00070513          	mv	a0,a4
    3d70:	00050593          	mv	a1,a0
    3d74:	00030713          	mv	a4,t1
    3d78:	07c10793          	add	a5,sp,124
    3d7c:	00200693          	li	a3,2
    3d80:	00048613          	mv	a2,s1
    3d84:	00098513          	mv	a0,s3
    3d88:	03c12223          	sw	t3,36(sp)
    3d8c:	03d12023          	sw	t4,32(sp)
    3d90:	00612c23          	sw	t1,24(sp)
    3d94:	3a8040ef          	jal	813c <_dtoa_r>
    3d98:	02012e83          	lw	t4,32(sp)
    3d9c:	01812303          	lw	t1,24(sp)
    3da0:	02412e03          	lw	t3,36(sp)
    3da4:	001ef713          	and	a4,t4,1
    3da8:	00050c13          	mv	s8,a0
    3dac:	1a0712e3          	bnez	a4,4750 <_vfprintf_r+0x2814>
    3db0:	09812783          	lw	a5,152(sp)
    3db4:	07c12a03          	lw	s4,124(sp)
    3db8:	40a787b3          	sub	a5,a5,a0
    3dbc:	00f12c23          	sw	a5,24(sp)
    3dc0:	ffd00713          	li	a4,-3
    3dc4:	00ea4463          	blt	s4,a4,3dcc <_vfprintf_r+0x1e90>
    3dc8:	5b435663          	bge	t1,s4,4374 <_vfprintf_r+0x2438>
    3dcc:	ffee0e13          	add	t3,t3,-2
    3dd0:	fffa0d13          	add	s10,s4,-1
    3dd4:	07a12e23          	sw	s10,124(sp)
    3dd8:	0ffe7693          	zext.b	a3,t3
    3ddc:	00000613          	li	a2,0
    3de0:	08d10423          	sb	a3,136(sp)
    3de4:	02b00693          	li	a3,43
    3de8:	000d5863          	bgez	s10,3df8 <_vfprintf_r+0x1ebc>
    3dec:	00100713          	li	a4,1
    3df0:	41470d33          	sub	s10,a4,s4
    3df4:	02d00693          	li	a3,45
    3df8:	08d104a3          	sb	a3,137(sp)
    3dfc:	00900693          	li	a3,9
    3e00:	33a6d8e3          	bge	a3,s10,4930 <_vfprintf_r+0x29f4>
    3e04:	000c0793          	mv	a5,s8
    3e08:	09f10493          	add	s1,sp,159
    3e0c:	03212023          	sw	s2,32(sp)
    3e10:	00040c13          	mv	s8,s0
    3e14:	06300a13          	li	s4,99
    3e18:	000d0413          	mv	s0,s10
    3e1c:	03d12223          	sw	t4,36(sp)
    3e20:	05c12023          	sw	t3,64(sp)
    3e24:	00048913          	mv	s2,s1
    3e28:	00098c93          	mv	s9,s3
    3e2c:	00078d13          	mv	s10,a5
    3e30:	00a00593          	li	a1,10
    3e34:	00040513          	mv	a0,s0
    3e38:	09c0b0ef          	jal	eed4 <__modsi3>
    3e3c:	03050713          	add	a4,a0,48
    3e40:	00090b13          	mv	s6,s2
    3e44:	00040513          	mv	a0,s0
    3e48:	feeb0fa3          	sb	a4,-1(s6)
    3e4c:	00a00593          	li	a1,10
    3e50:	00040993          	mv	s3,s0
    3e54:	7fd0a0ef          	jal	ee50 <__divsi3>
    3e58:	fff90913          	add	s2,s2,-1
    3e5c:	00050413          	mv	s0,a0
    3e60:	fd3a48e3          	blt	s4,s3,3e30 <_vfprintf_r+0x1ef4>
    3e64:	000c8993          	mv	s3,s9
    3e68:	03050713          	add	a4,a0,48
    3e6c:	00090c93          	mv	s9,s2
    3e70:	ffeb0693          	add	a3,s6,-2
    3e74:	feec8fa3          	sb	a4,-1(s9)
    3e78:	000c0413          	mv	s0,s8
    3e7c:	02412e83          	lw	t4,36(sp)
    3e80:	04012e03          	lw	t3,64(sp)
    3e84:	02012903          	lw	s2,32(sp)
    3e88:	000d0c13          	mv	s8,s10
    3e8c:	4c96f6e3          	bgeu	a3,s1,4b58 <_vfprintf_r+0x2c1c>
    3e90:	08a10713          	add	a4,sp,138
    3e94:	0006c783          	lbu	a5,0(a3)
    3e98:	00168693          	add	a3,a3,1
    3e9c:	00170713          	add	a4,a4,1
    3ea0:	fef70fa3          	sb	a5,-1(a4)
    3ea4:	fe9698e3          	bne	a3,s1,3e94 <_vfprintf_r+0x1f58>
    3ea8:	15010793          	add	a5,sp,336
    3eac:	41678633          	sub	a2,a5,s6
    3eb0:	f5360793          	add	a5,a2,-173
    3eb4:	04f12023          	sw	a5,64(sp)
    3eb8:	01812783          	lw	a5,24(sp)
    3ebc:	04012683          	lw	a3,64(sp)
    3ec0:	00100713          	li	a4,1
    3ec4:	00d78d33          	add	s10,a5,a3
    3ec8:	28f75ce3          	bge	a4,a5,4960 <_vfprintf_r+0x2a24>
    3ecc:	03012783          	lw	a5,48(sp)
    3ed0:	00fd0d33          	add	s10,s10,a5
    3ed4:	fffd4813          	not	a6,s10
    3ed8:	bffeff13          	and	t5,t4,-1025
    3edc:	41f85813          	sra	a6,a6,0x1f
    3ee0:	100f6e93          	or	t4,t5,256
    3ee4:	010d7cb3          	and	s9,s10,a6
    3ee8:	02012223          	sw	zero,36(sp)
    3eec:	02012023          	sw	zero,32(sp)
    3ef0:	00000a13          	li	s4,0
    3ef4:	04412783          	lw	a5,68(sp)
    3ef8:	46079263          	bnez	a5,435c <_vfprintf_r+0x2420>
    3efc:	07714603          	lbu	a2,119(sp)
    3f00:	00000313          	li	t1,0
    3f04:	00061463          	bnez	a2,3f0c <_vfprintf_r+0x1fd0>
    3f08:	a74fe06f          	j	217c <_vfprintf_r+0x240>
    3f0c:	e90fe06f          	j	259c <_vfprintf_r+0x660>
    3f10:	00812583          	lw	a1,8(sp)
    3f14:	0a010613          	add	a2,sp,160
    3f18:	00098513          	mv	a0,s3
    3f1c:	03d12023          	sw	t4,32(sp)
    3f20:	6d9000ef          	jal	4df8 <__sprint_r>
    3f24:	00050463          	beqz	a0,3f2c <_vfprintf_r+0x1ff0>
    3f28:	ce4fe06f          	j	240c <_vfprintf_r+0x4d0>
    3f2c:	07c12683          	lw	a3,124(sp)
    3f30:	0a812483          	lw	s1,168(sp)
    3f34:	02012e83          	lw	t4,32(sp)
    3f38:	0ac10413          	add	s0,sp,172
    3f3c:	ce0ff06f          	j	341c <_vfprintf_r+0x14e0>
    3f40:	00600c93          	li	s9,6
    3f44:	f14ff06f          	j	3658 <_vfprintf_r+0x171c>
    3f48:	0ffd7d13          	zext.b	s10,s10
    3f4c:	00000c93          	li	s9,0
    3f50:	bd5fe06f          	j	2b24 <_vfprintf_r+0xbe8>
    3f54:	0ffd7d13          	zext.b	s10,s10
    3f58:	00000c93          	li	s9,0
    3f5c:	e48ff06f          	j	35a4 <_vfprintf_r+0x1668>
    3f60:	018d1d13          	sll	s10,s10,0x18
    3f64:	418d5d13          	sra	s10,s10,0x18
    3f68:	41fd5c93          	sra	s9,s10,0x1f
    3f6c:	000c8793          	mv	a5,s9
    3f70:	b39fe06f          	j	2aa8 <_vfprintf_r+0xb6c>
    3f74:	01412783          	lw	a5,20(sp)
    3f78:	00c12703          	lw	a4,12(sp)
    3f7c:	0007a783          	lw	a5,0(a5)
    3f80:	00e79023          	sh	a4,0(a5)
    3f84:	c21fe06f          	j	2ba4 <_vfprintf_r+0xc68>
    3f88:	000c0513          	mv	a0,s8
    3f8c:	05d12223          	sw	t4,68(sp)
    3f90:	ad8fd0ef          	jal	1268 <strlen>
    3f94:	07714603          	lbu	a2,119(sp)
    3f98:	fff54813          	not	a6,a0
    3f9c:	41f85813          	sra	a6,a6,0x1f
    3fa0:	01612a23          	sw	s6,20(sp)
    3fa4:	02012223          	sw	zero,36(sp)
    3fa8:	02012023          	sw	zero,32(sp)
    3fac:	00012823          	sw	zero,16(sp)
    3fb0:	04412e83          	lw	t4,68(sp)
    3fb4:	00050d13          	mv	s10,a0
    3fb8:	01057cb3          	and	s9,a0,a6
    3fbc:	00000313          	li	t1,0
    3fc0:	07300e13          	li	t3,115
    3fc4:	00061463          	bnez	a2,3fcc <_vfprintf_r+0x2090>
    3fc8:	9b4fe06f          	j	217c <_vfprintf_r+0x240>
    3fcc:	dd0fe06f          	j	259c <_vfprintf_r+0x660>
    3fd0:	00812583          	lw	a1,8(sp)
    3fd4:	0a010613          	add	a2,sp,160
    3fd8:	00098513          	mv	a0,s3
    3fdc:	61d000ef          	jal	4df8 <__sprint_r>
    3fe0:	00051463          	bnez	a0,3fe8 <_vfprintf_r+0x20ac>
    3fe4:	be8fe06f          	j	23cc <_vfprintf_r+0x490>
    3fe8:	c38fe06f          	j	2420 <_vfprintf_r+0x4e4>
    3fec:	00812583          	lw	a1,8(sp)
    3ff0:	0a010613          	add	a2,sp,160
    3ff4:	00098513          	mv	a0,s3
    3ff8:	03d12023          	sw	t4,32(sp)
    3ffc:	5fd000ef          	jal	4df8 <__sprint_r>
    4000:	00050463          	beqz	a0,4008 <_vfprintf_r+0x20cc>
    4004:	c08fe06f          	j	240c <_vfprintf_r+0x4d0>
    4008:	07c12683          	lw	a3,124(sp)
    400c:	0a812483          	lw	s1,168(sp)
    4010:	0a412703          	lw	a4,164(sp)
    4014:	02012e83          	lw	t4,32(sp)
    4018:	0ac10413          	add	s0,sp,172
    401c:	c2dff06f          	j	3c48 <_vfprintf_r+0x1d0c>
    4020:	05862503          	lw	a0,88(a2)
    4024:	00f12623          	sw	a5,12(sp)
    4028:	fbdfc0ef          	jal	fe4 <__retarget_lock_release_recursive>
    402c:	00c12783          	lw	a5,12(sp)
    4030:	ab8fe06f          	j	22e8 <_vfprintf_r+0x3ac>
    4034:	00130a13          	add	s4,t1,1
    4038:	00200693          	li	a3,2
    403c:	02812703          	lw	a4,40(sp)
    4040:	09810893          	add	a7,sp,152
    4044:	08410813          	add	a6,sp,132
    4048:	00070513          	mv	a0,a4
    404c:	00050593          	mv	a1,a0
    4050:	000a0713          	mv	a4,s4
    4054:	07c10793          	add	a5,sp,124
    4058:	00048613          	mv	a2,s1
    405c:	00098513          	mv	a0,s3
    4060:	02612223          	sw	t1,36(sp)
    4064:	03c12023          	sw	t3,32(sp)
    4068:	01d12c23          	sw	t4,24(sp)
    406c:	0d0040ef          	jal	813c <_dtoa_r>
    4070:	02012e03          	lw	t3,32(sp)
    4074:	04600693          	li	a3,70
    4078:	01812e83          	lw	t4,24(sp)
    407c:	fdfe7d13          	and	s10,t3,-33
    4080:	02412303          	lw	t1,36(sp)
    4084:	00050c13          	mv	s8,a0
    4088:	01450733          	add	a4,a0,s4
    408c:	34dd14e3          	bne	s10,a3,4bd4 <_vfprintf_r+0x2c98>
    4090:	000c4603          	lbu	a2,0(s8)
    4094:	03000693          	li	a3,48
    4098:	6cd60263          	beq	a2,a3,475c <_vfprintf_r+0x2820>
    409c:	07c12683          	lw	a3,124(sp)
    40a0:	00d70733          	add	a4,a4,a3
    40a4:	02812683          	lw	a3,40(sp)
    40a8:	00048593          	mv	a1,s1
    40ac:	00000613          	li	a2,0
    40b0:	00068513          	mv	a0,a3
    40b4:	00000693          	li	a3,0
    40b8:	04e12823          	sw	a4,80(sp)
    40bc:	02612223          	sw	t1,36(sp)
    40c0:	03c12023          	sw	t3,32(sp)
    40c4:	01d12c23          	sw	t4,24(sp)
    40c8:	370090ef          	jal	d438 <__eqdf2>
    40cc:	01812e83          	lw	t4,24(sp)
    40d0:	02012e03          	lw	t3,32(sp)
    40d4:	02412303          	lw	t1,36(sp)
    40d8:	05012703          	lw	a4,80(sp)
    40dc:	62050863          	beqz	a0,470c <_vfprintf_r+0x27d0>
    40e0:	09812783          	lw	a5,152(sp)
    40e4:	00e7fe63          	bgeu	a5,a4,4100 <_vfprintf_r+0x21c4>
    40e8:	03000613          	li	a2,48
    40ec:	00178693          	add	a3,a5,1
    40f0:	08d12c23          	sw	a3,152(sp)
    40f4:	00c78023          	sb	a2,0(a5)
    40f8:	09812783          	lw	a5,152(sp)
    40fc:	fee7e8e3          	bltu	a5,a4,40ec <_vfprintf_r+0x21b0>
    4100:	07c12a03          	lw	s4,124(sp)
    4104:	418787b3          	sub	a5,a5,s8
    4108:	04700713          	li	a4,71
    410c:	00f12c23          	sw	a5,24(sp)
    4110:	caed08e3          	beq	s10,a4,3dc0 <_vfprintf_r+0x1e84>
    4114:	04600713          	li	a4,70
    4118:	68ed0863          	beq	s10,a4,47a8 <_vfprintf_r+0x286c>
    411c:	fffa0d13          	add	s10,s4,-1
    4120:	cb5ff06f          	j	3dd4 <_vfprintf_r+0x1e98>
    4124:	02812703          	lw	a4,40(sp)
    4128:	07c10613          	add	a2,sp,124
    412c:	00048593          	mv	a1,s1
    4130:	00070513          	mv	a0,a4
    4134:	02612223          	sw	t1,36(sp)
    4138:	03c12023          	sw	t3,32(sp)
    413c:	01d12c23          	sw	t4,24(sp)
    4140:	4e9030ef          	jal	7e28 <frexp>
    4144:	7fffc717          	auipc	a4,0x7fffc
    4148:	56470713          	add	a4,a4,1380 # 800006a8 <__global_locale+0x174>
    414c:	00072603          	lw	a2,0(a4)
    4150:	00472683          	lw	a3,4(a4)
    4154:	578090ef          	jal	d6cc <__muldf3>
    4158:	00000613          	li	a2,0
    415c:	00000693          	li	a3,0
    4160:	00050a13          	mv	s4,a0
    4164:	00058d13          	mv	s10,a1
    4168:	2d0090ef          	jal	d438 <__eqdf2>
    416c:	01812e83          	lw	t4,24(sp)
    4170:	02012e03          	lw	t3,32(sp)
    4174:	02412303          	lw	t1,36(sp)
    4178:	00051663          	bnez	a0,4184 <_vfprintf_r+0x2248>
    417c:	00100713          	li	a4,1
    4180:	06e12e23          	sw	a4,124(sp)
    4184:	0000b797          	auipc	a5,0xb
    4188:	fc478793          	add	a5,a5,-60 # f148 <__fini_array_end+0x1bc>
    418c:	06100713          	li	a4,97
    4190:	02f12023          	sw	a5,32(sp)
    4194:	00ee1863          	bne	t3,a4,41a4 <_vfprintf_r+0x2268>
    4198:	0000b797          	auipc	a5,0xb
    419c:	f9c78793          	add	a5,a5,-100 # f134 <__fini_array_end+0x1a8>
    41a0:	02f12023          	sw	a5,32(sp)
    41a4:	7fffc717          	auipc	a4,0x7fffc
    41a8:	50c70713          	add	a4,a4,1292 # 800006b0 <__global_locale+0x17c>
    41ac:	00072783          	lw	a5,0(a4)
    41b0:	00472803          	lw	a6,4(a4)
    41b4:	000c0493          	mv	s1,s8
    41b8:	00f12c23          	sw	a5,24(sp)
    41bc:	000d0793          	mv	a5,s10
    41c0:	03212223          	sw	s2,36(sp)
    41c4:	000c0d13          	mv	s10,s8
    41c8:	02012903          	lw	s2,32(sp)
    41cc:	00098c13          	mv	s8,s3
    41d0:	01012e23          	sw	a6,28(sp)
    41d4:	fff30b13          	add	s6,t1,-1
    41d8:	fff00c93          	li	s9,-1
    41dc:	05d12023          	sw	t4,64(sp)
    41e0:	05c12823          	sw	t3,80(sp)
    41e4:	04812a23          	sw	s0,84(sp)
    41e8:	00078993          	mv	s3,a5
    41ec:	01c0006f          	j	4208 <_vfprintf_r+0x22cc>
    41f0:	00000613          	li	a2,0
    41f4:	00000693          	li	a3,0
    41f8:	fffb0413          	add	s0,s6,-1
    41fc:	23c090ef          	jal	d438 <__eqdf2>
    4200:	0a0504e3          	beqz	a0,4aa8 <_vfprintf_r+0x2b6c>
    4204:	00040b13          	mv	s6,s0
    4208:	01812603          	lw	a2,24(sp)
    420c:	01c12683          	lw	a3,28(sp)
    4210:	000a0513          	mv	a0,s4
    4214:	00098593          	mv	a1,s3
    4218:	4b4090ef          	jal	d6cc <__muldf3>
    421c:	00058a13          	mv	s4,a1
    4220:	00050993          	mv	s3,a0
    4224:	5940a0ef          	jal	e7b8 <__fixdfsi>
    4228:	00050413          	mv	s0,a0
    422c:	6100a0ef          	jal	e83c <__floatsidf>
    4230:	00050613          	mv	a2,a0
    4234:	00058693          	mv	a3,a1
    4238:	00098513          	mv	a0,s3
    423c:	000a0593          	mv	a1,s4
    4240:	41d090ef          	jal	de5c <__subdf3>
    4244:	00890733          	add	a4,s2,s0
    4248:	00074703          	lbu	a4,0(a4)
    424c:	00048813          	mv	a6,s1
    4250:	00050a13          	mv	s4,a0
    4254:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4258:	00058993          	mv	s3,a1
    425c:	00148493          	add	s1,s1,1
    4260:	f99b18e3          	bne	s6,s9,41f0 <_vfprintf_r+0x22b4>
    4264:	7fffc697          	auipc	a3,0x7fffc
    4268:	45468693          	add	a3,a3,1108 # 800006b8 <__global_locale+0x184>
    426c:	0006a303          	lw	t1,0(a3)
    4270:	0046a383          	lw	t2,4(a3)
    4274:	05012e03          	lw	t3,80(sp)
    4278:	00030613          	mv	a2,t1
    427c:	00038693          	mv	a3,t2
    4280:	01012c23          	sw	a6,24(sp)
    4284:	02412903          	lw	s2,36(sp)
    4288:	000c0993          	mv	s3,s8
    428c:	03c12223          	sw	t3,36(sp)
    4290:	000d0c13          	mv	s8,s10
    4294:	00058d13          	mv	s10,a1
    4298:	22c090ef          	jal	d4c4 <__gedf2>
    429c:	7fffc797          	auipc	a5,0x7fffc
    42a0:	41c78793          	add	a5,a5,1052 # 800006b8 <__global_locale+0x184>
    42a4:	00040b13          	mv	s6,s0
    42a8:	0007a303          	lw	t1,0(a5)
    42ac:	05412403          	lw	s0,84(sp)
    42b0:	0047a383          	lw	t2,4(a5)
    42b4:	01812803          	lw	a6,24(sp)
    42b8:	02412e03          	lw	t3,36(sp)
    42bc:	04012e83          	lw	t4,64(sp)
    42c0:	0aa05ce3          	blez	a0,4b78 <_vfprintf_r+0x2c3c>
    42c4:	02012783          	lw	a5,32(sp)
    42c8:	09012c23          	sw	a6,152(sp)
    42cc:	fff4c603          	lbu	a2,-1(s1)
    42d0:	00f7c583          	lbu	a1,15(a5)
    42d4:	00048693          	mv	a3,s1
    42d8:	02b61063          	bne	a2,a1,42f8 <_vfprintf_r+0x23bc>
    42dc:	03000513          	li	a0,48
    42e0:	fea68fa3          	sb	a0,-1(a3)
    42e4:	09812683          	lw	a3,152(sp)
    42e8:	fff68793          	add	a5,a3,-1
    42ec:	08f12c23          	sw	a5,152(sp)
    42f0:	fff6c603          	lbu	a2,-1(a3)
    42f4:	feb606e3          	beq	a2,a1,42e0 <_vfprintf_r+0x23a4>
    42f8:	00160593          	add	a1,a2,1
    42fc:	03900513          	li	a0,57
    4300:	0ff5f593          	zext.b	a1,a1
    4304:	04a60463          	beq	a2,a0,434c <_vfprintf_r+0x2410>
    4308:	feb68fa3          	sb	a1,-1(a3)
    430c:	00048793          	mv	a5,s1
    4310:	07c12a03          	lw	s4,124(sp)
    4314:	418787b3          	sub	a5,a5,s8
    4318:	06100613          	li	a2,97
    431c:	fffa0d13          	add	s10,s4,-1
    4320:	00f12c23          	sw	a5,24(sp)
    4324:	07a12e23          	sw	s10,124(sp)
    4328:	07000693          	li	a3,112
    432c:	00ce0663          	beq	t3,a2,4338 <_vfprintf_r+0x23fc>
    4330:	05000693          	li	a3,80
    4334:	04100e13          	li	t3,65
    4338:	00100613          	li	a2,1
    433c:	aa5ff06f          	j	3de0 <_vfprintf_r+0x1ea4>
    4340:	00030a13          	mv	s4,t1
    4344:	00300693          	li	a3,3
    4348:	cf5ff06f          	j	403c <_vfprintf_r+0x2100>
    434c:	02012783          	lw	a5,32(sp)
    4350:	00a7c583          	lbu	a1,10(a5)
    4354:	feb68fa3          	sb	a1,-1(a3)
    4358:	fb5ff06f          	j	430c <_vfprintf_r+0x23d0>
    435c:	02d00713          	li	a4,45
    4360:	06e10ba3          	sb	a4,119(sp)
    4364:	02d00613          	li	a2,45
    4368:	00000313          	li	t1,0
    436c:	001c8c93          	add	s9,s9,1
    4370:	e0dfd06f          	j	217c <_vfprintf_r+0x240>
    4374:	01812783          	lw	a5,24(sp)
    4378:	46fa4063          	blt	s4,a5,47d8 <_vfprintf_r+0x289c>
    437c:	001ef713          	and	a4,t4,1
    4380:	000a0d13          	mv	s10,s4
    4384:	00070663          	beqz	a4,4390 <_vfprintf_r+0x2454>
    4388:	03012783          	lw	a5,48(sp)
    438c:	00fa0d33          	add	s10,s4,a5
    4390:	400eff13          	and	t5,t4,1024
    4394:	000f0463          	beqz	t5,439c <_vfprintf_r+0x2460>
    4398:	5f404e63          	bgtz	s4,4994 <_vfprintf_r+0x2a58>
    439c:	fffd4813          	not	a6,s10
    43a0:	41f85813          	sra	a6,a6,0x1f
    43a4:	010d7cb3          	and	s9,s10,a6
    43a8:	06700e13          	li	t3,103
    43ac:	000b0e93          	mv	t4,s6
    43b0:	02012223          	sw	zero,36(sp)
    43b4:	02012023          	sw	zero,32(sp)
    43b8:	b3dff06f          	j	3ef4 <_vfprintf_r+0x1fb8>
    43bc:	02d00793          	li	a5,45
    43c0:	06f10ba3          	sb	a5,119(sp)
    43c4:	02d00613          	li	a2,45
    43c8:	998fe06f          	j	2560 <_vfprintf_r+0x624>
    43cc:	01812783          	lw	a5,24(sp)
    43d0:	02012a03          	lw	s4,32(sp)
    43d4:	05212823          	sw	s2,80(sp)
    43d8:	00fc07b3          	add	a5,s8,a5
    43dc:	05712c23          	sw	s7,88(sp)
    43e0:	05912e23          	sw	s9,92(sp)
    43e4:	00040713          	mv	a4,s0
    43e8:	04f12223          	sw	a5,68(sp)
    43ec:	02412403          	lw	s0,36(sp)
    43f0:	05d12a23          	sw	t4,84(sp)
    43f4:	03812223          	sw	s8,36(sp)
    43f8:	03c12b83          	lw	s7,60(sp)
    43fc:	04c12c83          	lw	s9,76(sp)
    4400:	00812903          	lw	s2,8(sp)
    4404:	00700693          	li	a3,7
    4408:	01000d13          	li	s10,16
    440c:	0000bb17          	auipc	s6,0xb
    4410:	210b0b13          	add	s6,s6,528 # f61c <zeroes.0>
    4414:	00048613          	mv	a2,s1
    4418:	00030c13          	mv	s8,t1
    441c:	09405863          	blez	s4,44ac <_vfprintf_r+0x2570>
    4420:	16805e63          	blez	s0,459c <_vfprintf_r+0x2660>
    4424:	fff40413          	add	s0,s0,-1
    4428:	04812783          	lw	a5,72(sp)
    442c:	01960633          	add	a2,a2,s9
    4430:	01972223          	sw	s9,4(a4)
    4434:	00f72023          	sw	a5,0(a4)
    4438:	0a412783          	lw	a5,164(sp)
    443c:	0ac12423          	sw	a2,168(sp)
    4440:	00870713          	add	a4,a4,8
    4444:	00178793          	add	a5,a5,1
    4448:	0af12223          	sw	a5,164(sp)
    444c:	14f6ce63          	blt	a3,a5,45a8 <_vfprintf_r+0x266c>
    4450:	04412783          	lw	a5,68(sp)
    4454:	000bc583          	lbu	a1,0(s7)
    4458:	418784b3          	sub	s1,a5,s8
    445c:	0095d463          	bge	a1,s1,4464 <_vfprintf_r+0x2528>
    4460:	00058493          	mv	s1,a1
    4464:	02905663          	blez	s1,4490 <_vfprintf_r+0x2554>
    4468:	0a412583          	lw	a1,164(sp)
    446c:	00960633          	add	a2,a2,s1
    4470:	01872023          	sw	s8,0(a4)
    4474:	00158593          	add	a1,a1,1
    4478:	00972223          	sw	s1,4(a4)
    447c:	0ac12423          	sw	a2,168(sp)
    4480:	0ab12223          	sw	a1,164(sp)
    4484:	14b6c663          	blt	a3,a1,45d0 <_vfprintf_r+0x2694>
    4488:	000bc583          	lbu	a1,0(s7)
    448c:	00870713          	add	a4,a4,8
    4490:	fff4c513          	not	a0,s1
    4494:	41f55513          	sra	a0,a0,0x1f
    4498:	00a4f7b3          	and	a5,s1,a0
    449c:	40f584b3          	sub	s1,a1,a5
    44a0:	04904663          	bgtz	s1,44ec <_vfprintf_r+0x25b0>
    44a4:	00bc0c33          	add	s8,s8,a1
    44a8:	f7404ce3          	bgtz	s4,4420 <_vfprintf_r+0x24e4>
    44ac:	f6804ce3          	bgtz	s0,4424 <_vfprintf_r+0x24e8>
    44b0:	01812783          	lw	a5,24(sp)
    44b4:	000c0313          	mv	t1,s8
    44b8:	02412c03          	lw	s8,36(sp)
    44bc:	03712e23          	sw	s7,60(sp)
    44c0:	00070413          	mv	s0,a4
    44c4:	00fc0733          	add	a4,s8,a5
    44c8:	05012903          	lw	s2,80(sp)
    44cc:	05412e83          	lw	t4,84(sp)
    44d0:	05812b83          	lw	s7,88(sp)
    44d4:	05c12c83          	lw	s9,92(sp)
    44d8:	00060493          	mv	s1,a2
    44dc:	00676463          	bltu	a4,t1,44e4 <_vfprintf_r+0x25a8>
    44e0:	c59fe06f          	j	3138 <_vfprintf_r+0x11fc>
    44e4:	00070313          	mv	t1,a4
    44e8:	c51fe06f          	j	3138 <_vfprintf_r+0x11fc>
    44ec:	0a412583          	lw	a1,164(sp)
    44f0:	0000be97          	auipc	t4,0xb
    44f4:	12ce8e93          	add	t4,t4,300 # f61c <zeroes.0>
    44f8:	069d5c63          	bge	s10,s1,4570 <_vfprintf_r+0x2634>
    44fc:	02812023          	sw	s0,32(sp)
    4500:	00048413          	mv	s0,s1
    4504:	000b0493          	mv	s1,s6
    4508:	00c0006f          	j	4514 <_vfprintf_r+0x25d8>
    450c:	ff040413          	add	s0,s0,-16
    4510:	048d5a63          	bge	s10,s0,4564 <_vfprintf_r+0x2628>
    4514:	01060613          	add	a2,a2,16
    4518:	00158593          	add	a1,a1,1
    451c:	01672023          	sw	s6,0(a4)
    4520:	01a72223          	sw	s10,4(a4)
    4524:	0ac12423          	sw	a2,168(sp)
    4528:	0ab12223          	sw	a1,164(sp)
    452c:	00870713          	add	a4,a4,8
    4530:	fcb6dee3          	bge	a3,a1,450c <_vfprintf_r+0x25d0>
    4534:	0a010613          	add	a2,sp,160
    4538:	00090593          	mv	a1,s2
    453c:	00098513          	mv	a0,s3
    4540:	0b9000ef          	jal	4df8 <__sprint_r>
    4544:	00050463          	beqz	a0,454c <_vfprintf_r+0x2610>
    4548:	ec5fd06f          	j	240c <_vfprintf_r+0x4d0>
    454c:	ff040413          	add	s0,s0,-16
    4550:	0a812603          	lw	a2,168(sp)
    4554:	0a412583          	lw	a1,164(sp)
    4558:	0ac10713          	add	a4,sp,172
    455c:	00700693          	li	a3,7
    4560:	fa8d4ae3          	blt	s10,s0,4514 <_vfprintf_r+0x25d8>
    4564:	00048e93          	mv	t4,s1
    4568:	00040493          	mv	s1,s0
    456c:	02012403          	lw	s0,32(sp)
    4570:	00960633          	add	a2,a2,s1
    4574:	00158593          	add	a1,a1,1
    4578:	01d72023          	sw	t4,0(a4)
    457c:	00972223          	sw	s1,4(a4)
    4580:	0ac12423          	sw	a2,168(sp)
    4584:	0ab12223          	sw	a1,164(sp)
    4588:	10b6ce63          	blt	a3,a1,46a4 <_vfprintf_r+0x2768>
    458c:	000bc583          	lbu	a1,0(s7)
    4590:	00870713          	add	a4,a4,8
    4594:	00bc0c33          	add	s8,s8,a1
    4598:	f11ff06f          	j	44a8 <_vfprintf_r+0x256c>
    459c:	fffb8b93          	add	s7,s7,-1
    45a0:	fffa0a13          	add	s4,s4,-1
    45a4:	e85ff06f          	j	4428 <_vfprintf_r+0x24ec>
    45a8:	0a010613          	add	a2,sp,160
    45ac:	00090593          	mv	a1,s2
    45b0:	00098513          	mv	a0,s3
    45b4:	045000ef          	jal	4df8 <__sprint_r>
    45b8:	00050463          	beqz	a0,45c0 <_vfprintf_r+0x2684>
    45bc:	e51fd06f          	j	240c <_vfprintf_r+0x4d0>
    45c0:	0a812603          	lw	a2,168(sp)
    45c4:	0ac10713          	add	a4,sp,172
    45c8:	00700693          	li	a3,7
    45cc:	e85ff06f          	j	4450 <_vfprintf_r+0x2514>
    45d0:	0a010613          	add	a2,sp,160
    45d4:	00090593          	mv	a1,s2
    45d8:	00098513          	mv	a0,s3
    45dc:	01d000ef          	jal	4df8 <__sprint_r>
    45e0:	00050463          	beqz	a0,45e8 <_vfprintf_r+0x26ac>
    45e4:	e29fd06f          	j	240c <_vfprintf_r+0x4d0>
    45e8:	000bc583          	lbu	a1,0(s7)
    45ec:	0a812603          	lw	a2,168(sp)
    45f0:	0ac10713          	add	a4,sp,172
    45f4:	00700693          	li	a3,7
    45f8:	e99ff06f          	j	4490 <_vfprintf_r+0x2554>
    45fc:	04c12783          	lw	a5,76(sp)
    4600:	04812583          	lw	a1,72(sp)
    4604:	00000913          	li	s2,0
    4608:	40fc0c33          	sub	s8,s8,a5
    460c:	00078613          	mv	a2,a5
    4610:	000c0513          	mv	a0,s8
    4614:	468030ef          	jal	7a7c <strncpy>
    4618:	00144783          	lbu	a5,1(s0)
    461c:	00a00613          	li	a2,10
    4620:	00000693          	li	a3,0
    4624:	00f037b3          	snez	a5,a5
    4628:	000d0513          	mv	a0,s10
    462c:	000c8593          	mv	a1,s9
    4630:	00f40433          	add	s0,s0,a5
    4634:	78d060ef          	jal	b5c0 <__udivdi3>
    4638:	a10ff06f          	j	3848 <_vfprintf_r+0x190c>
    463c:	09810713          	add	a4,sp,152
    4640:	00000693          	li	a3,0
    4644:	08410613          	add	a2,sp,132
    4648:	00000593          	li	a1,0
    464c:	00098513          	mv	a0,s3
    4650:	01c12a23          	sw	t3,20(sp)
    4654:	01d12823          	sw	t4,16(sp)
    4658:	618060ef          	jal	ac70 <_wcsrtombs_r>
    465c:	fff00713          	li	a4,-1
    4660:	01012e83          	lw	t4,16(sp)
    4664:	01412e03          	lw	t3,20(sp)
    4668:	00050d13          	mv	s10,a0
    466c:	30e50063          	beq	a0,a4,496c <_vfprintf_r+0x2a30>
    4670:	09812223          	sw	s8,132(sp)
    4674:	cacff06f          	j	3b20 <_vfprintf_r+0x1be4>
    4678:	07714603          	lbu	a2,119(sp)
    467c:	01612a23          	sw	s6,20(sp)
    4680:	02012223          	sw	zero,36(sp)
    4684:	02012023          	sw	zero,32(sp)
    4688:	00012823          	sw	zero,16(sp)
    468c:	00000c93          	li	s9,0
    4690:	00000313          	li	t1,0
    4694:	00000a13          	li	s4,0
    4698:	00061463          	bnez	a2,46a0 <_vfprintf_r+0x2764>
    469c:	ae1fd06f          	j	217c <_vfprintf_r+0x240>
    46a0:	efdfd06f          	j	259c <_vfprintf_r+0x660>
    46a4:	0a010613          	add	a2,sp,160
    46a8:	00090593          	mv	a1,s2
    46ac:	00098513          	mv	a0,s3
    46b0:	748000ef          	jal	4df8 <__sprint_r>
    46b4:	00050463          	beqz	a0,46bc <_vfprintf_r+0x2780>
    46b8:	d55fd06f          	j	240c <_vfprintf_r+0x4d0>
    46bc:	000bc583          	lbu	a1,0(s7)
    46c0:	0a812603          	lw	a2,168(sp)
    46c4:	0ac10713          	add	a4,sp,172
    46c8:	00700693          	li	a3,7
    46cc:	00bc0c33          	add	s8,s8,a1
    46d0:	dd9ff06f          	j	44a8 <_vfprintf_r+0x256c>
    46d4:	00812583          	lw	a1,8(sp)
    46d8:	0a010613          	add	a2,sp,160
    46dc:	00098513          	mv	a0,s3
    46e0:	05d12223          	sw	t4,68(sp)
    46e4:	714000ef          	jal	4df8 <__sprint_r>
    46e8:	00050463          	beqz	a0,46f0 <_vfprintf_r+0x27b4>
    46ec:	d21fd06f          	j	240c <_vfprintf_r+0x4d0>
    46f0:	0a812483          	lw	s1,168(sp)
    46f4:	04412e83          	lw	t4,68(sp)
    46f8:	0ac10413          	add	s0,sp,172
    46fc:	a19fe06f          	j	3114 <_vfprintf_r+0x11d8>
    4700:	00900793          	li	a5,9
    4704:	95a7e263          	bltu	a5,s10,3848 <_vfprintf_r+0x190c>
    4708:	98cff06f          	j	3894 <_vfprintf_r+0x1958>
    470c:	07c12a03          	lw	s4,124(sp)
    4710:	00070793          	mv	a5,a4
    4714:	9f1ff06f          	j	4104 <_vfprintf_r+0x21c8>
    4718:	00812583          	lw	a1,8(sp)
    471c:	0a010613          	add	a2,sp,160
    4720:	00098513          	mv	a0,s3
    4724:	03d12023          	sw	t4,32(sp)
    4728:	6d0000ef          	jal	4df8 <__sprint_r>
    472c:	00050463          	beqz	a0,4734 <_vfprintf_r+0x27f8>
    4730:	cddfd06f          	j	240c <_vfprintf_r+0x4d0>
    4734:	07c12d03          	lw	s10,124(sp)
    4738:	01812783          	lw	a5,24(sp)
    473c:	0a812483          	lw	s1,168(sp)
    4740:	02012e83          	lw	t4,32(sp)
    4744:	0ac10413          	add	s0,sp,172
    4748:	41a78d33          	sub	s10,a5,s10
    474c:	a49fe06f          	j	3194 <_vfprintf_r+0x1258>
    4750:	00650733          	add	a4,a0,t1
    4754:	04700d13          	li	s10,71
    4758:	94dff06f          	j	40a4 <_vfprintf_r+0x2168>
    475c:	02812603          	lw	a2,40(sp)
    4760:	00048593          	mv	a1,s1
    4764:	00000693          	li	a3,0
    4768:	00060513          	mv	a0,a2
    476c:	00000613          	li	a2,0
    4770:	04e12823          	sw	a4,80(sp)
    4774:	02612223          	sw	t1,36(sp)
    4778:	03c12023          	sw	t3,32(sp)
    477c:	01d12c23          	sw	t4,24(sp)
    4780:	4b9080ef          	jal	d438 <__eqdf2>
    4784:	01812e83          	lw	t4,24(sp)
    4788:	02012e03          	lw	t3,32(sp)
    478c:	02412303          	lw	t1,36(sp)
    4790:	05012703          	lw	a4,80(sp)
    4794:	34051e63          	bnez	a0,4af0 <_vfprintf_r+0x2bb4>
    4798:	07c12a03          	lw	s4,124(sp)
    479c:	01470733          	add	a4,a4,s4
    47a0:	418707b3          	sub	a5,a4,s8
    47a4:	00f12c23          	sw	a5,24(sp)
    47a8:	001ef713          	and	a4,t4,1
    47ac:	00676733          	or	a4,a4,t1
    47b0:	37405a63          	blez	s4,4b24 <_vfprintf_r+0x2be8>
    47b4:	26071263          	bnez	a4,4a18 <_vfprintf_r+0x2adc>
    47b8:	000a0d13          	mv	s10,s4
    47bc:	06600e13          	li	t3,102
    47c0:	400eff13          	and	t5,t4,1024
    47c4:	1c0f1a63          	bnez	t5,4998 <_vfprintf_r+0x2a5c>
    47c8:	fffd4813          	not	a6,s10
    47cc:	41f85813          	sra	a6,a6,0x1f
    47d0:	010d7cb3          	and	s9,s10,a6
    47d4:	bd9ff06f          	j	43ac <_vfprintf_r+0x2470>
    47d8:	01812783          	lw	a5,24(sp)
    47dc:	03012703          	lw	a4,48(sp)
    47e0:	06700e13          	li	t3,103
    47e4:	00e78d33          	add	s10,a5,a4
    47e8:	fd404ce3          	bgtz	s4,47c0 <_vfprintf_r+0x2884>
    47ec:	414d06b3          	sub	a3,s10,s4
    47f0:	00168d13          	add	s10,a3,1
    47f4:	fffd4813          	not	a6,s10
    47f8:	41f85813          	sra	a6,a6,0x1f
    47fc:	010d7cb3          	and	s9,s10,a6
    4800:	badff06f          	j	43ac <_vfprintf_r+0x2470>
    4804:	000e8613          	mv	a2,t4
    4808:	ad8fe06f          	j	2ae0 <_vfprintf_r+0xba4>
    480c:	00812783          	lw	a5,8(sp)
    4810:	0647a783          	lw	a5,100(a5)
    4814:	0017f793          	and	a5,a5,1
    4818:	02079063          	bnez	a5,4838 <_vfprintf_r+0x28fc>
    481c:	00812783          	lw	a5,8(sp)
    4820:	00c7d783          	lhu	a5,12(a5)
    4824:	2007f793          	and	a5,a5,512
    4828:	00079863          	bnez	a5,4838 <_vfprintf_r+0x28fc>
    482c:	00812783          	lw	a5,8(sp)
    4830:	0587a503          	lw	a0,88(a5)
    4834:	fb0fc0ef          	jal	fe4 <__retarget_lock_release_recursive>
    4838:	fff00793          	li	a5,-1
    483c:	00f12623          	sw	a5,12(sp)
    4840:	c2dfd06f          	j	246c <_vfprintf_r+0x530>
    4844:	ff000613          	li	a2,-16
    4848:	40d00d33          	neg	s10,a3
    484c:	0000b297          	auipc	t0,0xb
    4850:	dd028293          	add	t0,t0,-560 # f61c <zeroes.0>
    4854:	08c6d463          	bge	a3,a2,48dc <_vfprintf_r+0x29a0>
    4858:	03212023          	sw	s2,32(sp)
    485c:	01000693          	li	a3,16
    4860:	00700b13          	li	s6,7
    4864:	000e8a13          	mv	s4,t4
    4868:	00028913          	mv	s2,t0
    486c:	00c0006f          	j	4878 <_vfprintf_r+0x293c>
    4870:	ff0d0d13          	add	s10,s10,-16
    4874:	05a6de63          	bge	a3,s10,48d0 <_vfprintf_r+0x2994>
    4878:	01048493          	add	s1,s1,16
    487c:	00170713          	add	a4,a4,1
    4880:	01242023          	sw	s2,0(s0)
    4884:	00d42223          	sw	a3,4(s0)
    4888:	0a912423          	sw	s1,168(sp)
    488c:	0ae12223          	sw	a4,164(sp)
    4890:	00840413          	add	s0,s0,8
    4894:	fceb5ee3          	bge	s6,a4,4870 <_vfprintf_r+0x2934>
    4898:	00812583          	lw	a1,8(sp)
    489c:	0a010613          	add	a2,sp,160
    48a0:	00098513          	mv	a0,s3
    48a4:	554000ef          	jal	4df8 <__sprint_r>
    48a8:	00050463          	beqz	a0,48b0 <_vfprintf_r+0x2974>
    48ac:	b61fd06f          	j	240c <_vfprintf_r+0x4d0>
    48b0:	0a812483          	lw	s1,168(sp)
    48b4:	0a412703          	lw	a4,164(sp)
    48b8:	0ac10413          	add	s0,sp,172
    48bc:	01000693          	li	a3,16
    48c0:	fb1ff06f          	j	4870 <_vfprintf_r+0x2934>
    48c4:	00012823          	sw	zero,16(sp)
    48c8:	0ec10c13          	add	s8,sp,236
    48cc:	a88ff06f          	j	3b54 <_vfprintf_r+0x1c18>
    48d0:	00090293          	mv	t0,s2
    48d4:	02012903          	lw	s2,32(sp)
    48d8:	000a0e93          	mv	t4,s4
    48dc:	01a484b3          	add	s1,s1,s10
    48e0:	00170713          	add	a4,a4,1
    48e4:	00542023          	sw	t0,0(s0)
    48e8:	01a42223          	sw	s10,4(s0)
    48ec:	0a912423          	sw	s1,168(sp)
    48f0:	0ae12223          	sw	a4,164(sp)
    48f4:	00700693          	li	a3,7
    48f8:	00e6c463          	blt	a3,a4,4900 <_vfprintf_r+0x29c4>
    48fc:	b65fe06f          	j	3460 <_vfprintf_r+0x1524>
    4900:	00812583          	lw	a1,8(sp)
    4904:	0a010613          	add	a2,sp,160
    4908:	00098513          	mv	a0,s3
    490c:	03d12023          	sw	t4,32(sp)
    4910:	4e8000ef          	jal	4df8 <__sprint_r>
    4914:	00050463          	beqz	a0,491c <_vfprintf_r+0x29e0>
    4918:	af5fd06f          	j	240c <_vfprintf_r+0x4d0>
    491c:	0a812483          	lw	s1,168(sp)
    4920:	0a412703          	lw	a4,164(sp)
    4924:	02012e83          	lw	t4,32(sp)
    4928:	0ac10413          	add	s0,sp,172
    492c:	b20ff06f          	j	3c4c <_vfprintf_r+0x1d10>
    4930:	08a10693          	add	a3,sp,138
    4934:	00061863          	bnez	a2,4944 <_vfprintf_r+0x2a08>
    4938:	03000693          	li	a3,48
    493c:	08d10523          	sb	a3,138(sp)
    4940:	08b10693          	add	a3,sp,139
    4944:	15010793          	add	a5,sp,336
    4948:	40f68633          	sub	a2,a3,a5
    494c:	030d0713          	add	a4,s10,48
    4950:	0c960793          	add	a5,a2,201
    4954:	00e68023          	sb	a4,0(a3)
    4958:	04f12023          	sw	a5,64(sp)
    495c:	d5cff06f          	j	3eb8 <_vfprintf_r+0x1f7c>
    4960:	001ef713          	and	a4,t4,1
    4964:	d6070863          	beqz	a4,3ed4 <_vfprintf_r+0x1f98>
    4968:	d64ff06f          	j	3ecc <_vfprintf_r+0x1f90>
    496c:	00812783          	lw	a5,8(sp)
    4970:	00000293          	li	t0,0
    4974:	00c79783          	lh	a5,12(a5)
    4978:	0407e793          	or	a5,a5,64
    497c:	00812703          	lw	a4,8(sp)
    4980:	00f71623          	sh	a5,12(a4)
    4984:	a8dfd06f          	j	2410 <_vfprintf_r+0x4d4>
    4988:	00012823          	sw	zero,16(sp)
    498c:	00600313          	li	t1,6
    4990:	ff9fe06f          	j	3988 <_vfprintf_r+0x1a4c>
    4994:	06700e13          	li	t3,103
    4998:	03c12783          	lw	a5,60(sp)
    499c:	0ff00613          	li	a2,255
    49a0:	0007c703          	lbu	a4,0(a5)
    49a4:	22c70263          	beq	a4,a2,4bc8 <_vfprintf_r+0x2c8c>
    49a8:	00000593          	li	a1,0
    49ac:	00000693          	li	a3,0
    49b0:	01475e63          	bge	a4,s4,49cc <_vfprintf_r+0x2a90>
    49b4:	40ea0a33          	sub	s4,s4,a4
    49b8:	0017c703          	lbu	a4,1(a5)
    49bc:	04070863          	beqz	a4,4a0c <_vfprintf_r+0x2ad0>
    49c0:	00168693          	add	a3,a3,1
    49c4:	00178793          	add	a5,a5,1
    49c8:	fec714e3          	bne	a4,a2,49b0 <_vfprintf_r+0x2a74>
    49cc:	02f12e23          	sw	a5,60(sp)
    49d0:	02d12023          	sw	a3,32(sp)
    49d4:	02b12223          	sw	a1,36(sp)
    49d8:	02012783          	lw	a5,32(sp)
    49dc:	02412703          	lw	a4,36(sp)
    49e0:	04c12583          	lw	a1,76(sp)
    49e4:	05c12823          	sw	t3,80(sp)
    49e8:	00e78533          	add	a0,a5,a4
    49ec:	3a80a0ef          	jal	ed94 <__mulsi3>
    49f0:	01a50d33          	add	s10,a0,s10
    49f4:	fffd4813          	not	a6,s10
    49f8:	41f85813          	sra	a6,a6,0x1f
    49fc:	05012e03          	lw	t3,80(sp)
    4a00:	010d7cb3          	and	s9,s10,a6
    4a04:	000b0e93          	mv	t4,s6
    4a08:	cecff06f          	j	3ef4 <_vfprintf_r+0x1fb8>
    4a0c:	0007c703          	lbu	a4,0(a5)
    4a10:	00158593          	add	a1,a1,1
    4a14:	fb5ff06f          	j	49c8 <_vfprintf_r+0x2a8c>
    4a18:	03012783          	lw	a5,48(sp)
    4a1c:	06600e13          	li	t3,102
    4a20:	00f306b3          	add	a3,t1,a5
    4a24:	01468d33          	add	s10,a3,s4
    4a28:	d99ff06f          	j	47c0 <_vfprintf_r+0x2884>
    4a2c:	02c12783          	lw	a5,44(sp)
    4a30:	0a07c863          	bltz	a5,4ae0 <_vfprintf_r+0x2ba4>
    4a34:	07714603          	lbu	a2,119(sp)
    4a38:	04700713          	li	a4,71
    4a3c:	0000ac17          	auipc	s8,0xa
    4a40:	6f4c0c13          	add	s8,s8,1780 # f130 <__fini_array_end+0x1a4>
    4a44:	01c75463          	bge	a4,t3,4a4c <_vfprintf_r+0x2b10>
    4a48:	b31fd06f          	j	2578 <_vfprintf_r+0x63c>
    4a4c:	0000ac17          	auipc	s8,0xa
    4a50:	6e0c0c13          	add	s8,s8,1760 # f12c <__fini_array_end+0x1a0>
    4a54:	b25fd06f          	j	2578 <_vfprintf_r+0x63c>
    4a58:	07714603          	lbu	a2,119(sp)
    4a5c:	01612a23          	sw	s6,20(sp)
    4a60:	02012223          	sw	zero,36(sp)
    4a64:	02012023          	sw	zero,32(sp)
    4a68:	00030c93          	mv	s9,t1
    4a6c:	00030d13          	mv	s10,t1
    4a70:	07300e13          	li	t3,115
    4a74:	00000313          	li	t1,0
    4a78:	00061463          	bnez	a2,4a80 <_vfprintf_r+0x2b44>
    4a7c:	f00fd06f          	j	217c <_vfprintf_r+0x240>
    4a80:	b1dfd06f          	j	259c <_vfprintf_r+0x660>
    4a84:	00040313          	mv	t1,s0
    4a88:	01012903          	lw	s2,16(sp)
    4a8c:	000b0413          	mv	s0,s6
    4a90:	01412e03          	lw	t3,20(sp)
    4a94:	000c0b13          	mv	s6,s8
    4a98:	000a0e93          	mv	t4,s4
    4a9c:	000c8c13          	mv	s8,s9
    4aa0:	00030d13          	mv	s10,t1
    4aa4:	87cff06f          	j	3b20 <_vfprintf_r+0x1be4>
    4aa8:	001b0793          	add	a5,s6,1
    4aac:	000c0993          	mv	s3,s8
    4ab0:	02412903          	lw	s2,36(sp)
    4ab4:	04012e83          	lw	t4,64(sp)
    4ab8:	05012e03          	lw	t3,80(sp)
    4abc:	05412403          	lw	s0,84(sp)
    4ac0:	000d0c13          	mv	s8,s10
    4ac4:	00f487b3          	add	a5,s1,a5
    4ac8:	03000693          	li	a3,48
    4acc:	840b40e3          	bltz	s6,430c <_vfprintf_r+0x23d0>
    4ad0:	00148493          	add	s1,s1,1
    4ad4:	fed48fa3          	sb	a3,-1(s1)
    4ad8:	fe979ce3          	bne	a5,s1,4ad0 <_vfprintf_r+0x2b94>
    4adc:	835ff06f          	j	4310 <_vfprintf_r+0x23d4>
    4ae0:	02d00793          	li	a5,45
    4ae4:	06f10ba3          	sb	a5,119(sp)
    4ae8:	02d00613          	li	a2,45
    4aec:	f4dff06f          	j	4a38 <_vfprintf_r+0x2afc>
    4af0:	00100693          	li	a3,1
    4af4:	414686b3          	sub	a3,a3,s4
    4af8:	06d12e23          	sw	a3,124(sp)
    4afc:	da4ff06f          	j	40a0 <_vfprintf_r+0x2164>
    4b00:	01412783          	lw	a5,20(sp)
    4b04:	0007ab03          	lw	s6,0(a5)
    4b08:	00478793          	add	a5,a5,4
    4b0c:	000b5463          	bgez	s6,4b14 <_vfprintf_r+0x2bd8>
    4b10:	fff00b13          	li	s6,-1
    4b14:	00194e03          	lbu	t3,1(s2)
    4b18:	00f12a23          	sw	a5,20(sp)
    4b1c:	00068913          	mv	s2,a3
    4b20:	dccfd06f          	j	20ec <_vfprintf_r+0x1b0>
    4b24:	00071a63          	bnez	a4,4b38 <_vfprintf_r+0x2bfc>
    4b28:	00100c93          	li	s9,1
    4b2c:	06600e13          	li	t3,102
    4b30:	00100d13          	li	s10,1
    4b34:	879ff06f          	j	43ac <_vfprintf_r+0x2470>
    4b38:	03012783          	lw	a5,48(sp)
    4b3c:	06600e13          	li	t3,102
    4b40:	00178693          	add	a3,a5,1
    4b44:	00668d33          	add	s10,a3,t1
    4b48:	fffd4813          	not	a6,s10
    4b4c:	41f85813          	sra	a6,a6,0x1f
    4b50:	010d7cb3          	and	s9,s10,a6
    4b54:	859ff06f          	j	43ac <_vfprintf_r+0x2470>
    4b58:	00200793          	li	a5,2
    4b5c:	04f12023          	sw	a5,64(sp)
    4b60:	b58ff06f          	j	3eb8 <_vfprintf_r+0x1f7c>
    4b64:	00812703          	lw	a4,8(sp)
    4b68:	00c71783          	lh	a5,12(a4)
    4b6c:	0407e793          	or	a5,a5,64
    4b70:	00f71623          	sh	a5,12(a4)
    4b74:	8b5fd06f          	j	2428 <_vfprintf_r+0x4ec>
    4b78:	000a0513          	mv	a0,s4
    4b7c:	000d0593          	mv	a1,s10
    4b80:	00030613          	mv	a2,t1
    4b84:	00038693          	mv	a3,t2
    4b88:	05012023          	sw	a6,64(sp)
    4b8c:	03c12223          	sw	t3,36(sp)
    4b90:	01d12c23          	sw	t4,24(sp)
    4b94:	0a5080ef          	jal	d438 <__eqdf2>
    4b98:	01812e83          	lw	t4,24(sp)
    4b9c:	02412e03          	lw	t3,36(sp)
    4ba0:	04012803          	lw	a6,64(sp)
    4ba4:	f6051463          	bnez	a0,430c <_vfprintf_r+0x23d0>
    4ba8:	001b7693          	and	a3,s6,1
    4bac:	f6068063          	beqz	a3,430c <_vfprintf_r+0x23d0>
    4bb0:	f14ff06f          	j	42c4 <_vfprintf_r+0x2388>
    4bb4:	00812783          	lw	a5,8(sp)
    4bb8:	01012283          	lw	t0,16(sp)
    4bbc:	00c79783          	lh	a5,12(a5)
    4bc0:	0407e793          	or	a5,a5,64
    4bc4:	db9ff06f          	j	497c <_vfprintf_r+0x2a40>
    4bc8:	02012223          	sw	zero,36(sp)
    4bcc:	02012023          	sw	zero,32(sp)
    4bd0:	e09ff06f          	j	49d8 <_vfprintf_r+0x2a9c>
    4bd4:	04500d13          	li	s10,69
    4bd8:	cccff06f          	j	40a4 <_vfprintf_r+0x2168>

00004bdc <__sbprintf>:
    4bdc:	b7010113          	add	sp,sp,-1168
    4be0:	00c59783          	lh	a5,12(a1)
    4be4:	00e5d703          	lhu	a4,14(a1)
    4be8:	48812423          	sw	s0,1160(sp)
    4bec:	00058413          	mv	s0,a1
    4bf0:	000105b7          	lui	a1,0x10
    4bf4:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x5f5>
    4bf8:	06442303          	lw	t1,100(s0)
    4bfc:	01c42883          	lw	a7,28(s0)
    4c00:	02442803          	lw	a6,36(s0)
    4c04:	01071713          	sll	a4,a4,0x10
    4c08:	00b7f7b3          	and	a5,a5,a1
    4c0c:	00e7e7b3          	or	a5,a5,a4
    4c10:	40000593          	li	a1,1024
    4c14:	49212023          	sw	s2,1152(sp)
    4c18:	00f12a23          	sw	a5,20(sp)
    4c1c:	00050913          	mv	s2,a0
    4c20:	07010793          	add	a5,sp,112
    4c24:	06010513          	add	a0,sp,96
    4c28:	48112623          	sw	ra,1164(sp)
    4c2c:	48912223          	sw	s1,1156(sp)
    4c30:	47312e23          	sw	s3,1148(sp)
    4c34:	00060493          	mv	s1,a2
    4c38:	00068993          	mv	s3,a3
    4c3c:	06612623          	sw	t1,108(sp)
    4c40:	03112223          	sw	a7,36(sp)
    4c44:	03012623          	sw	a6,44(sp)
    4c48:	00f12423          	sw	a5,8(sp)
    4c4c:	00f12c23          	sw	a5,24(sp)
    4c50:	00b12823          	sw	a1,16(sp)
    4c54:	00b12e23          	sw	a1,28(sp)
    4c58:	02012023          	sw	zero,32(sp)
    4c5c:	b7cfc0ef          	jal	fd8 <__retarget_lock_init_recursive>
    4c60:	00048613          	mv	a2,s1
    4c64:	00098693          	mv	a3,s3
    4c68:	00810593          	add	a1,sp,8
    4c6c:	00090513          	mv	a0,s2
    4c70:	accfd0ef          	jal	1f3c <_vfprintf_r>
    4c74:	00050493          	mv	s1,a0
    4c78:	04055263          	bgez	a0,4cbc <__sbprintf+0xe0>
    4c7c:	01415783          	lhu	a5,20(sp)
    4c80:	0407f793          	and	a5,a5,64
    4c84:	00078863          	beqz	a5,4c94 <__sbprintf+0xb8>
    4c88:	00c45783          	lhu	a5,12(s0)
    4c8c:	0407e793          	or	a5,a5,64
    4c90:	00f41623          	sh	a5,12(s0)
    4c94:	06012503          	lw	a0,96(sp)
    4c98:	b44fc0ef          	jal	fdc <__retarget_lock_close_recursive>
    4c9c:	48c12083          	lw	ra,1164(sp)
    4ca0:	48812403          	lw	s0,1160(sp)
    4ca4:	48012903          	lw	s2,1152(sp)
    4ca8:	47c12983          	lw	s3,1148(sp)
    4cac:	00048513          	mv	a0,s1
    4cb0:	48412483          	lw	s1,1156(sp)
    4cb4:	49010113          	add	sp,sp,1168
    4cb8:	00008067          	ret
    4cbc:	00810593          	add	a1,sp,8
    4cc0:	00090513          	mv	a0,s2
    4cc4:	449010ef          	jal	690c <_fflush_r>
    4cc8:	fa050ae3          	beqz	a0,4c7c <__sbprintf+0xa0>
    4ccc:	fff00493          	li	s1,-1
    4cd0:	fadff06f          	j	4c7c <__sbprintf+0xa0>

00004cd4 <__sprint_r.part.0>:
    4cd4:	0645a783          	lw	a5,100(a1)
    4cd8:	fd010113          	add	sp,sp,-48
    4cdc:	01612823          	sw	s6,16(sp)
    4ce0:	02112623          	sw	ra,44(sp)
    4ce4:	01279713          	sll	a4,a5,0x12
    4ce8:	00060b13          	mv	s6,a2
    4cec:	0e075863          	bgez	a4,4ddc <__sprint_r.part.0+0x108>
    4cf0:	00862783          	lw	a5,8(a2)
    4cf4:	03212023          	sw	s2,32(sp)
    4cf8:	01312e23          	sw	s3,28(sp)
    4cfc:	01512a23          	sw	s5,20(sp)
    4d00:	01712623          	sw	s7,12(sp)
    4d04:	00058913          	mv	s2,a1
    4d08:	00062b83          	lw	s7,0(a2)
    4d0c:	00050993          	mv	s3,a0
    4d10:	fff00a93          	li	s5,-1
    4d14:	0a078863          	beqz	a5,4dc4 <__sprint_r.part.0+0xf0>
    4d18:	02812423          	sw	s0,40(sp)
    4d1c:	02912223          	sw	s1,36(sp)
    4d20:	01412c23          	sw	s4,24(sp)
    4d24:	01812423          	sw	s8,8(sp)
    4d28:	004bac03          	lw	s8,4(s7)
    4d2c:	000ba403          	lw	s0,0(s7)
    4d30:	002c5a13          	srl	s4,s8,0x2
    4d34:	060a0663          	beqz	s4,4da0 <__sprint_r.part.0+0xcc>
    4d38:	00000493          	li	s1,0
    4d3c:	00c0006f          	j	4d48 <__sprint_r.part.0+0x74>
    4d40:	00440413          	add	s0,s0,4
    4d44:	049a0c63          	beq	s4,s1,4d9c <__sprint_r.part.0+0xc8>
    4d48:	00042583          	lw	a1,0(s0)
    4d4c:	00090613          	mv	a2,s2
    4d50:	00098513          	mv	a0,s3
    4d54:	399020ef          	jal	78ec <_fputwc_r>
    4d58:	00148493          	add	s1,s1,1
    4d5c:	ff5512e3          	bne	a0,s5,4d40 <__sprint_r.part.0+0x6c>
    4d60:	02812403          	lw	s0,40(sp)
    4d64:	02412483          	lw	s1,36(sp)
    4d68:	02012903          	lw	s2,32(sp)
    4d6c:	01c12983          	lw	s3,28(sp)
    4d70:	01812a03          	lw	s4,24(sp)
    4d74:	01412a83          	lw	s5,20(sp)
    4d78:	00c12b83          	lw	s7,12(sp)
    4d7c:	00812c03          	lw	s8,8(sp)
    4d80:	fff00513          	li	a0,-1
    4d84:	02c12083          	lw	ra,44(sp)
    4d88:	000b2423          	sw	zero,8(s6)
    4d8c:	000b2223          	sw	zero,4(s6)
    4d90:	01012b03          	lw	s6,16(sp)
    4d94:	03010113          	add	sp,sp,48
    4d98:	00008067          	ret
    4d9c:	008b2783          	lw	a5,8(s6)
    4da0:	ffcc7c13          	and	s8,s8,-4
    4da4:	418787b3          	sub	a5,a5,s8
    4da8:	00fb2423          	sw	a5,8(s6)
    4dac:	008b8b93          	add	s7,s7,8
    4db0:	f6079ce3          	bnez	a5,4d28 <__sprint_r.part.0+0x54>
    4db4:	02812403          	lw	s0,40(sp)
    4db8:	02412483          	lw	s1,36(sp)
    4dbc:	01812a03          	lw	s4,24(sp)
    4dc0:	00812c03          	lw	s8,8(sp)
    4dc4:	02012903          	lw	s2,32(sp)
    4dc8:	01c12983          	lw	s3,28(sp)
    4dcc:	01412a83          	lw	s5,20(sp)
    4dd0:	00c12b83          	lw	s7,12(sp)
    4dd4:	00000513          	li	a0,0
    4dd8:	fadff06f          	j	4d84 <__sprint_r.part.0+0xb0>
    4ddc:	6b5010ef          	jal	6c90 <__sfvwrite_r>
    4de0:	02c12083          	lw	ra,44(sp)
    4de4:	000b2423          	sw	zero,8(s6)
    4de8:	000b2223          	sw	zero,4(s6)
    4dec:	01012b03          	lw	s6,16(sp)
    4df0:	03010113          	add	sp,sp,48
    4df4:	00008067          	ret

00004df8 <__sprint_r>:
    4df8:	00862703          	lw	a4,8(a2)
    4dfc:	00070463          	beqz	a4,4e04 <__sprint_r+0xc>
    4e00:	ed5ff06f          	j	4cd4 <__sprint_r.part.0>
    4e04:	00062223          	sw	zero,4(a2)
    4e08:	00000513          	li	a0,0
    4e0c:	00008067          	ret

00004e10 <_vfiprintf_r>:
    4e10:	eb010113          	add	sp,sp,-336
    4e14:	14812423          	sw	s0,328(sp)
    4e18:	13312e23          	sw	s3,316(sp)
    4e1c:	13812423          	sw	s8,296(sp)
    4e20:	00050413          	mv	s0,a0
    4e24:	00058993          	mv	s3,a1
    4e28:	00060c13          	mv	s8,a2
    4e2c:	00000593          	li	a1,0
    4e30:	00800613          	li	a2,8
    4e34:	05010513          	add	a0,sp,80
    4e38:	13512a23          	sw	s5,308(sp)
    4e3c:	14112623          	sw	ra,332(sp)
    4e40:	00068a93          	mv	s5,a3
    4e44:	9a4fc0ef          	jal	fe8 <memset>
    4e48:	00040863          	beqz	s0,4e58 <_vfiprintf_r+0x48>
    4e4c:	03442783          	lw	a5,52(s0)
    4e50:	00079463          	bnez	a5,4e58 <_vfiprintf_r+0x48>
    4e54:	49c0106f          	j	62f0 <_vfiprintf_r+0x14e0>
    4e58:	0649a703          	lw	a4,100(s3)
    4e5c:	00c99783          	lh	a5,12(s3)
    4e60:	00177713          	and	a4,a4,1
    4e64:	00071863          	bnez	a4,4e74 <_vfiprintf_r+0x64>
    4e68:	2007f713          	and	a4,a5,512
    4e6c:	00071463          	bnez	a4,4e74 <_vfiprintf_r+0x64>
    4e70:	0b80106f          	j	5f28 <_vfiprintf_r+0x1118>
    4e74:	01279713          	sll	a4,a5,0x12
    4e78:	02074663          	bltz	a4,4ea4 <_vfiprintf_r+0x94>
    4e7c:	0649a703          	lw	a4,100(s3)
    4e80:	00002637          	lui	a2,0x2
    4e84:	ffffe6b7          	lui	a3,0xffffe
    4e88:	00c7e7b3          	or	a5,a5,a2
    4e8c:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4e90:	01079793          	sll	a5,a5,0x10
    4e94:	4107d793          	sra	a5,a5,0x10
    4e98:	00d77733          	and	a4,a4,a3
    4e9c:	00f99623          	sh	a5,12(s3)
    4ea0:	06e9a223          	sw	a4,100(s3)
    4ea4:	0087f713          	and	a4,a5,8
    4ea8:	2e070463          	beqz	a4,5190 <_vfiprintf_r+0x380>
    4eac:	0109a703          	lw	a4,16(s3)
    4eb0:	2e070063          	beqz	a4,5190 <_vfiprintf_r+0x380>
    4eb4:	01a7f713          	and	a4,a5,26
    4eb8:	00a00693          	li	a3,10
    4ebc:	2ed70c63          	beq	a4,a3,51b4 <_vfiprintf_r+0x3a4>
    4ec0:	13412c23          	sw	s4,312(sp)
    4ec4:	06c10a13          	add	s4,sp,108
    4ec8:	14912223          	sw	s1,324(sp)
    4ecc:	15212023          	sw	s2,320(sp)
    4ed0:	13612823          	sw	s6,304(sp)
    4ed4:	13712623          	sw	s7,300(sp)
    4ed8:	13912223          	sw	s9,292(sp)
    4edc:	13a12023          	sw	s10,288(sp)
    4ee0:	000c0c93          	mv	s9,s8
    4ee4:	11b12e23          	sw	s11,284(sp)
    4ee8:	07412023          	sw	s4,96(sp)
    4eec:	06012423          	sw	zero,104(sp)
    4ef0:	06012223          	sw	zero,100(sp)
    4ef4:	00012a23          	sw	zero,20(sp)
    4ef8:	02012623          	sw	zero,44(sp)
    4efc:	02012823          	sw	zero,48(sp)
    4f00:	02012a23          	sw	zero,52(sp)
    4f04:	00012623          	sw	zero,12(sp)
    4f08:	7fffb497          	auipc	s1,0x7fffb
    4f0c:	62c48493          	add	s1,s1,1580 # 80000534 <__global_locale>
    4f10:	02500913          	li	s2,37
    4f14:	0000ab97          	auipc	s7,0xa
    4f18:	728b8b93          	add	s7,s7,1832 # f63c <blanks.1+0x10>
    4f1c:	0000bb17          	auipc	s6,0xb
    4f20:	88cb0b13          	add	s6,s6,-1908 # f7a8 <zeroes.0>
    4f24:	000a0c13          	mv	s8,s4
    4f28:	000c8d93          	mv	s11,s9
    4f2c:	0e44ad03          	lw	s10,228(s1)
    4f30:	3f9020ef          	jal	7b28 <__locale_mb_cur_max>
    4f34:	00050693          	mv	a3,a0
    4f38:	05010713          	add	a4,sp,80
    4f3c:	000d8613          	mv	a2,s11
    4f40:	04810593          	add	a1,sp,72
    4f44:	00040513          	mv	a0,s0
    4f48:	000d00e7          	jalr	s10
    4f4c:	2e050e63          	beqz	a0,5248 <_vfiprintf_r+0x438>
    4f50:	2c054e63          	bltz	a0,522c <_vfiprintf_r+0x41c>
    4f54:	04812783          	lw	a5,72(sp)
    4f58:	01278663          	beq	a5,s2,4f64 <_vfiprintf_r+0x154>
    4f5c:	00ad8db3          	add	s11,s11,a0
    4f60:	fcdff06f          	j	4f2c <_vfiprintf_r+0x11c>
    4f64:	00050d13          	mv	s10,a0
    4f68:	419d87b3          	sub	a5,s11,s9
    4f6c:	2f9d9463          	bne	s11,s9,5254 <_vfiprintf_r+0x444>
    4f70:	00000e13          	li	t3,0
    4f74:	001dc683          	lbu	a3,1(s11)
    4f78:	001d8c93          	add	s9,s11,1
    4f7c:	040101a3          	sb	zero,67(sp)
    4f80:	fff00713          	li	a4,-1
    4f84:	00000893          	li	a7,0
    4f88:	05a00d13          	li	s10,90
    4f8c:	000e0d93          	mv	s11,t3
    4f90:	001c8c93          	add	s9,s9,1
    4f94:	fe068793          	add	a5,a3,-32
    4f98:	04fd6663          	bltu	s10,a5,4fe4 <_vfiprintf_r+0x1d4>
    4f9c:	00279793          	sll	a5,a5,0x2
    4fa0:	017787b3          	add	a5,a5,s7
    4fa4:	0007a783          	lw	a5,0(a5)
    4fa8:	017787b3          	add	a5,a5,s7
    4fac:	00078067          	jr	a5
    4fb0:	00000893          	li	a7,0
    4fb4:	fd068793          	add	a5,a3,-48
    4fb8:	00900593          	li	a1,9
    4fbc:	000cc683          	lbu	a3,0(s9)
    4fc0:	00289613          	sll	a2,a7,0x2
    4fc4:	011608b3          	add	a7,a2,a7
    4fc8:	00189893          	sll	a7,a7,0x1
    4fcc:	011788b3          	add	a7,a5,a7
    4fd0:	fd068793          	add	a5,a3,-48
    4fd4:	001c8c93          	add	s9,s9,1
    4fd8:	fef5f2e3          	bgeu	a1,a5,4fbc <_vfiprintf_r+0x1ac>
    4fdc:	fe068793          	add	a5,a3,-32
    4fe0:	fafd7ee3          	bgeu	s10,a5,4f9c <_vfiprintf_r+0x18c>
    4fe4:	000d8e13          	mv	t3,s11
    4fe8:	2c068663          	beqz	a3,52b4 <_vfiprintf_r+0x4a4>
    4fec:	0ad10623          	sb	a3,172(sp)
    4ff0:	040101a3          	sb	zero,67(sp)
    4ff4:	00100e93          	li	t4,1
    4ff8:	00100d13          	li	s10,1
    4ffc:	0ac10813          	add	a6,sp,172
    5000:	00012823          	sw	zero,16(sp)
    5004:	00000713          	li	a4,0
    5008:	00000f93          	li	t6,0
    500c:	06412603          	lw	a2,100(sp)
    5010:	084e7293          	and	t0,t3,132
    5014:	06812783          	lw	a5,104(sp)
    5018:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0xc5>
    501c:	00058f13          	mv	t5,a1
    5020:	00029663          	bnez	t0,502c <_vfiprintf_r+0x21c>
    5024:	41d88db3          	sub	s11,a7,t4
    5028:	47b046e3          	bgtz	s11,5c94 <_vfiprintf_r+0xe84>
    502c:	04314583          	lbu	a1,67(sp)
    5030:	02058a63          	beqz	a1,5064 <_vfiprintf_r+0x254>
    5034:	04310613          	add	a2,sp,67
    5038:	00178793          	add	a5,a5,1
    503c:	00100693          	li	a3,1
    5040:	00cc2023          	sw	a2,0(s8)
    5044:	00dc2223          	sw	a3,4(s8)
    5048:	06f12423          	sw	a5,104(sp)
    504c:	07e12223          	sw	t5,100(sp)
    5050:	00700613          	li	a2,7
    5054:	35e64ce3          	blt	a2,t5,5bac <_vfiprintf_r+0xd9c>
    5058:	000f0613          	mv	a2,t5
    505c:	008c0c13          	add	s8,s8,8
    5060:	001f0f13          	add	t5,t5,1
    5064:	080f8063          	beqz	t6,50e4 <_vfiprintf_r+0x2d4>
    5068:	00200613          	li	a2,2
    506c:	00278793          	add	a5,a5,2
    5070:	04410693          	add	a3,sp,68
    5074:	00cc2223          	sw	a2,4(s8)
    5078:	00dc2023          	sw	a3,0(s8)
    507c:	06f12423          	sw	a5,104(sp)
    5080:	07e12223          	sw	t5,100(sp)
    5084:	00700613          	li	a2,7
    5088:	3be652e3          	bge	a2,t5,5c2c <_vfiprintf_r+0xe1c>
    508c:	60078ae3          	beqz	a5,5ea0 <_vfiprintf_r+0x1090>
    5090:	06010613          	add	a2,sp,96
    5094:	00098593          	mv	a1,s3
    5098:	00040513          	mv	a0,s0
    509c:	03d12c23          	sw	t4,56(sp)
    50a0:	02e12423          	sw	a4,40(sp)
    50a4:	03112223          	sw	a7,36(sp)
    50a8:	03012023          	sw	a6,32(sp)
    50ac:	00512e23          	sw	t0,28(sp)
    50b0:	01c12c23          	sw	t3,24(sp)
    50b4:	c21ff0ef          	jal	4cd4 <__sprint_r.part.0>
    50b8:	22051463          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    50bc:	06412603          	lw	a2,100(sp)
    50c0:	06812783          	lw	a5,104(sp)
    50c4:	03812e83          	lw	t4,56(sp)
    50c8:	02812703          	lw	a4,40(sp)
    50cc:	02412883          	lw	a7,36(sp)
    50d0:	02012803          	lw	a6,32(sp)
    50d4:	01c12283          	lw	t0,28(sp)
    50d8:	01812e03          	lw	t3,24(sp)
    50dc:	000a0c13          	mv	s8,s4
    50e0:	00160f13          	add	t5,a2,1
    50e4:	08000593          	li	a1,128
    50e8:	06b286e3          	beq	t0,a1,5954 <_vfiprintf_r+0xb44>
    50ec:	41a70733          	sub	a4,a4,s10
    50f0:	1ae04ae3          	bgtz	a4,5aa4 <_vfiprintf_r+0xc94>
    50f4:	00fd07b3          	add	a5,s10,a5
    50f8:	010c2023          	sw	a6,0(s8)
    50fc:	01ac2223          	sw	s10,4(s8)
    5100:	06f12423          	sw	a5,104(sp)
    5104:	07e12223          	sw	t5,100(sp)
    5108:	00700713          	li	a4,7
    510c:	03e758e3          	bge	a4,t5,593c <_vfiprintf_r+0xb2c>
    5110:	24078063          	beqz	a5,5350 <_vfiprintf_r+0x540>
    5114:	06010613          	add	a2,sp,96
    5118:	00098593          	mv	a1,s3
    511c:	00040513          	mv	a0,s0
    5120:	03d12023          	sw	t4,32(sp)
    5124:	01112e23          	sw	a7,28(sp)
    5128:	01c12c23          	sw	t3,24(sp)
    512c:	ba9ff0ef          	jal	4cd4 <__sprint_r.part.0>
    5130:	1a051863          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5134:	06812783          	lw	a5,104(sp)
    5138:	02012e83          	lw	t4,32(sp)
    513c:	01c12883          	lw	a7,28(sp)
    5140:	01812e03          	lw	t3,24(sp)
    5144:	000a0c13          	mv	s8,s4
    5148:	004e7e13          	and	t3,t3,4
    514c:	000e0663          	beqz	t3,5158 <_vfiprintf_r+0x348>
    5150:	41d88db3          	sub	s11,a7,t4
    5154:	21b04a63          	bgtz	s11,5368 <_vfiprintf_r+0x558>
    5158:	01d8d463          	bge	a7,t4,5160 <_vfiprintf_r+0x350>
    515c:	000e8893          	mv	a7,t4
    5160:	00c12703          	lw	a4,12(sp)
    5164:	01170733          	add	a4,a4,a7
    5168:	00e12623          	sw	a4,12(sp)
    516c:	16079063          	bnez	a5,52cc <_vfiprintf_r+0x4bc>
    5170:	01012783          	lw	a5,16(sp)
    5174:	06012223          	sw	zero,100(sp)
    5178:	00078863          	beqz	a5,5188 <_vfiprintf_r+0x378>
    517c:	00078593          	mv	a1,a5
    5180:	00040513          	mv	a0,s0
    5184:	ab4fc0ef          	jal	1438 <_free_r>
    5188:	000a0c13          	mv	s8,s4
    518c:	d9dff06f          	j	4f28 <_vfiprintf_r+0x118>
    5190:	00098593          	mv	a1,s3
    5194:	00040513          	mv	a0,s0
    5198:	4b0020ef          	jal	7648 <__swsetup_r>
    519c:	00050463          	beqz	a0,51a4 <_vfiprintf_r+0x394>
    51a0:	3840106f          	j	6524 <_vfiprintf_r+0x1714>
    51a4:	00c99783          	lh	a5,12(s3)
    51a8:	00a00693          	li	a3,10
    51ac:	01a7f713          	and	a4,a5,26
    51b0:	d0d718e3          	bne	a4,a3,4ec0 <_vfiprintf_r+0xb0>
    51b4:	00e99703          	lh	a4,14(s3)
    51b8:	d00744e3          	bltz	a4,4ec0 <_vfiprintf_r+0xb0>
    51bc:	0649a703          	lw	a4,100(s3)
    51c0:	00177713          	and	a4,a4,1
    51c4:	00071863          	bnez	a4,51d4 <_vfiprintf_r+0x3c4>
    51c8:	2007f793          	and	a5,a5,512
    51cc:	00079463          	bnez	a5,51d4 <_vfiprintf_r+0x3c4>
    51d0:	2ac0106f          	j	647c <_vfiprintf_r+0x166c>
    51d4:	000a8693          	mv	a3,s5
    51d8:	000c0613          	mv	a2,s8
    51dc:	00098593          	mv	a1,s3
    51e0:	00040513          	mv	a0,s0
    51e4:	3e4010ef          	jal	65c8 <__sbprintf>
    51e8:	14c12083          	lw	ra,332(sp)
    51ec:	14812403          	lw	s0,328(sp)
    51f0:	00a12623          	sw	a0,12(sp)
    51f4:	00c12503          	lw	a0,12(sp)
    51f8:	13c12983          	lw	s3,316(sp)
    51fc:	13412a83          	lw	s5,308(sp)
    5200:	12812c03          	lw	s8,296(sp)
    5204:	15010113          	add	sp,sp,336
    5208:	00008067          	ret
    520c:	000aa883          	lw	a7,0(s5)
    5210:	004a8a93          	add	s5,s5,4
    5214:	3608cc63          	bltz	a7,558c <_vfiprintf_r+0x77c>
    5218:	000cc683          	lbu	a3,0(s9)
    521c:	d75ff06f          	j	4f90 <_vfiprintf_r+0x180>
    5220:	000cc683          	lbu	a3,0(s9)
    5224:	020ded93          	or	s11,s11,32
    5228:	d69ff06f          	j	4f90 <_vfiprintf_r+0x180>
    522c:	00800613          	li	a2,8
    5230:	00000593          	li	a1,0
    5234:	05010513          	add	a0,sp,80
    5238:	db1fb0ef          	jal	fe8 <memset>
    523c:	00100513          	li	a0,1
    5240:	00ad8db3          	add	s11,s11,a0
    5244:	ce9ff06f          	j	4f2c <_vfiprintf_r+0x11c>
    5248:	00050d13          	mv	s10,a0
    524c:	419d87b3          	sub	a5,s11,s9
    5250:	079d8263          	beq	s11,s9,52b4 <_vfiprintf_r+0x4a4>
    5254:	06812683          	lw	a3,104(sp)
    5258:	06412703          	lw	a4,100(sp)
    525c:	019c2023          	sw	s9,0(s8)
    5260:	00d786b3          	add	a3,a5,a3
    5264:	00170713          	add	a4,a4,1
    5268:	00fc2223          	sw	a5,4(s8)
    526c:	06d12423          	sw	a3,104(sp)
    5270:	06e12223          	sw	a4,100(sp)
    5274:	00700613          	li	a2,7
    5278:	008c0c13          	add	s8,s8,8
    527c:	02e65463          	bge	a2,a4,52a4 <_vfiprintf_r+0x494>
    5280:	38068ce3          	beqz	a3,5e18 <_vfiprintf_r+0x1008>
    5284:	06010613          	add	a2,sp,96
    5288:	00098593          	mv	a1,s3
    528c:	00040513          	mv	a0,s0
    5290:	00f12823          	sw	a5,16(sp)
    5294:	a41ff0ef          	jal	4cd4 <__sprint_r.part.0>
    5298:	01012783          	lw	a5,16(sp)
    529c:	04051c63          	bnez	a0,52f4 <_vfiprintf_r+0x4e4>
    52a0:	000a0c13          	mv	s8,s4
    52a4:	00c12703          	lw	a4,12(sp)
    52a8:	00f707b3          	add	a5,a4,a5
    52ac:	00f12623          	sw	a5,12(sp)
    52b0:	cc0d10e3          	bnez	s10,4f70 <_vfiprintf_r+0x160>
    52b4:	06812783          	lw	a5,104(sp)
    52b8:	00078463          	beqz	a5,52c0 <_vfiprintf_r+0x4b0>
    52bc:	22c0106f          	j	64e8 <_vfiprintf_r+0x16d8>
    52c0:	00c99783          	lh	a5,12(s3)
    52c4:	06012223          	sw	zero,100(sp)
    52c8:	0300006f          	j	52f8 <_vfiprintf_r+0x4e8>
    52cc:	06010613          	add	a2,sp,96
    52d0:	00098593          	mv	a1,s3
    52d4:	00040513          	mv	a0,s0
    52d8:	9fdff0ef          	jal	4cd4 <__sprint_r.part.0>
    52dc:	e8050ae3          	beqz	a0,5170 <_vfiprintf_r+0x360>
    52e0:	01012783          	lw	a5,16(sp)
    52e4:	00078863          	beqz	a5,52f4 <_vfiprintf_r+0x4e4>
    52e8:	01012583          	lw	a1,16(sp)
    52ec:	00040513          	mv	a0,s0
    52f0:	948fc0ef          	jal	1438 <_free_r>
    52f4:	00c99783          	lh	a5,12(s3)
    52f8:	0649a703          	lw	a4,100(s3)
    52fc:	00177713          	and	a4,a4,1
    5300:	16070a63          	beqz	a4,5474 <_vfiprintf_r+0x664>
    5304:	0407f793          	and	a5,a5,64
    5308:	14412483          	lw	s1,324(sp)
    530c:	14012903          	lw	s2,320(sp)
    5310:	13812a03          	lw	s4,312(sp)
    5314:	13012b03          	lw	s6,304(sp)
    5318:	12c12b83          	lw	s7,300(sp)
    531c:	12412c83          	lw	s9,292(sp)
    5320:	12012d03          	lw	s10,288(sp)
    5324:	11c12d83          	lw	s11,284(sp)
    5328:	00078463          	beqz	a5,5330 <_vfiprintf_r+0x520>
    532c:	2180106f          	j	6544 <_vfiprintf_r+0x1734>
    5330:	14c12083          	lw	ra,332(sp)
    5334:	14812403          	lw	s0,328(sp)
    5338:	00c12503          	lw	a0,12(sp)
    533c:	13c12983          	lw	s3,316(sp)
    5340:	13412a83          	lw	s5,308(sp)
    5344:	12812c03          	lw	s8,296(sp)
    5348:	15010113          	add	sp,sp,336
    534c:	00008067          	ret
    5350:	06012223          	sw	zero,100(sp)
    5354:	004e7e13          	and	t3,t3,4
    5358:	240e0ee3          	beqz	t3,5db4 <_vfiprintf_r+0xfa4>
    535c:	41d88db3          	sub	s11,a7,t4
    5360:	25b05ae3          	blez	s11,5db4 <_vfiprintf_r+0xfa4>
    5364:	000a0c13          	mv	s8,s4
    5368:	01000713          	li	a4,16
    536c:	06412683          	lw	a3,100(sp)
    5370:	01b74463          	blt	a4,s11,5378 <_vfiprintf_r+0x568>
    5374:	1900106f          	j	6504 <_vfiprintf_r+0x16f4>
    5378:	000a8713          	mv	a4,s5
    537c:	0000a317          	auipc	t1,0xa
    5380:	43c30313          	add	t1,t1,1084 # f7b8 <blanks.1>
    5384:	000c0593          	mv	a1,s8
    5388:	000d8a93          	mv	s5,s11
    538c:	01000813          	li	a6,16
    5390:	00700d13          	li	s10,7
    5394:	01112c23          	sw	a7,24(sp)
    5398:	01d12e23          	sw	t4,28(sp)
    539c:	00030c13          	mv	s8,t1
    53a0:	00070d93          	mv	s11,a4
    53a4:	0180006f          	j	53bc <_vfiprintf_r+0x5ac>
    53a8:	00268613          	add	a2,a3,2
    53ac:	00858593          	add	a1,a1,8
    53b0:	00070693          	mv	a3,a4
    53b4:	ff0a8a93          	add	s5,s5,-16
    53b8:	05585a63          	bge	a6,s5,540c <_vfiprintf_r+0x5fc>
    53bc:	01078793          	add	a5,a5,16
    53c0:	00168713          	add	a4,a3,1
    53c4:	0185a023          	sw	s8,0(a1)
    53c8:	0105a223          	sw	a6,4(a1)
    53cc:	06f12423          	sw	a5,104(sp)
    53d0:	06e12223          	sw	a4,100(sp)
    53d4:	fced5ae3          	bge	s10,a4,53a8 <_vfiprintf_r+0x598>
    53d8:	56078663          	beqz	a5,5944 <_vfiprintf_r+0xb34>
    53dc:	06010613          	add	a2,sp,96
    53e0:	00098593          	mv	a1,s3
    53e4:	00040513          	mv	a0,s0
    53e8:	8edff0ef          	jal	4cd4 <__sprint_r.part.0>
    53ec:	ee051ae3          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    53f0:	06412683          	lw	a3,100(sp)
    53f4:	01000813          	li	a6,16
    53f8:	ff0a8a93          	add	s5,s5,-16
    53fc:	06812783          	lw	a5,104(sp)
    5400:	000a0593          	mv	a1,s4
    5404:	00168613          	add	a2,a3,1
    5408:	fb584ae3          	blt	a6,s5,53bc <_vfiprintf_r+0x5ac>
    540c:	01812883          	lw	a7,24(sp)
    5410:	01c12e83          	lw	t4,28(sp)
    5414:	000d8713          	mv	a4,s11
    5418:	000c0313          	mv	t1,s8
    541c:	000a8d93          	mv	s11,s5
    5420:	00058c13          	mv	s8,a1
    5424:	00070a93          	mv	s5,a4
    5428:	01b787b3          	add	a5,a5,s11
    542c:	006c2023          	sw	t1,0(s8)
    5430:	01bc2223          	sw	s11,4(s8)
    5434:	06f12423          	sw	a5,104(sp)
    5438:	06c12223          	sw	a2,100(sp)
    543c:	00700713          	li	a4,7
    5440:	d0c75ce3          	bge	a4,a2,5158 <_vfiprintf_r+0x348>
    5444:	160788e3          	beqz	a5,5db4 <_vfiprintf_r+0xfa4>
    5448:	06010613          	add	a2,sp,96
    544c:	00098593          	mv	a1,s3
    5450:	00040513          	mv	a0,s0
    5454:	01d12e23          	sw	t4,28(sp)
    5458:	01112c23          	sw	a7,24(sp)
    545c:	879ff0ef          	jal	4cd4 <__sprint_r.part.0>
    5460:	e80510e3          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5464:	06812783          	lw	a5,104(sp)
    5468:	01c12e83          	lw	t4,28(sp)
    546c:	01812883          	lw	a7,24(sp)
    5470:	ce9ff06f          	j	5158 <_vfiprintf_r+0x348>
    5474:	2007f713          	and	a4,a5,512
    5478:	e80716e3          	bnez	a4,5304 <_vfiprintf_r+0x4f4>
    547c:	0589a503          	lw	a0,88(s3)
    5480:	b65fb0ef          	jal	fe4 <__retarget_lock_release_recursive>
    5484:	00c99783          	lh	a5,12(s3)
    5488:	e7dff06f          	j	5304 <_vfiprintf_r+0x4f4>
    548c:	000aa803          	lw	a6,0(s5)
    5490:	040101a3          	sb	zero,67(sp)
    5494:	000d8e13          	mv	t3,s11
    5498:	004a8a93          	add	s5,s5,4
    549c:	68080ae3          	beqz	a6,6330 <_vfiprintf_r+0x1520>
    54a0:	05300793          	li	a5,83
    54a4:	3cf68ce3          	beq	a3,a5,607c <_vfiprintf_r+0x126c>
    54a8:	010df793          	and	a5,s11,16
    54ac:	3c0798e3          	bnez	a5,607c <_vfiprintf_r+0x126c>
    54b0:	00075463          	bgez	a4,54b8 <_vfiprintf_r+0x6a8>
    54b4:	7fd0006f          	j	64b0 <_vfiprintf_r+0x16a0>
    54b8:	00070613          	mv	a2,a4
    54bc:	00080513          	mv	a0,a6
    54c0:	00000593          	li	a1,0
    54c4:	03112223          	sw	a7,36(sp)
    54c8:	00e12e23          	sw	a4,28(sp)
    54cc:	01012c23          	sw	a6,24(sp)
    54d0:	03b12023          	sw	s11,32(sp)
    54d4:	4e4020ef          	jal	79b8 <memchr>
    54d8:	00a12823          	sw	a0,16(sp)
    54dc:	01812803          	lw	a6,24(sp)
    54e0:	01c12703          	lw	a4,28(sp)
    54e4:	02012e03          	lw	t3,32(sp)
    54e8:	02412883          	lw	a7,36(sp)
    54ec:	00051463          	bnez	a0,54f4 <_vfiprintf_r+0x6e4>
    54f0:	7990006f          	j	6488 <_vfiprintf_r+0x1678>
    54f4:	41050d33          	sub	s10,a0,a6
    54f8:	fffd4e93          	not	t4,s10
    54fc:	41fede93          	sra	t4,t4,0x1f
    5500:	01dd7eb3          	and	t4,s10,t4
    5504:	00012823          	sw	zero,16(sp)
    5508:	6dd0006f          	j	63e4 <_vfiprintf_r+0x15d4>
    550c:	04300793          	li	a5,67
    5510:	000d8e13          	mv	t3,s11
    5514:	004a8d93          	add	s11,s5,4
    5518:	00f68663          	beq	a3,a5,5524 <_vfiprintf_r+0x714>
    551c:	010e7793          	and	a5,t3,16
    5520:	280788e3          	beqz	a5,5fb0 <_vfiprintf_r+0x11a0>
    5524:	00800613          	li	a2,8
    5528:	00000593          	li	a1,0
    552c:	05810513          	add	a0,sp,88
    5530:	01112e23          	sw	a7,28(sp)
    5534:	01c12c23          	sw	t3,24(sp)
    5538:	ab1fb0ef          	jal	fe8 <memset>
    553c:	000aa603          	lw	a2,0(s5)
    5540:	0ac10593          	add	a1,sp,172
    5544:	05810693          	add	a3,sp,88
    5548:	00040513          	mv	a0,s0
    554c:	00b12823          	sw	a1,16(sp)
    5550:	694050ef          	jal	abe4 <_wcrtomb_r>
    5554:	fff00793          	li	a5,-1
    5558:	01012583          	lw	a1,16(sp)
    555c:	01812e03          	lw	t3,24(sp)
    5560:	01c12883          	lw	a7,28(sp)
    5564:	00050d13          	mv	s10,a0
    5568:	00f51463          	bne	a0,a5,5570 <_vfiprintf_r+0x760>
    556c:	0200106f          	j	658c <_vfiprintf_r+0x177c>
    5570:	fff54e93          	not	t4,a0
    5574:	41fede93          	sra	t4,t4,0x1f
    5578:	01d57eb3          	and	t4,a0,t4
    557c:	040101a3          	sb	zero,67(sp)
    5580:	000d8a93          	mv	s5,s11
    5584:	00058813          	mv	a6,a1
    5588:	a79ff06f          	j	5000 <_vfiprintf_r+0x1f0>
    558c:	411008b3          	neg	a7,a7
    5590:	000cc683          	lbu	a3,0(s9)
    5594:	004ded93          	or	s11,s11,4
    5598:	9f9ff06f          	j	4f90 <_vfiprintf_r+0x180>
    559c:	010dee13          	or	t3,s11,16
    55a0:	020e7793          	and	a5,t3,32
    55a4:	0c0788e3          	beqz	a5,5e74 <_vfiprintf_r+0x1064>
    55a8:	007a8a93          	add	s5,s5,7
    55ac:	ff8afa93          	and	s5,s5,-8
    55b0:	004aa683          	lw	a3,4(s5)
    55b4:	000aad83          	lw	s11,0(s5)
    55b8:	008a8a93          	add	s5,s5,8
    55bc:	00068d13          	mv	s10,a3
    55c0:	3006c263          	bltz	a3,58c4 <_vfiprintf_r+0xab4>
    55c4:	32074063          	bltz	a4,58e4 <_vfiprintf_r+0xad4>
    55c8:	01ade6b3          	or	a3,s11,s10
    55cc:	f7fe7e13          	and	t3,t3,-129
    55d0:	30069a63          	bnez	a3,58e4 <_vfiprintf_r+0xad4>
    55d4:	68071ae3          	bnez	a4,6468 <_vfiprintf_r+0x1658>
    55d8:	04314783          	lbu	a5,67(sp)
    55dc:	00012823          	sw	zero,16(sp)
    55e0:	00000e93          	li	t4,0
    55e4:	00000d13          	li	s10,0
    55e8:	11010813          	add	a6,sp,272
    55ec:	00078463          	beqz	a5,55f4 <_vfiprintf_r+0x7e4>
    55f0:	001e8e93          	add	t4,t4,1
    55f4:	002e7f93          	and	t6,t3,2
    55f8:	a00f8ae3          	beqz	t6,500c <_vfiprintf_r+0x1fc>
    55fc:	002e8e93          	add	t4,t4,2
    5600:	00200f93          	li	t6,2
    5604:	a09ff06f          	j	500c <_vfiprintf_r+0x1fc>
    5608:	000cc683          	lbu	a3,0(s9)
    560c:	06800793          	li	a5,104
    5610:	4ef686e3          	beq	a3,a5,62fc <_vfiprintf_r+0x14ec>
    5614:	040ded93          	or	s11,s11,64
    5618:	979ff06f          	j	4f90 <_vfiprintf_r+0x180>
    561c:	010de613          	or	a2,s11,16
    5620:	02067793          	and	a5,a2,32
    5624:	000780e3          	beqz	a5,5e24 <_vfiprintf_r+0x1014>
    5628:	007a8a93          	add	s5,s5,7
    562c:	ff8afa93          	and	s5,s5,-8
    5630:	000aad83          	lw	s11,0(s5)
    5634:	004aad03          	lw	s10,4(s5)
    5638:	008a8a93          	add	s5,s5,8
    563c:	040101a3          	sb	zero,67(sp)
    5640:	00060e13          	mv	t3,a2
    5644:	2a074063          	bltz	a4,58e4 <_vfiprintf_r+0xad4>
    5648:	01ade6b3          	or	a3,s11,s10
    564c:	f7f67e13          	and	t3,a2,-129
    5650:	28069a63          	bnez	a3,58e4 <_vfiprintf_r+0xad4>
    5654:	00100793          	li	a5,1
    5658:	06071e63          	bnez	a4,56d4 <_vfiprintf_r+0x8c4>
    565c:	f6079ee3          	bnez	a5,55d8 <_vfiprintf_r+0x7c8>
    5660:	00167d13          	and	s10,a2,1
    5664:	0a0d0ce3          	beqz	s10,5f1c <_vfiprintf_r+0x110c>
    5668:	03000793          	li	a5,48
    566c:	10f107a3          	sb	a5,271(sp)
    5670:	000d0e93          	mv	t4,s10
    5674:	10f10813          	add	a6,sp,271
    5678:	2980006f          	j	5910 <_vfiprintf_r+0xb00>
    567c:	02b00793          	li	a5,43
    5680:	000cc683          	lbu	a3,0(s9)
    5684:	04f101a3          	sb	a5,67(sp)
    5688:	909ff06f          	j	4f90 <_vfiprintf_r+0x180>
    568c:	010de693          	or	a3,s11,16
    5690:	0206f793          	and	a5,a3,32
    5694:	7a078c63          	beqz	a5,5e4c <_vfiprintf_r+0x103c>
    5698:	007a8a93          	add	s5,s5,7
    569c:	ff8afa93          	and	s5,s5,-8
    56a0:	000aa783          	lw	a5,0(s5)
    56a4:	004aa583          	lw	a1,4(s5)
    56a8:	008a8a93          	add	s5,s5,8
    56ac:	040101a3          	sb	zero,67(sp)
    56b0:	bff6fe13          	and	t3,a3,-1025
    56b4:	02074c63          	bltz	a4,56ec <_vfiprintf_r+0x8dc>
    56b8:	00b7e633          	or	a2,a5,a1
    56bc:	b7f6f693          	and	a3,a3,-1153
    56c0:	420610e3          	bnez	a2,62e0 <_vfiprintf_r+0x14d0>
    56c4:	000e0613          	mv	a2,t3
    56c8:	00000793          	li	a5,0
    56cc:	00068e13          	mv	t3,a3
    56d0:	f80706e3          	beqz	a4,565c <_vfiprintf_r+0x84c>
    56d4:	00100693          	li	a3,1
    56d8:	58d788e3          	beq	a5,a3,6468 <_vfiprintf_r+0x1658>
    56dc:	00200693          	li	a3,2
    56e0:	46d786e3          	beq	a5,a3,634c <_vfiprintf_r+0x153c>
    56e4:	00000793          	li	a5,0
    56e8:	00000593          	li	a1,0
    56ec:	11010813          	add	a6,sp,272
    56f0:	01d59613          	sll	a2,a1,0x1d
    56f4:	0077f693          	and	a3,a5,7
    56f8:	0037d793          	srl	a5,a5,0x3
    56fc:	03068693          	add	a3,a3,48
    5700:	00f667b3          	or	a5,a2,a5
    5704:	0035d593          	srl	a1,a1,0x3
    5708:	fed80fa3          	sb	a3,-1(a6)
    570c:	00b7e633          	or	a2,a5,a1
    5710:	00080513          	mv	a0,a6
    5714:	fff80813          	add	a6,a6,-1
    5718:	fc061ce3          	bnez	a2,56f0 <_vfiprintf_r+0x8e0>
    571c:	001e7793          	and	a5,t3,1
    5720:	54078e63          	beqz	a5,5c7c <_vfiprintf_r+0xe6c>
    5724:	03000793          	li	a5,48
    5728:	54f68a63          	beq	a3,a5,5c7c <_vfiprintf_r+0xe6c>
    572c:	ffe50513          	add	a0,a0,-2
    5730:	fef80fa3          	sb	a5,-1(a6)
    5734:	11010793          	add	a5,sp,272
    5738:	40a78d33          	sub	s10,a5,a0
    573c:	00070e93          	mv	t4,a4
    5740:	09a744e3          	blt	a4,s10,5fc8 <_vfiprintf_r+0x11b8>
    5744:	00050813          	mv	a6,a0
    5748:	1c80006f          	j	5910 <_vfiprintf_r+0xb00>
    574c:	000086b7          	lui	a3,0x8
    5750:	83068693          	add	a3,a3,-2000 # 7830 <__fputwc+0xa4>
    5754:	04d11223          	sh	a3,68(sp)
    5758:	0000a697          	auipc	a3,0xa
    575c:	9dc68693          	add	a3,a3,-1572 # f134 <__fini_array_end+0x1a8>
    5760:	000aa783          	lw	a5,0(s5)
    5764:	00000593          	li	a1,0
    5768:	002dee13          	or	t3,s11,2
    576c:	004a8a93          	add	s5,s5,4
    5770:	00d12a23          	sw	a3,20(sp)
    5774:	040101a3          	sb	zero,67(sp)
    5778:	4c074863          	bltz	a4,5c48 <_vfiprintf_r+0xe38>
    577c:	00b7e6b3          	or	a3,a5,a1
    5780:	f7fe7513          	and	a0,t3,-129
    5784:	4a069c63          	bnez	a3,5c3c <_vfiprintf_r+0xe2c>
    5788:	000e0613          	mv	a2,t3
    578c:	00200793          	li	a5,2
    5790:	00050e13          	mv	t3,a0
    5794:	ec5ff06f          	j	5658 <_vfiprintf_r+0x848>
    5798:	00040513          	mv	a0,s0
    579c:	00e12c23          	sw	a4,24(sp)
    57a0:	01112823          	sw	a7,16(sp)
    57a4:	390020ef          	jal	7b34 <_localeconv_r>
    57a8:	00452783          	lw	a5,4(a0)
    57ac:	00078513          	mv	a0,a5
    57b0:	02f12a23          	sw	a5,52(sp)
    57b4:	ab5fb0ef          	jal	1268 <strlen>
    57b8:	00050793          	mv	a5,a0
    57bc:	00040513          	mv	a0,s0
    57c0:	02f12823          	sw	a5,48(sp)
    57c4:	370020ef          	jal	7b34 <_localeconv_r>
    57c8:	00852703          	lw	a4,8(a0)
    57cc:	03012783          	lw	a5,48(sp)
    57d0:	01012883          	lw	a7,16(sp)
    57d4:	02e12623          	sw	a4,44(sp)
    57d8:	01812703          	lw	a4,24(sp)
    57dc:	a2078ee3          	beqz	a5,5218 <_vfiprintf_r+0x408>
    57e0:	02c12783          	lw	a5,44(sp)
    57e4:	000cc683          	lbu	a3,0(s9)
    57e8:	fa078463          	beqz	a5,4f90 <_vfiprintf_r+0x180>
    57ec:	0007c783          	lbu	a5,0(a5)
    57f0:	fa078063          	beqz	a5,4f90 <_vfiprintf_r+0x180>
    57f4:	400ded93          	or	s11,s11,1024
    57f8:	f98ff06f          	j	4f90 <_vfiprintf_r+0x180>
    57fc:	020df793          	and	a5,s11,32
    5800:	78079263          	bnez	a5,5f84 <_vfiprintf_r+0x1174>
    5804:	010df793          	and	a5,s11,16
    5808:	30079ae3          	bnez	a5,631c <_vfiprintf_r+0x150c>
    580c:	040df793          	and	a5,s11,64
    5810:	400796e3          	bnez	a5,641c <_vfiprintf_r+0x160c>
    5814:	200dfe13          	and	t3,s11,512
    5818:	300e02e3          	beqz	t3,631c <_vfiprintf_r+0x150c>
    581c:	000aa783          	lw	a5,0(s5)
    5820:	00c12703          	lw	a4,12(sp)
    5824:	004a8a93          	add	s5,s5,4
    5828:	00e78023          	sb	a4,0(a5)
    582c:	efcff06f          	j	4f28 <_vfiprintf_r+0x118>
    5830:	000cc683          	lbu	a3,0(s9)
    5834:	06c00793          	li	a5,108
    5838:	2cf68ae3          	beq	a3,a5,630c <_vfiprintf_r+0x14fc>
    583c:	010ded93          	or	s11,s11,16
    5840:	f50ff06f          	j	4f90 <_vfiprintf_r+0x180>
    5844:	000cc683          	lbu	a3,0(s9)
    5848:	080ded93          	or	s11,s11,128
    584c:	f44ff06f          	j	4f90 <_vfiprintf_r+0x180>
    5850:	000cc683          	lbu	a3,0(s9)
    5854:	02a00793          	li	a5,42
    5858:	001c8593          	add	a1,s9,1
    585c:	54f680e3          	beq	a3,a5,659c <_vfiprintf_r+0x178c>
    5860:	fd068793          	add	a5,a3,-48
    5864:	00900613          	li	a2,9
    5868:	00000713          	li	a4,0
    586c:	00900513          	li	a0,9
    5870:	02f66463          	bltu	a2,a5,5898 <_vfiprintf_r+0xa88>
    5874:	0005c683          	lbu	a3,0(a1)
    5878:	00271613          	sll	a2,a4,0x2
    587c:	00e60733          	add	a4,a2,a4
    5880:	00171713          	sll	a4,a4,0x1
    5884:	00f70733          	add	a4,a4,a5
    5888:	fd068793          	add	a5,a3,-48
    588c:	00158593          	add	a1,a1,1
    5890:	fef572e3          	bgeu	a0,a5,5874 <_vfiprintf_r+0xa64>
    5894:	74074063          	bltz	a4,5fd4 <_vfiprintf_r+0x11c4>
    5898:	00058c93          	mv	s9,a1
    589c:	ef8ff06f          	j	4f94 <_vfiprintf_r+0x184>
    58a0:	000cc683          	lbu	a3,0(s9)
    58a4:	001ded93          	or	s11,s11,1
    58a8:	ee8ff06f          	j	4f90 <_vfiprintf_r+0x180>
    58ac:	04314783          	lbu	a5,67(sp)
    58b0:	000cc683          	lbu	a3,0(s9)
    58b4:	ec079e63          	bnez	a5,4f90 <_vfiprintf_r+0x180>
    58b8:	02000793          	li	a5,32
    58bc:	04f101a3          	sb	a5,67(sp)
    58c0:	ed0ff06f          	j	4f90 <_vfiprintf_r+0x180>
    58c4:	02d00613          	li	a2,45
    58c8:	01b036b3          	snez	a3,s11
    58cc:	41a000b3          	neg	ra,s10
    58d0:	04c101a3          	sb	a2,67(sp)
    58d4:	40d08d33          	sub	s10,ra,a3
    58d8:	41b00db3          	neg	s11,s11
    58dc:	00074463          	bltz	a4,58e4 <_vfiprintf_r+0xad4>
    58e0:	f7fe7e13          	and	t3,t3,-129
    58e4:	120d14e3          	bnez	s10,620c <_vfiprintf_r+0x13fc>
    58e8:	00900693          	li	a3,9
    58ec:	13b6e0e3          	bltu	a3,s11,620c <_vfiprintf_r+0x13fc>
    58f0:	030d8793          	add	a5,s11,48
    58f4:	0ff7f793          	zext.b	a5,a5
    58f8:	10f107a3          	sb	a5,271(sp)
    58fc:	00070e93          	mv	t4,a4
    5900:	00e04463          	bgtz	a4,5908 <_vfiprintf_r+0xaf8>
    5904:	00100e93          	li	t4,1
    5908:	00100d13          	li	s10,1
    590c:	10f10813          	add	a6,sp,271
    5910:	04314783          	lbu	a5,67(sp)
    5914:	00012823          	sw	zero,16(sp)
    5918:	cc079ce3          	bnez	a5,55f0 <_vfiprintf_r+0x7e0>
    591c:	cd9ff06f          	j	55f4 <_vfiprintf_r+0x7e4>
    5920:	00100713          	li	a4,1
    5924:	000d0793          	mv	a5,s10
    5928:	07012623          	sw	a6,108(sp)
    592c:	07a12823          	sw	s10,112(sp)
    5930:	07a12423          	sw	s10,104(sp)
    5934:	06e12223          	sw	a4,100(sp)
    5938:	000a0c13          	mv	s8,s4
    593c:	008c0c13          	add	s8,s8,8
    5940:	809ff06f          	j	5148 <_vfiprintf_r+0x338>
    5944:	00100613          	li	a2,1
    5948:	00000693          	li	a3,0
    594c:	000a0593          	mv	a1,s4
    5950:	a65ff06f          	j	53b4 <_vfiprintf_r+0x5a4>
    5954:	41d88db3          	sub	s11,a7,t4
    5958:	f9b05a63          	blez	s11,50ec <_vfiprintf_r+0x2dc>
    595c:	01000593          	li	a1,16
    5960:	3bb5dae3          	bge	a1,s11,6514 <_vfiprintf_r+0x1704>
    5964:	0000af97          	auipc	t6,0xa
    5968:	e44f8f93          	add	t6,t6,-444 # f7a8 <zeroes.0>
    596c:	02e12223          	sw	a4,36(sp)
    5970:	000a8713          	mv	a4,s5
    5974:	000c0693          	mv	a3,s8
    5978:	000d8a93          	mv	s5,s11
    597c:	01000f13          	li	t5,16
    5980:	00700293          	li	t0,7
    5984:	01c12c23          	sw	t3,24(sp)
    5988:	01012e23          	sw	a6,28(sp)
    598c:	03112023          	sw	a7,32(sp)
    5990:	03d12423          	sw	t4,40(sp)
    5994:	000f8c13          	mv	s8,t6
    5998:	00070d93          	mv	s11,a4
    599c:	0180006f          	j	59b4 <_vfiprintf_r+0xba4>
    59a0:	00260513          	add	a0,a2,2
    59a4:	00868693          	add	a3,a3,8
    59a8:	00070613          	mv	a2,a4
    59ac:	ff0a8a93          	add	s5,s5,-16
    59b0:	055f5c63          	bge	t5,s5,5a08 <_vfiprintf_r+0xbf8>
    59b4:	01078793          	add	a5,a5,16
    59b8:	00160713          	add	a4,a2,1
    59bc:	0186a023          	sw	s8,0(a3)
    59c0:	01e6a223          	sw	t5,4(a3)
    59c4:	06f12423          	sw	a5,104(sp)
    59c8:	06e12223          	sw	a4,100(sp)
    59cc:	fce2dae3          	bge	t0,a4,59a0 <_vfiprintf_r+0xb90>
    59d0:	1c078663          	beqz	a5,5b9c <_vfiprintf_r+0xd8c>
    59d4:	06010613          	add	a2,sp,96
    59d8:	00098593          	mv	a1,s3
    59dc:	00040513          	mv	a0,s0
    59e0:	af4ff0ef          	jal	4cd4 <__sprint_r.part.0>
    59e4:	8e051ee3          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    59e8:	06412603          	lw	a2,100(sp)
    59ec:	01000f13          	li	t5,16
    59f0:	ff0a8a93          	add	s5,s5,-16
    59f4:	06812783          	lw	a5,104(sp)
    59f8:	000a0693          	mv	a3,s4
    59fc:	00160513          	add	a0,a2,1
    5a00:	00700293          	li	t0,7
    5a04:	fb5f48e3          	blt	t5,s5,59b4 <_vfiprintf_r+0xba4>
    5a08:	01812e03          	lw	t3,24(sp)
    5a0c:	01c12803          	lw	a6,28(sp)
    5a10:	02012883          	lw	a7,32(sp)
    5a14:	02412703          	lw	a4,36(sp)
    5a18:	02812e83          	lw	t4,40(sp)
    5a1c:	000d8613          	mv	a2,s11
    5a20:	000c0f93          	mv	t6,s8
    5a24:	000a8d93          	mv	s11,s5
    5a28:	00068c13          	mv	s8,a3
    5a2c:	00060a93          	mv	s5,a2
    5a30:	01b787b3          	add	a5,a5,s11
    5a34:	01fc2023          	sw	t6,0(s8)
    5a38:	01bc2223          	sw	s11,4(s8)
    5a3c:	06f12423          	sw	a5,104(sp)
    5a40:	06a12223          	sw	a0,100(sp)
    5a44:	00700613          	li	a2,7
    5a48:	4ea65863          	bge	a2,a0,5f38 <_vfiprintf_r+0x1128>
    5a4c:	1a0786e3          	beqz	a5,63f8 <_vfiprintf_r+0x15e8>
    5a50:	06010613          	add	a2,sp,96
    5a54:	00098593          	mv	a1,s3
    5a58:	00040513          	mv	a0,s0
    5a5c:	03d12423          	sw	t4,40(sp)
    5a60:	02e12223          	sw	a4,36(sp)
    5a64:	03112023          	sw	a7,32(sp)
    5a68:	01012e23          	sw	a6,28(sp)
    5a6c:	01c12c23          	sw	t3,24(sp)
    5a70:	a64ff0ef          	jal	4cd4 <__sprint_r.part.0>
    5a74:	860516e3          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5a78:	02412703          	lw	a4,36(sp)
    5a7c:	06412603          	lw	a2,100(sp)
    5a80:	06812783          	lw	a5,104(sp)
    5a84:	41a70733          	sub	a4,a4,s10
    5a88:	02812e83          	lw	t4,40(sp)
    5a8c:	02012883          	lw	a7,32(sp)
    5a90:	01c12803          	lw	a6,28(sp)
    5a94:	01812e03          	lw	t3,24(sp)
    5a98:	000a0c13          	mv	s8,s4
    5a9c:	00160f13          	add	t5,a2,1
    5aa0:	e4e05a63          	blez	a4,50f4 <_vfiprintf_r+0x2e4>
    5aa4:	01000593          	li	a1,16
    5aa8:	0000af97          	auipc	t6,0xa
    5aac:	d00f8f93          	add	t6,t6,-768 # f7a8 <zeroes.0>
    5ab0:	0ae5da63          	bge	a1,a4,5b64 <_vfiprintf_r+0xd54>
    5ab4:	000c0593          	mv	a1,s8
    5ab8:	03512423          	sw	s5,40(sp)
    5abc:	01000d93          	li	s11,16
    5ac0:	00700293          	li	t0,7
    5ac4:	01c12c23          	sw	t3,24(sp)
    5ac8:	01012e23          	sw	a6,28(sp)
    5acc:	03112023          	sw	a7,32(sp)
    5ad0:	03d12223          	sw	t4,36(sp)
    5ad4:	00070a93          	mv	s5,a4
    5ad8:	000b0c13          	mv	s8,s6
    5adc:	0180006f          	j	5af4 <_vfiprintf_r+0xce4>
    5ae0:	00260f13          	add	t5,a2,2
    5ae4:	00858593          	add	a1,a1,8
    5ae8:	00068613          	mv	a2,a3
    5aec:	ff0a8a93          	add	s5,s5,-16
    5af0:	055dda63          	bge	s11,s5,5b44 <_vfiprintf_r+0xd34>
    5af4:	01078793          	add	a5,a5,16
    5af8:	00160693          	add	a3,a2,1
    5afc:	0165a023          	sw	s6,0(a1)
    5b00:	01b5a223          	sw	s11,4(a1)
    5b04:	06f12423          	sw	a5,104(sp)
    5b08:	06d12223          	sw	a3,100(sp)
    5b0c:	fcd2dae3          	bge	t0,a3,5ae0 <_vfiprintf_r+0xcd0>
    5b10:	06078e63          	beqz	a5,5b8c <_vfiprintf_r+0xd7c>
    5b14:	06010613          	add	a2,sp,96
    5b18:	00098593          	mv	a1,s3
    5b1c:	00040513          	mv	a0,s0
    5b20:	9b4ff0ef          	jal	4cd4 <__sprint_r.part.0>
    5b24:	fa051e63          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5b28:	06412603          	lw	a2,100(sp)
    5b2c:	ff0a8a93          	add	s5,s5,-16
    5b30:	06812783          	lw	a5,104(sp)
    5b34:	000a0593          	mv	a1,s4
    5b38:	00160f13          	add	t5,a2,1
    5b3c:	00700293          	li	t0,7
    5b40:	fb5dcae3          	blt	s11,s5,5af4 <_vfiprintf_r+0xce4>
    5b44:	000a8713          	mv	a4,s5
    5b48:	01812e03          	lw	t3,24(sp)
    5b4c:	01c12803          	lw	a6,28(sp)
    5b50:	02012883          	lw	a7,32(sp)
    5b54:	02412e83          	lw	t4,36(sp)
    5b58:	02812a83          	lw	s5,40(sp)
    5b5c:	000c0f93          	mv	t6,s8
    5b60:	00058c13          	mv	s8,a1
    5b64:	00e787b3          	add	a5,a5,a4
    5b68:	00ec2223          	sw	a4,4(s8)
    5b6c:	01fc2023          	sw	t6,0(s8)
    5b70:	06f12423          	sw	a5,104(sp)
    5b74:	07e12223          	sw	t5,100(sp)
    5b78:	00700713          	li	a4,7
    5b7c:	25e74863          	blt	a4,t5,5dcc <_vfiprintf_r+0xfbc>
    5b80:	008c0c13          	add	s8,s8,8
    5b84:	001f0f13          	add	t5,t5,1
    5b88:	d6cff06f          	j	50f4 <_vfiprintf_r+0x2e4>
    5b8c:	00100f13          	li	t5,1
    5b90:	00000613          	li	a2,0
    5b94:	000a0593          	mv	a1,s4
    5b98:	f55ff06f          	j	5aec <_vfiprintf_r+0xcdc>
    5b9c:	00100513          	li	a0,1
    5ba0:	00000613          	li	a2,0
    5ba4:	000a0693          	mv	a3,s4
    5ba8:	e05ff06f          	j	59ac <_vfiprintf_r+0xb9c>
    5bac:	06078263          	beqz	a5,5c10 <_vfiprintf_r+0xe00>
    5bb0:	06010613          	add	a2,sp,96
    5bb4:	00098593          	mv	a1,s3
    5bb8:	00040513          	mv	a0,s0
    5bbc:	03d12e23          	sw	t4,60(sp)
    5bc0:	02e12c23          	sw	a4,56(sp)
    5bc4:	03112423          	sw	a7,40(sp)
    5bc8:	03012223          	sw	a6,36(sp)
    5bcc:	02512023          	sw	t0,32(sp)
    5bd0:	01f12e23          	sw	t6,28(sp)
    5bd4:	01c12c23          	sw	t3,24(sp)
    5bd8:	8fcff0ef          	jal	4cd4 <__sprint_r.part.0>
    5bdc:	f0051263          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5be0:	06412603          	lw	a2,100(sp)
    5be4:	06812783          	lw	a5,104(sp)
    5be8:	03c12e83          	lw	t4,60(sp)
    5bec:	03812703          	lw	a4,56(sp)
    5bf0:	02812883          	lw	a7,40(sp)
    5bf4:	02412803          	lw	a6,36(sp)
    5bf8:	02012283          	lw	t0,32(sp)
    5bfc:	01c12f83          	lw	t6,28(sp)
    5c00:	01812e03          	lw	t3,24(sp)
    5c04:	000a0c13          	mv	s8,s4
    5c08:	00160f13          	add	t5,a2,1
    5c0c:	c58ff06f          	j	5064 <_vfiprintf_r+0x254>
    5c10:	380f8863          	beqz	t6,5fa0 <_vfiprintf_r+0x1190>
    5c14:	04410793          	add	a5,sp,68
    5c18:	06f12623          	sw	a5,108(sp)
    5c1c:	00200793          	li	a5,2
    5c20:	06f12823          	sw	a5,112(sp)
    5c24:	00100f13          	li	t5,1
    5c28:	000a0c13          	mv	s8,s4
    5c2c:	000f0613          	mv	a2,t5
    5c30:	008c0c13          	add	s8,s8,8
    5c34:	001f0f13          	add	t5,t5,1
    5c38:	cacff06f          	j	50e4 <_vfiprintf_r+0x2d4>
    5c3c:	00200693          	li	a3,2
    5c40:	00050e13          	mv	t3,a0
    5c44:	aa0684e3          	beqz	a3,56ec <_vfiprintf_r+0x8dc>
    5c48:	01412503          	lw	a0,20(sp)
    5c4c:	11010813          	add	a6,sp,272
    5c50:	00f7f693          	and	a3,a5,15
    5c54:	00d506b3          	add	a3,a0,a3
    5c58:	0006c603          	lbu	a2,0(a3)
    5c5c:	0047d793          	srl	a5,a5,0x4
    5c60:	01c59693          	sll	a3,a1,0x1c
    5c64:	00f6e7b3          	or	a5,a3,a5
    5c68:	0045d593          	srl	a1,a1,0x4
    5c6c:	fec80fa3          	sb	a2,-1(a6)
    5c70:	00b7e6b3          	or	a3,a5,a1
    5c74:	fff80813          	add	a6,a6,-1
    5c78:	fc069ce3          	bnez	a3,5c50 <_vfiprintf_r+0xe40>
    5c7c:	11010793          	add	a5,sp,272
    5c80:	41078d33          	sub	s10,a5,a6
    5c84:	00070e93          	mv	t4,a4
    5c88:	c9a754e3          	bge	a4,s10,5910 <_vfiprintf_r+0xb00>
    5c8c:	000d0e93          	mv	t4,s10
    5c90:	c81ff06f          	j	5910 <_vfiprintf_r+0xb00>
    5c94:	01000513          	li	a0,16
    5c98:	01b554e3          	bge	a0,s11,64a0 <_vfiprintf_r+0x1690>
    5c9c:	000a8693          	mv	a3,s5
    5ca0:	0000a317          	auipc	t1,0xa
    5ca4:	b1830313          	add	t1,t1,-1256 # f7b8 <blanks.1>
    5ca8:	02e12c23          	sw	a4,56(sp)
    5cac:	000d8a93          	mv	s5,s11
    5cb0:	000c0713          	mv	a4,s8
    5cb4:	01000f13          	li	t5,16
    5cb8:	00700393          	li	t2,7
    5cbc:	01c12c23          	sw	t3,24(sp)
    5cc0:	01f12e23          	sw	t6,28(sp)
    5cc4:	02512023          	sw	t0,32(sp)
    5cc8:	03012223          	sw	a6,36(sp)
    5ccc:	03112423          	sw	a7,40(sp)
    5cd0:	03d12e23          	sw	t4,60(sp)
    5cd4:	00030c13          	mv	s8,t1
    5cd8:	00068d93          	mv	s11,a3
    5cdc:	01c0006f          	j	5cf8 <_vfiprintf_r+0xee8>
    5ce0:	00260513          	add	a0,a2,2
    5ce4:	00870713          	add	a4,a4,8
    5ce8:	00058613          	mv	a2,a1
    5cec:	ff0a8a93          	add	s5,s5,-16
    5cf0:	055f5c63          	bge	t5,s5,5d48 <_vfiprintf_r+0xf38>
    5cf4:	00160593          	add	a1,a2,1
    5cf8:	01078793          	add	a5,a5,16
    5cfc:	01872023          	sw	s8,0(a4)
    5d00:	01e72223          	sw	t5,4(a4)
    5d04:	06f12423          	sw	a5,104(sp)
    5d08:	06b12223          	sw	a1,100(sp)
    5d0c:	fcb3dae3          	bge	t2,a1,5ce0 <_vfiprintf_r+0xed0>
    5d10:	08078a63          	beqz	a5,5da4 <_vfiprintf_r+0xf94>
    5d14:	06010613          	add	a2,sp,96
    5d18:	00098593          	mv	a1,s3
    5d1c:	00040513          	mv	a0,s0
    5d20:	fb5fe0ef          	jal	4cd4 <__sprint_r.part.0>
    5d24:	da051e63          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5d28:	06412603          	lw	a2,100(sp)
    5d2c:	01000f13          	li	t5,16
    5d30:	ff0a8a93          	add	s5,s5,-16
    5d34:	06812783          	lw	a5,104(sp)
    5d38:	000a0713          	mv	a4,s4
    5d3c:	00160513          	add	a0,a2,1
    5d40:	00700393          	li	t2,7
    5d44:	fb5f48e3          	blt	t5,s5,5cf4 <_vfiprintf_r+0xee4>
    5d48:	000c0313          	mv	t1,s8
    5d4c:	01812e03          	lw	t3,24(sp)
    5d50:	00070c13          	mv	s8,a4
    5d54:	01c12f83          	lw	t6,28(sp)
    5d58:	02012283          	lw	t0,32(sp)
    5d5c:	02412803          	lw	a6,36(sp)
    5d60:	02812883          	lw	a7,40(sp)
    5d64:	03c12e83          	lw	t4,60(sp)
    5d68:	03812703          	lw	a4,56(sp)
    5d6c:	000d8693          	mv	a3,s11
    5d70:	000a8d93          	mv	s11,s5
    5d74:	00068a93          	mv	s5,a3
    5d78:	01b787b3          	add	a5,a5,s11
    5d7c:	006c2023          	sw	t1,0(s8)
    5d80:	01bc2223          	sw	s11,4(s8)
    5d84:	06f12423          	sw	a5,104(sp)
    5d88:	06a12223          	sw	a0,100(sp)
    5d8c:	00700613          	li	a2,7
    5d90:	12a64063          	blt	a2,a0,5eb0 <_vfiprintf_r+0x10a0>
    5d94:	008c0c13          	add	s8,s8,8
    5d98:	00150f13          	add	t5,a0,1
    5d9c:	00050613          	mv	a2,a0
    5da0:	a8cff06f          	j	502c <_vfiprintf_r+0x21c>
    5da4:	00000613          	li	a2,0
    5da8:	00100513          	li	a0,1
    5dac:	000a0713          	mv	a4,s4
    5db0:	f3dff06f          	j	5cec <_vfiprintf_r+0xedc>
    5db4:	01d8d463          	bge	a7,t4,5dbc <_vfiprintf_r+0xfac>
    5db8:	000e8893          	mv	a7,t4
    5dbc:	00c12783          	lw	a5,12(sp)
    5dc0:	011787b3          	add	a5,a5,a7
    5dc4:	00f12623          	sw	a5,12(sp)
    5dc8:	ba8ff06f          	j	5170 <_vfiprintf_r+0x360>
    5dcc:	b4078ae3          	beqz	a5,5920 <_vfiprintf_r+0xb10>
    5dd0:	06010613          	add	a2,sp,96
    5dd4:	00098593          	mv	a1,s3
    5dd8:	00040513          	mv	a0,s0
    5ddc:	03d12223          	sw	t4,36(sp)
    5de0:	03112023          	sw	a7,32(sp)
    5de4:	01012e23          	sw	a6,28(sp)
    5de8:	01c12c23          	sw	t3,24(sp)
    5dec:	ee9fe0ef          	jal	4cd4 <__sprint_r.part.0>
    5df0:	ce051863          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5df4:	06412f03          	lw	t5,100(sp)
    5df8:	06812783          	lw	a5,104(sp)
    5dfc:	02412e83          	lw	t4,36(sp)
    5e00:	02012883          	lw	a7,32(sp)
    5e04:	01c12803          	lw	a6,28(sp)
    5e08:	01812e03          	lw	t3,24(sp)
    5e0c:	000a0c13          	mv	s8,s4
    5e10:	001f0f13          	add	t5,t5,1
    5e14:	ae0ff06f          	j	50f4 <_vfiprintf_r+0x2e4>
    5e18:	06012223          	sw	zero,100(sp)
    5e1c:	000a0c13          	mv	s8,s4
    5e20:	c84ff06f          	j	52a4 <_vfiprintf_r+0x494>
    5e24:	01067693          	and	a3,a2,16
    5e28:	000aa783          	lw	a5,0(s5)
    5e2c:	004a8a93          	add	s5,s5,4
    5e30:	12069c63          	bnez	a3,5f68 <_vfiprintf_r+0x1158>
    5e34:	04067693          	and	a3,a2,64
    5e38:	12068463          	beqz	a3,5f60 <_vfiprintf_r+0x1150>
    5e3c:	01079d93          	sll	s11,a5,0x10
    5e40:	010ddd93          	srl	s11,s11,0x10
    5e44:	00000d13          	li	s10,0
    5e48:	ff4ff06f          	j	563c <_vfiprintf_r+0x82c>
    5e4c:	0106f613          	and	a2,a3,16
    5e50:	000aa783          	lw	a5,0(s5)
    5e54:	004a8a93          	add	s5,s5,4
    5e58:	12061263          	bnez	a2,5f7c <_vfiprintf_r+0x116c>
    5e5c:	0406f613          	and	a2,a3,64
    5e60:	10060a63          	beqz	a2,5f74 <_vfiprintf_r+0x1164>
    5e64:	01079793          	sll	a5,a5,0x10
    5e68:	0107d793          	srl	a5,a5,0x10
    5e6c:	00000593          	li	a1,0
    5e70:	83dff06f          	j	56ac <_vfiprintf_r+0x89c>
    5e74:	010e7693          	and	a3,t3,16
    5e78:	000aa783          	lw	a5,0(s5)
    5e7c:	004a8a93          	add	s5,s5,4
    5e80:	0c069863          	bnez	a3,5f50 <_vfiprintf_r+0x1140>
    5e84:	040e7693          	and	a3,t3,64
    5e88:	0c068063          	beqz	a3,5f48 <_vfiprintf_r+0x1138>
    5e8c:	01079d93          	sll	s11,a5,0x10
    5e90:	410ddd93          	sra	s11,s11,0x10
    5e94:	41fddd13          	sra	s10,s11,0x1f
    5e98:	000d0693          	mv	a3,s10
    5e9c:	f24ff06f          	j	55c0 <_vfiprintf_r+0x7b0>
    5ea0:	00100f13          	li	t5,1
    5ea4:	00000613          	li	a2,0
    5ea8:	000a0c13          	mv	s8,s4
    5eac:	a38ff06f          	j	50e4 <_vfiprintf_r+0x2d4>
    5eb0:	1a078463          	beqz	a5,6058 <_vfiprintf_r+0x1248>
    5eb4:	06010613          	add	a2,sp,96
    5eb8:	00098593          	mv	a1,s3
    5ebc:	00040513          	mv	a0,s0
    5ec0:	03d12e23          	sw	t4,60(sp)
    5ec4:	02e12c23          	sw	a4,56(sp)
    5ec8:	03112423          	sw	a7,40(sp)
    5ecc:	03012223          	sw	a6,36(sp)
    5ed0:	02512023          	sw	t0,32(sp)
    5ed4:	01f12e23          	sw	t6,28(sp)
    5ed8:	01c12c23          	sw	t3,24(sp)
    5edc:	df9fe0ef          	jal	4cd4 <__sprint_r.part.0>
    5ee0:	c0051063          	bnez	a0,52e0 <_vfiprintf_r+0x4d0>
    5ee4:	06412603          	lw	a2,100(sp)
    5ee8:	06812783          	lw	a5,104(sp)
    5eec:	03c12e83          	lw	t4,60(sp)
    5ef0:	03812703          	lw	a4,56(sp)
    5ef4:	02812883          	lw	a7,40(sp)
    5ef8:	02412803          	lw	a6,36(sp)
    5efc:	02012283          	lw	t0,32(sp)
    5f00:	01c12f83          	lw	t6,28(sp)
    5f04:	01812e03          	lw	t3,24(sp)
    5f08:	000a0c13          	mv	s8,s4
    5f0c:	00160f13          	add	t5,a2,1
    5f10:	91cff06f          	j	502c <_vfiprintf_r+0x21c>
    5f14:	000d8e13          	mv	t3,s11
    5f18:	e88ff06f          	j	55a0 <_vfiprintf_r+0x790>
    5f1c:	00000e93          	li	t4,0
    5f20:	11010813          	add	a6,sp,272
    5f24:	9edff06f          	j	5910 <_vfiprintf_r+0xb00>
    5f28:	0589a503          	lw	a0,88(s3)
    5f2c:	8b4fb0ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    5f30:	00c99783          	lh	a5,12(s3)
    5f34:	f41fe06f          	j	4e74 <_vfiprintf_r+0x64>
    5f38:	008c0c13          	add	s8,s8,8
    5f3c:	00150f13          	add	t5,a0,1
    5f40:	00050613          	mv	a2,a0
    5f44:	9a8ff06f          	j	50ec <_vfiprintf_r+0x2dc>
    5f48:	200e7693          	and	a3,t3,512
    5f4c:	50069463          	bnez	a3,6454 <_vfiprintf_r+0x1644>
    5f50:	41f7dd13          	sra	s10,a5,0x1f
    5f54:	00078d93          	mv	s11,a5
    5f58:	000d0693          	mv	a3,s10
    5f5c:	e64ff06f          	j	55c0 <_vfiprintf_r+0x7b0>
    5f60:	20067693          	and	a3,a2,512
    5f64:	4c069663          	bnez	a3,6430 <_vfiprintf_r+0x1620>
    5f68:	00078d93          	mv	s11,a5
    5f6c:	00000d13          	li	s10,0
    5f70:	eccff06f          	j	563c <_vfiprintf_r+0x82c>
    5f74:	2006f613          	and	a2,a3,512
    5f78:	4c061863          	bnez	a2,6448 <_vfiprintf_r+0x1638>
    5f7c:	00000593          	li	a1,0
    5f80:	f2cff06f          	j	56ac <_vfiprintf_r+0x89c>
    5f84:	00c12683          	lw	a3,12(sp)
    5f88:	000aa783          	lw	a5,0(s5)
    5f8c:	004a8a93          	add	s5,s5,4
    5f90:	41f6d713          	sra	a4,a3,0x1f
    5f94:	00d7a023          	sw	a3,0(a5)
    5f98:	00e7a223          	sw	a4,4(a5)
    5f9c:	f8dfe06f          	j	4f28 <_vfiprintf_r+0x118>
    5fa0:	00000613          	li	a2,0
    5fa4:	00100f13          	li	t5,1
    5fa8:	000a0c13          	mv	s8,s4
    5fac:	938ff06f          	j	50e4 <_vfiprintf_r+0x2d4>
    5fb0:	000aa783          	lw	a5,0(s5)
    5fb4:	00100e93          	li	t4,1
    5fb8:	00100d13          	li	s10,1
    5fbc:	0af10623          	sb	a5,172(sp)
    5fc0:	0ac10593          	add	a1,sp,172
    5fc4:	db8ff06f          	j	557c <_vfiprintf_r+0x76c>
    5fc8:	000d0e93          	mv	t4,s10
    5fcc:	00050813          	mv	a6,a0
    5fd0:	941ff06f          	j	5910 <_vfiprintf_r+0xb00>
    5fd4:	fff00713          	li	a4,-1
    5fd8:	00058c93          	mv	s9,a1
    5fdc:	fb9fe06f          	j	4f94 <_vfiprintf_r+0x184>
    5fe0:	000d8613          	mv	a2,s11
    5fe4:	e3cff06f          	j	5620 <_vfiprintf_r+0x810>
    5fe8:	00009797          	auipc	a5,0x9
    5fec:	16078793          	add	a5,a5,352 # f148 <__fini_array_end+0x1bc>
    5ff0:	000d8e13          	mv	t3,s11
    5ff4:	00f12a23          	sw	a5,20(sp)
    5ff8:	020e7793          	and	a5,t3,32
    5ffc:	1c078c63          	beqz	a5,61d4 <_vfiprintf_r+0x13c4>
    6000:	007a8a93          	add	s5,s5,7
    6004:	ff8afa93          	and	s5,s5,-8
    6008:	000aa783          	lw	a5,0(s5)
    600c:	004aa583          	lw	a1,4(s5)
    6010:	008a8a93          	add	s5,s5,8
    6014:	001e7613          	and	a2,t3,1
    6018:	00060e63          	beqz	a2,6034 <_vfiprintf_r+0x1224>
    601c:	00b7e633          	or	a2,a5,a1
    6020:	00060a63          	beqz	a2,6034 <_vfiprintf_r+0x1224>
    6024:	03000613          	li	a2,48
    6028:	04c10223          	sb	a2,68(sp)
    602c:	04d102a3          	sb	a3,69(sp)
    6030:	002e6e13          	or	t3,t3,2
    6034:	bffe7e13          	and	t3,t3,-1025
    6038:	f3cff06f          	j	5774 <_vfiprintf_r+0x964>
    603c:	000d8693          	mv	a3,s11
    6040:	e50ff06f          	j	5690 <_vfiprintf_r+0x880>
    6044:	00009797          	auipc	a5,0x9
    6048:	0f078793          	add	a5,a5,240 # f134 <__fini_array_end+0x1a8>
    604c:	000d8e13          	mv	t3,s11
    6050:	00f12a23          	sw	a5,20(sp)
    6054:	fa5ff06f          	j	5ff8 <_vfiprintf_r+0x11e8>
    6058:	04314603          	lbu	a2,67(sp)
    605c:	3a060a63          	beqz	a2,6410 <_vfiprintf_r+0x1600>
    6060:	04310793          	add	a5,sp,67
    6064:	06f12623          	sw	a5,108(sp)
    6068:	00100793          	li	a5,1
    606c:	06f12823          	sw	a5,112(sp)
    6070:	00100f13          	li	t5,1
    6074:	000a0c13          	mv	s8,s4
    6078:	fe1fe06f          	j	5058 <_vfiprintf_r+0x248>
    607c:	00800613          	li	a2,8
    6080:	00000593          	li	a1,0
    6084:	05810513          	add	a0,sp,88
    6088:	02e12023          	sw	a4,32(sp)
    608c:	01112e23          	sw	a7,28(sp)
    6090:	01c12c23          	sw	t3,24(sp)
    6094:	05012623          	sw	a6,76(sp)
    6098:	01012823          	sw	a6,16(sp)
    609c:	f4dfa0ef          	jal	fe8 <memset>
    60a0:	02012703          	lw	a4,32(sp)
    60a4:	01012803          	lw	a6,16(sp)
    60a8:	01812e03          	lw	t3,24(sp)
    60ac:	01c12883          	lw	a7,28(sp)
    60b0:	2a074463          	bltz	a4,6358 <_vfiprintf_r+0x1548>
    60b4:	00000d93          	li	s11,0
    60b8:	00000d13          	li	s10,0
    60bc:	01812823          	sw	s8,16(sp)
    60c0:	01012e23          	sw	a6,28(sp)
    60c4:	000d8c13          	mv	s8,s11
    60c8:	03112023          	sw	a7,32(sp)
    60cc:	000c8d93          	mv	s11,s9
    60d0:	000a8c93          	mv	s9,s5
    60d4:	000d0a93          	mv	s5,s10
    60d8:	00098d13          	mv	s10,s3
    60dc:	00070993          	mv	s3,a4
    60e0:	0300006f          	j	6110 <_vfiprintf_r+0x1300>
    60e4:	05810693          	add	a3,sp,88
    60e8:	0ac10593          	add	a1,sp,172
    60ec:	00040513          	mv	a0,s0
    60f0:	2f5040ef          	jal	abe4 <_wcrtomb_r>
    60f4:	fff00793          	li	a5,-1
    60f8:	48f50063          	beq	a0,a5,6578 <_vfiprintf_r+0x1768>
    60fc:	00aa87b3          	add	a5,s5,a0
    6100:	02f9c063          	blt	s3,a5,6120 <_vfiprintf_r+0x1310>
    6104:	004c0c13          	add	s8,s8,4
    6108:	45378463          	beq	a5,s3,6550 <_vfiprintf_r+0x1740>
    610c:	00078a93          	mv	s5,a5
    6110:	04c12783          	lw	a5,76(sp)
    6114:	018787b3          	add	a5,a5,s8
    6118:	0007a603          	lw	a2,0(a5)
    611c:	fc0614e3          	bnez	a2,60e4 <_vfiprintf_r+0x12d4>
    6120:	01012c03          	lw	s8,16(sp)
    6124:	01812e03          	lw	t3,24(sp)
    6128:	01c12803          	lw	a6,28(sp)
    612c:	02012883          	lw	a7,32(sp)
    6130:	000d0993          	mv	s3,s10
    6134:	000a8d13          	mv	s10,s5
    6138:	000c8a93          	mv	s5,s9
    613c:	000d8c93          	mv	s9,s11
    6140:	280d0e63          	beqz	s10,63dc <_vfiprintf_r+0x15cc>
    6144:	06300793          	li	a5,99
    6148:	33a7d463          	bge	a5,s10,6470 <_vfiprintf_r+0x1660>
    614c:	001d0593          	add	a1,s10,1
    6150:	00040513          	mv	a0,s0
    6154:	01112c23          	sw	a7,24(sp)
    6158:	01c12823          	sw	t3,16(sp)
    615c:	de8fb0ef          	jal	1744 <_malloc_r>
    6160:	01012e03          	lw	t3,16(sp)
    6164:	01812883          	lw	a7,24(sp)
    6168:	00050813          	mv	a6,a0
    616c:	42050063          	beqz	a0,658c <_vfiprintf_r+0x177c>
    6170:	00a12823          	sw	a0,16(sp)
    6174:	00800613          	li	a2,8
    6178:	00000593          	li	a1,0
    617c:	05810513          	add	a0,sp,88
    6180:	03112023          	sw	a7,32(sp)
    6184:	01c12e23          	sw	t3,28(sp)
    6188:	01012c23          	sw	a6,24(sp)
    618c:	e5dfa0ef          	jal	fe8 <memset>
    6190:	01812803          	lw	a6,24(sp)
    6194:	05810713          	add	a4,sp,88
    6198:	000d0693          	mv	a3,s10
    619c:	00080593          	mv	a1,a6
    61a0:	04c10613          	add	a2,sp,76
    61a4:	00040513          	mv	a0,s0
    61a8:	2c9040ef          	jal	ac70 <_wcsrtombs_r>
    61ac:	01812803          	lw	a6,24(sp)
    61b0:	01c12e03          	lw	t3,28(sp)
    61b4:	02012883          	lw	a7,32(sp)
    61b8:	40ad1063          	bne	s10,a0,65b8 <_vfiprintf_r+0x17a8>
    61bc:	fffd4e93          	not	t4,s10
    61c0:	01a807b3          	add	a5,a6,s10
    61c4:	41fede93          	sra	t4,t4,0x1f
    61c8:	00078023          	sb	zero,0(a5)
    61cc:	01dd7eb3          	and	t4,s10,t4
    61d0:	2140006f          	j	63e4 <_vfiprintf_r+0x15d4>
    61d4:	010e7613          	and	a2,t3,16
    61d8:	000aa783          	lw	a5,0(s5)
    61dc:	004a8a93          	add	s5,s5,4
    61e0:	02061263          	bnez	a2,6204 <_vfiprintf_r+0x13f4>
    61e4:	040e7613          	and	a2,t3,64
    61e8:	00060a63          	beqz	a2,61fc <_vfiprintf_r+0x13ec>
    61ec:	01079793          	sll	a5,a5,0x10
    61f0:	0107d793          	srl	a5,a5,0x10
    61f4:	00000593          	li	a1,0
    61f8:	e1dff06f          	j	6014 <_vfiprintf_r+0x1204>
    61fc:	200e7613          	and	a2,t3,512
    6200:	22061e63          	bnez	a2,643c <_vfiprintf_r+0x162c>
    6204:	00000593          	li	a1,0
    6208:	e0dff06f          	j	6014 <_vfiprintf_r+0x1204>
    620c:	400e7793          	and	a5,t3,1024
    6210:	00000693          	li	a3,0
    6214:	11010e93          	add	t4,sp,272
    6218:	01812823          	sw	s8,16(sp)
    621c:	02812223          	sw	s0,36(sp)
    6220:	03912c23          	sw	s9,56(sp)
    6224:	03512e23          	sw	s5,60(sp)
    6228:	02c12c83          	lw	s9,44(sp)
    622c:	01c12c23          	sw	t3,24(sp)
    6230:	01112e23          	sw	a7,28(sp)
    6234:	02e12023          	sw	a4,32(sp)
    6238:	00078c13          	mv	s8,a5
    623c:	00068413          	mv	s0,a3
    6240:	03312423          	sw	s3,40(sp)
    6244:	000e8a93          	mv	s5,t4
    6248:	0280006f          	j	6270 <_vfiprintf_r+0x1460>
    624c:	00a00613          	li	a2,10
    6250:	00000693          	li	a3,0
    6254:	000d8513          	mv	a0,s11
    6258:	000d0593          	mv	a1,s10
    625c:	364050ef          	jal	b5c0 <__udivdi3>
    6260:	220d0a63          	beqz	s10,6494 <_vfiprintf_r+0x1684>
    6264:	00050d93          	mv	s11,a0
    6268:	00058d13          	mv	s10,a1
    626c:	00098a93          	mv	s5,s3
    6270:	00a00613          	li	a2,10
    6274:	00000693          	li	a3,0
    6278:	000d8513          	mv	a0,s11
    627c:	000d0593          	mv	a1,s10
    6280:	1ed050ef          	jal	bc6c <__umoddi3>
    6284:	03050513          	add	a0,a0,48
    6288:	feaa8fa3          	sb	a0,-1(s5)
    628c:	fffa8993          	add	s3,s5,-1
    6290:	00140413          	add	s0,s0,1
    6294:	fa0c0ce3          	beqz	s8,624c <_vfiprintf_r+0x143c>
    6298:	000cc783          	lbu	a5,0(s9)
    629c:	fa8798e3          	bne	a5,s0,624c <_vfiprintf_r+0x143c>
    62a0:	0ff00793          	li	a5,255
    62a4:	faf404e3          	beq	s0,a5,624c <_vfiprintf_r+0x143c>
    62a8:	0e0d1a63          	bnez	s10,639c <_vfiprintf_r+0x158c>
    62ac:	00900793          	li	a5,9
    62b0:	0fb7e663          	bltu	a5,s11,639c <_vfiprintf_r+0x158c>
    62b4:	00098813          	mv	a6,s3
    62b8:	03912623          	sw	s9,44(sp)
    62bc:	01012c03          	lw	s8,16(sp)
    62c0:	01812e03          	lw	t3,24(sp)
    62c4:	01c12883          	lw	a7,28(sp)
    62c8:	02012703          	lw	a4,32(sp)
    62cc:	02412403          	lw	s0,36(sp)
    62d0:	02812983          	lw	s3,40(sp)
    62d4:	03812c83          	lw	s9,56(sp)
    62d8:	03c12a83          	lw	s5,60(sp)
    62dc:	9a1ff06f          	j	5c7c <_vfiprintf_r+0xe6c>
    62e0:	00068e13          	mv	t3,a3
    62e4:	00000693          	li	a3,0
    62e8:	c0068263          	beqz	a3,56ec <_vfiprintf_r+0x8dc>
    62ec:	95dff06f          	j	5c48 <_vfiprintf_r+0xe38>
    62f0:	00040513          	mv	a0,s0
    62f4:	115000ef          	jal	6c08 <__sinit>
    62f8:	b61fe06f          	j	4e58 <_vfiprintf_r+0x48>
    62fc:	001cc683          	lbu	a3,1(s9)
    6300:	200ded93          	or	s11,s11,512
    6304:	001c8c93          	add	s9,s9,1
    6308:	c89fe06f          	j	4f90 <_vfiprintf_r+0x180>
    630c:	001cc683          	lbu	a3,1(s9)
    6310:	020ded93          	or	s11,s11,32
    6314:	001c8c93          	add	s9,s9,1
    6318:	c79fe06f          	j	4f90 <_vfiprintf_r+0x180>
    631c:	000aa783          	lw	a5,0(s5)
    6320:	00c12703          	lw	a4,12(sp)
    6324:	004a8a93          	add	s5,s5,4
    6328:	00e7a023          	sw	a4,0(a5)
    632c:	bfdfe06f          	j	4f28 <_vfiprintf_r+0x118>
    6330:	00600793          	li	a5,6
    6334:	00070d13          	mv	s10,a4
    6338:	0ce7e863          	bltu	a5,a4,6408 <_vfiprintf_r+0x15f8>
    633c:	000d0e93          	mv	t4,s10
    6340:	00009817          	auipc	a6,0x9
    6344:	e1c80813          	add	a6,a6,-484 # f15c <__fini_array_end+0x1d0>
    6348:	cb9fe06f          	j	5000 <_vfiprintf_r+0x1f0>
    634c:	00000793          	li	a5,0
    6350:	00000593          	li	a1,0
    6354:	8f5ff06f          	j	5c48 <_vfiprintf_r+0xe38>
    6358:	05810713          	add	a4,sp,88
    635c:	00000693          	li	a3,0
    6360:	04c10613          	add	a2,sp,76
    6364:	00000593          	li	a1,0
    6368:	00040513          	mv	a0,s0
    636c:	01112e23          	sw	a7,28(sp)
    6370:	01012c23          	sw	a6,24(sp)
    6374:	01c12823          	sw	t3,16(sp)
    6378:	0f9040ef          	jal	ac70 <_wcsrtombs_r>
    637c:	fff00793          	li	a5,-1
    6380:	01012e03          	lw	t3,16(sp)
    6384:	01812803          	lw	a6,24(sp)
    6388:	01c12883          	lw	a7,28(sp)
    638c:	00050d13          	mv	s10,a0
    6390:	1ef50e63          	beq	a0,a5,658c <_vfiprintf_r+0x177c>
    6394:	05012623          	sw	a6,76(sp)
    6398:	da9ff06f          	j	6140 <_vfiprintf_r+0x1330>
    639c:	03012783          	lw	a5,48(sp)
    63a0:	03412583          	lw	a1,52(sp)
    63a4:	00000413          	li	s0,0
    63a8:	40f989b3          	sub	s3,s3,a5
    63ac:	00078613          	mv	a2,a5
    63b0:	00098513          	mv	a0,s3
    63b4:	6c8010ef          	jal	7a7c <strncpy>
    63b8:	001cc783          	lbu	a5,1(s9)
    63bc:	00a00613          	li	a2,10
    63c0:	00000693          	li	a3,0
    63c4:	00f037b3          	snez	a5,a5
    63c8:	000d8513          	mv	a0,s11
    63cc:	000d0593          	mv	a1,s10
    63d0:	00fc8cb3          	add	s9,s9,a5
    63d4:	1ec050ef          	jal	b5c0 <__udivdi3>
    63d8:	e8dff06f          	j	6264 <_vfiprintf_r+0x1454>
    63dc:	00000e93          	li	t4,0
    63e0:	00012823          	sw	zero,16(sp)
    63e4:	04314783          	lbu	a5,67(sp)
    63e8:	00000713          	li	a4,0
    63ec:	00000f93          	li	t6,0
    63f0:	a0079063          	bnez	a5,55f0 <_vfiprintf_r+0x7e0>
    63f4:	c19fe06f          	j	500c <_vfiprintf_r+0x1fc>
    63f8:	00100f13          	li	t5,1
    63fc:	00000613          	li	a2,0
    6400:	000a0c13          	mv	s8,s4
    6404:	ce9fe06f          	j	50ec <_vfiprintf_r+0x2dc>
    6408:	00600d13          	li	s10,6
    640c:	f31ff06f          	j	633c <_vfiprintf_r+0x152c>
    6410:	00100f13          	li	t5,1
    6414:	000a0c13          	mv	s8,s4
    6418:	c4dfe06f          	j	5064 <_vfiprintf_r+0x254>
    641c:	000aa783          	lw	a5,0(s5)
    6420:	00c12703          	lw	a4,12(sp)
    6424:	004a8a93          	add	s5,s5,4
    6428:	00e79023          	sh	a4,0(a5)
    642c:	afdfe06f          	j	4f28 <_vfiprintf_r+0x118>
    6430:	0ff7fd93          	zext.b	s11,a5
    6434:	00000d13          	li	s10,0
    6438:	a04ff06f          	j	563c <_vfiprintf_r+0x82c>
    643c:	0ff7f793          	zext.b	a5,a5
    6440:	00000593          	li	a1,0
    6444:	bd1ff06f          	j	6014 <_vfiprintf_r+0x1204>
    6448:	0ff7f793          	zext.b	a5,a5
    644c:	00000593          	li	a1,0
    6450:	a5cff06f          	j	56ac <_vfiprintf_r+0x89c>
    6454:	01879d93          	sll	s11,a5,0x18
    6458:	418ddd93          	sra	s11,s11,0x18
    645c:	41fddd13          	sra	s10,s11,0x1f
    6460:	000d0693          	mv	a3,s10
    6464:	95cff06f          	j	55c0 <_vfiprintf_r+0x7b0>
    6468:	03000793          	li	a5,48
    646c:	c8cff06f          	j	58f8 <_vfiprintf_r+0xae8>
    6470:	00012823          	sw	zero,16(sp)
    6474:	0ac10813          	add	a6,sp,172
    6478:	cfdff06f          	j	6174 <_vfiprintf_r+0x1364>
    647c:	0589a503          	lw	a0,88(s3)
    6480:	b65fa0ef          	jal	fe4 <__retarget_lock_release_recursive>
    6484:	d51fe06f          	j	51d4 <_vfiprintf_r+0x3c4>
    6488:	00070e93          	mv	t4,a4
    648c:	00070d13          	mv	s10,a4
    6490:	f55ff06f          	j	63e4 <_vfiprintf_r+0x15d4>
    6494:	00900793          	li	a5,9
    6498:	ddb7e6e3          	bltu	a5,s11,6264 <_vfiprintf_r+0x1454>
    649c:	e19ff06f          	j	62b4 <_vfiprintf_r+0x14a4>
    64a0:	00058513          	mv	a0,a1
    64a4:	00009317          	auipc	t1,0x9
    64a8:	31430313          	add	t1,t1,788 # f7b8 <blanks.1>
    64ac:	8cdff06f          	j	5d78 <_vfiprintf_r+0xf68>
    64b0:	00080513          	mv	a0,a6
    64b4:	03112023          	sw	a7,32(sp)
    64b8:	01012c23          	sw	a6,24(sp)
    64bc:	01b12e23          	sw	s11,28(sp)
    64c0:	da9fa0ef          	jal	1268 <strlen>
    64c4:	fff54e93          	not	t4,a0
    64c8:	41fede93          	sra	t4,t4,0x1f
    64cc:	01812803          	lw	a6,24(sp)
    64d0:	01c12e03          	lw	t3,28(sp)
    64d4:	02012883          	lw	a7,32(sp)
    64d8:	00050d13          	mv	s10,a0
    64dc:	01d57eb3          	and	t4,a0,t4
    64e0:	00012823          	sw	zero,16(sp)
    64e4:	f01ff06f          	j	63e4 <_vfiprintf_r+0x15d4>
    64e8:	06010613          	add	a2,sp,96
    64ec:	00098593          	mv	a1,s3
    64f0:	00040513          	mv	a0,s0
    64f4:	fe0fe0ef          	jal	4cd4 <__sprint_r.part.0>
    64f8:	00051463          	bnez	a0,6500 <_vfiprintf_r+0x16f0>
    64fc:	dc5fe06f          	j	52c0 <_vfiprintf_r+0x4b0>
    6500:	df5fe06f          	j	52f4 <_vfiprintf_r+0x4e4>
    6504:	00168613          	add	a2,a3,1
    6508:	00009317          	auipc	t1,0x9
    650c:	2b030313          	add	t1,t1,688 # f7b8 <blanks.1>
    6510:	f19fe06f          	j	5428 <_vfiprintf_r+0x618>
    6514:	000f0513          	mv	a0,t5
    6518:	00009f97          	auipc	t6,0x9
    651c:	290f8f93          	add	t6,t6,656 # f7a8 <zeroes.0>
    6520:	d10ff06f          	j	5a30 <_vfiprintf_r+0xc20>
    6524:	0649a783          	lw	a5,100(s3)
    6528:	0017f793          	and	a5,a5,1
    652c:	00079c63          	bnez	a5,6544 <_vfiprintf_r+0x1734>
    6530:	00c9d783          	lhu	a5,12(s3)
    6534:	2007f793          	and	a5,a5,512
    6538:	00079663          	bnez	a5,6544 <_vfiprintf_r+0x1734>
    653c:	0589a503          	lw	a0,88(s3)
    6540:	aa5fa0ef          	jal	fe4 <__retarget_lock_release_recursive>
    6544:	fff00793          	li	a5,-1
    6548:	00f12623          	sw	a5,12(sp)
    654c:	de5fe06f          	j	5330 <_vfiprintf_r+0x520>
    6550:	00098713          	mv	a4,s3
    6554:	000c8a93          	mv	s5,s9
    6558:	000d0993          	mv	s3,s10
    655c:	01012c03          	lw	s8,16(sp)
    6560:	01812e03          	lw	t3,24(sp)
    6564:	01c12803          	lw	a6,28(sp)
    6568:	02012883          	lw	a7,32(sp)
    656c:	000d8c93          	mv	s9,s11
    6570:	00070d13          	mv	s10,a4
    6574:	bcdff06f          	j	6140 <_vfiprintf_r+0x1330>
    6578:	00cd1783          	lh	a5,12(s10)
    657c:	000d0993          	mv	s3,s10
    6580:	0407e793          	or	a5,a5,64
    6584:	00fd1623          	sh	a5,12(s10)
    6588:	d71fe06f          	j	52f8 <_vfiprintf_r+0x4e8>
    658c:	00c99783          	lh	a5,12(s3)
    6590:	0407e793          	or	a5,a5,64
    6594:	00f99623          	sh	a5,12(s3)
    6598:	d61fe06f          	j	52f8 <_vfiprintf_r+0x4e8>
    659c:	000aa703          	lw	a4,0(s5)
    65a0:	004a8a93          	add	s5,s5,4
    65a4:	00075463          	bgez	a4,65ac <_vfiprintf_r+0x179c>
    65a8:	fff00713          	li	a4,-1
    65ac:	001cc683          	lbu	a3,1(s9)
    65b0:	00058c93          	mv	s9,a1
    65b4:	9ddfe06f          	j	4f90 <_vfiprintf_r+0x180>
    65b8:	00c9d783          	lhu	a5,12(s3)
    65bc:	0407e793          	or	a5,a5,64
    65c0:	00f99623          	sh	a5,12(s3)
    65c4:	d1dfe06f          	j	52e0 <_vfiprintf_r+0x4d0>

000065c8 <__sbprintf>:
    65c8:	b7010113          	add	sp,sp,-1168
    65cc:	00c59783          	lh	a5,12(a1)
    65d0:	00e5d703          	lhu	a4,14(a1)
    65d4:	48812423          	sw	s0,1160(sp)
    65d8:	00058413          	mv	s0,a1
    65dc:	000105b7          	lui	a1,0x10
    65e0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x5f5>
    65e4:	06442303          	lw	t1,100(s0)
    65e8:	01c42883          	lw	a7,28(s0)
    65ec:	02442803          	lw	a6,36(s0)
    65f0:	01071713          	sll	a4,a4,0x10
    65f4:	00b7f7b3          	and	a5,a5,a1
    65f8:	00e7e7b3          	or	a5,a5,a4
    65fc:	40000593          	li	a1,1024
    6600:	49212023          	sw	s2,1152(sp)
    6604:	00f12a23          	sw	a5,20(sp)
    6608:	00050913          	mv	s2,a0
    660c:	07010793          	add	a5,sp,112
    6610:	06010513          	add	a0,sp,96
    6614:	48112623          	sw	ra,1164(sp)
    6618:	48912223          	sw	s1,1156(sp)
    661c:	47312e23          	sw	s3,1148(sp)
    6620:	00060493          	mv	s1,a2
    6624:	00068993          	mv	s3,a3
    6628:	06612623          	sw	t1,108(sp)
    662c:	03112223          	sw	a7,36(sp)
    6630:	03012623          	sw	a6,44(sp)
    6634:	00f12423          	sw	a5,8(sp)
    6638:	00f12c23          	sw	a5,24(sp)
    663c:	00b12823          	sw	a1,16(sp)
    6640:	00b12e23          	sw	a1,28(sp)
    6644:	02012023          	sw	zero,32(sp)
    6648:	991fa0ef          	jal	fd8 <__retarget_lock_init_recursive>
    664c:	00048613          	mv	a2,s1
    6650:	00098693          	mv	a3,s3
    6654:	00810593          	add	a1,sp,8
    6658:	00090513          	mv	a0,s2
    665c:	fb4fe0ef          	jal	4e10 <_vfiprintf_r>
    6660:	00050493          	mv	s1,a0
    6664:	04055263          	bgez	a0,66a8 <__sbprintf+0xe0>
    6668:	01415783          	lhu	a5,20(sp)
    666c:	0407f793          	and	a5,a5,64
    6670:	00078863          	beqz	a5,6680 <__sbprintf+0xb8>
    6674:	00c45783          	lhu	a5,12(s0)
    6678:	0407e793          	or	a5,a5,64
    667c:	00f41623          	sh	a5,12(s0)
    6680:	06012503          	lw	a0,96(sp)
    6684:	959fa0ef          	jal	fdc <__retarget_lock_close_recursive>
    6688:	48c12083          	lw	ra,1164(sp)
    668c:	48812403          	lw	s0,1160(sp)
    6690:	48012903          	lw	s2,1152(sp)
    6694:	47c12983          	lw	s3,1148(sp)
    6698:	00048513          	mv	a0,s1
    669c:	48412483          	lw	s1,1156(sp)
    66a0:	49010113          	add	sp,sp,1168
    66a4:	00008067          	ret
    66a8:	00810593          	add	a1,sp,8
    66ac:	00090513          	mv	a0,s2
    66b0:	25c000ef          	jal	690c <_fflush_r>
    66b4:	fa050ae3          	beqz	a0,6668 <__sbprintf+0xa0>
    66b8:	fff00493          	li	s1,-1
    66bc:	fadff06f          	j	6668 <__sbprintf+0xa0>

000066c0 <__sflush_r>:
    66c0:	00c59703          	lh	a4,12(a1)
    66c4:	fe010113          	add	sp,sp,-32
    66c8:	00812c23          	sw	s0,24(sp)
    66cc:	01312623          	sw	s3,12(sp)
    66d0:	00112e23          	sw	ra,28(sp)
    66d4:	00877793          	and	a5,a4,8
    66d8:	00058413          	mv	s0,a1
    66dc:	00050993          	mv	s3,a0
    66e0:	12079063          	bnez	a5,6800 <__sflush_r+0x140>
    66e4:	000017b7          	lui	a5,0x1
    66e8:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    66ec:	0045a683          	lw	a3,4(a1)
    66f0:	00f767b3          	or	a5,a4,a5
    66f4:	00f59623          	sh	a5,12(a1)
    66f8:	18d05263          	blez	a3,687c <__sflush_r+0x1bc>
    66fc:	02842803          	lw	a6,40(s0)
    6700:	0e080463          	beqz	a6,67e8 <__sflush_r+0x128>
    6704:	00912a23          	sw	s1,20(sp)
    6708:	01371693          	sll	a3,a4,0x13
    670c:	0009a483          	lw	s1,0(s3)
    6710:	0009a023          	sw	zero,0(s3)
    6714:	01c42583          	lw	a1,28(s0)
    6718:	1606ce63          	bltz	a3,6894 <__sflush_r+0x1d4>
    671c:	00000613          	li	a2,0
    6720:	00100693          	li	a3,1
    6724:	00098513          	mv	a0,s3
    6728:	000800e7          	jalr	a6
    672c:	fff00793          	li	a5,-1
    6730:	00050613          	mv	a2,a0
    6734:	1af50463          	beq	a0,a5,68dc <__sflush_r+0x21c>
    6738:	00c41783          	lh	a5,12(s0)
    673c:	02842803          	lw	a6,40(s0)
    6740:	01c42583          	lw	a1,28(s0)
    6744:	0047f793          	and	a5,a5,4
    6748:	00078e63          	beqz	a5,6764 <__sflush_r+0xa4>
    674c:	00442703          	lw	a4,4(s0)
    6750:	03042783          	lw	a5,48(s0)
    6754:	40e60633          	sub	a2,a2,a4
    6758:	00078663          	beqz	a5,6764 <__sflush_r+0xa4>
    675c:	03c42783          	lw	a5,60(s0)
    6760:	40f60633          	sub	a2,a2,a5
    6764:	00000693          	li	a3,0
    6768:	00098513          	mv	a0,s3
    676c:	000800e7          	jalr	a6
    6770:	fff00793          	li	a5,-1
    6774:	12f51463          	bne	a0,a5,689c <__sflush_r+0x1dc>
    6778:	0009a683          	lw	a3,0(s3)
    677c:	01d00793          	li	a5,29
    6780:	00c41703          	lh	a4,12(s0)
    6784:	16d7ea63          	bltu	a5,a3,68f8 <__sflush_r+0x238>
    6788:	204007b7          	lui	a5,0x20400
    678c:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6790:	00d7d7b3          	srl	a5,a5,a3
    6794:	0017f793          	and	a5,a5,1
    6798:	16078063          	beqz	a5,68f8 <__sflush_r+0x238>
    679c:	01042603          	lw	a2,16(s0)
    67a0:	fffff7b7          	lui	a5,0xfffff
    67a4:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    67a8:	00f777b3          	and	a5,a4,a5
    67ac:	00f41623          	sh	a5,12(s0)
    67b0:	00042223          	sw	zero,4(s0)
    67b4:	00c42023          	sw	a2,0(s0)
    67b8:	01371793          	sll	a5,a4,0x13
    67bc:	0007d463          	bgez	a5,67c4 <__sflush_r+0x104>
    67c0:	10068263          	beqz	a3,68c4 <__sflush_r+0x204>
    67c4:	03042583          	lw	a1,48(s0)
    67c8:	0099a023          	sw	s1,0(s3)
    67cc:	10058463          	beqz	a1,68d4 <__sflush_r+0x214>
    67d0:	04040793          	add	a5,s0,64
    67d4:	00f58663          	beq	a1,a5,67e0 <__sflush_r+0x120>
    67d8:	00098513          	mv	a0,s3
    67dc:	c5dfa0ef          	jal	1438 <_free_r>
    67e0:	01412483          	lw	s1,20(sp)
    67e4:	02042823          	sw	zero,48(s0)
    67e8:	00000513          	li	a0,0
    67ec:	01c12083          	lw	ra,28(sp)
    67f0:	01812403          	lw	s0,24(sp)
    67f4:	00c12983          	lw	s3,12(sp)
    67f8:	02010113          	add	sp,sp,32
    67fc:	00008067          	ret
    6800:	01212823          	sw	s2,16(sp)
    6804:	0105a903          	lw	s2,16(a1)
    6808:	08090263          	beqz	s2,688c <__sflush_r+0x1cc>
    680c:	00912a23          	sw	s1,20(sp)
    6810:	0005a483          	lw	s1,0(a1)
    6814:	00377713          	and	a4,a4,3
    6818:	0125a023          	sw	s2,0(a1)
    681c:	412484b3          	sub	s1,s1,s2
    6820:	00000793          	li	a5,0
    6824:	00071463          	bnez	a4,682c <__sflush_r+0x16c>
    6828:	0145a783          	lw	a5,20(a1)
    682c:	00f42423          	sw	a5,8(s0)
    6830:	00904863          	bgtz	s1,6840 <__sflush_r+0x180>
    6834:	0540006f          	j	6888 <__sflush_r+0x1c8>
    6838:	00a90933          	add	s2,s2,a0
    683c:	04905663          	blez	s1,6888 <__sflush_r+0x1c8>
    6840:	02442783          	lw	a5,36(s0)
    6844:	01c42583          	lw	a1,28(s0)
    6848:	00048693          	mv	a3,s1
    684c:	00090613          	mv	a2,s2
    6850:	00098513          	mv	a0,s3
    6854:	000780e7          	jalr	a5
    6858:	40a484b3          	sub	s1,s1,a0
    685c:	fca04ee3          	bgtz	a0,6838 <__sflush_r+0x178>
    6860:	00c41703          	lh	a4,12(s0)
    6864:	01012903          	lw	s2,16(sp)
    6868:	04076713          	or	a4,a4,64
    686c:	01412483          	lw	s1,20(sp)
    6870:	00e41623          	sh	a4,12(s0)
    6874:	fff00513          	li	a0,-1
    6878:	f75ff06f          	j	67ec <__sflush_r+0x12c>
    687c:	03c5a683          	lw	a3,60(a1)
    6880:	e6d04ee3          	bgtz	a3,66fc <__sflush_r+0x3c>
    6884:	f65ff06f          	j	67e8 <__sflush_r+0x128>
    6888:	01412483          	lw	s1,20(sp)
    688c:	01012903          	lw	s2,16(sp)
    6890:	f59ff06f          	j	67e8 <__sflush_r+0x128>
    6894:	05042603          	lw	a2,80(s0)
    6898:	eadff06f          	j	6744 <__sflush_r+0x84>
    689c:	00c41703          	lh	a4,12(s0)
    68a0:	01042683          	lw	a3,16(s0)
    68a4:	fffff7b7          	lui	a5,0xfffff
    68a8:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    68ac:	00f777b3          	and	a5,a4,a5
    68b0:	00f41623          	sh	a5,12(s0)
    68b4:	00042223          	sw	zero,4(s0)
    68b8:	00d42023          	sw	a3,0(s0)
    68bc:	01371793          	sll	a5,a4,0x13
    68c0:	f007d2e3          	bgez	a5,67c4 <__sflush_r+0x104>
    68c4:	03042583          	lw	a1,48(s0)
    68c8:	04a42823          	sw	a0,80(s0)
    68cc:	0099a023          	sw	s1,0(s3)
    68d0:	f00590e3          	bnez	a1,67d0 <__sflush_r+0x110>
    68d4:	01412483          	lw	s1,20(sp)
    68d8:	f11ff06f          	j	67e8 <__sflush_r+0x128>
    68dc:	0009a783          	lw	a5,0(s3)
    68e0:	e4078ce3          	beqz	a5,6738 <__sflush_r+0x78>
    68e4:	01d00713          	li	a4,29
    68e8:	00e78c63          	beq	a5,a4,6900 <__sflush_r+0x240>
    68ec:	01600713          	li	a4,22
    68f0:	00e78863          	beq	a5,a4,6900 <__sflush_r+0x240>
    68f4:	00c41703          	lh	a4,12(s0)
    68f8:	04076713          	or	a4,a4,64
    68fc:	f71ff06f          	j	686c <__sflush_r+0x1ac>
    6900:	0099a023          	sw	s1,0(s3)
    6904:	01412483          	lw	s1,20(sp)
    6908:	ee1ff06f          	j	67e8 <__sflush_r+0x128>

0000690c <_fflush_r>:
    690c:	ff010113          	add	sp,sp,-16
    6910:	00812423          	sw	s0,8(sp)
    6914:	00912223          	sw	s1,4(sp)
    6918:	00112623          	sw	ra,12(sp)
    691c:	01212023          	sw	s2,0(sp)
    6920:	00050493          	mv	s1,a0
    6924:	00058413          	mv	s0,a1
    6928:	00050663          	beqz	a0,6934 <_fflush_r+0x28>
    692c:	03452783          	lw	a5,52(a0)
    6930:	0a078a63          	beqz	a5,69e4 <_fflush_r+0xd8>
    6934:	00c41783          	lh	a5,12(s0)
    6938:	00000913          	li	s2,0
    693c:	04078063          	beqz	a5,697c <_fflush_r+0x70>
    6940:	06442703          	lw	a4,100(s0)
    6944:	00177713          	and	a4,a4,1
    6948:	00071663          	bnez	a4,6954 <_fflush_r+0x48>
    694c:	2007f793          	and	a5,a5,512
    6950:	04078463          	beqz	a5,6998 <_fflush_r+0x8c>
    6954:	00040593          	mv	a1,s0
    6958:	00048513          	mv	a0,s1
    695c:	d65ff0ef          	jal	66c0 <__sflush_r>
    6960:	06442783          	lw	a5,100(s0)
    6964:	00050913          	mv	s2,a0
    6968:	0017f793          	and	a5,a5,1
    696c:	00079863          	bnez	a5,697c <_fflush_r+0x70>
    6970:	00c45783          	lhu	a5,12(s0)
    6974:	2007f793          	and	a5,a5,512
    6978:	04078463          	beqz	a5,69c0 <_fflush_r+0xb4>
    697c:	00c12083          	lw	ra,12(sp)
    6980:	00812403          	lw	s0,8(sp)
    6984:	00412483          	lw	s1,4(sp)
    6988:	00090513          	mv	a0,s2
    698c:	00012903          	lw	s2,0(sp)
    6990:	01010113          	add	sp,sp,16
    6994:	00008067          	ret
    6998:	05842503          	lw	a0,88(s0)
    699c:	e44fa0ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    69a0:	00040593          	mv	a1,s0
    69a4:	00048513          	mv	a0,s1
    69a8:	d19ff0ef          	jal	66c0 <__sflush_r>
    69ac:	06442783          	lw	a5,100(s0)
    69b0:	00050913          	mv	s2,a0
    69b4:	0017f793          	and	a5,a5,1
    69b8:	fc0792e3          	bnez	a5,697c <_fflush_r+0x70>
    69bc:	fb5ff06f          	j	6970 <_fflush_r+0x64>
    69c0:	05842503          	lw	a0,88(s0)
    69c4:	e20fa0ef          	jal	fe4 <__retarget_lock_release_recursive>
    69c8:	00c12083          	lw	ra,12(sp)
    69cc:	00812403          	lw	s0,8(sp)
    69d0:	00412483          	lw	s1,4(sp)
    69d4:	00090513          	mv	a0,s2
    69d8:	00012903          	lw	s2,0(sp)
    69dc:	01010113          	add	sp,sp,16
    69e0:	00008067          	ret
    69e4:	224000ef          	jal	6c08 <__sinit>
    69e8:	f4dff06f          	j	6934 <_fflush_r+0x28>

000069ec <stdio_exit_handler>:
    69ec:	7fffa617          	auipc	a2,0x7fffa
    69f0:	b3c60613          	add	a2,a2,-1220 # 80000528 <__sglue>
    69f4:	00004597          	auipc	a1,0x4
    69f8:	28c58593          	add	a1,a1,652 # ac80 <_fclose_r>
    69fc:	7fff9517          	auipc	a0,0x7fff9
    6a00:	60450513          	add	a0,a0,1540 # 80000000 <_impure_data>
    6a04:	7a00006f          	j	71a4 <_fwalk_sglue>

00006a08 <cleanup_stdio>:
    6a08:	00452583          	lw	a1,4(a0)
    6a0c:	ff010113          	add	sp,sp,-16
    6a10:	00812423          	sw	s0,8(sp)
    6a14:	00112623          	sw	ra,12(sp)
    6a18:	7fffa797          	auipc	a5,0x7fffa
    6a1c:	e4478793          	add	a5,a5,-444 # 8000085c <__sf>
    6a20:	00050413          	mv	s0,a0
    6a24:	00f58463          	beq	a1,a5,6a2c <cleanup_stdio+0x24>
    6a28:	258040ef          	jal	ac80 <_fclose_r>
    6a2c:	00842583          	lw	a1,8(s0)
    6a30:	7fffa797          	auipc	a5,0x7fffa
    6a34:	e9478793          	add	a5,a5,-364 # 800008c4 <__sf+0x68>
    6a38:	00f58663          	beq	a1,a5,6a44 <cleanup_stdio+0x3c>
    6a3c:	00040513          	mv	a0,s0
    6a40:	240040ef          	jal	ac80 <_fclose_r>
    6a44:	00c42583          	lw	a1,12(s0)
    6a48:	7fffa797          	auipc	a5,0x7fffa
    6a4c:	ee478793          	add	a5,a5,-284 # 8000092c <__sf+0xd0>
    6a50:	00f58c63          	beq	a1,a5,6a68 <cleanup_stdio+0x60>
    6a54:	00040513          	mv	a0,s0
    6a58:	00812403          	lw	s0,8(sp)
    6a5c:	00c12083          	lw	ra,12(sp)
    6a60:	01010113          	add	sp,sp,16
    6a64:	21c0406f          	j	ac80 <_fclose_r>
    6a68:	00c12083          	lw	ra,12(sp)
    6a6c:	00812403          	lw	s0,8(sp)
    6a70:	01010113          	add	sp,sp,16
    6a74:	00008067          	ret

00006a78 <global_stdio_init.part.0>:
    6a78:	fe010113          	add	sp,sp,-32
    6a7c:	00000797          	auipc	a5,0x0
    6a80:	f7078793          	add	a5,a5,-144 # 69ec <stdio_exit_handler>
    6a84:	00112e23          	sw	ra,28(sp)
    6a88:	00812c23          	sw	s0,24(sp)
    6a8c:	00912a23          	sw	s1,20(sp)
    6a90:	7fffa417          	auipc	s0,0x7fffa
    6a94:	dcc40413          	add	s0,s0,-564 # 8000085c <__sf>
    6a98:	01212823          	sw	s2,16(sp)
    6a9c:	01312623          	sw	s3,12(sp)
    6aa0:	01412423          	sw	s4,8(sp)
    6aa4:	00800613          	li	a2,8
    6aa8:	00000593          	li	a1,0
    6aac:	7fffa717          	auipc	a4,0x7fffa
    6ab0:	c8f72223          	sw	a5,-892(a4) # 80000730 <__stdio_exit_handler>
    6ab4:	7fffa517          	auipc	a0,0x7fffa
    6ab8:	e0450513          	add	a0,a0,-508 # 800008b8 <__sf+0x5c>
    6abc:	00400793          	li	a5,4
    6ac0:	00f42623          	sw	a5,12(s0)
    6ac4:	00042023          	sw	zero,0(s0)
    6ac8:	00042223          	sw	zero,4(s0)
    6acc:	00042423          	sw	zero,8(s0)
    6ad0:	06042223          	sw	zero,100(s0)
    6ad4:	00042823          	sw	zero,16(s0)
    6ad8:	00042a23          	sw	zero,20(s0)
    6adc:	00042c23          	sw	zero,24(s0)
    6ae0:	d08fa0ef          	jal	fe8 <memset>
    6ae4:	00001a17          	auipc	s4,0x1
    6ae8:	870a0a13          	add	s4,s4,-1936 # 7354 <__sread>
    6aec:	00001997          	auipc	s3,0x1
    6af0:	8c498993          	add	s3,s3,-1852 # 73b0 <__swrite>
    6af4:	00001917          	auipc	s2,0x1
    6af8:	94490913          	add	s2,s2,-1724 # 7438 <__sseek>
    6afc:	00001497          	auipc	s1,0x1
    6b00:	9b448493          	add	s1,s1,-1612 # 74b0 <__sclose>
    6b04:	7fffa517          	auipc	a0,0x7fffa
    6b08:	db050513          	add	a0,a0,-592 # 800008b4 <__sf+0x58>
    6b0c:	03442023          	sw	s4,32(s0)
    6b10:	03342223          	sw	s3,36(s0)
    6b14:	03242423          	sw	s2,40(s0)
    6b18:	02942623          	sw	s1,44(s0)
    6b1c:	00842e23          	sw	s0,28(s0)
    6b20:	cb8fa0ef          	jal	fd8 <__retarget_lock_init_recursive>
    6b24:	000107b7          	lui	a5,0x10
    6b28:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x601>
    6b2c:	00800613          	li	a2,8
    6b30:	00000593          	li	a1,0
    6b34:	7fffa517          	auipc	a0,0x7fffa
    6b38:	dec50513          	add	a0,a0,-532 # 80000920 <__sf+0xc4>
    6b3c:	06f42a23          	sw	a5,116(s0)
    6b40:	06042423          	sw	zero,104(s0)
    6b44:	06042623          	sw	zero,108(s0)
    6b48:	06042823          	sw	zero,112(s0)
    6b4c:	0c042623          	sw	zero,204(s0)
    6b50:	06042c23          	sw	zero,120(s0)
    6b54:	06042e23          	sw	zero,124(s0)
    6b58:	08042023          	sw	zero,128(s0)
    6b5c:	c8cfa0ef          	jal	fe8 <memset>
    6b60:	7fffa797          	auipc	a5,0x7fffa
    6b64:	d6478793          	add	a5,a5,-668 # 800008c4 <__sf+0x68>
    6b68:	7fffa517          	auipc	a0,0x7fffa
    6b6c:	db450513          	add	a0,a0,-588 # 8000091c <__sf+0xc0>
    6b70:	08f42223          	sw	a5,132(s0)
    6b74:	09442423          	sw	s4,136(s0)
    6b78:	09342623          	sw	s3,140(s0)
    6b7c:	09242823          	sw	s2,144(s0)
    6b80:	08942a23          	sw	s1,148(s0)
    6b84:	c54fa0ef          	jal	fd8 <__retarget_lock_init_recursive>
    6b88:	000207b7          	lui	a5,0x20
    6b8c:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6b90:	00800613          	li	a2,8
    6b94:	00000593          	li	a1,0
    6b98:	7fffa517          	auipc	a0,0x7fffa
    6b9c:	df050513          	add	a0,a0,-528 # 80000988 <__sf+0x12c>
    6ba0:	0cf42e23          	sw	a5,220(s0)
    6ba4:	0c042823          	sw	zero,208(s0)
    6ba8:	0c042a23          	sw	zero,212(s0)
    6bac:	0c042c23          	sw	zero,216(s0)
    6bb0:	12042a23          	sw	zero,308(s0)
    6bb4:	0e042023          	sw	zero,224(s0)
    6bb8:	0e042223          	sw	zero,228(s0)
    6bbc:	0e042423          	sw	zero,232(s0)
    6bc0:	c28fa0ef          	jal	fe8 <memset>
    6bc4:	7fffa797          	auipc	a5,0x7fffa
    6bc8:	d6878793          	add	a5,a5,-664 # 8000092c <__sf+0xd0>
    6bcc:	0f442823          	sw	s4,240(s0)
    6bd0:	0f342a23          	sw	s3,244(s0)
    6bd4:	0f242c23          	sw	s2,248(s0)
    6bd8:	0e942e23          	sw	s1,252(s0)
    6bdc:	0ef42623          	sw	a5,236(s0)
    6be0:	01812403          	lw	s0,24(sp)
    6be4:	01c12083          	lw	ra,28(sp)
    6be8:	01412483          	lw	s1,20(sp)
    6bec:	01012903          	lw	s2,16(sp)
    6bf0:	00c12983          	lw	s3,12(sp)
    6bf4:	00812a03          	lw	s4,8(sp)
    6bf8:	7fffa517          	auipc	a0,0x7fffa
    6bfc:	d8c50513          	add	a0,a0,-628 # 80000984 <__sf+0x128>
    6c00:	02010113          	add	sp,sp,32
    6c04:	bd4fa06f          	j	fd8 <__retarget_lock_init_recursive>

00006c08 <__sinit>:
    6c08:	ff010113          	add	sp,sp,-16
    6c0c:	00812423          	sw	s0,8(sp)
    6c10:	00050413          	mv	s0,a0
    6c14:	7fffa517          	auipc	a0,0x7fffa
    6c18:	b0c50513          	add	a0,a0,-1268 # 80000720 <__lock___sfp_recursive_mutex>
    6c1c:	00112623          	sw	ra,12(sp)
    6c20:	bc0fa0ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    6c24:	03442783          	lw	a5,52(s0)
    6c28:	00079e63          	bnez	a5,6c44 <__sinit+0x3c>
    6c2c:	00000797          	auipc	a5,0x0
    6c30:	ddc78793          	add	a5,a5,-548 # 6a08 <cleanup_stdio>
    6c34:	02f42a23          	sw	a5,52(s0)
    6c38:	7fffa797          	auipc	a5,0x7fffa
    6c3c:	af87a783          	lw	a5,-1288(a5) # 80000730 <__stdio_exit_handler>
    6c40:	00078e63          	beqz	a5,6c5c <__sinit+0x54>
    6c44:	00812403          	lw	s0,8(sp)
    6c48:	00c12083          	lw	ra,12(sp)
    6c4c:	7fffa517          	auipc	a0,0x7fffa
    6c50:	ad450513          	add	a0,a0,-1324 # 80000720 <__lock___sfp_recursive_mutex>
    6c54:	01010113          	add	sp,sp,16
    6c58:	b8cfa06f          	j	fe4 <__retarget_lock_release_recursive>
    6c5c:	e1dff0ef          	jal	6a78 <global_stdio_init.part.0>
    6c60:	00812403          	lw	s0,8(sp)
    6c64:	00c12083          	lw	ra,12(sp)
    6c68:	7fffa517          	auipc	a0,0x7fffa
    6c6c:	ab850513          	add	a0,a0,-1352 # 80000720 <__lock___sfp_recursive_mutex>
    6c70:	01010113          	add	sp,sp,16
    6c74:	b70fa06f          	j	fe4 <__retarget_lock_release_recursive>

00006c78 <__sfp_lock_acquire>:
    6c78:	7fffa517          	auipc	a0,0x7fffa
    6c7c:	aa850513          	add	a0,a0,-1368 # 80000720 <__lock___sfp_recursive_mutex>
    6c80:	b60fa06f          	j	fe0 <__retarget_lock_acquire_recursive>

00006c84 <__sfp_lock_release>:
    6c84:	7fffa517          	auipc	a0,0x7fffa
    6c88:	a9c50513          	add	a0,a0,-1380 # 80000720 <__lock___sfp_recursive_mutex>
    6c8c:	b58fa06f          	j	fe4 <__retarget_lock_release_recursive>

00006c90 <__sfvwrite_r>:
    6c90:	00862783          	lw	a5,8(a2)
    6c94:	2c078463          	beqz	a5,6f5c <__sfvwrite_r+0x2cc>
    6c98:	00c59683          	lh	a3,12(a1)
    6c9c:	fd010113          	add	sp,sp,-48
    6ca0:	02812423          	sw	s0,40(sp)
    6ca4:	01412c23          	sw	s4,24(sp)
    6ca8:	01612823          	sw	s6,16(sp)
    6cac:	02112623          	sw	ra,44(sp)
    6cb0:	0086f793          	and	a5,a3,8
    6cb4:	00060b13          	mv	s6,a2
    6cb8:	00050a13          	mv	s4,a0
    6cbc:	00058413          	mv	s0,a1
    6cc0:	08078e63          	beqz	a5,6d5c <__sfvwrite_r+0xcc>
    6cc4:	0105a783          	lw	a5,16(a1)
    6cc8:	08078a63          	beqz	a5,6d5c <__sfvwrite_r+0xcc>
    6ccc:	02912223          	sw	s1,36(sp)
    6cd0:	03212023          	sw	s2,32(sp)
    6cd4:	01312e23          	sw	s3,28(sp)
    6cd8:	01512a23          	sw	s5,20(sp)
    6cdc:	0026f793          	and	a5,a3,2
    6ce0:	000b2483          	lw	s1,0(s6)
    6ce4:	0a078463          	beqz	a5,6d8c <__sfvwrite_r+0xfc>
    6ce8:	02442783          	lw	a5,36(s0)
    6cec:	01c42583          	lw	a1,28(s0)
    6cf0:	80000ab7          	lui	s5,0x80000
    6cf4:	00000993          	li	s3,0
    6cf8:	00000913          	li	s2,0
    6cfc:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6d00:	00098613          	mv	a2,s3
    6d04:	000a0513          	mv	a0,s4
    6d08:	04090263          	beqz	s2,6d4c <__sfvwrite_r+0xbc>
    6d0c:	00090693          	mv	a3,s2
    6d10:	012af463          	bgeu	s5,s2,6d18 <__sfvwrite_r+0x88>
    6d14:	000a8693          	mv	a3,s5
    6d18:	000780e7          	jalr	a5
    6d1c:	46a05263          	blez	a0,7180 <__sfvwrite_r+0x4f0>
    6d20:	008b2783          	lw	a5,8(s6)
    6d24:	00a989b3          	add	s3,s3,a0
    6d28:	40a90933          	sub	s2,s2,a0
    6d2c:	40a787b3          	sub	a5,a5,a0
    6d30:	00fb2423          	sw	a5,8(s6)
    6d34:	1a078663          	beqz	a5,6ee0 <__sfvwrite_r+0x250>
    6d38:	02442783          	lw	a5,36(s0)
    6d3c:	01c42583          	lw	a1,28(s0)
    6d40:	00098613          	mv	a2,s3
    6d44:	000a0513          	mv	a0,s4
    6d48:	fc0912e3          	bnez	s2,6d0c <__sfvwrite_r+0x7c>
    6d4c:	0004a983          	lw	s3,0(s1)
    6d50:	0044a903          	lw	s2,4(s1)
    6d54:	00848493          	add	s1,s1,8
    6d58:	fa9ff06f          	j	6d00 <__sfvwrite_r+0x70>
    6d5c:	00040593          	mv	a1,s0
    6d60:	000a0513          	mv	a0,s4
    6d64:	0e5000ef          	jal	7648 <__swsetup_r>
    6d68:	1c051c63          	bnez	a0,6f40 <__sfvwrite_r+0x2b0>
    6d6c:	00c41683          	lh	a3,12(s0)
    6d70:	02912223          	sw	s1,36(sp)
    6d74:	03212023          	sw	s2,32(sp)
    6d78:	01312e23          	sw	s3,28(sp)
    6d7c:	01512a23          	sw	s5,20(sp)
    6d80:	0026f793          	and	a5,a3,2
    6d84:	000b2483          	lw	s1,0(s6)
    6d88:	f60790e3          	bnez	a5,6ce8 <__sfvwrite_r+0x58>
    6d8c:	01712623          	sw	s7,12(sp)
    6d90:	01812423          	sw	s8,8(sp)
    6d94:	0016f793          	and	a5,a3,1
    6d98:	1c079663          	bnez	a5,6f64 <__sfvwrite_r+0x2d4>
    6d9c:	00042783          	lw	a5,0(s0)
    6da0:	00842703          	lw	a4,8(s0)
    6da4:	80000ab7          	lui	s5,0x80000
    6da8:	01912223          	sw	s9,4(sp)
    6dac:	00000b93          	li	s7,0
    6db0:	00000993          	li	s3,0
    6db4:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6db8:	00078513          	mv	a0,a5
    6dbc:	00070c13          	mv	s8,a4
    6dc0:	10098263          	beqz	s3,6ec4 <__sfvwrite_r+0x234>
    6dc4:	2006f613          	and	a2,a3,512
    6dc8:	28060863          	beqz	a2,7058 <__sfvwrite_r+0x3c8>
    6dcc:	00070c93          	mv	s9,a4
    6dd0:	32e9e863          	bltu	s3,a4,7100 <__sfvwrite_r+0x470>
    6dd4:	4806f713          	and	a4,a3,1152
    6dd8:	08070a63          	beqz	a4,6e6c <__sfvwrite_r+0x1dc>
    6ddc:	01442603          	lw	a2,20(s0)
    6de0:	01042583          	lw	a1,16(s0)
    6de4:	00161713          	sll	a4,a2,0x1
    6de8:	00c70733          	add	a4,a4,a2
    6dec:	40b78933          	sub	s2,a5,a1
    6df0:	01f75c13          	srl	s8,a4,0x1f
    6df4:	00ec0c33          	add	s8,s8,a4
    6df8:	00190793          	add	a5,s2,1
    6dfc:	401c5c13          	sra	s8,s8,0x1
    6e00:	013787b3          	add	a5,a5,s3
    6e04:	000c0613          	mv	a2,s8
    6e08:	00fc7663          	bgeu	s8,a5,6e14 <__sfvwrite_r+0x184>
    6e0c:	00078c13          	mv	s8,a5
    6e10:	00078613          	mv	a2,a5
    6e14:	4006f693          	and	a3,a3,1024
    6e18:	32068063          	beqz	a3,7138 <__sfvwrite_r+0x4a8>
    6e1c:	00060593          	mv	a1,a2
    6e20:	000a0513          	mv	a0,s4
    6e24:	921fa0ef          	jal	1744 <_malloc_r>
    6e28:	00050c93          	mv	s9,a0
    6e2c:	34050e63          	beqz	a0,7188 <__sfvwrite_r+0x4f8>
    6e30:	01042583          	lw	a1,16(s0)
    6e34:	00090613          	mv	a2,s2
    6e38:	a8cfa0ef          	jal	10c4 <memcpy>
    6e3c:	00c45783          	lhu	a5,12(s0)
    6e40:	b7f7f793          	and	a5,a5,-1153
    6e44:	0807e793          	or	a5,a5,128
    6e48:	00f41623          	sh	a5,12(s0)
    6e4c:	012c8533          	add	a0,s9,s2
    6e50:	412c07b3          	sub	a5,s8,s2
    6e54:	01942823          	sw	s9,16(s0)
    6e58:	01842a23          	sw	s8,20(s0)
    6e5c:	00a42023          	sw	a0,0(s0)
    6e60:	00098c13          	mv	s8,s3
    6e64:	00f42423          	sw	a5,8(s0)
    6e68:	00098c93          	mv	s9,s3
    6e6c:	000c8613          	mv	a2,s9
    6e70:	000b8593          	mv	a1,s7
    6e74:	6a9000ef          	jal	7d1c <memmove>
    6e78:	00842703          	lw	a4,8(s0)
    6e7c:	00042783          	lw	a5,0(s0)
    6e80:	00098913          	mv	s2,s3
    6e84:	41870733          	sub	a4,a4,s8
    6e88:	019787b3          	add	a5,a5,s9
    6e8c:	00e42423          	sw	a4,8(s0)
    6e90:	00f42023          	sw	a5,0(s0)
    6e94:	00000993          	li	s3,0
    6e98:	008b2783          	lw	a5,8(s6)
    6e9c:	012b8bb3          	add	s7,s7,s2
    6ea0:	412787b3          	sub	a5,a5,s2
    6ea4:	00fb2423          	sw	a5,8(s6)
    6ea8:	02078663          	beqz	a5,6ed4 <__sfvwrite_r+0x244>
    6eac:	00042783          	lw	a5,0(s0)
    6eb0:	00842703          	lw	a4,8(s0)
    6eb4:	00c41683          	lh	a3,12(s0)
    6eb8:	00078513          	mv	a0,a5
    6ebc:	00070c13          	mv	s8,a4
    6ec0:	f00992e3          	bnez	s3,6dc4 <__sfvwrite_r+0x134>
    6ec4:	0004ab83          	lw	s7,0(s1)
    6ec8:	0044a983          	lw	s3,4(s1)
    6ecc:	00848493          	add	s1,s1,8
    6ed0:	ee9ff06f          	j	6db8 <__sfvwrite_r+0x128>
    6ed4:	00c12b83          	lw	s7,12(sp)
    6ed8:	00812c03          	lw	s8,8(sp)
    6edc:	00412c83          	lw	s9,4(sp)
    6ee0:	02c12083          	lw	ra,44(sp)
    6ee4:	02812403          	lw	s0,40(sp)
    6ee8:	02412483          	lw	s1,36(sp)
    6eec:	02012903          	lw	s2,32(sp)
    6ef0:	01c12983          	lw	s3,28(sp)
    6ef4:	01412a83          	lw	s5,20(sp)
    6ef8:	01812a03          	lw	s4,24(sp)
    6efc:	01012b03          	lw	s6,16(sp)
    6f00:	00000513          	li	a0,0
    6f04:	03010113          	add	sp,sp,48
    6f08:	00008067          	ret
    6f0c:	00040593          	mv	a1,s0
    6f10:	000a0513          	mv	a0,s4
    6f14:	9f9ff0ef          	jal	690c <_fflush_r>
    6f18:	0a050e63          	beqz	a0,6fd4 <__sfvwrite_r+0x344>
    6f1c:	00c41783          	lh	a5,12(s0)
    6f20:	00c12b83          	lw	s7,12(sp)
    6f24:	00812c03          	lw	s8,8(sp)
    6f28:	02412483          	lw	s1,36(sp)
    6f2c:	02012903          	lw	s2,32(sp)
    6f30:	01c12983          	lw	s3,28(sp)
    6f34:	01412a83          	lw	s5,20(sp)
    6f38:	0407e793          	or	a5,a5,64
    6f3c:	00f41623          	sh	a5,12(s0)
    6f40:	02c12083          	lw	ra,44(sp)
    6f44:	02812403          	lw	s0,40(sp)
    6f48:	01812a03          	lw	s4,24(sp)
    6f4c:	01012b03          	lw	s6,16(sp)
    6f50:	fff00513          	li	a0,-1
    6f54:	03010113          	add	sp,sp,48
    6f58:	00008067          	ret
    6f5c:	00000513          	li	a0,0
    6f60:	00008067          	ret
    6f64:	00000a93          	li	s5,0
    6f68:	00000513          	li	a0,0
    6f6c:	00000c13          	li	s8,0
    6f70:	00000993          	li	s3,0
    6f74:	08098263          	beqz	s3,6ff8 <__sfvwrite_r+0x368>
    6f78:	08050a63          	beqz	a0,700c <__sfvwrite_r+0x37c>
    6f7c:	000a8793          	mv	a5,s5
    6f80:	00098b93          	mv	s7,s3
    6f84:	0137f463          	bgeu	a5,s3,6f8c <__sfvwrite_r+0x2fc>
    6f88:	00078b93          	mv	s7,a5
    6f8c:	00042503          	lw	a0,0(s0)
    6f90:	01042783          	lw	a5,16(s0)
    6f94:	00842903          	lw	s2,8(s0)
    6f98:	01442683          	lw	a3,20(s0)
    6f9c:	00a7f663          	bgeu	a5,a0,6fa8 <__sfvwrite_r+0x318>
    6fa0:	00d90933          	add	s2,s2,a3
    6fa4:	09794463          	blt	s2,s7,702c <__sfvwrite_r+0x39c>
    6fa8:	16dbc263          	blt	s7,a3,710c <__sfvwrite_r+0x47c>
    6fac:	02442783          	lw	a5,36(s0)
    6fb0:	01c42583          	lw	a1,28(s0)
    6fb4:	000c0613          	mv	a2,s8
    6fb8:	000a0513          	mv	a0,s4
    6fbc:	000780e7          	jalr	a5
    6fc0:	00050913          	mv	s2,a0
    6fc4:	f4a05ce3          	blez	a0,6f1c <__sfvwrite_r+0x28c>
    6fc8:	412a8ab3          	sub	s5,s5,s2
    6fcc:	00100513          	li	a0,1
    6fd0:	f20a8ee3          	beqz	s5,6f0c <__sfvwrite_r+0x27c>
    6fd4:	008b2783          	lw	a5,8(s6)
    6fd8:	012c0c33          	add	s8,s8,s2
    6fdc:	412989b3          	sub	s3,s3,s2
    6fe0:	412787b3          	sub	a5,a5,s2
    6fe4:	00fb2423          	sw	a5,8(s6)
    6fe8:	f80796e3          	bnez	a5,6f74 <__sfvwrite_r+0x2e4>
    6fec:	00c12b83          	lw	s7,12(sp)
    6ff0:	00812c03          	lw	s8,8(sp)
    6ff4:	eedff06f          	j	6ee0 <__sfvwrite_r+0x250>
    6ff8:	0044a983          	lw	s3,4(s1)
    6ffc:	00048793          	mv	a5,s1
    7000:	00848493          	add	s1,s1,8
    7004:	fe098ae3          	beqz	s3,6ff8 <__sfvwrite_r+0x368>
    7008:	0007ac03          	lw	s8,0(a5)
    700c:	00098613          	mv	a2,s3
    7010:	00a00593          	li	a1,10
    7014:	000c0513          	mv	a0,s8
    7018:	1a1000ef          	jal	79b8 <memchr>
    701c:	14050c63          	beqz	a0,7174 <__sfvwrite_r+0x4e4>
    7020:	00150513          	add	a0,a0,1
    7024:	41850ab3          	sub	s5,a0,s8
    7028:	f55ff06f          	j	6f7c <__sfvwrite_r+0x2ec>
    702c:	000c0593          	mv	a1,s8
    7030:	00090613          	mv	a2,s2
    7034:	4e9000ef          	jal	7d1c <memmove>
    7038:	00042783          	lw	a5,0(s0)
    703c:	00040593          	mv	a1,s0
    7040:	000a0513          	mv	a0,s4
    7044:	012787b3          	add	a5,a5,s2
    7048:	00f42023          	sw	a5,0(s0)
    704c:	8c1ff0ef          	jal	690c <_fflush_r>
    7050:	f6050ce3          	beqz	a0,6fc8 <__sfvwrite_r+0x338>
    7054:	ec9ff06f          	j	6f1c <__sfvwrite_r+0x28c>
    7058:	01042683          	lw	a3,16(s0)
    705c:	04f6e463          	bltu	a3,a5,70a4 <__sfvwrite_r+0x414>
    7060:	01442583          	lw	a1,20(s0)
    7064:	04b9e063          	bltu	s3,a1,70a4 <__sfvwrite_r+0x414>
    7068:	00098913          	mv	s2,s3
    706c:	013af463          	bgeu	s5,s3,7074 <__sfvwrite_r+0x3e4>
    7070:	000a8913          	mv	s2,s5
    7074:	00090513          	mv	a0,s2
    7078:	65d070ef          	jal	eed4 <__modsi3>
    707c:	02442783          	lw	a5,36(s0)
    7080:	01c42583          	lw	a1,28(s0)
    7084:	40a906b3          	sub	a3,s2,a0
    7088:	000b8613          	mv	a2,s7
    708c:	000a0513          	mv	a0,s4
    7090:	000780e7          	jalr	a5
    7094:	00050913          	mv	s2,a0
    7098:	04a05a63          	blez	a0,70ec <__sfvwrite_r+0x45c>
    709c:	412989b3          	sub	s3,s3,s2
    70a0:	df9ff06f          	j	6e98 <__sfvwrite_r+0x208>
    70a4:	00070913          	mv	s2,a4
    70a8:	00e9f463          	bgeu	s3,a4,70b0 <__sfvwrite_r+0x420>
    70ac:	00098913          	mv	s2,s3
    70b0:	00078513          	mv	a0,a5
    70b4:	00090613          	mv	a2,s2
    70b8:	000b8593          	mv	a1,s7
    70bc:	461000ef          	jal	7d1c <memmove>
    70c0:	00842703          	lw	a4,8(s0)
    70c4:	00042783          	lw	a5,0(s0)
    70c8:	41270733          	sub	a4,a4,s2
    70cc:	012787b3          	add	a5,a5,s2
    70d0:	00e42423          	sw	a4,8(s0)
    70d4:	00f42023          	sw	a5,0(s0)
    70d8:	fc0712e3          	bnez	a4,709c <__sfvwrite_r+0x40c>
    70dc:	00040593          	mv	a1,s0
    70e0:	000a0513          	mv	a0,s4
    70e4:	829ff0ef          	jal	690c <_fflush_r>
    70e8:	fa050ae3          	beqz	a0,709c <__sfvwrite_r+0x40c>
    70ec:	00c41783          	lh	a5,12(s0)
    70f0:	00c12b83          	lw	s7,12(sp)
    70f4:	00812c03          	lw	s8,8(sp)
    70f8:	00412c83          	lw	s9,4(sp)
    70fc:	e2dff06f          	j	6f28 <__sfvwrite_r+0x298>
    7100:	00098c13          	mv	s8,s3
    7104:	00098c93          	mv	s9,s3
    7108:	d65ff06f          	j	6e6c <__sfvwrite_r+0x1dc>
    710c:	000b8613          	mv	a2,s7
    7110:	000c0593          	mv	a1,s8
    7114:	409000ef          	jal	7d1c <memmove>
    7118:	00842703          	lw	a4,8(s0)
    711c:	00042783          	lw	a5,0(s0)
    7120:	000b8913          	mv	s2,s7
    7124:	41770733          	sub	a4,a4,s7
    7128:	017787b3          	add	a5,a5,s7
    712c:	00e42423          	sw	a4,8(s0)
    7130:	00f42023          	sw	a5,0(s0)
    7134:	e95ff06f          	j	6fc8 <__sfvwrite_r+0x338>
    7138:	000a0513          	mv	a0,s4
    713c:	508030ef          	jal	a644 <_realloc_r>
    7140:	00050c93          	mv	s9,a0
    7144:	d00514e3          	bnez	a0,6e4c <__sfvwrite_r+0x1bc>
    7148:	01042583          	lw	a1,16(s0)
    714c:	000a0513          	mv	a0,s4
    7150:	ae8fa0ef          	jal	1438 <_free_r>
    7154:	00c41783          	lh	a5,12(s0)
    7158:	00c00713          	li	a4,12
    715c:	00c12b83          	lw	s7,12(sp)
    7160:	00812c03          	lw	s8,8(sp)
    7164:	00412c83          	lw	s9,4(sp)
    7168:	00ea2023          	sw	a4,0(s4)
    716c:	f7f7f793          	and	a5,a5,-129
    7170:	db9ff06f          	j	6f28 <__sfvwrite_r+0x298>
    7174:	00198793          	add	a5,s3,1
    7178:	00078a93          	mv	s5,a5
    717c:	e05ff06f          	j	6f80 <__sfvwrite_r+0x2f0>
    7180:	00c41783          	lh	a5,12(s0)
    7184:	da5ff06f          	j	6f28 <__sfvwrite_r+0x298>
    7188:	00c00713          	li	a4,12
    718c:	00c41783          	lh	a5,12(s0)
    7190:	00c12b83          	lw	s7,12(sp)
    7194:	00812c03          	lw	s8,8(sp)
    7198:	00412c83          	lw	s9,4(sp)
    719c:	00ea2023          	sw	a4,0(s4)
    71a0:	d89ff06f          	j	6f28 <__sfvwrite_r+0x298>

000071a4 <_fwalk_sglue>:
    71a4:	fd010113          	add	sp,sp,-48
    71a8:	03212023          	sw	s2,32(sp)
    71ac:	01312e23          	sw	s3,28(sp)
    71b0:	01412c23          	sw	s4,24(sp)
    71b4:	01512a23          	sw	s5,20(sp)
    71b8:	01612823          	sw	s6,16(sp)
    71bc:	01712623          	sw	s7,12(sp)
    71c0:	02112623          	sw	ra,44(sp)
    71c4:	02812423          	sw	s0,40(sp)
    71c8:	02912223          	sw	s1,36(sp)
    71cc:	00050b13          	mv	s6,a0
    71d0:	00058b93          	mv	s7,a1
    71d4:	00060a93          	mv	s5,a2
    71d8:	00000a13          	li	s4,0
    71dc:	00100993          	li	s3,1
    71e0:	fff00913          	li	s2,-1
    71e4:	004aa483          	lw	s1,4(s5)
    71e8:	008aa403          	lw	s0,8(s5)
    71ec:	fff48493          	add	s1,s1,-1
    71f0:	0204c863          	bltz	s1,7220 <_fwalk_sglue+0x7c>
    71f4:	00c45783          	lhu	a5,12(s0)
    71f8:	00f9fe63          	bgeu	s3,a5,7214 <_fwalk_sglue+0x70>
    71fc:	00e41783          	lh	a5,14(s0)
    7200:	00040593          	mv	a1,s0
    7204:	000b0513          	mv	a0,s6
    7208:	01278663          	beq	a5,s2,7214 <_fwalk_sglue+0x70>
    720c:	000b80e7          	jalr	s7
    7210:	00aa6a33          	or	s4,s4,a0
    7214:	fff48493          	add	s1,s1,-1
    7218:	06840413          	add	s0,s0,104
    721c:	fd249ce3          	bne	s1,s2,71f4 <_fwalk_sglue+0x50>
    7220:	000aaa83          	lw	s5,0(s5)
    7224:	fc0a90e3          	bnez	s5,71e4 <_fwalk_sglue+0x40>
    7228:	02c12083          	lw	ra,44(sp)
    722c:	02812403          	lw	s0,40(sp)
    7230:	02412483          	lw	s1,36(sp)
    7234:	02012903          	lw	s2,32(sp)
    7238:	01c12983          	lw	s3,28(sp)
    723c:	01412a83          	lw	s5,20(sp)
    7240:	01012b03          	lw	s6,16(sp)
    7244:	00c12b83          	lw	s7,12(sp)
    7248:	000a0513          	mv	a0,s4
    724c:	01812a03          	lw	s4,24(sp)
    7250:	03010113          	add	sp,sp,48
    7254:	00008067          	ret

00007258 <_putc_r>:
    7258:	fe010113          	add	sp,sp,-32
    725c:	00812c23          	sw	s0,24(sp)
    7260:	01212a23          	sw	s2,20(sp)
    7264:	00112e23          	sw	ra,28(sp)
    7268:	00050913          	mv	s2,a0
    726c:	00060413          	mv	s0,a2
    7270:	00050663          	beqz	a0,727c <_putc_r+0x24>
    7274:	03452783          	lw	a5,52(a0)
    7278:	0c078663          	beqz	a5,7344 <_putc_r+0xec>
    727c:	06442783          	lw	a5,100(s0)
    7280:	0017f793          	and	a5,a5,1
    7284:	00079863          	bnez	a5,7294 <_putc_r+0x3c>
    7288:	00c45783          	lhu	a5,12(s0)
    728c:	2007f793          	and	a5,a5,512
    7290:	08078063          	beqz	a5,7310 <_putc_r+0xb8>
    7294:	00842783          	lw	a5,8(s0)
    7298:	fff78793          	add	a5,a5,-1
    729c:	00f42423          	sw	a5,8(s0)
    72a0:	0007dc63          	bgez	a5,72b8 <_putc_r+0x60>
    72a4:	01842703          	lw	a4,24(s0)
    72a8:	04e7ca63          	blt	a5,a4,72fc <_putc_r+0xa4>
    72ac:	0ff5f793          	zext.b	a5,a1
    72b0:	00a00713          	li	a4,10
    72b4:	04e78463          	beq	a5,a4,72fc <_putc_r+0xa4>
    72b8:	00042783          	lw	a5,0(s0)
    72bc:	0ff5f913          	zext.b	s2,a1
    72c0:	00178713          	add	a4,a5,1
    72c4:	00e42023          	sw	a4,0(s0)
    72c8:	00b78023          	sb	a1,0(a5)
    72cc:	06442783          	lw	a5,100(s0)
    72d0:	0017f793          	and	a5,a5,1
    72d4:	00079863          	bnez	a5,72e4 <_putc_r+0x8c>
    72d8:	00c45783          	lhu	a5,12(s0)
    72dc:	2007f793          	and	a5,a5,512
    72e0:	04078263          	beqz	a5,7324 <_putc_r+0xcc>
    72e4:	01c12083          	lw	ra,28(sp)
    72e8:	01812403          	lw	s0,24(sp)
    72ec:	00090513          	mv	a0,s2
    72f0:	01412903          	lw	s2,20(sp)
    72f4:	02010113          	add	sp,sp,32
    72f8:	00008067          	ret
    72fc:	00090513          	mv	a0,s2
    7300:	00040613          	mv	a2,s0
    7304:	1b4000ef          	jal	74b8 <__swbuf_r>
    7308:	00050913          	mv	s2,a0
    730c:	fc1ff06f          	j	72cc <_putc_r+0x74>
    7310:	05842503          	lw	a0,88(s0)
    7314:	00b12623          	sw	a1,12(sp)
    7318:	cc9f90ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    731c:	00c12583          	lw	a1,12(sp)
    7320:	f75ff06f          	j	7294 <_putc_r+0x3c>
    7324:	05842503          	lw	a0,88(s0)
    7328:	cbdf90ef          	jal	fe4 <__retarget_lock_release_recursive>
    732c:	01c12083          	lw	ra,28(sp)
    7330:	01812403          	lw	s0,24(sp)
    7334:	00090513          	mv	a0,s2
    7338:	01412903          	lw	s2,20(sp)
    733c:	02010113          	add	sp,sp,32
    7340:	00008067          	ret
    7344:	00b12623          	sw	a1,12(sp)
    7348:	8c1ff0ef          	jal	6c08 <__sinit>
    734c:	00c12583          	lw	a1,12(sp)
    7350:	f2dff06f          	j	727c <_putc_r+0x24>

00007354 <__sread>:
    7354:	ff010113          	add	sp,sp,-16
    7358:	00812423          	sw	s0,8(sp)
    735c:	00058413          	mv	s0,a1
    7360:	00e59583          	lh	a1,14(a1)
    7364:	00112623          	sw	ra,12(sp)
    7368:	095000ef          	jal	7bfc <_read_r>
    736c:	02054063          	bltz	a0,738c <__sread+0x38>
    7370:	05042783          	lw	a5,80(s0)
    7374:	00c12083          	lw	ra,12(sp)
    7378:	00a787b3          	add	a5,a5,a0
    737c:	04f42823          	sw	a5,80(s0)
    7380:	00812403          	lw	s0,8(sp)
    7384:	01010113          	add	sp,sp,16
    7388:	00008067          	ret
    738c:	00c45783          	lhu	a5,12(s0)
    7390:	fffff737          	lui	a4,0xfffff
    7394:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7398:	00e7f7b3          	and	a5,a5,a4
    739c:	00c12083          	lw	ra,12(sp)
    73a0:	00f41623          	sh	a5,12(s0)
    73a4:	00812403          	lw	s0,8(sp)
    73a8:	01010113          	add	sp,sp,16
    73ac:	00008067          	ret

000073b0 <__swrite>:
    73b0:	00c59783          	lh	a5,12(a1)
    73b4:	fe010113          	add	sp,sp,-32
    73b8:	00812c23          	sw	s0,24(sp)
    73bc:	00912a23          	sw	s1,20(sp)
    73c0:	01212823          	sw	s2,16(sp)
    73c4:	01312623          	sw	s3,12(sp)
    73c8:	00112e23          	sw	ra,28(sp)
    73cc:	1007f713          	and	a4,a5,256
    73d0:	00058413          	mv	s0,a1
    73d4:	00050493          	mv	s1,a0
    73d8:	00060913          	mv	s2,a2
    73dc:	00068993          	mv	s3,a3
    73e0:	04071063          	bnez	a4,7420 <__swrite+0x70>
    73e4:	fffff737          	lui	a4,0xfffff
    73e8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    73ec:	00e7f7b3          	and	a5,a5,a4
    73f0:	00e41583          	lh	a1,14(s0)
    73f4:	00f41623          	sh	a5,12(s0)
    73f8:	01812403          	lw	s0,24(sp)
    73fc:	01c12083          	lw	ra,28(sp)
    7400:	00098693          	mv	a3,s3
    7404:	00090613          	mv	a2,s2
    7408:	00c12983          	lw	s3,12(sp)
    740c:	01012903          	lw	s2,16(sp)
    7410:	00048513          	mv	a0,s1
    7414:	01412483          	lw	s1,20(sp)
    7418:	02010113          	add	sp,sp,32
    741c:	09d0006f          	j	7cb8 <_write_r>
    7420:	00e59583          	lh	a1,14(a1)
    7424:	00200693          	li	a3,2
    7428:	00000613          	li	a2,0
    742c:	76c000ef          	jal	7b98 <_lseek_r>
    7430:	00c41783          	lh	a5,12(s0)
    7434:	fb1ff06f          	j	73e4 <__swrite+0x34>

00007438 <__sseek>:
    7438:	ff010113          	add	sp,sp,-16
    743c:	00812423          	sw	s0,8(sp)
    7440:	00058413          	mv	s0,a1
    7444:	00e59583          	lh	a1,14(a1)
    7448:	00112623          	sw	ra,12(sp)
    744c:	74c000ef          	jal	7b98 <_lseek_r>
    7450:	fff00793          	li	a5,-1
    7454:	02f50863          	beq	a0,a5,7484 <__sseek+0x4c>
    7458:	00c45783          	lhu	a5,12(s0)
    745c:	00001737          	lui	a4,0x1
    7460:	00c12083          	lw	ra,12(sp)
    7464:	00e7e7b3          	or	a5,a5,a4
    7468:	01079793          	sll	a5,a5,0x10
    746c:	4107d793          	sra	a5,a5,0x10
    7470:	04a42823          	sw	a0,80(s0)
    7474:	00f41623          	sh	a5,12(s0)
    7478:	00812403          	lw	s0,8(sp)
    747c:	01010113          	add	sp,sp,16
    7480:	00008067          	ret
    7484:	00c45783          	lhu	a5,12(s0)
    7488:	fffff737          	lui	a4,0xfffff
    748c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7490:	00e7f7b3          	and	a5,a5,a4
    7494:	01079793          	sll	a5,a5,0x10
    7498:	4107d793          	sra	a5,a5,0x10
    749c:	00c12083          	lw	ra,12(sp)
    74a0:	00f41623          	sh	a5,12(s0)
    74a4:	00812403          	lw	s0,8(sp)
    74a8:	01010113          	add	sp,sp,16
    74ac:	00008067          	ret

000074b0 <__sclose>:
    74b0:	00e59583          	lh	a1,14(a1)
    74b4:	68c0006f          	j	7b40 <_close_r>

000074b8 <__swbuf_r>:
    74b8:	fe010113          	add	sp,sp,-32
    74bc:	00812c23          	sw	s0,24(sp)
    74c0:	00912a23          	sw	s1,20(sp)
    74c4:	01212823          	sw	s2,16(sp)
    74c8:	00112e23          	sw	ra,28(sp)
    74cc:	00050913          	mv	s2,a0
    74d0:	00058493          	mv	s1,a1
    74d4:	00060413          	mv	s0,a2
    74d8:	00050663          	beqz	a0,74e4 <__swbuf_r+0x2c>
    74dc:	03452783          	lw	a5,52(a0)
    74e0:	16078063          	beqz	a5,7640 <__swbuf_r+0x188>
    74e4:	01842783          	lw	a5,24(s0)
    74e8:	00c41703          	lh	a4,12(s0)
    74ec:	00f42423          	sw	a5,8(s0)
    74f0:	00877793          	and	a5,a4,8
    74f4:	08078063          	beqz	a5,7574 <__swbuf_r+0xbc>
    74f8:	01042783          	lw	a5,16(s0)
    74fc:	06078c63          	beqz	a5,7574 <__swbuf_r+0xbc>
    7500:	01312623          	sw	s3,12(sp)
    7504:	01271693          	sll	a3,a4,0x12
    7508:	0ff4f993          	zext.b	s3,s1
    750c:	0ff4f493          	zext.b	s1,s1
    7510:	0806d863          	bgez	a3,75a0 <__swbuf_r+0xe8>
    7514:	00042703          	lw	a4,0(s0)
    7518:	01442683          	lw	a3,20(s0)
    751c:	40f707b3          	sub	a5,a4,a5
    7520:	0ad7d863          	bge	a5,a3,75d0 <__swbuf_r+0x118>
    7524:	00842683          	lw	a3,8(s0)
    7528:	00170613          	add	a2,a4,1
    752c:	00c42023          	sw	a2,0(s0)
    7530:	fff68693          	add	a3,a3,-1
    7534:	00d42423          	sw	a3,8(s0)
    7538:	01370023          	sb	s3,0(a4)
    753c:	01442703          	lw	a4,20(s0)
    7540:	00178793          	add	a5,a5,1
    7544:	0cf70263          	beq	a4,a5,7608 <__swbuf_r+0x150>
    7548:	00c45783          	lhu	a5,12(s0)
    754c:	0017f793          	and	a5,a5,1
    7550:	0c079a63          	bnez	a5,7624 <__swbuf_r+0x16c>
    7554:	00c12983          	lw	s3,12(sp)
    7558:	01c12083          	lw	ra,28(sp)
    755c:	01812403          	lw	s0,24(sp)
    7560:	01012903          	lw	s2,16(sp)
    7564:	00048513          	mv	a0,s1
    7568:	01412483          	lw	s1,20(sp)
    756c:	02010113          	add	sp,sp,32
    7570:	00008067          	ret
    7574:	00040593          	mv	a1,s0
    7578:	00090513          	mv	a0,s2
    757c:	0cc000ef          	jal	7648 <__swsetup_r>
    7580:	08051e63          	bnez	a0,761c <__swbuf_r+0x164>
    7584:	00c41703          	lh	a4,12(s0)
    7588:	01312623          	sw	s3,12(sp)
    758c:	01042783          	lw	a5,16(s0)
    7590:	01271693          	sll	a3,a4,0x12
    7594:	0ff4f993          	zext.b	s3,s1
    7598:	0ff4f493          	zext.b	s1,s1
    759c:	f606cce3          	bltz	a3,7514 <__swbuf_r+0x5c>
    75a0:	06442683          	lw	a3,100(s0)
    75a4:	ffffe637          	lui	a2,0xffffe
    75a8:	000025b7          	lui	a1,0x2
    75ac:	00b76733          	or	a4,a4,a1
    75b0:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    75b4:	00c6f6b3          	and	a3,a3,a2
    75b8:	00e41623          	sh	a4,12(s0)
    75bc:	00042703          	lw	a4,0(s0)
    75c0:	06d42223          	sw	a3,100(s0)
    75c4:	01442683          	lw	a3,20(s0)
    75c8:	40f707b3          	sub	a5,a4,a5
    75cc:	f4d7cce3          	blt	a5,a3,7524 <__swbuf_r+0x6c>
    75d0:	00040593          	mv	a1,s0
    75d4:	00090513          	mv	a0,s2
    75d8:	b34ff0ef          	jal	690c <_fflush_r>
    75dc:	02051e63          	bnez	a0,7618 <__swbuf_r+0x160>
    75e0:	00042703          	lw	a4,0(s0)
    75e4:	00842683          	lw	a3,8(s0)
    75e8:	00100793          	li	a5,1
    75ec:	00170613          	add	a2,a4,1
    75f0:	fff68693          	add	a3,a3,-1
    75f4:	00c42023          	sw	a2,0(s0)
    75f8:	00d42423          	sw	a3,8(s0)
    75fc:	01370023          	sb	s3,0(a4)
    7600:	01442703          	lw	a4,20(s0)
    7604:	f4f712e3          	bne	a4,a5,7548 <__swbuf_r+0x90>
    7608:	00040593          	mv	a1,s0
    760c:	00090513          	mv	a0,s2
    7610:	afcff0ef          	jal	690c <_fflush_r>
    7614:	f40500e3          	beqz	a0,7554 <__swbuf_r+0x9c>
    7618:	00c12983          	lw	s3,12(sp)
    761c:	fff00493          	li	s1,-1
    7620:	f39ff06f          	j	7558 <__swbuf_r+0xa0>
    7624:	00a00793          	li	a5,10
    7628:	f2f496e3          	bne	s1,a5,7554 <__swbuf_r+0x9c>
    762c:	00040593          	mv	a1,s0
    7630:	00090513          	mv	a0,s2
    7634:	ad8ff0ef          	jal	690c <_fflush_r>
    7638:	f0050ee3          	beqz	a0,7554 <__swbuf_r+0x9c>
    763c:	fddff06f          	j	7618 <__swbuf_r+0x160>
    7640:	dc8ff0ef          	jal	6c08 <__sinit>
    7644:	ea1ff06f          	j	74e4 <__swbuf_r+0x2c>

00007648 <__swsetup_r>:
    7648:	ff010113          	add	sp,sp,-16
    764c:	00812423          	sw	s0,8(sp)
    7650:	00912223          	sw	s1,4(sp)
    7654:	00112623          	sw	ra,12(sp)
    7658:	7fff9797          	auipc	a5,0x7fff9
    765c:	0b07a783          	lw	a5,176(a5) # 80000708 <_impure_ptr>
    7660:	00050493          	mv	s1,a0
    7664:	00058413          	mv	s0,a1
    7668:	00078663          	beqz	a5,7674 <__swsetup_r+0x2c>
    766c:	0347a703          	lw	a4,52(a5)
    7670:	0e070c63          	beqz	a4,7768 <__swsetup_r+0x120>
    7674:	00c41783          	lh	a5,12(s0)
    7678:	0087f713          	and	a4,a5,8
    767c:	06070a63          	beqz	a4,76f0 <__swsetup_r+0xa8>
    7680:	01042703          	lw	a4,16(s0)
    7684:	08070663          	beqz	a4,7710 <__swsetup_r+0xc8>
    7688:	0017f693          	and	a3,a5,1
    768c:	02068863          	beqz	a3,76bc <__swsetup_r+0x74>
    7690:	01442683          	lw	a3,20(s0)
    7694:	00042423          	sw	zero,8(s0)
    7698:	00000513          	li	a0,0
    769c:	40d006b3          	neg	a3,a3
    76a0:	00d42c23          	sw	a3,24(s0)
    76a4:	02070a63          	beqz	a4,76d8 <__swsetup_r+0x90>
    76a8:	00c12083          	lw	ra,12(sp)
    76ac:	00812403          	lw	s0,8(sp)
    76b0:	00412483          	lw	s1,4(sp)
    76b4:	01010113          	add	sp,sp,16
    76b8:	00008067          	ret
    76bc:	0027f693          	and	a3,a5,2
    76c0:	00000613          	li	a2,0
    76c4:	00069463          	bnez	a3,76cc <__swsetup_r+0x84>
    76c8:	01442603          	lw	a2,20(s0)
    76cc:	00c42423          	sw	a2,8(s0)
    76d0:	00000513          	li	a0,0
    76d4:	fc071ae3          	bnez	a4,76a8 <__swsetup_r+0x60>
    76d8:	0807f713          	and	a4,a5,128
    76dc:	fc0706e3          	beqz	a4,76a8 <__swsetup_r+0x60>
    76e0:	0407e793          	or	a5,a5,64
    76e4:	00f41623          	sh	a5,12(s0)
    76e8:	fff00513          	li	a0,-1
    76ec:	fbdff06f          	j	76a8 <__swsetup_r+0x60>
    76f0:	0107f713          	and	a4,a5,16
    76f4:	08070063          	beqz	a4,7774 <__swsetup_r+0x12c>
    76f8:	0047f713          	and	a4,a5,4
    76fc:	02071c63          	bnez	a4,7734 <__swsetup_r+0xec>
    7700:	01042703          	lw	a4,16(s0)
    7704:	0087e793          	or	a5,a5,8
    7708:	00f41623          	sh	a5,12(s0)
    770c:	f6071ee3          	bnez	a4,7688 <__swsetup_r+0x40>
    7710:	2807f693          	and	a3,a5,640
    7714:	20000613          	li	a2,512
    7718:	f6c688e3          	beq	a3,a2,7688 <__swsetup_r+0x40>
    771c:	00040593          	mv	a1,s0
    7720:	00048513          	mv	a0,s1
    7724:	6cc030ef          	jal	adf0 <__smakebuf_r>
    7728:	00c41783          	lh	a5,12(s0)
    772c:	01042703          	lw	a4,16(s0)
    7730:	f59ff06f          	j	7688 <__swsetup_r+0x40>
    7734:	03042583          	lw	a1,48(s0)
    7738:	00058e63          	beqz	a1,7754 <__swsetup_r+0x10c>
    773c:	04040713          	add	a4,s0,64
    7740:	00e58863          	beq	a1,a4,7750 <__swsetup_r+0x108>
    7744:	00048513          	mv	a0,s1
    7748:	cf1f90ef          	jal	1438 <_free_r>
    774c:	00c41783          	lh	a5,12(s0)
    7750:	02042823          	sw	zero,48(s0)
    7754:	01042703          	lw	a4,16(s0)
    7758:	fdb7f793          	and	a5,a5,-37
    775c:	00042223          	sw	zero,4(s0)
    7760:	00e42023          	sw	a4,0(s0)
    7764:	fa1ff06f          	j	7704 <__swsetup_r+0xbc>
    7768:	00078513          	mv	a0,a5
    776c:	c9cff0ef          	jal	6c08 <__sinit>
    7770:	f05ff06f          	j	7674 <__swsetup_r+0x2c>
    7774:	00900713          	li	a4,9
    7778:	00e4a023          	sw	a4,0(s1)
    777c:	0407e793          	or	a5,a5,64
    7780:	00f41623          	sh	a5,12(s0)
    7784:	fff00513          	li	a0,-1
    7788:	f21ff06f          	j	76a8 <__swsetup_r+0x60>

0000778c <__fputwc>:
    778c:	fc010113          	add	sp,sp,-64
    7790:	02812c23          	sw	s0,56(sp)
    7794:	03412423          	sw	s4,40(sp)
    7798:	03512223          	sw	s5,36(sp)
    779c:	02112e23          	sw	ra,60(sp)
    77a0:	02912a23          	sw	s1,52(sp)
    77a4:	03312623          	sw	s3,44(sp)
    77a8:	00050a13          	mv	s4,a0
    77ac:	00058a93          	mv	s5,a1
    77b0:	00060413          	mv	s0,a2
    77b4:	374000ef          	jal	7b28 <__locale_mb_cur_max>
    77b8:	00100793          	li	a5,1
    77bc:	02f51663          	bne	a0,a5,77e8 <__fputwc+0x5c>
    77c0:	fffa8793          	add	a5,s5,-1
    77c4:	0fe00713          	li	a4,254
    77c8:	02f76063          	bltu	a4,a5,77e8 <__fputwc+0x5c>
    77cc:	03212823          	sw	s2,48(sp)
    77d0:	03612023          	sw	s6,32(sp)
    77d4:	01712e23          	sw	s7,28(sp)
    77d8:	01510423          	sb	s5,8(sp)
    77dc:	00100993          	li	s3,1
    77e0:	00810493          	add	s1,sp,8
    77e4:	0380006f          	j	781c <__fputwc+0x90>
    77e8:	00810493          	add	s1,sp,8
    77ec:	05c40693          	add	a3,s0,92
    77f0:	000a8613          	mv	a2,s5
    77f4:	00048593          	mv	a1,s1
    77f8:	000a0513          	mv	a0,s4
    77fc:	3e8030ef          	jal	abe4 <_wcrtomb_r>
    7800:	fff00793          	li	a5,-1
    7804:	00050993          	mv	s3,a0
    7808:	0cf50a63          	beq	a0,a5,78dc <__fputwc+0x150>
    780c:	0a050663          	beqz	a0,78b8 <__fputwc+0x12c>
    7810:	03212823          	sw	s2,48(sp)
    7814:	03612023          	sw	s6,32(sp)
    7818:	01712e23          	sw	s7,28(sp)
    781c:	00000913          	li	s2,0
    7820:	fff00b13          	li	s6,-1
    7824:	00a00b93          	li	s7,10
    7828:	0200006f          	j	7848 <__fputwc+0xbc>
    782c:	00042783          	lw	a5,0(s0)
    7830:	00178693          	add	a3,a5,1
    7834:	00d42023          	sw	a3,0(s0)
    7838:	00e78023          	sb	a4,0(a5)
    783c:	00190913          	add	s2,s2,1
    7840:	00148493          	add	s1,s1,1
    7844:	07397463          	bgeu	s2,s3,78ac <__fputwc+0x120>
    7848:	00842783          	lw	a5,8(s0)
    784c:	0004c703          	lbu	a4,0(s1)
    7850:	fff78793          	add	a5,a5,-1
    7854:	00f42423          	sw	a5,8(s0)
    7858:	fc07dae3          	bgez	a5,782c <__fputwc+0xa0>
    785c:	01842683          	lw	a3,24(s0)
    7860:	00040613          	mv	a2,s0
    7864:	00070593          	mv	a1,a4
    7868:	000a0513          	mv	a0,s4
    786c:	00d7c463          	blt	a5,a3,7874 <__fputwc+0xe8>
    7870:	fb771ee3          	bne	a4,s7,782c <__fputwc+0xa0>
    7874:	c45ff0ef          	jal	74b8 <__swbuf_r>
    7878:	fd6512e3          	bne	a0,s6,783c <__fputwc+0xb0>
    787c:	03012903          	lw	s2,48(sp)
    7880:	02012b03          	lw	s6,32(sp)
    7884:	01c12b83          	lw	s7,28(sp)
    7888:	03c12083          	lw	ra,60(sp)
    788c:	03812403          	lw	s0,56(sp)
    7890:	03412483          	lw	s1,52(sp)
    7894:	02c12983          	lw	s3,44(sp)
    7898:	02812a03          	lw	s4,40(sp)
    789c:	02412a83          	lw	s5,36(sp)
    78a0:	fff00513          	li	a0,-1
    78a4:	04010113          	add	sp,sp,64
    78a8:	00008067          	ret
    78ac:	03012903          	lw	s2,48(sp)
    78b0:	02012b03          	lw	s6,32(sp)
    78b4:	01c12b83          	lw	s7,28(sp)
    78b8:	03c12083          	lw	ra,60(sp)
    78bc:	03812403          	lw	s0,56(sp)
    78c0:	03412483          	lw	s1,52(sp)
    78c4:	02c12983          	lw	s3,44(sp)
    78c8:	02812a03          	lw	s4,40(sp)
    78cc:	000a8513          	mv	a0,s5
    78d0:	02412a83          	lw	s5,36(sp)
    78d4:	04010113          	add	sp,sp,64
    78d8:	00008067          	ret
    78dc:	00c45783          	lhu	a5,12(s0)
    78e0:	0407e793          	or	a5,a5,64
    78e4:	00f41623          	sh	a5,12(s0)
    78e8:	fa1ff06f          	j	7888 <__fputwc+0xfc>

000078ec <_fputwc_r>:
    78ec:	06462783          	lw	a5,100(a2)
    78f0:	fe010113          	add	sp,sp,-32
    78f4:	00812c23          	sw	s0,24(sp)
    78f8:	00912a23          	sw	s1,20(sp)
    78fc:	0017f713          	and	a4,a5,1
    7900:	00112e23          	sw	ra,28(sp)
    7904:	00c61783          	lh	a5,12(a2)
    7908:	00060413          	mv	s0,a2
    790c:	00050493          	mv	s1,a0
    7910:	00071663          	bnez	a4,791c <_fputwc_r+0x30>
    7914:	2007f713          	and	a4,a5,512
    7918:	08070463          	beqz	a4,79a0 <_fputwc_r+0xb4>
    791c:	01279713          	sll	a4,a5,0x12
    7920:	02074063          	bltz	a4,7940 <_fputwc_r+0x54>
    7924:	06442703          	lw	a4,100(s0)
    7928:	000026b7          	lui	a3,0x2
    792c:	00d7e7b3          	or	a5,a5,a3
    7930:	000026b7          	lui	a3,0x2
    7934:	00d76733          	or	a4,a4,a3
    7938:	00f41623          	sh	a5,12(s0)
    793c:	06e42223          	sw	a4,100(s0)
    7940:	00048513          	mv	a0,s1
    7944:	00040613          	mv	a2,s0
    7948:	e45ff0ef          	jal	778c <__fputwc>
    794c:	06442783          	lw	a5,100(s0)
    7950:	00050493          	mv	s1,a0
    7954:	0017f793          	and	a5,a5,1
    7958:	00079863          	bnez	a5,7968 <_fputwc_r+0x7c>
    795c:	00c45783          	lhu	a5,12(s0)
    7960:	2007f793          	and	a5,a5,512
    7964:	00078e63          	beqz	a5,7980 <_fputwc_r+0x94>
    7968:	01c12083          	lw	ra,28(sp)
    796c:	01812403          	lw	s0,24(sp)
    7970:	00048513          	mv	a0,s1
    7974:	01412483          	lw	s1,20(sp)
    7978:	02010113          	add	sp,sp,32
    797c:	00008067          	ret
    7980:	05842503          	lw	a0,88(s0)
    7984:	e60f90ef          	jal	fe4 <__retarget_lock_release_recursive>
    7988:	01c12083          	lw	ra,28(sp)
    798c:	01812403          	lw	s0,24(sp)
    7990:	00048513          	mv	a0,s1
    7994:	01412483          	lw	s1,20(sp)
    7998:	02010113          	add	sp,sp,32
    799c:	00008067          	ret
    79a0:	05862503          	lw	a0,88(a2)
    79a4:	00b12623          	sw	a1,12(sp)
    79a8:	e38f90ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    79ac:	00c41783          	lh	a5,12(s0)
    79b0:	00c12583          	lw	a1,12(sp)
    79b4:	f69ff06f          	j	791c <_fputwc_r+0x30>

000079b8 <memchr>:
    79b8:	00357793          	and	a5,a0,3
    79bc:	0ff5f693          	zext.b	a3,a1
    79c0:	02078a63          	beqz	a5,79f4 <memchr+0x3c>
    79c4:	fff60793          	add	a5,a2,-1
    79c8:	02060e63          	beqz	a2,7a04 <memchr+0x4c>
    79cc:	fff00613          	li	a2,-1
    79d0:	0180006f          	j	79e8 <memchr+0x30>
    79d4:	00150513          	add	a0,a0,1
    79d8:	00357713          	and	a4,a0,3
    79dc:	00070e63          	beqz	a4,79f8 <memchr+0x40>
    79e0:	fff78793          	add	a5,a5,-1
    79e4:	02c78063          	beq	a5,a2,7a04 <memchr+0x4c>
    79e8:	00054703          	lbu	a4,0(a0)
    79ec:	fed714e3          	bne	a4,a3,79d4 <memchr+0x1c>
    79f0:	00008067          	ret
    79f4:	00060793          	mv	a5,a2
    79f8:	00300713          	li	a4,3
    79fc:	00f76863          	bltu	a4,a5,7a0c <memchr+0x54>
    7a00:	06079063          	bnez	a5,7a60 <memchr+0xa8>
    7a04:	00000513          	li	a0,0
    7a08:	00008067          	ret
    7a0c:	0ff5f593          	zext.b	a1,a1
    7a10:	00859713          	sll	a4,a1,0x8
    7a14:	00b705b3          	add	a1,a4,a1
    7a18:	01059713          	sll	a4,a1,0x10
    7a1c:	feff08b7          	lui	a7,0xfeff0
    7a20:	80808837          	lui	a6,0x80808
    7a24:	00e585b3          	add	a1,a1,a4
    7a28:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7a2c:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7a30:	00300313          	li	t1,3
    7a34:	0100006f          	j	7a44 <memchr+0x8c>
    7a38:	ffc78793          	add	a5,a5,-4
    7a3c:	00450513          	add	a0,a0,4
    7a40:	fcf370e3          	bgeu	t1,a5,7a00 <memchr+0x48>
    7a44:	00052703          	lw	a4,0(a0)
    7a48:	00e5c733          	xor	a4,a1,a4
    7a4c:	01170633          	add	a2,a4,a7
    7a50:	fff74713          	not	a4,a4
    7a54:	00e67733          	and	a4,a2,a4
    7a58:	01077733          	and	a4,a4,a6
    7a5c:	fc070ee3          	beqz	a4,7a38 <memchr+0x80>
    7a60:	00f507b3          	add	a5,a0,a5
    7a64:	00c0006f          	j	7a70 <memchr+0xb8>
    7a68:	00150513          	add	a0,a0,1
    7a6c:	f8f50ce3          	beq	a0,a5,7a04 <memchr+0x4c>
    7a70:	00054703          	lbu	a4,0(a0)
    7a74:	fed71ae3          	bne	a4,a3,7a68 <memchr+0xb0>
    7a78:	00008067          	ret

00007a7c <strncpy>:
    7a7c:	00a5e7b3          	or	a5,a1,a0
    7a80:	0037f793          	and	a5,a5,3
    7a84:	00079663          	bnez	a5,7a90 <strncpy+0x14>
    7a88:	00300793          	li	a5,3
    7a8c:	04c7e663          	bltu	a5,a2,7ad8 <strncpy+0x5c>
    7a90:	00050713          	mv	a4,a0
    7a94:	01c0006f          	j	7ab0 <strncpy+0x34>
    7a98:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0xc3>
    7a9c:	fff60813          	add	a6,a2,-1
    7aa0:	fed78fa3          	sb	a3,-1(a5)
    7aa4:	00068e63          	beqz	a3,7ac0 <strncpy+0x44>
    7aa8:	00078713          	mv	a4,a5
    7aac:	00080613          	mv	a2,a6
    7ab0:	00158593          	add	a1,a1,1
    7ab4:	00170793          	add	a5,a4,1
    7ab8:	fe0610e3          	bnez	a2,7a98 <strncpy+0x1c>
    7abc:	00008067          	ret
    7ac0:	00c70733          	add	a4,a4,a2
    7ac4:	06080063          	beqz	a6,7b24 <strncpy+0xa8>
    7ac8:	00178793          	add	a5,a5,1
    7acc:	fe078fa3          	sb	zero,-1(a5)
    7ad0:	fee79ce3          	bne	a5,a4,7ac8 <strncpy+0x4c>
    7ad4:	00008067          	ret
    7ad8:	feff0337          	lui	t1,0xfeff0
    7adc:	808088b7          	lui	a7,0x80808
    7ae0:	00050713          	mv	a4,a0
    7ae4:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7ae8:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7aec:	00300e13          	li	t3,3
    7af0:	0180006f          	j	7b08 <strncpy+0x8c>
    7af4:	00d72023          	sw	a3,0(a4)
    7af8:	ffc60613          	add	a2,a2,-4
    7afc:	00470713          	add	a4,a4,4
    7b00:	00458593          	add	a1,a1,4
    7b04:	face76e3          	bgeu	t3,a2,7ab0 <strncpy+0x34>
    7b08:	0005a683          	lw	a3,0(a1)
    7b0c:	006687b3          	add	a5,a3,t1
    7b10:	fff6c813          	not	a6,a3
    7b14:	0107f7b3          	and	a5,a5,a6
    7b18:	0117f7b3          	and	a5,a5,a7
    7b1c:	fc078ce3          	beqz	a5,7af4 <strncpy+0x78>
    7b20:	f91ff06f          	j	7ab0 <strncpy+0x34>
    7b24:	00008067          	ret

00007b28 <__locale_mb_cur_max>:
    7b28:	7fff9517          	auipc	a0,0x7fff9
    7b2c:	b3454503          	lbu	a0,-1228(a0) # 8000065c <__global_locale+0x128>
    7b30:	00008067          	ret

00007b34 <_localeconv_r>:
    7b34:	7fff9517          	auipc	a0,0x7fff9
    7b38:	af050513          	add	a0,a0,-1296 # 80000624 <__global_locale+0xf0>
    7b3c:	00008067          	ret

00007b40 <_close_r>:
    7b40:	ff010113          	add	sp,sp,-16
    7b44:	00812423          	sw	s0,8(sp)
    7b48:	00050413          	mv	s0,a0
    7b4c:	00058513          	mv	a0,a1
    7b50:	7fff9797          	auipc	a5,0x7fff9
    7b54:	bc07a423          	sw	zero,-1080(a5) # 80000718 <errno>
    7b58:	00112623          	sw	ra,12(sp)
    7b5c:	85cf90ef          	jal	bb8 <_close>
    7b60:	fff00793          	li	a5,-1
    7b64:	00f50a63          	beq	a0,a5,7b78 <_close_r+0x38>
    7b68:	00c12083          	lw	ra,12(sp)
    7b6c:	00812403          	lw	s0,8(sp)
    7b70:	01010113          	add	sp,sp,16
    7b74:	00008067          	ret
    7b78:	7fff9797          	auipc	a5,0x7fff9
    7b7c:	ba07a783          	lw	a5,-1120(a5) # 80000718 <errno>
    7b80:	fe0784e3          	beqz	a5,7b68 <_close_r+0x28>
    7b84:	00c12083          	lw	ra,12(sp)
    7b88:	00f42023          	sw	a5,0(s0)
    7b8c:	00812403          	lw	s0,8(sp)
    7b90:	01010113          	add	sp,sp,16
    7b94:	00008067          	ret

00007b98 <_lseek_r>:
    7b98:	ff010113          	add	sp,sp,-16
    7b9c:	00058713          	mv	a4,a1
    7ba0:	00812423          	sw	s0,8(sp)
    7ba4:	00060593          	mv	a1,a2
    7ba8:	00050413          	mv	s0,a0
    7bac:	00068613          	mv	a2,a3
    7bb0:	00070513          	mv	a0,a4
    7bb4:	7fff9797          	auipc	a5,0x7fff9
    7bb8:	b607a223          	sw	zero,-1180(a5) # 80000718 <errno>
    7bbc:	00112623          	sw	ra,12(sp)
    7bc0:	834f90ef          	jal	bf4 <_lseek>
    7bc4:	fff00793          	li	a5,-1
    7bc8:	00f50a63          	beq	a0,a5,7bdc <_lseek_r+0x44>
    7bcc:	00c12083          	lw	ra,12(sp)
    7bd0:	00812403          	lw	s0,8(sp)
    7bd4:	01010113          	add	sp,sp,16
    7bd8:	00008067          	ret
    7bdc:	7fff9797          	auipc	a5,0x7fff9
    7be0:	b3c7a783          	lw	a5,-1220(a5) # 80000718 <errno>
    7be4:	fe0784e3          	beqz	a5,7bcc <_lseek_r+0x34>
    7be8:	00c12083          	lw	ra,12(sp)
    7bec:	00f42023          	sw	a5,0(s0)
    7bf0:	00812403          	lw	s0,8(sp)
    7bf4:	01010113          	add	sp,sp,16
    7bf8:	00008067          	ret

00007bfc <_read_r>:
    7bfc:	ff010113          	add	sp,sp,-16
    7c00:	00058713          	mv	a4,a1
    7c04:	00812423          	sw	s0,8(sp)
    7c08:	00060593          	mv	a1,a2
    7c0c:	00050413          	mv	s0,a0
    7c10:	00068613          	mv	a2,a3
    7c14:	00070513          	mv	a0,a4
    7c18:	7fff9797          	auipc	a5,0x7fff9
    7c1c:	b007a023          	sw	zero,-1280(a5) # 80000718 <errno>
    7c20:	00112623          	sw	ra,12(sp)
    7c24:	fd9f80ef          	jal	bfc <_read>
    7c28:	fff00793          	li	a5,-1
    7c2c:	00f50a63          	beq	a0,a5,7c40 <_read_r+0x44>
    7c30:	00c12083          	lw	ra,12(sp)
    7c34:	00812403          	lw	s0,8(sp)
    7c38:	01010113          	add	sp,sp,16
    7c3c:	00008067          	ret
    7c40:	7fff9797          	auipc	a5,0x7fff9
    7c44:	ad87a783          	lw	a5,-1320(a5) # 80000718 <errno>
    7c48:	fe0784e3          	beqz	a5,7c30 <_read_r+0x34>
    7c4c:	00c12083          	lw	ra,12(sp)
    7c50:	00f42023          	sw	a5,0(s0)
    7c54:	00812403          	lw	s0,8(sp)
    7c58:	01010113          	add	sp,sp,16
    7c5c:	00008067          	ret

00007c60 <_sbrk_r>:
    7c60:	ff010113          	add	sp,sp,-16
    7c64:	00812423          	sw	s0,8(sp)
    7c68:	00050413          	mv	s0,a0
    7c6c:	00058513          	mv	a0,a1
    7c70:	7fff9797          	auipc	a5,0x7fff9
    7c74:	aa07a423          	sw	zero,-1368(a5) # 80000718 <errno>
    7c78:	00112623          	sw	ra,12(sp)
    7c7c:	900f90ef          	jal	d7c <_sbrk>
    7c80:	fff00793          	li	a5,-1
    7c84:	00f50a63          	beq	a0,a5,7c98 <_sbrk_r+0x38>
    7c88:	00c12083          	lw	ra,12(sp)
    7c8c:	00812403          	lw	s0,8(sp)
    7c90:	01010113          	add	sp,sp,16
    7c94:	00008067          	ret
    7c98:	7fff9797          	auipc	a5,0x7fff9
    7c9c:	a807a783          	lw	a5,-1408(a5) # 80000718 <errno>
    7ca0:	fe0784e3          	beqz	a5,7c88 <_sbrk_r+0x28>
    7ca4:	00c12083          	lw	ra,12(sp)
    7ca8:	00f42023          	sw	a5,0(s0)
    7cac:	00812403          	lw	s0,8(sp)
    7cb0:	01010113          	add	sp,sp,16
    7cb4:	00008067          	ret

00007cb8 <_write_r>:
    7cb8:	ff010113          	add	sp,sp,-16
    7cbc:	00058713          	mv	a4,a1
    7cc0:	00812423          	sw	s0,8(sp)
    7cc4:	00060593          	mv	a1,a2
    7cc8:	00050413          	mv	s0,a0
    7ccc:	00068613          	mv	a2,a3
    7cd0:	00070513          	mv	a0,a4
    7cd4:	7fff9797          	auipc	a5,0x7fff9
    7cd8:	a407a223          	sw	zero,-1468(a5) # 80000718 <errno>
    7cdc:	00112623          	sw	ra,12(sp)
    7ce0:	ff9f80ef          	jal	cd8 <_write>
    7ce4:	fff00793          	li	a5,-1
    7ce8:	00f50a63          	beq	a0,a5,7cfc <_write_r+0x44>
    7cec:	00c12083          	lw	ra,12(sp)
    7cf0:	00812403          	lw	s0,8(sp)
    7cf4:	01010113          	add	sp,sp,16
    7cf8:	00008067          	ret
    7cfc:	7fff9797          	auipc	a5,0x7fff9
    7d00:	a1c7a783          	lw	a5,-1508(a5) # 80000718 <errno>
    7d04:	fe0784e3          	beqz	a5,7cec <_write_r+0x34>
    7d08:	00c12083          	lw	ra,12(sp)
    7d0c:	00f42023          	sw	a5,0(s0)
    7d10:	00812403          	lw	s0,8(sp)
    7d14:	01010113          	add	sp,sp,16
    7d18:	00008067          	ret

00007d1c <memmove>:
    7d1c:	02a5f663          	bgeu	a1,a0,7d48 <memmove+0x2c>
    7d20:	00c58733          	add	a4,a1,a2
    7d24:	02e57263          	bgeu	a0,a4,7d48 <memmove+0x2c>
    7d28:	00c507b3          	add	a5,a0,a2
    7d2c:	04060663          	beqz	a2,7d78 <memmove+0x5c>
    7d30:	fff74683          	lbu	a3,-1(a4)
    7d34:	fff78793          	add	a5,a5,-1
    7d38:	fff70713          	add	a4,a4,-1
    7d3c:	00d78023          	sb	a3,0(a5)
    7d40:	fef518e3          	bne	a0,a5,7d30 <memmove+0x14>
    7d44:	00008067          	ret
    7d48:	00f00793          	li	a5,15
    7d4c:	02c7e863          	bltu	a5,a2,7d7c <memmove+0x60>
    7d50:	00050793          	mv	a5,a0
    7d54:	fff60693          	add	a3,a2,-1
    7d58:	0c060263          	beqz	a2,7e1c <memmove+0x100>
    7d5c:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0xc5>
    7d60:	00d786b3          	add	a3,a5,a3
    7d64:	0005c703          	lbu	a4,0(a1)
    7d68:	00178793          	add	a5,a5,1
    7d6c:	00158593          	add	a1,a1,1
    7d70:	fee78fa3          	sb	a4,-1(a5)
    7d74:	fed798e3          	bne	a5,a3,7d64 <memmove+0x48>
    7d78:	00008067          	ret
    7d7c:	00b567b3          	or	a5,a0,a1
    7d80:	0037f793          	and	a5,a5,3
    7d84:	08079663          	bnez	a5,7e10 <memmove+0xf4>
    7d88:	ff060893          	add	a7,a2,-16
    7d8c:	ff08f893          	and	a7,a7,-16
    7d90:	01088893          	add	a7,a7,16
    7d94:	011506b3          	add	a3,a0,a7
    7d98:	00058713          	mv	a4,a1
    7d9c:	00050793          	mv	a5,a0
    7da0:	00072803          	lw	a6,0(a4)
    7da4:	01070713          	add	a4,a4,16
    7da8:	01078793          	add	a5,a5,16
    7dac:	ff07a823          	sw	a6,-16(a5)
    7db0:	ff472803          	lw	a6,-12(a4)
    7db4:	ff07aa23          	sw	a6,-12(a5)
    7db8:	ff872803          	lw	a6,-8(a4)
    7dbc:	ff07ac23          	sw	a6,-8(a5)
    7dc0:	ffc72803          	lw	a6,-4(a4)
    7dc4:	ff07ae23          	sw	a6,-4(a5)
    7dc8:	fcd79ce3          	bne	a5,a3,7da0 <memmove+0x84>
    7dcc:	00c67813          	and	a6,a2,12
    7dd0:	011585b3          	add	a1,a1,a7
    7dd4:	00f67713          	and	a4,a2,15
    7dd8:	04080463          	beqz	a6,7e20 <memmove+0x104>
    7ddc:	ffc70813          	add	a6,a4,-4
    7de0:	ffc87813          	and	a6,a6,-4
    7de4:	00480813          	add	a6,a6,4
    7de8:	010687b3          	add	a5,a3,a6
    7dec:	00058713          	mv	a4,a1
    7df0:	00072883          	lw	a7,0(a4)
    7df4:	00468693          	add	a3,a3,4
    7df8:	00470713          	add	a4,a4,4
    7dfc:	ff16ae23          	sw	a7,-4(a3)
    7e00:	fef698e3          	bne	a3,a5,7df0 <memmove+0xd4>
    7e04:	00367613          	and	a2,a2,3
    7e08:	010585b3          	add	a1,a1,a6
    7e0c:	f49ff06f          	j	7d54 <memmove+0x38>
    7e10:	fff60693          	add	a3,a2,-1
    7e14:	00050793          	mv	a5,a0
    7e18:	f45ff06f          	j	7d5c <memmove+0x40>
    7e1c:	00008067          	ret
    7e20:	00070613          	mv	a2,a4
    7e24:	f31ff06f          	j	7d54 <memmove+0x38>

00007e28 <frexp>:
    7e28:	ff010113          	add	sp,sp,-16
    7e2c:	00912223          	sw	s1,4(sp)
    7e30:	800004b7          	lui	s1,0x80000
    7e34:	00812423          	sw	s0,8(sp)
    7e38:	00112623          	sw	ra,12(sp)
    7e3c:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7e40:	00060413          	mv	s0,a2
    7e44:	00062023          	sw	zero,0(a2)
    7e48:	00b4f6b3          	and	a3,s1,a1
    7e4c:	7ff00637          	lui	a2,0x7ff00
    7e50:	00058793          	mv	a5,a1
    7e54:	00050713          	mv	a4,a0
    7e58:	04c6f063          	bgeu	a3,a2,7e98 <frexp+0x70>
    7e5c:	00a6e633          	or	a2,a3,a0
    7e60:	02060c63          	beqz	a2,7e98 <frexp+0x70>
    7e64:	0145d613          	srl	a2,a1,0x14
    7e68:	7ff67613          	and	a2,a2,2047
    7e6c:	04060463          	beqz	a2,7eb4 <frexp+0x8c>
    7e70:	00000593          	li	a1,0
    7e74:	80100637          	lui	a2,0x80100
    7e78:	4146d693          	sra	a3,a3,0x14
    7e7c:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7e80:	c0268693          	add	a3,a3,-1022
    7e84:	00c7f7b3          	and	a5,a5,a2
    7e88:	00b686b3          	add	a3,a3,a1
    7e8c:	3fe00637          	lui	a2,0x3fe00
    7e90:	00c7e7b3          	or	a5,a5,a2
    7e94:	00d42023          	sw	a3,0(s0)
    7e98:	00c12083          	lw	ra,12(sp)
    7e9c:	00812403          	lw	s0,8(sp)
    7ea0:	00412483          	lw	s1,4(sp)
    7ea4:	00070513          	mv	a0,a4
    7ea8:	00078593          	mv	a1,a5
    7eac:	01010113          	add	sp,sp,16
    7eb0:	00008067          	ret
    7eb4:	7fff9797          	auipc	a5,0x7fff9
    7eb8:	80c78793          	add	a5,a5,-2036 # 800006c0 <__global_locale+0x18c>
    7ebc:	0047a683          	lw	a3,4(a5)
    7ec0:	0007a603          	lw	a2,0(a5)
    7ec4:	009050ef          	jal	d6cc <__muldf3>
    7ec8:	00058793          	mv	a5,a1
    7ecc:	00b4f6b3          	and	a3,s1,a1
    7ed0:	00050713          	mv	a4,a0
    7ed4:	fca00593          	li	a1,-54
    7ed8:	f9dff06f          	j	7e74 <frexp+0x4c>

00007edc <quorem>:
    7edc:	fb010113          	add	sp,sp,-80
    7ee0:	04912223          	sw	s1,68(sp)
    7ee4:	01052783          	lw	a5,16(a0)
    7ee8:	0105a483          	lw	s1,16(a1)
    7eec:	04112623          	sw	ra,76(sp)
    7ef0:	00b12423          	sw	a1,8(sp)
    7ef4:	2097ca63          	blt	a5,s1,8108 <quorem+0x22c>
    7ef8:	fff48493          	add	s1,s1,-1
    7efc:	03512a23          	sw	s5,52(sp)
    7f00:	03812423          	sw	s8,40(sp)
    7f04:	00249a93          	sll	s5,s1,0x2
    7f08:	01458c13          	add	s8,a1,20
    7f0c:	05212023          	sw	s2,64(sp)
    7f10:	03312e23          	sw	s3,60(sp)
    7f14:	015c0933          	add	s2,s8,s5
    7f18:	01450993          	add	s3,a0,20
    7f1c:	015987b3          	add	a5,s3,s5
    7f20:	03712623          	sw	s7,44(sp)
    7f24:	00092b83          	lw	s7,0(s2)
    7f28:	03912223          	sw	s9,36(sp)
    7f2c:	0007ac83          	lw	s9,0(a5)
    7f30:	001b8b93          	add	s7,s7,1
    7f34:	03412c23          	sw	s4,56(sp)
    7f38:	000b8593          	mv	a1,s7
    7f3c:	00050a13          	mv	s4,a0
    7f40:	000c8513          	mv	a0,s9
    7f44:	04812423          	sw	s0,72(sp)
    7f48:	00f12623          	sw	a5,12(sp)
    7f4c:	70d060ef          	jal	ee58 <__hidden___udivsi3>
    7f50:	00050413          	mv	s0,a0
    7f54:	0d7cee63          	bltu	s9,s7,8030 <quorem+0x154>
    7f58:	03a12023          	sw	s10,32(sp)
    7f5c:	00010d37          	lui	s10,0x10
    7f60:	01b12e23          	sw	s11,28(sp)
    7f64:	03612823          	sw	s6,48(sp)
    7f68:	000c0a93          	mv	s5,s8
    7f6c:	00098d93          	mv	s11,s3
    7f70:	00000c93          	li	s9,0
    7f74:	00000b93          	li	s7,0
    7f78:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    7f7c:	000aab03          	lw	s6,0(s5)
    7f80:	00040593          	mv	a1,s0
    7f84:	004d8d93          	add	s11,s11,4
    7f88:	01ab7533          	and	a0,s6,s10
    7f8c:	609060ef          	jal	ed94 <__mulsi3>
    7f90:	00050793          	mv	a5,a0
    7f94:	00040593          	mv	a1,s0
    7f98:	010b5513          	srl	a0,s6,0x10
    7f9c:	01978cb3          	add	s9,a5,s9
    7fa0:	5f5060ef          	jal	ed94 <__mulsi3>
    7fa4:	ffcda603          	lw	a2,-4(s11)
    7fa8:	01acf733          	and	a4,s9,s10
    7fac:	010cdc93          	srl	s9,s9,0x10
    7fb0:	01a677b3          	and	a5,a2,s10
    7fb4:	40e787b3          	sub	a5,a5,a4
    7fb8:	017787b3          	add	a5,a5,s7
    7fbc:	01950533          	add	a0,a0,s9
    7fc0:	4107d713          	sra	a4,a5,0x10
    7fc4:	01a575b3          	and	a1,a0,s10
    7fc8:	01065613          	srl	a2,a2,0x10
    7fcc:	40b70733          	sub	a4,a4,a1
    7fd0:	00c70733          	add	a4,a4,a2
    7fd4:	01a7f7b3          	and	a5,a5,s10
    7fd8:	01071613          	sll	a2,a4,0x10
    7fdc:	00c7e7b3          	or	a5,a5,a2
    7fe0:	004a8a93          	add	s5,s5,4
    7fe4:	fefdae23          	sw	a5,-4(s11)
    7fe8:	01055c93          	srl	s9,a0,0x10
    7fec:	41075b93          	sra	s7,a4,0x10
    7ff0:	f95976e3          	bgeu	s2,s5,7f7c <quorem+0xa0>
    7ff4:	00c12703          	lw	a4,12(sp)
    7ff8:	00072783          	lw	a5,0(a4)
    7ffc:	12079063          	bnez	a5,811c <quorem+0x240>
    8000:	ffc70a93          	add	s5,a4,-4
    8004:	0159e863          	bltu	s3,s5,8014 <quorem+0x138>
    8008:	0180006f          	j	8020 <quorem+0x144>
    800c:	fff48493          	add	s1,s1,-1
    8010:	0159f863          	bgeu	s3,s5,8020 <quorem+0x144>
    8014:	000aa783          	lw	a5,0(s5)
    8018:	ffca8a93          	add	s5,s5,-4
    801c:	fe0788e3          	beqz	a5,800c <quorem+0x130>
    8020:	03012b03          	lw	s6,48(sp)
    8024:	02012d03          	lw	s10,32(sp)
    8028:	01c12d83          	lw	s11,28(sp)
    802c:	009a2823          	sw	s1,16(s4)
    8030:	00812583          	lw	a1,8(sp)
    8034:	000a0513          	mv	a0,s4
    8038:	1fc020ef          	jal	a234 <__mcmp>
    803c:	08054c63          	bltz	a0,80d4 <quorem+0x1f8>
    8040:	00010537          	lui	a0,0x10
    8044:	00098593          	mv	a1,s3
    8048:	00000713          	li	a4,0
    804c:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    8050:	0005a683          	lw	a3,0(a1)
    8054:	000c2603          	lw	a2,0(s8)
    8058:	00458593          	add	a1,a1,4
    805c:	00a6f7b3          	and	a5,a3,a0
    8060:	00a67833          	and	a6,a2,a0
    8064:	410787b3          	sub	a5,a5,a6
    8068:	00e787b3          	add	a5,a5,a4
    806c:	4107d713          	sra	a4,a5,0x10
    8070:	01065613          	srl	a2,a2,0x10
    8074:	0106d693          	srl	a3,a3,0x10
    8078:	40c70733          	sub	a4,a4,a2
    807c:	00d70733          	add	a4,a4,a3
    8080:	01071693          	sll	a3,a4,0x10
    8084:	00a7f7b3          	and	a5,a5,a0
    8088:	00d7e7b3          	or	a5,a5,a3
    808c:	004c0c13          	add	s8,s8,4
    8090:	fef5ae23          	sw	a5,-4(a1)
    8094:	41075713          	sra	a4,a4,0x10
    8098:	fb897ce3          	bgeu	s2,s8,8050 <quorem+0x174>
    809c:	00249793          	sll	a5,s1,0x2
    80a0:	00f987b3          	add	a5,s3,a5
    80a4:	0007a703          	lw	a4,0(a5)
    80a8:	02071463          	bnez	a4,80d0 <quorem+0x1f4>
    80ac:	ffc78793          	add	a5,a5,-4
    80b0:	00f9e863          	bltu	s3,a5,80c0 <quorem+0x1e4>
    80b4:	0180006f          	j	80cc <quorem+0x1f0>
    80b8:	fff48493          	add	s1,s1,-1
    80bc:	00f9f863          	bgeu	s3,a5,80cc <quorem+0x1f0>
    80c0:	0007a703          	lw	a4,0(a5)
    80c4:	ffc78793          	add	a5,a5,-4
    80c8:	fe0708e3          	beqz	a4,80b8 <quorem+0x1dc>
    80cc:	009a2823          	sw	s1,16(s4)
    80d0:	00140413          	add	s0,s0,1
    80d4:	04c12083          	lw	ra,76(sp)
    80d8:	00040513          	mv	a0,s0
    80dc:	04812403          	lw	s0,72(sp)
    80e0:	04012903          	lw	s2,64(sp)
    80e4:	03c12983          	lw	s3,60(sp)
    80e8:	03812a03          	lw	s4,56(sp)
    80ec:	03412a83          	lw	s5,52(sp)
    80f0:	02c12b83          	lw	s7,44(sp)
    80f4:	02812c03          	lw	s8,40(sp)
    80f8:	02412c83          	lw	s9,36(sp)
    80fc:	04412483          	lw	s1,68(sp)
    8100:	05010113          	add	sp,sp,80
    8104:	00008067          	ret
    8108:	04c12083          	lw	ra,76(sp)
    810c:	04412483          	lw	s1,68(sp)
    8110:	00000513          	li	a0,0
    8114:	05010113          	add	sp,sp,80
    8118:	00008067          	ret
    811c:	00812583          	lw	a1,8(sp)
    8120:	000a0513          	mv	a0,s4
    8124:	03012b03          	lw	s6,48(sp)
    8128:	02012d03          	lw	s10,32(sp)
    812c:	01c12d83          	lw	s11,28(sp)
    8130:	104020ef          	jal	a234 <__mcmp>
    8134:	f00556e3          	bgez	a0,8040 <quorem+0x164>
    8138:	f9dff06f          	j	80d4 <quorem+0x1f8>

0000813c <_dtoa_r>:
    813c:	03852303          	lw	t1,56(a0)
    8140:	f5010113          	add	sp,sp,-176
    8144:	0a812423          	sw	s0,168(sp)
    8148:	0a912223          	sw	s1,164(sp)
    814c:	0b212023          	sw	s2,160(sp)
    8150:	09412c23          	sw	s4,152(sp)
    8154:	07b12e23          	sw	s11,124(sp)
    8158:	0a112623          	sw	ra,172(sp)
    815c:	09312e23          	sw	s3,156(sp)
    8160:	09512a23          	sw	s5,148(sp)
    8164:	00e12a23          	sw	a4,20(sp)
    8168:	00f12623          	sw	a5,12(sp)
    816c:	01112423          	sw	a7,8(sp)
    8170:	02b12223          	sw	a1,36(sp)
    8174:	00c12023          	sw	a2,0(sp)
    8178:	00050413          	mv	s0,a0
    817c:	00058d93          	mv	s11,a1
    8180:	00060493          	mv	s1,a2
    8184:	00068a13          	mv	s4,a3
    8188:	00080913          	mv	s2,a6
    818c:	02030263          	beqz	t1,81b0 <_dtoa_r+0x74>
    8190:	03c52703          	lw	a4,60(a0)
    8194:	00100793          	li	a5,1
    8198:	00030593          	mv	a1,t1
    819c:	00e797b3          	sll	a5,a5,a4
    81a0:	00e32223          	sw	a4,4(t1)
    81a4:	00f32423          	sw	a5,8(t1)
    81a8:	734010ef          	jal	98dc <_Bfree>
    81ac:	02042c23          	sw	zero,56(s0)
    81b0:	00048993          	mv	s3,s1
    81b4:	00000693          	li	a3,0
    81b8:	0004dc63          	bgez	s1,81d0 <_dtoa_r+0x94>
    81bc:	00149493          	sll	s1,s1,0x1
    81c0:	0014d793          	srl	a5,s1,0x1
    81c4:	00f12023          	sw	a5,0(sp)
    81c8:	00078993          	mv	s3,a5
    81cc:	00100693          	li	a3,1
    81d0:	7ff00737          	lui	a4,0x7ff00
    81d4:	00d92023          	sw	a3,0(s2)
    81d8:	00e9f6b3          	and	a3,s3,a4
    81dc:	64e68463          	beq	a3,a4,8824 <_dtoa_r+0x6e8>
    81e0:	00012483          	lw	s1,0(sp)
    81e4:	000d8513          	mv	a0,s11
    81e8:	00000613          	li	a2,0
    81ec:	00048593          	mv	a1,s1
    81f0:	00000693          	li	a3,0
    81f4:	01b12c23          	sw	s11,24(sp)
    81f8:	00912e23          	sw	s1,28(sp)
    81fc:	23c050ef          	jal	d438 <__eqdf2>
    8200:	04051c63          	bnez	a0,8258 <_dtoa_r+0x11c>
    8204:	00c12703          	lw	a4,12(sp)
    8208:	00100793          	li	a5,1
    820c:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    8210:	00812703          	lw	a4,8(sp)
    8214:	00070863          	beqz	a4,8224 <_dtoa_r+0xe8>
    8218:	00007797          	auipc	a5,0x7
    821c:	f4d78793          	add	a5,a5,-179 # f165 <__fini_array_end+0x1d9>
    8220:	00f72023          	sw	a5,0(a4)
    8224:	00007a97          	auipc	s5,0x7
    8228:	f40a8a93          	add	s5,s5,-192 # f164 <__fini_array_end+0x1d8>
    822c:	0ac12083          	lw	ra,172(sp)
    8230:	0a812403          	lw	s0,168(sp)
    8234:	0a412483          	lw	s1,164(sp)
    8238:	0a012903          	lw	s2,160(sp)
    823c:	09c12983          	lw	s3,156(sp)
    8240:	09812a03          	lw	s4,152(sp)
    8244:	07c12d83          	lw	s11,124(sp)
    8248:	000a8513          	mv	a0,s5
    824c:	09412a83          	lw	s5,148(sp)
    8250:	0b010113          	add	sp,sp,176
    8254:	00008067          	ret
    8258:	00048613          	mv	a2,s1
    825c:	06810713          	add	a4,sp,104
    8260:	06c10693          	add	a3,sp,108
    8264:	000d8593          	mv	a1,s11
    8268:	00040513          	mv	a0,s0
    826c:	09612823          	sw	s6,144(sp)
    8270:	09712623          	sw	s7,140(sp)
    8274:	09812423          	sw	s8,136(sp)
    8278:	09912223          	sw	s9,132(sp)
    827c:	09a12023          	sw	s10,128(sp)
    8280:	0149d913          	srl	s2,s3,0x14
    8284:	268020ef          	jal	a4ec <__d2b>
    8288:	00050493          	mv	s1,a0
    828c:	5c091e63          	bnez	s2,8868 <_dtoa_r+0x72c>
    8290:	06812a83          	lw	s5,104(sp)
    8294:	06c12903          	lw	s2,108(sp)
    8298:	02000793          	li	a5,32
    829c:	012a8933          	add	s2,s5,s2
    82a0:	43290713          	add	a4,s2,1074
    82a4:	36e7dae3          	bge	a5,a4,8e18 <_dtoa_r+0xcdc>
    82a8:	04000793          	li	a5,64
    82ac:	40e787b3          	sub	a5,a5,a4
    82b0:	41290513          	add	a0,s2,1042
    82b4:	00f997b3          	sll	a5,s3,a5
    82b8:	00add533          	srl	a0,s11,a0
    82bc:	00a7e533          	or	a0,a5,a0
    82c0:	634060ef          	jal	e8f4 <__floatunsidf>
    82c4:	fe1007b7          	lui	a5,0xfe100
    82c8:	00100693          	li	a3,1
    82cc:	00050713          	mv	a4,a0
    82d0:	00b787b3          	add	a5,a5,a1
    82d4:	fff90913          	add	s2,s2,-1
    82d8:	02d12c23          	sw	a3,56(sp)
    82dc:	7fff8697          	auipc	a3,0x7fff8
    82e0:	3ec68693          	add	a3,a3,1004 # 800006c8 <__global_locale+0x194>
    82e4:	0006a603          	lw	a2,0(a3)
    82e8:	0046a683          	lw	a3,4(a3)
    82ec:	00070513          	mv	a0,a4
    82f0:	00078593          	mv	a1,a5
    82f4:	369050ef          	jal	de5c <__subdf3>
    82f8:	7fff8797          	auipc	a5,0x7fff8
    82fc:	3d878793          	add	a5,a5,984 # 800006d0 <__global_locale+0x19c>
    8300:	0007a603          	lw	a2,0(a5)
    8304:	0047a683          	lw	a3,4(a5)
    8308:	3c4050ef          	jal	d6cc <__muldf3>
    830c:	7fff8797          	auipc	a5,0x7fff8
    8310:	3cc78793          	add	a5,a5,972 # 800006d8 <__global_locale+0x1a4>
    8314:	0007a603          	lw	a2,0(a5)
    8318:	0047a683          	lw	a3,4(a5)
    831c:	7a9030ef          	jal	c2c4 <__adddf3>
    8320:	00050b13          	mv	s6,a0
    8324:	00090513          	mv	a0,s2
    8328:	00058993          	mv	s3,a1
    832c:	510060ef          	jal	e83c <__floatsidf>
    8330:	7fff8797          	auipc	a5,0x7fff8
    8334:	3b078793          	add	a5,a5,944 # 800006e0 <__global_locale+0x1ac>
    8338:	0007a603          	lw	a2,0(a5)
    833c:	0047a683          	lw	a3,4(a5)
    8340:	38c050ef          	jal	d6cc <__muldf3>
    8344:	00050613          	mv	a2,a0
    8348:	00058693          	mv	a3,a1
    834c:	000b0513          	mv	a0,s6
    8350:	00098593          	mv	a1,s3
    8354:	771030ef          	jal	c2c4 <__adddf3>
    8358:	00050b93          	mv	s7,a0
    835c:	00058b13          	mv	s6,a1
    8360:	458060ef          	jal	e7b8 <__fixdfsi>
    8364:	00050993          	mv	s3,a0
    8368:	000b0593          	mv	a1,s6
    836c:	000b8513          	mv	a0,s7
    8370:	00000613          	li	a2,0
    8374:	00000693          	li	a3,0
    8378:	24c050ef          	jal	d5c4 <__ledf2>
    837c:	02055063          	bgez	a0,839c <_dtoa_r+0x260>
    8380:	00098513          	mv	a0,s3
    8384:	4b8060ef          	jal	e83c <__floatsidf>
    8388:	000b8613          	mv	a2,s7
    838c:	000b0693          	mv	a3,s6
    8390:	0a8050ef          	jal	d438 <__eqdf2>
    8394:	00a03533          	snez	a0,a0
    8398:	40a989b3          	sub	s3,s3,a0
    839c:	412a8ab3          	sub	s5,s5,s2
    83a0:	01600793          	li	a5,22
    83a4:	fffa8b13          	add	s6,s5,-1
    83a8:	2137e2e3          	bltu	a5,s3,8dac <_dtoa_r+0xc70>
    83ac:	00399713          	sll	a4,s3,0x3
    83b0:	00007797          	auipc	a5,0x7
    83b4:	45078793          	add	a5,a5,1104 # f800 <__mprec_tens>
    83b8:	00e787b3          	add	a5,a5,a4
    83bc:	0007a603          	lw	a2,0(a5)
    83c0:	0047a683          	lw	a3,4(a5)
    83c4:	01812503          	lw	a0,24(sp)
    83c8:	01c12583          	lw	a1,28(sp)
    83cc:	1f8050ef          	jal	d5c4 <__ledf2>
    83d0:	220554e3          	bgez	a0,8df8 <_dtoa_r+0xcbc>
    83d4:	fff98993          	add	s3,s3,-1
    83d8:	02012a23          	sw	zero,52(sp)
    83dc:	00012823          	sw	zero,16(sp)
    83e0:	4a0b4863          	bltz	s6,8890 <_dtoa_r+0x754>
    83e4:	4c09d063          	bgez	s3,88a4 <_dtoa_r+0x768>
    83e8:	01012783          	lw	a5,16(sp)
    83ec:	03312023          	sw	s3,32(sp)
    83f0:	413787b3          	sub	a5,a5,s3
    83f4:	00f12823          	sw	a5,16(sp)
    83f8:	413007b3          	neg	a5,s3
    83fc:	02f12823          	sw	a5,48(sp)
    8400:	00900793          	li	a5,9
    8404:	00000993          	li	s3,0
    8408:	4b47e863          	bltu	a5,s4,88b8 <_dtoa_r+0x77c>
    840c:	00500793          	li	a5,5
    8410:	2147dae3          	bge	a5,s4,8e24 <_dtoa_r+0xce8>
    8414:	ffca0a13          	add	s4,s4,-4
    8418:	00300793          	li	a5,3
    841c:	00000913          	li	s2,0
    8420:	66fa02e3          	beq	s4,a5,9284 <_dtoa_r+0x1148>
    8424:	6147dae3          	bge	a5,s4,9238 <_dtoa_r+0x10fc>
    8428:	00400793          	li	a5,4
    842c:	54fa1ae3          	bne	s4,a5,9180 <_dtoa_r+0x1044>
    8430:	00100793          	li	a5,1
    8434:	02f12423          	sw	a5,40(sp)
    8438:	01412603          	lw	a2,20(sp)
    843c:	62c05ce3          	blez	a2,9274 <_dtoa_r+0x1138>
    8440:	02c12e23          	sw	a2,60(sp)
    8444:	00060c13          	mv	s8,a2
    8448:	01700693          	li	a3,23
    844c:	00100713          	li	a4,1
    8450:	00400793          	li	a5,4
    8454:	00c6c463          	blt	a3,a2,845c <_dtoa_r+0x320>
    8458:	3540106f          	j	97ac <_dtoa_r+0x1670>
    845c:	00179793          	sll	a5,a5,0x1
    8460:	01478693          	add	a3,a5,20
    8464:	00070593          	mv	a1,a4
    8468:	00170713          	add	a4,a4,1
    846c:	fed678e3          	bgeu	a2,a3,845c <_dtoa_r+0x320>
    8470:	02b42e23          	sw	a1,60(s0)
    8474:	00040513          	mv	a0,s0
    8478:	3b0010ef          	jal	9828 <_Balloc>
    847c:	00050a93          	mv	s5,a0
    8480:	00051463          	bnez	a0,8488 <_dtoa_r+0x34c>
    8484:	30c0106f          	j	9790 <_dtoa_r+0x1654>
    8488:	02a42c23          	sw	a0,56(s0)
    848c:	00e00793          	li	a5,14
    8490:	5187ea63          	bltu	a5,s8,89a4 <_dtoa_r+0x868>
    8494:	50090863          	beqz	s2,89a4 <_dtoa_r+0x868>
    8498:	02012783          	lw	a5,32(sp)
    849c:	62f054e3          	blez	a5,92c4 <_dtoa_r+0x1188>
    84a0:	00f7f713          	and	a4,a5,15
    84a4:	00371713          	sll	a4,a4,0x3
    84a8:	4047dc93          	sra	s9,a5,0x4
    84ac:	00007797          	auipc	a5,0x7
    84b0:	35478793          	add	a5,a5,852 # f800 <__mprec_tens>
    84b4:	00e787b3          	add	a5,a5,a4
    84b8:	010cf693          	and	a3,s9,16
    84bc:	0007a803          	lw	a6,0(a5)
    84c0:	0047a703          	lw	a4,4(a5)
    84c4:	560682e3          	beqz	a3,9228 <_dtoa_r+0x10ec>
    84c8:	00007797          	auipc	a5,0x7
    84cc:	31078793          	add	a5,a5,784 # f7d8 <__mprec_bigtens>
    84d0:	0207a603          	lw	a2,32(a5)
    84d4:	0247a683          	lw	a3,36(a5)
    84d8:	01812503          	lw	a0,24(sp)
    84dc:	01c12583          	lw	a1,28(sp)
    84e0:	04e12423          	sw	a4,72(sp)
    84e4:	05012023          	sw	a6,64(sp)
    84e8:	6a4040ef          	jal	cb8c <__divdf3>
    84ec:	04012803          	lw	a6,64(sp)
    84f0:	04812703          	lw	a4,72(sp)
    84f4:	00fcfc93          	and	s9,s9,15
    84f8:	00050313          	mv	t1,a0
    84fc:	00058d13          	mv	s10,a1
    8500:	00300913          	li	s2,3
    8504:	040c8c63          	beqz	s9,855c <_dtoa_r+0x420>
    8508:	04812023          	sw	s0,64(sp)
    850c:	00007b97          	auipc	s7,0x7
    8510:	2ccb8b93          	add	s7,s7,716 # f7d8 <__mprec_bigtens>
    8514:	00090413          	mv	s0,s2
    8518:	00070593          	mv	a1,a4
    851c:	00030913          	mv	s2,t1
    8520:	001cf793          	and	a5,s9,1
    8524:	00078e63          	beqz	a5,8540 <_dtoa_r+0x404>
    8528:	000ba603          	lw	a2,0(s7)
    852c:	004ba683          	lw	a3,4(s7)
    8530:	00080513          	mv	a0,a6
    8534:	00140413          	add	s0,s0,1
    8538:	194050ef          	jal	d6cc <__muldf3>
    853c:	00050813          	mv	a6,a0
    8540:	401cdc93          	sra	s9,s9,0x1
    8544:	008b8b93          	add	s7,s7,8
    8548:	fc0c9ce3          	bnez	s9,8520 <_dtoa_r+0x3e4>
    854c:	00090313          	mv	t1,s2
    8550:	00040913          	mv	s2,s0
    8554:	04012403          	lw	s0,64(sp)
    8558:	00058713          	mv	a4,a1
    855c:	00070693          	mv	a3,a4
    8560:	00080613          	mv	a2,a6
    8564:	00030513          	mv	a0,t1
    8568:	000d0593          	mv	a1,s10
    856c:	620040ef          	jal	cb8c <__divdf3>
    8570:	00050713          	mv	a4,a0
    8574:	00058793          	mv	a5,a1
    8578:	03412683          	lw	a3,52(sp)
    857c:	02068c63          	beqz	a3,85b4 <_dtoa_r+0x478>
    8580:	7fff8697          	auipc	a3,0x7fff8
    8584:	16868693          	add	a3,a3,360 # 800006e8 <__global_locale+0x1b4>
    8588:	0006a603          	lw	a2,0(a3)
    858c:	0046a683          	lw	a3,4(a3)
    8590:	00070513          	mv	a0,a4
    8594:	00078593          	mv	a1,a5
    8598:	04e12423          	sw	a4,72(sp)
    859c:	04f12023          	sw	a5,64(sp)
    85a0:	024050ef          	jal	d5c4 <__ledf2>
    85a4:	04012783          	lw	a5,64(sp)
    85a8:	04812703          	lw	a4,72(sp)
    85ac:	00055463          	bgez	a0,85b4 <_dtoa_r+0x478>
    85b0:	04c0106f          	j	95fc <_dtoa_r+0x14c0>
    85b4:	00090513          	mv	a0,s2
    85b8:	04f12623          	sw	a5,76(sp)
    85bc:	04e12023          	sw	a4,64(sp)
    85c0:	27c060ef          	jal	e83c <__floatsidf>
    85c4:	04012703          	lw	a4,64(sp)
    85c8:	04c12783          	lw	a5,76(sp)
    85cc:	00070613          	mv	a2,a4
    85d0:	00078693          	mv	a3,a5
    85d4:	04e12423          	sw	a4,72(sp)
    85d8:	04f12023          	sw	a5,64(sp)
    85dc:	0f0050ef          	jal	d6cc <__muldf3>
    85e0:	7fff8697          	auipc	a3,0x7fff8
    85e4:	11868693          	add	a3,a3,280 # 800006f8 <__global_locale+0x1c4>
    85e8:	0006a603          	lw	a2,0(a3)
    85ec:	0046a683          	lw	a3,4(a3)
    85f0:	4d5030ef          	jal	c2c4 <__adddf3>
    85f4:	fcc006b7          	lui	a3,0xfcc00
    85f8:	04012783          	lw	a5,64(sp)
    85fc:	04812703          	lw	a4,72(sp)
    8600:	00050c93          	mv	s9,a0
    8604:	00b68bb3          	add	s7,a3,a1
    8608:	340c0463          	beqz	s8,8950 <_dtoa_r+0x814>
    860c:	02012683          	lw	a3,32(sp)
    8610:	05812423          	sw	s8,72(sp)
    8614:	04d12e23          	sw	a3,92(sp)
    8618:	00070513          	mv	a0,a4
    861c:	00078593          	mv	a1,a5
    8620:	04e12623          	sw	a4,76(sp)
    8624:	04f12023          	sw	a5,64(sp)
    8628:	190060ef          	jal	e7b8 <__fixdfsi>
    862c:	04812783          	lw	a5,72(sp)
    8630:	00050913          	mv	s2,a0
    8634:	05912c23          	sw	s9,88(sp)
    8638:	fff78693          	add	a3,a5,-1
    863c:	00369693          	sll	a3,a3,0x3
    8640:	00007797          	auipc	a5,0x7
    8644:	1c078793          	add	a5,a5,448 # f800 <__mprec_tens>
    8648:	00d786b3          	add	a3,a5,a3
    864c:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8650:	0046a803          	lw	a6,4(a3)
    8654:	001a8d13          	add	s10,s5,1
    8658:	04f12823          	sw	a5,80(sp)
    865c:	05012a23          	sw	a6,84(sp)
    8660:	1dc060ef          	jal	e83c <__floatsidf>
    8664:	04c12703          	lw	a4,76(sp)
    8668:	04012783          	lw	a5,64(sp)
    866c:	00050613          	mv	a2,a0
    8670:	00058693          	mv	a3,a1
    8674:	00070513          	mv	a0,a4
    8678:	00078593          	mv	a1,a5
    867c:	7e0050ef          	jal	de5c <__subdf3>
    8680:	02812703          	lw	a4,40(sp)
    8684:	03090313          	add	t1,s2,48
    8688:	05a12023          	sw	s10,64(sp)
    868c:	00050c93          	mv	s9,a0
    8690:	0ff37313          	zext.b	t1,t1
    8694:	5c0706e3          	beqz	a4,9460 <_dtoa_r+0x1324>
    8698:	7fff8797          	auipc	a5,0x7fff8
    869c:	02078793          	add	a5,a5,32 # 800006b8 <__global_locale+0x184>
    86a0:	0007a503          	lw	a0,0(a5)
    86a4:	05012603          	lw	a2,80(sp)
    86a8:	05412683          	lw	a3,84(sp)
    86ac:	04b12023          	sw	a1,64(sp)
    86b0:	0047a583          	lw	a1,4(a5)
    86b4:	04612623          	sw	t1,76(sp)
    86b8:	4d4040ef          	jal	cb8c <__divdf3>
    86bc:	05812603          	lw	a2,88(sp)
    86c0:	000b8693          	mv	a3,s7
    86c4:	798050ef          	jal	de5c <__subdf3>
    86c8:	04012883          	lw	a7,64(sp)
    86cc:	04c12303          	lw	t1,76(sp)
    86d0:	000c8613          	mv	a2,s9
    86d4:	00088693          	mv	a3,a7
    86d8:	006a8023          	sb	t1,0(s5)
    86dc:	00050913          	mv	s2,a0
    86e0:	00058b93          	mv	s7,a1
    86e4:	5e1040ef          	jal	d4c4 <__gedf2>
    86e8:	04012883          	lw	a7,64(sp)
    86ec:	00a05463          	blez	a0,86f4 <_dtoa_r+0x5b8>
    86f0:	7c90006f          	j	96b8 <_dtoa_r+0x157c>
    86f4:	7fff8697          	auipc	a3,0x7fff8
    86f8:	ff468693          	add	a3,a3,-12 # 800006e8 <__global_locale+0x1b4>
    86fc:	0006a783          	lw	a5,0(a3)
    8700:	0046a803          	lw	a6,4(a3)
    8704:	05312623          	sw	s3,76(sp)
    8708:	04f12023          	sw	a5,64(sp)
    870c:	00000793          	li	a5,0
    8710:	05612823          	sw	s6,80(sp)
    8714:	05812c23          	sw	s8,88(sp)
    8718:	05012223          	sw	a6,68(sp)
    871c:	04812c03          	lw	s8,72(sp)
    8720:	00078b13          	mv	s6,a5
    8724:	05412423          	sw	s4,72(sp)
    8728:	00088993          	mv	s3,a7
    872c:	0980006f          	j	87c4 <_dtoa_r+0x688>
    8730:	001b0b13          	add	s6,s6,1
    8734:	018b4463          	blt	s6,s8,873c <_dtoa_r+0x600>
    8738:	7d10006f          	j	9708 <_dtoa_r+0x15cc>
    873c:	7fff8a17          	auipc	s4,0x7fff8
    8740:	fb4a0a13          	add	s4,s4,-76 # 800006f0 <__global_locale+0x1bc>
    8744:	000a2603          	lw	a2,0(s4)
    8748:	004a2683          	lw	a3,4(s4)
    874c:	00090513          	mv	a0,s2
    8750:	000b8593          	mv	a1,s7
    8754:	779040ef          	jal	d6cc <__muldf3>
    8758:	000a2603          	lw	a2,0(s4)
    875c:	004a2683          	lw	a3,4(s4)
    8760:	00050913          	mv	s2,a0
    8764:	00058b93          	mv	s7,a1
    8768:	000c8513          	mv	a0,s9
    876c:	00098593          	mv	a1,s3
    8770:	75d040ef          	jal	d6cc <__muldf3>
    8774:	00058c93          	mv	s9,a1
    8778:	00050a13          	mv	s4,a0
    877c:	03c060ef          	jal	e7b8 <__fixdfsi>
    8780:	00050993          	mv	s3,a0
    8784:	0b8060ef          	jal	e83c <__floatsidf>
    8788:	00050613          	mv	a2,a0
    878c:	00058693          	mv	a3,a1
    8790:	000a0513          	mv	a0,s4
    8794:	000c8593          	mv	a1,s9
    8798:	6c4050ef          	jal	de5c <__subdf3>
    879c:	03098793          	add	a5,s3,48
    87a0:	00090613          	mv	a2,s2
    87a4:	000b8693          	mv	a3,s7
    87a8:	00fd0023          	sb	a5,0(s10)
    87ac:	001d0d13          	add	s10,s10,1
    87b0:	00050c93          	mv	s9,a0
    87b4:	00058993          	mv	s3,a1
    87b8:	60d040ef          	jal	d5c4 <__ledf2>
    87bc:	00055463          	bgez	a0,87c4 <_dtoa_r+0x688>
    87c0:	6f90006f          	j	96b8 <_dtoa_r+0x157c>
    87c4:	04012503          	lw	a0,64(sp)
    87c8:	04412583          	lw	a1,68(sp)
    87cc:	000c8613          	mv	a2,s9
    87d0:	00098693          	mv	a3,s3
    87d4:	688050ef          	jal	de5c <__subdf3>
    87d8:	00090613          	mv	a2,s2
    87dc:	000b8693          	mv	a3,s7
    87e0:	5e5040ef          	jal	d5c4 <__ledf2>
    87e4:	f40556e3          	bgez	a0,8730 <_dtoa_r+0x5f4>
    87e8:	05c12783          	lw	a5,92(sp)
    87ec:	000d0b93          	mv	s7,s10
    87f0:	00178c13          	add	s8,a5,1
    87f4:	03900613          	li	a2,57
    87f8:	0080006f          	j	8800 <_dtoa_r+0x6c4>
    87fc:	697a88e3          	beq	s5,s7,968c <_dtoa_r+0x1550>
    8800:	fffbc683          	lbu	a3,-1(s7)
    8804:	000b8d13          	mv	s10,s7
    8808:	fffb8b93          	add	s7,s7,-1
    880c:	fec688e3          	beq	a3,a2,87fc <_dtoa_r+0x6c0>
    8810:	00168693          	add	a3,a3,1
    8814:	0ff6f693          	zext.b	a3,a3
    8818:	00db8023          	sb	a3,0(s7)
    881c:	000c0a13          	mv	s4,s8
    8820:	4f00006f          	j	8d10 <_dtoa_r+0xbd4>
    8824:	00c12683          	lw	a3,12(sp)
    8828:	00002737          	lui	a4,0x2
    882c:	00c99793          	sll	a5,s3,0xc
    8830:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x7d3>
    8834:	00c7d793          	srl	a5,a5,0xc
    8838:	00e6a023          	sw	a4,0(a3)
    883c:	01b7e7b3          	or	a5,a5,s11
    8840:	0a078063          	beqz	a5,88e0 <_dtoa_r+0x7a4>
    8844:	00812783          	lw	a5,8(sp)
    8848:	00007a97          	auipc	s5,0x7
    884c:	974a8a93          	add	s5,s5,-1676 # f1bc <__fini_array_end+0x230>
    8850:	9c078ee3          	beqz	a5,822c <_dtoa_r+0xf0>
    8854:	00007797          	auipc	a5,0x7
    8858:	96b78793          	add	a5,a5,-1685 # f1bf <__fini_array_end+0x233>
    885c:	00812703          	lw	a4,8(sp)
    8860:	00f72023          	sw	a5,0(a4)
    8864:	9c9ff06f          	j	822c <_dtoa_r+0xf0>
    8868:	01c12783          	lw	a5,28(sp)
    886c:	3ff006b7          	lui	a3,0x3ff00
    8870:	06812a83          	lw	s5,104(sp)
    8874:	00c79793          	sll	a5,a5,0xc
    8878:	00c7d793          	srl	a5,a5,0xc
    887c:	01812703          	lw	a4,24(sp)
    8880:	00d7e7b3          	or	a5,a5,a3
    8884:	c0190913          	add	s2,s2,-1023
    8888:	02012c23          	sw	zero,56(sp)
    888c:	a51ff06f          	j	82dc <_dtoa_r+0x1a0>
    8890:	00100793          	li	a5,1
    8894:	415787b3          	sub	a5,a5,s5
    8898:	00f12823          	sw	a5,16(sp)
    889c:	00000b13          	li	s6,0
    88a0:	b409c4e3          	bltz	s3,83e8 <_dtoa_r+0x2ac>
    88a4:	03312023          	sw	s3,32(sp)
    88a8:	02012823          	sw	zero,48(sp)
    88ac:	00900793          	li	a5,9
    88b0:	013b0b33          	add	s6,s6,s3
    88b4:	b547fce3          	bgeu	a5,s4,840c <_dtoa_r+0x2d0>
    88b8:	00100793          	li	a5,1
    88bc:	00100913          	li	s2,1
    88c0:	00000a13          	li	s4,0
    88c4:	02f12423          	sw	a5,40(sp)
    88c8:	fff00c13          	li	s8,-1
    88cc:	00012a23          	sw	zero,20(sp)
    88d0:	02042e23          	sw	zero,60(s0)
    88d4:	03812e23          	sw	s8,60(sp)
    88d8:	00000593          	li	a1,0
    88dc:	b99ff06f          	j	8474 <_dtoa_r+0x338>
    88e0:	00812703          	lw	a4,8(sp)
    88e4:	00007a97          	auipc	s5,0x7
    88e8:	8cca8a93          	add	s5,s5,-1844 # f1b0 <__fini_array_end+0x224>
    88ec:	00007797          	auipc	a5,0x7
    88f0:	8cc78793          	add	a5,a5,-1844 # f1b8 <__fini_array_end+0x22c>
    88f4:	f60714e3          	bnez	a4,885c <_dtoa_r+0x720>
    88f8:	935ff06f          	j	822c <_dtoa_r+0xf0>
    88fc:	00090513          	mv	a0,s2
    8900:	04f12623          	sw	a5,76(sp)
    8904:	04e12023          	sw	a4,64(sp)
    8908:	735050ef          	jal	e83c <__floatsidf>
    890c:	04012703          	lw	a4,64(sp)
    8910:	04c12783          	lw	a5,76(sp)
    8914:	00070613          	mv	a2,a4
    8918:	00078693          	mv	a3,a5
    891c:	04e12423          	sw	a4,72(sp)
    8920:	04f12023          	sw	a5,64(sp)
    8924:	5a9040ef          	jal	d6cc <__muldf3>
    8928:	7fff8697          	auipc	a3,0x7fff8
    892c:	dd068693          	add	a3,a3,-560 # 800006f8 <__global_locale+0x1c4>
    8930:	0006a603          	lw	a2,0(a3)
    8934:	0046a683          	lw	a3,4(a3)
    8938:	18d030ef          	jal	c2c4 <__adddf3>
    893c:	04012783          	lw	a5,64(sp)
    8940:	04812703          	lw	a4,72(sp)
    8944:	fcc006b7          	lui	a3,0xfcc00
    8948:	00050c93          	mv	s9,a0
    894c:	00b68bb3          	add	s7,a3,a1
    8950:	7fff8697          	auipc	a3,0x7fff8
    8954:	db068693          	add	a3,a3,-592 # 80000700 <__global_locale+0x1cc>
    8958:	0006a603          	lw	a2,0(a3)
    895c:	0046a683          	lw	a3,4(a3)
    8960:	00070513          	mv	a0,a4
    8964:	00078593          	mv	a1,a5
    8968:	4f4050ef          	jal	de5c <__subdf3>
    896c:	000c8613          	mv	a2,s9
    8970:	000b8693          	mv	a3,s7
    8974:	00050d13          	mv	s10,a0
    8978:	00058913          	mv	s2,a1
    897c:	349040ef          	jal	d4c4 <__gedf2>
    8980:	50a04ce3          	bgtz	a0,9698 <_dtoa_r+0x155c>
    8984:	800007b7          	lui	a5,0x80000
    8988:	0177c7b3          	xor	a5,a5,s7
    898c:	000c8613          	mv	a2,s9
    8990:	000d0513          	mv	a0,s10
    8994:	00078693          	mv	a3,a5
    8998:	00090593          	mv	a1,s2
    899c:	429040ef          	jal	d5c4 <__ledf2>
    89a0:	06054c63          	bltz	a0,8a18 <_dtoa_r+0x8dc>
    89a4:	06c12783          	lw	a5,108(sp)
    89a8:	1a07c663          	bltz	a5,8b54 <_dtoa_r+0xa18>
    89ac:	02012683          	lw	a3,32(sp)
    89b0:	00e00713          	li	a4,14
    89b4:	1ad74063          	blt	a4,a3,8b54 <_dtoa_r+0xa18>
    89b8:	02012783          	lw	a5,32(sp)
    89bc:	00379713          	sll	a4,a5,0x3
    89c0:	00007797          	auipc	a5,0x7
    89c4:	e4078793          	add	a5,a5,-448 # f800 <__mprec_tens>
    89c8:	00e787b3          	add	a5,a5,a4
    89cc:	0007a903          	lw	s2,0(a5)
    89d0:	0047a983          	lw	s3,4(a5)
    89d4:	01412783          	lw	a5,20(sp)
    89d8:	0407dc63          	bgez	a5,8a30 <_dtoa_r+0x8f4>
    89dc:	05804a63          	bgtz	s8,8a30 <_dtoa_r+0x8f4>
    89e0:	020c1c63          	bnez	s8,8a18 <_dtoa_r+0x8dc>
    89e4:	7fff8797          	auipc	a5,0x7fff8
    89e8:	d1c78793          	add	a5,a5,-740 # 80000700 <__global_locale+0x1cc>
    89ec:	0007a603          	lw	a2,0(a5)
    89f0:	0047a683          	lw	a3,4(a5)
    89f4:	00090513          	mv	a0,s2
    89f8:	00098593          	mv	a1,s3
    89fc:	4d1040ef          	jal	d6cc <__muldf3>
    8a00:	00050613          	mv	a2,a0
    8a04:	00058693          	mv	a3,a1
    8a08:	01812503          	lw	a0,24(sp)
    8a0c:	01c12583          	lw	a1,28(sp)
    8a10:	3b5040ef          	jal	d5c4 <__ledf2>
    8a14:	48a042e3          	bgtz	a0,9698 <_dtoa_r+0x155c>
    8a18:	000a8d13          	mv	s10,s5
    8a1c:	00012c23          	sw	zero,24(sp)
    8a20:	00000913          	li	s2,0
    8a24:	01412783          	lw	a5,20(sp)
    8a28:	fff7ca13          	not	s4,a5
    8a2c:	6980006f          	j	90c4 <_dtoa_r+0xf88>
    8a30:	001a8793          	add	a5,s5,1
    8a34:	04f12023          	sw	a5,64(sp)
    8a38:	01812b03          	lw	s6,24(sp)
    8a3c:	01c12a03          	lw	s4,28(sp)
    8a40:	00090613          	mv	a2,s2
    8a44:	00098693          	mv	a3,s3
    8a48:	000b0513          	mv	a0,s6
    8a4c:	000a0593          	mv	a1,s4
    8a50:	13c040ef          	jal	cb8c <__divdf3>
    8a54:	565050ef          	jal	e7b8 <__fixdfsi>
    8a58:	00050d13          	mv	s10,a0
    8a5c:	5e1050ef          	jal	e83c <__floatsidf>
    8a60:	00090613          	mv	a2,s2
    8a64:	00098693          	mv	a3,s3
    8a68:	465040ef          	jal	d6cc <__muldf3>
    8a6c:	00050613          	mv	a2,a0
    8a70:	00058693          	mv	a3,a1
    8a74:	000b0513          	mv	a0,s6
    8a78:	000a0593          	mv	a1,s4
    8a7c:	3e0050ef          	jal	de5c <__subdf3>
    8a80:	030d0793          	add	a5,s10,48
    8a84:	00fa8023          	sb	a5,0(s5)
    8a88:	00100613          	li	a2,1
    8a8c:	04012b83          	lw	s7,64(sp)
    8a90:	00050713          	mv	a4,a0
    8a94:	00058693          	mv	a3,a1
    8a98:	0ccc0ee3          	beq	s8,a2,9374 <_dtoa_r+0x1238>
    8a9c:	7fff8617          	auipc	a2,0x7fff8
    8aa0:	c5460613          	add	a2,a2,-940 # 800006f0 <__global_locale+0x1bc>
    8aa4:	00062783          	lw	a5,0(a2)
    8aa8:	00462803          	lw	a6,4(a2)
    8aac:	00100d93          	li	s11,1
    8ab0:	00f12023          	sw	a5,0(sp)
    8ab4:	01012223          	sw	a6,4(sp)
    8ab8:	0600006f          	j	8b18 <_dtoa_r+0x9dc>
    8abc:	00090613          	mv	a2,s2
    8ac0:	00098693          	mv	a3,s3
    8ac4:	000b0513          	mv	a0,s6
    8ac8:	000a0593          	mv	a1,s4
    8acc:	0c0040ef          	jal	cb8c <__divdf3>
    8ad0:	4e9050ef          	jal	e7b8 <__fixdfsi>
    8ad4:	00050d13          	mv	s10,a0
    8ad8:	565050ef          	jal	e83c <__floatsidf>
    8adc:	00090613          	mv	a2,s2
    8ae0:	00098693          	mv	a3,s3
    8ae4:	3e9040ef          	jal	d6cc <__muldf3>
    8ae8:	00058693          	mv	a3,a1
    8aec:	00050613          	mv	a2,a0
    8af0:	000a0593          	mv	a1,s4
    8af4:	000b0513          	mv	a0,s6
    8af8:	364050ef          	jal	de5c <__subdf3>
    8afc:	001b8b93          	add	s7,s7,1
    8b00:	030d0793          	add	a5,s10,48
    8b04:	001d8d93          	add	s11,s11,1
    8b08:	fefb8fa3          	sb	a5,-1(s7)
    8b0c:	00050713          	mv	a4,a0
    8b10:	00058693          	mv	a3,a1
    8b14:	07bc00e3          	beq	s8,s11,9374 <_dtoa_r+0x1238>
    8b18:	00012603          	lw	a2,0(sp)
    8b1c:	00068593          	mv	a1,a3
    8b20:	00412683          	lw	a3,4(sp)
    8b24:	00070513          	mv	a0,a4
    8b28:	3a5040ef          	jal	d6cc <__muldf3>
    8b2c:	00000613          	li	a2,0
    8b30:	00000693          	li	a3,0
    8b34:	00050b13          	mv	s6,a0
    8b38:	00058a13          	mv	s4,a1
    8b3c:	0fd040ef          	jal	d438 <__eqdf2>
    8b40:	f6051ee3          	bnez	a0,8abc <_dtoa_r+0x980>
    8b44:	02012783          	lw	a5,32(sp)
    8b48:	000b8d13          	mv	s10,s7
    8b4c:	00178a13          	add	s4,a5,1
    8b50:	1c00006f          	j	8d10 <_dtoa_r+0xbd4>
    8b54:	02812703          	lw	a4,40(sp)
    8b58:	26071463          	bnez	a4,8dc0 <_dtoa_r+0xc84>
    8b5c:	03012b83          	lw	s7,48(sp)
    8b60:	01012c83          	lw	s9,16(sp)
    8b64:	02012423          	sw	zero,40(sp)
    8b68:	00000913          	li	s2,0
    8b6c:	020c8263          	beqz	s9,8b90 <_dtoa_r+0xa54>
    8b70:	03605063          	blez	s6,8b90 <_dtoa_r+0xa54>
    8b74:	000c8793          	mv	a5,s9
    8b78:	679b4263          	blt	s6,s9,91dc <_dtoa_r+0x10a0>
    8b7c:	01012703          	lw	a4,16(sp)
    8b80:	40fc8cb3          	sub	s9,s9,a5
    8b84:	40fb0b33          	sub	s6,s6,a5
    8b88:	40f70733          	sub	a4,a4,a5
    8b8c:	00e12823          	sw	a4,16(sp)
    8b90:	03012783          	lw	a5,48(sp)
    8b94:	02078263          	beqz	a5,8bb8 <_dtoa_r+0xa7c>
    8b98:	02812783          	lw	a5,40(sp)
    8b9c:	00078463          	beqz	a5,8ba4 <_dtoa_r+0xa68>
    8ba0:	060b9ae3          	bnez	s7,9414 <_dtoa_r+0x12d8>
    8ba4:	03012603          	lw	a2,48(sp)
    8ba8:	00048593          	mv	a1,s1
    8bac:	00040513          	mv	a0,s0
    8bb0:	3a4010ef          	jal	9f54 <__pow5mult>
    8bb4:	00050493          	mv	s1,a0
    8bb8:	00100593          	li	a1,1
    8bbc:	00040513          	mv	a0,s0
    8bc0:	01c010ef          	jal	9bdc <__i2b>
    8bc4:	00a12c23          	sw	a0,24(sp)
    8bc8:	50099a63          	bnez	s3,90dc <_dtoa_r+0xfa0>
    8bcc:	00100793          	li	a5,1
    8bd0:	5547da63          	bge	a5,s4,9124 <_dtoa_r+0xfe8>
    8bd4:	016787b3          	add	a5,a5,s6
    8bd8:	01f7f793          	and	a5,a5,31
    8bdc:	1c078e63          	beqz	a5,8db8 <_dtoa_r+0xc7c>
    8be0:	02000713          	li	a4,32
    8be4:	40f70733          	sub	a4,a4,a5
    8be8:	00400693          	li	a3,4
    8bec:	58e6d263          	bge	a3,a4,9170 <_dtoa_r+0x1034>
    8bf0:	01c00713          	li	a4,28
    8bf4:	40f707b3          	sub	a5,a4,a5
    8bf8:	01012703          	lw	a4,16(sp)
    8bfc:	00fc8cb3          	add	s9,s9,a5
    8c00:	00fb0b33          	add	s6,s6,a5
    8c04:	00f70733          	add	a4,a4,a5
    8c08:	00e12823          	sw	a4,16(sp)
    8c0c:	01012783          	lw	a5,16(sp)
    8c10:	12f04e63          	bgtz	a5,8d4c <_dtoa_r+0xc10>
    8c14:	01605c63          	blez	s6,8c2c <_dtoa_r+0xaf0>
    8c18:	01812583          	lw	a1,24(sp)
    8c1c:	000b0613          	mv	a2,s6
    8c20:	00040513          	mv	a0,s0
    8c24:	480010ef          	jal	a0a4 <__lshift>
    8c28:	00a12c23          	sw	a0,24(sp)
    8c2c:	03412783          	lw	a5,52(sp)
    8c30:	12079a63          	bnez	a5,8d64 <_dtoa_r+0xc28>
    8c34:	45805263          	blez	s8,9078 <_dtoa_r+0xf3c>
    8c38:	02812783          	lw	a5,40(sp)
    8c3c:	24079e63          	bnez	a5,8e98 <_dtoa_r+0xd5c>
    8c40:	02012783          	lw	a5,32(sp)
    8c44:	00178a13          	add	s4,a5,1
    8c48:	01812b03          	lw	s6,24(sp)
    8c4c:	00100993          	li	s3,1
    8c50:	0200006f          	j	8c70 <_dtoa_r+0xb34>
    8c54:	00048593          	mv	a1,s1
    8c58:	00000693          	li	a3,0
    8c5c:	00a00613          	li	a2,10
    8c60:	00040513          	mv	a0,s0
    8c64:	49d000ef          	jal	9900 <__multadd>
    8c68:	00050493          	mv	s1,a0
    8c6c:	00198993          	add	s3,s3,1
    8c70:	000b0593          	mv	a1,s6
    8c74:	00048513          	mv	a0,s1
    8c78:	a64ff0ef          	jal	7edc <quorem>
    8c7c:	03050b93          	add	s7,a0,48
    8c80:	013a87b3          	add	a5,s5,s3
    8c84:	ff778fa3          	sb	s7,-1(a5)
    8c88:	fd89c6e3          	blt	s3,s8,8c54 <_dtoa_r+0xb18>
    8c8c:	00100993          	li	s3,1
    8c90:	55804263          	bgtz	s8,91d4 <_dtoa_r+0x1098>
    8c94:	013a89b3          	add	s3,s5,s3
    8c98:	00000c13          	li	s8,0
    8c9c:	00048593          	mv	a1,s1
    8ca0:	00100613          	li	a2,1
    8ca4:	00040513          	mv	a0,s0
    8ca8:	3fc010ef          	jal	a0a4 <__lshift>
    8cac:	01812583          	lw	a1,24(sp)
    8cb0:	00050493          	mv	s1,a0
    8cb4:	580010ef          	jal	a234 <__mcmp>
    8cb8:	4ea05c63          	blez	a0,91b0 <_dtoa_r+0x1074>
    8cbc:	03900693          	li	a3,57
    8cc0:	0080006f          	j	8cc8 <_dtoa_r+0xb8c>
    8cc4:	5f3a8863          	beq	s5,s3,92b4 <_dtoa_r+0x1178>
    8cc8:	fff9c783          	lbu	a5,-1(s3)
    8ccc:	00098d13          	mv	s10,s3
    8cd0:	fff98993          	add	s3,s3,-1
    8cd4:	fed788e3          	beq	a5,a3,8cc4 <_dtoa_r+0xb88>
    8cd8:	00178793          	add	a5,a5,1
    8cdc:	00f98023          	sb	a5,0(s3)
    8ce0:	01812583          	lw	a1,24(sp)
    8ce4:	00040513          	mv	a0,s0
    8ce8:	3f5000ef          	jal	98dc <_Bfree>
    8cec:	02090263          	beqz	s2,8d10 <_dtoa_r+0xbd4>
    8cf0:	000c0a63          	beqz	s8,8d04 <_dtoa_r+0xbc8>
    8cf4:	012c0863          	beq	s8,s2,8d04 <_dtoa_r+0xbc8>
    8cf8:	000c0593          	mv	a1,s8
    8cfc:	00040513          	mv	a0,s0
    8d00:	3dd000ef          	jal	98dc <_Bfree>
    8d04:	00090593          	mv	a1,s2
    8d08:	00040513          	mv	a0,s0
    8d0c:	3d1000ef          	jal	98dc <_Bfree>
    8d10:	00048593          	mv	a1,s1
    8d14:	00040513          	mv	a0,s0
    8d18:	3c5000ef          	jal	98dc <_Bfree>
    8d1c:	00c12783          	lw	a5,12(sp)
    8d20:	000d0023          	sb	zero,0(s10)
    8d24:	0147a023          	sw	s4,0(a5)
    8d28:	00812783          	lw	a5,8(sp)
    8d2c:	00078463          	beqz	a5,8d34 <_dtoa_r+0xbf8>
    8d30:	01a7a023          	sw	s10,0(a5)
    8d34:	09012b03          	lw	s6,144(sp)
    8d38:	08c12b83          	lw	s7,140(sp)
    8d3c:	08812c03          	lw	s8,136(sp)
    8d40:	08412c83          	lw	s9,132(sp)
    8d44:	08012d03          	lw	s10,128(sp)
    8d48:	ce4ff06f          	j	822c <_dtoa_r+0xf0>
    8d4c:	00048593          	mv	a1,s1
    8d50:	00078613          	mv	a2,a5
    8d54:	00040513          	mv	a0,s0
    8d58:	34c010ef          	jal	a0a4 <__lshift>
    8d5c:	00050493          	mv	s1,a0
    8d60:	eb5ff06f          	j	8c14 <_dtoa_r+0xad8>
    8d64:	01812583          	lw	a1,24(sp)
    8d68:	00048513          	mv	a0,s1
    8d6c:	4c8010ef          	jal	a234 <__mcmp>
    8d70:	ec0552e3          	bgez	a0,8c34 <_dtoa_r+0xaf8>
    8d74:	02012783          	lw	a5,32(sp)
    8d78:	00048593          	mv	a1,s1
    8d7c:	00000693          	li	a3,0
    8d80:	00a00613          	li	a2,10
    8d84:	00040513          	mv	a0,s0
    8d88:	fff78b13          	add	s6,a5,-1
    8d8c:	375000ef          	jal	9900 <__multadd>
    8d90:	02812783          	lw	a5,40(sp)
    8d94:	00050493          	mv	s1,a0
    8d98:	0c079e63          	bnez	a5,8e74 <_dtoa_r+0xd38>
    8d9c:	03c12c03          	lw	s8,60(sp)
    8da0:	17805ee3          	blez	s8,971c <_dtoa_r+0x15e0>
    8da4:	02012a03          	lw	s4,32(sp)
    8da8:	ea1ff06f          	j	8c48 <_dtoa_r+0xb0c>
    8dac:	00100793          	li	a5,1
    8db0:	02f12a23          	sw	a5,52(sp)
    8db4:	e28ff06f          	j	83dc <_dtoa_r+0x2a0>
    8db8:	01c00793          	li	a5,28
    8dbc:	e3dff06f          	j	8bf8 <_dtoa_r+0xabc>
    8dc0:	00100713          	li	a4,1
    8dc4:	4d475463          	bge	a4,s4,928c <_dtoa_r+0x1150>
    8dc8:	03012783          	lw	a5,48(sp)
    8dcc:	fffc0b93          	add	s7,s8,-1
    8dd0:	4177ca63          	blt	a5,s7,91e4 <_dtoa_r+0x10a8>
    8dd4:	41778bb3          	sub	s7,a5,s7
    8dd8:	01012783          	lw	a5,16(sp)
    8ddc:	41878cb3          	sub	s9,a5,s8
    8de0:	100c54e3          	bgez	s8,96e8 <_dtoa_r+0x15ac>
    8de4:	00100593          	li	a1,1
    8de8:	00040513          	mv	a0,s0
    8dec:	5f1000ef          	jal	9bdc <__i2b>
    8df0:	00050913          	mv	s2,a0
    8df4:	d79ff06f          	j	8b6c <_dtoa_r+0xa30>
    8df8:	02012a23          	sw	zero,52(sp)
    8dfc:	00012823          	sw	zero,16(sp)
    8e00:	ab5042e3          	bgtz	s5,88a4 <_dtoa_r+0x768>
    8e04:	00100793          	li	a5,1
    8e08:	415787b3          	sub	a5,a5,s5
    8e0c:	00f12823          	sw	a5,16(sp)
    8e10:	00000b13          	li	s6,0
    8e14:	a91ff06f          	j	88a4 <_dtoa_r+0x768>
    8e18:	40e787b3          	sub	a5,a5,a4
    8e1c:	00fd9533          	sll	a0,s11,a5
    8e20:	ca0ff06f          	j	82c0 <_dtoa_r+0x184>
    8e24:	00300793          	li	a5,3
    8e28:	00100913          	li	s2,1
    8e2c:	44fa0c63          	beq	s4,a5,9284 <_dtoa_r+0x1148>
    8e30:	df47cc63          	blt	a5,s4,8428 <_dtoa_r+0x2ec>
    8e34:	00200793          	li	a5,2
    8e38:	18fa00e3          	beq	s4,a5,97b8 <_dtoa_r+0x167c>
    8e3c:	02042e23          	sw	zero,60(s0)
    8e40:	00000593          	li	a1,0
    8e44:	00040513          	mv	a0,s0
    8e48:	1e1000ef          	jal	9828 <_Balloc>
    8e4c:	00050a93          	mv	s5,a0
    8e50:	140500e3          	beqz	a0,9790 <_dtoa_r+0x1654>
    8e54:	00100793          	li	a5,1
    8e58:	02f12423          	sw	a5,40(sp)
    8e5c:	fff00793          	li	a5,-1
    8e60:	02a42c23          	sw	a0,56(s0)
    8e64:	02f12e23          	sw	a5,60(sp)
    8e68:	fff00c13          	li	s8,-1
    8e6c:	00012a23          	sw	zero,20(sp)
    8e70:	b35ff06f          	j	89a4 <_dtoa_r+0x868>
    8e74:	00090593          	mv	a1,s2
    8e78:	00000693          	li	a3,0
    8e7c:	00a00613          	li	a2,10
    8e80:	00040513          	mv	a0,s0
    8e84:	27d000ef          	jal	9900 <__multadd>
    8e88:	03c12c03          	lw	s8,60(sp)
    8e8c:	00050913          	mv	s2,a0
    8e90:	0b805ae3          	blez	s8,9744 <_dtoa_r+0x1608>
    8e94:	03612023          	sw	s6,32(sp)
    8e98:	01905c63          	blez	s9,8eb0 <_dtoa_r+0xd74>
    8e9c:	00090593          	mv	a1,s2
    8ea0:	000c8613          	mv	a2,s9
    8ea4:	00040513          	mv	a0,s0
    8ea8:	1fc010ef          	jal	a0a4 <__lshift>
    8eac:	00050913          	mv	s2,a0
    8eb0:	00090b13          	mv	s6,s2
    8eb4:	50099e63          	bnez	s3,93d0 <_dtoa_r+0x1294>
    8eb8:	02412783          	lw	a5,36(sp)
    8ebc:	fffa8d13          	add	s10,s5,-1
    8ec0:	000a8c93          	mv	s9,s5
    8ec4:	01512823          	sw	s5,16(sp)
    8ec8:	01812a83          	lw	s5,24(sp)
    8ecc:	0017f793          	and	a5,a5,1
    8ed0:	018d0d33          	add	s10,s10,s8
    8ed4:	00f12023          	sw	a5,0(sp)
    8ed8:	01b12a23          	sw	s11,20(sp)
    8edc:	000a8593          	mv	a1,s5
    8ee0:	00048513          	mv	a0,s1
    8ee4:	ff9fe0ef          	jal	7edc <quorem>
    8ee8:	00050c13          	mv	s8,a0
    8eec:	00090593          	mv	a1,s2
    8ef0:	00048513          	mv	a0,s1
    8ef4:	340010ef          	jal	a234 <__mcmp>
    8ef8:	00050993          	mv	s3,a0
    8efc:	000b0613          	mv	a2,s6
    8f00:	000a8593          	mv	a1,s5
    8f04:	00040513          	mv	a0,s0
    8f08:	384010ef          	jal	a28c <__mdiff>
    8f0c:	00c52703          	lw	a4,12(a0)
    8f10:	030c0b93          	add	s7,s8,48
    8f14:	00050d93          	mv	s11,a0
    8f18:	08071c63          	bnez	a4,8fb0 <_dtoa_r+0xe74>
    8f1c:	00050593          	mv	a1,a0
    8f20:	00048513          	mv	a0,s1
    8f24:	310010ef          	jal	a234 <__mcmp>
    8f28:	00050713          	mv	a4,a0
    8f2c:	000d8593          	mv	a1,s11
    8f30:	00040513          	mv	a0,s0
    8f34:	00070d93          	mv	s11,a4
    8f38:	1a5000ef          	jal	98dc <_Bfree>
    8f3c:	014de6b3          	or	a3,s11,s4
    8f40:	0e069a63          	bnez	a3,9034 <_dtoa_r+0xef8>
    8f44:	00012783          	lw	a5,0(sp)
    8f48:	76078e63          	beqz	a5,96c4 <_dtoa_r+0x1588>
    8f4c:	7809c663          	bltz	s3,96d8 <_dtoa_r+0x159c>
    8f50:	017c8023          	sb	s7,0(s9)
    8f54:	001c8993          	add	s3,s9,1
    8f58:	679d0e63          	beq	s10,s9,95d4 <_dtoa_r+0x1498>
    8f5c:	00048593          	mv	a1,s1
    8f60:	00000693          	li	a3,0
    8f64:	00a00613          	li	a2,10
    8f68:	00040513          	mv	a0,s0
    8f6c:	195000ef          	jal	9900 <__multadd>
    8f70:	00050493          	mv	s1,a0
    8f74:	00000693          	li	a3,0
    8f78:	00a00613          	li	a2,10
    8f7c:	00090593          	mv	a1,s2
    8f80:	00040513          	mv	a0,s0
    8f84:	09690e63          	beq	s2,s6,9020 <_dtoa_r+0xee4>
    8f88:	179000ef          	jal	9900 <__multadd>
    8f8c:	000b0593          	mv	a1,s6
    8f90:	00050913          	mv	s2,a0
    8f94:	00000693          	li	a3,0
    8f98:	00a00613          	li	a2,10
    8f9c:	00040513          	mv	a0,s0
    8fa0:	161000ef          	jal	9900 <__multadd>
    8fa4:	00050b13          	mv	s6,a0
    8fa8:	00098c93          	mv	s9,s3
    8fac:	f31ff06f          	j	8edc <_dtoa_r+0xda0>
    8fb0:	00050593          	mv	a1,a0
    8fb4:	00040513          	mv	a0,s0
    8fb8:	01012a83          	lw	s5,16(sp)
    8fbc:	01412d83          	lw	s11,20(sp)
    8fc0:	11d000ef          	jal	98dc <_Bfree>
    8fc4:	0009ca63          	bltz	s3,8fd8 <_dtoa_r+0xe9c>
    8fc8:	001df713          	and	a4,s11,1
    8fcc:	0149e9b3          	or	s3,s3,s4
    8fd0:	01376733          	or	a4,a4,s3
    8fd4:	06071e63          	bnez	a4,9050 <_dtoa_r+0xf14>
    8fd8:	00048593          	mv	a1,s1
    8fdc:	00100613          	li	a2,1
    8fe0:	00040513          	mv	a0,s0
    8fe4:	0c0010ef          	jal	a0a4 <__lshift>
    8fe8:	01812583          	lw	a1,24(sp)
    8fec:	00050493          	mv	s1,a0
    8ff0:	244010ef          	jal	a234 <__mcmp>
    8ff4:	24a05863          	blez	a0,9244 <_dtoa_r+0x1108>
    8ff8:	03900713          	li	a4,57
    8ffc:	24eb8c63          	beq	s7,a4,9254 <_dtoa_r+0x1118>
    9000:	031c0b93          	add	s7,s8,49
    9004:	02012783          	lw	a5,32(sp)
    9008:	00090c13          	mv	s8,s2
    900c:	001c8d13          	add	s10,s9,1
    9010:	017c8023          	sb	s7,0(s9)
    9014:	00178a13          	add	s4,a5,1
    9018:	000b0913          	mv	s2,s6
    901c:	cc5ff06f          	j	8ce0 <_dtoa_r+0xba4>
    9020:	0e1000ef          	jal	9900 <__multadd>
    9024:	00050913          	mv	s2,a0
    9028:	00050b13          	mv	s6,a0
    902c:	00098c93          	mv	s9,s3
    9030:	eadff06f          	j	8edc <_dtoa_r+0xda0>
    9034:	7409c863          	bltz	s3,9784 <_dtoa_r+0x1648>
    9038:	00012783          	lw	a5,0(sp)
    903c:	0149e9b3          	or	s3,s3,s4
    9040:	0137e9b3          	or	s3,a5,s3
    9044:	74098063          	beqz	s3,9784 <_dtoa_r+0x1648>
    9048:	f1b054e3          	blez	s11,8f50 <_dtoa_r+0xe14>
    904c:	01012a83          	lw	s5,16(sp)
    9050:	03900713          	li	a4,57
    9054:	20eb8063          	beq	s7,a4,9254 <_dtoa_r+0x1118>
    9058:	02012703          	lw	a4,32(sp)
    905c:	001b8793          	add	a5,s7,1
    9060:	00090c13          	mv	s8,s2
    9064:	001c8d13          	add	s10,s9,1
    9068:	00170a13          	add	s4,a4,1
    906c:	00fc8023          	sb	a5,0(s9)
    9070:	000b0913          	mv	s2,s6
    9074:	c6dff06f          	j	8ce0 <_dtoa_r+0xba4>
    9078:	00200793          	li	a5,2
    907c:	bb47dee3          	bge	a5,s4,8c38 <_dtoa_r+0xafc>
    9080:	000a8d13          	mv	s10,s5
    9084:	9a0c10e3          	bnez	s8,8a24 <_dtoa_r+0x8e8>
    9088:	01812583          	lw	a1,24(sp)
    908c:	00000693          	li	a3,0
    9090:	00500613          	li	a2,5
    9094:	00040513          	mv	a0,s0
    9098:	069000ef          	jal	9900 <__multadd>
    909c:	00050593          	mv	a1,a0
    90a0:	00a12c23          	sw	a0,24(sp)
    90a4:	00048513          	mv	a0,s1
    90a8:	18c010ef          	jal	a234 <__mcmp>
    90ac:	96a05ce3          	blez	a0,8a24 <_dtoa_r+0x8e8>
    90b0:	03100793          	li	a5,49
    90b4:	00fa8023          	sb	a5,0(s5)
    90b8:	02012783          	lw	a5,32(sp)
    90bc:	001a8d13          	add	s10,s5,1
    90c0:	00178a13          	add	s4,a5,1
    90c4:	01812583          	lw	a1,24(sp)
    90c8:	00040513          	mv	a0,s0
    90cc:	001a0a13          	add	s4,s4,1
    90d0:	00d000ef          	jal	98dc <_Bfree>
    90d4:	c20918e3          	bnez	s2,8d04 <_dtoa_r+0xbc8>
    90d8:	c39ff06f          	j	8d10 <_dtoa_r+0xbd4>
    90dc:	00050593          	mv	a1,a0
    90e0:	00098613          	mv	a2,s3
    90e4:	00040513          	mv	a0,s0
    90e8:	66d000ef          	jal	9f54 <__pow5mult>
    90ec:	00100793          	li	a5,1
    90f0:	00a12c23          	sw	a0,24(sp)
    90f4:	1147de63          	bge	a5,s4,9210 <_dtoa_r+0x10d4>
    90f8:	00000993          	li	s3,0
    90fc:	01812703          	lw	a4,24(sp)
    9100:	01072783          	lw	a5,16(a4)
    9104:	00378793          	add	a5,a5,3
    9108:	00279793          	sll	a5,a5,0x2
    910c:	00f707b3          	add	a5,a4,a5
    9110:	0047a503          	lw	a0,4(a5)
    9114:	171000ef          	jal	9a84 <__hi0bits>
    9118:	02000793          	li	a5,32
    911c:	40a787b3          	sub	a5,a5,a0
    9120:	ab5ff06f          	j	8bd4 <_dtoa_r+0xa98>
    9124:	02412783          	lw	a5,36(sp)
    9128:	04079063          	bnez	a5,9168 <_dtoa_r+0x102c>
    912c:	00012783          	lw	a5,0(sp)
    9130:	00c79793          	sll	a5,a5,0xc
    9134:	02079a63          	bnez	a5,9168 <_dtoa_r+0x102c>
    9138:	00012683          	lw	a3,0(sp)
    913c:	00000793          	li	a5,0
    9140:	0146d713          	srl	a4,a3,0x14
    9144:	7ff77713          	and	a4,a4,2047
    9148:	00070c63          	beqz	a4,9160 <_dtoa_r+0x1024>
    914c:	01012783          	lw	a5,16(sp)
    9150:	001b0b13          	add	s6,s6,1
    9154:	00178793          	add	a5,a5,1
    9158:	00f12823          	sw	a5,16(sp)
    915c:	00100793          	li	a5,1
    9160:	58099063          	bnez	s3,96e0 <_dtoa_r+0x15a4>
    9164:	00078993          	mv	s3,a5
    9168:	00100793          	li	a5,1
    916c:	a69ff06f          	j	8bd4 <_dtoa_r+0xa98>
    9170:	a8d70ee3          	beq	a4,a3,8c0c <_dtoa_r+0xad0>
    9174:	03c00713          	li	a4,60
    9178:	40f707b3          	sub	a5,a4,a5
    917c:	a7dff06f          	j	8bf8 <_dtoa_r+0xabc>
    9180:	00100793          	li	a5,1
    9184:	00500a13          	li	s4,5
    9188:	02f12423          	sw	a5,40(sp)
    918c:	01412783          	lw	a5,20(sp)
    9190:	02012703          	lw	a4,32(sp)
    9194:	00e787b3          	add	a5,a5,a4
    9198:	00178c13          	add	s8,a5,1
    919c:	02f12e23          	sw	a5,60(sp)
    91a0:	000c0613          	mv	a2,s8
    91a4:	ab804263          	bgtz	s8,8448 <_dtoa_r+0x30c>
    91a8:	00100613          	li	a2,1
    91ac:	a9cff06f          	j	8448 <_dtoa_r+0x30c>
    91b0:	00051663          	bnez	a0,91bc <_dtoa_r+0x1080>
    91b4:	001bf793          	and	a5,s7,1
    91b8:	b00792e3          	bnez	a5,8cbc <_dtoa_r+0xb80>
    91bc:	03000693          	li	a3,48
    91c0:	fff9c783          	lbu	a5,-1(s3)
    91c4:	00098d13          	mv	s10,s3
    91c8:	fff98993          	add	s3,s3,-1
    91cc:	fed78ae3          	beq	a5,a3,91c0 <_dtoa_r+0x1084>
    91d0:	b11ff06f          	j	8ce0 <_dtoa_r+0xba4>
    91d4:	000c0993          	mv	s3,s8
    91d8:	abdff06f          	j	8c94 <_dtoa_r+0xb58>
    91dc:	000b0793          	mv	a5,s6
    91e0:	99dff06f          	j	8b7c <_dtoa_r+0xa40>
    91e4:	03012783          	lw	a5,48(sp)
    91e8:	01012703          	lw	a4,16(sp)
    91ec:	03712823          	sw	s7,48(sp)
    91f0:	40fb87b3          	sub	a5,s7,a5
    91f4:	00f989b3          	add	s3,s3,a5
    91f8:	018707b3          	add	a5,a4,s8
    91fc:	00070c93          	mv	s9,a4
    9200:	018b0b33          	add	s6,s6,s8
    9204:	00f12823          	sw	a5,16(sp)
    9208:	00000b93          	li	s7,0
    920c:	bd9ff06f          	j	8de4 <_dtoa_r+0xca8>
    9210:	02412783          	lw	a5,36(sp)
    9214:	ee0792e3          	bnez	a5,90f8 <_dtoa_r+0xfbc>
    9218:	00012783          	lw	a5,0(sp)
    921c:	00c79793          	sll	a5,a5,0xc
    9220:	ec079ce3          	bnez	a5,90f8 <_dtoa_r+0xfbc>
    9224:	f15ff06f          	j	9138 <_dtoa_r+0xffc>
    9228:	01812303          	lw	t1,24(sp)
    922c:	01c12d03          	lw	s10,28(sp)
    9230:	00200913          	li	s2,2
    9234:	ad0ff06f          	j	8504 <_dtoa_r+0x3c8>
    9238:	00200a13          	li	s4,2
    923c:	02012423          	sw	zero,40(sp)
    9240:	9f8ff06f          	j	8438 <_dtoa_r+0x2fc>
    9244:	dc0510e3          	bnez	a0,9004 <_dtoa_r+0xec8>
    9248:	001bf713          	and	a4,s7,1
    924c:	da0716e3          	bnez	a4,8ff8 <_dtoa_r+0xebc>
    9250:	db5ff06f          	j	9004 <_dtoa_r+0xec8>
    9254:	03900793          	li	a5,57
    9258:	00fc8023          	sb	a5,0(s9)
    925c:	02012783          	lw	a5,32(sp)
    9260:	00090c13          	mv	s8,s2
    9264:	001c8993          	add	s3,s9,1
    9268:	00178a13          	add	s4,a5,1
    926c:	000b0913          	mv	s2,s6
    9270:	a4dff06f          	j	8cbc <_dtoa_r+0xb80>
    9274:	00100793          	li	a5,1
    9278:	00100c13          	li	s8,1
    927c:	00f12a23          	sw	a5,20(sp)
    9280:	e50ff06f          	j	88d0 <_dtoa_r+0x794>
    9284:	02012423          	sw	zero,40(sp)
    9288:	f05ff06f          	j	918c <_dtoa_r+0x1050>
    928c:	03812703          	lw	a4,56(sp)
    9290:	30070e63          	beqz	a4,95ac <_dtoa_r+0x1470>
    9294:	01012703          	lw	a4,16(sp)
    9298:	43378793          	add	a5,a5,1075
    929c:	00fb0b33          	add	s6,s6,a5
    92a0:	00f707b3          	add	a5,a4,a5
    92a4:	03012b83          	lw	s7,48(sp)
    92a8:	00070c93          	mv	s9,a4
    92ac:	00f12823          	sw	a5,16(sp)
    92b0:	b35ff06f          	j	8de4 <_dtoa_r+0xca8>
    92b4:	03100793          	li	a5,49
    92b8:	00fa8023          	sb	a5,0(s5)
    92bc:	001a0a13          	add	s4,s4,1
    92c0:	a21ff06f          	j	8ce0 <_dtoa_r+0xba4>
    92c4:	02012783          	lw	a5,32(sp)
    92c8:	32078263          	beqz	a5,95ec <_dtoa_r+0x14b0>
    92cc:	40f00bb3          	neg	s7,a5
    92d0:	00fbf713          	and	a4,s7,15
    92d4:	00371713          	sll	a4,a4,0x3
    92d8:	00006797          	auipc	a5,0x6
    92dc:	52878793          	add	a5,a5,1320 # f800 <__mprec_tens>
    92e0:	00e787b3          	add	a5,a5,a4
    92e4:	0007a603          	lw	a2,0(a5)
    92e8:	0047a683          	lw	a3,4(a5)
    92ec:	01812503          	lw	a0,24(sp)
    92f0:	01c12583          	lw	a1,28(sp)
    92f4:	404bdb93          	sra	s7,s7,0x4
    92f8:	3d4040ef          	jal	d6cc <__muldf3>
    92fc:	00058d13          	mv	s10,a1
    9300:	440b8c63          	beqz	s7,9758 <_dtoa_r+0x161c>
    9304:	00200913          	li	s2,2
    9308:	04812023          	sw	s0,64(sp)
    930c:	00006c97          	auipc	s9,0x6
    9310:	4ccc8c93          	add	s9,s9,1228 # f7d8 <__mprec_bigtens>
    9314:	00090413          	mv	s0,s2
    9318:	00050713          	mv	a4,a0
    931c:	00000613          	li	a2,0
    9320:	00050913          	mv	s2,a0
    9324:	001bf693          	and	a3,s7,1
    9328:	02068063          	beqz	a3,9348 <_dtoa_r+0x120c>
    932c:	000ca603          	lw	a2,0(s9)
    9330:	004ca683          	lw	a3,4(s9)
    9334:	00070513          	mv	a0,a4
    9338:	00140413          	add	s0,s0,1
    933c:	390040ef          	jal	d6cc <__muldf3>
    9340:	00050713          	mv	a4,a0
    9344:	00100613          	li	a2,1
    9348:	401bdb93          	sra	s7,s7,0x1
    934c:	008c8c93          	add	s9,s9,8
    9350:	fc0b9ae3          	bnez	s7,9324 <_dtoa_r+0x11e8>
    9354:	00090513          	mv	a0,s2
    9358:	00058793          	mv	a5,a1
    935c:	00040913          	mv	s2,s0
    9360:	04012403          	lw	s0,64(sp)
    9364:	a0061a63          	bnez	a2,8578 <_dtoa_r+0x43c>
    9368:	00050713          	mv	a4,a0
    936c:	000d0793          	mv	a5,s10
    9370:	a08ff06f          	j	8578 <_dtoa_r+0x43c>
    9374:	00068593          	mv	a1,a3
    9378:	00070613          	mv	a2,a4
    937c:	00070513          	mv	a0,a4
    9380:	745020ef          	jal	c2c4 <__adddf3>
    9384:	02012783          	lw	a5,32(sp)
    9388:	00090613          	mv	a2,s2
    938c:	00098693          	mv	a3,s3
    9390:	00178a13          	add	s4,a5,1
    9394:	00050c93          	mv	s9,a0
    9398:	00058b13          	mv	s6,a1
    939c:	000a0c13          	mv	s8,s4
    93a0:	124040ef          	jal	d4c4 <__gedf2>
    93a4:	c4a04863          	bgtz	a0,87f4 <_dtoa_r+0x6b8>
    93a8:	000c8513          	mv	a0,s9
    93ac:	000b0593          	mv	a1,s6
    93b0:	00090613          	mv	a2,s2
    93b4:	00098693          	mv	a3,s3
    93b8:	080040ef          	jal	d438 <__eqdf2>
    93bc:	00051663          	bnez	a0,93c8 <_dtoa_r+0x128c>
    93c0:	001d7d13          	and	s10,s10,1
    93c4:	c20d1863          	bnez	s10,87f4 <_dtoa_r+0x6b8>
    93c8:	000b8d13          	mv	s10,s7
    93cc:	945ff06f          	j	8d10 <_dtoa_r+0xbd4>
    93d0:	00492583          	lw	a1,4(s2)
    93d4:	00040513          	mv	a0,s0
    93d8:	450000ef          	jal	9828 <_Balloc>
    93dc:	00050993          	mv	s3,a0
    93e0:	38050463          	beqz	a0,9768 <_dtoa_r+0x162c>
    93e4:	01092603          	lw	a2,16(s2)
    93e8:	00c90593          	add	a1,s2,12
    93ec:	00c50513          	add	a0,a0,12
    93f0:	00260613          	add	a2,a2,2
    93f4:	00261613          	sll	a2,a2,0x2
    93f8:	ccdf70ef          	jal	10c4 <memcpy>
    93fc:	00100613          	li	a2,1
    9400:	00098593          	mv	a1,s3
    9404:	00040513          	mv	a0,s0
    9408:	49d000ef          	jal	a0a4 <__lshift>
    940c:	00050b13          	mv	s6,a0
    9410:	aa9ff06f          	j	8eb8 <_dtoa_r+0xd7c>
    9414:	00090593          	mv	a1,s2
    9418:	000b8613          	mv	a2,s7
    941c:	00040513          	mv	a0,s0
    9420:	335000ef          	jal	9f54 <__pow5mult>
    9424:	00048613          	mv	a2,s1
    9428:	00050593          	mv	a1,a0
    942c:	00050913          	mv	s2,a0
    9430:	00040513          	mv	a0,s0
    9434:	059000ef          	jal	9c8c <__multiply>
    9438:	00050793          	mv	a5,a0
    943c:	00048593          	mv	a1,s1
    9440:	00040513          	mv	a0,s0
    9444:	00078493          	mv	s1,a5
    9448:	494000ef          	jal	98dc <_Bfree>
    944c:	03012783          	lw	a5,48(sp)
    9450:	417787b3          	sub	a5,a5,s7
    9454:	02f12823          	sw	a5,48(sp)
    9458:	f6078063          	beqz	a5,8bb8 <_dtoa_r+0xa7c>
    945c:	f48ff06f          	j	8ba4 <_dtoa_r+0xa68>
    9460:	05012603          	lw	a2,80(sp)
    9464:	05412683          	lw	a3,84(sp)
    9468:	05812503          	lw	a0,88(sp)
    946c:	04b12623          	sw	a1,76(sp)
    9470:	000b8593          	mv	a1,s7
    9474:	02612423          	sw	t1,40(sp)
    9478:	254040ef          	jal	d6cc <__muldf3>
    947c:	02812303          	lw	t1,40(sp)
    9480:	04812783          	lw	a5,72(sp)
    9484:	00100693          	li	a3,1
    9488:	006a8023          	sb	t1,0(s5)
    948c:	02a12c23          	sw	a0,56(sp)
    9490:	04c12883          	lw	a7,76(sp)
    9494:	00058913          	mv	s2,a1
    9498:	00fa8bb3          	add	s7,s5,a5
    949c:	7fff7617          	auipc	a2,0x7fff7
    94a0:	25460613          	add	a2,a2,596 # 800006f0 <__global_locale+0x1bc>
    94a4:	28d78c63          	beq	a5,a3,973c <_dtoa_r+0x1600>
    94a8:	00062783          	lw	a5,0(a2)
    94ac:	00462803          	lw	a6,4(a2)
    94b0:	04912423          	sw	s1,72(sp)
    94b4:	02f12423          	sw	a5,40(sp)
    94b8:	03012623          	sw	a6,44(sp)
    94bc:	04812623          	sw	s0,76(sp)
    94c0:	000c8513          	mv	a0,s9
    94c4:	00088593          	mv	a1,a7
    94c8:	02812603          	lw	a2,40(sp)
    94cc:	02c12683          	lw	a3,44(sp)
    94d0:	001d0d13          	add	s10,s10,1
    94d4:	1f8040ef          	jal	d6cc <__muldf3>
    94d8:	00058413          	mv	s0,a1
    94dc:	00050493          	mv	s1,a0
    94e0:	2d8050ef          	jal	e7b8 <__fixdfsi>
    94e4:	00050c93          	mv	s9,a0
    94e8:	354050ef          	jal	e83c <__floatsidf>
    94ec:	00050613          	mv	a2,a0
    94f0:	00058693          	mv	a3,a1
    94f4:	00048513          	mv	a0,s1
    94f8:	00040593          	mv	a1,s0
    94fc:	030c8c93          	add	s9,s9,48
    9500:	15d040ef          	jal	de5c <__subdf3>
    9504:	ff9d0fa3          	sb	s9,-1(s10)
    9508:	fdab90e3          	bne	s7,s10,94c8 <_dtoa_r+0x138c>
    950c:	04812483          	lw	s1,72(sp)
    9510:	04c12403          	lw	s0,76(sp)
    9514:	00050c93          	mv	s9,a0
    9518:	00058893          	mv	a7,a1
    951c:	7fff7d17          	auipc	s10,0x7fff7
    9520:	19cd0d13          	add	s10,s10,412 # 800006b8 <__global_locale+0x184>
    9524:	000d2603          	lw	a2,0(s10)
    9528:	004d2683          	lw	a3,4(s10)
    952c:	03812503          	lw	a0,56(sp)
    9530:	00090593          	mv	a1,s2
    9534:	03112423          	sw	a7,40(sp)
    9538:	58d020ef          	jal	c2c4 <__adddf3>
    953c:	02812883          	lw	a7,40(sp)
    9540:	000c8613          	mv	a2,s9
    9544:	00088693          	mv	a3,a7
    9548:	07c040ef          	jal	d5c4 <__ledf2>
    954c:	1a054863          	bltz	a0,96fc <_dtoa_r+0x15c0>
    9550:	03812603          	lw	a2,56(sp)
    9554:	000d2503          	lw	a0,0(s10)
    9558:	004d2583          	lw	a1,4(s10)
    955c:	00090693          	mv	a3,s2
    9560:	0fd040ef          	jal	de5c <__subdf3>
    9564:	02812883          	lw	a7,40(sp)
    9568:	000c8613          	mv	a2,s9
    956c:	00088693          	mv	a3,a7
    9570:	755030ef          	jal	d4c4 <__gedf2>
    9574:	12a04863          	bgtz	a0,96a4 <_dtoa_r+0x1568>
    9578:	06c12783          	lw	a5,108(sp)
    957c:	de07c063          	bltz	a5,8b5c <_dtoa_r+0xa20>
    9580:	02012703          	lw	a4,32(sp)
    9584:	00e00793          	li	a5,14
    9588:	dce7ca63          	blt	a5,a4,8b5c <_dtoa_r+0xa20>
    958c:	02012783          	lw	a5,32(sp)
    9590:	00006717          	auipc	a4,0x6
    9594:	27070713          	add	a4,a4,624 # f800 <__mprec_tens>
    9598:	00379793          	sll	a5,a5,0x3
    959c:	00f707b3          	add	a5,a4,a5
    95a0:	0007a903          	lw	s2,0(a5)
    95a4:	0047a983          	lw	s3,4(a5)
    95a8:	c90ff06f          	j	8a38 <_dtoa_r+0x8fc>
    95ac:	06812703          	lw	a4,104(sp)
    95b0:	01012683          	lw	a3,16(sp)
    95b4:	03600793          	li	a5,54
    95b8:	40e787b3          	sub	a5,a5,a4
    95bc:	00fb0b33          	add	s6,s6,a5
    95c0:	00f687b3          	add	a5,a3,a5
    95c4:	03012b83          	lw	s7,48(sp)
    95c8:	00068c93          	mv	s9,a3
    95cc:	00f12823          	sw	a5,16(sp)
    95d0:	815ff06f          	j	8de4 <_dtoa_r+0xca8>
    95d4:	02012783          	lw	a5,32(sp)
    95d8:	00090c13          	mv	s8,s2
    95dc:	01012a83          	lw	s5,16(sp)
    95e0:	00178a13          	add	s4,a5,1
    95e4:	000b0913          	mv	s2,s6
    95e8:	eb4ff06f          	j	8c9c <_dtoa_r+0xb60>
    95ec:	01812703          	lw	a4,24(sp)
    95f0:	01c12783          	lw	a5,28(sp)
    95f4:	00200913          	li	s2,2
    95f8:	f81fe06f          	j	8578 <_dtoa_r+0x43c>
    95fc:	b00c0063          	beqz	s8,88fc <_dtoa_r+0x7c0>
    9600:	03c12d03          	lw	s10,60(sp)
    9604:	bba05063          	blez	s10,89a4 <_dtoa_r+0x868>
    9608:	7fff7617          	auipc	a2,0x7fff7
    960c:	0e860613          	add	a2,a2,232 # 800006f0 <__global_locale+0x1bc>
    9610:	00078593          	mv	a1,a5
    9614:	02012783          	lw	a5,32(sp)
    9618:	00462683          	lw	a3,4(a2)
    961c:	00062603          	lw	a2,0(a2)
    9620:	fff78793          	add	a5,a5,-1
    9624:	00070513          	mv	a0,a4
    9628:	04f12e23          	sw	a5,92(sp)
    962c:	0a0040ef          	jal	d6cc <__muldf3>
    9630:	00050713          	mv	a4,a0
    9634:	00190513          	add	a0,s2,1
    9638:	04e12423          	sw	a4,72(sp)
    963c:	04b12023          	sw	a1,64(sp)
    9640:	1fc050ef          	jal	e83c <__floatsidf>
    9644:	04812703          	lw	a4,72(sp)
    9648:	04012783          	lw	a5,64(sp)
    964c:	00070613          	mv	a2,a4
    9650:	00078693          	mv	a3,a5
    9654:	04e12623          	sw	a4,76(sp)
    9658:	074040ef          	jal	d6cc <__muldf3>
    965c:	7fff7697          	auipc	a3,0x7fff7
    9660:	09c68693          	add	a3,a3,156 # 800006f8 <__global_locale+0x1c4>
    9664:	0006a603          	lw	a2,0(a3)
    9668:	0046a683          	lw	a3,4(a3)
    966c:	459020ef          	jal	c2c4 <__adddf3>
    9670:	fcc006b7          	lui	a3,0xfcc00
    9674:	04012783          	lw	a5,64(sp)
    9678:	04c12703          	lw	a4,76(sp)
    967c:	00050c93          	mv	s9,a0
    9680:	00b68bb3          	add	s7,a3,a1
    9684:	05a12423          	sw	s10,72(sp)
    9688:	f91fe06f          	j	8618 <_dtoa_r+0x4dc>
    968c:	03100693          	li	a3,49
    9690:	001c0c13          	add	s8,s8,1
    9694:	984ff06f          	j	8818 <_dtoa_r+0x6dc>
    9698:	00012c23          	sw	zero,24(sp)
    969c:	00000913          	li	s2,0
    96a0:	a11ff06f          	j	90b0 <_dtoa_r+0xf74>
    96a4:	03000613          	li	a2,48
    96a8:	fffbc783          	lbu	a5,-1(s7)
    96ac:	000b8d13          	mv	s10,s7
    96b0:	fffb8b93          	add	s7,s7,-1
    96b4:	fec78ae3          	beq	a5,a2,96a8 <_dtoa_r+0x156c>
    96b8:	05c12783          	lw	a5,92(sp)
    96bc:	00178a13          	add	s4,a5,1
    96c0:	e50ff06f          	j	8d10 <_dtoa_r+0xbd4>
    96c4:	03900713          	li	a4,57
    96c8:	01012a83          	lw	s5,16(sp)
    96cc:	b8eb84e3          	beq	s7,a4,9254 <_dtoa_r+0x1118>
    96d0:	933048e3          	bgtz	s3,9000 <_dtoa_r+0xec4>
    96d4:	931ff06f          	j	9004 <_dtoa_r+0xec8>
    96d8:	01012a83          	lw	s5,16(sp)
    96dc:	929ff06f          	j	9004 <_dtoa_r+0xec8>
    96e0:	00078993          	mv	s3,a5
    96e4:	a19ff06f          	j	90fc <_dtoa_r+0xfc0>
    96e8:	00078c93          	mv	s9,a5
    96ec:	018787b3          	add	a5,a5,s8
    96f0:	018b0b33          	add	s6,s6,s8
    96f4:	00f12823          	sw	a5,16(sp)
    96f8:	eecff06f          	j	8de4 <_dtoa_r+0xca8>
    96fc:	05c12783          	lw	a5,92(sp)
    9700:	00178c13          	add	s8,a5,1
    9704:	8f0ff06f          	j	87f4 <_dtoa_r+0x6b8>
    9708:	04c12983          	lw	s3,76(sp)
    970c:	05012b03          	lw	s6,80(sp)
    9710:	05812c03          	lw	s8,88(sp)
    9714:	04812a03          	lw	s4,72(sp)
    9718:	a8cff06f          	j	89a4 <_dtoa_r+0x868>
    971c:	00200793          	li	a5,2
    9720:	0147c863          	blt	a5,s4,9730 <_dtoa_r+0x15f4>
    9724:	02012a03          	lw	s4,32(sp)
    9728:	03c12c03          	lw	s8,60(sp)
    972c:	d1cff06f          	j	8c48 <_dtoa_r+0xb0c>
    9730:	03c12c03          	lw	s8,60(sp)
    9734:	03612023          	sw	s6,32(sp)
    9738:	949ff06f          	j	9080 <_dtoa_r+0xf44>
    973c:	04012b83          	lw	s7,64(sp)
    9740:	dddff06f          	j	951c <_dtoa_r+0x13e0>
    9744:	00200793          	li	a5,2
    9748:	ff47c4e3          	blt	a5,s4,9730 <_dtoa_r+0x15f4>
    974c:	03c12c03          	lw	s8,60(sp)
    9750:	03612023          	sw	s6,32(sp)
    9754:	f44ff06f          	j	8e98 <_dtoa_r+0xd5c>
    9758:	00050713          	mv	a4,a0
    975c:	00058793          	mv	a5,a1
    9760:	00200913          	li	s2,2
    9764:	e15fe06f          	j	8578 <_dtoa_r+0x43c>
    9768:	00006697          	auipc	a3,0x6
    976c:	a5868693          	add	a3,a3,-1448 # f1c0 <__fini_array_end+0x234>
    9770:	00000613          	li	a2,0
    9774:	2ef00593          	li	a1,751
    9778:	00006517          	auipc	a0,0x6
    977c:	a5c50513          	add	a0,a0,-1444 # f1d4 <__fini_array_end+0x248>
    9780:	0cd010ef          	jal	b04c <__assert_func>
    9784:	01012a83          	lw	s5,16(sp)
    9788:	85b048e3          	bgtz	s11,8fd8 <_dtoa_r+0xe9c>
    978c:	879ff06f          	j	9004 <_dtoa_r+0xec8>
    9790:	00006697          	auipc	a3,0x6
    9794:	a3068693          	add	a3,a3,-1488 # f1c0 <__fini_array_end+0x234>
    9798:	00000613          	li	a2,0
    979c:	1af00593          	li	a1,431
    97a0:	00006517          	auipc	a0,0x6
    97a4:	a3450513          	add	a0,a0,-1484 # f1d4 <__fini_array_end+0x248>
    97a8:	0a5010ef          	jal	b04c <__assert_func>
    97ac:	02042e23          	sw	zero,60(s0)
    97b0:	00000593          	li	a1,0
    97b4:	cc1fe06f          	j	8474 <_dtoa_r+0x338>
    97b8:	02012423          	sw	zero,40(sp)
    97bc:	c7dfe06f          	j	8438 <_dtoa_r+0x2fc>

000097c0 <__ascii_mbtowc>:
    97c0:	02058063          	beqz	a1,97e0 <__ascii_mbtowc+0x20>
    97c4:	04060263          	beqz	a2,9808 <__ascii_mbtowc+0x48>
    97c8:	04068863          	beqz	a3,9818 <__ascii_mbtowc+0x58>
    97cc:	00064783          	lbu	a5,0(a2)
    97d0:	00f5a023          	sw	a5,0(a1)
    97d4:	00064503          	lbu	a0,0(a2)
    97d8:	00a03533          	snez	a0,a0
    97dc:	00008067          	ret
    97e0:	ff010113          	add	sp,sp,-16
    97e4:	00c10593          	add	a1,sp,12
    97e8:	02060463          	beqz	a2,9810 <__ascii_mbtowc+0x50>
    97ec:	02068a63          	beqz	a3,9820 <__ascii_mbtowc+0x60>
    97f0:	00064783          	lbu	a5,0(a2)
    97f4:	00f5a023          	sw	a5,0(a1)
    97f8:	00064503          	lbu	a0,0(a2)
    97fc:	00a03533          	snez	a0,a0
    9800:	01010113          	add	sp,sp,16
    9804:	00008067          	ret
    9808:	00000513          	li	a0,0
    980c:	00008067          	ret
    9810:	00000513          	li	a0,0
    9814:	fedff06f          	j	9800 <__ascii_mbtowc+0x40>
    9818:	ffe00513          	li	a0,-2
    981c:	00008067          	ret
    9820:	ffe00513          	li	a0,-2
    9824:	fddff06f          	j	9800 <__ascii_mbtowc+0x40>

00009828 <_Balloc>:
    9828:	04452783          	lw	a5,68(a0)
    982c:	ff010113          	add	sp,sp,-16
    9830:	00812423          	sw	s0,8(sp)
    9834:	00912223          	sw	s1,4(sp)
    9838:	00112623          	sw	ra,12(sp)
    983c:	00050413          	mv	s0,a0
    9840:	00058493          	mv	s1,a1
    9844:	02078c63          	beqz	a5,987c <_Balloc+0x54>
    9848:	00249713          	sll	a4,s1,0x2
    984c:	00e787b3          	add	a5,a5,a4
    9850:	0007a503          	lw	a0,0(a5)
    9854:	04050463          	beqz	a0,989c <_Balloc+0x74>
    9858:	00052703          	lw	a4,0(a0)
    985c:	00e7a023          	sw	a4,0(a5)
    9860:	00052823          	sw	zero,16(a0)
    9864:	00052623          	sw	zero,12(a0)
    9868:	00c12083          	lw	ra,12(sp)
    986c:	00812403          	lw	s0,8(sp)
    9870:	00412483          	lw	s1,4(sp)
    9874:	01010113          	add	sp,sp,16
    9878:	00008067          	ret
    987c:	02100613          	li	a2,33
    9880:	00400593          	li	a1,4
    9884:	021010ef          	jal	b0a4 <_calloc_r>
    9888:	04a42223          	sw	a0,68(s0)
    988c:	00050793          	mv	a5,a0
    9890:	fa051ce3          	bnez	a0,9848 <_Balloc+0x20>
    9894:	00000513          	li	a0,0
    9898:	fd1ff06f          	j	9868 <_Balloc+0x40>
    989c:	01212023          	sw	s2,0(sp)
    98a0:	00100913          	li	s2,1
    98a4:	00991933          	sll	s2,s2,s1
    98a8:	00590613          	add	a2,s2,5
    98ac:	00261613          	sll	a2,a2,0x2
    98b0:	00100593          	li	a1,1
    98b4:	00040513          	mv	a0,s0
    98b8:	7ec010ef          	jal	b0a4 <_calloc_r>
    98bc:	00050a63          	beqz	a0,98d0 <_Balloc+0xa8>
    98c0:	01252423          	sw	s2,8(a0)
    98c4:	00952223          	sw	s1,4(a0)
    98c8:	00012903          	lw	s2,0(sp)
    98cc:	f95ff06f          	j	9860 <_Balloc+0x38>
    98d0:	00012903          	lw	s2,0(sp)
    98d4:	00000513          	li	a0,0
    98d8:	f91ff06f          	j	9868 <_Balloc+0x40>

000098dc <_Bfree>:
    98dc:	02058063          	beqz	a1,98fc <_Bfree+0x20>
    98e0:	0045a703          	lw	a4,4(a1)
    98e4:	04452783          	lw	a5,68(a0)
    98e8:	00271713          	sll	a4,a4,0x2
    98ec:	00e787b3          	add	a5,a5,a4
    98f0:	0007a703          	lw	a4,0(a5)
    98f4:	00e5a023          	sw	a4,0(a1)
    98f8:	00b7a023          	sw	a1,0(a5)
    98fc:	00008067          	ret

00009900 <__multadd>:
    9900:	fd010113          	add	sp,sp,-48
    9904:	01412c23          	sw	s4,24(sp)
    9908:	0105aa03          	lw	s4,16(a1)
    990c:	01912223          	sw	s9,4(sp)
    9910:	00010cb7          	lui	s9,0x10
    9914:	02912223          	sw	s1,36(sp)
    9918:	03212023          	sw	s2,32(sp)
    991c:	01312e23          	sw	s3,28(sp)
    9920:	01512a23          	sw	s5,20(sp)
    9924:	01612823          	sw	s6,16(sp)
    9928:	01712623          	sw	s7,12(sp)
    992c:	02112623          	sw	ra,44(sp)
    9930:	02812423          	sw	s0,40(sp)
    9934:	01812423          	sw	s8,8(sp)
    9938:	00058a93          	mv	s5,a1
    993c:	00050b13          	mv	s6,a0
    9940:	00060993          	mv	s3,a2
    9944:	00068493          	mv	s1,a3
    9948:	01458913          	add	s2,a1,20
    994c:	00000b93          	li	s7,0
    9950:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    9954:	00092c03          	lw	s8,0(s2)
    9958:	00098593          	mv	a1,s3
    995c:	00490913          	add	s2,s2,4
    9960:	019c7533          	and	a0,s8,s9
    9964:	430050ef          	jal	ed94 <__mulsi3>
    9968:	00050413          	mv	s0,a0
    996c:	00098593          	mv	a1,s3
    9970:	010c5513          	srl	a0,s8,0x10
    9974:	00940433          	add	s0,s0,s1
    9978:	41c050ef          	jal	ed94 <__mulsi3>
    997c:	01045793          	srl	a5,s0,0x10
    9980:	00f50533          	add	a0,a0,a5
    9984:	01051793          	sll	a5,a0,0x10
    9988:	01947433          	and	s0,s0,s9
    998c:	008787b3          	add	a5,a5,s0
    9990:	fef92e23          	sw	a5,-4(s2)
    9994:	001b8b93          	add	s7,s7,1
    9998:	01055493          	srl	s1,a0,0x10
    999c:	fb4bcce3          	blt	s7,s4,9954 <__multadd+0x54>
    99a0:	02048263          	beqz	s1,99c4 <__multadd+0xc4>
    99a4:	008aa783          	lw	a5,8(s5)
    99a8:	04fa5a63          	bge	s4,a5,99fc <__multadd+0xfc>
    99ac:	004a0793          	add	a5,s4,4
    99b0:	00279793          	sll	a5,a5,0x2
    99b4:	00fa87b3          	add	a5,s5,a5
    99b8:	0097a223          	sw	s1,4(a5)
    99bc:	001a0a13          	add	s4,s4,1
    99c0:	014aa823          	sw	s4,16(s5)
    99c4:	02c12083          	lw	ra,44(sp)
    99c8:	02812403          	lw	s0,40(sp)
    99cc:	02412483          	lw	s1,36(sp)
    99d0:	02012903          	lw	s2,32(sp)
    99d4:	01c12983          	lw	s3,28(sp)
    99d8:	01812a03          	lw	s4,24(sp)
    99dc:	01012b03          	lw	s6,16(sp)
    99e0:	00c12b83          	lw	s7,12(sp)
    99e4:	00812c03          	lw	s8,8(sp)
    99e8:	00412c83          	lw	s9,4(sp)
    99ec:	000a8513          	mv	a0,s5
    99f0:	01412a83          	lw	s5,20(sp)
    99f4:	03010113          	add	sp,sp,48
    99f8:	00008067          	ret
    99fc:	004aa583          	lw	a1,4(s5)
    9a00:	000b0513          	mv	a0,s6
    9a04:	00158593          	add	a1,a1,1
    9a08:	e21ff0ef          	jal	9828 <_Balloc>
    9a0c:	00050413          	mv	s0,a0
    9a10:	04050c63          	beqz	a0,9a68 <__multadd+0x168>
    9a14:	010aa603          	lw	a2,16(s5)
    9a18:	00ca8593          	add	a1,s5,12
    9a1c:	00c50513          	add	a0,a0,12
    9a20:	00260613          	add	a2,a2,2
    9a24:	00261613          	sll	a2,a2,0x2
    9a28:	e9cf70ef          	jal	10c4 <memcpy>
    9a2c:	004aa703          	lw	a4,4(s5)
    9a30:	044b2783          	lw	a5,68(s6)
    9a34:	00271713          	sll	a4,a4,0x2
    9a38:	00e787b3          	add	a5,a5,a4
    9a3c:	0007a703          	lw	a4,0(a5)
    9a40:	00eaa023          	sw	a4,0(s5)
    9a44:	0157a023          	sw	s5,0(a5)
    9a48:	004a0793          	add	a5,s4,4
    9a4c:	00040a93          	mv	s5,s0
    9a50:	00279793          	sll	a5,a5,0x2
    9a54:	00fa87b3          	add	a5,s5,a5
    9a58:	0097a223          	sw	s1,4(a5)
    9a5c:	001a0a13          	add	s4,s4,1
    9a60:	014aa823          	sw	s4,16(s5)
    9a64:	f61ff06f          	j	99c4 <__multadd+0xc4>
    9a68:	00005697          	auipc	a3,0x5
    9a6c:	75868693          	add	a3,a3,1880 # f1c0 <__fini_array_end+0x234>
    9a70:	00000613          	li	a2,0
    9a74:	0ba00593          	li	a1,186
    9a78:	00005517          	auipc	a0,0x5
    9a7c:	7dc50513          	add	a0,a0,2012 # f254 <__fini_array_end+0x2c8>
    9a80:	5cc010ef          	jal	b04c <__assert_func>

00009a84 <__hi0bits>:
    9a84:	00050793          	mv	a5,a0
    9a88:	00010737          	lui	a4,0x10
    9a8c:	00000513          	li	a0,0
    9a90:	00e7f663          	bgeu	a5,a4,9a9c <__hi0bits+0x18>
    9a94:	01079793          	sll	a5,a5,0x10
    9a98:	01000513          	li	a0,16
    9a9c:	01000737          	lui	a4,0x1000
    9aa0:	00e7f663          	bgeu	a5,a4,9aac <__hi0bits+0x28>
    9aa4:	00850513          	add	a0,a0,8
    9aa8:	00879793          	sll	a5,a5,0x8
    9aac:	10000737          	lui	a4,0x10000
    9ab0:	00e7f663          	bgeu	a5,a4,9abc <__hi0bits+0x38>
    9ab4:	00450513          	add	a0,a0,4
    9ab8:	00479793          	sll	a5,a5,0x4
    9abc:	40000737          	lui	a4,0x40000
    9ac0:	00e7ea63          	bltu	a5,a4,9ad4 <__hi0bits+0x50>
    9ac4:	fff7c793          	not	a5,a5
    9ac8:	01f7d793          	srl	a5,a5,0x1f
    9acc:	00f50533          	add	a0,a0,a5
    9ad0:	00008067          	ret
    9ad4:	00279793          	sll	a5,a5,0x2
    9ad8:	0007ca63          	bltz	a5,9aec <__hi0bits+0x68>
    9adc:	00179713          	sll	a4,a5,0x1
    9ae0:	00074a63          	bltz	a4,9af4 <__hi0bits+0x70>
    9ae4:	02000513          	li	a0,32
    9ae8:	00008067          	ret
    9aec:	00250513          	add	a0,a0,2
    9af0:	00008067          	ret
    9af4:	00350513          	add	a0,a0,3
    9af8:	00008067          	ret

00009afc <__lo0bits>:
    9afc:	00052783          	lw	a5,0(a0)
    9b00:	00050713          	mv	a4,a0
    9b04:	0077f693          	and	a3,a5,7
    9b08:	02068463          	beqz	a3,9b30 <__lo0bits+0x34>
    9b0c:	0017f693          	and	a3,a5,1
    9b10:	00000513          	li	a0,0
    9b14:	04069e63          	bnez	a3,9b70 <__lo0bits+0x74>
    9b18:	0027f693          	and	a3,a5,2
    9b1c:	0a068863          	beqz	a3,9bcc <__lo0bits+0xd0>
    9b20:	0017d793          	srl	a5,a5,0x1
    9b24:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9b28:	00100513          	li	a0,1
    9b2c:	00008067          	ret
    9b30:	01079693          	sll	a3,a5,0x10
    9b34:	0106d693          	srl	a3,a3,0x10
    9b38:	00000513          	li	a0,0
    9b3c:	06068e63          	beqz	a3,9bb8 <__lo0bits+0xbc>
    9b40:	0ff7f693          	zext.b	a3,a5
    9b44:	06068063          	beqz	a3,9ba4 <__lo0bits+0xa8>
    9b48:	00f7f693          	and	a3,a5,15
    9b4c:	04068263          	beqz	a3,9b90 <__lo0bits+0x94>
    9b50:	0037f693          	and	a3,a5,3
    9b54:	02068463          	beqz	a3,9b7c <__lo0bits+0x80>
    9b58:	0017f693          	and	a3,a5,1
    9b5c:	00069c63          	bnez	a3,9b74 <__lo0bits+0x78>
    9b60:	0017d793          	srl	a5,a5,0x1
    9b64:	00150513          	add	a0,a0,1
    9b68:	00079663          	bnez	a5,9b74 <__lo0bits+0x78>
    9b6c:	02000513          	li	a0,32
    9b70:	00008067          	ret
    9b74:	00f72023          	sw	a5,0(a4)
    9b78:	00008067          	ret
    9b7c:	0027d793          	srl	a5,a5,0x2
    9b80:	0017f693          	and	a3,a5,1
    9b84:	00250513          	add	a0,a0,2
    9b88:	fe0696e3          	bnez	a3,9b74 <__lo0bits+0x78>
    9b8c:	fd5ff06f          	j	9b60 <__lo0bits+0x64>
    9b90:	0047d793          	srl	a5,a5,0x4
    9b94:	0037f693          	and	a3,a5,3
    9b98:	00450513          	add	a0,a0,4
    9b9c:	fa069ee3          	bnez	a3,9b58 <__lo0bits+0x5c>
    9ba0:	fddff06f          	j	9b7c <__lo0bits+0x80>
    9ba4:	0087d793          	srl	a5,a5,0x8
    9ba8:	00f7f693          	and	a3,a5,15
    9bac:	00850513          	add	a0,a0,8
    9bb0:	fa0690e3          	bnez	a3,9b50 <__lo0bits+0x54>
    9bb4:	fddff06f          	j	9b90 <__lo0bits+0x94>
    9bb8:	0107d793          	srl	a5,a5,0x10
    9bbc:	0ff7f693          	zext.b	a3,a5
    9bc0:	01000513          	li	a0,16
    9bc4:	f80692e3          	bnez	a3,9b48 <__lo0bits+0x4c>
    9bc8:	fddff06f          	j	9ba4 <__lo0bits+0xa8>
    9bcc:	0027d793          	srl	a5,a5,0x2
    9bd0:	00f72023          	sw	a5,0(a4)
    9bd4:	00200513          	li	a0,2
    9bd8:	00008067          	ret

00009bdc <__i2b>:
    9bdc:	04452783          	lw	a5,68(a0)
    9be0:	ff010113          	add	sp,sp,-16
    9be4:	00812423          	sw	s0,8(sp)
    9be8:	00912223          	sw	s1,4(sp)
    9bec:	00112623          	sw	ra,12(sp)
    9bf0:	00050413          	mv	s0,a0
    9bf4:	00058493          	mv	s1,a1
    9bf8:	02078c63          	beqz	a5,9c30 <__i2b+0x54>
    9bfc:	0047a503          	lw	a0,4(a5)
    9c00:	06050263          	beqz	a0,9c64 <__i2b+0x88>
    9c04:	00052703          	lw	a4,0(a0)
    9c08:	00e7a223          	sw	a4,4(a5)
    9c0c:	00c12083          	lw	ra,12(sp)
    9c10:	00812403          	lw	s0,8(sp)
    9c14:	00100793          	li	a5,1
    9c18:	00952a23          	sw	s1,20(a0)
    9c1c:	00052623          	sw	zero,12(a0)
    9c20:	00f52823          	sw	a5,16(a0)
    9c24:	00412483          	lw	s1,4(sp)
    9c28:	01010113          	add	sp,sp,16
    9c2c:	00008067          	ret
    9c30:	02100613          	li	a2,33
    9c34:	00400593          	li	a1,4
    9c38:	46c010ef          	jal	b0a4 <_calloc_r>
    9c3c:	04a42223          	sw	a0,68(s0)
    9c40:	00050793          	mv	a5,a0
    9c44:	fa051ce3          	bnez	a0,9bfc <__i2b+0x20>
    9c48:	00005697          	auipc	a3,0x5
    9c4c:	57868693          	add	a3,a3,1400 # f1c0 <__fini_array_end+0x234>
    9c50:	00000613          	li	a2,0
    9c54:	14500593          	li	a1,325
    9c58:	00005517          	auipc	a0,0x5
    9c5c:	5fc50513          	add	a0,a0,1532 # f254 <__fini_array_end+0x2c8>
    9c60:	3ec010ef          	jal	b04c <__assert_func>
    9c64:	01c00613          	li	a2,28
    9c68:	00100593          	li	a1,1
    9c6c:	00040513          	mv	a0,s0
    9c70:	434010ef          	jal	b0a4 <_calloc_r>
    9c74:	fc050ae3          	beqz	a0,9c48 <__i2b+0x6c>
    9c78:	00100793          	li	a5,1
    9c7c:	00f52223          	sw	a5,4(a0)
    9c80:	00200793          	li	a5,2
    9c84:	00f52423          	sw	a5,8(a0)
    9c88:	f85ff06f          	j	9c0c <__i2b+0x30>

00009c8c <__multiply>:
    9c8c:	fb010113          	add	sp,sp,-80
    9c90:	03312e23          	sw	s3,60(sp)
    9c94:	03812423          	sw	s8,40(sp)
    9c98:	01062983          	lw	s3,16(a2)
    9c9c:	0105ac03          	lw	s8,16(a1)
    9ca0:	04812423          	sw	s0,72(sp)
    9ca4:	03412c23          	sw	s4,56(sp)
    9ca8:	04112623          	sw	ra,76(sp)
    9cac:	03712623          	sw	s7,44(sp)
    9cb0:	00058a13          	mv	s4,a1
    9cb4:	00060413          	mv	s0,a2
    9cb8:	013c4c63          	blt	s8,s3,9cd0 <__multiply+0x44>
    9cbc:	00098713          	mv	a4,s3
    9cc0:	00058413          	mv	s0,a1
    9cc4:	000c0993          	mv	s3,s8
    9cc8:	00060a13          	mv	s4,a2
    9ccc:	00070c13          	mv	s8,a4
    9cd0:	00842783          	lw	a5,8(s0)
    9cd4:	00442583          	lw	a1,4(s0)
    9cd8:	01898bb3          	add	s7,s3,s8
    9cdc:	0177a7b3          	slt	a5,a5,s7
    9ce0:	00f585b3          	add	a1,a1,a5
    9ce4:	b45ff0ef          	jal	9828 <_Balloc>
    9ce8:	00a12623          	sw	a0,12(sp)
    9cec:	22050863          	beqz	a0,9f1c <__multiply+0x290>
    9cf0:	00c12783          	lw	a5,12(sp)
    9cf4:	03512a23          	sw	s5,52(sp)
    9cf8:	03612823          	sw	s6,48(sp)
    9cfc:	002b9a93          	sll	s5,s7,0x2
    9d00:	01478b13          	add	s6,a5,20
    9d04:	015b0ab3          	add	s5,s6,s5
    9d08:	000b0793          	mv	a5,s6
    9d0c:	015b7863          	bgeu	s6,s5,9d1c <__multiply+0x90>
    9d10:	0007a023          	sw	zero,0(a5)
    9d14:	00478793          	add	a5,a5,4
    9d18:	ff57ece3          	bltu	a5,s5,9d10 <__multiply+0x84>
    9d1c:	014a0a13          	add	s4,s4,20
    9d20:	002c1c13          	sll	s8,s8,0x2
    9d24:	01440793          	add	a5,s0,20
    9d28:	018a0733          	add	a4,s4,s8
    9d2c:	00299993          	sll	s3,s3,0x2
    9d30:	00f12423          	sw	a5,8(sp)
    9d34:	00e12023          	sw	a4,0(sp)
    9d38:	013789b3          	add	s3,a5,s3
    9d3c:	16ea7c63          	bgeu	s4,a4,9eb4 <__multiply+0x228>
    9d40:	00400713          	li	a4,4
    9d44:	04912223          	sw	s1,68(sp)
    9d48:	05212023          	sw	s2,64(sp)
    9d4c:	03912223          	sw	s9,36(sp)
    9d50:	03a12023          	sw	s10,32(sp)
    9d54:	01b12e23          	sw	s11,28(sp)
    9d58:	01540793          	add	a5,s0,21
    9d5c:	00e12223          	sw	a4,4(sp)
    9d60:	1af9f263          	bgeu	s3,a5,9f04 <__multiply+0x278>
    9d64:	00010437          	lui	s0,0x10
    9d68:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    9d6c:	01c0006f          	j	9d88 <__multiply+0xfc>
    9d70:	01095913          	srl	s2,s2,0x10
    9d74:	0a091063          	bnez	s2,9e14 <__multiply+0x188>
    9d78:	00012783          	lw	a5,0(sp)
    9d7c:	004a0a13          	add	s4,s4,4
    9d80:	004b0b13          	add	s6,s6,4
    9d84:	10fa7e63          	bgeu	s4,a5,9ea0 <__multiply+0x214>
    9d88:	000a2903          	lw	s2,0(s4)
    9d8c:	008974b3          	and	s1,s2,s0
    9d90:	fe0480e3          	beqz	s1,9d70 <__multiply+0xe4>
    9d94:	00812c83          	lw	s9,8(sp)
    9d98:	000b0d13          	mv	s10,s6
    9d9c:	00000c13          	li	s8,0
    9da0:	000cad83          	lw	s11,0(s9)
    9da4:	000d2903          	lw	s2,0(s10)
    9da8:	00048593          	mv	a1,s1
    9dac:	008df533          	and	a0,s11,s0
    9db0:	7e5040ef          	jal	ed94 <__mulsi3>
    9db4:	00897733          	and	a4,s2,s0
    9db8:	00e50733          	add	a4,a0,a4
    9dbc:	00048593          	mv	a1,s1
    9dc0:	010dd513          	srl	a0,s11,0x10
    9dc4:	01870c33          	add	s8,a4,s8
    9dc8:	01095913          	srl	s2,s2,0x10
    9dcc:	7c9040ef          	jal	ed94 <__mulsi3>
    9dd0:	010c5713          	srl	a4,s8,0x10
    9dd4:	01250533          	add	a0,a0,s2
    9dd8:	00e50533          	add	a0,a0,a4
    9ddc:	008c77b3          	and	a5,s8,s0
    9de0:	01051713          	sll	a4,a0,0x10
    9de4:	004d0d13          	add	s10,s10,4
    9de8:	00f767b3          	or	a5,a4,a5
    9dec:	004c8c93          	add	s9,s9,4
    9df0:	fefd2e23          	sw	a5,-4(s10)
    9df4:	01055c13          	srl	s8,a0,0x10
    9df8:	fb3ce4e3          	bltu	s9,s3,9da0 <__multiply+0x114>
    9dfc:	00412783          	lw	a5,4(sp)
    9e00:	00fb0733          	add	a4,s6,a5
    9e04:	01872023          	sw	s8,0(a4)
    9e08:	000a2903          	lw	s2,0(s4)
    9e0c:	01095913          	srl	s2,s2,0x10
    9e10:	f60904e3          	beqz	s2,9d78 <__multiply+0xec>
    9e14:	000b2c83          	lw	s9,0(s6)
    9e18:	00812d03          	lw	s10,8(sp)
    9e1c:	000b0c13          	mv	s8,s6
    9e20:	000c8493          	mv	s1,s9
    9e24:	00000d93          	li	s11,0
    9e28:	000d2503          	lw	a0,0(s10)
    9e2c:	00090593          	mv	a1,s2
    9e30:	0104d493          	srl	s1,s1,0x10
    9e34:	00857533          	and	a0,a0,s0
    9e38:	75d040ef          	jal	ed94 <__mulsi3>
    9e3c:	01b50733          	add	a4,a0,s11
    9e40:	00970db3          	add	s11,a4,s1
    9e44:	010d9593          	sll	a1,s11,0x10
    9e48:	008cf7b3          	and	a5,s9,s0
    9e4c:	00f5e7b3          	or	a5,a1,a5
    9e50:	00fc2023          	sw	a5,0(s8)
    9e54:	002d5503          	lhu	a0,2(s10)
    9e58:	004c2483          	lw	s1,4(s8)
    9e5c:	00090593          	mv	a1,s2
    9e60:	735040ef          	jal	ed94 <__mulsi3>
    9e64:	0084f7b3          	and	a5,s1,s0
    9e68:	010dd713          	srl	a4,s11,0x10
    9e6c:	00f507b3          	add	a5,a0,a5
    9e70:	004d0d13          	add	s10,s10,4
    9e74:	00e78cb3          	add	s9,a5,a4
    9e78:	004c0c13          	add	s8,s8,4
    9e7c:	010cdd93          	srl	s11,s9,0x10
    9e80:	fb3d64e3          	bltu	s10,s3,9e28 <__multiply+0x19c>
    9e84:	00412783          	lw	a5,4(sp)
    9e88:	004a0a13          	add	s4,s4,4
    9e8c:	00fb0733          	add	a4,s6,a5
    9e90:	00012783          	lw	a5,0(sp)
    9e94:	01972023          	sw	s9,0(a4)
    9e98:	004b0b13          	add	s6,s6,4
    9e9c:	eefa66e3          	bltu	s4,a5,9d88 <__multiply+0xfc>
    9ea0:	04412483          	lw	s1,68(sp)
    9ea4:	04012903          	lw	s2,64(sp)
    9ea8:	02412c83          	lw	s9,36(sp)
    9eac:	02012d03          	lw	s10,32(sp)
    9eb0:	01c12d83          	lw	s11,28(sp)
    9eb4:	01704863          	bgtz	s7,9ec4 <__multiply+0x238>
    9eb8:	0180006f          	j	9ed0 <__multiply+0x244>
    9ebc:	fffb8b93          	add	s7,s7,-1
    9ec0:	000b8863          	beqz	s7,9ed0 <__multiply+0x244>
    9ec4:	ffcaa783          	lw	a5,-4(s5)
    9ec8:	ffca8a93          	add	s5,s5,-4
    9ecc:	fe0788e3          	beqz	a5,9ebc <__multiply+0x230>
    9ed0:	00c12783          	lw	a5,12(sp)
    9ed4:	04c12083          	lw	ra,76(sp)
    9ed8:	04812403          	lw	s0,72(sp)
    9edc:	0177a823          	sw	s7,16(a5)
    9ee0:	03412a83          	lw	s5,52(sp)
    9ee4:	03012b03          	lw	s6,48(sp)
    9ee8:	03c12983          	lw	s3,60(sp)
    9eec:	03812a03          	lw	s4,56(sp)
    9ef0:	02c12b83          	lw	s7,44(sp)
    9ef4:	02812c03          	lw	s8,40(sp)
    9ef8:	00078513          	mv	a0,a5
    9efc:	05010113          	add	sp,sp,80
    9f00:	00008067          	ret
    9f04:	408987b3          	sub	a5,s3,s0
    9f08:	feb78793          	add	a5,a5,-21
    9f0c:	ffc7f793          	and	a5,a5,-4
    9f10:	00478793          	add	a5,a5,4
    9f14:	00f12223          	sw	a5,4(sp)
    9f18:	e4dff06f          	j	9d64 <__multiply+0xd8>
    9f1c:	00005697          	auipc	a3,0x5
    9f20:	2a468693          	add	a3,a3,676 # f1c0 <__fini_array_end+0x234>
    9f24:	00000613          	li	a2,0
    9f28:	16200593          	li	a1,354
    9f2c:	00005517          	auipc	a0,0x5
    9f30:	32850513          	add	a0,a0,808 # f254 <__fini_array_end+0x2c8>
    9f34:	04912223          	sw	s1,68(sp)
    9f38:	05212023          	sw	s2,64(sp)
    9f3c:	03512a23          	sw	s5,52(sp)
    9f40:	03612823          	sw	s6,48(sp)
    9f44:	03912223          	sw	s9,36(sp)
    9f48:	03a12023          	sw	s10,32(sp)
    9f4c:	01b12e23          	sw	s11,28(sp)
    9f50:	0fc010ef          	jal	b04c <__assert_func>

00009f54 <__pow5mult>:
    9f54:	fe010113          	add	sp,sp,-32
    9f58:	00812c23          	sw	s0,24(sp)
    9f5c:	01212823          	sw	s2,16(sp)
    9f60:	01312623          	sw	s3,12(sp)
    9f64:	00112e23          	sw	ra,28(sp)
    9f68:	00367793          	and	a5,a2,3
    9f6c:	00060413          	mv	s0,a2
    9f70:	00050993          	mv	s3,a0
    9f74:	00058913          	mv	s2,a1
    9f78:	0a079c63          	bnez	a5,a030 <__pow5mult+0xdc>
    9f7c:	40245413          	sra	s0,s0,0x2
    9f80:	06040a63          	beqz	s0,9ff4 <__pow5mult+0xa0>
    9f84:	00912a23          	sw	s1,20(sp)
    9f88:	0409a483          	lw	s1,64(s3)
    9f8c:	0c048663          	beqz	s1,a058 <__pow5mult+0x104>
    9f90:	00147793          	and	a5,s0,1
    9f94:	02079063          	bnez	a5,9fb4 <__pow5mult+0x60>
    9f98:	40145413          	sra	s0,s0,0x1
    9f9c:	04040a63          	beqz	s0,9ff0 <__pow5mult+0x9c>
    9fa0:	0004a503          	lw	a0,0(s1)
    9fa4:	06050663          	beqz	a0,a010 <__pow5mult+0xbc>
    9fa8:	00050493          	mv	s1,a0
    9fac:	00147793          	and	a5,s0,1
    9fb0:	fe0784e3          	beqz	a5,9f98 <__pow5mult+0x44>
    9fb4:	00048613          	mv	a2,s1
    9fb8:	00090593          	mv	a1,s2
    9fbc:	00098513          	mv	a0,s3
    9fc0:	ccdff0ef          	jal	9c8c <__multiply>
    9fc4:	02090063          	beqz	s2,9fe4 <__pow5mult+0x90>
    9fc8:	00492703          	lw	a4,4(s2)
    9fcc:	0449a783          	lw	a5,68(s3)
    9fd0:	00271713          	sll	a4,a4,0x2
    9fd4:	00e787b3          	add	a5,a5,a4
    9fd8:	0007a703          	lw	a4,0(a5)
    9fdc:	00e92023          	sw	a4,0(s2)
    9fe0:	0127a023          	sw	s2,0(a5)
    9fe4:	40145413          	sra	s0,s0,0x1
    9fe8:	00050913          	mv	s2,a0
    9fec:	fa041ae3          	bnez	s0,9fa0 <__pow5mult+0x4c>
    9ff0:	01412483          	lw	s1,20(sp)
    9ff4:	01c12083          	lw	ra,28(sp)
    9ff8:	01812403          	lw	s0,24(sp)
    9ffc:	00c12983          	lw	s3,12(sp)
    a000:	00090513          	mv	a0,s2
    a004:	01012903          	lw	s2,16(sp)
    a008:	02010113          	add	sp,sp,32
    a00c:	00008067          	ret
    a010:	00048613          	mv	a2,s1
    a014:	00048593          	mv	a1,s1
    a018:	00098513          	mv	a0,s3
    a01c:	c71ff0ef          	jal	9c8c <__multiply>
    a020:	00a4a023          	sw	a0,0(s1)
    a024:	00052023          	sw	zero,0(a0)
    a028:	00050493          	mv	s1,a0
    a02c:	f81ff06f          	j	9fac <__pow5mult+0x58>
    a030:	fff78793          	add	a5,a5,-1
    a034:	00005717          	auipc	a4,0x5
    a038:	79470713          	add	a4,a4,1940 # f7c8 <p05.0>
    a03c:	00279793          	sll	a5,a5,0x2
    a040:	00f707b3          	add	a5,a4,a5
    a044:	0007a603          	lw	a2,0(a5)
    a048:	00000693          	li	a3,0
    a04c:	8b5ff0ef          	jal	9900 <__multadd>
    a050:	00050913          	mv	s2,a0
    a054:	f29ff06f          	j	9f7c <__pow5mult+0x28>
    a058:	00100593          	li	a1,1
    a05c:	00098513          	mv	a0,s3
    a060:	fc8ff0ef          	jal	9828 <_Balloc>
    a064:	00050493          	mv	s1,a0
    a068:	02050063          	beqz	a0,a088 <__pow5mult+0x134>
    a06c:	27100793          	li	a5,625
    a070:	00f52a23          	sw	a5,20(a0)
    a074:	00100793          	li	a5,1
    a078:	00f52823          	sw	a5,16(a0)
    a07c:	04a9a023          	sw	a0,64(s3)
    a080:	00052023          	sw	zero,0(a0)
    a084:	f0dff06f          	j	9f90 <__pow5mult+0x3c>
    a088:	00005697          	auipc	a3,0x5
    a08c:	13868693          	add	a3,a3,312 # f1c0 <__fini_array_end+0x234>
    a090:	00000613          	li	a2,0
    a094:	14500593          	li	a1,325
    a098:	00005517          	auipc	a0,0x5
    a09c:	1bc50513          	add	a0,a0,444 # f254 <__fini_array_end+0x2c8>
    a0a0:	7ad000ef          	jal	b04c <__assert_func>

0000a0a4 <__lshift>:
    a0a4:	fe010113          	add	sp,sp,-32
    a0a8:	01512223          	sw	s5,4(sp)
    a0ac:	0105aa83          	lw	s5,16(a1)
    a0b0:	0085a783          	lw	a5,8(a1)
    a0b4:	01312623          	sw	s3,12(sp)
    a0b8:	40565993          	sra	s3,a2,0x5
    a0bc:	01598ab3          	add	s5,s3,s5
    a0c0:	00812c23          	sw	s0,24(sp)
    a0c4:	00912a23          	sw	s1,20(sp)
    a0c8:	01212823          	sw	s2,16(sp)
    a0cc:	01412423          	sw	s4,8(sp)
    a0d0:	00112e23          	sw	ra,28(sp)
    a0d4:	001a8913          	add	s2,s5,1
    a0d8:	00058493          	mv	s1,a1
    a0dc:	00060413          	mv	s0,a2
    a0e0:	0045a583          	lw	a1,4(a1)
    a0e4:	00050a13          	mv	s4,a0
    a0e8:	0127d863          	bge	a5,s2,a0f8 <__lshift+0x54>
    a0ec:	00179793          	sll	a5,a5,0x1
    a0f0:	00158593          	add	a1,a1,1
    a0f4:	ff27cce3          	blt	a5,s2,a0ec <__lshift+0x48>
    a0f8:	000a0513          	mv	a0,s4
    a0fc:	f2cff0ef          	jal	9828 <_Balloc>
    a100:	10050c63          	beqz	a0,a218 <__lshift+0x174>
    a104:	01450813          	add	a6,a0,20
    a108:	03305463          	blez	s3,a130 <__lshift+0x8c>
    a10c:	00598993          	add	s3,s3,5
    a110:	00299993          	sll	s3,s3,0x2
    a114:	01350733          	add	a4,a0,s3
    a118:	00080793          	mv	a5,a6
    a11c:	00478793          	add	a5,a5,4
    a120:	fe07ae23          	sw	zero,-4(a5)
    a124:	fee79ce3          	bne	a5,a4,a11c <__lshift+0x78>
    a128:	fec98993          	add	s3,s3,-20
    a12c:	01380833          	add	a6,a6,s3
    a130:	0104a883          	lw	a7,16(s1)
    a134:	01448793          	add	a5,s1,20
    a138:	01f47613          	and	a2,s0,31
    a13c:	00289893          	sll	a7,a7,0x2
    a140:	011788b3          	add	a7,a5,a7
    a144:	0a060463          	beqz	a2,a1ec <__lshift+0x148>
    a148:	02000593          	li	a1,32
    a14c:	40c585b3          	sub	a1,a1,a2
    a150:	00080313          	mv	t1,a6
    a154:	00000693          	li	a3,0
    a158:	0007a703          	lw	a4,0(a5)
    a15c:	00430313          	add	t1,t1,4
    a160:	00478793          	add	a5,a5,4
    a164:	00c71733          	sll	a4,a4,a2
    a168:	00d76733          	or	a4,a4,a3
    a16c:	fee32e23          	sw	a4,-4(t1)
    a170:	ffc7a683          	lw	a3,-4(a5)
    a174:	00b6d6b3          	srl	a3,a3,a1
    a178:	ff17e0e3          	bltu	a5,a7,a158 <__lshift+0xb4>
    a17c:	01548793          	add	a5,s1,21
    a180:	00400713          	li	a4,4
    a184:	00f8ea63          	bltu	a7,a5,a198 <__lshift+0xf4>
    a188:	409887b3          	sub	a5,a7,s1
    a18c:	feb78793          	add	a5,a5,-21
    a190:	ffc7f793          	and	a5,a5,-4
    a194:	00478713          	add	a4,a5,4
    a198:	00e80833          	add	a6,a6,a4
    a19c:	00d82023          	sw	a3,0(a6)
    a1a0:	00069463          	bnez	a3,a1a8 <__lshift+0x104>
    a1a4:	000a8913          	mv	s2,s5
    a1a8:	0044a703          	lw	a4,4(s1)
    a1ac:	044a2783          	lw	a5,68(s4)
    a1b0:	01c12083          	lw	ra,28(sp)
    a1b4:	00271713          	sll	a4,a4,0x2
    a1b8:	00e787b3          	add	a5,a5,a4
    a1bc:	0007a703          	lw	a4,0(a5)
    a1c0:	01252823          	sw	s2,16(a0)
    a1c4:	01812403          	lw	s0,24(sp)
    a1c8:	00e4a023          	sw	a4,0(s1)
    a1cc:	0097a023          	sw	s1,0(a5)
    a1d0:	01012903          	lw	s2,16(sp)
    a1d4:	01412483          	lw	s1,20(sp)
    a1d8:	00c12983          	lw	s3,12(sp)
    a1dc:	00812a03          	lw	s4,8(sp)
    a1e0:	00412a83          	lw	s5,4(sp)
    a1e4:	02010113          	add	sp,sp,32
    a1e8:	00008067          	ret
    a1ec:	0007a703          	lw	a4,0(a5)
    a1f0:	00478793          	add	a5,a5,4
    a1f4:	00480813          	add	a6,a6,4
    a1f8:	fee82e23          	sw	a4,-4(a6)
    a1fc:	fb17f4e3          	bgeu	a5,a7,a1a4 <__lshift+0x100>
    a200:	0007a703          	lw	a4,0(a5)
    a204:	00478793          	add	a5,a5,4
    a208:	00480813          	add	a6,a6,4
    a20c:	fee82e23          	sw	a4,-4(a6)
    a210:	fd17eee3          	bltu	a5,a7,a1ec <__lshift+0x148>
    a214:	f91ff06f          	j	a1a4 <__lshift+0x100>
    a218:	00005697          	auipc	a3,0x5
    a21c:	fa868693          	add	a3,a3,-88 # f1c0 <__fini_array_end+0x234>
    a220:	00000613          	li	a2,0
    a224:	1de00593          	li	a1,478
    a228:	00005517          	auipc	a0,0x5
    a22c:	02c50513          	add	a0,a0,44 # f254 <__fini_array_end+0x2c8>
    a230:	61d000ef          	jal	b04c <__assert_func>

0000a234 <__mcmp>:
    a234:	01052703          	lw	a4,16(a0)
    a238:	0105a783          	lw	a5,16(a1)
    a23c:	00050813          	mv	a6,a0
    a240:	40f70533          	sub	a0,a4,a5
    a244:	04f71263          	bne	a4,a5,a288 <__mcmp+0x54>
    a248:	00279793          	sll	a5,a5,0x2
    a24c:	01480813          	add	a6,a6,20
    a250:	01458593          	add	a1,a1,20
    a254:	00f80733          	add	a4,a6,a5
    a258:	00f587b3          	add	a5,a1,a5
    a25c:	0080006f          	j	a264 <__mcmp+0x30>
    a260:	02e87463          	bgeu	a6,a4,a288 <__mcmp+0x54>
    a264:	ffc72603          	lw	a2,-4(a4)
    a268:	ffc7a683          	lw	a3,-4(a5)
    a26c:	ffc70713          	add	a4,a4,-4
    a270:	ffc78793          	add	a5,a5,-4
    a274:	fed606e3          	beq	a2,a3,a260 <__mcmp+0x2c>
    a278:	00100513          	li	a0,1
    a27c:	00d67663          	bgeu	a2,a3,a288 <__mcmp+0x54>
    a280:	fff00513          	li	a0,-1
    a284:	00008067          	ret
    a288:	00008067          	ret

0000a28c <__mdiff>:
    a28c:	0105a703          	lw	a4,16(a1)
    a290:	01062783          	lw	a5,16(a2)
    a294:	ff010113          	add	sp,sp,-16
    a298:	00812423          	sw	s0,8(sp)
    a29c:	00912223          	sw	s1,4(sp)
    a2a0:	00112623          	sw	ra,12(sp)
    a2a4:	01212023          	sw	s2,0(sp)
    a2a8:	00058413          	mv	s0,a1
    a2ac:	00060493          	mv	s1,a2
    a2b0:	40f706b3          	sub	a3,a4,a5
    a2b4:	18f71e63          	bne	a4,a5,a450 <__mdiff+0x1c4>
    a2b8:	00279693          	sll	a3,a5,0x2
    a2bc:	01458613          	add	a2,a1,20
    a2c0:	01448713          	add	a4,s1,20
    a2c4:	00d607b3          	add	a5,a2,a3
    a2c8:	00d70733          	add	a4,a4,a3
    a2cc:	0080006f          	j	a2d4 <__mdiff+0x48>
    a2d0:	18f67c63          	bgeu	a2,a5,a468 <__mdiff+0x1dc>
    a2d4:	ffc7a583          	lw	a1,-4(a5)
    a2d8:	ffc72683          	lw	a3,-4(a4)
    a2dc:	ffc78793          	add	a5,a5,-4
    a2e0:	ffc70713          	add	a4,a4,-4
    a2e4:	fed586e3          	beq	a1,a3,a2d0 <__mdiff+0x44>
    a2e8:	00100913          	li	s2,1
    a2ec:	00d5ea63          	bltu	a1,a3,a300 <__mdiff+0x74>
    a2f0:	00048793          	mv	a5,s1
    a2f4:	00000913          	li	s2,0
    a2f8:	00040493          	mv	s1,s0
    a2fc:	00078413          	mv	s0,a5
    a300:	0044a583          	lw	a1,4(s1)
    a304:	d24ff0ef          	jal	9828 <_Balloc>
    a308:	1a050663          	beqz	a0,a4b4 <__mdiff+0x228>
    a30c:	0104a883          	lw	a7,16(s1)
    a310:	01042283          	lw	t0,16(s0)
    a314:	01448f93          	add	t6,s1,20
    a318:	00289313          	sll	t1,a7,0x2
    a31c:	01440813          	add	a6,s0,20
    a320:	00229293          	sll	t0,t0,0x2
    a324:	01450593          	add	a1,a0,20
    a328:	00010e37          	lui	t3,0x10
    a32c:	01252623          	sw	s2,12(a0)
    a330:	006f8333          	add	t1,t6,t1
    a334:	005802b3          	add	t0,a6,t0
    a338:	00058f13          	mv	t5,a1
    a33c:	000f8e93          	mv	t4,t6
    a340:	00000693          	li	a3,0
    a344:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    a348:	000ea703          	lw	a4,0(t4)
    a34c:	00082603          	lw	a2,0(a6)
    a350:	004f0f13          	add	t5,t5,4
    a354:	01c777b3          	and	a5,a4,t3
    a358:	01c673b3          	and	t2,a2,t3
    a35c:	407787b3          	sub	a5,a5,t2
    a360:	00d787b3          	add	a5,a5,a3
    a364:	01075713          	srl	a4,a4,0x10
    a368:	01065613          	srl	a2,a2,0x10
    a36c:	4107d693          	sra	a3,a5,0x10
    a370:	40c70733          	sub	a4,a4,a2
    a374:	00d70733          	add	a4,a4,a3
    a378:	01071693          	sll	a3,a4,0x10
    a37c:	01c7f7b3          	and	a5,a5,t3
    a380:	00d7e7b3          	or	a5,a5,a3
    a384:	00480813          	add	a6,a6,4
    a388:	feff2e23          	sw	a5,-4(t5)
    a38c:	004e8e93          	add	t4,t4,4
    a390:	41075693          	sra	a3,a4,0x10
    a394:	fa586ae3          	bltu	a6,t0,a348 <__mdiff+0xbc>
    a398:	01540713          	add	a4,s0,21
    a39c:	40828433          	sub	s0,t0,s0
    a3a0:	feb40413          	add	s0,s0,-21
    a3a4:	00e2b2b3          	sltu	t0,t0,a4
    a3a8:	0012cf13          	xor	t5,t0,1
    a3ac:	00245413          	srl	s0,s0,0x2
    a3b0:	00400713          	li	a4,4
    a3b4:	0a028463          	beqz	t0,a45c <__mdiff+0x1d0>
    a3b8:	00ef8fb3          	add	t6,t6,a4
    a3bc:	00e58833          	add	a6,a1,a4
    a3c0:	00010eb7          	lui	t4,0x10
    a3c4:	00080e13          	mv	t3,a6
    a3c8:	000f8613          	mv	a2,t6
    a3cc:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    a3d0:	0c6ff463          	bgeu	t6,t1,a498 <__mdiff+0x20c>
    a3d4:	00062783          	lw	a5,0(a2)
    a3d8:	004e0e13          	add	t3,t3,4
    a3dc:	00460613          	add	a2,a2,4
    a3e0:	01d7f733          	and	a4,a5,t4
    a3e4:	00d70733          	add	a4,a4,a3
    a3e8:	0107d593          	srl	a1,a5,0x10
    a3ec:	41075713          	sra	a4,a4,0x10
    a3f0:	00b70733          	add	a4,a4,a1
    a3f4:	00d787b3          	add	a5,a5,a3
    a3f8:	01d7f7b3          	and	a5,a5,t4
    a3fc:	01071693          	sll	a3,a4,0x10
    a400:	00d7e7b3          	or	a5,a5,a3
    a404:	fefe2e23          	sw	a5,-4(t3)
    a408:	41075693          	sra	a3,a4,0x10
    a40c:	fc6664e3          	bltu	a2,t1,a3d4 <__mdiff+0x148>
    a410:	fff30313          	add	t1,t1,-1
    a414:	41f30333          	sub	t1,t1,t6
    a418:	ffc37313          	and	t1,t1,-4
    a41c:	00680733          	add	a4,a6,t1
    a420:	00079a63          	bnez	a5,a434 <__mdiff+0x1a8>
    a424:	ffc72783          	lw	a5,-4(a4)
    a428:	fff88893          	add	a7,a7,-1
    a42c:	ffc70713          	add	a4,a4,-4
    a430:	fe078ae3          	beqz	a5,a424 <__mdiff+0x198>
    a434:	00c12083          	lw	ra,12(sp)
    a438:	00812403          	lw	s0,8(sp)
    a43c:	01152823          	sw	a7,16(a0)
    a440:	00412483          	lw	s1,4(sp)
    a444:	00012903          	lw	s2,0(sp)
    a448:	01010113          	add	sp,sp,16
    a44c:	00008067          	ret
    a450:	00100913          	li	s2,1
    a454:	e806dee3          	bgez	a3,a2f0 <__mdiff+0x64>
    a458:	ea9ff06f          	j	a300 <__mdiff+0x74>
    a45c:	00140713          	add	a4,s0,1
    a460:	00271713          	sll	a4,a4,0x2
    a464:	f55ff06f          	j	a3b8 <__mdiff+0x12c>
    a468:	00000593          	li	a1,0
    a46c:	bbcff0ef          	jal	9828 <_Balloc>
    a470:	06050063          	beqz	a0,a4d0 <__mdiff+0x244>
    a474:	00c12083          	lw	ra,12(sp)
    a478:	00812403          	lw	s0,8(sp)
    a47c:	00100793          	li	a5,1
    a480:	00f52823          	sw	a5,16(a0)
    a484:	00052a23          	sw	zero,20(a0)
    a488:	00412483          	lw	s1,4(sp)
    a48c:	00012903          	lw	s2,0(sp)
    a490:	01010113          	add	sp,sp,16
    a494:	00008067          	ret
    a498:	00000713          	li	a4,0
    a49c:	000f1663          	bnez	t5,a4a8 <__mdiff+0x21c>
    a4a0:	00e58733          	add	a4,a1,a4
    a4a4:	f7dff06f          	j	a420 <__mdiff+0x194>
    a4a8:	00241713          	sll	a4,s0,0x2
    a4ac:	00e58733          	add	a4,a1,a4
    a4b0:	f71ff06f          	j	a420 <__mdiff+0x194>
    a4b4:	00005697          	auipc	a3,0x5
    a4b8:	d0c68693          	add	a3,a3,-756 # f1c0 <__fini_array_end+0x234>
    a4bc:	00000613          	li	a2,0
    a4c0:	24500593          	li	a1,581
    a4c4:	00005517          	auipc	a0,0x5
    a4c8:	d9050513          	add	a0,a0,-624 # f254 <__fini_array_end+0x2c8>
    a4cc:	381000ef          	jal	b04c <__assert_func>
    a4d0:	00005697          	auipc	a3,0x5
    a4d4:	cf068693          	add	a3,a3,-784 # f1c0 <__fini_array_end+0x234>
    a4d8:	00000613          	li	a2,0
    a4dc:	23700593          	li	a1,567
    a4e0:	00005517          	auipc	a0,0x5
    a4e4:	d7450513          	add	a0,a0,-652 # f254 <__fini_array_end+0x2c8>
    a4e8:	365000ef          	jal	b04c <__assert_func>

0000a4ec <__d2b>:
    a4ec:	fd010113          	add	sp,sp,-48
    a4f0:	01512a23          	sw	s5,20(sp)
    a4f4:	00058a93          	mv	s5,a1
    a4f8:	00100593          	li	a1,1
    a4fc:	02912223          	sw	s1,36(sp)
    a500:	01312e23          	sw	s3,28(sp)
    a504:	01412c23          	sw	s4,24(sp)
    a508:	02112623          	sw	ra,44(sp)
    a50c:	02812423          	sw	s0,40(sp)
    a510:	03212023          	sw	s2,32(sp)
    a514:	00060493          	mv	s1,a2
    a518:	00068a13          	mv	s4,a3
    a51c:	00070993          	mv	s3,a4
    a520:	b08ff0ef          	jal	9828 <_Balloc>
    a524:	10050263          	beqz	a0,a628 <__d2b+0x13c>
    a528:	00100737          	lui	a4,0x100
    a52c:	0144d913          	srl	s2,s1,0x14
    a530:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a534:	7ff97913          	and	s2,s2,2047
    a538:	00050413          	mv	s0,a0
    a53c:	0097f7b3          	and	a5,a5,s1
    a540:	00090463          	beqz	s2,a548 <__d2b+0x5c>
    a544:	00e7e7b3          	or	a5,a5,a4
    a548:	00f12623          	sw	a5,12(sp)
    a54c:	060a9263          	bnez	s5,a5b0 <__d2b+0xc4>
    a550:	00c10513          	add	a0,sp,12
    a554:	da8ff0ef          	jal	9afc <__lo0bits>
    a558:	00c12703          	lw	a4,12(sp)
    a55c:	00100493          	li	s1,1
    a560:	00942823          	sw	s1,16(s0)
    a564:	00e42a23          	sw	a4,20(s0)
    a568:	02050793          	add	a5,a0,32
    a56c:	08090863          	beqz	s2,a5fc <__d2b+0x110>
    a570:	bcd90913          	add	s2,s2,-1075
    a574:	00f90933          	add	s2,s2,a5
    a578:	03500493          	li	s1,53
    a57c:	012a2023          	sw	s2,0(s4)
    a580:	40f48533          	sub	a0,s1,a5
    a584:	00a9a023          	sw	a0,0(s3)
    a588:	02c12083          	lw	ra,44(sp)
    a58c:	00040513          	mv	a0,s0
    a590:	02812403          	lw	s0,40(sp)
    a594:	02412483          	lw	s1,36(sp)
    a598:	02012903          	lw	s2,32(sp)
    a59c:	01c12983          	lw	s3,28(sp)
    a5a0:	01812a03          	lw	s4,24(sp)
    a5a4:	01412a83          	lw	s5,20(sp)
    a5a8:	03010113          	add	sp,sp,48
    a5ac:	00008067          	ret
    a5b0:	00810513          	add	a0,sp,8
    a5b4:	01512423          	sw	s5,8(sp)
    a5b8:	d44ff0ef          	jal	9afc <__lo0bits>
    a5bc:	00c12703          	lw	a4,12(sp)
    a5c0:	00050793          	mv	a5,a0
    a5c4:	04050e63          	beqz	a0,a620 <__d2b+0x134>
    a5c8:	00812603          	lw	a2,8(sp)
    a5cc:	02000693          	li	a3,32
    a5d0:	40a686b3          	sub	a3,a3,a0
    a5d4:	00d716b3          	sll	a3,a4,a3
    a5d8:	00a75733          	srl	a4,a4,a0
    a5dc:	00c6e6b3          	or	a3,a3,a2
    a5e0:	00e12623          	sw	a4,12(sp)
    a5e4:	00e034b3          	snez	s1,a4
    a5e8:	00148493          	add	s1,s1,1
    a5ec:	00d42a23          	sw	a3,20(s0)
    a5f0:	00e42c23          	sw	a4,24(s0)
    a5f4:	00942823          	sw	s1,16(s0)
    a5f8:	f6091ce3          	bnez	s2,a570 <__d2b+0x84>
    a5fc:	00249713          	sll	a4,s1,0x2
    a600:	00e40733          	add	a4,s0,a4
    a604:	01072503          	lw	a0,16(a4)
    a608:	bce78793          	add	a5,a5,-1074
    a60c:	00fa2023          	sw	a5,0(s4)
    a610:	c74ff0ef          	jal	9a84 <__hi0bits>
    a614:	00549493          	sll	s1,s1,0x5
    a618:	40a48533          	sub	a0,s1,a0
    a61c:	f69ff06f          	j	a584 <__d2b+0x98>
    a620:	00812683          	lw	a3,8(sp)
    a624:	fc1ff06f          	j	a5e4 <__d2b+0xf8>
    a628:	00005697          	auipc	a3,0x5
    a62c:	b9868693          	add	a3,a3,-1128 # f1c0 <__fini_array_end+0x234>
    a630:	00000613          	li	a2,0
    a634:	30f00593          	li	a1,783
    a638:	00005517          	auipc	a0,0x5
    a63c:	c1c50513          	add	a0,a0,-996 # f254 <__fini_array_end+0x2c8>
    a640:	20d000ef          	jal	b04c <__assert_func>

0000a644 <_realloc_r>:
    a644:	fd010113          	add	sp,sp,-48
    a648:	02912223          	sw	s1,36(sp)
    a64c:	02112623          	sw	ra,44(sp)
    a650:	00060493          	mv	s1,a2
    a654:	1e058863          	beqz	a1,a844 <_realloc_r+0x200>
    a658:	02812423          	sw	s0,40(sp)
    a65c:	03212023          	sw	s2,32(sp)
    a660:	00058413          	mv	s0,a1
    a664:	01312e23          	sw	s3,28(sp)
    a668:	01512a23          	sw	s5,20(sp)
    a66c:	01412c23          	sw	s4,24(sp)
    a670:	00050913          	mv	s2,a0
    a674:	8b1f70ef          	jal	1f24 <__malloc_lock>
    a678:	ffc42703          	lw	a4,-4(s0)
    a67c:	00b48793          	add	a5,s1,11
    a680:	01600693          	li	a3,22
    a684:	ff840a93          	add	s5,s0,-8
    a688:	ffc77993          	and	s3,a4,-4
    a68c:	10f6f263          	bgeu	a3,a5,a790 <_realloc_r+0x14c>
    a690:	ff87fa13          	and	s4,a5,-8
    a694:	1007c263          	bltz	a5,a798 <_realloc_r+0x154>
    a698:	109a6063          	bltu	s4,s1,a798 <_realloc_r+0x154>
    a69c:	1349d263          	bge	s3,s4,a7c0 <_realloc_r+0x17c>
    a6a0:	01812423          	sw	s8,8(sp)
    a6a4:	7fff6c17          	auipc	s8,0x7fff6
    a6a8:	a7cc0c13          	add	s8,s8,-1412 # 80000120 <__malloc_av_>
    a6ac:	008c2603          	lw	a2,8(s8)
    a6b0:	013a86b3          	add	a3,s5,s3
    a6b4:	0046a783          	lw	a5,4(a3)
    a6b8:	1cd60863          	beq	a2,a3,a888 <_realloc_r+0x244>
    a6bc:	ffe7f613          	and	a2,a5,-2
    a6c0:	00c68633          	add	a2,a3,a2
    a6c4:	00462603          	lw	a2,4(a2)
    a6c8:	00167613          	and	a2,a2,1
    a6cc:	14061a63          	bnez	a2,a820 <_realloc_r+0x1dc>
    a6d0:	ffc7f793          	and	a5,a5,-4
    a6d4:	00f98633          	add	a2,s3,a5
    a6d8:	0d465863          	bge	a2,s4,a7a8 <_realloc_r+0x164>
    a6dc:	00177713          	and	a4,a4,1
    a6e0:	02071c63          	bnez	a4,a718 <_realloc_r+0xd4>
    a6e4:	01712623          	sw	s7,12(sp)
    a6e8:	ff842b83          	lw	s7,-8(s0)
    a6ec:	01612823          	sw	s6,16(sp)
    a6f0:	417a8bb3          	sub	s7,s5,s7
    a6f4:	004ba703          	lw	a4,4(s7)
    a6f8:	ffc77713          	and	a4,a4,-4
    a6fc:	00e787b3          	add	a5,a5,a4
    a700:	01378b33          	add	s6,a5,s3
    a704:	334b5c63          	bge	s6,s4,aa3c <_realloc_r+0x3f8>
    a708:	00e98b33          	add	s6,s3,a4
    a70c:	294b5863          	bge	s6,s4,a99c <_realloc_r+0x358>
    a710:	01012b03          	lw	s6,16(sp)
    a714:	00c12b83          	lw	s7,12(sp)
    a718:	00048593          	mv	a1,s1
    a71c:	00090513          	mv	a0,s2
    a720:	824f70ef          	jal	1744 <_malloc_r>
    a724:	00050493          	mv	s1,a0
    a728:	40050863          	beqz	a0,ab38 <_realloc_r+0x4f4>
    a72c:	ffc42783          	lw	a5,-4(s0)
    a730:	ff850713          	add	a4,a0,-8
    a734:	ffe7f793          	and	a5,a5,-2
    a738:	00fa87b3          	add	a5,s5,a5
    a73c:	24e78663          	beq	a5,a4,a988 <_realloc_r+0x344>
    a740:	ffc98613          	add	a2,s3,-4
    a744:	02400793          	li	a5,36
    a748:	2ec7e463          	bltu	a5,a2,aa30 <_realloc_r+0x3ec>
    a74c:	01300713          	li	a4,19
    a750:	20c76a63          	bltu	a4,a2,a964 <_realloc_r+0x320>
    a754:	00050793          	mv	a5,a0
    a758:	00040713          	mv	a4,s0
    a75c:	00072683          	lw	a3,0(a4)
    a760:	00d7a023          	sw	a3,0(a5)
    a764:	00472683          	lw	a3,4(a4)
    a768:	00d7a223          	sw	a3,4(a5)
    a76c:	00872703          	lw	a4,8(a4)
    a770:	00e7a423          	sw	a4,8(a5)
    a774:	00040593          	mv	a1,s0
    a778:	00090513          	mv	a0,s2
    a77c:	cbdf60ef          	jal	1438 <_free_r>
    a780:	00090513          	mv	a0,s2
    a784:	facf70ef          	jal	1f30 <__malloc_unlock>
    a788:	00812c03          	lw	s8,8(sp)
    a78c:	06c0006f          	j	a7f8 <_realloc_r+0x1b4>
    a790:	01000a13          	li	s4,16
    a794:	f09a74e3          	bgeu	s4,s1,a69c <_realloc_r+0x58>
    a798:	00c00793          	li	a5,12
    a79c:	00f92023          	sw	a5,0(s2)
    a7a0:	00000493          	li	s1,0
    a7a4:	0540006f          	j	a7f8 <_realloc_r+0x1b4>
    a7a8:	00c6a783          	lw	a5,12(a3)
    a7ac:	0086a703          	lw	a4,8(a3)
    a7b0:	00812c03          	lw	s8,8(sp)
    a7b4:	00060993          	mv	s3,a2
    a7b8:	00f72623          	sw	a5,12(a4)
    a7bc:	00e7a423          	sw	a4,8(a5)
    a7c0:	004aa783          	lw	a5,4(s5)
    a7c4:	414986b3          	sub	a3,s3,s4
    a7c8:	00f00613          	li	a2,15
    a7cc:	0017f793          	and	a5,a5,1
    a7d0:	013a8733          	add	a4,s5,s3
    a7d4:	08d66263          	bltu	a2,a3,a858 <_realloc_r+0x214>
    a7d8:	0137e7b3          	or	a5,a5,s3
    a7dc:	00faa223          	sw	a5,4(s5)
    a7e0:	00472783          	lw	a5,4(a4)
    a7e4:	0017e793          	or	a5,a5,1
    a7e8:	00f72223          	sw	a5,4(a4)
    a7ec:	00090513          	mv	a0,s2
    a7f0:	f40f70ef          	jal	1f30 <__malloc_unlock>
    a7f4:	00040493          	mv	s1,s0
    a7f8:	02812403          	lw	s0,40(sp)
    a7fc:	02c12083          	lw	ra,44(sp)
    a800:	02012903          	lw	s2,32(sp)
    a804:	01c12983          	lw	s3,28(sp)
    a808:	01812a03          	lw	s4,24(sp)
    a80c:	01412a83          	lw	s5,20(sp)
    a810:	00048513          	mv	a0,s1
    a814:	02412483          	lw	s1,36(sp)
    a818:	03010113          	add	sp,sp,48
    a81c:	00008067          	ret
    a820:	00177713          	and	a4,a4,1
    a824:	ee071ae3          	bnez	a4,a718 <_realloc_r+0xd4>
    a828:	01712623          	sw	s7,12(sp)
    a82c:	ff842b83          	lw	s7,-8(s0)
    a830:	01612823          	sw	s6,16(sp)
    a834:	417a8bb3          	sub	s7,s5,s7
    a838:	004ba703          	lw	a4,4(s7)
    a83c:	ffc77713          	and	a4,a4,-4
    a840:	ec9ff06f          	j	a708 <_realloc_r+0xc4>
    a844:	02c12083          	lw	ra,44(sp)
    a848:	02412483          	lw	s1,36(sp)
    a84c:	00060593          	mv	a1,a2
    a850:	03010113          	add	sp,sp,48
    a854:	ef1f606f          	j	1744 <_malloc_r>
    a858:	0147e7b3          	or	a5,a5,s4
    a85c:	00faa223          	sw	a5,4(s5)
    a860:	014a85b3          	add	a1,s5,s4
    a864:	0016e693          	or	a3,a3,1
    a868:	00d5a223          	sw	a3,4(a1)
    a86c:	00472783          	lw	a5,4(a4)
    a870:	00858593          	add	a1,a1,8
    a874:	00090513          	mv	a0,s2
    a878:	0017e793          	or	a5,a5,1
    a87c:	00f72223          	sw	a5,4(a4)
    a880:	bb9f60ef          	jal	1438 <_free_r>
    a884:	f69ff06f          	j	a7ec <_realloc_r+0x1a8>
    a888:	ffc7f793          	and	a5,a5,-4
    a88c:	013786b3          	add	a3,a5,s3
    a890:	010a0613          	add	a2,s4,16
    a894:	26c6d063          	bge	a3,a2,aaf4 <_realloc_r+0x4b0>
    a898:	00177713          	and	a4,a4,1
    a89c:	e6071ee3          	bnez	a4,a718 <_realloc_r+0xd4>
    a8a0:	01712623          	sw	s7,12(sp)
    a8a4:	ff842b83          	lw	s7,-8(s0)
    a8a8:	01612823          	sw	s6,16(sp)
    a8ac:	417a8bb3          	sub	s7,s5,s7
    a8b0:	004ba703          	lw	a4,4(s7)
    a8b4:	ffc77713          	and	a4,a4,-4
    a8b8:	00e787b3          	add	a5,a5,a4
    a8bc:	01378b33          	add	s6,a5,s3
    a8c0:	e4cb44e3          	blt	s6,a2,a708 <_realloc_r+0xc4>
    a8c4:	00cba783          	lw	a5,12(s7)
    a8c8:	008ba703          	lw	a4,8(s7)
    a8cc:	ffc98613          	add	a2,s3,-4
    a8d0:	02400693          	li	a3,36
    a8d4:	00f72623          	sw	a5,12(a4)
    a8d8:	00e7a423          	sw	a4,8(a5)
    a8dc:	008b8493          	add	s1,s7,8
    a8e0:	28c6e463          	bltu	a3,a2,ab68 <_realloc_r+0x524>
    a8e4:	01300713          	li	a4,19
    a8e8:	00048793          	mv	a5,s1
    a8ec:	02c77263          	bgeu	a4,a2,a910 <_realloc_r+0x2cc>
    a8f0:	00042703          	lw	a4,0(s0)
    a8f4:	01b00793          	li	a5,27
    a8f8:	00eba423          	sw	a4,8(s7)
    a8fc:	00442703          	lw	a4,4(s0)
    a900:	00eba623          	sw	a4,12(s7)
    a904:	26c7ea63          	bltu	a5,a2,ab78 <_realloc_r+0x534>
    a908:	00840413          	add	s0,s0,8
    a90c:	010b8793          	add	a5,s7,16
    a910:	00042703          	lw	a4,0(s0)
    a914:	00e7a023          	sw	a4,0(a5)
    a918:	00442703          	lw	a4,4(s0)
    a91c:	00e7a223          	sw	a4,4(a5)
    a920:	00842703          	lw	a4,8(s0)
    a924:	00e7a423          	sw	a4,8(a5)
    a928:	014b8733          	add	a4,s7,s4
    a92c:	414b07b3          	sub	a5,s6,s4
    a930:	00ec2423          	sw	a4,8(s8)
    a934:	0017e793          	or	a5,a5,1
    a938:	00f72223          	sw	a5,4(a4)
    a93c:	004ba783          	lw	a5,4(s7)
    a940:	00090513          	mv	a0,s2
    a944:	0017f793          	and	a5,a5,1
    a948:	0147e7b3          	or	a5,a5,s4
    a94c:	00fba223          	sw	a5,4(s7)
    a950:	de0f70ef          	jal	1f30 <__malloc_unlock>
    a954:	01012b03          	lw	s6,16(sp)
    a958:	00c12b83          	lw	s7,12(sp)
    a95c:	00812c03          	lw	s8,8(sp)
    a960:	e99ff06f          	j	a7f8 <_realloc_r+0x1b4>
    a964:	00042683          	lw	a3,0(s0)
    a968:	01b00713          	li	a4,27
    a96c:	00d52023          	sw	a3,0(a0)
    a970:	00442683          	lw	a3,4(s0)
    a974:	00d52223          	sw	a3,4(a0)
    a978:	14c76e63          	bltu	a4,a2,aad4 <_realloc_r+0x490>
    a97c:	00840713          	add	a4,s0,8
    a980:	00850793          	add	a5,a0,8
    a984:	dd9ff06f          	j	a75c <_realloc_r+0x118>
    a988:	ffc52783          	lw	a5,-4(a0)
    a98c:	00812c03          	lw	s8,8(sp)
    a990:	ffc7f793          	and	a5,a5,-4
    a994:	00f989b3          	add	s3,s3,a5
    a998:	e29ff06f          	j	a7c0 <_realloc_r+0x17c>
    a99c:	00cba783          	lw	a5,12(s7)
    a9a0:	008ba703          	lw	a4,8(s7)
    a9a4:	ffc98613          	add	a2,s3,-4
    a9a8:	02400693          	li	a3,36
    a9ac:	00f72623          	sw	a5,12(a4)
    a9b0:	00e7a423          	sw	a4,8(a5)
    a9b4:	008b8493          	add	s1,s7,8
    a9b8:	10c6e663          	bltu	a3,a2,aac4 <_realloc_r+0x480>
    a9bc:	01300713          	li	a4,19
    a9c0:	00048793          	mv	a5,s1
    a9c4:	02c77c63          	bgeu	a4,a2,a9fc <_realloc_r+0x3b8>
    a9c8:	00042703          	lw	a4,0(s0)
    a9cc:	01b00793          	li	a5,27
    a9d0:	00eba423          	sw	a4,8(s7)
    a9d4:	00442703          	lw	a4,4(s0)
    a9d8:	00eba623          	sw	a4,12(s7)
    a9dc:	14c7f863          	bgeu	a5,a2,ab2c <_realloc_r+0x4e8>
    a9e0:	00842783          	lw	a5,8(s0)
    a9e4:	00fba823          	sw	a5,16(s7)
    a9e8:	00c42783          	lw	a5,12(s0)
    a9ec:	00fbaa23          	sw	a5,20(s7)
    a9f0:	0ad60c63          	beq	a2,a3,aaa8 <_realloc_r+0x464>
    a9f4:	01040413          	add	s0,s0,16
    a9f8:	018b8793          	add	a5,s7,24
    a9fc:	00042703          	lw	a4,0(s0)
    aa00:	00e7a023          	sw	a4,0(a5)
    aa04:	00442703          	lw	a4,4(s0)
    aa08:	00e7a223          	sw	a4,4(a5)
    aa0c:	00842703          	lw	a4,8(s0)
    aa10:	00e7a423          	sw	a4,8(a5)
    aa14:	000b0993          	mv	s3,s6
    aa18:	000b8a93          	mv	s5,s7
    aa1c:	01012b03          	lw	s6,16(sp)
    aa20:	00c12b83          	lw	s7,12(sp)
    aa24:	00812c03          	lw	s8,8(sp)
    aa28:	00048413          	mv	s0,s1
    aa2c:	d95ff06f          	j	a7c0 <_realloc_r+0x17c>
    aa30:	00040593          	mv	a1,s0
    aa34:	ae8fd0ef          	jal	7d1c <memmove>
    aa38:	d3dff06f          	j	a774 <_realloc_r+0x130>
    aa3c:	00c6a783          	lw	a5,12(a3)
    aa40:	0086a703          	lw	a4,8(a3)
    aa44:	ffc98613          	add	a2,s3,-4
    aa48:	02400693          	li	a3,36
    aa4c:	00f72623          	sw	a5,12(a4)
    aa50:	00e7a423          	sw	a4,8(a5)
    aa54:	008ba703          	lw	a4,8(s7)
    aa58:	00cba783          	lw	a5,12(s7)
    aa5c:	008b8493          	add	s1,s7,8
    aa60:	00f72623          	sw	a5,12(a4)
    aa64:	00e7a423          	sw	a4,8(a5)
    aa68:	04c6ee63          	bltu	a3,a2,aac4 <_realloc_r+0x480>
    aa6c:	01300713          	li	a4,19
    aa70:	00048793          	mv	a5,s1
    aa74:	f8c774e3          	bgeu	a4,a2,a9fc <_realloc_r+0x3b8>
    aa78:	00042703          	lw	a4,0(s0)
    aa7c:	01b00793          	li	a5,27
    aa80:	00eba423          	sw	a4,8(s7)
    aa84:	00442703          	lw	a4,4(s0)
    aa88:	00eba623          	sw	a4,12(s7)
    aa8c:	0ac7f063          	bgeu	a5,a2,ab2c <_realloc_r+0x4e8>
    aa90:	00842703          	lw	a4,8(s0)
    aa94:	02400793          	li	a5,36
    aa98:	00eba823          	sw	a4,16(s7)
    aa9c:	00c42703          	lw	a4,12(s0)
    aaa0:	00ebaa23          	sw	a4,20(s7)
    aaa4:	f4f618e3          	bne	a2,a5,a9f4 <_realloc_r+0x3b0>
    aaa8:	01042703          	lw	a4,16(s0)
    aaac:	020b8793          	add	a5,s7,32
    aab0:	01840413          	add	s0,s0,24
    aab4:	00ebac23          	sw	a4,24(s7)
    aab8:	ffc42703          	lw	a4,-4(s0)
    aabc:	00ebae23          	sw	a4,28(s7)
    aac0:	f3dff06f          	j	a9fc <_realloc_r+0x3b8>
    aac4:	00040593          	mv	a1,s0
    aac8:	00048513          	mv	a0,s1
    aacc:	a50fd0ef          	jal	7d1c <memmove>
    aad0:	f45ff06f          	j	aa14 <_realloc_r+0x3d0>
    aad4:	00842703          	lw	a4,8(s0)
    aad8:	00e52423          	sw	a4,8(a0)
    aadc:	00c42703          	lw	a4,12(s0)
    aae0:	00e52623          	sw	a4,12(a0)
    aae4:	06f60463          	beq	a2,a5,ab4c <_realloc_r+0x508>
    aae8:	01040713          	add	a4,s0,16
    aaec:	01050793          	add	a5,a0,16
    aaf0:	c6dff06f          	j	a75c <_realloc_r+0x118>
    aaf4:	014a8ab3          	add	s5,s5,s4
    aaf8:	414687b3          	sub	a5,a3,s4
    aafc:	015c2423          	sw	s5,8(s8)
    ab00:	0017e793          	or	a5,a5,1
    ab04:	00faa223          	sw	a5,4(s5)
    ab08:	ffc42783          	lw	a5,-4(s0)
    ab0c:	00090513          	mv	a0,s2
    ab10:	00040493          	mv	s1,s0
    ab14:	0017f793          	and	a5,a5,1
    ab18:	0147e7b3          	or	a5,a5,s4
    ab1c:	fef42e23          	sw	a5,-4(s0)
    ab20:	c10f70ef          	jal	1f30 <__malloc_unlock>
    ab24:	00812c03          	lw	s8,8(sp)
    ab28:	cd1ff06f          	j	a7f8 <_realloc_r+0x1b4>
    ab2c:	00840413          	add	s0,s0,8
    ab30:	010b8793          	add	a5,s7,16
    ab34:	ec9ff06f          	j	a9fc <_realloc_r+0x3b8>
    ab38:	00090513          	mv	a0,s2
    ab3c:	bf4f70ef          	jal	1f30 <__malloc_unlock>
    ab40:	00000493          	li	s1,0
    ab44:	00812c03          	lw	s8,8(sp)
    ab48:	cb1ff06f          	j	a7f8 <_realloc_r+0x1b4>
    ab4c:	01042683          	lw	a3,16(s0)
    ab50:	01840713          	add	a4,s0,24
    ab54:	01850793          	add	a5,a0,24
    ab58:	00d52823          	sw	a3,16(a0)
    ab5c:	01442683          	lw	a3,20(s0)
    ab60:	00d52a23          	sw	a3,20(a0)
    ab64:	bf9ff06f          	j	a75c <_realloc_r+0x118>
    ab68:	00040593          	mv	a1,s0
    ab6c:	00048513          	mv	a0,s1
    ab70:	9acfd0ef          	jal	7d1c <memmove>
    ab74:	db5ff06f          	j	a928 <_realloc_r+0x2e4>
    ab78:	00842783          	lw	a5,8(s0)
    ab7c:	00fba823          	sw	a5,16(s7)
    ab80:	00c42783          	lw	a5,12(s0)
    ab84:	00fbaa23          	sw	a5,20(s7)
    ab88:	00d60863          	beq	a2,a3,ab98 <_realloc_r+0x554>
    ab8c:	01040413          	add	s0,s0,16
    ab90:	018b8793          	add	a5,s7,24
    ab94:	d7dff06f          	j	a910 <_realloc_r+0x2cc>
    ab98:	01042703          	lw	a4,16(s0)
    ab9c:	020b8793          	add	a5,s7,32
    aba0:	01840413          	add	s0,s0,24
    aba4:	00ebac23          	sw	a4,24(s7)
    aba8:	ffc42703          	lw	a4,-4(s0)
    abac:	00ebae23          	sw	a4,28(s7)
    abb0:	d61ff06f          	j	a910 <_realloc_r+0x2cc>

0000abb4 <__ascii_wctomb>:
    abb4:	02058463          	beqz	a1,abdc <__ascii_wctomb+0x28>
    abb8:	0ff00793          	li	a5,255
    abbc:	00c7e863          	bltu	a5,a2,abcc <__ascii_wctomb+0x18>
    abc0:	00c58023          	sb	a2,0(a1)
    abc4:	00100513          	li	a0,1
    abc8:	00008067          	ret
    abcc:	08a00793          	li	a5,138
    abd0:	00f52023          	sw	a5,0(a0)
    abd4:	fff00513          	li	a0,-1
    abd8:	00008067          	ret
    abdc:	00000513          	li	a0,0
    abe0:	00008067          	ret

0000abe4 <_wcrtomb_r>:
    abe4:	fe010113          	add	sp,sp,-32
    abe8:	00812c23          	sw	s0,24(sp)
    abec:	00912a23          	sw	s1,20(sp)
    abf0:	00112e23          	sw	ra,28(sp)
    abf4:	00050493          	mv	s1,a0
    abf8:	10450413          	add	s0,a0,260
    abfc:	00068463          	beqz	a3,ac04 <_wcrtomb_r+0x20>
    ac00:	00068413          	mv	s0,a3
    ac04:	7fff6797          	auipc	a5,0x7fff6
    ac08:	a107a783          	lw	a5,-1520(a5) # 80000614 <__global_locale+0xe0>
    ac0c:	00040693          	mv	a3,s0
    ac10:	02058463          	beqz	a1,ac38 <_wcrtomb_r+0x54>
    ac14:	00048513          	mv	a0,s1
    ac18:	000780e7          	jalr	a5
    ac1c:	fff00793          	li	a5,-1
    ac20:	02f50863          	beq	a0,a5,ac50 <_wcrtomb_r+0x6c>
    ac24:	01c12083          	lw	ra,28(sp)
    ac28:	01812403          	lw	s0,24(sp)
    ac2c:	01412483          	lw	s1,20(sp)
    ac30:	02010113          	add	sp,sp,32
    ac34:	00008067          	ret
    ac38:	00000613          	li	a2,0
    ac3c:	00410593          	add	a1,sp,4
    ac40:	00048513          	mv	a0,s1
    ac44:	000780e7          	jalr	a5
    ac48:	fff00793          	li	a5,-1
    ac4c:	fcf51ce3          	bne	a0,a5,ac24 <_wcrtomb_r+0x40>
    ac50:	00042023          	sw	zero,0(s0)
    ac54:	01c12083          	lw	ra,28(sp)
    ac58:	01812403          	lw	s0,24(sp)
    ac5c:	08a00793          	li	a5,138
    ac60:	00f4a023          	sw	a5,0(s1)
    ac64:	01412483          	lw	s1,20(sp)
    ac68:	02010113          	add	sp,sp,32
    ac6c:	00008067          	ret

0000ac70 <_wcsrtombs_r>:
    ac70:	00070793          	mv	a5,a4
    ac74:	00068713          	mv	a4,a3
    ac78:	fff00693          	li	a3,-1
    ac7c:	7a40006f          	j	b420 <_wcsnrtombs_r>

0000ac80 <_fclose_r>:
    ac80:	ff010113          	add	sp,sp,-16
    ac84:	00112623          	sw	ra,12(sp)
    ac88:	01212023          	sw	s2,0(sp)
    ac8c:	0e058263          	beqz	a1,ad70 <_fclose_r+0xf0>
    ac90:	00812423          	sw	s0,8(sp)
    ac94:	00912223          	sw	s1,4(sp)
    ac98:	00058413          	mv	s0,a1
    ac9c:	00050493          	mv	s1,a0
    aca0:	00050663          	beqz	a0,acac <_fclose_r+0x2c>
    aca4:	03452783          	lw	a5,52(a0)
    aca8:	10078063          	beqz	a5,ada8 <_fclose_r+0x128>
    acac:	06442783          	lw	a5,100(s0)
    acb0:	00c41703          	lh	a4,12(s0)
    acb4:	0017f793          	and	a5,a5,1
    acb8:	0a079663          	bnez	a5,ad64 <_fclose_r+0xe4>
    acbc:	20077713          	and	a4,a4,512
    acc0:	0e070863          	beqz	a4,adb0 <_fclose_r+0x130>
    acc4:	00040593          	mv	a1,s0
    acc8:	00048513          	mv	a0,s1
    accc:	9f5fb0ef          	jal	66c0 <__sflush_r>
    acd0:	02c42783          	lw	a5,44(s0)
    acd4:	00050913          	mv	s2,a0
    acd8:	00078a63          	beqz	a5,acec <_fclose_r+0x6c>
    acdc:	01c42583          	lw	a1,28(s0)
    ace0:	00048513          	mv	a0,s1
    ace4:	000780e7          	jalr	a5
    ace8:	0a054063          	bltz	a0,ad88 <_fclose_r+0x108>
    acec:	00c45783          	lhu	a5,12(s0)
    acf0:	0807f793          	and	a5,a5,128
    acf4:	0a079263          	bnez	a5,ad98 <_fclose_r+0x118>
    acf8:	03042583          	lw	a1,48(s0)
    acfc:	00058c63          	beqz	a1,ad14 <_fclose_r+0x94>
    ad00:	04040793          	add	a5,s0,64
    ad04:	00f58663          	beq	a1,a5,ad10 <_fclose_r+0x90>
    ad08:	00048513          	mv	a0,s1
    ad0c:	f2cf60ef          	jal	1438 <_free_r>
    ad10:	02042823          	sw	zero,48(s0)
    ad14:	04442583          	lw	a1,68(s0)
    ad18:	00058863          	beqz	a1,ad28 <_fclose_r+0xa8>
    ad1c:	00048513          	mv	a0,s1
    ad20:	f18f60ef          	jal	1438 <_free_r>
    ad24:	04042223          	sw	zero,68(s0)
    ad28:	f51fb0ef          	jal	6c78 <__sfp_lock_acquire>
    ad2c:	06442783          	lw	a5,100(s0)
    ad30:	00041623          	sh	zero,12(s0)
    ad34:	0017f793          	and	a5,a5,1
    ad38:	0a078663          	beqz	a5,ade4 <_fclose_r+0x164>
    ad3c:	05842503          	lw	a0,88(s0)
    ad40:	a9cf60ef          	jal	fdc <__retarget_lock_close_recursive>
    ad44:	f41fb0ef          	jal	6c84 <__sfp_lock_release>
    ad48:	00c12083          	lw	ra,12(sp)
    ad4c:	00812403          	lw	s0,8(sp)
    ad50:	00412483          	lw	s1,4(sp)
    ad54:	00090513          	mv	a0,s2
    ad58:	00012903          	lw	s2,0(sp)
    ad5c:	01010113          	add	sp,sp,16
    ad60:	00008067          	ret
    ad64:	f60710e3          	bnez	a4,acc4 <_fclose_r+0x44>
    ad68:	00812403          	lw	s0,8(sp)
    ad6c:	00412483          	lw	s1,4(sp)
    ad70:	00000913          	li	s2,0
    ad74:	00c12083          	lw	ra,12(sp)
    ad78:	00090513          	mv	a0,s2
    ad7c:	00012903          	lw	s2,0(sp)
    ad80:	01010113          	add	sp,sp,16
    ad84:	00008067          	ret
    ad88:	00c45783          	lhu	a5,12(s0)
    ad8c:	fff00913          	li	s2,-1
    ad90:	0807f793          	and	a5,a5,128
    ad94:	f60782e3          	beqz	a5,acf8 <_fclose_r+0x78>
    ad98:	01042583          	lw	a1,16(s0)
    ad9c:	00048513          	mv	a0,s1
    ada0:	e98f60ef          	jal	1438 <_free_r>
    ada4:	f55ff06f          	j	acf8 <_fclose_r+0x78>
    ada8:	e61fb0ef          	jal	6c08 <__sinit>
    adac:	f01ff06f          	j	acac <_fclose_r+0x2c>
    adb0:	05842503          	lw	a0,88(s0)
    adb4:	a2cf60ef          	jal	fe0 <__retarget_lock_acquire_recursive>
    adb8:	00c41783          	lh	a5,12(s0)
    adbc:	f00794e3          	bnez	a5,acc4 <_fclose_r+0x44>
    adc0:	06442783          	lw	a5,100(s0)
    adc4:	0017f793          	and	a5,a5,1
    adc8:	fa0790e3          	bnez	a5,ad68 <_fclose_r+0xe8>
    adcc:	05842503          	lw	a0,88(s0)
    add0:	00000913          	li	s2,0
    add4:	a10f60ef          	jal	fe4 <__retarget_lock_release_recursive>
    add8:	00812403          	lw	s0,8(sp)
    addc:	00412483          	lw	s1,4(sp)
    ade0:	f95ff06f          	j	ad74 <_fclose_r+0xf4>
    ade4:	05842503          	lw	a0,88(s0)
    ade8:	9fcf60ef          	jal	fe4 <__retarget_lock_release_recursive>
    adec:	f51ff06f          	j	ad3c <_fclose_r+0xbc>

0000adf0 <__smakebuf_r>:
    adf0:	00c59783          	lh	a5,12(a1)
    adf4:	f8010113          	add	sp,sp,-128
    adf8:	06812c23          	sw	s0,120(sp)
    adfc:	06112e23          	sw	ra,124(sp)
    ae00:	0027f713          	and	a4,a5,2
    ae04:	00058413          	mv	s0,a1
    ae08:	02070463          	beqz	a4,ae30 <__smakebuf_r+0x40>
    ae0c:	04358793          	add	a5,a1,67
    ae10:	00f5a023          	sw	a5,0(a1)
    ae14:	00f5a823          	sw	a5,16(a1)
    ae18:	00100793          	li	a5,1
    ae1c:	00f5aa23          	sw	a5,20(a1)
    ae20:	07c12083          	lw	ra,124(sp)
    ae24:	07812403          	lw	s0,120(sp)
    ae28:	08010113          	add	sp,sp,128
    ae2c:	00008067          	ret
    ae30:	00e59583          	lh	a1,14(a1)
    ae34:	06912a23          	sw	s1,116(sp)
    ae38:	07212823          	sw	s2,112(sp)
    ae3c:	07312623          	sw	s3,108(sp)
    ae40:	07412423          	sw	s4,104(sp)
    ae44:	00050493          	mv	s1,a0
    ae48:	0805c663          	bltz	a1,aed4 <__smakebuf_r+0xe4>
    ae4c:	00810613          	add	a2,sp,8
    ae50:	138000ef          	jal	af88 <_fstat_r>
    ae54:	06054e63          	bltz	a0,aed0 <__smakebuf_r+0xe0>
    ae58:	00c12783          	lw	a5,12(sp)
    ae5c:	0000f937          	lui	s2,0xf
    ae60:	000019b7          	lui	s3,0x1
    ae64:	00f97933          	and	s2,s2,a5
    ae68:	ffffe7b7          	lui	a5,0xffffe
    ae6c:	00f90933          	add	s2,s2,a5
    ae70:	00193913          	seqz	s2,s2
    ae74:	40000a13          	li	s4,1024
    ae78:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    ae7c:	000a0593          	mv	a1,s4
    ae80:	00048513          	mv	a0,s1
    ae84:	8c1f60ef          	jal	1744 <_malloc_r>
    ae88:	00c41783          	lh	a5,12(s0)
    ae8c:	06050863          	beqz	a0,aefc <__smakebuf_r+0x10c>
    ae90:	0807e793          	or	a5,a5,128
    ae94:	00a42023          	sw	a0,0(s0)
    ae98:	00a42823          	sw	a0,16(s0)
    ae9c:	00f41623          	sh	a5,12(s0)
    aea0:	01442a23          	sw	s4,20(s0)
    aea4:	0a091063          	bnez	s2,af44 <__smakebuf_r+0x154>
    aea8:	0137e7b3          	or	a5,a5,s3
    aeac:	07c12083          	lw	ra,124(sp)
    aeb0:	00f41623          	sh	a5,12(s0)
    aeb4:	07812403          	lw	s0,120(sp)
    aeb8:	07412483          	lw	s1,116(sp)
    aebc:	07012903          	lw	s2,112(sp)
    aec0:	06c12983          	lw	s3,108(sp)
    aec4:	06812a03          	lw	s4,104(sp)
    aec8:	08010113          	add	sp,sp,128
    aecc:	00008067          	ret
    aed0:	00c41783          	lh	a5,12(s0)
    aed4:	0807f793          	and	a5,a5,128
    aed8:	00000913          	li	s2,0
    aedc:	04078e63          	beqz	a5,af38 <__smakebuf_r+0x148>
    aee0:	04000a13          	li	s4,64
    aee4:	000a0593          	mv	a1,s4
    aee8:	00048513          	mv	a0,s1
    aeec:	859f60ef          	jal	1744 <_malloc_r>
    aef0:	00c41783          	lh	a5,12(s0)
    aef4:	00000993          	li	s3,0
    aef8:	f8051ce3          	bnez	a0,ae90 <__smakebuf_r+0xa0>
    aefc:	2007f713          	and	a4,a5,512
    af00:	04071e63          	bnez	a4,af5c <__smakebuf_r+0x16c>
    af04:	ffc7f793          	and	a5,a5,-4
    af08:	0027e793          	or	a5,a5,2
    af0c:	04340713          	add	a4,s0,67
    af10:	00f41623          	sh	a5,12(s0)
    af14:	00100793          	li	a5,1
    af18:	07412483          	lw	s1,116(sp)
    af1c:	07012903          	lw	s2,112(sp)
    af20:	06c12983          	lw	s3,108(sp)
    af24:	06812a03          	lw	s4,104(sp)
    af28:	00e42023          	sw	a4,0(s0)
    af2c:	00e42823          	sw	a4,16(s0)
    af30:	00f42a23          	sw	a5,20(s0)
    af34:	eedff06f          	j	ae20 <__smakebuf_r+0x30>
    af38:	40000a13          	li	s4,1024
    af3c:	00000993          	li	s3,0
    af40:	f3dff06f          	j	ae7c <__smakebuf_r+0x8c>
    af44:	00e41583          	lh	a1,14(s0)
    af48:	00048513          	mv	a0,s1
    af4c:	09c000ef          	jal	afe8 <_isatty_r>
    af50:	02051063          	bnez	a0,af70 <__smakebuf_r+0x180>
    af54:	00c41783          	lh	a5,12(s0)
    af58:	f51ff06f          	j	aea8 <__smakebuf_r+0xb8>
    af5c:	07412483          	lw	s1,116(sp)
    af60:	07012903          	lw	s2,112(sp)
    af64:	06c12983          	lw	s3,108(sp)
    af68:	06812a03          	lw	s4,104(sp)
    af6c:	eb5ff06f          	j	ae20 <__smakebuf_r+0x30>
    af70:	00c45783          	lhu	a5,12(s0)
    af74:	ffc7f793          	and	a5,a5,-4
    af78:	0017e793          	or	a5,a5,1
    af7c:	01079793          	sll	a5,a5,0x10
    af80:	4107d793          	sra	a5,a5,0x10
    af84:	f25ff06f          	j	aea8 <__smakebuf_r+0xb8>

0000af88 <_fstat_r>:
    af88:	ff010113          	add	sp,sp,-16
    af8c:	00058713          	mv	a4,a1
    af90:	00812423          	sw	s0,8(sp)
    af94:	00060593          	mv	a1,a2
    af98:	00050413          	mv	s0,a0
    af9c:	00070513          	mv	a0,a4
    afa0:	7fff5797          	auipc	a5,0x7fff5
    afa4:	7607ac23          	sw	zero,1912(a5) # 80000718 <errno>
    afa8:	00112623          	sw	ra,12(sp)
    afac:	c15f50ef          	jal	bc0 <_fstat>
    afb0:	fff00793          	li	a5,-1
    afb4:	00f50a63          	beq	a0,a5,afc8 <_fstat_r+0x40>
    afb8:	00c12083          	lw	ra,12(sp)
    afbc:	00812403          	lw	s0,8(sp)
    afc0:	01010113          	add	sp,sp,16
    afc4:	00008067          	ret
    afc8:	7fff5797          	auipc	a5,0x7fff5
    afcc:	7507a783          	lw	a5,1872(a5) # 80000718 <errno>
    afd0:	fe0784e3          	beqz	a5,afb8 <_fstat_r+0x30>
    afd4:	00c12083          	lw	ra,12(sp)
    afd8:	00f42023          	sw	a5,0(s0)
    afdc:	00812403          	lw	s0,8(sp)
    afe0:	01010113          	add	sp,sp,16
    afe4:	00008067          	ret

0000afe8 <_isatty_r>:
    afe8:	ff010113          	add	sp,sp,-16
    afec:	00812423          	sw	s0,8(sp)
    aff0:	00050413          	mv	s0,a0
    aff4:	00058513          	mv	a0,a1
    aff8:	7fff5797          	auipc	a5,0x7fff5
    affc:	7207a023          	sw	zero,1824(a5) # 80000718 <errno>
    b000:	00112623          	sw	ra,12(sp)
    b004:	bd5f50ef          	jal	bd8 <_isatty>
    b008:	fff00793          	li	a5,-1
    b00c:	00f50a63          	beq	a0,a5,b020 <_isatty_r+0x38>
    b010:	00c12083          	lw	ra,12(sp)
    b014:	00812403          	lw	s0,8(sp)
    b018:	01010113          	add	sp,sp,16
    b01c:	00008067          	ret
    b020:	7fff5797          	auipc	a5,0x7fff5
    b024:	6f87a783          	lw	a5,1784(a5) # 80000718 <errno>
    b028:	fe0784e3          	beqz	a5,b010 <_isatty_r+0x28>
    b02c:	00c12083          	lw	ra,12(sp)
    b030:	00f42023          	sw	a5,0(s0)
    b034:	00812403          	lw	s0,8(sp)
    b038:	01010113          	add	sp,sp,16
    b03c:	00008067          	ret

0000b040 <__errno>:
    b040:	7fff5517          	auipc	a0,0x7fff5
    b044:	6c852503          	lw	a0,1736(a0) # 80000708 <_impure_ptr>
    b048:	00008067          	ret

0000b04c <__assert_func>:
    b04c:	ff010113          	add	sp,sp,-16
    b050:	00068793          	mv	a5,a3
    b054:	7fff5717          	auipc	a4,0x7fff5
    b058:	6b472703          	lw	a4,1716(a4) # 80000708 <_impure_ptr>
    b05c:	00060813          	mv	a6,a2
    b060:	00112623          	sw	ra,12(sp)
    b064:	00c72883          	lw	a7,12(a4)
    b068:	00078613          	mv	a2,a5
    b06c:	00050693          	mv	a3,a0
    b070:	00058713          	mv	a4,a1
    b074:	00004797          	auipc	a5,0x4
    b078:	26078793          	add	a5,a5,608 # f2d4 <__fini_array_end+0x348>
    b07c:	00080c63          	beqz	a6,b094 <__assert_func+0x48>
    b080:	00004597          	auipc	a1,0x4
    b084:	26458593          	add	a1,a1,612 # f2e4 <__fini_array_end+0x358>
    b088:	00088513          	mv	a0,a7
    b08c:	3a8000ef          	jal	b434 <fiprintf>
    b090:	3f0000ef          	jal	b480 <abort>
    b094:	00004797          	auipc	a5,0x4
    b098:	f5c78793          	add	a5,a5,-164 # eff0 <__fini_array_end+0x64>
    b09c:	00078813          	mv	a6,a5
    b0a0:	fe1ff06f          	j	b080 <__assert_func+0x34>

0000b0a4 <_calloc_r>:
    b0a4:	fe010113          	add	sp,sp,-32
    b0a8:	00812c23          	sw	s0,24(sp)
    b0ac:	00112e23          	sw	ra,28(sp)
    b0b0:	0105d693          	srl	a3,a1,0x10
    b0b4:	00058793          	mv	a5,a1
    b0b8:	00050413          	mv	s0,a0
    b0bc:	01065713          	srl	a4,a2,0x10
    b0c0:	0c069063          	bnez	a3,b180 <_calloc_r+0xdc>
    b0c4:	14071a63          	bnez	a4,b218 <_calloc_r+0x174>
    b0c8:	01061593          	sll	a1,a2,0x10
    b0cc:	01079513          	sll	a0,a5,0x10
    b0d0:	0105d593          	srl	a1,a1,0x10
    b0d4:	01055513          	srl	a0,a0,0x10
    b0d8:	4bd030ef          	jal	ed94 <__mulsi3>
    b0dc:	00050593          	mv	a1,a0
    b0e0:	00040513          	mv	a0,s0
    b0e4:	e60f60ef          	jal	1744 <_malloc_r>
    b0e8:	00050413          	mv	s0,a0
    b0ec:	10050a63          	beqz	a0,b200 <_calloc_r+0x15c>
    b0f0:	ffc52603          	lw	a2,-4(a0)
    b0f4:	02400713          	li	a4,36
    b0f8:	ffc67613          	and	a2,a2,-4
    b0fc:	ffc60613          	add	a2,a2,-4
    b100:	04c76863          	bltu	a4,a2,b150 <_calloc_r+0xac>
    b104:	01300693          	li	a3,19
    b108:	00050793          	mv	a5,a0
    b10c:	02c6f263          	bgeu	a3,a2,b130 <_calloc_r+0x8c>
    b110:	00052023          	sw	zero,0(a0)
    b114:	00052223          	sw	zero,4(a0)
    b118:	01b00793          	li	a5,27
    b11c:	04c7f863          	bgeu	a5,a2,b16c <_calloc_r+0xc8>
    b120:	00052423          	sw	zero,8(a0)
    b124:	00052623          	sw	zero,12(a0)
    b128:	01050793          	add	a5,a0,16
    b12c:	10e60263          	beq	a2,a4,b230 <_calloc_r+0x18c>
    b130:	0007a023          	sw	zero,0(a5)
    b134:	0007a223          	sw	zero,4(a5)
    b138:	0007a423          	sw	zero,8(a5)
    b13c:	01c12083          	lw	ra,28(sp)
    b140:	00040513          	mv	a0,s0
    b144:	01812403          	lw	s0,24(sp)
    b148:	02010113          	add	sp,sp,32
    b14c:	00008067          	ret
    b150:	00000593          	li	a1,0
    b154:	e95f50ef          	jal	fe8 <memset>
    b158:	01c12083          	lw	ra,28(sp)
    b15c:	00040513          	mv	a0,s0
    b160:	01812403          	lw	s0,24(sp)
    b164:	02010113          	add	sp,sp,32
    b168:	00008067          	ret
    b16c:	00850793          	add	a5,a0,8
    b170:	0007a023          	sw	zero,0(a5)
    b174:	0007a223          	sw	zero,4(a5)
    b178:	0007a423          	sw	zero,8(a5)
    b17c:	fc1ff06f          	j	b13c <_calloc_r+0x98>
    b180:	0c071663          	bnez	a4,b24c <_calloc_r+0x1a8>
    b184:	01212823          	sw	s2,16(sp)
    b188:	01312623          	sw	s3,12(sp)
    b18c:	00912a23          	sw	s1,20(sp)
    b190:	00068913          	mv	s2,a3
    b194:	00060993          	mv	s3,a2
    b198:	01079513          	sll	a0,a5,0x10
    b19c:	01061593          	sll	a1,a2,0x10
    b1a0:	0105d593          	srl	a1,a1,0x10
    b1a4:	01055513          	srl	a0,a0,0x10
    b1a8:	3ed030ef          	jal	ed94 <__mulsi3>
    b1ac:	00050493          	mv	s1,a0
    b1b0:	01091593          	sll	a1,s2,0x10
    b1b4:	01099513          	sll	a0,s3,0x10
    b1b8:	0105d593          	srl	a1,a1,0x10
    b1bc:	01055513          	srl	a0,a0,0x10
    b1c0:	3d5030ef          	jal	ed94 <__mulsi3>
    b1c4:	0104d793          	srl	a5,s1,0x10
    b1c8:	00f505b3          	add	a1,a0,a5
    b1cc:	0105d793          	srl	a5,a1,0x10
    b1d0:	06079863          	bnez	a5,b240 <_calloc_r+0x19c>
    b1d4:	01049493          	sll	s1,s1,0x10
    b1d8:	0104d493          	srl	s1,s1,0x10
    b1dc:	01059593          	sll	a1,a1,0x10
    b1e0:	0095e5b3          	or	a1,a1,s1
    b1e4:	00040513          	mv	a0,s0
    b1e8:	01412483          	lw	s1,20(sp)
    b1ec:	01012903          	lw	s2,16(sp)
    b1f0:	00c12983          	lw	s3,12(sp)
    b1f4:	d50f60ef          	jal	1744 <_malloc_r>
    b1f8:	00050413          	mv	s0,a0
    b1fc:	ee051ae3          	bnez	a0,b0f0 <_calloc_r+0x4c>
    b200:	00000413          	li	s0,0
    b204:	01c12083          	lw	ra,28(sp)
    b208:	00040513          	mv	a0,s0
    b20c:	01812403          	lw	s0,24(sp)
    b210:	02010113          	add	sp,sp,32
    b214:	00008067          	ret
    b218:	01212823          	sw	s2,16(sp)
    b21c:	01312623          	sw	s3,12(sp)
    b220:	00912a23          	sw	s1,20(sp)
    b224:	00070913          	mv	s2,a4
    b228:	00058993          	mv	s3,a1
    b22c:	f6dff06f          	j	b198 <_calloc_r+0xf4>
    b230:	00052823          	sw	zero,16(a0)
    b234:	01850793          	add	a5,a0,24
    b238:	00052a23          	sw	zero,20(a0)
    b23c:	ef5ff06f          	j	b130 <_calloc_r+0x8c>
    b240:	01412483          	lw	s1,20(sp)
    b244:	01012903          	lw	s2,16(sp)
    b248:	00c12983          	lw	s3,12(sp)
    b24c:	df5ff0ef          	jal	b040 <__errno>
    b250:	00c00793          	li	a5,12
    b254:	00f52023          	sw	a5,0(a0)
    b258:	00000413          	li	s0,0
    b25c:	fa9ff06f          	j	b204 <_calloc_r+0x160>

0000b260 <_wcsnrtombs_l>:
    b260:	fa010113          	add	sp,sp,-96
    b264:	04912a23          	sw	s1,84(sp)
    b268:	05212823          	sw	s2,80(sp)
    b26c:	05312623          	sw	s3,76(sp)
    b270:	05412423          	sw	s4,72(sp)
    b274:	05512223          	sw	s5,68(sp)
    b278:	04112e23          	sw	ra,92(sp)
    b27c:	03912a23          	sw	s9,52(sp)
    b280:	03a12823          	sw	s10,48(sp)
    b284:	00a12623          	sw	a0,12(sp)
    b288:	00058a13          	mv	s4,a1
    b28c:	00060a93          	mv	s5,a2
    b290:	00070913          	mv	s2,a4
    b294:	00080993          	mv	s3,a6
    b298:	00078493          	mv	s1,a5
    b29c:	12078063          	beqz	a5,b3bc <_wcsnrtombs_l+0x15c>
    b2a0:	000aac83          	lw	s9,0(s5)
    b2a4:	120a0263          	beqz	s4,b3c8 <_wcsnrtombs_l+0x168>
    b2a8:	14090e63          	beqz	s2,b404 <_wcsnrtombs_l+0x1a4>
    b2ac:	05612023          	sw	s6,64(sp)
    b2b0:	fff68b13          	add	s6,a3,-1
    b2b4:	16068063          	beqz	a3,b414 <_wcsnrtombs_l+0x1b4>
    b2b8:	04812c23          	sw	s0,88(sp)
    b2bc:	03b12623          	sw	s11,44(sp)
    b2c0:	03712e23          	sw	s7,60(sp)
    b2c4:	03812c23          	sw	s8,56(sp)
    b2c8:	000a0413          	mv	s0,s4
    b2cc:	00000d13          	li	s10,0
    b2d0:	fff00d93          	li	s11,-1
    b2d4:	0240006f          	j	b2f8 <_wcsnrtombs_l+0x98>
    b2d8:	080a1a63          	bnez	s4,b36c <_wcsnrtombs_l+0x10c>
    b2dc:	000ca783          	lw	a5,0(s9)
    b2e0:	004c8c93          	add	s9,s9,4
    b2e4:	0c078263          	beqz	a5,b3a8 <_wcsnrtombs_l+0x148>
    b2e8:	1326f263          	bgeu	a3,s2,b40c <_wcsnrtombs_l+0x1ac>
    b2ec:	fffb0b13          	add	s6,s6,-1
    b2f0:	00068d13          	mv	s10,a3
    b2f4:	03bb0c63          	beq	s6,s11,b32c <_wcsnrtombs_l+0xcc>
    b2f8:	0e09a783          	lw	a5,224(s3)
    b2fc:	000ca603          	lw	a2,0(s9)
    b300:	00c12503          	lw	a0,12(sp)
    b304:	00048693          	mv	a3,s1
    b308:	01410593          	add	a1,sp,20
    b30c:	0004ac03          	lw	s8,0(s1)
    b310:	0044ab83          	lw	s7,4(s1)
    b314:	000780e7          	jalr	a5
    b318:	0bb50e63          	beq	a0,s11,b3d4 <_wcsnrtombs_l+0x174>
    b31c:	01a506b3          	add	a3,a0,s10
    b320:	fad97ce3          	bgeu	s2,a3,b2d8 <_wcsnrtombs_l+0x78>
    b324:	0184a023          	sw	s8,0(s1)
    b328:	0174a223          	sw	s7,4(s1)
    b32c:	05812403          	lw	s0,88(sp)
    b330:	04012b03          	lw	s6,64(sp)
    b334:	03c12b83          	lw	s7,60(sp)
    b338:	03812c03          	lw	s8,56(sp)
    b33c:	02c12d83          	lw	s11,44(sp)
    b340:	05c12083          	lw	ra,92(sp)
    b344:	05412483          	lw	s1,84(sp)
    b348:	05012903          	lw	s2,80(sp)
    b34c:	04c12983          	lw	s3,76(sp)
    b350:	04812a03          	lw	s4,72(sp)
    b354:	04412a83          	lw	s5,68(sp)
    b358:	03412c83          	lw	s9,52(sp)
    b35c:	000d0513          	mv	a0,s10
    b360:	03012d03          	lw	s10,48(sp)
    b364:	06010113          	add	sp,sp,96
    b368:	00008067          	ret
    b36c:	08a05063          	blez	a0,b3ec <_wcsnrtombs_l+0x18c>
    b370:	01410893          	add	a7,sp,20
    b374:	00a40533          	add	a0,s0,a0
    b378:	0008c783          	lbu	a5,0(a7)
    b37c:	00140413          	add	s0,s0,1
    b380:	00188893          	add	a7,a7,1
    b384:	fef40fa3          	sb	a5,-1(s0)
    b388:	fe8518e3          	bne	a0,s0,b378 <_wcsnrtombs_l+0x118>
    b38c:	000aa783          	lw	a5,0(s5)
    b390:	00050413          	mv	s0,a0
    b394:	00478793          	add	a5,a5,4
    b398:	00faa023          	sw	a5,0(s5)
    b39c:	000ca783          	lw	a5,0(s9)
    b3a0:	004c8c93          	add	s9,s9,4
    b3a4:	f40792e3          	bnez	a5,b2e8 <_wcsnrtombs_l+0x88>
    b3a8:	000a0463          	beqz	s4,b3b0 <_wcsnrtombs_l+0x150>
    b3ac:	000aa023          	sw	zero,0(s5)
    b3b0:	0004a023          	sw	zero,0(s1)
    b3b4:	fff68d13          	add	s10,a3,-1
    b3b8:	f75ff06f          	j	b32c <_wcsnrtombs_l+0xcc>
    b3bc:	000aac83          	lw	s9,0(s5)
    b3c0:	10c50493          	add	s1,a0,268
    b3c4:	ee0a12e3          	bnez	s4,b2a8 <_wcsnrtombs_l+0x48>
    b3c8:	05612023          	sw	s6,64(sp)
    b3cc:	fff00913          	li	s2,-1
    b3d0:	ee1ff06f          	j	b2b0 <_wcsnrtombs_l+0x50>
    b3d4:	00c12703          	lw	a4,12(sp)
    b3d8:	08a00793          	li	a5,138
    b3dc:	fff00d13          	li	s10,-1
    b3e0:	00f72023          	sw	a5,0(a4)
    b3e4:	0004a023          	sw	zero,0(s1)
    b3e8:	f45ff06f          	j	b32c <_wcsnrtombs_l+0xcc>
    b3ec:	000aa783          	lw	a5,0(s5)
    b3f0:	00040513          	mv	a0,s0
    b3f4:	00050413          	mv	s0,a0
    b3f8:	00478793          	add	a5,a5,4
    b3fc:	00faa023          	sw	a5,0(s5)
    b400:	f9dff06f          	j	b39c <_wcsnrtombs_l+0x13c>
    b404:	00000d13          	li	s10,0
    b408:	f39ff06f          	j	b340 <_wcsnrtombs_l+0xe0>
    b40c:	00068d13          	mv	s10,a3
    b410:	f1dff06f          	j	b32c <_wcsnrtombs_l+0xcc>
    b414:	04012b03          	lw	s6,64(sp)
    b418:	00000d13          	li	s10,0
    b41c:	f25ff06f          	j	b340 <_wcsnrtombs_l+0xe0>

0000b420 <_wcsnrtombs_r>:
    b420:	7fff5817          	auipc	a6,0x7fff5
    b424:	11480813          	add	a6,a6,276 # 80000534 <__global_locale>
    b428:	7fff5517          	auipc	a0,0x7fff5
    b42c:	2e052503          	lw	a0,736(a0) # 80000708 <_impure_ptr>
    b430:	e31ff06f          	j	b260 <_wcsnrtombs_l>

0000b434 <fiprintf>:
    b434:	fc010113          	add	sp,sp,-64
    b438:	02810313          	add	t1,sp,40
    b43c:	02c12423          	sw	a2,40(sp)
    b440:	02d12623          	sw	a3,44(sp)
    b444:	00058613          	mv	a2,a1
    b448:	00030693          	mv	a3,t1
    b44c:	00050593          	mv	a1,a0
    b450:	7fff5517          	auipc	a0,0x7fff5
    b454:	2b852503          	lw	a0,696(a0) # 80000708 <_impure_ptr>
    b458:	00112e23          	sw	ra,28(sp)
    b45c:	02e12823          	sw	a4,48(sp)
    b460:	02f12a23          	sw	a5,52(sp)
    b464:	03012c23          	sw	a6,56(sp)
    b468:	03112e23          	sw	a7,60(sp)
    b46c:	00612623          	sw	t1,12(sp)
    b470:	9a1f90ef          	jal	4e10 <_vfiprintf_r>
    b474:	01c12083          	lw	ra,28(sp)
    b478:	04010113          	add	sp,sp,64
    b47c:	00008067          	ret

0000b480 <abort>:
    b480:	ff010113          	add	sp,sp,-16
    b484:	00600513          	li	a0,6
    b488:	00112623          	sw	ra,12(sp)
    b48c:	00c000ef          	jal	b498 <raise>
    b490:	00100513          	li	a0,1
    b494:	f14f50ef          	jal	ba8 <_exit>

0000b498 <raise>:
    b498:	ff010113          	add	sp,sp,-16
    b49c:	00912223          	sw	s1,4(sp)
    b4a0:	00112623          	sw	ra,12(sp)
    b4a4:	01f00793          	li	a5,31
    b4a8:	7fff5497          	auipc	s1,0x7fff5
    b4ac:	2604a483          	lw	s1,608(s1) # 80000708 <_impure_ptr>
    b4b0:	08a7ee63          	bltu	a5,a0,b54c <raise+0xb4>
    b4b4:	1184a783          	lw	a5,280(s1)
    b4b8:	00812423          	sw	s0,8(sp)
    b4bc:	00050413          	mv	s0,a0
    b4c0:	04078263          	beqz	a5,b504 <raise+0x6c>
    b4c4:	00251713          	sll	a4,a0,0x2
    b4c8:	00e787b3          	add	a5,a5,a4
    b4cc:	0007a703          	lw	a4,0(a5)
    b4d0:	02070a63          	beqz	a4,b504 <raise+0x6c>
    b4d4:	00100693          	li	a3,1
    b4d8:	00d70a63          	beq	a4,a3,b4ec <raise+0x54>
    b4dc:	fff00693          	li	a3,-1
    b4e0:	04d70663          	beq	a4,a3,b52c <raise+0x94>
    b4e4:	0007a023          	sw	zero,0(a5)
    b4e8:	000700e7          	jalr	a4
    b4ec:	00812403          	lw	s0,8(sp)
    b4f0:	00000513          	li	a0,0
    b4f4:	00c12083          	lw	ra,12(sp)
    b4f8:	00412483          	lw	s1,4(sp)
    b4fc:	01010113          	add	sp,sp,16
    b500:	00008067          	ret
    b504:	00048513          	mv	a0,s1
    b508:	0b4000ef          	jal	b5bc <_getpid_r>
    b50c:	00040613          	mv	a2,s0
    b510:	00812403          	lw	s0,8(sp)
    b514:	00c12083          	lw	ra,12(sp)
    b518:	00050593          	mv	a1,a0
    b51c:	00048513          	mv	a0,s1
    b520:	00412483          	lw	s1,4(sp)
    b524:	01010113          	add	sp,sp,16
    b528:	0340006f          	j	b55c <_kill_r>
    b52c:	00812403          	lw	s0,8(sp)
    b530:	00c12083          	lw	ra,12(sp)
    b534:	01600793          	li	a5,22
    b538:	00f4a023          	sw	a5,0(s1)
    b53c:	00100513          	li	a0,1
    b540:	00412483          	lw	s1,4(sp)
    b544:	01010113          	add	sp,sp,16
    b548:	00008067          	ret
    b54c:	01600793          	li	a5,22
    b550:	00f4a023          	sw	a5,0(s1)
    b554:	fff00513          	li	a0,-1
    b558:	f9dff06f          	j	b4f4 <raise+0x5c>

0000b55c <_kill_r>:
    b55c:	ff010113          	add	sp,sp,-16
    b560:	00058713          	mv	a4,a1
    b564:	00812423          	sw	s0,8(sp)
    b568:	00060593          	mv	a1,a2
    b56c:	00050413          	mv	s0,a0
    b570:	00070513          	mv	a0,a4
    b574:	7fff5797          	auipc	a5,0x7fff5
    b578:	1a07a223          	sw	zero,420(a5) # 80000718 <errno>
    b57c:	00112623          	sw	ra,12(sp)
    b580:	e60f50ef          	jal	be0 <_kill>
    b584:	fff00793          	li	a5,-1
    b588:	00f50a63          	beq	a0,a5,b59c <_kill_r+0x40>
    b58c:	00c12083          	lw	ra,12(sp)
    b590:	00812403          	lw	s0,8(sp)
    b594:	01010113          	add	sp,sp,16
    b598:	00008067          	ret
    b59c:	7fff5797          	auipc	a5,0x7fff5
    b5a0:	17c7a783          	lw	a5,380(a5) # 80000718 <errno>
    b5a4:	fe0784e3          	beqz	a5,b58c <_kill_r+0x30>
    b5a8:	00c12083          	lw	ra,12(sp)
    b5ac:	00f42023          	sw	a5,0(s0)
    b5b0:	00812403          	lw	s0,8(sp)
    b5b4:	01010113          	add	sp,sp,16
    b5b8:	00008067          	ret

0000b5bc <_getpid_r>:
    b5bc:	e14f506f          	j	bd0 <_getpid>

0000b5c0 <__udivdi3>:
    b5c0:	fd010113          	add	sp,sp,-48
    b5c4:	01312e23          	sw	s3,28(sp)
    b5c8:	02112623          	sw	ra,44(sp)
    b5cc:	01612823          	sw	s6,16(sp)
    b5d0:	00050993          	mv	s3,a0
    b5d4:	16069663          	bnez	a3,b740 <__udivdi3+0x180>
    b5d8:	02812423          	sw	s0,40(sp)
    b5dc:	01512a23          	sw	s5,20(sp)
    b5e0:	02912223          	sw	s1,36(sp)
    b5e4:	03212023          	sw	s2,32(sp)
    b5e8:	01412c23          	sw	s4,24(sp)
    b5ec:	00060a93          	mv	s5,a2
    b5f0:	00050413          	mv	s0,a0
    b5f4:	1cc5f063          	bgeu	a1,a2,b7b4 <__udivdi3+0x1f4>
    b5f8:	000107b7          	lui	a5,0x10
    b5fc:	00058493          	mv	s1,a1
    b600:	2af66e63          	bltu	a2,a5,b8bc <__udivdi3+0x2fc>
    b604:	010007b7          	lui	a5,0x1000
    b608:	01800713          	li	a4,24
    b60c:	00f67463          	bgeu	a2,a5,b614 <__udivdi3+0x54>
    b610:	01000713          	li	a4,16
    b614:	00e656b3          	srl	a3,a2,a4
    b618:	00004797          	auipc	a5,0x4
    b61c:	2f078793          	add	a5,a5,752 # f908 <__clz_tab>
    b620:	00d787b3          	add	a5,a5,a3
    b624:	0007c783          	lbu	a5,0(a5)
    b628:	02000693          	li	a3,32
    b62c:	00e787b3          	add	a5,a5,a4
    b630:	40f68733          	sub	a4,a3,a5
    b634:	00f68c63          	beq	a3,a5,b64c <__udivdi3+0x8c>
    b638:	00e594b3          	sll	s1,a1,a4
    b63c:	00f9d7b3          	srl	a5,s3,a5
    b640:	00e61ab3          	sll	s5,a2,a4
    b644:	0097e4b3          	or	s1,a5,s1
    b648:	00e99433          	sll	s0,s3,a4
    b64c:	010ada13          	srl	s4,s5,0x10
    b650:	000a0593          	mv	a1,s4
    b654:	00048513          	mv	a0,s1
    b658:	010a9b13          	sll	s6,s5,0x10
    b65c:	7fc030ef          	jal	ee58 <__hidden___udivsi3>
    b660:	010b5b13          	srl	s6,s6,0x10
    b664:	00050593          	mv	a1,a0
    b668:	00050913          	mv	s2,a0
    b66c:	000b0513          	mv	a0,s6
    b670:	724030ef          	jal	ed94 <__mulsi3>
    b674:	00050793          	mv	a5,a0
    b678:	000a0593          	mv	a1,s4
    b67c:	00048513          	mv	a0,s1
    b680:	00078493          	mv	s1,a5
    b684:	01d030ef          	jal	eea0 <__umodsi3>
    b688:	01051513          	sll	a0,a0,0x10
    b68c:	01045793          	srl	a5,s0,0x10
    b690:	00a7e7b3          	or	a5,a5,a0
    b694:	0097fc63          	bgeu	a5,s1,b6ac <__udivdi3+0xec>
    b698:	00fa87b3          	add	a5,s5,a5
    b69c:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x73>
    b6a0:	0157e463          	bltu	a5,s5,b6a8 <__udivdi3+0xe8>
    b6a4:	5a97e863          	bltu	a5,s1,bc54 <__udivdi3+0x694>
    b6a8:	00070913          	mv	s2,a4
    b6ac:	409784b3          	sub	s1,a5,s1
    b6b0:	000a0593          	mv	a1,s4
    b6b4:	00048513          	mv	a0,s1
    b6b8:	7a0030ef          	jal	ee58 <__hidden___udivsi3>
    b6bc:	00050593          	mv	a1,a0
    b6c0:	00050993          	mv	s3,a0
    b6c4:	000b0513          	mv	a0,s6
    b6c8:	6cc030ef          	jal	ed94 <__mulsi3>
    b6cc:	00050793          	mv	a5,a0
    b6d0:	000a0593          	mv	a1,s4
    b6d4:	00048513          	mv	a0,s1
    b6d8:	01041413          	sll	s0,s0,0x10
    b6dc:	00078493          	mv	s1,a5
    b6e0:	7c0030ef          	jal	eea0 <__umodsi3>
    b6e4:	01051513          	sll	a0,a0,0x10
    b6e8:	01045413          	srl	s0,s0,0x10
    b6ec:	00a46433          	or	s0,s0,a0
    b6f0:	00947c63          	bgeu	s0,s1,b708 <__udivdi3+0x148>
    b6f4:	008a8433          	add	s0,s5,s0
    b6f8:	fff98793          	add	a5,s3,-1
    b6fc:	4d546e63          	bltu	s0,s5,bbd8 <__udivdi3+0x618>
    b700:	ffe98993          	add	s3,s3,-2
    b704:	4c947a63          	bgeu	s0,s1,bbd8 <__udivdi3+0x618>
    b708:	01091613          	sll	a2,s2,0x10
    b70c:	01366533          	or	a0,a2,s3
    b710:	00000b13          	li	s6,0
    b714:	02812403          	lw	s0,40(sp)
    b718:	02c12083          	lw	ra,44(sp)
    b71c:	02412483          	lw	s1,36(sp)
    b720:	02012903          	lw	s2,32(sp)
    b724:	01812a03          	lw	s4,24(sp)
    b728:	01412a83          	lw	s5,20(sp)
    b72c:	01c12983          	lw	s3,28(sp)
    b730:	000b0593          	mv	a1,s6
    b734:	01012b03          	lw	s6,16(sp)
    b738:	03010113          	add	sp,sp,48
    b73c:	00008067          	ret
    b740:	02d5f263          	bgeu	a1,a3,b764 <__udivdi3+0x1a4>
    b744:	00000b13          	li	s6,0
    b748:	00000513          	li	a0,0
    b74c:	02c12083          	lw	ra,44(sp)
    b750:	01c12983          	lw	s3,28(sp)
    b754:	000b0593          	mv	a1,s6
    b758:	01012b03          	lw	s6,16(sp)
    b75c:	03010113          	add	sp,sp,48
    b760:	00008067          	ret
    b764:	000107b7          	lui	a5,0x10
    b768:	26f6ee63          	bltu	a3,a5,b9e4 <__udivdi3+0x424>
    b76c:	01000737          	lui	a4,0x1000
    b770:	01800793          	li	a5,24
    b774:	00e6f463          	bgeu	a3,a4,b77c <__udivdi3+0x1bc>
    b778:	01000793          	li	a5,16
    b77c:	00f6d533          	srl	a0,a3,a5
    b780:	00004717          	auipc	a4,0x4
    b784:	18870713          	add	a4,a4,392 # f908 <__clz_tab>
    b788:	00a70733          	add	a4,a4,a0
    b78c:	00074703          	lbu	a4,0(a4)
    b790:	02000513          	li	a0,32
    b794:	00f70733          	add	a4,a4,a5
    b798:	40e50b33          	sub	s6,a0,a4
    b79c:	26e51c63          	bne	a0,a4,ba14 <__udivdi3+0x454>
    b7a0:	46b6ee63          	bltu	a3,a1,bc1c <__udivdi3+0x65c>
    b7a4:	00c9b533          	sltu	a0,s3,a2
    b7a8:	00153513          	seqz	a0,a0
    b7ac:	00000b13          	li	s6,0
    b7b0:	f9dff06f          	j	b74c <__udivdi3+0x18c>
    b7b4:	10060c63          	beqz	a2,b8cc <__udivdi3+0x30c>
    b7b8:	000107b7          	lui	a5,0x10
    b7bc:	44f67663          	bgeu	a2,a5,bc08 <__udivdi3+0x648>
    b7c0:	10063713          	sltiu	a4,a2,256
    b7c4:	00173713          	seqz	a4,a4
    b7c8:	00371713          	sll	a4,a4,0x3
    b7cc:	00e656b3          	srl	a3,a2,a4
    b7d0:	00004797          	auipc	a5,0x4
    b7d4:	13878793          	add	a5,a5,312 # f908 <__clz_tab>
    b7d8:	00d787b3          	add	a5,a5,a3
    b7dc:	0007c483          	lbu	s1,0(a5)
    b7e0:	02000793          	li	a5,32
    b7e4:	00e484b3          	add	s1,s1,a4
    b7e8:	40978733          	sub	a4,a5,s1
    b7ec:	10979463          	bne	a5,s1,b8f4 <__udivdi3+0x334>
    b7f0:	01061a13          	sll	s4,a2,0x10
    b7f4:	40c584b3          	sub	s1,a1,a2
    b7f8:	01065913          	srl	s2,a2,0x10
    b7fc:	010a5a13          	srl	s4,s4,0x10
    b800:	00100b13          	li	s6,1
    b804:	00090593          	mv	a1,s2
    b808:	00048513          	mv	a0,s1
    b80c:	64c030ef          	jal	ee58 <__hidden___udivsi3>
    b810:	000a0593          	mv	a1,s4
    b814:	00050993          	mv	s3,a0
    b818:	57c030ef          	jal	ed94 <__mulsi3>
    b81c:	00050793          	mv	a5,a0
    b820:	00090593          	mv	a1,s2
    b824:	00048513          	mv	a0,s1
    b828:	00078493          	mv	s1,a5
    b82c:	674030ef          	jal	eea0 <__umodsi3>
    b830:	01051513          	sll	a0,a0,0x10
    b834:	01045793          	srl	a5,s0,0x10
    b838:	00a7e7b3          	or	a5,a5,a0
    b83c:	0097fc63          	bgeu	a5,s1,b854 <__udivdi3+0x294>
    b840:	00fa87b3          	add	a5,s5,a5
    b844:	fff98713          	add	a4,s3,-1
    b848:	0157e463          	bltu	a5,s5,b850 <__udivdi3+0x290>
    b84c:	3e97ee63          	bltu	a5,s1,bc48 <__udivdi3+0x688>
    b850:	00070993          	mv	s3,a4
    b854:	409784b3          	sub	s1,a5,s1
    b858:	00090593          	mv	a1,s2
    b85c:	00048513          	mv	a0,s1
    b860:	5f8030ef          	jal	ee58 <__hidden___udivsi3>
    b864:	000a0593          	mv	a1,s4
    b868:	00050a13          	mv	s4,a0
    b86c:	528030ef          	jal	ed94 <__mulsi3>
    b870:	00050793          	mv	a5,a0
    b874:	00090593          	mv	a1,s2
    b878:	00048513          	mv	a0,s1
    b87c:	01041413          	sll	s0,s0,0x10
    b880:	00078493          	mv	s1,a5
    b884:	61c030ef          	jal	eea0 <__umodsi3>
    b888:	01051513          	sll	a0,a0,0x10
    b88c:	01045413          	srl	s0,s0,0x10
    b890:	00a46433          	or	s0,s0,a0
    b894:	00947e63          	bgeu	s0,s1,b8b0 <__udivdi3+0x2f0>
    b898:	008a8433          	add	s0,s5,s0
    b89c:	fffa0793          	add	a5,s4,-1
    b8a0:	01546663          	bltu	s0,s5,b8ac <__udivdi3+0x2ec>
    b8a4:	ffea0a13          	add	s4,s4,-2
    b8a8:	00946463          	bltu	s0,s1,b8b0 <__udivdi3+0x2f0>
    b8ac:	00078a13          	mv	s4,a5
    b8b0:	01099613          	sll	a2,s3,0x10
    b8b4:	01466533          	or	a0,a2,s4
    b8b8:	e5dff06f          	j	b714 <__udivdi3+0x154>
    b8bc:	10063713          	sltiu	a4,a2,256
    b8c0:	00173713          	seqz	a4,a4
    b8c4:	00371713          	sll	a4,a4,0x3
    b8c8:	d4dff06f          	j	b614 <__udivdi3+0x54>
    b8cc:	00000693          	li	a3,0
    b8d0:	00004797          	auipc	a5,0x4
    b8d4:	03878793          	add	a5,a5,56 # f908 <__clz_tab>
    b8d8:	00d787b3          	add	a5,a5,a3
    b8dc:	0007c483          	lbu	s1,0(a5)
    b8e0:	00000713          	li	a4,0
    b8e4:	02000793          	li	a5,32
    b8e8:	00e484b3          	add	s1,s1,a4
    b8ec:	40978733          	sub	a4,a5,s1
    b8f0:	f09780e3          	beq	a5,s1,b7f0 <__udivdi3+0x230>
    b8f4:	00e61ab3          	sll	s5,a2,a4
    b8f8:	01712623          	sw	s7,12(sp)
    b8fc:	010ad913          	srl	s2,s5,0x10
    b900:	0095dbb3          	srl	s7,a1,s1
    b904:	00e597b3          	sll	a5,a1,a4
    b908:	0099d4b3          	srl	s1,s3,s1
    b90c:	00090593          	mv	a1,s2
    b910:	000b8513          	mv	a0,s7
    b914:	010a9a13          	sll	s4,s5,0x10
    b918:	00f4e4b3          	or	s1,s1,a5
    b91c:	00e99433          	sll	s0,s3,a4
    b920:	010a5a13          	srl	s4,s4,0x10
    b924:	534030ef          	jal	ee58 <__hidden___udivsi3>
    b928:	00050593          	mv	a1,a0
    b92c:	00050b13          	mv	s6,a0
    b930:	000a0513          	mv	a0,s4
    b934:	460030ef          	jal	ed94 <__mulsi3>
    b938:	00050993          	mv	s3,a0
    b93c:	00090593          	mv	a1,s2
    b940:	000b8513          	mv	a0,s7
    b944:	55c030ef          	jal	eea0 <__umodsi3>
    b948:	01051513          	sll	a0,a0,0x10
    b94c:	0104d793          	srl	a5,s1,0x10
    b950:	00a7e7b3          	or	a5,a5,a0
    b954:	0137fe63          	bgeu	a5,s3,b970 <__udivdi3+0x3b0>
    b958:	00fa87b3          	add	a5,s5,a5
    b95c:	fffb0713          	add	a4,s6,-1
    b960:	2d57ec63          	bltu	a5,s5,bc38 <__udivdi3+0x678>
    b964:	2d37fa63          	bgeu	a5,s3,bc38 <__udivdi3+0x678>
    b968:	ffeb0b13          	add	s6,s6,-2
    b96c:	015787b3          	add	a5,a5,s5
    b970:	413789b3          	sub	s3,a5,s3
    b974:	00090593          	mv	a1,s2
    b978:	00098513          	mv	a0,s3
    b97c:	4dc030ef          	jal	ee58 <__hidden___udivsi3>
    b980:	00050593          	mv	a1,a0
    b984:	00050b93          	mv	s7,a0
    b988:	000a0513          	mv	a0,s4
    b98c:	408030ef          	jal	ed94 <__mulsi3>
    b990:	00050793          	mv	a5,a0
    b994:	00090593          	mv	a1,s2
    b998:	00098513          	mv	a0,s3
    b99c:	01049493          	sll	s1,s1,0x10
    b9a0:	00078993          	mv	s3,a5
    b9a4:	4fc030ef          	jal	eea0 <__umodsi3>
    b9a8:	01051513          	sll	a0,a0,0x10
    b9ac:	0104d493          	srl	s1,s1,0x10
    b9b0:	00a4e4b3          	or	s1,s1,a0
    b9b4:	0134fe63          	bgeu	s1,s3,b9d0 <__udivdi3+0x410>
    b9b8:	009a84b3          	add	s1,s5,s1
    b9bc:	fffb8793          	add	a5,s7,-1
    b9c0:	2754e463          	bltu	s1,s5,bc28 <__udivdi3+0x668>
    b9c4:	2734f263          	bgeu	s1,s3,bc28 <__udivdi3+0x668>
    b9c8:	ffeb8b93          	add	s7,s7,-2
    b9cc:	015484b3          	add	s1,s1,s5
    b9d0:	010b1b13          	sll	s6,s6,0x10
    b9d4:	017b6b33          	or	s6,s6,s7
    b9d8:	413484b3          	sub	s1,s1,s3
    b9dc:	00c12b83          	lw	s7,12(sp)
    b9e0:	e25ff06f          	j	b804 <__udivdi3+0x244>
    b9e4:	1006b793          	sltiu	a5,a3,256
    b9e8:	0017b793          	seqz	a5,a5
    b9ec:	00379793          	sll	a5,a5,0x3
    b9f0:	00f6d533          	srl	a0,a3,a5
    b9f4:	00004717          	auipc	a4,0x4
    b9f8:	f1470713          	add	a4,a4,-236 # f908 <__clz_tab>
    b9fc:	00a70733          	add	a4,a4,a0
    ba00:	00074703          	lbu	a4,0(a4)
    ba04:	02000513          	li	a0,32
    ba08:	00f70733          	add	a4,a4,a5
    ba0c:	40e50b33          	sub	s6,a0,a4
    ba10:	d8e508e3          	beq	a0,a4,b7a0 <__udivdi3+0x1e0>
    ba14:	016696b3          	sll	a3,a3,s6
    ba18:	01912223          	sw	s9,4(sp)
    ba1c:	00e65cb3          	srl	s9,a2,a4
    ba20:	00dcecb3          	or	s9,s9,a3
    ba24:	01512a23          	sw	s5,20(sp)
    ba28:	01712623          	sw	s7,12(sp)
    ba2c:	010cda93          	srl	s5,s9,0x10
    ba30:	00e5dbb3          	srl	s7,a1,a4
    ba34:	016597b3          	sll	a5,a1,s6
    ba38:	00e9d733          	srl	a4,s3,a4
    ba3c:	01812423          	sw	s8,8(sp)
    ba40:	000a8593          	mv	a1,s5
    ba44:	000b8513          	mv	a0,s7
    ba48:	010c9c13          	sll	s8,s9,0x10
    ba4c:	02812423          	sw	s0,40(sp)
    ba50:	02912223          	sw	s1,36(sp)
    ba54:	03212023          	sw	s2,32(sp)
    ba58:	00f764b3          	or	s1,a4,a5
    ba5c:	01661933          	sll	s2,a2,s6
    ba60:	01412c23          	sw	s4,24(sp)
    ba64:	010c5c13          	srl	s8,s8,0x10
    ba68:	3f0030ef          	jal	ee58 <__hidden___udivsi3>
    ba6c:	00050593          	mv	a1,a0
    ba70:	00050413          	mv	s0,a0
    ba74:	000c0513          	mv	a0,s8
    ba78:	31c030ef          	jal	ed94 <__mulsi3>
    ba7c:	00050a13          	mv	s4,a0
    ba80:	000a8593          	mv	a1,s5
    ba84:	000b8513          	mv	a0,s7
    ba88:	418030ef          	jal	eea0 <__umodsi3>
    ba8c:	01051513          	sll	a0,a0,0x10
    ba90:	0104d793          	srl	a5,s1,0x10
    ba94:	00a7e7b3          	or	a5,a5,a0
    ba98:	0147fe63          	bgeu	a5,s4,bab4 <__udivdi3+0x4f4>
    ba9c:	00fc87b3          	add	a5,s9,a5
    baa0:	fff40713          	add	a4,s0,-1
    baa4:	1997ee63          	bltu	a5,s9,bc40 <__udivdi3+0x680>
    baa8:	1947fc63          	bgeu	a5,s4,bc40 <__udivdi3+0x680>
    baac:	ffe40413          	add	s0,s0,-2
    bab0:	019787b3          	add	a5,a5,s9
    bab4:	41478a33          	sub	s4,a5,s4
    bab8:	000a8593          	mv	a1,s5
    babc:	000a0513          	mv	a0,s4
    bac0:	398030ef          	jal	ee58 <__hidden___udivsi3>
    bac4:	00050593          	mv	a1,a0
    bac8:	00050b93          	mv	s7,a0
    bacc:	000c0513          	mv	a0,s8
    bad0:	2c4030ef          	jal	ed94 <__mulsi3>
    bad4:	00050793          	mv	a5,a0
    bad8:	000a8593          	mv	a1,s5
    badc:	000a0513          	mv	a0,s4
    bae0:	00078a13          	mv	s4,a5
    bae4:	3bc030ef          	jal	eea0 <__umodsi3>
    bae8:	01049713          	sll	a4,s1,0x10
    baec:	01051513          	sll	a0,a0,0x10
    baf0:	01075713          	srl	a4,a4,0x10
    baf4:	00a76733          	or	a4,a4,a0
    baf8:	01477e63          	bgeu	a4,s4,bb14 <__udivdi3+0x554>
    bafc:	00ec8733          	add	a4,s9,a4
    bb00:	fffb8793          	add	a5,s7,-1
    bb04:	13976663          	bltu	a4,s9,bc30 <__udivdi3+0x670>
    bb08:	13477463          	bgeu	a4,s4,bc30 <__udivdi3+0x670>
    bb0c:	ffeb8b93          	add	s7,s7,-2
    bb10:	01970733          	add	a4,a4,s9
    bb14:	00010e37          	lui	t3,0x10
    bb18:	01041413          	sll	s0,s0,0x10
    bb1c:	01746433          	or	s0,s0,s7
    bb20:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    bb24:	00f47833          	and	a6,s0,a5
    bb28:	00f977b3          	and	a5,s2,a5
    bb2c:	41470733          	sub	a4,a4,s4
    bb30:	01045e93          	srl	t4,s0,0x10
    bb34:	01095913          	srl	s2,s2,0x10
    bb38:	00080513          	mv	a0,a6
    bb3c:	00078593          	mv	a1,a5
    bb40:	254030ef          	jal	ed94 <__mulsi3>
    bb44:	00050313          	mv	t1,a0
    bb48:	00090593          	mv	a1,s2
    bb4c:	00080513          	mv	a0,a6
    bb50:	244030ef          	jal	ed94 <__mulsi3>
    bb54:	00050813          	mv	a6,a0
    bb58:	00078593          	mv	a1,a5
    bb5c:	000e8513          	mv	a0,t4
    bb60:	234030ef          	jal	ed94 <__mulsi3>
    bb64:	00050893          	mv	a7,a0
    bb68:	00090593          	mv	a1,s2
    bb6c:	000e8513          	mv	a0,t4
    bb70:	224030ef          	jal	ed94 <__mulsi3>
    bb74:	01035793          	srl	a5,t1,0x10
    bb78:	01180833          	add	a6,a6,a7
    bb7c:	010787b3          	add	a5,a5,a6
    bb80:	0117f463          	bgeu	a5,a7,bb88 <__udivdi3+0x5c8>
    bb84:	01c50533          	add	a0,a0,t3
    bb88:	0107d693          	srl	a3,a5,0x10
    bb8c:	00a686b3          	add	a3,a3,a0
    bb90:	06d76863          	bltu	a4,a3,bc00 <__udivdi3+0x640>
    bb94:	04d70663          	beq	a4,a3,bbe0 <__udivdi3+0x620>
    bb98:	00040513          	mv	a0,s0
    bb9c:	02812403          	lw	s0,40(sp)
    bba0:	02c12083          	lw	ra,44(sp)
    bba4:	00000b13          	li	s6,0
    bba8:	02412483          	lw	s1,36(sp)
    bbac:	02012903          	lw	s2,32(sp)
    bbb0:	01812a03          	lw	s4,24(sp)
    bbb4:	01412a83          	lw	s5,20(sp)
    bbb8:	00c12b83          	lw	s7,12(sp)
    bbbc:	00812c03          	lw	s8,8(sp)
    bbc0:	00412c83          	lw	s9,4(sp)
    bbc4:	01c12983          	lw	s3,28(sp)
    bbc8:	000b0593          	mv	a1,s6
    bbcc:	01012b03          	lw	s6,16(sp)
    bbd0:	03010113          	add	sp,sp,48
    bbd4:	00008067          	ret
    bbd8:	00078993          	mv	s3,a5
    bbdc:	b2dff06f          	j	b708 <__udivdi3+0x148>
    bbe0:	00010737          	lui	a4,0x10
    bbe4:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    bbe8:	00e7f7b3          	and	a5,a5,a4
    bbec:	01079793          	sll	a5,a5,0x10
    bbf0:	00e37333          	and	t1,t1,a4
    bbf4:	01699533          	sll	a0,s3,s6
    bbf8:	006787b3          	add	a5,a5,t1
    bbfc:	f8f57ee3          	bgeu	a0,a5,bb98 <__udivdi3+0x5d8>
    bc00:	fff40513          	add	a0,s0,-1
    bc04:	f99ff06f          	j	bb9c <__udivdi3+0x5dc>
    bc08:	010007b7          	lui	a5,0x1000
    bc0c:	04f67a63          	bgeu	a2,a5,bc60 <__udivdi3+0x6a0>
    bc10:	01065693          	srl	a3,a2,0x10
    bc14:	01000713          	li	a4,16
    bc18:	bb9ff06f          	j	b7d0 <__udivdi3+0x210>
    bc1c:	00000b13          	li	s6,0
    bc20:	00100513          	li	a0,1
    bc24:	b29ff06f          	j	b74c <__udivdi3+0x18c>
    bc28:	00078b93          	mv	s7,a5
    bc2c:	da5ff06f          	j	b9d0 <__udivdi3+0x410>
    bc30:	00078b93          	mv	s7,a5
    bc34:	ee1ff06f          	j	bb14 <__udivdi3+0x554>
    bc38:	00070b13          	mv	s6,a4
    bc3c:	d35ff06f          	j	b970 <__udivdi3+0x3b0>
    bc40:	00070413          	mv	s0,a4
    bc44:	e71ff06f          	j	bab4 <__udivdi3+0x4f4>
    bc48:	ffe98993          	add	s3,s3,-2
    bc4c:	015787b3          	add	a5,a5,s5
    bc50:	c05ff06f          	j	b854 <__udivdi3+0x294>
    bc54:	ffe90913          	add	s2,s2,-2
    bc58:	015787b3          	add	a5,a5,s5
    bc5c:	a51ff06f          	j	b6ac <__udivdi3+0xec>
    bc60:	01865693          	srl	a3,a2,0x18
    bc64:	01800713          	li	a4,24
    bc68:	b69ff06f          	j	b7d0 <__udivdi3+0x210>

0000bc6c <__umoddi3>:
    bc6c:	fd010113          	add	sp,sp,-48
    bc70:	02112623          	sw	ra,44(sp)
    bc74:	00050793          	mv	a5,a0
    bc78:	14069663          	bnez	a3,bdc4 <__umoddi3+0x158>
    bc7c:	03212023          	sw	s2,32(sp)
    bc80:	01412c23          	sw	s4,24(sp)
    bc84:	02812423          	sw	s0,40(sp)
    bc88:	02912223          	sw	s1,36(sp)
    bc8c:	01312e23          	sw	s3,28(sp)
    bc90:	01512a23          	sw	s5,20(sp)
    bc94:	00060a13          	mv	s4,a2
    bc98:	00050913          	mv	s2,a0
    bc9c:	1ac5f663          	bgeu	a1,a2,be48 <__umoddi3+0x1dc>
    bca0:	01612823          	sw	s6,16(sp)
    bca4:	00010737          	lui	a4,0x10
    bca8:	00058993          	mv	s3,a1
    bcac:	28e66063          	bltu	a2,a4,bf2c <__umoddi3+0x2c0>
    bcb0:	01000737          	lui	a4,0x1000
    bcb4:	01800693          	li	a3,24
    bcb8:	00e67463          	bgeu	a2,a4,bcc0 <__umoddi3+0x54>
    bcbc:	01000693          	li	a3,16
    bcc0:	00d65533          	srl	a0,a2,a3
    bcc4:	00004717          	auipc	a4,0x4
    bcc8:	c4470713          	add	a4,a4,-956 # f908 <__clz_tab>
    bccc:	00a70733          	add	a4,a4,a0
    bcd0:	00074703          	lbu	a4,0(a4)
    bcd4:	02000513          	li	a0,32
    bcd8:	00d70733          	add	a4,a4,a3
    bcdc:	40e504b3          	sub	s1,a0,a4
    bce0:	00e50c63          	beq	a0,a4,bcf8 <__umoddi3+0x8c>
    bce4:	009599b3          	sll	s3,a1,s1
    bce8:	00e7d733          	srl	a4,a5,a4
    bcec:	00961a33          	sll	s4,a2,s1
    bcf0:	013769b3          	or	s3,a4,s3
    bcf4:	00979933          	sll	s2,a5,s1
    bcf8:	010a5a93          	srl	s5,s4,0x10
    bcfc:	000a8593          	mv	a1,s5
    bd00:	00098513          	mv	a0,s3
    bd04:	010a1b13          	sll	s6,s4,0x10
    bd08:	150030ef          	jal	ee58 <__hidden___udivsi3>
    bd0c:	010b5b13          	srl	s6,s6,0x10
    bd10:	000b0593          	mv	a1,s6
    bd14:	080030ef          	jal	ed94 <__mulsi3>
    bd18:	00050413          	mv	s0,a0
    bd1c:	000a8593          	mv	a1,s5
    bd20:	00098513          	mv	a0,s3
    bd24:	17c030ef          	jal	eea0 <__umodsi3>
    bd28:	01051513          	sll	a0,a0,0x10
    bd2c:	01095793          	srl	a5,s2,0x10
    bd30:	00a7e7b3          	or	a5,a5,a0
    bd34:	0087f863          	bgeu	a5,s0,bd44 <__umoddi3+0xd8>
    bd38:	00fa07b3          	add	a5,s4,a5
    bd3c:	0147e463          	bltu	a5,s4,bd44 <__umoddi3+0xd8>
    bd40:	5687e863          	bltu	a5,s0,c2b0 <__umoddi3+0x644>
    bd44:	40878433          	sub	s0,a5,s0
    bd48:	000a8593          	mv	a1,s5
    bd4c:	00040513          	mv	a0,s0
    bd50:	108030ef          	jal	ee58 <__hidden___udivsi3>
    bd54:	000b0593          	mv	a1,s6
    bd58:	03c030ef          	jal	ed94 <__mulsi3>
    bd5c:	00050793          	mv	a5,a0
    bd60:	000a8593          	mv	a1,s5
    bd64:	00040513          	mv	a0,s0
    bd68:	00078413          	mv	s0,a5
    bd6c:	134030ef          	jal	eea0 <__umodsi3>
    bd70:	01091793          	sll	a5,s2,0x10
    bd74:	01051513          	sll	a0,a0,0x10
    bd78:	0107d793          	srl	a5,a5,0x10
    bd7c:	00a7e7b3          	or	a5,a5,a0
    bd80:	0087f863          	bgeu	a5,s0,bd90 <__umoddi3+0x124>
    bd84:	00fa07b3          	add	a5,s4,a5
    bd88:	0147e463          	bltu	a5,s4,bd90 <__umoddi3+0x124>
    bd8c:	5087ea63          	bltu	a5,s0,c2a0 <__umoddi3+0x634>
    bd90:	01012b03          	lw	s6,16(sp)
    bd94:	408787b3          	sub	a5,a5,s0
    bd98:	0097d533          	srl	a0,a5,s1
    bd9c:	02812403          	lw	s0,40(sp)
    bda0:	02412483          	lw	s1,36(sp)
    bda4:	02012903          	lw	s2,32(sp)
    bda8:	01c12983          	lw	s3,28(sp)
    bdac:	01812a03          	lw	s4,24(sp)
    bdb0:	01412a83          	lw	s5,20(sp)
    bdb4:	00000593          	li	a1,0
    bdb8:	02c12083          	lw	ra,44(sp)
    bdbc:	03010113          	add	sp,sp,48
    bdc0:	00008067          	ret
    bdc4:	00050893          	mv	a7,a0
    bdc8:	fed5e8e3          	bltu	a1,a3,bdb8 <__umoddi3+0x14c>
    bdcc:	03212023          	sw	s2,32(sp)
    bdd0:	01312e23          	sw	s3,28(sp)
    bdd4:	00010737          	lui	a4,0x10
    bdd8:	00058813          	mv	a6,a1
    bddc:	24e6ec63          	bltu	a3,a4,c034 <__umoddi3+0x3c8>
    bde0:	01000737          	lui	a4,0x1000
    bde4:	01800513          	li	a0,24
    bde8:	00e6f463          	bgeu	a3,a4,bdf0 <__umoddi3+0x184>
    bdec:	01000513          	li	a0,16
    bdf0:	00a6d333          	srl	t1,a3,a0
    bdf4:	00004717          	auipc	a4,0x4
    bdf8:	b1470713          	add	a4,a4,-1260 # f908 <__clz_tab>
    bdfc:	00670733          	add	a4,a4,t1
    be00:	00074703          	lbu	a4,0(a4)
    be04:	02000313          	li	t1,32
    be08:	00a709b3          	add	s3,a4,a0
    be0c:	41330933          	sub	s2,t1,s3
    be10:	25331a63          	bne	t1,s3,c064 <__umoddi3+0x3f8>
    be14:	00b6e463          	bltu	a3,a1,be1c <__umoddi3+0x1b0>
    be18:	00c7ea63          	bltu	a5,a2,be2c <__umoddi3+0x1c0>
    be1c:	40c788b3          	sub	a7,a5,a2
    be20:	40d586b3          	sub	a3,a1,a3
    be24:	0117b833          	sltu	a6,a5,a7
    be28:	41068833          	sub	a6,a3,a6
    be2c:	02c12083          	lw	ra,44(sp)
    be30:	02012903          	lw	s2,32(sp)
    be34:	01c12983          	lw	s3,28(sp)
    be38:	00088513          	mv	a0,a7
    be3c:	00080593          	mv	a1,a6
    be40:	03010113          	add	sp,sp,48
    be44:	00008067          	ret
    be48:	0e060a63          	beqz	a2,bf3c <__umoddi3+0x2d0>
    be4c:	00010737          	lui	a4,0x10
    be50:	42e67663          	bgeu	a2,a4,c27c <__umoddi3+0x610>
    be54:	10063693          	sltiu	a3,a2,256
    be58:	0016b693          	seqz	a3,a3
    be5c:	00369693          	sll	a3,a3,0x3
    be60:	00d65533          	srl	a0,a2,a3
    be64:	00004717          	auipc	a4,0x4
    be68:	aa470713          	add	a4,a4,-1372 # f908 <__clz_tab>
    be6c:	00a70733          	add	a4,a4,a0
    be70:	00074983          	lbu	s3,0(a4)
    be74:	02000713          	li	a4,32
    be78:	00d989b3          	add	s3,s3,a3
    be7c:	413704b3          	sub	s1,a4,s3
    be80:	0f371263          	bne	a4,s3,bf64 <__umoddi3+0x2f8>
    be84:	01061413          	sll	s0,a2,0x10
    be88:	40c589b3          	sub	s3,a1,a2
    be8c:	01065a93          	srl	s5,a2,0x10
    be90:	01045413          	srl	s0,s0,0x10
    be94:	000a8593          	mv	a1,s5
    be98:	00098513          	mv	a0,s3
    be9c:	7bd020ef          	jal	ee58 <__hidden___udivsi3>
    bea0:	00040593          	mv	a1,s0
    bea4:	6f1020ef          	jal	ed94 <__mulsi3>
    bea8:	00050793          	mv	a5,a0
    beac:	000a8593          	mv	a1,s5
    beb0:	00098513          	mv	a0,s3
    beb4:	00078993          	mv	s3,a5
    beb8:	7e9020ef          	jal	eea0 <__umodsi3>
    bebc:	01051513          	sll	a0,a0,0x10
    bec0:	01095793          	srl	a5,s2,0x10
    bec4:	00a7e7b3          	or	a5,a5,a0
    bec8:	0137f863          	bgeu	a5,s3,bed8 <__umoddi3+0x26c>
    becc:	00fa07b3          	add	a5,s4,a5
    bed0:	0147e463          	bltu	a5,s4,bed8 <__umoddi3+0x26c>
    bed4:	3d37ea63          	bltu	a5,s3,c2a8 <__umoddi3+0x63c>
    bed8:	413789b3          	sub	s3,a5,s3
    bedc:	000a8593          	mv	a1,s5
    bee0:	00098513          	mv	a0,s3
    bee4:	775020ef          	jal	ee58 <__hidden___udivsi3>
    bee8:	00040593          	mv	a1,s0
    beec:	6a9020ef          	jal	ed94 <__mulsi3>
    bef0:	00050413          	mv	s0,a0
    bef4:	000a8593          	mv	a1,s5
    bef8:	00098513          	mv	a0,s3
    befc:	7a5020ef          	jal	eea0 <__umodsi3>
    bf00:	01091913          	sll	s2,s2,0x10
    bf04:	01051793          	sll	a5,a0,0x10
    bf08:	01095913          	srl	s2,s2,0x10
    bf0c:	00f967b3          	or	a5,s2,a5
    bf10:	0087fa63          	bgeu	a5,s0,bf24 <__umoddi3+0x2b8>
    bf14:	00fa07b3          	add	a5,s4,a5
    bf18:	0147e663          	bltu	a5,s4,bf24 <__umoddi3+0x2b8>
    bf1c:	0087f463          	bgeu	a5,s0,bf24 <__umoddi3+0x2b8>
    bf20:	014787b3          	add	a5,a5,s4
    bf24:	408787b3          	sub	a5,a5,s0
    bf28:	e71ff06f          	j	bd98 <__umoddi3+0x12c>
    bf2c:	10063693          	sltiu	a3,a2,256
    bf30:	0016b693          	seqz	a3,a3
    bf34:	00369693          	sll	a3,a3,0x3
    bf38:	d89ff06f          	j	bcc0 <__umoddi3+0x54>
    bf3c:	00000513          	li	a0,0
    bf40:	00004717          	auipc	a4,0x4
    bf44:	9c870713          	add	a4,a4,-1592 # f908 <__clz_tab>
    bf48:	00a70733          	add	a4,a4,a0
    bf4c:	00074983          	lbu	s3,0(a4)
    bf50:	00000693          	li	a3,0
    bf54:	02000713          	li	a4,32
    bf58:	00d989b3          	add	s3,s3,a3
    bf5c:	413704b3          	sub	s1,a4,s3
    bf60:	f33702e3          	beq	a4,s3,be84 <__umoddi3+0x218>
    bf64:	00961a33          	sll	s4,a2,s1
    bf68:	01712623          	sw	s7,12(sp)
    bf6c:	010a5a93          	srl	s5,s4,0x10
    bf70:	0135dbb3          	srl	s7,a1,s3
    bf74:	00959733          	sll	a4,a1,s1
    bf78:	0137d9b3          	srl	s3,a5,s3
    bf7c:	000a8593          	mv	a1,s5
    bf80:	000b8513          	mv	a0,s7
    bf84:	010a1413          	sll	s0,s4,0x10
    bf88:	00e9e9b3          	or	s3,s3,a4
    bf8c:	00979933          	sll	s2,a5,s1
    bf90:	01612823          	sw	s6,16(sp)
    bf94:	01045413          	srl	s0,s0,0x10
    bf98:	6c1020ef          	jal	ee58 <__hidden___udivsi3>
    bf9c:	00040593          	mv	a1,s0
    bfa0:	5f5020ef          	jal	ed94 <__mulsi3>
    bfa4:	00050b13          	mv	s6,a0
    bfa8:	000a8593          	mv	a1,s5
    bfac:	000b8513          	mv	a0,s7
    bfb0:	6f1020ef          	jal	eea0 <__umodsi3>
    bfb4:	01051513          	sll	a0,a0,0x10
    bfb8:	0109d793          	srl	a5,s3,0x10
    bfbc:	00a7e7b3          	or	a5,a5,a0
    bfc0:	0167fa63          	bgeu	a5,s6,bfd4 <__umoddi3+0x368>
    bfc4:	00fa07b3          	add	a5,s4,a5
    bfc8:	0147e663          	bltu	a5,s4,bfd4 <__umoddi3+0x368>
    bfcc:	0167f463          	bgeu	a5,s6,bfd4 <__umoddi3+0x368>
    bfd0:	014787b3          	add	a5,a5,s4
    bfd4:	41678b33          	sub	s6,a5,s6
    bfd8:	000a8593          	mv	a1,s5
    bfdc:	000b0513          	mv	a0,s6
    bfe0:	679020ef          	jal	ee58 <__hidden___udivsi3>
    bfe4:	00040593          	mv	a1,s0
    bfe8:	5ad020ef          	jal	ed94 <__mulsi3>
    bfec:	00050793          	mv	a5,a0
    bff0:	000a8593          	mv	a1,s5
    bff4:	000b0513          	mv	a0,s6
    bff8:	01099993          	sll	s3,s3,0x10
    bffc:	00078b13          	mv	s6,a5
    c000:	6a1020ef          	jal	eea0 <__umodsi3>
    c004:	01051513          	sll	a0,a0,0x10
    c008:	0109d993          	srl	s3,s3,0x10
    c00c:	00a9e9b3          	or	s3,s3,a0
    c010:	0169fa63          	bgeu	s3,s6,c024 <__umoddi3+0x3b8>
    c014:	013a09b3          	add	s3,s4,s3
    c018:	0149e663          	bltu	s3,s4,c024 <__umoddi3+0x3b8>
    c01c:	0169f463          	bgeu	s3,s6,c024 <__umoddi3+0x3b8>
    c020:	014989b3          	add	s3,s3,s4
    c024:	416989b3          	sub	s3,s3,s6
    c028:	00c12b83          	lw	s7,12(sp)
    c02c:	01012b03          	lw	s6,16(sp)
    c030:	e65ff06f          	j	be94 <__umoddi3+0x228>
    c034:	1006b513          	sltiu	a0,a3,256
    c038:	00153513          	seqz	a0,a0
    c03c:	00351513          	sll	a0,a0,0x3
    c040:	00a6d333          	srl	t1,a3,a0
    c044:	00004717          	auipc	a4,0x4
    c048:	8c470713          	add	a4,a4,-1852 # f908 <__clz_tab>
    c04c:	00670733          	add	a4,a4,t1
    c050:	00074703          	lbu	a4,0(a4)
    c054:	02000313          	li	t1,32
    c058:	00a709b3          	add	s3,a4,a0
    c05c:	41330933          	sub	s2,t1,s3
    c060:	db330ae3          	beq	t1,s3,be14 <__umoddi3+0x1a8>
    c064:	01512a23          	sw	s5,20(sp)
    c068:	012696b3          	sll	a3,a3,s2
    c06c:	01365ab3          	srl	s5,a2,s3
    c070:	00daeab3          	or	s5,s5,a3
    c074:	01712623          	sw	s7,12(sp)
    c078:	01a12023          	sw	s10,0(sp)
    c07c:	010adb93          	srl	s7,s5,0x10
    c080:	0135dd33          	srl	s10,a1,s3
    c084:	01259733          	sll	a4,a1,s2
    c088:	0137d6b3          	srl	a3,a5,s3
    c08c:	01912223          	sw	s9,4(sp)
    c090:	000b8593          	mv	a1,s7
    c094:	000d0513          	mv	a0,s10
    c098:	010a9c93          	sll	s9,s5,0x10
    c09c:	02812423          	sw	s0,40(sp)
    c0a0:	02912223          	sw	s1,36(sp)
    c0a4:	01261433          	sll	s0,a2,s2
    c0a8:	012794b3          	sll	s1,a5,s2
    c0ac:	01412c23          	sw	s4,24(sp)
    c0b0:	01612823          	sw	s6,16(sp)
    c0b4:	00e6ea33          	or	s4,a3,a4
    c0b8:	01812423          	sw	s8,8(sp)
    c0bc:	010cdc93          	srl	s9,s9,0x10
    c0c0:	599020ef          	jal	ee58 <__hidden___udivsi3>
    c0c4:	00050593          	mv	a1,a0
    c0c8:	00050b13          	mv	s6,a0
    c0cc:	000c8513          	mv	a0,s9
    c0d0:	4c5020ef          	jal	ed94 <__mulsi3>
    c0d4:	00050c13          	mv	s8,a0
    c0d8:	000b8593          	mv	a1,s7
    c0dc:	000d0513          	mv	a0,s10
    c0e0:	5c1020ef          	jal	eea0 <__umodsi3>
    c0e4:	01051513          	sll	a0,a0,0x10
    c0e8:	010a5793          	srl	a5,s4,0x10
    c0ec:	00a7e7b3          	or	a5,a5,a0
    c0f0:	0187fe63          	bgeu	a5,s8,c10c <__umoddi3+0x4a0>
    c0f4:	00fa87b3          	add	a5,s5,a5
    c0f8:	fffb0713          	add	a4,s6,-1
    c0fc:	1957ee63          	bltu	a5,s5,c298 <__umoddi3+0x62c>
    c100:	1987fc63          	bgeu	a5,s8,c298 <__umoddi3+0x62c>
    c104:	ffeb0b13          	add	s6,s6,-2
    c108:	015787b3          	add	a5,a5,s5
    c10c:	41878c33          	sub	s8,a5,s8
    c110:	000b8593          	mv	a1,s7
    c114:	000c0513          	mv	a0,s8
    c118:	541020ef          	jal	ee58 <__hidden___udivsi3>
    c11c:	00050593          	mv	a1,a0
    c120:	00050d13          	mv	s10,a0
    c124:	000c8513          	mv	a0,s9
    c128:	46d020ef          	jal	ed94 <__mulsi3>
    c12c:	00050793          	mv	a5,a0
    c130:	000b8593          	mv	a1,s7
    c134:	000c0513          	mv	a0,s8
    c138:	00078b93          	mv	s7,a5
    c13c:	565020ef          	jal	eea0 <__umodsi3>
    c140:	010a1593          	sll	a1,s4,0x10
    c144:	01051513          	sll	a0,a0,0x10
    c148:	0105d593          	srl	a1,a1,0x10
    c14c:	00a5e5b3          	or	a1,a1,a0
    c150:	0175fe63          	bgeu	a1,s7,c16c <__umoddi3+0x500>
    c154:	00ba85b3          	add	a1,s5,a1
    c158:	fffd0793          	add	a5,s10,-1
    c15c:	1355ea63          	bltu	a1,s5,c290 <__umoddi3+0x624>
    c160:	1375f863          	bgeu	a1,s7,c290 <__umoddi3+0x624>
    c164:	ffed0d13          	add	s10,s10,-2
    c168:	015585b3          	add	a1,a1,s5
    c16c:	010b1793          	sll	a5,s6,0x10
    c170:	00010e37          	lui	t3,0x10
    c174:	01a7e7b3          	or	a5,a5,s10
    c178:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    c17c:	0067f8b3          	and	a7,a5,t1
    c180:	00647333          	and	t1,s0,t1
    c184:	41758733          	sub	a4,a1,s7
    c188:	0107d793          	srl	a5,a5,0x10
    c18c:	01045e93          	srl	t4,s0,0x10
    c190:	00088513          	mv	a0,a7
    c194:	00030593          	mv	a1,t1
    c198:	3fd020ef          	jal	ed94 <__mulsi3>
    c19c:	00050813          	mv	a6,a0
    c1a0:	000e8593          	mv	a1,t4
    c1a4:	00088513          	mv	a0,a7
    c1a8:	3ed020ef          	jal	ed94 <__mulsi3>
    c1ac:	00050893          	mv	a7,a0
    c1b0:	00030593          	mv	a1,t1
    c1b4:	00078513          	mv	a0,a5
    c1b8:	3dd020ef          	jal	ed94 <__mulsi3>
    c1bc:	00050313          	mv	t1,a0
    c1c0:	000e8593          	mv	a1,t4
    c1c4:	00078513          	mv	a0,a5
    c1c8:	3cd020ef          	jal	ed94 <__mulsi3>
    c1cc:	01085793          	srl	a5,a6,0x10
    c1d0:	006888b3          	add	a7,a7,t1
    c1d4:	011787b3          	add	a5,a5,a7
    c1d8:	0067f463          	bgeu	a5,t1,c1e0 <__umoddi3+0x574>
    c1dc:	01c50533          	add	a0,a0,t3
    c1e0:	00010637          	lui	a2,0x10
    c1e4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    c1e8:	0107d693          	srl	a3,a5,0x10
    c1ec:	00c7f7b3          	and	a5,a5,a2
    c1f0:	01079793          	sll	a5,a5,0x10
    c1f4:	00c87833          	and	a6,a6,a2
    c1f8:	00a686b3          	add	a3,a3,a0
    c1fc:	010787b3          	add	a5,a5,a6
    c200:	06d76263          	bltu	a4,a3,c264 <__umoddi3+0x5f8>
    c204:	04d70e63          	beq	a4,a3,c260 <__umoddi3+0x5f4>
    c208:	40f487b3          	sub	a5,s1,a5
    c20c:	00f4b4b3          	sltu	s1,s1,a5
    c210:	02812403          	lw	s0,40(sp)
    c214:	02c12083          	lw	ra,44(sp)
    c218:	40d705b3          	sub	a1,a4,a3
    c21c:	409585b3          	sub	a1,a1,s1
    c220:	01359733          	sll	a4,a1,s3
    c224:	0127d7b3          	srl	a5,a5,s2
    c228:	02412483          	lw	s1,36(sp)
    c22c:	01c12983          	lw	s3,28(sp)
    c230:	01812a03          	lw	s4,24(sp)
    c234:	01412a83          	lw	s5,20(sp)
    c238:	01012b03          	lw	s6,16(sp)
    c23c:	00c12b83          	lw	s7,12(sp)
    c240:	00812c03          	lw	s8,8(sp)
    c244:	00412c83          	lw	s9,4(sp)
    c248:	00012d03          	lw	s10,0(sp)
    c24c:	0125d5b3          	srl	a1,a1,s2
    c250:	00f76533          	or	a0,a4,a5
    c254:	02012903          	lw	s2,32(sp)
    c258:	03010113          	add	sp,sp,48
    c25c:	00008067          	ret
    c260:	faf4f4e3          	bgeu	s1,a5,c208 <__umoddi3+0x59c>
    c264:	40878433          	sub	s0,a5,s0
    c268:	0087b7b3          	sltu	a5,a5,s0
    c26c:	01578ab3          	add	s5,a5,s5
    c270:	415686b3          	sub	a3,a3,s5
    c274:	00040793          	mv	a5,s0
    c278:	f91ff06f          	j	c208 <__umoddi3+0x59c>
    c27c:	01000737          	lui	a4,0x1000
    c280:	02e67c63          	bgeu	a2,a4,c2b8 <__umoddi3+0x64c>
    c284:	01065513          	srl	a0,a2,0x10
    c288:	01000693          	li	a3,16
    c28c:	bd9ff06f          	j	be64 <__umoddi3+0x1f8>
    c290:	00078d13          	mv	s10,a5
    c294:	ed9ff06f          	j	c16c <__umoddi3+0x500>
    c298:	00070b13          	mv	s6,a4
    c29c:	e71ff06f          	j	c10c <__umoddi3+0x4a0>
    c2a0:	014787b3          	add	a5,a5,s4
    c2a4:	aedff06f          	j	bd90 <__umoddi3+0x124>
    c2a8:	014787b3          	add	a5,a5,s4
    c2ac:	c2dff06f          	j	bed8 <__umoddi3+0x26c>
    c2b0:	014787b3          	add	a5,a5,s4
    c2b4:	a91ff06f          	j	bd44 <__umoddi3+0xd8>
    c2b8:	01865513          	srl	a0,a2,0x18
    c2bc:	01800693          	li	a3,24
    c2c0:	ba5ff06f          	j	be64 <__umoddi3+0x1f8>

0000c2c4 <__adddf3>:
    c2c4:	001007b7          	lui	a5,0x100
    c2c8:	fe010113          	add	sp,sp,-32
    c2cc:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c2d0:	00bef833          	and	a6,t4,a1
    c2d4:	00def7b3          	and	a5,t4,a3
    c2d8:	0146d313          	srl	t1,a3,0x14
    c2dc:	01212823          	sw	s2,16(sp)
    c2e0:	0145d913          	srl	s2,a1,0x14
    c2e4:	00379793          	sll	a5,a5,0x3
    c2e8:	00812c23          	sw	s0,24(sp)
    c2ec:	00381813          	sll	a6,a6,0x3
    c2f0:	01f5d413          	srl	s0,a1,0x1f
    c2f4:	01d55713          	srl	a4,a0,0x1d
    c2f8:	01d65893          	srl	a7,a2,0x1d
    c2fc:	7ff97913          	and	s2,s2,2047
    c300:	7ff37313          	and	t1,t1,2047
    c304:	00112e23          	sw	ra,28(sp)
    c308:	00912a23          	sw	s1,20(sp)
    c30c:	01312623          	sw	s3,12(sp)
    c310:	01f6d693          	srl	a3,a3,0x1f
    c314:	00f8e8b3          	or	a7,a7,a5
    c318:	01076733          	or	a4,a4,a6
    c31c:	00351593          	sll	a1,a0,0x3
    c320:	00361f13          	sll	t5,a2,0x3
    c324:	406907b3          	sub	a5,s2,t1
    c328:	1ed40463          	beq	s0,a3,c510 <__adddf3+0x24c>
    c32c:	16f05263          	blez	a5,c490 <__adddf3+0x1cc>
    c330:	28030663          	beqz	t1,c5bc <__adddf3+0x2f8>
    c334:	7ff00693          	li	a3,2047
    c338:	42d90663          	beq	s2,a3,c764 <__adddf3+0x4a0>
    c33c:	03800693          	li	a3,56
    c340:	00100613          	li	a2,1
    c344:	02f6ce63          	blt	a3,a5,c380 <__adddf3+0xbc>
    c348:	008006b7          	lui	a3,0x800
    c34c:	00d8e8b3          	or	a7,a7,a3
    c350:	01f00693          	li	a3,31
    c354:	52f6ce63          	blt	a3,a5,c890 <__adddf3+0x5cc>
    c358:	02000693          	li	a3,32
    c35c:	40f686b3          	sub	a3,a3,a5
    c360:	00d89633          	sll	a2,a7,a3
    c364:	00ff5533          	srl	a0,t5,a5
    c368:	00df16b3          	sll	a3,t5,a3
    c36c:	00a66633          	or	a2,a2,a0
    c370:	00d036b3          	snez	a3,a3
    c374:	00f8d8b3          	srl	a7,a7,a5
    c378:	00d66633          	or	a2,a2,a3
    c37c:	41170733          	sub	a4,a4,a7
    c380:	40c58633          	sub	a2,a1,a2
    c384:	00c5b5b3          	sltu	a1,a1,a2
    c388:	00060493          	mv	s1,a2
    c38c:	40b709b3          	sub	s3,a4,a1
    c390:	00899793          	sll	a5,s3,0x8
    c394:	3207da63          	bgez	a5,c6c8 <__adddf3+0x404>
    c398:	008007b7          	lui	a5,0x800
    c39c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c3a0:	00f9f9b3          	and	s3,s3,a5
    c3a4:	2c098863          	beqz	s3,c674 <__adddf3+0x3b0>
    c3a8:	00098513          	mv	a0,s3
    c3ac:	359020ef          	jal	ef04 <__clzsi2>
    c3b0:	ff850793          	add	a5,a0,-8
    c3b4:	02000693          	li	a3,32
    c3b8:	40f68733          	sub	a4,a3,a5
    c3bc:	00e4d733          	srl	a4,s1,a4
    c3c0:	00f999b3          	sll	s3,s3,a5
    c3c4:	01376733          	or	a4,a4,s3
    c3c8:	00f494b3          	sll	s1,s1,a5
    c3cc:	4b27c863          	blt	a5,s2,c87c <__adddf3+0x5b8>
    c3d0:	412787b3          	sub	a5,a5,s2
    c3d4:	00178793          	add	a5,a5,1
    c3d8:	40f686b3          	sub	a3,a3,a5
    c3dc:	00d49633          	sll	a2,s1,a3
    c3e0:	00f4d9b3          	srl	s3,s1,a5
    c3e4:	00c03633          	snez	a2,a2
    c3e8:	01366633          	or	a2,a2,s3
    c3ec:	00d716b3          	sll	a3,a4,a3
    c3f0:	00c6e4b3          	or	s1,a3,a2
    c3f4:	00f759b3          	srl	s3,a4,a5
    c3f8:	00000913          	li	s2,0
    c3fc:	0074f793          	and	a5,s1,7
    c400:	02078063          	beqz	a5,c420 <__adddf3+0x15c>
    c404:	00f4f793          	and	a5,s1,15
    c408:	00400713          	li	a4,4
    c40c:	00e78a63          	beq	a5,a4,c420 <__adddf3+0x15c>
    c410:	00448793          	add	a5,s1,4
    c414:	0097b633          	sltu	a2,a5,s1
    c418:	00c989b3          	add	s3,s3,a2
    c41c:	00078493          	mv	s1,a5
    c420:	00899793          	sll	a5,s3,0x8
    c424:	6e07da63          	bgez	a5,cb18 <__adddf3+0x854>
    c428:	00190793          	add	a5,s2,1
    c42c:	7ff00713          	li	a4,2047
    c430:	00040e13          	mv	t3,s0
    c434:	2ae78663          	beq	a5,a4,c6e0 <__adddf3+0x41c>
    c438:	ff800737          	lui	a4,0xff800
    c43c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c440:	00e9f733          	and	a4,s3,a4
    c444:	7ff7f793          	and	a5,a5,2047
    c448:	01d71813          	sll	a6,a4,0x1d
    c44c:	0034d613          	srl	a2,s1,0x3
    c450:	00971713          	sll	a4,a4,0x9
    c454:	00c86833          	or	a6,a6,a2
    c458:	00c75713          	srl	a4,a4,0xc
    c45c:	01c12083          	lw	ra,28(sp)
    c460:	01812403          	lw	s0,24(sp)
    c464:	01479793          	sll	a5,a5,0x14
    c468:	00e7e7b3          	or	a5,a5,a4
    c46c:	01fe1713          	sll	a4,t3,0x1f
    c470:	00e7e7b3          	or	a5,a5,a4
    c474:	01412483          	lw	s1,20(sp)
    c478:	01012903          	lw	s2,16(sp)
    c47c:	00c12983          	lw	s3,12(sp)
    c480:	00080513          	mv	a0,a6
    c484:	00078593          	mv	a1,a5
    c488:	02010113          	add	sp,sp,32
    c48c:	00008067          	ret
    c490:	14078c63          	beqz	a5,c5e8 <__adddf3+0x324>
    c494:	412307b3          	sub	a5,t1,s2
    c498:	3c091263          	bnez	s2,c85c <__adddf3+0x598>
    c49c:	00b76533          	or	a0,a4,a1
    c4a0:	4c050463          	beqz	a0,c968 <__adddf3+0x6a4>
    c4a4:	fff78513          	add	a0,a5,-1
    c4a8:	60050263          	beqz	a0,caac <__adddf3+0x7e8>
    c4ac:	7ff00813          	li	a6,2047
    c4b0:	57078663          	beq	a5,a6,ca1c <__adddf3+0x758>
    c4b4:	03800793          	li	a5,56
    c4b8:	00100613          	li	a2,1
    c4bc:	02a7cc63          	blt	a5,a0,c4f4 <__adddf3+0x230>
    c4c0:	00050793          	mv	a5,a0
    c4c4:	01f00613          	li	a2,31
    c4c8:	56f64c63          	blt	a2,a5,ca40 <__adddf3+0x77c>
    c4cc:	02000513          	li	a0,32
    c4d0:	40f50533          	sub	a0,a0,a5
    c4d4:	00a71633          	sll	a2,a4,a0
    c4d8:	00f5d833          	srl	a6,a1,a5
    c4dc:	00a59533          	sll	a0,a1,a0
    c4e0:	01066633          	or	a2,a2,a6
    c4e4:	00a03533          	snez	a0,a0
    c4e8:	00f75733          	srl	a4,a4,a5
    c4ec:	00a66633          	or	a2,a2,a0
    c4f0:	40e888b3          	sub	a7,a7,a4
    c4f4:	40cf0633          	sub	a2,t5,a2
    c4f8:	00cf3733          	sltu	a4,t5,a2
    c4fc:	00060493          	mv	s1,a2
    c500:	40e889b3          	sub	s3,a7,a4
    c504:	00030913          	mv	s2,t1
    c508:	00068413          	mv	s0,a3
    c50c:	e85ff06f          	j	c390 <__adddf3+0xcc>
    c510:	1ef05063          	blez	a5,c6f0 <__adddf3+0x42c>
    c514:	14031063          	bnez	t1,c654 <__adddf3+0x390>
    c518:	01e8e6b3          	or	a3,a7,t5
    c51c:	26068c63          	beqz	a3,c794 <__adddf3+0x4d0>
    c520:	fff78693          	add	a3,a5,-1
    c524:	48068063          	beqz	a3,c9a4 <__adddf3+0x6e0>
    c528:	7ff00613          	li	a2,2047
    c52c:	22c78c63          	beq	a5,a2,c764 <__adddf3+0x4a0>
    c530:	03800793          	li	a5,56
    c534:	00100993          	li	s3,1
    c538:	02d7cc63          	blt	a5,a3,c570 <__adddf3+0x2ac>
    c53c:	00068793          	mv	a5,a3
    c540:	01f00693          	li	a3,31
    c544:	4af6c063          	blt	a3,a5,c9e4 <__adddf3+0x720>
    c548:	02000693          	li	a3,32
    c54c:	40f686b3          	sub	a3,a3,a5
    c550:	00d899b3          	sll	s3,a7,a3
    c554:	00ff5633          	srl	a2,t5,a5
    c558:	00df16b3          	sll	a3,t5,a3
    c55c:	00c9e9b3          	or	s3,s3,a2
    c560:	00d036b3          	snez	a3,a3
    c564:	00f8d8b3          	srl	a7,a7,a5
    c568:	00d9e9b3          	or	s3,s3,a3
    c56c:	01170733          	add	a4,a4,a7
    c570:	00b985b3          	add	a1,s3,a1
    c574:	0135b9b3          	sltu	s3,a1,s3
    c578:	00058493          	mv	s1,a1
    c57c:	00e989b3          	add	s3,s3,a4
    c580:	00899793          	sll	a5,s3,0x8
    c584:	1407d263          	bgez	a5,c6c8 <__adddf3+0x404>
    c588:	00190913          	add	s2,s2,1
    c58c:	7ff00793          	li	a5,2047
    c590:	36f90c63          	beq	s2,a5,c908 <__adddf3+0x644>
    c594:	ff8007b7          	lui	a5,0xff800
    c598:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c59c:	0014f613          	and	a2,s1,1
    c5a0:	00f9f7b3          	and	a5,s3,a5
    c5a4:	0014d713          	srl	a4,s1,0x1
    c5a8:	00c76733          	or	a4,a4,a2
    c5ac:	01f79613          	sll	a2,a5,0x1f
    c5b0:	00e664b3          	or	s1,a2,a4
    c5b4:	0017d993          	srl	s3,a5,0x1
    c5b8:	e45ff06f          	j	c3fc <__adddf3+0x138>
    c5bc:	01e8e6b3          	or	a3,a7,t5
    c5c0:	1c068a63          	beqz	a3,c794 <__adddf3+0x4d0>
    c5c4:	fff78693          	add	a3,a5,-1
    c5c8:	40068063          	beqz	a3,c9c8 <__adddf3+0x704>
    c5cc:	7ff00613          	li	a2,2047
    c5d0:	18c78a63          	beq	a5,a2,c764 <__adddf3+0x4a0>
    c5d4:	03800793          	li	a5,56
    c5d8:	00100613          	li	a2,1
    c5dc:	dad7c2e3          	blt	a5,a3,c380 <__adddf3+0xbc>
    c5e0:	00068793          	mv	a5,a3
    c5e4:	d6dff06f          	j	c350 <__adddf3+0x8c>
    c5e8:	00190813          	add	a6,s2,1
    c5ec:	7fe87813          	and	a6,a6,2046
    c5f0:	22081c63          	bnez	a6,c828 <__adddf3+0x564>
    c5f4:	00b76333          	or	t1,a4,a1
    c5f8:	01e8e833          	or	a6,a7,t5
    c5fc:	38091063          	bnez	s2,c97c <__adddf3+0x6b8>
    c600:	46030e63          	beqz	t1,ca7c <__adddf3+0x7b8>
    c604:	40080663          	beqz	a6,ca10 <__adddf3+0x74c>
    c608:	41e589b3          	sub	s3,a1,t5
    c60c:	0135b533          	sltu	a0,a1,s3
    c610:	41170633          	sub	a2,a4,a7
    c614:	40a60633          	sub	a2,a2,a0
    c618:	00861513          	sll	a0,a2,0x8
    c61c:	50055e63          	bgez	a0,cb38 <__adddf3+0x874>
    c620:	40bf05b3          	sub	a1,t5,a1
    c624:	40e88733          	sub	a4,a7,a4
    c628:	00bf3f33          	sltu	t5,t5,a1
    c62c:	41e70733          	sub	a4,a4,t5
    c630:	00871613          	sll	a2,a4,0x8
    c634:	00058493          	mv	s1,a1
    c638:	52065e63          	bgez	a2,cb74 <__adddf3+0x8b0>
    c63c:	ff8007b7          	lui	a5,0xff800
    c640:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c644:	00f77733          	and	a4,a4,a5
    c648:	00068e13          	mv	t3,a3
    c64c:	00100793          	li	a5,1
    c650:	df9ff06f          	j	c448 <__adddf3+0x184>
    c654:	7ff00693          	li	a3,2047
    c658:	10d90663          	beq	s2,a3,c764 <__adddf3+0x4a0>
    c65c:	03800693          	li	a3,56
    c660:	00100993          	li	s3,1
    c664:	f0f6c6e3          	blt	a3,a5,c570 <__adddf3+0x2ac>
    c668:	008006b7          	lui	a3,0x800
    c66c:	00d8e8b3          	or	a7,a7,a3
    c670:	ed1ff06f          	j	c540 <__adddf3+0x27c>
    c674:	00048513          	mv	a0,s1
    c678:	08d020ef          	jal	ef04 <__clzsi2>
    c67c:	01850793          	add	a5,a0,24
    c680:	01f00693          	li	a3,31
    c684:	d2f6d8e3          	bge	a3,a5,c3b4 <__adddf3+0xf0>
    c688:	ff850713          	add	a4,a0,-8
    c68c:	00e49733          	sll	a4,s1,a4
    c690:	2327c663          	blt	a5,s2,c8bc <__adddf3+0x5f8>
    c694:	41278933          	sub	s2,a5,s2
    c698:	00190793          	add	a5,s2,1
    c69c:	48f6d663          	bge	a3,a5,cb28 <__adddf3+0x864>
    c6a0:	fe190913          	add	s2,s2,-31
    c6a4:	02000693          	li	a3,32
    c6a8:	012754b3          	srl	s1,a4,s2
    c6ac:	00d78c63          	beq	a5,a3,c6c4 <__adddf3+0x400>
    c6b0:	04000693          	li	a3,64
    c6b4:	40f687b3          	sub	a5,a3,a5
    c6b8:	00f71733          	sll	a4,a4,a5
    c6bc:	00e03733          	snez	a4,a4
    c6c0:	00e4e4b3          	or	s1,s1,a4
    c6c4:	00000913          	li	s2,0
    c6c8:	0074f793          	and	a5,s1,7
    c6cc:	d2079ce3          	bnez	a5,c404 <__adddf3+0x140>
    c6d0:	00090793          	mv	a5,s2
    c6d4:	0034d613          	srl	a2,s1,0x3
    c6d8:	00098713          	mv	a4,s3
    c6dc:	0c00006f          	j	c79c <__adddf3+0x4d8>
    c6e0:	7ff00793          	li	a5,2047
    c6e4:	00000713          	li	a4,0
    c6e8:	00000813          	li	a6,0
    c6ec:	d71ff06f          	j	c45c <__adddf3+0x198>
    c6f0:	0c078a63          	beqz	a5,c7c4 <__adddf3+0x500>
    c6f4:	412307b3          	sub	a5,t1,s2
    c6f8:	1e090263          	beqz	s2,c8dc <__adddf3+0x618>
    c6fc:	7ff00693          	li	a3,2047
    c700:	32d30863          	beq	t1,a3,ca30 <__adddf3+0x76c>
    c704:	03800693          	li	a3,56
    c708:	00100993          	li	s3,1
    c70c:	02f6ce63          	blt	a3,a5,c748 <__adddf3+0x484>
    c710:	008006b7          	lui	a3,0x800
    c714:	00d76733          	or	a4,a4,a3
    c718:	01f00693          	li	a3,31
    c71c:	3cf6c863          	blt	a3,a5,caec <__adddf3+0x828>
    c720:	02000693          	li	a3,32
    c724:	40f686b3          	sub	a3,a3,a5
    c728:	00d719b3          	sll	s3,a4,a3
    c72c:	00f5d633          	srl	a2,a1,a5
    c730:	00d596b3          	sll	a3,a1,a3
    c734:	00c9e9b3          	or	s3,s3,a2
    c738:	00d036b3          	snez	a3,a3
    c73c:	00f75733          	srl	a4,a4,a5
    c740:	00d9e9b3          	or	s3,s3,a3
    c744:	00e888b3          	add	a7,a7,a4
    c748:	01e98733          	add	a4,s3,t5
    c74c:	013739b3          	sltu	s3,a4,s3
    c750:	00070493          	mv	s1,a4
    c754:	011989b3          	add	s3,s3,a7
    c758:	00030913          	mv	s2,t1
    c75c:	e25ff06f          	j	c580 <__adddf3+0x2bc>
    c760:	02081063          	bnez	a6,c780 <__adddf3+0x4bc>
    c764:	00351613          	sll	a2,a0,0x3
    c768:	00365613          	srl	a2,a2,0x3
    c76c:	01d71813          	sll	a6,a4,0x1d
    c770:	00c86833          	or	a6,a6,a2
    c774:	00375713          	srl	a4,a4,0x3
    c778:	01076733          	or	a4,a4,a6
    c77c:	18070663          	beqz	a4,c908 <__adddf3+0x644>
    c780:	00000e13          	li	t3,0
    c784:	7ff00793          	li	a5,2047
    c788:	00080737          	lui	a4,0x80
    c78c:	00000813          	li	a6,0
    c790:	ccdff06f          	j	c45c <__adddf3+0x198>
    c794:	00351613          	sll	a2,a0,0x3
    c798:	00365613          	srl	a2,a2,0x3
    c79c:	01d71813          	sll	a6,a4,0x1d
    c7a0:	7ff00693          	li	a3,2047
    c7a4:	00c86833          	or	a6,a6,a2
    c7a8:	00375713          	srl	a4,a4,0x3
    c7ac:	fcd786e3          	beq	a5,a3,c778 <__adddf3+0x4b4>
    c7b0:	00c71713          	sll	a4,a4,0xc
    c7b4:	00c75713          	srl	a4,a4,0xc
    c7b8:	7ff7f793          	and	a5,a5,2047
    c7bc:	00040e13          	mv	t3,s0
    c7c0:	c9dff06f          	j	c45c <__adddf3+0x198>
    c7c4:	00190693          	add	a3,s2,1
    c7c8:	7fe6f813          	and	a6,a3,2046
    c7cc:	14081863          	bnez	a6,c91c <__adddf3+0x658>
    c7d0:	00b766b3          	or	a3,a4,a1
    c7d4:	28091c63          	bnez	s2,ca6c <__adddf3+0x7a8>
    c7d8:	30068263          	beqz	a3,cadc <__adddf3+0x818>
    c7dc:	01e8e6b3          	or	a3,a7,t5
    c7e0:	22068863          	beqz	a3,ca10 <__adddf3+0x74c>
    c7e4:	01e587b3          	add	a5,a1,t5
    c7e8:	00b7b5b3          	sltu	a1,a5,a1
    c7ec:	01170733          	add	a4,a4,a7
    c7f0:	00b70733          	add	a4,a4,a1
    c7f4:	0037d813          	srl	a6,a5,0x3
    c7f8:	00871793          	sll	a5,a4,0x8
    c7fc:	00040e13          	mv	t3,s0
    c800:	3407de63          	bgez	a5,cb5c <__adddf3+0x898>
    c804:	ff8007b7          	lui	a5,0xff800
    c808:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c80c:	00f77733          	and	a4,a4,a5
    c810:	01d71793          	sll	a5,a4,0x1d
    c814:	00375713          	srl	a4,a4,0x3
    c818:	0107e833          	or	a6,a5,a6
    c81c:	01d77733          	and	a4,a4,t4
    c820:	00100793          	li	a5,1
    c824:	c39ff06f          	j	c45c <__adddf3+0x198>
    c828:	41e58833          	sub	a6,a1,t5
    c82c:	0105b7b3          	sltu	a5,a1,a6
    c830:	411709b3          	sub	s3,a4,a7
    c834:	40f989b3          	sub	s3,s3,a5
    c838:	00899793          	sll	a5,s3,0x8
    c83c:	00080493          	mv	s1,a6
    c840:	1007c663          	bltz	a5,c94c <__adddf3+0x688>
    c844:	01386833          	or	a6,a6,s3
    c848:	b4081ee3          	bnez	a6,c3a4 <__adddf3+0xe0>
    c84c:	00000e13          	li	t3,0
    c850:	00000793          	li	a5,0
    c854:	00000713          	li	a4,0
    c858:	c05ff06f          	j	c45c <__adddf3+0x198>
    c85c:	7ff00513          	li	a0,2047
    c860:	1aa30e63          	beq	t1,a0,ca1c <__adddf3+0x758>
    c864:	03800513          	li	a0,56
    c868:	00100613          	li	a2,1
    c86c:	c8f544e3          	blt	a0,a5,c4f4 <__adddf3+0x230>
    c870:	00800637          	lui	a2,0x800
    c874:	00c76733          	or	a4,a4,a2
    c878:	c4dff06f          	j	c4c4 <__adddf3+0x200>
    c87c:	ff8009b7          	lui	s3,0xff800
    c880:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c884:	40f90933          	sub	s2,s2,a5
    c888:	013779b3          	and	s3,a4,s3
    c88c:	b71ff06f          	j	c3fc <__adddf3+0x138>
    c890:	fe078693          	add	a3,a5,-32
    c894:	02000613          	li	a2,32
    c898:	00d8d6b3          	srl	a3,a7,a3
    c89c:	00c78a63          	beq	a5,a2,c8b0 <__adddf3+0x5ec>
    c8a0:	04000613          	li	a2,64
    c8a4:	40f607b3          	sub	a5,a2,a5
    c8a8:	00f897b3          	sll	a5,a7,a5
    c8ac:	00ff6f33          	or	t5,t5,a5
    c8b0:	01e03633          	snez	a2,t5
    c8b4:	00d66633          	or	a2,a2,a3
    c8b8:	ac9ff06f          	j	c380 <__adddf3+0xbc>
    c8bc:	ff8006b7          	lui	a3,0xff800
    c8c0:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c8c4:	40f907b3          	sub	a5,s2,a5
    c8c8:	00d77733          	and	a4,a4,a3
    c8cc:	01d71813          	sll	a6,a4,0x1d
    c8d0:	01386833          	or	a6,a6,s3
    c8d4:	00375713          	srl	a4,a4,0x3
    c8d8:	ed9ff06f          	j	c7b0 <__adddf3+0x4ec>
    c8dc:	00b766b3          	or	a3,a4,a1
    c8e0:	1e068663          	beqz	a3,cacc <__adddf3+0x808>
    c8e4:	fff78693          	add	a3,a5,-1
    c8e8:	0a068e63          	beqz	a3,c9a4 <__adddf3+0x6e0>
    c8ec:	7ff00513          	li	a0,2047
    c8f0:	14a78063          	beq	a5,a0,ca30 <__adddf3+0x76c>
    c8f4:	03800793          	li	a5,56
    c8f8:	00100993          	li	s3,1
    c8fc:	e4d7c6e3          	blt	a5,a3,c748 <__adddf3+0x484>
    c900:	00068793          	mv	a5,a3
    c904:	e15ff06f          	j	c718 <__adddf3+0x454>
    c908:	00040e13          	mv	t3,s0
    c90c:	7ff00793          	li	a5,2047
    c910:	00000713          	li	a4,0
    c914:	00000813          	li	a6,0
    c918:	b45ff06f          	j	c45c <__adddf3+0x198>
    c91c:	7ff00793          	li	a5,2047
    c920:	fef684e3          	beq	a3,a5,c908 <__adddf3+0x644>
    c924:	01e58f33          	add	t5,a1,t5
    c928:	00bf35b3          	sltu	a1,t5,a1
    c92c:	011707b3          	add	a5,a4,a7
    c930:	00b787b3          	add	a5,a5,a1
    c934:	01f79613          	sll	a2,a5,0x1f
    c938:	001f5f13          	srl	t5,t5,0x1
    c93c:	01e664b3          	or	s1,a2,t5
    c940:	0017d993          	srl	s3,a5,0x1
    c944:	00068913          	mv	s2,a3
    c948:	ab5ff06f          	j	c3fc <__adddf3+0x138>
    c94c:	40bf0633          	sub	a2,t5,a1
    c950:	40e887b3          	sub	a5,a7,a4
    c954:	00cf3733          	sltu	a4,t5,a2
    c958:	00060493          	mv	s1,a2
    c95c:	40e789b3          	sub	s3,a5,a4
    c960:	00068413          	mv	s0,a3
    c964:	a41ff06f          	j	c3a4 <__adddf3+0xe0>
    c968:	00361613          	sll	a2,a2,0x3
    c96c:	00365613          	srl	a2,a2,0x3
    c970:	00068413          	mv	s0,a3
    c974:	00088713          	mv	a4,a7
    c978:	e25ff06f          	j	c79c <__adddf3+0x4d8>
    c97c:	de0312e3          	bnez	t1,c760 <__adddf3+0x49c>
    c980:	1c080663          	beqz	a6,cb4c <__adddf3+0x888>
    c984:	0038d713          	srl	a4,a7,0x3
    c988:	00361613          	sll	a2,a2,0x3
    c98c:	01d89893          	sll	a7,a7,0x1d
    c990:	01176733          	or	a4,a4,a7
    c994:	00365613          	srl	a2,a2,0x3
    c998:	00c76733          	or	a4,a4,a2
    c99c:	00068413          	mv	s0,a3
    c9a0:	dddff06f          	j	c77c <__adddf3+0x4b8>
    c9a4:	01e58f33          	add	t5,a1,t5
    c9a8:	011708b3          	add	a7,a4,a7
    c9ac:	00bf35b3          	sltu	a1,t5,a1
    c9b0:	00b889b3          	add	s3,a7,a1
    c9b4:	00899793          	sll	a5,s3,0x8
    c9b8:	000f0493          	mv	s1,t5
    c9bc:	0e07d463          	bgez	a5,caa4 <__adddf3+0x7e0>
    c9c0:	00200913          	li	s2,2
    c9c4:	bd1ff06f          	j	c594 <__adddf3+0x2d0>
    c9c8:	41e58f33          	sub	t5,a1,t5
    c9cc:	411708b3          	sub	a7,a4,a7
    c9d0:	01e5b5b3          	sltu	a1,a1,t5
    c9d4:	000f0493          	mv	s1,t5
    c9d8:	40b889b3          	sub	s3,a7,a1
    c9dc:	00100913          	li	s2,1
    c9e0:	9b1ff06f          	j	c390 <__adddf3+0xcc>
    c9e4:	fe078693          	add	a3,a5,-32
    c9e8:	02000613          	li	a2,32
    c9ec:	00d8d6b3          	srl	a3,a7,a3
    c9f0:	00c78a63          	beq	a5,a2,ca04 <__adddf3+0x740>
    c9f4:	04000613          	li	a2,64
    c9f8:	40f607b3          	sub	a5,a2,a5
    c9fc:	00f897b3          	sll	a5,a7,a5
    ca00:	00ff6f33          	or	t5,t5,a5
    ca04:	01e039b3          	snez	s3,t5
    ca08:	00d9e9b3          	or	s3,s3,a3
    ca0c:	b65ff06f          	j	c570 <__adddf3+0x2ac>
    ca10:	00351613          	sll	a2,a0,0x3
    ca14:	00365993          	srl	s3,a2,0x3
    ca18:	eb5ff06f          	j	c8cc <__adddf3+0x608>
    ca1c:	00361613          	sll	a2,a2,0x3
    ca20:	00365613          	srl	a2,a2,0x3
    ca24:	00068413          	mv	s0,a3
    ca28:	00088713          	mv	a4,a7
    ca2c:	d41ff06f          	j	c76c <__adddf3+0x4a8>
    ca30:	00361613          	sll	a2,a2,0x3
    ca34:	00365613          	srl	a2,a2,0x3
    ca38:	00088713          	mv	a4,a7
    ca3c:	d31ff06f          	j	c76c <__adddf3+0x4a8>
    ca40:	fe078513          	add	a0,a5,-32
    ca44:	02000613          	li	a2,32
    ca48:	00a75533          	srl	a0,a4,a0
    ca4c:	00c78a63          	beq	a5,a2,ca60 <__adddf3+0x79c>
    ca50:	04000613          	li	a2,64
    ca54:	40f607b3          	sub	a5,a2,a5
    ca58:	00f717b3          	sll	a5,a4,a5
    ca5c:	00f5e5b3          	or	a1,a1,a5
    ca60:	00b03633          	snez	a2,a1
    ca64:	00a66633          	or	a2,a2,a0
    ca68:	a8dff06f          	j	c4f4 <__adddf3+0x230>
    ca6c:	fc0682e3          	beqz	a3,ca30 <__adddf3+0x76c>
    ca70:	01e8ef33          	or	t5,a7,t5
    ca74:	d00f16e3          	bnez	t5,c780 <__adddf3+0x4bc>
    ca78:	cedff06f          	j	c764 <__adddf3+0x4a0>
    ca7c:	dc0808e3          	beqz	a6,c84c <__adddf3+0x588>
    ca80:	00361813          	sll	a6,a2,0x3
    ca84:	01d89793          	sll	a5,a7,0x1d
    ca88:	00385813          	srl	a6,a6,0x3
    ca8c:	0038d713          	srl	a4,a7,0x3
    ca90:	00f86833          	or	a6,a6,a5
    ca94:	01d77733          	and	a4,a4,t4
    ca98:	00068e13          	mv	t3,a3
    ca9c:	00000793          	li	a5,0
    caa0:	9bdff06f          	j	c45c <__adddf3+0x198>
    caa4:	00100793          	li	a5,1
    caa8:	c2dff06f          	j	c6d4 <__adddf3+0x410>
    caac:	40bf05b3          	sub	a1,t5,a1
    cab0:	40e888b3          	sub	a7,a7,a4
    cab4:	00bf3733          	sltu	a4,t5,a1
    cab8:	00058493          	mv	s1,a1
    cabc:	40e889b3          	sub	s3,a7,a4
    cac0:	00068413          	mv	s0,a3
    cac4:	00100913          	li	s2,1
    cac8:	8c9ff06f          	j	c390 <__adddf3+0xcc>
    cacc:	00361613          	sll	a2,a2,0x3
    cad0:	00365613          	srl	a2,a2,0x3
    cad4:	00088713          	mv	a4,a7
    cad8:	cc5ff06f          	j	c79c <__adddf3+0x4d8>
    cadc:	00361613          	sll	a2,a2,0x3
    cae0:	00365993          	srl	s3,a2,0x3
    cae4:	00088713          	mv	a4,a7
    cae8:	de5ff06f          	j	c8cc <__adddf3+0x608>
    caec:	fe078693          	add	a3,a5,-32
    caf0:	02000613          	li	a2,32
    caf4:	00d756b3          	srl	a3,a4,a3
    caf8:	00c78a63          	beq	a5,a2,cb0c <__adddf3+0x848>
    cafc:	04000613          	li	a2,64
    cb00:	40f607b3          	sub	a5,a2,a5
    cb04:	00f717b3          	sll	a5,a4,a5
    cb08:	00f5e5b3          	or	a1,a1,a5
    cb0c:	00b039b3          	snez	s3,a1
    cb10:	00d9e9b3          	or	s3,s3,a3
    cb14:	c35ff06f          	j	c748 <__adddf3+0x484>
    cb18:	0034d613          	srl	a2,s1,0x3
    cb1c:	00090793          	mv	a5,s2
    cb20:	00098713          	mv	a4,s3
    cb24:	c79ff06f          	j	c79c <__adddf3+0x4d8>
    cb28:	02000693          	li	a3,32
    cb2c:	40f686b3          	sub	a3,a3,a5
    cb30:	00000613          	li	a2,0
    cb34:	8b5ff06f          	j	c3e8 <__adddf3+0x124>
    cb38:	00c9e833          	or	a6,s3,a2
    cb3c:	d00808e3          	beqz	a6,c84c <__adddf3+0x588>
    cb40:	0039d993          	srl	s3,s3,0x3
    cb44:	00060713          	mv	a4,a2
    cb48:	d85ff06f          	j	c8cc <__adddf3+0x608>
    cb4c:	00000e13          	li	t3,0
    cb50:	7ff00793          	li	a5,2047
    cb54:	00080737          	lui	a4,0x80
    cb58:	905ff06f          	j	c45c <__adddf3+0x198>
    cb5c:	01d71793          	sll	a5,a4,0x1d
    cb60:	00375713          	srl	a4,a4,0x3
    cb64:	0107e833          	or	a6,a5,a6
    cb68:	01d77733          	and	a4,a4,t4
    cb6c:	00000793          	li	a5,0
    cb70:	8edff06f          	j	c45c <__adddf3+0x198>
    cb74:	01d71813          	sll	a6,a4,0x1d
    cb78:	0035d593          	srl	a1,a1,0x3
    cb7c:	00b86833          	or	a6,a6,a1
    cb80:	00375713          	srl	a4,a4,0x3
    cb84:	00068413          	mv	s0,a3
    cb88:	c29ff06f          	j	c7b0 <__adddf3+0x4ec>

0000cb8c <__divdf3>:
    cb8c:	fb010113          	add	sp,sp,-80
    cb90:	0145d793          	srl	a5,a1,0x14
    cb94:	04812423          	sw	s0,72(sp)
    cb98:	04912223          	sw	s1,68(sp)
    cb9c:	05212023          	sw	s2,64(sp)
    cba0:	03412c23          	sw	s4,56(sp)
    cba4:	03512a23          	sw	s5,52(sp)
    cba8:	00c59493          	sll	s1,a1,0xc
    cbac:	04112623          	sw	ra,76(sp)
    cbb0:	03312e23          	sw	s3,60(sp)
    cbb4:	03612823          	sw	s6,48(sp)
    cbb8:	03712623          	sw	s7,44(sp)
    cbbc:	03812423          	sw	s8,40(sp)
    cbc0:	7ff7f793          	and	a5,a5,2047
    cbc4:	00050413          	mv	s0,a0
    cbc8:	00060a13          	mv	s4,a2
    cbcc:	00068913          	mv	s2,a3
    cbd0:	00c4d493          	srl	s1,s1,0xc
    cbd4:	01f5da93          	srl	s5,a1,0x1f
    cbd8:	18078c63          	beqz	a5,cd70 <__divdf3+0x1e4>
    cbdc:	7ff00713          	li	a4,2047
    cbe0:	08e78a63          	beq	a5,a4,cc74 <__divdf3+0xe8>
    cbe4:	01d55b13          	srl	s6,a0,0x1d
    cbe8:	00349493          	sll	s1,s1,0x3
    cbec:	009b64b3          	or	s1,s6,s1
    cbf0:	00800737          	lui	a4,0x800
    cbf4:	00e4eb33          	or	s6,s1,a4
    cbf8:	00351b93          	sll	s7,a0,0x3
    cbfc:	c0178993          	add	s3,a5,-1023
    cc00:	00000493          	li	s1,0
    cc04:	00000c13          	li	s8,0
    cc08:	01495793          	srl	a5,s2,0x14
    cc0c:	00c91413          	sll	s0,s2,0xc
    cc10:	7ff7f793          	and	a5,a5,2047
    cc14:	00c45413          	srl	s0,s0,0xc
    cc18:	01f95913          	srl	s2,s2,0x1f
    cc1c:	08078463          	beqz	a5,cca4 <__divdf3+0x118>
    cc20:	7ff00713          	li	a4,2047
    cc24:	18e78c63          	beq	a5,a4,cdbc <__divdf3+0x230>
    cc28:	00341413          	sll	s0,s0,0x3
    cc2c:	01da5713          	srl	a4,s4,0x1d
    cc30:	00876733          	or	a4,a4,s0
    cc34:	c0178793          	add	a5,a5,-1023
    cc38:	00800437          	lui	s0,0x800
    cc3c:	40f989b3          	sub	s3,s3,a5
    cc40:	00876433          	or	s0,a4,s0
    cc44:	003a1813          	sll	a6,s4,0x3
    cc48:	00000793          	li	a5,0
    cc4c:	00f00713          	li	a4,15
    cc50:	012aca33          	xor	s4,s5,s2
    cc54:	24976663          	bltu	a4,s1,cea0 <__divdf3+0x314>
    cc58:	00003697          	auipc	a3,0x3
    cc5c:	c7068693          	add	a3,a3,-912 # f8c8 <__mprec_tens+0xc8>
    cc60:	00249493          	sll	s1,s1,0x2
    cc64:	00d484b3          	add	s1,s1,a3
    cc68:	0004a703          	lw	a4,0(s1)
    cc6c:	00d70733          	add	a4,a4,a3
    cc70:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cc74:	00a4eb33          	or	s6,s1,a0
    cc78:	1c0b1e63          	bnez	s6,ce54 <__divdf3+0x2c8>
    cc7c:	01495793          	srl	a5,s2,0x14
    cc80:	00c91413          	sll	s0,s2,0xc
    cc84:	7ff7f793          	and	a5,a5,2047
    cc88:	00000b93          	li	s7,0
    cc8c:	00800493          	li	s1,8
    cc90:	7ff00993          	li	s3,2047
    cc94:	00200c13          	li	s8,2
    cc98:	00c45413          	srl	s0,s0,0xc
    cc9c:	01f95913          	srl	s2,s2,0x1f
    cca0:	f80790e3          	bnez	a5,cc20 <__divdf3+0x94>
    cca4:	01446833          	or	a6,s0,s4
    cca8:	1c080263          	beqz	a6,ce6c <__divdf3+0x2e0>
    ccac:	5c040663          	beqz	s0,d278 <__divdf3+0x6ec>
    ccb0:	00040513          	mv	a0,s0
    ccb4:	250020ef          	jal	ef04 <__clzsi2>
    ccb8:	00050793          	mv	a5,a0
    ccbc:	ff550693          	add	a3,a0,-11
    ccc0:	01d00713          	li	a4,29
    ccc4:	ff878813          	add	a6,a5,-8
    ccc8:	40d70733          	sub	a4,a4,a3
    cccc:	01041433          	sll	s0,s0,a6
    ccd0:	00ea5733          	srl	a4,s4,a4
    ccd4:	00876433          	or	s0,a4,s0
    ccd8:	010a1833          	sll	a6,s4,a6
    ccdc:	013787b3          	add	a5,a5,s3
    cce0:	3f378993          	add	s3,a5,1011
    cce4:	00000793          	li	a5,0
    cce8:	f65ff06f          	j	cc4c <__divdf3+0xc0>
    ccec:	40f70733          	sub	a4,a4,a5
    ccf0:	03800693          	li	a3,56
    ccf4:	60e6d063          	bge	a3,a4,d2f4 <__divdf3+0x768>
    ccf8:	00000793          	li	a5,0
    ccfc:	00000693          	li	a3,0
    cd00:	00000713          	li	a4,0
    cd04:	04c12083          	lw	ra,76(sp)
    cd08:	04812403          	lw	s0,72(sp)
    cd0c:	01479793          	sll	a5,a5,0x14
    cd10:	00d7e7b3          	or	a5,a5,a3
    cd14:	01fa1693          	sll	a3,s4,0x1f
    cd18:	00d7e7b3          	or	a5,a5,a3
    cd1c:	04412483          	lw	s1,68(sp)
    cd20:	04012903          	lw	s2,64(sp)
    cd24:	03c12983          	lw	s3,60(sp)
    cd28:	03812a03          	lw	s4,56(sp)
    cd2c:	03412a83          	lw	s5,52(sp)
    cd30:	03012b03          	lw	s6,48(sp)
    cd34:	02c12b83          	lw	s7,44(sp)
    cd38:	02812c03          	lw	s8,40(sp)
    cd3c:	00070513          	mv	a0,a4
    cd40:	00078593          	mv	a1,a5
    cd44:	05010113          	add	sp,sp,80
    cd48:	00008067          	ret
    cd4c:	7ff00793          	li	a5,2047
    cd50:	00000693          	li	a3,0
    cd54:	00000713          	li	a4,0
    cd58:	fadff06f          	j	cd04 <__divdf3+0x178>
    cd5c:	00000a13          	li	s4,0
    cd60:	7ff00793          	li	a5,2047
    cd64:	000806b7          	lui	a3,0x80
    cd68:	00000713          	li	a4,0
    cd6c:	f99ff06f          	j	cd04 <__divdf3+0x178>
    cd70:	00a4eb33          	or	s6,s1,a0
    cd74:	100b0c63          	beqz	s6,ce8c <__divdf3+0x300>
    cd78:	52048463          	beqz	s1,d2a0 <__divdf3+0x714>
    cd7c:	00048513          	mv	a0,s1
    cd80:	184020ef          	jal	ef04 <__clzsi2>
    cd84:	00050713          	mv	a4,a0
    cd88:	ff550793          	add	a5,a0,-11
    cd8c:	01d00b13          	li	s6,29
    cd90:	ff870b93          	add	s7,a4,-8
    cd94:	40fb0b33          	sub	s6,s6,a5
    cd98:	017494b3          	sll	s1,s1,s7
    cd9c:	01645b33          	srl	s6,s0,s6
    cda0:	009b6b33          	or	s6,s6,s1
    cda4:	01741bb3          	sll	s7,s0,s7
    cda8:	c0d00793          	li	a5,-1011
    cdac:	40e789b3          	sub	s3,a5,a4
    cdb0:	00000493          	li	s1,0
    cdb4:	00000c13          	li	s8,0
    cdb8:	e51ff06f          	j	cc08 <__divdf3+0x7c>
    cdbc:	01446833          	or	a6,s0,s4
    cdc0:	80198993          	add	s3,s3,-2047
    cdc4:	0a081c63          	bnez	a6,ce7c <__divdf3+0x2f0>
    cdc8:	0024e493          	or	s1,s1,2
    cdcc:	00000413          	li	s0,0
    cdd0:	00200793          	li	a5,2
    cdd4:	e79ff06f          	j	cc4c <__divdf3+0xc0>
    cdd8:	000a8913          	mv	s2,s5
    cddc:	000b0413          	mv	s0,s6
    cde0:	000b8813          	mv	a6,s7
    cde4:	00200793          	li	a5,2
    cde8:	60fc0863          	beq	s8,a5,d3f8 <__divdf3+0x86c>
    cdec:	00300793          	li	a5,3
    cdf0:	f6fc06e3          	beq	s8,a5,cd5c <__divdf3+0x1d0>
    cdf4:	00100793          	li	a5,1
    cdf8:	00090a13          	mv	s4,s2
    cdfc:	eefc0ee3          	beq	s8,a5,ccf8 <__divdf3+0x16c>
    ce00:	3ff98793          	add	a5,s3,1023
    ce04:	3cf05263          	blez	a5,d1c8 <__divdf3+0x63c>
    ce08:	00787713          	and	a4,a6,7
    ce0c:	5c071663          	bnez	a4,d3d8 <__divdf3+0x84c>
    ce10:	00741713          	sll	a4,s0,0x7
    ce14:	00075a63          	bgez	a4,ce28 <__divdf3+0x29c>
    ce18:	ff0007b7          	lui	a5,0xff000
    ce1c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    ce20:	00f47433          	and	s0,s0,a5
    ce24:	40098793          	add	a5,s3,1024
    ce28:	7fe00713          	li	a4,2046
    ce2c:	f2f740e3          	blt	a4,a5,cd4c <__divdf3+0x1c0>
    ce30:	00385813          	srl	a6,a6,0x3
    ce34:	01d41713          	sll	a4,s0,0x1d
    ce38:	00941693          	sll	a3,s0,0x9
    ce3c:	01076733          	or	a4,a4,a6
    ce40:	00c6d693          	srl	a3,a3,0xc
    ce44:	7ff7f793          	and	a5,a5,2047
    ce48:	ebdff06f          	j	cd04 <__divdf3+0x178>
    ce4c:	00078c13          	mv	s8,a5
    ce50:	f95ff06f          	j	cde4 <__divdf3+0x258>
    ce54:	00048b13          	mv	s6,s1
    ce58:	00050b93          	mv	s7,a0
    ce5c:	00c00493          	li	s1,12
    ce60:	7ff00993          	li	s3,2047
    ce64:	00300c13          	li	s8,3
    ce68:	da1ff06f          	j	cc08 <__divdf3+0x7c>
    ce6c:	0014e493          	or	s1,s1,1
    ce70:	00000413          	li	s0,0
    ce74:	00100793          	li	a5,1
    ce78:	dd5ff06f          	j	cc4c <__divdf3+0xc0>
    ce7c:	0034e493          	or	s1,s1,3
    ce80:	000a0813          	mv	a6,s4
    ce84:	00300793          	li	a5,3
    ce88:	dc5ff06f          	j	cc4c <__divdf3+0xc0>
    ce8c:	00000b93          	li	s7,0
    ce90:	00400493          	li	s1,4
    ce94:	00000993          	li	s3,0
    ce98:	00100c13          	li	s8,1
    ce9c:	d6dff06f          	j	cc08 <__divdf3+0x7c>
    cea0:	03912223          	sw	s9,36(sp)
    cea4:	03a12023          	sw	s10,32(sp)
    cea8:	01b12e23          	sw	s11,28(sp)
    ceac:	3b646a63          	bltu	s0,s6,d260 <__divdf3+0x6d4>
    ceb0:	3a8b0663          	beq	s6,s0,d25c <__divdf3+0x6d0>
    ceb4:	fff98993          	add	s3,s3,-1
    ceb8:	000b8c13          	mv	s8,s7
    cebc:	000b0493          	mv	s1,s6
    cec0:	00000d13          	li	s10,0
    cec4:	01885c93          	srl	s9,a6,0x18
    cec8:	00841413          	sll	s0,s0,0x8
    cecc:	01045913          	srl	s2,s0,0x10
    ced0:	008cecb3          	or	s9,s9,s0
    ced4:	00090593          	mv	a1,s2
    ced8:	00048513          	mv	a0,s1
    cedc:	010c9b13          	sll	s6,s9,0x10
    cee0:	00881a93          	sll	s5,a6,0x8
    cee4:	010b5b13          	srl	s6,s6,0x10
    cee8:	771010ef          	jal	ee58 <__hidden___udivsi3>
    ceec:	00050593          	mv	a1,a0
    cef0:	00050413          	mv	s0,a0
    cef4:	000b0513          	mv	a0,s6
    cef8:	69d010ef          	jal	ed94 <__mulsi3>
    cefc:	00050793          	mv	a5,a0
    cf00:	00090593          	mv	a1,s2
    cf04:	00048513          	mv	a0,s1
    cf08:	00078493          	mv	s1,a5
    cf0c:	795010ef          	jal	eea0 <__umodsi3>
    cf10:	01051513          	sll	a0,a0,0x10
    cf14:	010c5793          	srl	a5,s8,0x10
    cf18:	00a7e7b3          	or	a5,a5,a0
    cf1c:	0097fa63          	bgeu	a5,s1,cf30 <__divdf3+0x3a4>
    cf20:	00fc87b3          	add	a5,s9,a5
    cf24:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cf28:	3b97fe63          	bgeu	a5,s9,d2e4 <__divdf3+0x758>
    cf2c:	00070413          	mv	s0,a4
    cf30:	409784b3          	sub	s1,a5,s1
    cf34:	00090593          	mv	a1,s2
    cf38:	00048513          	mv	a0,s1
    cf3c:	71d010ef          	jal	ee58 <__hidden___udivsi3>
    cf40:	00050593          	mv	a1,a0
    cf44:	00050b93          	mv	s7,a0
    cf48:	000b0513          	mv	a0,s6
    cf4c:	649010ef          	jal	ed94 <__mulsi3>
    cf50:	00050793          	mv	a5,a0
    cf54:	00090593          	mv	a1,s2
    cf58:	00048513          	mv	a0,s1
    cf5c:	00078493          	mv	s1,a5
    cf60:	741010ef          	jal	eea0 <__umodsi3>
    cf64:	010c1793          	sll	a5,s8,0x10
    cf68:	01051513          	sll	a0,a0,0x10
    cf6c:	0107d793          	srl	a5,a5,0x10
    cf70:	00a7e7b3          	or	a5,a5,a0
    cf74:	0097fa63          	bgeu	a5,s1,cf88 <__divdf3+0x3fc>
    cf78:	00fc87b3          	add	a5,s9,a5
    cf7c:	fffb8713          	add	a4,s7,-1
    cf80:	3597fa63          	bgeu	a5,s9,d2d4 <__divdf3+0x748>
    cf84:	00070b93          	mv	s7,a4
    cf88:	00010337          	lui	t1,0x10
    cf8c:	01041413          	sll	s0,s0,0x10
    cf90:	01746433          	or	s0,s0,s7
    cf94:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    cf98:	01b478b3          	and	a7,s0,s11
    cf9c:	01bafdb3          	and	s11,s5,s11
    cfa0:	40978bb3          	sub	s7,a5,s1
    cfa4:	010adc13          	srl	s8,s5,0x10
    cfa8:	01045793          	srl	a5,s0,0x10
    cfac:	00088513          	mv	a0,a7
    cfb0:	000d8593          	mv	a1,s11
    cfb4:	5e1010ef          	jal	ed94 <__mulsi3>
    cfb8:	00050813          	mv	a6,a0
    cfbc:	000c0593          	mv	a1,s8
    cfc0:	00088513          	mv	a0,a7
    cfc4:	5d1010ef          	jal	ed94 <__mulsi3>
    cfc8:	00050893          	mv	a7,a0
    cfcc:	000d8593          	mv	a1,s11
    cfd0:	00078513          	mv	a0,a5
    cfd4:	5c1010ef          	jal	ed94 <__mulsi3>
    cfd8:	00050e13          	mv	t3,a0
    cfdc:	000c0593          	mv	a1,s8
    cfe0:	00078513          	mv	a0,a5
    cfe4:	5b1010ef          	jal	ed94 <__mulsi3>
    cfe8:	01085793          	srl	a5,a6,0x10
    cfec:	01c888b3          	add	a7,a7,t3
    cff0:	011787b3          	add	a5,a5,a7
    cff4:	01c7f463          	bgeu	a5,t3,cffc <__divdf3+0x470>
    cff8:	00650533          	add	a0,a0,t1
    cffc:	00010637          	lui	a2,0x10
    d000:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    d004:	00c7f4b3          	and	s1,a5,a2
    d008:	0107d693          	srl	a3,a5,0x10
    d00c:	01049493          	sll	s1,s1,0x10
    d010:	00c87833          	and	a6,a6,a2
    d014:	00a687b3          	add	a5,a3,a0
    d018:	010484b3          	add	s1,s1,a6
    d01c:	20fbea63          	bltu	s7,a5,d230 <__divdf3+0x6a4>
    d020:	20fb8663          	beq	s7,a5,d22c <__divdf3+0x6a0>
    d024:	409d04b3          	sub	s1,s10,s1
    d028:	40fb8bb3          	sub	s7,s7,a5
    d02c:	009d3d33          	sltu	s10,s10,s1
    d030:	41ab8bb3          	sub	s7,s7,s10
    d034:	377c8a63          	beq	s9,s7,d3a8 <__divdf3+0x81c>
    d038:	00090593          	mv	a1,s2
    d03c:	000b8513          	mv	a0,s7
    d040:	619010ef          	jal	ee58 <__hidden___udivsi3>
    d044:	00050593          	mv	a1,a0
    d048:	00a12623          	sw	a0,12(sp)
    d04c:	00050d13          	mv	s10,a0
    d050:	000b0513          	mv	a0,s6
    d054:	541010ef          	jal	ed94 <__mulsi3>
    d058:	00050793          	mv	a5,a0
    d05c:	00090593          	mv	a1,s2
    d060:	000b8513          	mv	a0,s7
    d064:	00078b93          	mv	s7,a5
    d068:	639010ef          	jal	eea0 <__umodsi3>
    d06c:	01051513          	sll	a0,a0,0x10
    d070:	0104d793          	srl	a5,s1,0x10
    d074:	00a7e7b3          	or	a5,a5,a0
    d078:	0377f063          	bgeu	a5,s7,d098 <__divdf3+0x50c>
    d07c:	00fc87b3          	add	a5,s9,a5
    d080:	fffd0693          	add	a3,s10,-1
    d084:	3797e263          	bltu	a5,s9,d3e8 <__divdf3+0x85c>
    d088:	3777f063          	bgeu	a5,s7,d3e8 <__divdf3+0x85c>
    d08c:	ffed0713          	add	a4,s10,-2
    d090:	00e12623          	sw	a4,12(sp)
    d094:	019787b3          	add	a5,a5,s9
    d098:	41778bb3          	sub	s7,a5,s7
    d09c:	00090593          	mv	a1,s2
    d0a0:	000b8513          	mv	a0,s7
    d0a4:	5b5010ef          	jal	ee58 <__hidden___udivsi3>
    d0a8:	00050593          	mv	a1,a0
    d0ac:	00050d13          	mv	s10,a0
    d0b0:	000b0513          	mv	a0,s6
    d0b4:	4e1010ef          	jal	ed94 <__mulsi3>
    d0b8:	00050793          	mv	a5,a0
    d0bc:	00090593          	mv	a1,s2
    d0c0:	000b8513          	mv	a0,s7
    d0c4:	00078913          	mv	s2,a5
    d0c8:	01049493          	sll	s1,s1,0x10
    d0cc:	5d5010ef          	jal	eea0 <__umodsi3>
    d0d0:	01051513          	sll	a0,a0,0x10
    d0d4:	0104d493          	srl	s1,s1,0x10
    d0d8:	00a4e4b3          	or	s1,s1,a0
    d0dc:	0124fe63          	bgeu	s1,s2,d0f8 <__divdf3+0x56c>
    d0e0:	009c84b3          	add	s1,s9,s1
    d0e4:	fffd0793          	add	a5,s10,-1
    d0e8:	3194e463          	bltu	s1,s9,d3f0 <__divdf3+0x864>
    d0ec:	3124f263          	bgeu	s1,s2,d3f0 <__divdf3+0x864>
    d0f0:	ffed0d13          	add	s10,s10,-2
    d0f4:	019484b3          	add	s1,s1,s9
    d0f8:	00c12783          	lw	a5,12(sp)
    d0fc:	412484b3          	sub	s1,s1,s2
    d100:	000d8593          	mv	a1,s11
    d104:	01079813          	sll	a6,a5,0x10
    d108:	01a86833          	or	a6,a6,s10
    d10c:	01081313          	sll	t1,a6,0x10
    d110:	01035313          	srl	t1,t1,0x10
    d114:	01085793          	srl	a5,a6,0x10
    d118:	00030513          	mv	a0,t1
    d11c:	479010ef          	jal	ed94 <__mulsi3>
    d120:	00050893          	mv	a7,a0
    d124:	000c0593          	mv	a1,s8
    d128:	00030513          	mv	a0,t1
    d12c:	469010ef          	jal	ed94 <__mulsi3>
    d130:	00050313          	mv	t1,a0
    d134:	000d8593          	mv	a1,s11
    d138:	00078513          	mv	a0,a5
    d13c:	459010ef          	jal	ed94 <__mulsi3>
    d140:	00050e13          	mv	t3,a0
    d144:	000c0593          	mv	a1,s8
    d148:	00078513          	mv	a0,a5
    d14c:	449010ef          	jal	ed94 <__mulsi3>
    d150:	0108d793          	srl	a5,a7,0x10
    d154:	01c30333          	add	t1,t1,t3
    d158:	006787b3          	add	a5,a5,t1
    d15c:	01c7f663          	bgeu	a5,t3,d168 <__divdf3+0x5dc>
    d160:	00010737          	lui	a4,0x10
    d164:	00e50533          	add	a0,a0,a4
    d168:	000106b7          	lui	a3,0x10
    d16c:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    d170:	0107d713          	srl	a4,a5,0x10
    d174:	00d7f7b3          	and	a5,a5,a3
    d178:	01079793          	sll	a5,a5,0x10
    d17c:	00d8f8b3          	and	a7,a7,a3
    d180:	00a70733          	add	a4,a4,a0
    d184:	011787b3          	add	a5,a5,a7
    d188:	02e4e063          	bltu	s1,a4,d1a8 <__divdf3+0x61c>
    d18c:	00e48c63          	beq	s1,a4,d1a4 <__divdf3+0x618>
    d190:	02412c83          	lw	s9,36(sp)
    d194:	02012d03          	lw	s10,32(sp)
    d198:	01c12d83          	lw	s11,28(sp)
    d19c:	00186813          	or	a6,a6,1
    d1a0:	c61ff06f          	j	ce00 <__divdf3+0x274>
    d1a4:	1c078a63          	beqz	a5,d378 <__divdf3+0x7ec>
    d1a8:	009c84b3          	add	s1,s9,s1
    d1ac:	fff80613          	add	a2,a6,-1
    d1b0:	00048693          	mv	a3,s1
    d1b4:	1b94ec63          	bltu	s1,s9,d36c <__divdf3+0x7e0>
    d1b8:	24e4ea63          	bltu	s1,a4,d40c <__divdf3+0x880>
    d1bc:	26e48863          	beq	s1,a4,d42c <__divdf3+0x8a0>
    d1c0:	00060813          	mv	a6,a2
    d1c4:	fcdff06f          	j	d190 <__divdf3+0x604>
    d1c8:	00100713          	li	a4,1
    d1cc:	b20790e3          	bnez	a5,ccec <__divdf3+0x160>
    d1d0:	41e98793          	add	a5,s3,1054
    d1d4:	00f816b3          	sll	a3,a6,a5
    d1d8:	00d036b3          	snez	a3,a3
    d1dc:	00f417b3          	sll	a5,s0,a5
    d1e0:	00f6e7b3          	or	a5,a3,a5
    d1e4:	00e85833          	srl	a6,a6,a4
    d1e8:	00f86833          	or	a6,a6,a5
    d1ec:	00787793          	and	a5,a6,7
    d1f0:	00e45433          	srl	s0,s0,a4
    d1f4:	02078063          	beqz	a5,d214 <__divdf3+0x688>
    d1f8:	00f87793          	and	a5,a6,15
    d1fc:	00400713          	li	a4,4
    d200:	00e78a63          	beq	a5,a4,d214 <__divdf3+0x688>
    d204:	00480793          	add	a5,a6,4
    d208:	0107b833          	sltu	a6,a5,a6
    d20c:	01040433          	add	s0,s0,a6
    d210:	00078813          	mv	a6,a5
    d214:	00841613          	sll	a2,s0,0x8
    d218:	00100793          	li	a5,1
    d21c:	00000693          	li	a3,0
    d220:	00000713          	li	a4,0
    d224:	ae0640e3          	bltz	a2,cd04 <__divdf3+0x178>
    d228:	1280006f          	j	d350 <__divdf3+0x7c4>
    d22c:	de9d7ce3          	bgeu	s10,s1,d024 <__divdf3+0x498>
    d230:	015d06b3          	add	a3,s10,s5
    d234:	01a6b633          	sltu	a2,a3,s10
    d238:	019605b3          	add	a1,a2,s9
    d23c:	00bb8bb3          	add	s7,s7,a1
    d240:	00068d13          	mv	s10,a3
    d244:	fff40593          	add	a1,s0,-1
    d248:	077cfe63          	bgeu	s9,s7,d2c4 <__divdf3+0x738>
    d24c:	14fbe063          	bltu	s7,a5,d38c <__divdf3+0x800>
    d250:	13778c63          	beq	a5,s7,d388 <__divdf3+0x7fc>
    d254:	00058413          	mv	s0,a1
    d258:	dcdff06f          	j	d024 <__divdf3+0x498>
    d25c:	c50bece3          	bltu	s7,a6,ceb4 <__divdf3+0x328>
    d260:	01fb1c13          	sll	s8,s6,0x1f
    d264:	001bd713          	srl	a4,s7,0x1
    d268:	001b5493          	srl	s1,s6,0x1
    d26c:	00ec6c33          	or	s8,s8,a4
    d270:	01fb9d13          	sll	s10,s7,0x1f
    d274:	c51ff06f          	j	cec4 <__divdf3+0x338>
    d278:	000a0513          	mv	a0,s4
    d27c:	489010ef          	jal	ef04 <__clzsi2>
    d280:	01550693          	add	a3,a0,21
    d284:	01c00713          	li	a4,28
    d288:	02050793          	add	a5,a0,32
    d28c:	a2d75ae3          	bge	a4,a3,ccc0 <__divdf3+0x134>
    d290:	ff850513          	add	a0,a0,-8
    d294:	00000813          	li	a6,0
    d298:	00aa1433          	sll	s0,s4,a0
    d29c:	a41ff06f          	j	ccdc <__divdf3+0x150>
    d2a0:	465010ef          	jal	ef04 <__clzsi2>
    d2a4:	01550793          	add	a5,a0,21
    d2a8:	01c00693          	li	a3,28
    d2ac:	02050713          	add	a4,a0,32
    d2b0:	acf6dee3          	bge	a3,a5,cd8c <__divdf3+0x200>
    d2b4:	ff850493          	add	s1,a0,-8
    d2b8:	00941b33          	sll	s6,s0,s1
    d2bc:	00000b93          	li	s7,0
    d2c0:	ae9ff06f          	j	cda8 <__divdf3+0x21c>
    d2c4:	f97c98e3          	bne	s9,s7,d254 <__divdf3+0x6c8>
    d2c8:	f80602e3          	beqz	a2,d24c <__divdf3+0x6c0>
    d2cc:	00058413          	mv	s0,a1
    d2d0:	d55ff06f          	j	d024 <__divdf3+0x498>
    d2d4:	ca97f8e3          	bgeu	a5,s1,cf84 <__divdf3+0x3f8>
    d2d8:	ffeb8b93          	add	s7,s7,-2
    d2dc:	019787b3          	add	a5,a5,s9
    d2e0:	ca9ff06f          	j	cf88 <__divdf3+0x3fc>
    d2e4:	c497f4e3          	bgeu	a5,s1,cf2c <__divdf3+0x3a0>
    d2e8:	ffe40413          	add	s0,s0,-2
    d2ec:	019787b3          	add	a5,a5,s9
    d2f0:	c41ff06f          	j	cf30 <__divdf3+0x3a4>
    d2f4:	01f00693          	li	a3,31
    d2f8:	ece6dce3          	bge	a3,a4,d1d0 <__divdf3+0x644>
    d2fc:	fe100693          	li	a3,-31
    d300:	40f686b3          	sub	a3,a3,a5
    d304:	02000793          	li	a5,32
    d308:	00d456b3          	srl	a3,s0,a3
    d30c:	00f70863          	beq	a4,a5,d31c <__divdf3+0x790>
    d310:	43e98793          	add	a5,s3,1086
    d314:	00f417b3          	sll	a5,s0,a5
    d318:	00f86833          	or	a6,a6,a5
    d31c:	01003833          	snez	a6,a6
    d320:	00d86833          	or	a6,a6,a3
    d324:	00787713          	and	a4,a6,7
    d328:	00000693          	li	a3,0
    d32c:	02070863          	beqz	a4,d35c <__divdf3+0x7d0>
    d330:	00f87793          	and	a5,a6,15
    d334:	00400713          	li	a4,4
    d338:	00000413          	li	s0,0
    d33c:	00e78a63          	beq	a5,a4,d350 <__divdf3+0x7c4>
    d340:	00480793          	add	a5,a6,4
    d344:	0107b833          	sltu	a6,a5,a6
    d348:	01003433          	snez	s0,a6
    d34c:	00078813          	mv	a6,a5
    d350:	00941693          	sll	a3,s0,0x9
    d354:	01d41713          	sll	a4,s0,0x1d
    d358:	00c6d693          	srl	a3,a3,0xc
    d35c:	00385813          	srl	a6,a6,0x3
    d360:	00e86733          	or	a4,a6,a4
    d364:	00000793          	li	a5,0
    d368:	99dff06f          	j	cd04 <__divdf3+0x178>
    d36c:	00060813          	mv	a6,a2
    d370:	e2e690e3          	bne	a3,a4,d190 <__divdf3+0x604>
    d374:	e1579ee3          	bne	a5,s5,d190 <__divdf3+0x604>
    d378:	02412c83          	lw	s9,36(sp)
    d37c:	02012d03          	lw	s10,32(sp)
    d380:	01c12d83          	lw	s11,28(sp)
    d384:	a7dff06f          	j	ce00 <__divdf3+0x274>
    d388:	ec96f6e3          	bgeu	a3,s1,d254 <__divdf3+0x6c8>
    d38c:	00da86b3          	add	a3,s5,a3
    d390:	0156b633          	sltu	a2,a3,s5
    d394:	01960633          	add	a2,a2,s9
    d398:	ffe40413          	add	s0,s0,-2
    d39c:	00068d13          	mv	s10,a3
    d3a0:	00cb8bb3          	add	s7,s7,a2
    d3a4:	c81ff06f          	j	d024 <__divdf3+0x498>
    d3a8:	c0200713          	li	a4,-1022
    d3ac:	02412c83          	lw	s9,36(sp)
    d3b0:	02012d03          	lw	s10,32(sp)
    d3b4:	01c12d83          	lw	s11,28(sp)
    d3b8:	3ff98793          	add	a5,s3,1023
    d3bc:	fff00813          	li	a6,-1
    d3c0:	e0e9c4e3          	blt	s3,a4,d1c8 <__divdf3+0x63c>
    d3c4:	00480713          	add	a4,a6,4
    d3c8:	01073833          	sltu	a6,a4,a6
    d3cc:	01040433          	add	s0,s0,a6
    d3d0:	00070813          	mv	a6,a4
    d3d4:	a3dff06f          	j	ce10 <__divdf3+0x284>
    d3d8:	00f87713          	and	a4,a6,15
    d3dc:	00400693          	li	a3,4
    d3e0:	a2d708e3          	beq	a4,a3,ce10 <__divdf3+0x284>
    d3e4:	fe1ff06f          	j	d3c4 <__divdf3+0x838>
    d3e8:	00d12623          	sw	a3,12(sp)
    d3ec:	cadff06f          	j	d098 <__divdf3+0x50c>
    d3f0:	00078d13          	mv	s10,a5
    d3f4:	d05ff06f          	j	d0f8 <__divdf3+0x56c>
    d3f8:	00090a13          	mv	s4,s2
    d3fc:	7ff00793          	li	a5,2047
    d400:	00000693          	li	a3,0
    d404:	00000713          	li	a4,0
    d408:	8fdff06f          	j	cd04 <__divdf3+0x178>
    d40c:	001a9613          	sll	a2,s5,0x1
    d410:	015636b3          	sltu	a3,a2,s5
    d414:	019686b3          	add	a3,a3,s9
    d418:	00d486b3          	add	a3,s1,a3
    d41c:	ffe80813          	add	a6,a6,-2
    d420:	00060a93          	mv	s5,a2
    d424:	f4e688e3          	beq	a3,a4,d374 <__divdf3+0x7e8>
    d428:	d69ff06f          	j	d190 <__divdf3+0x604>
    d42c:	fefae0e3          	bltu	s5,a5,d40c <__divdf3+0x880>
    d430:	00060813          	mv	a6,a2
    d434:	f41ff06f          	j	d374 <__divdf3+0x7e8>

0000d438 <__eqdf2>:
    d438:	0145d713          	srl	a4,a1,0x14
    d43c:	001007b7          	lui	a5,0x100
    d440:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d444:	0146d813          	srl	a6,a3,0x14
    d448:	7ff77713          	and	a4,a4,2047
    d44c:	7ff00313          	li	t1,2047
    d450:	00b7fe33          	and	t3,a5,a1
    d454:	00050893          	mv	a7,a0
    d458:	00d7f7b3          	and	a5,a5,a3
    d45c:	01f5d593          	srl	a1,a1,0x1f
    d460:	7ff87813          	and	a6,a6,2047
    d464:	01f6d693          	srl	a3,a3,0x1f
    d468:	00100513          	li	a0,1
    d46c:	00670c63          	beq	a4,t1,d484 <__eqdf2+0x4c>
    d470:	00680863          	beq	a6,t1,d480 <__eqdf2+0x48>
    d474:	01071463          	bne	a4,a6,d47c <__eqdf2+0x44>
    d478:	02fe0663          	beq	t3,a5,d4a4 <__eqdf2+0x6c>
    d47c:	00008067          	ret
    d480:	00008067          	ret
    d484:	fee81ce3          	bne	a6,a4,d47c <__eqdf2+0x44>
    d488:	00fe67b3          	or	a5,t3,a5
    d48c:	00c7e7b3          	or	a5,a5,a2
    d490:	0117e7b3          	or	a5,a5,a7
    d494:	fe0794e3          	bnez	a5,d47c <__eqdf2+0x44>
    d498:	40d585b3          	sub	a1,a1,a3
    d49c:	00b03533          	snez	a0,a1
    d4a0:	00008067          	ret
    d4a4:	fcc89ce3          	bne	a7,a2,d47c <__eqdf2+0x44>
    d4a8:	00d58a63          	beq	a1,a3,d4bc <__eqdf2+0x84>
    d4ac:	fc0718e3          	bnez	a4,d47c <__eqdf2+0x44>
    d4b0:	011e6e33          	or	t3,t3,a7
    d4b4:	01c03533          	snez	a0,t3
    d4b8:	00008067          	ret
    d4bc:	00000513          	li	a0,0
    d4c0:	00008067          	ret

0000d4c4 <__gedf2>:
    d4c4:	0145d893          	srl	a7,a1,0x14
    d4c8:	001007b7          	lui	a5,0x100
    d4cc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d4d0:	0146d713          	srl	a4,a3,0x14
    d4d4:	7ff8f893          	and	a7,a7,2047
    d4d8:	7ff00e13          	li	t3,2047
    d4dc:	00b7f333          	and	t1,a5,a1
    d4e0:	00050813          	mv	a6,a0
    d4e4:	00050e93          	mv	t4,a0
    d4e8:	00d7f7b3          	and	a5,a5,a3
    d4ec:	01f5d593          	srl	a1,a1,0x1f
    d4f0:	00060f13          	mv	t5,a2
    d4f4:	7ff77513          	and	a0,a4,2047
    d4f8:	01f6d693          	srl	a3,a3,0x1f
    d4fc:	05c88863          	beq	a7,t3,d54c <__gedf2+0x88>
    d500:	03c50463          	beq	a0,t3,d528 <__gedf2+0x64>
    d504:	06089a63          	bnez	a7,d578 <__gedf2+0xb4>
    d508:	01036833          	or	a6,t1,a6
    d50c:	06051063          	bnez	a0,d56c <__gedf2+0xa8>
    d510:	00c7e633          	or	a2,a5,a2
    d514:	08060c63          	beqz	a2,d5ac <__gedf2+0xe8>
    d518:	0a081263          	bnez	a6,d5bc <__gedf2+0xf8>
    d51c:	00100513          	li	a0,1
    d520:	08068263          	beqz	a3,d5a4 <__gedf2+0xe0>
    d524:	00008067          	ret
    d528:	00c7e633          	or	a2,a5,a2
    d52c:	08061463          	bnez	a2,d5b4 <__gedf2+0xf0>
    d530:	00089663          	bnez	a7,d53c <__gedf2+0x78>
    d534:	01036333          	or	t1,t1,a6
    d538:	fe0302e3          	beqz	t1,d51c <__gedf2+0x58>
    d53c:	06d58063          	beq	a1,a3,d59c <__gedf2+0xd8>
    d540:	06059263          	bnez	a1,d5a4 <__gedf2+0xe0>
    d544:	00100513          	li	a0,1
    d548:	00008067          	ret
    d54c:	01036333          	or	t1,t1,a6
    d550:	06031263          	bnez	t1,d5b4 <__gedf2+0xf0>
    d554:	ff1516e3          	bne	a0,a7,d540 <__gedf2+0x7c>
    d558:	00c7e7b3          	or	a5,a5,a2
    d55c:	04079c63          	bnez	a5,d5b4 <__gedf2+0xf0>
    d560:	fed590e3          	bne	a1,a3,d540 <__gedf2+0x7c>
    d564:	00000513          	li	a0,0
    d568:	00008067          	ret
    d56c:	fa0808e3          	beqz	a6,d51c <__gedf2+0x58>
    d570:	fcd598e3          	bne	a1,a3,d540 <__gedf2+0x7c>
    d574:	0280006f          	j	d59c <__gedf2+0xd8>
    d578:	fc0504e3          	beqz	a0,d540 <__gedf2+0x7c>
    d57c:	fcd592e3          	bne	a1,a3,d540 <__gedf2+0x7c>
    d580:	fd1540e3          	blt	a0,a7,d540 <__gedf2+0x7c>
    d584:	00a8cc63          	blt	a7,a0,d59c <__gedf2+0xd8>
    d588:	fa67ece3          	bltu	a5,t1,d540 <__gedf2+0x7c>
    d58c:	00f31863          	bne	t1,a5,d59c <__gedf2+0xd8>
    d590:	fbdf68e3          	bltu	t5,t4,d540 <__gedf2+0x7c>
    d594:	00000513          	li	a0,0
    d598:	f9eef6e3          	bgeu	t4,t5,d524 <__gedf2+0x60>
    d59c:	00100513          	li	a0,1
    d5a0:	f80592e3          	bnez	a1,d524 <__gedf2+0x60>
    d5a4:	fff00513          	li	a0,-1
    d5a8:	00008067          	ret
    d5ac:	f8081ae3          	bnez	a6,d540 <__gedf2+0x7c>
    d5b0:	00008067          	ret
    d5b4:	ffe00513          	li	a0,-2
    d5b8:	00008067          	ret
    d5bc:	fcd586e3          	beq	a1,a3,d588 <__gedf2+0xc4>
    d5c0:	f81ff06f          	j	d540 <__gedf2+0x7c>

0000d5c4 <__ledf2>:
    d5c4:	0145d893          	srl	a7,a1,0x14
    d5c8:	001007b7          	lui	a5,0x100
    d5cc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d5d0:	0146d713          	srl	a4,a3,0x14
    d5d4:	7ff8f893          	and	a7,a7,2047
    d5d8:	7ff00313          	li	t1,2047
    d5dc:	00b7fe33          	and	t3,a5,a1
    d5e0:	00050813          	mv	a6,a0
    d5e4:	00050e93          	mv	t4,a0
    d5e8:	00d7f7b3          	and	a5,a5,a3
    d5ec:	01f5d593          	srl	a1,a1,0x1f
    d5f0:	00060f13          	mv	t5,a2
    d5f4:	7ff77513          	and	a0,a4,2047
    d5f8:	01f6d693          	srl	a3,a3,0x1f
    d5fc:	04688a63          	beq	a7,t1,d650 <__ledf2+0x8c>
    d600:	02650463          	beq	a0,t1,d628 <__ledf2+0x64>
    d604:	06089863          	bnez	a7,d674 <__ledf2+0xb0>
    d608:	010e6833          	or	a6,t3,a6
    d60c:	08051e63          	bnez	a0,d6a8 <__ledf2+0xe4>
    d610:	00c7e633          	or	a2,a5,a2
    d614:	0a060463          	beqz	a2,d6bc <__ledf2+0xf8>
    d618:	0a081663          	bnez	a6,d6c4 <__ledf2+0x100>
    d61c:	00100513          	li	a0,1
    d620:	08068063          	beqz	a3,d6a0 <__ledf2+0xdc>
    d624:	00008067          	ret
    d628:	00c7e633          	or	a2,a5,a2
    d62c:	00200513          	li	a0,2
    d630:	fe061ae3          	bnez	a2,d624 <__ledf2+0x60>
    d634:	00089663          	bnez	a7,d640 <__ledf2+0x7c>
    d638:	010e6e33          	or	t3,t3,a6
    d63c:	fe0e00e3          	beqz	t3,d61c <__ledf2+0x58>
    d640:	04d58c63          	beq	a1,a3,d698 <__ledf2+0xd4>
    d644:	04059e63          	bnez	a1,d6a0 <__ledf2+0xdc>
    d648:	00100513          	li	a0,1
    d64c:	00008067          	ret
    d650:	010e6e33          	or	t3,t3,a6
    d654:	060e1063          	bnez	t3,d6b4 <__ledf2+0xf0>
    d658:	ff1516e3          	bne	a0,a7,d644 <__ledf2+0x80>
    d65c:	00c7e7b3          	or	a5,a5,a2
    d660:	00200513          	li	a0,2
    d664:	fc0790e3          	bnez	a5,d624 <__ledf2+0x60>
    d668:	fcd59ee3          	bne	a1,a3,d644 <__ledf2+0x80>
    d66c:	00000513          	li	a0,0
    d670:	00008067          	ret
    d674:	fc0508e3          	beqz	a0,d644 <__ledf2+0x80>
    d678:	fcd596e3          	bne	a1,a3,d644 <__ledf2+0x80>
    d67c:	fd1544e3          	blt	a0,a7,d644 <__ledf2+0x80>
    d680:	00a8cc63          	blt	a7,a0,d698 <__ledf2+0xd4>
    d684:	fdc7e0e3          	bltu	a5,t3,d644 <__ledf2+0x80>
    d688:	00fe1863          	bne	t3,a5,d698 <__ledf2+0xd4>
    d68c:	fbdf6ce3          	bltu	t5,t4,d644 <__ledf2+0x80>
    d690:	00000513          	li	a0,0
    d694:	f9eef8e3          	bgeu	t4,t5,d624 <__ledf2+0x60>
    d698:	00100513          	li	a0,1
    d69c:	f80594e3          	bnez	a1,d624 <__ledf2+0x60>
    d6a0:	fff00513          	li	a0,-1
    d6a4:	00008067          	ret
    d6a8:	f6080ae3          	beqz	a6,d61c <__ledf2+0x58>
    d6ac:	f8d59ce3          	bne	a1,a3,d644 <__ledf2+0x80>
    d6b0:	fe9ff06f          	j	d698 <__ledf2+0xd4>
    d6b4:	00200513          	li	a0,2
    d6b8:	00008067          	ret
    d6bc:	f80814e3          	bnez	a6,d644 <__ledf2+0x80>
    d6c0:	00008067          	ret
    d6c4:	fcd580e3          	beq	a1,a3,d684 <__ledf2+0xc0>
    d6c8:	f7dff06f          	j	d644 <__ledf2+0x80>

0000d6cc <__muldf3>:
    d6cc:	fd010113          	add	sp,sp,-48
    d6d0:	0145d793          	srl	a5,a1,0x14
    d6d4:	02812423          	sw	s0,40(sp)
    d6d8:	02912223          	sw	s1,36(sp)
    d6dc:	03212023          	sw	s2,32(sp)
    d6e0:	01312e23          	sw	s3,28(sp)
    d6e4:	01512a23          	sw	s5,20(sp)
    d6e8:	00c59493          	sll	s1,a1,0xc
    d6ec:	02112623          	sw	ra,44(sp)
    d6f0:	01412c23          	sw	s4,24(sp)
    d6f4:	01612823          	sw	s6,16(sp)
    d6f8:	01712623          	sw	s7,12(sp)
    d6fc:	01812423          	sw	s8,8(sp)
    d700:	7ff7f793          	and	a5,a5,2047
    d704:	00050413          	mv	s0,a0
    d708:	00060a93          	mv	s5,a2
    d70c:	00068993          	mv	s3,a3
    d710:	00c4d493          	srl	s1,s1,0xc
    d714:	01f5d913          	srl	s2,a1,0x1f
    d718:	4e078063          	beqz	a5,dbf8 <__muldf3+0x52c>
    d71c:	7ff00713          	li	a4,2047
    d720:	0ae78663          	beq	a5,a4,d7cc <__muldf3+0x100>
    d724:	00349693          	sll	a3,s1,0x3
    d728:	01d55713          	srl	a4,a0,0x1d
    d72c:	00d76733          	or	a4,a4,a3
    d730:	008006b7          	lui	a3,0x800
    d734:	00d764b3          	or	s1,a4,a3
    d738:	00351a13          	sll	s4,a0,0x3
    d73c:	c0178c13          	add	s8,a5,-1023
    d740:	00000b13          	li	s6,0
    d744:	00000b93          	li	s7,0
    d748:	0149d793          	srl	a5,s3,0x14
    d74c:	00c99713          	sll	a4,s3,0xc
    d750:	7ff7f793          	and	a5,a5,2047
    d754:	000a8e13          	mv	t3,s5
    d758:	00c75413          	srl	s0,a4,0xc
    d75c:	01f9d993          	srl	s3,s3,0x1f
    d760:	0a078063          	beqz	a5,d800 <__muldf3+0x134>
    d764:	7ff00713          	li	a4,2047
    d768:	14e78e63          	beq	a5,a4,d8c4 <__muldf3+0x1f8>
    d76c:	00341713          	sll	a4,s0,0x3
    d770:	01dad693          	srl	a3,s5,0x1d
    d774:	00e6e6b3          	or	a3,a3,a4
    d778:	c0178793          	add	a5,a5,-1023
    d77c:	00800737          	lui	a4,0x800
    d780:	00e6e433          	or	s0,a3,a4
    d784:	003a9e13          	sll	t3,s5,0x3
    d788:	01878333          	add	t1,a5,s8
    d78c:	00000693          	li	a3,0
    d790:	00a00793          	li	a5,10
    d794:	00130893          	add	a7,t1,1
    d798:	0b67cc63          	blt	a5,s6,d850 <__muldf3+0x184>
    d79c:	013945b3          	xor	a1,s2,s3
    d7a0:	00200793          	li	a5,2
    d7a4:	00058813          	mv	a6,a1
    d7a8:	1567c663          	blt	a5,s6,d8f4 <__muldf3+0x228>
    d7ac:	fffb0b13          	add	s6,s6,-1
    d7b0:	00100713          	li	a4,1
    d7b4:	17676063          	bltu	a4,s6,d914 <__muldf3+0x248>
    d7b8:	48f68663          	beq	a3,a5,dc44 <__muldf3+0x578>
    d7bc:	00040493          	mv	s1,s0
    d7c0:	000e0a13          	mv	s4,t3
    d7c4:	00068b93          	mv	s7,a3
    d7c8:	09c0006f          	j	d864 <__muldf3+0x198>
    d7cc:	00a4ea33          	or	s4,s1,a0
    d7d0:	480a1463          	bnez	s4,dc58 <__muldf3+0x58c>
    d7d4:	0149d793          	srl	a5,s3,0x14
    d7d8:	00c99713          	sll	a4,s3,0xc
    d7dc:	7ff7f793          	and	a5,a5,2047
    d7e0:	00000493          	li	s1,0
    d7e4:	00800b13          	li	s6,8
    d7e8:	7ff00c13          	li	s8,2047
    d7ec:	00200b93          	li	s7,2
    d7f0:	000a8e13          	mv	t3,s5
    d7f4:	00c75413          	srl	s0,a4,0xc
    d7f8:	01f9d993          	srl	s3,s3,0x1f
    d7fc:	f60794e3          	bnez	a5,d764 <__muldf3+0x98>
    d800:	015467b3          	or	a5,s0,s5
    d804:	46078e63          	beqz	a5,dc80 <__muldf3+0x5b4>
    d808:	54040c63          	beqz	s0,dd60 <__muldf3+0x694>
    d80c:	00040513          	mv	a0,s0
    d810:	6f4010ef          	jal	ef04 <__clzsi2>
    d814:	00050313          	mv	t1,a0
    d818:	ff550713          	add	a4,a0,-11
    d81c:	01d00793          	li	a5,29
    d820:	ff830e13          	add	t3,t1,-8
    d824:	40e787b3          	sub	a5,a5,a4
    d828:	00fad7b3          	srl	a5,s5,a5
    d82c:	01c41733          	sll	a4,s0,t3
    d830:	00e7e433          	or	s0,a5,a4
    d834:	01ca9e33          	sll	t3,s5,t3
    d838:	406c0333          	sub	t1,s8,t1
    d83c:	c0d30313          	add	t1,t1,-1011
    d840:	00a00793          	li	a5,10
    d844:	00000693          	li	a3,0
    d848:	00130893          	add	a7,t1,1
    d84c:	f567d8e3          	bge	a5,s6,d79c <__muldf3+0xd0>
    d850:	00090593          	mv	a1,s2
    d854:	00200793          	li	a5,2
    d858:	3efb8663          	beq	s7,a5,dc44 <__muldf3+0x578>
    d85c:	00300793          	li	a5,3
    d860:	54fb8863          	beq	s7,a5,ddb0 <__muldf3+0x6e4>
    d864:	00100793          	li	a5,1
    d868:	00058813          	mv	a6,a1
    d86c:	52fb9663          	bne	s7,a5,dd98 <__muldf3+0x6cc>
    d870:	00000793          	li	a5,0
    d874:	00000693          	li	a3,0
    d878:	00000713          	li	a4,0
    d87c:	02c12083          	lw	ra,44(sp)
    d880:	02812403          	lw	s0,40(sp)
    d884:	01479793          	sll	a5,a5,0x14
    d888:	00d7e7b3          	or	a5,a5,a3
    d88c:	01f81813          	sll	a6,a6,0x1f
    d890:	0107e7b3          	or	a5,a5,a6
    d894:	02412483          	lw	s1,36(sp)
    d898:	02012903          	lw	s2,32(sp)
    d89c:	01c12983          	lw	s3,28(sp)
    d8a0:	01812a03          	lw	s4,24(sp)
    d8a4:	01412a83          	lw	s5,20(sp)
    d8a8:	01012b03          	lw	s6,16(sp)
    d8ac:	00c12b83          	lw	s7,12(sp)
    d8b0:	00812c03          	lw	s8,8(sp)
    d8b4:	00070513          	mv	a0,a4
    d8b8:	00078593          	mv	a1,a5
    d8bc:	03010113          	add	sp,sp,48
    d8c0:	00008067          	ret
    d8c4:	01546733          	or	a4,s0,s5
    d8c8:	7ffc0313          	add	t1,s8,2047
    d8cc:	3c070663          	beqz	a4,dc98 <__muldf3+0x5cc>
    d8d0:	00001737          	lui	a4,0x1
    d8d4:	01394833          	xor	a6,s2,s3
    d8d8:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d8dc:	003b6b13          	or	s6,s6,3
    d8e0:	00a00693          	li	a3,10
    d8e4:	00080593          	mv	a1,a6
    d8e8:	00ec08b3          	add	a7,s8,a4
    d8ec:	4366cc63          	blt	a3,s6,dd24 <__muldf3+0x658>
    d8f0:	00300693          	li	a3,3
    d8f4:	00100613          	li	a2,1
    d8f8:	01661633          	sll	a2,a2,s6
    d8fc:	53067713          	and	a4,a2,1328
    d900:	f4071ae3          	bnez	a4,d854 <__muldf3+0x188>
    d904:	24067793          	and	a5,a2,576
    d908:	48079063          	bnez	a5,dd88 <__muldf3+0x6bc>
    d90c:	08867613          	and	a2,a2,136
    d910:	38061e63          	bnez	a2,dcac <__muldf3+0x5e0>
    d914:	00010fb7          	lui	t6,0x10
    d918:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    d91c:	005a7f33          	and	t5,s4,t0
    d920:	005e72b3          	and	t0,t3,t0
    d924:	010a5a13          	srl	s4,s4,0x10
    d928:	010e5e13          	srl	t3,t3,0x10
    d92c:	000f0513          	mv	a0,t5
    d930:	00028593          	mv	a1,t0
    d934:	460010ef          	jal	ed94 <__mulsi3>
    d938:	00050713          	mv	a4,a0
    d93c:	000e0593          	mv	a1,t3
    d940:	000f0513          	mv	a0,t5
    d944:	450010ef          	jal	ed94 <__mulsi3>
    d948:	00050793          	mv	a5,a0
    d94c:	00028593          	mv	a1,t0
    d950:	000a0513          	mv	a0,s4
    d954:	440010ef          	jal	ed94 <__mulsi3>
    d958:	00050e93          	mv	t4,a0
    d95c:	000e0593          	mv	a1,t3
    d960:	000a0513          	mv	a0,s4
    d964:	430010ef          	jal	ed94 <__mulsi3>
    d968:	01d786b3          	add	a3,a5,t4
    d96c:	01075393          	srl	t2,a4,0x10
    d970:	00d383b3          	add	t2,t2,a3
    d974:	00050793          	mv	a5,a0
    d978:	01d3f463          	bgeu	t2,t4,d980 <__muldf3+0x2b4>
    d97c:	01f507b3          	add	a5,a0,t6
    d980:	000109b7          	lui	s3,0x10
    d984:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    d988:	0123feb3          	and	t4,t2,s2
    d98c:	01277733          	and	a4,a4,s2
    d990:	010e9e93          	sll	t4,t4,0x10
    d994:	01247933          	and	s2,s0,s2
    d998:	0103d393          	srl	t2,t2,0x10
    d99c:	00ee8eb3          	add	t4,t4,a4
    d9a0:	01045413          	srl	s0,s0,0x10
    d9a4:	000f0513          	mv	a0,t5
    d9a8:	00090593          	mv	a1,s2
    d9ac:	3e8010ef          	jal	ed94 <__mulsi3>
    d9b0:	00050f93          	mv	t6,a0
    d9b4:	00040593          	mv	a1,s0
    d9b8:	000f0513          	mv	a0,t5
    d9bc:	3d8010ef          	jal	ed94 <__mulsi3>
    d9c0:	00050713          	mv	a4,a0
    d9c4:	00090593          	mv	a1,s2
    d9c8:	000a0513          	mv	a0,s4
    d9cc:	3c8010ef          	jal	ed94 <__mulsi3>
    d9d0:	00050f13          	mv	t5,a0
    d9d4:	00040593          	mv	a1,s0
    d9d8:	000a0513          	mv	a0,s4
    d9dc:	3b8010ef          	jal	ed94 <__mulsi3>
    d9e0:	010fd693          	srl	a3,t6,0x10
    d9e4:	01e70733          	add	a4,a4,t5
    d9e8:	00e686b3          	add	a3,a3,a4
    d9ec:	01e6f463          	bgeu	a3,t5,d9f4 <__muldf3+0x328>
    d9f0:	01350533          	add	a0,a0,s3
    d9f4:	00010a37          	lui	s4,0x10
    d9f8:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    d9fc:	01e6f733          	and	a4,a3,t5
    da00:	01efffb3          	and	t6,t6,t5
    da04:	01071713          	sll	a4,a4,0x10
    da08:	01f70733          	add	a4,a4,t6
    da0c:	01e4ff33          	and	t5,s1,t5
    da10:	0106d693          	srl	a3,a3,0x10
    da14:	00a68fb3          	add	t6,a3,a0
    da18:	00e383b3          	add	t2,t2,a4
    da1c:	0104d493          	srl	s1,s1,0x10
    da20:	000f0513          	mv	a0,t5
    da24:	00028593          	mv	a1,t0
    da28:	36c010ef          	jal	ed94 <__mulsi3>
    da2c:	00050a93          	mv	s5,a0
    da30:	000e0593          	mv	a1,t3
    da34:	000f0513          	mv	a0,t5
    da38:	35c010ef          	jal	ed94 <__mulsi3>
    da3c:	00050993          	mv	s3,a0
    da40:	00028593          	mv	a1,t0
    da44:	00048513          	mv	a0,s1
    da48:	34c010ef          	jal	ed94 <__mulsi3>
    da4c:	00050293          	mv	t0,a0
    da50:	000e0593          	mv	a1,t3
    da54:	00048513          	mv	a0,s1
    da58:	33c010ef          	jal	ed94 <__mulsi3>
    da5c:	010ad613          	srl	a2,s5,0x10
    da60:	005989b3          	add	s3,s3,t0
    da64:	01360633          	add	a2,a2,s3
    da68:	00567463          	bgeu	a2,t0,da70 <__muldf3+0x3a4>
    da6c:	01450533          	add	a0,a0,s4
    da70:	00010a37          	lui	s4,0x10
    da74:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    da78:	00d672b3          	and	t0,a2,a3
    da7c:	00dafab3          	and	s5,s5,a3
    da80:	01065613          	srl	a2,a2,0x10
    da84:	01029293          	sll	t0,t0,0x10
    da88:	00a60e33          	add	t3,a2,a0
    da8c:	015282b3          	add	t0,t0,s5
    da90:	000f0513          	mv	a0,t5
    da94:	00090593          	mv	a1,s2
    da98:	2fc010ef          	jal	ed94 <__mulsi3>
    da9c:	00050993          	mv	s3,a0
    daa0:	00040593          	mv	a1,s0
    daa4:	000f0513          	mv	a0,t5
    daa8:	2ec010ef          	jal	ed94 <__mulsi3>
    daac:	00050f13          	mv	t5,a0
    dab0:	00090593          	mv	a1,s2
    dab4:	00048513          	mv	a0,s1
    dab8:	2dc010ef          	jal	ed94 <__mulsi3>
    dabc:	00050913          	mv	s2,a0
    dac0:	00040593          	mv	a1,s0
    dac4:	00048513          	mv	a0,s1
    dac8:	2cc010ef          	jal	ed94 <__mulsi3>
    dacc:	012f06b3          	add	a3,t5,s2
    dad0:	0109d593          	srl	a1,s3,0x10
    dad4:	00d58433          	add	s0,a1,a3
    dad8:	00050f13          	mv	t5,a0
    dadc:	01247463          	bgeu	s0,s2,dae4 <__muldf3+0x418>
    dae0:	01450f33          	add	t5,a0,s4
    dae4:	00010637          	lui	a2,0x10
    dae8:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x5f7>
    daec:	00c476b3          	and	a3,s0,a2
    daf0:	00c9f9b3          	and	s3,s3,a2
    daf4:	01069693          	sll	a3,a3,0x10
    daf8:	007787b3          	add	a5,a5,t2
    dafc:	013686b3          	add	a3,a3,s3
    db00:	01f685b3          	add	a1,a3,t6
    db04:	00e7b733          	sltu	a4,a5,a4
    db08:	00e58733          	add	a4,a1,a4
    db0c:	005782b3          	add	t0,a5,t0
    db10:	01c70633          	add	a2,a4,t3
    db14:	00f2b7b3          	sltu	a5,t0,a5
    db18:	00f607b3          	add	a5,a2,a5
    db1c:	00d5b6b3          	sltu	a3,a1,a3
    db20:	00b735b3          	sltu	a1,a4,a1
    db24:	00b6e6b3          	or	a3,a3,a1
    db28:	00e63733          	sltu	a4,a2,a4
    db2c:	01045593          	srl	a1,s0,0x10
    db30:	00c7b633          	sltu	a2,a5,a2
    db34:	00b686b3          	add	a3,a3,a1
    db38:	00929a13          	sll	s4,t0,0x9
    db3c:	00c76733          	or	a4,a4,a2
    db40:	00d70733          	add	a4,a4,a3
    db44:	01da6a33          	or	s4,s4,t4
    db48:	01e70733          	add	a4,a4,t5
    db4c:	01403a33          	snez	s4,s4
    db50:	0172d293          	srl	t0,t0,0x17
    db54:	00971713          	sll	a4,a4,0x9
    db58:	0177d693          	srl	a3,a5,0x17
    db5c:	005a6a33          	or	s4,s4,t0
    db60:	00979793          	sll	a5,a5,0x9
    db64:	00fa6a33          	or	s4,s4,a5
    db68:	00771793          	sll	a5,a4,0x7
    db6c:	00d764b3          	or	s1,a4,a3
    db70:	0207d063          	bgez	a5,db90 <__muldf3+0x4c4>
    db74:	001a5793          	srl	a5,s4,0x1
    db78:	001a7a13          	and	s4,s4,1
    db7c:	01f49713          	sll	a4,s1,0x1f
    db80:	0147e7b3          	or	a5,a5,s4
    db84:	00e7ea33          	or	s4,a5,a4
    db88:	0014d493          	srl	s1,s1,0x1
    db8c:	00088313          	mv	t1,a7
    db90:	3ff30793          	add	a5,t1,1023
    db94:	12f05663          	blez	a5,dcc0 <__muldf3+0x5f4>
    db98:	007a7713          	and	a4,s4,7
    db9c:	02070063          	beqz	a4,dbbc <__muldf3+0x4f0>
    dba0:	00fa7713          	and	a4,s4,15
    dba4:	00400693          	li	a3,4
    dba8:	00d70a63          	beq	a4,a3,dbbc <__muldf3+0x4f0>
    dbac:	004a0713          	add	a4,s4,4
    dbb0:	01473a33          	sltu	s4,a4,s4
    dbb4:	014484b3          	add	s1,s1,s4
    dbb8:	00070a13          	mv	s4,a4
    dbbc:	00749713          	sll	a4,s1,0x7
    dbc0:	00075a63          	bgez	a4,dbd4 <__muldf3+0x508>
    dbc4:	ff0007b7          	lui	a5,0xff000
    dbc8:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    dbcc:	00f4f4b3          	and	s1,s1,a5
    dbd0:	40030793          	add	a5,t1,1024
    dbd4:	7fe00713          	li	a4,2046
    dbd8:	1cf74463          	blt	a4,a5,dda0 <__muldf3+0x6d4>
    dbdc:	003a5a13          	srl	s4,s4,0x3
    dbe0:	01d49713          	sll	a4,s1,0x1d
    dbe4:	00949693          	sll	a3,s1,0x9
    dbe8:	01476733          	or	a4,a4,s4
    dbec:	00c6d693          	srl	a3,a3,0xc
    dbf0:	7ff7f793          	and	a5,a5,2047
    dbf4:	c89ff06f          	j	d87c <__muldf3+0x1b0>
    dbf8:	00a4ea33          	or	s4,s1,a0
    dbfc:	060a0863          	beqz	s4,dc6c <__muldf3+0x5a0>
    dc00:	12048e63          	beqz	s1,dd3c <__muldf3+0x670>
    dc04:	00048513          	mv	a0,s1
    dc08:	2fc010ef          	jal	ef04 <__clzsi2>
    dc0c:	00050713          	mv	a4,a0
    dc10:	ff550693          	add	a3,a0,-11
    dc14:	01d00793          	li	a5,29
    dc18:	ff870a13          	add	s4,a4,-8
    dc1c:	40d787b3          	sub	a5,a5,a3
    dc20:	00f457b3          	srl	a5,s0,a5
    dc24:	014496b3          	sll	a3,s1,s4
    dc28:	00d7e4b3          	or	s1,a5,a3
    dc2c:	01441a33          	sll	s4,s0,s4
    dc30:	c0d00793          	li	a5,-1011
    dc34:	40e78c33          	sub	s8,a5,a4
    dc38:	00000b13          	li	s6,0
    dc3c:	00000b93          	li	s7,0
    dc40:	b09ff06f          	j	d748 <__muldf3+0x7c>
    dc44:	00058813          	mv	a6,a1
    dc48:	7ff00793          	li	a5,2047
    dc4c:	00000693          	li	a3,0
    dc50:	00000713          	li	a4,0
    dc54:	c29ff06f          	j	d87c <__muldf3+0x1b0>
    dc58:	00050a13          	mv	s4,a0
    dc5c:	00c00b13          	li	s6,12
    dc60:	7ff00c13          	li	s8,2047
    dc64:	00300b93          	li	s7,3
    dc68:	ae1ff06f          	j	d748 <__muldf3+0x7c>
    dc6c:	00000493          	li	s1,0
    dc70:	00400b13          	li	s6,4
    dc74:	00000c13          	li	s8,0
    dc78:	00100b93          	li	s7,1
    dc7c:	acdff06f          	j	d748 <__muldf3+0x7c>
    dc80:	001b6b13          	or	s6,s6,1
    dc84:	000c0313          	mv	t1,s8
    dc88:	00000413          	li	s0,0
    dc8c:	00000e13          	li	t3,0
    dc90:	00100693          	li	a3,1
    dc94:	afdff06f          	j	d790 <__muldf3+0xc4>
    dc98:	002b6b13          	or	s6,s6,2
    dc9c:	00000413          	li	s0,0
    dca0:	00000e13          	li	t3,0
    dca4:	00200693          	li	a3,2
    dca8:	ae9ff06f          	j	d790 <__muldf3+0xc4>
    dcac:	00040493          	mv	s1,s0
    dcb0:	000e0a13          	mv	s4,t3
    dcb4:	00068b93          	mv	s7,a3
    dcb8:	00098593          	mv	a1,s3
    dcbc:	b99ff06f          	j	d854 <__muldf3+0x188>
    dcc0:	00100713          	li	a4,1
    dcc4:	10079063          	bnez	a5,ddc4 <__muldf3+0x6f8>
    dcc8:	41e30313          	add	t1,t1,1054
    dccc:	006a1633          	sll	a2,s4,t1
    dcd0:	00c03633          	snez	a2,a2
    dcd4:	00649333          	sll	t1,s1,t1
    dcd8:	00ea5a33          	srl	s4,s4,a4
    dcdc:	00666633          	or	a2,a2,t1
    dce0:	01466633          	or	a2,a2,s4
    dce4:	00767793          	and	a5,a2,7
    dce8:	00e4d5b3          	srl	a1,s1,a4
    dcec:	02078063          	beqz	a5,dd0c <__muldf3+0x640>
    dcf0:	00f67793          	and	a5,a2,15
    dcf4:	00400713          	li	a4,4
    dcf8:	00e78a63          	beq	a5,a4,dd0c <__muldf3+0x640>
    dcfc:	00460793          	add	a5,a2,4
    dd00:	00c7b633          	sltu	a2,a5,a2
    dd04:	00c585b3          	add	a1,a1,a2
    dd08:	00078613          	mv	a2,a5
    dd0c:	00859513          	sll	a0,a1,0x8
    dd10:	00100793          	li	a5,1
    dd14:	00000693          	li	a3,0
    dd18:	00000713          	li	a4,0
    dd1c:	b60540e3          	bltz	a0,d87c <__muldf3+0x1b0>
    dd20:	10c0006f          	j	de2c <__muldf3+0x760>
    dd24:	00f00713          	li	a4,15
    dd28:	12eb1063          	bne	s6,a4,de48 <__muldf3+0x77c>
    dd2c:	00000813          	li	a6,0
    dd30:	000806b7          	lui	a3,0x80
    dd34:	00000713          	li	a4,0
    dd38:	b45ff06f          	j	d87c <__muldf3+0x1b0>
    dd3c:	1c8010ef          	jal	ef04 <__clzsi2>
    dd40:	01550693          	add	a3,a0,21
    dd44:	01c00793          	li	a5,28
    dd48:	02050713          	add	a4,a0,32
    dd4c:	ecd7d4e3          	bge	a5,a3,dc14 <__muldf3+0x548>
    dd50:	ff850513          	add	a0,a0,-8
    dd54:	00000a13          	li	s4,0
    dd58:	00a414b3          	sll	s1,s0,a0
    dd5c:	ed5ff06f          	j	dc30 <__muldf3+0x564>
    dd60:	000a8513          	mv	a0,s5
    dd64:	1a0010ef          	jal	ef04 <__clzsi2>
    dd68:	01550713          	add	a4,a0,21
    dd6c:	01c00793          	li	a5,28
    dd70:	02050313          	add	t1,a0,32
    dd74:	aae7d4e3          	bge	a5,a4,d81c <__muldf3+0x150>
    dd78:	ff850513          	add	a0,a0,-8
    dd7c:	00000e13          	li	t3,0
    dd80:	00aa9433          	sll	s0,s5,a0
    dd84:	ab5ff06f          	j	d838 <__muldf3+0x16c>
    dd88:	00000813          	li	a6,0
    dd8c:	7ff00793          	li	a5,2047
    dd90:	000806b7          	lui	a3,0x80
    dd94:	ae9ff06f          	j	d87c <__muldf3+0x1b0>
    dd98:	00088313          	mv	t1,a7
    dd9c:	df5ff06f          	j	db90 <__muldf3+0x4c4>
    dda0:	7ff00793          	li	a5,2047
    dda4:	00000693          	li	a3,0
    dda8:	00000713          	li	a4,0
    ddac:	ad1ff06f          	j	d87c <__muldf3+0x1b0>
    ddb0:	00000813          	li	a6,0
    ddb4:	7ff00793          	li	a5,2047
    ddb8:	000806b7          	lui	a3,0x80
    ddbc:	00000713          	li	a4,0
    ddc0:	abdff06f          	j	d87c <__muldf3+0x1b0>
    ddc4:	40f70733          	sub	a4,a4,a5
    ddc8:	03800693          	li	a3,56
    ddcc:	aae6c2e3          	blt	a3,a4,d870 <__muldf3+0x1a4>
    ddd0:	01f00693          	li	a3,31
    ddd4:	eee6dae3          	bge	a3,a4,dcc8 <__muldf3+0x5fc>
    ddd8:	fe100693          	li	a3,-31
    dddc:	40f687b3          	sub	a5,a3,a5
    dde0:	02000693          	li	a3,32
    dde4:	00f4d7b3          	srl	a5,s1,a5
    dde8:	00d70863          	beq	a4,a3,ddf8 <__muldf3+0x72c>
    ddec:	43e30313          	add	t1,t1,1086
    ddf0:	00649333          	sll	t1,s1,t1
    ddf4:	006a6a33          	or	s4,s4,t1
    ddf8:	01403633          	snez	a2,s4
    ddfc:	00f66633          	or	a2,a2,a5
    de00:	00767713          	and	a4,a2,7
    de04:	00000693          	li	a3,0
    de08:	02070863          	beqz	a4,de38 <__muldf3+0x76c>
    de0c:	00f67793          	and	a5,a2,15
    de10:	00400713          	li	a4,4
    de14:	00000593          	li	a1,0
    de18:	00e78a63          	beq	a5,a4,de2c <__muldf3+0x760>
    de1c:	00460793          	add	a5,a2,4
    de20:	00c7b633          	sltu	a2,a5,a2
    de24:	00c035b3          	snez	a1,a2
    de28:	00078613          	mv	a2,a5
    de2c:	00959693          	sll	a3,a1,0x9
    de30:	01d59713          	sll	a4,a1,0x1d
    de34:	00c6d693          	srl	a3,a3,0xc
    de38:	00365613          	srl	a2,a2,0x3
    de3c:	00e66733          	or	a4,a2,a4
    de40:	00000793          	li	a5,0
    de44:	a39ff06f          	j	d87c <__muldf3+0x1b0>
    de48:	00040493          	mv	s1,s0
    de4c:	000a8a13          	mv	s4,s5
    de50:	00300b93          	li	s7,3
    de54:	00098593          	mv	a1,s3
    de58:	9fdff06f          	j	d854 <__muldf3+0x188>

0000de5c <__subdf3>:
    de5c:	001007b7          	lui	a5,0x100
    de60:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    de64:	fe010113          	add	sp,sp,-32
    de68:	00b7f8b3          	and	a7,a5,a1
    de6c:	00d7f833          	and	a6,a5,a3
    de70:	0146d793          	srl	a5,a3,0x14
    de74:	00389893          	sll	a7,a7,0x3
    de78:	00812c23          	sw	s0,24(sp)
    de7c:	01312623          	sw	s3,12(sp)
    de80:	01f5d413          	srl	s0,a1,0x1f
    de84:	0145d993          	srl	s3,a1,0x14
    de88:	01d55713          	srl	a4,a0,0x1d
    de8c:	00381813          	sll	a6,a6,0x3
    de90:	01d65593          	srl	a1,a2,0x1d
    de94:	00112e23          	sw	ra,28(sp)
    de98:	00912a23          	sw	s1,20(sp)
    de9c:	01212823          	sw	s2,16(sp)
    dea0:	7ff7ff13          	and	t5,a5,2047
    dea4:	7ff00313          	li	t1,2047
    dea8:	01176733          	or	a4,a4,a7
    deac:	7ff9f993          	and	s3,s3,2047
    deb0:	00040e13          	mv	t3,s0
    deb4:	00351893          	sll	a7,a0,0x3
    deb8:	01f6d693          	srl	a3,a3,0x1f
    debc:	0105e5b3          	or	a1,a1,a6
    dec0:	00361e93          	sll	t4,a2,0x3
    dec4:	206f0c63          	beq	t5,t1,e0dc <__subdf3+0x280>
    dec8:	0016c693          	xor	a3,a3,1
    decc:	41e987b3          	sub	a5,s3,t5
    ded0:	16d40263          	beq	s0,a3,e034 <__subdf3+0x1d8>
    ded4:	00f05ae3          	blez	a5,e6e8 <__subdf3+0x88c>
    ded8:	240f0a63          	beqz	t5,e12c <__subdf3+0x2d0>
    dedc:	3c698463          	beq	s3,t1,e2a4 <__subdf3+0x448>
    dee0:	03800693          	li	a3,56
    dee4:	00100513          	li	a0,1
    dee8:	02f6ce63          	blt	a3,a5,df24 <__subdf3+0xc8>
    deec:	008006b7          	lui	a3,0x800
    def0:	00d5e5b3          	or	a1,a1,a3
    def4:	01f00693          	li	a3,31
    def8:	4ef6c463          	blt	a3,a5,e3e0 <__subdf3+0x584>
    defc:	02000693          	li	a3,32
    df00:	40f686b3          	sub	a3,a3,a5
    df04:	00d59533          	sll	a0,a1,a3
    df08:	00fed633          	srl	a2,t4,a5
    df0c:	00de96b3          	sll	a3,t4,a3
    df10:	00c56533          	or	a0,a0,a2
    df14:	00d036b3          	snez	a3,a3
    df18:	00f5d7b3          	srl	a5,a1,a5
    df1c:	00d56533          	or	a0,a0,a3
    df20:	40f70733          	sub	a4,a4,a5
    df24:	40a88533          	sub	a0,a7,a0
    df28:	00a8b633          	sltu	a2,a7,a0
    df2c:	00050493          	mv	s1,a0
    df30:	40c70933          	sub	s2,a4,a2
    df34:	00891793          	sll	a5,s2,0x8
    df38:	3407d863          	bgez	a5,e288 <__subdf3+0x42c>
    df3c:	008007b7          	lui	a5,0x800
    df40:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    df44:	00f97933          	and	s2,s2,a5
    df48:	2e090663          	beqz	s2,e234 <__subdf3+0x3d8>
    df4c:	00090513          	mv	a0,s2
    df50:	7b5000ef          	jal	ef04 <__clzsi2>
    df54:	ff850793          	add	a5,a0,-8
    df58:	02000693          	li	a3,32
    df5c:	40f68733          	sub	a4,a3,a5
    df60:	00e4d733          	srl	a4,s1,a4
    df64:	00f91933          	sll	s2,s2,a5
    df68:	01276733          	or	a4,a4,s2
    df6c:	00f494b3          	sll	s1,s1,a5
    df70:	3f37c463          	blt	a5,s3,e358 <__subdf3+0x4fc>
    df74:	413787b3          	sub	a5,a5,s3
    df78:	00178793          	add	a5,a5,1
    df7c:	40f686b3          	sub	a3,a3,a5
    df80:	00d49633          	sll	a2,s1,a3
    df84:	00f4d933          	srl	s2,s1,a5
    df88:	00c03633          	snez	a2,a2
    df8c:	00c96633          	or	a2,s2,a2
    df90:	00d716b3          	sll	a3,a4,a3
    df94:	00c6e4b3          	or	s1,a3,a2
    df98:	00f75933          	srl	s2,a4,a5
    df9c:	00000993          	li	s3,0
    dfa0:	0074f793          	and	a5,s1,7
    dfa4:	02078063          	beqz	a5,dfc4 <__subdf3+0x168>
    dfa8:	00f4f793          	and	a5,s1,15
    dfac:	00400713          	li	a4,4
    dfb0:	00e78a63          	beq	a5,a4,dfc4 <__subdf3+0x168>
    dfb4:	00448793          	add	a5,s1,4
    dfb8:	0097b533          	sltu	a0,a5,s1
    dfbc:	00a90933          	add	s2,s2,a0
    dfc0:	00078493          	mv	s1,a5
    dfc4:	00891793          	sll	a5,s2,0x8
    dfc8:	6c07d063          	bgez	a5,e688 <__subdf3+0x82c>
    dfcc:	00198793          	add	a5,s3,1
    dfd0:	7ff00713          	li	a4,2047
    dfd4:	24e78663          	beq	a5,a4,e220 <__subdf3+0x3c4>
    dfd8:	ff800737          	lui	a4,0xff800
    dfdc:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dfe0:	00e97733          	and	a4,s2,a4
    dfe4:	7ff7f793          	and	a5,a5,2047
    dfe8:	01d71813          	sll	a6,a4,0x1d
    dfec:	0034d513          	srl	a0,s1,0x3
    dff0:	00971713          	sll	a4,a4,0x9
    dff4:	00a86833          	or	a6,a6,a0
    dff8:	00c75713          	srl	a4,a4,0xc
    dffc:	00147e13          	and	t3,s0,1
    e000:	01c12083          	lw	ra,28(sp)
    e004:	01812403          	lw	s0,24(sp)
    e008:	01479793          	sll	a5,a5,0x14
    e00c:	00e7e7b3          	or	a5,a5,a4
    e010:	01fe1713          	sll	a4,t3,0x1f
    e014:	00e7e7b3          	or	a5,a5,a4
    e018:	01412483          	lw	s1,20(sp)
    e01c:	01012903          	lw	s2,16(sp)
    e020:	00c12983          	lw	s3,12(sp)
    e024:	00080513          	mv	a0,a6
    e028:	00078593          	mv	a1,a5
    e02c:	02010113          	add	sp,sp,32
    e030:	00008067          	ret
    e034:	70f05263          	blez	a5,e738 <__subdf3+0x8dc>
    e038:	1c0f1663          	bnez	t5,e204 <__subdf3+0x3a8>
    e03c:	01d5e6b3          	or	a3,a1,t4
    e040:	26068e63          	beqz	a3,e2bc <__subdf3+0x460>
    e044:	fff78693          	add	a3,a5,-1
    e048:	46068863          	beqz	a3,e4b8 <__subdf3+0x65c>
    e04c:	24678c63          	beq	a5,t1,e2a4 <__subdf3+0x448>
    e050:	03800793          	li	a5,56
    e054:	00100913          	li	s2,1
    e058:	02d7cc63          	blt	a5,a3,e090 <__subdf3+0x234>
    e05c:	00068793          	mv	a5,a3
    e060:	01f00693          	li	a3,31
    e064:	48f6ca63          	blt	a3,a5,e4f8 <__subdf3+0x69c>
    e068:	02000693          	li	a3,32
    e06c:	40f686b3          	sub	a3,a3,a5
    e070:	00d59933          	sll	s2,a1,a3
    e074:	00fed633          	srl	a2,t4,a5
    e078:	00de96b3          	sll	a3,t4,a3
    e07c:	00c96933          	or	s2,s2,a2
    e080:	00d036b3          	snez	a3,a3
    e084:	00f5d7b3          	srl	a5,a1,a5
    e088:	00d96933          	or	s2,s2,a3
    e08c:	00f70733          	add	a4,a4,a5
    e090:	01190633          	add	a2,s2,a7
    e094:	01263933          	sltu	s2,a2,s2
    e098:	00060493          	mv	s1,a2
    e09c:	00e90933          	add	s2,s2,a4
    e0a0:	00891793          	sll	a5,s2,0x8
    e0a4:	1e07d263          	bgez	a5,e288 <__subdf3+0x42c>
    e0a8:	00198993          	add	s3,s3,1
    e0ac:	7ff00793          	li	a5,2047
    e0b0:	16f98863          	beq	s3,a5,e220 <__subdf3+0x3c4>
    e0b4:	ff8007b7          	lui	a5,0xff800
    e0b8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0bc:	0014f513          	and	a0,s1,1
    e0c0:	00f977b3          	and	a5,s2,a5
    e0c4:	0014d713          	srl	a4,s1,0x1
    e0c8:	00a76733          	or	a4,a4,a0
    e0cc:	01f79513          	sll	a0,a5,0x1f
    e0d0:	00e564b3          	or	s1,a0,a4
    e0d4:	0017d913          	srl	s2,a5,0x1
    e0d8:	ec9ff06f          	j	dfa0 <__subdf3+0x144>
    e0dc:	01d5e833          	or	a6,a1,t4
    e0e0:	80198313          	add	t1,s3,-2047
    e0e4:	06080863          	beqz	a6,e154 <__subdf3+0x2f8>
    e0e8:	06d40a63          	beq	s0,a3,e15c <__subdf3+0x300>
    e0ec:	0e030463          	beqz	t1,e1d4 <__subdf3+0x378>
    e0f0:	26098e63          	beqz	s3,e36c <__subdf3+0x510>
    e0f4:	00361513          	sll	a0,a2,0x3
    e0f8:	00355513          	srl	a0,a0,0x3
    e0fc:	00068413          	mv	s0,a3
    e100:	00058713          	mv	a4,a1
    e104:	01d71813          	sll	a6,a4,0x1d
    e108:	00a86833          	or	a6,a6,a0
    e10c:	00375713          	srl	a4,a4,0x3
    e110:	01076733          	or	a4,a4,a6
    e114:	10070663          	beqz	a4,e220 <__subdf3+0x3c4>
    e118:	00000e13          	li	t3,0
    e11c:	7ff00793          	li	a5,2047
    e120:	00080737          	lui	a4,0x80
    e124:	00000813          	li	a6,0
    e128:	ed9ff06f          	j	e000 <__subdf3+0x1a4>
    e12c:	01d5e6b3          	or	a3,a1,t4
    e130:	18068663          	beqz	a3,e2bc <__subdf3+0x460>
    e134:	fff78693          	add	a3,a5,-1
    e138:	3a068263          	beqz	a3,e4dc <__subdf3+0x680>
    e13c:	16678463          	beq	a5,t1,e2a4 <__subdf3+0x448>
    e140:	03800793          	li	a5,56
    e144:	00100513          	li	a0,1
    e148:	dcd7cee3          	blt	a5,a3,df24 <__subdf3+0xc8>
    e14c:	00068793          	mv	a5,a3
    e150:	da5ff06f          	j	def4 <__subdf3+0x98>
    e154:	0016c693          	xor	a3,a3,1
    e158:	f8d41ae3          	bne	s0,a3,e0ec <__subdf3+0x290>
    e15c:	18030863          	beqz	t1,e2ec <__subdf3+0x490>
    e160:	2c099063          	bnez	s3,e420 <__subdf3+0x5c4>
    e164:	7ff00793          	li	a5,2047
    e168:	011766b3          	or	a3,a4,a7
    e16c:	48068863          	beqz	a3,e5fc <__subdf3+0x7a0>
    e170:	fff78693          	add	a3,a5,-1
    e174:	34068263          	beqz	a3,e4b8 <__subdf3+0x65c>
    e178:	7ff00513          	li	a0,2047
    e17c:	2aa78263          	beq	a5,a0,e420 <__subdf3+0x5c4>
    e180:	03800793          	li	a5,56
    e184:	00100913          	li	s2,1
    e188:	02d7ca63          	blt	a5,a3,e1bc <__subdf3+0x360>
    e18c:	01f00793          	li	a5,31
    e190:	4cd7c663          	blt	a5,a3,e65c <__subdf3+0x800>
    e194:	02000793          	li	a5,32
    e198:	40d787b3          	sub	a5,a5,a3
    e19c:	00f71933          	sll	s2,a4,a5
    e1a0:	00d8d633          	srl	a2,a7,a3
    e1a4:	00f897b3          	sll	a5,a7,a5
    e1a8:	00c96933          	or	s2,s2,a2
    e1ac:	00f037b3          	snez	a5,a5
    e1b0:	00d756b3          	srl	a3,a4,a3
    e1b4:	00f96933          	or	s2,s2,a5
    e1b8:	00d585b3          	add	a1,a1,a3
    e1bc:	01d90733          	add	a4,s2,t4
    e1c0:	01273933          	sltu	s2,a4,s2
    e1c4:	00070493          	mv	s1,a4
    e1c8:	00b90933          	add	s2,s2,a1
    e1cc:	000f0993          	mv	s3,t5
    e1d0:	ed1ff06f          	j	e0a0 <__subdf3+0x244>
    e1d4:	00198793          	add	a5,s3,1
    e1d8:	7fe7f793          	and	a5,a5,2046
    e1dc:	14079463          	bnez	a5,e324 <__subdf3+0x4c8>
    e1e0:	01d5e833          	or	a6,a1,t4
    e1e4:	011767b3          	or	a5,a4,a7
    e1e8:	2a099463          	bnez	s3,e490 <__subdf3+0x634>
    e1ec:	38078e63          	beqz	a5,e588 <__subdf3+0x72c>
    e1f0:	3c081063          	bnez	a6,e5b0 <__subdf3+0x754>
    e1f4:	00351513          	sll	a0,a0,0x3
    e1f8:	00355913          	srl	s2,a0,0x3
    e1fc:	00000793          	li	a5,0
    e200:	1140006f          	j	e314 <__subdf3+0x4b8>
    e204:	0a698063          	beq	s3,t1,e2a4 <__subdf3+0x448>
    e208:	03800693          	li	a3,56
    e20c:	00100913          	li	s2,1
    e210:	e8f6c0e3          	blt	a3,a5,e090 <__subdf3+0x234>
    e214:	008006b7          	lui	a3,0x800
    e218:	00d5e5b3          	or	a1,a1,a3
    e21c:	e45ff06f          	j	e060 <__subdf3+0x204>
    e220:	00147e13          	and	t3,s0,1
    e224:	7ff00793          	li	a5,2047
    e228:	00000713          	li	a4,0
    e22c:	00000813          	li	a6,0
    e230:	dd1ff06f          	j	e000 <__subdf3+0x1a4>
    e234:	00048513          	mv	a0,s1
    e238:	4cd000ef          	jal	ef04 <__clzsi2>
    e23c:	01850793          	add	a5,a0,24
    e240:	01f00693          	li	a3,31
    e244:	d0f6dae3          	bge	a3,a5,df58 <__subdf3+0xfc>
    e248:	ff850713          	add	a4,a0,-8
    e24c:	00e49733          	sll	a4,s1,a4
    e250:	1b37ce63          	blt	a5,s3,e40c <__subdf3+0x5b0>
    e254:	413789b3          	sub	s3,a5,s3
    e258:	00198793          	add	a5,s3,1
    e25c:	42f6de63          	bge	a3,a5,e698 <__subdf3+0x83c>
    e260:	fe198993          	add	s3,s3,-31
    e264:	02000693          	li	a3,32
    e268:	013754b3          	srl	s1,a4,s3
    e26c:	00d78c63          	beq	a5,a3,e284 <__subdf3+0x428>
    e270:	04000693          	li	a3,64
    e274:	40f687b3          	sub	a5,a3,a5
    e278:	00f71733          	sll	a4,a4,a5
    e27c:	00e03733          	snez	a4,a4
    e280:	00e4e4b3          	or	s1,s1,a4
    e284:	00000993          	li	s3,0
    e288:	0074f793          	and	a5,s1,7
    e28c:	d0079ee3          	bnez	a5,dfa8 <__subdf3+0x14c>
    e290:	00098793          	mv	a5,s3
    e294:	0034d513          	srl	a0,s1,0x3
    e298:	00090713          	mv	a4,s2
    e29c:	0280006f          	j	e2c4 <__subdf3+0x468>
    e2a0:	e6081ce3          	bnez	a6,e118 <__subdf3+0x2bc>
    e2a4:	00351513          	sll	a0,a0,0x3
    e2a8:	01d71813          	sll	a6,a4,0x1d
    e2ac:	00355513          	srl	a0,a0,0x3
    e2b0:	00a86833          	or	a6,a6,a0
    e2b4:	00375713          	srl	a4,a4,0x3
    e2b8:	e59ff06f          	j	e110 <__subdf3+0x2b4>
    e2bc:	00351513          	sll	a0,a0,0x3
    e2c0:	00355513          	srl	a0,a0,0x3
    e2c4:	01d71813          	sll	a6,a4,0x1d
    e2c8:	7ff00693          	li	a3,2047
    e2cc:	00a86833          	or	a6,a6,a0
    e2d0:	00375713          	srl	a4,a4,0x3
    e2d4:	e2d78ee3          	beq	a5,a3,e110 <__subdf3+0x2b4>
    e2d8:	00c71713          	sll	a4,a4,0xc
    e2dc:	00c75713          	srl	a4,a4,0xc
    e2e0:	7ff7f793          	and	a5,a5,2047
    e2e4:	00147e13          	and	t3,s0,1
    e2e8:	d19ff06f          	j	e000 <__subdf3+0x1a4>
    e2ec:	00198693          	add	a3,s3,1
    e2f0:	7fe6f793          	and	a5,a3,2046
    e2f4:	12079e63          	bnez	a5,e430 <__subdf3+0x5d4>
    e2f8:	011767b3          	or	a5,a4,a7
    e2fc:	24099a63          	bnez	s3,e550 <__subdf3+0x6f4>
    e300:	30078663          	beqz	a5,e60c <__subdf3+0x7b0>
    e304:	01d5e7b3          	or	a5,a1,t4
    e308:	30079a63          	bnez	a5,e61c <__subdf3+0x7c0>
    e30c:	00351513          	sll	a0,a0,0x3
    e310:	00355913          	srl	s2,a0,0x3
    e314:	01d71813          	sll	a6,a4,0x1d
    e318:	01286833          	or	a6,a6,s2
    e31c:	00375713          	srl	a4,a4,0x3
    e320:	fb9ff06f          	j	e2d8 <__subdf3+0x47c>
    e324:	41d88833          	sub	a6,a7,t4
    e328:	0108b7b3          	sltu	a5,a7,a6
    e32c:	40b70933          	sub	s2,a4,a1
    e330:	40f90933          	sub	s2,s2,a5
    e334:	00891793          	sll	a5,s2,0x8
    e338:	00080493          	mv	s1,a6
    e33c:	1207c263          	bltz	a5,e460 <__subdf3+0x604>
    e340:	01286833          	or	a6,a6,s2
    e344:	c00812e3          	bnez	a6,df48 <__subdf3+0xec>
    e348:	00000e13          	li	t3,0
    e34c:	00000793          	li	a5,0
    e350:	00000713          	li	a4,0
    e354:	cadff06f          	j	e000 <__subdf3+0x1a4>
    e358:	ff800937          	lui	s2,0xff800
    e35c:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e360:	40f989b3          	sub	s3,s3,a5
    e364:	01277933          	and	s2,a4,s2
    e368:	c39ff06f          	j	dfa0 <__subdf3+0x144>
    e36c:	7ff00793          	li	a5,2047
    e370:	01176533          	or	a0,a4,a7
    e374:	10050463          	beqz	a0,e47c <__subdf3+0x620>
    e378:	fff78813          	add	a6,a5,-1
    e37c:	1e080263          	beqz	a6,e560 <__subdf3+0x704>
    e380:	7ff00513          	li	a0,2047
    e384:	d6a788e3          	beq	a5,a0,e0f4 <__subdf3+0x298>
    e388:	03800793          	li	a5,56
    e38c:	00068413          	mv	s0,a3
    e390:	00100513          	li	a0,1
    e394:	0307ca63          	blt	a5,a6,e3c8 <__subdf3+0x56c>
    e398:	01f00793          	li	a5,31
    e39c:	1907c463          	blt	a5,a6,e524 <__subdf3+0x6c8>
    e3a0:	02000793          	li	a5,32
    e3a4:	410787b3          	sub	a5,a5,a6
    e3a8:	00f71533          	sll	a0,a4,a5
    e3ac:	0108d6b3          	srl	a3,a7,a6
    e3b0:	00f897b3          	sll	a5,a7,a5
    e3b4:	00d56533          	or	a0,a0,a3
    e3b8:	00f037b3          	snez	a5,a5
    e3bc:	01075833          	srl	a6,a4,a6
    e3c0:	00f56533          	or	a0,a0,a5
    e3c4:	410585b3          	sub	a1,a1,a6
    e3c8:	40ae8533          	sub	a0,t4,a0
    e3cc:	00aeb733          	sltu	a4,t4,a0
    e3d0:	00050493          	mv	s1,a0
    e3d4:	40e58933          	sub	s2,a1,a4
    e3d8:	000f0993          	mv	s3,t5
    e3dc:	b59ff06f          	j	df34 <__subdf3+0xd8>
    e3e0:	fe078693          	add	a3,a5,-32
    e3e4:	02000613          	li	a2,32
    e3e8:	00d5d6b3          	srl	a3,a1,a3
    e3ec:	00c78a63          	beq	a5,a2,e400 <__subdf3+0x5a4>
    e3f0:	04000613          	li	a2,64
    e3f4:	40f607b3          	sub	a5,a2,a5
    e3f8:	00f597b3          	sll	a5,a1,a5
    e3fc:	00feeeb3          	or	t4,t4,a5
    e400:	01d03533          	snez	a0,t4
    e404:	00d56533          	or	a0,a0,a3
    e408:	b1dff06f          	j	df24 <__subdf3+0xc8>
    e40c:	ff8006b7          	lui	a3,0xff800
    e410:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e414:	40f987b3          	sub	a5,s3,a5
    e418:	00d77733          	and	a4,a4,a3
    e41c:	ef9ff06f          	j	e314 <__subdf3+0x4b8>
    e420:	00361513          	sll	a0,a2,0x3
    e424:	00355513          	srl	a0,a0,0x3
    e428:	00058713          	mv	a4,a1
    e42c:	cd9ff06f          	j	e104 <__subdf3+0x2a8>
    e430:	7ff00793          	li	a5,2047
    e434:	def686e3          	beq	a3,a5,e220 <__subdf3+0x3c4>
    e438:	01d88eb3          	add	t4,a7,t4
    e43c:	011eb633          	sltu	a2,t4,a7
    e440:	00b707b3          	add	a5,a4,a1
    e444:	00c787b3          	add	a5,a5,a2
    e448:	01f79513          	sll	a0,a5,0x1f
    e44c:	001ede93          	srl	t4,t4,0x1
    e450:	01d564b3          	or	s1,a0,t4
    e454:	0017d913          	srl	s2,a5,0x1
    e458:	00068993          	mv	s3,a3
    e45c:	b45ff06f          	j	dfa0 <__subdf3+0x144>
    e460:	411e8633          	sub	a2,t4,a7
    e464:	40e587b3          	sub	a5,a1,a4
    e468:	00ceb733          	sltu	a4,t4,a2
    e46c:	00060493          	mv	s1,a2
    e470:	40e78933          	sub	s2,a5,a4
    e474:	00068413          	mv	s0,a3
    e478:	ad1ff06f          	j	df48 <__subdf3+0xec>
    e47c:	00361613          	sll	a2,a2,0x3
    e480:	00365513          	srl	a0,a2,0x3
    e484:	00068413          	mv	s0,a3
    e488:	00058713          	mv	a4,a1
    e48c:	e39ff06f          	j	e2c4 <__subdf3+0x468>
    e490:	e00798e3          	bnez	a5,e2a0 <__subdf3+0x444>
    e494:	22080663          	beqz	a6,e6c0 <__subdf3+0x864>
    e498:	0035d713          	srl	a4,a1,0x3
    e49c:	00361613          	sll	a2,a2,0x3
    e4a0:	01d59593          	sll	a1,a1,0x1d
    e4a4:	00b76733          	or	a4,a4,a1
    e4a8:	00365613          	srl	a2,a2,0x3
    e4ac:	00c76733          	or	a4,a4,a2
    e4b0:	00068413          	mv	s0,a3
    e4b4:	c61ff06f          	j	e114 <__subdf3+0x2b8>
    e4b8:	01d88eb3          	add	t4,a7,t4
    e4bc:	00b705b3          	add	a1,a4,a1
    e4c0:	011eb633          	sltu	a2,t4,a7
    e4c4:	00c58933          	add	s2,a1,a2
    e4c8:	00891793          	sll	a5,s2,0x8
    e4cc:	000e8493          	mv	s1,t4
    e4d0:	0a07d863          	bgez	a5,e580 <__subdf3+0x724>
    e4d4:	00200993          	li	s3,2
    e4d8:	bddff06f          	j	e0b4 <__subdf3+0x258>
    e4dc:	41d88eb3          	sub	t4,a7,t4
    e4e0:	40b705b3          	sub	a1,a4,a1
    e4e4:	01d8b633          	sltu	a2,a7,t4
    e4e8:	000e8493          	mv	s1,t4
    e4ec:	40c58933          	sub	s2,a1,a2
    e4f0:	00100993          	li	s3,1
    e4f4:	a41ff06f          	j	df34 <__subdf3+0xd8>
    e4f8:	fe078693          	add	a3,a5,-32
    e4fc:	02000613          	li	a2,32
    e500:	00d5d6b3          	srl	a3,a1,a3
    e504:	00c78a63          	beq	a5,a2,e518 <__subdf3+0x6bc>
    e508:	04000613          	li	a2,64
    e50c:	40f607b3          	sub	a5,a2,a5
    e510:	00f597b3          	sll	a5,a1,a5
    e514:	00feeeb3          	or	t4,t4,a5
    e518:	01d03933          	snez	s2,t4
    e51c:	00d96933          	or	s2,s2,a3
    e520:	b71ff06f          	j	e090 <__subdf3+0x234>
    e524:	fe080793          	add	a5,a6,-32
    e528:	02000693          	li	a3,32
    e52c:	00f757b3          	srl	a5,a4,a5
    e530:	00d80a63          	beq	a6,a3,e544 <__subdf3+0x6e8>
    e534:	04000693          	li	a3,64
    e538:	410686b3          	sub	a3,a3,a6
    e53c:	00d71733          	sll	a4,a4,a3
    e540:	00e8e8b3          	or	a7,a7,a4
    e544:	01103533          	snez	a0,a7
    e548:	00f56533          	or	a0,a0,a5
    e54c:	e7dff06f          	j	e3c8 <__subdf3+0x56c>
    e550:	ec0788e3          	beqz	a5,e420 <__subdf3+0x5c4>
    e554:	01d5eeb3          	or	t4,a1,t4
    e558:	bc0e90e3          	bnez	t4,e118 <__subdf3+0x2bc>
    e55c:	d49ff06f          	j	e2a4 <__subdf3+0x448>
    e560:	411e8633          	sub	a2,t4,a7
    e564:	40e585b3          	sub	a1,a1,a4
    e568:	00ceb733          	sltu	a4,t4,a2
    e56c:	00060493          	mv	s1,a2
    e570:	40e58933          	sub	s2,a1,a4
    e574:	00068413          	mv	s0,a3
    e578:	00100993          	li	s3,1
    e57c:	9b9ff06f          	j	df34 <__subdf3+0xd8>
    e580:	00100793          	li	a5,1
    e584:	d11ff06f          	j	e294 <__subdf3+0x438>
    e588:	dc0800e3          	beqz	a6,e348 <__subdf3+0x4ec>
    e58c:	00361613          	sll	a2,a2,0x3
    e590:	00365793          	srl	a5,a2,0x3
    e594:	01d59813          	sll	a6,a1,0x1d
    e598:	00959713          	sll	a4,a1,0x9
    e59c:	00f86833          	or	a6,a6,a5
    e5a0:	00c75713          	srl	a4,a4,0xc
    e5a4:	00068e13          	mv	t3,a3
    e5a8:	00000793          	li	a5,0
    e5ac:	a55ff06f          	j	e000 <__subdf3+0x1a4>
    e5b0:	41d88933          	sub	s2,a7,t4
    e5b4:	0128b7b3          	sltu	a5,a7,s2
    e5b8:	40b70633          	sub	a2,a4,a1
    e5bc:	40f60633          	sub	a2,a2,a5
    e5c0:	00861793          	sll	a5,a2,0x8
    e5c4:	0e07d263          	bgez	a5,e6a8 <__subdf3+0x84c>
    e5c8:	411e8633          	sub	a2,t4,a7
    e5cc:	40e58733          	sub	a4,a1,a4
    e5d0:	00cebeb3          	sltu	t4,t4,a2
    e5d4:	41d70733          	sub	a4,a4,t4
    e5d8:	00871793          	sll	a5,a4,0x8
    e5dc:	00060493          	mv	s1,a2
    e5e0:	1207de63          	bgez	a5,e71c <__subdf3+0x8c0>
    e5e4:	ff8007b7          	lui	a5,0xff800
    e5e8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e5ec:	00f77733          	and	a4,a4,a5
    e5f0:	00068413          	mv	s0,a3
    e5f4:	00100793          	li	a5,1
    e5f8:	9f1ff06f          	j	dfe8 <__subdf3+0x18c>
    e5fc:	00361613          	sll	a2,a2,0x3
    e600:	00365513          	srl	a0,a2,0x3
    e604:	00058713          	mv	a4,a1
    e608:	cbdff06f          	j	e2c4 <__subdf3+0x468>
    e60c:	00361613          	sll	a2,a2,0x3
    e610:	00365913          	srl	s2,a2,0x3
    e614:	00058713          	mv	a4,a1
    e618:	cfdff06f          	j	e314 <__subdf3+0x4b8>
    e61c:	01d886b3          	add	a3,a7,t4
    e620:	00b707b3          	add	a5,a4,a1
    e624:	0116b633          	sltu	a2,a3,a7
    e628:	00c787b3          	add	a5,a5,a2
    e62c:	00879713          	sll	a4,a5,0x8
    e630:	0036d813          	srl	a6,a3,0x3
    e634:	08075e63          	bgez	a4,e6d0 <__subdf3+0x874>
    e638:	ff800737          	lui	a4,0xff800
    e63c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e640:	00e7f7b3          	and	a5,a5,a4
    e644:	01d79713          	sll	a4,a5,0x1d
    e648:	00979793          	sll	a5,a5,0x9
    e64c:	01076833          	or	a6,a4,a6
    e650:	00c7d713          	srl	a4,a5,0xc
    e654:	00100793          	li	a5,1
    e658:	9a9ff06f          	j	e000 <__subdf3+0x1a4>
    e65c:	fe068793          	add	a5,a3,-32
    e660:	02000613          	li	a2,32
    e664:	00f757b3          	srl	a5,a4,a5
    e668:	00c68a63          	beq	a3,a2,e67c <__subdf3+0x820>
    e66c:	04000613          	li	a2,64
    e670:	40d606b3          	sub	a3,a2,a3
    e674:	00d71733          	sll	a4,a4,a3
    e678:	00e8e8b3          	or	a7,a7,a4
    e67c:	01103933          	snez	s2,a7
    e680:	00f96933          	or	s2,s2,a5
    e684:	b39ff06f          	j	e1bc <__subdf3+0x360>
    e688:	0034d513          	srl	a0,s1,0x3
    e68c:	00098793          	mv	a5,s3
    e690:	00090713          	mv	a4,s2
    e694:	c31ff06f          	j	e2c4 <__subdf3+0x468>
    e698:	02000693          	li	a3,32
    e69c:	40f686b3          	sub	a3,a3,a5
    e6a0:	00000613          	li	a2,0
    e6a4:	8e9ff06f          	j	df8c <__subdf3+0x130>
    e6a8:	00c96833          	or	a6,s2,a2
    e6ac:	c8080ee3          	beqz	a6,e348 <__subdf3+0x4ec>
    e6b0:	00395913          	srl	s2,s2,0x3
    e6b4:	00000793          	li	a5,0
    e6b8:	00060713          	mv	a4,a2
    e6bc:	c59ff06f          	j	e314 <__subdf3+0x4b8>
    e6c0:	00000e13          	li	t3,0
    e6c4:	7ff00793          	li	a5,2047
    e6c8:	00080737          	lui	a4,0x80
    e6cc:	935ff06f          	j	e000 <__subdf3+0x1a4>
    e6d0:	01d79713          	sll	a4,a5,0x1d
    e6d4:	00979793          	sll	a5,a5,0x9
    e6d8:	01076833          	or	a6,a4,a6
    e6dc:	00c7d713          	srl	a4,a5,0xc
    e6e0:	00000793          	li	a5,0
    e6e4:	91dff06f          	j	e000 <__subdf3+0x1a4>
    e6e8:	ae0786e3          	beqz	a5,e1d4 <__subdf3+0x378>
    e6ec:	413f0833          	sub	a6,t5,s3
    e6f0:	00080793          	mv	a5,a6
    e6f4:	c6098ee3          	beqz	s3,e370 <__subdf3+0x514>
    e6f8:	03800793          	li	a5,56
    e6fc:	0107ca63          	blt	a5,a6,e710 <__subdf3+0x8b4>
    e700:	008007b7          	lui	a5,0x800
    e704:	00f76733          	or	a4,a4,a5
    e708:	00068413          	mv	s0,a3
    e70c:	c8dff06f          	j	e398 <__subdf3+0x53c>
    e710:	00068413          	mv	s0,a3
    e714:	00100513          	li	a0,1
    e718:	cb1ff06f          	j	e3c8 <__subdf3+0x56c>
    e71c:	01d71813          	sll	a6,a4,0x1d
    e720:	00365613          	srl	a2,a2,0x3
    e724:	00c86833          	or	a6,a6,a2
    e728:	00375713          	srl	a4,a4,0x3
    e72c:	00000793          	li	a5,0
    e730:	00068413          	mv	s0,a3
    e734:	ba5ff06f          	j	e2d8 <__subdf3+0x47c>
    e738:	ba078ae3          	beqz	a5,e2ec <__subdf3+0x490>
    e73c:	413f06b3          	sub	a3,t5,s3
    e740:	00099663          	bnez	s3,e74c <__subdf3+0x8f0>
    e744:	00068793          	mv	a5,a3
    e748:	a21ff06f          	j	e168 <__subdf3+0x30c>
    e74c:	03800793          	li	a5,56
    e750:	00100913          	li	s2,1
    e754:	a6d7c4e3          	blt	a5,a3,e1bc <__subdf3+0x360>
    e758:	008007b7          	lui	a5,0x800
    e75c:	00f76733          	or	a4,a4,a5
    e760:	a2dff06f          	j	e18c <__subdf3+0x330>

0000e764 <__unorddf2>:
    e764:	0145d713          	srl	a4,a1,0x14
    e768:	001007b7          	lui	a5,0x100
    e76c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e770:	fff74713          	not	a4,a4
    e774:	0146d813          	srl	a6,a3,0x14
    e778:	00b7f5b3          	and	a1,a5,a1
    e77c:	00d7f7b3          	and	a5,a5,a3
    e780:	01571693          	sll	a3,a4,0x15
    e784:	7ff87813          	and	a6,a6,2047
    e788:	02068063          	beqz	a3,e7a8 <__unorddf2+0x44>
    e78c:	7ff00713          	li	a4,2047
    e790:	00000513          	li	a0,0
    e794:	00e80463          	beq	a6,a4,e79c <__unorddf2+0x38>
    e798:	00008067          	ret
    e79c:	00c7e7b3          	or	a5,a5,a2
    e7a0:	00f03533          	snez	a0,a5
    e7a4:	00008067          	ret
    e7a8:	00a5e5b3          	or	a1,a1,a0
    e7ac:	00100513          	li	a0,1
    e7b0:	fc058ee3          	beqz	a1,e78c <__unorddf2+0x28>
    e7b4:	00008067          	ret

0000e7b8 <__fixdfsi>:
    e7b8:	0145d793          	srl	a5,a1,0x14
    e7bc:	001006b7          	lui	a3,0x100
    e7c0:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e7c4:	7ff7f793          	and	a5,a5,2047
    e7c8:	3fe00613          	li	a2,1022
    e7cc:	00b77733          	and	a4,a4,a1
    e7d0:	01f5d593          	srl	a1,a1,0x1f
    e7d4:	00f65e63          	bge	a2,a5,e7f0 <__fixdfsi+0x38>
    e7d8:	41d00613          	li	a2,1053
    e7dc:	00f65e63          	bge	a2,a5,e7f8 <__fixdfsi+0x40>
    e7e0:	80000537          	lui	a0,0x80000
    e7e4:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e7e8:	00a58533          	add	a0,a1,a0
    e7ec:	00008067          	ret
    e7f0:	00000513          	li	a0,0
    e7f4:	00008067          	ret
    e7f8:	43300613          	li	a2,1075
    e7fc:	40f60633          	sub	a2,a2,a5
    e800:	01f00813          	li	a6,31
    e804:	00d76733          	or	a4,a4,a3
    e808:	02c85063          	bge	a6,a2,e828 <__fixdfsi+0x70>
    e80c:	41300693          	li	a3,1043
    e810:	40f687b3          	sub	a5,a3,a5
    e814:	00f75733          	srl	a4,a4,a5
    e818:	40e00533          	neg	a0,a4
    e81c:	fc059ce3          	bnez	a1,e7f4 <__fixdfsi+0x3c>
    e820:	00070513          	mv	a0,a4
    e824:	00008067          	ret
    e828:	bed78793          	add	a5,a5,-1043
    e82c:	00f71733          	sll	a4,a4,a5
    e830:	00c55533          	srl	a0,a0,a2
    e834:	00a76733          	or	a4,a4,a0
    e838:	fe1ff06f          	j	e818 <__fixdfsi+0x60>

0000e83c <__floatsidf>:
    e83c:	ff010113          	add	sp,sp,-16
    e840:	00112623          	sw	ra,12(sp)
    e844:	00812423          	sw	s0,8(sp)
    e848:	00912223          	sw	s1,4(sp)
    e84c:	04050a63          	beqz	a0,e8a0 <__floatsidf+0x64>
    e850:	41f55713          	sra	a4,a0,0x1f
    e854:	00a744b3          	xor	s1,a4,a0
    e858:	40e484b3          	sub	s1,s1,a4
    e85c:	00050793          	mv	a5,a0
    e860:	00048513          	mv	a0,s1
    e864:	01f7d413          	srl	s0,a5,0x1f
    e868:	69c000ef          	jal	ef04 <__clzsi2>
    e86c:	41e00793          	li	a5,1054
    e870:	40a787b3          	sub	a5,a5,a0
    e874:	00a00713          	li	a4,10
    e878:	7ff7f793          	and	a5,a5,2047
    e87c:	06a74063          	blt	a4,a0,e8dc <__floatsidf+0xa0>
    e880:	00b00713          	li	a4,11
    e884:	40a70733          	sub	a4,a4,a0
    e888:	00e4d733          	srl	a4,s1,a4
    e88c:	01550513          	add	a0,a0,21
    e890:	00c71713          	sll	a4,a4,0xc
    e894:	00a494b3          	sll	s1,s1,a0
    e898:	00c75713          	srl	a4,a4,0xc
    e89c:	0140006f          	j	e8b0 <__floatsidf+0x74>
    e8a0:	00000413          	li	s0,0
    e8a4:	00000793          	li	a5,0
    e8a8:	00000713          	li	a4,0
    e8ac:	00000493          	li	s1,0
    e8b0:	01479793          	sll	a5,a5,0x14
    e8b4:	01f41413          	sll	s0,s0,0x1f
    e8b8:	00e7e7b3          	or	a5,a5,a4
    e8bc:	00c12083          	lw	ra,12(sp)
    e8c0:	0087e7b3          	or	a5,a5,s0
    e8c4:	00812403          	lw	s0,8(sp)
    e8c8:	00048513          	mv	a0,s1
    e8cc:	00078593          	mv	a1,a5
    e8d0:	00412483          	lw	s1,4(sp)
    e8d4:	01010113          	add	sp,sp,16
    e8d8:	00008067          	ret
    e8dc:	ff550513          	add	a0,a0,-11
    e8e0:	00a49733          	sll	a4,s1,a0
    e8e4:	00c71713          	sll	a4,a4,0xc
    e8e8:	00c75713          	srl	a4,a4,0xc
    e8ec:	00000493          	li	s1,0
    e8f0:	fc1ff06f          	j	e8b0 <__floatsidf+0x74>

0000e8f4 <__floatunsidf>:
    e8f4:	ff010113          	add	sp,sp,-16
    e8f8:	00812423          	sw	s0,8(sp)
    e8fc:	00112623          	sw	ra,12(sp)
    e900:	00050413          	mv	s0,a0
    e904:	04050c63          	beqz	a0,e95c <__floatunsidf+0x68>
    e908:	5fc000ef          	jal	ef04 <__clzsi2>
    e90c:	41e00793          	li	a5,1054
    e910:	40a787b3          	sub	a5,a5,a0
    e914:	00a00713          	li	a4,10
    e918:	7ff7f793          	and	a5,a5,2047
    e91c:	06a74463          	blt	a4,a0,e984 <__floatunsidf+0x90>
    e920:	00b00713          	li	a4,11
    e924:	40a70733          	sub	a4,a4,a0
    e928:	01550513          	add	a0,a0,21
    e92c:	00e45733          	srl	a4,s0,a4
    e930:	00a41433          	sll	s0,s0,a0
    e934:	00c12083          	lw	ra,12(sp)
    e938:	00040513          	mv	a0,s0
    e93c:	00c71713          	sll	a4,a4,0xc
    e940:	00812403          	lw	s0,8(sp)
    e944:	00c75713          	srl	a4,a4,0xc
    e948:	01479793          	sll	a5,a5,0x14
    e94c:	00e7e7b3          	or	a5,a5,a4
    e950:	00078593          	mv	a1,a5
    e954:	01010113          	add	sp,sp,16
    e958:	00008067          	ret
    e95c:	00c12083          	lw	ra,12(sp)
    e960:	00040513          	mv	a0,s0
    e964:	00000793          	li	a5,0
    e968:	00812403          	lw	s0,8(sp)
    e96c:	00000713          	li	a4,0
    e970:	01479793          	sll	a5,a5,0x14
    e974:	00e7e7b3          	or	a5,a5,a4
    e978:	00078593          	mv	a1,a5
    e97c:	01010113          	add	sp,sp,16
    e980:	00008067          	ret
    e984:	ff550513          	add	a0,a0,-11
    e988:	00a41733          	sll	a4,s0,a0
    e98c:	00000413          	li	s0,0
    e990:	00c12083          	lw	ra,12(sp)
    e994:	00040513          	mv	a0,s0
    e998:	00c71713          	sll	a4,a4,0xc
    e99c:	00812403          	lw	s0,8(sp)
    e9a0:	00c75713          	srl	a4,a4,0xc
    e9a4:	01479793          	sll	a5,a5,0x14
    e9a8:	00e7e7b3          	or	a5,a5,a4
    e9ac:	00078593          	mv	a1,a5
    e9b0:	01010113          	add	sp,sp,16
    e9b4:	00008067          	ret

0000e9b8 <__trunctfdf2>:
    e9b8:	00c52583          	lw	a1,12(a0)
    e9bc:	00852783          	lw	a5,8(a0)
    e9c0:	00052803          	lw	a6,0(a0)
    e9c4:	00452683          	lw	a3,4(a0)
    e9c8:	01059613          	sll	a2,a1,0x10
    e9cc:	fe010113          	add	sp,sp,-32
    e9d0:	00159713          	sll	a4,a1,0x1
    e9d4:	01065613          	srl	a2,a2,0x10
    e9d8:	00f12423          	sw	a5,8(sp)
    e9dc:	00b12623          	sw	a1,12(sp)
    e9e0:	00f12c23          	sw	a5,24(sp)
    e9e4:	01012023          	sw	a6,0(sp)
    e9e8:	00d12223          	sw	a3,4(sp)
    e9ec:	01012823          	sw	a6,16(sp)
    e9f0:	00d12a23          	sw	a3,20(sp)
    e9f4:	00c12e23          	sw	a2,28(sp)
    e9f8:	01175713          	srl	a4,a4,0x11
    e9fc:	01f5d593          	srl	a1,a1,0x1f
    ea00:	01010893          	add	a7,sp,16
    ea04:	01c10793          	add	a5,sp,28
    ea08:	00361513          	sll	a0,a2,0x3
    ea0c:	ffc7a603          	lw	a2,-4(a5)
    ea10:	ffc78793          	add	a5,a5,-4
    ea14:	01d65693          	srl	a3,a2,0x1d
    ea18:	00a6e6b3          	or	a3,a3,a0
    ea1c:	00d7a223          	sw	a3,4(a5)
    ea20:	fef894e3          	bne	a7,a5,ea08 <__trunctfdf2+0x50>
    ea24:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    ea28:	00381813          	sll	a6,a6,0x3
    ea2c:	01169613          	sll	a2,a3,0x11
    ea30:	01012823          	sw	a6,16(sp)
    ea34:	01265613          	srl	a2,a2,0x12
    ea38:	04060263          	beqz	a2,ea7c <__trunctfdf2+0xc4>
    ea3c:	ffffc6b7          	lui	a3,0xffffc
    ea40:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    ea44:	00d70733          	add	a4,a4,a3
    ea48:	7fe00693          	li	a3,2046
    ea4c:	10e6d463          	bge	a3,a4,eb54 <__trunctfdf2+0x19c>
    ea50:	7ff00793          	li	a5,2047
    ea54:	00000613          	li	a2,0
    ea58:	00000693          	li	a3,0
    ea5c:	01479793          	sll	a5,a5,0x14
    ea60:	01f59593          	sll	a1,a1,0x1f
    ea64:	00c7e7b3          	or	a5,a5,a2
    ea68:	00b7e7b3          	or	a5,a5,a1
    ea6c:	00068513          	mv	a0,a3
    ea70:	00078593          	mv	a1,a5
    ea74:	02010113          	add	sp,sp,32
    ea78:	00008067          	ret
    ea7c:	01412603          	lw	a2,20(sp)
    ea80:	01812883          	lw	a7,24(sp)
    ea84:	01c12503          	lw	a0,28(sp)
    ea88:	011666b3          	or	a3,a2,a7
    ea8c:	00a6e6b3          	or	a3,a3,a0
    ea90:	0106e6b3          	or	a3,a3,a6
    ea94:	04071463          	bnez	a4,eadc <__trunctfdf2+0x124>
    ea98:	14068263          	beqz	a3,ebdc <__trunctfdf2+0x224>
    ea9c:	00500693          	li	a3,5
    eaa0:	00000613          	li	a2,0
    eaa4:	0036d793          	srl	a5,a3,0x3
    eaa8:	01d61693          	sll	a3,a2,0x1d
    eaac:	00f6e6b3          	or	a3,a3,a5
    eab0:	00961613          	sll	a2,a2,0x9
    eab4:	7ff77793          	and	a5,a4,2047
    eab8:	00c65613          	srl	a2,a2,0xc
    eabc:	01479793          	sll	a5,a5,0x14
    eac0:	01f59593          	sll	a1,a1,0x1f
    eac4:	00c7e7b3          	or	a5,a5,a2
    eac8:	00b7e7b3          	or	a5,a5,a1
    eacc:	00068513          	mv	a0,a3
    ead0:	00078593          	mv	a1,a5
    ead4:	02010113          	add	sp,sp,32
    ead8:	00008067          	ret
    eadc:	12068463          	beqz	a3,ec04 <__trunctfdf2+0x24c>
    eae0:	01c8d793          	srl	a5,a7,0x1c
    eae4:	00451513          	sll	a0,a0,0x4
    eae8:	00a7e7b3          	or	a5,a5,a0
    eaec:	008006b7          	lui	a3,0x800
    eaf0:	00d7f6b3          	and	a3,a5,a3
    eaf4:	1c068263          	beqz	a3,ecb8 <__trunctfdf2+0x300>
    eaf8:	ff800737          	lui	a4,0xff800
    eafc:	01c65693          	srl	a3,a2,0x1c
    eb00:	00489893          	sll	a7,a7,0x4
    eb04:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    eb08:	00e7f633          	and	a2,a5,a4
    eb0c:	0116e6b3          	or	a3,a3,a7
    eb10:	004007b7          	lui	a5,0x400
    eb14:	00f66633          	or	a2,a2,a5
    eb18:	ff86f693          	and	a3,a3,-8
    eb1c:	00000793          	li	a5,0
    eb20:	0036d713          	srl	a4,a3,0x3
    eb24:	01d61693          	sll	a3,a2,0x1d
    eb28:	00961613          	sll	a2,a2,0x9
    eb2c:	00c65613          	srl	a2,a2,0xc
    eb30:	01479793          	sll	a5,a5,0x14
    eb34:	01f59593          	sll	a1,a1,0x1f
    eb38:	00c7e7b3          	or	a5,a5,a2
    eb3c:	00e6e6b3          	or	a3,a3,a4
    eb40:	00b7e7b3          	or	a5,a5,a1
    eb44:	00068513          	mv	a0,a3
    eb48:	00078593          	mv	a1,a5
    eb4c:	02010113          	add	sp,sp,32
    eb50:	00008067          	ret
    eb54:	0ce05c63          	blez	a4,ec2c <__trunctfdf2+0x274>
    eb58:	01412783          	lw	a5,20(sp)
    eb5c:	01812503          	lw	a0,24(sp)
    eb60:	01c12603          	lw	a2,28(sp)
    eb64:	00479693          	sll	a3,a5,0x4
    eb68:	0106e6b3          	or	a3,a3,a6
    eb6c:	01c7d793          	srl	a5,a5,0x1c
    eb70:	00451813          	sll	a6,a0,0x4
    eb74:	00461613          	sll	a2,a2,0x4
    eb78:	01c55513          	srl	a0,a0,0x1c
    eb7c:	00d036b3          	snez	a3,a3
    eb80:	0107e7b3          	or	a5,a5,a6
    eb84:	00a66633          	or	a2,a2,a0
    eb88:	00f6e6b3          	or	a3,a3,a5
    eb8c:	0076f793          	and	a5,a3,7
    eb90:	02078063          	beqz	a5,ebb0 <__trunctfdf2+0x1f8>
    eb94:	00f6f793          	and	a5,a3,15
    eb98:	00400513          	li	a0,4
    eb9c:	00a78a63          	beq	a5,a0,ebb0 <__trunctfdf2+0x1f8>
    eba0:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    eba4:	00d7b6b3          	sltu	a3,a5,a3
    eba8:	00d60633          	add	a2,a2,a3
    ebac:	00078693          	mv	a3,a5
    ebb0:	008007b7          	lui	a5,0x800
    ebb4:	00f677b3          	and	a5,a2,a5
    ebb8:	ee0786e3          	beqz	a5,eaa4 <__trunctfdf2+0xec>
    ebbc:	00170713          	add	a4,a4,1
    ebc0:	7ff00793          	li	a5,2047
    ebc4:	e8f706e3          	beq	a4,a5,ea50 <__trunctfdf2+0x98>
    ebc8:	ff8007b7          	lui	a5,0xff800
    ebcc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ebd0:	00f67633          	and	a2,a2,a5
    ebd4:	7ff77793          	and	a5,a4,2047
    ebd8:	f49ff06f          	j	eb20 <__trunctfdf2+0x168>
    ebdc:	00000793          	li	a5,0
    ebe0:	00000613          	li	a2,0
    ebe4:	01479793          	sll	a5,a5,0x14
    ebe8:	01f59593          	sll	a1,a1,0x1f
    ebec:	00c7e7b3          	or	a5,a5,a2
    ebf0:	00b7e7b3          	or	a5,a5,a1
    ebf4:	00068513          	mv	a0,a3
    ebf8:	00078593          	mv	a1,a5
    ebfc:	02010113          	add	sp,sp,32
    ec00:	00008067          	ret
    ec04:	7ff00793          	li	a5,2047
    ec08:	00000613          	li	a2,0
    ec0c:	01479793          	sll	a5,a5,0x14
    ec10:	01f59593          	sll	a1,a1,0x1f
    ec14:	00c7e7b3          	or	a5,a5,a2
    ec18:	00b7e7b3          	or	a5,a5,a1
    ec1c:	00068513          	mv	a0,a3
    ec20:	00078593          	mv	a1,a5
    ec24:	02010113          	add	sp,sp,32
    ec28:	00008067          	ret
    ec2c:	fcc00693          	li	a3,-52
    ec30:	08d74c63          	blt	a4,a3,ecc8 <__trunctfdf2+0x310>
    ec34:	03d00693          	li	a3,61
    ec38:	40e686b3          	sub	a3,a3,a4
    ec3c:	01c12703          	lw	a4,28(sp)
    ec40:	4056de13          	sra	t3,a3,0x5
    ec44:	00080eb7          	lui	t4,0x80
    ec48:	00eeeeb3          	or	t4,t4,a4
    ec4c:	002e1513          	sll	a0,t3,0x2
    ec50:	01d12e23          	sw	t4,28(sp)
    ec54:	01f6f693          	and	a3,a3,31
    ec58:	00a88833          	add	a6,a7,a0
    ec5c:	00088613          	mv	a2,a7
    ec60:	00000713          	li	a4,0
    ec64:	00062303          	lw	t1,0(a2)
    ec68:	00460613          	add	a2,a2,4
    ec6c:	00676733          	or	a4,a4,t1
    ec70:	fec81ae3          	bne	a6,a2,ec64 <__trunctfdf2+0x2ac>
    ec74:	00300613          	li	a2,3
    ec78:	41c60633          	sub	a2,a2,t3
    ec7c:	04069a63          	bnez	a3,ecd0 <__trunctfdf2+0x318>
    ec80:	00082803          	lw	a6,0(a6)
    ec84:	00168693          	add	a3,a3,1
    ec88:	00478793          	add	a5,a5,4
    ec8c:	ff07ae23          	sw	a6,-4(a5)
    ec90:	00d64e63          	blt	a2,a3,ecac <__trunctfdf2+0x2f4>
    ec94:	00a78833          	add	a6,a5,a0
    ec98:	00082803          	lw	a6,0(a6)
    ec9c:	00168693          	add	a3,a3,1
    eca0:	00478793          	add	a5,a5,4
    eca4:	ff07ae23          	sw	a6,-4(a5)
    eca8:	fed656e3          	bge	a2,a3,ec94 <__trunctfdf2+0x2dc>
    ecac:	00400793          	li	a5,4
    ecb0:	41c787b3          	sub	a5,a5,t3
    ecb4:	0840006f          	j	ed38 <__trunctfdf2+0x380>
    ecb8:	00000593          	li	a1,0
    ecbc:	7ff00793          	li	a5,2047
    ecc0:	00080637          	lui	a2,0x80
    ecc4:	d99ff06f          	j	ea5c <__trunctfdf2+0xa4>
    ecc8:	00000713          	li	a4,0
    eccc:	dd1ff06f          	j	ea9c <__trunctfdf2+0xe4>
    ecd0:	02050813          	add	a6,a0,32
    ecd4:	00280833          	add	a6,a6,sp
    ecd8:	ff082803          	lw	a6,-16(a6)
    ecdc:	02000f13          	li	t5,32
    ece0:	40df0f33          	sub	t5,t5,a3
    ece4:	01e81833          	sll	a6,a6,t5
    ece8:	01076733          	or	a4,a4,a6
    ecec:	08060e63          	beqz	a2,ed88 <__trunctfdf2+0x3d0>
    ecf0:	00261813          	sll	a6,a2,0x2
    ecf4:	00f80fb3          	add	t6,a6,a5
    ecf8:	00a88633          	add	a2,a7,a0
    ecfc:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ed00:	00462303          	lw	t1,4(a2)
    ed04:	00478793          	add	a5,a5,4
    ed08:	00d55533          	srl	a0,a0,a3
    ed0c:	01e31333          	sll	t1,t1,t5
    ed10:	00656533          	or	a0,a0,t1
    ed14:	fea7ae23          	sw	a0,-4(a5)
    ed18:	00460613          	add	a2,a2,4
    ed1c:	feff90e3          	bne	t6,a5,ecfc <__trunctfdf2+0x344>
    ed20:	00400793          	li	a5,4
    ed24:	41c787b3          	sub	a5,a5,t3
    ed28:	02080613          	add	a2,a6,32
    ed2c:	00260633          	add	a2,a2,sp
    ed30:	00dedeb3          	srl	t4,t4,a3
    ed34:	ffd62823          	sw	t4,-16(a2)
    ed38:	00400693          	li	a3,4
    ed3c:	40f686b3          	sub	a3,a3,a5
    ed40:	00269693          	sll	a3,a3,0x2
    ed44:	00279793          	sll	a5,a5,0x2
    ed48:	00800613          	li	a2,8
    ed4c:	00f888b3          	add	a7,a7,a5
    ed50:	00c6ea63          	bltu	a3,a2,ed64 <__trunctfdf2+0x3ac>
    ed54:	0008a023          	sw	zero,0(a7)
    ed58:	0008a223          	sw	zero,4(a7)
    ed5c:	ff868693          	add	a3,a3,-8
    ed60:	00888893          	add	a7,a7,8
    ed64:	00400793          	li	a5,4
    ed68:	00f6e463          	bltu	a3,a5,ed70 <__trunctfdf2+0x3b8>
    ed6c:	0008a023          	sw	zero,0(a7)
    ed70:	01012783          	lw	a5,16(sp)
    ed74:	00e03733          	snez	a4,a4
    ed78:	01412603          	lw	a2,20(sp)
    ed7c:	00f766b3          	or	a3,a4,a5
    ed80:	00000713          	li	a4,0
    ed84:	e09ff06f          	j	eb8c <__trunctfdf2+0x1d4>
    ed88:	00100793          	li	a5,1
    ed8c:	00000813          	li	a6,0
    ed90:	f99ff06f          	j	ed28 <__trunctfdf2+0x370>

0000ed94 <__mulsi3>:
    ed94:	00050613          	mv	a2,a0
    ed98:	00000513          	li	a0,0
    ed9c:	0015f693          	and	a3,a1,1
    eda0:	00068463          	beqz	a3,eda8 <__mulsi3+0x14>
    eda4:	00c50533          	add	a0,a0,a2
    eda8:	0015d593          	srl	a1,a1,0x1
    edac:	00161613          	sll	a2,a2,0x1
    edb0:	fe0596e3          	bnez	a1,ed9c <__mulsi3+0x8>
    edb4:	00008067          	ret

0000edb8 <__muldi3>:
    edb8:	ff010113          	add	sp,sp,-16
    edbc:	00812423          	sw	s0,8(sp)
    edc0:	00050413          	mv	s0,a0
    edc4:	00112623          	sw	ra,12(sp)
    edc8:	00060513          	mv	a0,a2
    edcc:	00068393          	mv	t2,a3
    edd0:	00040713          	mv	a4,s0
    edd4:	00060813          	mv	a6,a2
    edd8:	00000793          	li	a5,0
    eddc:	00000313          	li	t1,0
    ede0:	00000f13          	li	t5,0
    ede4:	01e708b3          	add	a7,a4,t5
    ede8:	00187e93          	and	t4,a6,1
    edec:	00f30fb3          	add	t6,t1,a5
    edf0:	01f75e13          	srl	t3,a4,0x1f
    edf4:	00185813          	srl	a6,a6,0x1
    edf8:	00e8b2b3          	sltu	t0,a7,a4
    edfc:	00179793          	sll	a5,a5,0x1
    ee00:	000e8663          	beqz	t4,ee0c <__muldi3+0x54>
    ee04:	00088f13          	mv	t5,a7
    ee08:	01f28333          	add	t1,t0,t6
    ee0c:	00171713          	sll	a4,a4,0x1
    ee10:	01c7e7b3          	or	a5,a5,t3
    ee14:	fc0818e3          	bnez	a6,ede4 <__muldi3+0x2c>
    ee18:	00058663          	beqz	a1,ee24 <__muldi3+0x6c>
    ee1c:	f79ff0ef          	jal	ed94 <__mulsi3>
    ee20:	00650333          	add	t1,a0,t1
    ee24:	00038a63          	beqz	t2,ee38 <__muldi3+0x80>
    ee28:	00040513          	mv	a0,s0
    ee2c:	00038593          	mv	a1,t2
    ee30:	f65ff0ef          	jal	ed94 <__mulsi3>
    ee34:	00650333          	add	t1,a0,t1
    ee38:	00c12083          	lw	ra,12(sp)
    ee3c:	00812403          	lw	s0,8(sp)
    ee40:	000f0513          	mv	a0,t5
    ee44:	00030593          	mv	a1,t1
    ee48:	01010113          	add	sp,sp,16
    ee4c:	00008067          	ret

0000ee50 <__divsi3>:
    ee50:	06054063          	bltz	a0,eeb0 <__umodsi3+0x10>
    ee54:	0605c663          	bltz	a1,eec0 <__umodsi3+0x20>

0000ee58 <__hidden___udivsi3>:
    ee58:	00058613          	mv	a2,a1
    ee5c:	00050593          	mv	a1,a0
    ee60:	fff00513          	li	a0,-1
    ee64:	02060c63          	beqz	a2,ee9c <__hidden___udivsi3+0x44>
    ee68:	00100693          	li	a3,1
    ee6c:	00b67a63          	bgeu	a2,a1,ee80 <__hidden___udivsi3+0x28>
    ee70:	00c05863          	blez	a2,ee80 <__hidden___udivsi3+0x28>
    ee74:	00161613          	sll	a2,a2,0x1
    ee78:	00169693          	sll	a3,a3,0x1
    ee7c:	feb66ae3          	bltu	a2,a1,ee70 <__hidden___udivsi3+0x18>
    ee80:	00000513          	li	a0,0
    ee84:	00c5e663          	bltu	a1,a2,ee90 <__hidden___udivsi3+0x38>
    ee88:	40c585b3          	sub	a1,a1,a2
    ee8c:	00d56533          	or	a0,a0,a3
    ee90:	0016d693          	srl	a3,a3,0x1
    ee94:	00165613          	srl	a2,a2,0x1
    ee98:	fe0696e3          	bnez	a3,ee84 <__hidden___udivsi3+0x2c>
    ee9c:	00008067          	ret

0000eea0 <__umodsi3>:
    eea0:	00008293          	mv	t0,ra
    eea4:	fb5ff0ef          	jal	ee58 <__hidden___udivsi3>
    eea8:	00058513          	mv	a0,a1
    eeac:	00028067          	jr	t0
    eeb0:	40a00533          	neg	a0,a0
    eeb4:	00b04863          	bgtz	a1,eec4 <__umodsi3+0x24>
    eeb8:	40b005b3          	neg	a1,a1
    eebc:	f9dff06f          	j	ee58 <__hidden___udivsi3>
    eec0:	40b005b3          	neg	a1,a1
    eec4:	00008293          	mv	t0,ra
    eec8:	f91ff0ef          	jal	ee58 <__hidden___udivsi3>
    eecc:	40a00533          	neg	a0,a0
    eed0:	00028067          	jr	t0

0000eed4 <__modsi3>:
    eed4:	00008293          	mv	t0,ra
    eed8:	0005ca63          	bltz	a1,eeec <__modsi3+0x18>
    eedc:	00054c63          	bltz	a0,eef4 <__modsi3+0x20>
    eee0:	f79ff0ef          	jal	ee58 <__hidden___udivsi3>
    eee4:	00058513          	mv	a0,a1
    eee8:	00028067          	jr	t0
    eeec:	40b005b3          	neg	a1,a1
    eef0:	fe0558e3          	bgez	a0,eee0 <__modsi3+0xc>
    eef4:	40a00533          	neg	a0,a0
    eef8:	f61ff0ef          	jal	ee58 <__hidden___udivsi3>
    eefc:	40b00533          	neg	a0,a1
    ef00:	00028067          	jr	t0

0000ef04 <__clzsi2>:
    ef04:	000107b7          	lui	a5,0x10
    ef08:	02f57a63          	bgeu	a0,a5,ef3c <__clzsi2+0x38>
    ef0c:	10053793          	sltiu	a5,a0,256
    ef10:	0017b793          	seqz	a5,a5
    ef14:	00379793          	sll	a5,a5,0x3
    ef18:	02000713          	li	a4,32
    ef1c:	40f70733          	sub	a4,a4,a5
    ef20:	00f55533          	srl	a0,a0,a5
    ef24:	00001797          	auipc	a5,0x1
    ef28:	9e478793          	add	a5,a5,-1564 # f908 <__clz_tab>
    ef2c:	00a787b3          	add	a5,a5,a0
    ef30:	0007c503          	lbu	a0,0(a5)
    ef34:	40a70533          	sub	a0,a4,a0
    ef38:	00008067          	ret
    ef3c:	010007b7          	lui	a5,0x1000
    ef40:	02f57463          	bgeu	a0,a5,ef68 <__clzsi2+0x64>
    ef44:	01000793          	li	a5,16
    ef48:	00f55533          	srl	a0,a0,a5
    ef4c:	00001797          	auipc	a5,0x1
    ef50:	9bc78793          	add	a5,a5,-1604 # f908 <__clz_tab>
    ef54:	00a787b3          	add	a5,a5,a0
    ef58:	0007c503          	lbu	a0,0(a5)
    ef5c:	01000713          	li	a4,16
    ef60:	40a70533          	sub	a0,a4,a0
    ef64:	00008067          	ret
    ef68:	01800793          	li	a5,24
    ef6c:	00f55533          	srl	a0,a0,a5
    ef70:	00001797          	auipc	a5,0x1
    ef74:	99878793          	add	a5,a5,-1640 # f908 <__clz_tab>
    ef78:	00a787b3          	add	a5,a5,a0
    ef7c:	0007c503          	lbu	a0,0(a5)
    ef80:	00800713          	li	a4,8
    ef84:	40a70533          	sub	a0,a4,a0
    ef88:	00008067          	ret
