
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x2ec>
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
     110:	c5040413          	add	s0,s0,-944 # ed5c <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	c4848493          	add	s1,s1,-952 # ed5c <__fini_array_end>

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
     178:	be840413          	add	s0,s0,-1048 # ed5c <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	be048493          	add	s1,s1,-1056 # ed5c <__fini_array_end>

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

static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	d6050513          	add	a0,a0,-672 # ed60 <__fini_array_end+0x4>
     21c:	1e90006f          	j	c04 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     220:	fe010113          	add	sp,sp,-32
     224:	00812c23          	sw	s0,24(sp)
     228:	00912a23          	sw	s1,20(sp)
     22c:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     230:	00060493          	mv	s1,a2
     234:	00000693          	li	a3,0
     238:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     23c:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     240:	1490e0ef          	jal	eb88 <__muldi3>
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
     270:	1200b0ef          	jal	b390 <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	7b80b0ef          	jal	ba3c <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	0f00b0ef          	jal	b390 <__udivdi3>
}
     2a4:	01812403          	lw	s0,24(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2a8:	00c12703          	lw	a4,12(sp)
     2ac:	00812783          	lw	a5,8(sp)
}
     2b0:	01c12083          	lw	ra,28(sp)
     2b4:	01412483          	lw	s1,20(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2b8:	00050613          	mv	a2,a0
     2bc:	0000f537          	lui	a0,0xf
     2c0:	00058693          	mv	a3,a1
     2c4:	d6c50513          	add	a0,a0,-660 # ed6c <__fini_array_end+0x10>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2cc:	1390006f          	j	c04 <printf>

000002d0 <main>:
  cfs_read_C(C4);
  for(int i=0;i<N;++i) for(int j=0;j<N;++j) C[i][j]=C4[i][j];
}

int main(void){
  printf("== 3x3 GEMM: SW vs CFU vs CFS ==\n");
     2d0:	0000f537          	lui	a0,0xf
int main(void){
     2d4:	ed010113          	add	sp,sp,-304
  printf("== 3x3 GEMM: SW vs CFU vs CFS ==\n");
     2d8:	d8c50513          	add	a0,a0,-628 # ed8c <__fini_array_end+0x30>
int main(void){
     2dc:	12112623          	sw	ra,300(sp)
     2e0:	12912223          	sw	s1,292(sp)
     2e4:	13212023          	sw	s2,288(sp)
     2e8:	11312e23          	sw	s3,284(sp)
     2ec:	11412c23          	sw	s4,280(sp)
     2f0:	11612823          	sw	s6,272(sp)
     2f4:	11812423          	sw	s8,264(sp)
     2f8:	11912223          	sw	s9,260(sp)
     2fc:	0fb12e23          	sw	s11,252(sp)
     300:	12812423          	sw	s0,296(sp)
     304:	11512a23          	sw	s5,276(sp)
     308:	11712623          	sw	s7,268(sp)
     30c:	11a12023          	sw	s10,256(sp)
  printf("== 3x3 GEMM: SW vs CFU vs CFS ==\n");
     310:	289000ef          	jal	d98 <puts>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     314:	ffeb07b7          	lui	a5,0xffeb0
     318:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     31c:	0000f537          	lui	a0,0xf
     320:	db050513          	add	a0,a0,-592 # edb0 <__fini_array_end+0x54>
     324:	0e1000ef          	jal	c04 <printf>

  int8_t  A[N][N], B[N][N];
  int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     328:	020707b7          	lui	a5,0x2070
     32c:	60578793          	add	a5,a5,1541 # 2070605 <__neorv32_ram_size+0x1ff0605>
     330:	02f12623          	sw	a5,44(sp)
     334:	02ff07b7          	lui	a5,0x2ff0
     338:	60478793          	add	a5,a5,1540 # 2ff0604 <__neorv32_ram_size+0x2f70604>
     33c:	02f12823          	sw	a5,48(sp)
     340:	00500793          	li	a5,5
     344:	02f10a23          	sb	a5,52(sp)
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     348:	00f807b7          	lui	a5,0xf80
     34c:	3fe78793          	add	a5,a5,1022 # f803fe <__neorv32_ram_size+0xf003fe>
     350:	02f12c23          	sw	a5,56(sp)
     354:	050307b7          	lui	a5,0x5030
     358:	80478793          	add	a5,a5,-2044 # 502f804 <__neorv32_ram_size+0x4faf804>
     35c:	02f12e23          	sw	a5,60(sp)
     360:	ff800793          	li	a5,-8
     364:	04f10023          	sb	a5,64(sp)

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     368:	e7dff0ef          	jal	1e4 <rdcycle>
     36c:	00050993          	mv	s3,a0
     370:	00058b13          	mv	s6,a1
     374:	02c10d93          	add	s11,sp,44
     378:	e81ff0ef          	jal	1f8 <rdinstret>
     37c:	00050493          	mv	s1,a0
     380:	00058a13          	mv	s4,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     384:	04410913          	add	s2,sp,68
     388:	03510c13          	add	s8,sp,53
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     38c:	000d8c93          	mv	s9,s11
    int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s;
     390:	000c8783          	lb	a5,0(s9)
     394:	03810d13          	add	s10,sp,56
     398:	000d0a93          	mv	s5,s10
     39c:	00f12623          	sw	a5,12(sp)
     3a0:	001c8783          	lb	a5,1(s9)
     3a4:	00c90413          	add	s0,s2,12
     3a8:	00f12423          	sw	a5,8(sp)
     3ac:	002c8783          	lb	a5,2(s9)
     3b0:	00f12223          	sw	a5,4(sp)
     3b4:	00812583          	lw	a1,8(sp)
     3b8:	003a8503          	lb	a0,3(s5)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     3bc:	00490913          	add	s2,s2,4
     3c0:	001a8a93          	add	s5,s5,1
    int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s;
     3c4:	7a00e0ef          	jal	eb64 <__mulsi3>
     3c8:	00c12583          	lw	a1,12(sp)
     3cc:	00050b93          	mv	s7,a0
     3d0:	fffa8503          	lb	a0,-1(s5)
     3d4:	7900e0ef          	jal	eb64 <__mulsi3>
     3d8:	00ab8bb3          	add	s7,s7,a0
     3dc:	00412583          	lw	a1,4(sp)
     3e0:	005a8503          	lb	a0,5(s5)
     3e4:	7800e0ef          	jal	eb64 <__mulsi3>
     3e8:	01750533          	add	a0,a0,s7
     3ec:	fea92e23          	sw	a0,-4(s2)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     3f0:	fc8912e3          	bne	s2,s0,3b4 <main+0xe4>
     3f4:	003c8c93          	add	s9,s9,3
     3f8:	f98c9ce3          	bne	s9,s8,390 <main+0xc0>
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     3fc:	dfdff0ef          	jal	1f8 <rdinstret>
     400:	00050913          	mv	s2,a0
     404:	00058413          	mv	s0,a1
     408:	dddff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     40c:	413509b3          	sub	s3,a0,s3
     410:	41658ab3          	sub	s5,a1,s6
     414:	01353533          	sltu	a0,a0,s3
     418:	409904b3          	sub	s1,s2,s1
     41c:	40aa87b3          	sub	a5,s5,a0
     420:	41440433          	sub	s0,s0,s4
     424:	00993933          	sltu	s2,s2,s1
     428:	00f12223          	sw	a5,4(sp)
     42c:	412407b3          	sub	a5,s0,s2
     430:	00f12423          	sw	a5,8(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     434:	db1ff0ef          	jal	1e4 <rdcycle>
     438:	00050b93          	mv	s7,a0
     43c:	00058c93          	mv	s9,a1
     440:	db9ff0ef          	jal	1f8 <rdinstret>
     444:	06810793          	add	a5,sp,104
     448:	00050b13          	mv	s6,a0
     44c:	00058a13          	mv	s4,a1
     450:	000d8613          	mv	a2,s11
     454:	00078413          	mv	s0,a5
         (((uint32_t)(uint8_t)x1) << 8)  |
     458:	00164683          	lbu	a3,1(a2)
         (((uint32_t)(uint8_t)x2) << 16) |
     45c:	00264703          	lbu	a4,2(a2)
    C[i][j]=cfu_dp4a((int32_t)ap,(int32_t)bp);
     460:	000d0593          	mv	a1,s10
         (((uint32_t)(uint8_t)x1) << 8)  |
     464:	00869693          	sll	a3,a3,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     468:	01071713          	sll	a4,a4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     46c:	00e6e6b3          	or	a3,a3,a4
  return  ((uint32_t)(uint8_t)x0)        |
     470:	00064703          	lbu	a4,0(a2)
     474:	00c78813          	add	a6,a5,12
         (((uint32_t)(uint8_t)x1) << 8)  |
     478:	00e6e6b3          	or	a3,a3,a4
     47c:	0035c703          	lbu	a4,3(a1)
         (((uint32_t)(uint8_t)x2) << 16) |
     480:	0065c503          	lbu	a0,6(a1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     484:	00871713          	sll	a4,a4,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     488:	01051513          	sll	a0,a0,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     48c:	00a76733          	or	a4,a4,a0
  return  ((uint32_t)(uint8_t)x0)        |
     490:	0005c503          	lbu	a0,0(a1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     494:	00a76733          	or	a4,a4,a0
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     498:	02e6870b          	.insn	4, 0x02e6870b
    C[i][j]=cfu_dp4a((int32_t)ap,(int32_t)bp);
     49c:	00e7a023          	sw	a4,0(a5)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     4a0:	00478793          	add	a5,a5,4
     4a4:	00158593          	add	a1,a1,1
     4a8:	fd079ae3          	bne	a5,a6,47c <main+0x1ac>
     4ac:	00360613          	add	a2,a2,3
     4b0:	fb8614e3          	bne	a2,s8,458 <main+0x188>
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     4b4:	d45ff0ef          	jal	1f8 <rdinstret>
     4b8:	00050c13          	mv	s8,a0
     4bc:	00058a93          	mv	s5,a1
     4c0:	d25ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     4c4:	41750bb3          	sub	s7,a0,s7
     4c8:	41958cb3          	sub	s9,a1,s9
     4cc:	01753533          	sltu	a0,a0,s7
     4d0:	416c0b33          	sub	s6,s8,s6
     4d4:	40ac87b3          	sub	a5,s9,a0
     4d8:	414a8a33          	sub	s4,s5,s4
     4dc:	016c3c33          	sltu	s8,s8,s6
     4e0:	00f12623          	sw	a5,12(sp)
     4e4:	418a07b3          	sub	a5,s4,s8
     4e8:	00f12823          	sw	a5,16(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     4ec:	cf9ff0ef          	jal	1e4 <rdcycle>
     4f0:	00050a93          	mv	s5,a0
     4f4:	00058c93          	mv	s9,a1
     4f8:	d01ff0ef          	jal	1f8 <rdinstret>
     4fc:	80001737          	lui	a4,0x80001
     500:	00a12a23          	sw	a0,20(sp)
     504:	00b12c23          	sw	a1,24(sp)
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k)
     508:	93470093          	add	ra,a4,-1740 # 80000934 <A_flat.1>
     50c:	00000693          	li	a3,0
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     510:	93470713          	add	a4,a4,-1740
    A_flat[r*LDA+k] = (r<N && k<N)? A[r][k] : 0;
     514:	00300593          	li	a1,3
     518:	00200893          	li	a7,2
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k)
     51c:	08000513          	li	a0,128
     520:	00400813          	li	a6,4
     524:	00000793          	li	a5,0
    A_flat[r*LDA+k] = (r<N && k<N)? A[r][k] : 0;
     528:	00000613          	li	a2,0
     52c:	00b68863          	beq	a3,a1,53c <main+0x26c>
     530:	00f8c663          	blt	a7,a5,53c <main+0x26c>
     534:	00fd8633          	add	a2,s11,a5
     538:	00060603          	lb	a2,0(a2)
     53c:	00f70333          	add	t1,a4,a5
     540:	00c30023          	sb	a2,0(t1)
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k)
     544:	00178793          	add	a5,a5,1
     548:	fea790e3          	bne	a5,a0,528 <main+0x258>
     54c:	00168693          	add	a3,a3,1
     550:	08070713          	add	a4,a4,128
     554:	003d8d93          	add	s11,s11,3
     558:	fd0696e3          	bne	a3,a6,524 <main+0x254>
     55c:	80000737          	lui	a4,0x80000
     560:	73470513          	add	a0,a4,1844 # 80000734 <B_flat.0>
  for(int k=0;k<LDA;++k) for(int c=0;c<4;++c)
     564:	00000693          	li	a3,0
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k)
     568:	73470713          	add	a4,a4,1844
    B_flat[k*LDB+c] = (k<N && c<N)? B[k][c] : 0;
     56c:	00200593          	li	a1,2
  for(int k=0;k<LDA;++k) for(int c=0;c<4;++c)
     570:	00400813          	li	a6,4
    B_flat[k*LDB+c] = (k<N && c<N)? B[k][c] : 0;
     574:	00300313          	li	t1,3
  for(int k=0;k<LDA;++k) for(int c=0;c<4;++c)
     578:	08000893          	li	a7,128
     57c:	00000793          	li	a5,0
    B_flat[k*LDB+c] = (k<N && c<N)? B[k][c] : 0;
     580:	00000613          	li	a2,0
     584:	00d5c863          	blt	a1,a3,594 <main+0x2c4>
     588:	00678663          	beq	a5,t1,594 <main+0x2c4>
     58c:	00fd0633          	add	a2,s10,a5
     590:	00060603          	lb	a2,0(a2)
     594:	00f70e33          	add	t3,a4,a5
     598:	00ce0023          	sb	a2,0(t3)
  for(int k=0;k<LDA;++k) for(int c=0;c<4;++c)
     59c:	00178793          	add	a5,a5,1
     5a0:	ff0790e3          	bne	a5,a6,580 <main+0x2b0>
     5a4:	00168693          	add	a3,a3,1
     5a8:	00470713          	add	a4,a4,4
     5ac:	003d0d13          	add	s10,s10,3
     5b0:	fd1696e3          	bne	a3,a7,57c <main+0x2ac>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5b4:	ffeb07b7          	lui	a5,0xffeb0
     5b8:	00200713          	li	a4,2
     5bc:	ffeb03b7          	lui	t2,0xffeb0
     5c0:	ffeb02b7          	lui	t0,0xffeb0
     5c4:	ffeb0f37          	lui	t5,0xffeb0
     5c8:	ffeb0eb7          	lui	t4,0xffeb0
     5cc:	ffeb0e37          	lui	t3,0xffeb0
     5d0:	ffeb0337          	lui	t1,0xffeb0
     5d4:	ffeb08b7          	lui	a7,0xffeb0
     5d8:	ffeb0837          	lui	a6,0xffeb0
     5dc:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
      int k=s-i; int8_t a=(k>=0 && k<K)? A_flat[i*LDA+k] : 0; Aword[i]=(uint32_t)(uint8_t)a;
     5e0:	00200d13          	li	s10,2
  for (int s = 0; s < T; ++s) {
     5e4:	00000793          	li	a5,0
    for (int i=0;i<4;++i){
     5e8:	00400d93          	li	s11,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5ec:	00438393          	add	t2,t2,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     5f0:	00828293          	add	t0,t0,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     5f4:	00cf0f13          	add	t5,t5,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     5f8:	010e8e93          	add	t4,t4,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     5fc:	014e0e13          	add	t3,t3,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     600:	01830313          	add	t1,t1,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     604:	01c88893          	add	a7,a7,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     608:	02080813          	add	a6,a6,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
  for (int s = 0; s < T; ++s) {
     60c:	00900f93          	li	t6,9
    uint32_t Aword[4]={0}, Bword[4]={0};
     610:	08c10693          	add	a3,sp,140
     614:	08012623          	sw	zero,140(sp)
     618:	08012823          	sw	zero,144(sp)
     61c:	08012a23          	sw	zero,148(sp)
     620:	08012c23          	sw	zero,152(sp)
     624:	0a012823          	sw	zero,176(sp)
     628:	0a012a23          	sw	zero,180(sp)
     62c:	0a012c23          	sw	zero,184(sp)
     630:	0a012e23          	sw	zero,188(sp)
    for (int i=0;i<4;++i){
     634:	00f085b3          	add	a1,ra,a5
     638:	00000713          	li	a4,0
     63c:	00068a13          	mv	s4,a3
      int k=s-i; int8_t a=(k>=0 && k<K)? A_flat[i*LDA+k] : 0; Aword[i]=(uint32_t)(uint8_t)a;
     640:	40e78933          	sub	s2,a5,a4
     644:	00000613          	li	a2,0
     648:	012d6463          	bltu	s10,s2,650 <main+0x380>
     64c:	00058603          	lb	a2,0(a1)
     650:	0ff67613          	zext.b	a2,a2
     654:	00c6a023          	sw	a2,0(a3)
    for (int i=0;i<4;++i){
     658:	00170713          	add	a4,a4,1
     65c:	00468693          	add	a3,a3,4
     660:	07f58593          	add	a1,a1,127
     664:	fdb71ee3          	bne	a4,s11,640 <main+0x370>
     668:	0b010693          	add	a3,sp,176
     66c:	00050913          	mv	s2,a0
    for (int j=0;j<4;++j){
     670:	00000713          	li	a4,0
     674:	00068593          	mv	a1,a3
      int k=s-j; int8_t b=(k>=0 && k<K)? B_flat[k*LDB+j] : 0; Bword[j]=(uint32_t)(uint8_t)b;
     678:	40e78c33          	sub	s8,a5,a4
     67c:	00000613          	li	a2,0
     680:	018d6463          	bltu	s10,s8,688 <main+0x3b8>
     684:	00090603          	lb	a2,0(s2)
     688:	0ff67613          	zext.b	a2,a2
     68c:	00c6a023          	sw	a2,0(a3)
    for (int j=0;j<4;++j){
     690:	00170713          	add	a4,a4,1
     694:	00468693          	add	a3,a3,4
     698:	ffd90913          	add	s2,s2,-3
     69c:	fdb71ee3          	bne	a4,s11,678 <main+0x3a8>
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
     6a0:	08c12703          	lw	a4,140(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6a4:	00100693          	li	a3,1
  for (int s = 0; s < T; ++s) {
     6a8:	00178793          	add	a5,a5,1
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6ac:	00e3a023          	sw	a4,0(t2)
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
     6b0:	09012703          	lw	a4,144(sp)
  for (int s = 0; s < T; ++s) {
     6b4:	00450513          	add	a0,a0,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b8:	00e2a023          	sw	a4,0(t0)
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     6bc:	09412703          	lw	a4,148(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c0:	00ef2023          	sw	a4,0(t5)
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     6c4:	09812703          	lw	a4,152(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c8:	00eea023          	sw	a4,0(t4)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
     6cc:	0b012703          	lw	a4,176(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d0:	00ee2023          	sw	a4,0(t3)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
     6d4:	0b412703          	lw	a4,180(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d8:	00e32023          	sw	a4,0(t1)
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     6dc:	0b812703          	lw	a4,184(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e0:	00e8a023          	sw	a4,0(a7)
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     6e4:	0bc12703          	lw	a4,188(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e8:	00e82023          	sw	a4,0(a6)
     6ec:	ffeb0737          	lui	a4,0xffeb0
     6f0:	00d72023          	sw	a3,0(a4) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for (int s = 0; s < T; ++s) {
     6f4:	f1f79ee3          	bne	a5,t6,610 <main+0x340>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     6f8:	ffeb0637          	lui	a2,0xffeb0
     6fc:	00058513          	mv	a0,a1
  for (int s = 0; s < T; ++s) {
     700:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     704:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     708:	01000813          	li	a6,16
     70c:	00271693          	sll	a3,a4,0x2
     710:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     714:	00c686b3          	add	a3,a3,a2
     718:	00f688b3          	add	a7,a3,a5
     71c:	0008a303          	lw	t1,0(a7)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     720:	00f508b3          	add	a7,a0,a5
     724:	00478793          	add	a5,a5,4
     728:	0068a023          	sw	t1,0(a7)
     72c:	ff0796e3          	bne	a5,a6,718 <main+0x448>
     730:	00470713          	add	a4,a4,4
     734:	01050513          	add	a0,a0,16
     738:	fcf71ae3          	bne	a4,a5,70c <main+0x43c>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j) C[i][j]=C4[i][j];
     73c:	00c00613          	li	a2,12
     740:	000a0513          	mv	a0,s4
     744:	750000ef          	jal	e94 <memcpy>
     748:	00c00613          	li	a2,12
     74c:	0c010593          	add	a1,sp,192
     750:	09810513          	add	a0,sp,152
     754:	740000ef          	jal	e94 <memcpy>
     758:	00c00613          	li	a2,12
     75c:	0d010593          	add	a1,sp,208
     760:	0a410513          	add	a0,sp,164
     764:	730000ef          	jal	e94 <memcpy>
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     768:	a91ff0ef          	jal	1f8 <rdinstret>
     76c:	00050913          	mv	s2,a0
     770:	00b12e23          	sw	a1,28(sp)
     774:	a71ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     778:	01412783          	lw	a5,20(sp)
     77c:	01812703          	lw	a4,24(sp)
     780:	41550db3          	sub	s11,a0,s5
     784:	40f90d33          	sub	s10,s2,a5
     788:	01c12783          	lw	a5,28(sp)
     78c:	01b53533          	sltu	a0,a0,s11
     790:	41958c33          	sub	s8,a1,s9
     794:	40ac0c33          	sub	s8,s8,a0
     798:	01a93533          	sltu	a0,s2,s10
     79c:	40e78933          	sub	s2,a5,a4
     7a0:	40a90ab3          	sub	s5,s2,a0
     7a4:	00000793          	li	a5,0
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
     7a8:	02400613          	li	a2,36
     7ac:	04410693          	add	a3,sp,68
     7b0:	00f40733          	add	a4,s0,a5
     7b4:	00f686b3          	add	a3,a3,a5
     7b8:	0006a683          	lw	a3,0(a3)
     7bc:	00072703          	lw	a4,0(a4)
     7c0:	18e69863          	bne	a3,a4,950 <main+0x680>
     7c4:	00478793          	add	a5,a5,4
     7c8:	fec792e3          	bne	a5,a2,7ac <main+0x4dc>
     7cc:	00100413          	li	s0,1
     7d0:	00000793          	li	a5,0
     7d4:	02400613          	li	a2,36
     7d8:	04410693          	add	a3,sp,68
     7dc:	00fa0733          	add	a4,s4,a5
     7e0:	00f686b3          	add	a3,a3,a5
     7e4:	0006a683          	lw	a3,0(a3)
     7e8:	00072703          	lw	a4,0(a4)
     7ec:	16e69663          	bne	a3,a4,958 <main+0x688>
     7f0:	00478793          	add	a5,a5,4
     7f4:	fec792e3          	bne	a5,a2,7d8 <main+0x508>
     7f8:	00100913          	li	s2,1

  int ok1=cmp_NxN(&Csw[0][0], &Ccfu[0][0]);
  int ok2=cmp_NxN(&Csw[0][0], &Ccfs[0][0]);

  printf("\n3x3 timing summary\n");
     7fc:	0000f537          	lui	a0,0xf
     800:	dc450513          	add	a0,a0,-572 # edc4 <__fini_array_end+0x68>
     804:	594000ef          	jal	d98 <puts>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     808:	0000f537          	lui	a0,0xf
     80c:	dd850513          	add	a0,a0,-552 # edd8 <__fini_array_end+0x7c>
     810:	588000ef          	jal	d98 <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     814:	0000f537          	lui	a0,0xf
     818:	e1850513          	add	a0,a0,-488 # ee18 <__fini_array_end+0xbc>
     81c:	57c000ef          	jal	d98 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     820:	00812783          	lw	a5,8(sp)
     824:	00412683          	lw	a3,4(sp)
     828:	0000f537          	lui	a0,0xf
     82c:	00048713          	mv	a4,s1
     830:	00098613          	mv	a2,s3
     834:	e5850513          	add	a0,a0,-424 # ee58 <__fini_array_end+0xfc>
     838:	3cc000ef          	jal	c04 <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     83c:	01012783          	lw	a5,16(sp)
     840:	00c12683          	lw	a3,12(sp)
     844:	0000f537          	lui	a0,0xf
     848:	000b0713          	mv	a4,s6
     84c:	000b8613          	mv	a2,s7
     850:	e9050513          	add	a0,a0,-368 # ee90 <__fini_array_end+0x134>
     854:	3b0000ef          	jal	c04 <printf>
     858:	00c12683          	lw	a3,12(sp)
     85c:	00412583          	lw	a1,4(sp)
     860:	000b8613          	mv	a2,s7
     864:	00098513          	mv	a0,s3
     868:	9a5ff0ef          	jal	20c <print_speedup_fixed>
     86c:	0000fbb7          	lui	s7,0xf
     870:	eacb8513          	add	a0,s7,-340 # eeac <__fini_array_end+0x150>
     874:	390000ef          	jal	c04 <printf>
     878:	00812583          	lw	a1,8(sp)
     87c:	01012683          	lw	a3,16(sp)
     880:	000b0613          	mv	a2,s6
     884:	00048513          	mv	a0,s1
     888:	985ff0ef          	jal	20c <print_speedup_fixed>
     88c:	00a00513          	li	a0,10
     890:	3c4000ef          	jal	c54 <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     894:	0000f537          	lui	a0,0xf
     898:	000d0713          	mv	a4,s10
     89c:	000a8793          	mv	a5,s5
     8a0:	000d8613          	mv	a2,s11
     8a4:	000c0693          	mv	a3,s8
     8a8:	eb850513          	add	a0,a0,-328 # eeb8 <__fini_array_end+0x15c>
     8ac:	358000ef          	jal	c04 <printf>
     8b0:	00412583          	lw	a1,4(sp)
     8b4:	000d8613          	mv	a2,s11
     8b8:	000c0693          	mv	a3,s8
     8bc:	00098513          	mv	a0,s3
     8c0:	94dff0ef          	jal	20c <print_speedup_fixed>
     8c4:	eacb8513          	add	a0,s7,-340
     8c8:	33c000ef          	jal	c04 <printf>
     8cc:	00812583          	lw	a1,8(sp)
     8d0:	00048513          	mv	a0,s1
     8d4:	000d0613          	mv	a2,s10
     8d8:	000a8693          	mv	a3,s5
     8dc:	931ff0ef          	jal	20c <print_speedup_fixed>
     8e0:	00a00513          	li	a0,10
     8e4:	370000ef          	jal	c54 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     8e8:	06040c63          	beqz	s0,960 <main+0x690>
     8ec:	0000f5b7          	lui	a1,0xf
     8f0:	d7c58593          	add	a1,a1,-644 # ed7c <__fini_array_end+0x20>
     8f4:	06090c63          	beqz	s2,96c <main+0x69c>
     8f8:	0000f637          	lui	a2,0xf
     8fc:	d7c60613          	add	a2,a2,-644 # ed7c <__fini_array_end+0x20>
     900:	0000f537          	lui	a0,0xf
     904:	ed450513          	add	a0,a0,-300 # eed4 <__fini_array_end+0x178>
     908:	2fc000ef          	jal	c04 <printf>
  return (ok1 && ok2)?0:1;
     90c:	00897533          	and	a0,s2,s0
}
     910:	12c12083          	lw	ra,300(sp)
     914:	12812403          	lw	s0,296(sp)
     918:	12412483          	lw	s1,292(sp)
     91c:	12012903          	lw	s2,288(sp)
     920:	11c12983          	lw	s3,284(sp)
     924:	11812a03          	lw	s4,280(sp)
     928:	11412a83          	lw	s5,276(sp)
     92c:	11012b03          	lw	s6,272(sp)
     930:	10c12b83          	lw	s7,268(sp)
     934:	10812c03          	lw	s8,264(sp)
     938:	10412c83          	lw	s9,260(sp)
     93c:	10012d03          	lw	s10,256(sp)
     940:	0fc12d83          	lw	s11,252(sp)
     944:	00154513          	xor	a0,a0,1
     948:	13010113          	add	sp,sp,304
     94c:	00008067          	ret
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
     950:	00000413          	li	s0,0
     954:	e7dff06f          	j	7d0 <main+0x500>
     958:	00000913          	li	s2,0
     95c:	ea1ff06f          	j	7fc <main+0x52c>
  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     960:	0000f5b7          	lui	a1,0xf
     964:	d8458593          	add	a1,a1,-636 # ed84 <__fini_array_end+0x28>
     968:	f8dff06f          	j	8f4 <main+0x624>
     96c:	0000f637          	lui	a2,0xf
     970:	d8460613          	add	a2,a2,-636 # ed84 <__fini_array_end+0x28>
     974:	f8dff06f          	j	900 <main+0x630>

00000978 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     978:	fffff097          	auipc	ra,0xfffff
     97c:	7e008093          	add	ra,ra,2016 # 158 <__crt0_main_exit>
     980:	00050513          	mv	a0,a0
     984:	00008067          	ret

00000988 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     988:	fff00513          	li	a0,-1
     98c:	00008067          	ret

00000990 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     990:	000027b7          	lui	a5,0x2
     994:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     998:	00000513          	li	a0,0
     99c:	00008067          	ret

000009a0 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     9a0:	00100513          	li	a0,1
     9a4:	00008067          	ret

000009a8 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     9a8:	00100513          	li	a0,1
     9ac:	00008067          	ret

000009b0 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     9b0:	800007b7          	lui	a5,0x80000
     9b4:	01600713          	li	a4,22
     9b8:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     9bc:	fff00513          	li	a0,-1
     9c0:	00008067          	ret

000009c4 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     9c4:	00000513          	li	a0,0
     9c8:	00008067          	ret

000009cc <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     9cc:	fe010113          	add	sp,sp,-32
     9d0:	00912a23          	sw	s1,20(sp)
     9d4:	01212823          	sw	s2,16(sp)
     9d8:	00112e23          	sw	ra,28(sp)
     9dc:	00812c23          	sw	s0,24(sp)
     9e0:	01312623          	sw	s3,12(sp)
     9e4:	01412423          	sw	s4,8(sp)
     9e8:	00058913          	mv	s2,a1
     9ec:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     9f0:	06051463          	bnez	a0,a58 <_read+0x8c>
     9f4:	00050413          	mv	s0,a0
     9f8:	fff50537          	lui	a0,0xfff50
     9fc:	1a0000ef          	jal	b9c <neorv32_uart_available>
     a00:	04050c63          	beqz	a0,a58 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a04:	00a00993          	li	s3,10
     a08:	00d00a13          	li	s4,13
    while (len--) {
     a0c:	00941663          	bne	s0,s1,a18 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     a10:	00048413          	mv	s0,s1
     a14:	0200006f          	j	a34 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     a18:	fff50537          	lui	a0,0xfff50
     a1c:	1d0000ef          	jal	bec <neorv32_uart_getc>
      *ptr++ = c;
     a20:	008907b3          	add	a5,s2,s0
     a24:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     a28:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a2c:	01350463          	beq	a0,s3,a34 <_read+0x68>
     a30:	fd451ee3          	bne	a0,s4,a0c <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     a34:	01c12083          	lw	ra,28(sp)
     a38:	00040513          	mv	a0,s0
     a3c:	01812403          	lw	s0,24(sp)
     a40:	01412483          	lw	s1,20(sp)
     a44:	01012903          	lw	s2,16(sp)
     a48:	00c12983          	lw	s3,12(sp)
     a4c:	00812a03          	lw	s4,8(sp)
     a50:	02010113          	add	sp,sp,32
     a54:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a58:	fff60537          	lui	a0,0xfff60
     a5c:	140000ef          	jal	b9c <neorv32_uart_available>
  int read_cnt = 0;
     a60:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a64:	02050863          	beqz	a0,a94 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a68:	00a00993          	li	s3,10
     a6c:	00d00a13          	li	s4,13
    while (len--) {
     a70:	fa9400e3          	beq	s0,s1,a10 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     a74:	fff60537          	lui	a0,0xfff60
     a78:	174000ef          	jal	bec <neorv32_uart_getc>
      *ptr++ = c;
     a7c:	008907b3          	add	a5,s2,s0
     a80:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     a84:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a88:	fb3506e3          	beq	a0,s3,a34 <_read+0x68>
     a8c:	ff4512e3          	bne	a0,s4,a70 <_read+0xa4>
     a90:	fa5ff06f          	j	a34 <_read+0x68>
    errno = ENOSYS;
     a94:	800007b7          	lui	a5,0x80000
     a98:	05800713          	li	a4,88
     a9c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     aa0:	fff00413          	li	s0,-1
     aa4:	f91ff06f          	j	a34 <_read+0x68>

00000aa8 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     aa8:	ff010113          	add	sp,sp,-16
     aac:	00812423          	sw	s0,8(sp)
     ab0:	00912223          	sw	s1,4(sp)
     ab4:	00112623          	sw	ra,12(sp)
     ab8:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     abc:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     ac0:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     ac4:	00058413          	mv	s0,a1
     ac8:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     acc:	04a7ec63          	bltu	a5,a0,b24 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     ad0:	fff50537          	lui	a0,0xfff50
     ad4:	0c8000ef          	jal	b9c <neorv32_uart_available>
     ad8:	00940933          	add	s2,s0,s1
     adc:	02051463          	bnez	a0,b04 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     ae0:	800007b7          	lui	a5,0x80000
     ae4:	05800713          	li	a4,88
     ae8:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     aec:	fff00493          	li	s1,-1
     af0:	0180006f          	j	b08 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     af4:	00044583          	lbu	a1,0(s0)
     af8:	fff50537          	lui	a0,0xfff50
     afc:	00140413          	add	s0,s0,1
     b00:	0d8000ef          	jal	bd8 <neorv32_uart_putc>
      while (len--) {
     b04:	fe8918e3          	bne	s2,s0,af4 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     b08:	00c12083          	lw	ra,12(sp)
     b0c:	00812403          	lw	s0,8(sp)
     b10:	00012903          	lw	s2,0(sp)
     b14:	00048513          	mv	a0,s1
     b18:	00412483          	lw	s1,4(sp)
     b1c:	01010113          	add	sp,sp,16
     b20:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     b24:	fff60537          	lui	a0,0xfff60
     b28:	074000ef          	jal	b9c <neorv32_uart_available>
     b2c:	00940933          	add	s2,s0,s1
     b30:	fa0508e3          	beqz	a0,ae0 <_write+0x38>
    while (len--) {
     b34:	fd240ae3          	beq	s0,s2,b08 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     b38:	00044583          	lbu	a1,0(s0)
     b3c:	fff60537          	lui	a0,0xfff60
     b40:	00140413          	add	s0,s0,1
     b44:	094000ef          	jal	bd8 <neorv32_uart_putc>
      write_cnt++;
     b48:	fedff06f          	j	b34 <_write+0x8c>

00000b4c <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     b4c:	80000737          	lui	a4,0x80000
     b50:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     b54:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     b58:	00050793          	mv	a5,a0
     b5c:	c9460613          	add	a2,a2,-876 # 80000c94 <__crt0_bss_end>
  if (curr_heap == NULL) {
     b60:	00069463          	bnez	a3,b68 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     b64:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     b68:	800016b7          	lui	a3,0x80001
     b6c:	c9468693          	add	a3,a3,-876 # 80000c94 <__crt0_bss_end>
     b70:	00c69c63          	bne	a3,a2,b88 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     b74:	800007b7          	lui	a5,0x80000
     b78:	00c00713          	li	a4,12
     b7c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     b80:	fff00513          	li	a0,-1
     b84:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     b88:	71472503          	lw	a0,1812(a4)
     b8c:	00f507b3          	add	a5,a0,a5
     b90:	fed7f2e3          	bgeu	a5,a3,b74 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     b94:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     b98:	00008067          	ret

00000b9c <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     b9c:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     ba0:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     ba4:	00e51c63          	bne	a0,a4,bbc <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     ba8:	fffe07b7          	lui	a5,0xfffe0
     bac:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     bb0:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bb4:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     bb8:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     bbc:	fff60737          	lui	a4,0xfff60
    return 0;
     bc0:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     bc4:	fee79ae3          	bne	a5,a4,bb8 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bc8:	fffe07b7          	lui	a5,0xfffe0
     bcc:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     bd0:	020007b7          	lui	a5,0x2000
     bd4:	fe1ff06f          	j	bb4 <neorv32_uart_available+0x18>

00000bd8 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     bd8:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     bdc:	00a79713          	sll	a4,a5,0xa
     be0:	fe075ce3          	bgez	a4,bd8 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     be4:	00b52223          	sw	a1,4(a0)
}
     be8:	00008067          	ret

00000bec <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     bec:	00052783          	lw	a5,0(a0)
     bf0:	00f79713          	sll	a4,a5,0xf
     bf4:	fe075ce3          	bgez	a4,bec <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     bf8:	00452503          	lw	a0,4(a0)
}
     bfc:	0ff57513          	zext.b	a0,a0
     c00:	00008067          	ret

00000c04 <printf>:
     c04:	fc010113          	add	sp,sp,-64
     c08:	02c12423          	sw	a2,40(sp)
     c0c:	02d12623          	sw	a3,44(sp)
     c10:	80000317          	auipc	t1,0x80000
     c14:	af832303          	lw	t1,-1288(t1) # 80000708 <_impure_ptr>
     c18:	02b12223          	sw	a1,36(sp)
     c1c:	02e12823          	sw	a4,48(sp)
     c20:	02f12a23          	sw	a5,52(sp)
     c24:	03012c23          	sw	a6,56(sp)
     c28:	03112e23          	sw	a7,60(sp)
     c2c:	00832583          	lw	a1,8(t1)
     c30:	02410693          	add	a3,sp,36
     c34:	00050613          	mv	a2,a0
     c38:	00030513          	mv	a0,t1
     c3c:	00112e23          	sw	ra,28(sp)
     c40:	00d12623          	sw	a3,12(sp)
     c44:	0c8010ef          	jal	1d0c <_vfprintf_r>
     c48:	01c12083          	lw	ra,28(sp)
     c4c:	04010113          	add	sp,sp,64
     c50:	00008067          	ret

00000c54 <putchar>:
     c54:	80000797          	auipc	a5,0x80000
     c58:	ab47a783          	lw	a5,-1356(a5) # 80000708 <_impure_ptr>
     c5c:	0087a603          	lw	a2,8(a5)
     c60:	00050593          	mv	a1,a0
     c64:	00078513          	mv	a0,a5
     c68:	3c00606f          	j	7028 <_putc_r>

00000c6c <_puts_r>:
     c6c:	fd010113          	add	sp,sp,-48
     c70:	02812423          	sw	s0,40(sp)
     c74:	00050413          	mv	s0,a0
     c78:	00058513          	mv	a0,a1
     c7c:	02912223          	sw	s1,36(sp)
     c80:	02112623          	sw	ra,44(sp)
     c84:	00058493          	mv	s1,a1
     c88:	3b0000ef          	jal	1038 <strlen>
     c8c:	00150713          	add	a4,a0,1
     c90:	0000e697          	auipc	a3,0xe
     c94:	1fc68693          	add	a3,a3,508 # ee8c <__fini_array_end+0x130>
     c98:	00e12623          	sw	a4,12(sp)
     c9c:	03442783          	lw	a5,52(s0)
     ca0:	01010713          	add	a4,sp,16
     ca4:	00d12c23          	sw	a3,24(sp)
     ca8:	00e12223          	sw	a4,4(sp)
     cac:	00100693          	li	a3,1
     cb0:	00200713          	li	a4,2
     cb4:	00912823          	sw	s1,16(sp)
     cb8:	00a12a23          	sw	a0,20(sp)
     cbc:	00d12e23          	sw	a3,28(sp)
     cc0:	00e12423          	sw	a4,8(sp)
     cc4:	00842483          	lw	s1,8(s0)
     cc8:	0c078263          	beqz	a5,d8c <_puts_r+0x120>
     ccc:	0644a703          	lw	a4,100(s1)
     cd0:	00c49783          	lh	a5,12(s1)
     cd4:	00177713          	and	a4,a4,1
     cd8:	00071663          	bnez	a4,ce4 <_puts_r+0x78>
     cdc:	2007f713          	and	a4,a5,512
     ce0:	08070e63          	beqz	a4,d7c <_puts_r+0x110>
     ce4:	01279713          	sll	a4,a5,0x12
     ce8:	02074263          	bltz	a4,d0c <_puts_r+0xa0>
     cec:	0644a703          	lw	a4,100(s1)
     cf0:	ffffe6b7          	lui	a3,0xffffe
     cf4:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     cf8:	00002637          	lui	a2,0x2
     cfc:	00c7e7b3          	or	a5,a5,a2
     d00:	00d77733          	and	a4,a4,a3
     d04:	00f49623          	sh	a5,12(s1)
     d08:	06e4a223          	sw	a4,100(s1)
     d0c:	00040513          	mv	a0,s0
     d10:	00410613          	add	a2,sp,4
     d14:	00048593          	mv	a1,s1
     d18:	549050ef          	jal	6a60 <__sfvwrite_r>
     d1c:	0644a783          	lw	a5,100(s1)
     d20:	00153413          	seqz	s0,a0
     d24:	40800433          	neg	s0,s0
     d28:	00b47413          	and	s0,s0,11
     d2c:	0017f793          	and	a5,a5,1
     d30:	fff40413          	add	s0,s0,-1
     d34:	00079863          	bnez	a5,d44 <_puts_r+0xd8>
     d38:	00c4d783          	lhu	a5,12(s1)
     d3c:	2007f793          	and	a5,a5,512
     d40:	00078e63          	beqz	a5,d5c <_puts_r+0xf0>
     d44:	02c12083          	lw	ra,44(sp)
     d48:	00040513          	mv	a0,s0
     d4c:	02812403          	lw	s0,40(sp)
     d50:	02412483          	lw	s1,36(sp)
     d54:	03010113          	add	sp,sp,48
     d58:	00008067          	ret
     d5c:	0584a503          	lw	a0,88(s1)
     d60:	054000ef          	jal	db4 <__retarget_lock_release_recursive>
     d64:	02c12083          	lw	ra,44(sp)
     d68:	00040513          	mv	a0,s0
     d6c:	02812403          	lw	s0,40(sp)
     d70:	02412483          	lw	s1,36(sp)
     d74:	03010113          	add	sp,sp,48
     d78:	00008067          	ret
     d7c:	0584a503          	lw	a0,88(s1)
     d80:	030000ef          	jal	db0 <__retarget_lock_acquire_recursive>
     d84:	00c49783          	lh	a5,12(s1)
     d88:	f5dff06f          	j	ce4 <_puts_r+0x78>
     d8c:	00040513          	mv	a0,s0
     d90:	449050ef          	jal	69d8 <__sinit>
     d94:	f39ff06f          	j	ccc <_puts_r+0x60>

00000d98 <puts>:
     d98:	00050593          	mv	a1,a0
     d9c:	80000517          	auipc	a0,0x80000
     da0:	96c52503          	lw	a0,-1684(a0) # 80000708 <_impure_ptr>
     da4:	ec9ff06f          	j	c6c <_puts_r>

00000da8 <__retarget_lock_init_recursive>:
     da8:	00008067          	ret

00000dac <__retarget_lock_close_recursive>:
     dac:	00008067          	ret

00000db0 <__retarget_lock_acquire_recursive>:
     db0:	00008067          	ret

00000db4 <__retarget_lock_release_recursive>:
     db4:	00008067          	ret

00000db8 <memset>:
     db8:	00f00313          	li	t1,15
     dbc:	00050713          	mv	a4,a0
     dc0:	02c37e63          	bgeu	t1,a2,dfc <memset+0x44>
     dc4:	00f77793          	and	a5,a4,15
     dc8:	0a079063          	bnez	a5,e68 <memset+0xb0>
     dcc:	08059263          	bnez	a1,e50 <memset+0x98>
     dd0:	ff067693          	and	a3,a2,-16
     dd4:	00f67613          	and	a2,a2,15
     dd8:	00e686b3          	add	a3,a3,a4
     ddc:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     de0:	00b72223          	sw	a1,4(a4)
     de4:	00b72423          	sw	a1,8(a4)
     de8:	00b72623          	sw	a1,12(a4)
     dec:	01070713          	add	a4,a4,16
     df0:	fed766e3          	bltu	a4,a3,ddc <memset+0x24>
     df4:	00061463          	bnez	a2,dfc <memset+0x44>
     df8:	00008067          	ret
     dfc:	40c306b3          	sub	a3,t1,a2
     e00:	00269693          	sll	a3,a3,0x2
     e04:	00000297          	auipc	t0,0x0
     e08:	005686b3          	add	a3,a3,t0
     e0c:	00c68067          	jr	12(a3)
     e10:	00b70723          	sb	a1,14(a4)
     e14:	00b706a3          	sb	a1,13(a4)
     e18:	00b70623          	sb	a1,12(a4)
     e1c:	00b705a3          	sb	a1,11(a4)
     e20:	00b70523          	sb	a1,10(a4)
     e24:	00b704a3          	sb	a1,9(a4)
     e28:	00b70423          	sb	a1,8(a4)
     e2c:	00b703a3          	sb	a1,7(a4)
     e30:	00b70323          	sb	a1,6(a4)
     e34:	00b702a3          	sb	a1,5(a4)
     e38:	00b70223          	sb	a1,4(a4)
     e3c:	00b701a3          	sb	a1,3(a4)
     e40:	00b70123          	sb	a1,2(a4)
     e44:	00b700a3          	sb	a1,1(a4)
     e48:	00b70023          	sb	a1,0(a4)
     e4c:	00008067          	ret
     e50:	0ff5f593          	zext.b	a1,a1
     e54:	00859693          	sll	a3,a1,0x8
     e58:	00d5e5b3          	or	a1,a1,a3
     e5c:	01059693          	sll	a3,a1,0x10
     e60:	00d5e5b3          	or	a1,a1,a3
     e64:	f6dff06f          	j	dd0 <memset+0x18>
     e68:	00279693          	sll	a3,a5,0x2
     e6c:	00000297          	auipc	t0,0x0
     e70:	005686b3          	add	a3,a3,t0
     e74:	00008293          	mv	t0,ra
     e78:	fa0680e7          	jalr	-96(a3)
     e7c:	00028093          	mv	ra,t0
     e80:	ff078793          	add	a5,a5,-16
     e84:	40f70733          	sub	a4,a4,a5
     e88:	00f60633          	add	a2,a2,a5
     e8c:	f6c378e3          	bgeu	t1,a2,dfc <memset+0x44>
     e90:	f3dff06f          	j	dcc <memset+0x14>

00000e94 <memcpy>:
     e94:	00a5c7b3          	xor	a5,a1,a0
     e98:	0037f793          	and	a5,a5,3
     e9c:	00c508b3          	add	a7,a0,a2
     ea0:	06079463          	bnez	a5,f08 <memcpy+0x74>
     ea4:	00300793          	li	a5,3
     ea8:	06c7f063          	bgeu	a5,a2,f08 <memcpy+0x74>
     eac:	00357793          	and	a5,a0,3
     eb0:	00050713          	mv	a4,a0
     eb4:	06079a63          	bnez	a5,f28 <memcpy+0x94>
     eb8:	ffc8f613          	and	a2,a7,-4
     ebc:	40e606b3          	sub	a3,a2,a4
     ec0:	02000793          	li	a5,32
     ec4:	08d7ce63          	blt	a5,a3,f60 <memcpy+0xcc>
     ec8:	00058693          	mv	a3,a1
     ecc:	00070793          	mv	a5,a4
     ed0:	02c77863          	bgeu	a4,a2,f00 <memcpy+0x6c>
     ed4:	0006a803          	lw	a6,0(a3)
     ed8:	00478793          	add	a5,a5,4
     edc:	00468693          	add	a3,a3,4
     ee0:	ff07ae23          	sw	a6,-4(a5)
     ee4:	fec7e8e3          	bltu	a5,a2,ed4 <memcpy+0x40>
     ee8:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x2f3>
     eec:	40e787b3          	sub	a5,a5,a4
     ef0:	ffc7f793          	and	a5,a5,-4
     ef4:	00478793          	add	a5,a5,4
     ef8:	00f70733          	add	a4,a4,a5
     efc:	00f585b3          	add	a1,a1,a5
     f00:	01176863          	bltu	a4,a7,f10 <memcpy+0x7c>
     f04:	00008067          	ret
     f08:	00050713          	mv	a4,a0
     f0c:	05157863          	bgeu	a0,a7,f5c <memcpy+0xc8>
     f10:	0005c783          	lbu	a5,0(a1)
     f14:	00170713          	add	a4,a4,1
     f18:	00158593          	add	a1,a1,1
     f1c:	fef70fa3          	sb	a5,-1(a4)
     f20:	fee898e3          	bne	a7,a4,f10 <memcpy+0x7c>
     f24:	00008067          	ret
     f28:	0005c683          	lbu	a3,0(a1)
     f2c:	00170713          	add	a4,a4,1
     f30:	00377793          	and	a5,a4,3
     f34:	fed70fa3          	sb	a3,-1(a4)
     f38:	00158593          	add	a1,a1,1
     f3c:	f6078ee3          	beqz	a5,eb8 <memcpy+0x24>
     f40:	0005c683          	lbu	a3,0(a1)
     f44:	00170713          	add	a4,a4,1
     f48:	00377793          	and	a5,a4,3
     f4c:	fed70fa3          	sb	a3,-1(a4)
     f50:	00158593          	add	a1,a1,1
     f54:	fc079ae3          	bnez	a5,f28 <memcpy+0x94>
     f58:	f61ff06f          	j	eb8 <memcpy+0x24>
     f5c:	00008067          	ret
     f60:	ff010113          	add	sp,sp,-16
     f64:	00812623          	sw	s0,12(sp)
     f68:	02000413          	li	s0,32
     f6c:	0005a383          	lw	t2,0(a1)
     f70:	0045a283          	lw	t0,4(a1)
     f74:	0085af83          	lw	t6,8(a1)
     f78:	00c5af03          	lw	t5,12(a1)
     f7c:	0105ae83          	lw	t4,16(a1)
     f80:	0145ae03          	lw	t3,20(a1)
     f84:	0185a303          	lw	t1,24(a1)
     f88:	01c5a803          	lw	a6,28(a1)
     f8c:	0205a683          	lw	a3,32(a1)
     f90:	02470713          	add	a4,a4,36
     f94:	40e607b3          	sub	a5,a2,a4
     f98:	fc772e23          	sw	t2,-36(a4)
     f9c:	fe572023          	sw	t0,-32(a4)
     fa0:	fff72223          	sw	t6,-28(a4)
     fa4:	ffe72423          	sw	t5,-24(a4)
     fa8:	ffd72623          	sw	t4,-20(a4)
     fac:	ffc72823          	sw	t3,-16(a4)
     fb0:	fe672a23          	sw	t1,-12(a4)
     fb4:	ff072c23          	sw	a6,-8(a4)
     fb8:	fed72e23          	sw	a3,-4(a4)
     fbc:	02458593          	add	a1,a1,36
     fc0:	faf446e3          	blt	s0,a5,f6c <memcpy+0xd8>
     fc4:	00058693          	mv	a3,a1
     fc8:	00070793          	mv	a5,a4
     fcc:	02c77863          	bgeu	a4,a2,ffc <memcpy+0x168>
     fd0:	0006a803          	lw	a6,0(a3)
     fd4:	00478793          	add	a5,a5,4
     fd8:	00468693          	add	a3,a3,4
     fdc:	ff07ae23          	sw	a6,-4(a5)
     fe0:	fec7e8e3          	bltu	a5,a2,fd0 <memcpy+0x13c>
     fe4:	fff60793          	add	a5,a2,-1
     fe8:	40e787b3          	sub	a5,a5,a4
     fec:	ffc7f793          	and	a5,a5,-4
     ff0:	00478793          	add	a5,a5,4
     ff4:	00f70733          	add	a4,a4,a5
     ff8:	00f585b3          	add	a1,a1,a5
     ffc:	01176863          	bltu	a4,a7,100c <memcpy+0x178>
    1000:	00c12403          	lw	s0,12(sp)
    1004:	01010113          	add	sp,sp,16
    1008:	00008067          	ret
    100c:	0005c783          	lbu	a5,0(a1)
    1010:	00170713          	add	a4,a4,1
    1014:	00158593          	add	a1,a1,1
    1018:	fef70fa3          	sb	a5,-1(a4)
    101c:	fee882e3          	beq	a7,a4,1000 <memcpy+0x16c>
    1020:	0005c783          	lbu	a5,0(a1)
    1024:	00170713          	add	a4,a4,1
    1028:	00158593          	add	a1,a1,1
    102c:	fef70fa3          	sb	a5,-1(a4)
    1030:	fce89ee3          	bne	a7,a4,100c <memcpy+0x178>
    1034:	fcdff06f          	j	1000 <memcpy+0x16c>

00001038 <strlen>:
    1038:	00357793          	and	a5,a0,3
    103c:	00050713          	mv	a4,a0
    1040:	04079c63          	bnez	a5,1098 <strlen+0x60>
    1044:	7f7f86b7          	lui	a3,0x7f7f8
    1048:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    104c:	fff00593          	li	a1,-1
    1050:	00072603          	lw	a2,0(a4)
    1054:	00470713          	add	a4,a4,4
    1058:	00d677b3          	and	a5,a2,a3
    105c:	00d787b3          	add	a5,a5,a3
    1060:	00c7e7b3          	or	a5,a5,a2
    1064:	00d7e7b3          	or	a5,a5,a3
    1068:	feb784e3          	beq	a5,a1,1050 <strlen+0x18>
    106c:	ffc74683          	lbu	a3,-4(a4)
    1070:	40a707b3          	sub	a5,a4,a0
    1074:	04068463          	beqz	a3,10bc <strlen+0x84>
    1078:	ffd74683          	lbu	a3,-3(a4)
    107c:	02068c63          	beqz	a3,10b4 <strlen+0x7c>
    1080:	ffe74503          	lbu	a0,-2(a4)
    1084:	00a03533          	snez	a0,a0
    1088:	00f50533          	add	a0,a0,a5
    108c:	ffe50513          	add	a0,a0,-2
    1090:	00008067          	ret
    1094:	fa0688e3          	beqz	a3,1044 <strlen+0xc>
    1098:	00074783          	lbu	a5,0(a4)
    109c:	00170713          	add	a4,a4,1
    10a0:	00377693          	and	a3,a4,3
    10a4:	fe0798e3          	bnez	a5,1094 <strlen+0x5c>
    10a8:	40a70733          	sub	a4,a4,a0
    10ac:	fff70513          	add	a0,a4,-1
    10b0:	00008067          	ret
    10b4:	ffd78513          	add	a0,a5,-3
    10b8:	00008067          	ret
    10bc:	ffc78513          	add	a0,a5,-4
    10c0:	00008067          	ret

000010c4 <_malloc_trim_r>:
    10c4:	fe010113          	add	sp,sp,-32
    10c8:	00812c23          	sw	s0,24(sp)
    10cc:	00912a23          	sw	s1,20(sp)
    10d0:	01212823          	sw	s2,16(sp)
    10d4:	01312623          	sw	s3,12(sp)
    10d8:	01412423          	sw	s4,8(sp)
    10dc:	00058993          	mv	s3,a1
    10e0:	00112e23          	sw	ra,28(sp)
    10e4:	00050913          	mv	s2,a0
    10e8:	7ffffa17          	auipc	s4,0x7ffff
    10ec:	038a0a13          	add	s4,s4,56 # 80000120 <__malloc_av_>
    10f0:	405000ef          	jal	1cf4 <__malloc_lock>
    10f4:	008a2703          	lw	a4,8(s4)
    10f8:	000017b7          	lui	a5,0x1
    10fc:	fef78793          	add	a5,a5,-17 # fef <memcpy+0x15b>
    1100:	00472483          	lw	s1,4(a4)
    1104:	00001737          	lui	a4,0x1
    1108:	ffc4f493          	and	s1,s1,-4
    110c:	00f48433          	add	s0,s1,a5
    1110:	41340433          	sub	s0,s0,s3
    1114:	00c45413          	srl	s0,s0,0xc
    1118:	fff40413          	add	s0,s0,-1
    111c:	00c41413          	sll	s0,s0,0xc
    1120:	00e44e63          	blt	s0,a4,113c <_malloc_trim_r+0x78>
    1124:	00000593          	li	a1,0
    1128:	00090513          	mv	a0,s2
    112c:	105060ef          	jal	7a30 <_sbrk_r>
    1130:	008a2783          	lw	a5,8(s4)
    1134:	009787b3          	add	a5,a5,s1
    1138:	02f50863          	beq	a0,a5,1168 <_malloc_trim_r+0xa4>
    113c:	00090513          	mv	a0,s2
    1140:	3c1000ef          	jal	1d00 <__malloc_unlock>
    1144:	01c12083          	lw	ra,28(sp)
    1148:	01812403          	lw	s0,24(sp)
    114c:	01412483          	lw	s1,20(sp)
    1150:	01012903          	lw	s2,16(sp)
    1154:	00c12983          	lw	s3,12(sp)
    1158:	00812a03          	lw	s4,8(sp)
    115c:	00000513          	li	a0,0
    1160:	02010113          	add	sp,sp,32
    1164:	00008067          	ret
    1168:	408005b3          	neg	a1,s0
    116c:	00090513          	mv	a0,s2
    1170:	0c1060ef          	jal	7a30 <_sbrk_r>
    1174:	fff00793          	li	a5,-1
    1178:	04f50a63          	beq	a0,a5,11cc <_malloc_trim_r+0x108>
    117c:	80000717          	auipc	a4,0x80000
    1180:	9b870713          	add	a4,a4,-1608 # 80000b34 <__malloc_current_mallinfo>
    1184:	00072783          	lw	a5,0(a4)
    1188:	008a2683          	lw	a3,8(s4)
    118c:	408484b3          	sub	s1,s1,s0
    1190:	0014e493          	or	s1,s1,1
    1194:	408787b3          	sub	a5,a5,s0
    1198:	00090513          	mv	a0,s2
    119c:	0096a223          	sw	s1,4(a3)
    11a0:	00f72023          	sw	a5,0(a4)
    11a4:	35d000ef          	jal	1d00 <__malloc_unlock>
    11a8:	01c12083          	lw	ra,28(sp)
    11ac:	01812403          	lw	s0,24(sp)
    11b0:	01412483          	lw	s1,20(sp)
    11b4:	01012903          	lw	s2,16(sp)
    11b8:	00c12983          	lw	s3,12(sp)
    11bc:	00812a03          	lw	s4,8(sp)
    11c0:	00100513          	li	a0,1
    11c4:	02010113          	add	sp,sp,32
    11c8:	00008067          	ret
    11cc:	00000593          	li	a1,0
    11d0:	00090513          	mv	a0,s2
    11d4:	05d060ef          	jal	7a30 <_sbrk_r>
    11d8:	008a2703          	lw	a4,8(s4)
    11dc:	00f00693          	li	a3,15
    11e0:	40e507b3          	sub	a5,a0,a4
    11e4:	f4f6dce3          	bge	a3,a5,113c <_malloc_trim_r+0x78>
    11e8:	7ffff697          	auipc	a3,0x7ffff
    11ec:	5246a683          	lw	a3,1316(a3) # 8000070c <__malloc_sbrk_base>
    11f0:	40d50533          	sub	a0,a0,a3
    11f4:	0017e793          	or	a5,a5,1
    11f8:	80000697          	auipc	a3,0x80000
    11fc:	92a6ae23          	sw	a0,-1732(a3) # 80000b34 <__malloc_current_mallinfo>
    1200:	00f72223          	sw	a5,4(a4)
    1204:	f39ff06f          	j	113c <_malloc_trim_r+0x78>

00001208 <_free_r>:
    1208:	18058263          	beqz	a1,138c <_free_r+0x184>
    120c:	ff010113          	add	sp,sp,-16
    1210:	00812423          	sw	s0,8(sp)
    1214:	00912223          	sw	s1,4(sp)
    1218:	00058413          	mv	s0,a1
    121c:	00050493          	mv	s1,a0
    1220:	00112623          	sw	ra,12(sp)
    1224:	2d1000ef          	jal	1cf4 <__malloc_lock>
    1228:	ffc42583          	lw	a1,-4(s0)
    122c:	ff840713          	add	a4,s0,-8
    1230:	7ffff517          	auipc	a0,0x7ffff
    1234:	ef050513          	add	a0,a0,-272 # 80000120 <__malloc_av_>
    1238:	ffe5f793          	and	a5,a1,-2
    123c:	00f70633          	add	a2,a4,a5
    1240:	00462683          	lw	a3,4(a2)
    1244:	00852803          	lw	a6,8(a0)
    1248:	ffc6f693          	and	a3,a3,-4
    124c:	1ac80263          	beq	a6,a2,13f0 <_free_r+0x1e8>
    1250:	00d62223          	sw	a3,4(a2)
    1254:	0015f593          	and	a1,a1,1
    1258:	00d60833          	add	a6,a2,a3
    125c:	0a059063          	bnez	a1,12fc <_free_r+0xf4>
    1260:	ff842303          	lw	t1,-8(s0)
    1264:	00482583          	lw	a1,4(a6)
    1268:	7ffff897          	auipc	a7,0x7ffff
    126c:	ec088893          	add	a7,a7,-320 # 80000128 <__malloc_av_+0x8>
    1270:	40670733          	sub	a4,a4,t1
    1274:	00872803          	lw	a6,8(a4)
    1278:	006787b3          	add	a5,a5,t1
    127c:	0015f593          	and	a1,a1,1
    1280:	15180263          	beq	a6,a7,13c4 <_free_r+0x1bc>
    1284:	00c72303          	lw	t1,12(a4)
    1288:	00682623          	sw	t1,12(a6)
    128c:	01032423          	sw	a6,8(t1)
    1290:	1a058a63          	beqz	a1,1444 <_free_r+0x23c>
    1294:	0017e693          	or	a3,a5,1
    1298:	00d72223          	sw	a3,4(a4)
    129c:	00f62023          	sw	a5,0(a2)
    12a0:	1ff00693          	li	a3,511
    12a4:	06f6ec63          	bltu	a3,a5,131c <_free_r+0x114>
    12a8:	ff87f693          	and	a3,a5,-8
    12ac:	00868693          	add	a3,a3,8
    12b0:	00452583          	lw	a1,4(a0)
    12b4:	00d506b3          	add	a3,a0,a3
    12b8:	0006a603          	lw	a2,0(a3)
    12bc:	0057d813          	srl	a6,a5,0x5
    12c0:	00100793          	li	a5,1
    12c4:	010797b3          	sll	a5,a5,a6
    12c8:	00b7e7b3          	or	a5,a5,a1
    12cc:	ff868593          	add	a1,a3,-8
    12d0:	00b72623          	sw	a1,12(a4)
    12d4:	00c72423          	sw	a2,8(a4)
    12d8:	00f52223          	sw	a5,4(a0)
    12dc:	00e6a023          	sw	a4,0(a3)
    12e0:	00e62623          	sw	a4,12(a2)
    12e4:	00812403          	lw	s0,8(sp)
    12e8:	00c12083          	lw	ra,12(sp)
    12ec:	00048513          	mv	a0,s1
    12f0:	00412483          	lw	s1,4(sp)
    12f4:	01010113          	add	sp,sp,16
    12f8:	2090006f          	j	1d00 <__malloc_unlock>
    12fc:	00482583          	lw	a1,4(a6)
    1300:	0015f593          	and	a1,a1,1
    1304:	08058663          	beqz	a1,1390 <_free_r+0x188>
    1308:	0017e693          	or	a3,a5,1
    130c:	fed42e23          	sw	a3,-4(s0)
    1310:	00f62023          	sw	a5,0(a2)
    1314:	1ff00693          	li	a3,511
    1318:	f8f6f8e3          	bgeu	a3,a5,12a8 <_free_r+0xa0>
    131c:	0097d693          	srl	a3,a5,0x9
    1320:	00400613          	li	a2,4
    1324:	12d66463          	bltu	a2,a3,144c <_free_r+0x244>
    1328:	0067d693          	srl	a3,a5,0x6
    132c:	03968593          	add	a1,a3,57
    1330:	03868613          	add	a2,a3,56
    1334:	00359593          	sll	a1,a1,0x3
    1338:	00b505b3          	add	a1,a0,a1
    133c:	0005a683          	lw	a3,0(a1)
    1340:	ff858593          	add	a1,a1,-8
    1344:	00d59863          	bne	a1,a3,1354 <_free_r+0x14c>
    1348:	15c0006f          	j	14a4 <_free_r+0x29c>
    134c:	0086a683          	lw	a3,8(a3)
    1350:	00d58863          	beq	a1,a3,1360 <_free_r+0x158>
    1354:	0046a603          	lw	a2,4(a3)
    1358:	ffc67613          	and	a2,a2,-4
    135c:	fec7e8e3          	bltu	a5,a2,134c <_free_r+0x144>
    1360:	00c6a583          	lw	a1,12(a3)
    1364:	00b72623          	sw	a1,12(a4)
    1368:	00d72423          	sw	a3,8(a4)
    136c:	00812403          	lw	s0,8(sp)
    1370:	00c12083          	lw	ra,12(sp)
    1374:	00e5a423          	sw	a4,8(a1)
    1378:	00048513          	mv	a0,s1
    137c:	00412483          	lw	s1,4(sp)
    1380:	00e6a623          	sw	a4,12(a3)
    1384:	01010113          	add	sp,sp,16
    1388:	1790006f          	j	1d00 <__malloc_unlock>
    138c:	00008067          	ret
    1390:	00d787b3          	add	a5,a5,a3
    1394:	7ffff897          	auipc	a7,0x7ffff
    1398:	d9488893          	add	a7,a7,-620 # 80000128 <__malloc_av_+0x8>
    139c:	00862683          	lw	a3,8(a2)
    13a0:	0f168063          	beq	a3,a7,1480 <_free_r+0x278>
    13a4:	00c62803          	lw	a6,12(a2)
    13a8:	0017e593          	or	a1,a5,1
    13ac:	00f70633          	add	a2,a4,a5
    13b0:	0106a623          	sw	a6,12(a3)
    13b4:	00d82423          	sw	a3,8(a6)
    13b8:	00b72223          	sw	a1,4(a4)
    13bc:	00f62023          	sw	a5,0(a2)
    13c0:	ee1ff06f          	j	12a0 <_free_r+0x98>
    13c4:	14059063          	bnez	a1,1504 <_free_r+0x2fc>
    13c8:	00862583          	lw	a1,8(a2)
    13cc:	00c62603          	lw	a2,12(a2)
    13d0:	00f686b3          	add	a3,a3,a5
    13d4:	0016e793          	or	a5,a3,1
    13d8:	00c5a623          	sw	a2,12(a1)
    13dc:	00b62423          	sw	a1,8(a2)
    13e0:	00f72223          	sw	a5,4(a4)
    13e4:	00d70733          	add	a4,a4,a3
    13e8:	00d72023          	sw	a3,0(a4)
    13ec:	ef9ff06f          	j	12e4 <_free_r+0xdc>
    13f0:	0015f593          	and	a1,a1,1
    13f4:	00d786b3          	add	a3,a5,a3
    13f8:	02059063          	bnez	a1,1418 <_free_r+0x210>
    13fc:	ff842583          	lw	a1,-8(s0)
    1400:	40b70733          	sub	a4,a4,a1
    1404:	00c72783          	lw	a5,12(a4)
    1408:	00872603          	lw	a2,8(a4)
    140c:	00b686b3          	add	a3,a3,a1
    1410:	00f62623          	sw	a5,12(a2)
    1414:	00c7a423          	sw	a2,8(a5)
    1418:	0016e793          	or	a5,a3,1
    141c:	00f72223          	sw	a5,4(a4)
    1420:	00e52423          	sw	a4,8(a0)
    1424:	7ffff797          	auipc	a5,0x7ffff
    1428:	2ec7a783          	lw	a5,748(a5) # 80000710 <__malloc_trim_threshold>
    142c:	eaf6ece3          	bltu	a3,a5,12e4 <_free_r+0xdc>
    1430:	7ffff597          	auipc	a1,0x7ffff
    1434:	2fc5a583          	lw	a1,764(a1) # 8000072c <__malloc_top_pad>
    1438:	00048513          	mv	a0,s1
    143c:	c89ff0ef          	jal	10c4 <_malloc_trim_r>
    1440:	ea5ff06f          	j	12e4 <_free_r+0xdc>
    1444:	00d787b3          	add	a5,a5,a3
    1448:	f55ff06f          	j	139c <_free_r+0x194>
    144c:	01400613          	li	a2,20
    1450:	02d67063          	bgeu	a2,a3,1470 <_free_r+0x268>
    1454:	05400613          	li	a2,84
    1458:	06d66463          	bltu	a2,a3,14c0 <_free_r+0x2b8>
    145c:	00c7d693          	srl	a3,a5,0xc
    1460:	06f68593          	add	a1,a3,111
    1464:	06e68613          	add	a2,a3,110
    1468:	00359593          	sll	a1,a1,0x3
    146c:	ecdff06f          	j	1338 <_free_r+0x130>
    1470:	05c68593          	add	a1,a3,92
    1474:	05b68613          	add	a2,a3,91
    1478:	00359593          	sll	a1,a1,0x3
    147c:	ebdff06f          	j	1338 <_free_r+0x130>
    1480:	00e52a23          	sw	a4,20(a0)
    1484:	00e52823          	sw	a4,16(a0)
    1488:	0017e693          	or	a3,a5,1
    148c:	01172623          	sw	a7,12(a4)
    1490:	01172423          	sw	a7,8(a4)
    1494:	00d72223          	sw	a3,4(a4)
    1498:	00f70733          	add	a4,a4,a5
    149c:	00f72023          	sw	a5,0(a4)
    14a0:	e45ff06f          	j	12e4 <_free_r+0xdc>
    14a4:	00452803          	lw	a6,4(a0)
    14a8:	40265613          	sra	a2,a2,0x2
    14ac:	00100793          	li	a5,1
    14b0:	00c797b3          	sll	a5,a5,a2
    14b4:	0107e7b3          	or	a5,a5,a6
    14b8:	00f52223          	sw	a5,4(a0)
    14bc:	ea9ff06f          	j	1364 <_free_r+0x15c>
    14c0:	15400613          	li	a2,340
    14c4:	00d66c63          	bltu	a2,a3,14dc <_free_r+0x2d4>
    14c8:	00f7d693          	srl	a3,a5,0xf
    14cc:	07868593          	add	a1,a3,120
    14d0:	07768613          	add	a2,a3,119
    14d4:	00359593          	sll	a1,a1,0x3
    14d8:	e61ff06f          	j	1338 <_free_r+0x130>
    14dc:	55400613          	li	a2,1364
    14e0:	00d66c63          	bltu	a2,a3,14f8 <_free_r+0x2f0>
    14e4:	0127d693          	srl	a3,a5,0x12
    14e8:	07d68593          	add	a1,a3,125
    14ec:	07c68613          	add	a2,a3,124
    14f0:	00359593          	sll	a1,a1,0x3
    14f4:	e45ff06f          	j	1338 <_free_r+0x130>
    14f8:	3f800593          	li	a1,1016
    14fc:	07e00613          	li	a2,126
    1500:	e39ff06f          	j	1338 <_free_r+0x130>
    1504:	0017e693          	or	a3,a5,1
    1508:	00d72223          	sw	a3,4(a4)
    150c:	00f62023          	sw	a5,0(a2)
    1510:	dd5ff06f          	j	12e4 <_free_r+0xdc>

00001514 <_malloc_r>:
    1514:	fd010113          	add	sp,sp,-48
    1518:	03212023          	sw	s2,32(sp)
    151c:	02112623          	sw	ra,44(sp)
    1520:	02812423          	sw	s0,40(sp)
    1524:	02912223          	sw	s1,36(sp)
    1528:	01312e23          	sw	s3,28(sp)
    152c:	00b58793          	add	a5,a1,11
    1530:	01600713          	li	a4,22
    1534:	00050913          	mv	s2,a0
    1538:	08f76263          	bltu	a4,a5,15bc <_malloc_r+0xa8>
    153c:	01000793          	li	a5,16
    1540:	20b7e663          	bltu	a5,a1,174c <_malloc_r+0x238>
    1544:	7b0000ef          	jal	1cf4 <__malloc_lock>
    1548:	01800793          	li	a5,24
    154c:	00200593          	li	a1,2
    1550:	01000493          	li	s1,16
    1554:	7ffff997          	auipc	s3,0x7ffff
    1558:	bcc98993          	add	s3,s3,-1076 # 80000120 <__malloc_av_>
    155c:	00f987b3          	add	a5,s3,a5
    1560:	0047a403          	lw	s0,4(a5)
    1564:	ff878713          	add	a4,a5,-8
    1568:	36e40463          	beq	s0,a4,18d0 <_malloc_r+0x3bc>
    156c:	00442783          	lw	a5,4(s0)
    1570:	00c42683          	lw	a3,12(s0)
    1574:	00842603          	lw	a2,8(s0)
    1578:	ffc7f793          	and	a5,a5,-4
    157c:	00f407b3          	add	a5,s0,a5
    1580:	0047a703          	lw	a4,4(a5)
    1584:	00d62623          	sw	a3,12(a2)
    1588:	00c6a423          	sw	a2,8(a3)
    158c:	00176713          	or	a4,a4,1
    1590:	00090513          	mv	a0,s2
    1594:	00e7a223          	sw	a4,4(a5)
    1598:	768000ef          	jal	1d00 <__malloc_unlock>
    159c:	00840513          	add	a0,s0,8
    15a0:	02c12083          	lw	ra,44(sp)
    15a4:	02812403          	lw	s0,40(sp)
    15a8:	02412483          	lw	s1,36(sp)
    15ac:	02012903          	lw	s2,32(sp)
    15b0:	01c12983          	lw	s3,28(sp)
    15b4:	03010113          	add	sp,sp,48
    15b8:	00008067          	ret
    15bc:	ff87f493          	and	s1,a5,-8
    15c0:	1807c663          	bltz	a5,174c <_malloc_r+0x238>
    15c4:	18b4e463          	bltu	s1,a1,174c <_malloc_r+0x238>
    15c8:	72c000ef          	jal	1cf4 <__malloc_lock>
    15cc:	1f700793          	li	a5,503
    15d0:	4097fa63          	bgeu	a5,s1,19e4 <_malloc_r+0x4d0>
    15d4:	0094d793          	srl	a5,s1,0x9
    15d8:	18078263          	beqz	a5,175c <_malloc_r+0x248>
    15dc:	00400713          	li	a4,4
    15e0:	36f76063          	bltu	a4,a5,1940 <_malloc_r+0x42c>
    15e4:	0064d793          	srl	a5,s1,0x6
    15e8:	03978593          	add	a1,a5,57
    15ec:	03878813          	add	a6,a5,56
    15f0:	00359613          	sll	a2,a1,0x3
    15f4:	7ffff997          	auipc	s3,0x7ffff
    15f8:	b2c98993          	add	s3,s3,-1236 # 80000120 <__malloc_av_>
    15fc:	00c98633          	add	a2,s3,a2
    1600:	00462403          	lw	s0,4(a2)
    1604:	ff860613          	add	a2,a2,-8
    1608:	02860863          	beq	a2,s0,1638 <_malloc_r+0x124>
    160c:	00f00513          	li	a0,15
    1610:	0140006f          	j	1624 <_malloc_r+0x110>
    1614:	00c42683          	lw	a3,12(s0)
    1618:	2a075863          	bgez	a4,18c8 <_malloc_r+0x3b4>
    161c:	00d60e63          	beq	a2,a3,1638 <_malloc_r+0x124>
    1620:	00068413          	mv	s0,a3
    1624:	00442783          	lw	a5,4(s0)
    1628:	ffc7f793          	and	a5,a5,-4
    162c:	40978733          	sub	a4,a5,s1
    1630:	fee552e3          	bge	a0,a4,1614 <_malloc_r+0x100>
    1634:	00080593          	mv	a1,a6
    1638:	0109a403          	lw	s0,16(s3)
    163c:	7ffff897          	auipc	a7,0x7ffff
    1640:	aec88893          	add	a7,a7,-1300 # 80000128 <__malloc_av_+0x8>
    1644:	27140e63          	beq	s0,a7,18c0 <_malloc_r+0x3ac>
    1648:	00442783          	lw	a5,4(s0)
    164c:	00f00693          	li	a3,15
    1650:	ffc7f793          	and	a5,a5,-4
    1654:	40978733          	sub	a4,a5,s1
    1658:	38e6cc63          	blt	a3,a4,19f0 <_malloc_r+0x4dc>
    165c:	0119aa23          	sw	a7,20(s3)
    1660:	0119a823          	sw	a7,16(s3)
    1664:	36075063          	bgez	a4,19c4 <_malloc_r+0x4b0>
    1668:	1ff00713          	li	a4,511
    166c:	0049a503          	lw	a0,4(s3)
    1670:	26f76863          	bltu	a4,a5,18e0 <_malloc_r+0x3cc>
    1674:	ff87f713          	and	a4,a5,-8
    1678:	00870713          	add	a4,a4,8
    167c:	00e98733          	add	a4,s3,a4
    1680:	00072683          	lw	a3,0(a4)
    1684:	0057d613          	srl	a2,a5,0x5
    1688:	00100793          	li	a5,1
    168c:	00c797b3          	sll	a5,a5,a2
    1690:	00f56533          	or	a0,a0,a5
    1694:	ff870793          	add	a5,a4,-8
    1698:	00f42623          	sw	a5,12(s0)
    169c:	00d42423          	sw	a3,8(s0)
    16a0:	00a9a223          	sw	a0,4(s3)
    16a4:	00872023          	sw	s0,0(a4)
    16a8:	0086a623          	sw	s0,12(a3)
    16ac:	4025d793          	sra	a5,a1,0x2
    16b0:	00100613          	li	a2,1
    16b4:	00f61633          	sll	a2,a2,a5
    16b8:	0ac56a63          	bltu	a0,a2,176c <_malloc_r+0x258>
    16bc:	00a677b3          	and	a5,a2,a0
    16c0:	02079463          	bnez	a5,16e8 <_malloc_r+0x1d4>
    16c4:	00161613          	sll	a2,a2,0x1
    16c8:	ffc5f593          	and	a1,a1,-4
    16cc:	00a677b3          	and	a5,a2,a0
    16d0:	00458593          	add	a1,a1,4
    16d4:	00079a63          	bnez	a5,16e8 <_malloc_r+0x1d4>
    16d8:	00161613          	sll	a2,a2,0x1
    16dc:	00a677b3          	and	a5,a2,a0
    16e0:	00458593          	add	a1,a1,4
    16e4:	fe078ae3          	beqz	a5,16d8 <_malloc_r+0x1c4>
    16e8:	00f00813          	li	a6,15
    16ec:	00359313          	sll	t1,a1,0x3
    16f0:	00698333          	add	t1,s3,t1
    16f4:	00030513          	mv	a0,t1
    16f8:	00c52783          	lw	a5,12(a0)
    16fc:	00058e13          	mv	t3,a1
    1700:	26f50263          	beq	a0,a5,1964 <_malloc_r+0x450>
    1704:	0047a703          	lw	a4,4(a5)
    1708:	00078413          	mv	s0,a5
    170c:	00c7a783          	lw	a5,12(a5)
    1710:	ffc77713          	and	a4,a4,-4
    1714:	409706b3          	sub	a3,a4,s1
    1718:	26d84263          	blt	a6,a3,197c <_malloc_r+0x468>
    171c:	fe06c2e3          	bltz	a3,1700 <_malloc_r+0x1ec>
    1720:	00e40733          	add	a4,s0,a4
    1724:	00472683          	lw	a3,4(a4)
    1728:	00842603          	lw	a2,8(s0)
    172c:	00090513          	mv	a0,s2
    1730:	0016e693          	or	a3,a3,1
    1734:	00d72223          	sw	a3,4(a4)
    1738:	00f62623          	sw	a5,12(a2)
    173c:	00c7a423          	sw	a2,8(a5)
    1740:	5c0000ef          	jal	1d00 <__malloc_unlock>
    1744:	00840513          	add	a0,s0,8
    1748:	e59ff06f          	j	15a0 <_malloc_r+0x8c>
    174c:	00c00793          	li	a5,12
    1750:	00f92023          	sw	a5,0(s2)
    1754:	00000513          	li	a0,0
    1758:	e49ff06f          	j	15a0 <_malloc_r+0x8c>
    175c:	20000613          	li	a2,512
    1760:	04000593          	li	a1,64
    1764:	03f00813          	li	a6,63
    1768:	e8dff06f          	j	15f4 <_malloc_r+0xe0>
    176c:	0089a403          	lw	s0,8(s3)
    1770:	01612823          	sw	s6,16(sp)
    1774:	00442783          	lw	a5,4(s0)
    1778:	ffc7fb13          	and	s6,a5,-4
    177c:	009b6863          	bltu	s6,s1,178c <_malloc_r+0x278>
    1780:	409b0733          	sub	a4,s6,s1
    1784:	00f00793          	li	a5,15
    1788:	0ee7ca63          	blt	a5,a4,187c <_malloc_r+0x368>
    178c:	01912223          	sw	s9,4(sp)
    1790:	7ffffc97          	auipc	s9,0x7ffff
    1794:	f7cc8c93          	add	s9,s9,-132 # 8000070c <__malloc_sbrk_base>
    1798:	000ca703          	lw	a4,0(s9)
    179c:	01412c23          	sw	s4,24(sp)
    17a0:	01512a23          	sw	s5,20(sp)
    17a4:	01712623          	sw	s7,12(sp)
    17a8:	7ffffa97          	auipc	s5,0x7ffff
    17ac:	f84aaa83          	lw	s5,-124(s5) # 8000072c <__malloc_top_pad>
    17b0:	fff00793          	li	a5,-1
    17b4:	01640a33          	add	s4,s0,s6
    17b8:	01548ab3          	add	s5,s1,s5
    17bc:	3ef70263          	beq	a4,a5,1ba0 <_malloc_r+0x68c>
    17c0:	000017b7          	lui	a5,0x1
    17c4:	00f78793          	add	a5,a5,15 # 100f <memcpy+0x17b>
    17c8:	00fa8ab3          	add	s5,s5,a5
    17cc:	fffff7b7          	lui	a5,0xfffff
    17d0:	00fafab3          	and	s5,s5,a5
    17d4:	000a8593          	mv	a1,s5
    17d8:	00090513          	mv	a0,s2
    17dc:	254060ef          	jal	7a30 <_sbrk_r>
    17e0:	fff00793          	li	a5,-1
    17e4:	00050b93          	mv	s7,a0
    17e8:	46f50663          	beq	a0,a5,1c54 <_malloc_r+0x740>
    17ec:	01812423          	sw	s8,8(sp)
    17f0:	25456863          	bltu	a0,s4,1a40 <_malloc_r+0x52c>
    17f4:	7ffffc17          	auipc	s8,0x7ffff
    17f8:	340c0c13          	add	s8,s8,832 # 80000b34 <__malloc_current_mallinfo>
    17fc:	000c2583          	lw	a1,0(s8)
    1800:	00ba85b3          	add	a1,s5,a1
    1804:	00bc2023          	sw	a1,0(s8)
    1808:	00058713          	mv	a4,a1
    180c:	2caa1063          	bne	s4,a0,1acc <_malloc_r+0x5b8>
    1810:	01451793          	sll	a5,a0,0x14
    1814:	2a079c63          	bnez	a5,1acc <_malloc_r+0x5b8>
    1818:	0089ab83          	lw	s7,8(s3)
    181c:	015b07b3          	add	a5,s6,s5
    1820:	0017e793          	or	a5,a5,1
    1824:	00fba223          	sw	a5,4(s7)
    1828:	7ffff717          	auipc	a4,0x7ffff
    182c:	f0070713          	add	a4,a4,-256 # 80000728 <__malloc_max_sbrked_mem>
    1830:	00072683          	lw	a3,0(a4)
    1834:	00b6f463          	bgeu	a3,a1,183c <_malloc_r+0x328>
    1838:	00b72023          	sw	a1,0(a4)
    183c:	7ffff717          	auipc	a4,0x7ffff
    1840:	ee870713          	add	a4,a4,-280 # 80000724 <__malloc_max_total_mem>
    1844:	00072683          	lw	a3,0(a4)
    1848:	00b6f463          	bgeu	a3,a1,1850 <_malloc_r+0x33c>
    184c:	00b72023          	sw	a1,0(a4)
    1850:	00812c03          	lw	s8,8(sp)
    1854:	000b8413          	mv	s0,s7
    1858:	ffc7f793          	and	a5,a5,-4
    185c:	40978733          	sub	a4,a5,s1
    1860:	3897ec63          	bltu	a5,s1,1bf8 <_malloc_r+0x6e4>
    1864:	00f00793          	li	a5,15
    1868:	38e7d863          	bge	a5,a4,1bf8 <_malloc_r+0x6e4>
    186c:	01812a03          	lw	s4,24(sp)
    1870:	01412a83          	lw	s5,20(sp)
    1874:	00c12b83          	lw	s7,12(sp)
    1878:	00412c83          	lw	s9,4(sp)
    187c:	0014e793          	or	a5,s1,1
    1880:	00f42223          	sw	a5,4(s0)
    1884:	009404b3          	add	s1,s0,s1
    1888:	0099a423          	sw	s1,8(s3)
    188c:	00176713          	or	a4,a4,1
    1890:	00090513          	mv	a0,s2
    1894:	00e4a223          	sw	a4,4(s1)
    1898:	468000ef          	jal	1d00 <__malloc_unlock>
    189c:	02c12083          	lw	ra,44(sp)
    18a0:	00840513          	add	a0,s0,8
    18a4:	02812403          	lw	s0,40(sp)
    18a8:	01012b03          	lw	s6,16(sp)
    18ac:	02412483          	lw	s1,36(sp)
    18b0:	02012903          	lw	s2,32(sp)
    18b4:	01c12983          	lw	s3,28(sp)
    18b8:	03010113          	add	sp,sp,48
    18bc:	00008067          	ret
    18c0:	0049a503          	lw	a0,4(s3)
    18c4:	de9ff06f          	j	16ac <_malloc_r+0x198>
    18c8:	00842603          	lw	a2,8(s0)
    18cc:	cb1ff06f          	j	157c <_malloc_r+0x68>
    18d0:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    18d4:	00258593          	add	a1,a1,2
    18d8:	d68780e3          	beq	a5,s0,1638 <_malloc_r+0x124>
    18dc:	c91ff06f          	j	156c <_malloc_r+0x58>
    18e0:	0097d713          	srl	a4,a5,0x9
    18e4:	00400693          	li	a3,4
    18e8:	14e6f263          	bgeu	a3,a4,1a2c <_malloc_r+0x518>
    18ec:	01400693          	li	a3,20
    18f0:	32e6e663          	bltu	a3,a4,1c1c <_malloc_r+0x708>
    18f4:	05c70613          	add	a2,a4,92
    18f8:	05b70693          	add	a3,a4,91
    18fc:	00361613          	sll	a2,a2,0x3
    1900:	00c98633          	add	a2,s3,a2
    1904:	00062703          	lw	a4,0(a2)
    1908:	ff860613          	add	a2,a2,-8
    190c:	00e61863          	bne	a2,a4,191c <_malloc_r+0x408>
    1910:	2980006f          	j	1ba8 <_malloc_r+0x694>
    1914:	00872703          	lw	a4,8(a4)
    1918:	00e60863          	beq	a2,a4,1928 <_malloc_r+0x414>
    191c:	00472683          	lw	a3,4(a4)
    1920:	ffc6f693          	and	a3,a3,-4
    1924:	fed7e8e3          	bltu	a5,a3,1914 <_malloc_r+0x400>
    1928:	00c72603          	lw	a2,12(a4)
    192c:	00c42623          	sw	a2,12(s0)
    1930:	00e42423          	sw	a4,8(s0)
    1934:	00862423          	sw	s0,8(a2)
    1938:	00872623          	sw	s0,12(a4)
    193c:	d71ff06f          	j	16ac <_malloc_r+0x198>
    1940:	01400713          	li	a4,20
    1944:	10f77863          	bgeu	a4,a5,1a54 <_malloc_r+0x540>
    1948:	05400713          	li	a4,84
    194c:	2ef76663          	bltu	a4,a5,1c38 <_malloc_r+0x724>
    1950:	00c4d793          	srl	a5,s1,0xc
    1954:	06f78593          	add	a1,a5,111
    1958:	06e78813          	add	a6,a5,110
    195c:	00359613          	sll	a2,a1,0x3
    1960:	c95ff06f          	j	15f4 <_malloc_r+0xe0>
    1964:	001e0e13          	add	t3,t3,1
    1968:	003e7793          	and	a5,t3,3
    196c:	00850513          	add	a0,a0,8
    1970:	10078063          	beqz	a5,1a70 <_malloc_r+0x55c>
    1974:	00c52783          	lw	a5,12(a0)
    1978:	d89ff06f          	j	1700 <_malloc_r+0x1ec>
    197c:	00842603          	lw	a2,8(s0)
    1980:	0014e593          	or	a1,s1,1
    1984:	00b42223          	sw	a1,4(s0)
    1988:	00f62623          	sw	a5,12(a2)
    198c:	00c7a423          	sw	a2,8(a5)
    1990:	009404b3          	add	s1,s0,s1
    1994:	0099aa23          	sw	s1,20(s3)
    1998:	0099a823          	sw	s1,16(s3)
    199c:	0016e793          	or	a5,a3,1
    19a0:	0114a623          	sw	a7,12(s1)
    19a4:	0114a423          	sw	a7,8(s1)
    19a8:	00f4a223          	sw	a5,4(s1)
    19ac:	00e40733          	add	a4,s0,a4
    19b0:	00090513          	mv	a0,s2
    19b4:	00d72023          	sw	a3,0(a4)
    19b8:	348000ef          	jal	1d00 <__malloc_unlock>
    19bc:	00840513          	add	a0,s0,8
    19c0:	be1ff06f          	j	15a0 <_malloc_r+0x8c>
    19c4:	00f407b3          	add	a5,s0,a5
    19c8:	0047a703          	lw	a4,4(a5)
    19cc:	00090513          	mv	a0,s2
    19d0:	00176713          	or	a4,a4,1
    19d4:	00e7a223          	sw	a4,4(a5)
    19d8:	328000ef          	jal	1d00 <__malloc_unlock>
    19dc:	00840513          	add	a0,s0,8
    19e0:	bc1ff06f          	j	15a0 <_malloc_r+0x8c>
    19e4:	0034d593          	srl	a1,s1,0x3
    19e8:	00848793          	add	a5,s1,8
    19ec:	b69ff06f          	j	1554 <_malloc_r+0x40>
    19f0:	0014e693          	or	a3,s1,1
    19f4:	00d42223          	sw	a3,4(s0)
    19f8:	009404b3          	add	s1,s0,s1
    19fc:	0099aa23          	sw	s1,20(s3)
    1a00:	0099a823          	sw	s1,16(s3)
    1a04:	00176693          	or	a3,a4,1
    1a08:	0114a623          	sw	a7,12(s1)
    1a0c:	0114a423          	sw	a7,8(s1)
    1a10:	00d4a223          	sw	a3,4(s1)
    1a14:	00f407b3          	add	a5,s0,a5
    1a18:	00090513          	mv	a0,s2
    1a1c:	00e7a023          	sw	a4,0(a5)
    1a20:	2e0000ef          	jal	1d00 <__malloc_unlock>
    1a24:	00840513          	add	a0,s0,8
    1a28:	b79ff06f          	j	15a0 <_malloc_r+0x8c>
    1a2c:	0067d713          	srl	a4,a5,0x6
    1a30:	03970613          	add	a2,a4,57
    1a34:	03870693          	add	a3,a4,56
    1a38:	00361613          	sll	a2,a2,0x3
    1a3c:	ec5ff06f          	j	1900 <_malloc_r+0x3ec>
    1a40:	07340c63          	beq	s0,s3,1ab8 <_malloc_r+0x5a4>
    1a44:	0089a403          	lw	s0,8(s3)
    1a48:	00812c03          	lw	s8,8(sp)
    1a4c:	00442783          	lw	a5,4(s0)
    1a50:	e09ff06f          	j	1858 <_malloc_r+0x344>
    1a54:	05c78593          	add	a1,a5,92
    1a58:	05b78813          	add	a6,a5,91
    1a5c:	00359613          	sll	a2,a1,0x3
    1a60:	b95ff06f          	j	15f4 <_malloc_r+0xe0>
    1a64:	00832783          	lw	a5,8(t1)
    1a68:	fff58593          	add	a1,a1,-1
    1a6c:	28679063          	bne	a5,t1,1cec <_malloc_r+0x7d8>
    1a70:	0035f793          	and	a5,a1,3
    1a74:	ff830313          	add	t1,t1,-8
    1a78:	fe0796e3          	bnez	a5,1a64 <_malloc_r+0x550>
    1a7c:	0049a703          	lw	a4,4(s3)
    1a80:	fff64793          	not	a5,a2
    1a84:	00e7f7b3          	and	a5,a5,a4
    1a88:	00f9a223          	sw	a5,4(s3)
    1a8c:	00161613          	sll	a2,a2,0x1
    1a90:	ccc7eee3          	bltu	a5,a2,176c <_malloc_r+0x258>
    1a94:	cc060ce3          	beqz	a2,176c <_malloc_r+0x258>
    1a98:	00f67733          	and	a4,a2,a5
    1a9c:	00071a63          	bnez	a4,1ab0 <_malloc_r+0x59c>
    1aa0:	00161613          	sll	a2,a2,0x1
    1aa4:	00f67733          	and	a4,a2,a5
    1aa8:	004e0e13          	add	t3,t3,4
    1aac:	fe070ae3          	beqz	a4,1aa0 <_malloc_r+0x58c>
    1ab0:	000e0593          	mv	a1,t3
    1ab4:	c39ff06f          	j	16ec <_malloc_r+0x1d8>
    1ab8:	7ffffc17          	auipc	s8,0x7ffff
    1abc:	07cc0c13          	add	s8,s8,124 # 80000b34 <__malloc_current_mallinfo>
    1ac0:	000c2703          	lw	a4,0(s8)
    1ac4:	00ea8733          	add	a4,s5,a4
    1ac8:	00ec2023          	sw	a4,0(s8)
    1acc:	000ca683          	lw	a3,0(s9)
    1ad0:	fff00793          	li	a5,-1
    1ad4:	18f68663          	beq	a3,a5,1c60 <_malloc_r+0x74c>
    1ad8:	414b87b3          	sub	a5,s7,s4
    1adc:	00e787b3          	add	a5,a5,a4
    1ae0:	00fc2023          	sw	a5,0(s8)
    1ae4:	007bfc93          	and	s9,s7,7
    1ae8:	0c0c8c63          	beqz	s9,1bc0 <_malloc_r+0x6ac>
    1aec:	419b8bb3          	sub	s7,s7,s9
    1af0:	000017b7          	lui	a5,0x1
    1af4:	00878793          	add	a5,a5,8 # 1008 <memcpy+0x174>
    1af8:	008b8b93          	add	s7,s7,8
    1afc:	419785b3          	sub	a1,a5,s9
    1b00:	015b8ab3          	add	s5,s7,s5
    1b04:	415585b3          	sub	a1,a1,s5
    1b08:	01459593          	sll	a1,a1,0x14
    1b0c:	0145da13          	srl	s4,a1,0x14
    1b10:	000a0593          	mv	a1,s4
    1b14:	00090513          	mv	a0,s2
    1b18:	719050ef          	jal	7a30 <_sbrk_r>
    1b1c:	fff00793          	li	a5,-1
    1b20:	18f50063          	beq	a0,a5,1ca0 <_malloc_r+0x78c>
    1b24:	41750533          	sub	a0,a0,s7
    1b28:	01450ab3          	add	s5,a0,s4
    1b2c:	000c2703          	lw	a4,0(s8)
    1b30:	0179a423          	sw	s7,8(s3)
    1b34:	001ae793          	or	a5,s5,1
    1b38:	00ea05b3          	add	a1,s4,a4
    1b3c:	00bc2023          	sw	a1,0(s8)
    1b40:	00fba223          	sw	a5,4(s7)
    1b44:	cf3402e3          	beq	s0,s3,1828 <_malloc_r+0x314>
    1b48:	00f00693          	li	a3,15
    1b4c:	0b66f063          	bgeu	a3,s6,1bec <_malloc_r+0x6d8>
    1b50:	00442703          	lw	a4,4(s0)
    1b54:	ff4b0793          	add	a5,s6,-12
    1b58:	ff87f793          	and	a5,a5,-8
    1b5c:	00177713          	and	a4,a4,1
    1b60:	00f76733          	or	a4,a4,a5
    1b64:	00e42223          	sw	a4,4(s0)
    1b68:	00500613          	li	a2,5
    1b6c:	00f40733          	add	a4,s0,a5
    1b70:	00c72223          	sw	a2,4(a4)
    1b74:	00c72423          	sw	a2,8(a4)
    1b78:	00f6e663          	bltu	a3,a5,1b84 <_malloc_r+0x670>
    1b7c:	004ba783          	lw	a5,4(s7)
    1b80:	ca9ff06f          	j	1828 <_malloc_r+0x314>
    1b84:	00840593          	add	a1,s0,8
    1b88:	00090513          	mv	a0,s2
    1b8c:	e7cff0ef          	jal	1208 <_free_r>
    1b90:	0089ab83          	lw	s7,8(s3)
    1b94:	000c2583          	lw	a1,0(s8)
    1b98:	004ba783          	lw	a5,4(s7)
    1b9c:	c8dff06f          	j	1828 <_malloc_r+0x314>
    1ba0:	010a8a93          	add	s5,s5,16
    1ba4:	c31ff06f          	j	17d4 <_malloc_r+0x2c0>
    1ba8:	4026d693          	sra	a3,a3,0x2
    1bac:	00100793          	li	a5,1
    1bb0:	00d797b3          	sll	a5,a5,a3
    1bb4:	00f56533          	or	a0,a0,a5
    1bb8:	00a9a223          	sw	a0,4(s3)
    1bbc:	d71ff06f          	j	192c <_malloc_r+0x418>
    1bc0:	015b85b3          	add	a1,s7,s5
    1bc4:	40b005b3          	neg	a1,a1
    1bc8:	01459593          	sll	a1,a1,0x14
    1bcc:	0145da13          	srl	s4,a1,0x14
    1bd0:	000a0593          	mv	a1,s4
    1bd4:	00090513          	mv	a0,s2
    1bd8:	659050ef          	jal	7a30 <_sbrk_r>
    1bdc:	fff00793          	li	a5,-1
    1be0:	f4f512e3          	bne	a0,a5,1b24 <_malloc_r+0x610>
    1be4:	00000a13          	li	s4,0
    1be8:	f45ff06f          	j	1b2c <_malloc_r+0x618>
    1bec:	00812c03          	lw	s8,8(sp)
    1bf0:	00100793          	li	a5,1
    1bf4:	00fba223          	sw	a5,4(s7)
    1bf8:	00090513          	mv	a0,s2
    1bfc:	104000ef          	jal	1d00 <__malloc_unlock>
    1c00:	00000513          	li	a0,0
    1c04:	01812a03          	lw	s4,24(sp)
    1c08:	01412a83          	lw	s5,20(sp)
    1c0c:	01012b03          	lw	s6,16(sp)
    1c10:	00c12b83          	lw	s7,12(sp)
    1c14:	00412c83          	lw	s9,4(sp)
    1c18:	989ff06f          	j	15a0 <_malloc_r+0x8c>
    1c1c:	05400693          	li	a3,84
    1c20:	04e6e463          	bltu	a3,a4,1c68 <_malloc_r+0x754>
    1c24:	00c7d713          	srl	a4,a5,0xc
    1c28:	06f70613          	add	a2,a4,111
    1c2c:	06e70693          	add	a3,a4,110
    1c30:	00361613          	sll	a2,a2,0x3
    1c34:	ccdff06f          	j	1900 <_malloc_r+0x3ec>
    1c38:	15400713          	li	a4,340
    1c3c:	04f76463          	bltu	a4,a5,1c84 <_malloc_r+0x770>
    1c40:	00f4d793          	srl	a5,s1,0xf
    1c44:	07878593          	add	a1,a5,120
    1c48:	07778813          	add	a6,a5,119
    1c4c:	00359613          	sll	a2,a1,0x3
    1c50:	9a5ff06f          	j	15f4 <_malloc_r+0xe0>
    1c54:	0089a403          	lw	s0,8(s3)
    1c58:	00442783          	lw	a5,4(s0)
    1c5c:	bfdff06f          	j	1858 <_malloc_r+0x344>
    1c60:	017ca023          	sw	s7,0(s9)
    1c64:	e81ff06f          	j	1ae4 <_malloc_r+0x5d0>
    1c68:	15400693          	li	a3,340
    1c6c:	04e6e463          	bltu	a3,a4,1cb4 <_malloc_r+0x7a0>
    1c70:	00f7d713          	srl	a4,a5,0xf
    1c74:	07870613          	add	a2,a4,120
    1c78:	07770693          	add	a3,a4,119
    1c7c:	00361613          	sll	a2,a2,0x3
    1c80:	c81ff06f          	j	1900 <_malloc_r+0x3ec>
    1c84:	55400713          	li	a4,1364
    1c88:	04f76463          	bltu	a4,a5,1cd0 <_malloc_r+0x7bc>
    1c8c:	0124d793          	srl	a5,s1,0x12
    1c90:	07d78593          	add	a1,a5,125
    1c94:	07c78813          	add	a6,a5,124
    1c98:	00359613          	sll	a2,a1,0x3
    1c9c:	959ff06f          	j	15f4 <_malloc_r+0xe0>
    1ca0:	ff8c8c93          	add	s9,s9,-8
    1ca4:	019a8ab3          	add	s5,s5,s9
    1ca8:	417a8ab3          	sub	s5,s5,s7
    1cac:	00000a13          	li	s4,0
    1cb0:	e7dff06f          	j	1b2c <_malloc_r+0x618>
    1cb4:	55400693          	li	a3,1364
    1cb8:	02e6e463          	bltu	a3,a4,1ce0 <_malloc_r+0x7cc>
    1cbc:	0127d713          	srl	a4,a5,0x12
    1cc0:	07d70613          	add	a2,a4,125
    1cc4:	07c70693          	add	a3,a4,124
    1cc8:	00361613          	sll	a2,a2,0x3
    1ccc:	c35ff06f          	j	1900 <_malloc_r+0x3ec>
    1cd0:	3f800613          	li	a2,1016
    1cd4:	07f00593          	li	a1,127
    1cd8:	07e00813          	li	a6,126
    1cdc:	919ff06f          	j	15f4 <_malloc_r+0xe0>
    1ce0:	3f800613          	li	a2,1016
    1ce4:	07e00693          	li	a3,126
    1ce8:	c19ff06f          	j	1900 <_malloc_r+0x3ec>
    1cec:	0049a783          	lw	a5,4(s3)
    1cf0:	d9dff06f          	j	1a8c <_malloc_r+0x578>

00001cf4 <__malloc_lock>:
    1cf4:	7ffff517          	auipc	a0,0x7ffff
    1cf8:	a2850513          	add	a0,a0,-1496 # 8000071c <__lock___malloc_recursive_mutex>
    1cfc:	8b4ff06f          	j	db0 <__retarget_lock_acquire_recursive>

00001d00 <__malloc_unlock>:
    1d00:	7ffff517          	auipc	a0,0x7ffff
    1d04:	a1c50513          	add	a0,a0,-1508 # 8000071c <__lock___malloc_recursive_mutex>
    1d08:	8acff06f          	j	db4 <__retarget_lock_release_recursive>

00001d0c <_vfprintf_r>:
    1d0c:	e7010113          	add	sp,sp,-400
    1d10:	18112623          	sw	ra,396(sp)
    1d14:	00b12423          	sw	a1,8(sp)
    1d18:	00c12623          	sw	a2,12(sp)
    1d1c:	00d12a23          	sw	a3,20(sp)
    1d20:	17312e23          	sw	s3,380(sp)
    1d24:	18812423          	sw	s0,392(sp)
    1d28:	00050993          	mv	s3,a0
    1d2c:	3d9050ef          	jal	7904 <_localeconv_r>
    1d30:	00052783          	lw	a5,0(a0)
    1d34:	00078513          	mv	a0,a5
    1d38:	02f12a23          	sw	a5,52(sp)
    1d3c:	afcff0ef          	jal	1038 <strlen>
    1d40:	00050713          	mv	a4,a0
    1d44:	00800613          	li	a2,8
    1d48:	00000593          	li	a1,0
    1d4c:	09010513          	add	a0,sp,144
    1d50:	02e12823          	sw	a4,48(sp)
    1d54:	864ff0ef          	jal	db8 <memset>
    1d58:	00c12783          	lw	a5,12(sp)
    1d5c:	00098863          	beqz	s3,1d6c <_vfprintf_r+0x60>
    1d60:	0349a703          	lw	a4,52(s3)
    1d64:	00071463          	bnez	a4,1d6c <_vfprintf_r+0x60>
    1d68:	29d0106f          	j	3804 <_vfprintf_r+0x1af8>
    1d6c:	00812703          	lw	a4,8(sp)
    1d70:	06472683          	lw	a3,100(a4)
    1d74:	00c71703          	lh	a4,12(a4)
    1d78:	0016f693          	and	a3,a3,1
    1d7c:	00069863          	bnez	a3,1d8c <_vfprintf_r+0x80>
    1d80:	20077693          	and	a3,a4,512
    1d84:	00069463          	bnez	a3,1d8c <_vfprintf_r+0x80>
    1d88:	3ec0106f          	j	3174 <_vfprintf_r+0x1468>
    1d8c:	01271693          	sll	a3,a4,0x12
    1d90:	0206c863          	bltz	a3,1dc0 <_vfprintf_r+0xb4>
    1d94:	00812503          	lw	a0,8(sp)
    1d98:	000025b7          	lui	a1,0x2
    1d9c:	ffffe637          	lui	a2,0xffffe
    1da0:	06452683          	lw	a3,100(a0)
    1da4:	00b76733          	or	a4,a4,a1
    1da8:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1dac:	01071713          	sll	a4,a4,0x10
    1db0:	41075713          	sra	a4,a4,0x10
    1db4:	00c6f6b3          	and	a3,a3,a2
    1db8:	00e51623          	sh	a4,12(a0)
    1dbc:	06d52223          	sw	a3,100(a0)
    1dc0:	00877693          	and	a3,a4,8
    1dc4:	2a068063          	beqz	a3,2064 <_vfprintf_r+0x358>
    1dc8:	00812683          	lw	a3,8(sp)
    1dcc:	0106a683          	lw	a3,16(a3)
    1dd0:	28068a63          	beqz	a3,2064 <_vfprintf_r+0x358>
    1dd4:	01a77693          	and	a3,a4,26
    1dd8:	00a00613          	li	a2,10
    1ddc:	2ac68c63          	beq	a3,a2,2094 <_vfprintf_r+0x388>
    1de0:	0ac10713          	add	a4,sp,172
    1de4:	17512a23          	sw	s5,372(sp)
    1de8:	17812423          	sw	s8,360(sp)
    1dec:	15b12e23          	sw	s11,348(sp)
    1df0:	18912223          	sw	s1,388(sp)
    1df4:	19212023          	sw	s2,384(sp)
    1df8:	17412c23          	sw	s4,376(sp)
    1dfc:	17612823          	sw	s6,368(sp)
    1e00:	17712623          	sw	s7,364(sp)
    1e04:	17912223          	sw	s9,356(sp)
    1e08:	17a12023          	sw	s10,352(sp)
    1e0c:	0ae12023          	sw	a4,160(sp)
    1e10:	0a012423          	sw	zero,168(sp)
    1e14:	0a012223          	sw	zero,164(sp)
    1e18:	00012c23          	sw	zero,24(sp)
    1e1c:	02012423          	sw	zero,40(sp)
    1e20:	02012623          	sw	zero,44(sp)
    1e24:	00070413          	mv	s0,a4
    1e28:	02012c23          	sw	zero,56(sp)
    1e2c:	04012023          	sw	zero,64(sp)
    1e30:	02012e23          	sw	zero,60(sp)
    1e34:	04012623          	sw	zero,76(sp)
    1e38:	04012423          	sw	zero,72(sp)
    1e3c:	00012623          	sw	zero,12(sp)
    1e40:	7fffea97          	auipc	s5,0x7fffe
    1e44:	6f4a8a93          	add	s5,s5,1780 # 80000534 <__global_locale>
    1e48:	02500d93          	li	s11,37
    1e4c:	00078c13          	mv	s8,a5
    1e50:	000c0913          	mv	s2,s8
    1e54:	0e4aa483          	lw	s1,228(s5)
    1e58:	2a1050ef          	jal	78f8 <__locale_mb_cur_max>
    1e5c:	00050693          	mv	a3,a0
    1e60:	09010713          	add	a4,sp,144
    1e64:	00090613          	mv	a2,s2
    1e68:	08010593          	add	a1,sp,128
    1e6c:	00098513          	mv	a0,s3
    1e70:	000480e7          	jalr	s1
    1e74:	2c050a63          	beqz	a0,2148 <_vfprintf_r+0x43c>
    1e78:	2a054a63          	bltz	a0,212c <_vfprintf_r+0x420>
    1e7c:	08012783          	lw	a5,128(sp)
    1e80:	01b78663          	beq	a5,s11,1e8c <_vfprintf_r+0x180>
    1e84:	00a90933          	add	s2,s2,a0
    1e88:	fcdff06f          	j	1e54 <_vfprintf_r+0x148>
    1e8c:	00050493          	mv	s1,a0
    1e90:	41890cb3          	sub	s9,s2,s8
    1e94:	2d891063          	bne	s2,s8,2154 <_vfprintf_r+0x448>
    1e98:	fff00313          	li	t1,-1
    1e9c:	00000e93          	li	t4,0
    1ea0:	00194e03          	lbu	t3,1(s2)
    1ea4:	06010ba3          	sb	zero,119(sp)
    1ea8:	00190913          	add	s2,s2,1
    1eac:	00000b93          	li	s7,0
    1eb0:	05a00493          	li	s1,90
    1eb4:	000e8a13          	mv	s4,t4
    1eb8:	00030b13          	mv	s6,t1
    1ebc:	00190913          	add	s2,s2,1
    1ec0:	fe0e0793          	add	a5,t3,-32
    1ec4:	04f4ea63          	bltu	s1,a5,1f18 <_vfprintf_r+0x20c>
    1ec8:	0000d717          	auipc	a4,0xd
    1ecc:	31c70713          	add	a4,a4,796 # f1e4 <_ctype_+0x104>
    1ed0:	00279793          	sll	a5,a5,0x2
    1ed4:	00e787b3          	add	a5,a5,a4
    1ed8:	0007a783          	lw	a5,0(a5)
    1edc:	00e787b3          	add	a5,a5,a4
    1ee0:	00078067          	jr	a5
    1ee4:	00000b93          	li	s7,0
    1ee8:	fd0e0713          	add	a4,t3,-48
    1eec:	00900693          	li	a3,9
    1ef0:	00094e03          	lbu	t3,0(s2)
    1ef4:	002b9793          	sll	a5,s7,0x2
    1ef8:	017787b3          	add	a5,a5,s7
    1efc:	00179793          	sll	a5,a5,0x1
    1f00:	00f70bb3          	add	s7,a4,a5
    1f04:	fd0e0713          	add	a4,t3,-48
    1f08:	00190913          	add	s2,s2,1
    1f0c:	fee6f2e3          	bgeu	a3,a4,1ef0 <_vfprintf_r+0x1e4>
    1f10:	fe0e0793          	add	a5,t3,-32
    1f14:	faf4fae3          	bgeu	s1,a5,1ec8 <_vfprintf_r+0x1bc>
    1f18:	000a0e93          	mv	t4,s4
    1f1c:	260e0a63          	beqz	t3,2190 <_vfprintf_r+0x484>
    1f20:	0fc10623          	sb	t3,236(sp)
    1f24:	06010ba3          	sb	zero,119(sp)
    1f28:	00100c93          	li	s9,1
    1f2c:	00000613          	li	a2,0
    1f30:	00012823          	sw	zero,16(sp)
    1f34:	00100d13          	li	s10,1
    1f38:	00000313          	li	t1,0
    1f3c:	02012223          	sw	zero,36(sp)
    1f40:	02012023          	sw	zero,32(sp)
    1f44:	00000a13          	li	s4,0
    1f48:	0ec10c13          	add	s8,sp,236
    1f4c:	002ef293          	and	t0,t4,2
    1f50:	00028463          	beqz	t0,1f58 <_vfprintf_r+0x24c>
    1f54:	002c8c93          	add	s9,s9,2
    1f58:	084eff93          	and	t6,t4,132
    1f5c:	0a812483          	lw	s1,168(sp)
    1f60:	000f9663          	bnez	t6,1f6c <_vfprintf_r+0x260>
    1f64:	419b8733          	sub	a4,s7,s9
    1f68:	40e04663          	bgtz	a4,2374 <_vfprintf_r+0x668>
    1f6c:	02060a63          	beqz	a2,1fa0 <_vfprintf_r+0x294>
    1f70:	0a412703          	lw	a4,164(sp)
    1f74:	07710613          	add	a2,sp,119
    1f78:	00148493          	add	s1,s1,1
    1f7c:	00170713          	add	a4,a4,1
    1f80:	00100793          	li	a5,1
    1f84:	00c42023          	sw	a2,0(s0)
    1f88:	00f42223          	sw	a5,4(s0)
    1f8c:	0a912423          	sw	s1,168(sp)
    1f90:	0ae12223          	sw	a4,164(sp)
    1f94:	00700613          	li	a2,7
    1f98:	00840413          	add	s0,s0,8
    1f9c:	4ce64863          	blt	a2,a4,246c <_vfprintf_r+0x760>
    1fa0:	02028a63          	beqz	t0,1fd4 <_vfprintf_r+0x2c8>
    1fa4:	0a412703          	lw	a4,164(sp)
    1fa8:	07810613          	add	a2,sp,120
    1fac:	00c42023          	sw	a2,0(s0)
    1fb0:	00248493          	add	s1,s1,2
    1fb4:	00200613          	li	a2,2
    1fb8:	00170713          	add	a4,a4,1
    1fbc:	00c42223          	sw	a2,4(s0)
    1fc0:	0a912423          	sw	s1,168(sp)
    1fc4:	0ae12223          	sw	a4,164(sp)
    1fc8:	00700613          	li	a2,7
    1fcc:	00840413          	add	s0,s0,8
    1fd0:	5ce644e3          	blt	a2,a4,2d98 <_vfprintf_r+0x108c>
    1fd4:	08000713          	li	a4,128
    1fd8:	3aef80e3          	beq	t6,a4,2b78 <_vfprintf_r+0xe6c>
    1fdc:	41a30b33          	sub	s6,t1,s10
    1fe0:	4b604ae3          	bgtz	s6,2c94 <_vfprintf_r+0xf88>
    1fe4:	100ef713          	and	a4,t4,256
    1fe8:	1a0710e3          	bnez	a4,2988 <_vfprintf_r+0xc7c>
    1fec:	0a412783          	lw	a5,164(sp)
    1ff0:	01a484b3          	add	s1,s1,s10
    1ff4:	01842023          	sw	s8,0(s0)
    1ff8:	00178793          	add	a5,a5,1
    1ffc:	01a42223          	sw	s10,4(s0)
    2000:	0a912423          	sw	s1,168(sp)
    2004:	0af12223          	sw	a5,164(sp)
    2008:	00700713          	li	a4,7
    200c:	58f74c63          	blt	a4,a5,25a4 <_vfprintf_r+0x898>
    2010:	00840413          	add	s0,s0,8
    2014:	004eff13          	and	t5,t4,4
    2018:	000f0663          	beqz	t5,2024 <_vfprintf_r+0x318>
    201c:	419b8d33          	sub	s10,s7,s9
    2020:	5ba04ce3          	bgtz	s10,2dd8 <_vfprintf_r+0x10cc>
    2024:	000b8e93          	mv	t4,s7
    2028:	019bd463          	bge	s7,s9,2030 <_vfprintf_r+0x324>
    202c:	000c8e93          	mv	t4,s9
    2030:	00c12783          	lw	a5,12(sp)
    2034:	01d787b3          	add	a5,a5,t4
    2038:	00f12623          	sw	a5,12(sp)
    203c:	18049663          	bnez	s1,21c8 <_vfprintf_r+0x4bc>
    2040:	01012783          	lw	a5,16(sp)
    2044:	0a012223          	sw	zero,164(sp)
    2048:	00078863          	beqz	a5,2058 <_vfprintf_r+0x34c>
    204c:	01012583          	lw	a1,16(sp)
    2050:	00098513          	mv	a0,s3
    2054:	9b4ff0ef          	jal	1208 <_free_r>
    2058:	0ac10413          	add	s0,sp,172
    205c:	00090c13          	mv	s8,s2
    2060:	df1ff06f          	j	1e50 <_vfprintf_r+0x144>
    2064:	00812403          	lw	s0,8(sp)
    2068:	00098513          	mv	a0,s3
    206c:	00f12623          	sw	a5,12(sp)
    2070:	00040593          	mv	a1,s0
    2074:	3a4050ef          	jal	7418 <__swsetup_r>
    2078:	00050463          	beqz	a0,2080 <_vfprintf_r+0x374>
    207c:	5600206f          	j	45dc <_vfprintf_r+0x28d0>
    2080:	00c41703          	lh	a4,12(s0)
    2084:	00a00613          	li	a2,10
    2088:	00c12783          	lw	a5,12(sp)
    208c:	01a77693          	and	a3,a4,26
    2090:	d4c698e3          	bne	a3,a2,1de0 <_vfprintf_r+0xd4>
    2094:	00812603          	lw	a2,8(sp)
    2098:	00e61683          	lh	a3,14(a2)
    209c:	d406c2e3          	bltz	a3,1de0 <_vfprintf_r+0xd4>
    20a0:	06462683          	lw	a3,100(a2)
    20a4:	0016f693          	and	a3,a3,1
    20a8:	00069863          	bnez	a3,20b8 <_vfprintf_r+0x3ac>
    20ac:	20077713          	and	a4,a4,512
    20b0:	00071463          	bnez	a4,20b8 <_vfprintf_r+0x3ac>
    20b4:	53d0106f          	j	3df0 <_vfprintf_r+0x20e4>
    20b8:	01412683          	lw	a3,20(sp)
    20bc:	00812583          	lw	a1,8(sp)
    20c0:	00098513          	mv	a0,s3
    20c4:	00078613          	mv	a2,a5
    20c8:	0e5020ef          	jal	49ac <__sbprintf>
    20cc:	18c12083          	lw	ra,396(sp)
    20d0:	18812403          	lw	s0,392(sp)
    20d4:	00a12623          	sw	a0,12(sp)
    20d8:	00c12503          	lw	a0,12(sp)
    20dc:	17c12983          	lw	s3,380(sp)
    20e0:	19010113          	add	sp,sp,400
    20e4:	00008067          	ret
    20e8:	00098513          	mv	a0,s3
    20ec:	019050ef          	jal	7904 <_localeconv_r>
    20f0:	00452783          	lw	a5,4(a0)
    20f4:	00078513          	mv	a0,a5
    20f8:	04f12423          	sw	a5,72(sp)
    20fc:	f3dfe0ef          	jal	1038 <strlen>
    2100:	00050793          	mv	a5,a0
    2104:	00098513          	mv	a0,s3
    2108:	00078c93          	mv	s9,a5
    210c:	04f12623          	sw	a5,76(sp)
    2110:	7f4050ef          	jal	7904 <_localeconv_r>
    2114:	00852703          	lw	a4,8(a0)
    2118:	02e12e23          	sw	a4,60(sp)
    211c:	000c8463          	beqz	s9,2124 <_vfprintf_r+0x418>
    2120:	1ec0106f          	j	330c <_vfprintf_r+0x1600>
    2124:	00094e03          	lbu	t3,0(s2)
    2128:	d95ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    212c:	00800613          	li	a2,8
    2130:	00000593          	li	a1,0
    2134:	09010513          	add	a0,sp,144
    2138:	c81fe0ef          	jal	db8 <memset>
    213c:	00100513          	li	a0,1
    2140:	00a90933          	add	s2,s2,a0
    2144:	d11ff06f          	j	1e54 <_vfprintf_r+0x148>
    2148:	00050493          	mv	s1,a0
    214c:	41890cb3          	sub	s9,s2,s8
    2150:	05890063          	beq	s2,s8,2190 <_vfprintf_r+0x484>
    2154:	0a812683          	lw	a3,168(sp)
    2158:	0a412703          	lw	a4,164(sp)
    215c:	01842023          	sw	s8,0(s0)
    2160:	019686b3          	add	a3,a3,s9
    2164:	00170713          	add	a4,a4,1
    2168:	01942223          	sw	s9,4(s0)
    216c:	0ad12423          	sw	a3,168(sp)
    2170:	0ae12223          	sw	a4,164(sp)
    2174:	00700693          	li	a3,7
    2178:	00840413          	add	s0,s0,8
    217c:	02e6c863          	blt	a3,a4,21ac <_vfprintf_r+0x4a0>
    2180:	00c12783          	lw	a5,12(sp)
    2184:	019787b3          	add	a5,a5,s9
    2188:	00f12623          	sw	a5,12(sp)
    218c:	d00496e3          	bnez	s1,1e98 <_vfprintf_r+0x18c>
    2190:	0a812783          	lw	a5,168(sp)
    2194:	00078463          	beqz	a5,219c <_vfprintf_r+0x490>
    2198:	4090106f          	j	3da0 <_vfprintf_r+0x2094>
    219c:	00812783          	lw	a5,8(sp)
    21a0:	0a012223          	sw	zero,164(sp)
    21a4:	00c79783          	lh	a5,12(a5)
    21a8:	0500006f          	j	21f8 <_vfprintf_r+0x4ec>
    21ac:	00812583          	lw	a1,8(sp)
    21b0:	0a010613          	add	a2,sp,160
    21b4:	00098513          	mv	a0,s3
    21b8:	211020ef          	jal	4bc8 <__sprint_r>
    21bc:	02051a63          	bnez	a0,21f0 <_vfprintf_r+0x4e4>
    21c0:	0ac10413          	add	s0,sp,172
    21c4:	fbdff06f          	j	2180 <_vfprintf_r+0x474>
    21c8:	00812583          	lw	a1,8(sp)
    21cc:	0a010613          	add	a2,sp,160
    21d0:	00098513          	mv	a0,s3
    21d4:	1f5020ef          	jal	4bc8 <__sprint_r>
    21d8:	e60504e3          	beqz	a0,2040 <_vfprintf_r+0x334>
    21dc:	01012283          	lw	t0,16(sp)
    21e0:	00028863          	beqz	t0,21f0 <_vfprintf_r+0x4e4>
    21e4:	00028593          	mv	a1,t0
    21e8:	00098513          	mv	a0,s3
    21ec:	81cff0ef          	jal	1208 <_free_r>
    21f0:	00812783          	lw	a5,8(sp)
    21f4:	00c79783          	lh	a5,12(a5)
    21f8:	00812703          	lw	a4,8(sp)
    21fc:	06472703          	lw	a4,100(a4)
    2200:	00177713          	and	a4,a4,1
    2204:	3c070463          	beqz	a4,25cc <_vfprintf_r+0x8c0>
    2208:	0407f793          	and	a5,a5,64
    220c:	18412483          	lw	s1,388(sp)
    2210:	18012903          	lw	s2,384(sp)
    2214:	17812a03          	lw	s4,376(sp)
    2218:	17412a83          	lw	s5,372(sp)
    221c:	17012b03          	lw	s6,368(sp)
    2220:	16c12b83          	lw	s7,364(sp)
    2224:	16812c03          	lw	s8,360(sp)
    2228:	16412c83          	lw	s9,356(sp)
    222c:	16012d03          	lw	s10,352(sp)
    2230:	15c12d83          	lw	s11,348(sp)
    2234:	00078463          	beqz	a5,223c <_vfprintf_r+0x530>
    2238:	3d00206f          	j	4608 <_vfprintf_r+0x28fc>
    223c:	18c12083          	lw	ra,396(sp)
    2240:	18812403          	lw	s0,392(sp)
    2244:	00c12503          	lw	a0,12(sp)
    2248:	17c12983          	lw	s3,380(sp)
    224c:	19010113          	add	sp,sp,400
    2250:	00008067          	ret
    2254:	008a7713          	and	a4,s4,8
    2258:	000a0e93          	mv	t4,s4
    225c:	000b0313          	mv	t1,s6
    2260:	00070463          	beqz	a4,2268 <_vfprintf_r+0x55c>
    2264:	0200106f          	j	3284 <_vfprintf_r+0x1578>
    2268:	01412783          	lw	a5,20(sp)
    226c:	00778b13          	add	s6,a5,7
    2270:	ff8b7b13          	and	s6,s6,-8
    2274:	000b2783          	lw	a5,0(s6)
    2278:	02f12423          	sw	a5,40(sp)
    227c:	004b2783          	lw	a5,4(s6)
    2280:	02f12623          	sw	a5,44(sp)
    2284:	008b0793          	add	a5,s6,8
    2288:	00f12a23          	sw	a5,20(sp)
    228c:	02c12a03          	lw	s4,44(sp)
    2290:	7fffe717          	auipc	a4,0x7fffe
    2294:	41070713          	add	a4,a4,1040 # 800006a0 <__global_locale+0x16c>
    2298:	00072c83          	lw	s9,0(a4)
    229c:	00472d03          	lw	s10,4(a4)
    22a0:	02812b03          	lw	s6,40(sp)
    22a4:	001a1493          	sll	s1,s4,0x1
    22a8:	0014d493          	srl	s1,s1,0x1
    22ac:	000b0513          	mv	a0,s6
    22b0:	00048593          	mv	a1,s1
    22b4:	000c8613          	mv	a2,s9
    22b8:	000d0693          	mv	a3,s10
    22bc:	02612223          	sw	t1,36(sp)
    22c0:	03c12023          	sw	t3,32(sp)
    22c4:	01d12823          	sw	t4,16(sp)
    22c8:	26c0c0ef          	jal	e534 <__unorddf2>
    22cc:	01012e83          	lw	t4,16(sp)
    22d0:	02012e03          	lw	t3,32(sp)
    22d4:	02412303          	lw	t1,36(sp)
    22d8:	00050463          	beqz	a0,22e0 <_vfprintf_r+0x5d4>
    22dc:	4080106f          	j	36e4 <_vfprintf_r+0x19d8>
    22e0:	000b0513          	mv	a0,s6
    22e4:	00048593          	mv	a1,s1
    22e8:	000c8613          	mv	a2,s9
    22ec:	000d0693          	mv	a3,s10
    22f0:	0a40b0ef          	jal	d394 <__ledf2>
    22f4:	01012e83          	lw	t4,16(sp)
    22f8:	02012e03          	lw	t3,32(sp)
    22fc:	02412303          	lw	t1,36(sp)
    2300:	00a04463          	bgtz	a0,2308 <_vfprintf_r+0x5fc>
    2304:	3e00106f          	j	36e4 <_vfprintf_r+0x19d8>
    2308:	000b0513          	mv	a0,s6
    230c:	000a0593          	mv	a1,s4
    2310:	00000613          	li	a2,0
    2314:	00000693          	li	a3,0
    2318:	07c0b0ef          	jal	d394 <__ledf2>
    231c:	01012e83          	lw	t4,16(sp)
    2320:	02012e03          	lw	t3,32(sp)
    2324:	00055463          	bgez	a0,232c <_vfprintf_r+0x620>
    2328:	6650106f          	j	418c <_vfprintf_r+0x2480>
    232c:	07714603          	lbu	a2,119(sp)
    2330:	04700713          	li	a4,71
    2334:	0000dc17          	auipc	s8,0xd
    2338:	bc0c0c13          	add	s8,s8,-1088 # eef4 <__fini_array_end+0x198>
    233c:	01c74663          	blt	a4,t3,2348 <_vfprintf_r+0x63c>
    2340:	0000dc17          	auipc	s8,0xd
    2344:	bb0c0c13          	add	s8,s8,-1104 # eef0 <__fini_array_end+0x194>
    2348:	00012823          	sw	zero,16(sp)
    234c:	02012223          	sw	zero,36(sp)
    2350:	02012023          	sw	zero,32(sp)
    2354:	f7fefe93          	and	t4,t4,-129
    2358:	00300c93          	li	s9,3
    235c:	00300d13          	li	s10,3
    2360:	00000313          	li	t1,0
    2364:	00000a13          	li	s4,0
    2368:	be0602e3          	beqz	a2,1f4c <_vfprintf_r+0x240>
    236c:	001c8c93          	add	s9,s9,1
    2370:	bddff06f          	j	1f4c <_vfprintf_r+0x240>
    2374:	01000593          	li	a1,16
    2378:	0a412603          	lw	a2,164(sp)
    237c:	0000db17          	auipc	s6,0xd
    2380:	07cb0b13          	add	s6,s6,124 # f3f8 <blanks.1>
    2384:	0ae5dc63          	bge	a1,a4,243c <_vfprintf_r+0x730>
    2388:	00040793          	mv	a5,s0
    238c:	00048693          	mv	a3,s1
    2390:	01000893          	li	a7,16
    2394:	000b0493          	mv	s1,s6
    2398:	00700393          	li	t2,7
    239c:	000a0b13          	mv	s6,s4
    23a0:	04512223          	sw	t0,68(sp)
    23a4:	05f12823          	sw	t6,80(sp)
    23a8:	05d12a23          	sw	t4,84(sp)
    23ac:	05c12c23          	sw	t3,88(sp)
    23b0:	00070413          	mv	s0,a4
    23b4:	00030a13          	mv	s4,t1
    23b8:	00c0006f          	j	23c4 <_vfprintf_r+0x6b8>
    23bc:	ff040413          	add	s0,s0,-16
    23c0:	0488da63          	bge	a7,s0,2414 <_vfprintf_r+0x708>
    23c4:	01068693          	add	a3,a3,16
    23c8:	00160613          	add	a2,a2,1
    23cc:	0097a023          	sw	s1,0(a5)
    23d0:	0117a223          	sw	a7,4(a5)
    23d4:	0ad12423          	sw	a3,168(sp)
    23d8:	0ac12223          	sw	a2,164(sp)
    23dc:	00878793          	add	a5,a5,8
    23e0:	fcc3dee3          	bge	t2,a2,23bc <_vfprintf_r+0x6b0>
    23e4:	00812583          	lw	a1,8(sp)
    23e8:	0a010613          	add	a2,sp,160
    23ec:	00098513          	mv	a0,s3
    23f0:	7d8020ef          	jal	4bc8 <__sprint_r>
    23f4:	de0514e3          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    23f8:	01000893          	li	a7,16
    23fc:	ff040413          	add	s0,s0,-16
    2400:	0a812683          	lw	a3,168(sp)
    2404:	0a412603          	lw	a2,164(sp)
    2408:	0ac10793          	add	a5,sp,172
    240c:	00700393          	li	t2,7
    2410:	fa88cae3          	blt	a7,s0,23c4 <_vfprintf_r+0x6b8>
    2414:	04412283          	lw	t0,68(sp)
    2418:	05012f83          	lw	t6,80(sp)
    241c:	05412e83          	lw	t4,84(sp)
    2420:	05812e03          	lw	t3,88(sp)
    2424:	000a0313          	mv	t1,s4
    2428:	00040713          	mv	a4,s0
    242c:	000b0a13          	mv	s4,s6
    2430:	00078413          	mv	s0,a5
    2434:	00048b13          	mv	s6,s1
    2438:	00068493          	mv	s1,a3
    243c:	00e484b3          	add	s1,s1,a4
    2440:	00160613          	add	a2,a2,1
    2444:	00e42223          	sw	a4,4(s0)
    2448:	01642023          	sw	s6,0(s0)
    244c:	0a912423          	sw	s1,168(sp)
    2450:	0ac12223          	sw	a2,164(sp)
    2454:	00700713          	li	a4,7
    2458:	00c75463          	bge	a4,a2,2460 <_vfprintf_r+0x754>
    245c:	2380106f          	j	3694 <_vfprintf_r+0x1988>
    2460:	07714603          	lbu	a2,119(sp)
    2464:	00840413          	add	s0,s0,8
    2468:	b05ff06f          	j	1f6c <_vfprintf_r+0x260>
    246c:	00812583          	lw	a1,8(sp)
    2470:	0a010613          	add	a2,sp,160
    2474:	00098513          	mv	a0,s3
    2478:	04612e23          	sw	t1,92(sp)
    247c:	05c12c23          	sw	t3,88(sp)
    2480:	05d12a23          	sw	t4,84(sp)
    2484:	05f12823          	sw	t6,80(sp)
    2488:	04512223          	sw	t0,68(sp)
    248c:	73c020ef          	jal	4bc8 <__sprint_r>
    2490:	d40516e3          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2494:	0a812483          	lw	s1,168(sp)
    2498:	05c12303          	lw	t1,92(sp)
    249c:	05812e03          	lw	t3,88(sp)
    24a0:	05412e83          	lw	t4,84(sp)
    24a4:	05012f83          	lw	t6,80(sp)
    24a8:	04412283          	lw	t0,68(sp)
    24ac:	0ac10413          	add	s0,sp,172
    24b0:	af1ff06f          	j	1fa0 <_vfprintf_r+0x294>
    24b4:	0a412d03          	lw	s10,164(sp)
    24b8:	01812783          	lw	a5,24(sp)
    24bc:	00100693          	li	a3,1
    24c0:	01842023          	sw	s8,0(s0)
    24c4:	00148493          	add	s1,s1,1
    24c8:	001d0d13          	add	s10,s10,1
    24cc:	00840b13          	add	s6,s0,8
    24d0:	32f6d0e3          	bge	a3,a5,2ff0 <_vfprintf_r+0x12e4>
    24d4:	00100693          	li	a3,1
    24d8:	00d42223          	sw	a3,4(s0)
    24dc:	0a912423          	sw	s1,168(sp)
    24e0:	0ba12223          	sw	s10,164(sp)
    24e4:	00700693          	li	a3,7
    24e8:	01a6d463          	bge	a3,s10,24f0 <_vfprintf_r+0x7e4>
    24ec:	0680106f          	j	3554 <_vfprintf_r+0x1848>
    24f0:	03012783          	lw	a5,48(sp)
    24f4:	03412703          	lw	a4,52(sp)
    24f8:	001d0d13          	add	s10,s10,1
    24fc:	00f484b3          	add	s1,s1,a5
    2500:	00eb2023          	sw	a4,0(s6)
    2504:	00fb2223          	sw	a5,4(s6)
    2508:	0a912423          	sw	s1,168(sp)
    250c:	0ba12223          	sw	s10,164(sp)
    2510:	00700693          	li	a3,7
    2514:	008b0b13          	add	s6,s6,8
    2518:	01a6d463          	bge	a3,s10,2520 <_vfprintf_r+0x814>
    251c:	0680106f          	j	3584 <_vfprintf_r+0x1878>
    2520:	02812603          	lw	a2,40(sp)
    2524:	02c12683          	lw	a3,44(sp)
    2528:	01812783          	lw	a5,24(sp)
    252c:	00060513          	mv	a0,a2
    2530:	00068593          	mv	a1,a3
    2534:	00000613          	li	a2,0
    2538:	00000693          	li	a3,0
    253c:	03d12023          	sw	t4,32(sp)
    2540:	fff78413          	add	s0,a5,-1
    2544:	4c50a0ef          	jal	d208 <__eqdf2>
    2548:	02012e83          	lw	t4,32(sp)
    254c:	2e0506e3          	beqz	a0,3038 <_vfprintf_r+0x132c>
    2550:	001c0793          	add	a5,s8,1
    2554:	001d0d13          	add	s10,s10,1
    2558:	008484b3          	add	s1,s1,s0
    255c:	00fb2023          	sw	a5,0(s6)
    2560:	008b2223          	sw	s0,4(s6)
    2564:	0a912423          	sw	s1,168(sp)
    2568:	0ba12223          	sw	s10,164(sp)
    256c:	00700793          	li	a5,7
    2570:	008b0b13          	add	s6,s6,8
    2574:	29a7cce3          	blt	a5,s10,300c <_vfprintf_r+0x1300>
    2578:	04012703          	lw	a4,64(sp)
    257c:	08810793          	add	a5,sp,136
    2580:	001d0d13          	add	s10,s10,1
    2584:	009704b3          	add	s1,a4,s1
    2588:	00fb2023          	sw	a5,0(s6)
    258c:	00eb2223          	sw	a4,4(s6)
    2590:	0a912423          	sw	s1,168(sp)
    2594:	0ba12223          	sw	s10,164(sp)
    2598:	00700793          	li	a5,7
    259c:	008b0413          	add	s0,s6,8
    25a0:	a7a7dae3          	bge	a5,s10,2014 <_vfprintf_r+0x308>
    25a4:	00812583          	lw	a1,8(sp)
    25a8:	0a010613          	add	a2,sp,160
    25ac:	00098513          	mv	a0,s3
    25b0:	03d12023          	sw	t4,32(sp)
    25b4:	614020ef          	jal	4bc8 <__sprint_r>
    25b8:	c20512e3          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    25bc:	0a812483          	lw	s1,168(sp)
    25c0:	02012e83          	lw	t4,32(sp)
    25c4:	0ac10413          	add	s0,sp,172
    25c8:	a4dff06f          	j	2014 <_vfprintf_r+0x308>
    25cc:	2007f713          	and	a4,a5,512
    25d0:	c2071ce3          	bnez	a4,2208 <_vfprintf_r+0x4fc>
    25d4:	00812403          	lw	s0,8(sp)
    25d8:	05842503          	lw	a0,88(s0)
    25dc:	fd8fe0ef          	jal	db4 <__retarget_lock_release_recursive>
    25e0:	00c41783          	lh	a5,12(s0)
    25e4:	c25ff06f          	j	2208 <_vfprintf_r+0x4fc>
    25e8:	00094e03          	lbu	t3,0(s2)
    25ec:	020a6a13          	or	s4,s4,32
    25f0:	8cdff06f          	j	1ebc <_vfprintf_r+0x1b0>
    25f4:	01412703          	lw	a4,20(sp)
    25f8:	04300793          	li	a5,67
    25fc:	000a0e93          	mv	t4,s4
    2600:	00470493          	add	s1,a4,4
    2604:	64fe08e3          	beq	t3,a5,3454 <_vfprintf_r+0x1748>
    2608:	010a7793          	and	a5,s4,16
    260c:	640794e3          	bnez	a5,3454 <_vfprintf_r+0x1748>
    2610:	01412783          	lw	a5,20(sp)
    2614:	00100c93          	li	s9,1
    2618:	00100d13          	li	s10,1
    261c:	0007a783          	lw	a5,0(a5)
    2620:	0ec10c13          	add	s8,sp,236
    2624:	0ef10623          	sb	a5,236(sp)
    2628:	06010ba3          	sb	zero,119(sp)
    262c:	00912a23          	sw	s1,20(sp)
    2630:	00000613          	li	a2,0
    2634:	00012823          	sw	zero,16(sp)
    2638:	00000313          	li	t1,0
    263c:	02012223          	sw	zero,36(sp)
    2640:	02012023          	sw	zero,32(sp)
    2644:	00000a13          	li	s4,0
    2648:	905ff06f          	j	1f4c <_vfprintf_r+0x240>
    264c:	01412783          	lw	a5,20(sp)
    2650:	06010ba3          	sb	zero,119(sp)
    2654:	000b0313          	mv	t1,s6
    2658:	0007ac03          	lw	s8,0(a5)
    265c:	000a0e93          	mv	t4,s4
    2660:	00478b13          	add	s6,a5,4
    2664:	5a0c0ce3          	beqz	s8,341c <_vfprintf_r+0x1710>
    2668:	05300713          	li	a4,83
    266c:	00ee1463          	bne	t3,a4,2674 <_vfprintf_r+0x968>
    2670:	1d00106f          	j	3840 <_vfprintf_r+0x1b34>
    2674:	010a7a13          	and	s4,s4,16
    2678:	000a0463          	beqz	s4,2680 <_vfprintf_r+0x974>
    267c:	1c40106f          	j	3840 <_vfprintf_r+0x1b34>
    2680:	00035463          	bgez	t1,2688 <_vfprintf_r+0x97c>
    2684:	6d40106f          	j	3d58 <_vfprintf_r+0x204c>
    2688:	00030613          	mv	a2,t1
    268c:	00000593          	li	a1,0
    2690:	000c0513          	mv	a0,s8
    2694:	03d12023          	sw	t4,32(sp)
    2698:	00612a23          	sw	t1,20(sp)
    269c:	0ec050ef          	jal	7788 <memchr>
    26a0:	00a12823          	sw	a0,16(sp)
    26a4:	01412303          	lw	t1,20(sp)
    26a8:	02012e83          	lw	t4,32(sp)
    26ac:	00051463          	bnez	a0,26b4 <_vfprintf_r+0x9a8>
    26b0:	1780206f          	j	4828 <_vfprintf_r+0x2b1c>
    26b4:	01012783          	lw	a5,16(sp)
    26b8:	07714603          	lbu	a2,119(sp)
    26bc:	01612a23          	sw	s6,20(sp)
    26c0:	41878d33          	sub	s10,a5,s8
    26c4:	fffd4813          	not	a6,s10
    26c8:	41f85813          	sra	a6,a6,0x1f
    26cc:	02012223          	sw	zero,36(sp)
    26d0:	02012023          	sw	zero,32(sp)
    26d4:	00012823          	sw	zero,16(sp)
    26d8:	010d7cb3          	and	s9,s10,a6
    26dc:	00000313          	li	t1,0
    26e0:	07300e13          	li	t3,115
    26e4:	860604e3          	beqz	a2,1f4c <_vfprintf_r+0x240>
    26e8:	c85ff06f          	j	236c <_vfprintf_r+0x660>
    26ec:	01412783          	lw	a5,20(sp)
    26f0:	0007ab83          	lw	s7,0(a5)
    26f4:	00478793          	add	a5,a5,4
    26f8:	2a0bdae3          	bgez	s7,31ac <_vfprintf_r+0x14a0>
    26fc:	41700bb3          	neg	s7,s7
    2700:	00f12a23          	sw	a5,20(sp)
    2704:	00094e03          	lbu	t3,0(s2)
    2708:	004a6a13          	or	s4,s4,4
    270c:	fb0ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2710:	02b00793          	li	a5,43
    2714:	00094e03          	lbu	t3,0(s2)
    2718:	06f10ba3          	sb	a5,119(sp)
    271c:	fa0ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2720:	000b0313          	mv	t1,s6
    2724:	010a6613          	or	a2,s4,16
    2728:	02067793          	and	a5,a2,32
    272c:	1c0780e3          	beqz	a5,30ec <_vfprintf_r+0x13e0>
    2730:	01412783          	lw	a5,20(sp)
    2734:	00778b13          	add	s6,a5,7
    2738:	ff8b7b13          	and	s6,s6,-8
    273c:	000b2d03          	lw	s10,0(s6)
    2740:	004b2c83          	lw	s9,4(s6)
    2744:	008b0793          	add	a5,s6,8
    2748:	00f12a23          	sw	a5,20(sp)
    274c:	00100793          	li	a5,1
    2750:	00000713          	li	a4,0
    2754:	06e10ba3          	sb	a4,119(sp)
    2758:	34034c63          	bltz	t1,2ab0 <_vfprintf_r+0xda4>
    275c:	019d6733          	or	a4,s10,s9
    2760:	f7f67e93          	and	t4,a2,-129
    2764:	34071463          	bnez	a4,2aac <_vfprintf_r+0xda0>
    2768:	3a031a63          	bnez	t1,2b1c <_vfprintf_r+0xe10>
    276c:	5c079ee3          	bnez	a5,3548 <_vfprintf_r+0x183c>
    2770:	00167d13          	and	s10,a2,1
    2774:	15010c13          	add	s8,sp,336
    2778:	2c0d10e3          	bnez	s10,3238 <_vfprintf_r+0x152c>
    277c:	07714603          	lbu	a2,119(sp)
    2780:	00030c93          	mv	s9,t1
    2784:	01a35463          	bge	t1,s10,278c <_vfprintf_r+0xa80>
    2788:	000d0c93          	mv	s9,s10
    278c:	00012823          	sw	zero,16(sp)
    2790:	02012223          	sw	zero,36(sp)
    2794:	02012023          	sw	zero,32(sp)
    2798:	00000a13          	li	s4,0
    279c:	fa060863          	beqz	a2,1f4c <_vfprintf_r+0x240>
    27a0:	bcdff06f          	j	236c <_vfprintf_r+0x660>
    27a4:	00094e03          	lbu	t3,0(s2)
    27a8:	080a6a13          	or	s4,s4,128
    27ac:	f10ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    27b0:	00094e03          	lbu	t3,0(s2)
    27b4:	02a00793          	li	a5,42
    27b8:	00190693          	add	a3,s2,1
    27bc:	00fe1463          	bne	t3,a5,27c4 <_vfprintf_r+0xab8>
    27c0:	1100206f          	j	48d0 <_vfprintf_r+0x2bc4>
    27c4:	fd0e0713          	add	a4,t3,-48
    27c8:	00900793          	li	a5,9
    27cc:	00000b13          	li	s6,0
    27d0:	00900613          	li	a2,9
    27d4:	02e7e463          	bltu	a5,a4,27fc <_vfprintf_r+0xaf0>
    27d8:	0006ce03          	lbu	t3,0(a3)
    27dc:	002b1793          	sll	a5,s6,0x2
    27e0:	016787b3          	add	a5,a5,s6
    27e4:	00179793          	sll	a5,a5,0x1
    27e8:	00e78b33          	add	s6,a5,a4
    27ec:	fd0e0713          	add	a4,t3,-48
    27f0:	00168693          	add	a3,a3,1
    27f4:	fee672e3          	bgeu	a2,a4,27d8 <_vfprintf_r+0xacc>
    27f8:	320b4ce3          	bltz	s6,3330 <_vfprintf_r+0x1624>
    27fc:	00068913          	mv	s2,a3
    2800:	ec0ff06f          	j	1ec0 <_vfprintf_r+0x1b4>
    2804:	00094e03          	lbu	t3,0(s2)
    2808:	001a6a13          	or	s4,s4,1
    280c:	eb0ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2810:	07714783          	lbu	a5,119(sp)
    2814:	00094e03          	lbu	t3,0(s2)
    2818:	ea079263          	bnez	a5,1ebc <_vfprintf_r+0x1b0>
    281c:	02000793          	li	a5,32
    2820:	06f10ba3          	sb	a5,119(sp)
    2824:	e98ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2828:	00094e03          	lbu	t3,0(s2)
    282c:	06c00793          	li	a5,108
    2830:	3afe00e3          	beq	t3,a5,33d0 <_vfprintf_r+0x16c4>
    2834:	010a6a13          	or	s4,s4,16
    2838:	e84ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    283c:	00094e03          	lbu	t3,0(s2)
    2840:	008a6a13          	or	s4,s4,8
    2844:	e78ff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2848:	000b0313          	mv	t1,s6
    284c:	010a6e93          	or	t4,s4,16
    2850:	020ef793          	and	a5,t4,32
    2854:	0c0786e3          	beqz	a5,3120 <_vfprintf_r+0x1414>
    2858:	01412783          	lw	a5,20(sp)
    285c:	00778b13          	add	s6,a5,7
    2860:	ff8b7b13          	and	s6,s6,-8
    2864:	004b2783          	lw	a5,4(s6)
    2868:	000b2d03          	lw	s10,0(s6)
    286c:	008b0713          	add	a4,s6,8
    2870:	00e12a23          	sw	a4,20(sp)
    2874:	00078c93          	mv	s9,a5
    2878:	0c07cee3          	bltz	a5,3154 <_vfprintf_r+0x1448>
    287c:	000e8613          	mv	a2,t4
    2880:	02034263          	bltz	t1,28a4 <_vfprintf_r+0xb98>
    2884:	019d67b3          	or	a5,s10,s9
    2888:	f7fef613          	and	a2,t4,-129
    288c:	00079c63          	bnez	a5,28a4 <_vfprintf_r+0xb98>
    2890:	02031063          	bnez	t1,28b0 <_vfprintf_r+0xba4>
    2894:	00000d13          	li	s10,0
    2898:	00060e93          	mv	t4,a2
    289c:	15010c13          	add	s8,sp,336
    28a0:	eddff06f          	j	277c <_vfprintf_r+0xa70>
    28a4:	520c90e3          	bnez	s9,35c4 <_vfprintf_r+0x18b8>
    28a8:	00900793          	li	a5,9
    28ac:	51a7ece3          	bltu	a5,s10,35c4 <_vfprintf_r+0x18b8>
    28b0:	030d0d13          	add	s10,s10,48
    28b4:	15a107a3          	sb	s10,335(sp)
    28b8:	00060e93          	mv	t4,a2
    28bc:	00100d13          	li	s10,1
    28c0:	14f10c13          	add	s8,sp,335
    28c4:	eb9ff06f          	j	277c <_vfprintf_r+0xa70>
    28c8:	000b0313          	mv	t1,s6
    28cc:	010a6e93          	or	t4,s4,16
    28d0:	020ef793          	and	a5,t4,32
    28d4:	7e078463          	beqz	a5,30bc <_vfprintf_r+0x13b0>
    28d8:	01412783          	lw	a5,20(sp)
    28dc:	00778b13          	add	s6,a5,7
    28e0:	ff8b7b13          	and	s6,s6,-8
    28e4:	000b2d03          	lw	s10,0(s6)
    28e8:	004b2c83          	lw	s9,4(s6)
    28ec:	008b0793          	add	a5,s6,8
    28f0:	00f12a23          	sw	a5,20(sp)
    28f4:	bffef613          	and	a2,t4,-1025
    28f8:	00000793          	li	a5,0
    28fc:	e55ff06f          	j	2750 <_vfprintf_r+0xa44>
    2900:	00094e03          	lbu	t3,0(s2)
    2904:	06800793          	li	a5,104
    2908:	2cfe0ce3          	beq	t3,a5,33e0 <_vfprintf_r+0x16d4>
    290c:	040a6a13          	or	s4,s4,64
    2910:	dacff06f          	j	1ebc <_vfprintf_r+0x1b0>
    2914:	01412703          	lw	a4,20(sp)
    2918:	000087b7          	lui	a5,0x8
    291c:	83078793          	add	a5,a5,-2000 # 7830 <memchr+0xa8>
    2920:	06f11c23          	sh	a5,120(sp)
    2924:	00470793          	add	a5,a4,4
    2928:	00f12a23          	sw	a5,20(sp)
    292c:	0000c797          	auipc	a5,0xc
    2930:	5d478793          	add	a5,a5,1492 # ef00 <__fini_array_end+0x1a4>
    2934:	02f12c23          	sw	a5,56(sp)
    2938:	00072d03          	lw	s10,0(a4)
    293c:	000b0313          	mv	t1,s6
    2940:	00000c93          	li	s9,0
    2944:	002a6613          	or	a2,s4,2
    2948:	00200793          	li	a5,2
    294c:	07800e13          	li	t3,120
    2950:	e01ff06f          	j	2750 <_vfprintf_r+0xa44>
    2954:	020a7793          	and	a5,s4,32
    2958:	180784e3          	beqz	a5,32e0 <_vfprintf_r+0x15d4>
    295c:	01412783          	lw	a5,20(sp)
    2960:	00c12683          	lw	a3,12(sp)
    2964:	0007a783          	lw	a5,0(a5)
    2968:	41f6d713          	sra	a4,a3,0x1f
    296c:	00d7a023          	sw	a3,0(a5)
    2970:	00e7a223          	sw	a4,4(a5)
    2974:	01412783          	lw	a5,20(sp)
    2978:	00090c13          	mv	s8,s2
    297c:	00478793          	add	a5,a5,4
    2980:	00f12a23          	sw	a5,20(sp)
    2984:	cccff06f          	j	1e50 <_vfprintf_r+0x144>
    2988:	06500713          	li	a4,101
    298c:	b3c754e3          	bge	a4,t3,24b4 <_vfprintf_r+0x7a8>
    2990:	02812683          	lw	a3,40(sp)
    2994:	02c12703          	lw	a4,44(sp)
    2998:	00000613          	li	a2,0
    299c:	00068513          	mv	a0,a3
    29a0:	00070593          	mv	a1,a4
    29a4:	00000693          	li	a3,0
    29a8:	05d12223          	sw	t4,68(sp)
    29ac:	05d0a0ef          	jal	d208 <__eqdf2>
    29b0:	04412e83          	lw	t4,68(sp)
    29b4:	4e051463          	bnez	a0,2e9c <_vfprintf_r+0x1190>
    29b8:	0a412783          	lw	a5,164(sp)
    29bc:	0000c717          	auipc	a4,0xc
    29c0:	57470713          	add	a4,a4,1396 # ef30 <__fini_array_end+0x1d4>
    29c4:	00e42023          	sw	a4,0(s0)
    29c8:	00148493          	add	s1,s1,1
    29cc:	00100713          	li	a4,1
    29d0:	00178793          	add	a5,a5,1
    29d4:	00e42223          	sw	a4,4(s0)
    29d8:	0a912423          	sw	s1,168(sp)
    29dc:	0af12223          	sw	a5,164(sp)
    29e0:	00700713          	li	a4,7
    29e4:	00840413          	add	s0,s0,8
    29e8:	62f746e3          	blt	a4,a5,3814 <_vfprintf_r+0x1b08>
    29ec:	07c12783          	lw	a5,124(sp)
    29f0:	01812703          	lw	a4,24(sp)
    29f4:	78e7de63          	bge	a5,a4,3190 <_vfprintf_r+0x1484>
    29f8:	03412783          	lw	a5,52(sp)
    29fc:	03012703          	lw	a4,48(sp)
    2a00:	00840413          	add	s0,s0,8
    2a04:	fef42c23          	sw	a5,-8(s0)
    2a08:	0a412783          	lw	a5,164(sp)
    2a0c:	00e484b3          	add	s1,s1,a4
    2a10:	fee42e23          	sw	a4,-4(s0)
    2a14:	00178793          	add	a5,a5,1
    2a18:	0a912423          	sw	s1,168(sp)
    2a1c:	0af12223          	sw	a5,164(sp)
    2a20:	00700713          	li	a4,7
    2a24:	1cf746e3          	blt	a4,a5,33f0 <_vfprintf_r+0x16e4>
    2a28:	01812783          	lw	a5,24(sp)
    2a2c:	fff78d13          	add	s10,a5,-1
    2a30:	dfa05263          	blez	s10,2014 <_vfprintf_r+0x308>
    2a34:	01000713          	li	a4,16
    2a38:	0a412783          	lw	a5,164(sp)
    2a3c:	0000d297          	auipc	t0,0xd
    2a40:	9ac28293          	add	t0,t0,-1620 # f3e8 <zeroes.0>
    2a44:	77a752e3          	bge	a4,s10,39a8 <_vfprintf_r+0x1c9c>
    2a48:	00048713          	mv	a4,s1
    2a4c:	01000c13          	li	s8,16
    2a50:	00700b13          	li	s6,7
    2a54:	000e8493          	mv	s1,t4
    2a58:	00028a13          	mv	s4,t0
    2a5c:	00c0006f          	j	2a68 <_vfprintf_r+0xd5c>
    2a60:	ff0d0d13          	add	s10,s10,-16
    2a64:	73ac5ce3          	bge	s8,s10,399c <_vfprintf_r+0x1c90>
    2a68:	01070713          	add	a4,a4,16
    2a6c:	00178793          	add	a5,a5,1
    2a70:	01442023          	sw	s4,0(s0)
    2a74:	01842223          	sw	s8,4(s0)
    2a78:	0ae12423          	sw	a4,168(sp)
    2a7c:	0af12223          	sw	a5,164(sp)
    2a80:	00840413          	add	s0,s0,8
    2a84:	fcfb5ee3          	bge	s6,a5,2a60 <_vfprintf_r+0xd54>
    2a88:	00812583          	lw	a1,8(sp)
    2a8c:	0a010613          	add	a2,sp,160
    2a90:	00098513          	mv	a0,s3
    2a94:	134020ef          	jal	4bc8 <__sprint_r>
    2a98:	f4051263          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2a9c:	0a812703          	lw	a4,168(sp)
    2aa0:	0a412783          	lw	a5,164(sp)
    2aa4:	0ac10413          	add	s0,sp,172
    2aa8:	fb9ff06f          	j	2a60 <_vfprintf_r+0xd54>
    2aac:	000e8613          	mv	a2,t4
    2ab0:	00100713          	li	a4,1
    2ab4:	dee788e3          	beq	a5,a4,28a4 <_vfprintf_r+0xb98>
    2ab8:	00200713          	li	a4,2
    2abc:	06e78c63          	beq	a5,a4,2b34 <_vfprintf_r+0xe28>
    2ac0:	15010c13          	add	s8,sp,336
    2ac4:	01dc9793          	sll	a5,s9,0x1d
    2ac8:	007d7713          	and	a4,s10,7
    2acc:	003d5d13          	srl	s10,s10,0x3
    2ad0:	03070713          	add	a4,a4,48
    2ad4:	01a7ed33          	or	s10,a5,s10
    2ad8:	003cdc93          	srl	s9,s9,0x3
    2adc:	feec0fa3          	sb	a4,-1(s8)
    2ae0:	019d67b3          	or	a5,s10,s9
    2ae4:	000c0593          	mv	a1,s8
    2ae8:	fffc0c13          	add	s8,s8,-1
    2aec:	fc079ce3          	bnez	a5,2ac4 <_vfprintf_r+0xdb8>
    2af0:	00167693          	and	a3,a2,1
    2af4:	06068a63          	beqz	a3,2b68 <_vfprintf_r+0xe5c>
    2af8:	03000693          	li	a3,48
    2afc:	06d70663          	beq	a4,a3,2b68 <_vfprintf_r+0xe5c>
    2b00:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x2f2>
    2b04:	15010793          	add	a5,sp,336
    2b08:	fedc0fa3          	sb	a3,-1(s8)
    2b0c:	40b78d33          	sub	s10,a5,a1
    2b10:	00060e93          	mv	t4,a2
    2b14:	00058c13          	mv	s8,a1
    2b18:	c65ff06f          	j	277c <_vfprintf_r+0xa70>
    2b1c:	00100713          	li	a4,1
    2b20:	00e79463          	bne	a5,a4,2b28 <_vfprintf_r+0xe1c>
    2b24:	2b10106f          	j	45d4 <_vfprintf_r+0x28c8>
    2b28:	00200713          	li	a4,2
    2b2c:	000e8613          	mv	a2,t4
    2b30:	f8e798e3          	bne	a5,a4,2ac0 <_vfprintf_r+0xdb4>
    2b34:	03812683          	lw	a3,56(sp)
    2b38:	15010c13          	add	s8,sp,336
    2b3c:	00fd7793          	and	a5,s10,15
    2b40:	00f687b3          	add	a5,a3,a5
    2b44:	0007c703          	lbu	a4,0(a5)
    2b48:	004d5d13          	srl	s10,s10,0x4
    2b4c:	01cc9793          	sll	a5,s9,0x1c
    2b50:	01a7ed33          	or	s10,a5,s10
    2b54:	004cdc93          	srl	s9,s9,0x4
    2b58:	feec0fa3          	sb	a4,-1(s8)
    2b5c:	019d67b3          	or	a5,s10,s9
    2b60:	fffc0c13          	add	s8,s8,-1
    2b64:	fc079ce3          	bnez	a5,2b3c <_vfprintf_r+0xe30>
    2b68:	15010793          	add	a5,sp,336
    2b6c:	41878d33          	sub	s10,a5,s8
    2b70:	00060e93          	mv	t4,a2
    2b74:	c09ff06f          	j	277c <_vfprintf_r+0xa70>
    2b78:	419b8b33          	sub	s6,s7,s9
    2b7c:	c7605063          	blez	s6,1fdc <_vfprintf_r+0x2d0>
    2b80:	01000593          	li	a1,16
    2b84:	0a412603          	lw	a2,164(sp)
    2b88:	0000d297          	auipc	t0,0xd
    2b8c:	86028293          	add	t0,t0,-1952 # f3e8 <zeroes.0>
    2b90:	0b65d463          	bge	a1,s6,2c38 <_vfprintf_r+0xf2c>
    2b94:	00040793          	mv	a5,s0
    2b98:	00048713          	mv	a4,s1
    2b9c:	000b0413          	mv	s0,s6
    2ba0:	01000893          	li	a7,16
    2ba4:	000a0b13          	mv	s6,s4
    2ba8:	00700f93          	li	t6,7
    2bac:	05d12223          	sw	t4,68(sp)
    2bb0:	05c12823          	sw	t3,80(sp)
    2bb4:	00030a13          	mv	s4,t1
    2bb8:	00028493          	mv	s1,t0
    2bbc:	00c0006f          	j	2bc8 <_vfprintf_r+0xebc>
    2bc0:	ff040413          	add	s0,s0,-16
    2bc4:	0488da63          	bge	a7,s0,2c18 <_vfprintf_r+0xf0c>
    2bc8:	01070713          	add	a4,a4,16
    2bcc:	00160613          	add	a2,a2,1
    2bd0:	0097a023          	sw	s1,0(a5)
    2bd4:	0117a223          	sw	a7,4(a5)
    2bd8:	0ae12423          	sw	a4,168(sp)
    2bdc:	0ac12223          	sw	a2,164(sp)
    2be0:	00878793          	add	a5,a5,8
    2be4:	fccfdee3          	bge	t6,a2,2bc0 <_vfprintf_r+0xeb4>
    2be8:	00812583          	lw	a1,8(sp)
    2bec:	0a010613          	add	a2,sp,160
    2bf0:	00098513          	mv	a0,s3
    2bf4:	7d5010ef          	jal	4bc8 <__sprint_r>
    2bf8:	de051263          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2bfc:	01000893          	li	a7,16
    2c00:	ff040413          	add	s0,s0,-16
    2c04:	0a812703          	lw	a4,168(sp)
    2c08:	0a412603          	lw	a2,164(sp)
    2c0c:	0ac10793          	add	a5,sp,172
    2c10:	00700f93          	li	t6,7
    2c14:	fa88cae3          	blt	a7,s0,2bc8 <_vfprintf_r+0xebc>
    2c18:	04412e83          	lw	t4,68(sp)
    2c1c:	05012e03          	lw	t3,80(sp)
    2c20:	000a0313          	mv	t1,s4
    2c24:	00048293          	mv	t0,s1
    2c28:	000b0a13          	mv	s4,s6
    2c2c:	00070493          	mv	s1,a4
    2c30:	00040b13          	mv	s6,s0
    2c34:	00078413          	mv	s0,a5
    2c38:	016484b3          	add	s1,s1,s6
    2c3c:	00160613          	add	a2,a2,1
    2c40:	00542023          	sw	t0,0(s0)
    2c44:	01642223          	sw	s6,4(s0)
    2c48:	0a912423          	sw	s1,168(sp)
    2c4c:	0ac12223          	sw	a2,164(sp)
    2c50:	00700713          	li	a4,7
    2c54:	00840413          	add	s0,s0,8
    2c58:	b8c75263          	bge	a4,a2,1fdc <_vfprintf_r+0x2d0>
    2c5c:	00812583          	lw	a1,8(sp)
    2c60:	0a010613          	add	a2,sp,160
    2c64:	00098513          	mv	a0,s3
    2c68:	04612a23          	sw	t1,84(sp)
    2c6c:	05c12823          	sw	t3,80(sp)
    2c70:	05d12223          	sw	t4,68(sp)
    2c74:	755010ef          	jal	4bc8 <__sprint_r>
    2c78:	d6051263          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2c7c:	0a812483          	lw	s1,168(sp)
    2c80:	05412303          	lw	t1,84(sp)
    2c84:	05012e03          	lw	t3,80(sp)
    2c88:	04412e83          	lw	t4,68(sp)
    2c8c:	0ac10413          	add	s0,sp,172
    2c90:	b4cff06f          	j	1fdc <_vfprintf_r+0x2d0>
    2c94:	01000713          	li	a4,16
    2c98:	0a412603          	lw	a2,164(sp)
    2c9c:	0000c297          	auipc	t0,0xc
    2ca0:	74c28293          	add	t0,t0,1868 # f3e8 <zeroes.0>
    2ca4:	0b675063          	bge	a4,s6,2d44 <_vfprintf_r+0x1038>
    2ca8:	00040793          	mv	a5,s0
    2cac:	00048693          	mv	a3,s1
    2cb0:	000b0413          	mv	s0,s6
    2cb4:	01000713          	li	a4,16
    2cb8:	00700893          	li	a7,7
    2cbc:	05d12223          	sw	t4,68(sp)
    2cc0:	000e0493          	mv	s1,t3
    2cc4:	00028b13          	mv	s6,t0
    2cc8:	00c0006f          	j	2cd4 <_vfprintf_r+0xfc8>
    2ccc:	ff040413          	add	s0,s0,-16
    2cd0:	04875e63          	bge	a4,s0,2d2c <_vfprintf_r+0x1020>
    2cd4:	01068693          	add	a3,a3,16
    2cd8:	00160613          	add	a2,a2,1
    2cdc:	0000c597          	auipc	a1,0xc
    2ce0:	70c58593          	add	a1,a1,1804 # f3e8 <zeroes.0>
    2ce4:	00b7a023          	sw	a1,0(a5)
    2ce8:	00e7a223          	sw	a4,4(a5)
    2cec:	0ad12423          	sw	a3,168(sp)
    2cf0:	0ac12223          	sw	a2,164(sp)
    2cf4:	00878793          	add	a5,a5,8
    2cf8:	fcc8dae3          	bge	a7,a2,2ccc <_vfprintf_r+0xfc0>
    2cfc:	00812583          	lw	a1,8(sp)
    2d00:	0a010613          	add	a2,sp,160
    2d04:	00098513          	mv	a0,s3
    2d08:	6c1010ef          	jal	4bc8 <__sprint_r>
    2d0c:	cc051863          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2d10:	01000713          	li	a4,16
    2d14:	ff040413          	add	s0,s0,-16
    2d18:	0a812683          	lw	a3,168(sp)
    2d1c:	0a412603          	lw	a2,164(sp)
    2d20:	0ac10793          	add	a5,sp,172
    2d24:	00700893          	li	a7,7
    2d28:	fa8746e3          	blt	a4,s0,2cd4 <_vfprintf_r+0xfc8>
    2d2c:	04412e83          	lw	t4,68(sp)
    2d30:	00048e13          	mv	t3,s1
    2d34:	000b0293          	mv	t0,s6
    2d38:	00068493          	mv	s1,a3
    2d3c:	00040b13          	mv	s6,s0
    2d40:	00078413          	mv	s0,a5
    2d44:	016484b3          	add	s1,s1,s6
    2d48:	00160613          	add	a2,a2,1
    2d4c:	00542023          	sw	t0,0(s0)
    2d50:	01642223          	sw	s6,4(s0)
    2d54:	0a912423          	sw	s1,168(sp)
    2d58:	0ac12223          	sw	a2,164(sp)
    2d5c:	00700713          	li	a4,7
    2d60:	00840413          	add	s0,s0,8
    2d64:	a8c75063          	bge	a4,a2,1fe4 <_vfprintf_r+0x2d8>
    2d68:	00812583          	lw	a1,8(sp)
    2d6c:	0a010613          	add	a2,sp,160
    2d70:	00098513          	mv	a0,s3
    2d74:	05c12823          	sw	t3,80(sp)
    2d78:	05d12223          	sw	t4,68(sp)
    2d7c:	64d010ef          	jal	4bc8 <__sprint_r>
    2d80:	c4051e63          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2d84:	0a812483          	lw	s1,168(sp)
    2d88:	05012e03          	lw	t3,80(sp)
    2d8c:	04412e83          	lw	t4,68(sp)
    2d90:	0ac10413          	add	s0,sp,172
    2d94:	a50ff06f          	j	1fe4 <_vfprintf_r+0x2d8>
    2d98:	00812583          	lw	a1,8(sp)
    2d9c:	0a010613          	add	a2,sp,160
    2da0:	00098513          	mv	a0,s3
    2da4:	04612c23          	sw	t1,88(sp)
    2da8:	05c12a23          	sw	t3,84(sp)
    2dac:	05d12823          	sw	t4,80(sp)
    2db0:	05f12223          	sw	t6,68(sp)
    2db4:	615010ef          	jal	4bc8 <__sprint_r>
    2db8:	c2051263          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2dbc:	0a812483          	lw	s1,168(sp)
    2dc0:	05812303          	lw	t1,88(sp)
    2dc4:	05412e03          	lw	t3,84(sp)
    2dc8:	05012e83          	lw	t4,80(sp)
    2dcc:	04412f83          	lw	t6,68(sp)
    2dd0:	0ac10413          	add	s0,sp,172
    2dd4:	a00ff06f          	j	1fd4 <_vfprintf_r+0x2c8>
    2dd8:	01000713          	li	a4,16
    2ddc:	0a412783          	lw	a5,164(sp)
    2de0:	0000cb17          	auipc	s6,0xc
    2de4:	618b0b13          	add	s6,s6,1560 # f3f8 <blanks.1>
    2de8:	07a75c63          	bge	a4,s10,2e60 <_vfprintf_r+0x1154>
    2dec:	000b0713          	mv	a4,s6
    2df0:	01000c13          	li	s8,16
    2df4:	00090b13          	mv	s6,s2
    2df8:	00700a13          	li	s4,7
    2dfc:	00070913          	mv	s2,a4
    2e00:	00c0006f          	j	2e0c <_vfprintf_r+0x1100>
    2e04:	ff0d0d13          	add	s10,s10,-16
    2e08:	05ac5663          	bge	s8,s10,2e54 <_vfprintf_r+0x1148>
    2e0c:	01048493          	add	s1,s1,16
    2e10:	00178793          	add	a5,a5,1
    2e14:	01242023          	sw	s2,0(s0)
    2e18:	01842223          	sw	s8,4(s0)
    2e1c:	0a912423          	sw	s1,168(sp)
    2e20:	0af12223          	sw	a5,164(sp)
    2e24:	00840413          	add	s0,s0,8
    2e28:	fcfa5ee3          	bge	s4,a5,2e04 <_vfprintf_r+0x10f8>
    2e2c:	00812583          	lw	a1,8(sp)
    2e30:	0a010613          	add	a2,sp,160
    2e34:	00098513          	mv	a0,s3
    2e38:	591010ef          	jal	4bc8 <__sprint_r>
    2e3c:	ba051063          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2e40:	ff0d0d13          	add	s10,s10,-16
    2e44:	0a812483          	lw	s1,168(sp)
    2e48:	0a412783          	lw	a5,164(sp)
    2e4c:	0ac10413          	add	s0,sp,172
    2e50:	fbac4ee3          	blt	s8,s10,2e0c <_vfprintf_r+0x1100>
    2e54:	00090713          	mv	a4,s2
    2e58:	000b0913          	mv	s2,s6
    2e5c:	00070b13          	mv	s6,a4
    2e60:	01a484b3          	add	s1,s1,s10
    2e64:	00178793          	add	a5,a5,1
    2e68:	01642023          	sw	s6,0(s0)
    2e6c:	01a42223          	sw	s10,4(s0)
    2e70:	0a912423          	sw	s1,168(sp)
    2e74:	0af12223          	sw	a5,164(sp)
    2e78:	00700713          	li	a4,7
    2e7c:	9af75463          	bge	a4,a5,2024 <_vfprintf_r+0x318>
    2e80:	00812583          	lw	a1,8(sp)
    2e84:	0a010613          	add	a2,sp,160
    2e88:	00098513          	mv	a0,s3
    2e8c:	53d010ef          	jal	4bc8 <__sprint_r>
    2e90:	b4051663          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2e94:	0a812483          	lw	s1,168(sp)
    2e98:	98cff06f          	j	2024 <_vfprintf_r+0x318>
    2e9c:	07c12683          	lw	a3,124(sp)
    2ea0:	30d05c63          	blez	a3,31b8 <_vfprintf_r+0x14ac>
    2ea4:	01812783          	lw	a5,24(sp)
    2ea8:	000a0b13          	mv	s6,s4
    2eac:	0147d463          	bge	a5,s4,2eb4 <_vfprintf_r+0x11a8>
    2eb0:	00078b13          	mv	s6,a5
    2eb4:	03605863          	blez	s6,2ee4 <_vfprintf_r+0x11d8>
    2eb8:	0a412683          	lw	a3,164(sp)
    2ebc:	016484b3          	add	s1,s1,s6
    2ec0:	01842023          	sw	s8,0(s0)
    2ec4:	00168693          	add	a3,a3,1
    2ec8:	01642223          	sw	s6,4(s0)
    2ecc:	0a912423          	sw	s1,168(sp)
    2ed0:	0ad12223          	sw	a3,164(sp)
    2ed4:	00700613          	li	a2,7
    2ed8:	00840413          	add	s0,s0,8
    2edc:	00d65463          	bge	a2,a3,2ee4 <_vfprintf_r+0x11d8>
    2ee0:	5c40106f          	j	44a4 <_vfprintf_r+0x2798>
    2ee4:	fffb4693          	not	a3,s6
    2ee8:	41f6d693          	sra	a3,a3,0x1f
    2eec:	00db7733          	and	a4,s6,a3
    2ef0:	40ea0b33          	sub	s6,s4,a4
    2ef4:	35604ae3          	bgtz	s6,3a48 <_vfprintf_r+0x1d3c>
    2ef8:	400ef713          	and	a4,t4,1024
    2efc:	014c0333          	add	t1,s8,s4
    2f00:	00070463          	beqz	a4,2f08 <_vfprintf_r+0x11fc>
    2f04:	2980106f          	j	419c <_vfprintf_r+0x2490>
    2f08:	07c12d03          	lw	s10,124(sp)
    2f0c:	01812783          	lw	a5,24(sp)
    2f10:	5afd4063          	blt	s10,a5,34b0 <_vfprintf_r+0x17a4>
    2f14:	001ef713          	and	a4,t4,1
    2f18:	58071c63          	bnez	a4,34b0 <_vfprintf_r+0x17a4>
    2f1c:	01812703          	lw	a4,24(sp)
    2f20:	00ec07b3          	add	a5,s8,a4
    2f24:	41a70d33          	sub	s10,a4,s10
    2f28:	40678b33          	sub	s6,a5,t1
    2f2c:	016d5463          	bge	s10,s6,2f34 <_vfprintf_r+0x1228>
    2f30:	000d0b13          	mv	s6,s10
    2f34:	03605863          	blez	s6,2f64 <_vfprintf_r+0x1258>
    2f38:	0a412703          	lw	a4,164(sp)
    2f3c:	016484b3          	add	s1,s1,s6
    2f40:	00642023          	sw	t1,0(s0)
    2f44:	00170713          	add	a4,a4,1
    2f48:	01642223          	sw	s6,4(s0)
    2f4c:	0a912423          	sw	s1,168(sp)
    2f50:	0ae12223          	sw	a4,164(sp)
    2f54:	00700693          	li	a3,7
    2f58:	00840413          	add	s0,s0,8
    2f5c:	00e6d463          	bge	a3,a4,2f64 <_vfprintf_r+0x1258>
    2f60:	5880106f          	j	44e8 <_vfprintf_r+0x27dc>
    2f64:	fffb4713          	not	a4,s6
    2f68:	41f75713          	sra	a4,a4,0x1f
    2f6c:	00eb77b3          	and	a5,s6,a4
    2f70:	40fd0d33          	sub	s10,s10,a5
    2f74:	8ba05063          	blez	s10,2014 <_vfprintf_r+0x308>
    2f78:	01000713          	li	a4,16
    2f7c:	0a412783          	lw	a5,164(sp)
    2f80:	0000c297          	auipc	t0,0xc
    2f84:	46828293          	add	t0,t0,1128 # f3e8 <zeroes.0>
    2f88:	23a750e3          	bge	a4,s10,39a8 <_vfprintf_r+0x1c9c>
    2f8c:	00048713          	mv	a4,s1
    2f90:	01000c13          	li	s8,16
    2f94:	00700b13          	li	s6,7
    2f98:	000e8493          	mv	s1,t4
    2f9c:	00028a13          	mv	s4,t0
    2fa0:	00c0006f          	j	2fac <_vfprintf_r+0x12a0>
    2fa4:	ff0d0d13          	add	s10,s10,-16
    2fa8:	1fac5ae3          	bge	s8,s10,399c <_vfprintf_r+0x1c90>
    2fac:	01070713          	add	a4,a4,16
    2fb0:	00178793          	add	a5,a5,1
    2fb4:	01442023          	sw	s4,0(s0)
    2fb8:	01842223          	sw	s8,4(s0)
    2fbc:	0ae12423          	sw	a4,168(sp)
    2fc0:	0af12223          	sw	a5,164(sp)
    2fc4:	00840413          	add	s0,s0,8
    2fc8:	fcfb5ee3          	bge	s6,a5,2fa4 <_vfprintf_r+0x1298>
    2fcc:	00812583          	lw	a1,8(sp)
    2fd0:	0a010613          	add	a2,sp,160
    2fd4:	00098513          	mv	a0,s3
    2fd8:	3f1010ef          	jal	4bc8 <__sprint_r>
    2fdc:	a0051063          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    2fe0:	0a812703          	lw	a4,168(sp)
    2fe4:	0a412783          	lw	a5,164(sp)
    2fe8:	0ac10413          	add	s0,sp,172
    2fec:	fb9ff06f          	j	2fa4 <_vfprintf_r+0x1298>
    2ff0:	001ef613          	and	a2,t4,1
    2ff4:	ce061063          	bnez	a2,24d4 <_vfprintf_r+0x7c8>
    2ff8:	00d42223          	sw	a3,4(s0)
    2ffc:	0a912423          	sw	s1,168(sp)
    3000:	0ba12223          	sw	s10,164(sp)
    3004:	00700793          	li	a5,7
    3008:	d7a7d863          	bge	a5,s10,2578 <_vfprintf_r+0x86c>
    300c:	00812583          	lw	a1,8(sp)
    3010:	0a010613          	add	a2,sp,160
    3014:	00098513          	mv	a0,s3
    3018:	03d12023          	sw	t4,32(sp)
    301c:	3ad010ef          	jal	4bc8 <__sprint_r>
    3020:	9a051e63          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    3024:	0a812483          	lw	s1,168(sp)
    3028:	0a412d03          	lw	s10,164(sp)
    302c:	02012e83          	lw	t4,32(sp)
    3030:	0ac10b13          	add	s6,sp,172
    3034:	d44ff06f          	j	2578 <_vfprintf_r+0x86c>
    3038:	01812703          	lw	a4,24(sp)
    303c:	00100793          	li	a5,1
    3040:	d2e7dc63          	bge	a5,a4,2578 <_vfprintf_r+0x86c>
    3044:	01100793          	li	a5,17
    3048:	0000c297          	auipc	t0,0xc
    304c:	3a028293          	add	t0,t0,928 # f3e8 <zeroes.0>
    3050:	18e7d4e3          	bge	a5,a4,39d8 <_vfprintf_r+0x1ccc>
    3054:	00040a13          	mv	s4,s0
    3058:	01000793          	li	a5,16
    305c:	00700c13          	li	s8,7
    3060:	03d12023          	sw	t4,32(sp)
    3064:	00028413          	mv	s0,t0
    3068:	00c0006f          	j	3074 <_vfprintf_r+0x1368>
    306c:	ff0a0a13          	add	s4,s4,-16
    3070:	1547dee3          	bge	a5,s4,39cc <_vfprintf_r+0x1cc0>
    3074:	01048493          	add	s1,s1,16
    3078:	001d0d13          	add	s10,s10,1
    307c:	008b2023          	sw	s0,0(s6)
    3080:	00fb2223          	sw	a5,4(s6)
    3084:	0a912423          	sw	s1,168(sp)
    3088:	0ba12223          	sw	s10,164(sp)
    308c:	008b0b13          	add	s6,s6,8
    3090:	fdac5ee3          	bge	s8,s10,306c <_vfprintf_r+0x1360>
    3094:	00812583          	lw	a1,8(sp)
    3098:	0a010613          	add	a2,sp,160
    309c:	00098513          	mv	a0,s3
    30a0:	329010ef          	jal	4bc8 <__sprint_r>
    30a4:	92051c63          	bnez	a0,21dc <_vfprintf_r+0x4d0>
    30a8:	0a812483          	lw	s1,168(sp)
    30ac:	0a412d03          	lw	s10,164(sp)
    30b0:	0ac10b13          	add	s6,sp,172
    30b4:	01000793          	li	a5,16
    30b8:	fb5ff06f          	j	306c <_vfprintf_r+0x1360>
    30bc:	01412703          	lw	a4,20(sp)
    30c0:	010ef793          	and	a5,t4,16
    30c4:	00072d03          	lw	s10,0(a4)
    30c8:	00470713          	add	a4,a4,4
    30cc:	00e12a23          	sw	a4,20(sp)
    30d0:	1a079663          	bnez	a5,327c <_vfprintf_r+0x1570>
    30d4:	040ef793          	and	a5,t4,64
    30d8:	18078e63          	beqz	a5,3274 <_vfprintf_r+0x1568>
    30dc:	010d1d13          	sll	s10,s10,0x10
    30e0:	010d5d13          	srl	s10,s10,0x10
    30e4:	00000c93          	li	s9,0
    30e8:	80dff06f          	j	28f4 <_vfprintf_r+0xbe8>
    30ec:	01412703          	lw	a4,20(sp)
    30f0:	01067793          	and	a5,a2,16
    30f4:	00072d03          	lw	s10,0(a4)
    30f8:	00470713          	add	a4,a4,4
    30fc:	00e12a23          	sw	a4,20(sp)
    3100:	14079a63          	bnez	a5,3254 <_vfprintf_r+0x1548>
    3104:	04067793          	and	a5,a2,64
    3108:	14078063          	beqz	a5,3248 <_vfprintf_r+0x153c>
    310c:	010d1d13          	sll	s10,s10,0x10
    3110:	010d5d13          	srl	s10,s10,0x10
    3114:	00000c93          	li	s9,0
    3118:	00100793          	li	a5,1
    311c:	e34ff06f          	j	2750 <_vfprintf_r+0xa44>
    3120:	01412703          	lw	a4,20(sp)
    3124:	010ef793          	and	a5,t4,16
    3128:	00072d03          	lw	s10,0(a4)
    312c:	00470713          	add	a4,a4,4
    3130:	00e12a23          	sw	a4,20(sp)
    3134:	12079a63          	bnez	a5,3268 <_vfprintf_r+0x155c>
    3138:	040ef793          	and	a5,t4,64
    313c:	12078263          	beqz	a5,3260 <_vfprintf_r+0x1554>
    3140:	010d1d13          	sll	s10,s10,0x10
    3144:	410d5d13          	sra	s10,s10,0x10
    3148:	41fd5c93          	sra	s9,s10,0x1f
    314c:	000c8793          	mv	a5,s9
    3150:	f207d663          	bgez	a5,287c <_vfprintf_r+0xb70>
    3154:	01a037b3          	snez	a5,s10
    3158:	419000b3          	neg	ra,s9
    315c:	40f08cb3          	sub	s9,ra,a5
    3160:	41a00d33          	neg	s10,s10
    3164:	000e8613          	mv	a2,t4
    3168:	02d00713          	li	a4,45
    316c:	00100793          	li	a5,1
    3170:	de4ff06f          	j	2754 <_vfprintf_r+0xa48>
    3174:	00812403          	lw	s0,8(sp)
    3178:	00f12623          	sw	a5,12(sp)
    317c:	05842503          	lw	a0,88(s0)
    3180:	c31fd0ef          	jal	db0 <__retarget_lock_acquire_recursive>
    3184:	00c41703          	lh	a4,12(s0)
    3188:	00c12783          	lw	a5,12(sp)
    318c:	c01fe06f          	j	1d8c <_vfprintf_r+0x80>
    3190:	001ef793          	and	a5,t4,1
    3194:	00079463          	bnez	a5,319c <_vfprintf_r+0x1490>
    3198:	e7dfe06f          	j	2014 <_vfprintf_r+0x308>
    319c:	85dff06f          	j	29f8 <_vfprintf_r+0xcec>
    31a0:	000a0e93          	mv	t4,s4
    31a4:	000b0313          	mv	t1,s6
    31a8:	ea8ff06f          	j	2850 <_vfprintf_r+0xb44>
    31ac:	00094e03          	lbu	t3,0(s2)
    31b0:	00f12a23          	sw	a5,20(sp)
    31b4:	d09fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    31b8:	0a412703          	lw	a4,164(sp)
    31bc:	0000c617          	auipc	a2,0xc
    31c0:	d7460613          	add	a2,a2,-652 # ef30 <__fini_array_end+0x1d4>
    31c4:	00c42023          	sw	a2,0(s0)
    31c8:	00148493          	add	s1,s1,1
    31cc:	00100613          	li	a2,1
    31d0:	00170713          	add	a4,a4,1
    31d4:	00c42223          	sw	a2,4(s0)
    31d8:	0a912423          	sw	s1,168(sp)
    31dc:	0ae12223          	sw	a4,164(sp)
    31e0:	00700613          	li	a2,7
    31e4:	00840413          	add	s0,s0,8
    31e8:	2ee64ce3          	blt	a2,a4,3ce0 <_vfprintf_r+0x1fd4>
    31ec:	7e069e63          	bnez	a3,39e8 <_vfprintf_r+0x1cdc>
    31f0:	01812783          	lw	a5,24(sp)
    31f4:	001ef713          	and	a4,t4,1
    31f8:	00f76733          	or	a4,a4,a5
    31fc:	00071463          	bnez	a4,3204 <_vfprintf_r+0x14f8>
    3200:	e15fe06f          	j	2014 <_vfprintf_r+0x308>
    3204:	03412703          	lw	a4,52(sp)
    3208:	03012783          	lw	a5,48(sp)
    320c:	00700693          	li	a3,7
    3210:	00e42023          	sw	a4,0(s0)
    3214:	0a412703          	lw	a4,164(sp)
    3218:	009784b3          	add	s1,a5,s1
    321c:	00f42223          	sw	a5,4(s0)
    3220:	00170713          	add	a4,a4,1
    3224:	0a912423          	sw	s1,168(sp)
    3228:	0ae12223          	sw	a4,164(sp)
    322c:	38e6c8e3          	blt	a3,a4,3dbc <_vfprintf_r+0x20b0>
    3230:	00840413          	add	s0,s0,8
    3234:	7e80006f          	j	3a1c <_vfprintf_r+0x1d10>
    3238:	03000793          	li	a5,48
    323c:	14f107a3          	sb	a5,335(sp)
    3240:	14f10c13          	add	s8,sp,335
    3244:	d38ff06f          	j	277c <_vfprintf_r+0xa70>
    3248:	20067793          	and	a5,a2,512
    324c:	00078463          	beqz	a5,3254 <_vfprintf_r+0x1548>
    3250:	0ffd7d13          	zext.b	s10,s10
    3254:	00000c93          	li	s9,0
    3258:	00100793          	li	a5,1
    325c:	cf4ff06f          	j	2750 <_vfprintf_r+0xa44>
    3260:	200ef793          	and	a5,t4,512
    3264:	2c0796e3          	bnez	a5,3d30 <_vfprintf_r+0x2024>
    3268:	41fd5c93          	sra	s9,s10,0x1f
    326c:	000c8793          	mv	a5,s9
    3270:	e08ff06f          	j	2878 <_vfprintf_r+0xb6c>
    3274:	200ef793          	and	a5,t4,512
    3278:	2a0790e3          	bnez	a5,3d18 <_vfprintf_r+0x200c>
    327c:	00000c93          	li	s9,0
    3280:	e74ff06f          	j	28f4 <_vfprintf_r+0xbe8>
    3284:	01412783          	lw	a5,20(sp)
    3288:	06010513          	add	a0,sp,96
    328c:	03612223          	sw	s6,36(sp)
    3290:	0007a703          	lw	a4,0(a5)
    3294:	03c12023          	sw	t3,32(sp)
    3298:	00478b13          	add	s6,a5,4
    329c:	00072683          	lw	a3,0(a4)
    32a0:	01412823          	sw	s4,16(sp)
    32a4:	06d12023          	sw	a3,96(sp)
    32a8:	00472683          	lw	a3,4(a4)
    32ac:	06d12223          	sw	a3,100(sp)
    32b0:	00872683          	lw	a3,8(a4)
    32b4:	06d12423          	sw	a3,104(sp)
    32b8:	00c72703          	lw	a4,12(a4)
    32bc:	06e12623          	sw	a4,108(sp)
    32c0:	4c80b0ef          	jal	e788 <__trunctfdf2>
    32c4:	02012e03          	lw	t3,32(sp)
    32c8:	02412303          	lw	t1,36(sp)
    32cc:	02a12423          	sw	a0,40(sp)
    32d0:	02b12623          	sw	a1,44(sp)
    32d4:	01612a23          	sw	s6,20(sp)
    32d8:	000a0e93          	mv	t4,s4
    32dc:	fb1fe06f          	j	228c <_vfprintf_r+0x580>
    32e0:	010a7793          	and	a5,s4,16
    32e4:	6c079a63          	bnez	a5,39b8 <_vfprintf_r+0x1cac>
    32e8:	040a7793          	and	a5,s4,64
    32ec:	24079ce3          	bnez	a5,3d44 <_vfprintf_r+0x2038>
    32f0:	200a7f13          	and	t5,s4,512
    32f4:	6c0f0263          	beqz	t5,39b8 <_vfprintf_r+0x1cac>
    32f8:	01412783          	lw	a5,20(sp)
    32fc:	00c12703          	lw	a4,12(sp)
    3300:	0007a783          	lw	a5,0(a5)
    3304:	00e78023          	sb	a4,0(a5)
    3308:	e6cff06f          	j	2974 <_vfprintf_r+0xc68>
    330c:	03c12783          	lw	a5,60(sp)
    3310:	00094e03          	lbu	t3,0(s2)
    3314:	00079463          	bnez	a5,331c <_vfprintf_r+0x1610>
    3318:	ba5fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    331c:	0007c783          	lbu	a5,0(a5)
    3320:	00079463          	bnez	a5,3328 <_vfprintf_r+0x161c>
    3324:	b99fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    3328:	400a6a13          	or	s4,s4,1024
    332c:	b91fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    3330:	fff00b13          	li	s6,-1
    3334:	00068913          	mv	s2,a3
    3338:	b89fe06f          	j	1ec0 <_vfprintf_r+0x1b4>
    333c:	0000c797          	auipc	a5,0xc
    3340:	bd878793          	add	a5,a5,-1064 # ef14 <__fini_array_end+0x1b8>
    3344:	000a0e93          	mv	t4,s4
    3348:	000b0313          	mv	t1,s6
    334c:	02f12c23          	sw	a5,56(sp)
    3350:	020ef793          	and	a5,t4,32
    3354:	1c078263          	beqz	a5,3518 <_vfprintf_r+0x180c>
    3358:	01412783          	lw	a5,20(sp)
    335c:	00778b13          	add	s6,a5,7
    3360:	ff8b7b13          	and	s6,s6,-8
    3364:	000b2d03          	lw	s10,0(s6)
    3368:	004b2c83          	lw	s9,4(s6)
    336c:	008b0793          	add	a5,s6,8
    3370:	00f12a23          	sw	a5,20(sp)
    3374:	001ef793          	and	a5,t4,1
    3378:	00078e63          	beqz	a5,3394 <_vfprintf_r+0x1688>
    337c:	019d67b3          	or	a5,s10,s9
    3380:	00078a63          	beqz	a5,3394 <_vfprintf_r+0x1688>
    3384:	03000793          	li	a5,48
    3388:	06f10c23          	sb	a5,120(sp)
    338c:	07c10ca3          	sb	t3,121(sp)
    3390:	002eee93          	or	t4,t4,2
    3394:	bffef613          	and	a2,t4,-1025
    3398:	00200793          	li	a5,2
    339c:	bb4ff06f          	j	2750 <_vfprintf_r+0xa44>
    33a0:	000b0313          	mv	t1,s6
    33a4:	000a0613          	mv	a2,s4
    33a8:	b80ff06f          	j	2728 <_vfprintf_r+0xa1c>
    33ac:	000a0e93          	mv	t4,s4
    33b0:	000b0313          	mv	t1,s6
    33b4:	d1cff06f          	j	28d0 <_vfprintf_r+0xbc4>
    33b8:	0000c797          	auipc	a5,0xc
    33bc:	b4878793          	add	a5,a5,-1208 # ef00 <__fini_array_end+0x1a4>
    33c0:	000a0e93          	mv	t4,s4
    33c4:	000b0313          	mv	t1,s6
    33c8:	02f12c23          	sw	a5,56(sp)
    33cc:	f85ff06f          	j	3350 <_vfprintf_r+0x1644>
    33d0:	00194e03          	lbu	t3,1(s2)
    33d4:	020a6a13          	or	s4,s4,32
    33d8:	00190913          	add	s2,s2,1
    33dc:	ae1fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    33e0:	00194e03          	lbu	t3,1(s2)
    33e4:	200a6a13          	or	s4,s4,512
    33e8:	00190913          	add	s2,s2,1
    33ec:	ad1fe06f          	j	1ebc <_vfprintf_r+0x1b0>
    33f0:	00812583          	lw	a1,8(sp)
    33f4:	0a010613          	add	a2,sp,160
    33f8:	00098513          	mv	a0,s3
    33fc:	03d12023          	sw	t4,32(sp)
    3400:	7c8010ef          	jal	4bc8 <__sprint_r>
    3404:	00050463          	beqz	a0,340c <_vfprintf_r+0x1700>
    3408:	dd5fe06f          	j	21dc <_vfprintf_r+0x4d0>
    340c:	0a812483          	lw	s1,168(sp)
    3410:	02012e83          	lw	t4,32(sp)
    3414:	0ac10413          	add	s0,sp,172
    3418:	e10ff06f          	j	2a28 <_vfprintf_r+0xd1c>
    341c:	00600793          	li	a5,6
    3420:	00030c93          	mv	s9,t1
    3424:	0e67e6e3          	bltu	a5,t1,3d10 <_vfprintf_r+0x2004>
    3428:	01612a23          	sw	s6,20(sp)
    342c:	00012823          	sw	zero,16(sp)
    3430:	000c8d13          	mv	s10,s9
    3434:	00000613          	li	a2,0
    3438:	00000313          	li	t1,0
    343c:	02012223          	sw	zero,36(sp)
    3440:	02012023          	sw	zero,32(sp)
    3444:	00000a13          	li	s4,0
    3448:	0000cc17          	auipc	s8,0xc
    344c:	ae0c0c13          	add	s8,s8,-1312 # ef28 <__fini_array_end+0x1cc>
    3450:	afdfe06f          	j	1f4c <_vfprintf_r+0x240>
    3454:	00800613          	li	a2,8
    3458:	00000593          	li	a1,0
    345c:	09810513          	add	a0,sp,152
    3460:	03c12023          	sw	t3,32(sp)
    3464:	01d12823          	sw	t4,16(sp)
    3468:	951fd0ef          	jal	db8 <memset>
    346c:	01412783          	lw	a5,20(sp)
    3470:	0ec10c13          	add	s8,sp,236
    3474:	09810693          	add	a3,sp,152
    3478:	0007a603          	lw	a2,0(a5)
    347c:	000c0593          	mv	a1,s8
    3480:	00098513          	mv	a0,s3
    3484:	530070ef          	jal	a9b4 <_wcrtomb_r>
    3488:	fff00793          	li	a5,-1
    348c:	01012e83          	lw	t4,16(sp)
    3490:	02012e03          	lw	t3,32(sp)
    3494:	00050d13          	mv	s10,a0
    3498:	00f51463          	bne	a0,a5,34a0 <_vfprintf_r+0x1794>
    349c:	4980106f          	j	4934 <_vfprintf_r+0x2c28>
    34a0:	fff54813          	not	a6,a0
    34a4:	41f85813          	sra	a6,a6,0x1f
    34a8:	01057cb3          	and	s9,a0,a6
    34ac:	97cff06f          	j	2628 <_vfprintf_r+0x91c>
    34b0:	03412703          	lw	a4,52(sp)
    34b4:	03012783          	lw	a5,48(sp)
    34b8:	00700693          	li	a3,7
    34bc:	00e42023          	sw	a4,0(s0)
    34c0:	0a412703          	lw	a4,164(sp)
    34c4:	00f484b3          	add	s1,s1,a5
    34c8:	00f42223          	sw	a5,4(s0)
    34cc:	00170713          	add	a4,a4,1
    34d0:	0a912423          	sw	s1,168(sp)
    34d4:	0ae12223          	sw	a4,164(sp)
    34d8:	00840413          	add	s0,s0,8
    34dc:	a4e6d0e3          	bge	a3,a4,2f1c <_vfprintf_r+0x1210>
    34e0:	00812583          	lw	a1,8(sp)
    34e4:	0a010613          	add	a2,sp,160
    34e8:	00098513          	mv	a0,s3
    34ec:	02612223          	sw	t1,36(sp)
    34f0:	03d12023          	sw	t4,32(sp)
    34f4:	6d4010ef          	jal	4bc8 <__sprint_r>
    34f8:	00050463          	beqz	a0,3500 <_vfprintf_r+0x17f4>
    34fc:	ce1fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3500:	07c12d03          	lw	s10,124(sp)
    3504:	0a812483          	lw	s1,168(sp)
    3508:	02412303          	lw	t1,36(sp)
    350c:	02012e83          	lw	t4,32(sp)
    3510:	0ac10413          	add	s0,sp,172
    3514:	a09ff06f          	j	2f1c <_vfprintf_r+0x1210>
    3518:	01412703          	lw	a4,20(sp)
    351c:	010ef793          	and	a5,t4,16
    3520:	00072d03          	lw	s10,0(a4)
    3524:	00470713          	add	a4,a4,4
    3528:	00e12a23          	sw	a4,20(sp)
    352c:	08079863          	bnez	a5,35bc <_vfprintf_r+0x18b0>
    3530:	040ef793          	and	a5,t4,64
    3534:	08078063          	beqz	a5,35b4 <_vfprintf_r+0x18a8>
    3538:	010d1d13          	sll	s10,s10,0x10
    353c:	010d5d13          	srl	s10,s10,0x10
    3540:	00000c93          	li	s9,0
    3544:	e31ff06f          	j	3374 <_vfprintf_r+0x1668>
    3548:	00000d13          	li	s10,0
    354c:	15010c13          	add	s8,sp,336
    3550:	a2cff06f          	j	277c <_vfprintf_r+0xa70>
    3554:	00812583          	lw	a1,8(sp)
    3558:	0a010613          	add	a2,sp,160
    355c:	00098513          	mv	a0,s3
    3560:	03d12023          	sw	t4,32(sp)
    3564:	664010ef          	jal	4bc8 <__sprint_r>
    3568:	00050463          	beqz	a0,3570 <_vfprintf_r+0x1864>
    356c:	c71fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3570:	0a812483          	lw	s1,168(sp)
    3574:	0a412d03          	lw	s10,164(sp)
    3578:	02012e83          	lw	t4,32(sp)
    357c:	0ac10b13          	add	s6,sp,172
    3580:	f71fe06f          	j	24f0 <_vfprintf_r+0x7e4>
    3584:	00812583          	lw	a1,8(sp)
    3588:	0a010613          	add	a2,sp,160
    358c:	00098513          	mv	a0,s3
    3590:	03d12023          	sw	t4,32(sp)
    3594:	634010ef          	jal	4bc8 <__sprint_r>
    3598:	00050463          	beqz	a0,35a0 <_vfprintf_r+0x1894>
    359c:	c41fe06f          	j	21dc <_vfprintf_r+0x4d0>
    35a0:	0a812483          	lw	s1,168(sp)
    35a4:	0a412d03          	lw	s10,164(sp)
    35a8:	02012e83          	lw	t4,32(sp)
    35ac:	0ac10b13          	add	s6,sp,172
    35b0:	f71fe06f          	j	2520 <_vfprintf_r+0x814>
    35b4:	200ef793          	and	a5,t4,512
    35b8:	76079663          	bnez	a5,3d24 <_vfprintf_r+0x2018>
    35bc:	00000c93          	li	s9,0
    35c0:	db5ff06f          	j	3374 <_vfprintf_r+0x1668>
    35c4:	00000793          	li	a5,0
    35c8:	15010b13          	add	s6,sp,336
    35cc:	01212823          	sw	s2,16(sp)
    35d0:	00078913          	mv	s2,a5
    35d4:	00098793          	mv	a5,s3
    35d8:	04812823          	sw	s0,80(sp)
    35dc:	000b0993          	mv	s3,s6
    35e0:	03c12403          	lw	s0,60(sp)
    35e4:	40067493          	and	s1,a2,1024
    35e8:	0ff00a13          	li	s4,255
    35ec:	03c12023          	sw	t3,32(sp)
    35f0:	02c12223          	sw	a2,36(sp)
    35f4:	04612223          	sw	t1,68(sp)
    35f8:	00078b13          	mv	s6,a5
    35fc:	0280006f          	j	3624 <_vfprintf_r+0x1918>
    3600:	00a00613          	li	a2,10
    3604:	00000693          	li	a3,0
    3608:	000d0513          	mv	a0,s10
    360c:	000c8593          	mv	a1,s9
    3610:	581070ef          	jal	b390 <__udivdi3>
    3614:	6a0c8ee3          	beqz	s9,44d0 <_vfprintf_r+0x27c4>
    3618:	00050d13          	mv	s10,a0
    361c:	00058c93          	mv	s9,a1
    3620:	000c0993          	mv	s3,s8
    3624:	00a00613          	li	a2,10
    3628:	00000693          	li	a3,0
    362c:	000d0513          	mv	a0,s10
    3630:	000c8593          	mv	a1,s9
    3634:	408080ef          	jal	ba3c <__umoddi3>
    3638:	03050513          	add	a0,a0,48
    363c:	fea98fa3          	sb	a0,-1(s3)
    3640:	fff98c13          	add	s8,s3,-1
    3644:	00190913          	add	s2,s2,1
    3648:	fa048ce3          	beqz	s1,3600 <_vfprintf_r+0x18f4>
    364c:	00044783          	lbu	a5,0(s0)
    3650:	faf918e3          	bne	s2,a5,3600 <_vfprintf_r+0x18f4>
    3654:	fb4906e3          	beq	s2,s4,3600 <_vfprintf_r+0x18f4>
    3658:	560c9ae3          	bnez	s9,43cc <_vfprintf_r+0x26c0>
    365c:	00900793          	li	a5,9
    3660:	57a7e6e3          	bltu	a5,s10,43cc <_vfprintf_r+0x26c0>
    3664:	02412603          	lw	a2,36(sp)
    3668:	15010793          	add	a5,sp,336
    366c:	02812e23          	sw	s0,60(sp)
    3670:	01212c23          	sw	s2,24(sp)
    3674:	02012e03          	lw	t3,32(sp)
    3678:	01012903          	lw	s2,16(sp)
    367c:	04412303          	lw	t1,68(sp)
    3680:	05012403          	lw	s0,80(sp)
    3684:	000b0993          	mv	s3,s6
    3688:	41878d33          	sub	s10,a5,s8
    368c:	00060e93          	mv	t4,a2
    3690:	8ecff06f          	j	277c <_vfprintf_r+0xa70>
    3694:	00812583          	lw	a1,8(sp)
    3698:	0a010613          	add	a2,sp,160
    369c:	00098513          	mv	a0,s3
    36a0:	04612e23          	sw	t1,92(sp)
    36a4:	05c12c23          	sw	t3,88(sp)
    36a8:	05d12a23          	sw	t4,84(sp)
    36ac:	05f12823          	sw	t6,80(sp)
    36b0:	04512223          	sw	t0,68(sp)
    36b4:	514010ef          	jal	4bc8 <__sprint_r>
    36b8:	00050463          	beqz	a0,36c0 <_vfprintf_r+0x19b4>
    36bc:	b21fe06f          	j	21dc <_vfprintf_r+0x4d0>
    36c0:	07714603          	lbu	a2,119(sp)
    36c4:	0a812483          	lw	s1,168(sp)
    36c8:	05c12303          	lw	t1,92(sp)
    36cc:	05812e03          	lw	t3,88(sp)
    36d0:	05412e83          	lw	t4,84(sp)
    36d4:	05012f83          	lw	t6,80(sp)
    36d8:	04412283          	lw	t0,68(sp)
    36dc:	0ac10413          	add	s0,sp,172
    36e0:	88dfe06f          	j	1f6c <_vfprintf_r+0x260>
    36e4:	02812883          	lw	a7,40(sp)
    36e8:	02c12703          	lw	a4,44(sp)
    36ec:	02612223          	sw	t1,36(sp)
    36f0:	00088613          	mv	a2,a7
    36f4:	00088513          	mv	a0,a7
    36f8:	00070693          	mv	a3,a4
    36fc:	00070593          	mv	a1,a4
    3700:	03c12023          	sw	t3,32(sp)
    3704:	01d12823          	sw	t4,16(sp)
    3708:	62d0a0ef          	jal	e534 <__unorddf2>
    370c:	01012e83          	lw	t4,16(sp)
    3710:	02012e03          	lw	t3,32(sp)
    3714:	02412303          	lw	t1,36(sp)
    3718:	00050463          	beqz	a0,3720 <_vfprintf_r+0x1a14>
    371c:	0e00106f          	j	47fc <_vfprintf_r+0x2af0>
    3720:	06100713          	li	a4,97
    3724:	08ee0263          	beq	t3,a4,37a8 <_vfprintf_r+0x1a9c>
    3728:	04100713          	li	a4,65
    372c:	05800793          	li	a5,88
    3730:	06ee0e63          	beq	t3,a4,37ac <_vfprintf_r+0x1aa0>
    3734:	fff00713          	li	a4,-1
    3738:	00e31463          	bne	t1,a4,3740 <_vfprintf_r+0x1a34>
    373c:	01c0106f          	j	4758 <_vfprintf_r+0x2a4c>
    3740:	fdfe7713          	and	a4,t3,-33
    3744:	04700693          	li	a3,71
    3748:	00012823          	sw	zero,16(sp)
    374c:	00d71663          	bne	a4,a3,3758 <_vfprintf_r+0x1a4c>
    3750:	00031463          	bnez	t1,3758 <_vfprintf_r+0x1a4c>
    3754:	00100313          	li	t1,1
    3758:	100ee793          	or	a5,t4,256
    375c:	00078b13          	mv	s6,a5
    3760:	02c12783          	lw	a5,44(sp)
    3764:	04012223          	sw	zero,68(sp)
    3768:	00078493          	mv	s1,a5
    376c:	0007da63          	bgez	a5,3780 <_vfprintf_r+0x1a74>
    3770:	800004b7          	lui	s1,0x80000
    3774:	00f4c4b3          	xor	s1,s1,a5
    3778:	02d00793          	li	a5,45
    377c:	04f12223          	sw	a5,68(sp)
    3780:	fbfe0713          	add	a4,t3,-65
    3784:	02500693          	li	a3,37
    3788:	3ae6e463          	bltu	a3,a4,3b30 <_vfprintf_r+0x1e24>
    378c:	0000c697          	auipc	a3,0xc
    3790:	bc468693          	add	a3,a3,-1084 # f350 <_ctype_+0x270>
    3794:	00271713          	sll	a4,a4,0x2
    3798:	00d70733          	add	a4,a4,a3
    379c:	00072703          	lw	a4,0(a4)
    37a0:	00d70733          	add	a4,a4,a3
    37a4:	00070067          	jr	a4
    37a8:	07800793          	li	a5,120
    37ac:	03000713          	li	a4,48
    37b0:	06e10c23          	sb	a4,120(sp)
    37b4:	06f10ca3          	sb	a5,121(sp)
    37b8:	06300713          	li	a4,99
    37bc:	00012823          	sw	zero,16(sp)
    37c0:	002eee93          	or	t4,t4,2
    37c4:	0ec10c13          	add	s8,sp,236
    37c8:	f86758e3          	bge	a4,t1,3758 <_vfprintf_r+0x1a4c>
    37cc:	00130593          	add	a1,t1,1
    37d0:	00098513          	mv	a0,s3
    37d4:	03c12023          	sw	t3,32(sp)
    37d8:	01d12c23          	sw	t4,24(sp)
    37dc:	00612823          	sw	t1,16(sp)
    37e0:	d35fd0ef          	jal	1514 <_malloc_r>
    37e4:	01012303          	lw	t1,16(sp)
    37e8:	01812e83          	lw	t4,24(sp)
    37ec:	02012e03          	lw	t3,32(sp)
    37f0:	00050c13          	mv	s8,a0
    37f4:	00051463          	bnez	a0,37fc <_vfprintf_r+0x1af0>
    37f8:	13c0106f          	j	4934 <_vfprintf_r+0x2c28>
    37fc:	00a12823          	sw	a0,16(sp)
    3800:	f59ff06f          	j	3758 <_vfprintf_r+0x1a4c>
    3804:	00098513          	mv	a0,s3
    3808:	1d0030ef          	jal	69d8 <__sinit>
    380c:	00c12783          	lw	a5,12(sp)
    3810:	d5cfe06f          	j	1d6c <_vfprintf_r+0x60>
    3814:	00812583          	lw	a1,8(sp)
    3818:	0a010613          	add	a2,sp,160
    381c:	00098513          	mv	a0,s3
    3820:	03d12023          	sw	t4,32(sp)
    3824:	3a4010ef          	jal	4bc8 <__sprint_r>
    3828:	00050463          	beqz	a0,3830 <_vfprintf_r+0x1b24>
    382c:	9b1fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3830:	0a812483          	lw	s1,168(sp)
    3834:	02012e83          	lw	t4,32(sp)
    3838:	0ac10413          	add	s0,sp,172
    383c:	9b0ff06f          	j	29ec <_vfprintf_r+0xce0>
    3840:	00800613          	li	a2,8
    3844:	00000593          	li	a1,0
    3848:	09810513          	add	a0,sp,152
    384c:	02612023          	sw	t1,32(sp)
    3850:	01c12a23          	sw	t3,20(sp)
    3854:	01d12823          	sw	t4,16(sp)
    3858:	09812223          	sw	s8,132(sp)
    385c:	d5cfd0ef          	jal	db8 <memset>
    3860:	02012303          	lw	t1,32(sp)
    3864:	01012e83          	lw	t4,16(sp)
    3868:	01412e03          	lw	t3,20(sp)
    386c:	3a0340e3          	bltz	t1,440c <_vfprintf_r+0x2700>
    3870:	00000d13          	li	s10,0
    3874:	01212823          	sw	s2,16(sp)
    3878:	000c0c93          	mv	s9,s8
    387c:	fff00493          	li	s1,-1
    3880:	000b0c13          	mv	s8,s6
    3884:	000e8a13          	mv	s4,t4
    3888:	00040b13          	mv	s6,s0
    388c:	000d0913          	mv	s2,s10
    3890:	00030413          	mv	s0,t1
    3894:	0300006f          	j	38c4 <_vfprintf_r+0x1bb8>
    3898:	09810693          	add	a3,sp,152
    389c:	0ec10593          	add	a1,sp,236
    38a0:	00098513          	mv	a0,s3
    38a4:	110070ef          	jal	a9b4 <_wcrtomb_r>
    38a8:	68950ae3          	beq	a0,s1,473c <_vfprintf_r+0x2a30>
    38ac:	00a907b3          	add	a5,s2,a0
    38b0:	02f44263          	blt	s0,a5,38d4 <_vfprintf_r+0x1bc8>
    38b4:	004d0d13          	add	s10,s10,4
    38b8:	00879463          	bne	a5,s0,38c0 <_vfprintf_r+0x1bb4>
    38bc:	7990006f          	j	4854 <_vfprintf_r+0x2b48>
    38c0:	00078913          	mv	s2,a5
    38c4:	08412783          	lw	a5,132(sp)
    38c8:	01a787b3          	add	a5,a5,s10
    38cc:	0007a603          	lw	a2,0(a5)
    38d0:	fc0614e3          	bnez	a2,3898 <_vfprintf_r+0x1b8c>
    38d4:	00090d13          	mv	s10,s2
    38d8:	01412e03          	lw	t3,20(sp)
    38dc:	01012903          	lw	s2,16(sp)
    38e0:	000b0413          	mv	s0,s6
    38e4:	000a0e93          	mv	t4,s4
    38e8:	000c0b13          	mv	s6,s8
    38ec:	000c8c13          	mv	s8,s9
    38f0:	340d0ce3          	beqz	s10,4448 <_vfprintf_r+0x273c>
    38f4:	06300793          	li	a5,99
    38f8:	59a7dee3          	bge	a5,s10,4694 <_vfprintf_r+0x2988>
    38fc:	001d0593          	add	a1,s10,1
    3900:	00098513          	mv	a0,s3
    3904:	01c12a23          	sw	t3,20(sp)
    3908:	01d12823          	sw	t4,16(sp)
    390c:	c09fd0ef          	jal	1514 <_malloc_r>
    3910:	01012e83          	lw	t4,16(sp)
    3914:	01412e03          	lw	t3,20(sp)
    3918:	00050c13          	mv	s8,a0
    391c:	620500e3          	beqz	a0,473c <_vfprintf_r+0x2a30>
    3920:	00a12823          	sw	a0,16(sp)
    3924:	00800613          	li	a2,8
    3928:	00000593          	li	a1,0
    392c:	09810513          	add	a0,sp,152
    3930:	03c12023          	sw	t3,32(sp)
    3934:	01d12a23          	sw	t4,20(sp)
    3938:	c80fd0ef          	jal	db8 <memset>
    393c:	09810713          	add	a4,sp,152
    3940:	000d0693          	mv	a3,s10
    3944:	08410613          	add	a2,sp,132
    3948:	000c0593          	mv	a1,s8
    394c:	00098513          	mv	a0,s3
    3950:	0f0070ef          	jal	aa40 <_wcsrtombs_r>
    3954:	01412e83          	lw	t4,20(sp)
    3958:	02012e03          	lw	t3,32(sp)
    395c:	00ad0463          	beq	s10,a0,3964 <_vfprintf_r+0x1c58>
    3960:	0240106f          	j	4984 <_vfprintf_r+0x2c78>
    3964:	01ac0733          	add	a4,s8,s10
    3968:	00070023          	sb	zero,0(a4)
    396c:	07714603          	lbu	a2,119(sp)
    3970:	fffd4813          	not	a6,s10
    3974:	41f85813          	sra	a6,a6,0x1f
    3978:	01612a23          	sw	s6,20(sp)
    397c:	02012223          	sw	zero,36(sp)
    3980:	02012023          	sw	zero,32(sp)
    3984:	010d7cb3          	and	s9,s10,a6
    3988:	00000313          	li	t1,0
    398c:	00000a13          	li	s4,0
    3990:	00061463          	bnez	a2,3998 <_vfprintf_r+0x1c8c>
    3994:	db8fe06f          	j	1f4c <_vfprintf_r+0x240>
    3998:	9d5fe06f          	j	236c <_vfprintf_r+0x660>
    399c:	00048e93          	mv	t4,s1
    39a0:	000a0293          	mv	t0,s4
    39a4:	00070493          	mv	s1,a4
    39a8:	01a484b3          	add	s1,s1,s10
    39ac:	00178793          	add	a5,a5,1
    39b0:	00542023          	sw	t0,0(s0)
    39b4:	e48fe06f          	j	1ffc <_vfprintf_r+0x2f0>
    39b8:	01412783          	lw	a5,20(sp)
    39bc:	00c12703          	lw	a4,12(sp)
    39c0:	0007a783          	lw	a5,0(a5)
    39c4:	00e7a023          	sw	a4,0(a5)
    39c8:	fadfe06f          	j	2974 <_vfprintf_r+0xc68>
    39cc:	02012e83          	lw	t4,32(sp)
    39d0:	00040293          	mv	t0,s0
    39d4:	000a0413          	mv	s0,s4
    39d8:	008484b3          	add	s1,s1,s0
    39dc:	001d0d13          	add	s10,s10,1
    39e0:	005b2023          	sw	t0,0(s6)
    39e4:	b7dfe06f          	j	2560 <_vfprintf_r+0x854>
    39e8:	03412703          	lw	a4,52(sp)
    39ec:	03012783          	lw	a5,48(sp)
    39f0:	00700613          	li	a2,7
    39f4:	00e42023          	sw	a4,0(s0)
    39f8:	0a412703          	lw	a4,164(sp)
    39fc:	009784b3          	add	s1,a5,s1
    3a00:	00f42223          	sw	a5,4(s0)
    3a04:	00170713          	add	a4,a4,1
    3a08:	0a912423          	sw	s1,168(sp)
    3a0c:	0ae12223          	sw	a4,164(sp)
    3a10:	00840413          	add	s0,s0,8
    3a14:	3ae64463          	blt	a2,a4,3dbc <_vfprintf_r+0x20b0>
    3a18:	3e06cee3          	bltz	a3,4614 <_vfprintf_r+0x2908>
    3a1c:	01812783          	lw	a5,24(sp)
    3a20:	00170713          	add	a4,a4,1
    3a24:	01842023          	sw	s8,0(s0)
    3a28:	009784b3          	add	s1,a5,s1
    3a2c:	00f42223          	sw	a5,4(s0)
    3a30:	0a912423          	sw	s1,168(sp)
    3a34:	0ae12223          	sw	a4,164(sp)
    3a38:	00700793          	li	a5,7
    3a3c:	00e7c463          	blt	a5,a4,3a44 <_vfprintf_r+0x1d38>
    3a40:	dd0fe06f          	j	2010 <_vfprintf_r+0x304>
    3a44:	b61fe06f          	j	25a4 <_vfprintf_r+0x898>
    3a48:	01000613          	li	a2,16
    3a4c:	0a412683          	lw	a3,164(sp)
    3a50:	0000c297          	auipc	t0,0xc
    3a54:	99828293          	add	t0,t0,-1640 # f3e8 <zeroes.0>
    3a58:	09665463          	bge	a2,s6,3ae0 <_vfprintf_r+0x1dd4>
    3a5c:	00040793          	mv	a5,s0
    3a60:	00048713          	mv	a4,s1
    3a64:	00812403          	lw	s0,8(sp)
    3a68:	01000893          	li	a7,16
    3a6c:	00700d13          	li	s10,7
    3a70:	05d12223          	sw	t4,68(sp)
    3a74:	00028493          	mv	s1,t0
    3a78:	00c0006f          	j	3a84 <_vfprintf_r+0x1d78>
    3a7c:	ff0b0b13          	add	s6,s6,-16
    3a80:	0568d863          	bge	a7,s6,3ad0 <_vfprintf_r+0x1dc4>
    3a84:	01070713          	add	a4,a4,16
    3a88:	00168693          	add	a3,a3,1
    3a8c:	0097a023          	sw	s1,0(a5)
    3a90:	0117a223          	sw	a7,4(a5)
    3a94:	0ae12423          	sw	a4,168(sp)
    3a98:	0ad12223          	sw	a3,164(sp)
    3a9c:	00878793          	add	a5,a5,8
    3aa0:	fcdd5ee3          	bge	s10,a3,3a7c <_vfprintf_r+0x1d70>
    3aa4:	0a010613          	add	a2,sp,160
    3aa8:	00040593          	mv	a1,s0
    3aac:	00098513          	mv	a0,s3
    3ab0:	118010ef          	jal	4bc8 <__sprint_r>
    3ab4:	00050463          	beqz	a0,3abc <_vfprintf_r+0x1db0>
    3ab8:	f24fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3abc:	0a812703          	lw	a4,168(sp)
    3ac0:	0a412683          	lw	a3,164(sp)
    3ac4:	0ac10793          	add	a5,sp,172
    3ac8:	01000893          	li	a7,16
    3acc:	fb1ff06f          	j	3a7c <_vfprintf_r+0x1d70>
    3ad0:	04412e83          	lw	t4,68(sp)
    3ad4:	00048293          	mv	t0,s1
    3ad8:	00078413          	mv	s0,a5
    3adc:	00070493          	mv	s1,a4
    3ae0:	016484b3          	add	s1,s1,s6
    3ae4:	00168693          	add	a3,a3,1
    3ae8:	00542023          	sw	t0,0(s0)
    3aec:	01642223          	sw	s6,4(s0)
    3af0:	0a912423          	sw	s1,168(sp)
    3af4:	0ad12223          	sw	a3,164(sp)
    3af8:	00700713          	li	a4,7
    3afc:	00840413          	add	s0,s0,8
    3b00:	bed75c63          	bge	a4,a3,2ef8 <_vfprintf_r+0x11ec>
    3b04:	00812583          	lw	a1,8(sp)
    3b08:	0a010613          	add	a2,sp,160
    3b0c:	00098513          	mv	a0,s3
    3b10:	05d12223          	sw	t4,68(sp)
    3b14:	0b4010ef          	jal	4bc8 <__sprint_r>
    3b18:	00050463          	beqz	a0,3b20 <_vfprintf_r+0x1e14>
    3b1c:	ec0fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3b20:	0a812483          	lw	s1,168(sp)
    3b24:	04412e83          	lw	t4,68(sp)
    3b28:	0ac10413          	add	s0,sp,172
    3b2c:	bccff06f          	j	2ef8 <_vfprintf_r+0x11ec>
    3b30:	02812703          	lw	a4,40(sp)
    3b34:	09810893          	add	a7,sp,152
    3b38:	08410813          	add	a6,sp,132
    3b3c:	00070513          	mv	a0,a4
    3b40:	00050593          	mv	a1,a0
    3b44:	00030713          	mv	a4,t1
    3b48:	07c10793          	add	a5,sp,124
    3b4c:	00200693          	li	a3,2
    3b50:	00048613          	mv	a2,s1
    3b54:	00098513          	mv	a0,s3
    3b58:	03c12223          	sw	t3,36(sp)
    3b5c:	03d12023          	sw	t4,32(sp)
    3b60:	00612c23          	sw	t1,24(sp)
    3b64:	3a8040ef          	jal	7f0c <_dtoa_r>
    3b68:	02012e83          	lw	t4,32(sp)
    3b6c:	01812303          	lw	t1,24(sp)
    3b70:	02412e03          	lw	t3,36(sp)
    3b74:	001ef713          	and	a4,t4,1
    3b78:	00050c13          	mv	s8,a0
    3b7c:	1a0712e3          	bnez	a4,4520 <_vfprintf_r+0x2814>
    3b80:	09812783          	lw	a5,152(sp)
    3b84:	07c12a03          	lw	s4,124(sp)
    3b88:	40a787b3          	sub	a5,a5,a0
    3b8c:	00f12c23          	sw	a5,24(sp)
    3b90:	ffd00713          	li	a4,-3
    3b94:	00ea4463          	blt	s4,a4,3b9c <_vfprintf_r+0x1e90>
    3b98:	5b435663          	bge	t1,s4,4144 <_vfprintf_r+0x2438>
    3b9c:	ffee0e13          	add	t3,t3,-2
    3ba0:	fffa0d13          	add	s10,s4,-1
    3ba4:	07a12e23          	sw	s10,124(sp)
    3ba8:	0ffe7693          	zext.b	a3,t3
    3bac:	00000613          	li	a2,0
    3bb0:	08d10423          	sb	a3,136(sp)
    3bb4:	02b00693          	li	a3,43
    3bb8:	000d5863          	bgez	s10,3bc8 <_vfprintf_r+0x1ebc>
    3bbc:	00100713          	li	a4,1
    3bc0:	41470d33          	sub	s10,a4,s4
    3bc4:	02d00693          	li	a3,45
    3bc8:	08d104a3          	sb	a3,137(sp)
    3bcc:	00900693          	li	a3,9
    3bd0:	33a6d8e3          	bge	a3,s10,4700 <_vfprintf_r+0x29f4>
    3bd4:	000c0793          	mv	a5,s8
    3bd8:	09f10493          	add	s1,sp,159
    3bdc:	03212023          	sw	s2,32(sp)
    3be0:	00040c13          	mv	s8,s0
    3be4:	06300a13          	li	s4,99
    3be8:	000d0413          	mv	s0,s10
    3bec:	03d12223          	sw	t4,36(sp)
    3bf0:	05c12023          	sw	t3,64(sp)
    3bf4:	00048913          	mv	s2,s1
    3bf8:	00098c93          	mv	s9,s3
    3bfc:	00078d13          	mv	s10,a5
    3c00:	00a00593          	li	a1,10
    3c04:	00040513          	mv	a0,s0
    3c08:	09c0b0ef          	jal	eca4 <__modsi3>
    3c0c:	03050713          	add	a4,a0,48
    3c10:	00090b13          	mv	s6,s2
    3c14:	00040513          	mv	a0,s0
    3c18:	feeb0fa3          	sb	a4,-1(s6)
    3c1c:	00a00593          	li	a1,10
    3c20:	00040993          	mv	s3,s0
    3c24:	7fd0a0ef          	jal	ec20 <__divsi3>
    3c28:	fff90913          	add	s2,s2,-1
    3c2c:	00050413          	mv	s0,a0
    3c30:	fd3a48e3          	blt	s4,s3,3c00 <_vfprintf_r+0x1ef4>
    3c34:	000c8993          	mv	s3,s9
    3c38:	03050713          	add	a4,a0,48
    3c3c:	00090c93          	mv	s9,s2
    3c40:	ffeb0693          	add	a3,s6,-2
    3c44:	feec8fa3          	sb	a4,-1(s9)
    3c48:	000c0413          	mv	s0,s8
    3c4c:	02412e83          	lw	t4,36(sp)
    3c50:	04012e03          	lw	t3,64(sp)
    3c54:	02012903          	lw	s2,32(sp)
    3c58:	000d0c13          	mv	s8,s10
    3c5c:	4c96f6e3          	bgeu	a3,s1,4928 <_vfprintf_r+0x2c1c>
    3c60:	08a10713          	add	a4,sp,138
    3c64:	0006c783          	lbu	a5,0(a3)
    3c68:	00168693          	add	a3,a3,1
    3c6c:	00170713          	add	a4,a4,1
    3c70:	fef70fa3          	sb	a5,-1(a4)
    3c74:	fe9698e3          	bne	a3,s1,3c64 <_vfprintf_r+0x1f58>
    3c78:	15010793          	add	a5,sp,336
    3c7c:	41678633          	sub	a2,a5,s6
    3c80:	f5360793          	add	a5,a2,-173
    3c84:	04f12023          	sw	a5,64(sp)
    3c88:	01812783          	lw	a5,24(sp)
    3c8c:	04012683          	lw	a3,64(sp)
    3c90:	00100713          	li	a4,1
    3c94:	00d78d33          	add	s10,a5,a3
    3c98:	28f75ce3          	bge	a4,a5,4730 <_vfprintf_r+0x2a24>
    3c9c:	03012783          	lw	a5,48(sp)
    3ca0:	00fd0d33          	add	s10,s10,a5
    3ca4:	fffd4813          	not	a6,s10
    3ca8:	bffeff13          	and	t5,t4,-1025
    3cac:	41f85813          	sra	a6,a6,0x1f
    3cb0:	100f6e93          	or	t4,t5,256
    3cb4:	010d7cb3          	and	s9,s10,a6
    3cb8:	02012223          	sw	zero,36(sp)
    3cbc:	02012023          	sw	zero,32(sp)
    3cc0:	00000a13          	li	s4,0
    3cc4:	04412783          	lw	a5,68(sp)
    3cc8:	46079263          	bnez	a5,412c <_vfprintf_r+0x2420>
    3ccc:	07714603          	lbu	a2,119(sp)
    3cd0:	00000313          	li	t1,0
    3cd4:	00061463          	bnez	a2,3cdc <_vfprintf_r+0x1fd0>
    3cd8:	a74fe06f          	j	1f4c <_vfprintf_r+0x240>
    3cdc:	e90fe06f          	j	236c <_vfprintf_r+0x660>
    3ce0:	00812583          	lw	a1,8(sp)
    3ce4:	0a010613          	add	a2,sp,160
    3ce8:	00098513          	mv	a0,s3
    3cec:	03d12023          	sw	t4,32(sp)
    3cf0:	6d9000ef          	jal	4bc8 <__sprint_r>
    3cf4:	00050463          	beqz	a0,3cfc <_vfprintf_r+0x1ff0>
    3cf8:	ce4fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3cfc:	07c12683          	lw	a3,124(sp)
    3d00:	0a812483          	lw	s1,168(sp)
    3d04:	02012e83          	lw	t4,32(sp)
    3d08:	0ac10413          	add	s0,sp,172
    3d0c:	ce0ff06f          	j	31ec <_vfprintf_r+0x14e0>
    3d10:	00600c93          	li	s9,6
    3d14:	f14ff06f          	j	3428 <_vfprintf_r+0x171c>
    3d18:	0ffd7d13          	zext.b	s10,s10
    3d1c:	00000c93          	li	s9,0
    3d20:	bd5fe06f          	j	28f4 <_vfprintf_r+0xbe8>
    3d24:	0ffd7d13          	zext.b	s10,s10
    3d28:	00000c93          	li	s9,0
    3d2c:	e48ff06f          	j	3374 <_vfprintf_r+0x1668>
    3d30:	018d1d13          	sll	s10,s10,0x18
    3d34:	418d5d13          	sra	s10,s10,0x18
    3d38:	41fd5c93          	sra	s9,s10,0x1f
    3d3c:	000c8793          	mv	a5,s9
    3d40:	b39fe06f          	j	2878 <_vfprintf_r+0xb6c>
    3d44:	01412783          	lw	a5,20(sp)
    3d48:	00c12703          	lw	a4,12(sp)
    3d4c:	0007a783          	lw	a5,0(a5)
    3d50:	00e79023          	sh	a4,0(a5)
    3d54:	c21fe06f          	j	2974 <_vfprintf_r+0xc68>
    3d58:	000c0513          	mv	a0,s8
    3d5c:	05d12223          	sw	t4,68(sp)
    3d60:	ad8fd0ef          	jal	1038 <strlen>
    3d64:	07714603          	lbu	a2,119(sp)
    3d68:	fff54813          	not	a6,a0
    3d6c:	41f85813          	sra	a6,a6,0x1f
    3d70:	01612a23          	sw	s6,20(sp)
    3d74:	02012223          	sw	zero,36(sp)
    3d78:	02012023          	sw	zero,32(sp)
    3d7c:	00012823          	sw	zero,16(sp)
    3d80:	04412e83          	lw	t4,68(sp)
    3d84:	00050d13          	mv	s10,a0
    3d88:	01057cb3          	and	s9,a0,a6
    3d8c:	00000313          	li	t1,0
    3d90:	07300e13          	li	t3,115
    3d94:	00061463          	bnez	a2,3d9c <_vfprintf_r+0x2090>
    3d98:	9b4fe06f          	j	1f4c <_vfprintf_r+0x240>
    3d9c:	dd0fe06f          	j	236c <_vfprintf_r+0x660>
    3da0:	00812583          	lw	a1,8(sp)
    3da4:	0a010613          	add	a2,sp,160
    3da8:	00098513          	mv	a0,s3
    3dac:	61d000ef          	jal	4bc8 <__sprint_r>
    3db0:	00051463          	bnez	a0,3db8 <_vfprintf_r+0x20ac>
    3db4:	be8fe06f          	j	219c <_vfprintf_r+0x490>
    3db8:	c38fe06f          	j	21f0 <_vfprintf_r+0x4e4>
    3dbc:	00812583          	lw	a1,8(sp)
    3dc0:	0a010613          	add	a2,sp,160
    3dc4:	00098513          	mv	a0,s3
    3dc8:	03d12023          	sw	t4,32(sp)
    3dcc:	5fd000ef          	jal	4bc8 <__sprint_r>
    3dd0:	00050463          	beqz	a0,3dd8 <_vfprintf_r+0x20cc>
    3dd4:	c08fe06f          	j	21dc <_vfprintf_r+0x4d0>
    3dd8:	07c12683          	lw	a3,124(sp)
    3ddc:	0a812483          	lw	s1,168(sp)
    3de0:	0a412703          	lw	a4,164(sp)
    3de4:	02012e83          	lw	t4,32(sp)
    3de8:	0ac10413          	add	s0,sp,172
    3dec:	c2dff06f          	j	3a18 <_vfprintf_r+0x1d0c>
    3df0:	05862503          	lw	a0,88(a2)
    3df4:	00f12623          	sw	a5,12(sp)
    3df8:	fbdfc0ef          	jal	db4 <__retarget_lock_release_recursive>
    3dfc:	00c12783          	lw	a5,12(sp)
    3e00:	ab8fe06f          	j	20b8 <_vfprintf_r+0x3ac>
    3e04:	00130a13          	add	s4,t1,1
    3e08:	00200693          	li	a3,2
    3e0c:	02812703          	lw	a4,40(sp)
    3e10:	09810893          	add	a7,sp,152
    3e14:	08410813          	add	a6,sp,132
    3e18:	00070513          	mv	a0,a4
    3e1c:	00050593          	mv	a1,a0
    3e20:	000a0713          	mv	a4,s4
    3e24:	07c10793          	add	a5,sp,124
    3e28:	00048613          	mv	a2,s1
    3e2c:	00098513          	mv	a0,s3
    3e30:	02612223          	sw	t1,36(sp)
    3e34:	03c12023          	sw	t3,32(sp)
    3e38:	01d12c23          	sw	t4,24(sp)
    3e3c:	0d0040ef          	jal	7f0c <_dtoa_r>
    3e40:	02012e03          	lw	t3,32(sp)
    3e44:	04600693          	li	a3,70
    3e48:	01812e83          	lw	t4,24(sp)
    3e4c:	fdfe7d13          	and	s10,t3,-33
    3e50:	02412303          	lw	t1,36(sp)
    3e54:	00050c13          	mv	s8,a0
    3e58:	01450733          	add	a4,a0,s4
    3e5c:	34dd14e3          	bne	s10,a3,49a4 <_vfprintf_r+0x2c98>
    3e60:	000c4603          	lbu	a2,0(s8)
    3e64:	03000693          	li	a3,48
    3e68:	6cd60263          	beq	a2,a3,452c <_vfprintf_r+0x2820>
    3e6c:	07c12683          	lw	a3,124(sp)
    3e70:	00d70733          	add	a4,a4,a3
    3e74:	02812683          	lw	a3,40(sp)
    3e78:	00048593          	mv	a1,s1
    3e7c:	00000613          	li	a2,0
    3e80:	00068513          	mv	a0,a3
    3e84:	00000693          	li	a3,0
    3e88:	04e12823          	sw	a4,80(sp)
    3e8c:	02612223          	sw	t1,36(sp)
    3e90:	03c12023          	sw	t3,32(sp)
    3e94:	01d12c23          	sw	t4,24(sp)
    3e98:	370090ef          	jal	d208 <__eqdf2>
    3e9c:	01812e83          	lw	t4,24(sp)
    3ea0:	02012e03          	lw	t3,32(sp)
    3ea4:	02412303          	lw	t1,36(sp)
    3ea8:	05012703          	lw	a4,80(sp)
    3eac:	62050863          	beqz	a0,44dc <_vfprintf_r+0x27d0>
    3eb0:	09812783          	lw	a5,152(sp)
    3eb4:	00e7fe63          	bgeu	a5,a4,3ed0 <_vfprintf_r+0x21c4>
    3eb8:	03000613          	li	a2,48
    3ebc:	00178693          	add	a3,a5,1
    3ec0:	08d12c23          	sw	a3,152(sp)
    3ec4:	00c78023          	sb	a2,0(a5)
    3ec8:	09812783          	lw	a5,152(sp)
    3ecc:	fee7e8e3          	bltu	a5,a4,3ebc <_vfprintf_r+0x21b0>
    3ed0:	07c12a03          	lw	s4,124(sp)
    3ed4:	418787b3          	sub	a5,a5,s8
    3ed8:	04700713          	li	a4,71
    3edc:	00f12c23          	sw	a5,24(sp)
    3ee0:	caed08e3          	beq	s10,a4,3b90 <_vfprintf_r+0x1e84>
    3ee4:	04600713          	li	a4,70
    3ee8:	68ed0863          	beq	s10,a4,4578 <_vfprintf_r+0x286c>
    3eec:	fffa0d13          	add	s10,s4,-1
    3ef0:	cb5ff06f          	j	3ba4 <_vfprintf_r+0x1e98>
    3ef4:	02812703          	lw	a4,40(sp)
    3ef8:	07c10613          	add	a2,sp,124
    3efc:	00048593          	mv	a1,s1
    3f00:	00070513          	mv	a0,a4
    3f04:	02612223          	sw	t1,36(sp)
    3f08:	03c12023          	sw	t3,32(sp)
    3f0c:	01d12c23          	sw	t4,24(sp)
    3f10:	4e9030ef          	jal	7bf8 <frexp>
    3f14:	7fffc717          	auipc	a4,0x7fffc
    3f18:	79470713          	add	a4,a4,1940 # 800006a8 <__global_locale+0x174>
    3f1c:	00072603          	lw	a2,0(a4)
    3f20:	00472683          	lw	a3,4(a4)
    3f24:	578090ef          	jal	d49c <__muldf3>
    3f28:	00000613          	li	a2,0
    3f2c:	00000693          	li	a3,0
    3f30:	00050a13          	mv	s4,a0
    3f34:	00058d13          	mv	s10,a1
    3f38:	2d0090ef          	jal	d208 <__eqdf2>
    3f3c:	01812e83          	lw	t4,24(sp)
    3f40:	02012e03          	lw	t3,32(sp)
    3f44:	02412303          	lw	t1,36(sp)
    3f48:	00051663          	bnez	a0,3f54 <_vfprintf_r+0x2248>
    3f4c:	00100713          	li	a4,1
    3f50:	06e12e23          	sw	a4,124(sp)
    3f54:	0000b797          	auipc	a5,0xb
    3f58:	fc078793          	add	a5,a5,-64 # ef14 <__fini_array_end+0x1b8>
    3f5c:	06100713          	li	a4,97
    3f60:	02f12023          	sw	a5,32(sp)
    3f64:	00ee1863          	bne	t3,a4,3f74 <_vfprintf_r+0x2268>
    3f68:	0000b797          	auipc	a5,0xb
    3f6c:	f9878793          	add	a5,a5,-104 # ef00 <__fini_array_end+0x1a4>
    3f70:	02f12023          	sw	a5,32(sp)
    3f74:	7fffc717          	auipc	a4,0x7fffc
    3f78:	73c70713          	add	a4,a4,1852 # 800006b0 <__global_locale+0x17c>
    3f7c:	00072783          	lw	a5,0(a4)
    3f80:	00472803          	lw	a6,4(a4)
    3f84:	000c0493          	mv	s1,s8
    3f88:	00f12c23          	sw	a5,24(sp)
    3f8c:	000d0793          	mv	a5,s10
    3f90:	03212223          	sw	s2,36(sp)
    3f94:	000c0d13          	mv	s10,s8
    3f98:	02012903          	lw	s2,32(sp)
    3f9c:	00098c13          	mv	s8,s3
    3fa0:	01012e23          	sw	a6,28(sp)
    3fa4:	fff30b13          	add	s6,t1,-1
    3fa8:	fff00c93          	li	s9,-1
    3fac:	05d12023          	sw	t4,64(sp)
    3fb0:	05c12823          	sw	t3,80(sp)
    3fb4:	04812a23          	sw	s0,84(sp)
    3fb8:	00078993          	mv	s3,a5
    3fbc:	01c0006f          	j	3fd8 <_vfprintf_r+0x22cc>
    3fc0:	00000613          	li	a2,0
    3fc4:	00000693          	li	a3,0
    3fc8:	fffb0413          	add	s0,s6,-1
    3fcc:	23c090ef          	jal	d208 <__eqdf2>
    3fd0:	0a0504e3          	beqz	a0,4878 <_vfprintf_r+0x2b6c>
    3fd4:	00040b13          	mv	s6,s0
    3fd8:	01812603          	lw	a2,24(sp)
    3fdc:	01c12683          	lw	a3,28(sp)
    3fe0:	000a0513          	mv	a0,s4
    3fe4:	00098593          	mv	a1,s3
    3fe8:	4b4090ef          	jal	d49c <__muldf3>
    3fec:	00058a13          	mv	s4,a1
    3ff0:	00050993          	mv	s3,a0
    3ff4:	5940a0ef          	jal	e588 <__fixdfsi>
    3ff8:	00050413          	mv	s0,a0
    3ffc:	6100a0ef          	jal	e60c <__floatsidf>
    4000:	00050613          	mv	a2,a0
    4004:	00058693          	mv	a3,a1
    4008:	00098513          	mv	a0,s3
    400c:	000a0593          	mv	a1,s4
    4010:	41d090ef          	jal	dc2c <__subdf3>
    4014:	00890733          	add	a4,s2,s0
    4018:	00074703          	lbu	a4,0(a4)
    401c:	00048813          	mv	a6,s1
    4020:	00050a13          	mv	s4,a0
    4024:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4028:	00058993          	mv	s3,a1
    402c:	00148493          	add	s1,s1,1
    4030:	f99b18e3          	bne	s6,s9,3fc0 <_vfprintf_r+0x22b4>
    4034:	7fffc697          	auipc	a3,0x7fffc
    4038:	68468693          	add	a3,a3,1668 # 800006b8 <__global_locale+0x184>
    403c:	0006a303          	lw	t1,0(a3)
    4040:	0046a383          	lw	t2,4(a3)
    4044:	05012e03          	lw	t3,80(sp)
    4048:	00030613          	mv	a2,t1
    404c:	00038693          	mv	a3,t2
    4050:	01012c23          	sw	a6,24(sp)
    4054:	02412903          	lw	s2,36(sp)
    4058:	000c0993          	mv	s3,s8
    405c:	03c12223          	sw	t3,36(sp)
    4060:	000d0c13          	mv	s8,s10
    4064:	00058d13          	mv	s10,a1
    4068:	22c090ef          	jal	d294 <__gedf2>
    406c:	7fffc797          	auipc	a5,0x7fffc
    4070:	64c78793          	add	a5,a5,1612 # 800006b8 <__global_locale+0x184>
    4074:	00040b13          	mv	s6,s0
    4078:	0007a303          	lw	t1,0(a5)
    407c:	05412403          	lw	s0,84(sp)
    4080:	0047a383          	lw	t2,4(a5)
    4084:	01812803          	lw	a6,24(sp)
    4088:	02412e03          	lw	t3,36(sp)
    408c:	04012e83          	lw	t4,64(sp)
    4090:	0aa05ce3          	blez	a0,4948 <_vfprintf_r+0x2c3c>
    4094:	02012783          	lw	a5,32(sp)
    4098:	09012c23          	sw	a6,152(sp)
    409c:	fff4c603          	lbu	a2,-1(s1)
    40a0:	00f7c583          	lbu	a1,15(a5)
    40a4:	00048693          	mv	a3,s1
    40a8:	02b61063          	bne	a2,a1,40c8 <_vfprintf_r+0x23bc>
    40ac:	03000513          	li	a0,48
    40b0:	fea68fa3          	sb	a0,-1(a3)
    40b4:	09812683          	lw	a3,152(sp)
    40b8:	fff68793          	add	a5,a3,-1
    40bc:	08f12c23          	sw	a5,152(sp)
    40c0:	fff6c603          	lbu	a2,-1(a3)
    40c4:	feb606e3          	beq	a2,a1,40b0 <_vfprintf_r+0x23a4>
    40c8:	00160593          	add	a1,a2,1
    40cc:	03900513          	li	a0,57
    40d0:	0ff5f593          	zext.b	a1,a1
    40d4:	04a60463          	beq	a2,a0,411c <_vfprintf_r+0x2410>
    40d8:	feb68fa3          	sb	a1,-1(a3)
    40dc:	00048793          	mv	a5,s1
    40e0:	07c12a03          	lw	s4,124(sp)
    40e4:	418787b3          	sub	a5,a5,s8
    40e8:	06100613          	li	a2,97
    40ec:	fffa0d13          	add	s10,s4,-1
    40f0:	00f12c23          	sw	a5,24(sp)
    40f4:	07a12e23          	sw	s10,124(sp)
    40f8:	07000693          	li	a3,112
    40fc:	00ce0663          	beq	t3,a2,4108 <_vfprintf_r+0x23fc>
    4100:	05000693          	li	a3,80
    4104:	04100e13          	li	t3,65
    4108:	00100613          	li	a2,1
    410c:	aa5ff06f          	j	3bb0 <_vfprintf_r+0x1ea4>
    4110:	00030a13          	mv	s4,t1
    4114:	00300693          	li	a3,3
    4118:	cf5ff06f          	j	3e0c <_vfprintf_r+0x2100>
    411c:	02012783          	lw	a5,32(sp)
    4120:	00a7c583          	lbu	a1,10(a5)
    4124:	feb68fa3          	sb	a1,-1(a3)
    4128:	fb5ff06f          	j	40dc <_vfprintf_r+0x23d0>
    412c:	02d00713          	li	a4,45
    4130:	06e10ba3          	sb	a4,119(sp)
    4134:	02d00613          	li	a2,45
    4138:	00000313          	li	t1,0
    413c:	001c8c93          	add	s9,s9,1
    4140:	e0dfd06f          	j	1f4c <_vfprintf_r+0x240>
    4144:	01812783          	lw	a5,24(sp)
    4148:	46fa4063          	blt	s4,a5,45a8 <_vfprintf_r+0x289c>
    414c:	001ef713          	and	a4,t4,1
    4150:	000a0d13          	mv	s10,s4
    4154:	00070663          	beqz	a4,4160 <_vfprintf_r+0x2454>
    4158:	03012783          	lw	a5,48(sp)
    415c:	00fa0d33          	add	s10,s4,a5
    4160:	400eff13          	and	t5,t4,1024
    4164:	000f0463          	beqz	t5,416c <_vfprintf_r+0x2460>
    4168:	5f404e63          	bgtz	s4,4764 <_vfprintf_r+0x2a58>
    416c:	fffd4813          	not	a6,s10
    4170:	41f85813          	sra	a6,a6,0x1f
    4174:	010d7cb3          	and	s9,s10,a6
    4178:	06700e13          	li	t3,103
    417c:	000b0e93          	mv	t4,s6
    4180:	02012223          	sw	zero,36(sp)
    4184:	02012023          	sw	zero,32(sp)
    4188:	b3dff06f          	j	3cc4 <_vfprintf_r+0x1fb8>
    418c:	02d00793          	li	a5,45
    4190:	06f10ba3          	sb	a5,119(sp)
    4194:	02d00613          	li	a2,45
    4198:	998fe06f          	j	2330 <_vfprintf_r+0x624>
    419c:	01812783          	lw	a5,24(sp)
    41a0:	02012a03          	lw	s4,32(sp)
    41a4:	05212823          	sw	s2,80(sp)
    41a8:	00fc07b3          	add	a5,s8,a5
    41ac:	05712c23          	sw	s7,88(sp)
    41b0:	05912e23          	sw	s9,92(sp)
    41b4:	00040713          	mv	a4,s0
    41b8:	04f12223          	sw	a5,68(sp)
    41bc:	02412403          	lw	s0,36(sp)
    41c0:	05d12a23          	sw	t4,84(sp)
    41c4:	03812223          	sw	s8,36(sp)
    41c8:	03c12b83          	lw	s7,60(sp)
    41cc:	04c12c83          	lw	s9,76(sp)
    41d0:	00812903          	lw	s2,8(sp)
    41d4:	00700693          	li	a3,7
    41d8:	01000d13          	li	s10,16
    41dc:	0000bb17          	auipc	s6,0xb
    41e0:	20cb0b13          	add	s6,s6,524 # f3e8 <zeroes.0>
    41e4:	00048613          	mv	a2,s1
    41e8:	00030c13          	mv	s8,t1
    41ec:	09405863          	blez	s4,427c <_vfprintf_r+0x2570>
    41f0:	16805e63          	blez	s0,436c <_vfprintf_r+0x2660>
    41f4:	fff40413          	add	s0,s0,-1
    41f8:	04812783          	lw	a5,72(sp)
    41fc:	01960633          	add	a2,a2,s9
    4200:	01972223          	sw	s9,4(a4)
    4204:	00f72023          	sw	a5,0(a4)
    4208:	0a412783          	lw	a5,164(sp)
    420c:	0ac12423          	sw	a2,168(sp)
    4210:	00870713          	add	a4,a4,8
    4214:	00178793          	add	a5,a5,1
    4218:	0af12223          	sw	a5,164(sp)
    421c:	14f6ce63          	blt	a3,a5,4378 <_vfprintf_r+0x266c>
    4220:	04412783          	lw	a5,68(sp)
    4224:	000bc583          	lbu	a1,0(s7)
    4228:	418784b3          	sub	s1,a5,s8
    422c:	0095d463          	bge	a1,s1,4234 <_vfprintf_r+0x2528>
    4230:	00058493          	mv	s1,a1
    4234:	02905663          	blez	s1,4260 <_vfprintf_r+0x2554>
    4238:	0a412583          	lw	a1,164(sp)
    423c:	00960633          	add	a2,a2,s1
    4240:	01872023          	sw	s8,0(a4)
    4244:	00158593          	add	a1,a1,1
    4248:	00972223          	sw	s1,4(a4)
    424c:	0ac12423          	sw	a2,168(sp)
    4250:	0ab12223          	sw	a1,164(sp)
    4254:	14b6c663          	blt	a3,a1,43a0 <_vfprintf_r+0x2694>
    4258:	000bc583          	lbu	a1,0(s7)
    425c:	00870713          	add	a4,a4,8
    4260:	fff4c513          	not	a0,s1
    4264:	41f55513          	sra	a0,a0,0x1f
    4268:	00a4f7b3          	and	a5,s1,a0
    426c:	40f584b3          	sub	s1,a1,a5
    4270:	04904663          	bgtz	s1,42bc <_vfprintf_r+0x25b0>
    4274:	00bc0c33          	add	s8,s8,a1
    4278:	f7404ce3          	bgtz	s4,41f0 <_vfprintf_r+0x24e4>
    427c:	f6804ce3          	bgtz	s0,41f4 <_vfprintf_r+0x24e8>
    4280:	01812783          	lw	a5,24(sp)
    4284:	000c0313          	mv	t1,s8
    4288:	02412c03          	lw	s8,36(sp)
    428c:	03712e23          	sw	s7,60(sp)
    4290:	00070413          	mv	s0,a4
    4294:	00fc0733          	add	a4,s8,a5
    4298:	05012903          	lw	s2,80(sp)
    429c:	05412e83          	lw	t4,84(sp)
    42a0:	05812b83          	lw	s7,88(sp)
    42a4:	05c12c83          	lw	s9,92(sp)
    42a8:	00060493          	mv	s1,a2
    42ac:	00676463          	bltu	a4,t1,42b4 <_vfprintf_r+0x25a8>
    42b0:	c59fe06f          	j	2f08 <_vfprintf_r+0x11fc>
    42b4:	00070313          	mv	t1,a4
    42b8:	c51fe06f          	j	2f08 <_vfprintf_r+0x11fc>
    42bc:	0a412583          	lw	a1,164(sp)
    42c0:	0000be97          	auipc	t4,0xb
    42c4:	128e8e93          	add	t4,t4,296 # f3e8 <zeroes.0>
    42c8:	069d5c63          	bge	s10,s1,4340 <_vfprintf_r+0x2634>
    42cc:	02812023          	sw	s0,32(sp)
    42d0:	00048413          	mv	s0,s1
    42d4:	000b0493          	mv	s1,s6
    42d8:	00c0006f          	j	42e4 <_vfprintf_r+0x25d8>
    42dc:	ff040413          	add	s0,s0,-16
    42e0:	048d5a63          	bge	s10,s0,4334 <_vfprintf_r+0x2628>
    42e4:	01060613          	add	a2,a2,16
    42e8:	00158593          	add	a1,a1,1
    42ec:	01672023          	sw	s6,0(a4)
    42f0:	01a72223          	sw	s10,4(a4)
    42f4:	0ac12423          	sw	a2,168(sp)
    42f8:	0ab12223          	sw	a1,164(sp)
    42fc:	00870713          	add	a4,a4,8
    4300:	fcb6dee3          	bge	a3,a1,42dc <_vfprintf_r+0x25d0>
    4304:	0a010613          	add	a2,sp,160
    4308:	00090593          	mv	a1,s2
    430c:	00098513          	mv	a0,s3
    4310:	0b9000ef          	jal	4bc8 <__sprint_r>
    4314:	00050463          	beqz	a0,431c <_vfprintf_r+0x2610>
    4318:	ec5fd06f          	j	21dc <_vfprintf_r+0x4d0>
    431c:	ff040413          	add	s0,s0,-16
    4320:	0a812603          	lw	a2,168(sp)
    4324:	0a412583          	lw	a1,164(sp)
    4328:	0ac10713          	add	a4,sp,172
    432c:	00700693          	li	a3,7
    4330:	fa8d4ae3          	blt	s10,s0,42e4 <_vfprintf_r+0x25d8>
    4334:	00048e93          	mv	t4,s1
    4338:	00040493          	mv	s1,s0
    433c:	02012403          	lw	s0,32(sp)
    4340:	00960633          	add	a2,a2,s1
    4344:	00158593          	add	a1,a1,1
    4348:	01d72023          	sw	t4,0(a4)
    434c:	00972223          	sw	s1,4(a4)
    4350:	0ac12423          	sw	a2,168(sp)
    4354:	0ab12223          	sw	a1,164(sp)
    4358:	10b6ce63          	blt	a3,a1,4474 <_vfprintf_r+0x2768>
    435c:	000bc583          	lbu	a1,0(s7)
    4360:	00870713          	add	a4,a4,8
    4364:	00bc0c33          	add	s8,s8,a1
    4368:	f11ff06f          	j	4278 <_vfprintf_r+0x256c>
    436c:	fffb8b93          	add	s7,s7,-1
    4370:	fffa0a13          	add	s4,s4,-1
    4374:	e85ff06f          	j	41f8 <_vfprintf_r+0x24ec>
    4378:	0a010613          	add	a2,sp,160
    437c:	00090593          	mv	a1,s2
    4380:	00098513          	mv	a0,s3
    4384:	045000ef          	jal	4bc8 <__sprint_r>
    4388:	00050463          	beqz	a0,4390 <_vfprintf_r+0x2684>
    438c:	e51fd06f          	j	21dc <_vfprintf_r+0x4d0>
    4390:	0a812603          	lw	a2,168(sp)
    4394:	0ac10713          	add	a4,sp,172
    4398:	00700693          	li	a3,7
    439c:	e85ff06f          	j	4220 <_vfprintf_r+0x2514>
    43a0:	0a010613          	add	a2,sp,160
    43a4:	00090593          	mv	a1,s2
    43a8:	00098513          	mv	a0,s3
    43ac:	01d000ef          	jal	4bc8 <__sprint_r>
    43b0:	00050463          	beqz	a0,43b8 <_vfprintf_r+0x26ac>
    43b4:	e29fd06f          	j	21dc <_vfprintf_r+0x4d0>
    43b8:	000bc583          	lbu	a1,0(s7)
    43bc:	0a812603          	lw	a2,168(sp)
    43c0:	0ac10713          	add	a4,sp,172
    43c4:	00700693          	li	a3,7
    43c8:	e99ff06f          	j	4260 <_vfprintf_r+0x2554>
    43cc:	04c12783          	lw	a5,76(sp)
    43d0:	04812583          	lw	a1,72(sp)
    43d4:	00000913          	li	s2,0
    43d8:	40fc0c33          	sub	s8,s8,a5
    43dc:	00078613          	mv	a2,a5
    43e0:	000c0513          	mv	a0,s8
    43e4:	468030ef          	jal	784c <strncpy>
    43e8:	00144783          	lbu	a5,1(s0)
    43ec:	00a00613          	li	a2,10
    43f0:	00000693          	li	a3,0
    43f4:	00f037b3          	snez	a5,a5
    43f8:	000d0513          	mv	a0,s10
    43fc:	000c8593          	mv	a1,s9
    4400:	00f40433          	add	s0,s0,a5
    4404:	78d060ef          	jal	b390 <__udivdi3>
    4408:	a10ff06f          	j	3618 <_vfprintf_r+0x190c>
    440c:	09810713          	add	a4,sp,152
    4410:	00000693          	li	a3,0
    4414:	08410613          	add	a2,sp,132
    4418:	00000593          	li	a1,0
    441c:	00098513          	mv	a0,s3
    4420:	01c12a23          	sw	t3,20(sp)
    4424:	01d12823          	sw	t4,16(sp)
    4428:	618060ef          	jal	aa40 <_wcsrtombs_r>
    442c:	fff00713          	li	a4,-1
    4430:	01012e83          	lw	t4,16(sp)
    4434:	01412e03          	lw	t3,20(sp)
    4438:	00050d13          	mv	s10,a0
    443c:	30e50063          	beq	a0,a4,473c <_vfprintf_r+0x2a30>
    4440:	09812223          	sw	s8,132(sp)
    4444:	cacff06f          	j	38f0 <_vfprintf_r+0x1be4>
    4448:	07714603          	lbu	a2,119(sp)
    444c:	01612a23          	sw	s6,20(sp)
    4450:	02012223          	sw	zero,36(sp)
    4454:	02012023          	sw	zero,32(sp)
    4458:	00012823          	sw	zero,16(sp)
    445c:	00000c93          	li	s9,0
    4460:	00000313          	li	t1,0
    4464:	00000a13          	li	s4,0
    4468:	00061463          	bnez	a2,4470 <_vfprintf_r+0x2764>
    446c:	ae1fd06f          	j	1f4c <_vfprintf_r+0x240>
    4470:	efdfd06f          	j	236c <_vfprintf_r+0x660>
    4474:	0a010613          	add	a2,sp,160
    4478:	00090593          	mv	a1,s2
    447c:	00098513          	mv	a0,s3
    4480:	748000ef          	jal	4bc8 <__sprint_r>
    4484:	00050463          	beqz	a0,448c <_vfprintf_r+0x2780>
    4488:	d55fd06f          	j	21dc <_vfprintf_r+0x4d0>
    448c:	000bc583          	lbu	a1,0(s7)
    4490:	0a812603          	lw	a2,168(sp)
    4494:	0ac10713          	add	a4,sp,172
    4498:	00700693          	li	a3,7
    449c:	00bc0c33          	add	s8,s8,a1
    44a0:	dd9ff06f          	j	4278 <_vfprintf_r+0x256c>
    44a4:	00812583          	lw	a1,8(sp)
    44a8:	0a010613          	add	a2,sp,160
    44ac:	00098513          	mv	a0,s3
    44b0:	05d12223          	sw	t4,68(sp)
    44b4:	714000ef          	jal	4bc8 <__sprint_r>
    44b8:	00050463          	beqz	a0,44c0 <_vfprintf_r+0x27b4>
    44bc:	d21fd06f          	j	21dc <_vfprintf_r+0x4d0>
    44c0:	0a812483          	lw	s1,168(sp)
    44c4:	04412e83          	lw	t4,68(sp)
    44c8:	0ac10413          	add	s0,sp,172
    44cc:	a19fe06f          	j	2ee4 <_vfprintf_r+0x11d8>
    44d0:	00900793          	li	a5,9
    44d4:	95a7e263          	bltu	a5,s10,3618 <_vfprintf_r+0x190c>
    44d8:	98cff06f          	j	3664 <_vfprintf_r+0x1958>
    44dc:	07c12a03          	lw	s4,124(sp)
    44e0:	00070793          	mv	a5,a4
    44e4:	9f1ff06f          	j	3ed4 <_vfprintf_r+0x21c8>
    44e8:	00812583          	lw	a1,8(sp)
    44ec:	0a010613          	add	a2,sp,160
    44f0:	00098513          	mv	a0,s3
    44f4:	03d12023          	sw	t4,32(sp)
    44f8:	6d0000ef          	jal	4bc8 <__sprint_r>
    44fc:	00050463          	beqz	a0,4504 <_vfprintf_r+0x27f8>
    4500:	cddfd06f          	j	21dc <_vfprintf_r+0x4d0>
    4504:	07c12d03          	lw	s10,124(sp)
    4508:	01812783          	lw	a5,24(sp)
    450c:	0a812483          	lw	s1,168(sp)
    4510:	02012e83          	lw	t4,32(sp)
    4514:	0ac10413          	add	s0,sp,172
    4518:	41a78d33          	sub	s10,a5,s10
    451c:	a49fe06f          	j	2f64 <_vfprintf_r+0x1258>
    4520:	00650733          	add	a4,a0,t1
    4524:	04700d13          	li	s10,71
    4528:	94dff06f          	j	3e74 <_vfprintf_r+0x2168>
    452c:	02812603          	lw	a2,40(sp)
    4530:	00048593          	mv	a1,s1
    4534:	00000693          	li	a3,0
    4538:	00060513          	mv	a0,a2
    453c:	00000613          	li	a2,0
    4540:	04e12823          	sw	a4,80(sp)
    4544:	02612223          	sw	t1,36(sp)
    4548:	03c12023          	sw	t3,32(sp)
    454c:	01d12c23          	sw	t4,24(sp)
    4550:	4b9080ef          	jal	d208 <__eqdf2>
    4554:	01812e83          	lw	t4,24(sp)
    4558:	02012e03          	lw	t3,32(sp)
    455c:	02412303          	lw	t1,36(sp)
    4560:	05012703          	lw	a4,80(sp)
    4564:	34051e63          	bnez	a0,48c0 <_vfprintf_r+0x2bb4>
    4568:	07c12a03          	lw	s4,124(sp)
    456c:	01470733          	add	a4,a4,s4
    4570:	418707b3          	sub	a5,a4,s8
    4574:	00f12c23          	sw	a5,24(sp)
    4578:	001ef713          	and	a4,t4,1
    457c:	00676733          	or	a4,a4,t1
    4580:	37405a63          	blez	s4,48f4 <_vfprintf_r+0x2be8>
    4584:	26071263          	bnez	a4,47e8 <_vfprintf_r+0x2adc>
    4588:	000a0d13          	mv	s10,s4
    458c:	06600e13          	li	t3,102
    4590:	400eff13          	and	t5,t4,1024
    4594:	1c0f1a63          	bnez	t5,4768 <_vfprintf_r+0x2a5c>
    4598:	fffd4813          	not	a6,s10
    459c:	41f85813          	sra	a6,a6,0x1f
    45a0:	010d7cb3          	and	s9,s10,a6
    45a4:	bd9ff06f          	j	417c <_vfprintf_r+0x2470>
    45a8:	01812783          	lw	a5,24(sp)
    45ac:	03012703          	lw	a4,48(sp)
    45b0:	06700e13          	li	t3,103
    45b4:	00e78d33          	add	s10,a5,a4
    45b8:	fd404ce3          	bgtz	s4,4590 <_vfprintf_r+0x2884>
    45bc:	414d06b3          	sub	a3,s10,s4
    45c0:	00168d13          	add	s10,a3,1
    45c4:	fffd4813          	not	a6,s10
    45c8:	41f85813          	sra	a6,a6,0x1f
    45cc:	010d7cb3          	and	s9,s10,a6
    45d0:	badff06f          	j	417c <_vfprintf_r+0x2470>
    45d4:	000e8613          	mv	a2,t4
    45d8:	ad8fe06f          	j	28b0 <_vfprintf_r+0xba4>
    45dc:	00812783          	lw	a5,8(sp)
    45e0:	0647a783          	lw	a5,100(a5)
    45e4:	0017f793          	and	a5,a5,1
    45e8:	02079063          	bnez	a5,4608 <_vfprintf_r+0x28fc>
    45ec:	00812783          	lw	a5,8(sp)
    45f0:	00c7d783          	lhu	a5,12(a5)
    45f4:	2007f793          	and	a5,a5,512
    45f8:	00079863          	bnez	a5,4608 <_vfprintf_r+0x28fc>
    45fc:	00812783          	lw	a5,8(sp)
    4600:	0587a503          	lw	a0,88(a5)
    4604:	fb0fc0ef          	jal	db4 <__retarget_lock_release_recursive>
    4608:	fff00793          	li	a5,-1
    460c:	00f12623          	sw	a5,12(sp)
    4610:	c2dfd06f          	j	223c <_vfprintf_r+0x530>
    4614:	ff000613          	li	a2,-16
    4618:	40d00d33          	neg	s10,a3
    461c:	0000b297          	auipc	t0,0xb
    4620:	dcc28293          	add	t0,t0,-564 # f3e8 <zeroes.0>
    4624:	08c6d463          	bge	a3,a2,46ac <_vfprintf_r+0x29a0>
    4628:	03212023          	sw	s2,32(sp)
    462c:	01000693          	li	a3,16
    4630:	00700b13          	li	s6,7
    4634:	000e8a13          	mv	s4,t4
    4638:	00028913          	mv	s2,t0
    463c:	00c0006f          	j	4648 <_vfprintf_r+0x293c>
    4640:	ff0d0d13          	add	s10,s10,-16
    4644:	05a6de63          	bge	a3,s10,46a0 <_vfprintf_r+0x2994>
    4648:	01048493          	add	s1,s1,16
    464c:	00170713          	add	a4,a4,1
    4650:	01242023          	sw	s2,0(s0)
    4654:	00d42223          	sw	a3,4(s0)
    4658:	0a912423          	sw	s1,168(sp)
    465c:	0ae12223          	sw	a4,164(sp)
    4660:	00840413          	add	s0,s0,8
    4664:	fceb5ee3          	bge	s6,a4,4640 <_vfprintf_r+0x2934>
    4668:	00812583          	lw	a1,8(sp)
    466c:	0a010613          	add	a2,sp,160
    4670:	00098513          	mv	a0,s3
    4674:	554000ef          	jal	4bc8 <__sprint_r>
    4678:	00050463          	beqz	a0,4680 <_vfprintf_r+0x2974>
    467c:	b61fd06f          	j	21dc <_vfprintf_r+0x4d0>
    4680:	0a812483          	lw	s1,168(sp)
    4684:	0a412703          	lw	a4,164(sp)
    4688:	0ac10413          	add	s0,sp,172
    468c:	01000693          	li	a3,16
    4690:	fb1ff06f          	j	4640 <_vfprintf_r+0x2934>
    4694:	00012823          	sw	zero,16(sp)
    4698:	0ec10c13          	add	s8,sp,236
    469c:	a88ff06f          	j	3924 <_vfprintf_r+0x1c18>
    46a0:	00090293          	mv	t0,s2
    46a4:	02012903          	lw	s2,32(sp)
    46a8:	000a0e93          	mv	t4,s4
    46ac:	01a484b3          	add	s1,s1,s10
    46b0:	00170713          	add	a4,a4,1
    46b4:	00542023          	sw	t0,0(s0)
    46b8:	01a42223          	sw	s10,4(s0)
    46bc:	0a912423          	sw	s1,168(sp)
    46c0:	0ae12223          	sw	a4,164(sp)
    46c4:	00700693          	li	a3,7
    46c8:	00e6c463          	blt	a3,a4,46d0 <_vfprintf_r+0x29c4>
    46cc:	b65fe06f          	j	3230 <_vfprintf_r+0x1524>
    46d0:	00812583          	lw	a1,8(sp)
    46d4:	0a010613          	add	a2,sp,160
    46d8:	00098513          	mv	a0,s3
    46dc:	03d12023          	sw	t4,32(sp)
    46e0:	4e8000ef          	jal	4bc8 <__sprint_r>
    46e4:	00050463          	beqz	a0,46ec <_vfprintf_r+0x29e0>
    46e8:	af5fd06f          	j	21dc <_vfprintf_r+0x4d0>
    46ec:	0a812483          	lw	s1,168(sp)
    46f0:	0a412703          	lw	a4,164(sp)
    46f4:	02012e83          	lw	t4,32(sp)
    46f8:	0ac10413          	add	s0,sp,172
    46fc:	b20ff06f          	j	3a1c <_vfprintf_r+0x1d10>
    4700:	08a10693          	add	a3,sp,138
    4704:	00061863          	bnez	a2,4714 <_vfprintf_r+0x2a08>
    4708:	03000693          	li	a3,48
    470c:	08d10523          	sb	a3,138(sp)
    4710:	08b10693          	add	a3,sp,139
    4714:	15010793          	add	a5,sp,336
    4718:	40f68633          	sub	a2,a3,a5
    471c:	030d0713          	add	a4,s10,48
    4720:	0c960793          	add	a5,a2,201
    4724:	00e68023          	sb	a4,0(a3)
    4728:	04f12023          	sw	a5,64(sp)
    472c:	d5cff06f          	j	3c88 <_vfprintf_r+0x1f7c>
    4730:	001ef713          	and	a4,t4,1
    4734:	d6070863          	beqz	a4,3ca4 <_vfprintf_r+0x1f98>
    4738:	d64ff06f          	j	3c9c <_vfprintf_r+0x1f90>
    473c:	00812783          	lw	a5,8(sp)
    4740:	00000293          	li	t0,0
    4744:	00c79783          	lh	a5,12(a5)
    4748:	0407e793          	or	a5,a5,64
    474c:	00812703          	lw	a4,8(sp)
    4750:	00f71623          	sh	a5,12(a4)
    4754:	a8dfd06f          	j	21e0 <_vfprintf_r+0x4d4>
    4758:	00012823          	sw	zero,16(sp)
    475c:	00600313          	li	t1,6
    4760:	ff9fe06f          	j	3758 <_vfprintf_r+0x1a4c>
    4764:	06700e13          	li	t3,103
    4768:	03c12783          	lw	a5,60(sp)
    476c:	0ff00613          	li	a2,255
    4770:	0007c703          	lbu	a4,0(a5)
    4774:	22c70263          	beq	a4,a2,4998 <_vfprintf_r+0x2c8c>
    4778:	00000593          	li	a1,0
    477c:	00000693          	li	a3,0
    4780:	01475e63          	bge	a4,s4,479c <_vfprintf_r+0x2a90>
    4784:	40ea0a33          	sub	s4,s4,a4
    4788:	0017c703          	lbu	a4,1(a5)
    478c:	04070863          	beqz	a4,47dc <_vfprintf_r+0x2ad0>
    4790:	00168693          	add	a3,a3,1
    4794:	00178793          	add	a5,a5,1
    4798:	fec714e3          	bne	a4,a2,4780 <_vfprintf_r+0x2a74>
    479c:	02f12e23          	sw	a5,60(sp)
    47a0:	02d12023          	sw	a3,32(sp)
    47a4:	02b12223          	sw	a1,36(sp)
    47a8:	02012783          	lw	a5,32(sp)
    47ac:	02412703          	lw	a4,36(sp)
    47b0:	04c12583          	lw	a1,76(sp)
    47b4:	05c12823          	sw	t3,80(sp)
    47b8:	00e78533          	add	a0,a5,a4
    47bc:	3a80a0ef          	jal	eb64 <__mulsi3>
    47c0:	01a50d33          	add	s10,a0,s10
    47c4:	fffd4813          	not	a6,s10
    47c8:	41f85813          	sra	a6,a6,0x1f
    47cc:	05012e03          	lw	t3,80(sp)
    47d0:	010d7cb3          	and	s9,s10,a6
    47d4:	000b0e93          	mv	t4,s6
    47d8:	cecff06f          	j	3cc4 <_vfprintf_r+0x1fb8>
    47dc:	0007c703          	lbu	a4,0(a5)
    47e0:	00158593          	add	a1,a1,1
    47e4:	fb5ff06f          	j	4798 <_vfprintf_r+0x2a8c>
    47e8:	03012783          	lw	a5,48(sp)
    47ec:	06600e13          	li	t3,102
    47f0:	00f306b3          	add	a3,t1,a5
    47f4:	01468d33          	add	s10,a3,s4
    47f8:	d99ff06f          	j	4590 <_vfprintf_r+0x2884>
    47fc:	02c12783          	lw	a5,44(sp)
    4800:	0a07c863          	bltz	a5,48b0 <_vfprintf_r+0x2ba4>
    4804:	07714603          	lbu	a2,119(sp)
    4808:	04700713          	li	a4,71
    480c:	0000ac17          	auipc	s8,0xa
    4810:	6f0c0c13          	add	s8,s8,1776 # eefc <__fini_array_end+0x1a0>
    4814:	01c75463          	bge	a4,t3,481c <_vfprintf_r+0x2b10>
    4818:	b31fd06f          	j	2348 <_vfprintf_r+0x63c>
    481c:	0000ac17          	auipc	s8,0xa
    4820:	6dcc0c13          	add	s8,s8,1756 # eef8 <__fini_array_end+0x19c>
    4824:	b25fd06f          	j	2348 <_vfprintf_r+0x63c>
    4828:	07714603          	lbu	a2,119(sp)
    482c:	01612a23          	sw	s6,20(sp)
    4830:	02012223          	sw	zero,36(sp)
    4834:	02012023          	sw	zero,32(sp)
    4838:	00030c93          	mv	s9,t1
    483c:	00030d13          	mv	s10,t1
    4840:	07300e13          	li	t3,115
    4844:	00000313          	li	t1,0
    4848:	00061463          	bnez	a2,4850 <_vfprintf_r+0x2b44>
    484c:	f00fd06f          	j	1f4c <_vfprintf_r+0x240>
    4850:	b1dfd06f          	j	236c <_vfprintf_r+0x660>
    4854:	00040313          	mv	t1,s0
    4858:	01012903          	lw	s2,16(sp)
    485c:	000b0413          	mv	s0,s6
    4860:	01412e03          	lw	t3,20(sp)
    4864:	000c0b13          	mv	s6,s8
    4868:	000a0e93          	mv	t4,s4
    486c:	000c8c13          	mv	s8,s9
    4870:	00030d13          	mv	s10,t1
    4874:	87cff06f          	j	38f0 <_vfprintf_r+0x1be4>
    4878:	001b0793          	add	a5,s6,1
    487c:	000c0993          	mv	s3,s8
    4880:	02412903          	lw	s2,36(sp)
    4884:	04012e83          	lw	t4,64(sp)
    4888:	05012e03          	lw	t3,80(sp)
    488c:	05412403          	lw	s0,84(sp)
    4890:	000d0c13          	mv	s8,s10
    4894:	00f487b3          	add	a5,s1,a5
    4898:	03000693          	li	a3,48
    489c:	840b40e3          	bltz	s6,40dc <_vfprintf_r+0x23d0>
    48a0:	00148493          	add	s1,s1,1
    48a4:	fed48fa3          	sb	a3,-1(s1)
    48a8:	fe979ce3          	bne	a5,s1,48a0 <_vfprintf_r+0x2b94>
    48ac:	835ff06f          	j	40e0 <_vfprintf_r+0x23d4>
    48b0:	02d00793          	li	a5,45
    48b4:	06f10ba3          	sb	a5,119(sp)
    48b8:	02d00613          	li	a2,45
    48bc:	f4dff06f          	j	4808 <_vfprintf_r+0x2afc>
    48c0:	00100693          	li	a3,1
    48c4:	414686b3          	sub	a3,a3,s4
    48c8:	06d12e23          	sw	a3,124(sp)
    48cc:	da4ff06f          	j	3e70 <_vfprintf_r+0x2164>
    48d0:	01412783          	lw	a5,20(sp)
    48d4:	0007ab03          	lw	s6,0(a5)
    48d8:	00478793          	add	a5,a5,4
    48dc:	000b5463          	bgez	s6,48e4 <_vfprintf_r+0x2bd8>
    48e0:	fff00b13          	li	s6,-1
    48e4:	00194e03          	lbu	t3,1(s2)
    48e8:	00f12a23          	sw	a5,20(sp)
    48ec:	00068913          	mv	s2,a3
    48f0:	dccfd06f          	j	1ebc <_vfprintf_r+0x1b0>
    48f4:	00071a63          	bnez	a4,4908 <_vfprintf_r+0x2bfc>
    48f8:	00100c93          	li	s9,1
    48fc:	06600e13          	li	t3,102
    4900:	00100d13          	li	s10,1
    4904:	879ff06f          	j	417c <_vfprintf_r+0x2470>
    4908:	03012783          	lw	a5,48(sp)
    490c:	06600e13          	li	t3,102
    4910:	00178693          	add	a3,a5,1
    4914:	00668d33          	add	s10,a3,t1
    4918:	fffd4813          	not	a6,s10
    491c:	41f85813          	sra	a6,a6,0x1f
    4920:	010d7cb3          	and	s9,s10,a6
    4924:	859ff06f          	j	417c <_vfprintf_r+0x2470>
    4928:	00200793          	li	a5,2
    492c:	04f12023          	sw	a5,64(sp)
    4930:	b58ff06f          	j	3c88 <_vfprintf_r+0x1f7c>
    4934:	00812703          	lw	a4,8(sp)
    4938:	00c71783          	lh	a5,12(a4)
    493c:	0407e793          	or	a5,a5,64
    4940:	00f71623          	sh	a5,12(a4)
    4944:	8b5fd06f          	j	21f8 <_vfprintf_r+0x4ec>
    4948:	000a0513          	mv	a0,s4
    494c:	000d0593          	mv	a1,s10
    4950:	00030613          	mv	a2,t1
    4954:	00038693          	mv	a3,t2
    4958:	05012023          	sw	a6,64(sp)
    495c:	03c12223          	sw	t3,36(sp)
    4960:	01d12c23          	sw	t4,24(sp)
    4964:	0a5080ef          	jal	d208 <__eqdf2>
    4968:	01812e83          	lw	t4,24(sp)
    496c:	02412e03          	lw	t3,36(sp)
    4970:	04012803          	lw	a6,64(sp)
    4974:	f6051463          	bnez	a0,40dc <_vfprintf_r+0x23d0>
    4978:	001b7693          	and	a3,s6,1
    497c:	f6068063          	beqz	a3,40dc <_vfprintf_r+0x23d0>
    4980:	f14ff06f          	j	4094 <_vfprintf_r+0x2388>
    4984:	00812783          	lw	a5,8(sp)
    4988:	01012283          	lw	t0,16(sp)
    498c:	00c79783          	lh	a5,12(a5)
    4990:	0407e793          	or	a5,a5,64
    4994:	db9ff06f          	j	474c <_vfprintf_r+0x2a40>
    4998:	02012223          	sw	zero,36(sp)
    499c:	02012023          	sw	zero,32(sp)
    49a0:	e09ff06f          	j	47a8 <_vfprintf_r+0x2a9c>
    49a4:	04500d13          	li	s10,69
    49a8:	cccff06f          	j	3e74 <_vfprintf_r+0x2168>

000049ac <__sbprintf>:
    49ac:	b7010113          	add	sp,sp,-1168
    49b0:	00c59783          	lh	a5,12(a1)
    49b4:	00e5d703          	lhu	a4,14(a1)
    49b8:	48812423          	sw	s0,1160(sp)
    49bc:	00058413          	mv	s0,a1
    49c0:	000105b7          	lui	a1,0x10
    49c4:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x82d>
    49c8:	06442303          	lw	t1,100(s0)
    49cc:	01c42883          	lw	a7,28(s0)
    49d0:	02442803          	lw	a6,36(s0)
    49d4:	01071713          	sll	a4,a4,0x10
    49d8:	00b7f7b3          	and	a5,a5,a1
    49dc:	00e7e7b3          	or	a5,a5,a4
    49e0:	40000593          	li	a1,1024
    49e4:	49212023          	sw	s2,1152(sp)
    49e8:	00f12a23          	sw	a5,20(sp)
    49ec:	00050913          	mv	s2,a0
    49f0:	07010793          	add	a5,sp,112
    49f4:	06010513          	add	a0,sp,96
    49f8:	48112623          	sw	ra,1164(sp)
    49fc:	48912223          	sw	s1,1156(sp)
    4a00:	47312e23          	sw	s3,1148(sp)
    4a04:	00060493          	mv	s1,a2
    4a08:	00068993          	mv	s3,a3
    4a0c:	06612623          	sw	t1,108(sp)
    4a10:	03112223          	sw	a7,36(sp)
    4a14:	03012623          	sw	a6,44(sp)
    4a18:	00f12423          	sw	a5,8(sp)
    4a1c:	00f12c23          	sw	a5,24(sp)
    4a20:	00b12823          	sw	a1,16(sp)
    4a24:	00b12e23          	sw	a1,28(sp)
    4a28:	02012023          	sw	zero,32(sp)
    4a2c:	b7cfc0ef          	jal	da8 <__retarget_lock_init_recursive>
    4a30:	00048613          	mv	a2,s1
    4a34:	00098693          	mv	a3,s3
    4a38:	00810593          	add	a1,sp,8
    4a3c:	00090513          	mv	a0,s2
    4a40:	accfd0ef          	jal	1d0c <_vfprintf_r>
    4a44:	00050493          	mv	s1,a0
    4a48:	04055263          	bgez	a0,4a8c <__sbprintf+0xe0>
    4a4c:	01415783          	lhu	a5,20(sp)
    4a50:	0407f793          	and	a5,a5,64
    4a54:	00078863          	beqz	a5,4a64 <__sbprintf+0xb8>
    4a58:	00c45783          	lhu	a5,12(s0)
    4a5c:	0407e793          	or	a5,a5,64
    4a60:	00f41623          	sh	a5,12(s0)
    4a64:	06012503          	lw	a0,96(sp)
    4a68:	b44fc0ef          	jal	dac <__retarget_lock_close_recursive>
    4a6c:	48c12083          	lw	ra,1164(sp)
    4a70:	48812403          	lw	s0,1160(sp)
    4a74:	48012903          	lw	s2,1152(sp)
    4a78:	47c12983          	lw	s3,1148(sp)
    4a7c:	00048513          	mv	a0,s1
    4a80:	48412483          	lw	s1,1156(sp)
    4a84:	49010113          	add	sp,sp,1168
    4a88:	00008067          	ret
    4a8c:	00810593          	add	a1,sp,8
    4a90:	00090513          	mv	a0,s2
    4a94:	449010ef          	jal	66dc <_fflush_r>
    4a98:	fa050ae3          	beqz	a0,4a4c <__sbprintf+0xa0>
    4a9c:	fff00493          	li	s1,-1
    4aa0:	fadff06f          	j	4a4c <__sbprintf+0xa0>

00004aa4 <__sprint_r.part.0>:
    4aa4:	0645a783          	lw	a5,100(a1)
    4aa8:	fd010113          	add	sp,sp,-48
    4aac:	01612823          	sw	s6,16(sp)
    4ab0:	02112623          	sw	ra,44(sp)
    4ab4:	01279713          	sll	a4,a5,0x12
    4ab8:	00060b13          	mv	s6,a2
    4abc:	0e075863          	bgez	a4,4bac <__sprint_r.part.0+0x108>
    4ac0:	00862783          	lw	a5,8(a2)
    4ac4:	03212023          	sw	s2,32(sp)
    4ac8:	01312e23          	sw	s3,28(sp)
    4acc:	01512a23          	sw	s5,20(sp)
    4ad0:	01712623          	sw	s7,12(sp)
    4ad4:	00058913          	mv	s2,a1
    4ad8:	00062b83          	lw	s7,0(a2)
    4adc:	00050993          	mv	s3,a0
    4ae0:	fff00a93          	li	s5,-1
    4ae4:	0a078863          	beqz	a5,4b94 <__sprint_r.part.0+0xf0>
    4ae8:	02812423          	sw	s0,40(sp)
    4aec:	02912223          	sw	s1,36(sp)
    4af0:	01412c23          	sw	s4,24(sp)
    4af4:	01812423          	sw	s8,8(sp)
    4af8:	004bac03          	lw	s8,4(s7)
    4afc:	000ba403          	lw	s0,0(s7)
    4b00:	002c5a13          	srl	s4,s8,0x2
    4b04:	060a0663          	beqz	s4,4b70 <__sprint_r.part.0+0xcc>
    4b08:	00000493          	li	s1,0
    4b0c:	00c0006f          	j	4b18 <__sprint_r.part.0+0x74>
    4b10:	00440413          	add	s0,s0,4
    4b14:	049a0c63          	beq	s4,s1,4b6c <__sprint_r.part.0+0xc8>
    4b18:	00042583          	lw	a1,0(s0)
    4b1c:	00090613          	mv	a2,s2
    4b20:	00098513          	mv	a0,s3
    4b24:	399020ef          	jal	76bc <_fputwc_r>
    4b28:	00148493          	add	s1,s1,1
    4b2c:	ff5512e3          	bne	a0,s5,4b10 <__sprint_r.part.0+0x6c>
    4b30:	02812403          	lw	s0,40(sp)
    4b34:	02412483          	lw	s1,36(sp)
    4b38:	02012903          	lw	s2,32(sp)
    4b3c:	01c12983          	lw	s3,28(sp)
    4b40:	01812a03          	lw	s4,24(sp)
    4b44:	01412a83          	lw	s5,20(sp)
    4b48:	00c12b83          	lw	s7,12(sp)
    4b4c:	00812c03          	lw	s8,8(sp)
    4b50:	fff00513          	li	a0,-1
    4b54:	02c12083          	lw	ra,44(sp)
    4b58:	000b2423          	sw	zero,8(s6)
    4b5c:	000b2223          	sw	zero,4(s6)
    4b60:	01012b03          	lw	s6,16(sp)
    4b64:	03010113          	add	sp,sp,48
    4b68:	00008067          	ret
    4b6c:	008b2783          	lw	a5,8(s6)
    4b70:	ffcc7c13          	and	s8,s8,-4
    4b74:	418787b3          	sub	a5,a5,s8
    4b78:	00fb2423          	sw	a5,8(s6)
    4b7c:	008b8b93          	add	s7,s7,8
    4b80:	f6079ce3          	bnez	a5,4af8 <__sprint_r.part.0+0x54>
    4b84:	02812403          	lw	s0,40(sp)
    4b88:	02412483          	lw	s1,36(sp)
    4b8c:	01812a03          	lw	s4,24(sp)
    4b90:	00812c03          	lw	s8,8(sp)
    4b94:	02012903          	lw	s2,32(sp)
    4b98:	01c12983          	lw	s3,28(sp)
    4b9c:	01412a83          	lw	s5,20(sp)
    4ba0:	00c12b83          	lw	s7,12(sp)
    4ba4:	00000513          	li	a0,0
    4ba8:	fadff06f          	j	4b54 <__sprint_r.part.0+0xb0>
    4bac:	6b5010ef          	jal	6a60 <__sfvwrite_r>
    4bb0:	02c12083          	lw	ra,44(sp)
    4bb4:	000b2423          	sw	zero,8(s6)
    4bb8:	000b2223          	sw	zero,4(s6)
    4bbc:	01012b03          	lw	s6,16(sp)
    4bc0:	03010113          	add	sp,sp,48
    4bc4:	00008067          	ret

00004bc8 <__sprint_r>:
    4bc8:	00862703          	lw	a4,8(a2)
    4bcc:	00070463          	beqz	a4,4bd4 <__sprint_r+0xc>
    4bd0:	ed5ff06f          	j	4aa4 <__sprint_r.part.0>
    4bd4:	00062223          	sw	zero,4(a2)
    4bd8:	00000513          	li	a0,0
    4bdc:	00008067          	ret

00004be0 <_vfiprintf_r>:
    4be0:	eb010113          	add	sp,sp,-336
    4be4:	14812423          	sw	s0,328(sp)
    4be8:	13312e23          	sw	s3,316(sp)
    4bec:	13812423          	sw	s8,296(sp)
    4bf0:	00050413          	mv	s0,a0
    4bf4:	00058993          	mv	s3,a1
    4bf8:	00060c13          	mv	s8,a2
    4bfc:	00000593          	li	a1,0
    4c00:	00800613          	li	a2,8
    4c04:	05010513          	add	a0,sp,80
    4c08:	13512a23          	sw	s5,308(sp)
    4c0c:	14112623          	sw	ra,332(sp)
    4c10:	00068a93          	mv	s5,a3
    4c14:	9a4fc0ef          	jal	db8 <memset>
    4c18:	00040863          	beqz	s0,4c28 <_vfiprintf_r+0x48>
    4c1c:	03442783          	lw	a5,52(s0)
    4c20:	00079463          	bnez	a5,4c28 <_vfiprintf_r+0x48>
    4c24:	49c0106f          	j	60c0 <_vfiprintf_r+0x14e0>
    4c28:	0649a703          	lw	a4,100(s3)
    4c2c:	00c99783          	lh	a5,12(s3)
    4c30:	00177713          	and	a4,a4,1
    4c34:	00071863          	bnez	a4,4c44 <_vfiprintf_r+0x64>
    4c38:	2007f713          	and	a4,a5,512
    4c3c:	00071463          	bnez	a4,4c44 <_vfiprintf_r+0x64>
    4c40:	0b80106f          	j	5cf8 <_vfiprintf_r+0x1118>
    4c44:	01279713          	sll	a4,a5,0x12
    4c48:	02074663          	bltz	a4,4c74 <_vfiprintf_r+0x94>
    4c4c:	0649a703          	lw	a4,100(s3)
    4c50:	00002637          	lui	a2,0x2
    4c54:	ffffe6b7          	lui	a3,0xffffe
    4c58:	00c7e7b3          	or	a5,a5,a2
    4c5c:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4c60:	01079793          	sll	a5,a5,0x10
    4c64:	4107d793          	sra	a5,a5,0x10
    4c68:	00d77733          	and	a4,a4,a3
    4c6c:	00f99623          	sh	a5,12(s3)
    4c70:	06e9a223          	sw	a4,100(s3)
    4c74:	0087f713          	and	a4,a5,8
    4c78:	2e070463          	beqz	a4,4f60 <_vfiprintf_r+0x380>
    4c7c:	0109a703          	lw	a4,16(s3)
    4c80:	2e070063          	beqz	a4,4f60 <_vfiprintf_r+0x380>
    4c84:	01a7f713          	and	a4,a5,26
    4c88:	00a00693          	li	a3,10
    4c8c:	2ed70c63          	beq	a4,a3,4f84 <_vfiprintf_r+0x3a4>
    4c90:	13412c23          	sw	s4,312(sp)
    4c94:	06c10a13          	add	s4,sp,108
    4c98:	14912223          	sw	s1,324(sp)
    4c9c:	15212023          	sw	s2,320(sp)
    4ca0:	13612823          	sw	s6,304(sp)
    4ca4:	13712623          	sw	s7,300(sp)
    4ca8:	13912223          	sw	s9,292(sp)
    4cac:	13a12023          	sw	s10,288(sp)
    4cb0:	000c0c93          	mv	s9,s8
    4cb4:	11b12e23          	sw	s11,284(sp)
    4cb8:	07412023          	sw	s4,96(sp)
    4cbc:	06012423          	sw	zero,104(sp)
    4cc0:	06012223          	sw	zero,100(sp)
    4cc4:	00012a23          	sw	zero,20(sp)
    4cc8:	02012623          	sw	zero,44(sp)
    4ccc:	02012823          	sw	zero,48(sp)
    4cd0:	02012a23          	sw	zero,52(sp)
    4cd4:	00012623          	sw	zero,12(sp)
    4cd8:	7fffc497          	auipc	s1,0x7fffc
    4cdc:	85c48493          	add	s1,s1,-1956 # 80000534 <__global_locale>
    4ce0:	02500913          	li	s2,37
    4ce4:	0000ab97          	auipc	s7,0xa
    4ce8:	724b8b93          	add	s7,s7,1828 # f408 <blanks.1+0x10>
    4cec:	0000bb17          	auipc	s6,0xb
    4cf0:	888b0b13          	add	s6,s6,-1912 # f574 <zeroes.0>
    4cf4:	000a0c13          	mv	s8,s4
    4cf8:	000c8d93          	mv	s11,s9
    4cfc:	0e44ad03          	lw	s10,228(s1)
    4d00:	3f9020ef          	jal	78f8 <__locale_mb_cur_max>
    4d04:	00050693          	mv	a3,a0
    4d08:	05010713          	add	a4,sp,80
    4d0c:	000d8613          	mv	a2,s11
    4d10:	04810593          	add	a1,sp,72
    4d14:	00040513          	mv	a0,s0
    4d18:	000d00e7          	jalr	s10
    4d1c:	2e050e63          	beqz	a0,5018 <_vfiprintf_r+0x438>
    4d20:	2c054e63          	bltz	a0,4ffc <_vfiprintf_r+0x41c>
    4d24:	04812783          	lw	a5,72(sp)
    4d28:	01278663          	beq	a5,s2,4d34 <_vfiprintf_r+0x154>
    4d2c:	00ad8db3          	add	s11,s11,a0
    4d30:	fcdff06f          	j	4cfc <_vfiprintf_r+0x11c>
    4d34:	00050d13          	mv	s10,a0
    4d38:	419d87b3          	sub	a5,s11,s9
    4d3c:	2f9d9463          	bne	s11,s9,5024 <_vfiprintf_r+0x444>
    4d40:	00000e13          	li	t3,0
    4d44:	001dc683          	lbu	a3,1(s11)
    4d48:	001d8c93          	add	s9,s11,1
    4d4c:	040101a3          	sb	zero,67(sp)
    4d50:	fff00713          	li	a4,-1
    4d54:	00000893          	li	a7,0
    4d58:	05a00d13          	li	s10,90
    4d5c:	000e0d93          	mv	s11,t3
    4d60:	001c8c93          	add	s9,s9,1
    4d64:	fe068793          	add	a5,a3,-32
    4d68:	04fd6663          	bltu	s10,a5,4db4 <_vfiprintf_r+0x1d4>
    4d6c:	00279793          	sll	a5,a5,0x2
    4d70:	017787b3          	add	a5,a5,s7
    4d74:	0007a783          	lw	a5,0(a5)
    4d78:	017787b3          	add	a5,a5,s7
    4d7c:	00078067          	jr	a5
    4d80:	00000893          	li	a7,0
    4d84:	fd068793          	add	a5,a3,-48
    4d88:	00900593          	li	a1,9
    4d8c:	000cc683          	lbu	a3,0(s9)
    4d90:	00289613          	sll	a2,a7,0x2
    4d94:	011608b3          	add	a7,a2,a7
    4d98:	00189893          	sll	a7,a7,0x1
    4d9c:	011788b3          	add	a7,a5,a7
    4da0:	fd068793          	add	a5,a3,-48
    4da4:	001c8c93          	add	s9,s9,1
    4da8:	fef5f2e3          	bgeu	a1,a5,4d8c <_vfiprintf_r+0x1ac>
    4dac:	fe068793          	add	a5,a3,-32
    4db0:	fafd7ee3          	bgeu	s10,a5,4d6c <_vfiprintf_r+0x18c>
    4db4:	000d8e13          	mv	t3,s11
    4db8:	2c068663          	beqz	a3,5084 <_vfiprintf_r+0x4a4>
    4dbc:	0ad10623          	sb	a3,172(sp)
    4dc0:	040101a3          	sb	zero,67(sp)
    4dc4:	00100e93          	li	t4,1
    4dc8:	00100d13          	li	s10,1
    4dcc:	0ac10813          	add	a6,sp,172
    4dd0:	00012823          	sw	zero,16(sp)
    4dd4:	00000713          	li	a4,0
    4dd8:	00000f93          	li	t6,0
    4ddc:	06412603          	lw	a2,100(sp)
    4de0:	084e7293          	and	t0,t3,132
    4de4:	06812783          	lw	a5,104(sp)
    4de8:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x2f5>
    4dec:	00058f13          	mv	t5,a1
    4df0:	00029663          	bnez	t0,4dfc <_vfiprintf_r+0x21c>
    4df4:	41d88db3          	sub	s11,a7,t4
    4df8:	47b046e3          	bgtz	s11,5a64 <_vfiprintf_r+0xe84>
    4dfc:	04314583          	lbu	a1,67(sp)
    4e00:	02058a63          	beqz	a1,4e34 <_vfiprintf_r+0x254>
    4e04:	04310613          	add	a2,sp,67
    4e08:	00178793          	add	a5,a5,1
    4e0c:	00100693          	li	a3,1
    4e10:	00cc2023          	sw	a2,0(s8)
    4e14:	00dc2223          	sw	a3,4(s8)
    4e18:	06f12423          	sw	a5,104(sp)
    4e1c:	07e12223          	sw	t5,100(sp)
    4e20:	00700613          	li	a2,7
    4e24:	35e64ce3          	blt	a2,t5,597c <_vfiprintf_r+0xd9c>
    4e28:	000f0613          	mv	a2,t5
    4e2c:	008c0c13          	add	s8,s8,8
    4e30:	001f0f13          	add	t5,t5,1
    4e34:	080f8063          	beqz	t6,4eb4 <_vfiprintf_r+0x2d4>
    4e38:	00200613          	li	a2,2
    4e3c:	00278793          	add	a5,a5,2
    4e40:	04410693          	add	a3,sp,68
    4e44:	00cc2223          	sw	a2,4(s8)
    4e48:	00dc2023          	sw	a3,0(s8)
    4e4c:	06f12423          	sw	a5,104(sp)
    4e50:	07e12223          	sw	t5,100(sp)
    4e54:	00700613          	li	a2,7
    4e58:	3be652e3          	bge	a2,t5,59fc <_vfiprintf_r+0xe1c>
    4e5c:	60078ae3          	beqz	a5,5c70 <_vfiprintf_r+0x1090>
    4e60:	06010613          	add	a2,sp,96
    4e64:	00098593          	mv	a1,s3
    4e68:	00040513          	mv	a0,s0
    4e6c:	03d12c23          	sw	t4,56(sp)
    4e70:	02e12423          	sw	a4,40(sp)
    4e74:	03112223          	sw	a7,36(sp)
    4e78:	03012023          	sw	a6,32(sp)
    4e7c:	00512e23          	sw	t0,28(sp)
    4e80:	01c12c23          	sw	t3,24(sp)
    4e84:	c21ff0ef          	jal	4aa4 <__sprint_r.part.0>
    4e88:	22051463          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    4e8c:	06412603          	lw	a2,100(sp)
    4e90:	06812783          	lw	a5,104(sp)
    4e94:	03812e83          	lw	t4,56(sp)
    4e98:	02812703          	lw	a4,40(sp)
    4e9c:	02412883          	lw	a7,36(sp)
    4ea0:	02012803          	lw	a6,32(sp)
    4ea4:	01c12283          	lw	t0,28(sp)
    4ea8:	01812e03          	lw	t3,24(sp)
    4eac:	000a0c13          	mv	s8,s4
    4eb0:	00160f13          	add	t5,a2,1
    4eb4:	08000593          	li	a1,128
    4eb8:	06b286e3          	beq	t0,a1,5724 <_vfiprintf_r+0xb44>
    4ebc:	41a70733          	sub	a4,a4,s10
    4ec0:	1ae04ae3          	bgtz	a4,5874 <_vfiprintf_r+0xc94>
    4ec4:	00fd07b3          	add	a5,s10,a5
    4ec8:	010c2023          	sw	a6,0(s8)
    4ecc:	01ac2223          	sw	s10,4(s8)
    4ed0:	06f12423          	sw	a5,104(sp)
    4ed4:	07e12223          	sw	t5,100(sp)
    4ed8:	00700713          	li	a4,7
    4edc:	03e758e3          	bge	a4,t5,570c <_vfiprintf_r+0xb2c>
    4ee0:	24078063          	beqz	a5,5120 <_vfiprintf_r+0x540>
    4ee4:	06010613          	add	a2,sp,96
    4ee8:	00098593          	mv	a1,s3
    4eec:	00040513          	mv	a0,s0
    4ef0:	03d12023          	sw	t4,32(sp)
    4ef4:	01112e23          	sw	a7,28(sp)
    4ef8:	01c12c23          	sw	t3,24(sp)
    4efc:	ba9ff0ef          	jal	4aa4 <__sprint_r.part.0>
    4f00:	1a051863          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    4f04:	06812783          	lw	a5,104(sp)
    4f08:	02012e83          	lw	t4,32(sp)
    4f0c:	01c12883          	lw	a7,28(sp)
    4f10:	01812e03          	lw	t3,24(sp)
    4f14:	000a0c13          	mv	s8,s4
    4f18:	004e7e13          	and	t3,t3,4
    4f1c:	000e0663          	beqz	t3,4f28 <_vfiprintf_r+0x348>
    4f20:	41d88db3          	sub	s11,a7,t4
    4f24:	21b04a63          	bgtz	s11,5138 <_vfiprintf_r+0x558>
    4f28:	01d8d463          	bge	a7,t4,4f30 <_vfiprintf_r+0x350>
    4f2c:	000e8893          	mv	a7,t4
    4f30:	00c12703          	lw	a4,12(sp)
    4f34:	01170733          	add	a4,a4,a7
    4f38:	00e12623          	sw	a4,12(sp)
    4f3c:	16079063          	bnez	a5,509c <_vfiprintf_r+0x4bc>
    4f40:	01012783          	lw	a5,16(sp)
    4f44:	06012223          	sw	zero,100(sp)
    4f48:	00078863          	beqz	a5,4f58 <_vfiprintf_r+0x378>
    4f4c:	00078593          	mv	a1,a5
    4f50:	00040513          	mv	a0,s0
    4f54:	ab4fc0ef          	jal	1208 <_free_r>
    4f58:	000a0c13          	mv	s8,s4
    4f5c:	d9dff06f          	j	4cf8 <_vfiprintf_r+0x118>
    4f60:	00098593          	mv	a1,s3
    4f64:	00040513          	mv	a0,s0
    4f68:	4b0020ef          	jal	7418 <__swsetup_r>
    4f6c:	00050463          	beqz	a0,4f74 <_vfiprintf_r+0x394>
    4f70:	3840106f          	j	62f4 <_vfiprintf_r+0x1714>
    4f74:	00c99783          	lh	a5,12(s3)
    4f78:	00a00693          	li	a3,10
    4f7c:	01a7f713          	and	a4,a5,26
    4f80:	d0d718e3          	bne	a4,a3,4c90 <_vfiprintf_r+0xb0>
    4f84:	00e99703          	lh	a4,14(s3)
    4f88:	d00744e3          	bltz	a4,4c90 <_vfiprintf_r+0xb0>
    4f8c:	0649a703          	lw	a4,100(s3)
    4f90:	00177713          	and	a4,a4,1
    4f94:	00071863          	bnez	a4,4fa4 <_vfiprintf_r+0x3c4>
    4f98:	2007f793          	and	a5,a5,512
    4f9c:	00079463          	bnez	a5,4fa4 <_vfiprintf_r+0x3c4>
    4fa0:	2ac0106f          	j	624c <_vfiprintf_r+0x166c>
    4fa4:	000a8693          	mv	a3,s5
    4fa8:	000c0613          	mv	a2,s8
    4fac:	00098593          	mv	a1,s3
    4fb0:	00040513          	mv	a0,s0
    4fb4:	3e4010ef          	jal	6398 <__sbprintf>
    4fb8:	14c12083          	lw	ra,332(sp)
    4fbc:	14812403          	lw	s0,328(sp)
    4fc0:	00a12623          	sw	a0,12(sp)
    4fc4:	00c12503          	lw	a0,12(sp)
    4fc8:	13c12983          	lw	s3,316(sp)
    4fcc:	13412a83          	lw	s5,308(sp)
    4fd0:	12812c03          	lw	s8,296(sp)
    4fd4:	15010113          	add	sp,sp,336
    4fd8:	00008067          	ret
    4fdc:	000aa883          	lw	a7,0(s5)
    4fe0:	004a8a93          	add	s5,s5,4
    4fe4:	3608cc63          	bltz	a7,535c <_vfiprintf_r+0x77c>
    4fe8:	000cc683          	lbu	a3,0(s9)
    4fec:	d75ff06f          	j	4d60 <_vfiprintf_r+0x180>
    4ff0:	000cc683          	lbu	a3,0(s9)
    4ff4:	020ded93          	or	s11,s11,32
    4ff8:	d69ff06f          	j	4d60 <_vfiprintf_r+0x180>
    4ffc:	00800613          	li	a2,8
    5000:	00000593          	li	a1,0
    5004:	05010513          	add	a0,sp,80
    5008:	db1fb0ef          	jal	db8 <memset>
    500c:	00100513          	li	a0,1
    5010:	00ad8db3          	add	s11,s11,a0
    5014:	ce9ff06f          	j	4cfc <_vfiprintf_r+0x11c>
    5018:	00050d13          	mv	s10,a0
    501c:	419d87b3          	sub	a5,s11,s9
    5020:	079d8263          	beq	s11,s9,5084 <_vfiprintf_r+0x4a4>
    5024:	06812683          	lw	a3,104(sp)
    5028:	06412703          	lw	a4,100(sp)
    502c:	019c2023          	sw	s9,0(s8)
    5030:	00d786b3          	add	a3,a5,a3
    5034:	00170713          	add	a4,a4,1
    5038:	00fc2223          	sw	a5,4(s8)
    503c:	06d12423          	sw	a3,104(sp)
    5040:	06e12223          	sw	a4,100(sp)
    5044:	00700613          	li	a2,7
    5048:	008c0c13          	add	s8,s8,8
    504c:	02e65463          	bge	a2,a4,5074 <_vfiprintf_r+0x494>
    5050:	38068ce3          	beqz	a3,5be8 <_vfiprintf_r+0x1008>
    5054:	06010613          	add	a2,sp,96
    5058:	00098593          	mv	a1,s3
    505c:	00040513          	mv	a0,s0
    5060:	00f12823          	sw	a5,16(sp)
    5064:	a41ff0ef          	jal	4aa4 <__sprint_r.part.0>
    5068:	01012783          	lw	a5,16(sp)
    506c:	04051c63          	bnez	a0,50c4 <_vfiprintf_r+0x4e4>
    5070:	000a0c13          	mv	s8,s4
    5074:	00c12703          	lw	a4,12(sp)
    5078:	00f707b3          	add	a5,a4,a5
    507c:	00f12623          	sw	a5,12(sp)
    5080:	cc0d10e3          	bnez	s10,4d40 <_vfiprintf_r+0x160>
    5084:	06812783          	lw	a5,104(sp)
    5088:	00078463          	beqz	a5,5090 <_vfiprintf_r+0x4b0>
    508c:	22c0106f          	j	62b8 <_vfiprintf_r+0x16d8>
    5090:	00c99783          	lh	a5,12(s3)
    5094:	06012223          	sw	zero,100(sp)
    5098:	0300006f          	j	50c8 <_vfiprintf_r+0x4e8>
    509c:	06010613          	add	a2,sp,96
    50a0:	00098593          	mv	a1,s3
    50a4:	00040513          	mv	a0,s0
    50a8:	9fdff0ef          	jal	4aa4 <__sprint_r.part.0>
    50ac:	e8050ae3          	beqz	a0,4f40 <_vfiprintf_r+0x360>
    50b0:	01012783          	lw	a5,16(sp)
    50b4:	00078863          	beqz	a5,50c4 <_vfiprintf_r+0x4e4>
    50b8:	01012583          	lw	a1,16(sp)
    50bc:	00040513          	mv	a0,s0
    50c0:	948fc0ef          	jal	1208 <_free_r>
    50c4:	00c99783          	lh	a5,12(s3)
    50c8:	0649a703          	lw	a4,100(s3)
    50cc:	00177713          	and	a4,a4,1
    50d0:	16070a63          	beqz	a4,5244 <_vfiprintf_r+0x664>
    50d4:	0407f793          	and	a5,a5,64
    50d8:	14412483          	lw	s1,324(sp)
    50dc:	14012903          	lw	s2,320(sp)
    50e0:	13812a03          	lw	s4,312(sp)
    50e4:	13012b03          	lw	s6,304(sp)
    50e8:	12c12b83          	lw	s7,300(sp)
    50ec:	12412c83          	lw	s9,292(sp)
    50f0:	12012d03          	lw	s10,288(sp)
    50f4:	11c12d83          	lw	s11,284(sp)
    50f8:	00078463          	beqz	a5,5100 <_vfiprintf_r+0x520>
    50fc:	2180106f          	j	6314 <_vfiprintf_r+0x1734>
    5100:	14c12083          	lw	ra,332(sp)
    5104:	14812403          	lw	s0,328(sp)
    5108:	00c12503          	lw	a0,12(sp)
    510c:	13c12983          	lw	s3,316(sp)
    5110:	13412a83          	lw	s5,308(sp)
    5114:	12812c03          	lw	s8,296(sp)
    5118:	15010113          	add	sp,sp,336
    511c:	00008067          	ret
    5120:	06012223          	sw	zero,100(sp)
    5124:	004e7e13          	and	t3,t3,4
    5128:	240e0ee3          	beqz	t3,5b84 <_vfiprintf_r+0xfa4>
    512c:	41d88db3          	sub	s11,a7,t4
    5130:	25b05ae3          	blez	s11,5b84 <_vfiprintf_r+0xfa4>
    5134:	000a0c13          	mv	s8,s4
    5138:	01000713          	li	a4,16
    513c:	06412683          	lw	a3,100(sp)
    5140:	01b74463          	blt	a4,s11,5148 <_vfiprintf_r+0x568>
    5144:	1900106f          	j	62d4 <_vfiprintf_r+0x16f4>
    5148:	000a8713          	mv	a4,s5
    514c:	0000a317          	auipc	t1,0xa
    5150:	43830313          	add	t1,t1,1080 # f584 <blanks.1>
    5154:	000c0593          	mv	a1,s8
    5158:	000d8a93          	mv	s5,s11
    515c:	01000813          	li	a6,16
    5160:	00700d13          	li	s10,7
    5164:	01112c23          	sw	a7,24(sp)
    5168:	01d12e23          	sw	t4,28(sp)
    516c:	00030c13          	mv	s8,t1
    5170:	00070d93          	mv	s11,a4
    5174:	0180006f          	j	518c <_vfiprintf_r+0x5ac>
    5178:	00268613          	add	a2,a3,2
    517c:	00858593          	add	a1,a1,8
    5180:	00070693          	mv	a3,a4
    5184:	ff0a8a93          	add	s5,s5,-16
    5188:	05585a63          	bge	a6,s5,51dc <_vfiprintf_r+0x5fc>
    518c:	01078793          	add	a5,a5,16
    5190:	00168713          	add	a4,a3,1
    5194:	0185a023          	sw	s8,0(a1)
    5198:	0105a223          	sw	a6,4(a1)
    519c:	06f12423          	sw	a5,104(sp)
    51a0:	06e12223          	sw	a4,100(sp)
    51a4:	fced5ae3          	bge	s10,a4,5178 <_vfiprintf_r+0x598>
    51a8:	56078663          	beqz	a5,5714 <_vfiprintf_r+0xb34>
    51ac:	06010613          	add	a2,sp,96
    51b0:	00098593          	mv	a1,s3
    51b4:	00040513          	mv	a0,s0
    51b8:	8edff0ef          	jal	4aa4 <__sprint_r.part.0>
    51bc:	ee051ae3          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    51c0:	06412683          	lw	a3,100(sp)
    51c4:	01000813          	li	a6,16
    51c8:	ff0a8a93          	add	s5,s5,-16
    51cc:	06812783          	lw	a5,104(sp)
    51d0:	000a0593          	mv	a1,s4
    51d4:	00168613          	add	a2,a3,1
    51d8:	fb584ae3          	blt	a6,s5,518c <_vfiprintf_r+0x5ac>
    51dc:	01812883          	lw	a7,24(sp)
    51e0:	01c12e83          	lw	t4,28(sp)
    51e4:	000d8713          	mv	a4,s11
    51e8:	000c0313          	mv	t1,s8
    51ec:	000a8d93          	mv	s11,s5
    51f0:	00058c13          	mv	s8,a1
    51f4:	00070a93          	mv	s5,a4
    51f8:	01b787b3          	add	a5,a5,s11
    51fc:	006c2023          	sw	t1,0(s8)
    5200:	01bc2223          	sw	s11,4(s8)
    5204:	06f12423          	sw	a5,104(sp)
    5208:	06c12223          	sw	a2,100(sp)
    520c:	00700713          	li	a4,7
    5210:	d0c75ce3          	bge	a4,a2,4f28 <_vfiprintf_r+0x348>
    5214:	160788e3          	beqz	a5,5b84 <_vfiprintf_r+0xfa4>
    5218:	06010613          	add	a2,sp,96
    521c:	00098593          	mv	a1,s3
    5220:	00040513          	mv	a0,s0
    5224:	01d12e23          	sw	t4,28(sp)
    5228:	01112c23          	sw	a7,24(sp)
    522c:	879ff0ef          	jal	4aa4 <__sprint_r.part.0>
    5230:	e80510e3          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    5234:	06812783          	lw	a5,104(sp)
    5238:	01c12e83          	lw	t4,28(sp)
    523c:	01812883          	lw	a7,24(sp)
    5240:	ce9ff06f          	j	4f28 <_vfiprintf_r+0x348>
    5244:	2007f713          	and	a4,a5,512
    5248:	e80716e3          	bnez	a4,50d4 <_vfiprintf_r+0x4f4>
    524c:	0589a503          	lw	a0,88(s3)
    5250:	b65fb0ef          	jal	db4 <__retarget_lock_release_recursive>
    5254:	00c99783          	lh	a5,12(s3)
    5258:	e7dff06f          	j	50d4 <_vfiprintf_r+0x4f4>
    525c:	000aa803          	lw	a6,0(s5)
    5260:	040101a3          	sb	zero,67(sp)
    5264:	000d8e13          	mv	t3,s11
    5268:	004a8a93          	add	s5,s5,4
    526c:	68080ae3          	beqz	a6,6100 <_vfiprintf_r+0x1520>
    5270:	05300793          	li	a5,83
    5274:	3cf68ce3          	beq	a3,a5,5e4c <_vfiprintf_r+0x126c>
    5278:	010df793          	and	a5,s11,16
    527c:	3c0798e3          	bnez	a5,5e4c <_vfiprintf_r+0x126c>
    5280:	00075463          	bgez	a4,5288 <_vfiprintf_r+0x6a8>
    5284:	7fd0006f          	j	6280 <_vfiprintf_r+0x16a0>
    5288:	00070613          	mv	a2,a4
    528c:	00080513          	mv	a0,a6
    5290:	00000593          	li	a1,0
    5294:	03112223          	sw	a7,36(sp)
    5298:	00e12e23          	sw	a4,28(sp)
    529c:	01012c23          	sw	a6,24(sp)
    52a0:	03b12023          	sw	s11,32(sp)
    52a4:	4e4020ef          	jal	7788 <memchr>
    52a8:	00a12823          	sw	a0,16(sp)
    52ac:	01812803          	lw	a6,24(sp)
    52b0:	01c12703          	lw	a4,28(sp)
    52b4:	02012e03          	lw	t3,32(sp)
    52b8:	02412883          	lw	a7,36(sp)
    52bc:	00051463          	bnez	a0,52c4 <_vfiprintf_r+0x6e4>
    52c0:	7990006f          	j	6258 <_vfiprintf_r+0x1678>
    52c4:	41050d33          	sub	s10,a0,a6
    52c8:	fffd4e93          	not	t4,s10
    52cc:	41fede93          	sra	t4,t4,0x1f
    52d0:	01dd7eb3          	and	t4,s10,t4
    52d4:	00012823          	sw	zero,16(sp)
    52d8:	6dd0006f          	j	61b4 <_vfiprintf_r+0x15d4>
    52dc:	04300793          	li	a5,67
    52e0:	000d8e13          	mv	t3,s11
    52e4:	004a8d93          	add	s11,s5,4
    52e8:	00f68663          	beq	a3,a5,52f4 <_vfiprintf_r+0x714>
    52ec:	010e7793          	and	a5,t3,16
    52f0:	280788e3          	beqz	a5,5d80 <_vfiprintf_r+0x11a0>
    52f4:	00800613          	li	a2,8
    52f8:	00000593          	li	a1,0
    52fc:	05810513          	add	a0,sp,88
    5300:	01112e23          	sw	a7,28(sp)
    5304:	01c12c23          	sw	t3,24(sp)
    5308:	ab1fb0ef          	jal	db8 <memset>
    530c:	000aa603          	lw	a2,0(s5)
    5310:	0ac10593          	add	a1,sp,172
    5314:	05810693          	add	a3,sp,88
    5318:	00040513          	mv	a0,s0
    531c:	00b12823          	sw	a1,16(sp)
    5320:	694050ef          	jal	a9b4 <_wcrtomb_r>
    5324:	fff00793          	li	a5,-1
    5328:	01012583          	lw	a1,16(sp)
    532c:	01812e03          	lw	t3,24(sp)
    5330:	01c12883          	lw	a7,28(sp)
    5334:	00050d13          	mv	s10,a0
    5338:	00f51463          	bne	a0,a5,5340 <_vfiprintf_r+0x760>
    533c:	0200106f          	j	635c <_vfiprintf_r+0x177c>
    5340:	fff54e93          	not	t4,a0
    5344:	41fede93          	sra	t4,t4,0x1f
    5348:	01d57eb3          	and	t4,a0,t4
    534c:	040101a3          	sb	zero,67(sp)
    5350:	000d8a93          	mv	s5,s11
    5354:	00058813          	mv	a6,a1
    5358:	a79ff06f          	j	4dd0 <_vfiprintf_r+0x1f0>
    535c:	411008b3          	neg	a7,a7
    5360:	000cc683          	lbu	a3,0(s9)
    5364:	004ded93          	or	s11,s11,4
    5368:	9f9ff06f          	j	4d60 <_vfiprintf_r+0x180>
    536c:	010dee13          	or	t3,s11,16
    5370:	020e7793          	and	a5,t3,32
    5374:	0c0788e3          	beqz	a5,5c44 <_vfiprintf_r+0x1064>
    5378:	007a8a93          	add	s5,s5,7
    537c:	ff8afa93          	and	s5,s5,-8
    5380:	004aa683          	lw	a3,4(s5)
    5384:	000aad83          	lw	s11,0(s5)
    5388:	008a8a93          	add	s5,s5,8
    538c:	00068d13          	mv	s10,a3
    5390:	3006c263          	bltz	a3,5694 <_vfiprintf_r+0xab4>
    5394:	32074063          	bltz	a4,56b4 <_vfiprintf_r+0xad4>
    5398:	01ade6b3          	or	a3,s11,s10
    539c:	f7fe7e13          	and	t3,t3,-129
    53a0:	30069a63          	bnez	a3,56b4 <_vfiprintf_r+0xad4>
    53a4:	68071ae3          	bnez	a4,6238 <_vfiprintf_r+0x1658>
    53a8:	04314783          	lbu	a5,67(sp)
    53ac:	00012823          	sw	zero,16(sp)
    53b0:	00000e93          	li	t4,0
    53b4:	00000d13          	li	s10,0
    53b8:	11010813          	add	a6,sp,272
    53bc:	00078463          	beqz	a5,53c4 <_vfiprintf_r+0x7e4>
    53c0:	001e8e93          	add	t4,t4,1
    53c4:	002e7f93          	and	t6,t3,2
    53c8:	a00f8ae3          	beqz	t6,4ddc <_vfiprintf_r+0x1fc>
    53cc:	002e8e93          	add	t4,t4,2
    53d0:	00200f93          	li	t6,2
    53d4:	a09ff06f          	j	4ddc <_vfiprintf_r+0x1fc>
    53d8:	000cc683          	lbu	a3,0(s9)
    53dc:	06800793          	li	a5,104
    53e0:	4ef686e3          	beq	a3,a5,60cc <_vfiprintf_r+0x14ec>
    53e4:	040ded93          	or	s11,s11,64
    53e8:	979ff06f          	j	4d60 <_vfiprintf_r+0x180>
    53ec:	010de613          	or	a2,s11,16
    53f0:	02067793          	and	a5,a2,32
    53f4:	000780e3          	beqz	a5,5bf4 <_vfiprintf_r+0x1014>
    53f8:	007a8a93          	add	s5,s5,7
    53fc:	ff8afa93          	and	s5,s5,-8
    5400:	000aad83          	lw	s11,0(s5)
    5404:	004aad03          	lw	s10,4(s5)
    5408:	008a8a93          	add	s5,s5,8
    540c:	040101a3          	sb	zero,67(sp)
    5410:	00060e13          	mv	t3,a2
    5414:	2a074063          	bltz	a4,56b4 <_vfiprintf_r+0xad4>
    5418:	01ade6b3          	or	a3,s11,s10
    541c:	f7f67e13          	and	t3,a2,-129
    5420:	28069a63          	bnez	a3,56b4 <_vfiprintf_r+0xad4>
    5424:	00100793          	li	a5,1
    5428:	06071e63          	bnez	a4,54a4 <_vfiprintf_r+0x8c4>
    542c:	f6079ee3          	bnez	a5,53a8 <_vfiprintf_r+0x7c8>
    5430:	00167d13          	and	s10,a2,1
    5434:	0a0d0ce3          	beqz	s10,5cec <_vfiprintf_r+0x110c>
    5438:	03000793          	li	a5,48
    543c:	10f107a3          	sb	a5,271(sp)
    5440:	000d0e93          	mv	t4,s10
    5444:	10f10813          	add	a6,sp,271
    5448:	2980006f          	j	56e0 <_vfiprintf_r+0xb00>
    544c:	02b00793          	li	a5,43
    5450:	000cc683          	lbu	a3,0(s9)
    5454:	04f101a3          	sb	a5,67(sp)
    5458:	909ff06f          	j	4d60 <_vfiprintf_r+0x180>
    545c:	010de693          	or	a3,s11,16
    5460:	0206f793          	and	a5,a3,32
    5464:	7a078c63          	beqz	a5,5c1c <_vfiprintf_r+0x103c>
    5468:	007a8a93          	add	s5,s5,7
    546c:	ff8afa93          	and	s5,s5,-8
    5470:	000aa783          	lw	a5,0(s5)
    5474:	004aa583          	lw	a1,4(s5)
    5478:	008a8a93          	add	s5,s5,8
    547c:	040101a3          	sb	zero,67(sp)
    5480:	bff6fe13          	and	t3,a3,-1025
    5484:	02074c63          	bltz	a4,54bc <_vfiprintf_r+0x8dc>
    5488:	00b7e633          	or	a2,a5,a1
    548c:	b7f6f693          	and	a3,a3,-1153
    5490:	420610e3          	bnez	a2,60b0 <_vfiprintf_r+0x14d0>
    5494:	000e0613          	mv	a2,t3
    5498:	00000793          	li	a5,0
    549c:	00068e13          	mv	t3,a3
    54a0:	f80706e3          	beqz	a4,542c <_vfiprintf_r+0x84c>
    54a4:	00100693          	li	a3,1
    54a8:	58d788e3          	beq	a5,a3,6238 <_vfiprintf_r+0x1658>
    54ac:	00200693          	li	a3,2
    54b0:	46d786e3          	beq	a5,a3,611c <_vfiprintf_r+0x153c>
    54b4:	00000793          	li	a5,0
    54b8:	00000593          	li	a1,0
    54bc:	11010813          	add	a6,sp,272
    54c0:	01d59613          	sll	a2,a1,0x1d
    54c4:	0077f693          	and	a3,a5,7
    54c8:	0037d793          	srl	a5,a5,0x3
    54cc:	03068693          	add	a3,a3,48
    54d0:	00f667b3          	or	a5,a2,a5
    54d4:	0035d593          	srl	a1,a1,0x3
    54d8:	fed80fa3          	sb	a3,-1(a6)
    54dc:	00b7e633          	or	a2,a5,a1
    54e0:	00080513          	mv	a0,a6
    54e4:	fff80813          	add	a6,a6,-1
    54e8:	fc061ce3          	bnez	a2,54c0 <_vfiprintf_r+0x8e0>
    54ec:	001e7793          	and	a5,t3,1
    54f0:	54078e63          	beqz	a5,5a4c <_vfiprintf_r+0xe6c>
    54f4:	03000793          	li	a5,48
    54f8:	54f68a63          	beq	a3,a5,5a4c <_vfiprintf_r+0xe6c>
    54fc:	ffe50513          	add	a0,a0,-2
    5500:	fef80fa3          	sb	a5,-1(a6)
    5504:	11010793          	add	a5,sp,272
    5508:	40a78d33          	sub	s10,a5,a0
    550c:	00070e93          	mv	t4,a4
    5510:	09a744e3          	blt	a4,s10,5d98 <_vfiprintf_r+0x11b8>
    5514:	00050813          	mv	a6,a0
    5518:	1c80006f          	j	56e0 <_vfiprintf_r+0xb00>
    551c:	000086b7          	lui	a3,0x8
    5520:	83068693          	add	a3,a3,-2000 # 7830 <memchr+0xa8>
    5524:	04d11223          	sh	a3,68(sp)
    5528:	0000a697          	auipc	a3,0xa
    552c:	9d868693          	add	a3,a3,-1576 # ef00 <__fini_array_end+0x1a4>
    5530:	000aa783          	lw	a5,0(s5)
    5534:	00000593          	li	a1,0
    5538:	002dee13          	or	t3,s11,2
    553c:	004a8a93          	add	s5,s5,4
    5540:	00d12a23          	sw	a3,20(sp)
    5544:	040101a3          	sb	zero,67(sp)
    5548:	4c074863          	bltz	a4,5a18 <_vfiprintf_r+0xe38>
    554c:	00b7e6b3          	or	a3,a5,a1
    5550:	f7fe7513          	and	a0,t3,-129
    5554:	4a069c63          	bnez	a3,5a0c <_vfiprintf_r+0xe2c>
    5558:	000e0613          	mv	a2,t3
    555c:	00200793          	li	a5,2
    5560:	00050e13          	mv	t3,a0
    5564:	ec5ff06f          	j	5428 <_vfiprintf_r+0x848>
    5568:	00040513          	mv	a0,s0
    556c:	00e12c23          	sw	a4,24(sp)
    5570:	01112823          	sw	a7,16(sp)
    5574:	390020ef          	jal	7904 <_localeconv_r>
    5578:	00452783          	lw	a5,4(a0)
    557c:	00078513          	mv	a0,a5
    5580:	02f12a23          	sw	a5,52(sp)
    5584:	ab5fb0ef          	jal	1038 <strlen>
    5588:	00050793          	mv	a5,a0
    558c:	00040513          	mv	a0,s0
    5590:	02f12823          	sw	a5,48(sp)
    5594:	370020ef          	jal	7904 <_localeconv_r>
    5598:	00852703          	lw	a4,8(a0)
    559c:	03012783          	lw	a5,48(sp)
    55a0:	01012883          	lw	a7,16(sp)
    55a4:	02e12623          	sw	a4,44(sp)
    55a8:	01812703          	lw	a4,24(sp)
    55ac:	a2078ee3          	beqz	a5,4fe8 <_vfiprintf_r+0x408>
    55b0:	02c12783          	lw	a5,44(sp)
    55b4:	000cc683          	lbu	a3,0(s9)
    55b8:	fa078463          	beqz	a5,4d60 <_vfiprintf_r+0x180>
    55bc:	0007c783          	lbu	a5,0(a5)
    55c0:	fa078063          	beqz	a5,4d60 <_vfiprintf_r+0x180>
    55c4:	400ded93          	or	s11,s11,1024
    55c8:	f98ff06f          	j	4d60 <_vfiprintf_r+0x180>
    55cc:	020df793          	and	a5,s11,32
    55d0:	78079263          	bnez	a5,5d54 <_vfiprintf_r+0x1174>
    55d4:	010df793          	and	a5,s11,16
    55d8:	30079ae3          	bnez	a5,60ec <_vfiprintf_r+0x150c>
    55dc:	040df793          	and	a5,s11,64
    55e0:	400796e3          	bnez	a5,61ec <_vfiprintf_r+0x160c>
    55e4:	200dfe13          	and	t3,s11,512
    55e8:	300e02e3          	beqz	t3,60ec <_vfiprintf_r+0x150c>
    55ec:	000aa783          	lw	a5,0(s5)
    55f0:	00c12703          	lw	a4,12(sp)
    55f4:	004a8a93          	add	s5,s5,4
    55f8:	00e78023          	sb	a4,0(a5)
    55fc:	efcff06f          	j	4cf8 <_vfiprintf_r+0x118>
    5600:	000cc683          	lbu	a3,0(s9)
    5604:	06c00793          	li	a5,108
    5608:	2cf68ae3          	beq	a3,a5,60dc <_vfiprintf_r+0x14fc>
    560c:	010ded93          	or	s11,s11,16
    5610:	f50ff06f          	j	4d60 <_vfiprintf_r+0x180>
    5614:	000cc683          	lbu	a3,0(s9)
    5618:	080ded93          	or	s11,s11,128
    561c:	f44ff06f          	j	4d60 <_vfiprintf_r+0x180>
    5620:	000cc683          	lbu	a3,0(s9)
    5624:	02a00793          	li	a5,42
    5628:	001c8593          	add	a1,s9,1
    562c:	54f680e3          	beq	a3,a5,636c <_vfiprintf_r+0x178c>
    5630:	fd068793          	add	a5,a3,-48
    5634:	00900613          	li	a2,9
    5638:	00000713          	li	a4,0
    563c:	00900513          	li	a0,9
    5640:	02f66463          	bltu	a2,a5,5668 <_vfiprintf_r+0xa88>
    5644:	0005c683          	lbu	a3,0(a1)
    5648:	00271613          	sll	a2,a4,0x2
    564c:	00e60733          	add	a4,a2,a4
    5650:	00171713          	sll	a4,a4,0x1
    5654:	00f70733          	add	a4,a4,a5
    5658:	fd068793          	add	a5,a3,-48
    565c:	00158593          	add	a1,a1,1
    5660:	fef572e3          	bgeu	a0,a5,5644 <_vfiprintf_r+0xa64>
    5664:	74074063          	bltz	a4,5da4 <_vfiprintf_r+0x11c4>
    5668:	00058c93          	mv	s9,a1
    566c:	ef8ff06f          	j	4d64 <_vfiprintf_r+0x184>
    5670:	000cc683          	lbu	a3,0(s9)
    5674:	001ded93          	or	s11,s11,1
    5678:	ee8ff06f          	j	4d60 <_vfiprintf_r+0x180>
    567c:	04314783          	lbu	a5,67(sp)
    5680:	000cc683          	lbu	a3,0(s9)
    5684:	ec079e63          	bnez	a5,4d60 <_vfiprintf_r+0x180>
    5688:	02000793          	li	a5,32
    568c:	04f101a3          	sb	a5,67(sp)
    5690:	ed0ff06f          	j	4d60 <_vfiprintf_r+0x180>
    5694:	02d00613          	li	a2,45
    5698:	01b036b3          	snez	a3,s11
    569c:	41a000b3          	neg	ra,s10
    56a0:	04c101a3          	sb	a2,67(sp)
    56a4:	40d08d33          	sub	s10,ra,a3
    56a8:	41b00db3          	neg	s11,s11
    56ac:	00074463          	bltz	a4,56b4 <_vfiprintf_r+0xad4>
    56b0:	f7fe7e13          	and	t3,t3,-129
    56b4:	120d14e3          	bnez	s10,5fdc <_vfiprintf_r+0x13fc>
    56b8:	00900693          	li	a3,9
    56bc:	13b6e0e3          	bltu	a3,s11,5fdc <_vfiprintf_r+0x13fc>
    56c0:	030d8793          	add	a5,s11,48
    56c4:	0ff7f793          	zext.b	a5,a5
    56c8:	10f107a3          	sb	a5,271(sp)
    56cc:	00070e93          	mv	t4,a4
    56d0:	00e04463          	bgtz	a4,56d8 <_vfiprintf_r+0xaf8>
    56d4:	00100e93          	li	t4,1
    56d8:	00100d13          	li	s10,1
    56dc:	10f10813          	add	a6,sp,271
    56e0:	04314783          	lbu	a5,67(sp)
    56e4:	00012823          	sw	zero,16(sp)
    56e8:	cc079ce3          	bnez	a5,53c0 <_vfiprintf_r+0x7e0>
    56ec:	cd9ff06f          	j	53c4 <_vfiprintf_r+0x7e4>
    56f0:	00100713          	li	a4,1
    56f4:	000d0793          	mv	a5,s10
    56f8:	07012623          	sw	a6,108(sp)
    56fc:	07a12823          	sw	s10,112(sp)
    5700:	07a12423          	sw	s10,104(sp)
    5704:	06e12223          	sw	a4,100(sp)
    5708:	000a0c13          	mv	s8,s4
    570c:	008c0c13          	add	s8,s8,8
    5710:	809ff06f          	j	4f18 <_vfiprintf_r+0x338>
    5714:	00100613          	li	a2,1
    5718:	00000693          	li	a3,0
    571c:	000a0593          	mv	a1,s4
    5720:	a65ff06f          	j	5184 <_vfiprintf_r+0x5a4>
    5724:	41d88db3          	sub	s11,a7,t4
    5728:	f9b05a63          	blez	s11,4ebc <_vfiprintf_r+0x2dc>
    572c:	01000593          	li	a1,16
    5730:	3bb5dae3          	bge	a1,s11,62e4 <_vfiprintf_r+0x1704>
    5734:	0000af97          	auipc	t6,0xa
    5738:	e40f8f93          	add	t6,t6,-448 # f574 <zeroes.0>
    573c:	02e12223          	sw	a4,36(sp)
    5740:	000a8713          	mv	a4,s5
    5744:	000c0693          	mv	a3,s8
    5748:	000d8a93          	mv	s5,s11
    574c:	01000f13          	li	t5,16
    5750:	00700293          	li	t0,7
    5754:	01c12c23          	sw	t3,24(sp)
    5758:	01012e23          	sw	a6,28(sp)
    575c:	03112023          	sw	a7,32(sp)
    5760:	03d12423          	sw	t4,40(sp)
    5764:	000f8c13          	mv	s8,t6
    5768:	00070d93          	mv	s11,a4
    576c:	0180006f          	j	5784 <_vfiprintf_r+0xba4>
    5770:	00260513          	add	a0,a2,2
    5774:	00868693          	add	a3,a3,8
    5778:	00070613          	mv	a2,a4
    577c:	ff0a8a93          	add	s5,s5,-16
    5780:	055f5c63          	bge	t5,s5,57d8 <_vfiprintf_r+0xbf8>
    5784:	01078793          	add	a5,a5,16
    5788:	00160713          	add	a4,a2,1
    578c:	0186a023          	sw	s8,0(a3)
    5790:	01e6a223          	sw	t5,4(a3)
    5794:	06f12423          	sw	a5,104(sp)
    5798:	06e12223          	sw	a4,100(sp)
    579c:	fce2dae3          	bge	t0,a4,5770 <_vfiprintf_r+0xb90>
    57a0:	1c078663          	beqz	a5,596c <_vfiprintf_r+0xd8c>
    57a4:	06010613          	add	a2,sp,96
    57a8:	00098593          	mv	a1,s3
    57ac:	00040513          	mv	a0,s0
    57b0:	af4ff0ef          	jal	4aa4 <__sprint_r.part.0>
    57b4:	8e051ee3          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    57b8:	06412603          	lw	a2,100(sp)
    57bc:	01000f13          	li	t5,16
    57c0:	ff0a8a93          	add	s5,s5,-16
    57c4:	06812783          	lw	a5,104(sp)
    57c8:	000a0693          	mv	a3,s4
    57cc:	00160513          	add	a0,a2,1
    57d0:	00700293          	li	t0,7
    57d4:	fb5f48e3          	blt	t5,s5,5784 <_vfiprintf_r+0xba4>
    57d8:	01812e03          	lw	t3,24(sp)
    57dc:	01c12803          	lw	a6,28(sp)
    57e0:	02012883          	lw	a7,32(sp)
    57e4:	02412703          	lw	a4,36(sp)
    57e8:	02812e83          	lw	t4,40(sp)
    57ec:	000d8613          	mv	a2,s11
    57f0:	000c0f93          	mv	t6,s8
    57f4:	000a8d93          	mv	s11,s5
    57f8:	00068c13          	mv	s8,a3
    57fc:	00060a93          	mv	s5,a2
    5800:	01b787b3          	add	a5,a5,s11
    5804:	01fc2023          	sw	t6,0(s8)
    5808:	01bc2223          	sw	s11,4(s8)
    580c:	06f12423          	sw	a5,104(sp)
    5810:	06a12223          	sw	a0,100(sp)
    5814:	00700613          	li	a2,7
    5818:	4ea65863          	bge	a2,a0,5d08 <_vfiprintf_r+0x1128>
    581c:	1a0786e3          	beqz	a5,61c8 <_vfiprintf_r+0x15e8>
    5820:	06010613          	add	a2,sp,96
    5824:	00098593          	mv	a1,s3
    5828:	00040513          	mv	a0,s0
    582c:	03d12423          	sw	t4,40(sp)
    5830:	02e12223          	sw	a4,36(sp)
    5834:	03112023          	sw	a7,32(sp)
    5838:	01012e23          	sw	a6,28(sp)
    583c:	01c12c23          	sw	t3,24(sp)
    5840:	a64ff0ef          	jal	4aa4 <__sprint_r.part.0>
    5844:	860516e3          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    5848:	02412703          	lw	a4,36(sp)
    584c:	06412603          	lw	a2,100(sp)
    5850:	06812783          	lw	a5,104(sp)
    5854:	41a70733          	sub	a4,a4,s10
    5858:	02812e83          	lw	t4,40(sp)
    585c:	02012883          	lw	a7,32(sp)
    5860:	01c12803          	lw	a6,28(sp)
    5864:	01812e03          	lw	t3,24(sp)
    5868:	000a0c13          	mv	s8,s4
    586c:	00160f13          	add	t5,a2,1
    5870:	e4e05a63          	blez	a4,4ec4 <_vfiprintf_r+0x2e4>
    5874:	01000593          	li	a1,16
    5878:	0000af97          	auipc	t6,0xa
    587c:	cfcf8f93          	add	t6,t6,-772 # f574 <zeroes.0>
    5880:	0ae5da63          	bge	a1,a4,5934 <_vfiprintf_r+0xd54>
    5884:	000c0593          	mv	a1,s8
    5888:	03512423          	sw	s5,40(sp)
    588c:	01000d93          	li	s11,16
    5890:	00700293          	li	t0,7
    5894:	01c12c23          	sw	t3,24(sp)
    5898:	01012e23          	sw	a6,28(sp)
    589c:	03112023          	sw	a7,32(sp)
    58a0:	03d12223          	sw	t4,36(sp)
    58a4:	00070a93          	mv	s5,a4
    58a8:	000b0c13          	mv	s8,s6
    58ac:	0180006f          	j	58c4 <_vfiprintf_r+0xce4>
    58b0:	00260f13          	add	t5,a2,2
    58b4:	00858593          	add	a1,a1,8
    58b8:	00068613          	mv	a2,a3
    58bc:	ff0a8a93          	add	s5,s5,-16
    58c0:	055dda63          	bge	s11,s5,5914 <_vfiprintf_r+0xd34>
    58c4:	01078793          	add	a5,a5,16
    58c8:	00160693          	add	a3,a2,1
    58cc:	0165a023          	sw	s6,0(a1)
    58d0:	01b5a223          	sw	s11,4(a1)
    58d4:	06f12423          	sw	a5,104(sp)
    58d8:	06d12223          	sw	a3,100(sp)
    58dc:	fcd2dae3          	bge	t0,a3,58b0 <_vfiprintf_r+0xcd0>
    58e0:	06078e63          	beqz	a5,595c <_vfiprintf_r+0xd7c>
    58e4:	06010613          	add	a2,sp,96
    58e8:	00098593          	mv	a1,s3
    58ec:	00040513          	mv	a0,s0
    58f0:	9b4ff0ef          	jal	4aa4 <__sprint_r.part.0>
    58f4:	fa051e63          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    58f8:	06412603          	lw	a2,100(sp)
    58fc:	ff0a8a93          	add	s5,s5,-16
    5900:	06812783          	lw	a5,104(sp)
    5904:	000a0593          	mv	a1,s4
    5908:	00160f13          	add	t5,a2,1
    590c:	00700293          	li	t0,7
    5910:	fb5dcae3          	blt	s11,s5,58c4 <_vfiprintf_r+0xce4>
    5914:	000a8713          	mv	a4,s5
    5918:	01812e03          	lw	t3,24(sp)
    591c:	01c12803          	lw	a6,28(sp)
    5920:	02012883          	lw	a7,32(sp)
    5924:	02412e83          	lw	t4,36(sp)
    5928:	02812a83          	lw	s5,40(sp)
    592c:	000c0f93          	mv	t6,s8
    5930:	00058c13          	mv	s8,a1
    5934:	00e787b3          	add	a5,a5,a4
    5938:	00ec2223          	sw	a4,4(s8)
    593c:	01fc2023          	sw	t6,0(s8)
    5940:	06f12423          	sw	a5,104(sp)
    5944:	07e12223          	sw	t5,100(sp)
    5948:	00700713          	li	a4,7
    594c:	25e74863          	blt	a4,t5,5b9c <_vfiprintf_r+0xfbc>
    5950:	008c0c13          	add	s8,s8,8
    5954:	001f0f13          	add	t5,t5,1
    5958:	d6cff06f          	j	4ec4 <_vfiprintf_r+0x2e4>
    595c:	00100f13          	li	t5,1
    5960:	00000613          	li	a2,0
    5964:	000a0593          	mv	a1,s4
    5968:	f55ff06f          	j	58bc <_vfiprintf_r+0xcdc>
    596c:	00100513          	li	a0,1
    5970:	00000613          	li	a2,0
    5974:	000a0693          	mv	a3,s4
    5978:	e05ff06f          	j	577c <_vfiprintf_r+0xb9c>
    597c:	06078263          	beqz	a5,59e0 <_vfiprintf_r+0xe00>
    5980:	06010613          	add	a2,sp,96
    5984:	00098593          	mv	a1,s3
    5988:	00040513          	mv	a0,s0
    598c:	03d12e23          	sw	t4,60(sp)
    5990:	02e12c23          	sw	a4,56(sp)
    5994:	03112423          	sw	a7,40(sp)
    5998:	03012223          	sw	a6,36(sp)
    599c:	02512023          	sw	t0,32(sp)
    59a0:	01f12e23          	sw	t6,28(sp)
    59a4:	01c12c23          	sw	t3,24(sp)
    59a8:	8fcff0ef          	jal	4aa4 <__sprint_r.part.0>
    59ac:	f0051263          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    59b0:	06412603          	lw	a2,100(sp)
    59b4:	06812783          	lw	a5,104(sp)
    59b8:	03c12e83          	lw	t4,60(sp)
    59bc:	03812703          	lw	a4,56(sp)
    59c0:	02812883          	lw	a7,40(sp)
    59c4:	02412803          	lw	a6,36(sp)
    59c8:	02012283          	lw	t0,32(sp)
    59cc:	01c12f83          	lw	t6,28(sp)
    59d0:	01812e03          	lw	t3,24(sp)
    59d4:	000a0c13          	mv	s8,s4
    59d8:	00160f13          	add	t5,a2,1
    59dc:	c58ff06f          	j	4e34 <_vfiprintf_r+0x254>
    59e0:	380f8863          	beqz	t6,5d70 <_vfiprintf_r+0x1190>
    59e4:	04410793          	add	a5,sp,68
    59e8:	06f12623          	sw	a5,108(sp)
    59ec:	00200793          	li	a5,2
    59f0:	06f12823          	sw	a5,112(sp)
    59f4:	00100f13          	li	t5,1
    59f8:	000a0c13          	mv	s8,s4
    59fc:	000f0613          	mv	a2,t5
    5a00:	008c0c13          	add	s8,s8,8
    5a04:	001f0f13          	add	t5,t5,1
    5a08:	cacff06f          	j	4eb4 <_vfiprintf_r+0x2d4>
    5a0c:	00200693          	li	a3,2
    5a10:	00050e13          	mv	t3,a0
    5a14:	aa0684e3          	beqz	a3,54bc <_vfiprintf_r+0x8dc>
    5a18:	01412503          	lw	a0,20(sp)
    5a1c:	11010813          	add	a6,sp,272
    5a20:	00f7f693          	and	a3,a5,15
    5a24:	00d506b3          	add	a3,a0,a3
    5a28:	0006c603          	lbu	a2,0(a3)
    5a2c:	0047d793          	srl	a5,a5,0x4
    5a30:	01c59693          	sll	a3,a1,0x1c
    5a34:	00f6e7b3          	or	a5,a3,a5
    5a38:	0045d593          	srl	a1,a1,0x4
    5a3c:	fec80fa3          	sb	a2,-1(a6)
    5a40:	00b7e6b3          	or	a3,a5,a1
    5a44:	fff80813          	add	a6,a6,-1
    5a48:	fc069ce3          	bnez	a3,5a20 <_vfiprintf_r+0xe40>
    5a4c:	11010793          	add	a5,sp,272
    5a50:	41078d33          	sub	s10,a5,a6
    5a54:	00070e93          	mv	t4,a4
    5a58:	c9a754e3          	bge	a4,s10,56e0 <_vfiprintf_r+0xb00>
    5a5c:	000d0e93          	mv	t4,s10
    5a60:	c81ff06f          	j	56e0 <_vfiprintf_r+0xb00>
    5a64:	01000513          	li	a0,16
    5a68:	01b554e3          	bge	a0,s11,6270 <_vfiprintf_r+0x1690>
    5a6c:	000a8693          	mv	a3,s5
    5a70:	0000a317          	auipc	t1,0xa
    5a74:	b1430313          	add	t1,t1,-1260 # f584 <blanks.1>
    5a78:	02e12c23          	sw	a4,56(sp)
    5a7c:	000d8a93          	mv	s5,s11
    5a80:	000c0713          	mv	a4,s8
    5a84:	01000f13          	li	t5,16
    5a88:	00700393          	li	t2,7
    5a8c:	01c12c23          	sw	t3,24(sp)
    5a90:	01f12e23          	sw	t6,28(sp)
    5a94:	02512023          	sw	t0,32(sp)
    5a98:	03012223          	sw	a6,36(sp)
    5a9c:	03112423          	sw	a7,40(sp)
    5aa0:	03d12e23          	sw	t4,60(sp)
    5aa4:	00030c13          	mv	s8,t1
    5aa8:	00068d93          	mv	s11,a3
    5aac:	01c0006f          	j	5ac8 <_vfiprintf_r+0xee8>
    5ab0:	00260513          	add	a0,a2,2
    5ab4:	00870713          	add	a4,a4,8
    5ab8:	00058613          	mv	a2,a1
    5abc:	ff0a8a93          	add	s5,s5,-16
    5ac0:	055f5c63          	bge	t5,s5,5b18 <_vfiprintf_r+0xf38>
    5ac4:	00160593          	add	a1,a2,1
    5ac8:	01078793          	add	a5,a5,16
    5acc:	01872023          	sw	s8,0(a4)
    5ad0:	01e72223          	sw	t5,4(a4)
    5ad4:	06f12423          	sw	a5,104(sp)
    5ad8:	06b12223          	sw	a1,100(sp)
    5adc:	fcb3dae3          	bge	t2,a1,5ab0 <_vfiprintf_r+0xed0>
    5ae0:	08078a63          	beqz	a5,5b74 <_vfiprintf_r+0xf94>
    5ae4:	06010613          	add	a2,sp,96
    5ae8:	00098593          	mv	a1,s3
    5aec:	00040513          	mv	a0,s0
    5af0:	fb5fe0ef          	jal	4aa4 <__sprint_r.part.0>
    5af4:	da051e63          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    5af8:	06412603          	lw	a2,100(sp)
    5afc:	01000f13          	li	t5,16
    5b00:	ff0a8a93          	add	s5,s5,-16
    5b04:	06812783          	lw	a5,104(sp)
    5b08:	000a0713          	mv	a4,s4
    5b0c:	00160513          	add	a0,a2,1
    5b10:	00700393          	li	t2,7
    5b14:	fb5f48e3          	blt	t5,s5,5ac4 <_vfiprintf_r+0xee4>
    5b18:	000c0313          	mv	t1,s8
    5b1c:	01812e03          	lw	t3,24(sp)
    5b20:	00070c13          	mv	s8,a4
    5b24:	01c12f83          	lw	t6,28(sp)
    5b28:	02012283          	lw	t0,32(sp)
    5b2c:	02412803          	lw	a6,36(sp)
    5b30:	02812883          	lw	a7,40(sp)
    5b34:	03c12e83          	lw	t4,60(sp)
    5b38:	03812703          	lw	a4,56(sp)
    5b3c:	000d8693          	mv	a3,s11
    5b40:	000a8d93          	mv	s11,s5
    5b44:	00068a93          	mv	s5,a3
    5b48:	01b787b3          	add	a5,a5,s11
    5b4c:	006c2023          	sw	t1,0(s8)
    5b50:	01bc2223          	sw	s11,4(s8)
    5b54:	06f12423          	sw	a5,104(sp)
    5b58:	06a12223          	sw	a0,100(sp)
    5b5c:	00700613          	li	a2,7
    5b60:	12a64063          	blt	a2,a0,5c80 <_vfiprintf_r+0x10a0>
    5b64:	008c0c13          	add	s8,s8,8
    5b68:	00150f13          	add	t5,a0,1
    5b6c:	00050613          	mv	a2,a0
    5b70:	a8cff06f          	j	4dfc <_vfiprintf_r+0x21c>
    5b74:	00000613          	li	a2,0
    5b78:	00100513          	li	a0,1
    5b7c:	000a0713          	mv	a4,s4
    5b80:	f3dff06f          	j	5abc <_vfiprintf_r+0xedc>
    5b84:	01d8d463          	bge	a7,t4,5b8c <_vfiprintf_r+0xfac>
    5b88:	000e8893          	mv	a7,t4
    5b8c:	00c12783          	lw	a5,12(sp)
    5b90:	011787b3          	add	a5,a5,a7
    5b94:	00f12623          	sw	a5,12(sp)
    5b98:	ba8ff06f          	j	4f40 <_vfiprintf_r+0x360>
    5b9c:	b4078ae3          	beqz	a5,56f0 <_vfiprintf_r+0xb10>
    5ba0:	06010613          	add	a2,sp,96
    5ba4:	00098593          	mv	a1,s3
    5ba8:	00040513          	mv	a0,s0
    5bac:	03d12223          	sw	t4,36(sp)
    5bb0:	03112023          	sw	a7,32(sp)
    5bb4:	01012e23          	sw	a6,28(sp)
    5bb8:	01c12c23          	sw	t3,24(sp)
    5bbc:	ee9fe0ef          	jal	4aa4 <__sprint_r.part.0>
    5bc0:	ce051863          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    5bc4:	06412f03          	lw	t5,100(sp)
    5bc8:	06812783          	lw	a5,104(sp)
    5bcc:	02412e83          	lw	t4,36(sp)
    5bd0:	02012883          	lw	a7,32(sp)
    5bd4:	01c12803          	lw	a6,28(sp)
    5bd8:	01812e03          	lw	t3,24(sp)
    5bdc:	000a0c13          	mv	s8,s4
    5be0:	001f0f13          	add	t5,t5,1
    5be4:	ae0ff06f          	j	4ec4 <_vfiprintf_r+0x2e4>
    5be8:	06012223          	sw	zero,100(sp)
    5bec:	000a0c13          	mv	s8,s4
    5bf0:	c84ff06f          	j	5074 <_vfiprintf_r+0x494>
    5bf4:	01067693          	and	a3,a2,16
    5bf8:	000aa783          	lw	a5,0(s5)
    5bfc:	004a8a93          	add	s5,s5,4
    5c00:	12069c63          	bnez	a3,5d38 <_vfiprintf_r+0x1158>
    5c04:	04067693          	and	a3,a2,64
    5c08:	12068463          	beqz	a3,5d30 <_vfiprintf_r+0x1150>
    5c0c:	01079d93          	sll	s11,a5,0x10
    5c10:	010ddd93          	srl	s11,s11,0x10
    5c14:	00000d13          	li	s10,0
    5c18:	ff4ff06f          	j	540c <_vfiprintf_r+0x82c>
    5c1c:	0106f613          	and	a2,a3,16
    5c20:	000aa783          	lw	a5,0(s5)
    5c24:	004a8a93          	add	s5,s5,4
    5c28:	12061263          	bnez	a2,5d4c <_vfiprintf_r+0x116c>
    5c2c:	0406f613          	and	a2,a3,64
    5c30:	10060a63          	beqz	a2,5d44 <_vfiprintf_r+0x1164>
    5c34:	01079793          	sll	a5,a5,0x10
    5c38:	0107d793          	srl	a5,a5,0x10
    5c3c:	00000593          	li	a1,0
    5c40:	83dff06f          	j	547c <_vfiprintf_r+0x89c>
    5c44:	010e7693          	and	a3,t3,16
    5c48:	000aa783          	lw	a5,0(s5)
    5c4c:	004a8a93          	add	s5,s5,4
    5c50:	0c069863          	bnez	a3,5d20 <_vfiprintf_r+0x1140>
    5c54:	040e7693          	and	a3,t3,64
    5c58:	0c068063          	beqz	a3,5d18 <_vfiprintf_r+0x1138>
    5c5c:	01079d93          	sll	s11,a5,0x10
    5c60:	410ddd93          	sra	s11,s11,0x10
    5c64:	41fddd13          	sra	s10,s11,0x1f
    5c68:	000d0693          	mv	a3,s10
    5c6c:	f24ff06f          	j	5390 <_vfiprintf_r+0x7b0>
    5c70:	00100f13          	li	t5,1
    5c74:	00000613          	li	a2,0
    5c78:	000a0c13          	mv	s8,s4
    5c7c:	a38ff06f          	j	4eb4 <_vfiprintf_r+0x2d4>
    5c80:	1a078463          	beqz	a5,5e28 <_vfiprintf_r+0x1248>
    5c84:	06010613          	add	a2,sp,96
    5c88:	00098593          	mv	a1,s3
    5c8c:	00040513          	mv	a0,s0
    5c90:	03d12e23          	sw	t4,60(sp)
    5c94:	02e12c23          	sw	a4,56(sp)
    5c98:	03112423          	sw	a7,40(sp)
    5c9c:	03012223          	sw	a6,36(sp)
    5ca0:	02512023          	sw	t0,32(sp)
    5ca4:	01f12e23          	sw	t6,28(sp)
    5ca8:	01c12c23          	sw	t3,24(sp)
    5cac:	df9fe0ef          	jal	4aa4 <__sprint_r.part.0>
    5cb0:	c0051063          	bnez	a0,50b0 <_vfiprintf_r+0x4d0>
    5cb4:	06412603          	lw	a2,100(sp)
    5cb8:	06812783          	lw	a5,104(sp)
    5cbc:	03c12e83          	lw	t4,60(sp)
    5cc0:	03812703          	lw	a4,56(sp)
    5cc4:	02812883          	lw	a7,40(sp)
    5cc8:	02412803          	lw	a6,36(sp)
    5ccc:	02012283          	lw	t0,32(sp)
    5cd0:	01c12f83          	lw	t6,28(sp)
    5cd4:	01812e03          	lw	t3,24(sp)
    5cd8:	000a0c13          	mv	s8,s4
    5cdc:	00160f13          	add	t5,a2,1
    5ce0:	91cff06f          	j	4dfc <_vfiprintf_r+0x21c>
    5ce4:	000d8e13          	mv	t3,s11
    5ce8:	e88ff06f          	j	5370 <_vfiprintf_r+0x790>
    5cec:	00000e93          	li	t4,0
    5cf0:	11010813          	add	a6,sp,272
    5cf4:	9edff06f          	j	56e0 <_vfiprintf_r+0xb00>
    5cf8:	0589a503          	lw	a0,88(s3)
    5cfc:	8b4fb0ef          	jal	db0 <__retarget_lock_acquire_recursive>
    5d00:	00c99783          	lh	a5,12(s3)
    5d04:	f41fe06f          	j	4c44 <_vfiprintf_r+0x64>
    5d08:	008c0c13          	add	s8,s8,8
    5d0c:	00150f13          	add	t5,a0,1
    5d10:	00050613          	mv	a2,a0
    5d14:	9a8ff06f          	j	4ebc <_vfiprintf_r+0x2dc>
    5d18:	200e7693          	and	a3,t3,512
    5d1c:	50069463          	bnez	a3,6224 <_vfiprintf_r+0x1644>
    5d20:	41f7dd13          	sra	s10,a5,0x1f
    5d24:	00078d93          	mv	s11,a5
    5d28:	000d0693          	mv	a3,s10
    5d2c:	e64ff06f          	j	5390 <_vfiprintf_r+0x7b0>
    5d30:	20067693          	and	a3,a2,512
    5d34:	4c069663          	bnez	a3,6200 <_vfiprintf_r+0x1620>
    5d38:	00078d93          	mv	s11,a5
    5d3c:	00000d13          	li	s10,0
    5d40:	eccff06f          	j	540c <_vfiprintf_r+0x82c>
    5d44:	2006f613          	and	a2,a3,512
    5d48:	4c061863          	bnez	a2,6218 <_vfiprintf_r+0x1638>
    5d4c:	00000593          	li	a1,0
    5d50:	f2cff06f          	j	547c <_vfiprintf_r+0x89c>
    5d54:	00c12683          	lw	a3,12(sp)
    5d58:	000aa783          	lw	a5,0(s5)
    5d5c:	004a8a93          	add	s5,s5,4
    5d60:	41f6d713          	sra	a4,a3,0x1f
    5d64:	00d7a023          	sw	a3,0(a5)
    5d68:	00e7a223          	sw	a4,4(a5)
    5d6c:	f8dfe06f          	j	4cf8 <_vfiprintf_r+0x118>
    5d70:	00000613          	li	a2,0
    5d74:	00100f13          	li	t5,1
    5d78:	000a0c13          	mv	s8,s4
    5d7c:	938ff06f          	j	4eb4 <_vfiprintf_r+0x2d4>
    5d80:	000aa783          	lw	a5,0(s5)
    5d84:	00100e93          	li	t4,1
    5d88:	00100d13          	li	s10,1
    5d8c:	0af10623          	sb	a5,172(sp)
    5d90:	0ac10593          	add	a1,sp,172
    5d94:	db8ff06f          	j	534c <_vfiprintf_r+0x76c>
    5d98:	000d0e93          	mv	t4,s10
    5d9c:	00050813          	mv	a6,a0
    5da0:	941ff06f          	j	56e0 <_vfiprintf_r+0xb00>
    5da4:	fff00713          	li	a4,-1
    5da8:	00058c93          	mv	s9,a1
    5dac:	fb9fe06f          	j	4d64 <_vfiprintf_r+0x184>
    5db0:	000d8613          	mv	a2,s11
    5db4:	e3cff06f          	j	53f0 <_vfiprintf_r+0x810>
    5db8:	00009797          	auipc	a5,0x9
    5dbc:	15c78793          	add	a5,a5,348 # ef14 <__fini_array_end+0x1b8>
    5dc0:	000d8e13          	mv	t3,s11
    5dc4:	00f12a23          	sw	a5,20(sp)
    5dc8:	020e7793          	and	a5,t3,32
    5dcc:	1c078c63          	beqz	a5,5fa4 <_vfiprintf_r+0x13c4>
    5dd0:	007a8a93          	add	s5,s5,7
    5dd4:	ff8afa93          	and	s5,s5,-8
    5dd8:	000aa783          	lw	a5,0(s5)
    5ddc:	004aa583          	lw	a1,4(s5)
    5de0:	008a8a93          	add	s5,s5,8
    5de4:	001e7613          	and	a2,t3,1
    5de8:	00060e63          	beqz	a2,5e04 <_vfiprintf_r+0x1224>
    5dec:	00b7e633          	or	a2,a5,a1
    5df0:	00060a63          	beqz	a2,5e04 <_vfiprintf_r+0x1224>
    5df4:	03000613          	li	a2,48
    5df8:	04c10223          	sb	a2,68(sp)
    5dfc:	04d102a3          	sb	a3,69(sp)
    5e00:	002e6e13          	or	t3,t3,2
    5e04:	bffe7e13          	and	t3,t3,-1025
    5e08:	f3cff06f          	j	5544 <_vfiprintf_r+0x964>
    5e0c:	000d8693          	mv	a3,s11
    5e10:	e50ff06f          	j	5460 <_vfiprintf_r+0x880>
    5e14:	00009797          	auipc	a5,0x9
    5e18:	0ec78793          	add	a5,a5,236 # ef00 <__fini_array_end+0x1a4>
    5e1c:	000d8e13          	mv	t3,s11
    5e20:	00f12a23          	sw	a5,20(sp)
    5e24:	fa5ff06f          	j	5dc8 <_vfiprintf_r+0x11e8>
    5e28:	04314603          	lbu	a2,67(sp)
    5e2c:	3a060a63          	beqz	a2,61e0 <_vfiprintf_r+0x1600>
    5e30:	04310793          	add	a5,sp,67
    5e34:	06f12623          	sw	a5,108(sp)
    5e38:	00100793          	li	a5,1
    5e3c:	06f12823          	sw	a5,112(sp)
    5e40:	00100f13          	li	t5,1
    5e44:	000a0c13          	mv	s8,s4
    5e48:	fe1fe06f          	j	4e28 <_vfiprintf_r+0x248>
    5e4c:	00800613          	li	a2,8
    5e50:	00000593          	li	a1,0
    5e54:	05810513          	add	a0,sp,88
    5e58:	02e12023          	sw	a4,32(sp)
    5e5c:	01112e23          	sw	a7,28(sp)
    5e60:	01c12c23          	sw	t3,24(sp)
    5e64:	05012623          	sw	a6,76(sp)
    5e68:	01012823          	sw	a6,16(sp)
    5e6c:	f4dfa0ef          	jal	db8 <memset>
    5e70:	02012703          	lw	a4,32(sp)
    5e74:	01012803          	lw	a6,16(sp)
    5e78:	01812e03          	lw	t3,24(sp)
    5e7c:	01c12883          	lw	a7,28(sp)
    5e80:	2a074463          	bltz	a4,6128 <_vfiprintf_r+0x1548>
    5e84:	00000d93          	li	s11,0
    5e88:	00000d13          	li	s10,0
    5e8c:	01812823          	sw	s8,16(sp)
    5e90:	01012e23          	sw	a6,28(sp)
    5e94:	000d8c13          	mv	s8,s11
    5e98:	03112023          	sw	a7,32(sp)
    5e9c:	000c8d93          	mv	s11,s9
    5ea0:	000a8c93          	mv	s9,s5
    5ea4:	000d0a93          	mv	s5,s10
    5ea8:	00098d13          	mv	s10,s3
    5eac:	00070993          	mv	s3,a4
    5eb0:	0300006f          	j	5ee0 <_vfiprintf_r+0x1300>
    5eb4:	05810693          	add	a3,sp,88
    5eb8:	0ac10593          	add	a1,sp,172
    5ebc:	00040513          	mv	a0,s0
    5ec0:	2f5040ef          	jal	a9b4 <_wcrtomb_r>
    5ec4:	fff00793          	li	a5,-1
    5ec8:	48f50063          	beq	a0,a5,6348 <_vfiprintf_r+0x1768>
    5ecc:	00aa87b3          	add	a5,s5,a0
    5ed0:	02f9c063          	blt	s3,a5,5ef0 <_vfiprintf_r+0x1310>
    5ed4:	004c0c13          	add	s8,s8,4
    5ed8:	45378463          	beq	a5,s3,6320 <_vfiprintf_r+0x1740>
    5edc:	00078a93          	mv	s5,a5
    5ee0:	04c12783          	lw	a5,76(sp)
    5ee4:	018787b3          	add	a5,a5,s8
    5ee8:	0007a603          	lw	a2,0(a5)
    5eec:	fc0614e3          	bnez	a2,5eb4 <_vfiprintf_r+0x12d4>
    5ef0:	01012c03          	lw	s8,16(sp)
    5ef4:	01812e03          	lw	t3,24(sp)
    5ef8:	01c12803          	lw	a6,28(sp)
    5efc:	02012883          	lw	a7,32(sp)
    5f00:	000d0993          	mv	s3,s10
    5f04:	000a8d13          	mv	s10,s5
    5f08:	000c8a93          	mv	s5,s9
    5f0c:	000d8c93          	mv	s9,s11
    5f10:	280d0e63          	beqz	s10,61ac <_vfiprintf_r+0x15cc>
    5f14:	06300793          	li	a5,99
    5f18:	33a7d463          	bge	a5,s10,6240 <_vfiprintf_r+0x1660>
    5f1c:	001d0593          	add	a1,s10,1
    5f20:	00040513          	mv	a0,s0
    5f24:	01112c23          	sw	a7,24(sp)
    5f28:	01c12823          	sw	t3,16(sp)
    5f2c:	de8fb0ef          	jal	1514 <_malloc_r>
    5f30:	01012e03          	lw	t3,16(sp)
    5f34:	01812883          	lw	a7,24(sp)
    5f38:	00050813          	mv	a6,a0
    5f3c:	42050063          	beqz	a0,635c <_vfiprintf_r+0x177c>
    5f40:	00a12823          	sw	a0,16(sp)
    5f44:	00800613          	li	a2,8
    5f48:	00000593          	li	a1,0
    5f4c:	05810513          	add	a0,sp,88
    5f50:	03112023          	sw	a7,32(sp)
    5f54:	01c12e23          	sw	t3,28(sp)
    5f58:	01012c23          	sw	a6,24(sp)
    5f5c:	e5dfa0ef          	jal	db8 <memset>
    5f60:	01812803          	lw	a6,24(sp)
    5f64:	05810713          	add	a4,sp,88
    5f68:	000d0693          	mv	a3,s10
    5f6c:	00080593          	mv	a1,a6
    5f70:	04c10613          	add	a2,sp,76
    5f74:	00040513          	mv	a0,s0
    5f78:	2c9040ef          	jal	aa40 <_wcsrtombs_r>
    5f7c:	01812803          	lw	a6,24(sp)
    5f80:	01c12e03          	lw	t3,28(sp)
    5f84:	02012883          	lw	a7,32(sp)
    5f88:	40ad1063          	bne	s10,a0,6388 <_vfiprintf_r+0x17a8>
    5f8c:	fffd4e93          	not	t4,s10
    5f90:	01a807b3          	add	a5,a6,s10
    5f94:	41fede93          	sra	t4,t4,0x1f
    5f98:	00078023          	sb	zero,0(a5)
    5f9c:	01dd7eb3          	and	t4,s10,t4
    5fa0:	2140006f          	j	61b4 <_vfiprintf_r+0x15d4>
    5fa4:	010e7613          	and	a2,t3,16
    5fa8:	000aa783          	lw	a5,0(s5)
    5fac:	004a8a93          	add	s5,s5,4
    5fb0:	02061263          	bnez	a2,5fd4 <_vfiprintf_r+0x13f4>
    5fb4:	040e7613          	and	a2,t3,64
    5fb8:	00060a63          	beqz	a2,5fcc <_vfiprintf_r+0x13ec>
    5fbc:	01079793          	sll	a5,a5,0x10
    5fc0:	0107d793          	srl	a5,a5,0x10
    5fc4:	00000593          	li	a1,0
    5fc8:	e1dff06f          	j	5de4 <_vfiprintf_r+0x1204>
    5fcc:	200e7613          	and	a2,t3,512
    5fd0:	22061e63          	bnez	a2,620c <_vfiprintf_r+0x162c>
    5fd4:	00000593          	li	a1,0
    5fd8:	e0dff06f          	j	5de4 <_vfiprintf_r+0x1204>
    5fdc:	400e7793          	and	a5,t3,1024
    5fe0:	00000693          	li	a3,0
    5fe4:	11010e93          	add	t4,sp,272
    5fe8:	01812823          	sw	s8,16(sp)
    5fec:	02812223          	sw	s0,36(sp)
    5ff0:	03912c23          	sw	s9,56(sp)
    5ff4:	03512e23          	sw	s5,60(sp)
    5ff8:	02c12c83          	lw	s9,44(sp)
    5ffc:	01c12c23          	sw	t3,24(sp)
    6000:	01112e23          	sw	a7,28(sp)
    6004:	02e12023          	sw	a4,32(sp)
    6008:	00078c13          	mv	s8,a5
    600c:	00068413          	mv	s0,a3
    6010:	03312423          	sw	s3,40(sp)
    6014:	000e8a93          	mv	s5,t4
    6018:	0280006f          	j	6040 <_vfiprintf_r+0x1460>
    601c:	00a00613          	li	a2,10
    6020:	00000693          	li	a3,0
    6024:	000d8513          	mv	a0,s11
    6028:	000d0593          	mv	a1,s10
    602c:	364050ef          	jal	b390 <__udivdi3>
    6030:	220d0a63          	beqz	s10,6264 <_vfiprintf_r+0x1684>
    6034:	00050d93          	mv	s11,a0
    6038:	00058d13          	mv	s10,a1
    603c:	00098a93          	mv	s5,s3
    6040:	00a00613          	li	a2,10
    6044:	00000693          	li	a3,0
    6048:	000d8513          	mv	a0,s11
    604c:	000d0593          	mv	a1,s10
    6050:	1ed050ef          	jal	ba3c <__umoddi3>
    6054:	03050513          	add	a0,a0,48
    6058:	feaa8fa3          	sb	a0,-1(s5)
    605c:	fffa8993          	add	s3,s5,-1
    6060:	00140413          	add	s0,s0,1
    6064:	fa0c0ce3          	beqz	s8,601c <_vfiprintf_r+0x143c>
    6068:	000cc783          	lbu	a5,0(s9)
    606c:	fa8798e3          	bne	a5,s0,601c <_vfiprintf_r+0x143c>
    6070:	0ff00793          	li	a5,255
    6074:	faf404e3          	beq	s0,a5,601c <_vfiprintf_r+0x143c>
    6078:	0e0d1a63          	bnez	s10,616c <_vfiprintf_r+0x158c>
    607c:	00900793          	li	a5,9
    6080:	0fb7e663          	bltu	a5,s11,616c <_vfiprintf_r+0x158c>
    6084:	00098813          	mv	a6,s3
    6088:	03912623          	sw	s9,44(sp)
    608c:	01012c03          	lw	s8,16(sp)
    6090:	01812e03          	lw	t3,24(sp)
    6094:	01c12883          	lw	a7,28(sp)
    6098:	02012703          	lw	a4,32(sp)
    609c:	02412403          	lw	s0,36(sp)
    60a0:	02812983          	lw	s3,40(sp)
    60a4:	03812c83          	lw	s9,56(sp)
    60a8:	03c12a83          	lw	s5,60(sp)
    60ac:	9a1ff06f          	j	5a4c <_vfiprintf_r+0xe6c>
    60b0:	00068e13          	mv	t3,a3
    60b4:	00000693          	li	a3,0
    60b8:	c0068263          	beqz	a3,54bc <_vfiprintf_r+0x8dc>
    60bc:	95dff06f          	j	5a18 <_vfiprintf_r+0xe38>
    60c0:	00040513          	mv	a0,s0
    60c4:	115000ef          	jal	69d8 <__sinit>
    60c8:	b61fe06f          	j	4c28 <_vfiprintf_r+0x48>
    60cc:	001cc683          	lbu	a3,1(s9)
    60d0:	200ded93          	or	s11,s11,512
    60d4:	001c8c93          	add	s9,s9,1
    60d8:	c89fe06f          	j	4d60 <_vfiprintf_r+0x180>
    60dc:	001cc683          	lbu	a3,1(s9)
    60e0:	020ded93          	or	s11,s11,32
    60e4:	001c8c93          	add	s9,s9,1
    60e8:	c79fe06f          	j	4d60 <_vfiprintf_r+0x180>
    60ec:	000aa783          	lw	a5,0(s5)
    60f0:	00c12703          	lw	a4,12(sp)
    60f4:	004a8a93          	add	s5,s5,4
    60f8:	00e7a023          	sw	a4,0(a5)
    60fc:	bfdfe06f          	j	4cf8 <_vfiprintf_r+0x118>
    6100:	00600793          	li	a5,6
    6104:	00070d13          	mv	s10,a4
    6108:	0ce7e863          	bltu	a5,a4,61d8 <_vfiprintf_r+0x15f8>
    610c:	000d0e93          	mv	t4,s10
    6110:	00009817          	auipc	a6,0x9
    6114:	e1880813          	add	a6,a6,-488 # ef28 <__fini_array_end+0x1cc>
    6118:	cb9fe06f          	j	4dd0 <_vfiprintf_r+0x1f0>
    611c:	00000793          	li	a5,0
    6120:	00000593          	li	a1,0
    6124:	8f5ff06f          	j	5a18 <_vfiprintf_r+0xe38>
    6128:	05810713          	add	a4,sp,88
    612c:	00000693          	li	a3,0
    6130:	04c10613          	add	a2,sp,76
    6134:	00000593          	li	a1,0
    6138:	00040513          	mv	a0,s0
    613c:	01112e23          	sw	a7,28(sp)
    6140:	01012c23          	sw	a6,24(sp)
    6144:	01c12823          	sw	t3,16(sp)
    6148:	0f9040ef          	jal	aa40 <_wcsrtombs_r>
    614c:	fff00793          	li	a5,-1
    6150:	01012e03          	lw	t3,16(sp)
    6154:	01812803          	lw	a6,24(sp)
    6158:	01c12883          	lw	a7,28(sp)
    615c:	00050d13          	mv	s10,a0
    6160:	1ef50e63          	beq	a0,a5,635c <_vfiprintf_r+0x177c>
    6164:	05012623          	sw	a6,76(sp)
    6168:	da9ff06f          	j	5f10 <_vfiprintf_r+0x1330>
    616c:	03012783          	lw	a5,48(sp)
    6170:	03412583          	lw	a1,52(sp)
    6174:	00000413          	li	s0,0
    6178:	40f989b3          	sub	s3,s3,a5
    617c:	00078613          	mv	a2,a5
    6180:	00098513          	mv	a0,s3
    6184:	6c8010ef          	jal	784c <strncpy>
    6188:	001cc783          	lbu	a5,1(s9)
    618c:	00a00613          	li	a2,10
    6190:	00000693          	li	a3,0
    6194:	00f037b3          	snez	a5,a5
    6198:	000d8513          	mv	a0,s11
    619c:	000d0593          	mv	a1,s10
    61a0:	00fc8cb3          	add	s9,s9,a5
    61a4:	1ec050ef          	jal	b390 <__udivdi3>
    61a8:	e8dff06f          	j	6034 <_vfiprintf_r+0x1454>
    61ac:	00000e93          	li	t4,0
    61b0:	00012823          	sw	zero,16(sp)
    61b4:	04314783          	lbu	a5,67(sp)
    61b8:	00000713          	li	a4,0
    61bc:	00000f93          	li	t6,0
    61c0:	a0079063          	bnez	a5,53c0 <_vfiprintf_r+0x7e0>
    61c4:	c19fe06f          	j	4ddc <_vfiprintf_r+0x1fc>
    61c8:	00100f13          	li	t5,1
    61cc:	00000613          	li	a2,0
    61d0:	000a0c13          	mv	s8,s4
    61d4:	ce9fe06f          	j	4ebc <_vfiprintf_r+0x2dc>
    61d8:	00600d13          	li	s10,6
    61dc:	f31ff06f          	j	610c <_vfiprintf_r+0x152c>
    61e0:	00100f13          	li	t5,1
    61e4:	000a0c13          	mv	s8,s4
    61e8:	c4dfe06f          	j	4e34 <_vfiprintf_r+0x254>
    61ec:	000aa783          	lw	a5,0(s5)
    61f0:	00c12703          	lw	a4,12(sp)
    61f4:	004a8a93          	add	s5,s5,4
    61f8:	00e79023          	sh	a4,0(a5)
    61fc:	afdfe06f          	j	4cf8 <_vfiprintf_r+0x118>
    6200:	0ff7fd93          	zext.b	s11,a5
    6204:	00000d13          	li	s10,0
    6208:	a04ff06f          	j	540c <_vfiprintf_r+0x82c>
    620c:	0ff7f793          	zext.b	a5,a5
    6210:	00000593          	li	a1,0
    6214:	bd1ff06f          	j	5de4 <_vfiprintf_r+0x1204>
    6218:	0ff7f793          	zext.b	a5,a5
    621c:	00000593          	li	a1,0
    6220:	a5cff06f          	j	547c <_vfiprintf_r+0x89c>
    6224:	01879d93          	sll	s11,a5,0x18
    6228:	418ddd93          	sra	s11,s11,0x18
    622c:	41fddd13          	sra	s10,s11,0x1f
    6230:	000d0693          	mv	a3,s10
    6234:	95cff06f          	j	5390 <_vfiprintf_r+0x7b0>
    6238:	03000793          	li	a5,48
    623c:	c8cff06f          	j	56c8 <_vfiprintf_r+0xae8>
    6240:	00012823          	sw	zero,16(sp)
    6244:	0ac10813          	add	a6,sp,172
    6248:	cfdff06f          	j	5f44 <_vfiprintf_r+0x1364>
    624c:	0589a503          	lw	a0,88(s3)
    6250:	b65fa0ef          	jal	db4 <__retarget_lock_release_recursive>
    6254:	d51fe06f          	j	4fa4 <_vfiprintf_r+0x3c4>
    6258:	00070e93          	mv	t4,a4
    625c:	00070d13          	mv	s10,a4
    6260:	f55ff06f          	j	61b4 <_vfiprintf_r+0x15d4>
    6264:	00900793          	li	a5,9
    6268:	ddb7e6e3          	bltu	a5,s11,6034 <_vfiprintf_r+0x1454>
    626c:	e19ff06f          	j	6084 <_vfiprintf_r+0x14a4>
    6270:	00058513          	mv	a0,a1
    6274:	00009317          	auipc	t1,0x9
    6278:	31030313          	add	t1,t1,784 # f584 <blanks.1>
    627c:	8cdff06f          	j	5b48 <_vfiprintf_r+0xf68>
    6280:	00080513          	mv	a0,a6
    6284:	03112023          	sw	a7,32(sp)
    6288:	01012c23          	sw	a6,24(sp)
    628c:	01b12e23          	sw	s11,28(sp)
    6290:	da9fa0ef          	jal	1038 <strlen>
    6294:	fff54e93          	not	t4,a0
    6298:	41fede93          	sra	t4,t4,0x1f
    629c:	01812803          	lw	a6,24(sp)
    62a0:	01c12e03          	lw	t3,28(sp)
    62a4:	02012883          	lw	a7,32(sp)
    62a8:	00050d13          	mv	s10,a0
    62ac:	01d57eb3          	and	t4,a0,t4
    62b0:	00012823          	sw	zero,16(sp)
    62b4:	f01ff06f          	j	61b4 <_vfiprintf_r+0x15d4>
    62b8:	06010613          	add	a2,sp,96
    62bc:	00098593          	mv	a1,s3
    62c0:	00040513          	mv	a0,s0
    62c4:	fe0fe0ef          	jal	4aa4 <__sprint_r.part.0>
    62c8:	00051463          	bnez	a0,62d0 <_vfiprintf_r+0x16f0>
    62cc:	dc5fe06f          	j	5090 <_vfiprintf_r+0x4b0>
    62d0:	df5fe06f          	j	50c4 <_vfiprintf_r+0x4e4>
    62d4:	00168613          	add	a2,a3,1
    62d8:	00009317          	auipc	t1,0x9
    62dc:	2ac30313          	add	t1,t1,684 # f584 <blanks.1>
    62e0:	f19fe06f          	j	51f8 <_vfiprintf_r+0x618>
    62e4:	000f0513          	mv	a0,t5
    62e8:	00009f97          	auipc	t6,0x9
    62ec:	28cf8f93          	add	t6,t6,652 # f574 <zeroes.0>
    62f0:	d10ff06f          	j	5800 <_vfiprintf_r+0xc20>
    62f4:	0649a783          	lw	a5,100(s3)
    62f8:	0017f793          	and	a5,a5,1
    62fc:	00079c63          	bnez	a5,6314 <_vfiprintf_r+0x1734>
    6300:	00c9d783          	lhu	a5,12(s3)
    6304:	2007f793          	and	a5,a5,512
    6308:	00079663          	bnez	a5,6314 <_vfiprintf_r+0x1734>
    630c:	0589a503          	lw	a0,88(s3)
    6310:	aa5fa0ef          	jal	db4 <__retarget_lock_release_recursive>
    6314:	fff00793          	li	a5,-1
    6318:	00f12623          	sw	a5,12(sp)
    631c:	de5fe06f          	j	5100 <_vfiprintf_r+0x520>
    6320:	00098713          	mv	a4,s3
    6324:	000c8a93          	mv	s5,s9
    6328:	000d0993          	mv	s3,s10
    632c:	01012c03          	lw	s8,16(sp)
    6330:	01812e03          	lw	t3,24(sp)
    6334:	01c12803          	lw	a6,28(sp)
    6338:	02012883          	lw	a7,32(sp)
    633c:	000d8c93          	mv	s9,s11
    6340:	00070d13          	mv	s10,a4
    6344:	bcdff06f          	j	5f10 <_vfiprintf_r+0x1330>
    6348:	00cd1783          	lh	a5,12(s10)
    634c:	000d0993          	mv	s3,s10
    6350:	0407e793          	or	a5,a5,64
    6354:	00fd1623          	sh	a5,12(s10)
    6358:	d71fe06f          	j	50c8 <_vfiprintf_r+0x4e8>
    635c:	00c99783          	lh	a5,12(s3)
    6360:	0407e793          	or	a5,a5,64
    6364:	00f99623          	sh	a5,12(s3)
    6368:	d61fe06f          	j	50c8 <_vfiprintf_r+0x4e8>
    636c:	000aa703          	lw	a4,0(s5)
    6370:	004a8a93          	add	s5,s5,4
    6374:	00075463          	bgez	a4,637c <_vfiprintf_r+0x179c>
    6378:	fff00713          	li	a4,-1
    637c:	001cc683          	lbu	a3,1(s9)
    6380:	00058c93          	mv	s9,a1
    6384:	9ddfe06f          	j	4d60 <_vfiprintf_r+0x180>
    6388:	00c9d783          	lhu	a5,12(s3)
    638c:	0407e793          	or	a5,a5,64
    6390:	00f99623          	sh	a5,12(s3)
    6394:	d1dfe06f          	j	50b0 <_vfiprintf_r+0x4d0>

00006398 <__sbprintf>:
    6398:	b7010113          	add	sp,sp,-1168
    639c:	00c59783          	lh	a5,12(a1)
    63a0:	00e5d703          	lhu	a4,14(a1)
    63a4:	48812423          	sw	s0,1160(sp)
    63a8:	00058413          	mv	s0,a1
    63ac:	000105b7          	lui	a1,0x10
    63b0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x82d>
    63b4:	06442303          	lw	t1,100(s0)
    63b8:	01c42883          	lw	a7,28(s0)
    63bc:	02442803          	lw	a6,36(s0)
    63c0:	01071713          	sll	a4,a4,0x10
    63c4:	00b7f7b3          	and	a5,a5,a1
    63c8:	00e7e7b3          	or	a5,a5,a4
    63cc:	40000593          	li	a1,1024
    63d0:	49212023          	sw	s2,1152(sp)
    63d4:	00f12a23          	sw	a5,20(sp)
    63d8:	00050913          	mv	s2,a0
    63dc:	07010793          	add	a5,sp,112
    63e0:	06010513          	add	a0,sp,96
    63e4:	48112623          	sw	ra,1164(sp)
    63e8:	48912223          	sw	s1,1156(sp)
    63ec:	47312e23          	sw	s3,1148(sp)
    63f0:	00060493          	mv	s1,a2
    63f4:	00068993          	mv	s3,a3
    63f8:	06612623          	sw	t1,108(sp)
    63fc:	03112223          	sw	a7,36(sp)
    6400:	03012623          	sw	a6,44(sp)
    6404:	00f12423          	sw	a5,8(sp)
    6408:	00f12c23          	sw	a5,24(sp)
    640c:	00b12823          	sw	a1,16(sp)
    6410:	00b12e23          	sw	a1,28(sp)
    6414:	02012023          	sw	zero,32(sp)
    6418:	991fa0ef          	jal	da8 <__retarget_lock_init_recursive>
    641c:	00048613          	mv	a2,s1
    6420:	00098693          	mv	a3,s3
    6424:	00810593          	add	a1,sp,8
    6428:	00090513          	mv	a0,s2
    642c:	fb4fe0ef          	jal	4be0 <_vfiprintf_r>
    6430:	00050493          	mv	s1,a0
    6434:	04055263          	bgez	a0,6478 <__sbprintf+0xe0>
    6438:	01415783          	lhu	a5,20(sp)
    643c:	0407f793          	and	a5,a5,64
    6440:	00078863          	beqz	a5,6450 <__sbprintf+0xb8>
    6444:	00c45783          	lhu	a5,12(s0)
    6448:	0407e793          	or	a5,a5,64
    644c:	00f41623          	sh	a5,12(s0)
    6450:	06012503          	lw	a0,96(sp)
    6454:	959fa0ef          	jal	dac <__retarget_lock_close_recursive>
    6458:	48c12083          	lw	ra,1164(sp)
    645c:	48812403          	lw	s0,1160(sp)
    6460:	48012903          	lw	s2,1152(sp)
    6464:	47c12983          	lw	s3,1148(sp)
    6468:	00048513          	mv	a0,s1
    646c:	48412483          	lw	s1,1156(sp)
    6470:	49010113          	add	sp,sp,1168
    6474:	00008067          	ret
    6478:	00810593          	add	a1,sp,8
    647c:	00090513          	mv	a0,s2
    6480:	25c000ef          	jal	66dc <_fflush_r>
    6484:	fa050ae3          	beqz	a0,6438 <__sbprintf+0xa0>
    6488:	fff00493          	li	s1,-1
    648c:	fadff06f          	j	6438 <__sbprintf+0xa0>

00006490 <__sflush_r>:
    6490:	00c59703          	lh	a4,12(a1)
    6494:	fe010113          	add	sp,sp,-32
    6498:	00812c23          	sw	s0,24(sp)
    649c:	01312623          	sw	s3,12(sp)
    64a0:	00112e23          	sw	ra,28(sp)
    64a4:	00877793          	and	a5,a4,8
    64a8:	00058413          	mv	s0,a1
    64ac:	00050993          	mv	s3,a0
    64b0:	12079063          	bnez	a5,65d0 <__sflush_r+0x140>
    64b4:	000017b7          	lui	a5,0x1
    64b8:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    64bc:	0045a683          	lw	a3,4(a1)
    64c0:	00f767b3          	or	a5,a4,a5
    64c4:	00f59623          	sh	a5,12(a1)
    64c8:	18d05263          	blez	a3,664c <__sflush_r+0x1bc>
    64cc:	02842803          	lw	a6,40(s0)
    64d0:	0e080463          	beqz	a6,65b8 <__sflush_r+0x128>
    64d4:	00912a23          	sw	s1,20(sp)
    64d8:	01371693          	sll	a3,a4,0x13
    64dc:	0009a483          	lw	s1,0(s3)
    64e0:	0009a023          	sw	zero,0(s3)
    64e4:	01c42583          	lw	a1,28(s0)
    64e8:	1606ce63          	bltz	a3,6664 <__sflush_r+0x1d4>
    64ec:	00000613          	li	a2,0
    64f0:	00100693          	li	a3,1
    64f4:	00098513          	mv	a0,s3
    64f8:	000800e7          	jalr	a6
    64fc:	fff00793          	li	a5,-1
    6500:	00050613          	mv	a2,a0
    6504:	1af50463          	beq	a0,a5,66ac <__sflush_r+0x21c>
    6508:	00c41783          	lh	a5,12(s0)
    650c:	02842803          	lw	a6,40(s0)
    6510:	01c42583          	lw	a1,28(s0)
    6514:	0047f793          	and	a5,a5,4
    6518:	00078e63          	beqz	a5,6534 <__sflush_r+0xa4>
    651c:	00442703          	lw	a4,4(s0)
    6520:	03042783          	lw	a5,48(s0)
    6524:	40e60633          	sub	a2,a2,a4
    6528:	00078663          	beqz	a5,6534 <__sflush_r+0xa4>
    652c:	03c42783          	lw	a5,60(s0)
    6530:	40f60633          	sub	a2,a2,a5
    6534:	00000693          	li	a3,0
    6538:	00098513          	mv	a0,s3
    653c:	000800e7          	jalr	a6
    6540:	fff00793          	li	a5,-1
    6544:	12f51463          	bne	a0,a5,666c <__sflush_r+0x1dc>
    6548:	0009a683          	lw	a3,0(s3)
    654c:	01d00793          	li	a5,29
    6550:	00c41703          	lh	a4,12(s0)
    6554:	16d7ea63          	bltu	a5,a3,66c8 <__sflush_r+0x238>
    6558:	204007b7          	lui	a5,0x20400
    655c:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6560:	00d7d7b3          	srl	a5,a5,a3
    6564:	0017f793          	and	a5,a5,1
    6568:	16078063          	beqz	a5,66c8 <__sflush_r+0x238>
    656c:	01042603          	lw	a2,16(s0)
    6570:	fffff7b7          	lui	a5,0xfffff
    6574:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6578:	00f777b3          	and	a5,a4,a5
    657c:	00f41623          	sh	a5,12(s0)
    6580:	00042223          	sw	zero,4(s0)
    6584:	00c42023          	sw	a2,0(s0)
    6588:	01371793          	sll	a5,a4,0x13
    658c:	0007d463          	bgez	a5,6594 <__sflush_r+0x104>
    6590:	10068263          	beqz	a3,6694 <__sflush_r+0x204>
    6594:	03042583          	lw	a1,48(s0)
    6598:	0099a023          	sw	s1,0(s3)
    659c:	10058463          	beqz	a1,66a4 <__sflush_r+0x214>
    65a0:	04040793          	add	a5,s0,64
    65a4:	00f58663          	beq	a1,a5,65b0 <__sflush_r+0x120>
    65a8:	00098513          	mv	a0,s3
    65ac:	c5dfa0ef          	jal	1208 <_free_r>
    65b0:	01412483          	lw	s1,20(sp)
    65b4:	02042823          	sw	zero,48(s0)
    65b8:	00000513          	li	a0,0
    65bc:	01c12083          	lw	ra,28(sp)
    65c0:	01812403          	lw	s0,24(sp)
    65c4:	00c12983          	lw	s3,12(sp)
    65c8:	02010113          	add	sp,sp,32
    65cc:	00008067          	ret
    65d0:	01212823          	sw	s2,16(sp)
    65d4:	0105a903          	lw	s2,16(a1)
    65d8:	08090263          	beqz	s2,665c <__sflush_r+0x1cc>
    65dc:	00912a23          	sw	s1,20(sp)
    65e0:	0005a483          	lw	s1,0(a1)
    65e4:	00377713          	and	a4,a4,3
    65e8:	0125a023          	sw	s2,0(a1)
    65ec:	412484b3          	sub	s1,s1,s2
    65f0:	00000793          	li	a5,0
    65f4:	00071463          	bnez	a4,65fc <__sflush_r+0x16c>
    65f8:	0145a783          	lw	a5,20(a1)
    65fc:	00f42423          	sw	a5,8(s0)
    6600:	00904863          	bgtz	s1,6610 <__sflush_r+0x180>
    6604:	0540006f          	j	6658 <__sflush_r+0x1c8>
    6608:	00a90933          	add	s2,s2,a0
    660c:	04905663          	blez	s1,6658 <__sflush_r+0x1c8>
    6610:	02442783          	lw	a5,36(s0)
    6614:	01c42583          	lw	a1,28(s0)
    6618:	00048693          	mv	a3,s1
    661c:	00090613          	mv	a2,s2
    6620:	00098513          	mv	a0,s3
    6624:	000780e7          	jalr	a5
    6628:	40a484b3          	sub	s1,s1,a0
    662c:	fca04ee3          	bgtz	a0,6608 <__sflush_r+0x178>
    6630:	00c41703          	lh	a4,12(s0)
    6634:	01012903          	lw	s2,16(sp)
    6638:	04076713          	or	a4,a4,64
    663c:	01412483          	lw	s1,20(sp)
    6640:	00e41623          	sh	a4,12(s0)
    6644:	fff00513          	li	a0,-1
    6648:	f75ff06f          	j	65bc <__sflush_r+0x12c>
    664c:	03c5a683          	lw	a3,60(a1)
    6650:	e6d04ee3          	bgtz	a3,64cc <__sflush_r+0x3c>
    6654:	f65ff06f          	j	65b8 <__sflush_r+0x128>
    6658:	01412483          	lw	s1,20(sp)
    665c:	01012903          	lw	s2,16(sp)
    6660:	f59ff06f          	j	65b8 <__sflush_r+0x128>
    6664:	05042603          	lw	a2,80(s0)
    6668:	eadff06f          	j	6514 <__sflush_r+0x84>
    666c:	00c41703          	lh	a4,12(s0)
    6670:	01042683          	lw	a3,16(s0)
    6674:	fffff7b7          	lui	a5,0xfffff
    6678:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    667c:	00f777b3          	and	a5,a4,a5
    6680:	00f41623          	sh	a5,12(s0)
    6684:	00042223          	sw	zero,4(s0)
    6688:	00d42023          	sw	a3,0(s0)
    668c:	01371793          	sll	a5,a4,0x13
    6690:	f007d2e3          	bgez	a5,6594 <__sflush_r+0x104>
    6694:	03042583          	lw	a1,48(s0)
    6698:	04a42823          	sw	a0,80(s0)
    669c:	0099a023          	sw	s1,0(s3)
    66a0:	f00590e3          	bnez	a1,65a0 <__sflush_r+0x110>
    66a4:	01412483          	lw	s1,20(sp)
    66a8:	f11ff06f          	j	65b8 <__sflush_r+0x128>
    66ac:	0009a783          	lw	a5,0(s3)
    66b0:	e4078ce3          	beqz	a5,6508 <__sflush_r+0x78>
    66b4:	01d00713          	li	a4,29
    66b8:	00e78c63          	beq	a5,a4,66d0 <__sflush_r+0x240>
    66bc:	01600713          	li	a4,22
    66c0:	00e78863          	beq	a5,a4,66d0 <__sflush_r+0x240>
    66c4:	00c41703          	lh	a4,12(s0)
    66c8:	04076713          	or	a4,a4,64
    66cc:	f71ff06f          	j	663c <__sflush_r+0x1ac>
    66d0:	0099a023          	sw	s1,0(s3)
    66d4:	01412483          	lw	s1,20(sp)
    66d8:	ee1ff06f          	j	65b8 <__sflush_r+0x128>

000066dc <_fflush_r>:
    66dc:	ff010113          	add	sp,sp,-16
    66e0:	00812423          	sw	s0,8(sp)
    66e4:	00912223          	sw	s1,4(sp)
    66e8:	00112623          	sw	ra,12(sp)
    66ec:	01212023          	sw	s2,0(sp)
    66f0:	00050493          	mv	s1,a0
    66f4:	00058413          	mv	s0,a1
    66f8:	00050663          	beqz	a0,6704 <_fflush_r+0x28>
    66fc:	03452783          	lw	a5,52(a0)
    6700:	0a078a63          	beqz	a5,67b4 <_fflush_r+0xd8>
    6704:	00c41783          	lh	a5,12(s0)
    6708:	00000913          	li	s2,0
    670c:	04078063          	beqz	a5,674c <_fflush_r+0x70>
    6710:	06442703          	lw	a4,100(s0)
    6714:	00177713          	and	a4,a4,1
    6718:	00071663          	bnez	a4,6724 <_fflush_r+0x48>
    671c:	2007f793          	and	a5,a5,512
    6720:	04078463          	beqz	a5,6768 <_fflush_r+0x8c>
    6724:	00040593          	mv	a1,s0
    6728:	00048513          	mv	a0,s1
    672c:	d65ff0ef          	jal	6490 <__sflush_r>
    6730:	06442783          	lw	a5,100(s0)
    6734:	00050913          	mv	s2,a0
    6738:	0017f793          	and	a5,a5,1
    673c:	00079863          	bnez	a5,674c <_fflush_r+0x70>
    6740:	00c45783          	lhu	a5,12(s0)
    6744:	2007f793          	and	a5,a5,512
    6748:	04078463          	beqz	a5,6790 <_fflush_r+0xb4>
    674c:	00c12083          	lw	ra,12(sp)
    6750:	00812403          	lw	s0,8(sp)
    6754:	00412483          	lw	s1,4(sp)
    6758:	00090513          	mv	a0,s2
    675c:	00012903          	lw	s2,0(sp)
    6760:	01010113          	add	sp,sp,16
    6764:	00008067          	ret
    6768:	05842503          	lw	a0,88(s0)
    676c:	e44fa0ef          	jal	db0 <__retarget_lock_acquire_recursive>
    6770:	00040593          	mv	a1,s0
    6774:	00048513          	mv	a0,s1
    6778:	d19ff0ef          	jal	6490 <__sflush_r>
    677c:	06442783          	lw	a5,100(s0)
    6780:	00050913          	mv	s2,a0
    6784:	0017f793          	and	a5,a5,1
    6788:	fc0792e3          	bnez	a5,674c <_fflush_r+0x70>
    678c:	fb5ff06f          	j	6740 <_fflush_r+0x64>
    6790:	05842503          	lw	a0,88(s0)
    6794:	e20fa0ef          	jal	db4 <__retarget_lock_release_recursive>
    6798:	00c12083          	lw	ra,12(sp)
    679c:	00812403          	lw	s0,8(sp)
    67a0:	00412483          	lw	s1,4(sp)
    67a4:	00090513          	mv	a0,s2
    67a8:	00012903          	lw	s2,0(sp)
    67ac:	01010113          	add	sp,sp,16
    67b0:	00008067          	ret
    67b4:	224000ef          	jal	69d8 <__sinit>
    67b8:	f4dff06f          	j	6704 <_fflush_r+0x28>

000067bc <stdio_exit_handler>:
    67bc:	7fffa617          	auipc	a2,0x7fffa
    67c0:	d6c60613          	add	a2,a2,-660 # 80000528 <__sglue>
    67c4:	00004597          	auipc	a1,0x4
    67c8:	28c58593          	add	a1,a1,652 # aa50 <_fclose_r>
    67cc:	7fffa517          	auipc	a0,0x7fffa
    67d0:	83450513          	add	a0,a0,-1996 # 80000000 <_impure_data>
    67d4:	7a00006f          	j	6f74 <_fwalk_sglue>

000067d8 <cleanup_stdio>:
    67d8:	00452583          	lw	a1,4(a0)
    67dc:	ff010113          	add	sp,sp,-16
    67e0:	00812423          	sw	s0,8(sp)
    67e4:	00112623          	sw	ra,12(sp)
    67e8:	7fffa797          	auipc	a5,0x7fffa
    67ec:	37478793          	add	a5,a5,884 # 80000b5c <__sf>
    67f0:	00050413          	mv	s0,a0
    67f4:	00f58463          	beq	a1,a5,67fc <cleanup_stdio+0x24>
    67f8:	258040ef          	jal	aa50 <_fclose_r>
    67fc:	00842583          	lw	a1,8(s0)
    6800:	7fffa797          	auipc	a5,0x7fffa
    6804:	3c478793          	add	a5,a5,964 # 80000bc4 <__sf+0x68>
    6808:	00f58663          	beq	a1,a5,6814 <cleanup_stdio+0x3c>
    680c:	00040513          	mv	a0,s0
    6810:	240040ef          	jal	aa50 <_fclose_r>
    6814:	00c42583          	lw	a1,12(s0)
    6818:	7fffa797          	auipc	a5,0x7fffa
    681c:	41478793          	add	a5,a5,1044 # 80000c2c <__sf+0xd0>
    6820:	00f58c63          	beq	a1,a5,6838 <cleanup_stdio+0x60>
    6824:	00040513          	mv	a0,s0
    6828:	00812403          	lw	s0,8(sp)
    682c:	00c12083          	lw	ra,12(sp)
    6830:	01010113          	add	sp,sp,16
    6834:	21c0406f          	j	aa50 <_fclose_r>
    6838:	00c12083          	lw	ra,12(sp)
    683c:	00812403          	lw	s0,8(sp)
    6840:	01010113          	add	sp,sp,16
    6844:	00008067          	ret

00006848 <global_stdio_init.part.0>:
    6848:	fe010113          	add	sp,sp,-32
    684c:	00000797          	auipc	a5,0x0
    6850:	f7078793          	add	a5,a5,-144 # 67bc <stdio_exit_handler>
    6854:	00112e23          	sw	ra,28(sp)
    6858:	00812c23          	sw	s0,24(sp)
    685c:	00912a23          	sw	s1,20(sp)
    6860:	7fffa417          	auipc	s0,0x7fffa
    6864:	2fc40413          	add	s0,s0,764 # 80000b5c <__sf>
    6868:	01212823          	sw	s2,16(sp)
    686c:	01312623          	sw	s3,12(sp)
    6870:	01412423          	sw	s4,8(sp)
    6874:	00800613          	li	a2,8
    6878:	00000593          	li	a1,0
    687c:	7fffa717          	auipc	a4,0x7fffa
    6880:	eaf72a23          	sw	a5,-332(a4) # 80000730 <__stdio_exit_handler>
    6884:	7fffa517          	auipc	a0,0x7fffa
    6888:	33450513          	add	a0,a0,820 # 80000bb8 <__sf+0x5c>
    688c:	00400793          	li	a5,4
    6890:	00f42623          	sw	a5,12(s0)
    6894:	00042023          	sw	zero,0(s0)
    6898:	00042223          	sw	zero,4(s0)
    689c:	00042423          	sw	zero,8(s0)
    68a0:	06042223          	sw	zero,100(s0)
    68a4:	00042823          	sw	zero,16(s0)
    68a8:	00042a23          	sw	zero,20(s0)
    68ac:	00042c23          	sw	zero,24(s0)
    68b0:	d08fa0ef          	jal	db8 <memset>
    68b4:	00001a17          	auipc	s4,0x1
    68b8:	870a0a13          	add	s4,s4,-1936 # 7124 <__sread>
    68bc:	00001997          	auipc	s3,0x1
    68c0:	8c498993          	add	s3,s3,-1852 # 7180 <__swrite>
    68c4:	00001917          	auipc	s2,0x1
    68c8:	94490913          	add	s2,s2,-1724 # 7208 <__sseek>
    68cc:	00001497          	auipc	s1,0x1
    68d0:	9b448493          	add	s1,s1,-1612 # 7280 <__sclose>
    68d4:	7fffa517          	auipc	a0,0x7fffa
    68d8:	2e050513          	add	a0,a0,736 # 80000bb4 <__sf+0x58>
    68dc:	03442023          	sw	s4,32(s0)
    68e0:	03342223          	sw	s3,36(s0)
    68e4:	03242423          	sw	s2,40(s0)
    68e8:	02942623          	sw	s1,44(s0)
    68ec:	00842e23          	sw	s0,28(s0)
    68f0:	cb8fa0ef          	jal	da8 <__retarget_lock_init_recursive>
    68f4:	000107b7          	lui	a5,0x10
    68f8:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x839>
    68fc:	00800613          	li	a2,8
    6900:	00000593          	li	a1,0
    6904:	7fffa517          	auipc	a0,0x7fffa
    6908:	31c50513          	add	a0,a0,796 # 80000c20 <__sf+0xc4>
    690c:	06f42a23          	sw	a5,116(s0)
    6910:	06042423          	sw	zero,104(s0)
    6914:	06042623          	sw	zero,108(s0)
    6918:	06042823          	sw	zero,112(s0)
    691c:	0c042623          	sw	zero,204(s0)
    6920:	06042c23          	sw	zero,120(s0)
    6924:	06042e23          	sw	zero,124(s0)
    6928:	08042023          	sw	zero,128(s0)
    692c:	c8cfa0ef          	jal	db8 <memset>
    6930:	7fffa797          	auipc	a5,0x7fffa
    6934:	29478793          	add	a5,a5,660 # 80000bc4 <__sf+0x68>
    6938:	7fffa517          	auipc	a0,0x7fffa
    693c:	2e450513          	add	a0,a0,740 # 80000c1c <__sf+0xc0>
    6940:	08f42223          	sw	a5,132(s0)
    6944:	09442423          	sw	s4,136(s0)
    6948:	09342623          	sw	s3,140(s0)
    694c:	09242823          	sw	s2,144(s0)
    6950:	08942a23          	sw	s1,148(s0)
    6954:	c54fa0ef          	jal	da8 <__retarget_lock_init_recursive>
    6958:	000207b7          	lui	a5,0x20
    695c:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6960:	00800613          	li	a2,8
    6964:	00000593          	li	a1,0
    6968:	7fffa517          	auipc	a0,0x7fffa
    696c:	32050513          	add	a0,a0,800 # 80000c88 <__sf+0x12c>
    6970:	0cf42e23          	sw	a5,220(s0)
    6974:	0c042823          	sw	zero,208(s0)
    6978:	0c042a23          	sw	zero,212(s0)
    697c:	0c042c23          	sw	zero,216(s0)
    6980:	12042a23          	sw	zero,308(s0)
    6984:	0e042023          	sw	zero,224(s0)
    6988:	0e042223          	sw	zero,228(s0)
    698c:	0e042423          	sw	zero,232(s0)
    6990:	c28fa0ef          	jal	db8 <memset>
    6994:	7fffa797          	auipc	a5,0x7fffa
    6998:	29878793          	add	a5,a5,664 # 80000c2c <__sf+0xd0>
    699c:	0f442823          	sw	s4,240(s0)
    69a0:	0f342a23          	sw	s3,244(s0)
    69a4:	0f242c23          	sw	s2,248(s0)
    69a8:	0e942e23          	sw	s1,252(s0)
    69ac:	0ef42623          	sw	a5,236(s0)
    69b0:	01812403          	lw	s0,24(sp)
    69b4:	01c12083          	lw	ra,28(sp)
    69b8:	01412483          	lw	s1,20(sp)
    69bc:	01012903          	lw	s2,16(sp)
    69c0:	00c12983          	lw	s3,12(sp)
    69c4:	00812a03          	lw	s4,8(sp)
    69c8:	7fffa517          	auipc	a0,0x7fffa
    69cc:	2bc50513          	add	a0,a0,700 # 80000c84 <__sf+0x128>
    69d0:	02010113          	add	sp,sp,32
    69d4:	bd4fa06f          	j	da8 <__retarget_lock_init_recursive>

000069d8 <__sinit>:
    69d8:	ff010113          	add	sp,sp,-16
    69dc:	00812423          	sw	s0,8(sp)
    69e0:	00050413          	mv	s0,a0
    69e4:	7fffa517          	auipc	a0,0x7fffa
    69e8:	d3c50513          	add	a0,a0,-708 # 80000720 <__lock___sfp_recursive_mutex>
    69ec:	00112623          	sw	ra,12(sp)
    69f0:	bc0fa0ef          	jal	db0 <__retarget_lock_acquire_recursive>
    69f4:	03442783          	lw	a5,52(s0)
    69f8:	00079e63          	bnez	a5,6a14 <__sinit+0x3c>
    69fc:	00000797          	auipc	a5,0x0
    6a00:	ddc78793          	add	a5,a5,-548 # 67d8 <cleanup_stdio>
    6a04:	02f42a23          	sw	a5,52(s0)
    6a08:	7fffa797          	auipc	a5,0x7fffa
    6a0c:	d287a783          	lw	a5,-728(a5) # 80000730 <__stdio_exit_handler>
    6a10:	00078e63          	beqz	a5,6a2c <__sinit+0x54>
    6a14:	00812403          	lw	s0,8(sp)
    6a18:	00c12083          	lw	ra,12(sp)
    6a1c:	7fffa517          	auipc	a0,0x7fffa
    6a20:	d0450513          	add	a0,a0,-764 # 80000720 <__lock___sfp_recursive_mutex>
    6a24:	01010113          	add	sp,sp,16
    6a28:	b8cfa06f          	j	db4 <__retarget_lock_release_recursive>
    6a2c:	e1dff0ef          	jal	6848 <global_stdio_init.part.0>
    6a30:	00812403          	lw	s0,8(sp)
    6a34:	00c12083          	lw	ra,12(sp)
    6a38:	7fffa517          	auipc	a0,0x7fffa
    6a3c:	ce850513          	add	a0,a0,-792 # 80000720 <__lock___sfp_recursive_mutex>
    6a40:	01010113          	add	sp,sp,16
    6a44:	b70fa06f          	j	db4 <__retarget_lock_release_recursive>

00006a48 <__sfp_lock_acquire>:
    6a48:	7fffa517          	auipc	a0,0x7fffa
    6a4c:	cd850513          	add	a0,a0,-808 # 80000720 <__lock___sfp_recursive_mutex>
    6a50:	b60fa06f          	j	db0 <__retarget_lock_acquire_recursive>

00006a54 <__sfp_lock_release>:
    6a54:	7fffa517          	auipc	a0,0x7fffa
    6a58:	ccc50513          	add	a0,a0,-820 # 80000720 <__lock___sfp_recursive_mutex>
    6a5c:	b58fa06f          	j	db4 <__retarget_lock_release_recursive>

00006a60 <__sfvwrite_r>:
    6a60:	00862783          	lw	a5,8(a2)
    6a64:	2c078463          	beqz	a5,6d2c <__sfvwrite_r+0x2cc>
    6a68:	00c59683          	lh	a3,12(a1)
    6a6c:	fd010113          	add	sp,sp,-48
    6a70:	02812423          	sw	s0,40(sp)
    6a74:	01412c23          	sw	s4,24(sp)
    6a78:	01612823          	sw	s6,16(sp)
    6a7c:	02112623          	sw	ra,44(sp)
    6a80:	0086f793          	and	a5,a3,8
    6a84:	00060b13          	mv	s6,a2
    6a88:	00050a13          	mv	s4,a0
    6a8c:	00058413          	mv	s0,a1
    6a90:	08078e63          	beqz	a5,6b2c <__sfvwrite_r+0xcc>
    6a94:	0105a783          	lw	a5,16(a1)
    6a98:	08078a63          	beqz	a5,6b2c <__sfvwrite_r+0xcc>
    6a9c:	02912223          	sw	s1,36(sp)
    6aa0:	03212023          	sw	s2,32(sp)
    6aa4:	01312e23          	sw	s3,28(sp)
    6aa8:	01512a23          	sw	s5,20(sp)
    6aac:	0026f793          	and	a5,a3,2
    6ab0:	000b2483          	lw	s1,0(s6)
    6ab4:	0a078463          	beqz	a5,6b5c <__sfvwrite_r+0xfc>
    6ab8:	02442783          	lw	a5,36(s0)
    6abc:	01c42583          	lw	a1,28(s0)
    6ac0:	80000ab7          	lui	s5,0x80000
    6ac4:	00000993          	li	s3,0
    6ac8:	00000913          	li	s2,0
    6acc:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6ad0:	00098613          	mv	a2,s3
    6ad4:	000a0513          	mv	a0,s4
    6ad8:	04090263          	beqz	s2,6b1c <__sfvwrite_r+0xbc>
    6adc:	00090693          	mv	a3,s2
    6ae0:	012af463          	bgeu	s5,s2,6ae8 <__sfvwrite_r+0x88>
    6ae4:	000a8693          	mv	a3,s5
    6ae8:	000780e7          	jalr	a5
    6aec:	46a05263          	blez	a0,6f50 <__sfvwrite_r+0x4f0>
    6af0:	008b2783          	lw	a5,8(s6)
    6af4:	00a989b3          	add	s3,s3,a0
    6af8:	40a90933          	sub	s2,s2,a0
    6afc:	40a787b3          	sub	a5,a5,a0
    6b00:	00fb2423          	sw	a5,8(s6)
    6b04:	1a078663          	beqz	a5,6cb0 <__sfvwrite_r+0x250>
    6b08:	02442783          	lw	a5,36(s0)
    6b0c:	01c42583          	lw	a1,28(s0)
    6b10:	00098613          	mv	a2,s3
    6b14:	000a0513          	mv	a0,s4
    6b18:	fc0912e3          	bnez	s2,6adc <__sfvwrite_r+0x7c>
    6b1c:	0004a983          	lw	s3,0(s1)
    6b20:	0044a903          	lw	s2,4(s1)
    6b24:	00848493          	add	s1,s1,8
    6b28:	fa9ff06f          	j	6ad0 <__sfvwrite_r+0x70>
    6b2c:	00040593          	mv	a1,s0
    6b30:	000a0513          	mv	a0,s4
    6b34:	0e5000ef          	jal	7418 <__swsetup_r>
    6b38:	1c051c63          	bnez	a0,6d10 <__sfvwrite_r+0x2b0>
    6b3c:	00c41683          	lh	a3,12(s0)
    6b40:	02912223          	sw	s1,36(sp)
    6b44:	03212023          	sw	s2,32(sp)
    6b48:	01312e23          	sw	s3,28(sp)
    6b4c:	01512a23          	sw	s5,20(sp)
    6b50:	0026f793          	and	a5,a3,2
    6b54:	000b2483          	lw	s1,0(s6)
    6b58:	f60790e3          	bnez	a5,6ab8 <__sfvwrite_r+0x58>
    6b5c:	01712623          	sw	s7,12(sp)
    6b60:	01812423          	sw	s8,8(sp)
    6b64:	0016f793          	and	a5,a3,1
    6b68:	1c079663          	bnez	a5,6d34 <__sfvwrite_r+0x2d4>
    6b6c:	00042783          	lw	a5,0(s0)
    6b70:	00842703          	lw	a4,8(s0)
    6b74:	80000ab7          	lui	s5,0x80000
    6b78:	01912223          	sw	s9,4(sp)
    6b7c:	00000b93          	li	s7,0
    6b80:	00000993          	li	s3,0
    6b84:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6b88:	00078513          	mv	a0,a5
    6b8c:	00070c13          	mv	s8,a4
    6b90:	10098263          	beqz	s3,6c94 <__sfvwrite_r+0x234>
    6b94:	2006f613          	and	a2,a3,512
    6b98:	28060863          	beqz	a2,6e28 <__sfvwrite_r+0x3c8>
    6b9c:	00070c93          	mv	s9,a4
    6ba0:	32e9e863          	bltu	s3,a4,6ed0 <__sfvwrite_r+0x470>
    6ba4:	4806f713          	and	a4,a3,1152
    6ba8:	08070a63          	beqz	a4,6c3c <__sfvwrite_r+0x1dc>
    6bac:	01442603          	lw	a2,20(s0)
    6bb0:	01042583          	lw	a1,16(s0)
    6bb4:	00161713          	sll	a4,a2,0x1
    6bb8:	00c70733          	add	a4,a4,a2
    6bbc:	40b78933          	sub	s2,a5,a1
    6bc0:	01f75c13          	srl	s8,a4,0x1f
    6bc4:	00ec0c33          	add	s8,s8,a4
    6bc8:	00190793          	add	a5,s2,1
    6bcc:	401c5c13          	sra	s8,s8,0x1
    6bd0:	013787b3          	add	a5,a5,s3
    6bd4:	000c0613          	mv	a2,s8
    6bd8:	00fc7663          	bgeu	s8,a5,6be4 <__sfvwrite_r+0x184>
    6bdc:	00078c13          	mv	s8,a5
    6be0:	00078613          	mv	a2,a5
    6be4:	4006f693          	and	a3,a3,1024
    6be8:	32068063          	beqz	a3,6f08 <__sfvwrite_r+0x4a8>
    6bec:	00060593          	mv	a1,a2
    6bf0:	000a0513          	mv	a0,s4
    6bf4:	921fa0ef          	jal	1514 <_malloc_r>
    6bf8:	00050c93          	mv	s9,a0
    6bfc:	34050e63          	beqz	a0,6f58 <__sfvwrite_r+0x4f8>
    6c00:	01042583          	lw	a1,16(s0)
    6c04:	00090613          	mv	a2,s2
    6c08:	a8cfa0ef          	jal	e94 <memcpy>
    6c0c:	00c45783          	lhu	a5,12(s0)
    6c10:	b7f7f793          	and	a5,a5,-1153
    6c14:	0807e793          	or	a5,a5,128
    6c18:	00f41623          	sh	a5,12(s0)
    6c1c:	012c8533          	add	a0,s9,s2
    6c20:	412c07b3          	sub	a5,s8,s2
    6c24:	01942823          	sw	s9,16(s0)
    6c28:	01842a23          	sw	s8,20(s0)
    6c2c:	00a42023          	sw	a0,0(s0)
    6c30:	00098c13          	mv	s8,s3
    6c34:	00f42423          	sw	a5,8(s0)
    6c38:	00098c93          	mv	s9,s3
    6c3c:	000c8613          	mv	a2,s9
    6c40:	000b8593          	mv	a1,s7
    6c44:	6a9000ef          	jal	7aec <memmove>
    6c48:	00842703          	lw	a4,8(s0)
    6c4c:	00042783          	lw	a5,0(s0)
    6c50:	00098913          	mv	s2,s3
    6c54:	41870733          	sub	a4,a4,s8
    6c58:	019787b3          	add	a5,a5,s9
    6c5c:	00e42423          	sw	a4,8(s0)
    6c60:	00f42023          	sw	a5,0(s0)
    6c64:	00000993          	li	s3,0
    6c68:	008b2783          	lw	a5,8(s6)
    6c6c:	012b8bb3          	add	s7,s7,s2
    6c70:	412787b3          	sub	a5,a5,s2
    6c74:	00fb2423          	sw	a5,8(s6)
    6c78:	02078663          	beqz	a5,6ca4 <__sfvwrite_r+0x244>
    6c7c:	00042783          	lw	a5,0(s0)
    6c80:	00842703          	lw	a4,8(s0)
    6c84:	00c41683          	lh	a3,12(s0)
    6c88:	00078513          	mv	a0,a5
    6c8c:	00070c13          	mv	s8,a4
    6c90:	f00992e3          	bnez	s3,6b94 <__sfvwrite_r+0x134>
    6c94:	0004ab83          	lw	s7,0(s1)
    6c98:	0044a983          	lw	s3,4(s1)
    6c9c:	00848493          	add	s1,s1,8
    6ca0:	ee9ff06f          	j	6b88 <__sfvwrite_r+0x128>
    6ca4:	00c12b83          	lw	s7,12(sp)
    6ca8:	00812c03          	lw	s8,8(sp)
    6cac:	00412c83          	lw	s9,4(sp)
    6cb0:	02c12083          	lw	ra,44(sp)
    6cb4:	02812403          	lw	s0,40(sp)
    6cb8:	02412483          	lw	s1,36(sp)
    6cbc:	02012903          	lw	s2,32(sp)
    6cc0:	01c12983          	lw	s3,28(sp)
    6cc4:	01412a83          	lw	s5,20(sp)
    6cc8:	01812a03          	lw	s4,24(sp)
    6ccc:	01012b03          	lw	s6,16(sp)
    6cd0:	00000513          	li	a0,0
    6cd4:	03010113          	add	sp,sp,48
    6cd8:	00008067          	ret
    6cdc:	00040593          	mv	a1,s0
    6ce0:	000a0513          	mv	a0,s4
    6ce4:	9f9ff0ef          	jal	66dc <_fflush_r>
    6ce8:	0a050e63          	beqz	a0,6da4 <__sfvwrite_r+0x344>
    6cec:	00c41783          	lh	a5,12(s0)
    6cf0:	00c12b83          	lw	s7,12(sp)
    6cf4:	00812c03          	lw	s8,8(sp)
    6cf8:	02412483          	lw	s1,36(sp)
    6cfc:	02012903          	lw	s2,32(sp)
    6d00:	01c12983          	lw	s3,28(sp)
    6d04:	01412a83          	lw	s5,20(sp)
    6d08:	0407e793          	or	a5,a5,64
    6d0c:	00f41623          	sh	a5,12(s0)
    6d10:	02c12083          	lw	ra,44(sp)
    6d14:	02812403          	lw	s0,40(sp)
    6d18:	01812a03          	lw	s4,24(sp)
    6d1c:	01012b03          	lw	s6,16(sp)
    6d20:	fff00513          	li	a0,-1
    6d24:	03010113          	add	sp,sp,48
    6d28:	00008067          	ret
    6d2c:	00000513          	li	a0,0
    6d30:	00008067          	ret
    6d34:	00000a93          	li	s5,0
    6d38:	00000513          	li	a0,0
    6d3c:	00000c13          	li	s8,0
    6d40:	00000993          	li	s3,0
    6d44:	08098263          	beqz	s3,6dc8 <__sfvwrite_r+0x368>
    6d48:	08050a63          	beqz	a0,6ddc <__sfvwrite_r+0x37c>
    6d4c:	000a8793          	mv	a5,s5
    6d50:	00098b93          	mv	s7,s3
    6d54:	0137f463          	bgeu	a5,s3,6d5c <__sfvwrite_r+0x2fc>
    6d58:	00078b93          	mv	s7,a5
    6d5c:	00042503          	lw	a0,0(s0)
    6d60:	01042783          	lw	a5,16(s0)
    6d64:	00842903          	lw	s2,8(s0)
    6d68:	01442683          	lw	a3,20(s0)
    6d6c:	00a7f663          	bgeu	a5,a0,6d78 <__sfvwrite_r+0x318>
    6d70:	00d90933          	add	s2,s2,a3
    6d74:	09794463          	blt	s2,s7,6dfc <__sfvwrite_r+0x39c>
    6d78:	16dbc263          	blt	s7,a3,6edc <__sfvwrite_r+0x47c>
    6d7c:	02442783          	lw	a5,36(s0)
    6d80:	01c42583          	lw	a1,28(s0)
    6d84:	000c0613          	mv	a2,s8
    6d88:	000a0513          	mv	a0,s4
    6d8c:	000780e7          	jalr	a5
    6d90:	00050913          	mv	s2,a0
    6d94:	f4a05ce3          	blez	a0,6cec <__sfvwrite_r+0x28c>
    6d98:	412a8ab3          	sub	s5,s5,s2
    6d9c:	00100513          	li	a0,1
    6da0:	f20a8ee3          	beqz	s5,6cdc <__sfvwrite_r+0x27c>
    6da4:	008b2783          	lw	a5,8(s6)
    6da8:	012c0c33          	add	s8,s8,s2
    6dac:	412989b3          	sub	s3,s3,s2
    6db0:	412787b3          	sub	a5,a5,s2
    6db4:	00fb2423          	sw	a5,8(s6)
    6db8:	f80796e3          	bnez	a5,6d44 <__sfvwrite_r+0x2e4>
    6dbc:	00c12b83          	lw	s7,12(sp)
    6dc0:	00812c03          	lw	s8,8(sp)
    6dc4:	eedff06f          	j	6cb0 <__sfvwrite_r+0x250>
    6dc8:	0044a983          	lw	s3,4(s1)
    6dcc:	00048793          	mv	a5,s1
    6dd0:	00848493          	add	s1,s1,8
    6dd4:	fe098ae3          	beqz	s3,6dc8 <__sfvwrite_r+0x368>
    6dd8:	0007ac03          	lw	s8,0(a5)
    6ddc:	00098613          	mv	a2,s3
    6de0:	00a00593          	li	a1,10
    6de4:	000c0513          	mv	a0,s8
    6de8:	1a1000ef          	jal	7788 <memchr>
    6dec:	14050c63          	beqz	a0,6f44 <__sfvwrite_r+0x4e4>
    6df0:	00150513          	add	a0,a0,1
    6df4:	41850ab3          	sub	s5,a0,s8
    6df8:	f55ff06f          	j	6d4c <__sfvwrite_r+0x2ec>
    6dfc:	000c0593          	mv	a1,s8
    6e00:	00090613          	mv	a2,s2
    6e04:	4e9000ef          	jal	7aec <memmove>
    6e08:	00042783          	lw	a5,0(s0)
    6e0c:	00040593          	mv	a1,s0
    6e10:	000a0513          	mv	a0,s4
    6e14:	012787b3          	add	a5,a5,s2
    6e18:	00f42023          	sw	a5,0(s0)
    6e1c:	8c1ff0ef          	jal	66dc <_fflush_r>
    6e20:	f6050ce3          	beqz	a0,6d98 <__sfvwrite_r+0x338>
    6e24:	ec9ff06f          	j	6cec <__sfvwrite_r+0x28c>
    6e28:	01042683          	lw	a3,16(s0)
    6e2c:	04f6e463          	bltu	a3,a5,6e74 <__sfvwrite_r+0x414>
    6e30:	01442583          	lw	a1,20(s0)
    6e34:	04b9e063          	bltu	s3,a1,6e74 <__sfvwrite_r+0x414>
    6e38:	00098913          	mv	s2,s3
    6e3c:	013af463          	bgeu	s5,s3,6e44 <__sfvwrite_r+0x3e4>
    6e40:	000a8913          	mv	s2,s5
    6e44:	00090513          	mv	a0,s2
    6e48:	65d070ef          	jal	eca4 <__modsi3>
    6e4c:	02442783          	lw	a5,36(s0)
    6e50:	01c42583          	lw	a1,28(s0)
    6e54:	40a906b3          	sub	a3,s2,a0
    6e58:	000b8613          	mv	a2,s7
    6e5c:	000a0513          	mv	a0,s4
    6e60:	000780e7          	jalr	a5
    6e64:	00050913          	mv	s2,a0
    6e68:	04a05a63          	blez	a0,6ebc <__sfvwrite_r+0x45c>
    6e6c:	412989b3          	sub	s3,s3,s2
    6e70:	df9ff06f          	j	6c68 <__sfvwrite_r+0x208>
    6e74:	00070913          	mv	s2,a4
    6e78:	00e9f463          	bgeu	s3,a4,6e80 <__sfvwrite_r+0x420>
    6e7c:	00098913          	mv	s2,s3
    6e80:	00078513          	mv	a0,a5
    6e84:	00090613          	mv	a2,s2
    6e88:	000b8593          	mv	a1,s7
    6e8c:	461000ef          	jal	7aec <memmove>
    6e90:	00842703          	lw	a4,8(s0)
    6e94:	00042783          	lw	a5,0(s0)
    6e98:	41270733          	sub	a4,a4,s2
    6e9c:	012787b3          	add	a5,a5,s2
    6ea0:	00e42423          	sw	a4,8(s0)
    6ea4:	00f42023          	sw	a5,0(s0)
    6ea8:	fc0712e3          	bnez	a4,6e6c <__sfvwrite_r+0x40c>
    6eac:	00040593          	mv	a1,s0
    6eb0:	000a0513          	mv	a0,s4
    6eb4:	829ff0ef          	jal	66dc <_fflush_r>
    6eb8:	fa050ae3          	beqz	a0,6e6c <__sfvwrite_r+0x40c>
    6ebc:	00c41783          	lh	a5,12(s0)
    6ec0:	00c12b83          	lw	s7,12(sp)
    6ec4:	00812c03          	lw	s8,8(sp)
    6ec8:	00412c83          	lw	s9,4(sp)
    6ecc:	e2dff06f          	j	6cf8 <__sfvwrite_r+0x298>
    6ed0:	00098c13          	mv	s8,s3
    6ed4:	00098c93          	mv	s9,s3
    6ed8:	d65ff06f          	j	6c3c <__sfvwrite_r+0x1dc>
    6edc:	000b8613          	mv	a2,s7
    6ee0:	000c0593          	mv	a1,s8
    6ee4:	409000ef          	jal	7aec <memmove>
    6ee8:	00842703          	lw	a4,8(s0)
    6eec:	00042783          	lw	a5,0(s0)
    6ef0:	000b8913          	mv	s2,s7
    6ef4:	41770733          	sub	a4,a4,s7
    6ef8:	017787b3          	add	a5,a5,s7
    6efc:	00e42423          	sw	a4,8(s0)
    6f00:	00f42023          	sw	a5,0(s0)
    6f04:	e95ff06f          	j	6d98 <__sfvwrite_r+0x338>
    6f08:	000a0513          	mv	a0,s4
    6f0c:	508030ef          	jal	a414 <_realloc_r>
    6f10:	00050c93          	mv	s9,a0
    6f14:	d00514e3          	bnez	a0,6c1c <__sfvwrite_r+0x1bc>
    6f18:	01042583          	lw	a1,16(s0)
    6f1c:	000a0513          	mv	a0,s4
    6f20:	ae8fa0ef          	jal	1208 <_free_r>
    6f24:	00c41783          	lh	a5,12(s0)
    6f28:	00c00713          	li	a4,12
    6f2c:	00c12b83          	lw	s7,12(sp)
    6f30:	00812c03          	lw	s8,8(sp)
    6f34:	00412c83          	lw	s9,4(sp)
    6f38:	00ea2023          	sw	a4,0(s4)
    6f3c:	f7f7f793          	and	a5,a5,-129
    6f40:	db9ff06f          	j	6cf8 <__sfvwrite_r+0x298>
    6f44:	00198793          	add	a5,s3,1
    6f48:	00078a93          	mv	s5,a5
    6f4c:	e05ff06f          	j	6d50 <__sfvwrite_r+0x2f0>
    6f50:	00c41783          	lh	a5,12(s0)
    6f54:	da5ff06f          	j	6cf8 <__sfvwrite_r+0x298>
    6f58:	00c00713          	li	a4,12
    6f5c:	00c41783          	lh	a5,12(s0)
    6f60:	00c12b83          	lw	s7,12(sp)
    6f64:	00812c03          	lw	s8,8(sp)
    6f68:	00412c83          	lw	s9,4(sp)
    6f6c:	00ea2023          	sw	a4,0(s4)
    6f70:	d89ff06f          	j	6cf8 <__sfvwrite_r+0x298>

00006f74 <_fwalk_sglue>:
    6f74:	fd010113          	add	sp,sp,-48
    6f78:	03212023          	sw	s2,32(sp)
    6f7c:	01312e23          	sw	s3,28(sp)
    6f80:	01412c23          	sw	s4,24(sp)
    6f84:	01512a23          	sw	s5,20(sp)
    6f88:	01612823          	sw	s6,16(sp)
    6f8c:	01712623          	sw	s7,12(sp)
    6f90:	02112623          	sw	ra,44(sp)
    6f94:	02812423          	sw	s0,40(sp)
    6f98:	02912223          	sw	s1,36(sp)
    6f9c:	00050b13          	mv	s6,a0
    6fa0:	00058b93          	mv	s7,a1
    6fa4:	00060a93          	mv	s5,a2
    6fa8:	00000a13          	li	s4,0
    6fac:	00100993          	li	s3,1
    6fb0:	fff00913          	li	s2,-1
    6fb4:	004aa483          	lw	s1,4(s5)
    6fb8:	008aa403          	lw	s0,8(s5)
    6fbc:	fff48493          	add	s1,s1,-1
    6fc0:	0204c863          	bltz	s1,6ff0 <_fwalk_sglue+0x7c>
    6fc4:	00c45783          	lhu	a5,12(s0)
    6fc8:	00f9fe63          	bgeu	s3,a5,6fe4 <_fwalk_sglue+0x70>
    6fcc:	00e41783          	lh	a5,14(s0)
    6fd0:	00040593          	mv	a1,s0
    6fd4:	000b0513          	mv	a0,s6
    6fd8:	01278663          	beq	a5,s2,6fe4 <_fwalk_sglue+0x70>
    6fdc:	000b80e7          	jalr	s7
    6fe0:	00aa6a33          	or	s4,s4,a0
    6fe4:	fff48493          	add	s1,s1,-1
    6fe8:	06840413          	add	s0,s0,104
    6fec:	fd249ce3          	bne	s1,s2,6fc4 <_fwalk_sglue+0x50>
    6ff0:	000aaa83          	lw	s5,0(s5)
    6ff4:	fc0a90e3          	bnez	s5,6fb4 <_fwalk_sglue+0x40>
    6ff8:	02c12083          	lw	ra,44(sp)
    6ffc:	02812403          	lw	s0,40(sp)
    7000:	02412483          	lw	s1,36(sp)
    7004:	02012903          	lw	s2,32(sp)
    7008:	01c12983          	lw	s3,28(sp)
    700c:	01412a83          	lw	s5,20(sp)
    7010:	01012b03          	lw	s6,16(sp)
    7014:	00c12b83          	lw	s7,12(sp)
    7018:	000a0513          	mv	a0,s4
    701c:	01812a03          	lw	s4,24(sp)
    7020:	03010113          	add	sp,sp,48
    7024:	00008067          	ret

00007028 <_putc_r>:
    7028:	fe010113          	add	sp,sp,-32
    702c:	00812c23          	sw	s0,24(sp)
    7030:	01212a23          	sw	s2,20(sp)
    7034:	00112e23          	sw	ra,28(sp)
    7038:	00050913          	mv	s2,a0
    703c:	00060413          	mv	s0,a2
    7040:	00050663          	beqz	a0,704c <_putc_r+0x24>
    7044:	03452783          	lw	a5,52(a0)
    7048:	0c078663          	beqz	a5,7114 <_putc_r+0xec>
    704c:	06442783          	lw	a5,100(s0)
    7050:	0017f793          	and	a5,a5,1
    7054:	00079863          	bnez	a5,7064 <_putc_r+0x3c>
    7058:	00c45783          	lhu	a5,12(s0)
    705c:	2007f793          	and	a5,a5,512
    7060:	08078063          	beqz	a5,70e0 <_putc_r+0xb8>
    7064:	00842783          	lw	a5,8(s0)
    7068:	fff78793          	add	a5,a5,-1
    706c:	00f42423          	sw	a5,8(s0)
    7070:	0007dc63          	bgez	a5,7088 <_putc_r+0x60>
    7074:	01842703          	lw	a4,24(s0)
    7078:	04e7ca63          	blt	a5,a4,70cc <_putc_r+0xa4>
    707c:	0ff5f793          	zext.b	a5,a1
    7080:	00a00713          	li	a4,10
    7084:	04e78463          	beq	a5,a4,70cc <_putc_r+0xa4>
    7088:	00042783          	lw	a5,0(s0)
    708c:	0ff5f913          	zext.b	s2,a1
    7090:	00178713          	add	a4,a5,1
    7094:	00e42023          	sw	a4,0(s0)
    7098:	00b78023          	sb	a1,0(a5)
    709c:	06442783          	lw	a5,100(s0)
    70a0:	0017f793          	and	a5,a5,1
    70a4:	00079863          	bnez	a5,70b4 <_putc_r+0x8c>
    70a8:	00c45783          	lhu	a5,12(s0)
    70ac:	2007f793          	and	a5,a5,512
    70b0:	04078263          	beqz	a5,70f4 <_putc_r+0xcc>
    70b4:	01c12083          	lw	ra,28(sp)
    70b8:	01812403          	lw	s0,24(sp)
    70bc:	00090513          	mv	a0,s2
    70c0:	01412903          	lw	s2,20(sp)
    70c4:	02010113          	add	sp,sp,32
    70c8:	00008067          	ret
    70cc:	00090513          	mv	a0,s2
    70d0:	00040613          	mv	a2,s0
    70d4:	1b4000ef          	jal	7288 <__swbuf_r>
    70d8:	00050913          	mv	s2,a0
    70dc:	fc1ff06f          	j	709c <_putc_r+0x74>
    70e0:	05842503          	lw	a0,88(s0)
    70e4:	00b12623          	sw	a1,12(sp)
    70e8:	cc9f90ef          	jal	db0 <__retarget_lock_acquire_recursive>
    70ec:	00c12583          	lw	a1,12(sp)
    70f0:	f75ff06f          	j	7064 <_putc_r+0x3c>
    70f4:	05842503          	lw	a0,88(s0)
    70f8:	cbdf90ef          	jal	db4 <__retarget_lock_release_recursive>
    70fc:	01c12083          	lw	ra,28(sp)
    7100:	01812403          	lw	s0,24(sp)
    7104:	00090513          	mv	a0,s2
    7108:	01412903          	lw	s2,20(sp)
    710c:	02010113          	add	sp,sp,32
    7110:	00008067          	ret
    7114:	00b12623          	sw	a1,12(sp)
    7118:	8c1ff0ef          	jal	69d8 <__sinit>
    711c:	00c12583          	lw	a1,12(sp)
    7120:	f2dff06f          	j	704c <_putc_r+0x24>

00007124 <__sread>:
    7124:	ff010113          	add	sp,sp,-16
    7128:	00812423          	sw	s0,8(sp)
    712c:	00058413          	mv	s0,a1
    7130:	00e59583          	lh	a1,14(a1)
    7134:	00112623          	sw	ra,12(sp)
    7138:	095000ef          	jal	79cc <_read_r>
    713c:	02054063          	bltz	a0,715c <__sread+0x38>
    7140:	05042783          	lw	a5,80(s0)
    7144:	00c12083          	lw	ra,12(sp)
    7148:	00a787b3          	add	a5,a5,a0
    714c:	04f42823          	sw	a5,80(s0)
    7150:	00812403          	lw	s0,8(sp)
    7154:	01010113          	add	sp,sp,16
    7158:	00008067          	ret
    715c:	00c45783          	lhu	a5,12(s0)
    7160:	fffff737          	lui	a4,0xfffff
    7164:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7168:	00e7f7b3          	and	a5,a5,a4
    716c:	00c12083          	lw	ra,12(sp)
    7170:	00f41623          	sh	a5,12(s0)
    7174:	00812403          	lw	s0,8(sp)
    7178:	01010113          	add	sp,sp,16
    717c:	00008067          	ret

00007180 <__swrite>:
    7180:	00c59783          	lh	a5,12(a1)
    7184:	fe010113          	add	sp,sp,-32
    7188:	00812c23          	sw	s0,24(sp)
    718c:	00912a23          	sw	s1,20(sp)
    7190:	01212823          	sw	s2,16(sp)
    7194:	01312623          	sw	s3,12(sp)
    7198:	00112e23          	sw	ra,28(sp)
    719c:	1007f713          	and	a4,a5,256
    71a0:	00058413          	mv	s0,a1
    71a4:	00050493          	mv	s1,a0
    71a8:	00060913          	mv	s2,a2
    71ac:	00068993          	mv	s3,a3
    71b0:	04071063          	bnez	a4,71f0 <__swrite+0x70>
    71b4:	fffff737          	lui	a4,0xfffff
    71b8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    71bc:	00e7f7b3          	and	a5,a5,a4
    71c0:	00e41583          	lh	a1,14(s0)
    71c4:	00f41623          	sh	a5,12(s0)
    71c8:	01812403          	lw	s0,24(sp)
    71cc:	01c12083          	lw	ra,28(sp)
    71d0:	00098693          	mv	a3,s3
    71d4:	00090613          	mv	a2,s2
    71d8:	00c12983          	lw	s3,12(sp)
    71dc:	01012903          	lw	s2,16(sp)
    71e0:	00048513          	mv	a0,s1
    71e4:	01412483          	lw	s1,20(sp)
    71e8:	02010113          	add	sp,sp,32
    71ec:	09d0006f          	j	7a88 <_write_r>
    71f0:	00e59583          	lh	a1,14(a1)
    71f4:	00200693          	li	a3,2
    71f8:	00000613          	li	a2,0
    71fc:	76c000ef          	jal	7968 <_lseek_r>
    7200:	00c41783          	lh	a5,12(s0)
    7204:	fb1ff06f          	j	71b4 <__swrite+0x34>

00007208 <__sseek>:
    7208:	ff010113          	add	sp,sp,-16
    720c:	00812423          	sw	s0,8(sp)
    7210:	00058413          	mv	s0,a1
    7214:	00e59583          	lh	a1,14(a1)
    7218:	00112623          	sw	ra,12(sp)
    721c:	74c000ef          	jal	7968 <_lseek_r>
    7220:	fff00793          	li	a5,-1
    7224:	02f50863          	beq	a0,a5,7254 <__sseek+0x4c>
    7228:	00c45783          	lhu	a5,12(s0)
    722c:	00001737          	lui	a4,0x1
    7230:	00c12083          	lw	ra,12(sp)
    7234:	00e7e7b3          	or	a5,a5,a4
    7238:	01079793          	sll	a5,a5,0x10
    723c:	4107d793          	sra	a5,a5,0x10
    7240:	04a42823          	sw	a0,80(s0)
    7244:	00f41623          	sh	a5,12(s0)
    7248:	00812403          	lw	s0,8(sp)
    724c:	01010113          	add	sp,sp,16
    7250:	00008067          	ret
    7254:	00c45783          	lhu	a5,12(s0)
    7258:	fffff737          	lui	a4,0xfffff
    725c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7260:	00e7f7b3          	and	a5,a5,a4
    7264:	01079793          	sll	a5,a5,0x10
    7268:	4107d793          	sra	a5,a5,0x10
    726c:	00c12083          	lw	ra,12(sp)
    7270:	00f41623          	sh	a5,12(s0)
    7274:	00812403          	lw	s0,8(sp)
    7278:	01010113          	add	sp,sp,16
    727c:	00008067          	ret

00007280 <__sclose>:
    7280:	00e59583          	lh	a1,14(a1)
    7284:	68c0006f          	j	7910 <_close_r>

00007288 <__swbuf_r>:
    7288:	fe010113          	add	sp,sp,-32
    728c:	00812c23          	sw	s0,24(sp)
    7290:	00912a23          	sw	s1,20(sp)
    7294:	01212823          	sw	s2,16(sp)
    7298:	00112e23          	sw	ra,28(sp)
    729c:	00050913          	mv	s2,a0
    72a0:	00058493          	mv	s1,a1
    72a4:	00060413          	mv	s0,a2
    72a8:	00050663          	beqz	a0,72b4 <__swbuf_r+0x2c>
    72ac:	03452783          	lw	a5,52(a0)
    72b0:	16078063          	beqz	a5,7410 <__swbuf_r+0x188>
    72b4:	01842783          	lw	a5,24(s0)
    72b8:	00c41703          	lh	a4,12(s0)
    72bc:	00f42423          	sw	a5,8(s0)
    72c0:	00877793          	and	a5,a4,8
    72c4:	08078063          	beqz	a5,7344 <__swbuf_r+0xbc>
    72c8:	01042783          	lw	a5,16(s0)
    72cc:	06078c63          	beqz	a5,7344 <__swbuf_r+0xbc>
    72d0:	01312623          	sw	s3,12(sp)
    72d4:	01271693          	sll	a3,a4,0x12
    72d8:	0ff4f993          	zext.b	s3,s1
    72dc:	0ff4f493          	zext.b	s1,s1
    72e0:	0806d863          	bgez	a3,7370 <__swbuf_r+0xe8>
    72e4:	00042703          	lw	a4,0(s0)
    72e8:	01442683          	lw	a3,20(s0)
    72ec:	40f707b3          	sub	a5,a4,a5
    72f0:	0ad7d863          	bge	a5,a3,73a0 <__swbuf_r+0x118>
    72f4:	00842683          	lw	a3,8(s0)
    72f8:	00170613          	add	a2,a4,1
    72fc:	00c42023          	sw	a2,0(s0)
    7300:	fff68693          	add	a3,a3,-1
    7304:	00d42423          	sw	a3,8(s0)
    7308:	01370023          	sb	s3,0(a4)
    730c:	01442703          	lw	a4,20(s0)
    7310:	00178793          	add	a5,a5,1
    7314:	0cf70263          	beq	a4,a5,73d8 <__swbuf_r+0x150>
    7318:	00c45783          	lhu	a5,12(s0)
    731c:	0017f793          	and	a5,a5,1
    7320:	0c079a63          	bnez	a5,73f4 <__swbuf_r+0x16c>
    7324:	00c12983          	lw	s3,12(sp)
    7328:	01c12083          	lw	ra,28(sp)
    732c:	01812403          	lw	s0,24(sp)
    7330:	01012903          	lw	s2,16(sp)
    7334:	00048513          	mv	a0,s1
    7338:	01412483          	lw	s1,20(sp)
    733c:	02010113          	add	sp,sp,32
    7340:	00008067          	ret
    7344:	00040593          	mv	a1,s0
    7348:	00090513          	mv	a0,s2
    734c:	0cc000ef          	jal	7418 <__swsetup_r>
    7350:	08051e63          	bnez	a0,73ec <__swbuf_r+0x164>
    7354:	00c41703          	lh	a4,12(s0)
    7358:	01312623          	sw	s3,12(sp)
    735c:	01042783          	lw	a5,16(s0)
    7360:	01271693          	sll	a3,a4,0x12
    7364:	0ff4f993          	zext.b	s3,s1
    7368:	0ff4f493          	zext.b	s1,s1
    736c:	f606cce3          	bltz	a3,72e4 <__swbuf_r+0x5c>
    7370:	06442683          	lw	a3,100(s0)
    7374:	ffffe637          	lui	a2,0xffffe
    7378:	000025b7          	lui	a1,0x2
    737c:	00b76733          	or	a4,a4,a1
    7380:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7384:	00c6f6b3          	and	a3,a3,a2
    7388:	00e41623          	sh	a4,12(s0)
    738c:	00042703          	lw	a4,0(s0)
    7390:	06d42223          	sw	a3,100(s0)
    7394:	01442683          	lw	a3,20(s0)
    7398:	40f707b3          	sub	a5,a4,a5
    739c:	f4d7cce3          	blt	a5,a3,72f4 <__swbuf_r+0x6c>
    73a0:	00040593          	mv	a1,s0
    73a4:	00090513          	mv	a0,s2
    73a8:	b34ff0ef          	jal	66dc <_fflush_r>
    73ac:	02051e63          	bnez	a0,73e8 <__swbuf_r+0x160>
    73b0:	00042703          	lw	a4,0(s0)
    73b4:	00842683          	lw	a3,8(s0)
    73b8:	00100793          	li	a5,1
    73bc:	00170613          	add	a2,a4,1
    73c0:	fff68693          	add	a3,a3,-1
    73c4:	00c42023          	sw	a2,0(s0)
    73c8:	00d42423          	sw	a3,8(s0)
    73cc:	01370023          	sb	s3,0(a4)
    73d0:	01442703          	lw	a4,20(s0)
    73d4:	f4f712e3          	bne	a4,a5,7318 <__swbuf_r+0x90>
    73d8:	00040593          	mv	a1,s0
    73dc:	00090513          	mv	a0,s2
    73e0:	afcff0ef          	jal	66dc <_fflush_r>
    73e4:	f40500e3          	beqz	a0,7324 <__swbuf_r+0x9c>
    73e8:	00c12983          	lw	s3,12(sp)
    73ec:	fff00493          	li	s1,-1
    73f0:	f39ff06f          	j	7328 <__swbuf_r+0xa0>
    73f4:	00a00793          	li	a5,10
    73f8:	f2f496e3          	bne	s1,a5,7324 <__swbuf_r+0x9c>
    73fc:	00040593          	mv	a1,s0
    7400:	00090513          	mv	a0,s2
    7404:	ad8ff0ef          	jal	66dc <_fflush_r>
    7408:	f0050ee3          	beqz	a0,7324 <__swbuf_r+0x9c>
    740c:	fddff06f          	j	73e8 <__swbuf_r+0x160>
    7410:	dc8ff0ef          	jal	69d8 <__sinit>
    7414:	ea1ff06f          	j	72b4 <__swbuf_r+0x2c>

00007418 <__swsetup_r>:
    7418:	ff010113          	add	sp,sp,-16
    741c:	00812423          	sw	s0,8(sp)
    7420:	00912223          	sw	s1,4(sp)
    7424:	00112623          	sw	ra,12(sp)
    7428:	7fff9797          	auipc	a5,0x7fff9
    742c:	2e07a783          	lw	a5,736(a5) # 80000708 <_impure_ptr>
    7430:	00050493          	mv	s1,a0
    7434:	00058413          	mv	s0,a1
    7438:	00078663          	beqz	a5,7444 <__swsetup_r+0x2c>
    743c:	0347a703          	lw	a4,52(a5)
    7440:	0e070c63          	beqz	a4,7538 <__swsetup_r+0x120>
    7444:	00c41783          	lh	a5,12(s0)
    7448:	0087f713          	and	a4,a5,8
    744c:	06070a63          	beqz	a4,74c0 <__swsetup_r+0xa8>
    7450:	01042703          	lw	a4,16(s0)
    7454:	08070663          	beqz	a4,74e0 <__swsetup_r+0xc8>
    7458:	0017f693          	and	a3,a5,1
    745c:	02068863          	beqz	a3,748c <__swsetup_r+0x74>
    7460:	01442683          	lw	a3,20(s0)
    7464:	00042423          	sw	zero,8(s0)
    7468:	00000513          	li	a0,0
    746c:	40d006b3          	neg	a3,a3
    7470:	00d42c23          	sw	a3,24(s0)
    7474:	02070a63          	beqz	a4,74a8 <__swsetup_r+0x90>
    7478:	00c12083          	lw	ra,12(sp)
    747c:	00812403          	lw	s0,8(sp)
    7480:	00412483          	lw	s1,4(sp)
    7484:	01010113          	add	sp,sp,16
    7488:	00008067          	ret
    748c:	0027f693          	and	a3,a5,2
    7490:	00000613          	li	a2,0
    7494:	00069463          	bnez	a3,749c <__swsetup_r+0x84>
    7498:	01442603          	lw	a2,20(s0)
    749c:	00c42423          	sw	a2,8(s0)
    74a0:	00000513          	li	a0,0
    74a4:	fc071ae3          	bnez	a4,7478 <__swsetup_r+0x60>
    74a8:	0807f713          	and	a4,a5,128
    74ac:	fc0706e3          	beqz	a4,7478 <__swsetup_r+0x60>
    74b0:	0407e793          	or	a5,a5,64
    74b4:	00f41623          	sh	a5,12(s0)
    74b8:	fff00513          	li	a0,-1
    74bc:	fbdff06f          	j	7478 <__swsetup_r+0x60>
    74c0:	0107f713          	and	a4,a5,16
    74c4:	08070063          	beqz	a4,7544 <__swsetup_r+0x12c>
    74c8:	0047f713          	and	a4,a5,4
    74cc:	02071c63          	bnez	a4,7504 <__swsetup_r+0xec>
    74d0:	01042703          	lw	a4,16(s0)
    74d4:	0087e793          	or	a5,a5,8
    74d8:	00f41623          	sh	a5,12(s0)
    74dc:	f6071ee3          	bnez	a4,7458 <__swsetup_r+0x40>
    74e0:	2807f693          	and	a3,a5,640
    74e4:	20000613          	li	a2,512
    74e8:	f6c688e3          	beq	a3,a2,7458 <__swsetup_r+0x40>
    74ec:	00040593          	mv	a1,s0
    74f0:	00048513          	mv	a0,s1
    74f4:	6cc030ef          	jal	abc0 <__smakebuf_r>
    74f8:	00c41783          	lh	a5,12(s0)
    74fc:	01042703          	lw	a4,16(s0)
    7500:	f59ff06f          	j	7458 <__swsetup_r+0x40>
    7504:	03042583          	lw	a1,48(s0)
    7508:	00058e63          	beqz	a1,7524 <__swsetup_r+0x10c>
    750c:	04040713          	add	a4,s0,64
    7510:	00e58863          	beq	a1,a4,7520 <__swsetup_r+0x108>
    7514:	00048513          	mv	a0,s1
    7518:	cf1f90ef          	jal	1208 <_free_r>
    751c:	00c41783          	lh	a5,12(s0)
    7520:	02042823          	sw	zero,48(s0)
    7524:	01042703          	lw	a4,16(s0)
    7528:	fdb7f793          	and	a5,a5,-37
    752c:	00042223          	sw	zero,4(s0)
    7530:	00e42023          	sw	a4,0(s0)
    7534:	fa1ff06f          	j	74d4 <__swsetup_r+0xbc>
    7538:	00078513          	mv	a0,a5
    753c:	c9cff0ef          	jal	69d8 <__sinit>
    7540:	f05ff06f          	j	7444 <__swsetup_r+0x2c>
    7544:	00900713          	li	a4,9
    7548:	00e4a023          	sw	a4,0(s1)
    754c:	0407e793          	or	a5,a5,64
    7550:	00f41623          	sh	a5,12(s0)
    7554:	fff00513          	li	a0,-1
    7558:	f21ff06f          	j	7478 <__swsetup_r+0x60>

0000755c <__fputwc>:
    755c:	fc010113          	add	sp,sp,-64
    7560:	02812c23          	sw	s0,56(sp)
    7564:	03412423          	sw	s4,40(sp)
    7568:	03512223          	sw	s5,36(sp)
    756c:	02112e23          	sw	ra,60(sp)
    7570:	02912a23          	sw	s1,52(sp)
    7574:	03312623          	sw	s3,44(sp)
    7578:	00050a13          	mv	s4,a0
    757c:	00058a93          	mv	s5,a1
    7580:	00060413          	mv	s0,a2
    7584:	374000ef          	jal	78f8 <__locale_mb_cur_max>
    7588:	00100793          	li	a5,1
    758c:	02f51663          	bne	a0,a5,75b8 <__fputwc+0x5c>
    7590:	fffa8793          	add	a5,s5,-1
    7594:	0fe00713          	li	a4,254
    7598:	02f76063          	bltu	a4,a5,75b8 <__fputwc+0x5c>
    759c:	03212823          	sw	s2,48(sp)
    75a0:	03612023          	sw	s6,32(sp)
    75a4:	01712e23          	sw	s7,28(sp)
    75a8:	01510423          	sb	s5,8(sp)
    75ac:	00100993          	li	s3,1
    75b0:	00810493          	add	s1,sp,8
    75b4:	0380006f          	j	75ec <__fputwc+0x90>
    75b8:	00810493          	add	s1,sp,8
    75bc:	05c40693          	add	a3,s0,92
    75c0:	000a8613          	mv	a2,s5
    75c4:	00048593          	mv	a1,s1
    75c8:	000a0513          	mv	a0,s4
    75cc:	3e8030ef          	jal	a9b4 <_wcrtomb_r>
    75d0:	fff00793          	li	a5,-1
    75d4:	00050993          	mv	s3,a0
    75d8:	0cf50a63          	beq	a0,a5,76ac <__fputwc+0x150>
    75dc:	0a050663          	beqz	a0,7688 <__fputwc+0x12c>
    75e0:	03212823          	sw	s2,48(sp)
    75e4:	03612023          	sw	s6,32(sp)
    75e8:	01712e23          	sw	s7,28(sp)
    75ec:	00000913          	li	s2,0
    75f0:	fff00b13          	li	s6,-1
    75f4:	00a00b93          	li	s7,10
    75f8:	0200006f          	j	7618 <__fputwc+0xbc>
    75fc:	00042783          	lw	a5,0(s0)
    7600:	00178693          	add	a3,a5,1
    7604:	00d42023          	sw	a3,0(s0)
    7608:	00e78023          	sb	a4,0(a5)
    760c:	00190913          	add	s2,s2,1
    7610:	00148493          	add	s1,s1,1
    7614:	07397463          	bgeu	s2,s3,767c <__fputwc+0x120>
    7618:	00842783          	lw	a5,8(s0)
    761c:	0004c703          	lbu	a4,0(s1)
    7620:	fff78793          	add	a5,a5,-1
    7624:	00f42423          	sw	a5,8(s0)
    7628:	fc07dae3          	bgez	a5,75fc <__fputwc+0xa0>
    762c:	01842683          	lw	a3,24(s0)
    7630:	00040613          	mv	a2,s0
    7634:	00070593          	mv	a1,a4
    7638:	000a0513          	mv	a0,s4
    763c:	00d7c463          	blt	a5,a3,7644 <__fputwc+0xe8>
    7640:	fb771ee3          	bne	a4,s7,75fc <__fputwc+0xa0>
    7644:	c45ff0ef          	jal	7288 <__swbuf_r>
    7648:	fd6512e3          	bne	a0,s6,760c <__fputwc+0xb0>
    764c:	03012903          	lw	s2,48(sp)
    7650:	02012b03          	lw	s6,32(sp)
    7654:	01c12b83          	lw	s7,28(sp)
    7658:	03c12083          	lw	ra,60(sp)
    765c:	03812403          	lw	s0,56(sp)
    7660:	03412483          	lw	s1,52(sp)
    7664:	02c12983          	lw	s3,44(sp)
    7668:	02812a03          	lw	s4,40(sp)
    766c:	02412a83          	lw	s5,36(sp)
    7670:	fff00513          	li	a0,-1
    7674:	04010113          	add	sp,sp,64
    7678:	00008067          	ret
    767c:	03012903          	lw	s2,48(sp)
    7680:	02012b03          	lw	s6,32(sp)
    7684:	01c12b83          	lw	s7,28(sp)
    7688:	03c12083          	lw	ra,60(sp)
    768c:	03812403          	lw	s0,56(sp)
    7690:	03412483          	lw	s1,52(sp)
    7694:	02c12983          	lw	s3,44(sp)
    7698:	02812a03          	lw	s4,40(sp)
    769c:	000a8513          	mv	a0,s5
    76a0:	02412a83          	lw	s5,36(sp)
    76a4:	04010113          	add	sp,sp,64
    76a8:	00008067          	ret
    76ac:	00c45783          	lhu	a5,12(s0)
    76b0:	0407e793          	or	a5,a5,64
    76b4:	00f41623          	sh	a5,12(s0)
    76b8:	fa1ff06f          	j	7658 <__fputwc+0xfc>

000076bc <_fputwc_r>:
    76bc:	06462783          	lw	a5,100(a2)
    76c0:	fe010113          	add	sp,sp,-32
    76c4:	00812c23          	sw	s0,24(sp)
    76c8:	00912a23          	sw	s1,20(sp)
    76cc:	0017f713          	and	a4,a5,1
    76d0:	00112e23          	sw	ra,28(sp)
    76d4:	00c61783          	lh	a5,12(a2)
    76d8:	00060413          	mv	s0,a2
    76dc:	00050493          	mv	s1,a0
    76e0:	00071663          	bnez	a4,76ec <_fputwc_r+0x30>
    76e4:	2007f713          	and	a4,a5,512
    76e8:	08070463          	beqz	a4,7770 <_fputwc_r+0xb4>
    76ec:	01279713          	sll	a4,a5,0x12
    76f0:	02074063          	bltz	a4,7710 <_fputwc_r+0x54>
    76f4:	06442703          	lw	a4,100(s0)
    76f8:	000026b7          	lui	a3,0x2
    76fc:	00d7e7b3          	or	a5,a5,a3
    7700:	000026b7          	lui	a3,0x2
    7704:	00d76733          	or	a4,a4,a3
    7708:	00f41623          	sh	a5,12(s0)
    770c:	06e42223          	sw	a4,100(s0)
    7710:	00048513          	mv	a0,s1
    7714:	00040613          	mv	a2,s0
    7718:	e45ff0ef          	jal	755c <__fputwc>
    771c:	06442783          	lw	a5,100(s0)
    7720:	00050493          	mv	s1,a0
    7724:	0017f793          	and	a5,a5,1
    7728:	00079863          	bnez	a5,7738 <_fputwc_r+0x7c>
    772c:	00c45783          	lhu	a5,12(s0)
    7730:	2007f793          	and	a5,a5,512
    7734:	00078e63          	beqz	a5,7750 <_fputwc_r+0x94>
    7738:	01c12083          	lw	ra,28(sp)
    773c:	01812403          	lw	s0,24(sp)
    7740:	00048513          	mv	a0,s1
    7744:	01412483          	lw	s1,20(sp)
    7748:	02010113          	add	sp,sp,32
    774c:	00008067          	ret
    7750:	05842503          	lw	a0,88(s0)
    7754:	e60f90ef          	jal	db4 <__retarget_lock_release_recursive>
    7758:	01c12083          	lw	ra,28(sp)
    775c:	01812403          	lw	s0,24(sp)
    7760:	00048513          	mv	a0,s1
    7764:	01412483          	lw	s1,20(sp)
    7768:	02010113          	add	sp,sp,32
    776c:	00008067          	ret
    7770:	05862503          	lw	a0,88(a2)
    7774:	00b12623          	sw	a1,12(sp)
    7778:	e38f90ef          	jal	db0 <__retarget_lock_acquire_recursive>
    777c:	00c41783          	lh	a5,12(s0)
    7780:	00c12583          	lw	a1,12(sp)
    7784:	f69ff06f          	j	76ec <_fputwc_r+0x30>

00007788 <memchr>:
    7788:	00357793          	and	a5,a0,3
    778c:	0ff5f693          	zext.b	a3,a1
    7790:	02078a63          	beqz	a5,77c4 <memchr+0x3c>
    7794:	fff60793          	add	a5,a2,-1
    7798:	02060e63          	beqz	a2,77d4 <memchr+0x4c>
    779c:	fff00613          	li	a2,-1
    77a0:	0180006f          	j	77b8 <memchr+0x30>
    77a4:	00150513          	add	a0,a0,1
    77a8:	00357713          	and	a4,a0,3
    77ac:	00070e63          	beqz	a4,77c8 <memchr+0x40>
    77b0:	fff78793          	add	a5,a5,-1
    77b4:	02c78063          	beq	a5,a2,77d4 <memchr+0x4c>
    77b8:	00054703          	lbu	a4,0(a0)
    77bc:	fed714e3          	bne	a4,a3,77a4 <memchr+0x1c>
    77c0:	00008067          	ret
    77c4:	00060793          	mv	a5,a2
    77c8:	00300713          	li	a4,3
    77cc:	00f76863          	bltu	a4,a5,77dc <memchr+0x54>
    77d0:	06079063          	bnez	a5,7830 <memchr+0xa8>
    77d4:	00000513          	li	a0,0
    77d8:	00008067          	ret
    77dc:	0ff5f593          	zext.b	a1,a1
    77e0:	00859713          	sll	a4,a1,0x8
    77e4:	00b705b3          	add	a1,a4,a1
    77e8:	01059713          	sll	a4,a1,0x10
    77ec:	feff08b7          	lui	a7,0xfeff0
    77f0:	80808837          	lui	a6,0x80808
    77f4:	00e585b3          	add	a1,a1,a4
    77f8:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    77fc:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7800:	00300313          	li	t1,3
    7804:	0100006f          	j	7814 <memchr+0x8c>
    7808:	ffc78793          	add	a5,a5,-4
    780c:	00450513          	add	a0,a0,4
    7810:	fcf370e3          	bgeu	t1,a5,77d0 <memchr+0x48>
    7814:	00052703          	lw	a4,0(a0)
    7818:	00e5c733          	xor	a4,a1,a4
    781c:	01170633          	add	a2,a4,a7
    7820:	fff74713          	not	a4,a4
    7824:	00e67733          	and	a4,a2,a4
    7828:	01077733          	and	a4,a4,a6
    782c:	fc070ee3          	beqz	a4,7808 <memchr+0x80>
    7830:	00f507b3          	add	a5,a0,a5
    7834:	00c0006f          	j	7840 <memchr+0xb8>
    7838:	00150513          	add	a0,a0,1
    783c:	f8f50ce3          	beq	a0,a5,77d4 <memchr+0x4c>
    7840:	00054703          	lbu	a4,0(a0)
    7844:	fed71ae3          	bne	a4,a3,7838 <memchr+0xb0>
    7848:	00008067          	ret

0000784c <strncpy>:
    784c:	00a5e7b3          	or	a5,a1,a0
    7850:	0037f793          	and	a5,a5,3
    7854:	00079663          	bnez	a5,7860 <strncpy+0x14>
    7858:	00300793          	li	a5,3
    785c:	04c7e663          	bltu	a5,a2,78a8 <strncpy+0x5c>
    7860:	00050713          	mv	a4,a0
    7864:	01c0006f          	j	7880 <strncpy+0x34>
    7868:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x2f3>
    786c:	fff60813          	add	a6,a2,-1
    7870:	fed78fa3          	sb	a3,-1(a5)
    7874:	00068e63          	beqz	a3,7890 <strncpy+0x44>
    7878:	00078713          	mv	a4,a5
    787c:	00080613          	mv	a2,a6
    7880:	00158593          	add	a1,a1,1
    7884:	00170793          	add	a5,a4,1
    7888:	fe0610e3          	bnez	a2,7868 <strncpy+0x1c>
    788c:	00008067          	ret
    7890:	00c70733          	add	a4,a4,a2
    7894:	06080063          	beqz	a6,78f4 <strncpy+0xa8>
    7898:	00178793          	add	a5,a5,1
    789c:	fe078fa3          	sb	zero,-1(a5)
    78a0:	fee79ce3          	bne	a5,a4,7898 <strncpy+0x4c>
    78a4:	00008067          	ret
    78a8:	feff0337          	lui	t1,0xfeff0
    78ac:	808088b7          	lui	a7,0x80808
    78b0:	00050713          	mv	a4,a0
    78b4:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    78b8:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    78bc:	00300e13          	li	t3,3
    78c0:	0180006f          	j	78d8 <strncpy+0x8c>
    78c4:	00d72023          	sw	a3,0(a4)
    78c8:	ffc60613          	add	a2,a2,-4
    78cc:	00470713          	add	a4,a4,4
    78d0:	00458593          	add	a1,a1,4
    78d4:	face76e3          	bgeu	t3,a2,7880 <strncpy+0x34>
    78d8:	0005a683          	lw	a3,0(a1)
    78dc:	006687b3          	add	a5,a3,t1
    78e0:	fff6c813          	not	a6,a3
    78e4:	0107f7b3          	and	a5,a5,a6
    78e8:	0117f7b3          	and	a5,a5,a7
    78ec:	fc078ce3          	beqz	a5,78c4 <strncpy+0x78>
    78f0:	f91ff06f          	j	7880 <strncpy+0x34>
    78f4:	00008067          	ret

000078f8 <__locale_mb_cur_max>:
    78f8:	7fff9517          	auipc	a0,0x7fff9
    78fc:	d6454503          	lbu	a0,-668(a0) # 8000065c <__global_locale+0x128>
    7900:	00008067          	ret

00007904 <_localeconv_r>:
    7904:	7fff9517          	auipc	a0,0x7fff9
    7908:	d2050513          	add	a0,a0,-736 # 80000624 <__global_locale+0xf0>
    790c:	00008067          	ret

00007910 <_close_r>:
    7910:	ff010113          	add	sp,sp,-16
    7914:	00812423          	sw	s0,8(sp)
    7918:	00050413          	mv	s0,a0
    791c:	00058513          	mv	a0,a1
    7920:	7fff9797          	auipc	a5,0x7fff9
    7924:	de07ac23          	sw	zero,-520(a5) # 80000718 <errno>
    7928:	00112623          	sw	ra,12(sp)
    792c:	85cf90ef          	jal	988 <_close>
    7930:	fff00793          	li	a5,-1
    7934:	00f50a63          	beq	a0,a5,7948 <_close_r+0x38>
    7938:	00c12083          	lw	ra,12(sp)
    793c:	00812403          	lw	s0,8(sp)
    7940:	01010113          	add	sp,sp,16
    7944:	00008067          	ret
    7948:	7fff9797          	auipc	a5,0x7fff9
    794c:	dd07a783          	lw	a5,-560(a5) # 80000718 <errno>
    7950:	fe0784e3          	beqz	a5,7938 <_close_r+0x28>
    7954:	00c12083          	lw	ra,12(sp)
    7958:	00f42023          	sw	a5,0(s0)
    795c:	00812403          	lw	s0,8(sp)
    7960:	01010113          	add	sp,sp,16
    7964:	00008067          	ret

00007968 <_lseek_r>:
    7968:	ff010113          	add	sp,sp,-16
    796c:	00058713          	mv	a4,a1
    7970:	00812423          	sw	s0,8(sp)
    7974:	00060593          	mv	a1,a2
    7978:	00050413          	mv	s0,a0
    797c:	00068613          	mv	a2,a3
    7980:	00070513          	mv	a0,a4
    7984:	7fff9797          	auipc	a5,0x7fff9
    7988:	d807aa23          	sw	zero,-620(a5) # 80000718 <errno>
    798c:	00112623          	sw	ra,12(sp)
    7990:	834f90ef          	jal	9c4 <_lseek>
    7994:	fff00793          	li	a5,-1
    7998:	00f50a63          	beq	a0,a5,79ac <_lseek_r+0x44>
    799c:	00c12083          	lw	ra,12(sp)
    79a0:	00812403          	lw	s0,8(sp)
    79a4:	01010113          	add	sp,sp,16
    79a8:	00008067          	ret
    79ac:	7fff9797          	auipc	a5,0x7fff9
    79b0:	d6c7a783          	lw	a5,-660(a5) # 80000718 <errno>
    79b4:	fe0784e3          	beqz	a5,799c <_lseek_r+0x34>
    79b8:	00c12083          	lw	ra,12(sp)
    79bc:	00f42023          	sw	a5,0(s0)
    79c0:	00812403          	lw	s0,8(sp)
    79c4:	01010113          	add	sp,sp,16
    79c8:	00008067          	ret

000079cc <_read_r>:
    79cc:	ff010113          	add	sp,sp,-16
    79d0:	00058713          	mv	a4,a1
    79d4:	00812423          	sw	s0,8(sp)
    79d8:	00060593          	mv	a1,a2
    79dc:	00050413          	mv	s0,a0
    79e0:	00068613          	mv	a2,a3
    79e4:	00070513          	mv	a0,a4
    79e8:	7fff9797          	auipc	a5,0x7fff9
    79ec:	d207a823          	sw	zero,-720(a5) # 80000718 <errno>
    79f0:	00112623          	sw	ra,12(sp)
    79f4:	fd9f80ef          	jal	9cc <_read>
    79f8:	fff00793          	li	a5,-1
    79fc:	00f50a63          	beq	a0,a5,7a10 <_read_r+0x44>
    7a00:	00c12083          	lw	ra,12(sp)
    7a04:	00812403          	lw	s0,8(sp)
    7a08:	01010113          	add	sp,sp,16
    7a0c:	00008067          	ret
    7a10:	7fff9797          	auipc	a5,0x7fff9
    7a14:	d087a783          	lw	a5,-760(a5) # 80000718 <errno>
    7a18:	fe0784e3          	beqz	a5,7a00 <_read_r+0x34>
    7a1c:	00c12083          	lw	ra,12(sp)
    7a20:	00f42023          	sw	a5,0(s0)
    7a24:	00812403          	lw	s0,8(sp)
    7a28:	01010113          	add	sp,sp,16
    7a2c:	00008067          	ret

00007a30 <_sbrk_r>:
    7a30:	ff010113          	add	sp,sp,-16
    7a34:	00812423          	sw	s0,8(sp)
    7a38:	00050413          	mv	s0,a0
    7a3c:	00058513          	mv	a0,a1
    7a40:	7fff9797          	auipc	a5,0x7fff9
    7a44:	cc07ac23          	sw	zero,-808(a5) # 80000718 <errno>
    7a48:	00112623          	sw	ra,12(sp)
    7a4c:	900f90ef          	jal	b4c <_sbrk>
    7a50:	fff00793          	li	a5,-1
    7a54:	00f50a63          	beq	a0,a5,7a68 <_sbrk_r+0x38>
    7a58:	00c12083          	lw	ra,12(sp)
    7a5c:	00812403          	lw	s0,8(sp)
    7a60:	01010113          	add	sp,sp,16
    7a64:	00008067          	ret
    7a68:	7fff9797          	auipc	a5,0x7fff9
    7a6c:	cb07a783          	lw	a5,-848(a5) # 80000718 <errno>
    7a70:	fe0784e3          	beqz	a5,7a58 <_sbrk_r+0x28>
    7a74:	00c12083          	lw	ra,12(sp)
    7a78:	00f42023          	sw	a5,0(s0)
    7a7c:	00812403          	lw	s0,8(sp)
    7a80:	01010113          	add	sp,sp,16
    7a84:	00008067          	ret

00007a88 <_write_r>:
    7a88:	ff010113          	add	sp,sp,-16
    7a8c:	00058713          	mv	a4,a1
    7a90:	00812423          	sw	s0,8(sp)
    7a94:	00060593          	mv	a1,a2
    7a98:	00050413          	mv	s0,a0
    7a9c:	00068613          	mv	a2,a3
    7aa0:	00070513          	mv	a0,a4
    7aa4:	7fff9797          	auipc	a5,0x7fff9
    7aa8:	c607aa23          	sw	zero,-908(a5) # 80000718 <errno>
    7aac:	00112623          	sw	ra,12(sp)
    7ab0:	ff9f80ef          	jal	aa8 <_write>
    7ab4:	fff00793          	li	a5,-1
    7ab8:	00f50a63          	beq	a0,a5,7acc <_write_r+0x44>
    7abc:	00c12083          	lw	ra,12(sp)
    7ac0:	00812403          	lw	s0,8(sp)
    7ac4:	01010113          	add	sp,sp,16
    7ac8:	00008067          	ret
    7acc:	7fff9797          	auipc	a5,0x7fff9
    7ad0:	c4c7a783          	lw	a5,-948(a5) # 80000718 <errno>
    7ad4:	fe0784e3          	beqz	a5,7abc <_write_r+0x34>
    7ad8:	00c12083          	lw	ra,12(sp)
    7adc:	00f42023          	sw	a5,0(s0)
    7ae0:	00812403          	lw	s0,8(sp)
    7ae4:	01010113          	add	sp,sp,16
    7ae8:	00008067          	ret

00007aec <memmove>:
    7aec:	02a5f663          	bgeu	a1,a0,7b18 <memmove+0x2c>
    7af0:	00c58733          	add	a4,a1,a2
    7af4:	02e57263          	bgeu	a0,a4,7b18 <memmove+0x2c>
    7af8:	00c507b3          	add	a5,a0,a2
    7afc:	04060663          	beqz	a2,7b48 <memmove+0x5c>
    7b00:	fff74683          	lbu	a3,-1(a4)
    7b04:	fff78793          	add	a5,a5,-1
    7b08:	fff70713          	add	a4,a4,-1
    7b0c:	00d78023          	sb	a3,0(a5)
    7b10:	fef518e3          	bne	a0,a5,7b00 <memmove+0x14>
    7b14:	00008067          	ret
    7b18:	00f00793          	li	a5,15
    7b1c:	02c7e863          	bltu	a5,a2,7b4c <memmove+0x60>
    7b20:	00050793          	mv	a5,a0
    7b24:	fff60693          	add	a3,a2,-1
    7b28:	0c060263          	beqz	a2,7bec <memmove+0x100>
    7b2c:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x2f5>
    7b30:	00d786b3          	add	a3,a5,a3
    7b34:	0005c703          	lbu	a4,0(a1)
    7b38:	00178793          	add	a5,a5,1
    7b3c:	00158593          	add	a1,a1,1
    7b40:	fee78fa3          	sb	a4,-1(a5)
    7b44:	fed798e3          	bne	a5,a3,7b34 <memmove+0x48>
    7b48:	00008067          	ret
    7b4c:	00b567b3          	or	a5,a0,a1
    7b50:	0037f793          	and	a5,a5,3
    7b54:	08079663          	bnez	a5,7be0 <memmove+0xf4>
    7b58:	ff060893          	add	a7,a2,-16
    7b5c:	ff08f893          	and	a7,a7,-16
    7b60:	01088893          	add	a7,a7,16
    7b64:	011506b3          	add	a3,a0,a7
    7b68:	00058713          	mv	a4,a1
    7b6c:	00050793          	mv	a5,a0
    7b70:	00072803          	lw	a6,0(a4)
    7b74:	01070713          	add	a4,a4,16
    7b78:	01078793          	add	a5,a5,16
    7b7c:	ff07a823          	sw	a6,-16(a5)
    7b80:	ff472803          	lw	a6,-12(a4)
    7b84:	ff07aa23          	sw	a6,-12(a5)
    7b88:	ff872803          	lw	a6,-8(a4)
    7b8c:	ff07ac23          	sw	a6,-8(a5)
    7b90:	ffc72803          	lw	a6,-4(a4)
    7b94:	ff07ae23          	sw	a6,-4(a5)
    7b98:	fcd79ce3          	bne	a5,a3,7b70 <memmove+0x84>
    7b9c:	00c67813          	and	a6,a2,12
    7ba0:	011585b3          	add	a1,a1,a7
    7ba4:	00f67713          	and	a4,a2,15
    7ba8:	04080463          	beqz	a6,7bf0 <memmove+0x104>
    7bac:	ffc70813          	add	a6,a4,-4
    7bb0:	ffc87813          	and	a6,a6,-4
    7bb4:	00480813          	add	a6,a6,4
    7bb8:	010687b3          	add	a5,a3,a6
    7bbc:	00058713          	mv	a4,a1
    7bc0:	00072883          	lw	a7,0(a4)
    7bc4:	00468693          	add	a3,a3,4
    7bc8:	00470713          	add	a4,a4,4
    7bcc:	ff16ae23          	sw	a7,-4(a3)
    7bd0:	fef698e3          	bne	a3,a5,7bc0 <memmove+0xd4>
    7bd4:	00367613          	and	a2,a2,3
    7bd8:	010585b3          	add	a1,a1,a6
    7bdc:	f49ff06f          	j	7b24 <memmove+0x38>
    7be0:	fff60693          	add	a3,a2,-1
    7be4:	00050793          	mv	a5,a0
    7be8:	f45ff06f          	j	7b2c <memmove+0x40>
    7bec:	00008067          	ret
    7bf0:	00070613          	mv	a2,a4
    7bf4:	f31ff06f          	j	7b24 <memmove+0x38>

00007bf8 <frexp>:
    7bf8:	ff010113          	add	sp,sp,-16
    7bfc:	00912223          	sw	s1,4(sp)
    7c00:	800004b7          	lui	s1,0x80000
    7c04:	00812423          	sw	s0,8(sp)
    7c08:	00112623          	sw	ra,12(sp)
    7c0c:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7c10:	00060413          	mv	s0,a2
    7c14:	00062023          	sw	zero,0(a2)
    7c18:	00b4f6b3          	and	a3,s1,a1
    7c1c:	7ff00637          	lui	a2,0x7ff00
    7c20:	00058793          	mv	a5,a1
    7c24:	00050713          	mv	a4,a0
    7c28:	04c6f063          	bgeu	a3,a2,7c68 <frexp+0x70>
    7c2c:	00a6e633          	or	a2,a3,a0
    7c30:	02060c63          	beqz	a2,7c68 <frexp+0x70>
    7c34:	0145d613          	srl	a2,a1,0x14
    7c38:	7ff67613          	and	a2,a2,2047
    7c3c:	04060463          	beqz	a2,7c84 <frexp+0x8c>
    7c40:	00000593          	li	a1,0
    7c44:	80100637          	lui	a2,0x80100
    7c48:	4146d693          	sra	a3,a3,0x14
    7c4c:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7c50:	c0268693          	add	a3,a3,-1022
    7c54:	00c7f7b3          	and	a5,a5,a2
    7c58:	00b686b3          	add	a3,a3,a1
    7c5c:	3fe00637          	lui	a2,0x3fe00
    7c60:	00c7e7b3          	or	a5,a5,a2
    7c64:	00d42023          	sw	a3,0(s0)
    7c68:	00c12083          	lw	ra,12(sp)
    7c6c:	00812403          	lw	s0,8(sp)
    7c70:	00412483          	lw	s1,4(sp)
    7c74:	00070513          	mv	a0,a4
    7c78:	00078593          	mv	a1,a5
    7c7c:	01010113          	add	sp,sp,16
    7c80:	00008067          	ret
    7c84:	7fff9797          	auipc	a5,0x7fff9
    7c88:	a3c78793          	add	a5,a5,-1476 # 800006c0 <__global_locale+0x18c>
    7c8c:	0047a683          	lw	a3,4(a5)
    7c90:	0007a603          	lw	a2,0(a5)
    7c94:	009050ef          	jal	d49c <__muldf3>
    7c98:	00058793          	mv	a5,a1
    7c9c:	00b4f6b3          	and	a3,s1,a1
    7ca0:	00050713          	mv	a4,a0
    7ca4:	fca00593          	li	a1,-54
    7ca8:	f9dff06f          	j	7c44 <frexp+0x4c>

00007cac <quorem>:
    7cac:	fb010113          	add	sp,sp,-80
    7cb0:	04912223          	sw	s1,68(sp)
    7cb4:	01052783          	lw	a5,16(a0)
    7cb8:	0105a483          	lw	s1,16(a1)
    7cbc:	04112623          	sw	ra,76(sp)
    7cc0:	00b12423          	sw	a1,8(sp)
    7cc4:	2097ca63          	blt	a5,s1,7ed8 <quorem+0x22c>
    7cc8:	fff48493          	add	s1,s1,-1
    7ccc:	03512a23          	sw	s5,52(sp)
    7cd0:	03812423          	sw	s8,40(sp)
    7cd4:	00249a93          	sll	s5,s1,0x2
    7cd8:	01458c13          	add	s8,a1,20
    7cdc:	05212023          	sw	s2,64(sp)
    7ce0:	03312e23          	sw	s3,60(sp)
    7ce4:	015c0933          	add	s2,s8,s5
    7ce8:	01450993          	add	s3,a0,20
    7cec:	015987b3          	add	a5,s3,s5
    7cf0:	03712623          	sw	s7,44(sp)
    7cf4:	00092b83          	lw	s7,0(s2)
    7cf8:	03912223          	sw	s9,36(sp)
    7cfc:	0007ac83          	lw	s9,0(a5)
    7d00:	001b8b93          	add	s7,s7,1
    7d04:	03412c23          	sw	s4,56(sp)
    7d08:	000b8593          	mv	a1,s7
    7d0c:	00050a13          	mv	s4,a0
    7d10:	000c8513          	mv	a0,s9
    7d14:	04812423          	sw	s0,72(sp)
    7d18:	00f12623          	sw	a5,12(sp)
    7d1c:	70d060ef          	jal	ec28 <__hidden___udivsi3>
    7d20:	00050413          	mv	s0,a0
    7d24:	0d7cee63          	bltu	s9,s7,7e00 <quorem+0x154>
    7d28:	03a12023          	sw	s10,32(sp)
    7d2c:	00010d37          	lui	s10,0x10
    7d30:	01b12e23          	sw	s11,28(sp)
    7d34:	03612823          	sw	s6,48(sp)
    7d38:	000c0a93          	mv	s5,s8
    7d3c:	00098d93          	mv	s11,s3
    7d40:	00000c93          	li	s9,0
    7d44:	00000b93          	li	s7,0
    7d48:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    7d4c:	000aab03          	lw	s6,0(s5)
    7d50:	00040593          	mv	a1,s0
    7d54:	004d8d93          	add	s11,s11,4
    7d58:	01ab7533          	and	a0,s6,s10
    7d5c:	609060ef          	jal	eb64 <__mulsi3>
    7d60:	00050793          	mv	a5,a0
    7d64:	00040593          	mv	a1,s0
    7d68:	010b5513          	srl	a0,s6,0x10
    7d6c:	01978cb3          	add	s9,a5,s9
    7d70:	5f5060ef          	jal	eb64 <__mulsi3>
    7d74:	ffcda603          	lw	a2,-4(s11)
    7d78:	01acf733          	and	a4,s9,s10
    7d7c:	010cdc93          	srl	s9,s9,0x10
    7d80:	01a677b3          	and	a5,a2,s10
    7d84:	40e787b3          	sub	a5,a5,a4
    7d88:	017787b3          	add	a5,a5,s7
    7d8c:	01950533          	add	a0,a0,s9
    7d90:	4107d713          	sra	a4,a5,0x10
    7d94:	01a575b3          	and	a1,a0,s10
    7d98:	01065613          	srl	a2,a2,0x10
    7d9c:	40b70733          	sub	a4,a4,a1
    7da0:	00c70733          	add	a4,a4,a2
    7da4:	01a7f7b3          	and	a5,a5,s10
    7da8:	01071613          	sll	a2,a4,0x10
    7dac:	00c7e7b3          	or	a5,a5,a2
    7db0:	004a8a93          	add	s5,s5,4
    7db4:	fefdae23          	sw	a5,-4(s11)
    7db8:	01055c93          	srl	s9,a0,0x10
    7dbc:	41075b93          	sra	s7,a4,0x10
    7dc0:	f95976e3          	bgeu	s2,s5,7d4c <quorem+0xa0>
    7dc4:	00c12703          	lw	a4,12(sp)
    7dc8:	00072783          	lw	a5,0(a4)
    7dcc:	12079063          	bnez	a5,7eec <quorem+0x240>
    7dd0:	ffc70a93          	add	s5,a4,-4
    7dd4:	0159e863          	bltu	s3,s5,7de4 <quorem+0x138>
    7dd8:	0180006f          	j	7df0 <quorem+0x144>
    7ddc:	fff48493          	add	s1,s1,-1
    7de0:	0159f863          	bgeu	s3,s5,7df0 <quorem+0x144>
    7de4:	000aa783          	lw	a5,0(s5)
    7de8:	ffca8a93          	add	s5,s5,-4
    7dec:	fe0788e3          	beqz	a5,7ddc <quorem+0x130>
    7df0:	03012b03          	lw	s6,48(sp)
    7df4:	02012d03          	lw	s10,32(sp)
    7df8:	01c12d83          	lw	s11,28(sp)
    7dfc:	009a2823          	sw	s1,16(s4)
    7e00:	00812583          	lw	a1,8(sp)
    7e04:	000a0513          	mv	a0,s4
    7e08:	1fc020ef          	jal	a004 <__mcmp>
    7e0c:	08054c63          	bltz	a0,7ea4 <quorem+0x1f8>
    7e10:	00010537          	lui	a0,0x10
    7e14:	00098593          	mv	a1,s3
    7e18:	00000713          	li	a4,0
    7e1c:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    7e20:	0005a683          	lw	a3,0(a1)
    7e24:	000c2603          	lw	a2,0(s8)
    7e28:	00458593          	add	a1,a1,4
    7e2c:	00a6f7b3          	and	a5,a3,a0
    7e30:	00a67833          	and	a6,a2,a0
    7e34:	410787b3          	sub	a5,a5,a6
    7e38:	00e787b3          	add	a5,a5,a4
    7e3c:	4107d713          	sra	a4,a5,0x10
    7e40:	01065613          	srl	a2,a2,0x10
    7e44:	0106d693          	srl	a3,a3,0x10
    7e48:	40c70733          	sub	a4,a4,a2
    7e4c:	00d70733          	add	a4,a4,a3
    7e50:	01071693          	sll	a3,a4,0x10
    7e54:	00a7f7b3          	and	a5,a5,a0
    7e58:	00d7e7b3          	or	a5,a5,a3
    7e5c:	004c0c13          	add	s8,s8,4
    7e60:	fef5ae23          	sw	a5,-4(a1)
    7e64:	41075713          	sra	a4,a4,0x10
    7e68:	fb897ce3          	bgeu	s2,s8,7e20 <quorem+0x174>
    7e6c:	00249793          	sll	a5,s1,0x2
    7e70:	00f987b3          	add	a5,s3,a5
    7e74:	0007a703          	lw	a4,0(a5)
    7e78:	02071463          	bnez	a4,7ea0 <quorem+0x1f4>
    7e7c:	ffc78793          	add	a5,a5,-4
    7e80:	00f9e863          	bltu	s3,a5,7e90 <quorem+0x1e4>
    7e84:	0180006f          	j	7e9c <quorem+0x1f0>
    7e88:	fff48493          	add	s1,s1,-1
    7e8c:	00f9f863          	bgeu	s3,a5,7e9c <quorem+0x1f0>
    7e90:	0007a703          	lw	a4,0(a5)
    7e94:	ffc78793          	add	a5,a5,-4
    7e98:	fe0708e3          	beqz	a4,7e88 <quorem+0x1dc>
    7e9c:	009a2823          	sw	s1,16(s4)
    7ea0:	00140413          	add	s0,s0,1
    7ea4:	04c12083          	lw	ra,76(sp)
    7ea8:	00040513          	mv	a0,s0
    7eac:	04812403          	lw	s0,72(sp)
    7eb0:	04012903          	lw	s2,64(sp)
    7eb4:	03c12983          	lw	s3,60(sp)
    7eb8:	03812a03          	lw	s4,56(sp)
    7ebc:	03412a83          	lw	s5,52(sp)
    7ec0:	02c12b83          	lw	s7,44(sp)
    7ec4:	02812c03          	lw	s8,40(sp)
    7ec8:	02412c83          	lw	s9,36(sp)
    7ecc:	04412483          	lw	s1,68(sp)
    7ed0:	05010113          	add	sp,sp,80
    7ed4:	00008067          	ret
    7ed8:	04c12083          	lw	ra,76(sp)
    7edc:	04412483          	lw	s1,68(sp)
    7ee0:	00000513          	li	a0,0
    7ee4:	05010113          	add	sp,sp,80
    7ee8:	00008067          	ret
    7eec:	00812583          	lw	a1,8(sp)
    7ef0:	000a0513          	mv	a0,s4
    7ef4:	03012b03          	lw	s6,48(sp)
    7ef8:	02012d03          	lw	s10,32(sp)
    7efc:	01c12d83          	lw	s11,28(sp)
    7f00:	104020ef          	jal	a004 <__mcmp>
    7f04:	f00556e3          	bgez	a0,7e10 <quorem+0x164>
    7f08:	f9dff06f          	j	7ea4 <quorem+0x1f8>

00007f0c <_dtoa_r>:
    7f0c:	03852303          	lw	t1,56(a0)
    7f10:	f5010113          	add	sp,sp,-176
    7f14:	0a812423          	sw	s0,168(sp)
    7f18:	0a912223          	sw	s1,164(sp)
    7f1c:	0b212023          	sw	s2,160(sp)
    7f20:	09412c23          	sw	s4,152(sp)
    7f24:	07b12e23          	sw	s11,124(sp)
    7f28:	0a112623          	sw	ra,172(sp)
    7f2c:	09312e23          	sw	s3,156(sp)
    7f30:	09512a23          	sw	s5,148(sp)
    7f34:	00e12a23          	sw	a4,20(sp)
    7f38:	00f12623          	sw	a5,12(sp)
    7f3c:	01112423          	sw	a7,8(sp)
    7f40:	02b12223          	sw	a1,36(sp)
    7f44:	00c12023          	sw	a2,0(sp)
    7f48:	00050413          	mv	s0,a0
    7f4c:	00058d93          	mv	s11,a1
    7f50:	00060493          	mv	s1,a2
    7f54:	00068a13          	mv	s4,a3
    7f58:	00080913          	mv	s2,a6
    7f5c:	02030263          	beqz	t1,7f80 <_dtoa_r+0x74>
    7f60:	03c52703          	lw	a4,60(a0)
    7f64:	00100793          	li	a5,1
    7f68:	00030593          	mv	a1,t1
    7f6c:	00e797b3          	sll	a5,a5,a4
    7f70:	00e32223          	sw	a4,4(t1)
    7f74:	00f32423          	sw	a5,8(t1)
    7f78:	734010ef          	jal	96ac <_Bfree>
    7f7c:	02042c23          	sw	zero,56(s0)
    7f80:	00048993          	mv	s3,s1
    7f84:	00000693          	li	a3,0
    7f88:	0004dc63          	bgez	s1,7fa0 <_dtoa_r+0x94>
    7f8c:	00149493          	sll	s1,s1,0x1
    7f90:	0014d793          	srl	a5,s1,0x1
    7f94:	00f12023          	sw	a5,0(sp)
    7f98:	00078993          	mv	s3,a5
    7f9c:	00100693          	li	a3,1
    7fa0:	7ff00737          	lui	a4,0x7ff00
    7fa4:	00d92023          	sw	a3,0(s2)
    7fa8:	00e9f6b3          	and	a3,s3,a4
    7fac:	64e68463          	beq	a3,a4,85f4 <_dtoa_r+0x6e8>
    7fb0:	00012483          	lw	s1,0(sp)
    7fb4:	000d8513          	mv	a0,s11
    7fb8:	00000613          	li	a2,0
    7fbc:	00048593          	mv	a1,s1
    7fc0:	00000693          	li	a3,0
    7fc4:	01b12c23          	sw	s11,24(sp)
    7fc8:	00912e23          	sw	s1,28(sp)
    7fcc:	23c050ef          	jal	d208 <__eqdf2>
    7fd0:	04051c63          	bnez	a0,8028 <_dtoa_r+0x11c>
    7fd4:	00c12703          	lw	a4,12(sp)
    7fd8:	00100793          	li	a5,1
    7fdc:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7fe0:	00812703          	lw	a4,8(sp)
    7fe4:	00070863          	beqz	a4,7ff4 <_dtoa_r+0xe8>
    7fe8:	00007797          	auipc	a5,0x7
    7fec:	f4978793          	add	a5,a5,-183 # ef31 <__fini_array_end+0x1d5>
    7ff0:	00f72023          	sw	a5,0(a4)
    7ff4:	00007a97          	auipc	s5,0x7
    7ff8:	f3ca8a93          	add	s5,s5,-196 # ef30 <__fini_array_end+0x1d4>
    7ffc:	0ac12083          	lw	ra,172(sp)
    8000:	0a812403          	lw	s0,168(sp)
    8004:	0a412483          	lw	s1,164(sp)
    8008:	0a012903          	lw	s2,160(sp)
    800c:	09c12983          	lw	s3,156(sp)
    8010:	09812a03          	lw	s4,152(sp)
    8014:	07c12d83          	lw	s11,124(sp)
    8018:	000a8513          	mv	a0,s5
    801c:	09412a83          	lw	s5,148(sp)
    8020:	0b010113          	add	sp,sp,176
    8024:	00008067          	ret
    8028:	00048613          	mv	a2,s1
    802c:	06810713          	add	a4,sp,104
    8030:	06c10693          	add	a3,sp,108
    8034:	000d8593          	mv	a1,s11
    8038:	00040513          	mv	a0,s0
    803c:	09612823          	sw	s6,144(sp)
    8040:	09712623          	sw	s7,140(sp)
    8044:	09812423          	sw	s8,136(sp)
    8048:	09912223          	sw	s9,132(sp)
    804c:	09a12023          	sw	s10,128(sp)
    8050:	0149d913          	srl	s2,s3,0x14
    8054:	268020ef          	jal	a2bc <__d2b>
    8058:	00050493          	mv	s1,a0
    805c:	5c091e63          	bnez	s2,8638 <_dtoa_r+0x72c>
    8060:	06812a83          	lw	s5,104(sp)
    8064:	06c12903          	lw	s2,108(sp)
    8068:	02000793          	li	a5,32
    806c:	012a8933          	add	s2,s5,s2
    8070:	43290713          	add	a4,s2,1074
    8074:	36e7dae3          	bge	a5,a4,8be8 <_dtoa_r+0xcdc>
    8078:	04000793          	li	a5,64
    807c:	40e787b3          	sub	a5,a5,a4
    8080:	41290513          	add	a0,s2,1042
    8084:	00f997b3          	sll	a5,s3,a5
    8088:	00add533          	srl	a0,s11,a0
    808c:	00a7e533          	or	a0,a5,a0
    8090:	634060ef          	jal	e6c4 <__floatunsidf>
    8094:	fe1007b7          	lui	a5,0xfe100
    8098:	00100693          	li	a3,1
    809c:	00050713          	mv	a4,a0
    80a0:	00b787b3          	add	a5,a5,a1
    80a4:	fff90913          	add	s2,s2,-1
    80a8:	02d12c23          	sw	a3,56(sp)
    80ac:	7fff8697          	auipc	a3,0x7fff8
    80b0:	61c68693          	add	a3,a3,1564 # 800006c8 <__global_locale+0x194>
    80b4:	0006a603          	lw	a2,0(a3)
    80b8:	0046a683          	lw	a3,4(a3)
    80bc:	00070513          	mv	a0,a4
    80c0:	00078593          	mv	a1,a5
    80c4:	369050ef          	jal	dc2c <__subdf3>
    80c8:	7fff8797          	auipc	a5,0x7fff8
    80cc:	60878793          	add	a5,a5,1544 # 800006d0 <__global_locale+0x19c>
    80d0:	0007a603          	lw	a2,0(a5)
    80d4:	0047a683          	lw	a3,4(a5)
    80d8:	3c4050ef          	jal	d49c <__muldf3>
    80dc:	7fff8797          	auipc	a5,0x7fff8
    80e0:	5fc78793          	add	a5,a5,1532 # 800006d8 <__global_locale+0x1a4>
    80e4:	0007a603          	lw	a2,0(a5)
    80e8:	0047a683          	lw	a3,4(a5)
    80ec:	7a9030ef          	jal	c094 <__adddf3>
    80f0:	00050b13          	mv	s6,a0
    80f4:	00090513          	mv	a0,s2
    80f8:	00058993          	mv	s3,a1
    80fc:	510060ef          	jal	e60c <__floatsidf>
    8100:	7fff8797          	auipc	a5,0x7fff8
    8104:	5e078793          	add	a5,a5,1504 # 800006e0 <__global_locale+0x1ac>
    8108:	0007a603          	lw	a2,0(a5)
    810c:	0047a683          	lw	a3,4(a5)
    8110:	38c050ef          	jal	d49c <__muldf3>
    8114:	00050613          	mv	a2,a0
    8118:	00058693          	mv	a3,a1
    811c:	000b0513          	mv	a0,s6
    8120:	00098593          	mv	a1,s3
    8124:	771030ef          	jal	c094 <__adddf3>
    8128:	00050b93          	mv	s7,a0
    812c:	00058b13          	mv	s6,a1
    8130:	458060ef          	jal	e588 <__fixdfsi>
    8134:	00050993          	mv	s3,a0
    8138:	000b0593          	mv	a1,s6
    813c:	000b8513          	mv	a0,s7
    8140:	00000613          	li	a2,0
    8144:	00000693          	li	a3,0
    8148:	24c050ef          	jal	d394 <__ledf2>
    814c:	02055063          	bgez	a0,816c <_dtoa_r+0x260>
    8150:	00098513          	mv	a0,s3
    8154:	4b8060ef          	jal	e60c <__floatsidf>
    8158:	000b8613          	mv	a2,s7
    815c:	000b0693          	mv	a3,s6
    8160:	0a8050ef          	jal	d208 <__eqdf2>
    8164:	00a03533          	snez	a0,a0
    8168:	40a989b3          	sub	s3,s3,a0
    816c:	412a8ab3          	sub	s5,s5,s2
    8170:	01600793          	li	a5,22
    8174:	fffa8b13          	add	s6,s5,-1
    8178:	2137e2e3          	bltu	a5,s3,8b7c <_dtoa_r+0xc70>
    817c:	00399713          	sll	a4,s3,0x3
    8180:	00007797          	auipc	a5,0x7
    8184:	44878793          	add	a5,a5,1096 # f5c8 <__mprec_tens>
    8188:	00e787b3          	add	a5,a5,a4
    818c:	0007a603          	lw	a2,0(a5)
    8190:	0047a683          	lw	a3,4(a5)
    8194:	01812503          	lw	a0,24(sp)
    8198:	01c12583          	lw	a1,28(sp)
    819c:	1f8050ef          	jal	d394 <__ledf2>
    81a0:	220554e3          	bgez	a0,8bc8 <_dtoa_r+0xcbc>
    81a4:	fff98993          	add	s3,s3,-1
    81a8:	02012a23          	sw	zero,52(sp)
    81ac:	00012823          	sw	zero,16(sp)
    81b0:	4a0b4863          	bltz	s6,8660 <_dtoa_r+0x754>
    81b4:	4c09d063          	bgez	s3,8674 <_dtoa_r+0x768>
    81b8:	01012783          	lw	a5,16(sp)
    81bc:	03312023          	sw	s3,32(sp)
    81c0:	413787b3          	sub	a5,a5,s3
    81c4:	00f12823          	sw	a5,16(sp)
    81c8:	413007b3          	neg	a5,s3
    81cc:	02f12823          	sw	a5,48(sp)
    81d0:	00900793          	li	a5,9
    81d4:	00000993          	li	s3,0
    81d8:	4b47e863          	bltu	a5,s4,8688 <_dtoa_r+0x77c>
    81dc:	00500793          	li	a5,5
    81e0:	2147dae3          	bge	a5,s4,8bf4 <_dtoa_r+0xce8>
    81e4:	ffca0a13          	add	s4,s4,-4
    81e8:	00300793          	li	a5,3
    81ec:	00000913          	li	s2,0
    81f0:	66fa02e3          	beq	s4,a5,9054 <_dtoa_r+0x1148>
    81f4:	6147dae3          	bge	a5,s4,9008 <_dtoa_r+0x10fc>
    81f8:	00400793          	li	a5,4
    81fc:	54fa1ae3          	bne	s4,a5,8f50 <_dtoa_r+0x1044>
    8200:	00100793          	li	a5,1
    8204:	02f12423          	sw	a5,40(sp)
    8208:	01412603          	lw	a2,20(sp)
    820c:	62c05ce3          	blez	a2,9044 <_dtoa_r+0x1138>
    8210:	02c12e23          	sw	a2,60(sp)
    8214:	00060c13          	mv	s8,a2
    8218:	01700693          	li	a3,23
    821c:	00100713          	li	a4,1
    8220:	00400793          	li	a5,4
    8224:	00c6c463          	blt	a3,a2,822c <_dtoa_r+0x320>
    8228:	3540106f          	j	957c <_dtoa_r+0x1670>
    822c:	00179793          	sll	a5,a5,0x1
    8230:	01478693          	add	a3,a5,20
    8234:	00070593          	mv	a1,a4
    8238:	00170713          	add	a4,a4,1
    823c:	fed678e3          	bgeu	a2,a3,822c <_dtoa_r+0x320>
    8240:	02b42e23          	sw	a1,60(s0)
    8244:	00040513          	mv	a0,s0
    8248:	3b0010ef          	jal	95f8 <_Balloc>
    824c:	00050a93          	mv	s5,a0
    8250:	00051463          	bnez	a0,8258 <_dtoa_r+0x34c>
    8254:	30c0106f          	j	9560 <_dtoa_r+0x1654>
    8258:	02a42c23          	sw	a0,56(s0)
    825c:	00e00793          	li	a5,14
    8260:	5187ea63          	bltu	a5,s8,8774 <_dtoa_r+0x868>
    8264:	50090863          	beqz	s2,8774 <_dtoa_r+0x868>
    8268:	02012783          	lw	a5,32(sp)
    826c:	62f054e3          	blez	a5,9094 <_dtoa_r+0x1188>
    8270:	00f7f713          	and	a4,a5,15
    8274:	00371713          	sll	a4,a4,0x3
    8278:	4047dc93          	sra	s9,a5,0x4
    827c:	00007797          	auipc	a5,0x7
    8280:	34c78793          	add	a5,a5,844 # f5c8 <__mprec_tens>
    8284:	00e787b3          	add	a5,a5,a4
    8288:	010cf693          	and	a3,s9,16
    828c:	0007a803          	lw	a6,0(a5)
    8290:	0047a703          	lw	a4,4(a5)
    8294:	560682e3          	beqz	a3,8ff8 <_dtoa_r+0x10ec>
    8298:	00007797          	auipc	a5,0x7
    829c:	30878793          	add	a5,a5,776 # f5a0 <__mprec_bigtens>
    82a0:	0207a603          	lw	a2,32(a5)
    82a4:	0247a683          	lw	a3,36(a5)
    82a8:	01812503          	lw	a0,24(sp)
    82ac:	01c12583          	lw	a1,28(sp)
    82b0:	04e12423          	sw	a4,72(sp)
    82b4:	05012023          	sw	a6,64(sp)
    82b8:	6a4040ef          	jal	c95c <__divdf3>
    82bc:	04012803          	lw	a6,64(sp)
    82c0:	04812703          	lw	a4,72(sp)
    82c4:	00fcfc93          	and	s9,s9,15
    82c8:	00050313          	mv	t1,a0
    82cc:	00058d13          	mv	s10,a1
    82d0:	00300913          	li	s2,3
    82d4:	040c8c63          	beqz	s9,832c <_dtoa_r+0x420>
    82d8:	04812023          	sw	s0,64(sp)
    82dc:	00007b97          	auipc	s7,0x7
    82e0:	2c4b8b93          	add	s7,s7,708 # f5a0 <__mprec_bigtens>
    82e4:	00090413          	mv	s0,s2
    82e8:	00070593          	mv	a1,a4
    82ec:	00030913          	mv	s2,t1
    82f0:	001cf793          	and	a5,s9,1
    82f4:	00078e63          	beqz	a5,8310 <_dtoa_r+0x404>
    82f8:	000ba603          	lw	a2,0(s7)
    82fc:	004ba683          	lw	a3,4(s7)
    8300:	00080513          	mv	a0,a6
    8304:	00140413          	add	s0,s0,1
    8308:	194050ef          	jal	d49c <__muldf3>
    830c:	00050813          	mv	a6,a0
    8310:	401cdc93          	sra	s9,s9,0x1
    8314:	008b8b93          	add	s7,s7,8
    8318:	fc0c9ce3          	bnez	s9,82f0 <_dtoa_r+0x3e4>
    831c:	00090313          	mv	t1,s2
    8320:	00040913          	mv	s2,s0
    8324:	04012403          	lw	s0,64(sp)
    8328:	00058713          	mv	a4,a1
    832c:	00070693          	mv	a3,a4
    8330:	00080613          	mv	a2,a6
    8334:	00030513          	mv	a0,t1
    8338:	000d0593          	mv	a1,s10
    833c:	620040ef          	jal	c95c <__divdf3>
    8340:	00050713          	mv	a4,a0
    8344:	00058793          	mv	a5,a1
    8348:	03412683          	lw	a3,52(sp)
    834c:	02068c63          	beqz	a3,8384 <_dtoa_r+0x478>
    8350:	7fff8697          	auipc	a3,0x7fff8
    8354:	39868693          	add	a3,a3,920 # 800006e8 <__global_locale+0x1b4>
    8358:	0006a603          	lw	a2,0(a3)
    835c:	0046a683          	lw	a3,4(a3)
    8360:	00070513          	mv	a0,a4
    8364:	00078593          	mv	a1,a5
    8368:	04e12423          	sw	a4,72(sp)
    836c:	04f12023          	sw	a5,64(sp)
    8370:	024050ef          	jal	d394 <__ledf2>
    8374:	04012783          	lw	a5,64(sp)
    8378:	04812703          	lw	a4,72(sp)
    837c:	00055463          	bgez	a0,8384 <_dtoa_r+0x478>
    8380:	04c0106f          	j	93cc <_dtoa_r+0x14c0>
    8384:	00090513          	mv	a0,s2
    8388:	04f12623          	sw	a5,76(sp)
    838c:	04e12023          	sw	a4,64(sp)
    8390:	27c060ef          	jal	e60c <__floatsidf>
    8394:	04012703          	lw	a4,64(sp)
    8398:	04c12783          	lw	a5,76(sp)
    839c:	00070613          	mv	a2,a4
    83a0:	00078693          	mv	a3,a5
    83a4:	04e12423          	sw	a4,72(sp)
    83a8:	04f12023          	sw	a5,64(sp)
    83ac:	0f0050ef          	jal	d49c <__muldf3>
    83b0:	7fff8697          	auipc	a3,0x7fff8
    83b4:	34868693          	add	a3,a3,840 # 800006f8 <__global_locale+0x1c4>
    83b8:	0006a603          	lw	a2,0(a3)
    83bc:	0046a683          	lw	a3,4(a3)
    83c0:	4d5030ef          	jal	c094 <__adddf3>
    83c4:	fcc006b7          	lui	a3,0xfcc00
    83c8:	04012783          	lw	a5,64(sp)
    83cc:	04812703          	lw	a4,72(sp)
    83d0:	00050c93          	mv	s9,a0
    83d4:	00b68bb3          	add	s7,a3,a1
    83d8:	340c0463          	beqz	s8,8720 <_dtoa_r+0x814>
    83dc:	02012683          	lw	a3,32(sp)
    83e0:	05812423          	sw	s8,72(sp)
    83e4:	04d12e23          	sw	a3,92(sp)
    83e8:	00070513          	mv	a0,a4
    83ec:	00078593          	mv	a1,a5
    83f0:	04e12623          	sw	a4,76(sp)
    83f4:	04f12023          	sw	a5,64(sp)
    83f8:	190060ef          	jal	e588 <__fixdfsi>
    83fc:	04812783          	lw	a5,72(sp)
    8400:	00050913          	mv	s2,a0
    8404:	05912c23          	sw	s9,88(sp)
    8408:	fff78693          	add	a3,a5,-1
    840c:	00369693          	sll	a3,a3,0x3
    8410:	00007797          	auipc	a5,0x7
    8414:	1b878793          	add	a5,a5,440 # f5c8 <__mprec_tens>
    8418:	00d786b3          	add	a3,a5,a3
    841c:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8420:	0046a803          	lw	a6,4(a3)
    8424:	001a8d13          	add	s10,s5,1
    8428:	04f12823          	sw	a5,80(sp)
    842c:	05012a23          	sw	a6,84(sp)
    8430:	1dc060ef          	jal	e60c <__floatsidf>
    8434:	04c12703          	lw	a4,76(sp)
    8438:	04012783          	lw	a5,64(sp)
    843c:	00050613          	mv	a2,a0
    8440:	00058693          	mv	a3,a1
    8444:	00070513          	mv	a0,a4
    8448:	00078593          	mv	a1,a5
    844c:	7e0050ef          	jal	dc2c <__subdf3>
    8450:	02812703          	lw	a4,40(sp)
    8454:	03090313          	add	t1,s2,48
    8458:	05a12023          	sw	s10,64(sp)
    845c:	00050c93          	mv	s9,a0
    8460:	0ff37313          	zext.b	t1,t1
    8464:	5c0706e3          	beqz	a4,9230 <_dtoa_r+0x1324>
    8468:	7fff8797          	auipc	a5,0x7fff8
    846c:	25078793          	add	a5,a5,592 # 800006b8 <__global_locale+0x184>
    8470:	0007a503          	lw	a0,0(a5)
    8474:	05012603          	lw	a2,80(sp)
    8478:	05412683          	lw	a3,84(sp)
    847c:	04b12023          	sw	a1,64(sp)
    8480:	0047a583          	lw	a1,4(a5)
    8484:	04612623          	sw	t1,76(sp)
    8488:	4d4040ef          	jal	c95c <__divdf3>
    848c:	05812603          	lw	a2,88(sp)
    8490:	000b8693          	mv	a3,s7
    8494:	798050ef          	jal	dc2c <__subdf3>
    8498:	04012883          	lw	a7,64(sp)
    849c:	04c12303          	lw	t1,76(sp)
    84a0:	000c8613          	mv	a2,s9
    84a4:	00088693          	mv	a3,a7
    84a8:	006a8023          	sb	t1,0(s5)
    84ac:	00050913          	mv	s2,a0
    84b0:	00058b93          	mv	s7,a1
    84b4:	5e1040ef          	jal	d294 <__gedf2>
    84b8:	04012883          	lw	a7,64(sp)
    84bc:	00a05463          	blez	a0,84c4 <_dtoa_r+0x5b8>
    84c0:	7c90006f          	j	9488 <_dtoa_r+0x157c>
    84c4:	7fff8697          	auipc	a3,0x7fff8
    84c8:	22468693          	add	a3,a3,548 # 800006e8 <__global_locale+0x1b4>
    84cc:	0006a783          	lw	a5,0(a3)
    84d0:	0046a803          	lw	a6,4(a3)
    84d4:	05312623          	sw	s3,76(sp)
    84d8:	04f12023          	sw	a5,64(sp)
    84dc:	00000793          	li	a5,0
    84e0:	05612823          	sw	s6,80(sp)
    84e4:	05812c23          	sw	s8,88(sp)
    84e8:	05012223          	sw	a6,68(sp)
    84ec:	04812c03          	lw	s8,72(sp)
    84f0:	00078b13          	mv	s6,a5
    84f4:	05412423          	sw	s4,72(sp)
    84f8:	00088993          	mv	s3,a7
    84fc:	0980006f          	j	8594 <_dtoa_r+0x688>
    8500:	001b0b13          	add	s6,s6,1
    8504:	018b4463          	blt	s6,s8,850c <_dtoa_r+0x600>
    8508:	7d10006f          	j	94d8 <_dtoa_r+0x15cc>
    850c:	7fff8a17          	auipc	s4,0x7fff8
    8510:	1e4a0a13          	add	s4,s4,484 # 800006f0 <__global_locale+0x1bc>
    8514:	000a2603          	lw	a2,0(s4)
    8518:	004a2683          	lw	a3,4(s4)
    851c:	00090513          	mv	a0,s2
    8520:	000b8593          	mv	a1,s7
    8524:	779040ef          	jal	d49c <__muldf3>
    8528:	000a2603          	lw	a2,0(s4)
    852c:	004a2683          	lw	a3,4(s4)
    8530:	00050913          	mv	s2,a0
    8534:	00058b93          	mv	s7,a1
    8538:	000c8513          	mv	a0,s9
    853c:	00098593          	mv	a1,s3
    8540:	75d040ef          	jal	d49c <__muldf3>
    8544:	00058c93          	mv	s9,a1
    8548:	00050a13          	mv	s4,a0
    854c:	03c060ef          	jal	e588 <__fixdfsi>
    8550:	00050993          	mv	s3,a0
    8554:	0b8060ef          	jal	e60c <__floatsidf>
    8558:	00050613          	mv	a2,a0
    855c:	00058693          	mv	a3,a1
    8560:	000a0513          	mv	a0,s4
    8564:	000c8593          	mv	a1,s9
    8568:	6c4050ef          	jal	dc2c <__subdf3>
    856c:	03098793          	add	a5,s3,48
    8570:	00090613          	mv	a2,s2
    8574:	000b8693          	mv	a3,s7
    8578:	00fd0023          	sb	a5,0(s10)
    857c:	001d0d13          	add	s10,s10,1
    8580:	00050c93          	mv	s9,a0
    8584:	00058993          	mv	s3,a1
    8588:	60d040ef          	jal	d394 <__ledf2>
    858c:	00055463          	bgez	a0,8594 <_dtoa_r+0x688>
    8590:	6f90006f          	j	9488 <_dtoa_r+0x157c>
    8594:	04012503          	lw	a0,64(sp)
    8598:	04412583          	lw	a1,68(sp)
    859c:	000c8613          	mv	a2,s9
    85a0:	00098693          	mv	a3,s3
    85a4:	688050ef          	jal	dc2c <__subdf3>
    85a8:	00090613          	mv	a2,s2
    85ac:	000b8693          	mv	a3,s7
    85b0:	5e5040ef          	jal	d394 <__ledf2>
    85b4:	f40556e3          	bgez	a0,8500 <_dtoa_r+0x5f4>
    85b8:	05c12783          	lw	a5,92(sp)
    85bc:	000d0b93          	mv	s7,s10
    85c0:	00178c13          	add	s8,a5,1
    85c4:	03900613          	li	a2,57
    85c8:	0080006f          	j	85d0 <_dtoa_r+0x6c4>
    85cc:	697a88e3          	beq	s5,s7,945c <_dtoa_r+0x1550>
    85d0:	fffbc683          	lbu	a3,-1(s7)
    85d4:	000b8d13          	mv	s10,s7
    85d8:	fffb8b93          	add	s7,s7,-1
    85dc:	fec688e3          	beq	a3,a2,85cc <_dtoa_r+0x6c0>
    85e0:	00168693          	add	a3,a3,1
    85e4:	0ff6f693          	zext.b	a3,a3
    85e8:	00db8023          	sb	a3,0(s7)
    85ec:	000c0a13          	mv	s4,s8
    85f0:	4f00006f          	j	8ae0 <_dtoa_r+0xbd4>
    85f4:	00c12683          	lw	a3,12(sp)
    85f8:	00002737          	lui	a4,0x2
    85fc:	00c99793          	sll	a5,s3,0xc
    8600:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0xa03>
    8604:	00c7d793          	srl	a5,a5,0xc
    8608:	00e6a023          	sw	a4,0(a3)
    860c:	01b7e7b3          	or	a5,a5,s11
    8610:	0a078063          	beqz	a5,86b0 <_dtoa_r+0x7a4>
    8614:	00812783          	lw	a5,8(sp)
    8618:	00007a97          	auipc	s5,0x7
    861c:	970a8a93          	add	s5,s5,-1680 # ef88 <__fini_array_end+0x22c>
    8620:	9c078ee3          	beqz	a5,7ffc <_dtoa_r+0xf0>
    8624:	00007797          	auipc	a5,0x7
    8628:	96778793          	add	a5,a5,-1689 # ef8b <__fini_array_end+0x22f>
    862c:	00812703          	lw	a4,8(sp)
    8630:	00f72023          	sw	a5,0(a4)
    8634:	9c9ff06f          	j	7ffc <_dtoa_r+0xf0>
    8638:	01c12783          	lw	a5,28(sp)
    863c:	3ff006b7          	lui	a3,0x3ff00
    8640:	06812a83          	lw	s5,104(sp)
    8644:	00c79793          	sll	a5,a5,0xc
    8648:	00c7d793          	srl	a5,a5,0xc
    864c:	01812703          	lw	a4,24(sp)
    8650:	00d7e7b3          	or	a5,a5,a3
    8654:	c0190913          	add	s2,s2,-1023
    8658:	02012c23          	sw	zero,56(sp)
    865c:	a51ff06f          	j	80ac <_dtoa_r+0x1a0>
    8660:	00100793          	li	a5,1
    8664:	415787b3          	sub	a5,a5,s5
    8668:	00f12823          	sw	a5,16(sp)
    866c:	00000b13          	li	s6,0
    8670:	b409c4e3          	bltz	s3,81b8 <_dtoa_r+0x2ac>
    8674:	03312023          	sw	s3,32(sp)
    8678:	02012823          	sw	zero,48(sp)
    867c:	00900793          	li	a5,9
    8680:	013b0b33          	add	s6,s6,s3
    8684:	b547fce3          	bgeu	a5,s4,81dc <_dtoa_r+0x2d0>
    8688:	00100793          	li	a5,1
    868c:	00100913          	li	s2,1
    8690:	00000a13          	li	s4,0
    8694:	02f12423          	sw	a5,40(sp)
    8698:	fff00c13          	li	s8,-1
    869c:	00012a23          	sw	zero,20(sp)
    86a0:	02042e23          	sw	zero,60(s0)
    86a4:	03812e23          	sw	s8,60(sp)
    86a8:	00000593          	li	a1,0
    86ac:	b99ff06f          	j	8244 <_dtoa_r+0x338>
    86b0:	00812703          	lw	a4,8(sp)
    86b4:	00007a97          	auipc	s5,0x7
    86b8:	8c8a8a93          	add	s5,s5,-1848 # ef7c <__fini_array_end+0x220>
    86bc:	00007797          	auipc	a5,0x7
    86c0:	8c878793          	add	a5,a5,-1848 # ef84 <__fini_array_end+0x228>
    86c4:	f60714e3          	bnez	a4,862c <_dtoa_r+0x720>
    86c8:	935ff06f          	j	7ffc <_dtoa_r+0xf0>
    86cc:	00090513          	mv	a0,s2
    86d0:	04f12623          	sw	a5,76(sp)
    86d4:	04e12023          	sw	a4,64(sp)
    86d8:	735050ef          	jal	e60c <__floatsidf>
    86dc:	04012703          	lw	a4,64(sp)
    86e0:	04c12783          	lw	a5,76(sp)
    86e4:	00070613          	mv	a2,a4
    86e8:	00078693          	mv	a3,a5
    86ec:	04e12423          	sw	a4,72(sp)
    86f0:	04f12023          	sw	a5,64(sp)
    86f4:	5a9040ef          	jal	d49c <__muldf3>
    86f8:	7fff8697          	auipc	a3,0x7fff8
    86fc:	00068693          	mv	a3,a3
    8700:	0006a603          	lw	a2,0(a3) # 800006f8 <__global_locale+0x1c4>
    8704:	0046a683          	lw	a3,4(a3)
    8708:	18d030ef          	jal	c094 <__adddf3>
    870c:	04012783          	lw	a5,64(sp)
    8710:	04812703          	lw	a4,72(sp)
    8714:	fcc006b7          	lui	a3,0xfcc00
    8718:	00050c93          	mv	s9,a0
    871c:	00b68bb3          	add	s7,a3,a1
    8720:	7fff8697          	auipc	a3,0x7fff8
    8724:	fe068693          	add	a3,a3,-32 # 80000700 <__global_locale+0x1cc>
    8728:	0006a603          	lw	a2,0(a3)
    872c:	0046a683          	lw	a3,4(a3)
    8730:	00070513          	mv	a0,a4
    8734:	00078593          	mv	a1,a5
    8738:	4f4050ef          	jal	dc2c <__subdf3>
    873c:	000c8613          	mv	a2,s9
    8740:	000b8693          	mv	a3,s7
    8744:	00050d13          	mv	s10,a0
    8748:	00058913          	mv	s2,a1
    874c:	349040ef          	jal	d294 <__gedf2>
    8750:	50a04ce3          	bgtz	a0,9468 <_dtoa_r+0x155c>
    8754:	800007b7          	lui	a5,0x80000
    8758:	0177c7b3          	xor	a5,a5,s7
    875c:	000c8613          	mv	a2,s9
    8760:	000d0513          	mv	a0,s10
    8764:	00078693          	mv	a3,a5
    8768:	00090593          	mv	a1,s2
    876c:	429040ef          	jal	d394 <__ledf2>
    8770:	06054c63          	bltz	a0,87e8 <_dtoa_r+0x8dc>
    8774:	06c12783          	lw	a5,108(sp)
    8778:	1a07c663          	bltz	a5,8924 <_dtoa_r+0xa18>
    877c:	02012683          	lw	a3,32(sp)
    8780:	00e00713          	li	a4,14
    8784:	1ad74063          	blt	a4,a3,8924 <_dtoa_r+0xa18>
    8788:	02012783          	lw	a5,32(sp)
    878c:	00379713          	sll	a4,a5,0x3
    8790:	00007797          	auipc	a5,0x7
    8794:	e3878793          	add	a5,a5,-456 # f5c8 <__mprec_tens>
    8798:	00e787b3          	add	a5,a5,a4
    879c:	0007a903          	lw	s2,0(a5)
    87a0:	0047a983          	lw	s3,4(a5)
    87a4:	01412783          	lw	a5,20(sp)
    87a8:	0407dc63          	bgez	a5,8800 <_dtoa_r+0x8f4>
    87ac:	05804a63          	bgtz	s8,8800 <_dtoa_r+0x8f4>
    87b0:	020c1c63          	bnez	s8,87e8 <_dtoa_r+0x8dc>
    87b4:	7fff8797          	auipc	a5,0x7fff8
    87b8:	f4c78793          	add	a5,a5,-180 # 80000700 <__global_locale+0x1cc>
    87bc:	0007a603          	lw	a2,0(a5)
    87c0:	0047a683          	lw	a3,4(a5)
    87c4:	00090513          	mv	a0,s2
    87c8:	00098593          	mv	a1,s3
    87cc:	4d1040ef          	jal	d49c <__muldf3>
    87d0:	00050613          	mv	a2,a0
    87d4:	00058693          	mv	a3,a1
    87d8:	01812503          	lw	a0,24(sp)
    87dc:	01c12583          	lw	a1,28(sp)
    87e0:	3b5040ef          	jal	d394 <__ledf2>
    87e4:	48a042e3          	bgtz	a0,9468 <_dtoa_r+0x155c>
    87e8:	000a8d13          	mv	s10,s5
    87ec:	00012c23          	sw	zero,24(sp)
    87f0:	00000913          	li	s2,0
    87f4:	01412783          	lw	a5,20(sp)
    87f8:	fff7ca13          	not	s4,a5
    87fc:	6980006f          	j	8e94 <_dtoa_r+0xf88>
    8800:	001a8793          	add	a5,s5,1
    8804:	04f12023          	sw	a5,64(sp)
    8808:	01812b03          	lw	s6,24(sp)
    880c:	01c12a03          	lw	s4,28(sp)
    8810:	00090613          	mv	a2,s2
    8814:	00098693          	mv	a3,s3
    8818:	000b0513          	mv	a0,s6
    881c:	000a0593          	mv	a1,s4
    8820:	13c040ef          	jal	c95c <__divdf3>
    8824:	565050ef          	jal	e588 <__fixdfsi>
    8828:	00050d13          	mv	s10,a0
    882c:	5e1050ef          	jal	e60c <__floatsidf>
    8830:	00090613          	mv	a2,s2
    8834:	00098693          	mv	a3,s3
    8838:	465040ef          	jal	d49c <__muldf3>
    883c:	00050613          	mv	a2,a0
    8840:	00058693          	mv	a3,a1
    8844:	000b0513          	mv	a0,s6
    8848:	000a0593          	mv	a1,s4
    884c:	3e0050ef          	jal	dc2c <__subdf3>
    8850:	030d0793          	add	a5,s10,48
    8854:	00fa8023          	sb	a5,0(s5)
    8858:	00100613          	li	a2,1
    885c:	04012b83          	lw	s7,64(sp)
    8860:	00050713          	mv	a4,a0
    8864:	00058693          	mv	a3,a1
    8868:	0ccc0ee3          	beq	s8,a2,9144 <_dtoa_r+0x1238>
    886c:	7fff8617          	auipc	a2,0x7fff8
    8870:	e8460613          	add	a2,a2,-380 # 800006f0 <__global_locale+0x1bc>
    8874:	00062783          	lw	a5,0(a2)
    8878:	00462803          	lw	a6,4(a2)
    887c:	00100d93          	li	s11,1
    8880:	00f12023          	sw	a5,0(sp)
    8884:	01012223          	sw	a6,4(sp)
    8888:	0600006f          	j	88e8 <_dtoa_r+0x9dc>
    888c:	00090613          	mv	a2,s2
    8890:	00098693          	mv	a3,s3
    8894:	000b0513          	mv	a0,s6
    8898:	000a0593          	mv	a1,s4
    889c:	0c0040ef          	jal	c95c <__divdf3>
    88a0:	4e9050ef          	jal	e588 <__fixdfsi>
    88a4:	00050d13          	mv	s10,a0
    88a8:	565050ef          	jal	e60c <__floatsidf>
    88ac:	00090613          	mv	a2,s2
    88b0:	00098693          	mv	a3,s3
    88b4:	3e9040ef          	jal	d49c <__muldf3>
    88b8:	00058693          	mv	a3,a1
    88bc:	00050613          	mv	a2,a0
    88c0:	000a0593          	mv	a1,s4
    88c4:	000b0513          	mv	a0,s6
    88c8:	364050ef          	jal	dc2c <__subdf3>
    88cc:	001b8b93          	add	s7,s7,1
    88d0:	030d0793          	add	a5,s10,48
    88d4:	001d8d93          	add	s11,s11,1
    88d8:	fefb8fa3          	sb	a5,-1(s7)
    88dc:	00050713          	mv	a4,a0
    88e0:	00058693          	mv	a3,a1
    88e4:	07bc00e3          	beq	s8,s11,9144 <_dtoa_r+0x1238>
    88e8:	00012603          	lw	a2,0(sp)
    88ec:	00068593          	mv	a1,a3
    88f0:	00412683          	lw	a3,4(sp)
    88f4:	00070513          	mv	a0,a4
    88f8:	3a5040ef          	jal	d49c <__muldf3>
    88fc:	00000613          	li	a2,0
    8900:	00000693          	li	a3,0
    8904:	00050b13          	mv	s6,a0
    8908:	00058a13          	mv	s4,a1
    890c:	0fd040ef          	jal	d208 <__eqdf2>
    8910:	f6051ee3          	bnez	a0,888c <_dtoa_r+0x980>
    8914:	02012783          	lw	a5,32(sp)
    8918:	000b8d13          	mv	s10,s7
    891c:	00178a13          	add	s4,a5,1
    8920:	1c00006f          	j	8ae0 <_dtoa_r+0xbd4>
    8924:	02812703          	lw	a4,40(sp)
    8928:	26071463          	bnez	a4,8b90 <_dtoa_r+0xc84>
    892c:	03012b83          	lw	s7,48(sp)
    8930:	01012c83          	lw	s9,16(sp)
    8934:	02012423          	sw	zero,40(sp)
    8938:	00000913          	li	s2,0
    893c:	020c8263          	beqz	s9,8960 <_dtoa_r+0xa54>
    8940:	03605063          	blez	s6,8960 <_dtoa_r+0xa54>
    8944:	000c8793          	mv	a5,s9
    8948:	679b4263          	blt	s6,s9,8fac <_dtoa_r+0x10a0>
    894c:	01012703          	lw	a4,16(sp)
    8950:	40fc8cb3          	sub	s9,s9,a5
    8954:	40fb0b33          	sub	s6,s6,a5
    8958:	40f70733          	sub	a4,a4,a5
    895c:	00e12823          	sw	a4,16(sp)
    8960:	03012783          	lw	a5,48(sp)
    8964:	02078263          	beqz	a5,8988 <_dtoa_r+0xa7c>
    8968:	02812783          	lw	a5,40(sp)
    896c:	00078463          	beqz	a5,8974 <_dtoa_r+0xa68>
    8970:	060b9ae3          	bnez	s7,91e4 <_dtoa_r+0x12d8>
    8974:	03012603          	lw	a2,48(sp)
    8978:	00048593          	mv	a1,s1
    897c:	00040513          	mv	a0,s0
    8980:	3a4010ef          	jal	9d24 <__pow5mult>
    8984:	00050493          	mv	s1,a0
    8988:	00100593          	li	a1,1
    898c:	00040513          	mv	a0,s0
    8990:	01c010ef          	jal	99ac <__i2b>
    8994:	00a12c23          	sw	a0,24(sp)
    8998:	50099a63          	bnez	s3,8eac <_dtoa_r+0xfa0>
    899c:	00100793          	li	a5,1
    89a0:	5547da63          	bge	a5,s4,8ef4 <_dtoa_r+0xfe8>
    89a4:	016787b3          	add	a5,a5,s6
    89a8:	01f7f793          	and	a5,a5,31
    89ac:	1c078e63          	beqz	a5,8b88 <_dtoa_r+0xc7c>
    89b0:	02000713          	li	a4,32
    89b4:	40f70733          	sub	a4,a4,a5
    89b8:	00400693          	li	a3,4
    89bc:	58e6d263          	bge	a3,a4,8f40 <_dtoa_r+0x1034>
    89c0:	01c00713          	li	a4,28
    89c4:	40f707b3          	sub	a5,a4,a5
    89c8:	01012703          	lw	a4,16(sp)
    89cc:	00fc8cb3          	add	s9,s9,a5
    89d0:	00fb0b33          	add	s6,s6,a5
    89d4:	00f70733          	add	a4,a4,a5
    89d8:	00e12823          	sw	a4,16(sp)
    89dc:	01012783          	lw	a5,16(sp)
    89e0:	12f04e63          	bgtz	a5,8b1c <_dtoa_r+0xc10>
    89e4:	01605c63          	blez	s6,89fc <_dtoa_r+0xaf0>
    89e8:	01812583          	lw	a1,24(sp)
    89ec:	000b0613          	mv	a2,s6
    89f0:	00040513          	mv	a0,s0
    89f4:	480010ef          	jal	9e74 <__lshift>
    89f8:	00a12c23          	sw	a0,24(sp)
    89fc:	03412783          	lw	a5,52(sp)
    8a00:	12079a63          	bnez	a5,8b34 <_dtoa_r+0xc28>
    8a04:	45805263          	blez	s8,8e48 <_dtoa_r+0xf3c>
    8a08:	02812783          	lw	a5,40(sp)
    8a0c:	24079e63          	bnez	a5,8c68 <_dtoa_r+0xd5c>
    8a10:	02012783          	lw	a5,32(sp)
    8a14:	00178a13          	add	s4,a5,1
    8a18:	01812b03          	lw	s6,24(sp)
    8a1c:	00100993          	li	s3,1
    8a20:	0200006f          	j	8a40 <_dtoa_r+0xb34>
    8a24:	00048593          	mv	a1,s1
    8a28:	00000693          	li	a3,0
    8a2c:	00a00613          	li	a2,10
    8a30:	00040513          	mv	a0,s0
    8a34:	49d000ef          	jal	96d0 <__multadd>
    8a38:	00050493          	mv	s1,a0
    8a3c:	00198993          	add	s3,s3,1
    8a40:	000b0593          	mv	a1,s6
    8a44:	00048513          	mv	a0,s1
    8a48:	a64ff0ef          	jal	7cac <quorem>
    8a4c:	03050b93          	add	s7,a0,48
    8a50:	013a87b3          	add	a5,s5,s3
    8a54:	ff778fa3          	sb	s7,-1(a5)
    8a58:	fd89c6e3          	blt	s3,s8,8a24 <_dtoa_r+0xb18>
    8a5c:	00100993          	li	s3,1
    8a60:	55804263          	bgtz	s8,8fa4 <_dtoa_r+0x1098>
    8a64:	013a89b3          	add	s3,s5,s3
    8a68:	00000c13          	li	s8,0
    8a6c:	00048593          	mv	a1,s1
    8a70:	00100613          	li	a2,1
    8a74:	00040513          	mv	a0,s0
    8a78:	3fc010ef          	jal	9e74 <__lshift>
    8a7c:	01812583          	lw	a1,24(sp)
    8a80:	00050493          	mv	s1,a0
    8a84:	580010ef          	jal	a004 <__mcmp>
    8a88:	4ea05c63          	blez	a0,8f80 <_dtoa_r+0x1074>
    8a8c:	03900693          	li	a3,57
    8a90:	0080006f          	j	8a98 <_dtoa_r+0xb8c>
    8a94:	5f3a8863          	beq	s5,s3,9084 <_dtoa_r+0x1178>
    8a98:	fff9c783          	lbu	a5,-1(s3)
    8a9c:	00098d13          	mv	s10,s3
    8aa0:	fff98993          	add	s3,s3,-1
    8aa4:	fed788e3          	beq	a5,a3,8a94 <_dtoa_r+0xb88>
    8aa8:	00178793          	add	a5,a5,1
    8aac:	00f98023          	sb	a5,0(s3)
    8ab0:	01812583          	lw	a1,24(sp)
    8ab4:	00040513          	mv	a0,s0
    8ab8:	3f5000ef          	jal	96ac <_Bfree>
    8abc:	02090263          	beqz	s2,8ae0 <_dtoa_r+0xbd4>
    8ac0:	000c0a63          	beqz	s8,8ad4 <_dtoa_r+0xbc8>
    8ac4:	012c0863          	beq	s8,s2,8ad4 <_dtoa_r+0xbc8>
    8ac8:	000c0593          	mv	a1,s8
    8acc:	00040513          	mv	a0,s0
    8ad0:	3dd000ef          	jal	96ac <_Bfree>
    8ad4:	00090593          	mv	a1,s2
    8ad8:	00040513          	mv	a0,s0
    8adc:	3d1000ef          	jal	96ac <_Bfree>
    8ae0:	00048593          	mv	a1,s1
    8ae4:	00040513          	mv	a0,s0
    8ae8:	3c5000ef          	jal	96ac <_Bfree>
    8aec:	00c12783          	lw	a5,12(sp)
    8af0:	000d0023          	sb	zero,0(s10)
    8af4:	0147a023          	sw	s4,0(a5)
    8af8:	00812783          	lw	a5,8(sp)
    8afc:	00078463          	beqz	a5,8b04 <_dtoa_r+0xbf8>
    8b00:	01a7a023          	sw	s10,0(a5)
    8b04:	09012b03          	lw	s6,144(sp)
    8b08:	08c12b83          	lw	s7,140(sp)
    8b0c:	08812c03          	lw	s8,136(sp)
    8b10:	08412c83          	lw	s9,132(sp)
    8b14:	08012d03          	lw	s10,128(sp)
    8b18:	ce4ff06f          	j	7ffc <_dtoa_r+0xf0>
    8b1c:	00048593          	mv	a1,s1
    8b20:	00078613          	mv	a2,a5
    8b24:	00040513          	mv	a0,s0
    8b28:	34c010ef          	jal	9e74 <__lshift>
    8b2c:	00050493          	mv	s1,a0
    8b30:	eb5ff06f          	j	89e4 <_dtoa_r+0xad8>
    8b34:	01812583          	lw	a1,24(sp)
    8b38:	00048513          	mv	a0,s1
    8b3c:	4c8010ef          	jal	a004 <__mcmp>
    8b40:	ec0552e3          	bgez	a0,8a04 <_dtoa_r+0xaf8>
    8b44:	02012783          	lw	a5,32(sp)
    8b48:	00048593          	mv	a1,s1
    8b4c:	00000693          	li	a3,0
    8b50:	00a00613          	li	a2,10
    8b54:	00040513          	mv	a0,s0
    8b58:	fff78b13          	add	s6,a5,-1
    8b5c:	375000ef          	jal	96d0 <__multadd>
    8b60:	02812783          	lw	a5,40(sp)
    8b64:	00050493          	mv	s1,a0
    8b68:	0c079e63          	bnez	a5,8c44 <_dtoa_r+0xd38>
    8b6c:	03c12c03          	lw	s8,60(sp)
    8b70:	17805ee3          	blez	s8,94ec <_dtoa_r+0x15e0>
    8b74:	02012a03          	lw	s4,32(sp)
    8b78:	ea1ff06f          	j	8a18 <_dtoa_r+0xb0c>
    8b7c:	00100793          	li	a5,1
    8b80:	02f12a23          	sw	a5,52(sp)
    8b84:	e28ff06f          	j	81ac <_dtoa_r+0x2a0>
    8b88:	01c00793          	li	a5,28
    8b8c:	e3dff06f          	j	89c8 <_dtoa_r+0xabc>
    8b90:	00100713          	li	a4,1
    8b94:	4d475463          	bge	a4,s4,905c <_dtoa_r+0x1150>
    8b98:	03012783          	lw	a5,48(sp)
    8b9c:	fffc0b93          	add	s7,s8,-1
    8ba0:	4177ca63          	blt	a5,s7,8fb4 <_dtoa_r+0x10a8>
    8ba4:	41778bb3          	sub	s7,a5,s7
    8ba8:	01012783          	lw	a5,16(sp)
    8bac:	41878cb3          	sub	s9,a5,s8
    8bb0:	100c54e3          	bgez	s8,94b8 <_dtoa_r+0x15ac>
    8bb4:	00100593          	li	a1,1
    8bb8:	00040513          	mv	a0,s0
    8bbc:	5f1000ef          	jal	99ac <__i2b>
    8bc0:	00050913          	mv	s2,a0
    8bc4:	d79ff06f          	j	893c <_dtoa_r+0xa30>
    8bc8:	02012a23          	sw	zero,52(sp)
    8bcc:	00012823          	sw	zero,16(sp)
    8bd0:	ab5042e3          	bgtz	s5,8674 <_dtoa_r+0x768>
    8bd4:	00100793          	li	a5,1
    8bd8:	415787b3          	sub	a5,a5,s5
    8bdc:	00f12823          	sw	a5,16(sp)
    8be0:	00000b13          	li	s6,0
    8be4:	a91ff06f          	j	8674 <_dtoa_r+0x768>
    8be8:	40e787b3          	sub	a5,a5,a4
    8bec:	00fd9533          	sll	a0,s11,a5
    8bf0:	ca0ff06f          	j	8090 <_dtoa_r+0x184>
    8bf4:	00300793          	li	a5,3
    8bf8:	00100913          	li	s2,1
    8bfc:	44fa0c63          	beq	s4,a5,9054 <_dtoa_r+0x1148>
    8c00:	df47cc63          	blt	a5,s4,81f8 <_dtoa_r+0x2ec>
    8c04:	00200793          	li	a5,2
    8c08:	18fa00e3          	beq	s4,a5,9588 <_dtoa_r+0x167c>
    8c0c:	02042e23          	sw	zero,60(s0)
    8c10:	00000593          	li	a1,0
    8c14:	00040513          	mv	a0,s0
    8c18:	1e1000ef          	jal	95f8 <_Balloc>
    8c1c:	00050a93          	mv	s5,a0
    8c20:	140500e3          	beqz	a0,9560 <_dtoa_r+0x1654>
    8c24:	00100793          	li	a5,1
    8c28:	02f12423          	sw	a5,40(sp)
    8c2c:	fff00793          	li	a5,-1
    8c30:	02a42c23          	sw	a0,56(s0)
    8c34:	02f12e23          	sw	a5,60(sp)
    8c38:	fff00c13          	li	s8,-1
    8c3c:	00012a23          	sw	zero,20(sp)
    8c40:	b35ff06f          	j	8774 <_dtoa_r+0x868>
    8c44:	00090593          	mv	a1,s2
    8c48:	00000693          	li	a3,0
    8c4c:	00a00613          	li	a2,10
    8c50:	00040513          	mv	a0,s0
    8c54:	27d000ef          	jal	96d0 <__multadd>
    8c58:	03c12c03          	lw	s8,60(sp)
    8c5c:	00050913          	mv	s2,a0
    8c60:	0b805ae3          	blez	s8,9514 <_dtoa_r+0x1608>
    8c64:	03612023          	sw	s6,32(sp)
    8c68:	01905c63          	blez	s9,8c80 <_dtoa_r+0xd74>
    8c6c:	00090593          	mv	a1,s2
    8c70:	000c8613          	mv	a2,s9
    8c74:	00040513          	mv	a0,s0
    8c78:	1fc010ef          	jal	9e74 <__lshift>
    8c7c:	00050913          	mv	s2,a0
    8c80:	00090b13          	mv	s6,s2
    8c84:	50099e63          	bnez	s3,91a0 <_dtoa_r+0x1294>
    8c88:	02412783          	lw	a5,36(sp)
    8c8c:	fffa8d13          	add	s10,s5,-1
    8c90:	000a8c93          	mv	s9,s5
    8c94:	01512823          	sw	s5,16(sp)
    8c98:	01812a83          	lw	s5,24(sp)
    8c9c:	0017f793          	and	a5,a5,1
    8ca0:	018d0d33          	add	s10,s10,s8
    8ca4:	00f12023          	sw	a5,0(sp)
    8ca8:	01b12a23          	sw	s11,20(sp)
    8cac:	000a8593          	mv	a1,s5
    8cb0:	00048513          	mv	a0,s1
    8cb4:	ff9fe0ef          	jal	7cac <quorem>
    8cb8:	00050c13          	mv	s8,a0
    8cbc:	00090593          	mv	a1,s2
    8cc0:	00048513          	mv	a0,s1
    8cc4:	340010ef          	jal	a004 <__mcmp>
    8cc8:	00050993          	mv	s3,a0
    8ccc:	000b0613          	mv	a2,s6
    8cd0:	000a8593          	mv	a1,s5
    8cd4:	00040513          	mv	a0,s0
    8cd8:	384010ef          	jal	a05c <__mdiff>
    8cdc:	00c52703          	lw	a4,12(a0)
    8ce0:	030c0b93          	add	s7,s8,48
    8ce4:	00050d93          	mv	s11,a0
    8ce8:	08071c63          	bnez	a4,8d80 <_dtoa_r+0xe74>
    8cec:	00050593          	mv	a1,a0
    8cf0:	00048513          	mv	a0,s1
    8cf4:	310010ef          	jal	a004 <__mcmp>
    8cf8:	00050713          	mv	a4,a0
    8cfc:	000d8593          	mv	a1,s11
    8d00:	00040513          	mv	a0,s0
    8d04:	00070d93          	mv	s11,a4
    8d08:	1a5000ef          	jal	96ac <_Bfree>
    8d0c:	014de6b3          	or	a3,s11,s4
    8d10:	0e069a63          	bnez	a3,8e04 <_dtoa_r+0xef8>
    8d14:	00012783          	lw	a5,0(sp)
    8d18:	76078e63          	beqz	a5,9494 <_dtoa_r+0x1588>
    8d1c:	7809c663          	bltz	s3,94a8 <_dtoa_r+0x159c>
    8d20:	017c8023          	sb	s7,0(s9)
    8d24:	001c8993          	add	s3,s9,1
    8d28:	679d0e63          	beq	s10,s9,93a4 <_dtoa_r+0x1498>
    8d2c:	00048593          	mv	a1,s1
    8d30:	00000693          	li	a3,0
    8d34:	00a00613          	li	a2,10
    8d38:	00040513          	mv	a0,s0
    8d3c:	195000ef          	jal	96d0 <__multadd>
    8d40:	00050493          	mv	s1,a0
    8d44:	00000693          	li	a3,0
    8d48:	00a00613          	li	a2,10
    8d4c:	00090593          	mv	a1,s2
    8d50:	00040513          	mv	a0,s0
    8d54:	09690e63          	beq	s2,s6,8df0 <_dtoa_r+0xee4>
    8d58:	179000ef          	jal	96d0 <__multadd>
    8d5c:	000b0593          	mv	a1,s6
    8d60:	00050913          	mv	s2,a0
    8d64:	00000693          	li	a3,0
    8d68:	00a00613          	li	a2,10
    8d6c:	00040513          	mv	a0,s0
    8d70:	161000ef          	jal	96d0 <__multadd>
    8d74:	00050b13          	mv	s6,a0
    8d78:	00098c93          	mv	s9,s3
    8d7c:	f31ff06f          	j	8cac <_dtoa_r+0xda0>
    8d80:	00050593          	mv	a1,a0
    8d84:	00040513          	mv	a0,s0
    8d88:	01012a83          	lw	s5,16(sp)
    8d8c:	01412d83          	lw	s11,20(sp)
    8d90:	11d000ef          	jal	96ac <_Bfree>
    8d94:	0009ca63          	bltz	s3,8da8 <_dtoa_r+0xe9c>
    8d98:	001df713          	and	a4,s11,1
    8d9c:	0149e9b3          	or	s3,s3,s4
    8da0:	01376733          	or	a4,a4,s3
    8da4:	06071e63          	bnez	a4,8e20 <_dtoa_r+0xf14>
    8da8:	00048593          	mv	a1,s1
    8dac:	00100613          	li	a2,1
    8db0:	00040513          	mv	a0,s0
    8db4:	0c0010ef          	jal	9e74 <__lshift>
    8db8:	01812583          	lw	a1,24(sp)
    8dbc:	00050493          	mv	s1,a0
    8dc0:	244010ef          	jal	a004 <__mcmp>
    8dc4:	24a05863          	blez	a0,9014 <_dtoa_r+0x1108>
    8dc8:	03900713          	li	a4,57
    8dcc:	24eb8c63          	beq	s7,a4,9024 <_dtoa_r+0x1118>
    8dd0:	031c0b93          	add	s7,s8,49
    8dd4:	02012783          	lw	a5,32(sp)
    8dd8:	00090c13          	mv	s8,s2
    8ddc:	001c8d13          	add	s10,s9,1
    8de0:	017c8023          	sb	s7,0(s9)
    8de4:	00178a13          	add	s4,a5,1
    8de8:	000b0913          	mv	s2,s6
    8dec:	cc5ff06f          	j	8ab0 <_dtoa_r+0xba4>
    8df0:	0e1000ef          	jal	96d0 <__multadd>
    8df4:	00050913          	mv	s2,a0
    8df8:	00050b13          	mv	s6,a0
    8dfc:	00098c93          	mv	s9,s3
    8e00:	eadff06f          	j	8cac <_dtoa_r+0xda0>
    8e04:	7409c863          	bltz	s3,9554 <_dtoa_r+0x1648>
    8e08:	00012783          	lw	a5,0(sp)
    8e0c:	0149e9b3          	or	s3,s3,s4
    8e10:	0137e9b3          	or	s3,a5,s3
    8e14:	74098063          	beqz	s3,9554 <_dtoa_r+0x1648>
    8e18:	f1b054e3          	blez	s11,8d20 <_dtoa_r+0xe14>
    8e1c:	01012a83          	lw	s5,16(sp)
    8e20:	03900713          	li	a4,57
    8e24:	20eb8063          	beq	s7,a4,9024 <_dtoa_r+0x1118>
    8e28:	02012703          	lw	a4,32(sp)
    8e2c:	001b8793          	add	a5,s7,1
    8e30:	00090c13          	mv	s8,s2
    8e34:	001c8d13          	add	s10,s9,1
    8e38:	00170a13          	add	s4,a4,1
    8e3c:	00fc8023          	sb	a5,0(s9)
    8e40:	000b0913          	mv	s2,s6
    8e44:	c6dff06f          	j	8ab0 <_dtoa_r+0xba4>
    8e48:	00200793          	li	a5,2
    8e4c:	bb47dee3          	bge	a5,s4,8a08 <_dtoa_r+0xafc>
    8e50:	000a8d13          	mv	s10,s5
    8e54:	9a0c10e3          	bnez	s8,87f4 <_dtoa_r+0x8e8>
    8e58:	01812583          	lw	a1,24(sp)
    8e5c:	00000693          	li	a3,0
    8e60:	00500613          	li	a2,5
    8e64:	00040513          	mv	a0,s0
    8e68:	069000ef          	jal	96d0 <__multadd>
    8e6c:	00050593          	mv	a1,a0
    8e70:	00a12c23          	sw	a0,24(sp)
    8e74:	00048513          	mv	a0,s1
    8e78:	18c010ef          	jal	a004 <__mcmp>
    8e7c:	96a05ce3          	blez	a0,87f4 <_dtoa_r+0x8e8>
    8e80:	03100793          	li	a5,49
    8e84:	00fa8023          	sb	a5,0(s5)
    8e88:	02012783          	lw	a5,32(sp)
    8e8c:	001a8d13          	add	s10,s5,1
    8e90:	00178a13          	add	s4,a5,1
    8e94:	01812583          	lw	a1,24(sp)
    8e98:	00040513          	mv	a0,s0
    8e9c:	001a0a13          	add	s4,s4,1
    8ea0:	00d000ef          	jal	96ac <_Bfree>
    8ea4:	c20918e3          	bnez	s2,8ad4 <_dtoa_r+0xbc8>
    8ea8:	c39ff06f          	j	8ae0 <_dtoa_r+0xbd4>
    8eac:	00050593          	mv	a1,a0
    8eb0:	00098613          	mv	a2,s3
    8eb4:	00040513          	mv	a0,s0
    8eb8:	66d000ef          	jal	9d24 <__pow5mult>
    8ebc:	00100793          	li	a5,1
    8ec0:	00a12c23          	sw	a0,24(sp)
    8ec4:	1147de63          	bge	a5,s4,8fe0 <_dtoa_r+0x10d4>
    8ec8:	00000993          	li	s3,0
    8ecc:	01812703          	lw	a4,24(sp)
    8ed0:	01072783          	lw	a5,16(a4)
    8ed4:	00378793          	add	a5,a5,3
    8ed8:	00279793          	sll	a5,a5,0x2
    8edc:	00f707b3          	add	a5,a4,a5
    8ee0:	0047a503          	lw	a0,4(a5)
    8ee4:	171000ef          	jal	9854 <__hi0bits>
    8ee8:	02000793          	li	a5,32
    8eec:	40a787b3          	sub	a5,a5,a0
    8ef0:	ab5ff06f          	j	89a4 <_dtoa_r+0xa98>
    8ef4:	02412783          	lw	a5,36(sp)
    8ef8:	04079063          	bnez	a5,8f38 <_dtoa_r+0x102c>
    8efc:	00012783          	lw	a5,0(sp)
    8f00:	00c79793          	sll	a5,a5,0xc
    8f04:	02079a63          	bnez	a5,8f38 <_dtoa_r+0x102c>
    8f08:	00012683          	lw	a3,0(sp)
    8f0c:	00000793          	li	a5,0
    8f10:	0146d713          	srl	a4,a3,0x14
    8f14:	7ff77713          	and	a4,a4,2047
    8f18:	00070c63          	beqz	a4,8f30 <_dtoa_r+0x1024>
    8f1c:	01012783          	lw	a5,16(sp)
    8f20:	001b0b13          	add	s6,s6,1
    8f24:	00178793          	add	a5,a5,1
    8f28:	00f12823          	sw	a5,16(sp)
    8f2c:	00100793          	li	a5,1
    8f30:	58099063          	bnez	s3,94b0 <_dtoa_r+0x15a4>
    8f34:	00078993          	mv	s3,a5
    8f38:	00100793          	li	a5,1
    8f3c:	a69ff06f          	j	89a4 <_dtoa_r+0xa98>
    8f40:	a8d70ee3          	beq	a4,a3,89dc <_dtoa_r+0xad0>
    8f44:	03c00713          	li	a4,60
    8f48:	40f707b3          	sub	a5,a4,a5
    8f4c:	a7dff06f          	j	89c8 <_dtoa_r+0xabc>
    8f50:	00100793          	li	a5,1
    8f54:	00500a13          	li	s4,5
    8f58:	02f12423          	sw	a5,40(sp)
    8f5c:	01412783          	lw	a5,20(sp)
    8f60:	02012703          	lw	a4,32(sp)
    8f64:	00e787b3          	add	a5,a5,a4
    8f68:	00178c13          	add	s8,a5,1
    8f6c:	02f12e23          	sw	a5,60(sp)
    8f70:	000c0613          	mv	a2,s8
    8f74:	ab804263          	bgtz	s8,8218 <_dtoa_r+0x30c>
    8f78:	00100613          	li	a2,1
    8f7c:	a9cff06f          	j	8218 <_dtoa_r+0x30c>
    8f80:	00051663          	bnez	a0,8f8c <_dtoa_r+0x1080>
    8f84:	001bf793          	and	a5,s7,1
    8f88:	b00792e3          	bnez	a5,8a8c <_dtoa_r+0xb80>
    8f8c:	03000693          	li	a3,48
    8f90:	fff9c783          	lbu	a5,-1(s3)
    8f94:	00098d13          	mv	s10,s3
    8f98:	fff98993          	add	s3,s3,-1
    8f9c:	fed78ae3          	beq	a5,a3,8f90 <_dtoa_r+0x1084>
    8fa0:	b11ff06f          	j	8ab0 <_dtoa_r+0xba4>
    8fa4:	000c0993          	mv	s3,s8
    8fa8:	abdff06f          	j	8a64 <_dtoa_r+0xb58>
    8fac:	000b0793          	mv	a5,s6
    8fb0:	99dff06f          	j	894c <_dtoa_r+0xa40>
    8fb4:	03012783          	lw	a5,48(sp)
    8fb8:	01012703          	lw	a4,16(sp)
    8fbc:	03712823          	sw	s7,48(sp)
    8fc0:	40fb87b3          	sub	a5,s7,a5
    8fc4:	00f989b3          	add	s3,s3,a5
    8fc8:	018707b3          	add	a5,a4,s8
    8fcc:	00070c93          	mv	s9,a4
    8fd0:	018b0b33          	add	s6,s6,s8
    8fd4:	00f12823          	sw	a5,16(sp)
    8fd8:	00000b93          	li	s7,0
    8fdc:	bd9ff06f          	j	8bb4 <_dtoa_r+0xca8>
    8fe0:	02412783          	lw	a5,36(sp)
    8fe4:	ee0792e3          	bnez	a5,8ec8 <_dtoa_r+0xfbc>
    8fe8:	00012783          	lw	a5,0(sp)
    8fec:	00c79793          	sll	a5,a5,0xc
    8ff0:	ec079ce3          	bnez	a5,8ec8 <_dtoa_r+0xfbc>
    8ff4:	f15ff06f          	j	8f08 <_dtoa_r+0xffc>
    8ff8:	01812303          	lw	t1,24(sp)
    8ffc:	01c12d03          	lw	s10,28(sp)
    9000:	00200913          	li	s2,2
    9004:	ad0ff06f          	j	82d4 <_dtoa_r+0x3c8>
    9008:	00200a13          	li	s4,2
    900c:	02012423          	sw	zero,40(sp)
    9010:	9f8ff06f          	j	8208 <_dtoa_r+0x2fc>
    9014:	dc0510e3          	bnez	a0,8dd4 <_dtoa_r+0xec8>
    9018:	001bf713          	and	a4,s7,1
    901c:	da0716e3          	bnez	a4,8dc8 <_dtoa_r+0xebc>
    9020:	db5ff06f          	j	8dd4 <_dtoa_r+0xec8>
    9024:	03900793          	li	a5,57
    9028:	00fc8023          	sb	a5,0(s9)
    902c:	02012783          	lw	a5,32(sp)
    9030:	00090c13          	mv	s8,s2
    9034:	001c8993          	add	s3,s9,1
    9038:	00178a13          	add	s4,a5,1
    903c:	000b0913          	mv	s2,s6
    9040:	a4dff06f          	j	8a8c <_dtoa_r+0xb80>
    9044:	00100793          	li	a5,1
    9048:	00100c13          	li	s8,1
    904c:	00f12a23          	sw	a5,20(sp)
    9050:	e50ff06f          	j	86a0 <_dtoa_r+0x794>
    9054:	02012423          	sw	zero,40(sp)
    9058:	f05ff06f          	j	8f5c <_dtoa_r+0x1050>
    905c:	03812703          	lw	a4,56(sp)
    9060:	30070e63          	beqz	a4,937c <_dtoa_r+0x1470>
    9064:	01012703          	lw	a4,16(sp)
    9068:	43378793          	add	a5,a5,1075
    906c:	00fb0b33          	add	s6,s6,a5
    9070:	00f707b3          	add	a5,a4,a5
    9074:	03012b83          	lw	s7,48(sp)
    9078:	00070c93          	mv	s9,a4
    907c:	00f12823          	sw	a5,16(sp)
    9080:	b35ff06f          	j	8bb4 <_dtoa_r+0xca8>
    9084:	03100793          	li	a5,49
    9088:	00fa8023          	sb	a5,0(s5)
    908c:	001a0a13          	add	s4,s4,1
    9090:	a21ff06f          	j	8ab0 <_dtoa_r+0xba4>
    9094:	02012783          	lw	a5,32(sp)
    9098:	32078263          	beqz	a5,93bc <_dtoa_r+0x14b0>
    909c:	40f00bb3          	neg	s7,a5
    90a0:	00fbf713          	and	a4,s7,15
    90a4:	00371713          	sll	a4,a4,0x3
    90a8:	00006797          	auipc	a5,0x6
    90ac:	52078793          	add	a5,a5,1312 # f5c8 <__mprec_tens>
    90b0:	00e787b3          	add	a5,a5,a4
    90b4:	0007a603          	lw	a2,0(a5)
    90b8:	0047a683          	lw	a3,4(a5)
    90bc:	01812503          	lw	a0,24(sp)
    90c0:	01c12583          	lw	a1,28(sp)
    90c4:	404bdb93          	sra	s7,s7,0x4
    90c8:	3d4040ef          	jal	d49c <__muldf3>
    90cc:	00058d13          	mv	s10,a1
    90d0:	440b8c63          	beqz	s7,9528 <_dtoa_r+0x161c>
    90d4:	00200913          	li	s2,2
    90d8:	04812023          	sw	s0,64(sp)
    90dc:	00006c97          	auipc	s9,0x6
    90e0:	4c4c8c93          	add	s9,s9,1220 # f5a0 <__mprec_bigtens>
    90e4:	00090413          	mv	s0,s2
    90e8:	00050713          	mv	a4,a0
    90ec:	00000613          	li	a2,0
    90f0:	00050913          	mv	s2,a0
    90f4:	001bf693          	and	a3,s7,1
    90f8:	02068063          	beqz	a3,9118 <_dtoa_r+0x120c>
    90fc:	000ca603          	lw	a2,0(s9)
    9100:	004ca683          	lw	a3,4(s9)
    9104:	00070513          	mv	a0,a4
    9108:	00140413          	add	s0,s0,1
    910c:	390040ef          	jal	d49c <__muldf3>
    9110:	00050713          	mv	a4,a0
    9114:	00100613          	li	a2,1
    9118:	401bdb93          	sra	s7,s7,0x1
    911c:	008c8c93          	add	s9,s9,8
    9120:	fc0b9ae3          	bnez	s7,90f4 <_dtoa_r+0x11e8>
    9124:	00090513          	mv	a0,s2
    9128:	00058793          	mv	a5,a1
    912c:	00040913          	mv	s2,s0
    9130:	04012403          	lw	s0,64(sp)
    9134:	a0061a63          	bnez	a2,8348 <_dtoa_r+0x43c>
    9138:	00050713          	mv	a4,a0
    913c:	000d0793          	mv	a5,s10
    9140:	a08ff06f          	j	8348 <_dtoa_r+0x43c>
    9144:	00068593          	mv	a1,a3
    9148:	00070613          	mv	a2,a4
    914c:	00070513          	mv	a0,a4
    9150:	745020ef          	jal	c094 <__adddf3>
    9154:	02012783          	lw	a5,32(sp)
    9158:	00090613          	mv	a2,s2
    915c:	00098693          	mv	a3,s3
    9160:	00178a13          	add	s4,a5,1
    9164:	00050c93          	mv	s9,a0
    9168:	00058b13          	mv	s6,a1
    916c:	000a0c13          	mv	s8,s4
    9170:	124040ef          	jal	d294 <__gedf2>
    9174:	c4a04863          	bgtz	a0,85c4 <_dtoa_r+0x6b8>
    9178:	000c8513          	mv	a0,s9
    917c:	000b0593          	mv	a1,s6
    9180:	00090613          	mv	a2,s2
    9184:	00098693          	mv	a3,s3
    9188:	080040ef          	jal	d208 <__eqdf2>
    918c:	00051663          	bnez	a0,9198 <_dtoa_r+0x128c>
    9190:	001d7d13          	and	s10,s10,1
    9194:	c20d1863          	bnez	s10,85c4 <_dtoa_r+0x6b8>
    9198:	000b8d13          	mv	s10,s7
    919c:	945ff06f          	j	8ae0 <_dtoa_r+0xbd4>
    91a0:	00492583          	lw	a1,4(s2)
    91a4:	00040513          	mv	a0,s0
    91a8:	450000ef          	jal	95f8 <_Balloc>
    91ac:	00050993          	mv	s3,a0
    91b0:	38050463          	beqz	a0,9538 <_dtoa_r+0x162c>
    91b4:	01092603          	lw	a2,16(s2)
    91b8:	00c90593          	add	a1,s2,12
    91bc:	00c50513          	add	a0,a0,12
    91c0:	00260613          	add	a2,a2,2
    91c4:	00261613          	sll	a2,a2,0x2
    91c8:	ccdf70ef          	jal	e94 <memcpy>
    91cc:	00100613          	li	a2,1
    91d0:	00098593          	mv	a1,s3
    91d4:	00040513          	mv	a0,s0
    91d8:	49d000ef          	jal	9e74 <__lshift>
    91dc:	00050b13          	mv	s6,a0
    91e0:	aa9ff06f          	j	8c88 <_dtoa_r+0xd7c>
    91e4:	00090593          	mv	a1,s2
    91e8:	000b8613          	mv	a2,s7
    91ec:	00040513          	mv	a0,s0
    91f0:	335000ef          	jal	9d24 <__pow5mult>
    91f4:	00048613          	mv	a2,s1
    91f8:	00050593          	mv	a1,a0
    91fc:	00050913          	mv	s2,a0
    9200:	00040513          	mv	a0,s0
    9204:	059000ef          	jal	9a5c <__multiply>
    9208:	00050793          	mv	a5,a0
    920c:	00048593          	mv	a1,s1
    9210:	00040513          	mv	a0,s0
    9214:	00078493          	mv	s1,a5
    9218:	494000ef          	jal	96ac <_Bfree>
    921c:	03012783          	lw	a5,48(sp)
    9220:	417787b3          	sub	a5,a5,s7
    9224:	02f12823          	sw	a5,48(sp)
    9228:	f6078063          	beqz	a5,8988 <_dtoa_r+0xa7c>
    922c:	f48ff06f          	j	8974 <_dtoa_r+0xa68>
    9230:	05012603          	lw	a2,80(sp)
    9234:	05412683          	lw	a3,84(sp)
    9238:	05812503          	lw	a0,88(sp)
    923c:	04b12623          	sw	a1,76(sp)
    9240:	000b8593          	mv	a1,s7
    9244:	02612423          	sw	t1,40(sp)
    9248:	254040ef          	jal	d49c <__muldf3>
    924c:	02812303          	lw	t1,40(sp)
    9250:	04812783          	lw	a5,72(sp)
    9254:	00100693          	li	a3,1
    9258:	006a8023          	sb	t1,0(s5)
    925c:	02a12c23          	sw	a0,56(sp)
    9260:	04c12883          	lw	a7,76(sp)
    9264:	00058913          	mv	s2,a1
    9268:	00fa8bb3          	add	s7,s5,a5
    926c:	7fff7617          	auipc	a2,0x7fff7
    9270:	48460613          	add	a2,a2,1156 # 800006f0 <__global_locale+0x1bc>
    9274:	28d78c63          	beq	a5,a3,950c <_dtoa_r+0x1600>
    9278:	00062783          	lw	a5,0(a2)
    927c:	00462803          	lw	a6,4(a2)
    9280:	04912423          	sw	s1,72(sp)
    9284:	02f12423          	sw	a5,40(sp)
    9288:	03012623          	sw	a6,44(sp)
    928c:	04812623          	sw	s0,76(sp)
    9290:	000c8513          	mv	a0,s9
    9294:	00088593          	mv	a1,a7
    9298:	02812603          	lw	a2,40(sp)
    929c:	02c12683          	lw	a3,44(sp)
    92a0:	001d0d13          	add	s10,s10,1
    92a4:	1f8040ef          	jal	d49c <__muldf3>
    92a8:	00058413          	mv	s0,a1
    92ac:	00050493          	mv	s1,a0
    92b0:	2d8050ef          	jal	e588 <__fixdfsi>
    92b4:	00050c93          	mv	s9,a0
    92b8:	354050ef          	jal	e60c <__floatsidf>
    92bc:	00050613          	mv	a2,a0
    92c0:	00058693          	mv	a3,a1
    92c4:	00048513          	mv	a0,s1
    92c8:	00040593          	mv	a1,s0
    92cc:	030c8c93          	add	s9,s9,48
    92d0:	15d040ef          	jal	dc2c <__subdf3>
    92d4:	ff9d0fa3          	sb	s9,-1(s10)
    92d8:	fdab90e3          	bne	s7,s10,9298 <_dtoa_r+0x138c>
    92dc:	04812483          	lw	s1,72(sp)
    92e0:	04c12403          	lw	s0,76(sp)
    92e4:	00050c93          	mv	s9,a0
    92e8:	00058893          	mv	a7,a1
    92ec:	7fff7d17          	auipc	s10,0x7fff7
    92f0:	3ccd0d13          	add	s10,s10,972 # 800006b8 <__global_locale+0x184>
    92f4:	000d2603          	lw	a2,0(s10)
    92f8:	004d2683          	lw	a3,4(s10)
    92fc:	03812503          	lw	a0,56(sp)
    9300:	00090593          	mv	a1,s2
    9304:	03112423          	sw	a7,40(sp)
    9308:	58d020ef          	jal	c094 <__adddf3>
    930c:	02812883          	lw	a7,40(sp)
    9310:	000c8613          	mv	a2,s9
    9314:	00088693          	mv	a3,a7
    9318:	07c040ef          	jal	d394 <__ledf2>
    931c:	1a054863          	bltz	a0,94cc <_dtoa_r+0x15c0>
    9320:	03812603          	lw	a2,56(sp)
    9324:	000d2503          	lw	a0,0(s10)
    9328:	004d2583          	lw	a1,4(s10)
    932c:	00090693          	mv	a3,s2
    9330:	0fd040ef          	jal	dc2c <__subdf3>
    9334:	02812883          	lw	a7,40(sp)
    9338:	000c8613          	mv	a2,s9
    933c:	00088693          	mv	a3,a7
    9340:	755030ef          	jal	d294 <__gedf2>
    9344:	12a04863          	bgtz	a0,9474 <_dtoa_r+0x1568>
    9348:	06c12783          	lw	a5,108(sp)
    934c:	de07c063          	bltz	a5,892c <_dtoa_r+0xa20>
    9350:	02012703          	lw	a4,32(sp)
    9354:	00e00793          	li	a5,14
    9358:	dce7ca63          	blt	a5,a4,892c <_dtoa_r+0xa20>
    935c:	02012783          	lw	a5,32(sp)
    9360:	00006717          	auipc	a4,0x6
    9364:	26870713          	add	a4,a4,616 # f5c8 <__mprec_tens>
    9368:	00379793          	sll	a5,a5,0x3
    936c:	00f707b3          	add	a5,a4,a5
    9370:	0007a903          	lw	s2,0(a5)
    9374:	0047a983          	lw	s3,4(a5)
    9378:	c90ff06f          	j	8808 <_dtoa_r+0x8fc>
    937c:	06812703          	lw	a4,104(sp)
    9380:	01012683          	lw	a3,16(sp)
    9384:	03600793          	li	a5,54
    9388:	40e787b3          	sub	a5,a5,a4
    938c:	00fb0b33          	add	s6,s6,a5
    9390:	00f687b3          	add	a5,a3,a5
    9394:	03012b83          	lw	s7,48(sp)
    9398:	00068c93          	mv	s9,a3
    939c:	00f12823          	sw	a5,16(sp)
    93a0:	815ff06f          	j	8bb4 <_dtoa_r+0xca8>
    93a4:	02012783          	lw	a5,32(sp)
    93a8:	00090c13          	mv	s8,s2
    93ac:	01012a83          	lw	s5,16(sp)
    93b0:	00178a13          	add	s4,a5,1
    93b4:	000b0913          	mv	s2,s6
    93b8:	eb4ff06f          	j	8a6c <_dtoa_r+0xb60>
    93bc:	01812703          	lw	a4,24(sp)
    93c0:	01c12783          	lw	a5,28(sp)
    93c4:	00200913          	li	s2,2
    93c8:	f81fe06f          	j	8348 <_dtoa_r+0x43c>
    93cc:	b00c0063          	beqz	s8,86cc <_dtoa_r+0x7c0>
    93d0:	03c12d03          	lw	s10,60(sp)
    93d4:	bba05063          	blez	s10,8774 <_dtoa_r+0x868>
    93d8:	7fff7617          	auipc	a2,0x7fff7
    93dc:	31860613          	add	a2,a2,792 # 800006f0 <__global_locale+0x1bc>
    93e0:	00078593          	mv	a1,a5
    93e4:	02012783          	lw	a5,32(sp)
    93e8:	00462683          	lw	a3,4(a2)
    93ec:	00062603          	lw	a2,0(a2)
    93f0:	fff78793          	add	a5,a5,-1
    93f4:	00070513          	mv	a0,a4
    93f8:	04f12e23          	sw	a5,92(sp)
    93fc:	0a0040ef          	jal	d49c <__muldf3>
    9400:	00050713          	mv	a4,a0
    9404:	00190513          	add	a0,s2,1
    9408:	04e12423          	sw	a4,72(sp)
    940c:	04b12023          	sw	a1,64(sp)
    9410:	1fc050ef          	jal	e60c <__floatsidf>
    9414:	04812703          	lw	a4,72(sp)
    9418:	04012783          	lw	a5,64(sp)
    941c:	00070613          	mv	a2,a4
    9420:	00078693          	mv	a3,a5
    9424:	04e12623          	sw	a4,76(sp)
    9428:	074040ef          	jal	d49c <__muldf3>
    942c:	7fff7697          	auipc	a3,0x7fff7
    9430:	2cc68693          	add	a3,a3,716 # 800006f8 <__global_locale+0x1c4>
    9434:	0006a603          	lw	a2,0(a3)
    9438:	0046a683          	lw	a3,4(a3)
    943c:	459020ef          	jal	c094 <__adddf3>
    9440:	fcc006b7          	lui	a3,0xfcc00
    9444:	04012783          	lw	a5,64(sp)
    9448:	04c12703          	lw	a4,76(sp)
    944c:	00050c93          	mv	s9,a0
    9450:	00b68bb3          	add	s7,a3,a1
    9454:	05a12423          	sw	s10,72(sp)
    9458:	f91fe06f          	j	83e8 <_dtoa_r+0x4dc>
    945c:	03100693          	li	a3,49
    9460:	001c0c13          	add	s8,s8,1
    9464:	984ff06f          	j	85e8 <_dtoa_r+0x6dc>
    9468:	00012c23          	sw	zero,24(sp)
    946c:	00000913          	li	s2,0
    9470:	a11ff06f          	j	8e80 <_dtoa_r+0xf74>
    9474:	03000613          	li	a2,48
    9478:	fffbc783          	lbu	a5,-1(s7)
    947c:	000b8d13          	mv	s10,s7
    9480:	fffb8b93          	add	s7,s7,-1
    9484:	fec78ae3          	beq	a5,a2,9478 <_dtoa_r+0x156c>
    9488:	05c12783          	lw	a5,92(sp)
    948c:	00178a13          	add	s4,a5,1
    9490:	e50ff06f          	j	8ae0 <_dtoa_r+0xbd4>
    9494:	03900713          	li	a4,57
    9498:	01012a83          	lw	s5,16(sp)
    949c:	b8eb84e3          	beq	s7,a4,9024 <_dtoa_r+0x1118>
    94a0:	933048e3          	bgtz	s3,8dd0 <_dtoa_r+0xec4>
    94a4:	931ff06f          	j	8dd4 <_dtoa_r+0xec8>
    94a8:	01012a83          	lw	s5,16(sp)
    94ac:	929ff06f          	j	8dd4 <_dtoa_r+0xec8>
    94b0:	00078993          	mv	s3,a5
    94b4:	a19ff06f          	j	8ecc <_dtoa_r+0xfc0>
    94b8:	00078c93          	mv	s9,a5
    94bc:	018787b3          	add	a5,a5,s8
    94c0:	018b0b33          	add	s6,s6,s8
    94c4:	00f12823          	sw	a5,16(sp)
    94c8:	eecff06f          	j	8bb4 <_dtoa_r+0xca8>
    94cc:	05c12783          	lw	a5,92(sp)
    94d0:	00178c13          	add	s8,a5,1
    94d4:	8f0ff06f          	j	85c4 <_dtoa_r+0x6b8>
    94d8:	04c12983          	lw	s3,76(sp)
    94dc:	05012b03          	lw	s6,80(sp)
    94e0:	05812c03          	lw	s8,88(sp)
    94e4:	04812a03          	lw	s4,72(sp)
    94e8:	a8cff06f          	j	8774 <_dtoa_r+0x868>
    94ec:	00200793          	li	a5,2
    94f0:	0147c863          	blt	a5,s4,9500 <_dtoa_r+0x15f4>
    94f4:	02012a03          	lw	s4,32(sp)
    94f8:	03c12c03          	lw	s8,60(sp)
    94fc:	d1cff06f          	j	8a18 <_dtoa_r+0xb0c>
    9500:	03c12c03          	lw	s8,60(sp)
    9504:	03612023          	sw	s6,32(sp)
    9508:	949ff06f          	j	8e50 <_dtoa_r+0xf44>
    950c:	04012b83          	lw	s7,64(sp)
    9510:	dddff06f          	j	92ec <_dtoa_r+0x13e0>
    9514:	00200793          	li	a5,2
    9518:	ff47c4e3          	blt	a5,s4,9500 <_dtoa_r+0x15f4>
    951c:	03c12c03          	lw	s8,60(sp)
    9520:	03612023          	sw	s6,32(sp)
    9524:	f44ff06f          	j	8c68 <_dtoa_r+0xd5c>
    9528:	00050713          	mv	a4,a0
    952c:	00058793          	mv	a5,a1
    9530:	00200913          	li	s2,2
    9534:	e15fe06f          	j	8348 <_dtoa_r+0x43c>
    9538:	00006697          	auipc	a3,0x6
    953c:	a5468693          	add	a3,a3,-1452 # ef8c <__fini_array_end+0x230>
    9540:	00000613          	li	a2,0
    9544:	2ef00593          	li	a1,751
    9548:	00006517          	auipc	a0,0x6
    954c:	a5850513          	add	a0,a0,-1448 # efa0 <__fini_array_end+0x244>
    9550:	0cd010ef          	jal	ae1c <__assert_func>
    9554:	01012a83          	lw	s5,16(sp)
    9558:	85b048e3          	bgtz	s11,8da8 <_dtoa_r+0xe9c>
    955c:	879ff06f          	j	8dd4 <_dtoa_r+0xec8>
    9560:	00006697          	auipc	a3,0x6
    9564:	a2c68693          	add	a3,a3,-1492 # ef8c <__fini_array_end+0x230>
    9568:	00000613          	li	a2,0
    956c:	1af00593          	li	a1,431
    9570:	00006517          	auipc	a0,0x6
    9574:	a3050513          	add	a0,a0,-1488 # efa0 <__fini_array_end+0x244>
    9578:	0a5010ef          	jal	ae1c <__assert_func>
    957c:	02042e23          	sw	zero,60(s0)
    9580:	00000593          	li	a1,0
    9584:	cc1fe06f          	j	8244 <_dtoa_r+0x338>
    9588:	02012423          	sw	zero,40(sp)
    958c:	c7dfe06f          	j	8208 <_dtoa_r+0x2fc>

00009590 <__ascii_mbtowc>:
    9590:	02058063          	beqz	a1,95b0 <__ascii_mbtowc+0x20>
    9594:	04060263          	beqz	a2,95d8 <__ascii_mbtowc+0x48>
    9598:	04068863          	beqz	a3,95e8 <__ascii_mbtowc+0x58>
    959c:	00064783          	lbu	a5,0(a2)
    95a0:	00f5a023          	sw	a5,0(a1)
    95a4:	00064503          	lbu	a0,0(a2)
    95a8:	00a03533          	snez	a0,a0
    95ac:	00008067          	ret
    95b0:	ff010113          	add	sp,sp,-16
    95b4:	00c10593          	add	a1,sp,12
    95b8:	02060463          	beqz	a2,95e0 <__ascii_mbtowc+0x50>
    95bc:	02068a63          	beqz	a3,95f0 <__ascii_mbtowc+0x60>
    95c0:	00064783          	lbu	a5,0(a2)
    95c4:	00f5a023          	sw	a5,0(a1)
    95c8:	00064503          	lbu	a0,0(a2)
    95cc:	00a03533          	snez	a0,a0
    95d0:	01010113          	add	sp,sp,16
    95d4:	00008067          	ret
    95d8:	00000513          	li	a0,0
    95dc:	00008067          	ret
    95e0:	00000513          	li	a0,0
    95e4:	fedff06f          	j	95d0 <__ascii_mbtowc+0x40>
    95e8:	ffe00513          	li	a0,-2
    95ec:	00008067          	ret
    95f0:	ffe00513          	li	a0,-2
    95f4:	fddff06f          	j	95d0 <__ascii_mbtowc+0x40>

000095f8 <_Balloc>:
    95f8:	04452783          	lw	a5,68(a0)
    95fc:	ff010113          	add	sp,sp,-16
    9600:	00812423          	sw	s0,8(sp)
    9604:	00912223          	sw	s1,4(sp)
    9608:	00112623          	sw	ra,12(sp)
    960c:	00050413          	mv	s0,a0
    9610:	00058493          	mv	s1,a1
    9614:	02078c63          	beqz	a5,964c <_Balloc+0x54>
    9618:	00249713          	sll	a4,s1,0x2
    961c:	00e787b3          	add	a5,a5,a4
    9620:	0007a503          	lw	a0,0(a5)
    9624:	04050463          	beqz	a0,966c <_Balloc+0x74>
    9628:	00052703          	lw	a4,0(a0)
    962c:	00e7a023          	sw	a4,0(a5)
    9630:	00052823          	sw	zero,16(a0)
    9634:	00052623          	sw	zero,12(a0)
    9638:	00c12083          	lw	ra,12(sp)
    963c:	00812403          	lw	s0,8(sp)
    9640:	00412483          	lw	s1,4(sp)
    9644:	01010113          	add	sp,sp,16
    9648:	00008067          	ret
    964c:	02100613          	li	a2,33
    9650:	00400593          	li	a1,4
    9654:	021010ef          	jal	ae74 <_calloc_r>
    9658:	04a42223          	sw	a0,68(s0)
    965c:	00050793          	mv	a5,a0
    9660:	fa051ce3          	bnez	a0,9618 <_Balloc+0x20>
    9664:	00000513          	li	a0,0
    9668:	fd1ff06f          	j	9638 <_Balloc+0x40>
    966c:	01212023          	sw	s2,0(sp)
    9670:	00100913          	li	s2,1
    9674:	00991933          	sll	s2,s2,s1
    9678:	00590613          	add	a2,s2,5
    967c:	00261613          	sll	a2,a2,0x2
    9680:	00100593          	li	a1,1
    9684:	00040513          	mv	a0,s0
    9688:	7ec010ef          	jal	ae74 <_calloc_r>
    968c:	00050a63          	beqz	a0,96a0 <_Balloc+0xa8>
    9690:	01252423          	sw	s2,8(a0)
    9694:	00952223          	sw	s1,4(a0)
    9698:	00012903          	lw	s2,0(sp)
    969c:	f95ff06f          	j	9630 <_Balloc+0x38>
    96a0:	00012903          	lw	s2,0(sp)
    96a4:	00000513          	li	a0,0
    96a8:	f91ff06f          	j	9638 <_Balloc+0x40>

000096ac <_Bfree>:
    96ac:	02058063          	beqz	a1,96cc <_Bfree+0x20>
    96b0:	0045a703          	lw	a4,4(a1)
    96b4:	04452783          	lw	a5,68(a0)
    96b8:	00271713          	sll	a4,a4,0x2
    96bc:	00e787b3          	add	a5,a5,a4
    96c0:	0007a703          	lw	a4,0(a5)
    96c4:	00e5a023          	sw	a4,0(a1)
    96c8:	00b7a023          	sw	a1,0(a5)
    96cc:	00008067          	ret

000096d0 <__multadd>:
    96d0:	fd010113          	add	sp,sp,-48
    96d4:	01412c23          	sw	s4,24(sp)
    96d8:	0105aa03          	lw	s4,16(a1)
    96dc:	01912223          	sw	s9,4(sp)
    96e0:	00010cb7          	lui	s9,0x10
    96e4:	02912223          	sw	s1,36(sp)
    96e8:	03212023          	sw	s2,32(sp)
    96ec:	01312e23          	sw	s3,28(sp)
    96f0:	01512a23          	sw	s5,20(sp)
    96f4:	01612823          	sw	s6,16(sp)
    96f8:	01712623          	sw	s7,12(sp)
    96fc:	02112623          	sw	ra,44(sp)
    9700:	02812423          	sw	s0,40(sp)
    9704:	01812423          	sw	s8,8(sp)
    9708:	00058a93          	mv	s5,a1
    970c:	00050b13          	mv	s6,a0
    9710:	00060993          	mv	s3,a2
    9714:	00068493          	mv	s1,a3
    9718:	01458913          	add	s2,a1,20
    971c:	00000b93          	li	s7,0
    9720:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    9724:	00092c03          	lw	s8,0(s2)
    9728:	00098593          	mv	a1,s3
    972c:	00490913          	add	s2,s2,4
    9730:	019c7533          	and	a0,s8,s9
    9734:	430050ef          	jal	eb64 <__mulsi3>
    9738:	00050413          	mv	s0,a0
    973c:	00098593          	mv	a1,s3
    9740:	010c5513          	srl	a0,s8,0x10
    9744:	00940433          	add	s0,s0,s1
    9748:	41c050ef          	jal	eb64 <__mulsi3>
    974c:	01045793          	srl	a5,s0,0x10
    9750:	00f50533          	add	a0,a0,a5
    9754:	01051793          	sll	a5,a0,0x10
    9758:	01947433          	and	s0,s0,s9
    975c:	008787b3          	add	a5,a5,s0
    9760:	fef92e23          	sw	a5,-4(s2)
    9764:	001b8b93          	add	s7,s7,1
    9768:	01055493          	srl	s1,a0,0x10
    976c:	fb4bcce3          	blt	s7,s4,9724 <__multadd+0x54>
    9770:	02048263          	beqz	s1,9794 <__multadd+0xc4>
    9774:	008aa783          	lw	a5,8(s5)
    9778:	04fa5a63          	bge	s4,a5,97cc <__multadd+0xfc>
    977c:	004a0793          	add	a5,s4,4
    9780:	00279793          	sll	a5,a5,0x2
    9784:	00fa87b3          	add	a5,s5,a5
    9788:	0097a223          	sw	s1,4(a5)
    978c:	001a0a13          	add	s4,s4,1
    9790:	014aa823          	sw	s4,16(s5)
    9794:	02c12083          	lw	ra,44(sp)
    9798:	02812403          	lw	s0,40(sp)
    979c:	02412483          	lw	s1,36(sp)
    97a0:	02012903          	lw	s2,32(sp)
    97a4:	01c12983          	lw	s3,28(sp)
    97a8:	01812a03          	lw	s4,24(sp)
    97ac:	01012b03          	lw	s6,16(sp)
    97b0:	00c12b83          	lw	s7,12(sp)
    97b4:	00812c03          	lw	s8,8(sp)
    97b8:	00412c83          	lw	s9,4(sp)
    97bc:	000a8513          	mv	a0,s5
    97c0:	01412a83          	lw	s5,20(sp)
    97c4:	03010113          	add	sp,sp,48
    97c8:	00008067          	ret
    97cc:	004aa583          	lw	a1,4(s5)
    97d0:	000b0513          	mv	a0,s6
    97d4:	00158593          	add	a1,a1,1
    97d8:	e21ff0ef          	jal	95f8 <_Balloc>
    97dc:	00050413          	mv	s0,a0
    97e0:	04050c63          	beqz	a0,9838 <__multadd+0x168>
    97e4:	010aa603          	lw	a2,16(s5)
    97e8:	00ca8593          	add	a1,s5,12
    97ec:	00c50513          	add	a0,a0,12
    97f0:	00260613          	add	a2,a2,2
    97f4:	00261613          	sll	a2,a2,0x2
    97f8:	e9cf70ef          	jal	e94 <memcpy>
    97fc:	004aa703          	lw	a4,4(s5)
    9800:	044b2783          	lw	a5,68(s6)
    9804:	00271713          	sll	a4,a4,0x2
    9808:	00e787b3          	add	a5,a5,a4
    980c:	0007a703          	lw	a4,0(a5)
    9810:	00eaa023          	sw	a4,0(s5)
    9814:	0157a023          	sw	s5,0(a5)
    9818:	004a0793          	add	a5,s4,4
    981c:	00040a93          	mv	s5,s0
    9820:	00279793          	sll	a5,a5,0x2
    9824:	00fa87b3          	add	a5,s5,a5
    9828:	0097a223          	sw	s1,4(a5)
    982c:	001a0a13          	add	s4,s4,1
    9830:	014aa823          	sw	s4,16(s5)
    9834:	f61ff06f          	j	9794 <__multadd+0xc4>
    9838:	00005697          	auipc	a3,0x5
    983c:	75468693          	add	a3,a3,1876 # ef8c <__fini_array_end+0x230>
    9840:	00000613          	li	a2,0
    9844:	0ba00593          	li	a1,186
    9848:	00005517          	auipc	a0,0x5
    984c:	7d850513          	add	a0,a0,2008 # f020 <__fini_array_end+0x2c4>
    9850:	5cc010ef          	jal	ae1c <__assert_func>

00009854 <__hi0bits>:
    9854:	00050793          	mv	a5,a0
    9858:	00010737          	lui	a4,0x10
    985c:	00000513          	li	a0,0
    9860:	00e7f663          	bgeu	a5,a4,986c <__hi0bits+0x18>
    9864:	01079793          	sll	a5,a5,0x10
    9868:	01000513          	li	a0,16
    986c:	01000737          	lui	a4,0x1000
    9870:	00e7f663          	bgeu	a5,a4,987c <__hi0bits+0x28>
    9874:	00850513          	add	a0,a0,8
    9878:	00879793          	sll	a5,a5,0x8
    987c:	10000737          	lui	a4,0x10000
    9880:	00e7f663          	bgeu	a5,a4,988c <__hi0bits+0x38>
    9884:	00450513          	add	a0,a0,4
    9888:	00479793          	sll	a5,a5,0x4
    988c:	40000737          	lui	a4,0x40000
    9890:	00e7ea63          	bltu	a5,a4,98a4 <__hi0bits+0x50>
    9894:	fff7c793          	not	a5,a5
    9898:	01f7d793          	srl	a5,a5,0x1f
    989c:	00f50533          	add	a0,a0,a5
    98a0:	00008067          	ret
    98a4:	00279793          	sll	a5,a5,0x2
    98a8:	0007ca63          	bltz	a5,98bc <__hi0bits+0x68>
    98ac:	00179713          	sll	a4,a5,0x1
    98b0:	00074a63          	bltz	a4,98c4 <__hi0bits+0x70>
    98b4:	02000513          	li	a0,32
    98b8:	00008067          	ret
    98bc:	00250513          	add	a0,a0,2
    98c0:	00008067          	ret
    98c4:	00350513          	add	a0,a0,3
    98c8:	00008067          	ret

000098cc <__lo0bits>:
    98cc:	00052783          	lw	a5,0(a0)
    98d0:	00050713          	mv	a4,a0
    98d4:	0077f693          	and	a3,a5,7
    98d8:	02068463          	beqz	a3,9900 <__lo0bits+0x34>
    98dc:	0017f693          	and	a3,a5,1
    98e0:	00000513          	li	a0,0
    98e4:	04069e63          	bnez	a3,9940 <__lo0bits+0x74>
    98e8:	0027f693          	and	a3,a5,2
    98ec:	0a068863          	beqz	a3,999c <__lo0bits+0xd0>
    98f0:	0017d793          	srl	a5,a5,0x1
    98f4:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    98f8:	00100513          	li	a0,1
    98fc:	00008067          	ret
    9900:	01079693          	sll	a3,a5,0x10
    9904:	0106d693          	srl	a3,a3,0x10
    9908:	00000513          	li	a0,0
    990c:	06068e63          	beqz	a3,9988 <__lo0bits+0xbc>
    9910:	0ff7f693          	zext.b	a3,a5
    9914:	06068063          	beqz	a3,9974 <__lo0bits+0xa8>
    9918:	00f7f693          	and	a3,a5,15
    991c:	04068263          	beqz	a3,9960 <__lo0bits+0x94>
    9920:	0037f693          	and	a3,a5,3
    9924:	02068463          	beqz	a3,994c <__lo0bits+0x80>
    9928:	0017f693          	and	a3,a5,1
    992c:	00069c63          	bnez	a3,9944 <__lo0bits+0x78>
    9930:	0017d793          	srl	a5,a5,0x1
    9934:	00150513          	add	a0,a0,1
    9938:	00079663          	bnez	a5,9944 <__lo0bits+0x78>
    993c:	02000513          	li	a0,32
    9940:	00008067          	ret
    9944:	00f72023          	sw	a5,0(a4)
    9948:	00008067          	ret
    994c:	0027d793          	srl	a5,a5,0x2
    9950:	0017f693          	and	a3,a5,1
    9954:	00250513          	add	a0,a0,2
    9958:	fe0696e3          	bnez	a3,9944 <__lo0bits+0x78>
    995c:	fd5ff06f          	j	9930 <__lo0bits+0x64>
    9960:	0047d793          	srl	a5,a5,0x4
    9964:	0037f693          	and	a3,a5,3
    9968:	00450513          	add	a0,a0,4
    996c:	fa069ee3          	bnez	a3,9928 <__lo0bits+0x5c>
    9970:	fddff06f          	j	994c <__lo0bits+0x80>
    9974:	0087d793          	srl	a5,a5,0x8
    9978:	00f7f693          	and	a3,a5,15
    997c:	00850513          	add	a0,a0,8
    9980:	fa0690e3          	bnez	a3,9920 <__lo0bits+0x54>
    9984:	fddff06f          	j	9960 <__lo0bits+0x94>
    9988:	0107d793          	srl	a5,a5,0x10
    998c:	0ff7f693          	zext.b	a3,a5
    9990:	01000513          	li	a0,16
    9994:	f80692e3          	bnez	a3,9918 <__lo0bits+0x4c>
    9998:	fddff06f          	j	9974 <__lo0bits+0xa8>
    999c:	0027d793          	srl	a5,a5,0x2
    99a0:	00f72023          	sw	a5,0(a4)
    99a4:	00200513          	li	a0,2
    99a8:	00008067          	ret

000099ac <__i2b>:
    99ac:	04452783          	lw	a5,68(a0)
    99b0:	ff010113          	add	sp,sp,-16
    99b4:	00812423          	sw	s0,8(sp)
    99b8:	00912223          	sw	s1,4(sp)
    99bc:	00112623          	sw	ra,12(sp)
    99c0:	00050413          	mv	s0,a0
    99c4:	00058493          	mv	s1,a1
    99c8:	02078c63          	beqz	a5,9a00 <__i2b+0x54>
    99cc:	0047a503          	lw	a0,4(a5)
    99d0:	06050263          	beqz	a0,9a34 <__i2b+0x88>
    99d4:	00052703          	lw	a4,0(a0)
    99d8:	00e7a223          	sw	a4,4(a5)
    99dc:	00c12083          	lw	ra,12(sp)
    99e0:	00812403          	lw	s0,8(sp)
    99e4:	00100793          	li	a5,1
    99e8:	00952a23          	sw	s1,20(a0)
    99ec:	00052623          	sw	zero,12(a0)
    99f0:	00f52823          	sw	a5,16(a0)
    99f4:	00412483          	lw	s1,4(sp)
    99f8:	01010113          	add	sp,sp,16
    99fc:	00008067          	ret
    9a00:	02100613          	li	a2,33
    9a04:	00400593          	li	a1,4
    9a08:	46c010ef          	jal	ae74 <_calloc_r>
    9a0c:	04a42223          	sw	a0,68(s0)
    9a10:	00050793          	mv	a5,a0
    9a14:	fa051ce3          	bnez	a0,99cc <__i2b+0x20>
    9a18:	00005697          	auipc	a3,0x5
    9a1c:	57468693          	add	a3,a3,1396 # ef8c <__fini_array_end+0x230>
    9a20:	00000613          	li	a2,0
    9a24:	14500593          	li	a1,325
    9a28:	00005517          	auipc	a0,0x5
    9a2c:	5f850513          	add	a0,a0,1528 # f020 <__fini_array_end+0x2c4>
    9a30:	3ec010ef          	jal	ae1c <__assert_func>
    9a34:	01c00613          	li	a2,28
    9a38:	00100593          	li	a1,1
    9a3c:	00040513          	mv	a0,s0
    9a40:	434010ef          	jal	ae74 <_calloc_r>
    9a44:	fc050ae3          	beqz	a0,9a18 <__i2b+0x6c>
    9a48:	00100793          	li	a5,1
    9a4c:	00f52223          	sw	a5,4(a0)
    9a50:	00200793          	li	a5,2
    9a54:	00f52423          	sw	a5,8(a0)
    9a58:	f85ff06f          	j	99dc <__i2b+0x30>

00009a5c <__multiply>:
    9a5c:	fb010113          	add	sp,sp,-80
    9a60:	03312e23          	sw	s3,60(sp)
    9a64:	03812423          	sw	s8,40(sp)
    9a68:	01062983          	lw	s3,16(a2)
    9a6c:	0105ac03          	lw	s8,16(a1)
    9a70:	04812423          	sw	s0,72(sp)
    9a74:	03412c23          	sw	s4,56(sp)
    9a78:	04112623          	sw	ra,76(sp)
    9a7c:	03712623          	sw	s7,44(sp)
    9a80:	00058a13          	mv	s4,a1
    9a84:	00060413          	mv	s0,a2
    9a88:	013c4c63          	blt	s8,s3,9aa0 <__multiply+0x44>
    9a8c:	00098713          	mv	a4,s3
    9a90:	00058413          	mv	s0,a1
    9a94:	000c0993          	mv	s3,s8
    9a98:	00060a13          	mv	s4,a2
    9a9c:	00070c13          	mv	s8,a4
    9aa0:	00842783          	lw	a5,8(s0)
    9aa4:	00442583          	lw	a1,4(s0)
    9aa8:	01898bb3          	add	s7,s3,s8
    9aac:	0177a7b3          	slt	a5,a5,s7
    9ab0:	00f585b3          	add	a1,a1,a5
    9ab4:	b45ff0ef          	jal	95f8 <_Balloc>
    9ab8:	00a12623          	sw	a0,12(sp)
    9abc:	22050863          	beqz	a0,9cec <__multiply+0x290>
    9ac0:	00c12783          	lw	a5,12(sp)
    9ac4:	03512a23          	sw	s5,52(sp)
    9ac8:	03612823          	sw	s6,48(sp)
    9acc:	002b9a93          	sll	s5,s7,0x2
    9ad0:	01478b13          	add	s6,a5,20
    9ad4:	015b0ab3          	add	s5,s6,s5
    9ad8:	000b0793          	mv	a5,s6
    9adc:	015b7863          	bgeu	s6,s5,9aec <__multiply+0x90>
    9ae0:	0007a023          	sw	zero,0(a5)
    9ae4:	00478793          	add	a5,a5,4
    9ae8:	ff57ece3          	bltu	a5,s5,9ae0 <__multiply+0x84>
    9aec:	014a0a13          	add	s4,s4,20
    9af0:	002c1c13          	sll	s8,s8,0x2
    9af4:	01440793          	add	a5,s0,20
    9af8:	018a0733          	add	a4,s4,s8
    9afc:	00299993          	sll	s3,s3,0x2
    9b00:	00f12423          	sw	a5,8(sp)
    9b04:	00e12023          	sw	a4,0(sp)
    9b08:	013789b3          	add	s3,a5,s3
    9b0c:	16ea7c63          	bgeu	s4,a4,9c84 <__multiply+0x228>
    9b10:	00400713          	li	a4,4
    9b14:	04912223          	sw	s1,68(sp)
    9b18:	05212023          	sw	s2,64(sp)
    9b1c:	03912223          	sw	s9,36(sp)
    9b20:	03a12023          	sw	s10,32(sp)
    9b24:	01b12e23          	sw	s11,28(sp)
    9b28:	01540793          	add	a5,s0,21
    9b2c:	00e12223          	sw	a4,4(sp)
    9b30:	1af9f263          	bgeu	s3,a5,9cd4 <__multiply+0x278>
    9b34:	00010437          	lui	s0,0x10
    9b38:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    9b3c:	01c0006f          	j	9b58 <__multiply+0xfc>
    9b40:	01095913          	srl	s2,s2,0x10
    9b44:	0a091063          	bnez	s2,9be4 <__multiply+0x188>
    9b48:	00012783          	lw	a5,0(sp)
    9b4c:	004a0a13          	add	s4,s4,4
    9b50:	004b0b13          	add	s6,s6,4
    9b54:	10fa7e63          	bgeu	s4,a5,9c70 <__multiply+0x214>
    9b58:	000a2903          	lw	s2,0(s4)
    9b5c:	008974b3          	and	s1,s2,s0
    9b60:	fe0480e3          	beqz	s1,9b40 <__multiply+0xe4>
    9b64:	00812c83          	lw	s9,8(sp)
    9b68:	000b0d13          	mv	s10,s6
    9b6c:	00000c13          	li	s8,0
    9b70:	000cad83          	lw	s11,0(s9)
    9b74:	000d2903          	lw	s2,0(s10)
    9b78:	00048593          	mv	a1,s1
    9b7c:	008df533          	and	a0,s11,s0
    9b80:	7e5040ef          	jal	eb64 <__mulsi3>
    9b84:	00897733          	and	a4,s2,s0
    9b88:	00e50733          	add	a4,a0,a4
    9b8c:	00048593          	mv	a1,s1
    9b90:	010dd513          	srl	a0,s11,0x10
    9b94:	01870c33          	add	s8,a4,s8
    9b98:	01095913          	srl	s2,s2,0x10
    9b9c:	7c9040ef          	jal	eb64 <__mulsi3>
    9ba0:	010c5713          	srl	a4,s8,0x10
    9ba4:	01250533          	add	a0,a0,s2
    9ba8:	00e50533          	add	a0,a0,a4
    9bac:	008c77b3          	and	a5,s8,s0
    9bb0:	01051713          	sll	a4,a0,0x10
    9bb4:	004d0d13          	add	s10,s10,4
    9bb8:	00f767b3          	or	a5,a4,a5
    9bbc:	004c8c93          	add	s9,s9,4
    9bc0:	fefd2e23          	sw	a5,-4(s10)
    9bc4:	01055c13          	srl	s8,a0,0x10
    9bc8:	fb3ce4e3          	bltu	s9,s3,9b70 <__multiply+0x114>
    9bcc:	00412783          	lw	a5,4(sp)
    9bd0:	00fb0733          	add	a4,s6,a5
    9bd4:	01872023          	sw	s8,0(a4)
    9bd8:	000a2903          	lw	s2,0(s4)
    9bdc:	01095913          	srl	s2,s2,0x10
    9be0:	f60904e3          	beqz	s2,9b48 <__multiply+0xec>
    9be4:	000b2c83          	lw	s9,0(s6)
    9be8:	00812d03          	lw	s10,8(sp)
    9bec:	000b0c13          	mv	s8,s6
    9bf0:	000c8493          	mv	s1,s9
    9bf4:	00000d93          	li	s11,0
    9bf8:	000d2503          	lw	a0,0(s10)
    9bfc:	00090593          	mv	a1,s2
    9c00:	0104d493          	srl	s1,s1,0x10
    9c04:	00857533          	and	a0,a0,s0
    9c08:	75d040ef          	jal	eb64 <__mulsi3>
    9c0c:	01b50733          	add	a4,a0,s11
    9c10:	00970db3          	add	s11,a4,s1
    9c14:	010d9593          	sll	a1,s11,0x10
    9c18:	008cf7b3          	and	a5,s9,s0
    9c1c:	00f5e7b3          	or	a5,a1,a5
    9c20:	00fc2023          	sw	a5,0(s8)
    9c24:	002d5503          	lhu	a0,2(s10)
    9c28:	004c2483          	lw	s1,4(s8)
    9c2c:	00090593          	mv	a1,s2
    9c30:	735040ef          	jal	eb64 <__mulsi3>
    9c34:	0084f7b3          	and	a5,s1,s0
    9c38:	010dd713          	srl	a4,s11,0x10
    9c3c:	00f507b3          	add	a5,a0,a5
    9c40:	004d0d13          	add	s10,s10,4
    9c44:	00e78cb3          	add	s9,a5,a4
    9c48:	004c0c13          	add	s8,s8,4
    9c4c:	010cdd93          	srl	s11,s9,0x10
    9c50:	fb3d64e3          	bltu	s10,s3,9bf8 <__multiply+0x19c>
    9c54:	00412783          	lw	a5,4(sp)
    9c58:	004a0a13          	add	s4,s4,4
    9c5c:	00fb0733          	add	a4,s6,a5
    9c60:	00012783          	lw	a5,0(sp)
    9c64:	01972023          	sw	s9,0(a4)
    9c68:	004b0b13          	add	s6,s6,4
    9c6c:	eefa66e3          	bltu	s4,a5,9b58 <__multiply+0xfc>
    9c70:	04412483          	lw	s1,68(sp)
    9c74:	04012903          	lw	s2,64(sp)
    9c78:	02412c83          	lw	s9,36(sp)
    9c7c:	02012d03          	lw	s10,32(sp)
    9c80:	01c12d83          	lw	s11,28(sp)
    9c84:	01704863          	bgtz	s7,9c94 <__multiply+0x238>
    9c88:	0180006f          	j	9ca0 <__multiply+0x244>
    9c8c:	fffb8b93          	add	s7,s7,-1
    9c90:	000b8863          	beqz	s7,9ca0 <__multiply+0x244>
    9c94:	ffcaa783          	lw	a5,-4(s5)
    9c98:	ffca8a93          	add	s5,s5,-4
    9c9c:	fe0788e3          	beqz	a5,9c8c <__multiply+0x230>
    9ca0:	00c12783          	lw	a5,12(sp)
    9ca4:	04c12083          	lw	ra,76(sp)
    9ca8:	04812403          	lw	s0,72(sp)
    9cac:	0177a823          	sw	s7,16(a5)
    9cb0:	03412a83          	lw	s5,52(sp)
    9cb4:	03012b03          	lw	s6,48(sp)
    9cb8:	03c12983          	lw	s3,60(sp)
    9cbc:	03812a03          	lw	s4,56(sp)
    9cc0:	02c12b83          	lw	s7,44(sp)
    9cc4:	02812c03          	lw	s8,40(sp)
    9cc8:	00078513          	mv	a0,a5
    9ccc:	05010113          	add	sp,sp,80
    9cd0:	00008067          	ret
    9cd4:	408987b3          	sub	a5,s3,s0
    9cd8:	feb78793          	add	a5,a5,-21
    9cdc:	ffc7f793          	and	a5,a5,-4
    9ce0:	00478793          	add	a5,a5,4
    9ce4:	00f12223          	sw	a5,4(sp)
    9ce8:	e4dff06f          	j	9b34 <__multiply+0xd8>
    9cec:	00005697          	auipc	a3,0x5
    9cf0:	2a068693          	add	a3,a3,672 # ef8c <__fini_array_end+0x230>
    9cf4:	00000613          	li	a2,0
    9cf8:	16200593          	li	a1,354
    9cfc:	00005517          	auipc	a0,0x5
    9d00:	32450513          	add	a0,a0,804 # f020 <__fini_array_end+0x2c4>
    9d04:	04912223          	sw	s1,68(sp)
    9d08:	05212023          	sw	s2,64(sp)
    9d0c:	03512a23          	sw	s5,52(sp)
    9d10:	03612823          	sw	s6,48(sp)
    9d14:	03912223          	sw	s9,36(sp)
    9d18:	03a12023          	sw	s10,32(sp)
    9d1c:	01b12e23          	sw	s11,28(sp)
    9d20:	0fc010ef          	jal	ae1c <__assert_func>

00009d24 <__pow5mult>:
    9d24:	fe010113          	add	sp,sp,-32
    9d28:	00812c23          	sw	s0,24(sp)
    9d2c:	01212823          	sw	s2,16(sp)
    9d30:	01312623          	sw	s3,12(sp)
    9d34:	00112e23          	sw	ra,28(sp)
    9d38:	00367793          	and	a5,a2,3
    9d3c:	00060413          	mv	s0,a2
    9d40:	00050993          	mv	s3,a0
    9d44:	00058913          	mv	s2,a1
    9d48:	0a079c63          	bnez	a5,9e00 <__pow5mult+0xdc>
    9d4c:	40245413          	sra	s0,s0,0x2
    9d50:	06040a63          	beqz	s0,9dc4 <__pow5mult+0xa0>
    9d54:	00912a23          	sw	s1,20(sp)
    9d58:	0409a483          	lw	s1,64(s3)
    9d5c:	0c048663          	beqz	s1,9e28 <__pow5mult+0x104>
    9d60:	00147793          	and	a5,s0,1
    9d64:	02079063          	bnez	a5,9d84 <__pow5mult+0x60>
    9d68:	40145413          	sra	s0,s0,0x1
    9d6c:	04040a63          	beqz	s0,9dc0 <__pow5mult+0x9c>
    9d70:	0004a503          	lw	a0,0(s1)
    9d74:	06050663          	beqz	a0,9de0 <__pow5mult+0xbc>
    9d78:	00050493          	mv	s1,a0
    9d7c:	00147793          	and	a5,s0,1
    9d80:	fe0784e3          	beqz	a5,9d68 <__pow5mult+0x44>
    9d84:	00048613          	mv	a2,s1
    9d88:	00090593          	mv	a1,s2
    9d8c:	00098513          	mv	a0,s3
    9d90:	ccdff0ef          	jal	9a5c <__multiply>
    9d94:	02090063          	beqz	s2,9db4 <__pow5mult+0x90>
    9d98:	00492703          	lw	a4,4(s2)
    9d9c:	0449a783          	lw	a5,68(s3)
    9da0:	00271713          	sll	a4,a4,0x2
    9da4:	00e787b3          	add	a5,a5,a4
    9da8:	0007a703          	lw	a4,0(a5)
    9dac:	00e92023          	sw	a4,0(s2)
    9db0:	0127a023          	sw	s2,0(a5)
    9db4:	40145413          	sra	s0,s0,0x1
    9db8:	00050913          	mv	s2,a0
    9dbc:	fa041ae3          	bnez	s0,9d70 <__pow5mult+0x4c>
    9dc0:	01412483          	lw	s1,20(sp)
    9dc4:	01c12083          	lw	ra,28(sp)
    9dc8:	01812403          	lw	s0,24(sp)
    9dcc:	00c12983          	lw	s3,12(sp)
    9dd0:	00090513          	mv	a0,s2
    9dd4:	01012903          	lw	s2,16(sp)
    9dd8:	02010113          	add	sp,sp,32
    9ddc:	00008067          	ret
    9de0:	00048613          	mv	a2,s1
    9de4:	00048593          	mv	a1,s1
    9de8:	00098513          	mv	a0,s3
    9dec:	c71ff0ef          	jal	9a5c <__multiply>
    9df0:	00a4a023          	sw	a0,0(s1)
    9df4:	00052023          	sw	zero,0(a0)
    9df8:	00050493          	mv	s1,a0
    9dfc:	f81ff06f          	j	9d7c <__pow5mult+0x58>
    9e00:	fff78793          	add	a5,a5,-1
    9e04:	00005717          	auipc	a4,0x5
    9e08:	79070713          	add	a4,a4,1936 # f594 <p05.0>
    9e0c:	00279793          	sll	a5,a5,0x2
    9e10:	00f707b3          	add	a5,a4,a5
    9e14:	0007a603          	lw	a2,0(a5)
    9e18:	00000693          	li	a3,0
    9e1c:	8b5ff0ef          	jal	96d0 <__multadd>
    9e20:	00050913          	mv	s2,a0
    9e24:	f29ff06f          	j	9d4c <__pow5mult+0x28>
    9e28:	00100593          	li	a1,1
    9e2c:	00098513          	mv	a0,s3
    9e30:	fc8ff0ef          	jal	95f8 <_Balloc>
    9e34:	00050493          	mv	s1,a0
    9e38:	02050063          	beqz	a0,9e58 <__pow5mult+0x134>
    9e3c:	27100793          	li	a5,625
    9e40:	00f52a23          	sw	a5,20(a0)
    9e44:	00100793          	li	a5,1
    9e48:	00f52823          	sw	a5,16(a0)
    9e4c:	04a9a023          	sw	a0,64(s3)
    9e50:	00052023          	sw	zero,0(a0)
    9e54:	f0dff06f          	j	9d60 <__pow5mult+0x3c>
    9e58:	00005697          	auipc	a3,0x5
    9e5c:	13468693          	add	a3,a3,308 # ef8c <__fini_array_end+0x230>
    9e60:	00000613          	li	a2,0
    9e64:	14500593          	li	a1,325
    9e68:	00005517          	auipc	a0,0x5
    9e6c:	1b850513          	add	a0,a0,440 # f020 <__fini_array_end+0x2c4>
    9e70:	7ad000ef          	jal	ae1c <__assert_func>

00009e74 <__lshift>:
    9e74:	fe010113          	add	sp,sp,-32
    9e78:	01512223          	sw	s5,4(sp)
    9e7c:	0105aa83          	lw	s5,16(a1)
    9e80:	0085a783          	lw	a5,8(a1)
    9e84:	01312623          	sw	s3,12(sp)
    9e88:	40565993          	sra	s3,a2,0x5
    9e8c:	01598ab3          	add	s5,s3,s5
    9e90:	00812c23          	sw	s0,24(sp)
    9e94:	00912a23          	sw	s1,20(sp)
    9e98:	01212823          	sw	s2,16(sp)
    9e9c:	01412423          	sw	s4,8(sp)
    9ea0:	00112e23          	sw	ra,28(sp)
    9ea4:	001a8913          	add	s2,s5,1
    9ea8:	00058493          	mv	s1,a1
    9eac:	00060413          	mv	s0,a2
    9eb0:	0045a583          	lw	a1,4(a1)
    9eb4:	00050a13          	mv	s4,a0
    9eb8:	0127d863          	bge	a5,s2,9ec8 <__lshift+0x54>
    9ebc:	00179793          	sll	a5,a5,0x1
    9ec0:	00158593          	add	a1,a1,1
    9ec4:	ff27cce3          	blt	a5,s2,9ebc <__lshift+0x48>
    9ec8:	000a0513          	mv	a0,s4
    9ecc:	f2cff0ef          	jal	95f8 <_Balloc>
    9ed0:	10050c63          	beqz	a0,9fe8 <__lshift+0x174>
    9ed4:	01450813          	add	a6,a0,20
    9ed8:	03305463          	blez	s3,9f00 <__lshift+0x8c>
    9edc:	00598993          	add	s3,s3,5
    9ee0:	00299993          	sll	s3,s3,0x2
    9ee4:	01350733          	add	a4,a0,s3
    9ee8:	00080793          	mv	a5,a6
    9eec:	00478793          	add	a5,a5,4
    9ef0:	fe07ae23          	sw	zero,-4(a5)
    9ef4:	fee79ce3          	bne	a5,a4,9eec <__lshift+0x78>
    9ef8:	fec98993          	add	s3,s3,-20
    9efc:	01380833          	add	a6,a6,s3
    9f00:	0104a883          	lw	a7,16(s1)
    9f04:	01448793          	add	a5,s1,20
    9f08:	01f47613          	and	a2,s0,31
    9f0c:	00289893          	sll	a7,a7,0x2
    9f10:	011788b3          	add	a7,a5,a7
    9f14:	0a060463          	beqz	a2,9fbc <__lshift+0x148>
    9f18:	02000593          	li	a1,32
    9f1c:	40c585b3          	sub	a1,a1,a2
    9f20:	00080313          	mv	t1,a6
    9f24:	00000693          	li	a3,0
    9f28:	0007a703          	lw	a4,0(a5)
    9f2c:	00430313          	add	t1,t1,4
    9f30:	00478793          	add	a5,a5,4
    9f34:	00c71733          	sll	a4,a4,a2
    9f38:	00d76733          	or	a4,a4,a3
    9f3c:	fee32e23          	sw	a4,-4(t1)
    9f40:	ffc7a683          	lw	a3,-4(a5)
    9f44:	00b6d6b3          	srl	a3,a3,a1
    9f48:	ff17e0e3          	bltu	a5,a7,9f28 <__lshift+0xb4>
    9f4c:	01548793          	add	a5,s1,21
    9f50:	00400713          	li	a4,4
    9f54:	00f8ea63          	bltu	a7,a5,9f68 <__lshift+0xf4>
    9f58:	409887b3          	sub	a5,a7,s1
    9f5c:	feb78793          	add	a5,a5,-21
    9f60:	ffc7f793          	and	a5,a5,-4
    9f64:	00478713          	add	a4,a5,4
    9f68:	00e80833          	add	a6,a6,a4
    9f6c:	00d82023          	sw	a3,0(a6)
    9f70:	00069463          	bnez	a3,9f78 <__lshift+0x104>
    9f74:	000a8913          	mv	s2,s5
    9f78:	0044a703          	lw	a4,4(s1)
    9f7c:	044a2783          	lw	a5,68(s4)
    9f80:	01c12083          	lw	ra,28(sp)
    9f84:	00271713          	sll	a4,a4,0x2
    9f88:	00e787b3          	add	a5,a5,a4
    9f8c:	0007a703          	lw	a4,0(a5)
    9f90:	01252823          	sw	s2,16(a0)
    9f94:	01812403          	lw	s0,24(sp)
    9f98:	00e4a023          	sw	a4,0(s1)
    9f9c:	0097a023          	sw	s1,0(a5)
    9fa0:	01012903          	lw	s2,16(sp)
    9fa4:	01412483          	lw	s1,20(sp)
    9fa8:	00c12983          	lw	s3,12(sp)
    9fac:	00812a03          	lw	s4,8(sp)
    9fb0:	00412a83          	lw	s5,4(sp)
    9fb4:	02010113          	add	sp,sp,32
    9fb8:	00008067          	ret
    9fbc:	0007a703          	lw	a4,0(a5)
    9fc0:	00478793          	add	a5,a5,4
    9fc4:	00480813          	add	a6,a6,4
    9fc8:	fee82e23          	sw	a4,-4(a6)
    9fcc:	fb17f4e3          	bgeu	a5,a7,9f74 <__lshift+0x100>
    9fd0:	0007a703          	lw	a4,0(a5)
    9fd4:	00478793          	add	a5,a5,4
    9fd8:	00480813          	add	a6,a6,4
    9fdc:	fee82e23          	sw	a4,-4(a6)
    9fe0:	fd17eee3          	bltu	a5,a7,9fbc <__lshift+0x148>
    9fe4:	f91ff06f          	j	9f74 <__lshift+0x100>
    9fe8:	00005697          	auipc	a3,0x5
    9fec:	fa468693          	add	a3,a3,-92 # ef8c <__fini_array_end+0x230>
    9ff0:	00000613          	li	a2,0
    9ff4:	1de00593          	li	a1,478
    9ff8:	00005517          	auipc	a0,0x5
    9ffc:	02850513          	add	a0,a0,40 # f020 <__fini_array_end+0x2c4>
    a000:	61d000ef          	jal	ae1c <__assert_func>

0000a004 <__mcmp>:
    a004:	01052703          	lw	a4,16(a0)
    a008:	0105a783          	lw	a5,16(a1)
    a00c:	00050813          	mv	a6,a0
    a010:	40f70533          	sub	a0,a4,a5
    a014:	04f71263          	bne	a4,a5,a058 <__mcmp+0x54>
    a018:	00279793          	sll	a5,a5,0x2
    a01c:	01480813          	add	a6,a6,20
    a020:	01458593          	add	a1,a1,20
    a024:	00f80733          	add	a4,a6,a5
    a028:	00f587b3          	add	a5,a1,a5
    a02c:	0080006f          	j	a034 <__mcmp+0x30>
    a030:	02e87463          	bgeu	a6,a4,a058 <__mcmp+0x54>
    a034:	ffc72603          	lw	a2,-4(a4)
    a038:	ffc7a683          	lw	a3,-4(a5)
    a03c:	ffc70713          	add	a4,a4,-4
    a040:	ffc78793          	add	a5,a5,-4
    a044:	fed606e3          	beq	a2,a3,a030 <__mcmp+0x2c>
    a048:	00100513          	li	a0,1
    a04c:	00d67663          	bgeu	a2,a3,a058 <__mcmp+0x54>
    a050:	fff00513          	li	a0,-1
    a054:	00008067          	ret
    a058:	00008067          	ret

0000a05c <__mdiff>:
    a05c:	0105a703          	lw	a4,16(a1)
    a060:	01062783          	lw	a5,16(a2)
    a064:	ff010113          	add	sp,sp,-16
    a068:	00812423          	sw	s0,8(sp)
    a06c:	00912223          	sw	s1,4(sp)
    a070:	00112623          	sw	ra,12(sp)
    a074:	01212023          	sw	s2,0(sp)
    a078:	00058413          	mv	s0,a1
    a07c:	00060493          	mv	s1,a2
    a080:	40f706b3          	sub	a3,a4,a5
    a084:	18f71e63          	bne	a4,a5,a220 <__mdiff+0x1c4>
    a088:	00279693          	sll	a3,a5,0x2
    a08c:	01458613          	add	a2,a1,20
    a090:	01448713          	add	a4,s1,20
    a094:	00d607b3          	add	a5,a2,a3
    a098:	00d70733          	add	a4,a4,a3
    a09c:	0080006f          	j	a0a4 <__mdiff+0x48>
    a0a0:	18f67c63          	bgeu	a2,a5,a238 <__mdiff+0x1dc>
    a0a4:	ffc7a583          	lw	a1,-4(a5)
    a0a8:	ffc72683          	lw	a3,-4(a4)
    a0ac:	ffc78793          	add	a5,a5,-4
    a0b0:	ffc70713          	add	a4,a4,-4
    a0b4:	fed586e3          	beq	a1,a3,a0a0 <__mdiff+0x44>
    a0b8:	00100913          	li	s2,1
    a0bc:	00d5ea63          	bltu	a1,a3,a0d0 <__mdiff+0x74>
    a0c0:	00048793          	mv	a5,s1
    a0c4:	00000913          	li	s2,0
    a0c8:	00040493          	mv	s1,s0
    a0cc:	00078413          	mv	s0,a5
    a0d0:	0044a583          	lw	a1,4(s1)
    a0d4:	d24ff0ef          	jal	95f8 <_Balloc>
    a0d8:	1a050663          	beqz	a0,a284 <__mdiff+0x228>
    a0dc:	0104a883          	lw	a7,16(s1)
    a0e0:	01042283          	lw	t0,16(s0)
    a0e4:	01448f93          	add	t6,s1,20
    a0e8:	00289313          	sll	t1,a7,0x2
    a0ec:	01440813          	add	a6,s0,20
    a0f0:	00229293          	sll	t0,t0,0x2
    a0f4:	01450593          	add	a1,a0,20
    a0f8:	00010e37          	lui	t3,0x10
    a0fc:	01252623          	sw	s2,12(a0)
    a100:	006f8333          	add	t1,t6,t1
    a104:	005802b3          	add	t0,a6,t0
    a108:	00058f13          	mv	t5,a1
    a10c:	000f8e93          	mv	t4,t6
    a110:	00000693          	li	a3,0
    a114:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    a118:	000ea703          	lw	a4,0(t4)
    a11c:	00082603          	lw	a2,0(a6)
    a120:	004f0f13          	add	t5,t5,4
    a124:	01c777b3          	and	a5,a4,t3
    a128:	01c673b3          	and	t2,a2,t3
    a12c:	407787b3          	sub	a5,a5,t2
    a130:	00d787b3          	add	a5,a5,a3
    a134:	01075713          	srl	a4,a4,0x10
    a138:	01065613          	srl	a2,a2,0x10
    a13c:	4107d693          	sra	a3,a5,0x10
    a140:	40c70733          	sub	a4,a4,a2
    a144:	00d70733          	add	a4,a4,a3
    a148:	01071693          	sll	a3,a4,0x10
    a14c:	01c7f7b3          	and	a5,a5,t3
    a150:	00d7e7b3          	or	a5,a5,a3
    a154:	00480813          	add	a6,a6,4
    a158:	feff2e23          	sw	a5,-4(t5)
    a15c:	004e8e93          	add	t4,t4,4
    a160:	41075693          	sra	a3,a4,0x10
    a164:	fa586ae3          	bltu	a6,t0,a118 <__mdiff+0xbc>
    a168:	01540713          	add	a4,s0,21
    a16c:	40828433          	sub	s0,t0,s0
    a170:	feb40413          	add	s0,s0,-21
    a174:	00e2b2b3          	sltu	t0,t0,a4
    a178:	0012cf13          	xor	t5,t0,1
    a17c:	00245413          	srl	s0,s0,0x2
    a180:	00400713          	li	a4,4
    a184:	0a028463          	beqz	t0,a22c <__mdiff+0x1d0>
    a188:	00ef8fb3          	add	t6,t6,a4
    a18c:	00e58833          	add	a6,a1,a4
    a190:	00010eb7          	lui	t4,0x10
    a194:	00080e13          	mv	t3,a6
    a198:	000f8613          	mv	a2,t6
    a19c:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    a1a0:	0c6ff463          	bgeu	t6,t1,a268 <__mdiff+0x20c>
    a1a4:	00062783          	lw	a5,0(a2)
    a1a8:	004e0e13          	add	t3,t3,4
    a1ac:	00460613          	add	a2,a2,4
    a1b0:	01d7f733          	and	a4,a5,t4
    a1b4:	00d70733          	add	a4,a4,a3
    a1b8:	0107d593          	srl	a1,a5,0x10
    a1bc:	41075713          	sra	a4,a4,0x10
    a1c0:	00b70733          	add	a4,a4,a1
    a1c4:	00d787b3          	add	a5,a5,a3
    a1c8:	01d7f7b3          	and	a5,a5,t4
    a1cc:	01071693          	sll	a3,a4,0x10
    a1d0:	00d7e7b3          	or	a5,a5,a3
    a1d4:	fefe2e23          	sw	a5,-4(t3)
    a1d8:	41075693          	sra	a3,a4,0x10
    a1dc:	fc6664e3          	bltu	a2,t1,a1a4 <__mdiff+0x148>
    a1e0:	fff30313          	add	t1,t1,-1
    a1e4:	41f30333          	sub	t1,t1,t6
    a1e8:	ffc37313          	and	t1,t1,-4
    a1ec:	00680733          	add	a4,a6,t1
    a1f0:	00079a63          	bnez	a5,a204 <__mdiff+0x1a8>
    a1f4:	ffc72783          	lw	a5,-4(a4)
    a1f8:	fff88893          	add	a7,a7,-1
    a1fc:	ffc70713          	add	a4,a4,-4
    a200:	fe078ae3          	beqz	a5,a1f4 <__mdiff+0x198>
    a204:	00c12083          	lw	ra,12(sp)
    a208:	00812403          	lw	s0,8(sp)
    a20c:	01152823          	sw	a7,16(a0)
    a210:	00412483          	lw	s1,4(sp)
    a214:	00012903          	lw	s2,0(sp)
    a218:	01010113          	add	sp,sp,16
    a21c:	00008067          	ret
    a220:	00100913          	li	s2,1
    a224:	e806dee3          	bgez	a3,a0c0 <__mdiff+0x64>
    a228:	ea9ff06f          	j	a0d0 <__mdiff+0x74>
    a22c:	00140713          	add	a4,s0,1
    a230:	00271713          	sll	a4,a4,0x2
    a234:	f55ff06f          	j	a188 <__mdiff+0x12c>
    a238:	00000593          	li	a1,0
    a23c:	bbcff0ef          	jal	95f8 <_Balloc>
    a240:	06050063          	beqz	a0,a2a0 <__mdiff+0x244>
    a244:	00c12083          	lw	ra,12(sp)
    a248:	00812403          	lw	s0,8(sp)
    a24c:	00100793          	li	a5,1
    a250:	00f52823          	sw	a5,16(a0)
    a254:	00052a23          	sw	zero,20(a0)
    a258:	00412483          	lw	s1,4(sp)
    a25c:	00012903          	lw	s2,0(sp)
    a260:	01010113          	add	sp,sp,16
    a264:	00008067          	ret
    a268:	00000713          	li	a4,0
    a26c:	000f1663          	bnez	t5,a278 <__mdiff+0x21c>
    a270:	00e58733          	add	a4,a1,a4
    a274:	f7dff06f          	j	a1f0 <__mdiff+0x194>
    a278:	00241713          	sll	a4,s0,0x2
    a27c:	00e58733          	add	a4,a1,a4
    a280:	f71ff06f          	j	a1f0 <__mdiff+0x194>
    a284:	00005697          	auipc	a3,0x5
    a288:	d0868693          	add	a3,a3,-760 # ef8c <__fini_array_end+0x230>
    a28c:	00000613          	li	a2,0
    a290:	24500593          	li	a1,581
    a294:	00005517          	auipc	a0,0x5
    a298:	d8c50513          	add	a0,a0,-628 # f020 <__fini_array_end+0x2c4>
    a29c:	381000ef          	jal	ae1c <__assert_func>
    a2a0:	00005697          	auipc	a3,0x5
    a2a4:	cec68693          	add	a3,a3,-788 # ef8c <__fini_array_end+0x230>
    a2a8:	00000613          	li	a2,0
    a2ac:	23700593          	li	a1,567
    a2b0:	00005517          	auipc	a0,0x5
    a2b4:	d7050513          	add	a0,a0,-656 # f020 <__fini_array_end+0x2c4>
    a2b8:	365000ef          	jal	ae1c <__assert_func>

0000a2bc <__d2b>:
    a2bc:	fd010113          	add	sp,sp,-48
    a2c0:	01512a23          	sw	s5,20(sp)
    a2c4:	00058a93          	mv	s5,a1
    a2c8:	00100593          	li	a1,1
    a2cc:	02912223          	sw	s1,36(sp)
    a2d0:	01312e23          	sw	s3,28(sp)
    a2d4:	01412c23          	sw	s4,24(sp)
    a2d8:	02112623          	sw	ra,44(sp)
    a2dc:	02812423          	sw	s0,40(sp)
    a2e0:	03212023          	sw	s2,32(sp)
    a2e4:	00060493          	mv	s1,a2
    a2e8:	00068a13          	mv	s4,a3
    a2ec:	00070993          	mv	s3,a4
    a2f0:	b08ff0ef          	jal	95f8 <_Balloc>
    a2f4:	10050263          	beqz	a0,a3f8 <__d2b+0x13c>
    a2f8:	00100737          	lui	a4,0x100
    a2fc:	0144d913          	srl	s2,s1,0x14
    a300:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a304:	7ff97913          	and	s2,s2,2047
    a308:	00050413          	mv	s0,a0
    a30c:	0097f7b3          	and	a5,a5,s1
    a310:	00090463          	beqz	s2,a318 <__d2b+0x5c>
    a314:	00e7e7b3          	or	a5,a5,a4
    a318:	00f12623          	sw	a5,12(sp)
    a31c:	060a9263          	bnez	s5,a380 <__d2b+0xc4>
    a320:	00c10513          	add	a0,sp,12
    a324:	da8ff0ef          	jal	98cc <__lo0bits>
    a328:	00c12703          	lw	a4,12(sp)
    a32c:	00100493          	li	s1,1
    a330:	00942823          	sw	s1,16(s0)
    a334:	00e42a23          	sw	a4,20(s0)
    a338:	02050793          	add	a5,a0,32
    a33c:	08090863          	beqz	s2,a3cc <__d2b+0x110>
    a340:	bcd90913          	add	s2,s2,-1075
    a344:	00f90933          	add	s2,s2,a5
    a348:	03500493          	li	s1,53
    a34c:	012a2023          	sw	s2,0(s4)
    a350:	40f48533          	sub	a0,s1,a5
    a354:	00a9a023          	sw	a0,0(s3)
    a358:	02c12083          	lw	ra,44(sp)
    a35c:	00040513          	mv	a0,s0
    a360:	02812403          	lw	s0,40(sp)
    a364:	02412483          	lw	s1,36(sp)
    a368:	02012903          	lw	s2,32(sp)
    a36c:	01c12983          	lw	s3,28(sp)
    a370:	01812a03          	lw	s4,24(sp)
    a374:	01412a83          	lw	s5,20(sp)
    a378:	03010113          	add	sp,sp,48
    a37c:	00008067          	ret
    a380:	00810513          	add	a0,sp,8
    a384:	01512423          	sw	s5,8(sp)
    a388:	d44ff0ef          	jal	98cc <__lo0bits>
    a38c:	00c12703          	lw	a4,12(sp)
    a390:	00050793          	mv	a5,a0
    a394:	04050e63          	beqz	a0,a3f0 <__d2b+0x134>
    a398:	00812603          	lw	a2,8(sp)
    a39c:	02000693          	li	a3,32
    a3a0:	40a686b3          	sub	a3,a3,a0
    a3a4:	00d716b3          	sll	a3,a4,a3
    a3a8:	00a75733          	srl	a4,a4,a0
    a3ac:	00c6e6b3          	or	a3,a3,a2
    a3b0:	00e12623          	sw	a4,12(sp)
    a3b4:	00e034b3          	snez	s1,a4
    a3b8:	00148493          	add	s1,s1,1
    a3bc:	00d42a23          	sw	a3,20(s0)
    a3c0:	00e42c23          	sw	a4,24(s0)
    a3c4:	00942823          	sw	s1,16(s0)
    a3c8:	f6091ce3          	bnez	s2,a340 <__d2b+0x84>
    a3cc:	00249713          	sll	a4,s1,0x2
    a3d0:	00e40733          	add	a4,s0,a4
    a3d4:	01072503          	lw	a0,16(a4)
    a3d8:	bce78793          	add	a5,a5,-1074
    a3dc:	00fa2023          	sw	a5,0(s4)
    a3e0:	c74ff0ef          	jal	9854 <__hi0bits>
    a3e4:	00549493          	sll	s1,s1,0x5
    a3e8:	40a48533          	sub	a0,s1,a0
    a3ec:	f69ff06f          	j	a354 <__d2b+0x98>
    a3f0:	00812683          	lw	a3,8(sp)
    a3f4:	fc1ff06f          	j	a3b4 <__d2b+0xf8>
    a3f8:	00005697          	auipc	a3,0x5
    a3fc:	b9468693          	add	a3,a3,-1132 # ef8c <__fini_array_end+0x230>
    a400:	00000613          	li	a2,0
    a404:	30f00593          	li	a1,783
    a408:	00005517          	auipc	a0,0x5
    a40c:	c1850513          	add	a0,a0,-1000 # f020 <__fini_array_end+0x2c4>
    a410:	20d000ef          	jal	ae1c <__assert_func>

0000a414 <_realloc_r>:
    a414:	fd010113          	add	sp,sp,-48
    a418:	02912223          	sw	s1,36(sp)
    a41c:	02112623          	sw	ra,44(sp)
    a420:	00060493          	mv	s1,a2
    a424:	1e058863          	beqz	a1,a614 <_realloc_r+0x200>
    a428:	02812423          	sw	s0,40(sp)
    a42c:	03212023          	sw	s2,32(sp)
    a430:	00058413          	mv	s0,a1
    a434:	01312e23          	sw	s3,28(sp)
    a438:	01512a23          	sw	s5,20(sp)
    a43c:	01412c23          	sw	s4,24(sp)
    a440:	00050913          	mv	s2,a0
    a444:	8b1f70ef          	jal	1cf4 <__malloc_lock>
    a448:	ffc42703          	lw	a4,-4(s0)
    a44c:	00b48793          	add	a5,s1,11
    a450:	01600693          	li	a3,22
    a454:	ff840a93          	add	s5,s0,-8
    a458:	ffc77993          	and	s3,a4,-4
    a45c:	10f6f263          	bgeu	a3,a5,a560 <_realloc_r+0x14c>
    a460:	ff87fa13          	and	s4,a5,-8
    a464:	1007c263          	bltz	a5,a568 <_realloc_r+0x154>
    a468:	109a6063          	bltu	s4,s1,a568 <_realloc_r+0x154>
    a46c:	1349d263          	bge	s3,s4,a590 <_realloc_r+0x17c>
    a470:	01812423          	sw	s8,8(sp)
    a474:	7fff6c17          	auipc	s8,0x7fff6
    a478:	cacc0c13          	add	s8,s8,-852 # 80000120 <__malloc_av_>
    a47c:	008c2603          	lw	a2,8(s8)
    a480:	013a86b3          	add	a3,s5,s3
    a484:	0046a783          	lw	a5,4(a3)
    a488:	1cd60863          	beq	a2,a3,a658 <_realloc_r+0x244>
    a48c:	ffe7f613          	and	a2,a5,-2
    a490:	00c68633          	add	a2,a3,a2
    a494:	00462603          	lw	a2,4(a2)
    a498:	00167613          	and	a2,a2,1
    a49c:	14061a63          	bnez	a2,a5f0 <_realloc_r+0x1dc>
    a4a0:	ffc7f793          	and	a5,a5,-4
    a4a4:	00f98633          	add	a2,s3,a5
    a4a8:	0d465863          	bge	a2,s4,a578 <_realloc_r+0x164>
    a4ac:	00177713          	and	a4,a4,1
    a4b0:	02071c63          	bnez	a4,a4e8 <_realloc_r+0xd4>
    a4b4:	01712623          	sw	s7,12(sp)
    a4b8:	ff842b83          	lw	s7,-8(s0)
    a4bc:	01612823          	sw	s6,16(sp)
    a4c0:	417a8bb3          	sub	s7,s5,s7
    a4c4:	004ba703          	lw	a4,4(s7)
    a4c8:	ffc77713          	and	a4,a4,-4
    a4cc:	00e787b3          	add	a5,a5,a4
    a4d0:	01378b33          	add	s6,a5,s3
    a4d4:	334b5c63          	bge	s6,s4,a80c <_realloc_r+0x3f8>
    a4d8:	00e98b33          	add	s6,s3,a4
    a4dc:	294b5863          	bge	s6,s4,a76c <_realloc_r+0x358>
    a4e0:	01012b03          	lw	s6,16(sp)
    a4e4:	00c12b83          	lw	s7,12(sp)
    a4e8:	00048593          	mv	a1,s1
    a4ec:	00090513          	mv	a0,s2
    a4f0:	824f70ef          	jal	1514 <_malloc_r>
    a4f4:	00050493          	mv	s1,a0
    a4f8:	40050863          	beqz	a0,a908 <_realloc_r+0x4f4>
    a4fc:	ffc42783          	lw	a5,-4(s0)
    a500:	ff850713          	add	a4,a0,-8
    a504:	ffe7f793          	and	a5,a5,-2
    a508:	00fa87b3          	add	a5,s5,a5
    a50c:	24e78663          	beq	a5,a4,a758 <_realloc_r+0x344>
    a510:	ffc98613          	add	a2,s3,-4
    a514:	02400793          	li	a5,36
    a518:	2ec7e463          	bltu	a5,a2,a800 <_realloc_r+0x3ec>
    a51c:	01300713          	li	a4,19
    a520:	20c76a63          	bltu	a4,a2,a734 <_realloc_r+0x320>
    a524:	00050793          	mv	a5,a0
    a528:	00040713          	mv	a4,s0
    a52c:	00072683          	lw	a3,0(a4)
    a530:	00d7a023          	sw	a3,0(a5)
    a534:	00472683          	lw	a3,4(a4)
    a538:	00d7a223          	sw	a3,4(a5)
    a53c:	00872703          	lw	a4,8(a4)
    a540:	00e7a423          	sw	a4,8(a5)
    a544:	00040593          	mv	a1,s0
    a548:	00090513          	mv	a0,s2
    a54c:	cbdf60ef          	jal	1208 <_free_r>
    a550:	00090513          	mv	a0,s2
    a554:	facf70ef          	jal	1d00 <__malloc_unlock>
    a558:	00812c03          	lw	s8,8(sp)
    a55c:	06c0006f          	j	a5c8 <_realloc_r+0x1b4>
    a560:	01000a13          	li	s4,16
    a564:	f09a74e3          	bgeu	s4,s1,a46c <_realloc_r+0x58>
    a568:	00c00793          	li	a5,12
    a56c:	00f92023          	sw	a5,0(s2)
    a570:	00000493          	li	s1,0
    a574:	0540006f          	j	a5c8 <_realloc_r+0x1b4>
    a578:	00c6a783          	lw	a5,12(a3)
    a57c:	0086a703          	lw	a4,8(a3)
    a580:	00812c03          	lw	s8,8(sp)
    a584:	00060993          	mv	s3,a2
    a588:	00f72623          	sw	a5,12(a4)
    a58c:	00e7a423          	sw	a4,8(a5)
    a590:	004aa783          	lw	a5,4(s5)
    a594:	414986b3          	sub	a3,s3,s4
    a598:	00f00613          	li	a2,15
    a59c:	0017f793          	and	a5,a5,1
    a5a0:	013a8733          	add	a4,s5,s3
    a5a4:	08d66263          	bltu	a2,a3,a628 <_realloc_r+0x214>
    a5a8:	0137e7b3          	or	a5,a5,s3
    a5ac:	00faa223          	sw	a5,4(s5)
    a5b0:	00472783          	lw	a5,4(a4)
    a5b4:	0017e793          	or	a5,a5,1
    a5b8:	00f72223          	sw	a5,4(a4)
    a5bc:	00090513          	mv	a0,s2
    a5c0:	f40f70ef          	jal	1d00 <__malloc_unlock>
    a5c4:	00040493          	mv	s1,s0
    a5c8:	02812403          	lw	s0,40(sp)
    a5cc:	02c12083          	lw	ra,44(sp)
    a5d0:	02012903          	lw	s2,32(sp)
    a5d4:	01c12983          	lw	s3,28(sp)
    a5d8:	01812a03          	lw	s4,24(sp)
    a5dc:	01412a83          	lw	s5,20(sp)
    a5e0:	00048513          	mv	a0,s1
    a5e4:	02412483          	lw	s1,36(sp)
    a5e8:	03010113          	add	sp,sp,48
    a5ec:	00008067          	ret
    a5f0:	00177713          	and	a4,a4,1
    a5f4:	ee071ae3          	bnez	a4,a4e8 <_realloc_r+0xd4>
    a5f8:	01712623          	sw	s7,12(sp)
    a5fc:	ff842b83          	lw	s7,-8(s0)
    a600:	01612823          	sw	s6,16(sp)
    a604:	417a8bb3          	sub	s7,s5,s7
    a608:	004ba703          	lw	a4,4(s7)
    a60c:	ffc77713          	and	a4,a4,-4
    a610:	ec9ff06f          	j	a4d8 <_realloc_r+0xc4>
    a614:	02c12083          	lw	ra,44(sp)
    a618:	02412483          	lw	s1,36(sp)
    a61c:	00060593          	mv	a1,a2
    a620:	03010113          	add	sp,sp,48
    a624:	ef1f606f          	j	1514 <_malloc_r>
    a628:	0147e7b3          	or	a5,a5,s4
    a62c:	00faa223          	sw	a5,4(s5)
    a630:	014a85b3          	add	a1,s5,s4
    a634:	0016e693          	or	a3,a3,1
    a638:	00d5a223          	sw	a3,4(a1)
    a63c:	00472783          	lw	a5,4(a4)
    a640:	00858593          	add	a1,a1,8
    a644:	00090513          	mv	a0,s2
    a648:	0017e793          	or	a5,a5,1
    a64c:	00f72223          	sw	a5,4(a4)
    a650:	bb9f60ef          	jal	1208 <_free_r>
    a654:	f69ff06f          	j	a5bc <_realloc_r+0x1a8>
    a658:	ffc7f793          	and	a5,a5,-4
    a65c:	013786b3          	add	a3,a5,s3
    a660:	010a0613          	add	a2,s4,16
    a664:	26c6d063          	bge	a3,a2,a8c4 <_realloc_r+0x4b0>
    a668:	00177713          	and	a4,a4,1
    a66c:	e6071ee3          	bnez	a4,a4e8 <_realloc_r+0xd4>
    a670:	01712623          	sw	s7,12(sp)
    a674:	ff842b83          	lw	s7,-8(s0)
    a678:	01612823          	sw	s6,16(sp)
    a67c:	417a8bb3          	sub	s7,s5,s7
    a680:	004ba703          	lw	a4,4(s7)
    a684:	ffc77713          	and	a4,a4,-4
    a688:	00e787b3          	add	a5,a5,a4
    a68c:	01378b33          	add	s6,a5,s3
    a690:	e4cb44e3          	blt	s6,a2,a4d8 <_realloc_r+0xc4>
    a694:	00cba783          	lw	a5,12(s7)
    a698:	008ba703          	lw	a4,8(s7)
    a69c:	ffc98613          	add	a2,s3,-4
    a6a0:	02400693          	li	a3,36
    a6a4:	00f72623          	sw	a5,12(a4)
    a6a8:	00e7a423          	sw	a4,8(a5)
    a6ac:	008b8493          	add	s1,s7,8
    a6b0:	28c6e463          	bltu	a3,a2,a938 <_realloc_r+0x524>
    a6b4:	01300713          	li	a4,19
    a6b8:	00048793          	mv	a5,s1
    a6bc:	02c77263          	bgeu	a4,a2,a6e0 <_realloc_r+0x2cc>
    a6c0:	00042703          	lw	a4,0(s0)
    a6c4:	01b00793          	li	a5,27
    a6c8:	00eba423          	sw	a4,8(s7)
    a6cc:	00442703          	lw	a4,4(s0)
    a6d0:	00eba623          	sw	a4,12(s7)
    a6d4:	26c7ea63          	bltu	a5,a2,a948 <_realloc_r+0x534>
    a6d8:	00840413          	add	s0,s0,8
    a6dc:	010b8793          	add	a5,s7,16
    a6e0:	00042703          	lw	a4,0(s0)
    a6e4:	00e7a023          	sw	a4,0(a5)
    a6e8:	00442703          	lw	a4,4(s0)
    a6ec:	00e7a223          	sw	a4,4(a5)
    a6f0:	00842703          	lw	a4,8(s0)
    a6f4:	00e7a423          	sw	a4,8(a5)
    a6f8:	014b8733          	add	a4,s7,s4
    a6fc:	414b07b3          	sub	a5,s6,s4
    a700:	00ec2423          	sw	a4,8(s8)
    a704:	0017e793          	or	a5,a5,1
    a708:	00f72223          	sw	a5,4(a4)
    a70c:	004ba783          	lw	a5,4(s7)
    a710:	00090513          	mv	a0,s2
    a714:	0017f793          	and	a5,a5,1
    a718:	0147e7b3          	or	a5,a5,s4
    a71c:	00fba223          	sw	a5,4(s7)
    a720:	de0f70ef          	jal	1d00 <__malloc_unlock>
    a724:	01012b03          	lw	s6,16(sp)
    a728:	00c12b83          	lw	s7,12(sp)
    a72c:	00812c03          	lw	s8,8(sp)
    a730:	e99ff06f          	j	a5c8 <_realloc_r+0x1b4>
    a734:	00042683          	lw	a3,0(s0)
    a738:	01b00713          	li	a4,27
    a73c:	00d52023          	sw	a3,0(a0)
    a740:	00442683          	lw	a3,4(s0)
    a744:	00d52223          	sw	a3,4(a0)
    a748:	14c76e63          	bltu	a4,a2,a8a4 <_realloc_r+0x490>
    a74c:	00840713          	add	a4,s0,8
    a750:	00850793          	add	a5,a0,8
    a754:	dd9ff06f          	j	a52c <_realloc_r+0x118>
    a758:	ffc52783          	lw	a5,-4(a0)
    a75c:	00812c03          	lw	s8,8(sp)
    a760:	ffc7f793          	and	a5,a5,-4
    a764:	00f989b3          	add	s3,s3,a5
    a768:	e29ff06f          	j	a590 <_realloc_r+0x17c>
    a76c:	00cba783          	lw	a5,12(s7)
    a770:	008ba703          	lw	a4,8(s7)
    a774:	ffc98613          	add	a2,s3,-4
    a778:	02400693          	li	a3,36
    a77c:	00f72623          	sw	a5,12(a4)
    a780:	00e7a423          	sw	a4,8(a5)
    a784:	008b8493          	add	s1,s7,8
    a788:	10c6e663          	bltu	a3,a2,a894 <_realloc_r+0x480>
    a78c:	01300713          	li	a4,19
    a790:	00048793          	mv	a5,s1
    a794:	02c77c63          	bgeu	a4,a2,a7cc <_realloc_r+0x3b8>
    a798:	00042703          	lw	a4,0(s0)
    a79c:	01b00793          	li	a5,27
    a7a0:	00eba423          	sw	a4,8(s7)
    a7a4:	00442703          	lw	a4,4(s0)
    a7a8:	00eba623          	sw	a4,12(s7)
    a7ac:	14c7f863          	bgeu	a5,a2,a8fc <_realloc_r+0x4e8>
    a7b0:	00842783          	lw	a5,8(s0)
    a7b4:	00fba823          	sw	a5,16(s7)
    a7b8:	00c42783          	lw	a5,12(s0)
    a7bc:	00fbaa23          	sw	a5,20(s7)
    a7c0:	0ad60c63          	beq	a2,a3,a878 <_realloc_r+0x464>
    a7c4:	01040413          	add	s0,s0,16
    a7c8:	018b8793          	add	a5,s7,24
    a7cc:	00042703          	lw	a4,0(s0)
    a7d0:	00e7a023          	sw	a4,0(a5)
    a7d4:	00442703          	lw	a4,4(s0)
    a7d8:	00e7a223          	sw	a4,4(a5)
    a7dc:	00842703          	lw	a4,8(s0)
    a7e0:	00e7a423          	sw	a4,8(a5)
    a7e4:	000b0993          	mv	s3,s6
    a7e8:	000b8a93          	mv	s5,s7
    a7ec:	01012b03          	lw	s6,16(sp)
    a7f0:	00c12b83          	lw	s7,12(sp)
    a7f4:	00812c03          	lw	s8,8(sp)
    a7f8:	00048413          	mv	s0,s1
    a7fc:	d95ff06f          	j	a590 <_realloc_r+0x17c>
    a800:	00040593          	mv	a1,s0
    a804:	ae8fd0ef          	jal	7aec <memmove>
    a808:	d3dff06f          	j	a544 <_realloc_r+0x130>
    a80c:	00c6a783          	lw	a5,12(a3)
    a810:	0086a703          	lw	a4,8(a3)
    a814:	ffc98613          	add	a2,s3,-4
    a818:	02400693          	li	a3,36
    a81c:	00f72623          	sw	a5,12(a4)
    a820:	00e7a423          	sw	a4,8(a5)
    a824:	008ba703          	lw	a4,8(s7)
    a828:	00cba783          	lw	a5,12(s7)
    a82c:	008b8493          	add	s1,s7,8
    a830:	00f72623          	sw	a5,12(a4)
    a834:	00e7a423          	sw	a4,8(a5)
    a838:	04c6ee63          	bltu	a3,a2,a894 <_realloc_r+0x480>
    a83c:	01300713          	li	a4,19
    a840:	00048793          	mv	a5,s1
    a844:	f8c774e3          	bgeu	a4,a2,a7cc <_realloc_r+0x3b8>
    a848:	00042703          	lw	a4,0(s0)
    a84c:	01b00793          	li	a5,27
    a850:	00eba423          	sw	a4,8(s7)
    a854:	00442703          	lw	a4,4(s0)
    a858:	00eba623          	sw	a4,12(s7)
    a85c:	0ac7f063          	bgeu	a5,a2,a8fc <_realloc_r+0x4e8>
    a860:	00842703          	lw	a4,8(s0)
    a864:	02400793          	li	a5,36
    a868:	00eba823          	sw	a4,16(s7)
    a86c:	00c42703          	lw	a4,12(s0)
    a870:	00ebaa23          	sw	a4,20(s7)
    a874:	f4f618e3          	bne	a2,a5,a7c4 <_realloc_r+0x3b0>
    a878:	01042703          	lw	a4,16(s0)
    a87c:	020b8793          	add	a5,s7,32
    a880:	01840413          	add	s0,s0,24
    a884:	00ebac23          	sw	a4,24(s7)
    a888:	ffc42703          	lw	a4,-4(s0)
    a88c:	00ebae23          	sw	a4,28(s7)
    a890:	f3dff06f          	j	a7cc <_realloc_r+0x3b8>
    a894:	00040593          	mv	a1,s0
    a898:	00048513          	mv	a0,s1
    a89c:	a50fd0ef          	jal	7aec <memmove>
    a8a0:	f45ff06f          	j	a7e4 <_realloc_r+0x3d0>
    a8a4:	00842703          	lw	a4,8(s0)
    a8a8:	00e52423          	sw	a4,8(a0)
    a8ac:	00c42703          	lw	a4,12(s0)
    a8b0:	00e52623          	sw	a4,12(a0)
    a8b4:	06f60463          	beq	a2,a5,a91c <_realloc_r+0x508>
    a8b8:	01040713          	add	a4,s0,16
    a8bc:	01050793          	add	a5,a0,16
    a8c0:	c6dff06f          	j	a52c <_realloc_r+0x118>
    a8c4:	014a8ab3          	add	s5,s5,s4
    a8c8:	414687b3          	sub	a5,a3,s4
    a8cc:	015c2423          	sw	s5,8(s8)
    a8d0:	0017e793          	or	a5,a5,1
    a8d4:	00faa223          	sw	a5,4(s5)
    a8d8:	ffc42783          	lw	a5,-4(s0)
    a8dc:	00090513          	mv	a0,s2
    a8e0:	00040493          	mv	s1,s0
    a8e4:	0017f793          	and	a5,a5,1
    a8e8:	0147e7b3          	or	a5,a5,s4
    a8ec:	fef42e23          	sw	a5,-4(s0)
    a8f0:	c10f70ef          	jal	1d00 <__malloc_unlock>
    a8f4:	00812c03          	lw	s8,8(sp)
    a8f8:	cd1ff06f          	j	a5c8 <_realloc_r+0x1b4>
    a8fc:	00840413          	add	s0,s0,8
    a900:	010b8793          	add	a5,s7,16
    a904:	ec9ff06f          	j	a7cc <_realloc_r+0x3b8>
    a908:	00090513          	mv	a0,s2
    a90c:	bf4f70ef          	jal	1d00 <__malloc_unlock>
    a910:	00000493          	li	s1,0
    a914:	00812c03          	lw	s8,8(sp)
    a918:	cb1ff06f          	j	a5c8 <_realloc_r+0x1b4>
    a91c:	01042683          	lw	a3,16(s0)
    a920:	01840713          	add	a4,s0,24
    a924:	01850793          	add	a5,a0,24
    a928:	00d52823          	sw	a3,16(a0)
    a92c:	01442683          	lw	a3,20(s0)
    a930:	00d52a23          	sw	a3,20(a0)
    a934:	bf9ff06f          	j	a52c <_realloc_r+0x118>
    a938:	00040593          	mv	a1,s0
    a93c:	00048513          	mv	a0,s1
    a940:	9acfd0ef          	jal	7aec <memmove>
    a944:	db5ff06f          	j	a6f8 <_realloc_r+0x2e4>
    a948:	00842783          	lw	a5,8(s0)
    a94c:	00fba823          	sw	a5,16(s7)
    a950:	00c42783          	lw	a5,12(s0)
    a954:	00fbaa23          	sw	a5,20(s7)
    a958:	00d60863          	beq	a2,a3,a968 <_realloc_r+0x554>
    a95c:	01040413          	add	s0,s0,16
    a960:	018b8793          	add	a5,s7,24
    a964:	d7dff06f          	j	a6e0 <_realloc_r+0x2cc>
    a968:	01042703          	lw	a4,16(s0)
    a96c:	020b8793          	add	a5,s7,32
    a970:	01840413          	add	s0,s0,24
    a974:	00ebac23          	sw	a4,24(s7)
    a978:	ffc42703          	lw	a4,-4(s0)
    a97c:	00ebae23          	sw	a4,28(s7)
    a980:	d61ff06f          	j	a6e0 <_realloc_r+0x2cc>

0000a984 <__ascii_wctomb>:
    a984:	02058463          	beqz	a1,a9ac <__ascii_wctomb+0x28>
    a988:	0ff00793          	li	a5,255
    a98c:	00c7e863          	bltu	a5,a2,a99c <__ascii_wctomb+0x18>
    a990:	00c58023          	sb	a2,0(a1)
    a994:	00100513          	li	a0,1
    a998:	00008067          	ret
    a99c:	08a00793          	li	a5,138
    a9a0:	00f52023          	sw	a5,0(a0)
    a9a4:	fff00513          	li	a0,-1
    a9a8:	00008067          	ret
    a9ac:	00000513          	li	a0,0
    a9b0:	00008067          	ret

0000a9b4 <_wcrtomb_r>:
    a9b4:	fe010113          	add	sp,sp,-32
    a9b8:	00812c23          	sw	s0,24(sp)
    a9bc:	00912a23          	sw	s1,20(sp)
    a9c0:	00112e23          	sw	ra,28(sp)
    a9c4:	00050493          	mv	s1,a0
    a9c8:	10450413          	add	s0,a0,260
    a9cc:	00068463          	beqz	a3,a9d4 <_wcrtomb_r+0x20>
    a9d0:	00068413          	mv	s0,a3
    a9d4:	7fff6797          	auipc	a5,0x7fff6
    a9d8:	c407a783          	lw	a5,-960(a5) # 80000614 <__global_locale+0xe0>
    a9dc:	00040693          	mv	a3,s0
    a9e0:	02058463          	beqz	a1,aa08 <_wcrtomb_r+0x54>
    a9e4:	00048513          	mv	a0,s1
    a9e8:	000780e7          	jalr	a5
    a9ec:	fff00793          	li	a5,-1
    a9f0:	02f50863          	beq	a0,a5,aa20 <_wcrtomb_r+0x6c>
    a9f4:	01c12083          	lw	ra,28(sp)
    a9f8:	01812403          	lw	s0,24(sp)
    a9fc:	01412483          	lw	s1,20(sp)
    aa00:	02010113          	add	sp,sp,32
    aa04:	00008067          	ret
    aa08:	00000613          	li	a2,0
    aa0c:	00410593          	add	a1,sp,4
    aa10:	00048513          	mv	a0,s1
    aa14:	000780e7          	jalr	a5
    aa18:	fff00793          	li	a5,-1
    aa1c:	fcf51ce3          	bne	a0,a5,a9f4 <_wcrtomb_r+0x40>
    aa20:	00042023          	sw	zero,0(s0)
    aa24:	01c12083          	lw	ra,28(sp)
    aa28:	01812403          	lw	s0,24(sp)
    aa2c:	08a00793          	li	a5,138
    aa30:	00f4a023          	sw	a5,0(s1)
    aa34:	01412483          	lw	s1,20(sp)
    aa38:	02010113          	add	sp,sp,32
    aa3c:	00008067          	ret

0000aa40 <_wcsrtombs_r>:
    aa40:	00070793          	mv	a5,a4
    aa44:	00068713          	mv	a4,a3
    aa48:	fff00693          	li	a3,-1
    aa4c:	7a40006f          	j	b1f0 <_wcsnrtombs_r>

0000aa50 <_fclose_r>:
    aa50:	ff010113          	add	sp,sp,-16
    aa54:	00112623          	sw	ra,12(sp)
    aa58:	01212023          	sw	s2,0(sp)
    aa5c:	0e058263          	beqz	a1,ab40 <_fclose_r+0xf0>
    aa60:	00812423          	sw	s0,8(sp)
    aa64:	00912223          	sw	s1,4(sp)
    aa68:	00058413          	mv	s0,a1
    aa6c:	00050493          	mv	s1,a0
    aa70:	00050663          	beqz	a0,aa7c <_fclose_r+0x2c>
    aa74:	03452783          	lw	a5,52(a0)
    aa78:	10078063          	beqz	a5,ab78 <_fclose_r+0x128>
    aa7c:	06442783          	lw	a5,100(s0)
    aa80:	00c41703          	lh	a4,12(s0)
    aa84:	0017f793          	and	a5,a5,1
    aa88:	0a079663          	bnez	a5,ab34 <_fclose_r+0xe4>
    aa8c:	20077713          	and	a4,a4,512
    aa90:	0e070863          	beqz	a4,ab80 <_fclose_r+0x130>
    aa94:	00040593          	mv	a1,s0
    aa98:	00048513          	mv	a0,s1
    aa9c:	9f5fb0ef          	jal	6490 <__sflush_r>
    aaa0:	02c42783          	lw	a5,44(s0)
    aaa4:	00050913          	mv	s2,a0
    aaa8:	00078a63          	beqz	a5,aabc <_fclose_r+0x6c>
    aaac:	01c42583          	lw	a1,28(s0)
    aab0:	00048513          	mv	a0,s1
    aab4:	000780e7          	jalr	a5
    aab8:	0a054063          	bltz	a0,ab58 <_fclose_r+0x108>
    aabc:	00c45783          	lhu	a5,12(s0)
    aac0:	0807f793          	and	a5,a5,128
    aac4:	0a079263          	bnez	a5,ab68 <_fclose_r+0x118>
    aac8:	03042583          	lw	a1,48(s0)
    aacc:	00058c63          	beqz	a1,aae4 <_fclose_r+0x94>
    aad0:	04040793          	add	a5,s0,64
    aad4:	00f58663          	beq	a1,a5,aae0 <_fclose_r+0x90>
    aad8:	00048513          	mv	a0,s1
    aadc:	f2cf60ef          	jal	1208 <_free_r>
    aae0:	02042823          	sw	zero,48(s0)
    aae4:	04442583          	lw	a1,68(s0)
    aae8:	00058863          	beqz	a1,aaf8 <_fclose_r+0xa8>
    aaec:	00048513          	mv	a0,s1
    aaf0:	f18f60ef          	jal	1208 <_free_r>
    aaf4:	04042223          	sw	zero,68(s0)
    aaf8:	f51fb0ef          	jal	6a48 <__sfp_lock_acquire>
    aafc:	06442783          	lw	a5,100(s0)
    ab00:	00041623          	sh	zero,12(s0)
    ab04:	0017f793          	and	a5,a5,1
    ab08:	0a078663          	beqz	a5,abb4 <_fclose_r+0x164>
    ab0c:	05842503          	lw	a0,88(s0)
    ab10:	a9cf60ef          	jal	dac <__retarget_lock_close_recursive>
    ab14:	f41fb0ef          	jal	6a54 <__sfp_lock_release>
    ab18:	00c12083          	lw	ra,12(sp)
    ab1c:	00812403          	lw	s0,8(sp)
    ab20:	00412483          	lw	s1,4(sp)
    ab24:	00090513          	mv	a0,s2
    ab28:	00012903          	lw	s2,0(sp)
    ab2c:	01010113          	add	sp,sp,16
    ab30:	00008067          	ret
    ab34:	f60710e3          	bnez	a4,aa94 <_fclose_r+0x44>
    ab38:	00812403          	lw	s0,8(sp)
    ab3c:	00412483          	lw	s1,4(sp)
    ab40:	00000913          	li	s2,0
    ab44:	00c12083          	lw	ra,12(sp)
    ab48:	00090513          	mv	a0,s2
    ab4c:	00012903          	lw	s2,0(sp)
    ab50:	01010113          	add	sp,sp,16
    ab54:	00008067          	ret
    ab58:	00c45783          	lhu	a5,12(s0)
    ab5c:	fff00913          	li	s2,-1
    ab60:	0807f793          	and	a5,a5,128
    ab64:	f60782e3          	beqz	a5,aac8 <_fclose_r+0x78>
    ab68:	01042583          	lw	a1,16(s0)
    ab6c:	00048513          	mv	a0,s1
    ab70:	e98f60ef          	jal	1208 <_free_r>
    ab74:	f55ff06f          	j	aac8 <_fclose_r+0x78>
    ab78:	e61fb0ef          	jal	69d8 <__sinit>
    ab7c:	f01ff06f          	j	aa7c <_fclose_r+0x2c>
    ab80:	05842503          	lw	a0,88(s0)
    ab84:	a2cf60ef          	jal	db0 <__retarget_lock_acquire_recursive>
    ab88:	00c41783          	lh	a5,12(s0)
    ab8c:	f00794e3          	bnez	a5,aa94 <_fclose_r+0x44>
    ab90:	06442783          	lw	a5,100(s0)
    ab94:	0017f793          	and	a5,a5,1
    ab98:	fa0790e3          	bnez	a5,ab38 <_fclose_r+0xe8>
    ab9c:	05842503          	lw	a0,88(s0)
    aba0:	00000913          	li	s2,0
    aba4:	a10f60ef          	jal	db4 <__retarget_lock_release_recursive>
    aba8:	00812403          	lw	s0,8(sp)
    abac:	00412483          	lw	s1,4(sp)
    abb0:	f95ff06f          	j	ab44 <_fclose_r+0xf4>
    abb4:	05842503          	lw	a0,88(s0)
    abb8:	9fcf60ef          	jal	db4 <__retarget_lock_release_recursive>
    abbc:	f51ff06f          	j	ab0c <_fclose_r+0xbc>

0000abc0 <__smakebuf_r>:
    abc0:	00c59783          	lh	a5,12(a1)
    abc4:	f8010113          	add	sp,sp,-128
    abc8:	06812c23          	sw	s0,120(sp)
    abcc:	06112e23          	sw	ra,124(sp)
    abd0:	0027f713          	and	a4,a5,2
    abd4:	00058413          	mv	s0,a1
    abd8:	02070463          	beqz	a4,ac00 <__smakebuf_r+0x40>
    abdc:	04358793          	add	a5,a1,67
    abe0:	00f5a023          	sw	a5,0(a1)
    abe4:	00f5a823          	sw	a5,16(a1)
    abe8:	00100793          	li	a5,1
    abec:	00f5aa23          	sw	a5,20(a1)
    abf0:	07c12083          	lw	ra,124(sp)
    abf4:	07812403          	lw	s0,120(sp)
    abf8:	08010113          	add	sp,sp,128
    abfc:	00008067          	ret
    ac00:	00e59583          	lh	a1,14(a1)
    ac04:	06912a23          	sw	s1,116(sp)
    ac08:	07212823          	sw	s2,112(sp)
    ac0c:	07312623          	sw	s3,108(sp)
    ac10:	07412423          	sw	s4,104(sp)
    ac14:	00050493          	mv	s1,a0
    ac18:	0805c663          	bltz	a1,aca4 <__smakebuf_r+0xe4>
    ac1c:	00810613          	add	a2,sp,8
    ac20:	138000ef          	jal	ad58 <_fstat_r>
    ac24:	06054e63          	bltz	a0,aca0 <__smakebuf_r+0xe0>
    ac28:	00c12783          	lw	a5,12(sp)
    ac2c:	0000f937          	lui	s2,0xf
    ac30:	000019b7          	lui	s3,0x1
    ac34:	00f97933          	and	s2,s2,a5
    ac38:	ffffe7b7          	lui	a5,0xffffe
    ac3c:	00f90933          	add	s2,s2,a5
    ac40:	00193913          	seqz	s2,s2
    ac44:	40000a13          	li	s4,1024
    ac48:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    ac4c:	000a0593          	mv	a1,s4
    ac50:	00048513          	mv	a0,s1
    ac54:	8c1f60ef          	jal	1514 <_malloc_r>
    ac58:	00c41783          	lh	a5,12(s0)
    ac5c:	06050863          	beqz	a0,accc <__smakebuf_r+0x10c>
    ac60:	0807e793          	or	a5,a5,128
    ac64:	00a42023          	sw	a0,0(s0)
    ac68:	00a42823          	sw	a0,16(s0)
    ac6c:	00f41623          	sh	a5,12(s0)
    ac70:	01442a23          	sw	s4,20(s0)
    ac74:	0a091063          	bnez	s2,ad14 <__smakebuf_r+0x154>
    ac78:	0137e7b3          	or	a5,a5,s3
    ac7c:	07c12083          	lw	ra,124(sp)
    ac80:	00f41623          	sh	a5,12(s0)
    ac84:	07812403          	lw	s0,120(sp)
    ac88:	07412483          	lw	s1,116(sp)
    ac8c:	07012903          	lw	s2,112(sp)
    ac90:	06c12983          	lw	s3,108(sp)
    ac94:	06812a03          	lw	s4,104(sp)
    ac98:	08010113          	add	sp,sp,128
    ac9c:	00008067          	ret
    aca0:	00c41783          	lh	a5,12(s0)
    aca4:	0807f793          	and	a5,a5,128
    aca8:	00000913          	li	s2,0
    acac:	04078e63          	beqz	a5,ad08 <__smakebuf_r+0x148>
    acb0:	04000a13          	li	s4,64
    acb4:	000a0593          	mv	a1,s4
    acb8:	00048513          	mv	a0,s1
    acbc:	859f60ef          	jal	1514 <_malloc_r>
    acc0:	00c41783          	lh	a5,12(s0)
    acc4:	00000993          	li	s3,0
    acc8:	f8051ce3          	bnez	a0,ac60 <__smakebuf_r+0xa0>
    accc:	2007f713          	and	a4,a5,512
    acd0:	04071e63          	bnez	a4,ad2c <__smakebuf_r+0x16c>
    acd4:	ffc7f793          	and	a5,a5,-4
    acd8:	0027e793          	or	a5,a5,2
    acdc:	04340713          	add	a4,s0,67
    ace0:	00f41623          	sh	a5,12(s0)
    ace4:	00100793          	li	a5,1
    ace8:	07412483          	lw	s1,116(sp)
    acec:	07012903          	lw	s2,112(sp)
    acf0:	06c12983          	lw	s3,108(sp)
    acf4:	06812a03          	lw	s4,104(sp)
    acf8:	00e42023          	sw	a4,0(s0)
    acfc:	00e42823          	sw	a4,16(s0)
    ad00:	00f42a23          	sw	a5,20(s0)
    ad04:	eedff06f          	j	abf0 <__smakebuf_r+0x30>
    ad08:	40000a13          	li	s4,1024
    ad0c:	00000993          	li	s3,0
    ad10:	f3dff06f          	j	ac4c <__smakebuf_r+0x8c>
    ad14:	00e41583          	lh	a1,14(s0)
    ad18:	00048513          	mv	a0,s1
    ad1c:	09c000ef          	jal	adb8 <_isatty_r>
    ad20:	02051063          	bnez	a0,ad40 <__smakebuf_r+0x180>
    ad24:	00c41783          	lh	a5,12(s0)
    ad28:	f51ff06f          	j	ac78 <__smakebuf_r+0xb8>
    ad2c:	07412483          	lw	s1,116(sp)
    ad30:	07012903          	lw	s2,112(sp)
    ad34:	06c12983          	lw	s3,108(sp)
    ad38:	06812a03          	lw	s4,104(sp)
    ad3c:	eb5ff06f          	j	abf0 <__smakebuf_r+0x30>
    ad40:	00c45783          	lhu	a5,12(s0)
    ad44:	ffc7f793          	and	a5,a5,-4
    ad48:	0017e793          	or	a5,a5,1
    ad4c:	01079793          	sll	a5,a5,0x10
    ad50:	4107d793          	sra	a5,a5,0x10
    ad54:	f25ff06f          	j	ac78 <__smakebuf_r+0xb8>

0000ad58 <_fstat_r>:
    ad58:	ff010113          	add	sp,sp,-16
    ad5c:	00058713          	mv	a4,a1
    ad60:	00812423          	sw	s0,8(sp)
    ad64:	00060593          	mv	a1,a2
    ad68:	00050413          	mv	s0,a0
    ad6c:	00070513          	mv	a0,a4
    ad70:	7fff6797          	auipc	a5,0x7fff6
    ad74:	9a07a423          	sw	zero,-1624(a5) # 80000718 <errno>
    ad78:	00112623          	sw	ra,12(sp)
    ad7c:	c15f50ef          	jal	990 <_fstat>
    ad80:	fff00793          	li	a5,-1
    ad84:	00f50a63          	beq	a0,a5,ad98 <_fstat_r+0x40>
    ad88:	00c12083          	lw	ra,12(sp)
    ad8c:	00812403          	lw	s0,8(sp)
    ad90:	01010113          	add	sp,sp,16
    ad94:	00008067          	ret
    ad98:	7fff6797          	auipc	a5,0x7fff6
    ad9c:	9807a783          	lw	a5,-1664(a5) # 80000718 <errno>
    ada0:	fe0784e3          	beqz	a5,ad88 <_fstat_r+0x30>
    ada4:	00c12083          	lw	ra,12(sp)
    ada8:	00f42023          	sw	a5,0(s0)
    adac:	00812403          	lw	s0,8(sp)
    adb0:	01010113          	add	sp,sp,16
    adb4:	00008067          	ret

0000adb8 <_isatty_r>:
    adb8:	ff010113          	add	sp,sp,-16
    adbc:	00812423          	sw	s0,8(sp)
    adc0:	00050413          	mv	s0,a0
    adc4:	00058513          	mv	a0,a1
    adc8:	7fff6797          	auipc	a5,0x7fff6
    adcc:	9407a823          	sw	zero,-1712(a5) # 80000718 <errno>
    add0:	00112623          	sw	ra,12(sp)
    add4:	bd5f50ef          	jal	9a8 <_isatty>
    add8:	fff00793          	li	a5,-1
    addc:	00f50a63          	beq	a0,a5,adf0 <_isatty_r+0x38>
    ade0:	00c12083          	lw	ra,12(sp)
    ade4:	00812403          	lw	s0,8(sp)
    ade8:	01010113          	add	sp,sp,16
    adec:	00008067          	ret
    adf0:	7fff6797          	auipc	a5,0x7fff6
    adf4:	9287a783          	lw	a5,-1752(a5) # 80000718 <errno>
    adf8:	fe0784e3          	beqz	a5,ade0 <_isatty_r+0x28>
    adfc:	00c12083          	lw	ra,12(sp)
    ae00:	00f42023          	sw	a5,0(s0)
    ae04:	00812403          	lw	s0,8(sp)
    ae08:	01010113          	add	sp,sp,16
    ae0c:	00008067          	ret

0000ae10 <__errno>:
    ae10:	7fff6517          	auipc	a0,0x7fff6
    ae14:	8f852503          	lw	a0,-1800(a0) # 80000708 <_impure_ptr>
    ae18:	00008067          	ret

0000ae1c <__assert_func>:
    ae1c:	ff010113          	add	sp,sp,-16
    ae20:	00068793          	mv	a5,a3
    ae24:	7fff6717          	auipc	a4,0x7fff6
    ae28:	8e472703          	lw	a4,-1820(a4) # 80000708 <_impure_ptr>
    ae2c:	00060813          	mv	a6,a2
    ae30:	00112623          	sw	ra,12(sp)
    ae34:	00c72883          	lw	a7,12(a4)
    ae38:	00078613          	mv	a2,a5
    ae3c:	00050693          	mv	a3,a0
    ae40:	00058713          	mv	a4,a1
    ae44:	00004797          	auipc	a5,0x4
    ae48:	25c78793          	add	a5,a5,604 # f0a0 <__fini_array_end+0x344>
    ae4c:	00080c63          	beqz	a6,ae64 <__assert_func+0x48>
    ae50:	00004597          	auipc	a1,0x4
    ae54:	26058593          	add	a1,a1,608 # f0b0 <__fini_array_end+0x354>
    ae58:	00088513          	mv	a0,a7
    ae5c:	3a8000ef          	jal	b204 <fiprintf>
    ae60:	3f0000ef          	jal	b250 <abort>
    ae64:	00004797          	auipc	a5,0x4
    ae68:	f5c78793          	add	a5,a5,-164 # edc0 <__fini_array_end+0x64>
    ae6c:	00078813          	mv	a6,a5
    ae70:	fe1ff06f          	j	ae50 <__assert_func+0x34>

0000ae74 <_calloc_r>:
    ae74:	fe010113          	add	sp,sp,-32
    ae78:	00812c23          	sw	s0,24(sp)
    ae7c:	00112e23          	sw	ra,28(sp)
    ae80:	0105d693          	srl	a3,a1,0x10
    ae84:	00058793          	mv	a5,a1
    ae88:	00050413          	mv	s0,a0
    ae8c:	01065713          	srl	a4,a2,0x10
    ae90:	0c069063          	bnez	a3,af50 <_calloc_r+0xdc>
    ae94:	14071a63          	bnez	a4,afe8 <_calloc_r+0x174>
    ae98:	01061593          	sll	a1,a2,0x10
    ae9c:	01079513          	sll	a0,a5,0x10
    aea0:	0105d593          	srl	a1,a1,0x10
    aea4:	01055513          	srl	a0,a0,0x10
    aea8:	4bd030ef          	jal	eb64 <__mulsi3>
    aeac:	00050593          	mv	a1,a0
    aeb0:	00040513          	mv	a0,s0
    aeb4:	e60f60ef          	jal	1514 <_malloc_r>
    aeb8:	00050413          	mv	s0,a0
    aebc:	10050a63          	beqz	a0,afd0 <_calloc_r+0x15c>
    aec0:	ffc52603          	lw	a2,-4(a0)
    aec4:	02400713          	li	a4,36
    aec8:	ffc67613          	and	a2,a2,-4
    aecc:	ffc60613          	add	a2,a2,-4
    aed0:	04c76863          	bltu	a4,a2,af20 <_calloc_r+0xac>
    aed4:	01300693          	li	a3,19
    aed8:	00050793          	mv	a5,a0
    aedc:	02c6f263          	bgeu	a3,a2,af00 <_calloc_r+0x8c>
    aee0:	00052023          	sw	zero,0(a0)
    aee4:	00052223          	sw	zero,4(a0)
    aee8:	01b00793          	li	a5,27
    aeec:	04c7f863          	bgeu	a5,a2,af3c <_calloc_r+0xc8>
    aef0:	00052423          	sw	zero,8(a0)
    aef4:	00052623          	sw	zero,12(a0)
    aef8:	01050793          	add	a5,a0,16
    aefc:	10e60263          	beq	a2,a4,b000 <_calloc_r+0x18c>
    af00:	0007a023          	sw	zero,0(a5)
    af04:	0007a223          	sw	zero,4(a5)
    af08:	0007a423          	sw	zero,8(a5)
    af0c:	01c12083          	lw	ra,28(sp)
    af10:	00040513          	mv	a0,s0
    af14:	01812403          	lw	s0,24(sp)
    af18:	02010113          	add	sp,sp,32
    af1c:	00008067          	ret
    af20:	00000593          	li	a1,0
    af24:	e95f50ef          	jal	db8 <memset>
    af28:	01c12083          	lw	ra,28(sp)
    af2c:	00040513          	mv	a0,s0
    af30:	01812403          	lw	s0,24(sp)
    af34:	02010113          	add	sp,sp,32
    af38:	00008067          	ret
    af3c:	00850793          	add	a5,a0,8
    af40:	0007a023          	sw	zero,0(a5)
    af44:	0007a223          	sw	zero,4(a5)
    af48:	0007a423          	sw	zero,8(a5)
    af4c:	fc1ff06f          	j	af0c <_calloc_r+0x98>
    af50:	0c071663          	bnez	a4,b01c <_calloc_r+0x1a8>
    af54:	01212823          	sw	s2,16(sp)
    af58:	01312623          	sw	s3,12(sp)
    af5c:	00912a23          	sw	s1,20(sp)
    af60:	00068913          	mv	s2,a3
    af64:	00060993          	mv	s3,a2
    af68:	01079513          	sll	a0,a5,0x10
    af6c:	01061593          	sll	a1,a2,0x10
    af70:	0105d593          	srl	a1,a1,0x10
    af74:	01055513          	srl	a0,a0,0x10
    af78:	3ed030ef          	jal	eb64 <__mulsi3>
    af7c:	00050493          	mv	s1,a0
    af80:	01091593          	sll	a1,s2,0x10
    af84:	01099513          	sll	a0,s3,0x10
    af88:	0105d593          	srl	a1,a1,0x10
    af8c:	01055513          	srl	a0,a0,0x10
    af90:	3d5030ef          	jal	eb64 <__mulsi3>
    af94:	0104d793          	srl	a5,s1,0x10
    af98:	00f505b3          	add	a1,a0,a5
    af9c:	0105d793          	srl	a5,a1,0x10
    afa0:	06079863          	bnez	a5,b010 <_calloc_r+0x19c>
    afa4:	01049493          	sll	s1,s1,0x10
    afa8:	0104d493          	srl	s1,s1,0x10
    afac:	01059593          	sll	a1,a1,0x10
    afb0:	0095e5b3          	or	a1,a1,s1
    afb4:	00040513          	mv	a0,s0
    afb8:	01412483          	lw	s1,20(sp)
    afbc:	01012903          	lw	s2,16(sp)
    afc0:	00c12983          	lw	s3,12(sp)
    afc4:	d50f60ef          	jal	1514 <_malloc_r>
    afc8:	00050413          	mv	s0,a0
    afcc:	ee051ae3          	bnez	a0,aec0 <_calloc_r+0x4c>
    afd0:	00000413          	li	s0,0
    afd4:	01c12083          	lw	ra,28(sp)
    afd8:	00040513          	mv	a0,s0
    afdc:	01812403          	lw	s0,24(sp)
    afe0:	02010113          	add	sp,sp,32
    afe4:	00008067          	ret
    afe8:	01212823          	sw	s2,16(sp)
    afec:	01312623          	sw	s3,12(sp)
    aff0:	00912a23          	sw	s1,20(sp)
    aff4:	00070913          	mv	s2,a4
    aff8:	00058993          	mv	s3,a1
    affc:	f6dff06f          	j	af68 <_calloc_r+0xf4>
    b000:	00052823          	sw	zero,16(a0)
    b004:	01850793          	add	a5,a0,24
    b008:	00052a23          	sw	zero,20(a0)
    b00c:	ef5ff06f          	j	af00 <_calloc_r+0x8c>
    b010:	01412483          	lw	s1,20(sp)
    b014:	01012903          	lw	s2,16(sp)
    b018:	00c12983          	lw	s3,12(sp)
    b01c:	df5ff0ef          	jal	ae10 <__errno>
    b020:	00c00793          	li	a5,12
    b024:	00f52023          	sw	a5,0(a0)
    b028:	00000413          	li	s0,0
    b02c:	fa9ff06f          	j	afd4 <_calloc_r+0x160>

0000b030 <_wcsnrtombs_l>:
    b030:	fa010113          	add	sp,sp,-96
    b034:	04912a23          	sw	s1,84(sp)
    b038:	05212823          	sw	s2,80(sp)
    b03c:	05312623          	sw	s3,76(sp)
    b040:	05412423          	sw	s4,72(sp)
    b044:	05512223          	sw	s5,68(sp)
    b048:	04112e23          	sw	ra,92(sp)
    b04c:	03912a23          	sw	s9,52(sp)
    b050:	03a12823          	sw	s10,48(sp)
    b054:	00a12623          	sw	a0,12(sp)
    b058:	00058a13          	mv	s4,a1
    b05c:	00060a93          	mv	s5,a2
    b060:	00070913          	mv	s2,a4
    b064:	00080993          	mv	s3,a6
    b068:	00078493          	mv	s1,a5
    b06c:	12078063          	beqz	a5,b18c <_wcsnrtombs_l+0x15c>
    b070:	000aac83          	lw	s9,0(s5)
    b074:	120a0263          	beqz	s4,b198 <_wcsnrtombs_l+0x168>
    b078:	14090e63          	beqz	s2,b1d4 <_wcsnrtombs_l+0x1a4>
    b07c:	05612023          	sw	s6,64(sp)
    b080:	fff68b13          	add	s6,a3,-1
    b084:	16068063          	beqz	a3,b1e4 <_wcsnrtombs_l+0x1b4>
    b088:	04812c23          	sw	s0,88(sp)
    b08c:	03b12623          	sw	s11,44(sp)
    b090:	03712e23          	sw	s7,60(sp)
    b094:	03812c23          	sw	s8,56(sp)
    b098:	000a0413          	mv	s0,s4
    b09c:	00000d13          	li	s10,0
    b0a0:	fff00d93          	li	s11,-1
    b0a4:	0240006f          	j	b0c8 <_wcsnrtombs_l+0x98>
    b0a8:	080a1a63          	bnez	s4,b13c <_wcsnrtombs_l+0x10c>
    b0ac:	000ca783          	lw	a5,0(s9)
    b0b0:	004c8c93          	add	s9,s9,4
    b0b4:	0c078263          	beqz	a5,b178 <_wcsnrtombs_l+0x148>
    b0b8:	1326f263          	bgeu	a3,s2,b1dc <_wcsnrtombs_l+0x1ac>
    b0bc:	fffb0b13          	add	s6,s6,-1
    b0c0:	00068d13          	mv	s10,a3
    b0c4:	03bb0c63          	beq	s6,s11,b0fc <_wcsnrtombs_l+0xcc>
    b0c8:	0e09a783          	lw	a5,224(s3)
    b0cc:	000ca603          	lw	a2,0(s9)
    b0d0:	00c12503          	lw	a0,12(sp)
    b0d4:	00048693          	mv	a3,s1
    b0d8:	01410593          	add	a1,sp,20
    b0dc:	0004ac03          	lw	s8,0(s1)
    b0e0:	0044ab83          	lw	s7,4(s1)
    b0e4:	000780e7          	jalr	a5
    b0e8:	0bb50e63          	beq	a0,s11,b1a4 <_wcsnrtombs_l+0x174>
    b0ec:	01a506b3          	add	a3,a0,s10
    b0f0:	fad97ce3          	bgeu	s2,a3,b0a8 <_wcsnrtombs_l+0x78>
    b0f4:	0184a023          	sw	s8,0(s1)
    b0f8:	0174a223          	sw	s7,4(s1)
    b0fc:	05812403          	lw	s0,88(sp)
    b100:	04012b03          	lw	s6,64(sp)
    b104:	03c12b83          	lw	s7,60(sp)
    b108:	03812c03          	lw	s8,56(sp)
    b10c:	02c12d83          	lw	s11,44(sp)
    b110:	05c12083          	lw	ra,92(sp)
    b114:	05412483          	lw	s1,84(sp)
    b118:	05012903          	lw	s2,80(sp)
    b11c:	04c12983          	lw	s3,76(sp)
    b120:	04812a03          	lw	s4,72(sp)
    b124:	04412a83          	lw	s5,68(sp)
    b128:	03412c83          	lw	s9,52(sp)
    b12c:	000d0513          	mv	a0,s10
    b130:	03012d03          	lw	s10,48(sp)
    b134:	06010113          	add	sp,sp,96
    b138:	00008067          	ret
    b13c:	08a05063          	blez	a0,b1bc <_wcsnrtombs_l+0x18c>
    b140:	01410893          	add	a7,sp,20
    b144:	00a40533          	add	a0,s0,a0
    b148:	0008c783          	lbu	a5,0(a7)
    b14c:	00140413          	add	s0,s0,1
    b150:	00188893          	add	a7,a7,1
    b154:	fef40fa3          	sb	a5,-1(s0)
    b158:	fe8518e3          	bne	a0,s0,b148 <_wcsnrtombs_l+0x118>
    b15c:	000aa783          	lw	a5,0(s5)
    b160:	00050413          	mv	s0,a0
    b164:	00478793          	add	a5,a5,4
    b168:	00faa023          	sw	a5,0(s5)
    b16c:	000ca783          	lw	a5,0(s9)
    b170:	004c8c93          	add	s9,s9,4
    b174:	f40792e3          	bnez	a5,b0b8 <_wcsnrtombs_l+0x88>
    b178:	000a0463          	beqz	s4,b180 <_wcsnrtombs_l+0x150>
    b17c:	000aa023          	sw	zero,0(s5)
    b180:	0004a023          	sw	zero,0(s1)
    b184:	fff68d13          	add	s10,a3,-1
    b188:	f75ff06f          	j	b0fc <_wcsnrtombs_l+0xcc>
    b18c:	000aac83          	lw	s9,0(s5)
    b190:	10c50493          	add	s1,a0,268
    b194:	ee0a12e3          	bnez	s4,b078 <_wcsnrtombs_l+0x48>
    b198:	05612023          	sw	s6,64(sp)
    b19c:	fff00913          	li	s2,-1
    b1a0:	ee1ff06f          	j	b080 <_wcsnrtombs_l+0x50>
    b1a4:	00c12703          	lw	a4,12(sp)
    b1a8:	08a00793          	li	a5,138
    b1ac:	fff00d13          	li	s10,-1
    b1b0:	00f72023          	sw	a5,0(a4)
    b1b4:	0004a023          	sw	zero,0(s1)
    b1b8:	f45ff06f          	j	b0fc <_wcsnrtombs_l+0xcc>
    b1bc:	000aa783          	lw	a5,0(s5)
    b1c0:	00040513          	mv	a0,s0
    b1c4:	00050413          	mv	s0,a0
    b1c8:	00478793          	add	a5,a5,4
    b1cc:	00faa023          	sw	a5,0(s5)
    b1d0:	f9dff06f          	j	b16c <_wcsnrtombs_l+0x13c>
    b1d4:	00000d13          	li	s10,0
    b1d8:	f39ff06f          	j	b110 <_wcsnrtombs_l+0xe0>
    b1dc:	00068d13          	mv	s10,a3
    b1e0:	f1dff06f          	j	b0fc <_wcsnrtombs_l+0xcc>
    b1e4:	04012b03          	lw	s6,64(sp)
    b1e8:	00000d13          	li	s10,0
    b1ec:	f25ff06f          	j	b110 <_wcsnrtombs_l+0xe0>

0000b1f0 <_wcsnrtombs_r>:
    b1f0:	7fff5817          	auipc	a6,0x7fff5
    b1f4:	34480813          	add	a6,a6,836 # 80000534 <__global_locale>
    b1f8:	7fff5517          	auipc	a0,0x7fff5
    b1fc:	51052503          	lw	a0,1296(a0) # 80000708 <_impure_ptr>
    b200:	e31ff06f          	j	b030 <_wcsnrtombs_l>

0000b204 <fiprintf>:
    b204:	fc010113          	add	sp,sp,-64
    b208:	02810313          	add	t1,sp,40
    b20c:	02c12423          	sw	a2,40(sp)
    b210:	02d12623          	sw	a3,44(sp)
    b214:	00058613          	mv	a2,a1
    b218:	00030693          	mv	a3,t1
    b21c:	00050593          	mv	a1,a0
    b220:	7fff5517          	auipc	a0,0x7fff5
    b224:	4e852503          	lw	a0,1256(a0) # 80000708 <_impure_ptr>
    b228:	00112e23          	sw	ra,28(sp)
    b22c:	02e12823          	sw	a4,48(sp)
    b230:	02f12a23          	sw	a5,52(sp)
    b234:	03012c23          	sw	a6,56(sp)
    b238:	03112e23          	sw	a7,60(sp)
    b23c:	00612623          	sw	t1,12(sp)
    b240:	9a1f90ef          	jal	4be0 <_vfiprintf_r>
    b244:	01c12083          	lw	ra,28(sp)
    b248:	04010113          	add	sp,sp,64
    b24c:	00008067          	ret

0000b250 <abort>:
    b250:	ff010113          	add	sp,sp,-16
    b254:	00600513          	li	a0,6
    b258:	00112623          	sw	ra,12(sp)
    b25c:	00c000ef          	jal	b268 <raise>
    b260:	00100513          	li	a0,1
    b264:	f14f50ef          	jal	978 <_exit>

0000b268 <raise>:
    b268:	ff010113          	add	sp,sp,-16
    b26c:	00912223          	sw	s1,4(sp)
    b270:	00112623          	sw	ra,12(sp)
    b274:	01f00793          	li	a5,31
    b278:	7fff5497          	auipc	s1,0x7fff5
    b27c:	4904a483          	lw	s1,1168(s1) # 80000708 <_impure_ptr>
    b280:	08a7ee63          	bltu	a5,a0,b31c <raise+0xb4>
    b284:	1184a783          	lw	a5,280(s1)
    b288:	00812423          	sw	s0,8(sp)
    b28c:	00050413          	mv	s0,a0
    b290:	04078263          	beqz	a5,b2d4 <raise+0x6c>
    b294:	00251713          	sll	a4,a0,0x2
    b298:	00e787b3          	add	a5,a5,a4
    b29c:	0007a703          	lw	a4,0(a5)
    b2a0:	02070a63          	beqz	a4,b2d4 <raise+0x6c>
    b2a4:	00100693          	li	a3,1
    b2a8:	00d70a63          	beq	a4,a3,b2bc <raise+0x54>
    b2ac:	fff00693          	li	a3,-1
    b2b0:	04d70663          	beq	a4,a3,b2fc <raise+0x94>
    b2b4:	0007a023          	sw	zero,0(a5)
    b2b8:	000700e7          	jalr	a4
    b2bc:	00812403          	lw	s0,8(sp)
    b2c0:	00000513          	li	a0,0
    b2c4:	00c12083          	lw	ra,12(sp)
    b2c8:	00412483          	lw	s1,4(sp)
    b2cc:	01010113          	add	sp,sp,16
    b2d0:	00008067          	ret
    b2d4:	00048513          	mv	a0,s1
    b2d8:	0b4000ef          	jal	b38c <_getpid_r>
    b2dc:	00040613          	mv	a2,s0
    b2e0:	00812403          	lw	s0,8(sp)
    b2e4:	00c12083          	lw	ra,12(sp)
    b2e8:	00050593          	mv	a1,a0
    b2ec:	00048513          	mv	a0,s1
    b2f0:	00412483          	lw	s1,4(sp)
    b2f4:	01010113          	add	sp,sp,16
    b2f8:	0340006f          	j	b32c <_kill_r>
    b2fc:	00812403          	lw	s0,8(sp)
    b300:	00c12083          	lw	ra,12(sp)
    b304:	01600793          	li	a5,22
    b308:	00f4a023          	sw	a5,0(s1)
    b30c:	00100513          	li	a0,1
    b310:	00412483          	lw	s1,4(sp)
    b314:	01010113          	add	sp,sp,16
    b318:	00008067          	ret
    b31c:	01600793          	li	a5,22
    b320:	00f4a023          	sw	a5,0(s1)
    b324:	fff00513          	li	a0,-1
    b328:	f9dff06f          	j	b2c4 <raise+0x5c>

0000b32c <_kill_r>:
    b32c:	ff010113          	add	sp,sp,-16
    b330:	00058713          	mv	a4,a1
    b334:	00812423          	sw	s0,8(sp)
    b338:	00060593          	mv	a1,a2
    b33c:	00050413          	mv	s0,a0
    b340:	00070513          	mv	a0,a4
    b344:	7fff5797          	auipc	a5,0x7fff5
    b348:	3c07aa23          	sw	zero,980(a5) # 80000718 <errno>
    b34c:	00112623          	sw	ra,12(sp)
    b350:	e60f50ef          	jal	9b0 <_kill>
    b354:	fff00793          	li	a5,-1
    b358:	00f50a63          	beq	a0,a5,b36c <_kill_r+0x40>
    b35c:	00c12083          	lw	ra,12(sp)
    b360:	00812403          	lw	s0,8(sp)
    b364:	01010113          	add	sp,sp,16
    b368:	00008067          	ret
    b36c:	7fff5797          	auipc	a5,0x7fff5
    b370:	3ac7a783          	lw	a5,940(a5) # 80000718 <errno>
    b374:	fe0784e3          	beqz	a5,b35c <_kill_r+0x30>
    b378:	00c12083          	lw	ra,12(sp)
    b37c:	00f42023          	sw	a5,0(s0)
    b380:	00812403          	lw	s0,8(sp)
    b384:	01010113          	add	sp,sp,16
    b388:	00008067          	ret

0000b38c <_getpid_r>:
    b38c:	e14f506f          	j	9a0 <_getpid>

0000b390 <__udivdi3>:
    b390:	fd010113          	add	sp,sp,-48
    b394:	01312e23          	sw	s3,28(sp)
    b398:	02112623          	sw	ra,44(sp)
    b39c:	01612823          	sw	s6,16(sp)
    b3a0:	00050993          	mv	s3,a0
    b3a4:	16069663          	bnez	a3,b510 <__udivdi3+0x180>
    b3a8:	02812423          	sw	s0,40(sp)
    b3ac:	01512a23          	sw	s5,20(sp)
    b3b0:	02912223          	sw	s1,36(sp)
    b3b4:	03212023          	sw	s2,32(sp)
    b3b8:	01412c23          	sw	s4,24(sp)
    b3bc:	00060a93          	mv	s5,a2
    b3c0:	00050413          	mv	s0,a0
    b3c4:	1cc5f063          	bgeu	a1,a2,b584 <__udivdi3+0x1f4>
    b3c8:	000107b7          	lui	a5,0x10
    b3cc:	00058493          	mv	s1,a1
    b3d0:	2af66e63          	bltu	a2,a5,b68c <__udivdi3+0x2fc>
    b3d4:	010007b7          	lui	a5,0x1000
    b3d8:	01800713          	li	a4,24
    b3dc:	00f67463          	bgeu	a2,a5,b3e4 <__udivdi3+0x54>
    b3e0:	01000713          	li	a4,16
    b3e4:	00e656b3          	srl	a3,a2,a4
    b3e8:	00004797          	auipc	a5,0x4
    b3ec:	2e878793          	add	a5,a5,744 # f6d0 <__clz_tab>
    b3f0:	00d787b3          	add	a5,a5,a3
    b3f4:	0007c783          	lbu	a5,0(a5)
    b3f8:	02000693          	li	a3,32
    b3fc:	00e787b3          	add	a5,a5,a4
    b400:	40f68733          	sub	a4,a3,a5
    b404:	00f68c63          	beq	a3,a5,b41c <__udivdi3+0x8c>
    b408:	00e594b3          	sll	s1,a1,a4
    b40c:	00f9d7b3          	srl	a5,s3,a5
    b410:	00e61ab3          	sll	s5,a2,a4
    b414:	0097e4b3          	or	s1,a5,s1
    b418:	00e99433          	sll	s0,s3,a4
    b41c:	010ada13          	srl	s4,s5,0x10
    b420:	000a0593          	mv	a1,s4
    b424:	00048513          	mv	a0,s1
    b428:	010a9b13          	sll	s6,s5,0x10
    b42c:	7fc030ef          	jal	ec28 <__hidden___udivsi3>
    b430:	010b5b13          	srl	s6,s6,0x10
    b434:	00050593          	mv	a1,a0
    b438:	00050913          	mv	s2,a0
    b43c:	000b0513          	mv	a0,s6
    b440:	724030ef          	jal	eb64 <__mulsi3>
    b444:	00050793          	mv	a5,a0
    b448:	000a0593          	mv	a1,s4
    b44c:	00048513          	mv	a0,s1
    b450:	00078493          	mv	s1,a5
    b454:	01d030ef          	jal	ec70 <__umodsi3>
    b458:	01051513          	sll	a0,a0,0x10
    b45c:	01045793          	srl	a5,s0,0x10
    b460:	00a7e7b3          	or	a5,a5,a0
    b464:	0097fc63          	bgeu	a5,s1,b47c <__udivdi3+0xec>
    b468:	00fa87b3          	add	a5,s5,a5
    b46c:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x2a3>
    b470:	0157e463          	bltu	a5,s5,b478 <__udivdi3+0xe8>
    b474:	5a97e863          	bltu	a5,s1,ba24 <__udivdi3+0x694>
    b478:	00070913          	mv	s2,a4
    b47c:	409784b3          	sub	s1,a5,s1
    b480:	000a0593          	mv	a1,s4
    b484:	00048513          	mv	a0,s1
    b488:	7a0030ef          	jal	ec28 <__hidden___udivsi3>
    b48c:	00050593          	mv	a1,a0
    b490:	00050993          	mv	s3,a0
    b494:	000b0513          	mv	a0,s6
    b498:	6cc030ef          	jal	eb64 <__mulsi3>
    b49c:	00050793          	mv	a5,a0
    b4a0:	000a0593          	mv	a1,s4
    b4a4:	00048513          	mv	a0,s1
    b4a8:	01041413          	sll	s0,s0,0x10
    b4ac:	00078493          	mv	s1,a5
    b4b0:	7c0030ef          	jal	ec70 <__umodsi3>
    b4b4:	01051513          	sll	a0,a0,0x10
    b4b8:	01045413          	srl	s0,s0,0x10
    b4bc:	00a46433          	or	s0,s0,a0
    b4c0:	00947c63          	bgeu	s0,s1,b4d8 <__udivdi3+0x148>
    b4c4:	008a8433          	add	s0,s5,s0
    b4c8:	fff98793          	add	a5,s3,-1
    b4cc:	4d546e63          	bltu	s0,s5,b9a8 <__udivdi3+0x618>
    b4d0:	ffe98993          	add	s3,s3,-2
    b4d4:	4c947a63          	bgeu	s0,s1,b9a8 <__udivdi3+0x618>
    b4d8:	01091613          	sll	a2,s2,0x10
    b4dc:	01366533          	or	a0,a2,s3
    b4e0:	00000b13          	li	s6,0
    b4e4:	02812403          	lw	s0,40(sp)
    b4e8:	02c12083          	lw	ra,44(sp)
    b4ec:	02412483          	lw	s1,36(sp)
    b4f0:	02012903          	lw	s2,32(sp)
    b4f4:	01812a03          	lw	s4,24(sp)
    b4f8:	01412a83          	lw	s5,20(sp)
    b4fc:	01c12983          	lw	s3,28(sp)
    b500:	000b0593          	mv	a1,s6
    b504:	01012b03          	lw	s6,16(sp)
    b508:	03010113          	add	sp,sp,48
    b50c:	00008067          	ret
    b510:	02d5f263          	bgeu	a1,a3,b534 <__udivdi3+0x1a4>
    b514:	00000b13          	li	s6,0
    b518:	00000513          	li	a0,0
    b51c:	02c12083          	lw	ra,44(sp)
    b520:	01c12983          	lw	s3,28(sp)
    b524:	000b0593          	mv	a1,s6
    b528:	01012b03          	lw	s6,16(sp)
    b52c:	03010113          	add	sp,sp,48
    b530:	00008067          	ret
    b534:	000107b7          	lui	a5,0x10
    b538:	26f6ee63          	bltu	a3,a5,b7b4 <__udivdi3+0x424>
    b53c:	01000737          	lui	a4,0x1000
    b540:	01800793          	li	a5,24
    b544:	00e6f463          	bgeu	a3,a4,b54c <__udivdi3+0x1bc>
    b548:	01000793          	li	a5,16
    b54c:	00f6d533          	srl	a0,a3,a5
    b550:	00004717          	auipc	a4,0x4
    b554:	18070713          	add	a4,a4,384 # f6d0 <__clz_tab>
    b558:	00a70733          	add	a4,a4,a0
    b55c:	00074703          	lbu	a4,0(a4)
    b560:	02000513          	li	a0,32
    b564:	00f70733          	add	a4,a4,a5
    b568:	40e50b33          	sub	s6,a0,a4
    b56c:	26e51c63          	bne	a0,a4,b7e4 <__udivdi3+0x454>
    b570:	46b6ee63          	bltu	a3,a1,b9ec <__udivdi3+0x65c>
    b574:	00c9b533          	sltu	a0,s3,a2
    b578:	00153513          	seqz	a0,a0
    b57c:	00000b13          	li	s6,0
    b580:	f9dff06f          	j	b51c <__udivdi3+0x18c>
    b584:	10060c63          	beqz	a2,b69c <__udivdi3+0x30c>
    b588:	000107b7          	lui	a5,0x10
    b58c:	44f67663          	bgeu	a2,a5,b9d8 <__udivdi3+0x648>
    b590:	10063713          	sltiu	a4,a2,256
    b594:	00173713          	seqz	a4,a4
    b598:	00371713          	sll	a4,a4,0x3
    b59c:	00e656b3          	srl	a3,a2,a4
    b5a0:	00004797          	auipc	a5,0x4
    b5a4:	13078793          	add	a5,a5,304 # f6d0 <__clz_tab>
    b5a8:	00d787b3          	add	a5,a5,a3
    b5ac:	0007c483          	lbu	s1,0(a5)
    b5b0:	02000793          	li	a5,32
    b5b4:	00e484b3          	add	s1,s1,a4
    b5b8:	40978733          	sub	a4,a5,s1
    b5bc:	10979463          	bne	a5,s1,b6c4 <__udivdi3+0x334>
    b5c0:	01061a13          	sll	s4,a2,0x10
    b5c4:	40c584b3          	sub	s1,a1,a2
    b5c8:	01065913          	srl	s2,a2,0x10
    b5cc:	010a5a13          	srl	s4,s4,0x10
    b5d0:	00100b13          	li	s6,1
    b5d4:	00090593          	mv	a1,s2
    b5d8:	00048513          	mv	a0,s1
    b5dc:	64c030ef          	jal	ec28 <__hidden___udivsi3>
    b5e0:	000a0593          	mv	a1,s4
    b5e4:	00050993          	mv	s3,a0
    b5e8:	57c030ef          	jal	eb64 <__mulsi3>
    b5ec:	00050793          	mv	a5,a0
    b5f0:	00090593          	mv	a1,s2
    b5f4:	00048513          	mv	a0,s1
    b5f8:	00078493          	mv	s1,a5
    b5fc:	674030ef          	jal	ec70 <__umodsi3>
    b600:	01051513          	sll	a0,a0,0x10
    b604:	01045793          	srl	a5,s0,0x10
    b608:	00a7e7b3          	or	a5,a5,a0
    b60c:	0097fc63          	bgeu	a5,s1,b624 <__udivdi3+0x294>
    b610:	00fa87b3          	add	a5,s5,a5
    b614:	fff98713          	add	a4,s3,-1
    b618:	0157e463          	bltu	a5,s5,b620 <__udivdi3+0x290>
    b61c:	3e97ee63          	bltu	a5,s1,ba18 <__udivdi3+0x688>
    b620:	00070993          	mv	s3,a4
    b624:	409784b3          	sub	s1,a5,s1
    b628:	00090593          	mv	a1,s2
    b62c:	00048513          	mv	a0,s1
    b630:	5f8030ef          	jal	ec28 <__hidden___udivsi3>
    b634:	000a0593          	mv	a1,s4
    b638:	00050a13          	mv	s4,a0
    b63c:	528030ef          	jal	eb64 <__mulsi3>
    b640:	00050793          	mv	a5,a0
    b644:	00090593          	mv	a1,s2
    b648:	00048513          	mv	a0,s1
    b64c:	01041413          	sll	s0,s0,0x10
    b650:	00078493          	mv	s1,a5
    b654:	61c030ef          	jal	ec70 <__umodsi3>
    b658:	01051513          	sll	a0,a0,0x10
    b65c:	01045413          	srl	s0,s0,0x10
    b660:	00a46433          	or	s0,s0,a0
    b664:	00947e63          	bgeu	s0,s1,b680 <__udivdi3+0x2f0>
    b668:	008a8433          	add	s0,s5,s0
    b66c:	fffa0793          	add	a5,s4,-1
    b670:	01546663          	bltu	s0,s5,b67c <__udivdi3+0x2ec>
    b674:	ffea0a13          	add	s4,s4,-2
    b678:	00946463          	bltu	s0,s1,b680 <__udivdi3+0x2f0>
    b67c:	00078a13          	mv	s4,a5
    b680:	01099613          	sll	a2,s3,0x10
    b684:	01466533          	or	a0,a2,s4
    b688:	e5dff06f          	j	b4e4 <__udivdi3+0x154>
    b68c:	10063713          	sltiu	a4,a2,256
    b690:	00173713          	seqz	a4,a4
    b694:	00371713          	sll	a4,a4,0x3
    b698:	d4dff06f          	j	b3e4 <__udivdi3+0x54>
    b69c:	00000693          	li	a3,0
    b6a0:	00004797          	auipc	a5,0x4
    b6a4:	03078793          	add	a5,a5,48 # f6d0 <__clz_tab>
    b6a8:	00d787b3          	add	a5,a5,a3
    b6ac:	0007c483          	lbu	s1,0(a5)
    b6b0:	00000713          	li	a4,0
    b6b4:	02000793          	li	a5,32
    b6b8:	00e484b3          	add	s1,s1,a4
    b6bc:	40978733          	sub	a4,a5,s1
    b6c0:	f09780e3          	beq	a5,s1,b5c0 <__udivdi3+0x230>
    b6c4:	00e61ab3          	sll	s5,a2,a4
    b6c8:	01712623          	sw	s7,12(sp)
    b6cc:	010ad913          	srl	s2,s5,0x10
    b6d0:	0095dbb3          	srl	s7,a1,s1
    b6d4:	00e597b3          	sll	a5,a1,a4
    b6d8:	0099d4b3          	srl	s1,s3,s1
    b6dc:	00090593          	mv	a1,s2
    b6e0:	000b8513          	mv	a0,s7
    b6e4:	010a9a13          	sll	s4,s5,0x10
    b6e8:	00f4e4b3          	or	s1,s1,a5
    b6ec:	00e99433          	sll	s0,s3,a4
    b6f0:	010a5a13          	srl	s4,s4,0x10
    b6f4:	534030ef          	jal	ec28 <__hidden___udivsi3>
    b6f8:	00050593          	mv	a1,a0
    b6fc:	00050b13          	mv	s6,a0
    b700:	000a0513          	mv	a0,s4
    b704:	460030ef          	jal	eb64 <__mulsi3>
    b708:	00050993          	mv	s3,a0
    b70c:	00090593          	mv	a1,s2
    b710:	000b8513          	mv	a0,s7
    b714:	55c030ef          	jal	ec70 <__umodsi3>
    b718:	01051513          	sll	a0,a0,0x10
    b71c:	0104d793          	srl	a5,s1,0x10
    b720:	00a7e7b3          	or	a5,a5,a0
    b724:	0137fe63          	bgeu	a5,s3,b740 <__udivdi3+0x3b0>
    b728:	00fa87b3          	add	a5,s5,a5
    b72c:	fffb0713          	add	a4,s6,-1
    b730:	2d57ec63          	bltu	a5,s5,ba08 <__udivdi3+0x678>
    b734:	2d37fa63          	bgeu	a5,s3,ba08 <__udivdi3+0x678>
    b738:	ffeb0b13          	add	s6,s6,-2
    b73c:	015787b3          	add	a5,a5,s5
    b740:	413789b3          	sub	s3,a5,s3
    b744:	00090593          	mv	a1,s2
    b748:	00098513          	mv	a0,s3
    b74c:	4dc030ef          	jal	ec28 <__hidden___udivsi3>
    b750:	00050593          	mv	a1,a0
    b754:	00050b93          	mv	s7,a0
    b758:	000a0513          	mv	a0,s4
    b75c:	408030ef          	jal	eb64 <__mulsi3>
    b760:	00050793          	mv	a5,a0
    b764:	00090593          	mv	a1,s2
    b768:	00098513          	mv	a0,s3
    b76c:	01049493          	sll	s1,s1,0x10
    b770:	00078993          	mv	s3,a5
    b774:	4fc030ef          	jal	ec70 <__umodsi3>
    b778:	01051513          	sll	a0,a0,0x10
    b77c:	0104d493          	srl	s1,s1,0x10
    b780:	00a4e4b3          	or	s1,s1,a0
    b784:	0134fe63          	bgeu	s1,s3,b7a0 <__udivdi3+0x410>
    b788:	009a84b3          	add	s1,s5,s1
    b78c:	fffb8793          	add	a5,s7,-1
    b790:	2754e463          	bltu	s1,s5,b9f8 <__udivdi3+0x668>
    b794:	2734f263          	bgeu	s1,s3,b9f8 <__udivdi3+0x668>
    b798:	ffeb8b93          	add	s7,s7,-2
    b79c:	015484b3          	add	s1,s1,s5
    b7a0:	010b1b13          	sll	s6,s6,0x10
    b7a4:	017b6b33          	or	s6,s6,s7
    b7a8:	413484b3          	sub	s1,s1,s3
    b7ac:	00c12b83          	lw	s7,12(sp)
    b7b0:	e25ff06f          	j	b5d4 <__udivdi3+0x244>
    b7b4:	1006b793          	sltiu	a5,a3,256
    b7b8:	0017b793          	seqz	a5,a5
    b7bc:	00379793          	sll	a5,a5,0x3
    b7c0:	00f6d533          	srl	a0,a3,a5
    b7c4:	00004717          	auipc	a4,0x4
    b7c8:	f0c70713          	add	a4,a4,-244 # f6d0 <__clz_tab>
    b7cc:	00a70733          	add	a4,a4,a0
    b7d0:	00074703          	lbu	a4,0(a4)
    b7d4:	02000513          	li	a0,32
    b7d8:	00f70733          	add	a4,a4,a5
    b7dc:	40e50b33          	sub	s6,a0,a4
    b7e0:	d8e508e3          	beq	a0,a4,b570 <__udivdi3+0x1e0>
    b7e4:	016696b3          	sll	a3,a3,s6
    b7e8:	01912223          	sw	s9,4(sp)
    b7ec:	00e65cb3          	srl	s9,a2,a4
    b7f0:	00dcecb3          	or	s9,s9,a3
    b7f4:	01512a23          	sw	s5,20(sp)
    b7f8:	01712623          	sw	s7,12(sp)
    b7fc:	010cda93          	srl	s5,s9,0x10
    b800:	00e5dbb3          	srl	s7,a1,a4
    b804:	016597b3          	sll	a5,a1,s6
    b808:	00e9d733          	srl	a4,s3,a4
    b80c:	01812423          	sw	s8,8(sp)
    b810:	000a8593          	mv	a1,s5
    b814:	000b8513          	mv	a0,s7
    b818:	010c9c13          	sll	s8,s9,0x10
    b81c:	02812423          	sw	s0,40(sp)
    b820:	02912223          	sw	s1,36(sp)
    b824:	03212023          	sw	s2,32(sp)
    b828:	00f764b3          	or	s1,a4,a5
    b82c:	01661933          	sll	s2,a2,s6
    b830:	01412c23          	sw	s4,24(sp)
    b834:	010c5c13          	srl	s8,s8,0x10
    b838:	3f0030ef          	jal	ec28 <__hidden___udivsi3>
    b83c:	00050593          	mv	a1,a0
    b840:	00050413          	mv	s0,a0
    b844:	000c0513          	mv	a0,s8
    b848:	31c030ef          	jal	eb64 <__mulsi3>
    b84c:	00050a13          	mv	s4,a0
    b850:	000a8593          	mv	a1,s5
    b854:	000b8513          	mv	a0,s7
    b858:	418030ef          	jal	ec70 <__umodsi3>
    b85c:	01051513          	sll	a0,a0,0x10
    b860:	0104d793          	srl	a5,s1,0x10
    b864:	00a7e7b3          	or	a5,a5,a0
    b868:	0147fe63          	bgeu	a5,s4,b884 <__udivdi3+0x4f4>
    b86c:	00fc87b3          	add	a5,s9,a5
    b870:	fff40713          	add	a4,s0,-1
    b874:	1997ee63          	bltu	a5,s9,ba10 <__udivdi3+0x680>
    b878:	1947fc63          	bgeu	a5,s4,ba10 <__udivdi3+0x680>
    b87c:	ffe40413          	add	s0,s0,-2
    b880:	019787b3          	add	a5,a5,s9
    b884:	41478a33          	sub	s4,a5,s4
    b888:	000a8593          	mv	a1,s5
    b88c:	000a0513          	mv	a0,s4
    b890:	398030ef          	jal	ec28 <__hidden___udivsi3>
    b894:	00050593          	mv	a1,a0
    b898:	00050b93          	mv	s7,a0
    b89c:	000c0513          	mv	a0,s8
    b8a0:	2c4030ef          	jal	eb64 <__mulsi3>
    b8a4:	00050793          	mv	a5,a0
    b8a8:	000a8593          	mv	a1,s5
    b8ac:	000a0513          	mv	a0,s4
    b8b0:	00078a13          	mv	s4,a5
    b8b4:	3bc030ef          	jal	ec70 <__umodsi3>
    b8b8:	01049713          	sll	a4,s1,0x10
    b8bc:	01051513          	sll	a0,a0,0x10
    b8c0:	01075713          	srl	a4,a4,0x10
    b8c4:	00a76733          	or	a4,a4,a0
    b8c8:	01477e63          	bgeu	a4,s4,b8e4 <__udivdi3+0x554>
    b8cc:	00ec8733          	add	a4,s9,a4
    b8d0:	fffb8793          	add	a5,s7,-1
    b8d4:	13976663          	bltu	a4,s9,ba00 <__udivdi3+0x670>
    b8d8:	13477463          	bgeu	a4,s4,ba00 <__udivdi3+0x670>
    b8dc:	ffeb8b93          	add	s7,s7,-2
    b8e0:	01970733          	add	a4,a4,s9
    b8e4:	00010e37          	lui	t3,0x10
    b8e8:	01041413          	sll	s0,s0,0x10
    b8ec:	01746433          	or	s0,s0,s7
    b8f0:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    b8f4:	00f47833          	and	a6,s0,a5
    b8f8:	00f977b3          	and	a5,s2,a5
    b8fc:	41470733          	sub	a4,a4,s4
    b900:	01045e93          	srl	t4,s0,0x10
    b904:	01095913          	srl	s2,s2,0x10
    b908:	00080513          	mv	a0,a6
    b90c:	00078593          	mv	a1,a5
    b910:	254030ef          	jal	eb64 <__mulsi3>
    b914:	00050313          	mv	t1,a0
    b918:	00090593          	mv	a1,s2
    b91c:	00080513          	mv	a0,a6
    b920:	244030ef          	jal	eb64 <__mulsi3>
    b924:	00050813          	mv	a6,a0
    b928:	00078593          	mv	a1,a5
    b92c:	000e8513          	mv	a0,t4
    b930:	234030ef          	jal	eb64 <__mulsi3>
    b934:	00050893          	mv	a7,a0
    b938:	00090593          	mv	a1,s2
    b93c:	000e8513          	mv	a0,t4
    b940:	224030ef          	jal	eb64 <__mulsi3>
    b944:	01035793          	srl	a5,t1,0x10
    b948:	01180833          	add	a6,a6,a7
    b94c:	010787b3          	add	a5,a5,a6
    b950:	0117f463          	bgeu	a5,a7,b958 <__udivdi3+0x5c8>
    b954:	01c50533          	add	a0,a0,t3
    b958:	0107d693          	srl	a3,a5,0x10
    b95c:	00a686b3          	add	a3,a3,a0
    b960:	06d76863          	bltu	a4,a3,b9d0 <__udivdi3+0x640>
    b964:	04d70663          	beq	a4,a3,b9b0 <__udivdi3+0x620>
    b968:	00040513          	mv	a0,s0
    b96c:	02812403          	lw	s0,40(sp)
    b970:	02c12083          	lw	ra,44(sp)
    b974:	00000b13          	li	s6,0
    b978:	02412483          	lw	s1,36(sp)
    b97c:	02012903          	lw	s2,32(sp)
    b980:	01812a03          	lw	s4,24(sp)
    b984:	01412a83          	lw	s5,20(sp)
    b988:	00c12b83          	lw	s7,12(sp)
    b98c:	00812c03          	lw	s8,8(sp)
    b990:	00412c83          	lw	s9,4(sp)
    b994:	01c12983          	lw	s3,28(sp)
    b998:	000b0593          	mv	a1,s6
    b99c:	01012b03          	lw	s6,16(sp)
    b9a0:	03010113          	add	sp,sp,48
    b9a4:	00008067          	ret
    b9a8:	00078993          	mv	s3,a5
    b9ac:	b2dff06f          	j	b4d8 <__udivdi3+0x148>
    b9b0:	00010737          	lui	a4,0x10
    b9b4:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    b9b8:	00e7f7b3          	and	a5,a5,a4
    b9bc:	01079793          	sll	a5,a5,0x10
    b9c0:	00e37333          	and	t1,t1,a4
    b9c4:	01699533          	sll	a0,s3,s6
    b9c8:	006787b3          	add	a5,a5,t1
    b9cc:	f8f57ee3          	bgeu	a0,a5,b968 <__udivdi3+0x5d8>
    b9d0:	fff40513          	add	a0,s0,-1
    b9d4:	f99ff06f          	j	b96c <__udivdi3+0x5dc>
    b9d8:	010007b7          	lui	a5,0x1000
    b9dc:	04f67a63          	bgeu	a2,a5,ba30 <__udivdi3+0x6a0>
    b9e0:	01065693          	srl	a3,a2,0x10
    b9e4:	01000713          	li	a4,16
    b9e8:	bb9ff06f          	j	b5a0 <__udivdi3+0x210>
    b9ec:	00000b13          	li	s6,0
    b9f0:	00100513          	li	a0,1
    b9f4:	b29ff06f          	j	b51c <__udivdi3+0x18c>
    b9f8:	00078b93          	mv	s7,a5
    b9fc:	da5ff06f          	j	b7a0 <__udivdi3+0x410>
    ba00:	00078b93          	mv	s7,a5
    ba04:	ee1ff06f          	j	b8e4 <__udivdi3+0x554>
    ba08:	00070b13          	mv	s6,a4
    ba0c:	d35ff06f          	j	b740 <__udivdi3+0x3b0>
    ba10:	00070413          	mv	s0,a4
    ba14:	e71ff06f          	j	b884 <__udivdi3+0x4f4>
    ba18:	ffe98993          	add	s3,s3,-2
    ba1c:	015787b3          	add	a5,a5,s5
    ba20:	c05ff06f          	j	b624 <__udivdi3+0x294>
    ba24:	ffe90913          	add	s2,s2,-2
    ba28:	015787b3          	add	a5,a5,s5
    ba2c:	a51ff06f          	j	b47c <__udivdi3+0xec>
    ba30:	01865693          	srl	a3,a2,0x18
    ba34:	01800713          	li	a4,24
    ba38:	b69ff06f          	j	b5a0 <__udivdi3+0x210>

0000ba3c <__umoddi3>:
    ba3c:	fd010113          	add	sp,sp,-48
    ba40:	02112623          	sw	ra,44(sp)
    ba44:	00050793          	mv	a5,a0
    ba48:	14069663          	bnez	a3,bb94 <__umoddi3+0x158>
    ba4c:	03212023          	sw	s2,32(sp)
    ba50:	01412c23          	sw	s4,24(sp)
    ba54:	02812423          	sw	s0,40(sp)
    ba58:	02912223          	sw	s1,36(sp)
    ba5c:	01312e23          	sw	s3,28(sp)
    ba60:	01512a23          	sw	s5,20(sp)
    ba64:	00060a13          	mv	s4,a2
    ba68:	00050913          	mv	s2,a0
    ba6c:	1ac5f663          	bgeu	a1,a2,bc18 <__umoddi3+0x1dc>
    ba70:	01612823          	sw	s6,16(sp)
    ba74:	00010737          	lui	a4,0x10
    ba78:	00058993          	mv	s3,a1
    ba7c:	28e66063          	bltu	a2,a4,bcfc <__umoddi3+0x2c0>
    ba80:	01000737          	lui	a4,0x1000
    ba84:	01800693          	li	a3,24
    ba88:	00e67463          	bgeu	a2,a4,ba90 <__umoddi3+0x54>
    ba8c:	01000693          	li	a3,16
    ba90:	00d65533          	srl	a0,a2,a3
    ba94:	00004717          	auipc	a4,0x4
    ba98:	c3c70713          	add	a4,a4,-964 # f6d0 <__clz_tab>
    ba9c:	00a70733          	add	a4,a4,a0
    baa0:	00074703          	lbu	a4,0(a4)
    baa4:	02000513          	li	a0,32
    baa8:	00d70733          	add	a4,a4,a3
    baac:	40e504b3          	sub	s1,a0,a4
    bab0:	00e50c63          	beq	a0,a4,bac8 <__umoddi3+0x8c>
    bab4:	009599b3          	sll	s3,a1,s1
    bab8:	00e7d733          	srl	a4,a5,a4
    babc:	00961a33          	sll	s4,a2,s1
    bac0:	013769b3          	or	s3,a4,s3
    bac4:	00979933          	sll	s2,a5,s1
    bac8:	010a5a93          	srl	s5,s4,0x10
    bacc:	000a8593          	mv	a1,s5
    bad0:	00098513          	mv	a0,s3
    bad4:	010a1b13          	sll	s6,s4,0x10
    bad8:	150030ef          	jal	ec28 <__hidden___udivsi3>
    badc:	010b5b13          	srl	s6,s6,0x10
    bae0:	000b0593          	mv	a1,s6
    bae4:	080030ef          	jal	eb64 <__mulsi3>
    bae8:	00050413          	mv	s0,a0
    baec:	000a8593          	mv	a1,s5
    baf0:	00098513          	mv	a0,s3
    baf4:	17c030ef          	jal	ec70 <__umodsi3>
    baf8:	01051513          	sll	a0,a0,0x10
    bafc:	01095793          	srl	a5,s2,0x10
    bb00:	00a7e7b3          	or	a5,a5,a0
    bb04:	0087f863          	bgeu	a5,s0,bb14 <__umoddi3+0xd8>
    bb08:	00fa07b3          	add	a5,s4,a5
    bb0c:	0147e463          	bltu	a5,s4,bb14 <__umoddi3+0xd8>
    bb10:	5687e863          	bltu	a5,s0,c080 <__umoddi3+0x644>
    bb14:	40878433          	sub	s0,a5,s0
    bb18:	000a8593          	mv	a1,s5
    bb1c:	00040513          	mv	a0,s0
    bb20:	108030ef          	jal	ec28 <__hidden___udivsi3>
    bb24:	000b0593          	mv	a1,s6
    bb28:	03c030ef          	jal	eb64 <__mulsi3>
    bb2c:	00050793          	mv	a5,a0
    bb30:	000a8593          	mv	a1,s5
    bb34:	00040513          	mv	a0,s0
    bb38:	00078413          	mv	s0,a5
    bb3c:	134030ef          	jal	ec70 <__umodsi3>
    bb40:	01091793          	sll	a5,s2,0x10
    bb44:	01051513          	sll	a0,a0,0x10
    bb48:	0107d793          	srl	a5,a5,0x10
    bb4c:	00a7e7b3          	or	a5,a5,a0
    bb50:	0087f863          	bgeu	a5,s0,bb60 <__umoddi3+0x124>
    bb54:	00fa07b3          	add	a5,s4,a5
    bb58:	0147e463          	bltu	a5,s4,bb60 <__umoddi3+0x124>
    bb5c:	5087ea63          	bltu	a5,s0,c070 <__umoddi3+0x634>
    bb60:	01012b03          	lw	s6,16(sp)
    bb64:	408787b3          	sub	a5,a5,s0
    bb68:	0097d533          	srl	a0,a5,s1
    bb6c:	02812403          	lw	s0,40(sp)
    bb70:	02412483          	lw	s1,36(sp)
    bb74:	02012903          	lw	s2,32(sp)
    bb78:	01c12983          	lw	s3,28(sp)
    bb7c:	01812a03          	lw	s4,24(sp)
    bb80:	01412a83          	lw	s5,20(sp)
    bb84:	00000593          	li	a1,0
    bb88:	02c12083          	lw	ra,44(sp)
    bb8c:	03010113          	add	sp,sp,48
    bb90:	00008067          	ret
    bb94:	00050893          	mv	a7,a0
    bb98:	fed5e8e3          	bltu	a1,a3,bb88 <__umoddi3+0x14c>
    bb9c:	03212023          	sw	s2,32(sp)
    bba0:	01312e23          	sw	s3,28(sp)
    bba4:	00010737          	lui	a4,0x10
    bba8:	00058813          	mv	a6,a1
    bbac:	24e6ec63          	bltu	a3,a4,be04 <__umoddi3+0x3c8>
    bbb0:	01000737          	lui	a4,0x1000
    bbb4:	01800513          	li	a0,24
    bbb8:	00e6f463          	bgeu	a3,a4,bbc0 <__umoddi3+0x184>
    bbbc:	01000513          	li	a0,16
    bbc0:	00a6d333          	srl	t1,a3,a0
    bbc4:	00004717          	auipc	a4,0x4
    bbc8:	b0c70713          	add	a4,a4,-1268 # f6d0 <__clz_tab>
    bbcc:	00670733          	add	a4,a4,t1
    bbd0:	00074703          	lbu	a4,0(a4)
    bbd4:	02000313          	li	t1,32
    bbd8:	00a709b3          	add	s3,a4,a0
    bbdc:	41330933          	sub	s2,t1,s3
    bbe0:	25331a63          	bne	t1,s3,be34 <__umoddi3+0x3f8>
    bbe4:	00b6e463          	bltu	a3,a1,bbec <__umoddi3+0x1b0>
    bbe8:	00c7ea63          	bltu	a5,a2,bbfc <__umoddi3+0x1c0>
    bbec:	40c788b3          	sub	a7,a5,a2
    bbf0:	40d586b3          	sub	a3,a1,a3
    bbf4:	0117b833          	sltu	a6,a5,a7
    bbf8:	41068833          	sub	a6,a3,a6
    bbfc:	02c12083          	lw	ra,44(sp)
    bc00:	02012903          	lw	s2,32(sp)
    bc04:	01c12983          	lw	s3,28(sp)
    bc08:	00088513          	mv	a0,a7
    bc0c:	00080593          	mv	a1,a6
    bc10:	03010113          	add	sp,sp,48
    bc14:	00008067          	ret
    bc18:	0e060a63          	beqz	a2,bd0c <__umoddi3+0x2d0>
    bc1c:	00010737          	lui	a4,0x10
    bc20:	42e67663          	bgeu	a2,a4,c04c <__umoddi3+0x610>
    bc24:	10063693          	sltiu	a3,a2,256
    bc28:	0016b693          	seqz	a3,a3
    bc2c:	00369693          	sll	a3,a3,0x3
    bc30:	00d65533          	srl	a0,a2,a3
    bc34:	00004717          	auipc	a4,0x4
    bc38:	a9c70713          	add	a4,a4,-1380 # f6d0 <__clz_tab>
    bc3c:	00a70733          	add	a4,a4,a0
    bc40:	00074983          	lbu	s3,0(a4)
    bc44:	02000713          	li	a4,32
    bc48:	00d989b3          	add	s3,s3,a3
    bc4c:	413704b3          	sub	s1,a4,s3
    bc50:	0f371263          	bne	a4,s3,bd34 <__umoddi3+0x2f8>
    bc54:	01061413          	sll	s0,a2,0x10
    bc58:	40c589b3          	sub	s3,a1,a2
    bc5c:	01065a93          	srl	s5,a2,0x10
    bc60:	01045413          	srl	s0,s0,0x10
    bc64:	000a8593          	mv	a1,s5
    bc68:	00098513          	mv	a0,s3
    bc6c:	7bd020ef          	jal	ec28 <__hidden___udivsi3>
    bc70:	00040593          	mv	a1,s0
    bc74:	6f1020ef          	jal	eb64 <__mulsi3>
    bc78:	00050793          	mv	a5,a0
    bc7c:	000a8593          	mv	a1,s5
    bc80:	00098513          	mv	a0,s3
    bc84:	00078993          	mv	s3,a5
    bc88:	7e9020ef          	jal	ec70 <__umodsi3>
    bc8c:	01051513          	sll	a0,a0,0x10
    bc90:	01095793          	srl	a5,s2,0x10
    bc94:	00a7e7b3          	or	a5,a5,a0
    bc98:	0137f863          	bgeu	a5,s3,bca8 <__umoddi3+0x26c>
    bc9c:	00fa07b3          	add	a5,s4,a5
    bca0:	0147e463          	bltu	a5,s4,bca8 <__umoddi3+0x26c>
    bca4:	3d37ea63          	bltu	a5,s3,c078 <__umoddi3+0x63c>
    bca8:	413789b3          	sub	s3,a5,s3
    bcac:	000a8593          	mv	a1,s5
    bcb0:	00098513          	mv	a0,s3
    bcb4:	775020ef          	jal	ec28 <__hidden___udivsi3>
    bcb8:	00040593          	mv	a1,s0
    bcbc:	6a9020ef          	jal	eb64 <__mulsi3>
    bcc0:	00050413          	mv	s0,a0
    bcc4:	000a8593          	mv	a1,s5
    bcc8:	00098513          	mv	a0,s3
    bccc:	7a5020ef          	jal	ec70 <__umodsi3>
    bcd0:	01091913          	sll	s2,s2,0x10
    bcd4:	01051793          	sll	a5,a0,0x10
    bcd8:	01095913          	srl	s2,s2,0x10
    bcdc:	00f967b3          	or	a5,s2,a5
    bce0:	0087fa63          	bgeu	a5,s0,bcf4 <__umoddi3+0x2b8>
    bce4:	00fa07b3          	add	a5,s4,a5
    bce8:	0147e663          	bltu	a5,s4,bcf4 <__umoddi3+0x2b8>
    bcec:	0087f463          	bgeu	a5,s0,bcf4 <__umoddi3+0x2b8>
    bcf0:	014787b3          	add	a5,a5,s4
    bcf4:	408787b3          	sub	a5,a5,s0
    bcf8:	e71ff06f          	j	bb68 <__umoddi3+0x12c>
    bcfc:	10063693          	sltiu	a3,a2,256
    bd00:	0016b693          	seqz	a3,a3
    bd04:	00369693          	sll	a3,a3,0x3
    bd08:	d89ff06f          	j	ba90 <__umoddi3+0x54>
    bd0c:	00000513          	li	a0,0
    bd10:	00004717          	auipc	a4,0x4
    bd14:	9c070713          	add	a4,a4,-1600 # f6d0 <__clz_tab>
    bd18:	00a70733          	add	a4,a4,a0
    bd1c:	00074983          	lbu	s3,0(a4)
    bd20:	00000693          	li	a3,0
    bd24:	02000713          	li	a4,32
    bd28:	00d989b3          	add	s3,s3,a3
    bd2c:	413704b3          	sub	s1,a4,s3
    bd30:	f33702e3          	beq	a4,s3,bc54 <__umoddi3+0x218>
    bd34:	00961a33          	sll	s4,a2,s1
    bd38:	01712623          	sw	s7,12(sp)
    bd3c:	010a5a93          	srl	s5,s4,0x10
    bd40:	0135dbb3          	srl	s7,a1,s3
    bd44:	00959733          	sll	a4,a1,s1
    bd48:	0137d9b3          	srl	s3,a5,s3
    bd4c:	000a8593          	mv	a1,s5
    bd50:	000b8513          	mv	a0,s7
    bd54:	010a1413          	sll	s0,s4,0x10
    bd58:	00e9e9b3          	or	s3,s3,a4
    bd5c:	00979933          	sll	s2,a5,s1
    bd60:	01612823          	sw	s6,16(sp)
    bd64:	01045413          	srl	s0,s0,0x10
    bd68:	6c1020ef          	jal	ec28 <__hidden___udivsi3>
    bd6c:	00040593          	mv	a1,s0
    bd70:	5f5020ef          	jal	eb64 <__mulsi3>
    bd74:	00050b13          	mv	s6,a0
    bd78:	000a8593          	mv	a1,s5
    bd7c:	000b8513          	mv	a0,s7
    bd80:	6f1020ef          	jal	ec70 <__umodsi3>
    bd84:	01051513          	sll	a0,a0,0x10
    bd88:	0109d793          	srl	a5,s3,0x10
    bd8c:	00a7e7b3          	or	a5,a5,a0
    bd90:	0167fa63          	bgeu	a5,s6,bda4 <__umoddi3+0x368>
    bd94:	00fa07b3          	add	a5,s4,a5
    bd98:	0147e663          	bltu	a5,s4,bda4 <__umoddi3+0x368>
    bd9c:	0167f463          	bgeu	a5,s6,bda4 <__umoddi3+0x368>
    bda0:	014787b3          	add	a5,a5,s4
    bda4:	41678b33          	sub	s6,a5,s6
    bda8:	000a8593          	mv	a1,s5
    bdac:	000b0513          	mv	a0,s6
    bdb0:	679020ef          	jal	ec28 <__hidden___udivsi3>
    bdb4:	00040593          	mv	a1,s0
    bdb8:	5ad020ef          	jal	eb64 <__mulsi3>
    bdbc:	00050793          	mv	a5,a0
    bdc0:	000a8593          	mv	a1,s5
    bdc4:	000b0513          	mv	a0,s6
    bdc8:	01099993          	sll	s3,s3,0x10
    bdcc:	00078b13          	mv	s6,a5
    bdd0:	6a1020ef          	jal	ec70 <__umodsi3>
    bdd4:	01051513          	sll	a0,a0,0x10
    bdd8:	0109d993          	srl	s3,s3,0x10
    bddc:	00a9e9b3          	or	s3,s3,a0
    bde0:	0169fa63          	bgeu	s3,s6,bdf4 <__umoddi3+0x3b8>
    bde4:	013a09b3          	add	s3,s4,s3
    bde8:	0149e663          	bltu	s3,s4,bdf4 <__umoddi3+0x3b8>
    bdec:	0169f463          	bgeu	s3,s6,bdf4 <__umoddi3+0x3b8>
    bdf0:	014989b3          	add	s3,s3,s4
    bdf4:	416989b3          	sub	s3,s3,s6
    bdf8:	00c12b83          	lw	s7,12(sp)
    bdfc:	01012b03          	lw	s6,16(sp)
    be00:	e65ff06f          	j	bc64 <__umoddi3+0x228>
    be04:	1006b513          	sltiu	a0,a3,256
    be08:	00153513          	seqz	a0,a0
    be0c:	00351513          	sll	a0,a0,0x3
    be10:	00a6d333          	srl	t1,a3,a0
    be14:	00004717          	auipc	a4,0x4
    be18:	8bc70713          	add	a4,a4,-1860 # f6d0 <__clz_tab>
    be1c:	00670733          	add	a4,a4,t1
    be20:	00074703          	lbu	a4,0(a4)
    be24:	02000313          	li	t1,32
    be28:	00a709b3          	add	s3,a4,a0
    be2c:	41330933          	sub	s2,t1,s3
    be30:	db330ae3          	beq	t1,s3,bbe4 <__umoddi3+0x1a8>
    be34:	01512a23          	sw	s5,20(sp)
    be38:	012696b3          	sll	a3,a3,s2
    be3c:	01365ab3          	srl	s5,a2,s3
    be40:	00daeab3          	or	s5,s5,a3
    be44:	01712623          	sw	s7,12(sp)
    be48:	01a12023          	sw	s10,0(sp)
    be4c:	010adb93          	srl	s7,s5,0x10
    be50:	0135dd33          	srl	s10,a1,s3
    be54:	01259733          	sll	a4,a1,s2
    be58:	0137d6b3          	srl	a3,a5,s3
    be5c:	01912223          	sw	s9,4(sp)
    be60:	000b8593          	mv	a1,s7
    be64:	000d0513          	mv	a0,s10
    be68:	010a9c93          	sll	s9,s5,0x10
    be6c:	02812423          	sw	s0,40(sp)
    be70:	02912223          	sw	s1,36(sp)
    be74:	01261433          	sll	s0,a2,s2
    be78:	012794b3          	sll	s1,a5,s2
    be7c:	01412c23          	sw	s4,24(sp)
    be80:	01612823          	sw	s6,16(sp)
    be84:	00e6ea33          	or	s4,a3,a4
    be88:	01812423          	sw	s8,8(sp)
    be8c:	010cdc93          	srl	s9,s9,0x10
    be90:	599020ef          	jal	ec28 <__hidden___udivsi3>
    be94:	00050593          	mv	a1,a0
    be98:	00050b13          	mv	s6,a0
    be9c:	000c8513          	mv	a0,s9
    bea0:	4c5020ef          	jal	eb64 <__mulsi3>
    bea4:	00050c13          	mv	s8,a0
    bea8:	000b8593          	mv	a1,s7
    beac:	000d0513          	mv	a0,s10
    beb0:	5c1020ef          	jal	ec70 <__umodsi3>
    beb4:	01051513          	sll	a0,a0,0x10
    beb8:	010a5793          	srl	a5,s4,0x10
    bebc:	00a7e7b3          	or	a5,a5,a0
    bec0:	0187fe63          	bgeu	a5,s8,bedc <__umoddi3+0x4a0>
    bec4:	00fa87b3          	add	a5,s5,a5
    bec8:	fffb0713          	add	a4,s6,-1
    becc:	1957ee63          	bltu	a5,s5,c068 <__umoddi3+0x62c>
    bed0:	1987fc63          	bgeu	a5,s8,c068 <__umoddi3+0x62c>
    bed4:	ffeb0b13          	add	s6,s6,-2
    bed8:	015787b3          	add	a5,a5,s5
    bedc:	41878c33          	sub	s8,a5,s8
    bee0:	000b8593          	mv	a1,s7
    bee4:	000c0513          	mv	a0,s8
    bee8:	541020ef          	jal	ec28 <__hidden___udivsi3>
    beec:	00050593          	mv	a1,a0
    bef0:	00050d13          	mv	s10,a0
    bef4:	000c8513          	mv	a0,s9
    bef8:	46d020ef          	jal	eb64 <__mulsi3>
    befc:	00050793          	mv	a5,a0
    bf00:	000b8593          	mv	a1,s7
    bf04:	000c0513          	mv	a0,s8
    bf08:	00078b93          	mv	s7,a5
    bf0c:	565020ef          	jal	ec70 <__umodsi3>
    bf10:	010a1593          	sll	a1,s4,0x10
    bf14:	01051513          	sll	a0,a0,0x10
    bf18:	0105d593          	srl	a1,a1,0x10
    bf1c:	00a5e5b3          	or	a1,a1,a0
    bf20:	0175fe63          	bgeu	a1,s7,bf3c <__umoddi3+0x500>
    bf24:	00ba85b3          	add	a1,s5,a1
    bf28:	fffd0793          	add	a5,s10,-1
    bf2c:	1355ea63          	bltu	a1,s5,c060 <__umoddi3+0x624>
    bf30:	1375f863          	bgeu	a1,s7,c060 <__umoddi3+0x624>
    bf34:	ffed0d13          	add	s10,s10,-2
    bf38:	015585b3          	add	a1,a1,s5
    bf3c:	010b1793          	sll	a5,s6,0x10
    bf40:	00010e37          	lui	t3,0x10
    bf44:	01a7e7b3          	or	a5,a5,s10
    bf48:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    bf4c:	0067f8b3          	and	a7,a5,t1
    bf50:	00647333          	and	t1,s0,t1
    bf54:	41758733          	sub	a4,a1,s7
    bf58:	0107d793          	srl	a5,a5,0x10
    bf5c:	01045e93          	srl	t4,s0,0x10
    bf60:	00088513          	mv	a0,a7
    bf64:	00030593          	mv	a1,t1
    bf68:	3fd020ef          	jal	eb64 <__mulsi3>
    bf6c:	00050813          	mv	a6,a0
    bf70:	000e8593          	mv	a1,t4
    bf74:	00088513          	mv	a0,a7
    bf78:	3ed020ef          	jal	eb64 <__mulsi3>
    bf7c:	00050893          	mv	a7,a0
    bf80:	00030593          	mv	a1,t1
    bf84:	00078513          	mv	a0,a5
    bf88:	3dd020ef          	jal	eb64 <__mulsi3>
    bf8c:	00050313          	mv	t1,a0
    bf90:	000e8593          	mv	a1,t4
    bf94:	00078513          	mv	a0,a5
    bf98:	3cd020ef          	jal	eb64 <__mulsi3>
    bf9c:	01085793          	srl	a5,a6,0x10
    bfa0:	006888b3          	add	a7,a7,t1
    bfa4:	011787b3          	add	a5,a5,a7
    bfa8:	0067f463          	bgeu	a5,t1,bfb0 <__umoddi3+0x574>
    bfac:	01c50533          	add	a0,a0,t3
    bfb0:	00010637          	lui	a2,0x10
    bfb4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    bfb8:	0107d693          	srl	a3,a5,0x10
    bfbc:	00c7f7b3          	and	a5,a5,a2
    bfc0:	01079793          	sll	a5,a5,0x10
    bfc4:	00c87833          	and	a6,a6,a2
    bfc8:	00a686b3          	add	a3,a3,a0
    bfcc:	010787b3          	add	a5,a5,a6
    bfd0:	06d76263          	bltu	a4,a3,c034 <__umoddi3+0x5f8>
    bfd4:	04d70e63          	beq	a4,a3,c030 <__umoddi3+0x5f4>
    bfd8:	40f487b3          	sub	a5,s1,a5
    bfdc:	00f4b4b3          	sltu	s1,s1,a5
    bfe0:	02812403          	lw	s0,40(sp)
    bfe4:	02c12083          	lw	ra,44(sp)
    bfe8:	40d705b3          	sub	a1,a4,a3
    bfec:	409585b3          	sub	a1,a1,s1
    bff0:	01359733          	sll	a4,a1,s3
    bff4:	0127d7b3          	srl	a5,a5,s2
    bff8:	02412483          	lw	s1,36(sp)
    bffc:	01c12983          	lw	s3,28(sp)
    c000:	01812a03          	lw	s4,24(sp)
    c004:	01412a83          	lw	s5,20(sp)
    c008:	01012b03          	lw	s6,16(sp)
    c00c:	00c12b83          	lw	s7,12(sp)
    c010:	00812c03          	lw	s8,8(sp)
    c014:	00412c83          	lw	s9,4(sp)
    c018:	00012d03          	lw	s10,0(sp)
    c01c:	0125d5b3          	srl	a1,a1,s2
    c020:	00f76533          	or	a0,a4,a5
    c024:	02012903          	lw	s2,32(sp)
    c028:	03010113          	add	sp,sp,48
    c02c:	00008067          	ret
    c030:	faf4f4e3          	bgeu	s1,a5,bfd8 <__umoddi3+0x59c>
    c034:	40878433          	sub	s0,a5,s0
    c038:	0087b7b3          	sltu	a5,a5,s0
    c03c:	01578ab3          	add	s5,a5,s5
    c040:	415686b3          	sub	a3,a3,s5
    c044:	00040793          	mv	a5,s0
    c048:	f91ff06f          	j	bfd8 <__umoddi3+0x59c>
    c04c:	01000737          	lui	a4,0x1000
    c050:	02e67c63          	bgeu	a2,a4,c088 <__umoddi3+0x64c>
    c054:	01065513          	srl	a0,a2,0x10
    c058:	01000693          	li	a3,16
    c05c:	bd9ff06f          	j	bc34 <__umoddi3+0x1f8>
    c060:	00078d13          	mv	s10,a5
    c064:	ed9ff06f          	j	bf3c <__umoddi3+0x500>
    c068:	00070b13          	mv	s6,a4
    c06c:	e71ff06f          	j	bedc <__umoddi3+0x4a0>
    c070:	014787b3          	add	a5,a5,s4
    c074:	aedff06f          	j	bb60 <__umoddi3+0x124>
    c078:	014787b3          	add	a5,a5,s4
    c07c:	c2dff06f          	j	bca8 <__umoddi3+0x26c>
    c080:	014787b3          	add	a5,a5,s4
    c084:	a91ff06f          	j	bb14 <__umoddi3+0xd8>
    c088:	01865513          	srl	a0,a2,0x18
    c08c:	01800693          	li	a3,24
    c090:	ba5ff06f          	j	bc34 <__umoddi3+0x1f8>

0000c094 <__adddf3>:
    c094:	001007b7          	lui	a5,0x100
    c098:	fe010113          	add	sp,sp,-32
    c09c:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c0a0:	00bef833          	and	a6,t4,a1
    c0a4:	00def7b3          	and	a5,t4,a3
    c0a8:	0146d313          	srl	t1,a3,0x14
    c0ac:	01212823          	sw	s2,16(sp)
    c0b0:	0145d913          	srl	s2,a1,0x14
    c0b4:	00379793          	sll	a5,a5,0x3
    c0b8:	00812c23          	sw	s0,24(sp)
    c0bc:	00381813          	sll	a6,a6,0x3
    c0c0:	01f5d413          	srl	s0,a1,0x1f
    c0c4:	01d55713          	srl	a4,a0,0x1d
    c0c8:	01d65893          	srl	a7,a2,0x1d
    c0cc:	7ff97913          	and	s2,s2,2047
    c0d0:	7ff37313          	and	t1,t1,2047
    c0d4:	00112e23          	sw	ra,28(sp)
    c0d8:	00912a23          	sw	s1,20(sp)
    c0dc:	01312623          	sw	s3,12(sp)
    c0e0:	01f6d693          	srl	a3,a3,0x1f
    c0e4:	00f8e8b3          	or	a7,a7,a5
    c0e8:	01076733          	or	a4,a4,a6
    c0ec:	00351593          	sll	a1,a0,0x3
    c0f0:	00361f13          	sll	t5,a2,0x3
    c0f4:	406907b3          	sub	a5,s2,t1
    c0f8:	1ed40463          	beq	s0,a3,c2e0 <__adddf3+0x24c>
    c0fc:	16f05263          	blez	a5,c260 <__adddf3+0x1cc>
    c100:	28030663          	beqz	t1,c38c <__adddf3+0x2f8>
    c104:	7ff00693          	li	a3,2047
    c108:	42d90663          	beq	s2,a3,c534 <__adddf3+0x4a0>
    c10c:	03800693          	li	a3,56
    c110:	00100613          	li	a2,1
    c114:	02f6ce63          	blt	a3,a5,c150 <__adddf3+0xbc>
    c118:	008006b7          	lui	a3,0x800
    c11c:	00d8e8b3          	or	a7,a7,a3
    c120:	01f00693          	li	a3,31
    c124:	52f6ce63          	blt	a3,a5,c660 <__adddf3+0x5cc>
    c128:	02000693          	li	a3,32
    c12c:	40f686b3          	sub	a3,a3,a5
    c130:	00d89633          	sll	a2,a7,a3
    c134:	00ff5533          	srl	a0,t5,a5
    c138:	00df16b3          	sll	a3,t5,a3
    c13c:	00a66633          	or	a2,a2,a0
    c140:	00d036b3          	snez	a3,a3
    c144:	00f8d8b3          	srl	a7,a7,a5
    c148:	00d66633          	or	a2,a2,a3
    c14c:	41170733          	sub	a4,a4,a7
    c150:	40c58633          	sub	a2,a1,a2
    c154:	00c5b5b3          	sltu	a1,a1,a2
    c158:	00060493          	mv	s1,a2
    c15c:	40b709b3          	sub	s3,a4,a1
    c160:	00899793          	sll	a5,s3,0x8
    c164:	3207da63          	bgez	a5,c498 <__adddf3+0x404>
    c168:	008007b7          	lui	a5,0x800
    c16c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c170:	00f9f9b3          	and	s3,s3,a5
    c174:	2c098863          	beqz	s3,c444 <__adddf3+0x3b0>
    c178:	00098513          	mv	a0,s3
    c17c:	359020ef          	jal	ecd4 <__clzsi2>
    c180:	ff850793          	add	a5,a0,-8
    c184:	02000693          	li	a3,32
    c188:	40f68733          	sub	a4,a3,a5
    c18c:	00e4d733          	srl	a4,s1,a4
    c190:	00f999b3          	sll	s3,s3,a5
    c194:	01376733          	or	a4,a4,s3
    c198:	00f494b3          	sll	s1,s1,a5
    c19c:	4b27c863          	blt	a5,s2,c64c <__adddf3+0x5b8>
    c1a0:	412787b3          	sub	a5,a5,s2
    c1a4:	00178793          	add	a5,a5,1
    c1a8:	40f686b3          	sub	a3,a3,a5
    c1ac:	00d49633          	sll	a2,s1,a3
    c1b0:	00f4d9b3          	srl	s3,s1,a5
    c1b4:	00c03633          	snez	a2,a2
    c1b8:	01366633          	or	a2,a2,s3
    c1bc:	00d716b3          	sll	a3,a4,a3
    c1c0:	00c6e4b3          	or	s1,a3,a2
    c1c4:	00f759b3          	srl	s3,a4,a5
    c1c8:	00000913          	li	s2,0
    c1cc:	0074f793          	and	a5,s1,7
    c1d0:	02078063          	beqz	a5,c1f0 <__adddf3+0x15c>
    c1d4:	00f4f793          	and	a5,s1,15
    c1d8:	00400713          	li	a4,4
    c1dc:	00e78a63          	beq	a5,a4,c1f0 <__adddf3+0x15c>
    c1e0:	00448793          	add	a5,s1,4
    c1e4:	0097b633          	sltu	a2,a5,s1
    c1e8:	00c989b3          	add	s3,s3,a2
    c1ec:	00078493          	mv	s1,a5
    c1f0:	00899793          	sll	a5,s3,0x8
    c1f4:	6e07da63          	bgez	a5,c8e8 <__adddf3+0x854>
    c1f8:	00190793          	add	a5,s2,1
    c1fc:	7ff00713          	li	a4,2047
    c200:	00040e13          	mv	t3,s0
    c204:	2ae78663          	beq	a5,a4,c4b0 <__adddf3+0x41c>
    c208:	ff800737          	lui	a4,0xff800
    c20c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c210:	00e9f733          	and	a4,s3,a4
    c214:	7ff7f793          	and	a5,a5,2047
    c218:	01d71813          	sll	a6,a4,0x1d
    c21c:	0034d613          	srl	a2,s1,0x3
    c220:	00971713          	sll	a4,a4,0x9
    c224:	00c86833          	or	a6,a6,a2
    c228:	00c75713          	srl	a4,a4,0xc
    c22c:	01c12083          	lw	ra,28(sp)
    c230:	01812403          	lw	s0,24(sp)
    c234:	01479793          	sll	a5,a5,0x14
    c238:	00e7e7b3          	or	a5,a5,a4
    c23c:	01fe1713          	sll	a4,t3,0x1f
    c240:	00e7e7b3          	or	a5,a5,a4
    c244:	01412483          	lw	s1,20(sp)
    c248:	01012903          	lw	s2,16(sp)
    c24c:	00c12983          	lw	s3,12(sp)
    c250:	00080513          	mv	a0,a6
    c254:	00078593          	mv	a1,a5
    c258:	02010113          	add	sp,sp,32
    c25c:	00008067          	ret
    c260:	14078c63          	beqz	a5,c3b8 <__adddf3+0x324>
    c264:	412307b3          	sub	a5,t1,s2
    c268:	3c091263          	bnez	s2,c62c <__adddf3+0x598>
    c26c:	00b76533          	or	a0,a4,a1
    c270:	4c050463          	beqz	a0,c738 <__adddf3+0x6a4>
    c274:	fff78513          	add	a0,a5,-1
    c278:	60050263          	beqz	a0,c87c <__adddf3+0x7e8>
    c27c:	7ff00813          	li	a6,2047
    c280:	57078663          	beq	a5,a6,c7ec <__adddf3+0x758>
    c284:	03800793          	li	a5,56
    c288:	00100613          	li	a2,1
    c28c:	02a7cc63          	blt	a5,a0,c2c4 <__adddf3+0x230>
    c290:	00050793          	mv	a5,a0
    c294:	01f00613          	li	a2,31
    c298:	56f64c63          	blt	a2,a5,c810 <__adddf3+0x77c>
    c29c:	02000513          	li	a0,32
    c2a0:	40f50533          	sub	a0,a0,a5
    c2a4:	00a71633          	sll	a2,a4,a0
    c2a8:	00f5d833          	srl	a6,a1,a5
    c2ac:	00a59533          	sll	a0,a1,a0
    c2b0:	01066633          	or	a2,a2,a6
    c2b4:	00a03533          	snez	a0,a0
    c2b8:	00f75733          	srl	a4,a4,a5
    c2bc:	00a66633          	or	a2,a2,a0
    c2c0:	40e888b3          	sub	a7,a7,a4
    c2c4:	40cf0633          	sub	a2,t5,a2
    c2c8:	00cf3733          	sltu	a4,t5,a2
    c2cc:	00060493          	mv	s1,a2
    c2d0:	40e889b3          	sub	s3,a7,a4
    c2d4:	00030913          	mv	s2,t1
    c2d8:	00068413          	mv	s0,a3
    c2dc:	e85ff06f          	j	c160 <__adddf3+0xcc>
    c2e0:	1ef05063          	blez	a5,c4c0 <__adddf3+0x42c>
    c2e4:	14031063          	bnez	t1,c424 <__adddf3+0x390>
    c2e8:	01e8e6b3          	or	a3,a7,t5
    c2ec:	26068c63          	beqz	a3,c564 <__adddf3+0x4d0>
    c2f0:	fff78693          	add	a3,a5,-1
    c2f4:	48068063          	beqz	a3,c774 <__adddf3+0x6e0>
    c2f8:	7ff00613          	li	a2,2047
    c2fc:	22c78c63          	beq	a5,a2,c534 <__adddf3+0x4a0>
    c300:	03800793          	li	a5,56
    c304:	00100993          	li	s3,1
    c308:	02d7cc63          	blt	a5,a3,c340 <__adddf3+0x2ac>
    c30c:	00068793          	mv	a5,a3
    c310:	01f00693          	li	a3,31
    c314:	4af6c063          	blt	a3,a5,c7b4 <__adddf3+0x720>
    c318:	02000693          	li	a3,32
    c31c:	40f686b3          	sub	a3,a3,a5
    c320:	00d899b3          	sll	s3,a7,a3
    c324:	00ff5633          	srl	a2,t5,a5
    c328:	00df16b3          	sll	a3,t5,a3
    c32c:	00c9e9b3          	or	s3,s3,a2
    c330:	00d036b3          	snez	a3,a3
    c334:	00f8d8b3          	srl	a7,a7,a5
    c338:	00d9e9b3          	or	s3,s3,a3
    c33c:	01170733          	add	a4,a4,a7
    c340:	00b985b3          	add	a1,s3,a1
    c344:	0135b9b3          	sltu	s3,a1,s3
    c348:	00058493          	mv	s1,a1
    c34c:	00e989b3          	add	s3,s3,a4
    c350:	00899793          	sll	a5,s3,0x8
    c354:	1407d263          	bgez	a5,c498 <__adddf3+0x404>
    c358:	00190913          	add	s2,s2,1
    c35c:	7ff00793          	li	a5,2047
    c360:	36f90c63          	beq	s2,a5,c6d8 <__adddf3+0x644>
    c364:	ff8007b7          	lui	a5,0xff800
    c368:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c36c:	0014f613          	and	a2,s1,1
    c370:	00f9f7b3          	and	a5,s3,a5
    c374:	0014d713          	srl	a4,s1,0x1
    c378:	00c76733          	or	a4,a4,a2
    c37c:	01f79613          	sll	a2,a5,0x1f
    c380:	00e664b3          	or	s1,a2,a4
    c384:	0017d993          	srl	s3,a5,0x1
    c388:	e45ff06f          	j	c1cc <__adddf3+0x138>
    c38c:	01e8e6b3          	or	a3,a7,t5
    c390:	1c068a63          	beqz	a3,c564 <__adddf3+0x4d0>
    c394:	fff78693          	add	a3,a5,-1
    c398:	40068063          	beqz	a3,c798 <__adddf3+0x704>
    c39c:	7ff00613          	li	a2,2047
    c3a0:	18c78a63          	beq	a5,a2,c534 <__adddf3+0x4a0>
    c3a4:	03800793          	li	a5,56
    c3a8:	00100613          	li	a2,1
    c3ac:	dad7c2e3          	blt	a5,a3,c150 <__adddf3+0xbc>
    c3b0:	00068793          	mv	a5,a3
    c3b4:	d6dff06f          	j	c120 <__adddf3+0x8c>
    c3b8:	00190813          	add	a6,s2,1
    c3bc:	7fe87813          	and	a6,a6,2046
    c3c0:	22081c63          	bnez	a6,c5f8 <__adddf3+0x564>
    c3c4:	00b76333          	or	t1,a4,a1
    c3c8:	01e8e833          	or	a6,a7,t5
    c3cc:	38091063          	bnez	s2,c74c <__adddf3+0x6b8>
    c3d0:	46030e63          	beqz	t1,c84c <__adddf3+0x7b8>
    c3d4:	40080663          	beqz	a6,c7e0 <__adddf3+0x74c>
    c3d8:	41e589b3          	sub	s3,a1,t5
    c3dc:	0135b533          	sltu	a0,a1,s3
    c3e0:	41170633          	sub	a2,a4,a7
    c3e4:	40a60633          	sub	a2,a2,a0
    c3e8:	00861513          	sll	a0,a2,0x8
    c3ec:	50055e63          	bgez	a0,c908 <__adddf3+0x874>
    c3f0:	40bf05b3          	sub	a1,t5,a1
    c3f4:	40e88733          	sub	a4,a7,a4
    c3f8:	00bf3f33          	sltu	t5,t5,a1
    c3fc:	41e70733          	sub	a4,a4,t5
    c400:	00871613          	sll	a2,a4,0x8
    c404:	00058493          	mv	s1,a1
    c408:	52065e63          	bgez	a2,c944 <__adddf3+0x8b0>
    c40c:	ff8007b7          	lui	a5,0xff800
    c410:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c414:	00f77733          	and	a4,a4,a5
    c418:	00068e13          	mv	t3,a3
    c41c:	00100793          	li	a5,1
    c420:	df9ff06f          	j	c218 <__adddf3+0x184>
    c424:	7ff00693          	li	a3,2047
    c428:	10d90663          	beq	s2,a3,c534 <__adddf3+0x4a0>
    c42c:	03800693          	li	a3,56
    c430:	00100993          	li	s3,1
    c434:	f0f6c6e3          	blt	a3,a5,c340 <__adddf3+0x2ac>
    c438:	008006b7          	lui	a3,0x800
    c43c:	00d8e8b3          	or	a7,a7,a3
    c440:	ed1ff06f          	j	c310 <__adddf3+0x27c>
    c444:	00048513          	mv	a0,s1
    c448:	08d020ef          	jal	ecd4 <__clzsi2>
    c44c:	01850793          	add	a5,a0,24
    c450:	01f00693          	li	a3,31
    c454:	d2f6d8e3          	bge	a3,a5,c184 <__adddf3+0xf0>
    c458:	ff850713          	add	a4,a0,-8
    c45c:	00e49733          	sll	a4,s1,a4
    c460:	2327c663          	blt	a5,s2,c68c <__adddf3+0x5f8>
    c464:	41278933          	sub	s2,a5,s2
    c468:	00190793          	add	a5,s2,1
    c46c:	48f6d663          	bge	a3,a5,c8f8 <__adddf3+0x864>
    c470:	fe190913          	add	s2,s2,-31
    c474:	02000693          	li	a3,32
    c478:	012754b3          	srl	s1,a4,s2
    c47c:	00d78c63          	beq	a5,a3,c494 <__adddf3+0x400>
    c480:	04000693          	li	a3,64
    c484:	40f687b3          	sub	a5,a3,a5
    c488:	00f71733          	sll	a4,a4,a5
    c48c:	00e03733          	snez	a4,a4
    c490:	00e4e4b3          	or	s1,s1,a4
    c494:	00000913          	li	s2,0
    c498:	0074f793          	and	a5,s1,7
    c49c:	d2079ce3          	bnez	a5,c1d4 <__adddf3+0x140>
    c4a0:	00090793          	mv	a5,s2
    c4a4:	0034d613          	srl	a2,s1,0x3
    c4a8:	00098713          	mv	a4,s3
    c4ac:	0c00006f          	j	c56c <__adddf3+0x4d8>
    c4b0:	7ff00793          	li	a5,2047
    c4b4:	00000713          	li	a4,0
    c4b8:	00000813          	li	a6,0
    c4bc:	d71ff06f          	j	c22c <__adddf3+0x198>
    c4c0:	0c078a63          	beqz	a5,c594 <__adddf3+0x500>
    c4c4:	412307b3          	sub	a5,t1,s2
    c4c8:	1e090263          	beqz	s2,c6ac <__adddf3+0x618>
    c4cc:	7ff00693          	li	a3,2047
    c4d0:	32d30863          	beq	t1,a3,c800 <__adddf3+0x76c>
    c4d4:	03800693          	li	a3,56
    c4d8:	00100993          	li	s3,1
    c4dc:	02f6ce63          	blt	a3,a5,c518 <__adddf3+0x484>
    c4e0:	008006b7          	lui	a3,0x800
    c4e4:	00d76733          	or	a4,a4,a3
    c4e8:	01f00693          	li	a3,31
    c4ec:	3cf6c863          	blt	a3,a5,c8bc <__adddf3+0x828>
    c4f0:	02000693          	li	a3,32
    c4f4:	40f686b3          	sub	a3,a3,a5
    c4f8:	00d719b3          	sll	s3,a4,a3
    c4fc:	00f5d633          	srl	a2,a1,a5
    c500:	00d596b3          	sll	a3,a1,a3
    c504:	00c9e9b3          	or	s3,s3,a2
    c508:	00d036b3          	snez	a3,a3
    c50c:	00f75733          	srl	a4,a4,a5
    c510:	00d9e9b3          	or	s3,s3,a3
    c514:	00e888b3          	add	a7,a7,a4
    c518:	01e98733          	add	a4,s3,t5
    c51c:	013739b3          	sltu	s3,a4,s3
    c520:	00070493          	mv	s1,a4
    c524:	011989b3          	add	s3,s3,a7
    c528:	00030913          	mv	s2,t1
    c52c:	e25ff06f          	j	c350 <__adddf3+0x2bc>
    c530:	02081063          	bnez	a6,c550 <__adddf3+0x4bc>
    c534:	00351613          	sll	a2,a0,0x3
    c538:	00365613          	srl	a2,a2,0x3
    c53c:	01d71813          	sll	a6,a4,0x1d
    c540:	00c86833          	or	a6,a6,a2
    c544:	00375713          	srl	a4,a4,0x3
    c548:	01076733          	or	a4,a4,a6
    c54c:	18070663          	beqz	a4,c6d8 <__adddf3+0x644>
    c550:	00000e13          	li	t3,0
    c554:	7ff00793          	li	a5,2047
    c558:	00080737          	lui	a4,0x80
    c55c:	00000813          	li	a6,0
    c560:	ccdff06f          	j	c22c <__adddf3+0x198>
    c564:	00351613          	sll	a2,a0,0x3
    c568:	00365613          	srl	a2,a2,0x3
    c56c:	01d71813          	sll	a6,a4,0x1d
    c570:	7ff00693          	li	a3,2047
    c574:	00c86833          	or	a6,a6,a2
    c578:	00375713          	srl	a4,a4,0x3
    c57c:	fcd786e3          	beq	a5,a3,c548 <__adddf3+0x4b4>
    c580:	00c71713          	sll	a4,a4,0xc
    c584:	00c75713          	srl	a4,a4,0xc
    c588:	7ff7f793          	and	a5,a5,2047
    c58c:	00040e13          	mv	t3,s0
    c590:	c9dff06f          	j	c22c <__adddf3+0x198>
    c594:	00190693          	add	a3,s2,1
    c598:	7fe6f813          	and	a6,a3,2046
    c59c:	14081863          	bnez	a6,c6ec <__adddf3+0x658>
    c5a0:	00b766b3          	or	a3,a4,a1
    c5a4:	28091c63          	bnez	s2,c83c <__adddf3+0x7a8>
    c5a8:	30068263          	beqz	a3,c8ac <__adddf3+0x818>
    c5ac:	01e8e6b3          	or	a3,a7,t5
    c5b0:	22068863          	beqz	a3,c7e0 <__adddf3+0x74c>
    c5b4:	01e587b3          	add	a5,a1,t5
    c5b8:	00b7b5b3          	sltu	a1,a5,a1
    c5bc:	01170733          	add	a4,a4,a7
    c5c0:	00b70733          	add	a4,a4,a1
    c5c4:	0037d813          	srl	a6,a5,0x3
    c5c8:	00871793          	sll	a5,a4,0x8
    c5cc:	00040e13          	mv	t3,s0
    c5d0:	3407de63          	bgez	a5,c92c <__adddf3+0x898>
    c5d4:	ff8007b7          	lui	a5,0xff800
    c5d8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c5dc:	00f77733          	and	a4,a4,a5
    c5e0:	01d71793          	sll	a5,a4,0x1d
    c5e4:	00375713          	srl	a4,a4,0x3
    c5e8:	0107e833          	or	a6,a5,a6
    c5ec:	01d77733          	and	a4,a4,t4
    c5f0:	00100793          	li	a5,1
    c5f4:	c39ff06f          	j	c22c <__adddf3+0x198>
    c5f8:	41e58833          	sub	a6,a1,t5
    c5fc:	0105b7b3          	sltu	a5,a1,a6
    c600:	411709b3          	sub	s3,a4,a7
    c604:	40f989b3          	sub	s3,s3,a5
    c608:	00899793          	sll	a5,s3,0x8
    c60c:	00080493          	mv	s1,a6
    c610:	1007c663          	bltz	a5,c71c <__adddf3+0x688>
    c614:	01386833          	or	a6,a6,s3
    c618:	b4081ee3          	bnez	a6,c174 <__adddf3+0xe0>
    c61c:	00000e13          	li	t3,0
    c620:	00000793          	li	a5,0
    c624:	00000713          	li	a4,0
    c628:	c05ff06f          	j	c22c <__adddf3+0x198>
    c62c:	7ff00513          	li	a0,2047
    c630:	1aa30e63          	beq	t1,a0,c7ec <__adddf3+0x758>
    c634:	03800513          	li	a0,56
    c638:	00100613          	li	a2,1
    c63c:	c8f544e3          	blt	a0,a5,c2c4 <__adddf3+0x230>
    c640:	00800637          	lui	a2,0x800
    c644:	00c76733          	or	a4,a4,a2
    c648:	c4dff06f          	j	c294 <__adddf3+0x200>
    c64c:	ff8009b7          	lui	s3,0xff800
    c650:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c654:	40f90933          	sub	s2,s2,a5
    c658:	013779b3          	and	s3,a4,s3
    c65c:	b71ff06f          	j	c1cc <__adddf3+0x138>
    c660:	fe078693          	add	a3,a5,-32
    c664:	02000613          	li	a2,32
    c668:	00d8d6b3          	srl	a3,a7,a3
    c66c:	00c78a63          	beq	a5,a2,c680 <__adddf3+0x5ec>
    c670:	04000613          	li	a2,64
    c674:	40f607b3          	sub	a5,a2,a5
    c678:	00f897b3          	sll	a5,a7,a5
    c67c:	00ff6f33          	or	t5,t5,a5
    c680:	01e03633          	snez	a2,t5
    c684:	00d66633          	or	a2,a2,a3
    c688:	ac9ff06f          	j	c150 <__adddf3+0xbc>
    c68c:	ff8006b7          	lui	a3,0xff800
    c690:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c694:	40f907b3          	sub	a5,s2,a5
    c698:	00d77733          	and	a4,a4,a3
    c69c:	01d71813          	sll	a6,a4,0x1d
    c6a0:	01386833          	or	a6,a6,s3
    c6a4:	00375713          	srl	a4,a4,0x3
    c6a8:	ed9ff06f          	j	c580 <__adddf3+0x4ec>
    c6ac:	00b766b3          	or	a3,a4,a1
    c6b0:	1e068663          	beqz	a3,c89c <__adddf3+0x808>
    c6b4:	fff78693          	add	a3,a5,-1
    c6b8:	0a068e63          	beqz	a3,c774 <__adddf3+0x6e0>
    c6bc:	7ff00513          	li	a0,2047
    c6c0:	14a78063          	beq	a5,a0,c800 <__adddf3+0x76c>
    c6c4:	03800793          	li	a5,56
    c6c8:	00100993          	li	s3,1
    c6cc:	e4d7c6e3          	blt	a5,a3,c518 <__adddf3+0x484>
    c6d0:	00068793          	mv	a5,a3
    c6d4:	e15ff06f          	j	c4e8 <__adddf3+0x454>
    c6d8:	00040e13          	mv	t3,s0
    c6dc:	7ff00793          	li	a5,2047
    c6e0:	00000713          	li	a4,0
    c6e4:	00000813          	li	a6,0
    c6e8:	b45ff06f          	j	c22c <__adddf3+0x198>
    c6ec:	7ff00793          	li	a5,2047
    c6f0:	fef684e3          	beq	a3,a5,c6d8 <__adddf3+0x644>
    c6f4:	01e58f33          	add	t5,a1,t5
    c6f8:	00bf35b3          	sltu	a1,t5,a1
    c6fc:	011707b3          	add	a5,a4,a7
    c700:	00b787b3          	add	a5,a5,a1
    c704:	01f79613          	sll	a2,a5,0x1f
    c708:	001f5f13          	srl	t5,t5,0x1
    c70c:	01e664b3          	or	s1,a2,t5
    c710:	0017d993          	srl	s3,a5,0x1
    c714:	00068913          	mv	s2,a3
    c718:	ab5ff06f          	j	c1cc <__adddf3+0x138>
    c71c:	40bf0633          	sub	a2,t5,a1
    c720:	40e887b3          	sub	a5,a7,a4
    c724:	00cf3733          	sltu	a4,t5,a2
    c728:	00060493          	mv	s1,a2
    c72c:	40e789b3          	sub	s3,a5,a4
    c730:	00068413          	mv	s0,a3
    c734:	a41ff06f          	j	c174 <__adddf3+0xe0>
    c738:	00361613          	sll	a2,a2,0x3
    c73c:	00365613          	srl	a2,a2,0x3
    c740:	00068413          	mv	s0,a3
    c744:	00088713          	mv	a4,a7
    c748:	e25ff06f          	j	c56c <__adddf3+0x4d8>
    c74c:	de0312e3          	bnez	t1,c530 <__adddf3+0x49c>
    c750:	1c080663          	beqz	a6,c91c <__adddf3+0x888>
    c754:	0038d713          	srl	a4,a7,0x3
    c758:	00361613          	sll	a2,a2,0x3
    c75c:	01d89893          	sll	a7,a7,0x1d
    c760:	01176733          	or	a4,a4,a7
    c764:	00365613          	srl	a2,a2,0x3
    c768:	00c76733          	or	a4,a4,a2
    c76c:	00068413          	mv	s0,a3
    c770:	dddff06f          	j	c54c <__adddf3+0x4b8>
    c774:	01e58f33          	add	t5,a1,t5
    c778:	011708b3          	add	a7,a4,a7
    c77c:	00bf35b3          	sltu	a1,t5,a1
    c780:	00b889b3          	add	s3,a7,a1
    c784:	00899793          	sll	a5,s3,0x8
    c788:	000f0493          	mv	s1,t5
    c78c:	0e07d463          	bgez	a5,c874 <__adddf3+0x7e0>
    c790:	00200913          	li	s2,2
    c794:	bd1ff06f          	j	c364 <__adddf3+0x2d0>
    c798:	41e58f33          	sub	t5,a1,t5
    c79c:	411708b3          	sub	a7,a4,a7
    c7a0:	01e5b5b3          	sltu	a1,a1,t5
    c7a4:	000f0493          	mv	s1,t5
    c7a8:	40b889b3          	sub	s3,a7,a1
    c7ac:	00100913          	li	s2,1
    c7b0:	9b1ff06f          	j	c160 <__adddf3+0xcc>
    c7b4:	fe078693          	add	a3,a5,-32
    c7b8:	02000613          	li	a2,32
    c7bc:	00d8d6b3          	srl	a3,a7,a3
    c7c0:	00c78a63          	beq	a5,a2,c7d4 <__adddf3+0x740>
    c7c4:	04000613          	li	a2,64
    c7c8:	40f607b3          	sub	a5,a2,a5
    c7cc:	00f897b3          	sll	a5,a7,a5
    c7d0:	00ff6f33          	or	t5,t5,a5
    c7d4:	01e039b3          	snez	s3,t5
    c7d8:	00d9e9b3          	or	s3,s3,a3
    c7dc:	b65ff06f          	j	c340 <__adddf3+0x2ac>
    c7e0:	00351613          	sll	a2,a0,0x3
    c7e4:	00365993          	srl	s3,a2,0x3
    c7e8:	eb5ff06f          	j	c69c <__adddf3+0x608>
    c7ec:	00361613          	sll	a2,a2,0x3
    c7f0:	00365613          	srl	a2,a2,0x3
    c7f4:	00068413          	mv	s0,a3
    c7f8:	00088713          	mv	a4,a7
    c7fc:	d41ff06f          	j	c53c <__adddf3+0x4a8>
    c800:	00361613          	sll	a2,a2,0x3
    c804:	00365613          	srl	a2,a2,0x3
    c808:	00088713          	mv	a4,a7
    c80c:	d31ff06f          	j	c53c <__adddf3+0x4a8>
    c810:	fe078513          	add	a0,a5,-32
    c814:	02000613          	li	a2,32
    c818:	00a75533          	srl	a0,a4,a0
    c81c:	00c78a63          	beq	a5,a2,c830 <__adddf3+0x79c>
    c820:	04000613          	li	a2,64
    c824:	40f607b3          	sub	a5,a2,a5
    c828:	00f717b3          	sll	a5,a4,a5
    c82c:	00f5e5b3          	or	a1,a1,a5
    c830:	00b03633          	snez	a2,a1
    c834:	00a66633          	or	a2,a2,a0
    c838:	a8dff06f          	j	c2c4 <__adddf3+0x230>
    c83c:	fc0682e3          	beqz	a3,c800 <__adddf3+0x76c>
    c840:	01e8ef33          	or	t5,a7,t5
    c844:	d00f16e3          	bnez	t5,c550 <__adddf3+0x4bc>
    c848:	cedff06f          	j	c534 <__adddf3+0x4a0>
    c84c:	dc0808e3          	beqz	a6,c61c <__adddf3+0x588>
    c850:	00361813          	sll	a6,a2,0x3
    c854:	01d89793          	sll	a5,a7,0x1d
    c858:	00385813          	srl	a6,a6,0x3
    c85c:	0038d713          	srl	a4,a7,0x3
    c860:	00f86833          	or	a6,a6,a5
    c864:	01d77733          	and	a4,a4,t4
    c868:	00068e13          	mv	t3,a3
    c86c:	00000793          	li	a5,0
    c870:	9bdff06f          	j	c22c <__adddf3+0x198>
    c874:	00100793          	li	a5,1
    c878:	c2dff06f          	j	c4a4 <__adddf3+0x410>
    c87c:	40bf05b3          	sub	a1,t5,a1
    c880:	40e888b3          	sub	a7,a7,a4
    c884:	00bf3733          	sltu	a4,t5,a1
    c888:	00058493          	mv	s1,a1
    c88c:	40e889b3          	sub	s3,a7,a4
    c890:	00068413          	mv	s0,a3
    c894:	00100913          	li	s2,1
    c898:	8c9ff06f          	j	c160 <__adddf3+0xcc>
    c89c:	00361613          	sll	a2,a2,0x3
    c8a0:	00365613          	srl	a2,a2,0x3
    c8a4:	00088713          	mv	a4,a7
    c8a8:	cc5ff06f          	j	c56c <__adddf3+0x4d8>
    c8ac:	00361613          	sll	a2,a2,0x3
    c8b0:	00365993          	srl	s3,a2,0x3
    c8b4:	00088713          	mv	a4,a7
    c8b8:	de5ff06f          	j	c69c <__adddf3+0x608>
    c8bc:	fe078693          	add	a3,a5,-32
    c8c0:	02000613          	li	a2,32
    c8c4:	00d756b3          	srl	a3,a4,a3
    c8c8:	00c78a63          	beq	a5,a2,c8dc <__adddf3+0x848>
    c8cc:	04000613          	li	a2,64
    c8d0:	40f607b3          	sub	a5,a2,a5
    c8d4:	00f717b3          	sll	a5,a4,a5
    c8d8:	00f5e5b3          	or	a1,a1,a5
    c8dc:	00b039b3          	snez	s3,a1
    c8e0:	00d9e9b3          	or	s3,s3,a3
    c8e4:	c35ff06f          	j	c518 <__adddf3+0x484>
    c8e8:	0034d613          	srl	a2,s1,0x3
    c8ec:	00090793          	mv	a5,s2
    c8f0:	00098713          	mv	a4,s3
    c8f4:	c79ff06f          	j	c56c <__adddf3+0x4d8>
    c8f8:	02000693          	li	a3,32
    c8fc:	40f686b3          	sub	a3,a3,a5
    c900:	00000613          	li	a2,0
    c904:	8b5ff06f          	j	c1b8 <__adddf3+0x124>
    c908:	00c9e833          	or	a6,s3,a2
    c90c:	d00808e3          	beqz	a6,c61c <__adddf3+0x588>
    c910:	0039d993          	srl	s3,s3,0x3
    c914:	00060713          	mv	a4,a2
    c918:	d85ff06f          	j	c69c <__adddf3+0x608>
    c91c:	00000e13          	li	t3,0
    c920:	7ff00793          	li	a5,2047
    c924:	00080737          	lui	a4,0x80
    c928:	905ff06f          	j	c22c <__adddf3+0x198>
    c92c:	01d71793          	sll	a5,a4,0x1d
    c930:	00375713          	srl	a4,a4,0x3
    c934:	0107e833          	or	a6,a5,a6
    c938:	01d77733          	and	a4,a4,t4
    c93c:	00000793          	li	a5,0
    c940:	8edff06f          	j	c22c <__adddf3+0x198>
    c944:	01d71813          	sll	a6,a4,0x1d
    c948:	0035d593          	srl	a1,a1,0x3
    c94c:	00b86833          	or	a6,a6,a1
    c950:	00375713          	srl	a4,a4,0x3
    c954:	00068413          	mv	s0,a3
    c958:	c29ff06f          	j	c580 <__adddf3+0x4ec>

0000c95c <__divdf3>:
    c95c:	fb010113          	add	sp,sp,-80
    c960:	0145d793          	srl	a5,a1,0x14
    c964:	04812423          	sw	s0,72(sp)
    c968:	04912223          	sw	s1,68(sp)
    c96c:	05212023          	sw	s2,64(sp)
    c970:	03412c23          	sw	s4,56(sp)
    c974:	03512a23          	sw	s5,52(sp)
    c978:	00c59493          	sll	s1,a1,0xc
    c97c:	04112623          	sw	ra,76(sp)
    c980:	03312e23          	sw	s3,60(sp)
    c984:	03612823          	sw	s6,48(sp)
    c988:	03712623          	sw	s7,44(sp)
    c98c:	03812423          	sw	s8,40(sp)
    c990:	7ff7f793          	and	a5,a5,2047
    c994:	00050413          	mv	s0,a0
    c998:	00060a13          	mv	s4,a2
    c99c:	00068913          	mv	s2,a3
    c9a0:	00c4d493          	srl	s1,s1,0xc
    c9a4:	01f5da93          	srl	s5,a1,0x1f
    c9a8:	18078c63          	beqz	a5,cb40 <__divdf3+0x1e4>
    c9ac:	7ff00713          	li	a4,2047
    c9b0:	08e78a63          	beq	a5,a4,ca44 <__divdf3+0xe8>
    c9b4:	01d55b13          	srl	s6,a0,0x1d
    c9b8:	00349493          	sll	s1,s1,0x3
    c9bc:	009b64b3          	or	s1,s6,s1
    c9c0:	00800737          	lui	a4,0x800
    c9c4:	00e4eb33          	or	s6,s1,a4
    c9c8:	00351b93          	sll	s7,a0,0x3
    c9cc:	c0178993          	add	s3,a5,-1023
    c9d0:	00000493          	li	s1,0
    c9d4:	00000c13          	li	s8,0
    c9d8:	01495793          	srl	a5,s2,0x14
    c9dc:	00c91413          	sll	s0,s2,0xc
    c9e0:	7ff7f793          	and	a5,a5,2047
    c9e4:	00c45413          	srl	s0,s0,0xc
    c9e8:	01f95913          	srl	s2,s2,0x1f
    c9ec:	08078463          	beqz	a5,ca74 <__divdf3+0x118>
    c9f0:	7ff00713          	li	a4,2047
    c9f4:	18e78c63          	beq	a5,a4,cb8c <__divdf3+0x230>
    c9f8:	00341413          	sll	s0,s0,0x3
    c9fc:	01da5713          	srl	a4,s4,0x1d
    ca00:	00876733          	or	a4,a4,s0
    ca04:	c0178793          	add	a5,a5,-1023
    ca08:	00800437          	lui	s0,0x800
    ca0c:	40f989b3          	sub	s3,s3,a5
    ca10:	00876433          	or	s0,a4,s0
    ca14:	003a1813          	sll	a6,s4,0x3
    ca18:	00000793          	li	a5,0
    ca1c:	00f00713          	li	a4,15
    ca20:	012aca33          	xor	s4,s5,s2
    ca24:	24976663          	bltu	a4,s1,cc70 <__divdf3+0x314>
    ca28:	00003697          	auipc	a3,0x3
    ca2c:	c6868693          	add	a3,a3,-920 # f690 <__mprec_tens+0xc8>
    ca30:	00249493          	sll	s1,s1,0x2
    ca34:	00d484b3          	add	s1,s1,a3
    ca38:	0004a703          	lw	a4,0(s1)
    ca3c:	00d70733          	add	a4,a4,a3
    ca40:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    ca44:	00a4eb33          	or	s6,s1,a0
    ca48:	1c0b1e63          	bnez	s6,cc24 <__divdf3+0x2c8>
    ca4c:	01495793          	srl	a5,s2,0x14
    ca50:	00c91413          	sll	s0,s2,0xc
    ca54:	7ff7f793          	and	a5,a5,2047
    ca58:	00000b93          	li	s7,0
    ca5c:	00800493          	li	s1,8
    ca60:	7ff00993          	li	s3,2047
    ca64:	00200c13          	li	s8,2
    ca68:	00c45413          	srl	s0,s0,0xc
    ca6c:	01f95913          	srl	s2,s2,0x1f
    ca70:	f80790e3          	bnez	a5,c9f0 <__divdf3+0x94>
    ca74:	01446833          	or	a6,s0,s4
    ca78:	1c080263          	beqz	a6,cc3c <__divdf3+0x2e0>
    ca7c:	5c040663          	beqz	s0,d048 <__divdf3+0x6ec>
    ca80:	00040513          	mv	a0,s0
    ca84:	250020ef          	jal	ecd4 <__clzsi2>
    ca88:	00050793          	mv	a5,a0
    ca8c:	ff550693          	add	a3,a0,-11
    ca90:	01d00713          	li	a4,29
    ca94:	ff878813          	add	a6,a5,-8
    ca98:	40d70733          	sub	a4,a4,a3
    ca9c:	01041433          	sll	s0,s0,a6
    caa0:	00ea5733          	srl	a4,s4,a4
    caa4:	00876433          	or	s0,a4,s0
    caa8:	010a1833          	sll	a6,s4,a6
    caac:	013787b3          	add	a5,a5,s3
    cab0:	3f378993          	add	s3,a5,1011
    cab4:	00000793          	li	a5,0
    cab8:	f65ff06f          	j	ca1c <__divdf3+0xc0>
    cabc:	40f70733          	sub	a4,a4,a5
    cac0:	03800693          	li	a3,56
    cac4:	60e6d063          	bge	a3,a4,d0c4 <__divdf3+0x768>
    cac8:	00000793          	li	a5,0
    cacc:	00000693          	li	a3,0
    cad0:	00000713          	li	a4,0
    cad4:	04c12083          	lw	ra,76(sp)
    cad8:	04812403          	lw	s0,72(sp)
    cadc:	01479793          	sll	a5,a5,0x14
    cae0:	00d7e7b3          	or	a5,a5,a3
    cae4:	01fa1693          	sll	a3,s4,0x1f
    cae8:	00d7e7b3          	or	a5,a5,a3
    caec:	04412483          	lw	s1,68(sp)
    caf0:	04012903          	lw	s2,64(sp)
    caf4:	03c12983          	lw	s3,60(sp)
    caf8:	03812a03          	lw	s4,56(sp)
    cafc:	03412a83          	lw	s5,52(sp)
    cb00:	03012b03          	lw	s6,48(sp)
    cb04:	02c12b83          	lw	s7,44(sp)
    cb08:	02812c03          	lw	s8,40(sp)
    cb0c:	00070513          	mv	a0,a4
    cb10:	00078593          	mv	a1,a5
    cb14:	05010113          	add	sp,sp,80
    cb18:	00008067          	ret
    cb1c:	7ff00793          	li	a5,2047
    cb20:	00000693          	li	a3,0
    cb24:	00000713          	li	a4,0
    cb28:	fadff06f          	j	cad4 <__divdf3+0x178>
    cb2c:	00000a13          	li	s4,0
    cb30:	7ff00793          	li	a5,2047
    cb34:	000806b7          	lui	a3,0x80
    cb38:	00000713          	li	a4,0
    cb3c:	f99ff06f          	j	cad4 <__divdf3+0x178>
    cb40:	00a4eb33          	or	s6,s1,a0
    cb44:	100b0c63          	beqz	s6,cc5c <__divdf3+0x300>
    cb48:	52048463          	beqz	s1,d070 <__divdf3+0x714>
    cb4c:	00048513          	mv	a0,s1
    cb50:	184020ef          	jal	ecd4 <__clzsi2>
    cb54:	00050713          	mv	a4,a0
    cb58:	ff550793          	add	a5,a0,-11
    cb5c:	01d00b13          	li	s6,29
    cb60:	ff870b93          	add	s7,a4,-8
    cb64:	40fb0b33          	sub	s6,s6,a5
    cb68:	017494b3          	sll	s1,s1,s7
    cb6c:	01645b33          	srl	s6,s0,s6
    cb70:	009b6b33          	or	s6,s6,s1
    cb74:	01741bb3          	sll	s7,s0,s7
    cb78:	c0d00793          	li	a5,-1011
    cb7c:	40e789b3          	sub	s3,a5,a4
    cb80:	00000493          	li	s1,0
    cb84:	00000c13          	li	s8,0
    cb88:	e51ff06f          	j	c9d8 <__divdf3+0x7c>
    cb8c:	01446833          	or	a6,s0,s4
    cb90:	80198993          	add	s3,s3,-2047
    cb94:	0a081c63          	bnez	a6,cc4c <__divdf3+0x2f0>
    cb98:	0024e493          	or	s1,s1,2
    cb9c:	00000413          	li	s0,0
    cba0:	00200793          	li	a5,2
    cba4:	e79ff06f          	j	ca1c <__divdf3+0xc0>
    cba8:	000a8913          	mv	s2,s5
    cbac:	000b0413          	mv	s0,s6
    cbb0:	000b8813          	mv	a6,s7
    cbb4:	00200793          	li	a5,2
    cbb8:	60fc0863          	beq	s8,a5,d1c8 <__divdf3+0x86c>
    cbbc:	00300793          	li	a5,3
    cbc0:	f6fc06e3          	beq	s8,a5,cb2c <__divdf3+0x1d0>
    cbc4:	00100793          	li	a5,1
    cbc8:	00090a13          	mv	s4,s2
    cbcc:	eefc0ee3          	beq	s8,a5,cac8 <__divdf3+0x16c>
    cbd0:	3ff98793          	add	a5,s3,1023
    cbd4:	3cf05263          	blez	a5,cf98 <__divdf3+0x63c>
    cbd8:	00787713          	and	a4,a6,7
    cbdc:	5c071663          	bnez	a4,d1a8 <__divdf3+0x84c>
    cbe0:	00741713          	sll	a4,s0,0x7
    cbe4:	00075a63          	bgez	a4,cbf8 <__divdf3+0x29c>
    cbe8:	ff0007b7          	lui	a5,0xff000
    cbec:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cbf0:	00f47433          	and	s0,s0,a5
    cbf4:	40098793          	add	a5,s3,1024
    cbf8:	7fe00713          	li	a4,2046
    cbfc:	f2f740e3          	blt	a4,a5,cb1c <__divdf3+0x1c0>
    cc00:	00385813          	srl	a6,a6,0x3
    cc04:	01d41713          	sll	a4,s0,0x1d
    cc08:	00941693          	sll	a3,s0,0x9
    cc0c:	01076733          	or	a4,a4,a6
    cc10:	00c6d693          	srl	a3,a3,0xc
    cc14:	7ff7f793          	and	a5,a5,2047
    cc18:	ebdff06f          	j	cad4 <__divdf3+0x178>
    cc1c:	00078c13          	mv	s8,a5
    cc20:	f95ff06f          	j	cbb4 <__divdf3+0x258>
    cc24:	00048b13          	mv	s6,s1
    cc28:	00050b93          	mv	s7,a0
    cc2c:	00c00493          	li	s1,12
    cc30:	7ff00993          	li	s3,2047
    cc34:	00300c13          	li	s8,3
    cc38:	da1ff06f          	j	c9d8 <__divdf3+0x7c>
    cc3c:	0014e493          	or	s1,s1,1
    cc40:	00000413          	li	s0,0
    cc44:	00100793          	li	a5,1
    cc48:	dd5ff06f          	j	ca1c <__divdf3+0xc0>
    cc4c:	0034e493          	or	s1,s1,3
    cc50:	000a0813          	mv	a6,s4
    cc54:	00300793          	li	a5,3
    cc58:	dc5ff06f          	j	ca1c <__divdf3+0xc0>
    cc5c:	00000b93          	li	s7,0
    cc60:	00400493          	li	s1,4
    cc64:	00000993          	li	s3,0
    cc68:	00100c13          	li	s8,1
    cc6c:	d6dff06f          	j	c9d8 <__divdf3+0x7c>
    cc70:	03912223          	sw	s9,36(sp)
    cc74:	03a12023          	sw	s10,32(sp)
    cc78:	01b12e23          	sw	s11,28(sp)
    cc7c:	3b646a63          	bltu	s0,s6,d030 <__divdf3+0x6d4>
    cc80:	3a8b0663          	beq	s6,s0,d02c <__divdf3+0x6d0>
    cc84:	fff98993          	add	s3,s3,-1
    cc88:	000b8c13          	mv	s8,s7
    cc8c:	000b0493          	mv	s1,s6
    cc90:	00000d13          	li	s10,0
    cc94:	01885c93          	srl	s9,a6,0x18
    cc98:	00841413          	sll	s0,s0,0x8
    cc9c:	01045913          	srl	s2,s0,0x10
    cca0:	008cecb3          	or	s9,s9,s0
    cca4:	00090593          	mv	a1,s2
    cca8:	00048513          	mv	a0,s1
    ccac:	010c9b13          	sll	s6,s9,0x10
    ccb0:	00881a93          	sll	s5,a6,0x8
    ccb4:	010b5b13          	srl	s6,s6,0x10
    ccb8:	771010ef          	jal	ec28 <__hidden___udivsi3>
    ccbc:	00050593          	mv	a1,a0
    ccc0:	00050413          	mv	s0,a0
    ccc4:	000b0513          	mv	a0,s6
    ccc8:	69d010ef          	jal	eb64 <__mulsi3>
    cccc:	00050793          	mv	a5,a0
    ccd0:	00090593          	mv	a1,s2
    ccd4:	00048513          	mv	a0,s1
    ccd8:	00078493          	mv	s1,a5
    ccdc:	795010ef          	jal	ec70 <__umodsi3>
    cce0:	01051513          	sll	a0,a0,0x10
    cce4:	010c5793          	srl	a5,s8,0x10
    cce8:	00a7e7b3          	or	a5,a5,a0
    ccec:	0097fa63          	bgeu	a5,s1,cd00 <__divdf3+0x3a4>
    ccf0:	00fc87b3          	add	a5,s9,a5
    ccf4:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ccf8:	3b97fe63          	bgeu	a5,s9,d0b4 <__divdf3+0x758>
    ccfc:	00070413          	mv	s0,a4
    cd00:	409784b3          	sub	s1,a5,s1
    cd04:	00090593          	mv	a1,s2
    cd08:	00048513          	mv	a0,s1
    cd0c:	71d010ef          	jal	ec28 <__hidden___udivsi3>
    cd10:	00050593          	mv	a1,a0
    cd14:	00050b93          	mv	s7,a0
    cd18:	000b0513          	mv	a0,s6
    cd1c:	649010ef          	jal	eb64 <__mulsi3>
    cd20:	00050793          	mv	a5,a0
    cd24:	00090593          	mv	a1,s2
    cd28:	00048513          	mv	a0,s1
    cd2c:	00078493          	mv	s1,a5
    cd30:	741010ef          	jal	ec70 <__umodsi3>
    cd34:	010c1793          	sll	a5,s8,0x10
    cd38:	01051513          	sll	a0,a0,0x10
    cd3c:	0107d793          	srl	a5,a5,0x10
    cd40:	00a7e7b3          	or	a5,a5,a0
    cd44:	0097fa63          	bgeu	a5,s1,cd58 <__divdf3+0x3fc>
    cd48:	00fc87b3          	add	a5,s9,a5
    cd4c:	fffb8713          	add	a4,s7,-1
    cd50:	3597fa63          	bgeu	a5,s9,d0a4 <__divdf3+0x748>
    cd54:	00070b93          	mv	s7,a4
    cd58:	00010337          	lui	t1,0x10
    cd5c:	01041413          	sll	s0,s0,0x10
    cd60:	01746433          	or	s0,s0,s7
    cd64:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cd68:	01b478b3          	and	a7,s0,s11
    cd6c:	01bafdb3          	and	s11,s5,s11
    cd70:	40978bb3          	sub	s7,a5,s1
    cd74:	010adc13          	srl	s8,s5,0x10
    cd78:	01045793          	srl	a5,s0,0x10
    cd7c:	00088513          	mv	a0,a7
    cd80:	000d8593          	mv	a1,s11
    cd84:	5e1010ef          	jal	eb64 <__mulsi3>
    cd88:	00050813          	mv	a6,a0
    cd8c:	000c0593          	mv	a1,s8
    cd90:	00088513          	mv	a0,a7
    cd94:	5d1010ef          	jal	eb64 <__mulsi3>
    cd98:	00050893          	mv	a7,a0
    cd9c:	000d8593          	mv	a1,s11
    cda0:	00078513          	mv	a0,a5
    cda4:	5c1010ef          	jal	eb64 <__mulsi3>
    cda8:	00050e13          	mv	t3,a0
    cdac:	000c0593          	mv	a1,s8
    cdb0:	00078513          	mv	a0,a5
    cdb4:	5b1010ef          	jal	eb64 <__mulsi3>
    cdb8:	01085793          	srl	a5,a6,0x10
    cdbc:	01c888b3          	add	a7,a7,t3
    cdc0:	011787b3          	add	a5,a5,a7
    cdc4:	01c7f463          	bgeu	a5,t3,cdcc <__divdf3+0x470>
    cdc8:	00650533          	add	a0,a0,t1
    cdcc:	00010637          	lui	a2,0x10
    cdd0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cdd4:	00c7f4b3          	and	s1,a5,a2
    cdd8:	0107d693          	srl	a3,a5,0x10
    cddc:	01049493          	sll	s1,s1,0x10
    cde0:	00c87833          	and	a6,a6,a2
    cde4:	00a687b3          	add	a5,a3,a0
    cde8:	010484b3          	add	s1,s1,a6
    cdec:	20fbea63          	bltu	s7,a5,d000 <__divdf3+0x6a4>
    cdf0:	20fb8663          	beq	s7,a5,cffc <__divdf3+0x6a0>
    cdf4:	409d04b3          	sub	s1,s10,s1
    cdf8:	40fb8bb3          	sub	s7,s7,a5
    cdfc:	009d3d33          	sltu	s10,s10,s1
    ce00:	41ab8bb3          	sub	s7,s7,s10
    ce04:	377c8a63          	beq	s9,s7,d178 <__divdf3+0x81c>
    ce08:	00090593          	mv	a1,s2
    ce0c:	000b8513          	mv	a0,s7
    ce10:	619010ef          	jal	ec28 <__hidden___udivsi3>
    ce14:	00050593          	mv	a1,a0
    ce18:	00a12623          	sw	a0,12(sp)
    ce1c:	00050d13          	mv	s10,a0
    ce20:	000b0513          	mv	a0,s6
    ce24:	541010ef          	jal	eb64 <__mulsi3>
    ce28:	00050793          	mv	a5,a0
    ce2c:	00090593          	mv	a1,s2
    ce30:	000b8513          	mv	a0,s7
    ce34:	00078b93          	mv	s7,a5
    ce38:	639010ef          	jal	ec70 <__umodsi3>
    ce3c:	01051513          	sll	a0,a0,0x10
    ce40:	0104d793          	srl	a5,s1,0x10
    ce44:	00a7e7b3          	or	a5,a5,a0
    ce48:	0377f063          	bgeu	a5,s7,ce68 <__divdf3+0x50c>
    ce4c:	00fc87b3          	add	a5,s9,a5
    ce50:	fffd0693          	add	a3,s10,-1
    ce54:	3797e263          	bltu	a5,s9,d1b8 <__divdf3+0x85c>
    ce58:	3777f063          	bgeu	a5,s7,d1b8 <__divdf3+0x85c>
    ce5c:	ffed0713          	add	a4,s10,-2
    ce60:	00e12623          	sw	a4,12(sp)
    ce64:	019787b3          	add	a5,a5,s9
    ce68:	41778bb3          	sub	s7,a5,s7
    ce6c:	00090593          	mv	a1,s2
    ce70:	000b8513          	mv	a0,s7
    ce74:	5b5010ef          	jal	ec28 <__hidden___udivsi3>
    ce78:	00050593          	mv	a1,a0
    ce7c:	00050d13          	mv	s10,a0
    ce80:	000b0513          	mv	a0,s6
    ce84:	4e1010ef          	jal	eb64 <__mulsi3>
    ce88:	00050793          	mv	a5,a0
    ce8c:	00090593          	mv	a1,s2
    ce90:	000b8513          	mv	a0,s7
    ce94:	00078913          	mv	s2,a5
    ce98:	01049493          	sll	s1,s1,0x10
    ce9c:	5d5010ef          	jal	ec70 <__umodsi3>
    cea0:	01051513          	sll	a0,a0,0x10
    cea4:	0104d493          	srl	s1,s1,0x10
    cea8:	00a4e4b3          	or	s1,s1,a0
    ceac:	0124fe63          	bgeu	s1,s2,cec8 <__divdf3+0x56c>
    ceb0:	009c84b3          	add	s1,s9,s1
    ceb4:	fffd0793          	add	a5,s10,-1
    ceb8:	3194e463          	bltu	s1,s9,d1c0 <__divdf3+0x864>
    cebc:	3124f263          	bgeu	s1,s2,d1c0 <__divdf3+0x864>
    cec0:	ffed0d13          	add	s10,s10,-2
    cec4:	019484b3          	add	s1,s1,s9
    cec8:	00c12783          	lw	a5,12(sp)
    cecc:	412484b3          	sub	s1,s1,s2
    ced0:	000d8593          	mv	a1,s11
    ced4:	01079813          	sll	a6,a5,0x10
    ced8:	01a86833          	or	a6,a6,s10
    cedc:	01081313          	sll	t1,a6,0x10
    cee0:	01035313          	srl	t1,t1,0x10
    cee4:	01085793          	srl	a5,a6,0x10
    cee8:	00030513          	mv	a0,t1
    ceec:	479010ef          	jal	eb64 <__mulsi3>
    cef0:	00050893          	mv	a7,a0
    cef4:	000c0593          	mv	a1,s8
    cef8:	00030513          	mv	a0,t1
    cefc:	469010ef          	jal	eb64 <__mulsi3>
    cf00:	00050313          	mv	t1,a0
    cf04:	000d8593          	mv	a1,s11
    cf08:	00078513          	mv	a0,a5
    cf0c:	459010ef          	jal	eb64 <__mulsi3>
    cf10:	00050e13          	mv	t3,a0
    cf14:	000c0593          	mv	a1,s8
    cf18:	00078513          	mv	a0,a5
    cf1c:	449010ef          	jal	eb64 <__mulsi3>
    cf20:	0108d793          	srl	a5,a7,0x10
    cf24:	01c30333          	add	t1,t1,t3
    cf28:	006787b3          	add	a5,a5,t1
    cf2c:	01c7f663          	bgeu	a5,t3,cf38 <__divdf3+0x5dc>
    cf30:	00010737          	lui	a4,0x10
    cf34:	00e50533          	add	a0,a0,a4
    cf38:	000106b7          	lui	a3,0x10
    cf3c:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cf40:	0107d713          	srl	a4,a5,0x10
    cf44:	00d7f7b3          	and	a5,a5,a3
    cf48:	01079793          	sll	a5,a5,0x10
    cf4c:	00d8f8b3          	and	a7,a7,a3
    cf50:	00a70733          	add	a4,a4,a0
    cf54:	011787b3          	add	a5,a5,a7
    cf58:	02e4e063          	bltu	s1,a4,cf78 <__divdf3+0x61c>
    cf5c:	00e48c63          	beq	s1,a4,cf74 <__divdf3+0x618>
    cf60:	02412c83          	lw	s9,36(sp)
    cf64:	02012d03          	lw	s10,32(sp)
    cf68:	01c12d83          	lw	s11,28(sp)
    cf6c:	00186813          	or	a6,a6,1
    cf70:	c61ff06f          	j	cbd0 <__divdf3+0x274>
    cf74:	1c078a63          	beqz	a5,d148 <__divdf3+0x7ec>
    cf78:	009c84b3          	add	s1,s9,s1
    cf7c:	fff80613          	add	a2,a6,-1
    cf80:	00048693          	mv	a3,s1
    cf84:	1b94ec63          	bltu	s1,s9,d13c <__divdf3+0x7e0>
    cf88:	24e4ea63          	bltu	s1,a4,d1dc <__divdf3+0x880>
    cf8c:	26e48863          	beq	s1,a4,d1fc <__divdf3+0x8a0>
    cf90:	00060813          	mv	a6,a2
    cf94:	fcdff06f          	j	cf60 <__divdf3+0x604>
    cf98:	00100713          	li	a4,1
    cf9c:	b20790e3          	bnez	a5,cabc <__divdf3+0x160>
    cfa0:	41e98793          	add	a5,s3,1054
    cfa4:	00f816b3          	sll	a3,a6,a5
    cfa8:	00d036b3          	snez	a3,a3
    cfac:	00f417b3          	sll	a5,s0,a5
    cfb0:	00f6e7b3          	or	a5,a3,a5
    cfb4:	00e85833          	srl	a6,a6,a4
    cfb8:	00f86833          	or	a6,a6,a5
    cfbc:	00787793          	and	a5,a6,7
    cfc0:	00e45433          	srl	s0,s0,a4
    cfc4:	02078063          	beqz	a5,cfe4 <__divdf3+0x688>
    cfc8:	00f87793          	and	a5,a6,15
    cfcc:	00400713          	li	a4,4
    cfd0:	00e78a63          	beq	a5,a4,cfe4 <__divdf3+0x688>
    cfd4:	00480793          	add	a5,a6,4
    cfd8:	0107b833          	sltu	a6,a5,a6
    cfdc:	01040433          	add	s0,s0,a6
    cfe0:	00078813          	mv	a6,a5
    cfe4:	00841613          	sll	a2,s0,0x8
    cfe8:	00100793          	li	a5,1
    cfec:	00000693          	li	a3,0
    cff0:	00000713          	li	a4,0
    cff4:	ae0640e3          	bltz	a2,cad4 <__divdf3+0x178>
    cff8:	1280006f          	j	d120 <__divdf3+0x7c4>
    cffc:	de9d7ce3          	bgeu	s10,s1,cdf4 <__divdf3+0x498>
    d000:	015d06b3          	add	a3,s10,s5
    d004:	01a6b633          	sltu	a2,a3,s10
    d008:	019605b3          	add	a1,a2,s9
    d00c:	00bb8bb3          	add	s7,s7,a1
    d010:	00068d13          	mv	s10,a3
    d014:	fff40593          	add	a1,s0,-1
    d018:	077cfe63          	bgeu	s9,s7,d094 <__divdf3+0x738>
    d01c:	14fbe063          	bltu	s7,a5,d15c <__divdf3+0x800>
    d020:	13778c63          	beq	a5,s7,d158 <__divdf3+0x7fc>
    d024:	00058413          	mv	s0,a1
    d028:	dcdff06f          	j	cdf4 <__divdf3+0x498>
    d02c:	c50bece3          	bltu	s7,a6,cc84 <__divdf3+0x328>
    d030:	01fb1c13          	sll	s8,s6,0x1f
    d034:	001bd713          	srl	a4,s7,0x1
    d038:	001b5493          	srl	s1,s6,0x1
    d03c:	00ec6c33          	or	s8,s8,a4
    d040:	01fb9d13          	sll	s10,s7,0x1f
    d044:	c51ff06f          	j	cc94 <__divdf3+0x338>
    d048:	000a0513          	mv	a0,s4
    d04c:	489010ef          	jal	ecd4 <__clzsi2>
    d050:	01550693          	add	a3,a0,21
    d054:	01c00713          	li	a4,28
    d058:	02050793          	add	a5,a0,32
    d05c:	a2d75ae3          	bge	a4,a3,ca90 <__divdf3+0x134>
    d060:	ff850513          	add	a0,a0,-8
    d064:	00000813          	li	a6,0
    d068:	00aa1433          	sll	s0,s4,a0
    d06c:	a41ff06f          	j	caac <__divdf3+0x150>
    d070:	465010ef          	jal	ecd4 <__clzsi2>
    d074:	01550793          	add	a5,a0,21
    d078:	01c00693          	li	a3,28
    d07c:	02050713          	add	a4,a0,32
    d080:	acf6dee3          	bge	a3,a5,cb5c <__divdf3+0x200>
    d084:	ff850493          	add	s1,a0,-8
    d088:	00941b33          	sll	s6,s0,s1
    d08c:	00000b93          	li	s7,0
    d090:	ae9ff06f          	j	cb78 <__divdf3+0x21c>
    d094:	f97c98e3          	bne	s9,s7,d024 <__divdf3+0x6c8>
    d098:	f80602e3          	beqz	a2,d01c <__divdf3+0x6c0>
    d09c:	00058413          	mv	s0,a1
    d0a0:	d55ff06f          	j	cdf4 <__divdf3+0x498>
    d0a4:	ca97f8e3          	bgeu	a5,s1,cd54 <__divdf3+0x3f8>
    d0a8:	ffeb8b93          	add	s7,s7,-2
    d0ac:	019787b3          	add	a5,a5,s9
    d0b0:	ca9ff06f          	j	cd58 <__divdf3+0x3fc>
    d0b4:	c497f4e3          	bgeu	a5,s1,ccfc <__divdf3+0x3a0>
    d0b8:	ffe40413          	add	s0,s0,-2
    d0bc:	019787b3          	add	a5,a5,s9
    d0c0:	c41ff06f          	j	cd00 <__divdf3+0x3a4>
    d0c4:	01f00693          	li	a3,31
    d0c8:	ece6dce3          	bge	a3,a4,cfa0 <__divdf3+0x644>
    d0cc:	fe100693          	li	a3,-31
    d0d0:	40f686b3          	sub	a3,a3,a5
    d0d4:	02000793          	li	a5,32
    d0d8:	00d456b3          	srl	a3,s0,a3
    d0dc:	00f70863          	beq	a4,a5,d0ec <__divdf3+0x790>
    d0e0:	43e98793          	add	a5,s3,1086
    d0e4:	00f417b3          	sll	a5,s0,a5
    d0e8:	00f86833          	or	a6,a6,a5
    d0ec:	01003833          	snez	a6,a6
    d0f0:	00d86833          	or	a6,a6,a3
    d0f4:	00787713          	and	a4,a6,7
    d0f8:	00000693          	li	a3,0
    d0fc:	02070863          	beqz	a4,d12c <__divdf3+0x7d0>
    d100:	00f87793          	and	a5,a6,15
    d104:	00400713          	li	a4,4
    d108:	00000413          	li	s0,0
    d10c:	00e78a63          	beq	a5,a4,d120 <__divdf3+0x7c4>
    d110:	00480793          	add	a5,a6,4
    d114:	0107b833          	sltu	a6,a5,a6
    d118:	01003433          	snez	s0,a6
    d11c:	00078813          	mv	a6,a5
    d120:	00941693          	sll	a3,s0,0x9
    d124:	01d41713          	sll	a4,s0,0x1d
    d128:	00c6d693          	srl	a3,a3,0xc
    d12c:	00385813          	srl	a6,a6,0x3
    d130:	00e86733          	or	a4,a6,a4
    d134:	00000793          	li	a5,0
    d138:	99dff06f          	j	cad4 <__divdf3+0x178>
    d13c:	00060813          	mv	a6,a2
    d140:	e2e690e3          	bne	a3,a4,cf60 <__divdf3+0x604>
    d144:	e1579ee3          	bne	a5,s5,cf60 <__divdf3+0x604>
    d148:	02412c83          	lw	s9,36(sp)
    d14c:	02012d03          	lw	s10,32(sp)
    d150:	01c12d83          	lw	s11,28(sp)
    d154:	a7dff06f          	j	cbd0 <__divdf3+0x274>
    d158:	ec96f6e3          	bgeu	a3,s1,d024 <__divdf3+0x6c8>
    d15c:	00da86b3          	add	a3,s5,a3
    d160:	0156b633          	sltu	a2,a3,s5
    d164:	01960633          	add	a2,a2,s9
    d168:	ffe40413          	add	s0,s0,-2
    d16c:	00068d13          	mv	s10,a3
    d170:	00cb8bb3          	add	s7,s7,a2
    d174:	c81ff06f          	j	cdf4 <__divdf3+0x498>
    d178:	c0200713          	li	a4,-1022
    d17c:	02412c83          	lw	s9,36(sp)
    d180:	02012d03          	lw	s10,32(sp)
    d184:	01c12d83          	lw	s11,28(sp)
    d188:	3ff98793          	add	a5,s3,1023
    d18c:	fff00813          	li	a6,-1
    d190:	e0e9c4e3          	blt	s3,a4,cf98 <__divdf3+0x63c>
    d194:	00480713          	add	a4,a6,4
    d198:	01073833          	sltu	a6,a4,a6
    d19c:	01040433          	add	s0,s0,a6
    d1a0:	00070813          	mv	a6,a4
    d1a4:	a3dff06f          	j	cbe0 <__divdf3+0x284>
    d1a8:	00f87713          	and	a4,a6,15
    d1ac:	00400693          	li	a3,4
    d1b0:	a2d708e3          	beq	a4,a3,cbe0 <__divdf3+0x284>
    d1b4:	fe1ff06f          	j	d194 <__divdf3+0x838>
    d1b8:	00d12623          	sw	a3,12(sp)
    d1bc:	cadff06f          	j	ce68 <__divdf3+0x50c>
    d1c0:	00078d13          	mv	s10,a5
    d1c4:	d05ff06f          	j	cec8 <__divdf3+0x56c>
    d1c8:	00090a13          	mv	s4,s2
    d1cc:	7ff00793          	li	a5,2047
    d1d0:	00000693          	li	a3,0
    d1d4:	00000713          	li	a4,0
    d1d8:	8fdff06f          	j	cad4 <__divdf3+0x178>
    d1dc:	001a9613          	sll	a2,s5,0x1
    d1e0:	015636b3          	sltu	a3,a2,s5
    d1e4:	019686b3          	add	a3,a3,s9
    d1e8:	00d486b3          	add	a3,s1,a3
    d1ec:	ffe80813          	add	a6,a6,-2
    d1f0:	00060a93          	mv	s5,a2
    d1f4:	f4e688e3          	beq	a3,a4,d144 <__divdf3+0x7e8>
    d1f8:	d69ff06f          	j	cf60 <__divdf3+0x604>
    d1fc:	fefae0e3          	bltu	s5,a5,d1dc <__divdf3+0x880>
    d200:	00060813          	mv	a6,a2
    d204:	f41ff06f          	j	d144 <__divdf3+0x7e8>

0000d208 <__eqdf2>:
    d208:	0145d713          	srl	a4,a1,0x14
    d20c:	001007b7          	lui	a5,0x100
    d210:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d214:	0146d813          	srl	a6,a3,0x14
    d218:	7ff77713          	and	a4,a4,2047
    d21c:	7ff00313          	li	t1,2047
    d220:	00b7fe33          	and	t3,a5,a1
    d224:	00050893          	mv	a7,a0
    d228:	00d7f7b3          	and	a5,a5,a3
    d22c:	01f5d593          	srl	a1,a1,0x1f
    d230:	7ff87813          	and	a6,a6,2047
    d234:	01f6d693          	srl	a3,a3,0x1f
    d238:	00100513          	li	a0,1
    d23c:	00670c63          	beq	a4,t1,d254 <__eqdf2+0x4c>
    d240:	00680863          	beq	a6,t1,d250 <__eqdf2+0x48>
    d244:	01071463          	bne	a4,a6,d24c <__eqdf2+0x44>
    d248:	02fe0663          	beq	t3,a5,d274 <__eqdf2+0x6c>
    d24c:	00008067          	ret
    d250:	00008067          	ret
    d254:	fee81ce3          	bne	a6,a4,d24c <__eqdf2+0x44>
    d258:	00fe67b3          	or	a5,t3,a5
    d25c:	00c7e7b3          	or	a5,a5,a2
    d260:	0117e7b3          	or	a5,a5,a7
    d264:	fe0794e3          	bnez	a5,d24c <__eqdf2+0x44>
    d268:	40d585b3          	sub	a1,a1,a3
    d26c:	00b03533          	snez	a0,a1
    d270:	00008067          	ret
    d274:	fcc89ce3          	bne	a7,a2,d24c <__eqdf2+0x44>
    d278:	00d58a63          	beq	a1,a3,d28c <__eqdf2+0x84>
    d27c:	fc0718e3          	bnez	a4,d24c <__eqdf2+0x44>
    d280:	011e6e33          	or	t3,t3,a7
    d284:	01c03533          	snez	a0,t3
    d288:	00008067          	ret
    d28c:	00000513          	li	a0,0
    d290:	00008067          	ret

0000d294 <__gedf2>:
    d294:	0145d893          	srl	a7,a1,0x14
    d298:	001007b7          	lui	a5,0x100
    d29c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d2a0:	0146d713          	srl	a4,a3,0x14
    d2a4:	7ff8f893          	and	a7,a7,2047
    d2a8:	7ff00e13          	li	t3,2047
    d2ac:	00b7f333          	and	t1,a5,a1
    d2b0:	00050813          	mv	a6,a0
    d2b4:	00050e93          	mv	t4,a0
    d2b8:	00d7f7b3          	and	a5,a5,a3
    d2bc:	01f5d593          	srl	a1,a1,0x1f
    d2c0:	00060f13          	mv	t5,a2
    d2c4:	7ff77513          	and	a0,a4,2047
    d2c8:	01f6d693          	srl	a3,a3,0x1f
    d2cc:	05c88863          	beq	a7,t3,d31c <__gedf2+0x88>
    d2d0:	03c50463          	beq	a0,t3,d2f8 <__gedf2+0x64>
    d2d4:	06089a63          	bnez	a7,d348 <__gedf2+0xb4>
    d2d8:	01036833          	or	a6,t1,a6
    d2dc:	06051063          	bnez	a0,d33c <__gedf2+0xa8>
    d2e0:	00c7e633          	or	a2,a5,a2
    d2e4:	08060c63          	beqz	a2,d37c <__gedf2+0xe8>
    d2e8:	0a081263          	bnez	a6,d38c <__gedf2+0xf8>
    d2ec:	00100513          	li	a0,1
    d2f0:	08068263          	beqz	a3,d374 <__gedf2+0xe0>
    d2f4:	00008067          	ret
    d2f8:	00c7e633          	or	a2,a5,a2
    d2fc:	08061463          	bnez	a2,d384 <__gedf2+0xf0>
    d300:	00089663          	bnez	a7,d30c <__gedf2+0x78>
    d304:	01036333          	or	t1,t1,a6
    d308:	fe0302e3          	beqz	t1,d2ec <__gedf2+0x58>
    d30c:	06d58063          	beq	a1,a3,d36c <__gedf2+0xd8>
    d310:	06059263          	bnez	a1,d374 <__gedf2+0xe0>
    d314:	00100513          	li	a0,1
    d318:	00008067          	ret
    d31c:	01036333          	or	t1,t1,a6
    d320:	06031263          	bnez	t1,d384 <__gedf2+0xf0>
    d324:	ff1516e3          	bne	a0,a7,d310 <__gedf2+0x7c>
    d328:	00c7e7b3          	or	a5,a5,a2
    d32c:	04079c63          	bnez	a5,d384 <__gedf2+0xf0>
    d330:	fed590e3          	bne	a1,a3,d310 <__gedf2+0x7c>
    d334:	00000513          	li	a0,0
    d338:	00008067          	ret
    d33c:	fa0808e3          	beqz	a6,d2ec <__gedf2+0x58>
    d340:	fcd598e3          	bne	a1,a3,d310 <__gedf2+0x7c>
    d344:	0280006f          	j	d36c <__gedf2+0xd8>
    d348:	fc0504e3          	beqz	a0,d310 <__gedf2+0x7c>
    d34c:	fcd592e3          	bne	a1,a3,d310 <__gedf2+0x7c>
    d350:	fd1540e3          	blt	a0,a7,d310 <__gedf2+0x7c>
    d354:	00a8cc63          	blt	a7,a0,d36c <__gedf2+0xd8>
    d358:	fa67ece3          	bltu	a5,t1,d310 <__gedf2+0x7c>
    d35c:	00f31863          	bne	t1,a5,d36c <__gedf2+0xd8>
    d360:	fbdf68e3          	bltu	t5,t4,d310 <__gedf2+0x7c>
    d364:	00000513          	li	a0,0
    d368:	f9eef6e3          	bgeu	t4,t5,d2f4 <__gedf2+0x60>
    d36c:	00100513          	li	a0,1
    d370:	f80592e3          	bnez	a1,d2f4 <__gedf2+0x60>
    d374:	fff00513          	li	a0,-1
    d378:	00008067          	ret
    d37c:	f8081ae3          	bnez	a6,d310 <__gedf2+0x7c>
    d380:	00008067          	ret
    d384:	ffe00513          	li	a0,-2
    d388:	00008067          	ret
    d38c:	fcd586e3          	beq	a1,a3,d358 <__gedf2+0xc4>
    d390:	f81ff06f          	j	d310 <__gedf2+0x7c>

0000d394 <__ledf2>:
    d394:	0145d893          	srl	a7,a1,0x14
    d398:	001007b7          	lui	a5,0x100
    d39c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d3a0:	0146d713          	srl	a4,a3,0x14
    d3a4:	7ff8f893          	and	a7,a7,2047
    d3a8:	7ff00313          	li	t1,2047
    d3ac:	00b7fe33          	and	t3,a5,a1
    d3b0:	00050813          	mv	a6,a0
    d3b4:	00050e93          	mv	t4,a0
    d3b8:	00d7f7b3          	and	a5,a5,a3
    d3bc:	01f5d593          	srl	a1,a1,0x1f
    d3c0:	00060f13          	mv	t5,a2
    d3c4:	7ff77513          	and	a0,a4,2047
    d3c8:	01f6d693          	srl	a3,a3,0x1f
    d3cc:	04688a63          	beq	a7,t1,d420 <__ledf2+0x8c>
    d3d0:	02650463          	beq	a0,t1,d3f8 <__ledf2+0x64>
    d3d4:	06089863          	bnez	a7,d444 <__ledf2+0xb0>
    d3d8:	010e6833          	or	a6,t3,a6
    d3dc:	08051e63          	bnez	a0,d478 <__ledf2+0xe4>
    d3e0:	00c7e633          	or	a2,a5,a2
    d3e4:	0a060463          	beqz	a2,d48c <__ledf2+0xf8>
    d3e8:	0a081663          	bnez	a6,d494 <__ledf2+0x100>
    d3ec:	00100513          	li	a0,1
    d3f0:	08068063          	beqz	a3,d470 <__ledf2+0xdc>
    d3f4:	00008067          	ret
    d3f8:	00c7e633          	or	a2,a5,a2
    d3fc:	00200513          	li	a0,2
    d400:	fe061ae3          	bnez	a2,d3f4 <__ledf2+0x60>
    d404:	00089663          	bnez	a7,d410 <__ledf2+0x7c>
    d408:	010e6e33          	or	t3,t3,a6
    d40c:	fe0e00e3          	beqz	t3,d3ec <__ledf2+0x58>
    d410:	04d58c63          	beq	a1,a3,d468 <__ledf2+0xd4>
    d414:	04059e63          	bnez	a1,d470 <__ledf2+0xdc>
    d418:	00100513          	li	a0,1
    d41c:	00008067          	ret
    d420:	010e6e33          	or	t3,t3,a6
    d424:	060e1063          	bnez	t3,d484 <__ledf2+0xf0>
    d428:	ff1516e3          	bne	a0,a7,d414 <__ledf2+0x80>
    d42c:	00c7e7b3          	or	a5,a5,a2
    d430:	00200513          	li	a0,2
    d434:	fc0790e3          	bnez	a5,d3f4 <__ledf2+0x60>
    d438:	fcd59ee3          	bne	a1,a3,d414 <__ledf2+0x80>
    d43c:	00000513          	li	a0,0
    d440:	00008067          	ret
    d444:	fc0508e3          	beqz	a0,d414 <__ledf2+0x80>
    d448:	fcd596e3          	bne	a1,a3,d414 <__ledf2+0x80>
    d44c:	fd1544e3          	blt	a0,a7,d414 <__ledf2+0x80>
    d450:	00a8cc63          	blt	a7,a0,d468 <__ledf2+0xd4>
    d454:	fdc7e0e3          	bltu	a5,t3,d414 <__ledf2+0x80>
    d458:	00fe1863          	bne	t3,a5,d468 <__ledf2+0xd4>
    d45c:	fbdf6ce3          	bltu	t5,t4,d414 <__ledf2+0x80>
    d460:	00000513          	li	a0,0
    d464:	f9eef8e3          	bgeu	t4,t5,d3f4 <__ledf2+0x60>
    d468:	00100513          	li	a0,1
    d46c:	f80594e3          	bnez	a1,d3f4 <__ledf2+0x60>
    d470:	fff00513          	li	a0,-1
    d474:	00008067          	ret
    d478:	f6080ae3          	beqz	a6,d3ec <__ledf2+0x58>
    d47c:	f8d59ce3          	bne	a1,a3,d414 <__ledf2+0x80>
    d480:	fe9ff06f          	j	d468 <__ledf2+0xd4>
    d484:	00200513          	li	a0,2
    d488:	00008067          	ret
    d48c:	f80814e3          	bnez	a6,d414 <__ledf2+0x80>
    d490:	00008067          	ret
    d494:	fcd580e3          	beq	a1,a3,d454 <__ledf2+0xc0>
    d498:	f7dff06f          	j	d414 <__ledf2+0x80>

0000d49c <__muldf3>:
    d49c:	fd010113          	add	sp,sp,-48
    d4a0:	0145d793          	srl	a5,a1,0x14
    d4a4:	02812423          	sw	s0,40(sp)
    d4a8:	02912223          	sw	s1,36(sp)
    d4ac:	03212023          	sw	s2,32(sp)
    d4b0:	01312e23          	sw	s3,28(sp)
    d4b4:	01512a23          	sw	s5,20(sp)
    d4b8:	00c59493          	sll	s1,a1,0xc
    d4bc:	02112623          	sw	ra,44(sp)
    d4c0:	01412c23          	sw	s4,24(sp)
    d4c4:	01612823          	sw	s6,16(sp)
    d4c8:	01712623          	sw	s7,12(sp)
    d4cc:	01812423          	sw	s8,8(sp)
    d4d0:	7ff7f793          	and	a5,a5,2047
    d4d4:	00050413          	mv	s0,a0
    d4d8:	00060a93          	mv	s5,a2
    d4dc:	00068993          	mv	s3,a3
    d4e0:	00c4d493          	srl	s1,s1,0xc
    d4e4:	01f5d913          	srl	s2,a1,0x1f
    d4e8:	4e078063          	beqz	a5,d9c8 <__muldf3+0x52c>
    d4ec:	7ff00713          	li	a4,2047
    d4f0:	0ae78663          	beq	a5,a4,d59c <__muldf3+0x100>
    d4f4:	00349693          	sll	a3,s1,0x3
    d4f8:	01d55713          	srl	a4,a0,0x1d
    d4fc:	00d76733          	or	a4,a4,a3
    d500:	008006b7          	lui	a3,0x800
    d504:	00d764b3          	or	s1,a4,a3
    d508:	00351a13          	sll	s4,a0,0x3
    d50c:	c0178c13          	add	s8,a5,-1023
    d510:	00000b13          	li	s6,0
    d514:	00000b93          	li	s7,0
    d518:	0149d793          	srl	a5,s3,0x14
    d51c:	00c99713          	sll	a4,s3,0xc
    d520:	7ff7f793          	and	a5,a5,2047
    d524:	000a8e13          	mv	t3,s5
    d528:	00c75413          	srl	s0,a4,0xc
    d52c:	01f9d993          	srl	s3,s3,0x1f
    d530:	0a078063          	beqz	a5,d5d0 <__muldf3+0x134>
    d534:	7ff00713          	li	a4,2047
    d538:	14e78e63          	beq	a5,a4,d694 <__muldf3+0x1f8>
    d53c:	00341713          	sll	a4,s0,0x3
    d540:	01dad693          	srl	a3,s5,0x1d
    d544:	00e6e6b3          	or	a3,a3,a4
    d548:	c0178793          	add	a5,a5,-1023
    d54c:	00800737          	lui	a4,0x800
    d550:	00e6e433          	or	s0,a3,a4
    d554:	003a9e13          	sll	t3,s5,0x3
    d558:	01878333          	add	t1,a5,s8
    d55c:	00000693          	li	a3,0
    d560:	00a00793          	li	a5,10
    d564:	00130893          	add	a7,t1,1
    d568:	0b67cc63          	blt	a5,s6,d620 <__muldf3+0x184>
    d56c:	013945b3          	xor	a1,s2,s3
    d570:	00200793          	li	a5,2
    d574:	00058813          	mv	a6,a1
    d578:	1567c663          	blt	a5,s6,d6c4 <__muldf3+0x228>
    d57c:	fffb0b13          	add	s6,s6,-1
    d580:	00100713          	li	a4,1
    d584:	17676063          	bltu	a4,s6,d6e4 <__muldf3+0x248>
    d588:	48f68663          	beq	a3,a5,da14 <__muldf3+0x578>
    d58c:	00040493          	mv	s1,s0
    d590:	000e0a13          	mv	s4,t3
    d594:	00068b93          	mv	s7,a3
    d598:	09c0006f          	j	d634 <__muldf3+0x198>
    d59c:	00a4ea33          	or	s4,s1,a0
    d5a0:	480a1463          	bnez	s4,da28 <__muldf3+0x58c>
    d5a4:	0149d793          	srl	a5,s3,0x14
    d5a8:	00c99713          	sll	a4,s3,0xc
    d5ac:	7ff7f793          	and	a5,a5,2047
    d5b0:	00000493          	li	s1,0
    d5b4:	00800b13          	li	s6,8
    d5b8:	7ff00c13          	li	s8,2047
    d5bc:	00200b93          	li	s7,2
    d5c0:	000a8e13          	mv	t3,s5
    d5c4:	00c75413          	srl	s0,a4,0xc
    d5c8:	01f9d993          	srl	s3,s3,0x1f
    d5cc:	f60794e3          	bnez	a5,d534 <__muldf3+0x98>
    d5d0:	015467b3          	or	a5,s0,s5
    d5d4:	46078e63          	beqz	a5,da50 <__muldf3+0x5b4>
    d5d8:	54040c63          	beqz	s0,db30 <__muldf3+0x694>
    d5dc:	00040513          	mv	a0,s0
    d5e0:	6f4010ef          	jal	ecd4 <__clzsi2>
    d5e4:	00050313          	mv	t1,a0
    d5e8:	ff550713          	add	a4,a0,-11
    d5ec:	01d00793          	li	a5,29
    d5f0:	ff830e13          	add	t3,t1,-8
    d5f4:	40e787b3          	sub	a5,a5,a4
    d5f8:	00fad7b3          	srl	a5,s5,a5
    d5fc:	01c41733          	sll	a4,s0,t3
    d600:	00e7e433          	or	s0,a5,a4
    d604:	01ca9e33          	sll	t3,s5,t3
    d608:	406c0333          	sub	t1,s8,t1
    d60c:	c0d30313          	add	t1,t1,-1011
    d610:	00a00793          	li	a5,10
    d614:	00000693          	li	a3,0
    d618:	00130893          	add	a7,t1,1
    d61c:	f567d8e3          	bge	a5,s6,d56c <__muldf3+0xd0>
    d620:	00090593          	mv	a1,s2
    d624:	00200793          	li	a5,2
    d628:	3efb8663          	beq	s7,a5,da14 <__muldf3+0x578>
    d62c:	00300793          	li	a5,3
    d630:	54fb8863          	beq	s7,a5,db80 <__muldf3+0x6e4>
    d634:	00100793          	li	a5,1
    d638:	00058813          	mv	a6,a1
    d63c:	52fb9663          	bne	s7,a5,db68 <__muldf3+0x6cc>
    d640:	00000793          	li	a5,0
    d644:	00000693          	li	a3,0
    d648:	00000713          	li	a4,0
    d64c:	02c12083          	lw	ra,44(sp)
    d650:	02812403          	lw	s0,40(sp)
    d654:	01479793          	sll	a5,a5,0x14
    d658:	00d7e7b3          	or	a5,a5,a3
    d65c:	01f81813          	sll	a6,a6,0x1f
    d660:	0107e7b3          	or	a5,a5,a6
    d664:	02412483          	lw	s1,36(sp)
    d668:	02012903          	lw	s2,32(sp)
    d66c:	01c12983          	lw	s3,28(sp)
    d670:	01812a03          	lw	s4,24(sp)
    d674:	01412a83          	lw	s5,20(sp)
    d678:	01012b03          	lw	s6,16(sp)
    d67c:	00c12b83          	lw	s7,12(sp)
    d680:	00812c03          	lw	s8,8(sp)
    d684:	00070513          	mv	a0,a4
    d688:	00078593          	mv	a1,a5
    d68c:	03010113          	add	sp,sp,48
    d690:	00008067          	ret
    d694:	01546733          	or	a4,s0,s5
    d698:	7ffc0313          	add	t1,s8,2047
    d69c:	3c070663          	beqz	a4,da68 <__muldf3+0x5cc>
    d6a0:	00001737          	lui	a4,0x1
    d6a4:	01394833          	xor	a6,s2,s3
    d6a8:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d6ac:	003b6b13          	or	s6,s6,3
    d6b0:	00a00693          	li	a3,10
    d6b4:	00080593          	mv	a1,a6
    d6b8:	00ec08b3          	add	a7,s8,a4
    d6bc:	4366cc63          	blt	a3,s6,daf4 <__muldf3+0x658>
    d6c0:	00300693          	li	a3,3
    d6c4:	00100613          	li	a2,1
    d6c8:	01661633          	sll	a2,a2,s6
    d6cc:	53067713          	and	a4,a2,1328
    d6d0:	f4071ae3          	bnez	a4,d624 <__muldf3+0x188>
    d6d4:	24067793          	and	a5,a2,576
    d6d8:	48079063          	bnez	a5,db58 <__muldf3+0x6bc>
    d6dc:	08867613          	and	a2,a2,136
    d6e0:	38061e63          	bnez	a2,da7c <__muldf3+0x5e0>
    d6e4:	00010fb7          	lui	t6,0x10
    d6e8:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d6ec:	005a7f33          	and	t5,s4,t0
    d6f0:	005e72b3          	and	t0,t3,t0
    d6f4:	010a5a13          	srl	s4,s4,0x10
    d6f8:	010e5e13          	srl	t3,t3,0x10
    d6fc:	000f0513          	mv	a0,t5
    d700:	00028593          	mv	a1,t0
    d704:	460010ef          	jal	eb64 <__mulsi3>
    d708:	00050713          	mv	a4,a0
    d70c:	000e0593          	mv	a1,t3
    d710:	000f0513          	mv	a0,t5
    d714:	450010ef          	jal	eb64 <__mulsi3>
    d718:	00050793          	mv	a5,a0
    d71c:	00028593          	mv	a1,t0
    d720:	000a0513          	mv	a0,s4
    d724:	440010ef          	jal	eb64 <__mulsi3>
    d728:	00050e93          	mv	t4,a0
    d72c:	000e0593          	mv	a1,t3
    d730:	000a0513          	mv	a0,s4
    d734:	430010ef          	jal	eb64 <__mulsi3>
    d738:	01d786b3          	add	a3,a5,t4
    d73c:	01075393          	srl	t2,a4,0x10
    d740:	00d383b3          	add	t2,t2,a3
    d744:	00050793          	mv	a5,a0
    d748:	01d3f463          	bgeu	t2,t4,d750 <__muldf3+0x2b4>
    d74c:	01f507b3          	add	a5,a0,t6
    d750:	000109b7          	lui	s3,0x10
    d754:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d758:	0123feb3          	and	t4,t2,s2
    d75c:	01277733          	and	a4,a4,s2
    d760:	010e9e93          	sll	t4,t4,0x10
    d764:	01247933          	and	s2,s0,s2
    d768:	0103d393          	srl	t2,t2,0x10
    d76c:	00ee8eb3          	add	t4,t4,a4
    d770:	01045413          	srl	s0,s0,0x10
    d774:	000f0513          	mv	a0,t5
    d778:	00090593          	mv	a1,s2
    d77c:	3e8010ef          	jal	eb64 <__mulsi3>
    d780:	00050f93          	mv	t6,a0
    d784:	00040593          	mv	a1,s0
    d788:	000f0513          	mv	a0,t5
    d78c:	3d8010ef          	jal	eb64 <__mulsi3>
    d790:	00050713          	mv	a4,a0
    d794:	00090593          	mv	a1,s2
    d798:	000a0513          	mv	a0,s4
    d79c:	3c8010ef          	jal	eb64 <__mulsi3>
    d7a0:	00050f13          	mv	t5,a0
    d7a4:	00040593          	mv	a1,s0
    d7a8:	000a0513          	mv	a0,s4
    d7ac:	3b8010ef          	jal	eb64 <__mulsi3>
    d7b0:	010fd693          	srl	a3,t6,0x10
    d7b4:	01e70733          	add	a4,a4,t5
    d7b8:	00e686b3          	add	a3,a3,a4
    d7bc:	01e6f463          	bgeu	a3,t5,d7c4 <__muldf3+0x328>
    d7c0:	01350533          	add	a0,a0,s3
    d7c4:	00010a37          	lui	s4,0x10
    d7c8:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d7cc:	01e6f733          	and	a4,a3,t5
    d7d0:	01efffb3          	and	t6,t6,t5
    d7d4:	01071713          	sll	a4,a4,0x10
    d7d8:	01f70733          	add	a4,a4,t6
    d7dc:	01e4ff33          	and	t5,s1,t5
    d7e0:	0106d693          	srl	a3,a3,0x10
    d7e4:	00a68fb3          	add	t6,a3,a0
    d7e8:	00e383b3          	add	t2,t2,a4
    d7ec:	0104d493          	srl	s1,s1,0x10
    d7f0:	000f0513          	mv	a0,t5
    d7f4:	00028593          	mv	a1,t0
    d7f8:	36c010ef          	jal	eb64 <__mulsi3>
    d7fc:	00050a93          	mv	s5,a0
    d800:	000e0593          	mv	a1,t3
    d804:	000f0513          	mv	a0,t5
    d808:	35c010ef          	jal	eb64 <__mulsi3>
    d80c:	00050993          	mv	s3,a0
    d810:	00028593          	mv	a1,t0
    d814:	00048513          	mv	a0,s1
    d818:	34c010ef          	jal	eb64 <__mulsi3>
    d81c:	00050293          	mv	t0,a0
    d820:	000e0593          	mv	a1,t3
    d824:	00048513          	mv	a0,s1
    d828:	33c010ef          	jal	eb64 <__mulsi3>
    d82c:	010ad613          	srl	a2,s5,0x10
    d830:	005989b3          	add	s3,s3,t0
    d834:	01360633          	add	a2,a2,s3
    d838:	00567463          	bgeu	a2,t0,d840 <__muldf3+0x3a4>
    d83c:	01450533          	add	a0,a0,s4
    d840:	00010a37          	lui	s4,0x10
    d844:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d848:	00d672b3          	and	t0,a2,a3
    d84c:	00dafab3          	and	s5,s5,a3
    d850:	01065613          	srl	a2,a2,0x10
    d854:	01029293          	sll	t0,t0,0x10
    d858:	00a60e33          	add	t3,a2,a0
    d85c:	015282b3          	add	t0,t0,s5
    d860:	000f0513          	mv	a0,t5
    d864:	00090593          	mv	a1,s2
    d868:	2fc010ef          	jal	eb64 <__mulsi3>
    d86c:	00050993          	mv	s3,a0
    d870:	00040593          	mv	a1,s0
    d874:	000f0513          	mv	a0,t5
    d878:	2ec010ef          	jal	eb64 <__mulsi3>
    d87c:	00050f13          	mv	t5,a0
    d880:	00090593          	mv	a1,s2
    d884:	00048513          	mv	a0,s1
    d888:	2dc010ef          	jal	eb64 <__mulsi3>
    d88c:	00050913          	mv	s2,a0
    d890:	00040593          	mv	a1,s0
    d894:	00048513          	mv	a0,s1
    d898:	2cc010ef          	jal	eb64 <__mulsi3>
    d89c:	012f06b3          	add	a3,t5,s2
    d8a0:	0109d593          	srl	a1,s3,0x10
    d8a4:	00d58433          	add	s0,a1,a3
    d8a8:	00050f13          	mv	t5,a0
    d8ac:	01247463          	bgeu	s0,s2,d8b4 <__muldf3+0x418>
    d8b0:	01450f33          	add	t5,a0,s4
    d8b4:	00010637          	lui	a2,0x10
    d8b8:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d8bc:	00c476b3          	and	a3,s0,a2
    d8c0:	00c9f9b3          	and	s3,s3,a2
    d8c4:	01069693          	sll	a3,a3,0x10
    d8c8:	007787b3          	add	a5,a5,t2
    d8cc:	013686b3          	add	a3,a3,s3
    d8d0:	01f685b3          	add	a1,a3,t6
    d8d4:	00e7b733          	sltu	a4,a5,a4
    d8d8:	00e58733          	add	a4,a1,a4
    d8dc:	005782b3          	add	t0,a5,t0
    d8e0:	01c70633          	add	a2,a4,t3
    d8e4:	00f2b7b3          	sltu	a5,t0,a5
    d8e8:	00f607b3          	add	a5,a2,a5
    d8ec:	00d5b6b3          	sltu	a3,a1,a3
    d8f0:	00b735b3          	sltu	a1,a4,a1
    d8f4:	00b6e6b3          	or	a3,a3,a1
    d8f8:	00e63733          	sltu	a4,a2,a4
    d8fc:	01045593          	srl	a1,s0,0x10
    d900:	00c7b633          	sltu	a2,a5,a2
    d904:	00b686b3          	add	a3,a3,a1
    d908:	00929a13          	sll	s4,t0,0x9
    d90c:	00c76733          	or	a4,a4,a2
    d910:	00d70733          	add	a4,a4,a3
    d914:	01da6a33          	or	s4,s4,t4
    d918:	01e70733          	add	a4,a4,t5
    d91c:	01403a33          	snez	s4,s4
    d920:	0172d293          	srl	t0,t0,0x17
    d924:	00971713          	sll	a4,a4,0x9
    d928:	0177d693          	srl	a3,a5,0x17
    d92c:	005a6a33          	or	s4,s4,t0
    d930:	00979793          	sll	a5,a5,0x9
    d934:	00fa6a33          	or	s4,s4,a5
    d938:	00771793          	sll	a5,a4,0x7
    d93c:	00d764b3          	or	s1,a4,a3
    d940:	0207d063          	bgez	a5,d960 <__muldf3+0x4c4>
    d944:	001a5793          	srl	a5,s4,0x1
    d948:	001a7a13          	and	s4,s4,1
    d94c:	01f49713          	sll	a4,s1,0x1f
    d950:	0147e7b3          	or	a5,a5,s4
    d954:	00e7ea33          	or	s4,a5,a4
    d958:	0014d493          	srl	s1,s1,0x1
    d95c:	00088313          	mv	t1,a7
    d960:	3ff30793          	add	a5,t1,1023
    d964:	12f05663          	blez	a5,da90 <__muldf3+0x5f4>
    d968:	007a7713          	and	a4,s4,7
    d96c:	02070063          	beqz	a4,d98c <__muldf3+0x4f0>
    d970:	00fa7713          	and	a4,s4,15
    d974:	00400693          	li	a3,4
    d978:	00d70a63          	beq	a4,a3,d98c <__muldf3+0x4f0>
    d97c:	004a0713          	add	a4,s4,4
    d980:	01473a33          	sltu	s4,a4,s4
    d984:	014484b3          	add	s1,s1,s4
    d988:	00070a13          	mv	s4,a4
    d98c:	00749713          	sll	a4,s1,0x7
    d990:	00075a63          	bgez	a4,d9a4 <__muldf3+0x508>
    d994:	ff0007b7          	lui	a5,0xff000
    d998:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d99c:	00f4f4b3          	and	s1,s1,a5
    d9a0:	40030793          	add	a5,t1,1024
    d9a4:	7fe00713          	li	a4,2046
    d9a8:	1cf74463          	blt	a4,a5,db70 <__muldf3+0x6d4>
    d9ac:	003a5a13          	srl	s4,s4,0x3
    d9b0:	01d49713          	sll	a4,s1,0x1d
    d9b4:	00949693          	sll	a3,s1,0x9
    d9b8:	01476733          	or	a4,a4,s4
    d9bc:	00c6d693          	srl	a3,a3,0xc
    d9c0:	7ff7f793          	and	a5,a5,2047
    d9c4:	c89ff06f          	j	d64c <__muldf3+0x1b0>
    d9c8:	00a4ea33          	or	s4,s1,a0
    d9cc:	060a0863          	beqz	s4,da3c <__muldf3+0x5a0>
    d9d0:	12048e63          	beqz	s1,db0c <__muldf3+0x670>
    d9d4:	00048513          	mv	a0,s1
    d9d8:	2fc010ef          	jal	ecd4 <__clzsi2>
    d9dc:	00050713          	mv	a4,a0
    d9e0:	ff550693          	add	a3,a0,-11
    d9e4:	01d00793          	li	a5,29
    d9e8:	ff870a13          	add	s4,a4,-8
    d9ec:	40d787b3          	sub	a5,a5,a3
    d9f0:	00f457b3          	srl	a5,s0,a5
    d9f4:	014496b3          	sll	a3,s1,s4
    d9f8:	00d7e4b3          	or	s1,a5,a3
    d9fc:	01441a33          	sll	s4,s0,s4
    da00:	c0d00793          	li	a5,-1011
    da04:	40e78c33          	sub	s8,a5,a4
    da08:	00000b13          	li	s6,0
    da0c:	00000b93          	li	s7,0
    da10:	b09ff06f          	j	d518 <__muldf3+0x7c>
    da14:	00058813          	mv	a6,a1
    da18:	7ff00793          	li	a5,2047
    da1c:	00000693          	li	a3,0
    da20:	00000713          	li	a4,0
    da24:	c29ff06f          	j	d64c <__muldf3+0x1b0>
    da28:	00050a13          	mv	s4,a0
    da2c:	00c00b13          	li	s6,12
    da30:	7ff00c13          	li	s8,2047
    da34:	00300b93          	li	s7,3
    da38:	ae1ff06f          	j	d518 <__muldf3+0x7c>
    da3c:	00000493          	li	s1,0
    da40:	00400b13          	li	s6,4
    da44:	00000c13          	li	s8,0
    da48:	00100b93          	li	s7,1
    da4c:	acdff06f          	j	d518 <__muldf3+0x7c>
    da50:	001b6b13          	or	s6,s6,1
    da54:	000c0313          	mv	t1,s8
    da58:	00000413          	li	s0,0
    da5c:	00000e13          	li	t3,0
    da60:	00100693          	li	a3,1
    da64:	afdff06f          	j	d560 <__muldf3+0xc4>
    da68:	002b6b13          	or	s6,s6,2
    da6c:	00000413          	li	s0,0
    da70:	00000e13          	li	t3,0
    da74:	00200693          	li	a3,2
    da78:	ae9ff06f          	j	d560 <__muldf3+0xc4>
    da7c:	00040493          	mv	s1,s0
    da80:	000e0a13          	mv	s4,t3
    da84:	00068b93          	mv	s7,a3
    da88:	00098593          	mv	a1,s3
    da8c:	b99ff06f          	j	d624 <__muldf3+0x188>
    da90:	00100713          	li	a4,1
    da94:	10079063          	bnez	a5,db94 <__muldf3+0x6f8>
    da98:	41e30313          	add	t1,t1,1054
    da9c:	006a1633          	sll	a2,s4,t1
    daa0:	00c03633          	snez	a2,a2
    daa4:	00649333          	sll	t1,s1,t1
    daa8:	00ea5a33          	srl	s4,s4,a4
    daac:	00666633          	or	a2,a2,t1
    dab0:	01466633          	or	a2,a2,s4
    dab4:	00767793          	and	a5,a2,7
    dab8:	00e4d5b3          	srl	a1,s1,a4
    dabc:	02078063          	beqz	a5,dadc <__muldf3+0x640>
    dac0:	00f67793          	and	a5,a2,15
    dac4:	00400713          	li	a4,4
    dac8:	00e78a63          	beq	a5,a4,dadc <__muldf3+0x640>
    dacc:	00460793          	add	a5,a2,4
    dad0:	00c7b633          	sltu	a2,a5,a2
    dad4:	00c585b3          	add	a1,a1,a2
    dad8:	00078613          	mv	a2,a5
    dadc:	00859513          	sll	a0,a1,0x8
    dae0:	00100793          	li	a5,1
    dae4:	00000693          	li	a3,0
    dae8:	00000713          	li	a4,0
    daec:	b60540e3          	bltz	a0,d64c <__muldf3+0x1b0>
    daf0:	10c0006f          	j	dbfc <__muldf3+0x760>
    daf4:	00f00713          	li	a4,15
    daf8:	12eb1063          	bne	s6,a4,dc18 <__muldf3+0x77c>
    dafc:	00000813          	li	a6,0
    db00:	000806b7          	lui	a3,0x80
    db04:	00000713          	li	a4,0
    db08:	b45ff06f          	j	d64c <__muldf3+0x1b0>
    db0c:	1c8010ef          	jal	ecd4 <__clzsi2>
    db10:	01550693          	add	a3,a0,21
    db14:	01c00793          	li	a5,28
    db18:	02050713          	add	a4,a0,32
    db1c:	ecd7d4e3          	bge	a5,a3,d9e4 <__muldf3+0x548>
    db20:	ff850513          	add	a0,a0,-8
    db24:	00000a13          	li	s4,0
    db28:	00a414b3          	sll	s1,s0,a0
    db2c:	ed5ff06f          	j	da00 <__muldf3+0x564>
    db30:	000a8513          	mv	a0,s5
    db34:	1a0010ef          	jal	ecd4 <__clzsi2>
    db38:	01550713          	add	a4,a0,21
    db3c:	01c00793          	li	a5,28
    db40:	02050313          	add	t1,a0,32
    db44:	aae7d4e3          	bge	a5,a4,d5ec <__muldf3+0x150>
    db48:	ff850513          	add	a0,a0,-8
    db4c:	00000e13          	li	t3,0
    db50:	00aa9433          	sll	s0,s5,a0
    db54:	ab5ff06f          	j	d608 <__muldf3+0x16c>
    db58:	00000813          	li	a6,0
    db5c:	7ff00793          	li	a5,2047
    db60:	000806b7          	lui	a3,0x80
    db64:	ae9ff06f          	j	d64c <__muldf3+0x1b0>
    db68:	00088313          	mv	t1,a7
    db6c:	df5ff06f          	j	d960 <__muldf3+0x4c4>
    db70:	7ff00793          	li	a5,2047
    db74:	00000693          	li	a3,0
    db78:	00000713          	li	a4,0
    db7c:	ad1ff06f          	j	d64c <__muldf3+0x1b0>
    db80:	00000813          	li	a6,0
    db84:	7ff00793          	li	a5,2047
    db88:	000806b7          	lui	a3,0x80
    db8c:	00000713          	li	a4,0
    db90:	abdff06f          	j	d64c <__muldf3+0x1b0>
    db94:	40f70733          	sub	a4,a4,a5
    db98:	03800693          	li	a3,56
    db9c:	aae6c2e3          	blt	a3,a4,d640 <__muldf3+0x1a4>
    dba0:	01f00693          	li	a3,31
    dba4:	eee6dae3          	bge	a3,a4,da98 <__muldf3+0x5fc>
    dba8:	fe100693          	li	a3,-31
    dbac:	40f687b3          	sub	a5,a3,a5
    dbb0:	02000693          	li	a3,32
    dbb4:	00f4d7b3          	srl	a5,s1,a5
    dbb8:	00d70863          	beq	a4,a3,dbc8 <__muldf3+0x72c>
    dbbc:	43e30313          	add	t1,t1,1086
    dbc0:	00649333          	sll	t1,s1,t1
    dbc4:	006a6a33          	or	s4,s4,t1
    dbc8:	01403633          	snez	a2,s4
    dbcc:	00f66633          	or	a2,a2,a5
    dbd0:	00767713          	and	a4,a2,7
    dbd4:	00000693          	li	a3,0
    dbd8:	02070863          	beqz	a4,dc08 <__muldf3+0x76c>
    dbdc:	00f67793          	and	a5,a2,15
    dbe0:	00400713          	li	a4,4
    dbe4:	00000593          	li	a1,0
    dbe8:	00e78a63          	beq	a5,a4,dbfc <__muldf3+0x760>
    dbec:	00460793          	add	a5,a2,4
    dbf0:	00c7b633          	sltu	a2,a5,a2
    dbf4:	00c035b3          	snez	a1,a2
    dbf8:	00078613          	mv	a2,a5
    dbfc:	00959693          	sll	a3,a1,0x9
    dc00:	01d59713          	sll	a4,a1,0x1d
    dc04:	00c6d693          	srl	a3,a3,0xc
    dc08:	00365613          	srl	a2,a2,0x3
    dc0c:	00e66733          	or	a4,a2,a4
    dc10:	00000793          	li	a5,0
    dc14:	a39ff06f          	j	d64c <__muldf3+0x1b0>
    dc18:	00040493          	mv	s1,s0
    dc1c:	000a8a13          	mv	s4,s5
    dc20:	00300b93          	li	s7,3
    dc24:	00098593          	mv	a1,s3
    dc28:	9fdff06f          	j	d624 <__muldf3+0x188>

0000dc2c <__subdf3>:
    dc2c:	001007b7          	lui	a5,0x100
    dc30:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dc34:	fe010113          	add	sp,sp,-32
    dc38:	00b7f8b3          	and	a7,a5,a1
    dc3c:	00d7f833          	and	a6,a5,a3
    dc40:	0146d793          	srl	a5,a3,0x14
    dc44:	00389893          	sll	a7,a7,0x3
    dc48:	00812c23          	sw	s0,24(sp)
    dc4c:	01312623          	sw	s3,12(sp)
    dc50:	01f5d413          	srl	s0,a1,0x1f
    dc54:	0145d993          	srl	s3,a1,0x14
    dc58:	01d55713          	srl	a4,a0,0x1d
    dc5c:	00381813          	sll	a6,a6,0x3
    dc60:	01d65593          	srl	a1,a2,0x1d
    dc64:	00112e23          	sw	ra,28(sp)
    dc68:	00912a23          	sw	s1,20(sp)
    dc6c:	01212823          	sw	s2,16(sp)
    dc70:	7ff7ff13          	and	t5,a5,2047
    dc74:	7ff00313          	li	t1,2047
    dc78:	01176733          	or	a4,a4,a7
    dc7c:	7ff9f993          	and	s3,s3,2047
    dc80:	00040e13          	mv	t3,s0
    dc84:	00351893          	sll	a7,a0,0x3
    dc88:	01f6d693          	srl	a3,a3,0x1f
    dc8c:	0105e5b3          	or	a1,a1,a6
    dc90:	00361e93          	sll	t4,a2,0x3
    dc94:	206f0c63          	beq	t5,t1,deac <__subdf3+0x280>
    dc98:	0016c693          	xor	a3,a3,1
    dc9c:	41e987b3          	sub	a5,s3,t5
    dca0:	16d40263          	beq	s0,a3,de04 <__subdf3+0x1d8>
    dca4:	00f05ae3          	blez	a5,e4b8 <__subdf3+0x88c>
    dca8:	240f0a63          	beqz	t5,defc <__subdf3+0x2d0>
    dcac:	3c698463          	beq	s3,t1,e074 <__subdf3+0x448>
    dcb0:	03800693          	li	a3,56
    dcb4:	00100513          	li	a0,1
    dcb8:	02f6ce63          	blt	a3,a5,dcf4 <__subdf3+0xc8>
    dcbc:	008006b7          	lui	a3,0x800
    dcc0:	00d5e5b3          	or	a1,a1,a3
    dcc4:	01f00693          	li	a3,31
    dcc8:	4ef6c463          	blt	a3,a5,e1b0 <__subdf3+0x584>
    dccc:	02000693          	li	a3,32
    dcd0:	40f686b3          	sub	a3,a3,a5
    dcd4:	00d59533          	sll	a0,a1,a3
    dcd8:	00fed633          	srl	a2,t4,a5
    dcdc:	00de96b3          	sll	a3,t4,a3
    dce0:	00c56533          	or	a0,a0,a2
    dce4:	00d036b3          	snez	a3,a3
    dce8:	00f5d7b3          	srl	a5,a1,a5
    dcec:	00d56533          	or	a0,a0,a3
    dcf0:	40f70733          	sub	a4,a4,a5
    dcf4:	40a88533          	sub	a0,a7,a0
    dcf8:	00a8b633          	sltu	a2,a7,a0
    dcfc:	00050493          	mv	s1,a0
    dd00:	40c70933          	sub	s2,a4,a2
    dd04:	00891793          	sll	a5,s2,0x8
    dd08:	3407d863          	bgez	a5,e058 <__subdf3+0x42c>
    dd0c:	008007b7          	lui	a5,0x800
    dd10:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    dd14:	00f97933          	and	s2,s2,a5
    dd18:	2e090663          	beqz	s2,e004 <__subdf3+0x3d8>
    dd1c:	00090513          	mv	a0,s2
    dd20:	7b5000ef          	jal	ecd4 <__clzsi2>
    dd24:	ff850793          	add	a5,a0,-8
    dd28:	02000693          	li	a3,32
    dd2c:	40f68733          	sub	a4,a3,a5
    dd30:	00e4d733          	srl	a4,s1,a4
    dd34:	00f91933          	sll	s2,s2,a5
    dd38:	01276733          	or	a4,a4,s2
    dd3c:	00f494b3          	sll	s1,s1,a5
    dd40:	3f37c463          	blt	a5,s3,e128 <__subdf3+0x4fc>
    dd44:	413787b3          	sub	a5,a5,s3
    dd48:	00178793          	add	a5,a5,1
    dd4c:	40f686b3          	sub	a3,a3,a5
    dd50:	00d49633          	sll	a2,s1,a3
    dd54:	00f4d933          	srl	s2,s1,a5
    dd58:	00c03633          	snez	a2,a2
    dd5c:	00c96633          	or	a2,s2,a2
    dd60:	00d716b3          	sll	a3,a4,a3
    dd64:	00c6e4b3          	or	s1,a3,a2
    dd68:	00f75933          	srl	s2,a4,a5
    dd6c:	00000993          	li	s3,0
    dd70:	0074f793          	and	a5,s1,7
    dd74:	02078063          	beqz	a5,dd94 <__subdf3+0x168>
    dd78:	00f4f793          	and	a5,s1,15
    dd7c:	00400713          	li	a4,4
    dd80:	00e78a63          	beq	a5,a4,dd94 <__subdf3+0x168>
    dd84:	00448793          	add	a5,s1,4
    dd88:	0097b533          	sltu	a0,a5,s1
    dd8c:	00a90933          	add	s2,s2,a0
    dd90:	00078493          	mv	s1,a5
    dd94:	00891793          	sll	a5,s2,0x8
    dd98:	6c07d063          	bgez	a5,e458 <__subdf3+0x82c>
    dd9c:	00198793          	add	a5,s3,1
    dda0:	7ff00713          	li	a4,2047
    dda4:	24e78663          	beq	a5,a4,dff0 <__subdf3+0x3c4>
    dda8:	ff800737          	lui	a4,0xff800
    ddac:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ddb0:	00e97733          	and	a4,s2,a4
    ddb4:	7ff7f793          	and	a5,a5,2047
    ddb8:	01d71813          	sll	a6,a4,0x1d
    ddbc:	0034d513          	srl	a0,s1,0x3
    ddc0:	00971713          	sll	a4,a4,0x9
    ddc4:	00a86833          	or	a6,a6,a0
    ddc8:	00c75713          	srl	a4,a4,0xc
    ddcc:	00147e13          	and	t3,s0,1
    ddd0:	01c12083          	lw	ra,28(sp)
    ddd4:	01812403          	lw	s0,24(sp)
    ddd8:	01479793          	sll	a5,a5,0x14
    dddc:	00e7e7b3          	or	a5,a5,a4
    dde0:	01fe1713          	sll	a4,t3,0x1f
    dde4:	00e7e7b3          	or	a5,a5,a4
    dde8:	01412483          	lw	s1,20(sp)
    ddec:	01012903          	lw	s2,16(sp)
    ddf0:	00c12983          	lw	s3,12(sp)
    ddf4:	00080513          	mv	a0,a6
    ddf8:	00078593          	mv	a1,a5
    ddfc:	02010113          	add	sp,sp,32
    de00:	00008067          	ret
    de04:	70f05263          	blez	a5,e508 <__subdf3+0x8dc>
    de08:	1c0f1663          	bnez	t5,dfd4 <__subdf3+0x3a8>
    de0c:	01d5e6b3          	or	a3,a1,t4
    de10:	26068e63          	beqz	a3,e08c <__subdf3+0x460>
    de14:	fff78693          	add	a3,a5,-1
    de18:	46068863          	beqz	a3,e288 <__subdf3+0x65c>
    de1c:	24678c63          	beq	a5,t1,e074 <__subdf3+0x448>
    de20:	03800793          	li	a5,56
    de24:	00100913          	li	s2,1
    de28:	02d7cc63          	blt	a5,a3,de60 <__subdf3+0x234>
    de2c:	00068793          	mv	a5,a3
    de30:	01f00693          	li	a3,31
    de34:	48f6ca63          	blt	a3,a5,e2c8 <__subdf3+0x69c>
    de38:	02000693          	li	a3,32
    de3c:	40f686b3          	sub	a3,a3,a5
    de40:	00d59933          	sll	s2,a1,a3
    de44:	00fed633          	srl	a2,t4,a5
    de48:	00de96b3          	sll	a3,t4,a3
    de4c:	00c96933          	or	s2,s2,a2
    de50:	00d036b3          	snez	a3,a3
    de54:	00f5d7b3          	srl	a5,a1,a5
    de58:	00d96933          	or	s2,s2,a3
    de5c:	00f70733          	add	a4,a4,a5
    de60:	01190633          	add	a2,s2,a7
    de64:	01263933          	sltu	s2,a2,s2
    de68:	00060493          	mv	s1,a2
    de6c:	00e90933          	add	s2,s2,a4
    de70:	00891793          	sll	a5,s2,0x8
    de74:	1e07d263          	bgez	a5,e058 <__subdf3+0x42c>
    de78:	00198993          	add	s3,s3,1
    de7c:	7ff00793          	li	a5,2047
    de80:	16f98863          	beq	s3,a5,dff0 <__subdf3+0x3c4>
    de84:	ff8007b7          	lui	a5,0xff800
    de88:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de8c:	0014f513          	and	a0,s1,1
    de90:	00f977b3          	and	a5,s2,a5
    de94:	0014d713          	srl	a4,s1,0x1
    de98:	00a76733          	or	a4,a4,a0
    de9c:	01f79513          	sll	a0,a5,0x1f
    dea0:	00e564b3          	or	s1,a0,a4
    dea4:	0017d913          	srl	s2,a5,0x1
    dea8:	ec9ff06f          	j	dd70 <__subdf3+0x144>
    deac:	01d5e833          	or	a6,a1,t4
    deb0:	80198313          	add	t1,s3,-2047
    deb4:	06080863          	beqz	a6,df24 <__subdf3+0x2f8>
    deb8:	06d40a63          	beq	s0,a3,df2c <__subdf3+0x300>
    debc:	0e030463          	beqz	t1,dfa4 <__subdf3+0x378>
    dec0:	26098e63          	beqz	s3,e13c <__subdf3+0x510>
    dec4:	00361513          	sll	a0,a2,0x3
    dec8:	00355513          	srl	a0,a0,0x3
    decc:	00068413          	mv	s0,a3
    ded0:	00058713          	mv	a4,a1
    ded4:	01d71813          	sll	a6,a4,0x1d
    ded8:	00a86833          	or	a6,a6,a0
    dedc:	00375713          	srl	a4,a4,0x3
    dee0:	01076733          	or	a4,a4,a6
    dee4:	10070663          	beqz	a4,dff0 <__subdf3+0x3c4>
    dee8:	00000e13          	li	t3,0
    deec:	7ff00793          	li	a5,2047
    def0:	00080737          	lui	a4,0x80
    def4:	00000813          	li	a6,0
    def8:	ed9ff06f          	j	ddd0 <__subdf3+0x1a4>
    defc:	01d5e6b3          	or	a3,a1,t4
    df00:	18068663          	beqz	a3,e08c <__subdf3+0x460>
    df04:	fff78693          	add	a3,a5,-1
    df08:	3a068263          	beqz	a3,e2ac <__subdf3+0x680>
    df0c:	16678463          	beq	a5,t1,e074 <__subdf3+0x448>
    df10:	03800793          	li	a5,56
    df14:	00100513          	li	a0,1
    df18:	dcd7cee3          	blt	a5,a3,dcf4 <__subdf3+0xc8>
    df1c:	00068793          	mv	a5,a3
    df20:	da5ff06f          	j	dcc4 <__subdf3+0x98>
    df24:	0016c693          	xor	a3,a3,1
    df28:	f8d41ae3          	bne	s0,a3,debc <__subdf3+0x290>
    df2c:	18030863          	beqz	t1,e0bc <__subdf3+0x490>
    df30:	2c099063          	bnez	s3,e1f0 <__subdf3+0x5c4>
    df34:	7ff00793          	li	a5,2047
    df38:	011766b3          	or	a3,a4,a7
    df3c:	48068863          	beqz	a3,e3cc <__subdf3+0x7a0>
    df40:	fff78693          	add	a3,a5,-1
    df44:	34068263          	beqz	a3,e288 <__subdf3+0x65c>
    df48:	7ff00513          	li	a0,2047
    df4c:	2aa78263          	beq	a5,a0,e1f0 <__subdf3+0x5c4>
    df50:	03800793          	li	a5,56
    df54:	00100913          	li	s2,1
    df58:	02d7ca63          	blt	a5,a3,df8c <__subdf3+0x360>
    df5c:	01f00793          	li	a5,31
    df60:	4cd7c663          	blt	a5,a3,e42c <__subdf3+0x800>
    df64:	02000793          	li	a5,32
    df68:	40d787b3          	sub	a5,a5,a3
    df6c:	00f71933          	sll	s2,a4,a5
    df70:	00d8d633          	srl	a2,a7,a3
    df74:	00f897b3          	sll	a5,a7,a5
    df78:	00c96933          	or	s2,s2,a2
    df7c:	00f037b3          	snez	a5,a5
    df80:	00d756b3          	srl	a3,a4,a3
    df84:	00f96933          	or	s2,s2,a5
    df88:	00d585b3          	add	a1,a1,a3
    df8c:	01d90733          	add	a4,s2,t4
    df90:	01273933          	sltu	s2,a4,s2
    df94:	00070493          	mv	s1,a4
    df98:	00b90933          	add	s2,s2,a1
    df9c:	000f0993          	mv	s3,t5
    dfa0:	ed1ff06f          	j	de70 <__subdf3+0x244>
    dfa4:	00198793          	add	a5,s3,1
    dfa8:	7fe7f793          	and	a5,a5,2046
    dfac:	14079463          	bnez	a5,e0f4 <__subdf3+0x4c8>
    dfb0:	01d5e833          	or	a6,a1,t4
    dfb4:	011767b3          	or	a5,a4,a7
    dfb8:	2a099463          	bnez	s3,e260 <__subdf3+0x634>
    dfbc:	38078e63          	beqz	a5,e358 <__subdf3+0x72c>
    dfc0:	3c081063          	bnez	a6,e380 <__subdf3+0x754>
    dfc4:	00351513          	sll	a0,a0,0x3
    dfc8:	00355913          	srl	s2,a0,0x3
    dfcc:	00000793          	li	a5,0
    dfd0:	1140006f          	j	e0e4 <__subdf3+0x4b8>
    dfd4:	0a698063          	beq	s3,t1,e074 <__subdf3+0x448>
    dfd8:	03800693          	li	a3,56
    dfdc:	00100913          	li	s2,1
    dfe0:	e8f6c0e3          	blt	a3,a5,de60 <__subdf3+0x234>
    dfe4:	008006b7          	lui	a3,0x800
    dfe8:	00d5e5b3          	or	a1,a1,a3
    dfec:	e45ff06f          	j	de30 <__subdf3+0x204>
    dff0:	00147e13          	and	t3,s0,1
    dff4:	7ff00793          	li	a5,2047
    dff8:	00000713          	li	a4,0
    dffc:	00000813          	li	a6,0
    e000:	dd1ff06f          	j	ddd0 <__subdf3+0x1a4>
    e004:	00048513          	mv	a0,s1
    e008:	4cd000ef          	jal	ecd4 <__clzsi2>
    e00c:	01850793          	add	a5,a0,24
    e010:	01f00693          	li	a3,31
    e014:	d0f6dae3          	bge	a3,a5,dd28 <__subdf3+0xfc>
    e018:	ff850713          	add	a4,a0,-8
    e01c:	00e49733          	sll	a4,s1,a4
    e020:	1b37ce63          	blt	a5,s3,e1dc <__subdf3+0x5b0>
    e024:	413789b3          	sub	s3,a5,s3
    e028:	00198793          	add	a5,s3,1
    e02c:	42f6de63          	bge	a3,a5,e468 <__subdf3+0x83c>
    e030:	fe198993          	add	s3,s3,-31
    e034:	02000693          	li	a3,32
    e038:	013754b3          	srl	s1,a4,s3
    e03c:	00d78c63          	beq	a5,a3,e054 <__subdf3+0x428>
    e040:	04000693          	li	a3,64
    e044:	40f687b3          	sub	a5,a3,a5
    e048:	00f71733          	sll	a4,a4,a5
    e04c:	00e03733          	snez	a4,a4
    e050:	00e4e4b3          	or	s1,s1,a4
    e054:	00000993          	li	s3,0
    e058:	0074f793          	and	a5,s1,7
    e05c:	d0079ee3          	bnez	a5,dd78 <__subdf3+0x14c>
    e060:	00098793          	mv	a5,s3
    e064:	0034d513          	srl	a0,s1,0x3
    e068:	00090713          	mv	a4,s2
    e06c:	0280006f          	j	e094 <__subdf3+0x468>
    e070:	e6081ce3          	bnez	a6,dee8 <__subdf3+0x2bc>
    e074:	00351513          	sll	a0,a0,0x3
    e078:	01d71813          	sll	a6,a4,0x1d
    e07c:	00355513          	srl	a0,a0,0x3
    e080:	00a86833          	or	a6,a6,a0
    e084:	00375713          	srl	a4,a4,0x3
    e088:	e59ff06f          	j	dee0 <__subdf3+0x2b4>
    e08c:	00351513          	sll	a0,a0,0x3
    e090:	00355513          	srl	a0,a0,0x3
    e094:	01d71813          	sll	a6,a4,0x1d
    e098:	7ff00693          	li	a3,2047
    e09c:	00a86833          	or	a6,a6,a0
    e0a0:	00375713          	srl	a4,a4,0x3
    e0a4:	e2d78ee3          	beq	a5,a3,dee0 <__subdf3+0x2b4>
    e0a8:	00c71713          	sll	a4,a4,0xc
    e0ac:	00c75713          	srl	a4,a4,0xc
    e0b0:	7ff7f793          	and	a5,a5,2047
    e0b4:	00147e13          	and	t3,s0,1
    e0b8:	d19ff06f          	j	ddd0 <__subdf3+0x1a4>
    e0bc:	00198693          	add	a3,s3,1
    e0c0:	7fe6f793          	and	a5,a3,2046
    e0c4:	12079e63          	bnez	a5,e200 <__subdf3+0x5d4>
    e0c8:	011767b3          	or	a5,a4,a7
    e0cc:	24099a63          	bnez	s3,e320 <__subdf3+0x6f4>
    e0d0:	30078663          	beqz	a5,e3dc <__subdf3+0x7b0>
    e0d4:	01d5e7b3          	or	a5,a1,t4
    e0d8:	30079a63          	bnez	a5,e3ec <__subdf3+0x7c0>
    e0dc:	00351513          	sll	a0,a0,0x3
    e0e0:	00355913          	srl	s2,a0,0x3
    e0e4:	01d71813          	sll	a6,a4,0x1d
    e0e8:	01286833          	or	a6,a6,s2
    e0ec:	00375713          	srl	a4,a4,0x3
    e0f0:	fb9ff06f          	j	e0a8 <__subdf3+0x47c>
    e0f4:	41d88833          	sub	a6,a7,t4
    e0f8:	0108b7b3          	sltu	a5,a7,a6
    e0fc:	40b70933          	sub	s2,a4,a1
    e100:	40f90933          	sub	s2,s2,a5
    e104:	00891793          	sll	a5,s2,0x8
    e108:	00080493          	mv	s1,a6
    e10c:	1207c263          	bltz	a5,e230 <__subdf3+0x604>
    e110:	01286833          	or	a6,a6,s2
    e114:	c00812e3          	bnez	a6,dd18 <__subdf3+0xec>
    e118:	00000e13          	li	t3,0
    e11c:	00000793          	li	a5,0
    e120:	00000713          	li	a4,0
    e124:	cadff06f          	j	ddd0 <__subdf3+0x1a4>
    e128:	ff800937          	lui	s2,0xff800
    e12c:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e130:	40f989b3          	sub	s3,s3,a5
    e134:	01277933          	and	s2,a4,s2
    e138:	c39ff06f          	j	dd70 <__subdf3+0x144>
    e13c:	7ff00793          	li	a5,2047
    e140:	01176533          	or	a0,a4,a7
    e144:	10050463          	beqz	a0,e24c <__subdf3+0x620>
    e148:	fff78813          	add	a6,a5,-1
    e14c:	1e080263          	beqz	a6,e330 <__subdf3+0x704>
    e150:	7ff00513          	li	a0,2047
    e154:	d6a788e3          	beq	a5,a0,dec4 <__subdf3+0x298>
    e158:	03800793          	li	a5,56
    e15c:	00068413          	mv	s0,a3
    e160:	00100513          	li	a0,1
    e164:	0307ca63          	blt	a5,a6,e198 <__subdf3+0x56c>
    e168:	01f00793          	li	a5,31
    e16c:	1907c463          	blt	a5,a6,e2f4 <__subdf3+0x6c8>
    e170:	02000793          	li	a5,32
    e174:	410787b3          	sub	a5,a5,a6
    e178:	00f71533          	sll	a0,a4,a5
    e17c:	0108d6b3          	srl	a3,a7,a6
    e180:	00f897b3          	sll	a5,a7,a5
    e184:	00d56533          	or	a0,a0,a3
    e188:	00f037b3          	snez	a5,a5
    e18c:	01075833          	srl	a6,a4,a6
    e190:	00f56533          	or	a0,a0,a5
    e194:	410585b3          	sub	a1,a1,a6
    e198:	40ae8533          	sub	a0,t4,a0
    e19c:	00aeb733          	sltu	a4,t4,a0
    e1a0:	00050493          	mv	s1,a0
    e1a4:	40e58933          	sub	s2,a1,a4
    e1a8:	000f0993          	mv	s3,t5
    e1ac:	b59ff06f          	j	dd04 <__subdf3+0xd8>
    e1b0:	fe078693          	add	a3,a5,-32
    e1b4:	02000613          	li	a2,32
    e1b8:	00d5d6b3          	srl	a3,a1,a3
    e1bc:	00c78a63          	beq	a5,a2,e1d0 <__subdf3+0x5a4>
    e1c0:	04000613          	li	a2,64
    e1c4:	40f607b3          	sub	a5,a2,a5
    e1c8:	00f597b3          	sll	a5,a1,a5
    e1cc:	00feeeb3          	or	t4,t4,a5
    e1d0:	01d03533          	snez	a0,t4
    e1d4:	00d56533          	or	a0,a0,a3
    e1d8:	b1dff06f          	j	dcf4 <__subdf3+0xc8>
    e1dc:	ff8006b7          	lui	a3,0xff800
    e1e0:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1e4:	40f987b3          	sub	a5,s3,a5
    e1e8:	00d77733          	and	a4,a4,a3
    e1ec:	ef9ff06f          	j	e0e4 <__subdf3+0x4b8>
    e1f0:	00361513          	sll	a0,a2,0x3
    e1f4:	00355513          	srl	a0,a0,0x3
    e1f8:	00058713          	mv	a4,a1
    e1fc:	cd9ff06f          	j	ded4 <__subdf3+0x2a8>
    e200:	7ff00793          	li	a5,2047
    e204:	def686e3          	beq	a3,a5,dff0 <__subdf3+0x3c4>
    e208:	01d88eb3          	add	t4,a7,t4
    e20c:	011eb633          	sltu	a2,t4,a7
    e210:	00b707b3          	add	a5,a4,a1
    e214:	00c787b3          	add	a5,a5,a2
    e218:	01f79513          	sll	a0,a5,0x1f
    e21c:	001ede93          	srl	t4,t4,0x1
    e220:	01d564b3          	or	s1,a0,t4
    e224:	0017d913          	srl	s2,a5,0x1
    e228:	00068993          	mv	s3,a3
    e22c:	b45ff06f          	j	dd70 <__subdf3+0x144>
    e230:	411e8633          	sub	a2,t4,a7
    e234:	40e587b3          	sub	a5,a1,a4
    e238:	00ceb733          	sltu	a4,t4,a2
    e23c:	00060493          	mv	s1,a2
    e240:	40e78933          	sub	s2,a5,a4
    e244:	00068413          	mv	s0,a3
    e248:	ad1ff06f          	j	dd18 <__subdf3+0xec>
    e24c:	00361613          	sll	a2,a2,0x3
    e250:	00365513          	srl	a0,a2,0x3
    e254:	00068413          	mv	s0,a3
    e258:	00058713          	mv	a4,a1
    e25c:	e39ff06f          	j	e094 <__subdf3+0x468>
    e260:	e00798e3          	bnez	a5,e070 <__subdf3+0x444>
    e264:	22080663          	beqz	a6,e490 <__subdf3+0x864>
    e268:	0035d713          	srl	a4,a1,0x3
    e26c:	00361613          	sll	a2,a2,0x3
    e270:	01d59593          	sll	a1,a1,0x1d
    e274:	00b76733          	or	a4,a4,a1
    e278:	00365613          	srl	a2,a2,0x3
    e27c:	00c76733          	or	a4,a4,a2
    e280:	00068413          	mv	s0,a3
    e284:	c61ff06f          	j	dee4 <__subdf3+0x2b8>
    e288:	01d88eb3          	add	t4,a7,t4
    e28c:	00b705b3          	add	a1,a4,a1
    e290:	011eb633          	sltu	a2,t4,a7
    e294:	00c58933          	add	s2,a1,a2
    e298:	00891793          	sll	a5,s2,0x8
    e29c:	000e8493          	mv	s1,t4
    e2a0:	0a07d863          	bgez	a5,e350 <__subdf3+0x724>
    e2a4:	00200993          	li	s3,2
    e2a8:	bddff06f          	j	de84 <__subdf3+0x258>
    e2ac:	41d88eb3          	sub	t4,a7,t4
    e2b0:	40b705b3          	sub	a1,a4,a1
    e2b4:	01d8b633          	sltu	a2,a7,t4
    e2b8:	000e8493          	mv	s1,t4
    e2bc:	40c58933          	sub	s2,a1,a2
    e2c0:	00100993          	li	s3,1
    e2c4:	a41ff06f          	j	dd04 <__subdf3+0xd8>
    e2c8:	fe078693          	add	a3,a5,-32
    e2cc:	02000613          	li	a2,32
    e2d0:	00d5d6b3          	srl	a3,a1,a3
    e2d4:	00c78a63          	beq	a5,a2,e2e8 <__subdf3+0x6bc>
    e2d8:	04000613          	li	a2,64
    e2dc:	40f607b3          	sub	a5,a2,a5
    e2e0:	00f597b3          	sll	a5,a1,a5
    e2e4:	00feeeb3          	or	t4,t4,a5
    e2e8:	01d03933          	snez	s2,t4
    e2ec:	00d96933          	or	s2,s2,a3
    e2f0:	b71ff06f          	j	de60 <__subdf3+0x234>
    e2f4:	fe080793          	add	a5,a6,-32
    e2f8:	02000693          	li	a3,32
    e2fc:	00f757b3          	srl	a5,a4,a5
    e300:	00d80a63          	beq	a6,a3,e314 <__subdf3+0x6e8>
    e304:	04000693          	li	a3,64
    e308:	410686b3          	sub	a3,a3,a6
    e30c:	00d71733          	sll	a4,a4,a3
    e310:	00e8e8b3          	or	a7,a7,a4
    e314:	01103533          	snez	a0,a7
    e318:	00f56533          	or	a0,a0,a5
    e31c:	e7dff06f          	j	e198 <__subdf3+0x56c>
    e320:	ec0788e3          	beqz	a5,e1f0 <__subdf3+0x5c4>
    e324:	01d5eeb3          	or	t4,a1,t4
    e328:	bc0e90e3          	bnez	t4,dee8 <__subdf3+0x2bc>
    e32c:	d49ff06f          	j	e074 <__subdf3+0x448>
    e330:	411e8633          	sub	a2,t4,a7
    e334:	40e585b3          	sub	a1,a1,a4
    e338:	00ceb733          	sltu	a4,t4,a2
    e33c:	00060493          	mv	s1,a2
    e340:	40e58933          	sub	s2,a1,a4
    e344:	00068413          	mv	s0,a3
    e348:	00100993          	li	s3,1
    e34c:	9b9ff06f          	j	dd04 <__subdf3+0xd8>
    e350:	00100793          	li	a5,1
    e354:	d11ff06f          	j	e064 <__subdf3+0x438>
    e358:	dc0800e3          	beqz	a6,e118 <__subdf3+0x4ec>
    e35c:	00361613          	sll	a2,a2,0x3
    e360:	00365793          	srl	a5,a2,0x3
    e364:	01d59813          	sll	a6,a1,0x1d
    e368:	00959713          	sll	a4,a1,0x9
    e36c:	00f86833          	or	a6,a6,a5
    e370:	00c75713          	srl	a4,a4,0xc
    e374:	00068e13          	mv	t3,a3
    e378:	00000793          	li	a5,0
    e37c:	a55ff06f          	j	ddd0 <__subdf3+0x1a4>
    e380:	41d88933          	sub	s2,a7,t4
    e384:	0128b7b3          	sltu	a5,a7,s2
    e388:	40b70633          	sub	a2,a4,a1
    e38c:	40f60633          	sub	a2,a2,a5
    e390:	00861793          	sll	a5,a2,0x8
    e394:	0e07d263          	bgez	a5,e478 <__subdf3+0x84c>
    e398:	411e8633          	sub	a2,t4,a7
    e39c:	40e58733          	sub	a4,a1,a4
    e3a0:	00cebeb3          	sltu	t4,t4,a2
    e3a4:	41d70733          	sub	a4,a4,t4
    e3a8:	00871793          	sll	a5,a4,0x8
    e3ac:	00060493          	mv	s1,a2
    e3b0:	1207de63          	bgez	a5,e4ec <__subdf3+0x8c0>
    e3b4:	ff8007b7          	lui	a5,0xff800
    e3b8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3bc:	00f77733          	and	a4,a4,a5
    e3c0:	00068413          	mv	s0,a3
    e3c4:	00100793          	li	a5,1
    e3c8:	9f1ff06f          	j	ddb8 <__subdf3+0x18c>
    e3cc:	00361613          	sll	a2,a2,0x3
    e3d0:	00365513          	srl	a0,a2,0x3
    e3d4:	00058713          	mv	a4,a1
    e3d8:	cbdff06f          	j	e094 <__subdf3+0x468>
    e3dc:	00361613          	sll	a2,a2,0x3
    e3e0:	00365913          	srl	s2,a2,0x3
    e3e4:	00058713          	mv	a4,a1
    e3e8:	cfdff06f          	j	e0e4 <__subdf3+0x4b8>
    e3ec:	01d886b3          	add	a3,a7,t4
    e3f0:	00b707b3          	add	a5,a4,a1
    e3f4:	0116b633          	sltu	a2,a3,a7
    e3f8:	00c787b3          	add	a5,a5,a2
    e3fc:	00879713          	sll	a4,a5,0x8
    e400:	0036d813          	srl	a6,a3,0x3
    e404:	08075e63          	bgez	a4,e4a0 <__subdf3+0x874>
    e408:	ff800737          	lui	a4,0xff800
    e40c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e410:	00e7f7b3          	and	a5,a5,a4
    e414:	01d79713          	sll	a4,a5,0x1d
    e418:	00979793          	sll	a5,a5,0x9
    e41c:	01076833          	or	a6,a4,a6
    e420:	00c7d713          	srl	a4,a5,0xc
    e424:	00100793          	li	a5,1
    e428:	9a9ff06f          	j	ddd0 <__subdf3+0x1a4>
    e42c:	fe068793          	add	a5,a3,-32
    e430:	02000613          	li	a2,32
    e434:	00f757b3          	srl	a5,a4,a5
    e438:	00c68a63          	beq	a3,a2,e44c <__subdf3+0x820>
    e43c:	04000613          	li	a2,64
    e440:	40d606b3          	sub	a3,a2,a3
    e444:	00d71733          	sll	a4,a4,a3
    e448:	00e8e8b3          	or	a7,a7,a4
    e44c:	01103933          	snez	s2,a7
    e450:	00f96933          	or	s2,s2,a5
    e454:	b39ff06f          	j	df8c <__subdf3+0x360>
    e458:	0034d513          	srl	a0,s1,0x3
    e45c:	00098793          	mv	a5,s3
    e460:	00090713          	mv	a4,s2
    e464:	c31ff06f          	j	e094 <__subdf3+0x468>
    e468:	02000693          	li	a3,32
    e46c:	40f686b3          	sub	a3,a3,a5
    e470:	00000613          	li	a2,0
    e474:	8e9ff06f          	j	dd5c <__subdf3+0x130>
    e478:	00c96833          	or	a6,s2,a2
    e47c:	c8080ee3          	beqz	a6,e118 <__subdf3+0x4ec>
    e480:	00395913          	srl	s2,s2,0x3
    e484:	00000793          	li	a5,0
    e488:	00060713          	mv	a4,a2
    e48c:	c59ff06f          	j	e0e4 <__subdf3+0x4b8>
    e490:	00000e13          	li	t3,0
    e494:	7ff00793          	li	a5,2047
    e498:	00080737          	lui	a4,0x80
    e49c:	935ff06f          	j	ddd0 <__subdf3+0x1a4>
    e4a0:	01d79713          	sll	a4,a5,0x1d
    e4a4:	00979793          	sll	a5,a5,0x9
    e4a8:	01076833          	or	a6,a4,a6
    e4ac:	00c7d713          	srl	a4,a5,0xc
    e4b0:	00000793          	li	a5,0
    e4b4:	91dff06f          	j	ddd0 <__subdf3+0x1a4>
    e4b8:	ae0786e3          	beqz	a5,dfa4 <__subdf3+0x378>
    e4bc:	413f0833          	sub	a6,t5,s3
    e4c0:	00080793          	mv	a5,a6
    e4c4:	c6098ee3          	beqz	s3,e140 <__subdf3+0x514>
    e4c8:	03800793          	li	a5,56
    e4cc:	0107ca63          	blt	a5,a6,e4e0 <__subdf3+0x8b4>
    e4d0:	008007b7          	lui	a5,0x800
    e4d4:	00f76733          	or	a4,a4,a5
    e4d8:	00068413          	mv	s0,a3
    e4dc:	c8dff06f          	j	e168 <__subdf3+0x53c>
    e4e0:	00068413          	mv	s0,a3
    e4e4:	00100513          	li	a0,1
    e4e8:	cb1ff06f          	j	e198 <__subdf3+0x56c>
    e4ec:	01d71813          	sll	a6,a4,0x1d
    e4f0:	00365613          	srl	a2,a2,0x3
    e4f4:	00c86833          	or	a6,a6,a2
    e4f8:	00375713          	srl	a4,a4,0x3
    e4fc:	00000793          	li	a5,0
    e500:	00068413          	mv	s0,a3
    e504:	ba5ff06f          	j	e0a8 <__subdf3+0x47c>
    e508:	ba078ae3          	beqz	a5,e0bc <__subdf3+0x490>
    e50c:	413f06b3          	sub	a3,t5,s3
    e510:	00099663          	bnez	s3,e51c <__subdf3+0x8f0>
    e514:	00068793          	mv	a5,a3
    e518:	a21ff06f          	j	df38 <__subdf3+0x30c>
    e51c:	03800793          	li	a5,56
    e520:	00100913          	li	s2,1
    e524:	a6d7c4e3          	blt	a5,a3,df8c <__subdf3+0x360>
    e528:	008007b7          	lui	a5,0x800
    e52c:	00f76733          	or	a4,a4,a5
    e530:	a2dff06f          	j	df5c <__subdf3+0x330>

0000e534 <__unorddf2>:
    e534:	0145d713          	srl	a4,a1,0x14
    e538:	001007b7          	lui	a5,0x100
    e53c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e540:	fff74713          	not	a4,a4
    e544:	0146d813          	srl	a6,a3,0x14
    e548:	00b7f5b3          	and	a1,a5,a1
    e54c:	00d7f7b3          	and	a5,a5,a3
    e550:	01571693          	sll	a3,a4,0x15
    e554:	7ff87813          	and	a6,a6,2047
    e558:	02068063          	beqz	a3,e578 <__unorddf2+0x44>
    e55c:	7ff00713          	li	a4,2047
    e560:	00000513          	li	a0,0
    e564:	00e80463          	beq	a6,a4,e56c <__unorddf2+0x38>
    e568:	00008067          	ret
    e56c:	00c7e7b3          	or	a5,a5,a2
    e570:	00f03533          	snez	a0,a5
    e574:	00008067          	ret
    e578:	00a5e5b3          	or	a1,a1,a0
    e57c:	00100513          	li	a0,1
    e580:	fc058ee3          	beqz	a1,e55c <__unorddf2+0x28>
    e584:	00008067          	ret

0000e588 <__fixdfsi>:
    e588:	0145d793          	srl	a5,a1,0x14
    e58c:	001006b7          	lui	a3,0x100
    e590:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e594:	7ff7f793          	and	a5,a5,2047
    e598:	3fe00613          	li	a2,1022
    e59c:	00b77733          	and	a4,a4,a1
    e5a0:	01f5d593          	srl	a1,a1,0x1f
    e5a4:	00f65e63          	bge	a2,a5,e5c0 <__fixdfsi+0x38>
    e5a8:	41d00613          	li	a2,1053
    e5ac:	00f65e63          	bge	a2,a5,e5c8 <__fixdfsi+0x40>
    e5b0:	80000537          	lui	a0,0x80000
    e5b4:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e5b8:	00a58533          	add	a0,a1,a0
    e5bc:	00008067          	ret
    e5c0:	00000513          	li	a0,0
    e5c4:	00008067          	ret
    e5c8:	43300613          	li	a2,1075
    e5cc:	40f60633          	sub	a2,a2,a5
    e5d0:	01f00813          	li	a6,31
    e5d4:	00d76733          	or	a4,a4,a3
    e5d8:	02c85063          	bge	a6,a2,e5f8 <__fixdfsi+0x70>
    e5dc:	41300693          	li	a3,1043
    e5e0:	40f687b3          	sub	a5,a3,a5
    e5e4:	00f75733          	srl	a4,a4,a5
    e5e8:	40e00533          	neg	a0,a4
    e5ec:	fc059ce3          	bnez	a1,e5c4 <__fixdfsi+0x3c>
    e5f0:	00070513          	mv	a0,a4
    e5f4:	00008067          	ret
    e5f8:	bed78793          	add	a5,a5,-1043
    e5fc:	00f71733          	sll	a4,a4,a5
    e600:	00c55533          	srl	a0,a0,a2
    e604:	00a76733          	or	a4,a4,a0
    e608:	fe1ff06f          	j	e5e8 <__fixdfsi+0x60>

0000e60c <__floatsidf>:
    e60c:	ff010113          	add	sp,sp,-16
    e610:	00112623          	sw	ra,12(sp)
    e614:	00812423          	sw	s0,8(sp)
    e618:	00912223          	sw	s1,4(sp)
    e61c:	04050a63          	beqz	a0,e670 <__floatsidf+0x64>
    e620:	41f55713          	sra	a4,a0,0x1f
    e624:	00a744b3          	xor	s1,a4,a0
    e628:	40e484b3          	sub	s1,s1,a4
    e62c:	00050793          	mv	a5,a0
    e630:	00048513          	mv	a0,s1
    e634:	01f7d413          	srl	s0,a5,0x1f
    e638:	69c000ef          	jal	ecd4 <__clzsi2>
    e63c:	41e00793          	li	a5,1054
    e640:	40a787b3          	sub	a5,a5,a0
    e644:	00a00713          	li	a4,10
    e648:	7ff7f793          	and	a5,a5,2047
    e64c:	06a74063          	blt	a4,a0,e6ac <__floatsidf+0xa0>
    e650:	00b00713          	li	a4,11
    e654:	40a70733          	sub	a4,a4,a0
    e658:	00e4d733          	srl	a4,s1,a4
    e65c:	01550513          	add	a0,a0,21
    e660:	00c71713          	sll	a4,a4,0xc
    e664:	00a494b3          	sll	s1,s1,a0
    e668:	00c75713          	srl	a4,a4,0xc
    e66c:	0140006f          	j	e680 <__floatsidf+0x74>
    e670:	00000413          	li	s0,0
    e674:	00000793          	li	a5,0
    e678:	00000713          	li	a4,0
    e67c:	00000493          	li	s1,0
    e680:	01479793          	sll	a5,a5,0x14
    e684:	01f41413          	sll	s0,s0,0x1f
    e688:	00e7e7b3          	or	a5,a5,a4
    e68c:	00c12083          	lw	ra,12(sp)
    e690:	0087e7b3          	or	a5,a5,s0
    e694:	00812403          	lw	s0,8(sp)
    e698:	00048513          	mv	a0,s1
    e69c:	00078593          	mv	a1,a5
    e6a0:	00412483          	lw	s1,4(sp)
    e6a4:	01010113          	add	sp,sp,16
    e6a8:	00008067          	ret
    e6ac:	ff550513          	add	a0,a0,-11
    e6b0:	00a49733          	sll	a4,s1,a0
    e6b4:	00c71713          	sll	a4,a4,0xc
    e6b8:	00c75713          	srl	a4,a4,0xc
    e6bc:	00000493          	li	s1,0
    e6c0:	fc1ff06f          	j	e680 <__floatsidf+0x74>

0000e6c4 <__floatunsidf>:
    e6c4:	ff010113          	add	sp,sp,-16
    e6c8:	00812423          	sw	s0,8(sp)
    e6cc:	00112623          	sw	ra,12(sp)
    e6d0:	00050413          	mv	s0,a0
    e6d4:	04050c63          	beqz	a0,e72c <__floatunsidf+0x68>
    e6d8:	5fc000ef          	jal	ecd4 <__clzsi2>
    e6dc:	41e00793          	li	a5,1054
    e6e0:	40a787b3          	sub	a5,a5,a0
    e6e4:	00a00713          	li	a4,10
    e6e8:	7ff7f793          	and	a5,a5,2047
    e6ec:	06a74463          	blt	a4,a0,e754 <__floatunsidf+0x90>
    e6f0:	00b00713          	li	a4,11
    e6f4:	40a70733          	sub	a4,a4,a0
    e6f8:	01550513          	add	a0,a0,21
    e6fc:	00e45733          	srl	a4,s0,a4
    e700:	00a41433          	sll	s0,s0,a0
    e704:	00c12083          	lw	ra,12(sp)
    e708:	00040513          	mv	a0,s0
    e70c:	00c71713          	sll	a4,a4,0xc
    e710:	00812403          	lw	s0,8(sp)
    e714:	00c75713          	srl	a4,a4,0xc
    e718:	01479793          	sll	a5,a5,0x14
    e71c:	00e7e7b3          	or	a5,a5,a4
    e720:	00078593          	mv	a1,a5
    e724:	01010113          	add	sp,sp,16
    e728:	00008067          	ret
    e72c:	00c12083          	lw	ra,12(sp)
    e730:	00040513          	mv	a0,s0
    e734:	00000793          	li	a5,0
    e738:	00812403          	lw	s0,8(sp)
    e73c:	00000713          	li	a4,0
    e740:	01479793          	sll	a5,a5,0x14
    e744:	00e7e7b3          	or	a5,a5,a4
    e748:	00078593          	mv	a1,a5
    e74c:	01010113          	add	sp,sp,16
    e750:	00008067          	ret
    e754:	ff550513          	add	a0,a0,-11
    e758:	00a41733          	sll	a4,s0,a0
    e75c:	00000413          	li	s0,0
    e760:	00c12083          	lw	ra,12(sp)
    e764:	00040513          	mv	a0,s0
    e768:	00c71713          	sll	a4,a4,0xc
    e76c:	00812403          	lw	s0,8(sp)
    e770:	00c75713          	srl	a4,a4,0xc
    e774:	01479793          	sll	a5,a5,0x14
    e778:	00e7e7b3          	or	a5,a5,a4
    e77c:	00078593          	mv	a1,a5
    e780:	01010113          	add	sp,sp,16
    e784:	00008067          	ret

0000e788 <__trunctfdf2>:
    e788:	00c52583          	lw	a1,12(a0)
    e78c:	00852783          	lw	a5,8(a0)
    e790:	00052803          	lw	a6,0(a0)
    e794:	00452683          	lw	a3,4(a0)
    e798:	01059613          	sll	a2,a1,0x10
    e79c:	fe010113          	add	sp,sp,-32
    e7a0:	00159713          	sll	a4,a1,0x1
    e7a4:	01065613          	srl	a2,a2,0x10
    e7a8:	00f12423          	sw	a5,8(sp)
    e7ac:	00b12623          	sw	a1,12(sp)
    e7b0:	00f12c23          	sw	a5,24(sp)
    e7b4:	01012023          	sw	a6,0(sp)
    e7b8:	00d12223          	sw	a3,4(sp)
    e7bc:	01012823          	sw	a6,16(sp)
    e7c0:	00d12a23          	sw	a3,20(sp)
    e7c4:	00c12e23          	sw	a2,28(sp)
    e7c8:	01175713          	srl	a4,a4,0x11
    e7cc:	01f5d593          	srl	a1,a1,0x1f
    e7d0:	01010893          	add	a7,sp,16
    e7d4:	01c10793          	add	a5,sp,28
    e7d8:	00361513          	sll	a0,a2,0x3
    e7dc:	ffc7a603          	lw	a2,-4(a5)
    e7e0:	ffc78793          	add	a5,a5,-4
    e7e4:	01d65693          	srl	a3,a2,0x1d
    e7e8:	00a6e6b3          	or	a3,a3,a0
    e7ec:	00d7a223          	sw	a3,4(a5)
    e7f0:	fef894e3          	bne	a7,a5,e7d8 <__trunctfdf2+0x50>
    e7f4:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e7f8:	00381813          	sll	a6,a6,0x3
    e7fc:	01169613          	sll	a2,a3,0x11
    e800:	01012823          	sw	a6,16(sp)
    e804:	01265613          	srl	a2,a2,0x12
    e808:	04060263          	beqz	a2,e84c <__trunctfdf2+0xc4>
    e80c:	ffffc6b7          	lui	a3,0xffffc
    e810:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e814:	00d70733          	add	a4,a4,a3
    e818:	7fe00693          	li	a3,2046
    e81c:	10e6d463          	bge	a3,a4,e924 <__trunctfdf2+0x19c>
    e820:	7ff00793          	li	a5,2047
    e824:	00000613          	li	a2,0
    e828:	00000693          	li	a3,0
    e82c:	01479793          	sll	a5,a5,0x14
    e830:	01f59593          	sll	a1,a1,0x1f
    e834:	00c7e7b3          	or	a5,a5,a2
    e838:	00b7e7b3          	or	a5,a5,a1
    e83c:	00068513          	mv	a0,a3
    e840:	00078593          	mv	a1,a5
    e844:	02010113          	add	sp,sp,32
    e848:	00008067          	ret
    e84c:	01412603          	lw	a2,20(sp)
    e850:	01812883          	lw	a7,24(sp)
    e854:	01c12503          	lw	a0,28(sp)
    e858:	011666b3          	or	a3,a2,a7
    e85c:	00a6e6b3          	or	a3,a3,a0
    e860:	0106e6b3          	or	a3,a3,a6
    e864:	04071463          	bnez	a4,e8ac <__trunctfdf2+0x124>
    e868:	14068263          	beqz	a3,e9ac <__trunctfdf2+0x224>
    e86c:	00500693          	li	a3,5
    e870:	00000613          	li	a2,0
    e874:	0036d793          	srl	a5,a3,0x3
    e878:	01d61693          	sll	a3,a2,0x1d
    e87c:	00f6e6b3          	or	a3,a3,a5
    e880:	00961613          	sll	a2,a2,0x9
    e884:	7ff77793          	and	a5,a4,2047
    e888:	00c65613          	srl	a2,a2,0xc
    e88c:	01479793          	sll	a5,a5,0x14
    e890:	01f59593          	sll	a1,a1,0x1f
    e894:	00c7e7b3          	or	a5,a5,a2
    e898:	00b7e7b3          	or	a5,a5,a1
    e89c:	00068513          	mv	a0,a3
    e8a0:	00078593          	mv	a1,a5
    e8a4:	02010113          	add	sp,sp,32
    e8a8:	00008067          	ret
    e8ac:	12068463          	beqz	a3,e9d4 <__trunctfdf2+0x24c>
    e8b0:	01c8d793          	srl	a5,a7,0x1c
    e8b4:	00451513          	sll	a0,a0,0x4
    e8b8:	00a7e7b3          	or	a5,a5,a0
    e8bc:	008006b7          	lui	a3,0x800
    e8c0:	00d7f6b3          	and	a3,a5,a3
    e8c4:	1c068263          	beqz	a3,ea88 <__trunctfdf2+0x300>
    e8c8:	ff800737          	lui	a4,0xff800
    e8cc:	01c65693          	srl	a3,a2,0x1c
    e8d0:	00489893          	sll	a7,a7,0x4
    e8d4:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e8d8:	00e7f633          	and	a2,a5,a4
    e8dc:	0116e6b3          	or	a3,a3,a7
    e8e0:	004007b7          	lui	a5,0x400
    e8e4:	00f66633          	or	a2,a2,a5
    e8e8:	ff86f693          	and	a3,a3,-8
    e8ec:	00000793          	li	a5,0
    e8f0:	0036d713          	srl	a4,a3,0x3
    e8f4:	01d61693          	sll	a3,a2,0x1d
    e8f8:	00961613          	sll	a2,a2,0x9
    e8fc:	00c65613          	srl	a2,a2,0xc
    e900:	01479793          	sll	a5,a5,0x14
    e904:	01f59593          	sll	a1,a1,0x1f
    e908:	00c7e7b3          	or	a5,a5,a2
    e90c:	00e6e6b3          	or	a3,a3,a4
    e910:	00b7e7b3          	or	a5,a5,a1
    e914:	00068513          	mv	a0,a3
    e918:	00078593          	mv	a1,a5
    e91c:	02010113          	add	sp,sp,32
    e920:	00008067          	ret
    e924:	0ce05c63          	blez	a4,e9fc <__trunctfdf2+0x274>
    e928:	01412783          	lw	a5,20(sp)
    e92c:	01812503          	lw	a0,24(sp)
    e930:	01c12603          	lw	a2,28(sp)
    e934:	00479693          	sll	a3,a5,0x4
    e938:	0106e6b3          	or	a3,a3,a6
    e93c:	01c7d793          	srl	a5,a5,0x1c
    e940:	00451813          	sll	a6,a0,0x4
    e944:	00461613          	sll	a2,a2,0x4
    e948:	01c55513          	srl	a0,a0,0x1c
    e94c:	00d036b3          	snez	a3,a3
    e950:	0107e7b3          	or	a5,a5,a6
    e954:	00a66633          	or	a2,a2,a0
    e958:	00f6e6b3          	or	a3,a3,a5
    e95c:	0076f793          	and	a5,a3,7
    e960:	02078063          	beqz	a5,e980 <__trunctfdf2+0x1f8>
    e964:	00f6f793          	and	a5,a3,15
    e968:	00400513          	li	a0,4
    e96c:	00a78a63          	beq	a5,a0,e980 <__trunctfdf2+0x1f8>
    e970:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e974:	00d7b6b3          	sltu	a3,a5,a3
    e978:	00d60633          	add	a2,a2,a3
    e97c:	00078693          	mv	a3,a5
    e980:	008007b7          	lui	a5,0x800
    e984:	00f677b3          	and	a5,a2,a5
    e988:	ee0786e3          	beqz	a5,e874 <__trunctfdf2+0xec>
    e98c:	00170713          	add	a4,a4,1
    e990:	7ff00793          	li	a5,2047
    e994:	e8f706e3          	beq	a4,a5,e820 <__trunctfdf2+0x98>
    e998:	ff8007b7          	lui	a5,0xff800
    e99c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e9a0:	00f67633          	and	a2,a2,a5
    e9a4:	7ff77793          	and	a5,a4,2047
    e9a8:	f49ff06f          	j	e8f0 <__trunctfdf2+0x168>
    e9ac:	00000793          	li	a5,0
    e9b0:	00000613          	li	a2,0
    e9b4:	01479793          	sll	a5,a5,0x14
    e9b8:	01f59593          	sll	a1,a1,0x1f
    e9bc:	00c7e7b3          	or	a5,a5,a2
    e9c0:	00b7e7b3          	or	a5,a5,a1
    e9c4:	00068513          	mv	a0,a3
    e9c8:	00078593          	mv	a1,a5
    e9cc:	02010113          	add	sp,sp,32
    e9d0:	00008067          	ret
    e9d4:	7ff00793          	li	a5,2047
    e9d8:	00000613          	li	a2,0
    e9dc:	01479793          	sll	a5,a5,0x14
    e9e0:	01f59593          	sll	a1,a1,0x1f
    e9e4:	00c7e7b3          	or	a5,a5,a2
    e9e8:	00b7e7b3          	or	a5,a5,a1
    e9ec:	00068513          	mv	a0,a3
    e9f0:	00078593          	mv	a1,a5
    e9f4:	02010113          	add	sp,sp,32
    e9f8:	00008067          	ret
    e9fc:	fcc00693          	li	a3,-52
    ea00:	08d74c63          	blt	a4,a3,ea98 <__trunctfdf2+0x310>
    ea04:	03d00693          	li	a3,61
    ea08:	40e686b3          	sub	a3,a3,a4
    ea0c:	01c12703          	lw	a4,28(sp)
    ea10:	4056de13          	sra	t3,a3,0x5
    ea14:	00080eb7          	lui	t4,0x80
    ea18:	00eeeeb3          	or	t4,t4,a4
    ea1c:	002e1513          	sll	a0,t3,0x2
    ea20:	01d12e23          	sw	t4,28(sp)
    ea24:	01f6f693          	and	a3,a3,31
    ea28:	00a88833          	add	a6,a7,a0
    ea2c:	00088613          	mv	a2,a7
    ea30:	00000713          	li	a4,0
    ea34:	00062303          	lw	t1,0(a2)
    ea38:	00460613          	add	a2,a2,4
    ea3c:	00676733          	or	a4,a4,t1
    ea40:	fec81ae3          	bne	a6,a2,ea34 <__trunctfdf2+0x2ac>
    ea44:	00300613          	li	a2,3
    ea48:	41c60633          	sub	a2,a2,t3
    ea4c:	04069a63          	bnez	a3,eaa0 <__trunctfdf2+0x318>
    ea50:	00082803          	lw	a6,0(a6)
    ea54:	00168693          	add	a3,a3,1
    ea58:	00478793          	add	a5,a5,4
    ea5c:	ff07ae23          	sw	a6,-4(a5)
    ea60:	00d64e63          	blt	a2,a3,ea7c <__trunctfdf2+0x2f4>
    ea64:	00a78833          	add	a6,a5,a0
    ea68:	00082803          	lw	a6,0(a6)
    ea6c:	00168693          	add	a3,a3,1
    ea70:	00478793          	add	a5,a5,4
    ea74:	ff07ae23          	sw	a6,-4(a5)
    ea78:	fed656e3          	bge	a2,a3,ea64 <__trunctfdf2+0x2dc>
    ea7c:	00400793          	li	a5,4
    ea80:	41c787b3          	sub	a5,a5,t3
    ea84:	0840006f          	j	eb08 <__trunctfdf2+0x380>
    ea88:	00000593          	li	a1,0
    ea8c:	7ff00793          	li	a5,2047
    ea90:	00080637          	lui	a2,0x80
    ea94:	d99ff06f          	j	e82c <__trunctfdf2+0xa4>
    ea98:	00000713          	li	a4,0
    ea9c:	dd1ff06f          	j	e86c <__trunctfdf2+0xe4>
    eaa0:	02050813          	add	a6,a0,32
    eaa4:	00280833          	add	a6,a6,sp
    eaa8:	ff082803          	lw	a6,-16(a6)
    eaac:	02000f13          	li	t5,32
    eab0:	40df0f33          	sub	t5,t5,a3
    eab4:	01e81833          	sll	a6,a6,t5
    eab8:	01076733          	or	a4,a4,a6
    eabc:	08060e63          	beqz	a2,eb58 <__trunctfdf2+0x3d0>
    eac0:	00261813          	sll	a6,a2,0x2
    eac4:	00f80fb3          	add	t6,a6,a5
    eac8:	00a88633          	add	a2,a7,a0
    eacc:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ead0:	00462303          	lw	t1,4(a2)
    ead4:	00478793          	add	a5,a5,4
    ead8:	00d55533          	srl	a0,a0,a3
    eadc:	01e31333          	sll	t1,t1,t5
    eae0:	00656533          	or	a0,a0,t1
    eae4:	fea7ae23          	sw	a0,-4(a5)
    eae8:	00460613          	add	a2,a2,4
    eaec:	feff90e3          	bne	t6,a5,eacc <__trunctfdf2+0x344>
    eaf0:	00400793          	li	a5,4
    eaf4:	41c787b3          	sub	a5,a5,t3
    eaf8:	02080613          	add	a2,a6,32
    eafc:	00260633          	add	a2,a2,sp
    eb00:	00dedeb3          	srl	t4,t4,a3
    eb04:	ffd62823          	sw	t4,-16(a2)
    eb08:	00400693          	li	a3,4
    eb0c:	40f686b3          	sub	a3,a3,a5
    eb10:	00269693          	sll	a3,a3,0x2
    eb14:	00279793          	sll	a5,a5,0x2
    eb18:	00800613          	li	a2,8
    eb1c:	00f888b3          	add	a7,a7,a5
    eb20:	00c6ea63          	bltu	a3,a2,eb34 <__trunctfdf2+0x3ac>
    eb24:	0008a023          	sw	zero,0(a7)
    eb28:	0008a223          	sw	zero,4(a7)
    eb2c:	ff868693          	add	a3,a3,-8
    eb30:	00888893          	add	a7,a7,8
    eb34:	00400793          	li	a5,4
    eb38:	00f6e463          	bltu	a3,a5,eb40 <__trunctfdf2+0x3b8>
    eb3c:	0008a023          	sw	zero,0(a7)
    eb40:	01012783          	lw	a5,16(sp)
    eb44:	00e03733          	snez	a4,a4
    eb48:	01412603          	lw	a2,20(sp)
    eb4c:	00f766b3          	or	a3,a4,a5
    eb50:	00000713          	li	a4,0
    eb54:	e09ff06f          	j	e95c <__trunctfdf2+0x1d4>
    eb58:	00100793          	li	a5,1
    eb5c:	00000813          	li	a6,0
    eb60:	f99ff06f          	j	eaf8 <__trunctfdf2+0x370>

0000eb64 <__mulsi3>:
    eb64:	00050613          	mv	a2,a0
    eb68:	00000513          	li	a0,0
    eb6c:	0015f693          	and	a3,a1,1
    eb70:	00068463          	beqz	a3,eb78 <__mulsi3+0x14>
    eb74:	00c50533          	add	a0,a0,a2
    eb78:	0015d593          	srl	a1,a1,0x1
    eb7c:	00161613          	sll	a2,a2,0x1
    eb80:	fe0596e3          	bnez	a1,eb6c <__mulsi3+0x8>
    eb84:	00008067          	ret

0000eb88 <__muldi3>:
    eb88:	ff010113          	add	sp,sp,-16
    eb8c:	00812423          	sw	s0,8(sp)
    eb90:	00050413          	mv	s0,a0
    eb94:	00112623          	sw	ra,12(sp)
    eb98:	00060513          	mv	a0,a2
    eb9c:	00068393          	mv	t2,a3
    eba0:	00040713          	mv	a4,s0
    eba4:	00060813          	mv	a6,a2
    eba8:	00000793          	li	a5,0
    ebac:	00000313          	li	t1,0
    ebb0:	00000f13          	li	t5,0
    ebb4:	01e708b3          	add	a7,a4,t5
    ebb8:	00187e93          	and	t4,a6,1
    ebbc:	00f30fb3          	add	t6,t1,a5
    ebc0:	01f75e13          	srl	t3,a4,0x1f
    ebc4:	00185813          	srl	a6,a6,0x1
    ebc8:	00e8b2b3          	sltu	t0,a7,a4
    ebcc:	00179793          	sll	a5,a5,0x1
    ebd0:	000e8663          	beqz	t4,ebdc <__muldi3+0x54>
    ebd4:	00088f13          	mv	t5,a7
    ebd8:	01f28333          	add	t1,t0,t6
    ebdc:	00171713          	sll	a4,a4,0x1
    ebe0:	01c7e7b3          	or	a5,a5,t3
    ebe4:	fc0818e3          	bnez	a6,ebb4 <__muldi3+0x2c>
    ebe8:	00058663          	beqz	a1,ebf4 <__muldi3+0x6c>
    ebec:	f79ff0ef          	jal	eb64 <__mulsi3>
    ebf0:	00650333          	add	t1,a0,t1
    ebf4:	00038a63          	beqz	t2,ec08 <__muldi3+0x80>
    ebf8:	00040513          	mv	a0,s0
    ebfc:	00038593          	mv	a1,t2
    ec00:	f65ff0ef          	jal	eb64 <__mulsi3>
    ec04:	00650333          	add	t1,a0,t1
    ec08:	00c12083          	lw	ra,12(sp)
    ec0c:	00812403          	lw	s0,8(sp)
    ec10:	000f0513          	mv	a0,t5
    ec14:	00030593          	mv	a1,t1
    ec18:	01010113          	add	sp,sp,16
    ec1c:	00008067          	ret

0000ec20 <__divsi3>:
    ec20:	06054063          	bltz	a0,ec80 <__umodsi3+0x10>
    ec24:	0605c663          	bltz	a1,ec90 <__umodsi3+0x20>

0000ec28 <__hidden___udivsi3>:
    ec28:	00058613          	mv	a2,a1
    ec2c:	00050593          	mv	a1,a0
    ec30:	fff00513          	li	a0,-1
    ec34:	02060c63          	beqz	a2,ec6c <__hidden___udivsi3+0x44>
    ec38:	00100693          	li	a3,1
    ec3c:	00b67a63          	bgeu	a2,a1,ec50 <__hidden___udivsi3+0x28>
    ec40:	00c05863          	blez	a2,ec50 <__hidden___udivsi3+0x28>
    ec44:	00161613          	sll	a2,a2,0x1
    ec48:	00169693          	sll	a3,a3,0x1
    ec4c:	feb66ae3          	bltu	a2,a1,ec40 <__hidden___udivsi3+0x18>
    ec50:	00000513          	li	a0,0
    ec54:	00c5e663          	bltu	a1,a2,ec60 <__hidden___udivsi3+0x38>
    ec58:	40c585b3          	sub	a1,a1,a2
    ec5c:	00d56533          	or	a0,a0,a3
    ec60:	0016d693          	srl	a3,a3,0x1
    ec64:	00165613          	srl	a2,a2,0x1
    ec68:	fe0696e3          	bnez	a3,ec54 <__hidden___udivsi3+0x2c>
    ec6c:	00008067          	ret

0000ec70 <__umodsi3>:
    ec70:	00008293          	mv	t0,ra
    ec74:	fb5ff0ef          	jal	ec28 <__hidden___udivsi3>
    ec78:	00058513          	mv	a0,a1
    ec7c:	00028067          	jr	t0
    ec80:	40a00533          	neg	a0,a0
    ec84:	00b04863          	bgtz	a1,ec94 <__umodsi3+0x24>
    ec88:	40b005b3          	neg	a1,a1
    ec8c:	f9dff06f          	j	ec28 <__hidden___udivsi3>
    ec90:	40b005b3          	neg	a1,a1
    ec94:	00008293          	mv	t0,ra
    ec98:	f91ff0ef          	jal	ec28 <__hidden___udivsi3>
    ec9c:	40a00533          	neg	a0,a0
    eca0:	00028067          	jr	t0

0000eca4 <__modsi3>:
    eca4:	00008293          	mv	t0,ra
    eca8:	0005ca63          	bltz	a1,ecbc <__modsi3+0x18>
    ecac:	00054c63          	bltz	a0,ecc4 <__modsi3+0x20>
    ecb0:	f79ff0ef          	jal	ec28 <__hidden___udivsi3>
    ecb4:	00058513          	mv	a0,a1
    ecb8:	00028067          	jr	t0
    ecbc:	40b005b3          	neg	a1,a1
    ecc0:	fe0558e3          	bgez	a0,ecb0 <__modsi3+0xc>
    ecc4:	40a00533          	neg	a0,a0
    ecc8:	f61ff0ef          	jal	ec28 <__hidden___udivsi3>
    eccc:	40b00533          	neg	a0,a1
    ecd0:	00028067          	jr	t0

0000ecd4 <__clzsi2>:
    ecd4:	000107b7          	lui	a5,0x10
    ecd8:	02f57a63          	bgeu	a0,a5,ed0c <__clzsi2+0x38>
    ecdc:	10053793          	sltiu	a5,a0,256
    ece0:	0017b793          	seqz	a5,a5
    ece4:	00379793          	sll	a5,a5,0x3
    ece8:	02000713          	li	a4,32
    ecec:	40f70733          	sub	a4,a4,a5
    ecf0:	00f55533          	srl	a0,a0,a5
    ecf4:	00001797          	auipc	a5,0x1
    ecf8:	9dc78793          	add	a5,a5,-1572 # f6d0 <__clz_tab>
    ecfc:	00a787b3          	add	a5,a5,a0
    ed00:	0007c503          	lbu	a0,0(a5)
    ed04:	40a70533          	sub	a0,a4,a0
    ed08:	00008067          	ret
    ed0c:	010007b7          	lui	a5,0x1000
    ed10:	02f57463          	bgeu	a0,a5,ed38 <__clzsi2+0x64>
    ed14:	01000793          	li	a5,16
    ed18:	00f55533          	srl	a0,a0,a5
    ed1c:	00001797          	auipc	a5,0x1
    ed20:	9b478793          	add	a5,a5,-1612 # f6d0 <__clz_tab>
    ed24:	00a787b3          	add	a5,a5,a0
    ed28:	0007c503          	lbu	a0,0(a5)
    ed2c:	01000713          	li	a4,16
    ed30:	40a70533          	sub	a0,a4,a0
    ed34:	00008067          	ret
    ed38:	01800793          	li	a5,24
    ed3c:	00f55533          	srl	a0,a0,a5
    ed40:	00001797          	auipc	a5,0x1
    ed44:	99078793          	add	a5,a5,-1648 # f6d0 <__clz_tab>
    ed48:	00a787b3          	add	a5,a5,a0
    ed4c:	0007c503          	lbu	a0,0(a5)
    ed50:	00800713          	li	a4,8
    ed54:	40a70533          	sub	a0,a4,a0
    ed58:	00008067          	ret
