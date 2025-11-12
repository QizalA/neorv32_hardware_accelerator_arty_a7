
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0xa84>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	d4838393          	add	t2,t2,-696 # d7c <__crt0_copy_data_src_begin>
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
 110:	a8840413          	add	s0,s0,-1400 # b94 <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	a8048493          	add	s1,s1,-1408 # b94 <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	10c60613          	add	a2,a2,268 # 23c <main>

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
 178:	a2040413          	add	s0,s0,-1504 # b94 <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	a1848493          	add	s1,s1,-1512 # b94 <__fini_array_end>

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

// Unpack and print a 2x2 matrix from a packed 32-bit value
void print_matrix(uint32_t packed) {
 1e4:	ff010113          	add	sp,sp,-16
 1e8:	00912223          	sw	s1,4(sp)
  uint8_t m11 = (packed >> 24) & 0xFF;
  uint8_t m12 = (packed >> 16) & 0xFF;
 1ec:	01055693          	srl	a3,a0,0x10
  uint8_t m21 = (packed >> 8)  & 0xFF;
  uint8_t m22 = (packed >> 0)  & 0xFF;

  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 1f0:	000014b7          	lui	s1,0x1
void print_matrix(uint32_t packed) {
 1f4:	00812423          	sw	s0,8(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 1f8:	01855613          	srl	a2,a0,0x18
void print_matrix(uint32_t packed) {
 1fc:	00050413          	mv	s0,a0
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 200:	b9448593          	add	a1,s1,-1132 # b94 <__fini_array_end>
 204:	0ff6f693          	zext.b	a3,a3
 208:	fff50537          	lui	a0,0xfff50
void print_matrix(uint32_t packed) {
 20c:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 210:	58c000ef          	jal	79c <neorv32_uart_printf>
  uint8_t m21 = (packed >> 8)  & 0xFF;
 214:	00845613          	srl	a2,s0,0x8
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 218:	0ff47693          	zext.b	a3,s0
}
 21c:	00812403          	lw	s0,8(sp)
 220:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 224:	b9448593          	add	a1,s1,-1132
}
 228:	00412483          	lw	s1,4(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 22c:	0ff67613          	zext.b	a2,a2
 230:	fff50537          	lui	a0,0xfff50
}
 234:	01010113          	add	sp,sp,16
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 238:	5640006f          	j	79c <neorv32_uart_printf>

0000023c <main>:

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 23c:	000055b7          	lui	a1,0x5
int main(void) {
 240:	fe010113          	add	sp,sp,-32
  neorv32_uart0_setup(19200, 0);
 244:	00000613          	li	a2,0
 248:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 24c:	fff50537          	lui	a0,0xfff50
int main(void) {
 250:	00112e23          	sw	ra,28(sp)
 254:	00812c23          	sw	s0,24(sp)
 258:	00912a23          	sw	s1,20(sp)
 25c:	01212823          	sw	s2,16(sp)
 260:	01312623          	sw	s3,12(sp)
 264:	01412423          	sw	s4,8(sp)
 268:	01512223          	sw	s5,4(sp)
  neorv32_uart0_setup(19200, 0);
 26c:	20c000ef          	jal	478 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 270:	fff50537          	lui	a0,0xfff50
 274:	1c8000ef          	jal	43c <neorv32_uart_available>
 278:	00100793          	li	a5,1
 27c:	0a050a63          	beqz	a0,330 <main+0xf4>

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication (First Row and Column) ---\n");
 280:	000015b7          	lui	a1,0x1
 284:	ba058593          	add	a1,a1,-1120 # ba0 <__fini_array_end+0xc>
 288:	fff50537          	lui	a0,0xfff50
 28c:	510000ef          	jal	79c <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 290:	00000793          	li	a5,0
 294:	c0079073          	csrw	cycle,a5
 298:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 29c:	c0202a73          	rdinstret	s4
 2a0:	c0002973          	rdcycle	s2
  asm volatile (
 2a4:	02000437          	lui	s0,0x2000
 2a8:	20040413          	add	s0,s0,512 # 2000200 <__neorv32_ram_size+0x1f80200>
 2ac:	020204b7          	lui	s1,0x2020
 2b0:	0084948b          	.insn	4, 0x0084948b
 2b4:	c0202af3          	rdinstret	s5
 2b8:	c00029f3          	rdcycle	s3

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("First row of Matrix A:\n"); print_matrix(a_packed);
 2bc:	000015b7          	lui	a1,0x1
 2c0:	be058593          	add	a1,a1,-1056 # be0 <__fini_array_end+0x4c>
 2c4:	fff50537          	lui	a0,0xfff50
 2c8:	4d4000ef          	jal	79c <neorv32_uart_printf>
 2cc:	02020537          	lui	a0,0x2020
 2d0:	f15ff0ef          	jal	1e4 <print_matrix>
  neorv32_uart0_printf("First column of Matrix B:\n"); print_matrix(b_packed);
 2d4:	000015b7          	lui	a1,0x1
 2d8:	bf858593          	add	a1,a1,-1032 # bf8 <__fini_array_end+0x64>
 2dc:	fff50537          	lui	a0,0xfff50
 2e0:	4bc000ef          	jal	79c <neorv32_uart_printf>
 2e4:	00040513          	mv	a0,s0
 2e8:	efdff0ef          	jal	1e4 <print_matrix>
  neorv32_uart0_printf("Product A*B (First element):\n"); print_matrix(result);
 2ec:	000015b7          	lui	a1,0x1
 2f0:	c1458593          	add	a1,a1,-1004 # c14 <__fini_array_end+0x80>
 2f4:	fff50537          	lui	a0,0xfff50
 2f8:	4a4000ef          	jal	79c <neorv32_uart_printf>
 2fc:	00048513          	mv	a0,s1
 300:	ee5ff0ef          	jal	1e4 <print_matrix>

  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
 304:	000015b7          	lui	a1,0x1
 308:	414a8633          	sub	a2,s5,s4
 30c:	c3458593          	add	a1,a1,-972 # c34 <__fini_array_end+0xa0>
 310:	fff50537          	lui	a0,0xfff50
 314:	488000ef          	jal	79c <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));
 318:	000015b7          	lui	a1,0x1
 31c:	41298633          	sub	a2,s3,s2
 320:	c4c58593          	add	a1,a1,-948 # c4c <__fini_array_end+0xb8>
 324:	fff50537          	lui	a0,0xfff50
 328:	474000ef          	jal	79c <neorv32_uart_printf>

  return 0;
 32c:	00000793          	li	a5,0
}
 330:	01c12083          	lw	ra,28(sp)
 334:	01812403          	lw	s0,24(sp)
 338:	01412483          	lw	s1,20(sp)
 33c:	01012903          	lw	s2,16(sp)
 340:	00c12983          	lw	s3,12(sp)
 344:	00812a03          	lw	s4,8(sp)
 348:	00412a83          	lw	s5,4(sp)
 34c:	00078513          	mv	a0,a5
 350:	02010113          	add	sp,sp,32
 354:	00008067          	ret

00000358 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 358:	fa010113          	add	sp,sp,-96
 35c:	04912a23          	sw	s1,84(sp)
 360:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 364:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 368:	04812c23          	sw	s0,88(sp)
 36c:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 370:	c6458593          	add	a1,a1,-924 # c64 <__fini_array_end+0xd0>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 374:	00060913          	mv	s2,a2
 378:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 37c:	01000613          	li	a2,16
 380:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 384:	04112e23          	sw	ra,92(sp)
 388:	05312623          	sw	s3,76(sp)
 38c:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 390:	520000ef          	jal	8b0 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 394:	02400613          	li	a2,36
 398:	00000593          	li	a1,0
 39c:	01c10513          	add	a0,sp,28
 3a0:	434000ef          	jal	7d4 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 3a4:	ffe90713          	add	a4,s2,-2
 3a8:	00e00793          	li	a5,14
 3ac:	03f10993          	add	s3,sp,63
 3b0:	02e7f463          	bgeu	a5,a4,3d8 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 3b4:	00040023          	sb	zero,0(s0)
}
 3b8:	05c12083          	lw	ra,92(sp)
 3bc:	05812403          	lw	s0,88(sp)
 3c0:	05412483          	lw	s1,84(sp)
 3c4:	05012903          	lw	s2,80(sp)
 3c8:	04c12983          	lw	s3,76(sp)
 3cc:	04812a03          	lw	s4,72(sp)
 3d0:	06010113          	add	sp,sp,96
 3d4:	00008067          	ret
    *tmp_ptr = digits[num%base];
 3d8:	00090593          	mv	a1,s2
 3dc:	00048513          	mv	a0,s1
 3e0:	750000ef          	jal	b30 <__umodsi3>
 3e4:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 3e8:	00278533          	add	a0,a5,sp
 3ec:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3f0:	00090593          	mv	a1,s2
 3f4:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 3f8:	fef98fa3          	sb	a5,-1(s3)
 3fc:	00048a13          	mv	s4,s1
    num /= base;
 400:	6e8000ef          	jal	ae8 <__hidden___udivsi3>
    tmp_ptr--;
 404:	fff98993          	add	s3,s3,-1
    num /= base;
 408:	00050493          	mv	s1,a0
  } while (num != 0);
 40c:	fd2a76e3          	bgeu	s4,s2,3d8 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 410:	00000793          	li	a5,0
 414:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 418:	01c10713          	add	a4,sp,28
 41c:	00f70733          	add	a4,a4,a5
 420:	00074703          	lbu	a4,0(a4)
 424:	00070663          	beqz	a4,430 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 428:	00e40023          	sb	a4,0(s0)
      buffer++;
 42c:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 430:	00178793          	add	a5,a5,1
 434:	fed792e3          	bne	a5,a3,418 <neorv32_aux_itoa+0xc0>
 438:	f7dff06f          	j	3b4 <neorv32_aux_itoa+0x5c>

0000043c <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 43c:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 440:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 444:	00e51c63          	bne	a0,a4,45c <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 448:	fffe07b7          	lui	a5,0xfffe0
 44c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 450:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 454:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 458:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 45c:	fff60737          	lui	a4,0xfff60
    return 0;
 460:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 464:	fee79ae3          	bne	a5,a4,458 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 468:	fffe07b7          	lui	a5,0xfffe0
 46c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 470:	020007b7          	lui	a5,0x2000
 474:	fe1ff06f          	j	454 <neorv32_uart_available+0x18>

00000478 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 478:	ff010113          	add	sp,sp,-16
 47c:	00812423          	sw	s0,8(sp)
 480:	00912223          	sw	s1,4(sp)
 484:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 488:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 48c:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 490:	00050493          	mv	s1,a0
 494:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 498:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 49c:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 4a0:	648000ef          	jal	ae8 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 4a4:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 4a8:	3fe00693          	li	a3,1022
 4ac:	04a6e663          	bltu	a3,a0,4f8 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 4b0:	fff50793          	add	a5,a0,-1
 4b4:	000106b7          	lui	a3,0x10
 4b8:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 4bc:	00679793          	sll	a5,a5,0x6
 4c0:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4c4:	07c006b7          	lui	a3,0x7c00
 4c8:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4cc:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4d0:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4d4:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 4d8:	00c12083          	lw	ra,12(sp)
 4dc:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4e0:	00e7e7b3          	or	a5,a5,a4
 4e4:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 4e8:	00f4a023          	sw	a5,0(s1) # 2020000 <__neorv32_ram_size+0x1fa0000>
}
 4ec:	00412483          	lw	s1,4(sp)
 4f0:	01010113          	add	sp,sp,16
 4f4:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 4f8:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 4fc:	ffd7f793          	and	a5,a5,-3
 500:	00079863          	bnez	a5,510 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 504:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 508:	00170713          	add	a4,a4,1
 50c:	fa1ff06f          	j	4ac <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 510:	00155513          	srl	a0,a0,0x1
 514:	ff5ff06f          	j	508 <neorv32_uart_setup+0x90>

00000518 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 518:	00052783          	lw	a5,0(a0)
 51c:	00a79713          	sll	a4,a5,0xa
 520:	fe075ce3          	bgez	a4,518 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 524:	00b52223          	sw	a1,4(a0)
}
 528:	00008067          	ret

0000052c <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 52c:	fe010113          	add	sp,sp,-32
 530:	00812c23          	sw	s0,24(sp)
 534:	00912a23          	sw	s1,20(sp)
 538:	01312623          	sw	s3,12(sp)
 53c:	00112e23          	sw	ra,28(sp)
 540:	01212823          	sw	s2,16(sp)
 544:	00050493          	mv	s1,a0
 548:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 54c:	00a00993          	li	s3,10
  while ((c = *s++)) {
 550:	00044903          	lbu	s2,0(s0)
 554:	00140413          	add	s0,s0,1
 558:	02091063          	bnez	s2,578 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 55c:	01c12083          	lw	ra,28(sp)
 560:	01812403          	lw	s0,24(sp)
 564:	01412483          	lw	s1,20(sp)
 568:	01012903          	lw	s2,16(sp)
 56c:	00c12983          	lw	s3,12(sp)
 570:	02010113          	add	sp,sp,32
 574:	00008067          	ret
    if (c == '\n') {
 578:	01391863          	bne	s2,s3,588 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 57c:	00d00593          	li	a1,13
 580:	00048513          	mv	a0,s1
 584:	f95ff0ef          	jal	518 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 588:	00090593          	mv	a1,s2
 58c:	00048513          	mv	a0,s1
 590:	f89ff0ef          	jal	518 <neorv32_uart_putc>
 594:	fbdff06f          	j	550 <neorv32_uart_puts+0x24>

00000598 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 598:	f9010113          	add	sp,sp,-112
 59c:	06812423          	sw	s0,104(sp)
 5a0:	06912223          	sw	s1,100(sp)
 5a4:	07212023          	sw	s2,96(sp)
 5a8:	05312e23          	sw	s3,92(sp)
 5ac:	00050493          	mv	s1,a0
 5b0:	00058913          	mv	s2,a1
 5b4:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 5b8:	00000593          	li	a1,0
 5bc:	02400613          	li	a2,36
 5c0:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 5c4:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 5c8:	05412c23          	sw	s4,88(sp)
 5cc:	05512a23          	sw	s5,84(sp)
 5d0:	05712623          	sw	s7,76(sp)
 5d4:	05812423          	sw	s8,72(sp)
 5d8:	05912223          	sw	s9,68(sp)
 5dc:	05a12023          	sw	s10,64(sp)
 5e0:	06112623          	sw	ra,108(sp)
 5e4:	05612823          	sw	s6,80(sp)
 5e8:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 5ec:	02500b93          	li	s7,37
    string_buf[i] = 0;
 5f0:	1e4000ef          	jal	7d4 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 5f4:	00a00c13          	li	s8,10
      c = tolower(*format++);
 5f8:	c7998993          	add	s3,s3,-903 # c79 <_ctype_+0x1>
 5fc:	00100c93          	li	s9,1
      switch (c) {
 600:	07000a13          	li	s4,112
 604:	07500d13          	li	s10,117
 608:	06300a93          	li	s5,99
  while ((c = *format++)) {
 60c:	00094d83          	lbu	s11,0(s2)
 610:	040d9063          	bnez	s11,650 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 614:	06c12083          	lw	ra,108(sp)
 618:	06812403          	lw	s0,104(sp)
 61c:	06412483          	lw	s1,100(sp)
 620:	06012903          	lw	s2,96(sp)
 624:	05c12983          	lw	s3,92(sp)
 628:	05812a03          	lw	s4,88(sp)
 62c:	05412a83          	lw	s5,84(sp)
 630:	05012b03          	lw	s6,80(sp)
 634:	04c12b83          	lw	s7,76(sp)
 638:	04812c03          	lw	s8,72(sp)
 63c:	04412c83          	lw	s9,68(sp)
 640:	04012d03          	lw	s10,64(sp)
 644:	03c12d83          	lw	s11,60(sp)
 648:	07010113          	add	sp,sp,112
 64c:	00008067          	ret
    if (c == '%') {
 650:	137d9863          	bne	s11,s7,780 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 654:	00290b13          	add	s6,s2,2
 658:	00194903          	lbu	s2,1(s2)
 65c:	013907b3          	add	a5,s2,s3
 660:	0007c783          	lbu	a5,0(a5)
 664:	0037f793          	and	a5,a5,3
 668:	01979463          	bne	a5,s9,670 <neorv32_uart_vprintf+0xd8>
 66c:	02090913          	add	s2,s2,32
      switch (c) {
 670:	0ff97793          	zext.b	a5,s2
 674:	0d478863          	beq	a5,s4,744 <neorv32_uart_vprintf+0x1ac>
 678:	06fa4c63          	blt	s4,a5,6f0 <neorv32_uart_vprintf+0x158>
 67c:	09578e63          	beq	a5,s5,718 <neorv32_uart_vprintf+0x180>
 680:	02fac663          	blt	s5,a5,6ac <neorv32_uart_vprintf+0x114>
 684:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 688:	02500593          	li	a1,37
      switch (c) {
 68c:	00e78a63          	beq	a5,a4,6a0 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 690:	02500593          	li	a1,37
 694:	00048513          	mv	a0,s1
 698:	e81ff0ef          	jal	518 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 69c:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 6a0:	00048513          	mv	a0,s1
 6a4:	e75ff0ef          	jal	518 <neorv32_uart_putc>
 6a8:	0840006f          	j	72c <neorv32_uart_vprintf+0x194>
      switch (c) {
 6ac:	06400713          	li	a4,100
 6b0:	00e78663          	beq	a5,a4,6bc <neorv32_uart_vprintf+0x124>
 6b4:	06900713          	li	a4,105
 6b8:	fce79ce3          	bne	a5,a4,690 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 6bc:	00440913          	add	s2,s0,4
 6c0:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 6c4:	00045a63          	bgez	s0,6d8 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 6c8:	02d00593          	li	a1,45
 6cc:	00048513          	mv	a0,s1
            n = -n;
 6d0:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 6d4:	e45ff0ef          	jal	518 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 6d8:	00a00613          	li	a2,10
 6dc:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6e0:	00c10513          	add	a0,sp,12
 6e4:	c75ff0ef          	jal	358 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 6e8:	00c10593          	add	a1,sp,12
 6ec:	0200006f          	j	70c <neorv32_uart_vprintf+0x174>
      switch (c) {
 6f0:	05a78263          	beq	a5,s10,734 <neorv32_uart_vprintf+0x19c>
 6f4:	07800713          	li	a4,120
 6f8:	04e78663          	beq	a5,a4,744 <neorv32_uart_vprintf+0x1ac>
 6fc:	07300713          	li	a4,115
 700:	f8e798e3          	bne	a5,a4,690 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 704:	00042583          	lw	a1,0(s0)
 708:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 70c:	00048513          	mv	a0,s1
 710:	e1dff0ef          	jal	52c <neorv32_uart_puts>
          break;
 714:	0140006f          	j	728 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 718:	00044583          	lbu	a1,0(s0)
 71c:	00048513          	mv	a0,s1
 720:	00440913          	add	s2,s0,4
 724:	df5ff0ef          	jal	518 <neorv32_uart_putc>
 728:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 72c:	000b0913          	mv	s2,s6
 730:	eddff06f          	j	60c <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 734:	00042583          	lw	a1,0(s0)
 738:	00440913          	add	s2,s0,4
 73c:	00a00613          	li	a2,10
 740:	fa1ff06f          	j	6e0 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 744:	00042583          	lw	a1,0(s0)
 748:	01000613          	li	a2,16
 74c:	00c10513          	add	a0,sp,12
 750:	c09ff0ef          	jal	358 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 754:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 758:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 75c:	2f8000ef          	jal	a54 <strlen>
 760:	00800413          	li	s0,8
 764:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 768:	f80400e3          	beqz	s0,6e8 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 76c:	03000593          	li	a1,48
 770:	00048513          	mv	a0,s1
 774:	da5ff0ef          	jal	518 <neorv32_uart_putc>
 778:	fff40413          	add	s0,s0,-1
 77c:	fedff06f          	j	768 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 780:	018d9863          	bne	s11,s8,790 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 784:	00d00593          	li	a1,13
 788:	00048513          	mv	a0,s1
 78c:	d8dff0ef          	jal	518 <neorv32_uart_putc>
  while ((c = *format++)) {
 790:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 794:	000d8593          	mv	a1,s11
 798:	f09ff06f          	j	6a0 <neorv32_uart_vprintf+0x108>

0000079c <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 79c:	fc010113          	add	sp,sp,-64
 7a0:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 7a4:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 7a8:	00112e23          	sw	ra,28(sp)
 7ac:	02d12623          	sw	a3,44(sp)
 7b0:	02e12823          	sw	a4,48(sp)
 7b4:	02f12a23          	sw	a5,52(sp)
 7b8:	03012c23          	sw	a6,56(sp)
 7bc:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 7c0:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 7c4:	dd5ff0ef          	jal	598 <neorv32_uart_vprintf>
  va_end(args);
}
 7c8:	01c12083          	lw	ra,28(sp)
 7cc:	04010113          	add	sp,sp,64
 7d0:	00008067          	ret

000007d4 <memset>:
 7d4:	00f00313          	li	t1,15
 7d8:	00050713          	mv	a4,a0
 7dc:	02c37e63          	bgeu	t1,a2,818 <memset+0x44>
 7e0:	00f77793          	and	a5,a4,15
 7e4:	0a079063          	bnez	a5,884 <memset+0xb0>
 7e8:	08059263          	bnez	a1,86c <memset+0x98>
 7ec:	ff067693          	and	a3,a2,-16
 7f0:	00f67613          	and	a2,a2,15
 7f4:	00e686b3          	add	a3,a3,a4
 7f8:	00b72023          	sw	a1,0(a4)
 7fc:	00b72223          	sw	a1,4(a4)
 800:	00b72423          	sw	a1,8(a4)
 804:	00b72623          	sw	a1,12(a4)
 808:	01070713          	add	a4,a4,16
 80c:	fed766e3          	bltu	a4,a3,7f8 <memset+0x24>
 810:	00061463          	bnez	a2,818 <memset+0x44>
 814:	00008067          	ret
 818:	40c306b3          	sub	a3,t1,a2
 81c:	00269693          	sll	a3,a3,0x2
 820:	00000297          	auipc	t0,0x0
 824:	005686b3          	add	a3,a3,t0
 828:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 82c:	00b70723          	sb	a1,14(a4)
 830:	00b706a3          	sb	a1,13(a4)
 834:	00b70623          	sb	a1,12(a4)
 838:	00b705a3          	sb	a1,11(a4)
 83c:	00b70523          	sb	a1,10(a4)
 840:	00b704a3          	sb	a1,9(a4)
 844:	00b70423          	sb	a1,8(a4)
 848:	00b703a3          	sb	a1,7(a4)
 84c:	00b70323          	sb	a1,6(a4)
 850:	00b702a3          	sb	a1,5(a4)
 854:	00b70223          	sb	a1,4(a4)
 858:	00b701a3          	sb	a1,3(a4)
 85c:	00b70123          	sb	a1,2(a4)
 860:	00b700a3          	sb	a1,1(a4)
 864:	00b70023          	sb	a1,0(a4)
 868:	00008067          	ret
 86c:	0ff5f593          	zext.b	a1,a1
 870:	00859693          	sll	a3,a1,0x8
 874:	00d5e5b3          	or	a1,a1,a3
 878:	01059693          	sll	a3,a1,0x10
 87c:	00d5e5b3          	or	a1,a1,a3
 880:	f6dff06f          	j	7ec <memset+0x18>
 884:	00279693          	sll	a3,a5,0x2
 888:	00000297          	auipc	t0,0x0
 88c:	005686b3          	add	a3,a3,t0
 890:	00008293          	mv	t0,ra
 894:	fa0680e7          	jalr	-96(a3)
 898:	00028093          	mv	ra,t0
 89c:	ff078793          	add	a5,a5,-16
 8a0:	40f70733          	sub	a4,a4,a5
 8a4:	00f60633          	add	a2,a2,a5
 8a8:	f6c378e3          	bgeu	t1,a2,818 <memset+0x44>
 8ac:	f3dff06f          	j	7e8 <memset+0x14>

000008b0 <memcpy>:
 8b0:	00a5c7b3          	xor	a5,a1,a0
 8b4:	0037f793          	and	a5,a5,3
 8b8:	00c508b3          	add	a7,a0,a2
 8bc:	06079463          	bnez	a5,924 <memcpy+0x74>
 8c0:	00300793          	li	a5,3
 8c4:	06c7f063          	bgeu	a5,a2,924 <memcpy+0x74>
 8c8:	00357793          	and	a5,a0,3
 8cc:	00050713          	mv	a4,a0
 8d0:	06079a63          	bnez	a5,944 <memcpy+0x94>
 8d4:	ffc8f613          	and	a2,a7,-4
 8d8:	40e606b3          	sub	a3,a2,a4
 8dc:	02000793          	li	a5,32
 8e0:	08d7ce63          	blt	a5,a3,97c <memcpy+0xcc>
 8e4:	00058693          	mv	a3,a1
 8e8:	00070793          	mv	a5,a4
 8ec:	02c77863          	bgeu	a4,a2,91c <memcpy+0x6c>
 8f0:	0006a803          	lw	a6,0(a3)
 8f4:	00478793          	add	a5,a5,4
 8f8:	00468693          	add	a3,a3,4
 8fc:	ff07ae23          	sw	a6,-4(a5)
 900:	fec7e8e3          	bltu	a5,a2,8f0 <memcpy+0x40>
 904:	fff60793          	add	a5,a2,-1
 908:	40e787b3          	sub	a5,a5,a4
 90c:	ffc7f793          	and	a5,a5,-4
 910:	00478793          	add	a5,a5,4
 914:	00f70733          	add	a4,a4,a5
 918:	00f585b3          	add	a1,a1,a5
 91c:	01176863          	bltu	a4,a7,92c <memcpy+0x7c>
 920:	00008067          	ret
 924:	00050713          	mv	a4,a0
 928:	05157863          	bgeu	a0,a7,978 <memcpy+0xc8>
 92c:	0005c783          	lbu	a5,0(a1)
 930:	00170713          	add	a4,a4,1
 934:	00158593          	add	a1,a1,1
 938:	fef70fa3          	sb	a5,-1(a4)
 93c:	fee898e3          	bne	a7,a4,92c <memcpy+0x7c>
 940:	00008067          	ret
 944:	0005c683          	lbu	a3,0(a1)
 948:	00170713          	add	a4,a4,1
 94c:	00377793          	and	a5,a4,3
 950:	fed70fa3          	sb	a3,-1(a4)
 954:	00158593          	add	a1,a1,1
 958:	f6078ee3          	beqz	a5,8d4 <memcpy+0x24>
 95c:	0005c683          	lbu	a3,0(a1)
 960:	00170713          	add	a4,a4,1
 964:	00377793          	and	a5,a4,3
 968:	fed70fa3          	sb	a3,-1(a4)
 96c:	00158593          	add	a1,a1,1
 970:	fc079ae3          	bnez	a5,944 <memcpy+0x94>
 974:	f61ff06f          	j	8d4 <memcpy+0x24>
 978:	00008067          	ret
 97c:	ff010113          	add	sp,sp,-16
 980:	00812623          	sw	s0,12(sp)
 984:	02000413          	li	s0,32
 988:	0005a383          	lw	t2,0(a1)
 98c:	0045a283          	lw	t0,4(a1)
 990:	0085af83          	lw	t6,8(a1)
 994:	00c5af03          	lw	t5,12(a1)
 998:	0105ae83          	lw	t4,16(a1)
 99c:	0145ae03          	lw	t3,20(a1)
 9a0:	0185a303          	lw	t1,24(a1)
 9a4:	01c5a803          	lw	a6,28(a1)
 9a8:	0205a683          	lw	a3,32(a1)
 9ac:	02470713          	add	a4,a4,36
 9b0:	40e607b3          	sub	a5,a2,a4
 9b4:	fc772e23          	sw	t2,-36(a4)
 9b8:	fe572023          	sw	t0,-32(a4)
 9bc:	fff72223          	sw	t6,-28(a4)
 9c0:	ffe72423          	sw	t5,-24(a4)
 9c4:	ffd72623          	sw	t4,-20(a4)
 9c8:	ffc72823          	sw	t3,-16(a4)
 9cc:	fe672a23          	sw	t1,-12(a4)
 9d0:	ff072c23          	sw	a6,-8(a4)
 9d4:	fed72e23          	sw	a3,-4(a4)
 9d8:	02458593          	add	a1,a1,36
 9dc:	faf446e3          	blt	s0,a5,988 <memcpy+0xd8>
 9e0:	00058693          	mv	a3,a1
 9e4:	00070793          	mv	a5,a4
 9e8:	02c77863          	bgeu	a4,a2,a18 <memcpy+0x168>
 9ec:	0006a803          	lw	a6,0(a3)
 9f0:	00478793          	add	a5,a5,4
 9f4:	00468693          	add	a3,a3,4
 9f8:	ff07ae23          	sw	a6,-4(a5)
 9fc:	fec7e8e3          	bltu	a5,a2,9ec <memcpy+0x13c>
 a00:	fff60793          	add	a5,a2,-1
 a04:	40e787b3          	sub	a5,a5,a4
 a08:	ffc7f793          	and	a5,a5,-4
 a0c:	00478793          	add	a5,a5,4
 a10:	00f70733          	add	a4,a4,a5
 a14:	00f585b3          	add	a1,a1,a5
 a18:	01176863          	bltu	a4,a7,a28 <memcpy+0x178>
 a1c:	00c12403          	lw	s0,12(sp)
 a20:	01010113          	add	sp,sp,16
 a24:	00008067          	ret
 a28:	0005c783          	lbu	a5,0(a1)
 a2c:	00170713          	add	a4,a4,1
 a30:	00158593          	add	a1,a1,1
 a34:	fef70fa3          	sb	a5,-1(a4)
 a38:	fee882e3          	beq	a7,a4,a1c <memcpy+0x16c>
 a3c:	0005c783          	lbu	a5,0(a1)
 a40:	00170713          	add	a4,a4,1
 a44:	00158593          	add	a1,a1,1
 a48:	fef70fa3          	sb	a5,-1(a4)
 a4c:	fce89ee3          	bne	a7,a4,a28 <memcpy+0x178>
 a50:	fcdff06f          	j	a1c <memcpy+0x16c>

00000a54 <strlen>:
 a54:	00357793          	and	a5,a0,3
 a58:	00050713          	mv	a4,a0
 a5c:	04079c63          	bnez	a5,ab4 <strlen+0x60>
 a60:	7f7f86b7          	lui	a3,0x7f7f8
 a64:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 a68:	fff00593          	li	a1,-1
 a6c:	00072603          	lw	a2,0(a4)
 a70:	00470713          	add	a4,a4,4
 a74:	00d677b3          	and	a5,a2,a3
 a78:	00d787b3          	add	a5,a5,a3
 a7c:	00c7e7b3          	or	a5,a5,a2
 a80:	00d7e7b3          	or	a5,a5,a3
 a84:	feb784e3          	beq	a5,a1,a6c <strlen+0x18>
 a88:	ffc74683          	lbu	a3,-4(a4)
 a8c:	40a707b3          	sub	a5,a4,a0
 a90:	04068463          	beqz	a3,ad8 <strlen+0x84>
 a94:	ffd74683          	lbu	a3,-3(a4)
 a98:	02068c63          	beqz	a3,ad0 <strlen+0x7c>
 a9c:	ffe74503          	lbu	a0,-2(a4)
 aa0:	00a03533          	snez	a0,a0
 aa4:	00f50533          	add	a0,a0,a5
 aa8:	ffe50513          	add	a0,a0,-2
 aac:	00008067          	ret
 ab0:	fa0688e3          	beqz	a3,a60 <strlen+0xc>
 ab4:	00074783          	lbu	a5,0(a4)
 ab8:	00170713          	add	a4,a4,1
 abc:	00377693          	and	a3,a4,3
 ac0:	fe0798e3          	bnez	a5,ab0 <strlen+0x5c>
 ac4:	40a70733          	sub	a4,a4,a0
 ac8:	fff70513          	add	a0,a4,-1
 acc:	00008067          	ret
 ad0:	ffd78513          	add	a0,a5,-3
 ad4:	00008067          	ret
 ad8:	ffc78513          	add	a0,a5,-4
 adc:	00008067          	ret

00000ae0 <__divsi3>:
 ae0:	06054063          	bltz	a0,b40 <__umodsi3+0x10>
 ae4:	0605c663          	bltz	a1,b50 <__umodsi3+0x20>

00000ae8 <__hidden___udivsi3>:
 ae8:	00058613          	mv	a2,a1
 aec:	00050593          	mv	a1,a0
 af0:	fff00513          	li	a0,-1
 af4:	02060c63          	beqz	a2,b2c <__hidden___udivsi3+0x44>
 af8:	00100693          	li	a3,1
 afc:	00b67a63          	bgeu	a2,a1,b10 <__hidden___udivsi3+0x28>
 b00:	00c05863          	blez	a2,b10 <__hidden___udivsi3+0x28>
 b04:	00161613          	sll	a2,a2,0x1
 b08:	00169693          	sll	a3,a3,0x1
 b0c:	feb66ae3          	bltu	a2,a1,b00 <__hidden___udivsi3+0x18>
 b10:	00000513          	li	a0,0
 b14:	00c5e663          	bltu	a1,a2,b20 <__hidden___udivsi3+0x38>
 b18:	40c585b3          	sub	a1,a1,a2
 b1c:	00d56533          	or	a0,a0,a3
 b20:	0016d693          	srl	a3,a3,0x1
 b24:	00165613          	srl	a2,a2,0x1
 b28:	fe0696e3          	bnez	a3,b14 <__hidden___udivsi3+0x2c>
 b2c:	00008067          	ret

00000b30 <__umodsi3>:
 b30:	00008293          	mv	t0,ra
 b34:	fb5ff0ef          	jal	ae8 <__hidden___udivsi3>
 b38:	00058513          	mv	a0,a1
 b3c:	00028067          	jr	t0 # 888 <memset+0xb4>
 b40:	40a00533          	neg	a0,a0
 b44:	00b04863          	bgtz	a1,b54 <__umodsi3+0x24>
 b48:	40b005b3          	neg	a1,a1
 b4c:	f9dff06f          	j	ae8 <__hidden___udivsi3>
 b50:	40b005b3          	neg	a1,a1
 b54:	00008293          	mv	t0,ra
 b58:	f91ff0ef          	jal	ae8 <__hidden___udivsi3>
 b5c:	40a00533          	neg	a0,a0
 b60:	00028067          	jr	t0

00000b64 <__modsi3>:
 b64:	00008293          	mv	t0,ra
 b68:	0005ca63          	bltz	a1,b7c <__modsi3+0x18>
 b6c:	00054c63          	bltz	a0,b84 <__modsi3+0x20>
 b70:	f79ff0ef          	jal	ae8 <__hidden___udivsi3>
 b74:	00058513          	mv	a0,a1
 b78:	00028067          	jr	t0
 b7c:	40b005b3          	neg	a1,a1
 b80:	fe0558e3          	bgez	a0,b70 <__modsi3+0xc>
 b84:	40a00533          	neg	a0,a0
 b88:	f61ff0ef          	jal	ae8 <__hidden___udivsi3>
 b8c:	40b00533          	neg	a0,a1
 b90:	00028067          	jr	t0
