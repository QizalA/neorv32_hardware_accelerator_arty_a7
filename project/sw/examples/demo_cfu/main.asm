
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80002217          	auipc	tp,0x80002
       8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f418193          	add	gp,gp,2036 # 80000804 <__global_pointer$>
      18:	000022b7          	lui	t0,0x2
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__etext+0x104>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	17830313          	add	t1,t1,376 # 19c <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	e4c38393          	add	t2,t2,-436 # 1e80 <__RODATA_END__>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <x32.0>
      44:	80000497          	auipc	s1,0x80000
      48:	fc048493          	add	s1,s1,-64 # 80000004 <time_dec_hw>
      4c:	80000517          	auipc	a0,0x80000
      50:	fb850513          	add	a0,a0,-72 # 80000004 <time_dec_hw>
      54:	80000597          	auipc	a1,0x80000
      58:	53458593          	add	a1,a1,1332 # 80000588 <__BSS_END__>
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
     110:	5f040413          	add	s0,s0,1520 # 16fc <__etext>
     114:	00001497          	auipc	s1,0x1
     118:	5e848493          	add	s1,s1,1512 # 16fc <__etext>

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
     170:	59040413          	add	s0,s0,1424 # 16fc <__etext>
     174:	00001497          	auipc	s1,0x1
     178:	58848493          	add	s1,s1,1416 # 16fc <__etext>

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
 * @note This program requires UART0 and the Zxcfu and Zicntr ISA extension.
 *
 * @return 0 if execution was successful
 **************************************************************************/
int main() {
     1dc:	fb010113          	add	sp,sp,-80
     1e0:	04112623          	sw	ra,76(sp)
     1e4:	04812423          	sw	s0,72(sp)
     1e8:	04912223          	sw	s1,68(sp)
     1ec:	05212023          	sw	s2,64(sp)
     1f0:	03312e23          	sw	s3,60(sp)
     1f4:	03412c23          	sw	s4,56(sp)
     1f8:	03512a23          	sw	s5,52(sp)
     1fc:	03612823          	sw	s6,48(sp)
     200:	03712623          	sw	s7,44(sp)
     204:	03812423          	sw	s8,40(sp)
     208:	03912223          	sw	s9,36(sp)
     20c:	03a12023          	sw	s10,32(sp)

  uint32_t i, j;
  uint32_t v[2];

  // initialize NEORV32 run-time environment
  neorv32_rte_setup();
     210:	51d000ef          	jal	f2c <neorv32_rte_setup>

  // check if UART0 is implemented
  if (neorv32_uart0_available() == 0) {
     214:	fff50537          	lui	a0,0xfff50
     218:	569000ef          	jal	f80 <neorv32_uart_available>
     21c:	02050863          	beqz	a0,24c <main+0x70>
    return -1; // UART0 not available, exit
  }

  // setup UART0 at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);
     220:	000055b7          	lui	a1,0x5
     224:	00000613          	li	a2,0
     228:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     22c:	fff50537          	lui	a0,0xfff50
     230:	58d000ef          	jal	fbc <neorv32_uart_setup>

  // check if the CFU is implemented (the CFU is wrapped in the core's "Zxcfu" ISA extension)
  if (neorv32_cpu_cfu_available() == 0) {
     234:	6cc000ef          	jal	900 <neorv32_cpu_cfu_available>
     238:	04051863          	bnez	a0,288 <main+0xac>
    neorv32_uart0_printf("ERROR! CFU ('Zxcfu' ISA extensions) not implemented!\n");
     23c:	000015b7          	lui	a1,0x1
     240:	6fc58593          	add	a1,a1,1788 # 16fc <__etext>
     244:	fff50537          	lui	a0,0xfff50
     248:	098010ef          	jal	12e0 <neorv32_uart_printf>
    return -1; // UART0 not available, exit
     24c:	fff00513          	li	a0,-1
  xtea_hw_illegal_inst();


  neorv32_uart0_printf("\nCFU demo program completed.\n");
  return 0;
}
     250:	04c12083          	lw	ra,76(sp)
     254:	04812403          	lw	s0,72(sp)
     258:	04412483          	lw	s1,68(sp)
     25c:	04012903          	lw	s2,64(sp)
     260:	03c12983          	lw	s3,60(sp)
     264:	03812a03          	lw	s4,56(sp)
     268:	03412a83          	lw	s5,52(sp)
     26c:	03012b03          	lw	s6,48(sp)
     270:	02c12b83          	lw	s7,44(sp)
     274:	02812c03          	lw	s8,40(sp)
     278:	02412c83          	lw	s9,36(sp)
     27c:	02012d03          	lw	s10,32(sp)
     280:	05010113          	add	sp,sp,80
     284:	00008067          	ret
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     288:	fc0027f3          	csrr	a5,0xfc0
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZICNTR)) == 0) {
     28c:	0807f793          	and	a5,a5,128
     290:	00079863          	bnez	a5,2a0 <main+0xc4>
    neorv32_uart0_printf("ERROR! Base counters ('Zicntr' ISA extensions) not implemented!\n");
     294:	000015b7          	lui	a1,0x1
     298:	73458593          	add	a1,a1,1844 # 1734 <__etext+0x38>
     29c:	fa9ff06f          	j	244 <main+0x68>
  neorv32_uart0_printf("\n<<< NEORV32 Custom Functions Unit (CFU) - Custom Instructions Example >>>\n\n");
     2a0:	000015b7          	lui	a1,0x1
     2a4:	77858593          	add	a1,a1,1912 # 1778 <__etext+0x7c>
     2a8:	fff50537          	lui	a0,0xfff50
     2ac:	034010ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("[NOTE] This program assumes the default CFU hardware in\n"
     2b0:	000015b7          	lui	a1,0x1
     2b4:	7c858593          	add	a1,a1,1992 # 17c8 <__etext+0xcc>
     2b8:	fff50537          	lui	a0,0xfff50
     2bc:	024010ef          	jal	12e0 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     2c0:	207237b7          	lui	a5,0x20723
     2c4:	0ba78793          	add	a5,a5,186 # 207230ba <__neorv32_rom_size+0x2071f0ba>
     2c8:	80079073          	csrw	0x800,a5
     2cc:	1ffba7b7          	lui	a5,0x1ffba
     2d0:	71078793          	add	a5,a5,1808 # 1ffba710 <__neorv32_rom_size+0x1ffb6710>
     2d4:	80179073          	csrw	0x801,a5
     2d8:	c45277b7          	lui	a5,0xc4527
     2dc:	1ef78793          	add	a5,a5,495 # c45271ef <__crt0_ram_last+0x445251f0>
     2e0:	80279073          	csrw	0x802,a5
     2e4:	dd0177b7          	lui	a5,0xdd017
     2e8:	68a78793          	add	a5,a5,1674 # dd01768a <__crt0_ram_last+0x5d01568b>
     2ec:	80379073          	csrw	0x803,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     2f0:	80002673          	csrr	a2,0x800
     2f4:	801026f3          	csrr	a3,0x801
     2f8:	80202773          	csrr	a4,0x802
     2fc:	803027f3          	csrr	a5,0x803
  neorv32_uart0_printf("XTEA key: 0x%x%x%x%x\n\n",
     300:	000025b7          	lui	a1,0x2
     304:	c1018993          	add	s3,gp,-1008 # 80000414 <input_data>
     308:	87458593          	add	a1,a1,-1932 # 1874 <__etext+0x178>
     30c:	fff50537          	lui	a0,0xfff50
     310:	7d1000ef          	jal	12e0 <neorv32_uart_printf>
  for (i=0; i<DATA_NUM; i++) {
     314:	10098913          	add	s2,s3,256
  neorv32_uart0_printf("XTEA key: 0x%x%x%x%x\n\n",
     318:	c1018413          	add	s0,gp,-1008 # 80000414 <input_data>
    input_data[i] = neorv32_aux_xorshift32();
     31c:	4d8000ef          	jal	7f4 <neorv32_aux_xorshift32>
     320:	00a42023          	sw	a0,0(s0)
  for (i=0; i<DATA_NUM; i++) {
     324:	00440413          	add	s0,s0,4
     328:	ff241ae3          	bne	s0,s2,31c <main+0x140>
  neorv32_uart0_printf("XTEA SW encryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     32c:	000025b7          	lui	a1,0x2
     330:	04000693          	li	a3,64
     334:	02800613          	li	a2,40
     338:	88c58593          	add	a1,a1,-1908 # 188c <__etext+0x190>
     33c:	fff50537          	lui	a0,0xfff50
     340:	7a1000ef          	jal	12e0 <neorv32_uart_printf>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     344:	00000793          	li	a5,0
     348:	b0079073          	csrw	mcycle,a5
  for (i=0; i<(DATA_NUM/2); i++) {
     34c:	b1018493          	add	s1,gp,-1264 # 80000314 <cypher_data_sw>
     350:	00098a13          	mv	s4,s3
     354:	b1018413          	add	s0,gp,-1264 # 80000314 <cypher_data_sw>
    xtea_sw_encipher(XTEA_ROUNDS, v, key);
     358:	00002c37          	lui	s8,0x2
    v[0] = input_data[i*2+0];
     35c:	000a2783          	lw	a5,0(s4)
    xtea_sw_encipher(XTEA_ROUNDS, v, key);
     360:	c98c0613          	add	a2,s8,-872 # 1c98 <key>
     364:	01810593          	add	a1,sp,24
    v[0] = input_data[i*2+0];
     368:	00f12c23          	sw	a5,24(sp)
    v[1] = input_data[i*2+1];
     36c:	004a2783          	lw	a5,4(s4)
    xtea_sw_encipher(XTEA_ROUNDS, v, key);
     370:	01400513          	li	a0,20
  for (i=0; i<(DATA_NUM/2); i++) {
     374:	008a0a13          	add	s4,s4,8
    v[1] = input_data[i*2+1];
     378:	00f12e23          	sw	a5,28(sp)
    xtea_sw_encipher(XTEA_ROUNDS, v, key);
     37c:	328000ef          	jal	6a4 <xtea_sw_encipher>
    cypher_data_sw[i*2+0] = v[0];
     380:	01812783          	lw	a5,24(sp)
  for (i=0; i<(DATA_NUM/2); i++) {
     384:	00840413          	add	s0,s0,8
    cypher_data_sw[i*2+0] = v[0];
     388:	fef42c23          	sw	a5,-8(s0)
    cypher_data_sw[i*2+1] = v[1];
     38c:	01c12783          	lw	a5,28(sp)
     390:	fef42e23          	sw	a5,-4(s0)
  for (i=0; i<(DATA_NUM/2); i++) {
     394:	fd2a14e3          	bne	s4,s2,35c <main+0x180>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     398:	b00027f3          	csrr	a5,mcycle
  neorv32_uart0_printf("XTEA HW encryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     39c:	000025b7          	lui	a1,0x2
     3a0:	04000693          	li	a3,64
     3a4:	02800613          	li	a2,40
     3a8:	8bc58593          	add	a1,a1,-1860 # 18bc <__etext+0x1c0>
     3ac:	fff50537          	lui	a0,0xfff50
  time_enc_sw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     3b0:	80f1a623          	sw	a5,-2036(gp) # 80000010 <time_enc_sw>
  neorv32_uart0_printf("XTEA HW encryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     3b4:	72d000ef          	jal	12e0 <neorv32_uart_printf>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     3b8:	00000793          	li	a5,0
     3bc:	b0079073          	csrw	mcycle,a5
  for (i=0; i<(DATA_NUM/2); i++) {
     3c0:	a1018413          	add	s0,gp,-1520 # 80000214 <cypher_data_hw>
     3c4:	a1018513          	add	a0,gp,-1520 # 80000214 <cypher_data_hw>
     3c8:	00098593          	mv	a1,s3
     3cc:	a1018793          	add	a5,gp,-1520 # 80000214 <cypher_data_hw>
    xtea_hw_init(0);
     3d0:	00000813          	li	a6,0
    v[0] = input_data[i*2+0];
     3d4:	0005a683          	lw	a3,0(a1)
    v[1] = input_data[i*2+1];
     3d8:	0045a703          	lw	a4,4(a1)
    xtea_hw_init(0);
     3dc:	0108460b          	.word	0x0108460b
     3e0:	01400613          	li	a2,20
      v[0] = xtea_hw_enc_v0_step(v[0], v[1]);
     3e4:	00e6868b          	.word	0x00e6868b
      v[1] = xtea_hw_enc_v1_step(v[0], v[1]);
     3e8:	00e6970b          	.word	0x00e6970b
    for (j=0; j<XTEA_ROUNDS; j++) {
     3ec:	fff60613          	add	a2,a2,-1
     3f0:	fe061ae3          	bnez	a2,3e4 <main+0x208>
    cypher_data_hw[i*2+0] = v[0];
     3f4:	00d52023          	sw	a3,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
    cypher_data_hw[i*2+1] = v[1];
     3f8:	00e52223          	sw	a4,4(a0)
  for (i=0; i<(DATA_NUM/2); i++) {
     3fc:	00858593          	add	a1,a1,8
     400:	00850513          	add	a0,a0,8
     404:	fd2598e3          	bne	a1,s2,3d4 <main+0x1f8>
     408:	00c12623          	sw	a2,12(sp)
     40c:	00d12c23          	sw	a3,24(sp)
     410:	00e12e23          	sw	a4,28(sp)
     414:	0ed7ac23          	sw	a3,248(a5)
     418:	0ee7ae23          	sw	a4,252(a5)
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     41c:	b00027f3          	csrr	a5,mcycle
  neorv32_uart0_printf("Comparing results... ");
     420:	00002bb7          	lui	s7,0x2
     424:	8ecb8593          	add	a1,s7,-1812 # 18ec <__etext+0x1f0>
     428:	fff50537          	lui	a0,0xfff50
  time_enc_hw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     42c:	80f1a423          	sw	a5,-2040(gp) # 8000000c <time_enc_hw>
  neorv32_uart0_printf("Comparing results... ");
     430:	6b1000ef          	jal	12e0 <neorv32_uart_printf>
  for (i=0; i<DATA_NUM; i++) {
     434:	00c12603          	lw	a2,12(sp)
  neorv32_uart0_printf("Comparing results... ");
     438:	00040793          	mv	a5,s0
     43c:	00048713          	mv	a4,s1
  for (i=0; i<DATA_NUM; i++) {
     440:	04000693          	li	a3,64
    if (cypher_data_sw[i] != cypher_data_hw[i]) {
     444:	00072503          	lw	a0,0(a4)
     448:	0007a583          	lw	a1,0(a5)
     44c:	00b50c63          	beq	a0,a1,464 <main+0x288>
      neorv32_uart0_printf("FAILED at byte %d\n", i);
     450:	000025b7          	lui	a1,0x2
     454:	90458593          	add	a1,a1,-1788 # 1904 <__etext+0x208>
     458:	fff50537          	lui	a0,0xfff50
     45c:	685000ef          	jal	12e0 <neorv32_uart_printf>
      return -1;
     460:	dedff06f          	j	24c <main+0x70>
  for (i=0; i<DATA_NUM; i++) {
     464:	00160613          	add	a2,a2,1
     468:	00470713          	add	a4,a4,4
     46c:	00478793          	add	a5,a5,4
     470:	fcd61ae3          	bne	a2,a3,444 <main+0x268>
  neorv32_uart0_printf("OK\n");
     474:	00002cb7          	lui	s9,0x2
     478:	918c8593          	add	a1,s9,-1768 # 1918 <__etext+0x21c>
     47c:	fff50537          	lui	a0,0xfff50
     480:	661000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("\n");
     484:	000025b7          	lui	a1,0x2
     488:	91c58593          	add	a1,a1,-1764 # 191c <__etext+0x220>
     48c:	fff50537          	lui	a0,0xfff50
     490:	651000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("XTEA SW decryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     494:	000025b7          	lui	a1,0x2
     498:	04000693          	li	a3,64
     49c:	02800613          	li	a2,40
     4a0:	92058593          	add	a1,a1,-1760 # 1920 <__etext+0x224>
     4a4:	fff50537          	lui	a0,0xfff50
     4a8:	639000ef          	jal	12e0 <neorv32_uart_printf>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     4ac:	00000793          	li	a5,0
     4b0:	b0079073          	csrw	mcycle,a5
  for (i=0; i<(DATA_NUM/2); i++) {
     4b4:	91018b13          	add	s6,gp,-1776 # 80000114 <plain_data_sw>
     4b8:	10048d13          	add	s10,s1,256
     4bc:	91018913          	add	s2,gp,-1776 # 80000114 <plain_data_sw>
    v[0] = cypher_data_sw[i*2+0];
     4c0:	0004a783          	lw	a5,0(s1)
    xtea_sw_decipher(XTEA_ROUNDS, v, key);
     4c4:	c98c0613          	add	a2,s8,-872
     4c8:	01810593          	add	a1,sp,24
    v[0] = cypher_data_sw[i*2+0];
     4cc:	00f12c23          	sw	a5,24(sp)
    v[1] = cypher_data_sw[i*2+1];
     4d0:	0044a783          	lw	a5,4(s1)
    xtea_sw_decipher(XTEA_ROUNDS, v, key);
     4d4:	01400513          	li	a0,20
  for (i=0; i<(DATA_NUM/2); i++) {
     4d8:	00848493          	add	s1,s1,8
    v[1] = cypher_data_sw[i*2+1];
     4dc:	00f12e23          	sw	a5,28(sp)
    xtea_sw_decipher(XTEA_ROUNDS, v, key);
     4e0:	250000ef          	jal	730 <xtea_sw_decipher>
    plain_data_sw[i*2+0] = v[0];
     4e4:	01812783          	lw	a5,24(sp)
  for (i=0; i<(DATA_NUM/2); i++) {
     4e8:	00890913          	add	s2,s2,8
    plain_data_sw[i*2+0] = v[0];
     4ec:	fef92c23          	sw	a5,-8(s2)
    plain_data_sw[i*2+1] = v[1];
     4f0:	01c12783          	lw	a5,28(sp)
     4f4:	fef92e23          	sw	a5,-4(s2)
  for (i=0; i<(DATA_NUM/2); i++) {
     4f8:	fda494e3          	bne	s1,s10,4c0 <main+0x2e4>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     4fc:	b00027f3          	csrr	a5,mcycle
  neorv32_uart0_printf("XTEA HW decryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     500:	000025b7          	lui	a1,0x2
  time_dec_sw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     504:	800004b7          	lui	s1,0x80000
  neorv32_uart0_printf("XTEA HW decryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     508:	04000693          	li	a3,64
     50c:	02800613          	li	a2,40
     510:	95058593          	add	a1,a1,-1712 # 1950 <__etext+0x254>
     514:	fff50537          	lui	a0,0xfff50
  time_dec_sw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     518:	00f4a423          	sw	a5,8(s1) # 80000008 <time_dec_sw>
  neorv32_uart0_printf("XTEA HW decryption (%u rounds, %u words)...\n", 2*XTEA_ROUNDS, DATA_NUM);
     51c:	5c5000ef          	jal	12e0 <neorv32_uart_printf>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     520:	00000793          	li	a5,0
     524:	b0079073          	csrw	mcycle,a5
  for (i=0; i<(DATA_NUM/2); i++) {
     528:	800007b7          	lui	a5,0x80000
    xtea_hw_init(XTEA_ROUNDS * xtea_delta);
     52c:	5c558537          	lui	a0,0x5c558
     530:	01478913          	add	s2,a5,20 # 80000014 <plain_data_hw>
     534:	01478593          	add	a1,a5,20
     538:	10040813          	add	a6,s0,256
     53c:	01478793          	add	a5,a5,20
     540:	27450513          	add	a0,a0,628 # 5c558274 <__neorv32_rom_size+0x5c554274>
     544:	00000893          	li	a7,0
    v[0] = cypher_data_hw[i*2+0];
     548:	00042683          	lw	a3,0(s0)
    v[1] = cypher_data_hw[i*2+1];
     54c:	00442703          	lw	a4,4(s0)
    xtea_hw_init(XTEA_ROUNDS * xtea_delta);
     550:	0115460b          	.word	0x0115460b
     554:	01400613          	li	a2,20
      v[1] = xtea_hw_dec_v1_step(v[0], v[1]);
     558:	00e6b70b          	.word	0x00e6b70b
      v[0] = xtea_hw_dec_v0_step(v[0], v[1]);
     55c:	00e6a68b          	.word	0x00e6a68b
    for (j=0; j<XTEA_ROUNDS; j++) {
     560:	fff60613          	add	a2,a2,-1
     564:	fe061ae3          	bnez	a2,558 <main+0x37c>
    plain_data_hw[i*2+0] = v[0];
     568:	00d5a023          	sw	a3,0(a1)
    plain_data_hw[i*2+1] = v[1];
     56c:	00e5a223          	sw	a4,4(a1)
  for (i=0; i<(DATA_NUM/2); i++) {
     570:	00840413          	add	s0,s0,8
     574:	00858593          	add	a1,a1,8
     578:	fd0418e3          	bne	s0,a6,548 <main+0x36c>
     57c:	00c12623          	sw	a2,12(sp)
     580:	00e12e23          	sw	a4,28(sp)
     584:	00d12c23          	sw	a3,24(sp)
     588:	0ed7ac23          	sw	a3,248(a5)
     58c:	0ee7ae23          	sw	a4,252(a5)
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     590:	b00027f3          	csrr	a5,mcycle
  time_dec_hw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     594:	80000437          	lui	s0,0x80000
  neorv32_uart0_printf("Comparing results... ");
     598:	8ecb8593          	add	a1,s7,-1812
     59c:	fff50537          	lui	a0,0xfff50
  time_dec_hw = neorv32_cpu_csr_read(CSR_MCYCLE); // stop timing
     5a0:	00f42223          	sw	a5,4(s0) # 80000004 <time_dec_hw>
  neorv32_uart0_printf("Comparing results... ");
     5a4:	53d000ef          	jal	12e0 <neorv32_uart_printf>
  for (i=0; i<DATA_NUM; i++) {
     5a8:	00c12603          	lw	a2,12(sp)
     5ac:	04000713          	li	a4,64
    if ((plain_data_sw[i] != plain_data_hw[i]) || (plain_data_sw[i] != input_data[i])) {
     5b0:	000b2783          	lw	a5,0(s6)
     5b4:	00092683          	lw	a3,0(s2)
     5b8:	e8d79ce3          	bne	a5,a3,450 <main+0x274>
     5bc:	0009a683          	lw	a3,0(s3)
     5c0:	e8d798e3          	bne	a5,a3,450 <main+0x274>
  for (i=0; i<DATA_NUM; i++) {
     5c4:	00160613          	add	a2,a2,1
     5c8:	004b0b13          	add	s6,s6,4
     5cc:	00490913          	add	s2,s2,4
     5d0:	00498993          	add	s3,s3,4
     5d4:	fce61ee3          	bne	a2,a4,5b0 <main+0x3d4>
  neorv32_uart0_printf("OK\n");
     5d8:	918c8593          	add	a1,s9,-1768
     5dc:	fff50537          	lui	a0,0xfff50
     5e0:	501000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("\nExecution timing:\n");
     5e4:	000025b7          	lui	a1,0x2
     5e8:	98058593          	add	a1,a1,-1664 # 1980 <__etext+0x284>
     5ec:	fff50537          	lui	a0,0xfff50
     5f0:	4f1000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("ENC SW = %u cycles\n", time_enc_sw);
     5f4:	80c1a603          	lw	a2,-2036(gp) # 80000010 <time_enc_sw>
     5f8:	000025b7          	lui	a1,0x2
     5fc:	99458593          	add	a1,a1,-1644 # 1994 <__etext+0x298>
     600:	fff50537          	lui	a0,0xfff50
     604:	4dd000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("ENC HW = %u cycles\n", time_enc_hw);
     608:	8081a603          	lw	a2,-2040(gp) # 8000000c <time_enc_hw>
     60c:	000025b7          	lui	a1,0x2
     610:	9a858593          	add	a1,a1,-1624 # 19a8 <__etext+0x2ac>
     614:	fff50537          	lui	a0,0xfff50
     618:	4c9000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("DEC SW = %u cycles\n", time_dec_sw);
     61c:	0084a603          	lw	a2,8(s1)
     620:	000025b7          	lui	a1,0x2
     624:	9bc58593          	add	a1,a1,-1604 # 19bc <__etext+0x2c0>
     628:	fff50537          	lui	a0,0xfff50
     62c:	4b5000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("DEC HW = %u cycles\n", time_dec_hw);
     630:	00442603          	lw	a2,4(s0)
     634:	000025b7          	lui	a1,0x2
     638:	9d058593          	add	a1,a1,-1584 # 19d0 <__etext+0x2d4>
     63c:	fff50537          	lui	a0,0xfff50
     640:	4a1000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("Average speedup: ~%ux\n", (time_enc_sw + time_dec_sw) / (time_enc_hw + time_dec_hw));
     644:	0084a783          	lw	a5,8(s1)
     648:	00442703          	lw	a4,4(s0)
     64c:	80c1a503          	lw	a0,-2036(gp) # 80000010 <time_enc_sw>
     650:	8081a583          	lw	a1,-2040(gp) # 8000000c <time_enc_hw>
     654:	00f50533          	add	a0,a0,a5
     658:	00e585b3          	add	a1,a1,a4
     65c:	7f5000ef          	jal	1650 <__hidden___udivsi3>
     660:	000025b7          	lui	a1,0x2
     664:	00050613          	mv	a2,a0
     668:	9e458593          	add	a1,a1,-1564 # 19e4 <__etext+0x2e8>
     66c:	fff50537          	lui	a0,0xfff50
     670:	471000ef          	jal	12e0 <neorv32_uart_printf>
  neorv32_uart0_printf("\nExecuting non-implemented CFU instruction (raise ILLEGAL INSTRUCTION exception)...\n");
     674:	000025b7          	lui	a1,0x2
     678:	9fc58593          	add	a1,a1,-1540 # 19fc <__etext+0x300>
     67c:	fff50537          	lui	a0,0xfff50
     680:	461000ef          	jal	12e0 <neorv32_uart_printf>
  xtea_hw_illegal_inst();
     684:	00000793          	li	a5,0
     688:	00f7f78b          	.word	0x00f7f78b
  neorv32_uart0_printf("\nCFU demo program completed.\n");
     68c:	000025b7          	lui	a1,0x2
     690:	fff50537          	lui	a0,0xfff50
     694:	a5458593          	add	a1,a1,-1452 # 1a54 <__etext+0x358>
     698:	449000ef          	jal	12e0 <neorv32_uart_printf>
  return 0;
     69c:	00000513          	li	a0,0
     6a0:	bb1ff06f          	j	250 <main+0x74>

000006a4 <xtea_sw_encipher>:
  uint32_t v0 = v[0];
     6a4:	0005a703          	lw	a4,0(a1)
  uint32_t v1 = v[1];
     6a8:	0045a783          	lw	a5,4(a1)
    sum += xtea_delta;
     6ac:	9e378e37          	lui	t3,0x9e378
  uint32_t sum = 0;
     6b0:	00000693          	li	a3,0
  for (i=0; i < num_cycles; i++) {
     6b4:	00000313          	li	t1,0
    sum += xtea_delta;
     6b8:	9b9e0e13          	add	t3,t3,-1607 # 9e3779b9 <__crt0_ram_last+0x1e3759ba>
  for (i=0; i < num_cycles; i++) {
     6bc:	00a31863          	bne	t1,a0,6cc <xtea_sw_encipher+0x28>
  v[0] = v0;
     6c0:	00e5a023          	sw	a4,0(a1)
  v[1] = v1;
     6c4:	00f5a223          	sw	a5,4(a1)
}
     6c8:	00008067          	ret
    v0  += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + k[sum & 3]);
     6cc:	0036f813          	and	a6,a3,3
     6d0:	00281813          	sll	a6,a6,0x2
     6d4:	01060833          	add	a6,a2,a6
     6d8:	00082803          	lw	a6,0(a6)
     6dc:	0057de93          	srl	t4,a5,0x5
     6e0:	00479893          	sll	a7,a5,0x4
     6e4:	01d8c8b3          	xor	a7,a7,t4
     6e8:	00f888b3          	add	a7,a7,a5
     6ec:	01068833          	add	a6,a3,a6
     6f0:	01184833          	xor	a6,a6,a7
    sum += xtea_delta;
     6f4:	01c686b3          	add	a3,a3,t3
    v0  += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + k[sum & 3]);
     6f8:	01070733          	add	a4,a4,a6
    v1  += (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + k[(sum>>11) & 3]);
     6fc:	0096d813          	srl	a6,a3,0x9
     700:	00c87813          	and	a6,a6,12
     704:	01060833          	add	a6,a2,a6
     708:	00082803          	lw	a6,0(a6)
     70c:	00471893          	sll	a7,a4,0x4
     710:	00575e93          	srl	t4,a4,0x5
     714:	01d8c8b3          	xor	a7,a7,t4
     718:	01068833          	add	a6,a3,a6
     71c:	00e888b3          	add	a7,a7,a4
     720:	01184833          	xor	a6,a6,a7
     724:	010787b3          	add	a5,a5,a6
  for (i=0; i < num_cycles; i++) {
     728:	00130313          	add	t1,t1,1
     72c:	f91ff06f          	j	6bc <xtea_sw_encipher+0x18>

00000730 <xtea_sw_decipher>:
void xtea_sw_decipher(unsigned int num_cycles, uint32_t *v, const uint32_t k[4]) {
     730:	fe010113          	add	sp,sp,-32
     734:	00812c23          	sw	s0,24(sp)
     738:	00912a23          	sw	s1,20(sp)
     73c:	01212823          	sw	s2,16(sp)
  uint32_t v1 = v[1];
     740:	0045a483          	lw	s1,4(a1)
  uint32_t v0 = v[0];
     744:	0005a903          	lw	s2,0(a1)
void xtea_sw_decipher(unsigned int num_cycles, uint32_t *v, const uint32_t k[4]) {
     748:	00058413          	mv	s0,a1
  uint32_t sum = xtea_delta * num_cycles;
     74c:	9e3785b7          	lui	a1,0x9e378
     750:	9b958593          	add	a1,a1,-1607 # 9e3779b9 <__crt0_ram_last+0x1e3759ba>
void xtea_sw_decipher(unsigned int num_cycles, uint32_t *v, const uint32_t k[4]) {
     754:	01312623          	sw	s3,12(sp)
     758:	00112e23          	sw	ra,28(sp)
     75c:	00060993          	mv	s3,a2
  uint32_t sum = xtea_delta * num_cycles;
     760:	6c5000ef          	jal	1624 <__mulsi3>
    sum -= xtea_delta;
     764:	61c886b7          	lui	a3,0x61c88
     768:	64768693          	add	a3,a3,1607 # 61c88647 <__neorv32_rom_size+0x61c84647>
  for (i=0; i < num_cycles; i++) {
     76c:	02051463          	bnez	a0,794 <xtea_sw_decipher+0x64>
  v[0] = v0;
     770:	01242023          	sw	s2,0(s0)
  v[1] = v1;
     774:	00942223          	sw	s1,4(s0)
}
     778:	01c12083          	lw	ra,28(sp)
     77c:	01812403          	lw	s0,24(sp)
     780:	01412483          	lw	s1,20(sp)
     784:	01012903          	lw	s2,16(sp)
     788:	00c12983          	lw	s3,12(sp)
     78c:	02010113          	add	sp,sp,32
     790:	00008067          	ret
    v1  -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + k[(sum>>11) & 3]);
     794:	00955793          	srl	a5,a0,0x9
     798:	00c7f793          	and	a5,a5,12
     79c:	00f987b3          	add	a5,s3,a5
     7a0:	0007a783          	lw	a5,0(a5)
     7a4:	00595613          	srl	a2,s2,0x5
     7a8:	00491713          	sll	a4,s2,0x4
     7ac:	00c74733          	xor	a4,a4,a2
     7b0:	01270733          	add	a4,a4,s2
     7b4:	00f507b3          	add	a5,a0,a5
     7b8:	00e7c7b3          	xor	a5,a5,a4
    sum -= xtea_delta;
     7bc:	00d50533          	add	a0,a0,a3
    v1  -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + k[(sum>>11) & 3]);
     7c0:	40f484b3          	sub	s1,s1,a5
    v0  -= (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + k[sum & 3]);
     7c4:	00357793          	and	a5,a0,3
     7c8:	00279793          	sll	a5,a5,0x2
     7cc:	00f987b3          	add	a5,s3,a5
     7d0:	0007a783          	lw	a5,0(a5)
     7d4:	00449713          	sll	a4,s1,0x4
     7d8:	0054d613          	srl	a2,s1,0x5
     7dc:	00c74733          	xor	a4,a4,a2
     7e0:	00f507b3          	add	a5,a0,a5
     7e4:	00970733          	add	a4,a4,s1
     7e8:	00e7c7b3          	xor	a5,a5,a4
     7ec:	40f90933          	sub	s2,s2,a5
  for (i=0; i < num_cycles; i++) {
     7f0:	f7dff06f          	j	76c <xtea_sw_decipher+0x3c>

000007f4 <neorv32_aux_xorshift32>:
 **************************************************************************/
uint32_t neorv32_aux_xorshift32(void) {

  static uint32_t x32 = 314159265;

  x32 ^= x32 << 13;
     7f4:	800006b7          	lui	a3,0x80000
     7f8:	0006a783          	lw	a5,0(a3) # 80000000 <x32.0>
     7fc:	00d79713          	sll	a4,a5,0xd
     800:	00f74733          	xor	a4,a4,a5
  x32 ^= x32 >> 17;
     804:	01175793          	srl	a5,a4,0x11
     808:	00e7c7b3          	xor	a5,a5,a4
  x32 ^= x32 << 5;
     80c:	00579513          	sll	a0,a5,0x5
     810:	00f54533          	xor	a0,a0,a5
     814:	00a6a023          	sw	a0,0(a3)

  return x32;
}
     818:	00008067          	ret

0000081c <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     81c:	fa010113          	add	sp,sp,-96
     820:	04912a23          	sw	s1,84(sp)
     824:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     828:	000025b7          	lui	a1,0x2
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     82c:	04812c23          	sw	s0,88(sp)
     830:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     834:	a7458593          	add	a1,a1,-1420 # 1a74 <__etext+0x378>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     838:	00060913          	mv	s2,a2
     83c:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     840:	01000613          	li	a2,16
     844:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     848:	04112e23          	sw	ra,92(sp)
     84c:	05312623          	sw	s3,76(sp)
     850:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     854:	3a1000ef          	jal	13f4 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     858:	02400613          	li	a2,36
     85c:	00000593          	li	a1,0
     860:	01c10513          	add	a0,sp,28
     864:	2b5000ef          	jal	1318 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     868:	ffe90713          	add	a4,s2,-2
     86c:	00e00793          	li	a5,14
     870:	03f10993          	add	s3,sp,63
     874:	02e7f463          	bgeu	a5,a4,89c <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     878:	00040023          	sb	zero,0(s0)
}
     87c:	05c12083          	lw	ra,92(sp)
     880:	05812403          	lw	s0,88(sp)
     884:	05412483          	lw	s1,84(sp)
     888:	05012903          	lw	s2,80(sp)
     88c:	04c12983          	lw	s3,76(sp)
     890:	04812a03          	lw	s4,72(sp)
     894:	06010113          	add	sp,sp,96
     898:	00008067          	ret
    *tmp_ptr = digits[num%base];
     89c:	00090593          	mv	a1,s2
     8a0:	00048513          	mv	a0,s1
     8a4:	5f5000ef          	jal	1698 <__umodsi3>
     8a8:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7ff4e041>
     8ac:	00278533          	add	a0,a5,sp
     8b0:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     8b4:	00090593          	mv	a1,s2
     8b8:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     8bc:	fef98fa3          	sb	a5,-1(s3)
     8c0:	00048a13          	mv	s4,s1
    num /= base;
     8c4:	58d000ef          	jal	1650 <__hidden___udivsi3>
    tmp_ptr--;
     8c8:	fff98993          	add	s3,s3,-1
    num /= base;
     8cc:	00050493          	mv	s1,a0
  } while (num != 0);
     8d0:	fd2a76e3          	bgeu	s4,s2,89c <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     8d4:	00000793          	li	a5,0
     8d8:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     8dc:	01c10713          	add	a4,sp,28
     8e0:	00f70733          	add	a4,a4,a5
     8e4:	00074703          	lbu	a4,0(a4)
     8e8:	00070663          	beqz	a4,8f4 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     8ec:	00e40023          	sb	a4,0(s0)
      buffer++;
     8f0:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     8f4:	00178793          	add	a5,a5,1
     8f8:	fed792e3          	bne	a5,a3,8dc <neorv32_aux_itoa+0xc0>
     8fc:	f7dff06f          	j	878 <neorv32_aux_itoa+0x5c>

00000900 <neorv32_cpu_cfu_available>:
     900:	fc002573          	csrr	a0,0xfc0
 **************************************************************************/
int neorv32_cpu_cfu_available(void) {

  // this is an ISA extension - not a SoC module
  return (int)(neorv32_cpu_csr_read(CSR_MXISA) & (1 << CSR_MXISA_ZXCFU));
}
     904:	00857513          	and	a0,a0,8
     908:	00008067          	ret

0000090c <neorv32_rte_core>:
 * executed in machine mode).
 **************************************************************************/
void __attribute__((__naked__,aligned(4))) neorv32_rte_core(void) {

  // save context
  asm volatile (
     90c:	34011073          	csrw	mscratch,sp
     910:	f8010113          	add	sp,sp,-128
     914:	00012023          	sw	zero,0(sp)
     918:	00112223          	sw	ra,4(sp)
     91c:	340110f3          	csrrw	ra,mscratch,sp
     920:	00112423          	sw	ra,8(sp)
     924:	00312623          	sw	gp,12(sp)
     928:	00412823          	sw	tp,16(sp)
     92c:	00512a23          	sw	t0,20(sp)
     930:	00612c23          	sw	t1,24(sp)
     934:	00712e23          	sw	t2,28(sp)
     938:	02812023          	sw	s0,32(sp)
     93c:	02912223          	sw	s1,36(sp)
     940:	02a12423          	sw	a0,40(sp)
     944:	02b12623          	sw	a1,44(sp)
     948:	02c12823          	sw	a2,48(sp)
     94c:	02d12a23          	sw	a3,52(sp)
     950:	02e12c23          	sw	a4,56(sp)
     954:	02f12e23          	sw	a5,60(sp)
     958:	05012023          	sw	a6,64(sp)
     95c:	05112223          	sw	a7,68(sp)
     960:	05212423          	sw	s2,72(sp)
     964:	05312623          	sw	s3,76(sp)
     968:	05412823          	sw	s4,80(sp)
     96c:	05512a23          	sw	s5,84(sp)
     970:	05612c23          	sw	s6,88(sp)
     974:	05712e23          	sw	s7,92(sp)
     978:	07812023          	sw	s8,96(sp)
     97c:	07912223          	sw	s9,100(sp)
     980:	07a12423          	sw	s10,104(sp)
     984:	07b12623          	sw	s11,108(sp)
     988:	07c12823          	sw	t3,112(sp)
     98c:	07d12a23          	sw	t4,116(sp)
     990:	07e12c23          	sw	t5,120(sp)
     994:	07f12e23          	sw	t6,124(sp)
#endif
  );

  // flush context (stack frame) to main memory
  // reload trap table from main memory
  asm volatile ("fence");
     998:	0ff0000f          	fence
     99c:	342027f3          	csrr	a5,mcause

  // find according trap handler base address
  uint32_t handler_base = 0;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
     9a0:	00b00713          	li	a4,11
     9a4:	02f76a63          	bltu	a4,a5,9d8 <neorv32_rte_core+0xcc>
     9a8:	00002737          	lui	a4,0x2
     9ac:	00279793          	sll	a5,a5,0x2
     9b0:	ca870713          	add	a4,a4,-856 # 1ca8 <key+0x10>
     9b4:	00e787b3          	add	a5,a5,a4
     9b8:	0007a783          	lw	a5,0(a5)
     9bc:	00078067          	jr	a5
     9c0:	00002737          	lui	a4,0x2
     9c4:	00279793          	sll	a5,a5,0x2
     9c8:	cd870713          	add	a4,a4,-808 # 1cd8 <key+0x40>
     9cc:	00e787b3          	add	a5,a5,a4
     9d0:	0007a783          	lw	a5,0(a5)
     9d4:	00078067          	jr	a5
     9d8:	80000737          	lui	a4,0x80000
     9dc:	ffd70713          	add	a4,a4,-3 # 7ffffffd <__neorv32_rom_size+0x7fffbffd>
     9e0:	00e787b3          	add	a5,a5,a4
     9e4:	01c00713          	li	a4,28
     9e8:	fcf77ce3          	bgeu	a4,a5,9c0 <neorv32_rte_core+0xb4>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    default:                     handler_base = (uint32_t)(&neorv32_rte_debug_handler);          break;
     9ec:	000017b7          	lui	a5,0x1
     9f0:	cb078793          	add	a5,a5,-848 # cb0 <neorv32_rte_debug_handler>

  // call handler
  if (handler_base != 0) {
    typedef void handler_t();
    handler_t* handler = (handler_t*)handler_base;
    handler();
     9f4:	000780e7          	jalr	a5
     9f8:	00c0006f          	j	a04 <neorv32_rte_core+0xf8>
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
     9fc:	d101a783          	lw	a5,-752(gp) # 80000514 <__neorv32_rte_vector_lut>
  if (handler_base != 0) {
     a00:	fe079ae3          	bnez	a5,9f4 <neorv32_rte_core+0xe8>
     a04:	342027f3          	csrr	a5,mcause
  }

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if (((cause >> 31) == 0) && (cause != TRAP_CODE_I_ACCESS)) {
     a08:	0207cc63          	bltz	a5,a40 <neorv32_rte_core+0x134>
     a0c:	00100713          	li	a4,1
     a10:	02e78863          	beq	a5,a4,a40 <neorv32_rte_core+0x134>
     a14:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
     a18:	00468713          	add	a4,a3,4
     a1c:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
     a20:	0047f793          	and	a5,a5,4
     a24:	00078c63          	beqz	a5,a3c <neorv32_rte_core+0x130>
     a28:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
     a2c:	00300613          	li	a2,3
     a30:	0037f793          	and	a5,a5,3
     a34:	00c78463          	beq	a5,a2,a3c <neorv32_rte_core+0x130>
        rte_mepc -= 2;
     a38:	00268713          	add	a4,a3,2
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     a3c:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
     a40:	00412083          	lw	ra,4(sp)
     a44:	00c12183          	lw	gp,12(sp)
     a48:	01012203          	lw	tp,16(sp)
     a4c:	01412283          	lw	t0,20(sp)
     a50:	01812303          	lw	t1,24(sp)
     a54:	01c12383          	lw	t2,28(sp)
     a58:	02012403          	lw	s0,32(sp)
     a5c:	02412483          	lw	s1,36(sp)
     a60:	02812503          	lw	a0,40(sp)
     a64:	02c12583          	lw	a1,44(sp)
     a68:	03012603          	lw	a2,48(sp)
     a6c:	03412683          	lw	a3,52(sp)
     a70:	03812703          	lw	a4,56(sp)
     a74:	03c12783          	lw	a5,60(sp)
     a78:	04012803          	lw	a6,64(sp)
     a7c:	04412883          	lw	a7,68(sp)
     a80:	04812903          	lw	s2,72(sp)
     a84:	04c12983          	lw	s3,76(sp)
     a88:	05012a03          	lw	s4,80(sp)
     a8c:	05412a83          	lw	s5,84(sp)
     a90:	05812b03          	lw	s6,88(sp)
     a94:	05c12b83          	lw	s7,92(sp)
     a98:	06012c03          	lw	s8,96(sp)
     a9c:	06412c83          	lw	s9,100(sp)
     aa0:	06812d03          	lw	s10,104(sp)
     aa4:	06c12d83          	lw	s11,108(sp)
     aa8:	07012e03          	lw	t3,112(sp)
     aac:	07412e83          	lw	t4,116(sp)
     ab0:	07812f03          	lw	t5,120(sp)
     ab4:	07c12f83          	lw	t6,124(sp)
     ab8:	00812103          	lw	sp,8(sp)
     abc:	30200073          	mret
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
     ac0:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     ac4:	0047a783          	lw	a5,4(a5)
     ac8:	f39ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
     acc:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     ad0:	0087a783          	lw	a5,8(a5)
     ad4:	f2dff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
     ad8:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     adc:	00c7a783          	lw	a5,12(a5)
     ae0:	f21ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
     ae4:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     ae8:	0107a783          	lw	a5,16(a5)
     aec:	f15ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
     af0:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     af4:	0147a783          	lw	a5,20(a5)
     af8:	f09ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
     afc:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b00:	0187a783          	lw	a5,24(a5)
     b04:	efdff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
     b08:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b0c:	01c7a783          	lw	a5,28(a5)
     b10:	ef1ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
     b14:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b18:	0207a783          	lw	a5,32(a5)
     b1c:	ee5ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
     b20:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b24:	0247a783          	lw	a5,36(a5)
     b28:	ed9ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
     b2c:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b30:	0287a783          	lw	a5,40(a5)
     b34:	ecdff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
     b38:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b3c:	02c7a783          	lw	a5,44(a5)
     b40:	ec1ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
     b44:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b48:	0307a783          	lw	a5,48(a5)
     b4c:	eb5ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
     b50:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b54:	0347a783          	lw	a5,52(a5)
     b58:	ea9ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
     b5c:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b60:	0387a783          	lw	a5,56(a5)
     b64:	e9dff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
     b68:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b6c:	03c7a783          	lw	a5,60(a5)
     b70:	e91ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
     b74:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b78:	0407a783          	lw	a5,64(a5)
     b7c:	e85ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
     b80:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b84:	0447a783          	lw	a5,68(a5)
     b88:	e79ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
     b8c:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b90:	0487a783          	lw	a5,72(a5)
     b94:	e6dff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
     b98:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     b9c:	04c7a783          	lw	a5,76(a5)
     ba0:	e61ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
     ba4:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     ba8:	0507a783          	lw	a5,80(a5)
     bac:	e55ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
     bb0:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bb4:	0547a783          	lw	a5,84(a5)
     bb8:	e49ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
     bbc:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bc0:	0587a783          	lw	a5,88(a5)
     bc4:	e3dff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
     bc8:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bcc:	05c7a783          	lw	a5,92(a5)
     bd0:	e31ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
     bd4:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bd8:	0607a783          	lw	a5,96(a5)
     bdc:	e25ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
     be0:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     be4:	0647a783          	lw	a5,100(a5)
     be8:	e19ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
     bec:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bf0:	0687a783          	lw	a5,104(a5)
     bf4:	e0dff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
     bf8:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     bfc:	06c7a783          	lw	a5,108(a5)
     c00:	e01ff06f          	j	a00 <neorv32_rte_core+0xf4>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
     c04:	d1018793          	add	a5,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
     c08:	0707a783          	lw	a5,112(a5)
     c0c:	df5ff06f          	j	a00 <neorv32_rte_core+0xf4>

00000c10 <__neorv32_rte_print_hex>:
 *
 * @param[in] num Number to print as hexadecimal via UART0.
 *
 * @param[in] digits Number of hexadecimal digits to print (0..8).
 **************************************************************************/
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     c10:	fd010113          	add	sp,sp,-48
     c14:	03212023          	sw	s2,32(sp)
     c18:	00058913          	mv	s2,a1

  int i = 0;
  const char hex_symbols[] = "0123456789ABCDEF";
     c1c:	000025b7          	lui	a1,0x2
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     c20:	02912223          	sw	s1,36(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     c24:	01100613          	li	a2,17
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     c28:	00050493          	mv	s1,a0
  const char hex_symbols[] = "0123456789ABCDEF";
     c2c:	a8858593          	add	a1,a1,-1400 # 1a88 <__etext+0x38c>
     c30:	00c10513          	add	a0,sp,12
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     c34:	02112623          	sw	ra,44(sp)
     c38:	02812423          	sw	s0,40(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     c3c:	7b8000ef          	jal	13f4 <memcpy>

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
     c40:	fff50537          	lui	a0,0xfff50
     c44:	33c000ef          	jal	f80 <neorv32_uart_available>
     c48:	04050863          	beqz	a0,c98 <__neorv32_rte_print_hex+0x88>
    neorv32_uart0_putc('0');
     c4c:	03000593          	li	a1,48
     c50:	fff50537          	lui	a0,0xfff50
     c54:	408000ef          	jal	105c <neorv32_uart_putc>
    neorv32_uart0_putc('x');
     c58:	00f00413          	li	s0,15
     c5c:	41240433          	sub	s0,s0,s2
     c60:	07800593          	li	a1,120
     c64:	fff50537          	lui	a0,0xfff50
     c68:	3f4000ef          	jal	105c <neorv32_uart_putc>

    for (i=(digits-8); i<8; i++) {
     c6c:	00241413          	sll	s0,s0,0x2
     c70:	ffc00913          	li	s2,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
     c74:	0084d7b3          	srl	a5,s1,s0
     c78:	00f7f793          	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
     c7c:	02078793          	add	a5,a5,32
     c80:	002787b3          	add	a5,a5,sp
     c84:	fec7c583          	lbu	a1,-20(a5)
     c88:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
     c8c:	ffc40413          	add	s0,s0,-4
      neorv32_uart0_putc(hex_symbols[index]);
     c90:	3cc000ef          	jal	105c <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
     c94:	ff2410e3          	bne	s0,s2,c74 <__neorv32_rte_print_hex+0x64>
    }
  }
}
     c98:	02c12083          	lw	ra,44(sp)
     c9c:	02812403          	lw	s0,40(sp)
     ca0:	02412483          	lw	s1,36(sp)
     ca4:	02012903          	lw	s2,32(sp)
     ca8:	03010113          	add	sp,sp,48
     cac:	00008067          	ret

00000cb0 <neorv32_rte_debug_handler>:
void neorv32_rte_debug_handler(void) {
     cb0:	ff010113          	add	sp,sp,-16
  if (neorv32_uart0_available() == 0) {
     cb4:	fff50537          	lui	a0,0xfff50
void neorv32_rte_debug_handler(void) {
     cb8:	00112623          	sw	ra,12(sp)
     cbc:	00812423          	sw	s0,8(sp)
  if (neorv32_uart0_available() == 0) {
     cc0:	2c0000ef          	jal	f80 <neorv32_uart_available>
     cc4:	24050c63          	beqz	a0,f1c <neorv32_rte_debug_handler+0x26c>
  neorv32_uart0_puts("<NEORV32-RTE> ");
     cc8:	000025b7          	lui	a1,0x2
     ccc:	a9c58593          	add	a1,a1,-1380 # 1a9c <__etext+0x3a0>
     cd0:	fff50537          	lui	a0,0xfff50
     cd4:	39c000ef          	jal	1070 <neorv32_uart_puts>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     cd8:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) & 1) {
     cdc:	0017f793          	and	a5,a5,1
     ce0:	04078c63          	beqz	a5,d38 <neorv32_rte_debug_handler+0x88>
    neorv32_uart0_puts("[cpu1|");
     ce4:	000025b7          	lui	a1,0x2
     ce8:	aac58593          	add	a1,a1,-1364 # 1aac <__etext+0x3b0>
    neorv32_uart0_puts("[cpu0|");
     cec:	fff50537          	lui	a0,0xfff50
     cf0:	380000ef          	jal	1070 <neorv32_uart_puts>
     cf4:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
     cf8:	00b7d713          	srl	a4,a5,0xb
     cfc:	00377713          	and	a4,a4,3
     d00:	04070263          	beqz	a4,d44 <neorv32_rte_debug_handler+0x94>
    neorv32_uart0_puts("M] "); // machine-mode
     d04:	000025b7          	lui	a1,0x2
     d08:	abc58593          	add	a1,a1,-1348 # 1abc <__etext+0x3c0>
    neorv32_uart0_puts("U] "); // user-mode
     d0c:	fff50537          	lui	a0,0xfff50
     d10:	360000ef          	jal	1070 <neorv32_uart_puts>
     d14:	34202473          	csrr	s0,mcause
  switch (trap_cause) {
     d18:	00b00793          	li	a5,11
     d1c:	0287ea63          	bltu	a5,s0,d50 <neorv32_rte_debug_handler+0xa0>
     d20:	00002737          	lui	a4,0x2
     d24:	00241793          	sll	a5,s0,0x2
     d28:	d4c70713          	add	a4,a4,-692 # 1d4c <key+0xb4>
     d2c:	00e787b3          	add	a5,a5,a4
     d30:	0007a783          	lw	a5,0(a5)
     d34:	00078067          	jr	a5
    neorv32_uart0_puts("[cpu0|");
     d38:	000025b7          	lui	a1,0x2
     d3c:	ab458593          	add	a1,a1,-1356 # 1ab4 <__etext+0x3b8>
     d40:	fadff06f          	j	cec <neorv32_rte_debug_handler+0x3c>
    neorv32_uart0_puts("U] "); // user-mode
     d44:	000025b7          	lui	a1,0x2
     d48:	ac058593          	add	a1,a1,-1344 # 1ac0 <__etext+0x3c4>
     d4c:	fc1ff06f          	j	d0c <neorv32_rte_debug_handler+0x5c>
  switch (trap_cause) {
     d50:	800007b7          	lui	a5,0x80000
     d54:	00b78793          	add	a5,a5,11 # 8000000b <time_dec_sw+0x3>
     d58:	18f40863          	beq	s0,a5,ee8 <neorv32_rte_debug_handler+0x238>
     d5c:	0287ea63          	bltu	a5,s0,d90 <neorv32_rte_debug_handler+0xe0>
     d60:	800007b7          	lui	a5,0x80000
     d64:	00378793          	add	a5,a5,3 # 80000003 <x32.0+0x3>
     d68:	16f40463          	beq	s0,a5,ed0 <neorv32_rte_debug_handler+0x220>
     d6c:	800007b7          	lui	a5,0x80000
     d70:	00778793          	add	a5,a5,7 # 80000007 <time_dec_hw+0x3>
     d74:	16f40463          	beq	s0,a5,edc <neorv32_rte_debug_handler+0x22c>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     d78:	000025b7          	lui	a1,0x2
     d7c:	c1858593          	add	a1,a1,-1000 # 1c18 <__etext+0x51c>
     d80:	fff50537          	lui	a0,0xfff50
     d84:	2ec000ef          	jal	1070 <neorv32_uart_puts>
     d88:	00800593          	li	a1,8
     d8c:	02c0006f          	j	db8 <neorv32_rte_debug_handler+0x108>
  switch (trap_cause) {
     d90:	800007b7          	lui	a5,0x80000
     d94:	ff078793          	add	a5,a5,-16 # 7ffffff0 <__neorv32_rom_size+0x7fffbff0>
     d98:	00f407b3          	add	a5,s0,a5
     d9c:	00f00713          	li	a4,15
     da0:	fcf76ce3          	bltu	a4,a5,d78 <neorv32_rte_debug_handler+0xc8>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
     da4:	000025b7          	lui	a1,0x2
     da8:	c0c58593          	add	a1,a1,-1012 # 1c0c <__etext+0x510>
     dac:	fff50537          	lui	a0,0xfff50
     db0:	2c0000ef          	jal	1070 <neorv32_uart_puts>
     db4:	00100593          	li	a1,1
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     db8:	00040513          	mv	a0,s0
     dbc:	e55ff0ef          	jal	c10 <__neorv32_rte_print_hex>
     dc0:	0140006f          	j	dd4 <neorv32_rte_debug_handler+0x124>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
     dc4:	000025b7          	lui	a1,0x2
     dc8:	ac458593          	add	a1,a1,-1340 # 1ac4 <__etext+0x3c8>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
     dcc:	fff50537          	lui	a0,0xfff50
     dd0:	2a0000ef          	jal	1070 <neorv32_uart_puts>
  neorv32_uart0_puts(" @ PC=");
     dd4:	000025b7          	lui	a1,0x2
     dd8:	c2c58593          	add	a1,a1,-980 # 1c2c <__etext+0x530>
     ddc:	fff50537          	lui	a0,0xfff50
     de0:	290000ef          	jal	1070 <neorv32_uart_puts>
     de4:	34102573          	csrr	a0,mepc
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MEPC), 8);
     de8:	00800593          	li	a1,8
     dec:	e25ff0ef          	jal	c10 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTINST=");
     df0:	000025b7          	lui	a1,0x2
     df4:	c3458593          	add	a1,a1,-972 # 1c34 <__etext+0x538>
     df8:	fff50537          	lui	a0,0xfff50
     dfc:	274000ef          	jal	1070 <neorv32_uart_puts>
     e00:	34a02573          	csrr	a0,0x34a
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTINST), 8);
     e04:	00800593          	li	a1,8
     e08:	e09ff0ef          	jal	c10 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTVAL=");
     e0c:	000025b7          	lui	a1,0x2
     e10:	c4058593          	add	a1,a1,-960 # 1c40 <__etext+0x544>
     e14:	fff50537          	lui	a0,0xfff50
     e18:	258000ef          	jal	1070 <neorv32_uart_puts>
     e1c:	34302573          	csrr	a0,mtval
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTVAL), 8);
     e20:	00800593          	li	a1,8
     e24:	dedff0ef          	jal	c10 <__neorv32_rte_print_hex>
  if (((int32_t)trap_cause) < 0) { // is interrupt
     e28:	0c045663          	bgez	s0,ef4 <neorv32_rte_debug_handler+0x244>
    neorv32_uart0_puts(" Disabling IRQ source");
     e2c:	000025b7          	lui	a1,0x2
     e30:	c4c58593          	add	a1,a1,-948 # 1c4c <__etext+0x550>
     e34:	fff50537          	lui	a0,0xfff50
     e38:	238000ef          	jal	1070 <neorv32_uart_puts>
    neorv32_cpu_csr_clr(CSR_MIE, 1 << (trap_cause & 0x1f));
     e3c:	00100793          	li	a5,1
     e40:	008797b3          	sll	a5,a5,s0
 * @param[in] mask Bit mask (high-active) to clear bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrc %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     e44:	3047b073          	csrc	mie,a5
}
     e48:	00812403          	lw	s0,8(sp)
     e4c:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     e50:	000025b7          	lui	a1,0x2
     e54:	c8458593          	add	a1,a1,-892 # 1c84 <__etext+0x588>
     e58:	fff50537          	lui	a0,0xfff50
}
     e5c:	01010113          	add	sp,sp,16
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     e60:	2100006f          	j	1070 <neorv32_uart_puts>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
     e64:	000025b7          	lui	a1,0x2
     e68:	ae058593          	add	a1,a1,-1312 # 1ae0 <__etext+0x3e4>
     e6c:	f61ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
     e70:	000025b7          	lui	a1,0x2
     e74:	af458593          	add	a1,a1,-1292 # 1af4 <__etext+0x3f8>
     e78:	f55ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Environment breakpoint"); break;
     e7c:	000025b7          	lui	a1,0x2
     e80:	b1458593          	add	a1,a1,-1260 # 1b14 <__etext+0x418>
     e84:	f49ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
     e88:	000025b7          	lui	a1,0x2
     e8c:	b2c58593          	add	a1,a1,-1236 # 1b2c <__etext+0x430>
     e90:	f3dff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
     e94:	000025b7          	lui	a1,0x2
     e98:	b4458593          	add	a1,a1,-1212 # 1b44 <__etext+0x448>
     e9c:	f31ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
     ea0:	000025b7          	lui	a1,0x2
     ea4:	b5858593          	add	a1,a1,-1192 # 1b58 <__etext+0x45c>
     ea8:	f25ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
     eac:	000025b7          	lui	a1,0x2
     eb0:	b7458593          	add	a1,a1,-1164 # 1b74 <__etext+0x478>
     eb4:	f19ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
     eb8:	000025b7          	lui	a1,0x2
     ebc:	b8858593          	add	a1,a1,-1144 # 1b88 <__etext+0x48c>
     ec0:	f0dff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
     ec4:	000025b7          	lui	a1,0x2
     ec8:	ba858593          	add	a1,a1,-1112 # 1ba8 <__etext+0x4ac>
     ecc:	f01ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
     ed0:	000025b7          	lui	a1,0x2
     ed4:	bc858593          	add	a1,a1,-1080 # 1bc8 <__etext+0x4cc>
     ed8:	ef5ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
     edc:	000025b7          	lui	a1,0x2
     ee0:	be058593          	add	a1,a1,-1056 # 1be0 <__etext+0x4e4>
     ee4:	ee9ff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
     ee8:	000025b7          	lui	a1,0x2
     eec:	bf458593          	add	a1,a1,-1036 # 1bf4 <__etext+0x4f8>
     ef0:	eddff06f          	j	dcc <neorv32_rte_debug_handler+0x11c>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
     ef4:	00100793          	li	a5,1
     ef8:	f487e8e3          	bltu	a5,s0,e48 <neorv32_rte_debug_handler+0x198>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU </NEORV32-RTE>\n");
     efc:	000025b7          	lui	a1,0x2
     f00:	c6458593          	add	a1,a1,-924 # 1c64 <__etext+0x568>
     f04:	fff50537          	lui	a0,0xfff50
     f08:	168000ef          	jal	1070 <neorv32_uart_puts>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     f0c:	00000793          	li	a5,0
     f10:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
     f14:	10500073          	wfi
    while(1) {
     f18:	ffdff06f          	j	f14 <neorv32_rte_debug_handler+0x264>
}
     f1c:	00c12083          	lw	ra,12(sp)
     f20:	00812403          	lw	s0,8(sp)
     f24:	01010113          	add	sp,sp,16
     f28:	00008067          	ret

00000f2c <neorv32_rte_setup>:
     f2c:	000027b7          	lui	a5,0x2
     f30:	80078793          	add	a5,a5,-2048 # 1800 <__etext+0x104>
     f34:	30079073          	csrw	mstatus,a5
     f38:	000017b7          	lui	a5,0x1
     f3c:	90c78793          	add	a5,a5,-1780 # 90c <neorv32_rte_core>
     f40:	30579073          	csrw	mtvec,a5
     f44:	00000793          	li	a5,0
     f48:	30479073          	csrw	mie,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     f4c:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) == 0) {
     f50:	02079663          	bnez	a5,f7c <neorv32_rte_setup+0x50>
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
     f54:	000016b7          	lui	a3,0x1
     f58:	cb068693          	add	a3,a3,-848 # cb0 <neorv32_rte_debug_handler>
     f5c:	d1018613          	add	a2,gp,-752 # 80000514 <__neorv32_rte_vector_lut>
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
     f60:	01d00593          	li	a1,29
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
     f64:	00279713          	sll	a4,a5,0x2
     f68:	00e60733          	add	a4,a2,a4
     f6c:	00d72023          	sw	a3,0(a4)
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
     f70:	00178793          	add	a5,a5,1
     f74:	feb798e3          	bne	a5,a1,f64 <neorv32_rte_setup+0x38>
    asm volatile ("fence"); // flush handler table to main memory
     f78:	0ff0000f          	fence
}
     f7c:	00008067          	ret

00000f80 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     f80:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     f84:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     f88:	00e51c63          	bne	a0,a4,fa0 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     f8c:	fffe07b7          	lui	a5,0xfffe0
     f90:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ffde009>
     f94:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     f98:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     f9c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     fa0:	fff60737          	lui	a4,0xfff60
    return 0;
     fa4:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     fa8:	fee79ae3          	bne	a5,a4,f9c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     fac:	fffe07b7          	lui	a5,0xfffe0
     fb0:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ffde009>
     fb4:	020007b7          	lui	a5,0x2000
     fb8:	fe1ff06f          	j	f98 <neorv32_uart_available+0x18>

00000fbc <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     fbc:	ff010113          	add	sp,sp,-16
     fc0:	00812423          	sw	s0,8(sp)
     fc4:	00912223          	sw	s1,4(sp)
     fc8:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     fcc:	00052023          	sw	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     fd0:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     fd4:	00050493          	mv	s1,a0
     fd8:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     fdc:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     fe0:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     fe4:	66c000ef          	jal	1650 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     fe8:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     fec:	3fe00693          	li	a3,1022
     ff0:	04a6e663          	bltu	a3,a0,103c <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     ff4:	fff50793          	add	a5,a0,-1
     ff8:	000106b7          	lui	a3,0x10
     ffc:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
    1000:	00679793          	sll	a5,a5,0x6
    1004:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    1008:	07c006b7          	lui	a3,0x7c00
    100c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    1010:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    1014:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    1018:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
    101c:	00c12083          	lw	ra,12(sp)
    1020:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    1024:	00e7e7b3          	or	a5,a5,a4
    1028:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
    102c:	00f4a023          	sw	a5,0(s1)
}
    1030:	00412483          	lw	s1,4(sp)
    1034:	01010113          	add	sp,sp,16
    1038:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
    103c:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7ff5dfff>
    1040:	ffd7f793          	and	a5,a5,-3
    1044:	00079863          	bnez	a5,1054 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
    1048:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
    104c:	00170713          	add	a4,a4,1
    1050:	fa1ff06f          	j	ff0 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
    1054:	00155513          	srl	a0,a0,0x1
    1058:	ff5ff06f          	j	104c <neorv32_uart_setup+0x90>

0000105c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    105c:	00052783          	lw	a5,0(a0)
    1060:	00a79713          	sll	a4,a5,0xa
    1064:	fe075ce3          	bgez	a4,105c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1068:	00b52223          	sw	a1,4(a0)
}
    106c:	00008067          	ret

00001070 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
    1070:	fe010113          	add	sp,sp,-32
    1074:	00812c23          	sw	s0,24(sp)
    1078:	00912a23          	sw	s1,20(sp)
    107c:	01312623          	sw	s3,12(sp)
    1080:	00112e23          	sw	ra,28(sp)
    1084:	01212823          	sw	s2,16(sp)
    1088:	00050493          	mv	s1,a0
    108c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
    1090:	00a00993          	li	s3,10
  while ((c = *s++)) {
    1094:	00044903          	lbu	s2,0(s0)
    1098:	00140413          	add	s0,s0,1
    109c:	02091063          	bnez	s2,10bc <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
    10a0:	01c12083          	lw	ra,28(sp)
    10a4:	01812403          	lw	s0,24(sp)
    10a8:	01412483          	lw	s1,20(sp)
    10ac:	01012903          	lw	s2,16(sp)
    10b0:	00c12983          	lw	s3,12(sp)
    10b4:	02010113          	add	sp,sp,32
    10b8:	00008067          	ret
    if (c == '\n') {
    10bc:	01391863          	bne	s2,s3,10cc <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
    10c0:	00d00593          	li	a1,13
    10c4:	00048513          	mv	a0,s1
    10c8:	f95ff0ef          	jal	105c <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
    10cc:	00090593          	mv	a1,s2
    10d0:	00048513          	mv	a0,s1
    10d4:	f89ff0ef          	jal	105c <neorv32_uart_putc>
    10d8:	fbdff06f          	j	1094 <neorv32_uart_puts+0x24>

000010dc <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
    10dc:	f9010113          	add	sp,sp,-112
    10e0:	06812423          	sw	s0,104(sp)
    10e4:	06912223          	sw	s1,100(sp)
    10e8:	07212023          	sw	s2,96(sp)
    10ec:	05312e23          	sw	s3,92(sp)
    10f0:	00050493          	mv	s1,a0
    10f4:	00058913          	mv	s2,a1
    10f8:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
    10fc:	00000593          	li	a1,0
    1100:	02400613          	li	a2,36
    1104:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
    1108:	000029b7          	lui	s3,0x2
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
    110c:	05412c23          	sw	s4,88(sp)
    1110:	05512a23          	sw	s5,84(sp)
    1114:	05712623          	sw	s7,76(sp)
    1118:	05812423          	sw	s8,72(sp)
    111c:	05912223          	sw	s9,68(sp)
    1120:	05a12023          	sw	s10,64(sp)
    1124:	06112623          	sw	ra,108(sp)
    1128:	05612823          	sw	s6,80(sp)
    112c:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
    1130:	02500b93          	li	s7,37
    string_buf[i] = 0;
    1134:	1e4000ef          	jal	1318 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
    1138:	00a00c13          	li	s8,10
      c = tolower(*format++);
    113c:	d7d98993          	add	s3,s3,-643 # 1d7d <_ctype_+0x1>
    1140:	00100c93          	li	s9,1
      switch (c) {
    1144:	07000a13          	li	s4,112
    1148:	07500d13          	li	s10,117
    114c:	06300a93          	li	s5,99
  while ((c = *format++)) {
    1150:	00094d83          	lbu	s11,0(s2)
    1154:	040d9063          	bnez	s11,1194 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
    1158:	06c12083          	lw	ra,108(sp)
    115c:	06812403          	lw	s0,104(sp)
    1160:	06412483          	lw	s1,100(sp)
    1164:	06012903          	lw	s2,96(sp)
    1168:	05c12983          	lw	s3,92(sp)
    116c:	05812a03          	lw	s4,88(sp)
    1170:	05412a83          	lw	s5,84(sp)
    1174:	05012b03          	lw	s6,80(sp)
    1178:	04c12b83          	lw	s7,76(sp)
    117c:	04812c03          	lw	s8,72(sp)
    1180:	04412c83          	lw	s9,68(sp)
    1184:	04012d03          	lw	s10,64(sp)
    1188:	03c12d83          	lw	s11,60(sp)
    118c:	07010113          	add	sp,sp,112
    1190:	00008067          	ret
    if (c == '%') {
    1194:	137d9863          	bne	s11,s7,12c4 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
    1198:	00290b13          	add	s6,s2,2
    119c:	00194903          	lbu	s2,1(s2)
    11a0:	013907b3          	add	a5,s2,s3
    11a4:	0007c783          	lbu	a5,0(a5)
    11a8:	0037f793          	and	a5,a5,3
    11ac:	01979463          	bne	a5,s9,11b4 <neorv32_uart_vprintf+0xd8>
    11b0:	02090913          	add	s2,s2,32
      switch (c) {
    11b4:	0ff97793          	zext.b	a5,s2
    11b8:	0d478863          	beq	a5,s4,1288 <neorv32_uart_vprintf+0x1ac>
    11bc:	06fa4c63          	blt	s4,a5,1234 <neorv32_uart_vprintf+0x158>
    11c0:	09578e63          	beq	a5,s5,125c <neorv32_uart_vprintf+0x180>
    11c4:	02fac663          	blt	s5,a5,11f0 <neorv32_uart_vprintf+0x114>
    11c8:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
    11cc:	02500593          	li	a1,37
      switch (c) {
    11d0:	00e78a63          	beq	a5,a4,11e4 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
    11d4:	02500593          	li	a1,37
    11d8:	00048513          	mv	a0,s1
    11dc:	e81ff0ef          	jal	105c <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
    11e0:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
    11e4:	00048513          	mv	a0,s1
    11e8:	e75ff0ef          	jal	105c <neorv32_uart_putc>
    11ec:	0840006f          	j	1270 <neorv32_uart_vprintf+0x194>
      switch (c) {
    11f0:	06400713          	li	a4,100
    11f4:	00e78663          	beq	a5,a4,1200 <neorv32_uart_vprintf+0x124>
    11f8:	06900713          	li	a4,105
    11fc:	fce79ce3          	bne	a5,a4,11d4 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
    1200:	00440913          	add	s2,s0,4
    1204:	00042403          	lw	s0,0(s0)
          if (n < 0) {
    1208:	00045a63          	bgez	s0,121c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
    120c:	02d00593          	li	a1,45
    1210:	00048513          	mv	a0,s1
            n = -n;
    1214:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
    1218:	e45ff0ef          	jal	105c <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
    121c:	00a00613          	li	a2,10
    1220:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    1224:	00c10513          	add	a0,sp,12
    1228:	df4ff0ef          	jal	81c <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
    122c:	00c10593          	add	a1,sp,12
    1230:	0200006f          	j	1250 <neorv32_uart_vprintf+0x174>
      switch (c) {
    1234:	05a78263          	beq	a5,s10,1278 <neorv32_uart_vprintf+0x19c>
    1238:	07800713          	li	a4,120
    123c:	04e78663          	beq	a5,a4,1288 <neorv32_uart_vprintf+0x1ac>
    1240:	07300713          	li	a4,115
    1244:	f8e798e3          	bne	a5,a4,11d4 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1248:	00042583          	lw	a1,0(s0)
    124c:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
    1250:	00048513          	mv	a0,s1
    1254:	e1dff0ef          	jal	1070 <neorv32_uart_puts>
          break;
    1258:	0140006f          	j	126c <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
    125c:	00044583          	lbu	a1,0(s0)
    1260:	00048513          	mv	a0,s1
    1264:	00440913          	add	s2,s0,4
    1268:	df5ff0ef          	jal	105c <neorv32_uart_putc>
    126c:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1270:	000b0913          	mv	s2,s6
    1274:	eddff06f          	j	1150 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    1278:	00042583          	lw	a1,0(s0)
    127c:	00440913          	add	s2,s0,4
    1280:	00a00613          	li	a2,10
    1284:	fa1ff06f          	j	1224 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    1288:	00042583          	lw	a1,0(s0)
    128c:	01000613          	li	a2,16
    1290:	00c10513          	add	a0,sp,12
    1294:	d88ff0ef          	jal	81c <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
    1298:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    129c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
    12a0:	2f8000ef          	jal	1598 <strlen>
    12a4:	00800413          	li	s0,8
    12a8:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
    12ac:	f80400e3          	beqz	s0,122c <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
    12b0:	03000593          	li	a1,48
    12b4:	00048513          	mv	a0,s1
    12b8:	da5ff0ef          	jal	105c <neorv32_uart_putc>
    12bc:	fff40413          	add	s0,s0,-1
    12c0:	fedff06f          	j	12ac <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
    12c4:	018d9863          	bne	s11,s8,12d4 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
    12c8:	00d00593          	li	a1,13
    12cc:	00048513          	mv	a0,s1
    12d0:	d8dff0ef          	jal	105c <neorv32_uart_putc>
  while ((c = *format++)) {
    12d4:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
    12d8:	000d8593          	mv	a1,s11
    12dc:	f09ff06f          	j	11e4 <neorv32_uart_vprintf+0x108>

000012e0 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    12e0:	fc010113          	add	sp,sp,-64
    12e4:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
    12e8:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    12ec:	00112e23          	sw	ra,28(sp)
    12f0:	02d12623          	sw	a3,44(sp)
    12f4:	02e12823          	sw	a4,48(sp)
    12f8:	02f12a23          	sw	a5,52(sp)
    12fc:	03012c23          	sw	a6,56(sp)
    1300:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
    1304:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    1308:	dd5ff0ef          	jal	10dc <neorv32_uart_vprintf>
  va_end(args);
}
    130c:	01c12083          	lw	ra,28(sp)
    1310:	04010113          	add	sp,sp,64
    1314:	00008067          	ret

00001318 <memset>:
    1318:	00f00313          	li	t1,15
    131c:	00050713          	mv	a4,a0
    1320:	02c37e63          	bgeu	t1,a2,135c <memset+0x44>
    1324:	00f77793          	and	a5,a4,15
    1328:	0a079063          	bnez	a5,13c8 <memset+0xb0>
    132c:	08059263          	bnez	a1,13b0 <memset+0x98>
    1330:	ff067693          	and	a3,a2,-16
    1334:	00f67613          	and	a2,a2,15
    1338:	00e686b3          	add	a3,a3,a4
    133c:	00b72023          	sw	a1,0(a4)
    1340:	00b72223          	sw	a1,4(a4)
    1344:	00b72423          	sw	a1,8(a4)
    1348:	00b72623          	sw	a1,12(a4)
    134c:	01070713          	add	a4,a4,16
    1350:	fed766e3          	bltu	a4,a3,133c <memset+0x24>
    1354:	00061463          	bnez	a2,135c <memset+0x44>
    1358:	00008067          	ret
    135c:	40c306b3          	sub	a3,t1,a2
    1360:	00269693          	sll	a3,a3,0x2
    1364:	00000297          	auipc	t0,0x0
    1368:	005686b3          	add	a3,a3,t0
    136c:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
    1370:	00b70723          	sb	a1,14(a4)
    1374:	00b706a3          	sb	a1,13(a4)
    1378:	00b70623          	sb	a1,12(a4)
    137c:	00b705a3          	sb	a1,11(a4)
    1380:	00b70523          	sb	a1,10(a4)
    1384:	00b704a3          	sb	a1,9(a4)
    1388:	00b70423          	sb	a1,8(a4)
    138c:	00b703a3          	sb	a1,7(a4)
    1390:	00b70323          	sb	a1,6(a4)
    1394:	00b702a3          	sb	a1,5(a4)
    1398:	00b70223          	sb	a1,4(a4)
    139c:	00b701a3          	sb	a1,3(a4)
    13a0:	00b70123          	sb	a1,2(a4)
    13a4:	00b700a3          	sb	a1,1(a4)
    13a8:	00b70023          	sb	a1,0(a4)
    13ac:	00008067          	ret
    13b0:	0ff5f593          	zext.b	a1,a1
    13b4:	00859693          	sll	a3,a1,0x8
    13b8:	00d5e5b3          	or	a1,a1,a3
    13bc:	01059693          	sll	a3,a1,0x10
    13c0:	00d5e5b3          	or	a1,a1,a3
    13c4:	f6dff06f          	j	1330 <memset+0x18>
    13c8:	00279693          	sll	a3,a5,0x2
    13cc:	00000297          	auipc	t0,0x0
    13d0:	005686b3          	add	a3,a3,t0
    13d4:	00008293          	mv	t0,ra
    13d8:	fa0680e7          	jalr	-96(a3)
    13dc:	00028093          	mv	ra,t0
    13e0:	ff078793          	add	a5,a5,-16
    13e4:	40f70733          	sub	a4,a4,a5
    13e8:	00f60633          	add	a2,a2,a5
    13ec:	f6c378e3          	bgeu	t1,a2,135c <memset+0x44>
    13f0:	f3dff06f          	j	132c <memset+0x14>

000013f4 <memcpy>:
    13f4:	00a5c7b3          	xor	a5,a1,a0
    13f8:	0037f793          	and	a5,a5,3
    13fc:	00c508b3          	add	a7,a0,a2
    1400:	06079463          	bnez	a5,1468 <memcpy+0x74>
    1404:	00300793          	li	a5,3
    1408:	06c7f063          	bgeu	a5,a2,1468 <memcpy+0x74>
    140c:	00357793          	and	a5,a0,3
    1410:	00050713          	mv	a4,a0
    1414:	06079a63          	bnez	a5,1488 <memcpy+0x94>
    1418:	ffc8f613          	and	a2,a7,-4
    141c:	40e606b3          	sub	a3,a2,a4
    1420:	02000793          	li	a5,32
    1424:	08d7ce63          	blt	a5,a3,14c0 <memcpy+0xcc>
    1428:	00058693          	mv	a3,a1
    142c:	00070793          	mv	a5,a4
    1430:	02c77863          	bgeu	a4,a2,1460 <memcpy+0x6c>
    1434:	0006a803          	lw	a6,0(a3)
    1438:	00478793          	add	a5,a5,4
    143c:	00468693          	add	a3,a3,4
    1440:	ff07ae23          	sw	a6,-4(a5)
    1444:	fec7e8e3          	bltu	a5,a2,1434 <memcpy+0x40>
    1448:	fff60793          	add	a5,a2,-1
    144c:	40e787b3          	sub	a5,a5,a4
    1450:	ffc7f793          	and	a5,a5,-4
    1454:	00478793          	add	a5,a5,4
    1458:	00f70733          	add	a4,a4,a5
    145c:	00f585b3          	add	a1,a1,a5
    1460:	01176863          	bltu	a4,a7,1470 <memcpy+0x7c>
    1464:	00008067          	ret
    1468:	00050713          	mv	a4,a0
    146c:	05157863          	bgeu	a0,a7,14bc <memcpy+0xc8>
    1470:	0005c783          	lbu	a5,0(a1)
    1474:	00170713          	add	a4,a4,1
    1478:	00158593          	add	a1,a1,1
    147c:	fef70fa3          	sb	a5,-1(a4)
    1480:	fee898e3          	bne	a7,a4,1470 <memcpy+0x7c>
    1484:	00008067          	ret
    1488:	0005c683          	lbu	a3,0(a1)
    148c:	00170713          	add	a4,a4,1
    1490:	00377793          	and	a5,a4,3
    1494:	fed70fa3          	sb	a3,-1(a4)
    1498:	00158593          	add	a1,a1,1
    149c:	f6078ee3          	beqz	a5,1418 <memcpy+0x24>
    14a0:	0005c683          	lbu	a3,0(a1)
    14a4:	00170713          	add	a4,a4,1
    14a8:	00377793          	and	a5,a4,3
    14ac:	fed70fa3          	sb	a3,-1(a4)
    14b0:	00158593          	add	a1,a1,1
    14b4:	fc079ae3          	bnez	a5,1488 <memcpy+0x94>
    14b8:	f61ff06f          	j	1418 <memcpy+0x24>
    14bc:	00008067          	ret
    14c0:	ff010113          	add	sp,sp,-16
    14c4:	00812623          	sw	s0,12(sp)
    14c8:	02000413          	li	s0,32
    14cc:	0005a383          	lw	t2,0(a1)
    14d0:	0045a283          	lw	t0,4(a1)
    14d4:	0085af83          	lw	t6,8(a1)
    14d8:	00c5af03          	lw	t5,12(a1)
    14dc:	0105ae83          	lw	t4,16(a1)
    14e0:	0145ae03          	lw	t3,20(a1)
    14e4:	0185a303          	lw	t1,24(a1)
    14e8:	01c5a803          	lw	a6,28(a1)
    14ec:	0205a683          	lw	a3,32(a1)
    14f0:	02470713          	add	a4,a4,36
    14f4:	40e607b3          	sub	a5,a2,a4
    14f8:	fc772e23          	sw	t2,-36(a4)
    14fc:	fe572023          	sw	t0,-32(a4)
    1500:	fff72223          	sw	t6,-28(a4)
    1504:	ffe72423          	sw	t5,-24(a4)
    1508:	ffd72623          	sw	t4,-20(a4)
    150c:	ffc72823          	sw	t3,-16(a4)
    1510:	fe672a23          	sw	t1,-12(a4)
    1514:	ff072c23          	sw	a6,-8(a4)
    1518:	fed72e23          	sw	a3,-4(a4)
    151c:	02458593          	add	a1,a1,36
    1520:	faf446e3          	blt	s0,a5,14cc <memcpy+0xd8>
    1524:	00058693          	mv	a3,a1
    1528:	00070793          	mv	a5,a4
    152c:	02c77863          	bgeu	a4,a2,155c <memcpy+0x168>
    1530:	0006a803          	lw	a6,0(a3)
    1534:	00478793          	add	a5,a5,4
    1538:	00468693          	add	a3,a3,4
    153c:	ff07ae23          	sw	a6,-4(a5)
    1540:	fec7e8e3          	bltu	a5,a2,1530 <memcpy+0x13c>
    1544:	fff60793          	add	a5,a2,-1
    1548:	40e787b3          	sub	a5,a5,a4
    154c:	ffc7f793          	and	a5,a5,-4
    1550:	00478793          	add	a5,a5,4
    1554:	00f70733          	add	a4,a4,a5
    1558:	00f585b3          	add	a1,a1,a5
    155c:	01176863          	bltu	a4,a7,156c <memcpy+0x178>
    1560:	00c12403          	lw	s0,12(sp)
    1564:	01010113          	add	sp,sp,16
    1568:	00008067          	ret
    156c:	0005c783          	lbu	a5,0(a1)
    1570:	00170713          	add	a4,a4,1
    1574:	00158593          	add	a1,a1,1
    1578:	fef70fa3          	sb	a5,-1(a4)
    157c:	fee882e3          	beq	a7,a4,1560 <memcpy+0x16c>
    1580:	0005c783          	lbu	a5,0(a1)
    1584:	00170713          	add	a4,a4,1
    1588:	00158593          	add	a1,a1,1
    158c:	fef70fa3          	sb	a5,-1(a4)
    1590:	fce89ee3          	bne	a7,a4,156c <memcpy+0x178>
    1594:	fcdff06f          	j	1560 <memcpy+0x16c>

00001598 <strlen>:
    1598:	00357793          	and	a5,a0,3
    159c:	00050713          	mv	a4,a0
    15a0:	04079c63          	bnez	a5,15f8 <strlen+0x60>
    15a4:	7f7f86b7          	lui	a3,0x7f7f8
    15a8:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
    15ac:	fff00593          	li	a1,-1
    15b0:	00072603          	lw	a2,0(a4)
    15b4:	00470713          	add	a4,a4,4
    15b8:	00d677b3          	and	a5,a2,a3
    15bc:	00d787b3          	add	a5,a5,a3
    15c0:	00c7e7b3          	or	a5,a5,a2
    15c4:	00d7e7b3          	or	a5,a5,a3
    15c8:	feb784e3          	beq	a5,a1,15b0 <strlen+0x18>
    15cc:	ffc74683          	lbu	a3,-4(a4)
    15d0:	40a707b3          	sub	a5,a4,a0
    15d4:	04068463          	beqz	a3,161c <strlen+0x84>
    15d8:	ffd74683          	lbu	a3,-3(a4)
    15dc:	02068c63          	beqz	a3,1614 <strlen+0x7c>
    15e0:	ffe74503          	lbu	a0,-2(a4)
    15e4:	00a03533          	snez	a0,a0
    15e8:	00f50533          	add	a0,a0,a5
    15ec:	ffe50513          	add	a0,a0,-2
    15f0:	00008067          	ret
    15f4:	fa0688e3          	beqz	a3,15a4 <strlen+0xc>
    15f8:	00074783          	lbu	a5,0(a4)
    15fc:	00170713          	add	a4,a4,1
    1600:	00377693          	and	a3,a4,3
    1604:	fe0798e3          	bnez	a5,15f4 <strlen+0x5c>
    1608:	40a70733          	sub	a4,a4,a0
    160c:	fff70513          	add	a0,a4,-1
    1610:	00008067          	ret
    1614:	ffd78513          	add	a0,a5,-3
    1618:	00008067          	ret
    161c:	ffc78513          	add	a0,a5,-4
    1620:	00008067          	ret

00001624 <__mulsi3>:
    1624:	00050613          	mv	a2,a0
    1628:	00000513          	li	a0,0
    162c:	0015f693          	and	a3,a1,1
    1630:	00068463          	beqz	a3,1638 <__mulsi3+0x14>
    1634:	00c50533          	add	a0,a0,a2
    1638:	0015d593          	srl	a1,a1,0x1
    163c:	00161613          	sll	a2,a2,0x1
    1640:	fe0596e3          	bnez	a1,162c <__mulsi3+0x8>
    1644:	00008067          	ret

00001648 <__divsi3>:
    1648:	06054063          	bltz	a0,16a8 <__umodsi3+0x10>
    164c:	0605c663          	bltz	a1,16b8 <__umodsi3+0x20>

00001650 <__hidden___udivsi3>:
    1650:	00058613          	mv	a2,a1
    1654:	00050593          	mv	a1,a0
    1658:	fff00513          	li	a0,-1
    165c:	02060c63          	beqz	a2,1694 <__hidden___udivsi3+0x44>
    1660:	00100693          	li	a3,1
    1664:	00b67a63          	bgeu	a2,a1,1678 <__hidden___udivsi3+0x28>
    1668:	00c05863          	blez	a2,1678 <__hidden___udivsi3+0x28>
    166c:	00161613          	sll	a2,a2,0x1
    1670:	00169693          	sll	a3,a3,0x1
    1674:	feb66ae3          	bltu	a2,a1,1668 <__hidden___udivsi3+0x18>
    1678:	00000513          	li	a0,0
    167c:	00c5e663          	bltu	a1,a2,1688 <__hidden___udivsi3+0x38>
    1680:	40c585b3          	sub	a1,a1,a2
    1684:	00d56533          	or	a0,a0,a3
    1688:	0016d693          	srl	a3,a3,0x1
    168c:	00165613          	srl	a2,a2,0x1
    1690:	fe0696e3          	bnez	a3,167c <__hidden___udivsi3+0x2c>
    1694:	00008067          	ret

00001698 <__umodsi3>:
    1698:	00008293          	mv	t0,ra
    169c:	fb5ff0ef          	jal	1650 <__hidden___udivsi3>
    16a0:	00058513          	mv	a0,a1
    16a4:	00028067          	jr	t0 # 13cc <memset+0xb4>
    16a8:	40a00533          	neg	a0,a0
    16ac:	00b04863          	bgtz	a1,16bc <__umodsi3+0x24>
    16b0:	40b005b3          	neg	a1,a1
    16b4:	f9dff06f          	j	1650 <__hidden___udivsi3>
    16b8:	40b005b3          	neg	a1,a1
    16bc:	00008293          	mv	t0,ra
    16c0:	f91ff0ef          	jal	1650 <__hidden___udivsi3>
    16c4:	40a00533          	neg	a0,a0
    16c8:	00028067          	jr	t0

000016cc <__modsi3>:
    16cc:	00008293          	mv	t0,ra
    16d0:	0005ca63          	bltz	a1,16e4 <__modsi3+0x18>
    16d4:	00054c63          	bltz	a0,16ec <__modsi3+0x20>
    16d8:	f79ff0ef          	jal	1650 <__hidden___udivsi3>
    16dc:	00058513          	mv	a0,a1
    16e0:	00028067          	jr	t0
    16e4:	40b005b3          	neg	a1,a1
    16e8:	fe0558e3          	bgez	a0,16d8 <__modsi3+0xc>
    16ec:	40a00533          	neg	a0,a0
    16f0:	f61ff0ef          	jal	1650 <__hidden___udivsi3>
    16f4:	40b00533          	neg	a0,a1
    16f8:	00028067          	jr	t0
