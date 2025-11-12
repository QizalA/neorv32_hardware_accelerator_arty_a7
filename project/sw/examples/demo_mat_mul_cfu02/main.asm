
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0x8b4>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	f1838393          	add	t2,t2,-232 # f4c <__RODATA_END__>
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
 110:	c1840413          	add	s0,s0,-1000 # d24 <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	c1048493          	add	s1,s1,-1008 # d24 <__etext>

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
 170:	bb840413          	add	s0,s0,-1096 # d24 <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	bb048493          	add	s1,s1,-1104 # d24 <__etext>

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
}

int main(void) {

  // Init UART
  neorv32_uart0_setup(19200, 0);
 1dc:	000055b7          	lui	a1,0x5
int main(void) {
 1e0:	fc010113          	add	sp,sp,-64
  neorv32_uart0_setup(19200, 0);
 1e4:	00000613          	li	a2,0
 1e8:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 1ec:	fff50537          	lui	a0,0xfff50
int main(void) {
 1f0:	02112e23          	sw	ra,60(sp)
 1f4:	02812c23          	sw	s0,56(sp)
 1f8:	02912a23          	sw	s1,52(sp)
 1fc:	03212823          	sw	s2,48(sp)
 200:	03312623          	sw	s3,44(sp)
 204:	03412423          	sw	s4,40(sp)
 208:	03512223          	sw	s5,36(sp)
 20c:	03612023          	sw	s6,32(sp)
 210:	01712e23          	sw	s7,28(sp)
 214:	01812c23          	sw	s8,24(sp)
  neorv32_uart0_setup(19200, 0);
 218:	3cc000ef          	jal	5e4 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 21c:	fff50537          	lui	a0,0xfff50
 220:	388000ef          	jal	5a8 <neorv32_uart_available>
 224:	00100793          	li	a5,1
 228:	18050c63          	beqz	a0,3c0 <main+0x1e4>

  // Matrices
  uint8_t A[4] = {1, 2, 3, 4};
 22c:	040307b7          	lui	a5,0x4030
 230:	20178793          	add	a5,a5,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
 234:	00f12223          	sw	a5,4(sp)
  uint8_t C_sw[4];

  uint32_t a_packed = (A[0] << 24) | (A[1] << 16) | (A[2] << 8) | A[3];
  uint32_t b_packed = (B[0] << 24) | (B[1] << 16) | (B[2] << 8) | B[3];

  neorv32_uart0_printf("\n--- CFU vs Normal Matrix Multiplication ---\n");
 238:	000015b7          	lui	a1,0x1
  uint8_t B[4] = {5, 6, 7, 8};
 23c:	080707b7          	lui	a5,0x8070
 240:	60578793          	add	a5,a5,1541 # 8070605 <__neorv32_ram_size+0x7ff0605>
  neorv32_uart0_printf("\n--- CFU vs Normal Matrix Multiplication ---\n");
 244:	d2458593          	add	a1,a1,-732 # d24 <__etext>
 248:	fff50537          	lui	a0,0xfff50
  uint8_t B[4] = {5, 6, 7, 8};
 24c:	00f12423          	sw	a5,8(sp)
  neorv32_uart0_printf("\n--- CFU vs Normal Matrix Multiplication ---\n");
 250:	6b8000ef          	jal	908 <neorv32_uart_printf>
  neorv32_uart0_printf("Matrix A:\n[%d %d]\n[%d %d]\n", A[0], A[1], A[2], A[3]);
 254:	000015b7          	lui	a1,0x1
 258:	00400793          	li	a5,4
 25c:	00300713          	li	a4,3
 260:	00200693          	li	a3,2
 264:	00100613          	li	a2,1
 268:	d5458593          	add	a1,a1,-684 # d54 <__etext+0x30>
 26c:	fff50537          	lui	a0,0xfff50
 270:	698000ef          	jal	908 <neorv32_uart_printf>
  neorv32_uart0_printf("Matrix B:\n[%d %d]\n[%d %d]\n", B[0], B[1], B[2], B[3]);
 274:	000015b7          	lui	a1,0x1
 278:	00800793          	li	a5,8
 27c:	00700713          	li	a4,7
 280:	00600693          	li	a3,6
 284:	00500613          	li	a2,5
 288:	d7058593          	add	a1,a1,-656 # d70 <__etext+0x4c>
 28c:	fff50537          	lui	a0,0xfff50
 290:	678000ef          	jal	908 <neorv32_uart_printf>

  // ====================
  // Measure CFU version
  // ====================
  asm volatile ("nop");
 294:	00000013          	nop
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 298:	00000793          	li	a5,0
 29c:	c0079073          	csrw	cycle,a5
 2a0:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 2a4:	c0002c73          	rdcycle	s8
 2a8:	c0202b73          	rdinstret	s6
  asm volatile (
 2ac:	01020437          	lui	s0,0x1020
 2b0:	05060737          	lui	a4,0x5060
 2b4:	30440413          	add	s0,s0,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 2b8:	70870713          	add	a4,a4,1800 # 5060708 <__neorv32_ram_size+0x4fe0708>
 2bc:	00e4040b          	.insn	4, 0x00e4040b
 2c0:	c0002bf3          	rdcycle	s7
 2c4:	c0202973          	rdinstret	s2
  uint64_t end_cycles_cfu = neorv32_cpu_csr_read(CSR_CYCLE);
  uint64_t end_instrs_cfu = neorv32_cpu_csr_read(CSR_INSTRET);

//  uint32_t cfu_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
//  uint32_t cfu_instrs = neorv32_cpu_csr_read(CSR_INSTRET);
  asm volatile ("nop");
 2c8:	00000013          	nop
  uint8_t c22 = (cfu_result >> 0)  & 0xff;

  // ========================
  // Measure software version
  // ========================
  asm volatile ("nop");
 2cc:	00000013          	nop
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 2d0:	c0079073          	csrw	cycle,a5
 2d4:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 2d8:	c0002af3          	rdcycle	s5
 2dc:	c02029f3          	rdinstret	s3
  neorv32_cpu_csr_write(CSR_INSTRET, 0);
  
  uint64_t start_cycles_sw = neorv32_cpu_csr_read(CSR_CYCLE);
  uint64_t start_instrs_sw = neorv32_cpu_csr_read(CSR_INSTRET);

  matrix_mul_c(A, B, C_sw);
 2e0:	00c10613          	add	a2,sp,12
 2e4:	00810593          	add	a1,sp,8
 2e8:	00410513          	add	a0,sp,4
 2ec:	108000ef          	jal	3f4 <matrix_mul_c>
 2f0:	c0002a73          	rdcycle	s4
 2f4:	c02024f3          	rdinstret	s1
  uint64_t end_cycles_sw = neorv32_cpu_csr_read(CSR_CYCLE);
  uint64_t end_instrs_sw = neorv32_cpu_csr_read(CSR_INSTRET);

  //uint32_t sw_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  //uint32_t sw_instrs = neorv32_cpu_csr_read(CSR_INSTRET);
  asm volatile ("nop");
 2f8:	00000013          	nop

  // ====================
  // Show results
  // ====================
  neorv32_uart0_printf("\nCFU Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
 2fc:	000015b7          	lui	a1,0x1
  uint8_t c21 = (cfu_result >> 8)  & 0xff;
 300:	00845713          	srl	a4,s0,0x8
  uint8_t c12 = (cfu_result >> 16) & 0xff;
 304:	01045693          	srl	a3,s0,0x10
  neorv32_uart0_printf("\nCFU Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
 308:	0ff47793          	zext.b	a5,s0
 30c:	0ff77713          	zext.b	a4,a4
 310:	01845613          	srl	a2,s0,0x18
 314:	0ff6f693          	zext.b	a3,a3
 318:	d8c58593          	add	a1,a1,-628 # d8c <__etext+0x68>
 31c:	fff50537          	lui	a0,0xfff50
 320:	5e8000ef          	jal	908 <neorv32_uart_printf>
    c11, c12, c21, c22);
  //neorv32_uart0_printf("CFU:  Instructions = %u,  Cycles = %u\n", cfu_instrs, cfu_cycles);
  uint64_t cycles_taken_cfu = end_cycles_cfu - start_cycles_cfu;
 324:	418b8633          	sub	a2,s7,s8
  uint64_t instrs_taken_cfu = end_instrs_cfu - start_instrs_cfu;
 328:	41690433          	sub	s0,s2,s6
  uint64_t cycles_taken_cfu = end_cycles_cfu - start_cycles_cfu;
 32c:	00cbb6b3          	sltu	a3,s7,a2
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint64_t)cycles_taken_cfu);
 330:	00001b37          	lui	s6,0x1
 334:	40d006b3          	neg	a3,a3
 338:	dc0b0593          	add	a1,s6,-576 # dc0 <__etext+0x9c>
 33c:	fff50537          	lui	a0,0xfff50
  uint64_t instrs_taken_cfu = end_instrs_cfu - start_instrs_cfu;
 340:	00893933          	sltu	s2,s2,s0
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint64_t)cycles_taken_cfu);
 344:	5c4000ef          	jal	908 <neorv32_uart_printf>
  uint64_t instrs_taken_cfu = end_instrs_cfu - start_instrs_cfu;
 348:	41200933          	neg	s2,s2
  neorv32_uart0_printf("Instruction count (SW): %u\n", (uint64_t)instrs_taken_cfu);
 34c:	00090693          	mv	a3,s2
 350:	00001937          	lui	s2,0x1
 354:	00040613          	mv	a2,s0
 358:	ddc90593          	add	a1,s2,-548 # ddc <__etext+0xb8>
 35c:	fff50537          	lui	a0,0xfff50
 360:	5a8000ef          	jal	908 <neorv32_uart_printf>
  
  
  neorv32_uart0_printf("\nSoftware Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
 364:	00f14783          	lbu	a5,15(sp)
 368:	00e14703          	lbu	a4,14(sp)
 36c:	00d14683          	lbu	a3,13(sp)
 370:	00c14603          	lbu	a2,12(sp)
 374:	000015b7          	lui	a1,0x1
 378:	df858593          	add	a1,a1,-520 # df8 <__etext+0xd4>
 37c:	fff50537          	lui	a0,0xfff50
 380:	588000ef          	jal	908 <neorv32_uart_printf>
    C_sw[0], C_sw[1], C_sw[2], C_sw[3]);
  //neorv32_uart0_printf("SW :  Instructions = %u,  Cycles = %u\n", sw_instrs, sw_cycles);
  
  uint64_t cycles_taken_sw = end_cycles_sw - start_cycles_sw;
 384:	415a0633          	sub	a2,s4,s5
 388:	00ca36b3          	sltu	a3,s4,a2
  uint64_t instrs_taken_sw = end_instrs_sw - start_instrs_sw;
 38c:	413489b3          	sub	s3,s1,s3
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint64_t)cycles_taken_sw);
 390:	40d006b3          	neg	a3,a3
 394:	dc0b0593          	add	a1,s6,-576
 398:	fff50537          	lui	a0,0xfff50
  uint64_t instrs_taken_sw = end_instrs_sw - start_instrs_sw;
 39c:	0134b4b3          	sltu	s1,s1,s3
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint64_t)cycles_taken_sw);
 3a0:	568000ef          	jal	908 <neorv32_uart_printf>
  uint64_t instrs_taken_sw = end_instrs_sw - start_instrs_sw;
 3a4:	409004b3          	neg	s1,s1
  neorv32_uart0_printf("Instruction count (SW): %u\n", (uint64_t)instrs_taken_sw);
 3a8:	00098613          	mv	a2,s3
 3ac:	00048693          	mv	a3,s1
 3b0:	ddc90593          	add	a1,s2,-548
 3b4:	fff50537          	lui	a0,0xfff50
 3b8:	550000ef          	jal	908 <neorv32_uart_printf>

  return 0;
 3bc:	00000793          	li	a5,0
}
 3c0:	03c12083          	lw	ra,60(sp)
 3c4:	03812403          	lw	s0,56(sp)
 3c8:	03412483          	lw	s1,52(sp)
 3cc:	03012903          	lw	s2,48(sp)
 3d0:	02c12983          	lw	s3,44(sp)
 3d4:	02812a03          	lw	s4,40(sp)
 3d8:	02412a83          	lw	s5,36(sp)
 3dc:	02012b03          	lw	s6,32(sp)
 3e0:	01c12b83          	lw	s7,28(sp)
 3e4:	01812c03          	lw	s8,24(sp)
 3e8:	00078513          	mv	a0,a5
 3ec:	04010113          	add	sp,sp,64
 3f0:	00008067          	ret

000003f4 <matrix_mul_c>:
void matrix_mul_c(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 3f4:	fe010113          	add	sp,sp,-32
 3f8:	00112e23          	sw	ra,28(sp)
 3fc:	00812c23          	sw	s0,24(sp)
 400:	00912a23          	sw	s1,20(sp)
 404:	01212823          	sw	s2,16(sp)
 408:	01312623          	sw	s3,12(sp)
 40c:	00050413          	mv	s0,a0
 410:	00058493          	mv	s1,a1
  C[0] = A[0] * B[0] + A[1] * B[2]; // c11
 414:	00054503          	lbu	a0,0(a0) # fff50000 <__crt0_ram_last+0x7fed0001>
 418:	0005c583          	lbu	a1,0(a1)
void matrix_mul_c(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 41c:	00060913          	mv	s2,a2
  C[0] = A[0] * B[0] + A[1] * B[2]; // c11
 420:	02d000ef          	jal	c4c <__mulsi3>
 424:	0024c583          	lbu	a1,2(s1)
 428:	00050993          	mv	s3,a0
 42c:	00144503          	lbu	a0,1(s0)
 430:	01d000ef          	jal	c4c <__mulsi3>
 434:	00a989b3          	add	s3,s3,a0
 438:	01390023          	sb	s3,0(s2)
  C[1] = A[0] * B[1] + A[1] * B[3]; // c12
 43c:	0014c583          	lbu	a1,1(s1)
 440:	00044503          	lbu	a0,0(s0)
 444:	009000ef          	jal	c4c <__mulsi3>
 448:	0034c583          	lbu	a1,3(s1)
 44c:	00050993          	mv	s3,a0
 450:	00144503          	lbu	a0,1(s0)
 454:	7f8000ef          	jal	c4c <__mulsi3>
 458:	00a989b3          	add	s3,s3,a0
 45c:	013900a3          	sb	s3,1(s2)
  C[2] = A[2] * B[0] + A[3] * B[2]; // c21
 460:	0004c583          	lbu	a1,0(s1)
 464:	00244503          	lbu	a0,2(s0)
 468:	7e4000ef          	jal	c4c <__mulsi3>
 46c:	0024c583          	lbu	a1,2(s1)
 470:	00050993          	mv	s3,a0
 474:	00344503          	lbu	a0,3(s0)
 478:	7d4000ef          	jal	c4c <__mulsi3>
 47c:	00a989b3          	add	s3,s3,a0
 480:	01390123          	sb	s3,2(s2)
  C[3] = A[2] * B[1] + A[3] * B[3]; // c22
 484:	0014c583          	lbu	a1,1(s1)
 488:	00244503          	lbu	a0,2(s0)
 48c:	7c0000ef          	jal	c4c <__mulsi3>
 490:	0034c583          	lbu	a1,3(s1)
 494:	00050993          	mv	s3,a0
 498:	00344503          	lbu	a0,3(s0)
 49c:	7b0000ef          	jal	c4c <__mulsi3>
 4a0:	00a989b3          	add	s3,s3,a0
 4a4:	013901a3          	sb	s3,3(s2)
}
 4a8:	01c12083          	lw	ra,28(sp)
 4ac:	01812403          	lw	s0,24(sp)
 4b0:	01412483          	lw	s1,20(sp)
 4b4:	01012903          	lw	s2,16(sp)
 4b8:	00c12983          	lw	s3,12(sp)
 4bc:	02010113          	add	sp,sp,32
 4c0:	00008067          	ret

000004c4 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 4c4:	fa010113          	add	sp,sp,-96
 4c8:	04912a23          	sw	s1,84(sp)
 4cc:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 4d0:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 4d4:	04812c23          	sw	s0,88(sp)
 4d8:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 4dc:	e3458593          	add	a1,a1,-460 # e34 <__etext+0x110>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 4e0:	00060913          	mv	s2,a2
 4e4:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 4e8:	01000613          	li	a2,16
 4ec:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 4f0:	04112e23          	sw	ra,92(sp)
 4f4:	05312623          	sw	s3,76(sp)
 4f8:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 4fc:	520000ef          	jal	a1c <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 500:	02400613          	li	a2,36
 504:	00000593          	li	a1,0
 508:	01c10513          	add	a0,sp,28
 50c:	434000ef          	jal	940 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 510:	ffe90713          	add	a4,s2,-2
 514:	00e00793          	li	a5,14
 518:	03f10993          	add	s3,sp,63
 51c:	02e7f463          	bgeu	a5,a4,544 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 520:	00040023          	sb	zero,0(s0)
}
 524:	05c12083          	lw	ra,92(sp)
 528:	05812403          	lw	s0,88(sp)
 52c:	05412483          	lw	s1,84(sp)
 530:	05012903          	lw	s2,80(sp)
 534:	04c12983          	lw	s3,76(sp)
 538:	04812a03          	lw	s4,72(sp)
 53c:	06010113          	add	sp,sp,96
 540:	00008067          	ret
    *tmp_ptr = digits[num%base];
 544:	00090593          	mv	a1,s2
 548:	00048513          	mv	a0,s1
 54c:	774000ef          	jal	cc0 <__umodsi3>
 550:	04050793          	add	a5,a0,64
 554:	00278533          	add	a0,a5,sp
 558:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 55c:	00090593          	mv	a1,s2
 560:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 564:	fef98fa3          	sb	a5,-1(s3)
 568:	00048a13          	mv	s4,s1
    num /= base;
 56c:	70c000ef          	jal	c78 <__hidden___udivsi3>
    tmp_ptr--;
 570:	fff98993          	add	s3,s3,-1
    num /= base;
 574:	00050493          	mv	s1,a0
  } while (num != 0);
 578:	fd2a76e3          	bgeu	s4,s2,544 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 57c:	00000793          	li	a5,0
 580:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 584:	01c10713          	add	a4,sp,28
 588:	00f70733          	add	a4,a4,a5
 58c:	00074703          	lbu	a4,0(a4)
 590:	00070663          	beqz	a4,59c <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 594:	00e40023          	sb	a4,0(s0)
      buffer++;
 598:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 59c:	00178793          	add	a5,a5,1
 5a0:	fed792e3          	bne	a5,a3,584 <neorv32_aux_itoa+0xc0>
 5a4:	f7dff06f          	j	520 <neorv32_aux_itoa+0x5c>

000005a8 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 5a8:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 5ac:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 5b0:	00e51c63          	bne	a0,a4,5c8 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 5b4:	fffe07b7          	lui	a5,0xfffe0
 5b8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 5bc:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 5c0:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 5c4:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 5c8:	fff60737          	lui	a4,0xfff60
    return 0;
 5cc:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 5d0:	fee79ae3          	bne	a5,a4,5c4 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 5d4:	fffe07b7          	lui	a5,0xfffe0
 5d8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 5dc:	020007b7          	lui	a5,0x2000
 5e0:	fe1ff06f          	j	5c0 <neorv32_uart_available+0x18>

000005e4 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 5e4:	ff010113          	add	sp,sp,-16
 5e8:	00812423          	sw	s0,8(sp)
 5ec:	00912223          	sw	s1,4(sp)
 5f0:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 5f4:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 5f8:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 5fc:	00050493          	mv	s1,a0
 600:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 604:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 608:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 60c:	66c000ef          	jal	c78 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 610:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 614:	3fe00693          	li	a3,1022
 618:	04a6e663          	bltu	a3,a0,664 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 61c:	fff50793          	add	a5,a0,-1
 620:	000106b7          	lui	a3,0x10
 624:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 628:	00679793          	sll	a5,a5,0x6
 62c:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 630:	07c006b7          	lui	a3,0x7c00
 634:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 638:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 63c:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 640:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 644:	00c12083          	lw	ra,12(sp)
 648:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 64c:	00e7e7b3          	or	a5,a5,a4
 650:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 654:	00f4a023          	sw	a5,0(s1)
}
 658:	00412483          	lw	s1,4(sp)
 65c:	01010113          	add	sp,sp,16
 660:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 664:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 668:	ffd7f793          	and	a5,a5,-3
 66c:	00079863          	bnez	a5,67c <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 670:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 674:	00170713          	add	a4,a4,1
 678:	fa1ff06f          	j	618 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 67c:	00155513          	srl	a0,a0,0x1
 680:	ff5ff06f          	j	674 <neorv32_uart_setup+0x90>

00000684 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 684:	00052783          	lw	a5,0(a0)
 688:	00a79713          	sll	a4,a5,0xa
 68c:	fe075ce3          	bgez	a4,684 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 690:	00b52223          	sw	a1,4(a0)
}
 694:	00008067          	ret

00000698 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 698:	fe010113          	add	sp,sp,-32
 69c:	00812c23          	sw	s0,24(sp)
 6a0:	00912a23          	sw	s1,20(sp)
 6a4:	01312623          	sw	s3,12(sp)
 6a8:	00112e23          	sw	ra,28(sp)
 6ac:	01212823          	sw	s2,16(sp)
 6b0:	00050493          	mv	s1,a0
 6b4:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 6b8:	00a00993          	li	s3,10
  while ((c = *s++)) {
 6bc:	00044903          	lbu	s2,0(s0)
 6c0:	00140413          	add	s0,s0,1
 6c4:	02091063          	bnez	s2,6e4 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 6c8:	01c12083          	lw	ra,28(sp)
 6cc:	01812403          	lw	s0,24(sp)
 6d0:	01412483          	lw	s1,20(sp)
 6d4:	01012903          	lw	s2,16(sp)
 6d8:	00c12983          	lw	s3,12(sp)
 6dc:	02010113          	add	sp,sp,32
 6e0:	00008067          	ret
    if (c == '\n') {
 6e4:	01391863          	bne	s2,s3,6f4 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 6e8:	00d00593          	li	a1,13
 6ec:	00048513          	mv	a0,s1
 6f0:	f95ff0ef          	jal	684 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 6f4:	00090593          	mv	a1,s2
 6f8:	00048513          	mv	a0,s1
 6fc:	f89ff0ef          	jal	684 <neorv32_uart_putc>
 700:	fbdff06f          	j	6bc <neorv32_uart_puts+0x24>

00000704 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 704:	f9010113          	add	sp,sp,-112
 708:	06812423          	sw	s0,104(sp)
 70c:	06912223          	sw	s1,100(sp)
 710:	07212023          	sw	s2,96(sp)
 714:	05312e23          	sw	s3,92(sp)
 718:	00050493          	mv	s1,a0
 71c:	00058913          	mv	s2,a1
 720:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 724:	00000593          	li	a1,0
 728:	02400613          	li	a2,36
 72c:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 730:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 734:	05412c23          	sw	s4,88(sp)
 738:	05512a23          	sw	s5,84(sp)
 73c:	05712623          	sw	s7,76(sp)
 740:	05812423          	sw	s8,72(sp)
 744:	05912223          	sw	s9,68(sp)
 748:	05a12023          	sw	s10,64(sp)
 74c:	06112623          	sw	ra,108(sp)
 750:	05612823          	sw	s6,80(sp)
 754:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 758:	02500b93          	li	s7,37
    string_buf[i] = 0;
 75c:	1e4000ef          	jal	940 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 760:	00a00c13          	li	s8,10
      c = tolower(*format++);
 764:	e4998993          	add	s3,s3,-439 # e49 <_ctype_+0x1>
 768:	00100c93          	li	s9,1
      switch (c) {
 76c:	07000a13          	li	s4,112
 770:	07500d13          	li	s10,117
 774:	06300a93          	li	s5,99
  while ((c = *format++)) {
 778:	00094d83          	lbu	s11,0(s2)
 77c:	040d9063          	bnez	s11,7bc <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 780:	06c12083          	lw	ra,108(sp)
 784:	06812403          	lw	s0,104(sp)
 788:	06412483          	lw	s1,100(sp)
 78c:	06012903          	lw	s2,96(sp)
 790:	05c12983          	lw	s3,92(sp)
 794:	05812a03          	lw	s4,88(sp)
 798:	05412a83          	lw	s5,84(sp)
 79c:	05012b03          	lw	s6,80(sp)
 7a0:	04c12b83          	lw	s7,76(sp)
 7a4:	04812c03          	lw	s8,72(sp)
 7a8:	04412c83          	lw	s9,68(sp)
 7ac:	04012d03          	lw	s10,64(sp)
 7b0:	03c12d83          	lw	s11,60(sp)
 7b4:	07010113          	add	sp,sp,112
 7b8:	00008067          	ret
    if (c == '%') {
 7bc:	137d9863          	bne	s11,s7,8ec <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 7c0:	00290b13          	add	s6,s2,2
 7c4:	00194903          	lbu	s2,1(s2)
 7c8:	013907b3          	add	a5,s2,s3
 7cc:	0007c783          	lbu	a5,0(a5)
 7d0:	0037f793          	and	a5,a5,3
 7d4:	01979463          	bne	a5,s9,7dc <neorv32_uart_vprintf+0xd8>
 7d8:	02090913          	add	s2,s2,32
      switch (c) {
 7dc:	0ff97793          	zext.b	a5,s2
 7e0:	0d478863          	beq	a5,s4,8b0 <neorv32_uart_vprintf+0x1ac>
 7e4:	06fa4c63          	blt	s4,a5,85c <neorv32_uart_vprintf+0x158>
 7e8:	09578e63          	beq	a5,s5,884 <neorv32_uart_vprintf+0x180>
 7ec:	02fac663          	blt	s5,a5,818 <neorv32_uart_vprintf+0x114>
 7f0:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 7f4:	02500593          	li	a1,37
      switch (c) {
 7f8:	00e78a63          	beq	a5,a4,80c <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 7fc:	02500593          	li	a1,37
 800:	00048513          	mv	a0,s1
 804:	e81ff0ef          	jal	684 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 808:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 80c:	00048513          	mv	a0,s1
 810:	e75ff0ef          	jal	684 <neorv32_uart_putc>
 814:	0840006f          	j	898 <neorv32_uart_vprintf+0x194>
      switch (c) {
 818:	06400713          	li	a4,100
 81c:	00e78663          	beq	a5,a4,828 <neorv32_uart_vprintf+0x124>
 820:	06900713          	li	a4,105
 824:	fce79ce3          	bne	a5,a4,7fc <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 828:	00440913          	add	s2,s0,4
 82c:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 830:	00045a63          	bgez	s0,844 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 834:	02d00593          	li	a1,45
 838:	00048513          	mv	a0,s1
            n = -n;
 83c:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 840:	e45ff0ef          	jal	684 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 844:	00a00613          	li	a2,10
 848:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 84c:	00c10513          	add	a0,sp,12
 850:	c75ff0ef          	jal	4c4 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 854:	00c10593          	add	a1,sp,12
 858:	0200006f          	j	878 <neorv32_uart_vprintf+0x174>
      switch (c) {
 85c:	05a78263          	beq	a5,s10,8a0 <neorv32_uart_vprintf+0x19c>
 860:	07800713          	li	a4,120
 864:	04e78663          	beq	a5,a4,8b0 <neorv32_uart_vprintf+0x1ac>
 868:	07300713          	li	a4,115
 86c:	f8e798e3          	bne	a5,a4,7fc <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 870:	00042583          	lw	a1,0(s0)
 874:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 878:	00048513          	mv	a0,s1
 87c:	e1dff0ef          	jal	698 <neorv32_uart_puts>
          break;
 880:	0140006f          	j	894 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 884:	00044583          	lbu	a1,0(s0)
 888:	00048513          	mv	a0,s1
 88c:	00440913          	add	s2,s0,4
 890:	df5ff0ef          	jal	684 <neorv32_uart_putc>
 894:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 898:	000b0913          	mv	s2,s6
 89c:	eddff06f          	j	778 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 8a0:	00042583          	lw	a1,0(s0)
 8a4:	00440913          	add	s2,s0,4
 8a8:	00a00613          	li	a2,10
 8ac:	fa1ff06f          	j	84c <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 8b0:	00042583          	lw	a1,0(s0)
 8b4:	01000613          	li	a2,16
 8b8:	00c10513          	add	a0,sp,12
 8bc:	c09ff0ef          	jal	4c4 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 8c0:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 8c4:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 8c8:	2f8000ef          	jal	bc0 <strlen>
 8cc:	00800413          	li	s0,8
 8d0:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 8d4:	f80400e3          	beqz	s0,854 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 8d8:	03000593          	li	a1,48
 8dc:	00048513          	mv	a0,s1
 8e0:	da5ff0ef          	jal	684 <neorv32_uart_putc>
 8e4:	fff40413          	add	s0,s0,-1
 8e8:	fedff06f          	j	8d4 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 8ec:	018d9863          	bne	s11,s8,8fc <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 8f0:	00d00593          	li	a1,13
 8f4:	00048513          	mv	a0,s1
 8f8:	d8dff0ef          	jal	684 <neorv32_uart_putc>
  while ((c = *format++)) {
 8fc:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 900:	000d8593          	mv	a1,s11
 904:	f09ff06f          	j	80c <neorv32_uart_vprintf+0x108>

00000908 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 908:	fc010113          	add	sp,sp,-64
 90c:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 910:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 914:	00112e23          	sw	ra,28(sp)
 918:	02d12623          	sw	a3,44(sp)
 91c:	02e12823          	sw	a4,48(sp)
 920:	02f12a23          	sw	a5,52(sp)
 924:	03012c23          	sw	a6,56(sp)
 928:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 92c:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 930:	dd5ff0ef          	jal	704 <neorv32_uart_vprintf>
  va_end(args);
}
 934:	01c12083          	lw	ra,28(sp)
 938:	04010113          	add	sp,sp,64
 93c:	00008067          	ret

00000940 <memset>:
 940:	00f00313          	li	t1,15
 944:	00050713          	mv	a4,a0
 948:	02c37e63          	bgeu	t1,a2,984 <memset+0x44>
 94c:	00f77793          	and	a5,a4,15
 950:	0a079063          	bnez	a5,9f0 <memset+0xb0>
 954:	08059263          	bnez	a1,9d8 <memset+0x98>
 958:	ff067693          	and	a3,a2,-16
 95c:	00f67613          	and	a2,a2,15
 960:	00e686b3          	add	a3,a3,a4
 964:	00b72023          	sw	a1,0(a4)
 968:	00b72223          	sw	a1,4(a4)
 96c:	00b72423          	sw	a1,8(a4)
 970:	00b72623          	sw	a1,12(a4)
 974:	01070713          	add	a4,a4,16
 978:	fed766e3          	bltu	a4,a3,964 <memset+0x24>
 97c:	00061463          	bnez	a2,984 <memset+0x44>
 980:	00008067          	ret
 984:	40c306b3          	sub	a3,t1,a2
 988:	00269693          	sll	a3,a3,0x2
 98c:	00000297          	auipc	t0,0x0
 990:	005686b3          	add	a3,a3,t0
 994:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 998:	00b70723          	sb	a1,14(a4)
 99c:	00b706a3          	sb	a1,13(a4)
 9a0:	00b70623          	sb	a1,12(a4)
 9a4:	00b705a3          	sb	a1,11(a4)
 9a8:	00b70523          	sb	a1,10(a4)
 9ac:	00b704a3          	sb	a1,9(a4)
 9b0:	00b70423          	sb	a1,8(a4)
 9b4:	00b703a3          	sb	a1,7(a4)
 9b8:	00b70323          	sb	a1,6(a4)
 9bc:	00b702a3          	sb	a1,5(a4)
 9c0:	00b70223          	sb	a1,4(a4)
 9c4:	00b701a3          	sb	a1,3(a4)
 9c8:	00b70123          	sb	a1,2(a4)
 9cc:	00b700a3          	sb	a1,1(a4)
 9d0:	00b70023          	sb	a1,0(a4)
 9d4:	00008067          	ret
 9d8:	0ff5f593          	zext.b	a1,a1
 9dc:	00859693          	sll	a3,a1,0x8
 9e0:	00d5e5b3          	or	a1,a1,a3
 9e4:	01059693          	sll	a3,a1,0x10
 9e8:	00d5e5b3          	or	a1,a1,a3
 9ec:	f6dff06f          	j	958 <memset+0x18>
 9f0:	00279693          	sll	a3,a5,0x2
 9f4:	00000297          	auipc	t0,0x0
 9f8:	005686b3          	add	a3,a3,t0
 9fc:	00008293          	mv	t0,ra
 a00:	fa0680e7          	jalr	-96(a3)
 a04:	00028093          	mv	ra,t0
 a08:	ff078793          	add	a5,a5,-16
 a0c:	40f70733          	sub	a4,a4,a5
 a10:	00f60633          	add	a2,a2,a5
 a14:	f6c378e3          	bgeu	t1,a2,984 <memset+0x44>
 a18:	f3dff06f          	j	954 <memset+0x14>

00000a1c <memcpy>:
 a1c:	00a5c7b3          	xor	a5,a1,a0
 a20:	0037f793          	and	a5,a5,3
 a24:	00c508b3          	add	a7,a0,a2
 a28:	06079463          	bnez	a5,a90 <memcpy+0x74>
 a2c:	00300793          	li	a5,3
 a30:	06c7f063          	bgeu	a5,a2,a90 <memcpy+0x74>
 a34:	00357793          	and	a5,a0,3
 a38:	00050713          	mv	a4,a0
 a3c:	06079a63          	bnez	a5,ab0 <memcpy+0x94>
 a40:	ffc8f613          	and	a2,a7,-4
 a44:	40e606b3          	sub	a3,a2,a4
 a48:	02000793          	li	a5,32
 a4c:	08d7ce63          	blt	a5,a3,ae8 <memcpy+0xcc>
 a50:	00058693          	mv	a3,a1
 a54:	00070793          	mv	a5,a4
 a58:	02c77863          	bgeu	a4,a2,a88 <memcpy+0x6c>
 a5c:	0006a803          	lw	a6,0(a3)
 a60:	00478793          	add	a5,a5,4
 a64:	00468693          	add	a3,a3,4
 a68:	ff07ae23          	sw	a6,-4(a5)
 a6c:	fec7e8e3          	bltu	a5,a2,a5c <memcpy+0x40>
 a70:	fff60793          	add	a5,a2,-1
 a74:	40e787b3          	sub	a5,a5,a4
 a78:	ffc7f793          	and	a5,a5,-4
 a7c:	00478793          	add	a5,a5,4
 a80:	00f70733          	add	a4,a4,a5
 a84:	00f585b3          	add	a1,a1,a5
 a88:	01176863          	bltu	a4,a7,a98 <memcpy+0x7c>
 a8c:	00008067          	ret
 a90:	00050713          	mv	a4,a0
 a94:	05157863          	bgeu	a0,a7,ae4 <memcpy+0xc8>
 a98:	0005c783          	lbu	a5,0(a1)
 a9c:	00170713          	add	a4,a4,1
 aa0:	00158593          	add	a1,a1,1
 aa4:	fef70fa3          	sb	a5,-1(a4)
 aa8:	fee898e3          	bne	a7,a4,a98 <memcpy+0x7c>
 aac:	00008067          	ret
 ab0:	0005c683          	lbu	a3,0(a1)
 ab4:	00170713          	add	a4,a4,1
 ab8:	00377793          	and	a5,a4,3
 abc:	fed70fa3          	sb	a3,-1(a4)
 ac0:	00158593          	add	a1,a1,1
 ac4:	f6078ee3          	beqz	a5,a40 <memcpy+0x24>
 ac8:	0005c683          	lbu	a3,0(a1)
 acc:	00170713          	add	a4,a4,1
 ad0:	00377793          	and	a5,a4,3
 ad4:	fed70fa3          	sb	a3,-1(a4)
 ad8:	00158593          	add	a1,a1,1
 adc:	fc079ae3          	bnez	a5,ab0 <memcpy+0x94>
 ae0:	f61ff06f          	j	a40 <memcpy+0x24>
 ae4:	00008067          	ret
 ae8:	ff010113          	add	sp,sp,-16
 aec:	00812623          	sw	s0,12(sp)
 af0:	02000413          	li	s0,32
 af4:	0005a383          	lw	t2,0(a1)
 af8:	0045a283          	lw	t0,4(a1)
 afc:	0085af83          	lw	t6,8(a1)
 b00:	00c5af03          	lw	t5,12(a1)
 b04:	0105ae83          	lw	t4,16(a1)
 b08:	0145ae03          	lw	t3,20(a1)
 b0c:	0185a303          	lw	t1,24(a1)
 b10:	01c5a803          	lw	a6,28(a1)
 b14:	0205a683          	lw	a3,32(a1)
 b18:	02470713          	add	a4,a4,36
 b1c:	40e607b3          	sub	a5,a2,a4
 b20:	fc772e23          	sw	t2,-36(a4)
 b24:	fe572023          	sw	t0,-32(a4)
 b28:	fff72223          	sw	t6,-28(a4)
 b2c:	ffe72423          	sw	t5,-24(a4)
 b30:	ffd72623          	sw	t4,-20(a4)
 b34:	ffc72823          	sw	t3,-16(a4)
 b38:	fe672a23          	sw	t1,-12(a4)
 b3c:	ff072c23          	sw	a6,-8(a4)
 b40:	fed72e23          	sw	a3,-4(a4)
 b44:	02458593          	add	a1,a1,36
 b48:	faf446e3          	blt	s0,a5,af4 <memcpy+0xd8>
 b4c:	00058693          	mv	a3,a1
 b50:	00070793          	mv	a5,a4
 b54:	02c77863          	bgeu	a4,a2,b84 <memcpy+0x168>
 b58:	0006a803          	lw	a6,0(a3)
 b5c:	00478793          	add	a5,a5,4
 b60:	00468693          	add	a3,a3,4
 b64:	ff07ae23          	sw	a6,-4(a5)
 b68:	fec7e8e3          	bltu	a5,a2,b58 <memcpy+0x13c>
 b6c:	fff60793          	add	a5,a2,-1
 b70:	40e787b3          	sub	a5,a5,a4
 b74:	ffc7f793          	and	a5,a5,-4
 b78:	00478793          	add	a5,a5,4
 b7c:	00f70733          	add	a4,a4,a5
 b80:	00f585b3          	add	a1,a1,a5
 b84:	01176863          	bltu	a4,a7,b94 <memcpy+0x178>
 b88:	00c12403          	lw	s0,12(sp)
 b8c:	01010113          	add	sp,sp,16
 b90:	00008067          	ret
 b94:	0005c783          	lbu	a5,0(a1)
 b98:	00170713          	add	a4,a4,1
 b9c:	00158593          	add	a1,a1,1
 ba0:	fef70fa3          	sb	a5,-1(a4)
 ba4:	fee882e3          	beq	a7,a4,b88 <memcpy+0x16c>
 ba8:	0005c783          	lbu	a5,0(a1)
 bac:	00170713          	add	a4,a4,1
 bb0:	00158593          	add	a1,a1,1
 bb4:	fef70fa3          	sb	a5,-1(a4)
 bb8:	fce89ee3          	bne	a7,a4,b94 <memcpy+0x178>
 bbc:	fcdff06f          	j	b88 <memcpy+0x16c>

00000bc0 <strlen>:
 bc0:	00357793          	and	a5,a0,3
 bc4:	00050713          	mv	a4,a0
 bc8:	04079c63          	bnez	a5,c20 <strlen+0x60>
 bcc:	7f7f86b7          	lui	a3,0x7f7f8
 bd0:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 bd4:	fff00593          	li	a1,-1
 bd8:	00072603          	lw	a2,0(a4)
 bdc:	00470713          	add	a4,a4,4
 be0:	00d677b3          	and	a5,a2,a3
 be4:	00d787b3          	add	a5,a5,a3
 be8:	00c7e7b3          	or	a5,a5,a2
 bec:	00d7e7b3          	or	a5,a5,a3
 bf0:	feb784e3          	beq	a5,a1,bd8 <strlen+0x18>
 bf4:	ffc74683          	lbu	a3,-4(a4)
 bf8:	40a707b3          	sub	a5,a4,a0
 bfc:	04068463          	beqz	a3,c44 <strlen+0x84>
 c00:	ffd74683          	lbu	a3,-3(a4)
 c04:	02068c63          	beqz	a3,c3c <strlen+0x7c>
 c08:	ffe74503          	lbu	a0,-2(a4)
 c0c:	00a03533          	snez	a0,a0
 c10:	00f50533          	add	a0,a0,a5
 c14:	ffe50513          	add	a0,a0,-2
 c18:	00008067          	ret
 c1c:	fa0688e3          	beqz	a3,bcc <strlen+0xc>
 c20:	00074783          	lbu	a5,0(a4)
 c24:	00170713          	add	a4,a4,1
 c28:	00377693          	and	a3,a4,3
 c2c:	fe0798e3          	bnez	a5,c1c <strlen+0x5c>
 c30:	40a70733          	sub	a4,a4,a0
 c34:	fff70513          	add	a0,a4,-1
 c38:	00008067          	ret
 c3c:	ffd78513          	add	a0,a5,-3
 c40:	00008067          	ret
 c44:	ffc78513          	add	a0,a5,-4
 c48:	00008067          	ret

00000c4c <__mulsi3>:
 c4c:	00050613          	mv	a2,a0
 c50:	00000513          	li	a0,0
 c54:	0015f693          	and	a3,a1,1
 c58:	00068463          	beqz	a3,c60 <__mulsi3+0x14>
 c5c:	00c50533          	add	a0,a0,a2
 c60:	0015d593          	srl	a1,a1,0x1
 c64:	00161613          	sll	a2,a2,0x1
 c68:	fe0596e3          	bnez	a1,c54 <__mulsi3+0x8>
 c6c:	00008067          	ret

00000c70 <__divsi3>:
 c70:	06054063          	bltz	a0,cd0 <__umodsi3+0x10>
 c74:	0605c663          	bltz	a1,ce0 <__umodsi3+0x20>

00000c78 <__hidden___udivsi3>:
 c78:	00058613          	mv	a2,a1
 c7c:	00050593          	mv	a1,a0
 c80:	fff00513          	li	a0,-1
 c84:	02060c63          	beqz	a2,cbc <__hidden___udivsi3+0x44>
 c88:	00100693          	li	a3,1
 c8c:	00b67a63          	bgeu	a2,a1,ca0 <__hidden___udivsi3+0x28>
 c90:	00c05863          	blez	a2,ca0 <__hidden___udivsi3+0x28>
 c94:	00161613          	sll	a2,a2,0x1
 c98:	00169693          	sll	a3,a3,0x1
 c9c:	feb66ae3          	bltu	a2,a1,c90 <__hidden___udivsi3+0x18>
 ca0:	00000513          	li	a0,0
 ca4:	00c5e663          	bltu	a1,a2,cb0 <__hidden___udivsi3+0x38>
 ca8:	40c585b3          	sub	a1,a1,a2
 cac:	00d56533          	or	a0,a0,a3
 cb0:	0016d693          	srl	a3,a3,0x1
 cb4:	00165613          	srl	a2,a2,0x1
 cb8:	fe0696e3          	bnez	a3,ca4 <__hidden___udivsi3+0x2c>
 cbc:	00008067          	ret

00000cc0 <__umodsi3>:
 cc0:	00008293          	mv	t0,ra
 cc4:	fb5ff0ef          	jal	c78 <__hidden___udivsi3>
 cc8:	00058513          	mv	a0,a1
 ccc:	00028067          	jr	t0 # 9f4 <memset+0xb4>
 cd0:	40a00533          	neg	a0,a0
 cd4:	00b04863          	bgtz	a1,ce4 <__umodsi3+0x24>
 cd8:	40b005b3          	neg	a1,a1
 cdc:	f9dff06f          	j	c78 <__hidden___udivsi3>
 ce0:	40b005b3          	neg	a1,a1
 ce4:	00008293          	mv	t0,ra
 ce8:	f91ff0ef          	jal	c78 <__hidden___udivsi3>
 cec:	40a00533          	neg	a0,a0
 cf0:	00028067          	jr	t0

00000cf4 <__modsi3>:
 cf4:	00008293          	mv	t0,ra
 cf8:	0005ca63          	bltz	a1,d0c <__modsi3+0x18>
 cfc:	00054c63          	bltz	a0,d14 <__modsi3+0x20>
 d00:	f79ff0ef          	jal	c78 <__hidden___udivsi3>
 d04:	00058513          	mv	a0,a1
 d08:	00028067          	jr	t0
 d0c:	40b005b3          	neg	a1,a1
 d10:	fe0558e3          	bgez	a0,d00 <__modsi3+0xc>
 d14:	40a00533          	neg	a0,a0
 d18:	f61ff0ef          	jal	c78 <__hidden___udivsi3>
 d1c:	40b00533          	neg	a0,a1
 d20:	00028067          	jr	t0
