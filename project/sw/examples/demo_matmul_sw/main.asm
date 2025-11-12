
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0xbe0>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	bec38393          	add	t2,t2,-1044 # c20 <__RODATA_END__>
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
 110:	98440413          	add	s0,s0,-1660 # a90 <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	97c48493          	add	s1,s1,-1668 # a90 <__etext>

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
 170:	92440413          	add	s0,s0,-1756 # a90 <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	91c48493          	add	s1,s1,-1764 # a90 <__etext>

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

int main() {

  // Setup UART
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
  neorv32_uart0_setup(19200, 0);
 204:	170000ef          	jal	374 <neorv32_uart_setup>

  neorv32_uart0_printf("Software Matrix Multiplication Test\n");
 208:	000015b7          	lui	a1,0x1
 20c:	a9058593          	add	a1,a1,-1392 # a90 <__etext>
 210:	fff50537          	lui	a0,0xfff50
 214:	484000ef          	jal	698 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 218:	00000793          	li	a5,0
 21c:	c0079073          	csrw	cycle,a5
 220:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 224:	c0002973          	rdcycle	s2
 228:	c0202473          	rdinstret	s0
 22c:	c00029f3          	rdcycle	s3
 230:	c02024f3          	rdinstret	s1
  uint64_t end_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  uint64_t cycles_taken = end_cycles - start_cycles;
  uint64_t instrs_taken = end_instrs - start_instrs;

  neorv32_uart0_printf("Dot product (SW) = %u\n", res);
 234:	000015b7          	lui	a1,0x1
 238:	00a00613          	li	a2,10
 23c:	ab858593          	add	a1,a1,-1352 # ab8 <__etext+0x28>
 240:	fff50537          	lui	a0,0xfff50
 244:	454000ef          	jal	698 <neorv32_uart_printf>
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint32_t)cycles_taken);
 248:	000015b7          	lui	a1,0x1
 24c:	41298633          	sub	a2,s3,s2
 250:	ad058593          	add	a1,a1,-1328 # ad0 <__etext+0x40>
 254:	fff50537          	lui	a0,0xfff50
 258:	440000ef          	jal	698 <neorv32_uart_printf>
  neorv32_uart0_printf("Instruction count (SW): %u\n", (uint32_t)instrs_taken);
 25c:	000015b7          	lui	a1,0x1
 260:	40848633          	sub	a2,s1,s0
 264:	fff50537          	lui	a0,0xfff50
 268:	aec58593          	add	a1,a1,-1300 # aec <__etext+0x5c>
 26c:	42c000ef          	jal	698 <neorv32_uart_printf>

  return 0;
}
 270:	01c12083          	lw	ra,28(sp)
 274:	01812403          	lw	s0,24(sp)
 278:	01412483          	lw	s1,20(sp)
 27c:	01012903          	lw	s2,16(sp)
 280:	00c12983          	lw	s3,12(sp)
 284:	00000513          	li	a0,0
 288:	02010113          	add	sp,sp,32
 28c:	00008067          	ret

00000290 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 290:	fa010113          	add	sp,sp,-96
 294:	04912a23          	sw	s1,84(sp)
 298:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 29c:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 2a0:	04812c23          	sw	s0,88(sp)
 2a4:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 2a8:	b0858593          	add	a1,a1,-1272 # b08 <__etext+0x78>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 2ac:	00060913          	mv	s2,a2
 2b0:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 2b4:	01000613          	li	a2,16
 2b8:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 2bc:	04112e23          	sw	ra,92(sp)
 2c0:	05312623          	sw	s3,76(sp)
 2c4:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 2c8:	4e4000ef          	jal	7ac <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 2cc:	02400613          	li	a2,36
 2d0:	00000593          	li	a1,0
 2d4:	01c10513          	add	a0,sp,28
 2d8:	3f8000ef          	jal	6d0 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 2dc:	ffe90713          	add	a4,s2,-2
 2e0:	00e00793          	li	a5,14
 2e4:	03f10993          	add	s3,sp,63
 2e8:	02e7f463          	bgeu	a5,a4,310 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 2ec:	00040023          	sb	zero,0(s0)
}
 2f0:	05c12083          	lw	ra,92(sp)
 2f4:	05812403          	lw	s0,88(sp)
 2f8:	05412483          	lw	s1,84(sp)
 2fc:	05012903          	lw	s2,80(sp)
 300:	04c12983          	lw	s3,76(sp)
 304:	04812a03          	lw	s4,72(sp)
 308:	06010113          	add	sp,sp,96
 30c:	00008067          	ret
    *tmp_ptr = digits[num%base];
 310:	00090593          	mv	a1,s2
 314:	00048513          	mv	a0,s1
 318:	714000ef          	jal	a2c <__umodsi3>
 31c:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 320:	00278533          	add	a0,a5,sp
 324:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 328:	00090593          	mv	a1,s2
 32c:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 330:	fef98fa3          	sb	a5,-1(s3)
 334:	00048a13          	mv	s4,s1
    num /= base;
 338:	6ac000ef          	jal	9e4 <__hidden___udivsi3>
    tmp_ptr--;
 33c:	fff98993          	add	s3,s3,-1
    num /= base;
 340:	00050493          	mv	s1,a0
  } while (num != 0);
 344:	fd2a76e3          	bgeu	s4,s2,310 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 348:	00000793          	li	a5,0
 34c:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 350:	01c10713          	add	a4,sp,28
 354:	00f70733          	add	a4,a4,a5
 358:	00074703          	lbu	a4,0(a4)
 35c:	00070663          	beqz	a4,368 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 360:	00e40023          	sb	a4,0(s0)
      buffer++;
 364:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 368:	00178793          	add	a5,a5,1
 36c:	fed792e3          	bne	a5,a3,350 <neorv32_aux_itoa+0xc0>
 370:	f7dff06f          	j	2ec <neorv32_aux_itoa+0x5c>

00000374 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 374:	ff010113          	add	sp,sp,-16
 378:	00812423          	sw	s0,8(sp)
 37c:	00912223          	sw	s1,4(sp)
 380:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 384:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 388:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 38c:	00050493          	mv	s1,a0
 390:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 394:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 398:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 39c:	648000ef          	jal	9e4 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 3a0:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 3a4:	3fe00693          	li	a3,1022
 3a8:	04a6e663          	bltu	a3,a0,3f4 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 3ac:	fff50793          	add	a5,a0,-1
 3b0:	000106b7          	lui	a3,0x10
 3b4:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 3b8:	00679793          	sll	a5,a5,0x6
 3bc:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 3c0:	07c006b7          	lui	a3,0x7c00
 3c4:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 3c8:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 3cc:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 3d0:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 3d4:	00c12083          	lw	ra,12(sp)
 3d8:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 3dc:	00e7e7b3          	or	a5,a5,a4
 3e0:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 3e4:	00f4a023          	sw	a5,0(s1)
}
 3e8:	00412483          	lw	s1,4(sp)
 3ec:	01010113          	add	sp,sp,16
 3f0:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 3f4:	ffe70793          	add	a5,a4,-2
 3f8:	ffd7f793          	and	a5,a5,-3
 3fc:	00079863          	bnez	a5,40c <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 400:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 404:	00170713          	add	a4,a4,1
 408:	fa1ff06f          	j	3a8 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 40c:	00155513          	srl	a0,a0,0x1
 410:	ff5ff06f          	j	404 <neorv32_uart_setup+0x90>

00000414 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 414:	00052783          	lw	a5,0(a0)
 418:	00a79713          	sll	a4,a5,0xa
 41c:	fe075ce3          	bgez	a4,414 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 420:	00b52223          	sw	a1,4(a0)
}
 424:	00008067          	ret

00000428 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 428:	fe010113          	add	sp,sp,-32
 42c:	00812c23          	sw	s0,24(sp)
 430:	00912a23          	sw	s1,20(sp)
 434:	01312623          	sw	s3,12(sp)
 438:	00112e23          	sw	ra,28(sp)
 43c:	01212823          	sw	s2,16(sp)
 440:	00050493          	mv	s1,a0
 444:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 448:	00a00993          	li	s3,10
  while ((c = *s++)) {
 44c:	00044903          	lbu	s2,0(s0)
 450:	00140413          	add	s0,s0,1
 454:	02091063          	bnez	s2,474 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 458:	01c12083          	lw	ra,28(sp)
 45c:	01812403          	lw	s0,24(sp)
 460:	01412483          	lw	s1,20(sp)
 464:	01012903          	lw	s2,16(sp)
 468:	00c12983          	lw	s3,12(sp)
 46c:	02010113          	add	sp,sp,32
 470:	00008067          	ret
    if (c == '\n') {
 474:	01391863          	bne	s2,s3,484 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 478:	00d00593          	li	a1,13
 47c:	00048513          	mv	a0,s1
 480:	f95ff0ef          	jal	414 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 484:	00090593          	mv	a1,s2
 488:	00048513          	mv	a0,s1
 48c:	f89ff0ef          	jal	414 <neorv32_uart_putc>
 490:	fbdff06f          	j	44c <neorv32_uart_puts+0x24>

00000494 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 494:	f9010113          	add	sp,sp,-112
 498:	06812423          	sw	s0,104(sp)
 49c:	06912223          	sw	s1,100(sp)
 4a0:	07212023          	sw	s2,96(sp)
 4a4:	05312e23          	sw	s3,92(sp)
 4a8:	00050493          	mv	s1,a0
 4ac:	00058913          	mv	s2,a1
 4b0:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 4b4:	00000593          	li	a1,0
 4b8:	02400613          	li	a2,36
 4bc:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 4c0:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 4c4:	05412c23          	sw	s4,88(sp)
 4c8:	05512a23          	sw	s5,84(sp)
 4cc:	05712623          	sw	s7,76(sp)
 4d0:	05812423          	sw	s8,72(sp)
 4d4:	05912223          	sw	s9,68(sp)
 4d8:	05a12023          	sw	s10,64(sp)
 4dc:	06112623          	sw	ra,108(sp)
 4e0:	05612823          	sw	s6,80(sp)
 4e4:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 4e8:	02500b93          	li	s7,37
    string_buf[i] = 0;
 4ec:	1e4000ef          	jal	6d0 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 4f0:	00a00c13          	li	s8,10
      c = tolower(*format++);
 4f4:	b1d98993          	add	s3,s3,-1251 # b1d <_ctype_+0x1>
 4f8:	00100c93          	li	s9,1
      switch (c) {
 4fc:	07000a13          	li	s4,112
 500:	07500d13          	li	s10,117
 504:	06300a93          	li	s5,99
  while ((c = *format++)) {
 508:	00094d83          	lbu	s11,0(s2)
 50c:	040d9063          	bnez	s11,54c <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 510:	06c12083          	lw	ra,108(sp)
 514:	06812403          	lw	s0,104(sp)
 518:	06412483          	lw	s1,100(sp)
 51c:	06012903          	lw	s2,96(sp)
 520:	05c12983          	lw	s3,92(sp)
 524:	05812a03          	lw	s4,88(sp)
 528:	05412a83          	lw	s5,84(sp)
 52c:	05012b03          	lw	s6,80(sp)
 530:	04c12b83          	lw	s7,76(sp)
 534:	04812c03          	lw	s8,72(sp)
 538:	04412c83          	lw	s9,68(sp)
 53c:	04012d03          	lw	s10,64(sp)
 540:	03c12d83          	lw	s11,60(sp)
 544:	07010113          	add	sp,sp,112
 548:	00008067          	ret
    if (c == '%') {
 54c:	137d9863          	bne	s11,s7,67c <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 550:	00290b13          	add	s6,s2,2
 554:	00194903          	lbu	s2,1(s2)
 558:	013907b3          	add	a5,s2,s3
 55c:	0007c783          	lbu	a5,0(a5)
 560:	0037f793          	and	a5,a5,3
 564:	01979463          	bne	a5,s9,56c <neorv32_uart_vprintf+0xd8>
 568:	02090913          	add	s2,s2,32
      switch (c) {
 56c:	0ff97793          	zext.b	a5,s2
 570:	0d478863          	beq	a5,s4,640 <neorv32_uart_vprintf+0x1ac>
 574:	06fa4c63          	blt	s4,a5,5ec <neorv32_uart_vprintf+0x158>
 578:	09578e63          	beq	a5,s5,614 <neorv32_uart_vprintf+0x180>
 57c:	02fac663          	blt	s5,a5,5a8 <neorv32_uart_vprintf+0x114>
 580:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 584:	02500593          	li	a1,37
      switch (c) {
 588:	00e78a63          	beq	a5,a4,59c <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 58c:	02500593          	li	a1,37
 590:	00048513          	mv	a0,s1
 594:	e81ff0ef          	jal	414 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 598:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 59c:	00048513          	mv	a0,s1
 5a0:	e75ff0ef          	jal	414 <neorv32_uart_putc>
 5a4:	0840006f          	j	628 <neorv32_uart_vprintf+0x194>
      switch (c) {
 5a8:	06400713          	li	a4,100
 5ac:	00e78663          	beq	a5,a4,5b8 <neorv32_uart_vprintf+0x124>
 5b0:	06900713          	li	a4,105
 5b4:	fce79ce3          	bne	a5,a4,58c <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 5b8:	00440913          	add	s2,s0,4
 5bc:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 5c0:	00045a63          	bgez	s0,5d4 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 5c4:	02d00593          	li	a1,45
 5c8:	00048513          	mv	a0,s1
            n = -n;
 5cc:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 5d0:	e45ff0ef          	jal	414 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 5d4:	00a00613          	li	a2,10
 5d8:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 5dc:	00c10513          	add	a0,sp,12
 5e0:	cb1ff0ef          	jal	290 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 5e4:	00c10593          	add	a1,sp,12
 5e8:	0200006f          	j	608 <neorv32_uart_vprintf+0x174>
      switch (c) {
 5ec:	05a78263          	beq	a5,s10,630 <neorv32_uart_vprintf+0x19c>
 5f0:	07800713          	li	a4,120
 5f4:	04e78663          	beq	a5,a4,640 <neorv32_uart_vprintf+0x1ac>
 5f8:	07300713          	li	a4,115
 5fc:	f8e798e3          	bne	a5,a4,58c <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 600:	00042583          	lw	a1,0(s0)
 604:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 608:	00048513          	mv	a0,s1
 60c:	e1dff0ef          	jal	428 <neorv32_uart_puts>
          break;
 610:	0140006f          	j	624 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 614:	00044583          	lbu	a1,0(s0)
 618:	00048513          	mv	a0,s1
 61c:	00440913          	add	s2,s0,4
 620:	df5ff0ef          	jal	414 <neorv32_uart_putc>
 624:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 628:	000b0913          	mv	s2,s6
 62c:	eddff06f          	j	508 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 630:	00042583          	lw	a1,0(s0)
 634:	00440913          	add	s2,s0,4
 638:	00a00613          	li	a2,10
 63c:	fa1ff06f          	j	5dc <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 640:	00042583          	lw	a1,0(s0)
 644:	01000613          	li	a2,16
 648:	00c10513          	add	a0,sp,12
 64c:	c45ff0ef          	jal	290 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 650:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 654:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 658:	2f8000ef          	jal	950 <strlen>
 65c:	00800413          	li	s0,8
 660:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 664:	f80400e3          	beqz	s0,5e4 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 668:	03000593          	li	a1,48
 66c:	00048513          	mv	a0,s1
 670:	da5ff0ef          	jal	414 <neorv32_uart_putc>
 674:	fff40413          	add	s0,s0,-1
 678:	fedff06f          	j	664 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 67c:	018d9863          	bne	s11,s8,68c <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 680:	00d00593          	li	a1,13
 684:	00048513          	mv	a0,s1
 688:	d8dff0ef          	jal	414 <neorv32_uart_putc>
  while ((c = *format++)) {
 68c:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 690:	000d8593          	mv	a1,s11
 694:	f09ff06f          	j	59c <neorv32_uart_vprintf+0x108>

00000698 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 698:	fc010113          	add	sp,sp,-64
 69c:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 6a0:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 6a4:	00112e23          	sw	ra,28(sp)
 6a8:	02d12623          	sw	a3,44(sp)
 6ac:	02e12823          	sw	a4,48(sp)
 6b0:	02f12a23          	sw	a5,52(sp)
 6b4:	03012c23          	sw	a6,56(sp)
 6b8:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 6bc:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 6c0:	dd5ff0ef          	jal	494 <neorv32_uart_vprintf>
  va_end(args);
}
 6c4:	01c12083          	lw	ra,28(sp)
 6c8:	04010113          	add	sp,sp,64
 6cc:	00008067          	ret

000006d0 <memset>:
 6d0:	00f00313          	li	t1,15
 6d4:	00050713          	mv	a4,a0
 6d8:	02c37e63          	bgeu	t1,a2,714 <memset+0x44>
 6dc:	00f77793          	and	a5,a4,15
 6e0:	0a079063          	bnez	a5,780 <memset+0xb0>
 6e4:	08059263          	bnez	a1,768 <memset+0x98>
 6e8:	ff067693          	and	a3,a2,-16
 6ec:	00f67613          	and	a2,a2,15
 6f0:	00e686b3          	add	a3,a3,a4
 6f4:	00b72023          	sw	a1,0(a4)
 6f8:	00b72223          	sw	a1,4(a4)
 6fc:	00b72423          	sw	a1,8(a4)
 700:	00b72623          	sw	a1,12(a4)
 704:	01070713          	add	a4,a4,16
 708:	fed766e3          	bltu	a4,a3,6f4 <memset+0x24>
 70c:	00061463          	bnez	a2,714 <memset+0x44>
 710:	00008067          	ret
 714:	40c306b3          	sub	a3,t1,a2
 718:	00269693          	sll	a3,a3,0x2
 71c:	00000297          	auipc	t0,0x0
 720:	005686b3          	add	a3,a3,t0
 724:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 728:	00b70723          	sb	a1,14(a4)
 72c:	00b706a3          	sb	a1,13(a4)
 730:	00b70623          	sb	a1,12(a4)
 734:	00b705a3          	sb	a1,11(a4)
 738:	00b70523          	sb	a1,10(a4)
 73c:	00b704a3          	sb	a1,9(a4)
 740:	00b70423          	sb	a1,8(a4)
 744:	00b703a3          	sb	a1,7(a4)
 748:	00b70323          	sb	a1,6(a4)
 74c:	00b702a3          	sb	a1,5(a4)
 750:	00b70223          	sb	a1,4(a4)
 754:	00b701a3          	sb	a1,3(a4)
 758:	00b70123          	sb	a1,2(a4)
 75c:	00b700a3          	sb	a1,1(a4)
 760:	00b70023          	sb	a1,0(a4)
 764:	00008067          	ret
 768:	0ff5f593          	zext.b	a1,a1
 76c:	00859693          	sll	a3,a1,0x8
 770:	00d5e5b3          	or	a1,a1,a3
 774:	01059693          	sll	a3,a1,0x10
 778:	00d5e5b3          	or	a1,a1,a3
 77c:	f6dff06f          	j	6e8 <memset+0x18>
 780:	00279693          	sll	a3,a5,0x2
 784:	00000297          	auipc	t0,0x0
 788:	005686b3          	add	a3,a3,t0
 78c:	00008293          	mv	t0,ra
 790:	fa0680e7          	jalr	-96(a3)
 794:	00028093          	mv	ra,t0
 798:	ff078793          	add	a5,a5,-16
 79c:	40f70733          	sub	a4,a4,a5
 7a0:	00f60633          	add	a2,a2,a5
 7a4:	f6c378e3          	bgeu	t1,a2,714 <memset+0x44>
 7a8:	f3dff06f          	j	6e4 <memset+0x14>

000007ac <memcpy>:
 7ac:	00a5c7b3          	xor	a5,a1,a0
 7b0:	0037f793          	and	a5,a5,3
 7b4:	00c508b3          	add	a7,a0,a2
 7b8:	06079463          	bnez	a5,820 <memcpy+0x74>
 7bc:	00300793          	li	a5,3
 7c0:	06c7f063          	bgeu	a5,a2,820 <memcpy+0x74>
 7c4:	00357793          	and	a5,a0,3
 7c8:	00050713          	mv	a4,a0
 7cc:	06079a63          	bnez	a5,840 <memcpy+0x94>
 7d0:	ffc8f613          	and	a2,a7,-4
 7d4:	40e606b3          	sub	a3,a2,a4
 7d8:	02000793          	li	a5,32
 7dc:	08d7ce63          	blt	a5,a3,878 <memcpy+0xcc>
 7e0:	00058693          	mv	a3,a1
 7e4:	00070793          	mv	a5,a4
 7e8:	02c77863          	bgeu	a4,a2,818 <memcpy+0x6c>
 7ec:	0006a803          	lw	a6,0(a3)
 7f0:	00478793          	add	a5,a5,4
 7f4:	00468693          	add	a3,a3,4
 7f8:	ff07ae23          	sw	a6,-4(a5)
 7fc:	fec7e8e3          	bltu	a5,a2,7ec <memcpy+0x40>
 800:	fff60793          	add	a5,a2,-1
 804:	40e787b3          	sub	a5,a5,a4
 808:	ffc7f793          	and	a5,a5,-4
 80c:	00478793          	add	a5,a5,4
 810:	00f70733          	add	a4,a4,a5
 814:	00f585b3          	add	a1,a1,a5
 818:	01176863          	bltu	a4,a7,828 <memcpy+0x7c>
 81c:	00008067          	ret
 820:	00050713          	mv	a4,a0
 824:	05157863          	bgeu	a0,a7,874 <memcpy+0xc8>
 828:	0005c783          	lbu	a5,0(a1)
 82c:	00170713          	add	a4,a4,1
 830:	00158593          	add	a1,a1,1
 834:	fef70fa3          	sb	a5,-1(a4)
 838:	fee898e3          	bne	a7,a4,828 <memcpy+0x7c>
 83c:	00008067          	ret
 840:	0005c683          	lbu	a3,0(a1)
 844:	00170713          	add	a4,a4,1
 848:	00377793          	and	a5,a4,3
 84c:	fed70fa3          	sb	a3,-1(a4)
 850:	00158593          	add	a1,a1,1
 854:	f6078ee3          	beqz	a5,7d0 <memcpy+0x24>
 858:	0005c683          	lbu	a3,0(a1)
 85c:	00170713          	add	a4,a4,1
 860:	00377793          	and	a5,a4,3
 864:	fed70fa3          	sb	a3,-1(a4)
 868:	00158593          	add	a1,a1,1
 86c:	fc079ae3          	bnez	a5,840 <memcpy+0x94>
 870:	f61ff06f          	j	7d0 <memcpy+0x24>
 874:	00008067          	ret
 878:	ff010113          	add	sp,sp,-16
 87c:	00812623          	sw	s0,12(sp)
 880:	02000413          	li	s0,32
 884:	0005a383          	lw	t2,0(a1)
 888:	0045a283          	lw	t0,4(a1)
 88c:	0085af83          	lw	t6,8(a1)
 890:	00c5af03          	lw	t5,12(a1)
 894:	0105ae83          	lw	t4,16(a1)
 898:	0145ae03          	lw	t3,20(a1)
 89c:	0185a303          	lw	t1,24(a1)
 8a0:	01c5a803          	lw	a6,28(a1)
 8a4:	0205a683          	lw	a3,32(a1)
 8a8:	02470713          	add	a4,a4,36
 8ac:	40e607b3          	sub	a5,a2,a4
 8b0:	fc772e23          	sw	t2,-36(a4)
 8b4:	fe572023          	sw	t0,-32(a4)
 8b8:	fff72223          	sw	t6,-28(a4)
 8bc:	ffe72423          	sw	t5,-24(a4)
 8c0:	ffd72623          	sw	t4,-20(a4)
 8c4:	ffc72823          	sw	t3,-16(a4)
 8c8:	fe672a23          	sw	t1,-12(a4)
 8cc:	ff072c23          	sw	a6,-8(a4)
 8d0:	fed72e23          	sw	a3,-4(a4)
 8d4:	02458593          	add	a1,a1,36
 8d8:	faf446e3          	blt	s0,a5,884 <memcpy+0xd8>
 8dc:	00058693          	mv	a3,a1
 8e0:	00070793          	mv	a5,a4
 8e4:	02c77863          	bgeu	a4,a2,914 <memcpy+0x168>
 8e8:	0006a803          	lw	a6,0(a3)
 8ec:	00478793          	add	a5,a5,4
 8f0:	00468693          	add	a3,a3,4
 8f4:	ff07ae23          	sw	a6,-4(a5)
 8f8:	fec7e8e3          	bltu	a5,a2,8e8 <memcpy+0x13c>
 8fc:	fff60793          	add	a5,a2,-1
 900:	40e787b3          	sub	a5,a5,a4
 904:	ffc7f793          	and	a5,a5,-4
 908:	00478793          	add	a5,a5,4
 90c:	00f70733          	add	a4,a4,a5
 910:	00f585b3          	add	a1,a1,a5
 914:	01176863          	bltu	a4,a7,924 <memcpy+0x178>
 918:	00c12403          	lw	s0,12(sp)
 91c:	01010113          	add	sp,sp,16
 920:	00008067          	ret
 924:	0005c783          	lbu	a5,0(a1)
 928:	00170713          	add	a4,a4,1
 92c:	00158593          	add	a1,a1,1
 930:	fef70fa3          	sb	a5,-1(a4)
 934:	fee882e3          	beq	a7,a4,918 <memcpy+0x16c>
 938:	0005c783          	lbu	a5,0(a1)
 93c:	00170713          	add	a4,a4,1
 940:	00158593          	add	a1,a1,1
 944:	fef70fa3          	sb	a5,-1(a4)
 948:	fce89ee3          	bne	a7,a4,924 <memcpy+0x178>
 94c:	fcdff06f          	j	918 <memcpy+0x16c>

00000950 <strlen>:
 950:	00357793          	and	a5,a0,3
 954:	00050713          	mv	a4,a0
 958:	04079c63          	bnez	a5,9b0 <strlen+0x60>
 95c:	7f7f86b7          	lui	a3,0x7f7f8
 960:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 964:	fff00593          	li	a1,-1
 968:	00072603          	lw	a2,0(a4)
 96c:	00470713          	add	a4,a4,4
 970:	00d677b3          	and	a5,a2,a3
 974:	00d787b3          	add	a5,a5,a3
 978:	00c7e7b3          	or	a5,a5,a2
 97c:	00d7e7b3          	or	a5,a5,a3
 980:	feb784e3          	beq	a5,a1,968 <strlen+0x18>
 984:	ffc74683          	lbu	a3,-4(a4)
 988:	40a707b3          	sub	a5,a4,a0
 98c:	04068463          	beqz	a3,9d4 <strlen+0x84>
 990:	ffd74683          	lbu	a3,-3(a4)
 994:	02068c63          	beqz	a3,9cc <strlen+0x7c>
 998:	ffe74503          	lbu	a0,-2(a4)
 99c:	00a03533          	snez	a0,a0
 9a0:	00f50533          	add	a0,a0,a5
 9a4:	ffe50513          	add	a0,a0,-2
 9a8:	00008067          	ret
 9ac:	fa0688e3          	beqz	a3,95c <strlen+0xc>
 9b0:	00074783          	lbu	a5,0(a4)
 9b4:	00170713          	add	a4,a4,1
 9b8:	00377693          	and	a3,a4,3
 9bc:	fe0798e3          	bnez	a5,9ac <strlen+0x5c>
 9c0:	40a70733          	sub	a4,a4,a0
 9c4:	fff70513          	add	a0,a4,-1
 9c8:	00008067          	ret
 9cc:	ffd78513          	add	a0,a5,-3
 9d0:	00008067          	ret
 9d4:	ffc78513          	add	a0,a5,-4
 9d8:	00008067          	ret

000009dc <__divsi3>:
 9dc:	06054063          	bltz	a0,a3c <__umodsi3+0x10>
 9e0:	0605c663          	bltz	a1,a4c <__umodsi3+0x20>

000009e4 <__hidden___udivsi3>:
 9e4:	00058613          	mv	a2,a1
 9e8:	00050593          	mv	a1,a0
 9ec:	fff00513          	li	a0,-1
 9f0:	02060c63          	beqz	a2,a28 <__hidden___udivsi3+0x44>
 9f4:	00100693          	li	a3,1
 9f8:	00b67a63          	bgeu	a2,a1,a0c <__hidden___udivsi3+0x28>
 9fc:	00c05863          	blez	a2,a0c <__hidden___udivsi3+0x28>
 a00:	00161613          	sll	a2,a2,0x1
 a04:	00169693          	sll	a3,a3,0x1
 a08:	feb66ae3          	bltu	a2,a1,9fc <__hidden___udivsi3+0x18>
 a0c:	00000513          	li	a0,0
 a10:	00c5e663          	bltu	a1,a2,a1c <__hidden___udivsi3+0x38>
 a14:	40c585b3          	sub	a1,a1,a2
 a18:	00d56533          	or	a0,a0,a3
 a1c:	0016d693          	srl	a3,a3,0x1
 a20:	00165613          	srl	a2,a2,0x1
 a24:	fe0696e3          	bnez	a3,a10 <__hidden___udivsi3+0x2c>
 a28:	00008067          	ret

00000a2c <__umodsi3>:
 a2c:	00008293          	mv	t0,ra
 a30:	fb5ff0ef          	jal	9e4 <__hidden___udivsi3>
 a34:	00058513          	mv	a0,a1
 a38:	00028067          	jr	t0 # 784 <memset+0xb4>
 a3c:	40a00533          	neg	a0,a0
 a40:	00b04863          	bgtz	a1,a50 <__umodsi3+0x24>
 a44:	40b005b3          	neg	a1,a1
 a48:	f9dff06f          	j	9e4 <__hidden___udivsi3>
 a4c:	40b005b3          	neg	a1,a1
 a50:	00008293          	mv	t0,ra
 a54:	f91ff0ef          	jal	9e4 <__hidden___udivsi3>
 a58:	40a00533          	neg	a0,a0
 a5c:	00028067          	jr	t0

00000a60 <__modsi3>:
 a60:	00008293          	mv	t0,ra
 a64:	0005ca63          	bltz	a1,a78 <__modsi3+0x18>
 a68:	00054c63          	bltz	a0,a80 <__modsi3+0x20>
 a6c:	f79ff0ef          	jal	9e4 <__hidden___udivsi3>
 a70:	00058513          	mv	a0,a1
 a74:	00028067          	jr	t0
 a78:	40b005b3          	neg	a1,a1
 a7c:	fe0558e3          	bgez	a0,a6c <__modsi3+0xc>
 a80:	40a00533          	neg	a0,a0
 a84:	f61ff0ef          	jal	9e4 <__hidden___udivsi3>
 a88:	40b00533          	neg	a0,a1
 a8c:	00028067          	jr	t0
