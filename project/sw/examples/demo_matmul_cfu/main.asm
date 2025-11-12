
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0xae8>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	ce438393          	add	t2,t2,-796 # d18 <__RODATA_END__>
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
 110:	a1c40413          	add	s0,s0,-1508 # b28 <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	a1448493          	add	s1,s1,-1516 # b28 <__etext>

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
 170:	9bc40413          	add	s0,s0,-1604 # b28 <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	9b448493          	add	s1,s1,-1612 # b28 <__etext>

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
 * Main program
 **********************************************************************/
int main() {

  // Setup UART for printing
  neorv32_uart0_setup(19200, 0);
 1dc:	000055b7          	lui	a1,0x5
int main() {
 1e0:	fe010113          	add	sp,sp,-32
  neorv32_uart0_setup(19200, 0);
 1e4:	00000613          	li	a2,0
 1e8:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 1ec:	fff50537          	lui	a0,0xfff50
int main() {
 1f0:	00112e23          	sw	ra,28(sp)
 1f4:	00812c23          	sw	s0,24(sp)
 1f8:	00912a23          	sw	s1,20(sp)
 1fc:	01212823          	sw	s2,16(sp)
 200:	01312623          	sw	s3,12(sp)
 204:	01412423          	sw	s4,8(sp)
  neorv32_uart0_setup(19200, 0);
 208:	204000ef          	jal	40c <neorv32_uart_setup>
  neorv32_uart0_printf("\n--- Matrix Multiplication CFU Test ---\n");
 20c:	000015b7          	lui	a1,0x1
 210:	b2858593          	add	a1,a1,-1240 # b28 <__etext>
 214:	fff50537          	lui	a0,0xfff50
 218:	518000ef          	jal	730 <neorv32_uart_printf>

  // Check if CFU is available
  if (!neorv32_cpu_cfu_available()) {
 21c:	1e4000ef          	jal	400 <neorv32_cpu_cfu_available>
 220:	02051c63          	bnez	a0,258 <main+0x7c>
    neorv32_uart0_printf("ERROR: No CFU available!\n");
 224:	000015b7          	lui	a1,0x1
 228:	fff50537          	lui	a0,0xfff50
 22c:	b5458593          	add	a1,a1,-1196 # b54 <__etext+0x2c>
 230:	500000ef          	jal	730 <neorv32_uart_printf>
    return -1;
 234:	fff00513          	li	a0,-1
  neorv32_uart0_printf("SW Dot Product  = %u\n", res_sw);
  neorv32_uart0_printf("SW Cycles       = %u\n", (uint32_t)(end_cycles - start_cycles));
  neorv32_uart0_printf("SW Instructions = %u\n", (uint32_t)(end_instrs - start_instrs));

  return 0;
}
 238:	01c12083          	lw	ra,28(sp)
 23c:	01812403          	lw	s0,24(sp)
 240:	01412483          	lw	s1,20(sp)
 244:	01012903          	lw	s2,16(sp)
 248:	00c12983          	lw	s3,12(sp)
 24c:	00812a03          	lw	s4,8(sp)
 250:	02010113          	add	sp,sp,32
 254:	00008067          	ret
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 258:	00000413          	li	s0,0
 25c:	c0041073          	csrw	cycle,s0
 260:	c0241073          	csrw	instret,s0
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 264:	c00029f3          	rdcycle	s3
 268:	c02024f3          	rdinstret	s1
  return neorv32_cfu_r3_instr(CFU_FUNCT7_DOT, CFU_FUNCT3_DOT, packed_row, packed_col);
 26c:	04030637          	lui	a2,0x4030
 270:	010107b7          	lui	a5,0x1010
 274:	20160613          	add	a2,a2,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
 278:	10178793          	add	a5,a5,257 # 1010101 <__neorv32_ram_size+0xf90101>
 27c:	02f6060b          	.word	0x02f6060b
 280:	c0002a73          	rdcycle	s4
 284:	c0202973          	rdinstret	s2
  neorv32_uart0_printf("CFU Dot Product = %u\n", res_hw);
 288:	000015b7          	lui	a1,0x1
 28c:	b7058593          	add	a1,a1,-1168 # b70 <__etext+0x48>
 290:	fff50537          	lui	a0,0xfff50
 294:	49c000ef          	jal	730 <neorv32_uart_printf>
  neorv32_uart0_printf("CFU Cycles      = %u\n", (uint32_t)(end_cycles - start_cycles));
 298:	000015b7          	lui	a1,0x1
 29c:	413a0633          	sub	a2,s4,s3
 2a0:	b8858593          	add	a1,a1,-1144 # b88 <__etext+0x60>
 2a4:	fff50537          	lui	a0,0xfff50
 2a8:	488000ef          	jal	730 <neorv32_uart_printf>
  neorv32_uart0_printf("CFU Instructions= %u\n\n", (uint32_t)(end_instrs - start_instrs));
 2ac:	000015b7          	lui	a1,0x1
 2b0:	40990633          	sub	a2,s2,s1
 2b4:	ba058593          	add	a1,a1,-1120 # ba0 <__etext+0x78>
 2b8:	fff50537          	lui	a0,0xfff50
 2bc:	474000ef          	jal	730 <neorv32_uart_printf>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 2c0:	c0041073          	csrw	cycle,s0
 2c4:	c0241073          	csrw	instret,s0
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 2c8:	c0002973          	rdcycle	s2
 2cc:	c0202473          	rdinstret	s0
 2d0:	c00029f3          	rdcycle	s3
 2d4:	c02024f3          	rdinstret	s1
  neorv32_uart0_printf("SW Dot Product  = %u\n", res_sw);
 2d8:	000015b7          	lui	a1,0x1
 2dc:	00a00613          	li	a2,10
 2e0:	bb858593          	add	a1,a1,-1096 # bb8 <__etext+0x90>
 2e4:	fff50537          	lui	a0,0xfff50
 2e8:	448000ef          	jal	730 <neorv32_uart_printf>
  neorv32_uart0_printf("SW Cycles       = %u\n", (uint32_t)(end_cycles - start_cycles));
 2ec:	000015b7          	lui	a1,0x1
 2f0:	41298633          	sub	a2,s3,s2
 2f4:	bd058593          	add	a1,a1,-1072 # bd0 <__etext+0xa8>
 2f8:	fff50537          	lui	a0,0xfff50
 2fc:	434000ef          	jal	730 <neorv32_uart_printf>
  neorv32_uart0_printf("SW Instructions = %u\n", (uint32_t)(end_instrs - start_instrs));
 300:	000015b7          	lui	a1,0x1
 304:	fff50537          	lui	a0,0xfff50
 308:	40848633          	sub	a2,s1,s0
 30c:	be858593          	add	a1,a1,-1048 # be8 <__etext+0xc0>
 310:	420000ef          	jal	730 <neorv32_uart_printf>
  return 0;
 314:	00000513          	li	a0,0
 318:	f21ff06f          	j	238 <main+0x5c>

0000031c <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 31c:	fa010113          	add	sp,sp,-96
 320:	04912a23          	sw	s1,84(sp)
 324:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 328:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 32c:	04812c23          	sw	s0,88(sp)
 330:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 334:	c0058593          	add	a1,a1,-1024 # c00 <__etext+0xd8>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 338:	00060913          	mv	s2,a2
 33c:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 340:	01000613          	li	a2,16
 344:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 348:	04112e23          	sw	ra,92(sp)
 34c:	05312623          	sw	s3,76(sp)
 350:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 354:	4f0000ef          	jal	844 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 358:	02400613          	li	a2,36
 35c:	00000593          	li	a1,0
 360:	01c10513          	add	a0,sp,28
 364:	404000ef          	jal	768 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 368:	ffe90713          	add	a4,s2,-2
 36c:	00e00793          	li	a5,14
 370:	03f10993          	add	s3,sp,63
 374:	02e7f463          	bgeu	a5,a4,39c <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 378:	00040023          	sb	zero,0(s0)
}
 37c:	05c12083          	lw	ra,92(sp)
 380:	05812403          	lw	s0,88(sp)
 384:	05412483          	lw	s1,84(sp)
 388:	05012903          	lw	s2,80(sp)
 38c:	04c12983          	lw	s3,76(sp)
 390:	04812a03          	lw	s4,72(sp)
 394:	06010113          	add	sp,sp,96
 398:	00008067          	ret
    *tmp_ptr = digits[num%base];
 39c:	00090593          	mv	a1,s2
 3a0:	00048513          	mv	a0,s1
 3a4:	720000ef          	jal	ac4 <__umodsi3>
 3a8:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 3ac:	00278533          	add	a0,a5,sp
 3b0:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3b4:	00090593          	mv	a1,s2
 3b8:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 3bc:	fef98fa3          	sb	a5,-1(s3)
 3c0:	00048a13          	mv	s4,s1
    num /= base;
 3c4:	6b8000ef          	jal	a7c <__hidden___udivsi3>
    tmp_ptr--;
 3c8:	fff98993          	add	s3,s3,-1
    num /= base;
 3cc:	00050493          	mv	s1,a0
  } while (num != 0);
 3d0:	fd2a76e3          	bgeu	s4,s2,39c <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 3d4:	00000793          	li	a5,0
 3d8:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 3dc:	01c10713          	add	a4,sp,28
 3e0:	00f70733          	add	a4,a4,a5
 3e4:	00074703          	lbu	a4,0(a4)
 3e8:	00070663          	beqz	a4,3f4 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 3ec:	00e40023          	sb	a4,0(s0)
      buffer++;
 3f0:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 3f4:	00178793          	add	a5,a5,1
 3f8:	fed792e3          	bne	a5,a3,3dc <neorv32_aux_itoa+0xc0>
 3fc:	f7dff06f          	j	378 <neorv32_aux_itoa+0x5c>

00000400 <neorv32_cpu_cfu_available>:
 400:	fc002573          	csrr	a0,0xfc0
 **************************************************************************/
int neorv32_cpu_cfu_available(void) {

  // this is an ISA extension - not a SoC module
  return (int)(neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZXCFU));
}
 404:	00857513          	and	a0,a0,8
 408:	00008067          	ret

0000040c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 40c:	ff010113          	add	sp,sp,-16
 410:	00812423          	sw	s0,8(sp)
 414:	00912223          	sw	s1,4(sp)
 418:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 41c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 420:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 424:	00050493          	mv	s1,a0
 428:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 42c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 430:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 434:	648000ef          	jal	a7c <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 438:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 43c:	3fe00693          	li	a3,1022
 440:	04a6e663          	bltu	a3,a0,48c <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 444:	fff50793          	add	a5,a0,-1
 448:	000106b7          	lui	a3,0x10
 44c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 450:	00679793          	sll	a5,a5,0x6
 454:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 458:	07c006b7          	lui	a3,0x7c00
 45c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 460:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 464:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 468:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 46c:	00c12083          	lw	ra,12(sp)
 470:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 474:	00e7e7b3          	or	a5,a5,a4
 478:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 47c:	00f4a023          	sw	a5,0(s1)
}
 480:	00412483          	lw	s1,4(sp)
 484:	01010113          	add	sp,sp,16
 488:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 48c:	ffe70793          	add	a5,a4,-2
 490:	ffd7f793          	and	a5,a5,-3
 494:	00079863          	bnez	a5,4a4 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 498:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 49c:	00170713          	add	a4,a4,1
 4a0:	fa1ff06f          	j	440 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 4a4:	00155513          	srl	a0,a0,0x1
 4a8:	ff5ff06f          	j	49c <neorv32_uart_setup+0x90>

000004ac <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 4ac:	00052783          	lw	a5,0(a0)
 4b0:	00a79713          	sll	a4,a5,0xa
 4b4:	fe075ce3          	bgez	a4,4ac <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 4b8:	00b52223          	sw	a1,4(a0)
}
 4bc:	00008067          	ret

000004c0 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 4c0:	fe010113          	add	sp,sp,-32
 4c4:	00812c23          	sw	s0,24(sp)
 4c8:	00912a23          	sw	s1,20(sp)
 4cc:	01312623          	sw	s3,12(sp)
 4d0:	00112e23          	sw	ra,28(sp)
 4d4:	01212823          	sw	s2,16(sp)
 4d8:	00050493          	mv	s1,a0
 4dc:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 4e0:	00a00993          	li	s3,10
  while ((c = *s++)) {
 4e4:	00044903          	lbu	s2,0(s0)
 4e8:	00140413          	add	s0,s0,1
 4ec:	02091063          	bnez	s2,50c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 4f0:	01c12083          	lw	ra,28(sp)
 4f4:	01812403          	lw	s0,24(sp)
 4f8:	01412483          	lw	s1,20(sp)
 4fc:	01012903          	lw	s2,16(sp)
 500:	00c12983          	lw	s3,12(sp)
 504:	02010113          	add	sp,sp,32
 508:	00008067          	ret
    if (c == '\n') {
 50c:	01391863          	bne	s2,s3,51c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 510:	00d00593          	li	a1,13
 514:	00048513          	mv	a0,s1
 518:	f95ff0ef          	jal	4ac <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 51c:	00090593          	mv	a1,s2
 520:	00048513          	mv	a0,s1
 524:	f89ff0ef          	jal	4ac <neorv32_uart_putc>
 528:	fbdff06f          	j	4e4 <neorv32_uart_puts+0x24>

0000052c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 52c:	f9010113          	add	sp,sp,-112
 530:	06812423          	sw	s0,104(sp)
 534:	06912223          	sw	s1,100(sp)
 538:	07212023          	sw	s2,96(sp)
 53c:	05312e23          	sw	s3,92(sp)
 540:	00050493          	mv	s1,a0
 544:	00058913          	mv	s2,a1
 548:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 54c:	00000593          	li	a1,0
 550:	02400613          	li	a2,36
 554:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 558:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 55c:	05412c23          	sw	s4,88(sp)
 560:	05512a23          	sw	s5,84(sp)
 564:	05712623          	sw	s7,76(sp)
 568:	05812423          	sw	s8,72(sp)
 56c:	05912223          	sw	s9,68(sp)
 570:	05a12023          	sw	s10,64(sp)
 574:	06112623          	sw	ra,108(sp)
 578:	05612823          	sw	s6,80(sp)
 57c:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 580:	02500b93          	li	s7,37
    string_buf[i] = 0;
 584:	1e4000ef          	jal	768 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 588:	00a00c13          	li	s8,10
      c = tolower(*format++);
 58c:	c1598993          	add	s3,s3,-1003 # c15 <_ctype_+0x1>
 590:	00100c93          	li	s9,1
      switch (c) {
 594:	07000a13          	li	s4,112
 598:	07500d13          	li	s10,117
 59c:	06300a93          	li	s5,99
  while ((c = *format++)) {
 5a0:	00094d83          	lbu	s11,0(s2)
 5a4:	040d9063          	bnez	s11,5e4 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 5a8:	06c12083          	lw	ra,108(sp)
 5ac:	06812403          	lw	s0,104(sp)
 5b0:	06412483          	lw	s1,100(sp)
 5b4:	06012903          	lw	s2,96(sp)
 5b8:	05c12983          	lw	s3,92(sp)
 5bc:	05812a03          	lw	s4,88(sp)
 5c0:	05412a83          	lw	s5,84(sp)
 5c4:	05012b03          	lw	s6,80(sp)
 5c8:	04c12b83          	lw	s7,76(sp)
 5cc:	04812c03          	lw	s8,72(sp)
 5d0:	04412c83          	lw	s9,68(sp)
 5d4:	04012d03          	lw	s10,64(sp)
 5d8:	03c12d83          	lw	s11,60(sp)
 5dc:	07010113          	add	sp,sp,112
 5e0:	00008067          	ret
    if (c == '%') {
 5e4:	137d9863          	bne	s11,s7,714 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 5e8:	00290b13          	add	s6,s2,2
 5ec:	00194903          	lbu	s2,1(s2)
 5f0:	013907b3          	add	a5,s2,s3
 5f4:	0007c783          	lbu	a5,0(a5)
 5f8:	0037f793          	and	a5,a5,3
 5fc:	01979463          	bne	a5,s9,604 <neorv32_uart_vprintf+0xd8>
 600:	02090913          	add	s2,s2,32
      switch (c) {
 604:	0ff97793          	zext.b	a5,s2
 608:	0d478863          	beq	a5,s4,6d8 <neorv32_uart_vprintf+0x1ac>
 60c:	06fa4c63          	blt	s4,a5,684 <neorv32_uart_vprintf+0x158>
 610:	09578e63          	beq	a5,s5,6ac <neorv32_uart_vprintf+0x180>
 614:	02fac663          	blt	s5,a5,640 <neorv32_uart_vprintf+0x114>
 618:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 61c:	02500593          	li	a1,37
      switch (c) {
 620:	00e78a63          	beq	a5,a4,634 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 624:	02500593          	li	a1,37
 628:	00048513          	mv	a0,s1
 62c:	e81ff0ef          	jal	4ac <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 630:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 634:	00048513          	mv	a0,s1
 638:	e75ff0ef          	jal	4ac <neorv32_uart_putc>
 63c:	0840006f          	j	6c0 <neorv32_uart_vprintf+0x194>
      switch (c) {
 640:	06400713          	li	a4,100
 644:	00e78663          	beq	a5,a4,650 <neorv32_uart_vprintf+0x124>
 648:	06900713          	li	a4,105
 64c:	fce79ce3          	bne	a5,a4,624 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 650:	00440913          	add	s2,s0,4
 654:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 658:	00045a63          	bgez	s0,66c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 65c:	02d00593          	li	a1,45
 660:	00048513          	mv	a0,s1
            n = -n;
 664:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 668:	e45ff0ef          	jal	4ac <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 66c:	00a00613          	li	a2,10
 670:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 674:	00c10513          	add	a0,sp,12
 678:	ca5ff0ef          	jal	31c <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 67c:	00c10593          	add	a1,sp,12
 680:	0200006f          	j	6a0 <neorv32_uart_vprintf+0x174>
      switch (c) {
 684:	05a78263          	beq	a5,s10,6c8 <neorv32_uart_vprintf+0x19c>
 688:	07800713          	li	a4,120
 68c:	04e78663          	beq	a5,a4,6d8 <neorv32_uart_vprintf+0x1ac>
 690:	07300713          	li	a4,115
 694:	f8e798e3          	bne	a5,a4,624 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 698:	00042583          	lw	a1,0(s0)
 69c:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 6a0:	00048513          	mv	a0,s1
 6a4:	e1dff0ef          	jal	4c0 <neorv32_uart_puts>
          break;
 6a8:	0140006f          	j	6bc <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 6ac:	00044583          	lbu	a1,0(s0)
 6b0:	00048513          	mv	a0,s1
 6b4:	00440913          	add	s2,s0,4
 6b8:	df5ff0ef          	jal	4ac <neorv32_uart_putc>
 6bc:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 6c0:	000b0913          	mv	s2,s6
 6c4:	eddff06f          	j	5a0 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6c8:	00042583          	lw	a1,0(s0)
 6cc:	00440913          	add	s2,s0,4
 6d0:	00a00613          	li	a2,10
 6d4:	fa1ff06f          	j	674 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 6d8:	00042583          	lw	a1,0(s0)
 6dc:	01000613          	li	a2,16
 6e0:	00c10513          	add	a0,sp,12
 6e4:	c39ff0ef          	jal	31c <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 6e8:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 6ec:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 6f0:	2f8000ef          	jal	9e8 <strlen>
 6f4:	00800413          	li	s0,8
 6f8:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 6fc:	f80400e3          	beqz	s0,67c <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 700:	03000593          	li	a1,48
 704:	00048513          	mv	a0,s1
 708:	da5ff0ef          	jal	4ac <neorv32_uart_putc>
 70c:	fff40413          	add	s0,s0,-1
 710:	fedff06f          	j	6fc <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 714:	018d9863          	bne	s11,s8,724 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 718:	00d00593          	li	a1,13
 71c:	00048513          	mv	a0,s1
 720:	d8dff0ef          	jal	4ac <neorv32_uart_putc>
  while ((c = *format++)) {
 724:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 728:	000d8593          	mv	a1,s11
 72c:	f09ff06f          	j	634 <neorv32_uart_vprintf+0x108>

00000730 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 730:	fc010113          	add	sp,sp,-64
 734:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 738:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 73c:	00112e23          	sw	ra,28(sp)
 740:	02d12623          	sw	a3,44(sp)
 744:	02e12823          	sw	a4,48(sp)
 748:	02f12a23          	sw	a5,52(sp)
 74c:	03012c23          	sw	a6,56(sp)
 750:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 754:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 758:	dd5ff0ef          	jal	52c <neorv32_uart_vprintf>
  va_end(args);
}
 75c:	01c12083          	lw	ra,28(sp)
 760:	04010113          	add	sp,sp,64
 764:	00008067          	ret

00000768 <memset>:
 768:	00f00313          	li	t1,15
 76c:	00050713          	mv	a4,a0
 770:	02c37e63          	bgeu	t1,a2,7ac <memset+0x44>
 774:	00f77793          	and	a5,a4,15
 778:	0a079063          	bnez	a5,818 <memset+0xb0>
 77c:	08059263          	bnez	a1,800 <memset+0x98>
 780:	ff067693          	and	a3,a2,-16
 784:	00f67613          	and	a2,a2,15
 788:	00e686b3          	add	a3,a3,a4
 78c:	00b72023          	sw	a1,0(a4)
 790:	00b72223          	sw	a1,4(a4)
 794:	00b72423          	sw	a1,8(a4)
 798:	00b72623          	sw	a1,12(a4)
 79c:	01070713          	add	a4,a4,16
 7a0:	fed766e3          	bltu	a4,a3,78c <memset+0x24>
 7a4:	00061463          	bnez	a2,7ac <memset+0x44>
 7a8:	00008067          	ret
 7ac:	40c306b3          	sub	a3,t1,a2
 7b0:	00269693          	sll	a3,a3,0x2
 7b4:	00000297          	auipc	t0,0x0
 7b8:	005686b3          	add	a3,a3,t0
 7bc:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 7c0:	00b70723          	sb	a1,14(a4)
 7c4:	00b706a3          	sb	a1,13(a4)
 7c8:	00b70623          	sb	a1,12(a4)
 7cc:	00b705a3          	sb	a1,11(a4)
 7d0:	00b70523          	sb	a1,10(a4)
 7d4:	00b704a3          	sb	a1,9(a4)
 7d8:	00b70423          	sb	a1,8(a4)
 7dc:	00b703a3          	sb	a1,7(a4)
 7e0:	00b70323          	sb	a1,6(a4)
 7e4:	00b702a3          	sb	a1,5(a4)
 7e8:	00b70223          	sb	a1,4(a4)
 7ec:	00b701a3          	sb	a1,3(a4)
 7f0:	00b70123          	sb	a1,2(a4)
 7f4:	00b700a3          	sb	a1,1(a4)
 7f8:	00b70023          	sb	a1,0(a4)
 7fc:	00008067          	ret
 800:	0ff5f593          	zext.b	a1,a1
 804:	00859693          	sll	a3,a1,0x8
 808:	00d5e5b3          	or	a1,a1,a3
 80c:	01059693          	sll	a3,a1,0x10
 810:	00d5e5b3          	or	a1,a1,a3
 814:	f6dff06f          	j	780 <memset+0x18>
 818:	00279693          	sll	a3,a5,0x2
 81c:	00000297          	auipc	t0,0x0
 820:	005686b3          	add	a3,a3,t0
 824:	00008293          	mv	t0,ra
 828:	fa0680e7          	jalr	-96(a3)
 82c:	00028093          	mv	ra,t0
 830:	ff078793          	add	a5,a5,-16
 834:	40f70733          	sub	a4,a4,a5
 838:	00f60633          	add	a2,a2,a5
 83c:	f6c378e3          	bgeu	t1,a2,7ac <memset+0x44>
 840:	f3dff06f          	j	77c <memset+0x14>

00000844 <memcpy>:
 844:	00a5c7b3          	xor	a5,a1,a0
 848:	0037f793          	and	a5,a5,3
 84c:	00c508b3          	add	a7,a0,a2
 850:	06079463          	bnez	a5,8b8 <memcpy+0x74>
 854:	00300793          	li	a5,3
 858:	06c7f063          	bgeu	a5,a2,8b8 <memcpy+0x74>
 85c:	00357793          	and	a5,a0,3
 860:	00050713          	mv	a4,a0
 864:	06079a63          	bnez	a5,8d8 <memcpy+0x94>
 868:	ffc8f613          	and	a2,a7,-4
 86c:	40e606b3          	sub	a3,a2,a4
 870:	02000793          	li	a5,32
 874:	08d7ce63          	blt	a5,a3,910 <memcpy+0xcc>
 878:	00058693          	mv	a3,a1
 87c:	00070793          	mv	a5,a4
 880:	02c77863          	bgeu	a4,a2,8b0 <memcpy+0x6c>
 884:	0006a803          	lw	a6,0(a3)
 888:	00478793          	add	a5,a5,4
 88c:	00468693          	add	a3,a3,4
 890:	ff07ae23          	sw	a6,-4(a5)
 894:	fec7e8e3          	bltu	a5,a2,884 <memcpy+0x40>
 898:	fff60793          	add	a5,a2,-1
 89c:	40e787b3          	sub	a5,a5,a4
 8a0:	ffc7f793          	and	a5,a5,-4
 8a4:	00478793          	add	a5,a5,4
 8a8:	00f70733          	add	a4,a4,a5
 8ac:	00f585b3          	add	a1,a1,a5
 8b0:	01176863          	bltu	a4,a7,8c0 <memcpy+0x7c>
 8b4:	00008067          	ret
 8b8:	00050713          	mv	a4,a0
 8bc:	05157863          	bgeu	a0,a7,90c <memcpy+0xc8>
 8c0:	0005c783          	lbu	a5,0(a1)
 8c4:	00170713          	add	a4,a4,1
 8c8:	00158593          	add	a1,a1,1
 8cc:	fef70fa3          	sb	a5,-1(a4)
 8d0:	fee898e3          	bne	a7,a4,8c0 <memcpy+0x7c>
 8d4:	00008067          	ret
 8d8:	0005c683          	lbu	a3,0(a1)
 8dc:	00170713          	add	a4,a4,1
 8e0:	00377793          	and	a5,a4,3
 8e4:	fed70fa3          	sb	a3,-1(a4)
 8e8:	00158593          	add	a1,a1,1
 8ec:	f6078ee3          	beqz	a5,868 <memcpy+0x24>
 8f0:	0005c683          	lbu	a3,0(a1)
 8f4:	00170713          	add	a4,a4,1
 8f8:	00377793          	and	a5,a4,3
 8fc:	fed70fa3          	sb	a3,-1(a4)
 900:	00158593          	add	a1,a1,1
 904:	fc079ae3          	bnez	a5,8d8 <memcpy+0x94>
 908:	f61ff06f          	j	868 <memcpy+0x24>
 90c:	00008067          	ret
 910:	ff010113          	add	sp,sp,-16
 914:	00812623          	sw	s0,12(sp)
 918:	02000413          	li	s0,32
 91c:	0005a383          	lw	t2,0(a1)
 920:	0045a283          	lw	t0,4(a1)
 924:	0085af83          	lw	t6,8(a1)
 928:	00c5af03          	lw	t5,12(a1)
 92c:	0105ae83          	lw	t4,16(a1)
 930:	0145ae03          	lw	t3,20(a1)
 934:	0185a303          	lw	t1,24(a1)
 938:	01c5a803          	lw	a6,28(a1)
 93c:	0205a683          	lw	a3,32(a1)
 940:	02470713          	add	a4,a4,36
 944:	40e607b3          	sub	a5,a2,a4
 948:	fc772e23          	sw	t2,-36(a4)
 94c:	fe572023          	sw	t0,-32(a4)
 950:	fff72223          	sw	t6,-28(a4)
 954:	ffe72423          	sw	t5,-24(a4)
 958:	ffd72623          	sw	t4,-20(a4)
 95c:	ffc72823          	sw	t3,-16(a4)
 960:	fe672a23          	sw	t1,-12(a4)
 964:	ff072c23          	sw	a6,-8(a4)
 968:	fed72e23          	sw	a3,-4(a4)
 96c:	02458593          	add	a1,a1,36
 970:	faf446e3          	blt	s0,a5,91c <memcpy+0xd8>
 974:	00058693          	mv	a3,a1
 978:	00070793          	mv	a5,a4
 97c:	02c77863          	bgeu	a4,a2,9ac <memcpy+0x168>
 980:	0006a803          	lw	a6,0(a3)
 984:	00478793          	add	a5,a5,4
 988:	00468693          	add	a3,a3,4
 98c:	ff07ae23          	sw	a6,-4(a5)
 990:	fec7e8e3          	bltu	a5,a2,980 <memcpy+0x13c>
 994:	fff60793          	add	a5,a2,-1
 998:	40e787b3          	sub	a5,a5,a4
 99c:	ffc7f793          	and	a5,a5,-4
 9a0:	00478793          	add	a5,a5,4
 9a4:	00f70733          	add	a4,a4,a5
 9a8:	00f585b3          	add	a1,a1,a5
 9ac:	01176863          	bltu	a4,a7,9bc <memcpy+0x178>
 9b0:	00c12403          	lw	s0,12(sp)
 9b4:	01010113          	add	sp,sp,16
 9b8:	00008067          	ret
 9bc:	0005c783          	lbu	a5,0(a1)
 9c0:	00170713          	add	a4,a4,1
 9c4:	00158593          	add	a1,a1,1
 9c8:	fef70fa3          	sb	a5,-1(a4)
 9cc:	fee882e3          	beq	a7,a4,9b0 <memcpy+0x16c>
 9d0:	0005c783          	lbu	a5,0(a1)
 9d4:	00170713          	add	a4,a4,1
 9d8:	00158593          	add	a1,a1,1
 9dc:	fef70fa3          	sb	a5,-1(a4)
 9e0:	fce89ee3          	bne	a7,a4,9bc <memcpy+0x178>
 9e4:	fcdff06f          	j	9b0 <memcpy+0x16c>

000009e8 <strlen>:
 9e8:	00357793          	and	a5,a0,3
 9ec:	00050713          	mv	a4,a0
 9f0:	04079c63          	bnez	a5,a48 <strlen+0x60>
 9f4:	7f7f86b7          	lui	a3,0x7f7f8
 9f8:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 9fc:	fff00593          	li	a1,-1
 a00:	00072603          	lw	a2,0(a4)
 a04:	00470713          	add	a4,a4,4
 a08:	00d677b3          	and	a5,a2,a3
 a0c:	00d787b3          	add	a5,a5,a3
 a10:	00c7e7b3          	or	a5,a5,a2
 a14:	00d7e7b3          	or	a5,a5,a3
 a18:	feb784e3          	beq	a5,a1,a00 <strlen+0x18>
 a1c:	ffc74683          	lbu	a3,-4(a4)
 a20:	40a707b3          	sub	a5,a4,a0
 a24:	04068463          	beqz	a3,a6c <strlen+0x84>
 a28:	ffd74683          	lbu	a3,-3(a4)
 a2c:	02068c63          	beqz	a3,a64 <strlen+0x7c>
 a30:	ffe74503          	lbu	a0,-2(a4)
 a34:	00a03533          	snez	a0,a0
 a38:	00f50533          	add	a0,a0,a5
 a3c:	ffe50513          	add	a0,a0,-2
 a40:	00008067          	ret
 a44:	fa0688e3          	beqz	a3,9f4 <strlen+0xc>
 a48:	00074783          	lbu	a5,0(a4)
 a4c:	00170713          	add	a4,a4,1
 a50:	00377693          	and	a3,a4,3
 a54:	fe0798e3          	bnez	a5,a44 <strlen+0x5c>
 a58:	40a70733          	sub	a4,a4,a0
 a5c:	fff70513          	add	a0,a4,-1
 a60:	00008067          	ret
 a64:	ffd78513          	add	a0,a5,-3
 a68:	00008067          	ret
 a6c:	ffc78513          	add	a0,a5,-4
 a70:	00008067          	ret

00000a74 <__divsi3>:
 a74:	06054063          	bltz	a0,ad4 <__umodsi3+0x10>
 a78:	0605c663          	bltz	a1,ae4 <__umodsi3+0x20>

00000a7c <__hidden___udivsi3>:
 a7c:	00058613          	mv	a2,a1
 a80:	00050593          	mv	a1,a0
 a84:	fff00513          	li	a0,-1
 a88:	02060c63          	beqz	a2,ac0 <__hidden___udivsi3+0x44>
 a8c:	00100693          	li	a3,1
 a90:	00b67a63          	bgeu	a2,a1,aa4 <__hidden___udivsi3+0x28>
 a94:	00c05863          	blez	a2,aa4 <__hidden___udivsi3+0x28>
 a98:	00161613          	sll	a2,a2,0x1
 a9c:	00169693          	sll	a3,a3,0x1
 aa0:	feb66ae3          	bltu	a2,a1,a94 <__hidden___udivsi3+0x18>
 aa4:	00000513          	li	a0,0
 aa8:	00c5e663          	bltu	a1,a2,ab4 <__hidden___udivsi3+0x38>
 aac:	40c585b3          	sub	a1,a1,a2
 ab0:	00d56533          	or	a0,a0,a3
 ab4:	0016d693          	srl	a3,a3,0x1
 ab8:	00165613          	srl	a2,a2,0x1
 abc:	fe0696e3          	bnez	a3,aa8 <__hidden___udivsi3+0x2c>
 ac0:	00008067          	ret

00000ac4 <__umodsi3>:
 ac4:	00008293          	mv	t0,ra
 ac8:	fb5ff0ef          	jal	a7c <__hidden___udivsi3>
 acc:	00058513          	mv	a0,a1
 ad0:	00028067          	jr	t0 # 81c <memset+0xb4>
 ad4:	40a00533          	neg	a0,a0
 ad8:	00b04863          	bgtz	a1,ae8 <__umodsi3+0x24>
 adc:	40b005b3          	neg	a1,a1
 ae0:	f9dff06f          	j	a7c <__hidden___udivsi3>
 ae4:	40b005b3          	neg	a1,a1
 ae8:	00008293          	mv	t0,ra
 aec:	f91ff0ef          	jal	a7c <__hidden___udivsi3>
 af0:	40a00533          	neg	a0,a0
 af4:	00028067          	jr	t0

00000af8 <__modsi3>:
 af8:	00008293          	mv	t0,ra
 afc:	0005ca63          	bltz	a1,b10 <__modsi3+0x18>
 b00:	00054c63          	bltz	a0,b18 <__modsi3+0x20>
 b04:	f79ff0ef          	jal	a7c <__hidden___udivsi3>
 b08:	00058513          	mv	a0,a1
 b0c:	00028067          	jr	t0
 b10:	40b005b3          	neg	a1,a1
 b14:	fe0558e3          	bgez	a0,b04 <__modsi3+0xc>
 b18:	40a00533          	neg	a0,a0
 b1c:	f61ff0ef          	jal	a7c <__hidden___udivsi3>
 b20:	40b00533          	neg	a0,a1
 b24:	00028067          	jr	t0
