
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0x870>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	f5c38393          	add	t2,t2,-164 # f90 <__crt0_copy_data_src_begin>
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
 110:	c4c40413          	add	s0,s0,-948 # d58 <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	c4448493          	add	s1,s1,-956 # d58 <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	15860613          	add	a2,a2,344 # 288 <main>

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
 178:	be440413          	add	s0,s0,-1052 # d58 <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	bdc48493          	add	s1,s1,-1060 # d58 <__fini_array_end>

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

000001e4 <print_matrix>:
  );
  return result;
}

// Function to print a 3x3 matrix
void print_matrix(uint8_t matrix[3][3]) {
 1e4:	fe010113          	add	sp,sp,-32
 1e8:	00812c23          	sw	s0,24(sp)
 1ec:	01212823          	sw	s2,16(sp)
 1f0:	01312623          	sw	s3,12(sp)
 1f4:	01412423          	sw	s4,8(sp)
 1f8:	01512223          	sw	s5,4(sp)
 1fc:	01612023          	sw	s6,0(sp)
 200:	00112e23          	sw	ra,28(sp)
 204:	00912a23          	sw	s1,20(sp)
 208:	00050413          	mv	s0,a0
 20c:	00950913          	add	s2,a0,9
  for (int i = 0; i < 3; i++) {
    neorv32_uart0_printf("[");
 210:	00001a37          	lui	s4,0x1
    for (int j = 0; j < 3; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
 214:	00001ab7          	lui	s5,0x1
    for (int j = 0; j < 3; j++) {
 218:	00300b13          	li	s6,3
    }
    neorv32_uart0_printf("]\n");
 21c:	000019b7          	lui	s3,0x1
    neorv32_uart0_printf("[");
 220:	d58a0593          	add	a1,s4,-680 # d58 <__fini_array_end>
 224:	fff50537          	lui	a0,0xfff50
 228:	738000ef          	jal	960 <neorv32_uart_printf>
    for (int j = 0; j < 3; j++) {
 22c:	00000493          	li	s1,0
      neorv32_uart0_printf("%d ", matrix[i][j]);
 230:	009407b3          	add	a5,s0,s1
 234:	0007c603          	lbu	a2,0(a5)
 238:	d5ca8593          	add	a1,s5,-676 # d5c <__fini_array_end+0x4>
 23c:	fff50537          	lui	a0,0xfff50
    for (int j = 0; j < 3; j++) {
 240:	00148493          	add	s1,s1,1
      neorv32_uart0_printf("%d ", matrix[i][j]);
 244:	71c000ef          	jal	960 <neorv32_uart_printf>
    for (int j = 0; j < 3; j++) {
 248:	ff6494e3          	bne	s1,s6,230 <print_matrix+0x4c>
    neorv32_uart0_printf("]\n");
 24c:	d6098593          	add	a1,s3,-672 # d60 <__fini_array_end+0x8>
 250:	fff50537          	lui	a0,0xfff50
  for (int i = 0; i < 3; i++) {
 254:	00340413          	add	s0,s0,3
    neorv32_uart0_printf("]\n");
 258:	708000ef          	jal	960 <neorv32_uart_printf>
  for (int i = 0; i < 3; i++) {
 25c:	fd2412e3          	bne	s0,s2,220 <print_matrix+0x3c>
  }
}
 260:	01c12083          	lw	ra,28(sp)
 264:	01812403          	lw	s0,24(sp)
 268:	01412483          	lw	s1,20(sp)
 26c:	01012903          	lw	s2,16(sp)
 270:	00c12983          	lw	s3,12(sp)
 274:	00812a03          	lw	s4,8(sp)
 278:	00412a83          	lw	s5,4(sp)
 27c:	00012b03          	lw	s6,0(sp)
 280:	02010113          	add	sp,sp,32
 284:	00008067          	ret

00000288 <main>:

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 288:	000055b7          	lui	a1,0x5
int main(void) {
 28c:	f8010113          	add	sp,sp,-128
  neorv32_uart0_setup(19200, 0);
 290:	00000613          	li	a2,0
 294:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 298:	fff50537          	lui	a0,0xfff50
int main(void) {
 29c:	06112e23          	sw	ra,124(sp)
 2a0:	06812c23          	sw	s0,120(sp)
 2a4:	06912a23          	sw	s1,116(sp)
 2a8:	07212823          	sw	s2,112(sp)
 2ac:	07312623          	sw	s3,108(sp)
 2b0:	07412423          	sw	s4,104(sp)
 2b4:	07512223          	sw	s5,100(sp)
 2b8:	07612023          	sw	s6,96(sp)
 2bc:	05712e23          	sw	s7,92(sp)
 2c0:	05812c23          	sw	s8,88(sp)
 2c4:	05912a23          	sw	s9,84(sp)
 2c8:	05a12823          	sw	s10,80(sp)
 2cc:	05b12623          	sw	s11,76(sp)
  neorv32_uart0_setup(19200, 0);
 2d0:	36c000ef          	jal	63c <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 2d4:	fff50537          	lui	a0,0xfff50
 2d8:	328000ef          	jal	600 <neorv32_uart_available>
 2dc:	00100793          	li	a5,1
 2e0:	1e050e63          	beqz	a0,4dc <main+0x254>

  neorv32_uart0_printf("\n--- CFU 3x3 Matrix Multiplication ---\n");
 2e4:	000015b7          	lui	a1,0x1
 2e8:	d6458593          	add	a1,a1,-668 # d64 <__fini_array_end+0xc>
 2ec:	fff50537          	lui	a0,0xfff50
 2f0:	670000ef          	jal	960 <neorv32_uart_printf>

  // Define matrices A and B as 3x3 arrays
  //uint8_t A[3][3] = {{1, 2, 3}, {1, 1, 1}, {0, 0, 0}};  // Matrix A
  //uint8_t B[3][3] = {{0, 0, 0}, {1, 1, 1}, {0, 0, 0}};  // Matrix B
  
    uint8_t A[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};  // Matrix A
 2f4:	00001437          	lui	s0,0x1
 2f8:	e8040593          	add	a1,s0,-384 # e80 <__fini_array_end+0x128>
 2fc:	00900613          	li	a2,9
 300:	01c10513          	add	a0,sp,28
 304:	770000ef          	jal	a74 <memcpy>
  uint8_t B[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};  // Matrix B
 308:	00900613          	li	a2,9
 30c:	e8040593          	add	a1,s0,-384
 310:	02810513          	add	a0,sp,40
 314:	760000ef          	jal	a74 <memcpy>

  // Print matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
 318:	000015b7          	lui	a1,0x1
 31c:	d8c58593          	add	a1,a1,-628 # d8c <__fini_array_end+0x34>
 320:	fff50537          	lui	a0,0xfff50
 324:	63c000ef          	jal	960 <neorv32_uart_printf>
  print_matrix(A);
 328:	01c10513          	add	a0,sp,28
 32c:	eb9ff0ef          	jal	1e4 <print_matrix>

  neorv32_uart0_printf("Matrix B:\n");
 330:	000015b7          	lui	a1,0x1
 334:	d9858593          	add	a1,a1,-616 # d98 <__fini_array_end+0x40>
 338:	fff50537          	lui	a0,0xfff50
 33c:	624000ef          	jal	960 <neorv32_uart_printf>
  print_matrix(B);
 340:	02810513          	add	a0,sp,40
 344:	ea1ff0ef          	jal	1e4 <print_matrix>
  uint32_t b_packed_2 = (B[0][2] << 24) | (B[1][2] << 16) | (B[2][2] << 8);   // Third column of B: [7 4 1]
  
  

  // Print the packed values for debugging
  neorv32_uart0_printf("Packed A[0]: %x\n", a_packed_0);
 348:	01020637          	lui	a2,0x1020
 34c:	000015b7          	lui	a1,0x1
 350:	30060613          	add	a2,a2,768 # 1020300 <__neorv32_ram_size+0xfa0300>
 354:	da458593          	add	a1,a1,-604 # da4 <__fini_array_end+0x4c>
 358:	fff50537          	lui	a0,0xfff50
 35c:	604000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed A[1]: %x\n", a_packed_1);
 360:	04050637          	lui	a2,0x4050
 364:	000015b7          	lui	a1,0x1
 368:	60060613          	add	a2,a2,1536 # 4050600 <__neorv32_ram_size+0x3fd0600>
 36c:	db858593          	add	a1,a1,-584 # db8 <__fini_array_end+0x60>
 370:	fff50537          	lui	a0,0xfff50
 374:	5ec000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed A[2]: %x\n", a_packed_2);
 378:	07081637          	lui	a2,0x7081
 37c:	000015b7          	lui	a1,0x1
 380:	90060613          	add	a2,a2,-1792 # 7080900 <__neorv32_ram_size+0x7000900>
 384:	dcc58593          	add	a1,a1,-564 # dcc <__fini_array_end+0x74>
 388:	fff50537          	lui	a0,0xfff50
 38c:	5d4000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[0]: %x\n", b_packed_0);
 390:	01040637          	lui	a2,0x1040
 394:	000015b7          	lui	a1,0x1
 398:	70060613          	add	a2,a2,1792 # 1040700 <__neorv32_ram_size+0xfc0700>
 39c:	de058593          	add	a1,a1,-544 # de0 <__fini_array_end+0x88>
 3a0:	fff50537          	lui	a0,0xfff50
 3a4:	5bc000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[1]: %x\n", b_packed_1);
 3a8:	02051637          	lui	a2,0x2051
 3ac:	000015b7          	lui	a1,0x1
 3b0:	80060613          	add	a2,a2,-2048 # 2050800 <__neorv32_ram_size+0x1fd0800>
 3b4:	df458593          	add	a1,a1,-524 # df4 <__fini_array_end+0x9c>
 3b8:	fff50537          	lui	a0,0xfff50
 3bc:	5a4000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[2]: %x\n", b_packed_2);
 3c0:	03061637          	lui	a2,0x3061
 3c4:	000015b7          	lui	a1,0x1
 3c8:	90060613          	add	a2,a2,-1792 # 3060900 <__neorv32_ram_size+0x2fe0900>
 3cc:	e0858593          	add	a1,a1,-504 # e08 <__fini_array_end+0xb0>
 3d0:	fff50537          	lui	a0,0xfff50
 3d4:	58c000ef          	jal	960 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 3d8:	00000793          	li	a5,0
 3dc:	c0079073          	csrw	cycle,a5
 3e0:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 3e4:	c0202d73          	rdinstret	s10
 3e8:	c0002cf3          	rdcycle	s9
  asm volatile (
 3ec:	010207b7          	lui	a5,0x1020
 3f0:	010406b7          	lui	a3,0x1040
 3f4:	30078793          	add	a5,a5,768 # 1020300 <__neorv32_ram_size+0xfa0300>
 3f8:	70068693          	add	a3,a3,1792 # 1040700 <__neorv32_ram_size+0xfc0700>
 3fc:	00d79c0b          	.insn	4, 0x00d79c0b
 400:	02051737          	lui	a4,0x2051
 404:	80070713          	add	a4,a4,-2048 # 2050800 <__neorv32_ram_size+0x1fd0800>
 408:	00e79b8b          	.insn	4, 0x00e79b8b
 40c:	030615b7          	lui	a1,0x3061
 410:	90058593          	add	a1,a1,-1792 # 3060900 <__neorv32_ram_size+0x2fe0900>
 414:	00b79a0b          	.insn	4, 0x00b79a0b
 418:	040507b7          	lui	a5,0x4050
 41c:	60078793          	add	a5,a5,1536 # 4050600 <__neorv32_ram_size+0x3fd0600>
 420:	00d79b0b          	.insn	4, 0x00d79b0b
 424:	00e79a8b          	.insn	4, 0x00e79a8b
 428:	00b7998b          	.insn	4, 0x00b7998b
 42c:	070817b7          	lui	a5,0x7081
 430:	90078793          	add	a5,a5,-1792 # 7080900 <__neorv32_ram_size+0x7000900>
 434:	00d7990b          	.insn	4, 0x00d7990b
 438:	00e7948b          	.insn	4, 0x00e7948b
 43c:	00b7940b          	.insn	4, 0x00b7940b
 440:	c0202673          	rdinstret	a2
 444:	00c12623          	sw	a2,12(sp)
 448:	c0002df3          	rdcycle	s11
  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);


  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");
 44c:	000015b7          	lui	a1,0x1
 450:	e1c58593          	add	a1,a1,-484 # e1c <__fini_array_end+0xc4>
 454:	fff50537          	lui	a0,0xfff50
 458:	508000ef          	jal	960 <neorv32_uart_printf>

  uint8_t result_matrix[3][3] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF },
 45c:	018a5793          	srl	a5,s4,0x18
  uint8_t result_matrix[3][3] = {
 460:	02f10b23          	sb	a5,54(sp)
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF },
 464:	0189d793          	srl	a5,s3,0x18
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF }
 468:	01895693          	srl	a3,s2,0x18
 46c:	0184d713          	srl	a4,s1,0x18
  uint8_t result_matrix[3][3] = {
 470:	02f10ca3          	sb	a5,57(sp)
  };

  print_matrix(result_matrix);
 474:	03410513          	add	a0,sp,52
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF }
 478:	01845793          	srl	a5,s0,0x18
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF },
 47c:	018c5c13          	srl	s8,s8,0x18
 480:	018bdb93          	srl	s7,s7,0x18
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF },
 484:	018b5b13          	srl	s6,s6,0x18
 488:	018ada93          	srl	s5,s5,0x18
  uint8_t result_matrix[3][3] = {
 48c:	02f10e23          	sb	a5,60(sp)
 490:	02d10d23          	sb	a3,58(sp)
 494:	02e10da3          	sb	a4,59(sp)
 498:	03810a23          	sb	s8,52(sp)
 49c:	03710aa3          	sb	s7,53(sp)
 4a0:	03610ba3          	sb	s6,55(sp)
 4a4:	03510c23          	sb	s5,56(sp)
  print_matrix(result_matrix);
 4a8:	d3dff0ef          	jal	1e4 <print_matrix>
  
    // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
 4ac:	00c12603          	lw	a2,12(sp)
 4b0:	000015b7          	lui	a1,0x1
 4b4:	e3c58593          	add	a1,a1,-452 # e3c <__fini_array_end+0xe4>
 4b8:	41a60633          	sub	a2,a2,s10
 4bc:	fff50537          	lui	a0,0xfff50
 4c0:	4a0000ef          	jal	960 <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));
 4c4:	000015b7          	lui	a1,0x1
 4c8:	419d8633          	sub	a2,s11,s9
 4cc:	e5458593          	add	a1,a1,-428 # e54 <__fini_array_end+0xfc>
 4d0:	fff50537          	lui	a0,0xfff50
 4d4:	48c000ef          	jal	960 <neorv32_uart_printf>


  return 0;
 4d8:	00000793          	li	a5,0
}
 4dc:	07c12083          	lw	ra,124(sp)
 4e0:	07812403          	lw	s0,120(sp)
 4e4:	07412483          	lw	s1,116(sp)
 4e8:	07012903          	lw	s2,112(sp)
 4ec:	06c12983          	lw	s3,108(sp)
 4f0:	06812a03          	lw	s4,104(sp)
 4f4:	06412a83          	lw	s5,100(sp)
 4f8:	06012b03          	lw	s6,96(sp)
 4fc:	05c12b83          	lw	s7,92(sp)
 500:	05812c03          	lw	s8,88(sp)
 504:	05412c83          	lw	s9,84(sp)
 508:	05012d03          	lw	s10,80(sp)
 50c:	04c12d83          	lw	s11,76(sp)
 510:	00078513          	mv	a0,a5
 514:	08010113          	add	sp,sp,128
 518:	00008067          	ret

0000051c <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 51c:	fa010113          	add	sp,sp,-96
 520:	04912a23          	sw	s1,84(sp)
 524:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 528:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 52c:	04812c23          	sw	s0,88(sp)
 530:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 534:	e6c58593          	add	a1,a1,-404 # e6c <__fini_array_end+0x114>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 538:	00060913          	mv	s2,a2
 53c:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 540:	01000613          	li	a2,16
 544:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 548:	04112e23          	sw	ra,92(sp)
 54c:	05312623          	sw	s3,76(sp)
 550:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 554:	520000ef          	jal	a74 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 558:	02400613          	li	a2,36
 55c:	00000593          	li	a1,0
 560:	01c10513          	add	a0,sp,28
 564:	434000ef          	jal	998 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 568:	ffe90713          	add	a4,s2,-2
 56c:	00e00793          	li	a5,14
 570:	03f10993          	add	s3,sp,63
 574:	02e7f463          	bgeu	a5,a4,59c <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 578:	00040023          	sb	zero,0(s0)
}
 57c:	05c12083          	lw	ra,92(sp)
 580:	05812403          	lw	s0,88(sp)
 584:	05412483          	lw	s1,84(sp)
 588:	05012903          	lw	s2,80(sp)
 58c:	04c12983          	lw	s3,76(sp)
 590:	04812a03          	lw	s4,72(sp)
 594:	06010113          	add	sp,sp,96
 598:	00008067          	ret
    *tmp_ptr = digits[num%base];
 59c:	00090593          	mv	a1,s2
 5a0:	00048513          	mv	a0,s1
 5a4:	750000ef          	jal	cf4 <__umodsi3>
 5a8:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 5ac:	00278533          	add	a0,a5,sp
 5b0:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 5b4:	00090593          	mv	a1,s2
 5b8:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 5bc:	fef98fa3          	sb	a5,-1(s3)
 5c0:	00048a13          	mv	s4,s1
    num /= base;
 5c4:	6e8000ef          	jal	cac <__hidden___udivsi3>
    tmp_ptr--;
 5c8:	fff98993          	add	s3,s3,-1
    num /= base;
 5cc:	00050493          	mv	s1,a0
  } while (num != 0);
 5d0:	fd2a76e3          	bgeu	s4,s2,59c <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 5d4:	00000793          	li	a5,0
 5d8:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 5dc:	01c10713          	add	a4,sp,28
 5e0:	00f70733          	add	a4,a4,a5
 5e4:	00074703          	lbu	a4,0(a4)
 5e8:	00070663          	beqz	a4,5f4 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 5ec:	00e40023          	sb	a4,0(s0)
      buffer++;
 5f0:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 5f4:	00178793          	add	a5,a5,1
 5f8:	fed792e3          	bne	a5,a3,5dc <neorv32_aux_itoa+0xc0>
 5fc:	f7dff06f          	j	578 <neorv32_aux_itoa+0x5c>

00000600 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 600:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 604:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 608:	00e51c63          	bne	a0,a4,620 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 60c:	fffe07b7          	lui	a5,0xfffe0
 610:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 614:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 618:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 61c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 620:	fff60737          	lui	a4,0xfff60
    return 0;
 624:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 628:	fee79ae3          	bne	a5,a4,61c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 62c:	fffe07b7          	lui	a5,0xfffe0
 630:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 634:	020007b7          	lui	a5,0x2000
 638:	fe1ff06f          	j	618 <neorv32_uart_available+0x18>

0000063c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 63c:	ff010113          	add	sp,sp,-16
 640:	00812423          	sw	s0,8(sp)
 644:	00912223          	sw	s1,4(sp)
 648:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 64c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 650:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 654:	00050493          	mv	s1,a0
 658:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 65c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 660:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 664:	648000ef          	jal	cac <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 668:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 66c:	3fe00693          	li	a3,1022
 670:	04a6e663          	bltu	a3,a0,6bc <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 674:	fff50793          	add	a5,a0,-1
 678:	000106b7          	lui	a3,0x10
 67c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 680:	00679793          	sll	a5,a5,0x6
 684:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 688:	07c006b7          	lui	a3,0x7c00
 68c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 690:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 694:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 698:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 69c:	00c12083          	lw	ra,12(sp)
 6a0:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 6a4:	00e7e7b3          	or	a5,a5,a4
 6a8:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 6ac:	00f4a023          	sw	a5,0(s1)
}
 6b0:	00412483          	lw	s1,4(sp)
 6b4:	01010113          	add	sp,sp,16
 6b8:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 6bc:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 6c0:	ffd7f793          	and	a5,a5,-3
 6c4:	00079863          	bnez	a5,6d4 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 6c8:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 6cc:	00170713          	add	a4,a4,1
 6d0:	fa1ff06f          	j	670 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 6d4:	00155513          	srl	a0,a0,0x1
 6d8:	ff5ff06f          	j	6cc <neorv32_uart_setup+0x90>

000006dc <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 6dc:	00052783          	lw	a5,0(a0)
 6e0:	00a79713          	sll	a4,a5,0xa
 6e4:	fe075ce3          	bgez	a4,6dc <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 6e8:	00b52223          	sw	a1,4(a0)
}
 6ec:	00008067          	ret

000006f0 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 6f0:	fe010113          	add	sp,sp,-32
 6f4:	00812c23          	sw	s0,24(sp)
 6f8:	00912a23          	sw	s1,20(sp)
 6fc:	01312623          	sw	s3,12(sp)
 700:	00112e23          	sw	ra,28(sp)
 704:	01212823          	sw	s2,16(sp)
 708:	00050493          	mv	s1,a0
 70c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 710:	00a00993          	li	s3,10
  while ((c = *s++)) {
 714:	00044903          	lbu	s2,0(s0)
 718:	00140413          	add	s0,s0,1
 71c:	02091063          	bnez	s2,73c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 720:	01c12083          	lw	ra,28(sp)
 724:	01812403          	lw	s0,24(sp)
 728:	01412483          	lw	s1,20(sp)
 72c:	01012903          	lw	s2,16(sp)
 730:	00c12983          	lw	s3,12(sp)
 734:	02010113          	add	sp,sp,32
 738:	00008067          	ret
    if (c == '\n') {
 73c:	01391863          	bne	s2,s3,74c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 740:	00d00593          	li	a1,13
 744:	00048513          	mv	a0,s1
 748:	f95ff0ef          	jal	6dc <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 74c:	00090593          	mv	a1,s2
 750:	00048513          	mv	a0,s1
 754:	f89ff0ef          	jal	6dc <neorv32_uart_putc>
 758:	fbdff06f          	j	714 <neorv32_uart_puts+0x24>

0000075c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 75c:	f9010113          	add	sp,sp,-112
 760:	06812423          	sw	s0,104(sp)
 764:	06912223          	sw	s1,100(sp)
 768:	07212023          	sw	s2,96(sp)
 76c:	05312e23          	sw	s3,92(sp)
 770:	00050493          	mv	s1,a0
 774:	00058913          	mv	s2,a1
 778:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 77c:	00000593          	li	a1,0
 780:	02400613          	li	a2,36
 784:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 788:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 78c:	05412c23          	sw	s4,88(sp)
 790:	05512a23          	sw	s5,84(sp)
 794:	05712623          	sw	s7,76(sp)
 798:	05812423          	sw	s8,72(sp)
 79c:	05912223          	sw	s9,68(sp)
 7a0:	05a12023          	sw	s10,64(sp)
 7a4:	06112623          	sw	ra,108(sp)
 7a8:	05612823          	sw	s6,80(sp)
 7ac:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 7b0:	02500b93          	li	s7,37
    string_buf[i] = 0;
 7b4:	1e4000ef          	jal	998 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 7b8:	00a00c13          	li	s8,10
      c = tolower(*format++);
 7bc:	e8d98993          	add	s3,s3,-371 # e8d <_ctype_+0x1>
 7c0:	00100c93          	li	s9,1
      switch (c) {
 7c4:	07000a13          	li	s4,112
 7c8:	07500d13          	li	s10,117
 7cc:	06300a93          	li	s5,99
  while ((c = *format++)) {
 7d0:	00094d83          	lbu	s11,0(s2)
 7d4:	040d9063          	bnez	s11,814 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 7d8:	06c12083          	lw	ra,108(sp)
 7dc:	06812403          	lw	s0,104(sp)
 7e0:	06412483          	lw	s1,100(sp)
 7e4:	06012903          	lw	s2,96(sp)
 7e8:	05c12983          	lw	s3,92(sp)
 7ec:	05812a03          	lw	s4,88(sp)
 7f0:	05412a83          	lw	s5,84(sp)
 7f4:	05012b03          	lw	s6,80(sp)
 7f8:	04c12b83          	lw	s7,76(sp)
 7fc:	04812c03          	lw	s8,72(sp)
 800:	04412c83          	lw	s9,68(sp)
 804:	04012d03          	lw	s10,64(sp)
 808:	03c12d83          	lw	s11,60(sp)
 80c:	07010113          	add	sp,sp,112
 810:	00008067          	ret
    if (c == '%') {
 814:	137d9863          	bne	s11,s7,944 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 818:	00290b13          	add	s6,s2,2
 81c:	00194903          	lbu	s2,1(s2)
 820:	013907b3          	add	a5,s2,s3
 824:	0007c783          	lbu	a5,0(a5)
 828:	0037f793          	and	a5,a5,3
 82c:	01979463          	bne	a5,s9,834 <neorv32_uart_vprintf+0xd8>
 830:	02090913          	add	s2,s2,32
      switch (c) {
 834:	0ff97793          	zext.b	a5,s2
 838:	0d478863          	beq	a5,s4,908 <neorv32_uart_vprintf+0x1ac>
 83c:	06fa4c63          	blt	s4,a5,8b4 <neorv32_uart_vprintf+0x158>
 840:	09578e63          	beq	a5,s5,8dc <neorv32_uart_vprintf+0x180>
 844:	02fac663          	blt	s5,a5,870 <neorv32_uart_vprintf+0x114>
 848:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 84c:	02500593          	li	a1,37
      switch (c) {
 850:	00e78a63          	beq	a5,a4,864 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 854:	02500593          	li	a1,37
 858:	00048513          	mv	a0,s1
 85c:	e81ff0ef          	jal	6dc <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 860:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 864:	00048513          	mv	a0,s1
 868:	e75ff0ef          	jal	6dc <neorv32_uart_putc>
 86c:	0840006f          	j	8f0 <neorv32_uart_vprintf+0x194>
      switch (c) {
 870:	06400713          	li	a4,100
 874:	00e78663          	beq	a5,a4,880 <neorv32_uart_vprintf+0x124>
 878:	06900713          	li	a4,105
 87c:	fce79ce3          	bne	a5,a4,854 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 880:	00440913          	add	s2,s0,4
 884:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 888:	00045a63          	bgez	s0,89c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 88c:	02d00593          	li	a1,45
 890:	00048513          	mv	a0,s1
            n = -n;
 894:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 898:	e45ff0ef          	jal	6dc <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 89c:	00a00613          	li	a2,10
 8a0:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 8a4:	00c10513          	add	a0,sp,12
 8a8:	c75ff0ef          	jal	51c <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 8ac:	00c10593          	add	a1,sp,12
 8b0:	0200006f          	j	8d0 <neorv32_uart_vprintf+0x174>
      switch (c) {
 8b4:	05a78263          	beq	a5,s10,8f8 <neorv32_uart_vprintf+0x19c>
 8b8:	07800713          	li	a4,120
 8bc:	04e78663          	beq	a5,a4,908 <neorv32_uart_vprintf+0x1ac>
 8c0:	07300713          	li	a4,115
 8c4:	f8e798e3          	bne	a5,a4,854 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 8c8:	00042583          	lw	a1,0(s0)
 8cc:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 8d0:	00048513          	mv	a0,s1
 8d4:	e1dff0ef          	jal	6f0 <neorv32_uart_puts>
          break;
 8d8:	0140006f          	j	8ec <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 8dc:	00044583          	lbu	a1,0(s0)
 8e0:	00048513          	mv	a0,s1
 8e4:	00440913          	add	s2,s0,4
 8e8:	df5ff0ef          	jal	6dc <neorv32_uart_putc>
 8ec:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 8f0:	000b0913          	mv	s2,s6
 8f4:	eddff06f          	j	7d0 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 8f8:	00042583          	lw	a1,0(s0)
 8fc:	00440913          	add	s2,s0,4
 900:	00a00613          	li	a2,10
 904:	fa1ff06f          	j	8a4 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 908:	00042583          	lw	a1,0(s0)
 90c:	01000613          	li	a2,16
 910:	00c10513          	add	a0,sp,12
 914:	c09ff0ef          	jal	51c <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 918:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 91c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 920:	2f8000ef          	jal	c18 <strlen>
 924:	00800413          	li	s0,8
 928:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 92c:	f80400e3          	beqz	s0,8ac <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 930:	03000593          	li	a1,48
 934:	00048513          	mv	a0,s1
 938:	da5ff0ef          	jal	6dc <neorv32_uart_putc>
 93c:	fff40413          	add	s0,s0,-1
 940:	fedff06f          	j	92c <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 944:	018d9863          	bne	s11,s8,954 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 948:	00d00593          	li	a1,13
 94c:	00048513          	mv	a0,s1
 950:	d8dff0ef          	jal	6dc <neorv32_uart_putc>
  while ((c = *format++)) {
 954:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 958:	000d8593          	mv	a1,s11
 95c:	f09ff06f          	j	864 <neorv32_uart_vprintf+0x108>

00000960 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 960:	fc010113          	add	sp,sp,-64
 964:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 968:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 96c:	00112e23          	sw	ra,28(sp)
 970:	02d12623          	sw	a3,44(sp)
 974:	02e12823          	sw	a4,48(sp)
 978:	02f12a23          	sw	a5,52(sp)
 97c:	03012c23          	sw	a6,56(sp)
 980:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 984:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 988:	dd5ff0ef          	jal	75c <neorv32_uart_vprintf>
  va_end(args);
}
 98c:	01c12083          	lw	ra,28(sp)
 990:	04010113          	add	sp,sp,64
 994:	00008067          	ret

00000998 <memset>:
 998:	00f00313          	li	t1,15
 99c:	00050713          	mv	a4,a0
 9a0:	02c37e63          	bgeu	t1,a2,9dc <memset+0x44>
 9a4:	00f77793          	and	a5,a4,15
 9a8:	0a079063          	bnez	a5,a48 <memset+0xb0>
 9ac:	08059263          	bnez	a1,a30 <memset+0x98>
 9b0:	ff067693          	and	a3,a2,-16
 9b4:	00f67613          	and	a2,a2,15
 9b8:	00e686b3          	add	a3,a3,a4
 9bc:	00b72023          	sw	a1,0(a4)
 9c0:	00b72223          	sw	a1,4(a4)
 9c4:	00b72423          	sw	a1,8(a4)
 9c8:	00b72623          	sw	a1,12(a4)
 9cc:	01070713          	add	a4,a4,16
 9d0:	fed766e3          	bltu	a4,a3,9bc <memset+0x24>
 9d4:	00061463          	bnez	a2,9dc <memset+0x44>
 9d8:	00008067          	ret
 9dc:	40c306b3          	sub	a3,t1,a2
 9e0:	00269693          	sll	a3,a3,0x2
 9e4:	00000297          	auipc	t0,0x0
 9e8:	005686b3          	add	a3,a3,t0
 9ec:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 9f0:	00b70723          	sb	a1,14(a4)
 9f4:	00b706a3          	sb	a1,13(a4)
 9f8:	00b70623          	sb	a1,12(a4)
 9fc:	00b705a3          	sb	a1,11(a4)
 a00:	00b70523          	sb	a1,10(a4)
 a04:	00b704a3          	sb	a1,9(a4)
 a08:	00b70423          	sb	a1,8(a4)
 a0c:	00b703a3          	sb	a1,7(a4)
 a10:	00b70323          	sb	a1,6(a4)
 a14:	00b702a3          	sb	a1,5(a4)
 a18:	00b70223          	sb	a1,4(a4)
 a1c:	00b701a3          	sb	a1,3(a4)
 a20:	00b70123          	sb	a1,2(a4)
 a24:	00b700a3          	sb	a1,1(a4)
 a28:	00b70023          	sb	a1,0(a4)
 a2c:	00008067          	ret
 a30:	0ff5f593          	zext.b	a1,a1
 a34:	00859693          	sll	a3,a1,0x8
 a38:	00d5e5b3          	or	a1,a1,a3
 a3c:	01059693          	sll	a3,a1,0x10
 a40:	00d5e5b3          	or	a1,a1,a3
 a44:	f6dff06f          	j	9b0 <memset+0x18>
 a48:	00279693          	sll	a3,a5,0x2
 a4c:	00000297          	auipc	t0,0x0
 a50:	005686b3          	add	a3,a3,t0
 a54:	00008293          	mv	t0,ra
 a58:	fa0680e7          	jalr	-96(a3)
 a5c:	00028093          	mv	ra,t0
 a60:	ff078793          	add	a5,a5,-16
 a64:	40f70733          	sub	a4,a4,a5
 a68:	00f60633          	add	a2,a2,a5
 a6c:	f6c378e3          	bgeu	t1,a2,9dc <memset+0x44>
 a70:	f3dff06f          	j	9ac <memset+0x14>

00000a74 <memcpy>:
 a74:	00a5c7b3          	xor	a5,a1,a0
 a78:	0037f793          	and	a5,a5,3
 a7c:	00c508b3          	add	a7,a0,a2
 a80:	06079463          	bnez	a5,ae8 <memcpy+0x74>
 a84:	00300793          	li	a5,3
 a88:	06c7f063          	bgeu	a5,a2,ae8 <memcpy+0x74>
 a8c:	00357793          	and	a5,a0,3
 a90:	00050713          	mv	a4,a0
 a94:	06079a63          	bnez	a5,b08 <memcpy+0x94>
 a98:	ffc8f613          	and	a2,a7,-4
 a9c:	40e606b3          	sub	a3,a2,a4
 aa0:	02000793          	li	a5,32
 aa4:	08d7ce63          	blt	a5,a3,b40 <memcpy+0xcc>
 aa8:	00058693          	mv	a3,a1
 aac:	00070793          	mv	a5,a4
 ab0:	02c77863          	bgeu	a4,a2,ae0 <memcpy+0x6c>
 ab4:	0006a803          	lw	a6,0(a3)
 ab8:	00478793          	add	a5,a5,4
 abc:	00468693          	add	a3,a3,4
 ac0:	ff07ae23          	sw	a6,-4(a5)
 ac4:	fec7e8e3          	bltu	a5,a2,ab4 <memcpy+0x40>
 ac8:	fff60793          	add	a5,a2,-1
 acc:	40e787b3          	sub	a5,a5,a4
 ad0:	ffc7f793          	and	a5,a5,-4
 ad4:	00478793          	add	a5,a5,4
 ad8:	00f70733          	add	a4,a4,a5
 adc:	00f585b3          	add	a1,a1,a5
 ae0:	01176863          	bltu	a4,a7,af0 <memcpy+0x7c>
 ae4:	00008067          	ret
 ae8:	00050713          	mv	a4,a0
 aec:	05157863          	bgeu	a0,a7,b3c <memcpy+0xc8>
 af0:	0005c783          	lbu	a5,0(a1)
 af4:	00170713          	add	a4,a4,1
 af8:	00158593          	add	a1,a1,1
 afc:	fef70fa3          	sb	a5,-1(a4)
 b00:	fee898e3          	bne	a7,a4,af0 <memcpy+0x7c>
 b04:	00008067          	ret
 b08:	0005c683          	lbu	a3,0(a1)
 b0c:	00170713          	add	a4,a4,1
 b10:	00377793          	and	a5,a4,3
 b14:	fed70fa3          	sb	a3,-1(a4)
 b18:	00158593          	add	a1,a1,1
 b1c:	f6078ee3          	beqz	a5,a98 <memcpy+0x24>
 b20:	0005c683          	lbu	a3,0(a1)
 b24:	00170713          	add	a4,a4,1
 b28:	00377793          	and	a5,a4,3
 b2c:	fed70fa3          	sb	a3,-1(a4)
 b30:	00158593          	add	a1,a1,1
 b34:	fc079ae3          	bnez	a5,b08 <memcpy+0x94>
 b38:	f61ff06f          	j	a98 <memcpy+0x24>
 b3c:	00008067          	ret
 b40:	ff010113          	add	sp,sp,-16
 b44:	00812623          	sw	s0,12(sp)
 b48:	02000413          	li	s0,32
 b4c:	0005a383          	lw	t2,0(a1)
 b50:	0045a283          	lw	t0,4(a1)
 b54:	0085af83          	lw	t6,8(a1)
 b58:	00c5af03          	lw	t5,12(a1)
 b5c:	0105ae83          	lw	t4,16(a1)
 b60:	0145ae03          	lw	t3,20(a1)
 b64:	0185a303          	lw	t1,24(a1)
 b68:	01c5a803          	lw	a6,28(a1)
 b6c:	0205a683          	lw	a3,32(a1)
 b70:	02470713          	add	a4,a4,36
 b74:	40e607b3          	sub	a5,a2,a4
 b78:	fc772e23          	sw	t2,-36(a4)
 b7c:	fe572023          	sw	t0,-32(a4)
 b80:	fff72223          	sw	t6,-28(a4)
 b84:	ffe72423          	sw	t5,-24(a4)
 b88:	ffd72623          	sw	t4,-20(a4)
 b8c:	ffc72823          	sw	t3,-16(a4)
 b90:	fe672a23          	sw	t1,-12(a4)
 b94:	ff072c23          	sw	a6,-8(a4)
 b98:	fed72e23          	sw	a3,-4(a4)
 b9c:	02458593          	add	a1,a1,36
 ba0:	faf446e3          	blt	s0,a5,b4c <memcpy+0xd8>
 ba4:	00058693          	mv	a3,a1
 ba8:	00070793          	mv	a5,a4
 bac:	02c77863          	bgeu	a4,a2,bdc <memcpy+0x168>
 bb0:	0006a803          	lw	a6,0(a3)
 bb4:	00478793          	add	a5,a5,4
 bb8:	00468693          	add	a3,a3,4
 bbc:	ff07ae23          	sw	a6,-4(a5)
 bc0:	fec7e8e3          	bltu	a5,a2,bb0 <memcpy+0x13c>
 bc4:	fff60793          	add	a5,a2,-1
 bc8:	40e787b3          	sub	a5,a5,a4
 bcc:	ffc7f793          	and	a5,a5,-4
 bd0:	00478793          	add	a5,a5,4
 bd4:	00f70733          	add	a4,a4,a5
 bd8:	00f585b3          	add	a1,a1,a5
 bdc:	01176863          	bltu	a4,a7,bec <memcpy+0x178>
 be0:	00c12403          	lw	s0,12(sp)
 be4:	01010113          	add	sp,sp,16
 be8:	00008067          	ret
 bec:	0005c783          	lbu	a5,0(a1)
 bf0:	00170713          	add	a4,a4,1
 bf4:	00158593          	add	a1,a1,1
 bf8:	fef70fa3          	sb	a5,-1(a4)
 bfc:	fee882e3          	beq	a7,a4,be0 <memcpy+0x16c>
 c00:	0005c783          	lbu	a5,0(a1)
 c04:	00170713          	add	a4,a4,1
 c08:	00158593          	add	a1,a1,1
 c0c:	fef70fa3          	sb	a5,-1(a4)
 c10:	fce89ee3          	bne	a7,a4,bec <memcpy+0x178>
 c14:	fcdff06f          	j	be0 <memcpy+0x16c>

00000c18 <strlen>:
 c18:	00357793          	and	a5,a0,3
 c1c:	00050713          	mv	a4,a0
 c20:	04079c63          	bnez	a5,c78 <strlen+0x60>
 c24:	7f7f86b7          	lui	a3,0x7f7f8
 c28:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 c2c:	fff00593          	li	a1,-1
 c30:	00072603          	lw	a2,0(a4)
 c34:	00470713          	add	a4,a4,4
 c38:	00d677b3          	and	a5,a2,a3
 c3c:	00d787b3          	add	a5,a5,a3
 c40:	00c7e7b3          	or	a5,a5,a2
 c44:	00d7e7b3          	or	a5,a5,a3
 c48:	feb784e3          	beq	a5,a1,c30 <strlen+0x18>
 c4c:	ffc74683          	lbu	a3,-4(a4)
 c50:	40a707b3          	sub	a5,a4,a0
 c54:	04068463          	beqz	a3,c9c <strlen+0x84>
 c58:	ffd74683          	lbu	a3,-3(a4)
 c5c:	02068c63          	beqz	a3,c94 <strlen+0x7c>
 c60:	ffe74503          	lbu	a0,-2(a4)
 c64:	00a03533          	snez	a0,a0
 c68:	00f50533          	add	a0,a0,a5
 c6c:	ffe50513          	add	a0,a0,-2
 c70:	00008067          	ret
 c74:	fa0688e3          	beqz	a3,c24 <strlen+0xc>
 c78:	00074783          	lbu	a5,0(a4)
 c7c:	00170713          	add	a4,a4,1
 c80:	00377693          	and	a3,a4,3
 c84:	fe0798e3          	bnez	a5,c74 <strlen+0x5c>
 c88:	40a70733          	sub	a4,a4,a0
 c8c:	fff70513          	add	a0,a4,-1
 c90:	00008067          	ret
 c94:	ffd78513          	add	a0,a5,-3
 c98:	00008067          	ret
 c9c:	ffc78513          	add	a0,a5,-4
 ca0:	00008067          	ret

00000ca4 <__divsi3>:
 ca4:	06054063          	bltz	a0,d04 <__umodsi3+0x10>
 ca8:	0605c663          	bltz	a1,d14 <__umodsi3+0x20>

00000cac <__hidden___udivsi3>:
 cac:	00058613          	mv	a2,a1
 cb0:	00050593          	mv	a1,a0
 cb4:	fff00513          	li	a0,-1
 cb8:	02060c63          	beqz	a2,cf0 <__hidden___udivsi3+0x44>
 cbc:	00100693          	li	a3,1
 cc0:	00b67a63          	bgeu	a2,a1,cd4 <__hidden___udivsi3+0x28>
 cc4:	00c05863          	blez	a2,cd4 <__hidden___udivsi3+0x28>
 cc8:	00161613          	sll	a2,a2,0x1
 ccc:	00169693          	sll	a3,a3,0x1
 cd0:	feb66ae3          	bltu	a2,a1,cc4 <__hidden___udivsi3+0x18>
 cd4:	00000513          	li	a0,0
 cd8:	00c5e663          	bltu	a1,a2,ce4 <__hidden___udivsi3+0x38>
 cdc:	40c585b3          	sub	a1,a1,a2
 ce0:	00d56533          	or	a0,a0,a3
 ce4:	0016d693          	srl	a3,a3,0x1
 ce8:	00165613          	srl	a2,a2,0x1
 cec:	fe0696e3          	bnez	a3,cd8 <__hidden___udivsi3+0x2c>
 cf0:	00008067          	ret

00000cf4 <__umodsi3>:
 cf4:	00008293          	mv	t0,ra
 cf8:	fb5ff0ef          	jal	cac <__hidden___udivsi3>
 cfc:	00058513          	mv	a0,a1
 d00:	00028067          	jr	t0 # a4c <memset+0xb4>
 d04:	40a00533          	neg	a0,a0
 d08:	00b04863          	bgtz	a1,d18 <__umodsi3+0x24>
 d0c:	40b005b3          	neg	a1,a1
 d10:	f9dff06f          	j	cac <__hidden___udivsi3>
 d14:	40b005b3          	neg	a1,a1
 d18:	00008293          	mv	t0,ra
 d1c:	f91ff0ef          	jal	cac <__hidden___udivsi3>
 d20:	40a00533          	neg	a0,a0
 d24:	00028067          	jr	t0

00000d28 <__modsi3>:
 d28:	00008293          	mv	t0,ra
 d2c:	0005ca63          	bltz	a1,d40 <__modsi3+0x18>
 d30:	00054c63          	bltz	a0,d48 <__modsi3+0x20>
 d34:	f79ff0ef          	jal	cac <__hidden___udivsi3>
 d38:	00058513          	mv	a0,a1
 d3c:	00028067          	jr	t0
 d40:	40b005b3          	neg	a1,a1
 d44:	fe0558e3          	bgez	a0,d34 <__modsi3+0xc>
 d48:	40a00533          	neg	a0,a0
 d4c:	f61ff0ef          	jal	cac <__hidden___udivsi3>
 d50:	40b00533          	neg	a0,a1
 d54:	00028067          	jr	t0
