
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0x790>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	03c38393          	add	t2,t2,60 # 1070 <__crt0_copy_data_src_begin>
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
 110:	d0040413          	add	s0,s0,-768 # e0c <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	cf848493          	add	s1,s1,-776 # e0c <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	15860613          	add	a2,a2,344 # 288 <main>

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
 178:	c9840413          	add	s0,s0,-872 # e0c <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	c9048493          	add	s1,s1,-880 # e0c <__fini_array_end>

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

// Function to print a 4x4 matrix
void print_matrix(uint8_t matrix[4][4]) {
 1e4:	fe010113          	add	sp,sp,-32
 1e8:	00812c23          	sw	s0,24(sp)
 1ec:	01212823          	sw	s2,16(sp)
 1f0:	01312623          	sw	s3,12(sp)
 1f4:	01412423          	sw	s4,8(sp)
 1f8:	01512223          	sw	s5,4(sp)
 1fc:	01612023          	sw	s6,0(sp)
 200:	00112e23          	sw	ra,28(sp)
 204:	00912a23          	sw	s1,20(sp)
 208:	00050413          	mv	s0,a0
 20c:	01050913          	add	s2,a0,16
  for (int i = 0; i < 4; i++) {
    neorv32_uart0_printf("[");
 210:	00001a37          	lui	s4,0x1
    for (int j = 0; j < 4; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
 214:	00001ab7          	lui	s5,0x1
    for (int j = 0; j < 4; j++) {
 218:	00400b13          	li	s6,4
    }
    neorv32_uart0_printf("]\n");
 21c:	000019b7          	lui	s3,0x1
    neorv32_uart0_printf("[");
 220:	e0ca0593          	add	a1,s4,-500 # e0c <__fini_array_end>
 224:	fff50537          	lui	a0,0xfff50
 228:	7ec000ef          	jal	a14 <neorv32_uart_printf>
    for (int j = 0; j < 4; j++) {
 22c:	00000493          	li	s1,0
      neorv32_uart0_printf("%d ", matrix[i][j]);
 230:	009407b3          	add	a5,s0,s1
 234:	0007c603          	lbu	a2,0(a5)
 238:	e10a8593          	add	a1,s5,-496 # e10 <__fini_array_end+0x4>
 23c:	fff50537          	lui	a0,0xfff50
    for (int j = 0; j < 4; j++) {
 240:	00148493          	add	s1,s1,1
      neorv32_uart0_printf("%d ", matrix[i][j]);
 244:	7d0000ef          	jal	a14 <neorv32_uart_printf>
    for (int j = 0; j < 4; j++) {
 248:	ff6494e3          	bne	s1,s6,230 <print_matrix+0x4c>
    neorv32_uart0_printf("]\n");
 24c:	e1498593          	add	a1,s3,-492 # e14 <__fini_array_end+0x8>
 250:	fff50537          	lui	a0,0xfff50
  for (int i = 0; i < 4; i++) {
 254:	00440413          	add	s0,s0,4
    neorv32_uart0_printf("]\n");
 258:	7bc000ef          	jal	a14 <neorv32_uart_printf>
  for (int i = 0; i < 4; i++) {
 25c:	fd2412e3          	bne	s0,s2,220 <print_matrix+0x3c>
  }
}
 260:	01c12083          	lw	ra,28(sp)
 264:	01812403          	lw	s0,24(sp)
 268:	01412483          	lw	s1,20(sp)
 26c:	01012903          	lw	s2,16(sp)
 270:	00c12983          	lw	s3,12(sp)
 274:	00812a03          	lw	s4,8(sp)
 278:	00412a83          	lw	s5,4(sp)
 27c:	00012b03          	lw	s6,0(sp)
 280:	02010113          	add	sp,sp,32
 284:	00008067          	ret

00000288 <main>:

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 288:	000055b7          	lui	a1,0x5
int main(void) {
 28c:	f7010113          	add	sp,sp,-144
  neorv32_uart0_setup(19200, 0);
 290:	00000613          	li	a2,0
 294:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 298:	fff50537          	lui	a0,0xfff50
int main(void) {
 29c:	08112623          	sw	ra,140(sp)
 2a0:	08812423          	sw	s0,136(sp)
 2a4:	08912223          	sw	s1,132(sp)
 2a8:	09212023          	sw	s2,128(sp)
 2ac:	07312e23          	sw	s3,124(sp)
 2b0:	07412c23          	sw	s4,120(sp)
 2b4:	07512a23          	sw	s5,116(sp)
 2b8:	07612823          	sw	s6,112(sp)
 2bc:	07712623          	sw	s7,108(sp)
 2c0:	07812423          	sw	s8,104(sp)
 2c4:	07912223          	sw	s9,100(sp)
 2c8:	07a12023          	sw	s10,96(sp)
 2cc:	05b12e23          	sw	s11,92(sp)
  neorv32_uart0_setup(19200, 0);
 2d0:	420000ef          	jal	6f0 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 2d4:	fff50537          	lui	a0,0xfff50
 2d8:	3dc000ef          	jal	6b4 <neorv32_uart_available>
 2dc:	00100793          	li	a5,1
 2e0:	2a050863          	beqz	a0,590 <main+0x308>

  neorv32_uart0_printf("\n--- CFU 4x4 Matrix Multiplication ---\n");
 2e4:	000015b7          	lui	a1,0x1
 2e8:	e1858593          	add	a1,a1,-488 # e18 <__fini_array_end+0xc>
 2ec:	fff50537          	lui	a0,0xfff50
 2f0:	724000ef          	jal	a14 <neorv32_uart_printf>

  // Define matrices A and B as 4x4 arrays
  uint8_t A[4][4] = {{1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}};  // Matrix A
 2f4:	00001437          	lui	s0,0x1
 2f8:	f5c40593          	add	a1,s0,-164 # f5c <__fini_array_end+0x150>
 2fc:	01000613          	li	a2,16
 300:	02010513          	add	a0,sp,32
 304:	025000ef          	jal	b28 <memcpy>
  uint8_t B[4][4] = {{1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}};  // Matrix B
 308:	01000613          	li	a2,16
 30c:	f5c40593          	add	a1,s0,-164
 310:	03010513          	add	a0,sp,48
 314:	015000ef          	jal	b28 <memcpy>

  // Print matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
 318:	000015b7          	lui	a1,0x1
 31c:	e4058593          	add	a1,a1,-448 # e40 <__fini_array_end+0x34>
 320:	fff50537          	lui	a0,0xfff50
 324:	6f0000ef          	jal	a14 <neorv32_uart_printf>
  print_matrix(A);
 328:	02010513          	add	a0,sp,32
 32c:	eb9ff0ef          	jal	1e4 <print_matrix>

  neorv32_uart0_printf("Matrix B:\n");
 330:	000015b7          	lui	a1,0x1
 334:	e4c58593          	add	a1,a1,-436 # e4c <__fini_array_end+0x40>
 338:	fff50537          	lui	a0,0xfff50
 33c:	6d8000ef          	jal	a14 <neorv32_uart_printf>
  print_matrix(B);
 340:	03010513          	add	a0,sp,48
 344:	ea1ff0ef          	jal	1e4 <print_matrix>
  uint32_t b_packed_1 = (B[0][1] << 24) | (B[1][1] << 16) | (B[2][1] << 8) | B[3][1];  // Second column of B
  uint32_t b_packed_2 = (B[0][2] << 24) | (B[1][2] << 16) | (B[2][2] << 8) | B[3][2];  // Third column of B
  uint32_t b_packed_3 = (B[0][3] << 24) | (B[1][3] << 16) | (B[2][3] << 8) | B[3][3];  // Fourth column of B

  // Print the packed values for debugging
  neorv32_uart0_printf("Packed A[0]: %x\n", a_packed_0);
 348:	01020637          	lui	a2,0x1020
 34c:	000015b7          	lui	a1,0x1
 350:	30460613          	add	a2,a2,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 354:	e5858593          	add	a1,a1,-424 # e58 <__fini_array_end+0x4c>
 358:	fff50537          	lui	a0,0xfff50
 35c:	6b8000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed A[1]: %x\n", a_packed_1);
 360:	01020637          	lui	a2,0x1020
 364:	000015b7          	lui	a1,0x1
 368:	30460613          	add	a2,a2,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 36c:	e6c58593          	add	a1,a1,-404 # e6c <__fini_array_end+0x60>
 370:	fff50537          	lui	a0,0xfff50
 374:	6a0000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed A[2]: %x\n", a_packed_2);
 378:	01020637          	lui	a2,0x1020
 37c:	000015b7          	lui	a1,0x1
 380:	30460613          	add	a2,a2,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 384:	e8058593          	add	a1,a1,-384 # e80 <__fini_array_end+0x74>
 388:	fff50537          	lui	a0,0xfff50
 38c:	688000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed A[3]: %x\n", a_packed_3);
 390:	01020637          	lui	a2,0x1020
 394:	000015b7          	lui	a1,0x1
 398:	30460613          	add	a2,a2,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 39c:	e9458593          	add	a1,a1,-364 # e94 <__fini_array_end+0x88>
 3a0:	fff50537          	lui	a0,0xfff50
 3a4:	670000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[0]: %x\n", b_packed_0);
 3a8:	01010637          	lui	a2,0x1010
 3ac:	000015b7          	lui	a1,0x1
 3b0:	10160613          	add	a2,a2,257 # 1010101 <__neorv32_ram_size+0xf90101>
 3b4:	ea858593          	add	a1,a1,-344 # ea8 <__fini_array_end+0x9c>
 3b8:	fff50537          	lui	a0,0xfff50
 3bc:	658000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[1]: %x\n", b_packed_1);
 3c0:	02020637          	lui	a2,0x2020
 3c4:	000015b7          	lui	a1,0x1
 3c8:	20260613          	add	a2,a2,514 # 2020202 <__neorv32_ram_size+0x1fa0202>
 3cc:	ebc58593          	add	a1,a1,-324 # ebc <__fini_array_end+0xb0>
 3d0:	fff50537          	lui	a0,0xfff50
 3d4:	640000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[2]: %x\n", b_packed_2);
 3d8:	03030637          	lui	a2,0x3030
 3dc:	000015b7          	lui	a1,0x1
 3e0:	30360613          	add	a2,a2,771 # 3030303 <__neorv32_ram_size+0x2fb0303>
 3e4:	ed058593          	add	a1,a1,-304 # ed0 <__fini_array_end+0xc4>
 3e8:	fff50537          	lui	a0,0xfff50
 3ec:	628000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Packed B[3]: %x\n", b_packed_3);
 3f0:	04040637          	lui	a2,0x4040
 3f4:	000015b7          	lui	a1,0x1
 3f8:	40460613          	add	a2,a2,1028 # 4040404 <__neorv32_ram_size+0x3fc0404>
 3fc:	ee458593          	add	a1,a1,-284 # ee4 <__fini_array_end+0xd8>
 400:	fff50537          	lui	a0,0xfff50
 404:	610000ef          	jal	a14 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 408:	00000793          	li	a5,0
 40c:	c0079073          	csrw	cycle,a5
 410:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 414:	c0202d73          	rdinstret	s10
 418:	c0002cf3          	rdcycle	s9
  asm volatile (
 41c:	010207b7          	lui	a5,0x1020
 420:	01010537          	lui	a0,0x1010
 424:	30478793          	add	a5,a5,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 428:	10150513          	add	a0,a0,257 # 1010101 <__neorv32_ram_size+0xf90101>
 42c:	00a79f0b          	.insn	4, 0x00a79f0b
 430:	020205b7          	lui	a1,0x2020
 434:	01e12e23          	sw	t5,28(sp)
 438:	20258593          	add	a1,a1,514 # 2020202 <__neorv32_ram_size+0x1fa0202>
 43c:	00b79e8b          	.insn	4, 0x00b79e8b
 440:	030306b7          	lui	a3,0x3030
 444:	01d12c23          	sw	t4,24(sp)
 448:	30368693          	add	a3,a3,771 # 3030303 <__neorv32_ram_size+0x2fb0303>
 44c:	00d79e0b          	.insn	4, 0x00d79e0b
 450:	04040737          	lui	a4,0x4040
 454:	01c12a23          	sw	t3,20(sp)
 458:	40470713          	add	a4,a4,1028 # 4040404 <__neorv32_ram_size+0x3fc0404>
 45c:	00e7930b          	.insn	4, 0x00e7930b
 460:	00612823          	sw	t1,16(sp)
 464:	00a7988b          	.insn	4, 0x00a7988b
 468:	01112623          	sw	a7,12(sp)
 46c:	00b7980b          	.insn	4, 0x00b7980b
 470:	01012423          	sw	a6,8(sp)
 474:	00d79d8b          	.insn	4, 0x00d79d8b
 478:	00e79c0b          	.insn	4, 0x00e79c0b
 47c:	00a79b8b          	.insn	4, 0x00a79b8b
 480:	00b79b0b          	.insn	4, 0x00b79b0b
 484:	00d79a8b          	.insn	4, 0x00d79a8b
 488:	00e79a0b          	.insn	4, 0x00e79a0b
 48c:	00a7998b          	.insn	4, 0x00a7998b
 490:	00b7990b          	.insn	4, 0x00b7990b
 494:	00d7948b          	.insn	4, 0x00d7948b
 498:	00e7940b          	.insn	4, 0x00e7940b
 49c:	c0202673          	rdinstret	a2
 4a0:	00c12223          	sw	a2,4(sp)
 4a4:	c0002773          	rdcycle	a4

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");
 4a8:	000015b7          	lui	a1,0x1
 4ac:	ef858593          	add	a1,a1,-264 # ef8 <__fini_array_end+0xec>
 4b0:	fff50537          	lui	a0,0xfff50
 4b4:	00e12023          	sw	a4,0(sp)
 4b8:	55c000ef          	jal	a14 <neorv32_uart_printf>

  uint8_t result_matrix[4][4] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF, (C14 >> 24) & 0xFF },
 4bc:	01c12f03          	lw	t5,28(sp)
 4c0:	01812e83          	lw	t4,24(sp)
 4c4:	01412e03          	lw	t3,20(sp)
 4c8:	01012303          	lw	t1,16(sp)
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF, (C24 >> 24) & 0xFF },
 4cc:	00c12883          	lw	a7,12(sp)
 4d0:	00812803          	lw	a6,8(sp)
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF, (C34 >> 24) & 0xFF },
    { (C41 >> 24) & 0xFF, (C42 >> 24) & 0xFF, (C43 >> 24) & 0xFF, (C44 >> 24) & 0xFF }
 4d4:	0189d513          	srl	a0,s3,0x18
 4d8:	01845793          	srl	a5,s0,0x18
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF, (C14 >> 24) & 0xFF },
 4dc:	018f5f13          	srl	t5,t5,0x18
 4e0:	018ede93          	srl	t4,t4,0x18
 4e4:	018e5e13          	srl	t3,t3,0x18
 4e8:	01835313          	srl	t1,t1,0x18
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF, (C24 >> 24) & 0xFF },
 4ec:	0188d893          	srl	a7,a7,0x18
 4f0:	01885813          	srl	a6,a6,0x18
    { (C41 >> 24) & 0xFF, (C42 >> 24) & 0xFF, (C43 >> 24) & 0xFF, (C44 >> 24) & 0xFF }
 4f4:	0184d693          	srl	a3,s1,0x18
 4f8:	01895593          	srl	a1,s2,0x18
  uint8_t result_matrix[4][4] = {
 4fc:	04a10623          	sb	a0,76(sp)
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF, (C24 >> 24) & 0xFF },
 500:	018ddd93          	srl	s11,s11,0x18
  };

  print_matrix(result_matrix);
 504:	04010513          	add	a0,sp,64
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF, (C24 >> 24) & 0xFF },
 508:	018c5c13          	srl	s8,s8,0x18
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF, (C34 >> 24) & 0xFF },
 50c:	018bdb93          	srl	s7,s7,0x18
 510:	018b5b13          	srl	s6,s6,0x18
 514:	018ada93          	srl	s5,s5,0x18
 518:	018a5a13          	srl	s4,s4,0x18
  uint8_t result_matrix[4][4] = {
 51c:	04f107a3          	sb	a5,79(sp)
 520:	05e10023          	sb	t5,64(sp)
 524:	05d100a3          	sb	t4,65(sp)
 528:	05c10123          	sb	t3,66(sp)
 52c:	046101a3          	sb	t1,67(sp)
 530:	05110223          	sb	a7,68(sp)
 534:	050102a3          	sb	a6,69(sp)
 538:	04d10723          	sb	a3,78(sp)
 53c:	04b106a3          	sb	a1,77(sp)
 540:	05b10323          	sb	s11,70(sp)
 544:	058103a3          	sb	s8,71(sp)
 548:	05710423          	sb	s7,72(sp)
 54c:	056104a3          	sb	s6,73(sp)
 550:	05510523          	sb	s5,74(sp)
 554:	054105a3          	sb	s4,75(sp)
  print_matrix(result_matrix);
 558:	c8dff0ef          	jal	1e4 <print_matrix>

  // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
 55c:	00412603          	lw	a2,4(sp)
 560:	000015b7          	lui	a1,0x1
 564:	f1858593          	add	a1,a1,-232 # f18 <__fini_array_end+0x10c>
 568:	41a60633          	sub	a2,a2,s10
 56c:	fff50537          	lui	a0,0xfff50
 570:	4a4000ef          	jal	a14 <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));
 574:	00012703          	lw	a4,0(sp)
 578:	000015b7          	lui	a1,0x1
 57c:	f3058593          	add	a1,a1,-208 # f30 <__fini_array_end+0x124>
 580:	41970633          	sub	a2,a4,s9
 584:	fff50537          	lui	a0,0xfff50
 588:	48c000ef          	jal	a14 <neorv32_uart_printf>

  return 0;
 58c:	00000793          	li	a5,0
}
 590:	08c12083          	lw	ra,140(sp)
 594:	08812403          	lw	s0,136(sp)
 598:	08412483          	lw	s1,132(sp)
 59c:	08012903          	lw	s2,128(sp)
 5a0:	07c12983          	lw	s3,124(sp)
 5a4:	07812a03          	lw	s4,120(sp)
 5a8:	07412a83          	lw	s5,116(sp)
 5ac:	07012b03          	lw	s6,112(sp)
 5b0:	06c12b83          	lw	s7,108(sp)
 5b4:	06812c03          	lw	s8,104(sp)
 5b8:	06412c83          	lw	s9,100(sp)
 5bc:	06012d03          	lw	s10,96(sp)
 5c0:	05c12d83          	lw	s11,92(sp)
 5c4:	00078513          	mv	a0,a5
 5c8:	09010113          	add	sp,sp,144
 5cc:	00008067          	ret

000005d0 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 5d0:	fa010113          	add	sp,sp,-96
 5d4:	04912a23          	sw	s1,84(sp)
 5d8:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 5dc:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 5e0:	04812c23          	sw	s0,88(sp)
 5e4:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 5e8:	f4858593          	add	a1,a1,-184 # f48 <__fini_array_end+0x13c>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 5ec:	00060913          	mv	s2,a2
 5f0:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 5f4:	01000613          	li	a2,16
 5f8:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 5fc:	04112e23          	sw	ra,92(sp)
 600:	05312623          	sw	s3,76(sp)
 604:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 608:	520000ef          	jal	b28 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 60c:	02400613          	li	a2,36
 610:	00000593          	li	a1,0
 614:	01c10513          	add	a0,sp,28
 618:	434000ef          	jal	a4c <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 61c:	ffe90713          	add	a4,s2,-2
 620:	00e00793          	li	a5,14
 624:	03f10993          	add	s3,sp,63
 628:	02e7f463          	bgeu	a5,a4,650 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 62c:	00040023          	sb	zero,0(s0)
}
 630:	05c12083          	lw	ra,92(sp)
 634:	05812403          	lw	s0,88(sp)
 638:	05412483          	lw	s1,84(sp)
 63c:	05012903          	lw	s2,80(sp)
 640:	04c12983          	lw	s3,76(sp)
 644:	04812a03          	lw	s4,72(sp)
 648:	06010113          	add	sp,sp,96
 64c:	00008067          	ret
    *tmp_ptr = digits[num%base];
 650:	00090593          	mv	a1,s2
 654:	00048513          	mv	a0,s1
 658:	750000ef          	jal	da8 <__umodsi3>
 65c:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 660:	00278533          	add	a0,a5,sp
 664:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 668:	00090593          	mv	a1,s2
 66c:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 670:	fef98fa3          	sb	a5,-1(s3)
 674:	00048a13          	mv	s4,s1
    num /= base;
 678:	6e8000ef          	jal	d60 <__hidden___udivsi3>
    tmp_ptr--;
 67c:	fff98993          	add	s3,s3,-1
    num /= base;
 680:	00050493          	mv	s1,a0
  } while (num != 0);
 684:	fd2a76e3          	bgeu	s4,s2,650 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 688:	00000793          	li	a5,0
 68c:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 690:	01c10713          	add	a4,sp,28
 694:	00f70733          	add	a4,a4,a5
 698:	00074703          	lbu	a4,0(a4)
 69c:	00070663          	beqz	a4,6a8 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 6a0:	00e40023          	sb	a4,0(s0)
      buffer++;
 6a4:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 6a8:	00178793          	add	a5,a5,1
 6ac:	fed792e3          	bne	a5,a3,690 <neorv32_aux_itoa+0xc0>
 6b0:	f7dff06f          	j	62c <neorv32_aux_itoa+0x5c>

000006b4 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 6b4:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 6b8:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 6bc:	00e51c63          	bne	a0,a4,6d4 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 6c0:	fffe07b7          	lui	a5,0xfffe0
 6c4:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 6c8:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 6cc:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 6d0:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 6d4:	fff60737          	lui	a4,0xfff60
    return 0;
 6d8:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 6dc:	fee79ae3          	bne	a5,a4,6d0 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 6e0:	fffe07b7          	lui	a5,0xfffe0
 6e4:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 6e8:	020007b7          	lui	a5,0x2000
 6ec:	fe1ff06f          	j	6cc <neorv32_uart_available+0x18>

000006f0 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 6f0:	ff010113          	add	sp,sp,-16
 6f4:	00812423          	sw	s0,8(sp)
 6f8:	00912223          	sw	s1,4(sp)
 6fc:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 700:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 704:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 708:	00050493          	mv	s1,a0
 70c:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 710:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 714:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 718:	648000ef          	jal	d60 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 71c:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 720:	3fe00693          	li	a3,1022
 724:	04a6e663          	bltu	a3,a0,770 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 728:	fff50793          	add	a5,a0,-1
 72c:	000106b7          	lui	a3,0x10
 730:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 734:	00679793          	sll	a5,a5,0x6
 738:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 73c:	07c006b7          	lui	a3,0x7c00
 740:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 744:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 748:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 74c:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 750:	00c12083          	lw	ra,12(sp)
 754:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 758:	00e7e7b3          	or	a5,a5,a4
 75c:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 760:	00f4a023          	sw	a5,0(s1)
}
 764:	00412483          	lw	s1,4(sp)
 768:	01010113          	add	sp,sp,16
 76c:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 770:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 774:	ffd7f793          	and	a5,a5,-3
 778:	00079863          	bnez	a5,788 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 77c:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 780:	00170713          	add	a4,a4,1
 784:	fa1ff06f          	j	724 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 788:	00155513          	srl	a0,a0,0x1
 78c:	ff5ff06f          	j	780 <neorv32_uart_setup+0x90>

00000790 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 790:	00052783          	lw	a5,0(a0)
 794:	00a79713          	sll	a4,a5,0xa
 798:	fe075ce3          	bgez	a4,790 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 79c:	00b52223          	sw	a1,4(a0)
}
 7a0:	00008067          	ret

000007a4 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 7a4:	fe010113          	add	sp,sp,-32
 7a8:	00812c23          	sw	s0,24(sp)
 7ac:	00912a23          	sw	s1,20(sp)
 7b0:	01312623          	sw	s3,12(sp)
 7b4:	00112e23          	sw	ra,28(sp)
 7b8:	01212823          	sw	s2,16(sp)
 7bc:	00050493          	mv	s1,a0
 7c0:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 7c4:	00a00993          	li	s3,10
  while ((c = *s++)) {
 7c8:	00044903          	lbu	s2,0(s0)
 7cc:	00140413          	add	s0,s0,1
 7d0:	02091063          	bnez	s2,7f0 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 7d4:	01c12083          	lw	ra,28(sp)
 7d8:	01812403          	lw	s0,24(sp)
 7dc:	01412483          	lw	s1,20(sp)
 7e0:	01012903          	lw	s2,16(sp)
 7e4:	00c12983          	lw	s3,12(sp)
 7e8:	02010113          	add	sp,sp,32
 7ec:	00008067          	ret
    if (c == '\n') {
 7f0:	01391863          	bne	s2,s3,800 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 7f4:	00d00593          	li	a1,13
 7f8:	00048513          	mv	a0,s1
 7fc:	f95ff0ef          	jal	790 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 800:	00090593          	mv	a1,s2
 804:	00048513          	mv	a0,s1
 808:	f89ff0ef          	jal	790 <neorv32_uart_putc>
 80c:	fbdff06f          	j	7c8 <neorv32_uart_puts+0x24>

00000810 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 810:	f9010113          	add	sp,sp,-112
 814:	06812423          	sw	s0,104(sp)
 818:	06912223          	sw	s1,100(sp)
 81c:	07212023          	sw	s2,96(sp)
 820:	05312e23          	sw	s3,92(sp)
 824:	00050493          	mv	s1,a0
 828:	00058913          	mv	s2,a1
 82c:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 830:	00000593          	li	a1,0
 834:	02400613          	li	a2,36
 838:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 83c:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 840:	05412c23          	sw	s4,88(sp)
 844:	05512a23          	sw	s5,84(sp)
 848:	05712623          	sw	s7,76(sp)
 84c:	05812423          	sw	s8,72(sp)
 850:	05912223          	sw	s9,68(sp)
 854:	05a12023          	sw	s10,64(sp)
 858:	06112623          	sw	ra,108(sp)
 85c:	05612823          	sw	s6,80(sp)
 860:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 864:	02500b93          	li	s7,37
    string_buf[i] = 0;
 868:	1e4000ef          	jal	a4c <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 86c:	00a00c13          	li	s8,10
      c = tolower(*format++);
 870:	f6d98993          	add	s3,s3,-147 # f6d <_ctype_+0x1>
 874:	00100c93          	li	s9,1
      switch (c) {
 878:	07000a13          	li	s4,112
 87c:	07500d13          	li	s10,117
 880:	06300a93          	li	s5,99
  while ((c = *format++)) {
 884:	00094d83          	lbu	s11,0(s2)
 888:	040d9063          	bnez	s11,8c8 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 88c:	06c12083          	lw	ra,108(sp)
 890:	06812403          	lw	s0,104(sp)
 894:	06412483          	lw	s1,100(sp)
 898:	06012903          	lw	s2,96(sp)
 89c:	05c12983          	lw	s3,92(sp)
 8a0:	05812a03          	lw	s4,88(sp)
 8a4:	05412a83          	lw	s5,84(sp)
 8a8:	05012b03          	lw	s6,80(sp)
 8ac:	04c12b83          	lw	s7,76(sp)
 8b0:	04812c03          	lw	s8,72(sp)
 8b4:	04412c83          	lw	s9,68(sp)
 8b8:	04012d03          	lw	s10,64(sp)
 8bc:	03c12d83          	lw	s11,60(sp)
 8c0:	07010113          	add	sp,sp,112
 8c4:	00008067          	ret
    if (c == '%') {
 8c8:	137d9863          	bne	s11,s7,9f8 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 8cc:	00290b13          	add	s6,s2,2
 8d0:	00194903          	lbu	s2,1(s2)
 8d4:	013907b3          	add	a5,s2,s3
 8d8:	0007c783          	lbu	a5,0(a5)
 8dc:	0037f793          	and	a5,a5,3
 8e0:	01979463          	bne	a5,s9,8e8 <neorv32_uart_vprintf+0xd8>
 8e4:	02090913          	add	s2,s2,32
      switch (c) {
 8e8:	0ff97793          	zext.b	a5,s2
 8ec:	0d478863          	beq	a5,s4,9bc <neorv32_uart_vprintf+0x1ac>
 8f0:	06fa4c63          	blt	s4,a5,968 <neorv32_uart_vprintf+0x158>
 8f4:	09578e63          	beq	a5,s5,990 <neorv32_uart_vprintf+0x180>
 8f8:	02fac663          	blt	s5,a5,924 <neorv32_uart_vprintf+0x114>
 8fc:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 900:	02500593          	li	a1,37
      switch (c) {
 904:	00e78a63          	beq	a5,a4,918 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 908:	02500593          	li	a1,37
 90c:	00048513          	mv	a0,s1
 910:	e81ff0ef          	jal	790 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 914:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 918:	00048513          	mv	a0,s1
 91c:	e75ff0ef          	jal	790 <neorv32_uart_putc>
 920:	0840006f          	j	9a4 <neorv32_uart_vprintf+0x194>
      switch (c) {
 924:	06400713          	li	a4,100
 928:	00e78663          	beq	a5,a4,934 <neorv32_uart_vprintf+0x124>
 92c:	06900713          	li	a4,105
 930:	fce79ce3          	bne	a5,a4,908 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 934:	00440913          	add	s2,s0,4
 938:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 93c:	00045a63          	bgez	s0,950 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 940:	02d00593          	li	a1,45
 944:	00048513          	mv	a0,s1
            n = -n;
 948:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 94c:	e45ff0ef          	jal	790 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 950:	00a00613          	li	a2,10
 954:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 958:	00c10513          	add	a0,sp,12
 95c:	c75ff0ef          	jal	5d0 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 960:	00c10593          	add	a1,sp,12
 964:	0200006f          	j	984 <neorv32_uart_vprintf+0x174>
      switch (c) {
 968:	05a78263          	beq	a5,s10,9ac <neorv32_uart_vprintf+0x19c>
 96c:	07800713          	li	a4,120
 970:	04e78663          	beq	a5,a4,9bc <neorv32_uart_vprintf+0x1ac>
 974:	07300713          	li	a4,115
 978:	f8e798e3          	bne	a5,a4,908 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 97c:	00042583          	lw	a1,0(s0)
 980:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 984:	00048513          	mv	a0,s1
 988:	e1dff0ef          	jal	7a4 <neorv32_uart_puts>
          break;
 98c:	0140006f          	j	9a0 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 990:	00044583          	lbu	a1,0(s0)
 994:	00048513          	mv	a0,s1
 998:	00440913          	add	s2,s0,4
 99c:	df5ff0ef          	jal	790 <neorv32_uart_putc>
 9a0:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 9a4:	000b0913          	mv	s2,s6
 9a8:	eddff06f          	j	884 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 9ac:	00042583          	lw	a1,0(s0)
 9b0:	00440913          	add	s2,s0,4
 9b4:	00a00613          	li	a2,10
 9b8:	fa1ff06f          	j	958 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 9bc:	00042583          	lw	a1,0(s0)
 9c0:	01000613          	li	a2,16
 9c4:	00c10513          	add	a0,sp,12
 9c8:	c09ff0ef          	jal	5d0 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 9cc:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 9d0:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 9d4:	2f8000ef          	jal	ccc <strlen>
 9d8:	00800413          	li	s0,8
 9dc:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 9e0:	f80400e3          	beqz	s0,960 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 9e4:	03000593          	li	a1,48
 9e8:	00048513          	mv	a0,s1
 9ec:	da5ff0ef          	jal	790 <neorv32_uart_putc>
 9f0:	fff40413          	add	s0,s0,-1
 9f4:	fedff06f          	j	9e0 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 9f8:	018d9863          	bne	s11,s8,a08 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 9fc:	00d00593          	li	a1,13
 a00:	00048513          	mv	a0,s1
 a04:	d8dff0ef          	jal	790 <neorv32_uart_putc>
  while ((c = *format++)) {
 a08:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 a0c:	000d8593          	mv	a1,s11
 a10:	f09ff06f          	j	918 <neorv32_uart_vprintf+0x108>

00000a14 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 a14:	fc010113          	add	sp,sp,-64
 a18:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 a1c:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 a20:	00112e23          	sw	ra,28(sp)
 a24:	02d12623          	sw	a3,44(sp)
 a28:	02e12823          	sw	a4,48(sp)
 a2c:	02f12a23          	sw	a5,52(sp)
 a30:	03012c23          	sw	a6,56(sp)
 a34:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 a38:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 a3c:	dd5ff0ef          	jal	810 <neorv32_uart_vprintf>
  va_end(args);
}
 a40:	01c12083          	lw	ra,28(sp)
 a44:	04010113          	add	sp,sp,64
 a48:	00008067          	ret

00000a4c <memset>:
 a4c:	00f00313          	li	t1,15
 a50:	00050713          	mv	a4,a0
 a54:	02c37e63          	bgeu	t1,a2,a90 <memset+0x44>
 a58:	00f77793          	and	a5,a4,15
 a5c:	0a079063          	bnez	a5,afc <memset+0xb0>
 a60:	08059263          	bnez	a1,ae4 <memset+0x98>
 a64:	ff067693          	and	a3,a2,-16
 a68:	00f67613          	and	a2,a2,15
 a6c:	00e686b3          	add	a3,a3,a4
 a70:	00b72023          	sw	a1,0(a4)
 a74:	00b72223          	sw	a1,4(a4)
 a78:	00b72423          	sw	a1,8(a4)
 a7c:	00b72623          	sw	a1,12(a4)
 a80:	01070713          	add	a4,a4,16
 a84:	fed766e3          	bltu	a4,a3,a70 <memset+0x24>
 a88:	00061463          	bnez	a2,a90 <memset+0x44>
 a8c:	00008067          	ret
 a90:	40c306b3          	sub	a3,t1,a2
 a94:	00269693          	sll	a3,a3,0x2
 a98:	00000297          	auipc	t0,0x0
 a9c:	005686b3          	add	a3,a3,t0
 aa0:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 aa4:	00b70723          	sb	a1,14(a4)
 aa8:	00b706a3          	sb	a1,13(a4)
 aac:	00b70623          	sb	a1,12(a4)
 ab0:	00b705a3          	sb	a1,11(a4)
 ab4:	00b70523          	sb	a1,10(a4)
 ab8:	00b704a3          	sb	a1,9(a4)
 abc:	00b70423          	sb	a1,8(a4)
 ac0:	00b703a3          	sb	a1,7(a4)
 ac4:	00b70323          	sb	a1,6(a4)
 ac8:	00b702a3          	sb	a1,5(a4)
 acc:	00b70223          	sb	a1,4(a4)
 ad0:	00b701a3          	sb	a1,3(a4)
 ad4:	00b70123          	sb	a1,2(a4)
 ad8:	00b700a3          	sb	a1,1(a4)
 adc:	00b70023          	sb	a1,0(a4)
 ae0:	00008067          	ret
 ae4:	0ff5f593          	zext.b	a1,a1
 ae8:	00859693          	sll	a3,a1,0x8
 aec:	00d5e5b3          	or	a1,a1,a3
 af0:	01059693          	sll	a3,a1,0x10
 af4:	00d5e5b3          	or	a1,a1,a3
 af8:	f6dff06f          	j	a64 <memset+0x18>
 afc:	00279693          	sll	a3,a5,0x2
 b00:	00000297          	auipc	t0,0x0
 b04:	005686b3          	add	a3,a3,t0
 b08:	00008293          	mv	t0,ra
 b0c:	fa0680e7          	jalr	-96(a3)
 b10:	00028093          	mv	ra,t0
 b14:	ff078793          	add	a5,a5,-16
 b18:	40f70733          	sub	a4,a4,a5
 b1c:	00f60633          	add	a2,a2,a5
 b20:	f6c378e3          	bgeu	t1,a2,a90 <memset+0x44>
 b24:	f3dff06f          	j	a60 <memset+0x14>

00000b28 <memcpy>:
 b28:	00a5c7b3          	xor	a5,a1,a0
 b2c:	0037f793          	and	a5,a5,3
 b30:	00c508b3          	add	a7,a0,a2
 b34:	06079463          	bnez	a5,b9c <memcpy+0x74>
 b38:	00300793          	li	a5,3
 b3c:	06c7f063          	bgeu	a5,a2,b9c <memcpy+0x74>
 b40:	00357793          	and	a5,a0,3
 b44:	00050713          	mv	a4,a0
 b48:	06079a63          	bnez	a5,bbc <memcpy+0x94>
 b4c:	ffc8f613          	and	a2,a7,-4
 b50:	40e606b3          	sub	a3,a2,a4
 b54:	02000793          	li	a5,32
 b58:	08d7ce63          	blt	a5,a3,bf4 <memcpy+0xcc>
 b5c:	00058693          	mv	a3,a1
 b60:	00070793          	mv	a5,a4
 b64:	02c77863          	bgeu	a4,a2,b94 <memcpy+0x6c>
 b68:	0006a803          	lw	a6,0(a3)
 b6c:	00478793          	add	a5,a5,4
 b70:	00468693          	add	a3,a3,4
 b74:	ff07ae23          	sw	a6,-4(a5)
 b78:	fec7e8e3          	bltu	a5,a2,b68 <memcpy+0x40>
 b7c:	fff60793          	add	a5,a2,-1
 b80:	40e787b3          	sub	a5,a5,a4
 b84:	ffc7f793          	and	a5,a5,-4
 b88:	00478793          	add	a5,a5,4
 b8c:	00f70733          	add	a4,a4,a5
 b90:	00f585b3          	add	a1,a1,a5
 b94:	01176863          	bltu	a4,a7,ba4 <memcpy+0x7c>
 b98:	00008067          	ret
 b9c:	00050713          	mv	a4,a0
 ba0:	05157863          	bgeu	a0,a7,bf0 <memcpy+0xc8>
 ba4:	0005c783          	lbu	a5,0(a1)
 ba8:	00170713          	add	a4,a4,1
 bac:	00158593          	add	a1,a1,1
 bb0:	fef70fa3          	sb	a5,-1(a4)
 bb4:	fee898e3          	bne	a7,a4,ba4 <memcpy+0x7c>
 bb8:	00008067          	ret
 bbc:	0005c683          	lbu	a3,0(a1)
 bc0:	00170713          	add	a4,a4,1
 bc4:	00377793          	and	a5,a4,3
 bc8:	fed70fa3          	sb	a3,-1(a4)
 bcc:	00158593          	add	a1,a1,1
 bd0:	f6078ee3          	beqz	a5,b4c <memcpy+0x24>
 bd4:	0005c683          	lbu	a3,0(a1)
 bd8:	00170713          	add	a4,a4,1
 bdc:	00377793          	and	a5,a4,3
 be0:	fed70fa3          	sb	a3,-1(a4)
 be4:	00158593          	add	a1,a1,1
 be8:	fc079ae3          	bnez	a5,bbc <memcpy+0x94>
 bec:	f61ff06f          	j	b4c <memcpy+0x24>
 bf0:	00008067          	ret
 bf4:	ff010113          	add	sp,sp,-16
 bf8:	00812623          	sw	s0,12(sp)
 bfc:	02000413          	li	s0,32
 c00:	0005a383          	lw	t2,0(a1)
 c04:	0045a283          	lw	t0,4(a1)
 c08:	0085af83          	lw	t6,8(a1)
 c0c:	00c5af03          	lw	t5,12(a1)
 c10:	0105ae83          	lw	t4,16(a1)
 c14:	0145ae03          	lw	t3,20(a1)
 c18:	0185a303          	lw	t1,24(a1)
 c1c:	01c5a803          	lw	a6,28(a1)
 c20:	0205a683          	lw	a3,32(a1)
 c24:	02470713          	add	a4,a4,36
 c28:	40e607b3          	sub	a5,a2,a4
 c2c:	fc772e23          	sw	t2,-36(a4)
 c30:	fe572023          	sw	t0,-32(a4)
 c34:	fff72223          	sw	t6,-28(a4)
 c38:	ffe72423          	sw	t5,-24(a4)
 c3c:	ffd72623          	sw	t4,-20(a4)
 c40:	ffc72823          	sw	t3,-16(a4)
 c44:	fe672a23          	sw	t1,-12(a4)
 c48:	ff072c23          	sw	a6,-8(a4)
 c4c:	fed72e23          	sw	a3,-4(a4)
 c50:	02458593          	add	a1,a1,36
 c54:	faf446e3          	blt	s0,a5,c00 <memcpy+0xd8>
 c58:	00058693          	mv	a3,a1
 c5c:	00070793          	mv	a5,a4
 c60:	02c77863          	bgeu	a4,a2,c90 <memcpy+0x168>
 c64:	0006a803          	lw	a6,0(a3)
 c68:	00478793          	add	a5,a5,4
 c6c:	00468693          	add	a3,a3,4
 c70:	ff07ae23          	sw	a6,-4(a5)
 c74:	fec7e8e3          	bltu	a5,a2,c64 <memcpy+0x13c>
 c78:	fff60793          	add	a5,a2,-1
 c7c:	40e787b3          	sub	a5,a5,a4
 c80:	ffc7f793          	and	a5,a5,-4
 c84:	00478793          	add	a5,a5,4
 c88:	00f70733          	add	a4,a4,a5
 c8c:	00f585b3          	add	a1,a1,a5
 c90:	01176863          	bltu	a4,a7,ca0 <memcpy+0x178>
 c94:	00c12403          	lw	s0,12(sp)
 c98:	01010113          	add	sp,sp,16
 c9c:	00008067          	ret
 ca0:	0005c783          	lbu	a5,0(a1)
 ca4:	00170713          	add	a4,a4,1
 ca8:	00158593          	add	a1,a1,1
 cac:	fef70fa3          	sb	a5,-1(a4)
 cb0:	fee882e3          	beq	a7,a4,c94 <memcpy+0x16c>
 cb4:	0005c783          	lbu	a5,0(a1)
 cb8:	00170713          	add	a4,a4,1
 cbc:	00158593          	add	a1,a1,1
 cc0:	fef70fa3          	sb	a5,-1(a4)
 cc4:	fce89ee3          	bne	a7,a4,ca0 <memcpy+0x178>
 cc8:	fcdff06f          	j	c94 <memcpy+0x16c>

00000ccc <strlen>:
 ccc:	00357793          	and	a5,a0,3
 cd0:	00050713          	mv	a4,a0
 cd4:	04079c63          	bnez	a5,d2c <strlen+0x60>
 cd8:	7f7f86b7          	lui	a3,0x7f7f8
 cdc:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 ce0:	fff00593          	li	a1,-1
 ce4:	00072603          	lw	a2,0(a4)
 ce8:	00470713          	add	a4,a4,4
 cec:	00d677b3          	and	a5,a2,a3
 cf0:	00d787b3          	add	a5,a5,a3
 cf4:	00c7e7b3          	or	a5,a5,a2
 cf8:	00d7e7b3          	or	a5,a5,a3
 cfc:	feb784e3          	beq	a5,a1,ce4 <strlen+0x18>
 d00:	ffc74683          	lbu	a3,-4(a4)
 d04:	40a707b3          	sub	a5,a4,a0
 d08:	04068463          	beqz	a3,d50 <strlen+0x84>
 d0c:	ffd74683          	lbu	a3,-3(a4)
 d10:	02068c63          	beqz	a3,d48 <strlen+0x7c>
 d14:	ffe74503          	lbu	a0,-2(a4)
 d18:	00a03533          	snez	a0,a0
 d1c:	00f50533          	add	a0,a0,a5
 d20:	ffe50513          	add	a0,a0,-2
 d24:	00008067          	ret
 d28:	fa0688e3          	beqz	a3,cd8 <strlen+0xc>
 d2c:	00074783          	lbu	a5,0(a4)
 d30:	00170713          	add	a4,a4,1
 d34:	00377693          	and	a3,a4,3
 d38:	fe0798e3          	bnez	a5,d28 <strlen+0x5c>
 d3c:	40a70733          	sub	a4,a4,a0
 d40:	fff70513          	add	a0,a4,-1
 d44:	00008067          	ret
 d48:	ffd78513          	add	a0,a5,-3
 d4c:	00008067          	ret
 d50:	ffc78513          	add	a0,a5,-4
 d54:	00008067          	ret

00000d58 <__divsi3>:
 d58:	06054063          	bltz	a0,db8 <__umodsi3+0x10>
 d5c:	0605c663          	bltz	a1,dc8 <__umodsi3+0x20>

00000d60 <__hidden___udivsi3>:
 d60:	00058613          	mv	a2,a1
 d64:	00050593          	mv	a1,a0
 d68:	fff00513          	li	a0,-1
 d6c:	02060c63          	beqz	a2,da4 <__hidden___udivsi3+0x44>
 d70:	00100693          	li	a3,1
 d74:	00b67a63          	bgeu	a2,a1,d88 <__hidden___udivsi3+0x28>
 d78:	00c05863          	blez	a2,d88 <__hidden___udivsi3+0x28>
 d7c:	00161613          	sll	a2,a2,0x1
 d80:	00169693          	sll	a3,a3,0x1
 d84:	feb66ae3          	bltu	a2,a1,d78 <__hidden___udivsi3+0x18>
 d88:	00000513          	li	a0,0
 d8c:	00c5e663          	bltu	a1,a2,d98 <__hidden___udivsi3+0x38>
 d90:	40c585b3          	sub	a1,a1,a2
 d94:	00d56533          	or	a0,a0,a3
 d98:	0016d693          	srl	a3,a3,0x1
 d9c:	00165613          	srl	a2,a2,0x1
 da0:	fe0696e3          	bnez	a3,d8c <__hidden___udivsi3+0x2c>
 da4:	00008067          	ret

00000da8 <__umodsi3>:
 da8:	00008293          	mv	t0,ra
 dac:	fb5ff0ef          	jal	d60 <__hidden___udivsi3>
 db0:	00058513          	mv	a0,a1
 db4:	00028067          	jr	t0 # b00 <memset+0xb4>
 db8:	40a00533          	neg	a0,a0
 dbc:	00b04863          	bgtz	a1,dcc <__umodsi3+0x24>
 dc0:	40b005b3          	neg	a1,a1
 dc4:	f9dff06f          	j	d60 <__hidden___udivsi3>
 dc8:	40b005b3          	neg	a1,a1
 dcc:	00008293          	mv	t0,ra
 dd0:	f91ff0ef          	jal	d60 <__hidden___udivsi3>
 dd4:	40a00533          	neg	a0,a0
 dd8:	00028067          	jr	t0

00000ddc <__modsi3>:
 ddc:	00008293          	mv	t0,ra
 de0:	0005ca63          	bltz	a1,df4 <__modsi3+0x18>
 de4:	00054c63          	bltz	a0,dfc <__modsi3+0x20>
 de8:	f79ff0ef          	jal	d60 <__hidden___udivsi3>
 dec:	00058513          	mv	a0,a1
 df0:	00028067          	jr	t0
 df4:	40b005b3          	neg	a1,a1
 df8:	fe0558e3          	bgez	a0,de8 <__modsi3+0xc>
 dfc:	40a00533          	neg	a0,a0
 e00:	f61ff0ef          	jal	d60 <__hidden___udivsi3>
 e04:	40b00533          	neg	a0,a1
 e08:	00028067          	jr	t0
