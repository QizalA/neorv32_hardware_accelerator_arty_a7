
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0xad0>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	cfc38393          	add	t2,t2,-772 # d30 <__crt0_copy_data_src_begin>
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
 110:	a7440413          	add	s0,s0,-1420 # b80 <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	a6c48493          	add	s1,s1,-1428 # b80 <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	14460613          	add	a2,a2,324 # 274 <main>

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
 178:	a0c40413          	add	s0,s0,-1524 # b80 <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	a0448493          	add	s1,s1,-1532 # b80 <__fini_array_end>

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

  return (uint16_t)(result & 0xFFFF); // return lower 16 bits
}

// Print 4x4 matrix
void print_matrix(uint16_t mat[4][4]) {
 1e4:	fe010113          	add	sp,sp,-32
 1e8:	00812c23          	sw	s0,24(sp)
 1ec:	00912a23          	sw	s1,20(sp)
 1f0:	01212823          	sw	s2,16(sp)
 1f4:	01312623          	sw	s3,12(sp)
 1f8:	01412423          	sw	s4,8(sp)
 1fc:	00112e23          	sw	ra,28(sp)
 200:	01512223          	sw	s5,4(sp)
 204:	00050413          	mv	s0,a0
 208:	02050493          	add	s1,a0,32
  for (int i = 0; i < 4; i++) {
    neorv32_uart0_printf("[ ");
 20c:	000019b7          	lui	s3,0x1
    for (int j = 0; j < 4; j++) {
      neorv32_uart0_printf("%u ", mat[i][j]);
 210:	00001a37          	lui	s4,0x1
    }
    neorv32_uart0_printf("]\n");
 214:	00001937          	lui	s2,0x1
    neorv32_uart0_printf("[ ");
 218:	b8098593          	add	a1,s3,-1152 # b80 <__fini_array_end>
 21c:	fff50537          	lui	a0,0xfff50
 220:	568000ef          	jal	788 <neorv32_uart_printf>
    for (int j = 0; j < 4; j++) {
 224:	00840a93          	add	s5,s0,8
      neorv32_uart0_printf("%u ", mat[i][j]);
 228:	00045603          	lhu	a2,0(s0)
 22c:	b84a0593          	add	a1,s4,-1148 # b84 <__fini_array_end+0x4>
 230:	fff50537          	lui	a0,0xfff50
    for (int j = 0; j < 4; j++) {
 234:	00240413          	add	s0,s0,2
      neorv32_uart0_printf("%u ", mat[i][j]);
 238:	550000ef          	jal	788 <neorv32_uart_printf>
    for (int j = 0; j < 4; j++) {
 23c:	ff5416e3          	bne	s0,s5,228 <print_matrix+0x44>
    neorv32_uart0_printf("]\n");
 240:	b8890593          	add	a1,s2,-1144 # b88 <__fini_array_end+0x8>
 244:	fff50537          	lui	a0,0xfff50
 248:	540000ef          	jal	788 <neorv32_uart_printf>
  for (int i = 0; i < 4; i++) {
 24c:	fc8496e3          	bne	s1,s0,218 <print_matrix+0x34>
  }
}
 250:	01c12083          	lw	ra,28(sp)
 254:	01812403          	lw	s0,24(sp)
 258:	01412483          	lw	s1,20(sp)
 25c:	01012903          	lw	s2,16(sp)
 260:	00c12983          	lw	s3,12(sp)
 264:	00812a03          	lw	s4,8(sp)
 268:	00412a83          	lw	s5,4(sp)
 26c:	02010113          	add	sp,sp,32
 270:	00008067          	ret

00000274 <main>:

int main(void) {
  neorv32_uart0_setup(19200, 0);
 274:	000055b7          	lui	a1,0x5
int main(void) {
 278:	fd010113          	add	sp,sp,-48
  neorv32_uart0_setup(19200, 0);
 27c:	00000613          	li	a2,0
 280:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 284:	fff50537          	lui	a0,0xfff50
int main(void) {
 288:	02112623          	sw	ra,44(sp)
 28c:	02812423          	sw	s0,40(sp)
  neorv32_uart0_setup(19200, 0);
 290:	1d4000ef          	jal	464 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) {
 294:	fff50537          	lui	a0,0xfff50
 298:	190000ef          	jal	428 <neorv32_uart_available>
 29c:	00100793          	li	a5,1
 2a0:	08050863          	beqz	a0,330 <main+0xbc>
    return 1;
  }

  neorv32_uart0_printf("\n--- CFU 4x4 Matrix Multiplication ---\n\n");
 2a4:	000015b7          	lui	a1,0x1
 2a8:	b8c58593          	add	a1,a1,-1140 # b8c <__fini_array_end+0xc>
 2ac:	fff50537          	lui	a0,0xfff50
 2b0:	4d8000ef          	jal	788 <neorv32_uart_printf>

  neorv32_uart0_printf("Matrix A and B are predefined inside CFU.\n");
 2b4:	000015b7          	lui	a1,0x1
 2b8:	bb858593          	add	a1,a1,-1096 # bb8 <__fini_array_end+0x38>
 2bc:	fff50537          	lui	a0,0xfff50
 2c0:	4c8000ef          	jal	788 <neorv32_uart_printf>
  neorv32_uart0_printf("Fetching result from CFU...\n\n");
 2c4:	000015b7          	lui	a1,0x1
 2c8:	fff50537          	lui	a0,0xfff50
 2cc:	be458593          	add	a1,a1,-1052 # be4 <__fini_array_end+0x64>
 2d0:	4b8000ef          	jal	788 <neorv32_uart_printf>

  uint16_t C[4][4];

  // Fetch each element from CFU
  for (uint8_t i = 0; i < 4; i++) {
 2d4:	00010693          	mv	a3,sp
  neorv32_uart0_printf("Fetching result from CFU...\n\n");
 2d8:	00000613          	li	a2,0
 2dc:	00068413          	mv	s0,a3
    for (uint8_t j = 0; j < 4; j++) {
 2e0:	00400513          	li	a0,4
  for (uint8_t i = 0; i < 4; i++) {
 2e4:	04000813          	li	a6,64
int main(void) {
 2e8:	00068593          	mv	a1,a3
 2ec:	00000713          	li	a4,0
      uint32_t selector = ((i & 0x0F) << 4) | (j & 0x0F);
      register uint32_t rs3 asm("x15") = selector; // rs3 = x15
 2f0:	00c767b3          	or	a5,a4,a2

      uint32_t result;
      asm volatile (
 2f4:	0000178b          	.insn	4, 0x178b
        ".insn r 0x0B, 0x1, 0x00, %0, zero, zero"
        : "=r"(result)
        : "r"(rs3)
      );

      C[i][j] = result & 0xFFFF;
 2f8:	00f59023          	sh	a5,0(a1)
    for (uint8_t j = 0; j < 4; j++) {
 2fc:	00170713          	add	a4,a4,1
 300:	00258593          	add	a1,a1,2
 304:	fea716e3          	bne	a4,a0,2f0 <main+0x7c>
  for (uint8_t i = 0; i < 4; i++) {
 308:	01060613          	add	a2,a2,16
 30c:	00868693          	add	a3,a3,8
 310:	fd061ce3          	bne	a2,a6,2e8 <main+0x74>
    }
  }

  neorv32_uart0_printf("Matrix C = A x B:\n");
 314:	000015b7          	lui	a1,0x1
 318:	c0458593          	add	a1,a1,-1020 # c04 <__fini_array_end+0x84>
 31c:	fff50537          	lui	a0,0xfff50
 320:	468000ef          	jal	788 <neorv32_uart_printf>
  print_matrix(C);
 324:	00040513          	mv	a0,s0
 328:	ebdff0ef          	jal	1e4 <print_matrix>

  return 0;
 32c:	00000793          	li	a5,0
}
 330:	02c12083          	lw	ra,44(sp)
 334:	02812403          	lw	s0,40(sp)
 338:	00078513          	mv	a0,a5
 33c:	03010113          	add	sp,sp,48
 340:	00008067          	ret

00000344 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 344:	fa010113          	add	sp,sp,-96
 348:	04912a23          	sw	s1,84(sp)
 34c:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 350:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 354:	04812c23          	sw	s0,88(sp)
 358:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 35c:	c1858593          	add	a1,a1,-1000 # c18 <__fini_array_end+0x98>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 360:	00060913          	mv	s2,a2
 364:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 368:	01000613          	li	a2,16
 36c:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 370:	04112e23          	sw	ra,92(sp)
 374:	05312623          	sw	s3,76(sp)
 378:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 37c:	520000ef          	jal	89c <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 380:	02400613          	li	a2,36
 384:	00000593          	li	a1,0
 388:	01c10513          	add	a0,sp,28
 38c:	434000ef          	jal	7c0 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 390:	ffe90713          	add	a4,s2,-2
 394:	00e00793          	li	a5,14
 398:	03f10993          	add	s3,sp,63
 39c:	02e7f463          	bgeu	a5,a4,3c4 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 3a0:	00040023          	sb	zero,0(s0)
}
 3a4:	05c12083          	lw	ra,92(sp)
 3a8:	05812403          	lw	s0,88(sp)
 3ac:	05412483          	lw	s1,84(sp)
 3b0:	05012903          	lw	s2,80(sp)
 3b4:	04c12983          	lw	s3,76(sp)
 3b8:	04812a03          	lw	s4,72(sp)
 3bc:	06010113          	add	sp,sp,96
 3c0:	00008067          	ret
    *tmp_ptr = digits[num%base];
 3c4:	00090593          	mv	a1,s2
 3c8:	00048513          	mv	a0,s1
 3cc:	750000ef          	jal	b1c <__umodsi3>
 3d0:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 3d4:	00278533          	add	a0,a5,sp
 3d8:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3dc:	00090593          	mv	a1,s2
 3e0:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 3e4:	fef98fa3          	sb	a5,-1(s3)
 3e8:	00048a13          	mv	s4,s1
    num /= base;
 3ec:	6e8000ef          	jal	ad4 <__hidden___udivsi3>
    tmp_ptr--;
 3f0:	fff98993          	add	s3,s3,-1
    num /= base;
 3f4:	00050493          	mv	s1,a0
  } while (num != 0);
 3f8:	fd2a76e3          	bgeu	s4,s2,3c4 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 3fc:	00000793          	li	a5,0
 400:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 404:	01c10713          	add	a4,sp,28
 408:	00f70733          	add	a4,a4,a5
 40c:	00074703          	lbu	a4,0(a4)
 410:	00070663          	beqz	a4,41c <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 414:	00e40023          	sb	a4,0(s0)
      buffer++;
 418:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 41c:	00178793          	add	a5,a5,1
 420:	fed792e3          	bne	a5,a3,404 <neorv32_aux_itoa+0xc0>
 424:	f7dff06f          	j	3a0 <neorv32_aux_itoa+0x5c>

00000428 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 428:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 42c:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 430:	00e51c63          	bne	a0,a4,448 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 434:	fffe07b7          	lui	a5,0xfffe0
 438:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 43c:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 440:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 444:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 448:	fff60737          	lui	a4,0xfff60
    return 0;
 44c:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 450:	fee79ae3          	bne	a5,a4,444 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 454:	fffe07b7          	lui	a5,0xfffe0
 458:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 45c:	020007b7          	lui	a5,0x2000
 460:	fe1ff06f          	j	440 <neorv32_uart_available+0x18>

00000464 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 464:	ff010113          	add	sp,sp,-16
 468:	00812423          	sw	s0,8(sp)
 46c:	00912223          	sw	s1,4(sp)
 470:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 474:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 478:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 47c:	00050493          	mv	s1,a0
 480:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 484:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 488:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 48c:	648000ef          	jal	ad4 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 490:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 494:	3fe00693          	li	a3,1022
 498:	04a6e663          	bltu	a3,a0,4e4 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 49c:	fff50793          	add	a5,a0,-1
 4a0:	000106b7          	lui	a3,0x10
 4a4:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 4a8:	00679793          	sll	a5,a5,0x6
 4ac:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4b0:	07c006b7          	lui	a3,0x7c00
 4b4:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4b8:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4bc:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4c0:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 4c4:	00c12083          	lw	ra,12(sp)
 4c8:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4cc:	00e7e7b3          	or	a5,a5,a4
 4d0:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 4d4:	00f4a023          	sw	a5,0(s1)
}
 4d8:	00412483          	lw	s1,4(sp)
 4dc:	01010113          	add	sp,sp,16
 4e0:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 4e4:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 4e8:	ffd7f793          	and	a5,a5,-3
 4ec:	00079863          	bnez	a5,4fc <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 4f0:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 4f4:	00170713          	add	a4,a4,1
 4f8:	fa1ff06f          	j	498 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 4fc:	00155513          	srl	a0,a0,0x1
 500:	ff5ff06f          	j	4f4 <neorv32_uart_setup+0x90>

00000504 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 504:	00052783          	lw	a5,0(a0)
 508:	00a79713          	sll	a4,a5,0xa
 50c:	fe075ce3          	bgez	a4,504 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 510:	00b52223          	sw	a1,4(a0)
}
 514:	00008067          	ret

00000518 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 518:	fe010113          	add	sp,sp,-32
 51c:	00812c23          	sw	s0,24(sp)
 520:	00912a23          	sw	s1,20(sp)
 524:	01312623          	sw	s3,12(sp)
 528:	00112e23          	sw	ra,28(sp)
 52c:	01212823          	sw	s2,16(sp)
 530:	00050493          	mv	s1,a0
 534:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 538:	00a00993          	li	s3,10
  while ((c = *s++)) {
 53c:	00044903          	lbu	s2,0(s0)
 540:	00140413          	add	s0,s0,1
 544:	02091063          	bnez	s2,564 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 548:	01c12083          	lw	ra,28(sp)
 54c:	01812403          	lw	s0,24(sp)
 550:	01412483          	lw	s1,20(sp)
 554:	01012903          	lw	s2,16(sp)
 558:	00c12983          	lw	s3,12(sp)
 55c:	02010113          	add	sp,sp,32
 560:	00008067          	ret
    if (c == '\n') {
 564:	01391863          	bne	s2,s3,574 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 568:	00d00593          	li	a1,13
 56c:	00048513          	mv	a0,s1
 570:	f95ff0ef          	jal	504 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 574:	00090593          	mv	a1,s2
 578:	00048513          	mv	a0,s1
 57c:	f89ff0ef          	jal	504 <neorv32_uart_putc>
 580:	fbdff06f          	j	53c <neorv32_uart_puts+0x24>

00000584 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 584:	f9010113          	add	sp,sp,-112
 588:	06812423          	sw	s0,104(sp)
 58c:	06912223          	sw	s1,100(sp)
 590:	07212023          	sw	s2,96(sp)
 594:	05312e23          	sw	s3,92(sp)
 598:	00050493          	mv	s1,a0
 59c:	00058913          	mv	s2,a1
 5a0:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 5a4:	00000593          	li	a1,0
 5a8:	02400613          	li	a2,36
 5ac:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 5b0:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 5b4:	05412c23          	sw	s4,88(sp)
 5b8:	05512a23          	sw	s5,84(sp)
 5bc:	05712623          	sw	s7,76(sp)
 5c0:	05812423          	sw	s8,72(sp)
 5c4:	05912223          	sw	s9,68(sp)
 5c8:	05a12023          	sw	s10,64(sp)
 5cc:	06112623          	sw	ra,108(sp)
 5d0:	05612823          	sw	s6,80(sp)
 5d4:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 5d8:	02500b93          	li	s7,37
    string_buf[i] = 0;
 5dc:	1e4000ef          	jal	7c0 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 5e0:	00a00c13          	li	s8,10
      c = tolower(*format++);
 5e4:	c2d98993          	add	s3,s3,-979 # c2d <_ctype_+0x1>
 5e8:	00100c93          	li	s9,1
      switch (c) {
 5ec:	07000a13          	li	s4,112
 5f0:	07500d13          	li	s10,117
 5f4:	06300a93          	li	s5,99
  while ((c = *format++)) {
 5f8:	00094d83          	lbu	s11,0(s2)
 5fc:	040d9063          	bnez	s11,63c <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 600:	06c12083          	lw	ra,108(sp)
 604:	06812403          	lw	s0,104(sp)
 608:	06412483          	lw	s1,100(sp)
 60c:	06012903          	lw	s2,96(sp)
 610:	05c12983          	lw	s3,92(sp)
 614:	05812a03          	lw	s4,88(sp)
 618:	05412a83          	lw	s5,84(sp)
 61c:	05012b03          	lw	s6,80(sp)
 620:	04c12b83          	lw	s7,76(sp)
 624:	04812c03          	lw	s8,72(sp)
 628:	04412c83          	lw	s9,68(sp)
 62c:	04012d03          	lw	s10,64(sp)
 630:	03c12d83          	lw	s11,60(sp)
 634:	07010113          	add	sp,sp,112
 638:	00008067          	ret
    if (c == '%') {
 63c:	137d9863          	bne	s11,s7,76c <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 640:	00290b13          	add	s6,s2,2
 644:	00194903          	lbu	s2,1(s2)
 648:	013907b3          	add	a5,s2,s3
 64c:	0007c783          	lbu	a5,0(a5)
 650:	0037f793          	and	a5,a5,3
 654:	01979463          	bne	a5,s9,65c <neorv32_uart_vprintf+0xd8>
 658:	02090913          	add	s2,s2,32
      switch (c) {
 65c:	0ff97793          	zext.b	a5,s2
 660:	0d478863          	beq	a5,s4,730 <neorv32_uart_vprintf+0x1ac>
 664:	06fa4c63          	blt	s4,a5,6dc <neorv32_uart_vprintf+0x158>
 668:	09578e63          	beq	a5,s5,704 <neorv32_uart_vprintf+0x180>
 66c:	02fac663          	blt	s5,a5,698 <neorv32_uart_vprintf+0x114>
 670:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 674:	02500593          	li	a1,37
      switch (c) {
 678:	00e78a63          	beq	a5,a4,68c <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 67c:	02500593          	li	a1,37
 680:	00048513          	mv	a0,s1
 684:	e81ff0ef          	jal	504 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 688:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 68c:	00048513          	mv	a0,s1
 690:	e75ff0ef          	jal	504 <neorv32_uart_putc>
 694:	0840006f          	j	718 <neorv32_uart_vprintf+0x194>
      switch (c) {
 698:	06400713          	li	a4,100
 69c:	00e78663          	beq	a5,a4,6a8 <neorv32_uart_vprintf+0x124>
 6a0:	06900713          	li	a4,105
 6a4:	fce79ce3          	bne	a5,a4,67c <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 6a8:	00440913          	add	s2,s0,4
 6ac:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 6b0:	00045a63          	bgez	s0,6c4 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 6b4:	02d00593          	li	a1,45
 6b8:	00048513          	mv	a0,s1
            n = -n;
 6bc:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 6c0:	e45ff0ef          	jal	504 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 6c4:	00a00613          	li	a2,10
 6c8:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6cc:	00c10513          	add	a0,sp,12
 6d0:	c75ff0ef          	jal	344 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 6d4:	00c10593          	add	a1,sp,12
 6d8:	0200006f          	j	6f8 <neorv32_uart_vprintf+0x174>
      switch (c) {
 6dc:	05a78263          	beq	a5,s10,720 <neorv32_uart_vprintf+0x19c>
 6e0:	07800713          	li	a4,120
 6e4:	04e78663          	beq	a5,a4,730 <neorv32_uart_vprintf+0x1ac>
 6e8:	07300713          	li	a4,115
 6ec:	f8e798e3          	bne	a5,a4,67c <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 6f0:	00042583          	lw	a1,0(s0)
 6f4:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 6f8:	00048513          	mv	a0,s1
 6fc:	e1dff0ef          	jal	518 <neorv32_uart_puts>
          break;
 700:	0140006f          	j	714 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 704:	00044583          	lbu	a1,0(s0)
 708:	00048513          	mv	a0,s1
 70c:	00440913          	add	s2,s0,4
 710:	df5ff0ef          	jal	504 <neorv32_uart_putc>
 714:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 718:	000b0913          	mv	s2,s6
 71c:	eddff06f          	j	5f8 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 720:	00042583          	lw	a1,0(s0)
 724:	00440913          	add	s2,s0,4
 728:	00a00613          	li	a2,10
 72c:	fa1ff06f          	j	6cc <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 730:	00042583          	lw	a1,0(s0)
 734:	01000613          	li	a2,16
 738:	00c10513          	add	a0,sp,12
 73c:	c09ff0ef          	jal	344 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 740:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 744:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 748:	2f8000ef          	jal	a40 <strlen>
 74c:	00800413          	li	s0,8
 750:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 754:	f80400e3          	beqz	s0,6d4 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 758:	03000593          	li	a1,48
 75c:	00048513          	mv	a0,s1
 760:	da5ff0ef          	jal	504 <neorv32_uart_putc>
 764:	fff40413          	add	s0,s0,-1
 768:	fedff06f          	j	754 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 76c:	018d9863          	bne	s11,s8,77c <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 770:	00d00593          	li	a1,13
 774:	00048513          	mv	a0,s1
 778:	d8dff0ef          	jal	504 <neorv32_uart_putc>
  while ((c = *format++)) {
 77c:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 780:	000d8593          	mv	a1,s11
 784:	f09ff06f          	j	68c <neorv32_uart_vprintf+0x108>

00000788 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 788:	fc010113          	add	sp,sp,-64
 78c:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 790:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 794:	00112e23          	sw	ra,28(sp)
 798:	02d12623          	sw	a3,44(sp)
 79c:	02e12823          	sw	a4,48(sp)
 7a0:	02f12a23          	sw	a5,52(sp)
 7a4:	03012c23          	sw	a6,56(sp)
 7a8:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 7ac:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 7b0:	dd5ff0ef          	jal	584 <neorv32_uart_vprintf>
  va_end(args);
}
 7b4:	01c12083          	lw	ra,28(sp)
 7b8:	04010113          	add	sp,sp,64
 7bc:	00008067          	ret

000007c0 <memset>:
 7c0:	00f00313          	li	t1,15
 7c4:	00050713          	mv	a4,a0
 7c8:	02c37e63          	bgeu	t1,a2,804 <memset+0x44>
 7cc:	00f77793          	and	a5,a4,15
 7d0:	0a079063          	bnez	a5,870 <memset+0xb0>
 7d4:	08059263          	bnez	a1,858 <memset+0x98>
 7d8:	ff067693          	and	a3,a2,-16
 7dc:	00f67613          	and	a2,a2,15
 7e0:	00e686b3          	add	a3,a3,a4
 7e4:	00b72023          	sw	a1,0(a4)
 7e8:	00b72223          	sw	a1,4(a4)
 7ec:	00b72423          	sw	a1,8(a4)
 7f0:	00b72623          	sw	a1,12(a4)
 7f4:	01070713          	add	a4,a4,16
 7f8:	fed766e3          	bltu	a4,a3,7e4 <memset+0x24>
 7fc:	00061463          	bnez	a2,804 <memset+0x44>
 800:	00008067          	ret
 804:	40c306b3          	sub	a3,t1,a2
 808:	00269693          	sll	a3,a3,0x2
 80c:	00000297          	auipc	t0,0x0
 810:	005686b3          	add	a3,a3,t0
 814:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 818:	00b70723          	sb	a1,14(a4)
 81c:	00b706a3          	sb	a1,13(a4)
 820:	00b70623          	sb	a1,12(a4)
 824:	00b705a3          	sb	a1,11(a4)
 828:	00b70523          	sb	a1,10(a4)
 82c:	00b704a3          	sb	a1,9(a4)
 830:	00b70423          	sb	a1,8(a4)
 834:	00b703a3          	sb	a1,7(a4)
 838:	00b70323          	sb	a1,6(a4)
 83c:	00b702a3          	sb	a1,5(a4)
 840:	00b70223          	sb	a1,4(a4)
 844:	00b701a3          	sb	a1,3(a4)
 848:	00b70123          	sb	a1,2(a4)
 84c:	00b700a3          	sb	a1,1(a4)
 850:	00b70023          	sb	a1,0(a4)
 854:	00008067          	ret
 858:	0ff5f593          	zext.b	a1,a1
 85c:	00859693          	sll	a3,a1,0x8
 860:	00d5e5b3          	or	a1,a1,a3
 864:	01059693          	sll	a3,a1,0x10
 868:	00d5e5b3          	or	a1,a1,a3
 86c:	f6dff06f          	j	7d8 <memset+0x18>
 870:	00279693          	sll	a3,a5,0x2
 874:	00000297          	auipc	t0,0x0
 878:	005686b3          	add	a3,a3,t0
 87c:	00008293          	mv	t0,ra
 880:	fa0680e7          	jalr	-96(a3)
 884:	00028093          	mv	ra,t0
 888:	ff078793          	add	a5,a5,-16
 88c:	40f70733          	sub	a4,a4,a5
 890:	00f60633          	add	a2,a2,a5
 894:	f6c378e3          	bgeu	t1,a2,804 <memset+0x44>
 898:	f3dff06f          	j	7d4 <memset+0x14>

0000089c <memcpy>:
 89c:	00a5c7b3          	xor	a5,a1,a0
 8a0:	0037f793          	and	a5,a5,3
 8a4:	00c508b3          	add	a7,a0,a2
 8a8:	06079463          	bnez	a5,910 <memcpy+0x74>
 8ac:	00300793          	li	a5,3
 8b0:	06c7f063          	bgeu	a5,a2,910 <memcpy+0x74>
 8b4:	00357793          	and	a5,a0,3
 8b8:	00050713          	mv	a4,a0
 8bc:	06079a63          	bnez	a5,930 <memcpy+0x94>
 8c0:	ffc8f613          	and	a2,a7,-4
 8c4:	40e606b3          	sub	a3,a2,a4
 8c8:	02000793          	li	a5,32
 8cc:	08d7ce63          	blt	a5,a3,968 <memcpy+0xcc>
 8d0:	00058693          	mv	a3,a1
 8d4:	00070793          	mv	a5,a4
 8d8:	02c77863          	bgeu	a4,a2,908 <memcpy+0x6c>
 8dc:	0006a803          	lw	a6,0(a3)
 8e0:	00478793          	add	a5,a5,4
 8e4:	00468693          	add	a3,a3,4
 8e8:	ff07ae23          	sw	a6,-4(a5)
 8ec:	fec7e8e3          	bltu	a5,a2,8dc <memcpy+0x40>
 8f0:	fff60793          	add	a5,a2,-1
 8f4:	40e787b3          	sub	a5,a5,a4
 8f8:	ffc7f793          	and	a5,a5,-4
 8fc:	00478793          	add	a5,a5,4
 900:	00f70733          	add	a4,a4,a5
 904:	00f585b3          	add	a1,a1,a5
 908:	01176863          	bltu	a4,a7,918 <memcpy+0x7c>
 90c:	00008067          	ret
 910:	00050713          	mv	a4,a0
 914:	05157863          	bgeu	a0,a7,964 <memcpy+0xc8>
 918:	0005c783          	lbu	a5,0(a1)
 91c:	00170713          	add	a4,a4,1
 920:	00158593          	add	a1,a1,1
 924:	fef70fa3          	sb	a5,-1(a4)
 928:	fee898e3          	bne	a7,a4,918 <memcpy+0x7c>
 92c:	00008067          	ret
 930:	0005c683          	lbu	a3,0(a1)
 934:	00170713          	add	a4,a4,1
 938:	00377793          	and	a5,a4,3
 93c:	fed70fa3          	sb	a3,-1(a4)
 940:	00158593          	add	a1,a1,1
 944:	f6078ee3          	beqz	a5,8c0 <memcpy+0x24>
 948:	0005c683          	lbu	a3,0(a1)
 94c:	00170713          	add	a4,a4,1
 950:	00377793          	and	a5,a4,3
 954:	fed70fa3          	sb	a3,-1(a4)
 958:	00158593          	add	a1,a1,1
 95c:	fc079ae3          	bnez	a5,930 <memcpy+0x94>
 960:	f61ff06f          	j	8c0 <memcpy+0x24>
 964:	00008067          	ret
 968:	ff010113          	add	sp,sp,-16
 96c:	00812623          	sw	s0,12(sp)
 970:	02000413          	li	s0,32
 974:	0005a383          	lw	t2,0(a1)
 978:	0045a283          	lw	t0,4(a1)
 97c:	0085af83          	lw	t6,8(a1)
 980:	00c5af03          	lw	t5,12(a1)
 984:	0105ae83          	lw	t4,16(a1)
 988:	0145ae03          	lw	t3,20(a1)
 98c:	0185a303          	lw	t1,24(a1)
 990:	01c5a803          	lw	a6,28(a1)
 994:	0205a683          	lw	a3,32(a1)
 998:	02470713          	add	a4,a4,36
 99c:	40e607b3          	sub	a5,a2,a4
 9a0:	fc772e23          	sw	t2,-36(a4)
 9a4:	fe572023          	sw	t0,-32(a4)
 9a8:	fff72223          	sw	t6,-28(a4)
 9ac:	ffe72423          	sw	t5,-24(a4)
 9b0:	ffd72623          	sw	t4,-20(a4)
 9b4:	ffc72823          	sw	t3,-16(a4)
 9b8:	fe672a23          	sw	t1,-12(a4)
 9bc:	ff072c23          	sw	a6,-8(a4)
 9c0:	fed72e23          	sw	a3,-4(a4)
 9c4:	02458593          	add	a1,a1,36
 9c8:	faf446e3          	blt	s0,a5,974 <memcpy+0xd8>
 9cc:	00058693          	mv	a3,a1
 9d0:	00070793          	mv	a5,a4
 9d4:	02c77863          	bgeu	a4,a2,a04 <memcpy+0x168>
 9d8:	0006a803          	lw	a6,0(a3)
 9dc:	00478793          	add	a5,a5,4
 9e0:	00468693          	add	a3,a3,4
 9e4:	ff07ae23          	sw	a6,-4(a5)
 9e8:	fec7e8e3          	bltu	a5,a2,9d8 <memcpy+0x13c>
 9ec:	fff60793          	add	a5,a2,-1
 9f0:	40e787b3          	sub	a5,a5,a4
 9f4:	ffc7f793          	and	a5,a5,-4
 9f8:	00478793          	add	a5,a5,4
 9fc:	00f70733          	add	a4,a4,a5
 a00:	00f585b3          	add	a1,a1,a5
 a04:	01176863          	bltu	a4,a7,a14 <memcpy+0x178>
 a08:	00c12403          	lw	s0,12(sp)
 a0c:	01010113          	add	sp,sp,16
 a10:	00008067          	ret
 a14:	0005c783          	lbu	a5,0(a1)
 a18:	00170713          	add	a4,a4,1
 a1c:	00158593          	add	a1,a1,1
 a20:	fef70fa3          	sb	a5,-1(a4)
 a24:	fee882e3          	beq	a7,a4,a08 <memcpy+0x16c>
 a28:	0005c783          	lbu	a5,0(a1)
 a2c:	00170713          	add	a4,a4,1
 a30:	00158593          	add	a1,a1,1
 a34:	fef70fa3          	sb	a5,-1(a4)
 a38:	fce89ee3          	bne	a7,a4,a14 <memcpy+0x178>
 a3c:	fcdff06f          	j	a08 <memcpy+0x16c>

00000a40 <strlen>:
 a40:	00357793          	and	a5,a0,3
 a44:	00050713          	mv	a4,a0
 a48:	04079c63          	bnez	a5,aa0 <strlen+0x60>
 a4c:	7f7f86b7          	lui	a3,0x7f7f8
 a50:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 a54:	fff00593          	li	a1,-1
 a58:	00072603          	lw	a2,0(a4)
 a5c:	00470713          	add	a4,a4,4
 a60:	00d677b3          	and	a5,a2,a3
 a64:	00d787b3          	add	a5,a5,a3
 a68:	00c7e7b3          	or	a5,a5,a2
 a6c:	00d7e7b3          	or	a5,a5,a3
 a70:	feb784e3          	beq	a5,a1,a58 <strlen+0x18>
 a74:	ffc74683          	lbu	a3,-4(a4)
 a78:	40a707b3          	sub	a5,a4,a0
 a7c:	04068463          	beqz	a3,ac4 <strlen+0x84>
 a80:	ffd74683          	lbu	a3,-3(a4)
 a84:	02068c63          	beqz	a3,abc <strlen+0x7c>
 a88:	ffe74503          	lbu	a0,-2(a4)
 a8c:	00a03533          	snez	a0,a0
 a90:	00f50533          	add	a0,a0,a5
 a94:	ffe50513          	add	a0,a0,-2
 a98:	00008067          	ret
 a9c:	fa0688e3          	beqz	a3,a4c <strlen+0xc>
 aa0:	00074783          	lbu	a5,0(a4)
 aa4:	00170713          	add	a4,a4,1
 aa8:	00377693          	and	a3,a4,3
 aac:	fe0798e3          	bnez	a5,a9c <strlen+0x5c>
 ab0:	40a70733          	sub	a4,a4,a0
 ab4:	fff70513          	add	a0,a4,-1
 ab8:	00008067          	ret
 abc:	ffd78513          	add	a0,a5,-3
 ac0:	00008067          	ret
 ac4:	ffc78513          	add	a0,a5,-4
 ac8:	00008067          	ret

00000acc <__divsi3>:
 acc:	06054063          	bltz	a0,b2c <__umodsi3+0x10>
 ad0:	0605c663          	bltz	a1,b3c <__umodsi3+0x20>

00000ad4 <__hidden___udivsi3>:
 ad4:	00058613          	mv	a2,a1
 ad8:	00050593          	mv	a1,a0
 adc:	fff00513          	li	a0,-1
 ae0:	02060c63          	beqz	a2,b18 <__hidden___udivsi3+0x44>
 ae4:	00100693          	li	a3,1
 ae8:	00b67a63          	bgeu	a2,a1,afc <__hidden___udivsi3+0x28>
 aec:	00c05863          	blez	a2,afc <__hidden___udivsi3+0x28>
 af0:	00161613          	sll	a2,a2,0x1
 af4:	00169693          	sll	a3,a3,0x1
 af8:	feb66ae3          	bltu	a2,a1,aec <__hidden___udivsi3+0x18>
 afc:	00000513          	li	a0,0
 b00:	00c5e663          	bltu	a1,a2,b0c <__hidden___udivsi3+0x38>
 b04:	40c585b3          	sub	a1,a1,a2
 b08:	00d56533          	or	a0,a0,a3
 b0c:	0016d693          	srl	a3,a3,0x1
 b10:	00165613          	srl	a2,a2,0x1
 b14:	fe0696e3          	bnez	a3,b00 <__hidden___udivsi3+0x2c>
 b18:	00008067          	ret

00000b1c <__umodsi3>:
 b1c:	00008293          	mv	t0,ra
 b20:	fb5ff0ef          	jal	ad4 <__hidden___udivsi3>
 b24:	00058513          	mv	a0,a1
 b28:	00028067          	jr	t0 # 874 <memset+0xb4>
 b2c:	40a00533          	neg	a0,a0
 b30:	00b04863          	bgtz	a1,b40 <__umodsi3+0x24>
 b34:	40b005b3          	neg	a1,a1
 b38:	f9dff06f          	j	ad4 <__hidden___udivsi3>
 b3c:	40b005b3          	neg	a1,a1
 b40:	00008293          	mv	t0,ra
 b44:	f91ff0ef          	jal	ad4 <__hidden___udivsi3>
 b48:	40a00533          	neg	a0,a0
 b4c:	00028067          	jr	t0

00000b50 <__modsi3>:
 b50:	00008293          	mv	t0,ra
 b54:	0005ca63          	bltz	a1,b68 <__modsi3+0x18>
 b58:	00054c63          	bltz	a0,b70 <__modsi3+0x20>
 b5c:	f79ff0ef          	jal	ad4 <__hidden___udivsi3>
 b60:	00058513          	mv	a0,a1
 b64:	00028067          	jr	t0
 b68:	40b005b3          	neg	a1,a1
 b6c:	fe0558e3          	bgez	a0,b5c <__modsi3+0xc>
 b70:	40a00533          	neg	a0,a0
 b74:	f61ff0ef          	jal	ad4 <__hidden___udivsi3>
 b78:	40b00533          	neg	a0,a1
 b7c:	00028067          	jr	t0
