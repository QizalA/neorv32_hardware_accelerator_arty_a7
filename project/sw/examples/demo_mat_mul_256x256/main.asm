
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x88>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	a2c38393          	add	t2,t2,-1492 # fa60 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <g_sink>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <g_sink>
      54:	80021597          	auipc	a1,0x80021
      58:	04458593          	add	a1,a1,68 # 80021098 <__crt0_bss_end>
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
     110:	eb440413          	add	s0,s0,-332 # efc0 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	eac48493          	add	s1,s1,-340 # efc0 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	6f060613          	add	a2,a2,1776 # 820 <main>

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
     178:	e4c40413          	add	s0,s0,-436 # efc0 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	e4448493          	add	s1,s1,-444 # efc0 <__fini_array_end>

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

/* ===== CSRs ===== */
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
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	fc050513          	add	a0,a0,-64 # efc0 <__fini_array_end>
     21c:	44d0006f          	j	e68 <printf>
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
     240:	3ad0e0ef          	jal	edec <__muldi3>
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
     270:	3840b0ef          	jal	b5f4 <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	21d0b0ef          	jal	bca0 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	3540b0ef          	jal	b5f4 <__udivdi3>
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
     2c4:	fcc50513          	add	a0,a0,-52 # efcc <__fini_array_end+0xc>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2cc:	39d0006f          	j	e68 <printf>

000002d0 <gemm_cfu_checksum.constprop.0>:
  return cs;
}
__attribute__((noinline))
static uint32_t gemm_cfu_checksum(const int8_t A[N][N], const int8_t B[N][N]){
  uint32_t cs = 0u;
  for(int i=0;i<N;++i){
     2d0:	80011637          	lui	a2,0x80011
     2d4:	f3860613          	add	a2,a2,-200 # 80010f38 <A.3>
     2d8:	00010337          	lui	t1,0x10
     2dc:	80001eb7          	lui	t4,0x80001
      for(int k=0;k<N;k+=4){
        uint32_t ap=pack4_s8_lsb(A[i][k+0],A[i][k+1],A[i][k+2],A[i][k+3]);
        uint32_t bp=pack4_s8_lsb(B[k+0][j],B[k+1][j],B[k+2][j],B[k+3][j]);
        acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
      }
      cs ^= (uint32_t)acc + 0x9E3779B9u + (cs<<6) + (cs>>2);
     2e0:	9e378e37          	lui	t3,0x9e378
     2e4:	00660333          	add	t1,a2,t1
  uint32_t cs = 0u;
     2e8:	00000513          	li	a0,0
     2ec:	f38e8e93          	add	t4,t4,-200 # 80000f38 <B.2>
      cs ^= (uint32_t)acc + 0x9E3779B9u + (cs<<6) + (cs>>2);
     2f0:	9b9e0e13          	add	t3,t3,-1607 # 9e3779b9 <__crt0_ram_last+0x1e2f79ba>
    for(int j=0;j<N;++j){
     2f4:	10000293          	li	t0,256
     2f8:	00000813          	li	a6,0
     2fc:	10060893          	add	a7,a2,256
     300:	0880006f          	j	388 <gemm_cfu_checksum.constprop.0+0xb8>
         (((uint32_t)(uint8_t)x1) << 8)  |
     304:	0016c783          	lbu	a5,1(a3)
         (((uint32_t)(uint8_t)x2) << 16) |
     308:	0026c703          	lbu	a4,2(a3)
     30c:	2005cf83          	lbu	t6,512(a1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     310:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     314:	01071713          	sll	a4,a4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     318:	00e7e7b3          	or	a5,a5,a4
  return  ((uint32_t)(uint8_t)x0)        |
     31c:	0006c703          	lbu	a4,0(a3)
         (((uint32_t)(uint8_t)x2) << 16) |
     320:	010f9f93          	sll	t6,t6,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     324:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x3) << 24);
     328:	0036c703          	lbu	a4,3(a3)
     32c:	01871713          	sll	a4,a4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     330:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     334:	1005c703          	lbu	a4,256(a1)
     338:	00871713          	sll	a4,a4,0x8
     33c:	01f76733          	or	a4,a4,t6
  return  ((uint32_t)(uint8_t)x0)        |
     340:	0005cf83          	lbu	t6,0(a1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     344:	01f76733          	or	a4,a4,t6
         (((uint32_t)(uint8_t)x3) << 24);
     348:	3005cf83          	lbu	t6,768(a1)
     34c:	018f9f93          	sll	t6,t6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     350:	01f76733          	or	a4,a4,t6
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     354:	02e7878b          	.insn	4, 0x02e7878b
      for(int k=0;k<N;k+=4){
     358:	00468693          	add	a3,a3,4
        acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     35c:	00ff0f33          	add	t5,t5,a5
      for(int k=0;k<N;k+=4){
     360:	40058593          	add	a1,a1,1024
     364:	fad890e3          	bne	a7,a3,304 <gemm_cfu_checksum.constprop.0+0x34>
      cs ^= (uint32_t)acc + 0x9E3779B9u + (cs<<6) + (cs>>2);
     368:	00651793          	sll	a5,a0,0x6
     36c:	00255713          	srl	a4,a0,0x2
     370:	00e787b3          	add	a5,a5,a4
     374:	01c787b3          	add	a5,a5,t3
     378:	01e787b3          	add	a5,a5,t5
    for(int j=0;j<N;++j){
     37c:	00180813          	add	a6,a6,1
      cs ^= (uint32_t)acc + 0x9E3779B9u + (cs<<6) + (cs>>2);
     380:	00f54533          	xor	a0,a0,a5
    for(int j=0;j<N;++j){
     384:	00580a63          	beq	a6,t0,398 <gemm_cfu_checksum.constprop.0+0xc8>
      for(int k=0;k<N;k+=4){
     388:	01d805b3          	add	a1,a6,t4
static uint32_t gemm_cfu_checksum(const int8_t A[N][N], const int8_t B[N][N]){
     38c:	00060693          	mv	a3,a2
      int32_t acc=0;
     390:	00000f13          	li	t5,0
     394:	f71ff06f          	j	304 <gemm_cfu_checksum.constprop.0+0x34>
  for(int i=0;i<N;++i){
     398:	00688663          	beq	a7,t1,3a4 <gemm_cfu_checksum.constprop.0+0xd4>
     39c:	00088613          	mv	a2,a7
     3a0:	f59ff06f          	j	2f8 <gemm_cfu_checksum.constprop.0+0x28>
    }
  }
  return cs;
}
     3a4:	00008067          	ret

000003a8 <gemm_sw_checksum.constprop.0>:
static uint32_t gemm_sw_checksum(const int8_t A[N][N], const int8_t B[N][N]){
     3a8:	fd010113          	add	sp,sp,-48
     3ac:	02812423          	sw	s0,40(sp)
     3b0:	80011437          	lui	s0,0x80011
     3b4:	01412c23          	sw	s4,24(sp)
     3b8:	01512a23          	sw	s5,20(sp)
     3bc:	01612823          	sw	s6,16(sp)
     3c0:	f3840413          	add	s0,s0,-200 # 80010f38 <A.3>
     3c4:	00010a37          	lui	s4,0x10
     3c8:	80001b37          	lui	s6,0x80001
      cs ^= (uint32_t)s + 0x9E3779B9u + (cs<<6) + (cs>>2);
     3cc:	9e378ab7          	lui	s5,0x9e378
static uint32_t gemm_sw_checksum(const int8_t A[N][N], const int8_t B[N][N]){
     3d0:	02912223          	sw	s1,36(sp)
     3d4:	01912223          	sw	s9,4(sp)
     3d8:	02112623          	sw	ra,44(sp)
     3dc:	03212023          	sw	s2,32(sp)
     3e0:	01312e23          	sw	s3,28(sp)
     3e4:	01712623          	sw	s7,12(sp)
     3e8:	01812423          	sw	s8,8(sp)
     3ec:	01440a33          	add	s4,s0,s4
  uint32_t cs = 0u;
     3f0:	00000493          	li	s1,0
     3f4:	f38b0b13          	add	s6,s6,-200 # 80000f38 <B.2>
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     3f8:	10000c93          	li	s9,256
      cs ^= (uint32_t)s + 0x9E3779B9u + (cs<<6) + (cs>>2);
     3fc:	9b9a8a93          	add	s5,s5,-1607 # 9e3779b9 <__crt0_ram_last+0x1e2f79ba>
    for(int j=0;j<N;++j){
     400:	00000993          	li	s3,0
     404:	0440006f          	j	448 <gemm_sw_checksum.constprop.0+0xa0>
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     408:	012407b3          	add	a5,s0,s2
     40c:	000c0583          	lb	a1,0(s8)
     410:	00078503          	lb	a0,0(a5)
     414:	00190913          	add	s2,s2,1
     418:	100c0c13          	add	s8,s8,256
     41c:	1ad0e0ef          	jal	edc8 <__mulsi3>
     420:	00ab8bb3          	add	s7,s7,a0
     424:	ff9912e3          	bne	s2,s9,408 <gemm_sw_checksum.constprop.0+0x60>
      cs ^= (uint32_t)s + 0x9E3779B9u + (cs<<6) + (cs>>2);
     428:	00649793          	sll	a5,s1,0x6
     42c:	0024d713          	srl	a4,s1,0x2
     430:	00e787b3          	add	a5,a5,a4
     434:	015787b3          	add	a5,a5,s5
     438:	017787b3          	add	a5,a5,s7
    for(int j=0;j<N;++j){
     43c:	00198993          	add	s3,s3,1
      cs ^= (uint32_t)s + 0x9E3779B9u + (cs<<6) + (cs>>2);
     440:	00f4c4b3          	xor	s1,s1,a5
    for(int j=0;j<N;++j){
     444:	01298a63          	beq	s3,s2,458 <gemm_sw_checksum.constprop.0+0xb0>
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     448:	01698c33          	add	s8,s3,s6
      int32_t s=0;
     44c:	00000b93          	li	s7,0
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     450:	00000913          	li	s2,0
     454:	fb5ff06f          	j	408 <gemm_sw_checksum.constprop.0+0x60>
  for(int i=0;i<N;++i){
     458:	10040413          	add	s0,s0,256
     45c:	fa8a12e3          	bne	s4,s0,400 <gemm_sw_checksum.constprop.0+0x58>
}
     460:	02c12083          	lw	ra,44(sp)
     464:	02812403          	lw	s0,40(sp)
     468:	02012903          	lw	s2,32(sp)
     46c:	01c12983          	lw	s3,28(sp)
     470:	01812a03          	lw	s4,24(sp)
     474:	01412a83          	lw	s5,20(sp)
     478:	01012b03          	lw	s6,16(sp)
     47c:	00c12b83          	lw	s7,12(sp)
     480:	00812c03          	lw	s8,8(sp)
     484:	00412c83          	lw	s9,4(sp)
     488:	00048513          	mv	a0,s1
     48c:	02412483          	lw	s1,36(sp)
     490:	03010113          	add	sp,sp,48
     494:	00008067          	ret

00000498 <gemm_cfs_tiles.constprop.0>:
__attribute__((noinline))
static uint32_t gemm_cfs_tiles(const int8_t A[N][N], const int8_t B[N][N]){
     498:	f4010113          	add	sp,sp,-192
     49c:	0a912a23          	sw	s1,180(sp)
     4a0:	0b512223          	sw	s5,164(sp)
     4a4:	09912a23          	sw	s9,148(sp)
     4a8:	800114b7          	lui	s1,0x80011
#endif
  uint32_t cs=0u;

  for(int i0=0;i0<N;i0+=4){
    for(int j0=0;j0<N;j0+=4){
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*N + k] = A[sr][k]; }
     4ac:	80001ab7          	lui	s5,0x80001
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4b0:	ffeb0cb7          	lui	s9,0xffeb0
static uint32_t gemm_cfs_tiles(const int8_t A[N][N], const int8_t B[N][N]){
     4b4:	0a812c23          	sw	s0,184(sp)
     4b8:	0b612023          	sw	s6,160(sp)
     4bc:	09712e23          	sw	s7,156(sp)
     4c0:	09812c23          	sw	s8,152(sp)
     4c4:	0a112e23          	sw	ra,188(sp)
     4c8:	0b212823          	sw	s2,176(sp)
     4cc:	0b312623          	sw	s3,172(sp)
     4d0:	0b412423          	sw	s4,168(sp)
     4d4:	09a12823          	sw	s10,144(sp)
     4d8:	09b12623          	sw	s11,140(sp)
     4dc:	f3848493          	add	s1,s1,-200 # 80010f38 <A.3>
  uint32_t cs=0u;
     4e0:	00000413          	li	s0,0
  for(int i0=0;i0<N;i0+=4){
     4e4:	00000c13          	li	s8,0
     4e8:	80000b37          	lui	s6,0x80000
     4ec:	b38a8b93          	add	s7,s5,-1224 # 80000b38 <Aflat.1>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4f0:	004c8c93          	add	s9,s9,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
    for(int j0=0;j0<N;j0+=4){
     4f4:	800017b7          	lui	a5,0x80001
     4f8:	f3878a13          	add	s4,a5,-200 # 80000f38 <B.2>
     4fc:	00000993          	li	s3,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     500:	ffeb0937          	lui	s2,0xffeb0
     504:	2a00006f          	j	7a4 <gemm_cfs_tiles.constprop.0+0x30c>
      for(int k=0;k<N;++k){
        Bflat[k*4+0]=B[k][j0+0];
     508:	0006c583          	lbu	a1,0(a3)
      for(int k=0;k<N;++k){
     50c:	00478793          	add	a5,a5,4
     510:	10068693          	add	a3,a3,256
        Bflat[k*4+0]=B[k][j0+0];
     514:	feb78e23          	sb	a1,-4(a5)
        Bflat[k*4+1]=B[k][j0+1];
     518:	f016c583          	lbu	a1,-255(a3)
     51c:	feb78ea3          	sb	a1,-3(a5)
        Bflat[k*4+2]=B[k][j0+2];
     520:	f026c583          	lbu	a1,-254(a3)
     524:	feb78f23          	sb	a1,-2(a5)
        Bflat[k*4+3]=B[k][j0+3];
     528:	f036c583          	lbu	a1,-253(a3)
     52c:	feb78fa3          	sb	a1,-1(a5)
      for(int k=0;k<N;++k){
     530:	fcc79ce3          	bne	a5,a2,508 <gemm_cfs_tiles.constprop.0+0x70>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     534:	00200793          	li	a5,2
     538:	00f92023          	sw	a5,0(s2) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     53c:	00092783          	lw	a5,0(s2)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     540:	ffeb0eb7          	lui	t4,0xffeb0
     544:	ffeb0e37          	lui	t3,0xffeb0
     548:	ffeb0337          	lui	t1,0xffeb0
     54c:	ffeb08b7          	lui	a7,0xffeb0
     550:	ffeb0837          	lui	a6,0xffeb0
     554:	ffeb0537          	lui	a0,0xffeb0
     558:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0;s<T;++s){
     55c:	00000793          	li	a5,0
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     560:	0ff00f93          	li	t6,255
     564:	00400293          	li	t0,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     568:	008e8e93          	add	t4,t4,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     56c:	00ce0e13          	add	t3,t3,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     570:	01030313          	add	t1,t1,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     574:	01488893          	add	a7,a7,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     578:	01880813          	add	a6,a6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     57c:	01c50513          	add	a0,a0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     580:	02058593          	add	a1,a1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     584:	00100093          	li	ra,1
  for(int s=0;s<T;++s){
     588:	10600393          	li	t2,262
    uint32_t Aw[4]={0}, Bw[4]={0};
     58c:	02012023          	sw	zero,32(sp)
     590:	02012223          	sw	zero,36(sp)
     594:	02012423          	sw	zero,40(sp)
     598:	02012623          	sw	zero,44(sp)
     59c:	02012823          	sw	zero,48(sp)
     5a0:	02012a23          	sw	zero,52(sp)
     5a4:	02012c23          	sw	zero,56(sp)
     5a8:	02012e23          	sw	zero,60(sp)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     5ac:	02010d13          	add	s10,sp,32
     5b0:	01778f33          	add	t5,a5,s7
     5b4:	00000693          	li	a3,0
     5b8:	40d78db3          	sub	s11,a5,a3
     5bc:	00000613          	li	a2,0
     5c0:	01bfe463          	bltu	t6,s11,5c8 <gemm_cfs_tiles.constprop.0+0x130>
     5c4:	000f0603          	lb	a2,0(t5)
     5c8:	0ff67613          	zext.b	a2,a2
     5cc:	00cd2023          	sw	a2,0(s10)
     5d0:	00168693          	add	a3,a3,1
     5d4:	004d0d13          	add	s10,s10,4
     5d8:	0fff0f13          	add	t5,t5,255
     5dc:	fc569ee3          	bne	a3,t0,5b8 <gemm_cfs_tiles.constprop.0+0x120>
     5e0:	03010d13          	add	s10,sp,48
     5e4:	00070f13          	mv	t5,a4
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)? Bflat[k*ldb+j] : 0; Bw[j]=(uint32_t)(uint8_t)b; }
     5e8:	00000693          	li	a3,0
     5ec:	40d78db3          	sub	s11,a5,a3
     5f0:	00000613          	li	a2,0
     5f4:	01bfe463          	bltu	t6,s11,5fc <gemm_cfs_tiles.constprop.0+0x164>
     5f8:	000f0603          	lb	a2,0(t5)
     5fc:	0ff67613          	zext.b	a2,a2
     600:	00cd2023          	sw	a2,0(s10)
     604:	00168693          	add	a3,a3,1
     608:	004d0d13          	add	s10,s10,4
     60c:	ffdf0f13          	add	t5,t5,-3
     610:	fc569ee3          	bne	a3,t0,5ec <gemm_cfs_tiles.constprop.0+0x154>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     614:	02012683          	lw	a3,32(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     618:	00dca023          	sw	a3,0(s9)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     61c:	02412683          	lw	a3,36(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     620:	00dea023          	sw	a3,0(t4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     624:	02812683          	lw	a3,40(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     628:	00de2023          	sw	a3,0(t3)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     62c:	02c12683          	lw	a3,44(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     630:	00d32023          	sw	a3,0(t1)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     634:	03012683          	lw	a3,48(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     638:	00d8a023          	sw	a3,0(a7)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     63c:	03412683          	lw	a3,52(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     640:	00d82023          	sw	a3,0(a6)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     644:	03812683          	lw	a3,56(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     648:	00d52023          	sw	a3,0(a0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     64c:	03c12683          	lw	a3,60(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     650:	00d5a023          	sw	a3,0(a1)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     654:	00092683          	lw	a3,0(s2)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     658:	00192023          	sw	ra,0(s2)
  for(int s=0;s<T;++s){
     65c:	00178793          	add	a5,a5,1
     660:	00470713          	add	a4,a4,4
     664:	f27794e3          	bne	a5,t2,58c <gemm_cfs_tiles.constprop.0+0xf4>
     668:	04010d13          	add	s10,sp,64
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     66c:	ffeb0637          	lui	a2,0xffeb0
  for(int s=0;s<T;++s){
     670:	000d0593          	mv	a1,s10
     674:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     678:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     67c:	01000513          	li	a0,16
     680:	00271693          	sll	a3,a4,0x2
     684:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     688:	00c686b3          	add	a3,a3,a2
     68c:	00f68833          	add	a6,a3,a5
     690:	00082883          	lw	a7,0(a6)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     694:	00f58833          	add	a6,a1,a5
     698:	00478793          	add	a5,a5,4
     69c:	01182023          	sw	a7,0(a6)
     6a0:	fea796e3          	bne	a5,a0,68c <gemm_cfs_tiles.constprop.0+0x1f4>
     6a4:	00470713          	add	a4,a4,4
     6a8:	01058593          	add	a1,a1,16
     6ac:	fcf71ae3          	bne	a4,a5,680 <gemm_cfs_tiles.constprop.0+0x1e8>
     6b0:	040d0813          	add	a6,s10,64
     6b4:	000d0793          	mv	a5,s10
     6b8:	00048613          	mv	a2,s1
      cfs_read_Ctile(C4);
#ifndef VERIFY_SKIP
      /* verify against SW 4×4 */
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
        int i=i0+r, j=j0+c; int32_t s=0;
        for(int kk=0;kk<N;++kk) s += (int32_t)A[i][kk] * (int32_t)B[kk][j];
     6bc:	00078693          	mv	a3,a5
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     6c0:	00000d93          	li	s11,0
        for(int kk=0;kk<N;++kk) s += (int32_t)A[i][kk] * (int32_t)B[kk][j];
     6c4:	014d8333          	add	t1,s11,s4
        int i=i0+r, j=j0+c; int32_t s=0;
     6c8:	00000893          	li	a7,0
        for(int kk=0;kk<N;++kk) s += (int32_t)A[i][kk] * (int32_t)B[kk][j];
     6cc:	00000713          	li	a4,0
     6d0:	00e60533          	add	a0,a2,a4
     6d4:	00030583          	lb	a1,0(t1)
     6d8:	00050503          	lb	a0,0(a0)
     6dc:	00d12e23          	sw	a3,28(sp)
     6e0:	00f12c23          	sw	a5,24(sp)
     6e4:	01012a23          	sw	a6,20(sp)
     6e8:	01112823          	sw	a7,16(sp)
     6ec:	00e12623          	sw	a4,12(sp)
     6f0:	00c12423          	sw	a2,8(sp)
     6f4:	00612223          	sw	t1,4(sp)
     6f8:	6d00e0ef          	jal	edc8 <__mulsi3>
     6fc:	00c12703          	lw	a4,12(sp)
     700:	01012883          	lw	a7,16(sp)
     704:	00412303          	lw	t1,4(sp)
     708:	00170713          	add	a4,a4,1
     70c:	10000e13          	li	t3,256
     710:	00812603          	lw	a2,8(sp)
     714:	01412803          	lw	a6,20(sp)
     718:	01812783          	lw	a5,24(sp)
     71c:	01c12683          	lw	a3,28(sp)
     720:	00a888b3          	add	a7,a7,a0
     724:	10030313          	add	t1,t1,256
     728:	00400e93          	li	t4,4
     72c:	fbc712e3          	bne	a4,t3,6d0 <gemm_cfs_tiles.constprop.0+0x238>
        SW4[r][c]=s;
        if (C4[r][c] != s) return 0xDEADFACEu;
     730:	0006a703          	lw	a4,0(a3)
     734:	0ee89063          	bne	a7,a4,814 <gemm_cfs_tiles.constprop.0+0x37c>
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     738:	001d8d93          	add	s11,s11,1
     73c:	00468693          	add	a3,a3,4
     740:	f9dd92e3          	bne	s11,t4,6c4 <gemm_cfs_tiles.constprop.0+0x22c>
     744:	01078793          	add	a5,a5,16
     748:	10060613          	add	a2,a2,256
     74c:	f6f818e3          	bne	a6,a5,6bc <gemm_cfs_tiles.constprop.0+0x224>
      }
#endif
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
        cs ^= (uint32_t)C4[r][c] + 0x9E3779B9u + (cs<<6) + (cs>>2);
     750:	9e378637          	lui	a2,0x9e378
     754:	9b960613          	add	a2,a2,-1607 # 9e3779b9 <__crt0_ram_last+0x1e2f79ba>
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     758:	00400593          	li	a1,4
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     75c:	000d0693          	mv	a3,s10
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     760:	00000713          	li	a4,0
        cs ^= (uint32_t)C4[r][c] + 0x9E3779B9u + (cs<<6) + (cs>>2);
     764:	00245513          	srl	a0,s0,0x2
     768:	00641793          	sll	a5,s0,0x6
     76c:	00a787b3          	add	a5,a5,a0
     770:	0006a503          	lw	a0,0(a3)
     774:	00c787b3          	add	a5,a5,a2
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     778:	00170713          	add	a4,a4,1
        cs ^= (uint32_t)C4[r][c] + 0x9E3779B9u + (cs<<6) + (cs>>2);
     77c:	00a787b3          	add	a5,a5,a0
     780:	00f44433          	xor	s0,s0,a5
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     784:	00468693          	add	a3,a3,4
     788:	fcb71ee3          	bne	a4,a1,764 <gemm_cfs_tiles.constprop.0+0x2cc>
     78c:	010d0d13          	add	s10,s10,16
     790:	fd0d16e3          	bne	s10,a6,75c <gemm_cfs_tiles.constprop.0+0x2c4>
    for(int j0=0;j0<N;j0+=4){
     794:	00498993          	add	s3,s3,4
     798:	10000793          	li	a5,256
     79c:	004a0a13          	add	s4,s4,4 # 10004 <__crt0_copy_data_src_begin+0x5a4>
     7a0:	02f98463          	beq	s3,a5,7c8 <gemm_cfs_tiles.constprop.0+0x330>
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*N + k] = A[sr][k]; }
     7a4:	40000613          	li	a2,1024
     7a8:	00048593          	mv	a1,s1
     7ac:	b38a8513          	add	a0,s5,-1224
     7b0:	149000ef          	jal	10f8 <memcpy>
     7b4:	738b0713          	add	a4,s6,1848 # 80000738 <Bflat.0>
     7b8:	40070613          	add	a2,a4,1024
     7bc:	738b0793          	add	a5,s6,1848
     7c0:	000a0693          	mv	a3,s4
     7c4:	d45ff06f          	j	508 <gemm_cfs_tiles.constprop.0+0x70>
  for(int i0=0;i0<N;i0+=4){
     7c8:	004c0c13          	add	s8,s8,4
     7cc:	40048493          	add	s1,s1,1024
     7d0:	d33c12e3          	bne	s8,s3,4f4 <gemm_cfs_tiles.constprop.0+0x5c>
      }
    }
  }
  return cs;
}
     7d4:	0bc12083          	lw	ra,188(sp)
     7d8:	00040513          	mv	a0,s0
     7dc:	0b812403          	lw	s0,184(sp)
     7e0:	0b412483          	lw	s1,180(sp)
     7e4:	0b012903          	lw	s2,176(sp)
     7e8:	0ac12983          	lw	s3,172(sp)
     7ec:	0a812a03          	lw	s4,168(sp)
     7f0:	0a412a83          	lw	s5,164(sp)
     7f4:	0a012b03          	lw	s6,160(sp)
     7f8:	09c12b83          	lw	s7,156(sp)
     7fc:	09812c03          	lw	s8,152(sp)
     800:	09412c83          	lw	s9,148(sp)
     804:	09012d03          	lw	s10,144(sp)
     808:	08c12d83          	lw	s11,140(sp)
     80c:	0c010113          	add	sp,sp,192
     810:	00008067          	ret
        if (C4[r][c] != s) return 0xDEADFACEu;
     814:	deae0437          	lui	s0,0xdeae0
     818:	ace40413          	add	s0,s0,-1330 # deadface <__crt0_ram_last+0x5ea5facf>
     81c:	fb9ff06f          	j	7d4 <gemm_cfs_tiles.constprop.0+0x33c>

00000820 <main>:

/* ===== Main ===== */
int main(void){
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     820:	0000f537          	lui	a0,0xf
int main(void){
     824:	fa010113          	add	sp,sp,-96
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     828:	10000613          	li	a2,256
     82c:	10000593          	li	a1,256
     830:	fec50513          	add	a0,a0,-20 # efec <__fini_array_end+0x2c>
int main(void){
     834:	04112e23          	sw	ra,92(sp)
     838:	04812c23          	sw	s0,88(sp)
     83c:	04912a23          	sw	s1,84(sp)
     840:	05212823          	sw	s2,80(sp)
     844:	05312623          	sw	s3,76(sp)
     848:	05412423          	sw	s4,72(sp)
     84c:	05512223          	sw	s5,68(sp)
     850:	05612023          	sw	s6,64(sp)
     854:	03712e23          	sw	s7,60(sp)
     858:	03812c23          	sw	s8,56(sp)
     85c:	03912a23          	sw	s9,52(sp)
     860:	03a12823          	sw	s10,48(sp)
     864:	03b12623          	sw	s11,44(sp)
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     868:	600000ef          	jal	e68 <printf>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     86c:	ffeb07b7          	lui	a5,0xffeb0
     870:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     874:	0000f537          	lui	a0,0xf
     878:	01050513          	add	a0,a0,16 # f010 <__fini_array_end+0x50>
     87c:	5ec000ef          	jal	e68 <printf>

  static int8_t A[N][N], B[N][N];
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     880:	80011737          	lui	a4,0x80011
     884:	f3870713          	add	a4,a4,-200 # 80010f38 <A.3>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     888:	00100613          	li	a2,1
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     88c:	10000813          	li	a6,256
     890:	10100893          	li	a7,257
     894:	0ff67593          	zext.b	a1,a2
     898:	00259793          	sll	a5,a1,0x2
     89c:	40f587b3          	sub	a5,a1,a5
     8a0:	0ff7f793          	zext.b	a5,a5
     8a4:	00000693          	li	a3,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     8a8:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     8ac:	00d70333          	add	t1,a4,a3
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     8b0:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     8b4:	00b787b3          	add	a5,a5,a1
     8b8:	00a30023          	sb	a0,0(t1)
     8bc:	00168693          	add	a3,a3,1
     8c0:	0ff7f793          	zext.b	a5,a5
     8c4:	ff0692e3          	bne	a3,a6,8a8 <main+0x88>
     8c8:	00160613          	add	a2,a2,1
     8cc:	10070713          	add	a4,a4,256
     8d0:	fd1612e3          	bne	a2,a7,894 <main+0x74>
     8d4:	800016b7          	lui	a3,0x80001
     8d8:	f3868693          	add	a3,a3,-200 # 80000f38 <B.2>
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     8dc:	00000613          	li	a2,0
     8e0:	00500813          	li	a6,5
     8e4:	10000893          	li	a7,256
     8e8:	0ff67793          	zext.b	a5,a2
     8ec:	40f805b3          	sub	a1,a6,a5
     8f0:	00179793          	sll	a5,a5,0x1
     8f4:	ff678793          	add	a5,a5,-10
     8f8:	0ff5f593          	zext.b	a1,a1
     8fc:	0ff7f793          	zext.b	a5,a5
     900:	00000713          	li	a4,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     904:	00f7f513          	and	a0,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     908:	00e68333          	add	t1,a3,a4
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     90c:	ff850513          	add	a0,a0,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     910:	00b787b3          	add	a5,a5,a1
     914:	00a30023          	sb	a0,0(t1)
     918:	00170713          	add	a4,a4,1
     91c:	0ff7f793          	zext.b	a5,a5
     920:	ff1712e3          	bne	a4,a7,904 <main+0xe4>
     924:	00160613          	add	a2,a2,1
     928:	10068693          	add	a3,a3,256
     92c:	fae61ee3          	bne	a2,a4,8e8 <main+0xc8>

  uint64_t c0,i0,c1,i1;

  /* SW */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
     930:	8b5ff0ef          	jal	1e4 <rdcycle>
     934:	00050993          	mv	s3,a0
     938:	00058b93          	mv	s7,a1
     93c:	8bdff0ef          	jal	1f8 <rdinstret>
     940:	00058b13          	mv	s6,a1
     944:	00050913          	mv	s2,a0
  uint32_t sw_cs = gemm_sw_checksum(A,B);
     948:	a61ff0ef          	jal	3a8 <gemm_sw_checksum.constprop.0>
     94c:	00050a93          	mv	s5,a0
  i1=rdinstret(); c1=rdcycle();
     950:	8a9ff0ef          	jal	1f8 <rdinstret>
     954:	00050a13          	mv	s4,a0
     958:	00058413          	mv	s0,a1
     95c:	889ff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     960:	413509b3          	sub	s3,a0,s3
     964:	013537b3          	sltu	a5,a0,s3
     968:	417584b3          	sub	s1,a1,s7
     96c:	412a0933          	sub	s2,s4,s2
     970:	40f487b3          	sub	a5,s1,a5
     974:	41640433          	sub	s0,s0,s6
     978:	012a3a33          	sltu	s4,s4,s2
     97c:	00f12623          	sw	a5,12(sp)
     980:	414407b3          	sub	a5,s0,s4
  g_sink ^= sw_cs;
     984:	80000437          	lui	s0,0x80000
     988:	71442703          	lw	a4,1812(s0) # 80000714 <g_sink>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     98c:	00f12823          	sw	a5,16(sp)
  g_sink ^= sw_cs;
     990:	01574533          	xor	a0,a4,s5
     994:	70a42a23          	sw	a0,1812(s0)

  /* CFU */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
     998:	84dff0ef          	jal	1e4 <rdcycle>
     99c:	00050d93          	mv	s11,a0
     9a0:	00058c93          	mv	s9,a1
     9a4:	855ff0ef          	jal	1f8 <rdinstret>
     9a8:	00058c13          	mv	s8,a1
     9ac:	00050d13          	mv	s10,a0
  uint32_t cfu_cs = gemm_cfu_checksum(A,B);
     9b0:	921ff0ef          	jal	2d0 <gemm_cfu_checksum.constprop.0>
     9b4:	00050b93          	mv	s7,a0
  i1=rdinstret(); c1=rdcycle();
     9b8:	841ff0ef          	jal	1f8 <rdinstret>
     9bc:	00050a13          	mv	s4,a0
     9c0:	00058a93          	mv	s5,a1
     9c4:	821ff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     9c8:	41b50db3          	sub	s11,a0,s11
     9cc:	01b53733          	sltu	a4,a0,s11
     9d0:	41958b33          	sub	s6,a1,s9
     9d4:	40eb07b3          	sub	a5,s6,a4
  g_sink ^= cfu_cs;
     9d8:	71442703          	lw	a4,1812(s0)
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     9dc:	41aa0d33          	sub	s10,s4,s10
     9e0:	01aa3a33          	sltu	s4,s4,s10
     9e4:	418a8ab3          	sub	s5,s5,s8
     9e8:	00f12a23          	sw	a5,20(sp)
  g_sink ^= cfu_cs;
     9ec:	01774533          	xor	a0,a4,s7
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     9f0:	414a87b3          	sub	a5,s5,s4
     9f4:	00f12c23          	sw	a5,24(sp)
  g_sink ^= cfu_cs;
     9f8:	70a42a23          	sw	a0,1812(s0)

  /* CFS */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
     9fc:	fe8ff0ef          	jal	1e4 <rdcycle>
     a00:	00050c93          	mv	s9,a0
     a04:	00b12e23          	sw	a1,28(sp)
     a08:	ff0ff0ef          	jal	1f8 <rdinstret>
     a0c:	00058493          	mv	s1,a1
     a10:	00050c13          	mv	s8,a0
  uint32_t cfs_cs = gemm_cfs_tiles(A,B);
     a14:	a85ff0ef          	jal	498 <gemm_cfs_tiles.constprop.0>
     a18:	00050b93          	mv	s7,a0
  i1=rdinstret(); c1=rdcycle();
     a1c:	fdcff0ef          	jal	1f8 <rdinstret>
     a20:	00050b13          	mv	s6,a0
     a24:	00058a93          	mv	s5,a1
     a28:	fbcff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a2c:	418b0c33          	sub	s8,s6,s8
     a30:	409a8633          	sub	a2,s5,s1
     a34:	018b3733          	sltu	a4,s6,s8
     a38:	40e607b3          	sub	a5,a2,a4
  g_sink ^= cfs_cs;
     a3c:	71442703          	lw	a4,1812(s0)
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a40:	01c12883          	lw	a7,28(sp)
     a44:	41950cb3          	sub	s9,a0,s9
  g_sink ^= cfs_cs;
     a48:	01774733          	xor	a4,a4,s7
     a4c:	70e42a23          	sw	a4,1812(s0)
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a50:	41158a33          	sub	s4,a1,a7
  int ok_cfs = 1;
#endif
  int ok_cfu = 1;

  /* Print */
  printf("checksum sink: 0x%08" PRIX32 "\n", g_sink);
     a54:	71442583          	lw	a1,1812(s0)
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a58:	019536b3          	sltu	a3,a0,s9
  printf("checksum sink: 0x%08" PRIX32 "\n", g_sink);
     a5c:	0000f537          	lui	a0,0xf
     a60:	02450513          	add	a0,a0,36 # f024 <__fini_array_end+0x64>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a64:	40da0a33          	sub	s4,s4,a3
     a68:	00078493          	mv	s1,a5
  printf("checksum sink: 0x%08" PRIX32 "\n", g_sink);
     a6c:	3fc000ef          	jal	e68 <printf>
  printf("\n%dx%d timing summary\n", N, N);
     a70:	0000f537          	lui	a0,0xf
     a74:	10000593          	li	a1,256
     a78:	10000613          	li	a2,256
     a7c:	03c50513          	add	a0,a0,60 # f03c <__fini_array_end+0x7c>
     a80:	3e8000ef          	jal	e68 <printf>
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
     a84:	0000f537          	lui	a0,0xf
     a88:	05450513          	add	a0,a0,84 # f054 <__fini_array_end+0x94>
     a8c:	570000ef          	jal	ffc <puts>
  printf("-----+----------------+---------------+--------------+--------------\n");
     a90:	0000f537          	lui	a0,0xf
     a94:	09c50513          	add	a0,a0,156 # f09c <__fini_array_end+0xdc>
     a98:	564000ef          	jal	ffc <puts>
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     a9c:	01012783          	lw	a5,16(sp)
     aa0:	00c12683          	lw	a3,12(sp)
     aa4:	0000f537          	lui	a0,0xf
     aa8:	00090713          	mv	a4,s2
     aac:	00098613          	mv	a2,s3
     ab0:	0e450513          	add	a0,a0,228 # f0e4 <__fini_array_end+0x124>
     ab4:	3b4000ef          	jal	e68 <printf>
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     ab8:	01812783          	lw	a5,24(sp)
     abc:	01412683          	lw	a3,20(sp)
     ac0:	0000f537          	lui	a0,0xf
     ac4:	000d0713          	mv	a4,s10
     ac8:	000d8613          	mv	a2,s11
     acc:	11c50513          	add	a0,a0,284 # f11c <__fini_array_end+0x15c>
     ad0:	398000ef          	jal	e68 <printf>
     ad4:	01412683          	lw	a3,20(sp)
     ad8:	00c12583          	lw	a1,12(sp)
     adc:	000d8613          	mv	a2,s11
     ae0:	00098513          	mv	a0,s3
     ae4:	f28ff0ef          	jal	20c <print_speedup_fixed>
     ae8:	0000fb37          	lui	s6,0xf
     aec:	138b0513          	add	a0,s6,312 # f138 <__fini_array_end+0x178>
     af0:	378000ef          	jal	e68 <printf>
     af4:	01012583          	lw	a1,16(sp)
     af8:	01812683          	lw	a3,24(sp)
     afc:	000d0613          	mv	a2,s10
     b00:	00090513          	mv	a0,s2
     b04:	f08ff0ef          	jal	20c <print_speedup_fixed>
     b08:	00a00513          	li	a0,10
     b0c:	3ac000ef          	jal	eb8 <putchar>
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     b10:	0000f537          	lui	a0,0xf
     b14:	00048793          	mv	a5,s1
     b18:	000c0713          	mv	a4,s8
     b1c:	000c8613          	mv	a2,s9
     b20:	000a0693          	mv	a3,s4
     b24:	14450513          	add	a0,a0,324 # f144 <__fini_array_end+0x184>
     b28:	340000ef          	jal	e68 <printf>
     b2c:	00c12583          	lw	a1,12(sp)
     b30:	000c8613          	mv	a2,s9
     b34:	000a0693          	mv	a3,s4
     b38:	00098513          	mv	a0,s3
     b3c:	ed0ff0ef          	jal	20c <print_speedup_fixed>
     b40:	138b0513          	add	a0,s6,312
     b44:	324000ef          	jal	e68 <printf>
     b48:	01012583          	lw	a1,16(sp)
     b4c:	000c0613          	mv	a2,s8
     b50:	00048693          	mv	a3,s1
     b54:	00090513          	mv	a0,s2
     b58:	eb4ff0ef          	jal	20c <print_speedup_fixed>
     b5c:	00a00513          	li	a0,10
     b60:	358000ef          	jal	eb8 <putchar>
  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
     b64:	deae07b7          	lui	a5,0xdeae0
     b68:	0000f5b7          	lui	a1,0xf
     b6c:	ace78793          	add	a5,a5,-1330 # deadface <__crt0_ram_last+0x5ea5facf>
     b70:	fdc58613          	add	a2,a1,-36 # efdc <__fini_array_end+0x1c>
     b74:	00fb9663          	bne	s7,a5,b80 <main+0x360>
     b78:	0000f637          	lui	a2,0xf
     b7c:	fe460613          	add	a2,a2,-28 # efe4 <__fini_array_end+0x24>
     b80:	0000f537          	lui	a0,0xf
     b84:	fdc58593          	add	a1,a1,-36
     b88:	16050513          	add	a0,a0,352 # f160 <__fini_array_end+0x1a0>
     b8c:	2dc000ef          	jal	e68 <printf>

  return (ok_cfu && ok_cfs) ? 0 : 1;
}
     b90:	05c12083          	lw	ra,92(sp)
     b94:	05812403          	lw	s0,88(sp)
  return (ok_cfu && ok_cfs) ? 0 : 1;
     b98:	215207b7          	lui	a5,0x21520
     b9c:	53278793          	add	a5,a5,1330 # 21520532 <__neorv32_ram_size+0x214a0532>
     ba0:	00fb8533          	add	a0,s7,a5
}
     ba4:	05412483          	lw	s1,84(sp)
     ba8:	05012903          	lw	s2,80(sp)
     bac:	04c12983          	lw	s3,76(sp)
     bb0:	04812a03          	lw	s4,72(sp)
     bb4:	04412a83          	lw	s5,68(sp)
     bb8:	04012b03          	lw	s6,64(sp)
     bbc:	03c12b83          	lw	s7,60(sp)
     bc0:	03812c03          	lw	s8,56(sp)
     bc4:	03412c83          	lw	s9,52(sp)
     bc8:	03012d03          	lw	s10,48(sp)
     bcc:	02c12d83          	lw	s11,44(sp)
     bd0:	00153513          	seqz	a0,a0
     bd4:	06010113          	add	sp,sp,96
     bd8:	00008067          	ret

00000bdc <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     bdc:	fffff097          	auipc	ra,0xfffff
     be0:	57c08093          	add	ra,ra,1404 # 158 <__crt0_main_exit>
     be4:	00050513          	mv	a0,a0
     be8:	00008067          	ret

00000bec <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     bec:	fff00513          	li	a0,-1
     bf0:	00008067          	ret

00000bf4 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     bf4:	000027b7          	lui	a5,0x2
     bf8:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     bfc:	00000513          	li	a0,0
     c00:	00008067          	ret

00000c04 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     c04:	00100513          	li	a0,1
     c08:	00008067          	ret

00000c0c <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     c0c:	00100513          	li	a0,1
     c10:	00008067          	ret

00000c14 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     c14:	800007b7          	lui	a5,0x80000
     c18:	01600713          	li	a4,22
     c1c:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
  return -1;
}
     c20:	fff00513          	li	a0,-1
     c24:	00008067          	ret

00000c28 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     c28:	00000513          	li	a0,0
     c2c:	00008067          	ret

00000c30 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     c30:	fe010113          	add	sp,sp,-32
     c34:	00912a23          	sw	s1,20(sp)
     c38:	01212823          	sw	s2,16(sp)
     c3c:	00112e23          	sw	ra,28(sp)
     c40:	00812c23          	sw	s0,24(sp)
     c44:	01312623          	sw	s3,12(sp)
     c48:	01412423          	sw	s4,8(sp)
     c4c:	00058913          	mv	s2,a1
     c50:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     c54:	06051463          	bnez	a0,cbc <_read+0x8c>
     c58:	00050413          	mv	s0,a0
     c5c:	fff50537          	lui	a0,0xfff50
     c60:	1a0000ef          	jal	e00 <neorv32_uart_available>
     c64:	04050c63          	beqz	a0,cbc <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c68:	00a00993          	li	s3,10
     c6c:	00d00a13          	li	s4,13
    while (len--) {
     c70:	00941663          	bne	s0,s1,c7c <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     c74:	00048413          	mv	s0,s1
     c78:	0200006f          	j	c98 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     c7c:	fff50537          	lui	a0,0xfff50
     c80:	1d0000ef          	jal	e50 <neorv32_uart_getc>
      *ptr++ = c;
     c84:	008907b3          	add	a5,s2,s0
     c88:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     c8c:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c90:	01350463          	beq	a0,s3,c98 <_read+0x68>
     c94:	fd451ee3          	bne	a0,s4,c70 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     c98:	01c12083          	lw	ra,28(sp)
     c9c:	00040513          	mv	a0,s0
     ca0:	01812403          	lw	s0,24(sp)
     ca4:	01412483          	lw	s1,20(sp)
     ca8:	01012903          	lw	s2,16(sp)
     cac:	00c12983          	lw	s3,12(sp)
     cb0:	00812a03          	lw	s4,8(sp)
     cb4:	02010113          	add	sp,sp,32
     cb8:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     cbc:	fff60537          	lui	a0,0xfff60
     cc0:	140000ef          	jal	e00 <neorv32_uart_available>
  int read_cnt = 0;
     cc4:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     cc8:	02050863          	beqz	a0,cf8 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ccc:	00a00993          	li	s3,10
     cd0:	00d00a13          	li	s4,13
    while (len--) {
     cd4:	fa9400e3          	beq	s0,s1,c74 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     cd8:	fff60537          	lui	a0,0xfff60
     cdc:	174000ef          	jal	e50 <neorv32_uart_getc>
      *ptr++ = c;
     ce0:	008907b3          	add	a5,s2,s0
     ce4:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     ce8:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     cec:	fb3506e3          	beq	a0,s3,c98 <_read+0x68>
     cf0:	ff4512e3          	bne	a0,s4,cd4 <_read+0xa4>
     cf4:	fa5ff06f          	j	c98 <_read+0x68>
    errno = ENOSYS;
     cf8:	800007b7          	lui	a5,0x80000
     cfc:	05800713          	li	a4,88
     d00:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return -1;
     d04:	fff00413          	li	s0,-1
     d08:	f91ff06f          	j	c98 <_read+0x68>

00000d0c <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     d0c:	ff010113          	add	sp,sp,-16
     d10:	00812423          	sw	s0,8(sp)
     d14:	00912223          	sw	s1,4(sp)
     d18:	00112623          	sw	ra,12(sp)
     d1c:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     d20:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     d24:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     d28:	00058413          	mv	s0,a1
     d2c:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     d30:	04a7ec63          	bltu	a5,a0,d88 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     d34:	fff50537          	lui	a0,0xfff50
     d38:	0c8000ef          	jal	e00 <neorv32_uart_available>
     d3c:	00940933          	add	s2,s0,s1
     d40:	02051463          	bnez	a0,d68 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     d44:	800007b7          	lui	a5,0x80000
     d48:	05800713          	li	a4,88
     d4c:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
      return -1;
     d50:	fff00493          	li	s1,-1
     d54:	0180006f          	j	d6c <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     d58:	00044583          	lbu	a1,0(s0)
     d5c:	fff50537          	lui	a0,0xfff50
     d60:	00140413          	add	s0,s0,1
     d64:	0d8000ef          	jal	e3c <neorv32_uart_putc>
      while (len--) {
     d68:	fe8918e3          	bne	s2,s0,d58 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     d6c:	00c12083          	lw	ra,12(sp)
     d70:	00812403          	lw	s0,8(sp)
     d74:	00012903          	lw	s2,0(sp)
     d78:	00048513          	mv	a0,s1
     d7c:	00412483          	lw	s1,4(sp)
     d80:	01010113          	add	sp,sp,16
     d84:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     d88:	fff60537          	lui	a0,0xfff60
     d8c:	074000ef          	jal	e00 <neorv32_uart_available>
     d90:	00940933          	add	s2,s0,s1
     d94:	fa0508e3          	beqz	a0,d44 <_write+0x38>
    while (len--) {
     d98:	fd240ae3          	beq	s0,s2,d6c <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     d9c:	00044583          	lbu	a1,0(s0)
     da0:	fff60537          	lui	a0,0xfff60
     da4:	00140413          	add	s0,s0,1
     da8:	094000ef          	jal	e3c <neorv32_uart_putc>
      write_cnt++;
     dac:	fedff06f          	j	d98 <_write+0x8c>

00000db0 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     db0:	80000737          	lui	a4,0x80000
     db4:	71872683          	lw	a3,1816(a4) # 80000718 <curr_heap.0>
     db8:	80021637          	lui	a2,0x80021
void *_sbrk(int incr) {
     dbc:	00050793          	mv	a5,a0
     dc0:	09860613          	add	a2,a2,152 # 80021098 <__crt0_bss_end>
  if (curr_heap == NULL) {
     dc4:	00069463          	bnez	a3,dcc <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     dc8:	70c72c23          	sw	a2,1816(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     dcc:	800216b7          	lui	a3,0x80021
     dd0:	09868693          	add	a3,a3,152 # 80021098 <__crt0_bss_end>
     dd4:	00c69c63          	bne	a3,a2,dec <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     dd8:	800007b7          	lui	a5,0x80000
     ddc:	00c00713          	li	a4,12
     de0:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return (void*)-1; // error - no more memory
     de4:	fff00513          	li	a0,-1
     de8:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     dec:	71872503          	lw	a0,1816(a4)
     df0:	00f507b3          	add	a5,a0,a5
     df4:	fed7f2e3          	bgeu	a5,a3,dd8 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     df8:	70f72c23          	sw	a5,1816(a4)

  return (void*)prev_heap;
}
     dfc:	00008067          	ret

00000e00 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     e00:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     e04:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     e08:	00e51c63          	bne	a0,a4,e20 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     e0c:	fffe07b7          	lui	a5,0xfffe0
     e10:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     e14:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     e18:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     e1c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     e20:	fff60737          	lui	a4,0xfff60
    return 0;
     e24:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     e28:	fee79ae3          	bne	a5,a4,e1c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     e2c:	fffe07b7          	lui	a5,0xfffe0
     e30:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     e34:	020007b7          	lui	a5,0x2000
     e38:	fe1ff06f          	j	e18 <neorv32_uart_available+0x18>

00000e3c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     e3c:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     e40:	00a79713          	sll	a4,a5,0xa
     e44:	fe075ce3          	bgez	a4,e3c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     e48:	00b52223          	sw	a1,4(a0)
}
     e4c:	00008067          	ret

00000e50 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     e50:	00052783          	lw	a5,0(a0)
     e54:	00f79713          	sll	a4,a5,0xf
     e58:	fe075ce3          	bgez	a4,e50 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     e5c:	00452503          	lw	a0,4(a0)
}
     e60:	0ff57513          	zext.b	a0,a0
     e64:	00008067          	ret

00000e68 <printf>:
     e68:	fc010113          	add	sp,sp,-64
     e6c:	02c12423          	sw	a2,40(sp)
     e70:	02d12623          	sw	a3,44(sp)
     e74:	80000317          	auipc	t1,0x80000
     e78:	89432303          	lw	t1,-1900(t1) # 80000708 <_impure_ptr>
     e7c:	02b12223          	sw	a1,36(sp)
     e80:	02e12823          	sw	a4,48(sp)
     e84:	02f12a23          	sw	a5,52(sp)
     e88:	03012c23          	sw	a6,56(sp)
     e8c:	03112e23          	sw	a7,60(sp)
     e90:	00832583          	lw	a1,8(t1)
     e94:	02410693          	add	a3,sp,36
     e98:	00050613          	mv	a2,a0
     e9c:	00030513          	mv	a0,t1
     ea0:	00112e23          	sw	ra,28(sp)
     ea4:	00d12623          	sw	a3,12(sp)
     ea8:	0c8010ef          	jal	1f70 <_vfprintf_r>
     eac:	01c12083          	lw	ra,28(sp)
     eb0:	04010113          	add	sp,sp,64
     eb4:	00008067          	ret

00000eb8 <putchar>:
     eb8:	80000797          	auipc	a5,0x80000
     ebc:	8507a783          	lw	a5,-1968(a5) # 80000708 <_impure_ptr>
     ec0:	0087a603          	lw	a2,8(a5)
     ec4:	00050593          	mv	a1,a0
     ec8:	00078513          	mv	a0,a5
     ecc:	3c00606f          	j	728c <_putc_r>

00000ed0 <_puts_r>:
     ed0:	fd010113          	add	sp,sp,-48
     ed4:	02812423          	sw	s0,40(sp)
     ed8:	00050413          	mv	s0,a0
     edc:	00058513          	mv	a0,a1
     ee0:	02912223          	sw	s1,36(sp)
     ee4:	02112623          	sw	ra,44(sp)
     ee8:	00058493          	mv	s1,a1
     eec:	3b0000ef          	jal	129c <strlen>
     ef0:	00150713          	add	a4,a0,1
     ef4:	0000e697          	auipc	a3,0xe
     ef8:	22468693          	add	a3,a3,548 # f118 <__fini_array_end+0x158>
     efc:	00e12623          	sw	a4,12(sp)
     f00:	03442783          	lw	a5,52(s0)
     f04:	01010713          	add	a4,sp,16
     f08:	00d12c23          	sw	a3,24(sp)
     f0c:	00e12223          	sw	a4,4(sp)
     f10:	00100693          	li	a3,1
     f14:	00200713          	li	a4,2
     f18:	00912823          	sw	s1,16(sp)
     f1c:	00a12a23          	sw	a0,20(sp)
     f20:	00d12e23          	sw	a3,28(sp)
     f24:	00e12423          	sw	a4,8(sp)
     f28:	00842483          	lw	s1,8(s0)
     f2c:	0c078263          	beqz	a5,ff0 <_puts_r+0x120>
     f30:	0644a703          	lw	a4,100(s1)
     f34:	00c49783          	lh	a5,12(s1)
     f38:	00177713          	and	a4,a4,1
     f3c:	00071663          	bnez	a4,f48 <_puts_r+0x78>
     f40:	2007f713          	and	a4,a5,512
     f44:	08070e63          	beqz	a4,fe0 <_puts_r+0x110>
     f48:	01279713          	sll	a4,a5,0x12
     f4c:	02074263          	bltz	a4,f70 <_puts_r+0xa0>
     f50:	0644a703          	lw	a4,100(s1)
     f54:	ffffe6b7          	lui	a3,0xffffe
     f58:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     f5c:	00002637          	lui	a2,0x2
     f60:	00c7e7b3          	or	a5,a5,a2
     f64:	00d77733          	and	a4,a4,a3
     f68:	00f49623          	sh	a5,12(s1)
     f6c:	06e4a223          	sw	a4,100(s1)
     f70:	00040513          	mv	a0,s0
     f74:	00410613          	add	a2,sp,4
     f78:	00048593          	mv	a1,s1
     f7c:	549050ef          	jal	6cc4 <__sfvwrite_r>
     f80:	0644a783          	lw	a5,100(s1)
     f84:	00153413          	seqz	s0,a0
     f88:	40800433          	neg	s0,s0
     f8c:	00b47413          	and	s0,s0,11
     f90:	0017f793          	and	a5,a5,1
     f94:	fff40413          	add	s0,s0,-1
     f98:	00079863          	bnez	a5,fa8 <_puts_r+0xd8>
     f9c:	00c4d783          	lhu	a5,12(s1)
     fa0:	2007f793          	and	a5,a5,512
     fa4:	00078e63          	beqz	a5,fc0 <_puts_r+0xf0>
     fa8:	02c12083          	lw	ra,44(sp)
     fac:	00040513          	mv	a0,s0
     fb0:	02812403          	lw	s0,40(sp)
     fb4:	02412483          	lw	s1,36(sp)
     fb8:	03010113          	add	sp,sp,48
     fbc:	00008067          	ret
     fc0:	0584a503          	lw	a0,88(s1)
     fc4:	054000ef          	jal	1018 <__retarget_lock_release_recursive>
     fc8:	02c12083          	lw	ra,44(sp)
     fcc:	00040513          	mv	a0,s0
     fd0:	02812403          	lw	s0,40(sp)
     fd4:	02412483          	lw	s1,36(sp)
     fd8:	03010113          	add	sp,sp,48
     fdc:	00008067          	ret
     fe0:	0584a503          	lw	a0,88(s1)
     fe4:	030000ef          	jal	1014 <__retarget_lock_acquire_recursive>
     fe8:	00c49783          	lh	a5,12(s1)
     fec:	f5dff06f          	j	f48 <_puts_r+0x78>
     ff0:	00040513          	mv	a0,s0
     ff4:	449050ef          	jal	6c3c <__sinit>
     ff8:	f39ff06f          	j	f30 <_puts_r+0x60>

00000ffc <puts>:
     ffc:	00050593          	mv	a1,a0
    1000:	7ffff517          	auipc	a0,0x7ffff
    1004:	70852503          	lw	a0,1800(a0) # 80000708 <_impure_ptr>
    1008:	ec9ff06f          	j	ed0 <_puts_r>

0000100c <__retarget_lock_init_recursive>:
    100c:	00008067          	ret

00001010 <__retarget_lock_close_recursive>:
    1010:	00008067          	ret

00001014 <__retarget_lock_acquire_recursive>:
    1014:	00008067          	ret

00001018 <__retarget_lock_release_recursive>:
    1018:	00008067          	ret

0000101c <memset>:
    101c:	00f00313          	li	t1,15
    1020:	00050713          	mv	a4,a0
    1024:	02c37e63          	bgeu	t1,a2,1060 <memset+0x44>
    1028:	00f77793          	and	a5,a4,15
    102c:	0a079063          	bnez	a5,10cc <memset+0xb0>
    1030:	08059263          	bnez	a1,10b4 <memset+0x98>
    1034:	ff067693          	and	a3,a2,-16
    1038:	00f67613          	and	a2,a2,15
    103c:	00e686b3          	add	a3,a3,a4
    1040:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    1044:	00b72223          	sw	a1,4(a4)
    1048:	00b72423          	sw	a1,8(a4)
    104c:	00b72623          	sw	a1,12(a4)
    1050:	01070713          	add	a4,a4,16
    1054:	fed766e3          	bltu	a4,a3,1040 <memset+0x24>
    1058:	00061463          	bnez	a2,1060 <memset+0x44>
    105c:	00008067          	ret
    1060:	40c306b3          	sub	a3,t1,a2
    1064:	00269693          	sll	a3,a3,0x2
    1068:	00000297          	auipc	t0,0x0
    106c:	005686b3          	add	a3,a3,t0
    1070:	00c68067          	jr	12(a3)
    1074:	00b70723          	sb	a1,14(a4)
    1078:	00b706a3          	sb	a1,13(a4)
    107c:	00b70623          	sb	a1,12(a4)
    1080:	00b705a3          	sb	a1,11(a4)
    1084:	00b70523          	sb	a1,10(a4)
    1088:	00b704a3          	sb	a1,9(a4)
    108c:	00b70423          	sb	a1,8(a4)
    1090:	00b703a3          	sb	a1,7(a4)
    1094:	00b70323          	sb	a1,6(a4)
    1098:	00b702a3          	sb	a1,5(a4)
    109c:	00b70223          	sb	a1,4(a4)
    10a0:	00b701a3          	sb	a1,3(a4)
    10a4:	00b70123          	sb	a1,2(a4)
    10a8:	00b700a3          	sb	a1,1(a4)
    10ac:	00b70023          	sb	a1,0(a4)
    10b0:	00008067          	ret
    10b4:	0ff5f593          	zext.b	a1,a1
    10b8:	00859693          	sll	a3,a1,0x8
    10bc:	00d5e5b3          	or	a1,a1,a3
    10c0:	01059693          	sll	a3,a1,0x10
    10c4:	00d5e5b3          	or	a1,a1,a3
    10c8:	f6dff06f          	j	1034 <memset+0x18>
    10cc:	00279693          	sll	a3,a5,0x2
    10d0:	00000297          	auipc	t0,0x0
    10d4:	005686b3          	add	a3,a3,t0
    10d8:	00008293          	mv	t0,ra
    10dc:	fa0680e7          	jalr	-96(a3)
    10e0:	00028093          	mv	ra,t0
    10e4:	ff078793          	add	a5,a5,-16
    10e8:	40f70733          	sub	a4,a4,a5
    10ec:	00f60633          	add	a2,a2,a5
    10f0:	f6c378e3          	bgeu	t1,a2,1060 <memset+0x44>
    10f4:	f3dff06f          	j	1030 <memset+0x14>

000010f8 <memcpy>:
    10f8:	00a5c7b3          	xor	a5,a1,a0
    10fc:	0037f793          	and	a5,a5,3
    1100:	00c508b3          	add	a7,a0,a2
    1104:	06079463          	bnez	a5,116c <memcpy+0x74>
    1108:	00300793          	li	a5,3
    110c:	06c7f063          	bgeu	a5,a2,116c <memcpy+0x74>
    1110:	00357793          	and	a5,a0,3
    1114:	00050713          	mv	a4,a0
    1118:	06079a63          	bnez	a5,118c <memcpy+0x94>
    111c:	ffc8f613          	and	a2,a7,-4
    1120:	40e606b3          	sub	a3,a2,a4
    1124:	02000793          	li	a5,32
    1128:	08d7ce63          	blt	a5,a3,11c4 <memcpy+0xcc>
    112c:	00058693          	mv	a3,a1
    1130:	00070793          	mv	a5,a4
    1134:	02c77863          	bgeu	a4,a2,1164 <memcpy+0x6c>
    1138:	0006a803          	lw	a6,0(a3)
    113c:	00478793          	add	a5,a5,4
    1140:	00468693          	add	a3,a3,4
    1144:	ff07ae23          	sw	a6,-4(a5)
    1148:	fec7e8e3          	bltu	a5,a2,1138 <memcpy+0x40>
    114c:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x8f>
    1150:	40e787b3          	sub	a5,a5,a4
    1154:	ffc7f793          	and	a5,a5,-4
    1158:	00478793          	add	a5,a5,4
    115c:	00f70733          	add	a4,a4,a5
    1160:	00f585b3          	add	a1,a1,a5
    1164:	01176863          	bltu	a4,a7,1174 <memcpy+0x7c>
    1168:	00008067          	ret
    116c:	00050713          	mv	a4,a0
    1170:	05157863          	bgeu	a0,a7,11c0 <memcpy+0xc8>
    1174:	0005c783          	lbu	a5,0(a1)
    1178:	00170713          	add	a4,a4,1
    117c:	00158593          	add	a1,a1,1
    1180:	fef70fa3          	sb	a5,-1(a4)
    1184:	fee898e3          	bne	a7,a4,1174 <memcpy+0x7c>
    1188:	00008067          	ret
    118c:	0005c683          	lbu	a3,0(a1)
    1190:	00170713          	add	a4,a4,1
    1194:	00377793          	and	a5,a4,3
    1198:	fed70fa3          	sb	a3,-1(a4)
    119c:	00158593          	add	a1,a1,1
    11a0:	f6078ee3          	beqz	a5,111c <memcpy+0x24>
    11a4:	0005c683          	lbu	a3,0(a1)
    11a8:	00170713          	add	a4,a4,1
    11ac:	00377793          	and	a5,a4,3
    11b0:	fed70fa3          	sb	a3,-1(a4)
    11b4:	00158593          	add	a1,a1,1
    11b8:	fc079ae3          	bnez	a5,118c <memcpy+0x94>
    11bc:	f61ff06f          	j	111c <memcpy+0x24>
    11c0:	00008067          	ret
    11c4:	ff010113          	add	sp,sp,-16
    11c8:	00812623          	sw	s0,12(sp)
    11cc:	02000413          	li	s0,32
    11d0:	0005a383          	lw	t2,0(a1)
    11d4:	0045a283          	lw	t0,4(a1)
    11d8:	0085af83          	lw	t6,8(a1)
    11dc:	00c5af03          	lw	t5,12(a1)
    11e0:	0105ae83          	lw	t4,16(a1)
    11e4:	0145ae03          	lw	t3,20(a1)
    11e8:	0185a303          	lw	t1,24(a1)
    11ec:	01c5a803          	lw	a6,28(a1)
    11f0:	0205a683          	lw	a3,32(a1)
    11f4:	02470713          	add	a4,a4,36
    11f8:	40e607b3          	sub	a5,a2,a4
    11fc:	fc772e23          	sw	t2,-36(a4)
    1200:	fe572023          	sw	t0,-32(a4)
    1204:	fff72223          	sw	t6,-28(a4)
    1208:	ffe72423          	sw	t5,-24(a4)
    120c:	ffd72623          	sw	t4,-20(a4)
    1210:	ffc72823          	sw	t3,-16(a4)
    1214:	fe672a23          	sw	t1,-12(a4)
    1218:	ff072c23          	sw	a6,-8(a4)
    121c:	fed72e23          	sw	a3,-4(a4)
    1220:	02458593          	add	a1,a1,36
    1224:	faf446e3          	blt	s0,a5,11d0 <memcpy+0xd8>
    1228:	00058693          	mv	a3,a1
    122c:	00070793          	mv	a5,a4
    1230:	02c77863          	bgeu	a4,a2,1260 <memcpy+0x168>
    1234:	0006a803          	lw	a6,0(a3)
    1238:	00478793          	add	a5,a5,4
    123c:	00468693          	add	a3,a3,4
    1240:	ff07ae23          	sw	a6,-4(a5)
    1244:	fec7e8e3          	bltu	a5,a2,1234 <memcpy+0x13c>
    1248:	fff60793          	add	a5,a2,-1
    124c:	40e787b3          	sub	a5,a5,a4
    1250:	ffc7f793          	and	a5,a5,-4
    1254:	00478793          	add	a5,a5,4
    1258:	00f70733          	add	a4,a4,a5
    125c:	00f585b3          	add	a1,a1,a5
    1260:	01176863          	bltu	a4,a7,1270 <memcpy+0x178>
    1264:	00c12403          	lw	s0,12(sp)
    1268:	01010113          	add	sp,sp,16
    126c:	00008067          	ret
    1270:	0005c783          	lbu	a5,0(a1)
    1274:	00170713          	add	a4,a4,1
    1278:	00158593          	add	a1,a1,1
    127c:	fef70fa3          	sb	a5,-1(a4)
    1280:	fee882e3          	beq	a7,a4,1264 <memcpy+0x16c>
    1284:	0005c783          	lbu	a5,0(a1)
    1288:	00170713          	add	a4,a4,1
    128c:	00158593          	add	a1,a1,1
    1290:	fef70fa3          	sb	a5,-1(a4)
    1294:	fce89ee3          	bne	a7,a4,1270 <memcpy+0x178>
    1298:	fcdff06f          	j	1264 <memcpy+0x16c>

0000129c <strlen>:
    129c:	00357793          	and	a5,a0,3
    12a0:	00050713          	mv	a4,a0
    12a4:	04079c63          	bnez	a5,12fc <strlen+0x60>
    12a8:	7f7f86b7          	lui	a3,0x7f7f8
    12ac:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    12b0:	fff00593          	li	a1,-1
    12b4:	00072603          	lw	a2,0(a4)
    12b8:	00470713          	add	a4,a4,4
    12bc:	00d677b3          	and	a5,a2,a3
    12c0:	00d787b3          	add	a5,a5,a3
    12c4:	00c7e7b3          	or	a5,a5,a2
    12c8:	00d7e7b3          	or	a5,a5,a3
    12cc:	feb784e3          	beq	a5,a1,12b4 <strlen+0x18>
    12d0:	ffc74683          	lbu	a3,-4(a4)
    12d4:	40a707b3          	sub	a5,a4,a0
    12d8:	04068463          	beqz	a3,1320 <strlen+0x84>
    12dc:	ffd74683          	lbu	a3,-3(a4)
    12e0:	02068c63          	beqz	a3,1318 <strlen+0x7c>
    12e4:	ffe74503          	lbu	a0,-2(a4)
    12e8:	00a03533          	snez	a0,a0
    12ec:	00f50533          	add	a0,a0,a5
    12f0:	ffe50513          	add	a0,a0,-2
    12f4:	00008067          	ret
    12f8:	fa0688e3          	beqz	a3,12a8 <strlen+0xc>
    12fc:	00074783          	lbu	a5,0(a4)
    1300:	00170713          	add	a4,a4,1
    1304:	00377693          	and	a3,a4,3
    1308:	fe0798e3          	bnez	a5,12f8 <strlen+0x5c>
    130c:	40a70733          	sub	a4,a4,a0
    1310:	fff70513          	add	a0,a4,-1
    1314:	00008067          	ret
    1318:	ffd78513          	add	a0,a5,-3
    131c:	00008067          	ret
    1320:	ffc78513          	add	a0,a5,-4
    1324:	00008067          	ret

00001328 <_malloc_trim_r>:
    1328:	fe010113          	add	sp,sp,-32
    132c:	00812c23          	sw	s0,24(sp)
    1330:	00912a23          	sw	s1,20(sp)
    1334:	01212823          	sw	s2,16(sp)
    1338:	01312623          	sw	s3,12(sp)
    133c:	01412423          	sw	s4,8(sp)
    1340:	00058993          	mv	s3,a1
    1344:	00112e23          	sw	ra,28(sp)
    1348:	00050913          	mv	s2,a0
    134c:	7ffffa17          	auipc	s4,0x7ffff
    1350:	dd4a0a13          	add	s4,s4,-556 # 80000120 <__malloc_av_>
    1354:	405000ef          	jal	1f58 <__malloc_lock>
    1358:	008a2703          	lw	a4,8(s4)
    135c:	000017b7          	lui	a5,0x1
    1360:	fef78793          	add	a5,a5,-17 # fef <_puts_r+0x11f>
    1364:	00472483          	lw	s1,4(a4)
    1368:	00001737          	lui	a4,0x1
    136c:	ffc4f493          	and	s1,s1,-4
    1370:	00f48433          	add	s0,s1,a5
    1374:	41340433          	sub	s0,s0,s3
    1378:	00c45413          	srl	s0,s0,0xc
    137c:	fff40413          	add	s0,s0,-1
    1380:	00c41413          	sll	s0,s0,0xc
    1384:	00e44e63          	blt	s0,a4,13a0 <_malloc_trim_r+0x78>
    1388:	00000593          	li	a1,0
    138c:	00090513          	mv	a0,s2
    1390:	105060ef          	jal	7c94 <_sbrk_r>
    1394:	008a2783          	lw	a5,8(s4)
    1398:	009787b3          	add	a5,a5,s1
    139c:	02f50863          	beq	a0,a5,13cc <_malloc_trim_r+0xa4>
    13a0:	00090513          	mv	a0,s2
    13a4:	3c1000ef          	jal	1f64 <__malloc_unlock>
    13a8:	01c12083          	lw	ra,28(sp)
    13ac:	01812403          	lw	s0,24(sp)
    13b0:	01412483          	lw	s1,20(sp)
    13b4:	01012903          	lw	s2,16(sp)
    13b8:	00c12983          	lw	s3,12(sp)
    13bc:	00812a03          	lw	s4,8(sp)
    13c0:	00000513          	li	a0,0
    13c4:	02010113          	add	sp,sp,32
    13c8:	00008067          	ret
    13cc:	408005b3          	neg	a1,s0
    13d0:	00090513          	mv	a0,s2
    13d4:	0c1060ef          	jal	7c94 <_sbrk_r>
    13d8:	fff00793          	li	a5,-1
    13dc:	04f50a63          	beq	a0,a5,1430 <_malloc_trim_r+0x108>
    13e0:	80020717          	auipc	a4,0x80020
    13e4:	b5870713          	add	a4,a4,-1192 # 80020f38 <__malloc_current_mallinfo>
    13e8:	00072783          	lw	a5,0(a4)
    13ec:	008a2683          	lw	a3,8(s4)
    13f0:	408484b3          	sub	s1,s1,s0
    13f4:	0014e493          	or	s1,s1,1
    13f8:	408787b3          	sub	a5,a5,s0
    13fc:	00090513          	mv	a0,s2
    1400:	0096a223          	sw	s1,4(a3)
    1404:	00f72023          	sw	a5,0(a4)
    1408:	35d000ef          	jal	1f64 <__malloc_unlock>
    140c:	01c12083          	lw	ra,28(sp)
    1410:	01812403          	lw	s0,24(sp)
    1414:	01412483          	lw	s1,20(sp)
    1418:	01012903          	lw	s2,16(sp)
    141c:	00c12983          	lw	s3,12(sp)
    1420:	00812a03          	lw	s4,8(sp)
    1424:	00100513          	li	a0,1
    1428:	02010113          	add	sp,sp,32
    142c:	00008067          	ret
    1430:	00000593          	li	a1,0
    1434:	00090513          	mv	a0,s2
    1438:	05d060ef          	jal	7c94 <_sbrk_r>
    143c:	008a2703          	lw	a4,8(s4)
    1440:	00f00693          	li	a3,15
    1444:	40e507b3          	sub	a5,a0,a4
    1448:	f4f6dce3          	bge	a3,a5,13a0 <_malloc_trim_r+0x78>
    144c:	7ffff697          	auipc	a3,0x7ffff
    1450:	2c06a683          	lw	a3,704(a3) # 8000070c <__malloc_sbrk_base>
    1454:	40d50533          	sub	a0,a0,a3
    1458:	0017e793          	or	a5,a5,1
    145c:	80020697          	auipc	a3,0x80020
    1460:	aca6ae23          	sw	a0,-1316(a3) # 80020f38 <__malloc_current_mallinfo>
    1464:	00f72223          	sw	a5,4(a4)
    1468:	f39ff06f          	j	13a0 <_malloc_trim_r+0x78>

0000146c <_free_r>:
    146c:	18058263          	beqz	a1,15f0 <_free_r+0x184>
    1470:	ff010113          	add	sp,sp,-16
    1474:	00812423          	sw	s0,8(sp)
    1478:	00912223          	sw	s1,4(sp)
    147c:	00058413          	mv	s0,a1
    1480:	00050493          	mv	s1,a0
    1484:	00112623          	sw	ra,12(sp)
    1488:	2d1000ef          	jal	1f58 <__malloc_lock>
    148c:	ffc42583          	lw	a1,-4(s0)
    1490:	ff840713          	add	a4,s0,-8
    1494:	7ffff517          	auipc	a0,0x7ffff
    1498:	c8c50513          	add	a0,a0,-884 # 80000120 <__malloc_av_>
    149c:	ffe5f793          	and	a5,a1,-2
    14a0:	00f70633          	add	a2,a4,a5
    14a4:	00462683          	lw	a3,4(a2)
    14a8:	00852803          	lw	a6,8(a0)
    14ac:	ffc6f693          	and	a3,a3,-4
    14b0:	1ac80263          	beq	a6,a2,1654 <_free_r+0x1e8>
    14b4:	00d62223          	sw	a3,4(a2)
    14b8:	0015f593          	and	a1,a1,1
    14bc:	00d60833          	add	a6,a2,a3
    14c0:	0a059063          	bnez	a1,1560 <_free_r+0xf4>
    14c4:	ff842303          	lw	t1,-8(s0)
    14c8:	00482583          	lw	a1,4(a6)
    14cc:	7ffff897          	auipc	a7,0x7ffff
    14d0:	c5c88893          	add	a7,a7,-932 # 80000128 <__malloc_av_+0x8>
    14d4:	40670733          	sub	a4,a4,t1
    14d8:	00872803          	lw	a6,8(a4)
    14dc:	006787b3          	add	a5,a5,t1
    14e0:	0015f593          	and	a1,a1,1
    14e4:	15180263          	beq	a6,a7,1628 <_free_r+0x1bc>
    14e8:	00c72303          	lw	t1,12(a4)
    14ec:	00682623          	sw	t1,12(a6)
    14f0:	01032423          	sw	a6,8(t1)
    14f4:	1a058a63          	beqz	a1,16a8 <_free_r+0x23c>
    14f8:	0017e693          	or	a3,a5,1
    14fc:	00d72223          	sw	a3,4(a4)
    1500:	00f62023          	sw	a5,0(a2)
    1504:	1ff00693          	li	a3,511
    1508:	06f6ec63          	bltu	a3,a5,1580 <_free_r+0x114>
    150c:	ff87f693          	and	a3,a5,-8
    1510:	00868693          	add	a3,a3,8
    1514:	00452583          	lw	a1,4(a0)
    1518:	00d506b3          	add	a3,a0,a3
    151c:	0006a603          	lw	a2,0(a3)
    1520:	0057d813          	srl	a6,a5,0x5
    1524:	00100793          	li	a5,1
    1528:	010797b3          	sll	a5,a5,a6
    152c:	00b7e7b3          	or	a5,a5,a1
    1530:	ff868593          	add	a1,a3,-8
    1534:	00b72623          	sw	a1,12(a4)
    1538:	00c72423          	sw	a2,8(a4)
    153c:	00f52223          	sw	a5,4(a0)
    1540:	00e6a023          	sw	a4,0(a3)
    1544:	00e62623          	sw	a4,12(a2)
    1548:	00812403          	lw	s0,8(sp)
    154c:	00c12083          	lw	ra,12(sp)
    1550:	00048513          	mv	a0,s1
    1554:	00412483          	lw	s1,4(sp)
    1558:	01010113          	add	sp,sp,16
    155c:	2090006f          	j	1f64 <__malloc_unlock>
    1560:	00482583          	lw	a1,4(a6)
    1564:	0015f593          	and	a1,a1,1
    1568:	08058663          	beqz	a1,15f4 <_free_r+0x188>
    156c:	0017e693          	or	a3,a5,1
    1570:	fed42e23          	sw	a3,-4(s0)
    1574:	00f62023          	sw	a5,0(a2)
    1578:	1ff00693          	li	a3,511
    157c:	f8f6f8e3          	bgeu	a3,a5,150c <_free_r+0xa0>
    1580:	0097d693          	srl	a3,a5,0x9
    1584:	00400613          	li	a2,4
    1588:	12d66463          	bltu	a2,a3,16b0 <_free_r+0x244>
    158c:	0067d693          	srl	a3,a5,0x6
    1590:	03968593          	add	a1,a3,57
    1594:	03868613          	add	a2,a3,56
    1598:	00359593          	sll	a1,a1,0x3
    159c:	00b505b3          	add	a1,a0,a1
    15a0:	0005a683          	lw	a3,0(a1)
    15a4:	ff858593          	add	a1,a1,-8
    15a8:	00d59863          	bne	a1,a3,15b8 <_free_r+0x14c>
    15ac:	15c0006f          	j	1708 <_free_r+0x29c>
    15b0:	0086a683          	lw	a3,8(a3)
    15b4:	00d58863          	beq	a1,a3,15c4 <_free_r+0x158>
    15b8:	0046a603          	lw	a2,4(a3)
    15bc:	ffc67613          	and	a2,a2,-4
    15c0:	fec7e8e3          	bltu	a5,a2,15b0 <_free_r+0x144>
    15c4:	00c6a583          	lw	a1,12(a3)
    15c8:	00b72623          	sw	a1,12(a4)
    15cc:	00d72423          	sw	a3,8(a4)
    15d0:	00812403          	lw	s0,8(sp)
    15d4:	00c12083          	lw	ra,12(sp)
    15d8:	00e5a423          	sw	a4,8(a1)
    15dc:	00048513          	mv	a0,s1
    15e0:	00412483          	lw	s1,4(sp)
    15e4:	00e6a623          	sw	a4,12(a3)
    15e8:	01010113          	add	sp,sp,16
    15ec:	1790006f          	j	1f64 <__malloc_unlock>
    15f0:	00008067          	ret
    15f4:	00d787b3          	add	a5,a5,a3
    15f8:	7ffff897          	auipc	a7,0x7ffff
    15fc:	b3088893          	add	a7,a7,-1232 # 80000128 <__malloc_av_+0x8>
    1600:	00862683          	lw	a3,8(a2)
    1604:	0f168063          	beq	a3,a7,16e4 <_free_r+0x278>
    1608:	00c62803          	lw	a6,12(a2)
    160c:	0017e593          	or	a1,a5,1
    1610:	00f70633          	add	a2,a4,a5
    1614:	0106a623          	sw	a6,12(a3)
    1618:	00d82423          	sw	a3,8(a6)
    161c:	00b72223          	sw	a1,4(a4)
    1620:	00f62023          	sw	a5,0(a2)
    1624:	ee1ff06f          	j	1504 <_free_r+0x98>
    1628:	14059063          	bnez	a1,1768 <_free_r+0x2fc>
    162c:	00862583          	lw	a1,8(a2)
    1630:	00c62603          	lw	a2,12(a2)
    1634:	00f686b3          	add	a3,a3,a5
    1638:	0016e793          	or	a5,a3,1
    163c:	00c5a623          	sw	a2,12(a1)
    1640:	00b62423          	sw	a1,8(a2)
    1644:	00f72223          	sw	a5,4(a4)
    1648:	00d70733          	add	a4,a4,a3
    164c:	00d72023          	sw	a3,0(a4)
    1650:	ef9ff06f          	j	1548 <_free_r+0xdc>
    1654:	0015f593          	and	a1,a1,1
    1658:	00d786b3          	add	a3,a5,a3
    165c:	02059063          	bnez	a1,167c <_free_r+0x210>
    1660:	ff842583          	lw	a1,-8(s0)
    1664:	40b70733          	sub	a4,a4,a1
    1668:	00c72783          	lw	a5,12(a4)
    166c:	00872603          	lw	a2,8(a4)
    1670:	00b686b3          	add	a3,a3,a1
    1674:	00f62623          	sw	a5,12(a2)
    1678:	00c7a423          	sw	a2,8(a5)
    167c:	0016e793          	or	a5,a3,1
    1680:	00f72223          	sw	a5,4(a4)
    1684:	00e52423          	sw	a4,8(a0)
    1688:	7ffff797          	auipc	a5,0x7ffff
    168c:	0887a783          	lw	a5,136(a5) # 80000710 <__malloc_trim_threshold>
    1690:	eaf6ece3          	bltu	a3,a5,1548 <_free_r+0xdc>
    1694:	7ffff597          	auipc	a1,0x7ffff
    1698:	09c5a583          	lw	a1,156(a1) # 80000730 <__malloc_top_pad>
    169c:	00048513          	mv	a0,s1
    16a0:	c89ff0ef          	jal	1328 <_malloc_trim_r>
    16a4:	ea5ff06f          	j	1548 <_free_r+0xdc>
    16a8:	00d787b3          	add	a5,a5,a3
    16ac:	f55ff06f          	j	1600 <_free_r+0x194>
    16b0:	01400613          	li	a2,20
    16b4:	02d67063          	bgeu	a2,a3,16d4 <_free_r+0x268>
    16b8:	05400613          	li	a2,84
    16bc:	06d66463          	bltu	a2,a3,1724 <_free_r+0x2b8>
    16c0:	00c7d693          	srl	a3,a5,0xc
    16c4:	06f68593          	add	a1,a3,111
    16c8:	06e68613          	add	a2,a3,110
    16cc:	00359593          	sll	a1,a1,0x3
    16d0:	ecdff06f          	j	159c <_free_r+0x130>
    16d4:	05c68593          	add	a1,a3,92
    16d8:	05b68613          	add	a2,a3,91
    16dc:	00359593          	sll	a1,a1,0x3
    16e0:	ebdff06f          	j	159c <_free_r+0x130>
    16e4:	00e52a23          	sw	a4,20(a0)
    16e8:	00e52823          	sw	a4,16(a0)
    16ec:	0017e693          	or	a3,a5,1
    16f0:	01172623          	sw	a7,12(a4)
    16f4:	01172423          	sw	a7,8(a4)
    16f8:	00d72223          	sw	a3,4(a4)
    16fc:	00f70733          	add	a4,a4,a5
    1700:	00f72023          	sw	a5,0(a4)
    1704:	e45ff06f          	j	1548 <_free_r+0xdc>
    1708:	00452803          	lw	a6,4(a0)
    170c:	40265613          	sra	a2,a2,0x2
    1710:	00100793          	li	a5,1
    1714:	00c797b3          	sll	a5,a5,a2
    1718:	0107e7b3          	or	a5,a5,a6
    171c:	00f52223          	sw	a5,4(a0)
    1720:	ea9ff06f          	j	15c8 <_free_r+0x15c>
    1724:	15400613          	li	a2,340
    1728:	00d66c63          	bltu	a2,a3,1740 <_free_r+0x2d4>
    172c:	00f7d693          	srl	a3,a5,0xf
    1730:	07868593          	add	a1,a3,120
    1734:	07768613          	add	a2,a3,119
    1738:	00359593          	sll	a1,a1,0x3
    173c:	e61ff06f          	j	159c <_free_r+0x130>
    1740:	55400613          	li	a2,1364
    1744:	00d66c63          	bltu	a2,a3,175c <_free_r+0x2f0>
    1748:	0127d693          	srl	a3,a5,0x12
    174c:	07d68593          	add	a1,a3,125
    1750:	07c68613          	add	a2,a3,124
    1754:	00359593          	sll	a1,a1,0x3
    1758:	e45ff06f          	j	159c <_free_r+0x130>
    175c:	3f800593          	li	a1,1016
    1760:	07e00613          	li	a2,126
    1764:	e39ff06f          	j	159c <_free_r+0x130>
    1768:	0017e693          	or	a3,a5,1
    176c:	00d72223          	sw	a3,4(a4)
    1770:	00f62023          	sw	a5,0(a2)
    1774:	dd5ff06f          	j	1548 <_free_r+0xdc>

00001778 <_malloc_r>:
    1778:	fd010113          	add	sp,sp,-48
    177c:	03212023          	sw	s2,32(sp)
    1780:	02112623          	sw	ra,44(sp)
    1784:	02812423          	sw	s0,40(sp)
    1788:	02912223          	sw	s1,36(sp)
    178c:	01312e23          	sw	s3,28(sp)
    1790:	00b58793          	add	a5,a1,11
    1794:	01600713          	li	a4,22
    1798:	00050913          	mv	s2,a0
    179c:	08f76263          	bltu	a4,a5,1820 <_malloc_r+0xa8>
    17a0:	01000793          	li	a5,16
    17a4:	20b7e663          	bltu	a5,a1,19b0 <_malloc_r+0x238>
    17a8:	7b0000ef          	jal	1f58 <__malloc_lock>
    17ac:	01800793          	li	a5,24
    17b0:	00200593          	li	a1,2
    17b4:	01000493          	li	s1,16
    17b8:	7ffff997          	auipc	s3,0x7ffff
    17bc:	96898993          	add	s3,s3,-1688 # 80000120 <__malloc_av_>
    17c0:	00f987b3          	add	a5,s3,a5
    17c4:	0047a403          	lw	s0,4(a5)
    17c8:	ff878713          	add	a4,a5,-8
    17cc:	36e40463          	beq	s0,a4,1b34 <_malloc_r+0x3bc>
    17d0:	00442783          	lw	a5,4(s0)
    17d4:	00c42683          	lw	a3,12(s0)
    17d8:	00842603          	lw	a2,8(s0)
    17dc:	ffc7f793          	and	a5,a5,-4
    17e0:	00f407b3          	add	a5,s0,a5
    17e4:	0047a703          	lw	a4,4(a5)
    17e8:	00d62623          	sw	a3,12(a2)
    17ec:	00c6a423          	sw	a2,8(a3)
    17f0:	00176713          	or	a4,a4,1
    17f4:	00090513          	mv	a0,s2
    17f8:	00e7a223          	sw	a4,4(a5)
    17fc:	768000ef          	jal	1f64 <__malloc_unlock>
    1800:	00840513          	add	a0,s0,8
    1804:	02c12083          	lw	ra,44(sp)
    1808:	02812403          	lw	s0,40(sp)
    180c:	02412483          	lw	s1,36(sp)
    1810:	02012903          	lw	s2,32(sp)
    1814:	01c12983          	lw	s3,28(sp)
    1818:	03010113          	add	sp,sp,48
    181c:	00008067          	ret
    1820:	ff87f493          	and	s1,a5,-8
    1824:	1807c663          	bltz	a5,19b0 <_malloc_r+0x238>
    1828:	18b4e463          	bltu	s1,a1,19b0 <_malloc_r+0x238>
    182c:	72c000ef          	jal	1f58 <__malloc_lock>
    1830:	1f700793          	li	a5,503
    1834:	4097fa63          	bgeu	a5,s1,1c48 <_malloc_r+0x4d0>
    1838:	0094d793          	srl	a5,s1,0x9
    183c:	18078263          	beqz	a5,19c0 <_malloc_r+0x248>
    1840:	00400713          	li	a4,4
    1844:	36f76063          	bltu	a4,a5,1ba4 <_malloc_r+0x42c>
    1848:	0064d793          	srl	a5,s1,0x6
    184c:	03978593          	add	a1,a5,57
    1850:	03878813          	add	a6,a5,56
    1854:	00359613          	sll	a2,a1,0x3
    1858:	7ffff997          	auipc	s3,0x7ffff
    185c:	8c898993          	add	s3,s3,-1848 # 80000120 <__malloc_av_>
    1860:	00c98633          	add	a2,s3,a2
    1864:	00462403          	lw	s0,4(a2)
    1868:	ff860613          	add	a2,a2,-8
    186c:	02860863          	beq	a2,s0,189c <_malloc_r+0x124>
    1870:	00f00513          	li	a0,15
    1874:	0140006f          	j	1888 <_malloc_r+0x110>
    1878:	00c42683          	lw	a3,12(s0)
    187c:	2a075863          	bgez	a4,1b2c <_malloc_r+0x3b4>
    1880:	00d60e63          	beq	a2,a3,189c <_malloc_r+0x124>
    1884:	00068413          	mv	s0,a3
    1888:	00442783          	lw	a5,4(s0)
    188c:	ffc7f793          	and	a5,a5,-4
    1890:	40978733          	sub	a4,a5,s1
    1894:	fee552e3          	bge	a0,a4,1878 <_malloc_r+0x100>
    1898:	00080593          	mv	a1,a6
    189c:	0109a403          	lw	s0,16(s3)
    18a0:	7ffff897          	auipc	a7,0x7ffff
    18a4:	88888893          	add	a7,a7,-1912 # 80000128 <__malloc_av_+0x8>
    18a8:	27140e63          	beq	s0,a7,1b24 <_malloc_r+0x3ac>
    18ac:	00442783          	lw	a5,4(s0)
    18b0:	00f00693          	li	a3,15
    18b4:	ffc7f793          	and	a5,a5,-4
    18b8:	40978733          	sub	a4,a5,s1
    18bc:	38e6cc63          	blt	a3,a4,1c54 <_malloc_r+0x4dc>
    18c0:	0119aa23          	sw	a7,20(s3)
    18c4:	0119a823          	sw	a7,16(s3)
    18c8:	36075063          	bgez	a4,1c28 <_malloc_r+0x4b0>
    18cc:	1ff00713          	li	a4,511
    18d0:	0049a503          	lw	a0,4(s3)
    18d4:	26f76863          	bltu	a4,a5,1b44 <_malloc_r+0x3cc>
    18d8:	ff87f713          	and	a4,a5,-8
    18dc:	00870713          	add	a4,a4,8
    18e0:	00e98733          	add	a4,s3,a4
    18e4:	00072683          	lw	a3,0(a4)
    18e8:	0057d613          	srl	a2,a5,0x5
    18ec:	00100793          	li	a5,1
    18f0:	00c797b3          	sll	a5,a5,a2
    18f4:	00f56533          	or	a0,a0,a5
    18f8:	ff870793          	add	a5,a4,-8
    18fc:	00f42623          	sw	a5,12(s0)
    1900:	00d42423          	sw	a3,8(s0)
    1904:	00a9a223          	sw	a0,4(s3)
    1908:	00872023          	sw	s0,0(a4)
    190c:	0086a623          	sw	s0,12(a3)
    1910:	4025d793          	sra	a5,a1,0x2
    1914:	00100613          	li	a2,1
    1918:	00f61633          	sll	a2,a2,a5
    191c:	0ac56a63          	bltu	a0,a2,19d0 <_malloc_r+0x258>
    1920:	00a677b3          	and	a5,a2,a0
    1924:	02079463          	bnez	a5,194c <_malloc_r+0x1d4>
    1928:	00161613          	sll	a2,a2,0x1
    192c:	ffc5f593          	and	a1,a1,-4
    1930:	00a677b3          	and	a5,a2,a0
    1934:	00458593          	add	a1,a1,4
    1938:	00079a63          	bnez	a5,194c <_malloc_r+0x1d4>
    193c:	00161613          	sll	a2,a2,0x1
    1940:	00a677b3          	and	a5,a2,a0
    1944:	00458593          	add	a1,a1,4
    1948:	fe078ae3          	beqz	a5,193c <_malloc_r+0x1c4>
    194c:	00f00813          	li	a6,15
    1950:	00359313          	sll	t1,a1,0x3
    1954:	00698333          	add	t1,s3,t1
    1958:	00030513          	mv	a0,t1
    195c:	00c52783          	lw	a5,12(a0)
    1960:	00058e13          	mv	t3,a1
    1964:	26f50263          	beq	a0,a5,1bc8 <_malloc_r+0x450>
    1968:	0047a703          	lw	a4,4(a5)
    196c:	00078413          	mv	s0,a5
    1970:	00c7a783          	lw	a5,12(a5)
    1974:	ffc77713          	and	a4,a4,-4
    1978:	409706b3          	sub	a3,a4,s1
    197c:	26d84263          	blt	a6,a3,1be0 <_malloc_r+0x468>
    1980:	fe06c2e3          	bltz	a3,1964 <_malloc_r+0x1ec>
    1984:	00e40733          	add	a4,s0,a4
    1988:	00472683          	lw	a3,4(a4)
    198c:	00842603          	lw	a2,8(s0)
    1990:	00090513          	mv	a0,s2
    1994:	0016e693          	or	a3,a3,1
    1998:	00d72223          	sw	a3,4(a4)
    199c:	00f62623          	sw	a5,12(a2)
    19a0:	00c7a423          	sw	a2,8(a5)
    19a4:	5c0000ef          	jal	1f64 <__malloc_unlock>
    19a8:	00840513          	add	a0,s0,8
    19ac:	e59ff06f          	j	1804 <_malloc_r+0x8c>
    19b0:	00c00793          	li	a5,12
    19b4:	00f92023          	sw	a5,0(s2)
    19b8:	00000513          	li	a0,0
    19bc:	e49ff06f          	j	1804 <_malloc_r+0x8c>
    19c0:	20000613          	li	a2,512
    19c4:	04000593          	li	a1,64
    19c8:	03f00813          	li	a6,63
    19cc:	e8dff06f          	j	1858 <_malloc_r+0xe0>
    19d0:	0089a403          	lw	s0,8(s3)
    19d4:	01612823          	sw	s6,16(sp)
    19d8:	00442783          	lw	a5,4(s0)
    19dc:	ffc7fb13          	and	s6,a5,-4
    19e0:	009b6863          	bltu	s6,s1,19f0 <_malloc_r+0x278>
    19e4:	409b0733          	sub	a4,s6,s1
    19e8:	00f00793          	li	a5,15
    19ec:	0ee7ca63          	blt	a5,a4,1ae0 <_malloc_r+0x368>
    19f0:	01912223          	sw	s9,4(sp)
    19f4:	7ffffc97          	auipc	s9,0x7ffff
    19f8:	d18c8c93          	add	s9,s9,-744 # 8000070c <__malloc_sbrk_base>
    19fc:	000ca703          	lw	a4,0(s9)
    1a00:	01412c23          	sw	s4,24(sp)
    1a04:	01512a23          	sw	s5,20(sp)
    1a08:	01712623          	sw	s7,12(sp)
    1a0c:	7ffffa97          	auipc	s5,0x7ffff
    1a10:	d24aaa83          	lw	s5,-732(s5) # 80000730 <__malloc_top_pad>
    1a14:	fff00793          	li	a5,-1
    1a18:	01640a33          	add	s4,s0,s6
    1a1c:	01548ab3          	add	s5,s1,s5
    1a20:	3ef70263          	beq	a4,a5,1e04 <_malloc_r+0x68c>
    1a24:	000017b7          	lui	a5,0x1
    1a28:	00f78793          	add	a5,a5,15 # 100f <__retarget_lock_init_recursive+0x3>
    1a2c:	00fa8ab3          	add	s5,s5,a5
    1a30:	fffff7b7          	lui	a5,0xfffff
    1a34:	00fafab3          	and	s5,s5,a5
    1a38:	000a8593          	mv	a1,s5
    1a3c:	00090513          	mv	a0,s2
    1a40:	254060ef          	jal	7c94 <_sbrk_r>
    1a44:	fff00793          	li	a5,-1
    1a48:	00050b93          	mv	s7,a0
    1a4c:	46f50663          	beq	a0,a5,1eb8 <_malloc_r+0x740>
    1a50:	01812423          	sw	s8,8(sp)
    1a54:	25456863          	bltu	a0,s4,1ca4 <_malloc_r+0x52c>
    1a58:	8001fc17          	auipc	s8,0x8001f
    1a5c:	4e0c0c13          	add	s8,s8,1248 # 80020f38 <__malloc_current_mallinfo>
    1a60:	000c2583          	lw	a1,0(s8)
    1a64:	00ba85b3          	add	a1,s5,a1
    1a68:	00bc2023          	sw	a1,0(s8)
    1a6c:	00058713          	mv	a4,a1
    1a70:	2caa1063          	bne	s4,a0,1d30 <_malloc_r+0x5b8>
    1a74:	01451793          	sll	a5,a0,0x14
    1a78:	2a079c63          	bnez	a5,1d30 <_malloc_r+0x5b8>
    1a7c:	0089ab83          	lw	s7,8(s3)
    1a80:	015b07b3          	add	a5,s6,s5
    1a84:	0017e793          	or	a5,a5,1
    1a88:	00fba223          	sw	a5,4(s7)
    1a8c:	7ffff717          	auipc	a4,0x7ffff
    1a90:	ca070713          	add	a4,a4,-864 # 8000072c <__malloc_max_sbrked_mem>
    1a94:	00072683          	lw	a3,0(a4)
    1a98:	00b6f463          	bgeu	a3,a1,1aa0 <_malloc_r+0x328>
    1a9c:	00b72023          	sw	a1,0(a4)
    1aa0:	7ffff717          	auipc	a4,0x7ffff
    1aa4:	c8870713          	add	a4,a4,-888 # 80000728 <__malloc_max_total_mem>
    1aa8:	00072683          	lw	a3,0(a4)
    1aac:	00b6f463          	bgeu	a3,a1,1ab4 <_malloc_r+0x33c>
    1ab0:	00b72023          	sw	a1,0(a4)
    1ab4:	00812c03          	lw	s8,8(sp)
    1ab8:	000b8413          	mv	s0,s7
    1abc:	ffc7f793          	and	a5,a5,-4
    1ac0:	40978733          	sub	a4,a5,s1
    1ac4:	3897ec63          	bltu	a5,s1,1e5c <_malloc_r+0x6e4>
    1ac8:	00f00793          	li	a5,15
    1acc:	38e7d863          	bge	a5,a4,1e5c <_malloc_r+0x6e4>
    1ad0:	01812a03          	lw	s4,24(sp)
    1ad4:	01412a83          	lw	s5,20(sp)
    1ad8:	00c12b83          	lw	s7,12(sp)
    1adc:	00412c83          	lw	s9,4(sp)
    1ae0:	0014e793          	or	a5,s1,1
    1ae4:	00f42223          	sw	a5,4(s0)
    1ae8:	009404b3          	add	s1,s0,s1
    1aec:	0099a423          	sw	s1,8(s3)
    1af0:	00176713          	or	a4,a4,1
    1af4:	00090513          	mv	a0,s2
    1af8:	00e4a223          	sw	a4,4(s1)
    1afc:	468000ef          	jal	1f64 <__malloc_unlock>
    1b00:	02c12083          	lw	ra,44(sp)
    1b04:	00840513          	add	a0,s0,8
    1b08:	02812403          	lw	s0,40(sp)
    1b0c:	01012b03          	lw	s6,16(sp)
    1b10:	02412483          	lw	s1,36(sp)
    1b14:	02012903          	lw	s2,32(sp)
    1b18:	01c12983          	lw	s3,28(sp)
    1b1c:	03010113          	add	sp,sp,48
    1b20:	00008067          	ret
    1b24:	0049a503          	lw	a0,4(s3)
    1b28:	de9ff06f          	j	1910 <_malloc_r+0x198>
    1b2c:	00842603          	lw	a2,8(s0)
    1b30:	cb1ff06f          	j	17e0 <_malloc_r+0x68>
    1b34:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1b38:	00258593          	add	a1,a1,2
    1b3c:	d68780e3          	beq	a5,s0,189c <_malloc_r+0x124>
    1b40:	c91ff06f          	j	17d0 <_malloc_r+0x58>
    1b44:	0097d713          	srl	a4,a5,0x9
    1b48:	00400693          	li	a3,4
    1b4c:	14e6f263          	bgeu	a3,a4,1c90 <_malloc_r+0x518>
    1b50:	01400693          	li	a3,20
    1b54:	32e6e663          	bltu	a3,a4,1e80 <_malloc_r+0x708>
    1b58:	05c70613          	add	a2,a4,92
    1b5c:	05b70693          	add	a3,a4,91
    1b60:	00361613          	sll	a2,a2,0x3
    1b64:	00c98633          	add	a2,s3,a2
    1b68:	00062703          	lw	a4,0(a2)
    1b6c:	ff860613          	add	a2,a2,-8
    1b70:	00e61863          	bne	a2,a4,1b80 <_malloc_r+0x408>
    1b74:	2980006f          	j	1e0c <_malloc_r+0x694>
    1b78:	00872703          	lw	a4,8(a4)
    1b7c:	00e60863          	beq	a2,a4,1b8c <_malloc_r+0x414>
    1b80:	00472683          	lw	a3,4(a4)
    1b84:	ffc6f693          	and	a3,a3,-4
    1b88:	fed7e8e3          	bltu	a5,a3,1b78 <_malloc_r+0x400>
    1b8c:	00c72603          	lw	a2,12(a4)
    1b90:	00c42623          	sw	a2,12(s0)
    1b94:	00e42423          	sw	a4,8(s0)
    1b98:	00862423          	sw	s0,8(a2)
    1b9c:	00872623          	sw	s0,12(a4)
    1ba0:	d71ff06f          	j	1910 <_malloc_r+0x198>
    1ba4:	01400713          	li	a4,20
    1ba8:	10f77863          	bgeu	a4,a5,1cb8 <_malloc_r+0x540>
    1bac:	05400713          	li	a4,84
    1bb0:	2ef76663          	bltu	a4,a5,1e9c <_malloc_r+0x724>
    1bb4:	00c4d793          	srl	a5,s1,0xc
    1bb8:	06f78593          	add	a1,a5,111
    1bbc:	06e78813          	add	a6,a5,110
    1bc0:	00359613          	sll	a2,a1,0x3
    1bc4:	c95ff06f          	j	1858 <_malloc_r+0xe0>
    1bc8:	001e0e13          	add	t3,t3,1
    1bcc:	003e7793          	and	a5,t3,3
    1bd0:	00850513          	add	a0,a0,8
    1bd4:	10078063          	beqz	a5,1cd4 <_malloc_r+0x55c>
    1bd8:	00c52783          	lw	a5,12(a0)
    1bdc:	d89ff06f          	j	1964 <_malloc_r+0x1ec>
    1be0:	00842603          	lw	a2,8(s0)
    1be4:	0014e593          	or	a1,s1,1
    1be8:	00b42223          	sw	a1,4(s0)
    1bec:	00f62623          	sw	a5,12(a2)
    1bf0:	00c7a423          	sw	a2,8(a5)
    1bf4:	009404b3          	add	s1,s0,s1
    1bf8:	0099aa23          	sw	s1,20(s3)
    1bfc:	0099a823          	sw	s1,16(s3)
    1c00:	0016e793          	or	a5,a3,1
    1c04:	0114a623          	sw	a7,12(s1)
    1c08:	0114a423          	sw	a7,8(s1)
    1c0c:	00f4a223          	sw	a5,4(s1)
    1c10:	00e40733          	add	a4,s0,a4
    1c14:	00090513          	mv	a0,s2
    1c18:	00d72023          	sw	a3,0(a4)
    1c1c:	348000ef          	jal	1f64 <__malloc_unlock>
    1c20:	00840513          	add	a0,s0,8
    1c24:	be1ff06f          	j	1804 <_malloc_r+0x8c>
    1c28:	00f407b3          	add	a5,s0,a5
    1c2c:	0047a703          	lw	a4,4(a5)
    1c30:	00090513          	mv	a0,s2
    1c34:	00176713          	or	a4,a4,1
    1c38:	00e7a223          	sw	a4,4(a5)
    1c3c:	328000ef          	jal	1f64 <__malloc_unlock>
    1c40:	00840513          	add	a0,s0,8
    1c44:	bc1ff06f          	j	1804 <_malloc_r+0x8c>
    1c48:	0034d593          	srl	a1,s1,0x3
    1c4c:	00848793          	add	a5,s1,8
    1c50:	b69ff06f          	j	17b8 <_malloc_r+0x40>
    1c54:	0014e693          	or	a3,s1,1
    1c58:	00d42223          	sw	a3,4(s0)
    1c5c:	009404b3          	add	s1,s0,s1
    1c60:	0099aa23          	sw	s1,20(s3)
    1c64:	0099a823          	sw	s1,16(s3)
    1c68:	00176693          	or	a3,a4,1
    1c6c:	0114a623          	sw	a7,12(s1)
    1c70:	0114a423          	sw	a7,8(s1)
    1c74:	00d4a223          	sw	a3,4(s1)
    1c78:	00f407b3          	add	a5,s0,a5
    1c7c:	00090513          	mv	a0,s2
    1c80:	00e7a023          	sw	a4,0(a5)
    1c84:	2e0000ef          	jal	1f64 <__malloc_unlock>
    1c88:	00840513          	add	a0,s0,8
    1c8c:	b79ff06f          	j	1804 <_malloc_r+0x8c>
    1c90:	0067d713          	srl	a4,a5,0x6
    1c94:	03970613          	add	a2,a4,57
    1c98:	03870693          	add	a3,a4,56
    1c9c:	00361613          	sll	a2,a2,0x3
    1ca0:	ec5ff06f          	j	1b64 <_malloc_r+0x3ec>
    1ca4:	07340c63          	beq	s0,s3,1d1c <_malloc_r+0x5a4>
    1ca8:	0089a403          	lw	s0,8(s3)
    1cac:	00812c03          	lw	s8,8(sp)
    1cb0:	00442783          	lw	a5,4(s0)
    1cb4:	e09ff06f          	j	1abc <_malloc_r+0x344>
    1cb8:	05c78593          	add	a1,a5,92
    1cbc:	05b78813          	add	a6,a5,91
    1cc0:	00359613          	sll	a2,a1,0x3
    1cc4:	b95ff06f          	j	1858 <_malloc_r+0xe0>
    1cc8:	00832783          	lw	a5,8(t1)
    1ccc:	fff58593          	add	a1,a1,-1
    1cd0:	28679063          	bne	a5,t1,1f50 <_malloc_r+0x7d8>
    1cd4:	0035f793          	and	a5,a1,3
    1cd8:	ff830313          	add	t1,t1,-8
    1cdc:	fe0796e3          	bnez	a5,1cc8 <_malloc_r+0x550>
    1ce0:	0049a703          	lw	a4,4(s3)
    1ce4:	fff64793          	not	a5,a2
    1ce8:	00e7f7b3          	and	a5,a5,a4
    1cec:	00f9a223          	sw	a5,4(s3)
    1cf0:	00161613          	sll	a2,a2,0x1
    1cf4:	ccc7eee3          	bltu	a5,a2,19d0 <_malloc_r+0x258>
    1cf8:	cc060ce3          	beqz	a2,19d0 <_malloc_r+0x258>
    1cfc:	00f67733          	and	a4,a2,a5
    1d00:	00071a63          	bnez	a4,1d14 <_malloc_r+0x59c>
    1d04:	00161613          	sll	a2,a2,0x1
    1d08:	00f67733          	and	a4,a2,a5
    1d0c:	004e0e13          	add	t3,t3,4
    1d10:	fe070ae3          	beqz	a4,1d04 <_malloc_r+0x58c>
    1d14:	000e0593          	mv	a1,t3
    1d18:	c39ff06f          	j	1950 <_malloc_r+0x1d8>
    1d1c:	8001fc17          	auipc	s8,0x8001f
    1d20:	21cc0c13          	add	s8,s8,540 # 80020f38 <__malloc_current_mallinfo>
    1d24:	000c2703          	lw	a4,0(s8)
    1d28:	00ea8733          	add	a4,s5,a4
    1d2c:	00ec2023          	sw	a4,0(s8)
    1d30:	000ca683          	lw	a3,0(s9)
    1d34:	fff00793          	li	a5,-1
    1d38:	18f68663          	beq	a3,a5,1ec4 <_malloc_r+0x74c>
    1d3c:	414b87b3          	sub	a5,s7,s4
    1d40:	00e787b3          	add	a5,a5,a4
    1d44:	00fc2023          	sw	a5,0(s8)
    1d48:	007bfc93          	and	s9,s7,7
    1d4c:	0c0c8c63          	beqz	s9,1e24 <_malloc_r+0x6ac>
    1d50:	419b8bb3          	sub	s7,s7,s9
    1d54:	000017b7          	lui	a5,0x1
    1d58:	00878793          	add	a5,a5,8 # 1008 <puts+0xc>
    1d5c:	008b8b93          	add	s7,s7,8
    1d60:	419785b3          	sub	a1,a5,s9
    1d64:	015b8ab3          	add	s5,s7,s5
    1d68:	415585b3          	sub	a1,a1,s5
    1d6c:	01459593          	sll	a1,a1,0x14
    1d70:	0145da13          	srl	s4,a1,0x14
    1d74:	000a0593          	mv	a1,s4
    1d78:	00090513          	mv	a0,s2
    1d7c:	719050ef          	jal	7c94 <_sbrk_r>
    1d80:	fff00793          	li	a5,-1
    1d84:	18f50063          	beq	a0,a5,1f04 <_malloc_r+0x78c>
    1d88:	41750533          	sub	a0,a0,s7
    1d8c:	01450ab3          	add	s5,a0,s4
    1d90:	000c2703          	lw	a4,0(s8)
    1d94:	0179a423          	sw	s7,8(s3)
    1d98:	001ae793          	or	a5,s5,1
    1d9c:	00ea05b3          	add	a1,s4,a4
    1da0:	00bc2023          	sw	a1,0(s8)
    1da4:	00fba223          	sw	a5,4(s7)
    1da8:	cf3402e3          	beq	s0,s3,1a8c <_malloc_r+0x314>
    1dac:	00f00693          	li	a3,15
    1db0:	0b66f063          	bgeu	a3,s6,1e50 <_malloc_r+0x6d8>
    1db4:	00442703          	lw	a4,4(s0)
    1db8:	ff4b0793          	add	a5,s6,-12
    1dbc:	ff87f793          	and	a5,a5,-8
    1dc0:	00177713          	and	a4,a4,1
    1dc4:	00f76733          	or	a4,a4,a5
    1dc8:	00e42223          	sw	a4,4(s0)
    1dcc:	00500613          	li	a2,5
    1dd0:	00f40733          	add	a4,s0,a5
    1dd4:	00c72223          	sw	a2,4(a4)
    1dd8:	00c72423          	sw	a2,8(a4)
    1ddc:	00f6e663          	bltu	a3,a5,1de8 <_malloc_r+0x670>
    1de0:	004ba783          	lw	a5,4(s7)
    1de4:	ca9ff06f          	j	1a8c <_malloc_r+0x314>
    1de8:	00840593          	add	a1,s0,8
    1dec:	00090513          	mv	a0,s2
    1df0:	e7cff0ef          	jal	146c <_free_r>
    1df4:	0089ab83          	lw	s7,8(s3)
    1df8:	000c2583          	lw	a1,0(s8)
    1dfc:	004ba783          	lw	a5,4(s7)
    1e00:	c8dff06f          	j	1a8c <_malloc_r+0x314>
    1e04:	010a8a93          	add	s5,s5,16
    1e08:	c31ff06f          	j	1a38 <_malloc_r+0x2c0>
    1e0c:	4026d693          	sra	a3,a3,0x2
    1e10:	00100793          	li	a5,1
    1e14:	00d797b3          	sll	a5,a5,a3
    1e18:	00f56533          	or	a0,a0,a5
    1e1c:	00a9a223          	sw	a0,4(s3)
    1e20:	d71ff06f          	j	1b90 <_malloc_r+0x418>
    1e24:	015b85b3          	add	a1,s7,s5
    1e28:	40b005b3          	neg	a1,a1
    1e2c:	01459593          	sll	a1,a1,0x14
    1e30:	0145da13          	srl	s4,a1,0x14
    1e34:	000a0593          	mv	a1,s4
    1e38:	00090513          	mv	a0,s2
    1e3c:	659050ef          	jal	7c94 <_sbrk_r>
    1e40:	fff00793          	li	a5,-1
    1e44:	f4f512e3          	bne	a0,a5,1d88 <_malloc_r+0x610>
    1e48:	00000a13          	li	s4,0
    1e4c:	f45ff06f          	j	1d90 <_malloc_r+0x618>
    1e50:	00812c03          	lw	s8,8(sp)
    1e54:	00100793          	li	a5,1
    1e58:	00fba223          	sw	a5,4(s7)
    1e5c:	00090513          	mv	a0,s2
    1e60:	104000ef          	jal	1f64 <__malloc_unlock>
    1e64:	00000513          	li	a0,0
    1e68:	01812a03          	lw	s4,24(sp)
    1e6c:	01412a83          	lw	s5,20(sp)
    1e70:	01012b03          	lw	s6,16(sp)
    1e74:	00c12b83          	lw	s7,12(sp)
    1e78:	00412c83          	lw	s9,4(sp)
    1e7c:	989ff06f          	j	1804 <_malloc_r+0x8c>
    1e80:	05400693          	li	a3,84
    1e84:	04e6e463          	bltu	a3,a4,1ecc <_malloc_r+0x754>
    1e88:	00c7d713          	srl	a4,a5,0xc
    1e8c:	06f70613          	add	a2,a4,111
    1e90:	06e70693          	add	a3,a4,110
    1e94:	00361613          	sll	a2,a2,0x3
    1e98:	ccdff06f          	j	1b64 <_malloc_r+0x3ec>
    1e9c:	15400713          	li	a4,340
    1ea0:	04f76463          	bltu	a4,a5,1ee8 <_malloc_r+0x770>
    1ea4:	00f4d793          	srl	a5,s1,0xf
    1ea8:	07878593          	add	a1,a5,120
    1eac:	07778813          	add	a6,a5,119
    1eb0:	00359613          	sll	a2,a1,0x3
    1eb4:	9a5ff06f          	j	1858 <_malloc_r+0xe0>
    1eb8:	0089a403          	lw	s0,8(s3)
    1ebc:	00442783          	lw	a5,4(s0)
    1ec0:	bfdff06f          	j	1abc <_malloc_r+0x344>
    1ec4:	017ca023          	sw	s7,0(s9)
    1ec8:	e81ff06f          	j	1d48 <_malloc_r+0x5d0>
    1ecc:	15400693          	li	a3,340
    1ed0:	04e6e463          	bltu	a3,a4,1f18 <_malloc_r+0x7a0>
    1ed4:	00f7d713          	srl	a4,a5,0xf
    1ed8:	07870613          	add	a2,a4,120
    1edc:	07770693          	add	a3,a4,119
    1ee0:	00361613          	sll	a2,a2,0x3
    1ee4:	c81ff06f          	j	1b64 <_malloc_r+0x3ec>
    1ee8:	55400713          	li	a4,1364
    1eec:	04f76463          	bltu	a4,a5,1f34 <_malloc_r+0x7bc>
    1ef0:	0124d793          	srl	a5,s1,0x12
    1ef4:	07d78593          	add	a1,a5,125
    1ef8:	07c78813          	add	a6,a5,124
    1efc:	00359613          	sll	a2,a1,0x3
    1f00:	959ff06f          	j	1858 <_malloc_r+0xe0>
    1f04:	ff8c8c93          	add	s9,s9,-8
    1f08:	019a8ab3          	add	s5,s5,s9
    1f0c:	417a8ab3          	sub	s5,s5,s7
    1f10:	00000a13          	li	s4,0
    1f14:	e7dff06f          	j	1d90 <_malloc_r+0x618>
    1f18:	55400693          	li	a3,1364
    1f1c:	02e6e463          	bltu	a3,a4,1f44 <_malloc_r+0x7cc>
    1f20:	0127d713          	srl	a4,a5,0x12
    1f24:	07d70613          	add	a2,a4,125
    1f28:	07c70693          	add	a3,a4,124
    1f2c:	00361613          	sll	a2,a2,0x3
    1f30:	c35ff06f          	j	1b64 <_malloc_r+0x3ec>
    1f34:	3f800613          	li	a2,1016
    1f38:	07f00593          	li	a1,127
    1f3c:	07e00813          	li	a6,126
    1f40:	919ff06f          	j	1858 <_malloc_r+0xe0>
    1f44:	3f800613          	li	a2,1016
    1f48:	07e00693          	li	a3,126
    1f4c:	c19ff06f          	j	1b64 <_malloc_r+0x3ec>
    1f50:	0049a783          	lw	a5,4(s3)
    1f54:	d9dff06f          	j	1cf0 <_malloc_r+0x578>

00001f58 <__malloc_lock>:
    1f58:	7fffe517          	auipc	a0,0x7fffe
    1f5c:	7c850513          	add	a0,a0,1992 # 80000720 <__lock___malloc_recursive_mutex>
    1f60:	8b4ff06f          	j	1014 <__retarget_lock_acquire_recursive>

00001f64 <__malloc_unlock>:
    1f64:	7fffe517          	auipc	a0,0x7fffe
    1f68:	7bc50513          	add	a0,a0,1980 # 80000720 <__lock___malloc_recursive_mutex>
    1f6c:	8acff06f          	j	1018 <__retarget_lock_release_recursive>

00001f70 <_vfprintf_r>:
    1f70:	e7010113          	add	sp,sp,-400
    1f74:	18112623          	sw	ra,396(sp)
    1f78:	00b12423          	sw	a1,8(sp)
    1f7c:	00c12623          	sw	a2,12(sp)
    1f80:	00d12a23          	sw	a3,20(sp)
    1f84:	17312e23          	sw	s3,380(sp)
    1f88:	18812423          	sw	s0,392(sp)
    1f8c:	00050993          	mv	s3,a0
    1f90:	3d9050ef          	jal	7b68 <_localeconv_r>
    1f94:	00052783          	lw	a5,0(a0)
    1f98:	00078513          	mv	a0,a5
    1f9c:	02f12a23          	sw	a5,52(sp)
    1fa0:	afcff0ef          	jal	129c <strlen>
    1fa4:	00050713          	mv	a4,a0
    1fa8:	00800613          	li	a2,8
    1fac:	00000593          	li	a1,0
    1fb0:	09010513          	add	a0,sp,144
    1fb4:	02e12823          	sw	a4,48(sp)
    1fb8:	864ff0ef          	jal	101c <memset>
    1fbc:	00c12783          	lw	a5,12(sp)
    1fc0:	00098863          	beqz	s3,1fd0 <_vfprintf_r+0x60>
    1fc4:	0349a703          	lw	a4,52(s3)
    1fc8:	00071463          	bnez	a4,1fd0 <_vfprintf_r+0x60>
    1fcc:	29d0106f          	j	3a68 <_vfprintf_r+0x1af8>
    1fd0:	00812703          	lw	a4,8(sp)
    1fd4:	06472683          	lw	a3,100(a4)
    1fd8:	00c71703          	lh	a4,12(a4)
    1fdc:	0016f693          	and	a3,a3,1
    1fe0:	00069863          	bnez	a3,1ff0 <_vfprintf_r+0x80>
    1fe4:	20077693          	and	a3,a4,512
    1fe8:	00069463          	bnez	a3,1ff0 <_vfprintf_r+0x80>
    1fec:	3ec0106f          	j	33d8 <_vfprintf_r+0x1468>
    1ff0:	01271693          	sll	a3,a4,0x12
    1ff4:	0206c863          	bltz	a3,2024 <_vfprintf_r+0xb4>
    1ff8:	00812503          	lw	a0,8(sp)
    1ffc:	000025b7          	lui	a1,0x2
    2000:	ffffe637          	lui	a2,0xffffe
    2004:	06452683          	lw	a3,100(a0)
    2008:	00b76733          	or	a4,a4,a1
    200c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    2010:	01071713          	sll	a4,a4,0x10
    2014:	41075713          	sra	a4,a4,0x10
    2018:	00c6f6b3          	and	a3,a3,a2
    201c:	00e51623          	sh	a4,12(a0)
    2020:	06d52223          	sw	a3,100(a0)
    2024:	00877693          	and	a3,a4,8
    2028:	2a068063          	beqz	a3,22c8 <_vfprintf_r+0x358>
    202c:	00812683          	lw	a3,8(sp)
    2030:	0106a683          	lw	a3,16(a3)
    2034:	28068a63          	beqz	a3,22c8 <_vfprintf_r+0x358>
    2038:	01a77693          	and	a3,a4,26
    203c:	00a00613          	li	a2,10
    2040:	2ac68c63          	beq	a3,a2,22f8 <_vfprintf_r+0x388>
    2044:	0ac10713          	add	a4,sp,172
    2048:	17512a23          	sw	s5,372(sp)
    204c:	17812423          	sw	s8,360(sp)
    2050:	15b12e23          	sw	s11,348(sp)
    2054:	18912223          	sw	s1,388(sp)
    2058:	19212023          	sw	s2,384(sp)
    205c:	17412c23          	sw	s4,376(sp)
    2060:	17612823          	sw	s6,368(sp)
    2064:	17712623          	sw	s7,364(sp)
    2068:	17912223          	sw	s9,356(sp)
    206c:	17a12023          	sw	s10,352(sp)
    2070:	0ae12023          	sw	a4,160(sp)
    2074:	0a012423          	sw	zero,168(sp)
    2078:	0a012223          	sw	zero,164(sp)
    207c:	00012c23          	sw	zero,24(sp)
    2080:	02012423          	sw	zero,40(sp)
    2084:	02012623          	sw	zero,44(sp)
    2088:	00070413          	mv	s0,a4
    208c:	02012c23          	sw	zero,56(sp)
    2090:	04012023          	sw	zero,64(sp)
    2094:	02012e23          	sw	zero,60(sp)
    2098:	04012623          	sw	zero,76(sp)
    209c:	04012423          	sw	zero,72(sp)
    20a0:	00012623          	sw	zero,12(sp)
    20a4:	7fffea97          	auipc	s5,0x7fffe
    20a8:	490a8a93          	add	s5,s5,1168 # 80000534 <__global_locale>
    20ac:	02500d93          	li	s11,37
    20b0:	00078c13          	mv	s8,a5
    20b4:	000c0913          	mv	s2,s8
    20b8:	0e4aa483          	lw	s1,228(s5)
    20bc:	2a1050ef          	jal	7b5c <__locale_mb_cur_max>
    20c0:	00050693          	mv	a3,a0
    20c4:	09010713          	add	a4,sp,144
    20c8:	00090613          	mv	a2,s2
    20cc:	08010593          	add	a1,sp,128
    20d0:	00098513          	mv	a0,s3
    20d4:	000480e7          	jalr	s1
    20d8:	2c050a63          	beqz	a0,23ac <_vfprintf_r+0x43c>
    20dc:	2a054a63          	bltz	a0,2390 <_vfprintf_r+0x420>
    20e0:	08012783          	lw	a5,128(sp)
    20e4:	01b78663          	beq	a5,s11,20f0 <_vfprintf_r+0x180>
    20e8:	00a90933          	add	s2,s2,a0
    20ec:	fcdff06f          	j	20b8 <_vfprintf_r+0x148>
    20f0:	00050493          	mv	s1,a0
    20f4:	41890cb3          	sub	s9,s2,s8
    20f8:	2d891063          	bne	s2,s8,23b8 <_vfprintf_r+0x448>
    20fc:	fff00313          	li	t1,-1
    2100:	00000e93          	li	t4,0
    2104:	00194e03          	lbu	t3,1(s2)
    2108:	06010ba3          	sb	zero,119(sp)
    210c:	00190913          	add	s2,s2,1
    2110:	00000b93          	li	s7,0
    2114:	05a00493          	li	s1,90
    2118:	000e8a13          	mv	s4,t4
    211c:	00030b13          	mv	s6,t1
    2120:	00190913          	add	s2,s2,1
    2124:	fe0e0793          	add	a5,t3,-32
    2128:	04f4ea63          	bltu	s1,a5,217c <_vfprintf_r+0x20c>
    212c:	0000d717          	auipc	a4,0xd
    2130:	34470713          	add	a4,a4,836 # f470 <_ctype_+0x104>
    2134:	00279793          	sll	a5,a5,0x2
    2138:	00e787b3          	add	a5,a5,a4
    213c:	0007a783          	lw	a5,0(a5)
    2140:	00e787b3          	add	a5,a5,a4
    2144:	00078067          	jr	a5
    2148:	00000b93          	li	s7,0
    214c:	fd0e0713          	add	a4,t3,-48
    2150:	00900693          	li	a3,9
    2154:	00094e03          	lbu	t3,0(s2)
    2158:	002b9793          	sll	a5,s7,0x2
    215c:	017787b3          	add	a5,a5,s7
    2160:	00179793          	sll	a5,a5,0x1
    2164:	00f70bb3          	add	s7,a4,a5
    2168:	fd0e0713          	add	a4,t3,-48
    216c:	00190913          	add	s2,s2,1
    2170:	fee6f2e3          	bgeu	a3,a4,2154 <_vfprintf_r+0x1e4>
    2174:	fe0e0793          	add	a5,t3,-32
    2178:	faf4fae3          	bgeu	s1,a5,212c <_vfprintf_r+0x1bc>
    217c:	000a0e93          	mv	t4,s4
    2180:	260e0a63          	beqz	t3,23f4 <_vfprintf_r+0x484>
    2184:	0fc10623          	sb	t3,236(sp)
    2188:	06010ba3          	sb	zero,119(sp)
    218c:	00100c93          	li	s9,1
    2190:	00000613          	li	a2,0
    2194:	00012823          	sw	zero,16(sp)
    2198:	00100d13          	li	s10,1
    219c:	00000313          	li	t1,0
    21a0:	02012223          	sw	zero,36(sp)
    21a4:	02012023          	sw	zero,32(sp)
    21a8:	00000a13          	li	s4,0
    21ac:	0ec10c13          	add	s8,sp,236
    21b0:	002ef293          	and	t0,t4,2
    21b4:	00028463          	beqz	t0,21bc <_vfprintf_r+0x24c>
    21b8:	002c8c93          	add	s9,s9,2
    21bc:	084eff93          	and	t6,t4,132
    21c0:	0a812483          	lw	s1,168(sp)
    21c4:	000f9663          	bnez	t6,21d0 <_vfprintf_r+0x260>
    21c8:	419b8733          	sub	a4,s7,s9
    21cc:	40e04663          	bgtz	a4,25d8 <_vfprintf_r+0x668>
    21d0:	02060a63          	beqz	a2,2204 <_vfprintf_r+0x294>
    21d4:	0a412703          	lw	a4,164(sp)
    21d8:	07710613          	add	a2,sp,119
    21dc:	00148493          	add	s1,s1,1
    21e0:	00170713          	add	a4,a4,1
    21e4:	00100793          	li	a5,1
    21e8:	00c42023          	sw	a2,0(s0)
    21ec:	00f42223          	sw	a5,4(s0)
    21f0:	0a912423          	sw	s1,168(sp)
    21f4:	0ae12223          	sw	a4,164(sp)
    21f8:	00700613          	li	a2,7
    21fc:	00840413          	add	s0,s0,8
    2200:	4ce64863          	blt	a2,a4,26d0 <_vfprintf_r+0x760>
    2204:	02028a63          	beqz	t0,2238 <_vfprintf_r+0x2c8>
    2208:	0a412703          	lw	a4,164(sp)
    220c:	07810613          	add	a2,sp,120
    2210:	00c42023          	sw	a2,0(s0)
    2214:	00248493          	add	s1,s1,2
    2218:	00200613          	li	a2,2
    221c:	00170713          	add	a4,a4,1
    2220:	00c42223          	sw	a2,4(s0)
    2224:	0a912423          	sw	s1,168(sp)
    2228:	0ae12223          	sw	a4,164(sp)
    222c:	00700613          	li	a2,7
    2230:	00840413          	add	s0,s0,8
    2234:	5ce644e3          	blt	a2,a4,2ffc <_vfprintf_r+0x108c>
    2238:	08000713          	li	a4,128
    223c:	3aef80e3          	beq	t6,a4,2ddc <_vfprintf_r+0xe6c>
    2240:	41a30b33          	sub	s6,t1,s10
    2244:	4b604ae3          	bgtz	s6,2ef8 <_vfprintf_r+0xf88>
    2248:	100ef713          	and	a4,t4,256
    224c:	1a0710e3          	bnez	a4,2bec <_vfprintf_r+0xc7c>
    2250:	0a412783          	lw	a5,164(sp)
    2254:	01a484b3          	add	s1,s1,s10
    2258:	01842023          	sw	s8,0(s0)
    225c:	00178793          	add	a5,a5,1
    2260:	01a42223          	sw	s10,4(s0)
    2264:	0a912423          	sw	s1,168(sp)
    2268:	0af12223          	sw	a5,164(sp)
    226c:	00700713          	li	a4,7
    2270:	58f74c63          	blt	a4,a5,2808 <_vfprintf_r+0x898>
    2274:	00840413          	add	s0,s0,8
    2278:	004eff13          	and	t5,t4,4
    227c:	000f0663          	beqz	t5,2288 <_vfprintf_r+0x318>
    2280:	419b8d33          	sub	s10,s7,s9
    2284:	5ba04ce3          	bgtz	s10,303c <_vfprintf_r+0x10cc>
    2288:	000b8e93          	mv	t4,s7
    228c:	019bd463          	bge	s7,s9,2294 <_vfprintf_r+0x324>
    2290:	000c8e93          	mv	t4,s9
    2294:	00c12783          	lw	a5,12(sp)
    2298:	01d787b3          	add	a5,a5,t4
    229c:	00f12623          	sw	a5,12(sp)
    22a0:	18049663          	bnez	s1,242c <_vfprintf_r+0x4bc>
    22a4:	01012783          	lw	a5,16(sp)
    22a8:	0a012223          	sw	zero,164(sp)
    22ac:	00078863          	beqz	a5,22bc <_vfprintf_r+0x34c>
    22b0:	01012583          	lw	a1,16(sp)
    22b4:	00098513          	mv	a0,s3
    22b8:	9b4ff0ef          	jal	146c <_free_r>
    22bc:	0ac10413          	add	s0,sp,172
    22c0:	00090c13          	mv	s8,s2
    22c4:	df1ff06f          	j	20b4 <_vfprintf_r+0x144>
    22c8:	00812403          	lw	s0,8(sp)
    22cc:	00098513          	mv	a0,s3
    22d0:	00f12623          	sw	a5,12(sp)
    22d4:	00040593          	mv	a1,s0
    22d8:	3a4050ef          	jal	767c <__swsetup_r>
    22dc:	00050463          	beqz	a0,22e4 <_vfprintf_r+0x374>
    22e0:	5600206f          	j	4840 <_vfprintf_r+0x28d0>
    22e4:	00c41703          	lh	a4,12(s0)
    22e8:	00a00613          	li	a2,10
    22ec:	00c12783          	lw	a5,12(sp)
    22f0:	01a77693          	and	a3,a4,26
    22f4:	d4c698e3          	bne	a3,a2,2044 <_vfprintf_r+0xd4>
    22f8:	00812603          	lw	a2,8(sp)
    22fc:	00e61683          	lh	a3,14(a2)
    2300:	d406c2e3          	bltz	a3,2044 <_vfprintf_r+0xd4>
    2304:	06462683          	lw	a3,100(a2)
    2308:	0016f693          	and	a3,a3,1
    230c:	00069863          	bnez	a3,231c <_vfprintf_r+0x3ac>
    2310:	20077713          	and	a4,a4,512
    2314:	00071463          	bnez	a4,231c <_vfprintf_r+0x3ac>
    2318:	53d0106f          	j	4054 <_vfprintf_r+0x20e4>
    231c:	01412683          	lw	a3,20(sp)
    2320:	00812583          	lw	a1,8(sp)
    2324:	00098513          	mv	a0,s3
    2328:	00078613          	mv	a2,a5
    232c:	0e5020ef          	jal	4c10 <__sbprintf>
    2330:	18c12083          	lw	ra,396(sp)
    2334:	18812403          	lw	s0,392(sp)
    2338:	00a12623          	sw	a0,12(sp)
    233c:	00c12503          	lw	a0,12(sp)
    2340:	17c12983          	lw	s3,380(sp)
    2344:	19010113          	add	sp,sp,400
    2348:	00008067          	ret
    234c:	00098513          	mv	a0,s3
    2350:	019050ef          	jal	7b68 <_localeconv_r>
    2354:	00452783          	lw	a5,4(a0)
    2358:	00078513          	mv	a0,a5
    235c:	04f12423          	sw	a5,72(sp)
    2360:	f3dfe0ef          	jal	129c <strlen>
    2364:	00050793          	mv	a5,a0
    2368:	00098513          	mv	a0,s3
    236c:	00078c93          	mv	s9,a5
    2370:	04f12623          	sw	a5,76(sp)
    2374:	7f4050ef          	jal	7b68 <_localeconv_r>
    2378:	00852703          	lw	a4,8(a0)
    237c:	02e12e23          	sw	a4,60(sp)
    2380:	000c8463          	beqz	s9,2388 <_vfprintf_r+0x418>
    2384:	1ec0106f          	j	3570 <_vfprintf_r+0x1600>
    2388:	00094e03          	lbu	t3,0(s2)
    238c:	d95ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2390:	00800613          	li	a2,8
    2394:	00000593          	li	a1,0
    2398:	09010513          	add	a0,sp,144
    239c:	c81fe0ef          	jal	101c <memset>
    23a0:	00100513          	li	a0,1
    23a4:	00a90933          	add	s2,s2,a0
    23a8:	d11ff06f          	j	20b8 <_vfprintf_r+0x148>
    23ac:	00050493          	mv	s1,a0
    23b0:	41890cb3          	sub	s9,s2,s8
    23b4:	05890063          	beq	s2,s8,23f4 <_vfprintf_r+0x484>
    23b8:	0a812683          	lw	a3,168(sp)
    23bc:	0a412703          	lw	a4,164(sp)
    23c0:	01842023          	sw	s8,0(s0)
    23c4:	019686b3          	add	a3,a3,s9
    23c8:	00170713          	add	a4,a4,1
    23cc:	01942223          	sw	s9,4(s0)
    23d0:	0ad12423          	sw	a3,168(sp)
    23d4:	0ae12223          	sw	a4,164(sp)
    23d8:	00700693          	li	a3,7
    23dc:	00840413          	add	s0,s0,8
    23e0:	02e6c863          	blt	a3,a4,2410 <_vfprintf_r+0x4a0>
    23e4:	00c12783          	lw	a5,12(sp)
    23e8:	019787b3          	add	a5,a5,s9
    23ec:	00f12623          	sw	a5,12(sp)
    23f0:	d00496e3          	bnez	s1,20fc <_vfprintf_r+0x18c>
    23f4:	0a812783          	lw	a5,168(sp)
    23f8:	00078463          	beqz	a5,2400 <_vfprintf_r+0x490>
    23fc:	4090106f          	j	4004 <_vfprintf_r+0x2094>
    2400:	00812783          	lw	a5,8(sp)
    2404:	0a012223          	sw	zero,164(sp)
    2408:	00c79783          	lh	a5,12(a5)
    240c:	0500006f          	j	245c <_vfprintf_r+0x4ec>
    2410:	00812583          	lw	a1,8(sp)
    2414:	0a010613          	add	a2,sp,160
    2418:	00098513          	mv	a0,s3
    241c:	211020ef          	jal	4e2c <__sprint_r>
    2420:	02051a63          	bnez	a0,2454 <_vfprintf_r+0x4e4>
    2424:	0ac10413          	add	s0,sp,172
    2428:	fbdff06f          	j	23e4 <_vfprintf_r+0x474>
    242c:	00812583          	lw	a1,8(sp)
    2430:	0a010613          	add	a2,sp,160
    2434:	00098513          	mv	a0,s3
    2438:	1f5020ef          	jal	4e2c <__sprint_r>
    243c:	e60504e3          	beqz	a0,22a4 <_vfprintf_r+0x334>
    2440:	01012283          	lw	t0,16(sp)
    2444:	00028863          	beqz	t0,2454 <_vfprintf_r+0x4e4>
    2448:	00028593          	mv	a1,t0
    244c:	00098513          	mv	a0,s3
    2450:	81cff0ef          	jal	146c <_free_r>
    2454:	00812783          	lw	a5,8(sp)
    2458:	00c79783          	lh	a5,12(a5)
    245c:	00812703          	lw	a4,8(sp)
    2460:	06472703          	lw	a4,100(a4)
    2464:	00177713          	and	a4,a4,1
    2468:	3c070463          	beqz	a4,2830 <_vfprintf_r+0x8c0>
    246c:	0407f793          	and	a5,a5,64
    2470:	18412483          	lw	s1,388(sp)
    2474:	18012903          	lw	s2,384(sp)
    2478:	17812a03          	lw	s4,376(sp)
    247c:	17412a83          	lw	s5,372(sp)
    2480:	17012b03          	lw	s6,368(sp)
    2484:	16c12b83          	lw	s7,364(sp)
    2488:	16812c03          	lw	s8,360(sp)
    248c:	16412c83          	lw	s9,356(sp)
    2490:	16012d03          	lw	s10,352(sp)
    2494:	15c12d83          	lw	s11,348(sp)
    2498:	00078463          	beqz	a5,24a0 <_vfprintf_r+0x530>
    249c:	3d00206f          	j	486c <_vfprintf_r+0x28fc>
    24a0:	18c12083          	lw	ra,396(sp)
    24a4:	18812403          	lw	s0,392(sp)
    24a8:	00c12503          	lw	a0,12(sp)
    24ac:	17c12983          	lw	s3,380(sp)
    24b0:	19010113          	add	sp,sp,400
    24b4:	00008067          	ret
    24b8:	008a7713          	and	a4,s4,8
    24bc:	000a0e93          	mv	t4,s4
    24c0:	000b0313          	mv	t1,s6
    24c4:	00070463          	beqz	a4,24cc <_vfprintf_r+0x55c>
    24c8:	0200106f          	j	34e8 <_vfprintf_r+0x1578>
    24cc:	01412783          	lw	a5,20(sp)
    24d0:	00778b13          	add	s6,a5,7
    24d4:	ff8b7b13          	and	s6,s6,-8
    24d8:	000b2783          	lw	a5,0(s6)
    24dc:	02f12423          	sw	a5,40(sp)
    24e0:	004b2783          	lw	a5,4(s6)
    24e4:	02f12623          	sw	a5,44(sp)
    24e8:	008b0793          	add	a5,s6,8
    24ec:	00f12a23          	sw	a5,20(sp)
    24f0:	02c12a03          	lw	s4,44(sp)
    24f4:	7fffe717          	auipc	a4,0x7fffe
    24f8:	1ac70713          	add	a4,a4,428 # 800006a0 <__global_locale+0x16c>
    24fc:	00072c83          	lw	s9,0(a4)
    2500:	00472d03          	lw	s10,4(a4)
    2504:	02812b03          	lw	s6,40(sp)
    2508:	001a1493          	sll	s1,s4,0x1
    250c:	0014d493          	srl	s1,s1,0x1
    2510:	000b0513          	mv	a0,s6
    2514:	00048593          	mv	a1,s1
    2518:	000c8613          	mv	a2,s9
    251c:	000d0693          	mv	a3,s10
    2520:	02612223          	sw	t1,36(sp)
    2524:	03c12023          	sw	t3,32(sp)
    2528:	01d12823          	sw	t4,16(sp)
    252c:	26c0c0ef          	jal	e798 <__unorddf2>
    2530:	01012e83          	lw	t4,16(sp)
    2534:	02012e03          	lw	t3,32(sp)
    2538:	02412303          	lw	t1,36(sp)
    253c:	00050463          	beqz	a0,2544 <_vfprintf_r+0x5d4>
    2540:	4080106f          	j	3948 <_vfprintf_r+0x19d8>
    2544:	000b0513          	mv	a0,s6
    2548:	00048593          	mv	a1,s1
    254c:	000c8613          	mv	a2,s9
    2550:	000d0693          	mv	a3,s10
    2554:	0a40b0ef          	jal	d5f8 <__ledf2>
    2558:	01012e83          	lw	t4,16(sp)
    255c:	02012e03          	lw	t3,32(sp)
    2560:	02412303          	lw	t1,36(sp)
    2564:	00a04463          	bgtz	a0,256c <_vfprintf_r+0x5fc>
    2568:	3e00106f          	j	3948 <_vfprintf_r+0x19d8>
    256c:	000b0513          	mv	a0,s6
    2570:	000a0593          	mv	a1,s4
    2574:	00000613          	li	a2,0
    2578:	00000693          	li	a3,0
    257c:	07c0b0ef          	jal	d5f8 <__ledf2>
    2580:	01012e83          	lw	t4,16(sp)
    2584:	02012e03          	lw	t3,32(sp)
    2588:	00055463          	bgez	a0,2590 <_vfprintf_r+0x620>
    258c:	6650106f          	j	43f0 <_vfprintf_r+0x2480>
    2590:	07714603          	lbu	a2,119(sp)
    2594:	04700713          	li	a4,71
    2598:	0000dc17          	auipc	s8,0xd
    259c:	be8c0c13          	add	s8,s8,-1048 # f180 <__fini_array_end+0x1c0>
    25a0:	01c74663          	blt	a4,t3,25ac <_vfprintf_r+0x63c>
    25a4:	0000dc17          	auipc	s8,0xd
    25a8:	bd8c0c13          	add	s8,s8,-1064 # f17c <__fini_array_end+0x1bc>
    25ac:	00012823          	sw	zero,16(sp)
    25b0:	02012223          	sw	zero,36(sp)
    25b4:	02012023          	sw	zero,32(sp)
    25b8:	f7fefe93          	and	t4,t4,-129
    25bc:	00300c93          	li	s9,3
    25c0:	00300d13          	li	s10,3
    25c4:	00000313          	li	t1,0
    25c8:	00000a13          	li	s4,0
    25cc:	be0602e3          	beqz	a2,21b0 <_vfprintf_r+0x240>
    25d0:	001c8c93          	add	s9,s9,1
    25d4:	bddff06f          	j	21b0 <_vfprintf_r+0x240>
    25d8:	01000593          	li	a1,16
    25dc:	0a412603          	lw	a2,164(sp)
    25e0:	0000db17          	auipc	s6,0xd
    25e4:	0a4b0b13          	add	s6,s6,164 # f684 <blanks.1>
    25e8:	0ae5dc63          	bge	a1,a4,26a0 <_vfprintf_r+0x730>
    25ec:	00040793          	mv	a5,s0
    25f0:	00048693          	mv	a3,s1
    25f4:	01000893          	li	a7,16
    25f8:	000b0493          	mv	s1,s6
    25fc:	00700393          	li	t2,7
    2600:	000a0b13          	mv	s6,s4
    2604:	04512223          	sw	t0,68(sp)
    2608:	05f12823          	sw	t6,80(sp)
    260c:	05d12a23          	sw	t4,84(sp)
    2610:	05c12c23          	sw	t3,88(sp)
    2614:	00070413          	mv	s0,a4
    2618:	00030a13          	mv	s4,t1
    261c:	00c0006f          	j	2628 <_vfprintf_r+0x6b8>
    2620:	ff040413          	add	s0,s0,-16
    2624:	0488da63          	bge	a7,s0,2678 <_vfprintf_r+0x708>
    2628:	01068693          	add	a3,a3,16
    262c:	00160613          	add	a2,a2,1
    2630:	0097a023          	sw	s1,0(a5)
    2634:	0117a223          	sw	a7,4(a5)
    2638:	0ad12423          	sw	a3,168(sp)
    263c:	0ac12223          	sw	a2,164(sp)
    2640:	00878793          	add	a5,a5,8
    2644:	fcc3dee3          	bge	t2,a2,2620 <_vfprintf_r+0x6b0>
    2648:	00812583          	lw	a1,8(sp)
    264c:	0a010613          	add	a2,sp,160
    2650:	00098513          	mv	a0,s3
    2654:	7d8020ef          	jal	4e2c <__sprint_r>
    2658:	de0514e3          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    265c:	01000893          	li	a7,16
    2660:	ff040413          	add	s0,s0,-16
    2664:	0a812683          	lw	a3,168(sp)
    2668:	0a412603          	lw	a2,164(sp)
    266c:	0ac10793          	add	a5,sp,172
    2670:	00700393          	li	t2,7
    2674:	fa88cae3          	blt	a7,s0,2628 <_vfprintf_r+0x6b8>
    2678:	04412283          	lw	t0,68(sp)
    267c:	05012f83          	lw	t6,80(sp)
    2680:	05412e83          	lw	t4,84(sp)
    2684:	05812e03          	lw	t3,88(sp)
    2688:	000a0313          	mv	t1,s4
    268c:	00040713          	mv	a4,s0
    2690:	000b0a13          	mv	s4,s6
    2694:	00078413          	mv	s0,a5
    2698:	00048b13          	mv	s6,s1
    269c:	00068493          	mv	s1,a3
    26a0:	00e484b3          	add	s1,s1,a4
    26a4:	00160613          	add	a2,a2,1
    26a8:	00e42223          	sw	a4,4(s0)
    26ac:	01642023          	sw	s6,0(s0)
    26b0:	0a912423          	sw	s1,168(sp)
    26b4:	0ac12223          	sw	a2,164(sp)
    26b8:	00700713          	li	a4,7
    26bc:	00c75463          	bge	a4,a2,26c4 <_vfprintf_r+0x754>
    26c0:	2380106f          	j	38f8 <_vfprintf_r+0x1988>
    26c4:	07714603          	lbu	a2,119(sp)
    26c8:	00840413          	add	s0,s0,8
    26cc:	b05ff06f          	j	21d0 <_vfprintf_r+0x260>
    26d0:	00812583          	lw	a1,8(sp)
    26d4:	0a010613          	add	a2,sp,160
    26d8:	00098513          	mv	a0,s3
    26dc:	04612e23          	sw	t1,92(sp)
    26e0:	05c12c23          	sw	t3,88(sp)
    26e4:	05d12a23          	sw	t4,84(sp)
    26e8:	05f12823          	sw	t6,80(sp)
    26ec:	04512223          	sw	t0,68(sp)
    26f0:	73c020ef          	jal	4e2c <__sprint_r>
    26f4:	d40516e3          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    26f8:	0a812483          	lw	s1,168(sp)
    26fc:	05c12303          	lw	t1,92(sp)
    2700:	05812e03          	lw	t3,88(sp)
    2704:	05412e83          	lw	t4,84(sp)
    2708:	05012f83          	lw	t6,80(sp)
    270c:	04412283          	lw	t0,68(sp)
    2710:	0ac10413          	add	s0,sp,172
    2714:	af1ff06f          	j	2204 <_vfprintf_r+0x294>
    2718:	0a412d03          	lw	s10,164(sp)
    271c:	01812783          	lw	a5,24(sp)
    2720:	00100693          	li	a3,1
    2724:	01842023          	sw	s8,0(s0)
    2728:	00148493          	add	s1,s1,1
    272c:	001d0d13          	add	s10,s10,1
    2730:	00840b13          	add	s6,s0,8
    2734:	32f6d0e3          	bge	a3,a5,3254 <_vfprintf_r+0x12e4>
    2738:	00100693          	li	a3,1
    273c:	00d42223          	sw	a3,4(s0)
    2740:	0a912423          	sw	s1,168(sp)
    2744:	0ba12223          	sw	s10,164(sp)
    2748:	00700693          	li	a3,7
    274c:	01a6d463          	bge	a3,s10,2754 <_vfprintf_r+0x7e4>
    2750:	0680106f          	j	37b8 <_vfprintf_r+0x1848>
    2754:	03012783          	lw	a5,48(sp)
    2758:	03412703          	lw	a4,52(sp)
    275c:	001d0d13          	add	s10,s10,1
    2760:	00f484b3          	add	s1,s1,a5
    2764:	00eb2023          	sw	a4,0(s6)
    2768:	00fb2223          	sw	a5,4(s6)
    276c:	0a912423          	sw	s1,168(sp)
    2770:	0ba12223          	sw	s10,164(sp)
    2774:	00700693          	li	a3,7
    2778:	008b0b13          	add	s6,s6,8
    277c:	01a6d463          	bge	a3,s10,2784 <_vfprintf_r+0x814>
    2780:	0680106f          	j	37e8 <_vfprintf_r+0x1878>
    2784:	02812603          	lw	a2,40(sp)
    2788:	02c12683          	lw	a3,44(sp)
    278c:	01812783          	lw	a5,24(sp)
    2790:	00060513          	mv	a0,a2
    2794:	00068593          	mv	a1,a3
    2798:	00000613          	li	a2,0
    279c:	00000693          	li	a3,0
    27a0:	03d12023          	sw	t4,32(sp)
    27a4:	fff78413          	add	s0,a5,-1
    27a8:	4c50a0ef          	jal	d46c <__eqdf2>
    27ac:	02012e83          	lw	t4,32(sp)
    27b0:	2e0506e3          	beqz	a0,329c <_vfprintf_r+0x132c>
    27b4:	001c0793          	add	a5,s8,1
    27b8:	001d0d13          	add	s10,s10,1
    27bc:	008484b3          	add	s1,s1,s0
    27c0:	00fb2023          	sw	a5,0(s6)
    27c4:	008b2223          	sw	s0,4(s6)
    27c8:	0a912423          	sw	s1,168(sp)
    27cc:	0ba12223          	sw	s10,164(sp)
    27d0:	00700793          	li	a5,7
    27d4:	008b0b13          	add	s6,s6,8
    27d8:	29a7cce3          	blt	a5,s10,3270 <_vfprintf_r+0x1300>
    27dc:	04012703          	lw	a4,64(sp)
    27e0:	08810793          	add	a5,sp,136
    27e4:	001d0d13          	add	s10,s10,1
    27e8:	009704b3          	add	s1,a4,s1
    27ec:	00fb2023          	sw	a5,0(s6)
    27f0:	00eb2223          	sw	a4,4(s6)
    27f4:	0a912423          	sw	s1,168(sp)
    27f8:	0ba12223          	sw	s10,164(sp)
    27fc:	00700793          	li	a5,7
    2800:	008b0413          	add	s0,s6,8
    2804:	a7a7dae3          	bge	a5,s10,2278 <_vfprintf_r+0x308>
    2808:	00812583          	lw	a1,8(sp)
    280c:	0a010613          	add	a2,sp,160
    2810:	00098513          	mv	a0,s3
    2814:	03d12023          	sw	t4,32(sp)
    2818:	614020ef          	jal	4e2c <__sprint_r>
    281c:	c20512e3          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2820:	0a812483          	lw	s1,168(sp)
    2824:	02012e83          	lw	t4,32(sp)
    2828:	0ac10413          	add	s0,sp,172
    282c:	a4dff06f          	j	2278 <_vfprintf_r+0x308>
    2830:	2007f713          	and	a4,a5,512
    2834:	c2071ce3          	bnez	a4,246c <_vfprintf_r+0x4fc>
    2838:	00812403          	lw	s0,8(sp)
    283c:	05842503          	lw	a0,88(s0)
    2840:	fd8fe0ef          	jal	1018 <__retarget_lock_release_recursive>
    2844:	00c41783          	lh	a5,12(s0)
    2848:	c25ff06f          	j	246c <_vfprintf_r+0x4fc>
    284c:	00094e03          	lbu	t3,0(s2)
    2850:	020a6a13          	or	s4,s4,32
    2854:	8cdff06f          	j	2120 <_vfprintf_r+0x1b0>
    2858:	01412703          	lw	a4,20(sp)
    285c:	04300793          	li	a5,67
    2860:	000a0e93          	mv	t4,s4
    2864:	00470493          	add	s1,a4,4
    2868:	64fe08e3          	beq	t3,a5,36b8 <_vfprintf_r+0x1748>
    286c:	010a7793          	and	a5,s4,16
    2870:	640794e3          	bnez	a5,36b8 <_vfprintf_r+0x1748>
    2874:	01412783          	lw	a5,20(sp)
    2878:	00100c93          	li	s9,1
    287c:	00100d13          	li	s10,1
    2880:	0007a783          	lw	a5,0(a5)
    2884:	0ec10c13          	add	s8,sp,236
    2888:	0ef10623          	sb	a5,236(sp)
    288c:	06010ba3          	sb	zero,119(sp)
    2890:	00912a23          	sw	s1,20(sp)
    2894:	00000613          	li	a2,0
    2898:	00012823          	sw	zero,16(sp)
    289c:	00000313          	li	t1,0
    28a0:	02012223          	sw	zero,36(sp)
    28a4:	02012023          	sw	zero,32(sp)
    28a8:	00000a13          	li	s4,0
    28ac:	905ff06f          	j	21b0 <_vfprintf_r+0x240>
    28b0:	01412783          	lw	a5,20(sp)
    28b4:	06010ba3          	sb	zero,119(sp)
    28b8:	000b0313          	mv	t1,s6
    28bc:	0007ac03          	lw	s8,0(a5)
    28c0:	000a0e93          	mv	t4,s4
    28c4:	00478b13          	add	s6,a5,4
    28c8:	5a0c0ce3          	beqz	s8,3680 <_vfprintf_r+0x1710>
    28cc:	05300713          	li	a4,83
    28d0:	00ee1463          	bne	t3,a4,28d8 <_vfprintf_r+0x968>
    28d4:	1d00106f          	j	3aa4 <_vfprintf_r+0x1b34>
    28d8:	010a7a13          	and	s4,s4,16
    28dc:	000a0463          	beqz	s4,28e4 <_vfprintf_r+0x974>
    28e0:	1c40106f          	j	3aa4 <_vfprintf_r+0x1b34>
    28e4:	00035463          	bgez	t1,28ec <_vfprintf_r+0x97c>
    28e8:	6d40106f          	j	3fbc <_vfprintf_r+0x204c>
    28ec:	00030613          	mv	a2,t1
    28f0:	00000593          	li	a1,0
    28f4:	000c0513          	mv	a0,s8
    28f8:	03d12023          	sw	t4,32(sp)
    28fc:	00612a23          	sw	t1,20(sp)
    2900:	0ec050ef          	jal	79ec <memchr>
    2904:	00a12823          	sw	a0,16(sp)
    2908:	01412303          	lw	t1,20(sp)
    290c:	02012e83          	lw	t4,32(sp)
    2910:	00051463          	bnez	a0,2918 <_vfprintf_r+0x9a8>
    2914:	1780206f          	j	4a8c <_vfprintf_r+0x2b1c>
    2918:	01012783          	lw	a5,16(sp)
    291c:	07714603          	lbu	a2,119(sp)
    2920:	01612a23          	sw	s6,20(sp)
    2924:	41878d33          	sub	s10,a5,s8
    2928:	fffd4813          	not	a6,s10
    292c:	41f85813          	sra	a6,a6,0x1f
    2930:	02012223          	sw	zero,36(sp)
    2934:	02012023          	sw	zero,32(sp)
    2938:	00012823          	sw	zero,16(sp)
    293c:	010d7cb3          	and	s9,s10,a6
    2940:	00000313          	li	t1,0
    2944:	07300e13          	li	t3,115
    2948:	860604e3          	beqz	a2,21b0 <_vfprintf_r+0x240>
    294c:	c85ff06f          	j	25d0 <_vfprintf_r+0x660>
    2950:	01412783          	lw	a5,20(sp)
    2954:	0007ab83          	lw	s7,0(a5)
    2958:	00478793          	add	a5,a5,4
    295c:	2a0bdae3          	bgez	s7,3410 <_vfprintf_r+0x14a0>
    2960:	41700bb3          	neg	s7,s7
    2964:	00f12a23          	sw	a5,20(sp)
    2968:	00094e03          	lbu	t3,0(s2)
    296c:	004a6a13          	or	s4,s4,4
    2970:	fb0ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2974:	02b00793          	li	a5,43
    2978:	00094e03          	lbu	t3,0(s2)
    297c:	06f10ba3          	sb	a5,119(sp)
    2980:	fa0ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2984:	000b0313          	mv	t1,s6
    2988:	010a6613          	or	a2,s4,16
    298c:	02067793          	and	a5,a2,32
    2990:	1c0780e3          	beqz	a5,3350 <_vfprintf_r+0x13e0>
    2994:	01412783          	lw	a5,20(sp)
    2998:	00778b13          	add	s6,a5,7
    299c:	ff8b7b13          	and	s6,s6,-8
    29a0:	000b2d03          	lw	s10,0(s6)
    29a4:	004b2c83          	lw	s9,4(s6)
    29a8:	008b0793          	add	a5,s6,8
    29ac:	00f12a23          	sw	a5,20(sp)
    29b0:	00100793          	li	a5,1
    29b4:	00000713          	li	a4,0
    29b8:	06e10ba3          	sb	a4,119(sp)
    29bc:	34034c63          	bltz	t1,2d14 <_vfprintf_r+0xda4>
    29c0:	019d6733          	or	a4,s10,s9
    29c4:	f7f67e93          	and	t4,a2,-129
    29c8:	34071463          	bnez	a4,2d10 <_vfprintf_r+0xda0>
    29cc:	3a031a63          	bnez	t1,2d80 <_vfprintf_r+0xe10>
    29d0:	5c079ee3          	bnez	a5,37ac <_vfprintf_r+0x183c>
    29d4:	00167d13          	and	s10,a2,1
    29d8:	15010c13          	add	s8,sp,336
    29dc:	2c0d10e3          	bnez	s10,349c <_vfprintf_r+0x152c>
    29e0:	07714603          	lbu	a2,119(sp)
    29e4:	00030c93          	mv	s9,t1
    29e8:	01a35463          	bge	t1,s10,29f0 <_vfprintf_r+0xa80>
    29ec:	000d0c93          	mv	s9,s10
    29f0:	00012823          	sw	zero,16(sp)
    29f4:	02012223          	sw	zero,36(sp)
    29f8:	02012023          	sw	zero,32(sp)
    29fc:	00000a13          	li	s4,0
    2a00:	fa060863          	beqz	a2,21b0 <_vfprintf_r+0x240>
    2a04:	bcdff06f          	j	25d0 <_vfprintf_r+0x660>
    2a08:	00094e03          	lbu	t3,0(s2)
    2a0c:	080a6a13          	or	s4,s4,128
    2a10:	f10ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2a14:	00094e03          	lbu	t3,0(s2)
    2a18:	02a00793          	li	a5,42
    2a1c:	00190693          	add	a3,s2,1
    2a20:	00fe1463          	bne	t3,a5,2a28 <_vfprintf_r+0xab8>
    2a24:	1100206f          	j	4b34 <_vfprintf_r+0x2bc4>
    2a28:	fd0e0713          	add	a4,t3,-48
    2a2c:	00900793          	li	a5,9
    2a30:	00000b13          	li	s6,0
    2a34:	00900613          	li	a2,9
    2a38:	02e7e463          	bltu	a5,a4,2a60 <_vfprintf_r+0xaf0>
    2a3c:	0006ce03          	lbu	t3,0(a3)
    2a40:	002b1793          	sll	a5,s6,0x2
    2a44:	016787b3          	add	a5,a5,s6
    2a48:	00179793          	sll	a5,a5,0x1
    2a4c:	00e78b33          	add	s6,a5,a4
    2a50:	fd0e0713          	add	a4,t3,-48
    2a54:	00168693          	add	a3,a3,1
    2a58:	fee672e3          	bgeu	a2,a4,2a3c <_vfprintf_r+0xacc>
    2a5c:	320b4ce3          	bltz	s6,3594 <_vfprintf_r+0x1624>
    2a60:	00068913          	mv	s2,a3
    2a64:	ec0ff06f          	j	2124 <_vfprintf_r+0x1b4>
    2a68:	00094e03          	lbu	t3,0(s2)
    2a6c:	001a6a13          	or	s4,s4,1
    2a70:	eb0ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2a74:	07714783          	lbu	a5,119(sp)
    2a78:	00094e03          	lbu	t3,0(s2)
    2a7c:	ea079263          	bnez	a5,2120 <_vfprintf_r+0x1b0>
    2a80:	02000793          	li	a5,32
    2a84:	06f10ba3          	sb	a5,119(sp)
    2a88:	e98ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2a8c:	00094e03          	lbu	t3,0(s2)
    2a90:	06c00793          	li	a5,108
    2a94:	3afe00e3          	beq	t3,a5,3634 <_vfprintf_r+0x16c4>
    2a98:	010a6a13          	or	s4,s4,16
    2a9c:	e84ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2aa0:	00094e03          	lbu	t3,0(s2)
    2aa4:	008a6a13          	or	s4,s4,8
    2aa8:	e78ff06f          	j	2120 <_vfprintf_r+0x1b0>
    2aac:	000b0313          	mv	t1,s6
    2ab0:	010a6e93          	or	t4,s4,16
    2ab4:	020ef793          	and	a5,t4,32
    2ab8:	0c0786e3          	beqz	a5,3384 <_vfprintf_r+0x1414>
    2abc:	01412783          	lw	a5,20(sp)
    2ac0:	00778b13          	add	s6,a5,7
    2ac4:	ff8b7b13          	and	s6,s6,-8
    2ac8:	004b2783          	lw	a5,4(s6)
    2acc:	000b2d03          	lw	s10,0(s6)
    2ad0:	008b0713          	add	a4,s6,8
    2ad4:	00e12a23          	sw	a4,20(sp)
    2ad8:	00078c93          	mv	s9,a5
    2adc:	0c07cee3          	bltz	a5,33b8 <_vfprintf_r+0x1448>
    2ae0:	000e8613          	mv	a2,t4
    2ae4:	02034263          	bltz	t1,2b08 <_vfprintf_r+0xb98>
    2ae8:	019d67b3          	or	a5,s10,s9
    2aec:	f7fef613          	and	a2,t4,-129
    2af0:	00079c63          	bnez	a5,2b08 <_vfprintf_r+0xb98>
    2af4:	02031063          	bnez	t1,2b14 <_vfprintf_r+0xba4>
    2af8:	00000d13          	li	s10,0
    2afc:	00060e93          	mv	t4,a2
    2b00:	15010c13          	add	s8,sp,336
    2b04:	eddff06f          	j	29e0 <_vfprintf_r+0xa70>
    2b08:	520c90e3          	bnez	s9,3828 <_vfprintf_r+0x18b8>
    2b0c:	00900793          	li	a5,9
    2b10:	51a7ece3          	bltu	a5,s10,3828 <_vfprintf_r+0x18b8>
    2b14:	030d0d13          	add	s10,s10,48
    2b18:	15a107a3          	sb	s10,335(sp)
    2b1c:	00060e93          	mv	t4,a2
    2b20:	00100d13          	li	s10,1
    2b24:	14f10c13          	add	s8,sp,335
    2b28:	eb9ff06f          	j	29e0 <_vfprintf_r+0xa70>
    2b2c:	000b0313          	mv	t1,s6
    2b30:	010a6e93          	or	t4,s4,16
    2b34:	020ef793          	and	a5,t4,32
    2b38:	7e078463          	beqz	a5,3320 <_vfprintf_r+0x13b0>
    2b3c:	01412783          	lw	a5,20(sp)
    2b40:	00778b13          	add	s6,a5,7
    2b44:	ff8b7b13          	and	s6,s6,-8
    2b48:	000b2d03          	lw	s10,0(s6)
    2b4c:	004b2c83          	lw	s9,4(s6)
    2b50:	008b0793          	add	a5,s6,8
    2b54:	00f12a23          	sw	a5,20(sp)
    2b58:	bffef613          	and	a2,t4,-1025
    2b5c:	00000793          	li	a5,0
    2b60:	e55ff06f          	j	29b4 <_vfprintf_r+0xa44>
    2b64:	00094e03          	lbu	t3,0(s2)
    2b68:	06800793          	li	a5,104
    2b6c:	2cfe0ce3          	beq	t3,a5,3644 <_vfprintf_r+0x16d4>
    2b70:	040a6a13          	or	s4,s4,64
    2b74:	dacff06f          	j	2120 <_vfprintf_r+0x1b0>
    2b78:	01412703          	lw	a4,20(sp)
    2b7c:	000087b7          	lui	a5,0x8
    2b80:	83078793          	add	a5,a5,-2000 # 7830 <__fputwc+0x70>
    2b84:	06f11c23          	sh	a5,120(sp)
    2b88:	00470793          	add	a5,a4,4
    2b8c:	00f12a23          	sw	a5,20(sp)
    2b90:	0000c797          	auipc	a5,0xc
    2b94:	5fc78793          	add	a5,a5,1532 # f18c <__fini_array_end+0x1cc>
    2b98:	02f12c23          	sw	a5,56(sp)
    2b9c:	00072d03          	lw	s10,0(a4)
    2ba0:	000b0313          	mv	t1,s6
    2ba4:	00000c93          	li	s9,0
    2ba8:	002a6613          	or	a2,s4,2
    2bac:	00200793          	li	a5,2
    2bb0:	07800e13          	li	t3,120
    2bb4:	e01ff06f          	j	29b4 <_vfprintf_r+0xa44>
    2bb8:	020a7793          	and	a5,s4,32
    2bbc:	180784e3          	beqz	a5,3544 <_vfprintf_r+0x15d4>
    2bc0:	01412783          	lw	a5,20(sp)
    2bc4:	00c12683          	lw	a3,12(sp)
    2bc8:	0007a783          	lw	a5,0(a5)
    2bcc:	41f6d713          	sra	a4,a3,0x1f
    2bd0:	00d7a023          	sw	a3,0(a5)
    2bd4:	00e7a223          	sw	a4,4(a5)
    2bd8:	01412783          	lw	a5,20(sp)
    2bdc:	00090c13          	mv	s8,s2
    2be0:	00478793          	add	a5,a5,4
    2be4:	00f12a23          	sw	a5,20(sp)
    2be8:	cccff06f          	j	20b4 <_vfprintf_r+0x144>
    2bec:	06500713          	li	a4,101
    2bf0:	b3c754e3          	bge	a4,t3,2718 <_vfprintf_r+0x7a8>
    2bf4:	02812683          	lw	a3,40(sp)
    2bf8:	02c12703          	lw	a4,44(sp)
    2bfc:	00000613          	li	a2,0
    2c00:	00068513          	mv	a0,a3
    2c04:	00070593          	mv	a1,a4
    2c08:	00000693          	li	a3,0
    2c0c:	05d12223          	sw	t4,68(sp)
    2c10:	05d0a0ef          	jal	d46c <__eqdf2>
    2c14:	04412e83          	lw	t4,68(sp)
    2c18:	4e051463          	bnez	a0,3100 <_vfprintf_r+0x1190>
    2c1c:	0a412783          	lw	a5,164(sp)
    2c20:	0000c717          	auipc	a4,0xc
    2c24:	59c70713          	add	a4,a4,1436 # f1bc <__fini_array_end+0x1fc>
    2c28:	00e42023          	sw	a4,0(s0)
    2c2c:	00148493          	add	s1,s1,1
    2c30:	00100713          	li	a4,1
    2c34:	00178793          	add	a5,a5,1
    2c38:	00e42223          	sw	a4,4(s0)
    2c3c:	0a912423          	sw	s1,168(sp)
    2c40:	0af12223          	sw	a5,164(sp)
    2c44:	00700713          	li	a4,7
    2c48:	00840413          	add	s0,s0,8
    2c4c:	62f746e3          	blt	a4,a5,3a78 <_vfprintf_r+0x1b08>
    2c50:	07c12783          	lw	a5,124(sp)
    2c54:	01812703          	lw	a4,24(sp)
    2c58:	78e7de63          	bge	a5,a4,33f4 <_vfprintf_r+0x1484>
    2c5c:	03412783          	lw	a5,52(sp)
    2c60:	03012703          	lw	a4,48(sp)
    2c64:	00840413          	add	s0,s0,8
    2c68:	fef42c23          	sw	a5,-8(s0)
    2c6c:	0a412783          	lw	a5,164(sp)
    2c70:	00e484b3          	add	s1,s1,a4
    2c74:	fee42e23          	sw	a4,-4(s0)
    2c78:	00178793          	add	a5,a5,1
    2c7c:	0a912423          	sw	s1,168(sp)
    2c80:	0af12223          	sw	a5,164(sp)
    2c84:	00700713          	li	a4,7
    2c88:	1cf746e3          	blt	a4,a5,3654 <_vfprintf_r+0x16e4>
    2c8c:	01812783          	lw	a5,24(sp)
    2c90:	fff78d13          	add	s10,a5,-1
    2c94:	dfa05263          	blez	s10,2278 <_vfprintf_r+0x308>
    2c98:	01000713          	li	a4,16
    2c9c:	0a412783          	lw	a5,164(sp)
    2ca0:	0000d297          	auipc	t0,0xd
    2ca4:	9d428293          	add	t0,t0,-1580 # f674 <zeroes.0>
    2ca8:	77a752e3          	bge	a4,s10,3c0c <_vfprintf_r+0x1c9c>
    2cac:	00048713          	mv	a4,s1
    2cb0:	01000c13          	li	s8,16
    2cb4:	00700b13          	li	s6,7
    2cb8:	000e8493          	mv	s1,t4
    2cbc:	00028a13          	mv	s4,t0
    2cc0:	00c0006f          	j	2ccc <_vfprintf_r+0xd5c>
    2cc4:	ff0d0d13          	add	s10,s10,-16
    2cc8:	73ac5ce3          	bge	s8,s10,3c00 <_vfprintf_r+0x1c90>
    2ccc:	01070713          	add	a4,a4,16
    2cd0:	00178793          	add	a5,a5,1
    2cd4:	01442023          	sw	s4,0(s0)
    2cd8:	01842223          	sw	s8,4(s0)
    2cdc:	0ae12423          	sw	a4,168(sp)
    2ce0:	0af12223          	sw	a5,164(sp)
    2ce4:	00840413          	add	s0,s0,8
    2ce8:	fcfb5ee3          	bge	s6,a5,2cc4 <_vfprintf_r+0xd54>
    2cec:	00812583          	lw	a1,8(sp)
    2cf0:	0a010613          	add	a2,sp,160
    2cf4:	00098513          	mv	a0,s3
    2cf8:	134020ef          	jal	4e2c <__sprint_r>
    2cfc:	f4051263          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2d00:	0a812703          	lw	a4,168(sp)
    2d04:	0a412783          	lw	a5,164(sp)
    2d08:	0ac10413          	add	s0,sp,172
    2d0c:	fb9ff06f          	j	2cc4 <_vfprintf_r+0xd54>
    2d10:	000e8613          	mv	a2,t4
    2d14:	00100713          	li	a4,1
    2d18:	dee788e3          	beq	a5,a4,2b08 <_vfprintf_r+0xb98>
    2d1c:	00200713          	li	a4,2
    2d20:	06e78c63          	beq	a5,a4,2d98 <_vfprintf_r+0xe28>
    2d24:	15010c13          	add	s8,sp,336
    2d28:	01dc9793          	sll	a5,s9,0x1d
    2d2c:	007d7713          	and	a4,s10,7
    2d30:	003d5d13          	srl	s10,s10,0x3
    2d34:	03070713          	add	a4,a4,48
    2d38:	01a7ed33          	or	s10,a5,s10
    2d3c:	003cdc93          	srl	s9,s9,0x3
    2d40:	feec0fa3          	sb	a4,-1(s8)
    2d44:	019d67b3          	or	a5,s10,s9
    2d48:	000c0593          	mv	a1,s8
    2d4c:	fffc0c13          	add	s8,s8,-1
    2d50:	fc079ce3          	bnez	a5,2d28 <_vfprintf_r+0xdb8>
    2d54:	00167693          	and	a3,a2,1
    2d58:	06068a63          	beqz	a3,2dcc <_vfprintf_r+0xe5c>
    2d5c:	03000693          	li	a3,48
    2d60:	06d70663          	beq	a4,a3,2dcc <_vfprintf_r+0xe5c>
    2d64:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x8e>
    2d68:	15010793          	add	a5,sp,336
    2d6c:	fedc0fa3          	sb	a3,-1(s8)
    2d70:	40b78d33          	sub	s10,a5,a1
    2d74:	00060e93          	mv	t4,a2
    2d78:	00058c13          	mv	s8,a1
    2d7c:	c65ff06f          	j	29e0 <_vfprintf_r+0xa70>
    2d80:	00100713          	li	a4,1
    2d84:	00e79463          	bne	a5,a4,2d8c <_vfprintf_r+0xe1c>
    2d88:	2b10106f          	j	4838 <_vfprintf_r+0x28c8>
    2d8c:	00200713          	li	a4,2
    2d90:	000e8613          	mv	a2,t4
    2d94:	f8e798e3          	bne	a5,a4,2d24 <_vfprintf_r+0xdb4>
    2d98:	03812683          	lw	a3,56(sp)
    2d9c:	15010c13          	add	s8,sp,336
    2da0:	00fd7793          	and	a5,s10,15
    2da4:	00f687b3          	add	a5,a3,a5
    2da8:	0007c703          	lbu	a4,0(a5)
    2dac:	004d5d13          	srl	s10,s10,0x4
    2db0:	01cc9793          	sll	a5,s9,0x1c
    2db4:	01a7ed33          	or	s10,a5,s10
    2db8:	004cdc93          	srl	s9,s9,0x4
    2dbc:	feec0fa3          	sb	a4,-1(s8)
    2dc0:	019d67b3          	or	a5,s10,s9
    2dc4:	fffc0c13          	add	s8,s8,-1
    2dc8:	fc079ce3          	bnez	a5,2da0 <_vfprintf_r+0xe30>
    2dcc:	15010793          	add	a5,sp,336
    2dd0:	41878d33          	sub	s10,a5,s8
    2dd4:	00060e93          	mv	t4,a2
    2dd8:	c09ff06f          	j	29e0 <_vfprintf_r+0xa70>
    2ddc:	419b8b33          	sub	s6,s7,s9
    2de0:	c7605063          	blez	s6,2240 <_vfprintf_r+0x2d0>
    2de4:	01000593          	li	a1,16
    2de8:	0a412603          	lw	a2,164(sp)
    2dec:	0000d297          	auipc	t0,0xd
    2df0:	88828293          	add	t0,t0,-1912 # f674 <zeroes.0>
    2df4:	0b65d463          	bge	a1,s6,2e9c <_vfprintf_r+0xf2c>
    2df8:	00040793          	mv	a5,s0
    2dfc:	00048713          	mv	a4,s1
    2e00:	000b0413          	mv	s0,s6
    2e04:	01000893          	li	a7,16
    2e08:	000a0b13          	mv	s6,s4
    2e0c:	00700f93          	li	t6,7
    2e10:	05d12223          	sw	t4,68(sp)
    2e14:	05c12823          	sw	t3,80(sp)
    2e18:	00030a13          	mv	s4,t1
    2e1c:	00028493          	mv	s1,t0
    2e20:	00c0006f          	j	2e2c <_vfprintf_r+0xebc>
    2e24:	ff040413          	add	s0,s0,-16
    2e28:	0488da63          	bge	a7,s0,2e7c <_vfprintf_r+0xf0c>
    2e2c:	01070713          	add	a4,a4,16
    2e30:	00160613          	add	a2,a2,1
    2e34:	0097a023          	sw	s1,0(a5)
    2e38:	0117a223          	sw	a7,4(a5)
    2e3c:	0ae12423          	sw	a4,168(sp)
    2e40:	0ac12223          	sw	a2,164(sp)
    2e44:	00878793          	add	a5,a5,8
    2e48:	fccfdee3          	bge	t6,a2,2e24 <_vfprintf_r+0xeb4>
    2e4c:	00812583          	lw	a1,8(sp)
    2e50:	0a010613          	add	a2,sp,160
    2e54:	00098513          	mv	a0,s3
    2e58:	7d5010ef          	jal	4e2c <__sprint_r>
    2e5c:	de051263          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2e60:	01000893          	li	a7,16
    2e64:	ff040413          	add	s0,s0,-16
    2e68:	0a812703          	lw	a4,168(sp)
    2e6c:	0a412603          	lw	a2,164(sp)
    2e70:	0ac10793          	add	a5,sp,172
    2e74:	00700f93          	li	t6,7
    2e78:	fa88cae3          	blt	a7,s0,2e2c <_vfprintf_r+0xebc>
    2e7c:	04412e83          	lw	t4,68(sp)
    2e80:	05012e03          	lw	t3,80(sp)
    2e84:	000a0313          	mv	t1,s4
    2e88:	00048293          	mv	t0,s1
    2e8c:	000b0a13          	mv	s4,s6
    2e90:	00070493          	mv	s1,a4
    2e94:	00040b13          	mv	s6,s0
    2e98:	00078413          	mv	s0,a5
    2e9c:	016484b3          	add	s1,s1,s6
    2ea0:	00160613          	add	a2,a2,1
    2ea4:	00542023          	sw	t0,0(s0)
    2ea8:	01642223          	sw	s6,4(s0)
    2eac:	0a912423          	sw	s1,168(sp)
    2eb0:	0ac12223          	sw	a2,164(sp)
    2eb4:	00700713          	li	a4,7
    2eb8:	00840413          	add	s0,s0,8
    2ebc:	b8c75263          	bge	a4,a2,2240 <_vfprintf_r+0x2d0>
    2ec0:	00812583          	lw	a1,8(sp)
    2ec4:	0a010613          	add	a2,sp,160
    2ec8:	00098513          	mv	a0,s3
    2ecc:	04612a23          	sw	t1,84(sp)
    2ed0:	05c12823          	sw	t3,80(sp)
    2ed4:	05d12223          	sw	t4,68(sp)
    2ed8:	755010ef          	jal	4e2c <__sprint_r>
    2edc:	d6051263          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2ee0:	0a812483          	lw	s1,168(sp)
    2ee4:	05412303          	lw	t1,84(sp)
    2ee8:	05012e03          	lw	t3,80(sp)
    2eec:	04412e83          	lw	t4,68(sp)
    2ef0:	0ac10413          	add	s0,sp,172
    2ef4:	b4cff06f          	j	2240 <_vfprintf_r+0x2d0>
    2ef8:	01000713          	li	a4,16
    2efc:	0a412603          	lw	a2,164(sp)
    2f00:	0000c297          	auipc	t0,0xc
    2f04:	77428293          	add	t0,t0,1908 # f674 <zeroes.0>
    2f08:	0b675063          	bge	a4,s6,2fa8 <_vfprintf_r+0x1038>
    2f0c:	00040793          	mv	a5,s0
    2f10:	00048693          	mv	a3,s1
    2f14:	000b0413          	mv	s0,s6
    2f18:	01000713          	li	a4,16
    2f1c:	00700893          	li	a7,7
    2f20:	05d12223          	sw	t4,68(sp)
    2f24:	000e0493          	mv	s1,t3
    2f28:	00028b13          	mv	s6,t0
    2f2c:	00c0006f          	j	2f38 <_vfprintf_r+0xfc8>
    2f30:	ff040413          	add	s0,s0,-16
    2f34:	04875e63          	bge	a4,s0,2f90 <_vfprintf_r+0x1020>
    2f38:	01068693          	add	a3,a3,16
    2f3c:	00160613          	add	a2,a2,1
    2f40:	0000c597          	auipc	a1,0xc
    2f44:	73458593          	add	a1,a1,1844 # f674 <zeroes.0>
    2f48:	00b7a023          	sw	a1,0(a5)
    2f4c:	00e7a223          	sw	a4,4(a5)
    2f50:	0ad12423          	sw	a3,168(sp)
    2f54:	0ac12223          	sw	a2,164(sp)
    2f58:	00878793          	add	a5,a5,8
    2f5c:	fcc8dae3          	bge	a7,a2,2f30 <_vfprintf_r+0xfc0>
    2f60:	00812583          	lw	a1,8(sp)
    2f64:	0a010613          	add	a2,sp,160
    2f68:	00098513          	mv	a0,s3
    2f6c:	6c1010ef          	jal	4e2c <__sprint_r>
    2f70:	cc051863          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2f74:	01000713          	li	a4,16
    2f78:	ff040413          	add	s0,s0,-16
    2f7c:	0a812683          	lw	a3,168(sp)
    2f80:	0a412603          	lw	a2,164(sp)
    2f84:	0ac10793          	add	a5,sp,172
    2f88:	00700893          	li	a7,7
    2f8c:	fa8746e3          	blt	a4,s0,2f38 <_vfprintf_r+0xfc8>
    2f90:	04412e83          	lw	t4,68(sp)
    2f94:	00048e13          	mv	t3,s1
    2f98:	000b0293          	mv	t0,s6
    2f9c:	00068493          	mv	s1,a3
    2fa0:	00040b13          	mv	s6,s0
    2fa4:	00078413          	mv	s0,a5
    2fa8:	016484b3          	add	s1,s1,s6
    2fac:	00160613          	add	a2,a2,1
    2fb0:	00542023          	sw	t0,0(s0)
    2fb4:	01642223          	sw	s6,4(s0)
    2fb8:	0a912423          	sw	s1,168(sp)
    2fbc:	0ac12223          	sw	a2,164(sp)
    2fc0:	00700713          	li	a4,7
    2fc4:	00840413          	add	s0,s0,8
    2fc8:	a8c75063          	bge	a4,a2,2248 <_vfprintf_r+0x2d8>
    2fcc:	00812583          	lw	a1,8(sp)
    2fd0:	0a010613          	add	a2,sp,160
    2fd4:	00098513          	mv	a0,s3
    2fd8:	05c12823          	sw	t3,80(sp)
    2fdc:	05d12223          	sw	t4,68(sp)
    2fe0:	64d010ef          	jal	4e2c <__sprint_r>
    2fe4:	c4051e63          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    2fe8:	0a812483          	lw	s1,168(sp)
    2fec:	05012e03          	lw	t3,80(sp)
    2ff0:	04412e83          	lw	t4,68(sp)
    2ff4:	0ac10413          	add	s0,sp,172
    2ff8:	a50ff06f          	j	2248 <_vfprintf_r+0x2d8>
    2ffc:	00812583          	lw	a1,8(sp)
    3000:	0a010613          	add	a2,sp,160
    3004:	00098513          	mv	a0,s3
    3008:	04612c23          	sw	t1,88(sp)
    300c:	05c12a23          	sw	t3,84(sp)
    3010:	05d12823          	sw	t4,80(sp)
    3014:	05f12223          	sw	t6,68(sp)
    3018:	615010ef          	jal	4e2c <__sprint_r>
    301c:	c2051263          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    3020:	0a812483          	lw	s1,168(sp)
    3024:	05812303          	lw	t1,88(sp)
    3028:	05412e03          	lw	t3,84(sp)
    302c:	05012e83          	lw	t4,80(sp)
    3030:	04412f83          	lw	t6,68(sp)
    3034:	0ac10413          	add	s0,sp,172
    3038:	a00ff06f          	j	2238 <_vfprintf_r+0x2c8>
    303c:	01000713          	li	a4,16
    3040:	0a412783          	lw	a5,164(sp)
    3044:	0000cb17          	auipc	s6,0xc
    3048:	640b0b13          	add	s6,s6,1600 # f684 <blanks.1>
    304c:	07a75c63          	bge	a4,s10,30c4 <_vfprintf_r+0x1154>
    3050:	000b0713          	mv	a4,s6
    3054:	01000c13          	li	s8,16
    3058:	00090b13          	mv	s6,s2
    305c:	00700a13          	li	s4,7
    3060:	00070913          	mv	s2,a4
    3064:	00c0006f          	j	3070 <_vfprintf_r+0x1100>
    3068:	ff0d0d13          	add	s10,s10,-16
    306c:	05ac5663          	bge	s8,s10,30b8 <_vfprintf_r+0x1148>
    3070:	01048493          	add	s1,s1,16
    3074:	00178793          	add	a5,a5,1
    3078:	01242023          	sw	s2,0(s0)
    307c:	01842223          	sw	s8,4(s0)
    3080:	0a912423          	sw	s1,168(sp)
    3084:	0af12223          	sw	a5,164(sp)
    3088:	00840413          	add	s0,s0,8
    308c:	fcfa5ee3          	bge	s4,a5,3068 <_vfprintf_r+0x10f8>
    3090:	00812583          	lw	a1,8(sp)
    3094:	0a010613          	add	a2,sp,160
    3098:	00098513          	mv	a0,s3
    309c:	591010ef          	jal	4e2c <__sprint_r>
    30a0:	ba051063          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    30a4:	ff0d0d13          	add	s10,s10,-16
    30a8:	0a812483          	lw	s1,168(sp)
    30ac:	0a412783          	lw	a5,164(sp)
    30b0:	0ac10413          	add	s0,sp,172
    30b4:	fbac4ee3          	blt	s8,s10,3070 <_vfprintf_r+0x1100>
    30b8:	00090713          	mv	a4,s2
    30bc:	000b0913          	mv	s2,s6
    30c0:	00070b13          	mv	s6,a4
    30c4:	01a484b3          	add	s1,s1,s10
    30c8:	00178793          	add	a5,a5,1
    30cc:	01642023          	sw	s6,0(s0)
    30d0:	01a42223          	sw	s10,4(s0)
    30d4:	0a912423          	sw	s1,168(sp)
    30d8:	0af12223          	sw	a5,164(sp)
    30dc:	00700713          	li	a4,7
    30e0:	9af75463          	bge	a4,a5,2288 <_vfprintf_r+0x318>
    30e4:	00812583          	lw	a1,8(sp)
    30e8:	0a010613          	add	a2,sp,160
    30ec:	00098513          	mv	a0,s3
    30f0:	53d010ef          	jal	4e2c <__sprint_r>
    30f4:	b4051663          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    30f8:	0a812483          	lw	s1,168(sp)
    30fc:	98cff06f          	j	2288 <_vfprintf_r+0x318>
    3100:	07c12683          	lw	a3,124(sp)
    3104:	30d05c63          	blez	a3,341c <_vfprintf_r+0x14ac>
    3108:	01812783          	lw	a5,24(sp)
    310c:	000a0b13          	mv	s6,s4
    3110:	0147d463          	bge	a5,s4,3118 <_vfprintf_r+0x11a8>
    3114:	00078b13          	mv	s6,a5
    3118:	03605863          	blez	s6,3148 <_vfprintf_r+0x11d8>
    311c:	0a412683          	lw	a3,164(sp)
    3120:	016484b3          	add	s1,s1,s6
    3124:	01842023          	sw	s8,0(s0)
    3128:	00168693          	add	a3,a3,1
    312c:	01642223          	sw	s6,4(s0)
    3130:	0a912423          	sw	s1,168(sp)
    3134:	0ad12223          	sw	a3,164(sp)
    3138:	00700613          	li	a2,7
    313c:	00840413          	add	s0,s0,8
    3140:	00d65463          	bge	a2,a3,3148 <_vfprintf_r+0x11d8>
    3144:	5c40106f          	j	4708 <_vfprintf_r+0x2798>
    3148:	fffb4693          	not	a3,s6
    314c:	41f6d693          	sra	a3,a3,0x1f
    3150:	00db7733          	and	a4,s6,a3
    3154:	40ea0b33          	sub	s6,s4,a4
    3158:	35604ae3          	bgtz	s6,3cac <_vfprintf_r+0x1d3c>
    315c:	400ef713          	and	a4,t4,1024
    3160:	014c0333          	add	t1,s8,s4
    3164:	00070463          	beqz	a4,316c <_vfprintf_r+0x11fc>
    3168:	2980106f          	j	4400 <_vfprintf_r+0x2490>
    316c:	07c12d03          	lw	s10,124(sp)
    3170:	01812783          	lw	a5,24(sp)
    3174:	5afd4063          	blt	s10,a5,3714 <_vfprintf_r+0x17a4>
    3178:	001ef713          	and	a4,t4,1
    317c:	58071c63          	bnez	a4,3714 <_vfprintf_r+0x17a4>
    3180:	01812703          	lw	a4,24(sp)
    3184:	00ec07b3          	add	a5,s8,a4
    3188:	41a70d33          	sub	s10,a4,s10
    318c:	40678b33          	sub	s6,a5,t1
    3190:	016d5463          	bge	s10,s6,3198 <_vfprintf_r+0x1228>
    3194:	000d0b13          	mv	s6,s10
    3198:	03605863          	blez	s6,31c8 <_vfprintf_r+0x1258>
    319c:	0a412703          	lw	a4,164(sp)
    31a0:	016484b3          	add	s1,s1,s6
    31a4:	00642023          	sw	t1,0(s0)
    31a8:	00170713          	add	a4,a4,1
    31ac:	01642223          	sw	s6,4(s0)
    31b0:	0a912423          	sw	s1,168(sp)
    31b4:	0ae12223          	sw	a4,164(sp)
    31b8:	00700693          	li	a3,7
    31bc:	00840413          	add	s0,s0,8
    31c0:	00e6d463          	bge	a3,a4,31c8 <_vfprintf_r+0x1258>
    31c4:	5880106f          	j	474c <_vfprintf_r+0x27dc>
    31c8:	fffb4713          	not	a4,s6
    31cc:	41f75713          	sra	a4,a4,0x1f
    31d0:	00eb77b3          	and	a5,s6,a4
    31d4:	40fd0d33          	sub	s10,s10,a5
    31d8:	8ba05063          	blez	s10,2278 <_vfprintf_r+0x308>
    31dc:	01000713          	li	a4,16
    31e0:	0a412783          	lw	a5,164(sp)
    31e4:	0000c297          	auipc	t0,0xc
    31e8:	49028293          	add	t0,t0,1168 # f674 <zeroes.0>
    31ec:	23a750e3          	bge	a4,s10,3c0c <_vfprintf_r+0x1c9c>
    31f0:	00048713          	mv	a4,s1
    31f4:	01000c13          	li	s8,16
    31f8:	00700b13          	li	s6,7
    31fc:	000e8493          	mv	s1,t4
    3200:	00028a13          	mv	s4,t0
    3204:	00c0006f          	j	3210 <_vfprintf_r+0x12a0>
    3208:	ff0d0d13          	add	s10,s10,-16
    320c:	1fac5ae3          	bge	s8,s10,3c00 <_vfprintf_r+0x1c90>
    3210:	01070713          	add	a4,a4,16
    3214:	00178793          	add	a5,a5,1
    3218:	01442023          	sw	s4,0(s0)
    321c:	01842223          	sw	s8,4(s0)
    3220:	0ae12423          	sw	a4,168(sp)
    3224:	0af12223          	sw	a5,164(sp)
    3228:	00840413          	add	s0,s0,8
    322c:	fcfb5ee3          	bge	s6,a5,3208 <_vfprintf_r+0x1298>
    3230:	00812583          	lw	a1,8(sp)
    3234:	0a010613          	add	a2,sp,160
    3238:	00098513          	mv	a0,s3
    323c:	3f1010ef          	jal	4e2c <__sprint_r>
    3240:	a0051063          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    3244:	0a812703          	lw	a4,168(sp)
    3248:	0a412783          	lw	a5,164(sp)
    324c:	0ac10413          	add	s0,sp,172
    3250:	fb9ff06f          	j	3208 <_vfprintf_r+0x1298>
    3254:	001ef613          	and	a2,t4,1
    3258:	ce061063          	bnez	a2,2738 <_vfprintf_r+0x7c8>
    325c:	00d42223          	sw	a3,4(s0)
    3260:	0a912423          	sw	s1,168(sp)
    3264:	0ba12223          	sw	s10,164(sp)
    3268:	00700793          	li	a5,7
    326c:	d7a7d863          	bge	a5,s10,27dc <_vfprintf_r+0x86c>
    3270:	00812583          	lw	a1,8(sp)
    3274:	0a010613          	add	a2,sp,160
    3278:	00098513          	mv	a0,s3
    327c:	03d12023          	sw	t4,32(sp)
    3280:	3ad010ef          	jal	4e2c <__sprint_r>
    3284:	9a051e63          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    3288:	0a812483          	lw	s1,168(sp)
    328c:	0a412d03          	lw	s10,164(sp)
    3290:	02012e83          	lw	t4,32(sp)
    3294:	0ac10b13          	add	s6,sp,172
    3298:	d44ff06f          	j	27dc <_vfprintf_r+0x86c>
    329c:	01812703          	lw	a4,24(sp)
    32a0:	00100793          	li	a5,1
    32a4:	d2e7dc63          	bge	a5,a4,27dc <_vfprintf_r+0x86c>
    32a8:	01100793          	li	a5,17
    32ac:	0000c297          	auipc	t0,0xc
    32b0:	3c828293          	add	t0,t0,968 # f674 <zeroes.0>
    32b4:	18e7d4e3          	bge	a5,a4,3c3c <_vfprintf_r+0x1ccc>
    32b8:	00040a13          	mv	s4,s0
    32bc:	01000793          	li	a5,16
    32c0:	00700c13          	li	s8,7
    32c4:	03d12023          	sw	t4,32(sp)
    32c8:	00028413          	mv	s0,t0
    32cc:	00c0006f          	j	32d8 <_vfprintf_r+0x1368>
    32d0:	ff0a0a13          	add	s4,s4,-16
    32d4:	1547dee3          	bge	a5,s4,3c30 <_vfprintf_r+0x1cc0>
    32d8:	01048493          	add	s1,s1,16
    32dc:	001d0d13          	add	s10,s10,1
    32e0:	008b2023          	sw	s0,0(s6)
    32e4:	00fb2223          	sw	a5,4(s6)
    32e8:	0a912423          	sw	s1,168(sp)
    32ec:	0ba12223          	sw	s10,164(sp)
    32f0:	008b0b13          	add	s6,s6,8
    32f4:	fdac5ee3          	bge	s8,s10,32d0 <_vfprintf_r+0x1360>
    32f8:	00812583          	lw	a1,8(sp)
    32fc:	0a010613          	add	a2,sp,160
    3300:	00098513          	mv	a0,s3
    3304:	329010ef          	jal	4e2c <__sprint_r>
    3308:	92051c63          	bnez	a0,2440 <_vfprintf_r+0x4d0>
    330c:	0a812483          	lw	s1,168(sp)
    3310:	0a412d03          	lw	s10,164(sp)
    3314:	0ac10b13          	add	s6,sp,172
    3318:	01000793          	li	a5,16
    331c:	fb5ff06f          	j	32d0 <_vfprintf_r+0x1360>
    3320:	01412703          	lw	a4,20(sp)
    3324:	010ef793          	and	a5,t4,16
    3328:	00072d03          	lw	s10,0(a4)
    332c:	00470713          	add	a4,a4,4
    3330:	00e12a23          	sw	a4,20(sp)
    3334:	1a079663          	bnez	a5,34e0 <_vfprintf_r+0x1570>
    3338:	040ef793          	and	a5,t4,64
    333c:	18078e63          	beqz	a5,34d8 <_vfprintf_r+0x1568>
    3340:	010d1d13          	sll	s10,s10,0x10
    3344:	010d5d13          	srl	s10,s10,0x10
    3348:	00000c93          	li	s9,0
    334c:	80dff06f          	j	2b58 <_vfprintf_r+0xbe8>
    3350:	01412703          	lw	a4,20(sp)
    3354:	01067793          	and	a5,a2,16
    3358:	00072d03          	lw	s10,0(a4)
    335c:	00470713          	add	a4,a4,4
    3360:	00e12a23          	sw	a4,20(sp)
    3364:	14079a63          	bnez	a5,34b8 <_vfprintf_r+0x1548>
    3368:	04067793          	and	a5,a2,64
    336c:	14078063          	beqz	a5,34ac <_vfprintf_r+0x153c>
    3370:	010d1d13          	sll	s10,s10,0x10
    3374:	010d5d13          	srl	s10,s10,0x10
    3378:	00000c93          	li	s9,0
    337c:	00100793          	li	a5,1
    3380:	e34ff06f          	j	29b4 <_vfprintf_r+0xa44>
    3384:	01412703          	lw	a4,20(sp)
    3388:	010ef793          	and	a5,t4,16
    338c:	00072d03          	lw	s10,0(a4)
    3390:	00470713          	add	a4,a4,4
    3394:	00e12a23          	sw	a4,20(sp)
    3398:	12079a63          	bnez	a5,34cc <_vfprintf_r+0x155c>
    339c:	040ef793          	and	a5,t4,64
    33a0:	12078263          	beqz	a5,34c4 <_vfprintf_r+0x1554>
    33a4:	010d1d13          	sll	s10,s10,0x10
    33a8:	410d5d13          	sra	s10,s10,0x10
    33ac:	41fd5c93          	sra	s9,s10,0x1f
    33b0:	000c8793          	mv	a5,s9
    33b4:	f207d663          	bgez	a5,2ae0 <_vfprintf_r+0xb70>
    33b8:	01a037b3          	snez	a5,s10
    33bc:	419000b3          	neg	ra,s9
    33c0:	40f08cb3          	sub	s9,ra,a5
    33c4:	41a00d33          	neg	s10,s10
    33c8:	000e8613          	mv	a2,t4
    33cc:	02d00713          	li	a4,45
    33d0:	00100793          	li	a5,1
    33d4:	de4ff06f          	j	29b8 <_vfprintf_r+0xa48>
    33d8:	00812403          	lw	s0,8(sp)
    33dc:	00f12623          	sw	a5,12(sp)
    33e0:	05842503          	lw	a0,88(s0)
    33e4:	c31fd0ef          	jal	1014 <__retarget_lock_acquire_recursive>
    33e8:	00c41703          	lh	a4,12(s0)
    33ec:	00c12783          	lw	a5,12(sp)
    33f0:	c01fe06f          	j	1ff0 <_vfprintf_r+0x80>
    33f4:	001ef793          	and	a5,t4,1
    33f8:	00079463          	bnez	a5,3400 <_vfprintf_r+0x1490>
    33fc:	e7dfe06f          	j	2278 <_vfprintf_r+0x308>
    3400:	85dff06f          	j	2c5c <_vfprintf_r+0xcec>
    3404:	000a0e93          	mv	t4,s4
    3408:	000b0313          	mv	t1,s6
    340c:	ea8ff06f          	j	2ab4 <_vfprintf_r+0xb44>
    3410:	00094e03          	lbu	t3,0(s2)
    3414:	00f12a23          	sw	a5,20(sp)
    3418:	d09fe06f          	j	2120 <_vfprintf_r+0x1b0>
    341c:	0a412703          	lw	a4,164(sp)
    3420:	0000c617          	auipc	a2,0xc
    3424:	d9c60613          	add	a2,a2,-612 # f1bc <__fini_array_end+0x1fc>
    3428:	00c42023          	sw	a2,0(s0)
    342c:	00148493          	add	s1,s1,1
    3430:	00100613          	li	a2,1
    3434:	00170713          	add	a4,a4,1
    3438:	00c42223          	sw	a2,4(s0)
    343c:	0a912423          	sw	s1,168(sp)
    3440:	0ae12223          	sw	a4,164(sp)
    3444:	00700613          	li	a2,7
    3448:	00840413          	add	s0,s0,8
    344c:	2ee64ce3          	blt	a2,a4,3f44 <_vfprintf_r+0x1fd4>
    3450:	7e069e63          	bnez	a3,3c4c <_vfprintf_r+0x1cdc>
    3454:	01812783          	lw	a5,24(sp)
    3458:	001ef713          	and	a4,t4,1
    345c:	00f76733          	or	a4,a4,a5
    3460:	00071463          	bnez	a4,3468 <_vfprintf_r+0x14f8>
    3464:	e15fe06f          	j	2278 <_vfprintf_r+0x308>
    3468:	03412703          	lw	a4,52(sp)
    346c:	03012783          	lw	a5,48(sp)
    3470:	00700693          	li	a3,7
    3474:	00e42023          	sw	a4,0(s0)
    3478:	0a412703          	lw	a4,164(sp)
    347c:	009784b3          	add	s1,a5,s1
    3480:	00f42223          	sw	a5,4(s0)
    3484:	00170713          	add	a4,a4,1
    3488:	0a912423          	sw	s1,168(sp)
    348c:	0ae12223          	sw	a4,164(sp)
    3490:	38e6c8e3          	blt	a3,a4,4020 <_vfprintf_r+0x20b0>
    3494:	00840413          	add	s0,s0,8
    3498:	7e80006f          	j	3c80 <_vfprintf_r+0x1d10>
    349c:	03000793          	li	a5,48
    34a0:	14f107a3          	sb	a5,335(sp)
    34a4:	14f10c13          	add	s8,sp,335
    34a8:	d38ff06f          	j	29e0 <_vfprintf_r+0xa70>
    34ac:	20067793          	and	a5,a2,512
    34b0:	00078463          	beqz	a5,34b8 <_vfprintf_r+0x1548>
    34b4:	0ffd7d13          	zext.b	s10,s10
    34b8:	00000c93          	li	s9,0
    34bc:	00100793          	li	a5,1
    34c0:	cf4ff06f          	j	29b4 <_vfprintf_r+0xa44>
    34c4:	200ef793          	and	a5,t4,512
    34c8:	2c0796e3          	bnez	a5,3f94 <_vfprintf_r+0x2024>
    34cc:	41fd5c93          	sra	s9,s10,0x1f
    34d0:	000c8793          	mv	a5,s9
    34d4:	e08ff06f          	j	2adc <_vfprintf_r+0xb6c>
    34d8:	200ef793          	and	a5,t4,512
    34dc:	2a0790e3          	bnez	a5,3f7c <_vfprintf_r+0x200c>
    34e0:	00000c93          	li	s9,0
    34e4:	e74ff06f          	j	2b58 <_vfprintf_r+0xbe8>
    34e8:	01412783          	lw	a5,20(sp)
    34ec:	06010513          	add	a0,sp,96
    34f0:	03612223          	sw	s6,36(sp)
    34f4:	0007a703          	lw	a4,0(a5)
    34f8:	03c12023          	sw	t3,32(sp)
    34fc:	00478b13          	add	s6,a5,4
    3500:	00072683          	lw	a3,0(a4)
    3504:	01412823          	sw	s4,16(sp)
    3508:	06d12023          	sw	a3,96(sp)
    350c:	00472683          	lw	a3,4(a4)
    3510:	06d12223          	sw	a3,100(sp)
    3514:	00872683          	lw	a3,8(a4)
    3518:	06d12423          	sw	a3,104(sp)
    351c:	00c72703          	lw	a4,12(a4)
    3520:	06e12623          	sw	a4,108(sp)
    3524:	4c80b0ef          	jal	e9ec <__trunctfdf2>
    3528:	02012e03          	lw	t3,32(sp)
    352c:	02412303          	lw	t1,36(sp)
    3530:	02a12423          	sw	a0,40(sp)
    3534:	02b12623          	sw	a1,44(sp)
    3538:	01612a23          	sw	s6,20(sp)
    353c:	000a0e93          	mv	t4,s4
    3540:	fb1fe06f          	j	24f0 <_vfprintf_r+0x580>
    3544:	010a7793          	and	a5,s4,16
    3548:	6c079a63          	bnez	a5,3c1c <_vfprintf_r+0x1cac>
    354c:	040a7793          	and	a5,s4,64
    3550:	24079ce3          	bnez	a5,3fa8 <_vfprintf_r+0x2038>
    3554:	200a7f13          	and	t5,s4,512
    3558:	6c0f0263          	beqz	t5,3c1c <_vfprintf_r+0x1cac>
    355c:	01412783          	lw	a5,20(sp)
    3560:	00c12703          	lw	a4,12(sp)
    3564:	0007a783          	lw	a5,0(a5)
    3568:	00e78023          	sb	a4,0(a5)
    356c:	e6cff06f          	j	2bd8 <_vfprintf_r+0xc68>
    3570:	03c12783          	lw	a5,60(sp)
    3574:	00094e03          	lbu	t3,0(s2)
    3578:	00079463          	bnez	a5,3580 <_vfprintf_r+0x1610>
    357c:	ba5fe06f          	j	2120 <_vfprintf_r+0x1b0>
    3580:	0007c783          	lbu	a5,0(a5)
    3584:	00079463          	bnez	a5,358c <_vfprintf_r+0x161c>
    3588:	b99fe06f          	j	2120 <_vfprintf_r+0x1b0>
    358c:	400a6a13          	or	s4,s4,1024
    3590:	b91fe06f          	j	2120 <_vfprintf_r+0x1b0>
    3594:	fff00b13          	li	s6,-1
    3598:	00068913          	mv	s2,a3
    359c:	b89fe06f          	j	2124 <_vfprintf_r+0x1b4>
    35a0:	0000c797          	auipc	a5,0xc
    35a4:	c0078793          	add	a5,a5,-1024 # f1a0 <__fini_array_end+0x1e0>
    35a8:	000a0e93          	mv	t4,s4
    35ac:	000b0313          	mv	t1,s6
    35b0:	02f12c23          	sw	a5,56(sp)
    35b4:	020ef793          	and	a5,t4,32
    35b8:	1c078263          	beqz	a5,377c <_vfprintf_r+0x180c>
    35bc:	01412783          	lw	a5,20(sp)
    35c0:	00778b13          	add	s6,a5,7
    35c4:	ff8b7b13          	and	s6,s6,-8
    35c8:	000b2d03          	lw	s10,0(s6)
    35cc:	004b2c83          	lw	s9,4(s6)
    35d0:	008b0793          	add	a5,s6,8
    35d4:	00f12a23          	sw	a5,20(sp)
    35d8:	001ef793          	and	a5,t4,1
    35dc:	00078e63          	beqz	a5,35f8 <_vfprintf_r+0x1688>
    35e0:	019d67b3          	or	a5,s10,s9
    35e4:	00078a63          	beqz	a5,35f8 <_vfprintf_r+0x1688>
    35e8:	03000793          	li	a5,48
    35ec:	06f10c23          	sb	a5,120(sp)
    35f0:	07c10ca3          	sb	t3,121(sp)
    35f4:	002eee93          	or	t4,t4,2
    35f8:	bffef613          	and	a2,t4,-1025
    35fc:	00200793          	li	a5,2
    3600:	bb4ff06f          	j	29b4 <_vfprintf_r+0xa44>
    3604:	000b0313          	mv	t1,s6
    3608:	000a0613          	mv	a2,s4
    360c:	b80ff06f          	j	298c <_vfprintf_r+0xa1c>
    3610:	000a0e93          	mv	t4,s4
    3614:	000b0313          	mv	t1,s6
    3618:	d1cff06f          	j	2b34 <_vfprintf_r+0xbc4>
    361c:	0000c797          	auipc	a5,0xc
    3620:	b7078793          	add	a5,a5,-1168 # f18c <__fini_array_end+0x1cc>
    3624:	000a0e93          	mv	t4,s4
    3628:	000b0313          	mv	t1,s6
    362c:	02f12c23          	sw	a5,56(sp)
    3630:	f85ff06f          	j	35b4 <_vfprintf_r+0x1644>
    3634:	00194e03          	lbu	t3,1(s2)
    3638:	020a6a13          	or	s4,s4,32
    363c:	00190913          	add	s2,s2,1
    3640:	ae1fe06f          	j	2120 <_vfprintf_r+0x1b0>
    3644:	00194e03          	lbu	t3,1(s2)
    3648:	200a6a13          	or	s4,s4,512
    364c:	00190913          	add	s2,s2,1
    3650:	ad1fe06f          	j	2120 <_vfprintf_r+0x1b0>
    3654:	00812583          	lw	a1,8(sp)
    3658:	0a010613          	add	a2,sp,160
    365c:	00098513          	mv	a0,s3
    3660:	03d12023          	sw	t4,32(sp)
    3664:	7c8010ef          	jal	4e2c <__sprint_r>
    3668:	00050463          	beqz	a0,3670 <_vfprintf_r+0x1700>
    366c:	dd5fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3670:	0a812483          	lw	s1,168(sp)
    3674:	02012e83          	lw	t4,32(sp)
    3678:	0ac10413          	add	s0,sp,172
    367c:	e10ff06f          	j	2c8c <_vfprintf_r+0xd1c>
    3680:	00600793          	li	a5,6
    3684:	00030c93          	mv	s9,t1
    3688:	0e67e6e3          	bltu	a5,t1,3f74 <_vfprintf_r+0x2004>
    368c:	01612a23          	sw	s6,20(sp)
    3690:	00012823          	sw	zero,16(sp)
    3694:	000c8d13          	mv	s10,s9
    3698:	00000613          	li	a2,0
    369c:	00000313          	li	t1,0
    36a0:	02012223          	sw	zero,36(sp)
    36a4:	02012023          	sw	zero,32(sp)
    36a8:	00000a13          	li	s4,0
    36ac:	0000cc17          	auipc	s8,0xc
    36b0:	b08c0c13          	add	s8,s8,-1272 # f1b4 <__fini_array_end+0x1f4>
    36b4:	afdfe06f          	j	21b0 <_vfprintf_r+0x240>
    36b8:	00800613          	li	a2,8
    36bc:	00000593          	li	a1,0
    36c0:	09810513          	add	a0,sp,152
    36c4:	03c12023          	sw	t3,32(sp)
    36c8:	01d12823          	sw	t4,16(sp)
    36cc:	951fd0ef          	jal	101c <memset>
    36d0:	01412783          	lw	a5,20(sp)
    36d4:	0ec10c13          	add	s8,sp,236
    36d8:	09810693          	add	a3,sp,152
    36dc:	0007a603          	lw	a2,0(a5)
    36e0:	000c0593          	mv	a1,s8
    36e4:	00098513          	mv	a0,s3
    36e8:	530070ef          	jal	ac18 <_wcrtomb_r>
    36ec:	fff00793          	li	a5,-1
    36f0:	01012e83          	lw	t4,16(sp)
    36f4:	02012e03          	lw	t3,32(sp)
    36f8:	00050d13          	mv	s10,a0
    36fc:	00f51463          	bne	a0,a5,3704 <_vfprintf_r+0x1794>
    3700:	4980106f          	j	4b98 <_vfprintf_r+0x2c28>
    3704:	fff54813          	not	a6,a0
    3708:	41f85813          	sra	a6,a6,0x1f
    370c:	01057cb3          	and	s9,a0,a6
    3710:	97cff06f          	j	288c <_vfprintf_r+0x91c>
    3714:	03412703          	lw	a4,52(sp)
    3718:	03012783          	lw	a5,48(sp)
    371c:	00700693          	li	a3,7
    3720:	00e42023          	sw	a4,0(s0)
    3724:	0a412703          	lw	a4,164(sp)
    3728:	00f484b3          	add	s1,s1,a5
    372c:	00f42223          	sw	a5,4(s0)
    3730:	00170713          	add	a4,a4,1
    3734:	0a912423          	sw	s1,168(sp)
    3738:	0ae12223          	sw	a4,164(sp)
    373c:	00840413          	add	s0,s0,8
    3740:	a4e6d0e3          	bge	a3,a4,3180 <_vfprintf_r+0x1210>
    3744:	00812583          	lw	a1,8(sp)
    3748:	0a010613          	add	a2,sp,160
    374c:	00098513          	mv	a0,s3
    3750:	02612223          	sw	t1,36(sp)
    3754:	03d12023          	sw	t4,32(sp)
    3758:	6d4010ef          	jal	4e2c <__sprint_r>
    375c:	00050463          	beqz	a0,3764 <_vfprintf_r+0x17f4>
    3760:	ce1fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3764:	07c12d03          	lw	s10,124(sp)
    3768:	0a812483          	lw	s1,168(sp)
    376c:	02412303          	lw	t1,36(sp)
    3770:	02012e83          	lw	t4,32(sp)
    3774:	0ac10413          	add	s0,sp,172
    3778:	a09ff06f          	j	3180 <_vfprintf_r+0x1210>
    377c:	01412703          	lw	a4,20(sp)
    3780:	010ef793          	and	a5,t4,16
    3784:	00072d03          	lw	s10,0(a4)
    3788:	00470713          	add	a4,a4,4
    378c:	00e12a23          	sw	a4,20(sp)
    3790:	08079863          	bnez	a5,3820 <_vfprintf_r+0x18b0>
    3794:	040ef793          	and	a5,t4,64
    3798:	08078063          	beqz	a5,3818 <_vfprintf_r+0x18a8>
    379c:	010d1d13          	sll	s10,s10,0x10
    37a0:	010d5d13          	srl	s10,s10,0x10
    37a4:	00000c93          	li	s9,0
    37a8:	e31ff06f          	j	35d8 <_vfprintf_r+0x1668>
    37ac:	00000d13          	li	s10,0
    37b0:	15010c13          	add	s8,sp,336
    37b4:	a2cff06f          	j	29e0 <_vfprintf_r+0xa70>
    37b8:	00812583          	lw	a1,8(sp)
    37bc:	0a010613          	add	a2,sp,160
    37c0:	00098513          	mv	a0,s3
    37c4:	03d12023          	sw	t4,32(sp)
    37c8:	664010ef          	jal	4e2c <__sprint_r>
    37cc:	00050463          	beqz	a0,37d4 <_vfprintf_r+0x1864>
    37d0:	c71fe06f          	j	2440 <_vfprintf_r+0x4d0>
    37d4:	0a812483          	lw	s1,168(sp)
    37d8:	0a412d03          	lw	s10,164(sp)
    37dc:	02012e83          	lw	t4,32(sp)
    37e0:	0ac10b13          	add	s6,sp,172
    37e4:	f71fe06f          	j	2754 <_vfprintf_r+0x7e4>
    37e8:	00812583          	lw	a1,8(sp)
    37ec:	0a010613          	add	a2,sp,160
    37f0:	00098513          	mv	a0,s3
    37f4:	03d12023          	sw	t4,32(sp)
    37f8:	634010ef          	jal	4e2c <__sprint_r>
    37fc:	00050463          	beqz	a0,3804 <_vfprintf_r+0x1894>
    3800:	c41fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3804:	0a812483          	lw	s1,168(sp)
    3808:	0a412d03          	lw	s10,164(sp)
    380c:	02012e83          	lw	t4,32(sp)
    3810:	0ac10b13          	add	s6,sp,172
    3814:	f71fe06f          	j	2784 <_vfprintf_r+0x814>
    3818:	200ef793          	and	a5,t4,512
    381c:	76079663          	bnez	a5,3f88 <_vfprintf_r+0x2018>
    3820:	00000c93          	li	s9,0
    3824:	db5ff06f          	j	35d8 <_vfprintf_r+0x1668>
    3828:	00000793          	li	a5,0
    382c:	15010b13          	add	s6,sp,336
    3830:	01212823          	sw	s2,16(sp)
    3834:	00078913          	mv	s2,a5
    3838:	00098793          	mv	a5,s3
    383c:	04812823          	sw	s0,80(sp)
    3840:	000b0993          	mv	s3,s6
    3844:	03c12403          	lw	s0,60(sp)
    3848:	40067493          	and	s1,a2,1024
    384c:	0ff00a13          	li	s4,255
    3850:	03c12023          	sw	t3,32(sp)
    3854:	02c12223          	sw	a2,36(sp)
    3858:	04612223          	sw	t1,68(sp)
    385c:	00078b13          	mv	s6,a5
    3860:	0280006f          	j	3888 <_vfprintf_r+0x1918>
    3864:	00a00613          	li	a2,10
    3868:	00000693          	li	a3,0
    386c:	000d0513          	mv	a0,s10
    3870:	000c8593          	mv	a1,s9
    3874:	581070ef          	jal	b5f4 <__udivdi3>
    3878:	6a0c8ee3          	beqz	s9,4734 <_vfprintf_r+0x27c4>
    387c:	00050d13          	mv	s10,a0
    3880:	00058c93          	mv	s9,a1
    3884:	000c0993          	mv	s3,s8
    3888:	00a00613          	li	a2,10
    388c:	00000693          	li	a3,0
    3890:	000d0513          	mv	a0,s10
    3894:	000c8593          	mv	a1,s9
    3898:	408080ef          	jal	bca0 <__umoddi3>
    389c:	03050513          	add	a0,a0,48
    38a0:	fea98fa3          	sb	a0,-1(s3)
    38a4:	fff98c13          	add	s8,s3,-1
    38a8:	00190913          	add	s2,s2,1
    38ac:	fa048ce3          	beqz	s1,3864 <_vfprintf_r+0x18f4>
    38b0:	00044783          	lbu	a5,0(s0)
    38b4:	faf918e3          	bne	s2,a5,3864 <_vfprintf_r+0x18f4>
    38b8:	fb4906e3          	beq	s2,s4,3864 <_vfprintf_r+0x18f4>
    38bc:	560c9ae3          	bnez	s9,4630 <_vfprintf_r+0x26c0>
    38c0:	00900793          	li	a5,9
    38c4:	57a7e6e3          	bltu	a5,s10,4630 <_vfprintf_r+0x26c0>
    38c8:	02412603          	lw	a2,36(sp)
    38cc:	15010793          	add	a5,sp,336
    38d0:	02812e23          	sw	s0,60(sp)
    38d4:	01212c23          	sw	s2,24(sp)
    38d8:	02012e03          	lw	t3,32(sp)
    38dc:	01012903          	lw	s2,16(sp)
    38e0:	04412303          	lw	t1,68(sp)
    38e4:	05012403          	lw	s0,80(sp)
    38e8:	000b0993          	mv	s3,s6
    38ec:	41878d33          	sub	s10,a5,s8
    38f0:	00060e93          	mv	t4,a2
    38f4:	8ecff06f          	j	29e0 <_vfprintf_r+0xa70>
    38f8:	00812583          	lw	a1,8(sp)
    38fc:	0a010613          	add	a2,sp,160
    3900:	00098513          	mv	a0,s3
    3904:	04612e23          	sw	t1,92(sp)
    3908:	05c12c23          	sw	t3,88(sp)
    390c:	05d12a23          	sw	t4,84(sp)
    3910:	05f12823          	sw	t6,80(sp)
    3914:	04512223          	sw	t0,68(sp)
    3918:	514010ef          	jal	4e2c <__sprint_r>
    391c:	00050463          	beqz	a0,3924 <_vfprintf_r+0x19b4>
    3920:	b21fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3924:	07714603          	lbu	a2,119(sp)
    3928:	0a812483          	lw	s1,168(sp)
    392c:	05c12303          	lw	t1,92(sp)
    3930:	05812e03          	lw	t3,88(sp)
    3934:	05412e83          	lw	t4,84(sp)
    3938:	05012f83          	lw	t6,80(sp)
    393c:	04412283          	lw	t0,68(sp)
    3940:	0ac10413          	add	s0,sp,172
    3944:	88dfe06f          	j	21d0 <_vfprintf_r+0x260>
    3948:	02812883          	lw	a7,40(sp)
    394c:	02c12703          	lw	a4,44(sp)
    3950:	02612223          	sw	t1,36(sp)
    3954:	00088613          	mv	a2,a7
    3958:	00088513          	mv	a0,a7
    395c:	00070693          	mv	a3,a4
    3960:	00070593          	mv	a1,a4
    3964:	03c12023          	sw	t3,32(sp)
    3968:	01d12823          	sw	t4,16(sp)
    396c:	62d0a0ef          	jal	e798 <__unorddf2>
    3970:	01012e83          	lw	t4,16(sp)
    3974:	02012e03          	lw	t3,32(sp)
    3978:	02412303          	lw	t1,36(sp)
    397c:	00050463          	beqz	a0,3984 <_vfprintf_r+0x1a14>
    3980:	0e00106f          	j	4a60 <_vfprintf_r+0x2af0>
    3984:	06100713          	li	a4,97
    3988:	08ee0263          	beq	t3,a4,3a0c <_vfprintf_r+0x1a9c>
    398c:	04100713          	li	a4,65
    3990:	05800793          	li	a5,88
    3994:	06ee0e63          	beq	t3,a4,3a10 <_vfprintf_r+0x1aa0>
    3998:	fff00713          	li	a4,-1
    399c:	00e31463          	bne	t1,a4,39a4 <_vfprintf_r+0x1a34>
    39a0:	01c0106f          	j	49bc <_vfprintf_r+0x2a4c>
    39a4:	fdfe7713          	and	a4,t3,-33
    39a8:	04700693          	li	a3,71
    39ac:	00012823          	sw	zero,16(sp)
    39b0:	00d71663          	bne	a4,a3,39bc <_vfprintf_r+0x1a4c>
    39b4:	00031463          	bnez	t1,39bc <_vfprintf_r+0x1a4c>
    39b8:	00100313          	li	t1,1
    39bc:	100ee793          	or	a5,t4,256
    39c0:	00078b13          	mv	s6,a5
    39c4:	02c12783          	lw	a5,44(sp)
    39c8:	04012223          	sw	zero,68(sp)
    39cc:	00078493          	mv	s1,a5
    39d0:	0007da63          	bgez	a5,39e4 <_vfprintf_r+0x1a74>
    39d4:	800004b7          	lui	s1,0x80000
    39d8:	00f4c4b3          	xor	s1,s1,a5
    39dc:	02d00793          	li	a5,45
    39e0:	04f12223          	sw	a5,68(sp)
    39e4:	fbfe0713          	add	a4,t3,-65
    39e8:	02500693          	li	a3,37
    39ec:	3ae6e463          	bltu	a3,a4,3d94 <_vfprintf_r+0x1e24>
    39f0:	0000c697          	auipc	a3,0xc
    39f4:	bec68693          	add	a3,a3,-1044 # f5dc <_ctype_+0x270>
    39f8:	00271713          	sll	a4,a4,0x2
    39fc:	00d70733          	add	a4,a4,a3
    3a00:	00072703          	lw	a4,0(a4)
    3a04:	00d70733          	add	a4,a4,a3
    3a08:	00070067          	jr	a4
    3a0c:	07800793          	li	a5,120
    3a10:	03000713          	li	a4,48
    3a14:	06e10c23          	sb	a4,120(sp)
    3a18:	06f10ca3          	sb	a5,121(sp)
    3a1c:	06300713          	li	a4,99
    3a20:	00012823          	sw	zero,16(sp)
    3a24:	002eee93          	or	t4,t4,2
    3a28:	0ec10c13          	add	s8,sp,236
    3a2c:	f86758e3          	bge	a4,t1,39bc <_vfprintf_r+0x1a4c>
    3a30:	00130593          	add	a1,t1,1
    3a34:	00098513          	mv	a0,s3
    3a38:	03c12023          	sw	t3,32(sp)
    3a3c:	01d12c23          	sw	t4,24(sp)
    3a40:	00612823          	sw	t1,16(sp)
    3a44:	d35fd0ef          	jal	1778 <_malloc_r>
    3a48:	01012303          	lw	t1,16(sp)
    3a4c:	01812e83          	lw	t4,24(sp)
    3a50:	02012e03          	lw	t3,32(sp)
    3a54:	00050c13          	mv	s8,a0
    3a58:	00051463          	bnez	a0,3a60 <_vfprintf_r+0x1af0>
    3a5c:	13c0106f          	j	4b98 <_vfprintf_r+0x2c28>
    3a60:	00a12823          	sw	a0,16(sp)
    3a64:	f59ff06f          	j	39bc <_vfprintf_r+0x1a4c>
    3a68:	00098513          	mv	a0,s3
    3a6c:	1d0030ef          	jal	6c3c <__sinit>
    3a70:	00c12783          	lw	a5,12(sp)
    3a74:	d5cfe06f          	j	1fd0 <_vfprintf_r+0x60>
    3a78:	00812583          	lw	a1,8(sp)
    3a7c:	0a010613          	add	a2,sp,160
    3a80:	00098513          	mv	a0,s3
    3a84:	03d12023          	sw	t4,32(sp)
    3a88:	3a4010ef          	jal	4e2c <__sprint_r>
    3a8c:	00050463          	beqz	a0,3a94 <_vfprintf_r+0x1b24>
    3a90:	9b1fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3a94:	0a812483          	lw	s1,168(sp)
    3a98:	02012e83          	lw	t4,32(sp)
    3a9c:	0ac10413          	add	s0,sp,172
    3aa0:	9b0ff06f          	j	2c50 <_vfprintf_r+0xce0>
    3aa4:	00800613          	li	a2,8
    3aa8:	00000593          	li	a1,0
    3aac:	09810513          	add	a0,sp,152
    3ab0:	02612023          	sw	t1,32(sp)
    3ab4:	01c12a23          	sw	t3,20(sp)
    3ab8:	01d12823          	sw	t4,16(sp)
    3abc:	09812223          	sw	s8,132(sp)
    3ac0:	d5cfd0ef          	jal	101c <memset>
    3ac4:	02012303          	lw	t1,32(sp)
    3ac8:	01012e83          	lw	t4,16(sp)
    3acc:	01412e03          	lw	t3,20(sp)
    3ad0:	3a0340e3          	bltz	t1,4670 <_vfprintf_r+0x2700>
    3ad4:	00000d13          	li	s10,0
    3ad8:	01212823          	sw	s2,16(sp)
    3adc:	000c0c93          	mv	s9,s8
    3ae0:	fff00493          	li	s1,-1
    3ae4:	000b0c13          	mv	s8,s6
    3ae8:	000e8a13          	mv	s4,t4
    3aec:	00040b13          	mv	s6,s0
    3af0:	000d0913          	mv	s2,s10
    3af4:	00030413          	mv	s0,t1
    3af8:	0300006f          	j	3b28 <_vfprintf_r+0x1bb8>
    3afc:	09810693          	add	a3,sp,152
    3b00:	0ec10593          	add	a1,sp,236
    3b04:	00098513          	mv	a0,s3
    3b08:	110070ef          	jal	ac18 <_wcrtomb_r>
    3b0c:	68950ae3          	beq	a0,s1,49a0 <_vfprintf_r+0x2a30>
    3b10:	00a907b3          	add	a5,s2,a0
    3b14:	02f44263          	blt	s0,a5,3b38 <_vfprintf_r+0x1bc8>
    3b18:	004d0d13          	add	s10,s10,4
    3b1c:	00879463          	bne	a5,s0,3b24 <_vfprintf_r+0x1bb4>
    3b20:	7990006f          	j	4ab8 <_vfprintf_r+0x2b48>
    3b24:	00078913          	mv	s2,a5
    3b28:	08412783          	lw	a5,132(sp)
    3b2c:	01a787b3          	add	a5,a5,s10
    3b30:	0007a603          	lw	a2,0(a5)
    3b34:	fc0614e3          	bnez	a2,3afc <_vfprintf_r+0x1b8c>
    3b38:	00090d13          	mv	s10,s2
    3b3c:	01412e03          	lw	t3,20(sp)
    3b40:	01012903          	lw	s2,16(sp)
    3b44:	000b0413          	mv	s0,s6
    3b48:	000a0e93          	mv	t4,s4
    3b4c:	000c0b13          	mv	s6,s8
    3b50:	000c8c13          	mv	s8,s9
    3b54:	340d0ce3          	beqz	s10,46ac <_vfprintf_r+0x273c>
    3b58:	06300793          	li	a5,99
    3b5c:	59a7dee3          	bge	a5,s10,48f8 <_vfprintf_r+0x2988>
    3b60:	001d0593          	add	a1,s10,1
    3b64:	00098513          	mv	a0,s3
    3b68:	01c12a23          	sw	t3,20(sp)
    3b6c:	01d12823          	sw	t4,16(sp)
    3b70:	c09fd0ef          	jal	1778 <_malloc_r>
    3b74:	01012e83          	lw	t4,16(sp)
    3b78:	01412e03          	lw	t3,20(sp)
    3b7c:	00050c13          	mv	s8,a0
    3b80:	620500e3          	beqz	a0,49a0 <_vfprintf_r+0x2a30>
    3b84:	00a12823          	sw	a0,16(sp)
    3b88:	00800613          	li	a2,8
    3b8c:	00000593          	li	a1,0
    3b90:	09810513          	add	a0,sp,152
    3b94:	03c12023          	sw	t3,32(sp)
    3b98:	01d12a23          	sw	t4,20(sp)
    3b9c:	c80fd0ef          	jal	101c <memset>
    3ba0:	09810713          	add	a4,sp,152
    3ba4:	000d0693          	mv	a3,s10
    3ba8:	08410613          	add	a2,sp,132
    3bac:	000c0593          	mv	a1,s8
    3bb0:	00098513          	mv	a0,s3
    3bb4:	0f0070ef          	jal	aca4 <_wcsrtombs_r>
    3bb8:	01412e83          	lw	t4,20(sp)
    3bbc:	02012e03          	lw	t3,32(sp)
    3bc0:	00ad0463          	beq	s10,a0,3bc8 <_vfprintf_r+0x1c58>
    3bc4:	0240106f          	j	4be8 <_vfprintf_r+0x2c78>
    3bc8:	01ac0733          	add	a4,s8,s10
    3bcc:	00070023          	sb	zero,0(a4)
    3bd0:	07714603          	lbu	a2,119(sp)
    3bd4:	fffd4813          	not	a6,s10
    3bd8:	41f85813          	sra	a6,a6,0x1f
    3bdc:	01612a23          	sw	s6,20(sp)
    3be0:	02012223          	sw	zero,36(sp)
    3be4:	02012023          	sw	zero,32(sp)
    3be8:	010d7cb3          	and	s9,s10,a6
    3bec:	00000313          	li	t1,0
    3bf0:	00000a13          	li	s4,0
    3bf4:	00061463          	bnez	a2,3bfc <_vfprintf_r+0x1c8c>
    3bf8:	db8fe06f          	j	21b0 <_vfprintf_r+0x240>
    3bfc:	9d5fe06f          	j	25d0 <_vfprintf_r+0x660>
    3c00:	00048e93          	mv	t4,s1
    3c04:	000a0293          	mv	t0,s4
    3c08:	00070493          	mv	s1,a4
    3c0c:	01a484b3          	add	s1,s1,s10
    3c10:	00178793          	add	a5,a5,1
    3c14:	00542023          	sw	t0,0(s0)
    3c18:	e48fe06f          	j	2260 <_vfprintf_r+0x2f0>
    3c1c:	01412783          	lw	a5,20(sp)
    3c20:	00c12703          	lw	a4,12(sp)
    3c24:	0007a783          	lw	a5,0(a5)
    3c28:	00e7a023          	sw	a4,0(a5)
    3c2c:	fadfe06f          	j	2bd8 <_vfprintf_r+0xc68>
    3c30:	02012e83          	lw	t4,32(sp)
    3c34:	00040293          	mv	t0,s0
    3c38:	000a0413          	mv	s0,s4
    3c3c:	008484b3          	add	s1,s1,s0
    3c40:	001d0d13          	add	s10,s10,1
    3c44:	005b2023          	sw	t0,0(s6)
    3c48:	b7dfe06f          	j	27c4 <_vfprintf_r+0x854>
    3c4c:	03412703          	lw	a4,52(sp)
    3c50:	03012783          	lw	a5,48(sp)
    3c54:	00700613          	li	a2,7
    3c58:	00e42023          	sw	a4,0(s0)
    3c5c:	0a412703          	lw	a4,164(sp)
    3c60:	009784b3          	add	s1,a5,s1
    3c64:	00f42223          	sw	a5,4(s0)
    3c68:	00170713          	add	a4,a4,1
    3c6c:	0a912423          	sw	s1,168(sp)
    3c70:	0ae12223          	sw	a4,164(sp)
    3c74:	00840413          	add	s0,s0,8
    3c78:	3ae64463          	blt	a2,a4,4020 <_vfprintf_r+0x20b0>
    3c7c:	3e06cee3          	bltz	a3,4878 <_vfprintf_r+0x2908>
    3c80:	01812783          	lw	a5,24(sp)
    3c84:	00170713          	add	a4,a4,1
    3c88:	01842023          	sw	s8,0(s0)
    3c8c:	009784b3          	add	s1,a5,s1
    3c90:	00f42223          	sw	a5,4(s0)
    3c94:	0a912423          	sw	s1,168(sp)
    3c98:	0ae12223          	sw	a4,164(sp)
    3c9c:	00700793          	li	a5,7
    3ca0:	00e7c463          	blt	a5,a4,3ca8 <_vfprintf_r+0x1d38>
    3ca4:	dd0fe06f          	j	2274 <_vfprintf_r+0x304>
    3ca8:	b61fe06f          	j	2808 <_vfprintf_r+0x898>
    3cac:	01000613          	li	a2,16
    3cb0:	0a412683          	lw	a3,164(sp)
    3cb4:	0000c297          	auipc	t0,0xc
    3cb8:	9c028293          	add	t0,t0,-1600 # f674 <zeroes.0>
    3cbc:	09665463          	bge	a2,s6,3d44 <_vfprintf_r+0x1dd4>
    3cc0:	00040793          	mv	a5,s0
    3cc4:	00048713          	mv	a4,s1
    3cc8:	00812403          	lw	s0,8(sp)
    3ccc:	01000893          	li	a7,16
    3cd0:	00700d13          	li	s10,7
    3cd4:	05d12223          	sw	t4,68(sp)
    3cd8:	00028493          	mv	s1,t0
    3cdc:	00c0006f          	j	3ce8 <_vfprintf_r+0x1d78>
    3ce0:	ff0b0b13          	add	s6,s6,-16
    3ce4:	0568d863          	bge	a7,s6,3d34 <_vfprintf_r+0x1dc4>
    3ce8:	01070713          	add	a4,a4,16
    3cec:	00168693          	add	a3,a3,1
    3cf0:	0097a023          	sw	s1,0(a5)
    3cf4:	0117a223          	sw	a7,4(a5)
    3cf8:	0ae12423          	sw	a4,168(sp)
    3cfc:	0ad12223          	sw	a3,164(sp)
    3d00:	00878793          	add	a5,a5,8
    3d04:	fcdd5ee3          	bge	s10,a3,3ce0 <_vfprintf_r+0x1d70>
    3d08:	0a010613          	add	a2,sp,160
    3d0c:	00040593          	mv	a1,s0
    3d10:	00098513          	mv	a0,s3
    3d14:	118010ef          	jal	4e2c <__sprint_r>
    3d18:	00050463          	beqz	a0,3d20 <_vfprintf_r+0x1db0>
    3d1c:	f24fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3d20:	0a812703          	lw	a4,168(sp)
    3d24:	0a412683          	lw	a3,164(sp)
    3d28:	0ac10793          	add	a5,sp,172
    3d2c:	01000893          	li	a7,16
    3d30:	fb1ff06f          	j	3ce0 <_vfprintf_r+0x1d70>
    3d34:	04412e83          	lw	t4,68(sp)
    3d38:	00048293          	mv	t0,s1
    3d3c:	00078413          	mv	s0,a5
    3d40:	00070493          	mv	s1,a4
    3d44:	016484b3          	add	s1,s1,s6
    3d48:	00168693          	add	a3,a3,1
    3d4c:	00542023          	sw	t0,0(s0)
    3d50:	01642223          	sw	s6,4(s0)
    3d54:	0a912423          	sw	s1,168(sp)
    3d58:	0ad12223          	sw	a3,164(sp)
    3d5c:	00700713          	li	a4,7
    3d60:	00840413          	add	s0,s0,8
    3d64:	bed75c63          	bge	a4,a3,315c <_vfprintf_r+0x11ec>
    3d68:	00812583          	lw	a1,8(sp)
    3d6c:	0a010613          	add	a2,sp,160
    3d70:	00098513          	mv	a0,s3
    3d74:	05d12223          	sw	t4,68(sp)
    3d78:	0b4010ef          	jal	4e2c <__sprint_r>
    3d7c:	00050463          	beqz	a0,3d84 <_vfprintf_r+0x1e14>
    3d80:	ec0fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3d84:	0a812483          	lw	s1,168(sp)
    3d88:	04412e83          	lw	t4,68(sp)
    3d8c:	0ac10413          	add	s0,sp,172
    3d90:	bccff06f          	j	315c <_vfprintf_r+0x11ec>
    3d94:	02812703          	lw	a4,40(sp)
    3d98:	09810893          	add	a7,sp,152
    3d9c:	08410813          	add	a6,sp,132
    3da0:	00070513          	mv	a0,a4
    3da4:	00050593          	mv	a1,a0
    3da8:	00030713          	mv	a4,t1
    3dac:	07c10793          	add	a5,sp,124
    3db0:	00200693          	li	a3,2
    3db4:	00048613          	mv	a2,s1
    3db8:	00098513          	mv	a0,s3
    3dbc:	03c12223          	sw	t3,36(sp)
    3dc0:	03d12023          	sw	t4,32(sp)
    3dc4:	00612c23          	sw	t1,24(sp)
    3dc8:	3a8040ef          	jal	8170 <_dtoa_r>
    3dcc:	02012e83          	lw	t4,32(sp)
    3dd0:	01812303          	lw	t1,24(sp)
    3dd4:	02412e03          	lw	t3,36(sp)
    3dd8:	001ef713          	and	a4,t4,1
    3ddc:	00050c13          	mv	s8,a0
    3de0:	1a0712e3          	bnez	a4,4784 <_vfprintf_r+0x2814>
    3de4:	09812783          	lw	a5,152(sp)
    3de8:	07c12a03          	lw	s4,124(sp)
    3dec:	40a787b3          	sub	a5,a5,a0
    3df0:	00f12c23          	sw	a5,24(sp)
    3df4:	ffd00713          	li	a4,-3
    3df8:	00ea4463          	blt	s4,a4,3e00 <_vfprintf_r+0x1e90>
    3dfc:	5b435663          	bge	t1,s4,43a8 <_vfprintf_r+0x2438>
    3e00:	ffee0e13          	add	t3,t3,-2
    3e04:	fffa0d13          	add	s10,s4,-1
    3e08:	07a12e23          	sw	s10,124(sp)
    3e0c:	0ffe7693          	zext.b	a3,t3
    3e10:	00000613          	li	a2,0
    3e14:	08d10423          	sb	a3,136(sp)
    3e18:	02b00693          	li	a3,43
    3e1c:	000d5863          	bgez	s10,3e2c <_vfprintf_r+0x1ebc>
    3e20:	00100713          	li	a4,1
    3e24:	41470d33          	sub	s10,a4,s4
    3e28:	02d00693          	li	a3,45
    3e2c:	08d104a3          	sb	a3,137(sp)
    3e30:	00900693          	li	a3,9
    3e34:	33a6d8e3          	bge	a3,s10,4964 <_vfprintf_r+0x29f4>
    3e38:	000c0793          	mv	a5,s8
    3e3c:	09f10493          	add	s1,sp,159
    3e40:	03212023          	sw	s2,32(sp)
    3e44:	00040c13          	mv	s8,s0
    3e48:	06300a13          	li	s4,99
    3e4c:	000d0413          	mv	s0,s10
    3e50:	03d12223          	sw	t4,36(sp)
    3e54:	05c12023          	sw	t3,64(sp)
    3e58:	00048913          	mv	s2,s1
    3e5c:	00098c93          	mv	s9,s3
    3e60:	00078d13          	mv	s10,a5
    3e64:	00a00593          	li	a1,10
    3e68:	00040513          	mv	a0,s0
    3e6c:	09c0b0ef          	jal	ef08 <__modsi3>
    3e70:	03050713          	add	a4,a0,48
    3e74:	00090b13          	mv	s6,s2
    3e78:	00040513          	mv	a0,s0
    3e7c:	feeb0fa3          	sb	a4,-1(s6)
    3e80:	00a00593          	li	a1,10
    3e84:	00040993          	mv	s3,s0
    3e88:	7fd0a0ef          	jal	ee84 <__divsi3>
    3e8c:	fff90913          	add	s2,s2,-1
    3e90:	00050413          	mv	s0,a0
    3e94:	fd3a48e3          	blt	s4,s3,3e64 <_vfprintf_r+0x1ef4>
    3e98:	000c8993          	mv	s3,s9
    3e9c:	03050713          	add	a4,a0,48
    3ea0:	00090c93          	mv	s9,s2
    3ea4:	ffeb0693          	add	a3,s6,-2
    3ea8:	feec8fa3          	sb	a4,-1(s9)
    3eac:	000c0413          	mv	s0,s8
    3eb0:	02412e83          	lw	t4,36(sp)
    3eb4:	04012e03          	lw	t3,64(sp)
    3eb8:	02012903          	lw	s2,32(sp)
    3ebc:	000d0c13          	mv	s8,s10
    3ec0:	4c96f6e3          	bgeu	a3,s1,4b8c <_vfprintf_r+0x2c1c>
    3ec4:	08a10713          	add	a4,sp,138
    3ec8:	0006c783          	lbu	a5,0(a3)
    3ecc:	00168693          	add	a3,a3,1
    3ed0:	00170713          	add	a4,a4,1
    3ed4:	fef70fa3          	sb	a5,-1(a4)
    3ed8:	fe9698e3          	bne	a3,s1,3ec8 <_vfprintf_r+0x1f58>
    3edc:	15010793          	add	a5,sp,336
    3ee0:	41678633          	sub	a2,a5,s6
    3ee4:	f5360793          	add	a5,a2,-173
    3ee8:	04f12023          	sw	a5,64(sp)
    3eec:	01812783          	lw	a5,24(sp)
    3ef0:	04012683          	lw	a3,64(sp)
    3ef4:	00100713          	li	a4,1
    3ef8:	00d78d33          	add	s10,a5,a3
    3efc:	28f75ce3          	bge	a4,a5,4994 <_vfprintf_r+0x2a24>
    3f00:	03012783          	lw	a5,48(sp)
    3f04:	00fd0d33          	add	s10,s10,a5
    3f08:	fffd4813          	not	a6,s10
    3f0c:	bffeff13          	and	t5,t4,-1025
    3f10:	41f85813          	sra	a6,a6,0x1f
    3f14:	100f6e93          	or	t4,t5,256
    3f18:	010d7cb3          	and	s9,s10,a6
    3f1c:	02012223          	sw	zero,36(sp)
    3f20:	02012023          	sw	zero,32(sp)
    3f24:	00000a13          	li	s4,0
    3f28:	04412783          	lw	a5,68(sp)
    3f2c:	46079263          	bnez	a5,4390 <_vfprintf_r+0x2420>
    3f30:	07714603          	lbu	a2,119(sp)
    3f34:	00000313          	li	t1,0
    3f38:	00061463          	bnez	a2,3f40 <_vfprintf_r+0x1fd0>
    3f3c:	a74fe06f          	j	21b0 <_vfprintf_r+0x240>
    3f40:	e90fe06f          	j	25d0 <_vfprintf_r+0x660>
    3f44:	00812583          	lw	a1,8(sp)
    3f48:	0a010613          	add	a2,sp,160
    3f4c:	00098513          	mv	a0,s3
    3f50:	03d12023          	sw	t4,32(sp)
    3f54:	6d9000ef          	jal	4e2c <__sprint_r>
    3f58:	00050463          	beqz	a0,3f60 <_vfprintf_r+0x1ff0>
    3f5c:	ce4fe06f          	j	2440 <_vfprintf_r+0x4d0>
    3f60:	07c12683          	lw	a3,124(sp)
    3f64:	0a812483          	lw	s1,168(sp)
    3f68:	02012e83          	lw	t4,32(sp)
    3f6c:	0ac10413          	add	s0,sp,172
    3f70:	ce0ff06f          	j	3450 <_vfprintf_r+0x14e0>
    3f74:	00600c93          	li	s9,6
    3f78:	f14ff06f          	j	368c <_vfprintf_r+0x171c>
    3f7c:	0ffd7d13          	zext.b	s10,s10
    3f80:	00000c93          	li	s9,0
    3f84:	bd5fe06f          	j	2b58 <_vfprintf_r+0xbe8>
    3f88:	0ffd7d13          	zext.b	s10,s10
    3f8c:	00000c93          	li	s9,0
    3f90:	e48ff06f          	j	35d8 <_vfprintf_r+0x1668>
    3f94:	018d1d13          	sll	s10,s10,0x18
    3f98:	418d5d13          	sra	s10,s10,0x18
    3f9c:	41fd5c93          	sra	s9,s10,0x1f
    3fa0:	000c8793          	mv	a5,s9
    3fa4:	b39fe06f          	j	2adc <_vfprintf_r+0xb6c>
    3fa8:	01412783          	lw	a5,20(sp)
    3fac:	00c12703          	lw	a4,12(sp)
    3fb0:	0007a783          	lw	a5,0(a5)
    3fb4:	00e79023          	sh	a4,0(a5)
    3fb8:	c21fe06f          	j	2bd8 <_vfprintf_r+0xc68>
    3fbc:	000c0513          	mv	a0,s8
    3fc0:	05d12223          	sw	t4,68(sp)
    3fc4:	ad8fd0ef          	jal	129c <strlen>
    3fc8:	07714603          	lbu	a2,119(sp)
    3fcc:	fff54813          	not	a6,a0
    3fd0:	41f85813          	sra	a6,a6,0x1f
    3fd4:	01612a23          	sw	s6,20(sp)
    3fd8:	02012223          	sw	zero,36(sp)
    3fdc:	02012023          	sw	zero,32(sp)
    3fe0:	00012823          	sw	zero,16(sp)
    3fe4:	04412e83          	lw	t4,68(sp)
    3fe8:	00050d13          	mv	s10,a0
    3fec:	01057cb3          	and	s9,a0,a6
    3ff0:	00000313          	li	t1,0
    3ff4:	07300e13          	li	t3,115
    3ff8:	00061463          	bnez	a2,4000 <_vfprintf_r+0x2090>
    3ffc:	9b4fe06f          	j	21b0 <_vfprintf_r+0x240>
    4000:	dd0fe06f          	j	25d0 <_vfprintf_r+0x660>
    4004:	00812583          	lw	a1,8(sp)
    4008:	0a010613          	add	a2,sp,160
    400c:	00098513          	mv	a0,s3
    4010:	61d000ef          	jal	4e2c <__sprint_r>
    4014:	00051463          	bnez	a0,401c <_vfprintf_r+0x20ac>
    4018:	be8fe06f          	j	2400 <_vfprintf_r+0x490>
    401c:	c38fe06f          	j	2454 <_vfprintf_r+0x4e4>
    4020:	00812583          	lw	a1,8(sp)
    4024:	0a010613          	add	a2,sp,160
    4028:	00098513          	mv	a0,s3
    402c:	03d12023          	sw	t4,32(sp)
    4030:	5fd000ef          	jal	4e2c <__sprint_r>
    4034:	00050463          	beqz	a0,403c <_vfprintf_r+0x20cc>
    4038:	c08fe06f          	j	2440 <_vfprintf_r+0x4d0>
    403c:	07c12683          	lw	a3,124(sp)
    4040:	0a812483          	lw	s1,168(sp)
    4044:	0a412703          	lw	a4,164(sp)
    4048:	02012e83          	lw	t4,32(sp)
    404c:	0ac10413          	add	s0,sp,172
    4050:	c2dff06f          	j	3c7c <_vfprintf_r+0x1d0c>
    4054:	05862503          	lw	a0,88(a2)
    4058:	00f12623          	sw	a5,12(sp)
    405c:	fbdfc0ef          	jal	1018 <__retarget_lock_release_recursive>
    4060:	00c12783          	lw	a5,12(sp)
    4064:	ab8fe06f          	j	231c <_vfprintf_r+0x3ac>
    4068:	00130a13          	add	s4,t1,1
    406c:	00200693          	li	a3,2
    4070:	02812703          	lw	a4,40(sp)
    4074:	09810893          	add	a7,sp,152
    4078:	08410813          	add	a6,sp,132
    407c:	00070513          	mv	a0,a4
    4080:	00050593          	mv	a1,a0
    4084:	000a0713          	mv	a4,s4
    4088:	07c10793          	add	a5,sp,124
    408c:	00048613          	mv	a2,s1
    4090:	00098513          	mv	a0,s3
    4094:	02612223          	sw	t1,36(sp)
    4098:	03c12023          	sw	t3,32(sp)
    409c:	01d12c23          	sw	t4,24(sp)
    40a0:	0d0040ef          	jal	8170 <_dtoa_r>
    40a4:	02012e03          	lw	t3,32(sp)
    40a8:	04600693          	li	a3,70
    40ac:	01812e83          	lw	t4,24(sp)
    40b0:	fdfe7d13          	and	s10,t3,-33
    40b4:	02412303          	lw	t1,36(sp)
    40b8:	00050c13          	mv	s8,a0
    40bc:	01450733          	add	a4,a0,s4
    40c0:	34dd14e3          	bne	s10,a3,4c08 <_vfprintf_r+0x2c98>
    40c4:	000c4603          	lbu	a2,0(s8)
    40c8:	03000693          	li	a3,48
    40cc:	6cd60263          	beq	a2,a3,4790 <_vfprintf_r+0x2820>
    40d0:	07c12683          	lw	a3,124(sp)
    40d4:	00d70733          	add	a4,a4,a3
    40d8:	02812683          	lw	a3,40(sp)
    40dc:	00048593          	mv	a1,s1
    40e0:	00000613          	li	a2,0
    40e4:	00068513          	mv	a0,a3
    40e8:	00000693          	li	a3,0
    40ec:	04e12823          	sw	a4,80(sp)
    40f0:	02612223          	sw	t1,36(sp)
    40f4:	03c12023          	sw	t3,32(sp)
    40f8:	01d12c23          	sw	t4,24(sp)
    40fc:	370090ef          	jal	d46c <__eqdf2>
    4100:	01812e83          	lw	t4,24(sp)
    4104:	02012e03          	lw	t3,32(sp)
    4108:	02412303          	lw	t1,36(sp)
    410c:	05012703          	lw	a4,80(sp)
    4110:	62050863          	beqz	a0,4740 <_vfprintf_r+0x27d0>
    4114:	09812783          	lw	a5,152(sp)
    4118:	00e7fe63          	bgeu	a5,a4,4134 <_vfprintf_r+0x21c4>
    411c:	03000613          	li	a2,48
    4120:	00178693          	add	a3,a5,1
    4124:	08d12c23          	sw	a3,152(sp)
    4128:	00c78023          	sb	a2,0(a5)
    412c:	09812783          	lw	a5,152(sp)
    4130:	fee7e8e3          	bltu	a5,a4,4120 <_vfprintf_r+0x21b0>
    4134:	07c12a03          	lw	s4,124(sp)
    4138:	418787b3          	sub	a5,a5,s8
    413c:	04700713          	li	a4,71
    4140:	00f12c23          	sw	a5,24(sp)
    4144:	caed08e3          	beq	s10,a4,3df4 <_vfprintf_r+0x1e84>
    4148:	04600713          	li	a4,70
    414c:	68ed0863          	beq	s10,a4,47dc <_vfprintf_r+0x286c>
    4150:	fffa0d13          	add	s10,s4,-1
    4154:	cb5ff06f          	j	3e08 <_vfprintf_r+0x1e98>
    4158:	02812703          	lw	a4,40(sp)
    415c:	07c10613          	add	a2,sp,124
    4160:	00048593          	mv	a1,s1
    4164:	00070513          	mv	a0,a4
    4168:	02612223          	sw	t1,36(sp)
    416c:	03c12023          	sw	t3,32(sp)
    4170:	01d12c23          	sw	t4,24(sp)
    4174:	4e9030ef          	jal	7e5c <frexp>
    4178:	7fffc717          	auipc	a4,0x7fffc
    417c:	53070713          	add	a4,a4,1328 # 800006a8 <__global_locale+0x174>
    4180:	00072603          	lw	a2,0(a4)
    4184:	00472683          	lw	a3,4(a4)
    4188:	578090ef          	jal	d700 <__muldf3>
    418c:	00000613          	li	a2,0
    4190:	00000693          	li	a3,0
    4194:	00050a13          	mv	s4,a0
    4198:	00058d13          	mv	s10,a1
    419c:	2d0090ef          	jal	d46c <__eqdf2>
    41a0:	01812e83          	lw	t4,24(sp)
    41a4:	02012e03          	lw	t3,32(sp)
    41a8:	02412303          	lw	t1,36(sp)
    41ac:	00051663          	bnez	a0,41b8 <_vfprintf_r+0x2248>
    41b0:	00100713          	li	a4,1
    41b4:	06e12e23          	sw	a4,124(sp)
    41b8:	0000b797          	auipc	a5,0xb
    41bc:	fe878793          	add	a5,a5,-24 # f1a0 <__fini_array_end+0x1e0>
    41c0:	06100713          	li	a4,97
    41c4:	02f12023          	sw	a5,32(sp)
    41c8:	00ee1863          	bne	t3,a4,41d8 <_vfprintf_r+0x2268>
    41cc:	0000b797          	auipc	a5,0xb
    41d0:	fc078793          	add	a5,a5,-64 # f18c <__fini_array_end+0x1cc>
    41d4:	02f12023          	sw	a5,32(sp)
    41d8:	7fffc717          	auipc	a4,0x7fffc
    41dc:	4d870713          	add	a4,a4,1240 # 800006b0 <__global_locale+0x17c>
    41e0:	00072783          	lw	a5,0(a4)
    41e4:	00472803          	lw	a6,4(a4)
    41e8:	000c0493          	mv	s1,s8
    41ec:	00f12c23          	sw	a5,24(sp)
    41f0:	000d0793          	mv	a5,s10
    41f4:	03212223          	sw	s2,36(sp)
    41f8:	000c0d13          	mv	s10,s8
    41fc:	02012903          	lw	s2,32(sp)
    4200:	00098c13          	mv	s8,s3
    4204:	01012e23          	sw	a6,28(sp)
    4208:	fff30b13          	add	s6,t1,-1
    420c:	fff00c93          	li	s9,-1
    4210:	05d12023          	sw	t4,64(sp)
    4214:	05c12823          	sw	t3,80(sp)
    4218:	04812a23          	sw	s0,84(sp)
    421c:	00078993          	mv	s3,a5
    4220:	01c0006f          	j	423c <_vfprintf_r+0x22cc>
    4224:	00000613          	li	a2,0
    4228:	00000693          	li	a3,0
    422c:	fffb0413          	add	s0,s6,-1
    4230:	23c090ef          	jal	d46c <__eqdf2>
    4234:	0a0504e3          	beqz	a0,4adc <_vfprintf_r+0x2b6c>
    4238:	00040b13          	mv	s6,s0
    423c:	01812603          	lw	a2,24(sp)
    4240:	01c12683          	lw	a3,28(sp)
    4244:	000a0513          	mv	a0,s4
    4248:	00098593          	mv	a1,s3
    424c:	4b4090ef          	jal	d700 <__muldf3>
    4250:	00058a13          	mv	s4,a1
    4254:	00050993          	mv	s3,a0
    4258:	5940a0ef          	jal	e7ec <__fixdfsi>
    425c:	00050413          	mv	s0,a0
    4260:	6100a0ef          	jal	e870 <__floatsidf>
    4264:	00050613          	mv	a2,a0
    4268:	00058693          	mv	a3,a1
    426c:	00098513          	mv	a0,s3
    4270:	000a0593          	mv	a1,s4
    4274:	41d090ef          	jal	de90 <__subdf3>
    4278:	00890733          	add	a4,s2,s0
    427c:	00074703          	lbu	a4,0(a4)
    4280:	00048813          	mv	a6,s1
    4284:	00050a13          	mv	s4,a0
    4288:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    428c:	00058993          	mv	s3,a1
    4290:	00148493          	add	s1,s1,1
    4294:	f99b18e3          	bne	s6,s9,4224 <_vfprintf_r+0x22b4>
    4298:	7fffc697          	auipc	a3,0x7fffc
    429c:	42068693          	add	a3,a3,1056 # 800006b8 <__global_locale+0x184>
    42a0:	0006a303          	lw	t1,0(a3)
    42a4:	0046a383          	lw	t2,4(a3)
    42a8:	05012e03          	lw	t3,80(sp)
    42ac:	00030613          	mv	a2,t1
    42b0:	00038693          	mv	a3,t2
    42b4:	01012c23          	sw	a6,24(sp)
    42b8:	02412903          	lw	s2,36(sp)
    42bc:	000c0993          	mv	s3,s8
    42c0:	03c12223          	sw	t3,36(sp)
    42c4:	000d0c13          	mv	s8,s10
    42c8:	00058d13          	mv	s10,a1
    42cc:	22c090ef          	jal	d4f8 <__gedf2>
    42d0:	7fffc797          	auipc	a5,0x7fffc
    42d4:	3e878793          	add	a5,a5,1000 # 800006b8 <__global_locale+0x184>
    42d8:	00040b13          	mv	s6,s0
    42dc:	0007a303          	lw	t1,0(a5)
    42e0:	05412403          	lw	s0,84(sp)
    42e4:	0047a383          	lw	t2,4(a5)
    42e8:	01812803          	lw	a6,24(sp)
    42ec:	02412e03          	lw	t3,36(sp)
    42f0:	04012e83          	lw	t4,64(sp)
    42f4:	0aa05ce3          	blez	a0,4bac <_vfprintf_r+0x2c3c>
    42f8:	02012783          	lw	a5,32(sp)
    42fc:	09012c23          	sw	a6,152(sp)
    4300:	fff4c603          	lbu	a2,-1(s1)
    4304:	00f7c583          	lbu	a1,15(a5)
    4308:	00048693          	mv	a3,s1
    430c:	02b61063          	bne	a2,a1,432c <_vfprintf_r+0x23bc>
    4310:	03000513          	li	a0,48
    4314:	fea68fa3          	sb	a0,-1(a3)
    4318:	09812683          	lw	a3,152(sp)
    431c:	fff68793          	add	a5,a3,-1
    4320:	08f12c23          	sw	a5,152(sp)
    4324:	fff6c603          	lbu	a2,-1(a3)
    4328:	feb606e3          	beq	a2,a1,4314 <_vfprintf_r+0x23a4>
    432c:	00160593          	add	a1,a2,1
    4330:	03900513          	li	a0,57
    4334:	0ff5f593          	zext.b	a1,a1
    4338:	04a60463          	beq	a2,a0,4380 <_vfprintf_r+0x2410>
    433c:	feb68fa3          	sb	a1,-1(a3)
    4340:	00048793          	mv	a5,s1
    4344:	07c12a03          	lw	s4,124(sp)
    4348:	418787b3          	sub	a5,a5,s8
    434c:	06100613          	li	a2,97
    4350:	fffa0d13          	add	s10,s4,-1
    4354:	00f12c23          	sw	a5,24(sp)
    4358:	07a12e23          	sw	s10,124(sp)
    435c:	07000693          	li	a3,112
    4360:	00ce0663          	beq	t3,a2,436c <_vfprintf_r+0x23fc>
    4364:	05000693          	li	a3,80
    4368:	04100e13          	li	t3,65
    436c:	00100613          	li	a2,1
    4370:	aa5ff06f          	j	3e14 <_vfprintf_r+0x1ea4>
    4374:	00030a13          	mv	s4,t1
    4378:	00300693          	li	a3,3
    437c:	cf5ff06f          	j	4070 <_vfprintf_r+0x2100>
    4380:	02012783          	lw	a5,32(sp)
    4384:	00a7c583          	lbu	a1,10(a5)
    4388:	feb68fa3          	sb	a1,-1(a3)
    438c:	fb5ff06f          	j	4340 <_vfprintf_r+0x23d0>
    4390:	02d00713          	li	a4,45
    4394:	06e10ba3          	sb	a4,119(sp)
    4398:	02d00613          	li	a2,45
    439c:	00000313          	li	t1,0
    43a0:	001c8c93          	add	s9,s9,1
    43a4:	e0dfd06f          	j	21b0 <_vfprintf_r+0x240>
    43a8:	01812783          	lw	a5,24(sp)
    43ac:	46fa4063          	blt	s4,a5,480c <_vfprintf_r+0x289c>
    43b0:	001ef713          	and	a4,t4,1
    43b4:	000a0d13          	mv	s10,s4
    43b8:	00070663          	beqz	a4,43c4 <_vfprintf_r+0x2454>
    43bc:	03012783          	lw	a5,48(sp)
    43c0:	00fa0d33          	add	s10,s4,a5
    43c4:	400eff13          	and	t5,t4,1024
    43c8:	000f0463          	beqz	t5,43d0 <_vfprintf_r+0x2460>
    43cc:	5f404e63          	bgtz	s4,49c8 <_vfprintf_r+0x2a58>
    43d0:	fffd4813          	not	a6,s10
    43d4:	41f85813          	sra	a6,a6,0x1f
    43d8:	010d7cb3          	and	s9,s10,a6
    43dc:	06700e13          	li	t3,103
    43e0:	000b0e93          	mv	t4,s6
    43e4:	02012223          	sw	zero,36(sp)
    43e8:	02012023          	sw	zero,32(sp)
    43ec:	b3dff06f          	j	3f28 <_vfprintf_r+0x1fb8>
    43f0:	02d00793          	li	a5,45
    43f4:	06f10ba3          	sb	a5,119(sp)
    43f8:	02d00613          	li	a2,45
    43fc:	998fe06f          	j	2594 <_vfprintf_r+0x624>
    4400:	01812783          	lw	a5,24(sp)
    4404:	02012a03          	lw	s4,32(sp)
    4408:	05212823          	sw	s2,80(sp)
    440c:	00fc07b3          	add	a5,s8,a5
    4410:	05712c23          	sw	s7,88(sp)
    4414:	05912e23          	sw	s9,92(sp)
    4418:	00040713          	mv	a4,s0
    441c:	04f12223          	sw	a5,68(sp)
    4420:	02412403          	lw	s0,36(sp)
    4424:	05d12a23          	sw	t4,84(sp)
    4428:	03812223          	sw	s8,36(sp)
    442c:	03c12b83          	lw	s7,60(sp)
    4430:	04c12c83          	lw	s9,76(sp)
    4434:	00812903          	lw	s2,8(sp)
    4438:	00700693          	li	a3,7
    443c:	01000d13          	li	s10,16
    4440:	0000bb17          	auipc	s6,0xb
    4444:	234b0b13          	add	s6,s6,564 # f674 <zeroes.0>
    4448:	00048613          	mv	a2,s1
    444c:	00030c13          	mv	s8,t1
    4450:	09405863          	blez	s4,44e0 <_vfprintf_r+0x2570>
    4454:	16805e63          	blez	s0,45d0 <_vfprintf_r+0x2660>
    4458:	fff40413          	add	s0,s0,-1
    445c:	04812783          	lw	a5,72(sp)
    4460:	01960633          	add	a2,a2,s9
    4464:	01972223          	sw	s9,4(a4)
    4468:	00f72023          	sw	a5,0(a4)
    446c:	0a412783          	lw	a5,164(sp)
    4470:	0ac12423          	sw	a2,168(sp)
    4474:	00870713          	add	a4,a4,8
    4478:	00178793          	add	a5,a5,1
    447c:	0af12223          	sw	a5,164(sp)
    4480:	14f6ce63          	blt	a3,a5,45dc <_vfprintf_r+0x266c>
    4484:	04412783          	lw	a5,68(sp)
    4488:	000bc583          	lbu	a1,0(s7)
    448c:	418784b3          	sub	s1,a5,s8
    4490:	0095d463          	bge	a1,s1,4498 <_vfprintf_r+0x2528>
    4494:	00058493          	mv	s1,a1
    4498:	02905663          	blez	s1,44c4 <_vfprintf_r+0x2554>
    449c:	0a412583          	lw	a1,164(sp)
    44a0:	00960633          	add	a2,a2,s1
    44a4:	01872023          	sw	s8,0(a4)
    44a8:	00158593          	add	a1,a1,1
    44ac:	00972223          	sw	s1,4(a4)
    44b0:	0ac12423          	sw	a2,168(sp)
    44b4:	0ab12223          	sw	a1,164(sp)
    44b8:	14b6c663          	blt	a3,a1,4604 <_vfprintf_r+0x2694>
    44bc:	000bc583          	lbu	a1,0(s7)
    44c0:	00870713          	add	a4,a4,8
    44c4:	fff4c513          	not	a0,s1
    44c8:	41f55513          	sra	a0,a0,0x1f
    44cc:	00a4f7b3          	and	a5,s1,a0
    44d0:	40f584b3          	sub	s1,a1,a5
    44d4:	04904663          	bgtz	s1,4520 <_vfprintf_r+0x25b0>
    44d8:	00bc0c33          	add	s8,s8,a1
    44dc:	f7404ce3          	bgtz	s4,4454 <_vfprintf_r+0x24e4>
    44e0:	f6804ce3          	bgtz	s0,4458 <_vfprintf_r+0x24e8>
    44e4:	01812783          	lw	a5,24(sp)
    44e8:	000c0313          	mv	t1,s8
    44ec:	02412c03          	lw	s8,36(sp)
    44f0:	03712e23          	sw	s7,60(sp)
    44f4:	00070413          	mv	s0,a4
    44f8:	00fc0733          	add	a4,s8,a5
    44fc:	05012903          	lw	s2,80(sp)
    4500:	05412e83          	lw	t4,84(sp)
    4504:	05812b83          	lw	s7,88(sp)
    4508:	05c12c83          	lw	s9,92(sp)
    450c:	00060493          	mv	s1,a2
    4510:	00676463          	bltu	a4,t1,4518 <_vfprintf_r+0x25a8>
    4514:	c59fe06f          	j	316c <_vfprintf_r+0x11fc>
    4518:	00070313          	mv	t1,a4
    451c:	c51fe06f          	j	316c <_vfprintf_r+0x11fc>
    4520:	0a412583          	lw	a1,164(sp)
    4524:	0000be97          	auipc	t4,0xb
    4528:	150e8e93          	add	t4,t4,336 # f674 <zeroes.0>
    452c:	069d5c63          	bge	s10,s1,45a4 <_vfprintf_r+0x2634>
    4530:	02812023          	sw	s0,32(sp)
    4534:	00048413          	mv	s0,s1
    4538:	000b0493          	mv	s1,s6
    453c:	00c0006f          	j	4548 <_vfprintf_r+0x25d8>
    4540:	ff040413          	add	s0,s0,-16
    4544:	048d5a63          	bge	s10,s0,4598 <_vfprintf_r+0x2628>
    4548:	01060613          	add	a2,a2,16
    454c:	00158593          	add	a1,a1,1
    4550:	01672023          	sw	s6,0(a4)
    4554:	01a72223          	sw	s10,4(a4)
    4558:	0ac12423          	sw	a2,168(sp)
    455c:	0ab12223          	sw	a1,164(sp)
    4560:	00870713          	add	a4,a4,8
    4564:	fcb6dee3          	bge	a3,a1,4540 <_vfprintf_r+0x25d0>
    4568:	0a010613          	add	a2,sp,160
    456c:	00090593          	mv	a1,s2
    4570:	00098513          	mv	a0,s3
    4574:	0b9000ef          	jal	4e2c <__sprint_r>
    4578:	00050463          	beqz	a0,4580 <_vfprintf_r+0x2610>
    457c:	ec5fd06f          	j	2440 <_vfprintf_r+0x4d0>
    4580:	ff040413          	add	s0,s0,-16
    4584:	0a812603          	lw	a2,168(sp)
    4588:	0a412583          	lw	a1,164(sp)
    458c:	0ac10713          	add	a4,sp,172
    4590:	00700693          	li	a3,7
    4594:	fa8d4ae3          	blt	s10,s0,4548 <_vfprintf_r+0x25d8>
    4598:	00048e93          	mv	t4,s1
    459c:	00040493          	mv	s1,s0
    45a0:	02012403          	lw	s0,32(sp)
    45a4:	00960633          	add	a2,a2,s1
    45a8:	00158593          	add	a1,a1,1
    45ac:	01d72023          	sw	t4,0(a4)
    45b0:	00972223          	sw	s1,4(a4)
    45b4:	0ac12423          	sw	a2,168(sp)
    45b8:	0ab12223          	sw	a1,164(sp)
    45bc:	10b6ce63          	blt	a3,a1,46d8 <_vfprintf_r+0x2768>
    45c0:	000bc583          	lbu	a1,0(s7)
    45c4:	00870713          	add	a4,a4,8
    45c8:	00bc0c33          	add	s8,s8,a1
    45cc:	f11ff06f          	j	44dc <_vfprintf_r+0x256c>
    45d0:	fffb8b93          	add	s7,s7,-1
    45d4:	fffa0a13          	add	s4,s4,-1
    45d8:	e85ff06f          	j	445c <_vfprintf_r+0x24ec>
    45dc:	0a010613          	add	a2,sp,160
    45e0:	00090593          	mv	a1,s2
    45e4:	00098513          	mv	a0,s3
    45e8:	045000ef          	jal	4e2c <__sprint_r>
    45ec:	00050463          	beqz	a0,45f4 <_vfprintf_r+0x2684>
    45f0:	e51fd06f          	j	2440 <_vfprintf_r+0x4d0>
    45f4:	0a812603          	lw	a2,168(sp)
    45f8:	0ac10713          	add	a4,sp,172
    45fc:	00700693          	li	a3,7
    4600:	e85ff06f          	j	4484 <_vfprintf_r+0x2514>
    4604:	0a010613          	add	a2,sp,160
    4608:	00090593          	mv	a1,s2
    460c:	00098513          	mv	a0,s3
    4610:	01d000ef          	jal	4e2c <__sprint_r>
    4614:	00050463          	beqz	a0,461c <_vfprintf_r+0x26ac>
    4618:	e29fd06f          	j	2440 <_vfprintf_r+0x4d0>
    461c:	000bc583          	lbu	a1,0(s7)
    4620:	0a812603          	lw	a2,168(sp)
    4624:	0ac10713          	add	a4,sp,172
    4628:	00700693          	li	a3,7
    462c:	e99ff06f          	j	44c4 <_vfprintf_r+0x2554>
    4630:	04c12783          	lw	a5,76(sp)
    4634:	04812583          	lw	a1,72(sp)
    4638:	00000913          	li	s2,0
    463c:	40fc0c33          	sub	s8,s8,a5
    4640:	00078613          	mv	a2,a5
    4644:	000c0513          	mv	a0,s8
    4648:	468030ef          	jal	7ab0 <strncpy>
    464c:	00144783          	lbu	a5,1(s0)
    4650:	00a00613          	li	a2,10
    4654:	00000693          	li	a3,0
    4658:	00f037b3          	snez	a5,a5
    465c:	000d0513          	mv	a0,s10
    4660:	000c8593          	mv	a1,s9
    4664:	00f40433          	add	s0,s0,a5
    4668:	78d060ef          	jal	b5f4 <__udivdi3>
    466c:	a10ff06f          	j	387c <_vfprintf_r+0x190c>
    4670:	09810713          	add	a4,sp,152
    4674:	00000693          	li	a3,0
    4678:	08410613          	add	a2,sp,132
    467c:	00000593          	li	a1,0
    4680:	00098513          	mv	a0,s3
    4684:	01c12a23          	sw	t3,20(sp)
    4688:	01d12823          	sw	t4,16(sp)
    468c:	618060ef          	jal	aca4 <_wcsrtombs_r>
    4690:	fff00713          	li	a4,-1
    4694:	01012e83          	lw	t4,16(sp)
    4698:	01412e03          	lw	t3,20(sp)
    469c:	00050d13          	mv	s10,a0
    46a0:	30e50063          	beq	a0,a4,49a0 <_vfprintf_r+0x2a30>
    46a4:	09812223          	sw	s8,132(sp)
    46a8:	cacff06f          	j	3b54 <_vfprintf_r+0x1be4>
    46ac:	07714603          	lbu	a2,119(sp)
    46b0:	01612a23          	sw	s6,20(sp)
    46b4:	02012223          	sw	zero,36(sp)
    46b8:	02012023          	sw	zero,32(sp)
    46bc:	00012823          	sw	zero,16(sp)
    46c0:	00000c93          	li	s9,0
    46c4:	00000313          	li	t1,0
    46c8:	00000a13          	li	s4,0
    46cc:	00061463          	bnez	a2,46d4 <_vfprintf_r+0x2764>
    46d0:	ae1fd06f          	j	21b0 <_vfprintf_r+0x240>
    46d4:	efdfd06f          	j	25d0 <_vfprintf_r+0x660>
    46d8:	0a010613          	add	a2,sp,160
    46dc:	00090593          	mv	a1,s2
    46e0:	00098513          	mv	a0,s3
    46e4:	748000ef          	jal	4e2c <__sprint_r>
    46e8:	00050463          	beqz	a0,46f0 <_vfprintf_r+0x2780>
    46ec:	d55fd06f          	j	2440 <_vfprintf_r+0x4d0>
    46f0:	000bc583          	lbu	a1,0(s7)
    46f4:	0a812603          	lw	a2,168(sp)
    46f8:	0ac10713          	add	a4,sp,172
    46fc:	00700693          	li	a3,7
    4700:	00bc0c33          	add	s8,s8,a1
    4704:	dd9ff06f          	j	44dc <_vfprintf_r+0x256c>
    4708:	00812583          	lw	a1,8(sp)
    470c:	0a010613          	add	a2,sp,160
    4710:	00098513          	mv	a0,s3
    4714:	05d12223          	sw	t4,68(sp)
    4718:	714000ef          	jal	4e2c <__sprint_r>
    471c:	00050463          	beqz	a0,4724 <_vfprintf_r+0x27b4>
    4720:	d21fd06f          	j	2440 <_vfprintf_r+0x4d0>
    4724:	0a812483          	lw	s1,168(sp)
    4728:	04412e83          	lw	t4,68(sp)
    472c:	0ac10413          	add	s0,sp,172
    4730:	a19fe06f          	j	3148 <_vfprintf_r+0x11d8>
    4734:	00900793          	li	a5,9
    4738:	95a7e263          	bltu	a5,s10,387c <_vfprintf_r+0x190c>
    473c:	98cff06f          	j	38c8 <_vfprintf_r+0x1958>
    4740:	07c12a03          	lw	s4,124(sp)
    4744:	00070793          	mv	a5,a4
    4748:	9f1ff06f          	j	4138 <_vfprintf_r+0x21c8>
    474c:	00812583          	lw	a1,8(sp)
    4750:	0a010613          	add	a2,sp,160
    4754:	00098513          	mv	a0,s3
    4758:	03d12023          	sw	t4,32(sp)
    475c:	6d0000ef          	jal	4e2c <__sprint_r>
    4760:	00050463          	beqz	a0,4768 <_vfprintf_r+0x27f8>
    4764:	cddfd06f          	j	2440 <_vfprintf_r+0x4d0>
    4768:	07c12d03          	lw	s10,124(sp)
    476c:	01812783          	lw	a5,24(sp)
    4770:	0a812483          	lw	s1,168(sp)
    4774:	02012e83          	lw	t4,32(sp)
    4778:	0ac10413          	add	s0,sp,172
    477c:	41a78d33          	sub	s10,a5,s10
    4780:	a49fe06f          	j	31c8 <_vfprintf_r+0x1258>
    4784:	00650733          	add	a4,a0,t1
    4788:	04700d13          	li	s10,71
    478c:	94dff06f          	j	40d8 <_vfprintf_r+0x2168>
    4790:	02812603          	lw	a2,40(sp)
    4794:	00048593          	mv	a1,s1
    4798:	00000693          	li	a3,0
    479c:	00060513          	mv	a0,a2
    47a0:	00000613          	li	a2,0
    47a4:	04e12823          	sw	a4,80(sp)
    47a8:	02612223          	sw	t1,36(sp)
    47ac:	03c12023          	sw	t3,32(sp)
    47b0:	01d12c23          	sw	t4,24(sp)
    47b4:	4b9080ef          	jal	d46c <__eqdf2>
    47b8:	01812e83          	lw	t4,24(sp)
    47bc:	02012e03          	lw	t3,32(sp)
    47c0:	02412303          	lw	t1,36(sp)
    47c4:	05012703          	lw	a4,80(sp)
    47c8:	34051e63          	bnez	a0,4b24 <_vfprintf_r+0x2bb4>
    47cc:	07c12a03          	lw	s4,124(sp)
    47d0:	01470733          	add	a4,a4,s4
    47d4:	418707b3          	sub	a5,a4,s8
    47d8:	00f12c23          	sw	a5,24(sp)
    47dc:	001ef713          	and	a4,t4,1
    47e0:	00676733          	or	a4,a4,t1
    47e4:	37405a63          	blez	s4,4b58 <_vfprintf_r+0x2be8>
    47e8:	26071263          	bnez	a4,4a4c <_vfprintf_r+0x2adc>
    47ec:	000a0d13          	mv	s10,s4
    47f0:	06600e13          	li	t3,102
    47f4:	400eff13          	and	t5,t4,1024
    47f8:	1c0f1a63          	bnez	t5,49cc <_vfprintf_r+0x2a5c>
    47fc:	fffd4813          	not	a6,s10
    4800:	41f85813          	sra	a6,a6,0x1f
    4804:	010d7cb3          	and	s9,s10,a6
    4808:	bd9ff06f          	j	43e0 <_vfprintf_r+0x2470>
    480c:	01812783          	lw	a5,24(sp)
    4810:	03012703          	lw	a4,48(sp)
    4814:	06700e13          	li	t3,103
    4818:	00e78d33          	add	s10,a5,a4
    481c:	fd404ce3          	bgtz	s4,47f4 <_vfprintf_r+0x2884>
    4820:	414d06b3          	sub	a3,s10,s4
    4824:	00168d13          	add	s10,a3,1
    4828:	fffd4813          	not	a6,s10
    482c:	41f85813          	sra	a6,a6,0x1f
    4830:	010d7cb3          	and	s9,s10,a6
    4834:	badff06f          	j	43e0 <_vfprintf_r+0x2470>
    4838:	000e8613          	mv	a2,t4
    483c:	ad8fe06f          	j	2b14 <_vfprintf_r+0xba4>
    4840:	00812783          	lw	a5,8(sp)
    4844:	0647a783          	lw	a5,100(a5)
    4848:	0017f793          	and	a5,a5,1
    484c:	02079063          	bnez	a5,486c <_vfprintf_r+0x28fc>
    4850:	00812783          	lw	a5,8(sp)
    4854:	00c7d783          	lhu	a5,12(a5)
    4858:	2007f793          	and	a5,a5,512
    485c:	00079863          	bnez	a5,486c <_vfprintf_r+0x28fc>
    4860:	00812783          	lw	a5,8(sp)
    4864:	0587a503          	lw	a0,88(a5)
    4868:	fb0fc0ef          	jal	1018 <__retarget_lock_release_recursive>
    486c:	fff00793          	li	a5,-1
    4870:	00f12623          	sw	a5,12(sp)
    4874:	c2dfd06f          	j	24a0 <_vfprintf_r+0x530>
    4878:	ff000613          	li	a2,-16
    487c:	40d00d33          	neg	s10,a3
    4880:	0000b297          	auipc	t0,0xb
    4884:	df428293          	add	t0,t0,-524 # f674 <zeroes.0>
    4888:	08c6d463          	bge	a3,a2,4910 <_vfprintf_r+0x29a0>
    488c:	03212023          	sw	s2,32(sp)
    4890:	01000693          	li	a3,16
    4894:	00700b13          	li	s6,7
    4898:	000e8a13          	mv	s4,t4
    489c:	00028913          	mv	s2,t0
    48a0:	00c0006f          	j	48ac <_vfprintf_r+0x293c>
    48a4:	ff0d0d13          	add	s10,s10,-16
    48a8:	05a6de63          	bge	a3,s10,4904 <_vfprintf_r+0x2994>
    48ac:	01048493          	add	s1,s1,16
    48b0:	00170713          	add	a4,a4,1
    48b4:	01242023          	sw	s2,0(s0)
    48b8:	00d42223          	sw	a3,4(s0)
    48bc:	0a912423          	sw	s1,168(sp)
    48c0:	0ae12223          	sw	a4,164(sp)
    48c4:	00840413          	add	s0,s0,8
    48c8:	fceb5ee3          	bge	s6,a4,48a4 <_vfprintf_r+0x2934>
    48cc:	00812583          	lw	a1,8(sp)
    48d0:	0a010613          	add	a2,sp,160
    48d4:	00098513          	mv	a0,s3
    48d8:	554000ef          	jal	4e2c <__sprint_r>
    48dc:	00050463          	beqz	a0,48e4 <_vfprintf_r+0x2974>
    48e0:	b61fd06f          	j	2440 <_vfprintf_r+0x4d0>
    48e4:	0a812483          	lw	s1,168(sp)
    48e8:	0a412703          	lw	a4,164(sp)
    48ec:	0ac10413          	add	s0,sp,172
    48f0:	01000693          	li	a3,16
    48f4:	fb1ff06f          	j	48a4 <_vfprintf_r+0x2934>
    48f8:	00012823          	sw	zero,16(sp)
    48fc:	0ec10c13          	add	s8,sp,236
    4900:	a88ff06f          	j	3b88 <_vfprintf_r+0x1c18>
    4904:	00090293          	mv	t0,s2
    4908:	02012903          	lw	s2,32(sp)
    490c:	000a0e93          	mv	t4,s4
    4910:	01a484b3          	add	s1,s1,s10
    4914:	00170713          	add	a4,a4,1
    4918:	00542023          	sw	t0,0(s0)
    491c:	01a42223          	sw	s10,4(s0)
    4920:	0a912423          	sw	s1,168(sp)
    4924:	0ae12223          	sw	a4,164(sp)
    4928:	00700693          	li	a3,7
    492c:	00e6c463          	blt	a3,a4,4934 <_vfprintf_r+0x29c4>
    4930:	b65fe06f          	j	3494 <_vfprintf_r+0x1524>
    4934:	00812583          	lw	a1,8(sp)
    4938:	0a010613          	add	a2,sp,160
    493c:	00098513          	mv	a0,s3
    4940:	03d12023          	sw	t4,32(sp)
    4944:	4e8000ef          	jal	4e2c <__sprint_r>
    4948:	00050463          	beqz	a0,4950 <_vfprintf_r+0x29e0>
    494c:	af5fd06f          	j	2440 <_vfprintf_r+0x4d0>
    4950:	0a812483          	lw	s1,168(sp)
    4954:	0a412703          	lw	a4,164(sp)
    4958:	02012e83          	lw	t4,32(sp)
    495c:	0ac10413          	add	s0,sp,172
    4960:	b20ff06f          	j	3c80 <_vfprintf_r+0x1d10>
    4964:	08a10693          	add	a3,sp,138
    4968:	00061863          	bnez	a2,4978 <_vfprintf_r+0x2a08>
    496c:	03000693          	li	a3,48
    4970:	08d10523          	sb	a3,138(sp)
    4974:	08b10693          	add	a3,sp,139
    4978:	15010793          	add	a5,sp,336
    497c:	40f68633          	sub	a2,a3,a5
    4980:	030d0713          	add	a4,s10,48
    4984:	0c960793          	add	a5,a2,201
    4988:	00e68023          	sb	a4,0(a3)
    498c:	04f12023          	sw	a5,64(sp)
    4990:	d5cff06f          	j	3eec <_vfprintf_r+0x1f7c>
    4994:	001ef713          	and	a4,t4,1
    4998:	d6070863          	beqz	a4,3f08 <_vfprintf_r+0x1f98>
    499c:	d64ff06f          	j	3f00 <_vfprintf_r+0x1f90>
    49a0:	00812783          	lw	a5,8(sp)
    49a4:	00000293          	li	t0,0
    49a8:	00c79783          	lh	a5,12(a5)
    49ac:	0407e793          	or	a5,a5,64
    49b0:	00812703          	lw	a4,8(sp)
    49b4:	00f71623          	sh	a5,12(a4)
    49b8:	a8dfd06f          	j	2444 <_vfprintf_r+0x4d4>
    49bc:	00012823          	sw	zero,16(sp)
    49c0:	00600313          	li	t1,6
    49c4:	ff9fe06f          	j	39bc <_vfprintf_r+0x1a4c>
    49c8:	06700e13          	li	t3,103
    49cc:	03c12783          	lw	a5,60(sp)
    49d0:	0ff00613          	li	a2,255
    49d4:	0007c703          	lbu	a4,0(a5)
    49d8:	22c70263          	beq	a4,a2,4bfc <_vfprintf_r+0x2c8c>
    49dc:	00000593          	li	a1,0
    49e0:	00000693          	li	a3,0
    49e4:	01475e63          	bge	a4,s4,4a00 <_vfprintf_r+0x2a90>
    49e8:	40ea0a33          	sub	s4,s4,a4
    49ec:	0017c703          	lbu	a4,1(a5)
    49f0:	04070863          	beqz	a4,4a40 <_vfprintf_r+0x2ad0>
    49f4:	00168693          	add	a3,a3,1
    49f8:	00178793          	add	a5,a5,1
    49fc:	fec714e3          	bne	a4,a2,49e4 <_vfprintf_r+0x2a74>
    4a00:	02f12e23          	sw	a5,60(sp)
    4a04:	02d12023          	sw	a3,32(sp)
    4a08:	02b12223          	sw	a1,36(sp)
    4a0c:	02012783          	lw	a5,32(sp)
    4a10:	02412703          	lw	a4,36(sp)
    4a14:	04c12583          	lw	a1,76(sp)
    4a18:	05c12823          	sw	t3,80(sp)
    4a1c:	00e78533          	add	a0,a5,a4
    4a20:	3a80a0ef          	jal	edc8 <__mulsi3>
    4a24:	01a50d33          	add	s10,a0,s10
    4a28:	fffd4813          	not	a6,s10
    4a2c:	41f85813          	sra	a6,a6,0x1f
    4a30:	05012e03          	lw	t3,80(sp)
    4a34:	010d7cb3          	and	s9,s10,a6
    4a38:	000b0e93          	mv	t4,s6
    4a3c:	cecff06f          	j	3f28 <_vfprintf_r+0x1fb8>
    4a40:	0007c703          	lbu	a4,0(a5)
    4a44:	00158593          	add	a1,a1,1
    4a48:	fb5ff06f          	j	49fc <_vfprintf_r+0x2a8c>
    4a4c:	03012783          	lw	a5,48(sp)
    4a50:	06600e13          	li	t3,102
    4a54:	00f306b3          	add	a3,t1,a5
    4a58:	01468d33          	add	s10,a3,s4
    4a5c:	d99ff06f          	j	47f4 <_vfprintf_r+0x2884>
    4a60:	02c12783          	lw	a5,44(sp)
    4a64:	0a07c863          	bltz	a5,4b14 <_vfprintf_r+0x2ba4>
    4a68:	07714603          	lbu	a2,119(sp)
    4a6c:	04700713          	li	a4,71
    4a70:	0000ac17          	auipc	s8,0xa
    4a74:	718c0c13          	add	s8,s8,1816 # f188 <__fini_array_end+0x1c8>
    4a78:	01c75463          	bge	a4,t3,4a80 <_vfprintf_r+0x2b10>
    4a7c:	b31fd06f          	j	25ac <_vfprintf_r+0x63c>
    4a80:	0000ac17          	auipc	s8,0xa
    4a84:	704c0c13          	add	s8,s8,1796 # f184 <__fini_array_end+0x1c4>
    4a88:	b25fd06f          	j	25ac <_vfprintf_r+0x63c>
    4a8c:	07714603          	lbu	a2,119(sp)
    4a90:	01612a23          	sw	s6,20(sp)
    4a94:	02012223          	sw	zero,36(sp)
    4a98:	02012023          	sw	zero,32(sp)
    4a9c:	00030c93          	mv	s9,t1
    4aa0:	00030d13          	mv	s10,t1
    4aa4:	07300e13          	li	t3,115
    4aa8:	00000313          	li	t1,0
    4aac:	00061463          	bnez	a2,4ab4 <_vfprintf_r+0x2b44>
    4ab0:	f00fd06f          	j	21b0 <_vfprintf_r+0x240>
    4ab4:	b1dfd06f          	j	25d0 <_vfprintf_r+0x660>
    4ab8:	00040313          	mv	t1,s0
    4abc:	01012903          	lw	s2,16(sp)
    4ac0:	000b0413          	mv	s0,s6
    4ac4:	01412e03          	lw	t3,20(sp)
    4ac8:	000c0b13          	mv	s6,s8
    4acc:	000a0e93          	mv	t4,s4
    4ad0:	000c8c13          	mv	s8,s9
    4ad4:	00030d13          	mv	s10,t1
    4ad8:	87cff06f          	j	3b54 <_vfprintf_r+0x1be4>
    4adc:	001b0793          	add	a5,s6,1
    4ae0:	000c0993          	mv	s3,s8
    4ae4:	02412903          	lw	s2,36(sp)
    4ae8:	04012e83          	lw	t4,64(sp)
    4aec:	05012e03          	lw	t3,80(sp)
    4af0:	05412403          	lw	s0,84(sp)
    4af4:	000d0c13          	mv	s8,s10
    4af8:	00f487b3          	add	a5,s1,a5
    4afc:	03000693          	li	a3,48
    4b00:	840b40e3          	bltz	s6,4340 <_vfprintf_r+0x23d0>
    4b04:	00148493          	add	s1,s1,1
    4b08:	fed48fa3          	sb	a3,-1(s1)
    4b0c:	fe979ce3          	bne	a5,s1,4b04 <_vfprintf_r+0x2b94>
    4b10:	835ff06f          	j	4344 <_vfprintf_r+0x23d4>
    4b14:	02d00793          	li	a5,45
    4b18:	06f10ba3          	sb	a5,119(sp)
    4b1c:	02d00613          	li	a2,45
    4b20:	f4dff06f          	j	4a6c <_vfprintf_r+0x2afc>
    4b24:	00100693          	li	a3,1
    4b28:	414686b3          	sub	a3,a3,s4
    4b2c:	06d12e23          	sw	a3,124(sp)
    4b30:	da4ff06f          	j	40d4 <_vfprintf_r+0x2164>
    4b34:	01412783          	lw	a5,20(sp)
    4b38:	0007ab03          	lw	s6,0(a5)
    4b3c:	00478793          	add	a5,a5,4
    4b40:	000b5463          	bgez	s6,4b48 <_vfprintf_r+0x2bd8>
    4b44:	fff00b13          	li	s6,-1
    4b48:	00194e03          	lbu	t3,1(s2)
    4b4c:	00f12a23          	sw	a5,20(sp)
    4b50:	00068913          	mv	s2,a3
    4b54:	dccfd06f          	j	2120 <_vfprintf_r+0x1b0>
    4b58:	00071a63          	bnez	a4,4b6c <_vfprintf_r+0x2bfc>
    4b5c:	00100c93          	li	s9,1
    4b60:	06600e13          	li	t3,102
    4b64:	00100d13          	li	s10,1
    4b68:	879ff06f          	j	43e0 <_vfprintf_r+0x2470>
    4b6c:	03012783          	lw	a5,48(sp)
    4b70:	06600e13          	li	t3,102
    4b74:	00178693          	add	a3,a5,1
    4b78:	00668d33          	add	s10,a3,t1
    4b7c:	fffd4813          	not	a6,s10
    4b80:	41f85813          	sra	a6,a6,0x1f
    4b84:	010d7cb3          	and	s9,s10,a6
    4b88:	859ff06f          	j	43e0 <_vfprintf_r+0x2470>
    4b8c:	00200793          	li	a5,2
    4b90:	04f12023          	sw	a5,64(sp)
    4b94:	b58ff06f          	j	3eec <_vfprintf_r+0x1f7c>
    4b98:	00812703          	lw	a4,8(sp)
    4b9c:	00c71783          	lh	a5,12(a4)
    4ba0:	0407e793          	or	a5,a5,64
    4ba4:	00f71623          	sh	a5,12(a4)
    4ba8:	8b5fd06f          	j	245c <_vfprintf_r+0x4ec>
    4bac:	000a0513          	mv	a0,s4
    4bb0:	000d0593          	mv	a1,s10
    4bb4:	00030613          	mv	a2,t1
    4bb8:	00038693          	mv	a3,t2
    4bbc:	05012023          	sw	a6,64(sp)
    4bc0:	03c12223          	sw	t3,36(sp)
    4bc4:	01d12c23          	sw	t4,24(sp)
    4bc8:	0a5080ef          	jal	d46c <__eqdf2>
    4bcc:	01812e83          	lw	t4,24(sp)
    4bd0:	02412e03          	lw	t3,36(sp)
    4bd4:	04012803          	lw	a6,64(sp)
    4bd8:	f6051463          	bnez	a0,4340 <_vfprintf_r+0x23d0>
    4bdc:	001b7693          	and	a3,s6,1
    4be0:	f6068063          	beqz	a3,4340 <_vfprintf_r+0x23d0>
    4be4:	f14ff06f          	j	42f8 <_vfprintf_r+0x2388>
    4be8:	00812783          	lw	a5,8(sp)
    4bec:	01012283          	lw	t0,16(sp)
    4bf0:	00c79783          	lh	a5,12(a5)
    4bf4:	0407e793          	or	a5,a5,64
    4bf8:	db9ff06f          	j	49b0 <_vfprintf_r+0x2a40>
    4bfc:	02012223          	sw	zero,36(sp)
    4c00:	02012023          	sw	zero,32(sp)
    4c04:	e09ff06f          	j	4a0c <_vfprintf_r+0x2a9c>
    4c08:	04500d13          	li	s10,69
    4c0c:	cccff06f          	j	40d8 <_vfprintf_r+0x2168>

00004c10 <__sbprintf>:
    4c10:	b7010113          	add	sp,sp,-1168
    4c14:	00c59783          	lh	a5,12(a1)
    4c18:	00e5d703          	lhu	a4,14(a1)
    4c1c:	48812423          	sw	s0,1160(sp)
    4c20:	00058413          	mv	s0,a1
    4c24:	000105b7          	lui	a1,0x10
    4c28:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x59d>
    4c2c:	06442303          	lw	t1,100(s0)
    4c30:	01c42883          	lw	a7,28(s0)
    4c34:	02442803          	lw	a6,36(s0)
    4c38:	01071713          	sll	a4,a4,0x10
    4c3c:	00b7f7b3          	and	a5,a5,a1
    4c40:	00e7e7b3          	or	a5,a5,a4
    4c44:	40000593          	li	a1,1024
    4c48:	49212023          	sw	s2,1152(sp)
    4c4c:	00f12a23          	sw	a5,20(sp)
    4c50:	00050913          	mv	s2,a0
    4c54:	07010793          	add	a5,sp,112
    4c58:	06010513          	add	a0,sp,96
    4c5c:	48112623          	sw	ra,1164(sp)
    4c60:	48912223          	sw	s1,1156(sp)
    4c64:	47312e23          	sw	s3,1148(sp)
    4c68:	00060493          	mv	s1,a2
    4c6c:	00068993          	mv	s3,a3
    4c70:	06612623          	sw	t1,108(sp)
    4c74:	03112223          	sw	a7,36(sp)
    4c78:	03012623          	sw	a6,44(sp)
    4c7c:	00f12423          	sw	a5,8(sp)
    4c80:	00f12c23          	sw	a5,24(sp)
    4c84:	00b12823          	sw	a1,16(sp)
    4c88:	00b12e23          	sw	a1,28(sp)
    4c8c:	02012023          	sw	zero,32(sp)
    4c90:	b7cfc0ef          	jal	100c <__retarget_lock_init_recursive>
    4c94:	00048613          	mv	a2,s1
    4c98:	00098693          	mv	a3,s3
    4c9c:	00810593          	add	a1,sp,8
    4ca0:	00090513          	mv	a0,s2
    4ca4:	accfd0ef          	jal	1f70 <_vfprintf_r>
    4ca8:	00050493          	mv	s1,a0
    4cac:	04055263          	bgez	a0,4cf0 <__sbprintf+0xe0>
    4cb0:	01415783          	lhu	a5,20(sp)
    4cb4:	0407f793          	and	a5,a5,64
    4cb8:	00078863          	beqz	a5,4cc8 <__sbprintf+0xb8>
    4cbc:	00c45783          	lhu	a5,12(s0)
    4cc0:	0407e793          	or	a5,a5,64
    4cc4:	00f41623          	sh	a5,12(s0)
    4cc8:	06012503          	lw	a0,96(sp)
    4ccc:	b44fc0ef          	jal	1010 <__retarget_lock_close_recursive>
    4cd0:	48c12083          	lw	ra,1164(sp)
    4cd4:	48812403          	lw	s0,1160(sp)
    4cd8:	48012903          	lw	s2,1152(sp)
    4cdc:	47c12983          	lw	s3,1148(sp)
    4ce0:	00048513          	mv	a0,s1
    4ce4:	48412483          	lw	s1,1156(sp)
    4ce8:	49010113          	add	sp,sp,1168
    4cec:	00008067          	ret
    4cf0:	00810593          	add	a1,sp,8
    4cf4:	00090513          	mv	a0,s2
    4cf8:	449010ef          	jal	6940 <_fflush_r>
    4cfc:	fa050ae3          	beqz	a0,4cb0 <__sbprintf+0xa0>
    4d00:	fff00493          	li	s1,-1
    4d04:	fadff06f          	j	4cb0 <__sbprintf+0xa0>

00004d08 <__sprint_r.part.0>:
    4d08:	0645a783          	lw	a5,100(a1)
    4d0c:	fd010113          	add	sp,sp,-48
    4d10:	01612823          	sw	s6,16(sp)
    4d14:	02112623          	sw	ra,44(sp)
    4d18:	01279713          	sll	a4,a5,0x12
    4d1c:	00060b13          	mv	s6,a2
    4d20:	0e075863          	bgez	a4,4e10 <__sprint_r.part.0+0x108>
    4d24:	00862783          	lw	a5,8(a2)
    4d28:	03212023          	sw	s2,32(sp)
    4d2c:	01312e23          	sw	s3,28(sp)
    4d30:	01512a23          	sw	s5,20(sp)
    4d34:	01712623          	sw	s7,12(sp)
    4d38:	00058913          	mv	s2,a1
    4d3c:	00062b83          	lw	s7,0(a2)
    4d40:	00050993          	mv	s3,a0
    4d44:	fff00a93          	li	s5,-1
    4d48:	0a078863          	beqz	a5,4df8 <__sprint_r.part.0+0xf0>
    4d4c:	02812423          	sw	s0,40(sp)
    4d50:	02912223          	sw	s1,36(sp)
    4d54:	01412c23          	sw	s4,24(sp)
    4d58:	01812423          	sw	s8,8(sp)
    4d5c:	004bac03          	lw	s8,4(s7)
    4d60:	000ba403          	lw	s0,0(s7)
    4d64:	002c5a13          	srl	s4,s8,0x2
    4d68:	060a0663          	beqz	s4,4dd4 <__sprint_r.part.0+0xcc>
    4d6c:	00000493          	li	s1,0
    4d70:	00c0006f          	j	4d7c <__sprint_r.part.0+0x74>
    4d74:	00440413          	add	s0,s0,4
    4d78:	049a0c63          	beq	s4,s1,4dd0 <__sprint_r.part.0+0xc8>
    4d7c:	00042583          	lw	a1,0(s0)
    4d80:	00090613          	mv	a2,s2
    4d84:	00098513          	mv	a0,s3
    4d88:	399020ef          	jal	7920 <_fputwc_r>
    4d8c:	00148493          	add	s1,s1,1
    4d90:	ff5512e3          	bne	a0,s5,4d74 <__sprint_r.part.0+0x6c>
    4d94:	02812403          	lw	s0,40(sp)
    4d98:	02412483          	lw	s1,36(sp)
    4d9c:	02012903          	lw	s2,32(sp)
    4da0:	01c12983          	lw	s3,28(sp)
    4da4:	01812a03          	lw	s4,24(sp)
    4da8:	01412a83          	lw	s5,20(sp)
    4dac:	00c12b83          	lw	s7,12(sp)
    4db0:	00812c03          	lw	s8,8(sp)
    4db4:	fff00513          	li	a0,-1
    4db8:	02c12083          	lw	ra,44(sp)
    4dbc:	000b2423          	sw	zero,8(s6)
    4dc0:	000b2223          	sw	zero,4(s6)
    4dc4:	01012b03          	lw	s6,16(sp)
    4dc8:	03010113          	add	sp,sp,48
    4dcc:	00008067          	ret
    4dd0:	008b2783          	lw	a5,8(s6)
    4dd4:	ffcc7c13          	and	s8,s8,-4
    4dd8:	418787b3          	sub	a5,a5,s8
    4ddc:	00fb2423          	sw	a5,8(s6)
    4de0:	008b8b93          	add	s7,s7,8
    4de4:	f6079ce3          	bnez	a5,4d5c <__sprint_r.part.0+0x54>
    4de8:	02812403          	lw	s0,40(sp)
    4dec:	02412483          	lw	s1,36(sp)
    4df0:	01812a03          	lw	s4,24(sp)
    4df4:	00812c03          	lw	s8,8(sp)
    4df8:	02012903          	lw	s2,32(sp)
    4dfc:	01c12983          	lw	s3,28(sp)
    4e00:	01412a83          	lw	s5,20(sp)
    4e04:	00c12b83          	lw	s7,12(sp)
    4e08:	00000513          	li	a0,0
    4e0c:	fadff06f          	j	4db8 <__sprint_r.part.0+0xb0>
    4e10:	6b5010ef          	jal	6cc4 <__sfvwrite_r>
    4e14:	02c12083          	lw	ra,44(sp)
    4e18:	000b2423          	sw	zero,8(s6)
    4e1c:	000b2223          	sw	zero,4(s6)
    4e20:	01012b03          	lw	s6,16(sp)
    4e24:	03010113          	add	sp,sp,48
    4e28:	00008067          	ret

00004e2c <__sprint_r>:
    4e2c:	00862703          	lw	a4,8(a2)
    4e30:	00070463          	beqz	a4,4e38 <__sprint_r+0xc>
    4e34:	ed5ff06f          	j	4d08 <__sprint_r.part.0>
    4e38:	00062223          	sw	zero,4(a2)
    4e3c:	00000513          	li	a0,0
    4e40:	00008067          	ret

00004e44 <_vfiprintf_r>:
    4e44:	eb010113          	add	sp,sp,-336
    4e48:	14812423          	sw	s0,328(sp)
    4e4c:	13312e23          	sw	s3,316(sp)
    4e50:	13812423          	sw	s8,296(sp)
    4e54:	00050413          	mv	s0,a0
    4e58:	00058993          	mv	s3,a1
    4e5c:	00060c13          	mv	s8,a2
    4e60:	00000593          	li	a1,0
    4e64:	00800613          	li	a2,8
    4e68:	05010513          	add	a0,sp,80
    4e6c:	13512a23          	sw	s5,308(sp)
    4e70:	14112623          	sw	ra,332(sp)
    4e74:	00068a93          	mv	s5,a3
    4e78:	9a4fc0ef          	jal	101c <memset>
    4e7c:	00040863          	beqz	s0,4e8c <_vfiprintf_r+0x48>
    4e80:	03442783          	lw	a5,52(s0)
    4e84:	00079463          	bnez	a5,4e8c <_vfiprintf_r+0x48>
    4e88:	49c0106f          	j	6324 <_vfiprintf_r+0x14e0>
    4e8c:	0649a703          	lw	a4,100(s3)
    4e90:	00c99783          	lh	a5,12(s3)
    4e94:	00177713          	and	a4,a4,1
    4e98:	00071863          	bnez	a4,4ea8 <_vfiprintf_r+0x64>
    4e9c:	2007f713          	and	a4,a5,512
    4ea0:	00071463          	bnez	a4,4ea8 <_vfiprintf_r+0x64>
    4ea4:	0b80106f          	j	5f5c <_vfiprintf_r+0x1118>
    4ea8:	01279713          	sll	a4,a5,0x12
    4eac:	02074663          	bltz	a4,4ed8 <_vfiprintf_r+0x94>
    4eb0:	0649a703          	lw	a4,100(s3)
    4eb4:	00002637          	lui	a2,0x2
    4eb8:	ffffe6b7          	lui	a3,0xffffe
    4ebc:	00c7e7b3          	or	a5,a5,a2
    4ec0:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4ec4:	01079793          	sll	a5,a5,0x10
    4ec8:	4107d793          	sra	a5,a5,0x10
    4ecc:	00d77733          	and	a4,a4,a3
    4ed0:	00f99623          	sh	a5,12(s3)
    4ed4:	06e9a223          	sw	a4,100(s3)
    4ed8:	0087f713          	and	a4,a5,8
    4edc:	2e070463          	beqz	a4,51c4 <_vfiprintf_r+0x380>
    4ee0:	0109a703          	lw	a4,16(s3)
    4ee4:	2e070063          	beqz	a4,51c4 <_vfiprintf_r+0x380>
    4ee8:	01a7f713          	and	a4,a5,26
    4eec:	00a00693          	li	a3,10
    4ef0:	2ed70c63          	beq	a4,a3,51e8 <_vfiprintf_r+0x3a4>
    4ef4:	13412c23          	sw	s4,312(sp)
    4ef8:	06c10a13          	add	s4,sp,108
    4efc:	14912223          	sw	s1,324(sp)
    4f00:	15212023          	sw	s2,320(sp)
    4f04:	13612823          	sw	s6,304(sp)
    4f08:	13712623          	sw	s7,300(sp)
    4f0c:	13912223          	sw	s9,292(sp)
    4f10:	13a12023          	sw	s10,288(sp)
    4f14:	000c0c93          	mv	s9,s8
    4f18:	11b12e23          	sw	s11,284(sp)
    4f1c:	07412023          	sw	s4,96(sp)
    4f20:	06012423          	sw	zero,104(sp)
    4f24:	06012223          	sw	zero,100(sp)
    4f28:	00012a23          	sw	zero,20(sp)
    4f2c:	02012623          	sw	zero,44(sp)
    4f30:	02012823          	sw	zero,48(sp)
    4f34:	02012a23          	sw	zero,52(sp)
    4f38:	00012623          	sw	zero,12(sp)
    4f3c:	7fffb497          	auipc	s1,0x7fffb
    4f40:	5f848493          	add	s1,s1,1528 # 80000534 <__global_locale>
    4f44:	02500913          	li	s2,37
    4f48:	0000ab97          	auipc	s7,0xa
    4f4c:	74cb8b93          	add	s7,s7,1868 # f694 <blanks.1+0x10>
    4f50:	0000bb17          	auipc	s6,0xb
    4f54:	8b0b0b13          	add	s6,s6,-1872 # f800 <zeroes.0>
    4f58:	000a0c13          	mv	s8,s4
    4f5c:	000c8d93          	mv	s11,s9
    4f60:	0e44ad03          	lw	s10,228(s1)
    4f64:	3f9020ef          	jal	7b5c <__locale_mb_cur_max>
    4f68:	00050693          	mv	a3,a0
    4f6c:	05010713          	add	a4,sp,80
    4f70:	000d8613          	mv	a2,s11
    4f74:	04810593          	add	a1,sp,72
    4f78:	00040513          	mv	a0,s0
    4f7c:	000d00e7          	jalr	s10
    4f80:	2e050e63          	beqz	a0,527c <_vfiprintf_r+0x438>
    4f84:	2c054e63          	bltz	a0,5260 <_vfiprintf_r+0x41c>
    4f88:	04812783          	lw	a5,72(sp)
    4f8c:	01278663          	beq	a5,s2,4f98 <_vfiprintf_r+0x154>
    4f90:	00ad8db3          	add	s11,s11,a0
    4f94:	fcdff06f          	j	4f60 <_vfiprintf_r+0x11c>
    4f98:	00050d13          	mv	s10,a0
    4f9c:	419d87b3          	sub	a5,s11,s9
    4fa0:	2f9d9463          	bne	s11,s9,5288 <_vfiprintf_r+0x444>
    4fa4:	00000e13          	li	t3,0
    4fa8:	001dc683          	lbu	a3,1(s11)
    4fac:	001d8c93          	add	s9,s11,1
    4fb0:	040101a3          	sb	zero,67(sp)
    4fb4:	fff00713          	li	a4,-1
    4fb8:	00000893          	li	a7,0
    4fbc:	05a00d13          	li	s10,90
    4fc0:	000e0d93          	mv	s11,t3
    4fc4:	001c8c93          	add	s9,s9,1
    4fc8:	fe068793          	add	a5,a3,-32
    4fcc:	04fd6663          	bltu	s10,a5,5018 <_vfiprintf_r+0x1d4>
    4fd0:	00279793          	sll	a5,a5,0x2
    4fd4:	017787b3          	add	a5,a5,s7
    4fd8:	0007a783          	lw	a5,0(a5)
    4fdc:	017787b3          	add	a5,a5,s7
    4fe0:	00078067          	jr	a5
    4fe4:	00000893          	li	a7,0
    4fe8:	fd068793          	add	a5,a3,-48
    4fec:	00900593          	li	a1,9
    4ff0:	000cc683          	lbu	a3,0(s9)
    4ff4:	00289613          	sll	a2,a7,0x2
    4ff8:	011608b3          	add	a7,a2,a7
    4ffc:	00189893          	sll	a7,a7,0x1
    5000:	011788b3          	add	a7,a5,a7
    5004:	fd068793          	add	a5,a3,-48
    5008:	001c8c93          	add	s9,s9,1
    500c:	fef5f2e3          	bgeu	a1,a5,4ff0 <_vfiprintf_r+0x1ac>
    5010:	fe068793          	add	a5,a3,-32
    5014:	fafd7ee3          	bgeu	s10,a5,4fd0 <_vfiprintf_r+0x18c>
    5018:	000d8e13          	mv	t3,s11
    501c:	2c068663          	beqz	a3,52e8 <_vfiprintf_r+0x4a4>
    5020:	0ad10623          	sb	a3,172(sp)
    5024:	040101a3          	sb	zero,67(sp)
    5028:	00100e93          	li	t4,1
    502c:	00100d13          	li	s10,1
    5030:	0ac10813          	add	a6,sp,172
    5034:	00012823          	sw	zero,16(sp)
    5038:	00000713          	li	a4,0
    503c:	00000f93          	li	t6,0
    5040:	06412603          	lw	a2,100(sp)
    5044:	084e7293          	and	t0,t3,132
    5048:	06812783          	lw	a5,104(sp)
    504c:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x91>
    5050:	00058f13          	mv	t5,a1
    5054:	00029663          	bnez	t0,5060 <_vfiprintf_r+0x21c>
    5058:	41d88db3          	sub	s11,a7,t4
    505c:	47b046e3          	bgtz	s11,5cc8 <_vfiprintf_r+0xe84>
    5060:	04314583          	lbu	a1,67(sp)
    5064:	02058a63          	beqz	a1,5098 <_vfiprintf_r+0x254>
    5068:	04310613          	add	a2,sp,67
    506c:	00178793          	add	a5,a5,1
    5070:	00100693          	li	a3,1
    5074:	00cc2023          	sw	a2,0(s8)
    5078:	00dc2223          	sw	a3,4(s8)
    507c:	06f12423          	sw	a5,104(sp)
    5080:	07e12223          	sw	t5,100(sp)
    5084:	00700613          	li	a2,7
    5088:	35e64ce3          	blt	a2,t5,5be0 <_vfiprintf_r+0xd9c>
    508c:	000f0613          	mv	a2,t5
    5090:	008c0c13          	add	s8,s8,8
    5094:	001f0f13          	add	t5,t5,1
    5098:	080f8063          	beqz	t6,5118 <_vfiprintf_r+0x2d4>
    509c:	00200613          	li	a2,2
    50a0:	00278793          	add	a5,a5,2
    50a4:	04410693          	add	a3,sp,68
    50a8:	00cc2223          	sw	a2,4(s8)
    50ac:	00dc2023          	sw	a3,0(s8)
    50b0:	06f12423          	sw	a5,104(sp)
    50b4:	07e12223          	sw	t5,100(sp)
    50b8:	00700613          	li	a2,7
    50bc:	3be652e3          	bge	a2,t5,5c60 <_vfiprintf_r+0xe1c>
    50c0:	60078ae3          	beqz	a5,5ed4 <_vfiprintf_r+0x1090>
    50c4:	06010613          	add	a2,sp,96
    50c8:	00098593          	mv	a1,s3
    50cc:	00040513          	mv	a0,s0
    50d0:	03d12c23          	sw	t4,56(sp)
    50d4:	02e12423          	sw	a4,40(sp)
    50d8:	03112223          	sw	a7,36(sp)
    50dc:	03012023          	sw	a6,32(sp)
    50e0:	00512e23          	sw	t0,28(sp)
    50e4:	01c12c23          	sw	t3,24(sp)
    50e8:	c21ff0ef          	jal	4d08 <__sprint_r.part.0>
    50ec:	22051463          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    50f0:	06412603          	lw	a2,100(sp)
    50f4:	06812783          	lw	a5,104(sp)
    50f8:	03812e83          	lw	t4,56(sp)
    50fc:	02812703          	lw	a4,40(sp)
    5100:	02412883          	lw	a7,36(sp)
    5104:	02012803          	lw	a6,32(sp)
    5108:	01c12283          	lw	t0,28(sp)
    510c:	01812e03          	lw	t3,24(sp)
    5110:	000a0c13          	mv	s8,s4
    5114:	00160f13          	add	t5,a2,1
    5118:	08000593          	li	a1,128
    511c:	06b286e3          	beq	t0,a1,5988 <_vfiprintf_r+0xb44>
    5120:	41a70733          	sub	a4,a4,s10
    5124:	1ae04ae3          	bgtz	a4,5ad8 <_vfiprintf_r+0xc94>
    5128:	00fd07b3          	add	a5,s10,a5
    512c:	010c2023          	sw	a6,0(s8)
    5130:	01ac2223          	sw	s10,4(s8)
    5134:	06f12423          	sw	a5,104(sp)
    5138:	07e12223          	sw	t5,100(sp)
    513c:	00700713          	li	a4,7
    5140:	03e758e3          	bge	a4,t5,5970 <_vfiprintf_r+0xb2c>
    5144:	24078063          	beqz	a5,5384 <_vfiprintf_r+0x540>
    5148:	06010613          	add	a2,sp,96
    514c:	00098593          	mv	a1,s3
    5150:	00040513          	mv	a0,s0
    5154:	03d12023          	sw	t4,32(sp)
    5158:	01112e23          	sw	a7,28(sp)
    515c:	01c12c23          	sw	t3,24(sp)
    5160:	ba9ff0ef          	jal	4d08 <__sprint_r.part.0>
    5164:	1a051863          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5168:	06812783          	lw	a5,104(sp)
    516c:	02012e83          	lw	t4,32(sp)
    5170:	01c12883          	lw	a7,28(sp)
    5174:	01812e03          	lw	t3,24(sp)
    5178:	000a0c13          	mv	s8,s4
    517c:	004e7e13          	and	t3,t3,4
    5180:	000e0663          	beqz	t3,518c <_vfiprintf_r+0x348>
    5184:	41d88db3          	sub	s11,a7,t4
    5188:	21b04a63          	bgtz	s11,539c <_vfiprintf_r+0x558>
    518c:	01d8d463          	bge	a7,t4,5194 <_vfiprintf_r+0x350>
    5190:	000e8893          	mv	a7,t4
    5194:	00c12703          	lw	a4,12(sp)
    5198:	01170733          	add	a4,a4,a7
    519c:	00e12623          	sw	a4,12(sp)
    51a0:	16079063          	bnez	a5,5300 <_vfiprintf_r+0x4bc>
    51a4:	01012783          	lw	a5,16(sp)
    51a8:	06012223          	sw	zero,100(sp)
    51ac:	00078863          	beqz	a5,51bc <_vfiprintf_r+0x378>
    51b0:	00078593          	mv	a1,a5
    51b4:	00040513          	mv	a0,s0
    51b8:	ab4fc0ef          	jal	146c <_free_r>
    51bc:	000a0c13          	mv	s8,s4
    51c0:	d9dff06f          	j	4f5c <_vfiprintf_r+0x118>
    51c4:	00098593          	mv	a1,s3
    51c8:	00040513          	mv	a0,s0
    51cc:	4b0020ef          	jal	767c <__swsetup_r>
    51d0:	00050463          	beqz	a0,51d8 <_vfiprintf_r+0x394>
    51d4:	3840106f          	j	6558 <_vfiprintf_r+0x1714>
    51d8:	00c99783          	lh	a5,12(s3)
    51dc:	00a00693          	li	a3,10
    51e0:	01a7f713          	and	a4,a5,26
    51e4:	d0d718e3          	bne	a4,a3,4ef4 <_vfiprintf_r+0xb0>
    51e8:	00e99703          	lh	a4,14(s3)
    51ec:	d00744e3          	bltz	a4,4ef4 <_vfiprintf_r+0xb0>
    51f0:	0649a703          	lw	a4,100(s3)
    51f4:	00177713          	and	a4,a4,1
    51f8:	00071863          	bnez	a4,5208 <_vfiprintf_r+0x3c4>
    51fc:	2007f793          	and	a5,a5,512
    5200:	00079463          	bnez	a5,5208 <_vfiprintf_r+0x3c4>
    5204:	2ac0106f          	j	64b0 <_vfiprintf_r+0x166c>
    5208:	000a8693          	mv	a3,s5
    520c:	000c0613          	mv	a2,s8
    5210:	00098593          	mv	a1,s3
    5214:	00040513          	mv	a0,s0
    5218:	3e4010ef          	jal	65fc <__sbprintf>
    521c:	14c12083          	lw	ra,332(sp)
    5220:	14812403          	lw	s0,328(sp)
    5224:	00a12623          	sw	a0,12(sp)
    5228:	00c12503          	lw	a0,12(sp)
    522c:	13c12983          	lw	s3,316(sp)
    5230:	13412a83          	lw	s5,308(sp)
    5234:	12812c03          	lw	s8,296(sp)
    5238:	15010113          	add	sp,sp,336
    523c:	00008067          	ret
    5240:	000aa883          	lw	a7,0(s5)
    5244:	004a8a93          	add	s5,s5,4
    5248:	3608cc63          	bltz	a7,55c0 <_vfiprintf_r+0x77c>
    524c:	000cc683          	lbu	a3,0(s9)
    5250:	d75ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5254:	000cc683          	lbu	a3,0(s9)
    5258:	020ded93          	or	s11,s11,32
    525c:	d69ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5260:	00800613          	li	a2,8
    5264:	00000593          	li	a1,0
    5268:	05010513          	add	a0,sp,80
    526c:	db1fb0ef          	jal	101c <memset>
    5270:	00100513          	li	a0,1
    5274:	00ad8db3          	add	s11,s11,a0
    5278:	ce9ff06f          	j	4f60 <_vfiprintf_r+0x11c>
    527c:	00050d13          	mv	s10,a0
    5280:	419d87b3          	sub	a5,s11,s9
    5284:	079d8263          	beq	s11,s9,52e8 <_vfiprintf_r+0x4a4>
    5288:	06812683          	lw	a3,104(sp)
    528c:	06412703          	lw	a4,100(sp)
    5290:	019c2023          	sw	s9,0(s8)
    5294:	00d786b3          	add	a3,a5,a3
    5298:	00170713          	add	a4,a4,1
    529c:	00fc2223          	sw	a5,4(s8)
    52a0:	06d12423          	sw	a3,104(sp)
    52a4:	06e12223          	sw	a4,100(sp)
    52a8:	00700613          	li	a2,7
    52ac:	008c0c13          	add	s8,s8,8
    52b0:	02e65463          	bge	a2,a4,52d8 <_vfiprintf_r+0x494>
    52b4:	38068ce3          	beqz	a3,5e4c <_vfiprintf_r+0x1008>
    52b8:	06010613          	add	a2,sp,96
    52bc:	00098593          	mv	a1,s3
    52c0:	00040513          	mv	a0,s0
    52c4:	00f12823          	sw	a5,16(sp)
    52c8:	a41ff0ef          	jal	4d08 <__sprint_r.part.0>
    52cc:	01012783          	lw	a5,16(sp)
    52d0:	04051c63          	bnez	a0,5328 <_vfiprintf_r+0x4e4>
    52d4:	000a0c13          	mv	s8,s4
    52d8:	00c12703          	lw	a4,12(sp)
    52dc:	00f707b3          	add	a5,a4,a5
    52e0:	00f12623          	sw	a5,12(sp)
    52e4:	cc0d10e3          	bnez	s10,4fa4 <_vfiprintf_r+0x160>
    52e8:	06812783          	lw	a5,104(sp)
    52ec:	00078463          	beqz	a5,52f4 <_vfiprintf_r+0x4b0>
    52f0:	22c0106f          	j	651c <_vfiprintf_r+0x16d8>
    52f4:	00c99783          	lh	a5,12(s3)
    52f8:	06012223          	sw	zero,100(sp)
    52fc:	0300006f          	j	532c <_vfiprintf_r+0x4e8>
    5300:	06010613          	add	a2,sp,96
    5304:	00098593          	mv	a1,s3
    5308:	00040513          	mv	a0,s0
    530c:	9fdff0ef          	jal	4d08 <__sprint_r.part.0>
    5310:	e8050ae3          	beqz	a0,51a4 <_vfiprintf_r+0x360>
    5314:	01012783          	lw	a5,16(sp)
    5318:	00078863          	beqz	a5,5328 <_vfiprintf_r+0x4e4>
    531c:	01012583          	lw	a1,16(sp)
    5320:	00040513          	mv	a0,s0
    5324:	948fc0ef          	jal	146c <_free_r>
    5328:	00c99783          	lh	a5,12(s3)
    532c:	0649a703          	lw	a4,100(s3)
    5330:	00177713          	and	a4,a4,1
    5334:	16070a63          	beqz	a4,54a8 <_vfiprintf_r+0x664>
    5338:	0407f793          	and	a5,a5,64
    533c:	14412483          	lw	s1,324(sp)
    5340:	14012903          	lw	s2,320(sp)
    5344:	13812a03          	lw	s4,312(sp)
    5348:	13012b03          	lw	s6,304(sp)
    534c:	12c12b83          	lw	s7,300(sp)
    5350:	12412c83          	lw	s9,292(sp)
    5354:	12012d03          	lw	s10,288(sp)
    5358:	11c12d83          	lw	s11,284(sp)
    535c:	00078463          	beqz	a5,5364 <_vfiprintf_r+0x520>
    5360:	2180106f          	j	6578 <_vfiprintf_r+0x1734>
    5364:	14c12083          	lw	ra,332(sp)
    5368:	14812403          	lw	s0,328(sp)
    536c:	00c12503          	lw	a0,12(sp)
    5370:	13c12983          	lw	s3,316(sp)
    5374:	13412a83          	lw	s5,308(sp)
    5378:	12812c03          	lw	s8,296(sp)
    537c:	15010113          	add	sp,sp,336
    5380:	00008067          	ret
    5384:	06012223          	sw	zero,100(sp)
    5388:	004e7e13          	and	t3,t3,4
    538c:	240e0ee3          	beqz	t3,5de8 <_vfiprintf_r+0xfa4>
    5390:	41d88db3          	sub	s11,a7,t4
    5394:	25b05ae3          	blez	s11,5de8 <_vfiprintf_r+0xfa4>
    5398:	000a0c13          	mv	s8,s4
    539c:	01000713          	li	a4,16
    53a0:	06412683          	lw	a3,100(sp)
    53a4:	01b74463          	blt	a4,s11,53ac <_vfiprintf_r+0x568>
    53a8:	1900106f          	j	6538 <_vfiprintf_r+0x16f4>
    53ac:	000a8713          	mv	a4,s5
    53b0:	0000a317          	auipc	t1,0xa
    53b4:	46030313          	add	t1,t1,1120 # f810 <blanks.1>
    53b8:	000c0593          	mv	a1,s8
    53bc:	000d8a93          	mv	s5,s11
    53c0:	01000813          	li	a6,16
    53c4:	00700d13          	li	s10,7
    53c8:	01112c23          	sw	a7,24(sp)
    53cc:	01d12e23          	sw	t4,28(sp)
    53d0:	00030c13          	mv	s8,t1
    53d4:	00070d93          	mv	s11,a4
    53d8:	0180006f          	j	53f0 <_vfiprintf_r+0x5ac>
    53dc:	00268613          	add	a2,a3,2
    53e0:	00858593          	add	a1,a1,8
    53e4:	00070693          	mv	a3,a4
    53e8:	ff0a8a93          	add	s5,s5,-16
    53ec:	05585a63          	bge	a6,s5,5440 <_vfiprintf_r+0x5fc>
    53f0:	01078793          	add	a5,a5,16
    53f4:	00168713          	add	a4,a3,1
    53f8:	0185a023          	sw	s8,0(a1)
    53fc:	0105a223          	sw	a6,4(a1)
    5400:	06f12423          	sw	a5,104(sp)
    5404:	06e12223          	sw	a4,100(sp)
    5408:	fced5ae3          	bge	s10,a4,53dc <_vfiprintf_r+0x598>
    540c:	56078663          	beqz	a5,5978 <_vfiprintf_r+0xb34>
    5410:	06010613          	add	a2,sp,96
    5414:	00098593          	mv	a1,s3
    5418:	00040513          	mv	a0,s0
    541c:	8edff0ef          	jal	4d08 <__sprint_r.part.0>
    5420:	ee051ae3          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5424:	06412683          	lw	a3,100(sp)
    5428:	01000813          	li	a6,16
    542c:	ff0a8a93          	add	s5,s5,-16
    5430:	06812783          	lw	a5,104(sp)
    5434:	000a0593          	mv	a1,s4
    5438:	00168613          	add	a2,a3,1
    543c:	fb584ae3          	blt	a6,s5,53f0 <_vfiprintf_r+0x5ac>
    5440:	01812883          	lw	a7,24(sp)
    5444:	01c12e83          	lw	t4,28(sp)
    5448:	000d8713          	mv	a4,s11
    544c:	000c0313          	mv	t1,s8
    5450:	000a8d93          	mv	s11,s5
    5454:	00058c13          	mv	s8,a1
    5458:	00070a93          	mv	s5,a4
    545c:	01b787b3          	add	a5,a5,s11
    5460:	006c2023          	sw	t1,0(s8)
    5464:	01bc2223          	sw	s11,4(s8)
    5468:	06f12423          	sw	a5,104(sp)
    546c:	06c12223          	sw	a2,100(sp)
    5470:	00700713          	li	a4,7
    5474:	d0c75ce3          	bge	a4,a2,518c <_vfiprintf_r+0x348>
    5478:	160788e3          	beqz	a5,5de8 <_vfiprintf_r+0xfa4>
    547c:	06010613          	add	a2,sp,96
    5480:	00098593          	mv	a1,s3
    5484:	00040513          	mv	a0,s0
    5488:	01d12e23          	sw	t4,28(sp)
    548c:	01112c23          	sw	a7,24(sp)
    5490:	879ff0ef          	jal	4d08 <__sprint_r.part.0>
    5494:	e80510e3          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5498:	06812783          	lw	a5,104(sp)
    549c:	01c12e83          	lw	t4,28(sp)
    54a0:	01812883          	lw	a7,24(sp)
    54a4:	ce9ff06f          	j	518c <_vfiprintf_r+0x348>
    54a8:	2007f713          	and	a4,a5,512
    54ac:	e80716e3          	bnez	a4,5338 <_vfiprintf_r+0x4f4>
    54b0:	0589a503          	lw	a0,88(s3)
    54b4:	b65fb0ef          	jal	1018 <__retarget_lock_release_recursive>
    54b8:	00c99783          	lh	a5,12(s3)
    54bc:	e7dff06f          	j	5338 <_vfiprintf_r+0x4f4>
    54c0:	000aa803          	lw	a6,0(s5)
    54c4:	040101a3          	sb	zero,67(sp)
    54c8:	000d8e13          	mv	t3,s11
    54cc:	004a8a93          	add	s5,s5,4
    54d0:	68080ae3          	beqz	a6,6364 <_vfiprintf_r+0x1520>
    54d4:	05300793          	li	a5,83
    54d8:	3cf68ce3          	beq	a3,a5,60b0 <_vfiprintf_r+0x126c>
    54dc:	010df793          	and	a5,s11,16
    54e0:	3c0798e3          	bnez	a5,60b0 <_vfiprintf_r+0x126c>
    54e4:	00075463          	bgez	a4,54ec <_vfiprintf_r+0x6a8>
    54e8:	7fd0006f          	j	64e4 <_vfiprintf_r+0x16a0>
    54ec:	00070613          	mv	a2,a4
    54f0:	00080513          	mv	a0,a6
    54f4:	00000593          	li	a1,0
    54f8:	03112223          	sw	a7,36(sp)
    54fc:	00e12e23          	sw	a4,28(sp)
    5500:	01012c23          	sw	a6,24(sp)
    5504:	03b12023          	sw	s11,32(sp)
    5508:	4e4020ef          	jal	79ec <memchr>
    550c:	00a12823          	sw	a0,16(sp)
    5510:	01812803          	lw	a6,24(sp)
    5514:	01c12703          	lw	a4,28(sp)
    5518:	02012e03          	lw	t3,32(sp)
    551c:	02412883          	lw	a7,36(sp)
    5520:	00051463          	bnez	a0,5528 <_vfiprintf_r+0x6e4>
    5524:	7990006f          	j	64bc <_vfiprintf_r+0x1678>
    5528:	41050d33          	sub	s10,a0,a6
    552c:	fffd4e93          	not	t4,s10
    5530:	41fede93          	sra	t4,t4,0x1f
    5534:	01dd7eb3          	and	t4,s10,t4
    5538:	00012823          	sw	zero,16(sp)
    553c:	6dd0006f          	j	6418 <_vfiprintf_r+0x15d4>
    5540:	04300793          	li	a5,67
    5544:	000d8e13          	mv	t3,s11
    5548:	004a8d93          	add	s11,s5,4
    554c:	00f68663          	beq	a3,a5,5558 <_vfiprintf_r+0x714>
    5550:	010e7793          	and	a5,t3,16
    5554:	280788e3          	beqz	a5,5fe4 <_vfiprintf_r+0x11a0>
    5558:	00800613          	li	a2,8
    555c:	00000593          	li	a1,0
    5560:	05810513          	add	a0,sp,88
    5564:	01112e23          	sw	a7,28(sp)
    5568:	01c12c23          	sw	t3,24(sp)
    556c:	ab1fb0ef          	jal	101c <memset>
    5570:	000aa603          	lw	a2,0(s5)
    5574:	0ac10593          	add	a1,sp,172
    5578:	05810693          	add	a3,sp,88
    557c:	00040513          	mv	a0,s0
    5580:	00b12823          	sw	a1,16(sp)
    5584:	694050ef          	jal	ac18 <_wcrtomb_r>
    5588:	fff00793          	li	a5,-1
    558c:	01012583          	lw	a1,16(sp)
    5590:	01812e03          	lw	t3,24(sp)
    5594:	01c12883          	lw	a7,28(sp)
    5598:	00050d13          	mv	s10,a0
    559c:	00f51463          	bne	a0,a5,55a4 <_vfiprintf_r+0x760>
    55a0:	0200106f          	j	65c0 <_vfiprintf_r+0x177c>
    55a4:	fff54e93          	not	t4,a0
    55a8:	41fede93          	sra	t4,t4,0x1f
    55ac:	01d57eb3          	and	t4,a0,t4
    55b0:	040101a3          	sb	zero,67(sp)
    55b4:	000d8a93          	mv	s5,s11
    55b8:	00058813          	mv	a6,a1
    55bc:	a79ff06f          	j	5034 <_vfiprintf_r+0x1f0>
    55c0:	411008b3          	neg	a7,a7
    55c4:	000cc683          	lbu	a3,0(s9)
    55c8:	004ded93          	or	s11,s11,4
    55cc:	9f9ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    55d0:	010dee13          	or	t3,s11,16
    55d4:	020e7793          	and	a5,t3,32
    55d8:	0c0788e3          	beqz	a5,5ea8 <_vfiprintf_r+0x1064>
    55dc:	007a8a93          	add	s5,s5,7
    55e0:	ff8afa93          	and	s5,s5,-8
    55e4:	004aa683          	lw	a3,4(s5)
    55e8:	000aad83          	lw	s11,0(s5)
    55ec:	008a8a93          	add	s5,s5,8
    55f0:	00068d13          	mv	s10,a3
    55f4:	3006c263          	bltz	a3,58f8 <_vfiprintf_r+0xab4>
    55f8:	32074063          	bltz	a4,5918 <_vfiprintf_r+0xad4>
    55fc:	01ade6b3          	or	a3,s11,s10
    5600:	f7fe7e13          	and	t3,t3,-129
    5604:	30069a63          	bnez	a3,5918 <_vfiprintf_r+0xad4>
    5608:	68071ae3          	bnez	a4,649c <_vfiprintf_r+0x1658>
    560c:	04314783          	lbu	a5,67(sp)
    5610:	00012823          	sw	zero,16(sp)
    5614:	00000e93          	li	t4,0
    5618:	00000d13          	li	s10,0
    561c:	11010813          	add	a6,sp,272
    5620:	00078463          	beqz	a5,5628 <_vfiprintf_r+0x7e4>
    5624:	001e8e93          	add	t4,t4,1
    5628:	002e7f93          	and	t6,t3,2
    562c:	a00f8ae3          	beqz	t6,5040 <_vfiprintf_r+0x1fc>
    5630:	002e8e93          	add	t4,t4,2
    5634:	00200f93          	li	t6,2
    5638:	a09ff06f          	j	5040 <_vfiprintf_r+0x1fc>
    563c:	000cc683          	lbu	a3,0(s9)
    5640:	06800793          	li	a5,104
    5644:	4ef686e3          	beq	a3,a5,6330 <_vfiprintf_r+0x14ec>
    5648:	040ded93          	or	s11,s11,64
    564c:	979ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5650:	010de613          	or	a2,s11,16
    5654:	02067793          	and	a5,a2,32
    5658:	000780e3          	beqz	a5,5e58 <_vfiprintf_r+0x1014>
    565c:	007a8a93          	add	s5,s5,7
    5660:	ff8afa93          	and	s5,s5,-8
    5664:	000aad83          	lw	s11,0(s5)
    5668:	004aad03          	lw	s10,4(s5)
    566c:	008a8a93          	add	s5,s5,8
    5670:	040101a3          	sb	zero,67(sp)
    5674:	00060e13          	mv	t3,a2
    5678:	2a074063          	bltz	a4,5918 <_vfiprintf_r+0xad4>
    567c:	01ade6b3          	or	a3,s11,s10
    5680:	f7f67e13          	and	t3,a2,-129
    5684:	28069a63          	bnez	a3,5918 <_vfiprintf_r+0xad4>
    5688:	00100793          	li	a5,1
    568c:	06071e63          	bnez	a4,5708 <_vfiprintf_r+0x8c4>
    5690:	f6079ee3          	bnez	a5,560c <_vfiprintf_r+0x7c8>
    5694:	00167d13          	and	s10,a2,1
    5698:	0a0d0ce3          	beqz	s10,5f50 <_vfiprintf_r+0x110c>
    569c:	03000793          	li	a5,48
    56a0:	10f107a3          	sb	a5,271(sp)
    56a4:	000d0e93          	mv	t4,s10
    56a8:	10f10813          	add	a6,sp,271
    56ac:	2980006f          	j	5944 <_vfiprintf_r+0xb00>
    56b0:	02b00793          	li	a5,43
    56b4:	000cc683          	lbu	a3,0(s9)
    56b8:	04f101a3          	sb	a5,67(sp)
    56bc:	909ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    56c0:	010de693          	or	a3,s11,16
    56c4:	0206f793          	and	a5,a3,32
    56c8:	7a078c63          	beqz	a5,5e80 <_vfiprintf_r+0x103c>
    56cc:	007a8a93          	add	s5,s5,7
    56d0:	ff8afa93          	and	s5,s5,-8
    56d4:	000aa783          	lw	a5,0(s5)
    56d8:	004aa583          	lw	a1,4(s5)
    56dc:	008a8a93          	add	s5,s5,8
    56e0:	040101a3          	sb	zero,67(sp)
    56e4:	bff6fe13          	and	t3,a3,-1025
    56e8:	02074c63          	bltz	a4,5720 <_vfiprintf_r+0x8dc>
    56ec:	00b7e633          	or	a2,a5,a1
    56f0:	b7f6f693          	and	a3,a3,-1153
    56f4:	420610e3          	bnez	a2,6314 <_vfiprintf_r+0x14d0>
    56f8:	000e0613          	mv	a2,t3
    56fc:	00000793          	li	a5,0
    5700:	00068e13          	mv	t3,a3
    5704:	f80706e3          	beqz	a4,5690 <_vfiprintf_r+0x84c>
    5708:	00100693          	li	a3,1
    570c:	58d788e3          	beq	a5,a3,649c <_vfiprintf_r+0x1658>
    5710:	00200693          	li	a3,2
    5714:	46d786e3          	beq	a5,a3,6380 <_vfiprintf_r+0x153c>
    5718:	00000793          	li	a5,0
    571c:	00000593          	li	a1,0
    5720:	11010813          	add	a6,sp,272
    5724:	01d59613          	sll	a2,a1,0x1d
    5728:	0077f693          	and	a3,a5,7
    572c:	0037d793          	srl	a5,a5,0x3
    5730:	03068693          	add	a3,a3,48
    5734:	00f667b3          	or	a5,a2,a5
    5738:	0035d593          	srl	a1,a1,0x3
    573c:	fed80fa3          	sb	a3,-1(a6)
    5740:	00b7e633          	or	a2,a5,a1
    5744:	00080513          	mv	a0,a6
    5748:	fff80813          	add	a6,a6,-1
    574c:	fc061ce3          	bnez	a2,5724 <_vfiprintf_r+0x8e0>
    5750:	001e7793          	and	a5,t3,1
    5754:	54078e63          	beqz	a5,5cb0 <_vfiprintf_r+0xe6c>
    5758:	03000793          	li	a5,48
    575c:	54f68a63          	beq	a3,a5,5cb0 <_vfiprintf_r+0xe6c>
    5760:	ffe50513          	add	a0,a0,-2
    5764:	fef80fa3          	sb	a5,-1(a6)
    5768:	11010793          	add	a5,sp,272
    576c:	40a78d33          	sub	s10,a5,a0
    5770:	00070e93          	mv	t4,a4
    5774:	09a744e3          	blt	a4,s10,5ffc <_vfiprintf_r+0x11b8>
    5778:	00050813          	mv	a6,a0
    577c:	1c80006f          	j	5944 <_vfiprintf_r+0xb00>
    5780:	000086b7          	lui	a3,0x8
    5784:	83068693          	add	a3,a3,-2000 # 7830 <__fputwc+0x70>
    5788:	04d11223          	sh	a3,68(sp)
    578c:	0000a697          	auipc	a3,0xa
    5790:	a0068693          	add	a3,a3,-1536 # f18c <__fini_array_end+0x1cc>
    5794:	000aa783          	lw	a5,0(s5)
    5798:	00000593          	li	a1,0
    579c:	002dee13          	or	t3,s11,2
    57a0:	004a8a93          	add	s5,s5,4
    57a4:	00d12a23          	sw	a3,20(sp)
    57a8:	040101a3          	sb	zero,67(sp)
    57ac:	4c074863          	bltz	a4,5c7c <_vfiprintf_r+0xe38>
    57b0:	00b7e6b3          	or	a3,a5,a1
    57b4:	f7fe7513          	and	a0,t3,-129
    57b8:	4a069c63          	bnez	a3,5c70 <_vfiprintf_r+0xe2c>
    57bc:	000e0613          	mv	a2,t3
    57c0:	00200793          	li	a5,2
    57c4:	00050e13          	mv	t3,a0
    57c8:	ec5ff06f          	j	568c <_vfiprintf_r+0x848>
    57cc:	00040513          	mv	a0,s0
    57d0:	00e12c23          	sw	a4,24(sp)
    57d4:	01112823          	sw	a7,16(sp)
    57d8:	390020ef          	jal	7b68 <_localeconv_r>
    57dc:	00452783          	lw	a5,4(a0)
    57e0:	00078513          	mv	a0,a5
    57e4:	02f12a23          	sw	a5,52(sp)
    57e8:	ab5fb0ef          	jal	129c <strlen>
    57ec:	00050793          	mv	a5,a0
    57f0:	00040513          	mv	a0,s0
    57f4:	02f12823          	sw	a5,48(sp)
    57f8:	370020ef          	jal	7b68 <_localeconv_r>
    57fc:	00852703          	lw	a4,8(a0)
    5800:	03012783          	lw	a5,48(sp)
    5804:	01012883          	lw	a7,16(sp)
    5808:	02e12623          	sw	a4,44(sp)
    580c:	01812703          	lw	a4,24(sp)
    5810:	a2078ee3          	beqz	a5,524c <_vfiprintf_r+0x408>
    5814:	02c12783          	lw	a5,44(sp)
    5818:	000cc683          	lbu	a3,0(s9)
    581c:	fa078463          	beqz	a5,4fc4 <_vfiprintf_r+0x180>
    5820:	0007c783          	lbu	a5,0(a5)
    5824:	fa078063          	beqz	a5,4fc4 <_vfiprintf_r+0x180>
    5828:	400ded93          	or	s11,s11,1024
    582c:	f98ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5830:	020df793          	and	a5,s11,32
    5834:	78079263          	bnez	a5,5fb8 <_vfiprintf_r+0x1174>
    5838:	010df793          	and	a5,s11,16
    583c:	30079ae3          	bnez	a5,6350 <_vfiprintf_r+0x150c>
    5840:	040df793          	and	a5,s11,64
    5844:	400796e3          	bnez	a5,6450 <_vfiprintf_r+0x160c>
    5848:	200dfe13          	and	t3,s11,512
    584c:	300e02e3          	beqz	t3,6350 <_vfiprintf_r+0x150c>
    5850:	000aa783          	lw	a5,0(s5)
    5854:	00c12703          	lw	a4,12(sp)
    5858:	004a8a93          	add	s5,s5,4
    585c:	00e78023          	sb	a4,0(a5)
    5860:	efcff06f          	j	4f5c <_vfiprintf_r+0x118>
    5864:	000cc683          	lbu	a3,0(s9)
    5868:	06c00793          	li	a5,108
    586c:	2cf68ae3          	beq	a3,a5,6340 <_vfiprintf_r+0x14fc>
    5870:	010ded93          	or	s11,s11,16
    5874:	f50ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5878:	000cc683          	lbu	a3,0(s9)
    587c:	080ded93          	or	s11,s11,128
    5880:	f44ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    5884:	000cc683          	lbu	a3,0(s9)
    5888:	02a00793          	li	a5,42
    588c:	001c8593          	add	a1,s9,1
    5890:	54f680e3          	beq	a3,a5,65d0 <_vfiprintf_r+0x178c>
    5894:	fd068793          	add	a5,a3,-48
    5898:	00900613          	li	a2,9
    589c:	00000713          	li	a4,0
    58a0:	00900513          	li	a0,9
    58a4:	02f66463          	bltu	a2,a5,58cc <_vfiprintf_r+0xa88>
    58a8:	0005c683          	lbu	a3,0(a1)
    58ac:	00271613          	sll	a2,a4,0x2
    58b0:	00e60733          	add	a4,a2,a4
    58b4:	00171713          	sll	a4,a4,0x1
    58b8:	00f70733          	add	a4,a4,a5
    58bc:	fd068793          	add	a5,a3,-48
    58c0:	00158593          	add	a1,a1,1
    58c4:	fef572e3          	bgeu	a0,a5,58a8 <_vfiprintf_r+0xa64>
    58c8:	74074063          	bltz	a4,6008 <_vfiprintf_r+0x11c4>
    58cc:	00058c93          	mv	s9,a1
    58d0:	ef8ff06f          	j	4fc8 <_vfiprintf_r+0x184>
    58d4:	000cc683          	lbu	a3,0(s9)
    58d8:	001ded93          	or	s11,s11,1
    58dc:	ee8ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    58e0:	04314783          	lbu	a5,67(sp)
    58e4:	000cc683          	lbu	a3,0(s9)
    58e8:	ec079e63          	bnez	a5,4fc4 <_vfiprintf_r+0x180>
    58ec:	02000793          	li	a5,32
    58f0:	04f101a3          	sb	a5,67(sp)
    58f4:	ed0ff06f          	j	4fc4 <_vfiprintf_r+0x180>
    58f8:	02d00613          	li	a2,45
    58fc:	01b036b3          	snez	a3,s11
    5900:	41a000b3          	neg	ra,s10
    5904:	04c101a3          	sb	a2,67(sp)
    5908:	40d08d33          	sub	s10,ra,a3
    590c:	41b00db3          	neg	s11,s11
    5910:	00074463          	bltz	a4,5918 <_vfiprintf_r+0xad4>
    5914:	f7fe7e13          	and	t3,t3,-129
    5918:	120d14e3          	bnez	s10,6240 <_vfiprintf_r+0x13fc>
    591c:	00900693          	li	a3,9
    5920:	13b6e0e3          	bltu	a3,s11,6240 <_vfiprintf_r+0x13fc>
    5924:	030d8793          	add	a5,s11,48
    5928:	0ff7f793          	zext.b	a5,a5
    592c:	10f107a3          	sb	a5,271(sp)
    5930:	00070e93          	mv	t4,a4
    5934:	00e04463          	bgtz	a4,593c <_vfiprintf_r+0xaf8>
    5938:	00100e93          	li	t4,1
    593c:	00100d13          	li	s10,1
    5940:	10f10813          	add	a6,sp,271
    5944:	04314783          	lbu	a5,67(sp)
    5948:	00012823          	sw	zero,16(sp)
    594c:	cc079ce3          	bnez	a5,5624 <_vfiprintf_r+0x7e0>
    5950:	cd9ff06f          	j	5628 <_vfiprintf_r+0x7e4>
    5954:	00100713          	li	a4,1
    5958:	000d0793          	mv	a5,s10
    595c:	07012623          	sw	a6,108(sp)
    5960:	07a12823          	sw	s10,112(sp)
    5964:	07a12423          	sw	s10,104(sp)
    5968:	06e12223          	sw	a4,100(sp)
    596c:	000a0c13          	mv	s8,s4
    5970:	008c0c13          	add	s8,s8,8
    5974:	809ff06f          	j	517c <_vfiprintf_r+0x338>
    5978:	00100613          	li	a2,1
    597c:	00000693          	li	a3,0
    5980:	000a0593          	mv	a1,s4
    5984:	a65ff06f          	j	53e8 <_vfiprintf_r+0x5a4>
    5988:	41d88db3          	sub	s11,a7,t4
    598c:	f9b05a63          	blez	s11,5120 <_vfiprintf_r+0x2dc>
    5990:	01000593          	li	a1,16
    5994:	3bb5dae3          	bge	a1,s11,6548 <_vfiprintf_r+0x1704>
    5998:	0000af97          	auipc	t6,0xa
    599c:	e68f8f93          	add	t6,t6,-408 # f800 <zeroes.0>
    59a0:	02e12223          	sw	a4,36(sp)
    59a4:	000a8713          	mv	a4,s5
    59a8:	000c0693          	mv	a3,s8
    59ac:	000d8a93          	mv	s5,s11
    59b0:	01000f13          	li	t5,16
    59b4:	00700293          	li	t0,7
    59b8:	01c12c23          	sw	t3,24(sp)
    59bc:	01012e23          	sw	a6,28(sp)
    59c0:	03112023          	sw	a7,32(sp)
    59c4:	03d12423          	sw	t4,40(sp)
    59c8:	000f8c13          	mv	s8,t6
    59cc:	00070d93          	mv	s11,a4
    59d0:	0180006f          	j	59e8 <_vfiprintf_r+0xba4>
    59d4:	00260513          	add	a0,a2,2
    59d8:	00868693          	add	a3,a3,8
    59dc:	00070613          	mv	a2,a4
    59e0:	ff0a8a93          	add	s5,s5,-16
    59e4:	055f5c63          	bge	t5,s5,5a3c <_vfiprintf_r+0xbf8>
    59e8:	01078793          	add	a5,a5,16
    59ec:	00160713          	add	a4,a2,1
    59f0:	0186a023          	sw	s8,0(a3)
    59f4:	01e6a223          	sw	t5,4(a3)
    59f8:	06f12423          	sw	a5,104(sp)
    59fc:	06e12223          	sw	a4,100(sp)
    5a00:	fce2dae3          	bge	t0,a4,59d4 <_vfiprintf_r+0xb90>
    5a04:	1c078663          	beqz	a5,5bd0 <_vfiprintf_r+0xd8c>
    5a08:	06010613          	add	a2,sp,96
    5a0c:	00098593          	mv	a1,s3
    5a10:	00040513          	mv	a0,s0
    5a14:	af4ff0ef          	jal	4d08 <__sprint_r.part.0>
    5a18:	8e051ee3          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5a1c:	06412603          	lw	a2,100(sp)
    5a20:	01000f13          	li	t5,16
    5a24:	ff0a8a93          	add	s5,s5,-16
    5a28:	06812783          	lw	a5,104(sp)
    5a2c:	000a0693          	mv	a3,s4
    5a30:	00160513          	add	a0,a2,1
    5a34:	00700293          	li	t0,7
    5a38:	fb5f48e3          	blt	t5,s5,59e8 <_vfiprintf_r+0xba4>
    5a3c:	01812e03          	lw	t3,24(sp)
    5a40:	01c12803          	lw	a6,28(sp)
    5a44:	02012883          	lw	a7,32(sp)
    5a48:	02412703          	lw	a4,36(sp)
    5a4c:	02812e83          	lw	t4,40(sp)
    5a50:	000d8613          	mv	a2,s11
    5a54:	000c0f93          	mv	t6,s8
    5a58:	000a8d93          	mv	s11,s5
    5a5c:	00068c13          	mv	s8,a3
    5a60:	00060a93          	mv	s5,a2
    5a64:	01b787b3          	add	a5,a5,s11
    5a68:	01fc2023          	sw	t6,0(s8)
    5a6c:	01bc2223          	sw	s11,4(s8)
    5a70:	06f12423          	sw	a5,104(sp)
    5a74:	06a12223          	sw	a0,100(sp)
    5a78:	00700613          	li	a2,7
    5a7c:	4ea65863          	bge	a2,a0,5f6c <_vfiprintf_r+0x1128>
    5a80:	1a0786e3          	beqz	a5,642c <_vfiprintf_r+0x15e8>
    5a84:	06010613          	add	a2,sp,96
    5a88:	00098593          	mv	a1,s3
    5a8c:	00040513          	mv	a0,s0
    5a90:	03d12423          	sw	t4,40(sp)
    5a94:	02e12223          	sw	a4,36(sp)
    5a98:	03112023          	sw	a7,32(sp)
    5a9c:	01012e23          	sw	a6,28(sp)
    5aa0:	01c12c23          	sw	t3,24(sp)
    5aa4:	a64ff0ef          	jal	4d08 <__sprint_r.part.0>
    5aa8:	860516e3          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5aac:	02412703          	lw	a4,36(sp)
    5ab0:	06412603          	lw	a2,100(sp)
    5ab4:	06812783          	lw	a5,104(sp)
    5ab8:	41a70733          	sub	a4,a4,s10
    5abc:	02812e83          	lw	t4,40(sp)
    5ac0:	02012883          	lw	a7,32(sp)
    5ac4:	01c12803          	lw	a6,28(sp)
    5ac8:	01812e03          	lw	t3,24(sp)
    5acc:	000a0c13          	mv	s8,s4
    5ad0:	00160f13          	add	t5,a2,1
    5ad4:	e4e05a63          	blez	a4,5128 <_vfiprintf_r+0x2e4>
    5ad8:	01000593          	li	a1,16
    5adc:	0000af97          	auipc	t6,0xa
    5ae0:	d24f8f93          	add	t6,t6,-732 # f800 <zeroes.0>
    5ae4:	0ae5da63          	bge	a1,a4,5b98 <_vfiprintf_r+0xd54>
    5ae8:	000c0593          	mv	a1,s8
    5aec:	03512423          	sw	s5,40(sp)
    5af0:	01000d93          	li	s11,16
    5af4:	00700293          	li	t0,7
    5af8:	01c12c23          	sw	t3,24(sp)
    5afc:	01012e23          	sw	a6,28(sp)
    5b00:	03112023          	sw	a7,32(sp)
    5b04:	03d12223          	sw	t4,36(sp)
    5b08:	00070a93          	mv	s5,a4
    5b0c:	000b0c13          	mv	s8,s6
    5b10:	0180006f          	j	5b28 <_vfiprintf_r+0xce4>
    5b14:	00260f13          	add	t5,a2,2
    5b18:	00858593          	add	a1,a1,8
    5b1c:	00068613          	mv	a2,a3
    5b20:	ff0a8a93          	add	s5,s5,-16
    5b24:	055dda63          	bge	s11,s5,5b78 <_vfiprintf_r+0xd34>
    5b28:	01078793          	add	a5,a5,16
    5b2c:	00160693          	add	a3,a2,1
    5b30:	0165a023          	sw	s6,0(a1)
    5b34:	01b5a223          	sw	s11,4(a1)
    5b38:	06f12423          	sw	a5,104(sp)
    5b3c:	06d12223          	sw	a3,100(sp)
    5b40:	fcd2dae3          	bge	t0,a3,5b14 <_vfiprintf_r+0xcd0>
    5b44:	06078e63          	beqz	a5,5bc0 <_vfiprintf_r+0xd7c>
    5b48:	06010613          	add	a2,sp,96
    5b4c:	00098593          	mv	a1,s3
    5b50:	00040513          	mv	a0,s0
    5b54:	9b4ff0ef          	jal	4d08 <__sprint_r.part.0>
    5b58:	fa051e63          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5b5c:	06412603          	lw	a2,100(sp)
    5b60:	ff0a8a93          	add	s5,s5,-16
    5b64:	06812783          	lw	a5,104(sp)
    5b68:	000a0593          	mv	a1,s4
    5b6c:	00160f13          	add	t5,a2,1
    5b70:	00700293          	li	t0,7
    5b74:	fb5dcae3          	blt	s11,s5,5b28 <_vfiprintf_r+0xce4>
    5b78:	000a8713          	mv	a4,s5
    5b7c:	01812e03          	lw	t3,24(sp)
    5b80:	01c12803          	lw	a6,28(sp)
    5b84:	02012883          	lw	a7,32(sp)
    5b88:	02412e83          	lw	t4,36(sp)
    5b8c:	02812a83          	lw	s5,40(sp)
    5b90:	000c0f93          	mv	t6,s8
    5b94:	00058c13          	mv	s8,a1
    5b98:	00e787b3          	add	a5,a5,a4
    5b9c:	00ec2223          	sw	a4,4(s8)
    5ba0:	01fc2023          	sw	t6,0(s8)
    5ba4:	06f12423          	sw	a5,104(sp)
    5ba8:	07e12223          	sw	t5,100(sp)
    5bac:	00700713          	li	a4,7
    5bb0:	25e74863          	blt	a4,t5,5e00 <_vfiprintf_r+0xfbc>
    5bb4:	008c0c13          	add	s8,s8,8
    5bb8:	001f0f13          	add	t5,t5,1
    5bbc:	d6cff06f          	j	5128 <_vfiprintf_r+0x2e4>
    5bc0:	00100f13          	li	t5,1
    5bc4:	00000613          	li	a2,0
    5bc8:	000a0593          	mv	a1,s4
    5bcc:	f55ff06f          	j	5b20 <_vfiprintf_r+0xcdc>
    5bd0:	00100513          	li	a0,1
    5bd4:	00000613          	li	a2,0
    5bd8:	000a0693          	mv	a3,s4
    5bdc:	e05ff06f          	j	59e0 <_vfiprintf_r+0xb9c>
    5be0:	06078263          	beqz	a5,5c44 <_vfiprintf_r+0xe00>
    5be4:	06010613          	add	a2,sp,96
    5be8:	00098593          	mv	a1,s3
    5bec:	00040513          	mv	a0,s0
    5bf0:	03d12e23          	sw	t4,60(sp)
    5bf4:	02e12c23          	sw	a4,56(sp)
    5bf8:	03112423          	sw	a7,40(sp)
    5bfc:	03012223          	sw	a6,36(sp)
    5c00:	02512023          	sw	t0,32(sp)
    5c04:	01f12e23          	sw	t6,28(sp)
    5c08:	01c12c23          	sw	t3,24(sp)
    5c0c:	8fcff0ef          	jal	4d08 <__sprint_r.part.0>
    5c10:	f0051263          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5c14:	06412603          	lw	a2,100(sp)
    5c18:	06812783          	lw	a5,104(sp)
    5c1c:	03c12e83          	lw	t4,60(sp)
    5c20:	03812703          	lw	a4,56(sp)
    5c24:	02812883          	lw	a7,40(sp)
    5c28:	02412803          	lw	a6,36(sp)
    5c2c:	02012283          	lw	t0,32(sp)
    5c30:	01c12f83          	lw	t6,28(sp)
    5c34:	01812e03          	lw	t3,24(sp)
    5c38:	000a0c13          	mv	s8,s4
    5c3c:	00160f13          	add	t5,a2,1
    5c40:	c58ff06f          	j	5098 <_vfiprintf_r+0x254>
    5c44:	380f8863          	beqz	t6,5fd4 <_vfiprintf_r+0x1190>
    5c48:	04410793          	add	a5,sp,68
    5c4c:	06f12623          	sw	a5,108(sp)
    5c50:	00200793          	li	a5,2
    5c54:	06f12823          	sw	a5,112(sp)
    5c58:	00100f13          	li	t5,1
    5c5c:	000a0c13          	mv	s8,s4
    5c60:	000f0613          	mv	a2,t5
    5c64:	008c0c13          	add	s8,s8,8
    5c68:	001f0f13          	add	t5,t5,1
    5c6c:	cacff06f          	j	5118 <_vfiprintf_r+0x2d4>
    5c70:	00200693          	li	a3,2
    5c74:	00050e13          	mv	t3,a0
    5c78:	aa0684e3          	beqz	a3,5720 <_vfiprintf_r+0x8dc>
    5c7c:	01412503          	lw	a0,20(sp)
    5c80:	11010813          	add	a6,sp,272
    5c84:	00f7f693          	and	a3,a5,15
    5c88:	00d506b3          	add	a3,a0,a3
    5c8c:	0006c603          	lbu	a2,0(a3)
    5c90:	0047d793          	srl	a5,a5,0x4
    5c94:	01c59693          	sll	a3,a1,0x1c
    5c98:	00f6e7b3          	or	a5,a3,a5
    5c9c:	0045d593          	srl	a1,a1,0x4
    5ca0:	fec80fa3          	sb	a2,-1(a6)
    5ca4:	00b7e6b3          	or	a3,a5,a1
    5ca8:	fff80813          	add	a6,a6,-1
    5cac:	fc069ce3          	bnez	a3,5c84 <_vfiprintf_r+0xe40>
    5cb0:	11010793          	add	a5,sp,272
    5cb4:	41078d33          	sub	s10,a5,a6
    5cb8:	00070e93          	mv	t4,a4
    5cbc:	c9a754e3          	bge	a4,s10,5944 <_vfiprintf_r+0xb00>
    5cc0:	000d0e93          	mv	t4,s10
    5cc4:	c81ff06f          	j	5944 <_vfiprintf_r+0xb00>
    5cc8:	01000513          	li	a0,16
    5ccc:	01b554e3          	bge	a0,s11,64d4 <_vfiprintf_r+0x1690>
    5cd0:	000a8693          	mv	a3,s5
    5cd4:	0000a317          	auipc	t1,0xa
    5cd8:	b3c30313          	add	t1,t1,-1220 # f810 <blanks.1>
    5cdc:	02e12c23          	sw	a4,56(sp)
    5ce0:	000d8a93          	mv	s5,s11
    5ce4:	000c0713          	mv	a4,s8
    5ce8:	01000f13          	li	t5,16
    5cec:	00700393          	li	t2,7
    5cf0:	01c12c23          	sw	t3,24(sp)
    5cf4:	01f12e23          	sw	t6,28(sp)
    5cf8:	02512023          	sw	t0,32(sp)
    5cfc:	03012223          	sw	a6,36(sp)
    5d00:	03112423          	sw	a7,40(sp)
    5d04:	03d12e23          	sw	t4,60(sp)
    5d08:	00030c13          	mv	s8,t1
    5d0c:	00068d93          	mv	s11,a3
    5d10:	01c0006f          	j	5d2c <_vfiprintf_r+0xee8>
    5d14:	00260513          	add	a0,a2,2
    5d18:	00870713          	add	a4,a4,8
    5d1c:	00058613          	mv	a2,a1
    5d20:	ff0a8a93          	add	s5,s5,-16
    5d24:	055f5c63          	bge	t5,s5,5d7c <_vfiprintf_r+0xf38>
    5d28:	00160593          	add	a1,a2,1
    5d2c:	01078793          	add	a5,a5,16
    5d30:	01872023          	sw	s8,0(a4)
    5d34:	01e72223          	sw	t5,4(a4)
    5d38:	06f12423          	sw	a5,104(sp)
    5d3c:	06b12223          	sw	a1,100(sp)
    5d40:	fcb3dae3          	bge	t2,a1,5d14 <_vfiprintf_r+0xed0>
    5d44:	08078a63          	beqz	a5,5dd8 <_vfiprintf_r+0xf94>
    5d48:	06010613          	add	a2,sp,96
    5d4c:	00098593          	mv	a1,s3
    5d50:	00040513          	mv	a0,s0
    5d54:	fb5fe0ef          	jal	4d08 <__sprint_r.part.0>
    5d58:	da051e63          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5d5c:	06412603          	lw	a2,100(sp)
    5d60:	01000f13          	li	t5,16
    5d64:	ff0a8a93          	add	s5,s5,-16
    5d68:	06812783          	lw	a5,104(sp)
    5d6c:	000a0713          	mv	a4,s4
    5d70:	00160513          	add	a0,a2,1
    5d74:	00700393          	li	t2,7
    5d78:	fb5f48e3          	blt	t5,s5,5d28 <_vfiprintf_r+0xee4>
    5d7c:	000c0313          	mv	t1,s8
    5d80:	01812e03          	lw	t3,24(sp)
    5d84:	00070c13          	mv	s8,a4
    5d88:	01c12f83          	lw	t6,28(sp)
    5d8c:	02012283          	lw	t0,32(sp)
    5d90:	02412803          	lw	a6,36(sp)
    5d94:	02812883          	lw	a7,40(sp)
    5d98:	03c12e83          	lw	t4,60(sp)
    5d9c:	03812703          	lw	a4,56(sp)
    5da0:	000d8693          	mv	a3,s11
    5da4:	000a8d93          	mv	s11,s5
    5da8:	00068a93          	mv	s5,a3
    5dac:	01b787b3          	add	a5,a5,s11
    5db0:	006c2023          	sw	t1,0(s8)
    5db4:	01bc2223          	sw	s11,4(s8)
    5db8:	06f12423          	sw	a5,104(sp)
    5dbc:	06a12223          	sw	a0,100(sp)
    5dc0:	00700613          	li	a2,7
    5dc4:	12a64063          	blt	a2,a0,5ee4 <_vfiprintf_r+0x10a0>
    5dc8:	008c0c13          	add	s8,s8,8
    5dcc:	00150f13          	add	t5,a0,1
    5dd0:	00050613          	mv	a2,a0
    5dd4:	a8cff06f          	j	5060 <_vfiprintf_r+0x21c>
    5dd8:	00000613          	li	a2,0
    5ddc:	00100513          	li	a0,1
    5de0:	000a0713          	mv	a4,s4
    5de4:	f3dff06f          	j	5d20 <_vfiprintf_r+0xedc>
    5de8:	01d8d463          	bge	a7,t4,5df0 <_vfiprintf_r+0xfac>
    5dec:	000e8893          	mv	a7,t4
    5df0:	00c12783          	lw	a5,12(sp)
    5df4:	011787b3          	add	a5,a5,a7
    5df8:	00f12623          	sw	a5,12(sp)
    5dfc:	ba8ff06f          	j	51a4 <_vfiprintf_r+0x360>
    5e00:	b4078ae3          	beqz	a5,5954 <_vfiprintf_r+0xb10>
    5e04:	06010613          	add	a2,sp,96
    5e08:	00098593          	mv	a1,s3
    5e0c:	00040513          	mv	a0,s0
    5e10:	03d12223          	sw	t4,36(sp)
    5e14:	03112023          	sw	a7,32(sp)
    5e18:	01012e23          	sw	a6,28(sp)
    5e1c:	01c12c23          	sw	t3,24(sp)
    5e20:	ee9fe0ef          	jal	4d08 <__sprint_r.part.0>
    5e24:	ce051863          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5e28:	06412f03          	lw	t5,100(sp)
    5e2c:	06812783          	lw	a5,104(sp)
    5e30:	02412e83          	lw	t4,36(sp)
    5e34:	02012883          	lw	a7,32(sp)
    5e38:	01c12803          	lw	a6,28(sp)
    5e3c:	01812e03          	lw	t3,24(sp)
    5e40:	000a0c13          	mv	s8,s4
    5e44:	001f0f13          	add	t5,t5,1
    5e48:	ae0ff06f          	j	5128 <_vfiprintf_r+0x2e4>
    5e4c:	06012223          	sw	zero,100(sp)
    5e50:	000a0c13          	mv	s8,s4
    5e54:	c84ff06f          	j	52d8 <_vfiprintf_r+0x494>
    5e58:	01067693          	and	a3,a2,16
    5e5c:	000aa783          	lw	a5,0(s5)
    5e60:	004a8a93          	add	s5,s5,4
    5e64:	12069c63          	bnez	a3,5f9c <_vfiprintf_r+0x1158>
    5e68:	04067693          	and	a3,a2,64
    5e6c:	12068463          	beqz	a3,5f94 <_vfiprintf_r+0x1150>
    5e70:	01079d93          	sll	s11,a5,0x10
    5e74:	010ddd93          	srl	s11,s11,0x10
    5e78:	00000d13          	li	s10,0
    5e7c:	ff4ff06f          	j	5670 <_vfiprintf_r+0x82c>
    5e80:	0106f613          	and	a2,a3,16
    5e84:	000aa783          	lw	a5,0(s5)
    5e88:	004a8a93          	add	s5,s5,4
    5e8c:	12061263          	bnez	a2,5fb0 <_vfiprintf_r+0x116c>
    5e90:	0406f613          	and	a2,a3,64
    5e94:	10060a63          	beqz	a2,5fa8 <_vfiprintf_r+0x1164>
    5e98:	01079793          	sll	a5,a5,0x10
    5e9c:	0107d793          	srl	a5,a5,0x10
    5ea0:	00000593          	li	a1,0
    5ea4:	83dff06f          	j	56e0 <_vfiprintf_r+0x89c>
    5ea8:	010e7693          	and	a3,t3,16
    5eac:	000aa783          	lw	a5,0(s5)
    5eb0:	004a8a93          	add	s5,s5,4
    5eb4:	0c069863          	bnez	a3,5f84 <_vfiprintf_r+0x1140>
    5eb8:	040e7693          	and	a3,t3,64
    5ebc:	0c068063          	beqz	a3,5f7c <_vfiprintf_r+0x1138>
    5ec0:	01079d93          	sll	s11,a5,0x10
    5ec4:	410ddd93          	sra	s11,s11,0x10
    5ec8:	41fddd13          	sra	s10,s11,0x1f
    5ecc:	000d0693          	mv	a3,s10
    5ed0:	f24ff06f          	j	55f4 <_vfiprintf_r+0x7b0>
    5ed4:	00100f13          	li	t5,1
    5ed8:	00000613          	li	a2,0
    5edc:	000a0c13          	mv	s8,s4
    5ee0:	a38ff06f          	j	5118 <_vfiprintf_r+0x2d4>
    5ee4:	1a078463          	beqz	a5,608c <_vfiprintf_r+0x1248>
    5ee8:	06010613          	add	a2,sp,96
    5eec:	00098593          	mv	a1,s3
    5ef0:	00040513          	mv	a0,s0
    5ef4:	03d12e23          	sw	t4,60(sp)
    5ef8:	02e12c23          	sw	a4,56(sp)
    5efc:	03112423          	sw	a7,40(sp)
    5f00:	03012223          	sw	a6,36(sp)
    5f04:	02512023          	sw	t0,32(sp)
    5f08:	01f12e23          	sw	t6,28(sp)
    5f0c:	01c12c23          	sw	t3,24(sp)
    5f10:	df9fe0ef          	jal	4d08 <__sprint_r.part.0>
    5f14:	c0051063          	bnez	a0,5314 <_vfiprintf_r+0x4d0>
    5f18:	06412603          	lw	a2,100(sp)
    5f1c:	06812783          	lw	a5,104(sp)
    5f20:	03c12e83          	lw	t4,60(sp)
    5f24:	03812703          	lw	a4,56(sp)
    5f28:	02812883          	lw	a7,40(sp)
    5f2c:	02412803          	lw	a6,36(sp)
    5f30:	02012283          	lw	t0,32(sp)
    5f34:	01c12f83          	lw	t6,28(sp)
    5f38:	01812e03          	lw	t3,24(sp)
    5f3c:	000a0c13          	mv	s8,s4
    5f40:	00160f13          	add	t5,a2,1
    5f44:	91cff06f          	j	5060 <_vfiprintf_r+0x21c>
    5f48:	000d8e13          	mv	t3,s11
    5f4c:	e88ff06f          	j	55d4 <_vfiprintf_r+0x790>
    5f50:	00000e93          	li	t4,0
    5f54:	11010813          	add	a6,sp,272
    5f58:	9edff06f          	j	5944 <_vfiprintf_r+0xb00>
    5f5c:	0589a503          	lw	a0,88(s3)
    5f60:	8b4fb0ef          	jal	1014 <__retarget_lock_acquire_recursive>
    5f64:	00c99783          	lh	a5,12(s3)
    5f68:	f41fe06f          	j	4ea8 <_vfiprintf_r+0x64>
    5f6c:	008c0c13          	add	s8,s8,8
    5f70:	00150f13          	add	t5,a0,1
    5f74:	00050613          	mv	a2,a0
    5f78:	9a8ff06f          	j	5120 <_vfiprintf_r+0x2dc>
    5f7c:	200e7693          	and	a3,t3,512
    5f80:	50069463          	bnez	a3,6488 <_vfiprintf_r+0x1644>
    5f84:	41f7dd13          	sra	s10,a5,0x1f
    5f88:	00078d93          	mv	s11,a5
    5f8c:	000d0693          	mv	a3,s10
    5f90:	e64ff06f          	j	55f4 <_vfiprintf_r+0x7b0>
    5f94:	20067693          	and	a3,a2,512
    5f98:	4c069663          	bnez	a3,6464 <_vfiprintf_r+0x1620>
    5f9c:	00078d93          	mv	s11,a5
    5fa0:	00000d13          	li	s10,0
    5fa4:	eccff06f          	j	5670 <_vfiprintf_r+0x82c>
    5fa8:	2006f613          	and	a2,a3,512
    5fac:	4c061863          	bnez	a2,647c <_vfiprintf_r+0x1638>
    5fb0:	00000593          	li	a1,0
    5fb4:	f2cff06f          	j	56e0 <_vfiprintf_r+0x89c>
    5fb8:	00c12683          	lw	a3,12(sp)
    5fbc:	000aa783          	lw	a5,0(s5)
    5fc0:	004a8a93          	add	s5,s5,4
    5fc4:	41f6d713          	sra	a4,a3,0x1f
    5fc8:	00d7a023          	sw	a3,0(a5)
    5fcc:	00e7a223          	sw	a4,4(a5)
    5fd0:	f8dfe06f          	j	4f5c <_vfiprintf_r+0x118>
    5fd4:	00000613          	li	a2,0
    5fd8:	00100f13          	li	t5,1
    5fdc:	000a0c13          	mv	s8,s4
    5fe0:	938ff06f          	j	5118 <_vfiprintf_r+0x2d4>
    5fe4:	000aa783          	lw	a5,0(s5)
    5fe8:	00100e93          	li	t4,1
    5fec:	00100d13          	li	s10,1
    5ff0:	0af10623          	sb	a5,172(sp)
    5ff4:	0ac10593          	add	a1,sp,172
    5ff8:	db8ff06f          	j	55b0 <_vfiprintf_r+0x76c>
    5ffc:	000d0e93          	mv	t4,s10
    6000:	00050813          	mv	a6,a0
    6004:	941ff06f          	j	5944 <_vfiprintf_r+0xb00>
    6008:	fff00713          	li	a4,-1
    600c:	00058c93          	mv	s9,a1
    6010:	fb9fe06f          	j	4fc8 <_vfiprintf_r+0x184>
    6014:	000d8613          	mv	a2,s11
    6018:	e3cff06f          	j	5654 <_vfiprintf_r+0x810>
    601c:	00009797          	auipc	a5,0x9
    6020:	18478793          	add	a5,a5,388 # f1a0 <__fini_array_end+0x1e0>
    6024:	000d8e13          	mv	t3,s11
    6028:	00f12a23          	sw	a5,20(sp)
    602c:	020e7793          	and	a5,t3,32
    6030:	1c078c63          	beqz	a5,6208 <_vfiprintf_r+0x13c4>
    6034:	007a8a93          	add	s5,s5,7
    6038:	ff8afa93          	and	s5,s5,-8
    603c:	000aa783          	lw	a5,0(s5)
    6040:	004aa583          	lw	a1,4(s5)
    6044:	008a8a93          	add	s5,s5,8
    6048:	001e7613          	and	a2,t3,1
    604c:	00060e63          	beqz	a2,6068 <_vfiprintf_r+0x1224>
    6050:	00b7e633          	or	a2,a5,a1
    6054:	00060a63          	beqz	a2,6068 <_vfiprintf_r+0x1224>
    6058:	03000613          	li	a2,48
    605c:	04c10223          	sb	a2,68(sp)
    6060:	04d102a3          	sb	a3,69(sp)
    6064:	002e6e13          	or	t3,t3,2
    6068:	bffe7e13          	and	t3,t3,-1025
    606c:	f3cff06f          	j	57a8 <_vfiprintf_r+0x964>
    6070:	000d8693          	mv	a3,s11
    6074:	e50ff06f          	j	56c4 <_vfiprintf_r+0x880>
    6078:	00009797          	auipc	a5,0x9
    607c:	11478793          	add	a5,a5,276 # f18c <__fini_array_end+0x1cc>
    6080:	000d8e13          	mv	t3,s11
    6084:	00f12a23          	sw	a5,20(sp)
    6088:	fa5ff06f          	j	602c <_vfiprintf_r+0x11e8>
    608c:	04314603          	lbu	a2,67(sp)
    6090:	3a060a63          	beqz	a2,6444 <_vfiprintf_r+0x1600>
    6094:	04310793          	add	a5,sp,67
    6098:	06f12623          	sw	a5,108(sp)
    609c:	00100793          	li	a5,1
    60a0:	06f12823          	sw	a5,112(sp)
    60a4:	00100f13          	li	t5,1
    60a8:	000a0c13          	mv	s8,s4
    60ac:	fe1fe06f          	j	508c <_vfiprintf_r+0x248>
    60b0:	00800613          	li	a2,8
    60b4:	00000593          	li	a1,0
    60b8:	05810513          	add	a0,sp,88
    60bc:	02e12023          	sw	a4,32(sp)
    60c0:	01112e23          	sw	a7,28(sp)
    60c4:	01c12c23          	sw	t3,24(sp)
    60c8:	05012623          	sw	a6,76(sp)
    60cc:	01012823          	sw	a6,16(sp)
    60d0:	f4dfa0ef          	jal	101c <memset>
    60d4:	02012703          	lw	a4,32(sp)
    60d8:	01012803          	lw	a6,16(sp)
    60dc:	01812e03          	lw	t3,24(sp)
    60e0:	01c12883          	lw	a7,28(sp)
    60e4:	2a074463          	bltz	a4,638c <_vfiprintf_r+0x1548>
    60e8:	00000d93          	li	s11,0
    60ec:	00000d13          	li	s10,0
    60f0:	01812823          	sw	s8,16(sp)
    60f4:	01012e23          	sw	a6,28(sp)
    60f8:	000d8c13          	mv	s8,s11
    60fc:	03112023          	sw	a7,32(sp)
    6100:	000c8d93          	mv	s11,s9
    6104:	000a8c93          	mv	s9,s5
    6108:	000d0a93          	mv	s5,s10
    610c:	00098d13          	mv	s10,s3
    6110:	00070993          	mv	s3,a4
    6114:	0300006f          	j	6144 <_vfiprintf_r+0x1300>
    6118:	05810693          	add	a3,sp,88
    611c:	0ac10593          	add	a1,sp,172
    6120:	00040513          	mv	a0,s0
    6124:	2f5040ef          	jal	ac18 <_wcrtomb_r>
    6128:	fff00793          	li	a5,-1
    612c:	48f50063          	beq	a0,a5,65ac <_vfiprintf_r+0x1768>
    6130:	00aa87b3          	add	a5,s5,a0
    6134:	02f9c063          	blt	s3,a5,6154 <_vfiprintf_r+0x1310>
    6138:	004c0c13          	add	s8,s8,4
    613c:	45378463          	beq	a5,s3,6584 <_vfiprintf_r+0x1740>
    6140:	00078a93          	mv	s5,a5
    6144:	04c12783          	lw	a5,76(sp)
    6148:	018787b3          	add	a5,a5,s8
    614c:	0007a603          	lw	a2,0(a5)
    6150:	fc0614e3          	bnez	a2,6118 <_vfiprintf_r+0x12d4>
    6154:	01012c03          	lw	s8,16(sp)
    6158:	01812e03          	lw	t3,24(sp)
    615c:	01c12803          	lw	a6,28(sp)
    6160:	02012883          	lw	a7,32(sp)
    6164:	000d0993          	mv	s3,s10
    6168:	000a8d13          	mv	s10,s5
    616c:	000c8a93          	mv	s5,s9
    6170:	000d8c93          	mv	s9,s11
    6174:	280d0e63          	beqz	s10,6410 <_vfiprintf_r+0x15cc>
    6178:	06300793          	li	a5,99
    617c:	33a7d463          	bge	a5,s10,64a4 <_vfiprintf_r+0x1660>
    6180:	001d0593          	add	a1,s10,1
    6184:	00040513          	mv	a0,s0
    6188:	01112c23          	sw	a7,24(sp)
    618c:	01c12823          	sw	t3,16(sp)
    6190:	de8fb0ef          	jal	1778 <_malloc_r>
    6194:	01012e03          	lw	t3,16(sp)
    6198:	01812883          	lw	a7,24(sp)
    619c:	00050813          	mv	a6,a0
    61a0:	42050063          	beqz	a0,65c0 <_vfiprintf_r+0x177c>
    61a4:	00a12823          	sw	a0,16(sp)
    61a8:	00800613          	li	a2,8
    61ac:	00000593          	li	a1,0
    61b0:	05810513          	add	a0,sp,88
    61b4:	03112023          	sw	a7,32(sp)
    61b8:	01c12e23          	sw	t3,28(sp)
    61bc:	01012c23          	sw	a6,24(sp)
    61c0:	e5dfa0ef          	jal	101c <memset>
    61c4:	01812803          	lw	a6,24(sp)
    61c8:	05810713          	add	a4,sp,88
    61cc:	000d0693          	mv	a3,s10
    61d0:	00080593          	mv	a1,a6
    61d4:	04c10613          	add	a2,sp,76
    61d8:	00040513          	mv	a0,s0
    61dc:	2c9040ef          	jal	aca4 <_wcsrtombs_r>
    61e0:	01812803          	lw	a6,24(sp)
    61e4:	01c12e03          	lw	t3,28(sp)
    61e8:	02012883          	lw	a7,32(sp)
    61ec:	40ad1063          	bne	s10,a0,65ec <_vfiprintf_r+0x17a8>
    61f0:	fffd4e93          	not	t4,s10
    61f4:	01a807b3          	add	a5,a6,s10
    61f8:	41fede93          	sra	t4,t4,0x1f
    61fc:	00078023          	sb	zero,0(a5)
    6200:	01dd7eb3          	and	t4,s10,t4
    6204:	2140006f          	j	6418 <_vfiprintf_r+0x15d4>
    6208:	010e7613          	and	a2,t3,16
    620c:	000aa783          	lw	a5,0(s5)
    6210:	004a8a93          	add	s5,s5,4
    6214:	02061263          	bnez	a2,6238 <_vfiprintf_r+0x13f4>
    6218:	040e7613          	and	a2,t3,64
    621c:	00060a63          	beqz	a2,6230 <_vfiprintf_r+0x13ec>
    6220:	01079793          	sll	a5,a5,0x10
    6224:	0107d793          	srl	a5,a5,0x10
    6228:	00000593          	li	a1,0
    622c:	e1dff06f          	j	6048 <_vfiprintf_r+0x1204>
    6230:	200e7613          	and	a2,t3,512
    6234:	22061e63          	bnez	a2,6470 <_vfiprintf_r+0x162c>
    6238:	00000593          	li	a1,0
    623c:	e0dff06f          	j	6048 <_vfiprintf_r+0x1204>
    6240:	400e7793          	and	a5,t3,1024
    6244:	00000693          	li	a3,0
    6248:	11010e93          	add	t4,sp,272
    624c:	01812823          	sw	s8,16(sp)
    6250:	02812223          	sw	s0,36(sp)
    6254:	03912c23          	sw	s9,56(sp)
    6258:	03512e23          	sw	s5,60(sp)
    625c:	02c12c83          	lw	s9,44(sp)
    6260:	01c12c23          	sw	t3,24(sp)
    6264:	01112e23          	sw	a7,28(sp)
    6268:	02e12023          	sw	a4,32(sp)
    626c:	00078c13          	mv	s8,a5
    6270:	00068413          	mv	s0,a3
    6274:	03312423          	sw	s3,40(sp)
    6278:	000e8a93          	mv	s5,t4
    627c:	0280006f          	j	62a4 <_vfiprintf_r+0x1460>
    6280:	00a00613          	li	a2,10
    6284:	00000693          	li	a3,0
    6288:	000d8513          	mv	a0,s11
    628c:	000d0593          	mv	a1,s10
    6290:	364050ef          	jal	b5f4 <__udivdi3>
    6294:	220d0a63          	beqz	s10,64c8 <_vfiprintf_r+0x1684>
    6298:	00050d93          	mv	s11,a0
    629c:	00058d13          	mv	s10,a1
    62a0:	00098a93          	mv	s5,s3
    62a4:	00a00613          	li	a2,10
    62a8:	00000693          	li	a3,0
    62ac:	000d8513          	mv	a0,s11
    62b0:	000d0593          	mv	a1,s10
    62b4:	1ed050ef          	jal	bca0 <__umoddi3>
    62b8:	03050513          	add	a0,a0,48
    62bc:	feaa8fa3          	sb	a0,-1(s5)
    62c0:	fffa8993          	add	s3,s5,-1
    62c4:	00140413          	add	s0,s0,1
    62c8:	fa0c0ce3          	beqz	s8,6280 <_vfiprintf_r+0x143c>
    62cc:	000cc783          	lbu	a5,0(s9)
    62d0:	fa8798e3          	bne	a5,s0,6280 <_vfiprintf_r+0x143c>
    62d4:	0ff00793          	li	a5,255
    62d8:	faf404e3          	beq	s0,a5,6280 <_vfiprintf_r+0x143c>
    62dc:	0e0d1a63          	bnez	s10,63d0 <_vfiprintf_r+0x158c>
    62e0:	00900793          	li	a5,9
    62e4:	0fb7e663          	bltu	a5,s11,63d0 <_vfiprintf_r+0x158c>
    62e8:	00098813          	mv	a6,s3
    62ec:	03912623          	sw	s9,44(sp)
    62f0:	01012c03          	lw	s8,16(sp)
    62f4:	01812e03          	lw	t3,24(sp)
    62f8:	01c12883          	lw	a7,28(sp)
    62fc:	02012703          	lw	a4,32(sp)
    6300:	02412403          	lw	s0,36(sp)
    6304:	02812983          	lw	s3,40(sp)
    6308:	03812c83          	lw	s9,56(sp)
    630c:	03c12a83          	lw	s5,60(sp)
    6310:	9a1ff06f          	j	5cb0 <_vfiprintf_r+0xe6c>
    6314:	00068e13          	mv	t3,a3
    6318:	00000693          	li	a3,0
    631c:	c0068263          	beqz	a3,5720 <_vfiprintf_r+0x8dc>
    6320:	95dff06f          	j	5c7c <_vfiprintf_r+0xe38>
    6324:	00040513          	mv	a0,s0
    6328:	115000ef          	jal	6c3c <__sinit>
    632c:	b61fe06f          	j	4e8c <_vfiprintf_r+0x48>
    6330:	001cc683          	lbu	a3,1(s9)
    6334:	200ded93          	or	s11,s11,512
    6338:	001c8c93          	add	s9,s9,1
    633c:	c89fe06f          	j	4fc4 <_vfiprintf_r+0x180>
    6340:	001cc683          	lbu	a3,1(s9)
    6344:	020ded93          	or	s11,s11,32
    6348:	001c8c93          	add	s9,s9,1
    634c:	c79fe06f          	j	4fc4 <_vfiprintf_r+0x180>
    6350:	000aa783          	lw	a5,0(s5)
    6354:	00c12703          	lw	a4,12(sp)
    6358:	004a8a93          	add	s5,s5,4
    635c:	00e7a023          	sw	a4,0(a5)
    6360:	bfdfe06f          	j	4f5c <_vfiprintf_r+0x118>
    6364:	00600793          	li	a5,6
    6368:	00070d13          	mv	s10,a4
    636c:	0ce7e863          	bltu	a5,a4,643c <_vfiprintf_r+0x15f8>
    6370:	000d0e93          	mv	t4,s10
    6374:	00009817          	auipc	a6,0x9
    6378:	e4080813          	add	a6,a6,-448 # f1b4 <__fini_array_end+0x1f4>
    637c:	cb9fe06f          	j	5034 <_vfiprintf_r+0x1f0>
    6380:	00000793          	li	a5,0
    6384:	00000593          	li	a1,0
    6388:	8f5ff06f          	j	5c7c <_vfiprintf_r+0xe38>
    638c:	05810713          	add	a4,sp,88
    6390:	00000693          	li	a3,0
    6394:	04c10613          	add	a2,sp,76
    6398:	00000593          	li	a1,0
    639c:	00040513          	mv	a0,s0
    63a0:	01112e23          	sw	a7,28(sp)
    63a4:	01012c23          	sw	a6,24(sp)
    63a8:	01c12823          	sw	t3,16(sp)
    63ac:	0f9040ef          	jal	aca4 <_wcsrtombs_r>
    63b0:	fff00793          	li	a5,-1
    63b4:	01012e03          	lw	t3,16(sp)
    63b8:	01812803          	lw	a6,24(sp)
    63bc:	01c12883          	lw	a7,28(sp)
    63c0:	00050d13          	mv	s10,a0
    63c4:	1ef50e63          	beq	a0,a5,65c0 <_vfiprintf_r+0x177c>
    63c8:	05012623          	sw	a6,76(sp)
    63cc:	da9ff06f          	j	6174 <_vfiprintf_r+0x1330>
    63d0:	03012783          	lw	a5,48(sp)
    63d4:	03412583          	lw	a1,52(sp)
    63d8:	00000413          	li	s0,0
    63dc:	40f989b3          	sub	s3,s3,a5
    63e0:	00078613          	mv	a2,a5
    63e4:	00098513          	mv	a0,s3
    63e8:	6c8010ef          	jal	7ab0 <strncpy>
    63ec:	001cc783          	lbu	a5,1(s9)
    63f0:	00a00613          	li	a2,10
    63f4:	00000693          	li	a3,0
    63f8:	00f037b3          	snez	a5,a5
    63fc:	000d8513          	mv	a0,s11
    6400:	000d0593          	mv	a1,s10
    6404:	00fc8cb3          	add	s9,s9,a5
    6408:	1ec050ef          	jal	b5f4 <__udivdi3>
    640c:	e8dff06f          	j	6298 <_vfiprintf_r+0x1454>
    6410:	00000e93          	li	t4,0
    6414:	00012823          	sw	zero,16(sp)
    6418:	04314783          	lbu	a5,67(sp)
    641c:	00000713          	li	a4,0
    6420:	00000f93          	li	t6,0
    6424:	a0079063          	bnez	a5,5624 <_vfiprintf_r+0x7e0>
    6428:	c19fe06f          	j	5040 <_vfiprintf_r+0x1fc>
    642c:	00100f13          	li	t5,1
    6430:	00000613          	li	a2,0
    6434:	000a0c13          	mv	s8,s4
    6438:	ce9fe06f          	j	5120 <_vfiprintf_r+0x2dc>
    643c:	00600d13          	li	s10,6
    6440:	f31ff06f          	j	6370 <_vfiprintf_r+0x152c>
    6444:	00100f13          	li	t5,1
    6448:	000a0c13          	mv	s8,s4
    644c:	c4dfe06f          	j	5098 <_vfiprintf_r+0x254>
    6450:	000aa783          	lw	a5,0(s5)
    6454:	00c12703          	lw	a4,12(sp)
    6458:	004a8a93          	add	s5,s5,4
    645c:	00e79023          	sh	a4,0(a5)
    6460:	afdfe06f          	j	4f5c <_vfiprintf_r+0x118>
    6464:	0ff7fd93          	zext.b	s11,a5
    6468:	00000d13          	li	s10,0
    646c:	a04ff06f          	j	5670 <_vfiprintf_r+0x82c>
    6470:	0ff7f793          	zext.b	a5,a5
    6474:	00000593          	li	a1,0
    6478:	bd1ff06f          	j	6048 <_vfiprintf_r+0x1204>
    647c:	0ff7f793          	zext.b	a5,a5
    6480:	00000593          	li	a1,0
    6484:	a5cff06f          	j	56e0 <_vfiprintf_r+0x89c>
    6488:	01879d93          	sll	s11,a5,0x18
    648c:	418ddd93          	sra	s11,s11,0x18
    6490:	41fddd13          	sra	s10,s11,0x1f
    6494:	000d0693          	mv	a3,s10
    6498:	95cff06f          	j	55f4 <_vfiprintf_r+0x7b0>
    649c:	03000793          	li	a5,48
    64a0:	c8cff06f          	j	592c <_vfiprintf_r+0xae8>
    64a4:	00012823          	sw	zero,16(sp)
    64a8:	0ac10813          	add	a6,sp,172
    64ac:	cfdff06f          	j	61a8 <_vfiprintf_r+0x1364>
    64b0:	0589a503          	lw	a0,88(s3)
    64b4:	b65fa0ef          	jal	1018 <__retarget_lock_release_recursive>
    64b8:	d51fe06f          	j	5208 <_vfiprintf_r+0x3c4>
    64bc:	00070e93          	mv	t4,a4
    64c0:	00070d13          	mv	s10,a4
    64c4:	f55ff06f          	j	6418 <_vfiprintf_r+0x15d4>
    64c8:	00900793          	li	a5,9
    64cc:	ddb7e6e3          	bltu	a5,s11,6298 <_vfiprintf_r+0x1454>
    64d0:	e19ff06f          	j	62e8 <_vfiprintf_r+0x14a4>
    64d4:	00058513          	mv	a0,a1
    64d8:	00009317          	auipc	t1,0x9
    64dc:	33830313          	add	t1,t1,824 # f810 <blanks.1>
    64e0:	8cdff06f          	j	5dac <_vfiprintf_r+0xf68>
    64e4:	00080513          	mv	a0,a6
    64e8:	03112023          	sw	a7,32(sp)
    64ec:	01012c23          	sw	a6,24(sp)
    64f0:	01b12e23          	sw	s11,28(sp)
    64f4:	da9fa0ef          	jal	129c <strlen>
    64f8:	fff54e93          	not	t4,a0
    64fc:	41fede93          	sra	t4,t4,0x1f
    6500:	01812803          	lw	a6,24(sp)
    6504:	01c12e03          	lw	t3,28(sp)
    6508:	02012883          	lw	a7,32(sp)
    650c:	00050d13          	mv	s10,a0
    6510:	01d57eb3          	and	t4,a0,t4
    6514:	00012823          	sw	zero,16(sp)
    6518:	f01ff06f          	j	6418 <_vfiprintf_r+0x15d4>
    651c:	06010613          	add	a2,sp,96
    6520:	00098593          	mv	a1,s3
    6524:	00040513          	mv	a0,s0
    6528:	fe0fe0ef          	jal	4d08 <__sprint_r.part.0>
    652c:	00051463          	bnez	a0,6534 <_vfiprintf_r+0x16f0>
    6530:	dc5fe06f          	j	52f4 <_vfiprintf_r+0x4b0>
    6534:	df5fe06f          	j	5328 <_vfiprintf_r+0x4e4>
    6538:	00168613          	add	a2,a3,1
    653c:	00009317          	auipc	t1,0x9
    6540:	2d430313          	add	t1,t1,724 # f810 <blanks.1>
    6544:	f19fe06f          	j	545c <_vfiprintf_r+0x618>
    6548:	000f0513          	mv	a0,t5
    654c:	00009f97          	auipc	t6,0x9
    6550:	2b4f8f93          	add	t6,t6,692 # f800 <zeroes.0>
    6554:	d10ff06f          	j	5a64 <_vfiprintf_r+0xc20>
    6558:	0649a783          	lw	a5,100(s3)
    655c:	0017f793          	and	a5,a5,1
    6560:	00079c63          	bnez	a5,6578 <_vfiprintf_r+0x1734>
    6564:	00c9d783          	lhu	a5,12(s3)
    6568:	2007f793          	and	a5,a5,512
    656c:	00079663          	bnez	a5,6578 <_vfiprintf_r+0x1734>
    6570:	0589a503          	lw	a0,88(s3)
    6574:	aa5fa0ef          	jal	1018 <__retarget_lock_release_recursive>
    6578:	fff00793          	li	a5,-1
    657c:	00f12623          	sw	a5,12(sp)
    6580:	de5fe06f          	j	5364 <_vfiprintf_r+0x520>
    6584:	00098713          	mv	a4,s3
    6588:	000c8a93          	mv	s5,s9
    658c:	000d0993          	mv	s3,s10
    6590:	01012c03          	lw	s8,16(sp)
    6594:	01812e03          	lw	t3,24(sp)
    6598:	01c12803          	lw	a6,28(sp)
    659c:	02012883          	lw	a7,32(sp)
    65a0:	000d8c93          	mv	s9,s11
    65a4:	00070d13          	mv	s10,a4
    65a8:	bcdff06f          	j	6174 <_vfiprintf_r+0x1330>
    65ac:	00cd1783          	lh	a5,12(s10)
    65b0:	000d0993          	mv	s3,s10
    65b4:	0407e793          	or	a5,a5,64
    65b8:	00fd1623          	sh	a5,12(s10)
    65bc:	d71fe06f          	j	532c <_vfiprintf_r+0x4e8>
    65c0:	00c99783          	lh	a5,12(s3)
    65c4:	0407e793          	or	a5,a5,64
    65c8:	00f99623          	sh	a5,12(s3)
    65cc:	d61fe06f          	j	532c <_vfiprintf_r+0x4e8>
    65d0:	000aa703          	lw	a4,0(s5)
    65d4:	004a8a93          	add	s5,s5,4
    65d8:	00075463          	bgez	a4,65e0 <_vfiprintf_r+0x179c>
    65dc:	fff00713          	li	a4,-1
    65e0:	001cc683          	lbu	a3,1(s9)
    65e4:	00058c93          	mv	s9,a1
    65e8:	9ddfe06f          	j	4fc4 <_vfiprintf_r+0x180>
    65ec:	00c9d783          	lhu	a5,12(s3)
    65f0:	0407e793          	or	a5,a5,64
    65f4:	00f99623          	sh	a5,12(s3)
    65f8:	d1dfe06f          	j	5314 <_vfiprintf_r+0x4d0>

000065fc <__sbprintf>:
    65fc:	b7010113          	add	sp,sp,-1168
    6600:	00c59783          	lh	a5,12(a1)
    6604:	00e5d703          	lhu	a4,14(a1)
    6608:	48812423          	sw	s0,1160(sp)
    660c:	00058413          	mv	s0,a1
    6610:	000105b7          	lui	a1,0x10
    6614:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x59d>
    6618:	06442303          	lw	t1,100(s0)
    661c:	01c42883          	lw	a7,28(s0)
    6620:	02442803          	lw	a6,36(s0)
    6624:	01071713          	sll	a4,a4,0x10
    6628:	00b7f7b3          	and	a5,a5,a1
    662c:	00e7e7b3          	or	a5,a5,a4
    6630:	40000593          	li	a1,1024
    6634:	49212023          	sw	s2,1152(sp)
    6638:	00f12a23          	sw	a5,20(sp)
    663c:	00050913          	mv	s2,a0
    6640:	07010793          	add	a5,sp,112
    6644:	06010513          	add	a0,sp,96
    6648:	48112623          	sw	ra,1164(sp)
    664c:	48912223          	sw	s1,1156(sp)
    6650:	47312e23          	sw	s3,1148(sp)
    6654:	00060493          	mv	s1,a2
    6658:	00068993          	mv	s3,a3
    665c:	06612623          	sw	t1,108(sp)
    6660:	03112223          	sw	a7,36(sp)
    6664:	03012623          	sw	a6,44(sp)
    6668:	00f12423          	sw	a5,8(sp)
    666c:	00f12c23          	sw	a5,24(sp)
    6670:	00b12823          	sw	a1,16(sp)
    6674:	00b12e23          	sw	a1,28(sp)
    6678:	02012023          	sw	zero,32(sp)
    667c:	991fa0ef          	jal	100c <__retarget_lock_init_recursive>
    6680:	00048613          	mv	a2,s1
    6684:	00098693          	mv	a3,s3
    6688:	00810593          	add	a1,sp,8
    668c:	00090513          	mv	a0,s2
    6690:	fb4fe0ef          	jal	4e44 <_vfiprintf_r>
    6694:	00050493          	mv	s1,a0
    6698:	04055263          	bgez	a0,66dc <__sbprintf+0xe0>
    669c:	01415783          	lhu	a5,20(sp)
    66a0:	0407f793          	and	a5,a5,64
    66a4:	00078863          	beqz	a5,66b4 <__sbprintf+0xb8>
    66a8:	00c45783          	lhu	a5,12(s0)
    66ac:	0407e793          	or	a5,a5,64
    66b0:	00f41623          	sh	a5,12(s0)
    66b4:	06012503          	lw	a0,96(sp)
    66b8:	959fa0ef          	jal	1010 <__retarget_lock_close_recursive>
    66bc:	48c12083          	lw	ra,1164(sp)
    66c0:	48812403          	lw	s0,1160(sp)
    66c4:	48012903          	lw	s2,1152(sp)
    66c8:	47c12983          	lw	s3,1148(sp)
    66cc:	00048513          	mv	a0,s1
    66d0:	48412483          	lw	s1,1156(sp)
    66d4:	49010113          	add	sp,sp,1168
    66d8:	00008067          	ret
    66dc:	00810593          	add	a1,sp,8
    66e0:	00090513          	mv	a0,s2
    66e4:	25c000ef          	jal	6940 <_fflush_r>
    66e8:	fa050ae3          	beqz	a0,669c <__sbprintf+0xa0>
    66ec:	fff00493          	li	s1,-1
    66f0:	fadff06f          	j	669c <__sbprintf+0xa0>

000066f4 <__sflush_r>:
    66f4:	00c59703          	lh	a4,12(a1)
    66f8:	fe010113          	add	sp,sp,-32
    66fc:	00812c23          	sw	s0,24(sp)
    6700:	01312623          	sw	s3,12(sp)
    6704:	00112e23          	sw	ra,28(sp)
    6708:	00877793          	and	a5,a4,8
    670c:	00058413          	mv	s0,a1
    6710:	00050993          	mv	s3,a0
    6714:	12079063          	bnez	a5,6834 <__sflush_r+0x140>
    6718:	000017b7          	lui	a5,0x1
    671c:	80078793          	add	a5,a5,-2048 # 800 <gemm_cfs_tiles.constprop.0+0x368>
    6720:	0045a683          	lw	a3,4(a1)
    6724:	00f767b3          	or	a5,a4,a5
    6728:	00f59623          	sh	a5,12(a1)
    672c:	18d05263          	blez	a3,68b0 <__sflush_r+0x1bc>
    6730:	02842803          	lw	a6,40(s0)
    6734:	0e080463          	beqz	a6,681c <__sflush_r+0x128>
    6738:	00912a23          	sw	s1,20(sp)
    673c:	01371693          	sll	a3,a4,0x13
    6740:	0009a483          	lw	s1,0(s3)
    6744:	0009a023          	sw	zero,0(s3)
    6748:	01c42583          	lw	a1,28(s0)
    674c:	1606ce63          	bltz	a3,68c8 <__sflush_r+0x1d4>
    6750:	00000613          	li	a2,0
    6754:	00100693          	li	a3,1
    6758:	00098513          	mv	a0,s3
    675c:	000800e7          	jalr	a6
    6760:	fff00793          	li	a5,-1
    6764:	00050613          	mv	a2,a0
    6768:	1af50463          	beq	a0,a5,6910 <__sflush_r+0x21c>
    676c:	00c41783          	lh	a5,12(s0)
    6770:	02842803          	lw	a6,40(s0)
    6774:	01c42583          	lw	a1,28(s0)
    6778:	0047f793          	and	a5,a5,4
    677c:	00078e63          	beqz	a5,6798 <__sflush_r+0xa4>
    6780:	00442703          	lw	a4,4(s0)
    6784:	03042783          	lw	a5,48(s0)
    6788:	40e60633          	sub	a2,a2,a4
    678c:	00078663          	beqz	a5,6798 <__sflush_r+0xa4>
    6790:	03c42783          	lw	a5,60(s0)
    6794:	40f60633          	sub	a2,a2,a5
    6798:	00000693          	li	a3,0
    679c:	00098513          	mv	a0,s3
    67a0:	000800e7          	jalr	a6
    67a4:	fff00793          	li	a5,-1
    67a8:	12f51463          	bne	a0,a5,68d0 <__sflush_r+0x1dc>
    67ac:	0009a683          	lw	a3,0(s3)
    67b0:	01d00793          	li	a5,29
    67b4:	00c41703          	lh	a4,12(s0)
    67b8:	16d7ea63          	bltu	a5,a3,692c <__sflush_r+0x238>
    67bc:	204007b7          	lui	a5,0x20400
    67c0:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    67c4:	00d7d7b3          	srl	a5,a5,a3
    67c8:	0017f793          	and	a5,a5,1
    67cc:	16078063          	beqz	a5,692c <__sflush_r+0x238>
    67d0:	01042603          	lw	a2,16(s0)
    67d4:	fffff7b7          	lui	a5,0xfffff
    67d8:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    67dc:	00f777b3          	and	a5,a4,a5
    67e0:	00f41623          	sh	a5,12(s0)
    67e4:	00042223          	sw	zero,4(s0)
    67e8:	00c42023          	sw	a2,0(s0)
    67ec:	01371793          	sll	a5,a4,0x13
    67f0:	0007d463          	bgez	a5,67f8 <__sflush_r+0x104>
    67f4:	10068263          	beqz	a3,68f8 <__sflush_r+0x204>
    67f8:	03042583          	lw	a1,48(s0)
    67fc:	0099a023          	sw	s1,0(s3)
    6800:	10058463          	beqz	a1,6908 <__sflush_r+0x214>
    6804:	04040793          	add	a5,s0,64
    6808:	00f58663          	beq	a1,a5,6814 <__sflush_r+0x120>
    680c:	00098513          	mv	a0,s3
    6810:	c5dfa0ef          	jal	146c <_free_r>
    6814:	01412483          	lw	s1,20(sp)
    6818:	02042823          	sw	zero,48(s0)
    681c:	00000513          	li	a0,0
    6820:	01c12083          	lw	ra,28(sp)
    6824:	01812403          	lw	s0,24(sp)
    6828:	00c12983          	lw	s3,12(sp)
    682c:	02010113          	add	sp,sp,32
    6830:	00008067          	ret
    6834:	01212823          	sw	s2,16(sp)
    6838:	0105a903          	lw	s2,16(a1)
    683c:	08090263          	beqz	s2,68c0 <__sflush_r+0x1cc>
    6840:	00912a23          	sw	s1,20(sp)
    6844:	0005a483          	lw	s1,0(a1)
    6848:	00377713          	and	a4,a4,3
    684c:	0125a023          	sw	s2,0(a1)
    6850:	412484b3          	sub	s1,s1,s2
    6854:	00000793          	li	a5,0
    6858:	00071463          	bnez	a4,6860 <__sflush_r+0x16c>
    685c:	0145a783          	lw	a5,20(a1)
    6860:	00f42423          	sw	a5,8(s0)
    6864:	00904863          	bgtz	s1,6874 <__sflush_r+0x180>
    6868:	0540006f          	j	68bc <__sflush_r+0x1c8>
    686c:	00a90933          	add	s2,s2,a0
    6870:	04905663          	blez	s1,68bc <__sflush_r+0x1c8>
    6874:	02442783          	lw	a5,36(s0)
    6878:	01c42583          	lw	a1,28(s0)
    687c:	00048693          	mv	a3,s1
    6880:	00090613          	mv	a2,s2
    6884:	00098513          	mv	a0,s3
    6888:	000780e7          	jalr	a5
    688c:	40a484b3          	sub	s1,s1,a0
    6890:	fca04ee3          	bgtz	a0,686c <__sflush_r+0x178>
    6894:	00c41703          	lh	a4,12(s0)
    6898:	01012903          	lw	s2,16(sp)
    689c:	04076713          	or	a4,a4,64
    68a0:	01412483          	lw	s1,20(sp)
    68a4:	00e41623          	sh	a4,12(s0)
    68a8:	fff00513          	li	a0,-1
    68ac:	f75ff06f          	j	6820 <__sflush_r+0x12c>
    68b0:	03c5a683          	lw	a3,60(a1)
    68b4:	e6d04ee3          	bgtz	a3,6730 <__sflush_r+0x3c>
    68b8:	f65ff06f          	j	681c <__sflush_r+0x128>
    68bc:	01412483          	lw	s1,20(sp)
    68c0:	01012903          	lw	s2,16(sp)
    68c4:	f59ff06f          	j	681c <__sflush_r+0x128>
    68c8:	05042603          	lw	a2,80(s0)
    68cc:	eadff06f          	j	6778 <__sflush_r+0x84>
    68d0:	00c41703          	lh	a4,12(s0)
    68d4:	01042683          	lw	a3,16(s0)
    68d8:	fffff7b7          	lui	a5,0xfffff
    68dc:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    68e0:	00f777b3          	and	a5,a4,a5
    68e4:	00f41623          	sh	a5,12(s0)
    68e8:	00042223          	sw	zero,4(s0)
    68ec:	00d42023          	sw	a3,0(s0)
    68f0:	01371793          	sll	a5,a4,0x13
    68f4:	f007d2e3          	bgez	a5,67f8 <__sflush_r+0x104>
    68f8:	03042583          	lw	a1,48(s0)
    68fc:	04a42823          	sw	a0,80(s0)
    6900:	0099a023          	sw	s1,0(s3)
    6904:	f00590e3          	bnez	a1,6804 <__sflush_r+0x110>
    6908:	01412483          	lw	s1,20(sp)
    690c:	f11ff06f          	j	681c <__sflush_r+0x128>
    6910:	0009a783          	lw	a5,0(s3)
    6914:	e4078ce3          	beqz	a5,676c <__sflush_r+0x78>
    6918:	01d00713          	li	a4,29
    691c:	00e78c63          	beq	a5,a4,6934 <__sflush_r+0x240>
    6920:	01600713          	li	a4,22
    6924:	00e78863          	beq	a5,a4,6934 <__sflush_r+0x240>
    6928:	00c41703          	lh	a4,12(s0)
    692c:	04076713          	or	a4,a4,64
    6930:	f71ff06f          	j	68a0 <__sflush_r+0x1ac>
    6934:	0099a023          	sw	s1,0(s3)
    6938:	01412483          	lw	s1,20(sp)
    693c:	ee1ff06f          	j	681c <__sflush_r+0x128>

00006940 <_fflush_r>:
    6940:	ff010113          	add	sp,sp,-16
    6944:	00812423          	sw	s0,8(sp)
    6948:	00912223          	sw	s1,4(sp)
    694c:	00112623          	sw	ra,12(sp)
    6950:	01212023          	sw	s2,0(sp)
    6954:	00050493          	mv	s1,a0
    6958:	00058413          	mv	s0,a1
    695c:	00050663          	beqz	a0,6968 <_fflush_r+0x28>
    6960:	03452783          	lw	a5,52(a0)
    6964:	0a078a63          	beqz	a5,6a18 <_fflush_r+0xd8>
    6968:	00c41783          	lh	a5,12(s0)
    696c:	00000913          	li	s2,0
    6970:	04078063          	beqz	a5,69b0 <_fflush_r+0x70>
    6974:	06442703          	lw	a4,100(s0)
    6978:	00177713          	and	a4,a4,1
    697c:	00071663          	bnez	a4,6988 <_fflush_r+0x48>
    6980:	2007f793          	and	a5,a5,512
    6984:	04078463          	beqz	a5,69cc <_fflush_r+0x8c>
    6988:	00040593          	mv	a1,s0
    698c:	00048513          	mv	a0,s1
    6990:	d65ff0ef          	jal	66f4 <__sflush_r>
    6994:	06442783          	lw	a5,100(s0)
    6998:	00050913          	mv	s2,a0
    699c:	0017f793          	and	a5,a5,1
    69a0:	00079863          	bnez	a5,69b0 <_fflush_r+0x70>
    69a4:	00c45783          	lhu	a5,12(s0)
    69a8:	2007f793          	and	a5,a5,512
    69ac:	04078463          	beqz	a5,69f4 <_fflush_r+0xb4>
    69b0:	00c12083          	lw	ra,12(sp)
    69b4:	00812403          	lw	s0,8(sp)
    69b8:	00412483          	lw	s1,4(sp)
    69bc:	00090513          	mv	a0,s2
    69c0:	00012903          	lw	s2,0(sp)
    69c4:	01010113          	add	sp,sp,16
    69c8:	00008067          	ret
    69cc:	05842503          	lw	a0,88(s0)
    69d0:	e44fa0ef          	jal	1014 <__retarget_lock_acquire_recursive>
    69d4:	00040593          	mv	a1,s0
    69d8:	00048513          	mv	a0,s1
    69dc:	d19ff0ef          	jal	66f4 <__sflush_r>
    69e0:	06442783          	lw	a5,100(s0)
    69e4:	00050913          	mv	s2,a0
    69e8:	0017f793          	and	a5,a5,1
    69ec:	fc0792e3          	bnez	a5,69b0 <_fflush_r+0x70>
    69f0:	fb5ff06f          	j	69a4 <_fflush_r+0x64>
    69f4:	05842503          	lw	a0,88(s0)
    69f8:	e20fa0ef          	jal	1018 <__retarget_lock_release_recursive>
    69fc:	00c12083          	lw	ra,12(sp)
    6a00:	00812403          	lw	s0,8(sp)
    6a04:	00412483          	lw	s1,4(sp)
    6a08:	00090513          	mv	a0,s2
    6a0c:	00012903          	lw	s2,0(sp)
    6a10:	01010113          	add	sp,sp,16
    6a14:	00008067          	ret
    6a18:	224000ef          	jal	6c3c <__sinit>
    6a1c:	f4dff06f          	j	6968 <_fflush_r+0x28>

00006a20 <stdio_exit_handler>:
    6a20:	7fffa617          	auipc	a2,0x7fffa
    6a24:	b0860613          	add	a2,a2,-1272 # 80000528 <__sglue>
    6a28:	00004597          	auipc	a1,0x4
    6a2c:	28c58593          	add	a1,a1,652 # acb4 <_fclose_r>
    6a30:	7fff9517          	auipc	a0,0x7fff9
    6a34:	5d050513          	add	a0,a0,1488 # 80000000 <_impure_data>
    6a38:	7a00006f          	j	71d8 <_fwalk_sglue>

00006a3c <cleanup_stdio>:
    6a3c:	00452583          	lw	a1,4(a0)
    6a40:	ff010113          	add	sp,sp,-16
    6a44:	00812423          	sw	s0,8(sp)
    6a48:	00112623          	sw	ra,12(sp)
    6a4c:	8001a797          	auipc	a5,0x8001a
    6a50:	51478793          	add	a5,a5,1300 # 80020f60 <__sf>
    6a54:	00050413          	mv	s0,a0
    6a58:	00f58463          	beq	a1,a5,6a60 <cleanup_stdio+0x24>
    6a5c:	258040ef          	jal	acb4 <_fclose_r>
    6a60:	00842583          	lw	a1,8(s0)
    6a64:	8001a797          	auipc	a5,0x8001a
    6a68:	56478793          	add	a5,a5,1380 # 80020fc8 <__sf+0x68>
    6a6c:	00f58663          	beq	a1,a5,6a78 <cleanup_stdio+0x3c>
    6a70:	00040513          	mv	a0,s0
    6a74:	240040ef          	jal	acb4 <_fclose_r>
    6a78:	00c42583          	lw	a1,12(s0)
    6a7c:	8001a797          	auipc	a5,0x8001a
    6a80:	5b478793          	add	a5,a5,1460 # 80021030 <__sf+0xd0>
    6a84:	00f58c63          	beq	a1,a5,6a9c <cleanup_stdio+0x60>
    6a88:	00040513          	mv	a0,s0
    6a8c:	00812403          	lw	s0,8(sp)
    6a90:	00c12083          	lw	ra,12(sp)
    6a94:	01010113          	add	sp,sp,16
    6a98:	21c0406f          	j	acb4 <_fclose_r>
    6a9c:	00c12083          	lw	ra,12(sp)
    6aa0:	00812403          	lw	s0,8(sp)
    6aa4:	01010113          	add	sp,sp,16
    6aa8:	00008067          	ret

00006aac <global_stdio_init.part.0>:
    6aac:	fe010113          	add	sp,sp,-32
    6ab0:	00000797          	auipc	a5,0x0
    6ab4:	f7078793          	add	a5,a5,-144 # 6a20 <stdio_exit_handler>
    6ab8:	00112e23          	sw	ra,28(sp)
    6abc:	00812c23          	sw	s0,24(sp)
    6ac0:	00912a23          	sw	s1,20(sp)
    6ac4:	8001a417          	auipc	s0,0x8001a
    6ac8:	49c40413          	add	s0,s0,1180 # 80020f60 <__sf>
    6acc:	01212823          	sw	s2,16(sp)
    6ad0:	01312623          	sw	s3,12(sp)
    6ad4:	01412423          	sw	s4,8(sp)
    6ad8:	00800613          	li	a2,8
    6adc:	00000593          	li	a1,0
    6ae0:	7fffa717          	auipc	a4,0x7fffa
    6ae4:	c4f72a23          	sw	a5,-940(a4) # 80000734 <__stdio_exit_handler>
    6ae8:	8001a517          	auipc	a0,0x8001a
    6aec:	4d450513          	add	a0,a0,1236 # 80020fbc <__sf+0x5c>
    6af0:	00400793          	li	a5,4
    6af4:	00f42623          	sw	a5,12(s0)
    6af8:	00042023          	sw	zero,0(s0)
    6afc:	00042223          	sw	zero,4(s0)
    6b00:	00042423          	sw	zero,8(s0)
    6b04:	06042223          	sw	zero,100(s0)
    6b08:	00042823          	sw	zero,16(s0)
    6b0c:	00042a23          	sw	zero,20(s0)
    6b10:	00042c23          	sw	zero,24(s0)
    6b14:	d08fa0ef          	jal	101c <memset>
    6b18:	00001a17          	auipc	s4,0x1
    6b1c:	870a0a13          	add	s4,s4,-1936 # 7388 <__sread>
    6b20:	00001997          	auipc	s3,0x1
    6b24:	8c498993          	add	s3,s3,-1852 # 73e4 <__swrite>
    6b28:	00001917          	auipc	s2,0x1
    6b2c:	94490913          	add	s2,s2,-1724 # 746c <__sseek>
    6b30:	00001497          	auipc	s1,0x1
    6b34:	9b448493          	add	s1,s1,-1612 # 74e4 <__sclose>
    6b38:	8001a517          	auipc	a0,0x8001a
    6b3c:	48050513          	add	a0,a0,1152 # 80020fb8 <__sf+0x58>
    6b40:	03442023          	sw	s4,32(s0)
    6b44:	03342223          	sw	s3,36(s0)
    6b48:	03242423          	sw	s2,40(s0)
    6b4c:	02942623          	sw	s1,44(s0)
    6b50:	00842e23          	sw	s0,28(s0)
    6b54:	cb8fa0ef          	jal	100c <__retarget_lock_init_recursive>
    6b58:	000107b7          	lui	a5,0x10
    6b5c:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x5a9>
    6b60:	00800613          	li	a2,8
    6b64:	00000593          	li	a1,0
    6b68:	8001a517          	auipc	a0,0x8001a
    6b6c:	4bc50513          	add	a0,a0,1212 # 80021024 <__sf+0xc4>
    6b70:	06f42a23          	sw	a5,116(s0)
    6b74:	06042423          	sw	zero,104(s0)
    6b78:	06042623          	sw	zero,108(s0)
    6b7c:	06042823          	sw	zero,112(s0)
    6b80:	0c042623          	sw	zero,204(s0)
    6b84:	06042c23          	sw	zero,120(s0)
    6b88:	06042e23          	sw	zero,124(s0)
    6b8c:	08042023          	sw	zero,128(s0)
    6b90:	c8cfa0ef          	jal	101c <memset>
    6b94:	8001a797          	auipc	a5,0x8001a
    6b98:	43478793          	add	a5,a5,1076 # 80020fc8 <__sf+0x68>
    6b9c:	8001a517          	auipc	a0,0x8001a
    6ba0:	48450513          	add	a0,a0,1156 # 80021020 <__sf+0xc0>
    6ba4:	08f42223          	sw	a5,132(s0)
    6ba8:	09442423          	sw	s4,136(s0)
    6bac:	09342623          	sw	s3,140(s0)
    6bb0:	09242823          	sw	s2,144(s0)
    6bb4:	08942a23          	sw	s1,148(s0)
    6bb8:	c54fa0ef          	jal	100c <__retarget_lock_init_recursive>
    6bbc:	000207b7          	lui	a5,0x20
    6bc0:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6bc4:	00800613          	li	a2,8
    6bc8:	00000593          	li	a1,0
    6bcc:	8001a517          	auipc	a0,0x8001a
    6bd0:	4c050513          	add	a0,a0,1216 # 8002108c <__sf+0x12c>
    6bd4:	0cf42e23          	sw	a5,220(s0)
    6bd8:	0c042823          	sw	zero,208(s0)
    6bdc:	0c042a23          	sw	zero,212(s0)
    6be0:	0c042c23          	sw	zero,216(s0)
    6be4:	12042a23          	sw	zero,308(s0)
    6be8:	0e042023          	sw	zero,224(s0)
    6bec:	0e042223          	sw	zero,228(s0)
    6bf0:	0e042423          	sw	zero,232(s0)
    6bf4:	c28fa0ef          	jal	101c <memset>
    6bf8:	8001a797          	auipc	a5,0x8001a
    6bfc:	43878793          	add	a5,a5,1080 # 80021030 <__sf+0xd0>
    6c00:	0f442823          	sw	s4,240(s0)
    6c04:	0f342a23          	sw	s3,244(s0)
    6c08:	0f242c23          	sw	s2,248(s0)
    6c0c:	0e942e23          	sw	s1,252(s0)
    6c10:	0ef42623          	sw	a5,236(s0)
    6c14:	01812403          	lw	s0,24(sp)
    6c18:	01c12083          	lw	ra,28(sp)
    6c1c:	01412483          	lw	s1,20(sp)
    6c20:	01012903          	lw	s2,16(sp)
    6c24:	00c12983          	lw	s3,12(sp)
    6c28:	00812a03          	lw	s4,8(sp)
    6c2c:	8001a517          	auipc	a0,0x8001a
    6c30:	45c50513          	add	a0,a0,1116 # 80021088 <__sf+0x128>
    6c34:	02010113          	add	sp,sp,32
    6c38:	bd4fa06f          	j	100c <__retarget_lock_init_recursive>

00006c3c <__sinit>:
    6c3c:	ff010113          	add	sp,sp,-16
    6c40:	00812423          	sw	s0,8(sp)
    6c44:	00050413          	mv	s0,a0
    6c48:	7fffa517          	auipc	a0,0x7fffa
    6c4c:	adc50513          	add	a0,a0,-1316 # 80000724 <__lock___sfp_recursive_mutex>
    6c50:	00112623          	sw	ra,12(sp)
    6c54:	bc0fa0ef          	jal	1014 <__retarget_lock_acquire_recursive>
    6c58:	03442783          	lw	a5,52(s0)
    6c5c:	00079e63          	bnez	a5,6c78 <__sinit+0x3c>
    6c60:	00000797          	auipc	a5,0x0
    6c64:	ddc78793          	add	a5,a5,-548 # 6a3c <cleanup_stdio>
    6c68:	02f42a23          	sw	a5,52(s0)
    6c6c:	7fffa797          	auipc	a5,0x7fffa
    6c70:	ac87a783          	lw	a5,-1336(a5) # 80000734 <__stdio_exit_handler>
    6c74:	00078e63          	beqz	a5,6c90 <__sinit+0x54>
    6c78:	00812403          	lw	s0,8(sp)
    6c7c:	00c12083          	lw	ra,12(sp)
    6c80:	7fffa517          	auipc	a0,0x7fffa
    6c84:	aa450513          	add	a0,a0,-1372 # 80000724 <__lock___sfp_recursive_mutex>
    6c88:	01010113          	add	sp,sp,16
    6c8c:	b8cfa06f          	j	1018 <__retarget_lock_release_recursive>
    6c90:	e1dff0ef          	jal	6aac <global_stdio_init.part.0>
    6c94:	00812403          	lw	s0,8(sp)
    6c98:	00c12083          	lw	ra,12(sp)
    6c9c:	7fffa517          	auipc	a0,0x7fffa
    6ca0:	a8850513          	add	a0,a0,-1400 # 80000724 <__lock___sfp_recursive_mutex>
    6ca4:	01010113          	add	sp,sp,16
    6ca8:	b70fa06f          	j	1018 <__retarget_lock_release_recursive>

00006cac <__sfp_lock_acquire>:
    6cac:	7fffa517          	auipc	a0,0x7fffa
    6cb0:	a7850513          	add	a0,a0,-1416 # 80000724 <__lock___sfp_recursive_mutex>
    6cb4:	b60fa06f          	j	1014 <__retarget_lock_acquire_recursive>

00006cb8 <__sfp_lock_release>:
    6cb8:	7fffa517          	auipc	a0,0x7fffa
    6cbc:	a6c50513          	add	a0,a0,-1428 # 80000724 <__lock___sfp_recursive_mutex>
    6cc0:	b58fa06f          	j	1018 <__retarget_lock_release_recursive>

00006cc4 <__sfvwrite_r>:
    6cc4:	00862783          	lw	a5,8(a2)
    6cc8:	2c078463          	beqz	a5,6f90 <__sfvwrite_r+0x2cc>
    6ccc:	00c59683          	lh	a3,12(a1)
    6cd0:	fd010113          	add	sp,sp,-48
    6cd4:	02812423          	sw	s0,40(sp)
    6cd8:	01412c23          	sw	s4,24(sp)
    6cdc:	01612823          	sw	s6,16(sp)
    6ce0:	02112623          	sw	ra,44(sp)
    6ce4:	0086f793          	and	a5,a3,8
    6ce8:	00060b13          	mv	s6,a2
    6cec:	00050a13          	mv	s4,a0
    6cf0:	00058413          	mv	s0,a1
    6cf4:	08078e63          	beqz	a5,6d90 <__sfvwrite_r+0xcc>
    6cf8:	0105a783          	lw	a5,16(a1)
    6cfc:	08078a63          	beqz	a5,6d90 <__sfvwrite_r+0xcc>
    6d00:	02912223          	sw	s1,36(sp)
    6d04:	03212023          	sw	s2,32(sp)
    6d08:	01312e23          	sw	s3,28(sp)
    6d0c:	01512a23          	sw	s5,20(sp)
    6d10:	0026f793          	and	a5,a3,2
    6d14:	000b2483          	lw	s1,0(s6)
    6d18:	0a078463          	beqz	a5,6dc0 <__sfvwrite_r+0xfc>
    6d1c:	02442783          	lw	a5,36(s0)
    6d20:	01c42583          	lw	a1,28(s0)
    6d24:	80000ab7          	lui	s5,0x80000
    6d28:	00000993          	li	s3,0
    6d2c:	00000913          	li	s2,0
    6d30:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6d34:	00098613          	mv	a2,s3
    6d38:	000a0513          	mv	a0,s4
    6d3c:	04090263          	beqz	s2,6d80 <__sfvwrite_r+0xbc>
    6d40:	00090693          	mv	a3,s2
    6d44:	012af463          	bgeu	s5,s2,6d4c <__sfvwrite_r+0x88>
    6d48:	000a8693          	mv	a3,s5
    6d4c:	000780e7          	jalr	a5
    6d50:	46a05263          	blez	a0,71b4 <__sfvwrite_r+0x4f0>
    6d54:	008b2783          	lw	a5,8(s6)
    6d58:	00a989b3          	add	s3,s3,a0
    6d5c:	40a90933          	sub	s2,s2,a0
    6d60:	40a787b3          	sub	a5,a5,a0
    6d64:	00fb2423          	sw	a5,8(s6)
    6d68:	1a078663          	beqz	a5,6f14 <__sfvwrite_r+0x250>
    6d6c:	02442783          	lw	a5,36(s0)
    6d70:	01c42583          	lw	a1,28(s0)
    6d74:	00098613          	mv	a2,s3
    6d78:	000a0513          	mv	a0,s4
    6d7c:	fc0912e3          	bnez	s2,6d40 <__sfvwrite_r+0x7c>
    6d80:	0004a983          	lw	s3,0(s1)
    6d84:	0044a903          	lw	s2,4(s1)
    6d88:	00848493          	add	s1,s1,8
    6d8c:	fa9ff06f          	j	6d34 <__sfvwrite_r+0x70>
    6d90:	00040593          	mv	a1,s0
    6d94:	000a0513          	mv	a0,s4
    6d98:	0e5000ef          	jal	767c <__swsetup_r>
    6d9c:	1c051c63          	bnez	a0,6f74 <__sfvwrite_r+0x2b0>
    6da0:	00c41683          	lh	a3,12(s0)
    6da4:	02912223          	sw	s1,36(sp)
    6da8:	03212023          	sw	s2,32(sp)
    6dac:	01312e23          	sw	s3,28(sp)
    6db0:	01512a23          	sw	s5,20(sp)
    6db4:	0026f793          	and	a5,a3,2
    6db8:	000b2483          	lw	s1,0(s6)
    6dbc:	f60790e3          	bnez	a5,6d1c <__sfvwrite_r+0x58>
    6dc0:	01712623          	sw	s7,12(sp)
    6dc4:	01812423          	sw	s8,8(sp)
    6dc8:	0016f793          	and	a5,a3,1
    6dcc:	1c079663          	bnez	a5,6f98 <__sfvwrite_r+0x2d4>
    6dd0:	00042783          	lw	a5,0(s0)
    6dd4:	00842703          	lw	a4,8(s0)
    6dd8:	80000ab7          	lui	s5,0x80000
    6ddc:	01912223          	sw	s9,4(sp)
    6de0:	00000b93          	li	s7,0
    6de4:	00000993          	li	s3,0
    6de8:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6dec:	00078513          	mv	a0,a5
    6df0:	00070c13          	mv	s8,a4
    6df4:	10098263          	beqz	s3,6ef8 <__sfvwrite_r+0x234>
    6df8:	2006f613          	and	a2,a3,512
    6dfc:	28060863          	beqz	a2,708c <__sfvwrite_r+0x3c8>
    6e00:	00070c93          	mv	s9,a4
    6e04:	32e9e863          	bltu	s3,a4,7134 <__sfvwrite_r+0x470>
    6e08:	4806f713          	and	a4,a3,1152
    6e0c:	08070a63          	beqz	a4,6ea0 <__sfvwrite_r+0x1dc>
    6e10:	01442603          	lw	a2,20(s0)
    6e14:	01042583          	lw	a1,16(s0)
    6e18:	00161713          	sll	a4,a2,0x1
    6e1c:	00c70733          	add	a4,a4,a2
    6e20:	40b78933          	sub	s2,a5,a1
    6e24:	01f75c13          	srl	s8,a4,0x1f
    6e28:	00ec0c33          	add	s8,s8,a4
    6e2c:	00190793          	add	a5,s2,1
    6e30:	401c5c13          	sra	s8,s8,0x1
    6e34:	013787b3          	add	a5,a5,s3
    6e38:	000c0613          	mv	a2,s8
    6e3c:	00fc7663          	bgeu	s8,a5,6e48 <__sfvwrite_r+0x184>
    6e40:	00078c13          	mv	s8,a5
    6e44:	00078613          	mv	a2,a5
    6e48:	4006f693          	and	a3,a3,1024
    6e4c:	32068063          	beqz	a3,716c <__sfvwrite_r+0x4a8>
    6e50:	00060593          	mv	a1,a2
    6e54:	000a0513          	mv	a0,s4
    6e58:	921fa0ef          	jal	1778 <_malloc_r>
    6e5c:	00050c93          	mv	s9,a0
    6e60:	34050e63          	beqz	a0,71bc <__sfvwrite_r+0x4f8>
    6e64:	01042583          	lw	a1,16(s0)
    6e68:	00090613          	mv	a2,s2
    6e6c:	a8cfa0ef          	jal	10f8 <memcpy>
    6e70:	00c45783          	lhu	a5,12(s0)
    6e74:	b7f7f793          	and	a5,a5,-1153
    6e78:	0807e793          	or	a5,a5,128
    6e7c:	00f41623          	sh	a5,12(s0)
    6e80:	012c8533          	add	a0,s9,s2
    6e84:	412c07b3          	sub	a5,s8,s2
    6e88:	01942823          	sw	s9,16(s0)
    6e8c:	01842a23          	sw	s8,20(s0)
    6e90:	00a42023          	sw	a0,0(s0)
    6e94:	00098c13          	mv	s8,s3
    6e98:	00f42423          	sw	a5,8(s0)
    6e9c:	00098c93          	mv	s9,s3
    6ea0:	000c8613          	mv	a2,s9
    6ea4:	000b8593          	mv	a1,s7
    6ea8:	6a9000ef          	jal	7d50 <memmove>
    6eac:	00842703          	lw	a4,8(s0)
    6eb0:	00042783          	lw	a5,0(s0)
    6eb4:	00098913          	mv	s2,s3
    6eb8:	41870733          	sub	a4,a4,s8
    6ebc:	019787b3          	add	a5,a5,s9
    6ec0:	00e42423          	sw	a4,8(s0)
    6ec4:	00f42023          	sw	a5,0(s0)
    6ec8:	00000993          	li	s3,0
    6ecc:	008b2783          	lw	a5,8(s6)
    6ed0:	012b8bb3          	add	s7,s7,s2
    6ed4:	412787b3          	sub	a5,a5,s2
    6ed8:	00fb2423          	sw	a5,8(s6)
    6edc:	02078663          	beqz	a5,6f08 <__sfvwrite_r+0x244>
    6ee0:	00042783          	lw	a5,0(s0)
    6ee4:	00842703          	lw	a4,8(s0)
    6ee8:	00c41683          	lh	a3,12(s0)
    6eec:	00078513          	mv	a0,a5
    6ef0:	00070c13          	mv	s8,a4
    6ef4:	f00992e3          	bnez	s3,6df8 <__sfvwrite_r+0x134>
    6ef8:	0004ab83          	lw	s7,0(s1)
    6efc:	0044a983          	lw	s3,4(s1)
    6f00:	00848493          	add	s1,s1,8
    6f04:	ee9ff06f          	j	6dec <__sfvwrite_r+0x128>
    6f08:	00c12b83          	lw	s7,12(sp)
    6f0c:	00812c03          	lw	s8,8(sp)
    6f10:	00412c83          	lw	s9,4(sp)
    6f14:	02c12083          	lw	ra,44(sp)
    6f18:	02812403          	lw	s0,40(sp)
    6f1c:	02412483          	lw	s1,36(sp)
    6f20:	02012903          	lw	s2,32(sp)
    6f24:	01c12983          	lw	s3,28(sp)
    6f28:	01412a83          	lw	s5,20(sp)
    6f2c:	01812a03          	lw	s4,24(sp)
    6f30:	01012b03          	lw	s6,16(sp)
    6f34:	00000513          	li	a0,0
    6f38:	03010113          	add	sp,sp,48
    6f3c:	00008067          	ret
    6f40:	00040593          	mv	a1,s0
    6f44:	000a0513          	mv	a0,s4
    6f48:	9f9ff0ef          	jal	6940 <_fflush_r>
    6f4c:	0a050e63          	beqz	a0,7008 <__sfvwrite_r+0x344>
    6f50:	00c41783          	lh	a5,12(s0)
    6f54:	00c12b83          	lw	s7,12(sp)
    6f58:	00812c03          	lw	s8,8(sp)
    6f5c:	02412483          	lw	s1,36(sp)
    6f60:	02012903          	lw	s2,32(sp)
    6f64:	01c12983          	lw	s3,28(sp)
    6f68:	01412a83          	lw	s5,20(sp)
    6f6c:	0407e793          	or	a5,a5,64
    6f70:	00f41623          	sh	a5,12(s0)
    6f74:	02c12083          	lw	ra,44(sp)
    6f78:	02812403          	lw	s0,40(sp)
    6f7c:	01812a03          	lw	s4,24(sp)
    6f80:	01012b03          	lw	s6,16(sp)
    6f84:	fff00513          	li	a0,-1
    6f88:	03010113          	add	sp,sp,48
    6f8c:	00008067          	ret
    6f90:	00000513          	li	a0,0
    6f94:	00008067          	ret
    6f98:	00000a93          	li	s5,0
    6f9c:	00000513          	li	a0,0
    6fa0:	00000c13          	li	s8,0
    6fa4:	00000993          	li	s3,0
    6fa8:	08098263          	beqz	s3,702c <__sfvwrite_r+0x368>
    6fac:	08050a63          	beqz	a0,7040 <__sfvwrite_r+0x37c>
    6fb0:	000a8793          	mv	a5,s5
    6fb4:	00098b93          	mv	s7,s3
    6fb8:	0137f463          	bgeu	a5,s3,6fc0 <__sfvwrite_r+0x2fc>
    6fbc:	00078b93          	mv	s7,a5
    6fc0:	00042503          	lw	a0,0(s0)
    6fc4:	01042783          	lw	a5,16(s0)
    6fc8:	00842903          	lw	s2,8(s0)
    6fcc:	01442683          	lw	a3,20(s0)
    6fd0:	00a7f663          	bgeu	a5,a0,6fdc <__sfvwrite_r+0x318>
    6fd4:	00d90933          	add	s2,s2,a3
    6fd8:	09794463          	blt	s2,s7,7060 <__sfvwrite_r+0x39c>
    6fdc:	16dbc263          	blt	s7,a3,7140 <__sfvwrite_r+0x47c>
    6fe0:	02442783          	lw	a5,36(s0)
    6fe4:	01c42583          	lw	a1,28(s0)
    6fe8:	000c0613          	mv	a2,s8
    6fec:	000a0513          	mv	a0,s4
    6ff0:	000780e7          	jalr	a5
    6ff4:	00050913          	mv	s2,a0
    6ff8:	f4a05ce3          	blez	a0,6f50 <__sfvwrite_r+0x28c>
    6ffc:	412a8ab3          	sub	s5,s5,s2
    7000:	00100513          	li	a0,1
    7004:	f20a8ee3          	beqz	s5,6f40 <__sfvwrite_r+0x27c>
    7008:	008b2783          	lw	a5,8(s6)
    700c:	012c0c33          	add	s8,s8,s2
    7010:	412989b3          	sub	s3,s3,s2
    7014:	412787b3          	sub	a5,a5,s2
    7018:	00fb2423          	sw	a5,8(s6)
    701c:	f80796e3          	bnez	a5,6fa8 <__sfvwrite_r+0x2e4>
    7020:	00c12b83          	lw	s7,12(sp)
    7024:	00812c03          	lw	s8,8(sp)
    7028:	eedff06f          	j	6f14 <__sfvwrite_r+0x250>
    702c:	0044a983          	lw	s3,4(s1)
    7030:	00048793          	mv	a5,s1
    7034:	00848493          	add	s1,s1,8
    7038:	fe098ae3          	beqz	s3,702c <__sfvwrite_r+0x368>
    703c:	0007ac03          	lw	s8,0(a5)
    7040:	00098613          	mv	a2,s3
    7044:	00a00593          	li	a1,10
    7048:	000c0513          	mv	a0,s8
    704c:	1a1000ef          	jal	79ec <memchr>
    7050:	14050c63          	beqz	a0,71a8 <__sfvwrite_r+0x4e4>
    7054:	00150513          	add	a0,a0,1
    7058:	41850ab3          	sub	s5,a0,s8
    705c:	f55ff06f          	j	6fb0 <__sfvwrite_r+0x2ec>
    7060:	000c0593          	mv	a1,s8
    7064:	00090613          	mv	a2,s2
    7068:	4e9000ef          	jal	7d50 <memmove>
    706c:	00042783          	lw	a5,0(s0)
    7070:	00040593          	mv	a1,s0
    7074:	000a0513          	mv	a0,s4
    7078:	012787b3          	add	a5,a5,s2
    707c:	00f42023          	sw	a5,0(s0)
    7080:	8c1ff0ef          	jal	6940 <_fflush_r>
    7084:	f6050ce3          	beqz	a0,6ffc <__sfvwrite_r+0x338>
    7088:	ec9ff06f          	j	6f50 <__sfvwrite_r+0x28c>
    708c:	01042683          	lw	a3,16(s0)
    7090:	04f6e463          	bltu	a3,a5,70d8 <__sfvwrite_r+0x414>
    7094:	01442583          	lw	a1,20(s0)
    7098:	04b9e063          	bltu	s3,a1,70d8 <__sfvwrite_r+0x414>
    709c:	00098913          	mv	s2,s3
    70a0:	013af463          	bgeu	s5,s3,70a8 <__sfvwrite_r+0x3e4>
    70a4:	000a8913          	mv	s2,s5
    70a8:	00090513          	mv	a0,s2
    70ac:	65d070ef          	jal	ef08 <__modsi3>
    70b0:	02442783          	lw	a5,36(s0)
    70b4:	01c42583          	lw	a1,28(s0)
    70b8:	40a906b3          	sub	a3,s2,a0
    70bc:	000b8613          	mv	a2,s7
    70c0:	000a0513          	mv	a0,s4
    70c4:	000780e7          	jalr	a5
    70c8:	00050913          	mv	s2,a0
    70cc:	04a05a63          	blez	a0,7120 <__sfvwrite_r+0x45c>
    70d0:	412989b3          	sub	s3,s3,s2
    70d4:	df9ff06f          	j	6ecc <__sfvwrite_r+0x208>
    70d8:	00070913          	mv	s2,a4
    70dc:	00e9f463          	bgeu	s3,a4,70e4 <__sfvwrite_r+0x420>
    70e0:	00098913          	mv	s2,s3
    70e4:	00078513          	mv	a0,a5
    70e8:	00090613          	mv	a2,s2
    70ec:	000b8593          	mv	a1,s7
    70f0:	461000ef          	jal	7d50 <memmove>
    70f4:	00842703          	lw	a4,8(s0)
    70f8:	00042783          	lw	a5,0(s0)
    70fc:	41270733          	sub	a4,a4,s2
    7100:	012787b3          	add	a5,a5,s2
    7104:	00e42423          	sw	a4,8(s0)
    7108:	00f42023          	sw	a5,0(s0)
    710c:	fc0712e3          	bnez	a4,70d0 <__sfvwrite_r+0x40c>
    7110:	00040593          	mv	a1,s0
    7114:	000a0513          	mv	a0,s4
    7118:	829ff0ef          	jal	6940 <_fflush_r>
    711c:	fa050ae3          	beqz	a0,70d0 <__sfvwrite_r+0x40c>
    7120:	00c41783          	lh	a5,12(s0)
    7124:	00c12b83          	lw	s7,12(sp)
    7128:	00812c03          	lw	s8,8(sp)
    712c:	00412c83          	lw	s9,4(sp)
    7130:	e2dff06f          	j	6f5c <__sfvwrite_r+0x298>
    7134:	00098c13          	mv	s8,s3
    7138:	00098c93          	mv	s9,s3
    713c:	d65ff06f          	j	6ea0 <__sfvwrite_r+0x1dc>
    7140:	000b8613          	mv	a2,s7
    7144:	000c0593          	mv	a1,s8
    7148:	409000ef          	jal	7d50 <memmove>
    714c:	00842703          	lw	a4,8(s0)
    7150:	00042783          	lw	a5,0(s0)
    7154:	000b8913          	mv	s2,s7
    7158:	41770733          	sub	a4,a4,s7
    715c:	017787b3          	add	a5,a5,s7
    7160:	00e42423          	sw	a4,8(s0)
    7164:	00f42023          	sw	a5,0(s0)
    7168:	e95ff06f          	j	6ffc <__sfvwrite_r+0x338>
    716c:	000a0513          	mv	a0,s4
    7170:	508030ef          	jal	a678 <_realloc_r>
    7174:	00050c93          	mv	s9,a0
    7178:	d00514e3          	bnez	a0,6e80 <__sfvwrite_r+0x1bc>
    717c:	01042583          	lw	a1,16(s0)
    7180:	000a0513          	mv	a0,s4
    7184:	ae8fa0ef          	jal	146c <_free_r>
    7188:	00c41783          	lh	a5,12(s0)
    718c:	00c00713          	li	a4,12
    7190:	00c12b83          	lw	s7,12(sp)
    7194:	00812c03          	lw	s8,8(sp)
    7198:	00412c83          	lw	s9,4(sp)
    719c:	00ea2023          	sw	a4,0(s4)
    71a0:	f7f7f793          	and	a5,a5,-129
    71a4:	db9ff06f          	j	6f5c <__sfvwrite_r+0x298>
    71a8:	00198793          	add	a5,s3,1
    71ac:	00078a93          	mv	s5,a5
    71b0:	e05ff06f          	j	6fb4 <__sfvwrite_r+0x2f0>
    71b4:	00c41783          	lh	a5,12(s0)
    71b8:	da5ff06f          	j	6f5c <__sfvwrite_r+0x298>
    71bc:	00c00713          	li	a4,12
    71c0:	00c41783          	lh	a5,12(s0)
    71c4:	00c12b83          	lw	s7,12(sp)
    71c8:	00812c03          	lw	s8,8(sp)
    71cc:	00412c83          	lw	s9,4(sp)
    71d0:	00ea2023          	sw	a4,0(s4)
    71d4:	d89ff06f          	j	6f5c <__sfvwrite_r+0x298>

000071d8 <_fwalk_sglue>:
    71d8:	fd010113          	add	sp,sp,-48
    71dc:	03212023          	sw	s2,32(sp)
    71e0:	01312e23          	sw	s3,28(sp)
    71e4:	01412c23          	sw	s4,24(sp)
    71e8:	01512a23          	sw	s5,20(sp)
    71ec:	01612823          	sw	s6,16(sp)
    71f0:	01712623          	sw	s7,12(sp)
    71f4:	02112623          	sw	ra,44(sp)
    71f8:	02812423          	sw	s0,40(sp)
    71fc:	02912223          	sw	s1,36(sp)
    7200:	00050b13          	mv	s6,a0
    7204:	00058b93          	mv	s7,a1
    7208:	00060a93          	mv	s5,a2
    720c:	00000a13          	li	s4,0
    7210:	00100993          	li	s3,1
    7214:	fff00913          	li	s2,-1
    7218:	004aa483          	lw	s1,4(s5)
    721c:	008aa403          	lw	s0,8(s5)
    7220:	fff48493          	add	s1,s1,-1
    7224:	0204c863          	bltz	s1,7254 <_fwalk_sglue+0x7c>
    7228:	00c45783          	lhu	a5,12(s0)
    722c:	00f9fe63          	bgeu	s3,a5,7248 <_fwalk_sglue+0x70>
    7230:	00e41783          	lh	a5,14(s0)
    7234:	00040593          	mv	a1,s0
    7238:	000b0513          	mv	a0,s6
    723c:	01278663          	beq	a5,s2,7248 <_fwalk_sglue+0x70>
    7240:	000b80e7          	jalr	s7
    7244:	00aa6a33          	or	s4,s4,a0
    7248:	fff48493          	add	s1,s1,-1
    724c:	06840413          	add	s0,s0,104
    7250:	fd249ce3          	bne	s1,s2,7228 <_fwalk_sglue+0x50>
    7254:	000aaa83          	lw	s5,0(s5)
    7258:	fc0a90e3          	bnez	s5,7218 <_fwalk_sglue+0x40>
    725c:	02c12083          	lw	ra,44(sp)
    7260:	02812403          	lw	s0,40(sp)
    7264:	02412483          	lw	s1,36(sp)
    7268:	02012903          	lw	s2,32(sp)
    726c:	01c12983          	lw	s3,28(sp)
    7270:	01412a83          	lw	s5,20(sp)
    7274:	01012b03          	lw	s6,16(sp)
    7278:	00c12b83          	lw	s7,12(sp)
    727c:	000a0513          	mv	a0,s4
    7280:	01812a03          	lw	s4,24(sp)
    7284:	03010113          	add	sp,sp,48
    7288:	00008067          	ret

0000728c <_putc_r>:
    728c:	fe010113          	add	sp,sp,-32
    7290:	00812c23          	sw	s0,24(sp)
    7294:	01212a23          	sw	s2,20(sp)
    7298:	00112e23          	sw	ra,28(sp)
    729c:	00050913          	mv	s2,a0
    72a0:	00060413          	mv	s0,a2
    72a4:	00050663          	beqz	a0,72b0 <_putc_r+0x24>
    72a8:	03452783          	lw	a5,52(a0)
    72ac:	0c078663          	beqz	a5,7378 <_putc_r+0xec>
    72b0:	06442783          	lw	a5,100(s0)
    72b4:	0017f793          	and	a5,a5,1
    72b8:	00079863          	bnez	a5,72c8 <_putc_r+0x3c>
    72bc:	00c45783          	lhu	a5,12(s0)
    72c0:	2007f793          	and	a5,a5,512
    72c4:	08078063          	beqz	a5,7344 <_putc_r+0xb8>
    72c8:	00842783          	lw	a5,8(s0)
    72cc:	fff78793          	add	a5,a5,-1
    72d0:	00f42423          	sw	a5,8(s0)
    72d4:	0007dc63          	bgez	a5,72ec <_putc_r+0x60>
    72d8:	01842703          	lw	a4,24(s0)
    72dc:	04e7ca63          	blt	a5,a4,7330 <_putc_r+0xa4>
    72e0:	0ff5f793          	zext.b	a5,a1
    72e4:	00a00713          	li	a4,10
    72e8:	04e78463          	beq	a5,a4,7330 <_putc_r+0xa4>
    72ec:	00042783          	lw	a5,0(s0)
    72f0:	0ff5f913          	zext.b	s2,a1
    72f4:	00178713          	add	a4,a5,1
    72f8:	00e42023          	sw	a4,0(s0)
    72fc:	00b78023          	sb	a1,0(a5)
    7300:	06442783          	lw	a5,100(s0)
    7304:	0017f793          	and	a5,a5,1
    7308:	00079863          	bnez	a5,7318 <_putc_r+0x8c>
    730c:	00c45783          	lhu	a5,12(s0)
    7310:	2007f793          	and	a5,a5,512
    7314:	04078263          	beqz	a5,7358 <_putc_r+0xcc>
    7318:	01c12083          	lw	ra,28(sp)
    731c:	01812403          	lw	s0,24(sp)
    7320:	00090513          	mv	a0,s2
    7324:	01412903          	lw	s2,20(sp)
    7328:	02010113          	add	sp,sp,32
    732c:	00008067          	ret
    7330:	00090513          	mv	a0,s2
    7334:	00040613          	mv	a2,s0
    7338:	1b4000ef          	jal	74ec <__swbuf_r>
    733c:	00050913          	mv	s2,a0
    7340:	fc1ff06f          	j	7300 <_putc_r+0x74>
    7344:	05842503          	lw	a0,88(s0)
    7348:	00b12623          	sw	a1,12(sp)
    734c:	cc9f90ef          	jal	1014 <__retarget_lock_acquire_recursive>
    7350:	00c12583          	lw	a1,12(sp)
    7354:	f75ff06f          	j	72c8 <_putc_r+0x3c>
    7358:	05842503          	lw	a0,88(s0)
    735c:	cbdf90ef          	jal	1018 <__retarget_lock_release_recursive>
    7360:	01c12083          	lw	ra,28(sp)
    7364:	01812403          	lw	s0,24(sp)
    7368:	00090513          	mv	a0,s2
    736c:	01412903          	lw	s2,20(sp)
    7370:	02010113          	add	sp,sp,32
    7374:	00008067          	ret
    7378:	00b12623          	sw	a1,12(sp)
    737c:	8c1ff0ef          	jal	6c3c <__sinit>
    7380:	00c12583          	lw	a1,12(sp)
    7384:	f2dff06f          	j	72b0 <_putc_r+0x24>

00007388 <__sread>:
    7388:	ff010113          	add	sp,sp,-16
    738c:	00812423          	sw	s0,8(sp)
    7390:	00058413          	mv	s0,a1
    7394:	00e59583          	lh	a1,14(a1)
    7398:	00112623          	sw	ra,12(sp)
    739c:	095000ef          	jal	7c30 <_read_r>
    73a0:	02054063          	bltz	a0,73c0 <__sread+0x38>
    73a4:	05042783          	lw	a5,80(s0)
    73a8:	00c12083          	lw	ra,12(sp)
    73ac:	00a787b3          	add	a5,a5,a0
    73b0:	04f42823          	sw	a5,80(s0)
    73b4:	00812403          	lw	s0,8(sp)
    73b8:	01010113          	add	sp,sp,16
    73bc:	00008067          	ret
    73c0:	00c45783          	lhu	a5,12(s0)
    73c4:	fffff737          	lui	a4,0xfffff
    73c8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    73cc:	00e7f7b3          	and	a5,a5,a4
    73d0:	00c12083          	lw	ra,12(sp)
    73d4:	00f41623          	sh	a5,12(s0)
    73d8:	00812403          	lw	s0,8(sp)
    73dc:	01010113          	add	sp,sp,16
    73e0:	00008067          	ret

000073e4 <__swrite>:
    73e4:	00c59783          	lh	a5,12(a1)
    73e8:	fe010113          	add	sp,sp,-32
    73ec:	00812c23          	sw	s0,24(sp)
    73f0:	00912a23          	sw	s1,20(sp)
    73f4:	01212823          	sw	s2,16(sp)
    73f8:	01312623          	sw	s3,12(sp)
    73fc:	00112e23          	sw	ra,28(sp)
    7400:	1007f713          	and	a4,a5,256
    7404:	00058413          	mv	s0,a1
    7408:	00050493          	mv	s1,a0
    740c:	00060913          	mv	s2,a2
    7410:	00068993          	mv	s3,a3
    7414:	04071063          	bnez	a4,7454 <__swrite+0x70>
    7418:	fffff737          	lui	a4,0xfffff
    741c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7420:	00e7f7b3          	and	a5,a5,a4
    7424:	00e41583          	lh	a1,14(s0)
    7428:	00f41623          	sh	a5,12(s0)
    742c:	01812403          	lw	s0,24(sp)
    7430:	01c12083          	lw	ra,28(sp)
    7434:	00098693          	mv	a3,s3
    7438:	00090613          	mv	a2,s2
    743c:	00c12983          	lw	s3,12(sp)
    7440:	01012903          	lw	s2,16(sp)
    7444:	00048513          	mv	a0,s1
    7448:	01412483          	lw	s1,20(sp)
    744c:	02010113          	add	sp,sp,32
    7450:	09d0006f          	j	7cec <_write_r>
    7454:	00e59583          	lh	a1,14(a1)
    7458:	00200693          	li	a3,2
    745c:	00000613          	li	a2,0
    7460:	76c000ef          	jal	7bcc <_lseek_r>
    7464:	00c41783          	lh	a5,12(s0)
    7468:	fb1ff06f          	j	7418 <__swrite+0x34>

0000746c <__sseek>:
    746c:	ff010113          	add	sp,sp,-16
    7470:	00812423          	sw	s0,8(sp)
    7474:	00058413          	mv	s0,a1
    7478:	00e59583          	lh	a1,14(a1)
    747c:	00112623          	sw	ra,12(sp)
    7480:	74c000ef          	jal	7bcc <_lseek_r>
    7484:	fff00793          	li	a5,-1
    7488:	02f50863          	beq	a0,a5,74b8 <__sseek+0x4c>
    748c:	00c45783          	lhu	a5,12(s0)
    7490:	00001737          	lui	a4,0x1
    7494:	00c12083          	lw	ra,12(sp)
    7498:	00e7e7b3          	or	a5,a5,a4
    749c:	01079793          	sll	a5,a5,0x10
    74a0:	4107d793          	sra	a5,a5,0x10
    74a4:	04a42823          	sw	a0,80(s0)
    74a8:	00f41623          	sh	a5,12(s0)
    74ac:	00812403          	lw	s0,8(sp)
    74b0:	01010113          	add	sp,sp,16
    74b4:	00008067          	ret
    74b8:	00c45783          	lhu	a5,12(s0)
    74bc:	fffff737          	lui	a4,0xfffff
    74c0:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    74c4:	00e7f7b3          	and	a5,a5,a4
    74c8:	01079793          	sll	a5,a5,0x10
    74cc:	4107d793          	sra	a5,a5,0x10
    74d0:	00c12083          	lw	ra,12(sp)
    74d4:	00f41623          	sh	a5,12(s0)
    74d8:	00812403          	lw	s0,8(sp)
    74dc:	01010113          	add	sp,sp,16
    74e0:	00008067          	ret

000074e4 <__sclose>:
    74e4:	00e59583          	lh	a1,14(a1)
    74e8:	68c0006f          	j	7b74 <_close_r>

000074ec <__swbuf_r>:
    74ec:	fe010113          	add	sp,sp,-32
    74f0:	00812c23          	sw	s0,24(sp)
    74f4:	00912a23          	sw	s1,20(sp)
    74f8:	01212823          	sw	s2,16(sp)
    74fc:	00112e23          	sw	ra,28(sp)
    7500:	00050913          	mv	s2,a0
    7504:	00058493          	mv	s1,a1
    7508:	00060413          	mv	s0,a2
    750c:	00050663          	beqz	a0,7518 <__swbuf_r+0x2c>
    7510:	03452783          	lw	a5,52(a0)
    7514:	16078063          	beqz	a5,7674 <__swbuf_r+0x188>
    7518:	01842783          	lw	a5,24(s0)
    751c:	00c41703          	lh	a4,12(s0)
    7520:	00f42423          	sw	a5,8(s0)
    7524:	00877793          	and	a5,a4,8
    7528:	08078063          	beqz	a5,75a8 <__swbuf_r+0xbc>
    752c:	01042783          	lw	a5,16(s0)
    7530:	06078c63          	beqz	a5,75a8 <__swbuf_r+0xbc>
    7534:	01312623          	sw	s3,12(sp)
    7538:	01271693          	sll	a3,a4,0x12
    753c:	0ff4f993          	zext.b	s3,s1
    7540:	0ff4f493          	zext.b	s1,s1
    7544:	0806d863          	bgez	a3,75d4 <__swbuf_r+0xe8>
    7548:	00042703          	lw	a4,0(s0)
    754c:	01442683          	lw	a3,20(s0)
    7550:	40f707b3          	sub	a5,a4,a5
    7554:	0ad7d863          	bge	a5,a3,7604 <__swbuf_r+0x118>
    7558:	00842683          	lw	a3,8(s0)
    755c:	00170613          	add	a2,a4,1
    7560:	00c42023          	sw	a2,0(s0)
    7564:	fff68693          	add	a3,a3,-1
    7568:	00d42423          	sw	a3,8(s0)
    756c:	01370023          	sb	s3,0(a4)
    7570:	01442703          	lw	a4,20(s0)
    7574:	00178793          	add	a5,a5,1
    7578:	0cf70263          	beq	a4,a5,763c <__swbuf_r+0x150>
    757c:	00c45783          	lhu	a5,12(s0)
    7580:	0017f793          	and	a5,a5,1
    7584:	0c079a63          	bnez	a5,7658 <__swbuf_r+0x16c>
    7588:	00c12983          	lw	s3,12(sp)
    758c:	01c12083          	lw	ra,28(sp)
    7590:	01812403          	lw	s0,24(sp)
    7594:	01012903          	lw	s2,16(sp)
    7598:	00048513          	mv	a0,s1
    759c:	01412483          	lw	s1,20(sp)
    75a0:	02010113          	add	sp,sp,32
    75a4:	00008067          	ret
    75a8:	00040593          	mv	a1,s0
    75ac:	00090513          	mv	a0,s2
    75b0:	0cc000ef          	jal	767c <__swsetup_r>
    75b4:	08051e63          	bnez	a0,7650 <__swbuf_r+0x164>
    75b8:	00c41703          	lh	a4,12(s0)
    75bc:	01312623          	sw	s3,12(sp)
    75c0:	01042783          	lw	a5,16(s0)
    75c4:	01271693          	sll	a3,a4,0x12
    75c8:	0ff4f993          	zext.b	s3,s1
    75cc:	0ff4f493          	zext.b	s1,s1
    75d0:	f606cce3          	bltz	a3,7548 <__swbuf_r+0x5c>
    75d4:	06442683          	lw	a3,100(s0)
    75d8:	ffffe637          	lui	a2,0xffffe
    75dc:	000025b7          	lui	a1,0x2
    75e0:	00b76733          	or	a4,a4,a1
    75e4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    75e8:	00c6f6b3          	and	a3,a3,a2
    75ec:	00e41623          	sh	a4,12(s0)
    75f0:	00042703          	lw	a4,0(s0)
    75f4:	06d42223          	sw	a3,100(s0)
    75f8:	01442683          	lw	a3,20(s0)
    75fc:	40f707b3          	sub	a5,a4,a5
    7600:	f4d7cce3          	blt	a5,a3,7558 <__swbuf_r+0x6c>
    7604:	00040593          	mv	a1,s0
    7608:	00090513          	mv	a0,s2
    760c:	b34ff0ef          	jal	6940 <_fflush_r>
    7610:	02051e63          	bnez	a0,764c <__swbuf_r+0x160>
    7614:	00042703          	lw	a4,0(s0)
    7618:	00842683          	lw	a3,8(s0)
    761c:	00100793          	li	a5,1
    7620:	00170613          	add	a2,a4,1
    7624:	fff68693          	add	a3,a3,-1
    7628:	00c42023          	sw	a2,0(s0)
    762c:	00d42423          	sw	a3,8(s0)
    7630:	01370023          	sb	s3,0(a4)
    7634:	01442703          	lw	a4,20(s0)
    7638:	f4f712e3          	bne	a4,a5,757c <__swbuf_r+0x90>
    763c:	00040593          	mv	a1,s0
    7640:	00090513          	mv	a0,s2
    7644:	afcff0ef          	jal	6940 <_fflush_r>
    7648:	f40500e3          	beqz	a0,7588 <__swbuf_r+0x9c>
    764c:	00c12983          	lw	s3,12(sp)
    7650:	fff00493          	li	s1,-1
    7654:	f39ff06f          	j	758c <__swbuf_r+0xa0>
    7658:	00a00793          	li	a5,10
    765c:	f2f496e3          	bne	s1,a5,7588 <__swbuf_r+0x9c>
    7660:	00040593          	mv	a1,s0
    7664:	00090513          	mv	a0,s2
    7668:	ad8ff0ef          	jal	6940 <_fflush_r>
    766c:	f0050ee3          	beqz	a0,7588 <__swbuf_r+0x9c>
    7670:	fddff06f          	j	764c <__swbuf_r+0x160>
    7674:	dc8ff0ef          	jal	6c3c <__sinit>
    7678:	ea1ff06f          	j	7518 <__swbuf_r+0x2c>

0000767c <__swsetup_r>:
    767c:	ff010113          	add	sp,sp,-16
    7680:	00812423          	sw	s0,8(sp)
    7684:	00912223          	sw	s1,4(sp)
    7688:	00112623          	sw	ra,12(sp)
    768c:	7fff9797          	auipc	a5,0x7fff9
    7690:	07c7a783          	lw	a5,124(a5) # 80000708 <_impure_ptr>
    7694:	00050493          	mv	s1,a0
    7698:	00058413          	mv	s0,a1
    769c:	00078663          	beqz	a5,76a8 <__swsetup_r+0x2c>
    76a0:	0347a703          	lw	a4,52(a5)
    76a4:	0e070c63          	beqz	a4,779c <__swsetup_r+0x120>
    76a8:	00c41783          	lh	a5,12(s0)
    76ac:	0087f713          	and	a4,a5,8
    76b0:	06070a63          	beqz	a4,7724 <__swsetup_r+0xa8>
    76b4:	01042703          	lw	a4,16(s0)
    76b8:	08070663          	beqz	a4,7744 <__swsetup_r+0xc8>
    76bc:	0017f693          	and	a3,a5,1
    76c0:	02068863          	beqz	a3,76f0 <__swsetup_r+0x74>
    76c4:	01442683          	lw	a3,20(s0)
    76c8:	00042423          	sw	zero,8(s0)
    76cc:	00000513          	li	a0,0
    76d0:	40d006b3          	neg	a3,a3
    76d4:	00d42c23          	sw	a3,24(s0)
    76d8:	02070a63          	beqz	a4,770c <__swsetup_r+0x90>
    76dc:	00c12083          	lw	ra,12(sp)
    76e0:	00812403          	lw	s0,8(sp)
    76e4:	00412483          	lw	s1,4(sp)
    76e8:	01010113          	add	sp,sp,16
    76ec:	00008067          	ret
    76f0:	0027f693          	and	a3,a5,2
    76f4:	00000613          	li	a2,0
    76f8:	00069463          	bnez	a3,7700 <__swsetup_r+0x84>
    76fc:	01442603          	lw	a2,20(s0)
    7700:	00c42423          	sw	a2,8(s0)
    7704:	00000513          	li	a0,0
    7708:	fc071ae3          	bnez	a4,76dc <__swsetup_r+0x60>
    770c:	0807f713          	and	a4,a5,128
    7710:	fc0706e3          	beqz	a4,76dc <__swsetup_r+0x60>
    7714:	0407e793          	or	a5,a5,64
    7718:	00f41623          	sh	a5,12(s0)
    771c:	fff00513          	li	a0,-1
    7720:	fbdff06f          	j	76dc <__swsetup_r+0x60>
    7724:	0107f713          	and	a4,a5,16
    7728:	08070063          	beqz	a4,77a8 <__swsetup_r+0x12c>
    772c:	0047f713          	and	a4,a5,4
    7730:	02071c63          	bnez	a4,7768 <__swsetup_r+0xec>
    7734:	01042703          	lw	a4,16(s0)
    7738:	0087e793          	or	a5,a5,8
    773c:	00f41623          	sh	a5,12(s0)
    7740:	f6071ee3          	bnez	a4,76bc <__swsetup_r+0x40>
    7744:	2807f693          	and	a3,a5,640
    7748:	20000613          	li	a2,512
    774c:	f6c688e3          	beq	a3,a2,76bc <__swsetup_r+0x40>
    7750:	00040593          	mv	a1,s0
    7754:	00048513          	mv	a0,s1
    7758:	6cc030ef          	jal	ae24 <__smakebuf_r>
    775c:	00c41783          	lh	a5,12(s0)
    7760:	01042703          	lw	a4,16(s0)
    7764:	f59ff06f          	j	76bc <__swsetup_r+0x40>
    7768:	03042583          	lw	a1,48(s0)
    776c:	00058e63          	beqz	a1,7788 <__swsetup_r+0x10c>
    7770:	04040713          	add	a4,s0,64
    7774:	00e58863          	beq	a1,a4,7784 <__swsetup_r+0x108>
    7778:	00048513          	mv	a0,s1
    777c:	cf1f90ef          	jal	146c <_free_r>
    7780:	00c41783          	lh	a5,12(s0)
    7784:	02042823          	sw	zero,48(s0)
    7788:	01042703          	lw	a4,16(s0)
    778c:	fdb7f793          	and	a5,a5,-37
    7790:	00042223          	sw	zero,4(s0)
    7794:	00e42023          	sw	a4,0(s0)
    7798:	fa1ff06f          	j	7738 <__swsetup_r+0xbc>
    779c:	00078513          	mv	a0,a5
    77a0:	c9cff0ef          	jal	6c3c <__sinit>
    77a4:	f05ff06f          	j	76a8 <__swsetup_r+0x2c>
    77a8:	00900713          	li	a4,9
    77ac:	00e4a023          	sw	a4,0(s1)
    77b0:	0407e793          	or	a5,a5,64
    77b4:	00f41623          	sh	a5,12(s0)
    77b8:	fff00513          	li	a0,-1
    77bc:	f21ff06f          	j	76dc <__swsetup_r+0x60>

000077c0 <__fputwc>:
    77c0:	fc010113          	add	sp,sp,-64
    77c4:	02812c23          	sw	s0,56(sp)
    77c8:	03412423          	sw	s4,40(sp)
    77cc:	03512223          	sw	s5,36(sp)
    77d0:	02112e23          	sw	ra,60(sp)
    77d4:	02912a23          	sw	s1,52(sp)
    77d8:	03312623          	sw	s3,44(sp)
    77dc:	00050a13          	mv	s4,a0
    77e0:	00058a93          	mv	s5,a1
    77e4:	00060413          	mv	s0,a2
    77e8:	374000ef          	jal	7b5c <__locale_mb_cur_max>
    77ec:	00100793          	li	a5,1
    77f0:	02f51663          	bne	a0,a5,781c <__fputwc+0x5c>
    77f4:	fffa8793          	add	a5,s5,-1
    77f8:	0fe00713          	li	a4,254
    77fc:	02f76063          	bltu	a4,a5,781c <__fputwc+0x5c>
    7800:	03212823          	sw	s2,48(sp)
    7804:	03612023          	sw	s6,32(sp)
    7808:	01712e23          	sw	s7,28(sp)
    780c:	01510423          	sb	s5,8(sp)
    7810:	00100993          	li	s3,1
    7814:	00810493          	add	s1,sp,8
    7818:	0380006f          	j	7850 <__fputwc+0x90>
    781c:	00810493          	add	s1,sp,8
    7820:	05c40693          	add	a3,s0,92
    7824:	000a8613          	mv	a2,s5
    7828:	00048593          	mv	a1,s1
    782c:	000a0513          	mv	a0,s4
    7830:	3e8030ef          	jal	ac18 <_wcrtomb_r>
    7834:	fff00793          	li	a5,-1
    7838:	00050993          	mv	s3,a0
    783c:	0cf50a63          	beq	a0,a5,7910 <__fputwc+0x150>
    7840:	0a050663          	beqz	a0,78ec <__fputwc+0x12c>
    7844:	03212823          	sw	s2,48(sp)
    7848:	03612023          	sw	s6,32(sp)
    784c:	01712e23          	sw	s7,28(sp)
    7850:	00000913          	li	s2,0
    7854:	fff00b13          	li	s6,-1
    7858:	00a00b93          	li	s7,10
    785c:	0200006f          	j	787c <__fputwc+0xbc>
    7860:	00042783          	lw	a5,0(s0)
    7864:	00178693          	add	a3,a5,1
    7868:	00d42023          	sw	a3,0(s0)
    786c:	00e78023          	sb	a4,0(a5)
    7870:	00190913          	add	s2,s2,1
    7874:	00148493          	add	s1,s1,1
    7878:	07397463          	bgeu	s2,s3,78e0 <__fputwc+0x120>
    787c:	00842783          	lw	a5,8(s0)
    7880:	0004c703          	lbu	a4,0(s1)
    7884:	fff78793          	add	a5,a5,-1
    7888:	00f42423          	sw	a5,8(s0)
    788c:	fc07dae3          	bgez	a5,7860 <__fputwc+0xa0>
    7890:	01842683          	lw	a3,24(s0)
    7894:	00040613          	mv	a2,s0
    7898:	00070593          	mv	a1,a4
    789c:	000a0513          	mv	a0,s4
    78a0:	00d7c463          	blt	a5,a3,78a8 <__fputwc+0xe8>
    78a4:	fb771ee3          	bne	a4,s7,7860 <__fputwc+0xa0>
    78a8:	c45ff0ef          	jal	74ec <__swbuf_r>
    78ac:	fd6512e3          	bne	a0,s6,7870 <__fputwc+0xb0>
    78b0:	03012903          	lw	s2,48(sp)
    78b4:	02012b03          	lw	s6,32(sp)
    78b8:	01c12b83          	lw	s7,28(sp)
    78bc:	03c12083          	lw	ra,60(sp)
    78c0:	03812403          	lw	s0,56(sp)
    78c4:	03412483          	lw	s1,52(sp)
    78c8:	02c12983          	lw	s3,44(sp)
    78cc:	02812a03          	lw	s4,40(sp)
    78d0:	02412a83          	lw	s5,36(sp)
    78d4:	fff00513          	li	a0,-1
    78d8:	04010113          	add	sp,sp,64
    78dc:	00008067          	ret
    78e0:	03012903          	lw	s2,48(sp)
    78e4:	02012b03          	lw	s6,32(sp)
    78e8:	01c12b83          	lw	s7,28(sp)
    78ec:	03c12083          	lw	ra,60(sp)
    78f0:	03812403          	lw	s0,56(sp)
    78f4:	03412483          	lw	s1,52(sp)
    78f8:	02c12983          	lw	s3,44(sp)
    78fc:	02812a03          	lw	s4,40(sp)
    7900:	000a8513          	mv	a0,s5
    7904:	02412a83          	lw	s5,36(sp)
    7908:	04010113          	add	sp,sp,64
    790c:	00008067          	ret
    7910:	00c45783          	lhu	a5,12(s0)
    7914:	0407e793          	or	a5,a5,64
    7918:	00f41623          	sh	a5,12(s0)
    791c:	fa1ff06f          	j	78bc <__fputwc+0xfc>

00007920 <_fputwc_r>:
    7920:	06462783          	lw	a5,100(a2)
    7924:	fe010113          	add	sp,sp,-32
    7928:	00812c23          	sw	s0,24(sp)
    792c:	00912a23          	sw	s1,20(sp)
    7930:	0017f713          	and	a4,a5,1
    7934:	00112e23          	sw	ra,28(sp)
    7938:	00c61783          	lh	a5,12(a2)
    793c:	00060413          	mv	s0,a2
    7940:	00050493          	mv	s1,a0
    7944:	00071663          	bnez	a4,7950 <_fputwc_r+0x30>
    7948:	2007f713          	and	a4,a5,512
    794c:	08070463          	beqz	a4,79d4 <_fputwc_r+0xb4>
    7950:	01279713          	sll	a4,a5,0x12
    7954:	02074063          	bltz	a4,7974 <_fputwc_r+0x54>
    7958:	06442703          	lw	a4,100(s0)
    795c:	000026b7          	lui	a3,0x2
    7960:	00d7e7b3          	or	a5,a5,a3
    7964:	000026b7          	lui	a3,0x2
    7968:	00d76733          	or	a4,a4,a3
    796c:	00f41623          	sh	a5,12(s0)
    7970:	06e42223          	sw	a4,100(s0)
    7974:	00048513          	mv	a0,s1
    7978:	00040613          	mv	a2,s0
    797c:	e45ff0ef          	jal	77c0 <__fputwc>
    7980:	06442783          	lw	a5,100(s0)
    7984:	00050493          	mv	s1,a0
    7988:	0017f793          	and	a5,a5,1
    798c:	00079863          	bnez	a5,799c <_fputwc_r+0x7c>
    7990:	00c45783          	lhu	a5,12(s0)
    7994:	2007f793          	and	a5,a5,512
    7998:	00078e63          	beqz	a5,79b4 <_fputwc_r+0x94>
    799c:	01c12083          	lw	ra,28(sp)
    79a0:	01812403          	lw	s0,24(sp)
    79a4:	00048513          	mv	a0,s1
    79a8:	01412483          	lw	s1,20(sp)
    79ac:	02010113          	add	sp,sp,32
    79b0:	00008067          	ret
    79b4:	05842503          	lw	a0,88(s0)
    79b8:	e60f90ef          	jal	1018 <__retarget_lock_release_recursive>
    79bc:	01c12083          	lw	ra,28(sp)
    79c0:	01812403          	lw	s0,24(sp)
    79c4:	00048513          	mv	a0,s1
    79c8:	01412483          	lw	s1,20(sp)
    79cc:	02010113          	add	sp,sp,32
    79d0:	00008067          	ret
    79d4:	05862503          	lw	a0,88(a2)
    79d8:	00b12623          	sw	a1,12(sp)
    79dc:	e38f90ef          	jal	1014 <__retarget_lock_acquire_recursive>
    79e0:	00c41783          	lh	a5,12(s0)
    79e4:	00c12583          	lw	a1,12(sp)
    79e8:	f69ff06f          	j	7950 <_fputwc_r+0x30>

000079ec <memchr>:
    79ec:	00357793          	and	a5,a0,3
    79f0:	0ff5f693          	zext.b	a3,a1
    79f4:	02078a63          	beqz	a5,7a28 <memchr+0x3c>
    79f8:	fff60793          	add	a5,a2,-1
    79fc:	02060e63          	beqz	a2,7a38 <memchr+0x4c>
    7a00:	fff00613          	li	a2,-1
    7a04:	0180006f          	j	7a1c <memchr+0x30>
    7a08:	00150513          	add	a0,a0,1
    7a0c:	00357713          	and	a4,a0,3
    7a10:	00070e63          	beqz	a4,7a2c <memchr+0x40>
    7a14:	fff78793          	add	a5,a5,-1
    7a18:	02c78063          	beq	a5,a2,7a38 <memchr+0x4c>
    7a1c:	00054703          	lbu	a4,0(a0)
    7a20:	fed714e3          	bne	a4,a3,7a08 <memchr+0x1c>
    7a24:	00008067          	ret
    7a28:	00060793          	mv	a5,a2
    7a2c:	00300713          	li	a4,3
    7a30:	00f76863          	bltu	a4,a5,7a40 <memchr+0x54>
    7a34:	06079063          	bnez	a5,7a94 <memchr+0xa8>
    7a38:	00000513          	li	a0,0
    7a3c:	00008067          	ret
    7a40:	0ff5f593          	zext.b	a1,a1
    7a44:	00859713          	sll	a4,a1,0x8
    7a48:	00b705b3          	add	a1,a4,a1
    7a4c:	01059713          	sll	a4,a1,0x10
    7a50:	feff08b7          	lui	a7,0xfeff0
    7a54:	80808837          	lui	a6,0x80808
    7a58:	00e585b3          	add	a1,a1,a4
    7a5c:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7a60:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7a64:	00300313          	li	t1,3
    7a68:	0100006f          	j	7a78 <memchr+0x8c>
    7a6c:	ffc78793          	add	a5,a5,-4
    7a70:	00450513          	add	a0,a0,4
    7a74:	fcf370e3          	bgeu	t1,a5,7a34 <memchr+0x48>
    7a78:	00052703          	lw	a4,0(a0)
    7a7c:	00e5c733          	xor	a4,a1,a4
    7a80:	01170633          	add	a2,a4,a7
    7a84:	fff74713          	not	a4,a4
    7a88:	00e67733          	and	a4,a2,a4
    7a8c:	01077733          	and	a4,a4,a6
    7a90:	fc070ee3          	beqz	a4,7a6c <memchr+0x80>
    7a94:	00f507b3          	add	a5,a0,a5
    7a98:	00c0006f          	j	7aa4 <memchr+0xb8>
    7a9c:	00150513          	add	a0,a0,1
    7aa0:	f8f50ce3          	beq	a0,a5,7a38 <memchr+0x4c>
    7aa4:	00054703          	lbu	a4,0(a0)
    7aa8:	fed71ae3          	bne	a4,a3,7a9c <memchr+0xb0>
    7aac:	00008067          	ret

00007ab0 <strncpy>:
    7ab0:	00a5e7b3          	or	a5,a1,a0
    7ab4:	0037f793          	and	a5,a5,3
    7ab8:	00079663          	bnez	a5,7ac4 <strncpy+0x14>
    7abc:	00300793          	li	a5,3
    7ac0:	04c7e663          	bltu	a5,a2,7b0c <strncpy+0x5c>
    7ac4:	00050713          	mv	a4,a0
    7ac8:	01c0006f          	j	7ae4 <strncpy+0x34>
    7acc:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x8f>
    7ad0:	fff60813          	add	a6,a2,-1
    7ad4:	fed78fa3          	sb	a3,-1(a5)
    7ad8:	00068e63          	beqz	a3,7af4 <strncpy+0x44>
    7adc:	00078713          	mv	a4,a5
    7ae0:	00080613          	mv	a2,a6
    7ae4:	00158593          	add	a1,a1,1
    7ae8:	00170793          	add	a5,a4,1
    7aec:	fe0610e3          	bnez	a2,7acc <strncpy+0x1c>
    7af0:	00008067          	ret
    7af4:	00c70733          	add	a4,a4,a2
    7af8:	06080063          	beqz	a6,7b58 <strncpy+0xa8>
    7afc:	00178793          	add	a5,a5,1
    7b00:	fe078fa3          	sb	zero,-1(a5)
    7b04:	fee79ce3          	bne	a5,a4,7afc <strncpy+0x4c>
    7b08:	00008067          	ret
    7b0c:	feff0337          	lui	t1,0xfeff0
    7b10:	808088b7          	lui	a7,0x80808
    7b14:	00050713          	mv	a4,a0
    7b18:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7b1c:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7b20:	00300e13          	li	t3,3
    7b24:	0180006f          	j	7b3c <strncpy+0x8c>
    7b28:	00d72023          	sw	a3,0(a4)
    7b2c:	ffc60613          	add	a2,a2,-4
    7b30:	00470713          	add	a4,a4,4
    7b34:	00458593          	add	a1,a1,4
    7b38:	face76e3          	bgeu	t3,a2,7ae4 <strncpy+0x34>
    7b3c:	0005a683          	lw	a3,0(a1)
    7b40:	006687b3          	add	a5,a3,t1
    7b44:	fff6c813          	not	a6,a3
    7b48:	0107f7b3          	and	a5,a5,a6
    7b4c:	0117f7b3          	and	a5,a5,a7
    7b50:	fc078ce3          	beqz	a5,7b28 <strncpy+0x78>
    7b54:	f91ff06f          	j	7ae4 <strncpy+0x34>
    7b58:	00008067          	ret

00007b5c <__locale_mb_cur_max>:
    7b5c:	7fff9517          	auipc	a0,0x7fff9
    7b60:	b0054503          	lbu	a0,-1280(a0) # 8000065c <__global_locale+0x128>
    7b64:	00008067          	ret

00007b68 <_localeconv_r>:
    7b68:	7fff9517          	auipc	a0,0x7fff9
    7b6c:	abc50513          	add	a0,a0,-1348 # 80000624 <__global_locale+0xf0>
    7b70:	00008067          	ret

00007b74 <_close_r>:
    7b74:	ff010113          	add	sp,sp,-16
    7b78:	00812423          	sw	s0,8(sp)
    7b7c:	00050413          	mv	s0,a0
    7b80:	00058513          	mv	a0,a1
    7b84:	7fff9797          	auipc	a5,0x7fff9
    7b88:	b807ac23          	sw	zero,-1128(a5) # 8000071c <errno>
    7b8c:	00112623          	sw	ra,12(sp)
    7b90:	85cf90ef          	jal	bec <_close>
    7b94:	fff00793          	li	a5,-1
    7b98:	00f50a63          	beq	a0,a5,7bac <_close_r+0x38>
    7b9c:	00c12083          	lw	ra,12(sp)
    7ba0:	00812403          	lw	s0,8(sp)
    7ba4:	01010113          	add	sp,sp,16
    7ba8:	00008067          	ret
    7bac:	7fff9797          	auipc	a5,0x7fff9
    7bb0:	b707a783          	lw	a5,-1168(a5) # 8000071c <errno>
    7bb4:	fe0784e3          	beqz	a5,7b9c <_close_r+0x28>
    7bb8:	00c12083          	lw	ra,12(sp)
    7bbc:	00f42023          	sw	a5,0(s0)
    7bc0:	00812403          	lw	s0,8(sp)
    7bc4:	01010113          	add	sp,sp,16
    7bc8:	00008067          	ret

00007bcc <_lseek_r>:
    7bcc:	ff010113          	add	sp,sp,-16
    7bd0:	00058713          	mv	a4,a1
    7bd4:	00812423          	sw	s0,8(sp)
    7bd8:	00060593          	mv	a1,a2
    7bdc:	00050413          	mv	s0,a0
    7be0:	00068613          	mv	a2,a3
    7be4:	00070513          	mv	a0,a4
    7be8:	7fff9797          	auipc	a5,0x7fff9
    7bec:	b207aa23          	sw	zero,-1228(a5) # 8000071c <errno>
    7bf0:	00112623          	sw	ra,12(sp)
    7bf4:	834f90ef          	jal	c28 <_lseek>
    7bf8:	fff00793          	li	a5,-1
    7bfc:	00f50a63          	beq	a0,a5,7c10 <_lseek_r+0x44>
    7c00:	00c12083          	lw	ra,12(sp)
    7c04:	00812403          	lw	s0,8(sp)
    7c08:	01010113          	add	sp,sp,16
    7c0c:	00008067          	ret
    7c10:	7fff9797          	auipc	a5,0x7fff9
    7c14:	b0c7a783          	lw	a5,-1268(a5) # 8000071c <errno>
    7c18:	fe0784e3          	beqz	a5,7c00 <_lseek_r+0x34>
    7c1c:	00c12083          	lw	ra,12(sp)
    7c20:	00f42023          	sw	a5,0(s0)
    7c24:	00812403          	lw	s0,8(sp)
    7c28:	01010113          	add	sp,sp,16
    7c2c:	00008067          	ret

00007c30 <_read_r>:
    7c30:	ff010113          	add	sp,sp,-16
    7c34:	00058713          	mv	a4,a1
    7c38:	00812423          	sw	s0,8(sp)
    7c3c:	00060593          	mv	a1,a2
    7c40:	00050413          	mv	s0,a0
    7c44:	00068613          	mv	a2,a3
    7c48:	00070513          	mv	a0,a4
    7c4c:	7fff9797          	auipc	a5,0x7fff9
    7c50:	ac07a823          	sw	zero,-1328(a5) # 8000071c <errno>
    7c54:	00112623          	sw	ra,12(sp)
    7c58:	fd9f80ef          	jal	c30 <_read>
    7c5c:	fff00793          	li	a5,-1
    7c60:	00f50a63          	beq	a0,a5,7c74 <_read_r+0x44>
    7c64:	00c12083          	lw	ra,12(sp)
    7c68:	00812403          	lw	s0,8(sp)
    7c6c:	01010113          	add	sp,sp,16
    7c70:	00008067          	ret
    7c74:	7fff9797          	auipc	a5,0x7fff9
    7c78:	aa87a783          	lw	a5,-1368(a5) # 8000071c <errno>
    7c7c:	fe0784e3          	beqz	a5,7c64 <_read_r+0x34>
    7c80:	00c12083          	lw	ra,12(sp)
    7c84:	00f42023          	sw	a5,0(s0)
    7c88:	00812403          	lw	s0,8(sp)
    7c8c:	01010113          	add	sp,sp,16
    7c90:	00008067          	ret

00007c94 <_sbrk_r>:
    7c94:	ff010113          	add	sp,sp,-16
    7c98:	00812423          	sw	s0,8(sp)
    7c9c:	00050413          	mv	s0,a0
    7ca0:	00058513          	mv	a0,a1
    7ca4:	7fff9797          	auipc	a5,0x7fff9
    7ca8:	a607ac23          	sw	zero,-1416(a5) # 8000071c <errno>
    7cac:	00112623          	sw	ra,12(sp)
    7cb0:	900f90ef          	jal	db0 <_sbrk>
    7cb4:	fff00793          	li	a5,-1
    7cb8:	00f50a63          	beq	a0,a5,7ccc <_sbrk_r+0x38>
    7cbc:	00c12083          	lw	ra,12(sp)
    7cc0:	00812403          	lw	s0,8(sp)
    7cc4:	01010113          	add	sp,sp,16
    7cc8:	00008067          	ret
    7ccc:	7fff9797          	auipc	a5,0x7fff9
    7cd0:	a507a783          	lw	a5,-1456(a5) # 8000071c <errno>
    7cd4:	fe0784e3          	beqz	a5,7cbc <_sbrk_r+0x28>
    7cd8:	00c12083          	lw	ra,12(sp)
    7cdc:	00f42023          	sw	a5,0(s0)
    7ce0:	00812403          	lw	s0,8(sp)
    7ce4:	01010113          	add	sp,sp,16
    7ce8:	00008067          	ret

00007cec <_write_r>:
    7cec:	ff010113          	add	sp,sp,-16
    7cf0:	00058713          	mv	a4,a1
    7cf4:	00812423          	sw	s0,8(sp)
    7cf8:	00060593          	mv	a1,a2
    7cfc:	00050413          	mv	s0,a0
    7d00:	00068613          	mv	a2,a3
    7d04:	00070513          	mv	a0,a4
    7d08:	7fff9797          	auipc	a5,0x7fff9
    7d0c:	a007aa23          	sw	zero,-1516(a5) # 8000071c <errno>
    7d10:	00112623          	sw	ra,12(sp)
    7d14:	ff9f80ef          	jal	d0c <_write>
    7d18:	fff00793          	li	a5,-1
    7d1c:	00f50a63          	beq	a0,a5,7d30 <_write_r+0x44>
    7d20:	00c12083          	lw	ra,12(sp)
    7d24:	00812403          	lw	s0,8(sp)
    7d28:	01010113          	add	sp,sp,16
    7d2c:	00008067          	ret
    7d30:	7fff9797          	auipc	a5,0x7fff9
    7d34:	9ec7a783          	lw	a5,-1556(a5) # 8000071c <errno>
    7d38:	fe0784e3          	beqz	a5,7d20 <_write_r+0x34>
    7d3c:	00c12083          	lw	ra,12(sp)
    7d40:	00f42023          	sw	a5,0(s0)
    7d44:	00812403          	lw	s0,8(sp)
    7d48:	01010113          	add	sp,sp,16
    7d4c:	00008067          	ret

00007d50 <memmove>:
    7d50:	02a5f663          	bgeu	a1,a0,7d7c <memmove+0x2c>
    7d54:	00c58733          	add	a4,a1,a2
    7d58:	02e57263          	bgeu	a0,a4,7d7c <memmove+0x2c>
    7d5c:	00c507b3          	add	a5,a0,a2
    7d60:	04060663          	beqz	a2,7dac <memmove+0x5c>
    7d64:	fff74683          	lbu	a3,-1(a4)
    7d68:	fff78793          	add	a5,a5,-1
    7d6c:	fff70713          	add	a4,a4,-1
    7d70:	00d78023          	sb	a3,0(a5)
    7d74:	fef518e3          	bne	a0,a5,7d64 <memmove+0x14>
    7d78:	00008067          	ret
    7d7c:	00f00793          	li	a5,15
    7d80:	02c7e863          	bltu	a5,a2,7db0 <memmove+0x60>
    7d84:	00050793          	mv	a5,a0
    7d88:	fff60693          	add	a3,a2,-1
    7d8c:	0c060263          	beqz	a2,7e50 <memmove+0x100>
    7d90:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x91>
    7d94:	00d786b3          	add	a3,a5,a3
    7d98:	0005c703          	lbu	a4,0(a1)
    7d9c:	00178793          	add	a5,a5,1
    7da0:	00158593          	add	a1,a1,1
    7da4:	fee78fa3          	sb	a4,-1(a5)
    7da8:	fed798e3          	bne	a5,a3,7d98 <memmove+0x48>
    7dac:	00008067          	ret
    7db0:	00b567b3          	or	a5,a0,a1
    7db4:	0037f793          	and	a5,a5,3
    7db8:	08079663          	bnez	a5,7e44 <memmove+0xf4>
    7dbc:	ff060893          	add	a7,a2,-16
    7dc0:	ff08f893          	and	a7,a7,-16
    7dc4:	01088893          	add	a7,a7,16
    7dc8:	011506b3          	add	a3,a0,a7
    7dcc:	00058713          	mv	a4,a1
    7dd0:	00050793          	mv	a5,a0
    7dd4:	00072803          	lw	a6,0(a4)
    7dd8:	01070713          	add	a4,a4,16
    7ddc:	01078793          	add	a5,a5,16
    7de0:	ff07a823          	sw	a6,-16(a5)
    7de4:	ff472803          	lw	a6,-12(a4)
    7de8:	ff07aa23          	sw	a6,-12(a5)
    7dec:	ff872803          	lw	a6,-8(a4)
    7df0:	ff07ac23          	sw	a6,-8(a5)
    7df4:	ffc72803          	lw	a6,-4(a4)
    7df8:	ff07ae23          	sw	a6,-4(a5)
    7dfc:	fcd79ce3          	bne	a5,a3,7dd4 <memmove+0x84>
    7e00:	00c67813          	and	a6,a2,12
    7e04:	011585b3          	add	a1,a1,a7
    7e08:	00f67713          	and	a4,a2,15
    7e0c:	04080463          	beqz	a6,7e54 <memmove+0x104>
    7e10:	ffc70813          	add	a6,a4,-4
    7e14:	ffc87813          	and	a6,a6,-4
    7e18:	00480813          	add	a6,a6,4
    7e1c:	010687b3          	add	a5,a3,a6
    7e20:	00058713          	mv	a4,a1
    7e24:	00072883          	lw	a7,0(a4)
    7e28:	00468693          	add	a3,a3,4
    7e2c:	00470713          	add	a4,a4,4
    7e30:	ff16ae23          	sw	a7,-4(a3)
    7e34:	fef698e3          	bne	a3,a5,7e24 <memmove+0xd4>
    7e38:	00367613          	and	a2,a2,3
    7e3c:	010585b3          	add	a1,a1,a6
    7e40:	f49ff06f          	j	7d88 <memmove+0x38>
    7e44:	fff60693          	add	a3,a2,-1
    7e48:	00050793          	mv	a5,a0
    7e4c:	f45ff06f          	j	7d90 <memmove+0x40>
    7e50:	00008067          	ret
    7e54:	00070613          	mv	a2,a4
    7e58:	f31ff06f          	j	7d88 <memmove+0x38>

00007e5c <frexp>:
    7e5c:	ff010113          	add	sp,sp,-16
    7e60:	00912223          	sw	s1,4(sp)
    7e64:	800004b7          	lui	s1,0x80000
    7e68:	00812423          	sw	s0,8(sp)
    7e6c:	00112623          	sw	ra,12(sp)
    7e70:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7e74:	00060413          	mv	s0,a2
    7e78:	00062023          	sw	zero,0(a2)
    7e7c:	00b4f6b3          	and	a3,s1,a1
    7e80:	7ff00637          	lui	a2,0x7ff00
    7e84:	00058793          	mv	a5,a1
    7e88:	00050713          	mv	a4,a0
    7e8c:	04c6f063          	bgeu	a3,a2,7ecc <frexp+0x70>
    7e90:	00a6e633          	or	a2,a3,a0
    7e94:	02060c63          	beqz	a2,7ecc <frexp+0x70>
    7e98:	0145d613          	srl	a2,a1,0x14
    7e9c:	7ff67613          	and	a2,a2,2047
    7ea0:	04060463          	beqz	a2,7ee8 <frexp+0x8c>
    7ea4:	00000593          	li	a1,0
    7ea8:	80100637          	lui	a2,0x80100
    7eac:	4146d693          	sra	a3,a3,0x14
    7eb0:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7eb4:	c0268693          	add	a3,a3,-1022
    7eb8:	00c7f7b3          	and	a5,a5,a2
    7ebc:	00b686b3          	add	a3,a3,a1
    7ec0:	3fe00637          	lui	a2,0x3fe00
    7ec4:	00c7e7b3          	or	a5,a5,a2
    7ec8:	00d42023          	sw	a3,0(s0)
    7ecc:	00c12083          	lw	ra,12(sp)
    7ed0:	00812403          	lw	s0,8(sp)
    7ed4:	00412483          	lw	s1,4(sp)
    7ed8:	00070513          	mv	a0,a4
    7edc:	00078593          	mv	a1,a5
    7ee0:	01010113          	add	sp,sp,16
    7ee4:	00008067          	ret
    7ee8:	7fff8797          	auipc	a5,0x7fff8
    7eec:	7d878793          	add	a5,a5,2008 # 800006c0 <__global_locale+0x18c>
    7ef0:	0047a683          	lw	a3,4(a5)
    7ef4:	0007a603          	lw	a2,0(a5)
    7ef8:	009050ef          	jal	d700 <__muldf3>
    7efc:	00058793          	mv	a5,a1
    7f00:	00b4f6b3          	and	a3,s1,a1
    7f04:	00050713          	mv	a4,a0
    7f08:	fca00593          	li	a1,-54
    7f0c:	f9dff06f          	j	7ea8 <frexp+0x4c>

00007f10 <quorem>:
    7f10:	fb010113          	add	sp,sp,-80
    7f14:	04912223          	sw	s1,68(sp)
    7f18:	01052783          	lw	a5,16(a0)
    7f1c:	0105a483          	lw	s1,16(a1)
    7f20:	04112623          	sw	ra,76(sp)
    7f24:	00b12423          	sw	a1,8(sp)
    7f28:	2097ca63          	blt	a5,s1,813c <quorem+0x22c>
    7f2c:	fff48493          	add	s1,s1,-1
    7f30:	03512a23          	sw	s5,52(sp)
    7f34:	03812423          	sw	s8,40(sp)
    7f38:	00249a93          	sll	s5,s1,0x2
    7f3c:	01458c13          	add	s8,a1,20
    7f40:	05212023          	sw	s2,64(sp)
    7f44:	03312e23          	sw	s3,60(sp)
    7f48:	015c0933          	add	s2,s8,s5
    7f4c:	01450993          	add	s3,a0,20
    7f50:	015987b3          	add	a5,s3,s5
    7f54:	03712623          	sw	s7,44(sp)
    7f58:	00092b83          	lw	s7,0(s2)
    7f5c:	03912223          	sw	s9,36(sp)
    7f60:	0007ac83          	lw	s9,0(a5)
    7f64:	001b8b93          	add	s7,s7,1
    7f68:	03412c23          	sw	s4,56(sp)
    7f6c:	000b8593          	mv	a1,s7
    7f70:	00050a13          	mv	s4,a0
    7f74:	000c8513          	mv	a0,s9
    7f78:	04812423          	sw	s0,72(sp)
    7f7c:	00f12623          	sw	a5,12(sp)
    7f80:	70d060ef          	jal	ee8c <__hidden___udivsi3>
    7f84:	00050413          	mv	s0,a0
    7f88:	0d7cee63          	bltu	s9,s7,8064 <quorem+0x154>
    7f8c:	03a12023          	sw	s10,32(sp)
    7f90:	00010d37          	lui	s10,0x10
    7f94:	01b12e23          	sw	s11,28(sp)
    7f98:	03612823          	sw	s6,48(sp)
    7f9c:	000c0a93          	mv	s5,s8
    7fa0:	00098d93          	mv	s11,s3
    7fa4:	00000c93          	li	s9,0
    7fa8:	00000b93          	li	s7,0
    7fac:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    7fb0:	000aab03          	lw	s6,0(s5)
    7fb4:	00040593          	mv	a1,s0
    7fb8:	004d8d93          	add	s11,s11,4
    7fbc:	01ab7533          	and	a0,s6,s10
    7fc0:	609060ef          	jal	edc8 <__mulsi3>
    7fc4:	00050793          	mv	a5,a0
    7fc8:	00040593          	mv	a1,s0
    7fcc:	010b5513          	srl	a0,s6,0x10
    7fd0:	01978cb3          	add	s9,a5,s9
    7fd4:	5f5060ef          	jal	edc8 <__mulsi3>
    7fd8:	ffcda603          	lw	a2,-4(s11)
    7fdc:	01acf733          	and	a4,s9,s10
    7fe0:	010cdc93          	srl	s9,s9,0x10
    7fe4:	01a677b3          	and	a5,a2,s10
    7fe8:	40e787b3          	sub	a5,a5,a4
    7fec:	017787b3          	add	a5,a5,s7
    7ff0:	01950533          	add	a0,a0,s9
    7ff4:	4107d713          	sra	a4,a5,0x10
    7ff8:	01a575b3          	and	a1,a0,s10
    7ffc:	01065613          	srl	a2,a2,0x10
    8000:	40b70733          	sub	a4,a4,a1
    8004:	00c70733          	add	a4,a4,a2
    8008:	01a7f7b3          	and	a5,a5,s10
    800c:	01071613          	sll	a2,a4,0x10
    8010:	00c7e7b3          	or	a5,a5,a2
    8014:	004a8a93          	add	s5,s5,4
    8018:	fefdae23          	sw	a5,-4(s11)
    801c:	01055c93          	srl	s9,a0,0x10
    8020:	41075b93          	sra	s7,a4,0x10
    8024:	f95976e3          	bgeu	s2,s5,7fb0 <quorem+0xa0>
    8028:	00c12703          	lw	a4,12(sp)
    802c:	00072783          	lw	a5,0(a4)
    8030:	12079063          	bnez	a5,8150 <quorem+0x240>
    8034:	ffc70a93          	add	s5,a4,-4
    8038:	0159e863          	bltu	s3,s5,8048 <quorem+0x138>
    803c:	0180006f          	j	8054 <quorem+0x144>
    8040:	fff48493          	add	s1,s1,-1
    8044:	0159f863          	bgeu	s3,s5,8054 <quorem+0x144>
    8048:	000aa783          	lw	a5,0(s5)
    804c:	ffca8a93          	add	s5,s5,-4
    8050:	fe0788e3          	beqz	a5,8040 <quorem+0x130>
    8054:	03012b03          	lw	s6,48(sp)
    8058:	02012d03          	lw	s10,32(sp)
    805c:	01c12d83          	lw	s11,28(sp)
    8060:	009a2823          	sw	s1,16(s4)
    8064:	00812583          	lw	a1,8(sp)
    8068:	000a0513          	mv	a0,s4
    806c:	1fc020ef          	jal	a268 <__mcmp>
    8070:	08054c63          	bltz	a0,8108 <quorem+0x1f8>
    8074:	00010537          	lui	a0,0x10
    8078:	00098593          	mv	a1,s3
    807c:	00000713          	li	a4,0
    8080:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    8084:	0005a683          	lw	a3,0(a1)
    8088:	000c2603          	lw	a2,0(s8)
    808c:	00458593          	add	a1,a1,4
    8090:	00a6f7b3          	and	a5,a3,a0
    8094:	00a67833          	and	a6,a2,a0
    8098:	410787b3          	sub	a5,a5,a6
    809c:	00e787b3          	add	a5,a5,a4
    80a0:	4107d713          	sra	a4,a5,0x10
    80a4:	01065613          	srl	a2,a2,0x10
    80a8:	0106d693          	srl	a3,a3,0x10
    80ac:	40c70733          	sub	a4,a4,a2
    80b0:	00d70733          	add	a4,a4,a3
    80b4:	01071693          	sll	a3,a4,0x10
    80b8:	00a7f7b3          	and	a5,a5,a0
    80bc:	00d7e7b3          	or	a5,a5,a3
    80c0:	004c0c13          	add	s8,s8,4
    80c4:	fef5ae23          	sw	a5,-4(a1)
    80c8:	41075713          	sra	a4,a4,0x10
    80cc:	fb897ce3          	bgeu	s2,s8,8084 <quorem+0x174>
    80d0:	00249793          	sll	a5,s1,0x2
    80d4:	00f987b3          	add	a5,s3,a5
    80d8:	0007a703          	lw	a4,0(a5)
    80dc:	02071463          	bnez	a4,8104 <quorem+0x1f4>
    80e0:	ffc78793          	add	a5,a5,-4
    80e4:	00f9e863          	bltu	s3,a5,80f4 <quorem+0x1e4>
    80e8:	0180006f          	j	8100 <quorem+0x1f0>
    80ec:	fff48493          	add	s1,s1,-1
    80f0:	00f9f863          	bgeu	s3,a5,8100 <quorem+0x1f0>
    80f4:	0007a703          	lw	a4,0(a5)
    80f8:	ffc78793          	add	a5,a5,-4
    80fc:	fe0708e3          	beqz	a4,80ec <quorem+0x1dc>
    8100:	009a2823          	sw	s1,16(s4)
    8104:	00140413          	add	s0,s0,1
    8108:	04c12083          	lw	ra,76(sp)
    810c:	00040513          	mv	a0,s0
    8110:	04812403          	lw	s0,72(sp)
    8114:	04012903          	lw	s2,64(sp)
    8118:	03c12983          	lw	s3,60(sp)
    811c:	03812a03          	lw	s4,56(sp)
    8120:	03412a83          	lw	s5,52(sp)
    8124:	02c12b83          	lw	s7,44(sp)
    8128:	02812c03          	lw	s8,40(sp)
    812c:	02412c83          	lw	s9,36(sp)
    8130:	04412483          	lw	s1,68(sp)
    8134:	05010113          	add	sp,sp,80
    8138:	00008067          	ret
    813c:	04c12083          	lw	ra,76(sp)
    8140:	04412483          	lw	s1,68(sp)
    8144:	00000513          	li	a0,0
    8148:	05010113          	add	sp,sp,80
    814c:	00008067          	ret
    8150:	00812583          	lw	a1,8(sp)
    8154:	000a0513          	mv	a0,s4
    8158:	03012b03          	lw	s6,48(sp)
    815c:	02012d03          	lw	s10,32(sp)
    8160:	01c12d83          	lw	s11,28(sp)
    8164:	104020ef          	jal	a268 <__mcmp>
    8168:	f00556e3          	bgez	a0,8074 <quorem+0x164>
    816c:	f9dff06f          	j	8108 <quorem+0x1f8>

00008170 <_dtoa_r>:
    8170:	03852303          	lw	t1,56(a0)
    8174:	f5010113          	add	sp,sp,-176
    8178:	0a812423          	sw	s0,168(sp)
    817c:	0a912223          	sw	s1,164(sp)
    8180:	0b212023          	sw	s2,160(sp)
    8184:	09412c23          	sw	s4,152(sp)
    8188:	07b12e23          	sw	s11,124(sp)
    818c:	0a112623          	sw	ra,172(sp)
    8190:	09312e23          	sw	s3,156(sp)
    8194:	09512a23          	sw	s5,148(sp)
    8198:	00e12a23          	sw	a4,20(sp)
    819c:	00f12623          	sw	a5,12(sp)
    81a0:	01112423          	sw	a7,8(sp)
    81a4:	02b12223          	sw	a1,36(sp)
    81a8:	00c12023          	sw	a2,0(sp)
    81ac:	00050413          	mv	s0,a0
    81b0:	00058d93          	mv	s11,a1
    81b4:	00060493          	mv	s1,a2
    81b8:	00068a13          	mv	s4,a3
    81bc:	00080913          	mv	s2,a6
    81c0:	02030263          	beqz	t1,81e4 <_dtoa_r+0x74>
    81c4:	03c52703          	lw	a4,60(a0)
    81c8:	00100793          	li	a5,1
    81cc:	00030593          	mv	a1,t1
    81d0:	00e797b3          	sll	a5,a5,a4
    81d4:	00e32223          	sw	a4,4(t1)
    81d8:	00f32423          	sw	a5,8(t1)
    81dc:	734010ef          	jal	9910 <_Bfree>
    81e0:	02042c23          	sw	zero,56(s0)
    81e4:	00048993          	mv	s3,s1
    81e8:	00000693          	li	a3,0
    81ec:	0004dc63          	bgez	s1,8204 <_dtoa_r+0x94>
    81f0:	00149493          	sll	s1,s1,0x1
    81f4:	0014d793          	srl	a5,s1,0x1
    81f8:	00f12023          	sw	a5,0(sp)
    81fc:	00078993          	mv	s3,a5
    8200:	00100693          	li	a3,1
    8204:	7ff00737          	lui	a4,0x7ff00
    8208:	00d92023          	sw	a3,0(s2)
    820c:	00e9f6b3          	and	a3,s3,a4
    8210:	64e68463          	beq	a3,a4,8858 <_dtoa_r+0x6e8>
    8214:	00012483          	lw	s1,0(sp)
    8218:	000d8513          	mv	a0,s11
    821c:	00000613          	li	a2,0
    8220:	00048593          	mv	a1,s1
    8224:	00000693          	li	a3,0
    8228:	01b12c23          	sw	s11,24(sp)
    822c:	00912e23          	sw	s1,28(sp)
    8230:	23c050ef          	jal	d46c <__eqdf2>
    8234:	04051c63          	bnez	a0,828c <_dtoa_r+0x11c>
    8238:	00c12703          	lw	a4,12(sp)
    823c:	00100793          	li	a5,1
    8240:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    8244:	00812703          	lw	a4,8(sp)
    8248:	00070863          	beqz	a4,8258 <_dtoa_r+0xe8>
    824c:	00007797          	auipc	a5,0x7
    8250:	f7178793          	add	a5,a5,-143 # f1bd <__fini_array_end+0x1fd>
    8254:	00f72023          	sw	a5,0(a4)
    8258:	00007a97          	auipc	s5,0x7
    825c:	f64a8a93          	add	s5,s5,-156 # f1bc <__fini_array_end+0x1fc>
    8260:	0ac12083          	lw	ra,172(sp)
    8264:	0a812403          	lw	s0,168(sp)
    8268:	0a412483          	lw	s1,164(sp)
    826c:	0a012903          	lw	s2,160(sp)
    8270:	09c12983          	lw	s3,156(sp)
    8274:	09812a03          	lw	s4,152(sp)
    8278:	07c12d83          	lw	s11,124(sp)
    827c:	000a8513          	mv	a0,s5
    8280:	09412a83          	lw	s5,148(sp)
    8284:	0b010113          	add	sp,sp,176
    8288:	00008067          	ret
    828c:	00048613          	mv	a2,s1
    8290:	06810713          	add	a4,sp,104
    8294:	06c10693          	add	a3,sp,108
    8298:	000d8593          	mv	a1,s11
    829c:	00040513          	mv	a0,s0
    82a0:	09612823          	sw	s6,144(sp)
    82a4:	09712623          	sw	s7,140(sp)
    82a8:	09812423          	sw	s8,136(sp)
    82ac:	09912223          	sw	s9,132(sp)
    82b0:	09a12023          	sw	s10,128(sp)
    82b4:	0149d913          	srl	s2,s3,0x14
    82b8:	268020ef          	jal	a520 <__d2b>
    82bc:	00050493          	mv	s1,a0
    82c0:	5c091e63          	bnez	s2,889c <_dtoa_r+0x72c>
    82c4:	06812a83          	lw	s5,104(sp)
    82c8:	06c12903          	lw	s2,108(sp)
    82cc:	02000793          	li	a5,32
    82d0:	012a8933          	add	s2,s5,s2
    82d4:	43290713          	add	a4,s2,1074
    82d8:	36e7dae3          	bge	a5,a4,8e4c <_dtoa_r+0xcdc>
    82dc:	04000793          	li	a5,64
    82e0:	40e787b3          	sub	a5,a5,a4
    82e4:	41290513          	add	a0,s2,1042
    82e8:	00f997b3          	sll	a5,s3,a5
    82ec:	00add533          	srl	a0,s11,a0
    82f0:	00a7e533          	or	a0,a5,a0
    82f4:	634060ef          	jal	e928 <__floatunsidf>
    82f8:	fe1007b7          	lui	a5,0xfe100
    82fc:	00100693          	li	a3,1
    8300:	00050713          	mv	a4,a0
    8304:	00b787b3          	add	a5,a5,a1
    8308:	fff90913          	add	s2,s2,-1
    830c:	02d12c23          	sw	a3,56(sp)
    8310:	7fff8697          	auipc	a3,0x7fff8
    8314:	3b868693          	add	a3,a3,952 # 800006c8 <__global_locale+0x194>
    8318:	0006a603          	lw	a2,0(a3)
    831c:	0046a683          	lw	a3,4(a3)
    8320:	00070513          	mv	a0,a4
    8324:	00078593          	mv	a1,a5
    8328:	369050ef          	jal	de90 <__subdf3>
    832c:	7fff8797          	auipc	a5,0x7fff8
    8330:	3a478793          	add	a5,a5,932 # 800006d0 <__global_locale+0x19c>
    8334:	0007a603          	lw	a2,0(a5)
    8338:	0047a683          	lw	a3,4(a5)
    833c:	3c4050ef          	jal	d700 <__muldf3>
    8340:	7fff8797          	auipc	a5,0x7fff8
    8344:	39878793          	add	a5,a5,920 # 800006d8 <__global_locale+0x1a4>
    8348:	0007a603          	lw	a2,0(a5)
    834c:	0047a683          	lw	a3,4(a5)
    8350:	7a9030ef          	jal	c2f8 <__adddf3>
    8354:	00050b13          	mv	s6,a0
    8358:	00090513          	mv	a0,s2
    835c:	00058993          	mv	s3,a1
    8360:	510060ef          	jal	e870 <__floatsidf>
    8364:	7fff8797          	auipc	a5,0x7fff8
    8368:	37c78793          	add	a5,a5,892 # 800006e0 <__global_locale+0x1ac>
    836c:	0007a603          	lw	a2,0(a5)
    8370:	0047a683          	lw	a3,4(a5)
    8374:	38c050ef          	jal	d700 <__muldf3>
    8378:	00050613          	mv	a2,a0
    837c:	00058693          	mv	a3,a1
    8380:	000b0513          	mv	a0,s6
    8384:	00098593          	mv	a1,s3
    8388:	771030ef          	jal	c2f8 <__adddf3>
    838c:	00050b93          	mv	s7,a0
    8390:	00058b13          	mv	s6,a1
    8394:	458060ef          	jal	e7ec <__fixdfsi>
    8398:	00050993          	mv	s3,a0
    839c:	000b0593          	mv	a1,s6
    83a0:	000b8513          	mv	a0,s7
    83a4:	00000613          	li	a2,0
    83a8:	00000693          	li	a3,0
    83ac:	24c050ef          	jal	d5f8 <__ledf2>
    83b0:	02055063          	bgez	a0,83d0 <_dtoa_r+0x260>
    83b4:	00098513          	mv	a0,s3
    83b8:	4b8060ef          	jal	e870 <__floatsidf>
    83bc:	000b8613          	mv	a2,s7
    83c0:	000b0693          	mv	a3,s6
    83c4:	0a8050ef          	jal	d46c <__eqdf2>
    83c8:	00a03533          	snez	a0,a0
    83cc:	40a989b3          	sub	s3,s3,a0
    83d0:	412a8ab3          	sub	s5,s5,s2
    83d4:	01600793          	li	a5,22
    83d8:	fffa8b13          	add	s6,s5,-1
    83dc:	2137e2e3          	bltu	a5,s3,8de0 <_dtoa_r+0xc70>
    83e0:	00399713          	sll	a4,s3,0x3
    83e4:	00007797          	auipc	a5,0x7
    83e8:	47478793          	add	a5,a5,1140 # f858 <__mprec_tens>
    83ec:	00e787b3          	add	a5,a5,a4
    83f0:	0007a603          	lw	a2,0(a5)
    83f4:	0047a683          	lw	a3,4(a5)
    83f8:	01812503          	lw	a0,24(sp)
    83fc:	01c12583          	lw	a1,28(sp)
    8400:	1f8050ef          	jal	d5f8 <__ledf2>
    8404:	220554e3          	bgez	a0,8e2c <_dtoa_r+0xcbc>
    8408:	fff98993          	add	s3,s3,-1
    840c:	02012a23          	sw	zero,52(sp)
    8410:	00012823          	sw	zero,16(sp)
    8414:	4a0b4863          	bltz	s6,88c4 <_dtoa_r+0x754>
    8418:	4c09d063          	bgez	s3,88d8 <_dtoa_r+0x768>
    841c:	01012783          	lw	a5,16(sp)
    8420:	03312023          	sw	s3,32(sp)
    8424:	413787b3          	sub	a5,a5,s3
    8428:	00f12823          	sw	a5,16(sp)
    842c:	413007b3          	neg	a5,s3
    8430:	02f12823          	sw	a5,48(sp)
    8434:	00900793          	li	a5,9
    8438:	00000993          	li	s3,0
    843c:	4b47e863          	bltu	a5,s4,88ec <_dtoa_r+0x77c>
    8440:	00500793          	li	a5,5
    8444:	2147dae3          	bge	a5,s4,8e58 <_dtoa_r+0xce8>
    8448:	ffca0a13          	add	s4,s4,-4
    844c:	00300793          	li	a5,3
    8450:	00000913          	li	s2,0
    8454:	66fa02e3          	beq	s4,a5,92b8 <_dtoa_r+0x1148>
    8458:	6147dae3          	bge	a5,s4,926c <_dtoa_r+0x10fc>
    845c:	00400793          	li	a5,4
    8460:	54fa1ae3          	bne	s4,a5,91b4 <_dtoa_r+0x1044>
    8464:	00100793          	li	a5,1
    8468:	02f12423          	sw	a5,40(sp)
    846c:	01412603          	lw	a2,20(sp)
    8470:	62c05ce3          	blez	a2,92a8 <_dtoa_r+0x1138>
    8474:	02c12e23          	sw	a2,60(sp)
    8478:	00060c13          	mv	s8,a2
    847c:	01700693          	li	a3,23
    8480:	00100713          	li	a4,1
    8484:	00400793          	li	a5,4
    8488:	00c6c463          	blt	a3,a2,8490 <_dtoa_r+0x320>
    848c:	3540106f          	j	97e0 <_dtoa_r+0x1670>
    8490:	00179793          	sll	a5,a5,0x1
    8494:	01478693          	add	a3,a5,20
    8498:	00070593          	mv	a1,a4
    849c:	00170713          	add	a4,a4,1
    84a0:	fed678e3          	bgeu	a2,a3,8490 <_dtoa_r+0x320>
    84a4:	02b42e23          	sw	a1,60(s0)
    84a8:	00040513          	mv	a0,s0
    84ac:	3b0010ef          	jal	985c <_Balloc>
    84b0:	00050a93          	mv	s5,a0
    84b4:	00051463          	bnez	a0,84bc <_dtoa_r+0x34c>
    84b8:	30c0106f          	j	97c4 <_dtoa_r+0x1654>
    84bc:	02a42c23          	sw	a0,56(s0)
    84c0:	00e00793          	li	a5,14
    84c4:	5187ea63          	bltu	a5,s8,89d8 <_dtoa_r+0x868>
    84c8:	50090863          	beqz	s2,89d8 <_dtoa_r+0x868>
    84cc:	02012783          	lw	a5,32(sp)
    84d0:	62f054e3          	blez	a5,92f8 <_dtoa_r+0x1188>
    84d4:	00f7f713          	and	a4,a5,15
    84d8:	00371713          	sll	a4,a4,0x3
    84dc:	4047dc93          	sra	s9,a5,0x4
    84e0:	00007797          	auipc	a5,0x7
    84e4:	37878793          	add	a5,a5,888 # f858 <__mprec_tens>
    84e8:	00e787b3          	add	a5,a5,a4
    84ec:	010cf693          	and	a3,s9,16
    84f0:	0007a803          	lw	a6,0(a5)
    84f4:	0047a703          	lw	a4,4(a5)
    84f8:	560682e3          	beqz	a3,925c <_dtoa_r+0x10ec>
    84fc:	00007797          	auipc	a5,0x7
    8500:	33478793          	add	a5,a5,820 # f830 <__mprec_bigtens>
    8504:	0207a603          	lw	a2,32(a5)
    8508:	0247a683          	lw	a3,36(a5)
    850c:	01812503          	lw	a0,24(sp)
    8510:	01c12583          	lw	a1,28(sp)
    8514:	04e12423          	sw	a4,72(sp)
    8518:	05012023          	sw	a6,64(sp)
    851c:	6a4040ef          	jal	cbc0 <__divdf3>
    8520:	04012803          	lw	a6,64(sp)
    8524:	04812703          	lw	a4,72(sp)
    8528:	00fcfc93          	and	s9,s9,15
    852c:	00050313          	mv	t1,a0
    8530:	00058d13          	mv	s10,a1
    8534:	00300913          	li	s2,3
    8538:	040c8c63          	beqz	s9,8590 <_dtoa_r+0x420>
    853c:	04812023          	sw	s0,64(sp)
    8540:	00007b97          	auipc	s7,0x7
    8544:	2f0b8b93          	add	s7,s7,752 # f830 <__mprec_bigtens>
    8548:	00090413          	mv	s0,s2
    854c:	00070593          	mv	a1,a4
    8550:	00030913          	mv	s2,t1
    8554:	001cf793          	and	a5,s9,1
    8558:	00078e63          	beqz	a5,8574 <_dtoa_r+0x404>
    855c:	000ba603          	lw	a2,0(s7)
    8560:	004ba683          	lw	a3,4(s7)
    8564:	00080513          	mv	a0,a6
    8568:	00140413          	add	s0,s0,1
    856c:	194050ef          	jal	d700 <__muldf3>
    8570:	00050813          	mv	a6,a0
    8574:	401cdc93          	sra	s9,s9,0x1
    8578:	008b8b93          	add	s7,s7,8
    857c:	fc0c9ce3          	bnez	s9,8554 <_dtoa_r+0x3e4>
    8580:	00090313          	mv	t1,s2
    8584:	00040913          	mv	s2,s0
    8588:	04012403          	lw	s0,64(sp)
    858c:	00058713          	mv	a4,a1
    8590:	00070693          	mv	a3,a4
    8594:	00080613          	mv	a2,a6
    8598:	00030513          	mv	a0,t1
    859c:	000d0593          	mv	a1,s10
    85a0:	620040ef          	jal	cbc0 <__divdf3>
    85a4:	00050713          	mv	a4,a0
    85a8:	00058793          	mv	a5,a1
    85ac:	03412683          	lw	a3,52(sp)
    85b0:	02068c63          	beqz	a3,85e8 <_dtoa_r+0x478>
    85b4:	7fff8697          	auipc	a3,0x7fff8
    85b8:	13468693          	add	a3,a3,308 # 800006e8 <__global_locale+0x1b4>
    85bc:	0006a603          	lw	a2,0(a3)
    85c0:	0046a683          	lw	a3,4(a3)
    85c4:	00070513          	mv	a0,a4
    85c8:	00078593          	mv	a1,a5
    85cc:	04e12423          	sw	a4,72(sp)
    85d0:	04f12023          	sw	a5,64(sp)
    85d4:	024050ef          	jal	d5f8 <__ledf2>
    85d8:	04012783          	lw	a5,64(sp)
    85dc:	04812703          	lw	a4,72(sp)
    85e0:	00055463          	bgez	a0,85e8 <_dtoa_r+0x478>
    85e4:	04c0106f          	j	9630 <_dtoa_r+0x14c0>
    85e8:	00090513          	mv	a0,s2
    85ec:	04f12623          	sw	a5,76(sp)
    85f0:	04e12023          	sw	a4,64(sp)
    85f4:	27c060ef          	jal	e870 <__floatsidf>
    85f8:	04012703          	lw	a4,64(sp)
    85fc:	04c12783          	lw	a5,76(sp)
    8600:	00070613          	mv	a2,a4
    8604:	00078693          	mv	a3,a5
    8608:	04e12423          	sw	a4,72(sp)
    860c:	04f12023          	sw	a5,64(sp)
    8610:	0f0050ef          	jal	d700 <__muldf3>
    8614:	7fff8697          	auipc	a3,0x7fff8
    8618:	0e468693          	add	a3,a3,228 # 800006f8 <__global_locale+0x1c4>
    861c:	0006a603          	lw	a2,0(a3)
    8620:	0046a683          	lw	a3,4(a3)
    8624:	4d5030ef          	jal	c2f8 <__adddf3>
    8628:	fcc006b7          	lui	a3,0xfcc00
    862c:	04012783          	lw	a5,64(sp)
    8630:	04812703          	lw	a4,72(sp)
    8634:	00050c93          	mv	s9,a0
    8638:	00b68bb3          	add	s7,a3,a1
    863c:	340c0463          	beqz	s8,8984 <_dtoa_r+0x814>
    8640:	02012683          	lw	a3,32(sp)
    8644:	05812423          	sw	s8,72(sp)
    8648:	04d12e23          	sw	a3,92(sp)
    864c:	00070513          	mv	a0,a4
    8650:	00078593          	mv	a1,a5
    8654:	04e12623          	sw	a4,76(sp)
    8658:	04f12023          	sw	a5,64(sp)
    865c:	190060ef          	jal	e7ec <__fixdfsi>
    8660:	04812783          	lw	a5,72(sp)
    8664:	00050913          	mv	s2,a0
    8668:	05912c23          	sw	s9,88(sp)
    866c:	fff78693          	add	a3,a5,-1
    8670:	00369693          	sll	a3,a3,0x3
    8674:	00007797          	auipc	a5,0x7
    8678:	1e478793          	add	a5,a5,484 # f858 <__mprec_tens>
    867c:	00d786b3          	add	a3,a5,a3
    8680:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8684:	0046a803          	lw	a6,4(a3)
    8688:	001a8d13          	add	s10,s5,1
    868c:	04f12823          	sw	a5,80(sp)
    8690:	05012a23          	sw	a6,84(sp)
    8694:	1dc060ef          	jal	e870 <__floatsidf>
    8698:	04c12703          	lw	a4,76(sp)
    869c:	04012783          	lw	a5,64(sp)
    86a0:	00050613          	mv	a2,a0
    86a4:	00058693          	mv	a3,a1
    86a8:	00070513          	mv	a0,a4
    86ac:	00078593          	mv	a1,a5
    86b0:	7e0050ef          	jal	de90 <__subdf3>
    86b4:	02812703          	lw	a4,40(sp)
    86b8:	03090313          	add	t1,s2,48
    86bc:	05a12023          	sw	s10,64(sp)
    86c0:	00050c93          	mv	s9,a0
    86c4:	0ff37313          	zext.b	t1,t1
    86c8:	5c0706e3          	beqz	a4,9494 <_dtoa_r+0x1324>
    86cc:	7fff8797          	auipc	a5,0x7fff8
    86d0:	fec78793          	add	a5,a5,-20 # 800006b8 <__global_locale+0x184>
    86d4:	0007a503          	lw	a0,0(a5)
    86d8:	05012603          	lw	a2,80(sp)
    86dc:	05412683          	lw	a3,84(sp)
    86e0:	04b12023          	sw	a1,64(sp)
    86e4:	0047a583          	lw	a1,4(a5)
    86e8:	04612623          	sw	t1,76(sp)
    86ec:	4d4040ef          	jal	cbc0 <__divdf3>
    86f0:	05812603          	lw	a2,88(sp)
    86f4:	000b8693          	mv	a3,s7
    86f8:	798050ef          	jal	de90 <__subdf3>
    86fc:	04012883          	lw	a7,64(sp)
    8700:	04c12303          	lw	t1,76(sp)
    8704:	000c8613          	mv	a2,s9
    8708:	00088693          	mv	a3,a7
    870c:	006a8023          	sb	t1,0(s5)
    8710:	00050913          	mv	s2,a0
    8714:	00058b93          	mv	s7,a1
    8718:	5e1040ef          	jal	d4f8 <__gedf2>
    871c:	04012883          	lw	a7,64(sp)
    8720:	00a05463          	blez	a0,8728 <_dtoa_r+0x5b8>
    8724:	7c90006f          	j	96ec <_dtoa_r+0x157c>
    8728:	7fff8697          	auipc	a3,0x7fff8
    872c:	fc068693          	add	a3,a3,-64 # 800006e8 <__global_locale+0x1b4>
    8730:	0006a783          	lw	a5,0(a3)
    8734:	0046a803          	lw	a6,4(a3)
    8738:	05312623          	sw	s3,76(sp)
    873c:	04f12023          	sw	a5,64(sp)
    8740:	00000793          	li	a5,0
    8744:	05612823          	sw	s6,80(sp)
    8748:	05812c23          	sw	s8,88(sp)
    874c:	05012223          	sw	a6,68(sp)
    8750:	04812c03          	lw	s8,72(sp)
    8754:	00078b13          	mv	s6,a5
    8758:	05412423          	sw	s4,72(sp)
    875c:	00088993          	mv	s3,a7
    8760:	0980006f          	j	87f8 <_dtoa_r+0x688>
    8764:	001b0b13          	add	s6,s6,1
    8768:	018b4463          	blt	s6,s8,8770 <_dtoa_r+0x600>
    876c:	7d10006f          	j	973c <_dtoa_r+0x15cc>
    8770:	7fff8a17          	auipc	s4,0x7fff8
    8774:	f80a0a13          	add	s4,s4,-128 # 800006f0 <__global_locale+0x1bc>
    8778:	000a2603          	lw	a2,0(s4)
    877c:	004a2683          	lw	a3,4(s4)
    8780:	00090513          	mv	a0,s2
    8784:	000b8593          	mv	a1,s7
    8788:	779040ef          	jal	d700 <__muldf3>
    878c:	000a2603          	lw	a2,0(s4)
    8790:	004a2683          	lw	a3,4(s4)
    8794:	00050913          	mv	s2,a0
    8798:	00058b93          	mv	s7,a1
    879c:	000c8513          	mv	a0,s9
    87a0:	00098593          	mv	a1,s3
    87a4:	75d040ef          	jal	d700 <__muldf3>
    87a8:	00058c93          	mv	s9,a1
    87ac:	00050a13          	mv	s4,a0
    87b0:	03c060ef          	jal	e7ec <__fixdfsi>
    87b4:	00050993          	mv	s3,a0
    87b8:	0b8060ef          	jal	e870 <__floatsidf>
    87bc:	00050613          	mv	a2,a0
    87c0:	00058693          	mv	a3,a1
    87c4:	000a0513          	mv	a0,s4
    87c8:	000c8593          	mv	a1,s9
    87cc:	6c4050ef          	jal	de90 <__subdf3>
    87d0:	03098793          	add	a5,s3,48
    87d4:	00090613          	mv	a2,s2
    87d8:	000b8693          	mv	a3,s7
    87dc:	00fd0023          	sb	a5,0(s10)
    87e0:	001d0d13          	add	s10,s10,1
    87e4:	00050c93          	mv	s9,a0
    87e8:	00058993          	mv	s3,a1
    87ec:	60d040ef          	jal	d5f8 <__ledf2>
    87f0:	00055463          	bgez	a0,87f8 <_dtoa_r+0x688>
    87f4:	6f90006f          	j	96ec <_dtoa_r+0x157c>
    87f8:	04012503          	lw	a0,64(sp)
    87fc:	04412583          	lw	a1,68(sp)
    8800:	000c8613          	mv	a2,s9
    8804:	00098693          	mv	a3,s3
    8808:	688050ef          	jal	de90 <__subdf3>
    880c:	00090613          	mv	a2,s2
    8810:	000b8693          	mv	a3,s7
    8814:	5e5040ef          	jal	d5f8 <__ledf2>
    8818:	f40556e3          	bgez	a0,8764 <_dtoa_r+0x5f4>
    881c:	05c12783          	lw	a5,92(sp)
    8820:	000d0b93          	mv	s7,s10
    8824:	00178c13          	add	s8,a5,1
    8828:	03900613          	li	a2,57
    882c:	0080006f          	j	8834 <_dtoa_r+0x6c4>
    8830:	697a88e3          	beq	s5,s7,96c0 <_dtoa_r+0x1550>
    8834:	fffbc683          	lbu	a3,-1(s7)
    8838:	000b8d13          	mv	s10,s7
    883c:	fffb8b93          	add	s7,s7,-1
    8840:	fec688e3          	beq	a3,a2,8830 <_dtoa_r+0x6c0>
    8844:	00168693          	add	a3,a3,1
    8848:	0ff6f693          	zext.b	a3,a3
    884c:	00db8023          	sb	a3,0(s7)
    8850:	000c0a13          	mv	s4,s8
    8854:	4f00006f          	j	8d44 <_dtoa_r+0xbd4>
    8858:	00c12683          	lw	a3,12(sp)
    885c:	00002737          	lui	a4,0x2
    8860:	00c99793          	sll	a5,s3,0xc
    8864:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x79f>
    8868:	00c7d793          	srl	a5,a5,0xc
    886c:	00e6a023          	sw	a4,0(a3)
    8870:	01b7e7b3          	or	a5,a5,s11
    8874:	0a078063          	beqz	a5,8914 <_dtoa_r+0x7a4>
    8878:	00812783          	lw	a5,8(sp)
    887c:	00007a97          	auipc	s5,0x7
    8880:	998a8a93          	add	s5,s5,-1640 # f214 <__fini_array_end+0x254>
    8884:	9c078ee3          	beqz	a5,8260 <_dtoa_r+0xf0>
    8888:	00007797          	auipc	a5,0x7
    888c:	98f78793          	add	a5,a5,-1649 # f217 <__fini_array_end+0x257>
    8890:	00812703          	lw	a4,8(sp)
    8894:	00f72023          	sw	a5,0(a4)
    8898:	9c9ff06f          	j	8260 <_dtoa_r+0xf0>
    889c:	01c12783          	lw	a5,28(sp)
    88a0:	3ff006b7          	lui	a3,0x3ff00
    88a4:	06812a83          	lw	s5,104(sp)
    88a8:	00c79793          	sll	a5,a5,0xc
    88ac:	00c7d793          	srl	a5,a5,0xc
    88b0:	01812703          	lw	a4,24(sp)
    88b4:	00d7e7b3          	or	a5,a5,a3
    88b8:	c0190913          	add	s2,s2,-1023
    88bc:	02012c23          	sw	zero,56(sp)
    88c0:	a51ff06f          	j	8310 <_dtoa_r+0x1a0>
    88c4:	00100793          	li	a5,1
    88c8:	415787b3          	sub	a5,a5,s5
    88cc:	00f12823          	sw	a5,16(sp)
    88d0:	00000b13          	li	s6,0
    88d4:	b409c4e3          	bltz	s3,841c <_dtoa_r+0x2ac>
    88d8:	03312023          	sw	s3,32(sp)
    88dc:	02012823          	sw	zero,48(sp)
    88e0:	00900793          	li	a5,9
    88e4:	013b0b33          	add	s6,s6,s3
    88e8:	b547fce3          	bgeu	a5,s4,8440 <_dtoa_r+0x2d0>
    88ec:	00100793          	li	a5,1
    88f0:	00100913          	li	s2,1
    88f4:	00000a13          	li	s4,0
    88f8:	02f12423          	sw	a5,40(sp)
    88fc:	fff00c13          	li	s8,-1
    8900:	00012a23          	sw	zero,20(sp)
    8904:	02042e23          	sw	zero,60(s0)
    8908:	03812e23          	sw	s8,60(sp)
    890c:	00000593          	li	a1,0
    8910:	b99ff06f          	j	84a8 <_dtoa_r+0x338>
    8914:	00812703          	lw	a4,8(sp)
    8918:	00007a97          	auipc	s5,0x7
    891c:	8f0a8a93          	add	s5,s5,-1808 # f208 <__fini_array_end+0x248>
    8920:	00007797          	auipc	a5,0x7
    8924:	8f078793          	add	a5,a5,-1808 # f210 <__fini_array_end+0x250>
    8928:	f60714e3          	bnez	a4,8890 <_dtoa_r+0x720>
    892c:	935ff06f          	j	8260 <_dtoa_r+0xf0>
    8930:	00090513          	mv	a0,s2
    8934:	04f12623          	sw	a5,76(sp)
    8938:	04e12023          	sw	a4,64(sp)
    893c:	735050ef          	jal	e870 <__floatsidf>
    8940:	04012703          	lw	a4,64(sp)
    8944:	04c12783          	lw	a5,76(sp)
    8948:	00070613          	mv	a2,a4
    894c:	00078693          	mv	a3,a5
    8950:	04e12423          	sw	a4,72(sp)
    8954:	04f12023          	sw	a5,64(sp)
    8958:	5a9040ef          	jal	d700 <__muldf3>
    895c:	7fff8697          	auipc	a3,0x7fff8
    8960:	d9c68693          	add	a3,a3,-612 # 800006f8 <__global_locale+0x1c4>
    8964:	0006a603          	lw	a2,0(a3)
    8968:	0046a683          	lw	a3,4(a3)
    896c:	18d030ef          	jal	c2f8 <__adddf3>
    8970:	04012783          	lw	a5,64(sp)
    8974:	04812703          	lw	a4,72(sp)
    8978:	fcc006b7          	lui	a3,0xfcc00
    897c:	00050c93          	mv	s9,a0
    8980:	00b68bb3          	add	s7,a3,a1
    8984:	7fff8697          	auipc	a3,0x7fff8
    8988:	d7c68693          	add	a3,a3,-644 # 80000700 <__global_locale+0x1cc>
    898c:	0006a603          	lw	a2,0(a3)
    8990:	0046a683          	lw	a3,4(a3)
    8994:	00070513          	mv	a0,a4
    8998:	00078593          	mv	a1,a5
    899c:	4f4050ef          	jal	de90 <__subdf3>
    89a0:	000c8613          	mv	a2,s9
    89a4:	000b8693          	mv	a3,s7
    89a8:	00050d13          	mv	s10,a0
    89ac:	00058913          	mv	s2,a1
    89b0:	349040ef          	jal	d4f8 <__gedf2>
    89b4:	50a04ce3          	bgtz	a0,96cc <_dtoa_r+0x155c>
    89b8:	800007b7          	lui	a5,0x80000
    89bc:	0177c7b3          	xor	a5,a5,s7
    89c0:	000c8613          	mv	a2,s9
    89c4:	000d0513          	mv	a0,s10
    89c8:	00078693          	mv	a3,a5
    89cc:	00090593          	mv	a1,s2
    89d0:	429040ef          	jal	d5f8 <__ledf2>
    89d4:	06054c63          	bltz	a0,8a4c <_dtoa_r+0x8dc>
    89d8:	06c12783          	lw	a5,108(sp)
    89dc:	1a07c663          	bltz	a5,8b88 <_dtoa_r+0xa18>
    89e0:	02012683          	lw	a3,32(sp)
    89e4:	00e00713          	li	a4,14
    89e8:	1ad74063          	blt	a4,a3,8b88 <_dtoa_r+0xa18>
    89ec:	02012783          	lw	a5,32(sp)
    89f0:	00379713          	sll	a4,a5,0x3
    89f4:	00007797          	auipc	a5,0x7
    89f8:	e6478793          	add	a5,a5,-412 # f858 <__mprec_tens>
    89fc:	00e787b3          	add	a5,a5,a4
    8a00:	0007a903          	lw	s2,0(a5)
    8a04:	0047a983          	lw	s3,4(a5)
    8a08:	01412783          	lw	a5,20(sp)
    8a0c:	0407dc63          	bgez	a5,8a64 <_dtoa_r+0x8f4>
    8a10:	05804a63          	bgtz	s8,8a64 <_dtoa_r+0x8f4>
    8a14:	020c1c63          	bnez	s8,8a4c <_dtoa_r+0x8dc>
    8a18:	7fff8797          	auipc	a5,0x7fff8
    8a1c:	ce878793          	add	a5,a5,-792 # 80000700 <__global_locale+0x1cc>
    8a20:	0007a603          	lw	a2,0(a5)
    8a24:	0047a683          	lw	a3,4(a5)
    8a28:	00090513          	mv	a0,s2
    8a2c:	00098593          	mv	a1,s3
    8a30:	4d1040ef          	jal	d700 <__muldf3>
    8a34:	00050613          	mv	a2,a0
    8a38:	00058693          	mv	a3,a1
    8a3c:	01812503          	lw	a0,24(sp)
    8a40:	01c12583          	lw	a1,28(sp)
    8a44:	3b5040ef          	jal	d5f8 <__ledf2>
    8a48:	48a042e3          	bgtz	a0,96cc <_dtoa_r+0x155c>
    8a4c:	000a8d13          	mv	s10,s5
    8a50:	00012c23          	sw	zero,24(sp)
    8a54:	00000913          	li	s2,0
    8a58:	01412783          	lw	a5,20(sp)
    8a5c:	fff7ca13          	not	s4,a5
    8a60:	6980006f          	j	90f8 <_dtoa_r+0xf88>
    8a64:	001a8793          	add	a5,s5,1
    8a68:	04f12023          	sw	a5,64(sp)
    8a6c:	01812b03          	lw	s6,24(sp)
    8a70:	01c12a03          	lw	s4,28(sp)
    8a74:	00090613          	mv	a2,s2
    8a78:	00098693          	mv	a3,s3
    8a7c:	000b0513          	mv	a0,s6
    8a80:	000a0593          	mv	a1,s4
    8a84:	13c040ef          	jal	cbc0 <__divdf3>
    8a88:	565050ef          	jal	e7ec <__fixdfsi>
    8a8c:	00050d13          	mv	s10,a0
    8a90:	5e1050ef          	jal	e870 <__floatsidf>
    8a94:	00090613          	mv	a2,s2
    8a98:	00098693          	mv	a3,s3
    8a9c:	465040ef          	jal	d700 <__muldf3>
    8aa0:	00050613          	mv	a2,a0
    8aa4:	00058693          	mv	a3,a1
    8aa8:	000b0513          	mv	a0,s6
    8aac:	000a0593          	mv	a1,s4
    8ab0:	3e0050ef          	jal	de90 <__subdf3>
    8ab4:	030d0793          	add	a5,s10,48
    8ab8:	00fa8023          	sb	a5,0(s5)
    8abc:	00100613          	li	a2,1
    8ac0:	04012b83          	lw	s7,64(sp)
    8ac4:	00050713          	mv	a4,a0
    8ac8:	00058693          	mv	a3,a1
    8acc:	0ccc0ee3          	beq	s8,a2,93a8 <_dtoa_r+0x1238>
    8ad0:	7fff8617          	auipc	a2,0x7fff8
    8ad4:	c2060613          	add	a2,a2,-992 # 800006f0 <__global_locale+0x1bc>
    8ad8:	00062783          	lw	a5,0(a2)
    8adc:	00462803          	lw	a6,4(a2)
    8ae0:	00100d93          	li	s11,1
    8ae4:	00f12023          	sw	a5,0(sp)
    8ae8:	01012223          	sw	a6,4(sp)
    8aec:	0600006f          	j	8b4c <_dtoa_r+0x9dc>
    8af0:	00090613          	mv	a2,s2
    8af4:	00098693          	mv	a3,s3
    8af8:	000b0513          	mv	a0,s6
    8afc:	000a0593          	mv	a1,s4
    8b00:	0c0040ef          	jal	cbc0 <__divdf3>
    8b04:	4e9050ef          	jal	e7ec <__fixdfsi>
    8b08:	00050d13          	mv	s10,a0
    8b0c:	565050ef          	jal	e870 <__floatsidf>
    8b10:	00090613          	mv	a2,s2
    8b14:	00098693          	mv	a3,s3
    8b18:	3e9040ef          	jal	d700 <__muldf3>
    8b1c:	00058693          	mv	a3,a1
    8b20:	00050613          	mv	a2,a0
    8b24:	000a0593          	mv	a1,s4
    8b28:	000b0513          	mv	a0,s6
    8b2c:	364050ef          	jal	de90 <__subdf3>
    8b30:	001b8b93          	add	s7,s7,1
    8b34:	030d0793          	add	a5,s10,48
    8b38:	001d8d93          	add	s11,s11,1
    8b3c:	fefb8fa3          	sb	a5,-1(s7)
    8b40:	00050713          	mv	a4,a0
    8b44:	00058693          	mv	a3,a1
    8b48:	07bc00e3          	beq	s8,s11,93a8 <_dtoa_r+0x1238>
    8b4c:	00012603          	lw	a2,0(sp)
    8b50:	00068593          	mv	a1,a3
    8b54:	00412683          	lw	a3,4(sp)
    8b58:	00070513          	mv	a0,a4
    8b5c:	3a5040ef          	jal	d700 <__muldf3>
    8b60:	00000613          	li	a2,0
    8b64:	00000693          	li	a3,0
    8b68:	00050b13          	mv	s6,a0
    8b6c:	00058a13          	mv	s4,a1
    8b70:	0fd040ef          	jal	d46c <__eqdf2>
    8b74:	f6051ee3          	bnez	a0,8af0 <_dtoa_r+0x980>
    8b78:	02012783          	lw	a5,32(sp)
    8b7c:	000b8d13          	mv	s10,s7
    8b80:	00178a13          	add	s4,a5,1
    8b84:	1c00006f          	j	8d44 <_dtoa_r+0xbd4>
    8b88:	02812703          	lw	a4,40(sp)
    8b8c:	26071463          	bnez	a4,8df4 <_dtoa_r+0xc84>
    8b90:	03012b83          	lw	s7,48(sp)
    8b94:	01012c83          	lw	s9,16(sp)
    8b98:	02012423          	sw	zero,40(sp)
    8b9c:	00000913          	li	s2,0
    8ba0:	020c8263          	beqz	s9,8bc4 <_dtoa_r+0xa54>
    8ba4:	03605063          	blez	s6,8bc4 <_dtoa_r+0xa54>
    8ba8:	000c8793          	mv	a5,s9
    8bac:	679b4263          	blt	s6,s9,9210 <_dtoa_r+0x10a0>
    8bb0:	01012703          	lw	a4,16(sp)
    8bb4:	40fc8cb3          	sub	s9,s9,a5
    8bb8:	40fb0b33          	sub	s6,s6,a5
    8bbc:	40f70733          	sub	a4,a4,a5
    8bc0:	00e12823          	sw	a4,16(sp)
    8bc4:	03012783          	lw	a5,48(sp)
    8bc8:	02078263          	beqz	a5,8bec <_dtoa_r+0xa7c>
    8bcc:	02812783          	lw	a5,40(sp)
    8bd0:	00078463          	beqz	a5,8bd8 <_dtoa_r+0xa68>
    8bd4:	060b9ae3          	bnez	s7,9448 <_dtoa_r+0x12d8>
    8bd8:	03012603          	lw	a2,48(sp)
    8bdc:	00048593          	mv	a1,s1
    8be0:	00040513          	mv	a0,s0
    8be4:	3a4010ef          	jal	9f88 <__pow5mult>
    8be8:	00050493          	mv	s1,a0
    8bec:	00100593          	li	a1,1
    8bf0:	00040513          	mv	a0,s0
    8bf4:	01c010ef          	jal	9c10 <__i2b>
    8bf8:	00a12c23          	sw	a0,24(sp)
    8bfc:	50099a63          	bnez	s3,9110 <_dtoa_r+0xfa0>
    8c00:	00100793          	li	a5,1
    8c04:	5547da63          	bge	a5,s4,9158 <_dtoa_r+0xfe8>
    8c08:	016787b3          	add	a5,a5,s6
    8c0c:	01f7f793          	and	a5,a5,31
    8c10:	1c078e63          	beqz	a5,8dec <_dtoa_r+0xc7c>
    8c14:	02000713          	li	a4,32
    8c18:	40f70733          	sub	a4,a4,a5
    8c1c:	00400693          	li	a3,4
    8c20:	58e6d263          	bge	a3,a4,91a4 <_dtoa_r+0x1034>
    8c24:	01c00713          	li	a4,28
    8c28:	40f707b3          	sub	a5,a4,a5
    8c2c:	01012703          	lw	a4,16(sp)
    8c30:	00fc8cb3          	add	s9,s9,a5
    8c34:	00fb0b33          	add	s6,s6,a5
    8c38:	00f70733          	add	a4,a4,a5
    8c3c:	00e12823          	sw	a4,16(sp)
    8c40:	01012783          	lw	a5,16(sp)
    8c44:	12f04e63          	bgtz	a5,8d80 <_dtoa_r+0xc10>
    8c48:	01605c63          	blez	s6,8c60 <_dtoa_r+0xaf0>
    8c4c:	01812583          	lw	a1,24(sp)
    8c50:	000b0613          	mv	a2,s6
    8c54:	00040513          	mv	a0,s0
    8c58:	480010ef          	jal	a0d8 <__lshift>
    8c5c:	00a12c23          	sw	a0,24(sp)
    8c60:	03412783          	lw	a5,52(sp)
    8c64:	12079a63          	bnez	a5,8d98 <_dtoa_r+0xc28>
    8c68:	45805263          	blez	s8,90ac <_dtoa_r+0xf3c>
    8c6c:	02812783          	lw	a5,40(sp)
    8c70:	24079e63          	bnez	a5,8ecc <_dtoa_r+0xd5c>
    8c74:	02012783          	lw	a5,32(sp)
    8c78:	00178a13          	add	s4,a5,1
    8c7c:	01812b03          	lw	s6,24(sp)
    8c80:	00100993          	li	s3,1
    8c84:	0200006f          	j	8ca4 <_dtoa_r+0xb34>
    8c88:	00048593          	mv	a1,s1
    8c8c:	00000693          	li	a3,0
    8c90:	00a00613          	li	a2,10
    8c94:	00040513          	mv	a0,s0
    8c98:	49d000ef          	jal	9934 <__multadd>
    8c9c:	00050493          	mv	s1,a0
    8ca0:	00198993          	add	s3,s3,1
    8ca4:	000b0593          	mv	a1,s6
    8ca8:	00048513          	mv	a0,s1
    8cac:	a64ff0ef          	jal	7f10 <quorem>
    8cb0:	03050b93          	add	s7,a0,48
    8cb4:	013a87b3          	add	a5,s5,s3
    8cb8:	ff778fa3          	sb	s7,-1(a5)
    8cbc:	fd89c6e3          	blt	s3,s8,8c88 <_dtoa_r+0xb18>
    8cc0:	00100993          	li	s3,1
    8cc4:	55804263          	bgtz	s8,9208 <_dtoa_r+0x1098>
    8cc8:	013a89b3          	add	s3,s5,s3
    8ccc:	00000c13          	li	s8,0
    8cd0:	00048593          	mv	a1,s1
    8cd4:	00100613          	li	a2,1
    8cd8:	00040513          	mv	a0,s0
    8cdc:	3fc010ef          	jal	a0d8 <__lshift>
    8ce0:	01812583          	lw	a1,24(sp)
    8ce4:	00050493          	mv	s1,a0
    8ce8:	580010ef          	jal	a268 <__mcmp>
    8cec:	4ea05c63          	blez	a0,91e4 <_dtoa_r+0x1074>
    8cf0:	03900693          	li	a3,57
    8cf4:	0080006f          	j	8cfc <_dtoa_r+0xb8c>
    8cf8:	5f3a8863          	beq	s5,s3,92e8 <_dtoa_r+0x1178>
    8cfc:	fff9c783          	lbu	a5,-1(s3)
    8d00:	00098d13          	mv	s10,s3
    8d04:	fff98993          	add	s3,s3,-1
    8d08:	fed788e3          	beq	a5,a3,8cf8 <_dtoa_r+0xb88>
    8d0c:	00178793          	add	a5,a5,1
    8d10:	00f98023          	sb	a5,0(s3)
    8d14:	01812583          	lw	a1,24(sp)
    8d18:	00040513          	mv	a0,s0
    8d1c:	3f5000ef          	jal	9910 <_Bfree>
    8d20:	02090263          	beqz	s2,8d44 <_dtoa_r+0xbd4>
    8d24:	000c0a63          	beqz	s8,8d38 <_dtoa_r+0xbc8>
    8d28:	012c0863          	beq	s8,s2,8d38 <_dtoa_r+0xbc8>
    8d2c:	000c0593          	mv	a1,s8
    8d30:	00040513          	mv	a0,s0
    8d34:	3dd000ef          	jal	9910 <_Bfree>
    8d38:	00090593          	mv	a1,s2
    8d3c:	00040513          	mv	a0,s0
    8d40:	3d1000ef          	jal	9910 <_Bfree>
    8d44:	00048593          	mv	a1,s1
    8d48:	00040513          	mv	a0,s0
    8d4c:	3c5000ef          	jal	9910 <_Bfree>
    8d50:	00c12783          	lw	a5,12(sp)
    8d54:	000d0023          	sb	zero,0(s10)
    8d58:	0147a023          	sw	s4,0(a5)
    8d5c:	00812783          	lw	a5,8(sp)
    8d60:	00078463          	beqz	a5,8d68 <_dtoa_r+0xbf8>
    8d64:	01a7a023          	sw	s10,0(a5)
    8d68:	09012b03          	lw	s6,144(sp)
    8d6c:	08c12b83          	lw	s7,140(sp)
    8d70:	08812c03          	lw	s8,136(sp)
    8d74:	08412c83          	lw	s9,132(sp)
    8d78:	08012d03          	lw	s10,128(sp)
    8d7c:	ce4ff06f          	j	8260 <_dtoa_r+0xf0>
    8d80:	00048593          	mv	a1,s1
    8d84:	00078613          	mv	a2,a5
    8d88:	00040513          	mv	a0,s0
    8d8c:	34c010ef          	jal	a0d8 <__lshift>
    8d90:	00050493          	mv	s1,a0
    8d94:	eb5ff06f          	j	8c48 <_dtoa_r+0xad8>
    8d98:	01812583          	lw	a1,24(sp)
    8d9c:	00048513          	mv	a0,s1
    8da0:	4c8010ef          	jal	a268 <__mcmp>
    8da4:	ec0552e3          	bgez	a0,8c68 <_dtoa_r+0xaf8>
    8da8:	02012783          	lw	a5,32(sp)
    8dac:	00048593          	mv	a1,s1
    8db0:	00000693          	li	a3,0
    8db4:	00a00613          	li	a2,10
    8db8:	00040513          	mv	a0,s0
    8dbc:	fff78b13          	add	s6,a5,-1
    8dc0:	375000ef          	jal	9934 <__multadd>
    8dc4:	02812783          	lw	a5,40(sp)
    8dc8:	00050493          	mv	s1,a0
    8dcc:	0c079e63          	bnez	a5,8ea8 <_dtoa_r+0xd38>
    8dd0:	03c12c03          	lw	s8,60(sp)
    8dd4:	17805ee3          	blez	s8,9750 <_dtoa_r+0x15e0>
    8dd8:	02012a03          	lw	s4,32(sp)
    8ddc:	ea1ff06f          	j	8c7c <_dtoa_r+0xb0c>
    8de0:	00100793          	li	a5,1
    8de4:	02f12a23          	sw	a5,52(sp)
    8de8:	e28ff06f          	j	8410 <_dtoa_r+0x2a0>
    8dec:	01c00793          	li	a5,28
    8df0:	e3dff06f          	j	8c2c <_dtoa_r+0xabc>
    8df4:	00100713          	li	a4,1
    8df8:	4d475463          	bge	a4,s4,92c0 <_dtoa_r+0x1150>
    8dfc:	03012783          	lw	a5,48(sp)
    8e00:	fffc0b93          	add	s7,s8,-1
    8e04:	4177ca63          	blt	a5,s7,9218 <_dtoa_r+0x10a8>
    8e08:	41778bb3          	sub	s7,a5,s7
    8e0c:	01012783          	lw	a5,16(sp)
    8e10:	41878cb3          	sub	s9,a5,s8
    8e14:	100c54e3          	bgez	s8,971c <_dtoa_r+0x15ac>
    8e18:	00100593          	li	a1,1
    8e1c:	00040513          	mv	a0,s0
    8e20:	5f1000ef          	jal	9c10 <__i2b>
    8e24:	00050913          	mv	s2,a0
    8e28:	d79ff06f          	j	8ba0 <_dtoa_r+0xa30>
    8e2c:	02012a23          	sw	zero,52(sp)
    8e30:	00012823          	sw	zero,16(sp)
    8e34:	ab5042e3          	bgtz	s5,88d8 <_dtoa_r+0x768>
    8e38:	00100793          	li	a5,1
    8e3c:	415787b3          	sub	a5,a5,s5
    8e40:	00f12823          	sw	a5,16(sp)
    8e44:	00000b13          	li	s6,0
    8e48:	a91ff06f          	j	88d8 <_dtoa_r+0x768>
    8e4c:	40e787b3          	sub	a5,a5,a4
    8e50:	00fd9533          	sll	a0,s11,a5
    8e54:	ca0ff06f          	j	82f4 <_dtoa_r+0x184>
    8e58:	00300793          	li	a5,3
    8e5c:	00100913          	li	s2,1
    8e60:	44fa0c63          	beq	s4,a5,92b8 <_dtoa_r+0x1148>
    8e64:	df47cc63          	blt	a5,s4,845c <_dtoa_r+0x2ec>
    8e68:	00200793          	li	a5,2
    8e6c:	18fa00e3          	beq	s4,a5,97ec <_dtoa_r+0x167c>
    8e70:	02042e23          	sw	zero,60(s0)
    8e74:	00000593          	li	a1,0
    8e78:	00040513          	mv	a0,s0
    8e7c:	1e1000ef          	jal	985c <_Balloc>
    8e80:	00050a93          	mv	s5,a0
    8e84:	140500e3          	beqz	a0,97c4 <_dtoa_r+0x1654>
    8e88:	00100793          	li	a5,1
    8e8c:	02f12423          	sw	a5,40(sp)
    8e90:	fff00793          	li	a5,-1
    8e94:	02a42c23          	sw	a0,56(s0)
    8e98:	02f12e23          	sw	a5,60(sp)
    8e9c:	fff00c13          	li	s8,-1
    8ea0:	00012a23          	sw	zero,20(sp)
    8ea4:	b35ff06f          	j	89d8 <_dtoa_r+0x868>
    8ea8:	00090593          	mv	a1,s2
    8eac:	00000693          	li	a3,0
    8eb0:	00a00613          	li	a2,10
    8eb4:	00040513          	mv	a0,s0
    8eb8:	27d000ef          	jal	9934 <__multadd>
    8ebc:	03c12c03          	lw	s8,60(sp)
    8ec0:	00050913          	mv	s2,a0
    8ec4:	0b805ae3          	blez	s8,9778 <_dtoa_r+0x1608>
    8ec8:	03612023          	sw	s6,32(sp)
    8ecc:	01905c63          	blez	s9,8ee4 <_dtoa_r+0xd74>
    8ed0:	00090593          	mv	a1,s2
    8ed4:	000c8613          	mv	a2,s9
    8ed8:	00040513          	mv	a0,s0
    8edc:	1fc010ef          	jal	a0d8 <__lshift>
    8ee0:	00050913          	mv	s2,a0
    8ee4:	00090b13          	mv	s6,s2
    8ee8:	50099e63          	bnez	s3,9404 <_dtoa_r+0x1294>
    8eec:	02412783          	lw	a5,36(sp)
    8ef0:	fffa8d13          	add	s10,s5,-1
    8ef4:	000a8c93          	mv	s9,s5
    8ef8:	01512823          	sw	s5,16(sp)
    8efc:	01812a83          	lw	s5,24(sp)
    8f00:	0017f793          	and	a5,a5,1
    8f04:	018d0d33          	add	s10,s10,s8
    8f08:	00f12023          	sw	a5,0(sp)
    8f0c:	01b12a23          	sw	s11,20(sp)
    8f10:	000a8593          	mv	a1,s5
    8f14:	00048513          	mv	a0,s1
    8f18:	ff9fe0ef          	jal	7f10 <quorem>
    8f1c:	00050c13          	mv	s8,a0
    8f20:	00090593          	mv	a1,s2
    8f24:	00048513          	mv	a0,s1
    8f28:	340010ef          	jal	a268 <__mcmp>
    8f2c:	00050993          	mv	s3,a0
    8f30:	000b0613          	mv	a2,s6
    8f34:	000a8593          	mv	a1,s5
    8f38:	00040513          	mv	a0,s0
    8f3c:	384010ef          	jal	a2c0 <__mdiff>
    8f40:	00c52703          	lw	a4,12(a0)
    8f44:	030c0b93          	add	s7,s8,48
    8f48:	00050d93          	mv	s11,a0
    8f4c:	08071c63          	bnez	a4,8fe4 <_dtoa_r+0xe74>
    8f50:	00050593          	mv	a1,a0
    8f54:	00048513          	mv	a0,s1
    8f58:	310010ef          	jal	a268 <__mcmp>
    8f5c:	00050713          	mv	a4,a0
    8f60:	000d8593          	mv	a1,s11
    8f64:	00040513          	mv	a0,s0
    8f68:	00070d93          	mv	s11,a4
    8f6c:	1a5000ef          	jal	9910 <_Bfree>
    8f70:	014de6b3          	or	a3,s11,s4
    8f74:	0e069a63          	bnez	a3,9068 <_dtoa_r+0xef8>
    8f78:	00012783          	lw	a5,0(sp)
    8f7c:	76078e63          	beqz	a5,96f8 <_dtoa_r+0x1588>
    8f80:	7809c663          	bltz	s3,970c <_dtoa_r+0x159c>
    8f84:	017c8023          	sb	s7,0(s9)
    8f88:	001c8993          	add	s3,s9,1
    8f8c:	679d0e63          	beq	s10,s9,9608 <_dtoa_r+0x1498>
    8f90:	00048593          	mv	a1,s1
    8f94:	00000693          	li	a3,0
    8f98:	00a00613          	li	a2,10
    8f9c:	00040513          	mv	a0,s0
    8fa0:	195000ef          	jal	9934 <__multadd>
    8fa4:	00050493          	mv	s1,a0
    8fa8:	00000693          	li	a3,0
    8fac:	00a00613          	li	a2,10
    8fb0:	00090593          	mv	a1,s2
    8fb4:	00040513          	mv	a0,s0
    8fb8:	09690e63          	beq	s2,s6,9054 <_dtoa_r+0xee4>
    8fbc:	179000ef          	jal	9934 <__multadd>
    8fc0:	000b0593          	mv	a1,s6
    8fc4:	00050913          	mv	s2,a0
    8fc8:	00000693          	li	a3,0
    8fcc:	00a00613          	li	a2,10
    8fd0:	00040513          	mv	a0,s0
    8fd4:	161000ef          	jal	9934 <__multadd>
    8fd8:	00050b13          	mv	s6,a0
    8fdc:	00098c93          	mv	s9,s3
    8fe0:	f31ff06f          	j	8f10 <_dtoa_r+0xda0>
    8fe4:	00050593          	mv	a1,a0
    8fe8:	00040513          	mv	a0,s0
    8fec:	01012a83          	lw	s5,16(sp)
    8ff0:	01412d83          	lw	s11,20(sp)
    8ff4:	11d000ef          	jal	9910 <_Bfree>
    8ff8:	0009ca63          	bltz	s3,900c <_dtoa_r+0xe9c>
    8ffc:	001df713          	and	a4,s11,1
    9000:	0149e9b3          	or	s3,s3,s4
    9004:	01376733          	or	a4,a4,s3
    9008:	06071e63          	bnez	a4,9084 <_dtoa_r+0xf14>
    900c:	00048593          	mv	a1,s1
    9010:	00100613          	li	a2,1
    9014:	00040513          	mv	a0,s0
    9018:	0c0010ef          	jal	a0d8 <__lshift>
    901c:	01812583          	lw	a1,24(sp)
    9020:	00050493          	mv	s1,a0
    9024:	244010ef          	jal	a268 <__mcmp>
    9028:	24a05863          	blez	a0,9278 <_dtoa_r+0x1108>
    902c:	03900713          	li	a4,57
    9030:	24eb8c63          	beq	s7,a4,9288 <_dtoa_r+0x1118>
    9034:	031c0b93          	add	s7,s8,49
    9038:	02012783          	lw	a5,32(sp)
    903c:	00090c13          	mv	s8,s2
    9040:	001c8d13          	add	s10,s9,1
    9044:	017c8023          	sb	s7,0(s9)
    9048:	00178a13          	add	s4,a5,1
    904c:	000b0913          	mv	s2,s6
    9050:	cc5ff06f          	j	8d14 <_dtoa_r+0xba4>
    9054:	0e1000ef          	jal	9934 <__multadd>
    9058:	00050913          	mv	s2,a0
    905c:	00050b13          	mv	s6,a0
    9060:	00098c93          	mv	s9,s3
    9064:	eadff06f          	j	8f10 <_dtoa_r+0xda0>
    9068:	7409c863          	bltz	s3,97b8 <_dtoa_r+0x1648>
    906c:	00012783          	lw	a5,0(sp)
    9070:	0149e9b3          	or	s3,s3,s4
    9074:	0137e9b3          	or	s3,a5,s3
    9078:	74098063          	beqz	s3,97b8 <_dtoa_r+0x1648>
    907c:	f1b054e3          	blez	s11,8f84 <_dtoa_r+0xe14>
    9080:	01012a83          	lw	s5,16(sp)
    9084:	03900713          	li	a4,57
    9088:	20eb8063          	beq	s7,a4,9288 <_dtoa_r+0x1118>
    908c:	02012703          	lw	a4,32(sp)
    9090:	001b8793          	add	a5,s7,1
    9094:	00090c13          	mv	s8,s2
    9098:	001c8d13          	add	s10,s9,1
    909c:	00170a13          	add	s4,a4,1
    90a0:	00fc8023          	sb	a5,0(s9)
    90a4:	000b0913          	mv	s2,s6
    90a8:	c6dff06f          	j	8d14 <_dtoa_r+0xba4>
    90ac:	00200793          	li	a5,2
    90b0:	bb47dee3          	bge	a5,s4,8c6c <_dtoa_r+0xafc>
    90b4:	000a8d13          	mv	s10,s5
    90b8:	9a0c10e3          	bnez	s8,8a58 <_dtoa_r+0x8e8>
    90bc:	01812583          	lw	a1,24(sp)
    90c0:	00000693          	li	a3,0
    90c4:	00500613          	li	a2,5
    90c8:	00040513          	mv	a0,s0
    90cc:	069000ef          	jal	9934 <__multadd>
    90d0:	00050593          	mv	a1,a0
    90d4:	00a12c23          	sw	a0,24(sp)
    90d8:	00048513          	mv	a0,s1
    90dc:	18c010ef          	jal	a268 <__mcmp>
    90e0:	96a05ce3          	blez	a0,8a58 <_dtoa_r+0x8e8>
    90e4:	03100793          	li	a5,49
    90e8:	00fa8023          	sb	a5,0(s5)
    90ec:	02012783          	lw	a5,32(sp)
    90f0:	001a8d13          	add	s10,s5,1
    90f4:	00178a13          	add	s4,a5,1
    90f8:	01812583          	lw	a1,24(sp)
    90fc:	00040513          	mv	a0,s0
    9100:	001a0a13          	add	s4,s4,1
    9104:	00d000ef          	jal	9910 <_Bfree>
    9108:	c20918e3          	bnez	s2,8d38 <_dtoa_r+0xbc8>
    910c:	c39ff06f          	j	8d44 <_dtoa_r+0xbd4>
    9110:	00050593          	mv	a1,a0
    9114:	00098613          	mv	a2,s3
    9118:	00040513          	mv	a0,s0
    911c:	66d000ef          	jal	9f88 <__pow5mult>
    9120:	00100793          	li	a5,1
    9124:	00a12c23          	sw	a0,24(sp)
    9128:	1147de63          	bge	a5,s4,9244 <_dtoa_r+0x10d4>
    912c:	00000993          	li	s3,0
    9130:	01812703          	lw	a4,24(sp)
    9134:	01072783          	lw	a5,16(a4)
    9138:	00378793          	add	a5,a5,3
    913c:	00279793          	sll	a5,a5,0x2
    9140:	00f707b3          	add	a5,a4,a5
    9144:	0047a503          	lw	a0,4(a5)
    9148:	171000ef          	jal	9ab8 <__hi0bits>
    914c:	02000793          	li	a5,32
    9150:	40a787b3          	sub	a5,a5,a0
    9154:	ab5ff06f          	j	8c08 <_dtoa_r+0xa98>
    9158:	02412783          	lw	a5,36(sp)
    915c:	04079063          	bnez	a5,919c <_dtoa_r+0x102c>
    9160:	00012783          	lw	a5,0(sp)
    9164:	00c79793          	sll	a5,a5,0xc
    9168:	02079a63          	bnez	a5,919c <_dtoa_r+0x102c>
    916c:	00012683          	lw	a3,0(sp)
    9170:	00000793          	li	a5,0
    9174:	0146d713          	srl	a4,a3,0x14
    9178:	7ff77713          	and	a4,a4,2047
    917c:	00070c63          	beqz	a4,9194 <_dtoa_r+0x1024>
    9180:	01012783          	lw	a5,16(sp)
    9184:	001b0b13          	add	s6,s6,1
    9188:	00178793          	add	a5,a5,1
    918c:	00f12823          	sw	a5,16(sp)
    9190:	00100793          	li	a5,1
    9194:	58099063          	bnez	s3,9714 <_dtoa_r+0x15a4>
    9198:	00078993          	mv	s3,a5
    919c:	00100793          	li	a5,1
    91a0:	a69ff06f          	j	8c08 <_dtoa_r+0xa98>
    91a4:	a8d70ee3          	beq	a4,a3,8c40 <_dtoa_r+0xad0>
    91a8:	03c00713          	li	a4,60
    91ac:	40f707b3          	sub	a5,a4,a5
    91b0:	a7dff06f          	j	8c2c <_dtoa_r+0xabc>
    91b4:	00100793          	li	a5,1
    91b8:	00500a13          	li	s4,5
    91bc:	02f12423          	sw	a5,40(sp)
    91c0:	01412783          	lw	a5,20(sp)
    91c4:	02012703          	lw	a4,32(sp)
    91c8:	00e787b3          	add	a5,a5,a4
    91cc:	00178c13          	add	s8,a5,1
    91d0:	02f12e23          	sw	a5,60(sp)
    91d4:	000c0613          	mv	a2,s8
    91d8:	ab804263          	bgtz	s8,847c <_dtoa_r+0x30c>
    91dc:	00100613          	li	a2,1
    91e0:	a9cff06f          	j	847c <_dtoa_r+0x30c>
    91e4:	00051663          	bnez	a0,91f0 <_dtoa_r+0x1080>
    91e8:	001bf793          	and	a5,s7,1
    91ec:	b00792e3          	bnez	a5,8cf0 <_dtoa_r+0xb80>
    91f0:	03000693          	li	a3,48
    91f4:	fff9c783          	lbu	a5,-1(s3)
    91f8:	00098d13          	mv	s10,s3
    91fc:	fff98993          	add	s3,s3,-1
    9200:	fed78ae3          	beq	a5,a3,91f4 <_dtoa_r+0x1084>
    9204:	b11ff06f          	j	8d14 <_dtoa_r+0xba4>
    9208:	000c0993          	mv	s3,s8
    920c:	abdff06f          	j	8cc8 <_dtoa_r+0xb58>
    9210:	000b0793          	mv	a5,s6
    9214:	99dff06f          	j	8bb0 <_dtoa_r+0xa40>
    9218:	03012783          	lw	a5,48(sp)
    921c:	01012703          	lw	a4,16(sp)
    9220:	03712823          	sw	s7,48(sp)
    9224:	40fb87b3          	sub	a5,s7,a5
    9228:	00f989b3          	add	s3,s3,a5
    922c:	018707b3          	add	a5,a4,s8
    9230:	00070c93          	mv	s9,a4
    9234:	018b0b33          	add	s6,s6,s8
    9238:	00f12823          	sw	a5,16(sp)
    923c:	00000b93          	li	s7,0
    9240:	bd9ff06f          	j	8e18 <_dtoa_r+0xca8>
    9244:	02412783          	lw	a5,36(sp)
    9248:	ee0792e3          	bnez	a5,912c <_dtoa_r+0xfbc>
    924c:	00012783          	lw	a5,0(sp)
    9250:	00c79793          	sll	a5,a5,0xc
    9254:	ec079ce3          	bnez	a5,912c <_dtoa_r+0xfbc>
    9258:	f15ff06f          	j	916c <_dtoa_r+0xffc>
    925c:	01812303          	lw	t1,24(sp)
    9260:	01c12d03          	lw	s10,28(sp)
    9264:	00200913          	li	s2,2
    9268:	ad0ff06f          	j	8538 <_dtoa_r+0x3c8>
    926c:	00200a13          	li	s4,2
    9270:	02012423          	sw	zero,40(sp)
    9274:	9f8ff06f          	j	846c <_dtoa_r+0x2fc>
    9278:	dc0510e3          	bnez	a0,9038 <_dtoa_r+0xec8>
    927c:	001bf713          	and	a4,s7,1
    9280:	da0716e3          	bnez	a4,902c <_dtoa_r+0xebc>
    9284:	db5ff06f          	j	9038 <_dtoa_r+0xec8>
    9288:	03900793          	li	a5,57
    928c:	00fc8023          	sb	a5,0(s9)
    9290:	02012783          	lw	a5,32(sp)
    9294:	00090c13          	mv	s8,s2
    9298:	001c8993          	add	s3,s9,1
    929c:	00178a13          	add	s4,a5,1
    92a0:	000b0913          	mv	s2,s6
    92a4:	a4dff06f          	j	8cf0 <_dtoa_r+0xb80>
    92a8:	00100793          	li	a5,1
    92ac:	00100c13          	li	s8,1
    92b0:	00f12a23          	sw	a5,20(sp)
    92b4:	e50ff06f          	j	8904 <_dtoa_r+0x794>
    92b8:	02012423          	sw	zero,40(sp)
    92bc:	f05ff06f          	j	91c0 <_dtoa_r+0x1050>
    92c0:	03812703          	lw	a4,56(sp)
    92c4:	30070e63          	beqz	a4,95e0 <_dtoa_r+0x1470>
    92c8:	01012703          	lw	a4,16(sp)
    92cc:	43378793          	add	a5,a5,1075
    92d0:	00fb0b33          	add	s6,s6,a5
    92d4:	00f707b3          	add	a5,a4,a5
    92d8:	03012b83          	lw	s7,48(sp)
    92dc:	00070c93          	mv	s9,a4
    92e0:	00f12823          	sw	a5,16(sp)
    92e4:	b35ff06f          	j	8e18 <_dtoa_r+0xca8>
    92e8:	03100793          	li	a5,49
    92ec:	00fa8023          	sb	a5,0(s5)
    92f0:	001a0a13          	add	s4,s4,1
    92f4:	a21ff06f          	j	8d14 <_dtoa_r+0xba4>
    92f8:	02012783          	lw	a5,32(sp)
    92fc:	32078263          	beqz	a5,9620 <_dtoa_r+0x14b0>
    9300:	40f00bb3          	neg	s7,a5
    9304:	00fbf713          	and	a4,s7,15
    9308:	00371713          	sll	a4,a4,0x3
    930c:	00006797          	auipc	a5,0x6
    9310:	54c78793          	add	a5,a5,1356 # f858 <__mprec_tens>
    9314:	00e787b3          	add	a5,a5,a4
    9318:	0007a603          	lw	a2,0(a5)
    931c:	0047a683          	lw	a3,4(a5)
    9320:	01812503          	lw	a0,24(sp)
    9324:	01c12583          	lw	a1,28(sp)
    9328:	404bdb93          	sra	s7,s7,0x4
    932c:	3d4040ef          	jal	d700 <__muldf3>
    9330:	00058d13          	mv	s10,a1
    9334:	440b8c63          	beqz	s7,978c <_dtoa_r+0x161c>
    9338:	00200913          	li	s2,2
    933c:	04812023          	sw	s0,64(sp)
    9340:	00006c97          	auipc	s9,0x6
    9344:	4f0c8c93          	add	s9,s9,1264 # f830 <__mprec_bigtens>
    9348:	00090413          	mv	s0,s2
    934c:	00050713          	mv	a4,a0
    9350:	00000613          	li	a2,0
    9354:	00050913          	mv	s2,a0
    9358:	001bf693          	and	a3,s7,1
    935c:	02068063          	beqz	a3,937c <_dtoa_r+0x120c>
    9360:	000ca603          	lw	a2,0(s9)
    9364:	004ca683          	lw	a3,4(s9)
    9368:	00070513          	mv	a0,a4
    936c:	00140413          	add	s0,s0,1
    9370:	390040ef          	jal	d700 <__muldf3>
    9374:	00050713          	mv	a4,a0
    9378:	00100613          	li	a2,1
    937c:	401bdb93          	sra	s7,s7,0x1
    9380:	008c8c93          	add	s9,s9,8
    9384:	fc0b9ae3          	bnez	s7,9358 <_dtoa_r+0x11e8>
    9388:	00090513          	mv	a0,s2
    938c:	00058793          	mv	a5,a1
    9390:	00040913          	mv	s2,s0
    9394:	04012403          	lw	s0,64(sp)
    9398:	a0061a63          	bnez	a2,85ac <_dtoa_r+0x43c>
    939c:	00050713          	mv	a4,a0
    93a0:	000d0793          	mv	a5,s10
    93a4:	a08ff06f          	j	85ac <_dtoa_r+0x43c>
    93a8:	00068593          	mv	a1,a3
    93ac:	00070613          	mv	a2,a4
    93b0:	00070513          	mv	a0,a4
    93b4:	745020ef          	jal	c2f8 <__adddf3>
    93b8:	02012783          	lw	a5,32(sp)
    93bc:	00090613          	mv	a2,s2
    93c0:	00098693          	mv	a3,s3
    93c4:	00178a13          	add	s4,a5,1
    93c8:	00050c93          	mv	s9,a0
    93cc:	00058b13          	mv	s6,a1
    93d0:	000a0c13          	mv	s8,s4
    93d4:	124040ef          	jal	d4f8 <__gedf2>
    93d8:	c4a04863          	bgtz	a0,8828 <_dtoa_r+0x6b8>
    93dc:	000c8513          	mv	a0,s9
    93e0:	000b0593          	mv	a1,s6
    93e4:	00090613          	mv	a2,s2
    93e8:	00098693          	mv	a3,s3
    93ec:	080040ef          	jal	d46c <__eqdf2>
    93f0:	00051663          	bnez	a0,93fc <_dtoa_r+0x128c>
    93f4:	001d7d13          	and	s10,s10,1
    93f8:	c20d1863          	bnez	s10,8828 <_dtoa_r+0x6b8>
    93fc:	000b8d13          	mv	s10,s7
    9400:	945ff06f          	j	8d44 <_dtoa_r+0xbd4>
    9404:	00492583          	lw	a1,4(s2)
    9408:	00040513          	mv	a0,s0
    940c:	450000ef          	jal	985c <_Balloc>
    9410:	00050993          	mv	s3,a0
    9414:	38050463          	beqz	a0,979c <_dtoa_r+0x162c>
    9418:	01092603          	lw	a2,16(s2)
    941c:	00c90593          	add	a1,s2,12
    9420:	00c50513          	add	a0,a0,12
    9424:	00260613          	add	a2,a2,2
    9428:	00261613          	sll	a2,a2,0x2
    942c:	ccdf70ef          	jal	10f8 <memcpy>
    9430:	00100613          	li	a2,1
    9434:	00098593          	mv	a1,s3
    9438:	00040513          	mv	a0,s0
    943c:	49d000ef          	jal	a0d8 <__lshift>
    9440:	00050b13          	mv	s6,a0
    9444:	aa9ff06f          	j	8eec <_dtoa_r+0xd7c>
    9448:	00090593          	mv	a1,s2
    944c:	000b8613          	mv	a2,s7
    9450:	00040513          	mv	a0,s0
    9454:	335000ef          	jal	9f88 <__pow5mult>
    9458:	00048613          	mv	a2,s1
    945c:	00050593          	mv	a1,a0
    9460:	00050913          	mv	s2,a0
    9464:	00040513          	mv	a0,s0
    9468:	059000ef          	jal	9cc0 <__multiply>
    946c:	00050793          	mv	a5,a0
    9470:	00048593          	mv	a1,s1
    9474:	00040513          	mv	a0,s0
    9478:	00078493          	mv	s1,a5
    947c:	494000ef          	jal	9910 <_Bfree>
    9480:	03012783          	lw	a5,48(sp)
    9484:	417787b3          	sub	a5,a5,s7
    9488:	02f12823          	sw	a5,48(sp)
    948c:	f6078063          	beqz	a5,8bec <_dtoa_r+0xa7c>
    9490:	f48ff06f          	j	8bd8 <_dtoa_r+0xa68>
    9494:	05012603          	lw	a2,80(sp)
    9498:	05412683          	lw	a3,84(sp)
    949c:	05812503          	lw	a0,88(sp)
    94a0:	04b12623          	sw	a1,76(sp)
    94a4:	000b8593          	mv	a1,s7
    94a8:	02612423          	sw	t1,40(sp)
    94ac:	254040ef          	jal	d700 <__muldf3>
    94b0:	02812303          	lw	t1,40(sp)
    94b4:	04812783          	lw	a5,72(sp)
    94b8:	00100693          	li	a3,1
    94bc:	006a8023          	sb	t1,0(s5)
    94c0:	02a12c23          	sw	a0,56(sp)
    94c4:	04c12883          	lw	a7,76(sp)
    94c8:	00058913          	mv	s2,a1
    94cc:	00fa8bb3          	add	s7,s5,a5
    94d0:	7fff7617          	auipc	a2,0x7fff7
    94d4:	22060613          	add	a2,a2,544 # 800006f0 <__global_locale+0x1bc>
    94d8:	28d78c63          	beq	a5,a3,9770 <_dtoa_r+0x1600>
    94dc:	00062783          	lw	a5,0(a2)
    94e0:	00462803          	lw	a6,4(a2)
    94e4:	04912423          	sw	s1,72(sp)
    94e8:	02f12423          	sw	a5,40(sp)
    94ec:	03012623          	sw	a6,44(sp)
    94f0:	04812623          	sw	s0,76(sp)
    94f4:	000c8513          	mv	a0,s9
    94f8:	00088593          	mv	a1,a7
    94fc:	02812603          	lw	a2,40(sp)
    9500:	02c12683          	lw	a3,44(sp)
    9504:	001d0d13          	add	s10,s10,1
    9508:	1f8040ef          	jal	d700 <__muldf3>
    950c:	00058413          	mv	s0,a1
    9510:	00050493          	mv	s1,a0
    9514:	2d8050ef          	jal	e7ec <__fixdfsi>
    9518:	00050c93          	mv	s9,a0
    951c:	354050ef          	jal	e870 <__floatsidf>
    9520:	00050613          	mv	a2,a0
    9524:	00058693          	mv	a3,a1
    9528:	00048513          	mv	a0,s1
    952c:	00040593          	mv	a1,s0
    9530:	030c8c93          	add	s9,s9,48
    9534:	15d040ef          	jal	de90 <__subdf3>
    9538:	ff9d0fa3          	sb	s9,-1(s10)
    953c:	fdab90e3          	bne	s7,s10,94fc <_dtoa_r+0x138c>
    9540:	04812483          	lw	s1,72(sp)
    9544:	04c12403          	lw	s0,76(sp)
    9548:	00050c93          	mv	s9,a0
    954c:	00058893          	mv	a7,a1
    9550:	7fff7d17          	auipc	s10,0x7fff7
    9554:	168d0d13          	add	s10,s10,360 # 800006b8 <__global_locale+0x184>
    9558:	000d2603          	lw	a2,0(s10)
    955c:	004d2683          	lw	a3,4(s10)
    9560:	03812503          	lw	a0,56(sp)
    9564:	00090593          	mv	a1,s2
    9568:	03112423          	sw	a7,40(sp)
    956c:	58d020ef          	jal	c2f8 <__adddf3>
    9570:	02812883          	lw	a7,40(sp)
    9574:	000c8613          	mv	a2,s9
    9578:	00088693          	mv	a3,a7
    957c:	07c040ef          	jal	d5f8 <__ledf2>
    9580:	1a054863          	bltz	a0,9730 <_dtoa_r+0x15c0>
    9584:	03812603          	lw	a2,56(sp)
    9588:	000d2503          	lw	a0,0(s10)
    958c:	004d2583          	lw	a1,4(s10)
    9590:	00090693          	mv	a3,s2
    9594:	0fd040ef          	jal	de90 <__subdf3>
    9598:	02812883          	lw	a7,40(sp)
    959c:	000c8613          	mv	a2,s9
    95a0:	00088693          	mv	a3,a7
    95a4:	755030ef          	jal	d4f8 <__gedf2>
    95a8:	12a04863          	bgtz	a0,96d8 <_dtoa_r+0x1568>
    95ac:	06c12783          	lw	a5,108(sp)
    95b0:	de07c063          	bltz	a5,8b90 <_dtoa_r+0xa20>
    95b4:	02012703          	lw	a4,32(sp)
    95b8:	00e00793          	li	a5,14
    95bc:	dce7ca63          	blt	a5,a4,8b90 <_dtoa_r+0xa20>
    95c0:	02012783          	lw	a5,32(sp)
    95c4:	00006717          	auipc	a4,0x6
    95c8:	29470713          	add	a4,a4,660 # f858 <__mprec_tens>
    95cc:	00379793          	sll	a5,a5,0x3
    95d0:	00f707b3          	add	a5,a4,a5
    95d4:	0007a903          	lw	s2,0(a5)
    95d8:	0047a983          	lw	s3,4(a5)
    95dc:	c90ff06f          	j	8a6c <_dtoa_r+0x8fc>
    95e0:	06812703          	lw	a4,104(sp)
    95e4:	01012683          	lw	a3,16(sp)
    95e8:	03600793          	li	a5,54
    95ec:	40e787b3          	sub	a5,a5,a4
    95f0:	00fb0b33          	add	s6,s6,a5
    95f4:	00f687b3          	add	a5,a3,a5
    95f8:	03012b83          	lw	s7,48(sp)
    95fc:	00068c93          	mv	s9,a3
    9600:	00f12823          	sw	a5,16(sp)
    9604:	815ff06f          	j	8e18 <_dtoa_r+0xca8>
    9608:	02012783          	lw	a5,32(sp)
    960c:	00090c13          	mv	s8,s2
    9610:	01012a83          	lw	s5,16(sp)
    9614:	00178a13          	add	s4,a5,1
    9618:	000b0913          	mv	s2,s6
    961c:	eb4ff06f          	j	8cd0 <_dtoa_r+0xb60>
    9620:	01812703          	lw	a4,24(sp)
    9624:	01c12783          	lw	a5,28(sp)
    9628:	00200913          	li	s2,2
    962c:	f81fe06f          	j	85ac <_dtoa_r+0x43c>
    9630:	b00c0063          	beqz	s8,8930 <_dtoa_r+0x7c0>
    9634:	03c12d03          	lw	s10,60(sp)
    9638:	bba05063          	blez	s10,89d8 <_dtoa_r+0x868>
    963c:	7fff7617          	auipc	a2,0x7fff7
    9640:	0b460613          	add	a2,a2,180 # 800006f0 <__global_locale+0x1bc>
    9644:	00078593          	mv	a1,a5
    9648:	02012783          	lw	a5,32(sp)
    964c:	00462683          	lw	a3,4(a2)
    9650:	00062603          	lw	a2,0(a2)
    9654:	fff78793          	add	a5,a5,-1
    9658:	00070513          	mv	a0,a4
    965c:	04f12e23          	sw	a5,92(sp)
    9660:	0a0040ef          	jal	d700 <__muldf3>
    9664:	00050713          	mv	a4,a0
    9668:	00190513          	add	a0,s2,1
    966c:	04e12423          	sw	a4,72(sp)
    9670:	04b12023          	sw	a1,64(sp)
    9674:	1fc050ef          	jal	e870 <__floatsidf>
    9678:	04812703          	lw	a4,72(sp)
    967c:	04012783          	lw	a5,64(sp)
    9680:	00070613          	mv	a2,a4
    9684:	00078693          	mv	a3,a5
    9688:	04e12623          	sw	a4,76(sp)
    968c:	074040ef          	jal	d700 <__muldf3>
    9690:	7fff7697          	auipc	a3,0x7fff7
    9694:	06868693          	add	a3,a3,104 # 800006f8 <__global_locale+0x1c4>
    9698:	0006a603          	lw	a2,0(a3)
    969c:	0046a683          	lw	a3,4(a3)
    96a0:	459020ef          	jal	c2f8 <__adddf3>
    96a4:	fcc006b7          	lui	a3,0xfcc00
    96a8:	04012783          	lw	a5,64(sp)
    96ac:	04c12703          	lw	a4,76(sp)
    96b0:	00050c93          	mv	s9,a0
    96b4:	00b68bb3          	add	s7,a3,a1
    96b8:	05a12423          	sw	s10,72(sp)
    96bc:	f91fe06f          	j	864c <_dtoa_r+0x4dc>
    96c0:	03100693          	li	a3,49
    96c4:	001c0c13          	add	s8,s8,1
    96c8:	984ff06f          	j	884c <_dtoa_r+0x6dc>
    96cc:	00012c23          	sw	zero,24(sp)
    96d0:	00000913          	li	s2,0
    96d4:	a11ff06f          	j	90e4 <_dtoa_r+0xf74>
    96d8:	03000613          	li	a2,48
    96dc:	fffbc783          	lbu	a5,-1(s7)
    96e0:	000b8d13          	mv	s10,s7
    96e4:	fffb8b93          	add	s7,s7,-1
    96e8:	fec78ae3          	beq	a5,a2,96dc <_dtoa_r+0x156c>
    96ec:	05c12783          	lw	a5,92(sp)
    96f0:	00178a13          	add	s4,a5,1
    96f4:	e50ff06f          	j	8d44 <_dtoa_r+0xbd4>
    96f8:	03900713          	li	a4,57
    96fc:	01012a83          	lw	s5,16(sp)
    9700:	b8eb84e3          	beq	s7,a4,9288 <_dtoa_r+0x1118>
    9704:	933048e3          	bgtz	s3,9034 <_dtoa_r+0xec4>
    9708:	931ff06f          	j	9038 <_dtoa_r+0xec8>
    970c:	01012a83          	lw	s5,16(sp)
    9710:	929ff06f          	j	9038 <_dtoa_r+0xec8>
    9714:	00078993          	mv	s3,a5
    9718:	a19ff06f          	j	9130 <_dtoa_r+0xfc0>
    971c:	00078c93          	mv	s9,a5
    9720:	018787b3          	add	a5,a5,s8
    9724:	018b0b33          	add	s6,s6,s8
    9728:	00f12823          	sw	a5,16(sp)
    972c:	eecff06f          	j	8e18 <_dtoa_r+0xca8>
    9730:	05c12783          	lw	a5,92(sp)
    9734:	00178c13          	add	s8,a5,1
    9738:	8f0ff06f          	j	8828 <_dtoa_r+0x6b8>
    973c:	04c12983          	lw	s3,76(sp)
    9740:	05012b03          	lw	s6,80(sp)
    9744:	05812c03          	lw	s8,88(sp)
    9748:	04812a03          	lw	s4,72(sp)
    974c:	a8cff06f          	j	89d8 <_dtoa_r+0x868>
    9750:	00200793          	li	a5,2
    9754:	0147c863          	blt	a5,s4,9764 <_dtoa_r+0x15f4>
    9758:	02012a03          	lw	s4,32(sp)
    975c:	03c12c03          	lw	s8,60(sp)
    9760:	d1cff06f          	j	8c7c <_dtoa_r+0xb0c>
    9764:	03c12c03          	lw	s8,60(sp)
    9768:	03612023          	sw	s6,32(sp)
    976c:	949ff06f          	j	90b4 <_dtoa_r+0xf44>
    9770:	04012b83          	lw	s7,64(sp)
    9774:	dddff06f          	j	9550 <_dtoa_r+0x13e0>
    9778:	00200793          	li	a5,2
    977c:	ff47c4e3          	blt	a5,s4,9764 <_dtoa_r+0x15f4>
    9780:	03c12c03          	lw	s8,60(sp)
    9784:	03612023          	sw	s6,32(sp)
    9788:	f44ff06f          	j	8ecc <_dtoa_r+0xd5c>
    978c:	00050713          	mv	a4,a0
    9790:	00058793          	mv	a5,a1
    9794:	00200913          	li	s2,2
    9798:	e15fe06f          	j	85ac <_dtoa_r+0x43c>
    979c:	00006697          	auipc	a3,0x6
    97a0:	a7c68693          	add	a3,a3,-1412 # f218 <__fini_array_end+0x258>
    97a4:	00000613          	li	a2,0
    97a8:	2ef00593          	li	a1,751
    97ac:	00006517          	auipc	a0,0x6
    97b0:	a8050513          	add	a0,a0,-1408 # f22c <__fini_array_end+0x26c>
    97b4:	0cd010ef          	jal	b080 <__assert_func>
    97b8:	01012a83          	lw	s5,16(sp)
    97bc:	85b048e3          	bgtz	s11,900c <_dtoa_r+0xe9c>
    97c0:	879ff06f          	j	9038 <_dtoa_r+0xec8>
    97c4:	00006697          	auipc	a3,0x6
    97c8:	a5468693          	add	a3,a3,-1452 # f218 <__fini_array_end+0x258>
    97cc:	00000613          	li	a2,0
    97d0:	1af00593          	li	a1,431
    97d4:	00006517          	auipc	a0,0x6
    97d8:	a5850513          	add	a0,a0,-1448 # f22c <__fini_array_end+0x26c>
    97dc:	0a5010ef          	jal	b080 <__assert_func>
    97e0:	02042e23          	sw	zero,60(s0)
    97e4:	00000593          	li	a1,0
    97e8:	cc1fe06f          	j	84a8 <_dtoa_r+0x338>
    97ec:	02012423          	sw	zero,40(sp)
    97f0:	c7dfe06f          	j	846c <_dtoa_r+0x2fc>

000097f4 <__ascii_mbtowc>:
    97f4:	02058063          	beqz	a1,9814 <__ascii_mbtowc+0x20>
    97f8:	04060263          	beqz	a2,983c <__ascii_mbtowc+0x48>
    97fc:	04068863          	beqz	a3,984c <__ascii_mbtowc+0x58>
    9800:	00064783          	lbu	a5,0(a2)
    9804:	00f5a023          	sw	a5,0(a1)
    9808:	00064503          	lbu	a0,0(a2)
    980c:	00a03533          	snez	a0,a0
    9810:	00008067          	ret
    9814:	ff010113          	add	sp,sp,-16
    9818:	00c10593          	add	a1,sp,12
    981c:	02060463          	beqz	a2,9844 <__ascii_mbtowc+0x50>
    9820:	02068a63          	beqz	a3,9854 <__ascii_mbtowc+0x60>
    9824:	00064783          	lbu	a5,0(a2)
    9828:	00f5a023          	sw	a5,0(a1)
    982c:	00064503          	lbu	a0,0(a2)
    9830:	00a03533          	snez	a0,a0
    9834:	01010113          	add	sp,sp,16
    9838:	00008067          	ret
    983c:	00000513          	li	a0,0
    9840:	00008067          	ret
    9844:	00000513          	li	a0,0
    9848:	fedff06f          	j	9834 <__ascii_mbtowc+0x40>
    984c:	ffe00513          	li	a0,-2
    9850:	00008067          	ret
    9854:	ffe00513          	li	a0,-2
    9858:	fddff06f          	j	9834 <__ascii_mbtowc+0x40>

0000985c <_Balloc>:
    985c:	04452783          	lw	a5,68(a0)
    9860:	ff010113          	add	sp,sp,-16
    9864:	00812423          	sw	s0,8(sp)
    9868:	00912223          	sw	s1,4(sp)
    986c:	00112623          	sw	ra,12(sp)
    9870:	00050413          	mv	s0,a0
    9874:	00058493          	mv	s1,a1
    9878:	02078c63          	beqz	a5,98b0 <_Balloc+0x54>
    987c:	00249713          	sll	a4,s1,0x2
    9880:	00e787b3          	add	a5,a5,a4
    9884:	0007a503          	lw	a0,0(a5)
    9888:	04050463          	beqz	a0,98d0 <_Balloc+0x74>
    988c:	00052703          	lw	a4,0(a0)
    9890:	00e7a023          	sw	a4,0(a5)
    9894:	00052823          	sw	zero,16(a0)
    9898:	00052623          	sw	zero,12(a0)
    989c:	00c12083          	lw	ra,12(sp)
    98a0:	00812403          	lw	s0,8(sp)
    98a4:	00412483          	lw	s1,4(sp)
    98a8:	01010113          	add	sp,sp,16
    98ac:	00008067          	ret
    98b0:	02100613          	li	a2,33
    98b4:	00400593          	li	a1,4
    98b8:	021010ef          	jal	b0d8 <_calloc_r>
    98bc:	04a42223          	sw	a0,68(s0)
    98c0:	00050793          	mv	a5,a0
    98c4:	fa051ce3          	bnez	a0,987c <_Balloc+0x20>
    98c8:	00000513          	li	a0,0
    98cc:	fd1ff06f          	j	989c <_Balloc+0x40>
    98d0:	01212023          	sw	s2,0(sp)
    98d4:	00100913          	li	s2,1
    98d8:	00991933          	sll	s2,s2,s1
    98dc:	00590613          	add	a2,s2,5
    98e0:	00261613          	sll	a2,a2,0x2
    98e4:	00100593          	li	a1,1
    98e8:	00040513          	mv	a0,s0
    98ec:	7ec010ef          	jal	b0d8 <_calloc_r>
    98f0:	00050a63          	beqz	a0,9904 <_Balloc+0xa8>
    98f4:	01252423          	sw	s2,8(a0)
    98f8:	00952223          	sw	s1,4(a0)
    98fc:	00012903          	lw	s2,0(sp)
    9900:	f95ff06f          	j	9894 <_Balloc+0x38>
    9904:	00012903          	lw	s2,0(sp)
    9908:	00000513          	li	a0,0
    990c:	f91ff06f          	j	989c <_Balloc+0x40>

00009910 <_Bfree>:
    9910:	02058063          	beqz	a1,9930 <_Bfree+0x20>
    9914:	0045a703          	lw	a4,4(a1)
    9918:	04452783          	lw	a5,68(a0)
    991c:	00271713          	sll	a4,a4,0x2
    9920:	00e787b3          	add	a5,a5,a4
    9924:	0007a703          	lw	a4,0(a5)
    9928:	00e5a023          	sw	a4,0(a1)
    992c:	00b7a023          	sw	a1,0(a5)
    9930:	00008067          	ret

00009934 <__multadd>:
    9934:	fd010113          	add	sp,sp,-48
    9938:	01412c23          	sw	s4,24(sp)
    993c:	0105aa03          	lw	s4,16(a1)
    9940:	01912223          	sw	s9,4(sp)
    9944:	00010cb7          	lui	s9,0x10
    9948:	02912223          	sw	s1,36(sp)
    994c:	03212023          	sw	s2,32(sp)
    9950:	01312e23          	sw	s3,28(sp)
    9954:	01512a23          	sw	s5,20(sp)
    9958:	01612823          	sw	s6,16(sp)
    995c:	01712623          	sw	s7,12(sp)
    9960:	02112623          	sw	ra,44(sp)
    9964:	02812423          	sw	s0,40(sp)
    9968:	01812423          	sw	s8,8(sp)
    996c:	00058a93          	mv	s5,a1
    9970:	00050b13          	mv	s6,a0
    9974:	00060993          	mv	s3,a2
    9978:	00068493          	mv	s1,a3
    997c:	01458913          	add	s2,a1,20
    9980:	00000b93          	li	s7,0
    9984:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    9988:	00092c03          	lw	s8,0(s2)
    998c:	00098593          	mv	a1,s3
    9990:	00490913          	add	s2,s2,4
    9994:	019c7533          	and	a0,s8,s9
    9998:	430050ef          	jal	edc8 <__mulsi3>
    999c:	00050413          	mv	s0,a0
    99a0:	00098593          	mv	a1,s3
    99a4:	010c5513          	srl	a0,s8,0x10
    99a8:	00940433          	add	s0,s0,s1
    99ac:	41c050ef          	jal	edc8 <__mulsi3>
    99b0:	01045793          	srl	a5,s0,0x10
    99b4:	00f50533          	add	a0,a0,a5
    99b8:	01051793          	sll	a5,a0,0x10
    99bc:	01947433          	and	s0,s0,s9
    99c0:	008787b3          	add	a5,a5,s0
    99c4:	fef92e23          	sw	a5,-4(s2)
    99c8:	001b8b93          	add	s7,s7,1
    99cc:	01055493          	srl	s1,a0,0x10
    99d0:	fb4bcce3          	blt	s7,s4,9988 <__multadd+0x54>
    99d4:	02048263          	beqz	s1,99f8 <__multadd+0xc4>
    99d8:	008aa783          	lw	a5,8(s5)
    99dc:	04fa5a63          	bge	s4,a5,9a30 <__multadd+0xfc>
    99e0:	004a0793          	add	a5,s4,4
    99e4:	00279793          	sll	a5,a5,0x2
    99e8:	00fa87b3          	add	a5,s5,a5
    99ec:	0097a223          	sw	s1,4(a5)
    99f0:	001a0a13          	add	s4,s4,1
    99f4:	014aa823          	sw	s4,16(s5)
    99f8:	02c12083          	lw	ra,44(sp)
    99fc:	02812403          	lw	s0,40(sp)
    9a00:	02412483          	lw	s1,36(sp)
    9a04:	02012903          	lw	s2,32(sp)
    9a08:	01c12983          	lw	s3,28(sp)
    9a0c:	01812a03          	lw	s4,24(sp)
    9a10:	01012b03          	lw	s6,16(sp)
    9a14:	00c12b83          	lw	s7,12(sp)
    9a18:	00812c03          	lw	s8,8(sp)
    9a1c:	00412c83          	lw	s9,4(sp)
    9a20:	000a8513          	mv	a0,s5
    9a24:	01412a83          	lw	s5,20(sp)
    9a28:	03010113          	add	sp,sp,48
    9a2c:	00008067          	ret
    9a30:	004aa583          	lw	a1,4(s5)
    9a34:	000b0513          	mv	a0,s6
    9a38:	00158593          	add	a1,a1,1
    9a3c:	e21ff0ef          	jal	985c <_Balloc>
    9a40:	00050413          	mv	s0,a0
    9a44:	04050c63          	beqz	a0,9a9c <__multadd+0x168>
    9a48:	010aa603          	lw	a2,16(s5)
    9a4c:	00ca8593          	add	a1,s5,12
    9a50:	00c50513          	add	a0,a0,12
    9a54:	00260613          	add	a2,a2,2
    9a58:	00261613          	sll	a2,a2,0x2
    9a5c:	e9cf70ef          	jal	10f8 <memcpy>
    9a60:	004aa703          	lw	a4,4(s5)
    9a64:	044b2783          	lw	a5,68(s6)
    9a68:	00271713          	sll	a4,a4,0x2
    9a6c:	00e787b3          	add	a5,a5,a4
    9a70:	0007a703          	lw	a4,0(a5)
    9a74:	00eaa023          	sw	a4,0(s5)
    9a78:	0157a023          	sw	s5,0(a5)
    9a7c:	004a0793          	add	a5,s4,4
    9a80:	00040a93          	mv	s5,s0
    9a84:	00279793          	sll	a5,a5,0x2
    9a88:	00fa87b3          	add	a5,s5,a5
    9a8c:	0097a223          	sw	s1,4(a5)
    9a90:	001a0a13          	add	s4,s4,1
    9a94:	014aa823          	sw	s4,16(s5)
    9a98:	f61ff06f          	j	99f8 <__multadd+0xc4>
    9a9c:	00005697          	auipc	a3,0x5
    9aa0:	77c68693          	add	a3,a3,1916 # f218 <__fini_array_end+0x258>
    9aa4:	00000613          	li	a2,0
    9aa8:	0ba00593          	li	a1,186
    9aac:	00006517          	auipc	a0,0x6
    9ab0:	80050513          	add	a0,a0,-2048 # f2ac <__fini_array_end+0x2ec>
    9ab4:	5cc010ef          	jal	b080 <__assert_func>

00009ab8 <__hi0bits>:
    9ab8:	00050793          	mv	a5,a0
    9abc:	00010737          	lui	a4,0x10
    9ac0:	00000513          	li	a0,0
    9ac4:	00e7f663          	bgeu	a5,a4,9ad0 <__hi0bits+0x18>
    9ac8:	01079793          	sll	a5,a5,0x10
    9acc:	01000513          	li	a0,16
    9ad0:	01000737          	lui	a4,0x1000
    9ad4:	00e7f663          	bgeu	a5,a4,9ae0 <__hi0bits+0x28>
    9ad8:	00850513          	add	a0,a0,8
    9adc:	00879793          	sll	a5,a5,0x8
    9ae0:	10000737          	lui	a4,0x10000
    9ae4:	00e7f663          	bgeu	a5,a4,9af0 <__hi0bits+0x38>
    9ae8:	00450513          	add	a0,a0,4
    9aec:	00479793          	sll	a5,a5,0x4
    9af0:	40000737          	lui	a4,0x40000
    9af4:	00e7ea63          	bltu	a5,a4,9b08 <__hi0bits+0x50>
    9af8:	fff7c793          	not	a5,a5
    9afc:	01f7d793          	srl	a5,a5,0x1f
    9b00:	00f50533          	add	a0,a0,a5
    9b04:	00008067          	ret
    9b08:	00279793          	sll	a5,a5,0x2
    9b0c:	0007ca63          	bltz	a5,9b20 <__hi0bits+0x68>
    9b10:	00179713          	sll	a4,a5,0x1
    9b14:	00074a63          	bltz	a4,9b28 <__hi0bits+0x70>
    9b18:	02000513          	li	a0,32
    9b1c:	00008067          	ret
    9b20:	00250513          	add	a0,a0,2
    9b24:	00008067          	ret
    9b28:	00350513          	add	a0,a0,3
    9b2c:	00008067          	ret

00009b30 <__lo0bits>:
    9b30:	00052783          	lw	a5,0(a0)
    9b34:	00050713          	mv	a4,a0
    9b38:	0077f693          	and	a3,a5,7
    9b3c:	02068463          	beqz	a3,9b64 <__lo0bits+0x34>
    9b40:	0017f693          	and	a3,a5,1
    9b44:	00000513          	li	a0,0
    9b48:	04069e63          	bnez	a3,9ba4 <__lo0bits+0x74>
    9b4c:	0027f693          	and	a3,a5,2
    9b50:	0a068863          	beqz	a3,9c00 <__lo0bits+0xd0>
    9b54:	0017d793          	srl	a5,a5,0x1
    9b58:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9b5c:	00100513          	li	a0,1
    9b60:	00008067          	ret
    9b64:	01079693          	sll	a3,a5,0x10
    9b68:	0106d693          	srl	a3,a3,0x10
    9b6c:	00000513          	li	a0,0
    9b70:	06068e63          	beqz	a3,9bec <__lo0bits+0xbc>
    9b74:	0ff7f693          	zext.b	a3,a5
    9b78:	06068063          	beqz	a3,9bd8 <__lo0bits+0xa8>
    9b7c:	00f7f693          	and	a3,a5,15
    9b80:	04068263          	beqz	a3,9bc4 <__lo0bits+0x94>
    9b84:	0037f693          	and	a3,a5,3
    9b88:	02068463          	beqz	a3,9bb0 <__lo0bits+0x80>
    9b8c:	0017f693          	and	a3,a5,1
    9b90:	00069c63          	bnez	a3,9ba8 <__lo0bits+0x78>
    9b94:	0017d793          	srl	a5,a5,0x1
    9b98:	00150513          	add	a0,a0,1
    9b9c:	00079663          	bnez	a5,9ba8 <__lo0bits+0x78>
    9ba0:	02000513          	li	a0,32
    9ba4:	00008067          	ret
    9ba8:	00f72023          	sw	a5,0(a4)
    9bac:	00008067          	ret
    9bb0:	0027d793          	srl	a5,a5,0x2
    9bb4:	0017f693          	and	a3,a5,1
    9bb8:	00250513          	add	a0,a0,2
    9bbc:	fe0696e3          	bnez	a3,9ba8 <__lo0bits+0x78>
    9bc0:	fd5ff06f          	j	9b94 <__lo0bits+0x64>
    9bc4:	0047d793          	srl	a5,a5,0x4
    9bc8:	0037f693          	and	a3,a5,3
    9bcc:	00450513          	add	a0,a0,4
    9bd0:	fa069ee3          	bnez	a3,9b8c <__lo0bits+0x5c>
    9bd4:	fddff06f          	j	9bb0 <__lo0bits+0x80>
    9bd8:	0087d793          	srl	a5,a5,0x8
    9bdc:	00f7f693          	and	a3,a5,15
    9be0:	00850513          	add	a0,a0,8
    9be4:	fa0690e3          	bnez	a3,9b84 <__lo0bits+0x54>
    9be8:	fddff06f          	j	9bc4 <__lo0bits+0x94>
    9bec:	0107d793          	srl	a5,a5,0x10
    9bf0:	0ff7f693          	zext.b	a3,a5
    9bf4:	01000513          	li	a0,16
    9bf8:	f80692e3          	bnez	a3,9b7c <__lo0bits+0x4c>
    9bfc:	fddff06f          	j	9bd8 <__lo0bits+0xa8>
    9c00:	0027d793          	srl	a5,a5,0x2
    9c04:	00f72023          	sw	a5,0(a4)
    9c08:	00200513          	li	a0,2
    9c0c:	00008067          	ret

00009c10 <__i2b>:
    9c10:	04452783          	lw	a5,68(a0)
    9c14:	ff010113          	add	sp,sp,-16
    9c18:	00812423          	sw	s0,8(sp)
    9c1c:	00912223          	sw	s1,4(sp)
    9c20:	00112623          	sw	ra,12(sp)
    9c24:	00050413          	mv	s0,a0
    9c28:	00058493          	mv	s1,a1
    9c2c:	02078c63          	beqz	a5,9c64 <__i2b+0x54>
    9c30:	0047a503          	lw	a0,4(a5)
    9c34:	06050263          	beqz	a0,9c98 <__i2b+0x88>
    9c38:	00052703          	lw	a4,0(a0)
    9c3c:	00e7a223          	sw	a4,4(a5)
    9c40:	00c12083          	lw	ra,12(sp)
    9c44:	00812403          	lw	s0,8(sp)
    9c48:	00100793          	li	a5,1
    9c4c:	00952a23          	sw	s1,20(a0)
    9c50:	00052623          	sw	zero,12(a0)
    9c54:	00f52823          	sw	a5,16(a0)
    9c58:	00412483          	lw	s1,4(sp)
    9c5c:	01010113          	add	sp,sp,16
    9c60:	00008067          	ret
    9c64:	02100613          	li	a2,33
    9c68:	00400593          	li	a1,4
    9c6c:	46c010ef          	jal	b0d8 <_calloc_r>
    9c70:	04a42223          	sw	a0,68(s0)
    9c74:	00050793          	mv	a5,a0
    9c78:	fa051ce3          	bnez	a0,9c30 <__i2b+0x20>
    9c7c:	00005697          	auipc	a3,0x5
    9c80:	59c68693          	add	a3,a3,1436 # f218 <__fini_array_end+0x258>
    9c84:	00000613          	li	a2,0
    9c88:	14500593          	li	a1,325
    9c8c:	00005517          	auipc	a0,0x5
    9c90:	62050513          	add	a0,a0,1568 # f2ac <__fini_array_end+0x2ec>
    9c94:	3ec010ef          	jal	b080 <__assert_func>
    9c98:	01c00613          	li	a2,28
    9c9c:	00100593          	li	a1,1
    9ca0:	00040513          	mv	a0,s0
    9ca4:	434010ef          	jal	b0d8 <_calloc_r>
    9ca8:	fc050ae3          	beqz	a0,9c7c <__i2b+0x6c>
    9cac:	00100793          	li	a5,1
    9cb0:	00f52223          	sw	a5,4(a0)
    9cb4:	00200793          	li	a5,2
    9cb8:	00f52423          	sw	a5,8(a0)
    9cbc:	f85ff06f          	j	9c40 <__i2b+0x30>

00009cc0 <__multiply>:
    9cc0:	fb010113          	add	sp,sp,-80
    9cc4:	03312e23          	sw	s3,60(sp)
    9cc8:	03812423          	sw	s8,40(sp)
    9ccc:	01062983          	lw	s3,16(a2)
    9cd0:	0105ac03          	lw	s8,16(a1)
    9cd4:	04812423          	sw	s0,72(sp)
    9cd8:	03412c23          	sw	s4,56(sp)
    9cdc:	04112623          	sw	ra,76(sp)
    9ce0:	03712623          	sw	s7,44(sp)
    9ce4:	00058a13          	mv	s4,a1
    9ce8:	00060413          	mv	s0,a2
    9cec:	013c4c63          	blt	s8,s3,9d04 <__multiply+0x44>
    9cf0:	00098713          	mv	a4,s3
    9cf4:	00058413          	mv	s0,a1
    9cf8:	000c0993          	mv	s3,s8
    9cfc:	00060a13          	mv	s4,a2
    9d00:	00070c13          	mv	s8,a4
    9d04:	00842783          	lw	a5,8(s0)
    9d08:	00442583          	lw	a1,4(s0)
    9d0c:	01898bb3          	add	s7,s3,s8
    9d10:	0177a7b3          	slt	a5,a5,s7
    9d14:	00f585b3          	add	a1,a1,a5
    9d18:	b45ff0ef          	jal	985c <_Balloc>
    9d1c:	00a12623          	sw	a0,12(sp)
    9d20:	22050863          	beqz	a0,9f50 <__multiply+0x290>
    9d24:	00c12783          	lw	a5,12(sp)
    9d28:	03512a23          	sw	s5,52(sp)
    9d2c:	03612823          	sw	s6,48(sp)
    9d30:	002b9a93          	sll	s5,s7,0x2
    9d34:	01478b13          	add	s6,a5,20
    9d38:	015b0ab3          	add	s5,s6,s5
    9d3c:	000b0793          	mv	a5,s6
    9d40:	015b7863          	bgeu	s6,s5,9d50 <__multiply+0x90>
    9d44:	0007a023          	sw	zero,0(a5)
    9d48:	00478793          	add	a5,a5,4
    9d4c:	ff57ece3          	bltu	a5,s5,9d44 <__multiply+0x84>
    9d50:	014a0a13          	add	s4,s4,20
    9d54:	002c1c13          	sll	s8,s8,0x2
    9d58:	01440793          	add	a5,s0,20
    9d5c:	018a0733          	add	a4,s4,s8
    9d60:	00299993          	sll	s3,s3,0x2
    9d64:	00f12423          	sw	a5,8(sp)
    9d68:	00e12023          	sw	a4,0(sp)
    9d6c:	013789b3          	add	s3,a5,s3
    9d70:	16ea7c63          	bgeu	s4,a4,9ee8 <__multiply+0x228>
    9d74:	00400713          	li	a4,4
    9d78:	04912223          	sw	s1,68(sp)
    9d7c:	05212023          	sw	s2,64(sp)
    9d80:	03912223          	sw	s9,36(sp)
    9d84:	03a12023          	sw	s10,32(sp)
    9d88:	01b12e23          	sw	s11,28(sp)
    9d8c:	01540793          	add	a5,s0,21
    9d90:	00e12223          	sw	a4,4(sp)
    9d94:	1af9f263          	bgeu	s3,a5,9f38 <__multiply+0x278>
    9d98:	00010437          	lui	s0,0x10
    9d9c:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    9da0:	01c0006f          	j	9dbc <__multiply+0xfc>
    9da4:	01095913          	srl	s2,s2,0x10
    9da8:	0a091063          	bnez	s2,9e48 <__multiply+0x188>
    9dac:	00012783          	lw	a5,0(sp)
    9db0:	004a0a13          	add	s4,s4,4
    9db4:	004b0b13          	add	s6,s6,4
    9db8:	10fa7e63          	bgeu	s4,a5,9ed4 <__multiply+0x214>
    9dbc:	000a2903          	lw	s2,0(s4)
    9dc0:	008974b3          	and	s1,s2,s0
    9dc4:	fe0480e3          	beqz	s1,9da4 <__multiply+0xe4>
    9dc8:	00812c83          	lw	s9,8(sp)
    9dcc:	000b0d13          	mv	s10,s6
    9dd0:	00000c13          	li	s8,0
    9dd4:	000cad83          	lw	s11,0(s9)
    9dd8:	000d2903          	lw	s2,0(s10)
    9ddc:	00048593          	mv	a1,s1
    9de0:	008df533          	and	a0,s11,s0
    9de4:	7e5040ef          	jal	edc8 <__mulsi3>
    9de8:	00897733          	and	a4,s2,s0
    9dec:	00e50733          	add	a4,a0,a4
    9df0:	00048593          	mv	a1,s1
    9df4:	010dd513          	srl	a0,s11,0x10
    9df8:	01870c33          	add	s8,a4,s8
    9dfc:	01095913          	srl	s2,s2,0x10
    9e00:	7c9040ef          	jal	edc8 <__mulsi3>
    9e04:	010c5713          	srl	a4,s8,0x10
    9e08:	01250533          	add	a0,a0,s2
    9e0c:	00e50533          	add	a0,a0,a4
    9e10:	008c77b3          	and	a5,s8,s0
    9e14:	01051713          	sll	a4,a0,0x10
    9e18:	004d0d13          	add	s10,s10,4
    9e1c:	00f767b3          	or	a5,a4,a5
    9e20:	004c8c93          	add	s9,s9,4
    9e24:	fefd2e23          	sw	a5,-4(s10)
    9e28:	01055c13          	srl	s8,a0,0x10
    9e2c:	fb3ce4e3          	bltu	s9,s3,9dd4 <__multiply+0x114>
    9e30:	00412783          	lw	a5,4(sp)
    9e34:	00fb0733          	add	a4,s6,a5
    9e38:	01872023          	sw	s8,0(a4)
    9e3c:	000a2903          	lw	s2,0(s4)
    9e40:	01095913          	srl	s2,s2,0x10
    9e44:	f60904e3          	beqz	s2,9dac <__multiply+0xec>
    9e48:	000b2c83          	lw	s9,0(s6)
    9e4c:	00812d03          	lw	s10,8(sp)
    9e50:	000b0c13          	mv	s8,s6
    9e54:	000c8493          	mv	s1,s9
    9e58:	00000d93          	li	s11,0
    9e5c:	000d2503          	lw	a0,0(s10)
    9e60:	00090593          	mv	a1,s2
    9e64:	0104d493          	srl	s1,s1,0x10
    9e68:	00857533          	and	a0,a0,s0
    9e6c:	75d040ef          	jal	edc8 <__mulsi3>
    9e70:	01b50733          	add	a4,a0,s11
    9e74:	00970db3          	add	s11,a4,s1
    9e78:	010d9593          	sll	a1,s11,0x10
    9e7c:	008cf7b3          	and	a5,s9,s0
    9e80:	00f5e7b3          	or	a5,a1,a5
    9e84:	00fc2023          	sw	a5,0(s8)
    9e88:	002d5503          	lhu	a0,2(s10)
    9e8c:	004c2483          	lw	s1,4(s8)
    9e90:	00090593          	mv	a1,s2
    9e94:	735040ef          	jal	edc8 <__mulsi3>
    9e98:	0084f7b3          	and	a5,s1,s0
    9e9c:	010dd713          	srl	a4,s11,0x10
    9ea0:	00f507b3          	add	a5,a0,a5
    9ea4:	004d0d13          	add	s10,s10,4
    9ea8:	00e78cb3          	add	s9,a5,a4
    9eac:	004c0c13          	add	s8,s8,4
    9eb0:	010cdd93          	srl	s11,s9,0x10
    9eb4:	fb3d64e3          	bltu	s10,s3,9e5c <__multiply+0x19c>
    9eb8:	00412783          	lw	a5,4(sp)
    9ebc:	004a0a13          	add	s4,s4,4
    9ec0:	00fb0733          	add	a4,s6,a5
    9ec4:	00012783          	lw	a5,0(sp)
    9ec8:	01972023          	sw	s9,0(a4)
    9ecc:	004b0b13          	add	s6,s6,4
    9ed0:	eefa66e3          	bltu	s4,a5,9dbc <__multiply+0xfc>
    9ed4:	04412483          	lw	s1,68(sp)
    9ed8:	04012903          	lw	s2,64(sp)
    9edc:	02412c83          	lw	s9,36(sp)
    9ee0:	02012d03          	lw	s10,32(sp)
    9ee4:	01c12d83          	lw	s11,28(sp)
    9ee8:	01704863          	bgtz	s7,9ef8 <__multiply+0x238>
    9eec:	0180006f          	j	9f04 <__multiply+0x244>
    9ef0:	fffb8b93          	add	s7,s7,-1
    9ef4:	000b8863          	beqz	s7,9f04 <__multiply+0x244>
    9ef8:	ffcaa783          	lw	a5,-4(s5)
    9efc:	ffca8a93          	add	s5,s5,-4
    9f00:	fe0788e3          	beqz	a5,9ef0 <__multiply+0x230>
    9f04:	00c12783          	lw	a5,12(sp)
    9f08:	04c12083          	lw	ra,76(sp)
    9f0c:	04812403          	lw	s0,72(sp)
    9f10:	0177a823          	sw	s7,16(a5)
    9f14:	03412a83          	lw	s5,52(sp)
    9f18:	03012b03          	lw	s6,48(sp)
    9f1c:	03c12983          	lw	s3,60(sp)
    9f20:	03812a03          	lw	s4,56(sp)
    9f24:	02c12b83          	lw	s7,44(sp)
    9f28:	02812c03          	lw	s8,40(sp)
    9f2c:	00078513          	mv	a0,a5
    9f30:	05010113          	add	sp,sp,80
    9f34:	00008067          	ret
    9f38:	408987b3          	sub	a5,s3,s0
    9f3c:	feb78793          	add	a5,a5,-21
    9f40:	ffc7f793          	and	a5,a5,-4
    9f44:	00478793          	add	a5,a5,4
    9f48:	00f12223          	sw	a5,4(sp)
    9f4c:	e4dff06f          	j	9d98 <__multiply+0xd8>
    9f50:	00005697          	auipc	a3,0x5
    9f54:	2c868693          	add	a3,a3,712 # f218 <__fini_array_end+0x258>
    9f58:	00000613          	li	a2,0
    9f5c:	16200593          	li	a1,354
    9f60:	00005517          	auipc	a0,0x5
    9f64:	34c50513          	add	a0,a0,844 # f2ac <__fini_array_end+0x2ec>
    9f68:	04912223          	sw	s1,68(sp)
    9f6c:	05212023          	sw	s2,64(sp)
    9f70:	03512a23          	sw	s5,52(sp)
    9f74:	03612823          	sw	s6,48(sp)
    9f78:	03912223          	sw	s9,36(sp)
    9f7c:	03a12023          	sw	s10,32(sp)
    9f80:	01b12e23          	sw	s11,28(sp)
    9f84:	0fc010ef          	jal	b080 <__assert_func>

00009f88 <__pow5mult>:
    9f88:	fe010113          	add	sp,sp,-32
    9f8c:	00812c23          	sw	s0,24(sp)
    9f90:	01212823          	sw	s2,16(sp)
    9f94:	01312623          	sw	s3,12(sp)
    9f98:	00112e23          	sw	ra,28(sp)
    9f9c:	00367793          	and	a5,a2,3
    9fa0:	00060413          	mv	s0,a2
    9fa4:	00050993          	mv	s3,a0
    9fa8:	00058913          	mv	s2,a1
    9fac:	0a079c63          	bnez	a5,a064 <__pow5mult+0xdc>
    9fb0:	40245413          	sra	s0,s0,0x2
    9fb4:	06040a63          	beqz	s0,a028 <__pow5mult+0xa0>
    9fb8:	00912a23          	sw	s1,20(sp)
    9fbc:	0409a483          	lw	s1,64(s3)
    9fc0:	0c048663          	beqz	s1,a08c <__pow5mult+0x104>
    9fc4:	00147793          	and	a5,s0,1
    9fc8:	02079063          	bnez	a5,9fe8 <__pow5mult+0x60>
    9fcc:	40145413          	sra	s0,s0,0x1
    9fd0:	04040a63          	beqz	s0,a024 <__pow5mult+0x9c>
    9fd4:	0004a503          	lw	a0,0(s1)
    9fd8:	06050663          	beqz	a0,a044 <__pow5mult+0xbc>
    9fdc:	00050493          	mv	s1,a0
    9fe0:	00147793          	and	a5,s0,1
    9fe4:	fe0784e3          	beqz	a5,9fcc <__pow5mult+0x44>
    9fe8:	00048613          	mv	a2,s1
    9fec:	00090593          	mv	a1,s2
    9ff0:	00098513          	mv	a0,s3
    9ff4:	ccdff0ef          	jal	9cc0 <__multiply>
    9ff8:	02090063          	beqz	s2,a018 <__pow5mult+0x90>
    9ffc:	00492703          	lw	a4,4(s2)
    a000:	0449a783          	lw	a5,68(s3)
    a004:	00271713          	sll	a4,a4,0x2
    a008:	00e787b3          	add	a5,a5,a4
    a00c:	0007a703          	lw	a4,0(a5)
    a010:	00e92023          	sw	a4,0(s2)
    a014:	0127a023          	sw	s2,0(a5)
    a018:	40145413          	sra	s0,s0,0x1
    a01c:	00050913          	mv	s2,a0
    a020:	fa041ae3          	bnez	s0,9fd4 <__pow5mult+0x4c>
    a024:	01412483          	lw	s1,20(sp)
    a028:	01c12083          	lw	ra,28(sp)
    a02c:	01812403          	lw	s0,24(sp)
    a030:	00c12983          	lw	s3,12(sp)
    a034:	00090513          	mv	a0,s2
    a038:	01012903          	lw	s2,16(sp)
    a03c:	02010113          	add	sp,sp,32
    a040:	00008067          	ret
    a044:	00048613          	mv	a2,s1
    a048:	00048593          	mv	a1,s1
    a04c:	00098513          	mv	a0,s3
    a050:	c71ff0ef          	jal	9cc0 <__multiply>
    a054:	00a4a023          	sw	a0,0(s1)
    a058:	00052023          	sw	zero,0(a0)
    a05c:	00050493          	mv	s1,a0
    a060:	f81ff06f          	j	9fe0 <__pow5mult+0x58>
    a064:	fff78793          	add	a5,a5,-1
    a068:	00005717          	auipc	a4,0x5
    a06c:	7b870713          	add	a4,a4,1976 # f820 <p05.0>
    a070:	00279793          	sll	a5,a5,0x2
    a074:	00f707b3          	add	a5,a4,a5
    a078:	0007a603          	lw	a2,0(a5)
    a07c:	00000693          	li	a3,0
    a080:	8b5ff0ef          	jal	9934 <__multadd>
    a084:	00050913          	mv	s2,a0
    a088:	f29ff06f          	j	9fb0 <__pow5mult+0x28>
    a08c:	00100593          	li	a1,1
    a090:	00098513          	mv	a0,s3
    a094:	fc8ff0ef          	jal	985c <_Balloc>
    a098:	00050493          	mv	s1,a0
    a09c:	02050063          	beqz	a0,a0bc <__pow5mult+0x134>
    a0a0:	27100793          	li	a5,625
    a0a4:	00f52a23          	sw	a5,20(a0)
    a0a8:	00100793          	li	a5,1
    a0ac:	00f52823          	sw	a5,16(a0)
    a0b0:	04a9a023          	sw	a0,64(s3)
    a0b4:	00052023          	sw	zero,0(a0)
    a0b8:	f0dff06f          	j	9fc4 <__pow5mult+0x3c>
    a0bc:	00005697          	auipc	a3,0x5
    a0c0:	15c68693          	add	a3,a3,348 # f218 <__fini_array_end+0x258>
    a0c4:	00000613          	li	a2,0
    a0c8:	14500593          	li	a1,325
    a0cc:	00005517          	auipc	a0,0x5
    a0d0:	1e050513          	add	a0,a0,480 # f2ac <__fini_array_end+0x2ec>
    a0d4:	7ad000ef          	jal	b080 <__assert_func>

0000a0d8 <__lshift>:
    a0d8:	fe010113          	add	sp,sp,-32
    a0dc:	01512223          	sw	s5,4(sp)
    a0e0:	0105aa83          	lw	s5,16(a1)
    a0e4:	0085a783          	lw	a5,8(a1)
    a0e8:	01312623          	sw	s3,12(sp)
    a0ec:	40565993          	sra	s3,a2,0x5
    a0f0:	01598ab3          	add	s5,s3,s5
    a0f4:	00812c23          	sw	s0,24(sp)
    a0f8:	00912a23          	sw	s1,20(sp)
    a0fc:	01212823          	sw	s2,16(sp)
    a100:	01412423          	sw	s4,8(sp)
    a104:	00112e23          	sw	ra,28(sp)
    a108:	001a8913          	add	s2,s5,1
    a10c:	00058493          	mv	s1,a1
    a110:	00060413          	mv	s0,a2
    a114:	0045a583          	lw	a1,4(a1)
    a118:	00050a13          	mv	s4,a0
    a11c:	0127d863          	bge	a5,s2,a12c <__lshift+0x54>
    a120:	00179793          	sll	a5,a5,0x1
    a124:	00158593          	add	a1,a1,1
    a128:	ff27cce3          	blt	a5,s2,a120 <__lshift+0x48>
    a12c:	000a0513          	mv	a0,s4
    a130:	f2cff0ef          	jal	985c <_Balloc>
    a134:	10050c63          	beqz	a0,a24c <__lshift+0x174>
    a138:	01450813          	add	a6,a0,20
    a13c:	03305463          	blez	s3,a164 <__lshift+0x8c>
    a140:	00598993          	add	s3,s3,5
    a144:	00299993          	sll	s3,s3,0x2
    a148:	01350733          	add	a4,a0,s3
    a14c:	00080793          	mv	a5,a6
    a150:	00478793          	add	a5,a5,4
    a154:	fe07ae23          	sw	zero,-4(a5)
    a158:	fee79ce3          	bne	a5,a4,a150 <__lshift+0x78>
    a15c:	fec98993          	add	s3,s3,-20
    a160:	01380833          	add	a6,a6,s3
    a164:	0104a883          	lw	a7,16(s1)
    a168:	01448793          	add	a5,s1,20
    a16c:	01f47613          	and	a2,s0,31
    a170:	00289893          	sll	a7,a7,0x2
    a174:	011788b3          	add	a7,a5,a7
    a178:	0a060463          	beqz	a2,a220 <__lshift+0x148>
    a17c:	02000593          	li	a1,32
    a180:	40c585b3          	sub	a1,a1,a2
    a184:	00080313          	mv	t1,a6
    a188:	00000693          	li	a3,0
    a18c:	0007a703          	lw	a4,0(a5)
    a190:	00430313          	add	t1,t1,4
    a194:	00478793          	add	a5,a5,4
    a198:	00c71733          	sll	a4,a4,a2
    a19c:	00d76733          	or	a4,a4,a3
    a1a0:	fee32e23          	sw	a4,-4(t1)
    a1a4:	ffc7a683          	lw	a3,-4(a5)
    a1a8:	00b6d6b3          	srl	a3,a3,a1
    a1ac:	ff17e0e3          	bltu	a5,a7,a18c <__lshift+0xb4>
    a1b0:	01548793          	add	a5,s1,21
    a1b4:	00400713          	li	a4,4
    a1b8:	00f8ea63          	bltu	a7,a5,a1cc <__lshift+0xf4>
    a1bc:	409887b3          	sub	a5,a7,s1
    a1c0:	feb78793          	add	a5,a5,-21
    a1c4:	ffc7f793          	and	a5,a5,-4
    a1c8:	00478713          	add	a4,a5,4
    a1cc:	00e80833          	add	a6,a6,a4
    a1d0:	00d82023          	sw	a3,0(a6)
    a1d4:	00069463          	bnez	a3,a1dc <__lshift+0x104>
    a1d8:	000a8913          	mv	s2,s5
    a1dc:	0044a703          	lw	a4,4(s1)
    a1e0:	044a2783          	lw	a5,68(s4)
    a1e4:	01c12083          	lw	ra,28(sp)
    a1e8:	00271713          	sll	a4,a4,0x2
    a1ec:	00e787b3          	add	a5,a5,a4
    a1f0:	0007a703          	lw	a4,0(a5)
    a1f4:	01252823          	sw	s2,16(a0)
    a1f8:	01812403          	lw	s0,24(sp)
    a1fc:	00e4a023          	sw	a4,0(s1)
    a200:	0097a023          	sw	s1,0(a5)
    a204:	01012903          	lw	s2,16(sp)
    a208:	01412483          	lw	s1,20(sp)
    a20c:	00c12983          	lw	s3,12(sp)
    a210:	00812a03          	lw	s4,8(sp)
    a214:	00412a83          	lw	s5,4(sp)
    a218:	02010113          	add	sp,sp,32
    a21c:	00008067          	ret
    a220:	0007a703          	lw	a4,0(a5)
    a224:	00478793          	add	a5,a5,4
    a228:	00480813          	add	a6,a6,4
    a22c:	fee82e23          	sw	a4,-4(a6)
    a230:	fb17f4e3          	bgeu	a5,a7,a1d8 <__lshift+0x100>
    a234:	0007a703          	lw	a4,0(a5)
    a238:	00478793          	add	a5,a5,4
    a23c:	00480813          	add	a6,a6,4
    a240:	fee82e23          	sw	a4,-4(a6)
    a244:	fd17eee3          	bltu	a5,a7,a220 <__lshift+0x148>
    a248:	f91ff06f          	j	a1d8 <__lshift+0x100>
    a24c:	00005697          	auipc	a3,0x5
    a250:	fcc68693          	add	a3,a3,-52 # f218 <__fini_array_end+0x258>
    a254:	00000613          	li	a2,0
    a258:	1de00593          	li	a1,478
    a25c:	00005517          	auipc	a0,0x5
    a260:	05050513          	add	a0,a0,80 # f2ac <__fini_array_end+0x2ec>
    a264:	61d000ef          	jal	b080 <__assert_func>

0000a268 <__mcmp>:
    a268:	01052703          	lw	a4,16(a0)
    a26c:	0105a783          	lw	a5,16(a1)
    a270:	00050813          	mv	a6,a0
    a274:	40f70533          	sub	a0,a4,a5
    a278:	04f71263          	bne	a4,a5,a2bc <__mcmp+0x54>
    a27c:	00279793          	sll	a5,a5,0x2
    a280:	01480813          	add	a6,a6,20
    a284:	01458593          	add	a1,a1,20
    a288:	00f80733          	add	a4,a6,a5
    a28c:	00f587b3          	add	a5,a1,a5
    a290:	0080006f          	j	a298 <__mcmp+0x30>
    a294:	02e87463          	bgeu	a6,a4,a2bc <__mcmp+0x54>
    a298:	ffc72603          	lw	a2,-4(a4)
    a29c:	ffc7a683          	lw	a3,-4(a5)
    a2a0:	ffc70713          	add	a4,a4,-4
    a2a4:	ffc78793          	add	a5,a5,-4
    a2a8:	fed606e3          	beq	a2,a3,a294 <__mcmp+0x2c>
    a2ac:	00100513          	li	a0,1
    a2b0:	00d67663          	bgeu	a2,a3,a2bc <__mcmp+0x54>
    a2b4:	fff00513          	li	a0,-1
    a2b8:	00008067          	ret
    a2bc:	00008067          	ret

0000a2c0 <__mdiff>:
    a2c0:	0105a703          	lw	a4,16(a1)
    a2c4:	01062783          	lw	a5,16(a2)
    a2c8:	ff010113          	add	sp,sp,-16
    a2cc:	00812423          	sw	s0,8(sp)
    a2d0:	00912223          	sw	s1,4(sp)
    a2d4:	00112623          	sw	ra,12(sp)
    a2d8:	01212023          	sw	s2,0(sp)
    a2dc:	00058413          	mv	s0,a1
    a2e0:	00060493          	mv	s1,a2
    a2e4:	40f706b3          	sub	a3,a4,a5
    a2e8:	18f71e63          	bne	a4,a5,a484 <__mdiff+0x1c4>
    a2ec:	00279693          	sll	a3,a5,0x2
    a2f0:	01458613          	add	a2,a1,20
    a2f4:	01448713          	add	a4,s1,20
    a2f8:	00d607b3          	add	a5,a2,a3
    a2fc:	00d70733          	add	a4,a4,a3
    a300:	0080006f          	j	a308 <__mdiff+0x48>
    a304:	18f67c63          	bgeu	a2,a5,a49c <__mdiff+0x1dc>
    a308:	ffc7a583          	lw	a1,-4(a5)
    a30c:	ffc72683          	lw	a3,-4(a4)
    a310:	ffc78793          	add	a5,a5,-4
    a314:	ffc70713          	add	a4,a4,-4
    a318:	fed586e3          	beq	a1,a3,a304 <__mdiff+0x44>
    a31c:	00100913          	li	s2,1
    a320:	00d5ea63          	bltu	a1,a3,a334 <__mdiff+0x74>
    a324:	00048793          	mv	a5,s1
    a328:	00000913          	li	s2,0
    a32c:	00040493          	mv	s1,s0
    a330:	00078413          	mv	s0,a5
    a334:	0044a583          	lw	a1,4(s1)
    a338:	d24ff0ef          	jal	985c <_Balloc>
    a33c:	1a050663          	beqz	a0,a4e8 <__mdiff+0x228>
    a340:	0104a883          	lw	a7,16(s1)
    a344:	01042283          	lw	t0,16(s0)
    a348:	01448f93          	add	t6,s1,20
    a34c:	00289313          	sll	t1,a7,0x2
    a350:	01440813          	add	a6,s0,20
    a354:	00229293          	sll	t0,t0,0x2
    a358:	01450593          	add	a1,a0,20
    a35c:	00010e37          	lui	t3,0x10
    a360:	01252623          	sw	s2,12(a0)
    a364:	006f8333          	add	t1,t6,t1
    a368:	005802b3          	add	t0,a6,t0
    a36c:	00058f13          	mv	t5,a1
    a370:	000f8e93          	mv	t4,t6
    a374:	00000693          	li	a3,0
    a378:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    a37c:	000ea703          	lw	a4,0(t4)
    a380:	00082603          	lw	a2,0(a6)
    a384:	004f0f13          	add	t5,t5,4
    a388:	01c777b3          	and	a5,a4,t3
    a38c:	01c673b3          	and	t2,a2,t3
    a390:	407787b3          	sub	a5,a5,t2
    a394:	00d787b3          	add	a5,a5,a3
    a398:	01075713          	srl	a4,a4,0x10
    a39c:	01065613          	srl	a2,a2,0x10
    a3a0:	4107d693          	sra	a3,a5,0x10
    a3a4:	40c70733          	sub	a4,a4,a2
    a3a8:	00d70733          	add	a4,a4,a3
    a3ac:	01071693          	sll	a3,a4,0x10
    a3b0:	01c7f7b3          	and	a5,a5,t3
    a3b4:	00d7e7b3          	or	a5,a5,a3
    a3b8:	00480813          	add	a6,a6,4
    a3bc:	feff2e23          	sw	a5,-4(t5)
    a3c0:	004e8e93          	add	t4,t4,4
    a3c4:	41075693          	sra	a3,a4,0x10
    a3c8:	fa586ae3          	bltu	a6,t0,a37c <__mdiff+0xbc>
    a3cc:	01540713          	add	a4,s0,21
    a3d0:	40828433          	sub	s0,t0,s0
    a3d4:	feb40413          	add	s0,s0,-21
    a3d8:	00e2b2b3          	sltu	t0,t0,a4
    a3dc:	0012cf13          	xor	t5,t0,1
    a3e0:	00245413          	srl	s0,s0,0x2
    a3e4:	00400713          	li	a4,4
    a3e8:	0a028463          	beqz	t0,a490 <__mdiff+0x1d0>
    a3ec:	00ef8fb3          	add	t6,t6,a4
    a3f0:	00e58833          	add	a6,a1,a4
    a3f4:	00010eb7          	lui	t4,0x10
    a3f8:	00080e13          	mv	t3,a6
    a3fc:	000f8613          	mv	a2,t6
    a400:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    a404:	0c6ff463          	bgeu	t6,t1,a4cc <__mdiff+0x20c>
    a408:	00062783          	lw	a5,0(a2)
    a40c:	004e0e13          	add	t3,t3,4
    a410:	00460613          	add	a2,a2,4
    a414:	01d7f733          	and	a4,a5,t4
    a418:	00d70733          	add	a4,a4,a3
    a41c:	0107d593          	srl	a1,a5,0x10
    a420:	41075713          	sra	a4,a4,0x10
    a424:	00b70733          	add	a4,a4,a1
    a428:	00d787b3          	add	a5,a5,a3
    a42c:	01d7f7b3          	and	a5,a5,t4
    a430:	01071693          	sll	a3,a4,0x10
    a434:	00d7e7b3          	or	a5,a5,a3
    a438:	fefe2e23          	sw	a5,-4(t3)
    a43c:	41075693          	sra	a3,a4,0x10
    a440:	fc6664e3          	bltu	a2,t1,a408 <__mdiff+0x148>
    a444:	fff30313          	add	t1,t1,-1
    a448:	41f30333          	sub	t1,t1,t6
    a44c:	ffc37313          	and	t1,t1,-4
    a450:	00680733          	add	a4,a6,t1
    a454:	00079a63          	bnez	a5,a468 <__mdiff+0x1a8>
    a458:	ffc72783          	lw	a5,-4(a4)
    a45c:	fff88893          	add	a7,a7,-1
    a460:	ffc70713          	add	a4,a4,-4
    a464:	fe078ae3          	beqz	a5,a458 <__mdiff+0x198>
    a468:	00c12083          	lw	ra,12(sp)
    a46c:	00812403          	lw	s0,8(sp)
    a470:	01152823          	sw	a7,16(a0)
    a474:	00412483          	lw	s1,4(sp)
    a478:	00012903          	lw	s2,0(sp)
    a47c:	01010113          	add	sp,sp,16
    a480:	00008067          	ret
    a484:	00100913          	li	s2,1
    a488:	e806dee3          	bgez	a3,a324 <__mdiff+0x64>
    a48c:	ea9ff06f          	j	a334 <__mdiff+0x74>
    a490:	00140713          	add	a4,s0,1
    a494:	00271713          	sll	a4,a4,0x2
    a498:	f55ff06f          	j	a3ec <__mdiff+0x12c>
    a49c:	00000593          	li	a1,0
    a4a0:	bbcff0ef          	jal	985c <_Balloc>
    a4a4:	06050063          	beqz	a0,a504 <__mdiff+0x244>
    a4a8:	00c12083          	lw	ra,12(sp)
    a4ac:	00812403          	lw	s0,8(sp)
    a4b0:	00100793          	li	a5,1
    a4b4:	00f52823          	sw	a5,16(a0)
    a4b8:	00052a23          	sw	zero,20(a0)
    a4bc:	00412483          	lw	s1,4(sp)
    a4c0:	00012903          	lw	s2,0(sp)
    a4c4:	01010113          	add	sp,sp,16
    a4c8:	00008067          	ret
    a4cc:	00000713          	li	a4,0
    a4d0:	000f1663          	bnez	t5,a4dc <__mdiff+0x21c>
    a4d4:	00e58733          	add	a4,a1,a4
    a4d8:	f7dff06f          	j	a454 <__mdiff+0x194>
    a4dc:	00241713          	sll	a4,s0,0x2
    a4e0:	00e58733          	add	a4,a1,a4
    a4e4:	f71ff06f          	j	a454 <__mdiff+0x194>
    a4e8:	00005697          	auipc	a3,0x5
    a4ec:	d3068693          	add	a3,a3,-720 # f218 <__fini_array_end+0x258>
    a4f0:	00000613          	li	a2,0
    a4f4:	24500593          	li	a1,581
    a4f8:	00005517          	auipc	a0,0x5
    a4fc:	db450513          	add	a0,a0,-588 # f2ac <__fini_array_end+0x2ec>
    a500:	381000ef          	jal	b080 <__assert_func>
    a504:	00005697          	auipc	a3,0x5
    a508:	d1468693          	add	a3,a3,-748 # f218 <__fini_array_end+0x258>
    a50c:	00000613          	li	a2,0
    a510:	23700593          	li	a1,567
    a514:	00005517          	auipc	a0,0x5
    a518:	d9850513          	add	a0,a0,-616 # f2ac <__fini_array_end+0x2ec>
    a51c:	365000ef          	jal	b080 <__assert_func>

0000a520 <__d2b>:
    a520:	fd010113          	add	sp,sp,-48
    a524:	01512a23          	sw	s5,20(sp)
    a528:	00058a93          	mv	s5,a1
    a52c:	00100593          	li	a1,1
    a530:	02912223          	sw	s1,36(sp)
    a534:	01312e23          	sw	s3,28(sp)
    a538:	01412c23          	sw	s4,24(sp)
    a53c:	02112623          	sw	ra,44(sp)
    a540:	02812423          	sw	s0,40(sp)
    a544:	03212023          	sw	s2,32(sp)
    a548:	00060493          	mv	s1,a2
    a54c:	00068a13          	mv	s4,a3
    a550:	00070993          	mv	s3,a4
    a554:	b08ff0ef          	jal	985c <_Balloc>
    a558:	10050263          	beqz	a0,a65c <__d2b+0x13c>
    a55c:	00100737          	lui	a4,0x100
    a560:	0144d913          	srl	s2,s1,0x14
    a564:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a568:	7ff97913          	and	s2,s2,2047
    a56c:	00050413          	mv	s0,a0
    a570:	0097f7b3          	and	a5,a5,s1
    a574:	00090463          	beqz	s2,a57c <__d2b+0x5c>
    a578:	00e7e7b3          	or	a5,a5,a4
    a57c:	00f12623          	sw	a5,12(sp)
    a580:	060a9263          	bnez	s5,a5e4 <__d2b+0xc4>
    a584:	00c10513          	add	a0,sp,12
    a588:	da8ff0ef          	jal	9b30 <__lo0bits>
    a58c:	00c12703          	lw	a4,12(sp)
    a590:	00100493          	li	s1,1
    a594:	00942823          	sw	s1,16(s0)
    a598:	00e42a23          	sw	a4,20(s0)
    a59c:	02050793          	add	a5,a0,32
    a5a0:	08090863          	beqz	s2,a630 <__d2b+0x110>
    a5a4:	bcd90913          	add	s2,s2,-1075
    a5a8:	00f90933          	add	s2,s2,a5
    a5ac:	03500493          	li	s1,53
    a5b0:	012a2023          	sw	s2,0(s4)
    a5b4:	40f48533          	sub	a0,s1,a5
    a5b8:	00a9a023          	sw	a0,0(s3)
    a5bc:	02c12083          	lw	ra,44(sp)
    a5c0:	00040513          	mv	a0,s0
    a5c4:	02812403          	lw	s0,40(sp)
    a5c8:	02412483          	lw	s1,36(sp)
    a5cc:	02012903          	lw	s2,32(sp)
    a5d0:	01c12983          	lw	s3,28(sp)
    a5d4:	01812a03          	lw	s4,24(sp)
    a5d8:	01412a83          	lw	s5,20(sp)
    a5dc:	03010113          	add	sp,sp,48
    a5e0:	00008067          	ret
    a5e4:	00810513          	add	a0,sp,8
    a5e8:	01512423          	sw	s5,8(sp)
    a5ec:	d44ff0ef          	jal	9b30 <__lo0bits>
    a5f0:	00c12703          	lw	a4,12(sp)
    a5f4:	00050793          	mv	a5,a0
    a5f8:	04050e63          	beqz	a0,a654 <__d2b+0x134>
    a5fc:	00812603          	lw	a2,8(sp)
    a600:	02000693          	li	a3,32
    a604:	40a686b3          	sub	a3,a3,a0
    a608:	00d716b3          	sll	a3,a4,a3
    a60c:	00a75733          	srl	a4,a4,a0
    a610:	00c6e6b3          	or	a3,a3,a2
    a614:	00e12623          	sw	a4,12(sp)
    a618:	00e034b3          	snez	s1,a4
    a61c:	00148493          	add	s1,s1,1
    a620:	00d42a23          	sw	a3,20(s0)
    a624:	00e42c23          	sw	a4,24(s0)
    a628:	00942823          	sw	s1,16(s0)
    a62c:	f6091ce3          	bnez	s2,a5a4 <__d2b+0x84>
    a630:	00249713          	sll	a4,s1,0x2
    a634:	00e40733          	add	a4,s0,a4
    a638:	01072503          	lw	a0,16(a4)
    a63c:	bce78793          	add	a5,a5,-1074
    a640:	00fa2023          	sw	a5,0(s4)
    a644:	c74ff0ef          	jal	9ab8 <__hi0bits>
    a648:	00549493          	sll	s1,s1,0x5
    a64c:	40a48533          	sub	a0,s1,a0
    a650:	f69ff06f          	j	a5b8 <__d2b+0x98>
    a654:	00812683          	lw	a3,8(sp)
    a658:	fc1ff06f          	j	a618 <__d2b+0xf8>
    a65c:	00005697          	auipc	a3,0x5
    a660:	bbc68693          	add	a3,a3,-1092 # f218 <__fini_array_end+0x258>
    a664:	00000613          	li	a2,0
    a668:	30f00593          	li	a1,783
    a66c:	00005517          	auipc	a0,0x5
    a670:	c4050513          	add	a0,a0,-960 # f2ac <__fini_array_end+0x2ec>
    a674:	20d000ef          	jal	b080 <__assert_func>

0000a678 <_realloc_r>:
    a678:	fd010113          	add	sp,sp,-48
    a67c:	02912223          	sw	s1,36(sp)
    a680:	02112623          	sw	ra,44(sp)
    a684:	00060493          	mv	s1,a2
    a688:	1e058863          	beqz	a1,a878 <_realloc_r+0x200>
    a68c:	02812423          	sw	s0,40(sp)
    a690:	03212023          	sw	s2,32(sp)
    a694:	00058413          	mv	s0,a1
    a698:	01312e23          	sw	s3,28(sp)
    a69c:	01512a23          	sw	s5,20(sp)
    a6a0:	01412c23          	sw	s4,24(sp)
    a6a4:	00050913          	mv	s2,a0
    a6a8:	8b1f70ef          	jal	1f58 <__malloc_lock>
    a6ac:	ffc42703          	lw	a4,-4(s0)
    a6b0:	00b48793          	add	a5,s1,11
    a6b4:	01600693          	li	a3,22
    a6b8:	ff840a93          	add	s5,s0,-8
    a6bc:	ffc77993          	and	s3,a4,-4
    a6c0:	10f6f263          	bgeu	a3,a5,a7c4 <_realloc_r+0x14c>
    a6c4:	ff87fa13          	and	s4,a5,-8
    a6c8:	1007c263          	bltz	a5,a7cc <_realloc_r+0x154>
    a6cc:	109a6063          	bltu	s4,s1,a7cc <_realloc_r+0x154>
    a6d0:	1349d263          	bge	s3,s4,a7f4 <_realloc_r+0x17c>
    a6d4:	01812423          	sw	s8,8(sp)
    a6d8:	7fff6c17          	auipc	s8,0x7fff6
    a6dc:	a48c0c13          	add	s8,s8,-1464 # 80000120 <__malloc_av_>
    a6e0:	008c2603          	lw	a2,8(s8)
    a6e4:	013a86b3          	add	a3,s5,s3
    a6e8:	0046a783          	lw	a5,4(a3)
    a6ec:	1cd60863          	beq	a2,a3,a8bc <_realloc_r+0x244>
    a6f0:	ffe7f613          	and	a2,a5,-2
    a6f4:	00c68633          	add	a2,a3,a2
    a6f8:	00462603          	lw	a2,4(a2)
    a6fc:	00167613          	and	a2,a2,1
    a700:	14061a63          	bnez	a2,a854 <_realloc_r+0x1dc>
    a704:	ffc7f793          	and	a5,a5,-4
    a708:	00f98633          	add	a2,s3,a5
    a70c:	0d465863          	bge	a2,s4,a7dc <_realloc_r+0x164>
    a710:	00177713          	and	a4,a4,1
    a714:	02071c63          	bnez	a4,a74c <_realloc_r+0xd4>
    a718:	01712623          	sw	s7,12(sp)
    a71c:	ff842b83          	lw	s7,-8(s0)
    a720:	01612823          	sw	s6,16(sp)
    a724:	417a8bb3          	sub	s7,s5,s7
    a728:	004ba703          	lw	a4,4(s7)
    a72c:	ffc77713          	and	a4,a4,-4
    a730:	00e787b3          	add	a5,a5,a4
    a734:	01378b33          	add	s6,a5,s3
    a738:	334b5c63          	bge	s6,s4,aa70 <_realloc_r+0x3f8>
    a73c:	00e98b33          	add	s6,s3,a4
    a740:	294b5863          	bge	s6,s4,a9d0 <_realloc_r+0x358>
    a744:	01012b03          	lw	s6,16(sp)
    a748:	00c12b83          	lw	s7,12(sp)
    a74c:	00048593          	mv	a1,s1
    a750:	00090513          	mv	a0,s2
    a754:	824f70ef          	jal	1778 <_malloc_r>
    a758:	00050493          	mv	s1,a0
    a75c:	40050863          	beqz	a0,ab6c <_realloc_r+0x4f4>
    a760:	ffc42783          	lw	a5,-4(s0)
    a764:	ff850713          	add	a4,a0,-8
    a768:	ffe7f793          	and	a5,a5,-2
    a76c:	00fa87b3          	add	a5,s5,a5
    a770:	24e78663          	beq	a5,a4,a9bc <_realloc_r+0x344>
    a774:	ffc98613          	add	a2,s3,-4
    a778:	02400793          	li	a5,36
    a77c:	2ec7e463          	bltu	a5,a2,aa64 <_realloc_r+0x3ec>
    a780:	01300713          	li	a4,19
    a784:	20c76a63          	bltu	a4,a2,a998 <_realloc_r+0x320>
    a788:	00050793          	mv	a5,a0
    a78c:	00040713          	mv	a4,s0
    a790:	00072683          	lw	a3,0(a4)
    a794:	00d7a023          	sw	a3,0(a5)
    a798:	00472683          	lw	a3,4(a4)
    a79c:	00d7a223          	sw	a3,4(a5)
    a7a0:	00872703          	lw	a4,8(a4)
    a7a4:	00e7a423          	sw	a4,8(a5)
    a7a8:	00040593          	mv	a1,s0
    a7ac:	00090513          	mv	a0,s2
    a7b0:	cbdf60ef          	jal	146c <_free_r>
    a7b4:	00090513          	mv	a0,s2
    a7b8:	facf70ef          	jal	1f64 <__malloc_unlock>
    a7bc:	00812c03          	lw	s8,8(sp)
    a7c0:	06c0006f          	j	a82c <_realloc_r+0x1b4>
    a7c4:	01000a13          	li	s4,16
    a7c8:	f09a74e3          	bgeu	s4,s1,a6d0 <_realloc_r+0x58>
    a7cc:	00c00793          	li	a5,12
    a7d0:	00f92023          	sw	a5,0(s2)
    a7d4:	00000493          	li	s1,0
    a7d8:	0540006f          	j	a82c <_realloc_r+0x1b4>
    a7dc:	00c6a783          	lw	a5,12(a3)
    a7e0:	0086a703          	lw	a4,8(a3)
    a7e4:	00812c03          	lw	s8,8(sp)
    a7e8:	00060993          	mv	s3,a2
    a7ec:	00f72623          	sw	a5,12(a4)
    a7f0:	00e7a423          	sw	a4,8(a5)
    a7f4:	004aa783          	lw	a5,4(s5)
    a7f8:	414986b3          	sub	a3,s3,s4
    a7fc:	00f00613          	li	a2,15
    a800:	0017f793          	and	a5,a5,1
    a804:	013a8733          	add	a4,s5,s3
    a808:	08d66263          	bltu	a2,a3,a88c <_realloc_r+0x214>
    a80c:	0137e7b3          	or	a5,a5,s3
    a810:	00faa223          	sw	a5,4(s5)
    a814:	00472783          	lw	a5,4(a4)
    a818:	0017e793          	or	a5,a5,1
    a81c:	00f72223          	sw	a5,4(a4)
    a820:	00090513          	mv	a0,s2
    a824:	f40f70ef          	jal	1f64 <__malloc_unlock>
    a828:	00040493          	mv	s1,s0
    a82c:	02812403          	lw	s0,40(sp)
    a830:	02c12083          	lw	ra,44(sp)
    a834:	02012903          	lw	s2,32(sp)
    a838:	01c12983          	lw	s3,28(sp)
    a83c:	01812a03          	lw	s4,24(sp)
    a840:	01412a83          	lw	s5,20(sp)
    a844:	00048513          	mv	a0,s1
    a848:	02412483          	lw	s1,36(sp)
    a84c:	03010113          	add	sp,sp,48
    a850:	00008067          	ret
    a854:	00177713          	and	a4,a4,1
    a858:	ee071ae3          	bnez	a4,a74c <_realloc_r+0xd4>
    a85c:	01712623          	sw	s7,12(sp)
    a860:	ff842b83          	lw	s7,-8(s0)
    a864:	01612823          	sw	s6,16(sp)
    a868:	417a8bb3          	sub	s7,s5,s7
    a86c:	004ba703          	lw	a4,4(s7)
    a870:	ffc77713          	and	a4,a4,-4
    a874:	ec9ff06f          	j	a73c <_realloc_r+0xc4>
    a878:	02c12083          	lw	ra,44(sp)
    a87c:	02412483          	lw	s1,36(sp)
    a880:	00060593          	mv	a1,a2
    a884:	03010113          	add	sp,sp,48
    a888:	ef1f606f          	j	1778 <_malloc_r>
    a88c:	0147e7b3          	or	a5,a5,s4
    a890:	00faa223          	sw	a5,4(s5)
    a894:	014a85b3          	add	a1,s5,s4
    a898:	0016e693          	or	a3,a3,1
    a89c:	00d5a223          	sw	a3,4(a1)
    a8a0:	00472783          	lw	a5,4(a4)
    a8a4:	00858593          	add	a1,a1,8
    a8a8:	00090513          	mv	a0,s2
    a8ac:	0017e793          	or	a5,a5,1
    a8b0:	00f72223          	sw	a5,4(a4)
    a8b4:	bb9f60ef          	jal	146c <_free_r>
    a8b8:	f69ff06f          	j	a820 <_realloc_r+0x1a8>
    a8bc:	ffc7f793          	and	a5,a5,-4
    a8c0:	013786b3          	add	a3,a5,s3
    a8c4:	010a0613          	add	a2,s4,16
    a8c8:	26c6d063          	bge	a3,a2,ab28 <_realloc_r+0x4b0>
    a8cc:	00177713          	and	a4,a4,1
    a8d0:	e6071ee3          	bnez	a4,a74c <_realloc_r+0xd4>
    a8d4:	01712623          	sw	s7,12(sp)
    a8d8:	ff842b83          	lw	s7,-8(s0)
    a8dc:	01612823          	sw	s6,16(sp)
    a8e0:	417a8bb3          	sub	s7,s5,s7
    a8e4:	004ba703          	lw	a4,4(s7)
    a8e8:	ffc77713          	and	a4,a4,-4
    a8ec:	00e787b3          	add	a5,a5,a4
    a8f0:	01378b33          	add	s6,a5,s3
    a8f4:	e4cb44e3          	blt	s6,a2,a73c <_realloc_r+0xc4>
    a8f8:	00cba783          	lw	a5,12(s7)
    a8fc:	008ba703          	lw	a4,8(s7)
    a900:	ffc98613          	add	a2,s3,-4
    a904:	02400693          	li	a3,36
    a908:	00f72623          	sw	a5,12(a4)
    a90c:	00e7a423          	sw	a4,8(a5)
    a910:	008b8493          	add	s1,s7,8
    a914:	28c6e463          	bltu	a3,a2,ab9c <_realloc_r+0x524>
    a918:	01300713          	li	a4,19
    a91c:	00048793          	mv	a5,s1
    a920:	02c77263          	bgeu	a4,a2,a944 <_realloc_r+0x2cc>
    a924:	00042703          	lw	a4,0(s0)
    a928:	01b00793          	li	a5,27
    a92c:	00eba423          	sw	a4,8(s7)
    a930:	00442703          	lw	a4,4(s0)
    a934:	00eba623          	sw	a4,12(s7)
    a938:	26c7ea63          	bltu	a5,a2,abac <_realloc_r+0x534>
    a93c:	00840413          	add	s0,s0,8
    a940:	010b8793          	add	a5,s7,16
    a944:	00042703          	lw	a4,0(s0)
    a948:	00e7a023          	sw	a4,0(a5)
    a94c:	00442703          	lw	a4,4(s0)
    a950:	00e7a223          	sw	a4,4(a5)
    a954:	00842703          	lw	a4,8(s0)
    a958:	00e7a423          	sw	a4,8(a5)
    a95c:	014b8733          	add	a4,s7,s4
    a960:	414b07b3          	sub	a5,s6,s4
    a964:	00ec2423          	sw	a4,8(s8)
    a968:	0017e793          	or	a5,a5,1
    a96c:	00f72223          	sw	a5,4(a4)
    a970:	004ba783          	lw	a5,4(s7)
    a974:	00090513          	mv	a0,s2
    a978:	0017f793          	and	a5,a5,1
    a97c:	0147e7b3          	or	a5,a5,s4
    a980:	00fba223          	sw	a5,4(s7)
    a984:	de0f70ef          	jal	1f64 <__malloc_unlock>
    a988:	01012b03          	lw	s6,16(sp)
    a98c:	00c12b83          	lw	s7,12(sp)
    a990:	00812c03          	lw	s8,8(sp)
    a994:	e99ff06f          	j	a82c <_realloc_r+0x1b4>
    a998:	00042683          	lw	a3,0(s0)
    a99c:	01b00713          	li	a4,27
    a9a0:	00d52023          	sw	a3,0(a0)
    a9a4:	00442683          	lw	a3,4(s0)
    a9a8:	00d52223          	sw	a3,4(a0)
    a9ac:	14c76e63          	bltu	a4,a2,ab08 <_realloc_r+0x490>
    a9b0:	00840713          	add	a4,s0,8
    a9b4:	00850793          	add	a5,a0,8
    a9b8:	dd9ff06f          	j	a790 <_realloc_r+0x118>
    a9bc:	ffc52783          	lw	a5,-4(a0)
    a9c0:	00812c03          	lw	s8,8(sp)
    a9c4:	ffc7f793          	and	a5,a5,-4
    a9c8:	00f989b3          	add	s3,s3,a5
    a9cc:	e29ff06f          	j	a7f4 <_realloc_r+0x17c>
    a9d0:	00cba783          	lw	a5,12(s7)
    a9d4:	008ba703          	lw	a4,8(s7)
    a9d8:	ffc98613          	add	a2,s3,-4
    a9dc:	02400693          	li	a3,36
    a9e0:	00f72623          	sw	a5,12(a4)
    a9e4:	00e7a423          	sw	a4,8(a5)
    a9e8:	008b8493          	add	s1,s7,8
    a9ec:	10c6e663          	bltu	a3,a2,aaf8 <_realloc_r+0x480>
    a9f0:	01300713          	li	a4,19
    a9f4:	00048793          	mv	a5,s1
    a9f8:	02c77c63          	bgeu	a4,a2,aa30 <_realloc_r+0x3b8>
    a9fc:	00042703          	lw	a4,0(s0)
    aa00:	01b00793          	li	a5,27
    aa04:	00eba423          	sw	a4,8(s7)
    aa08:	00442703          	lw	a4,4(s0)
    aa0c:	00eba623          	sw	a4,12(s7)
    aa10:	14c7f863          	bgeu	a5,a2,ab60 <_realloc_r+0x4e8>
    aa14:	00842783          	lw	a5,8(s0)
    aa18:	00fba823          	sw	a5,16(s7)
    aa1c:	00c42783          	lw	a5,12(s0)
    aa20:	00fbaa23          	sw	a5,20(s7)
    aa24:	0ad60c63          	beq	a2,a3,aadc <_realloc_r+0x464>
    aa28:	01040413          	add	s0,s0,16
    aa2c:	018b8793          	add	a5,s7,24
    aa30:	00042703          	lw	a4,0(s0)
    aa34:	00e7a023          	sw	a4,0(a5)
    aa38:	00442703          	lw	a4,4(s0)
    aa3c:	00e7a223          	sw	a4,4(a5)
    aa40:	00842703          	lw	a4,8(s0)
    aa44:	00e7a423          	sw	a4,8(a5)
    aa48:	000b0993          	mv	s3,s6
    aa4c:	000b8a93          	mv	s5,s7
    aa50:	01012b03          	lw	s6,16(sp)
    aa54:	00c12b83          	lw	s7,12(sp)
    aa58:	00812c03          	lw	s8,8(sp)
    aa5c:	00048413          	mv	s0,s1
    aa60:	d95ff06f          	j	a7f4 <_realloc_r+0x17c>
    aa64:	00040593          	mv	a1,s0
    aa68:	ae8fd0ef          	jal	7d50 <memmove>
    aa6c:	d3dff06f          	j	a7a8 <_realloc_r+0x130>
    aa70:	00c6a783          	lw	a5,12(a3)
    aa74:	0086a703          	lw	a4,8(a3)
    aa78:	ffc98613          	add	a2,s3,-4
    aa7c:	02400693          	li	a3,36
    aa80:	00f72623          	sw	a5,12(a4)
    aa84:	00e7a423          	sw	a4,8(a5)
    aa88:	008ba703          	lw	a4,8(s7)
    aa8c:	00cba783          	lw	a5,12(s7)
    aa90:	008b8493          	add	s1,s7,8
    aa94:	00f72623          	sw	a5,12(a4)
    aa98:	00e7a423          	sw	a4,8(a5)
    aa9c:	04c6ee63          	bltu	a3,a2,aaf8 <_realloc_r+0x480>
    aaa0:	01300713          	li	a4,19
    aaa4:	00048793          	mv	a5,s1
    aaa8:	f8c774e3          	bgeu	a4,a2,aa30 <_realloc_r+0x3b8>
    aaac:	00042703          	lw	a4,0(s0)
    aab0:	01b00793          	li	a5,27
    aab4:	00eba423          	sw	a4,8(s7)
    aab8:	00442703          	lw	a4,4(s0)
    aabc:	00eba623          	sw	a4,12(s7)
    aac0:	0ac7f063          	bgeu	a5,a2,ab60 <_realloc_r+0x4e8>
    aac4:	00842703          	lw	a4,8(s0)
    aac8:	02400793          	li	a5,36
    aacc:	00eba823          	sw	a4,16(s7)
    aad0:	00c42703          	lw	a4,12(s0)
    aad4:	00ebaa23          	sw	a4,20(s7)
    aad8:	f4f618e3          	bne	a2,a5,aa28 <_realloc_r+0x3b0>
    aadc:	01042703          	lw	a4,16(s0)
    aae0:	020b8793          	add	a5,s7,32
    aae4:	01840413          	add	s0,s0,24
    aae8:	00ebac23          	sw	a4,24(s7)
    aaec:	ffc42703          	lw	a4,-4(s0)
    aaf0:	00ebae23          	sw	a4,28(s7)
    aaf4:	f3dff06f          	j	aa30 <_realloc_r+0x3b8>
    aaf8:	00040593          	mv	a1,s0
    aafc:	00048513          	mv	a0,s1
    ab00:	a50fd0ef          	jal	7d50 <memmove>
    ab04:	f45ff06f          	j	aa48 <_realloc_r+0x3d0>
    ab08:	00842703          	lw	a4,8(s0)
    ab0c:	00e52423          	sw	a4,8(a0)
    ab10:	00c42703          	lw	a4,12(s0)
    ab14:	00e52623          	sw	a4,12(a0)
    ab18:	06f60463          	beq	a2,a5,ab80 <_realloc_r+0x508>
    ab1c:	01040713          	add	a4,s0,16
    ab20:	01050793          	add	a5,a0,16
    ab24:	c6dff06f          	j	a790 <_realloc_r+0x118>
    ab28:	014a8ab3          	add	s5,s5,s4
    ab2c:	414687b3          	sub	a5,a3,s4
    ab30:	015c2423          	sw	s5,8(s8)
    ab34:	0017e793          	or	a5,a5,1
    ab38:	00faa223          	sw	a5,4(s5)
    ab3c:	ffc42783          	lw	a5,-4(s0)
    ab40:	00090513          	mv	a0,s2
    ab44:	00040493          	mv	s1,s0
    ab48:	0017f793          	and	a5,a5,1
    ab4c:	0147e7b3          	or	a5,a5,s4
    ab50:	fef42e23          	sw	a5,-4(s0)
    ab54:	c10f70ef          	jal	1f64 <__malloc_unlock>
    ab58:	00812c03          	lw	s8,8(sp)
    ab5c:	cd1ff06f          	j	a82c <_realloc_r+0x1b4>
    ab60:	00840413          	add	s0,s0,8
    ab64:	010b8793          	add	a5,s7,16
    ab68:	ec9ff06f          	j	aa30 <_realloc_r+0x3b8>
    ab6c:	00090513          	mv	a0,s2
    ab70:	bf4f70ef          	jal	1f64 <__malloc_unlock>
    ab74:	00000493          	li	s1,0
    ab78:	00812c03          	lw	s8,8(sp)
    ab7c:	cb1ff06f          	j	a82c <_realloc_r+0x1b4>
    ab80:	01042683          	lw	a3,16(s0)
    ab84:	01840713          	add	a4,s0,24
    ab88:	01850793          	add	a5,a0,24
    ab8c:	00d52823          	sw	a3,16(a0)
    ab90:	01442683          	lw	a3,20(s0)
    ab94:	00d52a23          	sw	a3,20(a0)
    ab98:	bf9ff06f          	j	a790 <_realloc_r+0x118>
    ab9c:	00040593          	mv	a1,s0
    aba0:	00048513          	mv	a0,s1
    aba4:	9acfd0ef          	jal	7d50 <memmove>
    aba8:	db5ff06f          	j	a95c <_realloc_r+0x2e4>
    abac:	00842783          	lw	a5,8(s0)
    abb0:	00fba823          	sw	a5,16(s7)
    abb4:	00c42783          	lw	a5,12(s0)
    abb8:	00fbaa23          	sw	a5,20(s7)
    abbc:	00d60863          	beq	a2,a3,abcc <_realloc_r+0x554>
    abc0:	01040413          	add	s0,s0,16
    abc4:	018b8793          	add	a5,s7,24
    abc8:	d7dff06f          	j	a944 <_realloc_r+0x2cc>
    abcc:	01042703          	lw	a4,16(s0)
    abd0:	020b8793          	add	a5,s7,32
    abd4:	01840413          	add	s0,s0,24
    abd8:	00ebac23          	sw	a4,24(s7)
    abdc:	ffc42703          	lw	a4,-4(s0)
    abe0:	00ebae23          	sw	a4,28(s7)
    abe4:	d61ff06f          	j	a944 <_realloc_r+0x2cc>

0000abe8 <__ascii_wctomb>:
    abe8:	02058463          	beqz	a1,ac10 <__ascii_wctomb+0x28>
    abec:	0ff00793          	li	a5,255
    abf0:	00c7e863          	bltu	a5,a2,ac00 <__ascii_wctomb+0x18>
    abf4:	00c58023          	sb	a2,0(a1)
    abf8:	00100513          	li	a0,1
    abfc:	00008067          	ret
    ac00:	08a00793          	li	a5,138
    ac04:	00f52023          	sw	a5,0(a0)
    ac08:	fff00513          	li	a0,-1
    ac0c:	00008067          	ret
    ac10:	00000513          	li	a0,0
    ac14:	00008067          	ret

0000ac18 <_wcrtomb_r>:
    ac18:	fe010113          	add	sp,sp,-32
    ac1c:	00812c23          	sw	s0,24(sp)
    ac20:	00912a23          	sw	s1,20(sp)
    ac24:	00112e23          	sw	ra,28(sp)
    ac28:	00050493          	mv	s1,a0
    ac2c:	10450413          	add	s0,a0,260
    ac30:	00068463          	beqz	a3,ac38 <_wcrtomb_r+0x20>
    ac34:	00068413          	mv	s0,a3
    ac38:	7fff6797          	auipc	a5,0x7fff6
    ac3c:	9dc7a783          	lw	a5,-1572(a5) # 80000614 <__global_locale+0xe0>
    ac40:	00040693          	mv	a3,s0
    ac44:	02058463          	beqz	a1,ac6c <_wcrtomb_r+0x54>
    ac48:	00048513          	mv	a0,s1
    ac4c:	000780e7          	jalr	a5
    ac50:	fff00793          	li	a5,-1
    ac54:	02f50863          	beq	a0,a5,ac84 <_wcrtomb_r+0x6c>
    ac58:	01c12083          	lw	ra,28(sp)
    ac5c:	01812403          	lw	s0,24(sp)
    ac60:	01412483          	lw	s1,20(sp)
    ac64:	02010113          	add	sp,sp,32
    ac68:	00008067          	ret
    ac6c:	00000613          	li	a2,0
    ac70:	00410593          	add	a1,sp,4
    ac74:	00048513          	mv	a0,s1
    ac78:	000780e7          	jalr	a5
    ac7c:	fff00793          	li	a5,-1
    ac80:	fcf51ce3          	bne	a0,a5,ac58 <_wcrtomb_r+0x40>
    ac84:	00042023          	sw	zero,0(s0)
    ac88:	01c12083          	lw	ra,28(sp)
    ac8c:	01812403          	lw	s0,24(sp)
    ac90:	08a00793          	li	a5,138
    ac94:	00f4a023          	sw	a5,0(s1)
    ac98:	01412483          	lw	s1,20(sp)
    ac9c:	02010113          	add	sp,sp,32
    aca0:	00008067          	ret

0000aca4 <_wcsrtombs_r>:
    aca4:	00070793          	mv	a5,a4
    aca8:	00068713          	mv	a4,a3
    acac:	fff00693          	li	a3,-1
    acb0:	7a40006f          	j	b454 <_wcsnrtombs_r>

0000acb4 <_fclose_r>:
    acb4:	ff010113          	add	sp,sp,-16
    acb8:	00112623          	sw	ra,12(sp)
    acbc:	01212023          	sw	s2,0(sp)
    acc0:	0e058263          	beqz	a1,ada4 <_fclose_r+0xf0>
    acc4:	00812423          	sw	s0,8(sp)
    acc8:	00912223          	sw	s1,4(sp)
    accc:	00058413          	mv	s0,a1
    acd0:	00050493          	mv	s1,a0
    acd4:	00050663          	beqz	a0,ace0 <_fclose_r+0x2c>
    acd8:	03452783          	lw	a5,52(a0)
    acdc:	10078063          	beqz	a5,addc <_fclose_r+0x128>
    ace0:	06442783          	lw	a5,100(s0)
    ace4:	00c41703          	lh	a4,12(s0)
    ace8:	0017f793          	and	a5,a5,1
    acec:	0a079663          	bnez	a5,ad98 <_fclose_r+0xe4>
    acf0:	20077713          	and	a4,a4,512
    acf4:	0e070863          	beqz	a4,ade4 <_fclose_r+0x130>
    acf8:	00040593          	mv	a1,s0
    acfc:	00048513          	mv	a0,s1
    ad00:	9f5fb0ef          	jal	66f4 <__sflush_r>
    ad04:	02c42783          	lw	a5,44(s0)
    ad08:	00050913          	mv	s2,a0
    ad0c:	00078a63          	beqz	a5,ad20 <_fclose_r+0x6c>
    ad10:	01c42583          	lw	a1,28(s0)
    ad14:	00048513          	mv	a0,s1
    ad18:	000780e7          	jalr	a5
    ad1c:	0a054063          	bltz	a0,adbc <_fclose_r+0x108>
    ad20:	00c45783          	lhu	a5,12(s0)
    ad24:	0807f793          	and	a5,a5,128
    ad28:	0a079263          	bnez	a5,adcc <_fclose_r+0x118>
    ad2c:	03042583          	lw	a1,48(s0)
    ad30:	00058c63          	beqz	a1,ad48 <_fclose_r+0x94>
    ad34:	04040793          	add	a5,s0,64
    ad38:	00f58663          	beq	a1,a5,ad44 <_fclose_r+0x90>
    ad3c:	00048513          	mv	a0,s1
    ad40:	f2cf60ef          	jal	146c <_free_r>
    ad44:	02042823          	sw	zero,48(s0)
    ad48:	04442583          	lw	a1,68(s0)
    ad4c:	00058863          	beqz	a1,ad5c <_fclose_r+0xa8>
    ad50:	00048513          	mv	a0,s1
    ad54:	f18f60ef          	jal	146c <_free_r>
    ad58:	04042223          	sw	zero,68(s0)
    ad5c:	f51fb0ef          	jal	6cac <__sfp_lock_acquire>
    ad60:	06442783          	lw	a5,100(s0)
    ad64:	00041623          	sh	zero,12(s0)
    ad68:	0017f793          	and	a5,a5,1
    ad6c:	0a078663          	beqz	a5,ae18 <_fclose_r+0x164>
    ad70:	05842503          	lw	a0,88(s0)
    ad74:	a9cf60ef          	jal	1010 <__retarget_lock_close_recursive>
    ad78:	f41fb0ef          	jal	6cb8 <__sfp_lock_release>
    ad7c:	00c12083          	lw	ra,12(sp)
    ad80:	00812403          	lw	s0,8(sp)
    ad84:	00412483          	lw	s1,4(sp)
    ad88:	00090513          	mv	a0,s2
    ad8c:	00012903          	lw	s2,0(sp)
    ad90:	01010113          	add	sp,sp,16
    ad94:	00008067          	ret
    ad98:	f60710e3          	bnez	a4,acf8 <_fclose_r+0x44>
    ad9c:	00812403          	lw	s0,8(sp)
    ada0:	00412483          	lw	s1,4(sp)
    ada4:	00000913          	li	s2,0
    ada8:	00c12083          	lw	ra,12(sp)
    adac:	00090513          	mv	a0,s2
    adb0:	00012903          	lw	s2,0(sp)
    adb4:	01010113          	add	sp,sp,16
    adb8:	00008067          	ret
    adbc:	00c45783          	lhu	a5,12(s0)
    adc0:	fff00913          	li	s2,-1
    adc4:	0807f793          	and	a5,a5,128
    adc8:	f60782e3          	beqz	a5,ad2c <_fclose_r+0x78>
    adcc:	01042583          	lw	a1,16(s0)
    add0:	00048513          	mv	a0,s1
    add4:	e98f60ef          	jal	146c <_free_r>
    add8:	f55ff06f          	j	ad2c <_fclose_r+0x78>
    addc:	e61fb0ef          	jal	6c3c <__sinit>
    ade0:	f01ff06f          	j	ace0 <_fclose_r+0x2c>
    ade4:	05842503          	lw	a0,88(s0)
    ade8:	a2cf60ef          	jal	1014 <__retarget_lock_acquire_recursive>
    adec:	00c41783          	lh	a5,12(s0)
    adf0:	f00794e3          	bnez	a5,acf8 <_fclose_r+0x44>
    adf4:	06442783          	lw	a5,100(s0)
    adf8:	0017f793          	and	a5,a5,1
    adfc:	fa0790e3          	bnez	a5,ad9c <_fclose_r+0xe8>
    ae00:	05842503          	lw	a0,88(s0)
    ae04:	00000913          	li	s2,0
    ae08:	a10f60ef          	jal	1018 <__retarget_lock_release_recursive>
    ae0c:	00812403          	lw	s0,8(sp)
    ae10:	00412483          	lw	s1,4(sp)
    ae14:	f95ff06f          	j	ada8 <_fclose_r+0xf4>
    ae18:	05842503          	lw	a0,88(s0)
    ae1c:	9fcf60ef          	jal	1018 <__retarget_lock_release_recursive>
    ae20:	f51ff06f          	j	ad70 <_fclose_r+0xbc>

0000ae24 <__smakebuf_r>:
    ae24:	00c59783          	lh	a5,12(a1)
    ae28:	f8010113          	add	sp,sp,-128
    ae2c:	06812c23          	sw	s0,120(sp)
    ae30:	06112e23          	sw	ra,124(sp)
    ae34:	0027f713          	and	a4,a5,2
    ae38:	00058413          	mv	s0,a1
    ae3c:	02070463          	beqz	a4,ae64 <__smakebuf_r+0x40>
    ae40:	04358793          	add	a5,a1,67
    ae44:	00f5a023          	sw	a5,0(a1)
    ae48:	00f5a823          	sw	a5,16(a1)
    ae4c:	00100793          	li	a5,1
    ae50:	00f5aa23          	sw	a5,20(a1)
    ae54:	07c12083          	lw	ra,124(sp)
    ae58:	07812403          	lw	s0,120(sp)
    ae5c:	08010113          	add	sp,sp,128
    ae60:	00008067          	ret
    ae64:	00e59583          	lh	a1,14(a1)
    ae68:	06912a23          	sw	s1,116(sp)
    ae6c:	07212823          	sw	s2,112(sp)
    ae70:	07312623          	sw	s3,108(sp)
    ae74:	07412423          	sw	s4,104(sp)
    ae78:	00050493          	mv	s1,a0
    ae7c:	0805c663          	bltz	a1,af08 <__smakebuf_r+0xe4>
    ae80:	00810613          	add	a2,sp,8
    ae84:	138000ef          	jal	afbc <_fstat_r>
    ae88:	06054e63          	bltz	a0,af04 <__smakebuf_r+0xe0>
    ae8c:	00c12783          	lw	a5,12(sp)
    ae90:	0000f937          	lui	s2,0xf
    ae94:	000019b7          	lui	s3,0x1
    ae98:	00f97933          	and	s2,s2,a5
    ae9c:	ffffe7b7          	lui	a5,0xffffe
    aea0:	00f90933          	add	s2,s2,a5
    aea4:	00193913          	seqz	s2,s2
    aea8:	40000a13          	li	s4,1024
    aeac:	80098993          	add	s3,s3,-2048 # 800 <gemm_cfs_tiles.constprop.0+0x368>
    aeb0:	000a0593          	mv	a1,s4
    aeb4:	00048513          	mv	a0,s1
    aeb8:	8c1f60ef          	jal	1778 <_malloc_r>
    aebc:	00c41783          	lh	a5,12(s0)
    aec0:	06050863          	beqz	a0,af30 <__smakebuf_r+0x10c>
    aec4:	0807e793          	or	a5,a5,128
    aec8:	00a42023          	sw	a0,0(s0)
    aecc:	00a42823          	sw	a0,16(s0)
    aed0:	00f41623          	sh	a5,12(s0)
    aed4:	01442a23          	sw	s4,20(s0)
    aed8:	0a091063          	bnez	s2,af78 <__smakebuf_r+0x154>
    aedc:	0137e7b3          	or	a5,a5,s3
    aee0:	07c12083          	lw	ra,124(sp)
    aee4:	00f41623          	sh	a5,12(s0)
    aee8:	07812403          	lw	s0,120(sp)
    aeec:	07412483          	lw	s1,116(sp)
    aef0:	07012903          	lw	s2,112(sp)
    aef4:	06c12983          	lw	s3,108(sp)
    aef8:	06812a03          	lw	s4,104(sp)
    aefc:	08010113          	add	sp,sp,128
    af00:	00008067          	ret
    af04:	00c41783          	lh	a5,12(s0)
    af08:	0807f793          	and	a5,a5,128
    af0c:	00000913          	li	s2,0
    af10:	04078e63          	beqz	a5,af6c <__smakebuf_r+0x148>
    af14:	04000a13          	li	s4,64
    af18:	000a0593          	mv	a1,s4
    af1c:	00048513          	mv	a0,s1
    af20:	859f60ef          	jal	1778 <_malloc_r>
    af24:	00c41783          	lh	a5,12(s0)
    af28:	00000993          	li	s3,0
    af2c:	f8051ce3          	bnez	a0,aec4 <__smakebuf_r+0xa0>
    af30:	2007f713          	and	a4,a5,512
    af34:	04071e63          	bnez	a4,af90 <__smakebuf_r+0x16c>
    af38:	ffc7f793          	and	a5,a5,-4
    af3c:	0027e793          	or	a5,a5,2
    af40:	04340713          	add	a4,s0,67
    af44:	00f41623          	sh	a5,12(s0)
    af48:	00100793          	li	a5,1
    af4c:	07412483          	lw	s1,116(sp)
    af50:	07012903          	lw	s2,112(sp)
    af54:	06c12983          	lw	s3,108(sp)
    af58:	06812a03          	lw	s4,104(sp)
    af5c:	00e42023          	sw	a4,0(s0)
    af60:	00e42823          	sw	a4,16(s0)
    af64:	00f42a23          	sw	a5,20(s0)
    af68:	eedff06f          	j	ae54 <__smakebuf_r+0x30>
    af6c:	40000a13          	li	s4,1024
    af70:	00000993          	li	s3,0
    af74:	f3dff06f          	j	aeb0 <__smakebuf_r+0x8c>
    af78:	00e41583          	lh	a1,14(s0)
    af7c:	00048513          	mv	a0,s1
    af80:	09c000ef          	jal	b01c <_isatty_r>
    af84:	02051063          	bnez	a0,afa4 <__smakebuf_r+0x180>
    af88:	00c41783          	lh	a5,12(s0)
    af8c:	f51ff06f          	j	aedc <__smakebuf_r+0xb8>
    af90:	07412483          	lw	s1,116(sp)
    af94:	07012903          	lw	s2,112(sp)
    af98:	06c12983          	lw	s3,108(sp)
    af9c:	06812a03          	lw	s4,104(sp)
    afa0:	eb5ff06f          	j	ae54 <__smakebuf_r+0x30>
    afa4:	00c45783          	lhu	a5,12(s0)
    afa8:	ffc7f793          	and	a5,a5,-4
    afac:	0017e793          	or	a5,a5,1
    afb0:	01079793          	sll	a5,a5,0x10
    afb4:	4107d793          	sra	a5,a5,0x10
    afb8:	f25ff06f          	j	aedc <__smakebuf_r+0xb8>

0000afbc <_fstat_r>:
    afbc:	ff010113          	add	sp,sp,-16
    afc0:	00058713          	mv	a4,a1
    afc4:	00812423          	sw	s0,8(sp)
    afc8:	00060593          	mv	a1,a2
    afcc:	00050413          	mv	s0,a0
    afd0:	00070513          	mv	a0,a4
    afd4:	7fff5797          	auipc	a5,0x7fff5
    afd8:	7407a423          	sw	zero,1864(a5) # 8000071c <errno>
    afdc:	00112623          	sw	ra,12(sp)
    afe0:	c15f50ef          	jal	bf4 <_fstat>
    afe4:	fff00793          	li	a5,-1
    afe8:	00f50a63          	beq	a0,a5,affc <_fstat_r+0x40>
    afec:	00c12083          	lw	ra,12(sp)
    aff0:	00812403          	lw	s0,8(sp)
    aff4:	01010113          	add	sp,sp,16
    aff8:	00008067          	ret
    affc:	7fff5797          	auipc	a5,0x7fff5
    b000:	7207a783          	lw	a5,1824(a5) # 8000071c <errno>
    b004:	fe0784e3          	beqz	a5,afec <_fstat_r+0x30>
    b008:	00c12083          	lw	ra,12(sp)
    b00c:	00f42023          	sw	a5,0(s0)
    b010:	00812403          	lw	s0,8(sp)
    b014:	01010113          	add	sp,sp,16
    b018:	00008067          	ret

0000b01c <_isatty_r>:
    b01c:	ff010113          	add	sp,sp,-16
    b020:	00812423          	sw	s0,8(sp)
    b024:	00050413          	mv	s0,a0
    b028:	00058513          	mv	a0,a1
    b02c:	7fff5797          	auipc	a5,0x7fff5
    b030:	6e07a823          	sw	zero,1776(a5) # 8000071c <errno>
    b034:	00112623          	sw	ra,12(sp)
    b038:	bd5f50ef          	jal	c0c <_isatty>
    b03c:	fff00793          	li	a5,-1
    b040:	00f50a63          	beq	a0,a5,b054 <_isatty_r+0x38>
    b044:	00c12083          	lw	ra,12(sp)
    b048:	00812403          	lw	s0,8(sp)
    b04c:	01010113          	add	sp,sp,16
    b050:	00008067          	ret
    b054:	7fff5797          	auipc	a5,0x7fff5
    b058:	6c87a783          	lw	a5,1736(a5) # 8000071c <errno>
    b05c:	fe0784e3          	beqz	a5,b044 <_isatty_r+0x28>
    b060:	00c12083          	lw	ra,12(sp)
    b064:	00f42023          	sw	a5,0(s0)
    b068:	00812403          	lw	s0,8(sp)
    b06c:	01010113          	add	sp,sp,16
    b070:	00008067          	ret

0000b074 <__errno>:
    b074:	7fff5517          	auipc	a0,0x7fff5
    b078:	69452503          	lw	a0,1684(a0) # 80000708 <_impure_ptr>
    b07c:	00008067          	ret

0000b080 <__assert_func>:
    b080:	ff010113          	add	sp,sp,-16
    b084:	00068793          	mv	a5,a3
    b088:	7fff5717          	auipc	a4,0x7fff5
    b08c:	68072703          	lw	a4,1664(a4) # 80000708 <_impure_ptr>
    b090:	00060813          	mv	a6,a2
    b094:	00112623          	sw	ra,12(sp)
    b098:	00c72883          	lw	a7,12(a4)
    b09c:	00078613          	mv	a2,a5
    b0a0:	00050693          	mv	a3,a0
    b0a4:	00058713          	mv	a4,a1
    b0a8:	00004797          	auipc	a5,0x4
    b0ac:	28478793          	add	a5,a5,644 # f32c <__fini_array_end+0x36c>
    b0b0:	00080c63          	beqz	a6,b0c8 <__assert_func+0x48>
    b0b4:	00004597          	auipc	a1,0x4
    b0b8:	28858593          	add	a1,a1,648 # f33c <__fini_array_end+0x37c>
    b0bc:	00088513          	mv	a0,a7
    b0c0:	3a8000ef          	jal	b468 <fiprintf>
    b0c4:	3f0000ef          	jal	b4b4 <abort>
    b0c8:	00004797          	auipc	a5,0x4
    b0cc:	f5878793          	add	a5,a5,-168 # f020 <__fini_array_end+0x60>
    b0d0:	00078813          	mv	a6,a5
    b0d4:	fe1ff06f          	j	b0b4 <__assert_func+0x34>

0000b0d8 <_calloc_r>:
    b0d8:	fe010113          	add	sp,sp,-32
    b0dc:	00812c23          	sw	s0,24(sp)
    b0e0:	00112e23          	sw	ra,28(sp)
    b0e4:	0105d693          	srl	a3,a1,0x10
    b0e8:	00058793          	mv	a5,a1
    b0ec:	00050413          	mv	s0,a0
    b0f0:	01065713          	srl	a4,a2,0x10
    b0f4:	0c069063          	bnez	a3,b1b4 <_calloc_r+0xdc>
    b0f8:	14071a63          	bnez	a4,b24c <_calloc_r+0x174>
    b0fc:	01061593          	sll	a1,a2,0x10
    b100:	01079513          	sll	a0,a5,0x10
    b104:	0105d593          	srl	a1,a1,0x10
    b108:	01055513          	srl	a0,a0,0x10
    b10c:	4bd030ef          	jal	edc8 <__mulsi3>
    b110:	00050593          	mv	a1,a0
    b114:	00040513          	mv	a0,s0
    b118:	e60f60ef          	jal	1778 <_malloc_r>
    b11c:	00050413          	mv	s0,a0
    b120:	10050a63          	beqz	a0,b234 <_calloc_r+0x15c>
    b124:	ffc52603          	lw	a2,-4(a0)
    b128:	02400713          	li	a4,36
    b12c:	ffc67613          	and	a2,a2,-4
    b130:	ffc60613          	add	a2,a2,-4
    b134:	04c76863          	bltu	a4,a2,b184 <_calloc_r+0xac>
    b138:	01300693          	li	a3,19
    b13c:	00050793          	mv	a5,a0
    b140:	02c6f263          	bgeu	a3,a2,b164 <_calloc_r+0x8c>
    b144:	00052023          	sw	zero,0(a0)
    b148:	00052223          	sw	zero,4(a0)
    b14c:	01b00793          	li	a5,27
    b150:	04c7f863          	bgeu	a5,a2,b1a0 <_calloc_r+0xc8>
    b154:	00052423          	sw	zero,8(a0)
    b158:	00052623          	sw	zero,12(a0)
    b15c:	01050793          	add	a5,a0,16
    b160:	10e60263          	beq	a2,a4,b264 <_calloc_r+0x18c>
    b164:	0007a023          	sw	zero,0(a5)
    b168:	0007a223          	sw	zero,4(a5)
    b16c:	0007a423          	sw	zero,8(a5)
    b170:	01c12083          	lw	ra,28(sp)
    b174:	00040513          	mv	a0,s0
    b178:	01812403          	lw	s0,24(sp)
    b17c:	02010113          	add	sp,sp,32
    b180:	00008067          	ret
    b184:	00000593          	li	a1,0
    b188:	e95f50ef          	jal	101c <memset>
    b18c:	01c12083          	lw	ra,28(sp)
    b190:	00040513          	mv	a0,s0
    b194:	01812403          	lw	s0,24(sp)
    b198:	02010113          	add	sp,sp,32
    b19c:	00008067          	ret
    b1a0:	00850793          	add	a5,a0,8
    b1a4:	0007a023          	sw	zero,0(a5)
    b1a8:	0007a223          	sw	zero,4(a5)
    b1ac:	0007a423          	sw	zero,8(a5)
    b1b0:	fc1ff06f          	j	b170 <_calloc_r+0x98>
    b1b4:	0c071663          	bnez	a4,b280 <_calloc_r+0x1a8>
    b1b8:	01212823          	sw	s2,16(sp)
    b1bc:	01312623          	sw	s3,12(sp)
    b1c0:	00912a23          	sw	s1,20(sp)
    b1c4:	00068913          	mv	s2,a3
    b1c8:	00060993          	mv	s3,a2
    b1cc:	01079513          	sll	a0,a5,0x10
    b1d0:	01061593          	sll	a1,a2,0x10
    b1d4:	0105d593          	srl	a1,a1,0x10
    b1d8:	01055513          	srl	a0,a0,0x10
    b1dc:	3ed030ef          	jal	edc8 <__mulsi3>
    b1e0:	00050493          	mv	s1,a0
    b1e4:	01091593          	sll	a1,s2,0x10
    b1e8:	01099513          	sll	a0,s3,0x10
    b1ec:	0105d593          	srl	a1,a1,0x10
    b1f0:	01055513          	srl	a0,a0,0x10
    b1f4:	3d5030ef          	jal	edc8 <__mulsi3>
    b1f8:	0104d793          	srl	a5,s1,0x10
    b1fc:	00f505b3          	add	a1,a0,a5
    b200:	0105d793          	srl	a5,a1,0x10
    b204:	06079863          	bnez	a5,b274 <_calloc_r+0x19c>
    b208:	01049493          	sll	s1,s1,0x10
    b20c:	0104d493          	srl	s1,s1,0x10
    b210:	01059593          	sll	a1,a1,0x10
    b214:	0095e5b3          	or	a1,a1,s1
    b218:	00040513          	mv	a0,s0
    b21c:	01412483          	lw	s1,20(sp)
    b220:	01012903          	lw	s2,16(sp)
    b224:	00c12983          	lw	s3,12(sp)
    b228:	d50f60ef          	jal	1778 <_malloc_r>
    b22c:	00050413          	mv	s0,a0
    b230:	ee051ae3          	bnez	a0,b124 <_calloc_r+0x4c>
    b234:	00000413          	li	s0,0
    b238:	01c12083          	lw	ra,28(sp)
    b23c:	00040513          	mv	a0,s0
    b240:	01812403          	lw	s0,24(sp)
    b244:	02010113          	add	sp,sp,32
    b248:	00008067          	ret
    b24c:	01212823          	sw	s2,16(sp)
    b250:	01312623          	sw	s3,12(sp)
    b254:	00912a23          	sw	s1,20(sp)
    b258:	00070913          	mv	s2,a4
    b25c:	00058993          	mv	s3,a1
    b260:	f6dff06f          	j	b1cc <_calloc_r+0xf4>
    b264:	00052823          	sw	zero,16(a0)
    b268:	01850793          	add	a5,a0,24
    b26c:	00052a23          	sw	zero,20(a0)
    b270:	ef5ff06f          	j	b164 <_calloc_r+0x8c>
    b274:	01412483          	lw	s1,20(sp)
    b278:	01012903          	lw	s2,16(sp)
    b27c:	00c12983          	lw	s3,12(sp)
    b280:	df5ff0ef          	jal	b074 <__errno>
    b284:	00c00793          	li	a5,12
    b288:	00f52023          	sw	a5,0(a0)
    b28c:	00000413          	li	s0,0
    b290:	fa9ff06f          	j	b238 <_calloc_r+0x160>

0000b294 <_wcsnrtombs_l>:
    b294:	fa010113          	add	sp,sp,-96
    b298:	04912a23          	sw	s1,84(sp)
    b29c:	05212823          	sw	s2,80(sp)
    b2a0:	05312623          	sw	s3,76(sp)
    b2a4:	05412423          	sw	s4,72(sp)
    b2a8:	05512223          	sw	s5,68(sp)
    b2ac:	04112e23          	sw	ra,92(sp)
    b2b0:	03912a23          	sw	s9,52(sp)
    b2b4:	03a12823          	sw	s10,48(sp)
    b2b8:	00a12623          	sw	a0,12(sp)
    b2bc:	00058a13          	mv	s4,a1
    b2c0:	00060a93          	mv	s5,a2
    b2c4:	00070913          	mv	s2,a4
    b2c8:	00080993          	mv	s3,a6
    b2cc:	00078493          	mv	s1,a5
    b2d0:	12078063          	beqz	a5,b3f0 <_wcsnrtombs_l+0x15c>
    b2d4:	000aac83          	lw	s9,0(s5)
    b2d8:	120a0263          	beqz	s4,b3fc <_wcsnrtombs_l+0x168>
    b2dc:	14090e63          	beqz	s2,b438 <_wcsnrtombs_l+0x1a4>
    b2e0:	05612023          	sw	s6,64(sp)
    b2e4:	fff68b13          	add	s6,a3,-1
    b2e8:	16068063          	beqz	a3,b448 <_wcsnrtombs_l+0x1b4>
    b2ec:	04812c23          	sw	s0,88(sp)
    b2f0:	03b12623          	sw	s11,44(sp)
    b2f4:	03712e23          	sw	s7,60(sp)
    b2f8:	03812c23          	sw	s8,56(sp)
    b2fc:	000a0413          	mv	s0,s4
    b300:	00000d13          	li	s10,0
    b304:	fff00d93          	li	s11,-1
    b308:	0240006f          	j	b32c <_wcsnrtombs_l+0x98>
    b30c:	080a1a63          	bnez	s4,b3a0 <_wcsnrtombs_l+0x10c>
    b310:	000ca783          	lw	a5,0(s9)
    b314:	004c8c93          	add	s9,s9,4
    b318:	0c078263          	beqz	a5,b3dc <_wcsnrtombs_l+0x148>
    b31c:	1326f263          	bgeu	a3,s2,b440 <_wcsnrtombs_l+0x1ac>
    b320:	fffb0b13          	add	s6,s6,-1
    b324:	00068d13          	mv	s10,a3
    b328:	03bb0c63          	beq	s6,s11,b360 <_wcsnrtombs_l+0xcc>
    b32c:	0e09a783          	lw	a5,224(s3)
    b330:	000ca603          	lw	a2,0(s9)
    b334:	00c12503          	lw	a0,12(sp)
    b338:	00048693          	mv	a3,s1
    b33c:	01410593          	add	a1,sp,20
    b340:	0004ac03          	lw	s8,0(s1)
    b344:	0044ab83          	lw	s7,4(s1)
    b348:	000780e7          	jalr	a5
    b34c:	0bb50e63          	beq	a0,s11,b408 <_wcsnrtombs_l+0x174>
    b350:	01a506b3          	add	a3,a0,s10
    b354:	fad97ce3          	bgeu	s2,a3,b30c <_wcsnrtombs_l+0x78>
    b358:	0184a023          	sw	s8,0(s1)
    b35c:	0174a223          	sw	s7,4(s1)
    b360:	05812403          	lw	s0,88(sp)
    b364:	04012b03          	lw	s6,64(sp)
    b368:	03c12b83          	lw	s7,60(sp)
    b36c:	03812c03          	lw	s8,56(sp)
    b370:	02c12d83          	lw	s11,44(sp)
    b374:	05c12083          	lw	ra,92(sp)
    b378:	05412483          	lw	s1,84(sp)
    b37c:	05012903          	lw	s2,80(sp)
    b380:	04c12983          	lw	s3,76(sp)
    b384:	04812a03          	lw	s4,72(sp)
    b388:	04412a83          	lw	s5,68(sp)
    b38c:	03412c83          	lw	s9,52(sp)
    b390:	000d0513          	mv	a0,s10
    b394:	03012d03          	lw	s10,48(sp)
    b398:	06010113          	add	sp,sp,96
    b39c:	00008067          	ret
    b3a0:	08a05063          	blez	a0,b420 <_wcsnrtombs_l+0x18c>
    b3a4:	01410893          	add	a7,sp,20
    b3a8:	00a40533          	add	a0,s0,a0
    b3ac:	0008c783          	lbu	a5,0(a7)
    b3b0:	00140413          	add	s0,s0,1
    b3b4:	00188893          	add	a7,a7,1
    b3b8:	fef40fa3          	sb	a5,-1(s0)
    b3bc:	fe8518e3          	bne	a0,s0,b3ac <_wcsnrtombs_l+0x118>
    b3c0:	000aa783          	lw	a5,0(s5)
    b3c4:	00050413          	mv	s0,a0
    b3c8:	00478793          	add	a5,a5,4
    b3cc:	00faa023          	sw	a5,0(s5)
    b3d0:	000ca783          	lw	a5,0(s9)
    b3d4:	004c8c93          	add	s9,s9,4
    b3d8:	f40792e3          	bnez	a5,b31c <_wcsnrtombs_l+0x88>
    b3dc:	000a0463          	beqz	s4,b3e4 <_wcsnrtombs_l+0x150>
    b3e0:	000aa023          	sw	zero,0(s5)
    b3e4:	0004a023          	sw	zero,0(s1)
    b3e8:	fff68d13          	add	s10,a3,-1
    b3ec:	f75ff06f          	j	b360 <_wcsnrtombs_l+0xcc>
    b3f0:	000aac83          	lw	s9,0(s5)
    b3f4:	10c50493          	add	s1,a0,268
    b3f8:	ee0a12e3          	bnez	s4,b2dc <_wcsnrtombs_l+0x48>
    b3fc:	05612023          	sw	s6,64(sp)
    b400:	fff00913          	li	s2,-1
    b404:	ee1ff06f          	j	b2e4 <_wcsnrtombs_l+0x50>
    b408:	00c12703          	lw	a4,12(sp)
    b40c:	08a00793          	li	a5,138
    b410:	fff00d13          	li	s10,-1
    b414:	00f72023          	sw	a5,0(a4)
    b418:	0004a023          	sw	zero,0(s1)
    b41c:	f45ff06f          	j	b360 <_wcsnrtombs_l+0xcc>
    b420:	000aa783          	lw	a5,0(s5)
    b424:	00040513          	mv	a0,s0
    b428:	00050413          	mv	s0,a0
    b42c:	00478793          	add	a5,a5,4
    b430:	00faa023          	sw	a5,0(s5)
    b434:	f9dff06f          	j	b3d0 <_wcsnrtombs_l+0x13c>
    b438:	00000d13          	li	s10,0
    b43c:	f39ff06f          	j	b374 <_wcsnrtombs_l+0xe0>
    b440:	00068d13          	mv	s10,a3
    b444:	f1dff06f          	j	b360 <_wcsnrtombs_l+0xcc>
    b448:	04012b03          	lw	s6,64(sp)
    b44c:	00000d13          	li	s10,0
    b450:	f25ff06f          	j	b374 <_wcsnrtombs_l+0xe0>

0000b454 <_wcsnrtombs_r>:
    b454:	7fff5817          	auipc	a6,0x7fff5
    b458:	0e080813          	add	a6,a6,224 # 80000534 <__global_locale>
    b45c:	7fff5517          	auipc	a0,0x7fff5
    b460:	2ac52503          	lw	a0,684(a0) # 80000708 <_impure_ptr>
    b464:	e31ff06f          	j	b294 <_wcsnrtombs_l>

0000b468 <fiprintf>:
    b468:	fc010113          	add	sp,sp,-64
    b46c:	02810313          	add	t1,sp,40
    b470:	02c12423          	sw	a2,40(sp)
    b474:	02d12623          	sw	a3,44(sp)
    b478:	00058613          	mv	a2,a1
    b47c:	00030693          	mv	a3,t1
    b480:	00050593          	mv	a1,a0
    b484:	7fff5517          	auipc	a0,0x7fff5
    b488:	28452503          	lw	a0,644(a0) # 80000708 <_impure_ptr>
    b48c:	00112e23          	sw	ra,28(sp)
    b490:	02e12823          	sw	a4,48(sp)
    b494:	02f12a23          	sw	a5,52(sp)
    b498:	03012c23          	sw	a6,56(sp)
    b49c:	03112e23          	sw	a7,60(sp)
    b4a0:	00612623          	sw	t1,12(sp)
    b4a4:	9a1f90ef          	jal	4e44 <_vfiprintf_r>
    b4a8:	01c12083          	lw	ra,28(sp)
    b4ac:	04010113          	add	sp,sp,64
    b4b0:	00008067          	ret

0000b4b4 <abort>:
    b4b4:	ff010113          	add	sp,sp,-16
    b4b8:	00600513          	li	a0,6
    b4bc:	00112623          	sw	ra,12(sp)
    b4c0:	00c000ef          	jal	b4cc <raise>
    b4c4:	00100513          	li	a0,1
    b4c8:	f14f50ef          	jal	bdc <_exit>

0000b4cc <raise>:
    b4cc:	ff010113          	add	sp,sp,-16
    b4d0:	00912223          	sw	s1,4(sp)
    b4d4:	00112623          	sw	ra,12(sp)
    b4d8:	01f00793          	li	a5,31
    b4dc:	7fff5497          	auipc	s1,0x7fff5
    b4e0:	22c4a483          	lw	s1,556(s1) # 80000708 <_impure_ptr>
    b4e4:	08a7ee63          	bltu	a5,a0,b580 <raise+0xb4>
    b4e8:	1184a783          	lw	a5,280(s1)
    b4ec:	00812423          	sw	s0,8(sp)
    b4f0:	00050413          	mv	s0,a0
    b4f4:	04078263          	beqz	a5,b538 <raise+0x6c>
    b4f8:	00251713          	sll	a4,a0,0x2
    b4fc:	00e787b3          	add	a5,a5,a4
    b500:	0007a703          	lw	a4,0(a5)
    b504:	02070a63          	beqz	a4,b538 <raise+0x6c>
    b508:	00100693          	li	a3,1
    b50c:	00d70a63          	beq	a4,a3,b520 <raise+0x54>
    b510:	fff00693          	li	a3,-1
    b514:	04d70663          	beq	a4,a3,b560 <raise+0x94>
    b518:	0007a023          	sw	zero,0(a5)
    b51c:	000700e7          	jalr	a4
    b520:	00812403          	lw	s0,8(sp)
    b524:	00000513          	li	a0,0
    b528:	00c12083          	lw	ra,12(sp)
    b52c:	00412483          	lw	s1,4(sp)
    b530:	01010113          	add	sp,sp,16
    b534:	00008067          	ret
    b538:	00048513          	mv	a0,s1
    b53c:	0b4000ef          	jal	b5f0 <_getpid_r>
    b540:	00040613          	mv	a2,s0
    b544:	00812403          	lw	s0,8(sp)
    b548:	00c12083          	lw	ra,12(sp)
    b54c:	00050593          	mv	a1,a0
    b550:	00048513          	mv	a0,s1
    b554:	00412483          	lw	s1,4(sp)
    b558:	01010113          	add	sp,sp,16
    b55c:	0340006f          	j	b590 <_kill_r>
    b560:	00812403          	lw	s0,8(sp)
    b564:	00c12083          	lw	ra,12(sp)
    b568:	01600793          	li	a5,22
    b56c:	00f4a023          	sw	a5,0(s1)
    b570:	00100513          	li	a0,1
    b574:	00412483          	lw	s1,4(sp)
    b578:	01010113          	add	sp,sp,16
    b57c:	00008067          	ret
    b580:	01600793          	li	a5,22
    b584:	00f4a023          	sw	a5,0(s1)
    b588:	fff00513          	li	a0,-1
    b58c:	f9dff06f          	j	b528 <raise+0x5c>

0000b590 <_kill_r>:
    b590:	ff010113          	add	sp,sp,-16
    b594:	00058713          	mv	a4,a1
    b598:	00812423          	sw	s0,8(sp)
    b59c:	00060593          	mv	a1,a2
    b5a0:	00050413          	mv	s0,a0
    b5a4:	00070513          	mv	a0,a4
    b5a8:	7fff5797          	auipc	a5,0x7fff5
    b5ac:	1607aa23          	sw	zero,372(a5) # 8000071c <errno>
    b5b0:	00112623          	sw	ra,12(sp)
    b5b4:	e60f50ef          	jal	c14 <_kill>
    b5b8:	fff00793          	li	a5,-1
    b5bc:	00f50a63          	beq	a0,a5,b5d0 <_kill_r+0x40>
    b5c0:	00c12083          	lw	ra,12(sp)
    b5c4:	00812403          	lw	s0,8(sp)
    b5c8:	01010113          	add	sp,sp,16
    b5cc:	00008067          	ret
    b5d0:	7fff5797          	auipc	a5,0x7fff5
    b5d4:	14c7a783          	lw	a5,332(a5) # 8000071c <errno>
    b5d8:	fe0784e3          	beqz	a5,b5c0 <_kill_r+0x30>
    b5dc:	00c12083          	lw	ra,12(sp)
    b5e0:	00f42023          	sw	a5,0(s0)
    b5e4:	00812403          	lw	s0,8(sp)
    b5e8:	01010113          	add	sp,sp,16
    b5ec:	00008067          	ret

0000b5f0 <_getpid_r>:
    b5f0:	e14f506f          	j	c04 <_getpid>

0000b5f4 <__udivdi3>:
    b5f4:	fd010113          	add	sp,sp,-48
    b5f8:	01312e23          	sw	s3,28(sp)
    b5fc:	02112623          	sw	ra,44(sp)
    b600:	01612823          	sw	s6,16(sp)
    b604:	00050993          	mv	s3,a0
    b608:	16069663          	bnez	a3,b774 <__udivdi3+0x180>
    b60c:	02812423          	sw	s0,40(sp)
    b610:	01512a23          	sw	s5,20(sp)
    b614:	02912223          	sw	s1,36(sp)
    b618:	03212023          	sw	s2,32(sp)
    b61c:	01412c23          	sw	s4,24(sp)
    b620:	00060a93          	mv	s5,a2
    b624:	00050413          	mv	s0,a0
    b628:	1cc5f063          	bgeu	a1,a2,b7e8 <__udivdi3+0x1f4>
    b62c:	000107b7          	lui	a5,0x10
    b630:	00058493          	mv	s1,a1
    b634:	2af66e63          	bltu	a2,a5,b8f0 <__udivdi3+0x2fc>
    b638:	010007b7          	lui	a5,0x1000
    b63c:	01800713          	li	a4,24
    b640:	00f67463          	bgeu	a2,a5,b648 <__udivdi3+0x54>
    b644:	01000713          	li	a4,16
    b648:	00e656b3          	srl	a3,a2,a4
    b64c:	00004797          	auipc	a5,0x4
    b650:	31478793          	add	a5,a5,788 # f960 <__clz_tab>
    b654:	00d787b3          	add	a5,a5,a3
    b658:	0007c783          	lbu	a5,0(a5)
    b65c:	02000693          	li	a3,32
    b660:	00e787b3          	add	a5,a5,a4
    b664:	40f68733          	sub	a4,a3,a5
    b668:	00f68c63          	beq	a3,a5,b680 <__udivdi3+0x8c>
    b66c:	00e594b3          	sll	s1,a1,a4
    b670:	00f9d7b3          	srl	a5,s3,a5
    b674:	00e61ab3          	sll	s5,a2,a4
    b678:	0097e4b3          	or	s1,a5,s1
    b67c:	00e99433          	sll	s0,s3,a4
    b680:	010ada13          	srl	s4,s5,0x10
    b684:	000a0593          	mv	a1,s4
    b688:	00048513          	mv	a0,s1
    b68c:	010a9b13          	sll	s6,s5,0x10
    b690:	7fc030ef          	jal	ee8c <__hidden___udivsi3>
    b694:	010b5b13          	srl	s6,s6,0x10
    b698:	00050593          	mv	a1,a0
    b69c:	00050913          	mv	s2,a0
    b6a0:	000b0513          	mv	a0,s6
    b6a4:	724030ef          	jal	edc8 <__mulsi3>
    b6a8:	00050793          	mv	a5,a0
    b6ac:	000a0593          	mv	a1,s4
    b6b0:	00048513          	mv	a0,s1
    b6b4:	00078493          	mv	s1,a5
    b6b8:	01d030ef          	jal	eed4 <__umodsi3>
    b6bc:	01051513          	sll	a0,a0,0x10
    b6c0:	01045793          	srl	a5,s0,0x10
    b6c4:	00a7e7b3          	or	a5,a5,a0
    b6c8:	0097fc63          	bgeu	a5,s1,b6e0 <__udivdi3+0xec>
    b6cc:	00fa87b3          	add	a5,s5,a5
    b6d0:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x3f>
    b6d4:	0157e463          	bltu	a5,s5,b6dc <__udivdi3+0xe8>
    b6d8:	5a97e863          	bltu	a5,s1,bc88 <__udivdi3+0x694>
    b6dc:	00070913          	mv	s2,a4
    b6e0:	409784b3          	sub	s1,a5,s1
    b6e4:	000a0593          	mv	a1,s4
    b6e8:	00048513          	mv	a0,s1
    b6ec:	7a0030ef          	jal	ee8c <__hidden___udivsi3>
    b6f0:	00050593          	mv	a1,a0
    b6f4:	00050993          	mv	s3,a0
    b6f8:	000b0513          	mv	a0,s6
    b6fc:	6cc030ef          	jal	edc8 <__mulsi3>
    b700:	00050793          	mv	a5,a0
    b704:	000a0593          	mv	a1,s4
    b708:	00048513          	mv	a0,s1
    b70c:	01041413          	sll	s0,s0,0x10
    b710:	00078493          	mv	s1,a5
    b714:	7c0030ef          	jal	eed4 <__umodsi3>
    b718:	01051513          	sll	a0,a0,0x10
    b71c:	01045413          	srl	s0,s0,0x10
    b720:	00a46433          	or	s0,s0,a0
    b724:	00947c63          	bgeu	s0,s1,b73c <__udivdi3+0x148>
    b728:	008a8433          	add	s0,s5,s0
    b72c:	fff98793          	add	a5,s3,-1
    b730:	4d546e63          	bltu	s0,s5,bc0c <__udivdi3+0x618>
    b734:	ffe98993          	add	s3,s3,-2
    b738:	4c947a63          	bgeu	s0,s1,bc0c <__udivdi3+0x618>
    b73c:	01091613          	sll	a2,s2,0x10
    b740:	01366533          	or	a0,a2,s3
    b744:	00000b13          	li	s6,0
    b748:	02812403          	lw	s0,40(sp)
    b74c:	02c12083          	lw	ra,44(sp)
    b750:	02412483          	lw	s1,36(sp)
    b754:	02012903          	lw	s2,32(sp)
    b758:	01812a03          	lw	s4,24(sp)
    b75c:	01412a83          	lw	s5,20(sp)
    b760:	01c12983          	lw	s3,28(sp)
    b764:	000b0593          	mv	a1,s6
    b768:	01012b03          	lw	s6,16(sp)
    b76c:	03010113          	add	sp,sp,48
    b770:	00008067          	ret
    b774:	02d5f263          	bgeu	a1,a3,b798 <__udivdi3+0x1a4>
    b778:	00000b13          	li	s6,0
    b77c:	00000513          	li	a0,0
    b780:	02c12083          	lw	ra,44(sp)
    b784:	01c12983          	lw	s3,28(sp)
    b788:	000b0593          	mv	a1,s6
    b78c:	01012b03          	lw	s6,16(sp)
    b790:	03010113          	add	sp,sp,48
    b794:	00008067          	ret
    b798:	000107b7          	lui	a5,0x10
    b79c:	26f6ee63          	bltu	a3,a5,ba18 <__udivdi3+0x424>
    b7a0:	01000737          	lui	a4,0x1000
    b7a4:	01800793          	li	a5,24
    b7a8:	00e6f463          	bgeu	a3,a4,b7b0 <__udivdi3+0x1bc>
    b7ac:	01000793          	li	a5,16
    b7b0:	00f6d533          	srl	a0,a3,a5
    b7b4:	00004717          	auipc	a4,0x4
    b7b8:	1ac70713          	add	a4,a4,428 # f960 <__clz_tab>
    b7bc:	00a70733          	add	a4,a4,a0
    b7c0:	00074703          	lbu	a4,0(a4)
    b7c4:	02000513          	li	a0,32
    b7c8:	00f70733          	add	a4,a4,a5
    b7cc:	40e50b33          	sub	s6,a0,a4
    b7d0:	26e51c63          	bne	a0,a4,ba48 <__udivdi3+0x454>
    b7d4:	46b6ee63          	bltu	a3,a1,bc50 <__udivdi3+0x65c>
    b7d8:	00c9b533          	sltu	a0,s3,a2
    b7dc:	00153513          	seqz	a0,a0
    b7e0:	00000b13          	li	s6,0
    b7e4:	f9dff06f          	j	b780 <__udivdi3+0x18c>
    b7e8:	10060c63          	beqz	a2,b900 <__udivdi3+0x30c>
    b7ec:	000107b7          	lui	a5,0x10
    b7f0:	44f67663          	bgeu	a2,a5,bc3c <__udivdi3+0x648>
    b7f4:	10063713          	sltiu	a4,a2,256
    b7f8:	00173713          	seqz	a4,a4
    b7fc:	00371713          	sll	a4,a4,0x3
    b800:	00e656b3          	srl	a3,a2,a4
    b804:	00004797          	auipc	a5,0x4
    b808:	15c78793          	add	a5,a5,348 # f960 <__clz_tab>
    b80c:	00d787b3          	add	a5,a5,a3
    b810:	0007c483          	lbu	s1,0(a5)
    b814:	02000793          	li	a5,32
    b818:	00e484b3          	add	s1,s1,a4
    b81c:	40978733          	sub	a4,a5,s1
    b820:	10979463          	bne	a5,s1,b928 <__udivdi3+0x334>
    b824:	01061a13          	sll	s4,a2,0x10
    b828:	40c584b3          	sub	s1,a1,a2
    b82c:	01065913          	srl	s2,a2,0x10
    b830:	010a5a13          	srl	s4,s4,0x10
    b834:	00100b13          	li	s6,1
    b838:	00090593          	mv	a1,s2
    b83c:	00048513          	mv	a0,s1
    b840:	64c030ef          	jal	ee8c <__hidden___udivsi3>
    b844:	000a0593          	mv	a1,s4
    b848:	00050993          	mv	s3,a0
    b84c:	57c030ef          	jal	edc8 <__mulsi3>
    b850:	00050793          	mv	a5,a0
    b854:	00090593          	mv	a1,s2
    b858:	00048513          	mv	a0,s1
    b85c:	00078493          	mv	s1,a5
    b860:	674030ef          	jal	eed4 <__umodsi3>
    b864:	01051513          	sll	a0,a0,0x10
    b868:	01045793          	srl	a5,s0,0x10
    b86c:	00a7e7b3          	or	a5,a5,a0
    b870:	0097fc63          	bgeu	a5,s1,b888 <__udivdi3+0x294>
    b874:	00fa87b3          	add	a5,s5,a5
    b878:	fff98713          	add	a4,s3,-1
    b87c:	0157e463          	bltu	a5,s5,b884 <__udivdi3+0x290>
    b880:	3e97ee63          	bltu	a5,s1,bc7c <__udivdi3+0x688>
    b884:	00070993          	mv	s3,a4
    b888:	409784b3          	sub	s1,a5,s1
    b88c:	00090593          	mv	a1,s2
    b890:	00048513          	mv	a0,s1
    b894:	5f8030ef          	jal	ee8c <__hidden___udivsi3>
    b898:	000a0593          	mv	a1,s4
    b89c:	00050a13          	mv	s4,a0
    b8a0:	528030ef          	jal	edc8 <__mulsi3>
    b8a4:	00050793          	mv	a5,a0
    b8a8:	00090593          	mv	a1,s2
    b8ac:	00048513          	mv	a0,s1
    b8b0:	01041413          	sll	s0,s0,0x10
    b8b4:	00078493          	mv	s1,a5
    b8b8:	61c030ef          	jal	eed4 <__umodsi3>
    b8bc:	01051513          	sll	a0,a0,0x10
    b8c0:	01045413          	srl	s0,s0,0x10
    b8c4:	00a46433          	or	s0,s0,a0
    b8c8:	00947e63          	bgeu	s0,s1,b8e4 <__udivdi3+0x2f0>
    b8cc:	008a8433          	add	s0,s5,s0
    b8d0:	fffa0793          	add	a5,s4,-1
    b8d4:	01546663          	bltu	s0,s5,b8e0 <__udivdi3+0x2ec>
    b8d8:	ffea0a13          	add	s4,s4,-2
    b8dc:	00946463          	bltu	s0,s1,b8e4 <__udivdi3+0x2f0>
    b8e0:	00078a13          	mv	s4,a5
    b8e4:	01099613          	sll	a2,s3,0x10
    b8e8:	01466533          	or	a0,a2,s4
    b8ec:	e5dff06f          	j	b748 <__udivdi3+0x154>
    b8f0:	10063713          	sltiu	a4,a2,256
    b8f4:	00173713          	seqz	a4,a4
    b8f8:	00371713          	sll	a4,a4,0x3
    b8fc:	d4dff06f          	j	b648 <__udivdi3+0x54>
    b900:	00000693          	li	a3,0
    b904:	00004797          	auipc	a5,0x4
    b908:	05c78793          	add	a5,a5,92 # f960 <__clz_tab>
    b90c:	00d787b3          	add	a5,a5,a3
    b910:	0007c483          	lbu	s1,0(a5)
    b914:	00000713          	li	a4,0
    b918:	02000793          	li	a5,32
    b91c:	00e484b3          	add	s1,s1,a4
    b920:	40978733          	sub	a4,a5,s1
    b924:	f09780e3          	beq	a5,s1,b824 <__udivdi3+0x230>
    b928:	00e61ab3          	sll	s5,a2,a4
    b92c:	01712623          	sw	s7,12(sp)
    b930:	010ad913          	srl	s2,s5,0x10
    b934:	0095dbb3          	srl	s7,a1,s1
    b938:	00e597b3          	sll	a5,a1,a4
    b93c:	0099d4b3          	srl	s1,s3,s1
    b940:	00090593          	mv	a1,s2
    b944:	000b8513          	mv	a0,s7
    b948:	010a9a13          	sll	s4,s5,0x10
    b94c:	00f4e4b3          	or	s1,s1,a5
    b950:	00e99433          	sll	s0,s3,a4
    b954:	010a5a13          	srl	s4,s4,0x10
    b958:	534030ef          	jal	ee8c <__hidden___udivsi3>
    b95c:	00050593          	mv	a1,a0
    b960:	00050b13          	mv	s6,a0
    b964:	000a0513          	mv	a0,s4
    b968:	460030ef          	jal	edc8 <__mulsi3>
    b96c:	00050993          	mv	s3,a0
    b970:	00090593          	mv	a1,s2
    b974:	000b8513          	mv	a0,s7
    b978:	55c030ef          	jal	eed4 <__umodsi3>
    b97c:	01051513          	sll	a0,a0,0x10
    b980:	0104d793          	srl	a5,s1,0x10
    b984:	00a7e7b3          	or	a5,a5,a0
    b988:	0137fe63          	bgeu	a5,s3,b9a4 <__udivdi3+0x3b0>
    b98c:	00fa87b3          	add	a5,s5,a5
    b990:	fffb0713          	add	a4,s6,-1
    b994:	2d57ec63          	bltu	a5,s5,bc6c <__udivdi3+0x678>
    b998:	2d37fa63          	bgeu	a5,s3,bc6c <__udivdi3+0x678>
    b99c:	ffeb0b13          	add	s6,s6,-2
    b9a0:	015787b3          	add	a5,a5,s5
    b9a4:	413789b3          	sub	s3,a5,s3
    b9a8:	00090593          	mv	a1,s2
    b9ac:	00098513          	mv	a0,s3
    b9b0:	4dc030ef          	jal	ee8c <__hidden___udivsi3>
    b9b4:	00050593          	mv	a1,a0
    b9b8:	00050b93          	mv	s7,a0
    b9bc:	000a0513          	mv	a0,s4
    b9c0:	408030ef          	jal	edc8 <__mulsi3>
    b9c4:	00050793          	mv	a5,a0
    b9c8:	00090593          	mv	a1,s2
    b9cc:	00098513          	mv	a0,s3
    b9d0:	01049493          	sll	s1,s1,0x10
    b9d4:	00078993          	mv	s3,a5
    b9d8:	4fc030ef          	jal	eed4 <__umodsi3>
    b9dc:	01051513          	sll	a0,a0,0x10
    b9e0:	0104d493          	srl	s1,s1,0x10
    b9e4:	00a4e4b3          	or	s1,s1,a0
    b9e8:	0134fe63          	bgeu	s1,s3,ba04 <__udivdi3+0x410>
    b9ec:	009a84b3          	add	s1,s5,s1
    b9f0:	fffb8793          	add	a5,s7,-1
    b9f4:	2754e463          	bltu	s1,s5,bc5c <__udivdi3+0x668>
    b9f8:	2734f263          	bgeu	s1,s3,bc5c <__udivdi3+0x668>
    b9fc:	ffeb8b93          	add	s7,s7,-2
    ba00:	015484b3          	add	s1,s1,s5
    ba04:	010b1b13          	sll	s6,s6,0x10
    ba08:	017b6b33          	or	s6,s6,s7
    ba0c:	413484b3          	sub	s1,s1,s3
    ba10:	00c12b83          	lw	s7,12(sp)
    ba14:	e25ff06f          	j	b838 <__udivdi3+0x244>
    ba18:	1006b793          	sltiu	a5,a3,256
    ba1c:	0017b793          	seqz	a5,a5
    ba20:	00379793          	sll	a5,a5,0x3
    ba24:	00f6d533          	srl	a0,a3,a5
    ba28:	00004717          	auipc	a4,0x4
    ba2c:	f3870713          	add	a4,a4,-200 # f960 <__clz_tab>
    ba30:	00a70733          	add	a4,a4,a0
    ba34:	00074703          	lbu	a4,0(a4)
    ba38:	02000513          	li	a0,32
    ba3c:	00f70733          	add	a4,a4,a5
    ba40:	40e50b33          	sub	s6,a0,a4
    ba44:	d8e508e3          	beq	a0,a4,b7d4 <__udivdi3+0x1e0>
    ba48:	016696b3          	sll	a3,a3,s6
    ba4c:	01912223          	sw	s9,4(sp)
    ba50:	00e65cb3          	srl	s9,a2,a4
    ba54:	00dcecb3          	or	s9,s9,a3
    ba58:	01512a23          	sw	s5,20(sp)
    ba5c:	01712623          	sw	s7,12(sp)
    ba60:	010cda93          	srl	s5,s9,0x10
    ba64:	00e5dbb3          	srl	s7,a1,a4
    ba68:	016597b3          	sll	a5,a1,s6
    ba6c:	00e9d733          	srl	a4,s3,a4
    ba70:	01812423          	sw	s8,8(sp)
    ba74:	000a8593          	mv	a1,s5
    ba78:	000b8513          	mv	a0,s7
    ba7c:	010c9c13          	sll	s8,s9,0x10
    ba80:	02812423          	sw	s0,40(sp)
    ba84:	02912223          	sw	s1,36(sp)
    ba88:	03212023          	sw	s2,32(sp)
    ba8c:	00f764b3          	or	s1,a4,a5
    ba90:	01661933          	sll	s2,a2,s6
    ba94:	01412c23          	sw	s4,24(sp)
    ba98:	010c5c13          	srl	s8,s8,0x10
    ba9c:	3f0030ef          	jal	ee8c <__hidden___udivsi3>
    baa0:	00050593          	mv	a1,a0
    baa4:	00050413          	mv	s0,a0
    baa8:	000c0513          	mv	a0,s8
    baac:	31c030ef          	jal	edc8 <__mulsi3>
    bab0:	00050a13          	mv	s4,a0
    bab4:	000a8593          	mv	a1,s5
    bab8:	000b8513          	mv	a0,s7
    babc:	418030ef          	jal	eed4 <__umodsi3>
    bac0:	01051513          	sll	a0,a0,0x10
    bac4:	0104d793          	srl	a5,s1,0x10
    bac8:	00a7e7b3          	or	a5,a5,a0
    bacc:	0147fe63          	bgeu	a5,s4,bae8 <__udivdi3+0x4f4>
    bad0:	00fc87b3          	add	a5,s9,a5
    bad4:	fff40713          	add	a4,s0,-1
    bad8:	1997ee63          	bltu	a5,s9,bc74 <__udivdi3+0x680>
    badc:	1947fc63          	bgeu	a5,s4,bc74 <__udivdi3+0x680>
    bae0:	ffe40413          	add	s0,s0,-2
    bae4:	019787b3          	add	a5,a5,s9
    bae8:	41478a33          	sub	s4,a5,s4
    baec:	000a8593          	mv	a1,s5
    baf0:	000a0513          	mv	a0,s4
    baf4:	398030ef          	jal	ee8c <__hidden___udivsi3>
    baf8:	00050593          	mv	a1,a0
    bafc:	00050b93          	mv	s7,a0
    bb00:	000c0513          	mv	a0,s8
    bb04:	2c4030ef          	jal	edc8 <__mulsi3>
    bb08:	00050793          	mv	a5,a0
    bb0c:	000a8593          	mv	a1,s5
    bb10:	000a0513          	mv	a0,s4
    bb14:	00078a13          	mv	s4,a5
    bb18:	3bc030ef          	jal	eed4 <__umodsi3>
    bb1c:	01049713          	sll	a4,s1,0x10
    bb20:	01051513          	sll	a0,a0,0x10
    bb24:	01075713          	srl	a4,a4,0x10
    bb28:	00a76733          	or	a4,a4,a0
    bb2c:	01477e63          	bgeu	a4,s4,bb48 <__udivdi3+0x554>
    bb30:	00ec8733          	add	a4,s9,a4
    bb34:	fffb8793          	add	a5,s7,-1
    bb38:	13976663          	bltu	a4,s9,bc64 <__udivdi3+0x670>
    bb3c:	13477463          	bgeu	a4,s4,bc64 <__udivdi3+0x670>
    bb40:	ffeb8b93          	add	s7,s7,-2
    bb44:	01970733          	add	a4,a4,s9
    bb48:	00010e37          	lui	t3,0x10
    bb4c:	01041413          	sll	s0,s0,0x10
    bb50:	01746433          	or	s0,s0,s7
    bb54:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    bb58:	00f47833          	and	a6,s0,a5
    bb5c:	00f977b3          	and	a5,s2,a5
    bb60:	41470733          	sub	a4,a4,s4
    bb64:	01045e93          	srl	t4,s0,0x10
    bb68:	01095913          	srl	s2,s2,0x10
    bb6c:	00080513          	mv	a0,a6
    bb70:	00078593          	mv	a1,a5
    bb74:	254030ef          	jal	edc8 <__mulsi3>
    bb78:	00050313          	mv	t1,a0
    bb7c:	00090593          	mv	a1,s2
    bb80:	00080513          	mv	a0,a6
    bb84:	244030ef          	jal	edc8 <__mulsi3>
    bb88:	00050813          	mv	a6,a0
    bb8c:	00078593          	mv	a1,a5
    bb90:	000e8513          	mv	a0,t4
    bb94:	234030ef          	jal	edc8 <__mulsi3>
    bb98:	00050893          	mv	a7,a0
    bb9c:	00090593          	mv	a1,s2
    bba0:	000e8513          	mv	a0,t4
    bba4:	224030ef          	jal	edc8 <__mulsi3>
    bba8:	01035793          	srl	a5,t1,0x10
    bbac:	01180833          	add	a6,a6,a7
    bbb0:	010787b3          	add	a5,a5,a6
    bbb4:	0117f463          	bgeu	a5,a7,bbbc <__udivdi3+0x5c8>
    bbb8:	01c50533          	add	a0,a0,t3
    bbbc:	0107d693          	srl	a3,a5,0x10
    bbc0:	00a686b3          	add	a3,a3,a0
    bbc4:	06d76863          	bltu	a4,a3,bc34 <__udivdi3+0x640>
    bbc8:	04d70663          	beq	a4,a3,bc14 <__udivdi3+0x620>
    bbcc:	00040513          	mv	a0,s0
    bbd0:	02812403          	lw	s0,40(sp)
    bbd4:	02c12083          	lw	ra,44(sp)
    bbd8:	00000b13          	li	s6,0
    bbdc:	02412483          	lw	s1,36(sp)
    bbe0:	02012903          	lw	s2,32(sp)
    bbe4:	01812a03          	lw	s4,24(sp)
    bbe8:	01412a83          	lw	s5,20(sp)
    bbec:	00c12b83          	lw	s7,12(sp)
    bbf0:	00812c03          	lw	s8,8(sp)
    bbf4:	00412c83          	lw	s9,4(sp)
    bbf8:	01c12983          	lw	s3,28(sp)
    bbfc:	000b0593          	mv	a1,s6
    bc00:	01012b03          	lw	s6,16(sp)
    bc04:	03010113          	add	sp,sp,48
    bc08:	00008067          	ret
    bc0c:	00078993          	mv	s3,a5
    bc10:	b2dff06f          	j	b73c <__udivdi3+0x148>
    bc14:	00010737          	lui	a4,0x10
    bc18:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    bc1c:	00e7f7b3          	and	a5,a5,a4
    bc20:	01079793          	sll	a5,a5,0x10
    bc24:	00e37333          	and	t1,t1,a4
    bc28:	01699533          	sll	a0,s3,s6
    bc2c:	006787b3          	add	a5,a5,t1
    bc30:	f8f57ee3          	bgeu	a0,a5,bbcc <__udivdi3+0x5d8>
    bc34:	fff40513          	add	a0,s0,-1
    bc38:	f99ff06f          	j	bbd0 <__udivdi3+0x5dc>
    bc3c:	010007b7          	lui	a5,0x1000
    bc40:	04f67a63          	bgeu	a2,a5,bc94 <__udivdi3+0x6a0>
    bc44:	01065693          	srl	a3,a2,0x10
    bc48:	01000713          	li	a4,16
    bc4c:	bb9ff06f          	j	b804 <__udivdi3+0x210>
    bc50:	00000b13          	li	s6,0
    bc54:	00100513          	li	a0,1
    bc58:	b29ff06f          	j	b780 <__udivdi3+0x18c>
    bc5c:	00078b93          	mv	s7,a5
    bc60:	da5ff06f          	j	ba04 <__udivdi3+0x410>
    bc64:	00078b93          	mv	s7,a5
    bc68:	ee1ff06f          	j	bb48 <__udivdi3+0x554>
    bc6c:	00070b13          	mv	s6,a4
    bc70:	d35ff06f          	j	b9a4 <__udivdi3+0x3b0>
    bc74:	00070413          	mv	s0,a4
    bc78:	e71ff06f          	j	bae8 <__udivdi3+0x4f4>
    bc7c:	ffe98993          	add	s3,s3,-2
    bc80:	015787b3          	add	a5,a5,s5
    bc84:	c05ff06f          	j	b888 <__udivdi3+0x294>
    bc88:	ffe90913          	add	s2,s2,-2
    bc8c:	015787b3          	add	a5,a5,s5
    bc90:	a51ff06f          	j	b6e0 <__udivdi3+0xec>
    bc94:	01865693          	srl	a3,a2,0x18
    bc98:	01800713          	li	a4,24
    bc9c:	b69ff06f          	j	b804 <__udivdi3+0x210>

0000bca0 <__umoddi3>:
    bca0:	fd010113          	add	sp,sp,-48
    bca4:	02112623          	sw	ra,44(sp)
    bca8:	00050793          	mv	a5,a0
    bcac:	14069663          	bnez	a3,bdf8 <__umoddi3+0x158>
    bcb0:	03212023          	sw	s2,32(sp)
    bcb4:	01412c23          	sw	s4,24(sp)
    bcb8:	02812423          	sw	s0,40(sp)
    bcbc:	02912223          	sw	s1,36(sp)
    bcc0:	01312e23          	sw	s3,28(sp)
    bcc4:	01512a23          	sw	s5,20(sp)
    bcc8:	00060a13          	mv	s4,a2
    bccc:	00050913          	mv	s2,a0
    bcd0:	1ac5f663          	bgeu	a1,a2,be7c <__umoddi3+0x1dc>
    bcd4:	01612823          	sw	s6,16(sp)
    bcd8:	00010737          	lui	a4,0x10
    bcdc:	00058993          	mv	s3,a1
    bce0:	28e66063          	bltu	a2,a4,bf60 <__umoddi3+0x2c0>
    bce4:	01000737          	lui	a4,0x1000
    bce8:	01800693          	li	a3,24
    bcec:	00e67463          	bgeu	a2,a4,bcf4 <__umoddi3+0x54>
    bcf0:	01000693          	li	a3,16
    bcf4:	00d65533          	srl	a0,a2,a3
    bcf8:	00004717          	auipc	a4,0x4
    bcfc:	c6870713          	add	a4,a4,-920 # f960 <__clz_tab>
    bd00:	00a70733          	add	a4,a4,a0
    bd04:	00074703          	lbu	a4,0(a4)
    bd08:	02000513          	li	a0,32
    bd0c:	00d70733          	add	a4,a4,a3
    bd10:	40e504b3          	sub	s1,a0,a4
    bd14:	00e50c63          	beq	a0,a4,bd2c <__umoddi3+0x8c>
    bd18:	009599b3          	sll	s3,a1,s1
    bd1c:	00e7d733          	srl	a4,a5,a4
    bd20:	00961a33          	sll	s4,a2,s1
    bd24:	013769b3          	or	s3,a4,s3
    bd28:	00979933          	sll	s2,a5,s1
    bd2c:	010a5a93          	srl	s5,s4,0x10
    bd30:	000a8593          	mv	a1,s5
    bd34:	00098513          	mv	a0,s3
    bd38:	010a1b13          	sll	s6,s4,0x10
    bd3c:	150030ef          	jal	ee8c <__hidden___udivsi3>
    bd40:	010b5b13          	srl	s6,s6,0x10
    bd44:	000b0593          	mv	a1,s6
    bd48:	080030ef          	jal	edc8 <__mulsi3>
    bd4c:	00050413          	mv	s0,a0
    bd50:	000a8593          	mv	a1,s5
    bd54:	00098513          	mv	a0,s3
    bd58:	17c030ef          	jal	eed4 <__umodsi3>
    bd5c:	01051513          	sll	a0,a0,0x10
    bd60:	01095793          	srl	a5,s2,0x10
    bd64:	00a7e7b3          	or	a5,a5,a0
    bd68:	0087f863          	bgeu	a5,s0,bd78 <__umoddi3+0xd8>
    bd6c:	00fa07b3          	add	a5,s4,a5
    bd70:	0147e463          	bltu	a5,s4,bd78 <__umoddi3+0xd8>
    bd74:	5687e863          	bltu	a5,s0,c2e4 <__umoddi3+0x644>
    bd78:	40878433          	sub	s0,a5,s0
    bd7c:	000a8593          	mv	a1,s5
    bd80:	00040513          	mv	a0,s0
    bd84:	108030ef          	jal	ee8c <__hidden___udivsi3>
    bd88:	000b0593          	mv	a1,s6
    bd8c:	03c030ef          	jal	edc8 <__mulsi3>
    bd90:	00050793          	mv	a5,a0
    bd94:	000a8593          	mv	a1,s5
    bd98:	00040513          	mv	a0,s0
    bd9c:	00078413          	mv	s0,a5
    bda0:	134030ef          	jal	eed4 <__umodsi3>
    bda4:	01091793          	sll	a5,s2,0x10
    bda8:	01051513          	sll	a0,a0,0x10
    bdac:	0107d793          	srl	a5,a5,0x10
    bdb0:	00a7e7b3          	or	a5,a5,a0
    bdb4:	0087f863          	bgeu	a5,s0,bdc4 <__umoddi3+0x124>
    bdb8:	00fa07b3          	add	a5,s4,a5
    bdbc:	0147e463          	bltu	a5,s4,bdc4 <__umoddi3+0x124>
    bdc0:	5087ea63          	bltu	a5,s0,c2d4 <__umoddi3+0x634>
    bdc4:	01012b03          	lw	s6,16(sp)
    bdc8:	408787b3          	sub	a5,a5,s0
    bdcc:	0097d533          	srl	a0,a5,s1
    bdd0:	02812403          	lw	s0,40(sp)
    bdd4:	02412483          	lw	s1,36(sp)
    bdd8:	02012903          	lw	s2,32(sp)
    bddc:	01c12983          	lw	s3,28(sp)
    bde0:	01812a03          	lw	s4,24(sp)
    bde4:	01412a83          	lw	s5,20(sp)
    bde8:	00000593          	li	a1,0
    bdec:	02c12083          	lw	ra,44(sp)
    bdf0:	03010113          	add	sp,sp,48
    bdf4:	00008067          	ret
    bdf8:	00050893          	mv	a7,a0
    bdfc:	fed5e8e3          	bltu	a1,a3,bdec <__umoddi3+0x14c>
    be00:	03212023          	sw	s2,32(sp)
    be04:	01312e23          	sw	s3,28(sp)
    be08:	00010737          	lui	a4,0x10
    be0c:	00058813          	mv	a6,a1
    be10:	24e6ec63          	bltu	a3,a4,c068 <__umoddi3+0x3c8>
    be14:	01000737          	lui	a4,0x1000
    be18:	01800513          	li	a0,24
    be1c:	00e6f463          	bgeu	a3,a4,be24 <__umoddi3+0x184>
    be20:	01000513          	li	a0,16
    be24:	00a6d333          	srl	t1,a3,a0
    be28:	00004717          	auipc	a4,0x4
    be2c:	b3870713          	add	a4,a4,-1224 # f960 <__clz_tab>
    be30:	00670733          	add	a4,a4,t1
    be34:	00074703          	lbu	a4,0(a4)
    be38:	02000313          	li	t1,32
    be3c:	00a709b3          	add	s3,a4,a0
    be40:	41330933          	sub	s2,t1,s3
    be44:	25331a63          	bne	t1,s3,c098 <__umoddi3+0x3f8>
    be48:	00b6e463          	bltu	a3,a1,be50 <__umoddi3+0x1b0>
    be4c:	00c7ea63          	bltu	a5,a2,be60 <__umoddi3+0x1c0>
    be50:	40c788b3          	sub	a7,a5,a2
    be54:	40d586b3          	sub	a3,a1,a3
    be58:	0117b833          	sltu	a6,a5,a7
    be5c:	41068833          	sub	a6,a3,a6
    be60:	02c12083          	lw	ra,44(sp)
    be64:	02012903          	lw	s2,32(sp)
    be68:	01c12983          	lw	s3,28(sp)
    be6c:	00088513          	mv	a0,a7
    be70:	00080593          	mv	a1,a6
    be74:	03010113          	add	sp,sp,48
    be78:	00008067          	ret
    be7c:	0e060a63          	beqz	a2,bf70 <__umoddi3+0x2d0>
    be80:	00010737          	lui	a4,0x10
    be84:	42e67663          	bgeu	a2,a4,c2b0 <__umoddi3+0x610>
    be88:	10063693          	sltiu	a3,a2,256
    be8c:	0016b693          	seqz	a3,a3
    be90:	00369693          	sll	a3,a3,0x3
    be94:	00d65533          	srl	a0,a2,a3
    be98:	00004717          	auipc	a4,0x4
    be9c:	ac870713          	add	a4,a4,-1336 # f960 <__clz_tab>
    bea0:	00a70733          	add	a4,a4,a0
    bea4:	00074983          	lbu	s3,0(a4)
    bea8:	02000713          	li	a4,32
    beac:	00d989b3          	add	s3,s3,a3
    beb0:	413704b3          	sub	s1,a4,s3
    beb4:	0f371263          	bne	a4,s3,bf98 <__umoddi3+0x2f8>
    beb8:	01061413          	sll	s0,a2,0x10
    bebc:	40c589b3          	sub	s3,a1,a2
    bec0:	01065a93          	srl	s5,a2,0x10
    bec4:	01045413          	srl	s0,s0,0x10
    bec8:	000a8593          	mv	a1,s5
    becc:	00098513          	mv	a0,s3
    bed0:	7bd020ef          	jal	ee8c <__hidden___udivsi3>
    bed4:	00040593          	mv	a1,s0
    bed8:	6f1020ef          	jal	edc8 <__mulsi3>
    bedc:	00050793          	mv	a5,a0
    bee0:	000a8593          	mv	a1,s5
    bee4:	00098513          	mv	a0,s3
    bee8:	00078993          	mv	s3,a5
    beec:	7e9020ef          	jal	eed4 <__umodsi3>
    bef0:	01051513          	sll	a0,a0,0x10
    bef4:	01095793          	srl	a5,s2,0x10
    bef8:	00a7e7b3          	or	a5,a5,a0
    befc:	0137f863          	bgeu	a5,s3,bf0c <__umoddi3+0x26c>
    bf00:	00fa07b3          	add	a5,s4,a5
    bf04:	0147e463          	bltu	a5,s4,bf0c <__umoddi3+0x26c>
    bf08:	3d37ea63          	bltu	a5,s3,c2dc <__umoddi3+0x63c>
    bf0c:	413789b3          	sub	s3,a5,s3
    bf10:	000a8593          	mv	a1,s5
    bf14:	00098513          	mv	a0,s3
    bf18:	775020ef          	jal	ee8c <__hidden___udivsi3>
    bf1c:	00040593          	mv	a1,s0
    bf20:	6a9020ef          	jal	edc8 <__mulsi3>
    bf24:	00050413          	mv	s0,a0
    bf28:	000a8593          	mv	a1,s5
    bf2c:	00098513          	mv	a0,s3
    bf30:	7a5020ef          	jal	eed4 <__umodsi3>
    bf34:	01091913          	sll	s2,s2,0x10
    bf38:	01051793          	sll	a5,a0,0x10
    bf3c:	01095913          	srl	s2,s2,0x10
    bf40:	00f967b3          	or	a5,s2,a5
    bf44:	0087fa63          	bgeu	a5,s0,bf58 <__umoddi3+0x2b8>
    bf48:	00fa07b3          	add	a5,s4,a5
    bf4c:	0147e663          	bltu	a5,s4,bf58 <__umoddi3+0x2b8>
    bf50:	0087f463          	bgeu	a5,s0,bf58 <__umoddi3+0x2b8>
    bf54:	014787b3          	add	a5,a5,s4
    bf58:	408787b3          	sub	a5,a5,s0
    bf5c:	e71ff06f          	j	bdcc <__umoddi3+0x12c>
    bf60:	10063693          	sltiu	a3,a2,256
    bf64:	0016b693          	seqz	a3,a3
    bf68:	00369693          	sll	a3,a3,0x3
    bf6c:	d89ff06f          	j	bcf4 <__umoddi3+0x54>
    bf70:	00000513          	li	a0,0
    bf74:	00004717          	auipc	a4,0x4
    bf78:	9ec70713          	add	a4,a4,-1556 # f960 <__clz_tab>
    bf7c:	00a70733          	add	a4,a4,a0
    bf80:	00074983          	lbu	s3,0(a4)
    bf84:	00000693          	li	a3,0
    bf88:	02000713          	li	a4,32
    bf8c:	00d989b3          	add	s3,s3,a3
    bf90:	413704b3          	sub	s1,a4,s3
    bf94:	f33702e3          	beq	a4,s3,beb8 <__umoddi3+0x218>
    bf98:	00961a33          	sll	s4,a2,s1
    bf9c:	01712623          	sw	s7,12(sp)
    bfa0:	010a5a93          	srl	s5,s4,0x10
    bfa4:	0135dbb3          	srl	s7,a1,s3
    bfa8:	00959733          	sll	a4,a1,s1
    bfac:	0137d9b3          	srl	s3,a5,s3
    bfb0:	000a8593          	mv	a1,s5
    bfb4:	000b8513          	mv	a0,s7
    bfb8:	010a1413          	sll	s0,s4,0x10
    bfbc:	00e9e9b3          	or	s3,s3,a4
    bfc0:	00979933          	sll	s2,a5,s1
    bfc4:	01612823          	sw	s6,16(sp)
    bfc8:	01045413          	srl	s0,s0,0x10
    bfcc:	6c1020ef          	jal	ee8c <__hidden___udivsi3>
    bfd0:	00040593          	mv	a1,s0
    bfd4:	5f5020ef          	jal	edc8 <__mulsi3>
    bfd8:	00050b13          	mv	s6,a0
    bfdc:	000a8593          	mv	a1,s5
    bfe0:	000b8513          	mv	a0,s7
    bfe4:	6f1020ef          	jal	eed4 <__umodsi3>
    bfe8:	01051513          	sll	a0,a0,0x10
    bfec:	0109d793          	srl	a5,s3,0x10
    bff0:	00a7e7b3          	or	a5,a5,a0
    bff4:	0167fa63          	bgeu	a5,s6,c008 <__umoddi3+0x368>
    bff8:	00fa07b3          	add	a5,s4,a5
    bffc:	0147e663          	bltu	a5,s4,c008 <__umoddi3+0x368>
    c000:	0167f463          	bgeu	a5,s6,c008 <__umoddi3+0x368>
    c004:	014787b3          	add	a5,a5,s4
    c008:	41678b33          	sub	s6,a5,s6
    c00c:	000a8593          	mv	a1,s5
    c010:	000b0513          	mv	a0,s6
    c014:	679020ef          	jal	ee8c <__hidden___udivsi3>
    c018:	00040593          	mv	a1,s0
    c01c:	5ad020ef          	jal	edc8 <__mulsi3>
    c020:	00050793          	mv	a5,a0
    c024:	000a8593          	mv	a1,s5
    c028:	000b0513          	mv	a0,s6
    c02c:	01099993          	sll	s3,s3,0x10
    c030:	00078b13          	mv	s6,a5
    c034:	6a1020ef          	jal	eed4 <__umodsi3>
    c038:	01051513          	sll	a0,a0,0x10
    c03c:	0109d993          	srl	s3,s3,0x10
    c040:	00a9e9b3          	or	s3,s3,a0
    c044:	0169fa63          	bgeu	s3,s6,c058 <__umoddi3+0x3b8>
    c048:	013a09b3          	add	s3,s4,s3
    c04c:	0149e663          	bltu	s3,s4,c058 <__umoddi3+0x3b8>
    c050:	0169f463          	bgeu	s3,s6,c058 <__umoddi3+0x3b8>
    c054:	014989b3          	add	s3,s3,s4
    c058:	416989b3          	sub	s3,s3,s6
    c05c:	00c12b83          	lw	s7,12(sp)
    c060:	01012b03          	lw	s6,16(sp)
    c064:	e65ff06f          	j	bec8 <__umoddi3+0x228>
    c068:	1006b513          	sltiu	a0,a3,256
    c06c:	00153513          	seqz	a0,a0
    c070:	00351513          	sll	a0,a0,0x3
    c074:	00a6d333          	srl	t1,a3,a0
    c078:	00004717          	auipc	a4,0x4
    c07c:	8e870713          	add	a4,a4,-1816 # f960 <__clz_tab>
    c080:	00670733          	add	a4,a4,t1
    c084:	00074703          	lbu	a4,0(a4)
    c088:	02000313          	li	t1,32
    c08c:	00a709b3          	add	s3,a4,a0
    c090:	41330933          	sub	s2,t1,s3
    c094:	db330ae3          	beq	t1,s3,be48 <__umoddi3+0x1a8>
    c098:	01512a23          	sw	s5,20(sp)
    c09c:	012696b3          	sll	a3,a3,s2
    c0a0:	01365ab3          	srl	s5,a2,s3
    c0a4:	00daeab3          	or	s5,s5,a3
    c0a8:	01712623          	sw	s7,12(sp)
    c0ac:	01a12023          	sw	s10,0(sp)
    c0b0:	010adb93          	srl	s7,s5,0x10
    c0b4:	0135dd33          	srl	s10,a1,s3
    c0b8:	01259733          	sll	a4,a1,s2
    c0bc:	0137d6b3          	srl	a3,a5,s3
    c0c0:	01912223          	sw	s9,4(sp)
    c0c4:	000b8593          	mv	a1,s7
    c0c8:	000d0513          	mv	a0,s10
    c0cc:	010a9c93          	sll	s9,s5,0x10
    c0d0:	02812423          	sw	s0,40(sp)
    c0d4:	02912223          	sw	s1,36(sp)
    c0d8:	01261433          	sll	s0,a2,s2
    c0dc:	012794b3          	sll	s1,a5,s2
    c0e0:	01412c23          	sw	s4,24(sp)
    c0e4:	01612823          	sw	s6,16(sp)
    c0e8:	00e6ea33          	or	s4,a3,a4
    c0ec:	01812423          	sw	s8,8(sp)
    c0f0:	010cdc93          	srl	s9,s9,0x10
    c0f4:	599020ef          	jal	ee8c <__hidden___udivsi3>
    c0f8:	00050593          	mv	a1,a0
    c0fc:	00050b13          	mv	s6,a0
    c100:	000c8513          	mv	a0,s9
    c104:	4c5020ef          	jal	edc8 <__mulsi3>
    c108:	00050c13          	mv	s8,a0
    c10c:	000b8593          	mv	a1,s7
    c110:	000d0513          	mv	a0,s10
    c114:	5c1020ef          	jal	eed4 <__umodsi3>
    c118:	01051513          	sll	a0,a0,0x10
    c11c:	010a5793          	srl	a5,s4,0x10
    c120:	00a7e7b3          	or	a5,a5,a0
    c124:	0187fe63          	bgeu	a5,s8,c140 <__umoddi3+0x4a0>
    c128:	00fa87b3          	add	a5,s5,a5
    c12c:	fffb0713          	add	a4,s6,-1
    c130:	1957ee63          	bltu	a5,s5,c2cc <__umoddi3+0x62c>
    c134:	1987fc63          	bgeu	a5,s8,c2cc <__umoddi3+0x62c>
    c138:	ffeb0b13          	add	s6,s6,-2
    c13c:	015787b3          	add	a5,a5,s5
    c140:	41878c33          	sub	s8,a5,s8
    c144:	000b8593          	mv	a1,s7
    c148:	000c0513          	mv	a0,s8
    c14c:	541020ef          	jal	ee8c <__hidden___udivsi3>
    c150:	00050593          	mv	a1,a0
    c154:	00050d13          	mv	s10,a0
    c158:	000c8513          	mv	a0,s9
    c15c:	46d020ef          	jal	edc8 <__mulsi3>
    c160:	00050793          	mv	a5,a0
    c164:	000b8593          	mv	a1,s7
    c168:	000c0513          	mv	a0,s8
    c16c:	00078b93          	mv	s7,a5
    c170:	565020ef          	jal	eed4 <__umodsi3>
    c174:	010a1593          	sll	a1,s4,0x10
    c178:	01051513          	sll	a0,a0,0x10
    c17c:	0105d593          	srl	a1,a1,0x10
    c180:	00a5e5b3          	or	a1,a1,a0
    c184:	0175fe63          	bgeu	a1,s7,c1a0 <__umoddi3+0x500>
    c188:	00ba85b3          	add	a1,s5,a1
    c18c:	fffd0793          	add	a5,s10,-1
    c190:	1355ea63          	bltu	a1,s5,c2c4 <__umoddi3+0x624>
    c194:	1375f863          	bgeu	a1,s7,c2c4 <__umoddi3+0x624>
    c198:	ffed0d13          	add	s10,s10,-2
    c19c:	015585b3          	add	a1,a1,s5
    c1a0:	010b1793          	sll	a5,s6,0x10
    c1a4:	00010e37          	lui	t3,0x10
    c1a8:	01a7e7b3          	or	a5,a5,s10
    c1ac:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    c1b0:	0067f8b3          	and	a7,a5,t1
    c1b4:	00647333          	and	t1,s0,t1
    c1b8:	41758733          	sub	a4,a1,s7
    c1bc:	0107d793          	srl	a5,a5,0x10
    c1c0:	01045e93          	srl	t4,s0,0x10
    c1c4:	00088513          	mv	a0,a7
    c1c8:	00030593          	mv	a1,t1
    c1cc:	3fd020ef          	jal	edc8 <__mulsi3>
    c1d0:	00050813          	mv	a6,a0
    c1d4:	000e8593          	mv	a1,t4
    c1d8:	00088513          	mv	a0,a7
    c1dc:	3ed020ef          	jal	edc8 <__mulsi3>
    c1e0:	00050893          	mv	a7,a0
    c1e4:	00030593          	mv	a1,t1
    c1e8:	00078513          	mv	a0,a5
    c1ec:	3dd020ef          	jal	edc8 <__mulsi3>
    c1f0:	00050313          	mv	t1,a0
    c1f4:	000e8593          	mv	a1,t4
    c1f8:	00078513          	mv	a0,a5
    c1fc:	3cd020ef          	jal	edc8 <__mulsi3>
    c200:	01085793          	srl	a5,a6,0x10
    c204:	006888b3          	add	a7,a7,t1
    c208:	011787b3          	add	a5,a5,a7
    c20c:	0067f463          	bgeu	a5,t1,c214 <__umoddi3+0x574>
    c210:	01c50533          	add	a0,a0,t3
    c214:	00010637          	lui	a2,0x10
    c218:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    c21c:	0107d693          	srl	a3,a5,0x10
    c220:	00c7f7b3          	and	a5,a5,a2
    c224:	01079793          	sll	a5,a5,0x10
    c228:	00c87833          	and	a6,a6,a2
    c22c:	00a686b3          	add	a3,a3,a0
    c230:	010787b3          	add	a5,a5,a6
    c234:	06d76263          	bltu	a4,a3,c298 <__umoddi3+0x5f8>
    c238:	04d70e63          	beq	a4,a3,c294 <__umoddi3+0x5f4>
    c23c:	40f487b3          	sub	a5,s1,a5
    c240:	00f4b4b3          	sltu	s1,s1,a5
    c244:	02812403          	lw	s0,40(sp)
    c248:	02c12083          	lw	ra,44(sp)
    c24c:	40d705b3          	sub	a1,a4,a3
    c250:	409585b3          	sub	a1,a1,s1
    c254:	01359733          	sll	a4,a1,s3
    c258:	0127d7b3          	srl	a5,a5,s2
    c25c:	02412483          	lw	s1,36(sp)
    c260:	01c12983          	lw	s3,28(sp)
    c264:	01812a03          	lw	s4,24(sp)
    c268:	01412a83          	lw	s5,20(sp)
    c26c:	01012b03          	lw	s6,16(sp)
    c270:	00c12b83          	lw	s7,12(sp)
    c274:	00812c03          	lw	s8,8(sp)
    c278:	00412c83          	lw	s9,4(sp)
    c27c:	00012d03          	lw	s10,0(sp)
    c280:	0125d5b3          	srl	a1,a1,s2
    c284:	00f76533          	or	a0,a4,a5
    c288:	02012903          	lw	s2,32(sp)
    c28c:	03010113          	add	sp,sp,48
    c290:	00008067          	ret
    c294:	faf4f4e3          	bgeu	s1,a5,c23c <__umoddi3+0x59c>
    c298:	40878433          	sub	s0,a5,s0
    c29c:	0087b7b3          	sltu	a5,a5,s0
    c2a0:	01578ab3          	add	s5,a5,s5
    c2a4:	415686b3          	sub	a3,a3,s5
    c2a8:	00040793          	mv	a5,s0
    c2ac:	f91ff06f          	j	c23c <__umoddi3+0x59c>
    c2b0:	01000737          	lui	a4,0x1000
    c2b4:	02e67c63          	bgeu	a2,a4,c2ec <__umoddi3+0x64c>
    c2b8:	01065513          	srl	a0,a2,0x10
    c2bc:	01000693          	li	a3,16
    c2c0:	bd9ff06f          	j	be98 <__umoddi3+0x1f8>
    c2c4:	00078d13          	mv	s10,a5
    c2c8:	ed9ff06f          	j	c1a0 <__umoddi3+0x500>
    c2cc:	00070b13          	mv	s6,a4
    c2d0:	e71ff06f          	j	c140 <__umoddi3+0x4a0>
    c2d4:	014787b3          	add	a5,a5,s4
    c2d8:	aedff06f          	j	bdc4 <__umoddi3+0x124>
    c2dc:	014787b3          	add	a5,a5,s4
    c2e0:	c2dff06f          	j	bf0c <__umoddi3+0x26c>
    c2e4:	014787b3          	add	a5,a5,s4
    c2e8:	a91ff06f          	j	bd78 <__umoddi3+0xd8>
    c2ec:	01865513          	srl	a0,a2,0x18
    c2f0:	01800693          	li	a3,24
    c2f4:	ba5ff06f          	j	be98 <__umoddi3+0x1f8>

0000c2f8 <__adddf3>:
    c2f8:	001007b7          	lui	a5,0x100
    c2fc:	fe010113          	add	sp,sp,-32
    c300:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c304:	00bef833          	and	a6,t4,a1
    c308:	00def7b3          	and	a5,t4,a3
    c30c:	0146d313          	srl	t1,a3,0x14
    c310:	01212823          	sw	s2,16(sp)
    c314:	0145d913          	srl	s2,a1,0x14
    c318:	00379793          	sll	a5,a5,0x3
    c31c:	00812c23          	sw	s0,24(sp)
    c320:	00381813          	sll	a6,a6,0x3
    c324:	01f5d413          	srl	s0,a1,0x1f
    c328:	01d55713          	srl	a4,a0,0x1d
    c32c:	01d65893          	srl	a7,a2,0x1d
    c330:	7ff97913          	and	s2,s2,2047
    c334:	7ff37313          	and	t1,t1,2047
    c338:	00112e23          	sw	ra,28(sp)
    c33c:	00912a23          	sw	s1,20(sp)
    c340:	01312623          	sw	s3,12(sp)
    c344:	01f6d693          	srl	a3,a3,0x1f
    c348:	00f8e8b3          	or	a7,a7,a5
    c34c:	01076733          	or	a4,a4,a6
    c350:	00351593          	sll	a1,a0,0x3
    c354:	00361f13          	sll	t5,a2,0x3
    c358:	406907b3          	sub	a5,s2,t1
    c35c:	1ed40463          	beq	s0,a3,c544 <__adddf3+0x24c>
    c360:	16f05263          	blez	a5,c4c4 <__adddf3+0x1cc>
    c364:	28030663          	beqz	t1,c5f0 <__adddf3+0x2f8>
    c368:	7ff00693          	li	a3,2047
    c36c:	42d90663          	beq	s2,a3,c798 <__adddf3+0x4a0>
    c370:	03800693          	li	a3,56
    c374:	00100613          	li	a2,1
    c378:	02f6ce63          	blt	a3,a5,c3b4 <__adddf3+0xbc>
    c37c:	008006b7          	lui	a3,0x800
    c380:	00d8e8b3          	or	a7,a7,a3
    c384:	01f00693          	li	a3,31
    c388:	52f6ce63          	blt	a3,a5,c8c4 <__adddf3+0x5cc>
    c38c:	02000693          	li	a3,32
    c390:	40f686b3          	sub	a3,a3,a5
    c394:	00d89633          	sll	a2,a7,a3
    c398:	00ff5533          	srl	a0,t5,a5
    c39c:	00df16b3          	sll	a3,t5,a3
    c3a0:	00a66633          	or	a2,a2,a0
    c3a4:	00d036b3          	snez	a3,a3
    c3a8:	00f8d8b3          	srl	a7,a7,a5
    c3ac:	00d66633          	or	a2,a2,a3
    c3b0:	41170733          	sub	a4,a4,a7
    c3b4:	40c58633          	sub	a2,a1,a2
    c3b8:	00c5b5b3          	sltu	a1,a1,a2
    c3bc:	00060493          	mv	s1,a2
    c3c0:	40b709b3          	sub	s3,a4,a1
    c3c4:	00899793          	sll	a5,s3,0x8
    c3c8:	3207da63          	bgez	a5,c6fc <__adddf3+0x404>
    c3cc:	008007b7          	lui	a5,0x800
    c3d0:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c3d4:	00f9f9b3          	and	s3,s3,a5
    c3d8:	2c098863          	beqz	s3,c6a8 <__adddf3+0x3b0>
    c3dc:	00098513          	mv	a0,s3
    c3e0:	359020ef          	jal	ef38 <__clzsi2>
    c3e4:	ff850793          	add	a5,a0,-8
    c3e8:	02000693          	li	a3,32
    c3ec:	40f68733          	sub	a4,a3,a5
    c3f0:	00e4d733          	srl	a4,s1,a4
    c3f4:	00f999b3          	sll	s3,s3,a5
    c3f8:	01376733          	or	a4,a4,s3
    c3fc:	00f494b3          	sll	s1,s1,a5
    c400:	4b27c863          	blt	a5,s2,c8b0 <__adddf3+0x5b8>
    c404:	412787b3          	sub	a5,a5,s2
    c408:	00178793          	add	a5,a5,1
    c40c:	40f686b3          	sub	a3,a3,a5
    c410:	00d49633          	sll	a2,s1,a3
    c414:	00f4d9b3          	srl	s3,s1,a5
    c418:	00c03633          	snez	a2,a2
    c41c:	01366633          	or	a2,a2,s3
    c420:	00d716b3          	sll	a3,a4,a3
    c424:	00c6e4b3          	or	s1,a3,a2
    c428:	00f759b3          	srl	s3,a4,a5
    c42c:	00000913          	li	s2,0
    c430:	0074f793          	and	a5,s1,7
    c434:	02078063          	beqz	a5,c454 <__adddf3+0x15c>
    c438:	00f4f793          	and	a5,s1,15
    c43c:	00400713          	li	a4,4
    c440:	00e78a63          	beq	a5,a4,c454 <__adddf3+0x15c>
    c444:	00448793          	add	a5,s1,4
    c448:	0097b633          	sltu	a2,a5,s1
    c44c:	00c989b3          	add	s3,s3,a2
    c450:	00078493          	mv	s1,a5
    c454:	00899793          	sll	a5,s3,0x8
    c458:	6e07da63          	bgez	a5,cb4c <__adddf3+0x854>
    c45c:	00190793          	add	a5,s2,1
    c460:	7ff00713          	li	a4,2047
    c464:	00040e13          	mv	t3,s0
    c468:	2ae78663          	beq	a5,a4,c714 <__adddf3+0x41c>
    c46c:	ff800737          	lui	a4,0xff800
    c470:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c474:	00e9f733          	and	a4,s3,a4
    c478:	7ff7f793          	and	a5,a5,2047
    c47c:	01d71813          	sll	a6,a4,0x1d
    c480:	0034d613          	srl	a2,s1,0x3
    c484:	00971713          	sll	a4,a4,0x9
    c488:	00c86833          	or	a6,a6,a2
    c48c:	00c75713          	srl	a4,a4,0xc
    c490:	01c12083          	lw	ra,28(sp)
    c494:	01812403          	lw	s0,24(sp)
    c498:	01479793          	sll	a5,a5,0x14
    c49c:	00e7e7b3          	or	a5,a5,a4
    c4a0:	01fe1713          	sll	a4,t3,0x1f
    c4a4:	00e7e7b3          	or	a5,a5,a4
    c4a8:	01412483          	lw	s1,20(sp)
    c4ac:	01012903          	lw	s2,16(sp)
    c4b0:	00c12983          	lw	s3,12(sp)
    c4b4:	00080513          	mv	a0,a6
    c4b8:	00078593          	mv	a1,a5
    c4bc:	02010113          	add	sp,sp,32
    c4c0:	00008067          	ret
    c4c4:	14078c63          	beqz	a5,c61c <__adddf3+0x324>
    c4c8:	412307b3          	sub	a5,t1,s2
    c4cc:	3c091263          	bnez	s2,c890 <__adddf3+0x598>
    c4d0:	00b76533          	or	a0,a4,a1
    c4d4:	4c050463          	beqz	a0,c99c <__adddf3+0x6a4>
    c4d8:	fff78513          	add	a0,a5,-1
    c4dc:	60050263          	beqz	a0,cae0 <__adddf3+0x7e8>
    c4e0:	7ff00813          	li	a6,2047
    c4e4:	57078663          	beq	a5,a6,ca50 <__adddf3+0x758>
    c4e8:	03800793          	li	a5,56
    c4ec:	00100613          	li	a2,1
    c4f0:	02a7cc63          	blt	a5,a0,c528 <__adddf3+0x230>
    c4f4:	00050793          	mv	a5,a0
    c4f8:	01f00613          	li	a2,31
    c4fc:	56f64c63          	blt	a2,a5,ca74 <__adddf3+0x77c>
    c500:	02000513          	li	a0,32
    c504:	40f50533          	sub	a0,a0,a5
    c508:	00a71633          	sll	a2,a4,a0
    c50c:	00f5d833          	srl	a6,a1,a5
    c510:	00a59533          	sll	a0,a1,a0
    c514:	01066633          	or	a2,a2,a6
    c518:	00a03533          	snez	a0,a0
    c51c:	00f75733          	srl	a4,a4,a5
    c520:	00a66633          	or	a2,a2,a0
    c524:	40e888b3          	sub	a7,a7,a4
    c528:	40cf0633          	sub	a2,t5,a2
    c52c:	00cf3733          	sltu	a4,t5,a2
    c530:	00060493          	mv	s1,a2
    c534:	40e889b3          	sub	s3,a7,a4
    c538:	00030913          	mv	s2,t1
    c53c:	00068413          	mv	s0,a3
    c540:	e85ff06f          	j	c3c4 <__adddf3+0xcc>
    c544:	1ef05063          	blez	a5,c724 <__adddf3+0x42c>
    c548:	14031063          	bnez	t1,c688 <__adddf3+0x390>
    c54c:	01e8e6b3          	or	a3,a7,t5
    c550:	26068c63          	beqz	a3,c7c8 <__adddf3+0x4d0>
    c554:	fff78693          	add	a3,a5,-1
    c558:	48068063          	beqz	a3,c9d8 <__adddf3+0x6e0>
    c55c:	7ff00613          	li	a2,2047
    c560:	22c78c63          	beq	a5,a2,c798 <__adddf3+0x4a0>
    c564:	03800793          	li	a5,56
    c568:	00100993          	li	s3,1
    c56c:	02d7cc63          	blt	a5,a3,c5a4 <__adddf3+0x2ac>
    c570:	00068793          	mv	a5,a3
    c574:	01f00693          	li	a3,31
    c578:	4af6c063          	blt	a3,a5,ca18 <__adddf3+0x720>
    c57c:	02000693          	li	a3,32
    c580:	40f686b3          	sub	a3,a3,a5
    c584:	00d899b3          	sll	s3,a7,a3
    c588:	00ff5633          	srl	a2,t5,a5
    c58c:	00df16b3          	sll	a3,t5,a3
    c590:	00c9e9b3          	or	s3,s3,a2
    c594:	00d036b3          	snez	a3,a3
    c598:	00f8d8b3          	srl	a7,a7,a5
    c59c:	00d9e9b3          	or	s3,s3,a3
    c5a0:	01170733          	add	a4,a4,a7
    c5a4:	00b985b3          	add	a1,s3,a1
    c5a8:	0135b9b3          	sltu	s3,a1,s3
    c5ac:	00058493          	mv	s1,a1
    c5b0:	00e989b3          	add	s3,s3,a4
    c5b4:	00899793          	sll	a5,s3,0x8
    c5b8:	1407d263          	bgez	a5,c6fc <__adddf3+0x404>
    c5bc:	00190913          	add	s2,s2,1
    c5c0:	7ff00793          	li	a5,2047
    c5c4:	36f90c63          	beq	s2,a5,c93c <__adddf3+0x644>
    c5c8:	ff8007b7          	lui	a5,0xff800
    c5cc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c5d0:	0014f613          	and	a2,s1,1
    c5d4:	00f9f7b3          	and	a5,s3,a5
    c5d8:	0014d713          	srl	a4,s1,0x1
    c5dc:	00c76733          	or	a4,a4,a2
    c5e0:	01f79613          	sll	a2,a5,0x1f
    c5e4:	00e664b3          	or	s1,a2,a4
    c5e8:	0017d993          	srl	s3,a5,0x1
    c5ec:	e45ff06f          	j	c430 <__adddf3+0x138>
    c5f0:	01e8e6b3          	or	a3,a7,t5
    c5f4:	1c068a63          	beqz	a3,c7c8 <__adddf3+0x4d0>
    c5f8:	fff78693          	add	a3,a5,-1
    c5fc:	40068063          	beqz	a3,c9fc <__adddf3+0x704>
    c600:	7ff00613          	li	a2,2047
    c604:	18c78a63          	beq	a5,a2,c798 <__adddf3+0x4a0>
    c608:	03800793          	li	a5,56
    c60c:	00100613          	li	a2,1
    c610:	dad7c2e3          	blt	a5,a3,c3b4 <__adddf3+0xbc>
    c614:	00068793          	mv	a5,a3
    c618:	d6dff06f          	j	c384 <__adddf3+0x8c>
    c61c:	00190813          	add	a6,s2,1
    c620:	7fe87813          	and	a6,a6,2046
    c624:	22081c63          	bnez	a6,c85c <__adddf3+0x564>
    c628:	00b76333          	or	t1,a4,a1
    c62c:	01e8e833          	or	a6,a7,t5
    c630:	38091063          	bnez	s2,c9b0 <__adddf3+0x6b8>
    c634:	46030e63          	beqz	t1,cab0 <__adddf3+0x7b8>
    c638:	40080663          	beqz	a6,ca44 <__adddf3+0x74c>
    c63c:	41e589b3          	sub	s3,a1,t5
    c640:	0135b533          	sltu	a0,a1,s3
    c644:	41170633          	sub	a2,a4,a7
    c648:	40a60633          	sub	a2,a2,a0
    c64c:	00861513          	sll	a0,a2,0x8
    c650:	50055e63          	bgez	a0,cb6c <__adddf3+0x874>
    c654:	40bf05b3          	sub	a1,t5,a1
    c658:	40e88733          	sub	a4,a7,a4
    c65c:	00bf3f33          	sltu	t5,t5,a1
    c660:	41e70733          	sub	a4,a4,t5
    c664:	00871613          	sll	a2,a4,0x8
    c668:	00058493          	mv	s1,a1
    c66c:	52065e63          	bgez	a2,cba8 <__adddf3+0x8b0>
    c670:	ff8007b7          	lui	a5,0xff800
    c674:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c678:	00f77733          	and	a4,a4,a5
    c67c:	00068e13          	mv	t3,a3
    c680:	00100793          	li	a5,1
    c684:	df9ff06f          	j	c47c <__adddf3+0x184>
    c688:	7ff00693          	li	a3,2047
    c68c:	10d90663          	beq	s2,a3,c798 <__adddf3+0x4a0>
    c690:	03800693          	li	a3,56
    c694:	00100993          	li	s3,1
    c698:	f0f6c6e3          	blt	a3,a5,c5a4 <__adddf3+0x2ac>
    c69c:	008006b7          	lui	a3,0x800
    c6a0:	00d8e8b3          	or	a7,a7,a3
    c6a4:	ed1ff06f          	j	c574 <__adddf3+0x27c>
    c6a8:	00048513          	mv	a0,s1
    c6ac:	08d020ef          	jal	ef38 <__clzsi2>
    c6b0:	01850793          	add	a5,a0,24
    c6b4:	01f00693          	li	a3,31
    c6b8:	d2f6d8e3          	bge	a3,a5,c3e8 <__adddf3+0xf0>
    c6bc:	ff850713          	add	a4,a0,-8
    c6c0:	00e49733          	sll	a4,s1,a4
    c6c4:	2327c663          	blt	a5,s2,c8f0 <__adddf3+0x5f8>
    c6c8:	41278933          	sub	s2,a5,s2
    c6cc:	00190793          	add	a5,s2,1
    c6d0:	48f6d663          	bge	a3,a5,cb5c <__adddf3+0x864>
    c6d4:	fe190913          	add	s2,s2,-31
    c6d8:	02000693          	li	a3,32
    c6dc:	012754b3          	srl	s1,a4,s2
    c6e0:	00d78c63          	beq	a5,a3,c6f8 <__adddf3+0x400>
    c6e4:	04000693          	li	a3,64
    c6e8:	40f687b3          	sub	a5,a3,a5
    c6ec:	00f71733          	sll	a4,a4,a5
    c6f0:	00e03733          	snez	a4,a4
    c6f4:	00e4e4b3          	or	s1,s1,a4
    c6f8:	00000913          	li	s2,0
    c6fc:	0074f793          	and	a5,s1,7
    c700:	d2079ce3          	bnez	a5,c438 <__adddf3+0x140>
    c704:	00090793          	mv	a5,s2
    c708:	0034d613          	srl	a2,s1,0x3
    c70c:	00098713          	mv	a4,s3
    c710:	0c00006f          	j	c7d0 <__adddf3+0x4d8>
    c714:	7ff00793          	li	a5,2047
    c718:	00000713          	li	a4,0
    c71c:	00000813          	li	a6,0
    c720:	d71ff06f          	j	c490 <__adddf3+0x198>
    c724:	0c078a63          	beqz	a5,c7f8 <__adddf3+0x500>
    c728:	412307b3          	sub	a5,t1,s2
    c72c:	1e090263          	beqz	s2,c910 <__adddf3+0x618>
    c730:	7ff00693          	li	a3,2047
    c734:	32d30863          	beq	t1,a3,ca64 <__adddf3+0x76c>
    c738:	03800693          	li	a3,56
    c73c:	00100993          	li	s3,1
    c740:	02f6ce63          	blt	a3,a5,c77c <__adddf3+0x484>
    c744:	008006b7          	lui	a3,0x800
    c748:	00d76733          	or	a4,a4,a3
    c74c:	01f00693          	li	a3,31
    c750:	3cf6c863          	blt	a3,a5,cb20 <__adddf3+0x828>
    c754:	02000693          	li	a3,32
    c758:	40f686b3          	sub	a3,a3,a5
    c75c:	00d719b3          	sll	s3,a4,a3
    c760:	00f5d633          	srl	a2,a1,a5
    c764:	00d596b3          	sll	a3,a1,a3
    c768:	00c9e9b3          	or	s3,s3,a2
    c76c:	00d036b3          	snez	a3,a3
    c770:	00f75733          	srl	a4,a4,a5
    c774:	00d9e9b3          	or	s3,s3,a3
    c778:	00e888b3          	add	a7,a7,a4
    c77c:	01e98733          	add	a4,s3,t5
    c780:	013739b3          	sltu	s3,a4,s3
    c784:	00070493          	mv	s1,a4
    c788:	011989b3          	add	s3,s3,a7
    c78c:	00030913          	mv	s2,t1
    c790:	e25ff06f          	j	c5b4 <__adddf3+0x2bc>
    c794:	02081063          	bnez	a6,c7b4 <__adddf3+0x4bc>
    c798:	00351613          	sll	a2,a0,0x3
    c79c:	00365613          	srl	a2,a2,0x3
    c7a0:	01d71813          	sll	a6,a4,0x1d
    c7a4:	00c86833          	or	a6,a6,a2
    c7a8:	00375713          	srl	a4,a4,0x3
    c7ac:	01076733          	or	a4,a4,a6
    c7b0:	18070663          	beqz	a4,c93c <__adddf3+0x644>
    c7b4:	00000e13          	li	t3,0
    c7b8:	7ff00793          	li	a5,2047
    c7bc:	00080737          	lui	a4,0x80
    c7c0:	00000813          	li	a6,0
    c7c4:	ccdff06f          	j	c490 <__adddf3+0x198>
    c7c8:	00351613          	sll	a2,a0,0x3
    c7cc:	00365613          	srl	a2,a2,0x3
    c7d0:	01d71813          	sll	a6,a4,0x1d
    c7d4:	7ff00693          	li	a3,2047
    c7d8:	00c86833          	or	a6,a6,a2
    c7dc:	00375713          	srl	a4,a4,0x3
    c7e0:	fcd786e3          	beq	a5,a3,c7ac <__adddf3+0x4b4>
    c7e4:	00c71713          	sll	a4,a4,0xc
    c7e8:	00c75713          	srl	a4,a4,0xc
    c7ec:	7ff7f793          	and	a5,a5,2047
    c7f0:	00040e13          	mv	t3,s0
    c7f4:	c9dff06f          	j	c490 <__adddf3+0x198>
    c7f8:	00190693          	add	a3,s2,1
    c7fc:	7fe6f813          	and	a6,a3,2046
    c800:	14081863          	bnez	a6,c950 <__adddf3+0x658>
    c804:	00b766b3          	or	a3,a4,a1
    c808:	28091c63          	bnez	s2,caa0 <__adddf3+0x7a8>
    c80c:	30068263          	beqz	a3,cb10 <__adddf3+0x818>
    c810:	01e8e6b3          	or	a3,a7,t5
    c814:	22068863          	beqz	a3,ca44 <__adddf3+0x74c>
    c818:	01e587b3          	add	a5,a1,t5
    c81c:	00b7b5b3          	sltu	a1,a5,a1
    c820:	01170733          	add	a4,a4,a7
    c824:	00b70733          	add	a4,a4,a1
    c828:	0037d813          	srl	a6,a5,0x3
    c82c:	00871793          	sll	a5,a4,0x8
    c830:	00040e13          	mv	t3,s0
    c834:	3407de63          	bgez	a5,cb90 <__adddf3+0x898>
    c838:	ff8007b7          	lui	a5,0xff800
    c83c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c840:	00f77733          	and	a4,a4,a5
    c844:	01d71793          	sll	a5,a4,0x1d
    c848:	00375713          	srl	a4,a4,0x3
    c84c:	0107e833          	or	a6,a5,a6
    c850:	01d77733          	and	a4,a4,t4
    c854:	00100793          	li	a5,1
    c858:	c39ff06f          	j	c490 <__adddf3+0x198>
    c85c:	41e58833          	sub	a6,a1,t5
    c860:	0105b7b3          	sltu	a5,a1,a6
    c864:	411709b3          	sub	s3,a4,a7
    c868:	40f989b3          	sub	s3,s3,a5
    c86c:	00899793          	sll	a5,s3,0x8
    c870:	00080493          	mv	s1,a6
    c874:	1007c663          	bltz	a5,c980 <__adddf3+0x688>
    c878:	01386833          	or	a6,a6,s3
    c87c:	b4081ee3          	bnez	a6,c3d8 <__adddf3+0xe0>
    c880:	00000e13          	li	t3,0
    c884:	00000793          	li	a5,0
    c888:	00000713          	li	a4,0
    c88c:	c05ff06f          	j	c490 <__adddf3+0x198>
    c890:	7ff00513          	li	a0,2047
    c894:	1aa30e63          	beq	t1,a0,ca50 <__adddf3+0x758>
    c898:	03800513          	li	a0,56
    c89c:	00100613          	li	a2,1
    c8a0:	c8f544e3          	blt	a0,a5,c528 <__adddf3+0x230>
    c8a4:	00800637          	lui	a2,0x800
    c8a8:	00c76733          	or	a4,a4,a2
    c8ac:	c4dff06f          	j	c4f8 <__adddf3+0x200>
    c8b0:	ff8009b7          	lui	s3,0xff800
    c8b4:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c8b8:	40f90933          	sub	s2,s2,a5
    c8bc:	013779b3          	and	s3,a4,s3
    c8c0:	b71ff06f          	j	c430 <__adddf3+0x138>
    c8c4:	fe078693          	add	a3,a5,-32
    c8c8:	02000613          	li	a2,32
    c8cc:	00d8d6b3          	srl	a3,a7,a3
    c8d0:	00c78a63          	beq	a5,a2,c8e4 <__adddf3+0x5ec>
    c8d4:	04000613          	li	a2,64
    c8d8:	40f607b3          	sub	a5,a2,a5
    c8dc:	00f897b3          	sll	a5,a7,a5
    c8e0:	00ff6f33          	or	t5,t5,a5
    c8e4:	01e03633          	snez	a2,t5
    c8e8:	00d66633          	or	a2,a2,a3
    c8ec:	ac9ff06f          	j	c3b4 <__adddf3+0xbc>
    c8f0:	ff8006b7          	lui	a3,0xff800
    c8f4:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c8f8:	40f907b3          	sub	a5,s2,a5
    c8fc:	00d77733          	and	a4,a4,a3
    c900:	01d71813          	sll	a6,a4,0x1d
    c904:	01386833          	or	a6,a6,s3
    c908:	00375713          	srl	a4,a4,0x3
    c90c:	ed9ff06f          	j	c7e4 <__adddf3+0x4ec>
    c910:	00b766b3          	or	a3,a4,a1
    c914:	1e068663          	beqz	a3,cb00 <__adddf3+0x808>
    c918:	fff78693          	add	a3,a5,-1
    c91c:	0a068e63          	beqz	a3,c9d8 <__adddf3+0x6e0>
    c920:	7ff00513          	li	a0,2047
    c924:	14a78063          	beq	a5,a0,ca64 <__adddf3+0x76c>
    c928:	03800793          	li	a5,56
    c92c:	00100993          	li	s3,1
    c930:	e4d7c6e3          	blt	a5,a3,c77c <__adddf3+0x484>
    c934:	00068793          	mv	a5,a3
    c938:	e15ff06f          	j	c74c <__adddf3+0x454>
    c93c:	00040e13          	mv	t3,s0
    c940:	7ff00793          	li	a5,2047
    c944:	00000713          	li	a4,0
    c948:	00000813          	li	a6,0
    c94c:	b45ff06f          	j	c490 <__adddf3+0x198>
    c950:	7ff00793          	li	a5,2047
    c954:	fef684e3          	beq	a3,a5,c93c <__adddf3+0x644>
    c958:	01e58f33          	add	t5,a1,t5
    c95c:	00bf35b3          	sltu	a1,t5,a1
    c960:	011707b3          	add	a5,a4,a7
    c964:	00b787b3          	add	a5,a5,a1
    c968:	01f79613          	sll	a2,a5,0x1f
    c96c:	001f5f13          	srl	t5,t5,0x1
    c970:	01e664b3          	or	s1,a2,t5
    c974:	0017d993          	srl	s3,a5,0x1
    c978:	00068913          	mv	s2,a3
    c97c:	ab5ff06f          	j	c430 <__adddf3+0x138>
    c980:	40bf0633          	sub	a2,t5,a1
    c984:	40e887b3          	sub	a5,a7,a4
    c988:	00cf3733          	sltu	a4,t5,a2
    c98c:	00060493          	mv	s1,a2
    c990:	40e789b3          	sub	s3,a5,a4
    c994:	00068413          	mv	s0,a3
    c998:	a41ff06f          	j	c3d8 <__adddf3+0xe0>
    c99c:	00361613          	sll	a2,a2,0x3
    c9a0:	00365613          	srl	a2,a2,0x3
    c9a4:	00068413          	mv	s0,a3
    c9a8:	00088713          	mv	a4,a7
    c9ac:	e25ff06f          	j	c7d0 <__adddf3+0x4d8>
    c9b0:	de0312e3          	bnez	t1,c794 <__adddf3+0x49c>
    c9b4:	1c080663          	beqz	a6,cb80 <__adddf3+0x888>
    c9b8:	0038d713          	srl	a4,a7,0x3
    c9bc:	00361613          	sll	a2,a2,0x3
    c9c0:	01d89893          	sll	a7,a7,0x1d
    c9c4:	01176733          	or	a4,a4,a7
    c9c8:	00365613          	srl	a2,a2,0x3
    c9cc:	00c76733          	or	a4,a4,a2
    c9d0:	00068413          	mv	s0,a3
    c9d4:	dddff06f          	j	c7b0 <__adddf3+0x4b8>
    c9d8:	01e58f33          	add	t5,a1,t5
    c9dc:	011708b3          	add	a7,a4,a7
    c9e0:	00bf35b3          	sltu	a1,t5,a1
    c9e4:	00b889b3          	add	s3,a7,a1
    c9e8:	00899793          	sll	a5,s3,0x8
    c9ec:	000f0493          	mv	s1,t5
    c9f0:	0e07d463          	bgez	a5,cad8 <__adddf3+0x7e0>
    c9f4:	00200913          	li	s2,2
    c9f8:	bd1ff06f          	j	c5c8 <__adddf3+0x2d0>
    c9fc:	41e58f33          	sub	t5,a1,t5
    ca00:	411708b3          	sub	a7,a4,a7
    ca04:	01e5b5b3          	sltu	a1,a1,t5
    ca08:	000f0493          	mv	s1,t5
    ca0c:	40b889b3          	sub	s3,a7,a1
    ca10:	00100913          	li	s2,1
    ca14:	9b1ff06f          	j	c3c4 <__adddf3+0xcc>
    ca18:	fe078693          	add	a3,a5,-32
    ca1c:	02000613          	li	a2,32
    ca20:	00d8d6b3          	srl	a3,a7,a3
    ca24:	00c78a63          	beq	a5,a2,ca38 <__adddf3+0x740>
    ca28:	04000613          	li	a2,64
    ca2c:	40f607b3          	sub	a5,a2,a5
    ca30:	00f897b3          	sll	a5,a7,a5
    ca34:	00ff6f33          	or	t5,t5,a5
    ca38:	01e039b3          	snez	s3,t5
    ca3c:	00d9e9b3          	or	s3,s3,a3
    ca40:	b65ff06f          	j	c5a4 <__adddf3+0x2ac>
    ca44:	00351613          	sll	a2,a0,0x3
    ca48:	00365993          	srl	s3,a2,0x3
    ca4c:	eb5ff06f          	j	c900 <__adddf3+0x608>
    ca50:	00361613          	sll	a2,a2,0x3
    ca54:	00365613          	srl	a2,a2,0x3
    ca58:	00068413          	mv	s0,a3
    ca5c:	00088713          	mv	a4,a7
    ca60:	d41ff06f          	j	c7a0 <__adddf3+0x4a8>
    ca64:	00361613          	sll	a2,a2,0x3
    ca68:	00365613          	srl	a2,a2,0x3
    ca6c:	00088713          	mv	a4,a7
    ca70:	d31ff06f          	j	c7a0 <__adddf3+0x4a8>
    ca74:	fe078513          	add	a0,a5,-32
    ca78:	02000613          	li	a2,32
    ca7c:	00a75533          	srl	a0,a4,a0
    ca80:	00c78a63          	beq	a5,a2,ca94 <__adddf3+0x79c>
    ca84:	04000613          	li	a2,64
    ca88:	40f607b3          	sub	a5,a2,a5
    ca8c:	00f717b3          	sll	a5,a4,a5
    ca90:	00f5e5b3          	or	a1,a1,a5
    ca94:	00b03633          	snez	a2,a1
    ca98:	00a66633          	or	a2,a2,a0
    ca9c:	a8dff06f          	j	c528 <__adddf3+0x230>
    caa0:	fc0682e3          	beqz	a3,ca64 <__adddf3+0x76c>
    caa4:	01e8ef33          	or	t5,a7,t5
    caa8:	d00f16e3          	bnez	t5,c7b4 <__adddf3+0x4bc>
    caac:	cedff06f          	j	c798 <__adddf3+0x4a0>
    cab0:	dc0808e3          	beqz	a6,c880 <__adddf3+0x588>
    cab4:	00361813          	sll	a6,a2,0x3
    cab8:	01d89793          	sll	a5,a7,0x1d
    cabc:	00385813          	srl	a6,a6,0x3
    cac0:	0038d713          	srl	a4,a7,0x3
    cac4:	00f86833          	or	a6,a6,a5
    cac8:	01d77733          	and	a4,a4,t4
    cacc:	00068e13          	mv	t3,a3
    cad0:	00000793          	li	a5,0
    cad4:	9bdff06f          	j	c490 <__adddf3+0x198>
    cad8:	00100793          	li	a5,1
    cadc:	c2dff06f          	j	c708 <__adddf3+0x410>
    cae0:	40bf05b3          	sub	a1,t5,a1
    cae4:	40e888b3          	sub	a7,a7,a4
    cae8:	00bf3733          	sltu	a4,t5,a1
    caec:	00058493          	mv	s1,a1
    caf0:	40e889b3          	sub	s3,a7,a4
    caf4:	00068413          	mv	s0,a3
    caf8:	00100913          	li	s2,1
    cafc:	8c9ff06f          	j	c3c4 <__adddf3+0xcc>
    cb00:	00361613          	sll	a2,a2,0x3
    cb04:	00365613          	srl	a2,a2,0x3
    cb08:	00088713          	mv	a4,a7
    cb0c:	cc5ff06f          	j	c7d0 <__adddf3+0x4d8>
    cb10:	00361613          	sll	a2,a2,0x3
    cb14:	00365993          	srl	s3,a2,0x3
    cb18:	00088713          	mv	a4,a7
    cb1c:	de5ff06f          	j	c900 <__adddf3+0x608>
    cb20:	fe078693          	add	a3,a5,-32
    cb24:	02000613          	li	a2,32
    cb28:	00d756b3          	srl	a3,a4,a3
    cb2c:	00c78a63          	beq	a5,a2,cb40 <__adddf3+0x848>
    cb30:	04000613          	li	a2,64
    cb34:	40f607b3          	sub	a5,a2,a5
    cb38:	00f717b3          	sll	a5,a4,a5
    cb3c:	00f5e5b3          	or	a1,a1,a5
    cb40:	00b039b3          	snez	s3,a1
    cb44:	00d9e9b3          	or	s3,s3,a3
    cb48:	c35ff06f          	j	c77c <__adddf3+0x484>
    cb4c:	0034d613          	srl	a2,s1,0x3
    cb50:	00090793          	mv	a5,s2
    cb54:	00098713          	mv	a4,s3
    cb58:	c79ff06f          	j	c7d0 <__adddf3+0x4d8>
    cb5c:	02000693          	li	a3,32
    cb60:	40f686b3          	sub	a3,a3,a5
    cb64:	00000613          	li	a2,0
    cb68:	8b5ff06f          	j	c41c <__adddf3+0x124>
    cb6c:	00c9e833          	or	a6,s3,a2
    cb70:	d00808e3          	beqz	a6,c880 <__adddf3+0x588>
    cb74:	0039d993          	srl	s3,s3,0x3
    cb78:	00060713          	mv	a4,a2
    cb7c:	d85ff06f          	j	c900 <__adddf3+0x608>
    cb80:	00000e13          	li	t3,0
    cb84:	7ff00793          	li	a5,2047
    cb88:	00080737          	lui	a4,0x80
    cb8c:	905ff06f          	j	c490 <__adddf3+0x198>
    cb90:	01d71793          	sll	a5,a4,0x1d
    cb94:	00375713          	srl	a4,a4,0x3
    cb98:	0107e833          	or	a6,a5,a6
    cb9c:	01d77733          	and	a4,a4,t4
    cba0:	00000793          	li	a5,0
    cba4:	8edff06f          	j	c490 <__adddf3+0x198>
    cba8:	01d71813          	sll	a6,a4,0x1d
    cbac:	0035d593          	srl	a1,a1,0x3
    cbb0:	00b86833          	or	a6,a6,a1
    cbb4:	00375713          	srl	a4,a4,0x3
    cbb8:	00068413          	mv	s0,a3
    cbbc:	c29ff06f          	j	c7e4 <__adddf3+0x4ec>

0000cbc0 <__divdf3>:
    cbc0:	fb010113          	add	sp,sp,-80
    cbc4:	0145d793          	srl	a5,a1,0x14
    cbc8:	04812423          	sw	s0,72(sp)
    cbcc:	04912223          	sw	s1,68(sp)
    cbd0:	05212023          	sw	s2,64(sp)
    cbd4:	03412c23          	sw	s4,56(sp)
    cbd8:	03512a23          	sw	s5,52(sp)
    cbdc:	00c59493          	sll	s1,a1,0xc
    cbe0:	04112623          	sw	ra,76(sp)
    cbe4:	03312e23          	sw	s3,60(sp)
    cbe8:	03612823          	sw	s6,48(sp)
    cbec:	03712623          	sw	s7,44(sp)
    cbf0:	03812423          	sw	s8,40(sp)
    cbf4:	7ff7f793          	and	a5,a5,2047
    cbf8:	00050413          	mv	s0,a0
    cbfc:	00060a13          	mv	s4,a2
    cc00:	00068913          	mv	s2,a3
    cc04:	00c4d493          	srl	s1,s1,0xc
    cc08:	01f5da93          	srl	s5,a1,0x1f
    cc0c:	18078c63          	beqz	a5,cda4 <__divdf3+0x1e4>
    cc10:	7ff00713          	li	a4,2047
    cc14:	08e78a63          	beq	a5,a4,cca8 <__divdf3+0xe8>
    cc18:	01d55b13          	srl	s6,a0,0x1d
    cc1c:	00349493          	sll	s1,s1,0x3
    cc20:	009b64b3          	or	s1,s6,s1
    cc24:	00800737          	lui	a4,0x800
    cc28:	00e4eb33          	or	s6,s1,a4
    cc2c:	00351b93          	sll	s7,a0,0x3
    cc30:	c0178993          	add	s3,a5,-1023
    cc34:	00000493          	li	s1,0
    cc38:	00000c13          	li	s8,0
    cc3c:	01495793          	srl	a5,s2,0x14
    cc40:	00c91413          	sll	s0,s2,0xc
    cc44:	7ff7f793          	and	a5,a5,2047
    cc48:	00c45413          	srl	s0,s0,0xc
    cc4c:	01f95913          	srl	s2,s2,0x1f
    cc50:	08078463          	beqz	a5,ccd8 <__divdf3+0x118>
    cc54:	7ff00713          	li	a4,2047
    cc58:	18e78c63          	beq	a5,a4,cdf0 <__divdf3+0x230>
    cc5c:	00341413          	sll	s0,s0,0x3
    cc60:	01da5713          	srl	a4,s4,0x1d
    cc64:	00876733          	or	a4,a4,s0
    cc68:	c0178793          	add	a5,a5,-1023
    cc6c:	00800437          	lui	s0,0x800
    cc70:	40f989b3          	sub	s3,s3,a5
    cc74:	00876433          	or	s0,a4,s0
    cc78:	003a1813          	sll	a6,s4,0x3
    cc7c:	00000793          	li	a5,0
    cc80:	00f00713          	li	a4,15
    cc84:	012aca33          	xor	s4,s5,s2
    cc88:	24976663          	bltu	a4,s1,ced4 <__divdf3+0x314>
    cc8c:	00003697          	auipc	a3,0x3
    cc90:	c9468693          	add	a3,a3,-876 # f920 <__mprec_tens+0xc8>
    cc94:	00249493          	sll	s1,s1,0x2
    cc98:	00d484b3          	add	s1,s1,a3
    cc9c:	0004a703          	lw	a4,0(s1)
    cca0:	00d70733          	add	a4,a4,a3
    cca4:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cca8:	00a4eb33          	or	s6,s1,a0
    ccac:	1c0b1e63          	bnez	s6,ce88 <__divdf3+0x2c8>
    ccb0:	01495793          	srl	a5,s2,0x14
    ccb4:	00c91413          	sll	s0,s2,0xc
    ccb8:	7ff7f793          	and	a5,a5,2047
    ccbc:	00000b93          	li	s7,0
    ccc0:	00800493          	li	s1,8
    ccc4:	7ff00993          	li	s3,2047
    ccc8:	00200c13          	li	s8,2
    cccc:	00c45413          	srl	s0,s0,0xc
    ccd0:	01f95913          	srl	s2,s2,0x1f
    ccd4:	f80790e3          	bnez	a5,cc54 <__divdf3+0x94>
    ccd8:	01446833          	or	a6,s0,s4
    ccdc:	1c080263          	beqz	a6,cea0 <__divdf3+0x2e0>
    cce0:	5c040663          	beqz	s0,d2ac <__divdf3+0x6ec>
    cce4:	00040513          	mv	a0,s0
    cce8:	250020ef          	jal	ef38 <__clzsi2>
    ccec:	00050793          	mv	a5,a0
    ccf0:	ff550693          	add	a3,a0,-11
    ccf4:	01d00713          	li	a4,29
    ccf8:	ff878813          	add	a6,a5,-8
    ccfc:	40d70733          	sub	a4,a4,a3
    cd00:	01041433          	sll	s0,s0,a6
    cd04:	00ea5733          	srl	a4,s4,a4
    cd08:	00876433          	or	s0,a4,s0
    cd0c:	010a1833          	sll	a6,s4,a6
    cd10:	013787b3          	add	a5,a5,s3
    cd14:	3f378993          	add	s3,a5,1011
    cd18:	00000793          	li	a5,0
    cd1c:	f65ff06f          	j	cc80 <__divdf3+0xc0>
    cd20:	40f70733          	sub	a4,a4,a5
    cd24:	03800693          	li	a3,56
    cd28:	60e6d063          	bge	a3,a4,d328 <__divdf3+0x768>
    cd2c:	00000793          	li	a5,0
    cd30:	00000693          	li	a3,0
    cd34:	00000713          	li	a4,0
    cd38:	04c12083          	lw	ra,76(sp)
    cd3c:	04812403          	lw	s0,72(sp)
    cd40:	01479793          	sll	a5,a5,0x14
    cd44:	00d7e7b3          	or	a5,a5,a3
    cd48:	01fa1693          	sll	a3,s4,0x1f
    cd4c:	00d7e7b3          	or	a5,a5,a3
    cd50:	04412483          	lw	s1,68(sp)
    cd54:	04012903          	lw	s2,64(sp)
    cd58:	03c12983          	lw	s3,60(sp)
    cd5c:	03812a03          	lw	s4,56(sp)
    cd60:	03412a83          	lw	s5,52(sp)
    cd64:	03012b03          	lw	s6,48(sp)
    cd68:	02c12b83          	lw	s7,44(sp)
    cd6c:	02812c03          	lw	s8,40(sp)
    cd70:	00070513          	mv	a0,a4
    cd74:	00078593          	mv	a1,a5
    cd78:	05010113          	add	sp,sp,80
    cd7c:	00008067          	ret
    cd80:	7ff00793          	li	a5,2047
    cd84:	00000693          	li	a3,0
    cd88:	00000713          	li	a4,0
    cd8c:	fadff06f          	j	cd38 <__divdf3+0x178>
    cd90:	00000a13          	li	s4,0
    cd94:	7ff00793          	li	a5,2047
    cd98:	000806b7          	lui	a3,0x80
    cd9c:	00000713          	li	a4,0
    cda0:	f99ff06f          	j	cd38 <__divdf3+0x178>
    cda4:	00a4eb33          	or	s6,s1,a0
    cda8:	100b0c63          	beqz	s6,cec0 <__divdf3+0x300>
    cdac:	52048463          	beqz	s1,d2d4 <__divdf3+0x714>
    cdb0:	00048513          	mv	a0,s1
    cdb4:	184020ef          	jal	ef38 <__clzsi2>
    cdb8:	00050713          	mv	a4,a0
    cdbc:	ff550793          	add	a5,a0,-11
    cdc0:	01d00b13          	li	s6,29
    cdc4:	ff870b93          	add	s7,a4,-8
    cdc8:	40fb0b33          	sub	s6,s6,a5
    cdcc:	017494b3          	sll	s1,s1,s7
    cdd0:	01645b33          	srl	s6,s0,s6
    cdd4:	009b6b33          	or	s6,s6,s1
    cdd8:	01741bb3          	sll	s7,s0,s7
    cddc:	c0d00793          	li	a5,-1011
    cde0:	40e789b3          	sub	s3,a5,a4
    cde4:	00000493          	li	s1,0
    cde8:	00000c13          	li	s8,0
    cdec:	e51ff06f          	j	cc3c <__divdf3+0x7c>
    cdf0:	01446833          	or	a6,s0,s4
    cdf4:	80198993          	add	s3,s3,-2047
    cdf8:	0a081c63          	bnez	a6,ceb0 <__divdf3+0x2f0>
    cdfc:	0024e493          	or	s1,s1,2
    ce00:	00000413          	li	s0,0
    ce04:	00200793          	li	a5,2
    ce08:	e79ff06f          	j	cc80 <__divdf3+0xc0>
    ce0c:	000a8913          	mv	s2,s5
    ce10:	000b0413          	mv	s0,s6
    ce14:	000b8813          	mv	a6,s7
    ce18:	00200793          	li	a5,2
    ce1c:	60fc0863          	beq	s8,a5,d42c <__divdf3+0x86c>
    ce20:	00300793          	li	a5,3
    ce24:	f6fc06e3          	beq	s8,a5,cd90 <__divdf3+0x1d0>
    ce28:	00100793          	li	a5,1
    ce2c:	00090a13          	mv	s4,s2
    ce30:	eefc0ee3          	beq	s8,a5,cd2c <__divdf3+0x16c>
    ce34:	3ff98793          	add	a5,s3,1023
    ce38:	3cf05263          	blez	a5,d1fc <__divdf3+0x63c>
    ce3c:	00787713          	and	a4,a6,7
    ce40:	5c071663          	bnez	a4,d40c <__divdf3+0x84c>
    ce44:	00741713          	sll	a4,s0,0x7
    ce48:	00075a63          	bgez	a4,ce5c <__divdf3+0x29c>
    ce4c:	ff0007b7          	lui	a5,0xff000
    ce50:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    ce54:	00f47433          	and	s0,s0,a5
    ce58:	40098793          	add	a5,s3,1024
    ce5c:	7fe00713          	li	a4,2046
    ce60:	f2f740e3          	blt	a4,a5,cd80 <__divdf3+0x1c0>
    ce64:	00385813          	srl	a6,a6,0x3
    ce68:	01d41713          	sll	a4,s0,0x1d
    ce6c:	00941693          	sll	a3,s0,0x9
    ce70:	01076733          	or	a4,a4,a6
    ce74:	00c6d693          	srl	a3,a3,0xc
    ce78:	7ff7f793          	and	a5,a5,2047
    ce7c:	ebdff06f          	j	cd38 <__divdf3+0x178>
    ce80:	00078c13          	mv	s8,a5
    ce84:	f95ff06f          	j	ce18 <__divdf3+0x258>
    ce88:	00048b13          	mv	s6,s1
    ce8c:	00050b93          	mv	s7,a0
    ce90:	00c00493          	li	s1,12
    ce94:	7ff00993          	li	s3,2047
    ce98:	00300c13          	li	s8,3
    ce9c:	da1ff06f          	j	cc3c <__divdf3+0x7c>
    cea0:	0014e493          	or	s1,s1,1
    cea4:	00000413          	li	s0,0
    cea8:	00100793          	li	a5,1
    ceac:	dd5ff06f          	j	cc80 <__divdf3+0xc0>
    ceb0:	0034e493          	or	s1,s1,3
    ceb4:	000a0813          	mv	a6,s4
    ceb8:	00300793          	li	a5,3
    cebc:	dc5ff06f          	j	cc80 <__divdf3+0xc0>
    cec0:	00000b93          	li	s7,0
    cec4:	00400493          	li	s1,4
    cec8:	00000993          	li	s3,0
    cecc:	00100c13          	li	s8,1
    ced0:	d6dff06f          	j	cc3c <__divdf3+0x7c>
    ced4:	03912223          	sw	s9,36(sp)
    ced8:	03a12023          	sw	s10,32(sp)
    cedc:	01b12e23          	sw	s11,28(sp)
    cee0:	3b646a63          	bltu	s0,s6,d294 <__divdf3+0x6d4>
    cee4:	3a8b0663          	beq	s6,s0,d290 <__divdf3+0x6d0>
    cee8:	fff98993          	add	s3,s3,-1
    ceec:	000b8c13          	mv	s8,s7
    cef0:	000b0493          	mv	s1,s6
    cef4:	00000d13          	li	s10,0
    cef8:	01885c93          	srl	s9,a6,0x18
    cefc:	00841413          	sll	s0,s0,0x8
    cf00:	01045913          	srl	s2,s0,0x10
    cf04:	008cecb3          	or	s9,s9,s0
    cf08:	00090593          	mv	a1,s2
    cf0c:	00048513          	mv	a0,s1
    cf10:	010c9b13          	sll	s6,s9,0x10
    cf14:	00881a93          	sll	s5,a6,0x8
    cf18:	010b5b13          	srl	s6,s6,0x10
    cf1c:	771010ef          	jal	ee8c <__hidden___udivsi3>
    cf20:	00050593          	mv	a1,a0
    cf24:	00050413          	mv	s0,a0
    cf28:	000b0513          	mv	a0,s6
    cf2c:	69d010ef          	jal	edc8 <__mulsi3>
    cf30:	00050793          	mv	a5,a0
    cf34:	00090593          	mv	a1,s2
    cf38:	00048513          	mv	a0,s1
    cf3c:	00078493          	mv	s1,a5
    cf40:	795010ef          	jal	eed4 <__umodsi3>
    cf44:	01051513          	sll	a0,a0,0x10
    cf48:	010c5793          	srl	a5,s8,0x10
    cf4c:	00a7e7b3          	or	a5,a5,a0
    cf50:	0097fa63          	bgeu	a5,s1,cf64 <__divdf3+0x3a4>
    cf54:	00fc87b3          	add	a5,s9,a5
    cf58:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cf5c:	3b97fe63          	bgeu	a5,s9,d318 <__divdf3+0x758>
    cf60:	00070413          	mv	s0,a4
    cf64:	409784b3          	sub	s1,a5,s1
    cf68:	00090593          	mv	a1,s2
    cf6c:	00048513          	mv	a0,s1
    cf70:	71d010ef          	jal	ee8c <__hidden___udivsi3>
    cf74:	00050593          	mv	a1,a0
    cf78:	00050b93          	mv	s7,a0
    cf7c:	000b0513          	mv	a0,s6
    cf80:	649010ef          	jal	edc8 <__mulsi3>
    cf84:	00050793          	mv	a5,a0
    cf88:	00090593          	mv	a1,s2
    cf8c:	00048513          	mv	a0,s1
    cf90:	00078493          	mv	s1,a5
    cf94:	741010ef          	jal	eed4 <__umodsi3>
    cf98:	010c1793          	sll	a5,s8,0x10
    cf9c:	01051513          	sll	a0,a0,0x10
    cfa0:	0107d793          	srl	a5,a5,0x10
    cfa4:	00a7e7b3          	or	a5,a5,a0
    cfa8:	0097fa63          	bgeu	a5,s1,cfbc <__divdf3+0x3fc>
    cfac:	00fc87b3          	add	a5,s9,a5
    cfb0:	fffb8713          	add	a4,s7,-1
    cfb4:	3597fa63          	bgeu	a5,s9,d308 <__divdf3+0x748>
    cfb8:	00070b93          	mv	s7,a4
    cfbc:	00010337          	lui	t1,0x10
    cfc0:	01041413          	sll	s0,s0,0x10
    cfc4:	01746433          	or	s0,s0,s7
    cfc8:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    cfcc:	01b478b3          	and	a7,s0,s11
    cfd0:	01bafdb3          	and	s11,s5,s11
    cfd4:	40978bb3          	sub	s7,a5,s1
    cfd8:	010adc13          	srl	s8,s5,0x10
    cfdc:	01045793          	srl	a5,s0,0x10
    cfe0:	00088513          	mv	a0,a7
    cfe4:	000d8593          	mv	a1,s11
    cfe8:	5e1010ef          	jal	edc8 <__mulsi3>
    cfec:	00050813          	mv	a6,a0
    cff0:	000c0593          	mv	a1,s8
    cff4:	00088513          	mv	a0,a7
    cff8:	5d1010ef          	jal	edc8 <__mulsi3>
    cffc:	00050893          	mv	a7,a0
    d000:	000d8593          	mv	a1,s11
    d004:	00078513          	mv	a0,a5
    d008:	5c1010ef          	jal	edc8 <__mulsi3>
    d00c:	00050e13          	mv	t3,a0
    d010:	000c0593          	mv	a1,s8
    d014:	00078513          	mv	a0,a5
    d018:	5b1010ef          	jal	edc8 <__mulsi3>
    d01c:	01085793          	srl	a5,a6,0x10
    d020:	01c888b3          	add	a7,a7,t3
    d024:	011787b3          	add	a5,a5,a7
    d028:	01c7f463          	bgeu	a5,t3,d030 <__divdf3+0x470>
    d02c:	00650533          	add	a0,a0,t1
    d030:	00010637          	lui	a2,0x10
    d034:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    d038:	00c7f4b3          	and	s1,a5,a2
    d03c:	0107d693          	srl	a3,a5,0x10
    d040:	01049493          	sll	s1,s1,0x10
    d044:	00c87833          	and	a6,a6,a2
    d048:	00a687b3          	add	a5,a3,a0
    d04c:	010484b3          	add	s1,s1,a6
    d050:	20fbea63          	bltu	s7,a5,d264 <__divdf3+0x6a4>
    d054:	20fb8663          	beq	s7,a5,d260 <__divdf3+0x6a0>
    d058:	409d04b3          	sub	s1,s10,s1
    d05c:	40fb8bb3          	sub	s7,s7,a5
    d060:	009d3d33          	sltu	s10,s10,s1
    d064:	41ab8bb3          	sub	s7,s7,s10
    d068:	377c8a63          	beq	s9,s7,d3dc <__divdf3+0x81c>
    d06c:	00090593          	mv	a1,s2
    d070:	000b8513          	mv	a0,s7
    d074:	619010ef          	jal	ee8c <__hidden___udivsi3>
    d078:	00050593          	mv	a1,a0
    d07c:	00a12623          	sw	a0,12(sp)
    d080:	00050d13          	mv	s10,a0
    d084:	000b0513          	mv	a0,s6
    d088:	541010ef          	jal	edc8 <__mulsi3>
    d08c:	00050793          	mv	a5,a0
    d090:	00090593          	mv	a1,s2
    d094:	000b8513          	mv	a0,s7
    d098:	00078b93          	mv	s7,a5
    d09c:	639010ef          	jal	eed4 <__umodsi3>
    d0a0:	01051513          	sll	a0,a0,0x10
    d0a4:	0104d793          	srl	a5,s1,0x10
    d0a8:	00a7e7b3          	or	a5,a5,a0
    d0ac:	0377f063          	bgeu	a5,s7,d0cc <__divdf3+0x50c>
    d0b0:	00fc87b3          	add	a5,s9,a5
    d0b4:	fffd0693          	add	a3,s10,-1
    d0b8:	3797e263          	bltu	a5,s9,d41c <__divdf3+0x85c>
    d0bc:	3777f063          	bgeu	a5,s7,d41c <__divdf3+0x85c>
    d0c0:	ffed0713          	add	a4,s10,-2
    d0c4:	00e12623          	sw	a4,12(sp)
    d0c8:	019787b3          	add	a5,a5,s9
    d0cc:	41778bb3          	sub	s7,a5,s7
    d0d0:	00090593          	mv	a1,s2
    d0d4:	000b8513          	mv	a0,s7
    d0d8:	5b5010ef          	jal	ee8c <__hidden___udivsi3>
    d0dc:	00050593          	mv	a1,a0
    d0e0:	00050d13          	mv	s10,a0
    d0e4:	000b0513          	mv	a0,s6
    d0e8:	4e1010ef          	jal	edc8 <__mulsi3>
    d0ec:	00050793          	mv	a5,a0
    d0f0:	00090593          	mv	a1,s2
    d0f4:	000b8513          	mv	a0,s7
    d0f8:	00078913          	mv	s2,a5
    d0fc:	01049493          	sll	s1,s1,0x10
    d100:	5d5010ef          	jal	eed4 <__umodsi3>
    d104:	01051513          	sll	a0,a0,0x10
    d108:	0104d493          	srl	s1,s1,0x10
    d10c:	00a4e4b3          	or	s1,s1,a0
    d110:	0124fe63          	bgeu	s1,s2,d12c <__divdf3+0x56c>
    d114:	009c84b3          	add	s1,s9,s1
    d118:	fffd0793          	add	a5,s10,-1
    d11c:	3194e463          	bltu	s1,s9,d424 <__divdf3+0x864>
    d120:	3124f263          	bgeu	s1,s2,d424 <__divdf3+0x864>
    d124:	ffed0d13          	add	s10,s10,-2
    d128:	019484b3          	add	s1,s1,s9
    d12c:	00c12783          	lw	a5,12(sp)
    d130:	412484b3          	sub	s1,s1,s2
    d134:	000d8593          	mv	a1,s11
    d138:	01079813          	sll	a6,a5,0x10
    d13c:	01a86833          	or	a6,a6,s10
    d140:	01081313          	sll	t1,a6,0x10
    d144:	01035313          	srl	t1,t1,0x10
    d148:	01085793          	srl	a5,a6,0x10
    d14c:	00030513          	mv	a0,t1
    d150:	479010ef          	jal	edc8 <__mulsi3>
    d154:	00050893          	mv	a7,a0
    d158:	000c0593          	mv	a1,s8
    d15c:	00030513          	mv	a0,t1
    d160:	469010ef          	jal	edc8 <__mulsi3>
    d164:	00050313          	mv	t1,a0
    d168:	000d8593          	mv	a1,s11
    d16c:	00078513          	mv	a0,a5
    d170:	459010ef          	jal	edc8 <__mulsi3>
    d174:	00050e13          	mv	t3,a0
    d178:	000c0593          	mv	a1,s8
    d17c:	00078513          	mv	a0,a5
    d180:	449010ef          	jal	edc8 <__mulsi3>
    d184:	0108d793          	srl	a5,a7,0x10
    d188:	01c30333          	add	t1,t1,t3
    d18c:	006787b3          	add	a5,a5,t1
    d190:	01c7f663          	bgeu	a5,t3,d19c <__divdf3+0x5dc>
    d194:	00010737          	lui	a4,0x10
    d198:	00e50533          	add	a0,a0,a4
    d19c:	000106b7          	lui	a3,0x10
    d1a0:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    d1a4:	0107d713          	srl	a4,a5,0x10
    d1a8:	00d7f7b3          	and	a5,a5,a3
    d1ac:	01079793          	sll	a5,a5,0x10
    d1b0:	00d8f8b3          	and	a7,a7,a3
    d1b4:	00a70733          	add	a4,a4,a0
    d1b8:	011787b3          	add	a5,a5,a7
    d1bc:	02e4e063          	bltu	s1,a4,d1dc <__divdf3+0x61c>
    d1c0:	00e48c63          	beq	s1,a4,d1d8 <__divdf3+0x618>
    d1c4:	02412c83          	lw	s9,36(sp)
    d1c8:	02012d03          	lw	s10,32(sp)
    d1cc:	01c12d83          	lw	s11,28(sp)
    d1d0:	00186813          	or	a6,a6,1
    d1d4:	c61ff06f          	j	ce34 <__divdf3+0x274>
    d1d8:	1c078a63          	beqz	a5,d3ac <__divdf3+0x7ec>
    d1dc:	009c84b3          	add	s1,s9,s1
    d1e0:	fff80613          	add	a2,a6,-1
    d1e4:	00048693          	mv	a3,s1
    d1e8:	1b94ec63          	bltu	s1,s9,d3a0 <__divdf3+0x7e0>
    d1ec:	24e4ea63          	bltu	s1,a4,d440 <__divdf3+0x880>
    d1f0:	26e48863          	beq	s1,a4,d460 <__divdf3+0x8a0>
    d1f4:	00060813          	mv	a6,a2
    d1f8:	fcdff06f          	j	d1c4 <__divdf3+0x604>
    d1fc:	00100713          	li	a4,1
    d200:	b20790e3          	bnez	a5,cd20 <__divdf3+0x160>
    d204:	41e98793          	add	a5,s3,1054
    d208:	00f816b3          	sll	a3,a6,a5
    d20c:	00d036b3          	snez	a3,a3
    d210:	00f417b3          	sll	a5,s0,a5
    d214:	00f6e7b3          	or	a5,a3,a5
    d218:	00e85833          	srl	a6,a6,a4
    d21c:	00f86833          	or	a6,a6,a5
    d220:	00787793          	and	a5,a6,7
    d224:	00e45433          	srl	s0,s0,a4
    d228:	02078063          	beqz	a5,d248 <__divdf3+0x688>
    d22c:	00f87793          	and	a5,a6,15
    d230:	00400713          	li	a4,4
    d234:	00e78a63          	beq	a5,a4,d248 <__divdf3+0x688>
    d238:	00480793          	add	a5,a6,4
    d23c:	0107b833          	sltu	a6,a5,a6
    d240:	01040433          	add	s0,s0,a6
    d244:	00078813          	mv	a6,a5
    d248:	00841613          	sll	a2,s0,0x8
    d24c:	00100793          	li	a5,1
    d250:	00000693          	li	a3,0
    d254:	00000713          	li	a4,0
    d258:	ae0640e3          	bltz	a2,cd38 <__divdf3+0x178>
    d25c:	1280006f          	j	d384 <__divdf3+0x7c4>
    d260:	de9d7ce3          	bgeu	s10,s1,d058 <__divdf3+0x498>
    d264:	015d06b3          	add	a3,s10,s5
    d268:	01a6b633          	sltu	a2,a3,s10
    d26c:	019605b3          	add	a1,a2,s9
    d270:	00bb8bb3          	add	s7,s7,a1
    d274:	00068d13          	mv	s10,a3
    d278:	fff40593          	add	a1,s0,-1
    d27c:	077cfe63          	bgeu	s9,s7,d2f8 <__divdf3+0x738>
    d280:	14fbe063          	bltu	s7,a5,d3c0 <__divdf3+0x800>
    d284:	13778c63          	beq	a5,s7,d3bc <__divdf3+0x7fc>
    d288:	00058413          	mv	s0,a1
    d28c:	dcdff06f          	j	d058 <__divdf3+0x498>
    d290:	c50bece3          	bltu	s7,a6,cee8 <__divdf3+0x328>
    d294:	01fb1c13          	sll	s8,s6,0x1f
    d298:	001bd713          	srl	a4,s7,0x1
    d29c:	001b5493          	srl	s1,s6,0x1
    d2a0:	00ec6c33          	or	s8,s8,a4
    d2a4:	01fb9d13          	sll	s10,s7,0x1f
    d2a8:	c51ff06f          	j	cef8 <__divdf3+0x338>
    d2ac:	000a0513          	mv	a0,s4
    d2b0:	489010ef          	jal	ef38 <__clzsi2>
    d2b4:	01550693          	add	a3,a0,21
    d2b8:	01c00713          	li	a4,28
    d2bc:	02050793          	add	a5,a0,32
    d2c0:	a2d75ae3          	bge	a4,a3,ccf4 <__divdf3+0x134>
    d2c4:	ff850513          	add	a0,a0,-8
    d2c8:	00000813          	li	a6,0
    d2cc:	00aa1433          	sll	s0,s4,a0
    d2d0:	a41ff06f          	j	cd10 <__divdf3+0x150>
    d2d4:	465010ef          	jal	ef38 <__clzsi2>
    d2d8:	01550793          	add	a5,a0,21
    d2dc:	01c00693          	li	a3,28
    d2e0:	02050713          	add	a4,a0,32
    d2e4:	acf6dee3          	bge	a3,a5,cdc0 <__divdf3+0x200>
    d2e8:	ff850493          	add	s1,a0,-8
    d2ec:	00941b33          	sll	s6,s0,s1
    d2f0:	00000b93          	li	s7,0
    d2f4:	ae9ff06f          	j	cddc <__divdf3+0x21c>
    d2f8:	f97c98e3          	bne	s9,s7,d288 <__divdf3+0x6c8>
    d2fc:	f80602e3          	beqz	a2,d280 <__divdf3+0x6c0>
    d300:	00058413          	mv	s0,a1
    d304:	d55ff06f          	j	d058 <__divdf3+0x498>
    d308:	ca97f8e3          	bgeu	a5,s1,cfb8 <__divdf3+0x3f8>
    d30c:	ffeb8b93          	add	s7,s7,-2
    d310:	019787b3          	add	a5,a5,s9
    d314:	ca9ff06f          	j	cfbc <__divdf3+0x3fc>
    d318:	c497f4e3          	bgeu	a5,s1,cf60 <__divdf3+0x3a0>
    d31c:	ffe40413          	add	s0,s0,-2
    d320:	019787b3          	add	a5,a5,s9
    d324:	c41ff06f          	j	cf64 <__divdf3+0x3a4>
    d328:	01f00693          	li	a3,31
    d32c:	ece6dce3          	bge	a3,a4,d204 <__divdf3+0x644>
    d330:	fe100693          	li	a3,-31
    d334:	40f686b3          	sub	a3,a3,a5
    d338:	02000793          	li	a5,32
    d33c:	00d456b3          	srl	a3,s0,a3
    d340:	00f70863          	beq	a4,a5,d350 <__divdf3+0x790>
    d344:	43e98793          	add	a5,s3,1086
    d348:	00f417b3          	sll	a5,s0,a5
    d34c:	00f86833          	or	a6,a6,a5
    d350:	01003833          	snez	a6,a6
    d354:	00d86833          	or	a6,a6,a3
    d358:	00787713          	and	a4,a6,7
    d35c:	00000693          	li	a3,0
    d360:	02070863          	beqz	a4,d390 <__divdf3+0x7d0>
    d364:	00f87793          	and	a5,a6,15
    d368:	00400713          	li	a4,4
    d36c:	00000413          	li	s0,0
    d370:	00e78a63          	beq	a5,a4,d384 <__divdf3+0x7c4>
    d374:	00480793          	add	a5,a6,4
    d378:	0107b833          	sltu	a6,a5,a6
    d37c:	01003433          	snez	s0,a6
    d380:	00078813          	mv	a6,a5
    d384:	00941693          	sll	a3,s0,0x9
    d388:	01d41713          	sll	a4,s0,0x1d
    d38c:	00c6d693          	srl	a3,a3,0xc
    d390:	00385813          	srl	a6,a6,0x3
    d394:	00e86733          	or	a4,a6,a4
    d398:	00000793          	li	a5,0
    d39c:	99dff06f          	j	cd38 <__divdf3+0x178>
    d3a0:	00060813          	mv	a6,a2
    d3a4:	e2e690e3          	bne	a3,a4,d1c4 <__divdf3+0x604>
    d3a8:	e1579ee3          	bne	a5,s5,d1c4 <__divdf3+0x604>
    d3ac:	02412c83          	lw	s9,36(sp)
    d3b0:	02012d03          	lw	s10,32(sp)
    d3b4:	01c12d83          	lw	s11,28(sp)
    d3b8:	a7dff06f          	j	ce34 <__divdf3+0x274>
    d3bc:	ec96f6e3          	bgeu	a3,s1,d288 <__divdf3+0x6c8>
    d3c0:	00da86b3          	add	a3,s5,a3
    d3c4:	0156b633          	sltu	a2,a3,s5
    d3c8:	01960633          	add	a2,a2,s9
    d3cc:	ffe40413          	add	s0,s0,-2
    d3d0:	00068d13          	mv	s10,a3
    d3d4:	00cb8bb3          	add	s7,s7,a2
    d3d8:	c81ff06f          	j	d058 <__divdf3+0x498>
    d3dc:	c0200713          	li	a4,-1022
    d3e0:	02412c83          	lw	s9,36(sp)
    d3e4:	02012d03          	lw	s10,32(sp)
    d3e8:	01c12d83          	lw	s11,28(sp)
    d3ec:	3ff98793          	add	a5,s3,1023
    d3f0:	fff00813          	li	a6,-1
    d3f4:	e0e9c4e3          	blt	s3,a4,d1fc <__divdf3+0x63c>
    d3f8:	00480713          	add	a4,a6,4
    d3fc:	01073833          	sltu	a6,a4,a6
    d400:	01040433          	add	s0,s0,a6
    d404:	00070813          	mv	a6,a4
    d408:	a3dff06f          	j	ce44 <__divdf3+0x284>
    d40c:	00f87713          	and	a4,a6,15
    d410:	00400693          	li	a3,4
    d414:	a2d708e3          	beq	a4,a3,ce44 <__divdf3+0x284>
    d418:	fe1ff06f          	j	d3f8 <__divdf3+0x838>
    d41c:	00d12623          	sw	a3,12(sp)
    d420:	cadff06f          	j	d0cc <__divdf3+0x50c>
    d424:	00078d13          	mv	s10,a5
    d428:	d05ff06f          	j	d12c <__divdf3+0x56c>
    d42c:	00090a13          	mv	s4,s2
    d430:	7ff00793          	li	a5,2047
    d434:	00000693          	li	a3,0
    d438:	00000713          	li	a4,0
    d43c:	8fdff06f          	j	cd38 <__divdf3+0x178>
    d440:	001a9613          	sll	a2,s5,0x1
    d444:	015636b3          	sltu	a3,a2,s5
    d448:	019686b3          	add	a3,a3,s9
    d44c:	00d486b3          	add	a3,s1,a3
    d450:	ffe80813          	add	a6,a6,-2
    d454:	00060a93          	mv	s5,a2
    d458:	f4e688e3          	beq	a3,a4,d3a8 <__divdf3+0x7e8>
    d45c:	d69ff06f          	j	d1c4 <__divdf3+0x604>
    d460:	fefae0e3          	bltu	s5,a5,d440 <__divdf3+0x880>
    d464:	00060813          	mv	a6,a2
    d468:	f41ff06f          	j	d3a8 <__divdf3+0x7e8>

0000d46c <__eqdf2>:
    d46c:	0145d713          	srl	a4,a1,0x14
    d470:	001007b7          	lui	a5,0x100
    d474:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d478:	0146d813          	srl	a6,a3,0x14
    d47c:	7ff77713          	and	a4,a4,2047
    d480:	7ff00313          	li	t1,2047
    d484:	00b7fe33          	and	t3,a5,a1
    d488:	00050893          	mv	a7,a0
    d48c:	00d7f7b3          	and	a5,a5,a3
    d490:	01f5d593          	srl	a1,a1,0x1f
    d494:	7ff87813          	and	a6,a6,2047
    d498:	01f6d693          	srl	a3,a3,0x1f
    d49c:	00100513          	li	a0,1
    d4a0:	00670c63          	beq	a4,t1,d4b8 <__eqdf2+0x4c>
    d4a4:	00680863          	beq	a6,t1,d4b4 <__eqdf2+0x48>
    d4a8:	01071463          	bne	a4,a6,d4b0 <__eqdf2+0x44>
    d4ac:	02fe0663          	beq	t3,a5,d4d8 <__eqdf2+0x6c>
    d4b0:	00008067          	ret
    d4b4:	00008067          	ret
    d4b8:	fee81ce3          	bne	a6,a4,d4b0 <__eqdf2+0x44>
    d4bc:	00fe67b3          	or	a5,t3,a5
    d4c0:	00c7e7b3          	or	a5,a5,a2
    d4c4:	0117e7b3          	or	a5,a5,a7
    d4c8:	fe0794e3          	bnez	a5,d4b0 <__eqdf2+0x44>
    d4cc:	40d585b3          	sub	a1,a1,a3
    d4d0:	00b03533          	snez	a0,a1
    d4d4:	00008067          	ret
    d4d8:	fcc89ce3          	bne	a7,a2,d4b0 <__eqdf2+0x44>
    d4dc:	00d58a63          	beq	a1,a3,d4f0 <__eqdf2+0x84>
    d4e0:	fc0718e3          	bnez	a4,d4b0 <__eqdf2+0x44>
    d4e4:	011e6e33          	or	t3,t3,a7
    d4e8:	01c03533          	snez	a0,t3
    d4ec:	00008067          	ret
    d4f0:	00000513          	li	a0,0
    d4f4:	00008067          	ret

0000d4f8 <__gedf2>:
    d4f8:	0145d893          	srl	a7,a1,0x14
    d4fc:	001007b7          	lui	a5,0x100
    d500:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d504:	0146d713          	srl	a4,a3,0x14
    d508:	7ff8f893          	and	a7,a7,2047
    d50c:	7ff00e13          	li	t3,2047
    d510:	00b7f333          	and	t1,a5,a1
    d514:	00050813          	mv	a6,a0
    d518:	00050e93          	mv	t4,a0
    d51c:	00d7f7b3          	and	a5,a5,a3
    d520:	01f5d593          	srl	a1,a1,0x1f
    d524:	00060f13          	mv	t5,a2
    d528:	7ff77513          	and	a0,a4,2047
    d52c:	01f6d693          	srl	a3,a3,0x1f
    d530:	05c88863          	beq	a7,t3,d580 <__gedf2+0x88>
    d534:	03c50463          	beq	a0,t3,d55c <__gedf2+0x64>
    d538:	06089a63          	bnez	a7,d5ac <__gedf2+0xb4>
    d53c:	01036833          	or	a6,t1,a6
    d540:	06051063          	bnez	a0,d5a0 <__gedf2+0xa8>
    d544:	00c7e633          	or	a2,a5,a2
    d548:	08060c63          	beqz	a2,d5e0 <__gedf2+0xe8>
    d54c:	0a081263          	bnez	a6,d5f0 <__gedf2+0xf8>
    d550:	00100513          	li	a0,1
    d554:	08068263          	beqz	a3,d5d8 <__gedf2+0xe0>
    d558:	00008067          	ret
    d55c:	00c7e633          	or	a2,a5,a2
    d560:	08061463          	bnez	a2,d5e8 <__gedf2+0xf0>
    d564:	00089663          	bnez	a7,d570 <__gedf2+0x78>
    d568:	01036333          	or	t1,t1,a6
    d56c:	fe0302e3          	beqz	t1,d550 <__gedf2+0x58>
    d570:	06d58063          	beq	a1,a3,d5d0 <__gedf2+0xd8>
    d574:	06059263          	bnez	a1,d5d8 <__gedf2+0xe0>
    d578:	00100513          	li	a0,1
    d57c:	00008067          	ret
    d580:	01036333          	or	t1,t1,a6
    d584:	06031263          	bnez	t1,d5e8 <__gedf2+0xf0>
    d588:	ff1516e3          	bne	a0,a7,d574 <__gedf2+0x7c>
    d58c:	00c7e7b3          	or	a5,a5,a2
    d590:	04079c63          	bnez	a5,d5e8 <__gedf2+0xf0>
    d594:	fed590e3          	bne	a1,a3,d574 <__gedf2+0x7c>
    d598:	00000513          	li	a0,0
    d59c:	00008067          	ret
    d5a0:	fa0808e3          	beqz	a6,d550 <__gedf2+0x58>
    d5a4:	fcd598e3          	bne	a1,a3,d574 <__gedf2+0x7c>
    d5a8:	0280006f          	j	d5d0 <__gedf2+0xd8>
    d5ac:	fc0504e3          	beqz	a0,d574 <__gedf2+0x7c>
    d5b0:	fcd592e3          	bne	a1,a3,d574 <__gedf2+0x7c>
    d5b4:	fd1540e3          	blt	a0,a7,d574 <__gedf2+0x7c>
    d5b8:	00a8cc63          	blt	a7,a0,d5d0 <__gedf2+0xd8>
    d5bc:	fa67ece3          	bltu	a5,t1,d574 <__gedf2+0x7c>
    d5c0:	00f31863          	bne	t1,a5,d5d0 <__gedf2+0xd8>
    d5c4:	fbdf68e3          	bltu	t5,t4,d574 <__gedf2+0x7c>
    d5c8:	00000513          	li	a0,0
    d5cc:	f9eef6e3          	bgeu	t4,t5,d558 <__gedf2+0x60>
    d5d0:	00100513          	li	a0,1
    d5d4:	f80592e3          	bnez	a1,d558 <__gedf2+0x60>
    d5d8:	fff00513          	li	a0,-1
    d5dc:	00008067          	ret
    d5e0:	f8081ae3          	bnez	a6,d574 <__gedf2+0x7c>
    d5e4:	00008067          	ret
    d5e8:	ffe00513          	li	a0,-2
    d5ec:	00008067          	ret
    d5f0:	fcd586e3          	beq	a1,a3,d5bc <__gedf2+0xc4>
    d5f4:	f81ff06f          	j	d574 <__gedf2+0x7c>

0000d5f8 <__ledf2>:
    d5f8:	0145d893          	srl	a7,a1,0x14
    d5fc:	001007b7          	lui	a5,0x100
    d600:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d604:	0146d713          	srl	a4,a3,0x14
    d608:	7ff8f893          	and	a7,a7,2047
    d60c:	7ff00313          	li	t1,2047
    d610:	00b7fe33          	and	t3,a5,a1
    d614:	00050813          	mv	a6,a0
    d618:	00050e93          	mv	t4,a0
    d61c:	00d7f7b3          	and	a5,a5,a3
    d620:	01f5d593          	srl	a1,a1,0x1f
    d624:	00060f13          	mv	t5,a2
    d628:	7ff77513          	and	a0,a4,2047
    d62c:	01f6d693          	srl	a3,a3,0x1f
    d630:	04688a63          	beq	a7,t1,d684 <__ledf2+0x8c>
    d634:	02650463          	beq	a0,t1,d65c <__ledf2+0x64>
    d638:	06089863          	bnez	a7,d6a8 <__ledf2+0xb0>
    d63c:	010e6833          	or	a6,t3,a6
    d640:	08051e63          	bnez	a0,d6dc <__ledf2+0xe4>
    d644:	00c7e633          	or	a2,a5,a2
    d648:	0a060463          	beqz	a2,d6f0 <__ledf2+0xf8>
    d64c:	0a081663          	bnez	a6,d6f8 <__ledf2+0x100>
    d650:	00100513          	li	a0,1
    d654:	08068063          	beqz	a3,d6d4 <__ledf2+0xdc>
    d658:	00008067          	ret
    d65c:	00c7e633          	or	a2,a5,a2
    d660:	00200513          	li	a0,2
    d664:	fe061ae3          	bnez	a2,d658 <__ledf2+0x60>
    d668:	00089663          	bnez	a7,d674 <__ledf2+0x7c>
    d66c:	010e6e33          	or	t3,t3,a6
    d670:	fe0e00e3          	beqz	t3,d650 <__ledf2+0x58>
    d674:	04d58c63          	beq	a1,a3,d6cc <__ledf2+0xd4>
    d678:	04059e63          	bnez	a1,d6d4 <__ledf2+0xdc>
    d67c:	00100513          	li	a0,1
    d680:	00008067          	ret
    d684:	010e6e33          	or	t3,t3,a6
    d688:	060e1063          	bnez	t3,d6e8 <__ledf2+0xf0>
    d68c:	ff1516e3          	bne	a0,a7,d678 <__ledf2+0x80>
    d690:	00c7e7b3          	or	a5,a5,a2
    d694:	00200513          	li	a0,2
    d698:	fc0790e3          	bnez	a5,d658 <__ledf2+0x60>
    d69c:	fcd59ee3          	bne	a1,a3,d678 <__ledf2+0x80>
    d6a0:	00000513          	li	a0,0
    d6a4:	00008067          	ret
    d6a8:	fc0508e3          	beqz	a0,d678 <__ledf2+0x80>
    d6ac:	fcd596e3          	bne	a1,a3,d678 <__ledf2+0x80>
    d6b0:	fd1544e3          	blt	a0,a7,d678 <__ledf2+0x80>
    d6b4:	00a8cc63          	blt	a7,a0,d6cc <__ledf2+0xd4>
    d6b8:	fdc7e0e3          	bltu	a5,t3,d678 <__ledf2+0x80>
    d6bc:	00fe1863          	bne	t3,a5,d6cc <__ledf2+0xd4>
    d6c0:	fbdf6ce3          	bltu	t5,t4,d678 <__ledf2+0x80>
    d6c4:	00000513          	li	a0,0
    d6c8:	f9eef8e3          	bgeu	t4,t5,d658 <__ledf2+0x60>
    d6cc:	00100513          	li	a0,1
    d6d0:	f80594e3          	bnez	a1,d658 <__ledf2+0x60>
    d6d4:	fff00513          	li	a0,-1
    d6d8:	00008067          	ret
    d6dc:	f6080ae3          	beqz	a6,d650 <__ledf2+0x58>
    d6e0:	f8d59ce3          	bne	a1,a3,d678 <__ledf2+0x80>
    d6e4:	fe9ff06f          	j	d6cc <__ledf2+0xd4>
    d6e8:	00200513          	li	a0,2
    d6ec:	00008067          	ret
    d6f0:	f80814e3          	bnez	a6,d678 <__ledf2+0x80>
    d6f4:	00008067          	ret
    d6f8:	fcd580e3          	beq	a1,a3,d6b8 <__ledf2+0xc0>
    d6fc:	f7dff06f          	j	d678 <__ledf2+0x80>

0000d700 <__muldf3>:
    d700:	fd010113          	add	sp,sp,-48
    d704:	0145d793          	srl	a5,a1,0x14
    d708:	02812423          	sw	s0,40(sp)
    d70c:	02912223          	sw	s1,36(sp)
    d710:	03212023          	sw	s2,32(sp)
    d714:	01312e23          	sw	s3,28(sp)
    d718:	01512a23          	sw	s5,20(sp)
    d71c:	00c59493          	sll	s1,a1,0xc
    d720:	02112623          	sw	ra,44(sp)
    d724:	01412c23          	sw	s4,24(sp)
    d728:	01612823          	sw	s6,16(sp)
    d72c:	01712623          	sw	s7,12(sp)
    d730:	01812423          	sw	s8,8(sp)
    d734:	7ff7f793          	and	a5,a5,2047
    d738:	00050413          	mv	s0,a0
    d73c:	00060a93          	mv	s5,a2
    d740:	00068993          	mv	s3,a3
    d744:	00c4d493          	srl	s1,s1,0xc
    d748:	01f5d913          	srl	s2,a1,0x1f
    d74c:	4e078063          	beqz	a5,dc2c <__muldf3+0x52c>
    d750:	7ff00713          	li	a4,2047
    d754:	0ae78663          	beq	a5,a4,d800 <__muldf3+0x100>
    d758:	00349693          	sll	a3,s1,0x3
    d75c:	01d55713          	srl	a4,a0,0x1d
    d760:	00d76733          	or	a4,a4,a3
    d764:	008006b7          	lui	a3,0x800
    d768:	00d764b3          	or	s1,a4,a3
    d76c:	00351a13          	sll	s4,a0,0x3
    d770:	c0178c13          	add	s8,a5,-1023
    d774:	00000b13          	li	s6,0
    d778:	00000b93          	li	s7,0
    d77c:	0149d793          	srl	a5,s3,0x14
    d780:	00c99713          	sll	a4,s3,0xc
    d784:	7ff7f793          	and	a5,a5,2047
    d788:	000a8e13          	mv	t3,s5
    d78c:	00c75413          	srl	s0,a4,0xc
    d790:	01f9d993          	srl	s3,s3,0x1f
    d794:	0a078063          	beqz	a5,d834 <__muldf3+0x134>
    d798:	7ff00713          	li	a4,2047
    d79c:	14e78e63          	beq	a5,a4,d8f8 <__muldf3+0x1f8>
    d7a0:	00341713          	sll	a4,s0,0x3
    d7a4:	01dad693          	srl	a3,s5,0x1d
    d7a8:	00e6e6b3          	or	a3,a3,a4
    d7ac:	c0178793          	add	a5,a5,-1023
    d7b0:	00800737          	lui	a4,0x800
    d7b4:	00e6e433          	or	s0,a3,a4
    d7b8:	003a9e13          	sll	t3,s5,0x3
    d7bc:	01878333          	add	t1,a5,s8
    d7c0:	00000693          	li	a3,0
    d7c4:	00a00793          	li	a5,10
    d7c8:	00130893          	add	a7,t1,1
    d7cc:	0b67cc63          	blt	a5,s6,d884 <__muldf3+0x184>
    d7d0:	013945b3          	xor	a1,s2,s3
    d7d4:	00200793          	li	a5,2
    d7d8:	00058813          	mv	a6,a1
    d7dc:	1567c663          	blt	a5,s6,d928 <__muldf3+0x228>
    d7e0:	fffb0b13          	add	s6,s6,-1
    d7e4:	00100713          	li	a4,1
    d7e8:	17676063          	bltu	a4,s6,d948 <__muldf3+0x248>
    d7ec:	48f68663          	beq	a3,a5,dc78 <__muldf3+0x578>
    d7f0:	00040493          	mv	s1,s0
    d7f4:	000e0a13          	mv	s4,t3
    d7f8:	00068b93          	mv	s7,a3
    d7fc:	09c0006f          	j	d898 <__muldf3+0x198>
    d800:	00a4ea33          	or	s4,s1,a0
    d804:	480a1463          	bnez	s4,dc8c <__muldf3+0x58c>
    d808:	0149d793          	srl	a5,s3,0x14
    d80c:	00c99713          	sll	a4,s3,0xc
    d810:	7ff7f793          	and	a5,a5,2047
    d814:	00000493          	li	s1,0
    d818:	00800b13          	li	s6,8
    d81c:	7ff00c13          	li	s8,2047
    d820:	00200b93          	li	s7,2
    d824:	000a8e13          	mv	t3,s5
    d828:	00c75413          	srl	s0,a4,0xc
    d82c:	01f9d993          	srl	s3,s3,0x1f
    d830:	f60794e3          	bnez	a5,d798 <__muldf3+0x98>
    d834:	015467b3          	or	a5,s0,s5
    d838:	46078e63          	beqz	a5,dcb4 <__muldf3+0x5b4>
    d83c:	54040c63          	beqz	s0,dd94 <__muldf3+0x694>
    d840:	00040513          	mv	a0,s0
    d844:	6f4010ef          	jal	ef38 <__clzsi2>
    d848:	00050313          	mv	t1,a0
    d84c:	ff550713          	add	a4,a0,-11
    d850:	01d00793          	li	a5,29
    d854:	ff830e13          	add	t3,t1,-8
    d858:	40e787b3          	sub	a5,a5,a4
    d85c:	00fad7b3          	srl	a5,s5,a5
    d860:	01c41733          	sll	a4,s0,t3
    d864:	00e7e433          	or	s0,a5,a4
    d868:	01ca9e33          	sll	t3,s5,t3
    d86c:	406c0333          	sub	t1,s8,t1
    d870:	c0d30313          	add	t1,t1,-1011
    d874:	00a00793          	li	a5,10
    d878:	00000693          	li	a3,0
    d87c:	00130893          	add	a7,t1,1
    d880:	f567d8e3          	bge	a5,s6,d7d0 <__muldf3+0xd0>
    d884:	00090593          	mv	a1,s2
    d888:	00200793          	li	a5,2
    d88c:	3efb8663          	beq	s7,a5,dc78 <__muldf3+0x578>
    d890:	00300793          	li	a5,3
    d894:	54fb8863          	beq	s7,a5,dde4 <__muldf3+0x6e4>
    d898:	00100793          	li	a5,1
    d89c:	00058813          	mv	a6,a1
    d8a0:	52fb9663          	bne	s7,a5,ddcc <__muldf3+0x6cc>
    d8a4:	00000793          	li	a5,0
    d8a8:	00000693          	li	a3,0
    d8ac:	00000713          	li	a4,0
    d8b0:	02c12083          	lw	ra,44(sp)
    d8b4:	02812403          	lw	s0,40(sp)
    d8b8:	01479793          	sll	a5,a5,0x14
    d8bc:	00d7e7b3          	or	a5,a5,a3
    d8c0:	01f81813          	sll	a6,a6,0x1f
    d8c4:	0107e7b3          	or	a5,a5,a6
    d8c8:	02412483          	lw	s1,36(sp)
    d8cc:	02012903          	lw	s2,32(sp)
    d8d0:	01c12983          	lw	s3,28(sp)
    d8d4:	01812a03          	lw	s4,24(sp)
    d8d8:	01412a83          	lw	s5,20(sp)
    d8dc:	01012b03          	lw	s6,16(sp)
    d8e0:	00c12b83          	lw	s7,12(sp)
    d8e4:	00812c03          	lw	s8,8(sp)
    d8e8:	00070513          	mv	a0,a4
    d8ec:	00078593          	mv	a1,a5
    d8f0:	03010113          	add	sp,sp,48
    d8f4:	00008067          	ret
    d8f8:	01546733          	or	a4,s0,s5
    d8fc:	7ffc0313          	add	t1,s8,2047
    d900:	3c070663          	beqz	a4,dccc <__muldf3+0x5cc>
    d904:	00001737          	lui	a4,0x1
    d908:	01394833          	xor	a6,s2,s3
    d90c:	80070713          	add	a4,a4,-2048 # 800 <gemm_cfs_tiles.constprop.0+0x368>
    d910:	003b6b13          	or	s6,s6,3
    d914:	00a00693          	li	a3,10
    d918:	00080593          	mv	a1,a6
    d91c:	00ec08b3          	add	a7,s8,a4
    d920:	4366cc63          	blt	a3,s6,dd58 <__muldf3+0x658>
    d924:	00300693          	li	a3,3
    d928:	00100613          	li	a2,1
    d92c:	01661633          	sll	a2,a2,s6
    d930:	53067713          	and	a4,a2,1328
    d934:	f4071ae3          	bnez	a4,d888 <__muldf3+0x188>
    d938:	24067793          	and	a5,a2,576
    d93c:	48079063          	bnez	a5,ddbc <__muldf3+0x6bc>
    d940:	08867613          	and	a2,a2,136
    d944:	38061e63          	bnez	a2,dce0 <__muldf3+0x5e0>
    d948:	00010fb7          	lui	t6,0x10
    d94c:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    d950:	005a7f33          	and	t5,s4,t0
    d954:	005e72b3          	and	t0,t3,t0
    d958:	010a5a13          	srl	s4,s4,0x10
    d95c:	010e5e13          	srl	t3,t3,0x10
    d960:	000f0513          	mv	a0,t5
    d964:	00028593          	mv	a1,t0
    d968:	460010ef          	jal	edc8 <__mulsi3>
    d96c:	00050713          	mv	a4,a0
    d970:	000e0593          	mv	a1,t3
    d974:	000f0513          	mv	a0,t5
    d978:	450010ef          	jal	edc8 <__mulsi3>
    d97c:	00050793          	mv	a5,a0
    d980:	00028593          	mv	a1,t0
    d984:	000a0513          	mv	a0,s4
    d988:	440010ef          	jal	edc8 <__mulsi3>
    d98c:	00050e93          	mv	t4,a0
    d990:	000e0593          	mv	a1,t3
    d994:	000a0513          	mv	a0,s4
    d998:	430010ef          	jal	edc8 <__mulsi3>
    d99c:	01d786b3          	add	a3,a5,t4
    d9a0:	01075393          	srl	t2,a4,0x10
    d9a4:	00d383b3          	add	t2,t2,a3
    d9a8:	00050793          	mv	a5,a0
    d9ac:	01d3f463          	bgeu	t2,t4,d9b4 <__muldf3+0x2b4>
    d9b0:	01f507b3          	add	a5,a0,t6
    d9b4:	000109b7          	lui	s3,0x10
    d9b8:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    d9bc:	0123feb3          	and	t4,t2,s2
    d9c0:	01277733          	and	a4,a4,s2
    d9c4:	010e9e93          	sll	t4,t4,0x10
    d9c8:	01247933          	and	s2,s0,s2
    d9cc:	0103d393          	srl	t2,t2,0x10
    d9d0:	00ee8eb3          	add	t4,t4,a4
    d9d4:	01045413          	srl	s0,s0,0x10
    d9d8:	000f0513          	mv	a0,t5
    d9dc:	00090593          	mv	a1,s2
    d9e0:	3e8010ef          	jal	edc8 <__mulsi3>
    d9e4:	00050f93          	mv	t6,a0
    d9e8:	00040593          	mv	a1,s0
    d9ec:	000f0513          	mv	a0,t5
    d9f0:	3d8010ef          	jal	edc8 <__mulsi3>
    d9f4:	00050713          	mv	a4,a0
    d9f8:	00090593          	mv	a1,s2
    d9fc:	000a0513          	mv	a0,s4
    da00:	3c8010ef          	jal	edc8 <__mulsi3>
    da04:	00050f13          	mv	t5,a0
    da08:	00040593          	mv	a1,s0
    da0c:	000a0513          	mv	a0,s4
    da10:	3b8010ef          	jal	edc8 <__mulsi3>
    da14:	010fd693          	srl	a3,t6,0x10
    da18:	01e70733          	add	a4,a4,t5
    da1c:	00e686b3          	add	a3,a3,a4
    da20:	01e6f463          	bgeu	a3,t5,da28 <__muldf3+0x328>
    da24:	01350533          	add	a0,a0,s3
    da28:	00010a37          	lui	s4,0x10
    da2c:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    da30:	01e6f733          	and	a4,a3,t5
    da34:	01efffb3          	and	t6,t6,t5
    da38:	01071713          	sll	a4,a4,0x10
    da3c:	01f70733          	add	a4,a4,t6
    da40:	01e4ff33          	and	t5,s1,t5
    da44:	0106d693          	srl	a3,a3,0x10
    da48:	00a68fb3          	add	t6,a3,a0
    da4c:	00e383b3          	add	t2,t2,a4
    da50:	0104d493          	srl	s1,s1,0x10
    da54:	000f0513          	mv	a0,t5
    da58:	00028593          	mv	a1,t0
    da5c:	36c010ef          	jal	edc8 <__mulsi3>
    da60:	00050a93          	mv	s5,a0
    da64:	000e0593          	mv	a1,t3
    da68:	000f0513          	mv	a0,t5
    da6c:	35c010ef          	jal	edc8 <__mulsi3>
    da70:	00050993          	mv	s3,a0
    da74:	00028593          	mv	a1,t0
    da78:	00048513          	mv	a0,s1
    da7c:	34c010ef          	jal	edc8 <__mulsi3>
    da80:	00050293          	mv	t0,a0
    da84:	000e0593          	mv	a1,t3
    da88:	00048513          	mv	a0,s1
    da8c:	33c010ef          	jal	edc8 <__mulsi3>
    da90:	010ad613          	srl	a2,s5,0x10
    da94:	005989b3          	add	s3,s3,t0
    da98:	01360633          	add	a2,a2,s3
    da9c:	00567463          	bgeu	a2,t0,daa4 <__muldf3+0x3a4>
    daa0:	01450533          	add	a0,a0,s4
    daa4:	00010a37          	lui	s4,0x10
    daa8:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    daac:	00d672b3          	and	t0,a2,a3
    dab0:	00dafab3          	and	s5,s5,a3
    dab4:	01065613          	srl	a2,a2,0x10
    dab8:	01029293          	sll	t0,t0,0x10
    dabc:	00a60e33          	add	t3,a2,a0
    dac0:	015282b3          	add	t0,t0,s5
    dac4:	000f0513          	mv	a0,t5
    dac8:	00090593          	mv	a1,s2
    dacc:	2fc010ef          	jal	edc8 <__mulsi3>
    dad0:	00050993          	mv	s3,a0
    dad4:	00040593          	mv	a1,s0
    dad8:	000f0513          	mv	a0,t5
    dadc:	2ec010ef          	jal	edc8 <__mulsi3>
    dae0:	00050f13          	mv	t5,a0
    dae4:	00090593          	mv	a1,s2
    dae8:	00048513          	mv	a0,s1
    daec:	2dc010ef          	jal	edc8 <__mulsi3>
    daf0:	00050913          	mv	s2,a0
    daf4:	00040593          	mv	a1,s0
    daf8:	00048513          	mv	a0,s1
    dafc:	2cc010ef          	jal	edc8 <__mulsi3>
    db00:	012f06b3          	add	a3,t5,s2
    db04:	0109d593          	srl	a1,s3,0x10
    db08:	00d58433          	add	s0,a1,a3
    db0c:	00050f13          	mv	t5,a0
    db10:	01247463          	bgeu	s0,s2,db18 <__muldf3+0x418>
    db14:	01450f33          	add	t5,a0,s4
    db18:	00010637          	lui	a2,0x10
    db1c:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x59f>
    db20:	00c476b3          	and	a3,s0,a2
    db24:	00c9f9b3          	and	s3,s3,a2
    db28:	01069693          	sll	a3,a3,0x10
    db2c:	007787b3          	add	a5,a5,t2
    db30:	013686b3          	add	a3,a3,s3
    db34:	01f685b3          	add	a1,a3,t6
    db38:	00e7b733          	sltu	a4,a5,a4
    db3c:	00e58733          	add	a4,a1,a4
    db40:	005782b3          	add	t0,a5,t0
    db44:	01c70633          	add	a2,a4,t3
    db48:	00f2b7b3          	sltu	a5,t0,a5
    db4c:	00f607b3          	add	a5,a2,a5
    db50:	00d5b6b3          	sltu	a3,a1,a3
    db54:	00b735b3          	sltu	a1,a4,a1
    db58:	00b6e6b3          	or	a3,a3,a1
    db5c:	00e63733          	sltu	a4,a2,a4
    db60:	01045593          	srl	a1,s0,0x10
    db64:	00c7b633          	sltu	a2,a5,a2
    db68:	00b686b3          	add	a3,a3,a1
    db6c:	00929a13          	sll	s4,t0,0x9
    db70:	00c76733          	or	a4,a4,a2
    db74:	00d70733          	add	a4,a4,a3
    db78:	01da6a33          	or	s4,s4,t4
    db7c:	01e70733          	add	a4,a4,t5
    db80:	01403a33          	snez	s4,s4
    db84:	0172d293          	srl	t0,t0,0x17
    db88:	00971713          	sll	a4,a4,0x9
    db8c:	0177d693          	srl	a3,a5,0x17
    db90:	005a6a33          	or	s4,s4,t0
    db94:	00979793          	sll	a5,a5,0x9
    db98:	00fa6a33          	or	s4,s4,a5
    db9c:	00771793          	sll	a5,a4,0x7
    dba0:	00d764b3          	or	s1,a4,a3
    dba4:	0207d063          	bgez	a5,dbc4 <__muldf3+0x4c4>
    dba8:	001a5793          	srl	a5,s4,0x1
    dbac:	001a7a13          	and	s4,s4,1
    dbb0:	01f49713          	sll	a4,s1,0x1f
    dbb4:	0147e7b3          	or	a5,a5,s4
    dbb8:	00e7ea33          	or	s4,a5,a4
    dbbc:	0014d493          	srl	s1,s1,0x1
    dbc0:	00088313          	mv	t1,a7
    dbc4:	3ff30793          	add	a5,t1,1023
    dbc8:	12f05663          	blez	a5,dcf4 <__muldf3+0x5f4>
    dbcc:	007a7713          	and	a4,s4,7
    dbd0:	02070063          	beqz	a4,dbf0 <__muldf3+0x4f0>
    dbd4:	00fa7713          	and	a4,s4,15
    dbd8:	00400693          	li	a3,4
    dbdc:	00d70a63          	beq	a4,a3,dbf0 <__muldf3+0x4f0>
    dbe0:	004a0713          	add	a4,s4,4
    dbe4:	01473a33          	sltu	s4,a4,s4
    dbe8:	014484b3          	add	s1,s1,s4
    dbec:	00070a13          	mv	s4,a4
    dbf0:	00749713          	sll	a4,s1,0x7
    dbf4:	00075a63          	bgez	a4,dc08 <__muldf3+0x508>
    dbf8:	ff0007b7          	lui	a5,0xff000
    dbfc:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    dc00:	00f4f4b3          	and	s1,s1,a5
    dc04:	40030793          	add	a5,t1,1024
    dc08:	7fe00713          	li	a4,2046
    dc0c:	1cf74463          	blt	a4,a5,ddd4 <__muldf3+0x6d4>
    dc10:	003a5a13          	srl	s4,s4,0x3
    dc14:	01d49713          	sll	a4,s1,0x1d
    dc18:	00949693          	sll	a3,s1,0x9
    dc1c:	01476733          	or	a4,a4,s4
    dc20:	00c6d693          	srl	a3,a3,0xc
    dc24:	7ff7f793          	and	a5,a5,2047
    dc28:	c89ff06f          	j	d8b0 <__muldf3+0x1b0>
    dc2c:	00a4ea33          	or	s4,s1,a0
    dc30:	060a0863          	beqz	s4,dca0 <__muldf3+0x5a0>
    dc34:	12048e63          	beqz	s1,dd70 <__muldf3+0x670>
    dc38:	00048513          	mv	a0,s1
    dc3c:	2fc010ef          	jal	ef38 <__clzsi2>
    dc40:	00050713          	mv	a4,a0
    dc44:	ff550693          	add	a3,a0,-11
    dc48:	01d00793          	li	a5,29
    dc4c:	ff870a13          	add	s4,a4,-8
    dc50:	40d787b3          	sub	a5,a5,a3
    dc54:	00f457b3          	srl	a5,s0,a5
    dc58:	014496b3          	sll	a3,s1,s4
    dc5c:	00d7e4b3          	or	s1,a5,a3
    dc60:	01441a33          	sll	s4,s0,s4
    dc64:	c0d00793          	li	a5,-1011
    dc68:	40e78c33          	sub	s8,a5,a4
    dc6c:	00000b13          	li	s6,0
    dc70:	00000b93          	li	s7,0
    dc74:	b09ff06f          	j	d77c <__muldf3+0x7c>
    dc78:	00058813          	mv	a6,a1
    dc7c:	7ff00793          	li	a5,2047
    dc80:	00000693          	li	a3,0
    dc84:	00000713          	li	a4,0
    dc88:	c29ff06f          	j	d8b0 <__muldf3+0x1b0>
    dc8c:	00050a13          	mv	s4,a0
    dc90:	00c00b13          	li	s6,12
    dc94:	7ff00c13          	li	s8,2047
    dc98:	00300b93          	li	s7,3
    dc9c:	ae1ff06f          	j	d77c <__muldf3+0x7c>
    dca0:	00000493          	li	s1,0
    dca4:	00400b13          	li	s6,4
    dca8:	00000c13          	li	s8,0
    dcac:	00100b93          	li	s7,1
    dcb0:	acdff06f          	j	d77c <__muldf3+0x7c>
    dcb4:	001b6b13          	or	s6,s6,1
    dcb8:	000c0313          	mv	t1,s8
    dcbc:	00000413          	li	s0,0
    dcc0:	00000e13          	li	t3,0
    dcc4:	00100693          	li	a3,1
    dcc8:	afdff06f          	j	d7c4 <__muldf3+0xc4>
    dccc:	002b6b13          	or	s6,s6,2
    dcd0:	00000413          	li	s0,0
    dcd4:	00000e13          	li	t3,0
    dcd8:	00200693          	li	a3,2
    dcdc:	ae9ff06f          	j	d7c4 <__muldf3+0xc4>
    dce0:	00040493          	mv	s1,s0
    dce4:	000e0a13          	mv	s4,t3
    dce8:	00068b93          	mv	s7,a3
    dcec:	00098593          	mv	a1,s3
    dcf0:	b99ff06f          	j	d888 <__muldf3+0x188>
    dcf4:	00100713          	li	a4,1
    dcf8:	10079063          	bnez	a5,ddf8 <__muldf3+0x6f8>
    dcfc:	41e30313          	add	t1,t1,1054
    dd00:	006a1633          	sll	a2,s4,t1
    dd04:	00c03633          	snez	a2,a2
    dd08:	00649333          	sll	t1,s1,t1
    dd0c:	00ea5a33          	srl	s4,s4,a4
    dd10:	00666633          	or	a2,a2,t1
    dd14:	01466633          	or	a2,a2,s4
    dd18:	00767793          	and	a5,a2,7
    dd1c:	00e4d5b3          	srl	a1,s1,a4
    dd20:	02078063          	beqz	a5,dd40 <__muldf3+0x640>
    dd24:	00f67793          	and	a5,a2,15
    dd28:	00400713          	li	a4,4
    dd2c:	00e78a63          	beq	a5,a4,dd40 <__muldf3+0x640>
    dd30:	00460793          	add	a5,a2,4
    dd34:	00c7b633          	sltu	a2,a5,a2
    dd38:	00c585b3          	add	a1,a1,a2
    dd3c:	00078613          	mv	a2,a5
    dd40:	00859513          	sll	a0,a1,0x8
    dd44:	00100793          	li	a5,1
    dd48:	00000693          	li	a3,0
    dd4c:	00000713          	li	a4,0
    dd50:	b60540e3          	bltz	a0,d8b0 <__muldf3+0x1b0>
    dd54:	10c0006f          	j	de60 <__muldf3+0x760>
    dd58:	00f00713          	li	a4,15
    dd5c:	12eb1063          	bne	s6,a4,de7c <__muldf3+0x77c>
    dd60:	00000813          	li	a6,0
    dd64:	000806b7          	lui	a3,0x80
    dd68:	00000713          	li	a4,0
    dd6c:	b45ff06f          	j	d8b0 <__muldf3+0x1b0>
    dd70:	1c8010ef          	jal	ef38 <__clzsi2>
    dd74:	01550693          	add	a3,a0,21
    dd78:	01c00793          	li	a5,28
    dd7c:	02050713          	add	a4,a0,32
    dd80:	ecd7d4e3          	bge	a5,a3,dc48 <__muldf3+0x548>
    dd84:	ff850513          	add	a0,a0,-8
    dd88:	00000a13          	li	s4,0
    dd8c:	00a414b3          	sll	s1,s0,a0
    dd90:	ed5ff06f          	j	dc64 <__muldf3+0x564>
    dd94:	000a8513          	mv	a0,s5
    dd98:	1a0010ef          	jal	ef38 <__clzsi2>
    dd9c:	01550713          	add	a4,a0,21
    dda0:	01c00793          	li	a5,28
    dda4:	02050313          	add	t1,a0,32
    dda8:	aae7d4e3          	bge	a5,a4,d850 <__muldf3+0x150>
    ddac:	ff850513          	add	a0,a0,-8
    ddb0:	00000e13          	li	t3,0
    ddb4:	00aa9433          	sll	s0,s5,a0
    ddb8:	ab5ff06f          	j	d86c <__muldf3+0x16c>
    ddbc:	00000813          	li	a6,0
    ddc0:	7ff00793          	li	a5,2047
    ddc4:	000806b7          	lui	a3,0x80
    ddc8:	ae9ff06f          	j	d8b0 <__muldf3+0x1b0>
    ddcc:	00088313          	mv	t1,a7
    ddd0:	df5ff06f          	j	dbc4 <__muldf3+0x4c4>
    ddd4:	7ff00793          	li	a5,2047
    ddd8:	00000693          	li	a3,0
    dddc:	00000713          	li	a4,0
    dde0:	ad1ff06f          	j	d8b0 <__muldf3+0x1b0>
    dde4:	00000813          	li	a6,0
    dde8:	7ff00793          	li	a5,2047
    ddec:	000806b7          	lui	a3,0x80
    ddf0:	00000713          	li	a4,0
    ddf4:	abdff06f          	j	d8b0 <__muldf3+0x1b0>
    ddf8:	40f70733          	sub	a4,a4,a5
    ddfc:	03800693          	li	a3,56
    de00:	aae6c2e3          	blt	a3,a4,d8a4 <__muldf3+0x1a4>
    de04:	01f00693          	li	a3,31
    de08:	eee6dae3          	bge	a3,a4,dcfc <__muldf3+0x5fc>
    de0c:	fe100693          	li	a3,-31
    de10:	40f687b3          	sub	a5,a3,a5
    de14:	02000693          	li	a3,32
    de18:	00f4d7b3          	srl	a5,s1,a5
    de1c:	00d70863          	beq	a4,a3,de2c <__muldf3+0x72c>
    de20:	43e30313          	add	t1,t1,1086
    de24:	00649333          	sll	t1,s1,t1
    de28:	006a6a33          	or	s4,s4,t1
    de2c:	01403633          	snez	a2,s4
    de30:	00f66633          	or	a2,a2,a5
    de34:	00767713          	and	a4,a2,7
    de38:	00000693          	li	a3,0
    de3c:	02070863          	beqz	a4,de6c <__muldf3+0x76c>
    de40:	00f67793          	and	a5,a2,15
    de44:	00400713          	li	a4,4
    de48:	00000593          	li	a1,0
    de4c:	00e78a63          	beq	a5,a4,de60 <__muldf3+0x760>
    de50:	00460793          	add	a5,a2,4
    de54:	00c7b633          	sltu	a2,a5,a2
    de58:	00c035b3          	snez	a1,a2
    de5c:	00078613          	mv	a2,a5
    de60:	00959693          	sll	a3,a1,0x9
    de64:	01d59713          	sll	a4,a1,0x1d
    de68:	00c6d693          	srl	a3,a3,0xc
    de6c:	00365613          	srl	a2,a2,0x3
    de70:	00e66733          	or	a4,a2,a4
    de74:	00000793          	li	a5,0
    de78:	a39ff06f          	j	d8b0 <__muldf3+0x1b0>
    de7c:	00040493          	mv	s1,s0
    de80:	000a8a13          	mv	s4,s5
    de84:	00300b93          	li	s7,3
    de88:	00098593          	mv	a1,s3
    de8c:	9fdff06f          	j	d888 <__muldf3+0x188>

0000de90 <__subdf3>:
    de90:	001007b7          	lui	a5,0x100
    de94:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    de98:	fe010113          	add	sp,sp,-32
    de9c:	00b7f8b3          	and	a7,a5,a1
    dea0:	00d7f833          	and	a6,a5,a3
    dea4:	0146d793          	srl	a5,a3,0x14
    dea8:	00389893          	sll	a7,a7,0x3
    deac:	00812c23          	sw	s0,24(sp)
    deb0:	01312623          	sw	s3,12(sp)
    deb4:	01f5d413          	srl	s0,a1,0x1f
    deb8:	0145d993          	srl	s3,a1,0x14
    debc:	01d55713          	srl	a4,a0,0x1d
    dec0:	00381813          	sll	a6,a6,0x3
    dec4:	01d65593          	srl	a1,a2,0x1d
    dec8:	00112e23          	sw	ra,28(sp)
    decc:	00912a23          	sw	s1,20(sp)
    ded0:	01212823          	sw	s2,16(sp)
    ded4:	7ff7ff13          	and	t5,a5,2047
    ded8:	7ff00313          	li	t1,2047
    dedc:	01176733          	or	a4,a4,a7
    dee0:	7ff9f993          	and	s3,s3,2047
    dee4:	00040e13          	mv	t3,s0
    dee8:	00351893          	sll	a7,a0,0x3
    deec:	01f6d693          	srl	a3,a3,0x1f
    def0:	0105e5b3          	or	a1,a1,a6
    def4:	00361e93          	sll	t4,a2,0x3
    def8:	206f0c63          	beq	t5,t1,e110 <__subdf3+0x280>
    defc:	0016c693          	xor	a3,a3,1
    df00:	41e987b3          	sub	a5,s3,t5
    df04:	16d40263          	beq	s0,a3,e068 <__subdf3+0x1d8>
    df08:	00f05ae3          	blez	a5,e71c <__subdf3+0x88c>
    df0c:	240f0a63          	beqz	t5,e160 <__subdf3+0x2d0>
    df10:	3c698463          	beq	s3,t1,e2d8 <__subdf3+0x448>
    df14:	03800693          	li	a3,56
    df18:	00100513          	li	a0,1
    df1c:	02f6ce63          	blt	a3,a5,df58 <__subdf3+0xc8>
    df20:	008006b7          	lui	a3,0x800
    df24:	00d5e5b3          	or	a1,a1,a3
    df28:	01f00693          	li	a3,31
    df2c:	4ef6c463          	blt	a3,a5,e414 <__subdf3+0x584>
    df30:	02000693          	li	a3,32
    df34:	40f686b3          	sub	a3,a3,a5
    df38:	00d59533          	sll	a0,a1,a3
    df3c:	00fed633          	srl	a2,t4,a5
    df40:	00de96b3          	sll	a3,t4,a3
    df44:	00c56533          	or	a0,a0,a2
    df48:	00d036b3          	snez	a3,a3
    df4c:	00f5d7b3          	srl	a5,a1,a5
    df50:	00d56533          	or	a0,a0,a3
    df54:	40f70733          	sub	a4,a4,a5
    df58:	40a88533          	sub	a0,a7,a0
    df5c:	00a8b633          	sltu	a2,a7,a0
    df60:	00050493          	mv	s1,a0
    df64:	40c70933          	sub	s2,a4,a2
    df68:	00891793          	sll	a5,s2,0x8
    df6c:	3407d863          	bgez	a5,e2bc <__subdf3+0x42c>
    df70:	008007b7          	lui	a5,0x800
    df74:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    df78:	00f97933          	and	s2,s2,a5
    df7c:	2e090663          	beqz	s2,e268 <__subdf3+0x3d8>
    df80:	00090513          	mv	a0,s2
    df84:	7b5000ef          	jal	ef38 <__clzsi2>
    df88:	ff850793          	add	a5,a0,-8
    df8c:	02000693          	li	a3,32
    df90:	40f68733          	sub	a4,a3,a5
    df94:	00e4d733          	srl	a4,s1,a4
    df98:	00f91933          	sll	s2,s2,a5
    df9c:	01276733          	or	a4,a4,s2
    dfa0:	00f494b3          	sll	s1,s1,a5
    dfa4:	3f37c463          	blt	a5,s3,e38c <__subdf3+0x4fc>
    dfa8:	413787b3          	sub	a5,a5,s3
    dfac:	00178793          	add	a5,a5,1
    dfb0:	40f686b3          	sub	a3,a3,a5
    dfb4:	00d49633          	sll	a2,s1,a3
    dfb8:	00f4d933          	srl	s2,s1,a5
    dfbc:	00c03633          	snez	a2,a2
    dfc0:	00c96633          	or	a2,s2,a2
    dfc4:	00d716b3          	sll	a3,a4,a3
    dfc8:	00c6e4b3          	or	s1,a3,a2
    dfcc:	00f75933          	srl	s2,a4,a5
    dfd0:	00000993          	li	s3,0
    dfd4:	0074f793          	and	a5,s1,7
    dfd8:	02078063          	beqz	a5,dff8 <__subdf3+0x168>
    dfdc:	00f4f793          	and	a5,s1,15
    dfe0:	00400713          	li	a4,4
    dfe4:	00e78a63          	beq	a5,a4,dff8 <__subdf3+0x168>
    dfe8:	00448793          	add	a5,s1,4
    dfec:	0097b533          	sltu	a0,a5,s1
    dff0:	00a90933          	add	s2,s2,a0
    dff4:	00078493          	mv	s1,a5
    dff8:	00891793          	sll	a5,s2,0x8
    dffc:	6c07d063          	bgez	a5,e6bc <__subdf3+0x82c>
    e000:	00198793          	add	a5,s3,1
    e004:	7ff00713          	li	a4,2047
    e008:	24e78663          	beq	a5,a4,e254 <__subdf3+0x3c4>
    e00c:	ff800737          	lui	a4,0xff800
    e010:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e014:	00e97733          	and	a4,s2,a4
    e018:	7ff7f793          	and	a5,a5,2047
    e01c:	01d71813          	sll	a6,a4,0x1d
    e020:	0034d513          	srl	a0,s1,0x3
    e024:	00971713          	sll	a4,a4,0x9
    e028:	00a86833          	or	a6,a6,a0
    e02c:	00c75713          	srl	a4,a4,0xc
    e030:	00147e13          	and	t3,s0,1
    e034:	01c12083          	lw	ra,28(sp)
    e038:	01812403          	lw	s0,24(sp)
    e03c:	01479793          	sll	a5,a5,0x14
    e040:	00e7e7b3          	or	a5,a5,a4
    e044:	01fe1713          	sll	a4,t3,0x1f
    e048:	00e7e7b3          	or	a5,a5,a4
    e04c:	01412483          	lw	s1,20(sp)
    e050:	01012903          	lw	s2,16(sp)
    e054:	00c12983          	lw	s3,12(sp)
    e058:	00080513          	mv	a0,a6
    e05c:	00078593          	mv	a1,a5
    e060:	02010113          	add	sp,sp,32
    e064:	00008067          	ret
    e068:	70f05263          	blez	a5,e76c <__subdf3+0x8dc>
    e06c:	1c0f1663          	bnez	t5,e238 <__subdf3+0x3a8>
    e070:	01d5e6b3          	or	a3,a1,t4
    e074:	26068e63          	beqz	a3,e2f0 <__subdf3+0x460>
    e078:	fff78693          	add	a3,a5,-1
    e07c:	46068863          	beqz	a3,e4ec <__subdf3+0x65c>
    e080:	24678c63          	beq	a5,t1,e2d8 <__subdf3+0x448>
    e084:	03800793          	li	a5,56
    e088:	00100913          	li	s2,1
    e08c:	02d7cc63          	blt	a5,a3,e0c4 <__subdf3+0x234>
    e090:	00068793          	mv	a5,a3
    e094:	01f00693          	li	a3,31
    e098:	48f6ca63          	blt	a3,a5,e52c <__subdf3+0x69c>
    e09c:	02000693          	li	a3,32
    e0a0:	40f686b3          	sub	a3,a3,a5
    e0a4:	00d59933          	sll	s2,a1,a3
    e0a8:	00fed633          	srl	a2,t4,a5
    e0ac:	00de96b3          	sll	a3,t4,a3
    e0b0:	00c96933          	or	s2,s2,a2
    e0b4:	00d036b3          	snez	a3,a3
    e0b8:	00f5d7b3          	srl	a5,a1,a5
    e0bc:	00d96933          	or	s2,s2,a3
    e0c0:	00f70733          	add	a4,a4,a5
    e0c4:	01190633          	add	a2,s2,a7
    e0c8:	01263933          	sltu	s2,a2,s2
    e0cc:	00060493          	mv	s1,a2
    e0d0:	00e90933          	add	s2,s2,a4
    e0d4:	00891793          	sll	a5,s2,0x8
    e0d8:	1e07d263          	bgez	a5,e2bc <__subdf3+0x42c>
    e0dc:	00198993          	add	s3,s3,1
    e0e0:	7ff00793          	li	a5,2047
    e0e4:	16f98863          	beq	s3,a5,e254 <__subdf3+0x3c4>
    e0e8:	ff8007b7          	lui	a5,0xff800
    e0ec:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0f0:	0014f513          	and	a0,s1,1
    e0f4:	00f977b3          	and	a5,s2,a5
    e0f8:	0014d713          	srl	a4,s1,0x1
    e0fc:	00a76733          	or	a4,a4,a0
    e100:	01f79513          	sll	a0,a5,0x1f
    e104:	00e564b3          	or	s1,a0,a4
    e108:	0017d913          	srl	s2,a5,0x1
    e10c:	ec9ff06f          	j	dfd4 <__subdf3+0x144>
    e110:	01d5e833          	or	a6,a1,t4
    e114:	80198313          	add	t1,s3,-2047
    e118:	06080863          	beqz	a6,e188 <__subdf3+0x2f8>
    e11c:	06d40a63          	beq	s0,a3,e190 <__subdf3+0x300>
    e120:	0e030463          	beqz	t1,e208 <__subdf3+0x378>
    e124:	26098e63          	beqz	s3,e3a0 <__subdf3+0x510>
    e128:	00361513          	sll	a0,a2,0x3
    e12c:	00355513          	srl	a0,a0,0x3
    e130:	00068413          	mv	s0,a3
    e134:	00058713          	mv	a4,a1
    e138:	01d71813          	sll	a6,a4,0x1d
    e13c:	00a86833          	or	a6,a6,a0
    e140:	00375713          	srl	a4,a4,0x3
    e144:	01076733          	or	a4,a4,a6
    e148:	10070663          	beqz	a4,e254 <__subdf3+0x3c4>
    e14c:	00000e13          	li	t3,0
    e150:	7ff00793          	li	a5,2047
    e154:	00080737          	lui	a4,0x80
    e158:	00000813          	li	a6,0
    e15c:	ed9ff06f          	j	e034 <__subdf3+0x1a4>
    e160:	01d5e6b3          	or	a3,a1,t4
    e164:	18068663          	beqz	a3,e2f0 <__subdf3+0x460>
    e168:	fff78693          	add	a3,a5,-1
    e16c:	3a068263          	beqz	a3,e510 <__subdf3+0x680>
    e170:	16678463          	beq	a5,t1,e2d8 <__subdf3+0x448>
    e174:	03800793          	li	a5,56
    e178:	00100513          	li	a0,1
    e17c:	dcd7cee3          	blt	a5,a3,df58 <__subdf3+0xc8>
    e180:	00068793          	mv	a5,a3
    e184:	da5ff06f          	j	df28 <__subdf3+0x98>
    e188:	0016c693          	xor	a3,a3,1
    e18c:	f8d41ae3          	bne	s0,a3,e120 <__subdf3+0x290>
    e190:	18030863          	beqz	t1,e320 <__subdf3+0x490>
    e194:	2c099063          	bnez	s3,e454 <__subdf3+0x5c4>
    e198:	7ff00793          	li	a5,2047
    e19c:	011766b3          	or	a3,a4,a7
    e1a0:	48068863          	beqz	a3,e630 <__subdf3+0x7a0>
    e1a4:	fff78693          	add	a3,a5,-1
    e1a8:	34068263          	beqz	a3,e4ec <__subdf3+0x65c>
    e1ac:	7ff00513          	li	a0,2047
    e1b0:	2aa78263          	beq	a5,a0,e454 <__subdf3+0x5c4>
    e1b4:	03800793          	li	a5,56
    e1b8:	00100913          	li	s2,1
    e1bc:	02d7ca63          	blt	a5,a3,e1f0 <__subdf3+0x360>
    e1c0:	01f00793          	li	a5,31
    e1c4:	4cd7c663          	blt	a5,a3,e690 <__subdf3+0x800>
    e1c8:	02000793          	li	a5,32
    e1cc:	40d787b3          	sub	a5,a5,a3
    e1d0:	00f71933          	sll	s2,a4,a5
    e1d4:	00d8d633          	srl	a2,a7,a3
    e1d8:	00f897b3          	sll	a5,a7,a5
    e1dc:	00c96933          	or	s2,s2,a2
    e1e0:	00f037b3          	snez	a5,a5
    e1e4:	00d756b3          	srl	a3,a4,a3
    e1e8:	00f96933          	or	s2,s2,a5
    e1ec:	00d585b3          	add	a1,a1,a3
    e1f0:	01d90733          	add	a4,s2,t4
    e1f4:	01273933          	sltu	s2,a4,s2
    e1f8:	00070493          	mv	s1,a4
    e1fc:	00b90933          	add	s2,s2,a1
    e200:	000f0993          	mv	s3,t5
    e204:	ed1ff06f          	j	e0d4 <__subdf3+0x244>
    e208:	00198793          	add	a5,s3,1
    e20c:	7fe7f793          	and	a5,a5,2046
    e210:	14079463          	bnez	a5,e358 <__subdf3+0x4c8>
    e214:	01d5e833          	or	a6,a1,t4
    e218:	011767b3          	or	a5,a4,a7
    e21c:	2a099463          	bnez	s3,e4c4 <__subdf3+0x634>
    e220:	38078e63          	beqz	a5,e5bc <__subdf3+0x72c>
    e224:	3c081063          	bnez	a6,e5e4 <__subdf3+0x754>
    e228:	00351513          	sll	a0,a0,0x3
    e22c:	00355913          	srl	s2,a0,0x3
    e230:	00000793          	li	a5,0
    e234:	1140006f          	j	e348 <__subdf3+0x4b8>
    e238:	0a698063          	beq	s3,t1,e2d8 <__subdf3+0x448>
    e23c:	03800693          	li	a3,56
    e240:	00100913          	li	s2,1
    e244:	e8f6c0e3          	blt	a3,a5,e0c4 <__subdf3+0x234>
    e248:	008006b7          	lui	a3,0x800
    e24c:	00d5e5b3          	or	a1,a1,a3
    e250:	e45ff06f          	j	e094 <__subdf3+0x204>
    e254:	00147e13          	and	t3,s0,1
    e258:	7ff00793          	li	a5,2047
    e25c:	00000713          	li	a4,0
    e260:	00000813          	li	a6,0
    e264:	dd1ff06f          	j	e034 <__subdf3+0x1a4>
    e268:	00048513          	mv	a0,s1
    e26c:	4cd000ef          	jal	ef38 <__clzsi2>
    e270:	01850793          	add	a5,a0,24
    e274:	01f00693          	li	a3,31
    e278:	d0f6dae3          	bge	a3,a5,df8c <__subdf3+0xfc>
    e27c:	ff850713          	add	a4,a0,-8
    e280:	00e49733          	sll	a4,s1,a4
    e284:	1b37ce63          	blt	a5,s3,e440 <__subdf3+0x5b0>
    e288:	413789b3          	sub	s3,a5,s3
    e28c:	00198793          	add	a5,s3,1
    e290:	42f6de63          	bge	a3,a5,e6cc <__subdf3+0x83c>
    e294:	fe198993          	add	s3,s3,-31
    e298:	02000693          	li	a3,32
    e29c:	013754b3          	srl	s1,a4,s3
    e2a0:	00d78c63          	beq	a5,a3,e2b8 <__subdf3+0x428>
    e2a4:	04000693          	li	a3,64
    e2a8:	40f687b3          	sub	a5,a3,a5
    e2ac:	00f71733          	sll	a4,a4,a5
    e2b0:	00e03733          	snez	a4,a4
    e2b4:	00e4e4b3          	or	s1,s1,a4
    e2b8:	00000993          	li	s3,0
    e2bc:	0074f793          	and	a5,s1,7
    e2c0:	d0079ee3          	bnez	a5,dfdc <__subdf3+0x14c>
    e2c4:	00098793          	mv	a5,s3
    e2c8:	0034d513          	srl	a0,s1,0x3
    e2cc:	00090713          	mv	a4,s2
    e2d0:	0280006f          	j	e2f8 <__subdf3+0x468>
    e2d4:	e6081ce3          	bnez	a6,e14c <__subdf3+0x2bc>
    e2d8:	00351513          	sll	a0,a0,0x3
    e2dc:	01d71813          	sll	a6,a4,0x1d
    e2e0:	00355513          	srl	a0,a0,0x3
    e2e4:	00a86833          	or	a6,a6,a0
    e2e8:	00375713          	srl	a4,a4,0x3
    e2ec:	e59ff06f          	j	e144 <__subdf3+0x2b4>
    e2f0:	00351513          	sll	a0,a0,0x3
    e2f4:	00355513          	srl	a0,a0,0x3
    e2f8:	01d71813          	sll	a6,a4,0x1d
    e2fc:	7ff00693          	li	a3,2047
    e300:	00a86833          	or	a6,a6,a0
    e304:	00375713          	srl	a4,a4,0x3
    e308:	e2d78ee3          	beq	a5,a3,e144 <__subdf3+0x2b4>
    e30c:	00c71713          	sll	a4,a4,0xc
    e310:	00c75713          	srl	a4,a4,0xc
    e314:	7ff7f793          	and	a5,a5,2047
    e318:	00147e13          	and	t3,s0,1
    e31c:	d19ff06f          	j	e034 <__subdf3+0x1a4>
    e320:	00198693          	add	a3,s3,1
    e324:	7fe6f793          	and	a5,a3,2046
    e328:	12079e63          	bnez	a5,e464 <__subdf3+0x5d4>
    e32c:	011767b3          	or	a5,a4,a7
    e330:	24099a63          	bnez	s3,e584 <__subdf3+0x6f4>
    e334:	30078663          	beqz	a5,e640 <__subdf3+0x7b0>
    e338:	01d5e7b3          	or	a5,a1,t4
    e33c:	30079a63          	bnez	a5,e650 <__subdf3+0x7c0>
    e340:	00351513          	sll	a0,a0,0x3
    e344:	00355913          	srl	s2,a0,0x3
    e348:	01d71813          	sll	a6,a4,0x1d
    e34c:	01286833          	or	a6,a6,s2
    e350:	00375713          	srl	a4,a4,0x3
    e354:	fb9ff06f          	j	e30c <__subdf3+0x47c>
    e358:	41d88833          	sub	a6,a7,t4
    e35c:	0108b7b3          	sltu	a5,a7,a6
    e360:	40b70933          	sub	s2,a4,a1
    e364:	40f90933          	sub	s2,s2,a5
    e368:	00891793          	sll	a5,s2,0x8
    e36c:	00080493          	mv	s1,a6
    e370:	1207c263          	bltz	a5,e494 <__subdf3+0x604>
    e374:	01286833          	or	a6,a6,s2
    e378:	c00812e3          	bnez	a6,df7c <__subdf3+0xec>
    e37c:	00000e13          	li	t3,0
    e380:	00000793          	li	a5,0
    e384:	00000713          	li	a4,0
    e388:	cadff06f          	j	e034 <__subdf3+0x1a4>
    e38c:	ff800937          	lui	s2,0xff800
    e390:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e394:	40f989b3          	sub	s3,s3,a5
    e398:	01277933          	and	s2,a4,s2
    e39c:	c39ff06f          	j	dfd4 <__subdf3+0x144>
    e3a0:	7ff00793          	li	a5,2047
    e3a4:	01176533          	or	a0,a4,a7
    e3a8:	10050463          	beqz	a0,e4b0 <__subdf3+0x620>
    e3ac:	fff78813          	add	a6,a5,-1
    e3b0:	1e080263          	beqz	a6,e594 <__subdf3+0x704>
    e3b4:	7ff00513          	li	a0,2047
    e3b8:	d6a788e3          	beq	a5,a0,e128 <__subdf3+0x298>
    e3bc:	03800793          	li	a5,56
    e3c0:	00068413          	mv	s0,a3
    e3c4:	00100513          	li	a0,1
    e3c8:	0307ca63          	blt	a5,a6,e3fc <__subdf3+0x56c>
    e3cc:	01f00793          	li	a5,31
    e3d0:	1907c463          	blt	a5,a6,e558 <__subdf3+0x6c8>
    e3d4:	02000793          	li	a5,32
    e3d8:	410787b3          	sub	a5,a5,a6
    e3dc:	00f71533          	sll	a0,a4,a5
    e3e0:	0108d6b3          	srl	a3,a7,a6
    e3e4:	00f897b3          	sll	a5,a7,a5
    e3e8:	00d56533          	or	a0,a0,a3
    e3ec:	00f037b3          	snez	a5,a5
    e3f0:	01075833          	srl	a6,a4,a6
    e3f4:	00f56533          	or	a0,a0,a5
    e3f8:	410585b3          	sub	a1,a1,a6
    e3fc:	40ae8533          	sub	a0,t4,a0
    e400:	00aeb733          	sltu	a4,t4,a0
    e404:	00050493          	mv	s1,a0
    e408:	40e58933          	sub	s2,a1,a4
    e40c:	000f0993          	mv	s3,t5
    e410:	b59ff06f          	j	df68 <__subdf3+0xd8>
    e414:	fe078693          	add	a3,a5,-32
    e418:	02000613          	li	a2,32
    e41c:	00d5d6b3          	srl	a3,a1,a3
    e420:	00c78a63          	beq	a5,a2,e434 <__subdf3+0x5a4>
    e424:	04000613          	li	a2,64
    e428:	40f607b3          	sub	a5,a2,a5
    e42c:	00f597b3          	sll	a5,a1,a5
    e430:	00feeeb3          	or	t4,t4,a5
    e434:	01d03533          	snez	a0,t4
    e438:	00d56533          	or	a0,a0,a3
    e43c:	b1dff06f          	j	df58 <__subdf3+0xc8>
    e440:	ff8006b7          	lui	a3,0xff800
    e444:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e448:	40f987b3          	sub	a5,s3,a5
    e44c:	00d77733          	and	a4,a4,a3
    e450:	ef9ff06f          	j	e348 <__subdf3+0x4b8>
    e454:	00361513          	sll	a0,a2,0x3
    e458:	00355513          	srl	a0,a0,0x3
    e45c:	00058713          	mv	a4,a1
    e460:	cd9ff06f          	j	e138 <__subdf3+0x2a8>
    e464:	7ff00793          	li	a5,2047
    e468:	def686e3          	beq	a3,a5,e254 <__subdf3+0x3c4>
    e46c:	01d88eb3          	add	t4,a7,t4
    e470:	011eb633          	sltu	a2,t4,a7
    e474:	00b707b3          	add	a5,a4,a1
    e478:	00c787b3          	add	a5,a5,a2
    e47c:	01f79513          	sll	a0,a5,0x1f
    e480:	001ede93          	srl	t4,t4,0x1
    e484:	01d564b3          	or	s1,a0,t4
    e488:	0017d913          	srl	s2,a5,0x1
    e48c:	00068993          	mv	s3,a3
    e490:	b45ff06f          	j	dfd4 <__subdf3+0x144>
    e494:	411e8633          	sub	a2,t4,a7
    e498:	40e587b3          	sub	a5,a1,a4
    e49c:	00ceb733          	sltu	a4,t4,a2
    e4a0:	00060493          	mv	s1,a2
    e4a4:	40e78933          	sub	s2,a5,a4
    e4a8:	00068413          	mv	s0,a3
    e4ac:	ad1ff06f          	j	df7c <__subdf3+0xec>
    e4b0:	00361613          	sll	a2,a2,0x3
    e4b4:	00365513          	srl	a0,a2,0x3
    e4b8:	00068413          	mv	s0,a3
    e4bc:	00058713          	mv	a4,a1
    e4c0:	e39ff06f          	j	e2f8 <__subdf3+0x468>
    e4c4:	e00798e3          	bnez	a5,e2d4 <__subdf3+0x444>
    e4c8:	22080663          	beqz	a6,e6f4 <__subdf3+0x864>
    e4cc:	0035d713          	srl	a4,a1,0x3
    e4d0:	00361613          	sll	a2,a2,0x3
    e4d4:	01d59593          	sll	a1,a1,0x1d
    e4d8:	00b76733          	or	a4,a4,a1
    e4dc:	00365613          	srl	a2,a2,0x3
    e4e0:	00c76733          	or	a4,a4,a2
    e4e4:	00068413          	mv	s0,a3
    e4e8:	c61ff06f          	j	e148 <__subdf3+0x2b8>
    e4ec:	01d88eb3          	add	t4,a7,t4
    e4f0:	00b705b3          	add	a1,a4,a1
    e4f4:	011eb633          	sltu	a2,t4,a7
    e4f8:	00c58933          	add	s2,a1,a2
    e4fc:	00891793          	sll	a5,s2,0x8
    e500:	000e8493          	mv	s1,t4
    e504:	0a07d863          	bgez	a5,e5b4 <__subdf3+0x724>
    e508:	00200993          	li	s3,2
    e50c:	bddff06f          	j	e0e8 <__subdf3+0x258>
    e510:	41d88eb3          	sub	t4,a7,t4
    e514:	40b705b3          	sub	a1,a4,a1
    e518:	01d8b633          	sltu	a2,a7,t4
    e51c:	000e8493          	mv	s1,t4
    e520:	40c58933          	sub	s2,a1,a2
    e524:	00100993          	li	s3,1
    e528:	a41ff06f          	j	df68 <__subdf3+0xd8>
    e52c:	fe078693          	add	a3,a5,-32
    e530:	02000613          	li	a2,32
    e534:	00d5d6b3          	srl	a3,a1,a3
    e538:	00c78a63          	beq	a5,a2,e54c <__subdf3+0x6bc>
    e53c:	04000613          	li	a2,64
    e540:	40f607b3          	sub	a5,a2,a5
    e544:	00f597b3          	sll	a5,a1,a5
    e548:	00feeeb3          	or	t4,t4,a5
    e54c:	01d03933          	snez	s2,t4
    e550:	00d96933          	or	s2,s2,a3
    e554:	b71ff06f          	j	e0c4 <__subdf3+0x234>
    e558:	fe080793          	add	a5,a6,-32
    e55c:	02000693          	li	a3,32
    e560:	00f757b3          	srl	a5,a4,a5
    e564:	00d80a63          	beq	a6,a3,e578 <__subdf3+0x6e8>
    e568:	04000693          	li	a3,64
    e56c:	410686b3          	sub	a3,a3,a6
    e570:	00d71733          	sll	a4,a4,a3
    e574:	00e8e8b3          	or	a7,a7,a4
    e578:	01103533          	snez	a0,a7
    e57c:	00f56533          	or	a0,a0,a5
    e580:	e7dff06f          	j	e3fc <__subdf3+0x56c>
    e584:	ec0788e3          	beqz	a5,e454 <__subdf3+0x5c4>
    e588:	01d5eeb3          	or	t4,a1,t4
    e58c:	bc0e90e3          	bnez	t4,e14c <__subdf3+0x2bc>
    e590:	d49ff06f          	j	e2d8 <__subdf3+0x448>
    e594:	411e8633          	sub	a2,t4,a7
    e598:	40e585b3          	sub	a1,a1,a4
    e59c:	00ceb733          	sltu	a4,t4,a2
    e5a0:	00060493          	mv	s1,a2
    e5a4:	40e58933          	sub	s2,a1,a4
    e5a8:	00068413          	mv	s0,a3
    e5ac:	00100993          	li	s3,1
    e5b0:	9b9ff06f          	j	df68 <__subdf3+0xd8>
    e5b4:	00100793          	li	a5,1
    e5b8:	d11ff06f          	j	e2c8 <__subdf3+0x438>
    e5bc:	dc0800e3          	beqz	a6,e37c <__subdf3+0x4ec>
    e5c0:	00361613          	sll	a2,a2,0x3
    e5c4:	00365793          	srl	a5,a2,0x3
    e5c8:	01d59813          	sll	a6,a1,0x1d
    e5cc:	00959713          	sll	a4,a1,0x9
    e5d0:	00f86833          	or	a6,a6,a5
    e5d4:	00c75713          	srl	a4,a4,0xc
    e5d8:	00068e13          	mv	t3,a3
    e5dc:	00000793          	li	a5,0
    e5e0:	a55ff06f          	j	e034 <__subdf3+0x1a4>
    e5e4:	41d88933          	sub	s2,a7,t4
    e5e8:	0128b7b3          	sltu	a5,a7,s2
    e5ec:	40b70633          	sub	a2,a4,a1
    e5f0:	40f60633          	sub	a2,a2,a5
    e5f4:	00861793          	sll	a5,a2,0x8
    e5f8:	0e07d263          	bgez	a5,e6dc <__subdf3+0x84c>
    e5fc:	411e8633          	sub	a2,t4,a7
    e600:	40e58733          	sub	a4,a1,a4
    e604:	00cebeb3          	sltu	t4,t4,a2
    e608:	41d70733          	sub	a4,a4,t4
    e60c:	00871793          	sll	a5,a4,0x8
    e610:	00060493          	mv	s1,a2
    e614:	1207de63          	bgez	a5,e750 <__subdf3+0x8c0>
    e618:	ff8007b7          	lui	a5,0xff800
    e61c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e620:	00f77733          	and	a4,a4,a5
    e624:	00068413          	mv	s0,a3
    e628:	00100793          	li	a5,1
    e62c:	9f1ff06f          	j	e01c <__subdf3+0x18c>
    e630:	00361613          	sll	a2,a2,0x3
    e634:	00365513          	srl	a0,a2,0x3
    e638:	00058713          	mv	a4,a1
    e63c:	cbdff06f          	j	e2f8 <__subdf3+0x468>
    e640:	00361613          	sll	a2,a2,0x3
    e644:	00365913          	srl	s2,a2,0x3
    e648:	00058713          	mv	a4,a1
    e64c:	cfdff06f          	j	e348 <__subdf3+0x4b8>
    e650:	01d886b3          	add	a3,a7,t4
    e654:	00b707b3          	add	a5,a4,a1
    e658:	0116b633          	sltu	a2,a3,a7
    e65c:	00c787b3          	add	a5,a5,a2
    e660:	00879713          	sll	a4,a5,0x8
    e664:	0036d813          	srl	a6,a3,0x3
    e668:	08075e63          	bgez	a4,e704 <__subdf3+0x874>
    e66c:	ff800737          	lui	a4,0xff800
    e670:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e674:	00e7f7b3          	and	a5,a5,a4
    e678:	01d79713          	sll	a4,a5,0x1d
    e67c:	00979793          	sll	a5,a5,0x9
    e680:	01076833          	or	a6,a4,a6
    e684:	00c7d713          	srl	a4,a5,0xc
    e688:	00100793          	li	a5,1
    e68c:	9a9ff06f          	j	e034 <__subdf3+0x1a4>
    e690:	fe068793          	add	a5,a3,-32
    e694:	02000613          	li	a2,32
    e698:	00f757b3          	srl	a5,a4,a5
    e69c:	00c68a63          	beq	a3,a2,e6b0 <__subdf3+0x820>
    e6a0:	04000613          	li	a2,64
    e6a4:	40d606b3          	sub	a3,a2,a3
    e6a8:	00d71733          	sll	a4,a4,a3
    e6ac:	00e8e8b3          	or	a7,a7,a4
    e6b0:	01103933          	snez	s2,a7
    e6b4:	00f96933          	or	s2,s2,a5
    e6b8:	b39ff06f          	j	e1f0 <__subdf3+0x360>
    e6bc:	0034d513          	srl	a0,s1,0x3
    e6c0:	00098793          	mv	a5,s3
    e6c4:	00090713          	mv	a4,s2
    e6c8:	c31ff06f          	j	e2f8 <__subdf3+0x468>
    e6cc:	02000693          	li	a3,32
    e6d0:	40f686b3          	sub	a3,a3,a5
    e6d4:	00000613          	li	a2,0
    e6d8:	8e9ff06f          	j	dfc0 <__subdf3+0x130>
    e6dc:	00c96833          	or	a6,s2,a2
    e6e0:	c8080ee3          	beqz	a6,e37c <__subdf3+0x4ec>
    e6e4:	00395913          	srl	s2,s2,0x3
    e6e8:	00000793          	li	a5,0
    e6ec:	00060713          	mv	a4,a2
    e6f0:	c59ff06f          	j	e348 <__subdf3+0x4b8>
    e6f4:	00000e13          	li	t3,0
    e6f8:	7ff00793          	li	a5,2047
    e6fc:	00080737          	lui	a4,0x80
    e700:	935ff06f          	j	e034 <__subdf3+0x1a4>
    e704:	01d79713          	sll	a4,a5,0x1d
    e708:	00979793          	sll	a5,a5,0x9
    e70c:	01076833          	or	a6,a4,a6
    e710:	00c7d713          	srl	a4,a5,0xc
    e714:	00000793          	li	a5,0
    e718:	91dff06f          	j	e034 <__subdf3+0x1a4>
    e71c:	ae0786e3          	beqz	a5,e208 <__subdf3+0x378>
    e720:	413f0833          	sub	a6,t5,s3
    e724:	00080793          	mv	a5,a6
    e728:	c6098ee3          	beqz	s3,e3a4 <__subdf3+0x514>
    e72c:	03800793          	li	a5,56
    e730:	0107ca63          	blt	a5,a6,e744 <__subdf3+0x8b4>
    e734:	008007b7          	lui	a5,0x800
    e738:	00f76733          	or	a4,a4,a5
    e73c:	00068413          	mv	s0,a3
    e740:	c8dff06f          	j	e3cc <__subdf3+0x53c>
    e744:	00068413          	mv	s0,a3
    e748:	00100513          	li	a0,1
    e74c:	cb1ff06f          	j	e3fc <__subdf3+0x56c>
    e750:	01d71813          	sll	a6,a4,0x1d
    e754:	00365613          	srl	a2,a2,0x3
    e758:	00c86833          	or	a6,a6,a2
    e75c:	00375713          	srl	a4,a4,0x3
    e760:	00000793          	li	a5,0
    e764:	00068413          	mv	s0,a3
    e768:	ba5ff06f          	j	e30c <__subdf3+0x47c>
    e76c:	ba078ae3          	beqz	a5,e320 <__subdf3+0x490>
    e770:	413f06b3          	sub	a3,t5,s3
    e774:	00099663          	bnez	s3,e780 <__subdf3+0x8f0>
    e778:	00068793          	mv	a5,a3
    e77c:	a21ff06f          	j	e19c <__subdf3+0x30c>
    e780:	03800793          	li	a5,56
    e784:	00100913          	li	s2,1
    e788:	a6d7c4e3          	blt	a5,a3,e1f0 <__subdf3+0x360>
    e78c:	008007b7          	lui	a5,0x800
    e790:	00f76733          	or	a4,a4,a5
    e794:	a2dff06f          	j	e1c0 <__subdf3+0x330>

0000e798 <__unorddf2>:
    e798:	0145d713          	srl	a4,a1,0x14
    e79c:	001007b7          	lui	a5,0x100
    e7a0:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e7a4:	fff74713          	not	a4,a4
    e7a8:	0146d813          	srl	a6,a3,0x14
    e7ac:	00b7f5b3          	and	a1,a5,a1
    e7b0:	00d7f7b3          	and	a5,a5,a3
    e7b4:	01571693          	sll	a3,a4,0x15
    e7b8:	7ff87813          	and	a6,a6,2047
    e7bc:	02068063          	beqz	a3,e7dc <__unorddf2+0x44>
    e7c0:	7ff00713          	li	a4,2047
    e7c4:	00000513          	li	a0,0
    e7c8:	00e80463          	beq	a6,a4,e7d0 <__unorddf2+0x38>
    e7cc:	00008067          	ret
    e7d0:	00c7e7b3          	or	a5,a5,a2
    e7d4:	00f03533          	snez	a0,a5
    e7d8:	00008067          	ret
    e7dc:	00a5e5b3          	or	a1,a1,a0
    e7e0:	00100513          	li	a0,1
    e7e4:	fc058ee3          	beqz	a1,e7c0 <__unorddf2+0x28>
    e7e8:	00008067          	ret

0000e7ec <__fixdfsi>:
    e7ec:	0145d793          	srl	a5,a1,0x14
    e7f0:	001006b7          	lui	a3,0x100
    e7f4:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e7f8:	7ff7f793          	and	a5,a5,2047
    e7fc:	3fe00613          	li	a2,1022
    e800:	00b77733          	and	a4,a4,a1
    e804:	01f5d593          	srl	a1,a1,0x1f
    e808:	00f65e63          	bge	a2,a5,e824 <__fixdfsi+0x38>
    e80c:	41d00613          	li	a2,1053
    e810:	00f65e63          	bge	a2,a5,e82c <__fixdfsi+0x40>
    e814:	80000537          	lui	a0,0x80000
    e818:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e81c:	00a58533          	add	a0,a1,a0
    e820:	00008067          	ret
    e824:	00000513          	li	a0,0
    e828:	00008067          	ret
    e82c:	43300613          	li	a2,1075
    e830:	40f60633          	sub	a2,a2,a5
    e834:	01f00813          	li	a6,31
    e838:	00d76733          	or	a4,a4,a3
    e83c:	02c85063          	bge	a6,a2,e85c <__fixdfsi+0x70>
    e840:	41300693          	li	a3,1043
    e844:	40f687b3          	sub	a5,a3,a5
    e848:	00f75733          	srl	a4,a4,a5
    e84c:	40e00533          	neg	a0,a4
    e850:	fc059ce3          	bnez	a1,e828 <__fixdfsi+0x3c>
    e854:	00070513          	mv	a0,a4
    e858:	00008067          	ret
    e85c:	bed78793          	add	a5,a5,-1043
    e860:	00f71733          	sll	a4,a4,a5
    e864:	00c55533          	srl	a0,a0,a2
    e868:	00a76733          	or	a4,a4,a0
    e86c:	fe1ff06f          	j	e84c <__fixdfsi+0x60>

0000e870 <__floatsidf>:
    e870:	ff010113          	add	sp,sp,-16
    e874:	00112623          	sw	ra,12(sp)
    e878:	00812423          	sw	s0,8(sp)
    e87c:	00912223          	sw	s1,4(sp)
    e880:	04050a63          	beqz	a0,e8d4 <__floatsidf+0x64>
    e884:	41f55713          	sra	a4,a0,0x1f
    e888:	00a744b3          	xor	s1,a4,a0
    e88c:	40e484b3          	sub	s1,s1,a4
    e890:	00050793          	mv	a5,a0
    e894:	00048513          	mv	a0,s1
    e898:	01f7d413          	srl	s0,a5,0x1f
    e89c:	69c000ef          	jal	ef38 <__clzsi2>
    e8a0:	41e00793          	li	a5,1054
    e8a4:	40a787b3          	sub	a5,a5,a0
    e8a8:	00a00713          	li	a4,10
    e8ac:	7ff7f793          	and	a5,a5,2047
    e8b0:	06a74063          	blt	a4,a0,e910 <__floatsidf+0xa0>
    e8b4:	00b00713          	li	a4,11
    e8b8:	40a70733          	sub	a4,a4,a0
    e8bc:	00e4d733          	srl	a4,s1,a4
    e8c0:	01550513          	add	a0,a0,21
    e8c4:	00c71713          	sll	a4,a4,0xc
    e8c8:	00a494b3          	sll	s1,s1,a0
    e8cc:	00c75713          	srl	a4,a4,0xc
    e8d0:	0140006f          	j	e8e4 <__floatsidf+0x74>
    e8d4:	00000413          	li	s0,0
    e8d8:	00000793          	li	a5,0
    e8dc:	00000713          	li	a4,0
    e8e0:	00000493          	li	s1,0
    e8e4:	01479793          	sll	a5,a5,0x14
    e8e8:	01f41413          	sll	s0,s0,0x1f
    e8ec:	00e7e7b3          	or	a5,a5,a4
    e8f0:	00c12083          	lw	ra,12(sp)
    e8f4:	0087e7b3          	or	a5,a5,s0
    e8f8:	00812403          	lw	s0,8(sp)
    e8fc:	00048513          	mv	a0,s1
    e900:	00078593          	mv	a1,a5
    e904:	00412483          	lw	s1,4(sp)
    e908:	01010113          	add	sp,sp,16
    e90c:	00008067          	ret
    e910:	ff550513          	add	a0,a0,-11
    e914:	00a49733          	sll	a4,s1,a0
    e918:	00c71713          	sll	a4,a4,0xc
    e91c:	00c75713          	srl	a4,a4,0xc
    e920:	00000493          	li	s1,0
    e924:	fc1ff06f          	j	e8e4 <__floatsidf+0x74>

0000e928 <__floatunsidf>:
    e928:	ff010113          	add	sp,sp,-16
    e92c:	00812423          	sw	s0,8(sp)
    e930:	00112623          	sw	ra,12(sp)
    e934:	00050413          	mv	s0,a0
    e938:	04050c63          	beqz	a0,e990 <__floatunsidf+0x68>
    e93c:	5fc000ef          	jal	ef38 <__clzsi2>
    e940:	41e00793          	li	a5,1054
    e944:	40a787b3          	sub	a5,a5,a0
    e948:	00a00713          	li	a4,10
    e94c:	7ff7f793          	and	a5,a5,2047
    e950:	06a74463          	blt	a4,a0,e9b8 <__floatunsidf+0x90>
    e954:	00b00713          	li	a4,11
    e958:	40a70733          	sub	a4,a4,a0
    e95c:	01550513          	add	a0,a0,21
    e960:	00e45733          	srl	a4,s0,a4
    e964:	00a41433          	sll	s0,s0,a0
    e968:	00c12083          	lw	ra,12(sp)
    e96c:	00040513          	mv	a0,s0
    e970:	00c71713          	sll	a4,a4,0xc
    e974:	00812403          	lw	s0,8(sp)
    e978:	00c75713          	srl	a4,a4,0xc
    e97c:	01479793          	sll	a5,a5,0x14
    e980:	00e7e7b3          	or	a5,a5,a4
    e984:	00078593          	mv	a1,a5
    e988:	01010113          	add	sp,sp,16
    e98c:	00008067          	ret
    e990:	00c12083          	lw	ra,12(sp)
    e994:	00040513          	mv	a0,s0
    e998:	00000793          	li	a5,0
    e99c:	00812403          	lw	s0,8(sp)
    e9a0:	00000713          	li	a4,0
    e9a4:	01479793          	sll	a5,a5,0x14
    e9a8:	00e7e7b3          	or	a5,a5,a4
    e9ac:	00078593          	mv	a1,a5
    e9b0:	01010113          	add	sp,sp,16
    e9b4:	00008067          	ret
    e9b8:	ff550513          	add	a0,a0,-11
    e9bc:	00a41733          	sll	a4,s0,a0
    e9c0:	00000413          	li	s0,0
    e9c4:	00c12083          	lw	ra,12(sp)
    e9c8:	00040513          	mv	a0,s0
    e9cc:	00c71713          	sll	a4,a4,0xc
    e9d0:	00812403          	lw	s0,8(sp)
    e9d4:	00c75713          	srl	a4,a4,0xc
    e9d8:	01479793          	sll	a5,a5,0x14
    e9dc:	00e7e7b3          	or	a5,a5,a4
    e9e0:	00078593          	mv	a1,a5
    e9e4:	01010113          	add	sp,sp,16
    e9e8:	00008067          	ret

0000e9ec <__trunctfdf2>:
    e9ec:	00c52583          	lw	a1,12(a0)
    e9f0:	00852783          	lw	a5,8(a0)
    e9f4:	00052803          	lw	a6,0(a0)
    e9f8:	00452683          	lw	a3,4(a0)
    e9fc:	01059613          	sll	a2,a1,0x10
    ea00:	fe010113          	add	sp,sp,-32
    ea04:	00159713          	sll	a4,a1,0x1
    ea08:	01065613          	srl	a2,a2,0x10
    ea0c:	00f12423          	sw	a5,8(sp)
    ea10:	00b12623          	sw	a1,12(sp)
    ea14:	00f12c23          	sw	a5,24(sp)
    ea18:	01012023          	sw	a6,0(sp)
    ea1c:	00d12223          	sw	a3,4(sp)
    ea20:	01012823          	sw	a6,16(sp)
    ea24:	00d12a23          	sw	a3,20(sp)
    ea28:	00c12e23          	sw	a2,28(sp)
    ea2c:	01175713          	srl	a4,a4,0x11
    ea30:	01f5d593          	srl	a1,a1,0x1f
    ea34:	01010893          	add	a7,sp,16
    ea38:	01c10793          	add	a5,sp,28
    ea3c:	00361513          	sll	a0,a2,0x3
    ea40:	ffc7a603          	lw	a2,-4(a5)
    ea44:	ffc78793          	add	a5,a5,-4
    ea48:	01d65693          	srl	a3,a2,0x1d
    ea4c:	00a6e6b3          	or	a3,a3,a0
    ea50:	00d7a223          	sw	a3,4(a5)
    ea54:	fef894e3          	bne	a7,a5,ea3c <__trunctfdf2+0x50>
    ea58:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    ea5c:	00381813          	sll	a6,a6,0x3
    ea60:	01169613          	sll	a2,a3,0x11
    ea64:	01012823          	sw	a6,16(sp)
    ea68:	01265613          	srl	a2,a2,0x12
    ea6c:	04060263          	beqz	a2,eab0 <__trunctfdf2+0xc4>
    ea70:	ffffc6b7          	lui	a3,0xffffc
    ea74:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    ea78:	00d70733          	add	a4,a4,a3
    ea7c:	7fe00693          	li	a3,2046
    ea80:	10e6d463          	bge	a3,a4,eb88 <__trunctfdf2+0x19c>
    ea84:	7ff00793          	li	a5,2047
    ea88:	00000613          	li	a2,0
    ea8c:	00000693          	li	a3,0
    ea90:	01479793          	sll	a5,a5,0x14
    ea94:	01f59593          	sll	a1,a1,0x1f
    ea98:	00c7e7b3          	or	a5,a5,a2
    ea9c:	00b7e7b3          	or	a5,a5,a1
    eaa0:	00068513          	mv	a0,a3
    eaa4:	00078593          	mv	a1,a5
    eaa8:	02010113          	add	sp,sp,32
    eaac:	00008067          	ret
    eab0:	01412603          	lw	a2,20(sp)
    eab4:	01812883          	lw	a7,24(sp)
    eab8:	01c12503          	lw	a0,28(sp)
    eabc:	011666b3          	or	a3,a2,a7
    eac0:	00a6e6b3          	or	a3,a3,a0
    eac4:	0106e6b3          	or	a3,a3,a6
    eac8:	04071463          	bnez	a4,eb10 <__trunctfdf2+0x124>
    eacc:	14068263          	beqz	a3,ec10 <__trunctfdf2+0x224>
    ead0:	00500693          	li	a3,5
    ead4:	00000613          	li	a2,0
    ead8:	0036d793          	srl	a5,a3,0x3
    eadc:	01d61693          	sll	a3,a2,0x1d
    eae0:	00f6e6b3          	or	a3,a3,a5
    eae4:	00961613          	sll	a2,a2,0x9
    eae8:	7ff77793          	and	a5,a4,2047
    eaec:	00c65613          	srl	a2,a2,0xc
    eaf0:	01479793          	sll	a5,a5,0x14
    eaf4:	01f59593          	sll	a1,a1,0x1f
    eaf8:	00c7e7b3          	or	a5,a5,a2
    eafc:	00b7e7b3          	or	a5,a5,a1
    eb00:	00068513          	mv	a0,a3
    eb04:	00078593          	mv	a1,a5
    eb08:	02010113          	add	sp,sp,32
    eb0c:	00008067          	ret
    eb10:	12068463          	beqz	a3,ec38 <__trunctfdf2+0x24c>
    eb14:	01c8d793          	srl	a5,a7,0x1c
    eb18:	00451513          	sll	a0,a0,0x4
    eb1c:	00a7e7b3          	or	a5,a5,a0
    eb20:	008006b7          	lui	a3,0x800
    eb24:	00d7f6b3          	and	a3,a5,a3
    eb28:	1c068263          	beqz	a3,ecec <__trunctfdf2+0x300>
    eb2c:	ff800737          	lui	a4,0xff800
    eb30:	01c65693          	srl	a3,a2,0x1c
    eb34:	00489893          	sll	a7,a7,0x4
    eb38:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    eb3c:	00e7f633          	and	a2,a5,a4
    eb40:	0116e6b3          	or	a3,a3,a7
    eb44:	004007b7          	lui	a5,0x400
    eb48:	00f66633          	or	a2,a2,a5
    eb4c:	ff86f693          	and	a3,a3,-8
    eb50:	00000793          	li	a5,0
    eb54:	0036d713          	srl	a4,a3,0x3
    eb58:	01d61693          	sll	a3,a2,0x1d
    eb5c:	00961613          	sll	a2,a2,0x9
    eb60:	00c65613          	srl	a2,a2,0xc
    eb64:	01479793          	sll	a5,a5,0x14
    eb68:	01f59593          	sll	a1,a1,0x1f
    eb6c:	00c7e7b3          	or	a5,a5,a2
    eb70:	00e6e6b3          	or	a3,a3,a4
    eb74:	00b7e7b3          	or	a5,a5,a1
    eb78:	00068513          	mv	a0,a3
    eb7c:	00078593          	mv	a1,a5
    eb80:	02010113          	add	sp,sp,32
    eb84:	00008067          	ret
    eb88:	0ce05c63          	blez	a4,ec60 <__trunctfdf2+0x274>
    eb8c:	01412783          	lw	a5,20(sp)
    eb90:	01812503          	lw	a0,24(sp)
    eb94:	01c12603          	lw	a2,28(sp)
    eb98:	00479693          	sll	a3,a5,0x4
    eb9c:	0106e6b3          	or	a3,a3,a6
    eba0:	01c7d793          	srl	a5,a5,0x1c
    eba4:	00451813          	sll	a6,a0,0x4
    eba8:	00461613          	sll	a2,a2,0x4
    ebac:	01c55513          	srl	a0,a0,0x1c
    ebb0:	00d036b3          	snez	a3,a3
    ebb4:	0107e7b3          	or	a5,a5,a6
    ebb8:	00a66633          	or	a2,a2,a0
    ebbc:	00f6e6b3          	or	a3,a3,a5
    ebc0:	0076f793          	and	a5,a3,7
    ebc4:	02078063          	beqz	a5,ebe4 <__trunctfdf2+0x1f8>
    ebc8:	00f6f793          	and	a5,a3,15
    ebcc:	00400513          	li	a0,4
    ebd0:	00a78a63          	beq	a5,a0,ebe4 <__trunctfdf2+0x1f8>
    ebd4:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    ebd8:	00d7b6b3          	sltu	a3,a5,a3
    ebdc:	00d60633          	add	a2,a2,a3
    ebe0:	00078693          	mv	a3,a5
    ebe4:	008007b7          	lui	a5,0x800
    ebe8:	00f677b3          	and	a5,a2,a5
    ebec:	ee0786e3          	beqz	a5,ead8 <__trunctfdf2+0xec>
    ebf0:	00170713          	add	a4,a4,1
    ebf4:	7ff00793          	li	a5,2047
    ebf8:	e8f706e3          	beq	a4,a5,ea84 <__trunctfdf2+0x98>
    ebfc:	ff8007b7          	lui	a5,0xff800
    ec00:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ec04:	00f67633          	and	a2,a2,a5
    ec08:	7ff77793          	and	a5,a4,2047
    ec0c:	f49ff06f          	j	eb54 <__trunctfdf2+0x168>
    ec10:	00000793          	li	a5,0
    ec14:	00000613          	li	a2,0
    ec18:	01479793          	sll	a5,a5,0x14
    ec1c:	01f59593          	sll	a1,a1,0x1f
    ec20:	00c7e7b3          	or	a5,a5,a2
    ec24:	00b7e7b3          	or	a5,a5,a1
    ec28:	00068513          	mv	a0,a3
    ec2c:	00078593          	mv	a1,a5
    ec30:	02010113          	add	sp,sp,32
    ec34:	00008067          	ret
    ec38:	7ff00793          	li	a5,2047
    ec3c:	00000613          	li	a2,0
    ec40:	01479793          	sll	a5,a5,0x14
    ec44:	01f59593          	sll	a1,a1,0x1f
    ec48:	00c7e7b3          	or	a5,a5,a2
    ec4c:	00b7e7b3          	or	a5,a5,a1
    ec50:	00068513          	mv	a0,a3
    ec54:	00078593          	mv	a1,a5
    ec58:	02010113          	add	sp,sp,32
    ec5c:	00008067          	ret
    ec60:	fcc00693          	li	a3,-52
    ec64:	08d74c63          	blt	a4,a3,ecfc <__trunctfdf2+0x310>
    ec68:	03d00693          	li	a3,61
    ec6c:	40e686b3          	sub	a3,a3,a4
    ec70:	01c12703          	lw	a4,28(sp)
    ec74:	4056de13          	sra	t3,a3,0x5
    ec78:	00080eb7          	lui	t4,0x80
    ec7c:	00eeeeb3          	or	t4,t4,a4
    ec80:	002e1513          	sll	a0,t3,0x2
    ec84:	01d12e23          	sw	t4,28(sp)
    ec88:	01f6f693          	and	a3,a3,31
    ec8c:	00a88833          	add	a6,a7,a0
    ec90:	00088613          	mv	a2,a7
    ec94:	00000713          	li	a4,0
    ec98:	00062303          	lw	t1,0(a2)
    ec9c:	00460613          	add	a2,a2,4
    eca0:	00676733          	or	a4,a4,t1
    eca4:	fec81ae3          	bne	a6,a2,ec98 <__trunctfdf2+0x2ac>
    eca8:	00300613          	li	a2,3
    ecac:	41c60633          	sub	a2,a2,t3
    ecb0:	04069a63          	bnez	a3,ed04 <__trunctfdf2+0x318>
    ecb4:	00082803          	lw	a6,0(a6)
    ecb8:	00168693          	add	a3,a3,1
    ecbc:	00478793          	add	a5,a5,4
    ecc0:	ff07ae23          	sw	a6,-4(a5)
    ecc4:	00d64e63          	blt	a2,a3,ece0 <__trunctfdf2+0x2f4>
    ecc8:	00a78833          	add	a6,a5,a0
    eccc:	00082803          	lw	a6,0(a6)
    ecd0:	00168693          	add	a3,a3,1
    ecd4:	00478793          	add	a5,a5,4
    ecd8:	ff07ae23          	sw	a6,-4(a5)
    ecdc:	fed656e3          	bge	a2,a3,ecc8 <__trunctfdf2+0x2dc>
    ece0:	00400793          	li	a5,4
    ece4:	41c787b3          	sub	a5,a5,t3
    ece8:	0840006f          	j	ed6c <__trunctfdf2+0x380>
    ecec:	00000593          	li	a1,0
    ecf0:	7ff00793          	li	a5,2047
    ecf4:	00080637          	lui	a2,0x80
    ecf8:	d99ff06f          	j	ea90 <__trunctfdf2+0xa4>
    ecfc:	00000713          	li	a4,0
    ed00:	dd1ff06f          	j	ead0 <__trunctfdf2+0xe4>
    ed04:	02050813          	add	a6,a0,32
    ed08:	00280833          	add	a6,a6,sp
    ed0c:	ff082803          	lw	a6,-16(a6)
    ed10:	02000f13          	li	t5,32
    ed14:	40df0f33          	sub	t5,t5,a3
    ed18:	01e81833          	sll	a6,a6,t5
    ed1c:	01076733          	or	a4,a4,a6
    ed20:	08060e63          	beqz	a2,edbc <__trunctfdf2+0x3d0>
    ed24:	00261813          	sll	a6,a2,0x2
    ed28:	00f80fb3          	add	t6,a6,a5
    ed2c:	00a88633          	add	a2,a7,a0
    ed30:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ed34:	00462303          	lw	t1,4(a2)
    ed38:	00478793          	add	a5,a5,4
    ed3c:	00d55533          	srl	a0,a0,a3
    ed40:	01e31333          	sll	t1,t1,t5
    ed44:	00656533          	or	a0,a0,t1
    ed48:	fea7ae23          	sw	a0,-4(a5)
    ed4c:	00460613          	add	a2,a2,4
    ed50:	feff90e3          	bne	t6,a5,ed30 <__trunctfdf2+0x344>
    ed54:	00400793          	li	a5,4
    ed58:	41c787b3          	sub	a5,a5,t3
    ed5c:	02080613          	add	a2,a6,32
    ed60:	00260633          	add	a2,a2,sp
    ed64:	00dedeb3          	srl	t4,t4,a3
    ed68:	ffd62823          	sw	t4,-16(a2)
    ed6c:	00400693          	li	a3,4
    ed70:	40f686b3          	sub	a3,a3,a5
    ed74:	00269693          	sll	a3,a3,0x2
    ed78:	00279793          	sll	a5,a5,0x2
    ed7c:	00800613          	li	a2,8
    ed80:	00f888b3          	add	a7,a7,a5
    ed84:	00c6ea63          	bltu	a3,a2,ed98 <__trunctfdf2+0x3ac>
    ed88:	0008a023          	sw	zero,0(a7)
    ed8c:	0008a223          	sw	zero,4(a7)
    ed90:	ff868693          	add	a3,a3,-8
    ed94:	00888893          	add	a7,a7,8
    ed98:	00400793          	li	a5,4
    ed9c:	00f6e463          	bltu	a3,a5,eda4 <__trunctfdf2+0x3b8>
    eda0:	0008a023          	sw	zero,0(a7)
    eda4:	01012783          	lw	a5,16(sp)
    eda8:	00e03733          	snez	a4,a4
    edac:	01412603          	lw	a2,20(sp)
    edb0:	00f766b3          	or	a3,a4,a5
    edb4:	00000713          	li	a4,0
    edb8:	e09ff06f          	j	ebc0 <__trunctfdf2+0x1d4>
    edbc:	00100793          	li	a5,1
    edc0:	00000813          	li	a6,0
    edc4:	f99ff06f          	j	ed5c <__trunctfdf2+0x370>

0000edc8 <__mulsi3>:
    edc8:	00050613          	mv	a2,a0
    edcc:	00000513          	li	a0,0
    edd0:	0015f693          	and	a3,a1,1
    edd4:	00068463          	beqz	a3,eddc <__mulsi3+0x14>
    edd8:	00c50533          	add	a0,a0,a2
    eddc:	0015d593          	srl	a1,a1,0x1
    ede0:	00161613          	sll	a2,a2,0x1
    ede4:	fe0596e3          	bnez	a1,edd0 <__mulsi3+0x8>
    ede8:	00008067          	ret

0000edec <__muldi3>:
    edec:	ff010113          	add	sp,sp,-16
    edf0:	00812423          	sw	s0,8(sp)
    edf4:	00050413          	mv	s0,a0
    edf8:	00112623          	sw	ra,12(sp)
    edfc:	00060513          	mv	a0,a2
    ee00:	00068393          	mv	t2,a3
    ee04:	00040713          	mv	a4,s0
    ee08:	00060813          	mv	a6,a2
    ee0c:	00000793          	li	a5,0
    ee10:	00000313          	li	t1,0
    ee14:	00000f13          	li	t5,0
    ee18:	01e708b3          	add	a7,a4,t5
    ee1c:	00187e93          	and	t4,a6,1
    ee20:	00f30fb3          	add	t6,t1,a5
    ee24:	01f75e13          	srl	t3,a4,0x1f
    ee28:	00185813          	srl	a6,a6,0x1
    ee2c:	00e8b2b3          	sltu	t0,a7,a4
    ee30:	00179793          	sll	a5,a5,0x1
    ee34:	000e8663          	beqz	t4,ee40 <__muldi3+0x54>
    ee38:	00088f13          	mv	t5,a7
    ee3c:	01f28333          	add	t1,t0,t6
    ee40:	00171713          	sll	a4,a4,0x1
    ee44:	01c7e7b3          	or	a5,a5,t3
    ee48:	fc0818e3          	bnez	a6,ee18 <__muldi3+0x2c>
    ee4c:	00058663          	beqz	a1,ee58 <__muldi3+0x6c>
    ee50:	f79ff0ef          	jal	edc8 <__mulsi3>
    ee54:	00650333          	add	t1,a0,t1
    ee58:	00038a63          	beqz	t2,ee6c <__muldi3+0x80>
    ee5c:	00040513          	mv	a0,s0
    ee60:	00038593          	mv	a1,t2
    ee64:	f65ff0ef          	jal	edc8 <__mulsi3>
    ee68:	00650333          	add	t1,a0,t1
    ee6c:	00c12083          	lw	ra,12(sp)
    ee70:	00812403          	lw	s0,8(sp)
    ee74:	000f0513          	mv	a0,t5
    ee78:	00030593          	mv	a1,t1
    ee7c:	01010113          	add	sp,sp,16
    ee80:	00008067          	ret

0000ee84 <__divsi3>:
    ee84:	06054063          	bltz	a0,eee4 <__umodsi3+0x10>
    ee88:	0605c663          	bltz	a1,eef4 <__umodsi3+0x20>

0000ee8c <__hidden___udivsi3>:
    ee8c:	00058613          	mv	a2,a1
    ee90:	00050593          	mv	a1,a0
    ee94:	fff00513          	li	a0,-1
    ee98:	02060c63          	beqz	a2,eed0 <__hidden___udivsi3+0x44>
    ee9c:	00100693          	li	a3,1
    eea0:	00b67a63          	bgeu	a2,a1,eeb4 <__hidden___udivsi3+0x28>
    eea4:	00c05863          	blez	a2,eeb4 <__hidden___udivsi3+0x28>
    eea8:	00161613          	sll	a2,a2,0x1
    eeac:	00169693          	sll	a3,a3,0x1
    eeb0:	feb66ae3          	bltu	a2,a1,eea4 <__hidden___udivsi3+0x18>
    eeb4:	00000513          	li	a0,0
    eeb8:	00c5e663          	bltu	a1,a2,eec4 <__hidden___udivsi3+0x38>
    eebc:	40c585b3          	sub	a1,a1,a2
    eec0:	00d56533          	or	a0,a0,a3
    eec4:	0016d693          	srl	a3,a3,0x1
    eec8:	00165613          	srl	a2,a2,0x1
    eecc:	fe0696e3          	bnez	a3,eeb8 <__hidden___udivsi3+0x2c>
    eed0:	00008067          	ret

0000eed4 <__umodsi3>:
    eed4:	00008293          	mv	t0,ra
    eed8:	fb5ff0ef          	jal	ee8c <__hidden___udivsi3>
    eedc:	00058513          	mv	a0,a1
    eee0:	00028067          	jr	t0
    eee4:	40a00533          	neg	a0,a0
    eee8:	00b04863          	bgtz	a1,eef8 <__umodsi3+0x24>
    eeec:	40b005b3          	neg	a1,a1
    eef0:	f9dff06f          	j	ee8c <__hidden___udivsi3>
    eef4:	40b005b3          	neg	a1,a1
    eef8:	00008293          	mv	t0,ra
    eefc:	f91ff0ef          	jal	ee8c <__hidden___udivsi3>
    ef00:	40a00533          	neg	a0,a0
    ef04:	00028067          	jr	t0

0000ef08 <__modsi3>:
    ef08:	00008293          	mv	t0,ra
    ef0c:	0005ca63          	bltz	a1,ef20 <__modsi3+0x18>
    ef10:	00054c63          	bltz	a0,ef28 <__modsi3+0x20>
    ef14:	f79ff0ef          	jal	ee8c <__hidden___udivsi3>
    ef18:	00058513          	mv	a0,a1
    ef1c:	00028067          	jr	t0
    ef20:	40b005b3          	neg	a1,a1
    ef24:	fe0558e3          	bgez	a0,ef14 <__modsi3+0xc>
    ef28:	40a00533          	neg	a0,a0
    ef2c:	f61ff0ef          	jal	ee8c <__hidden___udivsi3>
    ef30:	40b00533          	neg	a0,a1
    ef34:	00028067          	jr	t0

0000ef38 <__clzsi2>:
    ef38:	000107b7          	lui	a5,0x10
    ef3c:	02f57a63          	bgeu	a0,a5,ef70 <__clzsi2+0x38>
    ef40:	10053793          	sltiu	a5,a0,256
    ef44:	0017b793          	seqz	a5,a5
    ef48:	00379793          	sll	a5,a5,0x3
    ef4c:	02000713          	li	a4,32
    ef50:	40f70733          	sub	a4,a4,a5
    ef54:	00f55533          	srl	a0,a0,a5
    ef58:	00001797          	auipc	a5,0x1
    ef5c:	a0878793          	add	a5,a5,-1528 # f960 <__clz_tab>
    ef60:	00a787b3          	add	a5,a5,a0
    ef64:	0007c503          	lbu	a0,0(a5)
    ef68:	40a70533          	sub	a0,a4,a0
    ef6c:	00008067          	ret
    ef70:	010007b7          	lui	a5,0x1000
    ef74:	02f57463          	bgeu	a0,a5,ef9c <__clzsi2+0x64>
    ef78:	01000793          	li	a5,16
    ef7c:	00f55533          	srl	a0,a0,a5
    ef80:	00001797          	auipc	a5,0x1
    ef84:	9e078793          	add	a5,a5,-1568 # f960 <__clz_tab>
    ef88:	00a787b3          	add	a5,a5,a0
    ef8c:	0007c503          	lbu	a0,0(a5)
    ef90:	01000713          	li	a4,16
    ef94:	40a70533          	sub	a0,a4,a0
    ef98:	00008067          	ret
    ef9c:	01800793          	li	a5,24
    efa0:	00f55533          	srl	a0,a0,a5
    efa4:	00001797          	auipc	a5,0x1
    efa8:	9bc78793          	add	a5,a5,-1604 # f960 <__clz_tab>
    efac:	00a787b3          	add	a5,a5,a0
    efb0:	0007c503          	lbu	a0,0(a5)
    efb4:	00800713          	li	a4,8
    efb8:	40a70533          	sub	a0,a4,a0
    efbc:	00008067          	ret
