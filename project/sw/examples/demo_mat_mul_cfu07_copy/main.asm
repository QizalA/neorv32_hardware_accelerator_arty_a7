
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0xa00>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	dcc38393          	add	t2,t2,-564 # e00 <__crt0_copy_data_src_begin>
  3c:	80000417          	auipc	s0,0x80000
  40:	fc440413          	add	s0,s0,-60 # 80000000 <__crt0_copy_data_dst_begin>
  44:	80000497          	auipc	s1,0x80000
  48:	fc448493          	add	s1,s1,-60 # 80000008 <__crt0_bss_end>
  4c:	80000517          	auipc	a0,0x80000
  50:	fbc50513          	add	a0,a0,-68 # 80000008 <__crt0_bss_end>
  54:	80000597          	auipc	a1,0x80000
  58:	fb458593          	add	a1,a1,-76 # 80000008 <__crt0_bss_end>
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
 110:	b4040413          	add	s0,s0,-1216 # c4c <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	b3848493          	add	s1,s1,-1224 # c4c <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	16460613          	add	a2,a2,356 # 294 <main>

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
 178:	ad840413          	add	s0,s0,-1320 # c4c <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	ad048493          	add	s1,s1,-1328 # c4c <__fini_array_end>

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

// Function to print a 2x2 matrix
void print_matrix(uint8_t matrix[2][2]) {
 1e4:	fe010113          	add	sp,sp,-32
 1e8:	01312623          	sw	s3,12(sp)
  for (int i = 0; i < 2; i++) {
    neorv32_uart0_printf("[");
 1ec:	000019b7          	lui	s3,0x1
void print_matrix(uint8_t matrix[2][2]) {
 1f0:	00812c23          	sw	s0,24(sp)
    neorv32_uart0_printf("[");
 1f4:	c4c98593          	add	a1,s3,-948 # c4c <__fini_array_end>
void print_matrix(uint8_t matrix[2][2]) {
 1f8:	00050413          	mv	s0,a0
    neorv32_uart0_printf("[");
 1fc:	fff50537          	lui	a0,0xfff50
void print_matrix(uint8_t matrix[2][2]) {
 200:	00112e23          	sw	ra,28(sp)
 204:	00912a23          	sw	s1,20(sp)
 208:	01212823          	sw	s2,16(sp)
    neorv32_uart0_printf("[");
 20c:	648000ef          	jal	854 <neorv32_uart_printf>
    for (int j = 0; j < 2; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
 210:	00044603          	lbu	a2,0(s0)
 214:	000014b7          	lui	s1,0x1
 218:	c5048593          	add	a1,s1,-944 # c50 <__fini_array_end+0x4>
 21c:	fff50537          	lui	a0,0xfff50
 220:	634000ef          	jal	854 <neorv32_uart_printf>
 224:	00144603          	lbu	a2,1(s0)
 228:	c5048593          	add	a1,s1,-944
 22c:	fff50537          	lui	a0,0xfff50
 230:	624000ef          	jal	854 <neorv32_uart_printf>
    }
    neorv32_uart0_printf("]\n");
 234:	00001937          	lui	s2,0x1
 238:	c5490593          	add	a1,s2,-940 # c54 <__fini_array_end+0x8>
 23c:	fff50537          	lui	a0,0xfff50
 240:	614000ef          	jal	854 <neorv32_uart_printf>
    neorv32_uart0_printf("[");
 244:	c4c98593          	add	a1,s3,-948
 248:	fff50537          	lui	a0,0xfff50
 24c:	608000ef          	jal	854 <neorv32_uart_printf>
      neorv32_uart0_printf("%d ", matrix[i][j]);
 250:	00244603          	lbu	a2,2(s0)
 254:	c5048593          	add	a1,s1,-944
 258:	fff50537          	lui	a0,0xfff50
 25c:	5f8000ef          	jal	854 <neorv32_uart_printf>
 260:	00344603          	lbu	a2,3(s0)
 264:	c5048593          	add	a1,s1,-944
 268:	fff50537          	lui	a0,0xfff50
 26c:	5e8000ef          	jal	854 <neorv32_uart_printf>
  }
}
 270:	01812403          	lw	s0,24(sp)
 274:	01c12083          	lw	ra,28(sp)
 278:	01412483          	lw	s1,20(sp)
 27c:	00c12983          	lw	s3,12(sp)
    neorv32_uart0_printf("]\n");
 280:	c5490593          	add	a1,s2,-940
}
 284:	01012903          	lw	s2,16(sp)
    neorv32_uart0_printf("]\n");
 288:	fff50537          	lui	a0,0xfff50
}
 28c:	02010113          	add	sp,sp,32
    neorv32_uart0_printf("]\n");
 290:	5c40006f          	j	854 <neorv32_uart_printf>

00000294 <main>:

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 294:	000055b7          	lui	a1,0x5
int main(void) {
 298:	fc010113          	add	sp,sp,-64
  neorv32_uart0_setup(19200, 0);
 29c:	00000613          	li	a2,0
 2a0:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 2a4:	fff50537          	lui	a0,0xfff50
int main(void) {
 2a8:	02112e23          	sw	ra,60(sp)
 2ac:	02812c23          	sw	s0,56(sp)
 2b0:	02912a23          	sw	s1,52(sp)
 2b4:	03212823          	sw	s2,48(sp)
 2b8:	03312623          	sw	s3,44(sp)
 2bc:	03412423          	sw	s4,40(sp)
 2c0:	03512223          	sw	s5,36(sp)
 2c4:	03612023          	sw	s6,32(sp)
 2c8:	01712e23          	sw	s7,28(sp)
  neorv32_uart0_setup(19200, 0);
 2cc:	264000ef          	jal	530 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 2d0:	fff50537          	lui	a0,0xfff50
 2d4:	220000ef          	jal	4f4 <neorv32_uart_available>
 2d8:	00100793          	li	a5,1
 2dc:	10050263          	beqz	a0,3e0 <main+0x14c>

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication ---\n");
 2e0:	000015b7          	lui	a1,0x1
 2e4:	c5858593          	add	a1,a1,-936 # c58 <__fini_array_end+0xc>
 2e8:	fff50537          	lui	a0,0xfff50
 2ec:	568000ef          	jal	854 <neorv32_uart_printf>

  // Define matrices A and B as 2x2 arrays
  uint8_t A[2][2] = {{1, 2}, {3, 4}};  // Matrix A: [1 2], [3 4]
 2f0:	800007b7          	lui	a5,0x80000
 2f4:	0007a783          	lw	a5,0(a5) # 80000000 <__crt0_copy_data_dst_begin>
  uint8_t B[2][2] = {{5, 6}, {7, 8}};  // Matrix B: [5 6], [7 8]

  // Print the matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
 2f8:	000015b7          	lui	a1,0x1
 2fc:	c8058593          	add	a1,a1,-896 # c80 <__fini_array_end+0x34>
  uint8_t A[2][2] = {{1, 2}, {3, 4}};  // Matrix A: [1 2], [3 4]
 300:	00f12223          	sw	a5,4(sp)
  uint8_t B[2][2] = {{5, 6}, {7, 8}};  // Matrix B: [5 6], [7 8]
 304:	800007b7          	lui	a5,0x80000
 308:	0047a783          	lw	a5,4(a5) # 80000004 <__crt0_copy_data_dst_begin+0x4>
  neorv32_uart0_printf("Matrix A:\n");
 30c:	fff50537          	lui	a0,0xfff50
  uint8_t B[2][2] = {{5, 6}, {7, 8}};  // Matrix B: [5 6], [7 8]
 310:	00f12423          	sw	a5,8(sp)
  neorv32_uart0_printf("Matrix A:\n");
 314:	540000ef          	jal	854 <neorv32_uart_printf>
  print_matrix(A);
 318:	00410513          	add	a0,sp,4
 31c:	ec9ff0ef          	jal	1e4 <print_matrix>

  neorv32_uart0_printf("Matrix B:\n");
 320:	000015b7          	lui	a1,0x1
 324:	c8c58593          	add	a1,a1,-884 # c8c <__fini_array_end+0x40>
 328:	fff50537          	lui	a0,0xfff50
 32c:	528000ef          	jal	854 <neorv32_uart_printf>
  print_matrix(B);
 330:	00810513          	add	a0,sp,8
 334:	eb1ff0ef          	jal	1e4 <print_matrix>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 338:	00000793          	li	a5,0
 33c:	c0079073          	csrw	cycle,a5
 340:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 344:	c0202b73          	rdinstret	s6
 348:	c0002a73          	rdcycle	s4
  asm volatile (
 34c:	050007b7          	lui	a5,0x5000
 350:	01020737          	lui	a4,0x1020
 354:	70078793          	add	a5,a5,1792 # 5000700 <__neorv32_ram_size+0x4f80700>
 358:	00f7198b          	.insn	4, 0x00f7198b
 35c:	060016b7          	lui	a3,0x6001
 360:	80068693          	add	a3,a3,-2048 # 6000800 <__neorv32_ram_size+0x5f80800>
 364:	00d7190b          	.insn	4, 0x00d7190b
 368:	03040737          	lui	a4,0x3040
 36c:	00f7140b          	.insn	4, 0x00f7140b
 370:	00d7148b          	.insn	4, 0x00d7148b
 374:	c0202bf3          	rdinstret	s7
 378:	c0002af3          	rdcycle	s5

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");
 37c:	000015b7          	lui	a1,0x1
 380:	c9858593          	add	a1,a1,-872 # c98 <__fini_array_end+0x4c>
 384:	fff50537          	lui	a0,0xfff50
 388:	4cc000ef          	jal	854 <neorv32_uart_printf>

  // Print the individual elements of the result matrix
  uint8_t result_matrix[2][2] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF }, // First row: [C11 C12]
 38c:	01895713          	srl	a4,s2,0x18
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF }  // Second row: [C21 C22]
 390:	01845793          	srl	a5,s0,0x18
  uint8_t result_matrix[2][2] = {
 394:	00e106a3          	sb	a4,13(sp)
  };

  print_matrix(result_matrix);
 398:	00c10513          	add	a0,sp,12
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF }  // Second row: [C21 C22]
 39c:	0184d713          	srl	a4,s1,0x18
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF }, // First row: [C11 C12]
 3a0:	0189d993          	srl	s3,s3,0x18
  uint8_t result_matrix[2][2] = {
 3a4:	00f10723          	sb	a5,14(sp)
 3a8:	00e107a3          	sb	a4,15(sp)
 3ac:	01310623          	sb	s3,12(sp)
  print_matrix(result_matrix);
 3b0:	e35ff0ef          	jal	1e4 <print_matrix>

  // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
 3b4:	000015b7          	lui	a1,0x1
 3b8:	416b8633          	sub	a2,s7,s6
 3bc:	cb858593          	add	a1,a1,-840 # cb8 <__fini_array_end+0x6c>
 3c0:	fff50537          	lui	a0,0xfff50
 3c4:	490000ef          	jal	854 <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));
 3c8:	000015b7          	lui	a1,0x1
 3cc:	414a8633          	sub	a2,s5,s4
 3d0:	cd058593          	add	a1,a1,-816 # cd0 <__fini_array_end+0x84>
 3d4:	fff50537          	lui	a0,0xfff50
 3d8:	47c000ef          	jal	854 <neorv32_uart_printf>

  return 0;
 3dc:	00000793          	li	a5,0
}
 3e0:	03c12083          	lw	ra,60(sp)
 3e4:	03812403          	lw	s0,56(sp)
 3e8:	03412483          	lw	s1,52(sp)
 3ec:	03012903          	lw	s2,48(sp)
 3f0:	02c12983          	lw	s3,44(sp)
 3f4:	02812a03          	lw	s4,40(sp)
 3f8:	02412a83          	lw	s5,36(sp)
 3fc:	02012b03          	lw	s6,32(sp)
 400:	01c12b83          	lw	s7,28(sp)
 404:	00078513          	mv	a0,a5
 408:	04010113          	add	sp,sp,64
 40c:	00008067          	ret

00000410 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 410:	fa010113          	add	sp,sp,-96
 414:	04912a23          	sw	s1,84(sp)
 418:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 41c:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 420:	04812c23          	sw	s0,88(sp)
 424:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 428:	ce858593          	add	a1,a1,-792 # ce8 <__fini_array_end+0x9c>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 42c:	00060913          	mv	s2,a2
 430:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 434:	01000613          	li	a2,16
 438:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 43c:	04112e23          	sw	ra,92(sp)
 440:	05312623          	sw	s3,76(sp)
 444:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 448:	520000ef          	jal	968 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 44c:	02400613          	li	a2,36
 450:	00000593          	li	a1,0
 454:	01c10513          	add	a0,sp,28
 458:	434000ef          	jal	88c <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 45c:	ffe90713          	add	a4,s2,-2
 460:	00e00793          	li	a5,14
 464:	03f10993          	add	s3,sp,63
 468:	02e7f463          	bgeu	a5,a4,490 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 46c:	00040023          	sb	zero,0(s0)
}
 470:	05c12083          	lw	ra,92(sp)
 474:	05812403          	lw	s0,88(sp)
 478:	05412483          	lw	s1,84(sp)
 47c:	05012903          	lw	s2,80(sp)
 480:	04c12983          	lw	s3,76(sp)
 484:	04812a03          	lw	s4,72(sp)
 488:	06010113          	add	sp,sp,96
 48c:	00008067          	ret
    *tmp_ptr = digits[num%base];
 490:	00090593          	mv	a1,s2
 494:	00048513          	mv	a0,s1
 498:	750000ef          	jal	be8 <__umodsi3>
 49c:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 4a0:	00278533          	add	a0,a5,sp
 4a4:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 4a8:	00090593          	mv	a1,s2
 4ac:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 4b0:	fef98fa3          	sb	a5,-1(s3)
 4b4:	00048a13          	mv	s4,s1
    num /= base;
 4b8:	6e8000ef          	jal	ba0 <__hidden___udivsi3>
    tmp_ptr--;
 4bc:	fff98993          	add	s3,s3,-1
    num /= base;
 4c0:	00050493          	mv	s1,a0
  } while (num != 0);
 4c4:	fd2a76e3          	bgeu	s4,s2,490 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 4c8:	00000793          	li	a5,0
 4cc:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 4d0:	01c10713          	add	a4,sp,28
 4d4:	00f70733          	add	a4,a4,a5
 4d8:	00074703          	lbu	a4,0(a4) # 3040000 <__neorv32_ram_size+0x2fc0000>
 4dc:	00070663          	beqz	a4,4e8 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 4e0:	00e40023          	sb	a4,0(s0)
      buffer++;
 4e4:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 4e8:	00178793          	add	a5,a5,1
 4ec:	fed792e3          	bne	a5,a3,4d0 <neorv32_aux_itoa+0xc0>
 4f0:	f7dff06f          	j	46c <neorv32_aux_itoa+0x5c>

000004f4 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 4f4:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 4f8:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 4fc:	00e51c63          	bne	a0,a4,514 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 500:	fffe07b7          	lui	a5,0xfffe0
 504:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 508:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 50c:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 510:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 514:	fff60737          	lui	a4,0xfff60
    return 0;
 518:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 51c:	fee79ae3          	bne	a5,a4,510 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 520:	fffe07b7          	lui	a5,0xfffe0
 524:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 528:	020007b7          	lui	a5,0x2000
 52c:	fe1ff06f          	j	50c <neorv32_uart_available+0x18>

00000530 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 530:	ff010113          	add	sp,sp,-16
 534:	00812423          	sw	s0,8(sp)
 538:	00912223          	sw	s1,4(sp)
 53c:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 540:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 544:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 548:	00050493          	mv	s1,a0
 54c:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 550:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 554:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 558:	648000ef          	jal	ba0 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 55c:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 560:	3fe00693          	li	a3,1022
 564:	04a6e663          	bltu	a3,a0,5b0 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 568:	fff50793          	add	a5,a0,-1
 56c:	000106b7          	lui	a3,0x10
 570:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 574:	00679793          	sll	a5,a5,0x6
 578:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 57c:	07c006b7          	lui	a3,0x7c00
 580:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 584:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 588:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 58c:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 590:	00c12083          	lw	ra,12(sp)
 594:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 598:	00e7e7b3          	or	a5,a5,a4
 59c:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 5a0:	00f4a023          	sw	a5,0(s1)
}
 5a4:	00412483          	lw	s1,4(sp)
 5a8:	01010113          	add	sp,sp,16
 5ac:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 5b0:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 5b4:	ffd7f793          	and	a5,a5,-3
 5b8:	00079863          	bnez	a5,5c8 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 5bc:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 5c0:	00170713          	add	a4,a4,1
 5c4:	fa1ff06f          	j	564 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 5c8:	00155513          	srl	a0,a0,0x1
 5cc:	ff5ff06f          	j	5c0 <neorv32_uart_setup+0x90>

000005d0 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 5d0:	00052783          	lw	a5,0(a0)
 5d4:	00a79713          	sll	a4,a5,0xa
 5d8:	fe075ce3          	bgez	a4,5d0 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 5dc:	00b52223          	sw	a1,4(a0)
}
 5e0:	00008067          	ret

000005e4 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 5e4:	fe010113          	add	sp,sp,-32
 5e8:	00812c23          	sw	s0,24(sp)
 5ec:	00912a23          	sw	s1,20(sp)
 5f0:	01312623          	sw	s3,12(sp)
 5f4:	00112e23          	sw	ra,28(sp)
 5f8:	01212823          	sw	s2,16(sp)
 5fc:	00050493          	mv	s1,a0
 600:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 604:	00a00993          	li	s3,10
  while ((c = *s++)) {
 608:	00044903          	lbu	s2,0(s0)
 60c:	00140413          	add	s0,s0,1
 610:	02091063          	bnez	s2,630 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 614:	01c12083          	lw	ra,28(sp)
 618:	01812403          	lw	s0,24(sp)
 61c:	01412483          	lw	s1,20(sp)
 620:	01012903          	lw	s2,16(sp)
 624:	00c12983          	lw	s3,12(sp)
 628:	02010113          	add	sp,sp,32
 62c:	00008067          	ret
    if (c == '\n') {
 630:	01391863          	bne	s2,s3,640 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 634:	00d00593          	li	a1,13
 638:	00048513          	mv	a0,s1
 63c:	f95ff0ef          	jal	5d0 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 640:	00090593          	mv	a1,s2
 644:	00048513          	mv	a0,s1
 648:	f89ff0ef          	jal	5d0 <neorv32_uart_putc>
 64c:	fbdff06f          	j	608 <neorv32_uart_puts+0x24>

00000650 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 650:	f9010113          	add	sp,sp,-112
 654:	06812423          	sw	s0,104(sp)
 658:	06912223          	sw	s1,100(sp)
 65c:	07212023          	sw	s2,96(sp)
 660:	05312e23          	sw	s3,92(sp)
 664:	00050493          	mv	s1,a0
 668:	00058913          	mv	s2,a1
 66c:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 670:	00000593          	li	a1,0
 674:	02400613          	li	a2,36
 678:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 67c:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 680:	05412c23          	sw	s4,88(sp)
 684:	05512a23          	sw	s5,84(sp)
 688:	05712623          	sw	s7,76(sp)
 68c:	05812423          	sw	s8,72(sp)
 690:	05912223          	sw	s9,68(sp)
 694:	05a12023          	sw	s10,64(sp)
 698:	06112623          	sw	ra,108(sp)
 69c:	05612823          	sw	s6,80(sp)
 6a0:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 6a4:	02500b93          	li	s7,37
    string_buf[i] = 0;
 6a8:	1e4000ef          	jal	88c <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 6ac:	00a00c13          	li	s8,10
      c = tolower(*format++);
 6b0:	cfd98993          	add	s3,s3,-771 # cfd <_ctype_+0x1>
 6b4:	00100c93          	li	s9,1
      switch (c) {
 6b8:	07000a13          	li	s4,112
 6bc:	07500d13          	li	s10,117
 6c0:	06300a93          	li	s5,99
  while ((c = *format++)) {
 6c4:	00094d83          	lbu	s11,0(s2)
 6c8:	040d9063          	bnez	s11,708 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 6cc:	06c12083          	lw	ra,108(sp)
 6d0:	06812403          	lw	s0,104(sp)
 6d4:	06412483          	lw	s1,100(sp)
 6d8:	06012903          	lw	s2,96(sp)
 6dc:	05c12983          	lw	s3,92(sp)
 6e0:	05812a03          	lw	s4,88(sp)
 6e4:	05412a83          	lw	s5,84(sp)
 6e8:	05012b03          	lw	s6,80(sp)
 6ec:	04c12b83          	lw	s7,76(sp)
 6f0:	04812c03          	lw	s8,72(sp)
 6f4:	04412c83          	lw	s9,68(sp)
 6f8:	04012d03          	lw	s10,64(sp)
 6fc:	03c12d83          	lw	s11,60(sp)
 700:	07010113          	add	sp,sp,112
 704:	00008067          	ret
    if (c == '%') {
 708:	137d9863          	bne	s11,s7,838 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 70c:	00290b13          	add	s6,s2,2
 710:	00194903          	lbu	s2,1(s2)
 714:	013907b3          	add	a5,s2,s3
 718:	0007c783          	lbu	a5,0(a5)
 71c:	0037f793          	and	a5,a5,3
 720:	01979463          	bne	a5,s9,728 <neorv32_uart_vprintf+0xd8>
 724:	02090913          	add	s2,s2,32
      switch (c) {
 728:	0ff97793          	zext.b	a5,s2
 72c:	0d478863          	beq	a5,s4,7fc <neorv32_uart_vprintf+0x1ac>
 730:	06fa4c63          	blt	s4,a5,7a8 <neorv32_uart_vprintf+0x158>
 734:	09578e63          	beq	a5,s5,7d0 <neorv32_uart_vprintf+0x180>
 738:	02fac663          	blt	s5,a5,764 <neorv32_uart_vprintf+0x114>
 73c:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 740:	02500593          	li	a1,37
      switch (c) {
 744:	00e78a63          	beq	a5,a4,758 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 748:	02500593          	li	a1,37
 74c:	00048513          	mv	a0,s1
 750:	e81ff0ef          	jal	5d0 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 754:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 758:	00048513          	mv	a0,s1
 75c:	e75ff0ef          	jal	5d0 <neorv32_uart_putc>
 760:	0840006f          	j	7e4 <neorv32_uart_vprintf+0x194>
      switch (c) {
 764:	06400713          	li	a4,100
 768:	00e78663          	beq	a5,a4,774 <neorv32_uart_vprintf+0x124>
 76c:	06900713          	li	a4,105
 770:	fce79ce3          	bne	a5,a4,748 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 774:	00440913          	add	s2,s0,4
 778:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 77c:	00045a63          	bgez	s0,790 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 780:	02d00593          	li	a1,45
 784:	00048513          	mv	a0,s1
            n = -n;
 788:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 78c:	e45ff0ef          	jal	5d0 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 790:	00a00613          	li	a2,10
 794:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 798:	00c10513          	add	a0,sp,12
 79c:	c75ff0ef          	jal	410 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 7a0:	00c10593          	add	a1,sp,12
 7a4:	0200006f          	j	7c4 <neorv32_uart_vprintf+0x174>
      switch (c) {
 7a8:	05a78263          	beq	a5,s10,7ec <neorv32_uart_vprintf+0x19c>
 7ac:	07800713          	li	a4,120
 7b0:	04e78663          	beq	a5,a4,7fc <neorv32_uart_vprintf+0x1ac>
 7b4:	07300713          	li	a4,115
 7b8:	f8e798e3          	bne	a5,a4,748 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 7bc:	00042583          	lw	a1,0(s0)
 7c0:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 7c4:	00048513          	mv	a0,s1
 7c8:	e1dff0ef          	jal	5e4 <neorv32_uart_puts>
          break;
 7cc:	0140006f          	j	7e0 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 7d0:	00044583          	lbu	a1,0(s0)
 7d4:	00048513          	mv	a0,s1
 7d8:	00440913          	add	s2,s0,4
 7dc:	df5ff0ef          	jal	5d0 <neorv32_uart_putc>
 7e0:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 7e4:	000b0913          	mv	s2,s6
 7e8:	eddff06f          	j	6c4 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 7ec:	00042583          	lw	a1,0(s0)
 7f0:	00440913          	add	s2,s0,4
 7f4:	00a00613          	li	a2,10
 7f8:	fa1ff06f          	j	798 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 7fc:	00042583          	lw	a1,0(s0)
 800:	01000613          	li	a2,16
 804:	00c10513          	add	a0,sp,12
 808:	c09ff0ef          	jal	410 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 80c:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 810:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 814:	2f8000ef          	jal	b0c <strlen>
 818:	00800413          	li	s0,8
 81c:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 820:	f80400e3          	beqz	s0,7a0 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 824:	03000593          	li	a1,48
 828:	00048513          	mv	a0,s1
 82c:	da5ff0ef          	jal	5d0 <neorv32_uart_putc>
 830:	fff40413          	add	s0,s0,-1
 834:	fedff06f          	j	820 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 838:	018d9863          	bne	s11,s8,848 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 83c:	00d00593          	li	a1,13
 840:	00048513          	mv	a0,s1
 844:	d8dff0ef          	jal	5d0 <neorv32_uart_putc>
  while ((c = *format++)) {
 848:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 84c:	000d8593          	mv	a1,s11
 850:	f09ff06f          	j	758 <neorv32_uart_vprintf+0x108>

00000854 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 854:	fc010113          	add	sp,sp,-64
 858:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 85c:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 860:	00112e23          	sw	ra,28(sp)
 864:	02d12623          	sw	a3,44(sp)
 868:	02e12823          	sw	a4,48(sp)
 86c:	02f12a23          	sw	a5,52(sp)
 870:	03012c23          	sw	a6,56(sp)
 874:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 878:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 87c:	dd5ff0ef          	jal	650 <neorv32_uart_vprintf>
  va_end(args);
}
 880:	01c12083          	lw	ra,28(sp)
 884:	04010113          	add	sp,sp,64
 888:	00008067          	ret

0000088c <memset>:
 88c:	00f00313          	li	t1,15
 890:	00050713          	mv	a4,a0
 894:	02c37e63          	bgeu	t1,a2,8d0 <memset+0x44>
 898:	00f77793          	and	a5,a4,15
 89c:	0a079063          	bnez	a5,93c <memset+0xb0>
 8a0:	08059263          	bnez	a1,924 <memset+0x98>
 8a4:	ff067693          	and	a3,a2,-16
 8a8:	00f67613          	and	a2,a2,15
 8ac:	00e686b3          	add	a3,a3,a4
 8b0:	00b72023          	sw	a1,0(a4)
 8b4:	00b72223          	sw	a1,4(a4)
 8b8:	00b72423          	sw	a1,8(a4)
 8bc:	00b72623          	sw	a1,12(a4)
 8c0:	01070713          	add	a4,a4,16
 8c4:	fed766e3          	bltu	a4,a3,8b0 <memset+0x24>
 8c8:	00061463          	bnez	a2,8d0 <memset+0x44>
 8cc:	00008067          	ret
 8d0:	40c306b3          	sub	a3,t1,a2
 8d4:	00269693          	sll	a3,a3,0x2
 8d8:	00000297          	auipc	t0,0x0
 8dc:	005686b3          	add	a3,a3,t0
 8e0:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 8e4:	00b70723          	sb	a1,14(a4)
 8e8:	00b706a3          	sb	a1,13(a4)
 8ec:	00b70623          	sb	a1,12(a4)
 8f0:	00b705a3          	sb	a1,11(a4)
 8f4:	00b70523          	sb	a1,10(a4)
 8f8:	00b704a3          	sb	a1,9(a4)
 8fc:	00b70423          	sb	a1,8(a4)
 900:	00b703a3          	sb	a1,7(a4)
 904:	00b70323          	sb	a1,6(a4)
 908:	00b702a3          	sb	a1,5(a4)
 90c:	00b70223          	sb	a1,4(a4)
 910:	00b701a3          	sb	a1,3(a4)
 914:	00b70123          	sb	a1,2(a4)
 918:	00b700a3          	sb	a1,1(a4)
 91c:	00b70023          	sb	a1,0(a4)
 920:	00008067          	ret
 924:	0ff5f593          	zext.b	a1,a1
 928:	00859693          	sll	a3,a1,0x8
 92c:	00d5e5b3          	or	a1,a1,a3
 930:	01059693          	sll	a3,a1,0x10
 934:	00d5e5b3          	or	a1,a1,a3
 938:	f6dff06f          	j	8a4 <memset+0x18>
 93c:	00279693          	sll	a3,a5,0x2
 940:	00000297          	auipc	t0,0x0
 944:	005686b3          	add	a3,a3,t0
 948:	00008293          	mv	t0,ra
 94c:	fa0680e7          	jalr	-96(a3)
 950:	00028093          	mv	ra,t0
 954:	ff078793          	add	a5,a5,-16
 958:	40f70733          	sub	a4,a4,a5
 95c:	00f60633          	add	a2,a2,a5
 960:	f6c378e3          	bgeu	t1,a2,8d0 <memset+0x44>
 964:	f3dff06f          	j	8a0 <memset+0x14>

00000968 <memcpy>:
 968:	00a5c7b3          	xor	a5,a1,a0
 96c:	0037f793          	and	a5,a5,3
 970:	00c508b3          	add	a7,a0,a2
 974:	06079463          	bnez	a5,9dc <memcpy+0x74>
 978:	00300793          	li	a5,3
 97c:	06c7f063          	bgeu	a5,a2,9dc <memcpy+0x74>
 980:	00357793          	and	a5,a0,3
 984:	00050713          	mv	a4,a0
 988:	06079a63          	bnez	a5,9fc <memcpy+0x94>
 98c:	ffc8f613          	and	a2,a7,-4
 990:	40e606b3          	sub	a3,a2,a4
 994:	02000793          	li	a5,32
 998:	08d7ce63          	blt	a5,a3,a34 <memcpy+0xcc>
 99c:	00058693          	mv	a3,a1
 9a0:	00070793          	mv	a5,a4
 9a4:	02c77863          	bgeu	a4,a2,9d4 <memcpy+0x6c>
 9a8:	0006a803          	lw	a6,0(a3)
 9ac:	00478793          	add	a5,a5,4
 9b0:	00468693          	add	a3,a3,4
 9b4:	ff07ae23          	sw	a6,-4(a5)
 9b8:	fec7e8e3          	bltu	a5,a2,9a8 <memcpy+0x40>
 9bc:	fff60793          	add	a5,a2,-1
 9c0:	40e787b3          	sub	a5,a5,a4
 9c4:	ffc7f793          	and	a5,a5,-4
 9c8:	00478793          	add	a5,a5,4
 9cc:	00f70733          	add	a4,a4,a5
 9d0:	00f585b3          	add	a1,a1,a5
 9d4:	01176863          	bltu	a4,a7,9e4 <memcpy+0x7c>
 9d8:	00008067          	ret
 9dc:	00050713          	mv	a4,a0
 9e0:	05157863          	bgeu	a0,a7,a30 <memcpy+0xc8>
 9e4:	0005c783          	lbu	a5,0(a1)
 9e8:	00170713          	add	a4,a4,1
 9ec:	00158593          	add	a1,a1,1
 9f0:	fef70fa3          	sb	a5,-1(a4)
 9f4:	fee898e3          	bne	a7,a4,9e4 <memcpy+0x7c>
 9f8:	00008067          	ret
 9fc:	0005c683          	lbu	a3,0(a1)
 a00:	00170713          	add	a4,a4,1
 a04:	00377793          	and	a5,a4,3
 a08:	fed70fa3          	sb	a3,-1(a4)
 a0c:	00158593          	add	a1,a1,1
 a10:	f6078ee3          	beqz	a5,98c <memcpy+0x24>
 a14:	0005c683          	lbu	a3,0(a1)
 a18:	00170713          	add	a4,a4,1
 a1c:	00377793          	and	a5,a4,3
 a20:	fed70fa3          	sb	a3,-1(a4)
 a24:	00158593          	add	a1,a1,1
 a28:	fc079ae3          	bnez	a5,9fc <memcpy+0x94>
 a2c:	f61ff06f          	j	98c <memcpy+0x24>
 a30:	00008067          	ret
 a34:	ff010113          	add	sp,sp,-16
 a38:	00812623          	sw	s0,12(sp)
 a3c:	02000413          	li	s0,32
 a40:	0005a383          	lw	t2,0(a1)
 a44:	0045a283          	lw	t0,4(a1)
 a48:	0085af83          	lw	t6,8(a1)
 a4c:	00c5af03          	lw	t5,12(a1)
 a50:	0105ae83          	lw	t4,16(a1)
 a54:	0145ae03          	lw	t3,20(a1)
 a58:	0185a303          	lw	t1,24(a1)
 a5c:	01c5a803          	lw	a6,28(a1)
 a60:	0205a683          	lw	a3,32(a1)
 a64:	02470713          	add	a4,a4,36
 a68:	40e607b3          	sub	a5,a2,a4
 a6c:	fc772e23          	sw	t2,-36(a4)
 a70:	fe572023          	sw	t0,-32(a4)
 a74:	fff72223          	sw	t6,-28(a4)
 a78:	ffe72423          	sw	t5,-24(a4)
 a7c:	ffd72623          	sw	t4,-20(a4)
 a80:	ffc72823          	sw	t3,-16(a4)
 a84:	fe672a23          	sw	t1,-12(a4)
 a88:	ff072c23          	sw	a6,-8(a4)
 a8c:	fed72e23          	sw	a3,-4(a4)
 a90:	02458593          	add	a1,a1,36
 a94:	faf446e3          	blt	s0,a5,a40 <memcpy+0xd8>
 a98:	00058693          	mv	a3,a1
 a9c:	00070793          	mv	a5,a4
 aa0:	02c77863          	bgeu	a4,a2,ad0 <memcpy+0x168>
 aa4:	0006a803          	lw	a6,0(a3)
 aa8:	00478793          	add	a5,a5,4
 aac:	00468693          	add	a3,a3,4
 ab0:	ff07ae23          	sw	a6,-4(a5)
 ab4:	fec7e8e3          	bltu	a5,a2,aa4 <memcpy+0x13c>
 ab8:	fff60793          	add	a5,a2,-1
 abc:	40e787b3          	sub	a5,a5,a4
 ac0:	ffc7f793          	and	a5,a5,-4
 ac4:	00478793          	add	a5,a5,4
 ac8:	00f70733          	add	a4,a4,a5
 acc:	00f585b3          	add	a1,a1,a5
 ad0:	01176863          	bltu	a4,a7,ae0 <memcpy+0x178>
 ad4:	00c12403          	lw	s0,12(sp)
 ad8:	01010113          	add	sp,sp,16
 adc:	00008067          	ret
 ae0:	0005c783          	lbu	a5,0(a1)
 ae4:	00170713          	add	a4,a4,1
 ae8:	00158593          	add	a1,a1,1
 aec:	fef70fa3          	sb	a5,-1(a4)
 af0:	fee882e3          	beq	a7,a4,ad4 <memcpy+0x16c>
 af4:	0005c783          	lbu	a5,0(a1)
 af8:	00170713          	add	a4,a4,1
 afc:	00158593          	add	a1,a1,1
 b00:	fef70fa3          	sb	a5,-1(a4)
 b04:	fce89ee3          	bne	a7,a4,ae0 <memcpy+0x178>
 b08:	fcdff06f          	j	ad4 <memcpy+0x16c>

00000b0c <strlen>:
 b0c:	00357793          	and	a5,a0,3
 b10:	00050713          	mv	a4,a0
 b14:	04079c63          	bnez	a5,b6c <strlen+0x60>
 b18:	7f7f86b7          	lui	a3,0x7f7f8
 b1c:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 b20:	fff00593          	li	a1,-1
 b24:	00072603          	lw	a2,0(a4)
 b28:	00470713          	add	a4,a4,4
 b2c:	00d677b3          	and	a5,a2,a3
 b30:	00d787b3          	add	a5,a5,a3
 b34:	00c7e7b3          	or	a5,a5,a2
 b38:	00d7e7b3          	or	a5,a5,a3
 b3c:	feb784e3          	beq	a5,a1,b24 <strlen+0x18>
 b40:	ffc74683          	lbu	a3,-4(a4)
 b44:	40a707b3          	sub	a5,a4,a0
 b48:	04068463          	beqz	a3,b90 <strlen+0x84>
 b4c:	ffd74683          	lbu	a3,-3(a4)
 b50:	02068c63          	beqz	a3,b88 <strlen+0x7c>
 b54:	ffe74503          	lbu	a0,-2(a4)
 b58:	00a03533          	snez	a0,a0
 b5c:	00f50533          	add	a0,a0,a5
 b60:	ffe50513          	add	a0,a0,-2
 b64:	00008067          	ret
 b68:	fa0688e3          	beqz	a3,b18 <strlen+0xc>
 b6c:	00074783          	lbu	a5,0(a4)
 b70:	00170713          	add	a4,a4,1
 b74:	00377693          	and	a3,a4,3
 b78:	fe0798e3          	bnez	a5,b68 <strlen+0x5c>
 b7c:	40a70733          	sub	a4,a4,a0
 b80:	fff70513          	add	a0,a4,-1
 b84:	00008067          	ret
 b88:	ffd78513          	add	a0,a5,-3
 b8c:	00008067          	ret
 b90:	ffc78513          	add	a0,a5,-4
 b94:	00008067          	ret

00000b98 <__divsi3>:
 b98:	06054063          	bltz	a0,bf8 <__umodsi3+0x10>
 b9c:	0605c663          	bltz	a1,c08 <__umodsi3+0x20>

00000ba0 <__hidden___udivsi3>:
 ba0:	00058613          	mv	a2,a1
 ba4:	00050593          	mv	a1,a0
 ba8:	fff00513          	li	a0,-1
 bac:	02060c63          	beqz	a2,be4 <__hidden___udivsi3+0x44>
 bb0:	00100693          	li	a3,1
 bb4:	00b67a63          	bgeu	a2,a1,bc8 <__hidden___udivsi3+0x28>
 bb8:	00c05863          	blez	a2,bc8 <__hidden___udivsi3+0x28>
 bbc:	00161613          	sll	a2,a2,0x1
 bc0:	00169693          	sll	a3,a3,0x1
 bc4:	feb66ae3          	bltu	a2,a1,bb8 <__hidden___udivsi3+0x18>
 bc8:	00000513          	li	a0,0
 bcc:	00c5e663          	bltu	a1,a2,bd8 <__hidden___udivsi3+0x38>
 bd0:	40c585b3          	sub	a1,a1,a2
 bd4:	00d56533          	or	a0,a0,a3
 bd8:	0016d693          	srl	a3,a3,0x1
 bdc:	00165613          	srl	a2,a2,0x1
 be0:	fe0696e3          	bnez	a3,bcc <__hidden___udivsi3+0x2c>
 be4:	00008067          	ret

00000be8 <__umodsi3>:
 be8:	00008293          	mv	t0,ra
 bec:	fb5ff0ef          	jal	ba0 <__hidden___udivsi3>
 bf0:	00058513          	mv	a0,a1
 bf4:	00028067          	jr	t0 # 940 <memset+0xb4>
 bf8:	40a00533          	neg	a0,a0
 bfc:	00b04863          	bgtz	a1,c0c <__umodsi3+0x24>
 c00:	40b005b3          	neg	a1,a1
 c04:	f9dff06f          	j	ba0 <__hidden___udivsi3>
 c08:	40b005b3          	neg	a1,a1
 c0c:	00008293          	mv	t0,ra
 c10:	f91ff0ef          	jal	ba0 <__hidden___udivsi3>
 c14:	40a00533          	neg	a0,a0
 c18:	00028067          	jr	t0

00000c1c <__modsi3>:
 c1c:	00008293          	mv	t0,ra
 c20:	0005ca63          	bltz	a1,c34 <__modsi3+0x18>
 c24:	00054c63          	bltz	a0,c3c <__modsi3+0x20>
 c28:	f79ff0ef          	jal	ba0 <__hidden___udivsi3>
 c2c:	00058513          	mv	a0,a1
 c30:	00028067          	jr	t0
 c34:	40b005b3          	neg	a1,a1
 c38:	fe0558e3          	bgez	a0,c28 <__modsi3+0xc>
 c3c:	40a00533          	neg	a0,a0
 c40:	f61ff0ef          	jal	ba0 <__hidden___udivsi3>
 c44:	40b00533          	neg	a0,a1
 c48:	00028067          	jr	t0
