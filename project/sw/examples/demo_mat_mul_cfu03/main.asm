
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0xac8>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	d0438393          	add	t2,t2,-764 # d38 <__RODATA_END__>
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
 110:	a8c40413          	add	s0,s0,-1396 # b98 <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	a8448493          	add	s1,s1,-1404 # b98 <__etext>

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
 170:	a2c40413          	add	s0,s0,-1492 # b98 <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	a2448493          	add	s1,s1,-1500 # b98 <__etext>

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
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
}

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 1dc:	000055b7          	lui	a1,0x5
int main(void) {
 1e0:	fe010113          	add	sp,sp,-32
  neorv32_uart0_setup(19200, 0);
 1e4:	00000613          	li	a2,0
 1e8:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 1ec:	fff50537          	lui	a0,0xfff50
int main(void) {
 1f0:	00112e23          	sw	ra,28(sp)
 1f4:	00812c23          	sw	s0,24(sp)
 1f8:	00912a23          	sw	s1,20(sp)
 1fc:	01212823          	sw	s2,16(sp)
 200:	01312623          	sw	s3,12(sp)
 204:	01412423          	sw	s4,8(sp)
 208:	01512223          	sw	s5,4(sp)
 20c:	01612023          	sw	s6,0(sp)
  neorv32_uart0_setup(19200, 0);
 210:	26c000ef          	jal	47c <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 214:	fff50537          	lui	a0,0xfff50
 218:	228000ef          	jal	440 <neorv32_uart_available>
 21c:	00100793          	li	a5,1
 220:	0a050c63          	beqz	a0,2d8 <main+0xfc>

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication ---\n");
 224:	000015b7          	lui	a1,0x1
 228:	ba458593          	add	a1,a1,-1116 # ba4 <__etext+0xc>
 22c:	fff50537          	lui	a0,0xfff50
 230:	570000ef          	jal	7a0 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 234:	00000793          	li	a5,0
 238:	c0079073          	csrw	cycle,a5
 23c:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 240:	c0202a73          	rdinstret	s4
 244:	c0002973          	rdcycle	s2
  asm volatile (
 248:	010204b7          	lui	s1,0x1020
 24c:	05060437          	lui	s0,0x5060
 250:	30448493          	add	s1,s1,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 254:	70840413          	add	s0,s0,1800 # 5060708 <__neorv32_ram_size+0x4fe0708>
 258:	00849b0b          	.insn	4, 0x00849b0b
 25c:	c0202af3          	rdinstret	s5
 260:	c00029f3          	rdcycle	s3

  uint64_t instr_end = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t cycle_end = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(a_packed);
 264:	000015b7          	lui	a1,0x1
 268:	bcc58593          	add	a1,a1,-1076 # bcc <__etext+0x34>
 26c:	fff50537          	lui	a0,0xfff50
 270:	530000ef          	jal	7a0 <neorv32_uart_printf>
 274:	00048513          	mv	a0,s1
 278:	08c000ef          	jal	304 <print_matrix>
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(b_packed);
 27c:	000015b7          	lui	a1,0x1
 280:	bdc58593          	add	a1,a1,-1060 # bdc <__etext+0x44>
 284:	fff50537          	lui	a0,0xfff50
 288:	518000ef          	jal	7a0 <neorv32_uart_printf>
 28c:	00040513          	mv	a0,s0
 290:	074000ef          	jal	304 <print_matrix>
  neorv32_uart0_printf("Sum:\n");      print_matrix(result);
 294:	000015b7          	lui	a1,0x1
 298:	be858593          	add	a1,a1,-1048 # be8 <__etext+0x50>
 29c:	fff50537          	lui	a0,0xfff50
 2a0:	500000ef          	jal	7a0 <neorv32_uart_printf>
 2a4:	000b0513          	mv	a0,s6
 2a8:	05c000ef          	jal	304 <print_matrix>

  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(instr_end - instr_start));
 2ac:	000015b7          	lui	a1,0x1
 2b0:	414a8633          	sub	a2,s5,s4
 2b4:	bf058593          	add	a1,a1,-1040 # bf0 <__etext+0x58>
 2b8:	fff50537          	lui	a0,0xfff50
 2bc:	4e4000ef          	jal	7a0 <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(cycle_end - cycle_start));
 2c0:	000015b7          	lui	a1,0x1
 2c4:	41298633          	sub	a2,s3,s2
 2c8:	c0858593          	add	a1,a1,-1016 # c08 <__etext+0x70>
 2cc:	fff50537          	lui	a0,0xfff50
 2d0:	4d0000ef          	jal	7a0 <neorv32_uart_printf>

  return 0;
 2d4:	00000793          	li	a5,0
}
 2d8:	01c12083          	lw	ra,28(sp)
 2dc:	01812403          	lw	s0,24(sp)
 2e0:	01412483          	lw	s1,20(sp)
 2e4:	01012903          	lw	s2,16(sp)
 2e8:	00c12983          	lw	s3,12(sp)
 2ec:	00812a03          	lw	s4,8(sp)
 2f0:	00412a83          	lw	s5,4(sp)
 2f4:	00012b03          	lw	s6,0(sp)
 2f8:	00078513          	mv	a0,a5
 2fc:	02010113          	add	sp,sp,32
 300:	00008067          	ret

00000304 <print_matrix>:
void print_matrix(uint32_t packed) {
 304:	ff010113          	add	sp,sp,-16
 308:	00912223          	sw	s1,4(sp)
  uint8_t m12 = (packed >> 16) & 0xFF;
 30c:	01055693          	srl	a3,a0,0x10
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 310:	000014b7          	lui	s1,0x1
void print_matrix(uint32_t packed) {
 314:	00812423          	sw	s0,8(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 318:	01855613          	srl	a2,a0,0x18
void print_matrix(uint32_t packed) {
 31c:	00050413          	mv	s0,a0
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 320:	b9848593          	add	a1,s1,-1128 # b98 <__etext>
 324:	0ff6f693          	zext.b	a3,a3
 328:	fff50537          	lui	a0,0xfff50
void print_matrix(uint32_t packed) {
 32c:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 330:	470000ef          	jal	7a0 <neorv32_uart_printf>
  uint8_t m21 = (packed >> 8)  & 0xFF;
 334:	00845613          	srl	a2,s0,0x8
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 338:	0ff47693          	zext.b	a3,s0
}
 33c:	00812403          	lw	s0,8(sp)
 340:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 344:	b9848593          	add	a1,s1,-1128
}
 348:	00412483          	lw	s1,4(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 34c:	0ff67613          	zext.b	a2,a2
 350:	fff50537          	lui	a0,0xfff50
}
 354:	01010113          	add	sp,sp,16
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 358:	4480006f          	j	7a0 <neorv32_uart_printf>

0000035c <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 35c:	fa010113          	add	sp,sp,-96
 360:	04912a23          	sw	s1,84(sp)
 364:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 368:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 36c:	04812c23          	sw	s0,88(sp)
 370:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 374:	c2058593          	add	a1,a1,-992 # c20 <__etext+0x88>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 378:	00060913          	mv	s2,a2
 37c:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 380:	01000613          	li	a2,16
 384:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 388:	04112e23          	sw	ra,92(sp)
 38c:	05312623          	sw	s3,76(sp)
 390:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 394:	520000ef          	jal	8b4 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 398:	02400613          	li	a2,36
 39c:	00000593          	li	a1,0
 3a0:	01c10513          	add	a0,sp,28
 3a4:	434000ef          	jal	7d8 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 3a8:	ffe90713          	add	a4,s2,-2
 3ac:	00e00793          	li	a5,14
 3b0:	03f10993          	add	s3,sp,63
 3b4:	02e7f463          	bgeu	a5,a4,3dc <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 3b8:	00040023          	sb	zero,0(s0)
}
 3bc:	05c12083          	lw	ra,92(sp)
 3c0:	05812403          	lw	s0,88(sp)
 3c4:	05412483          	lw	s1,84(sp)
 3c8:	05012903          	lw	s2,80(sp)
 3cc:	04c12983          	lw	s3,76(sp)
 3d0:	04812a03          	lw	s4,72(sp)
 3d4:	06010113          	add	sp,sp,96
 3d8:	00008067          	ret
    *tmp_ptr = digits[num%base];
 3dc:	00090593          	mv	a1,s2
 3e0:	00048513          	mv	a0,s1
 3e4:	750000ef          	jal	b34 <__umodsi3>
 3e8:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 3ec:	00278533          	add	a0,a5,sp
 3f0:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3f4:	00090593          	mv	a1,s2
 3f8:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 3fc:	fef98fa3          	sb	a5,-1(s3)
 400:	00048a13          	mv	s4,s1
    num /= base;
 404:	6e8000ef          	jal	aec <__hidden___udivsi3>
    tmp_ptr--;
 408:	fff98993          	add	s3,s3,-1
    num /= base;
 40c:	00050493          	mv	s1,a0
  } while (num != 0);
 410:	fd2a76e3          	bgeu	s4,s2,3dc <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 414:	00000793          	li	a5,0
 418:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 41c:	01c10713          	add	a4,sp,28
 420:	00f70733          	add	a4,a4,a5
 424:	00074703          	lbu	a4,0(a4)
 428:	00070663          	beqz	a4,434 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 42c:	00e40023          	sb	a4,0(s0)
      buffer++;
 430:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 434:	00178793          	add	a5,a5,1
 438:	fed792e3          	bne	a5,a3,41c <neorv32_aux_itoa+0xc0>
 43c:	f7dff06f          	j	3b8 <neorv32_aux_itoa+0x5c>

00000440 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 440:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 444:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 448:	00e51c63          	bne	a0,a4,460 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 44c:	fffe07b7          	lui	a5,0xfffe0
 450:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 454:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 458:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 45c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 460:	fff60737          	lui	a4,0xfff60
    return 0;
 464:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 468:	fee79ae3          	bne	a5,a4,45c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 46c:	fffe07b7          	lui	a5,0xfffe0
 470:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 474:	020007b7          	lui	a5,0x2000
 478:	fe1ff06f          	j	458 <neorv32_uart_available+0x18>

0000047c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 47c:	ff010113          	add	sp,sp,-16
 480:	00812423          	sw	s0,8(sp)
 484:	00912223          	sw	s1,4(sp)
 488:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 48c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 490:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 494:	00050493          	mv	s1,a0
 498:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 49c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 4a0:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 4a4:	648000ef          	jal	aec <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 4a8:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 4ac:	3fe00693          	li	a3,1022
 4b0:	04a6e663          	bltu	a3,a0,4fc <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 4b4:	fff50793          	add	a5,a0,-1
 4b8:	000106b7          	lui	a3,0x10
 4bc:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 4c0:	00679793          	sll	a5,a5,0x6
 4c4:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4c8:	07c006b7          	lui	a3,0x7c00
 4cc:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4d0:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4d4:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4d8:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 4dc:	00c12083          	lw	ra,12(sp)
 4e0:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4e4:	00e7e7b3          	or	a5,a5,a4
 4e8:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 4ec:	00f4a023          	sw	a5,0(s1)
}
 4f0:	00412483          	lw	s1,4(sp)
 4f4:	01010113          	add	sp,sp,16
 4f8:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 4fc:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 500:	ffd7f793          	and	a5,a5,-3
 504:	00079863          	bnez	a5,514 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 508:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 50c:	00170713          	add	a4,a4,1
 510:	fa1ff06f          	j	4b0 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 514:	00155513          	srl	a0,a0,0x1
 518:	ff5ff06f          	j	50c <neorv32_uart_setup+0x90>

0000051c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 51c:	00052783          	lw	a5,0(a0)
 520:	00a79713          	sll	a4,a5,0xa
 524:	fe075ce3          	bgez	a4,51c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 528:	00b52223          	sw	a1,4(a0)
}
 52c:	00008067          	ret

00000530 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 530:	fe010113          	add	sp,sp,-32
 534:	00812c23          	sw	s0,24(sp)
 538:	00912a23          	sw	s1,20(sp)
 53c:	01312623          	sw	s3,12(sp)
 540:	00112e23          	sw	ra,28(sp)
 544:	01212823          	sw	s2,16(sp)
 548:	00050493          	mv	s1,a0
 54c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 550:	00a00993          	li	s3,10
  while ((c = *s++)) {
 554:	00044903          	lbu	s2,0(s0)
 558:	00140413          	add	s0,s0,1
 55c:	02091063          	bnez	s2,57c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 560:	01c12083          	lw	ra,28(sp)
 564:	01812403          	lw	s0,24(sp)
 568:	01412483          	lw	s1,20(sp)
 56c:	01012903          	lw	s2,16(sp)
 570:	00c12983          	lw	s3,12(sp)
 574:	02010113          	add	sp,sp,32
 578:	00008067          	ret
    if (c == '\n') {
 57c:	01391863          	bne	s2,s3,58c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 580:	00d00593          	li	a1,13
 584:	00048513          	mv	a0,s1
 588:	f95ff0ef          	jal	51c <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 58c:	00090593          	mv	a1,s2
 590:	00048513          	mv	a0,s1
 594:	f89ff0ef          	jal	51c <neorv32_uart_putc>
 598:	fbdff06f          	j	554 <neorv32_uart_puts+0x24>

0000059c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 59c:	f9010113          	add	sp,sp,-112
 5a0:	06812423          	sw	s0,104(sp)
 5a4:	06912223          	sw	s1,100(sp)
 5a8:	07212023          	sw	s2,96(sp)
 5ac:	05312e23          	sw	s3,92(sp)
 5b0:	00050493          	mv	s1,a0
 5b4:	00058913          	mv	s2,a1
 5b8:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 5bc:	00000593          	li	a1,0
 5c0:	02400613          	li	a2,36
 5c4:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 5c8:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 5cc:	05412c23          	sw	s4,88(sp)
 5d0:	05512a23          	sw	s5,84(sp)
 5d4:	05712623          	sw	s7,76(sp)
 5d8:	05812423          	sw	s8,72(sp)
 5dc:	05912223          	sw	s9,68(sp)
 5e0:	05a12023          	sw	s10,64(sp)
 5e4:	06112623          	sw	ra,108(sp)
 5e8:	05612823          	sw	s6,80(sp)
 5ec:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 5f0:	02500b93          	li	s7,37
    string_buf[i] = 0;
 5f4:	1e4000ef          	jal	7d8 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 5f8:	00a00c13          	li	s8,10
      c = tolower(*format++);
 5fc:	c3598993          	add	s3,s3,-971 # c35 <_ctype_+0x1>
 600:	00100c93          	li	s9,1
      switch (c) {
 604:	07000a13          	li	s4,112
 608:	07500d13          	li	s10,117
 60c:	06300a93          	li	s5,99
  while ((c = *format++)) {
 610:	00094d83          	lbu	s11,0(s2)
 614:	040d9063          	bnez	s11,654 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 618:	06c12083          	lw	ra,108(sp)
 61c:	06812403          	lw	s0,104(sp)
 620:	06412483          	lw	s1,100(sp)
 624:	06012903          	lw	s2,96(sp)
 628:	05c12983          	lw	s3,92(sp)
 62c:	05812a03          	lw	s4,88(sp)
 630:	05412a83          	lw	s5,84(sp)
 634:	05012b03          	lw	s6,80(sp)
 638:	04c12b83          	lw	s7,76(sp)
 63c:	04812c03          	lw	s8,72(sp)
 640:	04412c83          	lw	s9,68(sp)
 644:	04012d03          	lw	s10,64(sp)
 648:	03c12d83          	lw	s11,60(sp)
 64c:	07010113          	add	sp,sp,112
 650:	00008067          	ret
    if (c == '%') {
 654:	137d9863          	bne	s11,s7,784 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 658:	00290b13          	add	s6,s2,2
 65c:	00194903          	lbu	s2,1(s2)
 660:	013907b3          	add	a5,s2,s3
 664:	0007c783          	lbu	a5,0(a5)
 668:	0037f793          	and	a5,a5,3
 66c:	01979463          	bne	a5,s9,674 <neorv32_uart_vprintf+0xd8>
 670:	02090913          	add	s2,s2,32
      switch (c) {
 674:	0ff97793          	zext.b	a5,s2
 678:	0d478863          	beq	a5,s4,748 <neorv32_uart_vprintf+0x1ac>
 67c:	06fa4c63          	blt	s4,a5,6f4 <neorv32_uart_vprintf+0x158>
 680:	09578e63          	beq	a5,s5,71c <neorv32_uart_vprintf+0x180>
 684:	02fac663          	blt	s5,a5,6b0 <neorv32_uart_vprintf+0x114>
 688:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 68c:	02500593          	li	a1,37
      switch (c) {
 690:	00e78a63          	beq	a5,a4,6a4 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 694:	02500593          	li	a1,37
 698:	00048513          	mv	a0,s1
 69c:	e81ff0ef          	jal	51c <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 6a0:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 6a4:	00048513          	mv	a0,s1
 6a8:	e75ff0ef          	jal	51c <neorv32_uart_putc>
 6ac:	0840006f          	j	730 <neorv32_uart_vprintf+0x194>
      switch (c) {
 6b0:	06400713          	li	a4,100
 6b4:	00e78663          	beq	a5,a4,6c0 <neorv32_uart_vprintf+0x124>
 6b8:	06900713          	li	a4,105
 6bc:	fce79ce3          	bne	a5,a4,694 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 6c0:	00440913          	add	s2,s0,4
 6c4:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 6c8:	00045a63          	bgez	s0,6dc <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 6cc:	02d00593          	li	a1,45
 6d0:	00048513          	mv	a0,s1
            n = -n;
 6d4:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 6d8:	e45ff0ef          	jal	51c <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 6dc:	00a00613          	li	a2,10
 6e0:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6e4:	00c10513          	add	a0,sp,12
 6e8:	c75ff0ef          	jal	35c <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 6ec:	00c10593          	add	a1,sp,12
 6f0:	0200006f          	j	710 <neorv32_uart_vprintf+0x174>
      switch (c) {
 6f4:	05a78263          	beq	a5,s10,738 <neorv32_uart_vprintf+0x19c>
 6f8:	07800713          	li	a4,120
 6fc:	04e78663          	beq	a5,a4,748 <neorv32_uart_vprintf+0x1ac>
 700:	07300713          	li	a4,115
 704:	f8e798e3          	bne	a5,a4,694 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 708:	00042583          	lw	a1,0(s0)
 70c:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 710:	00048513          	mv	a0,s1
 714:	e1dff0ef          	jal	530 <neorv32_uart_puts>
          break;
 718:	0140006f          	j	72c <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 71c:	00044583          	lbu	a1,0(s0)
 720:	00048513          	mv	a0,s1
 724:	00440913          	add	s2,s0,4
 728:	df5ff0ef          	jal	51c <neorv32_uart_putc>
 72c:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 730:	000b0913          	mv	s2,s6
 734:	eddff06f          	j	610 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 738:	00042583          	lw	a1,0(s0)
 73c:	00440913          	add	s2,s0,4
 740:	00a00613          	li	a2,10
 744:	fa1ff06f          	j	6e4 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 748:	00042583          	lw	a1,0(s0)
 74c:	01000613          	li	a2,16
 750:	00c10513          	add	a0,sp,12
 754:	c09ff0ef          	jal	35c <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 758:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 75c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 760:	2f8000ef          	jal	a58 <strlen>
 764:	00800413          	li	s0,8
 768:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 76c:	f80400e3          	beqz	s0,6ec <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 770:	03000593          	li	a1,48
 774:	00048513          	mv	a0,s1
 778:	da5ff0ef          	jal	51c <neorv32_uart_putc>
 77c:	fff40413          	add	s0,s0,-1
 780:	fedff06f          	j	76c <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 784:	018d9863          	bne	s11,s8,794 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 788:	00d00593          	li	a1,13
 78c:	00048513          	mv	a0,s1
 790:	d8dff0ef          	jal	51c <neorv32_uart_putc>
  while ((c = *format++)) {
 794:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 798:	000d8593          	mv	a1,s11
 79c:	f09ff06f          	j	6a4 <neorv32_uart_vprintf+0x108>

000007a0 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 7a0:	fc010113          	add	sp,sp,-64
 7a4:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 7a8:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 7ac:	00112e23          	sw	ra,28(sp)
 7b0:	02d12623          	sw	a3,44(sp)
 7b4:	02e12823          	sw	a4,48(sp)
 7b8:	02f12a23          	sw	a5,52(sp)
 7bc:	03012c23          	sw	a6,56(sp)
 7c0:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 7c4:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 7c8:	dd5ff0ef          	jal	59c <neorv32_uart_vprintf>
  va_end(args);
}
 7cc:	01c12083          	lw	ra,28(sp)
 7d0:	04010113          	add	sp,sp,64
 7d4:	00008067          	ret

000007d8 <memset>:
 7d8:	00f00313          	li	t1,15
 7dc:	00050713          	mv	a4,a0
 7e0:	02c37e63          	bgeu	t1,a2,81c <memset+0x44>
 7e4:	00f77793          	and	a5,a4,15
 7e8:	0a079063          	bnez	a5,888 <memset+0xb0>
 7ec:	08059263          	bnez	a1,870 <memset+0x98>
 7f0:	ff067693          	and	a3,a2,-16
 7f4:	00f67613          	and	a2,a2,15
 7f8:	00e686b3          	add	a3,a3,a4
 7fc:	00b72023          	sw	a1,0(a4)
 800:	00b72223          	sw	a1,4(a4)
 804:	00b72423          	sw	a1,8(a4)
 808:	00b72623          	sw	a1,12(a4)
 80c:	01070713          	add	a4,a4,16
 810:	fed766e3          	bltu	a4,a3,7fc <memset+0x24>
 814:	00061463          	bnez	a2,81c <memset+0x44>
 818:	00008067          	ret
 81c:	40c306b3          	sub	a3,t1,a2
 820:	00269693          	sll	a3,a3,0x2
 824:	00000297          	auipc	t0,0x0
 828:	005686b3          	add	a3,a3,t0
 82c:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 830:	00b70723          	sb	a1,14(a4)
 834:	00b706a3          	sb	a1,13(a4)
 838:	00b70623          	sb	a1,12(a4)
 83c:	00b705a3          	sb	a1,11(a4)
 840:	00b70523          	sb	a1,10(a4)
 844:	00b704a3          	sb	a1,9(a4)
 848:	00b70423          	sb	a1,8(a4)
 84c:	00b703a3          	sb	a1,7(a4)
 850:	00b70323          	sb	a1,6(a4)
 854:	00b702a3          	sb	a1,5(a4)
 858:	00b70223          	sb	a1,4(a4)
 85c:	00b701a3          	sb	a1,3(a4)
 860:	00b70123          	sb	a1,2(a4)
 864:	00b700a3          	sb	a1,1(a4)
 868:	00b70023          	sb	a1,0(a4)
 86c:	00008067          	ret
 870:	0ff5f593          	zext.b	a1,a1
 874:	00859693          	sll	a3,a1,0x8
 878:	00d5e5b3          	or	a1,a1,a3
 87c:	01059693          	sll	a3,a1,0x10
 880:	00d5e5b3          	or	a1,a1,a3
 884:	f6dff06f          	j	7f0 <memset+0x18>
 888:	00279693          	sll	a3,a5,0x2
 88c:	00000297          	auipc	t0,0x0
 890:	005686b3          	add	a3,a3,t0
 894:	00008293          	mv	t0,ra
 898:	fa0680e7          	jalr	-96(a3)
 89c:	00028093          	mv	ra,t0
 8a0:	ff078793          	add	a5,a5,-16
 8a4:	40f70733          	sub	a4,a4,a5
 8a8:	00f60633          	add	a2,a2,a5
 8ac:	f6c378e3          	bgeu	t1,a2,81c <memset+0x44>
 8b0:	f3dff06f          	j	7ec <memset+0x14>

000008b4 <memcpy>:
 8b4:	00a5c7b3          	xor	a5,a1,a0
 8b8:	0037f793          	and	a5,a5,3
 8bc:	00c508b3          	add	a7,a0,a2
 8c0:	06079463          	bnez	a5,928 <memcpy+0x74>
 8c4:	00300793          	li	a5,3
 8c8:	06c7f063          	bgeu	a5,a2,928 <memcpy+0x74>
 8cc:	00357793          	and	a5,a0,3
 8d0:	00050713          	mv	a4,a0
 8d4:	06079a63          	bnez	a5,948 <memcpy+0x94>
 8d8:	ffc8f613          	and	a2,a7,-4
 8dc:	40e606b3          	sub	a3,a2,a4
 8e0:	02000793          	li	a5,32
 8e4:	08d7ce63          	blt	a5,a3,980 <memcpy+0xcc>
 8e8:	00058693          	mv	a3,a1
 8ec:	00070793          	mv	a5,a4
 8f0:	02c77863          	bgeu	a4,a2,920 <memcpy+0x6c>
 8f4:	0006a803          	lw	a6,0(a3)
 8f8:	00478793          	add	a5,a5,4
 8fc:	00468693          	add	a3,a3,4
 900:	ff07ae23          	sw	a6,-4(a5)
 904:	fec7e8e3          	bltu	a5,a2,8f4 <memcpy+0x40>
 908:	fff60793          	add	a5,a2,-1
 90c:	40e787b3          	sub	a5,a5,a4
 910:	ffc7f793          	and	a5,a5,-4
 914:	00478793          	add	a5,a5,4
 918:	00f70733          	add	a4,a4,a5
 91c:	00f585b3          	add	a1,a1,a5
 920:	01176863          	bltu	a4,a7,930 <memcpy+0x7c>
 924:	00008067          	ret
 928:	00050713          	mv	a4,a0
 92c:	05157863          	bgeu	a0,a7,97c <memcpy+0xc8>
 930:	0005c783          	lbu	a5,0(a1)
 934:	00170713          	add	a4,a4,1
 938:	00158593          	add	a1,a1,1
 93c:	fef70fa3          	sb	a5,-1(a4)
 940:	fee898e3          	bne	a7,a4,930 <memcpy+0x7c>
 944:	00008067          	ret
 948:	0005c683          	lbu	a3,0(a1)
 94c:	00170713          	add	a4,a4,1
 950:	00377793          	and	a5,a4,3
 954:	fed70fa3          	sb	a3,-1(a4)
 958:	00158593          	add	a1,a1,1
 95c:	f6078ee3          	beqz	a5,8d8 <memcpy+0x24>
 960:	0005c683          	lbu	a3,0(a1)
 964:	00170713          	add	a4,a4,1
 968:	00377793          	and	a5,a4,3
 96c:	fed70fa3          	sb	a3,-1(a4)
 970:	00158593          	add	a1,a1,1
 974:	fc079ae3          	bnez	a5,948 <memcpy+0x94>
 978:	f61ff06f          	j	8d8 <memcpy+0x24>
 97c:	00008067          	ret
 980:	ff010113          	add	sp,sp,-16
 984:	00812623          	sw	s0,12(sp)
 988:	02000413          	li	s0,32
 98c:	0005a383          	lw	t2,0(a1)
 990:	0045a283          	lw	t0,4(a1)
 994:	0085af83          	lw	t6,8(a1)
 998:	00c5af03          	lw	t5,12(a1)
 99c:	0105ae83          	lw	t4,16(a1)
 9a0:	0145ae03          	lw	t3,20(a1)
 9a4:	0185a303          	lw	t1,24(a1)
 9a8:	01c5a803          	lw	a6,28(a1)
 9ac:	0205a683          	lw	a3,32(a1)
 9b0:	02470713          	add	a4,a4,36
 9b4:	40e607b3          	sub	a5,a2,a4
 9b8:	fc772e23          	sw	t2,-36(a4)
 9bc:	fe572023          	sw	t0,-32(a4)
 9c0:	fff72223          	sw	t6,-28(a4)
 9c4:	ffe72423          	sw	t5,-24(a4)
 9c8:	ffd72623          	sw	t4,-20(a4)
 9cc:	ffc72823          	sw	t3,-16(a4)
 9d0:	fe672a23          	sw	t1,-12(a4)
 9d4:	ff072c23          	sw	a6,-8(a4)
 9d8:	fed72e23          	sw	a3,-4(a4)
 9dc:	02458593          	add	a1,a1,36
 9e0:	faf446e3          	blt	s0,a5,98c <memcpy+0xd8>
 9e4:	00058693          	mv	a3,a1
 9e8:	00070793          	mv	a5,a4
 9ec:	02c77863          	bgeu	a4,a2,a1c <memcpy+0x168>
 9f0:	0006a803          	lw	a6,0(a3)
 9f4:	00478793          	add	a5,a5,4
 9f8:	00468693          	add	a3,a3,4
 9fc:	ff07ae23          	sw	a6,-4(a5)
 a00:	fec7e8e3          	bltu	a5,a2,9f0 <memcpy+0x13c>
 a04:	fff60793          	add	a5,a2,-1
 a08:	40e787b3          	sub	a5,a5,a4
 a0c:	ffc7f793          	and	a5,a5,-4
 a10:	00478793          	add	a5,a5,4
 a14:	00f70733          	add	a4,a4,a5
 a18:	00f585b3          	add	a1,a1,a5
 a1c:	01176863          	bltu	a4,a7,a2c <memcpy+0x178>
 a20:	00c12403          	lw	s0,12(sp)
 a24:	01010113          	add	sp,sp,16
 a28:	00008067          	ret
 a2c:	0005c783          	lbu	a5,0(a1)
 a30:	00170713          	add	a4,a4,1
 a34:	00158593          	add	a1,a1,1
 a38:	fef70fa3          	sb	a5,-1(a4)
 a3c:	fee882e3          	beq	a7,a4,a20 <memcpy+0x16c>
 a40:	0005c783          	lbu	a5,0(a1)
 a44:	00170713          	add	a4,a4,1
 a48:	00158593          	add	a1,a1,1
 a4c:	fef70fa3          	sb	a5,-1(a4)
 a50:	fce89ee3          	bne	a7,a4,a2c <memcpy+0x178>
 a54:	fcdff06f          	j	a20 <memcpy+0x16c>

00000a58 <strlen>:
 a58:	00357793          	and	a5,a0,3
 a5c:	00050713          	mv	a4,a0
 a60:	04079c63          	bnez	a5,ab8 <strlen+0x60>
 a64:	7f7f86b7          	lui	a3,0x7f7f8
 a68:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 a6c:	fff00593          	li	a1,-1
 a70:	00072603          	lw	a2,0(a4)
 a74:	00470713          	add	a4,a4,4
 a78:	00d677b3          	and	a5,a2,a3
 a7c:	00d787b3          	add	a5,a5,a3
 a80:	00c7e7b3          	or	a5,a5,a2
 a84:	00d7e7b3          	or	a5,a5,a3
 a88:	feb784e3          	beq	a5,a1,a70 <strlen+0x18>
 a8c:	ffc74683          	lbu	a3,-4(a4)
 a90:	40a707b3          	sub	a5,a4,a0
 a94:	04068463          	beqz	a3,adc <strlen+0x84>
 a98:	ffd74683          	lbu	a3,-3(a4)
 a9c:	02068c63          	beqz	a3,ad4 <strlen+0x7c>
 aa0:	ffe74503          	lbu	a0,-2(a4)
 aa4:	00a03533          	snez	a0,a0
 aa8:	00f50533          	add	a0,a0,a5
 aac:	ffe50513          	add	a0,a0,-2
 ab0:	00008067          	ret
 ab4:	fa0688e3          	beqz	a3,a64 <strlen+0xc>
 ab8:	00074783          	lbu	a5,0(a4)
 abc:	00170713          	add	a4,a4,1
 ac0:	00377693          	and	a3,a4,3
 ac4:	fe0798e3          	bnez	a5,ab4 <strlen+0x5c>
 ac8:	40a70733          	sub	a4,a4,a0
 acc:	fff70513          	add	a0,a4,-1
 ad0:	00008067          	ret
 ad4:	ffd78513          	add	a0,a5,-3
 ad8:	00008067          	ret
 adc:	ffc78513          	add	a0,a5,-4
 ae0:	00008067          	ret

00000ae4 <__divsi3>:
 ae4:	06054063          	bltz	a0,b44 <__umodsi3+0x10>
 ae8:	0605c663          	bltz	a1,b54 <__umodsi3+0x20>

00000aec <__hidden___udivsi3>:
 aec:	00058613          	mv	a2,a1
 af0:	00050593          	mv	a1,a0
 af4:	fff00513          	li	a0,-1
 af8:	02060c63          	beqz	a2,b30 <__hidden___udivsi3+0x44>
 afc:	00100693          	li	a3,1
 b00:	00b67a63          	bgeu	a2,a1,b14 <__hidden___udivsi3+0x28>
 b04:	00c05863          	blez	a2,b14 <__hidden___udivsi3+0x28>
 b08:	00161613          	sll	a2,a2,0x1
 b0c:	00169693          	sll	a3,a3,0x1
 b10:	feb66ae3          	bltu	a2,a1,b04 <__hidden___udivsi3+0x18>
 b14:	00000513          	li	a0,0
 b18:	00c5e663          	bltu	a1,a2,b24 <__hidden___udivsi3+0x38>
 b1c:	40c585b3          	sub	a1,a1,a2
 b20:	00d56533          	or	a0,a0,a3
 b24:	0016d693          	srl	a3,a3,0x1
 b28:	00165613          	srl	a2,a2,0x1
 b2c:	fe0696e3          	bnez	a3,b18 <__hidden___udivsi3+0x2c>
 b30:	00008067          	ret

00000b34 <__umodsi3>:
 b34:	00008293          	mv	t0,ra
 b38:	fb5ff0ef          	jal	aec <__hidden___udivsi3>
 b3c:	00058513          	mv	a0,a1
 b40:	00028067          	jr	t0 # 88c <memset+0xb4>
 b44:	40a00533          	neg	a0,a0
 b48:	00b04863          	bgtz	a1,b58 <__umodsi3+0x24>
 b4c:	40b005b3          	neg	a1,a1
 b50:	f9dff06f          	j	aec <__hidden___udivsi3>
 b54:	40b005b3          	neg	a1,a1
 b58:	00008293          	mv	t0,ra
 b5c:	f91ff0ef          	jal	aec <__hidden___udivsi3>
 b60:	40a00533          	neg	a0,a0
 b64:	00028067          	jr	t0

00000b68 <__modsi3>:
 b68:	00008293          	mv	t0,ra
 b6c:	0005ca63          	bltz	a1,b80 <__modsi3+0x18>
 b70:	00054c63          	bltz	a0,b88 <__modsi3+0x20>
 b74:	f79ff0ef          	jal	aec <__hidden___udivsi3>
 b78:	00058513          	mv	a0,a1
 b7c:	00028067          	jr	t0
 b80:	40b005b3          	neg	a1,a1
 b84:	fe0558e3          	bgez	a0,b74 <__modsi3+0xc>
 b88:	40a00533          	neg	a0,a0
 b8c:	f61ff0ef          	jal	aec <__hidden___udivsi3>
 b90:	40b00533          	neg	a0,a1
 b94:	00028067          	jr	t0
