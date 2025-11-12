
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__fini_array_end+0xa0>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	98c38393          	add	t2,t2,-1652 # 19c0 <__crt0_copy_data_src_begin>
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
     110:	65440413          	add	s0,s0,1620 # 1760 <__fini_array_end>
     114:	00001497          	auipc	s1,0x1
     118:	64c48493          	add	s1,s1,1612 # 1760 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	11c60613          	add	a2,a2,284 # 24c <main>

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
     178:	5ec40413          	add	s0,s0,1516 # 1760 <__fini_array_end>
     17c:	00001497          	auipc	s1,0x1
     180:	5e448493          	add	s1,s1,1508 # 1760 <__fini_array_end>

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

000001e4 <uart0_print_hex32>:
/* ===========================
   Minimal helpers / utilities
   =========================== */

// NEORV32 mini-printf has no width/length; print 32-bit hex by hand.
static void uart0_print_hex32(uint32_t v) {
     1e4:	fe010113          	add	sp,sp,-32
     1e8:	00812c23          	sw	s0,24(sp)
     1ec:	00912a23          	sw	s1,20(sp)
     1f0:	01212823          	sw	s2,16(sp)
     1f4:	01312623          	sw	s3,12(sp)
     1f8:	00112e23          	sw	ra,28(sp)
     1fc:	00050493          	mv	s1,a0
     200:	01c00413          	li	s0,28
  for (int i = 7; i >= 0; i--) {
    uint32_t nib = (v >> (i*4)) & 0xF;
    char c = (nib < 10) ? ('0' + nib) : ('a' + (nib - 10));
     204:	00900993          	li	s3,9
  for (int i = 7; i >= 0; i--) {
     208:	ffc00913          	li	s2,-4
    uint32_t nib = (v >> (i*4)) & 0xF;
     20c:	0084d7b3          	srl	a5,s1,s0
    char c = (nib < 10) ? ('0' + nib) : ('a' + (nib - 10));
     210:	00f7f713          	and	a4,a5,15
    neorv32_uart0_putc(c);
     214:	fff50537          	lui	a0,0xfff50
    char c = (nib < 10) ? ('0' + nib) : ('a' + (nib - 10));
     218:	05770593          	add	a1,a4,87
     21c:	00e9e463          	bltu	s3,a4,224 <uart0_print_hex32+0x40>
     220:	03070593          	add	a1,a4,48
  for (int i = 7; i >= 0; i--) {
     224:	ffc40413          	add	s0,s0,-4
    neorv32_uart0_putc(c);
     228:	6d9000ef          	jal	1100 <neorv32_uart_putc>
  for (int i = 7; i >= 0; i--) {
     22c:	ff2410e3          	bne	s0,s2,20c <uart0_print_hex32+0x28>
  }
}
     230:	01c12083          	lw	ra,28(sp)
     234:	01812403          	lw	s0,24(sp)
     238:	01412483          	lw	s1,20(sp)
     23c:	01012903          	lw	s2,16(sp)
     240:	00c12983          	lw	s3,12(sp)
     244:	02010113          	add	sp,sp,32
     248:	00008067          	ret

0000024c <main>:
/* =====
   main
   ===== */
int main(void) {
  // Match bootloader terminal (adjust if needed)
  neorv32_uart0_setup(19200, 0);
     24c:	000055b7          	lui	a1,0x5
int main(void) {
     250:	e7010113          	add	sp,sp,-400
  neorv32_uart0_setup(19200, 0);
     254:	00000613          	li	a2,0
     258:	b0058593          	add	a1,a1,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3140>
     25c:	fff50537          	lui	a0,0xfff50
int main(void) {
     260:	18112623          	sw	ra,396(sp)
     264:	18812423          	sw	s0,392(sp)
     268:	18912223          	sw	s1,388(sp)
     26c:	19212023          	sw	s2,384(sp)
     270:	17312e23          	sw	s3,380(sp)
     274:	17412c23          	sw	s4,376(sp)
     278:	17512a23          	sw	s5,372(sp)
     27c:	17612823          	sw	s6,368(sp)
     280:	17712623          	sw	s7,364(sp)
     284:	17812423          	sw	s8,360(sp)
     288:	17912223          	sw	s9,356(sp)
     28c:	17a12023          	sw	s10,352(sp)
     290:	15b12e23          	sw	s11,348(sp)
  neorv32_uart0_setup(19200, 0);
     294:	5c1000ef          	jal	1054 <neorv32_uart_setup>

  neorv32_uart0_puts("\nCFS GEMM i8 4x4 microbench (skewed RTL, 10 steps)\n");
     298:	000015b7          	lui	a1,0x1
     29c:	76058593          	add	a1,a1,1888 # 1760 <__fini_array_end>
     2a0:	fff50537          	lui	a0,0xfff50
     2a4:	671000ef          	jal	1114 <neorv32_uart_puts>

  // NEORV32_SYSINFO is a pointer → use ->
  uint32_t clk_hz = NEORV32_SYSINFO->CLK;
     2a8:	fffe07b7          	lui	a5,0xfffe0
     2ac:	0007a603          	lw	a2,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     2b0:	f1402473          	csrr	s0,mhartid
  uint32_t hartid = (uint32_t)neorv32_cpu_csr_read(CSR_MHARTID);

  neorv32_uart0_printf("CLK = %u Hz\n", (unsigned)clk_hz);
     2b4:	000015b7          	lui	a1,0x1
     2b8:	79458593          	add	a1,a1,1940 # 1794 <__fini_array_end+0x34>
     2bc:	fff50537          	lui	a0,0xfff50
     2c0:	224010ef          	jal	14e4 <neorv32_uart_printf>
  neorv32_uart0_printf("HartID = %u\n", (unsigned)hartid);
     2c4:	000015b7          	lui	a1,0x1
     2c8:	00040613          	mv	a2,s0
     2cc:	7a458593          	add	a1,a1,1956 # 17a4 <__fini_array_end+0x44>
     2d0:	fff50537          	lui	a0,0xfff50
     2d4:	210010ef          	jal	14e4 <neorv32_uart_printf>
  uint32_t id = *CFS_REG(CFS_REG_ID);
     2d8:	ffeb07b7          	lui	a5,0xffeb0
     2dc:	0007a403          	lw	s0,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  neorv32_uart0_puts("CFS ID = 0x"); uart0_print_hex32(id); neorv32_uart0_puts("\n");
     2e0:	000015b7          	lui	a1,0x1
     2e4:	7b458593          	add	a1,a1,1972 # 17b4 <__fini_array_end+0x54>
     2e8:	fff50537          	lui	a0,0xfff50
     2ec:	629000ef          	jal	1114 <neorv32_uart_puts>
     2f0:	00040513          	mv	a0,s0
     2f4:	ef1ff0ef          	jal	1e4 <uart0_print_hex32>
     2f8:	00001937          	lui	s2,0x1
     2fc:	7c090593          	add	a1,s2,1984 # 17c0 <__fini_array_end+0x60>
     300:	fff50537          	lui	a0,0xfff50
     304:	611000ef          	jal	1114 <neorv32_uart_puts>
  int8_t A[4][4] = {
     308:	04040eb7          	lui	t4,0x4040
     30c:	08f90e37          	lui	t3,0x8f90
     310:	f40b1337          	lui	t1,0xf40b1
     314:	010208b7          	lui	a7,0x1020
  int8_t B[4][4] = {
     318:	03010837          	lui	a6,0x3010
     31c:	000206b7          	lui	a3,0x20
     320:	fd030737          	lui	a4,0xfd030
     324:	020007b7          	lui	a5,0x2000
  int8_t A[4][4] = {
     328:	e01e8e93          	add	t4,t4,-511 # 403fe01 <__neorv32_ram_size+0x3fbfe01>
     32c:	6fbe0e13          	add	t3,t3,1787 # 8f906fb <__neorv32_ram_size+0x8f106fb>
     330:	a0930313          	add	t1,t1,-1527 # f40b0a09 <__crt0_ram_last+0x74030a0a>
     334:	fff88893          	add	a7,a7,-1 # 101ffff <__neorv32_ram_size+0xf9ffff>
  int8_t B[4][4] = {
     338:	00280813          	add	a6,a6,2 # 3010002 <__neorv32_ram_size+0x2f90002>
     33c:	4ff68693          	add	a3,a3,1279 # 204ff <__neorv32_rom_size+0x4ff>
     340:	e0570713          	add	a4,a4,-507 # fd02fe05 <__crt0_ram_last+0x7cfafe06>
     344:	10178793          	add	a5,a5,257 # 2000101 <__neorv32_ram_size+0x1f80101>
  int32_t C_hw[4][4] = {0};
     348:	04000613          	li	a2,64
     34c:	00000593          	li	a1,0
     350:	0d010513          	add	a0,sp,208
  int8_t A[4][4] = {
     354:	09d12823          	sw	t4,144(sp)
     358:	09c12a23          	sw	t3,148(sp)
     35c:	08612c23          	sw	t1,152(sp)
     360:	09112e23          	sw	a7,156(sp)
  int8_t B[4][4] = {
     364:	0b012023          	sw	a6,160(sp)
     368:	0ad12223          	sw	a3,164(sp)
     36c:	0ae12423          	sw	a4,168(sp)
     370:	0af12623          	sw	a5,172(sp)
  int32_t C_hw[4][4] = {0};
     374:	1ac010ef          	jal	1520 <memset>
  int32_t C_sw[4][4] = {0};
     378:	04000613          	li	a2,64
     37c:	00000593          	li	a1,0
     380:	11010513          	add	a0,sp,272
     384:	19c010ef          	jal	1520 <memset>
     388:	b80027f3          	csrr	a5,mcycleh
     38c:	b0002673          	csrr	a2,mcycle
     390:	b8002373          	csrr	t1,mcycleh
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MCYCLE); hi0 = hi1; }
     394:	00678463          	beq	a5,t1,39c <main+0x150>
     398:	b0002673          	csrr	a2,mcycle
     39c:	b82027f3          	csrr	a5,minstreth
     3a0:	b02026f3          	csrr	a3,minstret
     3a4:	b82028f3          	csrr	a7,minstreth
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MINSTRET); hi0 = hi1; }
     3a8:	01178463          	beq	a5,a7,3b0 <main+0x164>
     3ac:	b02026f3          	csrr	a3,minstret
    arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
     3b0:	04040f37          	lui	t5,0x4040
     3b4:	08f90eb7          	lui	t4,0x8f90
     3b8:	f40b1e37          	lui	t3,0xf40b1
     3bc:	01020837          	lui	a6,0x1020
    bcol[j] = pack_i8(B[3][j], B[2][j], B[1][j], B[0][j]);
     3c0:	01060537          	lui	a0,0x1060
     3c4:	01fe05b7          	lui	a1,0x1fe0
     3c8:	00020737          	lui	a4,0x20
     3cc:	02fd07b7          	lui	a5,0x2fd0
    arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
     3d0:	e01f0f13          	add	t5,t5,-511 # 403fe01 <__neorv32_ram_size+0x3fbfe01>
     3d4:	6fbe8e93          	add	t4,t4,1787 # 8f906fb <__neorv32_ram_size+0x8f106fb>
     3d8:	a09e0e13          	add	t3,t3,-1527 # f40b0a09 <__crt0_ram_last+0x74030a0a>
     3dc:	fff80813          	add	a6,a6,-1 # 101ffff <__neorv32_ram_size+0xf9ffff>
    bcol[j] = pack_i8(B[3][j], B[2][j], B[1][j], B[0][j]);
     3e0:	f0250513          	add	a0,a0,-254 # 105ff02 <__neorv32_ram_size+0xfdff02>
     3e4:	40058593          	add	a1,a1,1024 # 1fe0400 <__neorv32_ram_size+0x1f60400>
     3e8:	20170713          	add	a4,a4,513 # 20201 <__neorv32_rom_size+0x201>
     3ec:	00378793          	add	a5,a5,3 # 2fd0003 <__neorv32_ram_size+0x2f50003>
    arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
     3f0:	0bd12a23          	sw	t4,180(sp)
     3f4:	0b012e23          	sw	a6,188(sp)
    bcol[j] = pack_i8(B[3][j], B[2][j], B[1][j], B[0][j]);
     3f8:	0ca12023          	sw	a0,192(sp)
     3fc:	0cb12223          	sw	a1,196(sp)
     400:	0ce12423          	sw	a4,200(sp)
     404:	0cf12623          	sw	a5,204(sp)
    arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
     408:	0be12823          	sw	t5,176(sp)
     40c:	0bc12c23          	sw	t3,184(sp)
static inline void cfs_clear(void) { *CFS_REG(CFS_REG_ID) = 0x2; }
     410:	ffeb07b7          	lui	a5,0xffeb0
     414:	00200713          	li	a4,2
     418:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void cfs_load_a_row(int r, uint32_t packed) { *CFS_REG(CFS_REG_A0 + (uint32_t)r) = packed; }
     41c:	0b012703          	lw	a4,176(sp)
     420:	ffeb0837          	lui	a6,0xffeb0
     424:	ffeb0537          	lui	a0,0xffeb0
     428:	00e82223          	sw	a4,4(a6) # ffeb0004 <__crt0_ram_last+0x7fe30005>
     42c:	0b412583          	lw	a1,180(sp)
     430:	ffeb0737          	lui	a4,0xffeb0
     434:	00b52423          	sw	a1,8(a0) # ffeb0008 <__crt0_ram_last+0x7fe30009>
     438:	0b812e03          	lw	t3,184(sp)
     43c:	ffeb05b7          	lui	a1,0xffeb0
     440:	01c72623          	sw	t3,12(a4) # ffeb000c <__crt0_ram_last+0x7fe3000d>
     444:	0bc12e03          	lw	t3,188(sp)
static inline void cfs_load_b_col(int c, uint32_t packed) { *CFS_REG(CFS_REG_B0 + (uint32_t)c) = packed; }
     448:	ffeb0737          	lui	a4,0xffeb0
static inline void cfs_load_a_row(int r, uint32_t packed) { *CFS_REG(CFS_REG_A0 + (uint32_t)r) = packed; }
     44c:	01c5a823          	sw	t3,16(a1) # ffeb0010 <__crt0_ram_last+0x7fe30011>
static inline void cfs_load_b_col(int c, uint32_t packed) { *CFS_REG(CFS_REG_B0 + (uint32_t)c) = packed; }
     450:	0c012e03          	lw	t3,192(sp)
     454:	ffeb05b7          	lui	a1,0xffeb0
     458:	01c72a23          	sw	t3,20(a4) # ffeb0014 <__crt0_ram_last+0x7fe30015>
     45c:	0c412e03          	lw	t3,196(sp)
     460:	ffeb0737          	lui	a4,0xffeb0
     464:	01c5ac23          	sw	t3,24(a1) # ffeb0018 <__crt0_ram_last+0x7fe30019>
     468:	0c812583          	lw	a1,200(sp)
     46c:	ffeb0e37          	lui	t3,0xffeb0
     470:	00b72e23          	sw	a1,28(a4) # ffeb001c <__crt0_ram_last+0x7fe3001d>
     474:	0cc12e83          	lw	t4,204(sp)
static inline void cfs_step(void)  { *CFS_REG(CFS_REG_ID) = 0x1; }
     478:	00100713          	li	a4,1
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     47c:	ffeb05b7          	lui	a1,0xffeb0
static inline void cfs_load_b_col(int c, uint32_t packed) { *CFS_REG(CFS_REG_B0 + (uint32_t)c) = packed; }
     480:	03de2023          	sw	t4,32(t3) # ffeb0020 <__crt0_ram_last+0x7fe30021>
static inline void cfs_step(void)  { *CFS_REG(CFS_REG_ID) = 0x1; }
     484:	00e7a023          	sw	a4,0(a5)
     488:	00e7a023          	sw	a4,0(a5)
     48c:	00e7a023          	sw	a4,0(a5)
     490:	00e7a023          	sw	a4,0(a5)
     494:	00e7a023          	sw	a4,0(a5)
     498:	00e7a023          	sw	a4,0(a5)
     49c:	00e7a023          	sw	a4,0(a5)
     4a0:	00e7a023          	sw	a4,0(a5)
     4a4:	00e7a023          	sw	a4,0(a5)
     4a8:	00e7a023          	sw	a4,0(a5)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4ac:	0405ae03          	lw	t3,64(a1) # ffeb0040 <__crt0_ram_last+0x7fe30041>
      C[i][j] += cfs_read_c(i, j);
     4b0:	0d012703          	lw	a4,208(sp)
     4b4:	00ee0733          	add	a4,t3,a4
     4b8:	02e12a23          	sw	a4,52(sp)
     4bc:	0ce12823          	sw	a4,208(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4c0:	0447ae03          	lw	t3,68(a5)
      C[i][j] += cfs_read_c(i, j);
     4c4:	0d412703          	lw	a4,212(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4c8:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     4cc:	00ee0733          	add	a4,t3,a4
     4d0:	02e12823          	sw	a4,48(sp)
     4d4:	0ce12a23          	sw	a4,212(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4d8:	0487ae03          	lw	t3,72(a5) # ffeb0048 <__crt0_ram_last+0x7fe30049>
      C[i][j] += cfs_read_c(i, j);
     4dc:	0d812703          	lw	a4,216(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4e0:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     4e4:	00ee0733          	add	a4,t3,a4
     4e8:	02e12623          	sw	a4,44(sp)
     4ec:	0ce12c23          	sw	a4,216(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4f0:	04c7ae03          	lw	t3,76(a5) # ffeb004c <__crt0_ram_last+0x7fe3004d>
      C[i][j] += cfs_read_c(i, j);
     4f4:	0dc12703          	lw	a4,220(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     4f8:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     4fc:	00ee0733          	add	a4,t3,a4
     500:	02e12423          	sw	a4,40(sp)
     504:	0ce12e23          	sw	a4,220(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     508:	0507ae03          	lw	t3,80(a5) # ffeb0050 <__crt0_ram_last+0x7fe30051>
      C[i][j] += cfs_read_c(i, j);
     50c:	0e012703          	lw	a4,224(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     510:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     514:	00ee0733          	add	a4,t3,a4
     518:	06e12423          	sw	a4,104(sp)
     51c:	0ee12023          	sw	a4,224(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     520:	0547ae03          	lw	t3,84(a5) # ffeb0054 <__crt0_ram_last+0x7fe30055>
      C[i][j] += cfs_read_c(i, j);
     524:	0e412703          	lw	a4,228(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     528:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     52c:	00ee0733          	add	a4,t3,a4
     530:	06e12623          	sw	a4,108(sp)
     534:	0ee12223          	sw	a4,228(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     538:	0587ae03          	lw	t3,88(a5) # ffeb0058 <__crt0_ram_last+0x7fe30059>
      C[i][j] += cfs_read_c(i, j);
     53c:	0e812703          	lw	a4,232(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     540:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     544:	00ee0733          	add	a4,t3,a4
     548:	06e12823          	sw	a4,112(sp)
     54c:	0ee12423          	sw	a4,232(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     550:	05c7ae03          	lw	t3,92(a5) # ffeb005c <__crt0_ram_last+0x7fe3005d>
      C[i][j] += cfs_read_c(i, j);
     554:	0ec12703          	lw	a4,236(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     558:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     55c:	00ee0733          	add	a4,t3,a4
     560:	06e12a23          	sw	a4,116(sp)
     564:	0ee12623          	sw	a4,236(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     568:	0607ae03          	lw	t3,96(a5) # ffeb0060 <__crt0_ram_last+0x7fe30061>
      C[i][j] += cfs_read_c(i, j);
     56c:	0f012703          	lw	a4,240(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     570:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     574:	00ee0733          	add	a4,t3,a4
     578:	06e12c23          	sw	a4,120(sp)
     57c:	0ee12823          	sw	a4,240(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     580:	0647ae03          	lw	t3,100(a5) # ffeb0064 <__crt0_ram_last+0x7fe30065>
      C[i][j] += cfs_read_c(i, j);
     584:	0f412703          	lw	a4,244(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     588:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     58c:	00ee0733          	add	a4,t3,a4
     590:	06e12e23          	sw	a4,124(sp)
     594:	0ee12a23          	sw	a4,244(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     598:	0687ae03          	lw	t3,104(a5) # ffeb0068 <__crt0_ram_last+0x7fe30069>
      C[i][j] += cfs_read_c(i, j);
     59c:	0f812703          	lw	a4,248(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5a0:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     5a4:	00ee0733          	add	a4,t3,a4
     5a8:	08e12023          	sw	a4,128(sp)
     5ac:	0ee12c23          	sw	a4,248(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5b0:	06c7ae03          	lw	t3,108(a5) # ffeb006c <__crt0_ram_last+0x7fe3006d>
      C[i][j] += cfs_read_c(i, j);
     5b4:	0fc12703          	lw	a4,252(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5b8:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     5bc:	00ee0733          	add	a4,t3,a4
     5c0:	08e12223          	sw	a4,132(sp)
     5c4:	0ee12e23          	sw	a4,252(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5c8:	0707ae03          	lw	t3,112(a5) # ffeb0070 <__crt0_ram_last+0x7fe30071>
      C[i][j] += cfs_read_c(i, j);
     5cc:	10012703          	lw	a4,256(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5d0:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     5d4:	00ee0733          	add	a4,t3,a4
     5d8:	04e12423          	sw	a4,72(sp)
     5dc:	10e12023          	sw	a4,256(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5e0:	0747ae03          	lw	t3,116(a5) # ffeb0074 <__crt0_ram_last+0x7fe30075>
      C[i][j] += cfs_read_c(i, j);
     5e4:	10412703          	lw	a4,260(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5e8:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     5ec:	00ee0733          	add	a4,t3,a4
     5f0:	08e12423          	sw	a4,136(sp)
     5f4:	10e12223          	sw	a4,260(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     5f8:	0787ae03          	lw	t3,120(a5) # ffeb0078 <__crt0_ram_last+0x7fe30079>
      C[i][j] += cfs_read_c(i, j);
     5fc:	10812703          	lw	a4,264(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     600:	ffeb07b7          	lui	a5,0xffeb0
      C[i][j] += cfs_read_c(i, j);
     604:	00ee0733          	add	a4,t3,a4
     608:	08e12623          	sw	a4,140(sp)
     60c:	10e12423          	sw	a4,264(sp)
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }
     610:	07c7a703          	lw	a4,124(a5) # ffeb007c <__crt0_ram_last+0x7fe3007d>
      C[i][j] += cfs_read_c(i, j);
     614:	10c12783          	lw	a5,268(sp)
     618:	00f707b3          	add	a5,a4,a5
     61c:	04f12a23          	sw	a5,84(sp)
     620:	10f12623          	sw	a5,268(sp)
     624:	b80027f3          	csrr	a5,mcycleh
     628:	b0002773          	csrr	a4,mcycle
     62c:	b8002573          	csrr	a0,mcycleh
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MCYCLE); hi0 = hi1; }
     630:	00a78463          	beq	a5,a0,638 <main+0x3ec>
     634:	b0002773          	csrr	a4,mcycle
     638:	b8202873          	csrr	a6,minstreth
     63c:	b02027f3          	csrr	a5,minstret
     640:	b82025f3          	csrr	a1,minstreth
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MINSTRET); hi0 = hi1; }
     644:	00b80463          	beq	a6,a1,64c <main+0x400>
     648:	b02027f3          	csrr	a5,minstret
  uint64_t dcyc = c1 - c0, dins = i1 - i0;
     64c:	40c70a33          	sub	s4,a4,a2
     650:	40d789b3          	sub	s3,a5,a3
     654:	41158433          	sub	s0,a1,a7
  neorv32_uart0_puts("CFS cycles  = 0x");
     658:	000015b7          	lui	a1,0x1
  uint64_t dcyc = c1 - c0, dins = i1 - i0;
     65c:	01473733          	sltu	a4,a4,s4
     660:	406504b3          	sub	s1,a0,t1
     664:	0137b7b3          	sltu	a5,a5,s3
  neorv32_uart0_puts("CFS cycles  = 0x");
     668:	7c458593          	add	a1,a1,1988 # 17c4 <__fini_array_end+0x64>
     66c:	fff50537          	lui	a0,0xfff50
  uint64_t dcyc = c1 - c0, dins = i1 - i0;
     670:	40e484b3          	sub	s1,s1,a4
     674:	40f40433          	sub	s0,s0,a5
  neorv32_uart0_puts("CFS cycles  = 0x");
     678:	29d000ef          	jal	1114 <neorv32_uart_puts>
  uart0_print_hex32((uint32_t)(dcyc >> 32)); uart0_print_hex32((uint32_t)dcyc); neorv32_uart0_puts("\n");
     67c:	00048513          	mv	a0,s1
     680:	b65ff0ef          	jal	1e4 <uart0_print_hex32>
     684:	000a0513          	mv	a0,s4
     688:	b5dff0ef          	jal	1e4 <uart0_print_hex32>
     68c:	7c090593          	add	a1,s2,1984
     690:	fff50537          	lui	a0,0xfff50
     694:	281000ef          	jal	1114 <neorv32_uart_puts>
  neorv32_uart0_puts("CFS instret = 0x");
     698:	000015b7          	lui	a1,0x1
     69c:	7d858593          	add	a1,a1,2008 # 17d8 <__fini_array_end+0x78>
     6a0:	fff50537          	lui	a0,0xfff50
     6a4:	271000ef          	jal	1114 <neorv32_uart_puts>
  uart0_print_hex32((uint32_t)(dins >> 32)); uart0_print_hex32((uint32_t)dins); neorv32_uart0_puts("\n");
     6a8:	00040513          	mv	a0,s0
     6ac:	b39ff0ef          	jal	1e4 <uart0_print_hex32>
     6b0:	00098513          	mv	a0,s3
     6b4:	b31ff0ef          	jal	1e4 <uart0_print_hex32>
     6b8:	7c090593          	add	a1,s2,1984
     6bc:	fff50537          	lui	a0,0xfff50
     6c0:	255000ef          	jal	1114 <neorv32_uart_puts>
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     6c4:	0a410b03          	lb	s6,164(sp)
     6c8:	09110d83          	lb	s11,145(sp)
     6cc:	0aa10683          	lb	a3,170(sp)
     6d0:	0ae10603          	lb	a2,174(sp)
     6d4:	0a310803          	lb	a6,163(sp)
     6d8:	0a710883          	lb	a7,167(sp)
     6dc:	0ab10303          	lb	t1,171(sp)
     6e0:	0af10e03          	lb	t3,175(sp)
     6e4:	0a610703          	lb	a4,166(sp)
     6e8:	0a210783          	lb	a5,162(sp)
     6ec:	0a010b83          	lb	s7,160(sp)
     6f0:	09010d03          	lb	s10,144(sp)
     6f4:	000d8593          	mv	a1,s11
     6f8:	000b0513          	mv	a0,s6
     6fc:	00d12623          	sw	a3,12(sp)
     700:	00c12823          	sw	a2,16(sp)
     704:	03012023          	sw	a6,32(sp)
     708:	01112a23          	sw	a7,20(sp)
     70c:	00612c23          	sw	t1,24(sp)
     710:	01c12e23          	sw	t3,28(sp)
     714:	00e12423          	sw	a4,8(sp)
     718:	00f12223          	sw	a5,4(sp)
     71c:	76d000ef          	jal	1688 <__mulsi3>
     720:	00050c13          	mv	s8,a0
     724:	000d0593          	mv	a1,s10
     728:	000b8513          	mv	a0,s7
     72c:	75d000ef          	jal	1688 <__mulsi3>
     730:	0a810a83          	lb	s5,168(sp)
     734:	09210c83          	lb	s9,146(sp)
     738:	00050793          	mv	a5,a0
     73c:	00fc07b3          	add	a5,s8,a5
     740:	000c8593          	mv	a1,s9
     744:	000a8513          	mv	a0,s5
     748:	02f12223          	sw	a5,36(sp)
     74c:	73d000ef          	jal	1688 <__mulsi3>
     750:	0ac10a03          	lb	s4,172(sp)
     754:	09310c03          	lb	s8,147(sp)
     758:	02412783          	lw	a5,36(sp)
     75c:	00050713          	mv	a4,a0
     760:	000c0593          	mv	a1,s8
     764:	00f707b3          	add	a5,a4,a5
     768:	000a0513          	mv	a0,s4
     76c:	02f12223          	sw	a5,36(sp)
     770:	719000ef          	jal	1688 <__mulsi3>
     774:	02412783          	lw	a5,36(sp)
     778:	0a510903          	lb	s2,165(sp)
     77c:	0a110983          	lb	s3,161(sp)
     780:	00f505b3          	add	a1,a0,a5
     784:	00058e93          	mv	t4,a1
     788:	06b12223          	sw	a1,100(sp)
     78c:	00090513          	mv	a0,s2
     790:	000d8593          	mv	a1,s11
      C[i][j] = s;
     794:	11d12823          	sw	t4,272(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     798:	6f1000ef          	jal	1688 <__mulsi3>
     79c:	00050793          	mv	a5,a0
     7a0:	000d0593          	mv	a1,s10
     7a4:	00098513          	mv	a0,s3
     7a8:	02f12223          	sw	a5,36(sp)
     7ac:	6dd000ef          	jal	1688 <__mulsi3>
     7b0:	0a910483          	lb	s1,169(sp)
     7b4:	02412783          	lw	a5,36(sp)
     7b8:	00050713          	mv	a4,a0
     7bc:	000c8593          	mv	a1,s9
     7c0:	00e787b3          	add	a5,a5,a4
     7c4:	00048513          	mv	a0,s1
     7c8:	02f12223          	sw	a5,36(sp)
     7cc:	6bd000ef          	jal	1688 <__mulsi3>
     7d0:	0ad10403          	lb	s0,173(sp)
     7d4:	02412783          	lw	a5,36(sp)
     7d8:	00050713          	mv	a4,a0
     7dc:	000c0593          	mv	a1,s8
     7e0:	00f707b3          	add	a5,a4,a5
     7e4:	00040513          	mv	a0,s0
     7e8:	02f12223          	sw	a5,36(sp)
     7ec:	69d000ef          	jal	1688 <__mulsi3>
     7f0:	02412783          	lw	a5,36(sp)
     7f4:	000d8593          	mv	a1,s11
     7f8:	00f50eb3          	add	t4,a0,a5
     7fc:	00812503          	lw	a0,8(sp)
     800:	07d12023          	sw	t4,96(sp)
      C[i][j] = s;
     804:	11d12a23          	sw	t4,276(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     808:	681000ef          	jal	1688 <__mulsi3>
     80c:	00050793          	mv	a5,a0
     810:	00412503          	lw	a0,4(sp)
     814:	000d0593          	mv	a1,s10
     818:	02f12223          	sw	a5,36(sp)
     81c:	66d000ef          	jal	1688 <__mulsi3>
     820:	02412783          	lw	a5,36(sp)
     824:	00050713          	mv	a4,a0
     828:	00c12503          	lw	a0,12(sp)
     82c:	00e787b3          	add	a5,a5,a4
     830:	000c8593          	mv	a1,s9
     834:	02f12223          	sw	a5,36(sp)
     838:	651000ef          	jal	1688 <__mulsi3>
     83c:	02412783          	lw	a5,36(sp)
     840:	00050713          	mv	a4,a0
     844:	01012503          	lw	a0,16(sp)
     848:	00f707b3          	add	a5,a4,a5
     84c:	000c0593          	mv	a1,s8
     850:	02f12223          	sw	a5,36(sp)
     854:	635000ef          	jal	1688 <__mulsi3>
     858:	02412783          	lw	a5,36(sp)
     85c:	000d8593          	mv	a1,s11
     860:	00f50eb3          	add	t4,a0,a5
     864:	01412503          	lw	a0,20(sp)
     868:	05d12e23          	sw	t4,92(sp)
      C[i][j] = s;
     86c:	11d12c23          	sw	t4,280(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     870:	619000ef          	jal	1688 <__mulsi3>
     874:	00050793          	mv	a5,a0
     878:	02012503          	lw	a0,32(sp)
     87c:	000d0593          	mv	a1,s10
     880:	00078d13          	mv	s10,a5
     884:	605000ef          	jal	1688 <__mulsi3>
     888:	00050793          	mv	a5,a0
     88c:	01812503          	lw	a0,24(sp)
     890:	000c8593          	mv	a1,s9
     894:	00fd0cb3          	add	s9,s10,a5
     898:	5f1000ef          	jal	1688 <__mulsi3>
     89c:	00050793          	mv	a5,a0
     8a0:	01c12503          	lw	a0,28(sp)
     8a4:	000c0593          	mv	a1,s8
     8a8:	01978cb3          	add	s9,a5,s9
     8ac:	5dd000ef          	jal	1688 <__mulsi3>
     8b0:	09510d83          	lb	s11,149(sp)
     8b4:	09410d03          	lb	s10,148(sp)
     8b8:	019505b3          	add	a1,a0,s9
     8bc:	00058e93          	mv	t4,a1
     8c0:	04b12c23          	sw	a1,88(sp)
     8c4:	000d8513          	mv	a0,s11
     8c8:	000b0593          	mv	a1,s6
      C[i][j] = s;
     8cc:	11d12e23          	sw	t4,284(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     8d0:	5b9000ef          	jal	1688 <__mulsi3>
     8d4:	00050c13          	mv	s8,a0
     8d8:	000b8593          	mv	a1,s7
     8dc:	000d0513          	mv	a0,s10
     8e0:	5a9000ef          	jal	1688 <__mulsi3>
     8e4:	09610c83          	lb	s9,150(sp)
     8e8:	00ac07b3          	add	a5,s8,a0
     8ec:	000a8593          	mv	a1,s5
     8f0:	000c8513          	mv	a0,s9
     8f4:	02f12223          	sw	a5,36(sp)
     8f8:	591000ef          	jal	1688 <__mulsi3>
     8fc:	02412783          	lw	a5,36(sp)
     900:	09710c03          	lb	s8,151(sp)
     904:	000a0593          	mv	a1,s4
     908:	00f507b3          	add	a5,a0,a5
     90c:	000c0513          	mv	a0,s8
     910:	02f12223          	sw	a5,36(sp)
     914:	575000ef          	jal	1688 <__mulsi3>
     918:	02412783          	lw	a5,36(sp)
     91c:	00f505b3          	add	a1,a0,a5
     920:	00058e93          	mv	t4,a1
     924:	04b12823          	sw	a1,80(sp)
     928:	000d8513          	mv	a0,s11
     92c:	00090593          	mv	a1,s2
      C[i][j] = s;
     930:	13d12023          	sw	t4,288(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     934:	555000ef          	jal	1688 <__mulsi3>
     938:	00050793          	mv	a5,a0
     93c:	00098593          	mv	a1,s3
     940:	000d0513          	mv	a0,s10
     944:	02f12223          	sw	a5,36(sp)
     948:	541000ef          	jal	1688 <__mulsi3>
     94c:	02412783          	lw	a5,36(sp)
     950:	00050713          	mv	a4,a0
     954:	00048593          	mv	a1,s1
     958:	00e787b3          	add	a5,a5,a4
     95c:	000c8513          	mv	a0,s9
     960:	02f12223          	sw	a5,36(sp)
     964:	525000ef          	jal	1688 <__mulsi3>
     968:	02412783          	lw	a5,36(sp)
     96c:	00050713          	mv	a4,a0
     970:	00040593          	mv	a1,s0
     974:	00f707b3          	add	a5,a4,a5
     978:	000c0513          	mv	a0,s8
     97c:	02f12223          	sw	a5,36(sp)
     980:	509000ef          	jal	1688 <__mulsi3>
     984:	02412783          	lw	a5,36(sp)
     988:	00812583          	lw	a1,8(sp)
     98c:	00f50eb3          	add	t4,a0,a5
     990:	000d8513          	mv	a0,s11
     994:	05d12623          	sw	t4,76(sp)
      C[i][j] = s;
     998:	13d12223          	sw	t4,292(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     99c:	4ed000ef          	jal	1688 <__mulsi3>
     9a0:	00412583          	lw	a1,4(sp)
     9a4:	00050793          	mv	a5,a0
     9a8:	000d0513          	mv	a0,s10
     9ac:	02f12223          	sw	a5,36(sp)
     9b0:	4d9000ef          	jal	1688 <__mulsi3>
     9b4:	02412783          	lw	a5,36(sp)
     9b8:	00c12583          	lw	a1,12(sp)
     9bc:	00050713          	mv	a4,a0
     9c0:	00e787b3          	add	a5,a5,a4
     9c4:	000c8513          	mv	a0,s9
     9c8:	02f12223          	sw	a5,36(sp)
     9cc:	4bd000ef          	jal	1688 <__mulsi3>
     9d0:	02412783          	lw	a5,36(sp)
     9d4:	01012583          	lw	a1,16(sp)
     9d8:	00050713          	mv	a4,a0
     9dc:	00f707b3          	add	a5,a4,a5
     9e0:	000c0513          	mv	a0,s8
     9e4:	02f12223          	sw	a5,36(sp)
     9e8:	4a1000ef          	jal	1688 <__mulsi3>
     9ec:	02412783          	lw	a5,36(sp)
     9f0:	01412583          	lw	a1,20(sp)
     9f4:	00f50eb3          	add	t4,a0,a5
     9f8:	000d8513          	mv	a0,s11
     9fc:	05d12223          	sw	t4,68(sp)
      C[i][j] = s;
     a00:	13d12423          	sw	t4,296(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     a04:	485000ef          	jal	1688 <__mulsi3>
     a08:	02012583          	lw	a1,32(sp)
     a0c:	00050793          	mv	a5,a0
     a10:	000d0513          	mv	a0,s10
     a14:	00078d13          	mv	s10,a5
     a18:	471000ef          	jal	1688 <__mulsi3>
     a1c:	01812583          	lw	a1,24(sp)
     a20:	00050793          	mv	a5,a0
     a24:	000c8513          	mv	a0,s9
     a28:	00fd0cb3          	add	s9,s10,a5
     a2c:	45d000ef          	jal	1688 <__mulsi3>
     a30:	01c12583          	lw	a1,28(sp)
     a34:	00050793          	mv	a5,a0
     a38:	000c0513          	mv	a0,s8
     a3c:	01978cb3          	add	s9,a5,s9
     a40:	449000ef          	jal	1688 <__mulsi3>
     a44:	09910d83          	lb	s11,153(sp)
     a48:	09810d03          	lb	s10,152(sp)
     a4c:	01950533          	add	a0,a0,s9
     a50:	00050e93          	mv	t4,a0
     a54:	000b0593          	mv	a1,s6
     a58:	04a12023          	sw	a0,64(sp)
     a5c:	000d8513          	mv	a0,s11
      C[i][j] = s;
     a60:	13d12623          	sw	t4,300(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     a64:	425000ef          	jal	1688 <__mulsi3>
     a68:	00050c13          	mv	s8,a0
     a6c:	000b8593          	mv	a1,s7
     a70:	000d0513          	mv	a0,s10
     a74:	415000ef          	jal	1688 <__mulsi3>
     a78:	09a10c83          	lb	s9,154(sp)
     a7c:	00ac07b3          	add	a5,s8,a0
     a80:	000a8593          	mv	a1,s5
     a84:	000c8513          	mv	a0,s9
     a88:	02f12223          	sw	a5,36(sp)
     a8c:	3fd000ef          	jal	1688 <__mulsi3>
     a90:	02412783          	lw	a5,36(sp)
     a94:	09b10c03          	lb	s8,155(sp)
     a98:	000a0593          	mv	a1,s4
     a9c:	00f507b3          	add	a5,a0,a5
     aa0:	000c0513          	mv	a0,s8
     aa4:	02f12223          	sw	a5,36(sp)
     aa8:	3e1000ef          	jal	1688 <__mulsi3>
     aac:	02412783          	lw	a5,36(sp)
     ab0:	00090593          	mv	a1,s2
     ab4:	00f50533          	add	a0,a0,a5
     ab8:	00050e93          	mv	t4,a0
     abc:	02a12e23          	sw	a0,60(sp)
     ac0:	000d8513          	mv	a0,s11
      C[i][j] = s;
     ac4:	13d12823          	sw	t4,304(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     ac8:	3c1000ef          	jal	1688 <__mulsi3>
     acc:	00050793          	mv	a5,a0
     ad0:	00098593          	mv	a1,s3
     ad4:	000d0513          	mv	a0,s10
     ad8:	02f12223          	sw	a5,36(sp)
     adc:	3ad000ef          	jal	1688 <__mulsi3>
     ae0:	02412783          	lw	a5,36(sp)
     ae4:	00050713          	mv	a4,a0
     ae8:	00048593          	mv	a1,s1
     aec:	00e787b3          	add	a5,a5,a4
     af0:	000c8513          	mv	a0,s9
     af4:	02f12223          	sw	a5,36(sp)
     af8:	391000ef          	jal	1688 <__mulsi3>
     afc:	02412783          	lw	a5,36(sp)
     b00:	00050713          	mv	a4,a0
     b04:	00040593          	mv	a1,s0
     b08:	00f707b3          	add	a5,a4,a5
     b0c:	000c0513          	mv	a0,s8
     b10:	02f12223          	sw	a5,36(sp)
     b14:	375000ef          	jal	1688 <__mulsi3>
     b18:	02412783          	lw	a5,36(sp)
     b1c:	00812583          	lw	a1,8(sp)
     b20:	00f50eb3          	add	t4,a0,a5
     b24:	000d8513          	mv	a0,s11
     b28:	03d12c23          	sw	t4,56(sp)
      C[i][j] = s;
     b2c:	13d12a23          	sw	t4,308(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     b30:	359000ef          	jal	1688 <__mulsi3>
     b34:	00412583          	lw	a1,4(sp)
     b38:	00050793          	mv	a5,a0
     b3c:	000d0513          	mv	a0,s10
     b40:	02f12223          	sw	a5,36(sp)
     b44:	345000ef          	jal	1688 <__mulsi3>
     b48:	02412783          	lw	a5,36(sp)
     b4c:	00c12583          	lw	a1,12(sp)
     b50:	00050713          	mv	a4,a0
     b54:	00e787b3          	add	a5,a5,a4
     b58:	000c8513          	mv	a0,s9
     b5c:	02f12223          	sw	a5,36(sp)
     b60:	329000ef          	jal	1688 <__mulsi3>
     b64:	02412783          	lw	a5,36(sp)
     b68:	01012583          	lw	a1,16(sp)
     b6c:	00050713          	mv	a4,a0
     b70:	00f707b3          	add	a5,a4,a5
     b74:	000c0513          	mv	a0,s8
     b78:	02f12223          	sw	a5,36(sp)
     b7c:	30d000ef          	jal	1688 <__mulsi3>
     b80:	02412783          	lw	a5,36(sp)
     b84:	01412583          	lw	a1,20(sp)
     b88:	00f50eb3          	add	t4,a0,a5
     b8c:	000d8513          	mv	a0,s11
     b90:	03d12223          	sw	t4,36(sp)
      C[i][j] = s;
     b94:	13d12c23          	sw	t4,312(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     b98:	2f1000ef          	jal	1688 <__mulsi3>
     b9c:	02012d83          	lw	s11,32(sp)
     ba0:	00050793          	mv	a5,a0
     ba4:	000d0513          	mv	a0,s10
     ba8:	000d8593          	mv	a1,s11
     bac:	00078d13          	mv	s10,a5
     bb0:	2d9000ef          	jal	1688 <__mulsi3>
     bb4:	01812583          	lw	a1,24(sp)
     bb8:	00050793          	mv	a5,a0
     bbc:	000c8513          	mv	a0,s9
     bc0:	00fd0cb3          	add	s9,s10,a5
     bc4:	2c5000ef          	jal	1688 <__mulsi3>
     bc8:	01c12583          	lw	a1,28(sp)
     bcc:	00050793          	mv	a5,a0
     bd0:	000c0513          	mv	a0,s8
     bd4:	01978cb3          	add	s9,a5,s9
     bd8:	2b1000ef          	jal	1688 <__mulsi3>
     bdc:	09c10c03          	lb	s8,156(sp)
     be0:	000b8593          	mv	a1,s7
     be4:	09d10b83          	lb	s7,157(sp)
     be8:	01950cb3          	add	s9,a0,s9
     bec:	000c0513          	mv	a0,s8
      C[i][j] = s;
     bf0:	13912e23          	sw	s9,316(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     bf4:	295000ef          	jal	1688 <__mulsi3>
     bf8:	000b0593          	mv	a1,s6
     bfc:	00050d13          	mv	s10,a0
     c00:	000b8513          	mv	a0,s7
     c04:	285000ef          	jal	1688 <__mulsi3>
     c08:	09e10b03          	lb	s6,158(sp)
     c0c:	000a8593          	mv	a1,s5
     c10:	00ad0d33          	add	s10,s10,a0
     c14:	000b0513          	mv	a0,s6
     c18:	271000ef          	jal	1688 <__mulsi3>
     c1c:	09f10a83          	lb	s5,159(sp)
     c20:	000a0593          	mv	a1,s4
     c24:	01a50d33          	add	s10,a0,s10
     c28:	000a8513          	mv	a0,s5
     c2c:	25d000ef          	jal	1688 <__mulsi3>
     c30:	00098593          	mv	a1,s3
     c34:	01a50d33          	add	s10,a0,s10
     c38:	000c0513          	mv	a0,s8
      C[i][j] = s;
     c3c:	15a12023          	sw	s10,320(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     c40:	249000ef          	jal	1688 <__mulsi3>
     c44:	00050793          	mv	a5,a0
     c48:	00090593          	mv	a1,s2
     c4c:	000b8513          	mv	a0,s7
     c50:	00078913          	mv	s2,a5
     c54:	235000ef          	jal	1688 <__mulsi3>
     c58:	00050793          	mv	a5,a0
     c5c:	00048593          	mv	a1,s1
     c60:	000b0513          	mv	a0,s6
     c64:	00f904b3          	add	s1,s2,a5
     c68:	221000ef          	jal	1688 <__mulsi3>
     c6c:	00050793          	mv	a5,a0
     c70:	00040593          	mv	a1,s0
     c74:	000a8513          	mv	a0,s5
     c78:	009784b3          	add	s1,a5,s1
     c7c:	20d000ef          	jal	1688 <__mulsi3>
     c80:	00412583          	lw	a1,4(sp)
     c84:	00950433          	add	s0,a0,s1
     c88:	000c0513          	mv	a0,s8
      C[i][j] = s;
     c8c:	14812223          	sw	s0,324(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     c90:	1f9000ef          	jal	1688 <__mulsi3>
     c94:	00812583          	lw	a1,8(sp)
     c98:	00050493          	mv	s1,a0
     c9c:	000b8513          	mv	a0,s7
     ca0:	1e9000ef          	jal	1688 <__mulsi3>
     ca4:	00c12583          	lw	a1,12(sp)
     ca8:	00050793          	mv	a5,a0
     cac:	000b0513          	mv	a0,s6
     cb0:	00f484b3          	add	s1,s1,a5
     cb4:	1d5000ef          	jal	1688 <__mulsi3>
     cb8:	01012583          	lw	a1,16(sp)
     cbc:	00050913          	mv	s2,a0
     cc0:	000a8513          	mv	a0,s5
     cc4:	1c5000ef          	jal	1688 <__mulsi3>
     cc8:	009904b3          	add	s1,s2,s1
     ccc:	009504b3          	add	s1,a0,s1
     cd0:	000d8593          	mv	a1,s11
     cd4:	000c0513          	mv	a0,s8
      C[i][j] = s;
     cd8:	14912423          	sw	s1,328(sp)
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     cdc:	1ad000ef          	jal	1688 <__mulsi3>
     ce0:	01412583          	lw	a1,20(sp)
     ce4:	00050913          	mv	s2,a0
     ce8:	000b8513          	mv	a0,s7
     cec:	19d000ef          	jal	1688 <__mulsi3>
     cf0:	01812583          	lw	a1,24(sp)
     cf4:	00050793          	mv	a5,a0
     cf8:	000b0513          	mv	a0,s6
     cfc:	00f90933          	add	s2,s2,a5
     d00:	189000ef          	jal	1688 <__mulsi3>
     d04:	01c12583          	lw	a1,28(sp)
     d08:	00050793          	mv	a5,a0
     d0c:	000a8513          	mv	a0,s5
     d10:	01278933          	add	s2,a5,s2
     d14:	175000ef          	jal	1688 <__mulsi3>
     d18:	01250a33          	add	s4,a0,s2
      C[i][j] = s;
     d1c:	15412623          	sw	s4,332(sp)
  for (int i=0;i<4;i++)
     d20:	0d010a93          	add	s5,sp,208
  for (int i=0;i<4;i++) {
     d24:	00000b13          	li	s6,0
     d28:	000019b7          	lui	s3,0x1
     d2c:	00400913          	li	s2,4
    neorv32_uart0_printf("C_hw[%u]: %i %i %i %i\n", (unsigned)i,
     d30:	00caa803          	lw	a6,12(s5)
     d34:	008aa783          	lw	a5,8(s5)
     d38:	004aa703          	lw	a4,4(s5)
     d3c:	000aa683          	lw	a3,0(s5)
     d40:	000b0613          	mv	a2,s6
     d44:	7ec98593          	add	a1,s3,2028 # 17ec <__fini_array_end+0x8c>
     d48:	fff50537          	lui	a0,0xfff50
  for (int i=0;i<4;i++) {
     d4c:	001b0b13          	add	s6,s6,1
    neorv32_uart0_printf("C_hw[%u]: %i %i %i %i\n", (unsigned)i,
     d50:	794000ef          	jal	14e4 <neorv32_uart_printf>
  for (int i=0;i<4;i++) {
     d54:	010a8a93          	add	s5,s5,16
     d58:	fd2b1ce3          	bne	s6,s2,d30 <main+0xae4>
     d5c:	11010a93          	add	s5,sp,272
  for (int i=0;i<4;i++) {
     d60:	00000b13          	li	s6,0
     d64:	000029b7          	lui	s3,0x2
     d68:	00400913          	li	s2,4
    neorv32_uart0_printf("C_sw[%u]: %i %i %i %i\n", (unsigned)i,
     d6c:	00caa803          	lw	a6,12(s5)
     d70:	008aa783          	lw	a5,8(s5)
     d74:	004aa703          	lw	a4,4(s5)
     d78:	000aa683          	lw	a3,0(s5)
     d7c:	000b0613          	mv	a2,s6
     d80:	80498593          	add	a1,s3,-2044 # 1804 <__fini_array_end+0xa4>
     d84:	fff50537          	lui	a0,0xfff50
  for (int i=0;i<4;i++) {
     d88:	001b0b13          	add	s6,s6,1
    neorv32_uart0_printf("C_sw[%u]: %i %i %i %i\n", (unsigned)i,
     d8c:	758000ef          	jal	14e4 <neorv32_uart_printf>
  for (int i=0;i<4;i++) {
     d90:	010a8a93          	add	s5,s5,16
     d94:	fd2b1ce3          	bne	s6,s2,d6c <main+0xb20>
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (C_hw[i][j] != C_sw[i][j]) mism++;
     d98:	03412783          	lw	a5,52(sp)
     d9c:	06412703          	lw	a4,100(sp)
     da0:	05c12683          	lw	a3,92(sp)
     da4:	40e78633          	sub	a2,a5,a4
     da8:	06012703          	lw	a4,96(sp)
     dac:	03012783          	lw	a5,48(sp)
     db0:	00c03633          	snez	a2,a2
     db4:	40e787b3          	sub	a5,a5,a4
     db8:	02c12703          	lw	a4,44(sp)
     dbc:	00f037b3          	snez	a5,a5
     dc0:	00f60633          	add	a2,a2,a5
     dc4:	40d70733          	sub	a4,a4,a3
     dc8:	02812783          	lw	a5,40(sp)
     dcc:	05812683          	lw	a3,88(sp)
     dd0:	00e03733          	snez	a4,a4
     dd4:	00e60633          	add	a2,a2,a4
     dd8:	40d787b3          	sub	a5,a5,a3
     ddc:	05012703          	lw	a4,80(sp)
     de0:	06812683          	lw	a3,104(sp)
     de4:	00f037b3          	snez	a5,a5
     de8:	00f60633          	add	a2,a2,a5
     dec:	40d70733          	sub	a4,a4,a3
     df0:	04c12783          	lw	a5,76(sp)
     df4:	06c12683          	lw	a3,108(sp)
     df8:	00e03733          	snez	a4,a4
     dfc:	00e60633          	add	a2,a2,a4
     e00:	40d787b3          	sub	a5,a5,a3
     e04:	04412703          	lw	a4,68(sp)
     e08:	07012683          	lw	a3,112(sp)
     e0c:	00f037b3          	snez	a5,a5
     e10:	00f60633          	add	a2,a2,a5
     e14:	40d70733          	sub	a4,a4,a3
     e18:	04012783          	lw	a5,64(sp)
     e1c:	07412683          	lw	a3,116(sp)
     e20:	00e03733          	snez	a4,a4
     e24:	00e60633          	add	a2,a2,a4
     e28:	40d787b3          	sub	a5,a5,a3
     e2c:	03c12703          	lw	a4,60(sp)
     e30:	07812683          	lw	a3,120(sp)
     e34:	00f037b3          	snez	a5,a5
     e38:	00f60633          	add	a2,a2,a5
     e3c:	40d70733          	sub	a4,a4,a3
     e40:	03812783          	lw	a5,56(sp)
     e44:	07c12683          	lw	a3,124(sp)
     e48:	00e03733          	snez	a4,a4
     e4c:	00e60633          	add	a2,a2,a4
     e50:	40d787b3          	sub	a5,a5,a3
     e54:	00f037b3          	snez	a5,a5
     e58:	02412703          	lw	a4,36(sp)
     e5c:	08012683          	lw	a3,128(sp)
     e60:	00f60633          	add	a2,a2,a5
     e64:	08412783          	lw	a5,132(sp)
     e68:	40d70733          	sub	a4,a4,a3
     e6c:	00e03733          	snez	a4,a4
     e70:	40fc87b3          	sub	a5,s9,a5
     e74:	00f037b3          	snez	a5,a5
     e78:	00e60633          	add	a2,a2,a4
     e7c:	00f60633          	add	a2,a2,a5
     e80:	04812783          	lw	a5,72(sp)
     e84:	09a78663          	beq	a5,s10,f10 <main+0xcc4>
     e88:	08812783          	lw	a5,136(sp)
     e8c:	00160613          	add	a2,a2,1
     e90:	00878463          	beq	a5,s0,e98 <main+0xc4c>
     e94:	00160613          	add	a2,a2,1
     e98:	08c12783          	lw	a5,140(sp)
     e9c:	00978463          	beq	a5,s1,ea4 <main+0xc58>
     ea0:	00160613          	add	a2,a2,1
     ea4:	05412783          	lw	a5,84(sp)
     ea8:	01478463          	beq	a5,s4,eb0 <main+0xc64>
     eac:	00160613          	add	a2,a2,1
  else           neorv32_uart0_printf("VERIFY: MISMATCH (%i cells)\n", mism);
     eb0:	000025b7          	lui	a1,0x2
     eb4:	82858593          	add	a1,a1,-2008 # 1828 <__fini_array_end+0xc8>
     eb8:	fff50537          	lui	a0,0xfff50
     ebc:	628000ef          	jal	14e4 <neorv32_uart_printf>

  run_cfs_microbench();

  neorv32_uart0_puts("Done.\n");
     ec0:	000025b7          	lui	a1,0x2
     ec4:	fff50537          	lui	a0,0xfff50
     ec8:	84858593          	add	a1,a1,-1976 # 1848 <__fini_array_end+0xe8>
     ecc:	248000ef          	jal	1114 <neorv32_uart_puts>
  return 0;
}
     ed0:	18c12083          	lw	ra,396(sp)
     ed4:	18812403          	lw	s0,392(sp)
     ed8:	18412483          	lw	s1,388(sp)
     edc:	18012903          	lw	s2,384(sp)
     ee0:	17c12983          	lw	s3,380(sp)
     ee4:	17812a03          	lw	s4,376(sp)
     ee8:	17412a83          	lw	s5,372(sp)
     eec:	17012b03          	lw	s6,368(sp)
     ef0:	16c12b83          	lw	s7,364(sp)
     ef4:	16812c03          	lw	s8,360(sp)
     ef8:	16412c83          	lw	s9,356(sp)
     efc:	16012d03          	lw	s10,352(sp)
     f00:	15c12d83          	lw	s11,348(sp)
     f04:	00000513          	li	a0,0
     f08:	19010113          	add	sp,sp,400
     f0c:	00008067          	ret
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (C_hw[i][j] != C_sw[i][j]) mism++;
     f10:	08812783          	lw	a5,136(sp)
     f14:	f88790e3          	bne	a5,s0,e94 <main+0xc48>
     f18:	08c12783          	lw	a5,140(sp)
     f1c:	f89792e3          	bne	a5,s1,ea0 <main+0xc54>
     f20:	05412783          	lw	a5,84(sp)
     f24:	f94794e3          	bne	a5,s4,eac <main+0xc60>
  if (mism == 0) neorv32_uart0_puts("VERIFY: OK\n");
     f28:	f80614e3          	bnez	a2,eb0 <main+0xc64>
     f2c:	000025b7          	lui	a1,0x2
     f30:	81c58593          	add	a1,a1,-2020 # 181c <__fini_array_end+0xbc>
     f34:	fff50537          	lui	a0,0xfff50
     f38:	1dc000ef          	jal	1114 <neorv32_uart_puts>
     f3c:	f85ff06f          	j	ec0 <main+0xc74>

00000f40 <neorv32_aux_itoa>:
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     f40:	000027b7          	lui	a5,0x2
     f44:	85078793          	add	a5,a5,-1968 # 1850 <__fini_array_end+0xf0>
     f48:	0087a703          	lw	a4,8(a5)
     f4c:	0007a803          	lw	a6,0(a5)
     f50:	0047a683          	lw	a3,4(a5)
     f54:	00c7a783          	lw	a5,12(a5)
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     f58:	fa010113          	add	sp,sp,-96
     f5c:	04812c23          	sw	s0,88(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     f60:	00e12a23          	sw	a4,20(sp)
     f64:	00f12c23          	sw	a5,24(sp)
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     f68:	04112e23          	sw	ra,92(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     f6c:	01012623          	sw	a6,12(sp)
     f70:	00d12823          	sw	a3,16(sp)
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     f74:	00012e23          	sw	zero,28(sp)
     f78:	02012023          	sw	zero,32(sp)
     f7c:	02012223          	sw	zero,36(sp)
     f80:	02012423          	sw	zero,40(sp)
     f84:	02012623          	sw	zero,44(sp)
     f88:	02012823          	sw	zero,48(sp)
     f8c:	02012a23          	sw	zero,52(sp)
     f90:	02012c23          	sw	zero,56(sp)
     f94:	02012e23          	sw	zero,60(sp)
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     f98:	ffe60713          	add	a4,a2,-2
     f9c:	00e00793          	li	a5,14
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     fa0:	00050413          	mv	s0,a0
  if ((base < 2) || (base > 16)) { // invalid base?
     fa4:	08e7ee63          	bltu	a5,a4,1040 <neorv32_aux_itoa+0x100>
     fa8:	04912a23          	sw	s1,84(sp)
     fac:	05212823          	sw	s2,80(sp)
     fb0:	05312623          	sw	s3,76(sp)
     fb4:	05412423          	sw	s4,72(sp)
     fb8:	00060913          	mv	s2,a2
     fbc:	00058493          	mv	s1,a1
     fc0:	03f10993          	add	s3,sp,63
  }

  tmp_ptr = &tmp[sizeof(tmp)-1]; // go to end of array
  do { // generate digit by digit
    tmp_ptr--;
    *tmp_ptr = digits[num%base];
     fc4:	00090593          	mv	a1,s2
     fc8:	00048513          	mv	a0,s1
     fcc:	730000ef          	jal	16fc <__umodsi3>
     fd0:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
     fd4:	00278533          	add	a0,a5,sp
     fd8:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     fdc:	00090593          	mv	a1,s2
     fe0:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     fe4:	fef98fa3          	sb	a5,-1(s3)
     fe8:	00048a13          	mv	s4,s1
    num /= base;
     fec:	6c8000ef          	jal	16b4 <__hidden___udivsi3>
    tmp_ptr--;
     ff0:	fff98993          	add	s3,s3,-1
    num /= base;
     ff4:	00050493          	mv	s1,a0
  } while (num != 0);
     ff8:	fd2a76e3          	bgeu	s4,s2,fc4 <neorv32_aux_itoa+0x84>
     ffc:	01c10793          	add	a5,sp,28
    1000:	04010693          	add	a3,sp,64

  // delete leading zeros
  for (i=0; i<sizeof(tmp); i++) {
    if (tmp[i] != '\0') {
    1004:	0007c703          	lbu	a4,0(a5)
  for (i=0; i<sizeof(tmp); i++) {
    1008:	00178793          	add	a5,a5,1
    if (tmp[i] != '\0') {
    100c:	00070663          	beqz	a4,1018 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
    1010:	00e40023          	sb	a4,0(s0)
      buffer++;
    1014:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
    1018:	fed796e3          	bne	a5,a3,1004 <neorv32_aux_itoa+0xc4>
    }
  }

  // terminate result string
  *buffer = '\0';
    101c:	00040023          	sb	zero,0(s0)
}
    1020:	05c12083          	lw	ra,92(sp)
    1024:	05812403          	lw	s0,88(sp)
  *buffer = '\0';
    1028:	05412483          	lw	s1,84(sp)
    102c:	05012903          	lw	s2,80(sp)
    1030:	04c12983          	lw	s3,76(sp)
    1034:	04812a03          	lw	s4,72(sp)
}
    1038:	06010113          	add	sp,sp,96
    103c:	00008067          	ret
    *buffer = '\0';
    1040:	00050023          	sb	zero,0(a0)
}
    1044:	05c12083          	lw	ra,92(sp)
    1048:	05812403          	lw	s0,88(sp)
    104c:	06010113          	add	sp,sp,96
    1050:	00008067          	ret

00001054 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    1054:	ff010113          	add	sp,sp,-16
    1058:	00812423          	sw	s0,8(sp)
    105c:	00912223          	sw	s1,4(sp)
    1060:	00112623          	sw	ra,12(sp)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
    1064:	fffe07b7          	lui	a5,0xfffe0

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
    1068:	00052023          	sw	zero,0(a0)
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    106c:	00050493          	mv	s1,a0
    1070:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
    1074:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    1078:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
    107c:	638000ef          	jal	16b4 <__hidden___udivsi3>
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
    1080:	3fe00793          	li	a5,1022
    1084:	00000713          	li	a4,0
    1088:	02a7fc63          	bgeu	a5,a0,10c0 <neorv32_uart_setup+0x6c>
    108c:	3fe00693          	li	a3,1022
    1090:	0100006f          	j	10a0 <neorv32_uart_setup+0x4c>
    if ((prsc_sel == 2) || (prsc_sel == 4))
      baud_div >>= 3;
    else
      baud_div >>= 1;
    1094:	00155513          	srl	a0,a0,0x1
    prsc_sel++;
    1098:	00170713          	add	a4,a4,1
  while (baud_div >= 0x3ffU) {
    109c:	00a6fe63          	bgeu	a3,a0,10b8 <neorv32_uart_setup+0x64>
    if ((prsc_sel == 2) || (prsc_sel == 4))
    10a0:	ffe70793          	add	a5,a4,-2
    10a4:	ffd7f793          	and	a5,a5,-3
    10a8:	fe0796e3          	bnez	a5,1094 <neorv32_uart_setup+0x40>
      baud_div >>= 3;
    10ac:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
    10b0:	00170713          	add	a4,a4,1
  while (baud_div >= 0x3ffU) {
    10b4:	fea6e6e3          	bltu	a3,a0,10a0 <neorv32_uart_setup+0x4c>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    10b8:	00371713          	sll	a4,a4,0x3
    10bc:	01877713          	and	a4,a4,24
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    10c0:	fff50793          	add	a5,a0,-1
    10c4:	000106b7          	lui	a3,0x10
    10c8:	fc068693          	add	a3,a3,-64 # ffc0 <__crt0_copy_data_src_begin+0xe600>
    10cc:	00679793          	sll	a5,a5,0x6
    10d0:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    10d4:	07c006b7          	lui	a3,0x7c00
    10d8:	00d47433          	and	s0,s0,a3
    10dc:	0087e7b3          	or	a5,a5,s0
    10e0:	00e7e7b3          	or	a5,a5,a4
    10e4:	0017e793          	or	a5,a5,1
  if (((uint32_t)UARTx) == NEORV32_UART1_BASE) {
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
    10e8:	00f4a023          	sw	a5,0(s1)
}
    10ec:	00c12083          	lw	ra,12(sp)
    10f0:	00812403          	lw	s0,8(sp)
    10f4:	00412483          	lw	s1,4(sp)
    10f8:	01010113          	add	sp,sp,16
    10fc:	00008067          	ret

00001100 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1100:	00052783          	lw	a5,0(a0)
    1104:	00a79713          	sll	a4,a5,0xa
    1108:	fe075ce3          	bgez	a4,1100 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    110c:	00b52223          	sw	a1,4(a0)
}
    1110:	00008067          	ret

00001114 <neorv32_uart_puts>:
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {

  char c = 0;
  while ((c = *s++)) {
    1114:	0005c683          	lbu	a3,0(a1)
    1118:	00158613          	add	a2,a1,1
    111c:	02068663          	beqz	a3,1148 <neorv32_uart_puts+0x34>
    if (c == '\n') {
    1120:	00a00593          	li	a1,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1124:	00d00813          	li	a6,13
    if (c == '\n') {
    1128:	02b68263          	beq	a3,a1,114c <neorv32_uart_puts+0x38>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    112c:	00052783          	lw	a5,0(a0)
    1130:	00a79713          	sll	a4,a5,0xa
    1134:	fe075ce3          	bgez	a4,112c <neorv32_uart_puts+0x18>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1138:	00d52223          	sw	a3,4(a0)
  while ((c = *s++)) {
    113c:	00064683          	lbu	a3,0(a2)
    1140:	00160613          	add	a2,a2,1
    1144:	fe0692e3          	bnez	a3,1128 <neorv32_uart_puts+0x14>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
    1148:	00008067          	ret
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    114c:	00052783          	lw	a5,0(a0)
    1150:	00a79713          	sll	a4,a5,0xa
    1154:	fe075ce3          	bgez	a4,114c <neorv32_uart_puts+0x38>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1158:	01052223          	sw	a6,4(a0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    115c:	fd1ff06f          	j	112c <neorv32_uart_puts+0x18>

00001160 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
    1160:	fa010113          	add	sp,sp,-96
    1164:	04112e23          	sw	ra,92(sp)
  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
  }

  while ((c = *format++)) {
    1168:	0005c703          	lbu	a4,0(a1)
    string_buf[i] = 0;
    116c:	00012623          	sw	zero,12(sp)
    1170:	00012823          	sw	zero,16(sp)
    1174:	00012a23          	sw	zero,20(sp)
    1178:	00012c23          	sw	zero,24(sp)
    117c:	00012e23          	sw	zero,28(sp)
    1180:	02012023          	sw	zero,32(sp)
    1184:	02012223          	sw	zero,36(sp)
    1188:	02012423          	sw	zero,40(sp)
    118c:	02012623          	sw	zero,44(sp)
  while ((c = *format++)) {
    1190:	0c070663          	beqz	a4,125c <neorv32_uart_vprintf+0xfc>
    1194:	05212823          	sw	s2,80(sp)
    1198:	05312623          	sw	s3,76(sp)
    119c:	00002937          	lui	s2,0x2
    11a0:	000029b7          	lui	s3,0x2
    11a4:	04812c23          	sw	s0,88(sp)
    11a8:	04912a23          	sw	s1,84(sp)
    11ac:	05412423          	sw	s4,72(sp)
    11b0:	05512223          	sw	s5,68(sp)
    11b4:	00060813          	mv	a6,a2
    11b8:	05612023          	sw	s6,64(sp)
    11bc:	03712e23          	sw	s7,60(sp)
    11c0:	00050413          	mv	s0,a0
    11c4:	00158613          	add	a2,a1,1
    11c8:	02500493          	li	s1,37
    11cc:	00a00a93          	li	s5,10
    11d0:	8bd90913          	add	s2,s2,-1859 # 18bd <_ctype_+0x1>
    11d4:	00100a13          	li	s4,1
    11d8:	86498993          	add	s3,s3,-1948 # 1864 <__fini_array_end+0x104>
    if (c == '%') {
    11dc:	2a971c63          	bne	a4,s1,1494 <neorv32_uart_vprintf+0x334>
      c = tolower(*format++);
    11e0:	0015c783          	lbu	a5,1(a1)
    11e4:	00258b13          	add	s6,a1,2
    11e8:	01278733          	add	a4,a5,s2
    11ec:	00074703          	lbu	a4,0(a4)
    11f0:	00377713          	and	a4,a4,3
    11f4:	09470c63          	beq	a4,s4,128c <neorv32_uart_vprintf+0x12c>
      switch (c) {
    11f8:	02978063          	beq	a5,s1,1218 <neorv32_uart_vprintf+0xb8>
    11fc:	f9d78713          	add	a4,a5,-99
    1200:	01500693          	li	a3,21
    1204:	06e6e263          	bltu	a3,a4,1268 <neorv32_uart_vprintf+0x108>
    1208:	00271713          	sll	a4,a4,0x2
    120c:	01370733          	add	a4,a4,s3
    1210:	00072703          	lw	a4,0(a4)
    1214:	00070067          	jr	a4
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1218:	00042783          	lw	a5,0(s0)
    121c:	00a79713          	sll	a4,a5,0xa
    1220:	fe075ce3          	bgez	a4,1218 <neorv32_uart_vprintf+0xb8>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1224:	02500793          	li	a5,37
    1228:	00f42223          	sw	a5,4(s0)
      c = tolower(*format++);
    122c:	000b0593          	mv	a1,s6
  while ((c = *format++)) {
    1230:	0005c703          	lbu	a4,0(a1)
    1234:	00158613          	add	a2,a1,1
    1238:	fa0712e3          	bnez	a4,11dc <neorv32_uart_vprintf+0x7c>
    123c:	05812403          	lw	s0,88(sp)
    1240:	05412483          	lw	s1,84(sp)
    1244:	05012903          	lw	s2,80(sp)
    1248:	04c12983          	lw	s3,76(sp)
    124c:	04812a03          	lw	s4,72(sp)
    1250:	04412a83          	lw	s5,68(sp)
    1254:	04012b03          	lw	s6,64(sp)
    1258:	03c12b83          	lw	s7,60(sp)
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
    125c:	05c12083          	lw	ra,92(sp)
    1260:	06010113          	add	sp,sp,96
    1264:	00008067          	ret
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1268:	00042703          	lw	a4,0(s0)
    126c:	00a71693          	sll	a3,a4,0xa
    1270:	fe06dce3          	bgez	a3,1268 <neorv32_uart_vprintf+0x108>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1274:	02500713          	li	a4,37
    1278:	00e42223          	sw	a4,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    127c:	00042703          	lw	a4,0(s0)
    1280:	00a71693          	sll	a3,a4,0xa
    1284:	fe06dce3          	bgez	a3,127c <neorv32_uart_vprintf+0x11c>
    1288:	fa1ff06f          	j	1228 <neorv32_uart_vprintf+0xc8>
      c = tolower(*format++);
    128c:	02078793          	add	a5,a5,32
    1290:	0ff7f793          	zext.b	a5,a5
    1294:	f65ff06f          	j	11f8 <neorv32_uart_vprintf+0x98>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    1298:	00082583          	lw	a1,0(a6)
    129c:	01000613          	li	a2,16
    12a0:	00c10513          	add	a0,sp,12
    12a4:	00480b93          	add	s7,a6,4
    12a8:	c99ff0ef          	jal	f40 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
    12ac:	00c10513          	add	a0,sp,12
    12b0:	34c000ef          	jal	15fc <strlen>
          while (i--) { // add leading zeros
    12b4:	00700693          	li	a3,7
    12b8:	00800793          	li	a5,8
    12bc:	40a686b3          	sub	a3,a3,a0
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    12c0:	03000593          	li	a1,48
          while (i--) { // add leading zeros
    12c4:	fff00613          	li	a2,-1
    12c8:	00f50e63          	beq	a0,a5,12e4 <neorv32_uart_vprintf+0x184>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    12cc:	00042783          	lw	a5,0(s0)
    12d0:	00a79713          	sll	a4,a5,0xa
    12d4:	fe075ce3          	bgez	a4,12cc <neorv32_uart_vprintf+0x16c>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    12d8:	00b42223          	sw	a1,4(s0)
          while (i--) { // add leading zeros
    12dc:	fff68693          	add	a3,a3,-1 # 7bfffff <__neorv32_ram_size+0x7b7ffff>
    12e0:	fec696e3          	bne	a3,a2,12cc <neorv32_uart_vprintf+0x16c>
  while ((c = *s++)) {
    12e4:	00c14683          	lbu	a3,12(sp)
    12e8:	00d10613          	add	a2,sp,13
    if (c == '\n') {
    12ec:	00a00593          	li	a1,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    12f0:	00d00513          	li	a0,13
  while ((c = *s++)) {
    12f4:	02068263          	beqz	a3,1318 <neorv32_uart_vprintf+0x1b8>
    if (c == '\n') {
    12f8:	02b68663          	beq	a3,a1,1324 <neorv32_uart_vprintf+0x1c4>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    12fc:	00042783          	lw	a5,0(s0)
    1300:	00a79713          	sll	a4,a5,0xa
    1304:	fe075ce3          	bgez	a4,12fc <neorv32_uart_vprintf+0x19c>
  while ((c = *s++)) {
    1308:	00160613          	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    130c:	00d42223          	sw	a3,4(s0)
  while ((c = *s++)) {
    1310:	fff64683          	lbu	a3,-1(a2)
    1314:	fe0692e3          	bnez	a3,12f8 <neorv32_uart_vprintf+0x198>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    1318:	000b8813          	mv	a6,s7
      c = tolower(*format++);
    131c:	000b0593          	mv	a1,s6
    1320:	f11ff06f          	j	1230 <neorv32_uart_vprintf+0xd0>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1324:	00042783          	lw	a5,0(s0)
    1328:	00a79713          	sll	a4,a5,0xa
    132c:	fe075ce3          	bgez	a4,1324 <neorv32_uart_vprintf+0x1c4>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1330:	00a42223          	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1334:	fc9ff06f          	j	12fc <neorv32_uart_vprintf+0x19c>
          n = (int32_t)va_arg(args, int32_t);
    1338:	00082583          	lw	a1,0(a6)
    133c:	00480b93          	add	s7,a6,4
          if (n < 0) {
    1340:	1805c463          	bltz	a1,14c8 <neorv32_uart_vprintf+0x368>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
    1344:	00a00613          	li	a2,10
    1348:	00c10513          	add	a0,sp,12
    134c:	bf5ff0ef          	jal	f40 <neorv32_aux_itoa>
  while ((c = *s++)) {
    1350:	00c14683          	lbu	a3,12(sp)
          n = (int32_t)va_arg(args, int32_t);
    1354:	000b8813          	mv	a6,s7
      c = tolower(*format++);
    1358:	000b0593          	mv	a1,s6
  while ((c = *s++)) {
    135c:	ec068ae3          	beqz	a3,1230 <neorv32_uart_vprintf+0xd0>
    if (c == '\n') {
    1360:	00a00593          	li	a1,10
  while ((c = *s++)) {
    1364:	00d10613          	add	a2,sp,13
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1368:	00d00513          	li	a0,13
    if (c == '\n') {
    136c:	02b68263          	beq	a3,a1,1390 <neorv32_uart_vprintf+0x230>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1370:	00042783          	lw	a5,0(s0)
    1374:	00a79713          	sll	a4,a5,0xa
    1378:	fe075ce3          	bgez	a4,1370 <neorv32_uart_vprintf+0x210>
  while ((c = *s++)) {
    137c:	00160613          	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1380:	00d42223          	sw	a3,4(s0)
  while ((c = *s++)) {
    1384:	fff64683          	lbu	a3,-1(a2)
    1388:	f80688e3          	beqz	a3,1318 <neorv32_uart_vprintf+0x1b8>
    if (c == '\n') {
    138c:	feb692e3          	bne	a3,a1,1370 <neorv32_uart_vprintf+0x210>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1390:	00042783          	lw	a5,0(s0)
    1394:	00a79713          	sll	a4,a5,0xa
    1398:	fe075ce3          	bgez	a4,1390 <neorv32_uart_vprintf+0x230>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    139c:	00a42223          	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    13a0:	fd1ff06f          	j	1370 <neorv32_uart_vprintf+0x210>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
    13a4:	00082683          	lw	a3,0(a6)
    13a8:	00480813          	add	a6,a6,4
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    13ac:	00042783          	lw	a5,0(s0)
    13b0:	00a79713          	sll	a4,a5,0xa
    13b4:	fe075ce3          	bgez	a4,13ac <neorv32_uart_vprintf+0x24c>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    13b8:	0ff6f793          	zext.b	a5,a3
    13bc:	00f42223          	sw	a5,4(s0)
      c = tolower(*format++);
    13c0:	000b0593          	mv	a1,s6
}
    13c4:	e6dff06f          	j	1230 <neorv32_uart_vprintf+0xd0>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    13c8:	00082583          	lw	a1,0(a6)
    13cc:	00a00613          	li	a2,10
    13d0:	00c10513          	add	a0,sp,12
    13d4:	00480b93          	add	s7,a6,4
    13d8:	b69ff0ef          	jal	f40 <neorv32_aux_itoa>
  while ((c = *s++)) {
    13dc:	00c14683          	lbu	a3,12(sp)
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    13e0:	000b8813          	mv	a6,s7
      c = tolower(*format++);
    13e4:	000b0593          	mv	a1,s6
  while ((c = *s++)) {
    13e8:	e40684e3          	beqz	a3,1230 <neorv32_uart_vprintf+0xd0>
    if (c == '\n') {
    13ec:	00a00593          	li	a1,10
  while ((c = *s++)) {
    13f0:	00d10613          	add	a2,sp,13
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    13f4:	00d00513          	li	a0,13
    if (c == '\n') {
    13f8:	02b68263          	beq	a3,a1,141c <neorv32_uart_vprintf+0x2bc>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    13fc:	00042783          	lw	a5,0(s0)
    1400:	00a79713          	sll	a4,a5,0xa
    1404:	fe075ce3          	bgez	a4,13fc <neorv32_uart_vprintf+0x29c>
  while ((c = *s++)) {
    1408:	00160613          	add	a2,a2,1
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    140c:	00d42223          	sw	a3,4(s0)
  while ((c = *s++)) {
    1410:	fff64683          	lbu	a3,-1(a2)
    1414:	f00682e3          	beqz	a3,1318 <neorv32_uart_vprintf+0x1b8>
    if (c == '\n') {
    1418:	feb692e3          	bne	a3,a1,13fc <neorv32_uart_vprintf+0x29c>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    141c:	00042783          	lw	a5,0(s0)
    1420:	00a79713          	sll	a4,a5,0xa
    1424:	fe075ce3          	bgez	a4,141c <neorv32_uart_vprintf+0x2bc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1428:	00a42223          	sw	a0,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    142c:	fd1ff06f          	j	13fc <neorv32_uart_vprintf+0x29c>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1430:	00082503          	lw	a0,0(a6)
    1434:	00480893          	add	a7,a6,4
    1438:	00088813          	mv	a6,a7
  while ((c = *s++)) {
    143c:	00054683          	lbu	a3,0(a0)
      c = tolower(*format++);
    1440:	000b0593          	mv	a1,s6
  while ((c = *s++)) {
    1444:	00150513          	add	a0,a0,1
    1448:	de0684e3          	beqz	a3,1230 <neorv32_uart_vprintf+0xd0>
    if (c == '\n') {
    144c:	00a00613          	li	a2,10
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1450:	00d00593          	li	a1,13
    if (c == '\n') {
    1454:	02c68663          	beq	a3,a2,1480 <neorv32_uart_vprintf+0x320>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1458:	00042783          	lw	a5,0(s0)
    145c:	00a79713          	sll	a4,a5,0xa
    1460:	fe075ce3          	bgez	a4,1458 <neorv32_uart_vprintf+0x2f8>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1464:	00d42223          	sw	a3,4(s0)
  while ((c = *s++)) {
    1468:	00054683          	lbu	a3,0(a0)
    146c:	00150513          	add	a0,a0,1
    1470:	fe0692e3          	bnez	a3,1454 <neorv32_uart_vprintf+0x2f4>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1474:	00088813          	mv	a6,a7
      c = tolower(*format++);
    1478:	000b0593          	mv	a1,s6
    147c:	db5ff06f          	j	1230 <neorv32_uart_vprintf+0xd0>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1480:	00042783          	lw	a5,0(s0)
    1484:	00a79713          	sll	a4,a5,0xa
    1488:	fe075ce3          	bgez	a4,1480 <neorv32_uart_vprintf+0x320>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    148c:	00b42223          	sw	a1,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1490:	fc9ff06f          	j	1458 <neorv32_uart_vprintf+0x2f8>
      if (c == '\n') {
    1494:	01570e63          	beq	a4,s5,14b0 <neorv32_uart_vprintf+0x350>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1498:	00042783          	lw	a5,0(s0)
    149c:	00a79693          	sll	a3,a5,0xa
    14a0:	fe06dce3          	bgez	a3,1498 <neorv32_uart_vprintf+0x338>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    14a4:	00e42223          	sw	a4,4(s0)
  while ((c = *format++)) {
    14a8:	00060593          	mv	a1,a2
}
    14ac:	d85ff06f          	j	1230 <neorv32_uart_vprintf+0xd0>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    14b0:	00042783          	lw	a5,0(s0)
    14b4:	00a79693          	sll	a3,a5,0xa
    14b8:	fe06dce3          	bgez	a3,14b0 <neorv32_uart_vprintf+0x350>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    14bc:	00d00793          	li	a5,13
    14c0:	00f42223          	sw	a5,4(s0)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    14c4:	fd5ff06f          	j	1498 <neorv32_uart_vprintf+0x338>
            n = -n;
    14c8:	40b005b3          	neg	a1,a1
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    14cc:	00042783          	lw	a5,0(s0)
    14d0:	00a79713          	sll	a4,a5,0xa
    14d4:	fe075ce3          	bgez	a4,14cc <neorv32_uart_vprintf+0x36c>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    14d8:	02d00793          	li	a5,45
    14dc:	00f42223          	sw	a5,4(s0)
}
    14e0:	e65ff06f          	j	1344 <neorv32_uart_vprintf+0x1e4>

000014e4 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    14e4:	fc010113          	add	sp,sp,-64

  va_list args;
  va_start(args, format);
    14e8:	02810313          	add	t1,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    14ec:	02c12423          	sw	a2,40(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    14f0:	00030613          	mv	a2,t1
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    14f4:	00112e23          	sw	ra,28(sp)
    14f8:	02d12623          	sw	a3,44(sp)
    14fc:	02e12823          	sw	a4,48(sp)
    1500:	02f12a23          	sw	a5,52(sp)
    1504:	03012c23          	sw	a6,56(sp)
    1508:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
    150c:	00612623          	sw	t1,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    1510:	c51ff0ef          	jal	1160 <neorv32_uart_vprintf>
  va_end(args);
}
    1514:	01c12083          	lw	ra,28(sp)
    1518:	04010113          	add	sp,sp,64
    151c:	00008067          	ret

00001520 <memset>:
    1520:	00f00313          	li	t1,15
    1524:	00050713          	mv	a4,a0
    1528:	02c37e63          	bgeu	t1,a2,1564 <memset+0x44>
    152c:	00f77793          	and	a5,a4,15
    1530:	0a079063          	bnez	a5,15d0 <memset+0xb0>
    1534:	08059263          	bnez	a1,15b8 <memset+0x98>
    1538:	ff067693          	and	a3,a2,-16
    153c:	00f67613          	and	a2,a2,15
    1540:	00e686b3          	add	a3,a3,a4
    1544:	00b72023          	sw	a1,0(a4)
    1548:	00b72223          	sw	a1,4(a4)
    154c:	00b72423          	sw	a1,8(a4)
    1550:	00b72623          	sw	a1,12(a4)
    1554:	01070713          	add	a4,a4,16
    1558:	fed766e3          	bltu	a4,a3,1544 <memset+0x24>
    155c:	00061463          	bnez	a2,1564 <memset+0x44>
    1560:	00008067          	ret
    1564:	40c306b3          	sub	a3,t1,a2
    1568:	00269693          	sll	a3,a3,0x2
    156c:	00000297          	auipc	t0,0x0
    1570:	005686b3          	add	a3,a3,t0
    1574:	00c68067          	jr	12(a3)
    1578:	00b70723          	sb	a1,14(a4)
    157c:	00b706a3          	sb	a1,13(a4)
    1580:	00b70623          	sb	a1,12(a4)
    1584:	00b705a3          	sb	a1,11(a4)
    1588:	00b70523          	sb	a1,10(a4)
    158c:	00b704a3          	sb	a1,9(a4)
    1590:	00b70423          	sb	a1,8(a4)
    1594:	00b703a3          	sb	a1,7(a4)
    1598:	00b70323          	sb	a1,6(a4)
    159c:	00b702a3          	sb	a1,5(a4)
    15a0:	00b70223          	sb	a1,4(a4)
    15a4:	00b701a3          	sb	a1,3(a4)
    15a8:	00b70123          	sb	a1,2(a4)
    15ac:	00b700a3          	sb	a1,1(a4)
    15b0:	00b70023          	sb	a1,0(a4)
    15b4:	00008067          	ret
    15b8:	0ff5f593          	zext.b	a1,a1
    15bc:	00859693          	sll	a3,a1,0x8
    15c0:	00d5e5b3          	or	a1,a1,a3
    15c4:	01059693          	sll	a3,a1,0x10
    15c8:	00d5e5b3          	or	a1,a1,a3
    15cc:	f6dff06f          	j	1538 <memset+0x18>
    15d0:	00279693          	sll	a3,a5,0x2
    15d4:	00000297          	auipc	t0,0x0
    15d8:	005686b3          	add	a3,a3,t0
    15dc:	00008293          	mv	t0,ra
    15e0:	fa0680e7          	jalr	-96(a3)
    15e4:	00028093          	mv	ra,t0
    15e8:	ff078793          	add	a5,a5,-16
    15ec:	40f70733          	sub	a4,a4,a5
    15f0:	00f60633          	add	a2,a2,a5
    15f4:	f6c378e3          	bgeu	t1,a2,1564 <memset+0x44>
    15f8:	f3dff06f          	j	1534 <memset+0x14>

000015fc <strlen>:
    15fc:	00357793          	and	a5,a0,3
    1600:	00050713          	mv	a4,a0
    1604:	04079c63          	bnez	a5,165c <strlen+0x60>
    1608:	7f7f86b7          	lui	a3,0x7f7f8
    160c:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1610:	fff00593          	li	a1,-1
    1614:	00072603          	lw	a2,0(a4)
    1618:	00470713          	add	a4,a4,4
    161c:	00d677b3          	and	a5,a2,a3
    1620:	00d787b3          	add	a5,a5,a3
    1624:	00c7e7b3          	or	a5,a5,a2
    1628:	00d7e7b3          	or	a5,a5,a3
    162c:	feb784e3          	beq	a5,a1,1614 <strlen+0x18>
    1630:	ffc74683          	lbu	a3,-4(a4)
    1634:	40a707b3          	sub	a5,a4,a0
    1638:	04068463          	beqz	a3,1680 <strlen+0x84>
    163c:	ffd74683          	lbu	a3,-3(a4)
    1640:	02068c63          	beqz	a3,1678 <strlen+0x7c>
    1644:	ffe74503          	lbu	a0,-2(a4)
    1648:	00a03533          	snez	a0,a0
    164c:	00f50533          	add	a0,a0,a5
    1650:	ffe50513          	add	a0,a0,-2
    1654:	00008067          	ret
    1658:	fa0688e3          	beqz	a3,1608 <strlen+0xc>
    165c:	00074783          	lbu	a5,0(a4)
    1660:	00170713          	add	a4,a4,1
    1664:	00377693          	and	a3,a4,3
    1668:	fe0798e3          	bnez	a5,1658 <strlen+0x5c>
    166c:	40a70733          	sub	a4,a4,a0
    1670:	fff70513          	add	a0,a4,-1
    1674:	00008067          	ret
    1678:	ffd78513          	add	a0,a5,-3
    167c:	00008067          	ret
    1680:	ffc78513          	add	a0,a5,-4
    1684:	00008067          	ret

00001688 <__mulsi3>:
    1688:	00050613          	mv	a2,a0
    168c:	00000513          	li	a0,0
    1690:	0015f693          	and	a3,a1,1
    1694:	00068463          	beqz	a3,169c <__mulsi3+0x14>
    1698:	00c50533          	add	a0,a0,a2
    169c:	0015d593          	srl	a1,a1,0x1
    16a0:	00161613          	sll	a2,a2,0x1
    16a4:	fe0596e3          	bnez	a1,1690 <__mulsi3+0x8>
    16a8:	00008067          	ret

000016ac <__divsi3>:
    16ac:	06054063          	bltz	a0,170c <__umodsi3+0x10>
    16b0:	0605c663          	bltz	a1,171c <__umodsi3+0x20>

000016b4 <__hidden___udivsi3>:
    16b4:	00058613          	mv	a2,a1
    16b8:	00050593          	mv	a1,a0
    16bc:	fff00513          	li	a0,-1
    16c0:	02060c63          	beqz	a2,16f8 <__hidden___udivsi3+0x44>
    16c4:	00100693          	li	a3,1
    16c8:	00b67a63          	bgeu	a2,a1,16dc <__hidden___udivsi3+0x28>
    16cc:	00c05863          	blez	a2,16dc <__hidden___udivsi3+0x28>
    16d0:	00161613          	sll	a2,a2,0x1
    16d4:	00169693          	sll	a3,a3,0x1
    16d8:	feb66ae3          	bltu	a2,a1,16cc <__hidden___udivsi3+0x18>
    16dc:	00000513          	li	a0,0
    16e0:	00c5e663          	bltu	a1,a2,16ec <__hidden___udivsi3+0x38>
    16e4:	40c585b3          	sub	a1,a1,a2
    16e8:	00d56533          	or	a0,a0,a3
    16ec:	0016d693          	srl	a3,a3,0x1
    16f0:	00165613          	srl	a2,a2,0x1
    16f4:	fe0696e3          	bnez	a3,16e0 <__hidden___udivsi3+0x2c>
    16f8:	00008067          	ret

000016fc <__umodsi3>:
    16fc:	00008293          	mv	t0,ra
    1700:	fb5ff0ef          	jal	16b4 <__hidden___udivsi3>
    1704:	00058513          	mv	a0,a1
    1708:	00028067          	jr	t0 # 15d4 <memset+0xb4>
    170c:	40a00533          	neg	a0,a0
    1710:	00b04863          	bgtz	a1,1720 <__umodsi3+0x24>
    1714:	40b005b3          	neg	a1,a1
    1718:	f9dff06f          	j	16b4 <__hidden___udivsi3>
    171c:	40b005b3          	neg	a1,a1
    1720:	00008293          	mv	t0,ra
    1724:	f91ff0ef          	jal	16b4 <__hidden___udivsi3>
    1728:	40a00533          	neg	a0,a0
    172c:	00028067          	jr	t0

00001730 <__modsi3>:
    1730:	00008293          	mv	t0,ra
    1734:	0005ca63          	bltz	a1,1748 <__modsi3+0x18>
    1738:	00054c63          	bltz	a0,1750 <__modsi3+0x20>
    173c:	f79ff0ef          	jal	16b4 <__hidden___udivsi3>
    1740:	00058513          	mv	a0,a1
    1744:	00028067          	jr	t0
    1748:	40b005b3          	neg	a1,a1
    174c:	fe0558e3          	bgez	a0,173c <__modsi3+0xc>
    1750:	40a00533          	neg	a0,a0
    1754:	f61ff0ef          	jal	16b4 <__hidden___udivsi3>
    1758:	40b00533          	neg	a0,a1
    175c:	00028067          	jr	t0
