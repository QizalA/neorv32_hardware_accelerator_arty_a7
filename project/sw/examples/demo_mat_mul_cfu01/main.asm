
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
   0:	f14020f3          	csrr	ra,mhartid
   4:	80080217          	auipc	tp,0x80080
   8:	ffb20213          	add	tp,tp,-5 # 8007ffff <__crt0_ram_last>
   c:	ff027113          	and	sp,tp,-16
  10:	80000197          	auipc	gp,0x80000
  14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer$>
  18:	000022b7          	lui	t0,0x2
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0x924>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	ea838393          	add	t2,t2,-344 # edc <__RODATA_END__>
  3c:	80000417          	auipc	s0,0x80000
  40:	fc440413          	add	s0,s0,-60 # 80000000 <__BSS_END__>
  44:	80000497          	auipc	s1,0x80000
  48:	fbc48493          	add	s1,s1,-68 # 80000000 <__BSS_END__>
  4c:	80000517          	auipc	a0,0x80000
  50:	fb450513          	add	a0,a0,-76 # 80000000 <__BSS_END__>
  54:	80000597          	auipc	a1,0x80000
  58:	fac58593          	add	a1,a1,-84 # 80000000 <__BSS_END__>
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
  c4:	0d00006f          	j	194 <__crt0_sleep>

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
 10c:	00001417          	auipc	s0,0x1
 110:	b9040413          	add	s0,s0,-1136 # c9c <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	b8848493          	add	s1,s1,-1144 # c9c <__etext>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	0ac60613          	add	a2,a2,172 # 1dc <main>

00000138 <__crt0_main_entry>:
 138:	0ff0000f          	fence
 13c:	0000100f          	fence.i
 140:	30029073          	csrw	mstatus,t0
 144:	00000513          	li	a0,0
 148:	00000593          	li	a1,0
 14c:	000600e7          	jalr	a2

00000150 <__crt0_main_exit>:
 150:	30401073          	csrw	mie,zero
 154:	34051073          	csrw	mscratch,a0
 158:	00000517          	auipc	a0,0x0
 15c:	04450513          	add	a0,a0,68 # 19c <__crt0_trap>
 160:	30551073          	csrw	mtvec,a0
 164:	f1402473          	csrr	s0,mhartid
 168:	02041463          	bnez	s0,190 <__crt0_destructors_end>
 16c:	00001417          	auipc	s0,0x1
 170:	b3040413          	add	s0,s0,-1232 # c9c <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	b2848493          	add	s1,s1,-1240 # c9c <__etext>

0000017c <__crt0_destructors>:
 17c:	00945a63          	bge	s0,s1,190 <__crt0_destructors_end>
 180:	00042083          	lw	ra,0(s0)
 184:	000080e7          	jalr	ra
 188:	00440413          	add	s0,s0,4
 18c:	ff1ff06f          	j	17c <__crt0_destructors>

00000190 <__crt0_destructors_end>:
 190:	00100073          	ebreak

00000194 <__crt0_sleep>:
 194:	10500073          	wfi
 198:	ffdff06f          	j	194 <__crt0_sleep>

0000019c <__crt0_trap>:
 19c:	34041073          	csrw	mscratch,s0
 1a0:	34202473          	csrr	s0,mcause
 1a4:	01f45413          	srl	s0,s0,0x1f
 1a8:	02041663          	bnez	s0,1d4 <__crt0_trap_end>
 1ac:	34102473          	csrr	s0,mepc
 1b0:	00440413          	add	s0,s0,4
 1b4:	34141073          	csrw	mepc,s0
 1b8:	34a02473          	csrr	s0,0x34a
 1bc:	00347413          	and	s0,s0,3
 1c0:	ffd40413          	add	s0,s0,-3
 1c4:	00040863          	beqz	s0,1d4 <__crt0_trap_end>
 1c8:	34102473          	csrr	s0,mepc
 1cc:	ffe40413          	add	s0,s0,-2
 1d0:	34141073          	csrw	mepc,s0

000001d4 <__crt0_trap_end>:
 1d4:	34002473          	csrr	s0,mscratch
 1d8:	30200073          	mret

000001dc <main>:
  C[3] = A[2] * B[1] + A[3] * B[3]; // c22
}

int main(void) {

    neorv32_uart0_setup(19200, 0);
 1dc:	000055b7          	lui	a1,0x5
int main(void) {
 1e0:	fd010113          	add	sp,sp,-48
    neorv32_uart0_setup(19200, 0);
 1e4:	00000613          	li	a2,0
 1e8:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 1ec:	fff50537          	lui	a0,0xfff50
int main(void) {
 1f0:	02112623          	sw	ra,44(sp)
 1f4:	02812423          	sw	s0,40(sp)
 1f8:	02912223          	sw	s1,36(sp)
 1fc:	03212023          	sw	s2,32(sp)
 200:	01312e23          	sw	s3,28(sp)
 204:	01412c23          	sw	s4,24(sp)
    neorv32_uart0_setup(19200, 0);
 208:	354000ef          	jal	55c <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 20c:	fff50537          	lui	a0,0xfff50
 210:	310000ef          	jal	520 <neorv32_uart_available>
 214:	00100793          	li	a5,1
 218:	12050863          	beqz	a0,348 <main+0x16c>

  neorv32_uart0_printf("\n--- CFU vs Normal Matrix Multiplication ---\n");
 21c:	000015b7          	lui	a1,0x1
 220:	c9c58593          	add	a1,a1,-868 # c9c <__etext>
 224:	fff50537          	lui	a0,0xfff50
 228:	658000ef          	jal	880 <neorv32_uart_printf>

  // Matrices
  uint8_t A[4] = {1, 2, 3, 4}; // A = [[1,2],[3,4]]
 22c:	040307b7          	lui	a5,0x4030
 230:	20178793          	add	a5,a5,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
 234:	00f12223          	sw	a5,4(sp)
  uint8_t B[4] = {5, 6, 7, 8}; // B = [[5,6],[7,8]]
 238:	080707b7          	lui	a5,0x8070
 23c:	60578793          	add	a5,a5,1541 # 8070605 <__neorv32_ram_size+0x7ff0605>
 240:	00f12423          	sw	a5,8(sp)
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 244:	00000793          	li	a5,0
 248:	c0079073          	csrw	cycle,a5
 24c:	c0279073          	csrw	instret,a5
  asm volatile (
 250:	01020437          	lui	s0,0x1020
 254:	05060737          	lui	a4,0x5060
 258:	30440413          	add	s0,s0,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 25c:	70870713          	add	a4,a4,1800 # 5060708 <__neorv32_ram_size+0x4fe0708>
 260:	00e4040b          	.insn	4, 0x00e4040b
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 264:	c0002a73          	rdcycle	s4
 268:	c02029f3          	rdinstret	s3
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 26c:	c0079073          	csrw	cycle,a5
 270:	c0279073          	csrw	instret,a5
  // Software Execution
  // --------------------------------------------------------------------------
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  matrix_mul_c(A, B, C_sw);
 274:	00c10613          	add	a2,sp,12
 278:	00810593          	add	a1,sp,8
 27c:	00410513          	add	a0,sp,4
 280:	0ec000ef          	jal	36c <matrix_mul_c>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 284:	c0002973          	rdcycle	s2
 288:	c02024f3          	rdinstret	s1
  uint32_t sw_instrs   = neorv32_cpu_csr_read(CSR_INSTRET);

  // --------------------------------------------------------------------------
  // Print results
  // --------------------------------------------------------------------------
  neorv32_uart0_printf("\nMatrix A:\n[%d %d]\n[%d %d]\n", A[0], A[1], A[2], A[3]);
 28c:	000015b7          	lui	a1,0x1
 290:	00400793          	li	a5,4
 294:	00300713          	li	a4,3
 298:	00200693          	li	a3,2
 29c:	00100613          	li	a2,1
 2a0:	ccc58593          	add	a1,a1,-820 # ccc <__etext+0x30>
 2a4:	fff50537          	lui	a0,0xfff50
 2a8:	5d8000ef          	jal	880 <neorv32_uart_printf>
  neorv32_uart0_printf("Matrix B:\n[%d %d]\n[%d %d]\n", B[0], B[1], B[2], B[3]);
 2ac:	000015b7          	lui	a1,0x1
 2b0:	00800793          	li	a5,8
 2b4:	00700713          	li	a4,7
 2b8:	00600693          	li	a3,6
 2bc:	00500613          	li	a2,5
 2c0:	ce858593          	add	a1,a1,-792 # ce8 <__etext+0x4c>
 2c4:	fff50537          	lui	a0,0xfff50
 2c8:	5b8000ef          	jal	880 <neorv32_uart_printf>
  uint8_t c21 = (cfu_result >> 8)  & 0xff;
 2cc:	00845713          	srl	a4,s0,0x8
  uint8_t c12 = (cfu_result >> 16) & 0xff;
 2d0:	01045693          	srl	a3,s0,0x10

  neorv32_uart0_printf("\nCFU Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
 2d4:	000015b7          	lui	a1,0x1
 2d8:	0ff47793          	zext.b	a5,s0
 2dc:	0ff77713          	zext.b	a4,a4
 2e0:	0ff6f693          	zext.b	a3,a3
 2e4:	01845613          	srl	a2,s0,0x18
 2e8:	d0458593          	add	a1,a1,-764 # d04 <__etext+0x68>
 2ec:	fff50537          	lui	a0,0xfff50
 2f0:	590000ef          	jal	880 <neorv32_uart_printf>
    c11, c12, c21, c22);
  neorv32_uart0_printf("CFU:  Instructions = %u,  Cycles = %u\n", cfu_instrs, cfu_cycles);
 2f4:	000015b7          	lui	a1,0x1
 2f8:	000a0693          	mv	a3,s4
 2fc:	00098613          	mv	a2,s3
 300:	d3858593          	add	a1,a1,-712 # d38 <__etext+0x9c>
 304:	fff50537          	lui	a0,0xfff50
 308:	578000ef          	jal	880 <neorv32_uart_printf>

  neorv32_uart0_printf("\nSoftware Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
 30c:	00f14783          	lbu	a5,15(sp)
 310:	00e14703          	lbu	a4,14(sp)
 314:	00d14683          	lbu	a3,13(sp)
 318:	00c14603          	lbu	a2,12(sp)
 31c:	000015b7          	lui	a1,0x1
 320:	d6058593          	add	a1,a1,-672 # d60 <__etext+0xc4>
 324:	fff50537          	lui	a0,0xfff50
 328:	558000ef          	jal	880 <neorv32_uart_printf>
    C_sw[0], C_sw[1], C_sw[2], C_sw[3]);
  neorv32_uart0_printf("SW :  Instructions = %u,  Cycles = %u\n", sw_instrs, sw_cycles);
 32c:	000015b7          	lui	a1,0x1
 330:	00090693          	mv	a3,s2
 334:	00048613          	mv	a2,s1
 338:	d9c58593          	add	a1,a1,-612 # d9c <__etext+0x100>
 33c:	fff50537          	lui	a0,0xfff50
 340:	540000ef          	jal	880 <neorv32_uart_printf>

  return 0;
 344:	00000793          	li	a5,0
}
 348:	02c12083          	lw	ra,44(sp)
 34c:	02812403          	lw	s0,40(sp)
 350:	02412483          	lw	s1,36(sp)
 354:	02012903          	lw	s2,32(sp)
 358:	01c12983          	lw	s3,28(sp)
 35c:	01812a03          	lw	s4,24(sp)
 360:	00078513          	mv	a0,a5
 364:	03010113          	add	sp,sp,48
 368:	00008067          	ret

0000036c <matrix_mul_c>:
void matrix_mul_c(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 36c:	fe010113          	add	sp,sp,-32
 370:	00112e23          	sw	ra,28(sp)
 374:	00812c23          	sw	s0,24(sp)
 378:	00912a23          	sw	s1,20(sp)
 37c:	01212823          	sw	s2,16(sp)
 380:	01312623          	sw	s3,12(sp)
 384:	00050413          	mv	s0,a0
 388:	00058493          	mv	s1,a1
  C[0] = A[0] * B[0] + A[1] * B[2]; // c11
 38c:	00054503          	lbu	a0,0(a0) # fff50000 <__crt0_ram_last+0x7fed0001>
 390:	0005c583          	lbu	a1,0(a1)
void matrix_mul_c(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 394:	00060913          	mv	s2,a2
  C[0] = A[0] * B[0] + A[1] * B[2]; // c11
 398:	02d000ef          	jal	bc4 <__mulsi3>
 39c:	0024c583          	lbu	a1,2(s1)
 3a0:	00050993          	mv	s3,a0
 3a4:	00144503          	lbu	a0,1(s0)
 3a8:	01d000ef          	jal	bc4 <__mulsi3>
 3ac:	00a989b3          	add	s3,s3,a0
 3b0:	01390023          	sb	s3,0(s2)
  C[1] = A[0] * B[1] + A[1] * B[3]; // c12
 3b4:	0014c583          	lbu	a1,1(s1)
 3b8:	00044503          	lbu	a0,0(s0)
 3bc:	009000ef          	jal	bc4 <__mulsi3>
 3c0:	0034c583          	lbu	a1,3(s1)
 3c4:	00050993          	mv	s3,a0
 3c8:	00144503          	lbu	a0,1(s0)
 3cc:	7f8000ef          	jal	bc4 <__mulsi3>
 3d0:	00a989b3          	add	s3,s3,a0
 3d4:	013900a3          	sb	s3,1(s2)
  C[2] = A[2] * B[0] + A[3] * B[2]; // c21
 3d8:	0004c583          	lbu	a1,0(s1)
 3dc:	00244503          	lbu	a0,2(s0)
 3e0:	7e4000ef          	jal	bc4 <__mulsi3>
 3e4:	0024c583          	lbu	a1,2(s1)
 3e8:	00050993          	mv	s3,a0
 3ec:	00344503          	lbu	a0,3(s0)
 3f0:	7d4000ef          	jal	bc4 <__mulsi3>
 3f4:	00a989b3          	add	s3,s3,a0
 3f8:	01390123          	sb	s3,2(s2)
  C[3] = A[2] * B[1] + A[3] * B[3]; // c22
 3fc:	0014c583          	lbu	a1,1(s1)
 400:	00244503          	lbu	a0,2(s0)
 404:	7c0000ef          	jal	bc4 <__mulsi3>
 408:	0034c583          	lbu	a1,3(s1)
 40c:	00050993          	mv	s3,a0
 410:	00344503          	lbu	a0,3(s0)
 414:	7b0000ef          	jal	bc4 <__mulsi3>
 418:	00a989b3          	add	s3,s3,a0
 41c:	013901a3          	sb	s3,3(s2)
}
 420:	01c12083          	lw	ra,28(sp)
 424:	01812403          	lw	s0,24(sp)
 428:	01412483          	lw	s1,20(sp)
 42c:	01012903          	lw	s2,16(sp)
 430:	00c12983          	lw	s3,12(sp)
 434:	02010113          	add	sp,sp,32
 438:	00008067          	ret

0000043c <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 43c:	fa010113          	add	sp,sp,-96
 440:	04912a23          	sw	s1,84(sp)
 444:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 448:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 44c:	04812c23          	sw	s0,88(sp)
 450:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 454:	dc458593          	add	a1,a1,-572 # dc4 <__etext+0x128>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 458:	00060913          	mv	s2,a2
 45c:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 460:	01000613          	li	a2,16
 464:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 468:	04112e23          	sw	ra,92(sp)
 46c:	05312623          	sw	s3,76(sp)
 470:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 474:	520000ef          	jal	994 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 478:	02400613          	li	a2,36
 47c:	00000593          	li	a1,0
 480:	01c10513          	add	a0,sp,28
 484:	434000ef          	jal	8b8 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 488:	ffe90713          	add	a4,s2,-2
 48c:	00e00793          	li	a5,14
 490:	03f10993          	add	s3,sp,63
 494:	02e7f463          	bgeu	a5,a4,4bc <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 498:	00040023          	sb	zero,0(s0)
}
 49c:	05c12083          	lw	ra,92(sp)
 4a0:	05812403          	lw	s0,88(sp)
 4a4:	05412483          	lw	s1,84(sp)
 4a8:	05012903          	lw	s2,80(sp)
 4ac:	04c12983          	lw	s3,76(sp)
 4b0:	04812a03          	lw	s4,72(sp)
 4b4:	06010113          	add	sp,sp,96
 4b8:	00008067          	ret
    *tmp_ptr = digits[num%base];
 4bc:	00090593          	mv	a1,s2
 4c0:	00048513          	mv	a0,s1
 4c4:	774000ef          	jal	c38 <__umodsi3>
 4c8:	04050793          	add	a5,a0,64
 4cc:	00278533          	add	a0,a5,sp
 4d0:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 4d4:	00090593          	mv	a1,s2
 4d8:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 4dc:	fef98fa3          	sb	a5,-1(s3)
 4e0:	00048a13          	mv	s4,s1
    num /= base;
 4e4:	70c000ef          	jal	bf0 <__hidden___udivsi3>
    tmp_ptr--;
 4e8:	fff98993          	add	s3,s3,-1
    num /= base;
 4ec:	00050493          	mv	s1,a0
  } while (num != 0);
 4f0:	fd2a76e3          	bgeu	s4,s2,4bc <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 4f4:	00000793          	li	a5,0
 4f8:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 4fc:	01c10713          	add	a4,sp,28
 500:	00f70733          	add	a4,a4,a5
 504:	00074703          	lbu	a4,0(a4)
 508:	00070663          	beqz	a4,514 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 50c:	00e40023          	sb	a4,0(s0)
      buffer++;
 510:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 514:	00178793          	add	a5,a5,1
 518:	fed792e3          	bne	a5,a3,4fc <neorv32_aux_itoa+0xc0>
 51c:	f7dff06f          	j	498 <neorv32_aux_itoa+0x5c>

00000520 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 520:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 524:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 528:	00e51c63          	bne	a0,a4,540 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 52c:	fffe07b7          	lui	a5,0xfffe0
 530:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 534:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 538:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 53c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 540:	fff60737          	lui	a4,0xfff60
    return 0;
 544:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 548:	fee79ae3          	bne	a5,a4,53c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 54c:	fffe07b7          	lui	a5,0xfffe0
 550:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 554:	020007b7          	lui	a5,0x2000
 558:	fe1ff06f          	j	538 <neorv32_uart_available+0x18>

0000055c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 55c:	ff010113          	add	sp,sp,-16
 560:	00812423          	sw	s0,8(sp)
 564:	00912223          	sw	s1,4(sp)
 568:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 56c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 570:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 574:	00050493          	mv	s1,a0
 578:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 57c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 580:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 584:	66c000ef          	jal	bf0 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 588:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 58c:	3fe00693          	li	a3,1022
 590:	04a6e663          	bltu	a3,a0,5dc <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 594:	fff50793          	add	a5,a0,-1
 598:	000106b7          	lui	a3,0x10
 59c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 5a0:	00679793          	sll	a5,a5,0x6
 5a4:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 5a8:	07c006b7          	lui	a3,0x7c00
 5ac:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 5b0:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 5b4:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 5b8:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 5bc:	00c12083          	lw	ra,12(sp)
 5c0:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 5c4:	00e7e7b3          	or	a5,a5,a4
 5c8:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 5cc:	00f4a023          	sw	a5,0(s1)
}
 5d0:	00412483          	lw	s1,4(sp)
 5d4:	01010113          	add	sp,sp,16
 5d8:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 5dc:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 5e0:	ffd7f793          	and	a5,a5,-3
 5e4:	00079863          	bnez	a5,5f4 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 5e8:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 5ec:	00170713          	add	a4,a4,1
 5f0:	fa1ff06f          	j	590 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 5f4:	00155513          	srl	a0,a0,0x1
 5f8:	ff5ff06f          	j	5ec <neorv32_uart_setup+0x90>

000005fc <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 5fc:	00052783          	lw	a5,0(a0)
 600:	00a79713          	sll	a4,a5,0xa
 604:	fe075ce3          	bgez	a4,5fc <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 608:	00b52223          	sw	a1,4(a0)
}
 60c:	00008067          	ret

00000610 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 610:	fe010113          	add	sp,sp,-32
 614:	00812c23          	sw	s0,24(sp)
 618:	00912a23          	sw	s1,20(sp)
 61c:	01312623          	sw	s3,12(sp)
 620:	00112e23          	sw	ra,28(sp)
 624:	01212823          	sw	s2,16(sp)
 628:	00050493          	mv	s1,a0
 62c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 630:	00a00993          	li	s3,10
  while ((c = *s++)) {
 634:	00044903          	lbu	s2,0(s0)
 638:	00140413          	add	s0,s0,1
 63c:	02091063          	bnez	s2,65c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 640:	01c12083          	lw	ra,28(sp)
 644:	01812403          	lw	s0,24(sp)
 648:	01412483          	lw	s1,20(sp)
 64c:	01012903          	lw	s2,16(sp)
 650:	00c12983          	lw	s3,12(sp)
 654:	02010113          	add	sp,sp,32
 658:	00008067          	ret
    if (c == '\n') {
 65c:	01391863          	bne	s2,s3,66c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 660:	00d00593          	li	a1,13
 664:	00048513          	mv	a0,s1
 668:	f95ff0ef          	jal	5fc <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 66c:	00090593          	mv	a1,s2
 670:	00048513          	mv	a0,s1
 674:	f89ff0ef          	jal	5fc <neorv32_uart_putc>
 678:	fbdff06f          	j	634 <neorv32_uart_puts+0x24>

0000067c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 67c:	f9010113          	add	sp,sp,-112
 680:	06812423          	sw	s0,104(sp)
 684:	06912223          	sw	s1,100(sp)
 688:	07212023          	sw	s2,96(sp)
 68c:	05312e23          	sw	s3,92(sp)
 690:	00050493          	mv	s1,a0
 694:	00058913          	mv	s2,a1
 698:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 69c:	00000593          	li	a1,0
 6a0:	02400613          	li	a2,36
 6a4:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 6a8:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 6ac:	05412c23          	sw	s4,88(sp)
 6b0:	05512a23          	sw	s5,84(sp)
 6b4:	05712623          	sw	s7,76(sp)
 6b8:	05812423          	sw	s8,72(sp)
 6bc:	05912223          	sw	s9,68(sp)
 6c0:	05a12023          	sw	s10,64(sp)
 6c4:	06112623          	sw	ra,108(sp)
 6c8:	05612823          	sw	s6,80(sp)
 6cc:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 6d0:	02500b93          	li	s7,37
    string_buf[i] = 0;
 6d4:	1e4000ef          	jal	8b8 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 6d8:	00a00c13          	li	s8,10
      c = tolower(*format++);
 6dc:	dd998993          	add	s3,s3,-551 # dd9 <_ctype_+0x1>
 6e0:	00100c93          	li	s9,1
      switch (c) {
 6e4:	07000a13          	li	s4,112
 6e8:	07500d13          	li	s10,117
 6ec:	06300a93          	li	s5,99
  while ((c = *format++)) {
 6f0:	00094d83          	lbu	s11,0(s2)
 6f4:	040d9063          	bnez	s11,734 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 6f8:	06c12083          	lw	ra,108(sp)
 6fc:	06812403          	lw	s0,104(sp)
 700:	06412483          	lw	s1,100(sp)
 704:	06012903          	lw	s2,96(sp)
 708:	05c12983          	lw	s3,92(sp)
 70c:	05812a03          	lw	s4,88(sp)
 710:	05412a83          	lw	s5,84(sp)
 714:	05012b03          	lw	s6,80(sp)
 718:	04c12b83          	lw	s7,76(sp)
 71c:	04812c03          	lw	s8,72(sp)
 720:	04412c83          	lw	s9,68(sp)
 724:	04012d03          	lw	s10,64(sp)
 728:	03c12d83          	lw	s11,60(sp)
 72c:	07010113          	add	sp,sp,112
 730:	00008067          	ret
    if (c == '%') {
 734:	137d9863          	bne	s11,s7,864 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 738:	00290b13          	add	s6,s2,2
 73c:	00194903          	lbu	s2,1(s2)
 740:	013907b3          	add	a5,s2,s3
 744:	0007c783          	lbu	a5,0(a5)
 748:	0037f793          	and	a5,a5,3
 74c:	01979463          	bne	a5,s9,754 <neorv32_uart_vprintf+0xd8>
 750:	02090913          	add	s2,s2,32
      switch (c) {
 754:	0ff97793          	zext.b	a5,s2
 758:	0d478863          	beq	a5,s4,828 <neorv32_uart_vprintf+0x1ac>
 75c:	06fa4c63          	blt	s4,a5,7d4 <neorv32_uart_vprintf+0x158>
 760:	09578e63          	beq	a5,s5,7fc <neorv32_uart_vprintf+0x180>
 764:	02fac663          	blt	s5,a5,790 <neorv32_uart_vprintf+0x114>
 768:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 76c:	02500593          	li	a1,37
      switch (c) {
 770:	00e78a63          	beq	a5,a4,784 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 774:	02500593          	li	a1,37
 778:	00048513          	mv	a0,s1
 77c:	e81ff0ef          	jal	5fc <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 780:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 784:	00048513          	mv	a0,s1
 788:	e75ff0ef          	jal	5fc <neorv32_uart_putc>
 78c:	0840006f          	j	810 <neorv32_uart_vprintf+0x194>
      switch (c) {
 790:	06400713          	li	a4,100
 794:	00e78663          	beq	a5,a4,7a0 <neorv32_uart_vprintf+0x124>
 798:	06900713          	li	a4,105
 79c:	fce79ce3          	bne	a5,a4,774 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 7a0:	00440913          	add	s2,s0,4
 7a4:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 7a8:	00045a63          	bgez	s0,7bc <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 7ac:	02d00593          	li	a1,45
 7b0:	00048513          	mv	a0,s1
            n = -n;
 7b4:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 7b8:	e45ff0ef          	jal	5fc <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 7bc:	00a00613          	li	a2,10
 7c0:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 7c4:	00c10513          	add	a0,sp,12
 7c8:	c75ff0ef          	jal	43c <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 7cc:	00c10593          	add	a1,sp,12
 7d0:	0200006f          	j	7f0 <neorv32_uart_vprintf+0x174>
      switch (c) {
 7d4:	05a78263          	beq	a5,s10,818 <neorv32_uart_vprintf+0x19c>
 7d8:	07800713          	li	a4,120
 7dc:	04e78663          	beq	a5,a4,828 <neorv32_uart_vprintf+0x1ac>
 7e0:	07300713          	li	a4,115
 7e4:	f8e798e3          	bne	a5,a4,774 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 7e8:	00042583          	lw	a1,0(s0)
 7ec:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 7f0:	00048513          	mv	a0,s1
 7f4:	e1dff0ef          	jal	610 <neorv32_uart_puts>
          break;
 7f8:	0140006f          	j	80c <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 7fc:	00044583          	lbu	a1,0(s0)
 800:	00048513          	mv	a0,s1
 804:	00440913          	add	s2,s0,4
 808:	df5ff0ef          	jal	5fc <neorv32_uart_putc>
 80c:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 810:	000b0913          	mv	s2,s6
 814:	eddff06f          	j	6f0 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 818:	00042583          	lw	a1,0(s0)
 81c:	00440913          	add	s2,s0,4
 820:	00a00613          	li	a2,10
 824:	fa1ff06f          	j	7c4 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 828:	00042583          	lw	a1,0(s0)
 82c:	01000613          	li	a2,16
 830:	00c10513          	add	a0,sp,12
 834:	c09ff0ef          	jal	43c <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 838:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 83c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 840:	2f8000ef          	jal	b38 <strlen>
 844:	00800413          	li	s0,8
 848:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 84c:	f80400e3          	beqz	s0,7cc <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 850:	03000593          	li	a1,48
 854:	00048513          	mv	a0,s1
 858:	da5ff0ef          	jal	5fc <neorv32_uart_putc>
 85c:	fff40413          	add	s0,s0,-1
 860:	fedff06f          	j	84c <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 864:	018d9863          	bne	s11,s8,874 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 868:	00d00593          	li	a1,13
 86c:	00048513          	mv	a0,s1
 870:	d8dff0ef          	jal	5fc <neorv32_uart_putc>
  while ((c = *format++)) {
 874:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 878:	000d8593          	mv	a1,s11
 87c:	f09ff06f          	j	784 <neorv32_uart_vprintf+0x108>

00000880 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 880:	fc010113          	add	sp,sp,-64
 884:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 888:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 88c:	00112e23          	sw	ra,28(sp)
 890:	02d12623          	sw	a3,44(sp)
 894:	02e12823          	sw	a4,48(sp)
 898:	02f12a23          	sw	a5,52(sp)
 89c:	03012c23          	sw	a6,56(sp)
 8a0:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 8a4:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 8a8:	dd5ff0ef          	jal	67c <neorv32_uart_vprintf>
  va_end(args);
}
 8ac:	01c12083          	lw	ra,28(sp)
 8b0:	04010113          	add	sp,sp,64
 8b4:	00008067          	ret

000008b8 <memset>:
 8b8:	00f00313          	li	t1,15
 8bc:	00050713          	mv	a4,a0
 8c0:	02c37e63          	bgeu	t1,a2,8fc <memset+0x44>
 8c4:	00f77793          	and	a5,a4,15
 8c8:	0a079063          	bnez	a5,968 <memset+0xb0>
 8cc:	08059263          	bnez	a1,950 <memset+0x98>
 8d0:	ff067693          	and	a3,a2,-16
 8d4:	00f67613          	and	a2,a2,15
 8d8:	00e686b3          	add	a3,a3,a4
 8dc:	00b72023          	sw	a1,0(a4)
 8e0:	00b72223          	sw	a1,4(a4)
 8e4:	00b72423          	sw	a1,8(a4)
 8e8:	00b72623          	sw	a1,12(a4)
 8ec:	01070713          	add	a4,a4,16
 8f0:	fed766e3          	bltu	a4,a3,8dc <memset+0x24>
 8f4:	00061463          	bnez	a2,8fc <memset+0x44>
 8f8:	00008067          	ret
 8fc:	40c306b3          	sub	a3,t1,a2
 900:	00269693          	sll	a3,a3,0x2
 904:	00000297          	auipc	t0,0x0
 908:	005686b3          	add	a3,a3,t0
 90c:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 910:	00b70723          	sb	a1,14(a4)
 914:	00b706a3          	sb	a1,13(a4)
 918:	00b70623          	sb	a1,12(a4)
 91c:	00b705a3          	sb	a1,11(a4)
 920:	00b70523          	sb	a1,10(a4)
 924:	00b704a3          	sb	a1,9(a4)
 928:	00b70423          	sb	a1,8(a4)
 92c:	00b703a3          	sb	a1,7(a4)
 930:	00b70323          	sb	a1,6(a4)
 934:	00b702a3          	sb	a1,5(a4)
 938:	00b70223          	sb	a1,4(a4)
 93c:	00b701a3          	sb	a1,3(a4)
 940:	00b70123          	sb	a1,2(a4)
 944:	00b700a3          	sb	a1,1(a4)
 948:	00b70023          	sb	a1,0(a4)
 94c:	00008067          	ret
 950:	0ff5f593          	zext.b	a1,a1
 954:	00859693          	sll	a3,a1,0x8
 958:	00d5e5b3          	or	a1,a1,a3
 95c:	01059693          	sll	a3,a1,0x10
 960:	00d5e5b3          	or	a1,a1,a3
 964:	f6dff06f          	j	8d0 <memset+0x18>
 968:	00279693          	sll	a3,a5,0x2
 96c:	00000297          	auipc	t0,0x0
 970:	005686b3          	add	a3,a3,t0
 974:	00008293          	mv	t0,ra
 978:	fa0680e7          	jalr	-96(a3)
 97c:	00028093          	mv	ra,t0
 980:	ff078793          	add	a5,a5,-16
 984:	40f70733          	sub	a4,a4,a5
 988:	00f60633          	add	a2,a2,a5
 98c:	f6c378e3          	bgeu	t1,a2,8fc <memset+0x44>
 990:	f3dff06f          	j	8cc <memset+0x14>

00000994 <memcpy>:
 994:	00a5c7b3          	xor	a5,a1,a0
 998:	0037f793          	and	a5,a5,3
 99c:	00c508b3          	add	a7,a0,a2
 9a0:	06079463          	bnez	a5,a08 <memcpy+0x74>
 9a4:	00300793          	li	a5,3
 9a8:	06c7f063          	bgeu	a5,a2,a08 <memcpy+0x74>
 9ac:	00357793          	and	a5,a0,3
 9b0:	00050713          	mv	a4,a0
 9b4:	06079a63          	bnez	a5,a28 <memcpy+0x94>
 9b8:	ffc8f613          	and	a2,a7,-4
 9bc:	40e606b3          	sub	a3,a2,a4
 9c0:	02000793          	li	a5,32
 9c4:	08d7ce63          	blt	a5,a3,a60 <memcpy+0xcc>
 9c8:	00058693          	mv	a3,a1
 9cc:	00070793          	mv	a5,a4
 9d0:	02c77863          	bgeu	a4,a2,a00 <memcpy+0x6c>
 9d4:	0006a803          	lw	a6,0(a3)
 9d8:	00478793          	add	a5,a5,4
 9dc:	00468693          	add	a3,a3,4
 9e0:	ff07ae23          	sw	a6,-4(a5)
 9e4:	fec7e8e3          	bltu	a5,a2,9d4 <memcpy+0x40>
 9e8:	fff60793          	add	a5,a2,-1
 9ec:	40e787b3          	sub	a5,a5,a4
 9f0:	ffc7f793          	and	a5,a5,-4
 9f4:	00478793          	add	a5,a5,4
 9f8:	00f70733          	add	a4,a4,a5
 9fc:	00f585b3          	add	a1,a1,a5
 a00:	01176863          	bltu	a4,a7,a10 <memcpy+0x7c>
 a04:	00008067          	ret
 a08:	00050713          	mv	a4,a0
 a0c:	05157863          	bgeu	a0,a7,a5c <memcpy+0xc8>
 a10:	0005c783          	lbu	a5,0(a1)
 a14:	00170713          	add	a4,a4,1
 a18:	00158593          	add	a1,a1,1
 a1c:	fef70fa3          	sb	a5,-1(a4)
 a20:	fee898e3          	bne	a7,a4,a10 <memcpy+0x7c>
 a24:	00008067          	ret
 a28:	0005c683          	lbu	a3,0(a1)
 a2c:	00170713          	add	a4,a4,1
 a30:	00377793          	and	a5,a4,3
 a34:	fed70fa3          	sb	a3,-1(a4)
 a38:	00158593          	add	a1,a1,1
 a3c:	f6078ee3          	beqz	a5,9b8 <memcpy+0x24>
 a40:	0005c683          	lbu	a3,0(a1)
 a44:	00170713          	add	a4,a4,1
 a48:	00377793          	and	a5,a4,3
 a4c:	fed70fa3          	sb	a3,-1(a4)
 a50:	00158593          	add	a1,a1,1
 a54:	fc079ae3          	bnez	a5,a28 <memcpy+0x94>
 a58:	f61ff06f          	j	9b8 <memcpy+0x24>
 a5c:	00008067          	ret
 a60:	ff010113          	add	sp,sp,-16
 a64:	00812623          	sw	s0,12(sp)
 a68:	02000413          	li	s0,32
 a6c:	0005a383          	lw	t2,0(a1)
 a70:	0045a283          	lw	t0,4(a1)
 a74:	0085af83          	lw	t6,8(a1)
 a78:	00c5af03          	lw	t5,12(a1)
 a7c:	0105ae83          	lw	t4,16(a1)
 a80:	0145ae03          	lw	t3,20(a1)
 a84:	0185a303          	lw	t1,24(a1)
 a88:	01c5a803          	lw	a6,28(a1)
 a8c:	0205a683          	lw	a3,32(a1)
 a90:	02470713          	add	a4,a4,36
 a94:	40e607b3          	sub	a5,a2,a4
 a98:	fc772e23          	sw	t2,-36(a4)
 a9c:	fe572023          	sw	t0,-32(a4)
 aa0:	fff72223          	sw	t6,-28(a4)
 aa4:	ffe72423          	sw	t5,-24(a4)
 aa8:	ffd72623          	sw	t4,-20(a4)
 aac:	ffc72823          	sw	t3,-16(a4)
 ab0:	fe672a23          	sw	t1,-12(a4)
 ab4:	ff072c23          	sw	a6,-8(a4)
 ab8:	fed72e23          	sw	a3,-4(a4)
 abc:	02458593          	add	a1,a1,36
 ac0:	faf446e3          	blt	s0,a5,a6c <memcpy+0xd8>
 ac4:	00058693          	mv	a3,a1
 ac8:	00070793          	mv	a5,a4
 acc:	02c77863          	bgeu	a4,a2,afc <memcpy+0x168>
 ad0:	0006a803          	lw	a6,0(a3)
 ad4:	00478793          	add	a5,a5,4
 ad8:	00468693          	add	a3,a3,4
 adc:	ff07ae23          	sw	a6,-4(a5)
 ae0:	fec7e8e3          	bltu	a5,a2,ad0 <memcpy+0x13c>
 ae4:	fff60793          	add	a5,a2,-1
 ae8:	40e787b3          	sub	a5,a5,a4
 aec:	ffc7f793          	and	a5,a5,-4
 af0:	00478793          	add	a5,a5,4
 af4:	00f70733          	add	a4,a4,a5
 af8:	00f585b3          	add	a1,a1,a5
 afc:	01176863          	bltu	a4,a7,b0c <memcpy+0x178>
 b00:	00c12403          	lw	s0,12(sp)
 b04:	01010113          	add	sp,sp,16
 b08:	00008067          	ret
 b0c:	0005c783          	lbu	a5,0(a1)
 b10:	00170713          	add	a4,a4,1
 b14:	00158593          	add	a1,a1,1
 b18:	fef70fa3          	sb	a5,-1(a4)
 b1c:	fee882e3          	beq	a7,a4,b00 <memcpy+0x16c>
 b20:	0005c783          	lbu	a5,0(a1)
 b24:	00170713          	add	a4,a4,1
 b28:	00158593          	add	a1,a1,1
 b2c:	fef70fa3          	sb	a5,-1(a4)
 b30:	fce89ee3          	bne	a7,a4,b0c <memcpy+0x178>
 b34:	fcdff06f          	j	b00 <memcpy+0x16c>

00000b38 <strlen>:
 b38:	00357793          	and	a5,a0,3
 b3c:	00050713          	mv	a4,a0
 b40:	04079c63          	bnez	a5,b98 <strlen+0x60>
 b44:	7f7f86b7          	lui	a3,0x7f7f8
 b48:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 b4c:	fff00593          	li	a1,-1
 b50:	00072603          	lw	a2,0(a4)
 b54:	00470713          	add	a4,a4,4
 b58:	00d677b3          	and	a5,a2,a3
 b5c:	00d787b3          	add	a5,a5,a3
 b60:	00c7e7b3          	or	a5,a5,a2
 b64:	00d7e7b3          	or	a5,a5,a3
 b68:	feb784e3          	beq	a5,a1,b50 <strlen+0x18>
 b6c:	ffc74683          	lbu	a3,-4(a4)
 b70:	40a707b3          	sub	a5,a4,a0
 b74:	04068463          	beqz	a3,bbc <strlen+0x84>
 b78:	ffd74683          	lbu	a3,-3(a4)
 b7c:	02068c63          	beqz	a3,bb4 <strlen+0x7c>
 b80:	ffe74503          	lbu	a0,-2(a4)
 b84:	00a03533          	snez	a0,a0
 b88:	00f50533          	add	a0,a0,a5
 b8c:	ffe50513          	add	a0,a0,-2
 b90:	00008067          	ret
 b94:	fa0688e3          	beqz	a3,b44 <strlen+0xc>
 b98:	00074783          	lbu	a5,0(a4)
 b9c:	00170713          	add	a4,a4,1
 ba0:	00377693          	and	a3,a4,3
 ba4:	fe0798e3          	bnez	a5,b94 <strlen+0x5c>
 ba8:	40a70733          	sub	a4,a4,a0
 bac:	fff70513          	add	a0,a4,-1
 bb0:	00008067          	ret
 bb4:	ffd78513          	add	a0,a5,-3
 bb8:	00008067          	ret
 bbc:	ffc78513          	add	a0,a5,-4
 bc0:	00008067          	ret

00000bc4 <__mulsi3>:
 bc4:	00050613          	mv	a2,a0
 bc8:	00000513          	li	a0,0
 bcc:	0015f693          	and	a3,a1,1
 bd0:	00068463          	beqz	a3,bd8 <__mulsi3+0x14>
 bd4:	00c50533          	add	a0,a0,a2
 bd8:	0015d593          	srl	a1,a1,0x1
 bdc:	00161613          	sll	a2,a2,0x1
 be0:	fe0596e3          	bnez	a1,bcc <__mulsi3+0x8>
 be4:	00008067          	ret

00000be8 <__divsi3>:
 be8:	06054063          	bltz	a0,c48 <__umodsi3+0x10>
 bec:	0605c663          	bltz	a1,c58 <__umodsi3+0x20>

00000bf0 <__hidden___udivsi3>:
 bf0:	00058613          	mv	a2,a1
 bf4:	00050593          	mv	a1,a0
 bf8:	fff00513          	li	a0,-1
 bfc:	02060c63          	beqz	a2,c34 <__hidden___udivsi3+0x44>
 c00:	00100693          	li	a3,1
 c04:	00b67a63          	bgeu	a2,a1,c18 <__hidden___udivsi3+0x28>
 c08:	00c05863          	blez	a2,c18 <__hidden___udivsi3+0x28>
 c0c:	00161613          	sll	a2,a2,0x1
 c10:	00169693          	sll	a3,a3,0x1
 c14:	feb66ae3          	bltu	a2,a1,c08 <__hidden___udivsi3+0x18>
 c18:	00000513          	li	a0,0
 c1c:	00c5e663          	bltu	a1,a2,c28 <__hidden___udivsi3+0x38>
 c20:	40c585b3          	sub	a1,a1,a2
 c24:	00d56533          	or	a0,a0,a3
 c28:	0016d693          	srl	a3,a3,0x1
 c2c:	00165613          	srl	a2,a2,0x1
 c30:	fe0696e3          	bnez	a3,c1c <__hidden___udivsi3+0x2c>
 c34:	00008067          	ret

00000c38 <__umodsi3>:
 c38:	00008293          	mv	t0,ra
 c3c:	fb5ff0ef          	jal	bf0 <__hidden___udivsi3>
 c40:	00058513          	mv	a0,a1
 c44:	00028067          	jr	t0 # 96c <memset+0xb4>
 c48:	40a00533          	neg	a0,a0
 c4c:	00b04863          	bgtz	a1,c5c <__umodsi3+0x24>
 c50:	40b005b3          	neg	a1,a1
 c54:	f9dff06f          	j	bf0 <__hidden___udivsi3>
 c58:	40b005b3          	neg	a1,a1
 c5c:	00008293          	mv	t0,ra
 c60:	f91ff0ef          	jal	bf0 <__hidden___udivsi3>
 c64:	40a00533          	neg	a0,a0
 c68:	00028067          	jr	t0

00000c6c <__modsi3>:
 c6c:	00008293          	mv	t0,ra
 c70:	0005ca63          	bltz	a1,c84 <__modsi3+0x18>
 c74:	00054c63          	bltz	a0,c8c <__modsi3+0x20>
 c78:	f79ff0ef          	jal	bf0 <__hidden___udivsi3>
 c7c:	00058513          	mv	a0,a1
 c80:	00028067          	jr	t0
 c84:	40b005b3          	neg	a1,a1
 c88:	fe0558e3          	bgez	a0,c78 <__modsi3+0xc>
 c8c:	40a00533          	neg	a0,a0
 c90:	f61ff0ef          	jal	bf0 <__hidden___udivsi3>
 c94:	40b00533          	neg	a0,a1
 c98:	00028067          	jr	t0
