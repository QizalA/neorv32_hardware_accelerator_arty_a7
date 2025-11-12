
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
  1c:	80028293          	add	t0,t0,-2048 # 1800 <__crt0_copy_data_src_begin+0xab8>
  20:	30029073          	csrw	mstatus,t0
  24:	00000317          	auipc	t1,0x0
  28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
  2c:	30531073          	csrw	mtvec,t1
  30:	30401073          	csrw	mie,zero
  34:	00001397          	auipc	t2,0x1
  38:	d1438393          	add	t2,t2,-748 # d48 <__crt0_copy_data_src_begin>
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
 110:	a9440413          	add	s0,s0,-1388 # ba0 <__fini_array_end>
 114:	00001497          	auipc	s1,0x1
 118:	a8c48493          	add	s1,s1,-1396 # ba0 <__fini_array_end>

0000011c <__crt0_constructors>:
 11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
 120:	00042083          	lw	ra,0(s0)
 124:	000080e7          	jalr	ra
 128:	00440413          	add	s0,s0,4
 12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
 130:	00000617          	auipc	a2,0x0
 134:	10c60613          	add	a2,a2,268 # 23c <main>

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
 178:	a2c40413          	add	s0,s0,-1492 # ba0 <__fini_array_end>
 17c:	00001497          	auipc	s1,0x1
 180:	a2448493          	add	s1,s1,-1500 # ba0 <__fini_array_end>

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

// Unpack and print a 2x2 matrix from a packed 32-bit value
void print_matrix(uint32_t packed) {
 1e4:	ff010113          	add	sp,sp,-16
 1e8:	00912223          	sw	s1,4(sp)
  uint8_t m11 = (packed >> 24) & 0xFF;
  uint8_t m12 = (packed >> 16) & 0xFF;
 1ec:	01055693          	srl	a3,a0,0x10
  uint8_t m21 = (packed >> 8)  & 0xFF;
  uint8_t m22 = (packed >> 0)  & 0xFF;

  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 1f0:	000014b7          	lui	s1,0x1
void print_matrix(uint32_t packed) {
 1f4:	00812423          	sw	s0,8(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 1f8:	01855613          	srl	a2,a0,0x18
void print_matrix(uint32_t packed) {
 1fc:	00050413          	mv	s0,a0
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 200:	ba048593          	add	a1,s1,-1120 # ba0 <__fini_array_end>
 204:	0ff6f693          	zext.b	a3,a3
 208:	fff50537          	lui	a0,0xfff50
void print_matrix(uint32_t packed) {
 20c:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m11, m12);
 210:	598000ef          	jal	7a8 <neorv32_uart_printf>
  uint8_t m21 = (packed >> 8)  & 0xFF;
 214:	00845613          	srl	a2,s0,0x8
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 218:	0ff47693          	zext.b	a3,s0
}
 21c:	00812403          	lw	s0,8(sp)
 220:	00c12083          	lw	ra,12(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 224:	ba048593          	add	a1,s1,-1120
}
 228:	00412483          	lw	s1,4(sp)
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 22c:	0ff67613          	zext.b	a2,a2
 230:	fff50537          	lui	a0,0xfff50
}
 234:	01010113          	add	sp,sp,16
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
 238:	5700006f          	j	7a8 <neorv32_uart_printf>

0000023c <main>:

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
 23c:	000055b7          	lui	a1,0x5
int main(void) {
 240:	fe010113          	add	sp,sp,-32
  neorv32_uart0_setup(19200, 0);
 244:	00000613          	li	a2,0
 248:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
 24c:	fff50537          	lui	a0,0xfff50
int main(void) {
 250:	00112e23          	sw	ra,28(sp)
 254:	00812c23          	sw	s0,24(sp)
 258:	00912a23          	sw	s1,20(sp)
 25c:	01212823          	sw	s2,16(sp)
 260:	01312623          	sw	s3,12(sp)
 264:	01412423          	sw	s4,8(sp)
 268:	01512223          	sw	s5,4(sp)
 26c:	01612023          	sw	s6,0(sp)
  neorv32_uart0_setup(19200, 0);
 270:	214000ef          	jal	484 <neorv32_uart_setup>
  if (!neorv32_uart0_available()) return 1;
 274:	fff50537          	lui	a0,0xfff50
 278:	1d0000ef          	jal	448 <neorv32_uart_available>
 27c:	00100793          	li	a5,1
 280:	0a050c63          	beqz	a0,338 <main+0xfc>

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication ---\n");
 284:	000015b7          	lui	a1,0x1
 288:	bac58593          	add	a1,a1,-1108 # bac <__fini_array_end+0xc>
 28c:	fff50537          	lui	a0,0xfff50
 290:	518000ef          	jal	7a8 <neorv32_uart_printf>
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
 294:	00000793          	li	a5,0
 298:	c0079073          	csrw	cycle,a5
 29c:	c0279073          	csrw	instret,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
 2a0:	c0202a73          	rdinstret	s4
 2a4:	c0002973          	rdcycle	s2
  asm volatile (
 2a8:	010204b7          	lui	s1,0x1020
 2ac:	05060437          	lui	s0,0x5060
 2b0:	30448493          	add	s1,s1,772 # 1020304 <__neorv32_ram_size+0xfa0304>
 2b4:	70840413          	add	s0,s0,1800 # 5060708 <__neorv32_ram_size+0x4fe0708>
 2b8:	00849b0b          	.insn	4, 0x00849b0b
 2bc:	c0202af3          	rdinstret	s5
 2c0:	c00029f3          	rdcycle	s3

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(a_packed);
 2c4:	000015b7          	lui	a1,0x1
 2c8:	bd458593          	add	a1,a1,-1068 # bd4 <__fini_array_end+0x34>
 2cc:	fff50537          	lui	a0,0xfff50
 2d0:	4d8000ef          	jal	7a8 <neorv32_uart_printf>
 2d4:	00048513          	mv	a0,s1
 2d8:	f0dff0ef          	jal	1e4 <print_matrix>
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(b_packed);
 2dc:	000015b7          	lui	a1,0x1
 2e0:	be458593          	add	a1,a1,-1052 # be4 <__fini_array_end+0x44>
 2e4:	fff50537          	lui	a0,0xfff50
 2e8:	4c0000ef          	jal	7a8 <neorv32_uart_printf>
 2ec:	00040513          	mv	a0,s0
 2f0:	ef5ff0ef          	jal	1e4 <print_matrix>
  neorv32_uart0_printf("Product A*B:\n"); print_matrix(result);
 2f4:	000015b7          	lui	a1,0x1
 2f8:	bf058593          	add	a1,a1,-1040 # bf0 <__fini_array_end+0x50>
 2fc:	fff50537          	lui	a0,0xfff50
 300:	4a8000ef          	jal	7a8 <neorv32_uart_printf>
 304:	000b0513          	mv	a0,s6
 308:	eddff0ef          	jal	1e4 <print_matrix>

  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
 30c:	000015b7          	lui	a1,0x1
 310:	414a8633          	sub	a2,s5,s4
 314:	c0058593          	add	a1,a1,-1024 # c00 <__fini_array_end+0x60>
 318:	fff50537          	lui	a0,0xfff50
 31c:	48c000ef          	jal	7a8 <neorv32_uart_printf>
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));
 320:	000015b7          	lui	a1,0x1
 324:	41298633          	sub	a2,s3,s2
 328:	c1858593          	add	a1,a1,-1000 # c18 <__fini_array_end+0x78>
 32c:	fff50537          	lui	a0,0xfff50
 330:	478000ef          	jal	7a8 <neorv32_uart_printf>

  return 0;
 334:	00000793          	li	a5,0
}
 338:	01c12083          	lw	ra,28(sp)
 33c:	01812403          	lw	s0,24(sp)
 340:	01412483          	lw	s1,20(sp)
 344:	01012903          	lw	s2,16(sp)
 348:	00c12983          	lw	s3,12(sp)
 34c:	00812a03          	lw	s4,8(sp)
 350:	00412a83          	lw	s5,4(sp)
 354:	00012b03          	lw	s6,0(sp)
 358:	00078513          	mv	a0,a5
 35c:	02010113          	add	sp,sp,32
 360:	00008067          	ret

00000364 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 364:	fa010113          	add	sp,sp,-96
 368:	04912a23          	sw	s1,84(sp)
 36c:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 370:	000015b7          	lui	a1,0x1
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 374:	04812c23          	sw	s0,88(sp)
 378:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 37c:	c3058593          	add	a1,a1,-976 # c30 <__fini_array_end+0x90>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 380:	00060913          	mv	s2,a2
 384:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 388:	01000613          	li	a2,16
 38c:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
 390:	04112e23          	sw	ra,92(sp)
 394:	05312623          	sw	s3,76(sp)
 398:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
 39c:	520000ef          	jal	8bc <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
 3a0:	02400613          	li	a2,36
 3a4:	00000593          	li	a1,0
 3a8:	01c10513          	add	a0,sp,28
 3ac:	434000ef          	jal	7e0 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
 3b0:	ffe90713          	add	a4,s2,-2
 3b4:	00e00793          	li	a5,14
 3b8:	03f10993          	add	s3,sp,63
 3bc:	02e7f463          	bgeu	a5,a4,3e4 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
 3c0:	00040023          	sb	zero,0(s0)
}
 3c4:	05c12083          	lw	ra,92(sp)
 3c8:	05812403          	lw	s0,88(sp)
 3cc:	05412483          	lw	s1,84(sp)
 3d0:	05012903          	lw	s2,80(sp)
 3d4:	04c12983          	lw	s3,76(sp)
 3d8:	04812a03          	lw	s4,72(sp)
 3dc:	06010113          	add	sp,sp,96
 3e0:	00008067          	ret
    *tmp_ptr = digits[num%base];
 3e4:	00090593          	mv	a1,s2
 3e8:	00048513          	mv	a0,s1
 3ec:	750000ef          	jal	b3c <__umodsi3>
 3f0:	04050793          	add	a5,a0,64 # fff50040 <__crt0_ram_last+0x7fed0041>
 3f4:	00278533          	add	a0,a5,sp
 3f8:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
 3fc:	00090593          	mv	a1,s2
 400:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
 404:	fef98fa3          	sb	a5,-1(s3)
 408:	00048a13          	mv	s4,s1
    num /= base;
 40c:	6e8000ef          	jal	af4 <__hidden___udivsi3>
    tmp_ptr--;
 410:	fff98993          	add	s3,s3,-1
    num /= base;
 414:	00050493          	mv	s1,a0
  } while (num != 0);
 418:	fd2a76e3          	bgeu	s4,s2,3e4 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
 41c:	00000793          	li	a5,0
 420:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
 424:	01c10713          	add	a4,sp,28
 428:	00f70733          	add	a4,a4,a5
 42c:	00074703          	lbu	a4,0(a4)
 430:	00070663          	beqz	a4,43c <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
 434:	00e40023          	sb	a4,0(s0)
      buffer++;
 438:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
 43c:	00178793          	add	a5,a5,1
 440:	fed792e3          	bne	a5,a3,424 <neorv32_aux_itoa+0xc0>
 444:	f7dff06f          	j	3c0 <neorv32_aux_itoa+0x5c>

00000448 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
 448:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
 44c:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
 450:	00e51c63          	bne	a0,a4,468 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
 454:	fffe07b7          	lui	a5,0xfffe0
 458:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 45c:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 460:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
 464:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
 468:	fff60737          	lui	a4,0xfff60
    return 0;
 46c:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
 470:	fee79ae3          	bne	a5,a4,464 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
 474:	fffe07b7          	lui	a5,0xfffe0
 478:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
 47c:	020007b7          	lui	a5,0x2000
 480:	fe1ff06f          	j	460 <neorv32_uart_available+0x18>

00000484 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 484:	ff010113          	add	sp,sp,-16
 488:	00812423          	sw	s0,8(sp)
 48c:	00912223          	sw	s1,4(sp)
 490:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
 494:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
 498:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 49c:	00050493          	mv	s1,a0
 4a0:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
 4a4:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
 4a8:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
 4ac:	648000ef          	jal	af4 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
 4b0:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
 4b4:	3fe00693          	li	a3,1022
 4b8:	04a6e663          	bltu	a3,a0,504 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
 4bc:	fff50793          	add	a5,a0,-1
 4c0:	000106b7          	lui	a3,0x10
 4c4:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
 4c8:	00679793          	sll	a5,a5,0x6
 4cc:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4d0:	07c006b7          	lui	a3,0x7c00
 4d4:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4d8:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4dc:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
 4e0:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
 4e4:	00c12083          	lw	ra,12(sp)
 4e8:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
 4ec:	00e7e7b3          	or	a5,a5,a4
 4f0:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
 4f4:	00f4a023          	sw	a5,0(s1)
}
 4f8:	00412483          	lw	s1,4(sp)
 4fc:	01010113          	add	sp,sp,16
 500:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
 504:	ffe70793          	add	a5,a4,-2 # fff5fffe <__crt0_ram_last+0x7fedffff>
 508:	ffd7f793          	and	a5,a5,-3
 50c:	00079863          	bnez	a5,51c <neorv32_uart_setup+0x98>
      baud_div >>= 3;
 510:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
 514:	00170713          	add	a4,a4,1
 518:	fa1ff06f          	j	4b8 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
 51c:	00155513          	srl	a0,a0,0x1
 520:	ff5ff06f          	j	514 <neorv32_uart_setup+0x90>

00000524 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
 524:	00052783          	lw	a5,0(a0)
 528:	00a79713          	sll	a4,a5,0xa
 52c:	fe075ce3          	bgez	a4,524 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
 530:	00b52223          	sw	a1,4(a0)
}
 534:	00008067          	ret

00000538 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
 538:	fe010113          	add	sp,sp,-32
 53c:	00812c23          	sw	s0,24(sp)
 540:	00912a23          	sw	s1,20(sp)
 544:	01312623          	sw	s3,12(sp)
 548:	00112e23          	sw	ra,28(sp)
 54c:	01212823          	sw	s2,16(sp)
 550:	00050493          	mv	s1,a0
 554:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
 558:	00a00993          	li	s3,10
  while ((c = *s++)) {
 55c:	00044903          	lbu	s2,0(s0)
 560:	00140413          	add	s0,s0,1
 564:	02091063          	bnez	s2,584 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
 568:	01c12083          	lw	ra,28(sp)
 56c:	01812403          	lw	s0,24(sp)
 570:	01412483          	lw	s1,20(sp)
 574:	01012903          	lw	s2,16(sp)
 578:	00c12983          	lw	s3,12(sp)
 57c:	02010113          	add	sp,sp,32
 580:	00008067          	ret
    if (c == '\n') {
 584:	01391863          	bne	s2,s3,594 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
 588:	00d00593          	li	a1,13
 58c:	00048513          	mv	a0,s1
 590:	f95ff0ef          	jal	524 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
 594:	00090593          	mv	a1,s2
 598:	00048513          	mv	a0,s1
 59c:	f89ff0ef          	jal	524 <neorv32_uart_putc>
 5a0:	fbdff06f          	j	55c <neorv32_uart_puts+0x24>

000005a4 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 5a4:	f9010113          	add	sp,sp,-112
 5a8:	06812423          	sw	s0,104(sp)
 5ac:	06912223          	sw	s1,100(sp)
 5b0:	07212023          	sw	s2,96(sp)
 5b4:	05312e23          	sw	s3,92(sp)
 5b8:	00050493          	mv	s1,a0
 5bc:	00058913          	mv	s2,a1
 5c0:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
 5c4:	00000593          	li	a1,0
 5c8:	02400613          	li	a2,36
 5cc:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
 5d0:	000019b7          	lui	s3,0x1
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
 5d4:	05412c23          	sw	s4,88(sp)
 5d8:	05512a23          	sw	s5,84(sp)
 5dc:	05712623          	sw	s7,76(sp)
 5e0:	05812423          	sw	s8,72(sp)
 5e4:	05912223          	sw	s9,68(sp)
 5e8:	05a12023          	sw	s10,64(sp)
 5ec:	06112623          	sw	ra,108(sp)
 5f0:	05612823          	sw	s6,80(sp)
 5f4:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
 5f8:	02500b93          	li	s7,37
    string_buf[i] = 0;
 5fc:	1e4000ef          	jal	7e0 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
 600:	00a00c13          	li	s8,10
      c = tolower(*format++);
 604:	c4598993          	add	s3,s3,-955 # c45 <_ctype_+0x1>
 608:	00100c93          	li	s9,1
      switch (c) {
 60c:	07000a13          	li	s4,112
 610:	07500d13          	li	s10,117
 614:	06300a93          	li	s5,99
  while ((c = *format++)) {
 618:	00094d83          	lbu	s11,0(s2)
 61c:	040d9063          	bnez	s11,65c <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
 620:	06c12083          	lw	ra,108(sp)
 624:	06812403          	lw	s0,104(sp)
 628:	06412483          	lw	s1,100(sp)
 62c:	06012903          	lw	s2,96(sp)
 630:	05c12983          	lw	s3,92(sp)
 634:	05812a03          	lw	s4,88(sp)
 638:	05412a83          	lw	s5,84(sp)
 63c:	05012b03          	lw	s6,80(sp)
 640:	04c12b83          	lw	s7,76(sp)
 644:	04812c03          	lw	s8,72(sp)
 648:	04412c83          	lw	s9,68(sp)
 64c:	04012d03          	lw	s10,64(sp)
 650:	03c12d83          	lw	s11,60(sp)
 654:	07010113          	add	sp,sp,112
 658:	00008067          	ret
    if (c == '%') {
 65c:	137d9863          	bne	s11,s7,78c <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
 660:	00290b13          	add	s6,s2,2
 664:	00194903          	lbu	s2,1(s2)
 668:	013907b3          	add	a5,s2,s3
 66c:	0007c783          	lbu	a5,0(a5)
 670:	0037f793          	and	a5,a5,3
 674:	01979463          	bne	a5,s9,67c <neorv32_uart_vprintf+0xd8>
 678:	02090913          	add	s2,s2,32
      switch (c) {
 67c:	0ff97793          	zext.b	a5,s2
 680:	0d478863          	beq	a5,s4,750 <neorv32_uart_vprintf+0x1ac>
 684:	06fa4c63          	blt	s4,a5,6fc <neorv32_uart_vprintf+0x158>
 688:	09578e63          	beq	a5,s5,724 <neorv32_uart_vprintf+0x180>
 68c:	02fac663          	blt	s5,a5,6b8 <neorv32_uart_vprintf+0x114>
 690:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
 694:	02500593          	li	a1,37
      switch (c) {
 698:	00e78a63          	beq	a5,a4,6ac <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
 69c:	02500593          	li	a1,37
 6a0:	00048513          	mv	a0,s1
 6a4:	e81ff0ef          	jal	524 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
 6a8:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
 6ac:	00048513          	mv	a0,s1
 6b0:	e75ff0ef          	jal	524 <neorv32_uart_putc>
 6b4:	0840006f          	j	738 <neorv32_uart_vprintf+0x194>
      switch (c) {
 6b8:	06400713          	li	a4,100
 6bc:	00e78663          	beq	a5,a4,6c8 <neorv32_uart_vprintf+0x124>
 6c0:	06900713          	li	a4,105
 6c4:	fce79ce3          	bne	a5,a4,69c <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
 6c8:	00440913          	add	s2,s0,4
 6cc:	00042403          	lw	s0,0(s0)
          if (n < 0) {
 6d0:	00045a63          	bgez	s0,6e4 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
 6d4:	02d00593          	li	a1,45
 6d8:	00048513          	mv	a0,s1
            n = -n;
 6dc:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
 6e0:	e45ff0ef          	jal	524 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
 6e4:	00a00613          	li	a2,10
 6e8:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 6ec:	00c10513          	add	a0,sp,12
 6f0:	c75ff0ef          	jal	364 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
 6f4:	00c10593          	add	a1,sp,12
 6f8:	0200006f          	j	718 <neorv32_uart_vprintf+0x174>
      switch (c) {
 6fc:	05a78263          	beq	a5,s10,740 <neorv32_uart_vprintf+0x19c>
 700:	07800713          	li	a4,120
 704:	04e78663          	beq	a5,a4,750 <neorv32_uart_vprintf+0x1ac>
 708:	07300713          	li	a4,115
 70c:	f8e798e3          	bne	a5,a4,69c <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 710:	00042583          	lw	a1,0(s0)
 714:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
 718:	00048513          	mv	a0,s1
 71c:	e1dff0ef          	jal	538 <neorv32_uart_puts>
          break;
 720:	0140006f          	j	734 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
 724:	00044583          	lbu	a1,0(s0)
 728:	00048513          	mv	a0,s1
 72c:	00440913          	add	s2,s0,4
 730:	df5ff0ef          	jal	524 <neorv32_uart_putc>
 734:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
 738:	000b0913          	mv	s2,s6
 73c:	eddff06f          	j	618 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
 740:	00042583          	lw	a1,0(s0)
 744:	00440913          	add	s2,s0,4
 748:	00a00613          	li	a2,10
 74c:	fa1ff06f          	j	6ec <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 750:	00042583          	lw	a1,0(s0)
 754:	01000613          	li	a2,16
 758:	00c10513          	add	a0,sp,12
 75c:	c09ff0ef          	jal	364 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
 760:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
 764:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
 768:	2f8000ef          	jal	a60 <strlen>
 76c:	00800413          	li	s0,8
 770:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
 774:	f80400e3          	beqz	s0,6f4 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
 778:	03000593          	li	a1,48
 77c:	00048513          	mv	a0,s1
 780:	da5ff0ef          	jal	524 <neorv32_uart_putc>
 784:	fff40413          	add	s0,s0,-1
 788:	fedff06f          	j	774 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
 78c:	018d9863          	bne	s11,s8,79c <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
 790:	00d00593          	li	a1,13
 794:	00048513          	mv	a0,s1
 798:	d8dff0ef          	jal	524 <neorv32_uart_putc>
  while ((c = *format++)) {
 79c:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
 7a0:	000d8593          	mv	a1,s11
 7a4:	f09ff06f          	j	6ac <neorv32_uart_vprintf+0x108>

000007a8 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 7a8:	fc010113          	add	sp,sp,-64
 7ac:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
 7b0:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
 7b4:	00112e23          	sw	ra,28(sp)
 7b8:	02d12623          	sw	a3,44(sp)
 7bc:	02e12823          	sw	a4,48(sp)
 7c0:	02f12a23          	sw	a5,52(sp)
 7c4:	03012c23          	sw	a6,56(sp)
 7c8:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
 7cc:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
 7d0:	dd5ff0ef          	jal	5a4 <neorv32_uart_vprintf>
  va_end(args);
}
 7d4:	01c12083          	lw	ra,28(sp)
 7d8:	04010113          	add	sp,sp,64
 7dc:	00008067          	ret

000007e0 <memset>:
 7e0:	00f00313          	li	t1,15
 7e4:	00050713          	mv	a4,a0
 7e8:	02c37e63          	bgeu	t1,a2,824 <memset+0x44>
 7ec:	00f77793          	and	a5,a4,15
 7f0:	0a079063          	bnez	a5,890 <memset+0xb0>
 7f4:	08059263          	bnez	a1,878 <memset+0x98>
 7f8:	ff067693          	and	a3,a2,-16
 7fc:	00f67613          	and	a2,a2,15
 800:	00e686b3          	add	a3,a3,a4
 804:	00b72023          	sw	a1,0(a4)
 808:	00b72223          	sw	a1,4(a4)
 80c:	00b72423          	sw	a1,8(a4)
 810:	00b72623          	sw	a1,12(a4)
 814:	01070713          	add	a4,a4,16
 818:	fed766e3          	bltu	a4,a3,804 <memset+0x24>
 81c:	00061463          	bnez	a2,824 <memset+0x44>
 820:	00008067          	ret
 824:	40c306b3          	sub	a3,t1,a2
 828:	00269693          	sll	a3,a3,0x2
 82c:	00000297          	auipc	t0,0x0
 830:	005686b3          	add	a3,a3,t0
 834:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_ram_size+0x7b8000c>
 838:	00b70723          	sb	a1,14(a4)
 83c:	00b706a3          	sb	a1,13(a4)
 840:	00b70623          	sb	a1,12(a4)
 844:	00b705a3          	sb	a1,11(a4)
 848:	00b70523          	sb	a1,10(a4)
 84c:	00b704a3          	sb	a1,9(a4)
 850:	00b70423          	sb	a1,8(a4)
 854:	00b703a3          	sb	a1,7(a4)
 858:	00b70323          	sb	a1,6(a4)
 85c:	00b702a3          	sb	a1,5(a4)
 860:	00b70223          	sb	a1,4(a4)
 864:	00b701a3          	sb	a1,3(a4)
 868:	00b70123          	sb	a1,2(a4)
 86c:	00b700a3          	sb	a1,1(a4)
 870:	00b70023          	sb	a1,0(a4)
 874:	00008067          	ret
 878:	0ff5f593          	zext.b	a1,a1
 87c:	00859693          	sll	a3,a1,0x8
 880:	00d5e5b3          	or	a1,a1,a3
 884:	01059693          	sll	a3,a1,0x10
 888:	00d5e5b3          	or	a1,a1,a3
 88c:	f6dff06f          	j	7f8 <memset+0x18>
 890:	00279693          	sll	a3,a5,0x2
 894:	00000297          	auipc	t0,0x0
 898:	005686b3          	add	a3,a3,t0
 89c:	00008293          	mv	t0,ra
 8a0:	fa0680e7          	jalr	-96(a3)
 8a4:	00028093          	mv	ra,t0
 8a8:	ff078793          	add	a5,a5,-16
 8ac:	40f70733          	sub	a4,a4,a5
 8b0:	00f60633          	add	a2,a2,a5
 8b4:	f6c378e3          	bgeu	t1,a2,824 <memset+0x44>
 8b8:	f3dff06f          	j	7f4 <memset+0x14>

000008bc <memcpy>:
 8bc:	00a5c7b3          	xor	a5,a1,a0
 8c0:	0037f793          	and	a5,a5,3
 8c4:	00c508b3          	add	a7,a0,a2
 8c8:	06079463          	bnez	a5,930 <memcpy+0x74>
 8cc:	00300793          	li	a5,3
 8d0:	06c7f063          	bgeu	a5,a2,930 <memcpy+0x74>
 8d4:	00357793          	and	a5,a0,3
 8d8:	00050713          	mv	a4,a0
 8dc:	06079a63          	bnez	a5,950 <memcpy+0x94>
 8e0:	ffc8f613          	and	a2,a7,-4
 8e4:	40e606b3          	sub	a3,a2,a4
 8e8:	02000793          	li	a5,32
 8ec:	08d7ce63          	blt	a5,a3,988 <memcpy+0xcc>
 8f0:	00058693          	mv	a3,a1
 8f4:	00070793          	mv	a5,a4
 8f8:	02c77863          	bgeu	a4,a2,928 <memcpy+0x6c>
 8fc:	0006a803          	lw	a6,0(a3)
 900:	00478793          	add	a5,a5,4
 904:	00468693          	add	a3,a3,4
 908:	ff07ae23          	sw	a6,-4(a5)
 90c:	fec7e8e3          	bltu	a5,a2,8fc <memcpy+0x40>
 910:	fff60793          	add	a5,a2,-1
 914:	40e787b3          	sub	a5,a5,a4
 918:	ffc7f793          	and	a5,a5,-4
 91c:	00478793          	add	a5,a5,4
 920:	00f70733          	add	a4,a4,a5
 924:	00f585b3          	add	a1,a1,a5
 928:	01176863          	bltu	a4,a7,938 <memcpy+0x7c>
 92c:	00008067          	ret
 930:	00050713          	mv	a4,a0
 934:	05157863          	bgeu	a0,a7,984 <memcpy+0xc8>
 938:	0005c783          	lbu	a5,0(a1)
 93c:	00170713          	add	a4,a4,1
 940:	00158593          	add	a1,a1,1
 944:	fef70fa3          	sb	a5,-1(a4)
 948:	fee898e3          	bne	a7,a4,938 <memcpy+0x7c>
 94c:	00008067          	ret
 950:	0005c683          	lbu	a3,0(a1)
 954:	00170713          	add	a4,a4,1
 958:	00377793          	and	a5,a4,3
 95c:	fed70fa3          	sb	a3,-1(a4)
 960:	00158593          	add	a1,a1,1
 964:	f6078ee3          	beqz	a5,8e0 <memcpy+0x24>
 968:	0005c683          	lbu	a3,0(a1)
 96c:	00170713          	add	a4,a4,1
 970:	00377793          	and	a5,a4,3
 974:	fed70fa3          	sb	a3,-1(a4)
 978:	00158593          	add	a1,a1,1
 97c:	fc079ae3          	bnez	a5,950 <memcpy+0x94>
 980:	f61ff06f          	j	8e0 <memcpy+0x24>
 984:	00008067          	ret
 988:	ff010113          	add	sp,sp,-16
 98c:	00812623          	sw	s0,12(sp)
 990:	02000413          	li	s0,32
 994:	0005a383          	lw	t2,0(a1)
 998:	0045a283          	lw	t0,4(a1)
 99c:	0085af83          	lw	t6,8(a1)
 9a0:	00c5af03          	lw	t5,12(a1)
 9a4:	0105ae83          	lw	t4,16(a1)
 9a8:	0145ae03          	lw	t3,20(a1)
 9ac:	0185a303          	lw	t1,24(a1)
 9b0:	01c5a803          	lw	a6,28(a1)
 9b4:	0205a683          	lw	a3,32(a1)
 9b8:	02470713          	add	a4,a4,36
 9bc:	40e607b3          	sub	a5,a2,a4
 9c0:	fc772e23          	sw	t2,-36(a4)
 9c4:	fe572023          	sw	t0,-32(a4)
 9c8:	fff72223          	sw	t6,-28(a4)
 9cc:	ffe72423          	sw	t5,-24(a4)
 9d0:	ffd72623          	sw	t4,-20(a4)
 9d4:	ffc72823          	sw	t3,-16(a4)
 9d8:	fe672a23          	sw	t1,-12(a4)
 9dc:	ff072c23          	sw	a6,-8(a4)
 9e0:	fed72e23          	sw	a3,-4(a4)
 9e4:	02458593          	add	a1,a1,36
 9e8:	faf446e3          	blt	s0,a5,994 <memcpy+0xd8>
 9ec:	00058693          	mv	a3,a1
 9f0:	00070793          	mv	a5,a4
 9f4:	02c77863          	bgeu	a4,a2,a24 <memcpy+0x168>
 9f8:	0006a803          	lw	a6,0(a3)
 9fc:	00478793          	add	a5,a5,4
 a00:	00468693          	add	a3,a3,4
 a04:	ff07ae23          	sw	a6,-4(a5)
 a08:	fec7e8e3          	bltu	a5,a2,9f8 <memcpy+0x13c>
 a0c:	fff60793          	add	a5,a2,-1
 a10:	40e787b3          	sub	a5,a5,a4
 a14:	ffc7f793          	and	a5,a5,-4
 a18:	00478793          	add	a5,a5,4
 a1c:	00f70733          	add	a4,a4,a5
 a20:	00f585b3          	add	a1,a1,a5
 a24:	01176863          	bltu	a4,a7,a34 <memcpy+0x178>
 a28:	00c12403          	lw	s0,12(sp)
 a2c:	01010113          	add	sp,sp,16
 a30:	00008067          	ret
 a34:	0005c783          	lbu	a5,0(a1)
 a38:	00170713          	add	a4,a4,1
 a3c:	00158593          	add	a1,a1,1
 a40:	fef70fa3          	sb	a5,-1(a4)
 a44:	fee882e3          	beq	a7,a4,a28 <memcpy+0x16c>
 a48:	0005c783          	lbu	a5,0(a1)
 a4c:	00170713          	add	a4,a4,1
 a50:	00158593          	add	a1,a1,1
 a54:	fef70fa3          	sb	a5,-1(a4)
 a58:	fce89ee3          	bne	a7,a4,a34 <memcpy+0x178>
 a5c:	fcdff06f          	j	a28 <memcpy+0x16c>

00000a60 <strlen>:
 a60:	00357793          	and	a5,a0,3
 a64:	00050713          	mv	a4,a0
 a68:	04079c63          	bnez	a5,ac0 <strlen+0x60>
 a6c:	7f7f86b7          	lui	a3,0x7f7f8
 a70:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
 a74:	fff00593          	li	a1,-1
 a78:	00072603          	lw	a2,0(a4)
 a7c:	00470713          	add	a4,a4,4
 a80:	00d677b3          	and	a5,a2,a3
 a84:	00d787b3          	add	a5,a5,a3
 a88:	00c7e7b3          	or	a5,a5,a2
 a8c:	00d7e7b3          	or	a5,a5,a3
 a90:	feb784e3          	beq	a5,a1,a78 <strlen+0x18>
 a94:	ffc74683          	lbu	a3,-4(a4)
 a98:	40a707b3          	sub	a5,a4,a0
 a9c:	04068463          	beqz	a3,ae4 <strlen+0x84>
 aa0:	ffd74683          	lbu	a3,-3(a4)
 aa4:	02068c63          	beqz	a3,adc <strlen+0x7c>
 aa8:	ffe74503          	lbu	a0,-2(a4)
 aac:	00a03533          	snez	a0,a0
 ab0:	00f50533          	add	a0,a0,a5
 ab4:	ffe50513          	add	a0,a0,-2
 ab8:	00008067          	ret
 abc:	fa0688e3          	beqz	a3,a6c <strlen+0xc>
 ac0:	00074783          	lbu	a5,0(a4)
 ac4:	00170713          	add	a4,a4,1
 ac8:	00377693          	and	a3,a4,3
 acc:	fe0798e3          	bnez	a5,abc <strlen+0x5c>
 ad0:	40a70733          	sub	a4,a4,a0
 ad4:	fff70513          	add	a0,a4,-1
 ad8:	00008067          	ret
 adc:	ffd78513          	add	a0,a5,-3
 ae0:	00008067          	ret
 ae4:	ffc78513          	add	a0,a5,-4
 ae8:	00008067          	ret

00000aec <__divsi3>:
 aec:	06054063          	bltz	a0,b4c <__umodsi3+0x10>
 af0:	0605c663          	bltz	a1,b5c <__umodsi3+0x20>

00000af4 <__hidden___udivsi3>:
 af4:	00058613          	mv	a2,a1
 af8:	00050593          	mv	a1,a0
 afc:	fff00513          	li	a0,-1
 b00:	02060c63          	beqz	a2,b38 <__hidden___udivsi3+0x44>
 b04:	00100693          	li	a3,1
 b08:	00b67a63          	bgeu	a2,a1,b1c <__hidden___udivsi3+0x28>
 b0c:	00c05863          	blez	a2,b1c <__hidden___udivsi3+0x28>
 b10:	00161613          	sll	a2,a2,0x1
 b14:	00169693          	sll	a3,a3,0x1
 b18:	feb66ae3          	bltu	a2,a1,b0c <__hidden___udivsi3+0x18>
 b1c:	00000513          	li	a0,0
 b20:	00c5e663          	bltu	a1,a2,b2c <__hidden___udivsi3+0x38>
 b24:	40c585b3          	sub	a1,a1,a2
 b28:	00d56533          	or	a0,a0,a3
 b2c:	0016d693          	srl	a3,a3,0x1
 b30:	00165613          	srl	a2,a2,0x1
 b34:	fe0696e3          	bnez	a3,b20 <__hidden___udivsi3+0x2c>
 b38:	00008067          	ret

00000b3c <__umodsi3>:
 b3c:	00008293          	mv	t0,ra
 b40:	fb5ff0ef          	jal	af4 <__hidden___udivsi3>
 b44:	00058513          	mv	a0,a1
 b48:	00028067          	jr	t0 # 894 <memset+0xb4>
 b4c:	40a00533          	neg	a0,a0
 b50:	00b04863          	bgtz	a1,b60 <__umodsi3+0x24>
 b54:	40b005b3          	neg	a1,a1
 b58:	f9dff06f          	j	af4 <__hidden___udivsi3>
 b5c:	40b005b3          	neg	a1,a1
 b60:	00008293          	mv	t0,ra
 b64:	f91ff0ef          	jal	af4 <__hidden___udivsi3>
 b68:	40a00533          	neg	a0,a0
 b6c:	00028067          	jr	t0

00000b70 <__modsi3>:
 b70:	00008293          	mv	t0,ra
 b74:	0005ca63          	bltz	a1,b88 <__modsi3+0x18>
 b78:	00054c63          	bltz	a0,b90 <__modsi3+0x20>
 b7c:	f79ff0ef          	jal	af4 <__hidden___udivsi3>
 b80:	00058513          	mv	a0,a1
 b84:	00028067          	jr	t0
 b88:	40b005b3          	neg	a1,a1
 b8c:	fe0558e3          	bgez	a0,b7c <__modsi3+0xc>
 b90:	40a00533          	neg	a0,a0
 b94:	f61ff0ef          	jal	af4 <__hidden___udivsi3>
 b98:	40b00533          	neg	a0,a1
 b9c:	00028067          	jr	t0
