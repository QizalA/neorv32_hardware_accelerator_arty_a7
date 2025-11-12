
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80002217          	auipc	tp,0x80002
       8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer>
      18:	000022b7          	lui	t0,0x2
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0x458>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00001397          	auipc	t2,0x1
      38:	37438393          	add	t2,t2,884 # 13a8 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <__crt0_bss_end>
      44:	80000497          	auipc	s1,0x80000
      48:	fbc48493          	add	s1,s1,-68 # 80000000 <__crt0_bss_end>
      4c:	80000517          	auipc	a0,0x80000
      50:	fb450513          	add	a0,a0,-76 # 80000000 <__crt0_bss_end>
      54:	80000597          	auipc	a1,0x80000
      58:	fac58593          	add	a1,a1,-84 # 80000000 <__crt0_bss_end>
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
      cc:	00872103          	lw	sp,8(a4) # fff44008 <__crt0_ram_last+0x7ff42009>
      d0:	00c72603          	lw	a2,12(a4)
      d4:	fff40737          	lui	a4,0xfff40
      d8:	00072223          	sw	zero,4(a4) # fff40004 <__crt0_ram_last+0x7ff3e005>
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
     10c:	00001417          	auipc	s0,0x1
     110:	ff040413          	add	s0,s0,-16 # 10fc <__fini_array_end>
     114:	00001497          	auipc	s1,0x1
     118:	fe848493          	add	s1,s1,-24 # 10fc <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	42060613          	add	a2,a2,1056 # 550 <main>

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
     174:	00001417          	auipc	s0,0x1
     178:	f8840413          	add	s0,s0,-120 # 10fc <__fini_array_end>
     17c:	00001497          	auipc	s1,0x1
     180:	f8048493          	add	s1,s1,-128 # 10fc <__fini_array_end>

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

000001e4 <A_ik>:

static inline int32_t clamp_int32(int32_t x) { return x; } // placeholder

// Deterministic “synthetic” A(i,k) & B(k,j) in [-7..7], no storage needed
static inline int8_t A_ik(int i, int k) {
  int t = ((i*5 + k*3) ^ (i<<1) ^ (k<<2)) % 15; // 0..14
     1e4:	00251793          	sll	a5,a0,0x2
     1e8:	00159713          	sll	a4,a1,0x1
     1ec:	00b70733          	add	a4,a4,a1
     1f0:	00a787b3          	add	a5,a5,a0
     1f4:	00259593          	sll	a1,a1,0x2
     1f8:	00151513          	sll	a0,a0,0x1
     1fc:	00e787b3          	add	a5,a5,a4
     200:	00b54533          	xor	a0,a0,a1
static inline int8_t A_ik(int i, int k) {
     204:	ff010113          	add	sp,sp,-16
  int t = ((i*5 + k*3) ^ (i<<1) ^ (k<<2)) % 15; // 0..14
     208:	00f00593          	li	a1,15
     20c:	00a7c533          	xor	a0,a5,a0
static inline int8_t A_ik(int i, int k) {
     210:	00112623          	sw	ra,12(sp)
  int t = ((i*5 + k*3) ^ (i<<1) ^ (k<<2)) % 15; // 0..14
     214:	6b9000ef          	jal	10cc <__modsi3>
  return (int8_t)(t - 7);
}
     218:	00c12083          	lw	ra,12(sp)
  return (int8_t)(t - 7);
     21c:	ff950513          	add	a0,a0,-7
}
     220:	01851513          	sll	a0,a0,0x18
     224:	41855513          	sra	a0,a0,0x18
     228:	01010113          	add	sp,sp,16
     22c:	00008067          	ret

00000230 <B_kj>:
static inline int8_t B_kj(int k, int j) {
  int t = ((k*7 + j*11) ^ (k<<3) ^ (j)) % 15;
     230:	00159793          	sll	a5,a1,0x1
     234:	00b787b3          	add	a5,a5,a1
     238:	00351713          	sll	a4,a0,0x3
     23c:	00279793          	sll	a5,a5,0x2
     240:	40b787b3          	sub	a5,a5,a1
     244:	40a70533          	sub	a0,a4,a0
     248:	00f50533          	add	a0,a0,a5
     24c:	00b74733          	xor	a4,a4,a1
static inline int8_t B_kj(int k, int j) {
     250:	ff010113          	add	sp,sp,-16
  int t = ((k*7 + j*11) ^ (k<<3) ^ (j)) % 15;
     254:	00f00593          	li	a1,15
     258:	00e54533          	xor	a0,a0,a4
static inline int8_t B_kj(int k, int j) {
     25c:	00112623          	sw	ra,12(sp)
  int t = ((k*7 + j*11) ^ (k<<3) ^ (j)) % 15;
     260:	66d000ef          	jal	10cc <__modsi3>
  return (int8_t)(7 - t);
}
     264:	00c12083          	lw	ra,12(sp)
  return (int8_t)(7 - t);
     268:	00700793          	li	a5,7
     26c:	40a78533          	sub	a0,a5,a0
}
     270:	01851513          	sll	a0,a0,0x18
     274:	41855513          	sra	a0,a0,0x18
     278:	01010113          	add	sp,sp,16
     27c:	00008067          	ret

00000280 <cij_cfu>:
                              int8_t b0,int8_t b1,int8_t b2,int8_t b3) {
  return (int32_t)a0*b0 + (int32_t)a1*b1 + (int32_t)a2*b2 + (int32_t)a3*b3;
}

/* Compute one C[i,j] using CFU dp4a (plus scalar for tail) */
static inline int32_t cij_cfu(int i, int j) {
     280:	fb010113          	add	sp,sp,-80
     284:	05212023          	sw	s2,64(sp)
     288:	03412c23          	sw	s4,56(sp)
     28c:	03712623          	sw	s7,44(sp)
     290:	03812423          	sw	s8,40(sp)
     294:	04112623          	sw	ra,76(sp)
     298:	04812423          	sw	s0,72(sp)
     29c:	04912223          	sw	s1,68(sp)
     2a0:	03312e23          	sw	s3,60(sp)
     2a4:	03512a23          	sw	s5,52(sp)
     2a8:	03612823          	sw	s6,48(sp)
     2ac:	03912223          	sw	s9,36(sp)
     2b0:	03a12023          	sw	s10,32(sp)
     2b4:	01b12e23          	sw	s11,28(sp)
     2b8:	00050a13          	mv	s4,a0
     2bc:	00b12623          	sw	a1,12(sp)
  int32_t acc = 0;
  int k = 0;
     2c0:	00000913          	li	s2,0
  int32_t acc = 0;
     2c4:	00000b93          	li	s7,0
  for (; k+3 < K; k += 4) {
     2c8:	08000c13          	li	s8,128
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
     2cc:	00090593          	mv	a1,s2
     2d0:	000a0513          	mv	a0,s4
     2d4:	f11ff0ef          	jal	1e4 <A_ik>
     2d8:	00190a93          	add	s5,s2,1
     2dc:	00050993          	mv	s3,a0
     2e0:	000a8593          	mv	a1,s5
     2e4:	000a0513          	mv	a0,s4
     2e8:	efdff0ef          	jal	1e4 <A_ik>
     2ec:	00290493          	add	s1,s2,2
     2f0:	00050413          	mv	s0,a0
     2f4:	00048593          	mv	a1,s1
     2f8:	000a0513          	mv	a0,s4
     2fc:	ee9ff0ef          	jal	1e4 <A_ik>
     300:	00390c93          	add	s9,s2,3
     304:	000c8593          	mv	a1,s9
     308:	00050b13          	mv	s6,a0
     30c:	000a0513          	mv	a0,s4
     310:	ed5ff0ef          	jal	1e4 <A_ik>
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
     314:	00c12583          	lw	a1,12(sp)
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
     318:	00050d93          	mv	s11,a0
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
     31c:	00090513          	mv	a0,s2
     320:	f11ff0ef          	jal	230 <B_kj>
     324:	00c12583          	lw	a1,12(sp)
     328:	00050d13          	mv	s10,a0
     32c:	000a8513          	mv	a0,s5
     330:	f01ff0ef          	jal	230 <B_kj>
     334:	00c12583          	lw	a1,12(sp)
     338:	00050a93          	mv	s5,a0
     33c:	00048513          	mv	a0,s1
     340:	ef1ff0ef          	jal	230 <B_kj>
     344:	00c12583          	lw	a1,12(sp)
     348:	00050493          	mv	s1,a0
     34c:	000c8513          	mv	a0,s9
     350:	ee1ff0ef          	jal	230 <B_kj>
         (((uint32_t)(uint8_t)a1) <<  8) |
     354:	0ff47793          	zext.b	a5,s0
         (((uint32_t)(uint8_t)a2) << 16) |
     358:	0ffb7b13          	zext.b	s6,s6
     35c:	0ff4f493          	zext.b	s1,s1
         (((uint32_t)(uint8_t)a1) <<  8) |
     360:	0ffafa93          	zext.b	s5,s5
         (((uint32_t)(uint8_t)a2) << 16) |
     364:	010b1b13          	sll	s6,s6,0x10
         (((uint32_t)(uint8_t)a1) <<  8) |
     368:	008a9a93          	sll	s5,s5,0x8
     36c:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)a2) << 16) |
     370:	01049493          	sll	s1,s1,0x10
         (((uint32_t)(uint8_t)a1) <<  8) |
     374:	0167e7b3          	or	a5,a5,s6
  return  ((uint32_t)(uint8_t)a0) |
     378:	0ff9f713          	zext.b	a4,s3
         (((uint32_t)(uint8_t)a1) <<  8) |
     37c:	0154e4b3          	or	s1,s1,s5
  return  ((uint32_t)(uint8_t)a0) |
     380:	0ffd7d13          	zext.b	s10,s10
         (((uint32_t)(uint8_t)a1) <<  8) |
     384:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)a3) << 24);
     388:	018d9d93          	sll	s11,s11,0x18
         (((uint32_t)(uint8_t)a1) <<  8) |
     38c:	01a4e4b3          	or	s1,s1,s10
         (((uint32_t)(uint8_t)a3) << 24);
     390:	01851513          	sll	a0,a0,0x18
         (((uint32_t)(uint8_t)a2) << 16) |
     394:	01b7e7b3          	or	a5,a5,s11
     398:	00a4e4b3          	or	s1,s1,a0
  asm volatile (".insn r 0x0b, 0, 1, %0, %1, %2"
     39c:	0297878b          	.insn	4, 0x0297878b
  for (; k+3 < K; k += 4) {
     3a0:	00490913          	add	s2,s2,4
    int32_t av = pack4s8(a0,a1,a2,a3);
    int32_t bv = pack4s8(b0,b1,b2,b3);
    acc += cfu_dp4a(av, bv);
     3a4:	00fb8bb3          	add	s7,s7,a5
  for (; k+3 < K; k += 4) {
     3a8:	f38912e3          	bne	s2,s8,2cc <cij_cfu+0x4c>
  // tail
  for (; k < K; k++) {
    acc += (int32_t)A_ik(i,k) * (int32_t)B_kj(k,j);
  }
  return acc;
}
     3ac:	04c12083          	lw	ra,76(sp)
     3b0:	04812403          	lw	s0,72(sp)
     3b4:	04412483          	lw	s1,68(sp)
     3b8:	04012903          	lw	s2,64(sp)
     3bc:	03c12983          	lw	s3,60(sp)
     3c0:	03812a03          	lw	s4,56(sp)
     3c4:	03412a83          	lw	s5,52(sp)
     3c8:	03012b03          	lw	s6,48(sp)
     3cc:	02812c03          	lw	s8,40(sp)
     3d0:	02412c83          	lw	s9,36(sp)
     3d4:	02012d03          	lw	s10,32(sp)
     3d8:	01c12d83          	lw	s11,28(sp)
     3dc:	000b8513          	mv	a0,s7
     3e0:	02c12b83          	lw	s7,44(sp)
     3e4:	05010113          	add	sp,sp,80
     3e8:	00008067          	ret

000003ec <cij_sw>:

/* Compute one C[i,j] in pure software */
static inline int32_t cij_sw(int i, int j) {
     3ec:	fb010113          	add	sp,sp,-80
     3f0:	04912223          	sw	s1,68(sp)
     3f4:	05212023          	sw	s2,64(sp)
     3f8:	03312e23          	sw	s3,60(sp)
     3fc:	03412c23          	sw	s4,56(sp)
     400:	04112623          	sw	ra,76(sp)
     404:	04812423          	sw	s0,72(sp)
     408:	03512a23          	sw	s5,52(sp)
     40c:	03612823          	sw	s6,48(sp)
     410:	03712623          	sw	s7,44(sp)
     414:	03812423          	sw	s8,40(sp)
     418:	03912223          	sw	s9,36(sp)
     41c:	03a12023          	sw	s10,32(sp)
     420:	01b12e23          	sw	s11,28(sp)
     424:	00050993          	mv	s3,a0
     428:	00b12623          	sw	a1,12(sp)
  int32_t acc = 0;
  int k = 0;
     42c:	00000493          	li	s1,0
  int32_t acc = 0;
     430:	00000a13          	li	s4,0
  for (; k+3 < K; k += 4) {
     434:	08000913          	li	s2,128
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
     438:	00048593          	mv	a1,s1
     43c:	00098513          	mv	a0,s3
     440:	da5ff0ef          	jal	1e4 <A_ik>
     444:	00148413          	add	s0,s1,1
     448:	00040593          	mv	a1,s0
     44c:	00050d13          	mv	s10,a0
     450:	00098513          	mv	a0,s3
     454:	d91ff0ef          	jal	1e4 <A_ik>
     458:	00248b93          	add	s7,s1,2
     45c:	000b8593          	mv	a1,s7
     460:	00050d93          	mv	s11,a0
     464:	00098513          	mv	a0,s3
     468:	d7dff0ef          	jal	1e4 <A_ik>
     46c:	00348b13          	add	s6,s1,3
     470:	000b0593          	mv	a1,s6
     474:	00050c13          	mv	s8,a0
     478:	00098513          	mv	a0,s3
     47c:	d69ff0ef          	jal	1e4 <A_ik>
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
     480:	00c12583          	lw	a1,12(sp)
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
     484:	00050a93          	mv	s5,a0
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
     488:	00048513          	mv	a0,s1
     48c:	da5ff0ef          	jal	230 <B_kj>
     490:	00c12583          	lw	a1,12(sp)
     494:	00050c93          	mv	s9,a0
     498:	00040513          	mv	a0,s0
     49c:	d95ff0ef          	jal	230 <B_kj>
     4a0:	00c12583          	lw	a1,12(sp)
     4a4:	00050413          	mv	s0,a0
     4a8:	000b8513          	mv	a0,s7
     4ac:	d85ff0ef          	jal	230 <B_kj>
     4b0:	00c12583          	lw	a1,12(sp)
     4b4:	00050b93          	mv	s7,a0
     4b8:	000b0513          	mv	a0,s6
     4bc:	d75ff0ef          	jal	230 <B_kj>
     4c0:	00050b13          	mv	s6,a0
  return (int32_t)a0*b0 + (int32_t)a1*b1 + (int32_t)a2*b2 + (int32_t)a3*b3;
     4c4:	000d8593          	mv	a1,s11
     4c8:	00040513          	mv	a0,s0
     4cc:	359000ef          	jal	1024 <__mulsi3>
     4d0:	00050413          	mv	s0,a0
     4d4:	000d0593          	mv	a1,s10
     4d8:	000c8513          	mv	a0,s9
     4dc:	349000ef          	jal	1024 <__mulsi3>
     4e0:	00a40433          	add	s0,s0,a0
     4e4:	000c0593          	mv	a1,s8
     4e8:	000b8513          	mv	a0,s7
     4ec:	339000ef          	jal	1024 <__mulsi3>
     4f0:	00a40433          	add	s0,s0,a0
     4f4:	000b0593          	mv	a1,s6
     4f8:	000a8513          	mv	a0,s5
     4fc:	329000ef          	jal	1024 <__mulsi3>
     500:	00a40433          	add	s0,s0,a0
  for (; k+3 < K; k += 4) {
     504:	00448493          	add	s1,s1,4
    acc += dot_sw4(a0,a1,a2,a3,b0,b1,b2,b3);
     508:	008a0a33          	add	s4,s4,s0
  for (; k+3 < K; k += 4) {
     50c:	f32496e3          	bne	s1,s2,438 <cij_sw+0x4c>
  }
  for (; k < K; k++) {
    acc += (int32_t)A_ik(i,k) * (int32_t)B_kj(k,j);
  }
  return acc;
}
     510:	04c12083          	lw	ra,76(sp)
     514:	04812403          	lw	s0,72(sp)
     518:	04412483          	lw	s1,68(sp)
     51c:	04012903          	lw	s2,64(sp)
     520:	03c12983          	lw	s3,60(sp)
     524:	03412a83          	lw	s5,52(sp)
     528:	03012b03          	lw	s6,48(sp)
     52c:	02c12b83          	lw	s7,44(sp)
     530:	02812c03          	lw	s8,40(sp)
     534:	02412c83          	lw	s9,36(sp)
     538:	02012d03          	lw	s10,32(sp)
     53c:	01c12d83          	lw	s11,28(sp)
     540:	000a0513          	mv	a0,s4
     544:	03812a03          	lw	s4,56(sp)
     548:	05010113          	add	sp,sp,80
     54c:	00008067          	ret

00000550 <main>:
  return mism;
}

int main(void) {
  // minimal init
  neorv32_uart0_setup(BAUD, 0);
     550:	000055b7          	lui	a1,0x5
int main(void) {
     554:	fa010113          	add	sp,sp,-96
  neorv32_uart0_setup(BAUD, 0);
     558:	00000613          	li	a2,0
     55c:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     560:	fff50537          	lui	a0,0xfff50
int main(void) {
     564:	04112e23          	sw	ra,92(sp)
     568:	04812c23          	sw	s0,88(sp)
     56c:	04912a23          	sw	s1,84(sp)
     570:	05212823          	sw	s2,80(sp)
     574:	05312623          	sw	s3,76(sp)
     578:	05412423          	sw	s4,72(sp)
     57c:	05512223          	sw	s5,68(sp)
     580:	05612023          	sw	s6,64(sp)
     584:	03712e23          	sw	s7,60(sp)
     588:	03812c23          	sw	s8,56(sp)
     58c:	03912a23          	sw	s9,52(sp)
     590:	03a12823          	sw	s10,48(sp)
     594:	03b12623          	sw	s11,44(sp)
  neorv32_uart0_setup(BAUD, 0);
     598:	424000ef          	jal	9bc <neorv32_uart_setup>

  neorv32_uart0_puts("\n\n[NEORV32] GEMM i8 — CFU vs SW (no buffers)\n");
     59c:	000015b7          	lui	a1,0x1
     5a0:	0fc58593          	add	a1,a1,252 # 10fc <__fini_array_end>
     5a4:	fff50537          	lui	a0,0xfff50
     5a8:	4c8000ef          	jal	a70 <neorv32_uart_puts>
  neorv32_uart0_printf("M=%u N=%u K=%u  (BAUD=%u)\n", (uint32_t)M, (uint32_t)N, (uint32_t)K, (uint32_t)BAUD);
     5ac:	000057b7          	lui	a5,0x5
     5b0:	000015b7          	lui	a1,0x1
     5b4:	b0078793          	add	a5,a5,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     5b8:	08000713          	li	a4,128
     5bc:	08000693          	li	a3,128
     5c0:	08000613          	li	a2,128
     5c4:	12c58593          	add	a1,a1,300 # 112c <__fini_array_end+0x30>
     5c8:	fff50537          	lui	a0,0xfff50
     5cc:	714000ef          	jal	ce0 <neorv32_uart_printf>
#ifdef USE_CFU
  neorv32_uart0_puts("CFU: using CUSTOM_0 / funct7=1 dp4a\n");
     5d0:	000015b7          	lui	a1,0x1
     5d4:	14858593          	add	a1,a1,328 # 1148 <__fini_array_end+0x4c>
     5d8:	fff50537          	lui	a0,0xfff50
     5dc:	494000ef          	jal	a70 <neorv32_uart_puts>
#else
  neorv32_uart0_puts("CFU: not used (compiled without USE_CFU)\n");
#endif

  // ---- CFU pass (timed) ----
  uint64_t c0 = neorv32_cpu_get_cycle();
     5e0:	3b4000ef          	jal	994 <neorv32_cpu_get_cycle>
     5e4:	00a12623          	sw	a0,12(sp)
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
     5e8:	811ca4b7          	lui	s1,0x811ca
  uint64_t i0 = neorv32_cpu_get_instret();
     5ec:	3bc000ef          	jal	9a8 <neorv32_cpu_get_instret>
  h *= 16777619u; // FNV prime
     5f0:	01000437          	lui	s0,0x1000
  uint64_t i0 = neorv32_cpu_get_instret();
     5f4:	00a12823          	sw	a0,16(sp)
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
     5f8:	00000a13          	li	s4,0
     5fc:	00000913          	li	s2,0
     600:	00000993          	li	s3,0
     604:	dc548493          	add	s1,s1,-571 # 811c9dc5 <__crt0_ram_last+0x11c7dc6>
  for (int i = 0; i < M; i++) {
     608:	00000c13          	li	s8,0
      if (i==(M/2) && j==(N/2)) R.cmid = c;
     60c:	04000b13          	li	s6,64
      if (i==M-1 && j==N-1) R.clast = c;
     610:	07f00b93          	li	s7,127
  h *= 16777619u; // FNV prime
     614:	19340413          	add	s0,s0,403 # 1000193 <__neorv32_rom_size+0xffc193>
    for (int j = 0; j < N; j++) {
     618:	08000a93          	li	s5,128
     61c:	00000c93          	li	s9,0
      int32_t c = cij_cfu(i,j);
     620:	000c8593          	mv	a1,s9
     624:	000c0513          	mv	a0,s8
     628:	c59ff0ef          	jal	280 <cij_cfu>
      if (i==0 && j==0) R.c00 = c;
     62c:	019c67b3          	or	a5,s8,s9
     630:	26078c63          	beqz	a5,8a8 <main+0x358>
      if (i==(M/2) && j==(N/2)) R.cmid = c;
     634:	016c1863          	bne	s8,s6,644 <main+0xf4>
     638:	018c9c63          	bne	s9,s8,650 <main+0x100>
     63c:	00050913          	mv	s2,a0
      if (i==M-1 && j==N-1) R.clast = c;
     640:	0100006f          	j	650 <main+0x100>
     644:	017c1663          	bne	s8,s7,650 <main+0x100>
     648:	018c9463          	bne	s9,s8,650 <main+0x100>
     64c:	00050a13          	mv	s4,a0
  h ^= (uint32_t)v;
     650:	009547b3          	xor	a5,a0,s1
  h *= 16777619u; // FNV prime
     654:	00040593          	mv	a1,s0
     658:	00078513          	mv	a0,a5
  h ^= (uint32_t)v;
     65c:	00f12423          	sw	a5,8(sp)
    for (int j = 0; j < N; j++) {
     660:	001c8c93          	add	s9,s9,1
  h *= 16777619u; // FNV prime
     664:	1c1000ef          	jal	1024 <__mulsi3>
     668:	00050493          	mv	s1,a0
    for (int j = 0; j < N; j++) {
     66c:	fb5c9ae3          	bne	s9,s5,620 <main+0xd0>
  for (int i = 0; i < M; i++) {
     670:	001c0c13          	add	s8,s8,1
     674:	fb9c14e3          	bne	s8,s9,61c <main+0xcc>
  gemm_result_t Rc = gemm_pass_cfu();
  uint64_t c1 = neorv32_cpu_get_cycle();
     678:	31c000ef          	jal	994 <neorv32_cpu_get_cycle>
     67c:	00a12a23          	sw	a0,20(sp)
  uint64_t i1 = neorv32_cpu_get_instret();
     680:	328000ef          	jal	9a8 <neorv32_cpu_get_instret>
     684:	00a12c23          	sw	a0,24(sp)

  // ---- SW pass (timed) ----
  uint64_t c2 = neorv32_cpu_get_cycle();
     688:	30c000ef          	jal	994 <neorv32_cpu_get_cycle>
     68c:	00a12e23          	sw	a0,28(sp)
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
     690:	811ca437          	lui	s0,0x811ca
  uint64_t i2 = neorv32_cpu_get_instret();
     694:	314000ef          	jal	9a8 <neorv32_cpu_get_instret>
  h *= 16777619u; // FNV prime
     698:	01000cb7          	lui	s9,0x1000
  uint64_t i2 = neorv32_cpu_get_instret();
     69c:	00050c13          	mv	s8,a0
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
     6a0:	00000b93          	li	s7,0
     6a4:	00000a93          	li	s5,0
     6a8:	00000b13          	li	s6,0
     6ac:	dc540413          	add	s0,s0,-571 # 811c9dc5 <__crt0_ram_last+0x11c7dc6>
  for (int i = 0; i < M; i++) {
     6b0:	00000d93          	li	s11,0
  h *= 16777619u; // FNV prime
     6b4:	193c8c93          	add	s9,s9,403 # 1000193 <__neorv32_rom_size+0xffc193>
    for (int j = 0; j < N; j++) {
     6b8:	00000d13          	li	s10,0
      int32_t c = cij_sw(i,j);
     6bc:	000d0593          	mv	a1,s10
     6c0:	000d8513          	mv	a0,s11
     6c4:	d29ff0ef          	jal	3ec <cij_sw>
      if (i==0 && j==0) R.c00 = c;
     6c8:	01ade6b3          	or	a3,s11,s10
     6cc:	1c068a63          	beqz	a3,8a0 <main+0x350>
      if (i==(M/2) && j==(N/2)) R.cmid = c;
     6d0:	04000793          	li	a5,64
     6d4:	00fd9863          	bne	s11,a5,6e4 <main+0x194>
     6d8:	01bd1e63          	bne	s10,s11,6f4 <main+0x1a4>
     6dc:	00050a93          	mv	s5,a0
      if (i==M-1 && j==N-1) R.clast = c;
     6e0:	0140006f          	j	6f4 <main+0x1a4>
     6e4:	07f00793          	li	a5,127
     6e8:	00fd9663          	bne	s11,a5,6f4 <main+0x1a4>
     6ec:	01bd1463          	bne	s10,s11,6f4 <main+0x1a4>
     6f0:	00050b93          	mv	s7,a0
  h ^= (uint32_t)v;
     6f4:	008547b3          	xor	a5,a0,s0
  h *= 16777619u; // FNV prime
     6f8:	00078513          	mv	a0,a5
     6fc:	000c8593          	mv	a1,s9
  h ^= (uint32_t)v;
     700:	00f12223          	sw	a5,4(sp)
  h *= 16777619u; // FNV prime
     704:	121000ef          	jal	1024 <__mulsi3>
    for (int j = 0; j < N; j++) {
     708:	001d0d13          	add	s10,s10,1
     70c:	08000793          	li	a5,128
  h *= 16777619u; // FNV prime
     710:	00050413          	mv	s0,a0
    for (int j = 0; j < N; j++) {
     714:	fafd14e3          	bne	s10,a5,6bc <main+0x16c>
  for (int i = 0; i < M; i++) {
     718:	001d8d93          	add	s11,s11,1
     71c:	f9ad9ee3          	bne	s11,s10,6b8 <main+0x168>
  gemm_result_t Rs = gemm_pass_sw();
  uint64_t c3 = neorv32_cpu_get_cycle();
     720:	274000ef          	jal	994 <neorv32_cpu_get_cycle>
     724:	00050c93          	mv	s9,a0
  uint64_t i3 = neorv32_cpu_get_instret();
     728:	280000ef          	jal	9a8 <neorv32_cpu_get_instret>

  // 32-bit deltas (tiny printf is 32-bit)
  uint32_t cfu_cycles  = (uint32_t)(c1 - c0);
  uint32_t cfu_instret = (uint32_t)(i1 - i0);
  uint32_t sw_cycles   = (uint32_t)(c3 - c2);
     72c:	01c12783          	lw	a5,28(sp)
  uint32_t sw_instret  = (uint32_t)(i3 - i2);

  neorv32_uart0_printf("CFU cycles=%u  instret=%u\n", cfu_cycles, cfu_instret);
     730:	01012703          	lw	a4,16(sp)
     734:	000015b7          	lui	a1,0x1
  uint32_t sw_cycles   = (uint32_t)(c3 - c2);
     738:	40fc8cb3          	sub	s9,s9,a5
  neorv32_uart0_printf("CFU cycles=%u  instret=%u\n", cfu_cycles, cfu_instret);
     73c:	01812783          	lw	a5,24(sp)
  uint32_t sw_instret  = (uint32_t)(i3 - i2);
     740:	41850c33          	sub	s8,a0,s8
  neorv32_uart0_printf("CFU cycles=%u  instret=%u\n", cfu_cycles, cfu_instret);
     744:	17058593          	add	a1,a1,368 # 1170 <__fini_array_end+0x74>
     748:	40e786b3          	sub	a3,a5,a4
     74c:	01412783          	lw	a5,20(sp)
     750:	00c12703          	lw	a4,12(sp)
     754:	fff50537          	lui	a0,0xfff50
     758:	40e78633          	sub	a2,a5,a4
     75c:	584000ef          	jal	ce0 <neorv32_uart_printf>
  neorv32_uart0_printf("SW  cycles=%u  instret=%u\n",  sw_cycles,  sw_instret);
     760:	000015b7          	lui	a1,0x1
     764:	000c0693          	mv	a3,s8
     768:	000c8613          	mv	a2,s9
     76c:	18c58593          	add	a1,a1,396 # 118c <__fini_array_end+0x90>
     770:	fff50537          	lui	a0,0xfff50
     774:	56c000ef          	jal	ce0 <neorv32_uart_printf>

  neorv32_uart0_printf("FNV32(CFU)=%u  FNV32(SW)=%u\n", Rc.fnv, Rs.fnv);
     778:	000015b7          	lui	a1,0x1
     77c:	00040693          	mv	a3,s0
     780:	00048613          	mv	a2,s1
     784:	1a858593          	add	a1,a1,424 # 11a8 <__fini_array_end+0xac>
     788:	fff50537          	lui	a0,0xfff50
     78c:	554000ef          	jal	ce0 <neorv32_uart_printf>
  neorv32_uart0_printf("C[0,0]=%i  C[mid]=%i  C[last]=%i (CFU)\n", Rc.c00, Rc.cmid, Rc.clast);
     790:	000015b7          	lui	a1,0x1
     794:	000a0713          	mv	a4,s4
     798:	00090693          	mv	a3,s2
     79c:	00098613          	mv	a2,s3
     7a0:	1c858593          	add	a1,a1,456 # 11c8 <__fini_array_end+0xcc>
     7a4:	fff50537          	lui	a0,0xfff50
     7a8:	538000ef          	jal	ce0 <neorv32_uart_printf>
  neorv32_uart0_printf("D[0,0]=%i  D[mid]=%i  D[last]=%i (SW)\n",  Rs.c00, Rs.cmid, Rs.clast);
     7ac:	000015b7          	lui	a1,0x1
     7b0:	000b8713          	mv	a4,s7
     7b4:	000a8693          	mv	a3,s5
     7b8:	000b0613          	mv	a2,s6
     7bc:	1f058593          	add	a1,a1,496 # 11f0 <__fini_array_end+0xf4>
     7c0:	fff50537          	lui	a0,0xfff50
     7c4:	51c000ef          	jal	ce0 <neorv32_uart_printf>

  // Quick verdict based on hashes:
  int pass = (Rc.fnv == Rs.fnv) && (Rc.c00==Rs.c00) && (Rc.cmid==Rs.cmid) && (Rc.clast==Rs.clast);
     7c8:	00412783          	lw	a5,4(sp)
     7cc:	00812703          	lw	a4,8(sp)
     7d0:	0ae79863          	bne	a5,a4,880 <main+0x330>
     7d4:	0b3b1663          	bne	s6,s3,880 <main+0x330>
     7d8:	0b591463          	bne	s2,s5,880 <main+0x330>
     7dc:	0b4b9263          	bne	s7,s4,880 <main+0x330>
  uint32_t mism = 0;
     7e0:	00000613          	li	a2,0
  for (int i = 0; i < M; i++) {
     7e4:	00000493          	li	s1,0
    for (int j = 0; j < N; j++) {
     7e8:	08000993          	li	s3,128
     7ec:	00000413          	li	s0,0
      int32_t a = cij_sw(i,j);
     7f0:	00040593          	mv	a1,s0
     7f4:	00048513          	mv	a0,s1
     7f8:	00c12223          	sw	a2,4(sp)
     7fc:	bf1ff0ef          	jal	3ec <cij_sw>
     800:	00050913          	mv	s2,a0
      int32_t b = cij_cfu(i,j);
     804:	00040593          	mv	a1,s0
     808:	00048513          	mv	a0,s1
     80c:	a75ff0ef          	jal	280 <cij_cfu>
      if (a != b) mism++;
     810:	00412603          	lw	a2,4(sp)
     814:	00a90463          	beq	s2,a0,81c <main+0x2cc>
     818:	00160613          	add	a2,a2,1
    for (int j = 0; j < N; j++) {
     81c:	00140413          	add	s0,s0,1
     820:	fd3418e3          	bne	s0,s3,7f0 <main+0x2a0>
  for (int i = 0; i < M; i++) {
     824:	00148493          	add	s1,s1,1
     828:	fc8492e3          	bne	s1,s0,7ec <main+0x29c>
  uint32_t mism = 0;
  if (pass) {
    mism = compare_full_and_count();
  }

  if (pass && mism == 0) {
     82c:	06061063          	bnez	a2,88c <main+0x33c>
    neorv32_uart0_puts("RESULT: PASS (mismatches=0)\n");
     830:	000015b7          	lui	a1,0x1
     834:	21858593          	add	a1,a1,536 # 1218 <__fini_array_end+0x11c>
  } else if (pass) {
    neorv32_uart0_printf("RESULT: PASS by hash, but mismatches reported=%u\n", mism);
  } else {
    neorv32_uart0_puts("RESULT: FAIL — outputs differ\n");
     838:	fff50537          	lui	a0,0xfff50
     83c:	234000ef          	jal	a70 <neorv32_uart_puts>
  }

  return 0;
}
     840:	05c12083          	lw	ra,92(sp)
     844:	05812403          	lw	s0,88(sp)
     848:	05412483          	lw	s1,84(sp)
     84c:	05012903          	lw	s2,80(sp)
     850:	04c12983          	lw	s3,76(sp)
     854:	04812a03          	lw	s4,72(sp)
     858:	04412a83          	lw	s5,68(sp)
     85c:	04012b03          	lw	s6,64(sp)
     860:	03c12b83          	lw	s7,60(sp)
     864:	03812c03          	lw	s8,56(sp)
     868:	03412c83          	lw	s9,52(sp)
     86c:	03012d03          	lw	s10,48(sp)
     870:	02c12d83          	lw	s11,44(sp)
     874:	00000513          	li	a0,0
     878:	06010113          	add	sp,sp,96
     87c:	00008067          	ret
    neorv32_uart0_puts("RESULT: FAIL — outputs differ\n");
     880:	000015b7          	lui	a1,0x1
     884:	23858593          	add	a1,a1,568 # 1238 <__fini_array_end+0x13c>
     888:	fb1ff06f          	j	838 <main+0x2e8>
    neorv32_uart0_printf("RESULT: PASS by hash, but mismatches reported=%u\n", mism);
     88c:	000015b7          	lui	a1,0x1
     890:	25c58593          	add	a1,a1,604 # 125c <__fini_array_end+0x160>
     894:	fff50537          	lui	a0,0xfff50
     898:	448000ef          	jal	ce0 <neorv32_uart_printf>
  return 0;
     89c:	fa5ff06f          	j	840 <main+0x2f0>
      if (i==0 && j==0) R.c00 = c;
     8a0:	00050b13          	mv	s6,a0
     8a4:	e51ff06f          	j	6f4 <main+0x1a4>
      if (i==0 && j==0) R.c00 = c;
     8a8:	00050993          	mv	s3,a0
     8ac:	da5ff06f          	j	650 <main+0x100>

000008b0 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     8b0:	fa010113          	add	sp,sp,-96
     8b4:	04912a23          	sw	s1,84(sp)
     8b8:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     8bc:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     8c0:	04812c23          	sw	s0,88(sp)
     8c4:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     8c8:	29058593          	add	a1,a1,656 # 1290 <__fini_array_end+0x194>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     8cc:	00060913          	mv	s2,a2
     8d0:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     8d4:	01000613          	li	a2,16
     8d8:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     8dc:	04112e23          	sw	ra,92(sp)
     8e0:	05312623          	sw	s3,76(sp)
     8e4:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     8e8:	50c000ef          	jal	df4 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     8ec:	02400613          	li	a2,36
     8f0:	00000593          	li	a1,0
     8f4:	01c10513          	add	a0,sp,28
     8f8:	420000ef          	jal	d18 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     8fc:	ffe90713          	add	a4,s2,-2
     900:	00e00793          	li	a5,14
     904:	03f10993          	add	s3,sp,63
     908:	02e7f463          	bgeu	a5,a4,930 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     90c:	00040023          	sb	zero,0(s0)
}
     910:	05c12083          	lw	ra,92(sp)
     914:	05812403          	lw	s0,88(sp)
     918:	05412483          	lw	s1,84(sp)
     91c:	05012903          	lw	s2,80(sp)
     920:	04c12983          	lw	s3,76(sp)
     924:	04812a03          	lw	s4,72(sp)
     928:	06010113          	add	sp,sp,96
     92c:	00008067          	ret
    *tmp_ptr = digits[num%base];
     930:	00090593          	mv	a1,s2
     934:	00048513          	mv	a0,s1
     938:	760000ef          	jal	1098 <__umodsi3>
     93c:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7ff4e041>
     940:	00278533          	add	a0,a5,sp
     944:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     948:	00090593          	mv	a1,s2
     94c:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     950:	fef98fa3          	sb	a5,-1(s3)
     954:	00048a13          	mv	s4,s1
    num /= base;
     958:	6f8000ef          	jal	1050 <__hidden___udivsi3>
    tmp_ptr--;
     95c:	fff98993          	add	s3,s3,-1
    num /= base;
     960:	00050493          	mv	s1,a0
  } while (num != 0);
     964:	fd2a76e3          	bgeu	s4,s2,930 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     968:	00000793          	li	a5,0
     96c:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     970:	01c10713          	add	a4,sp,28
     974:	00f70733          	add	a4,a4,a5
     978:	00074703          	lbu	a4,0(a4)
     97c:	00070663          	beqz	a4,988 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     980:	00e40023          	sb	a4,0(s0)
      buffer++;
     984:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     988:	00178793          	add	a5,a5,1
     98c:	fed792e3          	bne	a5,a3,970 <neorv32_aux_itoa+0xc0>
     990:	f7dff06f          	j	90c <neorv32_aux_itoa+0x5c>

00000994 <neorv32_cpu_get_cycle>:
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     994:	c80027f3          	rdcycleh	a5
     998:	c0002573          	rdcycle	a0
     99c:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     9a0:	fef59ae3          	bne	a1,a5,994 <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     9a4:	00008067          	ret

000009a8 <neorv32_cpu_get_instret>:
     9a8:	c82027f3          	rdinstreth	a5
     9ac:	c0202573          	rdinstret	a0
     9b0:	c82025f3          	rdinstreth	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_INSTRETH);
    tmp2 = neorv32_cpu_csr_read(CSR_INSTRET);
    tmp3 = neorv32_cpu_csr_read(CSR_INSTRETH);
    if (tmp1 == tmp3) {
     9b4:	fef59ae3          	bne	a1,a5,9a8 <neorv32_cpu_get_instret>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     9b8:	00008067          	ret

000009bc <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     9bc:	ff010113          	add	sp,sp,-16
     9c0:	00812423          	sw	s0,8(sp)
     9c4:	00912223          	sw	s1,4(sp)
     9c8:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     9cc:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     9d0:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     9d4:	00050493          	mv	s1,a0
     9d8:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     9dc:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     9e0:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     9e4:	66c000ef          	jal	1050 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     9e8:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     9ec:	3fe00693          	li	a3,1022
     9f0:	04a6e663          	bltu	a3,a0,a3c <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     9f4:	fff50793          	add	a5,a0,-1
     9f8:	000106b7          	lui	a3,0x10
     9fc:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
     a00:	00679793          	sll	a5,a5,0x6
     a04:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     a08:	07c006b7          	lui	a3,0x7c00
     a0c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     a10:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     a14:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     a18:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
     a1c:	00c12083          	lw	ra,12(sp)
     a20:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     a24:	00e7e7b3          	or	a5,a5,a4
     a28:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     a2c:	00f4a023          	sw	a5,0(s1)
}
     a30:	00412483          	lw	s1,4(sp)
     a34:	01010113          	add	sp,sp,16
     a38:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     a3c:	ffe70793          	add	a5,a4,-2
     a40:	ffd7f793          	and	a5,a5,-3
     a44:	00079863          	bnez	a5,a54 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
     a48:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     a4c:	00170713          	add	a4,a4,1
     a50:	fa1ff06f          	j	9f0 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
     a54:	00155513          	srl	a0,a0,0x1
     a58:	ff5ff06f          	j	a4c <neorv32_uart_setup+0x90>

00000a5c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     a5c:	00052783          	lw	a5,0(a0)
     a60:	00a79713          	sll	a4,a5,0xa
     a64:	fe075ce3          	bgez	a4,a5c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     a68:	00b52223          	sw	a1,4(a0)
}
     a6c:	00008067          	ret

00000a70 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     a70:	fe010113          	add	sp,sp,-32
     a74:	00812c23          	sw	s0,24(sp)
     a78:	00912a23          	sw	s1,20(sp)
     a7c:	01312623          	sw	s3,12(sp)
     a80:	00112e23          	sw	ra,28(sp)
     a84:	01212823          	sw	s2,16(sp)
     a88:	00050493          	mv	s1,a0
     a8c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     a90:	00a00993          	li	s3,10
  while ((c = *s++)) {
     a94:	00044903          	lbu	s2,0(s0)
     a98:	00140413          	add	s0,s0,1
     a9c:	02091063          	bnez	s2,abc <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     aa0:	01c12083          	lw	ra,28(sp)
     aa4:	01812403          	lw	s0,24(sp)
     aa8:	01412483          	lw	s1,20(sp)
     aac:	01012903          	lw	s2,16(sp)
     ab0:	00c12983          	lw	s3,12(sp)
     ab4:	02010113          	add	sp,sp,32
     ab8:	00008067          	ret
    if (c == '\n') {
     abc:	01391863          	bne	s2,s3,acc <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     ac0:	00d00593          	li	a1,13
     ac4:	00048513          	mv	a0,s1
     ac8:	f95ff0ef          	jal	a5c <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     acc:	00090593          	mv	a1,s2
     ad0:	00048513          	mv	a0,s1
     ad4:	f89ff0ef          	jal	a5c <neorv32_uart_putc>
     ad8:	fbdff06f          	j	a94 <neorv32_uart_puts+0x24>

00000adc <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     adc:	f9010113          	add	sp,sp,-112
     ae0:	06812423          	sw	s0,104(sp)
     ae4:	06912223          	sw	s1,100(sp)
     ae8:	07212023          	sw	s2,96(sp)
     aec:	05312e23          	sw	s3,92(sp)
     af0:	00050493          	mv	s1,a0
     af4:	00058913          	mv	s2,a1
     af8:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
     afc:	00000593          	li	a1,0
     b00:	02400613          	li	a2,36
     b04:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
     b08:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     b0c:	05412c23          	sw	s4,88(sp)
     b10:	05512a23          	sw	s5,84(sp)
     b14:	05712623          	sw	s7,76(sp)
     b18:	05812423          	sw	s8,72(sp)
     b1c:	05912223          	sw	s9,68(sp)
     b20:	05a12023          	sw	s10,64(sp)
     b24:	06112623          	sw	ra,108(sp)
     b28:	05612823          	sw	s6,80(sp)
     b2c:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
     b30:	02500b93          	li	s7,37
    string_buf[i] = 0;
     b34:	1e4000ef          	jal	d18 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
     b38:	00a00c13          	li	s8,10
      c = tolower(*format++);
     b3c:	2a598993          	add	s3,s3,677 # 12a5 <_ctype_+0x1>
     b40:	00100c93          	li	s9,1
      switch (c) {
     b44:	07000a13          	li	s4,112
     b48:	07500d13          	li	s10,117
     b4c:	06300a93          	li	s5,99
  while ((c = *format++)) {
     b50:	00094d83          	lbu	s11,0(s2)
     b54:	040d9063          	bnez	s11,b94 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
     b58:	06c12083          	lw	ra,108(sp)
     b5c:	06812403          	lw	s0,104(sp)
     b60:	06412483          	lw	s1,100(sp)
     b64:	06012903          	lw	s2,96(sp)
     b68:	05c12983          	lw	s3,92(sp)
     b6c:	05812a03          	lw	s4,88(sp)
     b70:	05412a83          	lw	s5,84(sp)
     b74:	05012b03          	lw	s6,80(sp)
     b78:	04c12b83          	lw	s7,76(sp)
     b7c:	04812c03          	lw	s8,72(sp)
     b80:	04412c83          	lw	s9,68(sp)
     b84:	04012d03          	lw	s10,64(sp)
     b88:	03c12d83          	lw	s11,60(sp)
     b8c:	07010113          	add	sp,sp,112
     b90:	00008067          	ret
    if (c == '%') {
     b94:	137d9863          	bne	s11,s7,cc4 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
     b98:	00290b13          	add	s6,s2,2
     b9c:	00194903          	lbu	s2,1(s2)
     ba0:	013907b3          	add	a5,s2,s3
     ba4:	0007c783          	lbu	a5,0(a5)
     ba8:	0037f793          	and	a5,a5,3
     bac:	01979463          	bne	a5,s9,bb4 <neorv32_uart_vprintf+0xd8>
     bb0:	02090913          	add	s2,s2,32
      switch (c) {
     bb4:	0ff97793          	zext.b	a5,s2
     bb8:	0d478863          	beq	a5,s4,c88 <neorv32_uart_vprintf+0x1ac>
     bbc:	06fa4c63          	blt	s4,a5,c34 <neorv32_uart_vprintf+0x158>
     bc0:	09578e63          	beq	a5,s5,c5c <neorv32_uart_vprintf+0x180>
     bc4:	02fac663          	blt	s5,a5,bf0 <neorv32_uart_vprintf+0x114>
     bc8:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
     bcc:	02500593          	li	a1,37
      switch (c) {
     bd0:	00e78a63          	beq	a5,a4,be4 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
     bd4:	02500593          	li	a1,37
     bd8:	00048513          	mv	a0,s1
     bdc:	e81ff0ef          	jal	a5c <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     be0:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
     be4:	00048513          	mv	a0,s1
     be8:	e75ff0ef          	jal	a5c <neorv32_uart_putc>
     bec:	0840006f          	j	c70 <neorv32_uart_vprintf+0x194>
      switch (c) {
     bf0:	06400713          	li	a4,100
     bf4:	00e78663          	beq	a5,a4,c00 <neorv32_uart_vprintf+0x124>
     bf8:	06900713          	li	a4,105
     bfc:	fce79ce3          	bne	a5,a4,bd4 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
     c00:	00440913          	add	s2,s0,4
     c04:	00042403          	lw	s0,0(s0)
          if (n < 0) {
     c08:	00045a63          	bgez	s0,c1c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
     c0c:	02d00593          	li	a1,45
     c10:	00048513          	mv	a0,s1
            n = -n;
     c14:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
     c18:	e45ff0ef          	jal	a5c <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
     c1c:	00a00613          	li	a2,10
     c20:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     c24:	00c10513          	add	a0,sp,12
     c28:	c89ff0ef          	jal	8b0 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
     c2c:	00c10593          	add	a1,sp,12
     c30:	0200006f          	j	c50 <neorv32_uart_vprintf+0x174>
      switch (c) {
     c34:	05a78263          	beq	a5,s10,c78 <neorv32_uart_vprintf+0x19c>
     c38:	07800713          	li	a4,120
     c3c:	04e78663          	beq	a5,a4,c88 <neorv32_uart_vprintf+0x1ac>
     c40:	07300713          	li	a4,115
     c44:	f8e798e3          	bne	a5,a4,bd4 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     c48:	00042583          	lw	a1,0(s0)
     c4c:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
     c50:	00048513          	mv	a0,s1
     c54:	e1dff0ef          	jal	a70 <neorv32_uart_puts>
          break;
     c58:	0140006f          	j	c6c <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
     c5c:	00044583          	lbu	a1,0(s0)
     c60:	00048513          	mv	a0,s1
     c64:	00440913          	add	s2,s0,4
     c68:	df5ff0ef          	jal	a5c <neorv32_uart_putc>
     c6c:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     c70:	000b0913          	mv	s2,s6
     c74:	eddff06f          	j	b50 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     c78:	00042583          	lw	a1,0(s0)
     c7c:	00440913          	add	s2,s0,4
     c80:	00a00613          	li	a2,10
     c84:	fa1ff06f          	j	c24 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     c88:	00042583          	lw	a1,0(s0)
     c8c:	01000613          	li	a2,16
     c90:	00c10513          	add	a0,sp,12
     c94:	c1dff0ef          	jal	8b0 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
     c98:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     c9c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
     ca0:	2f8000ef          	jal	f98 <strlen>
     ca4:	00800413          	li	s0,8
     ca8:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
     cac:	f80400e3          	beqz	s0,c2c <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
     cb0:	03000593          	li	a1,48
     cb4:	00048513          	mv	a0,s1
     cb8:	da5ff0ef          	jal	a5c <neorv32_uart_putc>
     cbc:	fff40413          	add	s0,s0,-1
     cc0:	fedff06f          	j	cac <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
     cc4:	018d9863          	bne	s11,s8,cd4 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
     cc8:	00d00593          	li	a1,13
     ccc:	00048513          	mv	a0,s1
     cd0:	d8dff0ef          	jal	a5c <neorv32_uart_putc>
  while ((c = *format++)) {
     cd4:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
     cd8:	000d8593          	mv	a1,s11
     cdc:	f09ff06f          	j	be4 <neorv32_uart_vprintf+0x108>

00000ce0 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     ce0:	fc010113          	add	sp,sp,-64
     ce4:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
     ce8:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     cec:	00112e23          	sw	ra,28(sp)
     cf0:	02d12623          	sw	a3,44(sp)
     cf4:	02e12823          	sw	a4,48(sp)
     cf8:	02f12a23          	sw	a5,52(sp)
     cfc:	03012c23          	sw	a6,56(sp)
     d00:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
     d04:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
     d08:	dd5ff0ef          	jal	adc <neorv32_uart_vprintf>
  va_end(args);
}
     d0c:	01c12083          	lw	ra,28(sp)
     d10:	04010113          	add	sp,sp,64
     d14:	00008067          	ret

00000d18 <memset>:
     d18:	00f00313          	li	t1,15
     d1c:	00050713          	mv	a4,a0
     d20:	02c37e63          	bgeu	t1,a2,d5c <memset+0x44>
     d24:	00f77793          	and	a5,a4,15
     d28:	0a079063          	bnez	a5,dc8 <memset+0xb0>
     d2c:	08059263          	bnez	a1,db0 <memset+0x98>
     d30:	ff067693          	and	a3,a2,-16
     d34:	00f67613          	and	a2,a2,15
     d38:	00e686b3          	add	a3,a3,a4
     d3c:	00b72023          	sw	a1,0(a4)
     d40:	00b72223          	sw	a1,4(a4)
     d44:	00b72423          	sw	a1,8(a4)
     d48:	00b72623          	sw	a1,12(a4)
     d4c:	01070713          	add	a4,a4,16
     d50:	fed766e3          	bltu	a4,a3,d3c <memset+0x24>
     d54:	00061463          	bnez	a2,d5c <memset+0x44>
     d58:	00008067          	ret
     d5c:	40c306b3          	sub	a3,t1,a2
     d60:	00269693          	sll	a3,a3,0x2
     d64:	00000297          	auipc	t0,0x0
     d68:	005686b3          	add	a3,a3,t0
     d6c:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
     d70:	00b70723          	sb	a1,14(a4)
     d74:	00b706a3          	sb	a1,13(a4)
     d78:	00b70623          	sb	a1,12(a4)
     d7c:	00b705a3          	sb	a1,11(a4)
     d80:	00b70523          	sb	a1,10(a4)
     d84:	00b704a3          	sb	a1,9(a4)
     d88:	00b70423          	sb	a1,8(a4)
     d8c:	00b703a3          	sb	a1,7(a4)
     d90:	00b70323          	sb	a1,6(a4)
     d94:	00b702a3          	sb	a1,5(a4)
     d98:	00b70223          	sb	a1,4(a4)
     d9c:	00b701a3          	sb	a1,3(a4)
     da0:	00b70123          	sb	a1,2(a4)
     da4:	00b700a3          	sb	a1,1(a4)
     da8:	00b70023          	sb	a1,0(a4)
     dac:	00008067          	ret
     db0:	0ff5f593          	zext.b	a1,a1
     db4:	00859693          	sll	a3,a1,0x8
     db8:	00d5e5b3          	or	a1,a1,a3
     dbc:	01059693          	sll	a3,a1,0x10
     dc0:	00d5e5b3          	or	a1,a1,a3
     dc4:	f6dff06f          	j	d30 <memset+0x18>
     dc8:	00279693          	sll	a3,a5,0x2
     dcc:	00000297          	auipc	t0,0x0
     dd0:	005686b3          	add	a3,a3,t0
     dd4:	00008293          	mv	t0,ra
     dd8:	fa0680e7          	jalr	-96(a3)
     ddc:	00028093          	mv	ra,t0
     de0:	ff078793          	add	a5,a5,-16
     de4:	40f70733          	sub	a4,a4,a5
     de8:	00f60633          	add	a2,a2,a5
     dec:	f6c378e3          	bgeu	t1,a2,d5c <memset+0x44>
     df0:	f3dff06f          	j	d2c <memset+0x14>

00000df4 <memcpy>:
     df4:	00a5c7b3          	xor	a5,a1,a0
     df8:	0037f793          	and	a5,a5,3
     dfc:	00c508b3          	add	a7,a0,a2
     e00:	06079463          	bnez	a5,e68 <memcpy+0x74>
     e04:	00300793          	li	a5,3
     e08:	06c7f063          	bgeu	a5,a2,e68 <memcpy+0x74>
     e0c:	00357793          	and	a5,a0,3
     e10:	00050713          	mv	a4,a0
     e14:	06079a63          	bnez	a5,e88 <memcpy+0x94>
     e18:	ffc8f613          	and	a2,a7,-4
     e1c:	40e606b3          	sub	a3,a2,a4
     e20:	02000793          	li	a5,32
     e24:	08d7ce63          	blt	a5,a3,ec0 <memcpy+0xcc>
     e28:	00058693          	mv	a3,a1
     e2c:	00070793          	mv	a5,a4
     e30:	02c77863          	bgeu	a4,a2,e60 <memcpy+0x6c>
     e34:	0006a803          	lw	a6,0(a3)
     e38:	00478793          	add	a5,a5,4
     e3c:	00468693          	add	a3,a3,4
     e40:	ff07ae23          	sw	a6,-4(a5)
     e44:	fec7e8e3          	bltu	a5,a2,e34 <memcpy+0x40>
     e48:	fff60793          	add	a5,a2,-1
     e4c:	40e787b3          	sub	a5,a5,a4
     e50:	ffc7f793          	and	a5,a5,-4
     e54:	00478793          	add	a5,a5,4
     e58:	00f70733          	add	a4,a4,a5
     e5c:	00f585b3          	add	a1,a1,a5
     e60:	01176863          	bltu	a4,a7,e70 <memcpy+0x7c>
     e64:	00008067          	ret
     e68:	00050713          	mv	a4,a0
     e6c:	05157863          	bgeu	a0,a7,ebc <memcpy+0xc8>
     e70:	0005c783          	lbu	a5,0(a1)
     e74:	00170713          	add	a4,a4,1
     e78:	00158593          	add	a1,a1,1
     e7c:	fef70fa3          	sb	a5,-1(a4)
     e80:	fee898e3          	bne	a7,a4,e70 <memcpy+0x7c>
     e84:	00008067          	ret
     e88:	0005c683          	lbu	a3,0(a1)
     e8c:	00170713          	add	a4,a4,1
     e90:	00377793          	and	a5,a4,3
     e94:	fed70fa3          	sb	a3,-1(a4)
     e98:	00158593          	add	a1,a1,1
     e9c:	f6078ee3          	beqz	a5,e18 <memcpy+0x24>
     ea0:	0005c683          	lbu	a3,0(a1)
     ea4:	00170713          	add	a4,a4,1
     ea8:	00377793          	and	a5,a4,3
     eac:	fed70fa3          	sb	a3,-1(a4)
     eb0:	00158593          	add	a1,a1,1
     eb4:	fc079ae3          	bnez	a5,e88 <memcpy+0x94>
     eb8:	f61ff06f          	j	e18 <memcpy+0x24>
     ebc:	00008067          	ret
     ec0:	ff010113          	add	sp,sp,-16
     ec4:	00812623          	sw	s0,12(sp)
     ec8:	02000413          	li	s0,32
     ecc:	0005a383          	lw	t2,0(a1)
     ed0:	0045a283          	lw	t0,4(a1)
     ed4:	0085af83          	lw	t6,8(a1)
     ed8:	00c5af03          	lw	t5,12(a1)
     edc:	0105ae83          	lw	t4,16(a1)
     ee0:	0145ae03          	lw	t3,20(a1)
     ee4:	0185a303          	lw	t1,24(a1)
     ee8:	01c5a803          	lw	a6,28(a1)
     eec:	0205a683          	lw	a3,32(a1)
     ef0:	02470713          	add	a4,a4,36
     ef4:	40e607b3          	sub	a5,a2,a4
     ef8:	fc772e23          	sw	t2,-36(a4)
     efc:	fe572023          	sw	t0,-32(a4)
     f00:	fff72223          	sw	t6,-28(a4)
     f04:	ffe72423          	sw	t5,-24(a4)
     f08:	ffd72623          	sw	t4,-20(a4)
     f0c:	ffc72823          	sw	t3,-16(a4)
     f10:	fe672a23          	sw	t1,-12(a4)
     f14:	ff072c23          	sw	a6,-8(a4)
     f18:	fed72e23          	sw	a3,-4(a4)
     f1c:	02458593          	add	a1,a1,36
     f20:	faf446e3          	blt	s0,a5,ecc <memcpy+0xd8>
     f24:	00058693          	mv	a3,a1
     f28:	00070793          	mv	a5,a4
     f2c:	02c77863          	bgeu	a4,a2,f5c <memcpy+0x168>
     f30:	0006a803          	lw	a6,0(a3)
     f34:	00478793          	add	a5,a5,4
     f38:	00468693          	add	a3,a3,4
     f3c:	ff07ae23          	sw	a6,-4(a5)
     f40:	fec7e8e3          	bltu	a5,a2,f30 <memcpy+0x13c>
     f44:	fff60793          	add	a5,a2,-1
     f48:	40e787b3          	sub	a5,a5,a4
     f4c:	ffc7f793          	and	a5,a5,-4
     f50:	00478793          	add	a5,a5,4
     f54:	00f70733          	add	a4,a4,a5
     f58:	00f585b3          	add	a1,a1,a5
     f5c:	01176863          	bltu	a4,a7,f6c <memcpy+0x178>
     f60:	00c12403          	lw	s0,12(sp)
     f64:	01010113          	add	sp,sp,16
     f68:	00008067          	ret
     f6c:	0005c783          	lbu	a5,0(a1)
     f70:	00170713          	add	a4,a4,1
     f74:	00158593          	add	a1,a1,1
     f78:	fef70fa3          	sb	a5,-1(a4)
     f7c:	fee882e3          	beq	a7,a4,f60 <memcpy+0x16c>
     f80:	0005c783          	lbu	a5,0(a1)
     f84:	00170713          	add	a4,a4,1
     f88:	00158593          	add	a1,a1,1
     f8c:	fef70fa3          	sb	a5,-1(a4)
     f90:	fce89ee3          	bne	a7,a4,f6c <memcpy+0x178>
     f94:	fcdff06f          	j	f60 <memcpy+0x16c>

00000f98 <strlen>:
     f98:	00357793          	and	a5,a0,3
     f9c:	00050713          	mv	a4,a0
     fa0:	04079c63          	bnez	a5,ff8 <strlen+0x60>
     fa4:	7f7f86b7          	lui	a3,0x7f7f8
     fa8:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
     fac:	fff00593          	li	a1,-1
     fb0:	00072603          	lw	a2,0(a4)
     fb4:	00470713          	add	a4,a4,4
     fb8:	00d677b3          	and	a5,a2,a3
     fbc:	00d787b3          	add	a5,a5,a3
     fc0:	00c7e7b3          	or	a5,a5,a2
     fc4:	00d7e7b3          	or	a5,a5,a3
     fc8:	feb784e3          	beq	a5,a1,fb0 <strlen+0x18>
     fcc:	ffc74683          	lbu	a3,-4(a4)
     fd0:	40a707b3          	sub	a5,a4,a0
     fd4:	04068463          	beqz	a3,101c <strlen+0x84>
     fd8:	ffd74683          	lbu	a3,-3(a4)
     fdc:	02068c63          	beqz	a3,1014 <strlen+0x7c>
     fe0:	ffe74503          	lbu	a0,-2(a4)
     fe4:	00a03533          	snez	a0,a0
     fe8:	00f50533          	add	a0,a0,a5
     fec:	ffe50513          	add	a0,a0,-2
     ff0:	00008067          	ret
     ff4:	fa0688e3          	beqz	a3,fa4 <strlen+0xc>
     ff8:	00074783          	lbu	a5,0(a4)
     ffc:	00170713          	add	a4,a4,1
    1000:	00377693          	and	a3,a4,3
    1004:	fe0798e3          	bnez	a5,ff4 <strlen+0x5c>
    1008:	40a70733          	sub	a4,a4,a0
    100c:	fff70513          	add	a0,a4,-1
    1010:	00008067          	ret
    1014:	ffd78513          	add	a0,a5,-3
    1018:	00008067          	ret
    101c:	ffc78513          	add	a0,a5,-4
    1020:	00008067          	ret

00001024 <__mulsi3>:
    1024:	00050613          	mv	a2,a0
    1028:	00000513          	li	a0,0
    102c:	0015f693          	and	a3,a1,1
    1030:	00068463          	beqz	a3,1038 <__mulsi3+0x14>
    1034:	00c50533          	add	a0,a0,a2
    1038:	0015d593          	srl	a1,a1,0x1
    103c:	00161613          	sll	a2,a2,0x1
    1040:	fe0596e3          	bnez	a1,102c <__mulsi3+0x8>
    1044:	00008067          	ret

00001048 <__divsi3>:
    1048:	06054063          	bltz	a0,10a8 <__umodsi3+0x10>
    104c:	0605c663          	bltz	a1,10b8 <__umodsi3+0x20>

00001050 <__hidden___udivsi3>:
    1050:	00058613          	mv	a2,a1
    1054:	00050593          	mv	a1,a0
    1058:	fff00513          	li	a0,-1
    105c:	02060c63          	beqz	a2,1094 <__hidden___udivsi3+0x44>
    1060:	00100693          	li	a3,1
    1064:	00b67a63          	bgeu	a2,a1,1078 <__hidden___udivsi3+0x28>
    1068:	00c05863          	blez	a2,1078 <__hidden___udivsi3+0x28>
    106c:	00161613          	sll	a2,a2,0x1
    1070:	00169693          	sll	a3,a3,0x1
    1074:	feb66ae3          	bltu	a2,a1,1068 <__hidden___udivsi3+0x18>
    1078:	00000513          	li	a0,0
    107c:	00c5e663          	bltu	a1,a2,1088 <__hidden___udivsi3+0x38>
    1080:	40c585b3          	sub	a1,a1,a2
    1084:	00d56533          	or	a0,a0,a3
    1088:	0016d693          	srl	a3,a3,0x1
    108c:	00165613          	srl	a2,a2,0x1
    1090:	fe0696e3          	bnez	a3,107c <__hidden___udivsi3+0x2c>
    1094:	00008067          	ret

00001098 <__umodsi3>:
    1098:	00008293          	mv	t0,ra
    109c:	fb5ff0ef          	jal	1050 <__hidden___udivsi3>
    10a0:	00058513          	mv	a0,a1
    10a4:	00028067          	jr	t0 # dcc <memset+0xb4>
    10a8:	40a00533          	neg	a0,a0
    10ac:	00b04863          	bgtz	a1,10bc <__umodsi3+0x24>
    10b0:	40b005b3          	neg	a1,a1
    10b4:	f9dff06f          	j	1050 <__hidden___udivsi3>
    10b8:	40b005b3          	neg	a1,a1
    10bc:	00008293          	mv	t0,ra
    10c0:	f91ff0ef          	jal	1050 <__hidden___udivsi3>
    10c4:	40a00533          	neg	a0,a0
    10c8:	00028067          	jr	t0

000010cc <__modsi3>:
    10cc:	00008293          	mv	t0,ra
    10d0:	0005ca63          	bltz	a1,10e4 <__modsi3+0x18>
    10d4:	00054c63          	bltz	a0,10ec <__modsi3+0x20>
    10d8:	f79ff0ef          	jal	1050 <__hidden___udivsi3>
    10dc:	00058513          	mv	a0,a1
    10e0:	00028067          	jr	t0
    10e4:	40b005b3          	neg	a1,a1
    10e8:	fe0558e3          	bgez	a0,10d8 <__modsi3+0xc>
    10ec:	40a00533          	neg	a0,a0
    10f0:	f61ff0ef          	jal	1050 <__hidden___udivsi3>
    10f4:	40b00533          	neg	a0,a1
    10f8:	00028067          	jr	t0
