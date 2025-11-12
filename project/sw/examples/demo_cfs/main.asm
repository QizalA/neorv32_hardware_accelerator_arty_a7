
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80002217          	auipc	tp,0x80002
       8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer>
      18:	000022b7          	lui	t0,0x2
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__fini_array_end+0x4f8>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	9d438393          	add	t2,t2,-1580 # 1a08 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <x32.0>
      44:	80000497          	auipc	s1,0x80000
      48:	fc048493          	add	s1,s1,-64 # 80000004 <__neorv32_rte_vector_lut>
      4c:	80000517          	auipc	a0,0x80000
      50:	fb850513          	add	a0,a0,-72 # 80000004 <__neorv32_rte_vector_lut>
      54:	80000597          	auipc	a1,0x80000
      58:	02458593          	add	a1,a1,36 # 80000078 <__crt0_bss_end>
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
     110:	1fc40413          	add	s0,s0,508 # 1308 <__fini_array_end>
     114:	00001497          	auipc	s1,0x1
     118:	1f448493          	add	s1,s1,500 # 1308 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	0b460613          	add	a2,a2,180 # 1e4 <main>

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
     178:	19440413          	add	s0,s0,404 # 1308 <__fini_array_end>
     17c:	00001497          	auipc	s1,0x1
     180:	18c48493          	add	s1,s1,396 # 1308 <__fini_array_end>

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

000001e4 <main>:
 *
 * @note This program requires the CFS and UART0.
 *
 * @return 0 if execution was successful
 **************************************************************************/
int main() {
     1e4:	fe010113          	add	sp,sp,-32
     1e8:	00112e23          	sw	ra,28(sp)
     1ec:	00812c23          	sw	s0,24(sp)
     1f0:	00912a23          	sw	s1,20(sp)
     1f4:	01212823          	sw	s2,16(sp)
     1f8:	01312623          	sw	s3,12(sp)

  uint32_t i, tmp;

  // capture all exceptions and give debug info via UART0
  // this is not required, but keeps us safe
  neorv32_rte_setup();
     1fc:	161000ef          	jal	b5c <neorv32_rte_setup>

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);
     200:	000055b7          	lui	a1,0x5
     204:	00000613          	li	a2,0
     208:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     20c:	fff50537          	lui	a0,0xfff50
     210:	1dd000ef          	jal	bec <neorv32_uart_setup>


  // check if CFS is implemented at all
  if (neorv32_cfs_available() == 0) {
     214:	2a0000ef          	jal	4b4 <neorv32_cfs_available>
     218:	02051a63          	bnez	a0,24c <main+0x68>
    neorv32_uart0_printf("Error! No CFS synthesized!\n");
     21c:	000015b7          	lui	a1,0x1
     220:	fff50537          	lui	a0,0xfff50
     224:	30858593          	add	a1,a1,776 # 1308 <__fini_array_end>
     228:	4e9000ef          	jal	f10 <neorv32_uart_printf>
    return 1;
     22c:	00100513          	li	a0,1


  neorv32_uart0_printf("\nCFS demo program completed.\n");

  return 0;
}
     230:	01c12083          	lw	ra,28(sp)
     234:	01812403          	lw	s0,24(sp)
     238:	01412483          	lw	s1,20(sp)
     23c:	01012903          	lw	s2,16(sp)
     240:	00c12983          	lw	s3,12(sp)
     244:	02010113          	add	sp,sp,32
     248:	00008067          	ret
  neorv32_uart0_printf("<<< NEORV32 Custom Functions Subsystem (CFS) Demo Program >>>\n\n");
     24c:	000015b7          	lui	a1,0x1
     250:	32458593          	add	a1,a1,804 # 1324 <__fini_array_end+0x1c>
     254:	fff50537          	lui	a0,0xfff50
     258:	4b9000ef          	jal	f10 <neorv32_uart_printf>
  neorv32_uart0_printf("NOTE: This program assumes the _default_ CFS hardware module, which implements\n"
     25c:	000015b7          	lui	a1,0x1
     260:	36458593          	add	a1,a1,868 # 1364 <__fini_array_end+0x5c>
     264:	fff50537          	lui	a0,0xfff50
     268:	4a9000ef          	jal	f10 <neorv32_uart_printf>
  neorv32_uart0_printf("Default CFS memory-mapped registers:\n"
     26c:	000015b7          	lui	a1,0x1
     270:	40058593          	add	a1,a1,1024 # 1400 <__fini_array_end+0xf8>
     274:	fff50537          	lui	a0,0xfff50
     278:	499000ef          	jal	f10 <neorv32_uart_printf>
  neorv32_uart0_printf("\n--- CFS 'OR-all-bits' function ---\n");
     27c:	000015b7          	lui	a1,0x1
     280:	53458593          	add	a1,a1,1332 # 1534 <__fini_array_end+0x22c>
     284:	fff50537          	lui	a0,0xfff50
     288:	489000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     28c:	00000413          	li	s0,0
    NEORV32_CFS->REG[0] = tmp; // write to CFS memory-mapped register 0
     290:	ffeb0937          	lui	s2,0xffeb0
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[0]); // read from CFS memory-mapped register 0
     294:	000014b7          	lui	s1,0x1
  for (i=0; i<TESTCASES; i++) {
     298:	00400993          	li	s3,4
    tmp = neorv32_aux_xorshift32(); // get random test data
     29c:	10c000ef          	jal	3a8 <neorv32_aux_xorshift32>
    NEORV32_CFS->REG[0] = tmp; // write to CFS memory-mapped register 0
     2a0:	00a92023          	sw	a0,0(s2) # ffeb0000 <__crt0_ram_last+0x7feae001>
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[0]); // read from CFS memory-mapped register 0
     2a4:	00092703          	lw	a4,0(s2)
    tmp = neorv32_aux_xorshift32(); // get random test data
     2a8:	00050693          	mv	a3,a0
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[0]); // read from CFS memory-mapped register 0
     2ac:	00040613          	mv	a2,s0
     2b0:	55c48593          	add	a1,s1,1372 # 155c <__fini_array_end+0x254>
     2b4:	fff50537          	lui	a0,0xfff50
  for (i=0; i<TESTCASES; i++) {
     2b8:	00140413          	add	s0,s0,1
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[0]); // read from CFS memory-mapped register 0
     2bc:	455000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     2c0:	fd341ee3          	bne	s0,s3,29c <main+0xb8>
  neorv32_uart0_printf("\n--- CFS 'XOR-all-bits' function ---\n");
     2c4:	000015b7          	lui	a1,0x1
     2c8:	57858593          	add	a1,a1,1400 # 1578 <__fini_array_end+0x270>
     2cc:	fff50537          	lui	a0,0xfff50
     2d0:	441000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     2d4:	00000413          	li	s0,0
    NEORV32_CFS->REG[1] = tmp; // write to CFS memory-mapped register 1
     2d8:	ffeb0937          	lui	s2,0xffeb0
  for (i=0; i<TESTCASES; i++) {
     2dc:	00400993          	li	s3,4
    tmp = neorv32_aux_xorshift32(); // get random test data
     2e0:	0c8000ef          	jal	3a8 <neorv32_aux_xorshift32>
    NEORV32_CFS->REG[1] = tmp; // write to CFS memory-mapped register 1
     2e4:	00a92223          	sw	a0,4(s2) # ffeb0004 <__crt0_ram_last+0x7feae005>
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[1]); // read from CFS memory-mapped register 1
     2e8:	00492703          	lw	a4,4(s2)
    tmp = neorv32_aux_xorshift32(); // get random test data
     2ec:	00050693          	mv	a3,a0
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[1]); // read from CFS memory-mapped register 1
     2f0:	00040613          	mv	a2,s0
     2f4:	55c48593          	add	a1,s1,1372
     2f8:	fff50537          	lui	a0,0xfff50
  for (i=0; i<TESTCASES; i++) {
     2fc:	00140413          	add	s0,s0,1
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[1]); // read from CFS memory-mapped register 1
     300:	411000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     304:	fd341ee3          	bne	s0,s3,2e0 <main+0xfc>
  neorv32_uart0_printf("\n--- CFS 'bit reversal' function ---\n");
     308:	000015b7          	lui	a1,0x1
     30c:	5a058593          	add	a1,a1,1440 # 15a0 <__fini_array_end+0x298>
     310:	fff50537          	lui	a0,0xfff50
     314:	3fd000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     318:	00000413          	li	s0,0
    NEORV32_CFS->REG[2] = tmp; // write to CFS memory-mapped register 2
     31c:	ffeb0937          	lui	s2,0xffeb0
  for (i=0; i<TESTCASES; i++) {
     320:	00400993          	li	s3,4
    tmp = neorv32_aux_xorshift32(); // get random test data
     324:	084000ef          	jal	3a8 <neorv32_aux_xorshift32>
    NEORV32_CFS->REG[2] = tmp; // write to CFS memory-mapped register 2
     328:	00a92423          	sw	a0,8(s2) # ffeb0008 <__crt0_ram_last+0x7feae009>
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[2]); // read from CFS memory-mapped register 2
     32c:	00892703          	lw	a4,8(s2)
    tmp = neorv32_aux_xorshift32(); // get random test data
     330:	00050693          	mv	a3,a0
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[2]); // read from CFS memory-mapped register 2
     334:	00040613          	mv	a2,s0
     338:	55c48593          	add	a1,s1,1372
     33c:	fff50537          	lui	a0,0xfff50
  for (i=0; i<TESTCASES; i++) {
     340:	00140413          	add	s0,s0,1
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[2]); // read from CFS memory-mapped register 2
     344:	3cd000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     348:	fd341ee3          	bne	s0,s3,324 <main+0x140>
  neorv32_uart0_printf("\n--- CFS 'byte swap' function ---\n");
     34c:	000015b7          	lui	a1,0x1
     350:	5c858593          	add	a1,a1,1480 # 15c8 <__fini_array_end+0x2c0>
     354:	fff50537          	lui	a0,0xfff50
     358:	3b9000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     35c:	00000413          	li	s0,0
    NEORV32_CFS->REG[3] = tmp; // write to CFS memory-mapped register 3
     360:	ffeb0937          	lui	s2,0xffeb0
  for (i=0; i<TESTCASES; i++) {
     364:	00400993          	li	s3,4
    tmp = neorv32_aux_xorshift32(); // get random test data
     368:	040000ef          	jal	3a8 <neorv32_aux_xorshift32>
    NEORV32_CFS->REG[3] = tmp; // write to CFS memory-mapped register 3
     36c:	00a92623          	sw	a0,12(s2) # ffeb000c <__crt0_ram_last+0x7feae00d>
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[3]); // read from CFS memory-mapped register 3
     370:	00c92703          	lw	a4,12(s2)
    tmp = neorv32_aux_xorshift32(); // get random test data
     374:	00050693          	mv	a3,a0
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[3]); // read from CFS memory-mapped register 3
     378:	00040613          	mv	a2,s0
     37c:	55c48593          	add	a1,s1,1372
     380:	fff50537          	lui	a0,0xfff50
  for (i=0; i<TESTCASES; i++) {
     384:	00140413          	add	s0,s0,1
    neorv32_uart0_printf("%u: IN = 0x%x, OUT = 0x%x\n", i, tmp, NEORV32_CFS->REG[3]); // read from CFS memory-mapped register 3
     388:	389000ef          	jal	f10 <neorv32_uart_printf>
  for (i=0; i<TESTCASES; i++) {
     38c:	fd341ee3          	bne	s0,s3,368 <main+0x184>
  neorv32_uart0_printf("\nCFS demo program completed.\n");
     390:	000015b7          	lui	a1,0x1
     394:	fff50537          	lui	a0,0xfff50
     398:	5ec58593          	add	a1,a1,1516 # 15ec <__fini_array_end+0x2e4>
     39c:	375000ef          	jal	f10 <neorv32_uart_printf>
  return 0;
     3a0:	00000513          	li	a0,0
     3a4:	e8dff06f          	j	230 <main+0x4c>

000003a8 <neorv32_aux_xorshift32>:
 **************************************************************************/
uint32_t neorv32_aux_xorshift32(void) {

  static uint32_t x32 = 314159265;

  x32 ^= x32 << 13;
     3a8:	800006b7          	lui	a3,0x80000
     3ac:	0006a783          	lw	a5,0(a3) # 80000000 <x32.0>
     3b0:	00d79713          	sll	a4,a5,0xd
     3b4:	00f74733          	xor	a4,a4,a5
  x32 ^= x32 >> 17;
     3b8:	01175793          	srl	a5,a4,0x11
     3bc:	00e7c7b3          	xor	a5,a5,a4
  x32 ^= x32 << 5;
     3c0:	00579513          	sll	a0,a5,0x5
     3c4:	00f54533          	xor	a0,a0,a5
     3c8:	00a6a023          	sw	a0,0(a3)

  return x32;
}
     3cc:	00008067          	ret

000003d0 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     3d0:	fa010113          	add	sp,sp,-96
     3d4:	04912a23          	sw	s1,84(sp)
     3d8:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     3dc:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     3e0:	04812c23          	sw	s0,88(sp)
     3e4:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     3e8:	60c58593          	add	a1,a1,1548 # 160c <__fini_array_end+0x304>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     3ec:	00060913          	mv	s2,a2
     3f0:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     3f4:	01000613          	li	a2,16
     3f8:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     3fc:	04112e23          	sw	ra,92(sp)
     400:	05312623          	sw	s3,76(sp)
     404:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     408:	41d000ef          	jal	1024 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     40c:	02400613          	li	a2,36
     410:	00000593          	li	a1,0
     414:	01c10513          	add	a0,sp,28
     418:	331000ef          	jal	f48 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     41c:	ffe90713          	add	a4,s2,-2
     420:	00e00793          	li	a5,14
     424:	03f10993          	add	s3,sp,63
     428:	02e7f463          	bgeu	a5,a4,450 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     42c:	00040023          	sb	zero,0(s0)
}
     430:	05c12083          	lw	ra,92(sp)
     434:	05812403          	lw	s0,88(sp)
     438:	05412483          	lw	s1,84(sp)
     43c:	05012903          	lw	s2,80(sp)
     440:	04c12983          	lw	s3,76(sp)
     444:	04812a03          	lw	s4,72(sp)
     448:	06010113          	add	sp,sp,96
     44c:	00008067          	ret
    *tmp_ptr = digits[num%base];
     450:	00090593          	mv	a1,s2
     454:	00048513          	mv	a0,s1
     458:	64d000ef          	jal	12a4 <__umodsi3>
     45c:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7ff4e041>
     460:	00278533          	add	a0,a5,sp
     464:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     468:	00090593          	mv	a1,s2
     46c:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     470:	fef98fa3          	sb	a5,-1(s3)
     474:	00048a13          	mv	s4,s1
    num /= base;
     478:	5e5000ef          	jal	125c <__hidden___udivsi3>
    tmp_ptr--;
     47c:	fff98993          	add	s3,s3,-1
    num /= base;
     480:	00050493          	mv	s1,a0
  } while (num != 0);
     484:	fd2a76e3          	bgeu	s4,s2,450 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     488:	00000793          	li	a5,0
     48c:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     490:	01c10713          	add	a4,sp,28
     494:	00f70733          	add	a4,a4,a5
     498:	00074703          	lbu	a4,0(a4)
     49c:	00070663          	beqz	a4,4a8 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     4a0:	00e40023          	sb	a4,0(s0)
      buffer++;
     4a4:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     4a8:	00178793          	add	a5,a5,1
     4ac:	fed792e3          	bne	a5,a3,490 <neorv32_aux_itoa+0xc0>
     4b0:	f7dff06f          	j	42c <neorv32_aux_itoa+0x5c>

000004b4 <neorv32_cfs_available>:
 *
 * @return 0 if CFS was not synthesized, non-zero if CFS is available.
 **************************************************************************/
int neorv32_cfs_available(void) {

  return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_CFS));
     4b4:	fffe07b7          	lui	a5,0xfffe0
     4b8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ffde009>
}
     4bc:	004007b7          	lui	a5,0x400
     4c0:	00f57533          	and	a0,a0,a5
     4c4:	00008067          	ret

000004c8 <neorv32_rte_core>:
 * executed in machine mode).
 **************************************************************************/
void __attribute__((__naked__,aligned(4))) neorv32_rte_core(void) {

  // save context
  asm volatile (
     4c8:	34011073          	csrw	mscratch,sp
     4cc:	f8010113          	add	sp,sp,-128
     4d0:	00012023          	sw	zero,0(sp)
     4d4:	00112223          	sw	ra,4(sp)
     4d8:	340110f3          	csrrw	ra,mscratch,sp
     4dc:	00112423          	sw	ra,8(sp)
     4e0:	00312623          	sw	gp,12(sp)
     4e4:	00412823          	sw	tp,16(sp)
     4e8:	00512a23          	sw	t0,20(sp)
     4ec:	00612c23          	sw	t1,24(sp)
     4f0:	00712e23          	sw	t2,28(sp)
     4f4:	02812023          	sw	s0,32(sp)
     4f8:	02912223          	sw	s1,36(sp)
     4fc:	02a12423          	sw	a0,40(sp)
     500:	02b12623          	sw	a1,44(sp)
     504:	02c12823          	sw	a2,48(sp)
     508:	02d12a23          	sw	a3,52(sp)
     50c:	02e12c23          	sw	a4,56(sp)
     510:	02f12e23          	sw	a5,60(sp)
     514:	05012023          	sw	a6,64(sp)
     518:	05112223          	sw	a7,68(sp)
     51c:	05212423          	sw	s2,72(sp)
     520:	05312623          	sw	s3,76(sp)
     524:	05412823          	sw	s4,80(sp)
     528:	05512a23          	sw	s5,84(sp)
     52c:	05612c23          	sw	s6,88(sp)
     530:	05712e23          	sw	s7,92(sp)
     534:	07812023          	sw	s8,96(sp)
     538:	07912223          	sw	s9,100(sp)
     53c:	07a12423          	sw	s10,104(sp)
     540:	07b12623          	sw	s11,108(sp)
     544:	07c12823          	sw	t3,112(sp)
     548:	07d12a23          	sw	t4,116(sp)
     54c:	07e12c23          	sw	t5,120(sp)
     550:	07f12e23          	sw	t6,124(sp)
#endif
  );

  // flush context (stack frame) to main memory
  // reload trap table from main memory
  asm volatile ("fence");
     554:	0ff0000f          	fence
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     558:	342027f3          	csrr	a5,mcause

  // find according trap handler base address
  uint32_t handler_base = 0;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
     55c:	00b00713          	li	a4,11
     560:	02f76a63          	bltu	a4,a5,594 <neorv32_rte_core+0xcc>
     564:	00002737          	lui	a4,0x2
     568:	00279793          	sll	a5,a5,0x2
     56c:	83070713          	add	a4,a4,-2000 # 1830 <__fini_array_end+0x528>
     570:	00e787b3          	add	a5,a5,a4
     574:	0007a783          	lw	a5,0(a5) # 400000 <__neorv32_rom_size+0x3fc000>
     578:	00078067          	jr	a5
     57c:	00002737          	lui	a4,0x2
     580:	00279793          	sll	a5,a5,0x2
     584:	86070713          	add	a4,a4,-1952 # 1860 <__fini_array_end+0x558>
     588:	00e787b3          	add	a5,a5,a4
     58c:	0007a783          	lw	a5,0(a5)
     590:	00078067          	jr	a5
     594:	80000737          	lui	a4,0x80000
     598:	ffd70713          	add	a4,a4,-3 # 7ffffffd <__neorv32_rom_size+0x7fffbffd>
     59c:	00e787b3          	add	a5,a5,a4
     5a0:	01c00713          	li	a4,28
     5a4:	fcf77ce3          	bgeu	a4,a5,57c <neorv32_rte_core+0xb4>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    default:                     handler_base = (uint32_t)(&neorv32_rte_debug_handler);          break;
     5a8:	000017b7          	lui	a5,0x1
     5ac:	8e078793          	add	a5,a5,-1824 # 8e0 <neorv32_rte_debug_handler>

  // call handler
  if (handler_base != 0) {
    typedef void handler_t();
    handler_t* handler = (handler_t*)handler_base;
    handler();
     5b0:	000780e7          	jalr	a5
     5b4:	0100006f          	j	5c4 <neorv32_rte_core+0xfc>
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
     5b8:	800007b7          	lui	a5,0x80000
     5bc:	0047a783          	lw	a5,4(a5) # 80000004 <__neorv32_rte_vector_lut>
  if (handler_base != 0) {
     5c0:	fe0798e3          	bnez	a5,5b0 <neorv32_rte_core+0xe8>
     5c4:	342027f3          	csrr	a5,mcause
  }

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if (((cause >> 31) == 0) && (cause != TRAP_CODE_I_ACCESS)) {
     5c8:	0207cc63          	bltz	a5,600 <neorv32_rte_core+0x138>
     5cc:	00100713          	li	a4,1
     5d0:	02e78863          	beq	a5,a4,600 <neorv32_rte_core+0x138>
     5d4:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
     5d8:	00468713          	add	a4,a3,4
     5dc:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
     5e0:	0047f793          	and	a5,a5,4
     5e4:	00078c63          	beqz	a5,5fc <neorv32_rte_core+0x134>
     5e8:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
     5ec:	00300613          	li	a2,3
     5f0:	0037f793          	and	a5,a5,3
     5f4:	00c78463          	beq	a5,a2,5fc <neorv32_rte_core+0x134>
        rte_mepc -= 2;
     5f8:	00268713          	add	a4,a3,2
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     5fc:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
     600:	00412083          	lw	ra,4(sp)
     604:	00c12183          	lw	gp,12(sp)
     608:	01012203          	lw	tp,16(sp)
     60c:	01412283          	lw	t0,20(sp)
     610:	01812303          	lw	t1,24(sp)
     614:	01c12383          	lw	t2,28(sp)
     618:	02012403          	lw	s0,32(sp)
     61c:	02412483          	lw	s1,36(sp)
     620:	02812503          	lw	a0,40(sp)
     624:	02c12583          	lw	a1,44(sp)
     628:	03012603          	lw	a2,48(sp)
     62c:	03412683          	lw	a3,52(sp)
     630:	03812703          	lw	a4,56(sp)
     634:	03c12783          	lw	a5,60(sp)
     638:	04012803          	lw	a6,64(sp)
     63c:	04412883          	lw	a7,68(sp)
     640:	04812903          	lw	s2,72(sp)
     644:	04c12983          	lw	s3,76(sp)
     648:	05012a03          	lw	s4,80(sp)
     64c:	05412a83          	lw	s5,84(sp)
     650:	05812b03          	lw	s6,88(sp)
     654:	05c12b83          	lw	s7,92(sp)
     658:	06012c03          	lw	s8,96(sp)
     65c:	06412c83          	lw	s9,100(sp)
     660:	06812d03          	lw	s10,104(sp)
     664:	06c12d83          	lw	s11,108(sp)
     668:	07012e03          	lw	t3,112(sp)
     66c:	07412e83          	lw	t4,116(sp)
     670:	07812f03          	lw	t5,120(sp)
     674:	07c12f83          	lw	t6,124(sp)
     678:	00812103          	lw	sp,8(sp)
     67c:	30200073          	mret
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
     680:	800007b7          	lui	a5,0x80000
     684:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     688:	0047a783          	lw	a5,4(a5)
     68c:	f35ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
     690:	800007b7          	lui	a5,0x80000
     694:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     698:	0087a783          	lw	a5,8(a5)
     69c:	f25ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
     6a0:	800007b7          	lui	a5,0x80000
     6a4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6a8:	00c7a783          	lw	a5,12(a5)
     6ac:	f15ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
     6b0:	800007b7          	lui	a5,0x80000
     6b4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6b8:	0107a783          	lw	a5,16(a5)
     6bc:	f05ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
     6c0:	800007b7          	lui	a5,0x80000
     6c4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6c8:	0147a783          	lw	a5,20(a5)
     6cc:	ef5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
     6d0:	800007b7          	lui	a5,0x80000
     6d4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6d8:	0187a783          	lw	a5,24(a5)
     6dc:	ee5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
     6e0:	800007b7          	lui	a5,0x80000
     6e4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6e8:	01c7a783          	lw	a5,28(a5)
     6ec:	ed5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
     6f0:	800007b7          	lui	a5,0x80000
     6f4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     6f8:	0207a783          	lw	a5,32(a5)
     6fc:	ec5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
     700:	800007b7          	lui	a5,0x80000
     704:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     708:	0247a783          	lw	a5,36(a5)
     70c:	eb5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
     710:	800007b7          	lui	a5,0x80000
     714:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     718:	0287a783          	lw	a5,40(a5)
     71c:	ea5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
     720:	800007b7          	lui	a5,0x80000
     724:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     728:	02c7a783          	lw	a5,44(a5)
     72c:	e95ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
     730:	800007b7          	lui	a5,0x80000
     734:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     738:	0307a783          	lw	a5,48(a5)
     73c:	e85ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
     740:	800007b7          	lui	a5,0x80000
     744:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     748:	0347a783          	lw	a5,52(a5)
     74c:	e75ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
     750:	800007b7          	lui	a5,0x80000
     754:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     758:	0387a783          	lw	a5,56(a5)
     75c:	e65ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
     760:	800007b7          	lui	a5,0x80000
     764:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     768:	03c7a783          	lw	a5,60(a5)
     76c:	e55ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
     770:	800007b7          	lui	a5,0x80000
     774:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     778:	0407a783          	lw	a5,64(a5)
     77c:	e45ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
     780:	800007b7          	lui	a5,0x80000
     784:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     788:	0447a783          	lw	a5,68(a5)
     78c:	e35ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
     790:	800007b7          	lui	a5,0x80000
     794:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     798:	0487a783          	lw	a5,72(a5)
     79c:	e25ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
     7a0:	800007b7          	lui	a5,0x80000
     7a4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7a8:	04c7a783          	lw	a5,76(a5)
     7ac:	e15ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
     7b0:	800007b7          	lui	a5,0x80000
     7b4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7b8:	0507a783          	lw	a5,80(a5)
     7bc:	e05ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
     7c0:	800007b7          	lui	a5,0x80000
     7c4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7c8:	0547a783          	lw	a5,84(a5)
     7cc:	df5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
     7d0:	800007b7          	lui	a5,0x80000
     7d4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7d8:	0587a783          	lw	a5,88(a5)
     7dc:	de5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
     7e0:	800007b7          	lui	a5,0x80000
     7e4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7e8:	05c7a783          	lw	a5,92(a5)
     7ec:	dd5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
     7f0:	800007b7          	lui	a5,0x80000
     7f4:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     7f8:	0607a783          	lw	a5,96(a5)
     7fc:	dc5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
     800:	800007b7          	lui	a5,0x80000
     804:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     808:	0647a783          	lw	a5,100(a5)
     80c:	db5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
     810:	800007b7          	lui	a5,0x80000
     814:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     818:	0687a783          	lw	a5,104(a5)
     81c:	da5ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
     820:	800007b7          	lui	a5,0x80000
     824:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     828:	06c7a783          	lw	a5,108(a5)
     82c:	d95ff06f          	j	5c0 <neorv32_rte_core+0xf8>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
     830:	800007b7          	lui	a5,0x80000
     834:	00478793          	add	a5,a5,4 # 80000004 <__neorv32_rte_vector_lut>
     838:	0707a783          	lw	a5,112(a5)
     83c:	d85ff06f          	j	5c0 <neorv32_rte_core+0xf8>

00000840 <__neorv32_rte_print_hex>:
 *
 * @param[in] num Number to print as hexadecimal via UART0.
 *
 * @param[in] digits Number of hexadecimal digits to print (0..8).
 **************************************************************************/
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     840:	fd010113          	add	sp,sp,-48
     844:	03212023          	sw	s2,32(sp)
     848:	00058913          	mv	s2,a1

  int i = 0;
  const char hex_symbols[] = "0123456789ABCDEF";
     84c:	000015b7          	lui	a1,0x1
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     850:	02912223          	sw	s1,36(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     854:	01100613          	li	a2,17
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     858:	00050493          	mv	s1,a0
  const char hex_symbols[] = "0123456789ABCDEF";
     85c:	62058593          	add	a1,a1,1568 # 1620 <__fini_array_end+0x318>
     860:	00c10513          	add	a0,sp,12
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     864:	02112623          	sw	ra,44(sp)
     868:	02812423          	sw	s0,40(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     86c:	7b8000ef          	jal	1024 <memcpy>

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
     870:	fff50537          	lui	a0,0xfff50
     874:	33c000ef          	jal	bb0 <neorv32_uart_available>
     878:	04050863          	beqz	a0,8c8 <__neorv32_rte_print_hex+0x88>
    neorv32_uart0_putc('0');
     87c:	03000593          	li	a1,48
     880:	fff50537          	lui	a0,0xfff50
     884:	408000ef          	jal	c8c <neorv32_uart_putc>
    neorv32_uart0_putc('x');
     888:	00f00413          	li	s0,15
     88c:	41240433          	sub	s0,s0,s2
     890:	07800593          	li	a1,120
     894:	fff50537          	lui	a0,0xfff50
     898:	3f4000ef          	jal	c8c <neorv32_uart_putc>

    for (i=(digits-8); i<8; i++) {
     89c:	00241413          	sll	s0,s0,0x2
     8a0:	ffc00913          	li	s2,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
     8a4:	0084d7b3          	srl	a5,s1,s0
     8a8:	00f7f793          	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
     8ac:	02078793          	add	a5,a5,32
     8b0:	002787b3          	add	a5,a5,sp
     8b4:	fec7c583          	lbu	a1,-20(a5)
     8b8:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
     8bc:	ffc40413          	add	s0,s0,-4
      neorv32_uart0_putc(hex_symbols[index]);
     8c0:	3cc000ef          	jal	c8c <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
     8c4:	ff2410e3          	bne	s0,s2,8a4 <__neorv32_rte_print_hex+0x64>
    }
  }
}
     8c8:	02c12083          	lw	ra,44(sp)
     8cc:	02812403          	lw	s0,40(sp)
     8d0:	02412483          	lw	s1,36(sp)
     8d4:	02012903          	lw	s2,32(sp)
     8d8:	03010113          	add	sp,sp,48
     8dc:	00008067          	ret

000008e0 <neorv32_rte_debug_handler>:
void neorv32_rte_debug_handler(void) {
     8e0:	ff010113          	add	sp,sp,-16
  if (neorv32_uart0_available() == 0) {
     8e4:	fff50537          	lui	a0,0xfff50
void neorv32_rte_debug_handler(void) {
     8e8:	00112623          	sw	ra,12(sp)
     8ec:	00812423          	sw	s0,8(sp)
  if (neorv32_uart0_available() == 0) {
     8f0:	2c0000ef          	jal	bb0 <neorv32_uart_available>
     8f4:	24050c63          	beqz	a0,b4c <neorv32_rte_debug_handler+0x26c>
  neorv32_uart0_puts("<NEORV32-RTE> ");
     8f8:	000015b7          	lui	a1,0x1
     8fc:	63458593          	add	a1,a1,1588 # 1634 <__fini_array_end+0x32c>
     900:	fff50537          	lui	a0,0xfff50
     904:	39c000ef          	jal	ca0 <neorv32_uart_puts>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     908:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) & 1) {
     90c:	0017f793          	and	a5,a5,1
     910:	04078c63          	beqz	a5,968 <neorv32_rte_debug_handler+0x88>
    neorv32_uart0_puts("[cpu1|");
     914:	000015b7          	lui	a1,0x1
     918:	64458593          	add	a1,a1,1604 # 1644 <__fini_array_end+0x33c>
    neorv32_uart0_puts("[cpu0|");
     91c:	fff50537          	lui	a0,0xfff50
     920:	380000ef          	jal	ca0 <neorv32_uart_puts>
     924:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
     928:	00b7d713          	srl	a4,a5,0xb
     92c:	00377713          	and	a4,a4,3
     930:	04070263          	beqz	a4,974 <neorv32_rte_debug_handler+0x94>
    neorv32_uart0_puts("M] "); // machine-mode
     934:	000015b7          	lui	a1,0x1
     938:	65458593          	add	a1,a1,1620 # 1654 <__fini_array_end+0x34c>
    neorv32_uart0_puts("U] "); // user-mode
     93c:	fff50537          	lui	a0,0xfff50
     940:	360000ef          	jal	ca0 <neorv32_uart_puts>
     944:	34202473          	csrr	s0,mcause
  switch (trap_cause) {
     948:	00b00793          	li	a5,11
     94c:	0287ea63          	bltu	a5,s0,980 <neorv32_rte_debug_handler+0xa0>
     950:	00002737          	lui	a4,0x2
     954:	00241793          	sll	a5,s0,0x2
     958:	8d470713          	add	a4,a4,-1836 # 18d4 <__fini_array_end+0x5cc>
     95c:	00e787b3          	add	a5,a5,a4
     960:	0007a783          	lw	a5,0(a5)
     964:	00078067          	jr	a5
    neorv32_uart0_puts("[cpu0|");
     968:	000015b7          	lui	a1,0x1
     96c:	64c58593          	add	a1,a1,1612 # 164c <__fini_array_end+0x344>
     970:	fadff06f          	j	91c <neorv32_rte_debug_handler+0x3c>
    neorv32_uart0_puts("U] "); // user-mode
     974:	000015b7          	lui	a1,0x1
     978:	65858593          	add	a1,a1,1624 # 1658 <__fini_array_end+0x350>
     97c:	fc1ff06f          	j	93c <neorv32_rte_debug_handler+0x5c>
  switch (trap_cause) {
     980:	800007b7          	lui	a5,0x80000
     984:	00b78793          	add	a5,a5,11 # 8000000b <__neorv32_rte_vector_lut+0x7>
     988:	18f40863          	beq	s0,a5,b18 <neorv32_rte_debug_handler+0x238>
     98c:	0287ea63          	bltu	a5,s0,9c0 <neorv32_rte_debug_handler+0xe0>
     990:	800007b7          	lui	a5,0x80000
     994:	00378793          	add	a5,a5,3 # 80000003 <x32.0+0x3>
     998:	16f40463          	beq	s0,a5,b00 <neorv32_rte_debug_handler+0x220>
     99c:	800007b7          	lui	a5,0x80000
     9a0:	00778793          	add	a5,a5,7 # 80000007 <__neorv32_rte_vector_lut+0x3>
     9a4:	16f40463          	beq	s0,a5,b0c <neorv32_rte_debug_handler+0x22c>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     9a8:	000015b7          	lui	a1,0x1
     9ac:	7b058593          	add	a1,a1,1968 # 17b0 <__fini_array_end+0x4a8>
     9b0:	fff50537          	lui	a0,0xfff50
     9b4:	2ec000ef          	jal	ca0 <neorv32_uart_puts>
     9b8:	00800593          	li	a1,8
     9bc:	02c0006f          	j	9e8 <neorv32_rte_debug_handler+0x108>
  switch (trap_cause) {
     9c0:	800007b7          	lui	a5,0x80000
     9c4:	ff078793          	add	a5,a5,-16 # 7ffffff0 <__neorv32_rom_size+0x7fffbff0>
     9c8:	00f407b3          	add	a5,s0,a5
     9cc:	00f00713          	li	a4,15
     9d0:	fcf76ce3          	bltu	a4,a5,9a8 <neorv32_rte_debug_handler+0xc8>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
     9d4:	000015b7          	lui	a1,0x1
     9d8:	7a458593          	add	a1,a1,1956 # 17a4 <__fini_array_end+0x49c>
     9dc:	fff50537          	lui	a0,0xfff50
     9e0:	2c0000ef          	jal	ca0 <neorv32_uart_puts>
     9e4:	00100593          	li	a1,1
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     9e8:	00040513          	mv	a0,s0
     9ec:	e55ff0ef          	jal	840 <__neorv32_rte_print_hex>
     9f0:	0140006f          	j	a04 <neorv32_rte_debug_handler+0x124>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
     9f4:	000015b7          	lui	a1,0x1
     9f8:	65c58593          	add	a1,a1,1628 # 165c <__fini_array_end+0x354>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
     9fc:	fff50537          	lui	a0,0xfff50
     a00:	2a0000ef          	jal	ca0 <neorv32_uart_puts>
  neorv32_uart0_puts(" @ PC=");
     a04:	000015b7          	lui	a1,0x1
     a08:	7c458593          	add	a1,a1,1988 # 17c4 <__fini_array_end+0x4bc>
     a0c:	fff50537          	lui	a0,0xfff50
     a10:	290000ef          	jal	ca0 <neorv32_uart_puts>
     a14:	34102573          	csrr	a0,mepc
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MEPC), 8);
     a18:	00800593          	li	a1,8
     a1c:	e25ff0ef          	jal	840 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTINST=");
     a20:	000015b7          	lui	a1,0x1
     a24:	7cc58593          	add	a1,a1,1996 # 17cc <__fini_array_end+0x4c4>
     a28:	fff50537          	lui	a0,0xfff50
     a2c:	274000ef          	jal	ca0 <neorv32_uart_puts>
     a30:	34a02573          	csrr	a0,0x34a
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTINST), 8);
     a34:	00800593          	li	a1,8
     a38:	e09ff0ef          	jal	840 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTVAL=");
     a3c:	000015b7          	lui	a1,0x1
     a40:	7d858593          	add	a1,a1,2008 # 17d8 <__fini_array_end+0x4d0>
     a44:	fff50537          	lui	a0,0xfff50
     a48:	258000ef          	jal	ca0 <neorv32_uart_puts>
     a4c:	34302573          	csrr	a0,mtval
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTVAL), 8);
     a50:	00800593          	li	a1,8
     a54:	dedff0ef          	jal	840 <__neorv32_rte_print_hex>
  if (((int32_t)trap_cause) < 0) { // is interrupt
     a58:	0c045663          	bgez	s0,b24 <neorv32_rte_debug_handler+0x244>
    neorv32_uart0_puts(" Disabling IRQ source");
     a5c:	000015b7          	lui	a1,0x1
     a60:	7e458593          	add	a1,a1,2020 # 17e4 <__fini_array_end+0x4dc>
     a64:	fff50537          	lui	a0,0xfff50
     a68:	238000ef          	jal	ca0 <neorv32_uart_puts>
    neorv32_cpu_csr_clr(CSR_MIE, 1 << (trap_cause & 0x1f));
     a6c:	00100793          	li	a5,1
     a70:	008797b3          	sll	a5,a5,s0
 * @param[in] mask Bit mask (high-active) to clear bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrc %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     a74:	3047b073          	csrc	mie,a5
}
     a78:	00812403          	lw	s0,8(sp)
     a7c:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     a80:	000025b7          	lui	a1,0x2
     a84:	81c58593          	add	a1,a1,-2020 # 181c <__fini_array_end+0x514>
     a88:	fff50537          	lui	a0,0xfff50
}
     a8c:	01010113          	add	sp,sp,16
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     a90:	2100006f          	j	ca0 <neorv32_uart_puts>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
     a94:	000015b7          	lui	a1,0x1
     a98:	67858593          	add	a1,a1,1656 # 1678 <__fini_array_end+0x370>
     a9c:	f61ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
     aa0:	000015b7          	lui	a1,0x1
     aa4:	68c58593          	add	a1,a1,1676 # 168c <__fini_array_end+0x384>
     aa8:	f55ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Environment breakpoint"); break;
     aac:	000015b7          	lui	a1,0x1
     ab0:	6ac58593          	add	a1,a1,1708 # 16ac <__fini_array_end+0x3a4>
     ab4:	f49ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
     ab8:	000015b7          	lui	a1,0x1
     abc:	6c458593          	add	a1,a1,1732 # 16c4 <__fini_array_end+0x3bc>
     ac0:	f3dff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
     ac4:	000015b7          	lui	a1,0x1
     ac8:	6dc58593          	add	a1,a1,1756 # 16dc <__fini_array_end+0x3d4>
     acc:	f31ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
     ad0:	000015b7          	lui	a1,0x1
     ad4:	6f058593          	add	a1,a1,1776 # 16f0 <__fini_array_end+0x3e8>
     ad8:	f25ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
     adc:	000015b7          	lui	a1,0x1
     ae0:	70c58593          	add	a1,a1,1804 # 170c <__fini_array_end+0x404>
     ae4:	f19ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
     ae8:	000015b7          	lui	a1,0x1
     aec:	72058593          	add	a1,a1,1824 # 1720 <__fini_array_end+0x418>
     af0:	f0dff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
     af4:	000015b7          	lui	a1,0x1
     af8:	74058593          	add	a1,a1,1856 # 1740 <__fini_array_end+0x438>
     afc:	f01ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
     b00:	000015b7          	lui	a1,0x1
     b04:	76058593          	add	a1,a1,1888 # 1760 <__fini_array_end+0x458>
     b08:	ef5ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
     b0c:	000015b7          	lui	a1,0x1
     b10:	77858593          	add	a1,a1,1912 # 1778 <__fini_array_end+0x470>
     b14:	ee9ff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
     b18:	000015b7          	lui	a1,0x1
     b1c:	78c58593          	add	a1,a1,1932 # 178c <__fini_array_end+0x484>
     b20:	eddff06f          	j	9fc <neorv32_rte_debug_handler+0x11c>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
     b24:	00100793          	li	a5,1
     b28:	f487e8e3          	bltu	a5,s0,a78 <neorv32_rte_debug_handler+0x198>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU </NEORV32-RTE>\n");
     b2c:	000015b7          	lui	a1,0x1
     b30:	7fc58593          	add	a1,a1,2044 # 17fc <__fini_array_end+0x4f4>
     b34:	fff50537          	lui	a0,0xfff50
     b38:	168000ef          	jal	ca0 <neorv32_uart_puts>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     b3c:	00000793          	li	a5,0
     b40:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
     b44:	10500073          	wfi
    while(1) {
     b48:	ffdff06f          	j	b44 <neorv32_rte_debug_handler+0x264>
}
     b4c:	00c12083          	lw	ra,12(sp)
     b50:	00812403          	lw	s0,8(sp)
     b54:	01010113          	add	sp,sp,16
     b58:	00008067          	ret

00000b5c <neorv32_rte_setup>:
     b5c:	000027b7          	lui	a5,0x2
     b60:	80078793          	add	a5,a5,-2048 # 1800 <__fini_array_end+0x4f8>
     b64:	30079073          	csrw	mstatus,a5
     b68:	4c800793          	li	a5,1224
     b6c:	30579073          	csrw	mtvec,a5
     b70:	00000793          	li	a5,0
     b74:	30479073          	csrw	mie,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     b78:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) == 0) {
     b7c:	02079863          	bnez	a5,bac <neorv32_rte_setup+0x50>
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
     b80:	000016b7          	lui	a3,0x1
     b84:	80000637          	lui	a2,0x80000
     b88:	8e068693          	add	a3,a3,-1824 # 8e0 <neorv32_rte_debug_handler>
     b8c:	00460613          	add	a2,a2,4 # 80000004 <__neorv32_rte_vector_lut>
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
     b90:	01d00593          	li	a1,29
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
     b94:	00279713          	sll	a4,a5,0x2
     b98:	00e60733          	add	a4,a2,a4
     b9c:	00d72023          	sw	a3,0(a4)
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
     ba0:	00178793          	add	a5,a5,1
     ba4:	feb798e3          	bne	a5,a1,b94 <neorv32_rte_setup+0x38>
    asm volatile ("fence"); // flush handler table to main memory
     ba8:	0ff0000f          	fence
}
     bac:	00008067          	ret

00000bb0 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     bb0:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     bb4:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     bb8:	00e51c63          	bne	a0,a4,bd0 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     bbc:	fffe07b7          	lui	a5,0xfffe0
     bc0:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ffde009>
     bc4:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bc8:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     bcc:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     bd0:	fff60737          	lui	a4,0xfff60
    return 0;
     bd4:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     bd8:	fee79ae3          	bne	a5,a4,bcc <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bdc:	fffe07b7          	lui	a5,0xfffe0
     be0:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ffde009>
     be4:	020007b7          	lui	a5,0x2000
     be8:	fe1ff06f          	j	bc8 <neorv32_uart_available+0x18>

00000bec <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     bec:	ff010113          	add	sp,sp,-16
     bf0:	00812423          	sw	s0,8(sp)
     bf4:	00912223          	sw	s1,4(sp)
     bf8:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     bfc:	00052023          	sw	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     c00:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     c04:	00050493          	mv	s1,a0
     c08:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     c0c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     c10:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     c14:	648000ef          	jal	125c <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     c18:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     c1c:	3fe00693          	li	a3,1022
     c20:	04a6e663          	bltu	a3,a0,c6c <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     c24:	fff50793          	add	a5,a0,-1
     c28:	000106b7          	lui	a3,0x10
     c2c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
     c30:	00679793          	sll	a5,a5,0x6
     c34:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     c38:	07c006b7          	lui	a3,0x7c00
     c3c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     c40:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     c44:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     c48:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
     c4c:	00c12083          	lw	ra,12(sp)
     c50:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     c54:	00e7e7b3          	or	a5,a5,a4
     c58:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     c5c:	00f4a023          	sw	a5,0(s1)
}
     c60:	00412483          	lw	s1,4(sp)
     c64:	01010113          	add	sp,sp,16
     c68:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     c6c:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7ff5dfff>
     c70:	ffd7f793          	and	a5,a5,-3
     c74:	00079863          	bnez	a5,c84 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
     c78:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     c7c:	00170713          	add	a4,a4,1
     c80:	fa1ff06f          	j	c20 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
     c84:	00155513          	srl	a0,a0,0x1
     c88:	ff5ff06f          	j	c7c <neorv32_uart_setup+0x90>

00000c8c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     c8c:	00052783          	lw	a5,0(a0)
     c90:	00a79713          	sll	a4,a5,0xa
     c94:	fe075ce3          	bgez	a4,c8c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     c98:	00b52223          	sw	a1,4(a0)
}
     c9c:	00008067          	ret

00000ca0 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     ca0:	fe010113          	add	sp,sp,-32
     ca4:	00812c23          	sw	s0,24(sp)
     ca8:	00912a23          	sw	s1,20(sp)
     cac:	01312623          	sw	s3,12(sp)
     cb0:	00112e23          	sw	ra,28(sp)
     cb4:	01212823          	sw	s2,16(sp)
     cb8:	00050493          	mv	s1,a0
     cbc:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     cc0:	00a00993          	li	s3,10
  while ((c = *s++)) {
     cc4:	00044903          	lbu	s2,0(s0)
     cc8:	00140413          	add	s0,s0,1
     ccc:	02091063          	bnez	s2,cec <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     cd0:	01c12083          	lw	ra,28(sp)
     cd4:	01812403          	lw	s0,24(sp)
     cd8:	01412483          	lw	s1,20(sp)
     cdc:	01012903          	lw	s2,16(sp)
     ce0:	00c12983          	lw	s3,12(sp)
     ce4:	02010113          	add	sp,sp,32
     ce8:	00008067          	ret
    if (c == '\n') {
     cec:	01391863          	bne	s2,s3,cfc <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     cf0:	00d00593          	li	a1,13
     cf4:	00048513          	mv	a0,s1
     cf8:	f95ff0ef          	jal	c8c <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     cfc:	00090593          	mv	a1,s2
     d00:	00048513          	mv	a0,s1
     d04:	f89ff0ef          	jal	c8c <neorv32_uart_putc>
     d08:	fbdff06f          	j	cc4 <neorv32_uart_puts+0x24>

00000d0c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     d0c:	f9010113          	add	sp,sp,-112
     d10:	06812423          	sw	s0,104(sp)
     d14:	06912223          	sw	s1,100(sp)
     d18:	07212023          	sw	s2,96(sp)
     d1c:	05312e23          	sw	s3,92(sp)
     d20:	00050493          	mv	s1,a0
     d24:	00058913          	mv	s2,a1
     d28:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
     d2c:	00000593          	li	a1,0
     d30:	02400613          	li	a2,36
     d34:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
     d38:	000029b7          	lui	s3,0x2
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     d3c:	05412c23          	sw	s4,88(sp)
     d40:	05512a23          	sw	s5,84(sp)
     d44:	05712623          	sw	s7,76(sp)
     d48:	05812423          	sw	s8,72(sp)
     d4c:	05912223          	sw	s9,68(sp)
     d50:	05a12023          	sw	s10,64(sp)
     d54:	06112623          	sw	ra,108(sp)
     d58:	05612823          	sw	s6,80(sp)
     d5c:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
     d60:	02500b93          	li	s7,37
    string_buf[i] = 0;
     d64:	1e4000ef          	jal	f48 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
     d68:	00a00c13          	li	s8,10
      c = tolower(*format++);
     d6c:	90598993          	add	s3,s3,-1787 # 1905 <_ctype_+0x1>
     d70:	00100c93          	li	s9,1
      switch (c) {
     d74:	07000a13          	li	s4,112
     d78:	07500d13          	li	s10,117
     d7c:	06300a93          	li	s5,99
  while ((c = *format++)) {
     d80:	00094d83          	lbu	s11,0(s2)
     d84:	040d9063          	bnez	s11,dc4 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
     d88:	06c12083          	lw	ra,108(sp)
     d8c:	06812403          	lw	s0,104(sp)
     d90:	06412483          	lw	s1,100(sp)
     d94:	06012903          	lw	s2,96(sp)
     d98:	05c12983          	lw	s3,92(sp)
     d9c:	05812a03          	lw	s4,88(sp)
     da0:	05412a83          	lw	s5,84(sp)
     da4:	05012b03          	lw	s6,80(sp)
     da8:	04c12b83          	lw	s7,76(sp)
     dac:	04812c03          	lw	s8,72(sp)
     db0:	04412c83          	lw	s9,68(sp)
     db4:	04012d03          	lw	s10,64(sp)
     db8:	03c12d83          	lw	s11,60(sp)
     dbc:	07010113          	add	sp,sp,112
     dc0:	00008067          	ret
    if (c == '%') {
     dc4:	137d9863          	bne	s11,s7,ef4 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
     dc8:	00290b13          	add	s6,s2,2
     dcc:	00194903          	lbu	s2,1(s2)
     dd0:	013907b3          	add	a5,s2,s3
     dd4:	0007c783          	lbu	a5,0(a5)
     dd8:	0037f793          	and	a5,a5,3
     ddc:	01979463          	bne	a5,s9,de4 <neorv32_uart_vprintf+0xd8>
     de0:	02090913          	add	s2,s2,32
      switch (c) {
     de4:	0ff97793          	zext.b	a5,s2
     de8:	0d478863          	beq	a5,s4,eb8 <neorv32_uart_vprintf+0x1ac>
     dec:	06fa4c63          	blt	s4,a5,e64 <neorv32_uart_vprintf+0x158>
     df0:	09578e63          	beq	a5,s5,e8c <neorv32_uart_vprintf+0x180>
     df4:	02fac663          	blt	s5,a5,e20 <neorv32_uart_vprintf+0x114>
     df8:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
     dfc:	02500593          	li	a1,37
      switch (c) {
     e00:	00e78a63          	beq	a5,a4,e14 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
     e04:	02500593          	li	a1,37
     e08:	00048513          	mv	a0,s1
     e0c:	e81ff0ef          	jal	c8c <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     e10:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
     e14:	00048513          	mv	a0,s1
     e18:	e75ff0ef          	jal	c8c <neorv32_uart_putc>
     e1c:	0840006f          	j	ea0 <neorv32_uart_vprintf+0x194>
      switch (c) {
     e20:	06400713          	li	a4,100
     e24:	00e78663          	beq	a5,a4,e30 <neorv32_uart_vprintf+0x124>
     e28:	06900713          	li	a4,105
     e2c:	fce79ce3          	bne	a5,a4,e04 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
     e30:	00440913          	add	s2,s0,4
     e34:	00042403          	lw	s0,0(s0)
          if (n < 0) {
     e38:	00045a63          	bgez	s0,e4c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
     e3c:	02d00593          	li	a1,45
     e40:	00048513          	mv	a0,s1
            n = -n;
     e44:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
     e48:	e45ff0ef          	jal	c8c <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
     e4c:	00a00613          	li	a2,10
     e50:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     e54:	00c10513          	add	a0,sp,12
     e58:	d78ff0ef          	jal	3d0 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
     e5c:	00c10593          	add	a1,sp,12
     e60:	0200006f          	j	e80 <neorv32_uart_vprintf+0x174>
      switch (c) {
     e64:	05a78263          	beq	a5,s10,ea8 <neorv32_uart_vprintf+0x19c>
     e68:	07800713          	li	a4,120
     e6c:	04e78663          	beq	a5,a4,eb8 <neorv32_uart_vprintf+0x1ac>
     e70:	07300713          	li	a4,115
     e74:	f8e798e3          	bne	a5,a4,e04 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     e78:	00042583          	lw	a1,0(s0)
     e7c:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
     e80:	00048513          	mv	a0,s1
     e84:	e1dff0ef          	jal	ca0 <neorv32_uart_puts>
          break;
     e88:	0140006f          	j	e9c <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
     e8c:	00044583          	lbu	a1,0(s0)
     e90:	00048513          	mv	a0,s1
     e94:	00440913          	add	s2,s0,4
     e98:	df5ff0ef          	jal	c8c <neorv32_uart_putc>
     e9c:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     ea0:	000b0913          	mv	s2,s6
     ea4:	eddff06f          	j	d80 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     ea8:	00042583          	lw	a1,0(s0)
     eac:	00440913          	add	s2,s0,4
     eb0:	00a00613          	li	a2,10
     eb4:	fa1ff06f          	j	e54 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     eb8:	00042583          	lw	a1,0(s0)
     ebc:	01000613          	li	a2,16
     ec0:	00c10513          	add	a0,sp,12
     ec4:	d0cff0ef          	jal	3d0 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
     ec8:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     ecc:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
     ed0:	2f8000ef          	jal	11c8 <strlen>
     ed4:	00800413          	li	s0,8
     ed8:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
     edc:	f80400e3          	beqz	s0,e5c <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
     ee0:	03000593          	li	a1,48
     ee4:	00048513          	mv	a0,s1
     ee8:	da5ff0ef          	jal	c8c <neorv32_uart_putc>
     eec:	fff40413          	add	s0,s0,-1
     ef0:	fedff06f          	j	edc <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
     ef4:	018d9863          	bne	s11,s8,f04 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
     ef8:	00d00593          	li	a1,13
     efc:	00048513          	mv	a0,s1
     f00:	d8dff0ef          	jal	c8c <neorv32_uart_putc>
  while ((c = *format++)) {
     f04:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
     f08:	000d8593          	mv	a1,s11
     f0c:	f09ff06f          	j	e14 <neorv32_uart_vprintf+0x108>

00000f10 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     f10:	fc010113          	add	sp,sp,-64
     f14:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
     f18:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     f1c:	00112e23          	sw	ra,28(sp)
     f20:	02d12623          	sw	a3,44(sp)
     f24:	02e12823          	sw	a4,48(sp)
     f28:	02f12a23          	sw	a5,52(sp)
     f2c:	03012c23          	sw	a6,56(sp)
     f30:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
     f34:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
     f38:	dd5ff0ef          	jal	d0c <neorv32_uart_vprintf>
  va_end(args);
}
     f3c:	01c12083          	lw	ra,28(sp)
     f40:	04010113          	add	sp,sp,64
     f44:	00008067          	ret

00000f48 <memset>:
     f48:	00f00313          	li	t1,15
     f4c:	00050713          	mv	a4,a0
     f50:	02c37e63          	bgeu	t1,a2,f8c <memset+0x44>
     f54:	00f77793          	and	a5,a4,15
     f58:	0a079063          	bnez	a5,ff8 <memset+0xb0>
     f5c:	08059263          	bnez	a1,fe0 <memset+0x98>
     f60:	ff067693          	and	a3,a2,-16
     f64:	00f67613          	and	a2,a2,15
     f68:	00e686b3          	add	a3,a3,a4
     f6c:	00b72023          	sw	a1,0(a4)
     f70:	00b72223          	sw	a1,4(a4)
     f74:	00b72423          	sw	a1,8(a4)
     f78:	00b72623          	sw	a1,12(a4)
     f7c:	01070713          	add	a4,a4,16
     f80:	fed766e3          	bltu	a4,a3,f6c <memset+0x24>
     f84:	00061463          	bnez	a2,f8c <memset+0x44>
     f88:	00008067          	ret
     f8c:	40c306b3          	sub	a3,t1,a2
     f90:	00269693          	sll	a3,a3,0x2
     f94:	00000297          	auipc	t0,0x0
     f98:	005686b3          	add	a3,a3,t0
     f9c:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
     fa0:	00b70723          	sb	a1,14(a4)
     fa4:	00b706a3          	sb	a1,13(a4)
     fa8:	00b70623          	sb	a1,12(a4)
     fac:	00b705a3          	sb	a1,11(a4)
     fb0:	00b70523          	sb	a1,10(a4)
     fb4:	00b704a3          	sb	a1,9(a4)
     fb8:	00b70423          	sb	a1,8(a4)
     fbc:	00b703a3          	sb	a1,7(a4)
     fc0:	00b70323          	sb	a1,6(a4)
     fc4:	00b702a3          	sb	a1,5(a4)
     fc8:	00b70223          	sb	a1,4(a4)
     fcc:	00b701a3          	sb	a1,3(a4)
     fd0:	00b70123          	sb	a1,2(a4)
     fd4:	00b700a3          	sb	a1,1(a4)
     fd8:	00b70023          	sb	a1,0(a4)
     fdc:	00008067          	ret
     fe0:	0ff5f593          	zext.b	a1,a1
     fe4:	00859693          	sll	a3,a1,0x8
     fe8:	00d5e5b3          	or	a1,a1,a3
     fec:	01059693          	sll	a3,a1,0x10
     ff0:	00d5e5b3          	or	a1,a1,a3
     ff4:	f6dff06f          	j	f60 <memset+0x18>
     ff8:	00279693          	sll	a3,a5,0x2
     ffc:	00000297          	auipc	t0,0x0
    1000:	005686b3          	add	a3,a3,t0
    1004:	00008293          	mv	t0,ra
    1008:	fa0680e7          	jalr	-96(a3)
    100c:	00028093          	mv	ra,t0
    1010:	ff078793          	add	a5,a5,-16
    1014:	40f70733          	sub	a4,a4,a5
    1018:	00f60633          	add	a2,a2,a5
    101c:	f6c378e3          	bgeu	t1,a2,f8c <memset+0x44>
    1020:	f3dff06f          	j	f5c <memset+0x14>

00001024 <memcpy>:
    1024:	00a5c7b3          	xor	a5,a1,a0
    1028:	0037f793          	and	a5,a5,3
    102c:	00c508b3          	add	a7,a0,a2
    1030:	06079463          	bnez	a5,1098 <memcpy+0x74>
    1034:	00300793          	li	a5,3
    1038:	06c7f063          	bgeu	a5,a2,1098 <memcpy+0x74>
    103c:	00357793          	and	a5,a0,3
    1040:	00050713          	mv	a4,a0
    1044:	06079a63          	bnez	a5,10b8 <memcpy+0x94>
    1048:	ffc8f613          	and	a2,a7,-4
    104c:	40e606b3          	sub	a3,a2,a4
    1050:	02000793          	li	a5,32
    1054:	08d7ce63          	blt	a5,a3,10f0 <memcpy+0xcc>
    1058:	00058693          	mv	a3,a1
    105c:	00070793          	mv	a5,a4
    1060:	02c77863          	bgeu	a4,a2,1090 <memcpy+0x6c>
    1064:	0006a803          	lw	a6,0(a3)
    1068:	00478793          	add	a5,a5,4
    106c:	00468693          	add	a3,a3,4
    1070:	ff07ae23          	sw	a6,-4(a5)
    1074:	fec7e8e3          	bltu	a5,a2,1064 <memcpy+0x40>
    1078:	fff60793          	add	a5,a2,-1
    107c:	40e787b3          	sub	a5,a5,a4
    1080:	ffc7f793          	and	a5,a5,-4
    1084:	00478793          	add	a5,a5,4
    1088:	00f70733          	add	a4,a4,a5
    108c:	00f585b3          	add	a1,a1,a5
    1090:	01176863          	bltu	a4,a7,10a0 <memcpy+0x7c>
    1094:	00008067          	ret
    1098:	00050713          	mv	a4,a0
    109c:	05157863          	bgeu	a0,a7,10ec <memcpy+0xc8>
    10a0:	0005c783          	lbu	a5,0(a1)
    10a4:	00170713          	add	a4,a4,1
    10a8:	00158593          	add	a1,a1,1
    10ac:	fef70fa3          	sb	a5,-1(a4)
    10b0:	fee898e3          	bne	a7,a4,10a0 <memcpy+0x7c>
    10b4:	00008067          	ret
    10b8:	0005c683          	lbu	a3,0(a1)
    10bc:	00170713          	add	a4,a4,1
    10c0:	00377793          	and	a5,a4,3
    10c4:	fed70fa3          	sb	a3,-1(a4)
    10c8:	00158593          	add	a1,a1,1
    10cc:	f6078ee3          	beqz	a5,1048 <memcpy+0x24>
    10d0:	0005c683          	lbu	a3,0(a1)
    10d4:	00170713          	add	a4,a4,1
    10d8:	00377793          	and	a5,a4,3
    10dc:	fed70fa3          	sb	a3,-1(a4)
    10e0:	00158593          	add	a1,a1,1
    10e4:	fc079ae3          	bnez	a5,10b8 <memcpy+0x94>
    10e8:	f61ff06f          	j	1048 <memcpy+0x24>
    10ec:	00008067          	ret
    10f0:	ff010113          	add	sp,sp,-16
    10f4:	00812623          	sw	s0,12(sp)
    10f8:	02000413          	li	s0,32
    10fc:	0005a383          	lw	t2,0(a1)
    1100:	0045a283          	lw	t0,4(a1)
    1104:	0085af83          	lw	t6,8(a1)
    1108:	00c5af03          	lw	t5,12(a1)
    110c:	0105ae83          	lw	t4,16(a1)
    1110:	0145ae03          	lw	t3,20(a1)
    1114:	0185a303          	lw	t1,24(a1)
    1118:	01c5a803          	lw	a6,28(a1)
    111c:	0205a683          	lw	a3,32(a1)
    1120:	02470713          	add	a4,a4,36
    1124:	40e607b3          	sub	a5,a2,a4
    1128:	fc772e23          	sw	t2,-36(a4)
    112c:	fe572023          	sw	t0,-32(a4)
    1130:	fff72223          	sw	t6,-28(a4)
    1134:	ffe72423          	sw	t5,-24(a4)
    1138:	ffd72623          	sw	t4,-20(a4)
    113c:	ffc72823          	sw	t3,-16(a4)
    1140:	fe672a23          	sw	t1,-12(a4)
    1144:	ff072c23          	sw	a6,-8(a4)
    1148:	fed72e23          	sw	a3,-4(a4)
    114c:	02458593          	add	a1,a1,36
    1150:	faf446e3          	blt	s0,a5,10fc <memcpy+0xd8>
    1154:	00058693          	mv	a3,a1
    1158:	00070793          	mv	a5,a4
    115c:	02c77863          	bgeu	a4,a2,118c <memcpy+0x168>
    1160:	0006a803          	lw	a6,0(a3)
    1164:	00478793          	add	a5,a5,4
    1168:	00468693          	add	a3,a3,4
    116c:	ff07ae23          	sw	a6,-4(a5)
    1170:	fec7e8e3          	bltu	a5,a2,1160 <memcpy+0x13c>
    1174:	fff60793          	add	a5,a2,-1
    1178:	40e787b3          	sub	a5,a5,a4
    117c:	ffc7f793          	and	a5,a5,-4
    1180:	00478793          	add	a5,a5,4
    1184:	00f70733          	add	a4,a4,a5
    1188:	00f585b3          	add	a1,a1,a5
    118c:	01176863          	bltu	a4,a7,119c <memcpy+0x178>
    1190:	00c12403          	lw	s0,12(sp)
    1194:	01010113          	add	sp,sp,16
    1198:	00008067          	ret
    119c:	0005c783          	lbu	a5,0(a1)
    11a0:	00170713          	add	a4,a4,1
    11a4:	00158593          	add	a1,a1,1
    11a8:	fef70fa3          	sb	a5,-1(a4)
    11ac:	fee882e3          	beq	a7,a4,1190 <memcpy+0x16c>
    11b0:	0005c783          	lbu	a5,0(a1)
    11b4:	00170713          	add	a4,a4,1
    11b8:	00158593          	add	a1,a1,1
    11bc:	fef70fa3          	sb	a5,-1(a4)
    11c0:	fce89ee3          	bne	a7,a4,119c <memcpy+0x178>
    11c4:	fcdff06f          	j	1190 <memcpy+0x16c>

000011c8 <strlen>:
    11c8:	00357793          	and	a5,a0,3
    11cc:	00050713          	mv	a4,a0
    11d0:	04079c63          	bnez	a5,1228 <strlen+0x60>
    11d4:	7f7f86b7          	lui	a3,0x7f7f8
    11d8:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
    11dc:	fff00593          	li	a1,-1
    11e0:	00072603          	lw	a2,0(a4)
    11e4:	00470713          	add	a4,a4,4
    11e8:	00d677b3          	and	a5,a2,a3
    11ec:	00d787b3          	add	a5,a5,a3
    11f0:	00c7e7b3          	or	a5,a5,a2
    11f4:	00d7e7b3          	or	a5,a5,a3
    11f8:	feb784e3          	beq	a5,a1,11e0 <strlen+0x18>
    11fc:	ffc74683          	lbu	a3,-4(a4)
    1200:	40a707b3          	sub	a5,a4,a0
    1204:	04068463          	beqz	a3,124c <strlen+0x84>
    1208:	ffd74683          	lbu	a3,-3(a4)
    120c:	02068c63          	beqz	a3,1244 <strlen+0x7c>
    1210:	ffe74503          	lbu	a0,-2(a4)
    1214:	00a03533          	snez	a0,a0
    1218:	00f50533          	add	a0,a0,a5
    121c:	ffe50513          	add	a0,a0,-2
    1220:	00008067          	ret
    1224:	fa0688e3          	beqz	a3,11d4 <strlen+0xc>
    1228:	00074783          	lbu	a5,0(a4)
    122c:	00170713          	add	a4,a4,1
    1230:	00377693          	and	a3,a4,3
    1234:	fe0798e3          	bnez	a5,1224 <strlen+0x5c>
    1238:	40a70733          	sub	a4,a4,a0
    123c:	fff70513          	add	a0,a4,-1
    1240:	00008067          	ret
    1244:	ffd78513          	add	a0,a5,-3
    1248:	00008067          	ret
    124c:	ffc78513          	add	a0,a5,-4
    1250:	00008067          	ret

00001254 <__divsi3>:
    1254:	06054063          	bltz	a0,12b4 <__umodsi3+0x10>
    1258:	0605c663          	bltz	a1,12c4 <__umodsi3+0x20>

0000125c <__hidden___udivsi3>:
    125c:	00058613          	mv	a2,a1
    1260:	00050593          	mv	a1,a0
    1264:	fff00513          	li	a0,-1
    1268:	02060c63          	beqz	a2,12a0 <__hidden___udivsi3+0x44>
    126c:	00100693          	li	a3,1
    1270:	00b67a63          	bgeu	a2,a1,1284 <__hidden___udivsi3+0x28>
    1274:	00c05863          	blez	a2,1284 <__hidden___udivsi3+0x28>
    1278:	00161613          	sll	a2,a2,0x1
    127c:	00169693          	sll	a3,a3,0x1
    1280:	feb66ae3          	bltu	a2,a1,1274 <__hidden___udivsi3+0x18>
    1284:	00000513          	li	a0,0
    1288:	00c5e663          	bltu	a1,a2,1294 <__hidden___udivsi3+0x38>
    128c:	40c585b3          	sub	a1,a1,a2
    1290:	00d56533          	or	a0,a0,a3
    1294:	0016d693          	srl	a3,a3,0x1
    1298:	00165613          	srl	a2,a2,0x1
    129c:	fe0696e3          	bnez	a3,1288 <__hidden___udivsi3+0x2c>
    12a0:	00008067          	ret

000012a4 <__umodsi3>:
    12a4:	00008293          	mv	t0,ra
    12a8:	fb5ff0ef          	jal	125c <__hidden___udivsi3>
    12ac:	00058513          	mv	a0,a1
    12b0:	00028067          	jr	t0 # ffc <memset+0xb4>
    12b4:	40a00533          	neg	a0,a0
    12b8:	00b04863          	bgtz	a1,12c8 <__umodsi3+0x24>
    12bc:	40b005b3          	neg	a1,a1
    12c0:	f9dff06f          	j	125c <__hidden___udivsi3>
    12c4:	40b005b3          	neg	a1,a1
    12c8:	00008293          	mv	t0,ra
    12cc:	f91ff0ef          	jal	125c <__hidden___udivsi3>
    12d0:	40a00533          	neg	a0,a0
    12d4:	00028067          	jr	t0

000012d8 <__modsi3>:
    12d8:	00008293          	mv	t0,ra
    12dc:	0005ca63          	bltz	a1,12f0 <__modsi3+0x18>
    12e0:	00054c63          	bltz	a0,12f8 <__modsi3+0x20>
    12e4:	f79ff0ef          	jal	125c <__hidden___udivsi3>
    12e8:	00058513          	mv	a0,a1
    12ec:	00028067          	jr	t0
    12f0:	40b005b3          	neg	a1,a1
    12f4:	fe0558e3          	bgez	a0,12e4 <__modsi3+0xc>
    12f8:	40a00533          	neg	a0,a0
    12fc:	f61ff0ef          	jal	125c <__hidden___udivsi3>
    1300:	40b00533          	neg	a0,a1
    1304:	00028067          	jr	t0
