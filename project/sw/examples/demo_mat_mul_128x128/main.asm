
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_free_r+0x2dc>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	b2438393          	add	t2,t2,-1244 # fb58 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80039597          	auipc	a1,0x80039
      58:	04058593          	add	a1,a1,64 # 80039094 <__crt0_bss_end>
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
     110:	f6c40413          	add	s0,s0,-148 # f078 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	f6448493          	add	s1,s1,-156 # f078 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	3f860613          	add	a2,a2,1016 # 528 <main>

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
     178:	f0440413          	add	s0,s0,-252 # f078 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	efc48493          	add	s1,s1,-260 # f078 <__fini_array_end>

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

0000020c <dump_tile_4x4>:
}

/* =======================
   Diagnostics
   ======================= */
static void dump_tile_4x4(const char* tag, const int32_t C[4][4]){
     20c:	fe010113          	add	sp,sp,-32
     210:	00812c23          	sw	s0,24(sp)
     214:	00058413          	mv	s0,a1
  printf("%s (4x4):\n", tag);
     218:	00050593          	mv	a1,a0
     21c:	0000f537          	lui	a0,0xf
     220:	07850513          	add	a0,a0,120 # f078 <__fini_array_end>
static void dump_tile_4x4(const char* tag, const int32_t C[4][4]){
     224:	00912a23          	sw	s1,20(sp)
     228:	01212823          	sw	s2,16(sp)
     22c:	01312623          	sw	s3,12(sp)
     230:	00112e23          	sw	ra,28(sp)
     234:	01412423          	sw	s4,8(sp)
     238:	04040493          	add	s1,s0,64
  printf("%s (4x4):\n", tag);
     23c:	4e5000ef          	jal	f20 <printf>
  for(int i=0;i<4;++i){ printf("  "); for(int j=0;j<4;++j) printf("%10ld ", (long)C[i][j]); printf("\n"); }
     240:	0000f937          	lui	s2,0xf
     244:	0000f9b7          	lui	s3,0xf
     248:	21090513          	add	a0,s2,528 # f210 <__fini_array_end+0x198>
     24c:	4d5000ef          	jal	f20 <printf>
     250:	01040a13          	add	s4,s0,16
     254:	00042583          	lw	a1,0(s0)
     258:	08498513          	add	a0,s3,132 # f084 <__fini_array_end+0xc>
     25c:	00440413          	add	s0,s0,4
     260:	4c1000ef          	jal	f20 <printf>
     264:	ff4418e3          	bne	s0,s4,254 <dump_tile_4x4+0x48>
     268:	00a00513          	li	a0,10
     26c:	505000ef          	jal	f70 <putchar>
     270:	fc849ce3          	bne	s1,s0,248 <dump_tile_4x4+0x3c>
}
     274:	01c12083          	lw	ra,28(sp)
     278:	01812403          	lw	s0,24(sp)
     27c:	01412483          	lw	s1,20(sp)
     280:	01012903          	lw	s2,16(sp)
     284:	00c12983          	lw	s3,12(sp)
     288:	00812a03          	lw	s4,8(sp)
     28c:	02010113          	add	sp,sp,32
     290:	00008067          	ret

00000294 <print_speedup_fixed>:
  if(!den){ printf("  n/a   "); return; }
     294:	00d667b3          	or	a5,a2,a3
     298:	00079863          	bnez	a5,2a8 <print_speedup_fixed+0x14>
     29c:	0000f537          	lui	a0,0xf
     2a0:	08c50513          	add	a0,a0,140 # f08c <__fini_array_end+0x14>
     2a4:	47d0006f          	j	f20 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     2a8:	fe010113          	add	sp,sp,-32
     2ac:	00812c23          	sw	s0,24(sp)
     2b0:	00912a23          	sw	s1,20(sp)
     2b4:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2b8:	00060493          	mv	s1,a2
     2bc:	00000693          	li	a3,0
     2c0:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     2c4:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2c8:	3dd0e0ef          	jal	eea4 <__muldi3>
     2cc:	00050793          	mv	a5,a0
     2d0:	01f41713          	sll	a4,s0,0x1f
     2d4:	0014d513          	srl	a0,s1,0x1
     2d8:	00a76533          	or	a0,a4,a0
     2dc:	00a78533          	add	a0,a5,a0
     2e0:	00145713          	srl	a4,s0,0x1
     2e4:	00f537b3          	sltu	a5,a0,a5
     2e8:	00e585b3          	add	a1,a1,a4
     2ec:	00b785b3          	add	a1,a5,a1
     2f0:	00048613          	mv	a2,s1
     2f4:	00040693          	mv	a3,s0
     2f8:	3b40b0ef          	jal	b6ac <__udivdi3>
     2fc:	3e800613          	li	a2,1000
     300:	00000693          	li	a3,0
     304:	00050493          	mv	s1,a0
     308:	00058413          	mv	s0,a1
     30c:	24d0b0ef          	jal	bd58 <__umoddi3>
     310:	00a12623          	sw	a0,12(sp)
     314:	00b12423          	sw	a1,8(sp)
     318:	3e800613          	li	a2,1000
     31c:	00000693          	li	a3,0
     320:	00048513          	mv	a0,s1
     324:	00040593          	mv	a1,s0
     328:	3840b0ef          	jal	b6ac <__udivdi3>
}
     32c:	01812403          	lw	s0,24(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     330:	00c12703          	lw	a4,12(sp)
     334:	00812783          	lw	a5,8(sp)
}
     338:	01c12083          	lw	ra,28(sp)
     33c:	01412483          	lw	s1,20(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     340:	00050613          	mv	a2,a0
     344:	0000f537          	lui	a0,0xf
     348:	00058693          	mv	a3,a1
     34c:	09850513          	add	a0,a0,152 # f098 <__fini_array_end+0x20>
}
     350:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     354:	3cd0006f          	j	f20 <printf>

00000358 <cfs_run_tile.constprop.0>:
static void cfs_run_tile(const int8_t *A_flat, const int8_t *B_flat, int32_t C4[4][4], int K, int lda, int ldb){
     358:	fc010113          	add	sp,sp,-64
     35c:	02812e23          	sw	s0,60(sp)
     360:	02912c23          	sw	s1,56(sp)
     364:	03212a23          	sw	s2,52(sp)
     368:	03312823          	sw	s3,48(sp)
     36c:	03412623          	sw	s4,44(sp)
     370:	03512423          	sw	s5,40(sp)
     374:	03612223          	sw	s6,36(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     378:	ffeb07b7          	lui	a5,0xffeb0
     37c:	00200713          	li	a4,2
     380:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     384:	0007a783          	lw	a5,0(a5)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     388:	ffeb03b7          	lui	t2,0xffeb0
     38c:	ffeb02b7          	lui	t0,0xffeb0
     390:	ffeb0fb7          	lui	t6,0xffeb0
     394:	ffeb0f37          	lui	t5,0xffeb0
     398:	ffeb0eb7          	lui	t4,0xffeb0
     39c:	ffeb0e37          	lui	t3,0xffeb0
     3a0:	ffeb0337          	lui	t1,0xffeb0
     3a4:	ffeb08b7          	lui	a7,0xffeb0
  for (int s = 0; s < T; ++s) {
     3a8:	00000793          	li	a5,0
    for (int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? A_flat[i*lda+k] : 0; Aword[i]=(uint32_t)(uint8_t)a; }
     3ac:	07f00993          	li	s3,127
     3b0:	00400a13          	li	s4,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     3b4:	ffeb0937          	lui	s2,0xffeb0
     3b8:	00438393          	add	t2,t2,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     3bc:	00828293          	add	t0,t0,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     3c0:	00cf8f93          	add	t6,t6,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     3c4:	010f0f13          	add	t5,t5,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     3c8:	014e8e93          	add	t4,t4,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     3cc:	018e0e13          	add	t3,t3,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     3d0:	01c30313          	add	t1,t1,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     3d4:	02088893          	add	a7,a7,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     3d8:	00100b13          	li	s6,1
  for (int s = 0; s < T; ++s) {
     3dc:	08600a93          	li	s5,134
    uint32_t Aword[4]={0}, Bword[4]={0};
     3e0:	00012023          	sw	zero,0(sp)
     3e4:	00012223          	sw	zero,4(sp)
     3e8:	00012423          	sw	zero,8(sp)
     3ec:	00012623          	sw	zero,12(sp)
     3f0:	00012823          	sw	zero,16(sp)
     3f4:	00012a23          	sw	zero,20(sp)
     3f8:	00012c23          	sw	zero,24(sp)
     3fc:	00012e23          	sw	zero,28(sp)
    for (int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? A_flat[i*lda+k] : 0; Aword[i]=(uint32_t)(uint8_t)a; }
     400:	00010413          	mv	s0,sp
     404:	00f50833          	add	a6,a0,a5
     408:	00000713          	li	a4,0
     40c:	40e784b3          	sub	s1,a5,a4
     410:	00000693          	li	a3,0
     414:	0099e463          	bltu	s3,s1,41c <cfs_run_tile.constprop.0+0xc4>
     418:	00080683          	lb	a3,0(a6)
     41c:	0ff6f693          	zext.b	a3,a3
     420:	00d42023          	sw	a3,0(s0)
     424:	00170713          	add	a4,a4,1
     428:	00440413          	add	s0,s0,4
     42c:	07f80813          	add	a6,a6,127
     430:	fd471ee3          	bne	a4,s4,40c <cfs_run_tile.constprop.0+0xb4>
     434:	00279713          	sll	a4,a5,0x2
     438:	01010413          	add	s0,sp,16
     43c:	00e58733          	add	a4,a1,a4
    for (int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)? B_flat[k*ldb+j] : 0; Bword[j]=(uint32_t)(uint8_t)b; }
     440:	00000693          	li	a3,0
     444:	40d784b3          	sub	s1,a5,a3
     448:	00000813          	li	a6,0
     44c:	0099e463          	bltu	s3,s1,454 <cfs_run_tile.constprop.0+0xfc>
     450:	00070803          	lb	a6,0(a4)
     454:	0ff87813          	zext.b	a6,a6
     458:	01042023          	sw	a6,0(s0)
     45c:	00168693          	add	a3,a3,1
     460:	00440413          	add	s0,s0,4
     464:	ffd70713          	add	a4,a4,-3
     468:	fd469ee3          	bne	a3,s4,444 <cfs_run_tile.constprop.0+0xec>
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
     46c:	00012703          	lw	a4,0(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     470:	00e3a023          	sw	a4,0(t2)
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
     474:	00412703          	lw	a4,4(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     478:	00e2a023          	sw	a4,0(t0)
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     47c:	00812703          	lw	a4,8(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     480:	00efa023          	sw	a4,0(t6)
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     484:	00c12703          	lw	a4,12(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     488:	00ef2023          	sw	a4,0(t5)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
     48c:	01012703          	lw	a4,16(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     490:	00eea023          	sw	a4,0(t4)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
     494:	01412703          	lw	a4,20(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     498:	00ee2023          	sw	a4,0(t3)
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     49c:	01812703          	lw	a4,24(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4a0:	00e32023          	sw	a4,0(t1)
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     4a4:	01c12703          	lw	a4,28(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4a8:	00e8a023          	sw	a4,0(a7)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     4ac:	00092703          	lw	a4,0(s2) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4b0:	01692023          	sw	s6,0(s2)
  for (int s = 0; s < T; ++s) {
     4b4:	00178793          	add	a5,a5,1
     4b8:	f35794e3          	bne	a5,s5,3e0 <cfs_run_tile.constprop.0+0x88>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     4bc:	ffeb06b7          	lui	a3,0xffeb0
     4c0:	00000713          	li	a4,0
     4c4:	01000593          	li	a1,16
     4c8:	04068693          	add	a3,a3,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     4cc:	01000893          	li	a7,16
     4d0:	02000313          	li	t1,32
     4d4:	00e60833          	add	a6,a2,a4
     4d8:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     4dc:	00d70533          	add	a0,a4,a3
     4e0:	00f50e33          	add	t3,a0,a5
     4e4:	000e2e83          	lw	t4,0(t3)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     4e8:	00f80e33          	add	t3,a6,a5
     4ec:	00478793          	add	a5,a5,4
     4f0:	01de2023          	sw	t4,0(t3)
     4f4:	ff1796e3          	bne	a5,a7,4e0 <cfs_run_tile.constprop.0+0x188>
     4f8:	00458593          	add	a1,a1,4
     4fc:	01070713          	add	a4,a4,16
     500:	fc659ae3          	bne	a1,t1,4d4 <cfs_run_tile.constprop.0+0x17c>
}
     504:	03c12403          	lw	s0,60(sp)
     508:	03812483          	lw	s1,56(sp)
     50c:	03412903          	lw	s2,52(sp)
     510:	03012983          	lw	s3,48(sp)
     514:	02c12a03          	lw	s4,44(sp)
     518:	02812a83          	lw	s5,40(sp)
     51c:	02412b03          	lw	s6,36(sp)
     520:	04010113          	add	sp,sp,64
     524:	00008067          	ret

00000528 <main>:

/* =======================
   Main
   ======================= */
int main(void){
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     528:	0000f537          	lui	a0,0xf
int main(void){
     52c:	f0010113          	add	sp,sp,-256
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     530:	08000613          	li	a2,128
     534:	08000593          	li	a1,128
     538:	0b850513          	add	a0,a0,184 # f0b8 <__fini_array_end+0x40>
int main(void){
     53c:	0e112e23          	sw	ra,252(sp)
     540:	0e812c23          	sw	s0,248(sp)
     544:	0e912a23          	sw	s1,244(sp)
     548:	0f212823          	sw	s2,240(sp)
     54c:	0f312623          	sw	s3,236(sp)
     550:	0f412423          	sw	s4,232(sp)
     554:	0f512223          	sw	s5,228(sp)
     558:	0f612023          	sw	s6,224(sp)
     55c:	0d712e23          	sw	s7,220(sp)
     560:	0d812c23          	sw	s8,216(sp)
     564:	0d912a23          	sw	s9,212(sp)
     568:	0da12823          	sw	s10,208(sp)
     56c:	0db12623          	sw	s11,204(sp)
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     570:	1b1000ef          	jal	f20 <printf>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     574:	ffeb07b7          	lui	a5,0xffeb0
     578:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     57c:	0000f537          	lui	a0,0xf
     580:	0dc50513          	add	a0,a0,220 # f0dc <__fini_array_end+0x64>
     584:	19d000ef          	jal	f20 <printf>

  static int8_t  A[N][N], B[N][N];
  static int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     588:	80035737          	lui	a4,0x80035
     58c:	f3470413          	add	s0,a4,-204 # 80034f34 <A.8>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     590:	00100613          	li	a2,1
     594:	f3470713          	add	a4,a4,-204
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     598:	08000813          	li	a6,128
     59c:	08100893          	li	a7,129
     5a0:	0ff67593          	zext.b	a1,a2
     5a4:	00259793          	sll	a5,a1,0x2
     5a8:	40f587b3          	sub	a5,a1,a5
     5ac:	0ff7f793          	zext.b	a5,a5
     5b0:	00000693          	li	a3,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     5b4:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     5b8:	00d70333          	add	t1,a4,a3
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     5bc:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     5c0:	00f587b3          	add	a5,a1,a5
     5c4:	00a30023          	sb	a0,0(t1)
     5c8:	00168693          	add	a3,a3,1
     5cc:	0ff7f793          	zext.b	a5,a5
     5d0:	ff0692e3          	bne	a3,a6,5b4 <main+0x8c>
     5d4:	00160613          	add	a2,a2,1
     5d8:	08070713          	add	a4,a4,128
     5dc:	fd1612e3          	bne	a2,a7,5a0 <main+0x78>
     5e0:	800316b7          	lui	a3,0x80031
     5e4:	f3468b13          	add	s6,a3,-204 # 80030f34 <B.7>
     5e8:	00500713          	li	a4,5
     5ec:	f3468693          	add	a3,a3,-204
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     5f0:	08000513          	li	a0,128
     5f4:	08500813          	li	a6,133
     5f8:	40e007b3          	neg	a5,a4
     5fc:	00179793          	sll	a5,a5,0x1
     600:	0ff7f793          	zext.b	a5,a5
     604:	00000613          	li	a2,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     608:	00f7f593          	and	a1,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     60c:	00c688b3          	add	a7,a3,a2
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     610:	ff858593          	add	a1,a1,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     614:	00f707b3          	add	a5,a4,a5
     618:	00b88023          	sb	a1,0(a7)
     61c:	00160613          	add	a2,a2,1
     620:	0ff7f793          	zext.b	a5,a5
     624:	fea612e3          	bne	a2,a0,608 <main+0xe0>
     628:	fff70713          	add	a4,a4,-1
     62c:	0ff77713          	zext.b	a4,a4
     630:	08068693          	add	a3,a3,128
     634:	fd0712e3          	bne	a4,a6,5f8 <main+0xd0>

  /* SW */
  uint64_t c0=rdcycle(), i0=rdinstret();
     638:	badff0ef          	jal	1e4 <rdcycle>
     63c:	00050993          	mv	s3,a0
     640:	00058a93          	mv	s5,a1
     644:	bb5ff0ef          	jal	1f8 <rdinstret>
     648:	800217b7          	lui	a5,0x80021
     64c:	f3478b93          	add	s7,a5,-204 # 80020f34 <Csw.6>
     650:	00010cb7          	lui	s9,0x10
     654:	f3478793          	add	a5,a5,-204
     658:	00050493          	mv	s1,a0
     65c:	00058a13          	mv	s4,a1
  for(int i=0;i<N;++i){
     660:	019b8cb3          	add	s9,s7,s9
  uint64_t c0=rdcycle(), i0=rdinstret();
     664:	00040d13          	mv	s10,s0
     668:	00f12e23          	sw	a5,28(sp)
    for(int j=0;j<N;++j){
     66c:	00000913          	li	s2,0
     670:	0440006f          	j	6b4 <main+0x18c>
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     674:	018d06b3          	add	a3,s10,s8
     678:	00078583          	lb	a1,0(a5)
     67c:	00068503          	lb	a0,0(a3)
     680:	00f12623          	sw	a5,12(sp)
     684:	001c0c13          	add	s8,s8,1
     688:	7f80e0ef          	jal	ee80 <__mulsi3>
     68c:	00c12783          	lw	a5,12(sp)
     690:	08000713          	li	a4,128
     694:	00ad8db3          	add	s11,s11,a0
     698:	08078793          	add	a5,a5,128
     69c:	fcec1ce3          	bne	s8,a4,674 <main+0x14c>
      C[i][j]=s;
     6a0:	00291793          	sll	a5,s2,0x2
     6a4:	00fb87b3          	add	a5,s7,a5
     6a8:	01b7a023          	sw	s11,0(a5)
    for(int j=0;j<N;++j){
     6ac:	00190913          	add	s2,s2,1
     6b0:	01890a63          	beq	s2,s8,6c4 <main+0x19c>
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     6b4:	012b07b3          	add	a5,s6,s2
      int32_t s=0;
     6b8:	00000d93          	li	s11,0
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     6bc:	00000c13          	li	s8,0
     6c0:	fb5ff06f          	j	674 <main+0x14c>
  for(int i=0;i<N;++i){
     6c4:	200b8b93          	add	s7,s7,512
     6c8:	080d0d13          	add	s10,s10,128
     6cc:	fb7c90e3          	bne	s9,s7,66c <main+0x144>
  gemm_ref(A,B,Csw);
  uint64_t i1=rdinstret(), c1=rdcycle();
     6d0:	b29ff0ef          	jal	1f8 <rdinstret>
     6d4:	00050913          	mv	s2,a0
     6d8:	00058b93          	mv	s7,a1
     6dc:	b09ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     6e0:	413507b3          	sub	a5,a0,s3
     6e4:	415585b3          	sub	a1,a1,s5
     6e8:	00f12623          	sw	a5,12(sp)
     6ec:	00f537b3          	sltu	a5,a0,a5
     6f0:	40f587b3          	sub	a5,a1,a5
     6f4:	00f12a23          	sw	a5,20(sp)
     6f8:	409907b3          	sub	a5,s2,s1
     6fc:	414b8bb3          	sub	s7,s7,s4
     700:	00f93933          	sltu	s2,s2,a5
     704:	00f12823          	sw	a5,16(sp)
     708:	412b87b3          	sub	a5,s7,s2
     70c:	00f12c23          	sw	a5,24(sp)

  /* CFU */
  c0=rdcycle(); i0=rdinstret();
     710:	ad5ff0ef          	jal	1e4 <rdcycle>
     714:	00050a93          	mv	s5,a0
     718:	00058c13          	mv	s8,a1
     71c:	addff0ef          	jal	1f8 <rdinstret>
     720:	800117b7          	lui	a5,0x80011
     724:	f3478893          	add	a7,a5,-204 # 80010f34 <Ccfu.5>
     728:	00004837          	lui	a6,0x4
     72c:	f3478793          	add	a5,a5,-204
     730:	00050a13          	mv	s4,a0
     734:	00058b93          	mv	s7,a1
  for(int i=0;i<N;++i){
     738:	01040833          	add	a6,s0,a6
  c0=rdcycle(); i0=rdinstret();
     73c:	00040513          	mv	a0,s0
     740:	02f12c23          	sw	a5,56(sp)
    for(int j=0;j<N;++j){
     744:	08000e13          	li	t3,128
     748:	00000613          	li	a2,0
     74c:	08050593          	add	a1,a0,128
     750:	07c0006f          	j	7cc <main+0x2a4>
         (((uint32_t)(uint8_t)x1) << 8)  |
     754:	00174783          	lbu	a5,1(a4)
         (((uint32_t)(uint8_t)x2) << 16) |
     758:	00274e83          	lbu	t4,2(a4)
     75c:	1006cf03          	lbu	t5,256(a3)
         (((uint32_t)(uint8_t)x1) << 8)  |
     760:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     764:	010e9e93          	sll	t4,t4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     768:	01d7e7b3          	or	a5,a5,t4
  return  ((uint32_t)(uint8_t)x0)        |
     76c:	00074e83          	lbu	t4,0(a4)
         (((uint32_t)(uint8_t)x2) << 16) |
     770:	010f1f13          	sll	t5,t5,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     774:	01d7e7b3          	or	a5,a5,t4
         (((uint32_t)(uint8_t)x3) << 24);
     778:	00374e83          	lbu	t4,3(a4)
     77c:	018e9e93          	sll	t4,t4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     780:	01d7eeb3          	or	t4,a5,t4
         (((uint32_t)(uint8_t)x1) << 8)  |
     784:	0806c783          	lbu	a5,128(a3)
     788:	00879793          	sll	a5,a5,0x8
     78c:	01e7e7b3          	or	a5,a5,t5
  return  ((uint32_t)(uint8_t)x0)        |
     790:	0006cf03          	lbu	t5,0(a3)
         (((uint32_t)(uint8_t)x1) << 8)  |
     794:	01e7e7b3          	or	a5,a5,t5
         (((uint32_t)(uint8_t)x3) << 24);
     798:	1806cf03          	lbu	t5,384(a3)
     79c:	018f1f13          	sll	t5,t5,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     7a0:	01e7e7b3          	or	a5,a5,t5
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     7a4:	02fe878b          	.insn	4, 0x02fe878b
      for(int k=0;k<N;k+=4){
     7a8:	00470713          	add	a4,a4,4
        acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     7ac:	00f30333          	add	t1,t1,a5
      for(int k=0;k<N;k+=4){
     7b0:	20068693          	add	a3,a3,512
     7b4:	fae590e3          	bne	a1,a4,754 <main+0x22c>
      C[i][j]=acc;
     7b8:	00261793          	sll	a5,a2,0x2
     7bc:	00f887b3          	add	a5,a7,a5
     7c0:	0067a023          	sw	t1,0(a5)
    for(int j=0;j<N;++j){
     7c4:	00160613          	add	a2,a2,1
     7c8:	01c60a63          	beq	a2,t3,7dc <main+0x2b4>
      for(int k=0;k<N;k+=4){
     7cc:	00cb06b3          	add	a3,s6,a2
  uint64_t c0=rdcycle(), i0=rdinstret();
     7d0:	00050713          	mv	a4,a0
      int32_t acc=0;
     7d4:	00000313          	li	t1,0
     7d8:	f7dff06f          	j	754 <main+0x22c>
  for(int i=0;i<N;++i){
     7dc:	20088893          	add	a7,a7,512
     7e0:	01058663          	beq	a1,a6,7ec <main+0x2c4>
     7e4:	00058513          	mv	a0,a1
     7e8:	f61ff06f          	j	748 <main+0x220>
  gemm_cfu(A,B,Ccfu);
  i1=rdinstret(); c1=rdcycle();
     7ec:	a0dff0ef          	jal	1f8 <rdinstret>
     7f0:	00050c93          	mv	s9,a0
     7f4:	00058d13          	mv	s10,a1
     7f8:	9edff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     7fc:	41550ab3          	sub	s5,a0,s5
     800:	41858c33          	sub	s8,a1,s8
     804:	01553533          	sltu	a0,a0,s5
     808:	414c8a33          	sub	s4,s9,s4
     80c:	40ac07b3          	sub	a5,s8,a0
     810:	417d0d33          	sub	s10,s10,s7
     814:	014cbcb3          	sltu	s9,s9,s4
     818:	02f12023          	sw	a5,32(sp)
     81c:	419d07b3          	sub	a5,s10,s9
     820:	02f12223          	sw	a5,36(sp)

  /* CFS */
  c0=rdcycle(); i0=rdinstret();
     824:	9c1ff0ef          	jal	1e4 <rdcycle>
     828:	02a12423          	sw	a0,40(sp)
     82c:	02b12623          	sw	a1,44(sp)
     830:	9c9ff0ef          	jal	1f8 <rdinstret>
     834:	800017b7          	lui	a5,0x80001
  for(int i0=0;i0<N;i0+=4){
     838:	00001d37          	lui	s10,0x1
  c0=rdcycle(); i0=rdinstret();
     83c:	02a12823          	sw	a0,48(sp)
     840:	02b12a23          	sw	a1,52(sp)
  for(int i0=0;i0<N;i0+=4){
     844:	f3478b93          	add	s7,a5,-204 # 80000f34 <Ccfs.4>
     848:	00000c93          	li	s9,0
     84c:	f3478c13          	add	s8,a5,-204
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
     850:	800019b7          	lui	s3,0x80001
     854:	80001db7          	lui	s11,0x80001
  for(int i0=0;i0<N;i0+=4){
     858:	800d0d13          	add	s10,s10,-2048 # 800 <main+0x2d8>
      cfs_run_tile(A_flat, B_flat, C4, /*K=*/N, /*lda=*/N, /*ldb=*/4);
     85c:	000b8913          	mv	s2,s7
    for(int j0=0;j0<N;j0+=4){
     860:	00000493          	li	s1,0
     864:	07c0006f          	j	8e0 <main+0x3b8>
        B_flat[k*4+0]=B[k][j0+0];
     868:	00074583          	lbu	a1,0(a4)
      for(int k=0;k<N;++k){
     86c:	00478793          	add	a5,a5,4
     870:	08070713          	add	a4,a4,128
        B_flat[k*4+0]=B[k][j0+0];
     874:	feb78e23          	sb	a1,-4(a5)
        B_flat[k*4+1]=B[k][j0+1];
     878:	f8174583          	lbu	a1,-127(a4)
     87c:	feb78ea3          	sb	a1,-3(a5)
        B_flat[k*4+2]=B[k][j0+2];
     880:	f8274583          	lbu	a1,-126(a4)
     884:	feb78f23          	sb	a1,-2(a5)
        B_flat[k*4+3]=B[k][j0+3];
     888:	f8374583          	lbu	a1,-125(a4)
     88c:	feb78fa3          	sb	a1,-1(a5)
      for(int k=0;k<N;++k){
     890:	fcf61ce3          	bne	a2,a5,868 <main+0x340>
      cfs_run_tile(A_flat, B_flat, C4, /*K=*/N, /*lda=*/N, /*ldb=*/4);
     894:	b34d8593          	add	a1,s11,-1228 # 80000b34 <B_flat.2>
     898:	08010613          	add	a2,sp,128
     89c:	d3498513          	add	a0,s3,-716 # 80000d34 <A_flat.3>
     8a0:	ab9ff0ef          	jal	358 <cfs_run_tile.constprop.0>
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
     8a4:	08010593          	add	a1,sp,128
      cfs_run_tile(A_flat, B_flat, C4, /*K=*/N, /*lda=*/N, /*ldb=*/4);
     8a8:	00090793          	mv	a5,s2
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
     8ac:	00078513          	mv	a0,a5
     8b0:	01000613          	li	a2,16
     8b4:	02b12e23          	sw	a1,60(sp)
     8b8:	0f9000ef          	jal	11b0 <memcpy>
     8bc:	03c12583          	lw	a1,60(sp)
     8c0:	0c010713          	add	a4,sp,192
     8c4:	20050793          	add	a5,a0,512
     8c8:	01058593          	add	a1,a1,16
     8cc:	feb710e3          	bne	a4,a1,8ac <main+0x384>
    for(int j0=0;j0<N;j0+=4){
     8d0:	00448493          	add	s1,s1,4
     8d4:	08000793          	li	a5,128
     8d8:	01090913          	add	s2,s2,16
     8dc:	02f48263          	beq	s1,a5,900 <main+0x3d8>
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
     8e0:	20000613          	li	a2,512
     8e4:	00040593          	mv	a1,s0
     8e8:	d3498513          	add	a0,s3,-716
     8ec:	0c5000ef          	jal	11b0 <memcpy>
     8f0:	b34d8793          	add	a5,s11,-1228
     8f4:	01648733          	add	a4,s1,s6
     8f8:	20078613          	add	a2,a5,512
     8fc:	f6dff06f          	j	868 <main+0x340>
  for(int i0=0;i0<N;i0+=4){
     900:	004c8c93          	add	s9,s9,4 # 10004 <__crt0_copy_data_src_begin+0x4ac>
     904:	01ab8bb3          	add	s7,s7,s10
     908:	20040413          	add	s0,s0,512
     90c:	f49c98e3          	bne	s9,s1,85c <main+0x334>
  gemm_cfs(A,B,Ccfs);
  i1=rdinstret(); c1=rdcycle();
     910:	8e9ff0ef          	jal	1f8 <rdinstret>
     914:	00050413          	mv	s0,a0
     918:	00058913          	mv	s2,a1
     91c:	8c9ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     920:	02812783          	lw	a5,40(sp)
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
     924:	00010637          	lui	a2,0x10
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     928:	40f50d33          	sub	s10,a0,a5
     92c:	02c12783          	lw	a5,44(sp)
     930:	01a53533          	sltu	a0,a0,s10
     934:	40f58bb3          	sub	s7,a1,a5
     938:	03012783          	lw	a5,48(sp)
     93c:	40ab8bb3          	sub	s7,s7,a0
     940:	40f40cb3          	sub	s9,s0,a5
     944:	03412783          	lw	a5,52(sp)
     948:	01943433          	sltu	s0,s0,s9
     94c:	40f90933          	sub	s2,s2,a5
     950:	40890933          	sub	s2,s2,s0
     954:	00000793          	li	a5,0
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
     958:	01c12703          	lw	a4,28(sp)
     95c:	00f706b3          	add	a3,a4,a5
     960:	03812703          	lw	a4,56(sp)
     964:	0006a683          	lw	a3,0(a3)
     968:	00f70733          	add	a4,a4,a5
     96c:	00072703          	lw	a4,0(a4)
     970:	1ce69c63          	bne	a3,a4,b48 <main+0x620>
     974:	00478793          	add	a5,a5,4
     978:	fec790e3          	bne	a5,a2,958 <main+0x430>
     97c:	00100d93          	li	s11,1
     980:	00000793          	li	a5,0
     984:	00010637          	lui	a2,0x10
     988:	01c12703          	lw	a4,28(sp)
     98c:	00f706b3          	add	a3,a4,a5
     990:	00fc0733          	add	a4,s8,a5
     994:	0006a683          	lw	a3,0(a3)
     998:	00072703          	lw	a4,0(a4)
     99c:	1ae69a63          	bne	a3,a4,b50 <main+0x628>
     9a0:	00478793          	add	a5,a5,4
     9a4:	fec792e3          	bne	a5,a2,988 <main+0x460>
     9a8:	00100413          	li	s0,1

  int ok_cfu = cmp_NxN(&Csw[0][0], &Ccfu[0][0]);
  int ok_cfs = cmp_NxN(&Csw[0][0], &Ccfs[0][0]);

  printf("\n%dx%d timing summary\n", N, N);
     9ac:	0000f537          	lui	a0,0xf
     9b0:	08000593          	li	a1,128
     9b4:	08000613          	li	a2,128
     9b8:	0f050513          	add	a0,a0,240 # f0f0 <__fini_array_end+0x78>
     9bc:	564000ef          	jal	f20 <printf>
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
     9c0:	0000f537          	lui	a0,0xf
     9c4:	10850513          	add	a0,a0,264 # f108 <__fini_array_end+0x90>
     9c8:	6ec000ef          	jal	10b4 <puts>
  printf("-----+----------------+---------------+--------------+--------------\n");
     9cc:	0000f537          	lui	a0,0xf
     9d0:	15050513          	add	a0,a0,336 # f150 <__fini_array_end+0xd8>
     9d4:	6e0000ef          	jal	10b4 <puts>
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     9d8:	01012703          	lw	a4,16(sp)
     9dc:	01812783          	lw	a5,24(sp)
     9e0:	00c12603          	lw	a2,12(sp)
     9e4:	01412683          	lw	a3,20(sp)
     9e8:	0000f537          	lui	a0,0xf
     9ec:	19850513          	add	a0,a0,408 # f198 <__fini_array_end+0x120>
     9f0:	530000ef          	jal	f20 <printf>
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     9f4:	02412783          	lw	a5,36(sp)
     9f8:	02012683          	lw	a3,32(sp)
     9fc:	0000f537          	lui	a0,0xf
     a00:	000a0713          	mv	a4,s4
     a04:	000a8613          	mv	a2,s5
     a08:	1d050513          	add	a0,a0,464 # f1d0 <__fini_array_end+0x158>
     a0c:	514000ef          	jal	f20 <printf>
     a10:	02012683          	lw	a3,32(sp)
     a14:	01412583          	lw	a1,20(sp)
     a18:	00c12503          	lw	a0,12(sp)
     a1c:	000a8613          	mv	a2,s5
     a20:	0000fab7          	lui	s5,0xf
     a24:	871ff0ef          	jal	294 <print_speedup_fixed>
     a28:	1eca8513          	add	a0,s5,492 # f1ec <__fini_array_end+0x174>
     a2c:	4f4000ef          	jal	f20 <printf>
     a30:	01812583          	lw	a1,24(sp)
     a34:	02412683          	lw	a3,36(sp)
     a38:	01012503          	lw	a0,16(sp)
     a3c:	000a0613          	mv	a2,s4
     a40:	855ff0ef          	jal	294 <print_speedup_fixed>
     a44:	00a00513          	li	a0,10
     a48:	528000ef          	jal	f70 <putchar>
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     a4c:	0000f537          	lui	a0,0xf
     a50:	000c8713          	mv	a4,s9
     a54:	00090793          	mv	a5,s2
     a58:	000d0613          	mv	a2,s10
     a5c:	000b8693          	mv	a3,s7
     a60:	1f850513          	add	a0,a0,504 # f1f8 <__fini_array_end+0x180>
     a64:	4bc000ef          	jal	f20 <printf>
     a68:	01412583          	lw	a1,20(sp)
     a6c:	00c12503          	lw	a0,12(sp)
     a70:	000d0613          	mv	a2,s10
     a74:	000b8693          	mv	a3,s7
     a78:	81dff0ef          	jal	294 <print_speedup_fixed>
     a7c:	1eca8513          	add	a0,s5,492
     a80:	4a0000ef          	jal	f20 <printf>
     a84:	01012503          	lw	a0,16(sp)
     a88:	01812583          	lw	a1,24(sp)
     a8c:	000c8613          	mv	a2,s9
     a90:	00090693          	mv	a3,s2
     a94:	801ff0ef          	jal	294 <print_speedup_fixed>
     a98:	00a00513          	li	a0,10
     a9c:	4d4000ef          	jal	f70 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
     aa0:	0a0d8c63          	beqz	s11,b58 <main+0x630>
     aa4:	0000f5b7          	lui	a1,0xf
     aa8:	0a858593          	add	a1,a1,168 # f0a8 <__fini_array_end+0x30>
     aac:	0a040c63          	beqz	s0,b64 <main+0x63c>
     ab0:	0000f637          	lui	a2,0xf
     ab4:	0a860613          	add	a2,a2,168 # f0a8 <__fini_array_end+0x30>
     ab8:	0000f537          	lui	a0,0xf
     abc:	21450513          	add	a0,a0,532 # f214 <__fini_array_end+0x19c>
     ac0:	460000ef          	jal	f20 <printf>

  if(!ok_cfs){
     ac4:	04041063          	bnez	s0,b04 <main+0x5dc>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     ac8:	00000593          	li	a1,0
     acc:	08000513          	li	a0,128
     ad0:	00959793          	sll	a5,a1,0x9
     ad4:	00000613          	li	a2,0
    if (A[i*N + j] != B[i*N + j]) { if(mi) *mi=i; if(mj) *mj=j; return 0; }
     ad8:	01c12703          	lw	a4,28(sp)
     adc:	00f706b3          	add	a3,a4,a5
     ae0:	00fc0733          	add	a4,s8,a5
     ae4:	0006a683          	lw	a3,0(a3)
     ae8:	00072703          	lw	a4,0(a4)
     aec:	08e69263          	bne	a3,a4,b70 <main+0x648>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     af0:	00160613          	add	a2,a2,1
     af4:	00478793          	add	a5,a5,4
     af8:	fea610e3          	bne	a2,a0,ad8 <main+0x5b0>
     afc:	00158593          	add	a1,a1,1
     b00:	fca598e3          	bne	a1,a0,ad0 <main+0x5a8>
      int j0 = (bj/4)*4;
      replay_tile_and_dump(A, B, i0, j0);
    }
  }

  return (ok_cfu && ok_cfs)? 0 : 1;
     b04:	01b47533          	and	a0,s0,s11
}
     b08:	0fc12083          	lw	ra,252(sp)
     b0c:	0f812403          	lw	s0,248(sp)
     b10:	0f412483          	lw	s1,244(sp)
     b14:	0f012903          	lw	s2,240(sp)
     b18:	0ec12983          	lw	s3,236(sp)
     b1c:	0e812a03          	lw	s4,232(sp)
     b20:	0e412a83          	lw	s5,228(sp)
     b24:	0e012b03          	lw	s6,224(sp)
     b28:	0dc12b83          	lw	s7,220(sp)
     b2c:	0d812c03          	lw	s8,216(sp)
     b30:	0d412c83          	lw	s9,212(sp)
     b34:	0d012d03          	lw	s10,208(sp)
     b38:	0cc12d83          	lw	s11,204(sp)
  return (ok_cfu && ok_cfs)? 0 : 1;
     b3c:	00154513          	xor	a0,a0,1
}
     b40:	10010113          	add	sp,sp,256
     b44:	00008067          	ret
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
     b48:	00000d93          	li	s11,0
     b4c:	e35ff06f          	j	980 <main+0x458>
     b50:	00000413          	li	s0,0
     b54:	e59ff06f          	j	9ac <main+0x484>
  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
     b58:	0000f5b7          	lui	a1,0xf
     b5c:	0b058593          	add	a1,a1,176 # f0b0 <__fini_array_end+0x38>
     b60:	f4dff06f          	j	aac <main+0x584>
     b64:	0000f637          	lui	a2,0xf
     b68:	0b060613          	add	a2,a2,176 # f0b0 <__fini_array_end+0x38>
     b6c:	f4dff06f          	j	ab8 <main+0x590>
      int i0 = (bi/4)*4;
     b70:	4025d793          	sra	a5,a1,0x2
     b74:	ffc5f713          	and	a4,a1,-4
     b78:	00979593          	sll	a1,a5,0x9
     b7c:	800357b7          	lui	a5,0x80035
     b80:	f3478793          	add	a5,a5,-204 # 80034f34 <A.8>
     b84:	00f58c33          	add	s8,a1,a5
  for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
     b88:	800019b7          	lui	s3,0x80001
      int j0 = (bj/4)*4;
     b8c:	ffc67493          	and	s1,a2,-4
  for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
     b90:	000c0593          	mv	a1,s8
     b94:	20000613          	li	a2,512
     b98:	93498513          	add	a0,s3,-1740 # 80000934 <A_flat.1>
      int i0 = (bi/4)*4;
     b9c:	00e12623          	sw	a4,12(sp)
  for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
     ba0:	610000ef          	jal	11b0 <memcpy>
     ba4:	800005b7          	lui	a1,0x80000
     ba8:	800317b7          	lui	a5,0x80031
     bac:	73458713          	add	a4,a1,1844 # 80000734 <B_flat.0>
     bb0:	f3478793          	add	a5,a5,-204 # 80030f34 <B.7>
     bb4:	00f487b3          	add	a5,s1,a5
     bb8:	20070693          	add	a3,a4,512
    B_flat[k*4+0]=B[k][j0+0];
     bbc:	0007c603          	lbu	a2,0(a5)
  for(int k=0;k<N;++k){
     bc0:	00470713          	add	a4,a4,4
     bc4:	08078793          	add	a5,a5,128
    B_flat[k*4+0]=B[k][j0+0];
     bc8:	fec70e23          	sb	a2,-4(a4)
    B_flat[k*4+1]=B[k][j0+1];
     bcc:	f817c603          	lbu	a2,-127(a5)
     bd0:	fec70ea3          	sb	a2,-3(a4)
    B_flat[k*4+2]=B[k][j0+2];
     bd4:	f827c603          	lbu	a2,-126(a5)
     bd8:	fec70f23          	sb	a2,-2(a4)
    B_flat[k*4+3]=B[k][j0+3];
     bdc:	f837c603          	lbu	a2,-125(a5)
     be0:	fec70fa3          	sb	a2,-1(a4)
  for(int k=0;k<N;++k){
     be4:	fcd71ce3          	bne	a4,a3,bbc <main+0x694>
  cfs_run_tile(A_flat, B_flat, C4_hw, N, N, 4);
     be8:	04010613          	add	a2,sp,64
     bec:	73458593          	add	a1,a1,1844
     bf0:	93498513          	add	a0,s3,-1740
     bf4:	f64ff0ef          	jal	358 <cfs_run_tile.constprop.0>
  for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     bf8:	08010a13          	add	s4,sp,128
     bfc:	009b0b33          	add	s6,s6,s1
    for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     c00:	08000913          	li	s2,128
     c04:	000a0b93          	mv	s7,s4
  for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     c08:	00000993          	li	s3,0
    for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     c0c:	01698d33          	add	s10,s3,s6
    int i=i0+r, j=j0+c; int32_t s=0;
     c10:	00000c93          	li	s9,0
    for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     c14:	00000a93          	li	s5,0
     c18:	015c06b3          	add	a3,s8,s5
     c1c:	000d0583          	lb	a1,0(s10)
     c20:	00068503          	lb	a0,0(a3)
     c24:	001a8a93          	add	s5,s5,1
     c28:	080d0d13          	add	s10,s10,128
     c2c:	2540e0ef          	jal	ee80 <__mulsi3>
     c30:	00ac8cb3          	add	s9,s9,a0
     c34:	00400713          	li	a4,4
     c38:	ff2a90e3          	bne	s5,s2,c18 <main+0x6f0>
    C4_sw[r][c]=s;
     c3c:	019ba023          	sw	s9,0(s7)
  for(int r=0;r<4;++r) for(int c=0;c<4;++c){
     c40:	00198993          	add	s3,s3,1
     c44:	004b8b93          	add	s7,s7,4
     c48:	fce992e3          	bne	s3,a4,c0c <main+0x6e4>
     c4c:	010a0a13          	add	s4,s4,16
     c50:	0c010793          	add	a5,sp,192
     c54:	080c0c13          	add	s8,s8,128
     c58:	fafa16e3          	bne	s4,a5,c04 <main+0x6dc>
  printf("\n-- First mismatch tile at i0=%d j0=%d --\n", i0, j0);
     c5c:	00c12583          	lw	a1,12(sp)
     c60:	0000f537          	lui	a0,0xf
     c64:	00048613          	mv	a2,s1
     c68:	23050513          	add	a0,a0,560 # f230 <__fini_array_end+0x1b8>
     c6c:	2b4000ef          	jal	f20 <printf>
  dump_tile_4x4("CFS C tile", C4_hw);
     c70:	0000f537          	lui	a0,0xf
     c74:	04010593          	add	a1,sp,64
     c78:	25c50513          	add	a0,a0,604 # f25c <__fini_array_end+0x1e4>
     c7c:	d90ff0ef          	jal	20c <dump_tile_4x4>
  dump_tile_4x4("SW  C tile", C4_sw);
     c80:	0000f537          	lui	a0,0xf
     c84:	08010593          	add	a1,sp,128
     c88:	26850513          	add	a0,a0,616 # f268 <__fini_array_end+0x1f0>
     c8c:	d80ff0ef          	jal	20c <dump_tile_4x4>
}
     c90:	e75ff06f          	j	b04 <main+0x5dc>

00000c94 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     c94:	fffff097          	auipc	ra,0xfffff
     c98:	4c408093          	add	ra,ra,1220 # 158 <__crt0_main_exit>
     c9c:	00050513          	mv	a0,a0
     ca0:	00008067          	ret

00000ca4 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     ca4:	fff00513          	li	a0,-1
     ca8:	00008067          	ret

00000cac <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     cac:	000027b7          	lui	a5,0x2
     cb0:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     cb4:	00000513          	li	a0,0
     cb8:	00008067          	ret

00000cbc <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     cbc:	00100513          	li	a0,1
     cc0:	00008067          	ret

00000cc4 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     cc4:	00100513          	li	a0,1
     cc8:	00008067          	ret

00000ccc <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     ccc:	800007b7          	lui	a5,0x80000
     cd0:	01600713          	li	a4,22
     cd4:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     cd8:	fff00513          	li	a0,-1
     cdc:	00008067          	ret

00000ce0 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     ce0:	00000513          	li	a0,0
     ce4:	00008067          	ret

00000ce8 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     ce8:	fe010113          	add	sp,sp,-32
     cec:	00912a23          	sw	s1,20(sp)
     cf0:	01212823          	sw	s2,16(sp)
     cf4:	00112e23          	sw	ra,28(sp)
     cf8:	00812c23          	sw	s0,24(sp)
     cfc:	01312623          	sw	s3,12(sp)
     d00:	01412423          	sw	s4,8(sp)
     d04:	00058913          	mv	s2,a1
     d08:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     d0c:	06051463          	bnez	a0,d74 <_read+0x8c>
     d10:	00050413          	mv	s0,a0
     d14:	fff50537          	lui	a0,0xfff50
     d18:	1a0000ef          	jal	eb8 <neorv32_uart_available>
     d1c:	04050c63          	beqz	a0,d74 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d20:	00a00993          	li	s3,10
     d24:	00d00a13          	li	s4,13
    while (len--) {
     d28:	00941663          	bne	s0,s1,d34 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     d2c:	00048413          	mv	s0,s1
     d30:	0200006f          	j	d50 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     d34:	fff50537          	lui	a0,0xfff50
     d38:	1d0000ef          	jal	f08 <neorv32_uart_getc>
      *ptr++ = c;
     d3c:	008907b3          	add	a5,s2,s0
     d40:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     d44:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d48:	01350463          	beq	a0,s3,d50 <_read+0x68>
     d4c:	fd451ee3          	bne	a0,s4,d28 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     d50:	01c12083          	lw	ra,28(sp)
     d54:	00040513          	mv	a0,s0
     d58:	01812403          	lw	s0,24(sp)
     d5c:	01412483          	lw	s1,20(sp)
     d60:	01012903          	lw	s2,16(sp)
     d64:	00c12983          	lw	s3,12(sp)
     d68:	00812a03          	lw	s4,8(sp)
     d6c:	02010113          	add	sp,sp,32
     d70:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     d74:	fff60537          	lui	a0,0xfff60
     d78:	140000ef          	jal	eb8 <neorv32_uart_available>
  int read_cnt = 0;
     d7c:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     d80:	02050863          	beqz	a0,db0 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d84:	00a00993          	li	s3,10
     d88:	00d00a13          	li	s4,13
    while (len--) {
     d8c:	fa9400e3          	beq	s0,s1,d2c <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     d90:	fff60537          	lui	a0,0xfff60
     d94:	174000ef          	jal	f08 <neorv32_uart_getc>
      *ptr++ = c;
     d98:	008907b3          	add	a5,s2,s0
     d9c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     da0:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     da4:	fb3506e3          	beq	a0,s3,d50 <_read+0x68>
     da8:	ff4512e3          	bne	a0,s4,d8c <_read+0xa4>
     dac:	fa5ff06f          	j	d50 <_read+0x68>
    errno = ENOSYS;
     db0:	800007b7          	lui	a5,0x80000
     db4:	05800713          	li	a4,88
     db8:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     dbc:	fff00413          	li	s0,-1
     dc0:	f91ff06f          	j	d50 <_read+0x68>

00000dc4 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     dc4:	ff010113          	add	sp,sp,-16
     dc8:	00812423          	sw	s0,8(sp)
     dcc:	00912223          	sw	s1,4(sp)
     dd0:	00112623          	sw	ra,12(sp)
     dd4:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     dd8:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     ddc:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     de0:	00058413          	mv	s0,a1
     de4:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     de8:	04a7ec63          	bltu	a5,a0,e40 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     dec:	fff50537          	lui	a0,0xfff50
     df0:	0c8000ef          	jal	eb8 <neorv32_uart_available>
     df4:	00940933          	add	s2,s0,s1
     df8:	02051463          	bnez	a0,e20 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     dfc:	800007b7          	lui	a5,0x80000
     e00:	05800713          	li	a4,88
     e04:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     e08:	fff00493          	li	s1,-1
     e0c:	0180006f          	j	e24 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     e10:	00044583          	lbu	a1,0(s0)
     e14:	fff50537          	lui	a0,0xfff50
     e18:	00140413          	add	s0,s0,1
     e1c:	0d8000ef          	jal	ef4 <neorv32_uart_putc>
      while (len--) {
     e20:	fe8918e3          	bne	s2,s0,e10 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     e24:	00c12083          	lw	ra,12(sp)
     e28:	00812403          	lw	s0,8(sp)
     e2c:	00012903          	lw	s2,0(sp)
     e30:	00048513          	mv	a0,s1
     e34:	00412483          	lw	s1,4(sp)
     e38:	01010113          	add	sp,sp,16
     e3c:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     e40:	fff60537          	lui	a0,0xfff60
     e44:	074000ef          	jal	eb8 <neorv32_uart_available>
     e48:	00940933          	add	s2,s0,s1
     e4c:	fa0508e3          	beqz	a0,dfc <_write+0x38>
    while (len--) {
     e50:	fd240ae3          	beq	s0,s2,e24 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     e54:	00044583          	lbu	a1,0(s0)
     e58:	fff60537          	lui	a0,0xfff60
     e5c:	00140413          	add	s0,s0,1
     e60:	094000ef          	jal	ef4 <neorv32_uart_putc>
      write_cnt++;
     e64:	fedff06f          	j	e50 <_write+0x8c>

00000e68 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     e68:	80000737          	lui	a4,0x80000
     e6c:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     e70:	80039637          	lui	a2,0x80039
void *_sbrk(int incr) {
     e74:	00050793          	mv	a5,a0
     e78:	09460613          	add	a2,a2,148 # 80039094 <__crt0_bss_end>
  if (curr_heap == NULL) {
     e7c:	00069463          	bnez	a3,e84 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     e80:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     e84:	800396b7          	lui	a3,0x80039
     e88:	09468693          	add	a3,a3,148 # 80039094 <__crt0_bss_end>
     e8c:	00c69c63          	bne	a3,a2,ea4 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     e90:	800007b7          	lui	a5,0x80000
     e94:	00c00713          	li	a4,12
     e98:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     e9c:	fff00513          	li	a0,-1
     ea0:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     ea4:	71472503          	lw	a0,1812(a4)
     ea8:	00f507b3          	add	a5,a0,a5
     eac:	fed7f2e3          	bgeu	a5,a3,e90 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     eb0:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     eb4:	00008067          	ret

00000eb8 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     eb8:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     ebc:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     ec0:	00e51c63          	bne	a0,a4,ed8 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     ec4:	fffe07b7          	lui	a5,0xfffe0
     ec8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     ecc:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     ed0:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     ed4:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     ed8:	fff60737          	lui	a4,0xfff60
    return 0;
     edc:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     ee0:	fee79ae3          	bne	a5,a4,ed4 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     ee4:	fffe07b7          	lui	a5,0xfffe0
     ee8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     eec:	020007b7          	lui	a5,0x2000
     ef0:	fe1ff06f          	j	ed0 <neorv32_uart_available+0x18>

00000ef4 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     ef4:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     ef8:	00a79713          	sll	a4,a5,0xa
     efc:	fe075ce3          	bgez	a4,ef4 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     f00:	00b52223          	sw	a1,4(a0)
}
     f04:	00008067          	ret

00000f08 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     f08:	00052783          	lw	a5,0(a0)
     f0c:	00f79713          	sll	a4,a5,0xf
     f10:	fe075ce3          	bgez	a4,f08 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     f14:	00452503          	lw	a0,4(a0)
}
     f18:	0ff57513          	zext.b	a0,a0
     f1c:	00008067          	ret

00000f20 <printf>:
     f20:	fc010113          	add	sp,sp,-64
     f24:	02c12423          	sw	a2,40(sp)
     f28:	02d12623          	sw	a3,44(sp)
     f2c:	7ffff317          	auipc	t1,0x7ffff
     f30:	7dc32303          	lw	t1,2012(t1) # 80000708 <_impure_ptr>
     f34:	02b12223          	sw	a1,36(sp)
     f38:	02e12823          	sw	a4,48(sp)
     f3c:	02f12a23          	sw	a5,52(sp)
     f40:	03012c23          	sw	a6,56(sp)
     f44:	03112e23          	sw	a7,60(sp)
     f48:	00832583          	lw	a1,8(t1)
     f4c:	02410693          	add	a3,sp,36
     f50:	00050613          	mv	a2,a0
     f54:	00030513          	mv	a0,t1
     f58:	00112e23          	sw	ra,28(sp)
     f5c:	00d12623          	sw	a3,12(sp)
     f60:	0c8010ef          	jal	2028 <_vfprintf_r>
     f64:	01c12083          	lw	ra,28(sp)
     f68:	04010113          	add	sp,sp,64
     f6c:	00008067          	ret

00000f70 <putchar>:
     f70:	7ffff797          	auipc	a5,0x7ffff
     f74:	7987a783          	lw	a5,1944(a5) # 80000708 <_impure_ptr>
     f78:	0087a603          	lw	a2,8(a5)
     f7c:	00050593          	mv	a1,a0
     f80:	00078513          	mv	a0,a5
     f84:	3c00606f          	j	7344 <_putc_r>

00000f88 <_puts_r>:
     f88:	fd010113          	add	sp,sp,-48
     f8c:	02812423          	sw	s0,40(sp)
     f90:	00050413          	mv	s0,a0
     f94:	00058513          	mv	a0,a1
     f98:	02912223          	sw	s1,36(sp)
     f9c:	02112623          	sw	ra,44(sp)
     fa0:	00058493          	mv	s1,a1
     fa4:	3b0000ef          	jal	1354 <strlen>
     fa8:	00150713          	add	a4,a0,1
     fac:	0000e697          	auipc	a3,0xe
     fb0:	22068693          	add	a3,a3,544 # f1cc <__fini_array_end+0x154>
     fb4:	00e12623          	sw	a4,12(sp)
     fb8:	03442783          	lw	a5,52(s0)
     fbc:	01010713          	add	a4,sp,16
     fc0:	00d12c23          	sw	a3,24(sp)
     fc4:	00e12223          	sw	a4,4(sp)
     fc8:	00100693          	li	a3,1
     fcc:	00200713          	li	a4,2
     fd0:	00912823          	sw	s1,16(sp)
     fd4:	00a12a23          	sw	a0,20(sp)
     fd8:	00d12e23          	sw	a3,28(sp)
     fdc:	00e12423          	sw	a4,8(sp)
     fe0:	00842483          	lw	s1,8(s0)
     fe4:	0c078263          	beqz	a5,10a8 <_puts_r+0x120>
     fe8:	0644a703          	lw	a4,100(s1)
     fec:	00c49783          	lh	a5,12(s1)
     ff0:	00177713          	and	a4,a4,1
     ff4:	00071663          	bnez	a4,1000 <_puts_r+0x78>
     ff8:	2007f713          	and	a4,a5,512
     ffc:	08070e63          	beqz	a4,1098 <_puts_r+0x110>
    1000:	01279713          	sll	a4,a5,0x12
    1004:	02074263          	bltz	a4,1028 <_puts_r+0xa0>
    1008:	0644a703          	lw	a4,100(s1)
    100c:	ffffe6b7          	lui	a3,0xffffe
    1010:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1014:	00002637          	lui	a2,0x2
    1018:	00c7e7b3          	or	a5,a5,a2
    101c:	00d77733          	and	a4,a4,a3
    1020:	00f49623          	sh	a5,12(s1)
    1024:	06e4a223          	sw	a4,100(s1)
    1028:	00040513          	mv	a0,s0
    102c:	00410613          	add	a2,sp,4
    1030:	00048593          	mv	a1,s1
    1034:	549050ef          	jal	6d7c <__sfvwrite_r>
    1038:	0644a783          	lw	a5,100(s1)
    103c:	00153413          	seqz	s0,a0
    1040:	40800433          	neg	s0,s0
    1044:	00b47413          	and	s0,s0,11
    1048:	0017f793          	and	a5,a5,1
    104c:	fff40413          	add	s0,s0,-1
    1050:	00079863          	bnez	a5,1060 <_puts_r+0xd8>
    1054:	00c4d783          	lhu	a5,12(s1)
    1058:	2007f793          	and	a5,a5,512
    105c:	00078e63          	beqz	a5,1078 <_puts_r+0xf0>
    1060:	02c12083          	lw	ra,44(sp)
    1064:	00040513          	mv	a0,s0
    1068:	02812403          	lw	s0,40(sp)
    106c:	02412483          	lw	s1,36(sp)
    1070:	03010113          	add	sp,sp,48
    1074:	00008067          	ret
    1078:	0584a503          	lw	a0,88(s1)
    107c:	054000ef          	jal	10d0 <__retarget_lock_release_recursive>
    1080:	02c12083          	lw	ra,44(sp)
    1084:	00040513          	mv	a0,s0
    1088:	02812403          	lw	s0,40(sp)
    108c:	02412483          	lw	s1,36(sp)
    1090:	03010113          	add	sp,sp,48
    1094:	00008067          	ret
    1098:	0584a503          	lw	a0,88(s1)
    109c:	030000ef          	jal	10cc <__retarget_lock_acquire_recursive>
    10a0:	00c49783          	lh	a5,12(s1)
    10a4:	f5dff06f          	j	1000 <_puts_r+0x78>
    10a8:	00040513          	mv	a0,s0
    10ac:	449050ef          	jal	6cf4 <__sinit>
    10b0:	f39ff06f          	j	fe8 <_puts_r+0x60>

000010b4 <puts>:
    10b4:	00050593          	mv	a1,a0
    10b8:	7ffff517          	auipc	a0,0x7ffff
    10bc:	65052503          	lw	a0,1616(a0) # 80000708 <_impure_ptr>
    10c0:	ec9ff06f          	j	f88 <_puts_r>

000010c4 <__retarget_lock_init_recursive>:
    10c4:	00008067          	ret

000010c8 <__retarget_lock_close_recursive>:
    10c8:	00008067          	ret

000010cc <__retarget_lock_acquire_recursive>:
    10cc:	00008067          	ret

000010d0 <__retarget_lock_release_recursive>:
    10d0:	00008067          	ret

000010d4 <memset>:
    10d4:	00f00313          	li	t1,15
    10d8:	00050713          	mv	a4,a0
    10dc:	02c37e63          	bgeu	t1,a2,1118 <memset+0x44>
    10e0:	00f77793          	and	a5,a4,15
    10e4:	0a079063          	bnez	a5,1184 <memset+0xb0>
    10e8:	08059263          	bnez	a1,116c <memset+0x98>
    10ec:	ff067693          	and	a3,a2,-16
    10f0:	00f67613          	and	a2,a2,15
    10f4:	00e686b3          	add	a3,a3,a4
    10f8:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    10fc:	00b72223          	sw	a1,4(a4)
    1100:	00b72423          	sw	a1,8(a4)
    1104:	00b72623          	sw	a1,12(a4)
    1108:	01070713          	add	a4,a4,16
    110c:	fed766e3          	bltu	a4,a3,10f8 <memset+0x24>
    1110:	00061463          	bnez	a2,1118 <memset+0x44>
    1114:	00008067          	ret
    1118:	40c306b3          	sub	a3,t1,a2
    111c:	00269693          	sll	a3,a3,0x2
    1120:	00000297          	auipc	t0,0x0
    1124:	005686b3          	add	a3,a3,t0
    1128:	00c68067          	jr	12(a3)
    112c:	00b70723          	sb	a1,14(a4)
    1130:	00b706a3          	sb	a1,13(a4)
    1134:	00b70623          	sb	a1,12(a4)
    1138:	00b705a3          	sb	a1,11(a4)
    113c:	00b70523          	sb	a1,10(a4)
    1140:	00b704a3          	sb	a1,9(a4)
    1144:	00b70423          	sb	a1,8(a4)
    1148:	00b703a3          	sb	a1,7(a4)
    114c:	00b70323          	sb	a1,6(a4)
    1150:	00b702a3          	sb	a1,5(a4)
    1154:	00b70223          	sb	a1,4(a4)
    1158:	00b701a3          	sb	a1,3(a4)
    115c:	00b70123          	sb	a1,2(a4)
    1160:	00b700a3          	sb	a1,1(a4)
    1164:	00b70023          	sb	a1,0(a4)
    1168:	00008067          	ret
    116c:	0ff5f593          	zext.b	a1,a1
    1170:	00859693          	sll	a3,a1,0x8
    1174:	00d5e5b3          	or	a1,a1,a3
    1178:	01059693          	sll	a3,a1,0x10
    117c:	00d5e5b3          	or	a1,a1,a3
    1180:	f6dff06f          	j	10ec <memset+0x18>
    1184:	00279693          	sll	a3,a5,0x2
    1188:	00000297          	auipc	t0,0x0
    118c:	005686b3          	add	a3,a3,t0
    1190:	00008293          	mv	t0,ra
    1194:	fa0680e7          	jalr	-96(a3)
    1198:	00028093          	mv	ra,t0
    119c:	ff078793          	add	a5,a5,-16
    11a0:	40f70733          	sub	a4,a4,a5
    11a4:	00f60633          	add	a2,a2,a5
    11a8:	f6c378e3          	bgeu	t1,a2,1118 <memset+0x44>
    11ac:	f3dff06f          	j	10e8 <memset+0x14>

000011b0 <memcpy>:
    11b0:	00a5c7b3          	xor	a5,a1,a0
    11b4:	0037f793          	and	a5,a5,3
    11b8:	00c508b3          	add	a7,a0,a2
    11bc:	06079463          	bnez	a5,1224 <memcpy+0x74>
    11c0:	00300793          	li	a5,3
    11c4:	06c7f063          	bgeu	a5,a2,1224 <memcpy+0x74>
    11c8:	00357793          	and	a5,a0,3
    11cc:	00050713          	mv	a4,a0
    11d0:	06079a63          	bnez	a5,1244 <memcpy+0x94>
    11d4:	ffc8f613          	and	a2,a7,-4
    11d8:	40e606b3          	sub	a3,a2,a4
    11dc:	02000793          	li	a5,32
    11e0:	08d7ce63          	blt	a5,a3,127c <memcpy+0xcc>
    11e4:	00058693          	mv	a3,a1
    11e8:	00070793          	mv	a5,a4
    11ec:	02c77863          	bgeu	a4,a2,121c <memcpy+0x6c>
    11f0:	0006a803          	lw	a6,0(a3)
    11f4:	00478793          	add	a5,a5,4
    11f8:	00468693          	add	a3,a3,4
    11fc:	ff07ae23          	sw	a6,-4(a5)
    1200:	fec7e8e3          	bltu	a5,a2,11f0 <memcpy+0x40>
    1204:	fff60793          	add	a5,a2,-1 # 1fff <_malloc_r+0x7cf>
    1208:	40e787b3          	sub	a5,a5,a4
    120c:	ffc7f793          	and	a5,a5,-4
    1210:	00478793          	add	a5,a5,4
    1214:	00f70733          	add	a4,a4,a5
    1218:	00f585b3          	add	a1,a1,a5
    121c:	01176863          	bltu	a4,a7,122c <memcpy+0x7c>
    1220:	00008067          	ret
    1224:	00050713          	mv	a4,a0
    1228:	05157863          	bgeu	a0,a7,1278 <memcpy+0xc8>
    122c:	0005c783          	lbu	a5,0(a1)
    1230:	00170713          	add	a4,a4,1
    1234:	00158593          	add	a1,a1,1
    1238:	fef70fa3          	sb	a5,-1(a4)
    123c:	fee898e3          	bne	a7,a4,122c <memcpy+0x7c>
    1240:	00008067          	ret
    1244:	0005c683          	lbu	a3,0(a1)
    1248:	00170713          	add	a4,a4,1
    124c:	00377793          	and	a5,a4,3
    1250:	fed70fa3          	sb	a3,-1(a4)
    1254:	00158593          	add	a1,a1,1
    1258:	f6078ee3          	beqz	a5,11d4 <memcpy+0x24>
    125c:	0005c683          	lbu	a3,0(a1)
    1260:	00170713          	add	a4,a4,1
    1264:	00377793          	and	a5,a4,3
    1268:	fed70fa3          	sb	a3,-1(a4)
    126c:	00158593          	add	a1,a1,1
    1270:	fc079ae3          	bnez	a5,1244 <memcpy+0x94>
    1274:	f61ff06f          	j	11d4 <memcpy+0x24>
    1278:	00008067          	ret
    127c:	ff010113          	add	sp,sp,-16
    1280:	00812623          	sw	s0,12(sp)
    1284:	02000413          	li	s0,32
    1288:	0005a383          	lw	t2,0(a1)
    128c:	0045a283          	lw	t0,4(a1)
    1290:	0085af83          	lw	t6,8(a1)
    1294:	00c5af03          	lw	t5,12(a1)
    1298:	0105ae83          	lw	t4,16(a1)
    129c:	0145ae03          	lw	t3,20(a1)
    12a0:	0185a303          	lw	t1,24(a1)
    12a4:	01c5a803          	lw	a6,28(a1)
    12a8:	0205a683          	lw	a3,32(a1)
    12ac:	02470713          	add	a4,a4,36
    12b0:	40e607b3          	sub	a5,a2,a4
    12b4:	fc772e23          	sw	t2,-36(a4)
    12b8:	fe572023          	sw	t0,-32(a4)
    12bc:	fff72223          	sw	t6,-28(a4)
    12c0:	ffe72423          	sw	t5,-24(a4)
    12c4:	ffd72623          	sw	t4,-20(a4)
    12c8:	ffc72823          	sw	t3,-16(a4)
    12cc:	fe672a23          	sw	t1,-12(a4)
    12d0:	ff072c23          	sw	a6,-8(a4)
    12d4:	fed72e23          	sw	a3,-4(a4)
    12d8:	02458593          	add	a1,a1,36
    12dc:	faf446e3          	blt	s0,a5,1288 <memcpy+0xd8>
    12e0:	00058693          	mv	a3,a1
    12e4:	00070793          	mv	a5,a4
    12e8:	02c77863          	bgeu	a4,a2,1318 <memcpy+0x168>
    12ec:	0006a803          	lw	a6,0(a3)
    12f0:	00478793          	add	a5,a5,4
    12f4:	00468693          	add	a3,a3,4
    12f8:	ff07ae23          	sw	a6,-4(a5)
    12fc:	fec7e8e3          	bltu	a5,a2,12ec <memcpy+0x13c>
    1300:	fff60793          	add	a5,a2,-1
    1304:	40e787b3          	sub	a5,a5,a4
    1308:	ffc7f793          	and	a5,a5,-4
    130c:	00478793          	add	a5,a5,4
    1310:	00f70733          	add	a4,a4,a5
    1314:	00f585b3          	add	a1,a1,a5
    1318:	01176863          	bltu	a4,a7,1328 <memcpy+0x178>
    131c:	00c12403          	lw	s0,12(sp)
    1320:	01010113          	add	sp,sp,16
    1324:	00008067          	ret
    1328:	0005c783          	lbu	a5,0(a1)
    132c:	00170713          	add	a4,a4,1
    1330:	00158593          	add	a1,a1,1
    1334:	fef70fa3          	sb	a5,-1(a4)
    1338:	fee882e3          	beq	a7,a4,131c <memcpy+0x16c>
    133c:	0005c783          	lbu	a5,0(a1)
    1340:	00170713          	add	a4,a4,1
    1344:	00158593          	add	a1,a1,1
    1348:	fef70fa3          	sb	a5,-1(a4)
    134c:	fce89ee3          	bne	a7,a4,1328 <memcpy+0x178>
    1350:	fcdff06f          	j	131c <memcpy+0x16c>

00001354 <strlen>:
    1354:	00357793          	and	a5,a0,3
    1358:	00050713          	mv	a4,a0
    135c:	04079c63          	bnez	a5,13b4 <strlen+0x60>
    1360:	7f7f86b7          	lui	a3,0x7f7f8
    1364:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1368:	fff00593          	li	a1,-1
    136c:	00072603          	lw	a2,0(a4)
    1370:	00470713          	add	a4,a4,4
    1374:	00d677b3          	and	a5,a2,a3
    1378:	00d787b3          	add	a5,a5,a3
    137c:	00c7e7b3          	or	a5,a5,a2
    1380:	00d7e7b3          	or	a5,a5,a3
    1384:	feb784e3          	beq	a5,a1,136c <strlen+0x18>
    1388:	ffc74683          	lbu	a3,-4(a4)
    138c:	40a707b3          	sub	a5,a4,a0
    1390:	04068463          	beqz	a3,13d8 <strlen+0x84>
    1394:	ffd74683          	lbu	a3,-3(a4)
    1398:	02068c63          	beqz	a3,13d0 <strlen+0x7c>
    139c:	ffe74503          	lbu	a0,-2(a4)
    13a0:	00a03533          	snez	a0,a0
    13a4:	00f50533          	add	a0,a0,a5
    13a8:	ffe50513          	add	a0,a0,-2
    13ac:	00008067          	ret
    13b0:	fa0688e3          	beqz	a3,1360 <strlen+0xc>
    13b4:	00074783          	lbu	a5,0(a4)
    13b8:	00170713          	add	a4,a4,1
    13bc:	00377693          	and	a3,a4,3
    13c0:	fe0798e3          	bnez	a5,13b0 <strlen+0x5c>
    13c4:	40a70733          	sub	a4,a4,a0
    13c8:	fff70513          	add	a0,a4,-1
    13cc:	00008067          	ret
    13d0:	ffd78513          	add	a0,a5,-3
    13d4:	00008067          	ret
    13d8:	ffc78513          	add	a0,a5,-4
    13dc:	00008067          	ret

000013e0 <_malloc_trim_r>:
    13e0:	fe010113          	add	sp,sp,-32
    13e4:	00812c23          	sw	s0,24(sp)
    13e8:	00912a23          	sw	s1,20(sp)
    13ec:	01212823          	sw	s2,16(sp)
    13f0:	01312623          	sw	s3,12(sp)
    13f4:	01412423          	sw	s4,8(sp)
    13f8:	00058993          	mv	s3,a1
    13fc:	00112e23          	sw	ra,28(sp)
    1400:	00050913          	mv	s2,a0
    1404:	7ffffa17          	auipc	s4,0x7ffff
    1408:	d1ca0a13          	add	s4,s4,-740 # 80000120 <__malloc_av_>
    140c:	405000ef          	jal	2010 <__malloc_lock>
    1410:	008a2703          	lw	a4,8(s4)
    1414:	000017b7          	lui	a5,0x1
    1418:	fef78793          	add	a5,a5,-17 # fef <_puts_r+0x67>
    141c:	00472483          	lw	s1,4(a4)
    1420:	00001737          	lui	a4,0x1
    1424:	ffc4f493          	and	s1,s1,-4
    1428:	00f48433          	add	s0,s1,a5
    142c:	41340433          	sub	s0,s0,s3
    1430:	00c45413          	srl	s0,s0,0xc
    1434:	fff40413          	add	s0,s0,-1
    1438:	00c41413          	sll	s0,s0,0xc
    143c:	00e44e63          	blt	s0,a4,1458 <_malloc_trim_r+0x78>
    1440:	00000593          	li	a1,0
    1444:	00090513          	mv	a0,s2
    1448:	105060ef          	jal	7d4c <_sbrk_r>
    144c:	008a2783          	lw	a5,8(s4)
    1450:	009787b3          	add	a5,a5,s1
    1454:	02f50863          	beq	a0,a5,1484 <_malloc_trim_r+0xa4>
    1458:	00090513          	mv	a0,s2
    145c:	3c1000ef          	jal	201c <__malloc_unlock>
    1460:	01c12083          	lw	ra,28(sp)
    1464:	01812403          	lw	s0,24(sp)
    1468:	01412483          	lw	s1,20(sp)
    146c:	01012903          	lw	s2,16(sp)
    1470:	00c12983          	lw	s3,12(sp)
    1474:	00812a03          	lw	s4,8(sp)
    1478:	00000513          	li	a0,0
    147c:	02010113          	add	sp,sp,32
    1480:	00008067          	ret
    1484:	408005b3          	neg	a1,s0
    1488:	00090513          	mv	a0,s2
    148c:	0c1060ef          	jal	7d4c <_sbrk_r>
    1490:	fff00793          	li	a5,-1
    1494:	04f50a63          	beq	a0,a5,14e8 <_malloc_trim_r+0x108>
    1498:	80038717          	auipc	a4,0x80038
    149c:	a9c70713          	add	a4,a4,-1380 # 80038f34 <__malloc_current_mallinfo>
    14a0:	00072783          	lw	a5,0(a4)
    14a4:	008a2683          	lw	a3,8(s4)
    14a8:	408484b3          	sub	s1,s1,s0
    14ac:	0014e493          	or	s1,s1,1
    14b0:	408787b3          	sub	a5,a5,s0
    14b4:	00090513          	mv	a0,s2
    14b8:	0096a223          	sw	s1,4(a3)
    14bc:	00f72023          	sw	a5,0(a4)
    14c0:	35d000ef          	jal	201c <__malloc_unlock>
    14c4:	01c12083          	lw	ra,28(sp)
    14c8:	01812403          	lw	s0,24(sp)
    14cc:	01412483          	lw	s1,20(sp)
    14d0:	01012903          	lw	s2,16(sp)
    14d4:	00c12983          	lw	s3,12(sp)
    14d8:	00812a03          	lw	s4,8(sp)
    14dc:	00100513          	li	a0,1
    14e0:	02010113          	add	sp,sp,32
    14e4:	00008067          	ret
    14e8:	00000593          	li	a1,0
    14ec:	00090513          	mv	a0,s2
    14f0:	05d060ef          	jal	7d4c <_sbrk_r>
    14f4:	008a2703          	lw	a4,8(s4)
    14f8:	00f00693          	li	a3,15
    14fc:	40e507b3          	sub	a5,a0,a4
    1500:	f4f6dce3          	bge	a3,a5,1458 <_malloc_trim_r+0x78>
    1504:	7ffff697          	auipc	a3,0x7ffff
    1508:	2086a683          	lw	a3,520(a3) # 8000070c <__malloc_sbrk_base>
    150c:	40d50533          	sub	a0,a0,a3
    1510:	0017e793          	or	a5,a5,1
    1514:	80038697          	auipc	a3,0x80038
    1518:	a2a6a023          	sw	a0,-1504(a3) # 80038f34 <__malloc_current_mallinfo>
    151c:	00f72223          	sw	a5,4(a4)
    1520:	f39ff06f          	j	1458 <_malloc_trim_r+0x78>

00001524 <_free_r>:
    1524:	18058263          	beqz	a1,16a8 <_free_r+0x184>
    1528:	ff010113          	add	sp,sp,-16
    152c:	00812423          	sw	s0,8(sp)
    1530:	00912223          	sw	s1,4(sp)
    1534:	00058413          	mv	s0,a1
    1538:	00050493          	mv	s1,a0
    153c:	00112623          	sw	ra,12(sp)
    1540:	2d1000ef          	jal	2010 <__malloc_lock>
    1544:	ffc42583          	lw	a1,-4(s0)
    1548:	ff840713          	add	a4,s0,-8
    154c:	7ffff517          	auipc	a0,0x7ffff
    1550:	bd450513          	add	a0,a0,-1068 # 80000120 <__malloc_av_>
    1554:	ffe5f793          	and	a5,a1,-2
    1558:	00f70633          	add	a2,a4,a5
    155c:	00462683          	lw	a3,4(a2)
    1560:	00852803          	lw	a6,8(a0)
    1564:	ffc6f693          	and	a3,a3,-4
    1568:	1ac80263          	beq	a6,a2,170c <_free_r+0x1e8>
    156c:	00d62223          	sw	a3,4(a2)
    1570:	0015f593          	and	a1,a1,1
    1574:	00d60833          	add	a6,a2,a3
    1578:	0a059063          	bnez	a1,1618 <_free_r+0xf4>
    157c:	ff842303          	lw	t1,-8(s0)
    1580:	00482583          	lw	a1,4(a6) # 4004 <_vfprintf_r+0x1fdc>
    1584:	7ffff897          	auipc	a7,0x7ffff
    1588:	ba488893          	add	a7,a7,-1116 # 80000128 <__malloc_av_+0x8>
    158c:	40670733          	sub	a4,a4,t1
    1590:	00872803          	lw	a6,8(a4)
    1594:	006787b3          	add	a5,a5,t1
    1598:	0015f593          	and	a1,a1,1
    159c:	15180263          	beq	a6,a7,16e0 <_free_r+0x1bc>
    15a0:	00c72303          	lw	t1,12(a4)
    15a4:	00682623          	sw	t1,12(a6)
    15a8:	01032423          	sw	a6,8(t1)
    15ac:	1a058a63          	beqz	a1,1760 <_free_r+0x23c>
    15b0:	0017e693          	or	a3,a5,1
    15b4:	00d72223          	sw	a3,4(a4)
    15b8:	00f62023          	sw	a5,0(a2)
    15bc:	1ff00693          	li	a3,511
    15c0:	06f6ec63          	bltu	a3,a5,1638 <_free_r+0x114>
    15c4:	ff87f693          	and	a3,a5,-8
    15c8:	00868693          	add	a3,a3,8
    15cc:	00452583          	lw	a1,4(a0)
    15d0:	00d506b3          	add	a3,a0,a3
    15d4:	0006a603          	lw	a2,0(a3)
    15d8:	0057d813          	srl	a6,a5,0x5
    15dc:	00100793          	li	a5,1
    15e0:	010797b3          	sll	a5,a5,a6
    15e4:	00b7e7b3          	or	a5,a5,a1
    15e8:	ff868593          	add	a1,a3,-8
    15ec:	00b72623          	sw	a1,12(a4)
    15f0:	00c72423          	sw	a2,8(a4)
    15f4:	00f52223          	sw	a5,4(a0)
    15f8:	00e6a023          	sw	a4,0(a3)
    15fc:	00e62623          	sw	a4,12(a2)
    1600:	00812403          	lw	s0,8(sp)
    1604:	00c12083          	lw	ra,12(sp)
    1608:	00048513          	mv	a0,s1
    160c:	00412483          	lw	s1,4(sp)
    1610:	01010113          	add	sp,sp,16
    1614:	2090006f          	j	201c <__malloc_unlock>
    1618:	00482583          	lw	a1,4(a6)
    161c:	0015f593          	and	a1,a1,1
    1620:	08058663          	beqz	a1,16ac <_free_r+0x188>
    1624:	0017e693          	or	a3,a5,1
    1628:	fed42e23          	sw	a3,-4(s0)
    162c:	00f62023          	sw	a5,0(a2)
    1630:	1ff00693          	li	a3,511
    1634:	f8f6f8e3          	bgeu	a3,a5,15c4 <_free_r+0xa0>
    1638:	0097d693          	srl	a3,a5,0x9
    163c:	00400613          	li	a2,4
    1640:	12d66463          	bltu	a2,a3,1768 <_free_r+0x244>
    1644:	0067d693          	srl	a3,a5,0x6
    1648:	03968593          	add	a1,a3,57
    164c:	03868613          	add	a2,a3,56
    1650:	00359593          	sll	a1,a1,0x3
    1654:	00b505b3          	add	a1,a0,a1
    1658:	0005a683          	lw	a3,0(a1)
    165c:	ff858593          	add	a1,a1,-8
    1660:	00d59863          	bne	a1,a3,1670 <_free_r+0x14c>
    1664:	15c0006f          	j	17c0 <_free_r+0x29c>
    1668:	0086a683          	lw	a3,8(a3)
    166c:	00d58863          	beq	a1,a3,167c <_free_r+0x158>
    1670:	0046a603          	lw	a2,4(a3)
    1674:	ffc67613          	and	a2,a2,-4
    1678:	fec7e8e3          	bltu	a5,a2,1668 <_free_r+0x144>
    167c:	00c6a583          	lw	a1,12(a3)
    1680:	00b72623          	sw	a1,12(a4)
    1684:	00d72423          	sw	a3,8(a4)
    1688:	00812403          	lw	s0,8(sp)
    168c:	00c12083          	lw	ra,12(sp)
    1690:	00e5a423          	sw	a4,8(a1)
    1694:	00048513          	mv	a0,s1
    1698:	00412483          	lw	s1,4(sp)
    169c:	00e6a623          	sw	a4,12(a3)
    16a0:	01010113          	add	sp,sp,16
    16a4:	1790006f          	j	201c <__malloc_unlock>
    16a8:	00008067          	ret
    16ac:	00d787b3          	add	a5,a5,a3
    16b0:	7ffff897          	auipc	a7,0x7ffff
    16b4:	a7888893          	add	a7,a7,-1416 # 80000128 <__malloc_av_+0x8>
    16b8:	00862683          	lw	a3,8(a2)
    16bc:	0f168063          	beq	a3,a7,179c <_free_r+0x278>
    16c0:	00c62803          	lw	a6,12(a2)
    16c4:	0017e593          	or	a1,a5,1
    16c8:	00f70633          	add	a2,a4,a5
    16cc:	0106a623          	sw	a6,12(a3)
    16d0:	00d82423          	sw	a3,8(a6)
    16d4:	00b72223          	sw	a1,4(a4)
    16d8:	00f62023          	sw	a5,0(a2)
    16dc:	ee1ff06f          	j	15bc <_free_r+0x98>
    16e0:	14059063          	bnez	a1,1820 <_free_r+0x2fc>
    16e4:	00862583          	lw	a1,8(a2)
    16e8:	00c62603          	lw	a2,12(a2)
    16ec:	00f686b3          	add	a3,a3,a5
    16f0:	0016e793          	or	a5,a3,1
    16f4:	00c5a623          	sw	a2,12(a1)
    16f8:	00b62423          	sw	a1,8(a2)
    16fc:	00f72223          	sw	a5,4(a4)
    1700:	00d70733          	add	a4,a4,a3
    1704:	00d72023          	sw	a3,0(a4)
    1708:	ef9ff06f          	j	1600 <_free_r+0xdc>
    170c:	0015f593          	and	a1,a1,1
    1710:	00d786b3          	add	a3,a5,a3
    1714:	02059063          	bnez	a1,1734 <_free_r+0x210>
    1718:	ff842583          	lw	a1,-8(s0)
    171c:	40b70733          	sub	a4,a4,a1
    1720:	00c72783          	lw	a5,12(a4)
    1724:	00872603          	lw	a2,8(a4)
    1728:	00b686b3          	add	a3,a3,a1
    172c:	00f62623          	sw	a5,12(a2)
    1730:	00c7a423          	sw	a2,8(a5)
    1734:	0016e793          	or	a5,a3,1
    1738:	00f72223          	sw	a5,4(a4)
    173c:	00e52423          	sw	a4,8(a0)
    1740:	7ffff797          	auipc	a5,0x7ffff
    1744:	fd07a783          	lw	a5,-48(a5) # 80000710 <__malloc_trim_threshold>
    1748:	eaf6ece3          	bltu	a3,a5,1600 <_free_r+0xdc>
    174c:	7ffff597          	auipc	a1,0x7ffff
    1750:	fe05a583          	lw	a1,-32(a1) # 8000072c <__malloc_top_pad>
    1754:	00048513          	mv	a0,s1
    1758:	c89ff0ef          	jal	13e0 <_malloc_trim_r>
    175c:	ea5ff06f          	j	1600 <_free_r+0xdc>
    1760:	00d787b3          	add	a5,a5,a3
    1764:	f55ff06f          	j	16b8 <_free_r+0x194>
    1768:	01400613          	li	a2,20
    176c:	02d67063          	bgeu	a2,a3,178c <_free_r+0x268>
    1770:	05400613          	li	a2,84
    1774:	06d66463          	bltu	a2,a3,17dc <_free_r+0x2b8>
    1778:	00c7d693          	srl	a3,a5,0xc
    177c:	06f68593          	add	a1,a3,111
    1780:	06e68613          	add	a2,a3,110
    1784:	00359593          	sll	a1,a1,0x3
    1788:	ecdff06f          	j	1654 <_free_r+0x130>
    178c:	05c68593          	add	a1,a3,92
    1790:	05b68613          	add	a2,a3,91
    1794:	00359593          	sll	a1,a1,0x3
    1798:	ebdff06f          	j	1654 <_free_r+0x130>
    179c:	00e52a23          	sw	a4,20(a0)
    17a0:	00e52823          	sw	a4,16(a0)
    17a4:	0017e693          	or	a3,a5,1
    17a8:	01172623          	sw	a7,12(a4)
    17ac:	01172423          	sw	a7,8(a4)
    17b0:	00d72223          	sw	a3,4(a4)
    17b4:	00f70733          	add	a4,a4,a5
    17b8:	00f72023          	sw	a5,0(a4)
    17bc:	e45ff06f          	j	1600 <_free_r+0xdc>
    17c0:	00452803          	lw	a6,4(a0)
    17c4:	40265613          	sra	a2,a2,0x2
    17c8:	00100793          	li	a5,1
    17cc:	00c797b3          	sll	a5,a5,a2
    17d0:	0107e7b3          	or	a5,a5,a6
    17d4:	00f52223          	sw	a5,4(a0)
    17d8:	ea9ff06f          	j	1680 <_free_r+0x15c>
    17dc:	15400613          	li	a2,340
    17e0:	00d66c63          	bltu	a2,a3,17f8 <_free_r+0x2d4>
    17e4:	00f7d693          	srl	a3,a5,0xf
    17e8:	07868593          	add	a1,a3,120
    17ec:	07768613          	add	a2,a3,119
    17f0:	00359593          	sll	a1,a1,0x3
    17f4:	e61ff06f          	j	1654 <_free_r+0x130>
    17f8:	55400613          	li	a2,1364
    17fc:	00d66c63          	bltu	a2,a3,1814 <_free_r+0x2f0>
    1800:	0127d693          	srl	a3,a5,0x12
    1804:	07d68593          	add	a1,a3,125
    1808:	07c68613          	add	a2,a3,124
    180c:	00359593          	sll	a1,a1,0x3
    1810:	e45ff06f          	j	1654 <_free_r+0x130>
    1814:	3f800593          	li	a1,1016
    1818:	07e00613          	li	a2,126
    181c:	e39ff06f          	j	1654 <_free_r+0x130>
    1820:	0017e693          	or	a3,a5,1
    1824:	00d72223          	sw	a3,4(a4)
    1828:	00f62023          	sw	a5,0(a2)
    182c:	dd5ff06f          	j	1600 <_free_r+0xdc>

00001830 <_malloc_r>:
    1830:	fd010113          	add	sp,sp,-48
    1834:	03212023          	sw	s2,32(sp)
    1838:	02112623          	sw	ra,44(sp)
    183c:	02812423          	sw	s0,40(sp)
    1840:	02912223          	sw	s1,36(sp)
    1844:	01312e23          	sw	s3,28(sp)
    1848:	00b58793          	add	a5,a1,11
    184c:	01600713          	li	a4,22
    1850:	00050913          	mv	s2,a0
    1854:	08f76263          	bltu	a4,a5,18d8 <_malloc_r+0xa8>
    1858:	01000793          	li	a5,16
    185c:	20b7e663          	bltu	a5,a1,1a68 <_malloc_r+0x238>
    1860:	7b0000ef          	jal	2010 <__malloc_lock>
    1864:	01800793          	li	a5,24
    1868:	00200593          	li	a1,2
    186c:	01000493          	li	s1,16
    1870:	7ffff997          	auipc	s3,0x7ffff
    1874:	8b098993          	add	s3,s3,-1872 # 80000120 <__malloc_av_>
    1878:	00f987b3          	add	a5,s3,a5
    187c:	0047a403          	lw	s0,4(a5)
    1880:	ff878713          	add	a4,a5,-8
    1884:	36e40463          	beq	s0,a4,1bec <_malloc_r+0x3bc>
    1888:	00442783          	lw	a5,4(s0)
    188c:	00c42683          	lw	a3,12(s0)
    1890:	00842603          	lw	a2,8(s0)
    1894:	ffc7f793          	and	a5,a5,-4
    1898:	00f407b3          	add	a5,s0,a5
    189c:	0047a703          	lw	a4,4(a5)
    18a0:	00d62623          	sw	a3,12(a2)
    18a4:	00c6a423          	sw	a2,8(a3)
    18a8:	00176713          	or	a4,a4,1
    18ac:	00090513          	mv	a0,s2
    18b0:	00e7a223          	sw	a4,4(a5)
    18b4:	768000ef          	jal	201c <__malloc_unlock>
    18b8:	00840513          	add	a0,s0,8
    18bc:	02c12083          	lw	ra,44(sp)
    18c0:	02812403          	lw	s0,40(sp)
    18c4:	02412483          	lw	s1,36(sp)
    18c8:	02012903          	lw	s2,32(sp)
    18cc:	01c12983          	lw	s3,28(sp)
    18d0:	03010113          	add	sp,sp,48
    18d4:	00008067          	ret
    18d8:	ff87f493          	and	s1,a5,-8
    18dc:	1807c663          	bltz	a5,1a68 <_malloc_r+0x238>
    18e0:	18b4e463          	bltu	s1,a1,1a68 <_malloc_r+0x238>
    18e4:	72c000ef          	jal	2010 <__malloc_lock>
    18e8:	1f700793          	li	a5,503
    18ec:	4097fa63          	bgeu	a5,s1,1d00 <_malloc_r+0x4d0>
    18f0:	0094d793          	srl	a5,s1,0x9
    18f4:	18078263          	beqz	a5,1a78 <_malloc_r+0x248>
    18f8:	00400713          	li	a4,4
    18fc:	36f76063          	bltu	a4,a5,1c5c <_malloc_r+0x42c>
    1900:	0064d793          	srl	a5,s1,0x6
    1904:	03978593          	add	a1,a5,57
    1908:	03878813          	add	a6,a5,56
    190c:	00359613          	sll	a2,a1,0x3
    1910:	7ffff997          	auipc	s3,0x7ffff
    1914:	81098993          	add	s3,s3,-2032 # 80000120 <__malloc_av_>
    1918:	00c98633          	add	a2,s3,a2
    191c:	00462403          	lw	s0,4(a2)
    1920:	ff860613          	add	a2,a2,-8
    1924:	02860863          	beq	a2,s0,1954 <_malloc_r+0x124>
    1928:	00f00513          	li	a0,15
    192c:	0140006f          	j	1940 <_malloc_r+0x110>
    1930:	00c42683          	lw	a3,12(s0)
    1934:	2a075863          	bgez	a4,1be4 <_malloc_r+0x3b4>
    1938:	00d60e63          	beq	a2,a3,1954 <_malloc_r+0x124>
    193c:	00068413          	mv	s0,a3
    1940:	00442783          	lw	a5,4(s0)
    1944:	ffc7f793          	and	a5,a5,-4
    1948:	40978733          	sub	a4,a5,s1
    194c:	fee552e3          	bge	a0,a4,1930 <_malloc_r+0x100>
    1950:	00080593          	mv	a1,a6
    1954:	0109a403          	lw	s0,16(s3)
    1958:	7fffe897          	auipc	a7,0x7fffe
    195c:	7d088893          	add	a7,a7,2000 # 80000128 <__malloc_av_+0x8>
    1960:	27140e63          	beq	s0,a7,1bdc <_malloc_r+0x3ac>
    1964:	00442783          	lw	a5,4(s0)
    1968:	00f00693          	li	a3,15
    196c:	ffc7f793          	and	a5,a5,-4
    1970:	40978733          	sub	a4,a5,s1
    1974:	38e6cc63          	blt	a3,a4,1d0c <_malloc_r+0x4dc>
    1978:	0119aa23          	sw	a7,20(s3)
    197c:	0119a823          	sw	a7,16(s3)
    1980:	36075063          	bgez	a4,1ce0 <_malloc_r+0x4b0>
    1984:	1ff00713          	li	a4,511
    1988:	0049a503          	lw	a0,4(s3)
    198c:	26f76863          	bltu	a4,a5,1bfc <_malloc_r+0x3cc>
    1990:	ff87f713          	and	a4,a5,-8
    1994:	00870713          	add	a4,a4,8
    1998:	00e98733          	add	a4,s3,a4
    199c:	00072683          	lw	a3,0(a4)
    19a0:	0057d613          	srl	a2,a5,0x5
    19a4:	00100793          	li	a5,1
    19a8:	00c797b3          	sll	a5,a5,a2
    19ac:	00f56533          	or	a0,a0,a5
    19b0:	ff870793          	add	a5,a4,-8
    19b4:	00f42623          	sw	a5,12(s0)
    19b8:	00d42423          	sw	a3,8(s0)
    19bc:	00a9a223          	sw	a0,4(s3)
    19c0:	00872023          	sw	s0,0(a4)
    19c4:	0086a623          	sw	s0,12(a3)
    19c8:	4025d793          	sra	a5,a1,0x2
    19cc:	00100613          	li	a2,1
    19d0:	00f61633          	sll	a2,a2,a5
    19d4:	0ac56a63          	bltu	a0,a2,1a88 <_malloc_r+0x258>
    19d8:	00a677b3          	and	a5,a2,a0
    19dc:	02079463          	bnez	a5,1a04 <_malloc_r+0x1d4>
    19e0:	00161613          	sll	a2,a2,0x1
    19e4:	ffc5f593          	and	a1,a1,-4
    19e8:	00a677b3          	and	a5,a2,a0
    19ec:	00458593          	add	a1,a1,4
    19f0:	00079a63          	bnez	a5,1a04 <_malloc_r+0x1d4>
    19f4:	00161613          	sll	a2,a2,0x1
    19f8:	00a677b3          	and	a5,a2,a0
    19fc:	00458593          	add	a1,a1,4
    1a00:	fe078ae3          	beqz	a5,19f4 <_malloc_r+0x1c4>
    1a04:	00f00813          	li	a6,15
    1a08:	00359313          	sll	t1,a1,0x3
    1a0c:	00698333          	add	t1,s3,t1
    1a10:	00030513          	mv	a0,t1
    1a14:	00c52783          	lw	a5,12(a0)
    1a18:	00058e13          	mv	t3,a1
    1a1c:	26f50263          	beq	a0,a5,1c80 <_malloc_r+0x450>
    1a20:	0047a703          	lw	a4,4(a5)
    1a24:	00078413          	mv	s0,a5
    1a28:	00c7a783          	lw	a5,12(a5)
    1a2c:	ffc77713          	and	a4,a4,-4
    1a30:	409706b3          	sub	a3,a4,s1
    1a34:	26d84263          	blt	a6,a3,1c98 <_malloc_r+0x468>
    1a38:	fe06c2e3          	bltz	a3,1a1c <_malloc_r+0x1ec>
    1a3c:	00e40733          	add	a4,s0,a4
    1a40:	00472683          	lw	a3,4(a4)
    1a44:	00842603          	lw	a2,8(s0)
    1a48:	00090513          	mv	a0,s2
    1a4c:	0016e693          	or	a3,a3,1
    1a50:	00d72223          	sw	a3,4(a4)
    1a54:	00f62623          	sw	a5,12(a2)
    1a58:	00c7a423          	sw	a2,8(a5)
    1a5c:	5c0000ef          	jal	201c <__malloc_unlock>
    1a60:	00840513          	add	a0,s0,8
    1a64:	e59ff06f          	j	18bc <_malloc_r+0x8c>
    1a68:	00c00793          	li	a5,12
    1a6c:	00f92023          	sw	a5,0(s2)
    1a70:	00000513          	li	a0,0
    1a74:	e49ff06f          	j	18bc <_malloc_r+0x8c>
    1a78:	20000613          	li	a2,512
    1a7c:	04000593          	li	a1,64
    1a80:	03f00813          	li	a6,63
    1a84:	e8dff06f          	j	1910 <_malloc_r+0xe0>
    1a88:	0089a403          	lw	s0,8(s3)
    1a8c:	01612823          	sw	s6,16(sp)
    1a90:	00442783          	lw	a5,4(s0)
    1a94:	ffc7fb13          	and	s6,a5,-4
    1a98:	009b6863          	bltu	s6,s1,1aa8 <_malloc_r+0x278>
    1a9c:	409b0733          	sub	a4,s6,s1
    1aa0:	00f00793          	li	a5,15
    1aa4:	0ee7ca63          	blt	a5,a4,1b98 <_malloc_r+0x368>
    1aa8:	01912223          	sw	s9,4(sp)
    1aac:	7ffffc97          	auipc	s9,0x7ffff
    1ab0:	c60c8c93          	add	s9,s9,-928 # 8000070c <__malloc_sbrk_base>
    1ab4:	000ca703          	lw	a4,0(s9)
    1ab8:	01412c23          	sw	s4,24(sp)
    1abc:	01512a23          	sw	s5,20(sp)
    1ac0:	01712623          	sw	s7,12(sp)
    1ac4:	7ffffa97          	auipc	s5,0x7ffff
    1ac8:	c68aaa83          	lw	s5,-920(s5) # 8000072c <__malloc_top_pad>
    1acc:	fff00793          	li	a5,-1
    1ad0:	01640a33          	add	s4,s0,s6
    1ad4:	01548ab3          	add	s5,s1,s5
    1ad8:	3ef70263          	beq	a4,a5,1ebc <_malloc_r+0x68c>
    1adc:	000017b7          	lui	a5,0x1
    1ae0:	00f78793          	add	a5,a5,15 # 100f <_puts_r+0x87>
    1ae4:	00fa8ab3          	add	s5,s5,a5
    1ae8:	fffff7b7          	lui	a5,0xfffff
    1aec:	00fafab3          	and	s5,s5,a5
    1af0:	000a8593          	mv	a1,s5
    1af4:	00090513          	mv	a0,s2
    1af8:	254060ef          	jal	7d4c <_sbrk_r>
    1afc:	fff00793          	li	a5,-1
    1b00:	00050b93          	mv	s7,a0
    1b04:	46f50663          	beq	a0,a5,1f70 <_malloc_r+0x740>
    1b08:	01812423          	sw	s8,8(sp)
    1b0c:	25456863          	bltu	a0,s4,1d5c <_malloc_r+0x52c>
    1b10:	80037c17          	auipc	s8,0x80037
    1b14:	424c0c13          	add	s8,s8,1060 # 80038f34 <__malloc_current_mallinfo>
    1b18:	000c2583          	lw	a1,0(s8)
    1b1c:	00ba85b3          	add	a1,s5,a1
    1b20:	00bc2023          	sw	a1,0(s8)
    1b24:	00058713          	mv	a4,a1
    1b28:	2caa1063          	bne	s4,a0,1de8 <_malloc_r+0x5b8>
    1b2c:	01451793          	sll	a5,a0,0x14
    1b30:	2a079c63          	bnez	a5,1de8 <_malloc_r+0x5b8>
    1b34:	0089ab83          	lw	s7,8(s3)
    1b38:	015b07b3          	add	a5,s6,s5
    1b3c:	0017e793          	or	a5,a5,1
    1b40:	00fba223          	sw	a5,4(s7)
    1b44:	7ffff717          	auipc	a4,0x7ffff
    1b48:	be470713          	add	a4,a4,-1052 # 80000728 <__malloc_max_sbrked_mem>
    1b4c:	00072683          	lw	a3,0(a4)
    1b50:	00b6f463          	bgeu	a3,a1,1b58 <_malloc_r+0x328>
    1b54:	00b72023          	sw	a1,0(a4)
    1b58:	7ffff717          	auipc	a4,0x7ffff
    1b5c:	bcc70713          	add	a4,a4,-1076 # 80000724 <__malloc_max_total_mem>
    1b60:	00072683          	lw	a3,0(a4)
    1b64:	00b6f463          	bgeu	a3,a1,1b6c <_malloc_r+0x33c>
    1b68:	00b72023          	sw	a1,0(a4)
    1b6c:	00812c03          	lw	s8,8(sp)
    1b70:	000b8413          	mv	s0,s7
    1b74:	ffc7f793          	and	a5,a5,-4
    1b78:	40978733          	sub	a4,a5,s1
    1b7c:	3897ec63          	bltu	a5,s1,1f14 <_malloc_r+0x6e4>
    1b80:	00f00793          	li	a5,15
    1b84:	38e7d863          	bge	a5,a4,1f14 <_malloc_r+0x6e4>
    1b88:	01812a03          	lw	s4,24(sp)
    1b8c:	01412a83          	lw	s5,20(sp)
    1b90:	00c12b83          	lw	s7,12(sp)
    1b94:	00412c83          	lw	s9,4(sp)
    1b98:	0014e793          	or	a5,s1,1
    1b9c:	00f42223          	sw	a5,4(s0)
    1ba0:	009404b3          	add	s1,s0,s1
    1ba4:	0099a423          	sw	s1,8(s3)
    1ba8:	00176713          	or	a4,a4,1
    1bac:	00090513          	mv	a0,s2
    1bb0:	00e4a223          	sw	a4,4(s1)
    1bb4:	468000ef          	jal	201c <__malloc_unlock>
    1bb8:	02c12083          	lw	ra,44(sp)
    1bbc:	00840513          	add	a0,s0,8
    1bc0:	02812403          	lw	s0,40(sp)
    1bc4:	01012b03          	lw	s6,16(sp)
    1bc8:	02412483          	lw	s1,36(sp)
    1bcc:	02012903          	lw	s2,32(sp)
    1bd0:	01c12983          	lw	s3,28(sp)
    1bd4:	03010113          	add	sp,sp,48
    1bd8:	00008067          	ret
    1bdc:	0049a503          	lw	a0,4(s3)
    1be0:	de9ff06f          	j	19c8 <_malloc_r+0x198>
    1be4:	00842603          	lw	a2,8(s0)
    1be8:	cb1ff06f          	j	1898 <_malloc_r+0x68>
    1bec:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1bf0:	00258593          	add	a1,a1,2
    1bf4:	d68780e3          	beq	a5,s0,1954 <_malloc_r+0x124>
    1bf8:	c91ff06f          	j	1888 <_malloc_r+0x58>
    1bfc:	0097d713          	srl	a4,a5,0x9
    1c00:	00400693          	li	a3,4
    1c04:	14e6f263          	bgeu	a3,a4,1d48 <_malloc_r+0x518>
    1c08:	01400693          	li	a3,20
    1c0c:	32e6e663          	bltu	a3,a4,1f38 <_malloc_r+0x708>
    1c10:	05c70613          	add	a2,a4,92
    1c14:	05b70693          	add	a3,a4,91
    1c18:	00361613          	sll	a2,a2,0x3
    1c1c:	00c98633          	add	a2,s3,a2
    1c20:	00062703          	lw	a4,0(a2)
    1c24:	ff860613          	add	a2,a2,-8
    1c28:	00e61863          	bne	a2,a4,1c38 <_malloc_r+0x408>
    1c2c:	2980006f          	j	1ec4 <_malloc_r+0x694>
    1c30:	00872703          	lw	a4,8(a4)
    1c34:	00e60863          	beq	a2,a4,1c44 <_malloc_r+0x414>
    1c38:	00472683          	lw	a3,4(a4)
    1c3c:	ffc6f693          	and	a3,a3,-4
    1c40:	fed7e8e3          	bltu	a5,a3,1c30 <_malloc_r+0x400>
    1c44:	00c72603          	lw	a2,12(a4)
    1c48:	00c42623          	sw	a2,12(s0)
    1c4c:	00e42423          	sw	a4,8(s0)
    1c50:	00862423          	sw	s0,8(a2)
    1c54:	00872623          	sw	s0,12(a4)
    1c58:	d71ff06f          	j	19c8 <_malloc_r+0x198>
    1c5c:	01400713          	li	a4,20
    1c60:	10f77863          	bgeu	a4,a5,1d70 <_malloc_r+0x540>
    1c64:	05400713          	li	a4,84
    1c68:	2ef76663          	bltu	a4,a5,1f54 <_malloc_r+0x724>
    1c6c:	00c4d793          	srl	a5,s1,0xc
    1c70:	06f78593          	add	a1,a5,111
    1c74:	06e78813          	add	a6,a5,110
    1c78:	00359613          	sll	a2,a1,0x3
    1c7c:	c95ff06f          	j	1910 <_malloc_r+0xe0>
    1c80:	001e0e13          	add	t3,t3,1
    1c84:	003e7793          	and	a5,t3,3
    1c88:	00850513          	add	a0,a0,8
    1c8c:	10078063          	beqz	a5,1d8c <_malloc_r+0x55c>
    1c90:	00c52783          	lw	a5,12(a0)
    1c94:	d89ff06f          	j	1a1c <_malloc_r+0x1ec>
    1c98:	00842603          	lw	a2,8(s0)
    1c9c:	0014e593          	or	a1,s1,1
    1ca0:	00b42223          	sw	a1,4(s0)
    1ca4:	00f62623          	sw	a5,12(a2)
    1ca8:	00c7a423          	sw	a2,8(a5)
    1cac:	009404b3          	add	s1,s0,s1
    1cb0:	0099aa23          	sw	s1,20(s3)
    1cb4:	0099a823          	sw	s1,16(s3)
    1cb8:	0016e793          	or	a5,a3,1
    1cbc:	0114a623          	sw	a7,12(s1)
    1cc0:	0114a423          	sw	a7,8(s1)
    1cc4:	00f4a223          	sw	a5,4(s1)
    1cc8:	00e40733          	add	a4,s0,a4
    1ccc:	00090513          	mv	a0,s2
    1cd0:	00d72023          	sw	a3,0(a4)
    1cd4:	348000ef          	jal	201c <__malloc_unlock>
    1cd8:	00840513          	add	a0,s0,8
    1cdc:	be1ff06f          	j	18bc <_malloc_r+0x8c>
    1ce0:	00f407b3          	add	a5,s0,a5
    1ce4:	0047a703          	lw	a4,4(a5)
    1ce8:	00090513          	mv	a0,s2
    1cec:	00176713          	or	a4,a4,1
    1cf0:	00e7a223          	sw	a4,4(a5)
    1cf4:	328000ef          	jal	201c <__malloc_unlock>
    1cf8:	00840513          	add	a0,s0,8
    1cfc:	bc1ff06f          	j	18bc <_malloc_r+0x8c>
    1d00:	0034d593          	srl	a1,s1,0x3
    1d04:	00848793          	add	a5,s1,8
    1d08:	b69ff06f          	j	1870 <_malloc_r+0x40>
    1d0c:	0014e693          	or	a3,s1,1
    1d10:	00d42223          	sw	a3,4(s0)
    1d14:	009404b3          	add	s1,s0,s1
    1d18:	0099aa23          	sw	s1,20(s3)
    1d1c:	0099a823          	sw	s1,16(s3)
    1d20:	00176693          	or	a3,a4,1
    1d24:	0114a623          	sw	a7,12(s1)
    1d28:	0114a423          	sw	a7,8(s1)
    1d2c:	00d4a223          	sw	a3,4(s1)
    1d30:	00f407b3          	add	a5,s0,a5
    1d34:	00090513          	mv	a0,s2
    1d38:	00e7a023          	sw	a4,0(a5)
    1d3c:	2e0000ef          	jal	201c <__malloc_unlock>
    1d40:	00840513          	add	a0,s0,8
    1d44:	b79ff06f          	j	18bc <_malloc_r+0x8c>
    1d48:	0067d713          	srl	a4,a5,0x6
    1d4c:	03970613          	add	a2,a4,57
    1d50:	03870693          	add	a3,a4,56
    1d54:	00361613          	sll	a2,a2,0x3
    1d58:	ec5ff06f          	j	1c1c <_malloc_r+0x3ec>
    1d5c:	07340c63          	beq	s0,s3,1dd4 <_malloc_r+0x5a4>
    1d60:	0089a403          	lw	s0,8(s3)
    1d64:	00812c03          	lw	s8,8(sp)
    1d68:	00442783          	lw	a5,4(s0)
    1d6c:	e09ff06f          	j	1b74 <_malloc_r+0x344>
    1d70:	05c78593          	add	a1,a5,92
    1d74:	05b78813          	add	a6,a5,91
    1d78:	00359613          	sll	a2,a1,0x3
    1d7c:	b95ff06f          	j	1910 <_malloc_r+0xe0>
    1d80:	00832783          	lw	a5,8(t1)
    1d84:	fff58593          	add	a1,a1,-1
    1d88:	28679063          	bne	a5,t1,2008 <_malloc_r+0x7d8>
    1d8c:	0035f793          	and	a5,a1,3
    1d90:	ff830313          	add	t1,t1,-8
    1d94:	fe0796e3          	bnez	a5,1d80 <_malloc_r+0x550>
    1d98:	0049a703          	lw	a4,4(s3)
    1d9c:	fff64793          	not	a5,a2
    1da0:	00e7f7b3          	and	a5,a5,a4
    1da4:	00f9a223          	sw	a5,4(s3)
    1da8:	00161613          	sll	a2,a2,0x1
    1dac:	ccc7eee3          	bltu	a5,a2,1a88 <_malloc_r+0x258>
    1db0:	cc060ce3          	beqz	a2,1a88 <_malloc_r+0x258>
    1db4:	00f67733          	and	a4,a2,a5
    1db8:	00071a63          	bnez	a4,1dcc <_malloc_r+0x59c>
    1dbc:	00161613          	sll	a2,a2,0x1
    1dc0:	00f67733          	and	a4,a2,a5
    1dc4:	004e0e13          	add	t3,t3,4
    1dc8:	fe070ae3          	beqz	a4,1dbc <_malloc_r+0x58c>
    1dcc:	000e0593          	mv	a1,t3
    1dd0:	c39ff06f          	j	1a08 <_malloc_r+0x1d8>
    1dd4:	80037c17          	auipc	s8,0x80037
    1dd8:	160c0c13          	add	s8,s8,352 # 80038f34 <__malloc_current_mallinfo>
    1ddc:	000c2703          	lw	a4,0(s8)
    1de0:	00ea8733          	add	a4,s5,a4
    1de4:	00ec2023          	sw	a4,0(s8)
    1de8:	000ca683          	lw	a3,0(s9)
    1dec:	fff00793          	li	a5,-1
    1df0:	18f68663          	beq	a3,a5,1f7c <_malloc_r+0x74c>
    1df4:	414b87b3          	sub	a5,s7,s4
    1df8:	00e787b3          	add	a5,a5,a4
    1dfc:	00fc2023          	sw	a5,0(s8)
    1e00:	007bfc93          	and	s9,s7,7
    1e04:	0c0c8c63          	beqz	s9,1edc <_malloc_r+0x6ac>
    1e08:	419b8bb3          	sub	s7,s7,s9
    1e0c:	000017b7          	lui	a5,0x1
    1e10:	00878793          	add	a5,a5,8 # 1008 <_puts_r+0x80>
    1e14:	008b8b93          	add	s7,s7,8
    1e18:	419785b3          	sub	a1,a5,s9
    1e1c:	015b8ab3          	add	s5,s7,s5
    1e20:	415585b3          	sub	a1,a1,s5
    1e24:	01459593          	sll	a1,a1,0x14
    1e28:	0145da13          	srl	s4,a1,0x14
    1e2c:	000a0593          	mv	a1,s4
    1e30:	00090513          	mv	a0,s2
    1e34:	719050ef          	jal	7d4c <_sbrk_r>
    1e38:	fff00793          	li	a5,-1
    1e3c:	18f50063          	beq	a0,a5,1fbc <_malloc_r+0x78c>
    1e40:	41750533          	sub	a0,a0,s7
    1e44:	01450ab3          	add	s5,a0,s4
    1e48:	000c2703          	lw	a4,0(s8)
    1e4c:	0179a423          	sw	s7,8(s3)
    1e50:	001ae793          	or	a5,s5,1
    1e54:	00ea05b3          	add	a1,s4,a4
    1e58:	00bc2023          	sw	a1,0(s8)
    1e5c:	00fba223          	sw	a5,4(s7)
    1e60:	cf3402e3          	beq	s0,s3,1b44 <_malloc_r+0x314>
    1e64:	00f00693          	li	a3,15
    1e68:	0b66f063          	bgeu	a3,s6,1f08 <_malloc_r+0x6d8>
    1e6c:	00442703          	lw	a4,4(s0)
    1e70:	ff4b0793          	add	a5,s6,-12
    1e74:	ff87f793          	and	a5,a5,-8
    1e78:	00177713          	and	a4,a4,1
    1e7c:	00f76733          	or	a4,a4,a5
    1e80:	00e42223          	sw	a4,4(s0)
    1e84:	00500613          	li	a2,5
    1e88:	00f40733          	add	a4,s0,a5
    1e8c:	00c72223          	sw	a2,4(a4)
    1e90:	00c72423          	sw	a2,8(a4)
    1e94:	00f6e663          	bltu	a3,a5,1ea0 <_malloc_r+0x670>
    1e98:	004ba783          	lw	a5,4(s7)
    1e9c:	ca9ff06f          	j	1b44 <_malloc_r+0x314>
    1ea0:	00840593          	add	a1,s0,8
    1ea4:	00090513          	mv	a0,s2
    1ea8:	e7cff0ef          	jal	1524 <_free_r>
    1eac:	0089ab83          	lw	s7,8(s3)
    1eb0:	000c2583          	lw	a1,0(s8)
    1eb4:	004ba783          	lw	a5,4(s7)
    1eb8:	c8dff06f          	j	1b44 <_malloc_r+0x314>
    1ebc:	010a8a93          	add	s5,s5,16
    1ec0:	c31ff06f          	j	1af0 <_malloc_r+0x2c0>
    1ec4:	4026d693          	sra	a3,a3,0x2
    1ec8:	00100793          	li	a5,1
    1ecc:	00d797b3          	sll	a5,a5,a3
    1ed0:	00f56533          	or	a0,a0,a5
    1ed4:	00a9a223          	sw	a0,4(s3)
    1ed8:	d71ff06f          	j	1c48 <_malloc_r+0x418>
    1edc:	015b85b3          	add	a1,s7,s5
    1ee0:	40b005b3          	neg	a1,a1
    1ee4:	01459593          	sll	a1,a1,0x14
    1ee8:	0145da13          	srl	s4,a1,0x14
    1eec:	000a0593          	mv	a1,s4
    1ef0:	00090513          	mv	a0,s2
    1ef4:	659050ef          	jal	7d4c <_sbrk_r>
    1ef8:	fff00793          	li	a5,-1
    1efc:	f4f512e3          	bne	a0,a5,1e40 <_malloc_r+0x610>
    1f00:	00000a13          	li	s4,0
    1f04:	f45ff06f          	j	1e48 <_malloc_r+0x618>
    1f08:	00812c03          	lw	s8,8(sp)
    1f0c:	00100793          	li	a5,1
    1f10:	00fba223          	sw	a5,4(s7)
    1f14:	00090513          	mv	a0,s2
    1f18:	104000ef          	jal	201c <__malloc_unlock>
    1f1c:	00000513          	li	a0,0
    1f20:	01812a03          	lw	s4,24(sp)
    1f24:	01412a83          	lw	s5,20(sp)
    1f28:	01012b03          	lw	s6,16(sp)
    1f2c:	00c12b83          	lw	s7,12(sp)
    1f30:	00412c83          	lw	s9,4(sp)
    1f34:	989ff06f          	j	18bc <_malloc_r+0x8c>
    1f38:	05400693          	li	a3,84
    1f3c:	04e6e463          	bltu	a3,a4,1f84 <_malloc_r+0x754>
    1f40:	00c7d713          	srl	a4,a5,0xc
    1f44:	06f70613          	add	a2,a4,111
    1f48:	06e70693          	add	a3,a4,110
    1f4c:	00361613          	sll	a2,a2,0x3
    1f50:	ccdff06f          	j	1c1c <_malloc_r+0x3ec>
    1f54:	15400713          	li	a4,340
    1f58:	04f76463          	bltu	a4,a5,1fa0 <_malloc_r+0x770>
    1f5c:	00f4d793          	srl	a5,s1,0xf
    1f60:	07878593          	add	a1,a5,120
    1f64:	07778813          	add	a6,a5,119
    1f68:	00359613          	sll	a2,a1,0x3
    1f6c:	9a5ff06f          	j	1910 <_malloc_r+0xe0>
    1f70:	0089a403          	lw	s0,8(s3)
    1f74:	00442783          	lw	a5,4(s0)
    1f78:	bfdff06f          	j	1b74 <_malloc_r+0x344>
    1f7c:	017ca023          	sw	s7,0(s9)
    1f80:	e81ff06f          	j	1e00 <_malloc_r+0x5d0>
    1f84:	15400693          	li	a3,340
    1f88:	04e6e463          	bltu	a3,a4,1fd0 <_malloc_r+0x7a0>
    1f8c:	00f7d713          	srl	a4,a5,0xf
    1f90:	07870613          	add	a2,a4,120
    1f94:	07770693          	add	a3,a4,119
    1f98:	00361613          	sll	a2,a2,0x3
    1f9c:	c81ff06f          	j	1c1c <_malloc_r+0x3ec>
    1fa0:	55400713          	li	a4,1364
    1fa4:	04f76463          	bltu	a4,a5,1fec <_malloc_r+0x7bc>
    1fa8:	0124d793          	srl	a5,s1,0x12
    1fac:	07d78593          	add	a1,a5,125
    1fb0:	07c78813          	add	a6,a5,124
    1fb4:	00359613          	sll	a2,a1,0x3
    1fb8:	959ff06f          	j	1910 <_malloc_r+0xe0>
    1fbc:	ff8c8c93          	add	s9,s9,-8
    1fc0:	019a8ab3          	add	s5,s5,s9
    1fc4:	417a8ab3          	sub	s5,s5,s7
    1fc8:	00000a13          	li	s4,0
    1fcc:	e7dff06f          	j	1e48 <_malloc_r+0x618>
    1fd0:	55400693          	li	a3,1364
    1fd4:	02e6e463          	bltu	a3,a4,1ffc <_malloc_r+0x7cc>
    1fd8:	0127d713          	srl	a4,a5,0x12
    1fdc:	07d70613          	add	a2,a4,125
    1fe0:	07c70693          	add	a3,a4,124
    1fe4:	00361613          	sll	a2,a2,0x3
    1fe8:	c35ff06f          	j	1c1c <_malloc_r+0x3ec>
    1fec:	3f800613          	li	a2,1016
    1ff0:	07f00593          	li	a1,127
    1ff4:	07e00813          	li	a6,126
    1ff8:	919ff06f          	j	1910 <_malloc_r+0xe0>
    1ffc:	3f800613          	li	a2,1016
    2000:	07e00693          	li	a3,126
    2004:	c19ff06f          	j	1c1c <_malloc_r+0x3ec>
    2008:	0049a783          	lw	a5,4(s3)
    200c:	d9dff06f          	j	1da8 <_malloc_r+0x578>

00002010 <__malloc_lock>:
    2010:	7fffe517          	auipc	a0,0x7fffe
    2014:	70c50513          	add	a0,a0,1804 # 8000071c <__lock___malloc_recursive_mutex>
    2018:	8b4ff06f          	j	10cc <__retarget_lock_acquire_recursive>

0000201c <__malloc_unlock>:
    201c:	7fffe517          	auipc	a0,0x7fffe
    2020:	70050513          	add	a0,a0,1792 # 8000071c <__lock___malloc_recursive_mutex>
    2024:	8acff06f          	j	10d0 <__retarget_lock_release_recursive>

00002028 <_vfprintf_r>:
    2028:	e7010113          	add	sp,sp,-400
    202c:	18112623          	sw	ra,396(sp)
    2030:	00b12423          	sw	a1,8(sp)
    2034:	00c12623          	sw	a2,12(sp)
    2038:	00d12a23          	sw	a3,20(sp)
    203c:	17312e23          	sw	s3,380(sp)
    2040:	18812423          	sw	s0,392(sp)
    2044:	00050993          	mv	s3,a0
    2048:	3d9050ef          	jal	7c20 <_localeconv_r>
    204c:	00052783          	lw	a5,0(a0)
    2050:	00078513          	mv	a0,a5
    2054:	02f12a23          	sw	a5,52(sp)
    2058:	afcff0ef          	jal	1354 <strlen>
    205c:	00050713          	mv	a4,a0
    2060:	00800613          	li	a2,8
    2064:	00000593          	li	a1,0
    2068:	09010513          	add	a0,sp,144
    206c:	02e12823          	sw	a4,48(sp)
    2070:	864ff0ef          	jal	10d4 <memset>
    2074:	00c12783          	lw	a5,12(sp)
    2078:	00098863          	beqz	s3,2088 <_vfprintf_r+0x60>
    207c:	0349a703          	lw	a4,52(s3)
    2080:	00071463          	bnez	a4,2088 <_vfprintf_r+0x60>
    2084:	29d0106f          	j	3b20 <_vfprintf_r+0x1af8>
    2088:	00812703          	lw	a4,8(sp)
    208c:	06472683          	lw	a3,100(a4)
    2090:	00c71703          	lh	a4,12(a4)
    2094:	0016f693          	and	a3,a3,1
    2098:	00069863          	bnez	a3,20a8 <_vfprintf_r+0x80>
    209c:	20077693          	and	a3,a4,512
    20a0:	00069463          	bnez	a3,20a8 <_vfprintf_r+0x80>
    20a4:	3ec0106f          	j	3490 <_vfprintf_r+0x1468>
    20a8:	01271693          	sll	a3,a4,0x12
    20ac:	0206c863          	bltz	a3,20dc <_vfprintf_r+0xb4>
    20b0:	00812503          	lw	a0,8(sp)
    20b4:	000025b7          	lui	a1,0x2
    20b8:	ffffe637          	lui	a2,0xffffe
    20bc:	06452683          	lw	a3,100(a0)
    20c0:	00b76733          	or	a4,a4,a1
    20c4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    20c8:	01071713          	sll	a4,a4,0x10
    20cc:	41075713          	sra	a4,a4,0x10
    20d0:	00c6f6b3          	and	a3,a3,a2
    20d4:	00e51623          	sh	a4,12(a0)
    20d8:	06d52223          	sw	a3,100(a0)
    20dc:	00877693          	and	a3,a4,8
    20e0:	2a068063          	beqz	a3,2380 <_vfprintf_r+0x358>
    20e4:	00812683          	lw	a3,8(sp)
    20e8:	0106a683          	lw	a3,16(a3)
    20ec:	28068a63          	beqz	a3,2380 <_vfprintf_r+0x358>
    20f0:	01a77693          	and	a3,a4,26
    20f4:	00a00613          	li	a2,10
    20f8:	2ac68c63          	beq	a3,a2,23b0 <_vfprintf_r+0x388>
    20fc:	0ac10713          	add	a4,sp,172
    2100:	17512a23          	sw	s5,372(sp)
    2104:	17812423          	sw	s8,360(sp)
    2108:	15b12e23          	sw	s11,348(sp)
    210c:	18912223          	sw	s1,388(sp)
    2110:	19212023          	sw	s2,384(sp)
    2114:	17412c23          	sw	s4,376(sp)
    2118:	17612823          	sw	s6,368(sp)
    211c:	17712623          	sw	s7,364(sp)
    2120:	17912223          	sw	s9,356(sp)
    2124:	17a12023          	sw	s10,352(sp)
    2128:	0ae12023          	sw	a4,160(sp)
    212c:	0a012423          	sw	zero,168(sp)
    2130:	0a012223          	sw	zero,164(sp)
    2134:	00012c23          	sw	zero,24(sp)
    2138:	02012423          	sw	zero,40(sp)
    213c:	02012623          	sw	zero,44(sp)
    2140:	00070413          	mv	s0,a4
    2144:	02012c23          	sw	zero,56(sp)
    2148:	04012023          	sw	zero,64(sp)
    214c:	02012e23          	sw	zero,60(sp)
    2150:	04012623          	sw	zero,76(sp)
    2154:	04012423          	sw	zero,72(sp)
    2158:	00012623          	sw	zero,12(sp)
    215c:	7fffea97          	auipc	s5,0x7fffe
    2160:	3d8a8a93          	add	s5,s5,984 # 80000534 <__global_locale>
    2164:	02500d93          	li	s11,37
    2168:	00078c13          	mv	s8,a5
    216c:	000c0913          	mv	s2,s8
    2170:	0e4aa483          	lw	s1,228(s5)
    2174:	2a1050ef          	jal	7c14 <__locale_mb_cur_max>
    2178:	00050693          	mv	a3,a0
    217c:	09010713          	add	a4,sp,144
    2180:	00090613          	mv	a2,s2
    2184:	08010593          	add	a1,sp,128
    2188:	00098513          	mv	a0,s3
    218c:	000480e7          	jalr	s1
    2190:	2c050a63          	beqz	a0,2464 <_vfprintf_r+0x43c>
    2194:	2a054a63          	bltz	a0,2448 <_vfprintf_r+0x420>
    2198:	08012783          	lw	a5,128(sp)
    219c:	01b78663          	beq	a5,s11,21a8 <_vfprintf_r+0x180>
    21a0:	00a90933          	add	s2,s2,a0
    21a4:	fcdff06f          	j	2170 <_vfprintf_r+0x148>
    21a8:	00050493          	mv	s1,a0
    21ac:	41890cb3          	sub	s9,s2,s8
    21b0:	2d891063          	bne	s2,s8,2470 <_vfprintf_r+0x448>
    21b4:	fff00313          	li	t1,-1
    21b8:	00000e93          	li	t4,0
    21bc:	00194e03          	lbu	t3,1(s2)
    21c0:	06010ba3          	sb	zero,119(sp)
    21c4:	00190913          	add	s2,s2,1
    21c8:	00000b93          	li	s7,0
    21cc:	05a00493          	li	s1,90
    21d0:	000e8a13          	mv	s4,t4
    21d4:	00030b13          	mv	s6,t1
    21d8:	00190913          	add	s2,s2,1
    21dc:	fe0e0793          	add	a5,t3,-32
    21e0:	04f4ea63          	bltu	s1,a5,2234 <_vfprintf_r+0x20c>
    21e4:	0000d717          	auipc	a4,0xd
    21e8:	38470713          	add	a4,a4,900 # f568 <_ctype_+0x104>
    21ec:	00279793          	sll	a5,a5,0x2
    21f0:	00e787b3          	add	a5,a5,a4
    21f4:	0007a783          	lw	a5,0(a5)
    21f8:	00e787b3          	add	a5,a5,a4
    21fc:	00078067          	jr	a5
    2200:	00000b93          	li	s7,0
    2204:	fd0e0713          	add	a4,t3,-48
    2208:	00900693          	li	a3,9
    220c:	00094e03          	lbu	t3,0(s2)
    2210:	002b9793          	sll	a5,s7,0x2
    2214:	017787b3          	add	a5,a5,s7
    2218:	00179793          	sll	a5,a5,0x1
    221c:	00f70bb3          	add	s7,a4,a5
    2220:	fd0e0713          	add	a4,t3,-48
    2224:	00190913          	add	s2,s2,1
    2228:	fee6f2e3          	bgeu	a3,a4,220c <_vfprintf_r+0x1e4>
    222c:	fe0e0793          	add	a5,t3,-32
    2230:	faf4fae3          	bgeu	s1,a5,21e4 <_vfprintf_r+0x1bc>
    2234:	000a0e93          	mv	t4,s4
    2238:	260e0a63          	beqz	t3,24ac <_vfprintf_r+0x484>
    223c:	0fc10623          	sb	t3,236(sp)
    2240:	06010ba3          	sb	zero,119(sp)
    2244:	00100c93          	li	s9,1
    2248:	00000613          	li	a2,0
    224c:	00012823          	sw	zero,16(sp)
    2250:	00100d13          	li	s10,1
    2254:	00000313          	li	t1,0
    2258:	02012223          	sw	zero,36(sp)
    225c:	02012023          	sw	zero,32(sp)
    2260:	00000a13          	li	s4,0
    2264:	0ec10c13          	add	s8,sp,236
    2268:	002ef293          	and	t0,t4,2
    226c:	00028463          	beqz	t0,2274 <_vfprintf_r+0x24c>
    2270:	002c8c93          	add	s9,s9,2
    2274:	084eff93          	and	t6,t4,132
    2278:	0a812483          	lw	s1,168(sp)
    227c:	000f9663          	bnez	t6,2288 <_vfprintf_r+0x260>
    2280:	419b8733          	sub	a4,s7,s9
    2284:	40e04663          	bgtz	a4,2690 <_vfprintf_r+0x668>
    2288:	02060a63          	beqz	a2,22bc <_vfprintf_r+0x294>
    228c:	0a412703          	lw	a4,164(sp)
    2290:	07710613          	add	a2,sp,119
    2294:	00148493          	add	s1,s1,1
    2298:	00170713          	add	a4,a4,1
    229c:	00100793          	li	a5,1
    22a0:	00c42023          	sw	a2,0(s0)
    22a4:	00f42223          	sw	a5,4(s0)
    22a8:	0a912423          	sw	s1,168(sp)
    22ac:	0ae12223          	sw	a4,164(sp)
    22b0:	00700613          	li	a2,7
    22b4:	00840413          	add	s0,s0,8
    22b8:	4ce64863          	blt	a2,a4,2788 <_vfprintf_r+0x760>
    22bc:	02028a63          	beqz	t0,22f0 <_vfprintf_r+0x2c8>
    22c0:	0a412703          	lw	a4,164(sp)
    22c4:	07810613          	add	a2,sp,120
    22c8:	00c42023          	sw	a2,0(s0)
    22cc:	00248493          	add	s1,s1,2
    22d0:	00200613          	li	a2,2
    22d4:	00170713          	add	a4,a4,1
    22d8:	00c42223          	sw	a2,4(s0)
    22dc:	0a912423          	sw	s1,168(sp)
    22e0:	0ae12223          	sw	a4,164(sp)
    22e4:	00700613          	li	a2,7
    22e8:	00840413          	add	s0,s0,8
    22ec:	5ce644e3          	blt	a2,a4,30b4 <_vfprintf_r+0x108c>
    22f0:	08000713          	li	a4,128
    22f4:	3aef80e3          	beq	t6,a4,2e94 <_vfprintf_r+0xe6c>
    22f8:	41a30b33          	sub	s6,t1,s10
    22fc:	4b604ae3          	bgtz	s6,2fb0 <_vfprintf_r+0xf88>
    2300:	100ef713          	and	a4,t4,256
    2304:	1a0710e3          	bnez	a4,2ca4 <_vfprintf_r+0xc7c>
    2308:	0a412783          	lw	a5,164(sp)
    230c:	01a484b3          	add	s1,s1,s10
    2310:	01842023          	sw	s8,0(s0)
    2314:	00178793          	add	a5,a5,1
    2318:	01a42223          	sw	s10,4(s0)
    231c:	0a912423          	sw	s1,168(sp)
    2320:	0af12223          	sw	a5,164(sp)
    2324:	00700713          	li	a4,7
    2328:	58f74c63          	blt	a4,a5,28c0 <_vfprintf_r+0x898>
    232c:	00840413          	add	s0,s0,8
    2330:	004eff13          	and	t5,t4,4
    2334:	000f0663          	beqz	t5,2340 <_vfprintf_r+0x318>
    2338:	419b8d33          	sub	s10,s7,s9
    233c:	5ba04ce3          	bgtz	s10,30f4 <_vfprintf_r+0x10cc>
    2340:	000b8e93          	mv	t4,s7
    2344:	019bd463          	bge	s7,s9,234c <_vfprintf_r+0x324>
    2348:	000c8e93          	mv	t4,s9
    234c:	00c12783          	lw	a5,12(sp)
    2350:	01d787b3          	add	a5,a5,t4
    2354:	00f12623          	sw	a5,12(sp)
    2358:	18049663          	bnez	s1,24e4 <_vfprintf_r+0x4bc>
    235c:	01012783          	lw	a5,16(sp)
    2360:	0a012223          	sw	zero,164(sp)
    2364:	00078863          	beqz	a5,2374 <_vfprintf_r+0x34c>
    2368:	01012583          	lw	a1,16(sp)
    236c:	00098513          	mv	a0,s3
    2370:	9b4ff0ef          	jal	1524 <_free_r>
    2374:	0ac10413          	add	s0,sp,172
    2378:	00090c13          	mv	s8,s2
    237c:	df1ff06f          	j	216c <_vfprintf_r+0x144>
    2380:	00812403          	lw	s0,8(sp)
    2384:	00098513          	mv	a0,s3
    2388:	00f12623          	sw	a5,12(sp)
    238c:	00040593          	mv	a1,s0
    2390:	3a4050ef          	jal	7734 <__swsetup_r>
    2394:	00050463          	beqz	a0,239c <_vfprintf_r+0x374>
    2398:	5600206f          	j	48f8 <_vfprintf_r+0x28d0>
    239c:	00c41703          	lh	a4,12(s0)
    23a0:	00a00613          	li	a2,10
    23a4:	00c12783          	lw	a5,12(sp)
    23a8:	01a77693          	and	a3,a4,26
    23ac:	d4c698e3          	bne	a3,a2,20fc <_vfprintf_r+0xd4>
    23b0:	00812603          	lw	a2,8(sp)
    23b4:	00e61683          	lh	a3,14(a2)
    23b8:	d406c2e3          	bltz	a3,20fc <_vfprintf_r+0xd4>
    23bc:	06462683          	lw	a3,100(a2)
    23c0:	0016f693          	and	a3,a3,1
    23c4:	00069863          	bnez	a3,23d4 <_vfprintf_r+0x3ac>
    23c8:	20077713          	and	a4,a4,512
    23cc:	00071463          	bnez	a4,23d4 <_vfprintf_r+0x3ac>
    23d0:	53d0106f          	j	410c <_vfprintf_r+0x20e4>
    23d4:	01412683          	lw	a3,20(sp)
    23d8:	00812583          	lw	a1,8(sp)
    23dc:	00098513          	mv	a0,s3
    23e0:	00078613          	mv	a2,a5
    23e4:	0e5020ef          	jal	4cc8 <__sbprintf>
    23e8:	18c12083          	lw	ra,396(sp)
    23ec:	18812403          	lw	s0,392(sp)
    23f0:	00a12623          	sw	a0,12(sp)
    23f4:	00c12503          	lw	a0,12(sp)
    23f8:	17c12983          	lw	s3,380(sp)
    23fc:	19010113          	add	sp,sp,400
    2400:	00008067          	ret
    2404:	00098513          	mv	a0,s3
    2408:	019050ef          	jal	7c20 <_localeconv_r>
    240c:	00452783          	lw	a5,4(a0)
    2410:	00078513          	mv	a0,a5
    2414:	04f12423          	sw	a5,72(sp)
    2418:	f3dfe0ef          	jal	1354 <strlen>
    241c:	00050793          	mv	a5,a0
    2420:	00098513          	mv	a0,s3
    2424:	00078c93          	mv	s9,a5
    2428:	04f12623          	sw	a5,76(sp)
    242c:	7f4050ef          	jal	7c20 <_localeconv_r>
    2430:	00852703          	lw	a4,8(a0)
    2434:	02e12e23          	sw	a4,60(sp)
    2438:	000c8463          	beqz	s9,2440 <_vfprintf_r+0x418>
    243c:	1ec0106f          	j	3628 <_vfprintf_r+0x1600>
    2440:	00094e03          	lbu	t3,0(s2)
    2444:	d95ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2448:	00800613          	li	a2,8
    244c:	00000593          	li	a1,0
    2450:	09010513          	add	a0,sp,144
    2454:	c81fe0ef          	jal	10d4 <memset>
    2458:	00100513          	li	a0,1
    245c:	00a90933          	add	s2,s2,a0
    2460:	d11ff06f          	j	2170 <_vfprintf_r+0x148>
    2464:	00050493          	mv	s1,a0
    2468:	41890cb3          	sub	s9,s2,s8
    246c:	05890063          	beq	s2,s8,24ac <_vfprintf_r+0x484>
    2470:	0a812683          	lw	a3,168(sp)
    2474:	0a412703          	lw	a4,164(sp)
    2478:	01842023          	sw	s8,0(s0)
    247c:	019686b3          	add	a3,a3,s9
    2480:	00170713          	add	a4,a4,1
    2484:	01942223          	sw	s9,4(s0)
    2488:	0ad12423          	sw	a3,168(sp)
    248c:	0ae12223          	sw	a4,164(sp)
    2490:	00700693          	li	a3,7
    2494:	00840413          	add	s0,s0,8
    2498:	02e6c863          	blt	a3,a4,24c8 <_vfprintf_r+0x4a0>
    249c:	00c12783          	lw	a5,12(sp)
    24a0:	019787b3          	add	a5,a5,s9
    24a4:	00f12623          	sw	a5,12(sp)
    24a8:	d00496e3          	bnez	s1,21b4 <_vfprintf_r+0x18c>
    24ac:	0a812783          	lw	a5,168(sp)
    24b0:	00078463          	beqz	a5,24b8 <_vfprintf_r+0x490>
    24b4:	4090106f          	j	40bc <_vfprintf_r+0x2094>
    24b8:	00812783          	lw	a5,8(sp)
    24bc:	0a012223          	sw	zero,164(sp)
    24c0:	00c79783          	lh	a5,12(a5)
    24c4:	0500006f          	j	2514 <_vfprintf_r+0x4ec>
    24c8:	00812583          	lw	a1,8(sp)
    24cc:	0a010613          	add	a2,sp,160
    24d0:	00098513          	mv	a0,s3
    24d4:	211020ef          	jal	4ee4 <__sprint_r>
    24d8:	02051a63          	bnez	a0,250c <_vfprintf_r+0x4e4>
    24dc:	0ac10413          	add	s0,sp,172
    24e0:	fbdff06f          	j	249c <_vfprintf_r+0x474>
    24e4:	00812583          	lw	a1,8(sp)
    24e8:	0a010613          	add	a2,sp,160
    24ec:	00098513          	mv	a0,s3
    24f0:	1f5020ef          	jal	4ee4 <__sprint_r>
    24f4:	e60504e3          	beqz	a0,235c <_vfprintf_r+0x334>
    24f8:	01012283          	lw	t0,16(sp)
    24fc:	00028863          	beqz	t0,250c <_vfprintf_r+0x4e4>
    2500:	00028593          	mv	a1,t0
    2504:	00098513          	mv	a0,s3
    2508:	81cff0ef          	jal	1524 <_free_r>
    250c:	00812783          	lw	a5,8(sp)
    2510:	00c79783          	lh	a5,12(a5)
    2514:	00812703          	lw	a4,8(sp)
    2518:	06472703          	lw	a4,100(a4)
    251c:	00177713          	and	a4,a4,1
    2520:	3c070463          	beqz	a4,28e8 <_vfprintf_r+0x8c0>
    2524:	0407f793          	and	a5,a5,64
    2528:	18412483          	lw	s1,388(sp)
    252c:	18012903          	lw	s2,384(sp)
    2530:	17812a03          	lw	s4,376(sp)
    2534:	17412a83          	lw	s5,372(sp)
    2538:	17012b03          	lw	s6,368(sp)
    253c:	16c12b83          	lw	s7,364(sp)
    2540:	16812c03          	lw	s8,360(sp)
    2544:	16412c83          	lw	s9,356(sp)
    2548:	16012d03          	lw	s10,352(sp)
    254c:	15c12d83          	lw	s11,348(sp)
    2550:	00078463          	beqz	a5,2558 <_vfprintf_r+0x530>
    2554:	3d00206f          	j	4924 <_vfprintf_r+0x28fc>
    2558:	18c12083          	lw	ra,396(sp)
    255c:	18812403          	lw	s0,392(sp)
    2560:	00c12503          	lw	a0,12(sp)
    2564:	17c12983          	lw	s3,380(sp)
    2568:	19010113          	add	sp,sp,400
    256c:	00008067          	ret
    2570:	008a7713          	and	a4,s4,8
    2574:	000a0e93          	mv	t4,s4
    2578:	000b0313          	mv	t1,s6
    257c:	00070463          	beqz	a4,2584 <_vfprintf_r+0x55c>
    2580:	0200106f          	j	35a0 <_vfprintf_r+0x1578>
    2584:	01412783          	lw	a5,20(sp)
    2588:	00778b13          	add	s6,a5,7
    258c:	ff8b7b13          	and	s6,s6,-8
    2590:	000b2783          	lw	a5,0(s6)
    2594:	02f12423          	sw	a5,40(sp)
    2598:	004b2783          	lw	a5,4(s6)
    259c:	02f12623          	sw	a5,44(sp)
    25a0:	008b0793          	add	a5,s6,8
    25a4:	00f12a23          	sw	a5,20(sp)
    25a8:	02c12a03          	lw	s4,44(sp)
    25ac:	7fffe717          	auipc	a4,0x7fffe
    25b0:	0f470713          	add	a4,a4,244 # 800006a0 <__global_locale+0x16c>
    25b4:	00072c83          	lw	s9,0(a4)
    25b8:	00472d03          	lw	s10,4(a4)
    25bc:	02812b03          	lw	s6,40(sp)
    25c0:	001a1493          	sll	s1,s4,0x1
    25c4:	0014d493          	srl	s1,s1,0x1
    25c8:	000b0513          	mv	a0,s6
    25cc:	00048593          	mv	a1,s1
    25d0:	000c8613          	mv	a2,s9
    25d4:	000d0693          	mv	a3,s10
    25d8:	02612223          	sw	t1,36(sp)
    25dc:	03c12023          	sw	t3,32(sp)
    25e0:	01d12823          	sw	t4,16(sp)
    25e4:	26c0c0ef          	jal	e850 <__unorddf2>
    25e8:	01012e83          	lw	t4,16(sp)
    25ec:	02012e03          	lw	t3,32(sp)
    25f0:	02412303          	lw	t1,36(sp)
    25f4:	00050463          	beqz	a0,25fc <_vfprintf_r+0x5d4>
    25f8:	4080106f          	j	3a00 <_vfprintf_r+0x19d8>
    25fc:	000b0513          	mv	a0,s6
    2600:	00048593          	mv	a1,s1
    2604:	000c8613          	mv	a2,s9
    2608:	000d0693          	mv	a3,s10
    260c:	0a40b0ef          	jal	d6b0 <__ledf2>
    2610:	01012e83          	lw	t4,16(sp)
    2614:	02012e03          	lw	t3,32(sp)
    2618:	02412303          	lw	t1,36(sp)
    261c:	00a04463          	bgtz	a0,2624 <_vfprintf_r+0x5fc>
    2620:	3e00106f          	j	3a00 <_vfprintf_r+0x19d8>
    2624:	000b0513          	mv	a0,s6
    2628:	000a0593          	mv	a1,s4
    262c:	00000613          	li	a2,0
    2630:	00000693          	li	a3,0
    2634:	07c0b0ef          	jal	d6b0 <__ledf2>
    2638:	01012e83          	lw	t4,16(sp)
    263c:	02012e03          	lw	t3,32(sp)
    2640:	00055463          	bgez	a0,2648 <_vfprintf_r+0x620>
    2644:	6650106f          	j	44a8 <_vfprintf_r+0x2480>
    2648:	07714603          	lbu	a2,119(sp)
    264c:	04700713          	li	a4,71
    2650:	0000dc17          	auipc	s8,0xd
    2654:	c28c0c13          	add	s8,s8,-984 # f278 <__fini_array_end+0x200>
    2658:	01c74663          	blt	a4,t3,2664 <_vfprintf_r+0x63c>
    265c:	0000dc17          	auipc	s8,0xd
    2660:	c18c0c13          	add	s8,s8,-1000 # f274 <__fini_array_end+0x1fc>
    2664:	00012823          	sw	zero,16(sp)
    2668:	02012223          	sw	zero,36(sp)
    266c:	02012023          	sw	zero,32(sp)
    2670:	f7fefe93          	and	t4,t4,-129
    2674:	00300c93          	li	s9,3
    2678:	00300d13          	li	s10,3
    267c:	00000313          	li	t1,0
    2680:	00000a13          	li	s4,0
    2684:	be0602e3          	beqz	a2,2268 <_vfprintf_r+0x240>
    2688:	001c8c93          	add	s9,s9,1
    268c:	bddff06f          	j	2268 <_vfprintf_r+0x240>
    2690:	01000593          	li	a1,16
    2694:	0a412603          	lw	a2,164(sp)
    2698:	0000db17          	auipc	s6,0xd
    269c:	0e4b0b13          	add	s6,s6,228 # f77c <blanks.1>
    26a0:	0ae5dc63          	bge	a1,a4,2758 <_vfprintf_r+0x730>
    26a4:	00040793          	mv	a5,s0
    26a8:	00048693          	mv	a3,s1
    26ac:	01000893          	li	a7,16
    26b0:	000b0493          	mv	s1,s6
    26b4:	00700393          	li	t2,7
    26b8:	000a0b13          	mv	s6,s4
    26bc:	04512223          	sw	t0,68(sp)
    26c0:	05f12823          	sw	t6,80(sp)
    26c4:	05d12a23          	sw	t4,84(sp)
    26c8:	05c12c23          	sw	t3,88(sp)
    26cc:	00070413          	mv	s0,a4
    26d0:	00030a13          	mv	s4,t1
    26d4:	00c0006f          	j	26e0 <_vfprintf_r+0x6b8>
    26d8:	ff040413          	add	s0,s0,-16
    26dc:	0488da63          	bge	a7,s0,2730 <_vfprintf_r+0x708>
    26e0:	01068693          	add	a3,a3,16
    26e4:	00160613          	add	a2,a2,1
    26e8:	0097a023          	sw	s1,0(a5)
    26ec:	0117a223          	sw	a7,4(a5)
    26f0:	0ad12423          	sw	a3,168(sp)
    26f4:	0ac12223          	sw	a2,164(sp)
    26f8:	00878793          	add	a5,a5,8
    26fc:	fcc3dee3          	bge	t2,a2,26d8 <_vfprintf_r+0x6b0>
    2700:	00812583          	lw	a1,8(sp)
    2704:	0a010613          	add	a2,sp,160
    2708:	00098513          	mv	a0,s3
    270c:	7d8020ef          	jal	4ee4 <__sprint_r>
    2710:	de0514e3          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    2714:	01000893          	li	a7,16
    2718:	ff040413          	add	s0,s0,-16
    271c:	0a812683          	lw	a3,168(sp)
    2720:	0a412603          	lw	a2,164(sp)
    2724:	0ac10793          	add	a5,sp,172
    2728:	00700393          	li	t2,7
    272c:	fa88cae3          	blt	a7,s0,26e0 <_vfprintf_r+0x6b8>
    2730:	04412283          	lw	t0,68(sp)
    2734:	05012f83          	lw	t6,80(sp)
    2738:	05412e83          	lw	t4,84(sp)
    273c:	05812e03          	lw	t3,88(sp)
    2740:	000a0313          	mv	t1,s4
    2744:	00040713          	mv	a4,s0
    2748:	000b0a13          	mv	s4,s6
    274c:	00078413          	mv	s0,a5
    2750:	00048b13          	mv	s6,s1
    2754:	00068493          	mv	s1,a3
    2758:	00e484b3          	add	s1,s1,a4
    275c:	00160613          	add	a2,a2,1
    2760:	00e42223          	sw	a4,4(s0)
    2764:	01642023          	sw	s6,0(s0)
    2768:	0a912423          	sw	s1,168(sp)
    276c:	0ac12223          	sw	a2,164(sp)
    2770:	00700713          	li	a4,7
    2774:	00c75463          	bge	a4,a2,277c <_vfprintf_r+0x754>
    2778:	2380106f          	j	39b0 <_vfprintf_r+0x1988>
    277c:	07714603          	lbu	a2,119(sp)
    2780:	00840413          	add	s0,s0,8
    2784:	b05ff06f          	j	2288 <_vfprintf_r+0x260>
    2788:	00812583          	lw	a1,8(sp)
    278c:	0a010613          	add	a2,sp,160
    2790:	00098513          	mv	a0,s3
    2794:	04612e23          	sw	t1,92(sp)
    2798:	05c12c23          	sw	t3,88(sp)
    279c:	05d12a23          	sw	t4,84(sp)
    27a0:	05f12823          	sw	t6,80(sp)
    27a4:	04512223          	sw	t0,68(sp)
    27a8:	73c020ef          	jal	4ee4 <__sprint_r>
    27ac:	d40516e3          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    27b0:	0a812483          	lw	s1,168(sp)
    27b4:	05c12303          	lw	t1,92(sp)
    27b8:	05812e03          	lw	t3,88(sp)
    27bc:	05412e83          	lw	t4,84(sp)
    27c0:	05012f83          	lw	t6,80(sp)
    27c4:	04412283          	lw	t0,68(sp)
    27c8:	0ac10413          	add	s0,sp,172
    27cc:	af1ff06f          	j	22bc <_vfprintf_r+0x294>
    27d0:	0a412d03          	lw	s10,164(sp)
    27d4:	01812783          	lw	a5,24(sp)
    27d8:	00100693          	li	a3,1
    27dc:	01842023          	sw	s8,0(s0)
    27e0:	00148493          	add	s1,s1,1
    27e4:	001d0d13          	add	s10,s10,1
    27e8:	00840b13          	add	s6,s0,8
    27ec:	32f6d0e3          	bge	a3,a5,330c <_vfprintf_r+0x12e4>
    27f0:	00100693          	li	a3,1
    27f4:	00d42223          	sw	a3,4(s0)
    27f8:	0a912423          	sw	s1,168(sp)
    27fc:	0ba12223          	sw	s10,164(sp)
    2800:	00700693          	li	a3,7
    2804:	01a6d463          	bge	a3,s10,280c <_vfprintf_r+0x7e4>
    2808:	0680106f          	j	3870 <_vfprintf_r+0x1848>
    280c:	03012783          	lw	a5,48(sp)
    2810:	03412703          	lw	a4,52(sp)
    2814:	001d0d13          	add	s10,s10,1
    2818:	00f484b3          	add	s1,s1,a5
    281c:	00eb2023          	sw	a4,0(s6)
    2820:	00fb2223          	sw	a5,4(s6)
    2824:	0a912423          	sw	s1,168(sp)
    2828:	0ba12223          	sw	s10,164(sp)
    282c:	00700693          	li	a3,7
    2830:	008b0b13          	add	s6,s6,8
    2834:	01a6d463          	bge	a3,s10,283c <_vfprintf_r+0x814>
    2838:	0680106f          	j	38a0 <_vfprintf_r+0x1878>
    283c:	02812603          	lw	a2,40(sp)
    2840:	02c12683          	lw	a3,44(sp)
    2844:	01812783          	lw	a5,24(sp)
    2848:	00060513          	mv	a0,a2
    284c:	00068593          	mv	a1,a3
    2850:	00000613          	li	a2,0
    2854:	00000693          	li	a3,0
    2858:	03d12023          	sw	t4,32(sp)
    285c:	fff78413          	add	s0,a5,-1
    2860:	4c50a0ef          	jal	d524 <__eqdf2>
    2864:	02012e83          	lw	t4,32(sp)
    2868:	2e0506e3          	beqz	a0,3354 <_vfprintf_r+0x132c>
    286c:	001c0793          	add	a5,s8,1
    2870:	001d0d13          	add	s10,s10,1
    2874:	008484b3          	add	s1,s1,s0
    2878:	00fb2023          	sw	a5,0(s6)
    287c:	008b2223          	sw	s0,4(s6)
    2880:	0a912423          	sw	s1,168(sp)
    2884:	0ba12223          	sw	s10,164(sp)
    2888:	00700793          	li	a5,7
    288c:	008b0b13          	add	s6,s6,8
    2890:	29a7cce3          	blt	a5,s10,3328 <_vfprintf_r+0x1300>
    2894:	04012703          	lw	a4,64(sp)
    2898:	08810793          	add	a5,sp,136
    289c:	001d0d13          	add	s10,s10,1
    28a0:	009704b3          	add	s1,a4,s1
    28a4:	00fb2023          	sw	a5,0(s6)
    28a8:	00eb2223          	sw	a4,4(s6)
    28ac:	0a912423          	sw	s1,168(sp)
    28b0:	0ba12223          	sw	s10,164(sp)
    28b4:	00700793          	li	a5,7
    28b8:	008b0413          	add	s0,s6,8
    28bc:	a7a7dae3          	bge	a5,s10,2330 <_vfprintf_r+0x308>
    28c0:	00812583          	lw	a1,8(sp)
    28c4:	0a010613          	add	a2,sp,160
    28c8:	00098513          	mv	a0,s3
    28cc:	03d12023          	sw	t4,32(sp)
    28d0:	614020ef          	jal	4ee4 <__sprint_r>
    28d4:	c20512e3          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    28d8:	0a812483          	lw	s1,168(sp)
    28dc:	02012e83          	lw	t4,32(sp)
    28e0:	0ac10413          	add	s0,sp,172
    28e4:	a4dff06f          	j	2330 <_vfprintf_r+0x308>
    28e8:	2007f713          	and	a4,a5,512
    28ec:	c2071ce3          	bnez	a4,2524 <_vfprintf_r+0x4fc>
    28f0:	00812403          	lw	s0,8(sp)
    28f4:	05842503          	lw	a0,88(s0)
    28f8:	fd8fe0ef          	jal	10d0 <__retarget_lock_release_recursive>
    28fc:	00c41783          	lh	a5,12(s0)
    2900:	c25ff06f          	j	2524 <_vfprintf_r+0x4fc>
    2904:	00094e03          	lbu	t3,0(s2)
    2908:	020a6a13          	or	s4,s4,32
    290c:	8cdff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2910:	01412703          	lw	a4,20(sp)
    2914:	04300793          	li	a5,67
    2918:	000a0e93          	mv	t4,s4
    291c:	00470493          	add	s1,a4,4
    2920:	64fe08e3          	beq	t3,a5,3770 <_vfprintf_r+0x1748>
    2924:	010a7793          	and	a5,s4,16
    2928:	640794e3          	bnez	a5,3770 <_vfprintf_r+0x1748>
    292c:	01412783          	lw	a5,20(sp)
    2930:	00100c93          	li	s9,1
    2934:	00100d13          	li	s10,1
    2938:	0007a783          	lw	a5,0(a5)
    293c:	0ec10c13          	add	s8,sp,236
    2940:	0ef10623          	sb	a5,236(sp)
    2944:	06010ba3          	sb	zero,119(sp)
    2948:	00912a23          	sw	s1,20(sp)
    294c:	00000613          	li	a2,0
    2950:	00012823          	sw	zero,16(sp)
    2954:	00000313          	li	t1,0
    2958:	02012223          	sw	zero,36(sp)
    295c:	02012023          	sw	zero,32(sp)
    2960:	00000a13          	li	s4,0
    2964:	905ff06f          	j	2268 <_vfprintf_r+0x240>
    2968:	01412783          	lw	a5,20(sp)
    296c:	06010ba3          	sb	zero,119(sp)
    2970:	000b0313          	mv	t1,s6
    2974:	0007ac03          	lw	s8,0(a5)
    2978:	000a0e93          	mv	t4,s4
    297c:	00478b13          	add	s6,a5,4
    2980:	5a0c0ce3          	beqz	s8,3738 <_vfprintf_r+0x1710>
    2984:	05300713          	li	a4,83
    2988:	00ee1463          	bne	t3,a4,2990 <_vfprintf_r+0x968>
    298c:	1d00106f          	j	3b5c <_vfprintf_r+0x1b34>
    2990:	010a7a13          	and	s4,s4,16
    2994:	000a0463          	beqz	s4,299c <_vfprintf_r+0x974>
    2998:	1c40106f          	j	3b5c <_vfprintf_r+0x1b34>
    299c:	00035463          	bgez	t1,29a4 <_vfprintf_r+0x97c>
    29a0:	6d40106f          	j	4074 <_vfprintf_r+0x204c>
    29a4:	00030613          	mv	a2,t1
    29a8:	00000593          	li	a1,0
    29ac:	000c0513          	mv	a0,s8
    29b0:	03d12023          	sw	t4,32(sp)
    29b4:	00612a23          	sw	t1,20(sp)
    29b8:	0ec050ef          	jal	7aa4 <memchr>
    29bc:	00a12823          	sw	a0,16(sp)
    29c0:	01412303          	lw	t1,20(sp)
    29c4:	02012e83          	lw	t4,32(sp)
    29c8:	00051463          	bnez	a0,29d0 <_vfprintf_r+0x9a8>
    29cc:	1780206f          	j	4b44 <_vfprintf_r+0x2b1c>
    29d0:	01012783          	lw	a5,16(sp)
    29d4:	07714603          	lbu	a2,119(sp)
    29d8:	01612a23          	sw	s6,20(sp)
    29dc:	41878d33          	sub	s10,a5,s8
    29e0:	fffd4813          	not	a6,s10
    29e4:	41f85813          	sra	a6,a6,0x1f
    29e8:	02012223          	sw	zero,36(sp)
    29ec:	02012023          	sw	zero,32(sp)
    29f0:	00012823          	sw	zero,16(sp)
    29f4:	010d7cb3          	and	s9,s10,a6
    29f8:	00000313          	li	t1,0
    29fc:	07300e13          	li	t3,115
    2a00:	860604e3          	beqz	a2,2268 <_vfprintf_r+0x240>
    2a04:	c85ff06f          	j	2688 <_vfprintf_r+0x660>
    2a08:	01412783          	lw	a5,20(sp)
    2a0c:	0007ab83          	lw	s7,0(a5)
    2a10:	00478793          	add	a5,a5,4
    2a14:	2a0bdae3          	bgez	s7,34c8 <_vfprintf_r+0x14a0>
    2a18:	41700bb3          	neg	s7,s7
    2a1c:	00f12a23          	sw	a5,20(sp)
    2a20:	00094e03          	lbu	t3,0(s2)
    2a24:	004a6a13          	or	s4,s4,4
    2a28:	fb0ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2a2c:	02b00793          	li	a5,43
    2a30:	00094e03          	lbu	t3,0(s2)
    2a34:	06f10ba3          	sb	a5,119(sp)
    2a38:	fa0ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2a3c:	000b0313          	mv	t1,s6
    2a40:	010a6613          	or	a2,s4,16
    2a44:	02067793          	and	a5,a2,32
    2a48:	1c0780e3          	beqz	a5,3408 <_vfprintf_r+0x13e0>
    2a4c:	01412783          	lw	a5,20(sp)
    2a50:	00778b13          	add	s6,a5,7
    2a54:	ff8b7b13          	and	s6,s6,-8
    2a58:	000b2d03          	lw	s10,0(s6)
    2a5c:	004b2c83          	lw	s9,4(s6)
    2a60:	008b0793          	add	a5,s6,8
    2a64:	00f12a23          	sw	a5,20(sp)
    2a68:	00100793          	li	a5,1
    2a6c:	00000713          	li	a4,0
    2a70:	06e10ba3          	sb	a4,119(sp)
    2a74:	34034c63          	bltz	t1,2dcc <_vfprintf_r+0xda4>
    2a78:	019d6733          	or	a4,s10,s9
    2a7c:	f7f67e93          	and	t4,a2,-129
    2a80:	34071463          	bnez	a4,2dc8 <_vfprintf_r+0xda0>
    2a84:	3a031a63          	bnez	t1,2e38 <_vfprintf_r+0xe10>
    2a88:	5c079ee3          	bnez	a5,3864 <_vfprintf_r+0x183c>
    2a8c:	00167d13          	and	s10,a2,1
    2a90:	15010c13          	add	s8,sp,336
    2a94:	2c0d10e3          	bnez	s10,3554 <_vfprintf_r+0x152c>
    2a98:	07714603          	lbu	a2,119(sp)
    2a9c:	00030c93          	mv	s9,t1
    2aa0:	01a35463          	bge	t1,s10,2aa8 <_vfprintf_r+0xa80>
    2aa4:	000d0c93          	mv	s9,s10
    2aa8:	00012823          	sw	zero,16(sp)
    2aac:	02012223          	sw	zero,36(sp)
    2ab0:	02012023          	sw	zero,32(sp)
    2ab4:	00000a13          	li	s4,0
    2ab8:	fa060863          	beqz	a2,2268 <_vfprintf_r+0x240>
    2abc:	bcdff06f          	j	2688 <_vfprintf_r+0x660>
    2ac0:	00094e03          	lbu	t3,0(s2)
    2ac4:	080a6a13          	or	s4,s4,128
    2ac8:	f10ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2acc:	00094e03          	lbu	t3,0(s2)
    2ad0:	02a00793          	li	a5,42
    2ad4:	00190693          	add	a3,s2,1
    2ad8:	00fe1463          	bne	t3,a5,2ae0 <_vfprintf_r+0xab8>
    2adc:	1100206f          	j	4bec <_vfprintf_r+0x2bc4>
    2ae0:	fd0e0713          	add	a4,t3,-48
    2ae4:	00900793          	li	a5,9
    2ae8:	00000b13          	li	s6,0
    2aec:	00900613          	li	a2,9
    2af0:	02e7e463          	bltu	a5,a4,2b18 <_vfprintf_r+0xaf0>
    2af4:	0006ce03          	lbu	t3,0(a3)
    2af8:	002b1793          	sll	a5,s6,0x2
    2afc:	016787b3          	add	a5,a5,s6
    2b00:	00179793          	sll	a5,a5,0x1
    2b04:	00e78b33          	add	s6,a5,a4
    2b08:	fd0e0713          	add	a4,t3,-48
    2b0c:	00168693          	add	a3,a3,1
    2b10:	fee672e3          	bgeu	a2,a4,2af4 <_vfprintf_r+0xacc>
    2b14:	320b4ce3          	bltz	s6,364c <_vfprintf_r+0x1624>
    2b18:	00068913          	mv	s2,a3
    2b1c:	ec0ff06f          	j	21dc <_vfprintf_r+0x1b4>
    2b20:	00094e03          	lbu	t3,0(s2)
    2b24:	001a6a13          	or	s4,s4,1
    2b28:	eb0ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2b2c:	07714783          	lbu	a5,119(sp)
    2b30:	00094e03          	lbu	t3,0(s2)
    2b34:	ea079263          	bnez	a5,21d8 <_vfprintf_r+0x1b0>
    2b38:	02000793          	li	a5,32
    2b3c:	06f10ba3          	sb	a5,119(sp)
    2b40:	e98ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2b44:	00094e03          	lbu	t3,0(s2)
    2b48:	06c00793          	li	a5,108
    2b4c:	3afe00e3          	beq	t3,a5,36ec <_vfprintf_r+0x16c4>
    2b50:	010a6a13          	or	s4,s4,16
    2b54:	e84ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2b58:	00094e03          	lbu	t3,0(s2)
    2b5c:	008a6a13          	or	s4,s4,8
    2b60:	e78ff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2b64:	000b0313          	mv	t1,s6
    2b68:	010a6e93          	or	t4,s4,16
    2b6c:	020ef793          	and	a5,t4,32
    2b70:	0c0786e3          	beqz	a5,343c <_vfprintf_r+0x1414>
    2b74:	01412783          	lw	a5,20(sp)
    2b78:	00778b13          	add	s6,a5,7
    2b7c:	ff8b7b13          	and	s6,s6,-8
    2b80:	004b2783          	lw	a5,4(s6)
    2b84:	000b2d03          	lw	s10,0(s6)
    2b88:	008b0713          	add	a4,s6,8
    2b8c:	00e12a23          	sw	a4,20(sp)
    2b90:	00078c93          	mv	s9,a5
    2b94:	0c07cee3          	bltz	a5,3470 <_vfprintf_r+0x1448>
    2b98:	000e8613          	mv	a2,t4
    2b9c:	02034263          	bltz	t1,2bc0 <_vfprintf_r+0xb98>
    2ba0:	019d67b3          	or	a5,s10,s9
    2ba4:	f7fef613          	and	a2,t4,-129
    2ba8:	00079c63          	bnez	a5,2bc0 <_vfprintf_r+0xb98>
    2bac:	02031063          	bnez	t1,2bcc <_vfprintf_r+0xba4>
    2bb0:	00000d13          	li	s10,0
    2bb4:	00060e93          	mv	t4,a2
    2bb8:	15010c13          	add	s8,sp,336
    2bbc:	eddff06f          	j	2a98 <_vfprintf_r+0xa70>
    2bc0:	520c90e3          	bnez	s9,38e0 <_vfprintf_r+0x18b8>
    2bc4:	00900793          	li	a5,9
    2bc8:	51a7ece3          	bltu	a5,s10,38e0 <_vfprintf_r+0x18b8>
    2bcc:	030d0d13          	add	s10,s10,48
    2bd0:	15a107a3          	sb	s10,335(sp)
    2bd4:	00060e93          	mv	t4,a2
    2bd8:	00100d13          	li	s10,1
    2bdc:	14f10c13          	add	s8,sp,335
    2be0:	eb9ff06f          	j	2a98 <_vfprintf_r+0xa70>
    2be4:	000b0313          	mv	t1,s6
    2be8:	010a6e93          	or	t4,s4,16
    2bec:	020ef793          	and	a5,t4,32
    2bf0:	7e078463          	beqz	a5,33d8 <_vfprintf_r+0x13b0>
    2bf4:	01412783          	lw	a5,20(sp)
    2bf8:	00778b13          	add	s6,a5,7
    2bfc:	ff8b7b13          	and	s6,s6,-8
    2c00:	000b2d03          	lw	s10,0(s6)
    2c04:	004b2c83          	lw	s9,4(s6)
    2c08:	008b0793          	add	a5,s6,8
    2c0c:	00f12a23          	sw	a5,20(sp)
    2c10:	bffef613          	and	a2,t4,-1025
    2c14:	00000793          	li	a5,0
    2c18:	e55ff06f          	j	2a6c <_vfprintf_r+0xa44>
    2c1c:	00094e03          	lbu	t3,0(s2)
    2c20:	06800793          	li	a5,104
    2c24:	2cfe0ce3          	beq	t3,a5,36fc <_vfprintf_r+0x16d4>
    2c28:	040a6a13          	or	s4,s4,64
    2c2c:	dacff06f          	j	21d8 <_vfprintf_r+0x1b0>
    2c30:	01412703          	lw	a4,20(sp)
    2c34:	000087b7          	lui	a5,0x8
    2c38:	83078793          	add	a5,a5,-2000 # 7830 <__swsetup_r+0xfc>
    2c3c:	06f11c23          	sh	a5,120(sp)
    2c40:	00470793          	add	a5,a4,4
    2c44:	00f12a23          	sw	a5,20(sp)
    2c48:	0000c797          	auipc	a5,0xc
    2c4c:	63c78793          	add	a5,a5,1596 # f284 <__fini_array_end+0x20c>
    2c50:	02f12c23          	sw	a5,56(sp)
    2c54:	00072d03          	lw	s10,0(a4)
    2c58:	000b0313          	mv	t1,s6
    2c5c:	00000c93          	li	s9,0
    2c60:	002a6613          	or	a2,s4,2
    2c64:	00200793          	li	a5,2
    2c68:	07800e13          	li	t3,120
    2c6c:	e01ff06f          	j	2a6c <_vfprintf_r+0xa44>
    2c70:	020a7793          	and	a5,s4,32
    2c74:	180784e3          	beqz	a5,35fc <_vfprintf_r+0x15d4>
    2c78:	01412783          	lw	a5,20(sp)
    2c7c:	00c12683          	lw	a3,12(sp)
    2c80:	0007a783          	lw	a5,0(a5)
    2c84:	41f6d713          	sra	a4,a3,0x1f
    2c88:	00d7a023          	sw	a3,0(a5)
    2c8c:	00e7a223          	sw	a4,4(a5)
    2c90:	01412783          	lw	a5,20(sp)
    2c94:	00090c13          	mv	s8,s2
    2c98:	00478793          	add	a5,a5,4
    2c9c:	00f12a23          	sw	a5,20(sp)
    2ca0:	cccff06f          	j	216c <_vfprintf_r+0x144>
    2ca4:	06500713          	li	a4,101
    2ca8:	b3c754e3          	bge	a4,t3,27d0 <_vfprintf_r+0x7a8>
    2cac:	02812683          	lw	a3,40(sp)
    2cb0:	02c12703          	lw	a4,44(sp)
    2cb4:	00000613          	li	a2,0
    2cb8:	00068513          	mv	a0,a3
    2cbc:	00070593          	mv	a1,a4
    2cc0:	00000693          	li	a3,0
    2cc4:	05d12223          	sw	t4,68(sp)
    2cc8:	05d0a0ef          	jal	d524 <__eqdf2>
    2ccc:	04412e83          	lw	t4,68(sp)
    2cd0:	4e051463          	bnez	a0,31b8 <_vfprintf_r+0x1190>
    2cd4:	0a412783          	lw	a5,164(sp)
    2cd8:	0000c717          	auipc	a4,0xc
    2cdc:	5dc70713          	add	a4,a4,1500 # f2b4 <__fini_array_end+0x23c>
    2ce0:	00e42023          	sw	a4,0(s0)
    2ce4:	00148493          	add	s1,s1,1
    2ce8:	00100713          	li	a4,1
    2cec:	00178793          	add	a5,a5,1
    2cf0:	00e42223          	sw	a4,4(s0)
    2cf4:	0a912423          	sw	s1,168(sp)
    2cf8:	0af12223          	sw	a5,164(sp)
    2cfc:	00700713          	li	a4,7
    2d00:	00840413          	add	s0,s0,8
    2d04:	62f746e3          	blt	a4,a5,3b30 <_vfprintf_r+0x1b08>
    2d08:	07c12783          	lw	a5,124(sp)
    2d0c:	01812703          	lw	a4,24(sp)
    2d10:	78e7de63          	bge	a5,a4,34ac <_vfprintf_r+0x1484>
    2d14:	03412783          	lw	a5,52(sp)
    2d18:	03012703          	lw	a4,48(sp)
    2d1c:	00840413          	add	s0,s0,8
    2d20:	fef42c23          	sw	a5,-8(s0)
    2d24:	0a412783          	lw	a5,164(sp)
    2d28:	00e484b3          	add	s1,s1,a4
    2d2c:	fee42e23          	sw	a4,-4(s0)
    2d30:	00178793          	add	a5,a5,1
    2d34:	0a912423          	sw	s1,168(sp)
    2d38:	0af12223          	sw	a5,164(sp)
    2d3c:	00700713          	li	a4,7
    2d40:	1cf746e3          	blt	a4,a5,370c <_vfprintf_r+0x16e4>
    2d44:	01812783          	lw	a5,24(sp)
    2d48:	fff78d13          	add	s10,a5,-1
    2d4c:	dfa05263          	blez	s10,2330 <_vfprintf_r+0x308>
    2d50:	01000713          	li	a4,16
    2d54:	0a412783          	lw	a5,164(sp)
    2d58:	0000d297          	auipc	t0,0xd
    2d5c:	a1428293          	add	t0,t0,-1516 # f76c <zeroes.0>
    2d60:	77a752e3          	bge	a4,s10,3cc4 <_vfprintf_r+0x1c9c>
    2d64:	00048713          	mv	a4,s1
    2d68:	01000c13          	li	s8,16
    2d6c:	00700b13          	li	s6,7
    2d70:	000e8493          	mv	s1,t4
    2d74:	00028a13          	mv	s4,t0
    2d78:	00c0006f          	j	2d84 <_vfprintf_r+0xd5c>
    2d7c:	ff0d0d13          	add	s10,s10,-16
    2d80:	73ac5ce3          	bge	s8,s10,3cb8 <_vfprintf_r+0x1c90>
    2d84:	01070713          	add	a4,a4,16
    2d88:	00178793          	add	a5,a5,1
    2d8c:	01442023          	sw	s4,0(s0)
    2d90:	01842223          	sw	s8,4(s0)
    2d94:	0ae12423          	sw	a4,168(sp)
    2d98:	0af12223          	sw	a5,164(sp)
    2d9c:	00840413          	add	s0,s0,8
    2da0:	fcfb5ee3          	bge	s6,a5,2d7c <_vfprintf_r+0xd54>
    2da4:	00812583          	lw	a1,8(sp)
    2da8:	0a010613          	add	a2,sp,160
    2dac:	00098513          	mv	a0,s3
    2db0:	134020ef          	jal	4ee4 <__sprint_r>
    2db4:	f4051263          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    2db8:	0a812703          	lw	a4,168(sp)
    2dbc:	0a412783          	lw	a5,164(sp)
    2dc0:	0ac10413          	add	s0,sp,172
    2dc4:	fb9ff06f          	j	2d7c <_vfprintf_r+0xd54>
    2dc8:	000e8613          	mv	a2,t4
    2dcc:	00100713          	li	a4,1
    2dd0:	dee788e3          	beq	a5,a4,2bc0 <_vfprintf_r+0xb98>
    2dd4:	00200713          	li	a4,2
    2dd8:	06e78c63          	beq	a5,a4,2e50 <_vfprintf_r+0xe28>
    2ddc:	15010c13          	add	s8,sp,336
    2de0:	01dc9793          	sll	a5,s9,0x1d
    2de4:	007d7713          	and	a4,s10,7
    2de8:	003d5d13          	srl	s10,s10,0x3
    2dec:	03070713          	add	a4,a4,48
    2df0:	01a7ed33          	or	s10,a5,s10
    2df4:	003cdc93          	srl	s9,s9,0x3
    2df8:	feec0fa3          	sb	a4,-1(s8)
    2dfc:	019d67b3          	or	a5,s10,s9
    2e00:	000c0593          	mv	a1,s8
    2e04:	fffc0c13          	add	s8,s8,-1
    2e08:	fc079ce3          	bnez	a5,2de0 <_vfprintf_r+0xdb8>
    2e0c:	00167693          	and	a3,a2,1
    2e10:	06068a63          	beqz	a3,2e84 <_vfprintf_r+0xe5c>
    2e14:	03000693          	li	a3,48
    2e18:	06d70663          	beq	a4,a3,2e84 <_vfprintf_r+0xe5c>
    2e1c:	ffe58593          	add	a1,a1,-2 # 1ffe <_malloc_r+0x7ce>
    2e20:	15010793          	add	a5,sp,336
    2e24:	fedc0fa3          	sb	a3,-1(s8)
    2e28:	40b78d33          	sub	s10,a5,a1
    2e2c:	00060e93          	mv	t4,a2
    2e30:	00058c13          	mv	s8,a1
    2e34:	c65ff06f          	j	2a98 <_vfprintf_r+0xa70>
    2e38:	00100713          	li	a4,1
    2e3c:	00e79463          	bne	a5,a4,2e44 <_vfprintf_r+0xe1c>
    2e40:	2b10106f          	j	48f0 <_vfprintf_r+0x28c8>
    2e44:	00200713          	li	a4,2
    2e48:	000e8613          	mv	a2,t4
    2e4c:	f8e798e3          	bne	a5,a4,2ddc <_vfprintf_r+0xdb4>
    2e50:	03812683          	lw	a3,56(sp)
    2e54:	15010c13          	add	s8,sp,336
    2e58:	00fd7793          	and	a5,s10,15
    2e5c:	00f687b3          	add	a5,a3,a5
    2e60:	0007c703          	lbu	a4,0(a5)
    2e64:	004d5d13          	srl	s10,s10,0x4
    2e68:	01cc9793          	sll	a5,s9,0x1c
    2e6c:	01a7ed33          	or	s10,a5,s10
    2e70:	004cdc93          	srl	s9,s9,0x4
    2e74:	feec0fa3          	sb	a4,-1(s8)
    2e78:	019d67b3          	or	a5,s10,s9
    2e7c:	fffc0c13          	add	s8,s8,-1
    2e80:	fc079ce3          	bnez	a5,2e58 <_vfprintf_r+0xe30>
    2e84:	15010793          	add	a5,sp,336
    2e88:	41878d33          	sub	s10,a5,s8
    2e8c:	00060e93          	mv	t4,a2
    2e90:	c09ff06f          	j	2a98 <_vfprintf_r+0xa70>
    2e94:	419b8b33          	sub	s6,s7,s9
    2e98:	c7605063          	blez	s6,22f8 <_vfprintf_r+0x2d0>
    2e9c:	01000593          	li	a1,16
    2ea0:	0a412603          	lw	a2,164(sp)
    2ea4:	0000d297          	auipc	t0,0xd
    2ea8:	8c828293          	add	t0,t0,-1848 # f76c <zeroes.0>
    2eac:	0b65d463          	bge	a1,s6,2f54 <_vfprintf_r+0xf2c>
    2eb0:	00040793          	mv	a5,s0
    2eb4:	00048713          	mv	a4,s1
    2eb8:	000b0413          	mv	s0,s6
    2ebc:	01000893          	li	a7,16
    2ec0:	000a0b13          	mv	s6,s4
    2ec4:	00700f93          	li	t6,7
    2ec8:	05d12223          	sw	t4,68(sp)
    2ecc:	05c12823          	sw	t3,80(sp)
    2ed0:	00030a13          	mv	s4,t1
    2ed4:	00028493          	mv	s1,t0
    2ed8:	00c0006f          	j	2ee4 <_vfprintf_r+0xebc>
    2edc:	ff040413          	add	s0,s0,-16
    2ee0:	0488da63          	bge	a7,s0,2f34 <_vfprintf_r+0xf0c>
    2ee4:	01070713          	add	a4,a4,16
    2ee8:	00160613          	add	a2,a2,1
    2eec:	0097a023          	sw	s1,0(a5)
    2ef0:	0117a223          	sw	a7,4(a5)
    2ef4:	0ae12423          	sw	a4,168(sp)
    2ef8:	0ac12223          	sw	a2,164(sp)
    2efc:	00878793          	add	a5,a5,8
    2f00:	fccfdee3          	bge	t6,a2,2edc <_vfprintf_r+0xeb4>
    2f04:	00812583          	lw	a1,8(sp)
    2f08:	0a010613          	add	a2,sp,160
    2f0c:	00098513          	mv	a0,s3
    2f10:	7d5010ef          	jal	4ee4 <__sprint_r>
    2f14:	de051263          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    2f18:	01000893          	li	a7,16
    2f1c:	ff040413          	add	s0,s0,-16
    2f20:	0a812703          	lw	a4,168(sp)
    2f24:	0a412603          	lw	a2,164(sp)
    2f28:	0ac10793          	add	a5,sp,172
    2f2c:	00700f93          	li	t6,7
    2f30:	fa88cae3          	blt	a7,s0,2ee4 <_vfprintf_r+0xebc>
    2f34:	04412e83          	lw	t4,68(sp)
    2f38:	05012e03          	lw	t3,80(sp)
    2f3c:	000a0313          	mv	t1,s4
    2f40:	00048293          	mv	t0,s1
    2f44:	000b0a13          	mv	s4,s6
    2f48:	00070493          	mv	s1,a4
    2f4c:	00040b13          	mv	s6,s0
    2f50:	00078413          	mv	s0,a5
    2f54:	016484b3          	add	s1,s1,s6
    2f58:	00160613          	add	a2,a2,1
    2f5c:	00542023          	sw	t0,0(s0)
    2f60:	01642223          	sw	s6,4(s0)
    2f64:	0a912423          	sw	s1,168(sp)
    2f68:	0ac12223          	sw	a2,164(sp)
    2f6c:	00700713          	li	a4,7
    2f70:	00840413          	add	s0,s0,8
    2f74:	b8c75263          	bge	a4,a2,22f8 <_vfprintf_r+0x2d0>
    2f78:	00812583          	lw	a1,8(sp)
    2f7c:	0a010613          	add	a2,sp,160
    2f80:	00098513          	mv	a0,s3
    2f84:	04612a23          	sw	t1,84(sp)
    2f88:	05c12823          	sw	t3,80(sp)
    2f8c:	05d12223          	sw	t4,68(sp)
    2f90:	755010ef          	jal	4ee4 <__sprint_r>
    2f94:	d6051263          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    2f98:	0a812483          	lw	s1,168(sp)
    2f9c:	05412303          	lw	t1,84(sp)
    2fa0:	05012e03          	lw	t3,80(sp)
    2fa4:	04412e83          	lw	t4,68(sp)
    2fa8:	0ac10413          	add	s0,sp,172
    2fac:	b4cff06f          	j	22f8 <_vfprintf_r+0x2d0>
    2fb0:	01000713          	li	a4,16
    2fb4:	0a412603          	lw	a2,164(sp)
    2fb8:	0000c297          	auipc	t0,0xc
    2fbc:	7b428293          	add	t0,t0,1972 # f76c <zeroes.0>
    2fc0:	0b675063          	bge	a4,s6,3060 <_vfprintf_r+0x1038>
    2fc4:	00040793          	mv	a5,s0
    2fc8:	00048693          	mv	a3,s1
    2fcc:	000b0413          	mv	s0,s6
    2fd0:	01000713          	li	a4,16
    2fd4:	00700893          	li	a7,7
    2fd8:	05d12223          	sw	t4,68(sp)
    2fdc:	000e0493          	mv	s1,t3
    2fe0:	00028b13          	mv	s6,t0
    2fe4:	00c0006f          	j	2ff0 <_vfprintf_r+0xfc8>
    2fe8:	ff040413          	add	s0,s0,-16
    2fec:	04875e63          	bge	a4,s0,3048 <_vfprintf_r+0x1020>
    2ff0:	01068693          	add	a3,a3,16
    2ff4:	00160613          	add	a2,a2,1
    2ff8:	0000c597          	auipc	a1,0xc
    2ffc:	77458593          	add	a1,a1,1908 # f76c <zeroes.0>
    3000:	00b7a023          	sw	a1,0(a5)
    3004:	00e7a223          	sw	a4,4(a5)
    3008:	0ad12423          	sw	a3,168(sp)
    300c:	0ac12223          	sw	a2,164(sp)
    3010:	00878793          	add	a5,a5,8
    3014:	fcc8dae3          	bge	a7,a2,2fe8 <_vfprintf_r+0xfc0>
    3018:	00812583          	lw	a1,8(sp)
    301c:	0a010613          	add	a2,sp,160
    3020:	00098513          	mv	a0,s3
    3024:	6c1010ef          	jal	4ee4 <__sprint_r>
    3028:	cc051863          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    302c:	01000713          	li	a4,16
    3030:	ff040413          	add	s0,s0,-16
    3034:	0a812683          	lw	a3,168(sp)
    3038:	0a412603          	lw	a2,164(sp)
    303c:	0ac10793          	add	a5,sp,172
    3040:	00700893          	li	a7,7
    3044:	fa8746e3          	blt	a4,s0,2ff0 <_vfprintf_r+0xfc8>
    3048:	04412e83          	lw	t4,68(sp)
    304c:	00048e13          	mv	t3,s1
    3050:	000b0293          	mv	t0,s6
    3054:	00068493          	mv	s1,a3
    3058:	00040b13          	mv	s6,s0
    305c:	00078413          	mv	s0,a5
    3060:	016484b3          	add	s1,s1,s6
    3064:	00160613          	add	a2,a2,1
    3068:	00542023          	sw	t0,0(s0)
    306c:	01642223          	sw	s6,4(s0)
    3070:	0a912423          	sw	s1,168(sp)
    3074:	0ac12223          	sw	a2,164(sp)
    3078:	00700713          	li	a4,7
    307c:	00840413          	add	s0,s0,8
    3080:	a8c75063          	bge	a4,a2,2300 <_vfprintf_r+0x2d8>
    3084:	00812583          	lw	a1,8(sp)
    3088:	0a010613          	add	a2,sp,160
    308c:	00098513          	mv	a0,s3
    3090:	05c12823          	sw	t3,80(sp)
    3094:	05d12223          	sw	t4,68(sp)
    3098:	64d010ef          	jal	4ee4 <__sprint_r>
    309c:	c4051e63          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    30a0:	0a812483          	lw	s1,168(sp)
    30a4:	05012e03          	lw	t3,80(sp)
    30a8:	04412e83          	lw	t4,68(sp)
    30ac:	0ac10413          	add	s0,sp,172
    30b0:	a50ff06f          	j	2300 <_vfprintf_r+0x2d8>
    30b4:	00812583          	lw	a1,8(sp)
    30b8:	0a010613          	add	a2,sp,160
    30bc:	00098513          	mv	a0,s3
    30c0:	04612c23          	sw	t1,88(sp)
    30c4:	05c12a23          	sw	t3,84(sp)
    30c8:	05d12823          	sw	t4,80(sp)
    30cc:	05f12223          	sw	t6,68(sp)
    30d0:	615010ef          	jal	4ee4 <__sprint_r>
    30d4:	c2051263          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    30d8:	0a812483          	lw	s1,168(sp)
    30dc:	05812303          	lw	t1,88(sp)
    30e0:	05412e03          	lw	t3,84(sp)
    30e4:	05012e83          	lw	t4,80(sp)
    30e8:	04412f83          	lw	t6,68(sp)
    30ec:	0ac10413          	add	s0,sp,172
    30f0:	a00ff06f          	j	22f0 <_vfprintf_r+0x2c8>
    30f4:	01000713          	li	a4,16
    30f8:	0a412783          	lw	a5,164(sp)
    30fc:	0000cb17          	auipc	s6,0xc
    3100:	680b0b13          	add	s6,s6,1664 # f77c <blanks.1>
    3104:	07a75c63          	bge	a4,s10,317c <_vfprintf_r+0x1154>
    3108:	000b0713          	mv	a4,s6
    310c:	01000c13          	li	s8,16
    3110:	00090b13          	mv	s6,s2
    3114:	00700a13          	li	s4,7
    3118:	00070913          	mv	s2,a4
    311c:	00c0006f          	j	3128 <_vfprintf_r+0x1100>
    3120:	ff0d0d13          	add	s10,s10,-16
    3124:	05ac5663          	bge	s8,s10,3170 <_vfprintf_r+0x1148>
    3128:	01048493          	add	s1,s1,16
    312c:	00178793          	add	a5,a5,1
    3130:	01242023          	sw	s2,0(s0)
    3134:	01842223          	sw	s8,4(s0)
    3138:	0a912423          	sw	s1,168(sp)
    313c:	0af12223          	sw	a5,164(sp)
    3140:	00840413          	add	s0,s0,8
    3144:	fcfa5ee3          	bge	s4,a5,3120 <_vfprintf_r+0x10f8>
    3148:	00812583          	lw	a1,8(sp)
    314c:	0a010613          	add	a2,sp,160
    3150:	00098513          	mv	a0,s3
    3154:	591010ef          	jal	4ee4 <__sprint_r>
    3158:	ba051063          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    315c:	ff0d0d13          	add	s10,s10,-16
    3160:	0a812483          	lw	s1,168(sp)
    3164:	0a412783          	lw	a5,164(sp)
    3168:	0ac10413          	add	s0,sp,172
    316c:	fbac4ee3          	blt	s8,s10,3128 <_vfprintf_r+0x1100>
    3170:	00090713          	mv	a4,s2
    3174:	000b0913          	mv	s2,s6
    3178:	00070b13          	mv	s6,a4
    317c:	01a484b3          	add	s1,s1,s10
    3180:	00178793          	add	a5,a5,1
    3184:	01642023          	sw	s6,0(s0)
    3188:	01a42223          	sw	s10,4(s0)
    318c:	0a912423          	sw	s1,168(sp)
    3190:	0af12223          	sw	a5,164(sp)
    3194:	00700713          	li	a4,7
    3198:	9af75463          	bge	a4,a5,2340 <_vfprintf_r+0x318>
    319c:	00812583          	lw	a1,8(sp)
    31a0:	0a010613          	add	a2,sp,160
    31a4:	00098513          	mv	a0,s3
    31a8:	53d010ef          	jal	4ee4 <__sprint_r>
    31ac:	b4051663          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    31b0:	0a812483          	lw	s1,168(sp)
    31b4:	98cff06f          	j	2340 <_vfprintf_r+0x318>
    31b8:	07c12683          	lw	a3,124(sp)
    31bc:	30d05c63          	blez	a3,34d4 <_vfprintf_r+0x14ac>
    31c0:	01812783          	lw	a5,24(sp)
    31c4:	000a0b13          	mv	s6,s4
    31c8:	0147d463          	bge	a5,s4,31d0 <_vfprintf_r+0x11a8>
    31cc:	00078b13          	mv	s6,a5
    31d0:	03605863          	blez	s6,3200 <_vfprintf_r+0x11d8>
    31d4:	0a412683          	lw	a3,164(sp)
    31d8:	016484b3          	add	s1,s1,s6
    31dc:	01842023          	sw	s8,0(s0)
    31e0:	00168693          	add	a3,a3,1
    31e4:	01642223          	sw	s6,4(s0)
    31e8:	0a912423          	sw	s1,168(sp)
    31ec:	0ad12223          	sw	a3,164(sp)
    31f0:	00700613          	li	a2,7
    31f4:	00840413          	add	s0,s0,8
    31f8:	00d65463          	bge	a2,a3,3200 <_vfprintf_r+0x11d8>
    31fc:	5c40106f          	j	47c0 <_vfprintf_r+0x2798>
    3200:	fffb4693          	not	a3,s6
    3204:	41f6d693          	sra	a3,a3,0x1f
    3208:	00db7733          	and	a4,s6,a3
    320c:	40ea0b33          	sub	s6,s4,a4
    3210:	35604ae3          	bgtz	s6,3d64 <_vfprintf_r+0x1d3c>
    3214:	400ef713          	and	a4,t4,1024
    3218:	014c0333          	add	t1,s8,s4
    321c:	00070463          	beqz	a4,3224 <_vfprintf_r+0x11fc>
    3220:	2980106f          	j	44b8 <_vfprintf_r+0x2490>
    3224:	07c12d03          	lw	s10,124(sp)
    3228:	01812783          	lw	a5,24(sp)
    322c:	5afd4063          	blt	s10,a5,37cc <_vfprintf_r+0x17a4>
    3230:	001ef713          	and	a4,t4,1
    3234:	58071c63          	bnez	a4,37cc <_vfprintf_r+0x17a4>
    3238:	01812703          	lw	a4,24(sp)
    323c:	00ec07b3          	add	a5,s8,a4
    3240:	41a70d33          	sub	s10,a4,s10
    3244:	40678b33          	sub	s6,a5,t1
    3248:	016d5463          	bge	s10,s6,3250 <_vfprintf_r+0x1228>
    324c:	000d0b13          	mv	s6,s10
    3250:	03605863          	blez	s6,3280 <_vfprintf_r+0x1258>
    3254:	0a412703          	lw	a4,164(sp)
    3258:	016484b3          	add	s1,s1,s6
    325c:	00642023          	sw	t1,0(s0)
    3260:	00170713          	add	a4,a4,1
    3264:	01642223          	sw	s6,4(s0)
    3268:	0a912423          	sw	s1,168(sp)
    326c:	0ae12223          	sw	a4,164(sp)
    3270:	00700693          	li	a3,7
    3274:	00840413          	add	s0,s0,8
    3278:	00e6d463          	bge	a3,a4,3280 <_vfprintf_r+0x1258>
    327c:	5880106f          	j	4804 <_vfprintf_r+0x27dc>
    3280:	fffb4713          	not	a4,s6
    3284:	41f75713          	sra	a4,a4,0x1f
    3288:	00eb77b3          	and	a5,s6,a4
    328c:	40fd0d33          	sub	s10,s10,a5
    3290:	8ba05063          	blez	s10,2330 <_vfprintf_r+0x308>
    3294:	01000713          	li	a4,16
    3298:	0a412783          	lw	a5,164(sp)
    329c:	0000c297          	auipc	t0,0xc
    32a0:	4d028293          	add	t0,t0,1232 # f76c <zeroes.0>
    32a4:	23a750e3          	bge	a4,s10,3cc4 <_vfprintf_r+0x1c9c>
    32a8:	00048713          	mv	a4,s1
    32ac:	01000c13          	li	s8,16
    32b0:	00700b13          	li	s6,7
    32b4:	000e8493          	mv	s1,t4
    32b8:	00028a13          	mv	s4,t0
    32bc:	00c0006f          	j	32c8 <_vfprintf_r+0x12a0>
    32c0:	ff0d0d13          	add	s10,s10,-16
    32c4:	1fac5ae3          	bge	s8,s10,3cb8 <_vfprintf_r+0x1c90>
    32c8:	01070713          	add	a4,a4,16
    32cc:	00178793          	add	a5,a5,1
    32d0:	01442023          	sw	s4,0(s0)
    32d4:	01842223          	sw	s8,4(s0)
    32d8:	0ae12423          	sw	a4,168(sp)
    32dc:	0af12223          	sw	a5,164(sp)
    32e0:	00840413          	add	s0,s0,8
    32e4:	fcfb5ee3          	bge	s6,a5,32c0 <_vfprintf_r+0x1298>
    32e8:	00812583          	lw	a1,8(sp)
    32ec:	0a010613          	add	a2,sp,160
    32f0:	00098513          	mv	a0,s3
    32f4:	3f1010ef          	jal	4ee4 <__sprint_r>
    32f8:	a0051063          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    32fc:	0a812703          	lw	a4,168(sp)
    3300:	0a412783          	lw	a5,164(sp)
    3304:	0ac10413          	add	s0,sp,172
    3308:	fb9ff06f          	j	32c0 <_vfprintf_r+0x1298>
    330c:	001ef613          	and	a2,t4,1
    3310:	ce061063          	bnez	a2,27f0 <_vfprintf_r+0x7c8>
    3314:	00d42223          	sw	a3,4(s0)
    3318:	0a912423          	sw	s1,168(sp)
    331c:	0ba12223          	sw	s10,164(sp)
    3320:	00700793          	li	a5,7
    3324:	d7a7d863          	bge	a5,s10,2894 <_vfprintf_r+0x86c>
    3328:	00812583          	lw	a1,8(sp)
    332c:	0a010613          	add	a2,sp,160
    3330:	00098513          	mv	a0,s3
    3334:	03d12023          	sw	t4,32(sp)
    3338:	3ad010ef          	jal	4ee4 <__sprint_r>
    333c:	9a051e63          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    3340:	0a812483          	lw	s1,168(sp)
    3344:	0a412d03          	lw	s10,164(sp)
    3348:	02012e83          	lw	t4,32(sp)
    334c:	0ac10b13          	add	s6,sp,172
    3350:	d44ff06f          	j	2894 <_vfprintf_r+0x86c>
    3354:	01812703          	lw	a4,24(sp)
    3358:	00100793          	li	a5,1
    335c:	d2e7dc63          	bge	a5,a4,2894 <_vfprintf_r+0x86c>
    3360:	01100793          	li	a5,17
    3364:	0000c297          	auipc	t0,0xc
    3368:	40828293          	add	t0,t0,1032 # f76c <zeroes.0>
    336c:	18e7d4e3          	bge	a5,a4,3cf4 <_vfprintf_r+0x1ccc>
    3370:	00040a13          	mv	s4,s0
    3374:	01000793          	li	a5,16
    3378:	00700c13          	li	s8,7
    337c:	03d12023          	sw	t4,32(sp)
    3380:	00028413          	mv	s0,t0
    3384:	00c0006f          	j	3390 <_vfprintf_r+0x1368>
    3388:	ff0a0a13          	add	s4,s4,-16
    338c:	1547dee3          	bge	a5,s4,3ce8 <_vfprintf_r+0x1cc0>
    3390:	01048493          	add	s1,s1,16
    3394:	001d0d13          	add	s10,s10,1
    3398:	008b2023          	sw	s0,0(s6)
    339c:	00fb2223          	sw	a5,4(s6)
    33a0:	0a912423          	sw	s1,168(sp)
    33a4:	0ba12223          	sw	s10,164(sp)
    33a8:	008b0b13          	add	s6,s6,8
    33ac:	fdac5ee3          	bge	s8,s10,3388 <_vfprintf_r+0x1360>
    33b0:	00812583          	lw	a1,8(sp)
    33b4:	0a010613          	add	a2,sp,160
    33b8:	00098513          	mv	a0,s3
    33bc:	329010ef          	jal	4ee4 <__sprint_r>
    33c0:	92051c63          	bnez	a0,24f8 <_vfprintf_r+0x4d0>
    33c4:	0a812483          	lw	s1,168(sp)
    33c8:	0a412d03          	lw	s10,164(sp)
    33cc:	0ac10b13          	add	s6,sp,172
    33d0:	01000793          	li	a5,16
    33d4:	fb5ff06f          	j	3388 <_vfprintf_r+0x1360>
    33d8:	01412703          	lw	a4,20(sp)
    33dc:	010ef793          	and	a5,t4,16
    33e0:	00072d03          	lw	s10,0(a4)
    33e4:	00470713          	add	a4,a4,4
    33e8:	00e12a23          	sw	a4,20(sp)
    33ec:	1a079663          	bnez	a5,3598 <_vfprintf_r+0x1570>
    33f0:	040ef793          	and	a5,t4,64
    33f4:	18078e63          	beqz	a5,3590 <_vfprintf_r+0x1568>
    33f8:	010d1d13          	sll	s10,s10,0x10
    33fc:	010d5d13          	srl	s10,s10,0x10
    3400:	00000c93          	li	s9,0
    3404:	80dff06f          	j	2c10 <_vfprintf_r+0xbe8>
    3408:	01412703          	lw	a4,20(sp)
    340c:	01067793          	and	a5,a2,16
    3410:	00072d03          	lw	s10,0(a4)
    3414:	00470713          	add	a4,a4,4
    3418:	00e12a23          	sw	a4,20(sp)
    341c:	14079a63          	bnez	a5,3570 <_vfprintf_r+0x1548>
    3420:	04067793          	and	a5,a2,64
    3424:	14078063          	beqz	a5,3564 <_vfprintf_r+0x153c>
    3428:	010d1d13          	sll	s10,s10,0x10
    342c:	010d5d13          	srl	s10,s10,0x10
    3430:	00000c93          	li	s9,0
    3434:	00100793          	li	a5,1
    3438:	e34ff06f          	j	2a6c <_vfprintf_r+0xa44>
    343c:	01412703          	lw	a4,20(sp)
    3440:	010ef793          	and	a5,t4,16
    3444:	00072d03          	lw	s10,0(a4)
    3448:	00470713          	add	a4,a4,4
    344c:	00e12a23          	sw	a4,20(sp)
    3450:	12079a63          	bnez	a5,3584 <_vfprintf_r+0x155c>
    3454:	040ef793          	and	a5,t4,64
    3458:	12078263          	beqz	a5,357c <_vfprintf_r+0x1554>
    345c:	010d1d13          	sll	s10,s10,0x10
    3460:	410d5d13          	sra	s10,s10,0x10
    3464:	41fd5c93          	sra	s9,s10,0x1f
    3468:	000c8793          	mv	a5,s9
    346c:	f207d663          	bgez	a5,2b98 <_vfprintf_r+0xb70>
    3470:	01a037b3          	snez	a5,s10
    3474:	419000b3          	neg	ra,s9
    3478:	40f08cb3          	sub	s9,ra,a5
    347c:	41a00d33          	neg	s10,s10
    3480:	000e8613          	mv	a2,t4
    3484:	02d00713          	li	a4,45
    3488:	00100793          	li	a5,1
    348c:	de4ff06f          	j	2a70 <_vfprintf_r+0xa48>
    3490:	00812403          	lw	s0,8(sp)
    3494:	00f12623          	sw	a5,12(sp)
    3498:	05842503          	lw	a0,88(s0)
    349c:	c31fd0ef          	jal	10cc <__retarget_lock_acquire_recursive>
    34a0:	00c41703          	lh	a4,12(s0)
    34a4:	00c12783          	lw	a5,12(sp)
    34a8:	c01fe06f          	j	20a8 <_vfprintf_r+0x80>
    34ac:	001ef793          	and	a5,t4,1
    34b0:	00079463          	bnez	a5,34b8 <_vfprintf_r+0x1490>
    34b4:	e7dfe06f          	j	2330 <_vfprintf_r+0x308>
    34b8:	85dff06f          	j	2d14 <_vfprintf_r+0xcec>
    34bc:	000a0e93          	mv	t4,s4
    34c0:	000b0313          	mv	t1,s6
    34c4:	ea8ff06f          	j	2b6c <_vfprintf_r+0xb44>
    34c8:	00094e03          	lbu	t3,0(s2)
    34cc:	00f12a23          	sw	a5,20(sp)
    34d0:	d09fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    34d4:	0a412703          	lw	a4,164(sp)
    34d8:	0000c617          	auipc	a2,0xc
    34dc:	ddc60613          	add	a2,a2,-548 # f2b4 <__fini_array_end+0x23c>
    34e0:	00c42023          	sw	a2,0(s0)
    34e4:	00148493          	add	s1,s1,1
    34e8:	00100613          	li	a2,1
    34ec:	00170713          	add	a4,a4,1
    34f0:	00c42223          	sw	a2,4(s0)
    34f4:	0a912423          	sw	s1,168(sp)
    34f8:	0ae12223          	sw	a4,164(sp)
    34fc:	00700613          	li	a2,7
    3500:	00840413          	add	s0,s0,8
    3504:	2ee64ce3          	blt	a2,a4,3ffc <_vfprintf_r+0x1fd4>
    3508:	7e069e63          	bnez	a3,3d04 <_vfprintf_r+0x1cdc>
    350c:	01812783          	lw	a5,24(sp)
    3510:	001ef713          	and	a4,t4,1
    3514:	00f76733          	or	a4,a4,a5
    3518:	00071463          	bnez	a4,3520 <_vfprintf_r+0x14f8>
    351c:	e15fe06f          	j	2330 <_vfprintf_r+0x308>
    3520:	03412703          	lw	a4,52(sp)
    3524:	03012783          	lw	a5,48(sp)
    3528:	00700693          	li	a3,7
    352c:	00e42023          	sw	a4,0(s0)
    3530:	0a412703          	lw	a4,164(sp)
    3534:	009784b3          	add	s1,a5,s1
    3538:	00f42223          	sw	a5,4(s0)
    353c:	00170713          	add	a4,a4,1
    3540:	0a912423          	sw	s1,168(sp)
    3544:	0ae12223          	sw	a4,164(sp)
    3548:	38e6c8e3          	blt	a3,a4,40d8 <_vfprintf_r+0x20b0>
    354c:	00840413          	add	s0,s0,8
    3550:	7e80006f          	j	3d38 <_vfprintf_r+0x1d10>
    3554:	03000793          	li	a5,48
    3558:	14f107a3          	sb	a5,335(sp)
    355c:	14f10c13          	add	s8,sp,335
    3560:	d38ff06f          	j	2a98 <_vfprintf_r+0xa70>
    3564:	20067793          	and	a5,a2,512
    3568:	00078463          	beqz	a5,3570 <_vfprintf_r+0x1548>
    356c:	0ffd7d13          	zext.b	s10,s10
    3570:	00000c93          	li	s9,0
    3574:	00100793          	li	a5,1
    3578:	cf4ff06f          	j	2a6c <_vfprintf_r+0xa44>
    357c:	200ef793          	and	a5,t4,512
    3580:	2c0796e3          	bnez	a5,404c <_vfprintf_r+0x2024>
    3584:	41fd5c93          	sra	s9,s10,0x1f
    3588:	000c8793          	mv	a5,s9
    358c:	e08ff06f          	j	2b94 <_vfprintf_r+0xb6c>
    3590:	200ef793          	and	a5,t4,512
    3594:	2a0790e3          	bnez	a5,4034 <_vfprintf_r+0x200c>
    3598:	00000c93          	li	s9,0
    359c:	e74ff06f          	j	2c10 <_vfprintf_r+0xbe8>
    35a0:	01412783          	lw	a5,20(sp)
    35a4:	06010513          	add	a0,sp,96
    35a8:	03612223          	sw	s6,36(sp)
    35ac:	0007a703          	lw	a4,0(a5)
    35b0:	03c12023          	sw	t3,32(sp)
    35b4:	00478b13          	add	s6,a5,4
    35b8:	00072683          	lw	a3,0(a4)
    35bc:	01412823          	sw	s4,16(sp)
    35c0:	06d12023          	sw	a3,96(sp)
    35c4:	00472683          	lw	a3,4(a4)
    35c8:	06d12223          	sw	a3,100(sp)
    35cc:	00872683          	lw	a3,8(a4)
    35d0:	06d12423          	sw	a3,104(sp)
    35d4:	00c72703          	lw	a4,12(a4)
    35d8:	06e12623          	sw	a4,108(sp)
    35dc:	4c80b0ef          	jal	eaa4 <__trunctfdf2>
    35e0:	02012e03          	lw	t3,32(sp)
    35e4:	02412303          	lw	t1,36(sp)
    35e8:	02a12423          	sw	a0,40(sp)
    35ec:	02b12623          	sw	a1,44(sp)
    35f0:	01612a23          	sw	s6,20(sp)
    35f4:	000a0e93          	mv	t4,s4
    35f8:	fb1fe06f          	j	25a8 <_vfprintf_r+0x580>
    35fc:	010a7793          	and	a5,s4,16
    3600:	6c079a63          	bnez	a5,3cd4 <_vfprintf_r+0x1cac>
    3604:	040a7793          	and	a5,s4,64
    3608:	24079ce3          	bnez	a5,4060 <_vfprintf_r+0x2038>
    360c:	200a7f13          	and	t5,s4,512
    3610:	6c0f0263          	beqz	t5,3cd4 <_vfprintf_r+0x1cac>
    3614:	01412783          	lw	a5,20(sp)
    3618:	00c12703          	lw	a4,12(sp)
    361c:	0007a783          	lw	a5,0(a5)
    3620:	00e78023          	sb	a4,0(a5)
    3624:	e6cff06f          	j	2c90 <_vfprintf_r+0xc68>
    3628:	03c12783          	lw	a5,60(sp)
    362c:	00094e03          	lbu	t3,0(s2)
    3630:	00079463          	bnez	a5,3638 <_vfprintf_r+0x1610>
    3634:	ba5fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    3638:	0007c783          	lbu	a5,0(a5)
    363c:	00079463          	bnez	a5,3644 <_vfprintf_r+0x161c>
    3640:	b99fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    3644:	400a6a13          	or	s4,s4,1024
    3648:	b91fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    364c:	fff00b13          	li	s6,-1
    3650:	00068913          	mv	s2,a3
    3654:	b89fe06f          	j	21dc <_vfprintf_r+0x1b4>
    3658:	0000c797          	auipc	a5,0xc
    365c:	c4078793          	add	a5,a5,-960 # f298 <__fini_array_end+0x220>
    3660:	000a0e93          	mv	t4,s4
    3664:	000b0313          	mv	t1,s6
    3668:	02f12c23          	sw	a5,56(sp)
    366c:	020ef793          	and	a5,t4,32
    3670:	1c078263          	beqz	a5,3834 <_vfprintf_r+0x180c>
    3674:	01412783          	lw	a5,20(sp)
    3678:	00778b13          	add	s6,a5,7
    367c:	ff8b7b13          	and	s6,s6,-8
    3680:	000b2d03          	lw	s10,0(s6)
    3684:	004b2c83          	lw	s9,4(s6)
    3688:	008b0793          	add	a5,s6,8
    368c:	00f12a23          	sw	a5,20(sp)
    3690:	001ef793          	and	a5,t4,1
    3694:	00078e63          	beqz	a5,36b0 <_vfprintf_r+0x1688>
    3698:	019d67b3          	or	a5,s10,s9
    369c:	00078a63          	beqz	a5,36b0 <_vfprintf_r+0x1688>
    36a0:	03000793          	li	a5,48
    36a4:	06f10c23          	sb	a5,120(sp)
    36a8:	07c10ca3          	sb	t3,121(sp)
    36ac:	002eee93          	or	t4,t4,2
    36b0:	bffef613          	and	a2,t4,-1025
    36b4:	00200793          	li	a5,2
    36b8:	bb4ff06f          	j	2a6c <_vfprintf_r+0xa44>
    36bc:	000b0313          	mv	t1,s6
    36c0:	000a0613          	mv	a2,s4
    36c4:	b80ff06f          	j	2a44 <_vfprintf_r+0xa1c>
    36c8:	000a0e93          	mv	t4,s4
    36cc:	000b0313          	mv	t1,s6
    36d0:	d1cff06f          	j	2bec <_vfprintf_r+0xbc4>
    36d4:	0000c797          	auipc	a5,0xc
    36d8:	bb078793          	add	a5,a5,-1104 # f284 <__fini_array_end+0x20c>
    36dc:	000a0e93          	mv	t4,s4
    36e0:	000b0313          	mv	t1,s6
    36e4:	02f12c23          	sw	a5,56(sp)
    36e8:	f85ff06f          	j	366c <_vfprintf_r+0x1644>
    36ec:	00194e03          	lbu	t3,1(s2)
    36f0:	020a6a13          	or	s4,s4,32
    36f4:	00190913          	add	s2,s2,1
    36f8:	ae1fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    36fc:	00194e03          	lbu	t3,1(s2)
    3700:	200a6a13          	or	s4,s4,512
    3704:	00190913          	add	s2,s2,1
    3708:	ad1fe06f          	j	21d8 <_vfprintf_r+0x1b0>
    370c:	00812583          	lw	a1,8(sp)
    3710:	0a010613          	add	a2,sp,160
    3714:	00098513          	mv	a0,s3
    3718:	03d12023          	sw	t4,32(sp)
    371c:	7c8010ef          	jal	4ee4 <__sprint_r>
    3720:	00050463          	beqz	a0,3728 <_vfprintf_r+0x1700>
    3724:	dd5fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    3728:	0a812483          	lw	s1,168(sp)
    372c:	02012e83          	lw	t4,32(sp)
    3730:	0ac10413          	add	s0,sp,172
    3734:	e10ff06f          	j	2d44 <_vfprintf_r+0xd1c>
    3738:	00600793          	li	a5,6
    373c:	00030c93          	mv	s9,t1
    3740:	0e67e6e3          	bltu	a5,t1,402c <_vfprintf_r+0x2004>
    3744:	01612a23          	sw	s6,20(sp)
    3748:	00012823          	sw	zero,16(sp)
    374c:	000c8d13          	mv	s10,s9
    3750:	00000613          	li	a2,0
    3754:	00000313          	li	t1,0
    3758:	02012223          	sw	zero,36(sp)
    375c:	02012023          	sw	zero,32(sp)
    3760:	00000a13          	li	s4,0
    3764:	0000cc17          	auipc	s8,0xc
    3768:	b48c0c13          	add	s8,s8,-1208 # f2ac <__fini_array_end+0x234>
    376c:	afdfe06f          	j	2268 <_vfprintf_r+0x240>
    3770:	00800613          	li	a2,8
    3774:	00000593          	li	a1,0
    3778:	09810513          	add	a0,sp,152
    377c:	03c12023          	sw	t3,32(sp)
    3780:	01d12823          	sw	t4,16(sp)
    3784:	951fd0ef          	jal	10d4 <memset>
    3788:	01412783          	lw	a5,20(sp)
    378c:	0ec10c13          	add	s8,sp,236
    3790:	09810693          	add	a3,sp,152
    3794:	0007a603          	lw	a2,0(a5)
    3798:	000c0593          	mv	a1,s8
    379c:	00098513          	mv	a0,s3
    37a0:	530070ef          	jal	acd0 <_wcrtomb_r>
    37a4:	fff00793          	li	a5,-1
    37a8:	01012e83          	lw	t4,16(sp)
    37ac:	02012e03          	lw	t3,32(sp)
    37b0:	00050d13          	mv	s10,a0
    37b4:	00f51463          	bne	a0,a5,37bc <_vfprintf_r+0x1794>
    37b8:	4980106f          	j	4c50 <_vfprintf_r+0x2c28>
    37bc:	fff54813          	not	a6,a0
    37c0:	41f85813          	sra	a6,a6,0x1f
    37c4:	01057cb3          	and	s9,a0,a6
    37c8:	97cff06f          	j	2944 <_vfprintf_r+0x91c>
    37cc:	03412703          	lw	a4,52(sp)
    37d0:	03012783          	lw	a5,48(sp)
    37d4:	00700693          	li	a3,7
    37d8:	00e42023          	sw	a4,0(s0)
    37dc:	0a412703          	lw	a4,164(sp)
    37e0:	00f484b3          	add	s1,s1,a5
    37e4:	00f42223          	sw	a5,4(s0)
    37e8:	00170713          	add	a4,a4,1
    37ec:	0a912423          	sw	s1,168(sp)
    37f0:	0ae12223          	sw	a4,164(sp)
    37f4:	00840413          	add	s0,s0,8
    37f8:	a4e6d0e3          	bge	a3,a4,3238 <_vfprintf_r+0x1210>
    37fc:	00812583          	lw	a1,8(sp)
    3800:	0a010613          	add	a2,sp,160
    3804:	00098513          	mv	a0,s3
    3808:	02612223          	sw	t1,36(sp)
    380c:	03d12023          	sw	t4,32(sp)
    3810:	6d4010ef          	jal	4ee4 <__sprint_r>
    3814:	00050463          	beqz	a0,381c <_vfprintf_r+0x17f4>
    3818:	ce1fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    381c:	07c12d03          	lw	s10,124(sp)
    3820:	0a812483          	lw	s1,168(sp)
    3824:	02412303          	lw	t1,36(sp)
    3828:	02012e83          	lw	t4,32(sp)
    382c:	0ac10413          	add	s0,sp,172
    3830:	a09ff06f          	j	3238 <_vfprintf_r+0x1210>
    3834:	01412703          	lw	a4,20(sp)
    3838:	010ef793          	and	a5,t4,16
    383c:	00072d03          	lw	s10,0(a4)
    3840:	00470713          	add	a4,a4,4
    3844:	00e12a23          	sw	a4,20(sp)
    3848:	08079863          	bnez	a5,38d8 <_vfprintf_r+0x18b0>
    384c:	040ef793          	and	a5,t4,64
    3850:	08078063          	beqz	a5,38d0 <_vfprintf_r+0x18a8>
    3854:	010d1d13          	sll	s10,s10,0x10
    3858:	010d5d13          	srl	s10,s10,0x10
    385c:	00000c93          	li	s9,0
    3860:	e31ff06f          	j	3690 <_vfprintf_r+0x1668>
    3864:	00000d13          	li	s10,0
    3868:	15010c13          	add	s8,sp,336
    386c:	a2cff06f          	j	2a98 <_vfprintf_r+0xa70>
    3870:	00812583          	lw	a1,8(sp)
    3874:	0a010613          	add	a2,sp,160
    3878:	00098513          	mv	a0,s3
    387c:	03d12023          	sw	t4,32(sp)
    3880:	664010ef          	jal	4ee4 <__sprint_r>
    3884:	00050463          	beqz	a0,388c <_vfprintf_r+0x1864>
    3888:	c71fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    388c:	0a812483          	lw	s1,168(sp)
    3890:	0a412d03          	lw	s10,164(sp)
    3894:	02012e83          	lw	t4,32(sp)
    3898:	0ac10b13          	add	s6,sp,172
    389c:	f71fe06f          	j	280c <_vfprintf_r+0x7e4>
    38a0:	00812583          	lw	a1,8(sp)
    38a4:	0a010613          	add	a2,sp,160
    38a8:	00098513          	mv	a0,s3
    38ac:	03d12023          	sw	t4,32(sp)
    38b0:	634010ef          	jal	4ee4 <__sprint_r>
    38b4:	00050463          	beqz	a0,38bc <_vfprintf_r+0x1894>
    38b8:	c41fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    38bc:	0a812483          	lw	s1,168(sp)
    38c0:	0a412d03          	lw	s10,164(sp)
    38c4:	02012e83          	lw	t4,32(sp)
    38c8:	0ac10b13          	add	s6,sp,172
    38cc:	f71fe06f          	j	283c <_vfprintf_r+0x814>
    38d0:	200ef793          	and	a5,t4,512
    38d4:	76079663          	bnez	a5,4040 <_vfprintf_r+0x2018>
    38d8:	00000c93          	li	s9,0
    38dc:	db5ff06f          	j	3690 <_vfprintf_r+0x1668>
    38e0:	00000793          	li	a5,0
    38e4:	15010b13          	add	s6,sp,336
    38e8:	01212823          	sw	s2,16(sp)
    38ec:	00078913          	mv	s2,a5
    38f0:	00098793          	mv	a5,s3
    38f4:	04812823          	sw	s0,80(sp)
    38f8:	000b0993          	mv	s3,s6
    38fc:	03c12403          	lw	s0,60(sp)
    3900:	40067493          	and	s1,a2,1024
    3904:	0ff00a13          	li	s4,255
    3908:	03c12023          	sw	t3,32(sp)
    390c:	02c12223          	sw	a2,36(sp)
    3910:	04612223          	sw	t1,68(sp)
    3914:	00078b13          	mv	s6,a5
    3918:	0280006f          	j	3940 <_vfprintf_r+0x1918>
    391c:	00a00613          	li	a2,10
    3920:	00000693          	li	a3,0
    3924:	000d0513          	mv	a0,s10
    3928:	000c8593          	mv	a1,s9
    392c:	581070ef          	jal	b6ac <__udivdi3>
    3930:	6a0c8ee3          	beqz	s9,47ec <_vfprintf_r+0x27c4>
    3934:	00050d13          	mv	s10,a0
    3938:	00058c93          	mv	s9,a1
    393c:	000c0993          	mv	s3,s8
    3940:	00a00613          	li	a2,10
    3944:	00000693          	li	a3,0
    3948:	000d0513          	mv	a0,s10
    394c:	000c8593          	mv	a1,s9
    3950:	408080ef          	jal	bd58 <__umoddi3>
    3954:	03050513          	add	a0,a0,48
    3958:	fea98fa3          	sb	a0,-1(s3)
    395c:	fff98c13          	add	s8,s3,-1
    3960:	00190913          	add	s2,s2,1
    3964:	fa048ce3          	beqz	s1,391c <_vfprintf_r+0x18f4>
    3968:	00044783          	lbu	a5,0(s0)
    396c:	faf918e3          	bne	s2,a5,391c <_vfprintf_r+0x18f4>
    3970:	fb4906e3          	beq	s2,s4,391c <_vfprintf_r+0x18f4>
    3974:	560c9ae3          	bnez	s9,46e8 <_vfprintf_r+0x26c0>
    3978:	00900793          	li	a5,9
    397c:	57a7e6e3          	bltu	a5,s10,46e8 <_vfprintf_r+0x26c0>
    3980:	02412603          	lw	a2,36(sp)
    3984:	15010793          	add	a5,sp,336
    3988:	02812e23          	sw	s0,60(sp)
    398c:	01212c23          	sw	s2,24(sp)
    3990:	02012e03          	lw	t3,32(sp)
    3994:	01012903          	lw	s2,16(sp)
    3998:	04412303          	lw	t1,68(sp)
    399c:	05012403          	lw	s0,80(sp)
    39a0:	000b0993          	mv	s3,s6
    39a4:	41878d33          	sub	s10,a5,s8
    39a8:	00060e93          	mv	t4,a2
    39ac:	8ecff06f          	j	2a98 <_vfprintf_r+0xa70>
    39b0:	00812583          	lw	a1,8(sp)
    39b4:	0a010613          	add	a2,sp,160
    39b8:	00098513          	mv	a0,s3
    39bc:	04612e23          	sw	t1,92(sp)
    39c0:	05c12c23          	sw	t3,88(sp)
    39c4:	05d12a23          	sw	t4,84(sp)
    39c8:	05f12823          	sw	t6,80(sp)
    39cc:	04512223          	sw	t0,68(sp)
    39d0:	514010ef          	jal	4ee4 <__sprint_r>
    39d4:	00050463          	beqz	a0,39dc <_vfprintf_r+0x19b4>
    39d8:	b21fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    39dc:	07714603          	lbu	a2,119(sp)
    39e0:	0a812483          	lw	s1,168(sp)
    39e4:	05c12303          	lw	t1,92(sp)
    39e8:	05812e03          	lw	t3,88(sp)
    39ec:	05412e83          	lw	t4,84(sp)
    39f0:	05012f83          	lw	t6,80(sp)
    39f4:	04412283          	lw	t0,68(sp)
    39f8:	0ac10413          	add	s0,sp,172
    39fc:	88dfe06f          	j	2288 <_vfprintf_r+0x260>
    3a00:	02812883          	lw	a7,40(sp)
    3a04:	02c12703          	lw	a4,44(sp)
    3a08:	02612223          	sw	t1,36(sp)
    3a0c:	00088613          	mv	a2,a7
    3a10:	00088513          	mv	a0,a7
    3a14:	00070693          	mv	a3,a4
    3a18:	00070593          	mv	a1,a4
    3a1c:	03c12023          	sw	t3,32(sp)
    3a20:	01d12823          	sw	t4,16(sp)
    3a24:	62d0a0ef          	jal	e850 <__unorddf2>
    3a28:	01012e83          	lw	t4,16(sp)
    3a2c:	02012e03          	lw	t3,32(sp)
    3a30:	02412303          	lw	t1,36(sp)
    3a34:	00050463          	beqz	a0,3a3c <_vfprintf_r+0x1a14>
    3a38:	0e00106f          	j	4b18 <_vfprintf_r+0x2af0>
    3a3c:	06100713          	li	a4,97
    3a40:	08ee0263          	beq	t3,a4,3ac4 <_vfprintf_r+0x1a9c>
    3a44:	04100713          	li	a4,65
    3a48:	05800793          	li	a5,88
    3a4c:	06ee0e63          	beq	t3,a4,3ac8 <_vfprintf_r+0x1aa0>
    3a50:	fff00713          	li	a4,-1
    3a54:	00e31463          	bne	t1,a4,3a5c <_vfprintf_r+0x1a34>
    3a58:	01c0106f          	j	4a74 <_vfprintf_r+0x2a4c>
    3a5c:	fdfe7713          	and	a4,t3,-33
    3a60:	04700693          	li	a3,71
    3a64:	00012823          	sw	zero,16(sp)
    3a68:	00d71663          	bne	a4,a3,3a74 <_vfprintf_r+0x1a4c>
    3a6c:	00031463          	bnez	t1,3a74 <_vfprintf_r+0x1a4c>
    3a70:	00100313          	li	t1,1
    3a74:	100ee793          	or	a5,t4,256
    3a78:	00078b13          	mv	s6,a5
    3a7c:	02c12783          	lw	a5,44(sp)
    3a80:	04012223          	sw	zero,68(sp)
    3a84:	00078493          	mv	s1,a5
    3a88:	0007da63          	bgez	a5,3a9c <_vfprintf_r+0x1a74>
    3a8c:	800004b7          	lui	s1,0x80000
    3a90:	00f4c4b3          	xor	s1,s1,a5
    3a94:	02d00793          	li	a5,45
    3a98:	04f12223          	sw	a5,68(sp)
    3a9c:	fbfe0713          	add	a4,t3,-65
    3aa0:	02500693          	li	a3,37
    3aa4:	3ae6e463          	bltu	a3,a4,3e4c <_vfprintf_r+0x1e24>
    3aa8:	0000c697          	auipc	a3,0xc
    3aac:	c2c68693          	add	a3,a3,-980 # f6d4 <_ctype_+0x270>
    3ab0:	00271713          	sll	a4,a4,0x2
    3ab4:	00d70733          	add	a4,a4,a3
    3ab8:	00072703          	lw	a4,0(a4)
    3abc:	00d70733          	add	a4,a4,a3
    3ac0:	00070067          	jr	a4
    3ac4:	07800793          	li	a5,120
    3ac8:	03000713          	li	a4,48
    3acc:	06e10c23          	sb	a4,120(sp)
    3ad0:	06f10ca3          	sb	a5,121(sp)
    3ad4:	06300713          	li	a4,99
    3ad8:	00012823          	sw	zero,16(sp)
    3adc:	002eee93          	or	t4,t4,2
    3ae0:	0ec10c13          	add	s8,sp,236
    3ae4:	f86758e3          	bge	a4,t1,3a74 <_vfprintf_r+0x1a4c>
    3ae8:	00130593          	add	a1,t1,1
    3aec:	00098513          	mv	a0,s3
    3af0:	03c12023          	sw	t3,32(sp)
    3af4:	01d12c23          	sw	t4,24(sp)
    3af8:	00612823          	sw	t1,16(sp)
    3afc:	d35fd0ef          	jal	1830 <_malloc_r>
    3b00:	01012303          	lw	t1,16(sp)
    3b04:	01812e83          	lw	t4,24(sp)
    3b08:	02012e03          	lw	t3,32(sp)
    3b0c:	00050c13          	mv	s8,a0
    3b10:	00051463          	bnez	a0,3b18 <_vfprintf_r+0x1af0>
    3b14:	13c0106f          	j	4c50 <_vfprintf_r+0x2c28>
    3b18:	00a12823          	sw	a0,16(sp)
    3b1c:	f59ff06f          	j	3a74 <_vfprintf_r+0x1a4c>
    3b20:	00098513          	mv	a0,s3
    3b24:	1d0030ef          	jal	6cf4 <__sinit>
    3b28:	00c12783          	lw	a5,12(sp)
    3b2c:	d5cfe06f          	j	2088 <_vfprintf_r+0x60>
    3b30:	00812583          	lw	a1,8(sp)
    3b34:	0a010613          	add	a2,sp,160
    3b38:	00098513          	mv	a0,s3
    3b3c:	03d12023          	sw	t4,32(sp)
    3b40:	3a4010ef          	jal	4ee4 <__sprint_r>
    3b44:	00050463          	beqz	a0,3b4c <_vfprintf_r+0x1b24>
    3b48:	9b1fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    3b4c:	0a812483          	lw	s1,168(sp)
    3b50:	02012e83          	lw	t4,32(sp)
    3b54:	0ac10413          	add	s0,sp,172
    3b58:	9b0ff06f          	j	2d08 <_vfprintf_r+0xce0>
    3b5c:	00800613          	li	a2,8
    3b60:	00000593          	li	a1,0
    3b64:	09810513          	add	a0,sp,152
    3b68:	02612023          	sw	t1,32(sp)
    3b6c:	01c12a23          	sw	t3,20(sp)
    3b70:	01d12823          	sw	t4,16(sp)
    3b74:	09812223          	sw	s8,132(sp)
    3b78:	d5cfd0ef          	jal	10d4 <memset>
    3b7c:	02012303          	lw	t1,32(sp)
    3b80:	01012e83          	lw	t4,16(sp)
    3b84:	01412e03          	lw	t3,20(sp)
    3b88:	3a0340e3          	bltz	t1,4728 <_vfprintf_r+0x2700>
    3b8c:	00000d13          	li	s10,0
    3b90:	01212823          	sw	s2,16(sp)
    3b94:	000c0c93          	mv	s9,s8
    3b98:	fff00493          	li	s1,-1
    3b9c:	000b0c13          	mv	s8,s6
    3ba0:	000e8a13          	mv	s4,t4
    3ba4:	00040b13          	mv	s6,s0
    3ba8:	000d0913          	mv	s2,s10
    3bac:	00030413          	mv	s0,t1
    3bb0:	0300006f          	j	3be0 <_vfprintf_r+0x1bb8>
    3bb4:	09810693          	add	a3,sp,152
    3bb8:	0ec10593          	add	a1,sp,236
    3bbc:	00098513          	mv	a0,s3
    3bc0:	110070ef          	jal	acd0 <_wcrtomb_r>
    3bc4:	68950ae3          	beq	a0,s1,4a58 <_vfprintf_r+0x2a30>
    3bc8:	00a907b3          	add	a5,s2,a0
    3bcc:	02f44263          	blt	s0,a5,3bf0 <_vfprintf_r+0x1bc8>
    3bd0:	004d0d13          	add	s10,s10,4
    3bd4:	00879463          	bne	a5,s0,3bdc <_vfprintf_r+0x1bb4>
    3bd8:	7990006f          	j	4b70 <_vfprintf_r+0x2b48>
    3bdc:	00078913          	mv	s2,a5
    3be0:	08412783          	lw	a5,132(sp)
    3be4:	01a787b3          	add	a5,a5,s10
    3be8:	0007a603          	lw	a2,0(a5)
    3bec:	fc0614e3          	bnez	a2,3bb4 <_vfprintf_r+0x1b8c>
    3bf0:	00090d13          	mv	s10,s2
    3bf4:	01412e03          	lw	t3,20(sp)
    3bf8:	01012903          	lw	s2,16(sp)
    3bfc:	000b0413          	mv	s0,s6
    3c00:	000a0e93          	mv	t4,s4
    3c04:	000c0b13          	mv	s6,s8
    3c08:	000c8c13          	mv	s8,s9
    3c0c:	340d0ce3          	beqz	s10,4764 <_vfprintf_r+0x273c>
    3c10:	06300793          	li	a5,99
    3c14:	59a7dee3          	bge	a5,s10,49b0 <_vfprintf_r+0x2988>
    3c18:	001d0593          	add	a1,s10,1
    3c1c:	00098513          	mv	a0,s3
    3c20:	01c12a23          	sw	t3,20(sp)
    3c24:	01d12823          	sw	t4,16(sp)
    3c28:	c09fd0ef          	jal	1830 <_malloc_r>
    3c2c:	01012e83          	lw	t4,16(sp)
    3c30:	01412e03          	lw	t3,20(sp)
    3c34:	00050c13          	mv	s8,a0
    3c38:	620500e3          	beqz	a0,4a58 <_vfprintf_r+0x2a30>
    3c3c:	00a12823          	sw	a0,16(sp)
    3c40:	00800613          	li	a2,8
    3c44:	00000593          	li	a1,0
    3c48:	09810513          	add	a0,sp,152
    3c4c:	03c12023          	sw	t3,32(sp)
    3c50:	01d12a23          	sw	t4,20(sp)
    3c54:	c80fd0ef          	jal	10d4 <memset>
    3c58:	09810713          	add	a4,sp,152
    3c5c:	000d0693          	mv	a3,s10
    3c60:	08410613          	add	a2,sp,132
    3c64:	000c0593          	mv	a1,s8
    3c68:	00098513          	mv	a0,s3
    3c6c:	0f0070ef          	jal	ad5c <_wcsrtombs_r>
    3c70:	01412e83          	lw	t4,20(sp)
    3c74:	02012e03          	lw	t3,32(sp)
    3c78:	00ad0463          	beq	s10,a0,3c80 <_vfprintf_r+0x1c58>
    3c7c:	0240106f          	j	4ca0 <_vfprintf_r+0x2c78>
    3c80:	01ac0733          	add	a4,s8,s10
    3c84:	00070023          	sb	zero,0(a4)
    3c88:	07714603          	lbu	a2,119(sp)
    3c8c:	fffd4813          	not	a6,s10
    3c90:	41f85813          	sra	a6,a6,0x1f
    3c94:	01612a23          	sw	s6,20(sp)
    3c98:	02012223          	sw	zero,36(sp)
    3c9c:	02012023          	sw	zero,32(sp)
    3ca0:	010d7cb3          	and	s9,s10,a6
    3ca4:	00000313          	li	t1,0
    3ca8:	00000a13          	li	s4,0
    3cac:	00061463          	bnez	a2,3cb4 <_vfprintf_r+0x1c8c>
    3cb0:	db8fe06f          	j	2268 <_vfprintf_r+0x240>
    3cb4:	9d5fe06f          	j	2688 <_vfprintf_r+0x660>
    3cb8:	00048e93          	mv	t4,s1
    3cbc:	000a0293          	mv	t0,s4
    3cc0:	00070493          	mv	s1,a4
    3cc4:	01a484b3          	add	s1,s1,s10
    3cc8:	00178793          	add	a5,a5,1
    3ccc:	00542023          	sw	t0,0(s0)
    3cd0:	e48fe06f          	j	2318 <_vfprintf_r+0x2f0>
    3cd4:	01412783          	lw	a5,20(sp)
    3cd8:	00c12703          	lw	a4,12(sp)
    3cdc:	0007a783          	lw	a5,0(a5)
    3ce0:	00e7a023          	sw	a4,0(a5)
    3ce4:	fadfe06f          	j	2c90 <_vfprintf_r+0xc68>
    3ce8:	02012e83          	lw	t4,32(sp)
    3cec:	00040293          	mv	t0,s0
    3cf0:	000a0413          	mv	s0,s4
    3cf4:	008484b3          	add	s1,s1,s0
    3cf8:	001d0d13          	add	s10,s10,1
    3cfc:	005b2023          	sw	t0,0(s6)
    3d00:	b7dfe06f          	j	287c <_vfprintf_r+0x854>
    3d04:	03412703          	lw	a4,52(sp)
    3d08:	03012783          	lw	a5,48(sp)
    3d0c:	00700613          	li	a2,7
    3d10:	00e42023          	sw	a4,0(s0)
    3d14:	0a412703          	lw	a4,164(sp)
    3d18:	009784b3          	add	s1,a5,s1
    3d1c:	00f42223          	sw	a5,4(s0)
    3d20:	00170713          	add	a4,a4,1
    3d24:	0a912423          	sw	s1,168(sp)
    3d28:	0ae12223          	sw	a4,164(sp)
    3d2c:	00840413          	add	s0,s0,8
    3d30:	3ae64463          	blt	a2,a4,40d8 <_vfprintf_r+0x20b0>
    3d34:	3e06cee3          	bltz	a3,4930 <_vfprintf_r+0x2908>
    3d38:	01812783          	lw	a5,24(sp)
    3d3c:	00170713          	add	a4,a4,1
    3d40:	01842023          	sw	s8,0(s0)
    3d44:	009784b3          	add	s1,a5,s1
    3d48:	00f42223          	sw	a5,4(s0)
    3d4c:	0a912423          	sw	s1,168(sp)
    3d50:	0ae12223          	sw	a4,164(sp)
    3d54:	00700793          	li	a5,7
    3d58:	00e7c463          	blt	a5,a4,3d60 <_vfprintf_r+0x1d38>
    3d5c:	dd0fe06f          	j	232c <_vfprintf_r+0x304>
    3d60:	b61fe06f          	j	28c0 <_vfprintf_r+0x898>
    3d64:	01000613          	li	a2,16
    3d68:	0a412683          	lw	a3,164(sp)
    3d6c:	0000c297          	auipc	t0,0xc
    3d70:	a0028293          	add	t0,t0,-1536 # f76c <zeroes.0>
    3d74:	09665463          	bge	a2,s6,3dfc <_vfprintf_r+0x1dd4>
    3d78:	00040793          	mv	a5,s0
    3d7c:	00048713          	mv	a4,s1
    3d80:	00812403          	lw	s0,8(sp)
    3d84:	01000893          	li	a7,16
    3d88:	00700d13          	li	s10,7
    3d8c:	05d12223          	sw	t4,68(sp)
    3d90:	00028493          	mv	s1,t0
    3d94:	00c0006f          	j	3da0 <_vfprintf_r+0x1d78>
    3d98:	ff0b0b13          	add	s6,s6,-16
    3d9c:	0568d863          	bge	a7,s6,3dec <_vfprintf_r+0x1dc4>
    3da0:	01070713          	add	a4,a4,16
    3da4:	00168693          	add	a3,a3,1
    3da8:	0097a023          	sw	s1,0(a5)
    3dac:	0117a223          	sw	a7,4(a5)
    3db0:	0ae12423          	sw	a4,168(sp)
    3db4:	0ad12223          	sw	a3,164(sp)
    3db8:	00878793          	add	a5,a5,8
    3dbc:	fcdd5ee3          	bge	s10,a3,3d98 <_vfprintf_r+0x1d70>
    3dc0:	0a010613          	add	a2,sp,160
    3dc4:	00040593          	mv	a1,s0
    3dc8:	00098513          	mv	a0,s3
    3dcc:	118010ef          	jal	4ee4 <__sprint_r>
    3dd0:	00050463          	beqz	a0,3dd8 <_vfprintf_r+0x1db0>
    3dd4:	f24fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    3dd8:	0a812703          	lw	a4,168(sp)
    3ddc:	0a412683          	lw	a3,164(sp)
    3de0:	0ac10793          	add	a5,sp,172
    3de4:	01000893          	li	a7,16
    3de8:	fb1ff06f          	j	3d98 <_vfprintf_r+0x1d70>
    3dec:	04412e83          	lw	t4,68(sp)
    3df0:	00048293          	mv	t0,s1
    3df4:	00078413          	mv	s0,a5
    3df8:	00070493          	mv	s1,a4
    3dfc:	016484b3          	add	s1,s1,s6
    3e00:	00168693          	add	a3,a3,1
    3e04:	00542023          	sw	t0,0(s0)
    3e08:	01642223          	sw	s6,4(s0)
    3e0c:	0a912423          	sw	s1,168(sp)
    3e10:	0ad12223          	sw	a3,164(sp)
    3e14:	00700713          	li	a4,7
    3e18:	00840413          	add	s0,s0,8
    3e1c:	bed75c63          	bge	a4,a3,3214 <_vfprintf_r+0x11ec>
    3e20:	00812583          	lw	a1,8(sp)
    3e24:	0a010613          	add	a2,sp,160
    3e28:	00098513          	mv	a0,s3
    3e2c:	05d12223          	sw	t4,68(sp)
    3e30:	0b4010ef          	jal	4ee4 <__sprint_r>
    3e34:	00050463          	beqz	a0,3e3c <_vfprintf_r+0x1e14>
    3e38:	ec0fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    3e3c:	0a812483          	lw	s1,168(sp)
    3e40:	04412e83          	lw	t4,68(sp)
    3e44:	0ac10413          	add	s0,sp,172
    3e48:	bccff06f          	j	3214 <_vfprintf_r+0x11ec>
    3e4c:	02812703          	lw	a4,40(sp)
    3e50:	09810893          	add	a7,sp,152
    3e54:	08410813          	add	a6,sp,132
    3e58:	00070513          	mv	a0,a4
    3e5c:	00050593          	mv	a1,a0
    3e60:	00030713          	mv	a4,t1
    3e64:	07c10793          	add	a5,sp,124
    3e68:	00200693          	li	a3,2
    3e6c:	00048613          	mv	a2,s1
    3e70:	00098513          	mv	a0,s3
    3e74:	03c12223          	sw	t3,36(sp)
    3e78:	03d12023          	sw	t4,32(sp)
    3e7c:	00612c23          	sw	t1,24(sp)
    3e80:	3a8040ef          	jal	8228 <_dtoa_r>
    3e84:	02012e83          	lw	t4,32(sp)
    3e88:	01812303          	lw	t1,24(sp)
    3e8c:	02412e03          	lw	t3,36(sp)
    3e90:	001ef713          	and	a4,t4,1
    3e94:	00050c13          	mv	s8,a0
    3e98:	1a0712e3          	bnez	a4,483c <_vfprintf_r+0x2814>
    3e9c:	09812783          	lw	a5,152(sp)
    3ea0:	07c12a03          	lw	s4,124(sp)
    3ea4:	40a787b3          	sub	a5,a5,a0
    3ea8:	00f12c23          	sw	a5,24(sp)
    3eac:	ffd00713          	li	a4,-3
    3eb0:	00ea4463          	blt	s4,a4,3eb8 <_vfprintf_r+0x1e90>
    3eb4:	5b435663          	bge	t1,s4,4460 <_vfprintf_r+0x2438>
    3eb8:	ffee0e13          	add	t3,t3,-2
    3ebc:	fffa0d13          	add	s10,s4,-1
    3ec0:	07a12e23          	sw	s10,124(sp)
    3ec4:	0ffe7693          	zext.b	a3,t3
    3ec8:	00000613          	li	a2,0
    3ecc:	08d10423          	sb	a3,136(sp)
    3ed0:	02b00693          	li	a3,43
    3ed4:	000d5863          	bgez	s10,3ee4 <_vfprintf_r+0x1ebc>
    3ed8:	00100713          	li	a4,1
    3edc:	41470d33          	sub	s10,a4,s4
    3ee0:	02d00693          	li	a3,45
    3ee4:	08d104a3          	sb	a3,137(sp)
    3ee8:	00900693          	li	a3,9
    3eec:	33a6d8e3          	bge	a3,s10,4a1c <_vfprintf_r+0x29f4>
    3ef0:	000c0793          	mv	a5,s8
    3ef4:	09f10493          	add	s1,sp,159
    3ef8:	03212023          	sw	s2,32(sp)
    3efc:	00040c13          	mv	s8,s0
    3f00:	06300a13          	li	s4,99
    3f04:	000d0413          	mv	s0,s10
    3f08:	03d12223          	sw	t4,36(sp)
    3f0c:	05c12023          	sw	t3,64(sp)
    3f10:	00048913          	mv	s2,s1
    3f14:	00098c93          	mv	s9,s3
    3f18:	00078d13          	mv	s10,a5
    3f1c:	00a00593          	li	a1,10
    3f20:	00040513          	mv	a0,s0
    3f24:	09c0b0ef          	jal	efc0 <__modsi3>
    3f28:	03050713          	add	a4,a0,48
    3f2c:	00090b13          	mv	s6,s2
    3f30:	00040513          	mv	a0,s0
    3f34:	feeb0fa3          	sb	a4,-1(s6)
    3f38:	00a00593          	li	a1,10
    3f3c:	00040993          	mv	s3,s0
    3f40:	7fd0a0ef          	jal	ef3c <__divsi3>
    3f44:	fff90913          	add	s2,s2,-1
    3f48:	00050413          	mv	s0,a0
    3f4c:	fd3a48e3          	blt	s4,s3,3f1c <_vfprintf_r+0x1ef4>
    3f50:	000c8993          	mv	s3,s9
    3f54:	03050713          	add	a4,a0,48
    3f58:	00090c93          	mv	s9,s2
    3f5c:	ffeb0693          	add	a3,s6,-2
    3f60:	feec8fa3          	sb	a4,-1(s9)
    3f64:	000c0413          	mv	s0,s8
    3f68:	02412e83          	lw	t4,36(sp)
    3f6c:	04012e03          	lw	t3,64(sp)
    3f70:	02012903          	lw	s2,32(sp)
    3f74:	000d0c13          	mv	s8,s10
    3f78:	4c96f6e3          	bgeu	a3,s1,4c44 <_vfprintf_r+0x2c1c>
    3f7c:	08a10713          	add	a4,sp,138
    3f80:	0006c783          	lbu	a5,0(a3)
    3f84:	00168693          	add	a3,a3,1
    3f88:	00170713          	add	a4,a4,1
    3f8c:	fef70fa3          	sb	a5,-1(a4)
    3f90:	fe9698e3          	bne	a3,s1,3f80 <_vfprintf_r+0x1f58>
    3f94:	15010793          	add	a5,sp,336
    3f98:	41678633          	sub	a2,a5,s6
    3f9c:	f5360793          	add	a5,a2,-173
    3fa0:	04f12023          	sw	a5,64(sp)
    3fa4:	01812783          	lw	a5,24(sp)
    3fa8:	04012683          	lw	a3,64(sp)
    3fac:	00100713          	li	a4,1
    3fb0:	00d78d33          	add	s10,a5,a3
    3fb4:	28f75ce3          	bge	a4,a5,4a4c <_vfprintf_r+0x2a24>
    3fb8:	03012783          	lw	a5,48(sp)
    3fbc:	00fd0d33          	add	s10,s10,a5
    3fc0:	fffd4813          	not	a6,s10
    3fc4:	bffeff13          	and	t5,t4,-1025
    3fc8:	41f85813          	sra	a6,a6,0x1f
    3fcc:	100f6e93          	or	t4,t5,256
    3fd0:	010d7cb3          	and	s9,s10,a6
    3fd4:	02012223          	sw	zero,36(sp)
    3fd8:	02012023          	sw	zero,32(sp)
    3fdc:	00000a13          	li	s4,0
    3fe0:	04412783          	lw	a5,68(sp)
    3fe4:	46079263          	bnez	a5,4448 <_vfprintf_r+0x2420>
    3fe8:	07714603          	lbu	a2,119(sp)
    3fec:	00000313          	li	t1,0
    3ff0:	00061463          	bnez	a2,3ff8 <_vfprintf_r+0x1fd0>
    3ff4:	a74fe06f          	j	2268 <_vfprintf_r+0x240>
    3ff8:	e90fe06f          	j	2688 <_vfprintf_r+0x660>
    3ffc:	00812583          	lw	a1,8(sp)
    4000:	0a010613          	add	a2,sp,160
    4004:	00098513          	mv	a0,s3
    4008:	03d12023          	sw	t4,32(sp)
    400c:	6d9000ef          	jal	4ee4 <__sprint_r>
    4010:	00050463          	beqz	a0,4018 <_vfprintf_r+0x1ff0>
    4014:	ce4fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    4018:	07c12683          	lw	a3,124(sp)
    401c:	0a812483          	lw	s1,168(sp)
    4020:	02012e83          	lw	t4,32(sp)
    4024:	0ac10413          	add	s0,sp,172
    4028:	ce0ff06f          	j	3508 <_vfprintf_r+0x14e0>
    402c:	00600c93          	li	s9,6
    4030:	f14ff06f          	j	3744 <_vfprintf_r+0x171c>
    4034:	0ffd7d13          	zext.b	s10,s10
    4038:	00000c93          	li	s9,0
    403c:	bd5fe06f          	j	2c10 <_vfprintf_r+0xbe8>
    4040:	0ffd7d13          	zext.b	s10,s10
    4044:	00000c93          	li	s9,0
    4048:	e48ff06f          	j	3690 <_vfprintf_r+0x1668>
    404c:	018d1d13          	sll	s10,s10,0x18
    4050:	418d5d13          	sra	s10,s10,0x18
    4054:	41fd5c93          	sra	s9,s10,0x1f
    4058:	000c8793          	mv	a5,s9
    405c:	b39fe06f          	j	2b94 <_vfprintf_r+0xb6c>
    4060:	01412783          	lw	a5,20(sp)
    4064:	00c12703          	lw	a4,12(sp)
    4068:	0007a783          	lw	a5,0(a5)
    406c:	00e79023          	sh	a4,0(a5)
    4070:	c21fe06f          	j	2c90 <_vfprintf_r+0xc68>
    4074:	000c0513          	mv	a0,s8
    4078:	05d12223          	sw	t4,68(sp)
    407c:	ad8fd0ef          	jal	1354 <strlen>
    4080:	07714603          	lbu	a2,119(sp)
    4084:	fff54813          	not	a6,a0
    4088:	41f85813          	sra	a6,a6,0x1f
    408c:	01612a23          	sw	s6,20(sp)
    4090:	02012223          	sw	zero,36(sp)
    4094:	02012023          	sw	zero,32(sp)
    4098:	00012823          	sw	zero,16(sp)
    409c:	04412e83          	lw	t4,68(sp)
    40a0:	00050d13          	mv	s10,a0
    40a4:	01057cb3          	and	s9,a0,a6
    40a8:	00000313          	li	t1,0
    40ac:	07300e13          	li	t3,115
    40b0:	00061463          	bnez	a2,40b8 <_vfprintf_r+0x2090>
    40b4:	9b4fe06f          	j	2268 <_vfprintf_r+0x240>
    40b8:	dd0fe06f          	j	2688 <_vfprintf_r+0x660>
    40bc:	00812583          	lw	a1,8(sp)
    40c0:	0a010613          	add	a2,sp,160
    40c4:	00098513          	mv	a0,s3
    40c8:	61d000ef          	jal	4ee4 <__sprint_r>
    40cc:	00051463          	bnez	a0,40d4 <_vfprintf_r+0x20ac>
    40d0:	be8fe06f          	j	24b8 <_vfprintf_r+0x490>
    40d4:	c38fe06f          	j	250c <_vfprintf_r+0x4e4>
    40d8:	00812583          	lw	a1,8(sp)
    40dc:	0a010613          	add	a2,sp,160
    40e0:	00098513          	mv	a0,s3
    40e4:	03d12023          	sw	t4,32(sp)
    40e8:	5fd000ef          	jal	4ee4 <__sprint_r>
    40ec:	00050463          	beqz	a0,40f4 <_vfprintf_r+0x20cc>
    40f0:	c08fe06f          	j	24f8 <_vfprintf_r+0x4d0>
    40f4:	07c12683          	lw	a3,124(sp)
    40f8:	0a812483          	lw	s1,168(sp)
    40fc:	0a412703          	lw	a4,164(sp)
    4100:	02012e83          	lw	t4,32(sp)
    4104:	0ac10413          	add	s0,sp,172
    4108:	c2dff06f          	j	3d34 <_vfprintf_r+0x1d0c>
    410c:	05862503          	lw	a0,88(a2)
    4110:	00f12623          	sw	a5,12(sp)
    4114:	fbdfc0ef          	jal	10d0 <__retarget_lock_release_recursive>
    4118:	00c12783          	lw	a5,12(sp)
    411c:	ab8fe06f          	j	23d4 <_vfprintf_r+0x3ac>
    4120:	00130a13          	add	s4,t1,1
    4124:	00200693          	li	a3,2
    4128:	02812703          	lw	a4,40(sp)
    412c:	09810893          	add	a7,sp,152
    4130:	08410813          	add	a6,sp,132
    4134:	00070513          	mv	a0,a4
    4138:	00050593          	mv	a1,a0
    413c:	000a0713          	mv	a4,s4
    4140:	07c10793          	add	a5,sp,124
    4144:	00048613          	mv	a2,s1
    4148:	00098513          	mv	a0,s3
    414c:	02612223          	sw	t1,36(sp)
    4150:	03c12023          	sw	t3,32(sp)
    4154:	01d12c23          	sw	t4,24(sp)
    4158:	0d0040ef          	jal	8228 <_dtoa_r>
    415c:	02012e03          	lw	t3,32(sp)
    4160:	04600693          	li	a3,70
    4164:	01812e83          	lw	t4,24(sp)
    4168:	fdfe7d13          	and	s10,t3,-33
    416c:	02412303          	lw	t1,36(sp)
    4170:	00050c13          	mv	s8,a0
    4174:	01450733          	add	a4,a0,s4
    4178:	34dd14e3          	bne	s10,a3,4cc0 <_vfprintf_r+0x2c98>
    417c:	000c4603          	lbu	a2,0(s8)
    4180:	03000693          	li	a3,48
    4184:	6cd60263          	beq	a2,a3,4848 <_vfprintf_r+0x2820>
    4188:	07c12683          	lw	a3,124(sp)
    418c:	00d70733          	add	a4,a4,a3
    4190:	02812683          	lw	a3,40(sp)
    4194:	00048593          	mv	a1,s1
    4198:	00000613          	li	a2,0
    419c:	00068513          	mv	a0,a3
    41a0:	00000693          	li	a3,0
    41a4:	04e12823          	sw	a4,80(sp)
    41a8:	02612223          	sw	t1,36(sp)
    41ac:	03c12023          	sw	t3,32(sp)
    41b0:	01d12c23          	sw	t4,24(sp)
    41b4:	370090ef          	jal	d524 <__eqdf2>
    41b8:	01812e83          	lw	t4,24(sp)
    41bc:	02012e03          	lw	t3,32(sp)
    41c0:	02412303          	lw	t1,36(sp)
    41c4:	05012703          	lw	a4,80(sp)
    41c8:	62050863          	beqz	a0,47f8 <_vfprintf_r+0x27d0>
    41cc:	09812783          	lw	a5,152(sp)
    41d0:	00e7fe63          	bgeu	a5,a4,41ec <_vfprintf_r+0x21c4>
    41d4:	03000613          	li	a2,48
    41d8:	00178693          	add	a3,a5,1
    41dc:	08d12c23          	sw	a3,152(sp)
    41e0:	00c78023          	sb	a2,0(a5)
    41e4:	09812783          	lw	a5,152(sp)
    41e8:	fee7e8e3          	bltu	a5,a4,41d8 <_vfprintf_r+0x21b0>
    41ec:	07c12a03          	lw	s4,124(sp)
    41f0:	418787b3          	sub	a5,a5,s8
    41f4:	04700713          	li	a4,71
    41f8:	00f12c23          	sw	a5,24(sp)
    41fc:	caed08e3          	beq	s10,a4,3eac <_vfprintf_r+0x1e84>
    4200:	04600713          	li	a4,70
    4204:	68ed0863          	beq	s10,a4,4894 <_vfprintf_r+0x286c>
    4208:	fffa0d13          	add	s10,s4,-1
    420c:	cb5ff06f          	j	3ec0 <_vfprintf_r+0x1e98>
    4210:	02812703          	lw	a4,40(sp)
    4214:	07c10613          	add	a2,sp,124
    4218:	00048593          	mv	a1,s1
    421c:	00070513          	mv	a0,a4
    4220:	02612223          	sw	t1,36(sp)
    4224:	03c12023          	sw	t3,32(sp)
    4228:	01d12c23          	sw	t4,24(sp)
    422c:	4e9030ef          	jal	7f14 <frexp>
    4230:	7fffc717          	auipc	a4,0x7fffc
    4234:	47870713          	add	a4,a4,1144 # 800006a8 <__global_locale+0x174>
    4238:	00072603          	lw	a2,0(a4)
    423c:	00472683          	lw	a3,4(a4)
    4240:	578090ef          	jal	d7b8 <__muldf3>
    4244:	00000613          	li	a2,0
    4248:	00000693          	li	a3,0
    424c:	00050a13          	mv	s4,a0
    4250:	00058d13          	mv	s10,a1
    4254:	2d0090ef          	jal	d524 <__eqdf2>
    4258:	01812e83          	lw	t4,24(sp)
    425c:	02012e03          	lw	t3,32(sp)
    4260:	02412303          	lw	t1,36(sp)
    4264:	00051663          	bnez	a0,4270 <_vfprintf_r+0x2248>
    4268:	00100713          	li	a4,1
    426c:	06e12e23          	sw	a4,124(sp)
    4270:	0000b797          	auipc	a5,0xb
    4274:	02878793          	add	a5,a5,40 # f298 <__fini_array_end+0x220>
    4278:	06100713          	li	a4,97
    427c:	02f12023          	sw	a5,32(sp)
    4280:	00ee1863          	bne	t3,a4,4290 <_vfprintf_r+0x2268>
    4284:	0000b797          	auipc	a5,0xb
    4288:	00078793          	mv	a5,a5
    428c:	02f12023          	sw	a5,32(sp)
    4290:	7fffc717          	auipc	a4,0x7fffc
    4294:	42070713          	add	a4,a4,1056 # 800006b0 <__global_locale+0x17c>
    4298:	00072783          	lw	a5,0(a4)
    429c:	00472803          	lw	a6,4(a4)
    42a0:	000c0493          	mv	s1,s8
    42a4:	00f12c23          	sw	a5,24(sp)
    42a8:	000d0793          	mv	a5,s10
    42ac:	03212223          	sw	s2,36(sp)
    42b0:	000c0d13          	mv	s10,s8
    42b4:	02012903          	lw	s2,32(sp)
    42b8:	00098c13          	mv	s8,s3
    42bc:	01012e23          	sw	a6,28(sp)
    42c0:	fff30b13          	add	s6,t1,-1
    42c4:	fff00c93          	li	s9,-1
    42c8:	05d12023          	sw	t4,64(sp)
    42cc:	05c12823          	sw	t3,80(sp)
    42d0:	04812a23          	sw	s0,84(sp)
    42d4:	00078993          	mv	s3,a5
    42d8:	01c0006f          	j	42f4 <_vfprintf_r+0x22cc>
    42dc:	00000613          	li	a2,0
    42e0:	00000693          	li	a3,0
    42e4:	fffb0413          	add	s0,s6,-1
    42e8:	23c090ef          	jal	d524 <__eqdf2>
    42ec:	0a0504e3          	beqz	a0,4b94 <_vfprintf_r+0x2b6c>
    42f0:	00040b13          	mv	s6,s0
    42f4:	01812603          	lw	a2,24(sp)
    42f8:	01c12683          	lw	a3,28(sp)
    42fc:	000a0513          	mv	a0,s4
    4300:	00098593          	mv	a1,s3
    4304:	4b4090ef          	jal	d7b8 <__muldf3>
    4308:	00058a13          	mv	s4,a1
    430c:	00050993          	mv	s3,a0
    4310:	5940a0ef          	jal	e8a4 <__fixdfsi>
    4314:	00050413          	mv	s0,a0
    4318:	6100a0ef          	jal	e928 <__floatsidf>
    431c:	00050613          	mv	a2,a0
    4320:	00058693          	mv	a3,a1
    4324:	00098513          	mv	a0,s3
    4328:	000a0593          	mv	a1,s4
    432c:	41d090ef          	jal	df48 <__subdf3>
    4330:	00890733          	add	a4,s2,s0
    4334:	00074703          	lbu	a4,0(a4)
    4338:	00048813          	mv	a6,s1
    433c:	00050a13          	mv	s4,a0
    4340:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4344:	00058993          	mv	s3,a1
    4348:	00148493          	add	s1,s1,1
    434c:	f99b18e3          	bne	s6,s9,42dc <_vfprintf_r+0x22b4>
    4350:	7fffc697          	auipc	a3,0x7fffc
    4354:	36868693          	add	a3,a3,872 # 800006b8 <__global_locale+0x184>
    4358:	0006a303          	lw	t1,0(a3)
    435c:	0046a383          	lw	t2,4(a3)
    4360:	05012e03          	lw	t3,80(sp)
    4364:	00030613          	mv	a2,t1
    4368:	00038693          	mv	a3,t2
    436c:	01012c23          	sw	a6,24(sp)
    4370:	02412903          	lw	s2,36(sp)
    4374:	000c0993          	mv	s3,s8
    4378:	03c12223          	sw	t3,36(sp)
    437c:	000d0c13          	mv	s8,s10
    4380:	00058d13          	mv	s10,a1
    4384:	22c090ef          	jal	d5b0 <__gedf2>
    4388:	7fffc797          	auipc	a5,0x7fffc
    438c:	33078793          	add	a5,a5,816 # 800006b8 <__global_locale+0x184>
    4390:	00040b13          	mv	s6,s0
    4394:	0007a303          	lw	t1,0(a5)
    4398:	05412403          	lw	s0,84(sp)
    439c:	0047a383          	lw	t2,4(a5)
    43a0:	01812803          	lw	a6,24(sp)
    43a4:	02412e03          	lw	t3,36(sp)
    43a8:	04012e83          	lw	t4,64(sp)
    43ac:	0aa05ce3          	blez	a0,4c64 <_vfprintf_r+0x2c3c>
    43b0:	02012783          	lw	a5,32(sp)
    43b4:	09012c23          	sw	a6,152(sp)
    43b8:	fff4c603          	lbu	a2,-1(s1)
    43bc:	00f7c583          	lbu	a1,15(a5)
    43c0:	00048693          	mv	a3,s1
    43c4:	02b61063          	bne	a2,a1,43e4 <_vfprintf_r+0x23bc>
    43c8:	03000513          	li	a0,48
    43cc:	fea68fa3          	sb	a0,-1(a3)
    43d0:	09812683          	lw	a3,152(sp)
    43d4:	fff68793          	add	a5,a3,-1
    43d8:	08f12c23          	sw	a5,152(sp)
    43dc:	fff6c603          	lbu	a2,-1(a3)
    43e0:	feb606e3          	beq	a2,a1,43cc <_vfprintf_r+0x23a4>
    43e4:	00160593          	add	a1,a2,1
    43e8:	03900513          	li	a0,57
    43ec:	0ff5f593          	zext.b	a1,a1
    43f0:	04a60463          	beq	a2,a0,4438 <_vfprintf_r+0x2410>
    43f4:	feb68fa3          	sb	a1,-1(a3)
    43f8:	00048793          	mv	a5,s1
    43fc:	07c12a03          	lw	s4,124(sp)
    4400:	418787b3          	sub	a5,a5,s8
    4404:	06100613          	li	a2,97
    4408:	fffa0d13          	add	s10,s4,-1
    440c:	00f12c23          	sw	a5,24(sp)
    4410:	07a12e23          	sw	s10,124(sp)
    4414:	07000693          	li	a3,112
    4418:	00ce0663          	beq	t3,a2,4424 <_vfprintf_r+0x23fc>
    441c:	05000693          	li	a3,80
    4420:	04100e13          	li	t3,65
    4424:	00100613          	li	a2,1
    4428:	aa5ff06f          	j	3ecc <_vfprintf_r+0x1ea4>
    442c:	00030a13          	mv	s4,t1
    4430:	00300693          	li	a3,3
    4434:	cf5ff06f          	j	4128 <_vfprintf_r+0x2100>
    4438:	02012783          	lw	a5,32(sp)
    443c:	00a7c583          	lbu	a1,10(a5)
    4440:	feb68fa3          	sb	a1,-1(a3)
    4444:	fb5ff06f          	j	43f8 <_vfprintf_r+0x23d0>
    4448:	02d00713          	li	a4,45
    444c:	06e10ba3          	sb	a4,119(sp)
    4450:	02d00613          	li	a2,45
    4454:	00000313          	li	t1,0
    4458:	001c8c93          	add	s9,s9,1
    445c:	e0dfd06f          	j	2268 <_vfprintf_r+0x240>
    4460:	01812783          	lw	a5,24(sp)
    4464:	46fa4063          	blt	s4,a5,48c4 <_vfprintf_r+0x289c>
    4468:	001ef713          	and	a4,t4,1
    446c:	000a0d13          	mv	s10,s4
    4470:	00070663          	beqz	a4,447c <_vfprintf_r+0x2454>
    4474:	03012783          	lw	a5,48(sp)
    4478:	00fa0d33          	add	s10,s4,a5
    447c:	400eff13          	and	t5,t4,1024
    4480:	000f0463          	beqz	t5,4488 <_vfprintf_r+0x2460>
    4484:	5f404e63          	bgtz	s4,4a80 <_vfprintf_r+0x2a58>
    4488:	fffd4813          	not	a6,s10
    448c:	41f85813          	sra	a6,a6,0x1f
    4490:	010d7cb3          	and	s9,s10,a6
    4494:	06700e13          	li	t3,103
    4498:	000b0e93          	mv	t4,s6
    449c:	02012223          	sw	zero,36(sp)
    44a0:	02012023          	sw	zero,32(sp)
    44a4:	b3dff06f          	j	3fe0 <_vfprintf_r+0x1fb8>
    44a8:	02d00793          	li	a5,45
    44ac:	06f10ba3          	sb	a5,119(sp)
    44b0:	02d00613          	li	a2,45
    44b4:	998fe06f          	j	264c <_vfprintf_r+0x624>
    44b8:	01812783          	lw	a5,24(sp)
    44bc:	02012a03          	lw	s4,32(sp)
    44c0:	05212823          	sw	s2,80(sp)
    44c4:	00fc07b3          	add	a5,s8,a5
    44c8:	05712c23          	sw	s7,88(sp)
    44cc:	05912e23          	sw	s9,92(sp)
    44d0:	00040713          	mv	a4,s0
    44d4:	04f12223          	sw	a5,68(sp)
    44d8:	02412403          	lw	s0,36(sp)
    44dc:	05d12a23          	sw	t4,84(sp)
    44e0:	03812223          	sw	s8,36(sp)
    44e4:	03c12b83          	lw	s7,60(sp)
    44e8:	04c12c83          	lw	s9,76(sp)
    44ec:	00812903          	lw	s2,8(sp)
    44f0:	00700693          	li	a3,7
    44f4:	01000d13          	li	s10,16
    44f8:	0000bb17          	auipc	s6,0xb
    44fc:	274b0b13          	add	s6,s6,628 # f76c <zeroes.0>
    4500:	00048613          	mv	a2,s1
    4504:	00030c13          	mv	s8,t1
    4508:	09405863          	blez	s4,4598 <_vfprintf_r+0x2570>
    450c:	16805e63          	blez	s0,4688 <_vfprintf_r+0x2660>
    4510:	fff40413          	add	s0,s0,-1
    4514:	04812783          	lw	a5,72(sp)
    4518:	01960633          	add	a2,a2,s9
    451c:	01972223          	sw	s9,4(a4)
    4520:	00f72023          	sw	a5,0(a4)
    4524:	0a412783          	lw	a5,164(sp)
    4528:	0ac12423          	sw	a2,168(sp)
    452c:	00870713          	add	a4,a4,8
    4530:	00178793          	add	a5,a5,1
    4534:	0af12223          	sw	a5,164(sp)
    4538:	14f6ce63          	blt	a3,a5,4694 <_vfprintf_r+0x266c>
    453c:	04412783          	lw	a5,68(sp)
    4540:	000bc583          	lbu	a1,0(s7)
    4544:	418784b3          	sub	s1,a5,s8
    4548:	0095d463          	bge	a1,s1,4550 <_vfprintf_r+0x2528>
    454c:	00058493          	mv	s1,a1
    4550:	02905663          	blez	s1,457c <_vfprintf_r+0x2554>
    4554:	0a412583          	lw	a1,164(sp)
    4558:	00960633          	add	a2,a2,s1
    455c:	01872023          	sw	s8,0(a4)
    4560:	00158593          	add	a1,a1,1
    4564:	00972223          	sw	s1,4(a4)
    4568:	0ac12423          	sw	a2,168(sp)
    456c:	0ab12223          	sw	a1,164(sp)
    4570:	14b6c663          	blt	a3,a1,46bc <_vfprintf_r+0x2694>
    4574:	000bc583          	lbu	a1,0(s7)
    4578:	00870713          	add	a4,a4,8
    457c:	fff4c513          	not	a0,s1
    4580:	41f55513          	sra	a0,a0,0x1f
    4584:	00a4f7b3          	and	a5,s1,a0
    4588:	40f584b3          	sub	s1,a1,a5
    458c:	04904663          	bgtz	s1,45d8 <_vfprintf_r+0x25b0>
    4590:	00bc0c33          	add	s8,s8,a1
    4594:	f7404ce3          	bgtz	s4,450c <_vfprintf_r+0x24e4>
    4598:	f6804ce3          	bgtz	s0,4510 <_vfprintf_r+0x24e8>
    459c:	01812783          	lw	a5,24(sp)
    45a0:	000c0313          	mv	t1,s8
    45a4:	02412c03          	lw	s8,36(sp)
    45a8:	03712e23          	sw	s7,60(sp)
    45ac:	00070413          	mv	s0,a4
    45b0:	00fc0733          	add	a4,s8,a5
    45b4:	05012903          	lw	s2,80(sp)
    45b8:	05412e83          	lw	t4,84(sp)
    45bc:	05812b83          	lw	s7,88(sp)
    45c0:	05c12c83          	lw	s9,92(sp)
    45c4:	00060493          	mv	s1,a2
    45c8:	00676463          	bltu	a4,t1,45d0 <_vfprintf_r+0x25a8>
    45cc:	c59fe06f          	j	3224 <_vfprintf_r+0x11fc>
    45d0:	00070313          	mv	t1,a4
    45d4:	c51fe06f          	j	3224 <_vfprintf_r+0x11fc>
    45d8:	0a412583          	lw	a1,164(sp)
    45dc:	0000be97          	auipc	t4,0xb
    45e0:	190e8e93          	add	t4,t4,400 # f76c <zeroes.0>
    45e4:	069d5c63          	bge	s10,s1,465c <_vfprintf_r+0x2634>
    45e8:	02812023          	sw	s0,32(sp)
    45ec:	00048413          	mv	s0,s1
    45f0:	000b0493          	mv	s1,s6
    45f4:	00c0006f          	j	4600 <_vfprintf_r+0x25d8>
    45f8:	ff040413          	add	s0,s0,-16
    45fc:	048d5a63          	bge	s10,s0,4650 <_vfprintf_r+0x2628>
    4600:	01060613          	add	a2,a2,16
    4604:	00158593          	add	a1,a1,1
    4608:	01672023          	sw	s6,0(a4)
    460c:	01a72223          	sw	s10,4(a4)
    4610:	0ac12423          	sw	a2,168(sp)
    4614:	0ab12223          	sw	a1,164(sp)
    4618:	00870713          	add	a4,a4,8
    461c:	fcb6dee3          	bge	a3,a1,45f8 <_vfprintf_r+0x25d0>
    4620:	0a010613          	add	a2,sp,160
    4624:	00090593          	mv	a1,s2
    4628:	00098513          	mv	a0,s3
    462c:	0b9000ef          	jal	4ee4 <__sprint_r>
    4630:	00050463          	beqz	a0,4638 <_vfprintf_r+0x2610>
    4634:	ec5fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    4638:	ff040413          	add	s0,s0,-16
    463c:	0a812603          	lw	a2,168(sp)
    4640:	0a412583          	lw	a1,164(sp)
    4644:	0ac10713          	add	a4,sp,172
    4648:	00700693          	li	a3,7
    464c:	fa8d4ae3          	blt	s10,s0,4600 <_vfprintf_r+0x25d8>
    4650:	00048e93          	mv	t4,s1
    4654:	00040493          	mv	s1,s0
    4658:	02012403          	lw	s0,32(sp)
    465c:	00960633          	add	a2,a2,s1
    4660:	00158593          	add	a1,a1,1
    4664:	01d72023          	sw	t4,0(a4)
    4668:	00972223          	sw	s1,4(a4)
    466c:	0ac12423          	sw	a2,168(sp)
    4670:	0ab12223          	sw	a1,164(sp)
    4674:	10b6ce63          	blt	a3,a1,4790 <_vfprintf_r+0x2768>
    4678:	000bc583          	lbu	a1,0(s7)
    467c:	00870713          	add	a4,a4,8
    4680:	00bc0c33          	add	s8,s8,a1
    4684:	f11ff06f          	j	4594 <_vfprintf_r+0x256c>
    4688:	fffb8b93          	add	s7,s7,-1
    468c:	fffa0a13          	add	s4,s4,-1
    4690:	e85ff06f          	j	4514 <_vfprintf_r+0x24ec>
    4694:	0a010613          	add	a2,sp,160
    4698:	00090593          	mv	a1,s2
    469c:	00098513          	mv	a0,s3
    46a0:	045000ef          	jal	4ee4 <__sprint_r>
    46a4:	00050463          	beqz	a0,46ac <_vfprintf_r+0x2684>
    46a8:	e51fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    46ac:	0a812603          	lw	a2,168(sp)
    46b0:	0ac10713          	add	a4,sp,172
    46b4:	00700693          	li	a3,7
    46b8:	e85ff06f          	j	453c <_vfprintf_r+0x2514>
    46bc:	0a010613          	add	a2,sp,160
    46c0:	00090593          	mv	a1,s2
    46c4:	00098513          	mv	a0,s3
    46c8:	01d000ef          	jal	4ee4 <__sprint_r>
    46cc:	00050463          	beqz	a0,46d4 <_vfprintf_r+0x26ac>
    46d0:	e29fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    46d4:	000bc583          	lbu	a1,0(s7)
    46d8:	0a812603          	lw	a2,168(sp)
    46dc:	0ac10713          	add	a4,sp,172
    46e0:	00700693          	li	a3,7
    46e4:	e99ff06f          	j	457c <_vfprintf_r+0x2554>
    46e8:	04c12783          	lw	a5,76(sp)
    46ec:	04812583          	lw	a1,72(sp)
    46f0:	00000913          	li	s2,0
    46f4:	40fc0c33          	sub	s8,s8,a5
    46f8:	00078613          	mv	a2,a5
    46fc:	000c0513          	mv	a0,s8
    4700:	468030ef          	jal	7b68 <strncpy>
    4704:	00144783          	lbu	a5,1(s0)
    4708:	00a00613          	li	a2,10
    470c:	00000693          	li	a3,0
    4710:	00f037b3          	snez	a5,a5
    4714:	000d0513          	mv	a0,s10
    4718:	000c8593          	mv	a1,s9
    471c:	00f40433          	add	s0,s0,a5
    4720:	78d060ef          	jal	b6ac <__udivdi3>
    4724:	a10ff06f          	j	3934 <_vfprintf_r+0x190c>
    4728:	09810713          	add	a4,sp,152
    472c:	00000693          	li	a3,0
    4730:	08410613          	add	a2,sp,132
    4734:	00000593          	li	a1,0
    4738:	00098513          	mv	a0,s3
    473c:	01c12a23          	sw	t3,20(sp)
    4740:	01d12823          	sw	t4,16(sp)
    4744:	618060ef          	jal	ad5c <_wcsrtombs_r>
    4748:	fff00713          	li	a4,-1
    474c:	01012e83          	lw	t4,16(sp)
    4750:	01412e03          	lw	t3,20(sp)
    4754:	00050d13          	mv	s10,a0
    4758:	30e50063          	beq	a0,a4,4a58 <_vfprintf_r+0x2a30>
    475c:	09812223          	sw	s8,132(sp)
    4760:	cacff06f          	j	3c0c <_vfprintf_r+0x1be4>
    4764:	07714603          	lbu	a2,119(sp)
    4768:	01612a23          	sw	s6,20(sp)
    476c:	02012223          	sw	zero,36(sp)
    4770:	02012023          	sw	zero,32(sp)
    4774:	00012823          	sw	zero,16(sp)
    4778:	00000c93          	li	s9,0
    477c:	00000313          	li	t1,0
    4780:	00000a13          	li	s4,0
    4784:	00061463          	bnez	a2,478c <_vfprintf_r+0x2764>
    4788:	ae1fd06f          	j	2268 <_vfprintf_r+0x240>
    478c:	efdfd06f          	j	2688 <_vfprintf_r+0x660>
    4790:	0a010613          	add	a2,sp,160
    4794:	00090593          	mv	a1,s2
    4798:	00098513          	mv	a0,s3
    479c:	748000ef          	jal	4ee4 <__sprint_r>
    47a0:	00050463          	beqz	a0,47a8 <_vfprintf_r+0x2780>
    47a4:	d55fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    47a8:	000bc583          	lbu	a1,0(s7)
    47ac:	0a812603          	lw	a2,168(sp)
    47b0:	0ac10713          	add	a4,sp,172
    47b4:	00700693          	li	a3,7
    47b8:	00bc0c33          	add	s8,s8,a1
    47bc:	dd9ff06f          	j	4594 <_vfprintf_r+0x256c>
    47c0:	00812583          	lw	a1,8(sp)
    47c4:	0a010613          	add	a2,sp,160
    47c8:	00098513          	mv	a0,s3
    47cc:	05d12223          	sw	t4,68(sp)
    47d0:	714000ef          	jal	4ee4 <__sprint_r>
    47d4:	00050463          	beqz	a0,47dc <_vfprintf_r+0x27b4>
    47d8:	d21fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    47dc:	0a812483          	lw	s1,168(sp)
    47e0:	04412e83          	lw	t4,68(sp)
    47e4:	0ac10413          	add	s0,sp,172
    47e8:	a19fe06f          	j	3200 <_vfprintf_r+0x11d8>
    47ec:	00900793          	li	a5,9
    47f0:	95a7e263          	bltu	a5,s10,3934 <_vfprintf_r+0x190c>
    47f4:	98cff06f          	j	3980 <_vfprintf_r+0x1958>
    47f8:	07c12a03          	lw	s4,124(sp)
    47fc:	00070793          	mv	a5,a4
    4800:	9f1ff06f          	j	41f0 <_vfprintf_r+0x21c8>
    4804:	00812583          	lw	a1,8(sp)
    4808:	0a010613          	add	a2,sp,160
    480c:	00098513          	mv	a0,s3
    4810:	03d12023          	sw	t4,32(sp)
    4814:	6d0000ef          	jal	4ee4 <__sprint_r>
    4818:	00050463          	beqz	a0,4820 <_vfprintf_r+0x27f8>
    481c:	cddfd06f          	j	24f8 <_vfprintf_r+0x4d0>
    4820:	07c12d03          	lw	s10,124(sp)
    4824:	01812783          	lw	a5,24(sp)
    4828:	0a812483          	lw	s1,168(sp)
    482c:	02012e83          	lw	t4,32(sp)
    4830:	0ac10413          	add	s0,sp,172
    4834:	41a78d33          	sub	s10,a5,s10
    4838:	a49fe06f          	j	3280 <_vfprintf_r+0x1258>
    483c:	00650733          	add	a4,a0,t1
    4840:	04700d13          	li	s10,71
    4844:	94dff06f          	j	4190 <_vfprintf_r+0x2168>
    4848:	02812603          	lw	a2,40(sp)
    484c:	00048593          	mv	a1,s1
    4850:	00000693          	li	a3,0
    4854:	00060513          	mv	a0,a2
    4858:	00000613          	li	a2,0
    485c:	04e12823          	sw	a4,80(sp)
    4860:	02612223          	sw	t1,36(sp)
    4864:	03c12023          	sw	t3,32(sp)
    4868:	01d12c23          	sw	t4,24(sp)
    486c:	4b9080ef          	jal	d524 <__eqdf2>
    4870:	01812e83          	lw	t4,24(sp)
    4874:	02012e03          	lw	t3,32(sp)
    4878:	02412303          	lw	t1,36(sp)
    487c:	05012703          	lw	a4,80(sp)
    4880:	34051e63          	bnez	a0,4bdc <_vfprintf_r+0x2bb4>
    4884:	07c12a03          	lw	s4,124(sp)
    4888:	01470733          	add	a4,a4,s4
    488c:	418707b3          	sub	a5,a4,s8
    4890:	00f12c23          	sw	a5,24(sp)
    4894:	001ef713          	and	a4,t4,1
    4898:	00676733          	or	a4,a4,t1
    489c:	37405a63          	blez	s4,4c10 <_vfprintf_r+0x2be8>
    48a0:	26071263          	bnez	a4,4b04 <_vfprintf_r+0x2adc>
    48a4:	000a0d13          	mv	s10,s4
    48a8:	06600e13          	li	t3,102
    48ac:	400eff13          	and	t5,t4,1024
    48b0:	1c0f1a63          	bnez	t5,4a84 <_vfprintf_r+0x2a5c>
    48b4:	fffd4813          	not	a6,s10
    48b8:	41f85813          	sra	a6,a6,0x1f
    48bc:	010d7cb3          	and	s9,s10,a6
    48c0:	bd9ff06f          	j	4498 <_vfprintf_r+0x2470>
    48c4:	01812783          	lw	a5,24(sp)
    48c8:	03012703          	lw	a4,48(sp)
    48cc:	06700e13          	li	t3,103
    48d0:	00e78d33          	add	s10,a5,a4
    48d4:	fd404ce3          	bgtz	s4,48ac <_vfprintf_r+0x2884>
    48d8:	414d06b3          	sub	a3,s10,s4
    48dc:	00168d13          	add	s10,a3,1
    48e0:	fffd4813          	not	a6,s10
    48e4:	41f85813          	sra	a6,a6,0x1f
    48e8:	010d7cb3          	and	s9,s10,a6
    48ec:	badff06f          	j	4498 <_vfprintf_r+0x2470>
    48f0:	000e8613          	mv	a2,t4
    48f4:	ad8fe06f          	j	2bcc <_vfprintf_r+0xba4>
    48f8:	00812783          	lw	a5,8(sp)
    48fc:	0647a783          	lw	a5,100(a5)
    4900:	0017f793          	and	a5,a5,1
    4904:	02079063          	bnez	a5,4924 <_vfprintf_r+0x28fc>
    4908:	00812783          	lw	a5,8(sp)
    490c:	00c7d783          	lhu	a5,12(a5)
    4910:	2007f793          	and	a5,a5,512
    4914:	00079863          	bnez	a5,4924 <_vfprintf_r+0x28fc>
    4918:	00812783          	lw	a5,8(sp)
    491c:	0587a503          	lw	a0,88(a5)
    4920:	fb0fc0ef          	jal	10d0 <__retarget_lock_release_recursive>
    4924:	fff00793          	li	a5,-1
    4928:	00f12623          	sw	a5,12(sp)
    492c:	c2dfd06f          	j	2558 <_vfprintf_r+0x530>
    4930:	ff000613          	li	a2,-16
    4934:	40d00d33          	neg	s10,a3
    4938:	0000b297          	auipc	t0,0xb
    493c:	e3428293          	add	t0,t0,-460 # f76c <zeroes.0>
    4940:	08c6d463          	bge	a3,a2,49c8 <_vfprintf_r+0x29a0>
    4944:	03212023          	sw	s2,32(sp)
    4948:	01000693          	li	a3,16
    494c:	00700b13          	li	s6,7
    4950:	000e8a13          	mv	s4,t4
    4954:	00028913          	mv	s2,t0
    4958:	00c0006f          	j	4964 <_vfprintf_r+0x293c>
    495c:	ff0d0d13          	add	s10,s10,-16
    4960:	05a6de63          	bge	a3,s10,49bc <_vfprintf_r+0x2994>
    4964:	01048493          	add	s1,s1,16
    4968:	00170713          	add	a4,a4,1
    496c:	01242023          	sw	s2,0(s0)
    4970:	00d42223          	sw	a3,4(s0)
    4974:	0a912423          	sw	s1,168(sp)
    4978:	0ae12223          	sw	a4,164(sp)
    497c:	00840413          	add	s0,s0,8
    4980:	fceb5ee3          	bge	s6,a4,495c <_vfprintf_r+0x2934>
    4984:	00812583          	lw	a1,8(sp)
    4988:	0a010613          	add	a2,sp,160
    498c:	00098513          	mv	a0,s3
    4990:	554000ef          	jal	4ee4 <__sprint_r>
    4994:	00050463          	beqz	a0,499c <_vfprintf_r+0x2974>
    4998:	b61fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    499c:	0a812483          	lw	s1,168(sp)
    49a0:	0a412703          	lw	a4,164(sp)
    49a4:	0ac10413          	add	s0,sp,172
    49a8:	01000693          	li	a3,16
    49ac:	fb1ff06f          	j	495c <_vfprintf_r+0x2934>
    49b0:	00012823          	sw	zero,16(sp)
    49b4:	0ec10c13          	add	s8,sp,236
    49b8:	a88ff06f          	j	3c40 <_vfprintf_r+0x1c18>
    49bc:	00090293          	mv	t0,s2
    49c0:	02012903          	lw	s2,32(sp)
    49c4:	000a0e93          	mv	t4,s4
    49c8:	01a484b3          	add	s1,s1,s10
    49cc:	00170713          	add	a4,a4,1
    49d0:	00542023          	sw	t0,0(s0)
    49d4:	01a42223          	sw	s10,4(s0)
    49d8:	0a912423          	sw	s1,168(sp)
    49dc:	0ae12223          	sw	a4,164(sp)
    49e0:	00700693          	li	a3,7
    49e4:	00e6c463          	blt	a3,a4,49ec <_vfprintf_r+0x29c4>
    49e8:	b65fe06f          	j	354c <_vfprintf_r+0x1524>
    49ec:	00812583          	lw	a1,8(sp)
    49f0:	0a010613          	add	a2,sp,160
    49f4:	00098513          	mv	a0,s3
    49f8:	03d12023          	sw	t4,32(sp)
    49fc:	4e8000ef          	jal	4ee4 <__sprint_r>
    4a00:	00050463          	beqz	a0,4a08 <_vfprintf_r+0x29e0>
    4a04:	af5fd06f          	j	24f8 <_vfprintf_r+0x4d0>
    4a08:	0a812483          	lw	s1,168(sp)
    4a0c:	0a412703          	lw	a4,164(sp)
    4a10:	02012e83          	lw	t4,32(sp)
    4a14:	0ac10413          	add	s0,sp,172
    4a18:	b20ff06f          	j	3d38 <_vfprintf_r+0x1d10>
    4a1c:	08a10693          	add	a3,sp,138
    4a20:	00061863          	bnez	a2,4a30 <_vfprintf_r+0x2a08>
    4a24:	03000693          	li	a3,48
    4a28:	08d10523          	sb	a3,138(sp)
    4a2c:	08b10693          	add	a3,sp,139
    4a30:	15010793          	add	a5,sp,336
    4a34:	40f68633          	sub	a2,a3,a5
    4a38:	030d0713          	add	a4,s10,48
    4a3c:	0c960793          	add	a5,a2,201
    4a40:	00e68023          	sb	a4,0(a3)
    4a44:	04f12023          	sw	a5,64(sp)
    4a48:	d5cff06f          	j	3fa4 <_vfprintf_r+0x1f7c>
    4a4c:	001ef713          	and	a4,t4,1
    4a50:	d6070863          	beqz	a4,3fc0 <_vfprintf_r+0x1f98>
    4a54:	d64ff06f          	j	3fb8 <_vfprintf_r+0x1f90>
    4a58:	00812783          	lw	a5,8(sp)
    4a5c:	00000293          	li	t0,0
    4a60:	00c79783          	lh	a5,12(a5)
    4a64:	0407e793          	or	a5,a5,64
    4a68:	00812703          	lw	a4,8(sp)
    4a6c:	00f71623          	sh	a5,12(a4)
    4a70:	a8dfd06f          	j	24fc <_vfprintf_r+0x4d4>
    4a74:	00012823          	sw	zero,16(sp)
    4a78:	00600313          	li	t1,6
    4a7c:	ff9fe06f          	j	3a74 <_vfprintf_r+0x1a4c>
    4a80:	06700e13          	li	t3,103
    4a84:	03c12783          	lw	a5,60(sp)
    4a88:	0ff00613          	li	a2,255
    4a8c:	0007c703          	lbu	a4,0(a5)
    4a90:	22c70263          	beq	a4,a2,4cb4 <_vfprintf_r+0x2c8c>
    4a94:	00000593          	li	a1,0
    4a98:	00000693          	li	a3,0
    4a9c:	01475e63          	bge	a4,s4,4ab8 <_vfprintf_r+0x2a90>
    4aa0:	40ea0a33          	sub	s4,s4,a4
    4aa4:	0017c703          	lbu	a4,1(a5)
    4aa8:	04070863          	beqz	a4,4af8 <_vfprintf_r+0x2ad0>
    4aac:	00168693          	add	a3,a3,1
    4ab0:	00178793          	add	a5,a5,1
    4ab4:	fec714e3          	bne	a4,a2,4a9c <_vfprintf_r+0x2a74>
    4ab8:	02f12e23          	sw	a5,60(sp)
    4abc:	02d12023          	sw	a3,32(sp)
    4ac0:	02b12223          	sw	a1,36(sp)
    4ac4:	02012783          	lw	a5,32(sp)
    4ac8:	02412703          	lw	a4,36(sp)
    4acc:	04c12583          	lw	a1,76(sp)
    4ad0:	05c12823          	sw	t3,80(sp)
    4ad4:	00e78533          	add	a0,a5,a4
    4ad8:	3a80a0ef          	jal	ee80 <__mulsi3>
    4adc:	01a50d33          	add	s10,a0,s10
    4ae0:	fffd4813          	not	a6,s10
    4ae4:	41f85813          	sra	a6,a6,0x1f
    4ae8:	05012e03          	lw	t3,80(sp)
    4aec:	010d7cb3          	and	s9,s10,a6
    4af0:	000b0e93          	mv	t4,s6
    4af4:	cecff06f          	j	3fe0 <_vfprintf_r+0x1fb8>
    4af8:	0007c703          	lbu	a4,0(a5)
    4afc:	00158593          	add	a1,a1,1
    4b00:	fb5ff06f          	j	4ab4 <_vfprintf_r+0x2a8c>
    4b04:	03012783          	lw	a5,48(sp)
    4b08:	06600e13          	li	t3,102
    4b0c:	00f306b3          	add	a3,t1,a5
    4b10:	01468d33          	add	s10,a3,s4
    4b14:	d99ff06f          	j	48ac <_vfprintf_r+0x2884>
    4b18:	02c12783          	lw	a5,44(sp)
    4b1c:	0a07c863          	bltz	a5,4bcc <_vfprintf_r+0x2ba4>
    4b20:	07714603          	lbu	a2,119(sp)
    4b24:	04700713          	li	a4,71
    4b28:	0000ac17          	auipc	s8,0xa
    4b2c:	758c0c13          	add	s8,s8,1880 # f280 <__fini_array_end+0x208>
    4b30:	01c75463          	bge	a4,t3,4b38 <_vfprintf_r+0x2b10>
    4b34:	b31fd06f          	j	2664 <_vfprintf_r+0x63c>
    4b38:	0000ac17          	auipc	s8,0xa
    4b3c:	744c0c13          	add	s8,s8,1860 # f27c <__fini_array_end+0x204>
    4b40:	b25fd06f          	j	2664 <_vfprintf_r+0x63c>
    4b44:	07714603          	lbu	a2,119(sp)
    4b48:	01612a23          	sw	s6,20(sp)
    4b4c:	02012223          	sw	zero,36(sp)
    4b50:	02012023          	sw	zero,32(sp)
    4b54:	00030c93          	mv	s9,t1
    4b58:	00030d13          	mv	s10,t1
    4b5c:	07300e13          	li	t3,115
    4b60:	00000313          	li	t1,0
    4b64:	00061463          	bnez	a2,4b6c <_vfprintf_r+0x2b44>
    4b68:	f00fd06f          	j	2268 <_vfprintf_r+0x240>
    4b6c:	b1dfd06f          	j	2688 <_vfprintf_r+0x660>
    4b70:	00040313          	mv	t1,s0
    4b74:	01012903          	lw	s2,16(sp)
    4b78:	000b0413          	mv	s0,s6
    4b7c:	01412e03          	lw	t3,20(sp)
    4b80:	000c0b13          	mv	s6,s8
    4b84:	000a0e93          	mv	t4,s4
    4b88:	000c8c13          	mv	s8,s9
    4b8c:	00030d13          	mv	s10,t1
    4b90:	87cff06f          	j	3c0c <_vfprintf_r+0x1be4>
    4b94:	001b0793          	add	a5,s6,1
    4b98:	000c0993          	mv	s3,s8
    4b9c:	02412903          	lw	s2,36(sp)
    4ba0:	04012e83          	lw	t4,64(sp)
    4ba4:	05012e03          	lw	t3,80(sp)
    4ba8:	05412403          	lw	s0,84(sp)
    4bac:	000d0c13          	mv	s8,s10
    4bb0:	00f487b3          	add	a5,s1,a5
    4bb4:	03000693          	li	a3,48
    4bb8:	840b40e3          	bltz	s6,43f8 <_vfprintf_r+0x23d0>
    4bbc:	00148493          	add	s1,s1,1
    4bc0:	fed48fa3          	sb	a3,-1(s1)
    4bc4:	fe979ce3          	bne	a5,s1,4bbc <_vfprintf_r+0x2b94>
    4bc8:	835ff06f          	j	43fc <_vfprintf_r+0x23d4>
    4bcc:	02d00793          	li	a5,45
    4bd0:	06f10ba3          	sb	a5,119(sp)
    4bd4:	02d00613          	li	a2,45
    4bd8:	f4dff06f          	j	4b24 <_vfprintf_r+0x2afc>
    4bdc:	00100693          	li	a3,1
    4be0:	414686b3          	sub	a3,a3,s4
    4be4:	06d12e23          	sw	a3,124(sp)
    4be8:	da4ff06f          	j	418c <_vfprintf_r+0x2164>
    4bec:	01412783          	lw	a5,20(sp)
    4bf0:	0007ab03          	lw	s6,0(a5)
    4bf4:	00478793          	add	a5,a5,4
    4bf8:	000b5463          	bgez	s6,4c00 <_vfprintf_r+0x2bd8>
    4bfc:	fff00b13          	li	s6,-1
    4c00:	00194e03          	lbu	t3,1(s2)
    4c04:	00f12a23          	sw	a5,20(sp)
    4c08:	00068913          	mv	s2,a3
    4c0c:	dccfd06f          	j	21d8 <_vfprintf_r+0x1b0>
    4c10:	00071a63          	bnez	a4,4c24 <_vfprintf_r+0x2bfc>
    4c14:	00100c93          	li	s9,1
    4c18:	06600e13          	li	t3,102
    4c1c:	00100d13          	li	s10,1
    4c20:	879ff06f          	j	4498 <_vfprintf_r+0x2470>
    4c24:	03012783          	lw	a5,48(sp)
    4c28:	06600e13          	li	t3,102
    4c2c:	00178693          	add	a3,a5,1
    4c30:	00668d33          	add	s10,a3,t1
    4c34:	fffd4813          	not	a6,s10
    4c38:	41f85813          	sra	a6,a6,0x1f
    4c3c:	010d7cb3          	and	s9,s10,a6
    4c40:	859ff06f          	j	4498 <_vfprintf_r+0x2470>
    4c44:	00200793          	li	a5,2
    4c48:	04f12023          	sw	a5,64(sp)
    4c4c:	b58ff06f          	j	3fa4 <_vfprintf_r+0x1f7c>
    4c50:	00812703          	lw	a4,8(sp)
    4c54:	00c71783          	lh	a5,12(a4)
    4c58:	0407e793          	or	a5,a5,64
    4c5c:	00f71623          	sh	a5,12(a4)
    4c60:	8b5fd06f          	j	2514 <_vfprintf_r+0x4ec>
    4c64:	000a0513          	mv	a0,s4
    4c68:	000d0593          	mv	a1,s10
    4c6c:	00030613          	mv	a2,t1
    4c70:	00038693          	mv	a3,t2
    4c74:	05012023          	sw	a6,64(sp)
    4c78:	03c12223          	sw	t3,36(sp)
    4c7c:	01d12c23          	sw	t4,24(sp)
    4c80:	0a5080ef          	jal	d524 <__eqdf2>
    4c84:	01812e83          	lw	t4,24(sp)
    4c88:	02412e03          	lw	t3,36(sp)
    4c8c:	04012803          	lw	a6,64(sp)
    4c90:	f6051463          	bnez	a0,43f8 <_vfprintf_r+0x23d0>
    4c94:	001b7693          	and	a3,s6,1
    4c98:	f6068063          	beqz	a3,43f8 <_vfprintf_r+0x23d0>
    4c9c:	f14ff06f          	j	43b0 <_vfprintf_r+0x2388>
    4ca0:	00812783          	lw	a5,8(sp)
    4ca4:	01012283          	lw	t0,16(sp)
    4ca8:	00c79783          	lh	a5,12(a5)
    4cac:	0407e793          	or	a5,a5,64
    4cb0:	db9ff06f          	j	4a68 <_vfprintf_r+0x2a40>
    4cb4:	02012223          	sw	zero,36(sp)
    4cb8:	02012023          	sw	zero,32(sp)
    4cbc:	e09ff06f          	j	4ac4 <_vfprintf_r+0x2a9c>
    4cc0:	04500d13          	li	s10,69
    4cc4:	cccff06f          	j	4190 <_vfprintf_r+0x2168>

00004cc8 <__sbprintf>:
    4cc8:	b7010113          	add	sp,sp,-1168
    4ccc:	00c59783          	lh	a5,12(a1)
    4cd0:	00e5d703          	lhu	a4,14(a1)
    4cd4:	48812423          	sw	s0,1160(sp)
    4cd8:	00058413          	mv	s0,a1
    4cdc:	000105b7          	lui	a1,0x10
    4ce0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x4a5>
    4ce4:	06442303          	lw	t1,100(s0)
    4ce8:	01c42883          	lw	a7,28(s0)
    4cec:	02442803          	lw	a6,36(s0)
    4cf0:	01071713          	sll	a4,a4,0x10
    4cf4:	00b7f7b3          	and	a5,a5,a1
    4cf8:	00e7e7b3          	or	a5,a5,a4
    4cfc:	40000593          	li	a1,1024
    4d00:	49212023          	sw	s2,1152(sp)
    4d04:	00f12a23          	sw	a5,20(sp)
    4d08:	00050913          	mv	s2,a0
    4d0c:	07010793          	add	a5,sp,112
    4d10:	06010513          	add	a0,sp,96
    4d14:	48112623          	sw	ra,1164(sp)
    4d18:	48912223          	sw	s1,1156(sp)
    4d1c:	47312e23          	sw	s3,1148(sp)
    4d20:	00060493          	mv	s1,a2
    4d24:	00068993          	mv	s3,a3
    4d28:	06612623          	sw	t1,108(sp)
    4d2c:	03112223          	sw	a7,36(sp)
    4d30:	03012623          	sw	a6,44(sp)
    4d34:	00f12423          	sw	a5,8(sp)
    4d38:	00f12c23          	sw	a5,24(sp)
    4d3c:	00b12823          	sw	a1,16(sp)
    4d40:	00b12e23          	sw	a1,28(sp)
    4d44:	02012023          	sw	zero,32(sp)
    4d48:	b7cfc0ef          	jal	10c4 <__retarget_lock_init_recursive>
    4d4c:	00048613          	mv	a2,s1
    4d50:	00098693          	mv	a3,s3
    4d54:	00810593          	add	a1,sp,8
    4d58:	00090513          	mv	a0,s2
    4d5c:	accfd0ef          	jal	2028 <_vfprintf_r>
    4d60:	00050493          	mv	s1,a0
    4d64:	04055263          	bgez	a0,4da8 <__sbprintf+0xe0>
    4d68:	01415783          	lhu	a5,20(sp)
    4d6c:	0407f793          	and	a5,a5,64
    4d70:	00078863          	beqz	a5,4d80 <__sbprintf+0xb8>
    4d74:	00c45783          	lhu	a5,12(s0)
    4d78:	0407e793          	or	a5,a5,64
    4d7c:	00f41623          	sh	a5,12(s0)
    4d80:	06012503          	lw	a0,96(sp)
    4d84:	b44fc0ef          	jal	10c8 <__retarget_lock_close_recursive>
    4d88:	48c12083          	lw	ra,1164(sp)
    4d8c:	48812403          	lw	s0,1160(sp)
    4d90:	48012903          	lw	s2,1152(sp)
    4d94:	47c12983          	lw	s3,1148(sp)
    4d98:	00048513          	mv	a0,s1
    4d9c:	48412483          	lw	s1,1156(sp)
    4da0:	49010113          	add	sp,sp,1168
    4da4:	00008067          	ret
    4da8:	00810593          	add	a1,sp,8
    4dac:	00090513          	mv	a0,s2
    4db0:	449010ef          	jal	69f8 <_fflush_r>
    4db4:	fa050ae3          	beqz	a0,4d68 <__sbprintf+0xa0>
    4db8:	fff00493          	li	s1,-1
    4dbc:	fadff06f          	j	4d68 <__sbprintf+0xa0>

00004dc0 <__sprint_r.part.0>:
    4dc0:	0645a783          	lw	a5,100(a1)
    4dc4:	fd010113          	add	sp,sp,-48
    4dc8:	01612823          	sw	s6,16(sp)
    4dcc:	02112623          	sw	ra,44(sp)
    4dd0:	01279713          	sll	a4,a5,0x12
    4dd4:	00060b13          	mv	s6,a2
    4dd8:	0e075863          	bgez	a4,4ec8 <__sprint_r.part.0+0x108>
    4ddc:	00862783          	lw	a5,8(a2)
    4de0:	03212023          	sw	s2,32(sp)
    4de4:	01312e23          	sw	s3,28(sp)
    4de8:	01512a23          	sw	s5,20(sp)
    4dec:	01712623          	sw	s7,12(sp)
    4df0:	00058913          	mv	s2,a1
    4df4:	00062b83          	lw	s7,0(a2)
    4df8:	00050993          	mv	s3,a0
    4dfc:	fff00a93          	li	s5,-1
    4e00:	0a078863          	beqz	a5,4eb0 <__sprint_r.part.0+0xf0>
    4e04:	02812423          	sw	s0,40(sp)
    4e08:	02912223          	sw	s1,36(sp)
    4e0c:	01412c23          	sw	s4,24(sp)
    4e10:	01812423          	sw	s8,8(sp)
    4e14:	004bac03          	lw	s8,4(s7)
    4e18:	000ba403          	lw	s0,0(s7)
    4e1c:	002c5a13          	srl	s4,s8,0x2
    4e20:	060a0663          	beqz	s4,4e8c <__sprint_r.part.0+0xcc>
    4e24:	00000493          	li	s1,0
    4e28:	00c0006f          	j	4e34 <__sprint_r.part.0+0x74>
    4e2c:	00440413          	add	s0,s0,4
    4e30:	049a0c63          	beq	s4,s1,4e88 <__sprint_r.part.0+0xc8>
    4e34:	00042583          	lw	a1,0(s0)
    4e38:	00090613          	mv	a2,s2
    4e3c:	00098513          	mv	a0,s3
    4e40:	399020ef          	jal	79d8 <_fputwc_r>
    4e44:	00148493          	add	s1,s1,1
    4e48:	ff5512e3          	bne	a0,s5,4e2c <__sprint_r.part.0+0x6c>
    4e4c:	02812403          	lw	s0,40(sp)
    4e50:	02412483          	lw	s1,36(sp)
    4e54:	02012903          	lw	s2,32(sp)
    4e58:	01c12983          	lw	s3,28(sp)
    4e5c:	01812a03          	lw	s4,24(sp)
    4e60:	01412a83          	lw	s5,20(sp)
    4e64:	00c12b83          	lw	s7,12(sp)
    4e68:	00812c03          	lw	s8,8(sp)
    4e6c:	fff00513          	li	a0,-1
    4e70:	02c12083          	lw	ra,44(sp)
    4e74:	000b2423          	sw	zero,8(s6)
    4e78:	000b2223          	sw	zero,4(s6)
    4e7c:	01012b03          	lw	s6,16(sp)
    4e80:	03010113          	add	sp,sp,48
    4e84:	00008067          	ret
    4e88:	008b2783          	lw	a5,8(s6)
    4e8c:	ffcc7c13          	and	s8,s8,-4
    4e90:	418787b3          	sub	a5,a5,s8
    4e94:	00fb2423          	sw	a5,8(s6)
    4e98:	008b8b93          	add	s7,s7,8
    4e9c:	f6079ce3          	bnez	a5,4e14 <__sprint_r.part.0+0x54>
    4ea0:	02812403          	lw	s0,40(sp)
    4ea4:	02412483          	lw	s1,36(sp)
    4ea8:	01812a03          	lw	s4,24(sp)
    4eac:	00812c03          	lw	s8,8(sp)
    4eb0:	02012903          	lw	s2,32(sp)
    4eb4:	01c12983          	lw	s3,28(sp)
    4eb8:	01412a83          	lw	s5,20(sp)
    4ebc:	00c12b83          	lw	s7,12(sp)
    4ec0:	00000513          	li	a0,0
    4ec4:	fadff06f          	j	4e70 <__sprint_r.part.0+0xb0>
    4ec8:	6b5010ef          	jal	6d7c <__sfvwrite_r>
    4ecc:	02c12083          	lw	ra,44(sp)
    4ed0:	000b2423          	sw	zero,8(s6)
    4ed4:	000b2223          	sw	zero,4(s6)
    4ed8:	01012b03          	lw	s6,16(sp)
    4edc:	03010113          	add	sp,sp,48
    4ee0:	00008067          	ret

00004ee4 <__sprint_r>:
    4ee4:	00862703          	lw	a4,8(a2)
    4ee8:	00070463          	beqz	a4,4ef0 <__sprint_r+0xc>
    4eec:	ed5ff06f          	j	4dc0 <__sprint_r.part.0>
    4ef0:	00062223          	sw	zero,4(a2)
    4ef4:	00000513          	li	a0,0
    4ef8:	00008067          	ret

00004efc <_vfiprintf_r>:
    4efc:	eb010113          	add	sp,sp,-336
    4f00:	14812423          	sw	s0,328(sp)
    4f04:	13312e23          	sw	s3,316(sp)
    4f08:	13812423          	sw	s8,296(sp)
    4f0c:	00050413          	mv	s0,a0
    4f10:	00058993          	mv	s3,a1
    4f14:	00060c13          	mv	s8,a2
    4f18:	00000593          	li	a1,0
    4f1c:	00800613          	li	a2,8
    4f20:	05010513          	add	a0,sp,80
    4f24:	13512a23          	sw	s5,308(sp)
    4f28:	14112623          	sw	ra,332(sp)
    4f2c:	00068a93          	mv	s5,a3
    4f30:	9a4fc0ef          	jal	10d4 <memset>
    4f34:	00040863          	beqz	s0,4f44 <_vfiprintf_r+0x48>
    4f38:	03442783          	lw	a5,52(s0)
    4f3c:	00079463          	bnez	a5,4f44 <_vfiprintf_r+0x48>
    4f40:	49c0106f          	j	63dc <_vfiprintf_r+0x14e0>
    4f44:	0649a703          	lw	a4,100(s3)
    4f48:	00c99783          	lh	a5,12(s3)
    4f4c:	00177713          	and	a4,a4,1
    4f50:	00071863          	bnez	a4,4f60 <_vfiprintf_r+0x64>
    4f54:	2007f713          	and	a4,a5,512
    4f58:	00071463          	bnez	a4,4f60 <_vfiprintf_r+0x64>
    4f5c:	0b80106f          	j	6014 <_vfiprintf_r+0x1118>
    4f60:	01279713          	sll	a4,a5,0x12
    4f64:	02074663          	bltz	a4,4f90 <_vfiprintf_r+0x94>
    4f68:	0649a703          	lw	a4,100(s3)
    4f6c:	00002637          	lui	a2,0x2
    4f70:	ffffe6b7          	lui	a3,0xffffe
    4f74:	00c7e7b3          	or	a5,a5,a2
    4f78:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4f7c:	01079793          	sll	a5,a5,0x10
    4f80:	4107d793          	sra	a5,a5,0x10
    4f84:	00d77733          	and	a4,a4,a3
    4f88:	00f99623          	sh	a5,12(s3)
    4f8c:	06e9a223          	sw	a4,100(s3)
    4f90:	0087f713          	and	a4,a5,8
    4f94:	2e070463          	beqz	a4,527c <_vfiprintf_r+0x380>
    4f98:	0109a703          	lw	a4,16(s3)
    4f9c:	2e070063          	beqz	a4,527c <_vfiprintf_r+0x380>
    4fa0:	01a7f713          	and	a4,a5,26
    4fa4:	00a00693          	li	a3,10
    4fa8:	2ed70c63          	beq	a4,a3,52a0 <_vfiprintf_r+0x3a4>
    4fac:	13412c23          	sw	s4,312(sp)
    4fb0:	06c10a13          	add	s4,sp,108
    4fb4:	14912223          	sw	s1,324(sp)
    4fb8:	15212023          	sw	s2,320(sp)
    4fbc:	13612823          	sw	s6,304(sp)
    4fc0:	13712623          	sw	s7,300(sp)
    4fc4:	13912223          	sw	s9,292(sp)
    4fc8:	13a12023          	sw	s10,288(sp)
    4fcc:	000c0c93          	mv	s9,s8
    4fd0:	11b12e23          	sw	s11,284(sp)
    4fd4:	07412023          	sw	s4,96(sp)
    4fd8:	06012423          	sw	zero,104(sp)
    4fdc:	06012223          	sw	zero,100(sp)
    4fe0:	00012a23          	sw	zero,20(sp)
    4fe4:	02012623          	sw	zero,44(sp)
    4fe8:	02012823          	sw	zero,48(sp)
    4fec:	02012a23          	sw	zero,52(sp)
    4ff0:	00012623          	sw	zero,12(sp)
    4ff4:	7fffb497          	auipc	s1,0x7fffb
    4ff8:	54048493          	add	s1,s1,1344 # 80000534 <__global_locale>
    4ffc:	02500913          	li	s2,37
    5000:	0000ab97          	auipc	s7,0xa
    5004:	78cb8b93          	add	s7,s7,1932 # f78c <blanks.1+0x10>
    5008:	0000bb17          	auipc	s6,0xb
    500c:	8f0b0b13          	add	s6,s6,-1808 # f8f8 <zeroes.0>
    5010:	000a0c13          	mv	s8,s4
    5014:	000c8d93          	mv	s11,s9
    5018:	0e44ad03          	lw	s10,228(s1)
    501c:	3f9020ef          	jal	7c14 <__locale_mb_cur_max>
    5020:	00050693          	mv	a3,a0
    5024:	05010713          	add	a4,sp,80
    5028:	000d8613          	mv	a2,s11
    502c:	04810593          	add	a1,sp,72
    5030:	00040513          	mv	a0,s0
    5034:	000d00e7          	jalr	s10
    5038:	2e050e63          	beqz	a0,5334 <_vfiprintf_r+0x438>
    503c:	2c054e63          	bltz	a0,5318 <_vfiprintf_r+0x41c>
    5040:	04812783          	lw	a5,72(sp)
    5044:	01278663          	beq	a5,s2,5050 <_vfiprintf_r+0x154>
    5048:	00ad8db3          	add	s11,s11,a0
    504c:	fcdff06f          	j	5018 <_vfiprintf_r+0x11c>
    5050:	00050d13          	mv	s10,a0
    5054:	419d87b3          	sub	a5,s11,s9
    5058:	2f9d9463          	bne	s11,s9,5340 <_vfiprintf_r+0x444>
    505c:	00000e13          	li	t3,0
    5060:	001dc683          	lbu	a3,1(s11)
    5064:	001d8c93          	add	s9,s11,1
    5068:	040101a3          	sb	zero,67(sp)
    506c:	fff00713          	li	a4,-1
    5070:	00000893          	li	a7,0
    5074:	05a00d13          	li	s10,90
    5078:	000e0d93          	mv	s11,t3
    507c:	001c8c93          	add	s9,s9,1
    5080:	fe068793          	add	a5,a3,-32
    5084:	04fd6663          	bltu	s10,a5,50d0 <_vfiprintf_r+0x1d4>
    5088:	00279793          	sll	a5,a5,0x2
    508c:	017787b3          	add	a5,a5,s7
    5090:	0007a783          	lw	a5,0(a5)
    5094:	017787b3          	add	a5,a5,s7
    5098:	00078067          	jr	a5
    509c:	00000893          	li	a7,0
    50a0:	fd068793          	add	a5,a3,-48
    50a4:	00900593          	li	a1,9
    50a8:	000cc683          	lbu	a3,0(s9)
    50ac:	00289613          	sll	a2,a7,0x2
    50b0:	011608b3          	add	a7,a2,a7
    50b4:	00189893          	sll	a7,a7,0x1
    50b8:	011788b3          	add	a7,a5,a7
    50bc:	fd068793          	add	a5,a3,-48
    50c0:	001c8c93          	add	s9,s9,1
    50c4:	fef5f2e3          	bgeu	a1,a5,50a8 <_vfiprintf_r+0x1ac>
    50c8:	fe068793          	add	a5,a3,-32
    50cc:	fafd7ee3          	bgeu	s10,a5,5088 <_vfiprintf_r+0x18c>
    50d0:	000d8e13          	mv	t3,s11
    50d4:	2c068663          	beqz	a3,53a0 <_vfiprintf_r+0x4a4>
    50d8:	0ad10623          	sb	a3,172(sp)
    50dc:	040101a3          	sb	zero,67(sp)
    50e0:	00100e93          	li	t4,1
    50e4:	00100d13          	li	s10,1
    50e8:	0ac10813          	add	a6,sp,172
    50ec:	00012823          	sw	zero,16(sp)
    50f0:	00000713          	li	a4,0
    50f4:	00000f93          	li	t6,0
    50f8:	06412603          	lw	a2,100(sp)
    50fc:	084e7293          	and	t0,t3,132
    5100:	06812783          	lw	a5,104(sp)
    5104:	00160593          	add	a1,a2,1 # 2001 <_malloc_r+0x7d1>
    5108:	00058f13          	mv	t5,a1
    510c:	00029663          	bnez	t0,5118 <_vfiprintf_r+0x21c>
    5110:	41d88db3          	sub	s11,a7,t4
    5114:	47b046e3          	bgtz	s11,5d80 <_vfiprintf_r+0xe84>
    5118:	04314583          	lbu	a1,67(sp)
    511c:	02058a63          	beqz	a1,5150 <_vfiprintf_r+0x254>
    5120:	04310613          	add	a2,sp,67
    5124:	00178793          	add	a5,a5,1
    5128:	00100693          	li	a3,1
    512c:	00cc2023          	sw	a2,0(s8)
    5130:	00dc2223          	sw	a3,4(s8)
    5134:	06f12423          	sw	a5,104(sp)
    5138:	07e12223          	sw	t5,100(sp)
    513c:	00700613          	li	a2,7
    5140:	35e64ce3          	blt	a2,t5,5c98 <_vfiprintf_r+0xd9c>
    5144:	000f0613          	mv	a2,t5
    5148:	008c0c13          	add	s8,s8,8
    514c:	001f0f13          	add	t5,t5,1
    5150:	080f8063          	beqz	t6,51d0 <_vfiprintf_r+0x2d4>
    5154:	00200613          	li	a2,2
    5158:	00278793          	add	a5,a5,2
    515c:	04410693          	add	a3,sp,68
    5160:	00cc2223          	sw	a2,4(s8)
    5164:	00dc2023          	sw	a3,0(s8)
    5168:	06f12423          	sw	a5,104(sp)
    516c:	07e12223          	sw	t5,100(sp)
    5170:	00700613          	li	a2,7
    5174:	3be652e3          	bge	a2,t5,5d18 <_vfiprintf_r+0xe1c>
    5178:	60078ae3          	beqz	a5,5f8c <_vfiprintf_r+0x1090>
    517c:	06010613          	add	a2,sp,96
    5180:	00098593          	mv	a1,s3
    5184:	00040513          	mv	a0,s0
    5188:	03d12c23          	sw	t4,56(sp)
    518c:	02e12423          	sw	a4,40(sp)
    5190:	03112223          	sw	a7,36(sp)
    5194:	03012023          	sw	a6,32(sp)
    5198:	00512e23          	sw	t0,28(sp)
    519c:	01c12c23          	sw	t3,24(sp)
    51a0:	c21ff0ef          	jal	4dc0 <__sprint_r.part.0>
    51a4:	22051463          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    51a8:	06412603          	lw	a2,100(sp)
    51ac:	06812783          	lw	a5,104(sp)
    51b0:	03812e83          	lw	t4,56(sp)
    51b4:	02812703          	lw	a4,40(sp)
    51b8:	02412883          	lw	a7,36(sp)
    51bc:	02012803          	lw	a6,32(sp)
    51c0:	01c12283          	lw	t0,28(sp)
    51c4:	01812e03          	lw	t3,24(sp)
    51c8:	000a0c13          	mv	s8,s4
    51cc:	00160f13          	add	t5,a2,1
    51d0:	08000593          	li	a1,128
    51d4:	06b286e3          	beq	t0,a1,5a40 <_vfiprintf_r+0xb44>
    51d8:	41a70733          	sub	a4,a4,s10
    51dc:	1ae04ae3          	bgtz	a4,5b90 <_vfiprintf_r+0xc94>
    51e0:	00fd07b3          	add	a5,s10,a5
    51e4:	010c2023          	sw	a6,0(s8)
    51e8:	01ac2223          	sw	s10,4(s8)
    51ec:	06f12423          	sw	a5,104(sp)
    51f0:	07e12223          	sw	t5,100(sp)
    51f4:	00700713          	li	a4,7
    51f8:	03e758e3          	bge	a4,t5,5a28 <_vfiprintf_r+0xb2c>
    51fc:	24078063          	beqz	a5,543c <_vfiprintf_r+0x540>
    5200:	06010613          	add	a2,sp,96
    5204:	00098593          	mv	a1,s3
    5208:	00040513          	mv	a0,s0
    520c:	03d12023          	sw	t4,32(sp)
    5210:	01112e23          	sw	a7,28(sp)
    5214:	01c12c23          	sw	t3,24(sp)
    5218:	ba9ff0ef          	jal	4dc0 <__sprint_r.part.0>
    521c:	1a051863          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5220:	06812783          	lw	a5,104(sp)
    5224:	02012e83          	lw	t4,32(sp)
    5228:	01c12883          	lw	a7,28(sp)
    522c:	01812e03          	lw	t3,24(sp)
    5230:	000a0c13          	mv	s8,s4
    5234:	004e7e13          	and	t3,t3,4
    5238:	000e0663          	beqz	t3,5244 <_vfiprintf_r+0x348>
    523c:	41d88db3          	sub	s11,a7,t4
    5240:	21b04a63          	bgtz	s11,5454 <_vfiprintf_r+0x558>
    5244:	01d8d463          	bge	a7,t4,524c <_vfiprintf_r+0x350>
    5248:	000e8893          	mv	a7,t4
    524c:	00c12703          	lw	a4,12(sp)
    5250:	01170733          	add	a4,a4,a7
    5254:	00e12623          	sw	a4,12(sp)
    5258:	16079063          	bnez	a5,53b8 <_vfiprintf_r+0x4bc>
    525c:	01012783          	lw	a5,16(sp)
    5260:	06012223          	sw	zero,100(sp)
    5264:	00078863          	beqz	a5,5274 <_vfiprintf_r+0x378>
    5268:	00078593          	mv	a1,a5
    526c:	00040513          	mv	a0,s0
    5270:	ab4fc0ef          	jal	1524 <_free_r>
    5274:	000a0c13          	mv	s8,s4
    5278:	d9dff06f          	j	5014 <_vfiprintf_r+0x118>
    527c:	00098593          	mv	a1,s3
    5280:	00040513          	mv	a0,s0
    5284:	4b0020ef          	jal	7734 <__swsetup_r>
    5288:	00050463          	beqz	a0,5290 <_vfiprintf_r+0x394>
    528c:	3840106f          	j	6610 <_vfiprintf_r+0x1714>
    5290:	00c99783          	lh	a5,12(s3)
    5294:	00a00693          	li	a3,10
    5298:	01a7f713          	and	a4,a5,26
    529c:	d0d718e3          	bne	a4,a3,4fac <_vfiprintf_r+0xb0>
    52a0:	00e99703          	lh	a4,14(s3)
    52a4:	d00744e3          	bltz	a4,4fac <_vfiprintf_r+0xb0>
    52a8:	0649a703          	lw	a4,100(s3)
    52ac:	00177713          	and	a4,a4,1
    52b0:	00071863          	bnez	a4,52c0 <_vfiprintf_r+0x3c4>
    52b4:	2007f793          	and	a5,a5,512
    52b8:	00079463          	bnez	a5,52c0 <_vfiprintf_r+0x3c4>
    52bc:	2ac0106f          	j	6568 <_vfiprintf_r+0x166c>
    52c0:	000a8693          	mv	a3,s5
    52c4:	000c0613          	mv	a2,s8
    52c8:	00098593          	mv	a1,s3
    52cc:	00040513          	mv	a0,s0
    52d0:	3e4010ef          	jal	66b4 <__sbprintf>
    52d4:	14c12083          	lw	ra,332(sp)
    52d8:	14812403          	lw	s0,328(sp)
    52dc:	00a12623          	sw	a0,12(sp)
    52e0:	00c12503          	lw	a0,12(sp)
    52e4:	13c12983          	lw	s3,316(sp)
    52e8:	13412a83          	lw	s5,308(sp)
    52ec:	12812c03          	lw	s8,296(sp)
    52f0:	15010113          	add	sp,sp,336
    52f4:	00008067          	ret
    52f8:	000aa883          	lw	a7,0(s5)
    52fc:	004a8a93          	add	s5,s5,4
    5300:	3608cc63          	bltz	a7,5678 <_vfiprintf_r+0x77c>
    5304:	000cc683          	lbu	a3,0(s9)
    5308:	d75ff06f          	j	507c <_vfiprintf_r+0x180>
    530c:	000cc683          	lbu	a3,0(s9)
    5310:	020ded93          	or	s11,s11,32
    5314:	d69ff06f          	j	507c <_vfiprintf_r+0x180>
    5318:	00800613          	li	a2,8
    531c:	00000593          	li	a1,0
    5320:	05010513          	add	a0,sp,80
    5324:	db1fb0ef          	jal	10d4 <memset>
    5328:	00100513          	li	a0,1
    532c:	00ad8db3          	add	s11,s11,a0
    5330:	ce9ff06f          	j	5018 <_vfiprintf_r+0x11c>
    5334:	00050d13          	mv	s10,a0
    5338:	419d87b3          	sub	a5,s11,s9
    533c:	079d8263          	beq	s11,s9,53a0 <_vfiprintf_r+0x4a4>
    5340:	06812683          	lw	a3,104(sp)
    5344:	06412703          	lw	a4,100(sp)
    5348:	019c2023          	sw	s9,0(s8)
    534c:	00d786b3          	add	a3,a5,a3
    5350:	00170713          	add	a4,a4,1
    5354:	00fc2223          	sw	a5,4(s8)
    5358:	06d12423          	sw	a3,104(sp)
    535c:	06e12223          	sw	a4,100(sp)
    5360:	00700613          	li	a2,7
    5364:	008c0c13          	add	s8,s8,8
    5368:	02e65463          	bge	a2,a4,5390 <_vfiprintf_r+0x494>
    536c:	38068ce3          	beqz	a3,5f04 <_vfiprintf_r+0x1008>
    5370:	06010613          	add	a2,sp,96
    5374:	00098593          	mv	a1,s3
    5378:	00040513          	mv	a0,s0
    537c:	00f12823          	sw	a5,16(sp)
    5380:	a41ff0ef          	jal	4dc0 <__sprint_r.part.0>
    5384:	01012783          	lw	a5,16(sp)
    5388:	04051c63          	bnez	a0,53e0 <_vfiprintf_r+0x4e4>
    538c:	000a0c13          	mv	s8,s4
    5390:	00c12703          	lw	a4,12(sp)
    5394:	00f707b3          	add	a5,a4,a5
    5398:	00f12623          	sw	a5,12(sp)
    539c:	cc0d10e3          	bnez	s10,505c <_vfiprintf_r+0x160>
    53a0:	06812783          	lw	a5,104(sp)
    53a4:	00078463          	beqz	a5,53ac <_vfiprintf_r+0x4b0>
    53a8:	22c0106f          	j	65d4 <_vfiprintf_r+0x16d8>
    53ac:	00c99783          	lh	a5,12(s3)
    53b0:	06012223          	sw	zero,100(sp)
    53b4:	0300006f          	j	53e4 <_vfiprintf_r+0x4e8>
    53b8:	06010613          	add	a2,sp,96
    53bc:	00098593          	mv	a1,s3
    53c0:	00040513          	mv	a0,s0
    53c4:	9fdff0ef          	jal	4dc0 <__sprint_r.part.0>
    53c8:	e8050ae3          	beqz	a0,525c <_vfiprintf_r+0x360>
    53cc:	01012783          	lw	a5,16(sp)
    53d0:	00078863          	beqz	a5,53e0 <_vfiprintf_r+0x4e4>
    53d4:	01012583          	lw	a1,16(sp)
    53d8:	00040513          	mv	a0,s0
    53dc:	948fc0ef          	jal	1524 <_free_r>
    53e0:	00c99783          	lh	a5,12(s3)
    53e4:	0649a703          	lw	a4,100(s3)
    53e8:	00177713          	and	a4,a4,1
    53ec:	16070a63          	beqz	a4,5560 <_vfiprintf_r+0x664>
    53f0:	0407f793          	and	a5,a5,64
    53f4:	14412483          	lw	s1,324(sp)
    53f8:	14012903          	lw	s2,320(sp)
    53fc:	13812a03          	lw	s4,312(sp)
    5400:	13012b03          	lw	s6,304(sp)
    5404:	12c12b83          	lw	s7,300(sp)
    5408:	12412c83          	lw	s9,292(sp)
    540c:	12012d03          	lw	s10,288(sp)
    5410:	11c12d83          	lw	s11,284(sp)
    5414:	00078463          	beqz	a5,541c <_vfiprintf_r+0x520>
    5418:	2180106f          	j	6630 <_vfiprintf_r+0x1734>
    541c:	14c12083          	lw	ra,332(sp)
    5420:	14812403          	lw	s0,328(sp)
    5424:	00c12503          	lw	a0,12(sp)
    5428:	13c12983          	lw	s3,316(sp)
    542c:	13412a83          	lw	s5,308(sp)
    5430:	12812c03          	lw	s8,296(sp)
    5434:	15010113          	add	sp,sp,336
    5438:	00008067          	ret
    543c:	06012223          	sw	zero,100(sp)
    5440:	004e7e13          	and	t3,t3,4
    5444:	240e0ee3          	beqz	t3,5ea0 <_vfiprintf_r+0xfa4>
    5448:	41d88db3          	sub	s11,a7,t4
    544c:	25b05ae3          	blez	s11,5ea0 <_vfiprintf_r+0xfa4>
    5450:	000a0c13          	mv	s8,s4
    5454:	01000713          	li	a4,16
    5458:	06412683          	lw	a3,100(sp)
    545c:	01b74463          	blt	a4,s11,5464 <_vfiprintf_r+0x568>
    5460:	1900106f          	j	65f0 <_vfiprintf_r+0x16f4>
    5464:	000a8713          	mv	a4,s5
    5468:	0000a317          	auipc	t1,0xa
    546c:	4a030313          	add	t1,t1,1184 # f908 <blanks.1>
    5470:	000c0593          	mv	a1,s8
    5474:	000d8a93          	mv	s5,s11
    5478:	01000813          	li	a6,16
    547c:	00700d13          	li	s10,7
    5480:	01112c23          	sw	a7,24(sp)
    5484:	01d12e23          	sw	t4,28(sp)
    5488:	00030c13          	mv	s8,t1
    548c:	00070d93          	mv	s11,a4
    5490:	0180006f          	j	54a8 <_vfiprintf_r+0x5ac>
    5494:	00268613          	add	a2,a3,2
    5498:	00858593          	add	a1,a1,8
    549c:	00070693          	mv	a3,a4
    54a0:	ff0a8a93          	add	s5,s5,-16
    54a4:	05585a63          	bge	a6,s5,54f8 <_vfiprintf_r+0x5fc>
    54a8:	01078793          	add	a5,a5,16
    54ac:	00168713          	add	a4,a3,1
    54b0:	0185a023          	sw	s8,0(a1)
    54b4:	0105a223          	sw	a6,4(a1)
    54b8:	06f12423          	sw	a5,104(sp)
    54bc:	06e12223          	sw	a4,100(sp)
    54c0:	fced5ae3          	bge	s10,a4,5494 <_vfiprintf_r+0x598>
    54c4:	56078663          	beqz	a5,5a30 <_vfiprintf_r+0xb34>
    54c8:	06010613          	add	a2,sp,96
    54cc:	00098593          	mv	a1,s3
    54d0:	00040513          	mv	a0,s0
    54d4:	8edff0ef          	jal	4dc0 <__sprint_r.part.0>
    54d8:	ee051ae3          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    54dc:	06412683          	lw	a3,100(sp)
    54e0:	01000813          	li	a6,16
    54e4:	ff0a8a93          	add	s5,s5,-16
    54e8:	06812783          	lw	a5,104(sp)
    54ec:	000a0593          	mv	a1,s4
    54f0:	00168613          	add	a2,a3,1
    54f4:	fb584ae3          	blt	a6,s5,54a8 <_vfiprintf_r+0x5ac>
    54f8:	01812883          	lw	a7,24(sp)
    54fc:	01c12e83          	lw	t4,28(sp)
    5500:	000d8713          	mv	a4,s11
    5504:	000c0313          	mv	t1,s8
    5508:	000a8d93          	mv	s11,s5
    550c:	00058c13          	mv	s8,a1
    5510:	00070a93          	mv	s5,a4
    5514:	01b787b3          	add	a5,a5,s11
    5518:	006c2023          	sw	t1,0(s8)
    551c:	01bc2223          	sw	s11,4(s8)
    5520:	06f12423          	sw	a5,104(sp)
    5524:	06c12223          	sw	a2,100(sp)
    5528:	00700713          	li	a4,7
    552c:	d0c75ce3          	bge	a4,a2,5244 <_vfiprintf_r+0x348>
    5530:	160788e3          	beqz	a5,5ea0 <_vfiprintf_r+0xfa4>
    5534:	06010613          	add	a2,sp,96
    5538:	00098593          	mv	a1,s3
    553c:	00040513          	mv	a0,s0
    5540:	01d12e23          	sw	t4,28(sp)
    5544:	01112c23          	sw	a7,24(sp)
    5548:	879ff0ef          	jal	4dc0 <__sprint_r.part.0>
    554c:	e80510e3          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5550:	06812783          	lw	a5,104(sp)
    5554:	01c12e83          	lw	t4,28(sp)
    5558:	01812883          	lw	a7,24(sp)
    555c:	ce9ff06f          	j	5244 <_vfiprintf_r+0x348>
    5560:	2007f713          	and	a4,a5,512
    5564:	e80716e3          	bnez	a4,53f0 <_vfiprintf_r+0x4f4>
    5568:	0589a503          	lw	a0,88(s3)
    556c:	b65fb0ef          	jal	10d0 <__retarget_lock_release_recursive>
    5570:	00c99783          	lh	a5,12(s3)
    5574:	e7dff06f          	j	53f0 <_vfiprintf_r+0x4f4>
    5578:	000aa803          	lw	a6,0(s5)
    557c:	040101a3          	sb	zero,67(sp)
    5580:	000d8e13          	mv	t3,s11
    5584:	004a8a93          	add	s5,s5,4
    5588:	68080ae3          	beqz	a6,641c <_vfiprintf_r+0x1520>
    558c:	05300793          	li	a5,83
    5590:	3cf68ce3          	beq	a3,a5,6168 <_vfiprintf_r+0x126c>
    5594:	010df793          	and	a5,s11,16
    5598:	3c0798e3          	bnez	a5,6168 <_vfiprintf_r+0x126c>
    559c:	00075463          	bgez	a4,55a4 <_vfiprintf_r+0x6a8>
    55a0:	7fd0006f          	j	659c <_vfiprintf_r+0x16a0>
    55a4:	00070613          	mv	a2,a4
    55a8:	00080513          	mv	a0,a6
    55ac:	00000593          	li	a1,0
    55b0:	03112223          	sw	a7,36(sp)
    55b4:	00e12e23          	sw	a4,28(sp)
    55b8:	01012c23          	sw	a6,24(sp)
    55bc:	03b12023          	sw	s11,32(sp)
    55c0:	4e4020ef          	jal	7aa4 <memchr>
    55c4:	00a12823          	sw	a0,16(sp)
    55c8:	01812803          	lw	a6,24(sp)
    55cc:	01c12703          	lw	a4,28(sp)
    55d0:	02012e03          	lw	t3,32(sp)
    55d4:	02412883          	lw	a7,36(sp)
    55d8:	00051463          	bnez	a0,55e0 <_vfiprintf_r+0x6e4>
    55dc:	7990006f          	j	6574 <_vfiprintf_r+0x1678>
    55e0:	41050d33          	sub	s10,a0,a6
    55e4:	fffd4e93          	not	t4,s10
    55e8:	41fede93          	sra	t4,t4,0x1f
    55ec:	01dd7eb3          	and	t4,s10,t4
    55f0:	00012823          	sw	zero,16(sp)
    55f4:	6dd0006f          	j	64d0 <_vfiprintf_r+0x15d4>
    55f8:	04300793          	li	a5,67
    55fc:	000d8e13          	mv	t3,s11
    5600:	004a8d93          	add	s11,s5,4
    5604:	00f68663          	beq	a3,a5,5610 <_vfiprintf_r+0x714>
    5608:	010e7793          	and	a5,t3,16
    560c:	280788e3          	beqz	a5,609c <_vfiprintf_r+0x11a0>
    5610:	00800613          	li	a2,8
    5614:	00000593          	li	a1,0
    5618:	05810513          	add	a0,sp,88
    561c:	01112e23          	sw	a7,28(sp)
    5620:	01c12c23          	sw	t3,24(sp)
    5624:	ab1fb0ef          	jal	10d4 <memset>
    5628:	000aa603          	lw	a2,0(s5)
    562c:	0ac10593          	add	a1,sp,172
    5630:	05810693          	add	a3,sp,88
    5634:	00040513          	mv	a0,s0
    5638:	00b12823          	sw	a1,16(sp)
    563c:	694050ef          	jal	acd0 <_wcrtomb_r>
    5640:	fff00793          	li	a5,-1
    5644:	01012583          	lw	a1,16(sp)
    5648:	01812e03          	lw	t3,24(sp)
    564c:	01c12883          	lw	a7,28(sp)
    5650:	00050d13          	mv	s10,a0
    5654:	00f51463          	bne	a0,a5,565c <_vfiprintf_r+0x760>
    5658:	0200106f          	j	6678 <_vfiprintf_r+0x177c>
    565c:	fff54e93          	not	t4,a0
    5660:	41fede93          	sra	t4,t4,0x1f
    5664:	01d57eb3          	and	t4,a0,t4
    5668:	040101a3          	sb	zero,67(sp)
    566c:	000d8a93          	mv	s5,s11
    5670:	00058813          	mv	a6,a1
    5674:	a79ff06f          	j	50ec <_vfiprintf_r+0x1f0>
    5678:	411008b3          	neg	a7,a7
    567c:	000cc683          	lbu	a3,0(s9)
    5680:	004ded93          	or	s11,s11,4
    5684:	9f9ff06f          	j	507c <_vfiprintf_r+0x180>
    5688:	010dee13          	or	t3,s11,16
    568c:	020e7793          	and	a5,t3,32
    5690:	0c0788e3          	beqz	a5,5f60 <_vfiprintf_r+0x1064>
    5694:	007a8a93          	add	s5,s5,7
    5698:	ff8afa93          	and	s5,s5,-8
    569c:	004aa683          	lw	a3,4(s5)
    56a0:	000aad83          	lw	s11,0(s5)
    56a4:	008a8a93          	add	s5,s5,8
    56a8:	00068d13          	mv	s10,a3
    56ac:	3006c263          	bltz	a3,59b0 <_vfiprintf_r+0xab4>
    56b0:	32074063          	bltz	a4,59d0 <_vfiprintf_r+0xad4>
    56b4:	01ade6b3          	or	a3,s11,s10
    56b8:	f7fe7e13          	and	t3,t3,-129
    56bc:	30069a63          	bnez	a3,59d0 <_vfiprintf_r+0xad4>
    56c0:	68071ae3          	bnez	a4,6554 <_vfiprintf_r+0x1658>
    56c4:	04314783          	lbu	a5,67(sp)
    56c8:	00012823          	sw	zero,16(sp)
    56cc:	00000e93          	li	t4,0
    56d0:	00000d13          	li	s10,0
    56d4:	11010813          	add	a6,sp,272
    56d8:	00078463          	beqz	a5,56e0 <_vfiprintf_r+0x7e4>
    56dc:	001e8e93          	add	t4,t4,1
    56e0:	002e7f93          	and	t6,t3,2
    56e4:	a00f8ae3          	beqz	t6,50f8 <_vfiprintf_r+0x1fc>
    56e8:	002e8e93          	add	t4,t4,2
    56ec:	00200f93          	li	t6,2
    56f0:	a09ff06f          	j	50f8 <_vfiprintf_r+0x1fc>
    56f4:	000cc683          	lbu	a3,0(s9)
    56f8:	06800793          	li	a5,104
    56fc:	4ef686e3          	beq	a3,a5,63e8 <_vfiprintf_r+0x14ec>
    5700:	040ded93          	or	s11,s11,64
    5704:	979ff06f          	j	507c <_vfiprintf_r+0x180>
    5708:	010de613          	or	a2,s11,16
    570c:	02067793          	and	a5,a2,32
    5710:	000780e3          	beqz	a5,5f10 <_vfiprintf_r+0x1014>
    5714:	007a8a93          	add	s5,s5,7
    5718:	ff8afa93          	and	s5,s5,-8
    571c:	000aad83          	lw	s11,0(s5)
    5720:	004aad03          	lw	s10,4(s5)
    5724:	008a8a93          	add	s5,s5,8
    5728:	040101a3          	sb	zero,67(sp)
    572c:	00060e13          	mv	t3,a2
    5730:	2a074063          	bltz	a4,59d0 <_vfiprintf_r+0xad4>
    5734:	01ade6b3          	or	a3,s11,s10
    5738:	f7f67e13          	and	t3,a2,-129
    573c:	28069a63          	bnez	a3,59d0 <_vfiprintf_r+0xad4>
    5740:	00100793          	li	a5,1
    5744:	06071e63          	bnez	a4,57c0 <_vfiprintf_r+0x8c4>
    5748:	f6079ee3          	bnez	a5,56c4 <_vfiprintf_r+0x7c8>
    574c:	00167d13          	and	s10,a2,1
    5750:	0a0d0ce3          	beqz	s10,6008 <_vfiprintf_r+0x110c>
    5754:	03000793          	li	a5,48
    5758:	10f107a3          	sb	a5,271(sp)
    575c:	000d0e93          	mv	t4,s10
    5760:	10f10813          	add	a6,sp,271
    5764:	2980006f          	j	59fc <_vfiprintf_r+0xb00>
    5768:	02b00793          	li	a5,43
    576c:	000cc683          	lbu	a3,0(s9)
    5770:	04f101a3          	sb	a5,67(sp)
    5774:	909ff06f          	j	507c <_vfiprintf_r+0x180>
    5778:	010de693          	or	a3,s11,16
    577c:	0206f793          	and	a5,a3,32
    5780:	7a078c63          	beqz	a5,5f38 <_vfiprintf_r+0x103c>
    5784:	007a8a93          	add	s5,s5,7
    5788:	ff8afa93          	and	s5,s5,-8
    578c:	000aa783          	lw	a5,0(s5)
    5790:	004aa583          	lw	a1,4(s5)
    5794:	008a8a93          	add	s5,s5,8
    5798:	040101a3          	sb	zero,67(sp)
    579c:	bff6fe13          	and	t3,a3,-1025
    57a0:	02074c63          	bltz	a4,57d8 <_vfiprintf_r+0x8dc>
    57a4:	00b7e633          	or	a2,a5,a1
    57a8:	b7f6f693          	and	a3,a3,-1153
    57ac:	420610e3          	bnez	a2,63cc <_vfiprintf_r+0x14d0>
    57b0:	000e0613          	mv	a2,t3
    57b4:	00000793          	li	a5,0
    57b8:	00068e13          	mv	t3,a3
    57bc:	f80706e3          	beqz	a4,5748 <_vfiprintf_r+0x84c>
    57c0:	00100693          	li	a3,1
    57c4:	58d788e3          	beq	a5,a3,6554 <_vfiprintf_r+0x1658>
    57c8:	00200693          	li	a3,2
    57cc:	46d786e3          	beq	a5,a3,6438 <_vfiprintf_r+0x153c>
    57d0:	00000793          	li	a5,0
    57d4:	00000593          	li	a1,0
    57d8:	11010813          	add	a6,sp,272
    57dc:	01d59613          	sll	a2,a1,0x1d
    57e0:	0077f693          	and	a3,a5,7
    57e4:	0037d793          	srl	a5,a5,0x3
    57e8:	03068693          	add	a3,a3,48
    57ec:	00f667b3          	or	a5,a2,a5
    57f0:	0035d593          	srl	a1,a1,0x3
    57f4:	fed80fa3          	sb	a3,-1(a6)
    57f8:	00b7e633          	or	a2,a5,a1
    57fc:	00080513          	mv	a0,a6
    5800:	fff80813          	add	a6,a6,-1
    5804:	fc061ce3          	bnez	a2,57dc <_vfiprintf_r+0x8e0>
    5808:	001e7793          	and	a5,t3,1
    580c:	54078e63          	beqz	a5,5d68 <_vfiprintf_r+0xe6c>
    5810:	03000793          	li	a5,48
    5814:	54f68a63          	beq	a3,a5,5d68 <_vfiprintf_r+0xe6c>
    5818:	ffe50513          	add	a0,a0,-2
    581c:	fef80fa3          	sb	a5,-1(a6)
    5820:	11010793          	add	a5,sp,272
    5824:	40a78d33          	sub	s10,a5,a0
    5828:	00070e93          	mv	t4,a4
    582c:	09a744e3          	blt	a4,s10,60b4 <_vfiprintf_r+0x11b8>
    5830:	00050813          	mv	a6,a0
    5834:	1c80006f          	j	59fc <_vfiprintf_r+0xb00>
    5838:	000086b7          	lui	a3,0x8
    583c:	83068693          	add	a3,a3,-2000 # 7830 <__swsetup_r+0xfc>
    5840:	04d11223          	sh	a3,68(sp)
    5844:	0000a697          	auipc	a3,0xa
    5848:	a4068693          	add	a3,a3,-1472 # f284 <__fini_array_end+0x20c>
    584c:	000aa783          	lw	a5,0(s5)
    5850:	00000593          	li	a1,0
    5854:	002dee13          	or	t3,s11,2
    5858:	004a8a93          	add	s5,s5,4
    585c:	00d12a23          	sw	a3,20(sp)
    5860:	040101a3          	sb	zero,67(sp)
    5864:	4c074863          	bltz	a4,5d34 <_vfiprintf_r+0xe38>
    5868:	00b7e6b3          	or	a3,a5,a1
    586c:	f7fe7513          	and	a0,t3,-129
    5870:	4a069c63          	bnez	a3,5d28 <_vfiprintf_r+0xe2c>
    5874:	000e0613          	mv	a2,t3
    5878:	00200793          	li	a5,2
    587c:	00050e13          	mv	t3,a0
    5880:	ec5ff06f          	j	5744 <_vfiprintf_r+0x848>
    5884:	00040513          	mv	a0,s0
    5888:	00e12c23          	sw	a4,24(sp)
    588c:	01112823          	sw	a7,16(sp)
    5890:	390020ef          	jal	7c20 <_localeconv_r>
    5894:	00452783          	lw	a5,4(a0)
    5898:	00078513          	mv	a0,a5
    589c:	02f12a23          	sw	a5,52(sp)
    58a0:	ab5fb0ef          	jal	1354 <strlen>
    58a4:	00050793          	mv	a5,a0
    58a8:	00040513          	mv	a0,s0
    58ac:	02f12823          	sw	a5,48(sp)
    58b0:	370020ef          	jal	7c20 <_localeconv_r>
    58b4:	00852703          	lw	a4,8(a0)
    58b8:	03012783          	lw	a5,48(sp)
    58bc:	01012883          	lw	a7,16(sp)
    58c0:	02e12623          	sw	a4,44(sp)
    58c4:	01812703          	lw	a4,24(sp)
    58c8:	a2078ee3          	beqz	a5,5304 <_vfiprintf_r+0x408>
    58cc:	02c12783          	lw	a5,44(sp)
    58d0:	000cc683          	lbu	a3,0(s9)
    58d4:	fa078463          	beqz	a5,507c <_vfiprintf_r+0x180>
    58d8:	0007c783          	lbu	a5,0(a5)
    58dc:	fa078063          	beqz	a5,507c <_vfiprintf_r+0x180>
    58e0:	400ded93          	or	s11,s11,1024
    58e4:	f98ff06f          	j	507c <_vfiprintf_r+0x180>
    58e8:	020df793          	and	a5,s11,32
    58ec:	78079263          	bnez	a5,6070 <_vfiprintf_r+0x1174>
    58f0:	010df793          	and	a5,s11,16
    58f4:	30079ae3          	bnez	a5,6408 <_vfiprintf_r+0x150c>
    58f8:	040df793          	and	a5,s11,64
    58fc:	400796e3          	bnez	a5,6508 <_vfiprintf_r+0x160c>
    5900:	200dfe13          	and	t3,s11,512
    5904:	300e02e3          	beqz	t3,6408 <_vfiprintf_r+0x150c>
    5908:	000aa783          	lw	a5,0(s5)
    590c:	00c12703          	lw	a4,12(sp)
    5910:	004a8a93          	add	s5,s5,4
    5914:	00e78023          	sb	a4,0(a5)
    5918:	efcff06f          	j	5014 <_vfiprintf_r+0x118>
    591c:	000cc683          	lbu	a3,0(s9)
    5920:	06c00793          	li	a5,108
    5924:	2cf68ae3          	beq	a3,a5,63f8 <_vfiprintf_r+0x14fc>
    5928:	010ded93          	or	s11,s11,16
    592c:	f50ff06f          	j	507c <_vfiprintf_r+0x180>
    5930:	000cc683          	lbu	a3,0(s9)
    5934:	080ded93          	or	s11,s11,128
    5938:	f44ff06f          	j	507c <_vfiprintf_r+0x180>
    593c:	000cc683          	lbu	a3,0(s9)
    5940:	02a00793          	li	a5,42
    5944:	001c8593          	add	a1,s9,1
    5948:	54f680e3          	beq	a3,a5,6688 <_vfiprintf_r+0x178c>
    594c:	fd068793          	add	a5,a3,-48
    5950:	00900613          	li	a2,9
    5954:	00000713          	li	a4,0
    5958:	00900513          	li	a0,9
    595c:	02f66463          	bltu	a2,a5,5984 <_vfiprintf_r+0xa88>
    5960:	0005c683          	lbu	a3,0(a1)
    5964:	00271613          	sll	a2,a4,0x2
    5968:	00e60733          	add	a4,a2,a4
    596c:	00171713          	sll	a4,a4,0x1
    5970:	00f70733          	add	a4,a4,a5
    5974:	fd068793          	add	a5,a3,-48
    5978:	00158593          	add	a1,a1,1
    597c:	fef572e3          	bgeu	a0,a5,5960 <_vfiprintf_r+0xa64>
    5980:	74074063          	bltz	a4,60c0 <_vfiprintf_r+0x11c4>
    5984:	00058c93          	mv	s9,a1
    5988:	ef8ff06f          	j	5080 <_vfiprintf_r+0x184>
    598c:	000cc683          	lbu	a3,0(s9)
    5990:	001ded93          	or	s11,s11,1
    5994:	ee8ff06f          	j	507c <_vfiprintf_r+0x180>
    5998:	04314783          	lbu	a5,67(sp)
    599c:	000cc683          	lbu	a3,0(s9)
    59a0:	ec079e63          	bnez	a5,507c <_vfiprintf_r+0x180>
    59a4:	02000793          	li	a5,32
    59a8:	04f101a3          	sb	a5,67(sp)
    59ac:	ed0ff06f          	j	507c <_vfiprintf_r+0x180>
    59b0:	02d00613          	li	a2,45
    59b4:	01b036b3          	snez	a3,s11
    59b8:	41a000b3          	neg	ra,s10
    59bc:	04c101a3          	sb	a2,67(sp)
    59c0:	40d08d33          	sub	s10,ra,a3
    59c4:	41b00db3          	neg	s11,s11
    59c8:	00074463          	bltz	a4,59d0 <_vfiprintf_r+0xad4>
    59cc:	f7fe7e13          	and	t3,t3,-129
    59d0:	120d14e3          	bnez	s10,62f8 <_vfiprintf_r+0x13fc>
    59d4:	00900693          	li	a3,9
    59d8:	13b6e0e3          	bltu	a3,s11,62f8 <_vfiprintf_r+0x13fc>
    59dc:	030d8793          	add	a5,s11,48
    59e0:	0ff7f793          	zext.b	a5,a5
    59e4:	10f107a3          	sb	a5,271(sp)
    59e8:	00070e93          	mv	t4,a4
    59ec:	00e04463          	bgtz	a4,59f4 <_vfiprintf_r+0xaf8>
    59f0:	00100e93          	li	t4,1
    59f4:	00100d13          	li	s10,1
    59f8:	10f10813          	add	a6,sp,271
    59fc:	04314783          	lbu	a5,67(sp)
    5a00:	00012823          	sw	zero,16(sp)
    5a04:	cc079ce3          	bnez	a5,56dc <_vfiprintf_r+0x7e0>
    5a08:	cd9ff06f          	j	56e0 <_vfiprintf_r+0x7e4>
    5a0c:	00100713          	li	a4,1
    5a10:	000d0793          	mv	a5,s10
    5a14:	07012623          	sw	a6,108(sp)
    5a18:	07a12823          	sw	s10,112(sp)
    5a1c:	07a12423          	sw	s10,104(sp)
    5a20:	06e12223          	sw	a4,100(sp)
    5a24:	000a0c13          	mv	s8,s4
    5a28:	008c0c13          	add	s8,s8,8
    5a2c:	809ff06f          	j	5234 <_vfiprintf_r+0x338>
    5a30:	00100613          	li	a2,1
    5a34:	00000693          	li	a3,0
    5a38:	000a0593          	mv	a1,s4
    5a3c:	a65ff06f          	j	54a0 <_vfiprintf_r+0x5a4>
    5a40:	41d88db3          	sub	s11,a7,t4
    5a44:	f9b05a63          	blez	s11,51d8 <_vfiprintf_r+0x2dc>
    5a48:	01000593          	li	a1,16
    5a4c:	3bb5dae3          	bge	a1,s11,6600 <_vfiprintf_r+0x1704>
    5a50:	0000af97          	auipc	t6,0xa
    5a54:	ea8f8f93          	add	t6,t6,-344 # f8f8 <zeroes.0>
    5a58:	02e12223          	sw	a4,36(sp)
    5a5c:	000a8713          	mv	a4,s5
    5a60:	000c0693          	mv	a3,s8
    5a64:	000d8a93          	mv	s5,s11
    5a68:	01000f13          	li	t5,16
    5a6c:	00700293          	li	t0,7
    5a70:	01c12c23          	sw	t3,24(sp)
    5a74:	01012e23          	sw	a6,28(sp)
    5a78:	03112023          	sw	a7,32(sp)
    5a7c:	03d12423          	sw	t4,40(sp)
    5a80:	000f8c13          	mv	s8,t6
    5a84:	00070d93          	mv	s11,a4
    5a88:	0180006f          	j	5aa0 <_vfiprintf_r+0xba4>
    5a8c:	00260513          	add	a0,a2,2
    5a90:	00868693          	add	a3,a3,8
    5a94:	00070613          	mv	a2,a4
    5a98:	ff0a8a93          	add	s5,s5,-16
    5a9c:	055f5c63          	bge	t5,s5,5af4 <_vfiprintf_r+0xbf8>
    5aa0:	01078793          	add	a5,a5,16
    5aa4:	00160713          	add	a4,a2,1
    5aa8:	0186a023          	sw	s8,0(a3)
    5aac:	01e6a223          	sw	t5,4(a3)
    5ab0:	06f12423          	sw	a5,104(sp)
    5ab4:	06e12223          	sw	a4,100(sp)
    5ab8:	fce2dae3          	bge	t0,a4,5a8c <_vfiprintf_r+0xb90>
    5abc:	1c078663          	beqz	a5,5c88 <_vfiprintf_r+0xd8c>
    5ac0:	06010613          	add	a2,sp,96
    5ac4:	00098593          	mv	a1,s3
    5ac8:	00040513          	mv	a0,s0
    5acc:	af4ff0ef          	jal	4dc0 <__sprint_r.part.0>
    5ad0:	8e051ee3          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5ad4:	06412603          	lw	a2,100(sp)
    5ad8:	01000f13          	li	t5,16
    5adc:	ff0a8a93          	add	s5,s5,-16
    5ae0:	06812783          	lw	a5,104(sp)
    5ae4:	000a0693          	mv	a3,s4
    5ae8:	00160513          	add	a0,a2,1
    5aec:	00700293          	li	t0,7
    5af0:	fb5f48e3          	blt	t5,s5,5aa0 <_vfiprintf_r+0xba4>
    5af4:	01812e03          	lw	t3,24(sp)
    5af8:	01c12803          	lw	a6,28(sp)
    5afc:	02012883          	lw	a7,32(sp)
    5b00:	02412703          	lw	a4,36(sp)
    5b04:	02812e83          	lw	t4,40(sp)
    5b08:	000d8613          	mv	a2,s11
    5b0c:	000c0f93          	mv	t6,s8
    5b10:	000a8d93          	mv	s11,s5
    5b14:	00068c13          	mv	s8,a3
    5b18:	00060a93          	mv	s5,a2
    5b1c:	01b787b3          	add	a5,a5,s11
    5b20:	01fc2023          	sw	t6,0(s8)
    5b24:	01bc2223          	sw	s11,4(s8)
    5b28:	06f12423          	sw	a5,104(sp)
    5b2c:	06a12223          	sw	a0,100(sp)
    5b30:	00700613          	li	a2,7
    5b34:	4ea65863          	bge	a2,a0,6024 <_vfiprintf_r+0x1128>
    5b38:	1a0786e3          	beqz	a5,64e4 <_vfiprintf_r+0x15e8>
    5b3c:	06010613          	add	a2,sp,96
    5b40:	00098593          	mv	a1,s3
    5b44:	00040513          	mv	a0,s0
    5b48:	03d12423          	sw	t4,40(sp)
    5b4c:	02e12223          	sw	a4,36(sp)
    5b50:	03112023          	sw	a7,32(sp)
    5b54:	01012e23          	sw	a6,28(sp)
    5b58:	01c12c23          	sw	t3,24(sp)
    5b5c:	a64ff0ef          	jal	4dc0 <__sprint_r.part.0>
    5b60:	860516e3          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5b64:	02412703          	lw	a4,36(sp)
    5b68:	06412603          	lw	a2,100(sp)
    5b6c:	06812783          	lw	a5,104(sp)
    5b70:	41a70733          	sub	a4,a4,s10
    5b74:	02812e83          	lw	t4,40(sp)
    5b78:	02012883          	lw	a7,32(sp)
    5b7c:	01c12803          	lw	a6,28(sp)
    5b80:	01812e03          	lw	t3,24(sp)
    5b84:	000a0c13          	mv	s8,s4
    5b88:	00160f13          	add	t5,a2,1
    5b8c:	e4e05a63          	blez	a4,51e0 <_vfiprintf_r+0x2e4>
    5b90:	01000593          	li	a1,16
    5b94:	0000af97          	auipc	t6,0xa
    5b98:	d64f8f93          	add	t6,t6,-668 # f8f8 <zeroes.0>
    5b9c:	0ae5da63          	bge	a1,a4,5c50 <_vfiprintf_r+0xd54>
    5ba0:	000c0593          	mv	a1,s8
    5ba4:	03512423          	sw	s5,40(sp)
    5ba8:	01000d93          	li	s11,16
    5bac:	00700293          	li	t0,7
    5bb0:	01c12c23          	sw	t3,24(sp)
    5bb4:	01012e23          	sw	a6,28(sp)
    5bb8:	03112023          	sw	a7,32(sp)
    5bbc:	03d12223          	sw	t4,36(sp)
    5bc0:	00070a93          	mv	s5,a4
    5bc4:	000b0c13          	mv	s8,s6
    5bc8:	0180006f          	j	5be0 <_vfiprintf_r+0xce4>
    5bcc:	00260f13          	add	t5,a2,2
    5bd0:	00858593          	add	a1,a1,8
    5bd4:	00068613          	mv	a2,a3
    5bd8:	ff0a8a93          	add	s5,s5,-16
    5bdc:	055dda63          	bge	s11,s5,5c30 <_vfiprintf_r+0xd34>
    5be0:	01078793          	add	a5,a5,16
    5be4:	00160693          	add	a3,a2,1
    5be8:	0165a023          	sw	s6,0(a1)
    5bec:	01b5a223          	sw	s11,4(a1)
    5bf0:	06f12423          	sw	a5,104(sp)
    5bf4:	06d12223          	sw	a3,100(sp)
    5bf8:	fcd2dae3          	bge	t0,a3,5bcc <_vfiprintf_r+0xcd0>
    5bfc:	06078e63          	beqz	a5,5c78 <_vfiprintf_r+0xd7c>
    5c00:	06010613          	add	a2,sp,96
    5c04:	00098593          	mv	a1,s3
    5c08:	00040513          	mv	a0,s0
    5c0c:	9b4ff0ef          	jal	4dc0 <__sprint_r.part.0>
    5c10:	fa051e63          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5c14:	06412603          	lw	a2,100(sp)
    5c18:	ff0a8a93          	add	s5,s5,-16
    5c1c:	06812783          	lw	a5,104(sp)
    5c20:	000a0593          	mv	a1,s4
    5c24:	00160f13          	add	t5,a2,1
    5c28:	00700293          	li	t0,7
    5c2c:	fb5dcae3          	blt	s11,s5,5be0 <_vfiprintf_r+0xce4>
    5c30:	000a8713          	mv	a4,s5
    5c34:	01812e03          	lw	t3,24(sp)
    5c38:	01c12803          	lw	a6,28(sp)
    5c3c:	02012883          	lw	a7,32(sp)
    5c40:	02412e83          	lw	t4,36(sp)
    5c44:	02812a83          	lw	s5,40(sp)
    5c48:	000c0f93          	mv	t6,s8
    5c4c:	00058c13          	mv	s8,a1
    5c50:	00e787b3          	add	a5,a5,a4
    5c54:	00ec2223          	sw	a4,4(s8)
    5c58:	01fc2023          	sw	t6,0(s8)
    5c5c:	06f12423          	sw	a5,104(sp)
    5c60:	07e12223          	sw	t5,100(sp)
    5c64:	00700713          	li	a4,7
    5c68:	25e74863          	blt	a4,t5,5eb8 <_vfiprintf_r+0xfbc>
    5c6c:	008c0c13          	add	s8,s8,8
    5c70:	001f0f13          	add	t5,t5,1
    5c74:	d6cff06f          	j	51e0 <_vfiprintf_r+0x2e4>
    5c78:	00100f13          	li	t5,1
    5c7c:	00000613          	li	a2,0
    5c80:	000a0593          	mv	a1,s4
    5c84:	f55ff06f          	j	5bd8 <_vfiprintf_r+0xcdc>
    5c88:	00100513          	li	a0,1
    5c8c:	00000613          	li	a2,0
    5c90:	000a0693          	mv	a3,s4
    5c94:	e05ff06f          	j	5a98 <_vfiprintf_r+0xb9c>
    5c98:	06078263          	beqz	a5,5cfc <_vfiprintf_r+0xe00>
    5c9c:	06010613          	add	a2,sp,96
    5ca0:	00098593          	mv	a1,s3
    5ca4:	00040513          	mv	a0,s0
    5ca8:	03d12e23          	sw	t4,60(sp)
    5cac:	02e12c23          	sw	a4,56(sp)
    5cb0:	03112423          	sw	a7,40(sp)
    5cb4:	03012223          	sw	a6,36(sp)
    5cb8:	02512023          	sw	t0,32(sp)
    5cbc:	01f12e23          	sw	t6,28(sp)
    5cc0:	01c12c23          	sw	t3,24(sp)
    5cc4:	8fcff0ef          	jal	4dc0 <__sprint_r.part.0>
    5cc8:	f0051263          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5ccc:	06412603          	lw	a2,100(sp)
    5cd0:	06812783          	lw	a5,104(sp)
    5cd4:	03c12e83          	lw	t4,60(sp)
    5cd8:	03812703          	lw	a4,56(sp)
    5cdc:	02812883          	lw	a7,40(sp)
    5ce0:	02412803          	lw	a6,36(sp)
    5ce4:	02012283          	lw	t0,32(sp)
    5ce8:	01c12f83          	lw	t6,28(sp)
    5cec:	01812e03          	lw	t3,24(sp)
    5cf0:	000a0c13          	mv	s8,s4
    5cf4:	00160f13          	add	t5,a2,1
    5cf8:	c58ff06f          	j	5150 <_vfiprintf_r+0x254>
    5cfc:	380f8863          	beqz	t6,608c <_vfiprintf_r+0x1190>
    5d00:	04410793          	add	a5,sp,68
    5d04:	06f12623          	sw	a5,108(sp)
    5d08:	00200793          	li	a5,2
    5d0c:	06f12823          	sw	a5,112(sp)
    5d10:	00100f13          	li	t5,1
    5d14:	000a0c13          	mv	s8,s4
    5d18:	000f0613          	mv	a2,t5
    5d1c:	008c0c13          	add	s8,s8,8
    5d20:	001f0f13          	add	t5,t5,1
    5d24:	cacff06f          	j	51d0 <_vfiprintf_r+0x2d4>
    5d28:	00200693          	li	a3,2
    5d2c:	00050e13          	mv	t3,a0
    5d30:	aa0684e3          	beqz	a3,57d8 <_vfiprintf_r+0x8dc>
    5d34:	01412503          	lw	a0,20(sp)
    5d38:	11010813          	add	a6,sp,272
    5d3c:	00f7f693          	and	a3,a5,15
    5d40:	00d506b3          	add	a3,a0,a3
    5d44:	0006c603          	lbu	a2,0(a3)
    5d48:	0047d793          	srl	a5,a5,0x4
    5d4c:	01c59693          	sll	a3,a1,0x1c
    5d50:	00f6e7b3          	or	a5,a3,a5
    5d54:	0045d593          	srl	a1,a1,0x4
    5d58:	fec80fa3          	sb	a2,-1(a6)
    5d5c:	00b7e6b3          	or	a3,a5,a1
    5d60:	fff80813          	add	a6,a6,-1
    5d64:	fc069ce3          	bnez	a3,5d3c <_vfiprintf_r+0xe40>
    5d68:	11010793          	add	a5,sp,272
    5d6c:	41078d33          	sub	s10,a5,a6
    5d70:	00070e93          	mv	t4,a4
    5d74:	c9a754e3          	bge	a4,s10,59fc <_vfiprintf_r+0xb00>
    5d78:	000d0e93          	mv	t4,s10
    5d7c:	c81ff06f          	j	59fc <_vfiprintf_r+0xb00>
    5d80:	01000513          	li	a0,16
    5d84:	01b554e3          	bge	a0,s11,658c <_vfiprintf_r+0x1690>
    5d88:	000a8693          	mv	a3,s5
    5d8c:	0000a317          	auipc	t1,0xa
    5d90:	b7c30313          	add	t1,t1,-1156 # f908 <blanks.1>
    5d94:	02e12c23          	sw	a4,56(sp)
    5d98:	000d8a93          	mv	s5,s11
    5d9c:	000c0713          	mv	a4,s8
    5da0:	01000f13          	li	t5,16
    5da4:	00700393          	li	t2,7
    5da8:	01c12c23          	sw	t3,24(sp)
    5dac:	01f12e23          	sw	t6,28(sp)
    5db0:	02512023          	sw	t0,32(sp)
    5db4:	03012223          	sw	a6,36(sp)
    5db8:	03112423          	sw	a7,40(sp)
    5dbc:	03d12e23          	sw	t4,60(sp)
    5dc0:	00030c13          	mv	s8,t1
    5dc4:	00068d93          	mv	s11,a3
    5dc8:	01c0006f          	j	5de4 <_vfiprintf_r+0xee8>
    5dcc:	00260513          	add	a0,a2,2
    5dd0:	00870713          	add	a4,a4,8
    5dd4:	00058613          	mv	a2,a1
    5dd8:	ff0a8a93          	add	s5,s5,-16
    5ddc:	055f5c63          	bge	t5,s5,5e34 <_vfiprintf_r+0xf38>
    5de0:	00160593          	add	a1,a2,1
    5de4:	01078793          	add	a5,a5,16
    5de8:	01872023          	sw	s8,0(a4)
    5dec:	01e72223          	sw	t5,4(a4)
    5df0:	06f12423          	sw	a5,104(sp)
    5df4:	06b12223          	sw	a1,100(sp)
    5df8:	fcb3dae3          	bge	t2,a1,5dcc <_vfiprintf_r+0xed0>
    5dfc:	08078a63          	beqz	a5,5e90 <_vfiprintf_r+0xf94>
    5e00:	06010613          	add	a2,sp,96
    5e04:	00098593          	mv	a1,s3
    5e08:	00040513          	mv	a0,s0
    5e0c:	fb5fe0ef          	jal	4dc0 <__sprint_r.part.0>
    5e10:	da051e63          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5e14:	06412603          	lw	a2,100(sp)
    5e18:	01000f13          	li	t5,16
    5e1c:	ff0a8a93          	add	s5,s5,-16
    5e20:	06812783          	lw	a5,104(sp)
    5e24:	000a0713          	mv	a4,s4
    5e28:	00160513          	add	a0,a2,1
    5e2c:	00700393          	li	t2,7
    5e30:	fb5f48e3          	blt	t5,s5,5de0 <_vfiprintf_r+0xee4>
    5e34:	000c0313          	mv	t1,s8
    5e38:	01812e03          	lw	t3,24(sp)
    5e3c:	00070c13          	mv	s8,a4
    5e40:	01c12f83          	lw	t6,28(sp)
    5e44:	02012283          	lw	t0,32(sp)
    5e48:	02412803          	lw	a6,36(sp)
    5e4c:	02812883          	lw	a7,40(sp)
    5e50:	03c12e83          	lw	t4,60(sp)
    5e54:	03812703          	lw	a4,56(sp)
    5e58:	000d8693          	mv	a3,s11
    5e5c:	000a8d93          	mv	s11,s5
    5e60:	00068a93          	mv	s5,a3
    5e64:	01b787b3          	add	a5,a5,s11
    5e68:	006c2023          	sw	t1,0(s8)
    5e6c:	01bc2223          	sw	s11,4(s8)
    5e70:	06f12423          	sw	a5,104(sp)
    5e74:	06a12223          	sw	a0,100(sp)
    5e78:	00700613          	li	a2,7
    5e7c:	12a64063          	blt	a2,a0,5f9c <_vfiprintf_r+0x10a0>
    5e80:	008c0c13          	add	s8,s8,8
    5e84:	00150f13          	add	t5,a0,1
    5e88:	00050613          	mv	a2,a0
    5e8c:	a8cff06f          	j	5118 <_vfiprintf_r+0x21c>
    5e90:	00000613          	li	a2,0
    5e94:	00100513          	li	a0,1
    5e98:	000a0713          	mv	a4,s4
    5e9c:	f3dff06f          	j	5dd8 <_vfiprintf_r+0xedc>
    5ea0:	01d8d463          	bge	a7,t4,5ea8 <_vfiprintf_r+0xfac>
    5ea4:	000e8893          	mv	a7,t4
    5ea8:	00c12783          	lw	a5,12(sp)
    5eac:	011787b3          	add	a5,a5,a7
    5eb0:	00f12623          	sw	a5,12(sp)
    5eb4:	ba8ff06f          	j	525c <_vfiprintf_r+0x360>
    5eb8:	b4078ae3          	beqz	a5,5a0c <_vfiprintf_r+0xb10>
    5ebc:	06010613          	add	a2,sp,96
    5ec0:	00098593          	mv	a1,s3
    5ec4:	00040513          	mv	a0,s0
    5ec8:	03d12223          	sw	t4,36(sp)
    5ecc:	03112023          	sw	a7,32(sp)
    5ed0:	01012e23          	sw	a6,28(sp)
    5ed4:	01c12c23          	sw	t3,24(sp)
    5ed8:	ee9fe0ef          	jal	4dc0 <__sprint_r.part.0>
    5edc:	ce051863          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5ee0:	06412f03          	lw	t5,100(sp)
    5ee4:	06812783          	lw	a5,104(sp)
    5ee8:	02412e83          	lw	t4,36(sp)
    5eec:	02012883          	lw	a7,32(sp)
    5ef0:	01c12803          	lw	a6,28(sp)
    5ef4:	01812e03          	lw	t3,24(sp)
    5ef8:	000a0c13          	mv	s8,s4
    5efc:	001f0f13          	add	t5,t5,1
    5f00:	ae0ff06f          	j	51e0 <_vfiprintf_r+0x2e4>
    5f04:	06012223          	sw	zero,100(sp)
    5f08:	000a0c13          	mv	s8,s4
    5f0c:	c84ff06f          	j	5390 <_vfiprintf_r+0x494>
    5f10:	01067693          	and	a3,a2,16
    5f14:	000aa783          	lw	a5,0(s5)
    5f18:	004a8a93          	add	s5,s5,4
    5f1c:	12069c63          	bnez	a3,6054 <_vfiprintf_r+0x1158>
    5f20:	04067693          	and	a3,a2,64
    5f24:	12068463          	beqz	a3,604c <_vfiprintf_r+0x1150>
    5f28:	01079d93          	sll	s11,a5,0x10
    5f2c:	010ddd93          	srl	s11,s11,0x10
    5f30:	00000d13          	li	s10,0
    5f34:	ff4ff06f          	j	5728 <_vfiprintf_r+0x82c>
    5f38:	0106f613          	and	a2,a3,16
    5f3c:	000aa783          	lw	a5,0(s5)
    5f40:	004a8a93          	add	s5,s5,4
    5f44:	12061263          	bnez	a2,6068 <_vfiprintf_r+0x116c>
    5f48:	0406f613          	and	a2,a3,64
    5f4c:	10060a63          	beqz	a2,6060 <_vfiprintf_r+0x1164>
    5f50:	01079793          	sll	a5,a5,0x10
    5f54:	0107d793          	srl	a5,a5,0x10
    5f58:	00000593          	li	a1,0
    5f5c:	83dff06f          	j	5798 <_vfiprintf_r+0x89c>
    5f60:	010e7693          	and	a3,t3,16
    5f64:	000aa783          	lw	a5,0(s5)
    5f68:	004a8a93          	add	s5,s5,4
    5f6c:	0c069863          	bnez	a3,603c <_vfiprintf_r+0x1140>
    5f70:	040e7693          	and	a3,t3,64
    5f74:	0c068063          	beqz	a3,6034 <_vfiprintf_r+0x1138>
    5f78:	01079d93          	sll	s11,a5,0x10
    5f7c:	410ddd93          	sra	s11,s11,0x10
    5f80:	41fddd13          	sra	s10,s11,0x1f
    5f84:	000d0693          	mv	a3,s10
    5f88:	f24ff06f          	j	56ac <_vfiprintf_r+0x7b0>
    5f8c:	00100f13          	li	t5,1
    5f90:	00000613          	li	a2,0
    5f94:	000a0c13          	mv	s8,s4
    5f98:	a38ff06f          	j	51d0 <_vfiprintf_r+0x2d4>
    5f9c:	1a078463          	beqz	a5,6144 <_vfiprintf_r+0x1248>
    5fa0:	06010613          	add	a2,sp,96
    5fa4:	00098593          	mv	a1,s3
    5fa8:	00040513          	mv	a0,s0
    5fac:	03d12e23          	sw	t4,60(sp)
    5fb0:	02e12c23          	sw	a4,56(sp)
    5fb4:	03112423          	sw	a7,40(sp)
    5fb8:	03012223          	sw	a6,36(sp)
    5fbc:	02512023          	sw	t0,32(sp)
    5fc0:	01f12e23          	sw	t6,28(sp)
    5fc4:	01c12c23          	sw	t3,24(sp)
    5fc8:	df9fe0ef          	jal	4dc0 <__sprint_r.part.0>
    5fcc:	c0051063          	bnez	a0,53cc <_vfiprintf_r+0x4d0>
    5fd0:	06412603          	lw	a2,100(sp)
    5fd4:	06812783          	lw	a5,104(sp)
    5fd8:	03c12e83          	lw	t4,60(sp)
    5fdc:	03812703          	lw	a4,56(sp)
    5fe0:	02812883          	lw	a7,40(sp)
    5fe4:	02412803          	lw	a6,36(sp)
    5fe8:	02012283          	lw	t0,32(sp)
    5fec:	01c12f83          	lw	t6,28(sp)
    5ff0:	01812e03          	lw	t3,24(sp)
    5ff4:	000a0c13          	mv	s8,s4
    5ff8:	00160f13          	add	t5,a2,1
    5ffc:	91cff06f          	j	5118 <_vfiprintf_r+0x21c>
    6000:	000d8e13          	mv	t3,s11
    6004:	e88ff06f          	j	568c <_vfiprintf_r+0x790>
    6008:	00000e93          	li	t4,0
    600c:	11010813          	add	a6,sp,272
    6010:	9edff06f          	j	59fc <_vfiprintf_r+0xb00>
    6014:	0589a503          	lw	a0,88(s3)
    6018:	8b4fb0ef          	jal	10cc <__retarget_lock_acquire_recursive>
    601c:	00c99783          	lh	a5,12(s3)
    6020:	f41fe06f          	j	4f60 <_vfiprintf_r+0x64>
    6024:	008c0c13          	add	s8,s8,8
    6028:	00150f13          	add	t5,a0,1
    602c:	00050613          	mv	a2,a0
    6030:	9a8ff06f          	j	51d8 <_vfiprintf_r+0x2dc>
    6034:	200e7693          	and	a3,t3,512
    6038:	50069463          	bnez	a3,6540 <_vfiprintf_r+0x1644>
    603c:	41f7dd13          	sra	s10,a5,0x1f
    6040:	00078d93          	mv	s11,a5
    6044:	000d0693          	mv	a3,s10
    6048:	e64ff06f          	j	56ac <_vfiprintf_r+0x7b0>
    604c:	20067693          	and	a3,a2,512
    6050:	4c069663          	bnez	a3,651c <_vfiprintf_r+0x1620>
    6054:	00078d93          	mv	s11,a5
    6058:	00000d13          	li	s10,0
    605c:	eccff06f          	j	5728 <_vfiprintf_r+0x82c>
    6060:	2006f613          	and	a2,a3,512
    6064:	4c061863          	bnez	a2,6534 <_vfiprintf_r+0x1638>
    6068:	00000593          	li	a1,0
    606c:	f2cff06f          	j	5798 <_vfiprintf_r+0x89c>
    6070:	00c12683          	lw	a3,12(sp)
    6074:	000aa783          	lw	a5,0(s5)
    6078:	004a8a93          	add	s5,s5,4
    607c:	41f6d713          	sra	a4,a3,0x1f
    6080:	00d7a023          	sw	a3,0(a5)
    6084:	00e7a223          	sw	a4,4(a5)
    6088:	f8dfe06f          	j	5014 <_vfiprintf_r+0x118>
    608c:	00000613          	li	a2,0
    6090:	00100f13          	li	t5,1
    6094:	000a0c13          	mv	s8,s4
    6098:	938ff06f          	j	51d0 <_vfiprintf_r+0x2d4>
    609c:	000aa783          	lw	a5,0(s5)
    60a0:	00100e93          	li	t4,1
    60a4:	00100d13          	li	s10,1
    60a8:	0af10623          	sb	a5,172(sp)
    60ac:	0ac10593          	add	a1,sp,172
    60b0:	db8ff06f          	j	5668 <_vfiprintf_r+0x76c>
    60b4:	000d0e93          	mv	t4,s10
    60b8:	00050813          	mv	a6,a0
    60bc:	941ff06f          	j	59fc <_vfiprintf_r+0xb00>
    60c0:	fff00713          	li	a4,-1
    60c4:	00058c93          	mv	s9,a1
    60c8:	fb9fe06f          	j	5080 <_vfiprintf_r+0x184>
    60cc:	000d8613          	mv	a2,s11
    60d0:	e3cff06f          	j	570c <_vfiprintf_r+0x810>
    60d4:	00009797          	auipc	a5,0x9
    60d8:	1c478793          	add	a5,a5,452 # f298 <__fini_array_end+0x220>
    60dc:	000d8e13          	mv	t3,s11
    60e0:	00f12a23          	sw	a5,20(sp)
    60e4:	020e7793          	and	a5,t3,32
    60e8:	1c078c63          	beqz	a5,62c0 <_vfiprintf_r+0x13c4>
    60ec:	007a8a93          	add	s5,s5,7
    60f0:	ff8afa93          	and	s5,s5,-8
    60f4:	000aa783          	lw	a5,0(s5)
    60f8:	004aa583          	lw	a1,4(s5)
    60fc:	008a8a93          	add	s5,s5,8
    6100:	001e7613          	and	a2,t3,1
    6104:	00060e63          	beqz	a2,6120 <_vfiprintf_r+0x1224>
    6108:	00b7e633          	or	a2,a5,a1
    610c:	00060a63          	beqz	a2,6120 <_vfiprintf_r+0x1224>
    6110:	03000613          	li	a2,48
    6114:	04c10223          	sb	a2,68(sp)
    6118:	04d102a3          	sb	a3,69(sp)
    611c:	002e6e13          	or	t3,t3,2
    6120:	bffe7e13          	and	t3,t3,-1025
    6124:	f3cff06f          	j	5860 <_vfiprintf_r+0x964>
    6128:	000d8693          	mv	a3,s11
    612c:	e50ff06f          	j	577c <_vfiprintf_r+0x880>
    6130:	00009797          	auipc	a5,0x9
    6134:	15478793          	add	a5,a5,340 # f284 <__fini_array_end+0x20c>
    6138:	000d8e13          	mv	t3,s11
    613c:	00f12a23          	sw	a5,20(sp)
    6140:	fa5ff06f          	j	60e4 <_vfiprintf_r+0x11e8>
    6144:	04314603          	lbu	a2,67(sp)
    6148:	3a060a63          	beqz	a2,64fc <_vfiprintf_r+0x1600>
    614c:	04310793          	add	a5,sp,67
    6150:	06f12623          	sw	a5,108(sp)
    6154:	00100793          	li	a5,1
    6158:	06f12823          	sw	a5,112(sp)
    615c:	00100f13          	li	t5,1
    6160:	000a0c13          	mv	s8,s4
    6164:	fe1fe06f          	j	5144 <_vfiprintf_r+0x248>
    6168:	00800613          	li	a2,8
    616c:	00000593          	li	a1,0
    6170:	05810513          	add	a0,sp,88
    6174:	02e12023          	sw	a4,32(sp)
    6178:	01112e23          	sw	a7,28(sp)
    617c:	01c12c23          	sw	t3,24(sp)
    6180:	05012623          	sw	a6,76(sp)
    6184:	01012823          	sw	a6,16(sp)
    6188:	f4dfa0ef          	jal	10d4 <memset>
    618c:	02012703          	lw	a4,32(sp)
    6190:	01012803          	lw	a6,16(sp)
    6194:	01812e03          	lw	t3,24(sp)
    6198:	01c12883          	lw	a7,28(sp)
    619c:	2a074463          	bltz	a4,6444 <_vfiprintf_r+0x1548>
    61a0:	00000d93          	li	s11,0
    61a4:	00000d13          	li	s10,0
    61a8:	01812823          	sw	s8,16(sp)
    61ac:	01012e23          	sw	a6,28(sp)
    61b0:	000d8c13          	mv	s8,s11
    61b4:	03112023          	sw	a7,32(sp)
    61b8:	000c8d93          	mv	s11,s9
    61bc:	000a8c93          	mv	s9,s5
    61c0:	000d0a93          	mv	s5,s10
    61c4:	00098d13          	mv	s10,s3
    61c8:	00070993          	mv	s3,a4
    61cc:	0300006f          	j	61fc <_vfiprintf_r+0x1300>
    61d0:	05810693          	add	a3,sp,88
    61d4:	0ac10593          	add	a1,sp,172
    61d8:	00040513          	mv	a0,s0
    61dc:	2f5040ef          	jal	acd0 <_wcrtomb_r>
    61e0:	fff00793          	li	a5,-1
    61e4:	48f50063          	beq	a0,a5,6664 <_vfiprintf_r+0x1768>
    61e8:	00aa87b3          	add	a5,s5,a0
    61ec:	02f9c063          	blt	s3,a5,620c <_vfiprintf_r+0x1310>
    61f0:	004c0c13          	add	s8,s8,4
    61f4:	45378463          	beq	a5,s3,663c <_vfiprintf_r+0x1740>
    61f8:	00078a93          	mv	s5,a5
    61fc:	04c12783          	lw	a5,76(sp)
    6200:	018787b3          	add	a5,a5,s8
    6204:	0007a603          	lw	a2,0(a5)
    6208:	fc0614e3          	bnez	a2,61d0 <_vfiprintf_r+0x12d4>
    620c:	01012c03          	lw	s8,16(sp)
    6210:	01812e03          	lw	t3,24(sp)
    6214:	01c12803          	lw	a6,28(sp)
    6218:	02012883          	lw	a7,32(sp)
    621c:	000d0993          	mv	s3,s10
    6220:	000a8d13          	mv	s10,s5
    6224:	000c8a93          	mv	s5,s9
    6228:	000d8c93          	mv	s9,s11
    622c:	280d0e63          	beqz	s10,64c8 <_vfiprintf_r+0x15cc>
    6230:	06300793          	li	a5,99
    6234:	33a7d463          	bge	a5,s10,655c <_vfiprintf_r+0x1660>
    6238:	001d0593          	add	a1,s10,1
    623c:	00040513          	mv	a0,s0
    6240:	01112c23          	sw	a7,24(sp)
    6244:	01c12823          	sw	t3,16(sp)
    6248:	de8fb0ef          	jal	1830 <_malloc_r>
    624c:	01012e03          	lw	t3,16(sp)
    6250:	01812883          	lw	a7,24(sp)
    6254:	00050813          	mv	a6,a0
    6258:	42050063          	beqz	a0,6678 <_vfiprintf_r+0x177c>
    625c:	00a12823          	sw	a0,16(sp)
    6260:	00800613          	li	a2,8
    6264:	00000593          	li	a1,0
    6268:	05810513          	add	a0,sp,88
    626c:	03112023          	sw	a7,32(sp)
    6270:	01c12e23          	sw	t3,28(sp)
    6274:	01012c23          	sw	a6,24(sp)
    6278:	e5dfa0ef          	jal	10d4 <memset>
    627c:	01812803          	lw	a6,24(sp)
    6280:	05810713          	add	a4,sp,88
    6284:	000d0693          	mv	a3,s10
    6288:	00080593          	mv	a1,a6
    628c:	04c10613          	add	a2,sp,76
    6290:	00040513          	mv	a0,s0
    6294:	2c9040ef          	jal	ad5c <_wcsrtombs_r>
    6298:	01812803          	lw	a6,24(sp)
    629c:	01c12e03          	lw	t3,28(sp)
    62a0:	02012883          	lw	a7,32(sp)
    62a4:	40ad1063          	bne	s10,a0,66a4 <_vfiprintf_r+0x17a8>
    62a8:	fffd4e93          	not	t4,s10
    62ac:	01a807b3          	add	a5,a6,s10
    62b0:	41fede93          	sra	t4,t4,0x1f
    62b4:	00078023          	sb	zero,0(a5)
    62b8:	01dd7eb3          	and	t4,s10,t4
    62bc:	2140006f          	j	64d0 <_vfiprintf_r+0x15d4>
    62c0:	010e7613          	and	a2,t3,16
    62c4:	000aa783          	lw	a5,0(s5)
    62c8:	004a8a93          	add	s5,s5,4
    62cc:	02061263          	bnez	a2,62f0 <_vfiprintf_r+0x13f4>
    62d0:	040e7613          	and	a2,t3,64
    62d4:	00060a63          	beqz	a2,62e8 <_vfiprintf_r+0x13ec>
    62d8:	01079793          	sll	a5,a5,0x10
    62dc:	0107d793          	srl	a5,a5,0x10
    62e0:	00000593          	li	a1,0
    62e4:	e1dff06f          	j	6100 <_vfiprintf_r+0x1204>
    62e8:	200e7613          	and	a2,t3,512
    62ec:	22061e63          	bnez	a2,6528 <_vfiprintf_r+0x162c>
    62f0:	00000593          	li	a1,0
    62f4:	e0dff06f          	j	6100 <_vfiprintf_r+0x1204>
    62f8:	400e7793          	and	a5,t3,1024
    62fc:	00000693          	li	a3,0
    6300:	11010e93          	add	t4,sp,272
    6304:	01812823          	sw	s8,16(sp)
    6308:	02812223          	sw	s0,36(sp)
    630c:	03912c23          	sw	s9,56(sp)
    6310:	03512e23          	sw	s5,60(sp)
    6314:	02c12c83          	lw	s9,44(sp)
    6318:	01c12c23          	sw	t3,24(sp)
    631c:	01112e23          	sw	a7,28(sp)
    6320:	02e12023          	sw	a4,32(sp)
    6324:	00078c13          	mv	s8,a5
    6328:	00068413          	mv	s0,a3
    632c:	03312423          	sw	s3,40(sp)
    6330:	000e8a93          	mv	s5,t4
    6334:	0280006f          	j	635c <_vfiprintf_r+0x1460>
    6338:	00a00613          	li	a2,10
    633c:	00000693          	li	a3,0
    6340:	000d8513          	mv	a0,s11
    6344:	000d0593          	mv	a1,s10
    6348:	364050ef          	jal	b6ac <__udivdi3>
    634c:	220d0a63          	beqz	s10,6580 <_vfiprintf_r+0x1684>
    6350:	00050d93          	mv	s11,a0
    6354:	00058d13          	mv	s10,a1
    6358:	00098a93          	mv	s5,s3
    635c:	00a00613          	li	a2,10
    6360:	00000693          	li	a3,0
    6364:	000d8513          	mv	a0,s11
    6368:	000d0593          	mv	a1,s10
    636c:	1ed050ef          	jal	bd58 <__umoddi3>
    6370:	03050513          	add	a0,a0,48
    6374:	feaa8fa3          	sb	a0,-1(s5)
    6378:	fffa8993          	add	s3,s5,-1
    637c:	00140413          	add	s0,s0,1
    6380:	fa0c0ce3          	beqz	s8,6338 <_vfiprintf_r+0x143c>
    6384:	000cc783          	lbu	a5,0(s9)
    6388:	fa8798e3          	bne	a5,s0,6338 <_vfiprintf_r+0x143c>
    638c:	0ff00793          	li	a5,255
    6390:	faf404e3          	beq	s0,a5,6338 <_vfiprintf_r+0x143c>
    6394:	0e0d1a63          	bnez	s10,6488 <_vfiprintf_r+0x158c>
    6398:	00900793          	li	a5,9
    639c:	0fb7e663          	bltu	a5,s11,6488 <_vfiprintf_r+0x158c>
    63a0:	00098813          	mv	a6,s3
    63a4:	03912623          	sw	s9,44(sp)
    63a8:	01012c03          	lw	s8,16(sp)
    63ac:	01812e03          	lw	t3,24(sp)
    63b0:	01c12883          	lw	a7,28(sp)
    63b4:	02012703          	lw	a4,32(sp)
    63b8:	02412403          	lw	s0,36(sp)
    63bc:	02812983          	lw	s3,40(sp)
    63c0:	03812c83          	lw	s9,56(sp)
    63c4:	03c12a83          	lw	s5,60(sp)
    63c8:	9a1ff06f          	j	5d68 <_vfiprintf_r+0xe6c>
    63cc:	00068e13          	mv	t3,a3
    63d0:	00000693          	li	a3,0
    63d4:	c0068263          	beqz	a3,57d8 <_vfiprintf_r+0x8dc>
    63d8:	95dff06f          	j	5d34 <_vfiprintf_r+0xe38>
    63dc:	00040513          	mv	a0,s0
    63e0:	115000ef          	jal	6cf4 <__sinit>
    63e4:	b61fe06f          	j	4f44 <_vfiprintf_r+0x48>
    63e8:	001cc683          	lbu	a3,1(s9)
    63ec:	200ded93          	or	s11,s11,512
    63f0:	001c8c93          	add	s9,s9,1
    63f4:	c89fe06f          	j	507c <_vfiprintf_r+0x180>
    63f8:	001cc683          	lbu	a3,1(s9)
    63fc:	020ded93          	or	s11,s11,32
    6400:	001c8c93          	add	s9,s9,1
    6404:	c79fe06f          	j	507c <_vfiprintf_r+0x180>
    6408:	000aa783          	lw	a5,0(s5)
    640c:	00c12703          	lw	a4,12(sp)
    6410:	004a8a93          	add	s5,s5,4
    6414:	00e7a023          	sw	a4,0(a5)
    6418:	bfdfe06f          	j	5014 <_vfiprintf_r+0x118>
    641c:	00600793          	li	a5,6
    6420:	00070d13          	mv	s10,a4
    6424:	0ce7e863          	bltu	a5,a4,64f4 <_vfiprintf_r+0x15f8>
    6428:	000d0e93          	mv	t4,s10
    642c:	00009817          	auipc	a6,0x9
    6430:	e8080813          	add	a6,a6,-384 # f2ac <__fini_array_end+0x234>
    6434:	cb9fe06f          	j	50ec <_vfiprintf_r+0x1f0>
    6438:	00000793          	li	a5,0
    643c:	00000593          	li	a1,0
    6440:	8f5ff06f          	j	5d34 <_vfiprintf_r+0xe38>
    6444:	05810713          	add	a4,sp,88
    6448:	00000693          	li	a3,0
    644c:	04c10613          	add	a2,sp,76
    6450:	00000593          	li	a1,0
    6454:	00040513          	mv	a0,s0
    6458:	01112e23          	sw	a7,28(sp)
    645c:	01012c23          	sw	a6,24(sp)
    6460:	01c12823          	sw	t3,16(sp)
    6464:	0f9040ef          	jal	ad5c <_wcsrtombs_r>
    6468:	fff00793          	li	a5,-1
    646c:	01012e03          	lw	t3,16(sp)
    6470:	01812803          	lw	a6,24(sp)
    6474:	01c12883          	lw	a7,28(sp)
    6478:	00050d13          	mv	s10,a0
    647c:	1ef50e63          	beq	a0,a5,6678 <_vfiprintf_r+0x177c>
    6480:	05012623          	sw	a6,76(sp)
    6484:	da9ff06f          	j	622c <_vfiprintf_r+0x1330>
    6488:	03012783          	lw	a5,48(sp)
    648c:	03412583          	lw	a1,52(sp)
    6490:	00000413          	li	s0,0
    6494:	40f989b3          	sub	s3,s3,a5
    6498:	00078613          	mv	a2,a5
    649c:	00098513          	mv	a0,s3
    64a0:	6c8010ef          	jal	7b68 <strncpy>
    64a4:	001cc783          	lbu	a5,1(s9)
    64a8:	00a00613          	li	a2,10
    64ac:	00000693          	li	a3,0
    64b0:	00f037b3          	snez	a5,a5
    64b4:	000d8513          	mv	a0,s11
    64b8:	000d0593          	mv	a1,s10
    64bc:	00fc8cb3          	add	s9,s9,a5
    64c0:	1ec050ef          	jal	b6ac <__udivdi3>
    64c4:	e8dff06f          	j	6350 <_vfiprintf_r+0x1454>
    64c8:	00000e93          	li	t4,0
    64cc:	00012823          	sw	zero,16(sp)
    64d0:	04314783          	lbu	a5,67(sp)
    64d4:	00000713          	li	a4,0
    64d8:	00000f93          	li	t6,0
    64dc:	a0079063          	bnez	a5,56dc <_vfiprintf_r+0x7e0>
    64e0:	c19fe06f          	j	50f8 <_vfiprintf_r+0x1fc>
    64e4:	00100f13          	li	t5,1
    64e8:	00000613          	li	a2,0
    64ec:	000a0c13          	mv	s8,s4
    64f0:	ce9fe06f          	j	51d8 <_vfiprintf_r+0x2dc>
    64f4:	00600d13          	li	s10,6
    64f8:	f31ff06f          	j	6428 <_vfiprintf_r+0x152c>
    64fc:	00100f13          	li	t5,1
    6500:	000a0c13          	mv	s8,s4
    6504:	c4dfe06f          	j	5150 <_vfiprintf_r+0x254>
    6508:	000aa783          	lw	a5,0(s5)
    650c:	00c12703          	lw	a4,12(sp)
    6510:	004a8a93          	add	s5,s5,4
    6514:	00e79023          	sh	a4,0(a5)
    6518:	afdfe06f          	j	5014 <_vfiprintf_r+0x118>
    651c:	0ff7fd93          	zext.b	s11,a5
    6520:	00000d13          	li	s10,0
    6524:	a04ff06f          	j	5728 <_vfiprintf_r+0x82c>
    6528:	0ff7f793          	zext.b	a5,a5
    652c:	00000593          	li	a1,0
    6530:	bd1ff06f          	j	6100 <_vfiprintf_r+0x1204>
    6534:	0ff7f793          	zext.b	a5,a5
    6538:	00000593          	li	a1,0
    653c:	a5cff06f          	j	5798 <_vfiprintf_r+0x89c>
    6540:	01879d93          	sll	s11,a5,0x18
    6544:	418ddd93          	sra	s11,s11,0x18
    6548:	41fddd13          	sra	s10,s11,0x1f
    654c:	000d0693          	mv	a3,s10
    6550:	95cff06f          	j	56ac <_vfiprintf_r+0x7b0>
    6554:	03000793          	li	a5,48
    6558:	c8cff06f          	j	59e4 <_vfiprintf_r+0xae8>
    655c:	00012823          	sw	zero,16(sp)
    6560:	0ac10813          	add	a6,sp,172
    6564:	cfdff06f          	j	6260 <_vfiprintf_r+0x1364>
    6568:	0589a503          	lw	a0,88(s3)
    656c:	b65fa0ef          	jal	10d0 <__retarget_lock_release_recursive>
    6570:	d51fe06f          	j	52c0 <_vfiprintf_r+0x3c4>
    6574:	00070e93          	mv	t4,a4
    6578:	00070d13          	mv	s10,a4
    657c:	f55ff06f          	j	64d0 <_vfiprintf_r+0x15d4>
    6580:	00900793          	li	a5,9
    6584:	ddb7e6e3          	bltu	a5,s11,6350 <_vfiprintf_r+0x1454>
    6588:	e19ff06f          	j	63a0 <_vfiprintf_r+0x14a4>
    658c:	00058513          	mv	a0,a1
    6590:	00009317          	auipc	t1,0x9
    6594:	37830313          	add	t1,t1,888 # f908 <blanks.1>
    6598:	8cdff06f          	j	5e64 <_vfiprintf_r+0xf68>
    659c:	00080513          	mv	a0,a6
    65a0:	03112023          	sw	a7,32(sp)
    65a4:	01012c23          	sw	a6,24(sp)
    65a8:	01b12e23          	sw	s11,28(sp)
    65ac:	da9fa0ef          	jal	1354 <strlen>
    65b0:	fff54e93          	not	t4,a0
    65b4:	41fede93          	sra	t4,t4,0x1f
    65b8:	01812803          	lw	a6,24(sp)
    65bc:	01c12e03          	lw	t3,28(sp)
    65c0:	02012883          	lw	a7,32(sp)
    65c4:	00050d13          	mv	s10,a0
    65c8:	01d57eb3          	and	t4,a0,t4
    65cc:	00012823          	sw	zero,16(sp)
    65d0:	f01ff06f          	j	64d0 <_vfiprintf_r+0x15d4>
    65d4:	06010613          	add	a2,sp,96
    65d8:	00098593          	mv	a1,s3
    65dc:	00040513          	mv	a0,s0
    65e0:	fe0fe0ef          	jal	4dc0 <__sprint_r.part.0>
    65e4:	00051463          	bnez	a0,65ec <_vfiprintf_r+0x16f0>
    65e8:	dc5fe06f          	j	53ac <_vfiprintf_r+0x4b0>
    65ec:	df5fe06f          	j	53e0 <_vfiprintf_r+0x4e4>
    65f0:	00168613          	add	a2,a3,1
    65f4:	00009317          	auipc	t1,0x9
    65f8:	31430313          	add	t1,t1,788 # f908 <blanks.1>
    65fc:	f19fe06f          	j	5514 <_vfiprintf_r+0x618>
    6600:	000f0513          	mv	a0,t5
    6604:	00009f97          	auipc	t6,0x9
    6608:	2f4f8f93          	add	t6,t6,756 # f8f8 <zeroes.0>
    660c:	d10ff06f          	j	5b1c <_vfiprintf_r+0xc20>
    6610:	0649a783          	lw	a5,100(s3)
    6614:	0017f793          	and	a5,a5,1
    6618:	00079c63          	bnez	a5,6630 <_vfiprintf_r+0x1734>
    661c:	00c9d783          	lhu	a5,12(s3)
    6620:	2007f793          	and	a5,a5,512
    6624:	00079663          	bnez	a5,6630 <_vfiprintf_r+0x1734>
    6628:	0589a503          	lw	a0,88(s3)
    662c:	aa5fa0ef          	jal	10d0 <__retarget_lock_release_recursive>
    6630:	fff00793          	li	a5,-1
    6634:	00f12623          	sw	a5,12(sp)
    6638:	de5fe06f          	j	541c <_vfiprintf_r+0x520>
    663c:	00098713          	mv	a4,s3
    6640:	000c8a93          	mv	s5,s9
    6644:	000d0993          	mv	s3,s10
    6648:	01012c03          	lw	s8,16(sp)
    664c:	01812e03          	lw	t3,24(sp)
    6650:	01c12803          	lw	a6,28(sp)
    6654:	02012883          	lw	a7,32(sp)
    6658:	000d8c93          	mv	s9,s11
    665c:	00070d13          	mv	s10,a4
    6660:	bcdff06f          	j	622c <_vfiprintf_r+0x1330>
    6664:	00cd1783          	lh	a5,12(s10)
    6668:	000d0993          	mv	s3,s10
    666c:	0407e793          	or	a5,a5,64
    6670:	00fd1623          	sh	a5,12(s10)
    6674:	d71fe06f          	j	53e4 <_vfiprintf_r+0x4e8>
    6678:	00c99783          	lh	a5,12(s3)
    667c:	0407e793          	or	a5,a5,64
    6680:	00f99623          	sh	a5,12(s3)
    6684:	d61fe06f          	j	53e4 <_vfiprintf_r+0x4e8>
    6688:	000aa703          	lw	a4,0(s5)
    668c:	004a8a93          	add	s5,s5,4
    6690:	00075463          	bgez	a4,6698 <_vfiprintf_r+0x179c>
    6694:	fff00713          	li	a4,-1
    6698:	001cc683          	lbu	a3,1(s9)
    669c:	00058c93          	mv	s9,a1
    66a0:	9ddfe06f          	j	507c <_vfiprintf_r+0x180>
    66a4:	00c9d783          	lhu	a5,12(s3)
    66a8:	0407e793          	or	a5,a5,64
    66ac:	00f99623          	sh	a5,12(s3)
    66b0:	d1dfe06f          	j	53cc <_vfiprintf_r+0x4d0>

000066b4 <__sbprintf>:
    66b4:	b7010113          	add	sp,sp,-1168
    66b8:	00c59783          	lh	a5,12(a1)
    66bc:	00e5d703          	lhu	a4,14(a1)
    66c0:	48812423          	sw	s0,1160(sp)
    66c4:	00058413          	mv	s0,a1
    66c8:	000105b7          	lui	a1,0x10
    66cc:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x4a5>
    66d0:	06442303          	lw	t1,100(s0)
    66d4:	01c42883          	lw	a7,28(s0)
    66d8:	02442803          	lw	a6,36(s0)
    66dc:	01071713          	sll	a4,a4,0x10
    66e0:	00b7f7b3          	and	a5,a5,a1
    66e4:	00e7e7b3          	or	a5,a5,a4
    66e8:	40000593          	li	a1,1024
    66ec:	49212023          	sw	s2,1152(sp)
    66f0:	00f12a23          	sw	a5,20(sp)
    66f4:	00050913          	mv	s2,a0
    66f8:	07010793          	add	a5,sp,112
    66fc:	06010513          	add	a0,sp,96
    6700:	48112623          	sw	ra,1164(sp)
    6704:	48912223          	sw	s1,1156(sp)
    6708:	47312e23          	sw	s3,1148(sp)
    670c:	00060493          	mv	s1,a2
    6710:	00068993          	mv	s3,a3
    6714:	06612623          	sw	t1,108(sp)
    6718:	03112223          	sw	a7,36(sp)
    671c:	03012623          	sw	a6,44(sp)
    6720:	00f12423          	sw	a5,8(sp)
    6724:	00f12c23          	sw	a5,24(sp)
    6728:	00b12823          	sw	a1,16(sp)
    672c:	00b12e23          	sw	a1,28(sp)
    6730:	02012023          	sw	zero,32(sp)
    6734:	991fa0ef          	jal	10c4 <__retarget_lock_init_recursive>
    6738:	00048613          	mv	a2,s1
    673c:	00098693          	mv	a3,s3
    6740:	00810593          	add	a1,sp,8
    6744:	00090513          	mv	a0,s2
    6748:	fb4fe0ef          	jal	4efc <_vfiprintf_r>
    674c:	00050493          	mv	s1,a0
    6750:	04055263          	bgez	a0,6794 <__sbprintf+0xe0>
    6754:	01415783          	lhu	a5,20(sp)
    6758:	0407f793          	and	a5,a5,64
    675c:	00078863          	beqz	a5,676c <__sbprintf+0xb8>
    6760:	00c45783          	lhu	a5,12(s0)
    6764:	0407e793          	or	a5,a5,64
    6768:	00f41623          	sh	a5,12(s0)
    676c:	06012503          	lw	a0,96(sp)
    6770:	959fa0ef          	jal	10c8 <__retarget_lock_close_recursive>
    6774:	48c12083          	lw	ra,1164(sp)
    6778:	48812403          	lw	s0,1160(sp)
    677c:	48012903          	lw	s2,1152(sp)
    6780:	47c12983          	lw	s3,1148(sp)
    6784:	00048513          	mv	a0,s1
    6788:	48412483          	lw	s1,1156(sp)
    678c:	49010113          	add	sp,sp,1168
    6790:	00008067          	ret
    6794:	00810593          	add	a1,sp,8
    6798:	00090513          	mv	a0,s2
    679c:	25c000ef          	jal	69f8 <_fflush_r>
    67a0:	fa050ae3          	beqz	a0,6754 <__sbprintf+0xa0>
    67a4:	fff00493          	li	s1,-1
    67a8:	fadff06f          	j	6754 <__sbprintf+0xa0>

000067ac <__sflush_r>:
    67ac:	00c59703          	lh	a4,12(a1)
    67b0:	fe010113          	add	sp,sp,-32
    67b4:	00812c23          	sw	s0,24(sp)
    67b8:	01312623          	sw	s3,12(sp)
    67bc:	00112e23          	sw	ra,28(sp)
    67c0:	00877793          	and	a5,a4,8
    67c4:	00058413          	mv	s0,a1
    67c8:	00050993          	mv	s3,a0
    67cc:	12079063          	bnez	a5,68ec <__sflush_r+0x140>
    67d0:	000017b7          	lui	a5,0x1
    67d4:	80078793          	add	a5,a5,-2048 # 800 <main+0x2d8>
    67d8:	0045a683          	lw	a3,4(a1)
    67dc:	00f767b3          	or	a5,a4,a5
    67e0:	00f59623          	sh	a5,12(a1)
    67e4:	18d05263          	blez	a3,6968 <__sflush_r+0x1bc>
    67e8:	02842803          	lw	a6,40(s0)
    67ec:	0e080463          	beqz	a6,68d4 <__sflush_r+0x128>
    67f0:	00912a23          	sw	s1,20(sp)
    67f4:	01371693          	sll	a3,a4,0x13
    67f8:	0009a483          	lw	s1,0(s3)
    67fc:	0009a023          	sw	zero,0(s3)
    6800:	01c42583          	lw	a1,28(s0)
    6804:	1606ce63          	bltz	a3,6980 <__sflush_r+0x1d4>
    6808:	00000613          	li	a2,0
    680c:	00100693          	li	a3,1
    6810:	00098513          	mv	a0,s3
    6814:	000800e7          	jalr	a6
    6818:	fff00793          	li	a5,-1
    681c:	00050613          	mv	a2,a0
    6820:	1af50463          	beq	a0,a5,69c8 <__sflush_r+0x21c>
    6824:	00c41783          	lh	a5,12(s0)
    6828:	02842803          	lw	a6,40(s0)
    682c:	01c42583          	lw	a1,28(s0)
    6830:	0047f793          	and	a5,a5,4
    6834:	00078e63          	beqz	a5,6850 <__sflush_r+0xa4>
    6838:	00442703          	lw	a4,4(s0)
    683c:	03042783          	lw	a5,48(s0)
    6840:	40e60633          	sub	a2,a2,a4
    6844:	00078663          	beqz	a5,6850 <__sflush_r+0xa4>
    6848:	03c42783          	lw	a5,60(s0)
    684c:	40f60633          	sub	a2,a2,a5
    6850:	00000693          	li	a3,0
    6854:	00098513          	mv	a0,s3
    6858:	000800e7          	jalr	a6
    685c:	fff00793          	li	a5,-1
    6860:	12f51463          	bne	a0,a5,6988 <__sflush_r+0x1dc>
    6864:	0009a683          	lw	a3,0(s3)
    6868:	01d00793          	li	a5,29
    686c:	00c41703          	lh	a4,12(s0)
    6870:	16d7ea63          	bltu	a5,a3,69e4 <__sflush_r+0x238>
    6874:	204007b7          	lui	a5,0x20400
    6878:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    687c:	00d7d7b3          	srl	a5,a5,a3
    6880:	0017f793          	and	a5,a5,1
    6884:	16078063          	beqz	a5,69e4 <__sflush_r+0x238>
    6888:	01042603          	lw	a2,16(s0)
    688c:	fffff7b7          	lui	a5,0xfffff
    6890:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6894:	00f777b3          	and	a5,a4,a5
    6898:	00f41623          	sh	a5,12(s0)
    689c:	00042223          	sw	zero,4(s0)
    68a0:	00c42023          	sw	a2,0(s0)
    68a4:	01371793          	sll	a5,a4,0x13
    68a8:	0007d463          	bgez	a5,68b0 <__sflush_r+0x104>
    68ac:	10068263          	beqz	a3,69b0 <__sflush_r+0x204>
    68b0:	03042583          	lw	a1,48(s0)
    68b4:	0099a023          	sw	s1,0(s3)
    68b8:	10058463          	beqz	a1,69c0 <__sflush_r+0x214>
    68bc:	04040793          	add	a5,s0,64
    68c0:	00f58663          	beq	a1,a5,68cc <__sflush_r+0x120>
    68c4:	00098513          	mv	a0,s3
    68c8:	c5dfa0ef          	jal	1524 <_free_r>
    68cc:	01412483          	lw	s1,20(sp)
    68d0:	02042823          	sw	zero,48(s0)
    68d4:	00000513          	li	a0,0
    68d8:	01c12083          	lw	ra,28(sp)
    68dc:	01812403          	lw	s0,24(sp)
    68e0:	00c12983          	lw	s3,12(sp)
    68e4:	02010113          	add	sp,sp,32
    68e8:	00008067          	ret
    68ec:	01212823          	sw	s2,16(sp)
    68f0:	0105a903          	lw	s2,16(a1)
    68f4:	08090263          	beqz	s2,6978 <__sflush_r+0x1cc>
    68f8:	00912a23          	sw	s1,20(sp)
    68fc:	0005a483          	lw	s1,0(a1)
    6900:	00377713          	and	a4,a4,3
    6904:	0125a023          	sw	s2,0(a1)
    6908:	412484b3          	sub	s1,s1,s2
    690c:	00000793          	li	a5,0
    6910:	00071463          	bnez	a4,6918 <__sflush_r+0x16c>
    6914:	0145a783          	lw	a5,20(a1)
    6918:	00f42423          	sw	a5,8(s0)
    691c:	00904863          	bgtz	s1,692c <__sflush_r+0x180>
    6920:	0540006f          	j	6974 <__sflush_r+0x1c8>
    6924:	00a90933          	add	s2,s2,a0
    6928:	04905663          	blez	s1,6974 <__sflush_r+0x1c8>
    692c:	02442783          	lw	a5,36(s0)
    6930:	01c42583          	lw	a1,28(s0)
    6934:	00048693          	mv	a3,s1
    6938:	00090613          	mv	a2,s2
    693c:	00098513          	mv	a0,s3
    6940:	000780e7          	jalr	a5
    6944:	40a484b3          	sub	s1,s1,a0
    6948:	fca04ee3          	bgtz	a0,6924 <__sflush_r+0x178>
    694c:	00c41703          	lh	a4,12(s0)
    6950:	01012903          	lw	s2,16(sp)
    6954:	04076713          	or	a4,a4,64
    6958:	01412483          	lw	s1,20(sp)
    695c:	00e41623          	sh	a4,12(s0)
    6960:	fff00513          	li	a0,-1
    6964:	f75ff06f          	j	68d8 <__sflush_r+0x12c>
    6968:	03c5a683          	lw	a3,60(a1)
    696c:	e6d04ee3          	bgtz	a3,67e8 <__sflush_r+0x3c>
    6970:	f65ff06f          	j	68d4 <__sflush_r+0x128>
    6974:	01412483          	lw	s1,20(sp)
    6978:	01012903          	lw	s2,16(sp)
    697c:	f59ff06f          	j	68d4 <__sflush_r+0x128>
    6980:	05042603          	lw	a2,80(s0)
    6984:	eadff06f          	j	6830 <__sflush_r+0x84>
    6988:	00c41703          	lh	a4,12(s0)
    698c:	01042683          	lw	a3,16(s0)
    6990:	fffff7b7          	lui	a5,0xfffff
    6994:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6998:	00f777b3          	and	a5,a4,a5
    699c:	00f41623          	sh	a5,12(s0)
    69a0:	00042223          	sw	zero,4(s0)
    69a4:	00d42023          	sw	a3,0(s0)
    69a8:	01371793          	sll	a5,a4,0x13
    69ac:	f007d2e3          	bgez	a5,68b0 <__sflush_r+0x104>
    69b0:	03042583          	lw	a1,48(s0)
    69b4:	04a42823          	sw	a0,80(s0)
    69b8:	0099a023          	sw	s1,0(s3)
    69bc:	f00590e3          	bnez	a1,68bc <__sflush_r+0x110>
    69c0:	01412483          	lw	s1,20(sp)
    69c4:	f11ff06f          	j	68d4 <__sflush_r+0x128>
    69c8:	0009a783          	lw	a5,0(s3)
    69cc:	e4078ce3          	beqz	a5,6824 <__sflush_r+0x78>
    69d0:	01d00713          	li	a4,29
    69d4:	00e78c63          	beq	a5,a4,69ec <__sflush_r+0x240>
    69d8:	01600713          	li	a4,22
    69dc:	00e78863          	beq	a5,a4,69ec <__sflush_r+0x240>
    69e0:	00c41703          	lh	a4,12(s0)
    69e4:	04076713          	or	a4,a4,64
    69e8:	f71ff06f          	j	6958 <__sflush_r+0x1ac>
    69ec:	0099a023          	sw	s1,0(s3)
    69f0:	01412483          	lw	s1,20(sp)
    69f4:	ee1ff06f          	j	68d4 <__sflush_r+0x128>

000069f8 <_fflush_r>:
    69f8:	ff010113          	add	sp,sp,-16
    69fc:	00812423          	sw	s0,8(sp)
    6a00:	00912223          	sw	s1,4(sp)
    6a04:	00112623          	sw	ra,12(sp)
    6a08:	01212023          	sw	s2,0(sp)
    6a0c:	00050493          	mv	s1,a0
    6a10:	00058413          	mv	s0,a1
    6a14:	00050663          	beqz	a0,6a20 <_fflush_r+0x28>
    6a18:	03452783          	lw	a5,52(a0)
    6a1c:	0a078a63          	beqz	a5,6ad0 <_fflush_r+0xd8>
    6a20:	00c41783          	lh	a5,12(s0)
    6a24:	00000913          	li	s2,0
    6a28:	04078063          	beqz	a5,6a68 <_fflush_r+0x70>
    6a2c:	06442703          	lw	a4,100(s0)
    6a30:	00177713          	and	a4,a4,1
    6a34:	00071663          	bnez	a4,6a40 <_fflush_r+0x48>
    6a38:	2007f793          	and	a5,a5,512
    6a3c:	04078463          	beqz	a5,6a84 <_fflush_r+0x8c>
    6a40:	00040593          	mv	a1,s0
    6a44:	00048513          	mv	a0,s1
    6a48:	d65ff0ef          	jal	67ac <__sflush_r>
    6a4c:	06442783          	lw	a5,100(s0)
    6a50:	00050913          	mv	s2,a0
    6a54:	0017f793          	and	a5,a5,1
    6a58:	00079863          	bnez	a5,6a68 <_fflush_r+0x70>
    6a5c:	00c45783          	lhu	a5,12(s0)
    6a60:	2007f793          	and	a5,a5,512
    6a64:	04078463          	beqz	a5,6aac <_fflush_r+0xb4>
    6a68:	00c12083          	lw	ra,12(sp)
    6a6c:	00812403          	lw	s0,8(sp)
    6a70:	00412483          	lw	s1,4(sp)
    6a74:	00090513          	mv	a0,s2
    6a78:	00012903          	lw	s2,0(sp)
    6a7c:	01010113          	add	sp,sp,16
    6a80:	00008067          	ret
    6a84:	05842503          	lw	a0,88(s0)
    6a88:	e44fa0ef          	jal	10cc <__retarget_lock_acquire_recursive>
    6a8c:	00040593          	mv	a1,s0
    6a90:	00048513          	mv	a0,s1
    6a94:	d19ff0ef          	jal	67ac <__sflush_r>
    6a98:	06442783          	lw	a5,100(s0)
    6a9c:	00050913          	mv	s2,a0
    6aa0:	0017f793          	and	a5,a5,1
    6aa4:	fc0792e3          	bnez	a5,6a68 <_fflush_r+0x70>
    6aa8:	fb5ff06f          	j	6a5c <_fflush_r+0x64>
    6aac:	05842503          	lw	a0,88(s0)
    6ab0:	e20fa0ef          	jal	10d0 <__retarget_lock_release_recursive>
    6ab4:	00c12083          	lw	ra,12(sp)
    6ab8:	00812403          	lw	s0,8(sp)
    6abc:	00412483          	lw	s1,4(sp)
    6ac0:	00090513          	mv	a0,s2
    6ac4:	00012903          	lw	s2,0(sp)
    6ac8:	01010113          	add	sp,sp,16
    6acc:	00008067          	ret
    6ad0:	224000ef          	jal	6cf4 <__sinit>
    6ad4:	f4dff06f          	j	6a20 <_fflush_r+0x28>

00006ad8 <stdio_exit_handler>:
    6ad8:	7fffa617          	auipc	a2,0x7fffa
    6adc:	a5060613          	add	a2,a2,-1456 # 80000528 <__sglue>
    6ae0:	00004597          	auipc	a1,0x4
    6ae4:	28c58593          	add	a1,a1,652 # ad6c <_fclose_r>
    6ae8:	7fff9517          	auipc	a0,0x7fff9
    6aec:	51850513          	add	a0,a0,1304 # 80000000 <_impure_data>
    6af0:	7a00006f          	j	7290 <_fwalk_sglue>

00006af4 <cleanup_stdio>:
    6af4:	00452583          	lw	a1,4(a0)
    6af8:	ff010113          	add	sp,sp,-16
    6afc:	00812423          	sw	s0,8(sp)
    6b00:	00112623          	sw	ra,12(sp)
    6b04:	80032797          	auipc	a5,0x80032
    6b08:	45878793          	add	a5,a5,1112 # 80038f5c <__sf>
    6b0c:	00050413          	mv	s0,a0
    6b10:	00f58463          	beq	a1,a5,6b18 <cleanup_stdio+0x24>
    6b14:	258040ef          	jal	ad6c <_fclose_r>
    6b18:	00842583          	lw	a1,8(s0)
    6b1c:	80032797          	auipc	a5,0x80032
    6b20:	4a878793          	add	a5,a5,1192 # 80038fc4 <__sf+0x68>
    6b24:	00f58663          	beq	a1,a5,6b30 <cleanup_stdio+0x3c>
    6b28:	00040513          	mv	a0,s0
    6b2c:	240040ef          	jal	ad6c <_fclose_r>
    6b30:	00c42583          	lw	a1,12(s0)
    6b34:	80032797          	auipc	a5,0x80032
    6b38:	4f878793          	add	a5,a5,1272 # 8003902c <__sf+0xd0>
    6b3c:	00f58c63          	beq	a1,a5,6b54 <cleanup_stdio+0x60>
    6b40:	00040513          	mv	a0,s0
    6b44:	00812403          	lw	s0,8(sp)
    6b48:	00c12083          	lw	ra,12(sp)
    6b4c:	01010113          	add	sp,sp,16
    6b50:	21c0406f          	j	ad6c <_fclose_r>
    6b54:	00c12083          	lw	ra,12(sp)
    6b58:	00812403          	lw	s0,8(sp)
    6b5c:	01010113          	add	sp,sp,16
    6b60:	00008067          	ret

00006b64 <global_stdio_init.part.0>:
    6b64:	fe010113          	add	sp,sp,-32
    6b68:	00000797          	auipc	a5,0x0
    6b6c:	f7078793          	add	a5,a5,-144 # 6ad8 <stdio_exit_handler>
    6b70:	00112e23          	sw	ra,28(sp)
    6b74:	00812c23          	sw	s0,24(sp)
    6b78:	00912a23          	sw	s1,20(sp)
    6b7c:	80032417          	auipc	s0,0x80032
    6b80:	3e040413          	add	s0,s0,992 # 80038f5c <__sf>
    6b84:	01212823          	sw	s2,16(sp)
    6b88:	01312623          	sw	s3,12(sp)
    6b8c:	01412423          	sw	s4,8(sp)
    6b90:	00800613          	li	a2,8
    6b94:	00000593          	li	a1,0
    6b98:	7fffa717          	auipc	a4,0x7fffa
    6b9c:	b8f72c23          	sw	a5,-1128(a4) # 80000730 <__stdio_exit_handler>
    6ba0:	80032517          	auipc	a0,0x80032
    6ba4:	41850513          	add	a0,a0,1048 # 80038fb8 <__sf+0x5c>
    6ba8:	00400793          	li	a5,4
    6bac:	00f42623          	sw	a5,12(s0)
    6bb0:	00042023          	sw	zero,0(s0)
    6bb4:	00042223          	sw	zero,4(s0)
    6bb8:	00042423          	sw	zero,8(s0)
    6bbc:	06042223          	sw	zero,100(s0)
    6bc0:	00042823          	sw	zero,16(s0)
    6bc4:	00042a23          	sw	zero,20(s0)
    6bc8:	00042c23          	sw	zero,24(s0)
    6bcc:	d08fa0ef          	jal	10d4 <memset>
    6bd0:	00001a17          	auipc	s4,0x1
    6bd4:	870a0a13          	add	s4,s4,-1936 # 7440 <__sread>
    6bd8:	00001997          	auipc	s3,0x1
    6bdc:	8c498993          	add	s3,s3,-1852 # 749c <__swrite>
    6be0:	00001917          	auipc	s2,0x1
    6be4:	94490913          	add	s2,s2,-1724 # 7524 <__sseek>
    6be8:	00001497          	auipc	s1,0x1
    6bec:	9b448493          	add	s1,s1,-1612 # 759c <__sclose>
    6bf0:	80032517          	auipc	a0,0x80032
    6bf4:	3c450513          	add	a0,a0,964 # 80038fb4 <__sf+0x58>
    6bf8:	03442023          	sw	s4,32(s0)
    6bfc:	03342223          	sw	s3,36(s0)
    6c00:	03242423          	sw	s2,40(s0)
    6c04:	02942623          	sw	s1,44(s0)
    6c08:	00842e23          	sw	s0,28(s0)
    6c0c:	cb8fa0ef          	jal	10c4 <__retarget_lock_init_recursive>
    6c10:	000107b7          	lui	a5,0x10
    6c14:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x4b1>
    6c18:	00800613          	li	a2,8
    6c1c:	00000593          	li	a1,0
    6c20:	80032517          	auipc	a0,0x80032
    6c24:	40050513          	add	a0,a0,1024 # 80039020 <__sf+0xc4>
    6c28:	06f42a23          	sw	a5,116(s0)
    6c2c:	06042423          	sw	zero,104(s0)
    6c30:	06042623          	sw	zero,108(s0)
    6c34:	06042823          	sw	zero,112(s0)
    6c38:	0c042623          	sw	zero,204(s0)
    6c3c:	06042c23          	sw	zero,120(s0)
    6c40:	06042e23          	sw	zero,124(s0)
    6c44:	08042023          	sw	zero,128(s0)
    6c48:	c8cfa0ef          	jal	10d4 <memset>
    6c4c:	80032797          	auipc	a5,0x80032
    6c50:	37878793          	add	a5,a5,888 # 80038fc4 <__sf+0x68>
    6c54:	80032517          	auipc	a0,0x80032
    6c58:	3c850513          	add	a0,a0,968 # 8003901c <__sf+0xc0>
    6c5c:	08f42223          	sw	a5,132(s0)
    6c60:	09442423          	sw	s4,136(s0)
    6c64:	09342623          	sw	s3,140(s0)
    6c68:	09242823          	sw	s2,144(s0)
    6c6c:	08942a23          	sw	s1,148(s0)
    6c70:	c54fa0ef          	jal	10c4 <__retarget_lock_init_recursive>
    6c74:	000207b7          	lui	a5,0x20
    6c78:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6c7c:	00800613          	li	a2,8
    6c80:	00000593          	li	a1,0
    6c84:	80032517          	auipc	a0,0x80032
    6c88:	40450513          	add	a0,a0,1028 # 80039088 <__sf+0x12c>
    6c8c:	0cf42e23          	sw	a5,220(s0)
    6c90:	0c042823          	sw	zero,208(s0)
    6c94:	0c042a23          	sw	zero,212(s0)
    6c98:	0c042c23          	sw	zero,216(s0)
    6c9c:	12042a23          	sw	zero,308(s0)
    6ca0:	0e042023          	sw	zero,224(s0)
    6ca4:	0e042223          	sw	zero,228(s0)
    6ca8:	0e042423          	sw	zero,232(s0)
    6cac:	c28fa0ef          	jal	10d4 <memset>
    6cb0:	80032797          	auipc	a5,0x80032
    6cb4:	37c78793          	add	a5,a5,892 # 8003902c <__sf+0xd0>
    6cb8:	0f442823          	sw	s4,240(s0)
    6cbc:	0f342a23          	sw	s3,244(s0)
    6cc0:	0f242c23          	sw	s2,248(s0)
    6cc4:	0e942e23          	sw	s1,252(s0)
    6cc8:	0ef42623          	sw	a5,236(s0)
    6ccc:	01812403          	lw	s0,24(sp)
    6cd0:	01c12083          	lw	ra,28(sp)
    6cd4:	01412483          	lw	s1,20(sp)
    6cd8:	01012903          	lw	s2,16(sp)
    6cdc:	00c12983          	lw	s3,12(sp)
    6ce0:	00812a03          	lw	s4,8(sp)
    6ce4:	80032517          	auipc	a0,0x80032
    6ce8:	3a050513          	add	a0,a0,928 # 80039084 <__sf+0x128>
    6cec:	02010113          	add	sp,sp,32
    6cf0:	bd4fa06f          	j	10c4 <__retarget_lock_init_recursive>

00006cf4 <__sinit>:
    6cf4:	ff010113          	add	sp,sp,-16
    6cf8:	00812423          	sw	s0,8(sp)
    6cfc:	00050413          	mv	s0,a0
    6d00:	7fffa517          	auipc	a0,0x7fffa
    6d04:	a2050513          	add	a0,a0,-1504 # 80000720 <__lock___sfp_recursive_mutex>
    6d08:	00112623          	sw	ra,12(sp)
    6d0c:	bc0fa0ef          	jal	10cc <__retarget_lock_acquire_recursive>
    6d10:	03442783          	lw	a5,52(s0)
    6d14:	00079e63          	bnez	a5,6d30 <__sinit+0x3c>
    6d18:	00000797          	auipc	a5,0x0
    6d1c:	ddc78793          	add	a5,a5,-548 # 6af4 <cleanup_stdio>
    6d20:	02f42a23          	sw	a5,52(s0)
    6d24:	7fffa797          	auipc	a5,0x7fffa
    6d28:	a0c7a783          	lw	a5,-1524(a5) # 80000730 <__stdio_exit_handler>
    6d2c:	00078e63          	beqz	a5,6d48 <__sinit+0x54>
    6d30:	00812403          	lw	s0,8(sp)
    6d34:	00c12083          	lw	ra,12(sp)
    6d38:	7fffa517          	auipc	a0,0x7fffa
    6d3c:	9e850513          	add	a0,a0,-1560 # 80000720 <__lock___sfp_recursive_mutex>
    6d40:	01010113          	add	sp,sp,16
    6d44:	b8cfa06f          	j	10d0 <__retarget_lock_release_recursive>
    6d48:	e1dff0ef          	jal	6b64 <global_stdio_init.part.0>
    6d4c:	00812403          	lw	s0,8(sp)
    6d50:	00c12083          	lw	ra,12(sp)
    6d54:	7fffa517          	auipc	a0,0x7fffa
    6d58:	9cc50513          	add	a0,a0,-1588 # 80000720 <__lock___sfp_recursive_mutex>
    6d5c:	01010113          	add	sp,sp,16
    6d60:	b70fa06f          	j	10d0 <__retarget_lock_release_recursive>

00006d64 <__sfp_lock_acquire>:
    6d64:	7fffa517          	auipc	a0,0x7fffa
    6d68:	9bc50513          	add	a0,a0,-1604 # 80000720 <__lock___sfp_recursive_mutex>
    6d6c:	b60fa06f          	j	10cc <__retarget_lock_acquire_recursive>

00006d70 <__sfp_lock_release>:
    6d70:	7fffa517          	auipc	a0,0x7fffa
    6d74:	9b050513          	add	a0,a0,-1616 # 80000720 <__lock___sfp_recursive_mutex>
    6d78:	b58fa06f          	j	10d0 <__retarget_lock_release_recursive>

00006d7c <__sfvwrite_r>:
    6d7c:	00862783          	lw	a5,8(a2)
    6d80:	2c078463          	beqz	a5,7048 <__sfvwrite_r+0x2cc>
    6d84:	00c59683          	lh	a3,12(a1)
    6d88:	fd010113          	add	sp,sp,-48
    6d8c:	02812423          	sw	s0,40(sp)
    6d90:	01412c23          	sw	s4,24(sp)
    6d94:	01612823          	sw	s6,16(sp)
    6d98:	02112623          	sw	ra,44(sp)
    6d9c:	0086f793          	and	a5,a3,8
    6da0:	00060b13          	mv	s6,a2
    6da4:	00050a13          	mv	s4,a0
    6da8:	00058413          	mv	s0,a1
    6dac:	08078e63          	beqz	a5,6e48 <__sfvwrite_r+0xcc>
    6db0:	0105a783          	lw	a5,16(a1)
    6db4:	08078a63          	beqz	a5,6e48 <__sfvwrite_r+0xcc>
    6db8:	02912223          	sw	s1,36(sp)
    6dbc:	03212023          	sw	s2,32(sp)
    6dc0:	01312e23          	sw	s3,28(sp)
    6dc4:	01512a23          	sw	s5,20(sp)
    6dc8:	0026f793          	and	a5,a3,2
    6dcc:	000b2483          	lw	s1,0(s6)
    6dd0:	0a078463          	beqz	a5,6e78 <__sfvwrite_r+0xfc>
    6dd4:	02442783          	lw	a5,36(s0)
    6dd8:	01c42583          	lw	a1,28(s0)
    6ddc:	80000ab7          	lui	s5,0x80000
    6de0:	00000993          	li	s3,0
    6de4:	00000913          	li	s2,0
    6de8:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6dec:	00098613          	mv	a2,s3
    6df0:	000a0513          	mv	a0,s4
    6df4:	04090263          	beqz	s2,6e38 <__sfvwrite_r+0xbc>
    6df8:	00090693          	mv	a3,s2
    6dfc:	012af463          	bgeu	s5,s2,6e04 <__sfvwrite_r+0x88>
    6e00:	000a8693          	mv	a3,s5
    6e04:	000780e7          	jalr	a5
    6e08:	46a05263          	blez	a0,726c <__sfvwrite_r+0x4f0>
    6e0c:	008b2783          	lw	a5,8(s6)
    6e10:	00a989b3          	add	s3,s3,a0
    6e14:	40a90933          	sub	s2,s2,a0
    6e18:	40a787b3          	sub	a5,a5,a0
    6e1c:	00fb2423          	sw	a5,8(s6)
    6e20:	1a078663          	beqz	a5,6fcc <__sfvwrite_r+0x250>
    6e24:	02442783          	lw	a5,36(s0)
    6e28:	01c42583          	lw	a1,28(s0)
    6e2c:	00098613          	mv	a2,s3
    6e30:	000a0513          	mv	a0,s4
    6e34:	fc0912e3          	bnez	s2,6df8 <__sfvwrite_r+0x7c>
    6e38:	0004a983          	lw	s3,0(s1)
    6e3c:	0044a903          	lw	s2,4(s1)
    6e40:	00848493          	add	s1,s1,8
    6e44:	fa9ff06f          	j	6dec <__sfvwrite_r+0x70>
    6e48:	00040593          	mv	a1,s0
    6e4c:	000a0513          	mv	a0,s4
    6e50:	0e5000ef          	jal	7734 <__swsetup_r>
    6e54:	1c051c63          	bnez	a0,702c <__sfvwrite_r+0x2b0>
    6e58:	00c41683          	lh	a3,12(s0)
    6e5c:	02912223          	sw	s1,36(sp)
    6e60:	03212023          	sw	s2,32(sp)
    6e64:	01312e23          	sw	s3,28(sp)
    6e68:	01512a23          	sw	s5,20(sp)
    6e6c:	0026f793          	and	a5,a3,2
    6e70:	000b2483          	lw	s1,0(s6)
    6e74:	f60790e3          	bnez	a5,6dd4 <__sfvwrite_r+0x58>
    6e78:	01712623          	sw	s7,12(sp)
    6e7c:	01812423          	sw	s8,8(sp)
    6e80:	0016f793          	and	a5,a3,1
    6e84:	1c079663          	bnez	a5,7050 <__sfvwrite_r+0x2d4>
    6e88:	00042783          	lw	a5,0(s0)
    6e8c:	00842703          	lw	a4,8(s0)
    6e90:	80000ab7          	lui	s5,0x80000
    6e94:	01912223          	sw	s9,4(sp)
    6e98:	00000b93          	li	s7,0
    6e9c:	00000993          	li	s3,0
    6ea0:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6ea4:	00078513          	mv	a0,a5
    6ea8:	00070c13          	mv	s8,a4
    6eac:	10098263          	beqz	s3,6fb0 <__sfvwrite_r+0x234>
    6eb0:	2006f613          	and	a2,a3,512
    6eb4:	28060863          	beqz	a2,7144 <__sfvwrite_r+0x3c8>
    6eb8:	00070c93          	mv	s9,a4
    6ebc:	32e9e863          	bltu	s3,a4,71ec <__sfvwrite_r+0x470>
    6ec0:	4806f713          	and	a4,a3,1152
    6ec4:	08070a63          	beqz	a4,6f58 <__sfvwrite_r+0x1dc>
    6ec8:	01442603          	lw	a2,20(s0)
    6ecc:	01042583          	lw	a1,16(s0)
    6ed0:	00161713          	sll	a4,a2,0x1
    6ed4:	00c70733          	add	a4,a4,a2
    6ed8:	40b78933          	sub	s2,a5,a1
    6edc:	01f75c13          	srl	s8,a4,0x1f
    6ee0:	00ec0c33          	add	s8,s8,a4
    6ee4:	00190793          	add	a5,s2,1
    6ee8:	401c5c13          	sra	s8,s8,0x1
    6eec:	013787b3          	add	a5,a5,s3
    6ef0:	000c0613          	mv	a2,s8
    6ef4:	00fc7663          	bgeu	s8,a5,6f00 <__sfvwrite_r+0x184>
    6ef8:	00078c13          	mv	s8,a5
    6efc:	00078613          	mv	a2,a5
    6f00:	4006f693          	and	a3,a3,1024
    6f04:	32068063          	beqz	a3,7224 <__sfvwrite_r+0x4a8>
    6f08:	00060593          	mv	a1,a2
    6f0c:	000a0513          	mv	a0,s4
    6f10:	921fa0ef          	jal	1830 <_malloc_r>
    6f14:	00050c93          	mv	s9,a0
    6f18:	34050e63          	beqz	a0,7274 <__sfvwrite_r+0x4f8>
    6f1c:	01042583          	lw	a1,16(s0)
    6f20:	00090613          	mv	a2,s2
    6f24:	a8cfa0ef          	jal	11b0 <memcpy>
    6f28:	00c45783          	lhu	a5,12(s0)
    6f2c:	b7f7f793          	and	a5,a5,-1153
    6f30:	0807e793          	or	a5,a5,128
    6f34:	00f41623          	sh	a5,12(s0)
    6f38:	012c8533          	add	a0,s9,s2
    6f3c:	412c07b3          	sub	a5,s8,s2
    6f40:	01942823          	sw	s9,16(s0)
    6f44:	01842a23          	sw	s8,20(s0)
    6f48:	00a42023          	sw	a0,0(s0)
    6f4c:	00098c13          	mv	s8,s3
    6f50:	00f42423          	sw	a5,8(s0)
    6f54:	00098c93          	mv	s9,s3
    6f58:	000c8613          	mv	a2,s9
    6f5c:	000b8593          	mv	a1,s7
    6f60:	6a9000ef          	jal	7e08 <memmove>
    6f64:	00842703          	lw	a4,8(s0)
    6f68:	00042783          	lw	a5,0(s0)
    6f6c:	00098913          	mv	s2,s3
    6f70:	41870733          	sub	a4,a4,s8
    6f74:	019787b3          	add	a5,a5,s9
    6f78:	00e42423          	sw	a4,8(s0)
    6f7c:	00f42023          	sw	a5,0(s0)
    6f80:	00000993          	li	s3,0
    6f84:	008b2783          	lw	a5,8(s6)
    6f88:	012b8bb3          	add	s7,s7,s2
    6f8c:	412787b3          	sub	a5,a5,s2
    6f90:	00fb2423          	sw	a5,8(s6)
    6f94:	02078663          	beqz	a5,6fc0 <__sfvwrite_r+0x244>
    6f98:	00042783          	lw	a5,0(s0)
    6f9c:	00842703          	lw	a4,8(s0)
    6fa0:	00c41683          	lh	a3,12(s0)
    6fa4:	00078513          	mv	a0,a5
    6fa8:	00070c13          	mv	s8,a4
    6fac:	f00992e3          	bnez	s3,6eb0 <__sfvwrite_r+0x134>
    6fb0:	0004ab83          	lw	s7,0(s1)
    6fb4:	0044a983          	lw	s3,4(s1)
    6fb8:	00848493          	add	s1,s1,8
    6fbc:	ee9ff06f          	j	6ea4 <__sfvwrite_r+0x128>
    6fc0:	00c12b83          	lw	s7,12(sp)
    6fc4:	00812c03          	lw	s8,8(sp)
    6fc8:	00412c83          	lw	s9,4(sp)
    6fcc:	02c12083          	lw	ra,44(sp)
    6fd0:	02812403          	lw	s0,40(sp)
    6fd4:	02412483          	lw	s1,36(sp)
    6fd8:	02012903          	lw	s2,32(sp)
    6fdc:	01c12983          	lw	s3,28(sp)
    6fe0:	01412a83          	lw	s5,20(sp)
    6fe4:	01812a03          	lw	s4,24(sp)
    6fe8:	01012b03          	lw	s6,16(sp)
    6fec:	00000513          	li	a0,0
    6ff0:	03010113          	add	sp,sp,48
    6ff4:	00008067          	ret
    6ff8:	00040593          	mv	a1,s0
    6ffc:	000a0513          	mv	a0,s4
    7000:	9f9ff0ef          	jal	69f8 <_fflush_r>
    7004:	0a050e63          	beqz	a0,70c0 <__sfvwrite_r+0x344>
    7008:	00c41783          	lh	a5,12(s0)
    700c:	00c12b83          	lw	s7,12(sp)
    7010:	00812c03          	lw	s8,8(sp)
    7014:	02412483          	lw	s1,36(sp)
    7018:	02012903          	lw	s2,32(sp)
    701c:	01c12983          	lw	s3,28(sp)
    7020:	01412a83          	lw	s5,20(sp)
    7024:	0407e793          	or	a5,a5,64
    7028:	00f41623          	sh	a5,12(s0)
    702c:	02c12083          	lw	ra,44(sp)
    7030:	02812403          	lw	s0,40(sp)
    7034:	01812a03          	lw	s4,24(sp)
    7038:	01012b03          	lw	s6,16(sp)
    703c:	fff00513          	li	a0,-1
    7040:	03010113          	add	sp,sp,48
    7044:	00008067          	ret
    7048:	00000513          	li	a0,0
    704c:	00008067          	ret
    7050:	00000a93          	li	s5,0
    7054:	00000513          	li	a0,0
    7058:	00000c13          	li	s8,0
    705c:	00000993          	li	s3,0
    7060:	08098263          	beqz	s3,70e4 <__sfvwrite_r+0x368>
    7064:	08050a63          	beqz	a0,70f8 <__sfvwrite_r+0x37c>
    7068:	000a8793          	mv	a5,s5
    706c:	00098b93          	mv	s7,s3
    7070:	0137f463          	bgeu	a5,s3,7078 <__sfvwrite_r+0x2fc>
    7074:	00078b93          	mv	s7,a5
    7078:	00042503          	lw	a0,0(s0)
    707c:	01042783          	lw	a5,16(s0)
    7080:	00842903          	lw	s2,8(s0)
    7084:	01442683          	lw	a3,20(s0)
    7088:	00a7f663          	bgeu	a5,a0,7094 <__sfvwrite_r+0x318>
    708c:	00d90933          	add	s2,s2,a3
    7090:	09794463          	blt	s2,s7,7118 <__sfvwrite_r+0x39c>
    7094:	16dbc263          	blt	s7,a3,71f8 <__sfvwrite_r+0x47c>
    7098:	02442783          	lw	a5,36(s0)
    709c:	01c42583          	lw	a1,28(s0)
    70a0:	000c0613          	mv	a2,s8
    70a4:	000a0513          	mv	a0,s4
    70a8:	000780e7          	jalr	a5
    70ac:	00050913          	mv	s2,a0
    70b0:	f4a05ce3          	blez	a0,7008 <__sfvwrite_r+0x28c>
    70b4:	412a8ab3          	sub	s5,s5,s2
    70b8:	00100513          	li	a0,1
    70bc:	f20a8ee3          	beqz	s5,6ff8 <__sfvwrite_r+0x27c>
    70c0:	008b2783          	lw	a5,8(s6)
    70c4:	012c0c33          	add	s8,s8,s2
    70c8:	412989b3          	sub	s3,s3,s2
    70cc:	412787b3          	sub	a5,a5,s2
    70d0:	00fb2423          	sw	a5,8(s6)
    70d4:	f80796e3          	bnez	a5,7060 <__sfvwrite_r+0x2e4>
    70d8:	00c12b83          	lw	s7,12(sp)
    70dc:	00812c03          	lw	s8,8(sp)
    70e0:	eedff06f          	j	6fcc <__sfvwrite_r+0x250>
    70e4:	0044a983          	lw	s3,4(s1)
    70e8:	00048793          	mv	a5,s1
    70ec:	00848493          	add	s1,s1,8
    70f0:	fe098ae3          	beqz	s3,70e4 <__sfvwrite_r+0x368>
    70f4:	0007ac03          	lw	s8,0(a5)
    70f8:	00098613          	mv	a2,s3
    70fc:	00a00593          	li	a1,10
    7100:	000c0513          	mv	a0,s8
    7104:	1a1000ef          	jal	7aa4 <memchr>
    7108:	14050c63          	beqz	a0,7260 <__sfvwrite_r+0x4e4>
    710c:	00150513          	add	a0,a0,1
    7110:	41850ab3          	sub	s5,a0,s8
    7114:	f55ff06f          	j	7068 <__sfvwrite_r+0x2ec>
    7118:	000c0593          	mv	a1,s8
    711c:	00090613          	mv	a2,s2
    7120:	4e9000ef          	jal	7e08 <memmove>
    7124:	00042783          	lw	a5,0(s0)
    7128:	00040593          	mv	a1,s0
    712c:	000a0513          	mv	a0,s4
    7130:	012787b3          	add	a5,a5,s2
    7134:	00f42023          	sw	a5,0(s0)
    7138:	8c1ff0ef          	jal	69f8 <_fflush_r>
    713c:	f6050ce3          	beqz	a0,70b4 <__sfvwrite_r+0x338>
    7140:	ec9ff06f          	j	7008 <__sfvwrite_r+0x28c>
    7144:	01042683          	lw	a3,16(s0)
    7148:	04f6e463          	bltu	a3,a5,7190 <__sfvwrite_r+0x414>
    714c:	01442583          	lw	a1,20(s0)
    7150:	04b9e063          	bltu	s3,a1,7190 <__sfvwrite_r+0x414>
    7154:	00098913          	mv	s2,s3
    7158:	013af463          	bgeu	s5,s3,7160 <__sfvwrite_r+0x3e4>
    715c:	000a8913          	mv	s2,s5
    7160:	00090513          	mv	a0,s2
    7164:	65d070ef          	jal	efc0 <__modsi3>
    7168:	02442783          	lw	a5,36(s0)
    716c:	01c42583          	lw	a1,28(s0)
    7170:	40a906b3          	sub	a3,s2,a0
    7174:	000b8613          	mv	a2,s7
    7178:	000a0513          	mv	a0,s4
    717c:	000780e7          	jalr	a5
    7180:	00050913          	mv	s2,a0
    7184:	04a05a63          	blez	a0,71d8 <__sfvwrite_r+0x45c>
    7188:	412989b3          	sub	s3,s3,s2
    718c:	df9ff06f          	j	6f84 <__sfvwrite_r+0x208>
    7190:	00070913          	mv	s2,a4
    7194:	00e9f463          	bgeu	s3,a4,719c <__sfvwrite_r+0x420>
    7198:	00098913          	mv	s2,s3
    719c:	00078513          	mv	a0,a5
    71a0:	00090613          	mv	a2,s2
    71a4:	000b8593          	mv	a1,s7
    71a8:	461000ef          	jal	7e08 <memmove>
    71ac:	00842703          	lw	a4,8(s0)
    71b0:	00042783          	lw	a5,0(s0)
    71b4:	41270733          	sub	a4,a4,s2
    71b8:	012787b3          	add	a5,a5,s2
    71bc:	00e42423          	sw	a4,8(s0)
    71c0:	00f42023          	sw	a5,0(s0)
    71c4:	fc0712e3          	bnez	a4,7188 <__sfvwrite_r+0x40c>
    71c8:	00040593          	mv	a1,s0
    71cc:	000a0513          	mv	a0,s4
    71d0:	829ff0ef          	jal	69f8 <_fflush_r>
    71d4:	fa050ae3          	beqz	a0,7188 <__sfvwrite_r+0x40c>
    71d8:	00c41783          	lh	a5,12(s0)
    71dc:	00c12b83          	lw	s7,12(sp)
    71e0:	00812c03          	lw	s8,8(sp)
    71e4:	00412c83          	lw	s9,4(sp)
    71e8:	e2dff06f          	j	7014 <__sfvwrite_r+0x298>
    71ec:	00098c13          	mv	s8,s3
    71f0:	00098c93          	mv	s9,s3
    71f4:	d65ff06f          	j	6f58 <__sfvwrite_r+0x1dc>
    71f8:	000b8613          	mv	a2,s7
    71fc:	000c0593          	mv	a1,s8
    7200:	409000ef          	jal	7e08 <memmove>
    7204:	00842703          	lw	a4,8(s0)
    7208:	00042783          	lw	a5,0(s0)
    720c:	000b8913          	mv	s2,s7
    7210:	41770733          	sub	a4,a4,s7
    7214:	017787b3          	add	a5,a5,s7
    7218:	00e42423          	sw	a4,8(s0)
    721c:	00f42023          	sw	a5,0(s0)
    7220:	e95ff06f          	j	70b4 <__sfvwrite_r+0x338>
    7224:	000a0513          	mv	a0,s4
    7228:	508030ef          	jal	a730 <_realloc_r>
    722c:	00050c93          	mv	s9,a0
    7230:	d00514e3          	bnez	a0,6f38 <__sfvwrite_r+0x1bc>
    7234:	01042583          	lw	a1,16(s0)
    7238:	000a0513          	mv	a0,s4
    723c:	ae8fa0ef          	jal	1524 <_free_r>
    7240:	00c41783          	lh	a5,12(s0)
    7244:	00c00713          	li	a4,12
    7248:	00c12b83          	lw	s7,12(sp)
    724c:	00812c03          	lw	s8,8(sp)
    7250:	00412c83          	lw	s9,4(sp)
    7254:	00ea2023          	sw	a4,0(s4)
    7258:	f7f7f793          	and	a5,a5,-129
    725c:	db9ff06f          	j	7014 <__sfvwrite_r+0x298>
    7260:	00198793          	add	a5,s3,1
    7264:	00078a93          	mv	s5,a5
    7268:	e05ff06f          	j	706c <__sfvwrite_r+0x2f0>
    726c:	00c41783          	lh	a5,12(s0)
    7270:	da5ff06f          	j	7014 <__sfvwrite_r+0x298>
    7274:	00c00713          	li	a4,12
    7278:	00c41783          	lh	a5,12(s0)
    727c:	00c12b83          	lw	s7,12(sp)
    7280:	00812c03          	lw	s8,8(sp)
    7284:	00412c83          	lw	s9,4(sp)
    7288:	00ea2023          	sw	a4,0(s4)
    728c:	d89ff06f          	j	7014 <__sfvwrite_r+0x298>

00007290 <_fwalk_sglue>:
    7290:	fd010113          	add	sp,sp,-48
    7294:	03212023          	sw	s2,32(sp)
    7298:	01312e23          	sw	s3,28(sp)
    729c:	01412c23          	sw	s4,24(sp)
    72a0:	01512a23          	sw	s5,20(sp)
    72a4:	01612823          	sw	s6,16(sp)
    72a8:	01712623          	sw	s7,12(sp)
    72ac:	02112623          	sw	ra,44(sp)
    72b0:	02812423          	sw	s0,40(sp)
    72b4:	02912223          	sw	s1,36(sp)
    72b8:	00050b13          	mv	s6,a0
    72bc:	00058b93          	mv	s7,a1
    72c0:	00060a93          	mv	s5,a2
    72c4:	00000a13          	li	s4,0
    72c8:	00100993          	li	s3,1
    72cc:	fff00913          	li	s2,-1
    72d0:	004aa483          	lw	s1,4(s5)
    72d4:	008aa403          	lw	s0,8(s5)
    72d8:	fff48493          	add	s1,s1,-1
    72dc:	0204c863          	bltz	s1,730c <_fwalk_sglue+0x7c>
    72e0:	00c45783          	lhu	a5,12(s0)
    72e4:	00f9fe63          	bgeu	s3,a5,7300 <_fwalk_sglue+0x70>
    72e8:	00e41783          	lh	a5,14(s0)
    72ec:	00040593          	mv	a1,s0
    72f0:	000b0513          	mv	a0,s6
    72f4:	01278663          	beq	a5,s2,7300 <_fwalk_sglue+0x70>
    72f8:	000b80e7          	jalr	s7
    72fc:	00aa6a33          	or	s4,s4,a0
    7300:	fff48493          	add	s1,s1,-1
    7304:	06840413          	add	s0,s0,104
    7308:	fd249ce3          	bne	s1,s2,72e0 <_fwalk_sglue+0x50>
    730c:	000aaa83          	lw	s5,0(s5)
    7310:	fc0a90e3          	bnez	s5,72d0 <_fwalk_sglue+0x40>
    7314:	02c12083          	lw	ra,44(sp)
    7318:	02812403          	lw	s0,40(sp)
    731c:	02412483          	lw	s1,36(sp)
    7320:	02012903          	lw	s2,32(sp)
    7324:	01c12983          	lw	s3,28(sp)
    7328:	01412a83          	lw	s5,20(sp)
    732c:	01012b03          	lw	s6,16(sp)
    7330:	00c12b83          	lw	s7,12(sp)
    7334:	000a0513          	mv	a0,s4
    7338:	01812a03          	lw	s4,24(sp)
    733c:	03010113          	add	sp,sp,48
    7340:	00008067          	ret

00007344 <_putc_r>:
    7344:	fe010113          	add	sp,sp,-32
    7348:	00812c23          	sw	s0,24(sp)
    734c:	01212a23          	sw	s2,20(sp)
    7350:	00112e23          	sw	ra,28(sp)
    7354:	00050913          	mv	s2,a0
    7358:	00060413          	mv	s0,a2
    735c:	00050663          	beqz	a0,7368 <_putc_r+0x24>
    7360:	03452783          	lw	a5,52(a0)
    7364:	0c078663          	beqz	a5,7430 <_putc_r+0xec>
    7368:	06442783          	lw	a5,100(s0)
    736c:	0017f793          	and	a5,a5,1
    7370:	00079863          	bnez	a5,7380 <_putc_r+0x3c>
    7374:	00c45783          	lhu	a5,12(s0)
    7378:	2007f793          	and	a5,a5,512
    737c:	08078063          	beqz	a5,73fc <_putc_r+0xb8>
    7380:	00842783          	lw	a5,8(s0)
    7384:	fff78793          	add	a5,a5,-1
    7388:	00f42423          	sw	a5,8(s0)
    738c:	0007dc63          	bgez	a5,73a4 <_putc_r+0x60>
    7390:	01842703          	lw	a4,24(s0)
    7394:	04e7ca63          	blt	a5,a4,73e8 <_putc_r+0xa4>
    7398:	0ff5f793          	zext.b	a5,a1
    739c:	00a00713          	li	a4,10
    73a0:	04e78463          	beq	a5,a4,73e8 <_putc_r+0xa4>
    73a4:	00042783          	lw	a5,0(s0)
    73a8:	0ff5f913          	zext.b	s2,a1
    73ac:	00178713          	add	a4,a5,1
    73b0:	00e42023          	sw	a4,0(s0)
    73b4:	00b78023          	sb	a1,0(a5)
    73b8:	06442783          	lw	a5,100(s0)
    73bc:	0017f793          	and	a5,a5,1
    73c0:	00079863          	bnez	a5,73d0 <_putc_r+0x8c>
    73c4:	00c45783          	lhu	a5,12(s0)
    73c8:	2007f793          	and	a5,a5,512
    73cc:	04078263          	beqz	a5,7410 <_putc_r+0xcc>
    73d0:	01c12083          	lw	ra,28(sp)
    73d4:	01812403          	lw	s0,24(sp)
    73d8:	00090513          	mv	a0,s2
    73dc:	01412903          	lw	s2,20(sp)
    73e0:	02010113          	add	sp,sp,32
    73e4:	00008067          	ret
    73e8:	00090513          	mv	a0,s2
    73ec:	00040613          	mv	a2,s0
    73f0:	1b4000ef          	jal	75a4 <__swbuf_r>
    73f4:	00050913          	mv	s2,a0
    73f8:	fc1ff06f          	j	73b8 <_putc_r+0x74>
    73fc:	05842503          	lw	a0,88(s0)
    7400:	00b12623          	sw	a1,12(sp)
    7404:	cc9f90ef          	jal	10cc <__retarget_lock_acquire_recursive>
    7408:	00c12583          	lw	a1,12(sp)
    740c:	f75ff06f          	j	7380 <_putc_r+0x3c>
    7410:	05842503          	lw	a0,88(s0)
    7414:	cbdf90ef          	jal	10d0 <__retarget_lock_release_recursive>
    7418:	01c12083          	lw	ra,28(sp)
    741c:	01812403          	lw	s0,24(sp)
    7420:	00090513          	mv	a0,s2
    7424:	01412903          	lw	s2,20(sp)
    7428:	02010113          	add	sp,sp,32
    742c:	00008067          	ret
    7430:	00b12623          	sw	a1,12(sp)
    7434:	8c1ff0ef          	jal	6cf4 <__sinit>
    7438:	00c12583          	lw	a1,12(sp)
    743c:	f2dff06f          	j	7368 <_putc_r+0x24>

00007440 <__sread>:
    7440:	ff010113          	add	sp,sp,-16
    7444:	00812423          	sw	s0,8(sp)
    7448:	00058413          	mv	s0,a1
    744c:	00e59583          	lh	a1,14(a1)
    7450:	00112623          	sw	ra,12(sp)
    7454:	095000ef          	jal	7ce8 <_read_r>
    7458:	02054063          	bltz	a0,7478 <__sread+0x38>
    745c:	05042783          	lw	a5,80(s0)
    7460:	00c12083          	lw	ra,12(sp)
    7464:	00a787b3          	add	a5,a5,a0
    7468:	04f42823          	sw	a5,80(s0)
    746c:	00812403          	lw	s0,8(sp)
    7470:	01010113          	add	sp,sp,16
    7474:	00008067          	ret
    7478:	00c45783          	lhu	a5,12(s0)
    747c:	fffff737          	lui	a4,0xfffff
    7480:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7484:	00e7f7b3          	and	a5,a5,a4
    7488:	00c12083          	lw	ra,12(sp)
    748c:	00f41623          	sh	a5,12(s0)
    7490:	00812403          	lw	s0,8(sp)
    7494:	01010113          	add	sp,sp,16
    7498:	00008067          	ret

0000749c <__swrite>:
    749c:	00c59783          	lh	a5,12(a1)
    74a0:	fe010113          	add	sp,sp,-32
    74a4:	00812c23          	sw	s0,24(sp)
    74a8:	00912a23          	sw	s1,20(sp)
    74ac:	01212823          	sw	s2,16(sp)
    74b0:	01312623          	sw	s3,12(sp)
    74b4:	00112e23          	sw	ra,28(sp)
    74b8:	1007f713          	and	a4,a5,256
    74bc:	00058413          	mv	s0,a1
    74c0:	00050493          	mv	s1,a0
    74c4:	00060913          	mv	s2,a2
    74c8:	00068993          	mv	s3,a3
    74cc:	04071063          	bnez	a4,750c <__swrite+0x70>
    74d0:	fffff737          	lui	a4,0xfffff
    74d4:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    74d8:	00e7f7b3          	and	a5,a5,a4
    74dc:	00e41583          	lh	a1,14(s0)
    74e0:	00f41623          	sh	a5,12(s0)
    74e4:	01812403          	lw	s0,24(sp)
    74e8:	01c12083          	lw	ra,28(sp)
    74ec:	00098693          	mv	a3,s3
    74f0:	00090613          	mv	a2,s2
    74f4:	00c12983          	lw	s3,12(sp)
    74f8:	01012903          	lw	s2,16(sp)
    74fc:	00048513          	mv	a0,s1
    7500:	01412483          	lw	s1,20(sp)
    7504:	02010113          	add	sp,sp,32
    7508:	09d0006f          	j	7da4 <_write_r>
    750c:	00e59583          	lh	a1,14(a1)
    7510:	00200693          	li	a3,2
    7514:	00000613          	li	a2,0
    7518:	76c000ef          	jal	7c84 <_lseek_r>
    751c:	00c41783          	lh	a5,12(s0)
    7520:	fb1ff06f          	j	74d0 <__swrite+0x34>

00007524 <__sseek>:
    7524:	ff010113          	add	sp,sp,-16
    7528:	00812423          	sw	s0,8(sp)
    752c:	00058413          	mv	s0,a1
    7530:	00e59583          	lh	a1,14(a1)
    7534:	00112623          	sw	ra,12(sp)
    7538:	74c000ef          	jal	7c84 <_lseek_r>
    753c:	fff00793          	li	a5,-1
    7540:	02f50863          	beq	a0,a5,7570 <__sseek+0x4c>
    7544:	00c45783          	lhu	a5,12(s0)
    7548:	00001737          	lui	a4,0x1
    754c:	00c12083          	lw	ra,12(sp)
    7550:	00e7e7b3          	or	a5,a5,a4
    7554:	01079793          	sll	a5,a5,0x10
    7558:	4107d793          	sra	a5,a5,0x10
    755c:	04a42823          	sw	a0,80(s0)
    7560:	00f41623          	sh	a5,12(s0)
    7564:	00812403          	lw	s0,8(sp)
    7568:	01010113          	add	sp,sp,16
    756c:	00008067          	ret
    7570:	00c45783          	lhu	a5,12(s0)
    7574:	fffff737          	lui	a4,0xfffff
    7578:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    757c:	00e7f7b3          	and	a5,a5,a4
    7580:	01079793          	sll	a5,a5,0x10
    7584:	4107d793          	sra	a5,a5,0x10
    7588:	00c12083          	lw	ra,12(sp)
    758c:	00f41623          	sh	a5,12(s0)
    7590:	00812403          	lw	s0,8(sp)
    7594:	01010113          	add	sp,sp,16
    7598:	00008067          	ret

0000759c <__sclose>:
    759c:	00e59583          	lh	a1,14(a1)
    75a0:	68c0006f          	j	7c2c <_close_r>

000075a4 <__swbuf_r>:
    75a4:	fe010113          	add	sp,sp,-32
    75a8:	00812c23          	sw	s0,24(sp)
    75ac:	00912a23          	sw	s1,20(sp)
    75b0:	01212823          	sw	s2,16(sp)
    75b4:	00112e23          	sw	ra,28(sp)
    75b8:	00050913          	mv	s2,a0
    75bc:	00058493          	mv	s1,a1
    75c0:	00060413          	mv	s0,a2
    75c4:	00050663          	beqz	a0,75d0 <__swbuf_r+0x2c>
    75c8:	03452783          	lw	a5,52(a0)
    75cc:	16078063          	beqz	a5,772c <__swbuf_r+0x188>
    75d0:	01842783          	lw	a5,24(s0)
    75d4:	00c41703          	lh	a4,12(s0)
    75d8:	00f42423          	sw	a5,8(s0)
    75dc:	00877793          	and	a5,a4,8
    75e0:	08078063          	beqz	a5,7660 <__swbuf_r+0xbc>
    75e4:	01042783          	lw	a5,16(s0)
    75e8:	06078c63          	beqz	a5,7660 <__swbuf_r+0xbc>
    75ec:	01312623          	sw	s3,12(sp)
    75f0:	01271693          	sll	a3,a4,0x12
    75f4:	0ff4f993          	zext.b	s3,s1
    75f8:	0ff4f493          	zext.b	s1,s1
    75fc:	0806d863          	bgez	a3,768c <__swbuf_r+0xe8>
    7600:	00042703          	lw	a4,0(s0)
    7604:	01442683          	lw	a3,20(s0)
    7608:	40f707b3          	sub	a5,a4,a5
    760c:	0ad7d863          	bge	a5,a3,76bc <__swbuf_r+0x118>
    7610:	00842683          	lw	a3,8(s0)
    7614:	00170613          	add	a2,a4,1
    7618:	00c42023          	sw	a2,0(s0)
    761c:	fff68693          	add	a3,a3,-1
    7620:	00d42423          	sw	a3,8(s0)
    7624:	01370023          	sb	s3,0(a4)
    7628:	01442703          	lw	a4,20(s0)
    762c:	00178793          	add	a5,a5,1
    7630:	0cf70263          	beq	a4,a5,76f4 <__swbuf_r+0x150>
    7634:	00c45783          	lhu	a5,12(s0)
    7638:	0017f793          	and	a5,a5,1
    763c:	0c079a63          	bnez	a5,7710 <__swbuf_r+0x16c>
    7640:	00c12983          	lw	s3,12(sp)
    7644:	01c12083          	lw	ra,28(sp)
    7648:	01812403          	lw	s0,24(sp)
    764c:	01012903          	lw	s2,16(sp)
    7650:	00048513          	mv	a0,s1
    7654:	01412483          	lw	s1,20(sp)
    7658:	02010113          	add	sp,sp,32
    765c:	00008067          	ret
    7660:	00040593          	mv	a1,s0
    7664:	00090513          	mv	a0,s2
    7668:	0cc000ef          	jal	7734 <__swsetup_r>
    766c:	08051e63          	bnez	a0,7708 <__swbuf_r+0x164>
    7670:	00c41703          	lh	a4,12(s0)
    7674:	01312623          	sw	s3,12(sp)
    7678:	01042783          	lw	a5,16(s0)
    767c:	01271693          	sll	a3,a4,0x12
    7680:	0ff4f993          	zext.b	s3,s1
    7684:	0ff4f493          	zext.b	s1,s1
    7688:	f606cce3          	bltz	a3,7600 <__swbuf_r+0x5c>
    768c:	06442683          	lw	a3,100(s0)
    7690:	ffffe637          	lui	a2,0xffffe
    7694:	000025b7          	lui	a1,0x2
    7698:	00b76733          	or	a4,a4,a1
    769c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    76a0:	00c6f6b3          	and	a3,a3,a2
    76a4:	00e41623          	sh	a4,12(s0)
    76a8:	00042703          	lw	a4,0(s0)
    76ac:	06d42223          	sw	a3,100(s0)
    76b0:	01442683          	lw	a3,20(s0)
    76b4:	40f707b3          	sub	a5,a4,a5
    76b8:	f4d7cce3          	blt	a5,a3,7610 <__swbuf_r+0x6c>
    76bc:	00040593          	mv	a1,s0
    76c0:	00090513          	mv	a0,s2
    76c4:	b34ff0ef          	jal	69f8 <_fflush_r>
    76c8:	02051e63          	bnez	a0,7704 <__swbuf_r+0x160>
    76cc:	00042703          	lw	a4,0(s0)
    76d0:	00842683          	lw	a3,8(s0)
    76d4:	00100793          	li	a5,1
    76d8:	00170613          	add	a2,a4,1
    76dc:	fff68693          	add	a3,a3,-1
    76e0:	00c42023          	sw	a2,0(s0)
    76e4:	00d42423          	sw	a3,8(s0)
    76e8:	01370023          	sb	s3,0(a4)
    76ec:	01442703          	lw	a4,20(s0)
    76f0:	f4f712e3          	bne	a4,a5,7634 <__swbuf_r+0x90>
    76f4:	00040593          	mv	a1,s0
    76f8:	00090513          	mv	a0,s2
    76fc:	afcff0ef          	jal	69f8 <_fflush_r>
    7700:	f40500e3          	beqz	a0,7640 <__swbuf_r+0x9c>
    7704:	00c12983          	lw	s3,12(sp)
    7708:	fff00493          	li	s1,-1
    770c:	f39ff06f          	j	7644 <__swbuf_r+0xa0>
    7710:	00a00793          	li	a5,10
    7714:	f2f496e3          	bne	s1,a5,7640 <__swbuf_r+0x9c>
    7718:	00040593          	mv	a1,s0
    771c:	00090513          	mv	a0,s2
    7720:	ad8ff0ef          	jal	69f8 <_fflush_r>
    7724:	f0050ee3          	beqz	a0,7640 <__swbuf_r+0x9c>
    7728:	fddff06f          	j	7704 <__swbuf_r+0x160>
    772c:	dc8ff0ef          	jal	6cf4 <__sinit>
    7730:	ea1ff06f          	j	75d0 <__swbuf_r+0x2c>

00007734 <__swsetup_r>:
    7734:	ff010113          	add	sp,sp,-16
    7738:	00812423          	sw	s0,8(sp)
    773c:	00912223          	sw	s1,4(sp)
    7740:	00112623          	sw	ra,12(sp)
    7744:	7fff9797          	auipc	a5,0x7fff9
    7748:	fc47a783          	lw	a5,-60(a5) # 80000708 <_impure_ptr>
    774c:	00050493          	mv	s1,a0
    7750:	00058413          	mv	s0,a1
    7754:	00078663          	beqz	a5,7760 <__swsetup_r+0x2c>
    7758:	0347a703          	lw	a4,52(a5)
    775c:	0e070c63          	beqz	a4,7854 <__swsetup_r+0x120>
    7760:	00c41783          	lh	a5,12(s0)
    7764:	0087f713          	and	a4,a5,8
    7768:	06070a63          	beqz	a4,77dc <__swsetup_r+0xa8>
    776c:	01042703          	lw	a4,16(s0)
    7770:	08070663          	beqz	a4,77fc <__swsetup_r+0xc8>
    7774:	0017f693          	and	a3,a5,1
    7778:	02068863          	beqz	a3,77a8 <__swsetup_r+0x74>
    777c:	01442683          	lw	a3,20(s0)
    7780:	00042423          	sw	zero,8(s0)
    7784:	00000513          	li	a0,0
    7788:	40d006b3          	neg	a3,a3
    778c:	00d42c23          	sw	a3,24(s0)
    7790:	02070a63          	beqz	a4,77c4 <__swsetup_r+0x90>
    7794:	00c12083          	lw	ra,12(sp)
    7798:	00812403          	lw	s0,8(sp)
    779c:	00412483          	lw	s1,4(sp)
    77a0:	01010113          	add	sp,sp,16
    77a4:	00008067          	ret
    77a8:	0027f693          	and	a3,a5,2
    77ac:	00000613          	li	a2,0
    77b0:	00069463          	bnez	a3,77b8 <__swsetup_r+0x84>
    77b4:	01442603          	lw	a2,20(s0)
    77b8:	00c42423          	sw	a2,8(s0)
    77bc:	00000513          	li	a0,0
    77c0:	fc071ae3          	bnez	a4,7794 <__swsetup_r+0x60>
    77c4:	0807f713          	and	a4,a5,128
    77c8:	fc0706e3          	beqz	a4,7794 <__swsetup_r+0x60>
    77cc:	0407e793          	or	a5,a5,64
    77d0:	00f41623          	sh	a5,12(s0)
    77d4:	fff00513          	li	a0,-1
    77d8:	fbdff06f          	j	7794 <__swsetup_r+0x60>
    77dc:	0107f713          	and	a4,a5,16
    77e0:	08070063          	beqz	a4,7860 <__swsetup_r+0x12c>
    77e4:	0047f713          	and	a4,a5,4
    77e8:	02071c63          	bnez	a4,7820 <__swsetup_r+0xec>
    77ec:	01042703          	lw	a4,16(s0)
    77f0:	0087e793          	or	a5,a5,8
    77f4:	00f41623          	sh	a5,12(s0)
    77f8:	f6071ee3          	bnez	a4,7774 <__swsetup_r+0x40>
    77fc:	2807f693          	and	a3,a5,640
    7800:	20000613          	li	a2,512
    7804:	f6c688e3          	beq	a3,a2,7774 <__swsetup_r+0x40>
    7808:	00040593          	mv	a1,s0
    780c:	00048513          	mv	a0,s1
    7810:	6cc030ef          	jal	aedc <__smakebuf_r>
    7814:	00c41783          	lh	a5,12(s0)
    7818:	01042703          	lw	a4,16(s0)
    781c:	f59ff06f          	j	7774 <__swsetup_r+0x40>
    7820:	03042583          	lw	a1,48(s0)
    7824:	00058e63          	beqz	a1,7840 <__swsetup_r+0x10c>
    7828:	04040713          	add	a4,s0,64
    782c:	00e58863          	beq	a1,a4,783c <__swsetup_r+0x108>
    7830:	00048513          	mv	a0,s1
    7834:	cf1f90ef          	jal	1524 <_free_r>
    7838:	00c41783          	lh	a5,12(s0)
    783c:	02042823          	sw	zero,48(s0)
    7840:	01042703          	lw	a4,16(s0)
    7844:	fdb7f793          	and	a5,a5,-37
    7848:	00042223          	sw	zero,4(s0)
    784c:	00e42023          	sw	a4,0(s0)
    7850:	fa1ff06f          	j	77f0 <__swsetup_r+0xbc>
    7854:	00078513          	mv	a0,a5
    7858:	c9cff0ef          	jal	6cf4 <__sinit>
    785c:	f05ff06f          	j	7760 <__swsetup_r+0x2c>
    7860:	00900713          	li	a4,9
    7864:	00e4a023          	sw	a4,0(s1)
    7868:	0407e793          	or	a5,a5,64
    786c:	00f41623          	sh	a5,12(s0)
    7870:	fff00513          	li	a0,-1
    7874:	f21ff06f          	j	7794 <__swsetup_r+0x60>

00007878 <__fputwc>:
    7878:	fc010113          	add	sp,sp,-64
    787c:	02812c23          	sw	s0,56(sp)
    7880:	03412423          	sw	s4,40(sp)
    7884:	03512223          	sw	s5,36(sp)
    7888:	02112e23          	sw	ra,60(sp)
    788c:	02912a23          	sw	s1,52(sp)
    7890:	03312623          	sw	s3,44(sp)
    7894:	00050a13          	mv	s4,a0
    7898:	00058a93          	mv	s5,a1
    789c:	00060413          	mv	s0,a2
    78a0:	374000ef          	jal	7c14 <__locale_mb_cur_max>
    78a4:	00100793          	li	a5,1
    78a8:	02f51663          	bne	a0,a5,78d4 <__fputwc+0x5c>
    78ac:	fffa8793          	add	a5,s5,-1
    78b0:	0fe00713          	li	a4,254
    78b4:	02f76063          	bltu	a4,a5,78d4 <__fputwc+0x5c>
    78b8:	03212823          	sw	s2,48(sp)
    78bc:	03612023          	sw	s6,32(sp)
    78c0:	01712e23          	sw	s7,28(sp)
    78c4:	01510423          	sb	s5,8(sp)
    78c8:	00100993          	li	s3,1
    78cc:	00810493          	add	s1,sp,8
    78d0:	0380006f          	j	7908 <__fputwc+0x90>
    78d4:	00810493          	add	s1,sp,8
    78d8:	05c40693          	add	a3,s0,92
    78dc:	000a8613          	mv	a2,s5
    78e0:	00048593          	mv	a1,s1
    78e4:	000a0513          	mv	a0,s4
    78e8:	3e8030ef          	jal	acd0 <_wcrtomb_r>
    78ec:	fff00793          	li	a5,-1
    78f0:	00050993          	mv	s3,a0
    78f4:	0cf50a63          	beq	a0,a5,79c8 <__fputwc+0x150>
    78f8:	0a050663          	beqz	a0,79a4 <__fputwc+0x12c>
    78fc:	03212823          	sw	s2,48(sp)
    7900:	03612023          	sw	s6,32(sp)
    7904:	01712e23          	sw	s7,28(sp)
    7908:	00000913          	li	s2,0
    790c:	fff00b13          	li	s6,-1
    7910:	00a00b93          	li	s7,10
    7914:	0200006f          	j	7934 <__fputwc+0xbc>
    7918:	00042783          	lw	a5,0(s0)
    791c:	00178693          	add	a3,a5,1
    7920:	00d42023          	sw	a3,0(s0)
    7924:	00e78023          	sb	a4,0(a5)
    7928:	00190913          	add	s2,s2,1
    792c:	00148493          	add	s1,s1,1
    7930:	07397463          	bgeu	s2,s3,7998 <__fputwc+0x120>
    7934:	00842783          	lw	a5,8(s0)
    7938:	0004c703          	lbu	a4,0(s1)
    793c:	fff78793          	add	a5,a5,-1
    7940:	00f42423          	sw	a5,8(s0)
    7944:	fc07dae3          	bgez	a5,7918 <__fputwc+0xa0>
    7948:	01842683          	lw	a3,24(s0)
    794c:	00040613          	mv	a2,s0
    7950:	00070593          	mv	a1,a4
    7954:	000a0513          	mv	a0,s4
    7958:	00d7c463          	blt	a5,a3,7960 <__fputwc+0xe8>
    795c:	fb771ee3          	bne	a4,s7,7918 <__fputwc+0xa0>
    7960:	c45ff0ef          	jal	75a4 <__swbuf_r>
    7964:	fd6512e3          	bne	a0,s6,7928 <__fputwc+0xb0>
    7968:	03012903          	lw	s2,48(sp)
    796c:	02012b03          	lw	s6,32(sp)
    7970:	01c12b83          	lw	s7,28(sp)
    7974:	03c12083          	lw	ra,60(sp)
    7978:	03812403          	lw	s0,56(sp)
    797c:	03412483          	lw	s1,52(sp)
    7980:	02c12983          	lw	s3,44(sp)
    7984:	02812a03          	lw	s4,40(sp)
    7988:	02412a83          	lw	s5,36(sp)
    798c:	fff00513          	li	a0,-1
    7990:	04010113          	add	sp,sp,64
    7994:	00008067          	ret
    7998:	03012903          	lw	s2,48(sp)
    799c:	02012b03          	lw	s6,32(sp)
    79a0:	01c12b83          	lw	s7,28(sp)
    79a4:	03c12083          	lw	ra,60(sp)
    79a8:	03812403          	lw	s0,56(sp)
    79ac:	03412483          	lw	s1,52(sp)
    79b0:	02c12983          	lw	s3,44(sp)
    79b4:	02812a03          	lw	s4,40(sp)
    79b8:	000a8513          	mv	a0,s5
    79bc:	02412a83          	lw	s5,36(sp)
    79c0:	04010113          	add	sp,sp,64
    79c4:	00008067          	ret
    79c8:	00c45783          	lhu	a5,12(s0)
    79cc:	0407e793          	or	a5,a5,64
    79d0:	00f41623          	sh	a5,12(s0)
    79d4:	fa1ff06f          	j	7974 <__fputwc+0xfc>

000079d8 <_fputwc_r>:
    79d8:	06462783          	lw	a5,100(a2)
    79dc:	fe010113          	add	sp,sp,-32
    79e0:	00812c23          	sw	s0,24(sp)
    79e4:	00912a23          	sw	s1,20(sp)
    79e8:	0017f713          	and	a4,a5,1
    79ec:	00112e23          	sw	ra,28(sp)
    79f0:	00c61783          	lh	a5,12(a2)
    79f4:	00060413          	mv	s0,a2
    79f8:	00050493          	mv	s1,a0
    79fc:	00071663          	bnez	a4,7a08 <_fputwc_r+0x30>
    7a00:	2007f713          	and	a4,a5,512
    7a04:	08070463          	beqz	a4,7a8c <_fputwc_r+0xb4>
    7a08:	01279713          	sll	a4,a5,0x12
    7a0c:	02074063          	bltz	a4,7a2c <_fputwc_r+0x54>
    7a10:	06442703          	lw	a4,100(s0)
    7a14:	000026b7          	lui	a3,0x2
    7a18:	00d7e7b3          	or	a5,a5,a3
    7a1c:	000026b7          	lui	a3,0x2
    7a20:	00d76733          	or	a4,a4,a3
    7a24:	00f41623          	sh	a5,12(s0)
    7a28:	06e42223          	sw	a4,100(s0)
    7a2c:	00048513          	mv	a0,s1
    7a30:	00040613          	mv	a2,s0
    7a34:	e45ff0ef          	jal	7878 <__fputwc>
    7a38:	06442783          	lw	a5,100(s0)
    7a3c:	00050493          	mv	s1,a0
    7a40:	0017f793          	and	a5,a5,1
    7a44:	00079863          	bnez	a5,7a54 <_fputwc_r+0x7c>
    7a48:	00c45783          	lhu	a5,12(s0)
    7a4c:	2007f793          	and	a5,a5,512
    7a50:	00078e63          	beqz	a5,7a6c <_fputwc_r+0x94>
    7a54:	01c12083          	lw	ra,28(sp)
    7a58:	01812403          	lw	s0,24(sp)
    7a5c:	00048513          	mv	a0,s1
    7a60:	01412483          	lw	s1,20(sp)
    7a64:	02010113          	add	sp,sp,32
    7a68:	00008067          	ret
    7a6c:	05842503          	lw	a0,88(s0)
    7a70:	e60f90ef          	jal	10d0 <__retarget_lock_release_recursive>
    7a74:	01c12083          	lw	ra,28(sp)
    7a78:	01812403          	lw	s0,24(sp)
    7a7c:	00048513          	mv	a0,s1
    7a80:	01412483          	lw	s1,20(sp)
    7a84:	02010113          	add	sp,sp,32
    7a88:	00008067          	ret
    7a8c:	05862503          	lw	a0,88(a2)
    7a90:	00b12623          	sw	a1,12(sp)
    7a94:	e38f90ef          	jal	10cc <__retarget_lock_acquire_recursive>
    7a98:	00c41783          	lh	a5,12(s0)
    7a9c:	00c12583          	lw	a1,12(sp)
    7aa0:	f69ff06f          	j	7a08 <_fputwc_r+0x30>

00007aa4 <memchr>:
    7aa4:	00357793          	and	a5,a0,3
    7aa8:	0ff5f693          	zext.b	a3,a1
    7aac:	02078a63          	beqz	a5,7ae0 <memchr+0x3c>
    7ab0:	fff60793          	add	a5,a2,-1
    7ab4:	02060e63          	beqz	a2,7af0 <memchr+0x4c>
    7ab8:	fff00613          	li	a2,-1
    7abc:	0180006f          	j	7ad4 <memchr+0x30>
    7ac0:	00150513          	add	a0,a0,1
    7ac4:	00357713          	and	a4,a0,3
    7ac8:	00070e63          	beqz	a4,7ae4 <memchr+0x40>
    7acc:	fff78793          	add	a5,a5,-1
    7ad0:	02c78063          	beq	a5,a2,7af0 <memchr+0x4c>
    7ad4:	00054703          	lbu	a4,0(a0)
    7ad8:	fed714e3          	bne	a4,a3,7ac0 <memchr+0x1c>
    7adc:	00008067          	ret
    7ae0:	00060793          	mv	a5,a2
    7ae4:	00300713          	li	a4,3
    7ae8:	00f76863          	bltu	a4,a5,7af8 <memchr+0x54>
    7aec:	06079063          	bnez	a5,7b4c <memchr+0xa8>
    7af0:	00000513          	li	a0,0
    7af4:	00008067          	ret
    7af8:	0ff5f593          	zext.b	a1,a1
    7afc:	00859713          	sll	a4,a1,0x8
    7b00:	00b705b3          	add	a1,a4,a1
    7b04:	01059713          	sll	a4,a1,0x10
    7b08:	feff08b7          	lui	a7,0xfeff0
    7b0c:	80808837          	lui	a6,0x80808
    7b10:	00e585b3          	add	a1,a1,a4
    7b14:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7b18:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7b1c:	00300313          	li	t1,3
    7b20:	0100006f          	j	7b30 <memchr+0x8c>
    7b24:	ffc78793          	add	a5,a5,-4
    7b28:	00450513          	add	a0,a0,4
    7b2c:	fcf370e3          	bgeu	t1,a5,7aec <memchr+0x48>
    7b30:	00052703          	lw	a4,0(a0)
    7b34:	00e5c733          	xor	a4,a1,a4
    7b38:	01170633          	add	a2,a4,a7
    7b3c:	fff74713          	not	a4,a4
    7b40:	00e67733          	and	a4,a2,a4
    7b44:	01077733          	and	a4,a4,a6
    7b48:	fc070ee3          	beqz	a4,7b24 <memchr+0x80>
    7b4c:	00f507b3          	add	a5,a0,a5
    7b50:	00c0006f          	j	7b5c <memchr+0xb8>
    7b54:	00150513          	add	a0,a0,1
    7b58:	f8f50ce3          	beq	a0,a5,7af0 <memchr+0x4c>
    7b5c:	00054703          	lbu	a4,0(a0)
    7b60:	fed71ae3          	bne	a4,a3,7b54 <memchr+0xb0>
    7b64:	00008067          	ret

00007b68 <strncpy>:
    7b68:	00a5e7b3          	or	a5,a1,a0
    7b6c:	0037f793          	and	a5,a5,3
    7b70:	00079663          	bnez	a5,7b7c <strncpy+0x14>
    7b74:	00300793          	li	a5,3
    7b78:	04c7e663          	bltu	a5,a2,7bc4 <strncpy+0x5c>
    7b7c:	00050713          	mv	a4,a0
    7b80:	01c0006f          	j	7b9c <strncpy+0x34>
    7b84:	fff5c683          	lbu	a3,-1(a1) # 1fff <_malloc_r+0x7cf>
    7b88:	fff60813          	add	a6,a2,-1
    7b8c:	fed78fa3          	sb	a3,-1(a5)
    7b90:	00068e63          	beqz	a3,7bac <strncpy+0x44>
    7b94:	00078713          	mv	a4,a5
    7b98:	00080613          	mv	a2,a6
    7b9c:	00158593          	add	a1,a1,1
    7ba0:	00170793          	add	a5,a4,1
    7ba4:	fe0610e3          	bnez	a2,7b84 <strncpy+0x1c>
    7ba8:	00008067          	ret
    7bac:	00c70733          	add	a4,a4,a2
    7bb0:	06080063          	beqz	a6,7c10 <strncpy+0xa8>
    7bb4:	00178793          	add	a5,a5,1
    7bb8:	fe078fa3          	sb	zero,-1(a5)
    7bbc:	fee79ce3          	bne	a5,a4,7bb4 <strncpy+0x4c>
    7bc0:	00008067          	ret
    7bc4:	feff0337          	lui	t1,0xfeff0
    7bc8:	808088b7          	lui	a7,0x80808
    7bcc:	00050713          	mv	a4,a0
    7bd0:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7bd4:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7bd8:	00300e13          	li	t3,3
    7bdc:	0180006f          	j	7bf4 <strncpy+0x8c>
    7be0:	00d72023          	sw	a3,0(a4)
    7be4:	ffc60613          	add	a2,a2,-4
    7be8:	00470713          	add	a4,a4,4
    7bec:	00458593          	add	a1,a1,4
    7bf0:	face76e3          	bgeu	t3,a2,7b9c <strncpy+0x34>
    7bf4:	0005a683          	lw	a3,0(a1)
    7bf8:	006687b3          	add	a5,a3,t1
    7bfc:	fff6c813          	not	a6,a3
    7c00:	0107f7b3          	and	a5,a5,a6
    7c04:	0117f7b3          	and	a5,a5,a7
    7c08:	fc078ce3          	beqz	a5,7be0 <strncpy+0x78>
    7c0c:	f91ff06f          	j	7b9c <strncpy+0x34>
    7c10:	00008067          	ret

00007c14 <__locale_mb_cur_max>:
    7c14:	7fff9517          	auipc	a0,0x7fff9
    7c18:	a4854503          	lbu	a0,-1464(a0) # 8000065c <__global_locale+0x128>
    7c1c:	00008067          	ret

00007c20 <_localeconv_r>:
    7c20:	7fff9517          	auipc	a0,0x7fff9
    7c24:	a0450513          	add	a0,a0,-1532 # 80000624 <__global_locale+0xf0>
    7c28:	00008067          	ret

00007c2c <_close_r>:
    7c2c:	ff010113          	add	sp,sp,-16
    7c30:	00812423          	sw	s0,8(sp)
    7c34:	00050413          	mv	s0,a0
    7c38:	00058513          	mv	a0,a1
    7c3c:	7fff9797          	auipc	a5,0x7fff9
    7c40:	ac07ae23          	sw	zero,-1316(a5) # 80000718 <errno>
    7c44:	00112623          	sw	ra,12(sp)
    7c48:	85cf90ef          	jal	ca4 <_close>
    7c4c:	fff00793          	li	a5,-1
    7c50:	00f50a63          	beq	a0,a5,7c64 <_close_r+0x38>
    7c54:	00c12083          	lw	ra,12(sp)
    7c58:	00812403          	lw	s0,8(sp)
    7c5c:	01010113          	add	sp,sp,16
    7c60:	00008067          	ret
    7c64:	7fff9797          	auipc	a5,0x7fff9
    7c68:	ab47a783          	lw	a5,-1356(a5) # 80000718 <errno>
    7c6c:	fe0784e3          	beqz	a5,7c54 <_close_r+0x28>
    7c70:	00c12083          	lw	ra,12(sp)
    7c74:	00f42023          	sw	a5,0(s0)
    7c78:	00812403          	lw	s0,8(sp)
    7c7c:	01010113          	add	sp,sp,16
    7c80:	00008067          	ret

00007c84 <_lseek_r>:
    7c84:	ff010113          	add	sp,sp,-16
    7c88:	00058713          	mv	a4,a1
    7c8c:	00812423          	sw	s0,8(sp)
    7c90:	00060593          	mv	a1,a2
    7c94:	00050413          	mv	s0,a0
    7c98:	00068613          	mv	a2,a3
    7c9c:	00070513          	mv	a0,a4
    7ca0:	7fff9797          	auipc	a5,0x7fff9
    7ca4:	a607ac23          	sw	zero,-1416(a5) # 80000718 <errno>
    7ca8:	00112623          	sw	ra,12(sp)
    7cac:	834f90ef          	jal	ce0 <_lseek>
    7cb0:	fff00793          	li	a5,-1
    7cb4:	00f50a63          	beq	a0,a5,7cc8 <_lseek_r+0x44>
    7cb8:	00c12083          	lw	ra,12(sp)
    7cbc:	00812403          	lw	s0,8(sp)
    7cc0:	01010113          	add	sp,sp,16
    7cc4:	00008067          	ret
    7cc8:	7fff9797          	auipc	a5,0x7fff9
    7ccc:	a507a783          	lw	a5,-1456(a5) # 80000718 <errno>
    7cd0:	fe0784e3          	beqz	a5,7cb8 <_lseek_r+0x34>
    7cd4:	00c12083          	lw	ra,12(sp)
    7cd8:	00f42023          	sw	a5,0(s0)
    7cdc:	00812403          	lw	s0,8(sp)
    7ce0:	01010113          	add	sp,sp,16
    7ce4:	00008067          	ret

00007ce8 <_read_r>:
    7ce8:	ff010113          	add	sp,sp,-16
    7cec:	00058713          	mv	a4,a1
    7cf0:	00812423          	sw	s0,8(sp)
    7cf4:	00060593          	mv	a1,a2
    7cf8:	00050413          	mv	s0,a0
    7cfc:	00068613          	mv	a2,a3
    7d00:	00070513          	mv	a0,a4
    7d04:	7fff9797          	auipc	a5,0x7fff9
    7d08:	a007aa23          	sw	zero,-1516(a5) # 80000718 <errno>
    7d0c:	00112623          	sw	ra,12(sp)
    7d10:	fd9f80ef          	jal	ce8 <_read>
    7d14:	fff00793          	li	a5,-1
    7d18:	00f50a63          	beq	a0,a5,7d2c <_read_r+0x44>
    7d1c:	00c12083          	lw	ra,12(sp)
    7d20:	00812403          	lw	s0,8(sp)
    7d24:	01010113          	add	sp,sp,16
    7d28:	00008067          	ret
    7d2c:	7fff9797          	auipc	a5,0x7fff9
    7d30:	9ec7a783          	lw	a5,-1556(a5) # 80000718 <errno>
    7d34:	fe0784e3          	beqz	a5,7d1c <_read_r+0x34>
    7d38:	00c12083          	lw	ra,12(sp)
    7d3c:	00f42023          	sw	a5,0(s0)
    7d40:	00812403          	lw	s0,8(sp)
    7d44:	01010113          	add	sp,sp,16
    7d48:	00008067          	ret

00007d4c <_sbrk_r>:
    7d4c:	ff010113          	add	sp,sp,-16
    7d50:	00812423          	sw	s0,8(sp)
    7d54:	00050413          	mv	s0,a0
    7d58:	00058513          	mv	a0,a1
    7d5c:	7fff9797          	auipc	a5,0x7fff9
    7d60:	9a07ae23          	sw	zero,-1604(a5) # 80000718 <errno>
    7d64:	00112623          	sw	ra,12(sp)
    7d68:	900f90ef          	jal	e68 <_sbrk>
    7d6c:	fff00793          	li	a5,-1
    7d70:	00f50a63          	beq	a0,a5,7d84 <_sbrk_r+0x38>
    7d74:	00c12083          	lw	ra,12(sp)
    7d78:	00812403          	lw	s0,8(sp)
    7d7c:	01010113          	add	sp,sp,16
    7d80:	00008067          	ret
    7d84:	7fff9797          	auipc	a5,0x7fff9
    7d88:	9947a783          	lw	a5,-1644(a5) # 80000718 <errno>
    7d8c:	fe0784e3          	beqz	a5,7d74 <_sbrk_r+0x28>
    7d90:	00c12083          	lw	ra,12(sp)
    7d94:	00f42023          	sw	a5,0(s0)
    7d98:	00812403          	lw	s0,8(sp)
    7d9c:	01010113          	add	sp,sp,16
    7da0:	00008067          	ret

00007da4 <_write_r>:
    7da4:	ff010113          	add	sp,sp,-16
    7da8:	00058713          	mv	a4,a1
    7dac:	00812423          	sw	s0,8(sp)
    7db0:	00060593          	mv	a1,a2
    7db4:	00050413          	mv	s0,a0
    7db8:	00068613          	mv	a2,a3
    7dbc:	00070513          	mv	a0,a4
    7dc0:	7fff9797          	auipc	a5,0x7fff9
    7dc4:	9407ac23          	sw	zero,-1704(a5) # 80000718 <errno>
    7dc8:	00112623          	sw	ra,12(sp)
    7dcc:	ff9f80ef          	jal	dc4 <_write>
    7dd0:	fff00793          	li	a5,-1
    7dd4:	00f50a63          	beq	a0,a5,7de8 <_write_r+0x44>
    7dd8:	00c12083          	lw	ra,12(sp)
    7ddc:	00812403          	lw	s0,8(sp)
    7de0:	01010113          	add	sp,sp,16
    7de4:	00008067          	ret
    7de8:	7fff9797          	auipc	a5,0x7fff9
    7dec:	9307a783          	lw	a5,-1744(a5) # 80000718 <errno>
    7df0:	fe0784e3          	beqz	a5,7dd8 <_write_r+0x34>
    7df4:	00c12083          	lw	ra,12(sp)
    7df8:	00f42023          	sw	a5,0(s0)
    7dfc:	00812403          	lw	s0,8(sp)
    7e00:	01010113          	add	sp,sp,16
    7e04:	00008067          	ret

00007e08 <memmove>:
    7e08:	02a5f663          	bgeu	a1,a0,7e34 <memmove+0x2c>
    7e0c:	00c58733          	add	a4,a1,a2
    7e10:	02e57263          	bgeu	a0,a4,7e34 <memmove+0x2c>
    7e14:	00c507b3          	add	a5,a0,a2
    7e18:	04060663          	beqz	a2,7e64 <memmove+0x5c>
    7e1c:	fff74683          	lbu	a3,-1(a4)
    7e20:	fff78793          	add	a5,a5,-1
    7e24:	fff70713          	add	a4,a4,-1
    7e28:	00d78023          	sb	a3,0(a5)
    7e2c:	fef518e3          	bne	a0,a5,7e1c <memmove+0x14>
    7e30:	00008067          	ret
    7e34:	00f00793          	li	a5,15
    7e38:	02c7e863          	bltu	a5,a2,7e68 <memmove+0x60>
    7e3c:	00050793          	mv	a5,a0
    7e40:	fff60693          	add	a3,a2,-1
    7e44:	0c060263          	beqz	a2,7f08 <memmove+0x100>
    7e48:	00168693          	add	a3,a3,1 # 2001 <_malloc_r+0x7d1>
    7e4c:	00d786b3          	add	a3,a5,a3
    7e50:	0005c703          	lbu	a4,0(a1)
    7e54:	00178793          	add	a5,a5,1
    7e58:	00158593          	add	a1,a1,1
    7e5c:	fee78fa3          	sb	a4,-1(a5)
    7e60:	fed798e3          	bne	a5,a3,7e50 <memmove+0x48>
    7e64:	00008067          	ret
    7e68:	00b567b3          	or	a5,a0,a1
    7e6c:	0037f793          	and	a5,a5,3
    7e70:	08079663          	bnez	a5,7efc <memmove+0xf4>
    7e74:	ff060893          	add	a7,a2,-16
    7e78:	ff08f893          	and	a7,a7,-16
    7e7c:	01088893          	add	a7,a7,16
    7e80:	011506b3          	add	a3,a0,a7
    7e84:	00058713          	mv	a4,a1
    7e88:	00050793          	mv	a5,a0
    7e8c:	00072803          	lw	a6,0(a4)
    7e90:	01070713          	add	a4,a4,16
    7e94:	01078793          	add	a5,a5,16
    7e98:	ff07a823          	sw	a6,-16(a5)
    7e9c:	ff472803          	lw	a6,-12(a4)
    7ea0:	ff07aa23          	sw	a6,-12(a5)
    7ea4:	ff872803          	lw	a6,-8(a4)
    7ea8:	ff07ac23          	sw	a6,-8(a5)
    7eac:	ffc72803          	lw	a6,-4(a4)
    7eb0:	ff07ae23          	sw	a6,-4(a5)
    7eb4:	fcd79ce3          	bne	a5,a3,7e8c <memmove+0x84>
    7eb8:	00c67813          	and	a6,a2,12
    7ebc:	011585b3          	add	a1,a1,a7
    7ec0:	00f67713          	and	a4,a2,15
    7ec4:	04080463          	beqz	a6,7f0c <memmove+0x104>
    7ec8:	ffc70813          	add	a6,a4,-4
    7ecc:	ffc87813          	and	a6,a6,-4
    7ed0:	00480813          	add	a6,a6,4
    7ed4:	010687b3          	add	a5,a3,a6
    7ed8:	00058713          	mv	a4,a1
    7edc:	00072883          	lw	a7,0(a4)
    7ee0:	00468693          	add	a3,a3,4
    7ee4:	00470713          	add	a4,a4,4
    7ee8:	ff16ae23          	sw	a7,-4(a3)
    7eec:	fef698e3          	bne	a3,a5,7edc <memmove+0xd4>
    7ef0:	00367613          	and	a2,a2,3
    7ef4:	010585b3          	add	a1,a1,a6
    7ef8:	f49ff06f          	j	7e40 <memmove+0x38>
    7efc:	fff60693          	add	a3,a2,-1
    7f00:	00050793          	mv	a5,a0
    7f04:	f45ff06f          	j	7e48 <memmove+0x40>
    7f08:	00008067          	ret
    7f0c:	00070613          	mv	a2,a4
    7f10:	f31ff06f          	j	7e40 <memmove+0x38>

00007f14 <frexp>:
    7f14:	ff010113          	add	sp,sp,-16
    7f18:	00912223          	sw	s1,4(sp)
    7f1c:	800004b7          	lui	s1,0x80000
    7f20:	00812423          	sw	s0,8(sp)
    7f24:	00112623          	sw	ra,12(sp)
    7f28:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7f2c:	00060413          	mv	s0,a2
    7f30:	00062023          	sw	zero,0(a2)
    7f34:	00b4f6b3          	and	a3,s1,a1
    7f38:	7ff00637          	lui	a2,0x7ff00
    7f3c:	00058793          	mv	a5,a1
    7f40:	00050713          	mv	a4,a0
    7f44:	04c6f063          	bgeu	a3,a2,7f84 <frexp+0x70>
    7f48:	00a6e633          	or	a2,a3,a0
    7f4c:	02060c63          	beqz	a2,7f84 <frexp+0x70>
    7f50:	0145d613          	srl	a2,a1,0x14
    7f54:	7ff67613          	and	a2,a2,2047
    7f58:	04060463          	beqz	a2,7fa0 <frexp+0x8c>
    7f5c:	00000593          	li	a1,0
    7f60:	80100637          	lui	a2,0x80100
    7f64:	4146d693          	sra	a3,a3,0x14
    7f68:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7f6c:	c0268693          	add	a3,a3,-1022
    7f70:	00c7f7b3          	and	a5,a5,a2
    7f74:	00b686b3          	add	a3,a3,a1
    7f78:	3fe00637          	lui	a2,0x3fe00
    7f7c:	00c7e7b3          	or	a5,a5,a2
    7f80:	00d42023          	sw	a3,0(s0)
    7f84:	00c12083          	lw	ra,12(sp)
    7f88:	00812403          	lw	s0,8(sp)
    7f8c:	00412483          	lw	s1,4(sp)
    7f90:	00070513          	mv	a0,a4
    7f94:	00078593          	mv	a1,a5
    7f98:	01010113          	add	sp,sp,16
    7f9c:	00008067          	ret
    7fa0:	7fff8797          	auipc	a5,0x7fff8
    7fa4:	72078793          	add	a5,a5,1824 # 800006c0 <__global_locale+0x18c>
    7fa8:	0047a683          	lw	a3,4(a5)
    7fac:	0007a603          	lw	a2,0(a5)
    7fb0:	009050ef          	jal	d7b8 <__muldf3>
    7fb4:	00058793          	mv	a5,a1
    7fb8:	00b4f6b3          	and	a3,s1,a1
    7fbc:	00050713          	mv	a4,a0
    7fc0:	fca00593          	li	a1,-54
    7fc4:	f9dff06f          	j	7f60 <frexp+0x4c>

00007fc8 <quorem>:
    7fc8:	fb010113          	add	sp,sp,-80
    7fcc:	04912223          	sw	s1,68(sp)
    7fd0:	01052783          	lw	a5,16(a0)
    7fd4:	0105a483          	lw	s1,16(a1)
    7fd8:	04112623          	sw	ra,76(sp)
    7fdc:	00b12423          	sw	a1,8(sp)
    7fe0:	2097ca63          	blt	a5,s1,81f4 <quorem+0x22c>
    7fe4:	fff48493          	add	s1,s1,-1
    7fe8:	03512a23          	sw	s5,52(sp)
    7fec:	03812423          	sw	s8,40(sp)
    7ff0:	00249a93          	sll	s5,s1,0x2
    7ff4:	01458c13          	add	s8,a1,20
    7ff8:	05212023          	sw	s2,64(sp)
    7ffc:	03312e23          	sw	s3,60(sp)
    8000:	015c0933          	add	s2,s8,s5
    8004:	01450993          	add	s3,a0,20
    8008:	015987b3          	add	a5,s3,s5
    800c:	03712623          	sw	s7,44(sp)
    8010:	00092b83          	lw	s7,0(s2)
    8014:	03912223          	sw	s9,36(sp)
    8018:	0007ac83          	lw	s9,0(a5)
    801c:	001b8b93          	add	s7,s7,1
    8020:	03412c23          	sw	s4,56(sp)
    8024:	000b8593          	mv	a1,s7
    8028:	00050a13          	mv	s4,a0
    802c:	000c8513          	mv	a0,s9
    8030:	04812423          	sw	s0,72(sp)
    8034:	00f12623          	sw	a5,12(sp)
    8038:	70d060ef          	jal	ef44 <__hidden___udivsi3>
    803c:	00050413          	mv	s0,a0
    8040:	0d7cee63          	bltu	s9,s7,811c <quorem+0x154>
    8044:	03a12023          	sw	s10,32(sp)
    8048:	00010d37          	lui	s10,0x10
    804c:	01b12e23          	sw	s11,28(sp)
    8050:	03612823          	sw	s6,48(sp)
    8054:	000c0a93          	mv	s5,s8
    8058:	00098d93          	mv	s11,s3
    805c:	00000c93          	li	s9,0
    8060:	00000b93          	li	s7,0
    8064:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    8068:	000aab03          	lw	s6,0(s5)
    806c:	00040593          	mv	a1,s0
    8070:	004d8d93          	add	s11,s11,4
    8074:	01ab7533          	and	a0,s6,s10
    8078:	609060ef          	jal	ee80 <__mulsi3>
    807c:	00050793          	mv	a5,a0
    8080:	00040593          	mv	a1,s0
    8084:	010b5513          	srl	a0,s6,0x10
    8088:	01978cb3          	add	s9,a5,s9
    808c:	5f5060ef          	jal	ee80 <__mulsi3>
    8090:	ffcda603          	lw	a2,-4(s11)
    8094:	01acf733          	and	a4,s9,s10
    8098:	010cdc93          	srl	s9,s9,0x10
    809c:	01a677b3          	and	a5,a2,s10
    80a0:	40e787b3          	sub	a5,a5,a4
    80a4:	017787b3          	add	a5,a5,s7
    80a8:	01950533          	add	a0,a0,s9
    80ac:	4107d713          	sra	a4,a5,0x10
    80b0:	01a575b3          	and	a1,a0,s10
    80b4:	01065613          	srl	a2,a2,0x10
    80b8:	40b70733          	sub	a4,a4,a1
    80bc:	00c70733          	add	a4,a4,a2
    80c0:	01a7f7b3          	and	a5,a5,s10
    80c4:	01071613          	sll	a2,a4,0x10
    80c8:	00c7e7b3          	or	a5,a5,a2
    80cc:	004a8a93          	add	s5,s5,4
    80d0:	fefdae23          	sw	a5,-4(s11)
    80d4:	01055c93          	srl	s9,a0,0x10
    80d8:	41075b93          	sra	s7,a4,0x10
    80dc:	f95976e3          	bgeu	s2,s5,8068 <quorem+0xa0>
    80e0:	00c12703          	lw	a4,12(sp)
    80e4:	00072783          	lw	a5,0(a4)
    80e8:	12079063          	bnez	a5,8208 <quorem+0x240>
    80ec:	ffc70a93          	add	s5,a4,-4
    80f0:	0159e863          	bltu	s3,s5,8100 <quorem+0x138>
    80f4:	0180006f          	j	810c <quorem+0x144>
    80f8:	fff48493          	add	s1,s1,-1
    80fc:	0159f863          	bgeu	s3,s5,810c <quorem+0x144>
    8100:	000aa783          	lw	a5,0(s5)
    8104:	ffca8a93          	add	s5,s5,-4
    8108:	fe0788e3          	beqz	a5,80f8 <quorem+0x130>
    810c:	03012b03          	lw	s6,48(sp)
    8110:	02012d03          	lw	s10,32(sp)
    8114:	01c12d83          	lw	s11,28(sp)
    8118:	009a2823          	sw	s1,16(s4)
    811c:	00812583          	lw	a1,8(sp)
    8120:	000a0513          	mv	a0,s4
    8124:	1fc020ef          	jal	a320 <__mcmp>
    8128:	08054c63          	bltz	a0,81c0 <quorem+0x1f8>
    812c:	00010537          	lui	a0,0x10
    8130:	00098593          	mv	a1,s3
    8134:	00000713          	li	a4,0
    8138:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    813c:	0005a683          	lw	a3,0(a1)
    8140:	000c2603          	lw	a2,0(s8)
    8144:	00458593          	add	a1,a1,4
    8148:	00a6f7b3          	and	a5,a3,a0
    814c:	00a67833          	and	a6,a2,a0
    8150:	410787b3          	sub	a5,a5,a6
    8154:	00e787b3          	add	a5,a5,a4
    8158:	4107d713          	sra	a4,a5,0x10
    815c:	01065613          	srl	a2,a2,0x10
    8160:	0106d693          	srl	a3,a3,0x10
    8164:	40c70733          	sub	a4,a4,a2
    8168:	00d70733          	add	a4,a4,a3
    816c:	01071693          	sll	a3,a4,0x10
    8170:	00a7f7b3          	and	a5,a5,a0
    8174:	00d7e7b3          	or	a5,a5,a3
    8178:	004c0c13          	add	s8,s8,4
    817c:	fef5ae23          	sw	a5,-4(a1)
    8180:	41075713          	sra	a4,a4,0x10
    8184:	fb897ce3          	bgeu	s2,s8,813c <quorem+0x174>
    8188:	00249793          	sll	a5,s1,0x2
    818c:	00f987b3          	add	a5,s3,a5
    8190:	0007a703          	lw	a4,0(a5)
    8194:	02071463          	bnez	a4,81bc <quorem+0x1f4>
    8198:	ffc78793          	add	a5,a5,-4
    819c:	00f9e863          	bltu	s3,a5,81ac <quorem+0x1e4>
    81a0:	0180006f          	j	81b8 <quorem+0x1f0>
    81a4:	fff48493          	add	s1,s1,-1
    81a8:	00f9f863          	bgeu	s3,a5,81b8 <quorem+0x1f0>
    81ac:	0007a703          	lw	a4,0(a5)
    81b0:	ffc78793          	add	a5,a5,-4
    81b4:	fe0708e3          	beqz	a4,81a4 <quorem+0x1dc>
    81b8:	009a2823          	sw	s1,16(s4)
    81bc:	00140413          	add	s0,s0,1
    81c0:	04c12083          	lw	ra,76(sp)
    81c4:	00040513          	mv	a0,s0
    81c8:	04812403          	lw	s0,72(sp)
    81cc:	04012903          	lw	s2,64(sp)
    81d0:	03c12983          	lw	s3,60(sp)
    81d4:	03812a03          	lw	s4,56(sp)
    81d8:	03412a83          	lw	s5,52(sp)
    81dc:	02c12b83          	lw	s7,44(sp)
    81e0:	02812c03          	lw	s8,40(sp)
    81e4:	02412c83          	lw	s9,36(sp)
    81e8:	04412483          	lw	s1,68(sp)
    81ec:	05010113          	add	sp,sp,80
    81f0:	00008067          	ret
    81f4:	04c12083          	lw	ra,76(sp)
    81f8:	04412483          	lw	s1,68(sp)
    81fc:	00000513          	li	a0,0
    8200:	05010113          	add	sp,sp,80
    8204:	00008067          	ret
    8208:	00812583          	lw	a1,8(sp)
    820c:	000a0513          	mv	a0,s4
    8210:	03012b03          	lw	s6,48(sp)
    8214:	02012d03          	lw	s10,32(sp)
    8218:	01c12d83          	lw	s11,28(sp)
    821c:	104020ef          	jal	a320 <__mcmp>
    8220:	f00556e3          	bgez	a0,812c <quorem+0x164>
    8224:	f9dff06f          	j	81c0 <quorem+0x1f8>

00008228 <_dtoa_r>:
    8228:	03852303          	lw	t1,56(a0)
    822c:	f5010113          	add	sp,sp,-176
    8230:	0a812423          	sw	s0,168(sp)
    8234:	0a912223          	sw	s1,164(sp)
    8238:	0b212023          	sw	s2,160(sp)
    823c:	09412c23          	sw	s4,152(sp)
    8240:	07b12e23          	sw	s11,124(sp)
    8244:	0a112623          	sw	ra,172(sp)
    8248:	09312e23          	sw	s3,156(sp)
    824c:	09512a23          	sw	s5,148(sp)
    8250:	00e12a23          	sw	a4,20(sp)
    8254:	00f12623          	sw	a5,12(sp)
    8258:	01112423          	sw	a7,8(sp)
    825c:	02b12223          	sw	a1,36(sp)
    8260:	00c12023          	sw	a2,0(sp)
    8264:	00050413          	mv	s0,a0
    8268:	00058d93          	mv	s11,a1
    826c:	00060493          	mv	s1,a2
    8270:	00068a13          	mv	s4,a3
    8274:	00080913          	mv	s2,a6
    8278:	02030263          	beqz	t1,829c <_dtoa_r+0x74>
    827c:	03c52703          	lw	a4,60(a0)
    8280:	00100793          	li	a5,1
    8284:	00030593          	mv	a1,t1
    8288:	00e797b3          	sll	a5,a5,a4
    828c:	00e32223          	sw	a4,4(t1)
    8290:	00f32423          	sw	a5,8(t1)
    8294:	734010ef          	jal	99c8 <_Bfree>
    8298:	02042c23          	sw	zero,56(s0)
    829c:	00048993          	mv	s3,s1
    82a0:	00000693          	li	a3,0
    82a4:	0004dc63          	bgez	s1,82bc <_dtoa_r+0x94>
    82a8:	00149493          	sll	s1,s1,0x1
    82ac:	0014d793          	srl	a5,s1,0x1
    82b0:	00f12023          	sw	a5,0(sp)
    82b4:	00078993          	mv	s3,a5
    82b8:	00100693          	li	a3,1
    82bc:	7ff00737          	lui	a4,0x7ff00
    82c0:	00d92023          	sw	a3,0(s2)
    82c4:	00e9f6b3          	and	a3,s3,a4
    82c8:	64e68463          	beq	a3,a4,8910 <_dtoa_r+0x6e8>
    82cc:	00012483          	lw	s1,0(sp)
    82d0:	000d8513          	mv	a0,s11
    82d4:	00000613          	li	a2,0
    82d8:	00048593          	mv	a1,s1
    82dc:	00000693          	li	a3,0
    82e0:	01b12c23          	sw	s11,24(sp)
    82e4:	00912e23          	sw	s1,28(sp)
    82e8:	23c050ef          	jal	d524 <__eqdf2>
    82ec:	04051c63          	bnez	a0,8344 <_dtoa_r+0x11c>
    82f0:	00c12703          	lw	a4,12(sp)
    82f4:	00100793          	li	a5,1
    82f8:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    82fc:	00812703          	lw	a4,8(sp)
    8300:	00070863          	beqz	a4,8310 <_dtoa_r+0xe8>
    8304:	00007797          	auipc	a5,0x7
    8308:	fb178793          	add	a5,a5,-79 # f2b5 <__fini_array_end+0x23d>
    830c:	00f72023          	sw	a5,0(a4)
    8310:	00007a97          	auipc	s5,0x7
    8314:	fa4a8a93          	add	s5,s5,-92 # f2b4 <__fini_array_end+0x23c>
    8318:	0ac12083          	lw	ra,172(sp)
    831c:	0a812403          	lw	s0,168(sp)
    8320:	0a412483          	lw	s1,164(sp)
    8324:	0a012903          	lw	s2,160(sp)
    8328:	09c12983          	lw	s3,156(sp)
    832c:	09812a03          	lw	s4,152(sp)
    8330:	07c12d83          	lw	s11,124(sp)
    8334:	000a8513          	mv	a0,s5
    8338:	09412a83          	lw	s5,148(sp)
    833c:	0b010113          	add	sp,sp,176
    8340:	00008067          	ret
    8344:	00048613          	mv	a2,s1
    8348:	06810713          	add	a4,sp,104
    834c:	06c10693          	add	a3,sp,108
    8350:	000d8593          	mv	a1,s11
    8354:	00040513          	mv	a0,s0
    8358:	09612823          	sw	s6,144(sp)
    835c:	09712623          	sw	s7,140(sp)
    8360:	09812423          	sw	s8,136(sp)
    8364:	09912223          	sw	s9,132(sp)
    8368:	09a12023          	sw	s10,128(sp)
    836c:	0149d913          	srl	s2,s3,0x14
    8370:	268020ef          	jal	a5d8 <__d2b>
    8374:	00050493          	mv	s1,a0
    8378:	5c091e63          	bnez	s2,8954 <_dtoa_r+0x72c>
    837c:	06812a83          	lw	s5,104(sp)
    8380:	06c12903          	lw	s2,108(sp)
    8384:	02000793          	li	a5,32
    8388:	012a8933          	add	s2,s5,s2
    838c:	43290713          	add	a4,s2,1074
    8390:	36e7dae3          	bge	a5,a4,8f04 <_dtoa_r+0xcdc>
    8394:	04000793          	li	a5,64
    8398:	40e787b3          	sub	a5,a5,a4
    839c:	41290513          	add	a0,s2,1042
    83a0:	00f997b3          	sll	a5,s3,a5
    83a4:	00add533          	srl	a0,s11,a0
    83a8:	00a7e533          	or	a0,a5,a0
    83ac:	634060ef          	jal	e9e0 <__floatunsidf>
    83b0:	fe1007b7          	lui	a5,0xfe100
    83b4:	00100693          	li	a3,1
    83b8:	00050713          	mv	a4,a0
    83bc:	00b787b3          	add	a5,a5,a1
    83c0:	fff90913          	add	s2,s2,-1
    83c4:	02d12c23          	sw	a3,56(sp)
    83c8:	7fff8697          	auipc	a3,0x7fff8
    83cc:	30068693          	add	a3,a3,768 # 800006c8 <__global_locale+0x194>
    83d0:	0006a603          	lw	a2,0(a3)
    83d4:	0046a683          	lw	a3,4(a3)
    83d8:	00070513          	mv	a0,a4
    83dc:	00078593          	mv	a1,a5
    83e0:	369050ef          	jal	df48 <__subdf3>
    83e4:	7fff8797          	auipc	a5,0x7fff8
    83e8:	2ec78793          	add	a5,a5,748 # 800006d0 <__global_locale+0x19c>
    83ec:	0007a603          	lw	a2,0(a5)
    83f0:	0047a683          	lw	a3,4(a5)
    83f4:	3c4050ef          	jal	d7b8 <__muldf3>
    83f8:	7fff8797          	auipc	a5,0x7fff8
    83fc:	2e078793          	add	a5,a5,736 # 800006d8 <__global_locale+0x1a4>
    8400:	0007a603          	lw	a2,0(a5)
    8404:	0047a683          	lw	a3,4(a5)
    8408:	7a9030ef          	jal	c3b0 <__adddf3>
    840c:	00050b13          	mv	s6,a0
    8410:	00090513          	mv	a0,s2
    8414:	00058993          	mv	s3,a1
    8418:	510060ef          	jal	e928 <__floatsidf>
    841c:	7fff8797          	auipc	a5,0x7fff8
    8420:	2c478793          	add	a5,a5,708 # 800006e0 <__global_locale+0x1ac>
    8424:	0007a603          	lw	a2,0(a5)
    8428:	0047a683          	lw	a3,4(a5)
    842c:	38c050ef          	jal	d7b8 <__muldf3>
    8430:	00050613          	mv	a2,a0
    8434:	00058693          	mv	a3,a1
    8438:	000b0513          	mv	a0,s6
    843c:	00098593          	mv	a1,s3
    8440:	771030ef          	jal	c3b0 <__adddf3>
    8444:	00050b93          	mv	s7,a0
    8448:	00058b13          	mv	s6,a1
    844c:	458060ef          	jal	e8a4 <__fixdfsi>
    8450:	00050993          	mv	s3,a0
    8454:	000b0593          	mv	a1,s6
    8458:	000b8513          	mv	a0,s7
    845c:	00000613          	li	a2,0
    8460:	00000693          	li	a3,0
    8464:	24c050ef          	jal	d6b0 <__ledf2>
    8468:	02055063          	bgez	a0,8488 <_dtoa_r+0x260>
    846c:	00098513          	mv	a0,s3
    8470:	4b8060ef          	jal	e928 <__floatsidf>
    8474:	000b8613          	mv	a2,s7
    8478:	000b0693          	mv	a3,s6
    847c:	0a8050ef          	jal	d524 <__eqdf2>
    8480:	00a03533          	snez	a0,a0
    8484:	40a989b3          	sub	s3,s3,a0
    8488:	412a8ab3          	sub	s5,s5,s2
    848c:	01600793          	li	a5,22
    8490:	fffa8b13          	add	s6,s5,-1
    8494:	2137e2e3          	bltu	a5,s3,8e98 <_dtoa_r+0xc70>
    8498:	00399713          	sll	a4,s3,0x3
    849c:	00007797          	auipc	a5,0x7
    84a0:	4b478793          	add	a5,a5,1204 # f950 <__mprec_tens>
    84a4:	00e787b3          	add	a5,a5,a4
    84a8:	0007a603          	lw	a2,0(a5)
    84ac:	0047a683          	lw	a3,4(a5)
    84b0:	01812503          	lw	a0,24(sp)
    84b4:	01c12583          	lw	a1,28(sp)
    84b8:	1f8050ef          	jal	d6b0 <__ledf2>
    84bc:	220554e3          	bgez	a0,8ee4 <_dtoa_r+0xcbc>
    84c0:	fff98993          	add	s3,s3,-1
    84c4:	02012a23          	sw	zero,52(sp)
    84c8:	00012823          	sw	zero,16(sp)
    84cc:	4a0b4863          	bltz	s6,897c <_dtoa_r+0x754>
    84d0:	4c09d063          	bgez	s3,8990 <_dtoa_r+0x768>
    84d4:	01012783          	lw	a5,16(sp)
    84d8:	03312023          	sw	s3,32(sp)
    84dc:	413787b3          	sub	a5,a5,s3
    84e0:	00f12823          	sw	a5,16(sp)
    84e4:	413007b3          	neg	a5,s3
    84e8:	02f12823          	sw	a5,48(sp)
    84ec:	00900793          	li	a5,9
    84f0:	00000993          	li	s3,0
    84f4:	4b47e863          	bltu	a5,s4,89a4 <_dtoa_r+0x77c>
    84f8:	00500793          	li	a5,5
    84fc:	2147dae3          	bge	a5,s4,8f10 <_dtoa_r+0xce8>
    8500:	ffca0a13          	add	s4,s4,-4
    8504:	00300793          	li	a5,3
    8508:	00000913          	li	s2,0
    850c:	66fa02e3          	beq	s4,a5,9370 <_dtoa_r+0x1148>
    8510:	6147dae3          	bge	a5,s4,9324 <_dtoa_r+0x10fc>
    8514:	00400793          	li	a5,4
    8518:	54fa1ae3          	bne	s4,a5,926c <_dtoa_r+0x1044>
    851c:	00100793          	li	a5,1
    8520:	02f12423          	sw	a5,40(sp)
    8524:	01412603          	lw	a2,20(sp)
    8528:	62c05ce3          	blez	a2,9360 <_dtoa_r+0x1138>
    852c:	02c12e23          	sw	a2,60(sp)
    8530:	00060c13          	mv	s8,a2
    8534:	01700693          	li	a3,23
    8538:	00100713          	li	a4,1
    853c:	00400793          	li	a5,4
    8540:	00c6c463          	blt	a3,a2,8548 <_dtoa_r+0x320>
    8544:	3540106f          	j	9898 <_dtoa_r+0x1670>
    8548:	00179793          	sll	a5,a5,0x1
    854c:	01478693          	add	a3,a5,20
    8550:	00070593          	mv	a1,a4
    8554:	00170713          	add	a4,a4,1
    8558:	fed678e3          	bgeu	a2,a3,8548 <_dtoa_r+0x320>
    855c:	02b42e23          	sw	a1,60(s0)
    8560:	00040513          	mv	a0,s0
    8564:	3b0010ef          	jal	9914 <_Balloc>
    8568:	00050a93          	mv	s5,a0
    856c:	00051463          	bnez	a0,8574 <_dtoa_r+0x34c>
    8570:	30c0106f          	j	987c <_dtoa_r+0x1654>
    8574:	02a42c23          	sw	a0,56(s0)
    8578:	00e00793          	li	a5,14
    857c:	5187ea63          	bltu	a5,s8,8a90 <_dtoa_r+0x868>
    8580:	50090863          	beqz	s2,8a90 <_dtoa_r+0x868>
    8584:	02012783          	lw	a5,32(sp)
    8588:	62f054e3          	blez	a5,93b0 <_dtoa_r+0x1188>
    858c:	00f7f713          	and	a4,a5,15
    8590:	00371713          	sll	a4,a4,0x3
    8594:	4047dc93          	sra	s9,a5,0x4
    8598:	00007797          	auipc	a5,0x7
    859c:	3b878793          	add	a5,a5,952 # f950 <__mprec_tens>
    85a0:	00e787b3          	add	a5,a5,a4
    85a4:	010cf693          	and	a3,s9,16
    85a8:	0007a803          	lw	a6,0(a5)
    85ac:	0047a703          	lw	a4,4(a5)
    85b0:	560682e3          	beqz	a3,9314 <_dtoa_r+0x10ec>
    85b4:	00007797          	auipc	a5,0x7
    85b8:	37478793          	add	a5,a5,884 # f928 <__mprec_bigtens>
    85bc:	0207a603          	lw	a2,32(a5)
    85c0:	0247a683          	lw	a3,36(a5)
    85c4:	01812503          	lw	a0,24(sp)
    85c8:	01c12583          	lw	a1,28(sp)
    85cc:	04e12423          	sw	a4,72(sp)
    85d0:	05012023          	sw	a6,64(sp)
    85d4:	6a4040ef          	jal	cc78 <__divdf3>
    85d8:	04012803          	lw	a6,64(sp)
    85dc:	04812703          	lw	a4,72(sp)
    85e0:	00fcfc93          	and	s9,s9,15
    85e4:	00050313          	mv	t1,a0
    85e8:	00058d13          	mv	s10,a1
    85ec:	00300913          	li	s2,3
    85f0:	040c8c63          	beqz	s9,8648 <_dtoa_r+0x420>
    85f4:	04812023          	sw	s0,64(sp)
    85f8:	00007b97          	auipc	s7,0x7
    85fc:	330b8b93          	add	s7,s7,816 # f928 <__mprec_bigtens>
    8600:	00090413          	mv	s0,s2
    8604:	00070593          	mv	a1,a4
    8608:	00030913          	mv	s2,t1
    860c:	001cf793          	and	a5,s9,1
    8610:	00078e63          	beqz	a5,862c <_dtoa_r+0x404>
    8614:	000ba603          	lw	a2,0(s7)
    8618:	004ba683          	lw	a3,4(s7)
    861c:	00080513          	mv	a0,a6
    8620:	00140413          	add	s0,s0,1
    8624:	194050ef          	jal	d7b8 <__muldf3>
    8628:	00050813          	mv	a6,a0
    862c:	401cdc93          	sra	s9,s9,0x1
    8630:	008b8b93          	add	s7,s7,8
    8634:	fc0c9ce3          	bnez	s9,860c <_dtoa_r+0x3e4>
    8638:	00090313          	mv	t1,s2
    863c:	00040913          	mv	s2,s0
    8640:	04012403          	lw	s0,64(sp)
    8644:	00058713          	mv	a4,a1
    8648:	00070693          	mv	a3,a4
    864c:	00080613          	mv	a2,a6
    8650:	00030513          	mv	a0,t1
    8654:	000d0593          	mv	a1,s10
    8658:	620040ef          	jal	cc78 <__divdf3>
    865c:	00050713          	mv	a4,a0
    8660:	00058793          	mv	a5,a1
    8664:	03412683          	lw	a3,52(sp)
    8668:	02068c63          	beqz	a3,86a0 <_dtoa_r+0x478>
    866c:	7fff8697          	auipc	a3,0x7fff8
    8670:	07c68693          	add	a3,a3,124 # 800006e8 <__global_locale+0x1b4>
    8674:	0006a603          	lw	a2,0(a3)
    8678:	0046a683          	lw	a3,4(a3)
    867c:	00070513          	mv	a0,a4
    8680:	00078593          	mv	a1,a5
    8684:	04e12423          	sw	a4,72(sp)
    8688:	04f12023          	sw	a5,64(sp)
    868c:	024050ef          	jal	d6b0 <__ledf2>
    8690:	04012783          	lw	a5,64(sp)
    8694:	04812703          	lw	a4,72(sp)
    8698:	00055463          	bgez	a0,86a0 <_dtoa_r+0x478>
    869c:	04c0106f          	j	96e8 <_dtoa_r+0x14c0>
    86a0:	00090513          	mv	a0,s2
    86a4:	04f12623          	sw	a5,76(sp)
    86a8:	04e12023          	sw	a4,64(sp)
    86ac:	27c060ef          	jal	e928 <__floatsidf>
    86b0:	04012703          	lw	a4,64(sp)
    86b4:	04c12783          	lw	a5,76(sp)
    86b8:	00070613          	mv	a2,a4
    86bc:	00078693          	mv	a3,a5
    86c0:	04e12423          	sw	a4,72(sp)
    86c4:	04f12023          	sw	a5,64(sp)
    86c8:	0f0050ef          	jal	d7b8 <__muldf3>
    86cc:	7fff8697          	auipc	a3,0x7fff8
    86d0:	02c68693          	add	a3,a3,44 # 800006f8 <__global_locale+0x1c4>
    86d4:	0006a603          	lw	a2,0(a3)
    86d8:	0046a683          	lw	a3,4(a3)
    86dc:	4d5030ef          	jal	c3b0 <__adddf3>
    86e0:	fcc006b7          	lui	a3,0xfcc00
    86e4:	04012783          	lw	a5,64(sp)
    86e8:	04812703          	lw	a4,72(sp)
    86ec:	00050c93          	mv	s9,a0
    86f0:	00b68bb3          	add	s7,a3,a1
    86f4:	340c0463          	beqz	s8,8a3c <_dtoa_r+0x814>
    86f8:	02012683          	lw	a3,32(sp)
    86fc:	05812423          	sw	s8,72(sp)
    8700:	04d12e23          	sw	a3,92(sp)
    8704:	00070513          	mv	a0,a4
    8708:	00078593          	mv	a1,a5
    870c:	04e12623          	sw	a4,76(sp)
    8710:	04f12023          	sw	a5,64(sp)
    8714:	190060ef          	jal	e8a4 <__fixdfsi>
    8718:	04812783          	lw	a5,72(sp)
    871c:	00050913          	mv	s2,a0
    8720:	05912c23          	sw	s9,88(sp)
    8724:	fff78693          	add	a3,a5,-1
    8728:	00369693          	sll	a3,a3,0x3
    872c:	00007797          	auipc	a5,0x7
    8730:	22478793          	add	a5,a5,548 # f950 <__mprec_tens>
    8734:	00d786b3          	add	a3,a5,a3
    8738:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    873c:	0046a803          	lw	a6,4(a3)
    8740:	001a8d13          	add	s10,s5,1
    8744:	04f12823          	sw	a5,80(sp)
    8748:	05012a23          	sw	a6,84(sp)
    874c:	1dc060ef          	jal	e928 <__floatsidf>
    8750:	04c12703          	lw	a4,76(sp)
    8754:	04012783          	lw	a5,64(sp)
    8758:	00050613          	mv	a2,a0
    875c:	00058693          	mv	a3,a1
    8760:	00070513          	mv	a0,a4
    8764:	00078593          	mv	a1,a5
    8768:	7e0050ef          	jal	df48 <__subdf3>
    876c:	02812703          	lw	a4,40(sp)
    8770:	03090313          	add	t1,s2,48
    8774:	05a12023          	sw	s10,64(sp)
    8778:	00050c93          	mv	s9,a0
    877c:	0ff37313          	zext.b	t1,t1
    8780:	5c0706e3          	beqz	a4,954c <_dtoa_r+0x1324>
    8784:	7fff8797          	auipc	a5,0x7fff8
    8788:	f3478793          	add	a5,a5,-204 # 800006b8 <__global_locale+0x184>
    878c:	0007a503          	lw	a0,0(a5)
    8790:	05012603          	lw	a2,80(sp)
    8794:	05412683          	lw	a3,84(sp)
    8798:	04b12023          	sw	a1,64(sp)
    879c:	0047a583          	lw	a1,4(a5)
    87a0:	04612623          	sw	t1,76(sp)
    87a4:	4d4040ef          	jal	cc78 <__divdf3>
    87a8:	05812603          	lw	a2,88(sp)
    87ac:	000b8693          	mv	a3,s7
    87b0:	798050ef          	jal	df48 <__subdf3>
    87b4:	04012883          	lw	a7,64(sp)
    87b8:	04c12303          	lw	t1,76(sp)
    87bc:	000c8613          	mv	a2,s9
    87c0:	00088693          	mv	a3,a7
    87c4:	006a8023          	sb	t1,0(s5)
    87c8:	00050913          	mv	s2,a0
    87cc:	00058b93          	mv	s7,a1
    87d0:	5e1040ef          	jal	d5b0 <__gedf2>
    87d4:	04012883          	lw	a7,64(sp)
    87d8:	00a05463          	blez	a0,87e0 <_dtoa_r+0x5b8>
    87dc:	7c90006f          	j	97a4 <_dtoa_r+0x157c>
    87e0:	7fff8697          	auipc	a3,0x7fff8
    87e4:	f0868693          	add	a3,a3,-248 # 800006e8 <__global_locale+0x1b4>
    87e8:	0006a783          	lw	a5,0(a3)
    87ec:	0046a803          	lw	a6,4(a3)
    87f0:	05312623          	sw	s3,76(sp)
    87f4:	04f12023          	sw	a5,64(sp)
    87f8:	00000793          	li	a5,0
    87fc:	05612823          	sw	s6,80(sp)
    8800:	05812c23          	sw	s8,88(sp)
    8804:	05012223          	sw	a6,68(sp)
    8808:	04812c03          	lw	s8,72(sp)
    880c:	00078b13          	mv	s6,a5
    8810:	05412423          	sw	s4,72(sp)
    8814:	00088993          	mv	s3,a7
    8818:	0980006f          	j	88b0 <_dtoa_r+0x688>
    881c:	001b0b13          	add	s6,s6,1
    8820:	018b4463          	blt	s6,s8,8828 <_dtoa_r+0x600>
    8824:	7d10006f          	j	97f4 <_dtoa_r+0x15cc>
    8828:	7fff8a17          	auipc	s4,0x7fff8
    882c:	ec8a0a13          	add	s4,s4,-312 # 800006f0 <__global_locale+0x1bc>
    8830:	000a2603          	lw	a2,0(s4)
    8834:	004a2683          	lw	a3,4(s4)
    8838:	00090513          	mv	a0,s2
    883c:	000b8593          	mv	a1,s7
    8840:	779040ef          	jal	d7b8 <__muldf3>
    8844:	000a2603          	lw	a2,0(s4)
    8848:	004a2683          	lw	a3,4(s4)
    884c:	00050913          	mv	s2,a0
    8850:	00058b93          	mv	s7,a1
    8854:	000c8513          	mv	a0,s9
    8858:	00098593          	mv	a1,s3
    885c:	75d040ef          	jal	d7b8 <__muldf3>
    8860:	00058c93          	mv	s9,a1
    8864:	00050a13          	mv	s4,a0
    8868:	03c060ef          	jal	e8a4 <__fixdfsi>
    886c:	00050993          	mv	s3,a0
    8870:	0b8060ef          	jal	e928 <__floatsidf>
    8874:	00050613          	mv	a2,a0
    8878:	00058693          	mv	a3,a1
    887c:	000a0513          	mv	a0,s4
    8880:	000c8593          	mv	a1,s9
    8884:	6c4050ef          	jal	df48 <__subdf3>
    8888:	03098793          	add	a5,s3,48
    888c:	00090613          	mv	a2,s2
    8890:	000b8693          	mv	a3,s7
    8894:	00fd0023          	sb	a5,0(s10)
    8898:	001d0d13          	add	s10,s10,1
    889c:	00050c93          	mv	s9,a0
    88a0:	00058993          	mv	s3,a1
    88a4:	60d040ef          	jal	d6b0 <__ledf2>
    88a8:	00055463          	bgez	a0,88b0 <_dtoa_r+0x688>
    88ac:	6f90006f          	j	97a4 <_dtoa_r+0x157c>
    88b0:	04012503          	lw	a0,64(sp)
    88b4:	04412583          	lw	a1,68(sp)
    88b8:	000c8613          	mv	a2,s9
    88bc:	00098693          	mv	a3,s3
    88c0:	688050ef          	jal	df48 <__subdf3>
    88c4:	00090613          	mv	a2,s2
    88c8:	000b8693          	mv	a3,s7
    88cc:	5e5040ef          	jal	d6b0 <__ledf2>
    88d0:	f40556e3          	bgez	a0,881c <_dtoa_r+0x5f4>
    88d4:	05c12783          	lw	a5,92(sp)
    88d8:	000d0b93          	mv	s7,s10
    88dc:	00178c13          	add	s8,a5,1
    88e0:	03900613          	li	a2,57
    88e4:	0080006f          	j	88ec <_dtoa_r+0x6c4>
    88e8:	697a88e3          	beq	s5,s7,9778 <_dtoa_r+0x1550>
    88ec:	fffbc683          	lbu	a3,-1(s7)
    88f0:	000b8d13          	mv	s10,s7
    88f4:	fffb8b93          	add	s7,s7,-1
    88f8:	fec688e3          	beq	a3,a2,88e8 <_dtoa_r+0x6c0>
    88fc:	00168693          	add	a3,a3,1
    8900:	0ff6f693          	zext.b	a3,a3
    8904:	00db8023          	sb	a3,0(s7)
    8908:	000c0a13          	mv	s4,s8
    890c:	4f00006f          	j	8dfc <_dtoa_r+0xbd4>
    8910:	00c12683          	lw	a3,12(sp)
    8914:	00002737          	lui	a4,0x2
    8918:	00c99793          	sll	a5,s3,0xc
    891c:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x6e7>
    8920:	00c7d793          	srl	a5,a5,0xc
    8924:	00e6a023          	sw	a4,0(a3)
    8928:	01b7e7b3          	or	a5,a5,s11
    892c:	0a078063          	beqz	a5,89cc <_dtoa_r+0x7a4>
    8930:	00812783          	lw	a5,8(sp)
    8934:	00007a97          	auipc	s5,0x7
    8938:	9d8a8a93          	add	s5,s5,-1576 # f30c <__fini_array_end+0x294>
    893c:	9c078ee3          	beqz	a5,8318 <_dtoa_r+0xf0>
    8940:	00007797          	auipc	a5,0x7
    8944:	9cf78793          	add	a5,a5,-1585 # f30f <__fini_array_end+0x297>
    8948:	00812703          	lw	a4,8(sp)
    894c:	00f72023          	sw	a5,0(a4)
    8950:	9c9ff06f          	j	8318 <_dtoa_r+0xf0>
    8954:	01c12783          	lw	a5,28(sp)
    8958:	3ff006b7          	lui	a3,0x3ff00
    895c:	06812a83          	lw	s5,104(sp)
    8960:	00c79793          	sll	a5,a5,0xc
    8964:	00c7d793          	srl	a5,a5,0xc
    8968:	01812703          	lw	a4,24(sp)
    896c:	00d7e7b3          	or	a5,a5,a3
    8970:	c0190913          	add	s2,s2,-1023
    8974:	02012c23          	sw	zero,56(sp)
    8978:	a51ff06f          	j	83c8 <_dtoa_r+0x1a0>
    897c:	00100793          	li	a5,1
    8980:	415787b3          	sub	a5,a5,s5
    8984:	00f12823          	sw	a5,16(sp)
    8988:	00000b13          	li	s6,0
    898c:	b409c4e3          	bltz	s3,84d4 <_dtoa_r+0x2ac>
    8990:	03312023          	sw	s3,32(sp)
    8994:	02012823          	sw	zero,48(sp)
    8998:	00900793          	li	a5,9
    899c:	013b0b33          	add	s6,s6,s3
    89a0:	b547fce3          	bgeu	a5,s4,84f8 <_dtoa_r+0x2d0>
    89a4:	00100793          	li	a5,1
    89a8:	00100913          	li	s2,1
    89ac:	00000a13          	li	s4,0
    89b0:	02f12423          	sw	a5,40(sp)
    89b4:	fff00c13          	li	s8,-1
    89b8:	00012a23          	sw	zero,20(sp)
    89bc:	02042e23          	sw	zero,60(s0)
    89c0:	03812e23          	sw	s8,60(sp)
    89c4:	00000593          	li	a1,0
    89c8:	b99ff06f          	j	8560 <_dtoa_r+0x338>
    89cc:	00812703          	lw	a4,8(sp)
    89d0:	00007a97          	auipc	s5,0x7
    89d4:	930a8a93          	add	s5,s5,-1744 # f300 <__fini_array_end+0x288>
    89d8:	00007797          	auipc	a5,0x7
    89dc:	93078793          	add	a5,a5,-1744 # f308 <__fini_array_end+0x290>
    89e0:	f60714e3          	bnez	a4,8948 <_dtoa_r+0x720>
    89e4:	935ff06f          	j	8318 <_dtoa_r+0xf0>
    89e8:	00090513          	mv	a0,s2
    89ec:	04f12623          	sw	a5,76(sp)
    89f0:	04e12023          	sw	a4,64(sp)
    89f4:	735050ef          	jal	e928 <__floatsidf>
    89f8:	04012703          	lw	a4,64(sp)
    89fc:	04c12783          	lw	a5,76(sp)
    8a00:	00070613          	mv	a2,a4
    8a04:	00078693          	mv	a3,a5
    8a08:	04e12423          	sw	a4,72(sp)
    8a0c:	04f12023          	sw	a5,64(sp)
    8a10:	5a9040ef          	jal	d7b8 <__muldf3>
    8a14:	7fff8697          	auipc	a3,0x7fff8
    8a18:	ce468693          	add	a3,a3,-796 # 800006f8 <__global_locale+0x1c4>
    8a1c:	0006a603          	lw	a2,0(a3)
    8a20:	0046a683          	lw	a3,4(a3)
    8a24:	18d030ef          	jal	c3b0 <__adddf3>
    8a28:	04012783          	lw	a5,64(sp)
    8a2c:	04812703          	lw	a4,72(sp)
    8a30:	fcc006b7          	lui	a3,0xfcc00
    8a34:	00050c93          	mv	s9,a0
    8a38:	00b68bb3          	add	s7,a3,a1
    8a3c:	7fff8697          	auipc	a3,0x7fff8
    8a40:	cc468693          	add	a3,a3,-828 # 80000700 <__global_locale+0x1cc>
    8a44:	0006a603          	lw	a2,0(a3)
    8a48:	0046a683          	lw	a3,4(a3)
    8a4c:	00070513          	mv	a0,a4
    8a50:	00078593          	mv	a1,a5
    8a54:	4f4050ef          	jal	df48 <__subdf3>
    8a58:	000c8613          	mv	a2,s9
    8a5c:	000b8693          	mv	a3,s7
    8a60:	00050d13          	mv	s10,a0
    8a64:	00058913          	mv	s2,a1
    8a68:	349040ef          	jal	d5b0 <__gedf2>
    8a6c:	50a04ce3          	bgtz	a0,9784 <_dtoa_r+0x155c>
    8a70:	800007b7          	lui	a5,0x80000
    8a74:	0177c7b3          	xor	a5,a5,s7
    8a78:	000c8613          	mv	a2,s9
    8a7c:	000d0513          	mv	a0,s10
    8a80:	00078693          	mv	a3,a5
    8a84:	00090593          	mv	a1,s2
    8a88:	429040ef          	jal	d6b0 <__ledf2>
    8a8c:	06054c63          	bltz	a0,8b04 <_dtoa_r+0x8dc>
    8a90:	06c12783          	lw	a5,108(sp)
    8a94:	1a07c663          	bltz	a5,8c40 <_dtoa_r+0xa18>
    8a98:	02012683          	lw	a3,32(sp)
    8a9c:	00e00713          	li	a4,14
    8aa0:	1ad74063          	blt	a4,a3,8c40 <_dtoa_r+0xa18>
    8aa4:	02012783          	lw	a5,32(sp)
    8aa8:	00379713          	sll	a4,a5,0x3
    8aac:	00007797          	auipc	a5,0x7
    8ab0:	ea478793          	add	a5,a5,-348 # f950 <__mprec_tens>
    8ab4:	00e787b3          	add	a5,a5,a4
    8ab8:	0007a903          	lw	s2,0(a5)
    8abc:	0047a983          	lw	s3,4(a5)
    8ac0:	01412783          	lw	a5,20(sp)
    8ac4:	0407dc63          	bgez	a5,8b1c <_dtoa_r+0x8f4>
    8ac8:	05804a63          	bgtz	s8,8b1c <_dtoa_r+0x8f4>
    8acc:	020c1c63          	bnez	s8,8b04 <_dtoa_r+0x8dc>
    8ad0:	7fff8797          	auipc	a5,0x7fff8
    8ad4:	c3078793          	add	a5,a5,-976 # 80000700 <__global_locale+0x1cc>
    8ad8:	0007a603          	lw	a2,0(a5)
    8adc:	0047a683          	lw	a3,4(a5)
    8ae0:	00090513          	mv	a0,s2
    8ae4:	00098593          	mv	a1,s3
    8ae8:	4d1040ef          	jal	d7b8 <__muldf3>
    8aec:	00050613          	mv	a2,a0
    8af0:	00058693          	mv	a3,a1
    8af4:	01812503          	lw	a0,24(sp)
    8af8:	01c12583          	lw	a1,28(sp)
    8afc:	3b5040ef          	jal	d6b0 <__ledf2>
    8b00:	48a042e3          	bgtz	a0,9784 <_dtoa_r+0x155c>
    8b04:	000a8d13          	mv	s10,s5
    8b08:	00012c23          	sw	zero,24(sp)
    8b0c:	00000913          	li	s2,0
    8b10:	01412783          	lw	a5,20(sp)
    8b14:	fff7ca13          	not	s4,a5
    8b18:	6980006f          	j	91b0 <_dtoa_r+0xf88>
    8b1c:	001a8793          	add	a5,s5,1
    8b20:	04f12023          	sw	a5,64(sp)
    8b24:	01812b03          	lw	s6,24(sp)
    8b28:	01c12a03          	lw	s4,28(sp)
    8b2c:	00090613          	mv	a2,s2
    8b30:	00098693          	mv	a3,s3
    8b34:	000b0513          	mv	a0,s6
    8b38:	000a0593          	mv	a1,s4
    8b3c:	13c040ef          	jal	cc78 <__divdf3>
    8b40:	565050ef          	jal	e8a4 <__fixdfsi>
    8b44:	00050d13          	mv	s10,a0
    8b48:	5e1050ef          	jal	e928 <__floatsidf>
    8b4c:	00090613          	mv	a2,s2
    8b50:	00098693          	mv	a3,s3
    8b54:	465040ef          	jal	d7b8 <__muldf3>
    8b58:	00050613          	mv	a2,a0
    8b5c:	00058693          	mv	a3,a1
    8b60:	000b0513          	mv	a0,s6
    8b64:	000a0593          	mv	a1,s4
    8b68:	3e0050ef          	jal	df48 <__subdf3>
    8b6c:	030d0793          	add	a5,s10,48
    8b70:	00fa8023          	sb	a5,0(s5)
    8b74:	00100613          	li	a2,1
    8b78:	04012b83          	lw	s7,64(sp)
    8b7c:	00050713          	mv	a4,a0
    8b80:	00058693          	mv	a3,a1
    8b84:	0ccc0ee3          	beq	s8,a2,9460 <_dtoa_r+0x1238>
    8b88:	7fff8617          	auipc	a2,0x7fff8
    8b8c:	b6860613          	add	a2,a2,-1176 # 800006f0 <__global_locale+0x1bc>
    8b90:	00062783          	lw	a5,0(a2)
    8b94:	00462803          	lw	a6,4(a2)
    8b98:	00100d93          	li	s11,1
    8b9c:	00f12023          	sw	a5,0(sp)
    8ba0:	01012223          	sw	a6,4(sp)
    8ba4:	0600006f          	j	8c04 <_dtoa_r+0x9dc>
    8ba8:	00090613          	mv	a2,s2
    8bac:	00098693          	mv	a3,s3
    8bb0:	000b0513          	mv	a0,s6
    8bb4:	000a0593          	mv	a1,s4
    8bb8:	0c0040ef          	jal	cc78 <__divdf3>
    8bbc:	4e9050ef          	jal	e8a4 <__fixdfsi>
    8bc0:	00050d13          	mv	s10,a0
    8bc4:	565050ef          	jal	e928 <__floatsidf>
    8bc8:	00090613          	mv	a2,s2
    8bcc:	00098693          	mv	a3,s3
    8bd0:	3e9040ef          	jal	d7b8 <__muldf3>
    8bd4:	00058693          	mv	a3,a1
    8bd8:	00050613          	mv	a2,a0
    8bdc:	000a0593          	mv	a1,s4
    8be0:	000b0513          	mv	a0,s6
    8be4:	364050ef          	jal	df48 <__subdf3>
    8be8:	001b8b93          	add	s7,s7,1
    8bec:	030d0793          	add	a5,s10,48
    8bf0:	001d8d93          	add	s11,s11,1
    8bf4:	fefb8fa3          	sb	a5,-1(s7)
    8bf8:	00050713          	mv	a4,a0
    8bfc:	00058693          	mv	a3,a1
    8c00:	07bc00e3          	beq	s8,s11,9460 <_dtoa_r+0x1238>
    8c04:	00012603          	lw	a2,0(sp)
    8c08:	00068593          	mv	a1,a3
    8c0c:	00412683          	lw	a3,4(sp)
    8c10:	00070513          	mv	a0,a4
    8c14:	3a5040ef          	jal	d7b8 <__muldf3>
    8c18:	00000613          	li	a2,0
    8c1c:	00000693          	li	a3,0
    8c20:	00050b13          	mv	s6,a0
    8c24:	00058a13          	mv	s4,a1
    8c28:	0fd040ef          	jal	d524 <__eqdf2>
    8c2c:	f6051ee3          	bnez	a0,8ba8 <_dtoa_r+0x980>
    8c30:	02012783          	lw	a5,32(sp)
    8c34:	000b8d13          	mv	s10,s7
    8c38:	00178a13          	add	s4,a5,1
    8c3c:	1c00006f          	j	8dfc <_dtoa_r+0xbd4>
    8c40:	02812703          	lw	a4,40(sp)
    8c44:	26071463          	bnez	a4,8eac <_dtoa_r+0xc84>
    8c48:	03012b83          	lw	s7,48(sp)
    8c4c:	01012c83          	lw	s9,16(sp)
    8c50:	02012423          	sw	zero,40(sp)
    8c54:	00000913          	li	s2,0
    8c58:	020c8263          	beqz	s9,8c7c <_dtoa_r+0xa54>
    8c5c:	03605063          	blez	s6,8c7c <_dtoa_r+0xa54>
    8c60:	000c8793          	mv	a5,s9
    8c64:	679b4263          	blt	s6,s9,92c8 <_dtoa_r+0x10a0>
    8c68:	01012703          	lw	a4,16(sp)
    8c6c:	40fc8cb3          	sub	s9,s9,a5
    8c70:	40fb0b33          	sub	s6,s6,a5
    8c74:	40f70733          	sub	a4,a4,a5
    8c78:	00e12823          	sw	a4,16(sp)
    8c7c:	03012783          	lw	a5,48(sp)
    8c80:	02078263          	beqz	a5,8ca4 <_dtoa_r+0xa7c>
    8c84:	02812783          	lw	a5,40(sp)
    8c88:	00078463          	beqz	a5,8c90 <_dtoa_r+0xa68>
    8c8c:	060b9ae3          	bnez	s7,9500 <_dtoa_r+0x12d8>
    8c90:	03012603          	lw	a2,48(sp)
    8c94:	00048593          	mv	a1,s1
    8c98:	00040513          	mv	a0,s0
    8c9c:	3a4010ef          	jal	a040 <__pow5mult>
    8ca0:	00050493          	mv	s1,a0
    8ca4:	00100593          	li	a1,1
    8ca8:	00040513          	mv	a0,s0
    8cac:	01c010ef          	jal	9cc8 <__i2b>
    8cb0:	00a12c23          	sw	a0,24(sp)
    8cb4:	50099a63          	bnez	s3,91c8 <_dtoa_r+0xfa0>
    8cb8:	00100793          	li	a5,1
    8cbc:	5547da63          	bge	a5,s4,9210 <_dtoa_r+0xfe8>
    8cc0:	016787b3          	add	a5,a5,s6
    8cc4:	01f7f793          	and	a5,a5,31
    8cc8:	1c078e63          	beqz	a5,8ea4 <_dtoa_r+0xc7c>
    8ccc:	02000713          	li	a4,32
    8cd0:	40f70733          	sub	a4,a4,a5
    8cd4:	00400693          	li	a3,4
    8cd8:	58e6d263          	bge	a3,a4,925c <_dtoa_r+0x1034>
    8cdc:	01c00713          	li	a4,28
    8ce0:	40f707b3          	sub	a5,a4,a5
    8ce4:	01012703          	lw	a4,16(sp)
    8ce8:	00fc8cb3          	add	s9,s9,a5
    8cec:	00fb0b33          	add	s6,s6,a5
    8cf0:	00f70733          	add	a4,a4,a5
    8cf4:	00e12823          	sw	a4,16(sp)
    8cf8:	01012783          	lw	a5,16(sp)
    8cfc:	12f04e63          	bgtz	a5,8e38 <_dtoa_r+0xc10>
    8d00:	01605c63          	blez	s6,8d18 <_dtoa_r+0xaf0>
    8d04:	01812583          	lw	a1,24(sp)
    8d08:	000b0613          	mv	a2,s6
    8d0c:	00040513          	mv	a0,s0
    8d10:	480010ef          	jal	a190 <__lshift>
    8d14:	00a12c23          	sw	a0,24(sp)
    8d18:	03412783          	lw	a5,52(sp)
    8d1c:	12079a63          	bnez	a5,8e50 <_dtoa_r+0xc28>
    8d20:	45805263          	blez	s8,9164 <_dtoa_r+0xf3c>
    8d24:	02812783          	lw	a5,40(sp)
    8d28:	24079e63          	bnez	a5,8f84 <_dtoa_r+0xd5c>
    8d2c:	02012783          	lw	a5,32(sp)
    8d30:	00178a13          	add	s4,a5,1
    8d34:	01812b03          	lw	s6,24(sp)
    8d38:	00100993          	li	s3,1
    8d3c:	0200006f          	j	8d5c <_dtoa_r+0xb34>
    8d40:	00048593          	mv	a1,s1
    8d44:	00000693          	li	a3,0
    8d48:	00a00613          	li	a2,10
    8d4c:	00040513          	mv	a0,s0
    8d50:	49d000ef          	jal	99ec <__multadd>
    8d54:	00050493          	mv	s1,a0
    8d58:	00198993          	add	s3,s3,1
    8d5c:	000b0593          	mv	a1,s6
    8d60:	00048513          	mv	a0,s1
    8d64:	a64ff0ef          	jal	7fc8 <quorem>
    8d68:	03050b93          	add	s7,a0,48
    8d6c:	013a87b3          	add	a5,s5,s3
    8d70:	ff778fa3          	sb	s7,-1(a5)
    8d74:	fd89c6e3          	blt	s3,s8,8d40 <_dtoa_r+0xb18>
    8d78:	00100993          	li	s3,1
    8d7c:	55804263          	bgtz	s8,92c0 <_dtoa_r+0x1098>
    8d80:	013a89b3          	add	s3,s5,s3
    8d84:	00000c13          	li	s8,0
    8d88:	00048593          	mv	a1,s1
    8d8c:	00100613          	li	a2,1
    8d90:	00040513          	mv	a0,s0
    8d94:	3fc010ef          	jal	a190 <__lshift>
    8d98:	01812583          	lw	a1,24(sp)
    8d9c:	00050493          	mv	s1,a0
    8da0:	580010ef          	jal	a320 <__mcmp>
    8da4:	4ea05c63          	blez	a0,929c <_dtoa_r+0x1074>
    8da8:	03900693          	li	a3,57
    8dac:	0080006f          	j	8db4 <_dtoa_r+0xb8c>
    8db0:	5f3a8863          	beq	s5,s3,93a0 <_dtoa_r+0x1178>
    8db4:	fff9c783          	lbu	a5,-1(s3)
    8db8:	00098d13          	mv	s10,s3
    8dbc:	fff98993          	add	s3,s3,-1
    8dc0:	fed788e3          	beq	a5,a3,8db0 <_dtoa_r+0xb88>
    8dc4:	00178793          	add	a5,a5,1
    8dc8:	00f98023          	sb	a5,0(s3)
    8dcc:	01812583          	lw	a1,24(sp)
    8dd0:	00040513          	mv	a0,s0
    8dd4:	3f5000ef          	jal	99c8 <_Bfree>
    8dd8:	02090263          	beqz	s2,8dfc <_dtoa_r+0xbd4>
    8ddc:	000c0a63          	beqz	s8,8df0 <_dtoa_r+0xbc8>
    8de0:	012c0863          	beq	s8,s2,8df0 <_dtoa_r+0xbc8>
    8de4:	000c0593          	mv	a1,s8
    8de8:	00040513          	mv	a0,s0
    8dec:	3dd000ef          	jal	99c8 <_Bfree>
    8df0:	00090593          	mv	a1,s2
    8df4:	00040513          	mv	a0,s0
    8df8:	3d1000ef          	jal	99c8 <_Bfree>
    8dfc:	00048593          	mv	a1,s1
    8e00:	00040513          	mv	a0,s0
    8e04:	3c5000ef          	jal	99c8 <_Bfree>
    8e08:	00c12783          	lw	a5,12(sp)
    8e0c:	000d0023          	sb	zero,0(s10)
    8e10:	0147a023          	sw	s4,0(a5)
    8e14:	00812783          	lw	a5,8(sp)
    8e18:	00078463          	beqz	a5,8e20 <_dtoa_r+0xbf8>
    8e1c:	01a7a023          	sw	s10,0(a5)
    8e20:	09012b03          	lw	s6,144(sp)
    8e24:	08c12b83          	lw	s7,140(sp)
    8e28:	08812c03          	lw	s8,136(sp)
    8e2c:	08412c83          	lw	s9,132(sp)
    8e30:	08012d03          	lw	s10,128(sp)
    8e34:	ce4ff06f          	j	8318 <_dtoa_r+0xf0>
    8e38:	00048593          	mv	a1,s1
    8e3c:	00078613          	mv	a2,a5
    8e40:	00040513          	mv	a0,s0
    8e44:	34c010ef          	jal	a190 <__lshift>
    8e48:	00050493          	mv	s1,a0
    8e4c:	eb5ff06f          	j	8d00 <_dtoa_r+0xad8>
    8e50:	01812583          	lw	a1,24(sp)
    8e54:	00048513          	mv	a0,s1
    8e58:	4c8010ef          	jal	a320 <__mcmp>
    8e5c:	ec0552e3          	bgez	a0,8d20 <_dtoa_r+0xaf8>
    8e60:	02012783          	lw	a5,32(sp)
    8e64:	00048593          	mv	a1,s1
    8e68:	00000693          	li	a3,0
    8e6c:	00a00613          	li	a2,10
    8e70:	00040513          	mv	a0,s0
    8e74:	fff78b13          	add	s6,a5,-1
    8e78:	375000ef          	jal	99ec <__multadd>
    8e7c:	02812783          	lw	a5,40(sp)
    8e80:	00050493          	mv	s1,a0
    8e84:	0c079e63          	bnez	a5,8f60 <_dtoa_r+0xd38>
    8e88:	03c12c03          	lw	s8,60(sp)
    8e8c:	17805ee3          	blez	s8,9808 <_dtoa_r+0x15e0>
    8e90:	02012a03          	lw	s4,32(sp)
    8e94:	ea1ff06f          	j	8d34 <_dtoa_r+0xb0c>
    8e98:	00100793          	li	a5,1
    8e9c:	02f12a23          	sw	a5,52(sp)
    8ea0:	e28ff06f          	j	84c8 <_dtoa_r+0x2a0>
    8ea4:	01c00793          	li	a5,28
    8ea8:	e3dff06f          	j	8ce4 <_dtoa_r+0xabc>
    8eac:	00100713          	li	a4,1
    8eb0:	4d475463          	bge	a4,s4,9378 <_dtoa_r+0x1150>
    8eb4:	03012783          	lw	a5,48(sp)
    8eb8:	fffc0b93          	add	s7,s8,-1
    8ebc:	4177ca63          	blt	a5,s7,92d0 <_dtoa_r+0x10a8>
    8ec0:	41778bb3          	sub	s7,a5,s7
    8ec4:	01012783          	lw	a5,16(sp)
    8ec8:	41878cb3          	sub	s9,a5,s8
    8ecc:	100c54e3          	bgez	s8,97d4 <_dtoa_r+0x15ac>
    8ed0:	00100593          	li	a1,1
    8ed4:	00040513          	mv	a0,s0
    8ed8:	5f1000ef          	jal	9cc8 <__i2b>
    8edc:	00050913          	mv	s2,a0
    8ee0:	d79ff06f          	j	8c58 <_dtoa_r+0xa30>
    8ee4:	02012a23          	sw	zero,52(sp)
    8ee8:	00012823          	sw	zero,16(sp)
    8eec:	ab5042e3          	bgtz	s5,8990 <_dtoa_r+0x768>
    8ef0:	00100793          	li	a5,1
    8ef4:	415787b3          	sub	a5,a5,s5
    8ef8:	00f12823          	sw	a5,16(sp)
    8efc:	00000b13          	li	s6,0
    8f00:	a91ff06f          	j	8990 <_dtoa_r+0x768>
    8f04:	40e787b3          	sub	a5,a5,a4
    8f08:	00fd9533          	sll	a0,s11,a5
    8f0c:	ca0ff06f          	j	83ac <_dtoa_r+0x184>
    8f10:	00300793          	li	a5,3
    8f14:	00100913          	li	s2,1
    8f18:	44fa0c63          	beq	s4,a5,9370 <_dtoa_r+0x1148>
    8f1c:	df47cc63          	blt	a5,s4,8514 <_dtoa_r+0x2ec>
    8f20:	00200793          	li	a5,2
    8f24:	18fa00e3          	beq	s4,a5,98a4 <_dtoa_r+0x167c>
    8f28:	02042e23          	sw	zero,60(s0)
    8f2c:	00000593          	li	a1,0
    8f30:	00040513          	mv	a0,s0
    8f34:	1e1000ef          	jal	9914 <_Balloc>
    8f38:	00050a93          	mv	s5,a0
    8f3c:	140500e3          	beqz	a0,987c <_dtoa_r+0x1654>
    8f40:	00100793          	li	a5,1
    8f44:	02f12423          	sw	a5,40(sp)
    8f48:	fff00793          	li	a5,-1
    8f4c:	02a42c23          	sw	a0,56(s0)
    8f50:	02f12e23          	sw	a5,60(sp)
    8f54:	fff00c13          	li	s8,-1
    8f58:	00012a23          	sw	zero,20(sp)
    8f5c:	b35ff06f          	j	8a90 <_dtoa_r+0x868>
    8f60:	00090593          	mv	a1,s2
    8f64:	00000693          	li	a3,0
    8f68:	00a00613          	li	a2,10
    8f6c:	00040513          	mv	a0,s0
    8f70:	27d000ef          	jal	99ec <__multadd>
    8f74:	03c12c03          	lw	s8,60(sp)
    8f78:	00050913          	mv	s2,a0
    8f7c:	0b805ae3          	blez	s8,9830 <_dtoa_r+0x1608>
    8f80:	03612023          	sw	s6,32(sp)
    8f84:	01905c63          	blez	s9,8f9c <_dtoa_r+0xd74>
    8f88:	00090593          	mv	a1,s2
    8f8c:	000c8613          	mv	a2,s9
    8f90:	00040513          	mv	a0,s0
    8f94:	1fc010ef          	jal	a190 <__lshift>
    8f98:	00050913          	mv	s2,a0
    8f9c:	00090b13          	mv	s6,s2
    8fa0:	50099e63          	bnez	s3,94bc <_dtoa_r+0x1294>
    8fa4:	02412783          	lw	a5,36(sp)
    8fa8:	fffa8d13          	add	s10,s5,-1
    8fac:	000a8c93          	mv	s9,s5
    8fb0:	01512823          	sw	s5,16(sp)
    8fb4:	01812a83          	lw	s5,24(sp)
    8fb8:	0017f793          	and	a5,a5,1
    8fbc:	018d0d33          	add	s10,s10,s8
    8fc0:	00f12023          	sw	a5,0(sp)
    8fc4:	01b12a23          	sw	s11,20(sp)
    8fc8:	000a8593          	mv	a1,s5
    8fcc:	00048513          	mv	a0,s1
    8fd0:	ff9fe0ef          	jal	7fc8 <quorem>
    8fd4:	00050c13          	mv	s8,a0
    8fd8:	00090593          	mv	a1,s2
    8fdc:	00048513          	mv	a0,s1
    8fe0:	340010ef          	jal	a320 <__mcmp>
    8fe4:	00050993          	mv	s3,a0
    8fe8:	000b0613          	mv	a2,s6
    8fec:	000a8593          	mv	a1,s5
    8ff0:	00040513          	mv	a0,s0
    8ff4:	384010ef          	jal	a378 <__mdiff>
    8ff8:	00c52703          	lw	a4,12(a0)
    8ffc:	030c0b93          	add	s7,s8,48
    9000:	00050d93          	mv	s11,a0
    9004:	08071c63          	bnez	a4,909c <_dtoa_r+0xe74>
    9008:	00050593          	mv	a1,a0
    900c:	00048513          	mv	a0,s1
    9010:	310010ef          	jal	a320 <__mcmp>
    9014:	00050713          	mv	a4,a0
    9018:	000d8593          	mv	a1,s11
    901c:	00040513          	mv	a0,s0
    9020:	00070d93          	mv	s11,a4
    9024:	1a5000ef          	jal	99c8 <_Bfree>
    9028:	014de6b3          	or	a3,s11,s4
    902c:	0e069a63          	bnez	a3,9120 <_dtoa_r+0xef8>
    9030:	00012783          	lw	a5,0(sp)
    9034:	76078e63          	beqz	a5,97b0 <_dtoa_r+0x1588>
    9038:	7809c663          	bltz	s3,97c4 <_dtoa_r+0x159c>
    903c:	017c8023          	sb	s7,0(s9)
    9040:	001c8993          	add	s3,s9,1
    9044:	679d0e63          	beq	s10,s9,96c0 <_dtoa_r+0x1498>
    9048:	00048593          	mv	a1,s1
    904c:	00000693          	li	a3,0
    9050:	00a00613          	li	a2,10
    9054:	00040513          	mv	a0,s0
    9058:	195000ef          	jal	99ec <__multadd>
    905c:	00050493          	mv	s1,a0
    9060:	00000693          	li	a3,0
    9064:	00a00613          	li	a2,10
    9068:	00090593          	mv	a1,s2
    906c:	00040513          	mv	a0,s0
    9070:	09690e63          	beq	s2,s6,910c <_dtoa_r+0xee4>
    9074:	179000ef          	jal	99ec <__multadd>
    9078:	000b0593          	mv	a1,s6
    907c:	00050913          	mv	s2,a0
    9080:	00000693          	li	a3,0
    9084:	00a00613          	li	a2,10
    9088:	00040513          	mv	a0,s0
    908c:	161000ef          	jal	99ec <__multadd>
    9090:	00050b13          	mv	s6,a0
    9094:	00098c93          	mv	s9,s3
    9098:	f31ff06f          	j	8fc8 <_dtoa_r+0xda0>
    909c:	00050593          	mv	a1,a0
    90a0:	00040513          	mv	a0,s0
    90a4:	01012a83          	lw	s5,16(sp)
    90a8:	01412d83          	lw	s11,20(sp)
    90ac:	11d000ef          	jal	99c8 <_Bfree>
    90b0:	0009ca63          	bltz	s3,90c4 <_dtoa_r+0xe9c>
    90b4:	001df713          	and	a4,s11,1
    90b8:	0149e9b3          	or	s3,s3,s4
    90bc:	01376733          	or	a4,a4,s3
    90c0:	06071e63          	bnez	a4,913c <_dtoa_r+0xf14>
    90c4:	00048593          	mv	a1,s1
    90c8:	00100613          	li	a2,1
    90cc:	00040513          	mv	a0,s0
    90d0:	0c0010ef          	jal	a190 <__lshift>
    90d4:	01812583          	lw	a1,24(sp)
    90d8:	00050493          	mv	s1,a0
    90dc:	244010ef          	jal	a320 <__mcmp>
    90e0:	24a05863          	blez	a0,9330 <_dtoa_r+0x1108>
    90e4:	03900713          	li	a4,57
    90e8:	24eb8c63          	beq	s7,a4,9340 <_dtoa_r+0x1118>
    90ec:	031c0b93          	add	s7,s8,49
    90f0:	02012783          	lw	a5,32(sp)
    90f4:	00090c13          	mv	s8,s2
    90f8:	001c8d13          	add	s10,s9,1
    90fc:	017c8023          	sb	s7,0(s9)
    9100:	00178a13          	add	s4,a5,1
    9104:	000b0913          	mv	s2,s6
    9108:	cc5ff06f          	j	8dcc <_dtoa_r+0xba4>
    910c:	0e1000ef          	jal	99ec <__multadd>
    9110:	00050913          	mv	s2,a0
    9114:	00050b13          	mv	s6,a0
    9118:	00098c93          	mv	s9,s3
    911c:	eadff06f          	j	8fc8 <_dtoa_r+0xda0>
    9120:	7409c863          	bltz	s3,9870 <_dtoa_r+0x1648>
    9124:	00012783          	lw	a5,0(sp)
    9128:	0149e9b3          	or	s3,s3,s4
    912c:	0137e9b3          	or	s3,a5,s3
    9130:	74098063          	beqz	s3,9870 <_dtoa_r+0x1648>
    9134:	f1b054e3          	blez	s11,903c <_dtoa_r+0xe14>
    9138:	01012a83          	lw	s5,16(sp)
    913c:	03900713          	li	a4,57
    9140:	20eb8063          	beq	s7,a4,9340 <_dtoa_r+0x1118>
    9144:	02012703          	lw	a4,32(sp)
    9148:	001b8793          	add	a5,s7,1
    914c:	00090c13          	mv	s8,s2
    9150:	001c8d13          	add	s10,s9,1
    9154:	00170a13          	add	s4,a4,1
    9158:	00fc8023          	sb	a5,0(s9)
    915c:	000b0913          	mv	s2,s6
    9160:	c6dff06f          	j	8dcc <_dtoa_r+0xba4>
    9164:	00200793          	li	a5,2
    9168:	bb47dee3          	bge	a5,s4,8d24 <_dtoa_r+0xafc>
    916c:	000a8d13          	mv	s10,s5
    9170:	9a0c10e3          	bnez	s8,8b10 <_dtoa_r+0x8e8>
    9174:	01812583          	lw	a1,24(sp)
    9178:	00000693          	li	a3,0
    917c:	00500613          	li	a2,5
    9180:	00040513          	mv	a0,s0
    9184:	069000ef          	jal	99ec <__multadd>
    9188:	00050593          	mv	a1,a0
    918c:	00a12c23          	sw	a0,24(sp)
    9190:	00048513          	mv	a0,s1
    9194:	18c010ef          	jal	a320 <__mcmp>
    9198:	96a05ce3          	blez	a0,8b10 <_dtoa_r+0x8e8>
    919c:	03100793          	li	a5,49
    91a0:	00fa8023          	sb	a5,0(s5)
    91a4:	02012783          	lw	a5,32(sp)
    91a8:	001a8d13          	add	s10,s5,1
    91ac:	00178a13          	add	s4,a5,1
    91b0:	01812583          	lw	a1,24(sp)
    91b4:	00040513          	mv	a0,s0
    91b8:	001a0a13          	add	s4,s4,1
    91bc:	00d000ef          	jal	99c8 <_Bfree>
    91c0:	c20918e3          	bnez	s2,8df0 <_dtoa_r+0xbc8>
    91c4:	c39ff06f          	j	8dfc <_dtoa_r+0xbd4>
    91c8:	00050593          	mv	a1,a0
    91cc:	00098613          	mv	a2,s3
    91d0:	00040513          	mv	a0,s0
    91d4:	66d000ef          	jal	a040 <__pow5mult>
    91d8:	00100793          	li	a5,1
    91dc:	00a12c23          	sw	a0,24(sp)
    91e0:	1147de63          	bge	a5,s4,92fc <_dtoa_r+0x10d4>
    91e4:	00000993          	li	s3,0
    91e8:	01812703          	lw	a4,24(sp)
    91ec:	01072783          	lw	a5,16(a4)
    91f0:	00378793          	add	a5,a5,3
    91f4:	00279793          	sll	a5,a5,0x2
    91f8:	00f707b3          	add	a5,a4,a5
    91fc:	0047a503          	lw	a0,4(a5)
    9200:	171000ef          	jal	9b70 <__hi0bits>
    9204:	02000793          	li	a5,32
    9208:	40a787b3          	sub	a5,a5,a0
    920c:	ab5ff06f          	j	8cc0 <_dtoa_r+0xa98>
    9210:	02412783          	lw	a5,36(sp)
    9214:	04079063          	bnez	a5,9254 <_dtoa_r+0x102c>
    9218:	00012783          	lw	a5,0(sp)
    921c:	00c79793          	sll	a5,a5,0xc
    9220:	02079a63          	bnez	a5,9254 <_dtoa_r+0x102c>
    9224:	00012683          	lw	a3,0(sp)
    9228:	00000793          	li	a5,0
    922c:	0146d713          	srl	a4,a3,0x14
    9230:	7ff77713          	and	a4,a4,2047
    9234:	00070c63          	beqz	a4,924c <_dtoa_r+0x1024>
    9238:	01012783          	lw	a5,16(sp)
    923c:	001b0b13          	add	s6,s6,1
    9240:	00178793          	add	a5,a5,1
    9244:	00f12823          	sw	a5,16(sp)
    9248:	00100793          	li	a5,1
    924c:	58099063          	bnez	s3,97cc <_dtoa_r+0x15a4>
    9250:	00078993          	mv	s3,a5
    9254:	00100793          	li	a5,1
    9258:	a69ff06f          	j	8cc0 <_dtoa_r+0xa98>
    925c:	a8d70ee3          	beq	a4,a3,8cf8 <_dtoa_r+0xad0>
    9260:	03c00713          	li	a4,60
    9264:	40f707b3          	sub	a5,a4,a5
    9268:	a7dff06f          	j	8ce4 <_dtoa_r+0xabc>
    926c:	00100793          	li	a5,1
    9270:	00500a13          	li	s4,5
    9274:	02f12423          	sw	a5,40(sp)
    9278:	01412783          	lw	a5,20(sp)
    927c:	02012703          	lw	a4,32(sp)
    9280:	00e787b3          	add	a5,a5,a4
    9284:	00178c13          	add	s8,a5,1
    9288:	02f12e23          	sw	a5,60(sp)
    928c:	000c0613          	mv	a2,s8
    9290:	ab804263          	bgtz	s8,8534 <_dtoa_r+0x30c>
    9294:	00100613          	li	a2,1
    9298:	a9cff06f          	j	8534 <_dtoa_r+0x30c>
    929c:	00051663          	bnez	a0,92a8 <_dtoa_r+0x1080>
    92a0:	001bf793          	and	a5,s7,1
    92a4:	b00792e3          	bnez	a5,8da8 <_dtoa_r+0xb80>
    92a8:	03000693          	li	a3,48
    92ac:	fff9c783          	lbu	a5,-1(s3)
    92b0:	00098d13          	mv	s10,s3
    92b4:	fff98993          	add	s3,s3,-1
    92b8:	fed78ae3          	beq	a5,a3,92ac <_dtoa_r+0x1084>
    92bc:	b11ff06f          	j	8dcc <_dtoa_r+0xba4>
    92c0:	000c0993          	mv	s3,s8
    92c4:	abdff06f          	j	8d80 <_dtoa_r+0xb58>
    92c8:	000b0793          	mv	a5,s6
    92cc:	99dff06f          	j	8c68 <_dtoa_r+0xa40>
    92d0:	03012783          	lw	a5,48(sp)
    92d4:	01012703          	lw	a4,16(sp)
    92d8:	03712823          	sw	s7,48(sp)
    92dc:	40fb87b3          	sub	a5,s7,a5
    92e0:	00f989b3          	add	s3,s3,a5
    92e4:	018707b3          	add	a5,a4,s8
    92e8:	00070c93          	mv	s9,a4
    92ec:	018b0b33          	add	s6,s6,s8
    92f0:	00f12823          	sw	a5,16(sp)
    92f4:	00000b93          	li	s7,0
    92f8:	bd9ff06f          	j	8ed0 <_dtoa_r+0xca8>
    92fc:	02412783          	lw	a5,36(sp)
    9300:	ee0792e3          	bnez	a5,91e4 <_dtoa_r+0xfbc>
    9304:	00012783          	lw	a5,0(sp)
    9308:	00c79793          	sll	a5,a5,0xc
    930c:	ec079ce3          	bnez	a5,91e4 <_dtoa_r+0xfbc>
    9310:	f15ff06f          	j	9224 <_dtoa_r+0xffc>
    9314:	01812303          	lw	t1,24(sp)
    9318:	01c12d03          	lw	s10,28(sp)
    931c:	00200913          	li	s2,2
    9320:	ad0ff06f          	j	85f0 <_dtoa_r+0x3c8>
    9324:	00200a13          	li	s4,2
    9328:	02012423          	sw	zero,40(sp)
    932c:	9f8ff06f          	j	8524 <_dtoa_r+0x2fc>
    9330:	dc0510e3          	bnez	a0,90f0 <_dtoa_r+0xec8>
    9334:	001bf713          	and	a4,s7,1
    9338:	da0716e3          	bnez	a4,90e4 <_dtoa_r+0xebc>
    933c:	db5ff06f          	j	90f0 <_dtoa_r+0xec8>
    9340:	03900793          	li	a5,57
    9344:	00fc8023          	sb	a5,0(s9)
    9348:	02012783          	lw	a5,32(sp)
    934c:	00090c13          	mv	s8,s2
    9350:	001c8993          	add	s3,s9,1
    9354:	00178a13          	add	s4,a5,1
    9358:	000b0913          	mv	s2,s6
    935c:	a4dff06f          	j	8da8 <_dtoa_r+0xb80>
    9360:	00100793          	li	a5,1
    9364:	00100c13          	li	s8,1
    9368:	00f12a23          	sw	a5,20(sp)
    936c:	e50ff06f          	j	89bc <_dtoa_r+0x794>
    9370:	02012423          	sw	zero,40(sp)
    9374:	f05ff06f          	j	9278 <_dtoa_r+0x1050>
    9378:	03812703          	lw	a4,56(sp)
    937c:	30070e63          	beqz	a4,9698 <_dtoa_r+0x1470>
    9380:	01012703          	lw	a4,16(sp)
    9384:	43378793          	add	a5,a5,1075
    9388:	00fb0b33          	add	s6,s6,a5
    938c:	00f707b3          	add	a5,a4,a5
    9390:	03012b83          	lw	s7,48(sp)
    9394:	00070c93          	mv	s9,a4
    9398:	00f12823          	sw	a5,16(sp)
    939c:	b35ff06f          	j	8ed0 <_dtoa_r+0xca8>
    93a0:	03100793          	li	a5,49
    93a4:	00fa8023          	sb	a5,0(s5)
    93a8:	001a0a13          	add	s4,s4,1
    93ac:	a21ff06f          	j	8dcc <_dtoa_r+0xba4>
    93b0:	02012783          	lw	a5,32(sp)
    93b4:	32078263          	beqz	a5,96d8 <_dtoa_r+0x14b0>
    93b8:	40f00bb3          	neg	s7,a5
    93bc:	00fbf713          	and	a4,s7,15
    93c0:	00371713          	sll	a4,a4,0x3
    93c4:	00006797          	auipc	a5,0x6
    93c8:	58c78793          	add	a5,a5,1420 # f950 <__mprec_tens>
    93cc:	00e787b3          	add	a5,a5,a4
    93d0:	0007a603          	lw	a2,0(a5)
    93d4:	0047a683          	lw	a3,4(a5)
    93d8:	01812503          	lw	a0,24(sp)
    93dc:	01c12583          	lw	a1,28(sp)
    93e0:	404bdb93          	sra	s7,s7,0x4
    93e4:	3d4040ef          	jal	d7b8 <__muldf3>
    93e8:	00058d13          	mv	s10,a1
    93ec:	440b8c63          	beqz	s7,9844 <_dtoa_r+0x161c>
    93f0:	00200913          	li	s2,2
    93f4:	04812023          	sw	s0,64(sp)
    93f8:	00006c97          	auipc	s9,0x6
    93fc:	530c8c93          	add	s9,s9,1328 # f928 <__mprec_bigtens>
    9400:	00090413          	mv	s0,s2
    9404:	00050713          	mv	a4,a0
    9408:	00000613          	li	a2,0
    940c:	00050913          	mv	s2,a0
    9410:	001bf693          	and	a3,s7,1
    9414:	02068063          	beqz	a3,9434 <_dtoa_r+0x120c>
    9418:	000ca603          	lw	a2,0(s9)
    941c:	004ca683          	lw	a3,4(s9)
    9420:	00070513          	mv	a0,a4
    9424:	00140413          	add	s0,s0,1
    9428:	390040ef          	jal	d7b8 <__muldf3>
    942c:	00050713          	mv	a4,a0
    9430:	00100613          	li	a2,1
    9434:	401bdb93          	sra	s7,s7,0x1
    9438:	008c8c93          	add	s9,s9,8
    943c:	fc0b9ae3          	bnez	s7,9410 <_dtoa_r+0x11e8>
    9440:	00090513          	mv	a0,s2
    9444:	00058793          	mv	a5,a1
    9448:	00040913          	mv	s2,s0
    944c:	04012403          	lw	s0,64(sp)
    9450:	a0061a63          	bnez	a2,8664 <_dtoa_r+0x43c>
    9454:	00050713          	mv	a4,a0
    9458:	000d0793          	mv	a5,s10
    945c:	a08ff06f          	j	8664 <_dtoa_r+0x43c>
    9460:	00068593          	mv	a1,a3
    9464:	00070613          	mv	a2,a4
    9468:	00070513          	mv	a0,a4
    946c:	745020ef          	jal	c3b0 <__adddf3>
    9470:	02012783          	lw	a5,32(sp)
    9474:	00090613          	mv	a2,s2
    9478:	00098693          	mv	a3,s3
    947c:	00178a13          	add	s4,a5,1
    9480:	00050c93          	mv	s9,a0
    9484:	00058b13          	mv	s6,a1
    9488:	000a0c13          	mv	s8,s4
    948c:	124040ef          	jal	d5b0 <__gedf2>
    9490:	c4a04863          	bgtz	a0,88e0 <_dtoa_r+0x6b8>
    9494:	000c8513          	mv	a0,s9
    9498:	000b0593          	mv	a1,s6
    949c:	00090613          	mv	a2,s2
    94a0:	00098693          	mv	a3,s3
    94a4:	080040ef          	jal	d524 <__eqdf2>
    94a8:	00051663          	bnez	a0,94b4 <_dtoa_r+0x128c>
    94ac:	001d7d13          	and	s10,s10,1
    94b0:	c20d1863          	bnez	s10,88e0 <_dtoa_r+0x6b8>
    94b4:	000b8d13          	mv	s10,s7
    94b8:	945ff06f          	j	8dfc <_dtoa_r+0xbd4>
    94bc:	00492583          	lw	a1,4(s2)
    94c0:	00040513          	mv	a0,s0
    94c4:	450000ef          	jal	9914 <_Balloc>
    94c8:	00050993          	mv	s3,a0
    94cc:	38050463          	beqz	a0,9854 <_dtoa_r+0x162c>
    94d0:	01092603          	lw	a2,16(s2)
    94d4:	00c90593          	add	a1,s2,12
    94d8:	00c50513          	add	a0,a0,12
    94dc:	00260613          	add	a2,a2,2
    94e0:	00261613          	sll	a2,a2,0x2
    94e4:	ccdf70ef          	jal	11b0 <memcpy>
    94e8:	00100613          	li	a2,1
    94ec:	00098593          	mv	a1,s3
    94f0:	00040513          	mv	a0,s0
    94f4:	49d000ef          	jal	a190 <__lshift>
    94f8:	00050b13          	mv	s6,a0
    94fc:	aa9ff06f          	j	8fa4 <_dtoa_r+0xd7c>
    9500:	00090593          	mv	a1,s2
    9504:	000b8613          	mv	a2,s7
    9508:	00040513          	mv	a0,s0
    950c:	335000ef          	jal	a040 <__pow5mult>
    9510:	00048613          	mv	a2,s1
    9514:	00050593          	mv	a1,a0
    9518:	00050913          	mv	s2,a0
    951c:	00040513          	mv	a0,s0
    9520:	059000ef          	jal	9d78 <__multiply>
    9524:	00050793          	mv	a5,a0
    9528:	00048593          	mv	a1,s1
    952c:	00040513          	mv	a0,s0
    9530:	00078493          	mv	s1,a5
    9534:	494000ef          	jal	99c8 <_Bfree>
    9538:	03012783          	lw	a5,48(sp)
    953c:	417787b3          	sub	a5,a5,s7
    9540:	02f12823          	sw	a5,48(sp)
    9544:	f6078063          	beqz	a5,8ca4 <_dtoa_r+0xa7c>
    9548:	f48ff06f          	j	8c90 <_dtoa_r+0xa68>
    954c:	05012603          	lw	a2,80(sp)
    9550:	05412683          	lw	a3,84(sp)
    9554:	05812503          	lw	a0,88(sp)
    9558:	04b12623          	sw	a1,76(sp)
    955c:	000b8593          	mv	a1,s7
    9560:	02612423          	sw	t1,40(sp)
    9564:	254040ef          	jal	d7b8 <__muldf3>
    9568:	02812303          	lw	t1,40(sp)
    956c:	04812783          	lw	a5,72(sp)
    9570:	00100693          	li	a3,1
    9574:	006a8023          	sb	t1,0(s5)
    9578:	02a12c23          	sw	a0,56(sp)
    957c:	04c12883          	lw	a7,76(sp)
    9580:	00058913          	mv	s2,a1
    9584:	00fa8bb3          	add	s7,s5,a5
    9588:	7fff7617          	auipc	a2,0x7fff7
    958c:	16860613          	add	a2,a2,360 # 800006f0 <__global_locale+0x1bc>
    9590:	28d78c63          	beq	a5,a3,9828 <_dtoa_r+0x1600>
    9594:	00062783          	lw	a5,0(a2)
    9598:	00462803          	lw	a6,4(a2)
    959c:	04912423          	sw	s1,72(sp)
    95a0:	02f12423          	sw	a5,40(sp)
    95a4:	03012623          	sw	a6,44(sp)
    95a8:	04812623          	sw	s0,76(sp)
    95ac:	000c8513          	mv	a0,s9
    95b0:	00088593          	mv	a1,a7
    95b4:	02812603          	lw	a2,40(sp)
    95b8:	02c12683          	lw	a3,44(sp)
    95bc:	001d0d13          	add	s10,s10,1
    95c0:	1f8040ef          	jal	d7b8 <__muldf3>
    95c4:	00058413          	mv	s0,a1
    95c8:	00050493          	mv	s1,a0
    95cc:	2d8050ef          	jal	e8a4 <__fixdfsi>
    95d0:	00050c93          	mv	s9,a0
    95d4:	354050ef          	jal	e928 <__floatsidf>
    95d8:	00050613          	mv	a2,a0
    95dc:	00058693          	mv	a3,a1
    95e0:	00048513          	mv	a0,s1
    95e4:	00040593          	mv	a1,s0
    95e8:	030c8c93          	add	s9,s9,48
    95ec:	15d040ef          	jal	df48 <__subdf3>
    95f0:	ff9d0fa3          	sb	s9,-1(s10)
    95f4:	fdab90e3          	bne	s7,s10,95b4 <_dtoa_r+0x138c>
    95f8:	04812483          	lw	s1,72(sp)
    95fc:	04c12403          	lw	s0,76(sp)
    9600:	00050c93          	mv	s9,a0
    9604:	00058893          	mv	a7,a1
    9608:	7fff7d17          	auipc	s10,0x7fff7
    960c:	0b0d0d13          	add	s10,s10,176 # 800006b8 <__global_locale+0x184>
    9610:	000d2603          	lw	a2,0(s10)
    9614:	004d2683          	lw	a3,4(s10)
    9618:	03812503          	lw	a0,56(sp)
    961c:	00090593          	mv	a1,s2
    9620:	03112423          	sw	a7,40(sp)
    9624:	58d020ef          	jal	c3b0 <__adddf3>
    9628:	02812883          	lw	a7,40(sp)
    962c:	000c8613          	mv	a2,s9
    9630:	00088693          	mv	a3,a7
    9634:	07c040ef          	jal	d6b0 <__ledf2>
    9638:	1a054863          	bltz	a0,97e8 <_dtoa_r+0x15c0>
    963c:	03812603          	lw	a2,56(sp)
    9640:	000d2503          	lw	a0,0(s10)
    9644:	004d2583          	lw	a1,4(s10)
    9648:	00090693          	mv	a3,s2
    964c:	0fd040ef          	jal	df48 <__subdf3>
    9650:	02812883          	lw	a7,40(sp)
    9654:	000c8613          	mv	a2,s9
    9658:	00088693          	mv	a3,a7
    965c:	755030ef          	jal	d5b0 <__gedf2>
    9660:	12a04863          	bgtz	a0,9790 <_dtoa_r+0x1568>
    9664:	06c12783          	lw	a5,108(sp)
    9668:	de07c063          	bltz	a5,8c48 <_dtoa_r+0xa20>
    966c:	02012703          	lw	a4,32(sp)
    9670:	00e00793          	li	a5,14
    9674:	dce7ca63          	blt	a5,a4,8c48 <_dtoa_r+0xa20>
    9678:	02012783          	lw	a5,32(sp)
    967c:	00006717          	auipc	a4,0x6
    9680:	2d470713          	add	a4,a4,724 # f950 <__mprec_tens>
    9684:	00379793          	sll	a5,a5,0x3
    9688:	00f707b3          	add	a5,a4,a5
    968c:	0007a903          	lw	s2,0(a5)
    9690:	0047a983          	lw	s3,4(a5)
    9694:	c90ff06f          	j	8b24 <_dtoa_r+0x8fc>
    9698:	06812703          	lw	a4,104(sp)
    969c:	01012683          	lw	a3,16(sp)
    96a0:	03600793          	li	a5,54
    96a4:	40e787b3          	sub	a5,a5,a4
    96a8:	00fb0b33          	add	s6,s6,a5
    96ac:	00f687b3          	add	a5,a3,a5
    96b0:	03012b83          	lw	s7,48(sp)
    96b4:	00068c93          	mv	s9,a3
    96b8:	00f12823          	sw	a5,16(sp)
    96bc:	815ff06f          	j	8ed0 <_dtoa_r+0xca8>
    96c0:	02012783          	lw	a5,32(sp)
    96c4:	00090c13          	mv	s8,s2
    96c8:	01012a83          	lw	s5,16(sp)
    96cc:	00178a13          	add	s4,a5,1
    96d0:	000b0913          	mv	s2,s6
    96d4:	eb4ff06f          	j	8d88 <_dtoa_r+0xb60>
    96d8:	01812703          	lw	a4,24(sp)
    96dc:	01c12783          	lw	a5,28(sp)
    96e0:	00200913          	li	s2,2
    96e4:	f81fe06f          	j	8664 <_dtoa_r+0x43c>
    96e8:	b00c0063          	beqz	s8,89e8 <_dtoa_r+0x7c0>
    96ec:	03c12d03          	lw	s10,60(sp)
    96f0:	bba05063          	blez	s10,8a90 <_dtoa_r+0x868>
    96f4:	7fff7617          	auipc	a2,0x7fff7
    96f8:	ffc60613          	add	a2,a2,-4 # 800006f0 <__global_locale+0x1bc>
    96fc:	00078593          	mv	a1,a5
    9700:	02012783          	lw	a5,32(sp)
    9704:	00462683          	lw	a3,4(a2)
    9708:	00062603          	lw	a2,0(a2)
    970c:	fff78793          	add	a5,a5,-1
    9710:	00070513          	mv	a0,a4
    9714:	04f12e23          	sw	a5,92(sp)
    9718:	0a0040ef          	jal	d7b8 <__muldf3>
    971c:	00050713          	mv	a4,a0
    9720:	00190513          	add	a0,s2,1
    9724:	04e12423          	sw	a4,72(sp)
    9728:	04b12023          	sw	a1,64(sp)
    972c:	1fc050ef          	jal	e928 <__floatsidf>
    9730:	04812703          	lw	a4,72(sp)
    9734:	04012783          	lw	a5,64(sp)
    9738:	00070613          	mv	a2,a4
    973c:	00078693          	mv	a3,a5
    9740:	04e12623          	sw	a4,76(sp)
    9744:	074040ef          	jal	d7b8 <__muldf3>
    9748:	7fff7697          	auipc	a3,0x7fff7
    974c:	fb068693          	add	a3,a3,-80 # 800006f8 <__global_locale+0x1c4>
    9750:	0006a603          	lw	a2,0(a3)
    9754:	0046a683          	lw	a3,4(a3)
    9758:	459020ef          	jal	c3b0 <__adddf3>
    975c:	fcc006b7          	lui	a3,0xfcc00
    9760:	04012783          	lw	a5,64(sp)
    9764:	04c12703          	lw	a4,76(sp)
    9768:	00050c93          	mv	s9,a0
    976c:	00b68bb3          	add	s7,a3,a1
    9770:	05a12423          	sw	s10,72(sp)
    9774:	f91fe06f          	j	8704 <_dtoa_r+0x4dc>
    9778:	03100693          	li	a3,49
    977c:	001c0c13          	add	s8,s8,1
    9780:	984ff06f          	j	8904 <_dtoa_r+0x6dc>
    9784:	00012c23          	sw	zero,24(sp)
    9788:	00000913          	li	s2,0
    978c:	a11ff06f          	j	919c <_dtoa_r+0xf74>
    9790:	03000613          	li	a2,48
    9794:	fffbc783          	lbu	a5,-1(s7)
    9798:	000b8d13          	mv	s10,s7
    979c:	fffb8b93          	add	s7,s7,-1
    97a0:	fec78ae3          	beq	a5,a2,9794 <_dtoa_r+0x156c>
    97a4:	05c12783          	lw	a5,92(sp)
    97a8:	00178a13          	add	s4,a5,1
    97ac:	e50ff06f          	j	8dfc <_dtoa_r+0xbd4>
    97b0:	03900713          	li	a4,57
    97b4:	01012a83          	lw	s5,16(sp)
    97b8:	b8eb84e3          	beq	s7,a4,9340 <_dtoa_r+0x1118>
    97bc:	933048e3          	bgtz	s3,90ec <_dtoa_r+0xec4>
    97c0:	931ff06f          	j	90f0 <_dtoa_r+0xec8>
    97c4:	01012a83          	lw	s5,16(sp)
    97c8:	929ff06f          	j	90f0 <_dtoa_r+0xec8>
    97cc:	00078993          	mv	s3,a5
    97d0:	a19ff06f          	j	91e8 <_dtoa_r+0xfc0>
    97d4:	00078c93          	mv	s9,a5
    97d8:	018787b3          	add	a5,a5,s8
    97dc:	018b0b33          	add	s6,s6,s8
    97e0:	00f12823          	sw	a5,16(sp)
    97e4:	eecff06f          	j	8ed0 <_dtoa_r+0xca8>
    97e8:	05c12783          	lw	a5,92(sp)
    97ec:	00178c13          	add	s8,a5,1
    97f0:	8f0ff06f          	j	88e0 <_dtoa_r+0x6b8>
    97f4:	04c12983          	lw	s3,76(sp)
    97f8:	05012b03          	lw	s6,80(sp)
    97fc:	05812c03          	lw	s8,88(sp)
    9800:	04812a03          	lw	s4,72(sp)
    9804:	a8cff06f          	j	8a90 <_dtoa_r+0x868>
    9808:	00200793          	li	a5,2
    980c:	0147c863          	blt	a5,s4,981c <_dtoa_r+0x15f4>
    9810:	02012a03          	lw	s4,32(sp)
    9814:	03c12c03          	lw	s8,60(sp)
    9818:	d1cff06f          	j	8d34 <_dtoa_r+0xb0c>
    981c:	03c12c03          	lw	s8,60(sp)
    9820:	03612023          	sw	s6,32(sp)
    9824:	949ff06f          	j	916c <_dtoa_r+0xf44>
    9828:	04012b83          	lw	s7,64(sp)
    982c:	dddff06f          	j	9608 <_dtoa_r+0x13e0>
    9830:	00200793          	li	a5,2
    9834:	ff47c4e3          	blt	a5,s4,981c <_dtoa_r+0x15f4>
    9838:	03c12c03          	lw	s8,60(sp)
    983c:	03612023          	sw	s6,32(sp)
    9840:	f44ff06f          	j	8f84 <_dtoa_r+0xd5c>
    9844:	00050713          	mv	a4,a0
    9848:	00058793          	mv	a5,a1
    984c:	00200913          	li	s2,2
    9850:	e15fe06f          	j	8664 <_dtoa_r+0x43c>
    9854:	00006697          	auipc	a3,0x6
    9858:	abc68693          	add	a3,a3,-1348 # f310 <__fini_array_end+0x298>
    985c:	00000613          	li	a2,0
    9860:	2ef00593          	li	a1,751
    9864:	00006517          	auipc	a0,0x6
    9868:	ac050513          	add	a0,a0,-1344 # f324 <__fini_array_end+0x2ac>
    986c:	0cd010ef          	jal	b138 <__assert_func>
    9870:	01012a83          	lw	s5,16(sp)
    9874:	85b048e3          	bgtz	s11,90c4 <_dtoa_r+0xe9c>
    9878:	879ff06f          	j	90f0 <_dtoa_r+0xec8>
    987c:	00006697          	auipc	a3,0x6
    9880:	a9468693          	add	a3,a3,-1388 # f310 <__fini_array_end+0x298>
    9884:	00000613          	li	a2,0
    9888:	1af00593          	li	a1,431
    988c:	00006517          	auipc	a0,0x6
    9890:	a9850513          	add	a0,a0,-1384 # f324 <__fini_array_end+0x2ac>
    9894:	0a5010ef          	jal	b138 <__assert_func>
    9898:	02042e23          	sw	zero,60(s0)
    989c:	00000593          	li	a1,0
    98a0:	cc1fe06f          	j	8560 <_dtoa_r+0x338>
    98a4:	02012423          	sw	zero,40(sp)
    98a8:	c7dfe06f          	j	8524 <_dtoa_r+0x2fc>

000098ac <__ascii_mbtowc>:
    98ac:	02058063          	beqz	a1,98cc <__ascii_mbtowc+0x20>
    98b0:	04060263          	beqz	a2,98f4 <__ascii_mbtowc+0x48>
    98b4:	04068863          	beqz	a3,9904 <__ascii_mbtowc+0x58>
    98b8:	00064783          	lbu	a5,0(a2)
    98bc:	00f5a023          	sw	a5,0(a1)
    98c0:	00064503          	lbu	a0,0(a2)
    98c4:	00a03533          	snez	a0,a0
    98c8:	00008067          	ret
    98cc:	ff010113          	add	sp,sp,-16
    98d0:	00c10593          	add	a1,sp,12
    98d4:	02060463          	beqz	a2,98fc <__ascii_mbtowc+0x50>
    98d8:	02068a63          	beqz	a3,990c <__ascii_mbtowc+0x60>
    98dc:	00064783          	lbu	a5,0(a2)
    98e0:	00f5a023          	sw	a5,0(a1)
    98e4:	00064503          	lbu	a0,0(a2)
    98e8:	00a03533          	snez	a0,a0
    98ec:	01010113          	add	sp,sp,16
    98f0:	00008067          	ret
    98f4:	00000513          	li	a0,0
    98f8:	00008067          	ret
    98fc:	00000513          	li	a0,0
    9900:	fedff06f          	j	98ec <__ascii_mbtowc+0x40>
    9904:	ffe00513          	li	a0,-2
    9908:	00008067          	ret
    990c:	ffe00513          	li	a0,-2
    9910:	fddff06f          	j	98ec <__ascii_mbtowc+0x40>

00009914 <_Balloc>:
    9914:	04452783          	lw	a5,68(a0)
    9918:	ff010113          	add	sp,sp,-16
    991c:	00812423          	sw	s0,8(sp)
    9920:	00912223          	sw	s1,4(sp)
    9924:	00112623          	sw	ra,12(sp)
    9928:	00050413          	mv	s0,a0
    992c:	00058493          	mv	s1,a1
    9930:	02078c63          	beqz	a5,9968 <_Balloc+0x54>
    9934:	00249713          	sll	a4,s1,0x2
    9938:	00e787b3          	add	a5,a5,a4
    993c:	0007a503          	lw	a0,0(a5)
    9940:	04050463          	beqz	a0,9988 <_Balloc+0x74>
    9944:	00052703          	lw	a4,0(a0)
    9948:	00e7a023          	sw	a4,0(a5)
    994c:	00052823          	sw	zero,16(a0)
    9950:	00052623          	sw	zero,12(a0)
    9954:	00c12083          	lw	ra,12(sp)
    9958:	00812403          	lw	s0,8(sp)
    995c:	00412483          	lw	s1,4(sp)
    9960:	01010113          	add	sp,sp,16
    9964:	00008067          	ret
    9968:	02100613          	li	a2,33
    996c:	00400593          	li	a1,4
    9970:	021010ef          	jal	b190 <_calloc_r>
    9974:	04a42223          	sw	a0,68(s0)
    9978:	00050793          	mv	a5,a0
    997c:	fa051ce3          	bnez	a0,9934 <_Balloc+0x20>
    9980:	00000513          	li	a0,0
    9984:	fd1ff06f          	j	9954 <_Balloc+0x40>
    9988:	01212023          	sw	s2,0(sp)
    998c:	00100913          	li	s2,1
    9990:	00991933          	sll	s2,s2,s1
    9994:	00590613          	add	a2,s2,5
    9998:	00261613          	sll	a2,a2,0x2
    999c:	00100593          	li	a1,1
    99a0:	00040513          	mv	a0,s0
    99a4:	7ec010ef          	jal	b190 <_calloc_r>
    99a8:	00050a63          	beqz	a0,99bc <_Balloc+0xa8>
    99ac:	01252423          	sw	s2,8(a0)
    99b0:	00952223          	sw	s1,4(a0)
    99b4:	00012903          	lw	s2,0(sp)
    99b8:	f95ff06f          	j	994c <_Balloc+0x38>
    99bc:	00012903          	lw	s2,0(sp)
    99c0:	00000513          	li	a0,0
    99c4:	f91ff06f          	j	9954 <_Balloc+0x40>

000099c8 <_Bfree>:
    99c8:	02058063          	beqz	a1,99e8 <_Bfree+0x20>
    99cc:	0045a703          	lw	a4,4(a1)
    99d0:	04452783          	lw	a5,68(a0)
    99d4:	00271713          	sll	a4,a4,0x2
    99d8:	00e787b3          	add	a5,a5,a4
    99dc:	0007a703          	lw	a4,0(a5)
    99e0:	00e5a023          	sw	a4,0(a1)
    99e4:	00b7a023          	sw	a1,0(a5)
    99e8:	00008067          	ret

000099ec <__multadd>:
    99ec:	fd010113          	add	sp,sp,-48
    99f0:	01412c23          	sw	s4,24(sp)
    99f4:	0105aa03          	lw	s4,16(a1)
    99f8:	01912223          	sw	s9,4(sp)
    99fc:	00010cb7          	lui	s9,0x10
    9a00:	02912223          	sw	s1,36(sp)
    9a04:	03212023          	sw	s2,32(sp)
    9a08:	01312e23          	sw	s3,28(sp)
    9a0c:	01512a23          	sw	s5,20(sp)
    9a10:	01612823          	sw	s6,16(sp)
    9a14:	01712623          	sw	s7,12(sp)
    9a18:	02112623          	sw	ra,44(sp)
    9a1c:	02812423          	sw	s0,40(sp)
    9a20:	01812423          	sw	s8,8(sp)
    9a24:	00058a93          	mv	s5,a1
    9a28:	00050b13          	mv	s6,a0
    9a2c:	00060993          	mv	s3,a2
    9a30:	00068493          	mv	s1,a3
    9a34:	01458913          	add	s2,a1,20
    9a38:	00000b93          	li	s7,0
    9a3c:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    9a40:	00092c03          	lw	s8,0(s2)
    9a44:	00098593          	mv	a1,s3
    9a48:	00490913          	add	s2,s2,4
    9a4c:	019c7533          	and	a0,s8,s9
    9a50:	430050ef          	jal	ee80 <__mulsi3>
    9a54:	00050413          	mv	s0,a0
    9a58:	00098593          	mv	a1,s3
    9a5c:	010c5513          	srl	a0,s8,0x10
    9a60:	00940433          	add	s0,s0,s1
    9a64:	41c050ef          	jal	ee80 <__mulsi3>
    9a68:	01045793          	srl	a5,s0,0x10
    9a6c:	00f50533          	add	a0,a0,a5
    9a70:	01051793          	sll	a5,a0,0x10
    9a74:	01947433          	and	s0,s0,s9
    9a78:	008787b3          	add	a5,a5,s0
    9a7c:	fef92e23          	sw	a5,-4(s2)
    9a80:	001b8b93          	add	s7,s7,1
    9a84:	01055493          	srl	s1,a0,0x10
    9a88:	fb4bcce3          	blt	s7,s4,9a40 <__multadd+0x54>
    9a8c:	02048263          	beqz	s1,9ab0 <__multadd+0xc4>
    9a90:	008aa783          	lw	a5,8(s5)
    9a94:	04fa5a63          	bge	s4,a5,9ae8 <__multadd+0xfc>
    9a98:	004a0793          	add	a5,s4,4
    9a9c:	00279793          	sll	a5,a5,0x2
    9aa0:	00fa87b3          	add	a5,s5,a5
    9aa4:	0097a223          	sw	s1,4(a5)
    9aa8:	001a0a13          	add	s4,s4,1
    9aac:	014aa823          	sw	s4,16(s5)
    9ab0:	02c12083          	lw	ra,44(sp)
    9ab4:	02812403          	lw	s0,40(sp)
    9ab8:	02412483          	lw	s1,36(sp)
    9abc:	02012903          	lw	s2,32(sp)
    9ac0:	01c12983          	lw	s3,28(sp)
    9ac4:	01812a03          	lw	s4,24(sp)
    9ac8:	01012b03          	lw	s6,16(sp)
    9acc:	00c12b83          	lw	s7,12(sp)
    9ad0:	00812c03          	lw	s8,8(sp)
    9ad4:	00412c83          	lw	s9,4(sp)
    9ad8:	000a8513          	mv	a0,s5
    9adc:	01412a83          	lw	s5,20(sp)
    9ae0:	03010113          	add	sp,sp,48
    9ae4:	00008067          	ret
    9ae8:	004aa583          	lw	a1,4(s5)
    9aec:	000b0513          	mv	a0,s6
    9af0:	00158593          	add	a1,a1,1
    9af4:	e21ff0ef          	jal	9914 <_Balloc>
    9af8:	00050413          	mv	s0,a0
    9afc:	04050c63          	beqz	a0,9b54 <__multadd+0x168>
    9b00:	010aa603          	lw	a2,16(s5)
    9b04:	00ca8593          	add	a1,s5,12
    9b08:	00c50513          	add	a0,a0,12
    9b0c:	00260613          	add	a2,a2,2
    9b10:	00261613          	sll	a2,a2,0x2
    9b14:	e9cf70ef          	jal	11b0 <memcpy>
    9b18:	004aa703          	lw	a4,4(s5)
    9b1c:	044b2783          	lw	a5,68(s6)
    9b20:	00271713          	sll	a4,a4,0x2
    9b24:	00e787b3          	add	a5,a5,a4
    9b28:	0007a703          	lw	a4,0(a5)
    9b2c:	00eaa023          	sw	a4,0(s5)
    9b30:	0157a023          	sw	s5,0(a5)
    9b34:	004a0793          	add	a5,s4,4
    9b38:	00040a93          	mv	s5,s0
    9b3c:	00279793          	sll	a5,a5,0x2
    9b40:	00fa87b3          	add	a5,s5,a5
    9b44:	0097a223          	sw	s1,4(a5)
    9b48:	001a0a13          	add	s4,s4,1
    9b4c:	014aa823          	sw	s4,16(s5)
    9b50:	f61ff06f          	j	9ab0 <__multadd+0xc4>
    9b54:	00005697          	auipc	a3,0x5
    9b58:	7bc68693          	add	a3,a3,1980 # f310 <__fini_array_end+0x298>
    9b5c:	00000613          	li	a2,0
    9b60:	0ba00593          	li	a1,186
    9b64:	00006517          	auipc	a0,0x6
    9b68:	84050513          	add	a0,a0,-1984 # f3a4 <__fini_array_end+0x32c>
    9b6c:	5cc010ef          	jal	b138 <__assert_func>

00009b70 <__hi0bits>:
    9b70:	00050793          	mv	a5,a0
    9b74:	00010737          	lui	a4,0x10
    9b78:	00000513          	li	a0,0
    9b7c:	00e7f663          	bgeu	a5,a4,9b88 <__hi0bits+0x18>
    9b80:	01079793          	sll	a5,a5,0x10
    9b84:	01000513          	li	a0,16
    9b88:	01000737          	lui	a4,0x1000
    9b8c:	00e7f663          	bgeu	a5,a4,9b98 <__hi0bits+0x28>
    9b90:	00850513          	add	a0,a0,8
    9b94:	00879793          	sll	a5,a5,0x8
    9b98:	10000737          	lui	a4,0x10000
    9b9c:	00e7f663          	bgeu	a5,a4,9ba8 <__hi0bits+0x38>
    9ba0:	00450513          	add	a0,a0,4
    9ba4:	00479793          	sll	a5,a5,0x4
    9ba8:	40000737          	lui	a4,0x40000
    9bac:	00e7ea63          	bltu	a5,a4,9bc0 <__hi0bits+0x50>
    9bb0:	fff7c793          	not	a5,a5
    9bb4:	01f7d793          	srl	a5,a5,0x1f
    9bb8:	00f50533          	add	a0,a0,a5
    9bbc:	00008067          	ret
    9bc0:	00279793          	sll	a5,a5,0x2
    9bc4:	0007ca63          	bltz	a5,9bd8 <__hi0bits+0x68>
    9bc8:	00179713          	sll	a4,a5,0x1
    9bcc:	00074a63          	bltz	a4,9be0 <__hi0bits+0x70>
    9bd0:	02000513          	li	a0,32
    9bd4:	00008067          	ret
    9bd8:	00250513          	add	a0,a0,2
    9bdc:	00008067          	ret
    9be0:	00350513          	add	a0,a0,3
    9be4:	00008067          	ret

00009be8 <__lo0bits>:
    9be8:	00052783          	lw	a5,0(a0)
    9bec:	00050713          	mv	a4,a0
    9bf0:	0077f693          	and	a3,a5,7
    9bf4:	02068463          	beqz	a3,9c1c <__lo0bits+0x34>
    9bf8:	0017f693          	and	a3,a5,1
    9bfc:	00000513          	li	a0,0
    9c00:	04069e63          	bnez	a3,9c5c <__lo0bits+0x74>
    9c04:	0027f693          	and	a3,a5,2
    9c08:	0a068863          	beqz	a3,9cb8 <__lo0bits+0xd0>
    9c0c:	0017d793          	srl	a5,a5,0x1
    9c10:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9c14:	00100513          	li	a0,1
    9c18:	00008067          	ret
    9c1c:	01079693          	sll	a3,a5,0x10
    9c20:	0106d693          	srl	a3,a3,0x10
    9c24:	00000513          	li	a0,0
    9c28:	06068e63          	beqz	a3,9ca4 <__lo0bits+0xbc>
    9c2c:	0ff7f693          	zext.b	a3,a5
    9c30:	06068063          	beqz	a3,9c90 <__lo0bits+0xa8>
    9c34:	00f7f693          	and	a3,a5,15
    9c38:	04068263          	beqz	a3,9c7c <__lo0bits+0x94>
    9c3c:	0037f693          	and	a3,a5,3
    9c40:	02068463          	beqz	a3,9c68 <__lo0bits+0x80>
    9c44:	0017f693          	and	a3,a5,1
    9c48:	00069c63          	bnez	a3,9c60 <__lo0bits+0x78>
    9c4c:	0017d793          	srl	a5,a5,0x1
    9c50:	00150513          	add	a0,a0,1
    9c54:	00079663          	bnez	a5,9c60 <__lo0bits+0x78>
    9c58:	02000513          	li	a0,32
    9c5c:	00008067          	ret
    9c60:	00f72023          	sw	a5,0(a4)
    9c64:	00008067          	ret
    9c68:	0027d793          	srl	a5,a5,0x2
    9c6c:	0017f693          	and	a3,a5,1
    9c70:	00250513          	add	a0,a0,2
    9c74:	fe0696e3          	bnez	a3,9c60 <__lo0bits+0x78>
    9c78:	fd5ff06f          	j	9c4c <__lo0bits+0x64>
    9c7c:	0047d793          	srl	a5,a5,0x4
    9c80:	0037f693          	and	a3,a5,3
    9c84:	00450513          	add	a0,a0,4
    9c88:	fa069ee3          	bnez	a3,9c44 <__lo0bits+0x5c>
    9c8c:	fddff06f          	j	9c68 <__lo0bits+0x80>
    9c90:	0087d793          	srl	a5,a5,0x8
    9c94:	00f7f693          	and	a3,a5,15
    9c98:	00850513          	add	a0,a0,8
    9c9c:	fa0690e3          	bnez	a3,9c3c <__lo0bits+0x54>
    9ca0:	fddff06f          	j	9c7c <__lo0bits+0x94>
    9ca4:	0107d793          	srl	a5,a5,0x10
    9ca8:	0ff7f693          	zext.b	a3,a5
    9cac:	01000513          	li	a0,16
    9cb0:	f80692e3          	bnez	a3,9c34 <__lo0bits+0x4c>
    9cb4:	fddff06f          	j	9c90 <__lo0bits+0xa8>
    9cb8:	0027d793          	srl	a5,a5,0x2
    9cbc:	00f72023          	sw	a5,0(a4)
    9cc0:	00200513          	li	a0,2
    9cc4:	00008067          	ret

00009cc8 <__i2b>:
    9cc8:	04452783          	lw	a5,68(a0)
    9ccc:	ff010113          	add	sp,sp,-16
    9cd0:	00812423          	sw	s0,8(sp)
    9cd4:	00912223          	sw	s1,4(sp)
    9cd8:	00112623          	sw	ra,12(sp)
    9cdc:	00050413          	mv	s0,a0
    9ce0:	00058493          	mv	s1,a1
    9ce4:	02078c63          	beqz	a5,9d1c <__i2b+0x54>
    9ce8:	0047a503          	lw	a0,4(a5)
    9cec:	06050263          	beqz	a0,9d50 <__i2b+0x88>
    9cf0:	00052703          	lw	a4,0(a0)
    9cf4:	00e7a223          	sw	a4,4(a5)
    9cf8:	00c12083          	lw	ra,12(sp)
    9cfc:	00812403          	lw	s0,8(sp)
    9d00:	00100793          	li	a5,1
    9d04:	00952a23          	sw	s1,20(a0)
    9d08:	00052623          	sw	zero,12(a0)
    9d0c:	00f52823          	sw	a5,16(a0)
    9d10:	00412483          	lw	s1,4(sp)
    9d14:	01010113          	add	sp,sp,16
    9d18:	00008067          	ret
    9d1c:	02100613          	li	a2,33
    9d20:	00400593          	li	a1,4
    9d24:	46c010ef          	jal	b190 <_calloc_r>
    9d28:	04a42223          	sw	a0,68(s0)
    9d2c:	00050793          	mv	a5,a0
    9d30:	fa051ce3          	bnez	a0,9ce8 <__i2b+0x20>
    9d34:	00005697          	auipc	a3,0x5
    9d38:	5dc68693          	add	a3,a3,1500 # f310 <__fini_array_end+0x298>
    9d3c:	00000613          	li	a2,0
    9d40:	14500593          	li	a1,325
    9d44:	00005517          	auipc	a0,0x5
    9d48:	66050513          	add	a0,a0,1632 # f3a4 <__fini_array_end+0x32c>
    9d4c:	3ec010ef          	jal	b138 <__assert_func>
    9d50:	01c00613          	li	a2,28
    9d54:	00100593          	li	a1,1
    9d58:	00040513          	mv	a0,s0
    9d5c:	434010ef          	jal	b190 <_calloc_r>
    9d60:	fc050ae3          	beqz	a0,9d34 <__i2b+0x6c>
    9d64:	00100793          	li	a5,1
    9d68:	00f52223          	sw	a5,4(a0)
    9d6c:	00200793          	li	a5,2
    9d70:	00f52423          	sw	a5,8(a0)
    9d74:	f85ff06f          	j	9cf8 <__i2b+0x30>

00009d78 <__multiply>:
    9d78:	fb010113          	add	sp,sp,-80
    9d7c:	03312e23          	sw	s3,60(sp)
    9d80:	03812423          	sw	s8,40(sp)
    9d84:	01062983          	lw	s3,16(a2)
    9d88:	0105ac03          	lw	s8,16(a1)
    9d8c:	04812423          	sw	s0,72(sp)
    9d90:	03412c23          	sw	s4,56(sp)
    9d94:	04112623          	sw	ra,76(sp)
    9d98:	03712623          	sw	s7,44(sp)
    9d9c:	00058a13          	mv	s4,a1
    9da0:	00060413          	mv	s0,a2
    9da4:	013c4c63          	blt	s8,s3,9dbc <__multiply+0x44>
    9da8:	00098713          	mv	a4,s3
    9dac:	00058413          	mv	s0,a1
    9db0:	000c0993          	mv	s3,s8
    9db4:	00060a13          	mv	s4,a2
    9db8:	00070c13          	mv	s8,a4
    9dbc:	00842783          	lw	a5,8(s0)
    9dc0:	00442583          	lw	a1,4(s0)
    9dc4:	01898bb3          	add	s7,s3,s8
    9dc8:	0177a7b3          	slt	a5,a5,s7
    9dcc:	00f585b3          	add	a1,a1,a5
    9dd0:	b45ff0ef          	jal	9914 <_Balloc>
    9dd4:	00a12623          	sw	a0,12(sp)
    9dd8:	22050863          	beqz	a0,a008 <__multiply+0x290>
    9ddc:	00c12783          	lw	a5,12(sp)
    9de0:	03512a23          	sw	s5,52(sp)
    9de4:	03612823          	sw	s6,48(sp)
    9de8:	002b9a93          	sll	s5,s7,0x2
    9dec:	01478b13          	add	s6,a5,20
    9df0:	015b0ab3          	add	s5,s6,s5
    9df4:	000b0793          	mv	a5,s6
    9df8:	015b7863          	bgeu	s6,s5,9e08 <__multiply+0x90>
    9dfc:	0007a023          	sw	zero,0(a5)
    9e00:	00478793          	add	a5,a5,4
    9e04:	ff57ece3          	bltu	a5,s5,9dfc <__multiply+0x84>
    9e08:	014a0a13          	add	s4,s4,20
    9e0c:	002c1c13          	sll	s8,s8,0x2
    9e10:	01440793          	add	a5,s0,20
    9e14:	018a0733          	add	a4,s4,s8
    9e18:	00299993          	sll	s3,s3,0x2
    9e1c:	00f12423          	sw	a5,8(sp)
    9e20:	00e12023          	sw	a4,0(sp)
    9e24:	013789b3          	add	s3,a5,s3
    9e28:	16ea7c63          	bgeu	s4,a4,9fa0 <__multiply+0x228>
    9e2c:	00400713          	li	a4,4
    9e30:	04912223          	sw	s1,68(sp)
    9e34:	05212023          	sw	s2,64(sp)
    9e38:	03912223          	sw	s9,36(sp)
    9e3c:	03a12023          	sw	s10,32(sp)
    9e40:	01b12e23          	sw	s11,28(sp)
    9e44:	01540793          	add	a5,s0,21
    9e48:	00e12223          	sw	a4,4(sp)
    9e4c:	1af9f263          	bgeu	s3,a5,9ff0 <__multiply+0x278>
    9e50:	00010437          	lui	s0,0x10
    9e54:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    9e58:	01c0006f          	j	9e74 <__multiply+0xfc>
    9e5c:	01095913          	srl	s2,s2,0x10
    9e60:	0a091063          	bnez	s2,9f00 <__multiply+0x188>
    9e64:	00012783          	lw	a5,0(sp)
    9e68:	004a0a13          	add	s4,s4,4
    9e6c:	004b0b13          	add	s6,s6,4
    9e70:	10fa7e63          	bgeu	s4,a5,9f8c <__multiply+0x214>
    9e74:	000a2903          	lw	s2,0(s4)
    9e78:	008974b3          	and	s1,s2,s0
    9e7c:	fe0480e3          	beqz	s1,9e5c <__multiply+0xe4>
    9e80:	00812c83          	lw	s9,8(sp)
    9e84:	000b0d13          	mv	s10,s6
    9e88:	00000c13          	li	s8,0
    9e8c:	000cad83          	lw	s11,0(s9)
    9e90:	000d2903          	lw	s2,0(s10)
    9e94:	00048593          	mv	a1,s1
    9e98:	008df533          	and	a0,s11,s0
    9e9c:	7e5040ef          	jal	ee80 <__mulsi3>
    9ea0:	00897733          	and	a4,s2,s0
    9ea4:	00e50733          	add	a4,a0,a4
    9ea8:	00048593          	mv	a1,s1
    9eac:	010dd513          	srl	a0,s11,0x10
    9eb0:	01870c33          	add	s8,a4,s8
    9eb4:	01095913          	srl	s2,s2,0x10
    9eb8:	7c9040ef          	jal	ee80 <__mulsi3>
    9ebc:	010c5713          	srl	a4,s8,0x10
    9ec0:	01250533          	add	a0,a0,s2
    9ec4:	00e50533          	add	a0,a0,a4
    9ec8:	008c77b3          	and	a5,s8,s0
    9ecc:	01051713          	sll	a4,a0,0x10
    9ed0:	004d0d13          	add	s10,s10,4
    9ed4:	00f767b3          	or	a5,a4,a5
    9ed8:	004c8c93          	add	s9,s9,4
    9edc:	fefd2e23          	sw	a5,-4(s10)
    9ee0:	01055c13          	srl	s8,a0,0x10
    9ee4:	fb3ce4e3          	bltu	s9,s3,9e8c <__multiply+0x114>
    9ee8:	00412783          	lw	a5,4(sp)
    9eec:	00fb0733          	add	a4,s6,a5
    9ef0:	01872023          	sw	s8,0(a4)
    9ef4:	000a2903          	lw	s2,0(s4)
    9ef8:	01095913          	srl	s2,s2,0x10
    9efc:	f60904e3          	beqz	s2,9e64 <__multiply+0xec>
    9f00:	000b2c83          	lw	s9,0(s6)
    9f04:	00812d03          	lw	s10,8(sp)
    9f08:	000b0c13          	mv	s8,s6
    9f0c:	000c8493          	mv	s1,s9
    9f10:	00000d93          	li	s11,0
    9f14:	000d2503          	lw	a0,0(s10)
    9f18:	00090593          	mv	a1,s2
    9f1c:	0104d493          	srl	s1,s1,0x10
    9f20:	00857533          	and	a0,a0,s0
    9f24:	75d040ef          	jal	ee80 <__mulsi3>
    9f28:	01b50733          	add	a4,a0,s11
    9f2c:	00970db3          	add	s11,a4,s1
    9f30:	010d9593          	sll	a1,s11,0x10
    9f34:	008cf7b3          	and	a5,s9,s0
    9f38:	00f5e7b3          	or	a5,a1,a5
    9f3c:	00fc2023          	sw	a5,0(s8)
    9f40:	002d5503          	lhu	a0,2(s10)
    9f44:	004c2483          	lw	s1,4(s8)
    9f48:	00090593          	mv	a1,s2
    9f4c:	735040ef          	jal	ee80 <__mulsi3>
    9f50:	0084f7b3          	and	a5,s1,s0
    9f54:	010dd713          	srl	a4,s11,0x10
    9f58:	00f507b3          	add	a5,a0,a5
    9f5c:	004d0d13          	add	s10,s10,4
    9f60:	00e78cb3          	add	s9,a5,a4
    9f64:	004c0c13          	add	s8,s8,4
    9f68:	010cdd93          	srl	s11,s9,0x10
    9f6c:	fb3d64e3          	bltu	s10,s3,9f14 <__multiply+0x19c>
    9f70:	00412783          	lw	a5,4(sp)
    9f74:	004a0a13          	add	s4,s4,4
    9f78:	00fb0733          	add	a4,s6,a5
    9f7c:	00012783          	lw	a5,0(sp)
    9f80:	01972023          	sw	s9,0(a4)
    9f84:	004b0b13          	add	s6,s6,4
    9f88:	eefa66e3          	bltu	s4,a5,9e74 <__multiply+0xfc>
    9f8c:	04412483          	lw	s1,68(sp)
    9f90:	04012903          	lw	s2,64(sp)
    9f94:	02412c83          	lw	s9,36(sp)
    9f98:	02012d03          	lw	s10,32(sp)
    9f9c:	01c12d83          	lw	s11,28(sp)
    9fa0:	01704863          	bgtz	s7,9fb0 <__multiply+0x238>
    9fa4:	0180006f          	j	9fbc <__multiply+0x244>
    9fa8:	fffb8b93          	add	s7,s7,-1
    9fac:	000b8863          	beqz	s7,9fbc <__multiply+0x244>
    9fb0:	ffcaa783          	lw	a5,-4(s5)
    9fb4:	ffca8a93          	add	s5,s5,-4
    9fb8:	fe0788e3          	beqz	a5,9fa8 <__multiply+0x230>
    9fbc:	00c12783          	lw	a5,12(sp)
    9fc0:	04c12083          	lw	ra,76(sp)
    9fc4:	04812403          	lw	s0,72(sp)
    9fc8:	0177a823          	sw	s7,16(a5)
    9fcc:	03412a83          	lw	s5,52(sp)
    9fd0:	03012b03          	lw	s6,48(sp)
    9fd4:	03c12983          	lw	s3,60(sp)
    9fd8:	03812a03          	lw	s4,56(sp)
    9fdc:	02c12b83          	lw	s7,44(sp)
    9fe0:	02812c03          	lw	s8,40(sp)
    9fe4:	00078513          	mv	a0,a5
    9fe8:	05010113          	add	sp,sp,80
    9fec:	00008067          	ret
    9ff0:	408987b3          	sub	a5,s3,s0
    9ff4:	feb78793          	add	a5,a5,-21
    9ff8:	ffc7f793          	and	a5,a5,-4
    9ffc:	00478793          	add	a5,a5,4
    a000:	00f12223          	sw	a5,4(sp)
    a004:	e4dff06f          	j	9e50 <__multiply+0xd8>
    a008:	00005697          	auipc	a3,0x5
    a00c:	30868693          	add	a3,a3,776 # f310 <__fini_array_end+0x298>
    a010:	00000613          	li	a2,0
    a014:	16200593          	li	a1,354
    a018:	00005517          	auipc	a0,0x5
    a01c:	38c50513          	add	a0,a0,908 # f3a4 <__fini_array_end+0x32c>
    a020:	04912223          	sw	s1,68(sp)
    a024:	05212023          	sw	s2,64(sp)
    a028:	03512a23          	sw	s5,52(sp)
    a02c:	03612823          	sw	s6,48(sp)
    a030:	03912223          	sw	s9,36(sp)
    a034:	03a12023          	sw	s10,32(sp)
    a038:	01b12e23          	sw	s11,28(sp)
    a03c:	0fc010ef          	jal	b138 <__assert_func>

0000a040 <__pow5mult>:
    a040:	fe010113          	add	sp,sp,-32
    a044:	00812c23          	sw	s0,24(sp)
    a048:	01212823          	sw	s2,16(sp)
    a04c:	01312623          	sw	s3,12(sp)
    a050:	00112e23          	sw	ra,28(sp)
    a054:	00367793          	and	a5,a2,3
    a058:	00060413          	mv	s0,a2
    a05c:	00050993          	mv	s3,a0
    a060:	00058913          	mv	s2,a1
    a064:	0a079c63          	bnez	a5,a11c <__pow5mult+0xdc>
    a068:	40245413          	sra	s0,s0,0x2
    a06c:	06040a63          	beqz	s0,a0e0 <__pow5mult+0xa0>
    a070:	00912a23          	sw	s1,20(sp)
    a074:	0409a483          	lw	s1,64(s3)
    a078:	0c048663          	beqz	s1,a144 <__pow5mult+0x104>
    a07c:	00147793          	and	a5,s0,1
    a080:	02079063          	bnez	a5,a0a0 <__pow5mult+0x60>
    a084:	40145413          	sra	s0,s0,0x1
    a088:	04040a63          	beqz	s0,a0dc <__pow5mult+0x9c>
    a08c:	0004a503          	lw	a0,0(s1)
    a090:	06050663          	beqz	a0,a0fc <__pow5mult+0xbc>
    a094:	00050493          	mv	s1,a0
    a098:	00147793          	and	a5,s0,1
    a09c:	fe0784e3          	beqz	a5,a084 <__pow5mult+0x44>
    a0a0:	00048613          	mv	a2,s1
    a0a4:	00090593          	mv	a1,s2
    a0a8:	00098513          	mv	a0,s3
    a0ac:	ccdff0ef          	jal	9d78 <__multiply>
    a0b0:	02090063          	beqz	s2,a0d0 <__pow5mult+0x90>
    a0b4:	00492703          	lw	a4,4(s2)
    a0b8:	0449a783          	lw	a5,68(s3)
    a0bc:	00271713          	sll	a4,a4,0x2
    a0c0:	00e787b3          	add	a5,a5,a4
    a0c4:	0007a703          	lw	a4,0(a5)
    a0c8:	00e92023          	sw	a4,0(s2)
    a0cc:	0127a023          	sw	s2,0(a5)
    a0d0:	40145413          	sra	s0,s0,0x1
    a0d4:	00050913          	mv	s2,a0
    a0d8:	fa041ae3          	bnez	s0,a08c <__pow5mult+0x4c>
    a0dc:	01412483          	lw	s1,20(sp)
    a0e0:	01c12083          	lw	ra,28(sp)
    a0e4:	01812403          	lw	s0,24(sp)
    a0e8:	00c12983          	lw	s3,12(sp)
    a0ec:	00090513          	mv	a0,s2
    a0f0:	01012903          	lw	s2,16(sp)
    a0f4:	02010113          	add	sp,sp,32
    a0f8:	00008067          	ret
    a0fc:	00048613          	mv	a2,s1
    a100:	00048593          	mv	a1,s1
    a104:	00098513          	mv	a0,s3
    a108:	c71ff0ef          	jal	9d78 <__multiply>
    a10c:	00a4a023          	sw	a0,0(s1)
    a110:	00052023          	sw	zero,0(a0)
    a114:	00050493          	mv	s1,a0
    a118:	f81ff06f          	j	a098 <__pow5mult+0x58>
    a11c:	fff78793          	add	a5,a5,-1
    a120:	00005717          	auipc	a4,0x5
    a124:	7f870713          	add	a4,a4,2040 # f918 <p05.0>
    a128:	00279793          	sll	a5,a5,0x2
    a12c:	00f707b3          	add	a5,a4,a5
    a130:	0007a603          	lw	a2,0(a5)
    a134:	00000693          	li	a3,0
    a138:	8b5ff0ef          	jal	99ec <__multadd>
    a13c:	00050913          	mv	s2,a0
    a140:	f29ff06f          	j	a068 <__pow5mult+0x28>
    a144:	00100593          	li	a1,1
    a148:	00098513          	mv	a0,s3
    a14c:	fc8ff0ef          	jal	9914 <_Balloc>
    a150:	00050493          	mv	s1,a0
    a154:	02050063          	beqz	a0,a174 <__pow5mult+0x134>
    a158:	27100793          	li	a5,625
    a15c:	00f52a23          	sw	a5,20(a0)
    a160:	00100793          	li	a5,1
    a164:	00f52823          	sw	a5,16(a0)
    a168:	04a9a023          	sw	a0,64(s3)
    a16c:	00052023          	sw	zero,0(a0)
    a170:	f0dff06f          	j	a07c <__pow5mult+0x3c>
    a174:	00005697          	auipc	a3,0x5
    a178:	19c68693          	add	a3,a3,412 # f310 <__fini_array_end+0x298>
    a17c:	00000613          	li	a2,0
    a180:	14500593          	li	a1,325
    a184:	00005517          	auipc	a0,0x5
    a188:	22050513          	add	a0,a0,544 # f3a4 <__fini_array_end+0x32c>
    a18c:	7ad000ef          	jal	b138 <__assert_func>

0000a190 <__lshift>:
    a190:	fe010113          	add	sp,sp,-32
    a194:	01512223          	sw	s5,4(sp)
    a198:	0105aa83          	lw	s5,16(a1)
    a19c:	0085a783          	lw	a5,8(a1)
    a1a0:	01312623          	sw	s3,12(sp)
    a1a4:	40565993          	sra	s3,a2,0x5
    a1a8:	01598ab3          	add	s5,s3,s5
    a1ac:	00812c23          	sw	s0,24(sp)
    a1b0:	00912a23          	sw	s1,20(sp)
    a1b4:	01212823          	sw	s2,16(sp)
    a1b8:	01412423          	sw	s4,8(sp)
    a1bc:	00112e23          	sw	ra,28(sp)
    a1c0:	001a8913          	add	s2,s5,1
    a1c4:	00058493          	mv	s1,a1
    a1c8:	00060413          	mv	s0,a2
    a1cc:	0045a583          	lw	a1,4(a1)
    a1d0:	00050a13          	mv	s4,a0
    a1d4:	0127d863          	bge	a5,s2,a1e4 <__lshift+0x54>
    a1d8:	00179793          	sll	a5,a5,0x1
    a1dc:	00158593          	add	a1,a1,1
    a1e0:	ff27cce3          	blt	a5,s2,a1d8 <__lshift+0x48>
    a1e4:	000a0513          	mv	a0,s4
    a1e8:	f2cff0ef          	jal	9914 <_Balloc>
    a1ec:	10050c63          	beqz	a0,a304 <__lshift+0x174>
    a1f0:	01450813          	add	a6,a0,20
    a1f4:	03305463          	blez	s3,a21c <__lshift+0x8c>
    a1f8:	00598993          	add	s3,s3,5
    a1fc:	00299993          	sll	s3,s3,0x2
    a200:	01350733          	add	a4,a0,s3
    a204:	00080793          	mv	a5,a6
    a208:	00478793          	add	a5,a5,4
    a20c:	fe07ae23          	sw	zero,-4(a5)
    a210:	fee79ce3          	bne	a5,a4,a208 <__lshift+0x78>
    a214:	fec98993          	add	s3,s3,-20
    a218:	01380833          	add	a6,a6,s3
    a21c:	0104a883          	lw	a7,16(s1)
    a220:	01448793          	add	a5,s1,20
    a224:	01f47613          	and	a2,s0,31
    a228:	00289893          	sll	a7,a7,0x2
    a22c:	011788b3          	add	a7,a5,a7
    a230:	0a060463          	beqz	a2,a2d8 <__lshift+0x148>
    a234:	02000593          	li	a1,32
    a238:	40c585b3          	sub	a1,a1,a2
    a23c:	00080313          	mv	t1,a6
    a240:	00000693          	li	a3,0
    a244:	0007a703          	lw	a4,0(a5)
    a248:	00430313          	add	t1,t1,4
    a24c:	00478793          	add	a5,a5,4
    a250:	00c71733          	sll	a4,a4,a2
    a254:	00d76733          	or	a4,a4,a3
    a258:	fee32e23          	sw	a4,-4(t1)
    a25c:	ffc7a683          	lw	a3,-4(a5)
    a260:	00b6d6b3          	srl	a3,a3,a1
    a264:	ff17e0e3          	bltu	a5,a7,a244 <__lshift+0xb4>
    a268:	01548793          	add	a5,s1,21
    a26c:	00400713          	li	a4,4
    a270:	00f8ea63          	bltu	a7,a5,a284 <__lshift+0xf4>
    a274:	409887b3          	sub	a5,a7,s1
    a278:	feb78793          	add	a5,a5,-21
    a27c:	ffc7f793          	and	a5,a5,-4
    a280:	00478713          	add	a4,a5,4
    a284:	00e80833          	add	a6,a6,a4
    a288:	00d82023          	sw	a3,0(a6)
    a28c:	00069463          	bnez	a3,a294 <__lshift+0x104>
    a290:	000a8913          	mv	s2,s5
    a294:	0044a703          	lw	a4,4(s1)
    a298:	044a2783          	lw	a5,68(s4)
    a29c:	01c12083          	lw	ra,28(sp)
    a2a0:	00271713          	sll	a4,a4,0x2
    a2a4:	00e787b3          	add	a5,a5,a4
    a2a8:	0007a703          	lw	a4,0(a5)
    a2ac:	01252823          	sw	s2,16(a0)
    a2b0:	01812403          	lw	s0,24(sp)
    a2b4:	00e4a023          	sw	a4,0(s1)
    a2b8:	0097a023          	sw	s1,0(a5)
    a2bc:	01012903          	lw	s2,16(sp)
    a2c0:	01412483          	lw	s1,20(sp)
    a2c4:	00c12983          	lw	s3,12(sp)
    a2c8:	00812a03          	lw	s4,8(sp)
    a2cc:	00412a83          	lw	s5,4(sp)
    a2d0:	02010113          	add	sp,sp,32
    a2d4:	00008067          	ret
    a2d8:	0007a703          	lw	a4,0(a5)
    a2dc:	00478793          	add	a5,a5,4
    a2e0:	00480813          	add	a6,a6,4
    a2e4:	fee82e23          	sw	a4,-4(a6)
    a2e8:	fb17f4e3          	bgeu	a5,a7,a290 <__lshift+0x100>
    a2ec:	0007a703          	lw	a4,0(a5)
    a2f0:	00478793          	add	a5,a5,4
    a2f4:	00480813          	add	a6,a6,4
    a2f8:	fee82e23          	sw	a4,-4(a6)
    a2fc:	fd17eee3          	bltu	a5,a7,a2d8 <__lshift+0x148>
    a300:	f91ff06f          	j	a290 <__lshift+0x100>
    a304:	00005697          	auipc	a3,0x5
    a308:	00c68693          	add	a3,a3,12 # f310 <__fini_array_end+0x298>
    a30c:	00000613          	li	a2,0
    a310:	1de00593          	li	a1,478
    a314:	00005517          	auipc	a0,0x5
    a318:	09050513          	add	a0,a0,144 # f3a4 <__fini_array_end+0x32c>
    a31c:	61d000ef          	jal	b138 <__assert_func>

0000a320 <__mcmp>:
    a320:	01052703          	lw	a4,16(a0)
    a324:	0105a783          	lw	a5,16(a1)
    a328:	00050813          	mv	a6,a0
    a32c:	40f70533          	sub	a0,a4,a5
    a330:	04f71263          	bne	a4,a5,a374 <__mcmp+0x54>
    a334:	00279793          	sll	a5,a5,0x2
    a338:	01480813          	add	a6,a6,20
    a33c:	01458593          	add	a1,a1,20
    a340:	00f80733          	add	a4,a6,a5
    a344:	00f587b3          	add	a5,a1,a5
    a348:	0080006f          	j	a350 <__mcmp+0x30>
    a34c:	02e87463          	bgeu	a6,a4,a374 <__mcmp+0x54>
    a350:	ffc72603          	lw	a2,-4(a4)
    a354:	ffc7a683          	lw	a3,-4(a5)
    a358:	ffc70713          	add	a4,a4,-4
    a35c:	ffc78793          	add	a5,a5,-4
    a360:	fed606e3          	beq	a2,a3,a34c <__mcmp+0x2c>
    a364:	00100513          	li	a0,1
    a368:	00d67663          	bgeu	a2,a3,a374 <__mcmp+0x54>
    a36c:	fff00513          	li	a0,-1
    a370:	00008067          	ret
    a374:	00008067          	ret

0000a378 <__mdiff>:
    a378:	0105a703          	lw	a4,16(a1)
    a37c:	01062783          	lw	a5,16(a2)
    a380:	ff010113          	add	sp,sp,-16
    a384:	00812423          	sw	s0,8(sp)
    a388:	00912223          	sw	s1,4(sp)
    a38c:	00112623          	sw	ra,12(sp)
    a390:	01212023          	sw	s2,0(sp)
    a394:	00058413          	mv	s0,a1
    a398:	00060493          	mv	s1,a2
    a39c:	40f706b3          	sub	a3,a4,a5
    a3a0:	18f71e63          	bne	a4,a5,a53c <__mdiff+0x1c4>
    a3a4:	00279693          	sll	a3,a5,0x2
    a3a8:	01458613          	add	a2,a1,20
    a3ac:	01448713          	add	a4,s1,20
    a3b0:	00d607b3          	add	a5,a2,a3
    a3b4:	00d70733          	add	a4,a4,a3
    a3b8:	0080006f          	j	a3c0 <__mdiff+0x48>
    a3bc:	18f67c63          	bgeu	a2,a5,a554 <__mdiff+0x1dc>
    a3c0:	ffc7a583          	lw	a1,-4(a5)
    a3c4:	ffc72683          	lw	a3,-4(a4)
    a3c8:	ffc78793          	add	a5,a5,-4
    a3cc:	ffc70713          	add	a4,a4,-4
    a3d0:	fed586e3          	beq	a1,a3,a3bc <__mdiff+0x44>
    a3d4:	00100913          	li	s2,1
    a3d8:	00d5ea63          	bltu	a1,a3,a3ec <__mdiff+0x74>
    a3dc:	00048793          	mv	a5,s1
    a3e0:	00000913          	li	s2,0
    a3e4:	00040493          	mv	s1,s0
    a3e8:	00078413          	mv	s0,a5
    a3ec:	0044a583          	lw	a1,4(s1)
    a3f0:	d24ff0ef          	jal	9914 <_Balloc>
    a3f4:	1a050663          	beqz	a0,a5a0 <__mdiff+0x228>
    a3f8:	0104a883          	lw	a7,16(s1)
    a3fc:	01042283          	lw	t0,16(s0)
    a400:	01448f93          	add	t6,s1,20
    a404:	00289313          	sll	t1,a7,0x2
    a408:	01440813          	add	a6,s0,20
    a40c:	00229293          	sll	t0,t0,0x2
    a410:	01450593          	add	a1,a0,20
    a414:	00010e37          	lui	t3,0x10
    a418:	01252623          	sw	s2,12(a0)
    a41c:	006f8333          	add	t1,t6,t1
    a420:	005802b3          	add	t0,a6,t0
    a424:	00058f13          	mv	t5,a1
    a428:	000f8e93          	mv	t4,t6
    a42c:	00000693          	li	a3,0
    a430:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    a434:	000ea703          	lw	a4,0(t4)
    a438:	00082603          	lw	a2,0(a6)
    a43c:	004f0f13          	add	t5,t5,4
    a440:	01c777b3          	and	a5,a4,t3
    a444:	01c673b3          	and	t2,a2,t3
    a448:	407787b3          	sub	a5,a5,t2
    a44c:	00d787b3          	add	a5,a5,a3
    a450:	01075713          	srl	a4,a4,0x10
    a454:	01065613          	srl	a2,a2,0x10
    a458:	4107d693          	sra	a3,a5,0x10
    a45c:	40c70733          	sub	a4,a4,a2
    a460:	00d70733          	add	a4,a4,a3
    a464:	01071693          	sll	a3,a4,0x10
    a468:	01c7f7b3          	and	a5,a5,t3
    a46c:	00d7e7b3          	or	a5,a5,a3
    a470:	00480813          	add	a6,a6,4
    a474:	feff2e23          	sw	a5,-4(t5)
    a478:	004e8e93          	add	t4,t4,4
    a47c:	41075693          	sra	a3,a4,0x10
    a480:	fa586ae3          	bltu	a6,t0,a434 <__mdiff+0xbc>
    a484:	01540713          	add	a4,s0,21
    a488:	40828433          	sub	s0,t0,s0
    a48c:	feb40413          	add	s0,s0,-21
    a490:	00e2b2b3          	sltu	t0,t0,a4
    a494:	0012cf13          	xor	t5,t0,1
    a498:	00245413          	srl	s0,s0,0x2
    a49c:	00400713          	li	a4,4
    a4a0:	0a028463          	beqz	t0,a548 <__mdiff+0x1d0>
    a4a4:	00ef8fb3          	add	t6,t6,a4
    a4a8:	00e58833          	add	a6,a1,a4
    a4ac:	00010eb7          	lui	t4,0x10
    a4b0:	00080e13          	mv	t3,a6
    a4b4:	000f8613          	mv	a2,t6
    a4b8:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    a4bc:	0c6ff463          	bgeu	t6,t1,a584 <__mdiff+0x20c>
    a4c0:	00062783          	lw	a5,0(a2)
    a4c4:	004e0e13          	add	t3,t3,4
    a4c8:	00460613          	add	a2,a2,4
    a4cc:	01d7f733          	and	a4,a5,t4
    a4d0:	00d70733          	add	a4,a4,a3
    a4d4:	0107d593          	srl	a1,a5,0x10
    a4d8:	41075713          	sra	a4,a4,0x10
    a4dc:	00b70733          	add	a4,a4,a1
    a4e0:	00d787b3          	add	a5,a5,a3
    a4e4:	01d7f7b3          	and	a5,a5,t4
    a4e8:	01071693          	sll	a3,a4,0x10
    a4ec:	00d7e7b3          	or	a5,a5,a3
    a4f0:	fefe2e23          	sw	a5,-4(t3)
    a4f4:	41075693          	sra	a3,a4,0x10
    a4f8:	fc6664e3          	bltu	a2,t1,a4c0 <__mdiff+0x148>
    a4fc:	fff30313          	add	t1,t1,-1
    a500:	41f30333          	sub	t1,t1,t6
    a504:	ffc37313          	and	t1,t1,-4
    a508:	00680733          	add	a4,a6,t1
    a50c:	00079a63          	bnez	a5,a520 <__mdiff+0x1a8>
    a510:	ffc72783          	lw	a5,-4(a4)
    a514:	fff88893          	add	a7,a7,-1
    a518:	ffc70713          	add	a4,a4,-4
    a51c:	fe078ae3          	beqz	a5,a510 <__mdiff+0x198>
    a520:	00c12083          	lw	ra,12(sp)
    a524:	00812403          	lw	s0,8(sp)
    a528:	01152823          	sw	a7,16(a0)
    a52c:	00412483          	lw	s1,4(sp)
    a530:	00012903          	lw	s2,0(sp)
    a534:	01010113          	add	sp,sp,16
    a538:	00008067          	ret
    a53c:	00100913          	li	s2,1
    a540:	e806dee3          	bgez	a3,a3dc <__mdiff+0x64>
    a544:	ea9ff06f          	j	a3ec <__mdiff+0x74>
    a548:	00140713          	add	a4,s0,1
    a54c:	00271713          	sll	a4,a4,0x2
    a550:	f55ff06f          	j	a4a4 <__mdiff+0x12c>
    a554:	00000593          	li	a1,0
    a558:	bbcff0ef          	jal	9914 <_Balloc>
    a55c:	06050063          	beqz	a0,a5bc <__mdiff+0x244>
    a560:	00c12083          	lw	ra,12(sp)
    a564:	00812403          	lw	s0,8(sp)
    a568:	00100793          	li	a5,1
    a56c:	00f52823          	sw	a5,16(a0)
    a570:	00052a23          	sw	zero,20(a0)
    a574:	00412483          	lw	s1,4(sp)
    a578:	00012903          	lw	s2,0(sp)
    a57c:	01010113          	add	sp,sp,16
    a580:	00008067          	ret
    a584:	00000713          	li	a4,0
    a588:	000f1663          	bnez	t5,a594 <__mdiff+0x21c>
    a58c:	00e58733          	add	a4,a1,a4
    a590:	f7dff06f          	j	a50c <__mdiff+0x194>
    a594:	00241713          	sll	a4,s0,0x2
    a598:	00e58733          	add	a4,a1,a4
    a59c:	f71ff06f          	j	a50c <__mdiff+0x194>
    a5a0:	00005697          	auipc	a3,0x5
    a5a4:	d7068693          	add	a3,a3,-656 # f310 <__fini_array_end+0x298>
    a5a8:	00000613          	li	a2,0
    a5ac:	24500593          	li	a1,581
    a5b0:	00005517          	auipc	a0,0x5
    a5b4:	df450513          	add	a0,a0,-524 # f3a4 <__fini_array_end+0x32c>
    a5b8:	381000ef          	jal	b138 <__assert_func>
    a5bc:	00005697          	auipc	a3,0x5
    a5c0:	d5468693          	add	a3,a3,-684 # f310 <__fini_array_end+0x298>
    a5c4:	00000613          	li	a2,0
    a5c8:	23700593          	li	a1,567
    a5cc:	00005517          	auipc	a0,0x5
    a5d0:	dd850513          	add	a0,a0,-552 # f3a4 <__fini_array_end+0x32c>
    a5d4:	365000ef          	jal	b138 <__assert_func>

0000a5d8 <__d2b>:
    a5d8:	fd010113          	add	sp,sp,-48
    a5dc:	01512a23          	sw	s5,20(sp)
    a5e0:	00058a93          	mv	s5,a1
    a5e4:	00100593          	li	a1,1
    a5e8:	02912223          	sw	s1,36(sp)
    a5ec:	01312e23          	sw	s3,28(sp)
    a5f0:	01412c23          	sw	s4,24(sp)
    a5f4:	02112623          	sw	ra,44(sp)
    a5f8:	02812423          	sw	s0,40(sp)
    a5fc:	03212023          	sw	s2,32(sp)
    a600:	00060493          	mv	s1,a2
    a604:	00068a13          	mv	s4,a3
    a608:	00070993          	mv	s3,a4
    a60c:	b08ff0ef          	jal	9914 <_Balloc>
    a610:	10050263          	beqz	a0,a714 <__d2b+0x13c>
    a614:	00100737          	lui	a4,0x100
    a618:	0144d913          	srl	s2,s1,0x14
    a61c:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a620:	7ff97913          	and	s2,s2,2047
    a624:	00050413          	mv	s0,a0
    a628:	0097f7b3          	and	a5,a5,s1
    a62c:	00090463          	beqz	s2,a634 <__d2b+0x5c>
    a630:	00e7e7b3          	or	a5,a5,a4
    a634:	00f12623          	sw	a5,12(sp)
    a638:	060a9263          	bnez	s5,a69c <__d2b+0xc4>
    a63c:	00c10513          	add	a0,sp,12
    a640:	da8ff0ef          	jal	9be8 <__lo0bits>
    a644:	00c12703          	lw	a4,12(sp)
    a648:	00100493          	li	s1,1
    a64c:	00942823          	sw	s1,16(s0)
    a650:	00e42a23          	sw	a4,20(s0)
    a654:	02050793          	add	a5,a0,32
    a658:	08090863          	beqz	s2,a6e8 <__d2b+0x110>
    a65c:	bcd90913          	add	s2,s2,-1075
    a660:	00f90933          	add	s2,s2,a5
    a664:	03500493          	li	s1,53
    a668:	012a2023          	sw	s2,0(s4)
    a66c:	40f48533          	sub	a0,s1,a5
    a670:	00a9a023          	sw	a0,0(s3)
    a674:	02c12083          	lw	ra,44(sp)
    a678:	00040513          	mv	a0,s0
    a67c:	02812403          	lw	s0,40(sp)
    a680:	02412483          	lw	s1,36(sp)
    a684:	02012903          	lw	s2,32(sp)
    a688:	01c12983          	lw	s3,28(sp)
    a68c:	01812a03          	lw	s4,24(sp)
    a690:	01412a83          	lw	s5,20(sp)
    a694:	03010113          	add	sp,sp,48
    a698:	00008067          	ret
    a69c:	00810513          	add	a0,sp,8
    a6a0:	01512423          	sw	s5,8(sp)
    a6a4:	d44ff0ef          	jal	9be8 <__lo0bits>
    a6a8:	00c12703          	lw	a4,12(sp)
    a6ac:	00050793          	mv	a5,a0
    a6b0:	04050e63          	beqz	a0,a70c <__d2b+0x134>
    a6b4:	00812603          	lw	a2,8(sp)
    a6b8:	02000693          	li	a3,32
    a6bc:	40a686b3          	sub	a3,a3,a0
    a6c0:	00d716b3          	sll	a3,a4,a3
    a6c4:	00a75733          	srl	a4,a4,a0
    a6c8:	00c6e6b3          	or	a3,a3,a2
    a6cc:	00e12623          	sw	a4,12(sp)
    a6d0:	00e034b3          	snez	s1,a4
    a6d4:	00148493          	add	s1,s1,1
    a6d8:	00d42a23          	sw	a3,20(s0)
    a6dc:	00e42c23          	sw	a4,24(s0)
    a6e0:	00942823          	sw	s1,16(s0)
    a6e4:	f6091ce3          	bnez	s2,a65c <__d2b+0x84>
    a6e8:	00249713          	sll	a4,s1,0x2
    a6ec:	00e40733          	add	a4,s0,a4
    a6f0:	01072503          	lw	a0,16(a4)
    a6f4:	bce78793          	add	a5,a5,-1074
    a6f8:	00fa2023          	sw	a5,0(s4)
    a6fc:	c74ff0ef          	jal	9b70 <__hi0bits>
    a700:	00549493          	sll	s1,s1,0x5
    a704:	40a48533          	sub	a0,s1,a0
    a708:	f69ff06f          	j	a670 <__d2b+0x98>
    a70c:	00812683          	lw	a3,8(sp)
    a710:	fc1ff06f          	j	a6d0 <__d2b+0xf8>
    a714:	00005697          	auipc	a3,0x5
    a718:	bfc68693          	add	a3,a3,-1028 # f310 <__fini_array_end+0x298>
    a71c:	00000613          	li	a2,0
    a720:	30f00593          	li	a1,783
    a724:	00005517          	auipc	a0,0x5
    a728:	c8050513          	add	a0,a0,-896 # f3a4 <__fini_array_end+0x32c>
    a72c:	20d000ef          	jal	b138 <__assert_func>

0000a730 <_realloc_r>:
    a730:	fd010113          	add	sp,sp,-48
    a734:	02912223          	sw	s1,36(sp)
    a738:	02112623          	sw	ra,44(sp)
    a73c:	00060493          	mv	s1,a2
    a740:	1e058863          	beqz	a1,a930 <_realloc_r+0x200>
    a744:	02812423          	sw	s0,40(sp)
    a748:	03212023          	sw	s2,32(sp)
    a74c:	00058413          	mv	s0,a1
    a750:	01312e23          	sw	s3,28(sp)
    a754:	01512a23          	sw	s5,20(sp)
    a758:	01412c23          	sw	s4,24(sp)
    a75c:	00050913          	mv	s2,a0
    a760:	8b1f70ef          	jal	2010 <__malloc_lock>
    a764:	ffc42703          	lw	a4,-4(s0)
    a768:	00b48793          	add	a5,s1,11
    a76c:	01600693          	li	a3,22
    a770:	ff840a93          	add	s5,s0,-8
    a774:	ffc77993          	and	s3,a4,-4
    a778:	10f6f263          	bgeu	a3,a5,a87c <_realloc_r+0x14c>
    a77c:	ff87fa13          	and	s4,a5,-8
    a780:	1007c263          	bltz	a5,a884 <_realloc_r+0x154>
    a784:	109a6063          	bltu	s4,s1,a884 <_realloc_r+0x154>
    a788:	1349d263          	bge	s3,s4,a8ac <_realloc_r+0x17c>
    a78c:	01812423          	sw	s8,8(sp)
    a790:	7fff6c17          	auipc	s8,0x7fff6
    a794:	990c0c13          	add	s8,s8,-1648 # 80000120 <__malloc_av_>
    a798:	008c2603          	lw	a2,8(s8)
    a79c:	013a86b3          	add	a3,s5,s3
    a7a0:	0046a783          	lw	a5,4(a3)
    a7a4:	1cd60863          	beq	a2,a3,a974 <_realloc_r+0x244>
    a7a8:	ffe7f613          	and	a2,a5,-2
    a7ac:	00c68633          	add	a2,a3,a2
    a7b0:	00462603          	lw	a2,4(a2)
    a7b4:	00167613          	and	a2,a2,1
    a7b8:	14061a63          	bnez	a2,a90c <_realloc_r+0x1dc>
    a7bc:	ffc7f793          	and	a5,a5,-4
    a7c0:	00f98633          	add	a2,s3,a5
    a7c4:	0d465863          	bge	a2,s4,a894 <_realloc_r+0x164>
    a7c8:	00177713          	and	a4,a4,1
    a7cc:	02071c63          	bnez	a4,a804 <_realloc_r+0xd4>
    a7d0:	01712623          	sw	s7,12(sp)
    a7d4:	ff842b83          	lw	s7,-8(s0)
    a7d8:	01612823          	sw	s6,16(sp)
    a7dc:	417a8bb3          	sub	s7,s5,s7
    a7e0:	004ba703          	lw	a4,4(s7)
    a7e4:	ffc77713          	and	a4,a4,-4
    a7e8:	00e787b3          	add	a5,a5,a4
    a7ec:	01378b33          	add	s6,a5,s3
    a7f0:	334b5c63          	bge	s6,s4,ab28 <_realloc_r+0x3f8>
    a7f4:	00e98b33          	add	s6,s3,a4
    a7f8:	294b5863          	bge	s6,s4,aa88 <_realloc_r+0x358>
    a7fc:	01012b03          	lw	s6,16(sp)
    a800:	00c12b83          	lw	s7,12(sp)
    a804:	00048593          	mv	a1,s1
    a808:	00090513          	mv	a0,s2
    a80c:	824f70ef          	jal	1830 <_malloc_r>
    a810:	00050493          	mv	s1,a0
    a814:	40050863          	beqz	a0,ac24 <_realloc_r+0x4f4>
    a818:	ffc42783          	lw	a5,-4(s0)
    a81c:	ff850713          	add	a4,a0,-8
    a820:	ffe7f793          	and	a5,a5,-2
    a824:	00fa87b3          	add	a5,s5,a5
    a828:	24e78663          	beq	a5,a4,aa74 <_realloc_r+0x344>
    a82c:	ffc98613          	add	a2,s3,-4
    a830:	02400793          	li	a5,36
    a834:	2ec7e463          	bltu	a5,a2,ab1c <_realloc_r+0x3ec>
    a838:	01300713          	li	a4,19
    a83c:	20c76a63          	bltu	a4,a2,aa50 <_realloc_r+0x320>
    a840:	00050793          	mv	a5,a0
    a844:	00040713          	mv	a4,s0
    a848:	00072683          	lw	a3,0(a4)
    a84c:	00d7a023          	sw	a3,0(a5)
    a850:	00472683          	lw	a3,4(a4)
    a854:	00d7a223          	sw	a3,4(a5)
    a858:	00872703          	lw	a4,8(a4)
    a85c:	00e7a423          	sw	a4,8(a5)
    a860:	00040593          	mv	a1,s0
    a864:	00090513          	mv	a0,s2
    a868:	cbdf60ef          	jal	1524 <_free_r>
    a86c:	00090513          	mv	a0,s2
    a870:	facf70ef          	jal	201c <__malloc_unlock>
    a874:	00812c03          	lw	s8,8(sp)
    a878:	06c0006f          	j	a8e4 <_realloc_r+0x1b4>
    a87c:	01000a13          	li	s4,16
    a880:	f09a74e3          	bgeu	s4,s1,a788 <_realloc_r+0x58>
    a884:	00c00793          	li	a5,12
    a888:	00f92023          	sw	a5,0(s2)
    a88c:	00000493          	li	s1,0
    a890:	0540006f          	j	a8e4 <_realloc_r+0x1b4>
    a894:	00c6a783          	lw	a5,12(a3)
    a898:	0086a703          	lw	a4,8(a3)
    a89c:	00812c03          	lw	s8,8(sp)
    a8a0:	00060993          	mv	s3,a2
    a8a4:	00f72623          	sw	a5,12(a4)
    a8a8:	00e7a423          	sw	a4,8(a5)
    a8ac:	004aa783          	lw	a5,4(s5)
    a8b0:	414986b3          	sub	a3,s3,s4
    a8b4:	00f00613          	li	a2,15
    a8b8:	0017f793          	and	a5,a5,1
    a8bc:	013a8733          	add	a4,s5,s3
    a8c0:	08d66263          	bltu	a2,a3,a944 <_realloc_r+0x214>
    a8c4:	0137e7b3          	or	a5,a5,s3
    a8c8:	00faa223          	sw	a5,4(s5)
    a8cc:	00472783          	lw	a5,4(a4)
    a8d0:	0017e793          	or	a5,a5,1
    a8d4:	00f72223          	sw	a5,4(a4)
    a8d8:	00090513          	mv	a0,s2
    a8dc:	f40f70ef          	jal	201c <__malloc_unlock>
    a8e0:	00040493          	mv	s1,s0
    a8e4:	02812403          	lw	s0,40(sp)
    a8e8:	02c12083          	lw	ra,44(sp)
    a8ec:	02012903          	lw	s2,32(sp)
    a8f0:	01c12983          	lw	s3,28(sp)
    a8f4:	01812a03          	lw	s4,24(sp)
    a8f8:	01412a83          	lw	s5,20(sp)
    a8fc:	00048513          	mv	a0,s1
    a900:	02412483          	lw	s1,36(sp)
    a904:	03010113          	add	sp,sp,48
    a908:	00008067          	ret
    a90c:	00177713          	and	a4,a4,1
    a910:	ee071ae3          	bnez	a4,a804 <_realloc_r+0xd4>
    a914:	01712623          	sw	s7,12(sp)
    a918:	ff842b83          	lw	s7,-8(s0)
    a91c:	01612823          	sw	s6,16(sp)
    a920:	417a8bb3          	sub	s7,s5,s7
    a924:	004ba703          	lw	a4,4(s7)
    a928:	ffc77713          	and	a4,a4,-4
    a92c:	ec9ff06f          	j	a7f4 <_realloc_r+0xc4>
    a930:	02c12083          	lw	ra,44(sp)
    a934:	02412483          	lw	s1,36(sp)
    a938:	00060593          	mv	a1,a2
    a93c:	03010113          	add	sp,sp,48
    a940:	ef1f606f          	j	1830 <_malloc_r>
    a944:	0147e7b3          	or	a5,a5,s4
    a948:	00faa223          	sw	a5,4(s5)
    a94c:	014a85b3          	add	a1,s5,s4
    a950:	0016e693          	or	a3,a3,1
    a954:	00d5a223          	sw	a3,4(a1)
    a958:	00472783          	lw	a5,4(a4)
    a95c:	00858593          	add	a1,a1,8
    a960:	00090513          	mv	a0,s2
    a964:	0017e793          	or	a5,a5,1
    a968:	00f72223          	sw	a5,4(a4)
    a96c:	bb9f60ef          	jal	1524 <_free_r>
    a970:	f69ff06f          	j	a8d8 <_realloc_r+0x1a8>
    a974:	ffc7f793          	and	a5,a5,-4
    a978:	013786b3          	add	a3,a5,s3
    a97c:	010a0613          	add	a2,s4,16
    a980:	26c6d063          	bge	a3,a2,abe0 <_realloc_r+0x4b0>
    a984:	00177713          	and	a4,a4,1
    a988:	e6071ee3          	bnez	a4,a804 <_realloc_r+0xd4>
    a98c:	01712623          	sw	s7,12(sp)
    a990:	ff842b83          	lw	s7,-8(s0)
    a994:	01612823          	sw	s6,16(sp)
    a998:	417a8bb3          	sub	s7,s5,s7
    a99c:	004ba703          	lw	a4,4(s7)
    a9a0:	ffc77713          	and	a4,a4,-4
    a9a4:	00e787b3          	add	a5,a5,a4
    a9a8:	01378b33          	add	s6,a5,s3
    a9ac:	e4cb44e3          	blt	s6,a2,a7f4 <_realloc_r+0xc4>
    a9b0:	00cba783          	lw	a5,12(s7)
    a9b4:	008ba703          	lw	a4,8(s7)
    a9b8:	ffc98613          	add	a2,s3,-4
    a9bc:	02400693          	li	a3,36
    a9c0:	00f72623          	sw	a5,12(a4)
    a9c4:	00e7a423          	sw	a4,8(a5)
    a9c8:	008b8493          	add	s1,s7,8
    a9cc:	28c6e463          	bltu	a3,a2,ac54 <_realloc_r+0x524>
    a9d0:	01300713          	li	a4,19
    a9d4:	00048793          	mv	a5,s1
    a9d8:	02c77263          	bgeu	a4,a2,a9fc <_realloc_r+0x2cc>
    a9dc:	00042703          	lw	a4,0(s0)
    a9e0:	01b00793          	li	a5,27
    a9e4:	00eba423          	sw	a4,8(s7)
    a9e8:	00442703          	lw	a4,4(s0)
    a9ec:	00eba623          	sw	a4,12(s7)
    a9f0:	26c7ea63          	bltu	a5,a2,ac64 <_realloc_r+0x534>
    a9f4:	00840413          	add	s0,s0,8
    a9f8:	010b8793          	add	a5,s7,16
    a9fc:	00042703          	lw	a4,0(s0)
    aa00:	00e7a023          	sw	a4,0(a5)
    aa04:	00442703          	lw	a4,4(s0)
    aa08:	00e7a223          	sw	a4,4(a5)
    aa0c:	00842703          	lw	a4,8(s0)
    aa10:	00e7a423          	sw	a4,8(a5)
    aa14:	014b8733          	add	a4,s7,s4
    aa18:	414b07b3          	sub	a5,s6,s4
    aa1c:	00ec2423          	sw	a4,8(s8)
    aa20:	0017e793          	or	a5,a5,1
    aa24:	00f72223          	sw	a5,4(a4)
    aa28:	004ba783          	lw	a5,4(s7)
    aa2c:	00090513          	mv	a0,s2
    aa30:	0017f793          	and	a5,a5,1
    aa34:	0147e7b3          	or	a5,a5,s4
    aa38:	00fba223          	sw	a5,4(s7)
    aa3c:	de0f70ef          	jal	201c <__malloc_unlock>
    aa40:	01012b03          	lw	s6,16(sp)
    aa44:	00c12b83          	lw	s7,12(sp)
    aa48:	00812c03          	lw	s8,8(sp)
    aa4c:	e99ff06f          	j	a8e4 <_realloc_r+0x1b4>
    aa50:	00042683          	lw	a3,0(s0)
    aa54:	01b00713          	li	a4,27
    aa58:	00d52023          	sw	a3,0(a0)
    aa5c:	00442683          	lw	a3,4(s0)
    aa60:	00d52223          	sw	a3,4(a0)
    aa64:	14c76e63          	bltu	a4,a2,abc0 <_realloc_r+0x490>
    aa68:	00840713          	add	a4,s0,8
    aa6c:	00850793          	add	a5,a0,8
    aa70:	dd9ff06f          	j	a848 <_realloc_r+0x118>
    aa74:	ffc52783          	lw	a5,-4(a0)
    aa78:	00812c03          	lw	s8,8(sp)
    aa7c:	ffc7f793          	and	a5,a5,-4
    aa80:	00f989b3          	add	s3,s3,a5
    aa84:	e29ff06f          	j	a8ac <_realloc_r+0x17c>
    aa88:	00cba783          	lw	a5,12(s7)
    aa8c:	008ba703          	lw	a4,8(s7)
    aa90:	ffc98613          	add	a2,s3,-4
    aa94:	02400693          	li	a3,36
    aa98:	00f72623          	sw	a5,12(a4)
    aa9c:	00e7a423          	sw	a4,8(a5)
    aaa0:	008b8493          	add	s1,s7,8
    aaa4:	10c6e663          	bltu	a3,a2,abb0 <_realloc_r+0x480>
    aaa8:	01300713          	li	a4,19
    aaac:	00048793          	mv	a5,s1
    aab0:	02c77c63          	bgeu	a4,a2,aae8 <_realloc_r+0x3b8>
    aab4:	00042703          	lw	a4,0(s0)
    aab8:	01b00793          	li	a5,27
    aabc:	00eba423          	sw	a4,8(s7)
    aac0:	00442703          	lw	a4,4(s0)
    aac4:	00eba623          	sw	a4,12(s7)
    aac8:	14c7f863          	bgeu	a5,a2,ac18 <_realloc_r+0x4e8>
    aacc:	00842783          	lw	a5,8(s0)
    aad0:	00fba823          	sw	a5,16(s7)
    aad4:	00c42783          	lw	a5,12(s0)
    aad8:	00fbaa23          	sw	a5,20(s7)
    aadc:	0ad60c63          	beq	a2,a3,ab94 <_realloc_r+0x464>
    aae0:	01040413          	add	s0,s0,16
    aae4:	018b8793          	add	a5,s7,24
    aae8:	00042703          	lw	a4,0(s0)
    aaec:	00e7a023          	sw	a4,0(a5)
    aaf0:	00442703          	lw	a4,4(s0)
    aaf4:	00e7a223          	sw	a4,4(a5)
    aaf8:	00842703          	lw	a4,8(s0)
    aafc:	00e7a423          	sw	a4,8(a5)
    ab00:	000b0993          	mv	s3,s6
    ab04:	000b8a93          	mv	s5,s7
    ab08:	01012b03          	lw	s6,16(sp)
    ab0c:	00c12b83          	lw	s7,12(sp)
    ab10:	00812c03          	lw	s8,8(sp)
    ab14:	00048413          	mv	s0,s1
    ab18:	d95ff06f          	j	a8ac <_realloc_r+0x17c>
    ab1c:	00040593          	mv	a1,s0
    ab20:	ae8fd0ef          	jal	7e08 <memmove>
    ab24:	d3dff06f          	j	a860 <_realloc_r+0x130>
    ab28:	00c6a783          	lw	a5,12(a3)
    ab2c:	0086a703          	lw	a4,8(a3)
    ab30:	ffc98613          	add	a2,s3,-4
    ab34:	02400693          	li	a3,36
    ab38:	00f72623          	sw	a5,12(a4)
    ab3c:	00e7a423          	sw	a4,8(a5)
    ab40:	008ba703          	lw	a4,8(s7)
    ab44:	00cba783          	lw	a5,12(s7)
    ab48:	008b8493          	add	s1,s7,8
    ab4c:	00f72623          	sw	a5,12(a4)
    ab50:	00e7a423          	sw	a4,8(a5)
    ab54:	04c6ee63          	bltu	a3,a2,abb0 <_realloc_r+0x480>
    ab58:	01300713          	li	a4,19
    ab5c:	00048793          	mv	a5,s1
    ab60:	f8c774e3          	bgeu	a4,a2,aae8 <_realloc_r+0x3b8>
    ab64:	00042703          	lw	a4,0(s0)
    ab68:	01b00793          	li	a5,27
    ab6c:	00eba423          	sw	a4,8(s7)
    ab70:	00442703          	lw	a4,4(s0)
    ab74:	00eba623          	sw	a4,12(s7)
    ab78:	0ac7f063          	bgeu	a5,a2,ac18 <_realloc_r+0x4e8>
    ab7c:	00842703          	lw	a4,8(s0)
    ab80:	02400793          	li	a5,36
    ab84:	00eba823          	sw	a4,16(s7)
    ab88:	00c42703          	lw	a4,12(s0)
    ab8c:	00ebaa23          	sw	a4,20(s7)
    ab90:	f4f618e3          	bne	a2,a5,aae0 <_realloc_r+0x3b0>
    ab94:	01042703          	lw	a4,16(s0)
    ab98:	020b8793          	add	a5,s7,32
    ab9c:	01840413          	add	s0,s0,24
    aba0:	00ebac23          	sw	a4,24(s7)
    aba4:	ffc42703          	lw	a4,-4(s0)
    aba8:	00ebae23          	sw	a4,28(s7)
    abac:	f3dff06f          	j	aae8 <_realloc_r+0x3b8>
    abb0:	00040593          	mv	a1,s0
    abb4:	00048513          	mv	a0,s1
    abb8:	a50fd0ef          	jal	7e08 <memmove>
    abbc:	f45ff06f          	j	ab00 <_realloc_r+0x3d0>
    abc0:	00842703          	lw	a4,8(s0)
    abc4:	00e52423          	sw	a4,8(a0)
    abc8:	00c42703          	lw	a4,12(s0)
    abcc:	00e52623          	sw	a4,12(a0)
    abd0:	06f60463          	beq	a2,a5,ac38 <_realloc_r+0x508>
    abd4:	01040713          	add	a4,s0,16
    abd8:	01050793          	add	a5,a0,16
    abdc:	c6dff06f          	j	a848 <_realloc_r+0x118>
    abe0:	014a8ab3          	add	s5,s5,s4
    abe4:	414687b3          	sub	a5,a3,s4
    abe8:	015c2423          	sw	s5,8(s8)
    abec:	0017e793          	or	a5,a5,1
    abf0:	00faa223          	sw	a5,4(s5)
    abf4:	ffc42783          	lw	a5,-4(s0)
    abf8:	00090513          	mv	a0,s2
    abfc:	00040493          	mv	s1,s0
    ac00:	0017f793          	and	a5,a5,1
    ac04:	0147e7b3          	or	a5,a5,s4
    ac08:	fef42e23          	sw	a5,-4(s0)
    ac0c:	c10f70ef          	jal	201c <__malloc_unlock>
    ac10:	00812c03          	lw	s8,8(sp)
    ac14:	cd1ff06f          	j	a8e4 <_realloc_r+0x1b4>
    ac18:	00840413          	add	s0,s0,8
    ac1c:	010b8793          	add	a5,s7,16
    ac20:	ec9ff06f          	j	aae8 <_realloc_r+0x3b8>
    ac24:	00090513          	mv	a0,s2
    ac28:	bf4f70ef          	jal	201c <__malloc_unlock>
    ac2c:	00000493          	li	s1,0
    ac30:	00812c03          	lw	s8,8(sp)
    ac34:	cb1ff06f          	j	a8e4 <_realloc_r+0x1b4>
    ac38:	01042683          	lw	a3,16(s0)
    ac3c:	01840713          	add	a4,s0,24
    ac40:	01850793          	add	a5,a0,24
    ac44:	00d52823          	sw	a3,16(a0)
    ac48:	01442683          	lw	a3,20(s0)
    ac4c:	00d52a23          	sw	a3,20(a0)
    ac50:	bf9ff06f          	j	a848 <_realloc_r+0x118>
    ac54:	00040593          	mv	a1,s0
    ac58:	00048513          	mv	a0,s1
    ac5c:	9acfd0ef          	jal	7e08 <memmove>
    ac60:	db5ff06f          	j	aa14 <_realloc_r+0x2e4>
    ac64:	00842783          	lw	a5,8(s0)
    ac68:	00fba823          	sw	a5,16(s7)
    ac6c:	00c42783          	lw	a5,12(s0)
    ac70:	00fbaa23          	sw	a5,20(s7)
    ac74:	00d60863          	beq	a2,a3,ac84 <_realloc_r+0x554>
    ac78:	01040413          	add	s0,s0,16
    ac7c:	018b8793          	add	a5,s7,24
    ac80:	d7dff06f          	j	a9fc <_realloc_r+0x2cc>
    ac84:	01042703          	lw	a4,16(s0)
    ac88:	020b8793          	add	a5,s7,32
    ac8c:	01840413          	add	s0,s0,24
    ac90:	00ebac23          	sw	a4,24(s7)
    ac94:	ffc42703          	lw	a4,-4(s0)
    ac98:	00ebae23          	sw	a4,28(s7)
    ac9c:	d61ff06f          	j	a9fc <_realloc_r+0x2cc>

0000aca0 <__ascii_wctomb>:
    aca0:	02058463          	beqz	a1,acc8 <__ascii_wctomb+0x28>
    aca4:	0ff00793          	li	a5,255
    aca8:	00c7e863          	bltu	a5,a2,acb8 <__ascii_wctomb+0x18>
    acac:	00c58023          	sb	a2,0(a1)
    acb0:	00100513          	li	a0,1
    acb4:	00008067          	ret
    acb8:	08a00793          	li	a5,138
    acbc:	00f52023          	sw	a5,0(a0)
    acc0:	fff00513          	li	a0,-1
    acc4:	00008067          	ret
    acc8:	00000513          	li	a0,0
    accc:	00008067          	ret

0000acd0 <_wcrtomb_r>:
    acd0:	fe010113          	add	sp,sp,-32
    acd4:	00812c23          	sw	s0,24(sp)
    acd8:	00912a23          	sw	s1,20(sp)
    acdc:	00112e23          	sw	ra,28(sp)
    ace0:	00050493          	mv	s1,a0
    ace4:	10450413          	add	s0,a0,260
    ace8:	00068463          	beqz	a3,acf0 <_wcrtomb_r+0x20>
    acec:	00068413          	mv	s0,a3
    acf0:	7fff6797          	auipc	a5,0x7fff6
    acf4:	9247a783          	lw	a5,-1756(a5) # 80000614 <__global_locale+0xe0>
    acf8:	00040693          	mv	a3,s0
    acfc:	02058463          	beqz	a1,ad24 <_wcrtomb_r+0x54>
    ad00:	00048513          	mv	a0,s1
    ad04:	000780e7          	jalr	a5
    ad08:	fff00793          	li	a5,-1
    ad0c:	02f50863          	beq	a0,a5,ad3c <_wcrtomb_r+0x6c>
    ad10:	01c12083          	lw	ra,28(sp)
    ad14:	01812403          	lw	s0,24(sp)
    ad18:	01412483          	lw	s1,20(sp)
    ad1c:	02010113          	add	sp,sp,32
    ad20:	00008067          	ret
    ad24:	00000613          	li	a2,0
    ad28:	00410593          	add	a1,sp,4
    ad2c:	00048513          	mv	a0,s1
    ad30:	000780e7          	jalr	a5
    ad34:	fff00793          	li	a5,-1
    ad38:	fcf51ce3          	bne	a0,a5,ad10 <_wcrtomb_r+0x40>
    ad3c:	00042023          	sw	zero,0(s0)
    ad40:	01c12083          	lw	ra,28(sp)
    ad44:	01812403          	lw	s0,24(sp)
    ad48:	08a00793          	li	a5,138
    ad4c:	00f4a023          	sw	a5,0(s1)
    ad50:	01412483          	lw	s1,20(sp)
    ad54:	02010113          	add	sp,sp,32
    ad58:	00008067          	ret

0000ad5c <_wcsrtombs_r>:
    ad5c:	00070793          	mv	a5,a4
    ad60:	00068713          	mv	a4,a3
    ad64:	fff00693          	li	a3,-1
    ad68:	7a40006f          	j	b50c <_wcsnrtombs_r>

0000ad6c <_fclose_r>:
    ad6c:	ff010113          	add	sp,sp,-16
    ad70:	00112623          	sw	ra,12(sp)
    ad74:	01212023          	sw	s2,0(sp)
    ad78:	0e058263          	beqz	a1,ae5c <_fclose_r+0xf0>
    ad7c:	00812423          	sw	s0,8(sp)
    ad80:	00912223          	sw	s1,4(sp)
    ad84:	00058413          	mv	s0,a1
    ad88:	00050493          	mv	s1,a0
    ad8c:	00050663          	beqz	a0,ad98 <_fclose_r+0x2c>
    ad90:	03452783          	lw	a5,52(a0)
    ad94:	10078063          	beqz	a5,ae94 <_fclose_r+0x128>
    ad98:	06442783          	lw	a5,100(s0)
    ad9c:	00c41703          	lh	a4,12(s0)
    ada0:	0017f793          	and	a5,a5,1
    ada4:	0a079663          	bnez	a5,ae50 <_fclose_r+0xe4>
    ada8:	20077713          	and	a4,a4,512
    adac:	0e070863          	beqz	a4,ae9c <_fclose_r+0x130>
    adb0:	00040593          	mv	a1,s0
    adb4:	00048513          	mv	a0,s1
    adb8:	9f5fb0ef          	jal	67ac <__sflush_r>
    adbc:	02c42783          	lw	a5,44(s0)
    adc0:	00050913          	mv	s2,a0
    adc4:	00078a63          	beqz	a5,add8 <_fclose_r+0x6c>
    adc8:	01c42583          	lw	a1,28(s0)
    adcc:	00048513          	mv	a0,s1
    add0:	000780e7          	jalr	a5
    add4:	0a054063          	bltz	a0,ae74 <_fclose_r+0x108>
    add8:	00c45783          	lhu	a5,12(s0)
    addc:	0807f793          	and	a5,a5,128
    ade0:	0a079263          	bnez	a5,ae84 <_fclose_r+0x118>
    ade4:	03042583          	lw	a1,48(s0)
    ade8:	00058c63          	beqz	a1,ae00 <_fclose_r+0x94>
    adec:	04040793          	add	a5,s0,64
    adf0:	00f58663          	beq	a1,a5,adfc <_fclose_r+0x90>
    adf4:	00048513          	mv	a0,s1
    adf8:	f2cf60ef          	jal	1524 <_free_r>
    adfc:	02042823          	sw	zero,48(s0)
    ae00:	04442583          	lw	a1,68(s0)
    ae04:	00058863          	beqz	a1,ae14 <_fclose_r+0xa8>
    ae08:	00048513          	mv	a0,s1
    ae0c:	f18f60ef          	jal	1524 <_free_r>
    ae10:	04042223          	sw	zero,68(s0)
    ae14:	f51fb0ef          	jal	6d64 <__sfp_lock_acquire>
    ae18:	06442783          	lw	a5,100(s0)
    ae1c:	00041623          	sh	zero,12(s0)
    ae20:	0017f793          	and	a5,a5,1
    ae24:	0a078663          	beqz	a5,aed0 <_fclose_r+0x164>
    ae28:	05842503          	lw	a0,88(s0)
    ae2c:	a9cf60ef          	jal	10c8 <__retarget_lock_close_recursive>
    ae30:	f41fb0ef          	jal	6d70 <__sfp_lock_release>
    ae34:	00c12083          	lw	ra,12(sp)
    ae38:	00812403          	lw	s0,8(sp)
    ae3c:	00412483          	lw	s1,4(sp)
    ae40:	00090513          	mv	a0,s2
    ae44:	00012903          	lw	s2,0(sp)
    ae48:	01010113          	add	sp,sp,16
    ae4c:	00008067          	ret
    ae50:	f60710e3          	bnez	a4,adb0 <_fclose_r+0x44>
    ae54:	00812403          	lw	s0,8(sp)
    ae58:	00412483          	lw	s1,4(sp)
    ae5c:	00000913          	li	s2,0
    ae60:	00c12083          	lw	ra,12(sp)
    ae64:	00090513          	mv	a0,s2
    ae68:	00012903          	lw	s2,0(sp)
    ae6c:	01010113          	add	sp,sp,16
    ae70:	00008067          	ret
    ae74:	00c45783          	lhu	a5,12(s0)
    ae78:	fff00913          	li	s2,-1
    ae7c:	0807f793          	and	a5,a5,128
    ae80:	f60782e3          	beqz	a5,ade4 <_fclose_r+0x78>
    ae84:	01042583          	lw	a1,16(s0)
    ae88:	00048513          	mv	a0,s1
    ae8c:	e98f60ef          	jal	1524 <_free_r>
    ae90:	f55ff06f          	j	ade4 <_fclose_r+0x78>
    ae94:	e61fb0ef          	jal	6cf4 <__sinit>
    ae98:	f01ff06f          	j	ad98 <_fclose_r+0x2c>
    ae9c:	05842503          	lw	a0,88(s0)
    aea0:	a2cf60ef          	jal	10cc <__retarget_lock_acquire_recursive>
    aea4:	00c41783          	lh	a5,12(s0)
    aea8:	f00794e3          	bnez	a5,adb0 <_fclose_r+0x44>
    aeac:	06442783          	lw	a5,100(s0)
    aeb0:	0017f793          	and	a5,a5,1
    aeb4:	fa0790e3          	bnez	a5,ae54 <_fclose_r+0xe8>
    aeb8:	05842503          	lw	a0,88(s0)
    aebc:	00000913          	li	s2,0
    aec0:	a10f60ef          	jal	10d0 <__retarget_lock_release_recursive>
    aec4:	00812403          	lw	s0,8(sp)
    aec8:	00412483          	lw	s1,4(sp)
    aecc:	f95ff06f          	j	ae60 <_fclose_r+0xf4>
    aed0:	05842503          	lw	a0,88(s0)
    aed4:	9fcf60ef          	jal	10d0 <__retarget_lock_release_recursive>
    aed8:	f51ff06f          	j	ae28 <_fclose_r+0xbc>

0000aedc <__smakebuf_r>:
    aedc:	00c59783          	lh	a5,12(a1)
    aee0:	f8010113          	add	sp,sp,-128
    aee4:	06812c23          	sw	s0,120(sp)
    aee8:	06112e23          	sw	ra,124(sp)
    aeec:	0027f713          	and	a4,a5,2
    aef0:	00058413          	mv	s0,a1
    aef4:	02070463          	beqz	a4,af1c <__smakebuf_r+0x40>
    aef8:	04358793          	add	a5,a1,67
    aefc:	00f5a023          	sw	a5,0(a1)
    af00:	00f5a823          	sw	a5,16(a1)
    af04:	00100793          	li	a5,1
    af08:	00f5aa23          	sw	a5,20(a1)
    af0c:	07c12083          	lw	ra,124(sp)
    af10:	07812403          	lw	s0,120(sp)
    af14:	08010113          	add	sp,sp,128
    af18:	00008067          	ret
    af1c:	00e59583          	lh	a1,14(a1)
    af20:	06912a23          	sw	s1,116(sp)
    af24:	07212823          	sw	s2,112(sp)
    af28:	07312623          	sw	s3,108(sp)
    af2c:	07412423          	sw	s4,104(sp)
    af30:	00050493          	mv	s1,a0
    af34:	0805c663          	bltz	a1,afc0 <__smakebuf_r+0xe4>
    af38:	00810613          	add	a2,sp,8
    af3c:	138000ef          	jal	b074 <_fstat_r>
    af40:	06054e63          	bltz	a0,afbc <__smakebuf_r+0xe0>
    af44:	00c12783          	lw	a5,12(sp)
    af48:	0000f937          	lui	s2,0xf
    af4c:	000019b7          	lui	s3,0x1
    af50:	00f97933          	and	s2,s2,a5
    af54:	ffffe7b7          	lui	a5,0xffffe
    af58:	00f90933          	add	s2,s2,a5
    af5c:	00193913          	seqz	s2,s2
    af60:	40000a13          	li	s4,1024
    af64:	80098993          	add	s3,s3,-2048 # 800 <main+0x2d8>
    af68:	000a0593          	mv	a1,s4
    af6c:	00048513          	mv	a0,s1
    af70:	8c1f60ef          	jal	1830 <_malloc_r>
    af74:	00c41783          	lh	a5,12(s0)
    af78:	06050863          	beqz	a0,afe8 <__smakebuf_r+0x10c>
    af7c:	0807e793          	or	a5,a5,128
    af80:	00a42023          	sw	a0,0(s0)
    af84:	00a42823          	sw	a0,16(s0)
    af88:	00f41623          	sh	a5,12(s0)
    af8c:	01442a23          	sw	s4,20(s0)
    af90:	0a091063          	bnez	s2,b030 <__smakebuf_r+0x154>
    af94:	0137e7b3          	or	a5,a5,s3
    af98:	07c12083          	lw	ra,124(sp)
    af9c:	00f41623          	sh	a5,12(s0)
    afa0:	07812403          	lw	s0,120(sp)
    afa4:	07412483          	lw	s1,116(sp)
    afa8:	07012903          	lw	s2,112(sp)
    afac:	06c12983          	lw	s3,108(sp)
    afb0:	06812a03          	lw	s4,104(sp)
    afb4:	08010113          	add	sp,sp,128
    afb8:	00008067          	ret
    afbc:	00c41783          	lh	a5,12(s0)
    afc0:	0807f793          	and	a5,a5,128
    afc4:	00000913          	li	s2,0
    afc8:	04078e63          	beqz	a5,b024 <__smakebuf_r+0x148>
    afcc:	04000a13          	li	s4,64
    afd0:	000a0593          	mv	a1,s4
    afd4:	00048513          	mv	a0,s1
    afd8:	859f60ef          	jal	1830 <_malloc_r>
    afdc:	00c41783          	lh	a5,12(s0)
    afe0:	00000993          	li	s3,0
    afe4:	f8051ce3          	bnez	a0,af7c <__smakebuf_r+0xa0>
    afe8:	2007f713          	and	a4,a5,512
    afec:	04071e63          	bnez	a4,b048 <__smakebuf_r+0x16c>
    aff0:	ffc7f793          	and	a5,a5,-4
    aff4:	0027e793          	or	a5,a5,2
    aff8:	04340713          	add	a4,s0,67
    affc:	00f41623          	sh	a5,12(s0)
    b000:	00100793          	li	a5,1
    b004:	07412483          	lw	s1,116(sp)
    b008:	07012903          	lw	s2,112(sp)
    b00c:	06c12983          	lw	s3,108(sp)
    b010:	06812a03          	lw	s4,104(sp)
    b014:	00e42023          	sw	a4,0(s0)
    b018:	00e42823          	sw	a4,16(s0)
    b01c:	00f42a23          	sw	a5,20(s0)
    b020:	eedff06f          	j	af0c <__smakebuf_r+0x30>
    b024:	40000a13          	li	s4,1024
    b028:	00000993          	li	s3,0
    b02c:	f3dff06f          	j	af68 <__smakebuf_r+0x8c>
    b030:	00e41583          	lh	a1,14(s0)
    b034:	00048513          	mv	a0,s1
    b038:	09c000ef          	jal	b0d4 <_isatty_r>
    b03c:	02051063          	bnez	a0,b05c <__smakebuf_r+0x180>
    b040:	00c41783          	lh	a5,12(s0)
    b044:	f51ff06f          	j	af94 <__smakebuf_r+0xb8>
    b048:	07412483          	lw	s1,116(sp)
    b04c:	07012903          	lw	s2,112(sp)
    b050:	06c12983          	lw	s3,108(sp)
    b054:	06812a03          	lw	s4,104(sp)
    b058:	eb5ff06f          	j	af0c <__smakebuf_r+0x30>
    b05c:	00c45783          	lhu	a5,12(s0)
    b060:	ffc7f793          	and	a5,a5,-4
    b064:	0017e793          	or	a5,a5,1
    b068:	01079793          	sll	a5,a5,0x10
    b06c:	4107d793          	sra	a5,a5,0x10
    b070:	f25ff06f          	j	af94 <__smakebuf_r+0xb8>

0000b074 <_fstat_r>:
    b074:	ff010113          	add	sp,sp,-16
    b078:	00058713          	mv	a4,a1
    b07c:	00812423          	sw	s0,8(sp)
    b080:	00060593          	mv	a1,a2
    b084:	00050413          	mv	s0,a0
    b088:	00070513          	mv	a0,a4
    b08c:	7fff5797          	auipc	a5,0x7fff5
    b090:	6807a623          	sw	zero,1676(a5) # 80000718 <errno>
    b094:	00112623          	sw	ra,12(sp)
    b098:	c15f50ef          	jal	cac <_fstat>
    b09c:	fff00793          	li	a5,-1
    b0a0:	00f50a63          	beq	a0,a5,b0b4 <_fstat_r+0x40>
    b0a4:	00c12083          	lw	ra,12(sp)
    b0a8:	00812403          	lw	s0,8(sp)
    b0ac:	01010113          	add	sp,sp,16
    b0b0:	00008067          	ret
    b0b4:	7fff5797          	auipc	a5,0x7fff5
    b0b8:	6647a783          	lw	a5,1636(a5) # 80000718 <errno>
    b0bc:	fe0784e3          	beqz	a5,b0a4 <_fstat_r+0x30>
    b0c0:	00c12083          	lw	ra,12(sp)
    b0c4:	00f42023          	sw	a5,0(s0)
    b0c8:	00812403          	lw	s0,8(sp)
    b0cc:	01010113          	add	sp,sp,16
    b0d0:	00008067          	ret

0000b0d4 <_isatty_r>:
    b0d4:	ff010113          	add	sp,sp,-16
    b0d8:	00812423          	sw	s0,8(sp)
    b0dc:	00050413          	mv	s0,a0
    b0e0:	00058513          	mv	a0,a1
    b0e4:	7fff5797          	auipc	a5,0x7fff5
    b0e8:	6207aa23          	sw	zero,1588(a5) # 80000718 <errno>
    b0ec:	00112623          	sw	ra,12(sp)
    b0f0:	bd5f50ef          	jal	cc4 <_isatty>
    b0f4:	fff00793          	li	a5,-1
    b0f8:	00f50a63          	beq	a0,a5,b10c <_isatty_r+0x38>
    b0fc:	00c12083          	lw	ra,12(sp)
    b100:	00812403          	lw	s0,8(sp)
    b104:	01010113          	add	sp,sp,16
    b108:	00008067          	ret
    b10c:	7fff5797          	auipc	a5,0x7fff5
    b110:	60c7a783          	lw	a5,1548(a5) # 80000718 <errno>
    b114:	fe0784e3          	beqz	a5,b0fc <_isatty_r+0x28>
    b118:	00c12083          	lw	ra,12(sp)
    b11c:	00f42023          	sw	a5,0(s0)
    b120:	00812403          	lw	s0,8(sp)
    b124:	01010113          	add	sp,sp,16
    b128:	00008067          	ret

0000b12c <__errno>:
    b12c:	7fff5517          	auipc	a0,0x7fff5
    b130:	5dc52503          	lw	a0,1500(a0) # 80000708 <_impure_ptr>
    b134:	00008067          	ret

0000b138 <__assert_func>:
    b138:	ff010113          	add	sp,sp,-16
    b13c:	00068793          	mv	a5,a3
    b140:	7fff5717          	auipc	a4,0x7fff5
    b144:	5c872703          	lw	a4,1480(a4) # 80000708 <_impure_ptr>
    b148:	00060813          	mv	a6,a2
    b14c:	00112623          	sw	ra,12(sp)
    b150:	00c72883          	lw	a7,12(a4)
    b154:	00078613          	mv	a2,a5
    b158:	00050693          	mv	a3,a0
    b15c:	00058713          	mv	a4,a1
    b160:	00004797          	auipc	a5,0x4
    b164:	2c478793          	add	a5,a5,708 # f424 <__fini_array_end+0x3ac>
    b168:	00080c63          	beqz	a6,b180 <__assert_func+0x48>
    b16c:	00004597          	auipc	a1,0x4
    b170:	2c858593          	add	a1,a1,712 # f434 <__fini_array_end+0x3bc>
    b174:	00088513          	mv	a0,a7
    b178:	3a8000ef          	jal	b520 <fiprintf>
    b17c:	3f0000ef          	jal	b56c <abort>
    b180:	00004797          	auipc	a5,0x4
    b184:	f6c78793          	add	a5,a5,-148 # f0ec <__fini_array_end+0x74>
    b188:	00078813          	mv	a6,a5
    b18c:	fe1ff06f          	j	b16c <__assert_func+0x34>

0000b190 <_calloc_r>:
    b190:	fe010113          	add	sp,sp,-32
    b194:	00812c23          	sw	s0,24(sp)
    b198:	00112e23          	sw	ra,28(sp)
    b19c:	0105d693          	srl	a3,a1,0x10
    b1a0:	00058793          	mv	a5,a1
    b1a4:	00050413          	mv	s0,a0
    b1a8:	01065713          	srl	a4,a2,0x10
    b1ac:	0c069063          	bnez	a3,b26c <_calloc_r+0xdc>
    b1b0:	14071a63          	bnez	a4,b304 <_calloc_r+0x174>
    b1b4:	01061593          	sll	a1,a2,0x10
    b1b8:	01079513          	sll	a0,a5,0x10
    b1bc:	0105d593          	srl	a1,a1,0x10
    b1c0:	01055513          	srl	a0,a0,0x10
    b1c4:	4bd030ef          	jal	ee80 <__mulsi3>
    b1c8:	00050593          	mv	a1,a0
    b1cc:	00040513          	mv	a0,s0
    b1d0:	e60f60ef          	jal	1830 <_malloc_r>
    b1d4:	00050413          	mv	s0,a0
    b1d8:	10050a63          	beqz	a0,b2ec <_calloc_r+0x15c>
    b1dc:	ffc52603          	lw	a2,-4(a0)
    b1e0:	02400713          	li	a4,36
    b1e4:	ffc67613          	and	a2,a2,-4
    b1e8:	ffc60613          	add	a2,a2,-4
    b1ec:	04c76863          	bltu	a4,a2,b23c <_calloc_r+0xac>
    b1f0:	01300693          	li	a3,19
    b1f4:	00050793          	mv	a5,a0
    b1f8:	02c6f263          	bgeu	a3,a2,b21c <_calloc_r+0x8c>
    b1fc:	00052023          	sw	zero,0(a0)
    b200:	00052223          	sw	zero,4(a0)
    b204:	01b00793          	li	a5,27
    b208:	04c7f863          	bgeu	a5,a2,b258 <_calloc_r+0xc8>
    b20c:	00052423          	sw	zero,8(a0)
    b210:	00052623          	sw	zero,12(a0)
    b214:	01050793          	add	a5,a0,16
    b218:	10e60263          	beq	a2,a4,b31c <_calloc_r+0x18c>
    b21c:	0007a023          	sw	zero,0(a5)
    b220:	0007a223          	sw	zero,4(a5)
    b224:	0007a423          	sw	zero,8(a5)
    b228:	01c12083          	lw	ra,28(sp)
    b22c:	00040513          	mv	a0,s0
    b230:	01812403          	lw	s0,24(sp)
    b234:	02010113          	add	sp,sp,32
    b238:	00008067          	ret
    b23c:	00000593          	li	a1,0
    b240:	e95f50ef          	jal	10d4 <memset>
    b244:	01c12083          	lw	ra,28(sp)
    b248:	00040513          	mv	a0,s0
    b24c:	01812403          	lw	s0,24(sp)
    b250:	02010113          	add	sp,sp,32
    b254:	00008067          	ret
    b258:	00850793          	add	a5,a0,8
    b25c:	0007a023          	sw	zero,0(a5)
    b260:	0007a223          	sw	zero,4(a5)
    b264:	0007a423          	sw	zero,8(a5)
    b268:	fc1ff06f          	j	b228 <_calloc_r+0x98>
    b26c:	0c071663          	bnez	a4,b338 <_calloc_r+0x1a8>
    b270:	01212823          	sw	s2,16(sp)
    b274:	01312623          	sw	s3,12(sp)
    b278:	00912a23          	sw	s1,20(sp)
    b27c:	00068913          	mv	s2,a3
    b280:	00060993          	mv	s3,a2
    b284:	01079513          	sll	a0,a5,0x10
    b288:	01061593          	sll	a1,a2,0x10
    b28c:	0105d593          	srl	a1,a1,0x10
    b290:	01055513          	srl	a0,a0,0x10
    b294:	3ed030ef          	jal	ee80 <__mulsi3>
    b298:	00050493          	mv	s1,a0
    b29c:	01091593          	sll	a1,s2,0x10
    b2a0:	01099513          	sll	a0,s3,0x10
    b2a4:	0105d593          	srl	a1,a1,0x10
    b2a8:	01055513          	srl	a0,a0,0x10
    b2ac:	3d5030ef          	jal	ee80 <__mulsi3>
    b2b0:	0104d793          	srl	a5,s1,0x10
    b2b4:	00f505b3          	add	a1,a0,a5
    b2b8:	0105d793          	srl	a5,a1,0x10
    b2bc:	06079863          	bnez	a5,b32c <_calloc_r+0x19c>
    b2c0:	01049493          	sll	s1,s1,0x10
    b2c4:	0104d493          	srl	s1,s1,0x10
    b2c8:	01059593          	sll	a1,a1,0x10
    b2cc:	0095e5b3          	or	a1,a1,s1
    b2d0:	00040513          	mv	a0,s0
    b2d4:	01412483          	lw	s1,20(sp)
    b2d8:	01012903          	lw	s2,16(sp)
    b2dc:	00c12983          	lw	s3,12(sp)
    b2e0:	d50f60ef          	jal	1830 <_malloc_r>
    b2e4:	00050413          	mv	s0,a0
    b2e8:	ee051ae3          	bnez	a0,b1dc <_calloc_r+0x4c>
    b2ec:	00000413          	li	s0,0
    b2f0:	01c12083          	lw	ra,28(sp)
    b2f4:	00040513          	mv	a0,s0
    b2f8:	01812403          	lw	s0,24(sp)
    b2fc:	02010113          	add	sp,sp,32
    b300:	00008067          	ret
    b304:	01212823          	sw	s2,16(sp)
    b308:	01312623          	sw	s3,12(sp)
    b30c:	00912a23          	sw	s1,20(sp)
    b310:	00070913          	mv	s2,a4
    b314:	00058993          	mv	s3,a1
    b318:	f6dff06f          	j	b284 <_calloc_r+0xf4>
    b31c:	00052823          	sw	zero,16(a0)
    b320:	01850793          	add	a5,a0,24
    b324:	00052a23          	sw	zero,20(a0)
    b328:	ef5ff06f          	j	b21c <_calloc_r+0x8c>
    b32c:	01412483          	lw	s1,20(sp)
    b330:	01012903          	lw	s2,16(sp)
    b334:	00c12983          	lw	s3,12(sp)
    b338:	df5ff0ef          	jal	b12c <__errno>
    b33c:	00c00793          	li	a5,12
    b340:	00f52023          	sw	a5,0(a0)
    b344:	00000413          	li	s0,0
    b348:	fa9ff06f          	j	b2f0 <_calloc_r+0x160>

0000b34c <_wcsnrtombs_l>:
    b34c:	fa010113          	add	sp,sp,-96
    b350:	04912a23          	sw	s1,84(sp)
    b354:	05212823          	sw	s2,80(sp)
    b358:	05312623          	sw	s3,76(sp)
    b35c:	05412423          	sw	s4,72(sp)
    b360:	05512223          	sw	s5,68(sp)
    b364:	04112e23          	sw	ra,92(sp)
    b368:	03912a23          	sw	s9,52(sp)
    b36c:	03a12823          	sw	s10,48(sp)
    b370:	00a12623          	sw	a0,12(sp)
    b374:	00058a13          	mv	s4,a1
    b378:	00060a93          	mv	s5,a2
    b37c:	00070913          	mv	s2,a4
    b380:	00080993          	mv	s3,a6
    b384:	00078493          	mv	s1,a5
    b388:	12078063          	beqz	a5,b4a8 <_wcsnrtombs_l+0x15c>
    b38c:	000aac83          	lw	s9,0(s5)
    b390:	120a0263          	beqz	s4,b4b4 <_wcsnrtombs_l+0x168>
    b394:	14090e63          	beqz	s2,b4f0 <_wcsnrtombs_l+0x1a4>
    b398:	05612023          	sw	s6,64(sp)
    b39c:	fff68b13          	add	s6,a3,-1
    b3a0:	16068063          	beqz	a3,b500 <_wcsnrtombs_l+0x1b4>
    b3a4:	04812c23          	sw	s0,88(sp)
    b3a8:	03b12623          	sw	s11,44(sp)
    b3ac:	03712e23          	sw	s7,60(sp)
    b3b0:	03812c23          	sw	s8,56(sp)
    b3b4:	000a0413          	mv	s0,s4
    b3b8:	00000d13          	li	s10,0
    b3bc:	fff00d93          	li	s11,-1
    b3c0:	0240006f          	j	b3e4 <_wcsnrtombs_l+0x98>
    b3c4:	080a1a63          	bnez	s4,b458 <_wcsnrtombs_l+0x10c>
    b3c8:	000ca783          	lw	a5,0(s9)
    b3cc:	004c8c93          	add	s9,s9,4
    b3d0:	0c078263          	beqz	a5,b494 <_wcsnrtombs_l+0x148>
    b3d4:	1326f263          	bgeu	a3,s2,b4f8 <_wcsnrtombs_l+0x1ac>
    b3d8:	fffb0b13          	add	s6,s6,-1
    b3dc:	00068d13          	mv	s10,a3
    b3e0:	03bb0c63          	beq	s6,s11,b418 <_wcsnrtombs_l+0xcc>
    b3e4:	0e09a783          	lw	a5,224(s3)
    b3e8:	000ca603          	lw	a2,0(s9)
    b3ec:	00c12503          	lw	a0,12(sp)
    b3f0:	00048693          	mv	a3,s1
    b3f4:	01410593          	add	a1,sp,20
    b3f8:	0004ac03          	lw	s8,0(s1)
    b3fc:	0044ab83          	lw	s7,4(s1)
    b400:	000780e7          	jalr	a5
    b404:	0bb50e63          	beq	a0,s11,b4c0 <_wcsnrtombs_l+0x174>
    b408:	01a506b3          	add	a3,a0,s10
    b40c:	fad97ce3          	bgeu	s2,a3,b3c4 <_wcsnrtombs_l+0x78>
    b410:	0184a023          	sw	s8,0(s1)
    b414:	0174a223          	sw	s7,4(s1)
    b418:	05812403          	lw	s0,88(sp)
    b41c:	04012b03          	lw	s6,64(sp)
    b420:	03c12b83          	lw	s7,60(sp)
    b424:	03812c03          	lw	s8,56(sp)
    b428:	02c12d83          	lw	s11,44(sp)
    b42c:	05c12083          	lw	ra,92(sp)
    b430:	05412483          	lw	s1,84(sp)
    b434:	05012903          	lw	s2,80(sp)
    b438:	04c12983          	lw	s3,76(sp)
    b43c:	04812a03          	lw	s4,72(sp)
    b440:	04412a83          	lw	s5,68(sp)
    b444:	03412c83          	lw	s9,52(sp)
    b448:	000d0513          	mv	a0,s10
    b44c:	03012d03          	lw	s10,48(sp)
    b450:	06010113          	add	sp,sp,96
    b454:	00008067          	ret
    b458:	08a05063          	blez	a0,b4d8 <_wcsnrtombs_l+0x18c>
    b45c:	01410893          	add	a7,sp,20
    b460:	00a40533          	add	a0,s0,a0
    b464:	0008c783          	lbu	a5,0(a7)
    b468:	00140413          	add	s0,s0,1
    b46c:	00188893          	add	a7,a7,1
    b470:	fef40fa3          	sb	a5,-1(s0)
    b474:	fe8518e3          	bne	a0,s0,b464 <_wcsnrtombs_l+0x118>
    b478:	000aa783          	lw	a5,0(s5)
    b47c:	00050413          	mv	s0,a0
    b480:	00478793          	add	a5,a5,4
    b484:	00faa023          	sw	a5,0(s5)
    b488:	000ca783          	lw	a5,0(s9)
    b48c:	004c8c93          	add	s9,s9,4
    b490:	f40792e3          	bnez	a5,b3d4 <_wcsnrtombs_l+0x88>
    b494:	000a0463          	beqz	s4,b49c <_wcsnrtombs_l+0x150>
    b498:	000aa023          	sw	zero,0(s5)
    b49c:	0004a023          	sw	zero,0(s1)
    b4a0:	fff68d13          	add	s10,a3,-1
    b4a4:	f75ff06f          	j	b418 <_wcsnrtombs_l+0xcc>
    b4a8:	000aac83          	lw	s9,0(s5)
    b4ac:	10c50493          	add	s1,a0,268
    b4b0:	ee0a12e3          	bnez	s4,b394 <_wcsnrtombs_l+0x48>
    b4b4:	05612023          	sw	s6,64(sp)
    b4b8:	fff00913          	li	s2,-1
    b4bc:	ee1ff06f          	j	b39c <_wcsnrtombs_l+0x50>
    b4c0:	00c12703          	lw	a4,12(sp)
    b4c4:	08a00793          	li	a5,138
    b4c8:	fff00d13          	li	s10,-1
    b4cc:	00f72023          	sw	a5,0(a4)
    b4d0:	0004a023          	sw	zero,0(s1)
    b4d4:	f45ff06f          	j	b418 <_wcsnrtombs_l+0xcc>
    b4d8:	000aa783          	lw	a5,0(s5)
    b4dc:	00040513          	mv	a0,s0
    b4e0:	00050413          	mv	s0,a0
    b4e4:	00478793          	add	a5,a5,4
    b4e8:	00faa023          	sw	a5,0(s5)
    b4ec:	f9dff06f          	j	b488 <_wcsnrtombs_l+0x13c>
    b4f0:	00000d13          	li	s10,0
    b4f4:	f39ff06f          	j	b42c <_wcsnrtombs_l+0xe0>
    b4f8:	00068d13          	mv	s10,a3
    b4fc:	f1dff06f          	j	b418 <_wcsnrtombs_l+0xcc>
    b500:	04012b03          	lw	s6,64(sp)
    b504:	00000d13          	li	s10,0
    b508:	f25ff06f          	j	b42c <_wcsnrtombs_l+0xe0>

0000b50c <_wcsnrtombs_r>:
    b50c:	7fff5817          	auipc	a6,0x7fff5
    b510:	02880813          	add	a6,a6,40 # 80000534 <__global_locale>
    b514:	7fff5517          	auipc	a0,0x7fff5
    b518:	1f452503          	lw	a0,500(a0) # 80000708 <_impure_ptr>
    b51c:	e31ff06f          	j	b34c <_wcsnrtombs_l>

0000b520 <fiprintf>:
    b520:	fc010113          	add	sp,sp,-64
    b524:	02810313          	add	t1,sp,40
    b528:	02c12423          	sw	a2,40(sp)
    b52c:	02d12623          	sw	a3,44(sp)
    b530:	00058613          	mv	a2,a1
    b534:	00030693          	mv	a3,t1
    b538:	00050593          	mv	a1,a0
    b53c:	7fff5517          	auipc	a0,0x7fff5
    b540:	1cc52503          	lw	a0,460(a0) # 80000708 <_impure_ptr>
    b544:	00112e23          	sw	ra,28(sp)
    b548:	02e12823          	sw	a4,48(sp)
    b54c:	02f12a23          	sw	a5,52(sp)
    b550:	03012c23          	sw	a6,56(sp)
    b554:	03112e23          	sw	a7,60(sp)
    b558:	00612623          	sw	t1,12(sp)
    b55c:	9a1f90ef          	jal	4efc <_vfiprintf_r>
    b560:	01c12083          	lw	ra,28(sp)
    b564:	04010113          	add	sp,sp,64
    b568:	00008067          	ret

0000b56c <abort>:
    b56c:	ff010113          	add	sp,sp,-16
    b570:	00600513          	li	a0,6
    b574:	00112623          	sw	ra,12(sp)
    b578:	00c000ef          	jal	b584 <raise>
    b57c:	00100513          	li	a0,1
    b580:	f14f50ef          	jal	c94 <_exit>

0000b584 <raise>:
    b584:	ff010113          	add	sp,sp,-16
    b588:	00912223          	sw	s1,4(sp)
    b58c:	00112623          	sw	ra,12(sp)
    b590:	01f00793          	li	a5,31
    b594:	7fff5497          	auipc	s1,0x7fff5
    b598:	1744a483          	lw	s1,372(s1) # 80000708 <_impure_ptr>
    b59c:	08a7ee63          	bltu	a5,a0,b638 <raise+0xb4>
    b5a0:	1184a783          	lw	a5,280(s1)
    b5a4:	00812423          	sw	s0,8(sp)
    b5a8:	00050413          	mv	s0,a0
    b5ac:	04078263          	beqz	a5,b5f0 <raise+0x6c>
    b5b0:	00251713          	sll	a4,a0,0x2
    b5b4:	00e787b3          	add	a5,a5,a4
    b5b8:	0007a703          	lw	a4,0(a5)
    b5bc:	02070a63          	beqz	a4,b5f0 <raise+0x6c>
    b5c0:	00100693          	li	a3,1
    b5c4:	00d70a63          	beq	a4,a3,b5d8 <raise+0x54>
    b5c8:	fff00693          	li	a3,-1
    b5cc:	04d70663          	beq	a4,a3,b618 <raise+0x94>
    b5d0:	0007a023          	sw	zero,0(a5)
    b5d4:	000700e7          	jalr	a4
    b5d8:	00812403          	lw	s0,8(sp)
    b5dc:	00000513          	li	a0,0
    b5e0:	00c12083          	lw	ra,12(sp)
    b5e4:	00412483          	lw	s1,4(sp)
    b5e8:	01010113          	add	sp,sp,16
    b5ec:	00008067          	ret
    b5f0:	00048513          	mv	a0,s1
    b5f4:	0b4000ef          	jal	b6a8 <_getpid_r>
    b5f8:	00040613          	mv	a2,s0
    b5fc:	00812403          	lw	s0,8(sp)
    b600:	00c12083          	lw	ra,12(sp)
    b604:	00050593          	mv	a1,a0
    b608:	00048513          	mv	a0,s1
    b60c:	00412483          	lw	s1,4(sp)
    b610:	01010113          	add	sp,sp,16
    b614:	0340006f          	j	b648 <_kill_r>
    b618:	00812403          	lw	s0,8(sp)
    b61c:	00c12083          	lw	ra,12(sp)
    b620:	01600793          	li	a5,22
    b624:	00f4a023          	sw	a5,0(s1)
    b628:	00100513          	li	a0,1
    b62c:	00412483          	lw	s1,4(sp)
    b630:	01010113          	add	sp,sp,16
    b634:	00008067          	ret
    b638:	01600793          	li	a5,22
    b63c:	00f4a023          	sw	a5,0(s1)
    b640:	fff00513          	li	a0,-1
    b644:	f9dff06f          	j	b5e0 <raise+0x5c>

0000b648 <_kill_r>:
    b648:	ff010113          	add	sp,sp,-16
    b64c:	00058713          	mv	a4,a1
    b650:	00812423          	sw	s0,8(sp)
    b654:	00060593          	mv	a1,a2
    b658:	00050413          	mv	s0,a0
    b65c:	00070513          	mv	a0,a4
    b660:	7fff5797          	auipc	a5,0x7fff5
    b664:	0a07ac23          	sw	zero,184(a5) # 80000718 <errno>
    b668:	00112623          	sw	ra,12(sp)
    b66c:	e60f50ef          	jal	ccc <_kill>
    b670:	fff00793          	li	a5,-1
    b674:	00f50a63          	beq	a0,a5,b688 <_kill_r+0x40>
    b678:	00c12083          	lw	ra,12(sp)
    b67c:	00812403          	lw	s0,8(sp)
    b680:	01010113          	add	sp,sp,16
    b684:	00008067          	ret
    b688:	7fff5797          	auipc	a5,0x7fff5
    b68c:	0907a783          	lw	a5,144(a5) # 80000718 <errno>
    b690:	fe0784e3          	beqz	a5,b678 <_kill_r+0x30>
    b694:	00c12083          	lw	ra,12(sp)
    b698:	00f42023          	sw	a5,0(s0)
    b69c:	00812403          	lw	s0,8(sp)
    b6a0:	01010113          	add	sp,sp,16
    b6a4:	00008067          	ret

0000b6a8 <_getpid_r>:
    b6a8:	e14f506f          	j	cbc <_getpid>

0000b6ac <__udivdi3>:
    b6ac:	fd010113          	add	sp,sp,-48
    b6b0:	01312e23          	sw	s3,28(sp)
    b6b4:	02112623          	sw	ra,44(sp)
    b6b8:	01612823          	sw	s6,16(sp)
    b6bc:	00050993          	mv	s3,a0
    b6c0:	16069663          	bnez	a3,b82c <__udivdi3+0x180>
    b6c4:	02812423          	sw	s0,40(sp)
    b6c8:	01512a23          	sw	s5,20(sp)
    b6cc:	02912223          	sw	s1,36(sp)
    b6d0:	03212023          	sw	s2,32(sp)
    b6d4:	01412c23          	sw	s4,24(sp)
    b6d8:	00060a93          	mv	s5,a2
    b6dc:	00050413          	mv	s0,a0
    b6e0:	1cc5f063          	bgeu	a1,a2,b8a0 <__udivdi3+0x1f4>
    b6e4:	000107b7          	lui	a5,0x10
    b6e8:	00058493          	mv	s1,a1
    b6ec:	2af66e63          	bltu	a2,a5,b9a8 <__udivdi3+0x2fc>
    b6f0:	010007b7          	lui	a5,0x1000
    b6f4:	01800713          	li	a4,24
    b6f8:	00f67463          	bgeu	a2,a5,b700 <__udivdi3+0x54>
    b6fc:	01000713          	li	a4,16
    b700:	00e656b3          	srl	a3,a2,a4
    b704:	00004797          	auipc	a5,0x4
    b708:	35478793          	add	a5,a5,852 # fa58 <__clz_tab>
    b70c:	00d787b3          	add	a5,a5,a3
    b710:	0007c783          	lbu	a5,0(a5)
    b714:	02000693          	li	a3,32
    b718:	00e787b3          	add	a5,a5,a4
    b71c:	40f68733          	sub	a4,a3,a5
    b720:	00f68c63          	beq	a3,a5,b738 <__udivdi3+0x8c>
    b724:	00e594b3          	sll	s1,a1,a4
    b728:	00f9d7b3          	srl	a5,s3,a5
    b72c:	00e61ab3          	sll	s5,a2,a4
    b730:	0097e4b3          	or	s1,a5,s1
    b734:	00e99433          	sll	s0,s3,a4
    b738:	010ada13          	srl	s4,s5,0x10
    b73c:	000a0593          	mv	a1,s4
    b740:	00048513          	mv	a0,s1
    b744:	010a9b13          	sll	s6,s5,0x10
    b748:	7fc030ef          	jal	ef44 <__hidden___udivsi3>
    b74c:	010b5b13          	srl	s6,s6,0x10
    b750:	00050593          	mv	a1,a0
    b754:	00050913          	mv	s2,a0
    b758:	000b0513          	mv	a0,s6
    b75c:	724030ef          	jal	ee80 <__mulsi3>
    b760:	00050793          	mv	a5,a0
    b764:	000a0593          	mv	a1,s4
    b768:	00048513          	mv	a0,s1
    b76c:	00078493          	mv	s1,a5
    b770:	01d030ef          	jal	ef8c <__umodsi3>
    b774:	01051513          	sll	a0,a0,0x10
    b778:	01045793          	srl	a5,s0,0x10
    b77c:	00a7e7b3          	or	a5,a5,a0
    b780:	0097fc63          	bgeu	a5,s1,b798 <__udivdi3+0xec>
    b784:	00fa87b3          	add	a5,s5,a5
    b788:	fff90713          	add	a4,s2,-1 # efff <__clzsi2+0xf>
    b78c:	0157e463          	bltu	a5,s5,b794 <__udivdi3+0xe8>
    b790:	5a97e863          	bltu	a5,s1,bd40 <__udivdi3+0x694>
    b794:	00070913          	mv	s2,a4
    b798:	409784b3          	sub	s1,a5,s1
    b79c:	000a0593          	mv	a1,s4
    b7a0:	00048513          	mv	a0,s1
    b7a4:	7a0030ef          	jal	ef44 <__hidden___udivsi3>
    b7a8:	00050593          	mv	a1,a0
    b7ac:	00050993          	mv	s3,a0
    b7b0:	000b0513          	mv	a0,s6
    b7b4:	6cc030ef          	jal	ee80 <__mulsi3>
    b7b8:	00050793          	mv	a5,a0
    b7bc:	000a0593          	mv	a1,s4
    b7c0:	00048513          	mv	a0,s1
    b7c4:	01041413          	sll	s0,s0,0x10
    b7c8:	00078493          	mv	s1,a5
    b7cc:	7c0030ef          	jal	ef8c <__umodsi3>
    b7d0:	01051513          	sll	a0,a0,0x10
    b7d4:	01045413          	srl	s0,s0,0x10
    b7d8:	00a46433          	or	s0,s0,a0
    b7dc:	00947c63          	bgeu	s0,s1,b7f4 <__udivdi3+0x148>
    b7e0:	008a8433          	add	s0,s5,s0
    b7e4:	fff98793          	add	a5,s3,-1
    b7e8:	4d546e63          	bltu	s0,s5,bcc4 <__udivdi3+0x618>
    b7ec:	ffe98993          	add	s3,s3,-2
    b7f0:	4c947a63          	bgeu	s0,s1,bcc4 <__udivdi3+0x618>
    b7f4:	01091613          	sll	a2,s2,0x10
    b7f8:	01366533          	or	a0,a2,s3
    b7fc:	00000b13          	li	s6,0
    b800:	02812403          	lw	s0,40(sp)
    b804:	02c12083          	lw	ra,44(sp)
    b808:	02412483          	lw	s1,36(sp)
    b80c:	02012903          	lw	s2,32(sp)
    b810:	01812a03          	lw	s4,24(sp)
    b814:	01412a83          	lw	s5,20(sp)
    b818:	01c12983          	lw	s3,28(sp)
    b81c:	000b0593          	mv	a1,s6
    b820:	01012b03          	lw	s6,16(sp)
    b824:	03010113          	add	sp,sp,48
    b828:	00008067          	ret
    b82c:	02d5f263          	bgeu	a1,a3,b850 <__udivdi3+0x1a4>
    b830:	00000b13          	li	s6,0
    b834:	00000513          	li	a0,0
    b838:	02c12083          	lw	ra,44(sp)
    b83c:	01c12983          	lw	s3,28(sp)
    b840:	000b0593          	mv	a1,s6
    b844:	01012b03          	lw	s6,16(sp)
    b848:	03010113          	add	sp,sp,48
    b84c:	00008067          	ret
    b850:	000107b7          	lui	a5,0x10
    b854:	26f6ee63          	bltu	a3,a5,bad0 <__udivdi3+0x424>
    b858:	01000737          	lui	a4,0x1000
    b85c:	01800793          	li	a5,24
    b860:	00e6f463          	bgeu	a3,a4,b868 <__udivdi3+0x1bc>
    b864:	01000793          	li	a5,16
    b868:	00f6d533          	srl	a0,a3,a5
    b86c:	00004717          	auipc	a4,0x4
    b870:	1ec70713          	add	a4,a4,492 # fa58 <__clz_tab>
    b874:	00a70733          	add	a4,a4,a0
    b878:	00074703          	lbu	a4,0(a4)
    b87c:	02000513          	li	a0,32
    b880:	00f70733          	add	a4,a4,a5
    b884:	40e50b33          	sub	s6,a0,a4
    b888:	26e51c63          	bne	a0,a4,bb00 <__udivdi3+0x454>
    b88c:	46b6ee63          	bltu	a3,a1,bd08 <__udivdi3+0x65c>
    b890:	00c9b533          	sltu	a0,s3,a2
    b894:	00153513          	seqz	a0,a0
    b898:	00000b13          	li	s6,0
    b89c:	f9dff06f          	j	b838 <__udivdi3+0x18c>
    b8a0:	10060c63          	beqz	a2,b9b8 <__udivdi3+0x30c>
    b8a4:	000107b7          	lui	a5,0x10
    b8a8:	44f67663          	bgeu	a2,a5,bcf4 <__udivdi3+0x648>
    b8ac:	10063713          	sltiu	a4,a2,256
    b8b0:	00173713          	seqz	a4,a4
    b8b4:	00371713          	sll	a4,a4,0x3
    b8b8:	00e656b3          	srl	a3,a2,a4
    b8bc:	00004797          	auipc	a5,0x4
    b8c0:	19c78793          	add	a5,a5,412 # fa58 <__clz_tab>
    b8c4:	00d787b3          	add	a5,a5,a3
    b8c8:	0007c483          	lbu	s1,0(a5)
    b8cc:	02000793          	li	a5,32
    b8d0:	00e484b3          	add	s1,s1,a4
    b8d4:	40978733          	sub	a4,a5,s1
    b8d8:	10979463          	bne	a5,s1,b9e0 <__udivdi3+0x334>
    b8dc:	01061a13          	sll	s4,a2,0x10
    b8e0:	40c584b3          	sub	s1,a1,a2
    b8e4:	01065913          	srl	s2,a2,0x10
    b8e8:	010a5a13          	srl	s4,s4,0x10
    b8ec:	00100b13          	li	s6,1
    b8f0:	00090593          	mv	a1,s2
    b8f4:	00048513          	mv	a0,s1
    b8f8:	64c030ef          	jal	ef44 <__hidden___udivsi3>
    b8fc:	000a0593          	mv	a1,s4
    b900:	00050993          	mv	s3,a0
    b904:	57c030ef          	jal	ee80 <__mulsi3>
    b908:	00050793          	mv	a5,a0
    b90c:	00090593          	mv	a1,s2
    b910:	00048513          	mv	a0,s1
    b914:	00078493          	mv	s1,a5
    b918:	674030ef          	jal	ef8c <__umodsi3>
    b91c:	01051513          	sll	a0,a0,0x10
    b920:	01045793          	srl	a5,s0,0x10
    b924:	00a7e7b3          	or	a5,a5,a0
    b928:	0097fc63          	bgeu	a5,s1,b940 <__udivdi3+0x294>
    b92c:	00fa87b3          	add	a5,s5,a5
    b930:	fff98713          	add	a4,s3,-1
    b934:	0157e463          	bltu	a5,s5,b93c <__udivdi3+0x290>
    b938:	3e97ee63          	bltu	a5,s1,bd34 <__udivdi3+0x688>
    b93c:	00070993          	mv	s3,a4
    b940:	409784b3          	sub	s1,a5,s1
    b944:	00090593          	mv	a1,s2
    b948:	00048513          	mv	a0,s1
    b94c:	5f8030ef          	jal	ef44 <__hidden___udivsi3>
    b950:	000a0593          	mv	a1,s4
    b954:	00050a13          	mv	s4,a0
    b958:	528030ef          	jal	ee80 <__mulsi3>
    b95c:	00050793          	mv	a5,a0
    b960:	00090593          	mv	a1,s2
    b964:	00048513          	mv	a0,s1
    b968:	01041413          	sll	s0,s0,0x10
    b96c:	00078493          	mv	s1,a5
    b970:	61c030ef          	jal	ef8c <__umodsi3>
    b974:	01051513          	sll	a0,a0,0x10
    b978:	01045413          	srl	s0,s0,0x10
    b97c:	00a46433          	or	s0,s0,a0
    b980:	00947e63          	bgeu	s0,s1,b99c <__udivdi3+0x2f0>
    b984:	008a8433          	add	s0,s5,s0
    b988:	fffa0793          	add	a5,s4,-1
    b98c:	01546663          	bltu	s0,s5,b998 <__udivdi3+0x2ec>
    b990:	ffea0a13          	add	s4,s4,-2
    b994:	00946463          	bltu	s0,s1,b99c <__udivdi3+0x2f0>
    b998:	00078a13          	mv	s4,a5
    b99c:	01099613          	sll	a2,s3,0x10
    b9a0:	01466533          	or	a0,a2,s4
    b9a4:	e5dff06f          	j	b800 <__udivdi3+0x154>
    b9a8:	10063713          	sltiu	a4,a2,256
    b9ac:	00173713          	seqz	a4,a4
    b9b0:	00371713          	sll	a4,a4,0x3
    b9b4:	d4dff06f          	j	b700 <__udivdi3+0x54>
    b9b8:	00000693          	li	a3,0
    b9bc:	00004797          	auipc	a5,0x4
    b9c0:	09c78793          	add	a5,a5,156 # fa58 <__clz_tab>
    b9c4:	00d787b3          	add	a5,a5,a3
    b9c8:	0007c483          	lbu	s1,0(a5)
    b9cc:	00000713          	li	a4,0
    b9d0:	02000793          	li	a5,32
    b9d4:	00e484b3          	add	s1,s1,a4
    b9d8:	40978733          	sub	a4,a5,s1
    b9dc:	f09780e3          	beq	a5,s1,b8dc <__udivdi3+0x230>
    b9e0:	00e61ab3          	sll	s5,a2,a4
    b9e4:	01712623          	sw	s7,12(sp)
    b9e8:	010ad913          	srl	s2,s5,0x10
    b9ec:	0095dbb3          	srl	s7,a1,s1
    b9f0:	00e597b3          	sll	a5,a1,a4
    b9f4:	0099d4b3          	srl	s1,s3,s1
    b9f8:	00090593          	mv	a1,s2
    b9fc:	000b8513          	mv	a0,s7
    ba00:	010a9a13          	sll	s4,s5,0x10
    ba04:	00f4e4b3          	or	s1,s1,a5
    ba08:	00e99433          	sll	s0,s3,a4
    ba0c:	010a5a13          	srl	s4,s4,0x10
    ba10:	534030ef          	jal	ef44 <__hidden___udivsi3>
    ba14:	00050593          	mv	a1,a0
    ba18:	00050b13          	mv	s6,a0
    ba1c:	000a0513          	mv	a0,s4
    ba20:	460030ef          	jal	ee80 <__mulsi3>
    ba24:	00050993          	mv	s3,a0
    ba28:	00090593          	mv	a1,s2
    ba2c:	000b8513          	mv	a0,s7
    ba30:	55c030ef          	jal	ef8c <__umodsi3>
    ba34:	01051513          	sll	a0,a0,0x10
    ba38:	0104d793          	srl	a5,s1,0x10
    ba3c:	00a7e7b3          	or	a5,a5,a0
    ba40:	0137fe63          	bgeu	a5,s3,ba5c <__udivdi3+0x3b0>
    ba44:	00fa87b3          	add	a5,s5,a5
    ba48:	fffb0713          	add	a4,s6,-1
    ba4c:	2d57ec63          	bltu	a5,s5,bd24 <__udivdi3+0x678>
    ba50:	2d37fa63          	bgeu	a5,s3,bd24 <__udivdi3+0x678>
    ba54:	ffeb0b13          	add	s6,s6,-2
    ba58:	015787b3          	add	a5,a5,s5
    ba5c:	413789b3          	sub	s3,a5,s3
    ba60:	00090593          	mv	a1,s2
    ba64:	00098513          	mv	a0,s3
    ba68:	4dc030ef          	jal	ef44 <__hidden___udivsi3>
    ba6c:	00050593          	mv	a1,a0
    ba70:	00050b93          	mv	s7,a0
    ba74:	000a0513          	mv	a0,s4
    ba78:	408030ef          	jal	ee80 <__mulsi3>
    ba7c:	00050793          	mv	a5,a0
    ba80:	00090593          	mv	a1,s2
    ba84:	00098513          	mv	a0,s3
    ba88:	01049493          	sll	s1,s1,0x10
    ba8c:	00078993          	mv	s3,a5
    ba90:	4fc030ef          	jal	ef8c <__umodsi3>
    ba94:	01051513          	sll	a0,a0,0x10
    ba98:	0104d493          	srl	s1,s1,0x10
    ba9c:	00a4e4b3          	or	s1,s1,a0
    baa0:	0134fe63          	bgeu	s1,s3,babc <__udivdi3+0x410>
    baa4:	009a84b3          	add	s1,s5,s1
    baa8:	fffb8793          	add	a5,s7,-1
    baac:	2754e463          	bltu	s1,s5,bd14 <__udivdi3+0x668>
    bab0:	2734f263          	bgeu	s1,s3,bd14 <__udivdi3+0x668>
    bab4:	ffeb8b93          	add	s7,s7,-2
    bab8:	015484b3          	add	s1,s1,s5
    babc:	010b1b13          	sll	s6,s6,0x10
    bac0:	017b6b33          	or	s6,s6,s7
    bac4:	413484b3          	sub	s1,s1,s3
    bac8:	00c12b83          	lw	s7,12(sp)
    bacc:	e25ff06f          	j	b8f0 <__udivdi3+0x244>
    bad0:	1006b793          	sltiu	a5,a3,256
    bad4:	0017b793          	seqz	a5,a5
    bad8:	00379793          	sll	a5,a5,0x3
    badc:	00f6d533          	srl	a0,a3,a5
    bae0:	00004717          	auipc	a4,0x4
    bae4:	f7870713          	add	a4,a4,-136 # fa58 <__clz_tab>
    bae8:	00a70733          	add	a4,a4,a0
    baec:	00074703          	lbu	a4,0(a4)
    baf0:	02000513          	li	a0,32
    baf4:	00f70733          	add	a4,a4,a5
    baf8:	40e50b33          	sub	s6,a0,a4
    bafc:	d8e508e3          	beq	a0,a4,b88c <__udivdi3+0x1e0>
    bb00:	016696b3          	sll	a3,a3,s6
    bb04:	01912223          	sw	s9,4(sp)
    bb08:	00e65cb3          	srl	s9,a2,a4
    bb0c:	00dcecb3          	or	s9,s9,a3
    bb10:	01512a23          	sw	s5,20(sp)
    bb14:	01712623          	sw	s7,12(sp)
    bb18:	010cda93          	srl	s5,s9,0x10
    bb1c:	00e5dbb3          	srl	s7,a1,a4
    bb20:	016597b3          	sll	a5,a1,s6
    bb24:	00e9d733          	srl	a4,s3,a4
    bb28:	01812423          	sw	s8,8(sp)
    bb2c:	000a8593          	mv	a1,s5
    bb30:	000b8513          	mv	a0,s7
    bb34:	010c9c13          	sll	s8,s9,0x10
    bb38:	02812423          	sw	s0,40(sp)
    bb3c:	02912223          	sw	s1,36(sp)
    bb40:	03212023          	sw	s2,32(sp)
    bb44:	00f764b3          	or	s1,a4,a5
    bb48:	01661933          	sll	s2,a2,s6
    bb4c:	01412c23          	sw	s4,24(sp)
    bb50:	010c5c13          	srl	s8,s8,0x10
    bb54:	3f0030ef          	jal	ef44 <__hidden___udivsi3>
    bb58:	00050593          	mv	a1,a0
    bb5c:	00050413          	mv	s0,a0
    bb60:	000c0513          	mv	a0,s8
    bb64:	31c030ef          	jal	ee80 <__mulsi3>
    bb68:	00050a13          	mv	s4,a0
    bb6c:	000a8593          	mv	a1,s5
    bb70:	000b8513          	mv	a0,s7
    bb74:	418030ef          	jal	ef8c <__umodsi3>
    bb78:	01051513          	sll	a0,a0,0x10
    bb7c:	0104d793          	srl	a5,s1,0x10
    bb80:	00a7e7b3          	or	a5,a5,a0
    bb84:	0147fe63          	bgeu	a5,s4,bba0 <__udivdi3+0x4f4>
    bb88:	00fc87b3          	add	a5,s9,a5
    bb8c:	fff40713          	add	a4,s0,-1
    bb90:	1997ee63          	bltu	a5,s9,bd2c <__udivdi3+0x680>
    bb94:	1947fc63          	bgeu	a5,s4,bd2c <__udivdi3+0x680>
    bb98:	ffe40413          	add	s0,s0,-2
    bb9c:	019787b3          	add	a5,a5,s9
    bba0:	41478a33          	sub	s4,a5,s4
    bba4:	000a8593          	mv	a1,s5
    bba8:	000a0513          	mv	a0,s4
    bbac:	398030ef          	jal	ef44 <__hidden___udivsi3>
    bbb0:	00050593          	mv	a1,a0
    bbb4:	00050b93          	mv	s7,a0
    bbb8:	000c0513          	mv	a0,s8
    bbbc:	2c4030ef          	jal	ee80 <__mulsi3>
    bbc0:	00050793          	mv	a5,a0
    bbc4:	000a8593          	mv	a1,s5
    bbc8:	000a0513          	mv	a0,s4
    bbcc:	00078a13          	mv	s4,a5
    bbd0:	3bc030ef          	jal	ef8c <__umodsi3>
    bbd4:	01049713          	sll	a4,s1,0x10
    bbd8:	01051513          	sll	a0,a0,0x10
    bbdc:	01075713          	srl	a4,a4,0x10
    bbe0:	00a76733          	or	a4,a4,a0
    bbe4:	01477e63          	bgeu	a4,s4,bc00 <__udivdi3+0x554>
    bbe8:	00ec8733          	add	a4,s9,a4
    bbec:	fffb8793          	add	a5,s7,-1
    bbf0:	13976663          	bltu	a4,s9,bd1c <__udivdi3+0x670>
    bbf4:	13477463          	bgeu	a4,s4,bd1c <__udivdi3+0x670>
    bbf8:	ffeb8b93          	add	s7,s7,-2
    bbfc:	01970733          	add	a4,a4,s9
    bc00:	00010e37          	lui	t3,0x10
    bc04:	01041413          	sll	s0,s0,0x10
    bc08:	01746433          	or	s0,s0,s7
    bc0c:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    bc10:	00f47833          	and	a6,s0,a5
    bc14:	00f977b3          	and	a5,s2,a5
    bc18:	41470733          	sub	a4,a4,s4
    bc1c:	01045e93          	srl	t4,s0,0x10
    bc20:	01095913          	srl	s2,s2,0x10
    bc24:	00080513          	mv	a0,a6
    bc28:	00078593          	mv	a1,a5
    bc2c:	254030ef          	jal	ee80 <__mulsi3>
    bc30:	00050313          	mv	t1,a0
    bc34:	00090593          	mv	a1,s2
    bc38:	00080513          	mv	a0,a6
    bc3c:	244030ef          	jal	ee80 <__mulsi3>
    bc40:	00050813          	mv	a6,a0
    bc44:	00078593          	mv	a1,a5
    bc48:	000e8513          	mv	a0,t4
    bc4c:	234030ef          	jal	ee80 <__mulsi3>
    bc50:	00050893          	mv	a7,a0
    bc54:	00090593          	mv	a1,s2
    bc58:	000e8513          	mv	a0,t4
    bc5c:	224030ef          	jal	ee80 <__mulsi3>
    bc60:	01035793          	srl	a5,t1,0x10
    bc64:	01180833          	add	a6,a6,a7
    bc68:	010787b3          	add	a5,a5,a6
    bc6c:	0117f463          	bgeu	a5,a7,bc74 <__udivdi3+0x5c8>
    bc70:	01c50533          	add	a0,a0,t3
    bc74:	0107d693          	srl	a3,a5,0x10
    bc78:	00a686b3          	add	a3,a3,a0
    bc7c:	06d76863          	bltu	a4,a3,bcec <__udivdi3+0x640>
    bc80:	04d70663          	beq	a4,a3,bccc <__udivdi3+0x620>
    bc84:	00040513          	mv	a0,s0
    bc88:	02812403          	lw	s0,40(sp)
    bc8c:	02c12083          	lw	ra,44(sp)
    bc90:	00000b13          	li	s6,0
    bc94:	02412483          	lw	s1,36(sp)
    bc98:	02012903          	lw	s2,32(sp)
    bc9c:	01812a03          	lw	s4,24(sp)
    bca0:	01412a83          	lw	s5,20(sp)
    bca4:	00c12b83          	lw	s7,12(sp)
    bca8:	00812c03          	lw	s8,8(sp)
    bcac:	00412c83          	lw	s9,4(sp)
    bcb0:	01c12983          	lw	s3,28(sp)
    bcb4:	000b0593          	mv	a1,s6
    bcb8:	01012b03          	lw	s6,16(sp)
    bcbc:	03010113          	add	sp,sp,48
    bcc0:	00008067          	ret
    bcc4:	00078993          	mv	s3,a5
    bcc8:	b2dff06f          	j	b7f4 <__udivdi3+0x148>
    bccc:	00010737          	lui	a4,0x10
    bcd0:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    bcd4:	00e7f7b3          	and	a5,a5,a4
    bcd8:	01079793          	sll	a5,a5,0x10
    bcdc:	00e37333          	and	t1,t1,a4
    bce0:	01699533          	sll	a0,s3,s6
    bce4:	006787b3          	add	a5,a5,t1
    bce8:	f8f57ee3          	bgeu	a0,a5,bc84 <__udivdi3+0x5d8>
    bcec:	fff40513          	add	a0,s0,-1
    bcf0:	f99ff06f          	j	bc88 <__udivdi3+0x5dc>
    bcf4:	010007b7          	lui	a5,0x1000
    bcf8:	04f67a63          	bgeu	a2,a5,bd4c <__udivdi3+0x6a0>
    bcfc:	01065693          	srl	a3,a2,0x10
    bd00:	01000713          	li	a4,16
    bd04:	bb9ff06f          	j	b8bc <__udivdi3+0x210>
    bd08:	00000b13          	li	s6,0
    bd0c:	00100513          	li	a0,1
    bd10:	b29ff06f          	j	b838 <__udivdi3+0x18c>
    bd14:	00078b93          	mv	s7,a5
    bd18:	da5ff06f          	j	babc <__udivdi3+0x410>
    bd1c:	00078b93          	mv	s7,a5
    bd20:	ee1ff06f          	j	bc00 <__udivdi3+0x554>
    bd24:	00070b13          	mv	s6,a4
    bd28:	d35ff06f          	j	ba5c <__udivdi3+0x3b0>
    bd2c:	00070413          	mv	s0,a4
    bd30:	e71ff06f          	j	bba0 <__udivdi3+0x4f4>
    bd34:	ffe98993          	add	s3,s3,-2
    bd38:	015787b3          	add	a5,a5,s5
    bd3c:	c05ff06f          	j	b940 <__udivdi3+0x294>
    bd40:	ffe90913          	add	s2,s2,-2
    bd44:	015787b3          	add	a5,a5,s5
    bd48:	a51ff06f          	j	b798 <__udivdi3+0xec>
    bd4c:	01865693          	srl	a3,a2,0x18
    bd50:	01800713          	li	a4,24
    bd54:	b69ff06f          	j	b8bc <__udivdi3+0x210>

0000bd58 <__umoddi3>:
    bd58:	fd010113          	add	sp,sp,-48
    bd5c:	02112623          	sw	ra,44(sp)
    bd60:	00050793          	mv	a5,a0
    bd64:	14069663          	bnez	a3,beb0 <__umoddi3+0x158>
    bd68:	03212023          	sw	s2,32(sp)
    bd6c:	01412c23          	sw	s4,24(sp)
    bd70:	02812423          	sw	s0,40(sp)
    bd74:	02912223          	sw	s1,36(sp)
    bd78:	01312e23          	sw	s3,28(sp)
    bd7c:	01512a23          	sw	s5,20(sp)
    bd80:	00060a13          	mv	s4,a2
    bd84:	00050913          	mv	s2,a0
    bd88:	1ac5f663          	bgeu	a1,a2,bf34 <__umoddi3+0x1dc>
    bd8c:	01612823          	sw	s6,16(sp)
    bd90:	00010737          	lui	a4,0x10
    bd94:	00058993          	mv	s3,a1
    bd98:	28e66063          	bltu	a2,a4,c018 <__umoddi3+0x2c0>
    bd9c:	01000737          	lui	a4,0x1000
    bda0:	01800693          	li	a3,24
    bda4:	00e67463          	bgeu	a2,a4,bdac <__umoddi3+0x54>
    bda8:	01000693          	li	a3,16
    bdac:	00d65533          	srl	a0,a2,a3
    bdb0:	00004717          	auipc	a4,0x4
    bdb4:	ca870713          	add	a4,a4,-856 # fa58 <__clz_tab>
    bdb8:	00a70733          	add	a4,a4,a0
    bdbc:	00074703          	lbu	a4,0(a4)
    bdc0:	02000513          	li	a0,32
    bdc4:	00d70733          	add	a4,a4,a3
    bdc8:	40e504b3          	sub	s1,a0,a4
    bdcc:	00e50c63          	beq	a0,a4,bde4 <__umoddi3+0x8c>
    bdd0:	009599b3          	sll	s3,a1,s1
    bdd4:	00e7d733          	srl	a4,a5,a4
    bdd8:	00961a33          	sll	s4,a2,s1
    bddc:	013769b3          	or	s3,a4,s3
    bde0:	00979933          	sll	s2,a5,s1
    bde4:	010a5a93          	srl	s5,s4,0x10
    bde8:	000a8593          	mv	a1,s5
    bdec:	00098513          	mv	a0,s3
    bdf0:	010a1b13          	sll	s6,s4,0x10
    bdf4:	150030ef          	jal	ef44 <__hidden___udivsi3>
    bdf8:	010b5b13          	srl	s6,s6,0x10
    bdfc:	000b0593          	mv	a1,s6
    be00:	080030ef          	jal	ee80 <__mulsi3>
    be04:	00050413          	mv	s0,a0
    be08:	000a8593          	mv	a1,s5
    be0c:	00098513          	mv	a0,s3
    be10:	17c030ef          	jal	ef8c <__umodsi3>
    be14:	01051513          	sll	a0,a0,0x10
    be18:	01095793          	srl	a5,s2,0x10
    be1c:	00a7e7b3          	or	a5,a5,a0
    be20:	0087f863          	bgeu	a5,s0,be30 <__umoddi3+0xd8>
    be24:	00fa07b3          	add	a5,s4,a5
    be28:	0147e463          	bltu	a5,s4,be30 <__umoddi3+0xd8>
    be2c:	5687e863          	bltu	a5,s0,c39c <__umoddi3+0x644>
    be30:	40878433          	sub	s0,a5,s0
    be34:	000a8593          	mv	a1,s5
    be38:	00040513          	mv	a0,s0
    be3c:	108030ef          	jal	ef44 <__hidden___udivsi3>
    be40:	000b0593          	mv	a1,s6
    be44:	03c030ef          	jal	ee80 <__mulsi3>
    be48:	00050793          	mv	a5,a0
    be4c:	000a8593          	mv	a1,s5
    be50:	00040513          	mv	a0,s0
    be54:	00078413          	mv	s0,a5
    be58:	134030ef          	jal	ef8c <__umodsi3>
    be5c:	01091793          	sll	a5,s2,0x10
    be60:	01051513          	sll	a0,a0,0x10
    be64:	0107d793          	srl	a5,a5,0x10
    be68:	00a7e7b3          	or	a5,a5,a0
    be6c:	0087f863          	bgeu	a5,s0,be7c <__umoddi3+0x124>
    be70:	00fa07b3          	add	a5,s4,a5
    be74:	0147e463          	bltu	a5,s4,be7c <__umoddi3+0x124>
    be78:	5087ea63          	bltu	a5,s0,c38c <__umoddi3+0x634>
    be7c:	01012b03          	lw	s6,16(sp)
    be80:	408787b3          	sub	a5,a5,s0
    be84:	0097d533          	srl	a0,a5,s1
    be88:	02812403          	lw	s0,40(sp)
    be8c:	02412483          	lw	s1,36(sp)
    be90:	02012903          	lw	s2,32(sp)
    be94:	01c12983          	lw	s3,28(sp)
    be98:	01812a03          	lw	s4,24(sp)
    be9c:	01412a83          	lw	s5,20(sp)
    bea0:	00000593          	li	a1,0
    bea4:	02c12083          	lw	ra,44(sp)
    bea8:	03010113          	add	sp,sp,48
    beac:	00008067          	ret
    beb0:	00050893          	mv	a7,a0
    beb4:	fed5e8e3          	bltu	a1,a3,bea4 <__umoddi3+0x14c>
    beb8:	03212023          	sw	s2,32(sp)
    bebc:	01312e23          	sw	s3,28(sp)
    bec0:	00010737          	lui	a4,0x10
    bec4:	00058813          	mv	a6,a1
    bec8:	24e6ec63          	bltu	a3,a4,c120 <__umoddi3+0x3c8>
    becc:	01000737          	lui	a4,0x1000
    bed0:	01800513          	li	a0,24
    bed4:	00e6f463          	bgeu	a3,a4,bedc <__umoddi3+0x184>
    bed8:	01000513          	li	a0,16
    bedc:	00a6d333          	srl	t1,a3,a0
    bee0:	00004717          	auipc	a4,0x4
    bee4:	b7870713          	add	a4,a4,-1160 # fa58 <__clz_tab>
    bee8:	00670733          	add	a4,a4,t1
    beec:	00074703          	lbu	a4,0(a4)
    bef0:	02000313          	li	t1,32
    bef4:	00a709b3          	add	s3,a4,a0
    bef8:	41330933          	sub	s2,t1,s3
    befc:	25331a63          	bne	t1,s3,c150 <__umoddi3+0x3f8>
    bf00:	00b6e463          	bltu	a3,a1,bf08 <__umoddi3+0x1b0>
    bf04:	00c7ea63          	bltu	a5,a2,bf18 <__umoddi3+0x1c0>
    bf08:	40c788b3          	sub	a7,a5,a2
    bf0c:	40d586b3          	sub	a3,a1,a3
    bf10:	0117b833          	sltu	a6,a5,a7
    bf14:	41068833          	sub	a6,a3,a6
    bf18:	02c12083          	lw	ra,44(sp)
    bf1c:	02012903          	lw	s2,32(sp)
    bf20:	01c12983          	lw	s3,28(sp)
    bf24:	00088513          	mv	a0,a7
    bf28:	00080593          	mv	a1,a6
    bf2c:	03010113          	add	sp,sp,48
    bf30:	00008067          	ret
    bf34:	0e060a63          	beqz	a2,c028 <__umoddi3+0x2d0>
    bf38:	00010737          	lui	a4,0x10
    bf3c:	42e67663          	bgeu	a2,a4,c368 <__umoddi3+0x610>
    bf40:	10063693          	sltiu	a3,a2,256
    bf44:	0016b693          	seqz	a3,a3
    bf48:	00369693          	sll	a3,a3,0x3
    bf4c:	00d65533          	srl	a0,a2,a3
    bf50:	00004717          	auipc	a4,0x4
    bf54:	b0870713          	add	a4,a4,-1272 # fa58 <__clz_tab>
    bf58:	00a70733          	add	a4,a4,a0
    bf5c:	00074983          	lbu	s3,0(a4)
    bf60:	02000713          	li	a4,32
    bf64:	00d989b3          	add	s3,s3,a3
    bf68:	413704b3          	sub	s1,a4,s3
    bf6c:	0f371263          	bne	a4,s3,c050 <__umoddi3+0x2f8>
    bf70:	01061413          	sll	s0,a2,0x10
    bf74:	40c589b3          	sub	s3,a1,a2
    bf78:	01065a93          	srl	s5,a2,0x10
    bf7c:	01045413          	srl	s0,s0,0x10
    bf80:	000a8593          	mv	a1,s5
    bf84:	00098513          	mv	a0,s3
    bf88:	7bd020ef          	jal	ef44 <__hidden___udivsi3>
    bf8c:	00040593          	mv	a1,s0
    bf90:	6f1020ef          	jal	ee80 <__mulsi3>
    bf94:	00050793          	mv	a5,a0
    bf98:	000a8593          	mv	a1,s5
    bf9c:	00098513          	mv	a0,s3
    bfa0:	00078993          	mv	s3,a5
    bfa4:	7e9020ef          	jal	ef8c <__umodsi3>
    bfa8:	01051513          	sll	a0,a0,0x10
    bfac:	01095793          	srl	a5,s2,0x10
    bfb0:	00a7e7b3          	or	a5,a5,a0
    bfb4:	0137f863          	bgeu	a5,s3,bfc4 <__umoddi3+0x26c>
    bfb8:	00fa07b3          	add	a5,s4,a5
    bfbc:	0147e463          	bltu	a5,s4,bfc4 <__umoddi3+0x26c>
    bfc0:	3d37ea63          	bltu	a5,s3,c394 <__umoddi3+0x63c>
    bfc4:	413789b3          	sub	s3,a5,s3
    bfc8:	000a8593          	mv	a1,s5
    bfcc:	00098513          	mv	a0,s3
    bfd0:	775020ef          	jal	ef44 <__hidden___udivsi3>
    bfd4:	00040593          	mv	a1,s0
    bfd8:	6a9020ef          	jal	ee80 <__mulsi3>
    bfdc:	00050413          	mv	s0,a0
    bfe0:	000a8593          	mv	a1,s5
    bfe4:	00098513          	mv	a0,s3
    bfe8:	7a5020ef          	jal	ef8c <__umodsi3>
    bfec:	01091913          	sll	s2,s2,0x10
    bff0:	01051793          	sll	a5,a0,0x10
    bff4:	01095913          	srl	s2,s2,0x10
    bff8:	00f967b3          	or	a5,s2,a5
    bffc:	0087fa63          	bgeu	a5,s0,c010 <__umoddi3+0x2b8>
    c000:	00fa07b3          	add	a5,s4,a5
    c004:	0147e663          	bltu	a5,s4,c010 <__umoddi3+0x2b8>
    c008:	0087f463          	bgeu	a5,s0,c010 <__umoddi3+0x2b8>
    c00c:	014787b3          	add	a5,a5,s4
    c010:	408787b3          	sub	a5,a5,s0
    c014:	e71ff06f          	j	be84 <__umoddi3+0x12c>
    c018:	10063693          	sltiu	a3,a2,256
    c01c:	0016b693          	seqz	a3,a3
    c020:	00369693          	sll	a3,a3,0x3
    c024:	d89ff06f          	j	bdac <__umoddi3+0x54>
    c028:	00000513          	li	a0,0
    c02c:	00004717          	auipc	a4,0x4
    c030:	a2c70713          	add	a4,a4,-1492 # fa58 <__clz_tab>
    c034:	00a70733          	add	a4,a4,a0
    c038:	00074983          	lbu	s3,0(a4)
    c03c:	00000693          	li	a3,0
    c040:	02000713          	li	a4,32
    c044:	00d989b3          	add	s3,s3,a3
    c048:	413704b3          	sub	s1,a4,s3
    c04c:	f33702e3          	beq	a4,s3,bf70 <__umoddi3+0x218>
    c050:	00961a33          	sll	s4,a2,s1
    c054:	01712623          	sw	s7,12(sp)
    c058:	010a5a93          	srl	s5,s4,0x10
    c05c:	0135dbb3          	srl	s7,a1,s3
    c060:	00959733          	sll	a4,a1,s1
    c064:	0137d9b3          	srl	s3,a5,s3
    c068:	000a8593          	mv	a1,s5
    c06c:	000b8513          	mv	a0,s7
    c070:	010a1413          	sll	s0,s4,0x10
    c074:	00e9e9b3          	or	s3,s3,a4
    c078:	00979933          	sll	s2,a5,s1
    c07c:	01612823          	sw	s6,16(sp)
    c080:	01045413          	srl	s0,s0,0x10
    c084:	6c1020ef          	jal	ef44 <__hidden___udivsi3>
    c088:	00040593          	mv	a1,s0
    c08c:	5f5020ef          	jal	ee80 <__mulsi3>
    c090:	00050b13          	mv	s6,a0
    c094:	000a8593          	mv	a1,s5
    c098:	000b8513          	mv	a0,s7
    c09c:	6f1020ef          	jal	ef8c <__umodsi3>
    c0a0:	01051513          	sll	a0,a0,0x10
    c0a4:	0109d793          	srl	a5,s3,0x10
    c0a8:	00a7e7b3          	or	a5,a5,a0
    c0ac:	0167fa63          	bgeu	a5,s6,c0c0 <__umoddi3+0x368>
    c0b0:	00fa07b3          	add	a5,s4,a5
    c0b4:	0147e663          	bltu	a5,s4,c0c0 <__umoddi3+0x368>
    c0b8:	0167f463          	bgeu	a5,s6,c0c0 <__umoddi3+0x368>
    c0bc:	014787b3          	add	a5,a5,s4
    c0c0:	41678b33          	sub	s6,a5,s6
    c0c4:	000a8593          	mv	a1,s5
    c0c8:	000b0513          	mv	a0,s6
    c0cc:	679020ef          	jal	ef44 <__hidden___udivsi3>
    c0d0:	00040593          	mv	a1,s0
    c0d4:	5ad020ef          	jal	ee80 <__mulsi3>
    c0d8:	00050793          	mv	a5,a0
    c0dc:	000a8593          	mv	a1,s5
    c0e0:	000b0513          	mv	a0,s6
    c0e4:	01099993          	sll	s3,s3,0x10
    c0e8:	00078b13          	mv	s6,a5
    c0ec:	6a1020ef          	jal	ef8c <__umodsi3>
    c0f0:	01051513          	sll	a0,a0,0x10
    c0f4:	0109d993          	srl	s3,s3,0x10
    c0f8:	00a9e9b3          	or	s3,s3,a0
    c0fc:	0169fa63          	bgeu	s3,s6,c110 <__umoddi3+0x3b8>
    c100:	013a09b3          	add	s3,s4,s3
    c104:	0149e663          	bltu	s3,s4,c110 <__umoddi3+0x3b8>
    c108:	0169f463          	bgeu	s3,s6,c110 <__umoddi3+0x3b8>
    c10c:	014989b3          	add	s3,s3,s4
    c110:	416989b3          	sub	s3,s3,s6
    c114:	00c12b83          	lw	s7,12(sp)
    c118:	01012b03          	lw	s6,16(sp)
    c11c:	e65ff06f          	j	bf80 <__umoddi3+0x228>
    c120:	1006b513          	sltiu	a0,a3,256
    c124:	00153513          	seqz	a0,a0
    c128:	00351513          	sll	a0,a0,0x3
    c12c:	00a6d333          	srl	t1,a3,a0
    c130:	00004717          	auipc	a4,0x4
    c134:	92870713          	add	a4,a4,-1752 # fa58 <__clz_tab>
    c138:	00670733          	add	a4,a4,t1
    c13c:	00074703          	lbu	a4,0(a4)
    c140:	02000313          	li	t1,32
    c144:	00a709b3          	add	s3,a4,a0
    c148:	41330933          	sub	s2,t1,s3
    c14c:	db330ae3          	beq	t1,s3,bf00 <__umoddi3+0x1a8>
    c150:	01512a23          	sw	s5,20(sp)
    c154:	012696b3          	sll	a3,a3,s2
    c158:	01365ab3          	srl	s5,a2,s3
    c15c:	00daeab3          	or	s5,s5,a3
    c160:	01712623          	sw	s7,12(sp)
    c164:	01a12023          	sw	s10,0(sp)
    c168:	010adb93          	srl	s7,s5,0x10
    c16c:	0135dd33          	srl	s10,a1,s3
    c170:	01259733          	sll	a4,a1,s2
    c174:	0137d6b3          	srl	a3,a5,s3
    c178:	01912223          	sw	s9,4(sp)
    c17c:	000b8593          	mv	a1,s7
    c180:	000d0513          	mv	a0,s10
    c184:	010a9c93          	sll	s9,s5,0x10
    c188:	02812423          	sw	s0,40(sp)
    c18c:	02912223          	sw	s1,36(sp)
    c190:	01261433          	sll	s0,a2,s2
    c194:	012794b3          	sll	s1,a5,s2
    c198:	01412c23          	sw	s4,24(sp)
    c19c:	01612823          	sw	s6,16(sp)
    c1a0:	00e6ea33          	or	s4,a3,a4
    c1a4:	01812423          	sw	s8,8(sp)
    c1a8:	010cdc93          	srl	s9,s9,0x10
    c1ac:	599020ef          	jal	ef44 <__hidden___udivsi3>
    c1b0:	00050593          	mv	a1,a0
    c1b4:	00050b13          	mv	s6,a0
    c1b8:	000c8513          	mv	a0,s9
    c1bc:	4c5020ef          	jal	ee80 <__mulsi3>
    c1c0:	00050c13          	mv	s8,a0
    c1c4:	000b8593          	mv	a1,s7
    c1c8:	000d0513          	mv	a0,s10
    c1cc:	5c1020ef          	jal	ef8c <__umodsi3>
    c1d0:	01051513          	sll	a0,a0,0x10
    c1d4:	010a5793          	srl	a5,s4,0x10
    c1d8:	00a7e7b3          	or	a5,a5,a0
    c1dc:	0187fe63          	bgeu	a5,s8,c1f8 <__umoddi3+0x4a0>
    c1e0:	00fa87b3          	add	a5,s5,a5
    c1e4:	fffb0713          	add	a4,s6,-1
    c1e8:	1957ee63          	bltu	a5,s5,c384 <__umoddi3+0x62c>
    c1ec:	1987fc63          	bgeu	a5,s8,c384 <__umoddi3+0x62c>
    c1f0:	ffeb0b13          	add	s6,s6,-2
    c1f4:	015787b3          	add	a5,a5,s5
    c1f8:	41878c33          	sub	s8,a5,s8
    c1fc:	000b8593          	mv	a1,s7
    c200:	000c0513          	mv	a0,s8
    c204:	541020ef          	jal	ef44 <__hidden___udivsi3>
    c208:	00050593          	mv	a1,a0
    c20c:	00050d13          	mv	s10,a0
    c210:	000c8513          	mv	a0,s9
    c214:	46d020ef          	jal	ee80 <__mulsi3>
    c218:	00050793          	mv	a5,a0
    c21c:	000b8593          	mv	a1,s7
    c220:	000c0513          	mv	a0,s8
    c224:	00078b93          	mv	s7,a5
    c228:	565020ef          	jal	ef8c <__umodsi3>
    c22c:	010a1593          	sll	a1,s4,0x10
    c230:	01051513          	sll	a0,a0,0x10
    c234:	0105d593          	srl	a1,a1,0x10
    c238:	00a5e5b3          	or	a1,a1,a0
    c23c:	0175fe63          	bgeu	a1,s7,c258 <__umoddi3+0x500>
    c240:	00ba85b3          	add	a1,s5,a1
    c244:	fffd0793          	add	a5,s10,-1
    c248:	1355ea63          	bltu	a1,s5,c37c <__umoddi3+0x624>
    c24c:	1375f863          	bgeu	a1,s7,c37c <__umoddi3+0x624>
    c250:	ffed0d13          	add	s10,s10,-2
    c254:	015585b3          	add	a1,a1,s5
    c258:	010b1793          	sll	a5,s6,0x10
    c25c:	00010e37          	lui	t3,0x10
    c260:	01a7e7b3          	or	a5,a5,s10
    c264:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    c268:	0067f8b3          	and	a7,a5,t1
    c26c:	00647333          	and	t1,s0,t1
    c270:	41758733          	sub	a4,a1,s7
    c274:	0107d793          	srl	a5,a5,0x10
    c278:	01045e93          	srl	t4,s0,0x10
    c27c:	00088513          	mv	a0,a7
    c280:	00030593          	mv	a1,t1
    c284:	3fd020ef          	jal	ee80 <__mulsi3>
    c288:	00050813          	mv	a6,a0
    c28c:	000e8593          	mv	a1,t4
    c290:	00088513          	mv	a0,a7
    c294:	3ed020ef          	jal	ee80 <__mulsi3>
    c298:	00050893          	mv	a7,a0
    c29c:	00030593          	mv	a1,t1
    c2a0:	00078513          	mv	a0,a5
    c2a4:	3dd020ef          	jal	ee80 <__mulsi3>
    c2a8:	00050313          	mv	t1,a0
    c2ac:	000e8593          	mv	a1,t4
    c2b0:	00078513          	mv	a0,a5
    c2b4:	3cd020ef          	jal	ee80 <__mulsi3>
    c2b8:	01085793          	srl	a5,a6,0x10
    c2bc:	006888b3          	add	a7,a7,t1
    c2c0:	011787b3          	add	a5,a5,a7
    c2c4:	0067f463          	bgeu	a5,t1,c2cc <__umoddi3+0x574>
    c2c8:	01c50533          	add	a0,a0,t3
    c2cc:	00010637          	lui	a2,0x10
    c2d0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    c2d4:	0107d693          	srl	a3,a5,0x10
    c2d8:	00c7f7b3          	and	a5,a5,a2
    c2dc:	01079793          	sll	a5,a5,0x10
    c2e0:	00c87833          	and	a6,a6,a2
    c2e4:	00a686b3          	add	a3,a3,a0
    c2e8:	010787b3          	add	a5,a5,a6
    c2ec:	06d76263          	bltu	a4,a3,c350 <__umoddi3+0x5f8>
    c2f0:	04d70e63          	beq	a4,a3,c34c <__umoddi3+0x5f4>
    c2f4:	40f487b3          	sub	a5,s1,a5
    c2f8:	00f4b4b3          	sltu	s1,s1,a5
    c2fc:	02812403          	lw	s0,40(sp)
    c300:	02c12083          	lw	ra,44(sp)
    c304:	40d705b3          	sub	a1,a4,a3
    c308:	409585b3          	sub	a1,a1,s1
    c30c:	01359733          	sll	a4,a1,s3
    c310:	0127d7b3          	srl	a5,a5,s2
    c314:	02412483          	lw	s1,36(sp)
    c318:	01c12983          	lw	s3,28(sp)
    c31c:	01812a03          	lw	s4,24(sp)
    c320:	01412a83          	lw	s5,20(sp)
    c324:	01012b03          	lw	s6,16(sp)
    c328:	00c12b83          	lw	s7,12(sp)
    c32c:	00812c03          	lw	s8,8(sp)
    c330:	00412c83          	lw	s9,4(sp)
    c334:	00012d03          	lw	s10,0(sp)
    c338:	0125d5b3          	srl	a1,a1,s2
    c33c:	00f76533          	or	a0,a4,a5
    c340:	02012903          	lw	s2,32(sp)
    c344:	03010113          	add	sp,sp,48
    c348:	00008067          	ret
    c34c:	faf4f4e3          	bgeu	s1,a5,c2f4 <__umoddi3+0x59c>
    c350:	40878433          	sub	s0,a5,s0
    c354:	0087b7b3          	sltu	a5,a5,s0
    c358:	01578ab3          	add	s5,a5,s5
    c35c:	415686b3          	sub	a3,a3,s5
    c360:	00040793          	mv	a5,s0
    c364:	f91ff06f          	j	c2f4 <__umoddi3+0x59c>
    c368:	01000737          	lui	a4,0x1000
    c36c:	02e67c63          	bgeu	a2,a4,c3a4 <__umoddi3+0x64c>
    c370:	01065513          	srl	a0,a2,0x10
    c374:	01000693          	li	a3,16
    c378:	bd9ff06f          	j	bf50 <__umoddi3+0x1f8>
    c37c:	00078d13          	mv	s10,a5
    c380:	ed9ff06f          	j	c258 <__umoddi3+0x500>
    c384:	00070b13          	mv	s6,a4
    c388:	e71ff06f          	j	c1f8 <__umoddi3+0x4a0>
    c38c:	014787b3          	add	a5,a5,s4
    c390:	aedff06f          	j	be7c <__umoddi3+0x124>
    c394:	014787b3          	add	a5,a5,s4
    c398:	c2dff06f          	j	bfc4 <__umoddi3+0x26c>
    c39c:	014787b3          	add	a5,a5,s4
    c3a0:	a91ff06f          	j	be30 <__umoddi3+0xd8>
    c3a4:	01865513          	srl	a0,a2,0x18
    c3a8:	01800693          	li	a3,24
    c3ac:	ba5ff06f          	j	bf50 <__umoddi3+0x1f8>

0000c3b0 <__adddf3>:
    c3b0:	001007b7          	lui	a5,0x100
    c3b4:	fe010113          	add	sp,sp,-32
    c3b8:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c3bc:	00bef833          	and	a6,t4,a1
    c3c0:	00def7b3          	and	a5,t4,a3
    c3c4:	0146d313          	srl	t1,a3,0x14
    c3c8:	01212823          	sw	s2,16(sp)
    c3cc:	0145d913          	srl	s2,a1,0x14
    c3d0:	00379793          	sll	a5,a5,0x3
    c3d4:	00812c23          	sw	s0,24(sp)
    c3d8:	00381813          	sll	a6,a6,0x3
    c3dc:	01f5d413          	srl	s0,a1,0x1f
    c3e0:	01d55713          	srl	a4,a0,0x1d
    c3e4:	01d65893          	srl	a7,a2,0x1d
    c3e8:	7ff97913          	and	s2,s2,2047
    c3ec:	7ff37313          	and	t1,t1,2047
    c3f0:	00112e23          	sw	ra,28(sp)
    c3f4:	00912a23          	sw	s1,20(sp)
    c3f8:	01312623          	sw	s3,12(sp)
    c3fc:	01f6d693          	srl	a3,a3,0x1f
    c400:	00f8e8b3          	or	a7,a7,a5
    c404:	01076733          	or	a4,a4,a6
    c408:	00351593          	sll	a1,a0,0x3
    c40c:	00361f13          	sll	t5,a2,0x3
    c410:	406907b3          	sub	a5,s2,t1
    c414:	1ed40463          	beq	s0,a3,c5fc <__adddf3+0x24c>
    c418:	16f05263          	blez	a5,c57c <__adddf3+0x1cc>
    c41c:	28030663          	beqz	t1,c6a8 <__adddf3+0x2f8>
    c420:	7ff00693          	li	a3,2047
    c424:	42d90663          	beq	s2,a3,c850 <__adddf3+0x4a0>
    c428:	03800693          	li	a3,56
    c42c:	00100613          	li	a2,1
    c430:	02f6ce63          	blt	a3,a5,c46c <__adddf3+0xbc>
    c434:	008006b7          	lui	a3,0x800
    c438:	00d8e8b3          	or	a7,a7,a3
    c43c:	01f00693          	li	a3,31
    c440:	52f6ce63          	blt	a3,a5,c97c <__adddf3+0x5cc>
    c444:	02000693          	li	a3,32
    c448:	40f686b3          	sub	a3,a3,a5
    c44c:	00d89633          	sll	a2,a7,a3
    c450:	00ff5533          	srl	a0,t5,a5
    c454:	00df16b3          	sll	a3,t5,a3
    c458:	00a66633          	or	a2,a2,a0
    c45c:	00d036b3          	snez	a3,a3
    c460:	00f8d8b3          	srl	a7,a7,a5
    c464:	00d66633          	or	a2,a2,a3
    c468:	41170733          	sub	a4,a4,a7
    c46c:	40c58633          	sub	a2,a1,a2
    c470:	00c5b5b3          	sltu	a1,a1,a2
    c474:	00060493          	mv	s1,a2
    c478:	40b709b3          	sub	s3,a4,a1
    c47c:	00899793          	sll	a5,s3,0x8
    c480:	3207da63          	bgez	a5,c7b4 <__adddf3+0x404>
    c484:	008007b7          	lui	a5,0x800
    c488:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c48c:	00f9f9b3          	and	s3,s3,a5
    c490:	2c098863          	beqz	s3,c760 <__adddf3+0x3b0>
    c494:	00098513          	mv	a0,s3
    c498:	359020ef          	jal	eff0 <__clzsi2>
    c49c:	ff850793          	add	a5,a0,-8
    c4a0:	02000693          	li	a3,32
    c4a4:	40f68733          	sub	a4,a3,a5
    c4a8:	00e4d733          	srl	a4,s1,a4
    c4ac:	00f999b3          	sll	s3,s3,a5
    c4b0:	01376733          	or	a4,a4,s3
    c4b4:	00f494b3          	sll	s1,s1,a5
    c4b8:	4b27c863          	blt	a5,s2,c968 <__adddf3+0x5b8>
    c4bc:	412787b3          	sub	a5,a5,s2
    c4c0:	00178793          	add	a5,a5,1
    c4c4:	40f686b3          	sub	a3,a3,a5
    c4c8:	00d49633          	sll	a2,s1,a3
    c4cc:	00f4d9b3          	srl	s3,s1,a5
    c4d0:	00c03633          	snez	a2,a2
    c4d4:	01366633          	or	a2,a2,s3
    c4d8:	00d716b3          	sll	a3,a4,a3
    c4dc:	00c6e4b3          	or	s1,a3,a2
    c4e0:	00f759b3          	srl	s3,a4,a5
    c4e4:	00000913          	li	s2,0
    c4e8:	0074f793          	and	a5,s1,7
    c4ec:	02078063          	beqz	a5,c50c <__adddf3+0x15c>
    c4f0:	00f4f793          	and	a5,s1,15
    c4f4:	00400713          	li	a4,4
    c4f8:	00e78a63          	beq	a5,a4,c50c <__adddf3+0x15c>
    c4fc:	00448793          	add	a5,s1,4
    c500:	0097b633          	sltu	a2,a5,s1
    c504:	00c989b3          	add	s3,s3,a2
    c508:	00078493          	mv	s1,a5
    c50c:	00899793          	sll	a5,s3,0x8
    c510:	6e07da63          	bgez	a5,cc04 <__adddf3+0x854>
    c514:	00190793          	add	a5,s2,1
    c518:	7ff00713          	li	a4,2047
    c51c:	00040e13          	mv	t3,s0
    c520:	2ae78663          	beq	a5,a4,c7cc <__adddf3+0x41c>
    c524:	ff800737          	lui	a4,0xff800
    c528:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c52c:	00e9f733          	and	a4,s3,a4
    c530:	7ff7f793          	and	a5,a5,2047
    c534:	01d71813          	sll	a6,a4,0x1d
    c538:	0034d613          	srl	a2,s1,0x3
    c53c:	00971713          	sll	a4,a4,0x9
    c540:	00c86833          	or	a6,a6,a2
    c544:	00c75713          	srl	a4,a4,0xc
    c548:	01c12083          	lw	ra,28(sp)
    c54c:	01812403          	lw	s0,24(sp)
    c550:	01479793          	sll	a5,a5,0x14
    c554:	00e7e7b3          	or	a5,a5,a4
    c558:	01fe1713          	sll	a4,t3,0x1f
    c55c:	00e7e7b3          	or	a5,a5,a4
    c560:	01412483          	lw	s1,20(sp)
    c564:	01012903          	lw	s2,16(sp)
    c568:	00c12983          	lw	s3,12(sp)
    c56c:	00080513          	mv	a0,a6
    c570:	00078593          	mv	a1,a5
    c574:	02010113          	add	sp,sp,32
    c578:	00008067          	ret
    c57c:	14078c63          	beqz	a5,c6d4 <__adddf3+0x324>
    c580:	412307b3          	sub	a5,t1,s2
    c584:	3c091263          	bnez	s2,c948 <__adddf3+0x598>
    c588:	00b76533          	or	a0,a4,a1
    c58c:	4c050463          	beqz	a0,ca54 <__adddf3+0x6a4>
    c590:	fff78513          	add	a0,a5,-1
    c594:	60050263          	beqz	a0,cb98 <__adddf3+0x7e8>
    c598:	7ff00813          	li	a6,2047
    c59c:	57078663          	beq	a5,a6,cb08 <__adddf3+0x758>
    c5a0:	03800793          	li	a5,56
    c5a4:	00100613          	li	a2,1
    c5a8:	02a7cc63          	blt	a5,a0,c5e0 <__adddf3+0x230>
    c5ac:	00050793          	mv	a5,a0
    c5b0:	01f00613          	li	a2,31
    c5b4:	56f64c63          	blt	a2,a5,cb2c <__adddf3+0x77c>
    c5b8:	02000513          	li	a0,32
    c5bc:	40f50533          	sub	a0,a0,a5
    c5c0:	00a71633          	sll	a2,a4,a0
    c5c4:	00f5d833          	srl	a6,a1,a5
    c5c8:	00a59533          	sll	a0,a1,a0
    c5cc:	01066633          	or	a2,a2,a6
    c5d0:	00a03533          	snez	a0,a0
    c5d4:	00f75733          	srl	a4,a4,a5
    c5d8:	00a66633          	or	a2,a2,a0
    c5dc:	40e888b3          	sub	a7,a7,a4
    c5e0:	40cf0633          	sub	a2,t5,a2
    c5e4:	00cf3733          	sltu	a4,t5,a2
    c5e8:	00060493          	mv	s1,a2
    c5ec:	40e889b3          	sub	s3,a7,a4
    c5f0:	00030913          	mv	s2,t1
    c5f4:	00068413          	mv	s0,a3
    c5f8:	e85ff06f          	j	c47c <__adddf3+0xcc>
    c5fc:	1ef05063          	blez	a5,c7dc <__adddf3+0x42c>
    c600:	14031063          	bnez	t1,c740 <__adddf3+0x390>
    c604:	01e8e6b3          	or	a3,a7,t5
    c608:	26068c63          	beqz	a3,c880 <__adddf3+0x4d0>
    c60c:	fff78693          	add	a3,a5,-1
    c610:	48068063          	beqz	a3,ca90 <__adddf3+0x6e0>
    c614:	7ff00613          	li	a2,2047
    c618:	22c78c63          	beq	a5,a2,c850 <__adddf3+0x4a0>
    c61c:	03800793          	li	a5,56
    c620:	00100993          	li	s3,1
    c624:	02d7cc63          	blt	a5,a3,c65c <__adddf3+0x2ac>
    c628:	00068793          	mv	a5,a3
    c62c:	01f00693          	li	a3,31
    c630:	4af6c063          	blt	a3,a5,cad0 <__adddf3+0x720>
    c634:	02000693          	li	a3,32
    c638:	40f686b3          	sub	a3,a3,a5
    c63c:	00d899b3          	sll	s3,a7,a3
    c640:	00ff5633          	srl	a2,t5,a5
    c644:	00df16b3          	sll	a3,t5,a3
    c648:	00c9e9b3          	or	s3,s3,a2
    c64c:	00d036b3          	snez	a3,a3
    c650:	00f8d8b3          	srl	a7,a7,a5
    c654:	00d9e9b3          	or	s3,s3,a3
    c658:	01170733          	add	a4,a4,a7
    c65c:	00b985b3          	add	a1,s3,a1
    c660:	0135b9b3          	sltu	s3,a1,s3
    c664:	00058493          	mv	s1,a1
    c668:	00e989b3          	add	s3,s3,a4
    c66c:	00899793          	sll	a5,s3,0x8
    c670:	1407d263          	bgez	a5,c7b4 <__adddf3+0x404>
    c674:	00190913          	add	s2,s2,1
    c678:	7ff00793          	li	a5,2047
    c67c:	36f90c63          	beq	s2,a5,c9f4 <__adddf3+0x644>
    c680:	ff8007b7          	lui	a5,0xff800
    c684:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c688:	0014f613          	and	a2,s1,1
    c68c:	00f9f7b3          	and	a5,s3,a5
    c690:	0014d713          	srl	a4,s1,0x1
    c694:	00c76733          	or	a4,a4,a2
    c698:	01f79613          	sll	a2,a5,0x1f
    c69c:	00e664b3          	or	s1,a2,a4
    c6a0:	0017d993          	srl	s3,a5,0x1
    c6a4:	e45ff06f          	j	c4e8 <__adddf3+0x138>
    c6a8:	01e8e6b3          	or	a3,a7,t5
    c6ac:	1c068a63          	beqz	a3,c880 <__adddf3+0x4d0>
    c6b0:	fff78693          	add	a3,a5,-1
    c6b4:	40068063          	beqz	a3,cab4 <__adddf3+0x704>
    c6b8:	7ff00613          	li	a2,2047
    c6bc:	18c78a63          	beq	a5,a2,c850 <__adddf3+0x4a0>
    c6c0:	03800793          	li	a5,56
    c6c4:	00100613          	li	a2,1
    c6c8:	dad7c2e3          	blt	a5,a3,c46c <__adddf3+0xbc>
    c6cc:	00068793          	mv	a5,a3
    c6d0:	d6dff06f          	j	c43c <__adddf3+0x8c>
    c6d4:	00190813          	add	a6,s2,1
    c6d8:	7fe87813          	and	a6,a6,2046
    c6dc:	22081c63          	bnez	a6,c914 <__adddf3+0x564>
    c6e0:	00b76333          	or	t1,a4,a1
    c6e4:	01e8e833          	or	a6,a7,t5
    c6e8:	38091063          	bnez	s2,ca68 <__adddf3+0x6b8>
    c6ec:	46030e63          	beqz	t1,cb68 <__adddf3+0x7b8>
    c6f0:	40080663          	beqz	a6,cafc <__adddf3+0x74c>
    c6f4:	41e589b3          	sub	s3,a1,t5
    c6f8:	0135b533          	sltu	a0,a1,s3
    c6fc:	41170633          	sub	a2,a4,a7
    c700:	40a60633          	sub	a2,a2,a0
    c704:	00861513          	sll	a0,a2,0x8
    c708:	50055e63          	bgez	a0,cc24 <__adddf3+0x874>
    c70c:	40bf05b3          	sub	a1,t5,a1
    c710:	40e88733          	sub	a4,a7,a4
    c714:	00bf3f33          	sltu	t5,t5,a1
    c718:	41e70733          	sub	a4,a4,t5
    c71c:	00871613          	sll	a2,a4,0x8
    c720:	00058493          	mv	s1,a1
    c724:	52065e63          	bgez	a2,cc60 <__adddf3+0x8b0>
    c728:	ff8007b7          	lui	a5,0xff800
    c72c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c730:	00f77733          	and	a4,a4,a5
    c734:	00068e13          	mv	t3,a3
    c738:	00100793          	li	a5,1
    c73c:	df9ff06f          	j	c534 <__adddf3+0x184>
    c740:	7ff00693          	li	a3,2047
    c744:	10d90663          	beq	s2,a3,c850 <__adddf3+0x4a0>
    c748:	03800693          	li	a3,56
    c74c:	00100993          	li	s3,1
    c750:	f0f6c6e3          	blt	a3,a5,c65c <__adddf3+0x2ac>
    c754:	008006b7          	lui	a3,0x800
    c758:	00d8e8b3          	or	a7,a7,a3
    c75c:	ed1ff06f          	j	c62c <__adddf3+0x27c>
    c760:	00048513          	mv	a0,s1
    c764:	08d020ef          	jal	eff0 <__clzsi2>
    c768:	01850793          	add	a5,a0,24
    c76c:	01f00693          	li	a3,31
    c770:	d2f6d8e3          	bge	a3,a5,c4a0 <__adddf3+0xf0>
    c774:	ff850713          	add	a4,a0,-8
    c778:	00e49733          	sll	a4,s1,a4
    c77c:	2327c663          	blt	a5,s2,c9a8 <__adddf3+0x5f8>
    c780:	41278933          	sub	s2,a5,s2
    c784:	00190793          	add	a5,s2,1
    c788:	48f6d663          	bge	a3,a5,cc14 <__adddf3+0x864>
    c78c:	fe190913          	add	s2,s2,-31
    c790:	02000693          	li	a3,32
    c794:	012754b3          	srl	s1,a4,s2
    c798:	00d78c63          	beq	a5,a3,c7b0 <__adddf3+0x400>
    c79c:	04000693          	li	a3,64
    c7a0:	40f687b3          	sub	a5,a3,a5
    c7a4:	00f71733          	sll	a4,a4,a5
    c7a8:	00e03733          	snez	a4,a4
    c7ac:	00e4e4b3          	or	s1,s1,a4
    c7b0:	00000913          	li	s2,0
    c7b4:	0074f793          	and	a5,s1,7
    c7b8:	d2079ce3          	bnez	a5,c4f0 <__adddf3+0x140>
    c7bc:	00090793          	mv	a5,s2
    c7c0:	0034d613          	srl	a2,s1,0x3
    c7c4:	00098713          	mv	a4,s3
    c7c8:	0c00006f          	j	c888 <__adddf3+0x4d8>
    c7cc:	7ff00793          	li	a5,2047
    c7d0:	00000713          	li	a4,0
    c7d4:	00000813          	li	a6,0
    c7d8:	d71ff06f          	j	c548 <__adddf3+0x198>
    c7dc:	0c078a63          	beqz	a5,c8b0 <__adddf3+0x500>
    c7e0:	412307b3          	sub	a5,t1,s2
    c7e4:	1e090263          	beqz	s2,c9c8 <__adddf3+0x618>
    c7e8:	7ff00693          	li	a3,2047
    c7ec:	32d30863          	beq	t1,a3,cb1c <__adddf3+0x76c>
    c7f0:	03800693          	li	a3,56
    c7f4:	00100993          	li	s3,1
    c7f8:	02f6ce63          	blt	a3,a5,c834 <__adddf3+0x484>
    c7fc:	008006b7          	lui	a3,0x800
    c800:	00d76733          	or	a4,a4,a3
    c804:	01f00693          	li	a3,31
    c808:	3cf6c863          	blt	a3,a5,cbd8 <__adddf3+0x828>
    c80c:	02000693          	li	a3,32
    c810:	40f686b3          	sub	a3,a3,a5
    c814:	00d719b3          	sll	s3,a4,a3
    c818:	00f5d633          	srl	a2,a1,a5
    c81c:	00d596b3          	sll	a3,a1,a3
    c820:	00c9e9b3          	or	s3,s3,a2
    c824:	00d036b3          	snez	a3,a3
    c828:	00f75733          	srl	a4,a4,a5
    c82c:	00d9e9b3          	or	s3,s3,a3
    c830:	00e888b3          	add	a7,a7,a4
    c834:	01e98733          	add	a4,s3,t5
    c838:	013739b3          	sltu	s3,a4,s3
    c83c:	00070493          	mv	s1,a4
    c840:	011989b3          	add	s3,s3,a7
    c844:	00030913          	mv	s2,t1
    c848:	e25ff06f          	j	c66c <__adddf3+0x2bc>
    c84c:	02081063          	bnez	a6,c86c <__adddf3+0x4bc>
    c850:	00351613          	sll	a2,a0,0x3
    c854:	00365613          	srl	a2,a2,0x3
    c858:	01d71813          	sll	a6,a4,0x1d
    c85c:	00c86833          	or	a6,a6,a2
    c860:	00375713          	srl	a4,a4,0x3
    c864:	01076733          	or	a4,a4,a6
    c868:	18070663          	beqz	a4,c9f4 <__adddf3+0x644>
    c86c:	00000e13          	li	t3,0
    c870:	7ff00793          	li	a5,2047
    c874:	00080737          	lui	a4,0x80
    c878:	00000813          	li	a6,0
    c87c:	ccdff06f          	j	c548 <__adddf3+0x198>
    c880:	00351613          	sll	a2,a0,0x3
    c884:	00365613          	srl	a2,a2,0x3
    c888:	01d71813          	sll	a6,a4,0x1d
    c88c:	7ff00693          	li	a3,2047
    c890:	00c86833          	or	a6,a6,a2
    c894:	00375713          	srl	a4,a4,0x3
    c898:	fcd786e3          	beq	a5,a3,c864 <__adddf3+0x4b4>
    c89c:	00c71713          	sll	a4,a4,0xc
    c8a0:	00c75713          	srl	a4,a4,0xc
    c8a4:	7ff7f793          	and	a5,a5,2047
    c8a8:	00040e13          	mv	t3,s0
    c8ac:	c9dff06f          	j	c548 <__adddf3+0x198>
    c8b0:	00190693          	add	a3,s2,1
    c8b4:	7fe6f813          	and	a6,a3,2046
    c8b8:	14081863          	bnez	a6,ca08 <__adddf3+0x658>
    c8bc:	00b766b3          	or	a3,a4,a1
    c8c0:	28091c63          	bnez	s2,cb58 <__adddf3+0x7a8>
    c8c4:	30068263          	beqz	a3,cbc8 <__adddf3+0x818>
    c8c8:	01e8e6b3          	or	a3,a7,t5
    c8cc:	22068863          	beqz	a3,cafc <__adddf3+0x74c>
    c8d0:	01e587b3          	add	a5,a1,t5
    c8d4:	00b7b5b3          	sltu	a1,a5,a1
    c8d8:	01170733          	add	a4,a4,a7
    c8dc:	00b70733          	add	a4,a4,a1
    c8e0:	0037d813          	srl	a6,a5,0x3
    c8e4:	00871793          	sll	a5,a4,0x8
    c8e8:	00040e13          	mv	t3,s0
    c8ec:	3407de63          	bgez	a5,cc48 <__adddf3+0x898>
    c8f0:	ff8007b7          	lui	a5,0xff800
    c8f4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c8f8:	00f77733          	and	a4,a4,a5
    c8fc:	01d71793          	sll	a5,a4,0x1d
    c900:	00375713          	srl	a4,a4,0x3
    c904:	0107e833          	or	a6,a5,a6
    c908:	01d77733          	and	a4,a4,t4
    c90c:	00100793          	li	a5,1
    c910:	c39ff06f          	j	c548 <__adddf3+0x198>
    c914:	41e58833          	sub	a6,a1,t5
    c918:	0105b7b3          	sltu	a5,a1,a6
    c91c:	411709b3          	sub	s3,a4,a7
    c920:	40f989b3          	sub	s3,s3,a5
    c924:	00899793          	sll	a5,s3,0x8
    c928:	00080493          	mv	s1,a6
    c92c:	1007c663          	bltz	a5,ca38 <__adddf3+0x688>
    c930:	01386833          	or	a6,a6,s3
    c934:	b4081ee3          	bnez	a6,c490 <__adddf3+0xe0>
    c938:	00000e13          	li	t3,0
    c93c:	00000793          	li	a5,0
    c940:	00000713          	li	a4,0
    c944:	c05ff06f          	j	c548 <__adddf3+0x198>
    c948:	7ff00513          	li	a0,2047
    c94c:	1aa30e63          	beq	t1,a0,cb08 <__adddf3+0x758>
    c950:	03800513          	li	a0,56
    c954:	00100613          	li	a2,1
    c958:	c8f544e3          	blt	a0,a5,c5e0 <__adddf3+0x230>
    c95c:	00800637          	lui	a2,0x800
    c960:	00c76733          	or	a4,a4,a2
    c964:	c4dff06f          	j	c5b0 <__adddf3+0x200>
    c968:	ff8009b7          	lui	s3,0xff800
    c96c:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c970:	40f90933          	sub	s2,s2,a5
    c974:	013779b3          	and	s3,a4,s3
    c978:	b71ff06f          	j	c4e8 <__adddf3+0x138>
    c97c:	fe078693          	add	a3,a5,-32
    c980:	02000613          	li	a2,32
    c984:	00d8d6b3          	srl	a3,a7,a3
    c988:	00c78a63          	beq	a5,a2,c99c <__adddf3+0x5ec>
    c98c:	04000613          	li	a2,64
    c990:	40f607b3          	sub	a5,a2,a5
    c994:	00f897b3          	sll	a5,a7,a5
    c998:	00ff6f33          	or	t5,t5,a5
    c99c:	01e03633          	snez	a2,t5
    c9a0:	00d66633          	or	a2,a2,a3
    c9a4:	ac9ff06f          	j	c46c <__adddf3+0xbc>
    c9a8:	ff8006b7          	lui	a3,0xff800
    c9ac:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c9b0:	40f907b3          	sub	a5,s2,a5
    c9b4:	00d77733          	and	a4,a4,a3
    c9b8:	01d71813          	sll	a6,a4,0x1d
    c9bc:	01386833          	or	a6,a6,s3
    c9c0:	00375713          	srl	a4,a4,0x3
    c9c4:	ed9ff06f          	j	c89c <__adddf3+0x4ec>
    c9c8:	00b766b3          	or	a3,a4,a1
    c9cc:	1e068663          	beqz	a3,cbb8 <__adddf3+0x808>
    c9d0:	fff78693          	add	a3,a5,-1
    c9d4:	0a068e63          	beqz	a3,ca90 <__adddf3+0x6e0>
    c9d8:	7ff00513          	li	a0,2047
    c9dc:	14a78063          	beq	a5,a0,cb1c <__adddf3+0x76c>
    c9e0:	03800793          	li	a5,56
    c9e4:	00100993          	li	s3,1
    c9e8:	e4d7c6e3          	blt	a5,a3,c834 <__adddf3+0x484>
    c9ec:	00068793          	mv	a5,a3
    c9f0:	e15ff06f          	j	c804 <__adddf3+0x454>
    c9f4:	00040e13          	mv	t3,s0
    c9f8:	7ff00793          	li	a5,2047
    c9fc:	00000713          	li	a4,0
    ca00:	00000813          	li	a6,0
    ca04:	b45ff06f          	j	c548 <__adddf3+0x198>
    ca08:	7ff00793          	li	a5,2047
    ca0c:	fef684e3          	beq	a3,a5,c9f4 <__adddf3+0x644>
    ca10:	01e58f33          	add	t5,a1,t5
    ca14:	00bf35b3          	sltu	a1,t5,a1
    ca18:	011707b3          	add	a5,a4,a7
    ca1c:	00b787b3          	add	a5,a5,a1
    ca20:	01f79613          	sll	a2,a5,0x1f
    ca24:	001f5f13          	srl	t5,t5,0x1
    ca28:	01e664b3          	or	s1,a2,t5
    ca2c:	0017d993          	srl	s3,a5,0x1
    ca30:	00068913          	mv	s2,a3
    ca34:	ab5ff06f          	j	c4e8 <__adddf3+0x138>
    ca38:	40bf0633          	sub	a2,t5,a1
    ca3c:	40e887b3          	sub	a5,a7,a4
    ca40:	00cf3733          	sltu	a4,t5,a2
    ca44:	00060493          	mv	s1,a2
    ca48:	40e789b3          	sub	s3,a5,a4
    ca4c:	00068413          	mv	s0,a3
    ca50:	a41ff06f          	j	c490 <__adddf3+0xe0>
    ca54:	00361613          	sll	a2,a2,0x3
    ca58:	00365613          	srl	a2,a2,0x3
    ca5c:	00068413          	mv	s0,a3
    ca60:	00088713          	mv	a4,a7
    ca64:	e25ff06f          	j	c888 <__adddf3+0x4d8>
    ca68:	de0312e3          	bnez	t1,c84c <__adddf3+0x49c>
    ca6c:	1c080663          	beqz	a6,cc38 <__adddf3+0x888>
    ca70:	0038d713          	srl	a4,a7,0x3
    ca74:	00361613          	sll	a2,a2,0x3
    ca78:	01d89893          	sll	a7,a7,0x1d
    ca7c:	01176733          	or	a4,a4,a7
    ca80:	00365613          	srl	a2,a2,0x3
    ca84:	00c76733          	or	a4,a4,a2
    ca88:	00068413          	mv	s0,a3
    ca8c:	dddff06f          	j	c868 <__adddf3+0x4b8>
    ca90:	01e58f33          	add	t5,a1,t5
    ca94:	011708b3          	add	a7,a4,a7
    ca98:	00bf35b3          	sltu	a1,t5,a1
    ca9c:	00b889b3          	add	s3,a7,a1
    caa0:	00899793          	sll	a5,s3,0x8
    caa4:	000f0493          	mv	s1,t5
    caa8:	0e07d463          	bgez	a5,cb90 <__adddf3+0x7e0>
    caac:	00200913          	li	s2,2
    cab0:	bd1ff06f          	j	c680 <__adddf3+0x2d0>
    cab4:	41e58f33          	sub	t5,a1,t5
    cab8:	411708b3          	sub	a7,a4,a7
    cabc:	01e5b5b3          	sltu	a1,a1,t5
    cac0:	000f0493          	mv	s1,t5
    cac4:	40b889b3          	sub	s3,a7,a1
    cac8:	00100913          	li	s2,1
    cacc:	9b1ff06f          	j	c47c <__adddf3+0xcc>
    cad0:	fe078693          	add	a3,a5,-32
    cad4:	02000613          	li	a2,32
    cad8:	00d8d6b3          	srl	a3,a7,a3
    cadc:	00c78a63          	beq	a5,a2,caf0 <__adddf3+0x740>
    cae0:	04000613          	li	a2,64
    cae4:	40f607b3          	sub	a5,a2,a5
    cae8:	00f897b3          	sll	a5,a7,a5
    caec:	00ff6f33          	or	t5,t5,a5
    caf0:	01e039b3          	snez	s3,t5
    caf4:	00d9e9b3          	or	s3,s3,a3
    caf8:	b65ff06f          	j	c65c <__adddf3+0x2ac>
    cafc:	00351613          	sll	a2,a0,0x3
    cb00:	00365993          	srl	s3,a2,0x3
    cb04:	eb5ff06f          	j	c9b8 <__adddf3+0x608>
    cb08:	00361613          	sll	a2,a2,0x3
    cb0c:	00365613          	srl	a2,a2,0x3
    cb10:	00068413          	mv	s0,a3
    cb14:	00088713          	mv	a4,a7
    cb18:	d41ff06f          	j	c858 <__adddf3+0x4a8>
    cb1c:	00361613          	sll	a2,a2,0x3
    cb20:	00365613          	srl	a2,a2,0x3
    cb24:	00088713          	mv	a4,a7
    cb28:	d31ff06f          	j	c858 <__adddf3+0x4a8>
    cb2c:	fe078513          	add	a0,a5,-32
    cb30:	02000613          	li	a2,32
    cb34:	00a75533          	srl	a0,a4,a0
    cb38:	00c78a63          	beq	a5,a2,cb4c <__adddf3+0x79c>
    cb3c:	04000613          	li	a2,64
    cb40:	40f607b3          	sub	a5,a2,a5
    cb44:	00f717b3          	sll	a5,a4,a5
    cb48:	00f5e5b3          	or	a1,a1,a5
    cb4c:	00b03633          	snez	a2,a1
    cb50:	00a66633          	or	a2,a2,a0
    cb54:	a8dff06f          	j	c5e0 <__adddf3+0x230>
    cb58:	fc0682e3          	beqz	a3,cb1c <__adddf3+0x76c>
    cb5c:	01e8ef33          	or	t5,a7,t5
    cb60:	d00f16e3          	bnez	t5,c86c <__adddf3+0x4bc>
    cb64:	cedff06f          	j	c850 <__adddf3+0x4a0>
    cb68:	dc0808e3          	beqz	a6,c938 <__adddf3+0x588>
    cb6c:	00361813          	sll	a6,a2,0x3
    cb70:	01d89793          	sll	a5,a7,0x1d
    cb74:	00385813          	srl	a6,a6,0x3
    cb78:	0038d713          	srl	a4,a7,0x3
    cb7c:	00f86833          	or	a6,a6,a5
    cb80:	01d77733          	and	a4,a4,t4
    cb84:	00068e13          	mv	t3,a3
    cb88:	00000793          	li	a5,0
    cb8c:	9bdff06f          	j	c548 <__adddf3+0x198>
    cb90:	00100793          	li	a5,1
    cb94:	c2dff06f          	j	c7c0 <__adddf3+0x410>
    cb98:	40bf05b3          	sub	a1,t5,a1
    cb9c:	40e888b3          	sub	a7,a7,a4
    cba0:	00bf3733          	sltu	a4,t5,a1
    cba4:	00058493          	mv	s1,a1
    cba8:	40e889b3          	sub	s3,a7,a4
    cbac:	00068413          	mv	s0,a3
    cbb0:	00100913          	li	s2,1
    cbb4:	8c9ff06f          	j	c47c <__adddf3+0xcc>
    cbb8:	00361613          	sll	a2,a2,0x3
    cbbc:	00365613          	srl	a2,a2,0x3
    cbc0:	00088713          	mv	a4,a7
    cbc4:	cc5ff06f          	j	c888 <__adddf3+0x4d8>
    cbc8:	00361613          	sll	a2,a2,0x3
    cbcc:	00365993          	srl	s3,a2,0x3
    cbd0:	00088713          	mv	a4,a7
    cbd4:	de5ff06f          	j	c9b8 <__adddf3+0x608>
    cbd8:	fe078693          	add	a3,a5,-32
    cbdc:	02000613          	li	a2,32
    cbe0:	00d756b3          	srl	a3,a4,a3
    cbe4:	00c78a63          	beq	a5,a2,cbf8 <__adddf3+0x848>
    cbe8:	04000613          	li	a2,64
    cbec:	40f607b3          	sub	a5,a2,a5
    cbf0:	00f717b3          	sll	a5,a4,a5
    cbf4:	00f5e5b3          	or	a1,a1,a5
    cbf8:	00b039b3          	snez	s3,a1
    cbfc:	00d9e9b3          	or	s3,s3,a3
    cc00:	c35ff06f          	j	c834 <__adddf3+0x484>
    cc04:	0034d613          	srl	a2,s1,0x3
    cc08:	00090793          	mv	a5,s2
    cc0c:	00098713          	mv	a4,s3
    cc10:	c79ff06f          	j	c888 <__adddf3+0x4d8>
    cc14:	02000693          	li	a3,32
    cc18:	40f686b3          	sub	a3,a3,a5
    cc1c:	00000613          	li	a2,0
    cc20:	8b5ff06f          	j	c4d4 <__adddf3+0x124>
    cc24:	00c9e833          	or	a6,s3,a2
    cc28:	d00808e3          	beqz	a6,c938 <__adddf3+0x588>
    cc2c:	0039d993          	srl	s3,s3,0x3
    cc30:	00060713          	mv	a4,a2
    cc34:	d85ff06f          	j	c9b8 <__adddf3+0x608>
    cc38:	00000e13          	li	t3,0
    cc3c:	7ff00793          	li	a5,2047
    cc40:	00080737          	lui	a4,0x80
    cc44:	905ff06f          	j	c548 <__adddf3+0x198>
    cc48:	01d71793          	sll	a5,a4,0x1d
    cc4c:	00375713          	srl	a4,a4,0x3
    cc50:	0107e833          	or	a6,a5,a6
    cc54:	01d77733          	and	a4,a4,t4
    cc58:	00000793          	li	a5,0
    cc5c:	8edff06f          	j	c548 <__adddf3+0x198>
    cc60:	01d71813          	sll	a6,a4,0x1d
    cc64:	0035d593          	srl	a1,a1,0x3
    cc68:	00b86833          	or	a6,a6,a1
    cc6c:	00375713          	srl	a4,a4,0x3
    cc70:	00068413          	mv	s0,a3
    cc74:	c29ff06f          	j	c89c <__adddf3+0x4ec>

0000cc78 <__divdf3>:
    cc78:	fb010113          	add	sp,sp,-80
    cc7c:	0145d793          	srl	a5,a1,0x14
    cc80:	04812423          	sw	s0,72(sp)
    cc84:	04912223          	sw	s1,68(sp)
    cc88:	05212023          	sw	s2,64(sp)
    cc8c:	03412c23          	sw	s4,56(sp)
    cc90:	03512a23          	sw	s5,52(sp)
    cc94:	00c59493          	sll	s1,a1,0xc
    cc98:	04112623          	sw	ra,76(sp)
    cc9c:	03312e23          	sw	s3,60(sp)
    cca0:	03612823          	sw	s6,48(sp)
    cca4:	03712623          	sw	s7,44(sp)
    cca8:	03812423          	sw	s8,40(sp)
    ccac:	7ff7f793          	and	a5,a5,2047
    ccb0:	00050413          	mv	s0,a0
    ccb4:	00060a13          	mv	s4,a2
    ccb8:	00068913          	mv	s2,a3
    ccbc:	00c4d493          	srl	s1,s1,0xc
    ccc0:	01f5da93          	srl	s5,a1,0x1f
    ccc4:	18078c63          	beqz	a5,ce5c <__divdf3+0x1e4>
    ccc8:	7ff00713          	li	a4,2047
    cccc:	08e78a63          	beq	a5,a4,cd60 <__divdf3+0xe8>
    ccd0:	01d55b13          	srl	s6,a0,0x1d
    ccd4:	00349493          	sll	s1,s1,0x3
    ccd8:	009b64b3          	or	s1,s6,s1
    ccdc:	00800737          	lui	a4,0x800
    cce0:	00e4eb33          	or	s6,s1,a4
    cce4:	00351b93          	sll	s7,a0,0x3
    cce8:	c0178993          	add	s3,a5,-1023
    ccec:	00000493          	li	s1,0
    ccf0:	00000c13          	li	s8,0
    ccf4:	01495793          	srl	a5,s2,0x14
    ccf8:	00c91413          	sll	s0,s2,0xc
    ccfc:	7ff7f793          	and	a5,a5,2047
    cd00:	00c45413          	srl	s0,s0,0xc
    cd04:	01f95913          	srl	s2,s2,0x1f
    cd08:	08078463          	beqz	a5,cd90 <__divdf3+0x118>
    cd0c:	7ff00713          	li	a4,2047
    cd10:	18e78c63          	beq	a5,a4,cea8 <__divdf3+0x230>
    cd14:	00341413          	sll	s0,s0,0x3
    cd18:	01da5713          	srl	a4,s4,0x1d
    cd1c:	00876733          	or	a4,a4,s0
    cd20:	c0178793          	add	a5,a5,-1023
    cd24:	00800437          	lui	s0,0x800
    cd28:	40f989b3          	sub	s3,s3,a5
    cd2c:	00876433          	or	s0,a4,s0
    cd30:	003a1813          	sll	a6,s4,0x3
    cd34:	00000793          	li	a5,0
    cd38:	00f00713          	li	a4,15
    cd3c:	012aca33          	xor	s4,s5,s2
    cd40:	24976663          	bltu	a4,s1,cf8c <__divdf3+0x314>
    cd44:	00003697          	auipc	a3,0x3
    cd48:	cd468693          	add	a3,a3,-812 # fa18 <__mprec_tens+0xc8>
    cd4c:	00249493          	sll	s1,s1,0x2
    cd50:	00d484b3          	add	s1,s1,a3
    cd54:	0004a703          	lw	a4,0(s1)
    cd58:	00d70733          	add	a4,a4,a3
    cd5c:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cd60:	00a4eb33          	or	s6,s1,a0
    cd64:	1c0b1e63          	bnez	s6,cf40 <__divdf3+0x2c8>
    cd68:	01495793          	srl	a5,s2,0x14
    cd6c:	00c91413          	sll	s0,s2,0xc
    cd70:	7ff7f793          	and	a5,a5,2047
    cd74:	00000b93          	li	s7,0
    cd78:	00800493          	li	s1,8
    cd7c:	7ff00993          	li	s3,2047
    cd80:	00200c13          	li	s8,2
    cd84:	00c45413          	srl	s0,s0,0xc
    cd88:	01f95913          	srl	s2,s2,0x1f
    cd8c:	f80790e3          	bnez	a5,cd0c <__divdf3+0x94>
    cd90:	01446833          	or	a6,s0,s4
    cd94:	1c080263          	beqz	a6,cf58 <__divdf3+0x2e0>
    cd98:	5c040663          	beqz	s0,d364 <__divdf3+0x6ec>
    cd9c:	00040513          	mv	a0,s0
    cda0:	250020ef          	jal	eff0 <__clzsi2>
    cda4:	00050793          	mv	a5,a0
    cda8:	ff550693          	add	a3,a0,-11
    cdac:	01d00713          	li	a4,29
    cdb0:	ff878813          	add	a6,a5,-8
    cdb4:	40d70733          	sub	a4,a4,a3
    cdb8:	01041433          	sll	s0,s0,a6
    cdbc:	00ea5733          	srl	a4,s4,a4
    cdc0:	00876433          	or	s0,a4,s0
    cdc4:	010a1833          	sll	a6,s4,a6
    cdc8:	013787b3          	add	a5,a5,s3
    cdcc:	3f378993          	add	s3,a5,1011
    cdd0:	00000793          	li	a5,0
    cdd4:	f65ff06f          	j	cd38 <__divdf3+0xc0>
    cdd8:	40f70733          	sub	a4,a4,a5
    cddc:	03800693          	li	a3,56
    cde0:	60e6d063          	bge	a3,a4,d3e0 <__divdf3+0x768>
    cde4:	00000793          	li	a5,0
    cde8:	00000693          	li	a3,0
    cdec:	00000713          	li	a4,0
    cdf0:	04c12083          	lw	ra,76(sp)
    cdf4:	04812403          	lw	s0,72(sp)
    cdf8:	01479793          	sll	a5,a5,0x14
    cdfc:	00d7e7b3          	or	a5,a5,a3
    ce00:	01fa1693          	sll	a3,s4,0x1f
    ce04:	00d7e7b3          	or	a5,a5,a3
    ce08:	04412483          	lw	s1,68(sp)
    ce0c:	04012903          	lw	s2,64(sp)
    ce10:	03c12983          	lw	s3,60(sp)
    ce14:	03812a03          	lw	s4,56(sp)
    ce18:	03412a83          	lw	s5,52(sp)
    ce1c:	03012b03          	lw	s6,48(sp)
    ce20:	02c12b83          	lw	s7,44(sp)
    ce24:	02812c03          	lw	s8,40(sp)
    ce28:	00070513          	mv	a0,a4
    ce2c:	00078593          	mv	a1,a5
    ce30:	05010113          	add	sp,sp,80
    ce34:	00008067          	ret
    ce38:	7ff00793          	li	a5,2047
    ce3c:	00000693          	li	a3,0
    ce40:	00000713          	li	a4,0
    ce44:	fadff06f          	j	cdf0 <__divdf3+0x178>
    ce48:	00000a13          	li	s4,0
    ce4c:	7ff00793          	li	a5,2047
    ce50:	000806b7          	lui	a3,0x80
    ce54:	00000713          	li	a4,0
    ce58:	f99ff06f          	j	cdf0 <__divdf3+0x178>
    ce5c:	00a4eb33          	or	s6,s1,a0
    ce60:	100b0c63          	beqz	s6,cf78 <__divdf3+0x300>
    ce64:	52048463          	beqz	s1,d38c <__divdf3+0x714>
    ce68:	00048513          	mv	a0,s1
    ce6c:	184020ef          	jal	eff0 <__clzsi2>
    ce70:	00050713          	mv	a4,a0
    ce74:	ff550793          	add	a5,a0,-11
    ce78:	01d00b13          	li	s6,29
    ce7c:	ff870b93          	add	s7,a4,-8
    ce80:	40fb0b33          	sub	s6,s6,a5
    ce84:	017494b3          	sll	s1,s1,s7
    ce88:	01645b33          	srl	s6,s0,s6
    ce8c:	009b6b33          	or	s6,s6,s1
    ce90:	01741bb3          	sll	s7,s0,s7
    ce94:	c0d00793          	li	a5,-1011
    ce98:	40e789b3          	sub	s3,a5,a4
    ce9c:	00000493          	li	s1,0
    cea0:	00000c13          	li	s8,0
    cea4:	e51ff06f          	j	ccf4 <__divdf3+0x7c>
    cea8:	01446833          	or	a6,s0,s4
    ceac:	80198993          	add	s3,s3,-2047
    ceb0:	0a081c63          	bnez	a6,cf68 <__divdf3+0x2f0>
    ceb4:	0024e493          	or	s1,s1,2
    ceb8:	00000413          	li	s0,0
    cebc:	00200793          	li	a5,2
    cec0:	e79ff06f          	j	cd38 <__divdf3+0xc0>
    cec4:	000a8913          	mv	s2,s5
    cec8:	000b0413          	mv	s0,s6
    cecc:	000b8813          	mv	a6,s7
    ced0:	00200793          	li	a5,2
    ced4:	60fc0863          	beq	s8,a5,d4e4 <__divdf3+0x86c>
    ced8:	00300793          	li	a5,3
    cedc:	f6fc06e3          	beq	s8,a5,ce48 <__divdf3+0x1d0>
    cee0:	00100793          	li	a5,1
    cee4:	00090a13          	mv	s4,s2
    cee8:	eefc0ee3          	beq	s8,a5,cde4 <__divdf3+0x16c>
    ceec:	3ff98793          	add	a5,s3,1023
    cef0:	3cf05263          	blez	a5,d2b4 <__divdf3+0x63c>
    cef4:	00787713          	and	a4,a6,7
    cef8:	5c071663          	bnez	a4,d4c4 <__divdf3+0x84c>
    cefc:	00741713          	sll	a4,s0,0x7
    cf00:	00075a63          	bgez	a4,cf14 <__divdf3+0x29c>
    cf04:	ff0007b7          	lui	a5,0xff000
    cf08:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cf0c:	00f47433          	and	s0,s0,a5
    cf10:	40098793          	add	a5,s3,1024
    cf14:	7fe00713          	li	a4,2046
    cf18:	f2f740e3          	blt	a4,a5,ce38 <__divdf3+0x1c0>
    cf1c:	00385813          	srl	a6,a6,0x3
    cf20:	01d41713          	sll	a4,s0,0x1d
    cf24:	00941693          	sll	a3,s0,0x9
    cf28:	01076733          	or	a4,a4,a6
    cf2c:	00c6d693          	srl	a3,a3,0xc
    cf30:	7ff7f793          	and	a5,a5,2047
    cf34:	ebdff06f          	j	cdf0 <__divdf3+0x178>
    cf38:	00078c13          	mv	s8,a5
    cf3c:	f95ff06f          	j	ced0 <__divdf3+0x258>
    cf40:	00048b13          	mv	s6,s1
    cf44:	00050b93          	mv	s7,a0
    cf48:	00c00493          	li	s1,12
    cf4c:	7ff00993          	li	s3,2047
    cf50:	00300c13          	li	s8,3
    cf54:	da1ff06f          	j	ccf4 <__divdf3+0x7c>
    cf58:	0014e493          	or	s1,s1,1
    cf5c:	00000413          	li	s0,0
    cf60:	00100793          	li	a5,1
    cf64:	dd5ff06f          	j	cd38 <__divdf3+0xc0>
    cf68:	0034e493          	or	s1,s1,3
    cf6c:	000a0813          	mv	a6,s4
    cf70:	00300793          	li	a5,3
    cf74:	dc5ff06f          	j	cd38 <__divdf3+0xc0>
    cf78:	00000b93          	li	s7,0
    cf7c:	00400493          	li	s1,4
    cf80:	00000993          	li	s3,0
    cf84:	00100c13          	li	s8,1
    cf88:	d6dff06f          	j	ccf4 <__divdf3+0x7c>
    cf8c:	03912223          	sw	s9,36(sp)
    cf90:	03a12023          	sw	s10,32(sp)
    cf94:	01b12e23          	sw	s11,28(sp)
    cf98:	3b646a63          	bltu	s0,s6,d34c <__divdf3+0x6d4>
    cf9c:	3a8b0663          	beq	s6,s0,d348 <__divdf3+0x6d0>
    cfa0:	fff98993          	add	s3,s3,-1
    cfa4:	000b8c13          	mv	s8,s7
    cfa8:	000b0493          	mv	s1,s6
    cfac:	00000d13          	li	s10,0
    cfb0:	01885c93          	srl	s9,a6,0x18
    cfb4:	00841413          	sll	s0,s0,0x8
    cfb8:	01045913          	srl	s2,s0,0x10
    cfbc:	008cecb3          	or	s9,s9,s0
    cfc0:	00090593          	mv	a1,s2
    cfc4:	00048513          	mv	a0,s1
    cfc8:	010c9b13          	sll	s6,s9,0x10
    cfcc:	00881a93          	sll	s5,a6,0x8
    cfd0:	010b5b13          	srl	s6,s6,0x10
    cfd4:	771010ef          	jal	ef44 <__hidden___udivsi3>
    cfd8:	00050593          	mv	a1,a0
    cfdc:	00050413          	mv	s0,a0
    cfe0:	000b0513          	mv	a0,s6
    cfe4:	69d010ef          	jal	ee80 <__mulsi3>
    cfe8:	00050793          	mv	a5,a0
    cfec:	00090593          	mv	a1,s2
    cff0:	00048513          	mv	a0,s1
    cff4:	00078493          	mv	s1,a5
    cff8:	795010ef          	jal	ef8c <__umodsi3>
    cffc:	01051513          	sll	a0,a0,0x10
    d000:	010c5793          	srl	a5,s8,0x10
    d004:	00a7e7b3          	or	a5,a5,a0
    d008:	0097fa63          	bgeu	a5,s1,d01c <__divdf3+0x3a4>
    d00c:	00fc87b3          	add	a5,s9,a5
    d010:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d014:	3b97fe63          	bgeu	a5,s9,d3d0 <__divdf3+0x758>
    d018:	00070413          	mv	s0,a4
    d01c:	409784b3          	sub	s1,a5,s1
    d020:	00090593          	mv	a1,s2
    d024:	00048513          	mv	a0,s1
    d028:	71d010ef          	jal	ef44 <__hidden___udivsi3>
    d02c:	00050593          	mv	a1,a0
    d030:	00050b93          	mv	s7,a0
    d034:	000b0513          	mv	a0,s6
    d038:	649010ef          	jal	ee80 <__mulsi3>
    d03c:	00050793          	mv	a5,a0
    d040:	00090593          	mv	a1,s2
    d044:	00048513          	mv	a0,s1
    d048:	00078493          	mv	s1,a5
    d04c:	741010ef          	jal	ef8c <__umodsi3>
    d050:	010c1793          	sll	a5,s8,0x10
    d054:	01051513          	sll	a0,a0,0x10
    d058:	0107d793          	srl	a5,a5,0x10
    d05c:	00a7e7b3          	or	a5,a5,a0
    d060:	0097fa63          	bgeu	a5,s1,d074 <__divdf3+0x3fc>
    d064:	00fc87b3          	add	a5,s9,a5
    d068:	fffb8713          	add	a4,s7,-1
    d06c:	3597fa63          	bgeu	a5,s9,d3c0 <__divdf3+0x748>
    d070:	00070b93          	mv	s7,a4
    d074:	00010337          	lui	t1,0x10
    d078:	01041413          	sll	s0,s0,0x10
    d07c:	01746433          	or	s0,s0,s7
    d080:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    d084:	01b478b3          	and	a7,s0,s11
    d088:	01bafdb3          	and	s11,s5,s11
    d08c:	40978bb3          	sub	s7,a5,s1
    d090:	010adc13          	srl	s8,s5,0x10
    d094:	01045793          	srl	a5,s0,0x10
    d098:	00088513          	mv	a0,a7
    d09c:	000d8593          	mv	a1,s11
    d0a0:	5e1010ef          	jal	ee80 <__mulsi3>
    d0a4:	00050813          	mv	a6,a0
    d0a8:	000c0593          	mv	a1,s8
    d0ac:	00088513          	mv	a0,a7
    d0b0:	5d1010ef          	jal	ee80 <__mulsi3>
    d0b4:	00050893          	mv	a7,a0
    d0b8:	000d8593          	mv	a1,s11
    d0bc:	00078513          	mv	a0,a5
    d0c0:	5c1010ef          	jal	ee80 <__mulsi3>
    d0c4:	00050e13          	mv	t3,a0
    d0c8:	000c0593          	mv	a1,s8
    d0cc:	00078513          	mv	a0,a5
    d0d0:	5b1010ef          	jal	ee80 <__mulsi3>
    d0d4:	01085793          	srl	a5,a6,0x10
    d0d8:	01c888b3          	add	a7,a7,t3
    d0dc:	011787b3          	add	a5,a5,a7
    d0e0:	01c7f463          	bgeu	a5,t3,d0e8 <__divdf3+0x470>
    d0e4:	00650533          	add	a0,a0,t1
    d0e8:	00010637          	lui	a2,0x10
    d0ec:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    d0f0:	00c7f4b3          	and	s1,a5,a2
    d0f4:	0107d693          	srl	a3,a5,0x10
    d0f8:	01049493          	sll	s1,s1,0x10
    d0fc:	00c87833          	and	a6,a6,a2
    d100:	00a687b3          	add	a5,a3,a0
    d104:	010484b3          	add	s1,s1,a6
    d108:	20fbea63          	bltu	s7,a5,d31c <__divdf3+0x6a4>
    d10c:	20fb8663          	beq	s7,a5,d318 <__divdf3+0x6a0>
    d110:	409d04b3          	sub	s1,s10,s1
    d114:	40fb8bb3          	sub	s7,s7,a5
    d118:	009d3d33          	sltu	s10,s10,s1
    d11c:	41ab8bb3          	sub	s7,s7,s10
    d120:	377c8a63          	beq	s9,s7,d494 <__divdf3+0x81c>
    d124:	00090593          	mv	a1,s2
    d128:	000b8513          	mv	a0,s7
    d12c:	619010ef          	jal	ef44 <__hidden___udivsi3>
    d130:	00050593          	mv	a1,a0
    d134:	00a12623          	sw	a0,12(sp)
    d138:	00050d13          	mv	s10,a0
    d13c:	000b0513          	mv	a0,s6
    d140:	541010ef          	jal	ee80 <__mulsi3>
    d144:	00050793          	mv	a5,a0
    d148:	00090593          	mv	a1,s2
    d14c:	000b8513          	mv	a0,s7
    d150:	00078b93          	mv	s7,a5
    d154:	639010ef          	jal	ef8c <__umodsi3>
    d158:	01051513          	sll	a0,a0,0x10
    d15c:	0104d793          	srl	a5,s1,0x10
    d160:	00a7e7b3          	or	a5,a5,a0
    d164:	0377f063          	bgeu	a5,s7,d184 <__divdf3+0x50c>
    d168:	00fc87b3          	add	a5,s9,a5
    d16c:	fffd0693          	add	a3,s10,-1
    d170:	3797e263          	bltu	a5,s9,d4d4 <__divdf3+0x85c>
    d174:	3777f063          	bgeu	a5,s7,d4d4 <__divdf3+0x85c>
    d178:	ffed0713          	add	a4,s10,-2
    d17c:	00e12623          	sw	a4,12(sp)
    d180:	019787b3          	add	a5,a5,s9
    d184:	41778bb3          	sub	s7,a5,s7
    d188:	00090593          	mv	a1,s2
    d18c:	000b8513          	mv	a0,s7
    d190:	5b5010ef          	jal	ef44 <__hidden___udivsi3>
    d194:	00050593          	mv	a1,a0
    d198:	00050d13          	mv	s10,a0
    d19c:	000b0513          	mv	a0,s6
    d1a0:	4e1010ef          	jal	ee80 <__mulsi3>
    d1a4:	00050793          	mv	a5,a0
    d1a8:	00090593          	mv	a1,s2
    d1ac:	000b8513          	mv	a0,s7
    d1b0:	00078913          	mv	s2,a5
    d1b4:	01049493          	sll	s1,s1,0x10
    d1b8:	5d5010ef          	jal	ef8c <__umodsi3>
    d1bc:	01051513          	sll	a0,a0,0x10
    d1c0:	0104d493          	srl	s1,s1,0x10
    d1c4:	00a4e4b3          	or	s1,s1,a0
    d1c8:	0124fe63          	bgeu	s1,s2,d1e4 <__divdf3+0x56c>
    d1cc:	009c84b3          	add	s1,s9,s1
    d1d0:	fffd0793          	add	a5,s10,-1
    d1d4:	3194e463          	bltu	s1,s9,d4dc <__divdf3+0x864>
    d1d8:	3124f263          	bgeu	s1,s2,d4dc <__divdf3+0x864>
    d1dc:	ffed0d13          	add	s10,s10,-2
    d1e0:	019484b3          	add	s1,s1,s9
    d1e4:	00c12783          	lw	a5,12(sp)
    d1e8:	412484b3          	sub	s1,s1,s2
    d1ec:	000d8593          	mv	a1,s11
    d1f0:	01079813          	sll	a6,a5,0x10
    d1f4:	01a86833          	or	a6,a6,s10
    d1f8:	01081313          	sll	t1,a6,0x10
    d1fc:	01035313          	srl	t1,t1,0x10
    d200:	01085793          	srl	a5,a6,0x10
    d204:	00030513          	mv	a0,t1
    d208:	479010ef          	jal	ee80 <__mulsi3>
    d20c:	00050893          	mv	a7,a0
    d210:	000c0593          	mv	a1,s8
    d214:	00030513          	mv	a0,t1
    d218:	469010ef          	jal	ee80 <__mulsi3>
    d21c:	00050313          	mv	t1,a0
    d220:	000d8593          	mv	a1,s11
    d224:	00078513          	mv	a0,a5
    d228:	459010ef          	jal	ee80 <__mulsi3>
    d22c:	00050e13          	mv	t3,a0
    d230:	000c0593          	mv	a1,s8
    d234:	00078513          	mv	a0,a5
    d238:	449010ef          	jal	ee80 <__mulsi3>
    d23c:	0108d793          	srl	a5,a7,0x10
    d240:	01c30333          	add	t1,t1,t3
    d244:	006787b3          	add	a5,a5,t1
    d248:	01c7f663          	bgeu	a5,t3,d254 <__divdf3+0x5dc>
    d24c:	00010737          	lui	a4,0x10
    d250:	00e50533          	add	a0,a0,a4
    d254:	000106b7          	lui	a3,0x10
    d258:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    d25c:	0107d713          	srl	a4,a5,0x10
    d260:	00d7f7b3          	and	a5,a5,a3
    d264:	01079793          	sll	a5,a5,0x10
    d268:	00d8f8b3          	and	a7,a7,a3
    d26c:	00a70733          	add	a4,a4,a0
    d270:	011787b3          	add	a5,a5,a7
    d274:	02e4e063          	bltu	s1,a4,d294 <__divdf3+0x61c>
    d278:	00e48c63          	beq	s1,a4,d290 <__divdf3+0x618>
    d27c:	02412c83          	lw	s9,36(sp)
    d280:	02012d03          	lw	s10,32(sp)
    d284:	01c12d83          	lw	s11,28(sp)
    d288:	00186813          	or	a6,a6,1
    d28c:	c61ff06f          	j	ceec <__divdf3+0x274>
    d290:	1c078a63          	beqz	a5,d464 <__divdf3+0x7ec>
    d294:	009c84b3          	add	s1,s9,s1
    d298:	fff80613          	add	a2,a6,-1
    d29c:	00048693          	mv	a3,s1
    d2a0:	1b94ec63          	bltu	s1,s9,d458 <__divdf3+0x7e0>
    d2a4:	24e4ea63          	bltu	s1,a4,d4f8 <__divdf3+0x880>
    d2a8:	26e48863          	beq	s1,a4,d518 <__divdf3+0x8a0>
    d2ac:	00060813          	mv	a6,a2
    d2b0:	fcdff06f          	j	d27c <__divdf3+0x604>
    d2b4:	00100713          	li	a4,1
    d2b8:	b20790e3          	bnez	a5,cdd8 <__divdf3+0x160>
    d2bc:	41e98793          	add	a5,s3,1054
    d2c0:	00f816b3          	sll	a3,a6,a5
    d2c4:	00d036b3          	snez	a3,a3
    d2c8:	00f417b3          	sll	a5,s0,a5
    d2cc:	00f6e7b3          	or	a5,a3,a5
    d2d0:	00e85833          	srl	a6,a6,a4
    d2d4:	00f86833          	or	a6,a6,a5
    d2d8:	00787793          	and	a5,a6,7
    d2dc:	00e45433          	srl	s0,s0,a4
    d2e0:	02078063          	beqz	a5,d300 <__divdf3+0x688>
    d2e4:	00f87793          	and	a5,a6,15
    d2e8:	00400713          	li	a4,4
    d2ec:	00e78a63          	beq	a5,a4,d300 <__divdf3+0x688>
    d2f0:	00480793          	add	a5,a6,4
    d2f4:	0107b833          	sltu	a6,a5,a6
    d2f8:	01040433          	add	s0,s0,a6
    d2fc:	00078813          	mv	a6,a5
    d300:	00841613          	sll	a2,s0,0x8
    d304:	00100793          	li	a5,1
    d308:	00000693          	li	a3,0
    d30c:	00000713          	li	a4,0
    d310:	ae0640e3          	bltz	a2,cdf0 <__divdf3+0x178>
    d314:	1280006f          	j	d43c <__divdf3+0x7c4>
    d318:	de9d7ce3          	bgeu	s10,s1,d110 <__divdf3+0x498>
    d31c:	015d06b3          	add	a3,s10,s5
    d320:	01a6b633          	sltu	a2,a3,s10
    d324:	019605b3          	add	a1,a2,s9
    d328:	00bb8bb3          	add	s7,s7,a1
    d32c:	00068d13          	mv	s10,a3
    d330:	fff40593          	add	a1,s0,-1
    d334:	077cfe63          	bgeu	s9,s7,d3b0 <__divdf3+0x738>
    d338:	14fbe063          	bltu	s7,a5,d478 <__divdf3+0x800>
    d33c:	13778c63          	beq	a5,s7,d474 <__divdf3+0x7fc>
    d340:	00058413          	mv	s0,a1
    d344:	dcdff06f          	j	d110 <__divdf3+0x498>
    d348:	c50bece3          	bltu	s7,a6,cfa0 <__divdf3+0x328>
    d34c:	01fb1c13          	sll	s8,s6,0x1f
    d350:	001bd713          	srl	a4,s7,0x1
    d354:	001b5493          	srl	s1,s6,0x1
    d358:	00ec6c33          	or	s8,s8,a4
    d35c:	01fb9d13          	sll	s10,s7,0x1f
    d360:	c51ff06f          	j	cfb0 <__divdf3+0x338>
    d364:	000a0513          	mv	a0,s4
    d368:	489010ef          	jal	eff0 <__clzsi2>
    d36c:	01550693          	add	a3,a0,21
    d370:	01c00713          	li	a4,28
    d374:	02050793          	add	a5,a0,32
    d378:	a2d75ae3          	bge	a4,a3,cdac <__divdf3+0x134>
    d37c:	ff850513          	add	a0,a0,-8
    d380:	00000813          	li	a6,0
    d384:	00aa1433          	sll	s0,s4,a0
    d388:	a41ff06f          	j	cdc8 <__divdf3+0x150>
    d38c:	465010ef          	jal	eff0 <__clzsi2>
    d390:	01550793          	add	a5,a0,21
    d394:	01c00693          	li	a3,28
    d398:	02050713          	add	a4,a0,32
    d39c:	acf6dee3          	bge	a3,a5,ce78 <__divdf3+0x200>
    d3a0:	ff850493          	add	s1,a0,-8
    d3a4:	00941b33          	sll	s6,s0,s1
    d3a8:	00000b93          	li	s7,0
    d3ac:	ae9ff06f          	j	ce94 <__divdf3+0x21c>
    d3b0:	f97c98e3          	bne	s9,s7,d340 <__divdf3+0x6c8>
    d3b4:	f80602e3          	beqz	a2,d338 <__divdf3+0x6c0>
    d3b8:	00058413          	mv	s0,a1
    d3bc:	d55ff06f          	j	d110 <__divdf3+0x498>
    d3c0:	ca97f8e3          	bgeu	a5,s1,d070 <__divdf3+0x3f8>
    d3c4:	ffeb8b93          	add	s7,s7,-2
    d3c8:	019787b3          	add	a5,a5,s9
    d3cc:	ca9ff06f          	j	d074 <__divdf3+0x3fc>
    d3d0:	c497f4e3          	bgeu	a5,s1,d018 <__divdf3+0x3a0>
    d3d4:	ffe40413          	add	s0,s0,-2
    d3d8:	019787b3          	add	a5,a5,s9
    d3dc:	c41ff06f          	j	d01c <__divdf3+0x3a4>
    d3e0:	01f00693          	li	a3,31
    d3e4:	ece6dce3          	bge	a3,a4,d2bc <__divdf3+0x644>
    d3e8:	fe100693          	li	a3,-31
    d3ec:	40f686b3          	sub	a3,a3,a5
    d3f0:	02000793          	li	a5,32
    d3f4:	00d456b3          	srl	a3,s0,a3
    d3f8:	00f70863          	beq	a4,a5,d408 <__divdf3+0x790>
    d3fc:	43e98793          	add	a5,s3,1086
    d400:	00f417b3          	sll	a5,s0,a5
    d404:	00f86833          	or	a6,a6,a5
    d408:	01003833          	snez	a6,a6
    d40c:	00d86833          	or	a6,a6,a3
    d410:	00787713          	and	a4,a6,7
    d414:	00000693          	li	a3,0
    d418:	02070863          	beqz	a4,d448 <__divdf3+0x7d0>
    d41c:	00f87793          	and	a5,a6,15
    d420:	00400713          	li	a4,4
    d424:	00000413          	li	s0,0
    d428:	00e78a63          	beq	a5,a4,d43c <__divdf3+0x7c4>
    d42c:	00480793          	add	a5,a6,4
    d430:	0107b833          	sltu	a6,a5,a6
    d434:	01003433          	snez	s0,a6
    d438:	00078813          	mv	a6,a5
    d43c:	00941693          	sll	a3,s0,0x9
    d440:	01d41713          	sll	a4,s0,0x1d
    d444:	00c6d693          	srl	a3,a3,0xc
    d448:	00385813          	srl	a6,a6,0x3
    d44c:	00e86733          	or	a4,a6,a4
    d450:	00000793          	li	a5,0
    d454:	99dff06f          	j	cdf0 <__divdf3+0x178>
    d458:	00060813          	mv	a6,a2
    d45c:	e2e690e3          	bne	a3,a4,d27c <__divdf3+0x604>
    d460:	e1579ee3          	bne	a5,s5,d27c <__divdf3+0x604>
    d464:	02412c83          	lw	s9,36(sp)
    d468:	02012d03          	lw	s10,32(sp)
    d46c:	01c12d83          	lw	s11,28(sp)
    d470:	a7dff06f          	j	ceec <__divdf3+0x274>
    d474:	ec96f6e3          	bgeu	a3,s1,d340 <__divdf3+0x6c8>
    d478:	00da86b3          	add	a3,s5,a3
    d47c:	0156b633          	sltu	a2,a3,s5
    d480:	01960633          	add	a2,a2,s9
    d484:	ffe40413          	add	s0,s0,-2
    d488:	00068d13          	mv	s10,a3
    d48c:	00cb8bb3          	add	s7,s7,a2
    d490:	c81ff06f          	j	d110 <__divdf3+0x498>
    d494:	c0200713          	li	a4,-1022
    d498:	02412c83          	lw	s9,36(sp)
    d49c:	02012d03          	lw	s10,32(sp)
    d4a0:	01c12d83          	lw	s11,28(sp)
    d4a4:	3ff98793          	add	a5,s3,1023
    d4a8:	fff00813          	li	a6,-1
    d4ac:	e0e9c4e3          	blt	s3,a4,d2b4 <__divdf3+0x63c>
    d4b0:	00480713          	add	a4,a6,4
    d4b4:	01073833          	sltu	a6,a4,a6
    d4b8:	01040433          	add	s0,s0,a6
    d4bc:	00070813          	mv	a6,a4
    d4c0:	a3dff06f          	j	cefc <__divdf3+0x284>
    d4c4:	00f87713          	and	a4,a6,15
    d4c8:	00400693          	li	a3,4
    d4cc:	a2d708e3          	beq	a4,a3,cefc <__divdf3+0x284>
    d4d0:	fe1ff06f          	j	d4b0 <__divdf3+0x838>
    d4d4:	00d12623          	sw	a3,12(sp)
    d4d8:	cadff06f          	j	d184 <__divdf3+0x50c>
    d4dc:	00078d13          	mv	s10,a5
    d4e0:	d05ff06f          	j	d1e4 <__divdf3+0x56c>
    d4e4:	00090a13          	mv	s4,s2
    d4e8:	7ff00793          	li	a5,2047
    d4ec:	00000693          	li	a3,0
    d4f0:	00000713          	li	a4,0
    d4f4:	8fdff06f          	j	cdf0 <__divdf3+0x178>
    d4f8:	001a9613          	sll	a2,s5,0x1
    d4fc:	015636b3          	sltu	a3,a2,s5
    d500:	019686b3          	add	a3,a3,s9
    d504:	00d486b3          	add	a3,s1,a3
    d508:	ffe80813          	add	a6,a6,-2
    d50c:	00060a93          	mv	s5,a2
    d510:	f4e688e3          	beq	a3,a4,d460 <__divdf3+0x7e8>
    d514:	d69ff06f          	j	d27c <__divdf3+0x604>
    d518:	fefae0e3          	bltu	s5,a5,d4f8 <__divdf3+0x880>
    d51c:	00060813          	mv	a6,a2
    d520:	f41ff06f          	j	d460 <__divdf3+0x7e8>

0000d524 <__eqdf2>:
    d524:	0145d713          	srl	a4,a1,0x14
    d528:	001007b7          	lui	a5,0x100
    d52c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d530:	0146d813          	srl	a6,a3,0x14
    d534:	7ff77713          	and	a4,a4,2047
    d538:	7ff00313          	li	t1,2047
    d53c:	00b7fe33          	and	t3,a5,a1
    d540:	00050893          	mv	a7,a0
    d544:	00d7f7b3          	and	a5,a5,a3
    d548:	01f5d593          	srl	a1,a1,0x1f
    d54c:	7ff87813          	and	a6,a6,2047
    d550:	01f6d693          	srl	a3,a3,0x1f
    d554:	00100513          	li	a0,1
    d558:	00670c63          	beq	a4,t1,d570 <__eqdf2+0x4c>
    d55c:	00680863          	beq	a6,t1,d56c <__eqdf2+0x48>
    d560:	01071463          	bne	a4,a6,d568 <__eqdf2+0x44>
    d564:	02fe0663          	beq	t3,a5,d590 <__eqdf2+0x6c>
    d568:	00008067          	ret
    d56c:	00008067          	ret
    d570:	fee81ce3          	bne	a6,a4,d568 <__eqdf2+0x44>
    d574:	00fe67b3          	or	a5,t3,a5
    d578:	00c7e7b3          	or	a5,a5,a2
    d57c:	0117e7b3          	or	a5,a5,a7
    d580:	fe0794e3          	bnez	a5,d568 <__eqdf2+0x44>
    d584:	40d585b3          	sub	a1,a1,a3
    d588:	00b03533          	snez	a0,a1
    d58c:	00008067          	ret
    d590:	fcc89ce3          	bne	a7,a2,d568 <__eqdf2+0x44>
    d594:	00d58a63          	beq	a1,a3,d5a8 <__eqdf2+0x84>
    d598:	fc0718e3          	bnez	a4,d568 <__eqdf2+0x44>
    d59c:	011e6e33          	or	t3,t3,a7
    d5a0:	01c03533          	snez	a0,t3
    d5a4:	00008067          	ret
    d5a8:	00000513          	li	a0,0
    d5ac:	00008067          	ret

0000d5b0 <__gedf2>:
    d5b0:	0145d893          	srl	a7,a1,0x14
    d5b4:	001007b7          	lui	a5,0x100
    d5b8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d5bc:	0146d713          	srl	a4,a3,0x14
    d5c0:	7ff8f893          	and	a7,a7,2047
    d5c4:	7ff00e13          	li	t3,2047
    d5c8:	00b7f333          	and	t1,a5,a1
    d5cc:	00050813          	mv	a6,a0
    d5d0:	00050e93          	mv	t4,a0
    d5d4:	00d7f7b3          	and	a5,a5,a3
    d5d8:	01f5d593          	srl	a1,a1,0x1f
    d5dc:	00060f13          	mv	t5,a2
    d5e0:	7ff77513          	and	a0,a4,2047
    d5e4:	01f6d693          	srl	a3,a3,0x1f
    d5e8:	05c88863          	beq	a7,t3,d638 <__gedf2+0x88>
    d5ec:	03c50463          	beq	a0,t3,d614 <__gedf2+0x64>
    d5f0:	06089a63          	bnez	a7,d664 <__gedf2+0xb4>
    d5f4:	01036833          	or	a6,t1,a6
    d5f8:	06051063          	bnez	a0,d658 <__gedf2+0xa8>
    d5fc:	00c7e633          	or	a2,a5,a2
    d600:	08060c63          	beqz	a2,d698 <__gedf2+0xe8>
    d604:	0a081263          	bnez	a6,d6a8 <__gedf2+0xf8>
    d608:	00100513          	li	a0,1
    d60c:	08068263          	beqz	a3,d690 <__gedf2+0xe0>
    d610:	00008067          	ret
    d614:	00c7e633          	or	a2,a5,a2
    d618:	08061463          	bnez	a2,d6a0 <__gedf2+0xf0>
    d61c:	00089663          	bnez	a7,d628 <__gedf2+0x78>
    d620:	01036333          	or	t1,t1,a6
    d624:	fe0302e3          	beqz	t1,d608 <__gedf2+0x58>
    d628:	06d58063          	beq	a1,a3,d688 <__gedf2+0xd8>
    d62c:	06059263          	bnez	a1,d690 <__gedf2+0xe0>
    d630:	00100513          	li	a0,1
    d634:	00008067          	ret
    d638:	01036333          	or	t1,t1,a6
    d63c:	06031263          	bnez	t1,d6a0 <__gedf2+0xf0>
    d640:	ff1516e3          	bne	a0,a7,d62c <__gedf2+0x7c>
    d644:	00c7e7b3          	or	a5,a5,a2
    d648:	04079c63          	bnez	a5,d6a0 <__gedf2+0xf0>
    d64c:	fed590e3          	bne	a1,a3,d62c <__gedf2+0x7c>
    d650:	00000513          	li	a0,0
    d654:	00008067          	ret
    d658:	fa0808e3          	beqz	a6,d608 <__gedf2+0x58>
    d65c:	fcd598e3          	bne	a1,a3,d62c <__gedf2+0x7c>
    d660:	0280006f          	j	d688 <__gedf2+0xd8>
    d664:	fc0504e3          	beqz	a0,d62c <__gedf2+0x7c>
    d668:	fcd592e3          	bne	a1,a3,d62c <__gedf2+0x7c>
    d66c:	fd1540e3          	blt	a0,a7,d62c <__gedf2+0x7c>
    d670:	00a8cc63          	blt	a7,a0,d688 <__gedf2+0xd8>
    d674:	fa67ece3          	bltu	a5,t1,d62c <__gedf2+0x7c>
    d678:	00f31863          	bne	t1,a5,d688 <__gedf2+0xd8>
    d67c:	fbdf68e3          	bltu	t5,t4,d62c <__gedf2+0x7c>
    d680:	00000513          	li	a0,0
    d684:	f9eef6e3          	bgeu	t4,t5,d610 <__gedf2+0x60>
    d688:	00100513          	li	a0,1
    d68c:	f80592e3          	bnez	a1,d610 <__gedf2+0x60>
    d690:	fff00513          	li	a0,-1
    d694:	00008067          	ret
    d698:	f8081ae3          	bnez	a6,d62c <__gedf2+0x7c>
    d69c:	00008067          	ret
    d6a0:	ffe00513          	li	a0,-2
    d6a4:	00008067          	ret
    d6a8:	fcd586e3          	beq	a1,a3,d674 <__gedf2+0xc4>
    d6ac:	f81ff06f          	j	d62c <__gedf2+0x7c>

0000d6b0 <__ledf2>:
    d6b0:	0145d893          	srl	a7,a1,0x14
    d6b4:	001007b7          	lui	a5,0x100
    d6b8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d6bc:	0146d713          	srl	a4,a3,0x14
    d6c0:	7ff8f893          	and	a7,a7,2047
    d6c4:	7ff00313          	li	t1,2047
    d6c8:	00b7fe33          	and	t3,a5,a1
    d6cc:	00050813          	mv	a6,a0
    d6d0:	00050e93          	mv	t4,a0
    d6d4:	00d7f7b3          	and	a5,a5,a3
    d6d8:	01f5d593          	srl	a1,a1,0x1f
    d6dc:	00060f13          	mv	t5,a2
    d6e0:	7ff77513          	and	a0,a4,2047
    d6e4:	01f6d693          	srl	a3,a3,0x1f
    d6e8:	04688a63          	beq	a7,t1,d73c <__ledf2+0x8c>
    d6ec:	02650463          	beq	a0,t1,d714 <__ledf2+0x64>
    d6f0:	06089863          	bnez	a7,d760 <__ledf2+0xb0>
    d6f4:	010e6833          	or	a6,t3,a6
    d6f8:	08051e63          	bnez	a0,d794 <__ledf2+0xe4>
    d6fc:	00c7e633          	or	a2,a5,a2
    d700:	0a060463          	beqz	a2,d7a8 <__ledf2+0xf8>
    d704:	0a081663          	bnez	a6,d7b0 <__ledf2+0x100>
    d708:	00100513          	li	a0,1
    d70c:	08068063          	beqz	a3,d78c <__ledf2+0xdc>
    d710:	00008067          	ret
    d714:	00c7e633          	or	a2,a5,a2
    d718:	00200513          	li	a0,2
    d71c:	fe061ae3          	bnez	a2,d710 <__ledf2+0x60>
    d720:	00089663          	bnez	a7,d72c <__ledf2+0x7c>
    d724:	010e6e33          	or	t3,t3,a6
    d728:	fe0e00e3          	beqz	t3,d708 <__ledf2+0x58>
    d72c:	04d58c63          	beq	a1,a3,d784 <__ledf2+0xd4>
    d730:	04059e63          	bnez	a1,d78c <__ledf2+0xdc>
    d734:	00100513          	li	a0,1
    d738:	00008067          	ret
    d73c:	010e6e33          	or	t3,t3,a6
    d740:	060e1063          	bnez	t3,d7a0 <__ledf2+0xf0>
    d744:	ff1516e3          	bne	a0,a7,d730 <__ledf2+0x80>
    d748:	00c7e7b3          	or	a5,a5,a2
    d74c:	00200513          	li	a0,2
    d750:	fc0790e3          	bnez	a5,d710 <__ledf2+0x60>
    d754:	fcd59ee3          	bne	a1,a3,d730 <__ledf2+0x80>
    d758:	00000513          	li	a0,0
    d75c:	00008067          	ret
    d760:	fc0508e3          	beqz	a0,d730 <__ledf2+0x80>
    d764:	fcd596e3          	bne	a1,a3,d730 <__ledf2+0x80>
    d768:	fd1544e3          	blt	a0,a7,d730 <__ledf2+0x80>
    d76c:	00a8cc63          	blt	a7,a0,d784 <__ledf2+0xd4>
    d770:	fdc7e0e3          	bltu	a5,t3,d730 <__ledf2+0x80>
    d774:	00fe1863          	bne	t3,a5,d784 <__ledf2+0xd4>
    d778:	fbdf6ce3          	bltu	t5,t4,d730 <__ledf2+0x80>
    d77c:	00000513          	li	a0,0
    d780:	f9eef8e3          	bgeu	t4,t5,d710 <__ledf2+0x60>
    d784:	00100513          	li	a0,1
    d788:	f80594e3          	bnez	a1,d710 <__ledf2+0x60>
    d78c:	fff00513          	li	a0,-1
    d790:	00008067          	ret
    d794:	f6080ae3          	beqz	a6,d708 <__ledf2+0x58>
    d798:	f8d59ce3          	bne	a1,a3,d730 <__ledf2+0x80>
    d79c:	fe9ff06f          	j	d784 <__ledf2+0xd4>
    d7a0:	00200513          	li	a0,2
    d7a4:	00008067          	ret
    d7a8:	f80814e3          	bnez	a6,d730 <__ledf2+0x80>
    d7ac:	00008067          	ret
    d7b0:	fcd580e3          	beq	a1,a3,d770 <__ledf2+0xc0>
    d7b4:	f7dff06f          	j	d730 <__ledf2+0x80>

0000d7b8 <__muldf3>:
    d7b8:	fd010113          	add	sp,sp,-48
    d7bc:	0145d793          	srl	a5,a1,0x14
    d7c0:	02812423          	sw	s0,40(sp)
    d7c4:	02912223          	sw	s1,36(sp)
    d7c8:	03212023          	sw	s2,32(sp)
    d7cc:	01312e23          	sw	s3,28(sp)
    d7d0:	01512a23          	sw	s5,20(sp)
    d7d4:	00c59493          	sll	s1,a1,0xc
    d7d8:	02112623          	sw	ra,44(sp)
    d7dc:	01412c23          	sw	s4,24(sp)
    d7e0:	01612823          	sw	s6,16(sp)
    d7e4:	01712623          	sw	s7,12(sp)
    d7e8:	01812423          	sw	s8,8(sp)
    d7ec:	7ff7f793          	and	a5,a5,2047
    d7f0:	00050413          	mv	s0,a0
    d7f4:	00060a93          	mv	s5,a2
    d7f8:	00068993          	mv	s3,a3
    d7fc:	00c4d493          	srl	s1,s1,0xc
    d800:	01f5d913          	srl	s2,a1,0x1f
    d804:	4e078063          	beqz	a5,dce4 <__muldf3+0x52c>
    d808:	7ff00713          	li	a4,2047
    d80c:	0ae78663          	beq	a5,a4,d8b8 <__muldf3+0x100>
    d810:	00349693          	sll	a3,s1,0x3
    d814:	01d55713          	srl	a4,a0,0x1d
    d818:	00d76733          	or	a4,a4,a3
    d81c:	008006b7          	lui	a3,0x800
    d820:	00d764b3          	or	s1,a4,a3
    d824:	00351a13          	sll	s4,a0,0x3
    d828:	c0178c13          	add	s8,a5,-1023
    d82c:	00000b13          	li	s6,0
    d830:	00000b93          	li	s7,0
    d834:	0149d793          	srl	a5,s3,0x14
    d838:	00c99713          	sll	a4,s3,0xc
    d83c:	7ff7f793          	and	a5,a5,2047
    d840:	000a8e13          	mv	t3,s5
    d844:	00c75413          	srl	s0,a4,0xc
    d848:	01f9d993          	srl	s3,s3,0x1f
    d84c:	0a078063          	beqz	a5,d8ec <__muldf3+0x134>
    d850:	7ff00713          	li	a4,2047
    d854:	14e78e63          	beq	a5,a4,d9b0 <__muldf3+0x1f8>
    d858:	00341713          	sll	a4,s0,0x3
    d85c:	01dad693          	srl	a3,s5,0x1d
    d860:	00e6e6b3          	or	a3,a3,a4
    d864:	c0178793          	add	a5,a5,-1023
    d868:	00800737          	lui	a4,0x800
    d86c:	00e6e433          	or	s0,a3,a4
    d870:	003a9e13          	sll	t3,s5,0x3
    d874:	01878333          	add	t1,a5,s8
    d878:	00000693          	li	a3,0
    d87c:	00a00793          	li	a5,10
    d880:	00130893          	add	a7,t1,1
    d884:	0b67cc63          	blt	a5,s6,d93c <__muldf3+0x184>
    d888:	013945b3          	xor	a1,s2,s3
    d88c:	00200793          	li	a5,2
    d890:	00058813          	mv	a6,a1
    d894:	1567c663          	blt	a5,s6,d9e0 <__muldf3+0x228>
    d898:	fffb0b13          	add	s6,s6,-1
    d89c:	00100713          	li	a4,1
    d8a0:	17676063          	bltu	a4,s6,da00 <__muldf3+0x248>
    d8a4:	48f68663          	beq	a3,a5,dd30 <__muldf3+0x578>
    d8a8:	00040493          	mv	s1,s0
    d8ac:	000e0a13          	mv	s4,t3
    d8b0:	00068b93          	mv	s7,a3
    d8b4:	09c0006f          	j	d950 <__muldf3+0x198>
    d8b8:	00a4ea33          	or	s4,s1,a0
    d8bc:	480a1463          	bnez	s4,dd44 <__muldf3+0x58c>
    d8c0:	0149d793          	srl	a5,s3,0x14
    d8c4:	00c99713          	sll	a4,s3,0xc
    d8c8:	7ff7f793          	and	a5,a5,2047
    d8cc:	00000493          	li	s1,0
    d8d0:	00800b13          	li	s6,8
    d8d4:	7ff00c13          	li	s8,2047
    d8d8:	00200b93          	li	s7,2
    d8dc:	000a8e13          	mv	t3,s5
    d8e0:	00c75413          	srl	s0,a4,0xc
    d8e4:	01f9d993          	srl	s3,s3,0x1f
    d8e8:	f60794e3          	bnez	a5,d850 <__muldf3+0x98>
    d8ec:	015467b3          	or	a5,s0,s5
    d8f0:	46078e63          	beqz	a5,dd6c <__muldf3+0x5b4>
    d8f4:	54040c63          	beqz	s0,de4c <__muldf3+0x694>
    d8f8:	00040513          	mv	a0,s0
    d8fc:	6f4010ef          	jal	eff0 <__clzsi2>
    d900:	00050313          	mv	t1,a0
    d904:	ff550713          	add	a4,a0,-11
    d908:	01d00793          	li	a5,29
    d90c:	ff830e13          	add	t3,t1,-8
    d910:	40e787b3          	sub	a5,a5,a4
    d914:	00fad7b3          	srl	a5,s5,a5
    d918:	01c41733          	sll	a4,s0,t3
    d91c:	00e7e433          	or	s0,a5,a4
    d920:	01ca9e33          	sll	t3,s5,t3
    d924:	406c0333          	sub	t1,s8,t1
    d928:	c0d30313          	add	t1,t1,-1011
    d92c:	00a00793          	li	a5,10
    d930:	00000693          	li	a3,0
    d934:	00130893          	add	a7,t1,1
    d938:	f567d8e3          	bge	a5,s6,d888 <__muldf3+0xd0>
    d93c:	00090593          	mv	a1,s2
    d940:	00200793          	li	a5,2
    d944:	3efb8663          	beq	s7,a5,dd30 <__muldf3+0x578>
    d948:	00300793          	li	a5,3
    d94c:	54fb8863          	beq	s7,a5,de9c <__muldf3+0x6e4>
    d950:	00100793          	li	a5,1
    d954:	00058813          	mv	a6,a1
    d958:	52fb9663          	bne	s7,a5,de84 <__muldf3+0x6cc>
    d95c:	00000793          	li	a5,0
    d960:	00000693          	li	a3,0
    d964:	00000713          	li	a4,0
    d968:	02c12083          	lw	ra,44(sp)
    d96c:	02812403          	lw	s0,40(sp)
    d970:	01479793          	sll	a5,a5,0x14
    d974:	00d7e7b3          	or	a5,a5,a3
    d978:	01f81813          	sll	a6,a6,0x1f
    d97c:	0107e7b3          	or	a5,a5,a6
    d980:	02412483          	lw	s1,36(sp)
    d984:	02012903          	lw	s2,32(sp)
    d988:	01c12983          	lw	s3,28(sp)
    d98c:	01812a03          	lw	s4,24(sp)
    d990:	01412a83          	lw	s5,20(sp)
    d994:	01012b03          	lw	s6,16(sp)
    d998:	00c12b83          	lw	s7,12(sp)
    d99c:	00812c03          	lw	s8,8(sp)
    d9a0:	00070513          	mv	a0,a4
    d9a4:	00078593          	mv	a1,a5
    d9a8:	03010113          	add	sp,sp,48
    d9ac:	00008067          	ret
    d9b0:	01546733          	or	a4,s0,s5
    d9b4:	7ffc0313          	add	t1,s8,2047
    d9b8:	3c070663          	beqz	a4,dd84 <__muldf3+0x5cc>
    d9bc:	00001737          	lui	a4,0x1
    d9c0:	01394833          	xor	a6,s2,s3
    d9c4:	80070713          	add	a4,a4,-2048 # 800 <main+0x2d8>
    d9c8:	003b6b13          	or	s6,s6,3
    d9cc:	00a00693          	li	a3,10
    d9d0:	00080593          	mv	a1,a6
    d9d4:	00ec08b3          	add	a7,s8,a4
    d9d8:	4366cc63          	blt	a3,s6,de10 <__muldf3+0x658>
    d9dc:	00300693          	li	a3,3
    d9e0:	00100613          	li	a2,1
    d9e4:	01661633          	sll	a2,a2,s6
    d9e8:	53067713          	and	a4,a2,1328
    d9ec:	f4071ae3          	bnez	a4,d940 <__muldf3+0x188>
    d9f0:	24067793          	and	a5,a2,576
    d9f4:	48079063          	bnez	a5,de74 <__muldf3+0x6bc>
    d9f8:	08867613          	and	a2,a2,136
    d9fc:	38061e63          	bnez	a2,dd98 <__muldf3+0x5e0>
    da00:	00010fb7          	lui	t6,0x10
    da04:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    da08:	005a7f33          	and	t5,s4,t0
    da0c:	005e72b3          	and	t0,t3,t0
    da10:	010a5a13          	srl	s4,s4,0x10
    da14:	010e5e13          	srl	t3,t3,0x10
    da18:	000f0513          	mv	a0,t5
    da1c:	00028593          	mv	a1,t0
    da20:	460010ef          	jal	ee80 <__mulsi3>
    da24:	00050713          	mv	a4,a0
    da28:	000e0593          	mv	a1,t3
    da2c:	000f0513          	mv	a0,t5
    da30:	450010ef          	jal	ee80 <__mulsi3>
    da34:	00050793          	mv	a5,a0
    da38:	00028593          	mv	a1,t0
    da3c:	000a0513          	mv	a0,s4
    da40:	440010ef          	jal	ee80 <__mulsi3>
    da44:	00050e93          	mv	t4,a0
    da48:	000e0593          	mv	a1,t3
    da4c:	000a0513          	mv	a0,s4
    da50:	430010ef          	jal	ee80 <__mulsi3>
    da54:	01d786b3          	add	a3,a5,t4
    da58:	01075393          	srl	t2,a4,0x10
    da5c:	00d383b3          	add	t2,t2,a3
    da60:	00050793          	mv	a5,a0
    da64:	01d3f463          	bgeu	t2,t4,da6c <__muldf3+0x2b4>
    da68:	01f507b3          	add	a5,a0,t6
    da6c:	000109b7          	lui	s3,0x10
    da70:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    da74:	0123feb3          	and	t4,t2,s2
    da78:	01277733          	and	a4,a4,s2
    da7c:	010e9e93          	sll	t4,t4,0x10
    da80:	01247933          	and	s2,s0,s2
    da84:	0103d393          	srl	t2,t2,0x10
    da88:	00ee8eb3          	add	t4,t4,a4
    da8c:	01045413          	srl	s0,s0,0x10
    da90:	000f0513          	mv	a0,t5
    da94:	00090593          	mv	a1,s2
    da98:	3e8010ef          	jal	ee80 <__mulsi3>
    da9c:	00050f93          	mv	t6,a0
    daa0:	00040593          	mv	a1,s0
    daa4:	000f0513          	mv	a0,t5
    daa8:	3d8010ef          	jal	ee80 <__mulsi3>
    daac:	00050713          	mv	a4,a0
    dab0:	00090593          	mv	a1,s2
    dab4:	000a0513          	mv	a0,s4
    dab8:	3c8010ef          	jal	ee80 <__mulsi3>
    dabc:	00050f13          	mv	t5,a0
    dac0:	00040593          	mv	a1,s0
    dac4:	000a0513          	mv	a0,s4
    dac8:	3b8010ef          	jal	ee80 <__mulsi3>
    dacc:	010fd693          	srl	a3,t6,0x10
    dad0:	01e70733          	add	a4,a4,t5
    dad4:	00e686b3          	add	a3,a3,a4
    dad8:	01e6f463          	bgeu	a3,t5,dae0 <__muldf3+0x328>
    dadc:	01350533          	add	a0,a0,s3
    dae0:	00010a37          	lui	s4,0x10
    dae4:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    dae8:	01e6f733          	and	a4,a3,t5
    daec:	01efffb3          	and	t6,t6,t5
    daf0:	01071713          	sll	a4,a4,0x10
    daf4:	01f70733          	add	a4,a4,t6
    daf8:	01e4ff33          	and	t5,s1,t5
    dafc:	0106d693          	srl	a3,a3,0x10
    db00:	00a68fb3          	add	t6,a3,a0
    db04:	00e383b3          	add	t2,t2,a4
    db08:	0104d493          	srl	s1,s1,0x10
    db0c:	000f0513          	mv	a0,t5
    db10:	00028593          	mv	a1,t0
    db14:	36c010ef          	jal	ee80 <__mulsi3>
    db18:	00050a93          	mv	s5,a0
    db1c:	000e0593          	mv	a1,t3
    db20:	000f0513          	mv	a0,t5
    db24:	35c010ef          	jal	ee80 <__mulsi3>
    db28:	00050993          	mv	s3,a0
    db2c:	00028593          	mv	a1,t0
    db30:	00048513          	mv	a0,s1
    db34:	34c010ef          	jal	ee80 <__mulsi3>
    db38:	00050293          	mv	t0,a0
    db3c:	000e0593          	mv	a1,t3
    db40:	00048513          	mv	a0,s1
    db44:	33c010ef          	jal	ee80 <__mulsi3>
    db48:	010ad613          	srl	a2,s5,0x10
    db4c:	005989b3          	add	s3,s3,t0
    db50:	01360633          	add	a2,a2,s3
    db54:	00567463          	bgeu	a2,t0,db5c <__muldf3+0x3a4>
    db58:	01450533          	add	a0,a0,s4
    db5c:	00010a37          	lui	s4,0x10
    db60:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    db64:	00d672b3          	and	t0,a2,a3
    db68:	00dafab3          	and	s5,s5,a3
    db6c:	01065613          	srl	a2,a2,0x10
    db70:	01029293          	sll	t0,t0,0x10
    db74:	00a60e33          	add	t3,a2,a0
    db78:	015282b3          	add	t0,t0,s5
    db7c:	000f0513          	mv	a0,t5
    db80:	00090593          	mv	a1,s2
    db84:	2fc010ef          	jal	ee80 <__mulsi3>
    db88:	00050993          	mv	s3,a0
    db8c:	00040593          	mv	a1,s0
    db90:	000f0513          	mv	a0,t5
    db94:	2ec010ef          	jal	ee80 <__mulsi3>
    db98:	00050f13          	mv	t5,a0
    db9c:	00090593          	mv	a1,s2
    dba0:	00048513          	mv	a0,s1
    dba4:	2dc010ef          	jal	ee80 <__mulsi3>
    dba8:	00050913          	mv	s2,a0
    dbac:	00040593          	mv	a1,s0
    dbb0:	00048513          	mv	a0,s1
    dbb4:	2cc010ef          	jal	ee80 <__mulsi3>
    dbb8:	012f06b3          	add	a3,t5,s2
    dbbc:	0109d593          	srl	a1,s3,0x10
    dbc0:	00d58433          	add	s0,a1,a3
    dbc4:	00050f13          	mv	t5,a0
    dbc8:	01247463          	bgeu	s0,s2,dbd0 <__muldf3+0x418>
    dbcc:	01450f33          	add	t5,a0,s4
    dbd0:	00010637          	lui	a2,0x10
    dbd4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x4a7>
    dbd8:	00c476b3          	and	a3,s0,a2
    dbdc:	00c9f9b3          	and	s3,s3,a2
    dbe0:	01069693          	sll	a3,a3,0x10
    dbe4:	007787b3          	add	a5,a5,t2
    dbe8:	013686b3          	add	a3,a3,s3
    dbec:	01f685b3          	add	a1,a3,t6
    dbf0:	00e7b733          	sltu	a4,a5,a4
    dbf4:	00e58733          	add	a4,a1,a4
    dbf8:	005782b3          	add	t0,a5,t0
    dbfc:	01c70633          	add	a2,a4,t3
    dc00:	00f2b7b3          	sltu	a5,t0,a5
    dc04:	00f607b3          	add	a5,a2,a5
    dc08:	00d5b6b3          	sltu	a3,a1,a3
    dc0c:	00b735b3          	sltu	a1,a4,a1
    dc10:	00b6e6b3          	or	a3,a3,a1
    dc14:	00e63733          	sltu	a4,a2,a4
    dc18:	01045593          	srl	a1,s0,0x10
    dc1c:	00c7b633          	sltu	a2,a5,a2
    dc20:	00b686b3          	add	a3,a3,a1
    dc24:	00929a13          	sll	s4,t0,0x9
    dc28:	00c76733          	or	a4,a4,a2
    dc2c:	00d70733          	add	a4,a4,a3
    dc30:	01da6a33          	or	s4,s4,t4
    dc34:	01e70733          	add	a4,a4,t5
    dc38:	01403a33          	snez	s4,s4
    dc3c:	0172d293          	srl	t0,t0,0x17
    dc40:	00971713          	sll	a4,a4,0x9
    dc44:	0177d693          	srl	a3,a5,0x17
    dc48:	005a6a33          	or	s4,s4,t0
    dc4c:	00979793          	sll	a5,a5,0x9
    dc50:	00fa6a33          	or	s4,s4,a5
    dc54:	00771793          	sll	a5,a4,0x7
    dc58:	00d764b3          	or	s1,a4,a3
    dc5c:	0207d063          	bgez	a5,dc7c <__muldf3+0x4c4>
    dc60:	001a5793          	srl	a5,s4,0x1
    dc64:	001a7a13          	and	s4,s4,1
    dc68:	01f49713          	sll	a4,s1,0x1f
    dc6c:	0147e7b3          	or	a5,a5,s4
    dc70:	00e7ea33          	or	s4,a5,a4
    dc74:	0014d493          	srl	s1,s1,0x1
    dc78:	00088313          	mv	t1,a7
    dc7c:	3ff30793          	add	a5,t1,1023
    dc80:	12f05663          	blez	a5,ddac <__muldf3+0x5f4>
    dc84:	007a7713          	and	a4,s4,7
    dc88:	02070063          	beqz	a4,dca8 <__muldf3+0x4f0>
    dc8c:	00fa7713          	and	a4,s4,15
    dc90:	00400693          	li	a3,4
    dc94:	00d70a63          	beq	a4,a3,dca8 <__muldf3+0x4f0>
    dc98:	004a0713          	add	a4,s4,4
    dc9c:	01473a33          	sltu	s4,a4,s4
    dca0:	014484b3          	add	s1,s1,s4
    dca4:	00070a13          	mv	s4,a4
    dca8:	00749713          	sll	a4,s1,0x7
    dcac:	00075a63          	bgez	a4,dcc0 <__muldf3+0x508>
    dcb0:	ff0007b7          	lui	a5,0xff000
    dcb4:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    dcb8:	00f4f4b3          	and	s1,s1,a5
    dcbc:	40030793          	add	a5,t1,1024
    dcc0:	7fe00713          	li	a4,2046
    dcc4:	1cf74463          	blt	a4,a5,de8c <__muldf3+0x6d4>
    dcc8:	003a5a13          	srl	s4,s4,0x3
    dccc:	01d49713          	sll	a4,s1,0x1d
    dcd0:	00949693          	sll	a3,s1,0x9
    dcd4:	01476733          	or	a4,a4,s4
    dcd8:	00c6d693          	srl	a3,a3,0xc
    dcdc:	7ff7f793          	and	a5,a5,2047
    dce0:	c89ff06f          	j	d968 <__muldf3+0x1b0>
    dce4:	00a4ea33          	or	s4,s1,a0
    dce8:	060a0863          	beqz	s4,dd58 <__muldf3+0x5a0>
    dcec:	12048e63          	beqz	s1,de28 <__muldf3+0x670>
    dcf0:	00048513          	mv	a0,s1
    dcf4:	2fc010ef          	jal	eff0 <__clzsi2>
    dcf8:	00050713          	mv	a4,a0
    dcfc:	ff550693          	add	a3,a0,-11
    dd00:	01d00793          	li	a5,29
    dd04:	ff870a13          	add	s4,a4,-8
    dd08:	40d787b3          	sub	a5,a5,a3
    dd0c:	00f457b3          	srl	a5,s0,a5
    dd10:	014496b3          	sll	a3,s1,s4
    dd14:	00d7e4b3          	or	s1,a5,a3
    dd18:	01441a33          	sll	s4,s0,s4
    dd1c:	c0d00793          	li	a5,-1011
    dd20:	40e78c33          	sub	s8,a5,a4
    dd24:	00000b13          	li	s6,0
    dd28:	00000b93          	li	s7,0
    dd2c:	b09ff06f          	j	d834 <__muldf3+0x7c>
    dd30:	00058813          	mv	a6,a1
    dd34:	7ff00793          	li	a5,2047
    dd38:	00000693          	li	a3,0
    dd3c:	00000713          	li	a4,0
    dd40:	c29ff06f          	j	d968 <__muldf3+0x1b0>
    dd44:	00050a13          	mv	s4,a0
    dd48:	00c00b13          	li	s6,12
    dd4c:	7ff00c13          	li	s8,2047
    dd50:	00300b93          	li	s7,3
    dd54:	ae1ff06f          	j	d834 <__muldf3+0x7c>
    dd58:	00000493          	li	s1,0
    dd5c:	00400b13          	li	s6,4
    dd60:	00000c13          	li	s8,0
    dd64:	00100b93          	li	s7,1
    dd68:	acdff06f          	j	d834 <__muldf3+0x7c>
    dd6c:	001b6b13          	or	s6,s6,1
    dd70:	000c0313          	mv	t1,s8
    dd74:	00000413          	li	s0,0
    dd78:	00000e13          	li	t3,0
    dd7c:	00100693          	li	a3,1
    dd80:	afdff06f          	j	d87c <__muldf3+0xc4>
    dd84:	002b6b13          	or	s6,s6,2
    dd88:	00000413          	li	s0,0
    dd8c:	00000e13          	li	t3,0
    dd90:	00200693          	li	a3,2
    dd94:	ae9ff06f          	j	d87c <__muldf3+0xc4>
    dd98:	00040493          	mv	s1,s0
    dd9c:	000e0a13          	mv	s4,t3
    dda0:	00068b93          	mv	s7,a3
    dda4:	00098593          	mv	a1,s3
    dda8:	b99ff06f          	j	d940 <__muldf3+0x188>
    ddac:	00100713          	li	a4,1
    ddb0:	10079063          	bnez	a5,deb0 <__muldf3+0x6f8>
    ddb4:	41e30313          	add	t1,t1,1054
    ddb8:	006a1633          	sll	a2,s4,t1
    ddbc:	00c03633          	snez	a2,a2
    ddc0:	00649333          	sll	t1,s1,t1
    ddc4:	00ea5a33          	srl	s4,s4,a4
    ddc8:	00666633          	or	a2,a2,t1
    ddcc:	01466633          	or	a2,a2,s4
    ddd0:	00767793          	and	a5,a2,7
    ddd4:	00e4d5b3          	srl	a1,s1,a4
    ddd8:	02078063          	beqz	a5,ddf8 <__muldf3+0x640>
    dddc:	00f67793          	and	a5,a2,15
    dde0:	00400713          	li	a4,4
    dde4:	00e78a63          	beq	a5,a4,ddf8 <__muldf3+0x640>
    dde8:	00460793          	add	a5,a2,4
    ddec:	00c7b633          	sltu	a2,a5,a2
    ddf0:	00c585b3          	add	a1,a1,a2
    ddf4:	00078613          	mv	a2,a5
    ddf8:	00859513          	sll	a0,a1,0x8
    ddfc:	00100793          	li	a5,1
    de00:	00000693          	li	a3,0
    de04:	00000713          	li	a4,0
    de08:	b60540e3          	bltz	a0,d968 <__muldf3+0x1b0>
    de0c:	10c0006f          	j	df18 <__muldf3+0x760>
    de10:	00f00713          	li	a4,15
    de14:	12eb1063          	bne	s6,a4,df34 <__muldf3+0x77c>
    de18:	00000813          	li	a6,0
    de1c:	000806b7          	lui	a3,0x80
    de20:	00000713          	li	a4,0
    de24:	b45ff06f          	j	d968 <__muldf3+0x1b0>
    de28:	1c8010ef          	jal	eff0 <__clzsi2>
    de2c:	01550693          	add	a3,a0,21
    de30:	01c00793          	li	a5,28
    de34:	02050713          	add	a4,a0,32
    de38:	ecd7d4e3          	bge	a5,a3,dd00 <__muldf3+0x548>
    de3c:	ff850513          	add	a0,a0,-8
    de40:	00000a13          	li	s4,0
    de44:	00a414b3          	sll	s1,s0,a0
    de48:	ed5ff06f          	j	dd1c <__muldf3+0x564>
    de4c:	000a8513          	mv	a0,s5
    de50:	1a0010ef          	jal	eff0 <__clzsi2>
    de54:	01550713          	add	a4,a0,21
    de58:	01c00793          	li	a5,28
    de5c:	02050313          	add	t1,a0,32
    de60:	aae7d4e3          	bge	a5,a4,d908 <__muldf3+0x150>
    de64:	ff850513          	add	a0,a0,-8
    de68:	00000e13          	li	t3,0
    de6c:	00aa9433          	sll	s0,s5,a0
    de70:	ab5ff06f          	j	d924 <__muldf3+0x16c>
    de74:	00000813          	li	a6,0
    de78:	7ff00793          	li	a5,2047
    de7c:	000806b7          	lui	a3,0x80
    de80:	ae9ff06f          	j	d968 <__muldf3+0x1b0>
    de84:	00088313          	mv	t1,a7
    de88:	df5ff06f          	j	dc7c <__muldf3+0x4c4>
    de8c:	7ff00793          	li	a5,2047
    de90:	00000693          	li	a3,0
    de94:	00000713          	li	a4,0
    de98:	ad1ff06f          	j	d968 <__muldf3+0x1b0>
    de9c:	00000813          	li	a6,0
    dea0:	7ff00793          	li	a5,2047
    dea4:	000806b7          	lui	a3,0x80
    dea8:	00000713          	li	a4,0
    deac:	abdff06f          	j	d968 <__muldf3+0x1b0>
    deb0:	40f70733          	sub	a4,a4,a5
    deb4:	03800693          	li	a3,56
    deb8:	aae6c2e3          	blt	a3,a4,d95c <__muldf3+0x1a4>
    debc:	01f00693          	li	a3,31
    dec0:	eee6dae3          	bge	a3,a4,ddb4 <__muldf3+0x5fc>
    dec4:	fe100693          	li	a3,-31
    dec8:	40f687b3          	sub	a5,a3,a5
    decc:	02000693          	li	a3,32
    ded0:	00f4d7b3          	srl	a5,s1,a5
    ded4:	00d70863          	beq	a4,a3,dee4 <__muldf3+0x72c>
    ded8:	43e30313          	add	t1,t1,1086
    dedc:	00649333          	sll	t1,s1,t1
    dee0:	006a6a33          	or	s4,s4,t1
    dee4:	01403633          	snez	a2,s4
    dee8:	00f66633          	or	a2,a2,a5
    deec:	00767713          	and	a4,a2,7
    def0:	00000693          	li	a3,0
    def4:	02070863          	beqz	a4,df24 <__muldf3+0x76c>
    def8:	00f67793          	and	a5,a2,15
    defc:	00400713          	li	a4,4
    df00:	00000593          	li	a1,0
    df04:	00e78a63          	beq	a5,a4,df18 <__muldf3+0x760>
    df08:	00460793          	add	a5,a2,4
    df0c:	00c7b633          	sltu	a2,a5,a2
    df10:	00c035b3          	snez	a1,a2
    df14:	00078613          	mv	a2,a5
    df18:	00959693          	sll	a3,a1,0x9
    df1c:	01d59713          	sll	a4,a1,0x1d
    df20:	00c6d693          	srl	a3,a3,0xc
    df24:	00365613          	srl	a2,a2,0x3
    df28:	00e66733          	or	a4,a2,a4
    df2c:	00000793          	li	a5,0
    df30:	a39ff06f          	j	d968 <__muldf3+0x1b0>
    df34:	00040493          	mv	s1,s0
    df38:	000a8a13          	mv	s4,s5
    df3c:	00300b93          	li	s7,3
    df40:	00098593          	mv	a1,s3
    df44:	9fdff06f          	j	d940 <__muldf3+0x188>

0000df48 <__subdf3>:
    df48:	001007b7          	lui	a5,0x100
    df4c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    df50:	fe010113          	add	sp,sp,-32
    df54:	00b7f8b3          	and	a7,a5,a1
    df58:	00d7f833          	and	a6,a5,a3
    df5c:	0146d793          	srl	a5,a3,0x14
    df60:	00389893          	sll	a7,a7,0x3
    df64:	00812c23          	sw	s0,24(sp)
    df68:	01312623          	sw	s3,12(sp)
    df6c:	01f5d413          	srl	s0,a1,0x1f
    df70:	0145d993          	srl	s3,a1,0x14
    df74:	01d55713          	srl	a4,a0,0x1d
    df78:	00381813          	sll	a6,a6,0x3
    df7c:	01d65593          	srl	a1,a2,0x1d
    df80:	00112e23          	sw	ra,28(sp)
    df84:	00912a23          	sw	s1,20(sp)
    df88:	01212823          	sw	s2,16(sp)
    df8c:	7ff7ff13          	and	t5,a5,2047
    df90:	7ff00313          	li	t1,2047
    df94:	01176733          	or	a4,a4,a7
    df98:	7ff9f993          	and	s3,s3,2047
    df9c:	00040e13          	mv	t3,s0
    dfa0:	00351893          	sll	a7,a0,0x3
    dfa4:	01f6d693          	srl	a3,a3,0x1f
    dfa8:	0105e5b3          	or	a1,a1,a6
    dfac:	00361e93          	sll	t4,a2,0x3
    dfb0:	206f0c63          	beq	t5,t1,e1c8 <__subdf3+0x280>
    dfb4:	0016c693          	xor	a3,a3,1
    dfb8:	41e987b3          	sub	a5,s3,t5
    dfbc:	16d40263          	beq	s0,a3,e120 <__subdf3+0x1d8>
    dfc0:	00f05ae3          	blez	a5,e7d4 <__subdf3+0x88c>
    dfc4:	240f0a63          	beqz	t5,e218 <__subdf3+0x2d0>
    dfc8:	3c698463          	beq	s3,t1,e390 <__subdf3+0x448>
    dfcc:	03800693          	li	a3,56
    dfd0:	00100513          	li	a0,1
    dfd4:	02f6ce63          	blt	a3,a5,e010 <__subdf3+0xc8>
    dfd8:	008006b7          	lui	a3,0x800
    dfdc:	00d5e5b3          	or	a1,a1,a3
    dfe0:	01f00693          	li	a3,31
    dfe4:	4ef6c463          	blt	a3,a5,e4cc <__subdf3+0x584>
    dfe8:	02000693          	li	a3,32
    dfec:	40f686b3          	sub	a3,a3,a5
    dff0:	00d59533          	sll	a0,a1,a3
    dff4:	00fed633          	srl	a2,t4,a5
    dff8:	00de96b3          	sll	a3,t4,a3
    dffc:	00c56533          	or	a0,a0,a2
    e000:	00d036b3          	snez	a3,a3
    e004:	00f5d7b3          	srl	a5,a1,a5
    e008:	00d56533          	or	a0,a0,a3
    e00c:	40f70733          	sub	a4,a4,a5
    e010:	40a88533          	sub	a0,a7,a0
    e014:	00a8b633          	sltu	a2,a7,a0
    e018:	00050493          	mv	s1,a0
    e01c:	40c70933          	sub	s2,a4,a2
    e020:	00891793          	sll	a5,s2,0x8
    e024:	3407d863          	bgez	a5,e374 <__subdf3+0x42c>
    e028:	008007b7          	lui	a5,0x800
    e02c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    e030:	00f97933          	and	s2,s2,a5
    e034:	2e090663          	beqz	s2,e320 <__subdf3+0x3d8>
    e038:	00090513          	mv	a0,s2
    e03c:	7b5000ef          	jal	eff0 <__clzsi2>
    e040:	ff850793          	add	a5,a0,-8
    e044:	02000693          	li	a3,32
    e048:	40f68733          	sub	a4,a3,a5
    e04c:	00e4d733          	srl	a4,s1,a4
    e050:	00f91933          	sll	s2,s2,a5
    e054:	01276733          	or	a4,a4,s2
    e058:	00f494b3          	sll	s1,s1,a5
    e05c:	3f37c463          	blt	a5,s3,e444 <__subdf3+0x4fc>
    e060:	413787b3          	sub	a5,a5,s3
    e064:	00178793          	add	a5,a5,1
    e068:	40f686b3          	sub	a3,a3,a5
    e06c:	00d49633          	sll	a2,s1,a3
    e070:	00f4d933          	srl	s2,s1,a5
    e074:	00c03633          	snez	a2,a2
    e078:	00c96633          	or	a2,s2,a2
    e07c:	00d716b3          	sll	a3,a4,a3
    e080:	00c6e4b3          	or	s1,a3,a2
    e084:	00f75933          	srl	s2,a4,a5
    e088:	00000993          	li	s3,0
    e08c:	0074f793          	and	a5,s1,7
    e090:	02078063          	beqz	a5,e0b0 <__subdf3+0x168>
    e094:	00f4f793          	and	a5,s1,15
    e098:	00400713          	li	a4,4
    e09c:	00e78a63          	beq	a5,a4,e0b0 <__subdf3+0x168>
    e0a0:	00448793          	add	a5,s1,4
    e0a4:	0097b533          	sltu	a0,a5,s1
    e0a8:	00a90933          	add	s2,s2,a0
    e0ac:	00078493          	mv	s1,a5
    e0b0:	00891793          	sll	a5,s2,0x8
    e0b4:	6c07d063          	bgez	a5,e774 <__subdf3+0x82c>
    e0b8:	00198793          	add	a5,s3,1
    e0bc:	7ff00713          	li	a4,2047
    e0c0:	24e78663          	beq	a5,a4,e30c <__subdf3+0x3c4>
    e0c4:	ff800737          	lui	a4,0xff800
    e0c8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0cc:	00e97733          	and	a4,s2,a4
    e0d0:	7ff7f793          	and	a5,a5,2047
    e0d4:	01d71813          	sll	a6,a4,0x1d
    e0d8:	0034d513          	srl	a0,s1,0x3
    e0dc:	00971713          	sll	a4,a4,0x9
    e0e0:	00a86833          	or	a6,a6,a0
    e0e4:	00c75713          	srl	a4,a4,0xc
    e0e8:	00147e13          	and	t3,s0,1
    e0ec:	01c12083          	lw	ra,28(sp)
    e0f0:	01812403          	lw	s0,24(sp)
    e0f4:	01479793          	sll	a5,a5,0x14
    e0f8:	00e7e7b3          	or	a5,a5,a4
    e0fc:	01fe1713          	sll	a4,t3,0x1f
    e100:	00e7e7b3          	or	a5,a5,a4
    e104:	01412483          	lw	s1,20(sp)
    e108:	01012903          	lw	s2,16(sp)
    e10c:	00c12983          	lw	s3,12(sp)
    e110:	00080513          	mv	a0,a6
    e114:	00078593          	mv	a1,a5
    e118:	02010113          	add	sp,sp,32
    e11c:	00008067          	ret
    e120:	70f05263          	blez	a5,e824 <__subdf3+0x8dc>
    e124:	1c0f1663          	bnez	t5,e2f0 <__subdf3+0x3a8>
    e128:	01d5e6b3          	or	a3,a1,t4
    e12c:	26068e63          	beqz	a3,e3a8 <__subdf3+0x460>
    e130:	fff78693          	add	a3,a5,-1
    e134:	46068863          	beqz	a3,e5a4 <__subdf3+0x65c>
    e138:	24678c63          	beq	a5,t1,e390 <__subdf3+0x448>
    e13c:	03800793          	li	a5,56
    e140:	00100913          	li	s2,1
    e144:	02d7cc63          	blt	a5,a3,e17c <__subdf3+0x234>
    e148:	00068793          	mv	a5,a3
    e14c:	01f00693          	li	a3,31
    e150:	48f6ca63          	blt	a3,a5,e5e4 <__subdf3+0x69c>
    e154:	02000693          	li	a3,32
    e158:	40f686b3          	sub	a3,a3,a5
    e15c:	00d59933          	sll	s2,a1,a3
    e160:	00fed633          	srl	a2,t4,a5
    e164:	00de96b3          	sll	a3,t4,a3
    e168:	00c96933          	or	s2,s2,a2
    e16c:	00d036b3          	snez	a3,a3
    e170:	00f5d7b3          	srl	a5,a1,a5
    e174:	00d96933          	or	s2,s2,a3
    e178:	00f70733          	add	a4,a4,a5
    e17c:	01190633          	add	a2,s2,a7
    e180:	01263933          	sltu	s2,a2,s2
    e184:	00060493          	mv	s1,a2
    e188:	00e90933          	add	s2,s2,a4
    e18c:	00891793          	sll	a5,s2,0x8
    e190:	1e07d263          	bgez	a5,e374 <__subdf3+0x42c>
    e194:	00198993          	add	s3,s3,1
    e198:	7ff00793          	li	a5,2047
    e19c:	16f98863          	beq	s3,a5,e30c <__subdf3+0x3c4>
    e1a0:	ff8007b7          	lui	a5,0xff800
    e1a4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1a8:	0014f513          	and	a0,s1,1
    e1ac:	00f977b3          	and	a5,s2,a5
    e1b0:	0014d713          	srl	a4,s1,0x1
    e1b4:	00a76733          	or	a4,a4,a0
    e1b8:	01f79513          	sll	a0,a5,0x1f
    e1bc:	00e564b3          	or	s1,a0,a4
    e1c0:	0017d913          	srl	s2,a5,0x1
    e1c4:	ec9ff06f          	j	e08c <__subdf3+0x144>
    e1c8:	01d5e833          	or	a6,a1,t4
    e1cc:	80198313          	add	t1,s3,-2047
    e1d0:	06080863          	beqz	a6,e240 <__subdf3+0x2f8>
    e1d4:	06d40a63          	beq	s0,a3,e248 <__subdf3+0x300>
    e1d8:	0e030463          	beqz	t1,e2c0 <__subdf3+0x378>
    e1dc:	26098e63          	beqz	s3,e458 <__subdf3+0x510>
    e1e0:	00361513          	sll	a0,a2,0x3
    e1e4:	00355513          	srl	a0,a0,0x3
    e1e8:	00068413          	mv	s0,a3
    e1ec:	00058713          	mv	a4,a1
    e1f0:	01d71813          	sll	a6,a4,0x1d
    e1f4:	00a86833          	or	a6,a6,a0
    e1f8:	00375713          	srl	a4,a4,0x3
    e1fc:	01076733          	or	a4,a4,a6
    e200:	10070663          	beqz	a4,e30c <__subdf3+0x3c4>
    e204:	00000e13          	li	t3,0
    e208:	7ff00793          	li	a5,2047
    e20c:	00080737          	lui	a4,0x80
    e210:	00000813          	li	a6,0
    e214:	ed9ff06f          	j	e0ec <__subdf3+0x1a4>
    e218:	01d5e6b3          	or	a3,a1,t4
    e21c:	18068663          	beqz	a3,e3a8 <__subdf3+0x460>
    e220:	fff78693          	add	a3,a5,-1
    e224:	3a068263          	beqz	a3,e5c8 <__subdf3+0x680>
    e228:	16678463          	beq	a5,t1,e390 <__subdf3+0x448>
    e22c:	03800793          	li	a5,56
    e230:	00100513          	li	a0,1
    e234:	dcd7cee3          	blt	a5,a3,e010 <__subdf3+0xc8>
    e238:	00068793          	mv	a5,a3
    e23c:	da5ff06f          	j	dfe0 <__subdf3+0x98>
    e240:	0016c693          	xor	a3,a3,1
    e244:	f8d41ae3          	bne	s0,a3,e1d8 <__subdf3+0x290>
    e248:	18030863          	beqz	t1,e3d8 <__subdf3+0x490>
    e24c:	2c099063          	bnez	s3,e50c <__subdf3+0x5c4>
    e250:	7ff00793          	li	a5,2047
    e254:	011766b3          	or	a3,a4,a7
    e258:	48068863          	beqz	a3,e6e8 <__subdf3+0x7a0>
    e25c:	fff78693          	add	a3,a5,-1
    e260:	34068263          	beqz	a3,e5a4 <__subdf3+0x65c>
    e264:	7ff00513          	li	a0,2047
    e268:	2aa78263          	beq	a5,a0,e50c <__subdf3+0x5c4>
    e26c:	03800793          	li	a5,56
    e270:	00100913          	li	s2,1
    e274:	02d7ca63          	blt	a5,a3,e2a8 <__subdf3+0x360>
    e278:	01f00793          	li	a5,31
    e27c:	4cd7c663          	blt	a5,a3,e748 <__subdf3+0x800>
    e280:	02000793          	li	a5,32
    e284:	40d787b3          	sub	a5,a5,a3
    e288:	00f71933          	sll	s2,a4,a5
    e28c:	00d8d633          	srl	a2,a7,a3
    e290:	00f897b3          	sll	a5,a7,a5
    e294:	00c96933          	or	s2,s2,a2
    e298:	00f037b3          	snez	a5,a5
    e29c:	00d756b3          	srl	a3,a4,a3
    e2a0:	00f96933          	or	s2,s2,a5
    e2a4:	00d585b3          	add	a1,a1,a3
    e2a8:	01d90733          	add	a4,s2,t4
    e2ac:	01273933          	sltu	s2,a4,s2
    e2b0:	00070493          	mv	s1,a4
    e2b4:	00b90933          	add	s2,s2,a1
    e2b8:	000f0993          	mv	s3,t5
    e2bc:	ed1ff06f          	j	e18c <__subdf3+0x244>
    e2c0:	00198793          	add	a5,s3,1
    e2c4:	7fe7f793          	and	a5,a5,2046
    e2c8:	14079463          	bnez	a5,e410 <__subdf3+0x4c8>
    e2cc:	01d5e833          	or	a6,a1,t4
    e2d0:	011767b3          	or	a5,a4,a7
    e2d4:	2a099463          	bnez	s3,e57c <__subdf3+0x634>
    e2d8:	38078e63          	beqz	a5,e674 <__subdf3+0x72c>
    e2dc:	3c081063          	bnez	a6,e69c <__subdf3+0x754>
    e2e0:	00351513          	sll	a0,a0,0x3
    e2e4:	00355913          	srl	s2,a0,0x3
    e2e8:	00000793          	li	a5,0
    e2ec:	1140006f          	j	e400 <__subdf3+0x4b8>
    e2f0:	0a698063          	beq	s3,t1,e390 <__subdf3+0x448>
    e2f4:	03800693          	li	a3,56
    e2f8:	00100913          	li	s2,1
    e2fc:	e8f6c0e3          	blt	a3,a5,e17c <__subdf3+0x234>
    e300:	008006b7          	lui	a3,0x800
    e304:	00d5e5b3          	or	a1,a1,a3
    e308:	e45ff06f          	j	e14c <__subdf3+0x204>
    e30c:	00147e13          	and	t3,s0,1
    e310:	7ff00793          	li	a5,2047
    e314:	00000713          	li	a4,0
    e318:	00000813          	li	a6,0
    e31c:	dd1ff06f          	j	e0ec <__subdf3+0x1a4>
    e320:	00048513          	mv	a0,s1
    e324:	4cd000ef          	jal	eff0 <__clzsi2>
    e328:	01850793          	add	a5,a0,24
    e32c:	01f00693          	li	a3,31
    e330:	d0f6dae3          	bge	a3,a5,e044 <__subdf3+0xfc>
    e334:	ff850713          	add	a4,a0,-8
    e338:	00e49733          	sll	a4,s1,a4
    e33c:	1b37ce63          	blt	a5,s3,e4f8 <__subdf3+0x5b0>
    e340:	413789b3          	sub	s3,a5,s3
    e344:	00198793          	add	a5,s3,1
    e348:	42f6de63          	bge	a3,a5,e784 <__subdf3+0x83c>
    e34c:	fe198993          	add	s3,s3,-31
    e350:	02000693          	li	a3,32
    e354:	013754b3          	srl	s1,a4,s3
    e358:	00d78c63          	beq	a5,a3,e370 <__subdf3+0x428>
    e35c:	04000693          	li	a3,64
    e360:	40f687b3          	sub	a5,a3,a5
    e364:	00f71733          	sll	a4,a4,a5
    e368:	00e03733          	snez	a4,a4
    e36c:	00e4e4b3          	or	s1,s1,a4
    e370:	00000993          	li	s3,0
    e374:	0074f793          	and	a5,s1,7
    e378:	d0079ee3          	bnez	a5,e094 <__subdf3+0x14c>
    e37c:	00098793          	mv	a5,s3
    e380:	0034d513          	srl	a0,s1,0x3
    e384:	00090713          	mv	a4,s2
    e388:	0280006f          	j	e3b0 <__subdf3+0x468>
    e38c:	e6081ce3          	bnez	a6,e204 <__subdf3+0x2bc>
    e390:	00351513          	sll	a0,a0,0x3
    e394:	01d71813          	sll	a6,a4,0x1d
    e398:	00355513          	srl	a0,a0,0x3
    e39c:	00a86833          	or	a6,a6,a0
    e3a0:	00375713          	srl	a4,a4,0x3
    e3a4:	e59ff06f          	j	e1fc <__subdf3+0x2b4>
    e3a8:	00351513          	sll	a0,a0,0x3
    e3ac:	00355513          	srl	a0,a0,0x3
    e3b0:	01d71813          	sll	a6,a4,0x1d
    e3b4:	7ff00693          	li	a3,2047
    e3b8:	00a86833          	or	a6,a6,a0
    e3bc:	00375713          	srl	a4,a4,0x3
    e3c0:	e2d78ee3          	beq	a5,a3,e1fc <__subdf3+0x2b4>
    e3c4:	00c71713          	sll	a4,a4,0xc
    e3c8:	00c75713          	srl	a4,a4,0xc
    e3cc:	7ff7f793          	and	a5,a5,2047
    e3d0:	00147e13          	and	t3,s0,1
    e3d4:	d19ff06f          	j	e0ec <__subdf3+0x1a4>
    e3d8:	00198693          	add	a3,s3,1
    e3dc:	7fe6f793          	and	a5,a3,2046
    e3e0:	12079e63          	bnez	a5,e51c <__subdf3+0x5d4>
    e3e4:	011767b3          	or	a5,a4,a7
    e3e8:	24099a63          	bnez	s3,e63c <__subdf3+0x6f4>
    e3ec:	30078663          	beqz	a5,e6f8 <__subdf3+0x7b0>
    e3f0:	01d5e7b3          	or	a5,a1,t4
    e3f4:	30079a63          	bnez	a5,e708 <__subdf3+0x7c0>
    e3f8:	00351513          	sll	a0,a0,0x3
    e3fc:	00355913          	srl	s2,a0,0x3
    e400:	01d71813          	sll	a6,a4,0x1d
    e404:	01286833          	or	a6,a6,s2
    e408:	00375713          	srl	a4,a4,0x3
    e40c:	fb9ff06f          	j	e3c4 <__subdf3+0x47c>
    e410:	41d88833          	sub	a6,a7,t4
    e414:	0108b7b3          	sltu	a5,a7,a6
    e418:	40b70933          	sub	s2,a4,a1
    e41c:	40f90933          	sub	s2,s2,a5
    e420:	00891793          	sll	a5,s2,0x8
    e424:	00080493          	mv	s1,a6
    e428:	1207c263          	bltz	a5,e54c <__subdf3+0x604>
    e42c:	01286833          	or	a6,a6,s2
    e430:	c00812e3          	bnez	a6,e034 <__subdf3+0xec>
    e434:	00000e13          	li	t3,0
    e438:	00000793          	li	a5,0
    e43c:	00000713          	li	a4,0
    e440:	cadff06f          	j	e0ec <__subdf3+0x1a4>
    e444:	ff800937          	lui	s2,0xff800
    e448:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e44c:	40f989b3          	sub	s3,s3,a5
    e450:	01277933          	and	s2,a4,s2
    e454:	c39ff06f          	j	e08c <__subdf3+0x144>
    e458:	7ff00793          	li	a5,2047
    e45c:	01176533          	or	a0,a4,a7
    e460:	10050463          	beqz	a0,e568 <__subdf3+0x620>
    e464:	fff78813          	add	a6,a5,-1
    e468:	1e080263          	beqz	a6,e64c <__subdf3+0x704>
    e46c:	7ff00513          	li	a0,2047
    e470:	d6a788e3          	beq	a5,a0,e1e0 <__subdf3+0x298>
    e474:	03800793          	li	a5,56
    e478:	00068413          	mv	s0,a3
    e47c:	00100513          	li	a0,1
    e480:	0307ca63          	blt	a5,a6,e4b4 <__subdf3+0x56c>
    e484:	01f00793          	li	a5,31
    e488:	1907c463          	blt	a5,a6,e610 <__subdf3+0x6c8>
    e48c:	02000793          	li	a5,32
    e490:	410787b3          	sub	a5,a5,a6
    e494:	00f71533          	sll	a0,a4,a5
    e498:	0108d6b3          	srl	a3,a7,a6
    e49c:	00f897b3          	sll	a5,a7,a5
    e4a0:	00d56533          	or	a0,a0,a3
    e4a4:	00f037b3          	snez	a5,a5
    e4a8:	01075833          	srl	a6,a4,a6
    e4ac:	00f56533          	or	a0,a0,a5
    e4b0:	410585b3          	sub	a1,a1,a6
    e4b4:	40ae8533          	sub	a0,t4,a0
    e4b8:	00aeb733          	sltu	a4,t4,a0
    e4bc:	00050493          	mv	s1,a0
    e4c0:	40e58933          	sub	s2,a1,a4
    e4c4:	000f0993          	mv	s3,t5
    e4c8:	b59ff06f          	j	e020 <__subdf3+0xd8>
    e4cc:	fe078693          	add	a3,a5,-32
    e4d0:	02000613          	li	a2,32
    e4d4:	00d5d6b3          	srl	a3,a1,a3
    e4d8:	00c78a63          	beq	a5,a2,e4ec <__subdf3+0x5a4>
    e4dc:	04000613          	li	a2,64
    e4e0:	40f607b3          	sub	a5,a2,a5
    e4e4:	00f597b3          	sll	a5,a1,a5
    e4e8:	00feeeb3          	or	t4,t4,a5
    e4ec:	01d03533          	snez	a0,t4
    e4f0:	00d56533          	or	a0,a0,a3
    e4f4:	b1dff06f          	j	e010 <__subdf3+0xc8>
    e4f8:	ff8006b7          	lui	a3,0xff800
    e4fc:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e500:	40f987b3          	sub	a5,s3,a5
    e504:	00d77733          	and	a4,a4,a3
    e508:	ef9ff06f          	j	e400 <__subdf3+0x4b8>
    e50c:	00361513          	sll	a0,a2,0x3
    e510:	00355513          	srl	a0,a0,0x3
    e514:	00058713          	mv	a4,a1
    e518:	cd9ff06f          	j	e1f0 <__subdf3+0x2a8>
    e51c:	7ff00793          	li	a5,2047
    e520:	def686e3          	beq	a3,a5,e30c <__subdf3+0x3c4>
    e524:	01d88eb3          	add	t4,a7,t4
    e528:	011eb633          	sltu	a2,t4,a7
    e52c:	00b707b3          	add	a5,a4,a1
    e530:	00c787b3          	add	a5,a5,a2
    e534:	01f79513          	sll	a0,a5,0x1f
    e538:	001ede93          	srl	t4,t4,0x1
    e53c:	01d564b3          	or	s1,a0,t4
    e540:	0017d913          	srl	s2,a5,0x1
    e544:	00068993          	mv	s3,a3
    e548:	b45ff06f          	j	e08c <__subdf3+0x144>
    e54c:	411e8633          	sub	a2,t4,a7
    e550:	40e587b3          	sub	a5,a1,a4
    e554:	00ceb733          	sltu	a4,t4,a2
    e558:	00060493          	mv	s1,a2
    e55c:	40e78933          	sub	s2,a5,a4
    e560:	00068413          	mv	s0,a3
    e564:	ad1ff06f          	j	e034 <__subdf3+0xec>
    e568:	00361613          	sll	a2,a2,0x3
    e56c:	00365513          	srl	a0,a2,0x3
    e570:	00068413          	mv	s0,a3
    e574:	00058713          	mv	a4,a1
    e578:	e39ff06f          	j	e3b0 <__subdf3+0x468>
    e57c:	e00798e3          	bnez	a5,e38c <__subdf3+0x444>
    e580:	22080663          	beqz	a6,e7ac <__subdf3+0x864>
    e584:	0035d713          	srl	a4,a1,0x3
    e588:	00361613          	sll	a2,a2,0x3
    e58c:	01d59593          	sll	a1,a1,0x1d
    e590:	00b76733          	or	a4,a4,a1
    e594:	00365613          	srl	a2,a2,0x3
    e598:	00c76733          	or	a4,a4,a2
    e59c:	00068413          	mv	s0,a3
    e5a0:	c61ff06f          	j	e200 <__subdf3+0x2b8>
    e5a4:	01d88eb3          	add	t4,a7,t4
    e5a8:	00b705b3          	add	a1,a4,a1
    e5ac:	011eb633          	sltu	a2,t4,a7
    e5b0:	00c58933          	add	s2,a1,a2
    e5b4:	00891793          	sll	a5,s2,0x8
    e5b8:	000e8493          	mv	s1,t4
    e5bc:	0a07d863          	bgez	a5,e66c <__subdf3+0x724>
    e5c0:	00200993          	li	s3,2
    e5c4:	bddff06f          	j	e1a0 <__subdf3+0x258>
    e5c8:	41d88eb3          	sub	t4,a7,t4
    e5cc:	40b705b3          	sub	a1,a4,a1
    e5d0:	01d8b633          	sltu	a2,a7,t4
    e5d4:	000e8493          	mv	s1,t4
    e5d8:	40c58933          	sub	s2,a1,a2
    e5dc:	00100993          	li	s3,1
    e5e0:	a41ff06f          	j	e020 <__subdf3+0xd8>
    e5e4:	fe078693          	add	a3,a5,-32
    e5e8:	02000613          	li	a2,32
    e5ec:	00d5d6b3          	srl	a3,a1,a3
    e5f0:	00c78a63          	beq	a5,a2,e604 <__subdf3+0x6bc>
    e5f4:	04000613          	li	a2,64
    e5f8:	40f607b3          	sub	a5,a2,a5
    e5fc:	00f597b3          	sll	a5,a1,a5
    e600:	00feeeb3          	or	t4,t4,a5
    e604:	01d03933          	snez	s2,t4
    e608:	00d96933          	or	s2,s2,a3
    e60c:	b71ff06f          	j	e17c <__subdf3+0x234>
    e610:	fe080793          	add	a5,a6,-32
    e614:	02000693          	li	a3,32
    e618:	00f757b3          	srl	a5,a4,a5
    e61c:	00d80a63          	beq	a6,a3,e630 <__subdf3+0x6e8>
    e620:	04000693          	li	a3,64
    e624:	410686b3          	sub	a3,a3,a6
    e628:	00d71733          	sll	a4,a4,a3
    e62c:	00e8e8b3          	or	a7,a7,a4
    e630:	01103533          	snez	a0,a7
    e634:	00f56533          	or	a0,a0,a5
    e638:	e7dff06f          	j	e4b4 <__subdf3+0x56c>
    e63c:	ec0788e3          	beqz	a5,e50c <__subdf3+0x5c4>
    e640:	01d5eeb3          	or	t4,a1,t4
    e644:	bc0e90e3          	bnez	t4,e204 <__subdf3+0x2bc>
    e648:	d49ff06f          	j	e390 <__subdf3+0x448>
    e64c:	411e8633          	sub	a2,t4,a7
    e650:	40e585b3          	sub	a1,a1,a4
    e654:	00ceb733          	sltu	a4,t4,a2
    e658:	00060493          	mv	s1,a2
    e65c:	40e58933          	sub	s2,a1,a4
    e660:	00068413          	mv	s0,a3
    e664:	00100993          	li	s3,1
    e668:	9b9ff06f          	j	e020 <__subdf3+0xd8>
    e66c:	00100793          	li	a5,1
    e670:	d11ff06f          	j	e380 <__subdf3+0x438>
    e674:	dc0800e3          	beqz	a6,e434 <__subdf3+0x4ec>
    e678:	00361613          	sll	a2,a2,0x3
    e67c:	00365793          	srl	a5,a2,0x3
    e680:	01d59813          	sll	a6,a1,0x1d
    e684:	00959713          	sll	a4,a1,0x9
    e688:	00f86833          	or	a6,a6,a5
    e68c:	00c75713          	srl	a4,a4,0xc
    e690:	00068e13          	mv	t3,a3
    e694:	00000793          	li	a5,0
    e698:	a55ff06f          	j	e0ec <__subdf3+0x1a4>
    e69c:	41d88933          	sub	s2,a7,t4
    e6a0:	0128b7b3          	sltu	a5,a7,s2
    e6a4:	40b70633          	sub	a2,a4,a1
    e6a8:	40f60633          	sub	a2,a2,a5
    e6ac:	00861793          	sll	a5,a2,0x8
    e6b0:	0e07d263          	bgez	a5,e794 <__subdf3+0x84c>
    e6b4:	411e8633          	sub	a2,t4,a7
    e6b8:	40e58733          	sub	a4,a1,a4
    e6bc:	00cebeb3          	sltu	t4,t4,a2
    e6c0:	41d70733          	sub	a4,a4,t4
    e6c4:	00871793          	sll	a5,a4,0x8
    e6c8:	00060493          	mv	s1,a2
    e6cc:	1207de63          	bgez	a5,e808 <__subdf3+0x8c0>
    e6d0:	ff8007b7          	lui	a5,0xff800
    e6d4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e6d8:	00f77733          	and	a4,a4,a5
    e6dc:	00068413          	mv	s0,a3
    e6e0:	00100793          	li	a5,1
    e6e4:	9f1ff06f          	j	e0d4 <__subdf3+0x18c>
    e6e8:	00361613          	sll	a2,a2,0x3
    e6ec:	00365513          	srl	a0,a2,0x3
    e6f0:	00058713          	mv	a4,a1
    e6f4:	cbdff06f          	j	e3b0 <__subdf3+0x468>
    e6f8:	00361613          	sll	a2,a2,0x3
    e6fc:	00365913          	srl	s2,a2,0x3
    e700:	00058713          	mv	a4,a1
    e704:	cfdff06f          	j	e400 <__subdf3+0x4b8>
    e708:	01d886b3          	add	a3,a7,t4
    e70c:	00b707b3          	add	a5,a4,a1
    e710:	0116b633          	sltu	a2,a3,a7
    e714:	00c787b3          	add	a5,a5,a2
    e718:	00879713          	sll	a4,a5,0x8
    e71c:	0036d813          	srl	a6,a3,0x3
    e720:	08075e63          	bgez	a4,e7bc <__subdf3+0x874>
    e724:	ff800737          	lui	a4,0xff800
    e728:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e72c:	00e7f7b3          	and	a5,a5,a4
    e730:	01d79713          	sll	a4,a5,0x1d
    e734:	00979793          	sll	a5,a5,0x9
    e738:	01076833          	or	a6,a4,a6
    e73c:	00c7d713          	srl	a4,a5,0xc
    e740:	00100793          	li	a5,1
    e744:	9a9ff06f          	j	e0ec <__subdf3+0x1a4>
    e748:	fe068793          	add	a5,a3,-32
    e74c:	02000613          	li	a2,32
    e750:	00f757b3          	srl	a5,a4,a5
    e754:	00c68a63          	beq	a3,a2,e768 <__subdf3+0x820>
    e758:	04000613          	li	a2,64
    e75c:	40d606b3          	sub	a3,a2,a3
    e760:	00d71733          	sll	a4,a4,a3
    e764:	00e8e8b3          	or	a7,a7,a4
    e768:	01103933          	snez	s2,a7
    e76c:	00f96933          	or	s2,s2,a5
    e770:	b39ff06f          	j	e2a8 <__subdf3+0x360>
    e774:	0034d513          	srl	a0,s1,0x3
    e778:	00098793          	mv	a5,s3
    e77c:	00090713          	mv	a4,s2
    e780:	c31ff06f          	j	e3b0 <__subdf3+0x468>
    e784:	02000693          	li	a3,32
    e788:	40f686b3          	sub	a3,a3,a5
    e78c:	00000613          	li	a2,0
    e790:	8e9ff06f          	j	e078 <__subdf3+0x130>
    e794:	00c96833          	or	a6,s2,a2
    e798:	c8080ee3          	beqz	a6,e434 <__subdf3+0x4ec>
    e79c:	00395913          	srl	s2,s2,0x3
    e7a0:	00000793          	li	a5,0
    e7a4:	00060713          	mv	a4,a2
    e7a8:	c59ff06f          	j	e400 <__subdf3+0x4b8>
    e7ac:	00000e13          	li	t3,0
    e7b0:	7ff00793          	li	a5,2047
    e7b4:	00080737          	lui	a4,0x80
    e7b8:	935ff06f          	j	e0ec <__subdf3+0x1a4>
    e7bc:	01d79713          	sll	a4,a5,0x1d
    e7c0:	00979793          	sll	a5,a5,0x9
    e7c4:	01076833          	or	a6,a4,a6
    e7c8:	00c7d713          	srl	a4,a5,0xc
    e7cc:	00000793          	li	a5,0
    e7d0:	91dff06f          	j	e0ec <__subdf3+0x1a4>
    e7d4:	ae0786e3          	beqz	a5,e2c0 <__subdf3+0x378>
    e7d8:	413f0833          	sub	a6,t5,s3
    e7dc:	00080793          	mv	a5,a6
    e7e0:	c6098ee3          	beqz	s3,e45c <__subdf3+0x514>
    e7e4:	03800793          	li	a5,56
    e7e8:	0107ca63          	blt	a5,a6,e7fc <__subdf3+0x8b4>
    e7ec:	008007b7          	lui	a5,0x800
    e7f0:	00f76733          	or	a4,a4,a5
    e7f4:	00068413          	mv	s0,a3
    e7f8:	c8dff06f          	j	e484 <__subdf3+0x53c>
    e7fc:	00068413          	mv	s0,a3
    e800:	00100513          	li	a0,1
    e804:	cb1ff06f          	j	e4b4 <__subdf3+0x56c>
    e808:	01d71813          	sll	a6,a4,0x1d
    e80c:	00365613          	srl	a2,a2,0x3
    e810:	00c86833          	or	a6,a6,a2
    e814:	00375713          	srl	a4,a4,0x3
    e818:	00000793          	li	a5,0
    e81c:	00068413          	mv	s0,a3
    e820:	ba5ff06f          	j	e3c4 <__subdf3+0x47c>
    e824:	ba078ae3          	beqz	a5,e3d8 <__subdf3+0x490>
    e828:	413f06b3          	sub	a3,t5,s3
    e82c:	00099663          	bnez	s3,e838 <__subdf3+0x8f0>
    e830:	00068793          	mv	a5,a3
    e834:	a21ff06f          	j	e254 <__subdf3+0x30c>
    e838:	03800793          	li	a5,56
    e83c:	00100913          	li	s2,1
    e840:	a6d7c4e3          	blt	a5,a3,e2a8 <__subdf3+0x360>
    e844:	008007b7          	lui	a5,0x800
    e848:	00f76733          	or	a4,a4,a5
    e84c:	a2dff06f          	j	e278 <__subdf3+0x330>

0000e850 <__unorddf2>:
    e850:	0145d713          	srl	a4,a1,0x14
    e854:	001007b7          	lui	a5,0x100
    e858:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e85c:	fff74713          	not	a4,a4
    e860:	0146d813          	srl	a6,a3,0x14
    e864:	00b7f5b3          	and	a1,a5,a1
    e868:	00d7f7b3          	and	a5,a5,a3
    e86c:	01571693          	sll	a3,a4,0x15
    e870:	7ff87813          	and	a6,a6,2047
    e874:	02068063          	beqz	a3,e894 <__unorddf2+0x44>
    e878:	7ff00713          	li	a4,2047
    e87c:	00000513          	li	a0,0
    e880:	00e80463          	beq	a6,a4,e888 <__unorddf2+0x38>
    e884:	00008067          	ret
    e888:	00c7e7b3          	or	a5,a5,a2
    e88c:	00f03533          	snez	a0,a5
    e890:	00008067          	ret
    e894:	00a5e5b3          	or	a1,a1,a0
    e898:	00100513          	li	a0,1
    e89c:	fc058ee3          	beqz	a1,e878 <__unorddf2+0x28>
    e8a0:	00008067          	ret

0000e8a4 <__fixdfsi>:
    e8a4:	0145d793          	srl	a5,a1,0x14
    e8a8:	001006b7          	lui	a3,0x100
    e8ac:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e8b0:	7ff7f793          	and	a5,a5,2047
    e8b4:	3fe00613          	li	a2,1022
    e8b8:	00b77733          	and	a4,a4,a1
    e8bc:	01f5d593          	srl	a1,a1,0x1f
    e8c0:	00f65e63          	bge	a2,a5,e8dc <__fixdfsi+0x38>
    e8c4:	41d00613          	li	a2,1053
    e8c8:	00f65e63          	bge	a2,a5,e8e4 <__fixdfsi+0x40>
    e8cc:	80000537          	lui	a0,0x80000
    e8d0:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e8d4:	00a58533          	add	a0,a1,a0
    e8d8:	00008067          	ret
    e8dc:	00000513          	li	a0,0
    e8e0:	00008067          	ret
    e8e4:	43300613          	li	a2,1075
    e8e8:	40f60633          	sub	a2,a2,a5
    e8ec:	01f00813          	li	a6,31
    e8f0:	00d76733          	or	a4,a4,a3
    e8f4:	02c85063          	bge	a6,a2,e914 <__fixdfsi+0x70>
    e8f8:	41300693          	li	a3,1043
    e8fc:	40f687b3          	sub	a5,a3,a5
    e900:	00f75733          	srl	a4,a4,a5
    e904:	40e00533          	neg	a0,a4
    e908:	fc059ce3          	bnez	a1,e8e0 <__fixdfsi+0x3c>
    e90c:	00070513          	mv	a0,a4
    e910:	00008067          	ret
    e914:	bed78793          	add	a5,a5,-1043
    e918:	00f71733          	sll	a4,a4,a5
    e91c:	00c55533          	srl	a0,a0,a2
    e920:	00a76733          	or	a4,a4,a0
    e924:	fe1ff06f          	j	e904 <__fixdfsi+0x60>

0000e928 <__floatsidf>:
    e928:	ff010113          	add	sp,sp,-16
    e92c:	00112623          	sw	ra,12(sp)
    e930:	00812423          	sw	s0,8(sp)
    e934:	00912223          	sw	s1,4(sp)
    e938:	04050a63          	beqz	a0,e98c <__floatsidf+0x64>
    e93c:	41f55713          	sra	a4,a0,0x1f
    e940:	00a744b3          	xor	s1,a4,a0
    e944:	40e484b3          	sub	s1,s1,a4
    e948:	00050793          	mv	a5,a0
    e94c:	00048513          	mv	a0,s1
    e950:	01f7d413          	srl	s0,a5,0x1f
    e954:	69c000ef          	jal	eff0 <__clzsi2>
    e958:	41e00793          	li	a5,1054
    e95c:	40a787b3          	sub	a5,a5,a0
    e960:	00a00713          	li	a4,10
    e964:	7ff7f793          	and	a5,a5,2047
    e968:	06a74063          	blt	a4,a0,e9c8 <__floatsidf+0xa0>
    e96c:	00b00713          	li	a4,11
    e970:	40a70733          	sub	a4,a4,a0
    e974:	00e4d733          	srl	a4,s1,a4
    e978:	01550513          	add	a0,a0,21
    e97c:	00c71713          	sll	a4,a4,0xc
    e980:	00a494b3          	sll	s1,s1,a0
    e984:	00c75713          	srl	a4,a4,0xc
    e988:	0140006f          	j	e99c <__floatsidf+0x74>
    e98c:	00000413          	li	s0,0
    e990:	00000793          	li	a5,0
    e994:	00000713          	li	a4,0
    e998:	00000493          	li	s1,0
    e99c:	01479793          	sll	a5,a5,0x14
    e9a0:	01f41413          	sll	s0,s0,0x1f
    e9a4:	00e7e7b3          	or	a5,a5,a4
    e9a8:	00c12083          	lw	ra,12(sp)
    e9ac:	0087e7b3          	or	a5,a5,s0
    e9b0:	00812403          	lw	s0,8(sp)
    e9b4:	00048513          	mv	a0,s1
    e9b8:	00078593          	mv	a1,a5
    e9bc:	00412483          	lw	s1,4(sp)
    e9c0:	01010113          	add	sp,sp,16
    e9c4:	00008067          	ret
    e9c8:	ff550513          	add	a0,a0,-11
    e9cc:	00a49733          	sll	a4,s1,a0
    e9d0:	00c71713          	sll	a4,a4,0xc
    e9d4:	00c75713          	srl	a4,a4,0xc
    e9d8:	00000493          	li	s1,0
    e9dc:	fc1ff06f          	j	e99c <__floatsidf+0x74>

0000e9e0 <__floatunsidf>:
    e9e0:	ff010113          	add	sp,sp,-16
    e9e4:	00812423          	sw	s0,8(sp)
    e9e8:	00112623          	sw	ra,12(sp)
    e9ec:	00050413          	mv	s0,a0
    e9f0:	04050c63          	beqz	a0,ea48 <__floatunsidf+0x68>
    e9f4:	5fc000ef          	jal	eff0 <__clzsi2>
    e9f8:	41e00793          	li	a5,1054
    e9fc:	40a787b3          	sub	a5,a5,a0
    ea00:	00a00713          	li	a4,10
    ea04:	7ff7f793          	and	a5,a5,2047
    ea08:	06a74463          	blt	a4,a0,ea70 <__floatunsidf+0x90>
    ea0c:	00b00713          	li	a4,11
    ea10:	40a70733          	sub	a4,a4,a0
    ea14:	01550513          	add	a0,a0,21
    ea18:	00e45733          	srl	a4,s0,a4
    ea1c:	00a41433          	sll	s0,s0,a0
    ea20:	00c12083          	lw	ra,12(sp)
    ea24:	00040513          	mv	a0,s0
    ea28:	00c71713          	sll	a4,a4,0xc
    ea2c:	00812403          	lw	s0,8(sp)
    ea30:	00c75713          	srl	a4,a4,0xc
    ea34:	01479793          	sll	a5,a5,0x14
    ea38:	00e7e7b3          	or	a5,a5,a4
    ea3c:	00078593          	mv	a1,a5
    ea40:	01010113          	add	sp,sp,16
    ea44:	00008067          	ret
    ea48:	00c12083          	lw	ra,12(sp)
    ea4c:	00040513          	mv	a0,s0
    ea50:	00000793          	li	a5,0
    ea54:	00812403          	lw	s0,8(sp)
    ea58:	00000713          	li	a4,0
    ea5c:	01479793          	sll	a5,a5,0x14
    ea60:	00e7e7b3          	or	a5,a5,a4
    ea64:	00078593          	mv	a1,a5
    ea68:	01010113          	add	sp,sp,16
    ea6c:	00008067          	ret
    ea70:	ff550513          	add	a0,a0,-11
    ea74:	00a41733          	sll	a4,s0,a0
    ea78:	00000413          	li	s0,0
    ea7c:	00c12083          	lw	ra,12(sp)
    ea80:	00040513          	mv	a0,s0
    ea84:	00c71713          	sll	a4,a4,0xc
    ea88:	00812403          	lw	s0,8(sp)
    ea8c:	00c75713          	srl	a4,a4,0xc
    ea90:	01479793          	sll	a5,a5,0x14
    ea94:	00e7e7b3          	or	a5,a5,a4
    ea98:	00078593          	mv	a1,a5
    ea9c:	01010113          	add	sp,sp,16
    eaa0:	00008067          	ret

0000eaa4 <__trunctfdf2>:
    eaa4:	00c52583          	lw	a1,12(a0)
    eaa8:	00852783          	lw	a5,8(a0)
    eaac:	00052803          	lw	a6,0(a0)
    eab0:	00452683          	lw	a3,4(a0)
    eab4:	01059613          	sll	a2,a1,0x10
    eab8:	fe010113          	add	sp,sp,-32
    eabc:	00159713          	sll	a4,a1,0x1
    eac0:	01065613          	srl	a2,a2,0x10
    eac4:	00f12423          	sw	a5,8(sp)
    eac8:	00b12623          	sw	a1,12(sp)
    eacc:	00f12c23          	sw	a5,24(sp)
    ead0:	01012023          	sw	a6,0(sp)
    ead4:	00d12223          	sw	a3,4(sp)
    ead8:	01012823          	sw	a6,16(sp)
    eadc:	00d12a23          	sw	a3,20(sp)
    eae0:	00c12e23          	sw	a2,28(sp)
    eae4:	01175713          	srl	a4,a4,0x11
    eae8:	01f5d593          	srl	a1,a1,0x1f
    eaec:	01010893          	add	a7,sp,16
    eaf0:	01c10793          	add	a5,sp,28
    eaf4:	00361513          	sll	a0,a2,0x3
    eaf8:	ffc7a603          	lw	a2,-4(a5)
    eafc:	ffc78793          	add	a5,a5,-4
    eb00:	01d65693          	srl	a3,a2,0x1d
    eb04:	00a6e6b3          	or	a3,a3,a0
    eb08:	00d7a223          	sw	a3,4(a5)
    eb0c:	fef894e3          	bne	a7,a5,eaf4 <__trunctfdf2+0x50>
    eb10:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    eb14:	00381813          	sll	a6,a6,0x3
    eb18:	01169613          	sll	a2,a3,0x11
    eb1c:	01012823          	sw	a6,16(sp)
    eb20:	01265613          	srl	a2,a2,0x12
    eb24:	04060263          	beqz	a2,eb68 <__trunctfdf2+0xc4>
    eb28:	ffffc6b7          	lui	a3,0xffffc
    eb2c:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    eb30:	00d70733          	add	a4,a4,a3
    eb34:	7fe00693          	li	a3,2046
    eb38:	10e6d463          	bge	a3,a4,ec40 <__trunctfdf2+0x19c>
    eb3c:	7ff00793          	li	a5,2047
    eb40:	00000613          	li	a2,0
    eb44:	00000693          	li	a3,0
    eb48:	01479793          	sll	a5,a5,0x14
    eb4c:	01f59593          	sll	a1,a1,0x1f
    eb50:	00c7e7b3          	or	a5,a5,a2
    eb54:	00b7e7b3          	or	a5,a5,a1
    eb58:	00068513          	mv	a0,a3
    eb5c:	00078593          	mv	a1,a5
    eb60:	02010113          	add	sp,sp,32
    eb64:	00008067          	ret
    eb68:	01412603          	lw	a2,20(sp)
    eb6c:	01812883          	lw	a7,24(sp)
    eb70:	01c12503          	lw	a0,28(sp)
    eb74:	011666b3          	or	a3,a2,a7
    eb78:	00a6e6b3          	or	a3,a3,a0
    eb7c:	0106e6b3          	or	a3,a3,a6
    eb80:	04071463          	bnez	a4,ebc8 <__trunctfdf2+0x124>
    eb84:	14068263          	beqz	a3,ecc8 <__trunctfdf2+0x224>
    eb88:	00500693          	li	a3,5
    eb8c:	00000613          	li	a2,0
    eb90:	0036d793          	srl	a5,a3,0x3
    eb94:	01d61693          	sll	a3,a2,0x1d
    eb98:	00f6e6b3          	or	a3,a3,a5
    eb9c:	00961613          	sll	a2,a2,0x9
    eba0:	7ff77793          	and	a5,a4,2047
    eba4:	00c65613          	srl	a2,a2,0xc
    eba8:	01479793          	sll	a5,a5,0x14
    ebac:	01f59593          	sll	a1,a1,0x1f
    ebb0:	00c7e7b3          	or	a5,a5,a2
    ebb4:	00b7e7b3          	or	a5,a5,a1
    ebb8:	00068513          	mv	a0,a3
    ebbc:	00078593          	mv	a1,a5
    ebc0:	02010113          	add	sp,sp,32
    ebc4:	00008067          	ret
    ebc8:	12068463          	beqz	a3,ecf0 <__trunctfdf2+0x24c>
    ebcc:	01c8d793          	srl	a5,a7,0x1c
    ebd0:	00451513          	sll	a0,a0,0x4
    ebd4:	00a7e7b3          	or	a5,a5,a0
    ebd8:	008006b7          	lui	a3,0x800
    ebdc:	00d7f6b3          	and	a3,a5,a3
    ebe0:	1c068263          	beqz	a3,eda4 <__trunctfdf2+0x300>
    ebe4:	ff800737          	lui	a4,0xff800
    ebe8:	01c65693          	srl	a3,a2,0x1c
    ebec:	00489893          	sll	a7,a7,0x4
    ebf0:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ebf4:	00e7f633          	and	a2,a5,a4
    ebf8:	0116e6b3          	or	a3,a3,a7
    ebfc:	004007b7          	lui	a5,0x400
    ec00:	00f66633          	or	a2,a2,a5
    ec04:	ff86f693          	and	a3,a3,-8
    ec08:	00000793          	li	a5,0
    ec0c:	0036d713          	srl	a4,a3,0x3
    ec10:	01d61693          	sll	a3,a2,0x1d
    ec14:	00961613          	sll	a2,a2,0x9
    ec18:	00c65613          	srl	a2,a2,0xc
    ec1c:	01479793          	sll	a5,a5,0x14
    ec20:	01f59593          	sll	a1,a1,0x1f
    ec24:	00c7e7b3          	or	a5,a5,a2
    ec28:	00e6e6b3          	or	a3,a3,a4
    ec2c:	00b7e7b3          	or	a5,a5,a1
    ec30:	00068513          	mv	a0,a3
    ec34:	00078593          	mv	a1,a5
    ec38:	02010113          	add	sp,sp,32
    ec3c:	00008067          	ret
    ec40:	0ce05c63          	blez	a4,ed18 <__trunctfdf2+0x274>
    ec44:	01412783          	lw	a5,20(sp)
    ec48:	01812503          	lw	a0,24(sp)
    ec4c:	01c12603          	lw	a2,28(sp)
    ec50:	00479693          	sll	a3,a5,0x4
    ec54:	0106e6b3          	or	a3,a3,a6
    ec58:	01c7d793          	srl	a5,a5,0x1c
    ec5c:	00451813          	sll	a6,a0,0x4
    ec60:	00461613          	sll	a2,a2,0x4
    ec64:	01c55513          	srl	a0,a0,0x1c
    ec68:	00d036b3          	snez	a3,a3
    ec6c:	0107e7b3          	or	a5,a5,a6
    ec70:	00a66633          	or	a2,a2,a0
    ec74:	00f6e6b3          	or	a3,a3,a5
    ec78:	0076f793          	and	a5,a3,7
    ec7c:	02078063          	beqz	a5,ec9c <__trunctfdf2+0x1f8>
    ec80:	00f6f793          	and	a5,a3,15
    ec84:	00400513          	li	a0,4
    ec88:	00a78a63          	beq	a5,a0,ec9c <__trunctfdf2+0x1f8>
    ec8c:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    ec90:	00d7b6b3          	sltu	a3,a5,a3
    ec94:	00d60633          	add	a2,a2,a3
    ec98:	00078693          	mv	a3,a5
    ec9c:	008007b7          	lui	a5,0x800
    eca0:	00f677b3          	and	a5,a2,a5
    eca4:	ee0786e3          	beqz	a5,eb90 <__trunctfdf2+0xec>
    eca8:	00170713          	add	a4,a4,1
    ecac:	7ff00793          	li	a5,2047
    ecb0:	e8f706e3          	beq	a4,a5,eb3c <__trunctfdf2+0x98>
    ecb4:	ff8007b7          	lui	a5,0xff800
    ecb8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ecbc:	00f67633          	and	a2,a2,a5
    ecc0:	7ff77793          	and	a5,a4,2047
    ecc4:	f49ff06f          	j	ec0c <__trunctfdf2+0x168>
    ecc8:	00000793          	li	a5,0
    eccc:	00000613          	li	a2,0
    ecd0:	01479793          	sll	a5,a5,0x14
    ecd4:	01f59593          	sll	a1,a1,0x1f
    ecd8:	00c7e7b3          	or	a5,a5,a2
    ecdc:	00b7e7b3          	or	a5,a5,a1
    ece0:	00068513          	mv	a0,a3
    ece4:	00078593          	mv	a1,a5
    ece8:	02010113          	add	sp,sp,32
    ecec:	00008067          	ret
    ecf0:	7ff00793          	li	a5,2047
    ecf4:	00000613          	li	a2,0
    ecf8:	01479793          	sll	a5,a5,0x14
    ecfc:	01f59593          	sll	a1,a1,0x1f
    ed00:	00c7e7b3          	or	a5,a5,a2
    ed04:	00b7e7b3          	or	a5,a5,a1
    ed08:	00068513          	mv	a0,a3
    ed0c:	00078593          	mv	a1,a5
    ed10:	02010113          	add	sp,sp,32
    ed14:	00008067          	ret
    ed18:	fcc00693          	li	a3,-52
    ed1c:	08d74c63          	blt	a4,a3,edb4 <__trunctfdf2+0x310>
    ed20:	03d00693          	li	a3,61
    ed24:	40e686b3          	sub	a3,a3,a4
    ed28:	01c12703          	lw	a4,28(sp)
    ed2c:	4056de13          	sra	t3,a3,0x5
    ed30:	00080eb7          	lui	t4,0x80
    ed34:	00eeeeb3          	or	t4,t4,a4
    ed38:	002e1513          	sll	a0,t3,0x2
    ed3c:	01d12e23          	sw	t4,28(sp)
    ed40:	01f6f693          	and	a3,a3,31
    ed44:	00a88833          	add	a6,a7,a0
    ed48:	00088613          	mv	a2,a7
    ed4c:	00000713          	li	a4,0
    ed50:	00062303          	lw	t1,0(a2)
    ed54:	00460613          	add	a2,a2,4
    ed58:	00676733          	or	a4,a4,t1
    ed5c:	fec81ae3          	bne	a6,a2,ed50 <__trunctfdf2+0x2ac>
    ed60:	00300613          	li	a2,3
    ed64:	41c60633          	sub	a2,a2,t3
    ed68:	04069a63          	bnez	a3,edbc <__trunctfdf2+0x318>
    ed6c:	00082803          	lw	a6,0(a6)
    ed70:	00168693          	add	a3,a3,1
    ed74:	00478793          	add	a5,a5,4
    ed78:	ff07ae23          	sw	a6,-4(a5)
    ed7c:	00d64e63          	blt	a2,a3,ed98 <__trunctfdf2+0x2f4>
    ed80:	00a78833          	add	a6,a5,a0
    ed84:	00082803          	lw	a6,0(a6)
    ed88:	00168693          	add	a3,a3,1
    ed8c:	00478793          	add	a5,a5,4
    ed90:	ff07ae23          	sw	a6,-4(a5)
    ed94:	fed656e3          	bge	a2,a3,ed80 <__trunctfdf2+0x2dc>
    ed98:	00400793          	li	a5,4
    ed9c:	41c787b3          	sub	a5,a5,t3
    eda0:	0840006f          	j	ee24 <__trunctfdf2+0x380>
    eda4:	00000593          	li	a1,0
    eda8:	7ff00793          	li	a5,2047
    edac:	00080637          	lui	a2,0x80
    edb0:	d99ff06f          	j	eb48 <__trunctfdf2+0xa4>
    edb4:	00000713          	li	a4,0
    edb8:	dd1ff06f          	j	eb88 <__trunctfdf2+0xe4>
    edbc:	02050813          	add	a6,a0,32
    edc0:	00280833          	add	a6,a6,sp
    edc4:	ff082803          	lw	a6,-16(a6)
    edc8:	02000f13          	li	t5,32
    edcc:	40df0f33          	sub	t5,t5,a3
    edd0:	01e81833          	sll	a6,a6,t5
    edd4:	01076733          	or	a4,a4,a6
    edd8:	08060e63          	beqz	a2,ee74 <__trunctfdf2+0x3d0>
    eddc:	00261813          	sll	a6,a2,0x2
    ede0:	00f80fb3          	add	t6,a6,a5
    ede4:	00a88633          	add	a2,a7,a0
    ede8:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    edec:	00462303          	lw	t1,4(a2)
    edf0:	00478793          	add	a5,a5,4
    edf4:	00d55533          	srl	a0,a0,a3
    edf8:	01e31333          	sll	t1,t1,t5
    edfc:	00656533          	or	a0,a0,t1
    ee00:	fea7ae23          	sw	a0,-4(a5)
    ee04:	00460613          	add	a2,a2,4
    ee08:	feff90e3          	bne	t6,a5,ede8 <__trunctfdf2+0x344>
    ee0c:	00400793          	li	a5,4
    ee10:	41c787b3          	sub	a5,a5,t3
    ee14:	02080613          	add	a2,a6,32
    ee18:	00260633          	add	a2,a2,sp
    ee1c:	00dedeb3          	srl	t4,t4,a3
    ee20:	ffd62823          	sw	t4,-16(a2)
    ee24:	00400693          	li	a3,4
    ee28:	40f686b3          	sub	a3,a3,a5
    ee2c:	00269693          	sll	a3,a3,0x2
    ee30:	00279793          	sll	a5,a5,0x2
    ee34:	00800613          	li	a2,8
    ee38:	00f888b3          	add	a7,a7,a5
    ee3c:	00c6ea63          	bltu	a3,a2,ee50 <__trunctfdf2+0x3ac>
    ee40:	0008a023          	sw	zero,0(a7)
    ee44:	0008a223          	sw	zero,4(a7)
    ee48:	ff868693          	add	a3,a3,-8
    ee4c:	00888893          	add	a7,a7,8
    ee50:	00400793          	li	a5,4
    ee54:	00f6e463          	bltu	a3,a5,ee5c <__trunctfdf2+0x3b8>
    ee58:	0008a023          	sw	zero,0(a7)
    ee5c:	01012783          	lw	a5,16(sp)
    ee60:	00e03733          	snez	a4,a4
    ee64:	01412603          	lw	a2,20(sp)
    ee68:	00f766b3          	or	a3,a4,a5
    ee6c:	00000713          	li	a4,0
    ee70:	e09ff06f          	j	ec78 <__trunctfdf2+0x1d4>
    ee74:	00100793          	li	a5,1
    ee78:	00000813          	li	a6,0
    ee7c:	f99ff06f          	j	ee14 <__trunctfdf2+0x370>

0000ee80 <__mulsi3>:
    ee80:	00050613          	mv	a2,a0
    ee84:	00000513          	li	a0,0
    ee88:	0015f693          	and	a3,a1,1
    ee8c:	00068463          	beqz	a3,ee94 <__mulsi3+0x14>
    ee90:	00c50533          	add	a0,a0,a2
    ee94:	0015d593          	srl	a1,a1,0x1
    ee98:	00161613          	sll	a2,a2,0x1
    ee9c:	fe0596e3          	bnez	a1,ee88 <__mulsi3+0x8>
    eea0:	00008067          	ret

0000eea4 <__muldi3>:
    eea4:	ff010113          	add	sp,sp,-16
    eea8:	00812423          	sw	s0,8(sp)
    eeac:	00050413          	mv	s0,a0
    eeb0:	00112623          	sw	ra,12(sp)
    eeb4:	00060513          	mv	a0,a2
    eeb8:	00068393          	mv	t2,a3
    eebc:	00040713          	mv	a4,s0
    eec0:	00060813          	mv	a6,a2
    eec4:	00000793          	li	a5,0
    eec8:	00000313          	li	t1,0
    eecc:	00000f13          	li	t5,0
    eed0:	01e708b3          	add	a7,a4,t5
    eed4:	00187e93          	and	t4,a6,1
    eed8:	00f30fb3          	add	t6,t1,a5
    eedc:	01f75e13          	srl	t3,a4,0x1f
    eee0:	00185813          	srl	a6,a6,0x1
    eee4:	00e8b2b3          	sltu	t0,a7,a4
    eee8:	00179793          	sll	a5,a5,0x1
    eeec:	000e8663          	beqz	t4,eef8 <__muldi3+0x54>
    eef0:	00088f13          	mv	t5,a7
    eef4:	01f28333          	add	t1,t0,t6
    eef8:	00171713          	sll	a4,a4,0x1
    eefc:	01c7e7b3          	or	a5,a5,t3
    ef00:	fc0818e3          	bnez	a6,eed0 <__muldi3+0x2c>
    ef04:	00058663          	beqz	a1,ef10 <__muldi3+0x6c>
    ef08:	f79ff0ef          	jal	ee80 <__mulsi3>
    ef0c:	00650333          	add	t1,a0,t1
    ef10:	00038a63          	beqz	t2,ef24 <__muldi3+0x80>
    ef14:	00040513          	mv	a0,s0
    ef18:	00038593          	mv	a1,t2
    ef1c:	f65ff0ef          	jal	ee80 <__mulsi3>
    ef20:	00650333          	add	t1,a0,t1
    ef24:	00c12083          	lw	ra,12(sp)
    ef28:	00812403          	lw	s0,8(sp)
    ef2c:	000f0513          	mv	a0,t5
    ef30:	00030593          	mv	a1,t1
    ef34:	01010113          	add	sp,sp,16
    ef38:	00008067          	ret

0000ef3c <__divsi3>:
    ef3c:	06054063          	bltz	a0,ef9c <__umodsi3+0x10>
    ef40:	0605c663          	bltz	a1,efac <__umodsi3+0x20>

0000ef44 <__hidden___udivsi3>:
    ef44:	00058613          	mv	a2,a1
    ef48:	00050593          	mv	a1,a0
    ef4c:	fff00513          	li	a0,-1
    ef50:	02060c63          	beqz	a2,ef88 <__hidden___udivsi3+0x44>
    ef54:	00100693          	li	a3,1
    ef58:	00b67a63          	bgeu	a2,a1,ef6c <__hidden___udivsi3+0x28>
    ef5c:	00c05863          	blez	a2,ef6c <__hidden___udivsi3+0x28>
    ef60:	00161613          	sll	a2,a2,0x1
    ef64:	00169693          	sll	a3,a3,0x1
    ef68:	feb66ae3          	bltu	a2,a1,ef5c <__hidden___udivsi3+0x18>
    ef6c:	00000513          	li	a0,0
    ef70:	00c5e663          	bltu	a1,a2,ef7c <__hidden___udivsi3+0x38>
    ef74:	40c585b3          	sub	a1,a1,a2
    ef78:	00d56533          	or	a0,a0,a3
    ef7c:	0016d693          	srl	a3,a3,0x1
    ef80:	00165613          	srl	a2,a2,0x1
    ef84:	fe0696e3          	bnez	a3,ef70 <__hidden___udivsi3+0x2c>
    ef88:	00008067          	ret

0000ef8c <__umodsi3>:
    ef8c:	00008293          	mv	t0,ra
    ef90:	fb5ff0ef          	jal	ef44 <__hidden___udivsi3>
    ef94:	00058513          	mv	a0,a1
    ef98:	00028067          	jr	t0
    ef9c:	40a00533          	neg	a0,a0
    efa0:	00b04863          	bgtz	a1,efb0 <__umodsi3+0x24>
    efa4:	40b005b3          	neg	a1,a1
    efa8:	f9dff06f          	j	ef44 <__hidden___udivsi3>
    efac:	40b005b3          	neg	a1,a1
    efb0:	00008293          	mv	t0,ra
    efb4:	f91ff0ef          	jal	ef44 <__hidden___udivsi3>
    efb8:	40a00533          	neg	a0,a0
    efbc:	00028067          	jr	t0

0000efc0 <__modsi3>:
    efc0:	00008293          	mv	t0,ra
    efc4:	0005ca63          	bltz	a1,efd8 <__modsi3+0x18>
    efc8:	00054c63          	bltz	a0,efe0 <__modsi3+0x20>
    efcc:	f79ff0ef          	jal	ef44 <__hidden___udivsi3>
    efd0:	00058513          	mv	a0,a1
    efd4:	00028067          	jr	t0
    efd8:	40b005b3          	neg	a1,a1
    efdc:	fe0558e3          	bgez	a0,efcc <__modsi3+0xc>
    efe0:	40a00533          	neg	a0,a0
    efe4:	f61ff0ef          	jal	ef44 <__hidden___udivsi3>
    efe8:	40b00533          	neg	a0,a1
    efec:	00028067          	jr	t0

0000eff0 <__clzsi2>:
    eff0:	000107b7          	lui	a5,0x10
    eff4:	02f57a63          	bgeu	a0,a5,f028 <__clzsi2+0x38>
    eff8:	10053793          	sltiu	a5,a0,256
    effc:	0017b793          	seqz	a5,a5
    f000:	00379793          	sll	a5,a5,0x3
    f004:	02000713          	li	a4,32
    f008:	40f70733          	sub	a4,a4,a5
    f00c:	00f55533          	srl	a0,a0,a5
    f010:	00001797          	auipc	a5,0x1
    f014:	a4878793          	add	a5,a5,-1464 # fa58 <__clz_tab>
    f018:	00a787b3          	add	a5,a5,a0
    f01c:	0007c503          	lbu	a0,0(a5)
    f020:	40a70533          	sub	a0,a4,a0
    f024:	00008067          	ret
    f028:	010007b7          	lui	a5,0x1000
    f02c:	02f57463          	bgeu	a0,a5,f054 <__clzsi2+0x64>
    f030:	01000793          	li	a5,16
    f034:	00f55533          	srl	a0,a0,a5
    f038:	00001797          	auipc	a5,0x1
    f03c:	a2078793          	add	a5,a5,-1504 # fa58 <__clz_tab>
    f040:	00a787b3          	add	a5,a5,a0
    f044:	0007c503          	lbu	a0,0(a5)
    f048:	01000713          	li	a4,16
    f04c:	40a70533          	sub	a0,a4,a0
    f050:	00008067          	ret
    f054:	01800793          	li	a5,24
    f058:	00f55533          	srl	a0,a0,a5
    f05c:	00001797          	auipc	a5,0x1
    f060:	9fc78793          	add	a5,a5,-1540 # fa58 <__clz_tab>
    f064:	00a787b3          	add	a5,a5,a0
    f068:	0007c503          	lbu	a0,0(a5)
    f06c:	00800713          	li	a4,8
    f070:	40a70533          	sub	a0,a4,a0
    f074:	00008067          	ret
