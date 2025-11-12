
build/main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
   0:	f14020f3          	csrr	ra,mhartid
   4:	80002217          	auipc	tp,0x80002
   8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
   c:	ff027113          	and	sp,tp,-16
  10:	80000197          	auipc	gp,0x80000
  14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer$>
  18:	000022b7          	lui	t0,0x2
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__etext+0x14d0>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00000397          	auipc	t2,0x0
  38:	2fc38393          	add	t2,t2,764 # 330 <__etext>
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
 10c:	00000417          	auipc	s0,0x0
 110:	22440413          	add	s0,s0,548 # 330 <__etext>
 114:	00000497          	auipc	s1,0x0
 118:	21c48493          	add	s1,s1,540 # 330 <__etext>

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
 16c:	00000417          	auipc	s0,0x0
 170:	1c440413          	add	s0,s0,452 # 330 <__etext>
 174:	00000497          	auipc	s1,0x0
 178:	1bc48493          	add	s1,s1,444 # 330 <__etext>

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
 *
 * @note This program requires the GPIO controller to be synthesized.
 *
 * @return Will never return.
 **************************************************************************/
int main() {
 1dc:	ff010113          	add	sp,sp,-16

  // clear GPIO output (set all bits to 0)
  neorv32_gpio_port_set(0);
 1e0:	00000513          	li	a0,0
int main() {
 1e4:	00112623          	sw	ra,12(sp)
 1e8:	00812423          	sw	s0,8(sp)
  neorv32_gpio_port_set(0);
 1ec:	07c000ef          	jal	268 <neorv32_gpio_port_set>

  int cnt = 0;
 1f0:	00000513          	li	a0,0

  while (1) {
    neorv32_gpio_port_set(cnt++ & 0xFF); // increment counter and mask for lowest 8 bit
 1f4:	00150413          	add	s0,a0,1
 1f8:	0ff57513          	zext.b	a0,a0
 1fc:	06c000ef          	jal	268 <neorv32_gpio_port_set>
    delay_ms(250); // wait 250ms using busy wait
 200:	0fa00513          	li	a0,250
 204:	00c000ef          	jal	210 <delay_ms>
    neorv32_gpio_port_set(cnt++ & 0xFF); // increment counter and mask for lowest 8 bit
 208:	00040513          	mv	a0,s0
 20c:	fe9ff06f          	j	1f4 <main+0x18>

00000210 <delay_ms>:
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 210:	fffe07b7          	lui	a5,0xfffe0
void delay_ms(uint32_t time_ms) {
 214:	00050593          	mv	a1,a0
 218:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>
  neorv32_aux_delay_ms(neorv32_sysinfo_get_clk(), time_ms);
 21c:	0040006f          	j	220 <neorv32_aux_delay_ms>

00000220 <neorv32_aux_delay_ms>:
 * @warning Timing is imprecise! Use CLINT.MTIME or CSR.[M]CYCLE[H] for precise timing.
 *
 * @param[in] clock_hz CPU clock speed in Hz.
 * @param[in] time_ms Time in ms to wait (unsigned 32-bit).
 **************************************************************************/
void neorv32_aux_delay_ms(uint32_t clock_hz, uint32_t time_ms) {
 220:	ff010113          	add	sp,sp,-16
 224:	00058613          	mv	a2,a1

  // clock ticks per ms (avoid division, therefore shift by 10 instead dividing by 1000)
  uint32_t ms_ticks = clock_hz >> 10;
  uint64_t wait_cycles = ((uint64_t)ms_ticks) * ((uint64_t)time_ms);
 228:	00000693          	li	a3,0
 22c:	00a55513          	srl	a0,a0,0xa
 230:	00000593          	li	a1,0
void neorv32_aux_delay_ms(uint32_t clock_hz, uint32_t time_ms) {
 234:	00112623          	sw	ra,12(sp)
  uint64_t wait_cycles = ((uint64_t)ms_ticks) * ((uint64_t)time_ms);
 238:	060000ef          	jal	298 <__muldi3>
  // divide by clock cycles per iteration of the ASM loop (16 = shift by 4)
  uint32_t iterations = (uint32_t)(wait_cycles >> 4);
 23c:	01c59593          	sll	a1,a1,0x1c
 240:	00455513          	srl	a0,a0,0x4
 244:	00a5e533          	or	a0,a1,a0

00000248 <__neorv32_aux_delay_ms_start>:

  asm volatile (
 248:	00050a63          	beqz	a0,25c <__neorv32_aux_delay_ms_end>
 24c:	00001863          	bnez	zero,25c <__neorv32_aux_delay_ms_end>
 250:	fff50513          	add	a0,a0,-1
 254:	00000013          	nop
 258:	ff1ff06f          	j	248 <__neorv32_aux_delay_ms_start>

0000025c <__neorv32_aux_delay_ms_end>:
    " nop                                             \n" // 2 cycles
    " j    __neorv32_aux_delay_ms_start               \n" // 6 cycles
    " __neorv32_aux_delay_ms_end:                     \n"
    : [cnt_w] "=r" (iterations) : [cnt_r] "r" (iterations)
  );
}
 25c:	00c12083          	lw	ra,12(sp)
 260:	01010113          	add	sp,sp,16
 264:	00008067          	ret

00000268 <neorv32_gpio_port_set>:
 *
 * @param[in] pin_mask New output port value (32-bit).
 **************************************************************************/
void neorv32_gpio_port_set(uint32_t pin_mask) {

  NEORV32_GPIO->PORT_OUT = pin_mask;
 268:	fffc07b7          	lui	a5,0xfffc0
 26c:	00a7a223          	sw	a0,4(a5) # fffc0004 <__crt0_ram_last+0x7ffbe005>
}
 270:	00008067          	ret

00000274 <__mulsi3>:
 274:	00050613          	mv	a2,a0
 278:	00000513          	li	a0,0
 27c:	0015f693          	and	a3,a1,1
 280:	00068463          	beqz	a3,288 <__mulsi3+0x14>
 284:	00c50533          	add	a0,a0,a2
 288:	0015d593          	srl	a1,a1,0x1
 28c:	00161613          	sll	a2,a2,0x1
 290:	fe0596e3          	bnez	a1,27c <__mulsi3+0x8>
 294:	00008067          	ret

00000298 <__muldi3>:
 298:	ff010113          	add	sp,sp,-16
 29c:	00812423          	sw	s0,8(sp)
 2a0:	00050413          	mv	s0,a0
 2a4:	00112623          	sw	ra,12(sp)
 2a8:	00060513          	mv	a0,a2
 2ac:	00068393          	mv	t2,a3
 2b0:	00040713          	mv	a4,s0
 2b4:	00060813          	mv	a6,a2
 2b8:	00000793          	li	a5,0
 2bc:	00000313          	li	t1,0
 2c0:	00000f13          	li	t5,0
 2c4:	01e708b3          	add	a7,a4,t5
 2c8:	00187e93          	and	t4,a6,1
 2cc:	00f30fb3          	add	t6,t1,a5
 2d0:	01f75e13          	srl	t3,a4,0x1f
 2d4:	00185813          	srl	a6,a6,0x1
 2d8:	00e8b2b3          	sltu	t0,a7,a4
 2dc:	00179793          	sll	a5,a5,0x1
 2e0:	000e8663          	beqz	t4,2ec <__muldi3+0x54>
 2e4:	00088f13          	mv	t5,a7
 2e8:	01f28333          	add	t1,t0,t6
 2ec:	00171713          	sll	a4,a4,0x1
 2f0:	01c7e7b3          	or	a5,a5,t3
 2f4:	fc0818e3          	bnez	a6,2c4 <__muldi3+0x2c>
 2f8:	00058663          	beqz	a1,304 <__muldi3+0x6c>
 2fc:	f79ff0ef          	jal	274 <__mulsi3>
 300:	00650333          	add	t1,a0,t1
 304:	00038a63          	beqz	t2,318 <__muldi3+0x80>
 308:	00040513          	mv	a0,s0
 30c:	00038593          	mv	a1,t2
 310:	f65ff0ef          	jal	274 <__mulsi3>
 314:	00650333          	add	t1,a0,t1
 318:	00c12083          	lw	ra,12(sp)
 31c:	00812403          	lw	s0,8(sp)
 320:	000f0513          	mv	a0,t5
 324:	00030593          	mv	a1,t1
 328:	01010113          	add	sp,sp,16
 32c:	00008067          	ret
