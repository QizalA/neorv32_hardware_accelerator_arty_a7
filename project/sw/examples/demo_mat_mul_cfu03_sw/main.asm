
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0x9c8>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	e0438393          	add	t2,t2,-508 # e38 <__crt0_copy_data_src_begin>
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
 110:	b7c40413          	add	s0,s0,-1156 # c88 <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	b7448493          	add	s1,s1,-1164 # c88 <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	1d460613          	add	a2,a2,468 # 304 <main>

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
 178:	b1440413          	add	s0,s0,-1260 # c88 <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	b0c48493          	add	s1,s1,-1268 # c88 <__fini_array_end>

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

000001e4 <matrix_multiply_sw>:
#include <neorv32.h>

// Multiply two 2x2 matrices in software
// Each matrix is stored as a 1D array of 4 elements: [a11, a12, a21, a22]
void matrix_multiply_sw(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 1e4:	fe010113          	add	sp,sp,-32
 1e8:	00112e23          	sw	ra,28(sp)
 1ec:	00812c23          	sw	s0,24(sp)
 1f0:	00912a23          	sw	s1,20(sp)
 1f4:	01212823          	sw	s2,16(sp)
 1f8:	01312623          	sw	s3,12(sp)
 1fc:	00050413          	mv	s0,a0
 200:	00058493          	mv	s1,a1
  C[0] = A[0]*B[0] + A[1]*B[2]; // c11 = a11*b11 + a12*b21
 204:	00054503          	lbu	a0,0(a0)
 208:	0005c583          	lbu	a1,0(a1)
void matrix_multiply_sw(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
 20c:	00060913          	mv	s2,a2
  C[0] = A[0]*B[0] + A[1]*B[2]; // c11 = a11*b11 + a12*b21
 210:	1a1000ef          	jal	bb0 <__mulsi3>
 214:	0024c583          	lbu	a1,2(s1)
 218:	00050993          	mv	s3,a0
 21c:	00144503          	lbu	a0,1(s0)
 220:	191000ef          	jal	bb0 <__mulsi3>
 224:	00a989b3          	add	s3,s3,a0
 228:	01390023          	sb	s3,0(s2)
  C[1] = A[0]*B[1] + A[1]*B[3]; // c12 = a11*b12 + a12*b22
 22c:	0014c583          	lbu	a1,1(s1)
 230:	00044503          	lbu	a0,0(s0)
 234:	17d000ef          	jal	bb0 <__mulsi3>
 238:	0034c583          	lbu	a1,3(s1)
 23c:	00050993          	mv	s3,a0
 240:	00144503          	lbu	a0,1(s0)
 244:	16d000ef          	jal	bb0 <__mulsi3>
 248:	00a989b3          	add	s3,s3,a0
 24c:	013900a3          	sb	s3,1(s2)
  C[2] = A[2]*B[0] + A[3]*B[2]; // c21 = a21*b11 + a22*b21
 250:	0004c583          	lbu	a1,0(s1)
 254:	00244503          	lbu	a0,2(s0)
 258:	159000ef          	jal	bb0 <__mulsi3>
 25c:	0024c583          	lbu	a1,2(s1)
 260:	00050993          	mv	s3,a0
 264:	00344503          	lbu	a0,3(s0)
 268:	149000ef          	jal	bb0 <__mulsi3>
 26c:	00a989b3          	add	s3,s3,a0
 270:	01390123          	sb	s3,2(s2)
  C[3] = A[2]*B[1] + A[3]*B[3]; // c22 = a21*b12 + a22*b22
 274:	0014c583          	lbu	a1,1(s1)
 278:	00244503          	lbu	a0,2(s0)
 27c:	135000ef          	jal	bb0 <__mulsi3>
 280:	0034c583          	lbu	a1,3(s1)
 284:	00050993          	mv	s3,a0
 288:	00344503          	lbu	a0,3(s0)
 28c:	125000ef          	jal	bb0 <__mulsi3>
 290:	00a989b3          	add	s3,s3,a0
 294:	013901a3          	sb	s3,3(s2)
}
 298:	01c12083          	lw	ra,28(sp)
 29c:	01812403          	lw	s0,24(sp)
 2a0:	01412483          	lw	s1,20(sp)
 2a4:	01012903          	lw	s2,16(sp)
 2a8:	00c12983          	lw	s3,12(sp)
 2ac:	02010113          	add	sp,sp,32
 2b0:	00008067          	ret

000002b4 <print_matrix>:

// Print a 2x2 matrix
void print_matrix(uint8_t M[4]) {
 2b4:	ff010113          	add	sp,sp,-16
 2b8:	00812423          	sw	s0,8(sp)
 2bc:	00912223          	sw	s1,4(sp)
 2c0:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", M[0], M[1]);
 2c4:	00154683          	lbu	a3,1(a0)
 2c8:	00054603          	lbu	a2,0(a0)
 2cc:	000014b7          	lui	s1,0x1
void print_matrix(uint8_t M[4]) {
 2d0:	00050413          	mv	s0,a0
  neorv32_uart0_printf("[%d %d]\n", M[0], M[1]);
 2d4:	c8848593          	add	a1,s1,-888 # c88 <__fini_array_end>
 2d8:	fff50537          	lui	a0,0xfff50
 2dc:	590000ef          	jal	86c <neorv32_uart_printf>
  neorv32_uart0_printf("[%d %d]\n", M[2], M[3]);
 2e0:	00344683          	lbu	a3,3(s0)
 2e4:	00244603          	lbu	a2,2(s0)
}
 2e8:	00812403          	lw	s0,8(sp)
 2ec:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", M[2], M[3]);
 2f0:	c8848593          	add	a1,s1,-888
}
 2f4:	00412483          	lw	s1,4(sp)
  neorv32_uart0_printf("[%d %d]\n", M[2], M[3]);
 2f8:	fff50537          	lui	a0,0xfff50
}
 2fc:	01010113          	add	sp,sp,16
  neorv32_uart0_printf("[%d %d]\n", M[2], M[3]);
 300:	56c0006f          	j	86c <neorv32_uart_printf>

00000304 <main>:

int main(void) {
  // Initialize UART
  neorv32_uart0_setup(19200, 0);
 304:	000055b7          	lui	a1,0x5
int main(void) {
 308:	fd010113          	add	sp,sp,-48
  neorv32_uart0_setup(19200, 0);
 30c:	00000613          	li	a2,0
 310:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 314:	fff50537          	lui	a0,0xfff50
int main(void) {
 318:	02112623          	sw	ra,44(sp)
 31c:	02812423          	sw	s0,40(sp)
 320:	02912223          	sw	s1,36(sp)
 324:	03212023          	sw	s2,32(sp)
 328:	01312e23          	sw	s3,28(sp)
  neorv32_uart0_setup(19200, 0);
 32c:	21c000ef          	jal	548 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) {
 330:	fff50537          	lui	a0,0xfff50
 334:	1d8000ef          	jal	50c <neorv32_uart_available>
 338:	00100793          	li	a5,1
 33c:	0c050663          	beqz	a0,408 <main+0x104>
    return 1;
  }

  neorv32_uart0_printf("\n--- Software 2x2 Matrix Multiplication ---\n");
 340:	000015b7          	lui	a1,0x1
 344:	c9458593          	add	a1,a1,-876 # c94 <__fini_array_end+0xc>
 348:	fff50537          	lui	a0,0xfff50
 34c:	520000ef          	jal	86c <neorv32_uart_printf>

  // Input matrices
  uint8_t A[4] = {1, 2, 3, 4}; // [1 2]
 350:	040307b7          	lui	a5,0x4030
 354:	20178793          	add	a5,a5,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
 358:	00f12223          	sw	a5,4(sp)
                               // [3 4]
  uint8_t B[4] = {5, 6, 7, 8}; // [5 6]
 35c:	080707b7          	lui	a5,0x8070
 360:	60578793          	add	a5,a5,1541 # 8070605 <__neorv32_ram_size+0x7ff0605>
 364:	00f12423          	sw	a5,8(sp)
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 368:	00000793          	li	a5,0
 36c:	c0079073          	csrw	cycle,a5
 370:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 374:	c0202973          	rdinstret	s2
 378:	c0002473          	rdcycle	s0

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Perform matrix multiplication in software
  matrix_multiply_sw(A, B, C);
 37c:	00c10613          	add	a2,sp,12
 380:	00810593          	add	a1,sp,8
 384:	00410513          	add	a0,sp,4
 388:	e5dff0ef          	jal	1e4 <matrix_multiply_sw>
 38c:	c02029f3          	rdinstret	s3
 390:	c00024f3          	rdcycle	s1

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(A);
 394:	000015b7          	lui	a1,0x1
 398:	cc458593          	add	a1,a1,-828 # cc4 <__fini_array_end+0x3c>
 39c:	fff50537          	lui	a0,0xfff50
 3a0:	4cc000ef          	jal	86c <neorv32_uart_printf>
 3a4:	00410513          	add	a0,sp,4
 3a8:	f0dff0ef          	jal	2b4 <print_matrix>
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(B);
 3ac:	000015b7          	lui	a1,0x1
 3b0:	cd058593          	add	a1,a1,-816 # cd0 <__fini_array_end+0x48>
 3b4:	fff50537          	lui	a0,0xfff50
 3b8:	4b4000ef          	jal	86c <neorv32_uart_printf>
 3bc:	00810513          	add	a0,sp,8
 3c0:	ef5ff0ef          	jal	2b4 <print_matrix>
  neorv32_uart0_printf("Result (A * B):\n"); print_matrix(C);
 3c4:	000015b7          	lui	a1,0x1
 3c8:	cdc58593          	add	a1,a1,-804 # cdc <__fini_array_end+0x54>
 3cc:	fff50537          	lui	a0,0xfff50
 3d0:	49c000ef          	jal	86c <neorv32_uart_printf>
 3d4:	00c10513          	add	a0,sp,12
 3d8:	eddff0ef          	jal	2b4 <print_matrix>

  neorv32_uart0_printf("Instructions (SW): %u\n", (uint32_t)(end_instr - start_instr));
 3dc:	000015b7          	lui	a1,0x1
 3e0:	41298633          	sub	a2,s3,s2
 3e4:	cf058593          	add	a1,a1,-784 # cf0 <__fini_array_end+0x68>
 3e8:	fff50537          	lui	a0,0xfff50
 3ec:	480000ef          	jal	86c <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (SW): %u\n", (uint32_t)(end_cycle - start_cycle));
 3f0:	000015b7          	lui	a1,0x1
 3f4:	40848633          	sub	a2,s1,s0
 3f8:	d0858593          	add	a1,a1,-760 # d08 <__fini_array_end+0x80>
 3fc:	fff50537          	lui	a0,0xfff50
 400:	46c000ef          	jal	86c <neorv32_uart_printf>

  return 0;
 404:	00000793          	li	a5,0
}
 408:	02c12083          	lw	ra,44(sp)
 40c:	02812403          	lw	s0,40(sp)
 410:	02412483          	lw	s1,36(sp)
 414:	02012903          	lw	s2,32(sp)
 418:	01c12983          	lw	s3,28(sp)
 41c:	00078513          	mv	a0,a5
 420:	03010113          	add	sp,sp,48
 424:	00008067          	ret

00000428 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 428:	fa010113          	add	sp,sp,-96
 42c:	04912a23          	sw	s1,84(sp)
 430:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 434:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 438:	04812c23          	sw	s0,88(sp)
 43c:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 440:	d2058593          	add	a1,a1,-736 # d20 <__fini_array_end+0x98>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 444:	00060913          	mv	s2,a2
 448:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 44c:	01000613          	li	a2,16
 450:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 454:	04112e23          	sw	ra,92(sp)
 458:	05312623          	sw	s3,76(sp)
 45c:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 460:	520000ef          	jal	980 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 464:	02400613          	li	a2,36
 468:	00000593          	li	a1,0
 46c:	01c10513          	add	a0,sp,28
 470:	434000ef          	jal	8a4 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 474:	ffe90713          	add	a4,s2,-2
 478:	00e00793          	li	a5,14
 47c:	03f10993          	add	s3,sp,63
 480:	02e7f463          	bgeu	a5,a4,4a8 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 484:	00040023          	sb	zero,0(s0)
}
 488:	05c12083          	lw	ra,92(sp)
 48c:	05812403          	lw	s0,88(sp)
 490:	05412483          	lw	s1,84(sp)
 494:	05012903          	lw	s2,80(sp)
 498:	04c12983          	lw	s3,76(sp)
 49c:	04812a03          	lw	s4,72(sp)
 4a0:	06010113          	add	sp,sp,96
 4a4:	00008067          	ret
    *tmp_ptr = digits[num%base];
 4a8:	00090593          	mv	a1,s2
 4ac:	00048513          	mv	a0,s1
 4b0:	774000ef          	jal	c24 <__umodsi3>
 4b4:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 4b8:	00278533          	add	a0,a5,sp
 4bc:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 4c0:	00090593          	mv	a1,s2
 4c4:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 4c8:	fef98fa3          	sb	a5,-1(s3)
 4cc:	00048a13          	mv	s4,s1
    num /= base;
 4d0:	70c000ef          	jal	bdc <__hidden___udivsi3>
    tmp_ptr--;
 4d4:	fff98993          	add	s3,s3,-1
    num /= base;
 4d8:	00050493          	mv	s1,a0
  } while (num != 0);
 4dc:	fd2a76e3          	bgeu	s4,s2,4a8 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 4e0:	00000793          	li	a5,0
 4e4:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 4e8:	01c10713          	add	a4,sp,28
 4ec:	00f70733          	add	a4,a4,a5
 4f0:	00074703          	lbu	a4,0(a4)
 4f4:	00070663          	beqz	a4,500 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 4f8:	00e40023          	sb	a4,0(s0)
      buffer++;
 4fc:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 500:	00178793          	add	a5,a5,1
 504:	fed792e3          	bne	a5,a3,4e8 <neorv32_aux_itoa+0xc0>
 508:	f7dff06f          	j	484 <neorv32_aux_itoa+0x5c>

0000050c <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 50c:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 510:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 514:	00e51c63          	bne	a0,a4,52c <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 518:	fffe07b7          	lui	a5,0xfffe0
 51c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 520:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 524:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 528:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 52c:	fff60737          	lui	a4,0xfff60
    return 0;
 530:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 534:	fee79ae3          	bne	a5,a4,528 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 538:	fffe07b7          	lui	a5,0xfffe0
 53c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 540:	020007b7          	lui	a5,0x2000
 544:	fe1ff06f          	j	524 <neorv32_uart_available+0x18>

00000548 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 548:	ff010113          	add	sp,sp,-16
 54c:	00812423          	sw	s0,8(sp)
 550:	00912223          	sw	s1,4(sp)
 554:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 558:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 55c:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 560:	00050493          	mv	s1,a0
 564:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 568:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 56c:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 570:	66c000ef          	jal	bdc <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 574:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 578:	3fe00693          	li	a3,1022
 57c:	04a6e663          	bltu	a3,a0,5c8 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 580:	fff50793          	add	a5,a0,-1
 584:	000106b7          	lui	a3,0x10
 588:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 58c:	00679793          	sll	a5,a5,0x6
 590:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 594:	07c006b7          	lui	a3,0x7c00
 598:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 59c:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 5a0:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 5a4:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 5a8:	00c12083          	lw	ra,12(sp)
 5ac:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 5b0:	00e7e7b3          	or	a5,a5,a4
 5b4:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 5b8:	00f4a023          	sw	a5,0(s1)
}
 5bc:	00412483          	lw	s1,4(sp)
 5c0:	01010113          	add	sp,sp,16
 5c4:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 5c8:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 5cc:	ffd7f793          	and	a5,a5,-3
 5d0:	00079863          	bnez	a5,5e0 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 5d4:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 5d8:	00170713          	add	a4,a4,1
 5dc:	fa1ff06f          	j	57c <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 5e0:	00155513          	srl	a0,a0,0x1
 5e4:	ff5ff06f          	j	5d8 <neorv32_uart_setup+0x90>

000005e8 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 5e8:	00052783          	lw	a5,0(a0)
 5ec:	00a79713          	sll	a4,a5,0xa
 5f0:	fe075ce3          	bgez	a4,5e8 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 5f4:	00b52223          	sw	a1,4(a0)
}
 5f8:	00008067          	ret

000005fc <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 5fc:	fe010113          	add	sp,sp,-32
 600:	00812c23          	sw	s0,24(sp)
 604:	00912a23          	sw	s1,20(sp)
 608:	01312623          	sw	s3,12(sp)
 60c:	00112e23          	sw	ra,28(sp)
 610:	01212823          	sw	s2,16(sp)
 614:	00050493          	mv	s1,a0
 618:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 61c:	00a00993          	li	s3,10
  while ((c = *s++)) {
 620:	00044903          	lbu	s2,0(s0)
 624:	00140413          	add	s0,s0,1
 628:	02091063          	bnez	s2,648 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 62c:	01c12083          	lw	ra,28(sp)
 630:	01812403          	lw	s0,24(sp)
 634:	01412483          	lw	s1,20(sp)
 638:	01012903          	lw	s2,16(sp)
 63c:	00c12983          	lw	s3,12(sp)
 640:	02010113          	add	sp,sp,32
 644:	00008067          	ret
    if (c == '\n') {
 648:	01391863          	bne	s2,s3,658 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 64c:	00d00593          	li	a1,13
 650:	00048513          	mv	a0,s1
 654:	f95ff0ef          	jal	5e8 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 658:	00090593          	mv	a1,s2
 65c:	00048513          	mv	a0,s1
 660:	f89ff0ef          	jal	5e8 <neorv32_uart_putc>
 664:	fbdff06f          	j	620 <neorv32_uart_puts+0x24>

00000668 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 668:	f9010113          	add	sp,sp,-112
 66c:	06812423          	sw	s0,104(sp)
 670:	06912223          	sw	s1,100(sp)
 674:	07212023          	sw	s2,96(sp)
 678:	05312e23          	sw	s3,92(sp)
 67c:	00050493          	mv	s1,a0
 680:	00058913          	mv	s2,a1
 684:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 688:	00000593          	li	a1,0
 68c:	02400613          	li	a2,36
 690:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 694:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 698:	05412c23          	sw	s4,88(sp)
 69c:	05512a23          	sw	s5,84(sp)
 6a0:	05712623          	sw	s7,76(sp)
 6a4:	05812423          	sw	s8,72(sp)
 6a8:	05912223          	sw	s9,68(sp)
 6ac:	05a12023          	sw	s10,64(sp)
 6b0:	06112623          	sw	ra,108(sp)
 6b4:	05612823          	sw	s6,80(sp)
 6b8:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 6bc:	02500b93          	li	s7,37
    string_buf[i] = 0;
 6c0:	1e4000ef          	jal	8a4 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 6c4:	00a00c13          	li	s8,10
      c = tolower(*format++);
 6c8:	d3598993          	add	s3,s3,-715 # d35 <_ctype_+0x1>
 6cc:	00100c93          	li	s9,1
      switch (c) {
 6d0:	07000a13          	li	s4,112
 6d4:	07500d13          	li	s10,117
 6d8:	06300a93          	li	s5,99
  while ((c = *format++)) {
 6dc:	00094d83          	lbu	s11,0(s2)
 6e0:	040d9063          	bnez	s11,720 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 6e4:	06c12083          	lw	ra,108(sp)
 6e8:	06812403          	lw	s0,104(sp)
 6ec:	06412483          	lw	s1,100(sp)
 6f0:	06012903          	lw	s2,96(sp)
 6f4:	05c12983          	lw	s3,92(sp)
 6f8:	05812a03          	lw	s4,88(sp)
 6fc:	05412a83          	lw	s5,84(sp)
 700:	05012b03          	lw	s6,80(sp)
 704:	04c12b83          	lw	s7,76(sp)
 708:	04812c03          	lw	s8,72(sp)
 70c:	04412c83          	lw	s9,68(sp)
 710:	04012d03          	lw	s10,64(sp)
 714:	03c12d83          	lw	s11,60(sp)
 718:	07010113          	add	sp,sp,112
 71c:	00008067          	ret
    if (c == '%') {
 720:	137d9863          	bne	s11,s7,850 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 724:	00290b13          	add	s6,s2,2
 728:	00194903          	lbu	s2,1(s2)
 72c:	013907b3          	add	a5,s2,s3
 730:	0007c783          	lbu	a5,0(a5)
 734:	0037f793          	and	a5,a5,3
 738:	01979463          	bne	a5,s9,740 <neorv32_uart_vprintf+0xd8>
 73c:	02090913          	add	s2,s2,32
      switch (c) {
 740:	0ff97793          	zext.b	a5,s2
 744:	0d478863          	beq	a5,s4,814 <neorv32_uart_vprintf+0x1ac>
 748:	06fa4c63          	blt	s4,a5,7c0 <neorv32_uart_vprintf+0x158>
 74c:	09578e63          	beq	a5,s5,7e8 <neorv32_uart_vprintf+0x180>
 750:	02fac663          	blt	s5,a5,77c <neorv32_uart_vprintf+0x114>
 754:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 758:	02500593          	li	a1,37
      switch (c) {
 75c:	00e78a63          	beq	a5,a4,770 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 760:	02500593          	li	a1,37
 764:	00048513          	mv	a0,s1
 768:	e81ff0ef          	jal	5e8 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 76c:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 770:	00048513          	mv	a0,s1
 774:	e75ff0ef          	jal	5e8 <neorv32_uart_putc>
 778:	0840006f          	j	7fc <neorv32_uart_vprintf+0x194>
      switch (c) {
 77c:	06400713          	li	a4,100
 780:	00e78663          	beq	a5,a4,78c <neorv32_uart_vprintf+0x124>
 784:	06900713          	li	a4,105
 788:	fce79ce3          	bne	a5,a4,760 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 78c:	00440913          	add	s2,s0,4
 790:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 794:	00045a63          	bgez	s0,7a8 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 798:	02d00593          	li	a1,45
 79c:	00048513          	mv	a0,s1
            n = -n;
 7a0:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 7a4:	e45ff0ef          	jal	5e8 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 7a8:	00a00613          	li	a2,10
 7ac:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 7b0:	00c10513          	add	a0,sp,12
 7b4:	c75ff0ef          	jal	428 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 7b8:	00c10593          	add	a1,sp,12
 7bc:	0200006f          	j	7dc <neorv32_uart_vprintf+0x174>
      switch (c) {
 7c0:	05a78263          	beq	a5,s10,804 <neorv32_uart_vprintf+0x19c>
 7c4:	07800713          	li	a4,120
 7c8:	04e78663          	beq	a5,a4,814 <neorv32_uart_vprintf+0x1ac>
 7cc:	07300713          	li	a4,115
 7d0:	f8e798e3          	bne	a5,a4,760 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 7d4:	00042583          	lw	a1,0(s0)
 7d8:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 7dc:	00048513          	mv	a0,s1
 7e0:	e1dff0ef          	jal	5fc <neorv32_uart_puts>
          break;
 7e4:	0140006f          	j	7f8 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 7e8:	00044583          	lbu	a1,0(s0)
 7ec:	00048513          	mv	a0,s1
 7f0:	00440913          	add	s2,s0,4
 7f4:	df5ff0ef          	jal	5e8 <neorv32_uart_putc>
 7f8:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 7fc:	000b0913          	mv	s2,s6
 800:	eddff06f          	j	6dc <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 804:	00042583          	lw	a1,0(s0)
 808:	00440913          	add	s2,s0,4
 80c:	00a00613          	li	a2,10
 810:	fa1ff06f          	j	7b0 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 814:	00042583          	lw	a1,0(s0)
 818:	01000613          	li	a2,16
 81c:	00c10513          	add	a0,sp,12
 820:	c09ff0ef          	jal	428 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 824:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 828:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 82c:	2f8000ef          	jal	b24 <strlen>
 830:	00800413          	li	s0,8
 834:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 838:	f80400e3          	beqz	s0,7b8 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 83c:	03000593          	li	a1,48
 840:	00048513          	mv	a0,s1
 844:	da5ff0ef          	jal	5e8 <neorv32_uart_putc>
 848:	fff40413          	add	s0,s0,-1
 84c:	fedff06f          	j	838 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 850:	018d9863          	bne	s11,s8,860 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 854:	00d00593          	li	a1,13
 858:	00048513          	mv	a0,s1
 85c:	d8dff0ef          	jal	5e8 <neorv32_uart_putc>
  while ((c = *format++)) {
 860:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 864:	000d8593          	mv	a1,s11
 868:	f09ff06f          	j	770 <neorv32_uart_vprintf+0x108>

0000086c <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 86c:	fc010113          	add	sp,sp,-64
 870:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 874:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 878:	00112e23          	sw	ra,28(sp)
 87c:	02d12623          	sw	a3,44(sp)
 880:	02e12823          	sw	a4,48(sp)
 884:	02f12a23          	sw	a5,52(sp)
 888:	03012c23          	sw	a6,56(sp)
 88c:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 890:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 894:	dd5ff0ef          	jal	668 <neorv32_uart_vprintf>
  va_end(args);
}
 898:	01c12083          	lw	ra,28(sp)
 89c:	04010113          	add	sp,sp,64
 8a0:	00008067          	ret

000008a4 <memset>:
 8a4:	00f00313          	li	t1,15
 8a8:	00050713          	mv	a4,a0
 8ac:	02c37e63          	bgeu	t1,a2,8e8 <memset+0x44>
 8b0:	00f77793          	and	a5,a4,15
 8b4:	0a079063          	bnez	a5,954 <memset+0xb0>
 8b8:	08059263          	bnez	a1,93c <memset+0x98>
 8bc:	ff067693          	and	a3,a2,-16
 8c0:	00f67613          	and	a2,a2,15
 8c4:	00e686b3          	add	a3,a3,a4
 8c8:	00b72023          	sw	a1,0(a4)
 8cc:	00b72223          	sw	a1,4(a4)
 8d0:	00b72423          	sw	a1,8(a4)
 8d4:	00b72623          	sw	a1,12(a4)
 8d8:	01070713          	add	a4,a4,16
 8dc:	fed766e3          	bltu	a4,a3,8c8 <memset+0x24>
 8e0:	00061463          	bnez	a2,8e8 <memset+0x44>
 8e4:	00008067          	ret
 8e8:	40c306b3          	sub	a3,t1,a2
 8ec:	00269693          	sll	a3,a3,0x2
 8f0:	00000297          	auipc	t0,0x0
 8f4:	005686b3          	add	a3,a3,t0
 8f8:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 8fc:	00b70723          	sb	a1,14(a4)
 900:	00b706a3          	sb	a1,13(a4)
 904:	00b70623          	sb	a1,12(a4)
 908:	00b705a3          	sb	a1,11(a4)
 90c:	00b70523          	sb	a1,10(a4)
 910:	00b704a3          	sb	a1,9(a4)
 914:	00b70423          	sb	a1,8(a4)
 918:	00b703a3          	sb	a1,7(a4)
 91c:	00b70323          	sb	a1,6(a4)
 920:	00b702a3          	sb	a1,5(a4)
 924:	00b70223          	sb	a1,4(a4)
 928:	00b701a3          	sb	a1,3(a4)
 92c:	00b70123          	sb	a1,2(a4)
 930:	00b700a3          	sb	a1,1(a4)
 934:	00b70023          	sb	a1,0(a4)
 938:	00008067          	ret
 93c:	0ff5f593          	zext.b	a1,a1
 940:	00859693          	sll	a3,a1,0x8
 944:	00d5e5b3          	or	a1,a1,a3
 948:	01059693          	sll	a3,a1,0x10
 94c:	00d5e5b3          	or	a1,a1,a3
 950:	f6dff06f          	j	8bc <memset+0x18>
 954:	00279693          	sll	a3,a5,0x2
 958:	00000297          	auipc	t0,0x0
 95c:	005686b3          	add	a3,a3,t0
 960:	00008293          	mv	t0,ra
 964:	fa0680e7          	jalr	-96(a3)
 968:	00028093          	mv	ra,t0
 96c:	ff078793          	add	a5,a5,-16
 970:	40f70733          	sub	a4,a4,a5
 974:	00f60633          	add	a2,a2,a5
 978:	f6c378e3          	bgeu	t1,a2,8e8 <memset+0x44>
 97c:	f3dff06f          	j	8b8 <memset+0x14>

00000980 <memcpy>:
 980:	00a5c7b3          	xor	a5,a1,a0
 984:	0037f793          	and	a5,a5,3
 988:	00c508b3          	add	a7,a0,a2
 98c:	06079463          	bnez	a5,9f4 <memcpy+0x74>
 990:	00300793          	li	a5,3
 994:	06c7f063          	bgeu	a5,a2,9f4 <memcpy+0x74>
 998:	00357793          	and	a5,a0,3
 99c:	00050713          	mv	a4,a0
 9a0:	06079a63          	bnez	a5,a14 <memcpy+0x94>
 9a4:	ffc8f613          	and	a2,a7,-4
 9a8:	40e606b3          	sub	a3,a2,a4
 9ac:	02000793          	li	a5,32
 9b0:	08d7ce63          	blt	a5,a3,a4c <memcpy+0xcc>
 9b4:	00058693          	mv	a3,a1
 9b8:	00070793          	mv	a5,a4
 9bc:	02c77863          	bgeu	a4,a2,9ec <memcpy+0x6c>
 9c0:	0006a803          	lw	a6,0(a3)
 9c4:	00478793          	add	a5,a5,4
 9c8:	00468693          	add	a3,a3,4
 9cc:	ff07ae23          	sw	a6,-4(a5)
 9d0:	fec7e8e3          	bltu	a5,a2,9c0 <memcpy+0x40>
 9d4:	fff60793          	add	a5,a2,-1
 9d8:	40e787b3          	sub	a5,a5,a4
 9dc:	ffc7f793          	and	a5,a5,-4
 9e0:	00478793          	add	a5,a5,4
 9e4:	00f70733          	add	a4,a4,a5
 9e8:	00f585b3          	add	a1,a1,a5
 9ec:	01176863          	bltu	a4,a7,9fc <memcpy+0x7c>
 9f0:	00008067          	ret
 9f4:	00050713          	mv	a4,a0
 9f8:	05157863          	bgeu	a0,a7,a48 <memcpy+0xc8>
 9fc:	0005c783          	lbu	a5,0(a1)
 a00:	00170713          	add	a4,a4,1
 a04:	00158593          	add	a1,a1,1
 a08:	fef70fa3          	sb	a5,-1(a4)
 a0c:	fee898e3          	bne	a7,a4,9fc <memcpy+0x7c>
 a10:	00008067          	ret
 a14:	0005c683          	lbu	a3,0(a1)
 a18:	00170713          	add	a4,a4,1
 a1c:	00377793          	and	a5,a4,3
 a20:	fed70fa3          	sb	a3,-1(a4)
 a24:	00158593          	add	a1,a1,1
 a28:	f6078ee3          	beqz	a5,9a4 <memcpy+0x24>
 a2c:	0005c683          	lbu	a3,0(a1)
 a30:	00170713          	add	a4,a4,1
 a34:	00377793          	and	a5,a4,3
 a38:	fed70fa3          	sb	a3,-1(a4)
 a3c:	00158593          	add	a1,a1,1
 a40:	fc079ae3          	bnez	a5,a14 <memcpy+0x94>
 a44:	f61ff06f          	j	9a4 <memcpy+0x24>
 a48:	00008067          	ret
 a4c:	ff010113          	add	sp,sp,-16
 a50:	00812623          	sw	s0,12(sp)
 a54:	02000413          	li	s0,32
 a58:	0005a383          	lw	t2,0(a1)
 a5c:	0045a283          	lw	t0,4(a1)
 a60:	0085af83          	lw	t6,8(a1)
 a64:	00c5af03          	lw	t5,12(a1)
 a68:	0105ae83          	lw	t4,16(a1)
 a6c:	0145ae03          	lw	t3,20(a1)
 a70:	0185a303          	lw	t1,24(a1)
 a74:	01c5a803          	lw	a6,28(a1)
 a78:	0205a683          	lw	a3,32(a1)
 a7c:	02470713          	add	a4,a4,36
 a80:	40e607b3          	sub	a5,a2,a4
 a84:	fc772e23          	sw	t2,-36(a4)
 a88:	fe572023          	sw	t0,-32(a4)
 a8c:	fff72223          	sw	t6,-28(a4)
 a90:	ffe72423          	sw	t5,-24(a4)
 a94:	ffd72623          	sw	t4,-20(a4)
 a98:	ffc72823          	sw	t3,-16(a4)
 a9c:	fe672a23          	sw	t1,-12(a4)
 aa0:	ff072c23          	sw	a6,-8(a4)
 aa4:	fed72e23          	sw	a3,-4(a4)
 aa8:	02458593          	add	a1,a1,36
 aac:	faf446e3          	blt	s0,a5,a58 <memcpy+0xd8>
 ab0:	00058693          	mv	a3,a1
 ab4:	00070793          	mv	a5,a4
 ab8:	02c77863          	bgeu	a4,a2,ae8 <memcpy+0x168>
 abc:	0006a803          	lw	a6,0(a3)
 ac0:	00478793          	add	a5,a5,4
 ac4:	00468693          	add	a3,a3,4
 ac8:	ff07ae23          	sw	a6,-4(a5)
 acc:	fec7e8e3          	bltu	a5,a2,abc <memcpy+0x13c>
 ad0:	fff60793          	add	a5,a2,-1
 ad4:	40e787b3          	sub	a5,a5,a4
 ad8:	ffc7f793          	and	a5,a5,-4
 adc:	00478793          	add	a5,a5,4
 ae0:	00f70733          	add	a4,a4,a5
 ae4:	00f585b3          	add	a1,a1,a5
 ae8:	01176863          	bltu	a4,a7,af8 <memcpy+0x178>
 aec:	00c12403          	lw	s0,12(sp)
 af0:	01010113          	add	sp,sp,16
 af4:	00008067          	ret
 af8:	0005c783          	lbu	a5,0(a1)
 afc:	00170713          	add	a4,a4,1
 b00:	00158593          	add	a1,a1,1
 b04:	fef70fa3          	sb	a5,-1(a4)
 b08:	fee882e3          	beq	a7,a4,aec <memcpy+0x16c>
 b0c:	0005c783          	lbu	a5,0(a1)
 b10:	00170713          	add	a4,a4,1
 b14:	00158593          	add	a1,a1,1
 b18:	fef70fa3          	sb	a5,-1(a4)
 b1c:	fce89ee3          	bne	a7,a4,af8 <memcpy+0x178>
 b20:	fcdff06f          	j	aec <memcpy+0x16c>

00000b24 <strlen>:
 b24:	00357793          	and	a5,a0,3
 b28:	00050713          	mv	a4,a0
 b2c:	04079c63          	bnez	a5,b84 <strlen+0x60>
 b30:	7f7f86b7          	lui	a3,0x7f7f8
 b34:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 b38:	fff00593          	li	a1,-1
 b3c:	00072603          	lw	a2,0(a4)
 b40:	00470713          	add	a4,a4,4
 b44:	00d677b3          	and	a5,a2,a3
 b48:	00d787b3          	add	a5,a5,a3
 b4c:	00c7e7b3          	or	a5,a5,a2
 b50:	00d7e7b3          	or	a5,a5,a3
 b54:	feb784e3          	beq	a5,a1,b3c <strlen+0x18>
 b58:	ffc74683          	lbu	a3,-4(a4)
 b5c:	40a707b3          	sub	a5,a4,a0
 b60:	04068463          	beqz	a3,ba8 <strlen+0x84>
 b64:	ffd74683          	lbu	a3,-3(a4)
 b68:	02068c63          	beqz	a3,ba0 <strlen+0x7c>
 b6c:	ffe74503          	lbu	a0,-2(a4)
 b70:	00a03533          	snez	a0,a0
 b74:	00f50533          	add	a0,a0,a5
 b78:	ffe50513          	add	a0,a0,-2
 b7c:	00008067          	ret
 b80:	fa0688e3          	beqz	a3,b30 <strlen+0xc>
 b84:	00074783          	lbu	a5,0(a4)
 b88:	00170713          	add	a4,a4,1
 b8c:	00377693          	and	a3,a4,3
 b90:	fe0798e3          	bnez	a5,b80 <strlen+0x5c>
 b94:	40a70733          	sub	a4,a4,a0
 b98:	fff70513          	add	a0,a4,-1
 b9c:	00008067          	ret
 ba0:	ffd78513          	add	a0,a5,-3
 ba4:	00008067          	ret
 ba8:	ffc78513          	add	a0,a5,-4
 bac:	00008067          	ret

00000bb0 <__mulsi3>:
 bb0:	00050613          	mv	a2,a0
 bb4:	00000513          	li	a0,0
 bb8:	0015f693          	and	a3,a1,1
 bbc:	00068463          	beqz	a3,bc4 <__mulsi3+0x14>
 bc0:	00c50533          	add	a0,a0,a2
 bc4:	0015d593          	srl	a1,a1,0x1
 bc8:	00161613          	sll	a2,a2,0x1
 bcc:	fe0596e3          	bnez	a1,bb8 <__mulsi3+0x8>
 bd0:	00008067          	ret

00000bd4 <__divsi3>:
 bd4:	06054063          	bltz	a0,c34 <__umodsi3+0x10>
 bd8:	0605c663          	bltz	a1,c44 <__umodsi3+0x20>

00000bdc <__hidden___udivsi3>:
 bdc:	00058613          	mv	a2,a1
 be0:	00050593          	mv	a1,a0
 be4:	fff00513          	li	a0,-1
 be8:	02060c63          	beqz	a2,c20 <__hidden___udivsi3+0x44>
 bec:	00100693          	li	a3,1
 bf0:	00b67a63          	bgeu	a2,a1,c04 <__hidden___udivsi3+0x28>
 bf4:	00c05863          	blez	a2,c04 <__hidden___udivsi3+0x28>
 bf8:	00161613          	sll	a2,a2,0x1
 bfc:	00169693          	sll	a3,a3,0x1
 c00:	feb66ae3          	bltu	a2,a1,bf4 <__hidden___udivsi3+0x18>
 c04:	00000513          	li	a0,0
 c08:	00c5e663          	bltu	a1,a2,c14 <__hidden___udivsi3+0x38>
 c0c:	40c585b3          	sub	a1,a1,a2
 c10:	00d56533          	or	a0,a0,a3
 c14:	0016d693          	srl	a3,a3,0x1
 c18:	00165613          	srl	a2,a2,0x1
 c1c:	fe0696e3          	bnez	a3,c08 <__hidden___udivsi3+0x2c>
 c20:	00008067          	ret

00000c24 <__umodsi3>:
 c24:	00008293          	mv	t0,ra
 c28:	fb5ff0ef          	jal	bdc <__hidden___udivsi3>
 c2c:	00058513          	mv	a0,a1
 c30:	00028067          	jr	t0 # 958 <memset+0xb4>
 c34:	40a00533          	neg	a0,a0
 c38:	00b04863          	bgtz	a1,c48 <__umodsi3+0x24>
 c3c:	40b005b3          	neg	a1,a1
 c40:	f9dff06f          	j	bdc <__hidden___udivsi3>
 c44:	40b005b3          	neg	a1,a1
 c48:	00008293          	mv	t0,ra
 c4c:	f91ff0ef          	jal	bdc <__hidden___udivsi3>
 c50:	40a00533          	neg	a0,a0
 c54:	00028067          	jr	t0

00000c58 <__modsi3>:
 c58:	00008293          	mv	t0,ra
 c5c:	0005ca63          	bltz	a1,c70 <__modsi3+0x18>
 c60:	00054c63          	bltz	a0,c78 <__modsi3+0x20>
 c64:	f79ff0ef          	jal	bdc <__hidden___udivsi3>
 c68:	00058513          	mv	a0,a1
 c6c:	00028067          	jr	t0
 c70:	40b005b3          	neg	a1,a1
 c74:	fe0558e3          	bgez	a0,c64 <__modsi3+0xc>
 c78:	40a00533          	neg	a0,a0
 c7c:	f61ff0ef          	jal	bdc <__hidden___udivsi3>
 c80:	40b00533          	neg	a0,a1
 c84:	00028067          	jr	t0
