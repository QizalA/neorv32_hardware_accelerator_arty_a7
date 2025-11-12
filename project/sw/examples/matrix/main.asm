
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
   0:	f14020f3          	csrr	ra,mhartid
   4:	80002217          	auipc	tp,0x80002
   8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
   c:	ff027113          	and	sp,tp,-16
  10:	80000197          	auipc	gp,0x80000
  14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer$>
  18:	000022b7          	lui	t0,0x2
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__RODATA_END__+0xb6c>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	c6038393          	add	t2,t2,-928 # c94 <__RODATA_END__>
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
  cc:	00872103          	lw	sp,8(a4) # fff44008 <__crt0_ram_last+0x7ff42009>
  d0:	00c72603          	lw	a2,12(a4)
  d4:	fff40737          	lui	a4,0xfff40
  d8:	00072223          	sw	zero,4(a4) # fff40004 <__crt0_ram_last+0x7ff3e005>
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
 110:	a1440413          	add	s0,s0,-1516 # b20 <__etext>
 114:	00001497          	auipc	s1,0x1
 118:	a0c48493          	add	s1,s1,-1524 # b20 <__etext>

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
 170:	9b440413          	add	s0,s0,-1612 # b20 <__etext>
 174:	00001497          	auipc	s1,0x1
 178:	9ac48493          	add	s1,s1,-1620 # b20 <__etext>

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

#define BAUD_RATE 19200

int main() {

  neorv32_uart0_setup(BAUD_RATE, 0);
 1dc:	000055b7          	lui	a1,0x5
int main() {
 1e0:	fc010113          	add	sp,sp,-64
  neorv32_uart0_setup(BAUD_RATE, 0);
 1e4:	00000613          	li	a2,0
 1e8:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 1ec:	fff50537          	lui	a0,0xfff50
int main() {
 1f0:	02112e23          	sw	ra,60(sp)
 1f4:	02812c23          	sw	s0,56(sp)
 1f8:	02912a23          	sw	s1,52(sp)
  neorv32_uart0_setup(BAUD_RATE, 0);
 1fc:	208000ef          	jal	404 <neorv32_uart_setup>
  neorv32_uart0_printf("\n[NEORV32] Matrix Multiplication\n");
 200:	000015b7          	lui	a1,0x1
 204:	b2058593          	add	a1,a1,-1248 # b20 <__etext>
 208:	fff50537          	lui	a0,0xfff50
 20c:	51c000ef          	jal	728 <neorv32_uart_printf>

  int A[2][3] = {
 210:	000015b7          	lui	a1,0x1
 214:	01800613          	li	a2,24
 218:	b7858593          	add	a1,a1,-1160 # b78 <__etext+0x58>
 21c:	01810513          	add	a0,sp,24
 220:	61c000ef          	jal	83c <memcpy>
    {7, 8},
    {9, 10},
    {11, 12}
  };

  int C[2][2] = {0};
 224:	00810613          	add	a2,sp,8
 228:	00012423          	sw	zero,8(sp)
 22c:	00012623          	sw	zero,12(sp)
 230:	00012823          	sw	zero,16(sp)
 234:	00012a23          	sw	zero,20(sp)

  // Matrix multiplication
  for (int i = 0; i < 2; i++) {
 238:	01810713          	add	a4,sp,24
    for (int j = 0; j < 2; j++) {
      for (int k = 0; k < 3; k++) {
        C[i][j] += A[i][k] * B[k][j];
 23c:	00072783          	lw	a5,0(a4)
 240:	00472803          	lw	a6,4(a4)
 244:	00062583          	lw	a1,0(a2)
 248:	00379693          	sll	a3,a5,0x3
 24c:	00872503          	lw	a0,8(a4)
 250:	40f687b3          	sub	a5,a3,a5
 254:	00b787b3          	add	a5,a5,a1
 258:	00381593          	sll	a1,a6,0x3
 25c:	010585b3          	add	a1,a1,a6
 260:	00b787b3          	add	a5,a5,a1
 264:	00151593          	sll	a1,a0,0x1
 268:	00a585b3          	add	a1,a1,a0
 26c:	00259593          	sll	a1,a1,0x2
 270:	40a58533          	sub	a0,a1,a0
 274:	00a787b3          	add	a5,a5,a0
 278:	00f62023          	sw	a5,0(a2)
 27c:	00462783          	lw	a5,4(a2)
  for (int i = 0; i < 2; i++) {
 280:	00c70713          	add	a4,a4,12
 284:	00860613          	add	a2,a2,8
        C[i][j] += A[i][k] * B[k][j];
 288:	00f686b3          	add	a3,a3,a5
 28c:	00281793          	sll	a5,a6,0x2
 290:	010787b3          	add	a5,a5,a6
 294:	00179793          	sll	a5,a5,0x1
 298:	00f686b3          	add	a3,a3,a5
 29c:	00b686b3          	add	a3,a3,a1
 2a0:	fed62e23          	sw	a3,-4(a2)
  for (int i = 0; i < 2; i++) {
 2a4:	03010793          	add	a5,sp,48
 2a8:	f8f71ae3          	bne	a4,a5,23c <main+0x60>
      }
    }
  }

  // Print result
  neorv32_uart0_printf("Result matrix C (2x2):\n");
 2ac:	000015b7          	lui	a1,0x1
 2b0:	b4458593          	add	a1,a1,-1212 # b44 <__etext+0x24>
 2b4:	fff50537          	lui	a0,0xfff50
 2b8:	470000ef          	jal	728 <neorv32_uart_printf>
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      neorv32_uart0_printf("%d ", C[i][j]);
 2bc:	00812603          	lw	a2,8(sp)
 2c0:	00001437          	lui	s0,0x1
 2c4:	b5c40593          	add	a1,s0,-1188 # b5c <__etext+0x3c>
 2c8:	fff50537          	lui	a0,0xfff50
 2cc:	45c000ef          	jal	728 <neorv32_uart_printf>
 2d0:	00c12603          	lw	a2,12(sp)
 2d4:	b5c40593          	add	a1,s0,-1188
 2d8:	fff50537          	lui	a0,0xfff50
 2dc:	44c000ef          	jal	728 <neorv32_uart_printf>
    }
    neorv32_uart0_printf("\n");
 2e0:	000014b7          	lui	s1,0x1
 2e4:	b6048593          	add	a1,s1,-1184 # b60 <__etext+0x40>
 2e8:	fff50537          	lui	a0,0xfff50
 2ec:	43c000ef          	jal	728 <neorv32_uart_printf>
      neorv32_uart0_printf("%d ", C[i][j]);
 2f0:	01012603          	lw	a2,16(sp)
 2f4:	b5c40593          	add	a1,s0,-1188
 2f8:	fff50537          	lui	a0,0xfff50
 2fc:	42c000ef          	jal	728 <neorv32_uart_printf>
 300:	01412603          	lw	a2,20(sp)
 304:	b5c40593          	add	a1,s0,-1188
 308:	fff50537          	lui	a0,0xfff50
 30c:	41c000ef          	jal	728 <neorv32_uart_printf>
    neorv32_uart0_printf("\n");
 310:	b6048593          	add	a1,s1,-1184
 314:	fff50537          	lui	a0,0xfff50
 318:	410000ef          	jal	728 <neorv32_uart_printf>
  }

  while (1) {}
 31c:	0000006f          	j	31c <main+0x140>

00000320 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 320:	fa010113          	add	sp,sp,-96
 324:	04912a23          	sw	s1,84(sp)
 328:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 32c:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 330:	04812c23          	sw	s0,88(sp)
 334:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 338:	b6458593          	add	a1,a1,-1180 # b64 <__etext+0x44>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 33c:	00060913          	mv	s2,a2
 340:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 344:	01000613          	li	a2,16
 348:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 34c:	04112e23          	sw	ra,92(sp)
 350:	05312623          	sw	s3,76(sp)
 354:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 358:	4e4000ef          	jal	83c <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 35c:	02400613          	li	a2,36
 360:	00000593          	li	a1,0
 364:	01c10513          	add	a0,sp,28
 368:	3f8000ef          	jal	760 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 36c:	ffe90713          	add	a4,s2,-2
 370:	00e00793          	li	a5,14
 374:	03f10993          	add	s3,sp,63
 378:	02e7f463          	bgeu	a5,a4,3a0 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 37c:	00040023          	sb	zero,0(s0)
}
 380:	05c12083          	lw	ra,92(sp)
 384:	05812403          	lw	s0,88(sp)
 388:	05412483          	lw	s1,84(sp)
 38c:	05012903          	lw	s2,80(sp)
 390:	04c12983          	lw	s3,76(sp)
 394:	04812a03          	lw	s4,72(sp)
 398:	06010113          	add	sp,sp,96
 39c:	00008067          	ret
    *tmp_ptr = digits[num%base];
 3a0:	00090593          	mv	a1,s2
 3a4:	00048513          	mv	a0,s1
 3a8:	714000ef          	jal	abc <__umodsi3>
 3ac:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7ff4e041>
 3b0:	00278533          	add	a0,a5,sp
 3b4:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3b8:	00090593          	mv	a1,s2
 3bc:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 3c0:	fef98fa3          	sb	a5,-1(s3)
 3c4:	00048a13          	mv	s4,s1
    num /= base;
 3c8:	6ac000ef          	jal	a74 <__hidden___udivsi3>
    tmp_ptr--;
 3cc:	fff98993          	add	s3,s3,-1
    num /= base;
 3d0:	00050493          	mv	s1,a0
  } while (num != 0);
 3d4:	fd2a76e3          	bgeu	s4,s2,3a0 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 3d8:	00000793          	li	a5,0
 3dc:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 3e0:	01c10713          	add	a4,sp,28
 3e4:	00f70733          	add	a4,a4,a5
 3e8:	00074703          	lbu	a4,0(a4)
 3ec:	00070663          	beqz	a4,3f8 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 3f0:	00e40023          	sb	a4,0(s0)
      buffer++;
 3f4:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 3f8:	00178793          	add	a5,a5,1
 3fc:	fed792e3          	bne	a5,a3,3e0 <neorv32_aux_itoa+0xc0>
 400:	f7dff06f          	j	37c <neorv32_aux_itoa+0x5c>

00000404 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 404:	ff010113          	add	sp,sp,-16
 408:	00812423          	sw	s0,8(sp)
 40c:	00912223          	sw	s1,4(sp)
 410:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 414:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 418:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 41c:	00050493          	mv	s1,a0
 420:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 424:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 428:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 42c:	648000ef          	jal	a74 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 430:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 434:	3fe00693          	li	a3,1022
 438:	04a6e663          	bltu	a3,a0,484 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 43c:	fff50793          	add	a5,a0,-1
 440:	000106b7          	lui	a3,0x10
 444:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 448:	00679793          	sll	a5,a5,0x6
 44c:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 450:	07c006b7          	lui	a3,0x7c00
 454:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 458:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 45c:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 460:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 464:	00c12083          	lw	ra,12(sp)
 468:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 46c:	00e7e7b3          	or	a5,a5,a4
 470:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 474:	00f4a023          	sw	a5,0(s1)
}
 478:	00412483          	lw	s1,4(sp)
 47c:	01010113          	add	sp,sp,16
 480:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 484:	ffe70793          	add	a5,a4,-2
 488:	ffd7f793          	and	a5,a5,-3
 48c:	00079863          	bnez	a5,49c <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 490:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 494:	00170713          	add	a4,a4,1
 498:	fa1ff06f          	j	438 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 49c:	00155513          	srl	a0,a0,0x1
 4a0:	ff5ff06f          	j	494 <neorv32_uart_setup+0x90>

000004a4 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 4a4:	00052783          	lw	a5,0(a0)
 4a8:	00a79713          	sll	a4,a5,0xa
 4ac:	fe075ce3          	bgez	a4,4a4 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 4b0:	00b52223          	sw	a1,4(a0)
}
 4b4:	00008067          	ret

000004b8 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 4b8:	fe010113          	add	sp,sp,-32
 4bc:	00812c23          	sw	s0,24(sp)
 4c0:	00912a23          	sw	s1,20(sp)
 4c4:	01312623          	sw	s3,12(sp)
 4c8:	00112e23          	sw	ra,28(sp)
 4cc:	01212823          	sw	s2,16(sp)
 4d0:	00050493          	mv	s1,a0
 4d4:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 4d8:	00a00993          	li	s3,10
  while ((c = *s++)) {
 4dc:	00044903          	lbu	s2,0(s0)
 4e0:	00140413          	add	s0,s0,1
 4e4:	02091063          	bnez	s2,504 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 4e8:	01c12083          	lw	ra,28(sp)
 4ec:	01812403          	lw	s0,24(sp)
 4f0:	01412483          	lw	s1,20(sp)
 4f4:	01012903          	lw	s2,16(sp)
 4f8:	00c12983          	lw	s3,12(sp)
 4fc:	02010113          	add	sp,sp,32
 500:	00008067          	ret
    if (c == '\n') {
 504:	01391863          	bne	s2,s3,514 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 508:	00d00593          	li	a1,13
 50c:	00048513          	mv	a0,s1
 510:	f95ff0ef          	jal	4a4 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 514:	00090593          	mv	a1,s2
 518:	00048513          	mv	a0,s1
 51c:	f89ff0ef          	jal	4a4 <neorv32_uart_putc>
 520:	fbdff06f          	j	4dc <neorv32_uart_puts+0x24>

00000524 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 524:	f9010113          	add	sp,sp,-112
 528:	06812423          	sw	s0,104(sp)
 52c:	06912223          	sw	s1,100(sp)
 530:	07212023          	sw	s2,96(sp)
 534:	05312e23          	sw	s3,92(sp)
 538:	00050493          	mv	s1,a0
 53c:	00058913          	mv	s2,a1
 540:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 544:	00000593          	li	a1,0
 548:	02400613          	li	a2,36
 54c:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 550:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 554:	05412c23          	sw	s4,88(sp)
 558:	05512a23          	sw	s5,84(sp)
 55c:	05712623          	sw	s7,76(sp)
 560:	05812423          	sw	s8,72(sp)
 564:	05912223          	sw	s9,68(sp)
 568:	05a12023          	sw	s10,64(sp)
 56c:	06112623          	sw	ra,108(sp)
 570:	05612823          	sw	s6,80(sp)
 574:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 578:	02500b93          	li	s7,37
    string_buf[i] = 0;
 57c:	1e4000ef          	jal	760 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 580:	00a00c13          	li	s8,10
      c = tolower(*format++);
 584:	b9198993          	add	s3,s3,-1135 # b91 <_ctype_+0x1>
 588:	00100c93          	li	s9,1
      switch (c) {
 58c:	07000a13          	li	s4,112
 590:	07500d13          	li	s10,117
 594:	06300a93          	li	s5,99
  while ((c = *format++)) {
 598:	00094d83          	lbu	s11,0(s2)
 59c:	040d9063          	bnez	s11,5dc <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 5a0:	06c12083          	lw	ra,108(sp)
 5a4:	06812403          	lw	s0,104(sp)
 5a8:	06412483          	lw	s1,100(sp)
 5ac:	06012903          	lw	s2,96(sp)
 5b0:	05c12983          	lw	s3,92(sp)
 5b4:	05812a03          	lw	s4,88(sp)
 5b8:	05412a83          	lw	s5,84(sp)
 5bc:	05012b03          	lw	s6,80(sp)
 5c0:	04c12b83          	lw	s7,76(sp)
 5c4:	04812c03          	lw	s8,72(sp)
 5c8:	04412c83          	lw	s9,68(sp)
 5cc:	04012d03          	lw	s10,64(sp)
 5d0:	03c12d83          	lw	s11,60(sp)
 5d4:	07010113          	add	sp,sp,112
 5d8:	00008067          	ret
    if (c == '%') {
 5dc:	137d9863          	bne	s11,s7,70c <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 5e0:	00290b13          	add	s6,s2,2
 5e4:	00194903          	lbu	s2,1(s2)
 5e8:	013907b3          	add	a5,s2,s3
 5ec:	0007c783          	lbu	a5,0(a5)
 5f0:	0037f793          	and	a5,a5,3
 5f4:	01979463          	bne	a5,s9,5fc <neorv32_uart_vprintf+0xd8>
 5f8:	02090913          	add	s2,s2,32
      switch (c) {
 5fc:	0ff97793          	zext.b	a5,s2
 600:	0d478863          	beq	a5,s4,6d0 <neorv32_uart_vprintf+0x1ac>
 604:	06fa4c63          	blt	s4,a5,67c <neorv32_uart_vprintf+0x158>
 608:	09578e63          	beq	a5,s5,6a4 <neorv32_uart_vprintf+0x180>
 60c:	02fac663          	blt	s5,a5,638 <neorv32_uart_vprintf+0x114>
 610:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 614:	02500593          	li	a1,37
      switch (c) {
 618:	00e78a63          	beq	a5,a4,62c <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 61c:	02500593          	li	a1,37
 620:	00048513          	mv	a0,s1
 624:	e81ff0ef          	jal	4a4 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 628:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 62c:	00048513          	mv	a0,s1
 630:	e75ff0ef          	jal	4a4 <neorv32_uart_putc>
 634:	0840006f          	j	6b8 <neorv32_uart_vprintf+0x194>
      switch (c) {
 638:	06400713          	li	a4,100
 63c:	00e78663          	beq	a5,a4,648 <neorv32_uart_vprintf+0x124>
 640:	06900713          	li	a4,105
 644:	fce79ce3          	bne	a5,a4,61c <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 648:	00440913          	add	s2,s0,4
 64c:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 650:	00045a63          	bgez	s0,664 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 654:	02d00593          	li	a1,45
 658:	00048513          	mv	a0,s1
            n = -n;
 65c:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 660:	e45ff0ef          	jal	4a4 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 664:	00a00613          	li	a2,10
 668:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 66c:	00c10513          	add	a0,sp,12
 670:	cb1ff0ef          	jal	320 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 674:	00c10593          	add	a1,sp,12
 678:	0200006f          	j	698 <neorv32_uart_vprintf+0x174>
      switch (c) {
 67c:	05a78263          	beq	a5,s10,6c0 <neorv32_uart_vprintf+0x19c>
 680:	07800713          	li	a4,120
 684:	04e78663          	beq	a5,a4,6d0 <neorv32_uart_vprintf+0x1ac>
 688:	07300713          	li	a4,115
 68c:	f8e798e3          	bne	a5,a4,61c <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 690:	00042583          	lw	a1,0(s0)
 694:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 698:	00048513          	mv	a0,s1
 69c:	e1dff0ef          	jal	4b8 <neorv32_uart_puts>
          break;
 6a0:	0140006f          	j	6b4 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 6a4:	00044583          	lbu	a1,0(s0)
 6a8:	00048513          	mv	a0,s1
 6ac:	00440913          	add	s2,s0,4
 6b0:	df5ff0ef          	jal	4a4 <neorv32_uart_putc>
 6b4:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 6b8:	000b0913          	mv	s2,s6
 6bc:	eddff06f          	j	598 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6c0:	00042583          	lw	a1,0(s0)
 6c4:	00440913          	add	s2,s0,4
 6c8:	00a00613          	li	a2,10
 6cc:	fa1ff06f          	j	66c <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 6d0:	00042583          	lw	a1,0(s0)
 6d4:	01000613          	li	a2,16
 6d8:	00c10513          	add	a0,sp,12
 6dc:	c45ff0ef          	jal	320 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 6e0:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 6e4:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 6e8:	2f8000ef          	jal	9e0 <strlen>
 6ec:	00800413          	li	s0,8
 6f0:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 6f4:	f80400e3          	beqz	s0,674 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 6f8:	03000593          	li	a1,48
 6fc:	00048513          	mv	a0,s1
 700:	da5ff0ef          	jal	4a4 <neorv32_uart_putc>
 704:	fff40413          	add	s0,s0,-1
 708:	fedff06f          	j	6f4 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 70c:	018d9863          	bne	s11,s8,71c <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 710:	00d00593          	li	a1,13
 714:	00048513          	mv	a0,s1
 718:	d8dff0ef          	jal	4a4 <neorv32_uart_putc>
  while ((c = *format++)) {
 71c:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 720:	000d8593          	mv	a1,s11
 724:	f09ff06f          	j	62c <neorv32_uart_vprintf+0x108>

00000728 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 728:	fc010113          	add	sp,sp,-64
 72c:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 730:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 734:	00112e23          	sw	ra,28(sp)
 738:	02d12623          	sw	a3,44(sp)
 73c:	02e12823          	sw	a4,48(sp)
 740:	02f12a23          	sw	a5,52(sp)
 744:	03012c23          	sw	a6,56(sp)
 748:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 74c:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 750:	dd5ff0ef          	jal	524 <neorv32_uart_vprintf>
  va_end(args);
}
 754:	01c12083          	lw	ra,28(sp)
 758:	04010113          	add	sp,sp,64
 75c:	00008067          	ret

00000760 <memset>:
 760:	00f00313          	li	t1,15
 764:	00050713          	mv	a4,a0
 768:	02c37e63          	bgeu	t1,a2,7a4 <memset+0x44>
 76c:	00f77793          	and	a5,a4,15
 770:	0a079063          	bnez	a5,810 <memset+0xb0>
 774:	08059263          	bnez	a1,7f8 <memset+0x98>
 778:	ff067693          	and	a3,a2,-16
 77c:	00f67613          	and	a2,a2,15
 780:	00e686b3          	add	a3,a3,a4
 784:	00b72023          	sw	a1,0(a4)
 788:	00b72223          	sw	a1,4(a4)
 78c:	00b72423          	sw	a1,8(a4)
 790:	00b72623          	sw	a1,12(a4)
 794:	01070713          	add	a4,a4,16
 798:	fed766e3          	bltu	a4,a3,784 <memset+0x24>
 79c:	00061463          	bnez	a2,7a4 <memset+0x44>
 7a0:	00008067          	ret
 7a4:	40c306b3          	sub	a3,t1,a2
 7a8:	00269693          	sll	a3,a3,0x2
 7ac:	00000297          	auipc	t0,0x0
 7b0:	005686b3          	add	a3,a3,t0
 7b4:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
 7b8:	00b70723          	sb	a1,14(a4)
 7bc:	00b706a3          	sb	a1,13(a4)
 7c0:	00b70623          	sb	a1,12(a4)
 7c4:	00b705a3          	sb	a1,11(a4)
 7c8:	00b70523          	sb	a1,10(a4)
 7cc:	00b704a3          	sb	a1,9(a4)
 7d0:	00b70423          	sb	a1,8(a4)
 7d4:	00b703a3          	sb	a1,7(a4)
 7d8:	00b70323          	sb	a1,6(a4)
 7dc:	00b702a3          	sb	a1,5(a4)
 7e0:	00b70223          	sb	a1,4(a4)
 7e4:	00b701a3          	sb	a1,3(a4)
 7e8:	00b70123          	sb	a1,2(a4)
 7ec:	00b700a3          	sb	a1,1(a4)
 7f0:	00b70023          	sb	a1,0(a4)
 7f4:	00008067          	ret
 7f8:	0ff5f593          	zext.b	a1,a1
 7fc:	00859693          	sll	a3,a1,0x8
 800:	00d5e5b3          	or	a1,a1,a3
 804:	01059693          	sll	a3,a1,0x10
 808:	00d5e5b3          	or	a1,a1,a3
 80c:	f6dff06f          	j	778 <memset+0x18>
 810:	00279693          	sll	a3,a5,0x2
 814:	00000297          	auipc	t0,0x0
 818:	005686b3          	add	a3,a3,t0
 81c:	00008293          	mv	t0,ra
 820:	fa0680e7          	jalr	-96(a3)
 824:	00028093          	mv	ra,t0
 828:	ff078793          	add	a5,a5,-16
 82c:	40f70733          	sub	a4,a4,a5
 830:	00f60633          	add	a2,a2,a5
 834:	f6c378e3          	bgeu	t1,a2,7a4 <memset+0x44>
 838:	f3dff06f          	j	774 <memset+0x14>

0000083c <memcpy>:
 83c:	00a5c7b3          	xor	a5,a1,a0
 840:	0037f793          	and	a5,a5,3
 844:	00c508b3          	add	a7,a0,a2
 848:	06079463          	bnez	a5,8b0 <memcpy+0x74>
 84c:	00300793          	li	a5,3
 850:	06c7f063          	bgeu	a5,a2,8b0 <memcpy+0x74>
 854:	00357793          	and	a5,a0,3
 858:	00050713          	mv	a4,a0
 85c:	06079a63          	bnez	a5,8d0 <memcpy+0x94>
 860:	ffc8f613          	and	a2,a7,-4
 864:	40e606b3          	sub	a3,a2,a4
 868:	02000793          	li	a5,32
 86c:	08d7ce63          	blt	a5,a3,908 <memcpy+0xcc>
 870:	00058693          	mv	a3,a1
 874:	00070793          	mv	a5,a4
 878:	02c77863          	bgeu	a4,a2,8a8 <memcpy+0x6c>
 87c:	0006a803          	lw	a6,0(a3)
 880:	00478793          	add	a5,a5,4
 884:	00468693          	add	a3,a3,4
 888:	ff07ae23          	sw	a6,-4(a5)
 88c:	fec7e8e3          	bltu	a5,a2,87c <memcpy+0x40>
 890:	fff60793          	add	a5,a2,-1
 894:	40e787b3          	sub	a5,a5,a4
 898:	ffc7f793          	and	a5,a5,-4
 89c:	00478793          	add	a5,a5,4
 8a0:	00f70733          	add	a4,a4,a5
 8a4:	00f585b3          	add	a1,a1,a5
 8a8:	01176863          	bltu	a4,a7,8b8 <memcpy+0x7c>
 8ac:	00008067          	ret
 8b0:	00050713          	mv	a4,a0
 8b4:	05157863          	bgeu	a0,a7,904 <memcpy+0xc8>
 8b8:	0005c783          	lbu	a5,0(a1)
 8bc:	00170713          	add	a4,a4,1
 8c0:	00158593          	add	a1,a1,1
 8c4:	fef70fa3          	sb	a5,-1(a4)
 8c8:	fee898e3          	bne	a7,a4,8b8 <memcpy+0x7c>
 8cc:	00008067          	ret
 8d0:	0005c683          	lbu	a3,0(a1)
 8d4:	00170713          	add	a4,a4,1
 8d8:	00377793          	and	a5,a4,3
 8dc:	fed70fa3          	sb	a3,-1(a4)
 8e0:	00158593          	add	a1,a1,1
 8e4:	f6078ee3          	beqz	a5,860 <memcpy+0x24>
 8e8:	0005c683          	lbu	a3,0(a1)
 8ec:	00170713          	add	a4,a4,1
 8f0:	00377793          	and	a5,a4,3
 8f4:	fed70fa3          	sb	a3,-1(a4)
 8f8:	00158593          	add	a1,a1,1
 8fc:	fc079ae3          	bnez	a5,8d0 <memcpy+0x94>
 900:	f61ff06f          	j	860 <memcpy+0x24>
 904:	00008067          	ret
 908:	ff010113          	add	sp,sp,-16
 90c:	00812623          	sw	s0,12(sp)
 910:	02000413          	li	s0,32
 914:	0005a383          	lw	t2,0(a1)
 918:	0045a283          	lw	t0,4(a1)
 91c:	0085af83          	lw	t6,8(a1)
 920:	00c5af03          	lw	t5,12(a1)
 924:	0105ae83          	lw	t4,16(a1)
 928:	0145ae03          	lw	t3,20(a1)
 92c:	0185a303          	lw	t1,24(a1)
 930:	01c5a803          	lw	a6,28(a1)
 934:	0205a683          	lw	a3,32(a1)
 938:	02470713          	add	a4,a4,36
 93c:	40e607b3          	sub	a5,a2,a4
 940:	fc772e23          	sw	t2,-36(a4)
 944:	fe572023          	sw	t0,-32(a4)
 948:	fff72223          	sw	t6,-28(a4)
 94c:	ffe72423          	sw	t5,-24(a4)
 950:	ffd72623          	sw	t4,-20(a4)
 954:	ffc72823          	sw	t3,-16(a4)
 958:	fe672a23          	sw	t1,-12(a4)
 95c:	ff072c23          	sw	a6,-8(a4)
 960:	fed72e23          	sw	a3,-4(a4)
 964:	02458593          	add	a1,a1,36
 968:	faf446e3          	blt	s0,a5,914 <memcpy+0xd8>
 96c:	00058693          	mv	a3,a1
 970:	00070793          	mv	a5,a4
 974:	02c77863          	bgeu	a4,a2,9a4 <memcpy+0x168>
 978:	0006a803          	lw	a6,0(a3)
 97c:	00478793          	add	a5,a5,4
 980:	00468693          	add	a3,a3,4
 984:	ff07ae23          	sw	a6,-4(a5)
 988:	fec7e8e3          	bltu	a5,a2,978 <memcpy+0x13c>
 98c:	fff60793          	add	a5,a2,-1
 990:	40e787b3          	sub	a5,a5,a4
 994:	ffc7f793          	and	a5,a5,-4
 998:	00478793          	add	a5,a5,4
 99c:	00f70733          	add	a4,a4,a5
 9a0:	00f585b3          	add	a1,a1,a5
 9a4:	01176863          	bltu	a4,a7,9b4 <memcpy+0x178>
 9a8:	00c12403          	lw	s0,12(sp)
 9ac:	01010113          	add	sp,sp,16
 9b0:	00008067          	ret
 9b4:	0005c783          	lbu	a5,0(a1)
 9b8:	00170713          	add	a4,a4,1
 9bc:	00158593          	add	a1,a1,1
 9c0:	fef70fa3          	sb	a5,-1(a4)
 9c4:	fee882e3          	beq	a7,a4,9a8 <memcpy+0x16c>
 9c8:	0005c783          	lbu	a5,0(a1)
 9cc:	00170713          	add	a4,a4,1
 9d0:	00158593          	add	a1,a1,1
 9d4:	fef70fa3          	sb	a5,-1(a4)
 9d8:	fce89ee3          	bne	a7,a4,9b4 <memcpy+0x178>
 9dc:	fcdff06f          	j	9a8 <memcpy+0x16c>

000009e0 <strlen>:
 9e0:	00357793          	and	a5,a0,3
 9e4:	00050713          	mv	a4,a0
 9e8:	04079c63          	bnez	a5,a40 <strlen+0x60>
 9ec:	7f7f86b7          	lui	a3,0x7f7f8
 9f0:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
 9f4:	fff00593          	li	a1,-1
 9f8:	00072603          	lw	a2,0(a4)
 9fc:	00470713          	add	a4,a4,4
 a00:	00d677b3          	and	a5,a2,a3
 a04:	00d787b3          	add	a5,a5,a3
 a08:	00c7e7b3          	or	a5,a5,a2
 a0c:	00d7e7b3          	or	a5,a5,a3
 a10:	feb784e3          	beq	a5,a1,9f8 <strlen+0x18>
 a14:	ffc74683          	lbu	a3,-4(a4)
 a18:	40a707b3          	sub	a5,a4,a0
 a1c:	04068463          	beqz	a3,a64 <strlen+0x84>
 a20:	ffd74683          	lbu	a3,-3(a4)
 a24:	02068c63          	beqz	a3,a5c <strlen+0x7c>
 a28:	ffe74503          	lbu	a0,-2(a4)
 a2c:	00a03533          	snez	a0,a0
 a30:	00f50533          	add	a0,a0,a5
 a34:	ffe50513          	add	a0,a0,-2
 a38:	00008067          	ret
 a3c:	fa0688e3          	beqz	a3,9ec <strlen+0xc>
 a40:	00074783          	lbu	a5,0(a4)
 a44:	00170713          	add	a4,a4,1
 a48:	00377693          	and	a3,a4,3
 a4c:	fe0798e3          	bnez	a5,a3c <strlen+0x5c>
 a50:	40a70733          	sub	a4,a4,a0
 a54:	fff70513          	add	a0,a4,-1
 a58:	00008067          	ret
 a5c:	ffd78513          	add	a0,a5,-3
 a60:	00008067          	ret
 a64:	ffc78513          	add	a0,a5,-4
 a68:	00008067          	ret

00000a6c <__divsi3>:
 a6c:	06054063          	bltz	a0,acc <__umodsi3+0x10>
 a70:	0605c663          	bltz	a1,adc <__umodsi3+0x20>

00000a74 <__hidden___udivsi3>:
 a74:	00058613          	mv	a2,a1
 a78:	00050593          	mv	a1,a0
 a7c:	fff00513          	li	a0,-1
 a80:	02060c63          	beqz	a2,ab8 <__hidden___udivsi3+0x44>
 a84:	00100693          	li	a3,1
 a88:	00b67a63          	bgeu	a2,a1,a9c <__hidden___udivsi3+0x28>
 a8c:	00c05863          	blez	a2,a9c <__hidden___udivsi3+0x28>
 a90:	00161613          	sll	a2,a2,0x1
 a94:	00169693          	sll	a3,a3,0x1
 a98:	feb66ae3          	bltu	a2,a1,a8c <__hidden___udivsi3+0x18>
 a9c:	00000513          	li	a0,0
 aa0:	00c5e663          	bltu	a1,a2,aac <__hidden___udivsi3+0x38>
 aa4:	40c585b3          	sub	a1,a1,a2
 aa8:	00d56533          	or	a0,a0,a3
 aac:	0016d693          	srl	a3,a3,0x1
 ab0:	00165613          	srl	a2,a2,0x1
 ab4:	fe0696e3          	bnez	a3,aa0 <__hidden___udivsi3+0x2c>
 ab8:	00008067          	ret

00000abc <__umodsi3>:
 abc:	00008293          	mv	t0,ra
 ac0:	fb5ff0ef          	jal	a74 <__hidden___udivsi3>
 ac4:	00058513          	mv	a0,a1
 ac8:	00028067          	jr	t0 # 814 <memset+0xb4>
 acc:	40a00533          	neg	a0,a0
 ad0:	00b04863          	bgtz	a1,ae0 <__umodsi3+0x24>
 ad4:	40b005b3          	neg	a1,a1
 ad8:	f9dff06f          	j	a74 <__hidden___udivsi3>
 adc:	40b005b3          	neg	a1,a1
 ae0:	00008293          	mv	t0,ra
 ae4:	f91ff0ef          	jal	a74 <__hidden___udivsi3>
 ae8:	40a00533          	neg	a0,a0
 aec:	00028067          	jr	t0

00000af0 <__modsi3>:
 af0:	00008293          	mv	t0,ra
 af4:	0005ca63          	bltz	a1,b08 <__modsi3+0x18>
 af8:	00054c63          	bltz	a0,b10 <__modsi3+0x20>
 afc:	f79ff0ef          	jal	a74 <__hidden___udivsi3>
 b00:	00058513          	mv	a0,a1
 b04:	00028067          	jr	t0
 b08:	40b005b3          	neg	a1,a1
 b0c:	fe0558e3          	bgez	a0,afc <__modsi3+0xc>
 b10:	40a00533          	neg	a0,a0
 b14:	f61ff0ef          	jal	a74 <__hidden___udivsi3>
 b18:	40b00533          	neg	a0,a1
 b1c:	00028067          	jr	t0
