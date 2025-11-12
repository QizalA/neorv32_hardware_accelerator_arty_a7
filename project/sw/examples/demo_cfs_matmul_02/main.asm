
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__udivdi3+0x3e4>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	f3438393          	add	t2,t2,-204 # 1f68 <__crt0_copy_data_src_begin>
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
     10c:	00002417          	auipc	s0,0x2
     110:	a9440413          	add	s0,s0,-1388 # 1ba0 <__fini_array_end>
     114:	00002497          	auipc	s1,0x2
     118:	a8c48493          	add	s1,s1,-1396 # 1ba0 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00001617          	auipc	a2,0x1
     134:	a4060613          	add	a2,a2,-1472 # b70 <main>

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
     174:	00002417          	auipc	s0,0x2
     178:	a2c40413          	add	s0,s0,-1492 # 1ba0 <__fini_array_end>
     17c:	00002497          	auipc	s1,0x2
     180:	a2448493          	add	s1,s1,-1500 # 1ba0 <__fini_array_end>

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

000001e4 <print_u8_mat4>:
  uint32_t sum=0; for(int i=0;i<4;i++) for(int j=0;j<4;j++) sum+=C[i][j];
  return sum;
}

/* ===== Pretty print helpers ===== */
static void print_u8_mat4(const char* name, const uint8_t M[4][4]){
     1e4:	fd010113          	add	sp,sp,-48
     1e8:	01312e23          	sw	s3,28(sp)
     1ec:	00058993          	mv	s3,a1
  neorv32_uart0_printf("%s = [", name);
     1f0:	000025b7          	lui	a1,0x2
static void print_u8_mat4(const char* name, const uint8_t M[4][4]){
     1f4:	00050613          	mv	a2,a0
  neorv32_uart0_printf("%s = [", name);
     1f8:	bb058593          	add	a1,a1,-1104 # 1bb0 <__fini_array_end+0x10>
     1fc:	fff50537          	lui	a0,0xfff50
static void print_u8_mat4(const char* name, const uint8_t M[4][4]){
     200:	02812423          	sw	s0,40(sp)
     204:	03212023          	sw	s2,32(sp)
     208:	01412c23          	sw	s4,24(sp)
     20c:	01512a23          	sw	s5,20(sp)
     210:	01612823          	sw	s6,16(sp)
     214:	01812423          	sw	s8,8(sp)
     218:	02112623          	sw	ra,44(sp)
     21c:	02912223          	sw	s1,36(sp)
     220:	01712623          	sw	s7,12(sp)
     224:	01912223          	sw	s9,4(sp)
     228:	01a12023          	sw	s10,0(sp)
  neorv32_uart0_printf("%s = [", name);
     22c:	6ad000ef          	jal	10d8 <neorv32_uart_printf>
  for(int i=0;i<4;i++){
    neorv32_uart0_printf(i==0 ? "[" : " [");
     230:	000027b7          	lui	a5,0x2
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     234:	00002a37          	lui	s4,0x2
     238:	00002ab7          	lui	s5,0x2
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     23c:	00002b37          	lui	s6,0x2
    neorv32_uart0_printf(i==0 ? "[" : " [");
     240:	00002937          	lui	s2,0x2
  neorv32_uart0_printf("%s = [", name);
     244:	00000413          	li	s0,0
    neorv32_uart0_printf(i==0 ? "[" : " [");
     248:	ba078593          	add	a1,a5,-1120 # 1ba0 <__fini_array_end>
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     24c:	ba4a0a13          	add	s4,s4,-1116 # 1ba4 <__fini_array_end+0x4>
     250:	00002c37          	lui	s8,0x2
     254:	c58a8a93          	add	s5,s5,-936 # 1c58 <__fini_array_end+0xb8>
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     258:	bacb0b13          	add	s6,s6,-1108 # 1bac <__fini_array_end+0xc>
    neorv32_uart0_printf(i==0 ? "[" : " [");
     25c:	bb490913          	add	s2,s2,-1100 # 1bb4 <__fini_array_end+0x14>
     260:	fff50537          	lui	a0,0xfff50
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     264:	00241b93          	sll	s7,s0,0x2
    neorv32_uart0_printf(i==0 ? "[" : " [");
     268:	671000ef          	jal	10d8 <neorv32_uart_printf>
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     26c:	01798bb3          	add	s7,s3,s7
     270:	00000493          	li	s1,0
     274:	00300d13          	li	s10,3
     278:	00400c93          	li	s9,4
     27c:	009b87b3          	add	a5,s7,s1
     280:	0007c603          	lbu	a2,0(a5)
     284:	000a0693          	mv	a3,s4
     288:	01a49463          	bne	s1,s10,290 <print_u8_mat4+0xac>
     28c:	000a8693          	mv	a3,s5
     290:	bb8c0593          	add	a1,s8,-1096 # 1bb8 <__fini_array_end+0x18>
     294:	fff50537          	lui	a0,0xfff50
     298:	00148493          	add	s1,s1,1
     29c:	63d000ef          	jal	10d8 <neorv32_uart_printf>
     2a0:	fd949ee3          	bne	s1,s9,27c <print_u8_mat4+0x98>
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     2a4:	00300793          	li	a5,3
     2a8:	000b0593          	mv	a1,s6
     2ac:	00f41663          	bne	s0,a5,2b8 <print_u8_mat4+0xd4>
     2b0:	000027b7          	lui	a5,0x2
     2b4:	ba878593          	add	a1,a5,-1112 # 1ba8 <__fini_array_end+0x8>
     2b8:	fff50537          	lui	a0,0xfff50
     2bc:	61d000ef          	jal	10d8 <neorv32_uart_printf>
  for(int i=0;i<4;i++){
     2c0:	00140413          	add	s0,s0,1
     2c4:	00400793          	li	a5,4
    neorv32_uart0_printf(i==0 ? "[" : " [");
     2c8:	00090593          	mv	a1,s2
  for(int i=0;i<4;i++){
     2cc:	f8f41ae3          	bne	s0,a5,260 <print_u8_mat4+0x7c>
  }
}
     2d0:	02c12083          	lw	ra,44(sp)
     2d4:	02812403          	lw	s0,40(sp)
     2d8:	02412483          	lw	s1,36(sp)
     2dc:	02012903          	lw	s2,32(sp)
     2e0:	01c12983          	lw	s3,28(sp)
     2e4:	01812a03          	lw	s4,24(sp)
     2e8:	01412a83          	lw	s5,20(sp)
     2ec:	01012b03          	lw	s6,16(sp)
     2f0:	00c12b83          	lw	s7,12(sp)
     2f4:	00812c03          	lw	s8,8(sp)
     2f8:	00412c83          	lw	s9,4(sp)
     2fc:	00012d03          	lw	s10,0(sp)
     300:	03010113          	add	sp,sp,48
     304:	00008067          	ret

00000308 <print_u32_mat4>:
static void print_u32_mat4(const char* name, const uint32_t M[4][4]){
     308:	fd010113          	add	sp,sp,-48
     30c:	01312e23          	sw	s3,28(sp)
     310:	00058993          	mv	s3,a1
  neorv32_uart0_printf("%s = [", name);
     314:	000025b7          	lui	a1,0x2
static void print_u32_mat4(const char* name, const uint32_t M[4][4]){
     318:	00050613          	mv	a2,a0
  neorv32_uart0_printf("%s = [", name);
     31c:	bb058593          	add	a1,a1,-1104 # 1bb0 <__fini_array_end+0x10>
     320:	fff50537          	lui	a0,0xfff50
static void print_u32_mat4(const char* name, const uint32_t M[4][4]){
     324:	02812423          	sw	s0,40(sp)
     328:	03212023          	sw	s2,32(sp)
     32c:	01412c23          	sw	s4,24(sp)
     330:	01512a23          	sw	s5,20(sp)
     334:	01612823          	sw	s6,16(sp)
     338:	01812423          	sw	s8,8(sp)
     33c:	02112623          	sw	ra,44(sp)
     340:	02912223          	sw	s1,36(sp)
     344:	01712623          	sw	s7,12(sp)
     348:	01912223          	sw	s9,4(sp)
     34c:	01a12023          	sw	s10,0(sp)
  neorv32_uart0_printf("%s = [", name);
     350:	589000ef          	jal	10d8 <neorv32_uart_printf>
  for(int i=0;i<4;i++){
    neorv32_uart0_printf(i==0 ? "[" : " [");
     354:	000027b7          	lui	a5,0x2
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     358:	00002a37          	lui	s4,0x2
     35c:	00002ab7          	lui	s5,0x2
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     360:	00002b37          	lui	s6,0x2
    neorv32_uart0_printf(i==0 ? "[" : " [");
     364:	00002937          	lui	s2,0x2
  neorv32_uart0_printf("%s = [", name);
     368:	00000413          	li	s0,0
    neorv32_uart0_printf(i==0 ? "[" : " [");
     36c:	ba078593          	add	a1,a5,-1120 # 1ba0 <__fini_array_end>
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     370:	ba4a0a13          	add	s4,s4,-1116 # 1ba4 <__fini_array_end+0x4>
     374:	00002c37          	lui	s8,0x2
     378:	c58a8a93          	add	s5,s5,-936 # 1c58 <__fini_array_end+0xb8>
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     37c:	bacb0b13          	add	s6,s6,-1108 # 1bac <__fini_array_end+0xc>
    neorv32_uart0_printf(i==0 ? "[" : " [");
     380:	bb490913          	add	s2,s2,-1100 # 1bb4 <__fini_array_end+0x14>
     384:	fff50537          	lui	a0,0xfff50
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     388:	00441b93          	sll	s7,s0,0x4
    neorv32_uart0_printf(i==0 ? "[" : " [");
     38c:	54d000ef          	jal	10d8 <neorv32_uart_printf>
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
     390:	01798bb3          	add	s7,s3,s7
     394:	00000493          	li	s1,0
     398:	00300d13          	li	s10,3
     39c:	00400c93          	li	s9,4
     3a0:	00249793          	sll	a5,s1,0x2
     3a4:	00fb87b3          	add	a5,s7,a5
     3a8:	0007a603          	lw	a2,0(a5)
     3ac:	000a0693          	mv	a3,s4
     3b0:	01a49463          	bne	s1,s10,3b8 <print_u32_mat4+0xb0>
     3b4:	000a8693          	mv	a3,s5
     3b8:	bb8c0593          	add	a1,s8,-1096 # 1bb8 <__fini_array_end+0x18>
     3bc:	fff50537          	lui	a0,0xfff50
     3c0:	00148493          	add	s1,s1,1
     3c4:	515000ef          	jal	10d8 <neorv32_uart_printf>
     3c8:	fd949ce3          	bne	s1,s9,3a0 <print_u32_mat4+0x98>
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
     3cc:	00300793          	li	a5,3
     3d0:	000b0593          	mv	a1,s6
     3d4:	00f41663          	bne	s0,a5,3e0 <print_u32_mat4+0xd8>
     3d8:	000027b7          	lui	a5,0x2
     3dc:	ba878593          	add	a1,a5,-1112 # 1ba8 <__fini_array_end+0x8>
     3e0:	fff50537          	lui	a0,0xfff50
     3e4:	4f5000ef          	jal	10d8 <neorv32_uart_printf>
  for(int i=0;i<4;i++){
     3e8:	00140413          	add	s0,s0,1
     3ec:	00400793          	li	a5,4
    neorv32_uart0_printf(i==0 ? "[" : " [");
     3f0:	00090593          	mv	a1,s2
  for(int i=0;i<4;i++){
     3f4:	f8f418e3          	bne	s0,a5,384 <print_u32_mat4+0x7c>
  }
}
     3f8:	02c12083          	lw	ra,44(sp)
     3fc:	02812403          	lw	s0,40(sp)
     400:	02412483          	lw	s1,36(sp)
     404:	02012903          	lw	s2,32(sp)
     408:	01c12983          	lw	s3,28(sp)
     40c:	01812a03          	lw	s4,24(sp)
     410:	01412a83          	lw	s5,20(sp)
     414:	01012b03          	lw	s6,16(sp)
     418:	00c12b83          	lw	s7,12(sp)
     41c:	00812c03          	lw	s8,8(sp)
     420:	00412c83          	lw	s9,4(sp)
     424:	00012d03          	lw	s10,0(sp)
     428:	03010113          	add	sp,sp,48
     42c:	00008067          	ret

00000430 <bench_cfs_once>:
                               uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
     430:	fb010113          	add	sp,sp,-80
     434:	04112623          	sw	ra,76(sp)
     438:	04812423          	sw	s0,72(sp)
     43c:	04912223          	sw	s1,68(sp)
     440:	05212023          	sw	s2,64(sp)
     444:	03312e23          	sw	s3,60(sp)
     448:	03412c23          	sw	s4,56(sp)
     44c:	03512a23          	sw	s5,52(sp)
     450:	03712623          	sw	s7,44(sp)
     454:	03612823          	sw	s6,48(sp)
     458:	03812423          	sw	s8,40(sp)
     45c:	03912223          	sw	s9,36(sp)
     460:	03a12023          	sw	s10,32(sp)
     464:	01b12e23          	sw	s11,28(sp)
     468:	00070413          	mv	s0,a4
  return ((uint32_t)x3<<24) | ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     46c:	00154703          	lbu	a4,1(a0) # fff50001 <__crt0_ram_last+0x7ff4e002>
     470:	00054783          	lbu	a5,0(a0)
     474:	00354d83          	lbu	s11,3(a0)
     478:	00871713          	sll	a4,a4,0x8
     47c:	00f76733          	or	a4,a4,a5
     480:	00254783          	lbu	a5,2(a0)
     484:	018d9d93          	sll	s11,s11,0x18
     488:	00754d03          	lbu	s10,7(a0)
     48c:	01079793          	sll	a5,a5,0x10
     490:	00e7e7b3          	or	a5,a5,a4
     494:	00554703          	lbu	a4,5(a0)
     498:	00fdedb3          	or	s11,s11,a5
     49c:	00454783          	lbu	a5,4(a0)
     4a0:	00871713          	sll	a4,a4,0x8
     4a4:	018d1d13          	sll	s10,s10,0x18
     4a8:	00f76733          	or	a4,a4,a5
     4ac:	00654783          	lbu	a5,6(a0)
     4b0:	00b54c83          	lbu	s9,11(a0)
     4b4:	00f54c03          	lbu	s8,15(a0)
     4b8:	01079793          	sll	a5,a5,0x10
     4bc:	00e7e7b3          	or	a5,a5,a4
     4c0:	00954703          	lbu	a4,9(a0)
     4c4:	00fd6d33          	or	s10,s10,a5
     4c8:	00854783          	lbu	a5,8(a0)
     4cc:	00871713          	sll	a4,a4,0x8
     4d0:	018c9c93          	sll	s9,s9,0x18
     4d4:	00f76733          	or	a4,a4,a5
     4d8:	00a54783          	lbu	a5,10(a0)
     4dc:	018c1c13          	sll	s8,s8,0x18
                               uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
     4e0:	00060a13          	mv	s4,a2
  return ((uint32_t)x3<<24) | ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     4e4:	01079793          	sll	a5,a5,0x10
     4e8:	00e7e7b3          	or	a5,a5,a4
     4ec:	00d54703          	lbu	a4,13(a0)
     4f0:	00fcecb3          	or	s9,s9,a5
     4f4:	00c54783          	lbu	a5,12(a0)
     4f8:	00871713          	sll	a4,a4,0x8
                               uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
     4fc:	00068993          	mv	s3,a3
  return ((uint32_t)x3<<24) | ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     500:	00f76733          	or	a4,a4,a5
     504:	00e54783          	lbu	a5,14(a0)
     508:	01079793          	sll	a5,a5,0x10
     50c:	00e7e7b3          	or	a5,a5,a4
     510:	0015c703          	lbu	a4,1(a1)
     514:	00fc6c33          	or	s8,s8,a5
     518:	0005c783          	lbu	a5,0(a1)
     51c:	00871713          	sll	a4,a4,0x8
     520:	00f76733          	or	a4,a4,a5
     524:	0025c783          	lbu	a5,2(a1)
     528:	0035cb03          	lbu	s6,3(a1)
     52c:	0075ca83          	lbu	s5,7(a1)
     530:	01079793          	sll	a5,a5,0x10
     534:	00e7e7b3          	or	a5,a5,a4
     538:	018b1b13          	sll	s6,s6,0x18
     53c:	0055c703          	lbu	a4,5(a1)
     540:	00fb6b33          	or	s6,s6,a5
     544:	0045c783          	lbu	a5,4(a1)
     548:	00871713          	sll	a4,a4,0x8
     54c:	018a9a93          	sll	s5,s5,0x18
     550:	00f76733          	or	a4,a4,a5
     554:	0065c783          	lbu	a5,6(a1)
     558:	00b5c903          	lbu	s2,11(a1)
     55c:	00f5c483          	lbu	s1,15(a1)
     560:	01079793          	sll	a5,a5,0x10
     564:	00e7e7b3          	or	a5,a5,a4
     568:	0095c703          	lbu	a4,9(a1)
     56c:	00faeab3          	or	s5,s5,a5
     570:	0085c783          	lbu	a5,8(a1)
     574:	00871713          	sll	a4,a4,0x8
     578:	01891913          	sll	s2,s2,0x18
     57c:	00f76733          	or	a4,a4,a5
     580:	00a5c783          	lbu	a5,10(a1)
     584:	01849493          	sll	s1,s1,0x18
     588:	01079793          	sll	a5,a5,0x10
     58c:	00e7e7b3          	or	a5,a5,a4
     590:	00d5c703          	lbu	a4,13(a1)
     594:	00f96933          	or	s2,s2,a5
     598:	00c5c783          	lbu	a5,12(a1)
     59c:	00871713          	sll	a4,a4,0x8
     5a0:	00f76733          	or	a4,a4,a5
     5a4:	00e5c783          	lbu	a5,14(a1)
     5a8:	01079793          	sll	a5,a5,0x10
     5ac:	00e7e7b3          	or	a5,a5,a4
     5b0:	00f4e4b3          	or	s1,s1,a5
  uint64_t c0 = neorv32_cpu_get_cycle();
     5b4:	7d8000ef          	jal	d8c <neorv32_cpu_get_cycle>
     5b8:	00050b93          	mv	s7,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     5bc:	7e4000ef          	jal	da0 <neorv32_cpu_get_instret>
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
     5c0:	ffeb07b7          	lui	a5,0xffeb0
     5c4:	01b7a023          	sw	s11,0(a5) # ffeb0000 <__crt0_ram_last+0x7feae001>
     5c8:	01a7a223          	sw	s10,4(a5)
     5cc:	ffeb07b7          	lui	a5,0xffeb0
     5d0:	0197a423          	sw	s9,8(a5) # ffeb0008 <__crt0_ram_last+0x7feae009>
     5d4:	ffeb07b7          	lui	a5,0xffeb0
     5d8:	0187a623          	sw	s8,12(a5) # ffeb000c <__crt0_ram_last+0x7feae00d>
     5dc:	ffeb07b7          	lui	a5,0xffeb0
     5e0:	0167a823          	sw	s6,16(a5) # ffeb0010 <__crt0_ram_last+0x7feae011>
     5e4:	ffeb07b7          	lui	a5,0xffeb0
     5e8:	0157aa23          	sw	s5,20(a5) # ffeb0014 <__crt0_ram_last+0x7feae015>
     5ec:	ffeb07b7          	lui	a5,0xffeb0
     5f0:	0127ac23          	sw	s2,24(a5) # ffeb0018 <__crt0_ram_last+0x7feae019>
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     5f4:	ffeb05b7          	lui	a1,0xffeb0
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
     5f8:	ffeb07b7          	lui	a5,0xffeb0
  uint64_t i0 = neorv32_cpu_get_instret();
     5fc:	00050613          	mv	a2,a0
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
     600:	0097ae23          	sw	s1,28(a5) # ffeb001c <__crt0_ram_last+0x7feae01d>
     604:	00000693          	li	a3,0
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     608:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7feae041>
    for(int j=0;j<4;j++)
     60c:	01000813          	li	a6,16
     610:	00269713          	sll	a4,a3,0x2
      C[i][j] = rd32(CFS_C(i,j));
     614:	00870533          	add	a0,a4,s0
     618:	00040493          	mv	s1,s0
     61c:	00000793          	li	a5,0
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     620:	00b70733          	add	a4,a4,a1
     624:	00f708b3          	add	a7,a4,a5
     628:	0008a303          	lw	t1,0(a7)
      C[i][j] = rd32(CFS_C(i,j));
     62c:	00f508b3          	add	a7,a0,a5
    for(int j=0;j<4;j++)
     630:	00478793          	add	a5,a5,4
      C[i][j] = rd32(CFS_C(i,j));
     634:	0068a023          	sw	t1,0(a7)
    for(int j=0;j<4;j++)
     638:	ff0796e3          	bne	a5,a6,624 <bench_cfs_once+0x1f4>
  for(int i=0;i<4;i++)
     63c:	00468693          	add	a3,a3,4
     640:	fcf698e3          	bne	a3,a5,610 <bench_cfs_once+0x1e0>
     644:	00c12623          	sw	a2,12(sp)
  uint64_t c1 = neorv32_cpu_get_cycle();
     648:	744000ef          	jal	d8c <neorv32_cpu_get_cycle>
     64c:	00050913          	mv	s2,a0
  uint64_t i1 = neorv32_cpu_get_instret();
     650:	750000ef          	jal	da0 <neorv32_cpu_get_instret>
  *insts  = (uint32_t)(i1 - i0);
     654:	00c12603          	lw	a2,12(sp)
  *cycles = (uint32_t)(c1 - c0);
     658:	41790933          	sub	s2,s2,s7
     65c:	012a2023          	sw	s2,0(s4)
  *insts  = (uint32_t)(i1 - i0);
     660:	40c50533          	sub	a0,a0,a2
     664:	00a9a023          	sw	a0,0(s3)
  uint32_t sum=0; for(int i=0;i<4;i++) for(int j=0;j<4;j++) sum+=C[i][j];
     668:	04040413          	add	s0,s0,64
     66c:	00000513          	li	a0,0
     670:	0044a703          	lw	a4,4(s1)
     674:	0004a783          	lw	a5,0(s1)
     678:	01048493          	add	s1,s1,16
     67c:	00e787b3          	add	a5,a5,a4
     680:	ff84a703          	lw	a4,-8(s1)
     684:	00e787b3          	add	a5,a5,a4
     688:	ffc4a703          	lw	a4,-4(s1)
     68c:	00e787b3          	add	a5,a5,a4
     690:	00f50533          	add	a0,a0,a5
     694:	fc849ee3          	bne	s1,s0,670 <bench_cfs_once+0x240>
}
     698:	04c12083          	lw	ra,76(sp)
     69c:	04812403          	lw	s0,72(sp)
     6a0:	04412483          	lw	s1,68(sp)
     6a4:	04012903          	lw	s2,64(sp)
     6a8:	03c12983          	lw	s3,60(sp)
     6ac:	03812a03          	lw	s4,56(sp)
     6b0:	03412a83          	lw	s5,52(sp)
     6b4:	03012b03          	lw	s6,48(sp)
     6b8:	02c12b83          	lw	s7,44(sp)
     6bc:	02812c03          	lw	s8,40(sp)
     6c0:	02412c83          	lw	s9,36(sp)
     6c4:	02012d03          	lw	s10,32(sp)
     6c8:	01c12d83          	lw	s11,28(sp)
     6cc:	05010113          	add	sp,sp,80
     6d0:	00008067          	ret

000006d4 <bench_sw_once>:
                              uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
     6d4:	fb010113          	add	sp,sp,-80
     6d8:	04112623          	sw	ra,76(sp)
     6dc:	04812423          	sw	s0,72(sp)
     6e0:	04912223          	sw	s1,68(sp)
     6e4:	00070413          	mv	s0,a4
     6e8:	03412c23          	sw	s4,56(sp)
     6ec:	03512a23          	sw	s5,52(sp)
     6f0:	03612823          	sw	s6,48(sp)
     6f4:	03712623          	sw	s7,44(sp)
     6f8:	03812423          	sw	s8,40(sp)
     6fc:	03912223          	sw	s9,36(sp)
     700:	03a12023          	sw	s10,32(sp)
     704:	00060b93          	mv	s7,a2
     708:	00068a93          	mv	s5,a3
     70c:	05212023          	sw	s2,64(sp)
     710:	03312e23          	sw	s3,60(sp)
     714:	01b12e23          	sw	s11,28(sp)
     718:	00050493          	mv	s1,a0
     71c:	00058d13          	mv	s10,a1
  uint64_t c0 = neorv32_cpu_get_cycle();
     720:	66c000ef          	jal	d8c <neorv32_cpu_get_cycle>
     724:	00050c13          	mv	s8,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     728:	678000ef          	jal	da0 <neorv32_cpu_get_instret>
     72c:	00050b13          	mv	s6,a0
  for(int i=0;i<4;i++){
     730:	04040a13          	add	s4,s0,64
  uint64_t i0 = neorv32_cpu_get_instret();
     734:	00040c93          	mv	s9,s0
    for(int j=0;j<4;j++){
     738:	00000913          	li	s2,0
     73c:	0440006f          	j	780 <bench_sw_once+0xac>
      for(int k=0;k<4;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     740:	013486b3          	add	a3,s1,s3
     744:	0007c583          	lbu	a1,0(a5)
     748:	0006c503          	lbu	a0,0(a3)
     74c:	00f12623          	sw	a5,12(sp)
     750:	00198993          	add	s3,s3,1
     754:	374010ef          	jal	1ac8 <__mulsi3>
     758:	00c12783          	lw	a5,12(sp)
     75c:	00400713          	li	a4,4
     760:	00ad8db3          	add	s11,s11,a0
     764:	00478793          	add	a5,a5,4
     768:	fce99ce3          	bne	s3,a4,740 <bench_sw_once+0x6c>
      C[i][j]=s;
     76c:	00291793          	sll	a5,s2,0x2
     770:	00fc87b3          	add	a5,s9,a5
     774:	01b7a023          	sw	s11,0(a5)
    for(int j=0;j<4;j++){
     778:	00190913          	add	s2,s2,1
     77c:	01390a63          	beq	s2,s3,790 <bench_sw_once+0xbc>
      for(int k=0;k<4;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     780:	012d07b3          	add	a5,s10,s2
      uint32_t s=0u;
     784:	00000d93          	li	s11,0
      for(int k=0;k<4;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     788:	00000993          	li	s3,0
     78c:	fb5ff06f          	j	740 <bench_sw_once+0x6c>
  for(int i=0;i<4;i++){
     790:	010c8c93          	add	s9,s9,16
     794:	00448493          	add	s1,s1,4
     798:	fb4c90e3          	bne	s9,s4,738 <bench_sw_once+0x64>
  uint64_t c1 = neorv32_cpu_get_cycle();
     79c:	5f0000ef          	jal	d8c <neorv32_cpu_get_cycle>
     7a0:	00050493          	mv	s1,a0
  *cycles = (uint32_t)(c1 - c0);
     7a4:	418484b3          	sub	s1,s1,s8
  uint64_t i1 = neorv32_cpu_get_instret();
     7a8:	5f8000ef          	jal	da0 <neorv32_cpu_get_instret>
  *insts  = (uint32_t)(i1 - i0);
     7ac:	41650533          	sub	a0,a0,s6
  *cycles = (uint32_t)(c1 - c0);
     7b0:	009ba023          	sw	s1,0(s7)
  *insts  = (uint32_t)(i1 - i0);
     7b4:	00aaa023          	sw	a0,0(s5)
  uint32_t sum=0; for(int i=0;i<4;i++) for(int j=0;j<4;j++) sum+=C[i][j];
     7b8:	00000513          	li	a0,0
     7bc:	00042703          	lw	a4,0(s0)
     7c0:	00442783          	lw	a5,4(s0)
     7c4:	01040413          	add	s0,s0,16
     7c8:	00e787b3          	add	a5,a5,a4
     7cc:	ff842703          	lw	a4,-8(s0)
     7d0:	00e787b3          	add	a5,a5,a4
     7d4:	ffc42703          	lw	a4,-4(s0)
     7d8:	00e787b3          	add	a5,a5,a4
     7dc:	00f50533          	add	a0,a0,a5
     7e0:	fd441ee3          	bne	s0,s4,7bc <bench_sw_once+0xe8>
}
     7e4:	04c12083          	lw	ra,76(sp)
     7e8:	04812403          	lw	s0,72(sp)
     7ec:	04412483          	lw	s1,68(sp)
     7f0:	04012903          	lw	s2,64(sp)
     7f4:	03c12983          	lw	s3,60(sp)
     7f8:	03812a03          	lw	s4,56(sp)
     7fc:	03412a83          	lw	s5,52(sp)
     800:	03012b03          	lw	s6,48(sp)
     804:	02c12b83          	lw	s7,44(sp)
     808:	02812c03          	lw	s8,40(sp)
     80c:	02412c83          	lw	s9,36(sp)
     810:	02012d03          	lw	s10,32(sp)
     814:	01c12d83          	lw	s11,28(sp)
     818:	05010113          	add	sp,sp,80
     81c:	00008067          	ret

00000820 <run_case>:

/* ===== One case ===== */
static void run_case(const char *tag,
                     const uint8_t A_[4][4],
                     const uint8_t B_[4][4]) {
     820:	f1010113          	add	sp,sp,-240
     824:	0e812423          	sw	s0,232(sp)
     828:	0e912223          	sw	s1,228(sp)
     82c:	00050413          	mv	s0,a0
     830:	00060493          	mv	s1,a2
  uint8_t  A[4][4]; uint8_t B[4][4];
  uint32_t Ccfs[4][4], Csw[4][4];
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;

  // copy inputs (avoid const aliasing)
  for(int i=0;i<4;i++) for(int j=0;j<4;j++){ A[i][j]=A_[i][j]; B[i][j]=B_[i][j]; }
     834:	02010513          	add	a0,sp,32
     838:	01000613          	li	a2,16
                     const uint8_t B_[4][4]) {
     83c:	0e112623          	sw	ra,236(sp)
     840:	0f212023          	sw	s2,224(sp)
     844:	0d312e23          	sw	s3,220(sp)
     848:	0d412c23          	sw	s4,216(sp)
     84c:	0d512a23          	sw	s5,212(sp)
     850:	0d612823          	sw	s6,208(sp)
     854:	0d712623          	sw	s7,204(sp)
     858:	0d812423          	sw	s8,200(sp)
     85c:	0d912223          	sw	s9,196(sp)
     860:	0da12023          	sw	s10,192(sp)
  for(int i=0;i<4;i++) for(int j=0;j<4;j++){ A[i][j]=A_[i][j]; B[i][j]=B_[i][j]; }
     864:	189000ef          	jal	11ec <memcpy>
     868:	01000613          	li	a2,16
     86c:	00048593          	mv	a1,s1
     870:	03010513          	add	a0,sp,48
     874:	179000ef          	jal	11ec <memcpy>

  neorv32_uart0_printf("\n-- %s --\n", tag);
     878:	000025b7          	lui	a1,0x2
     87c:	00040613          	mv	a2,s0
     880:	bc858593          	add	a1,a1,-1080 # 1bc8 <__fini_array_end+0x28>
     884:	fff50537          	lui	a0,0xfff50
     888:	051000ef          	jal	10d8 <neorv32_uart_printf>
  print_u8_mat4("A", A);
     88c:	00002537          	lui	a0,0x2
     890:	02010593          	add	a1,sp,32
     894:	bd450513          	add	a0,a0,-1068 # 1bd4 <__fini_array_end+0x34>
     898:	94dff0ef          	jal	1e4 <print_u8_mat4>
  print_u8_mat4("B", B);
     89c:	00002537          	lui	a0,0x2
     8a0:	03010593          	add	a1,sp,48
     8a4:	bd850513          	add	a0,a0,-1064 # 1bd8 <__fini_array_end+0x38>
     8a8:	93dff0ef          	jal	1e4 <print_u8_mat4>

  // single-shot
  volatile uint32_t sink=0;
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     8ac:	04010713          	add	a4,sp,64
     8b0:	01010693          	add	a3,sp,16
     8b4:	00c10613          	add	a2,sp,12
     8b8:	03010593          	add	a1,sp,48
     8bc:	02010513          	add	a0,sp,32
  volatile uint32_t sink=0;
     8c0:	00012e23          	sw	zero,28(sp)
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     8c4:	b6dff0ef          	jal	430 <bench_cfs_once>
     8c8:	01c12783          	lw	a5,28(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     8cc:	08010713          	add	a4,sp,128
     8d0:	01410613          	add	a2,sp,20
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     8d4:	00a787b3          	add	a5,a5,a0
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     8d8:	01810693          	add	a3,sp,24
     8dc:	03010593          	add	a1,sp,48
     8e0:	02010513          	add	a0,sp,32
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     8e4:	00f12e23          	sw	a5,28(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     8e8:	dedff0ef          	jal	6d4 <bench_sw_once>
     8ec:	01c12783          	lw	a5,28(sp)
  (void)sink;

  print_u32_mat4("CFS C", Ccfs);
     8f0:	04010593          	add	a1,sp,64
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     8f4:	00a787b3          	add	a5,a5,a0
     8f8:	00f12e23          	sw	a5,28(sp)
  (void)sink;
     8fc:	01c12783          	lw	a5,28(sp)
  print_u32_mat4("CFS C", Ccfs);
     900:	00002537          	lui	a0,0x2
     904:	bdc50513          	add	a0,a0,-1060 # 1bdc <__fini_array_end+0x3c>
     908:	a01ff0ef          	jal	308 <print_u32_mat4>
  print_u32_mat4("SW  C", Csw);
     90c:	00002537          	lui	a0,0x2
     910:	08010593          	add	a1,sp,128
     914:	be450513          	add	a0,a0,-1052 # 1be4 <__fini_array_end+0x44>
     918:	9f1ff0ef          	jal	308 <print_u32_mat4>
     91c:	01000713          	li	a4,16

  // match check
  int ok=1; for(int i=0;i<4;i++) for(int j=0;j<4;j++) if(Ccfs[i][j]!=Csw[i][j]) ok=0;
     920:	00100613          	li	a2,1
     924:	05000593          	li	a1,80
     928:	ff070793          	add	a5,a4,-16
     92c:	04010693          	add	a3,sp,64
     930:	00f686b3          	add	a3,a3,a5
     934:	0006a503          	lw	a0,0(a3)
     938:	08010693          	add	a3,sp,128
     93c:	00f686b3          	add	a3,a3,a5
     940:	0006a683          	lw	a3,0(a3)
     944:	00d50463          	beq	a0,a3,94c <run_case+0x12c>
     948:	00000613          	li	a2,0
     94c:	00478793          	add	a5,a5,4
     950:	fce79ee3          	bne	a5,a4,92c <run_case+0x10c>
     954:	01078713          	add	a4,a5,16
     958:	fcb718e3          	bne	a4,a1,928 <run_case+0x108>
  neorv32_uart0_printf("Match: %s\n", ok? "YES":"NO");
     95c:	20060463          	beqz	a2,b64 <run_case+0x344>
     960:	00002637          	lui	a2,0x2
     964:	bc060613          	add	a2,a2,-1088 # 1bc0 <__fini_array_end+0x20>
     968:	000025b7          	lui	a1,0x2
     96c:	bec58593          	add	a1,a1,-1044 # 1bec <__fini_array_end+0x4c>
     970:	fff50537          	lui	a0,0xfff50
     974:	764000ef          	jal	10d8 <neorv32_uart_printf>

  neorv32_uart0_printf("Single-shot:\n");
     978:	000025b7          	lui	a1,0x2
     97c:	bf858593          	add	a1,a1,-1032 # 1bf8 <__fini_array_end+0x58>
     980:	fff50537          	lui	a0,0xfff50
     984:	754000ef          	jal	10d8 <neorv32_uart_printf>
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n", cyc_hw, ins_hw);
     988:	01012683          	lw	a3,16(sp)
     98c:	00c12603          	lw	a2,12(sp)
     990:	00002cb7          	lui	s9,0x2
     994:	c08c8593          	add	a1,s9,-1016 # 1c08 <__fini_array_end+0x68>
     998:	fff50537          	lui	a0,0xfff50
     99c:	73c000ef          	jal	10d8 <neorv32_uart_printf>
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",  cyc_sw,  ins_sw);
     9a0:	01812683          	lw	a3,24(sp)
     9a4:	01412603          	lw	a2,20(sp)
     9a8:	00002c37          	lui	s8,0x2
     9ac:	c24c0593          	add	a1,s8,-988 # 1c24 <__fini_array_end+0x84>
     9b0:	fff50537          	lui	a0,0xfff50
     9b4:	724000ef          	jal	10d8 <neorv32_uart_printf>
     9b8:	01000413          	li	s0,16

  // warm-up
  for(int i=0;i<16;i++){ bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs); bench_sw_once(A,B,&cyc_sw,&ins_sw,Csw); }
     9bc:	04010713          	add	a4,sp,64
     9c0:	01010693          	add	a3,sp,16
     9c4:	00c10613          	add	a2,sp,12
     9c8:	03010593          	add	a1,sp,48
     9cc:	02010513          	add	a0,sp,32
     9d0:	a61ff0ef          	jal	430 <bench_cfs_once>
     9d4:	08010713          	add	a4,sp,128
     9d8:	01810693          	add	a3,sp,24
     9dc:	01410613          	add	a2,sp,20
     9e0:	03010593          	add	a1,sp,48
     9e4:	02010513          	add	a0,sp,32
     9e8:	fff40413          	add	s0,s0,-1
     9ec:	ce9ff0ef          	jal	6d4 <bench_sw_once>
     9f0:	fc0416e3          	bnez	s0,9bc <run_case+0x19c>
     9f4:	3e800d13          	li	s10,1000

  // averaged
  uint64_t sum_cyc_hw=0,sum_ins_hw=0,sum_cyc_sw=0,sum_ins_sw=0;
     9f8:	00000493          	li	s1,0
     9fc:	00000a93          	li	s5,0
     a00:	00000a13          	li	s4,0
     a04:	00000993          	li	s3,0
     a08:	00000b93          	li	s7,0
     a0c:	00000913          	li	s2,0
     a10:	00000b13          	li	s6,0
  for(int i=0;i<N_BENCH_ITERS;i++){
    bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     a14:	04010713          	add	a4,sp,64
     a18:	01010693          	add	a3,sp,16
     a1c:	00c10613          	add	a2,sp,12
     a20:	03010593          	add	a1,sp,48
     a24:	02010513          	add	a0,sp,32
     a28:	a09ff0ef          	jal	430 <bench_cfs_once>
    bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     a2c:	08010713          	add	a4,sp,128
     a30:	01810693          	add	a3,sp,24
     a34:	01410613          	add	a2,sp,20
     a38:	03010593          	add	a1,sp,48
     a3c:	02010513          	add	a0,sp,32
     a40:	c95ff0ef          	jal	6d4 <bench_sw_once>
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     a44:	00c12783          	lw	a5,12(sp)
  for(int i=0;i<N_BENCH_ITERS;i++){
     a48:	fffd0d13          	add	s10,s10,-1
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     a4c:	00f907b3          	add	a5,s2,a5
     a50:	0127b733          	sltu	a4,a5,s2
     a54:	00078913          	mv	s2,a5
     a58:	01012783          	lw	a5,16(sp)
     a5c:	01670b33          	add	s6,a4,s6
     a60:	00f987b3          	add	a5,s3,a5
     a64:	0137b733          	sltu	a4,a5,s3
     a68:	00078993          	mv	s3,a5
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     a6c:	01412783          	lw	a5,20(sp)
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     a70:	01770bb3          	add	s7,a4,s7
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     a74:	00f407b3          	add	a5,s0,a5
     a78:	0087b733          	sltu	a4,a5,s0
     a7c:	00078413          	mv	s0,a5
     a80:	01812783          	lw	a5,24(sp)
     a84:	01470a33          	add	s4,a4,s4
     a88:	00f487b3          	add	a5,s1,a5
     a8c:	0097b733          	sltu	a4,a5,s1
     a90:	01570ab3          	add	s5,a4,s5
     a94:	00078493          	mv	s1,a5
  for(int i=0;i<N_BENCH_ITERS;i++){
     a98:	f60d1ee3          	bnez	s10,a14 <run_case+0x1f4>
  }
  neorv32_uart0_printf("Averaged over %u iters:\n", (unsigned)N_BENCH_ITERS);
     a9c:	000025b7          	lui	a1,0x2
     aa0:	3e800613          	li	a2,1000
     aa4:	c4058593          	add	a1,a1,-960 # 1c40 <__fini_array_end+0xa0>
     aa8:	fff50537          	lui	a0,0xfff50
     aac:	62c000ef          	jal	10d8 <neorv32_uart_printf>
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n",
     ab0:	3e800613          	li	a2,1000
     ab4:	00000693          	li	a3,0
     ab8:	00098513          	mv	a0,s3
     abc:	000b8593          	mv	a1,s7
     ac0:	15d000ef          	jal	141c <__udivdi3>
     ac4:	00050993          	mv	s3,a0
     ac8:	3e800613          	li	a2,1000
     acc:	00000693          	li	a3,0
     ad0:	00090513          	mv	a0,s2
     ad4:	000b0593          	mv	a1,s6
     ad8:	145000ef          	jal	141c <__udivdi3>
     adc:	00050613          	mv	a2,a0
     ae0:	00098693          	mv	a3,s3
     ae4:	c08c8593          	add	a1,s9,-1016
     ae8:	fff50537          	lui	a0,0xfff50
     aec:	5ec000ef          	jal	10d8 <neorv32_uart_printf>
    (uint32_t)(sum_cyc_hw/N_BENCH_ITERS), (uint32_t)(sum_ins_hw/N_BENCH_ITERS));
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     af0:	3e800613          	li	a2,1000
     af4:	00000693          	li	a3,0
     af8:	00048513          	mv	a0,s1
     afc:	000a8593          	mv	a1,s5
     b00:	11d000ef          	jal	141c <__udivdi3>
     b04:	00050493          	mv	s1,a0
     b08:	3e800613          	li	a2,1000
     b0c:	00000693          	li	a3,0
     b10:	00040513          	mv	a0,s0
     b14:	000a0593          	mv	a1,s4
     b18:	105000ef          	jal	141c <__udivdi3>
    (uint32_t)(sum_cyc_sw/N_BENCH_ITERS), (uint32_t)(sum_ins_sw/N_BENCH_ITERS));
}
     b1c:	0e812403          	lw	s0,232(sp)
     b20:	0ec12083          	lw	ra,236(sp)
     b24:	0e012903          	lw	s2,224(sp)
     b28:	0dc12983          	lw	s3,220(sp)
     b2c:	0d812a03          	lw	s4,216(sp)
     b30:	0d412a83          	lw	s5,212(sp)
     b34:	0d012b03          	lw	s6,208(sp)
     b38:	0cc12b83          	lw	s7,204(sp)
     b3c:	0c412c83          	lw	s9,196(sp)
     b40:	0c012d03          	lw	s10,192(sp)
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     b44:	00048693          	mv	a3,s1
     b48:	c24c0593          	add	a1,s8,-988
}
     b4c:	0e412483          	lw	s1,228(sp)
     b50:	0c812c03          	lw	s8,200(sp)
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     b54:	00050613          	mv	a2,a0
     b58:	fff50537          	lui	a0,0xfff50
}
     b5c:	0f010113          	add	sp,sp,240
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     b60:	5780006f          	j	10d8 <neorv32_uart_printf>
  neorv32_uart0_printf("Match: %s\n", ok? "YES":"NO");
     b64:	00002637          	lui	a2,0x2
     b68:	bc460613          	add	a2,a2,-1084 # 1bc4 <__fini_array_end+0x24>
     b6c:	dfdff06f          	j	968 <run_case+0x148>

00000b70 <main>:

int main(void){
  neorv32_uart0_setup(19200,0);
     b70:	000055b7          	lui	a1,0x5
int main(void){
     b74:	f7010113          	add	sp,sp,-144
  neorv32_uart0_setup(19200,0);
     b78:	00000613          	li	a2,0
     b7c:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     b80:	fff50537          	lui	a0,0xfff50
int main(void){
     b84:	08112623          	sw	ra,140(sp)
     b88:	08812423          	sw	s0,136(sp)
  neorv32_uart0_setup(19200,0);
     b8c:	228000ef          	jal	db4 <neorv32_uart_setup>
  neorv32_uart0_printf("\n[NEORV32 CFS 4x4 MatMul - Inputs, Results, Cycles, Instructions]\n");
     b90:	000025b7          	lui	a1,0x2
     b94:	c5c58593          	add	a1,a1,-932 # 1c5c <__fini_array_end+0xbc>
     b98:	fff50537          	lui	a0,0xfff50
     b9c:	53c000ef          	jal	10d8 <neorv32_uart_printf>
  neorv32_uart0_printf("CFS base = 0x%08x, iters=%u\n",
     ba0:	000025b7          	lui	a1,0x2
     ba4:	3e800693          	li	a3,1000
     ba8:	ffeb0637          	lui	a2,0xffeb0
     bac:	ca058593          	add	a1,a1,-864 # 1ca0 <__fini_array_end+0x100>
     bb0:	fff50537          	lui	a0,0xfff50
     bb4:	524000ef          	jal	10d8 <neorv32_uart_printf>
                       (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);

  // Case 1
  const uint8_t A1[4][4]={{1,2,3,4},{5,6,7,8},{9,8,7,6},{5,4,3,2}};
     bb8:	000025b7          	lui	a1,0x2
     bbc:	cf458413          	add	s0,a1,-780 # 1cf4 <__fini_array_end+0x154>
     bc0:	01000613          	li	a2,16
     bc4:	cf458593          	add	a1,a1,-780
     bc8:	00010513          	mv	a0,sp
     bcc:	620000ef          	jal	11ec <memcpy>
  const uint8_t B1[4][4]={{5,6,7,8},{1,0,0,1},{0,1,1,0},{1,1,0,0}};
     bd0:	01040593          	add	a1,s0,16
     bd4:	01000613          	li	a2,16
     bd8:	01010513          	add	a0,sp,16
     bdc:	610000ef          	jal	11ec <memcpy>
  run_case("Case 1", A1, B1);
     be0:	00002537          	lui	a0,0x2
     be4:	01010613          	add	a2,sp,16
     be8:	00010593          	mv	a1,sp
     bec:	cc050513          	add	a0,a0,-832 # 1cc0 <__fini_array_end+0x120>
     bf0:	c31ff0ef          	jal	820 <run_case>

  // Case 2 (zeros & pattern)
  const uint8_t A2[4][4]={{0,10,0,20},{1,0,2,0},{3,0,0,4},{0,5,0,6}};
     bf4:	02040593          	add	a1,s0,32
     bf8:	01000613          	li	a2,16
     bfc:	02010513          	add	a0,sp,32
     c00:	5ec000ef          	jal	11ec <memcpy>
  const uint8_t B2[4][4]={{0,3,4,0},{5,0,0,6},{0,7,8,0},{9,0,0,1}};
     c04:	03040593          	add	a1,s0,48
     c08:	01000613          	li	a2,16
     c0c:	03010513          	add	a0,sp,48
     c10:	5dc000ef          	jal	11ec <memcpy>
  run_case("Case 2", A2, B2);
     c14:	00002537          	lui	a0,0x2
     c18:	03010613          	add	a2,sp,48
     c1c:	02010593          	add	a1,sp,32
     c20:	cc850513          	add	a0,a0,-824 # 1cc8 <__fini_array_end+0x128>
     c24:	bfdff0ef          	jal	820 <run_case>

  // Case 3 (random-ish)
  const uint8_t A3[4][4]={{12,7,3,9},{5, 9,11,4},{8, 2,4, 6},{13,2,6,10}};
     c28:	04040593          	add	a1,s0,64
     c2c:	01000613          	li	a2,16
     c30:	04010513          	add	a0,sp,64
     c34:	5b8000ef          	jal	11ec <memcpy>
  const uint8_t B3[4][4]={{10,5,1,7},{8,14,3,2},{6, 4,9,11},{2, 1,8,12}};
     c38:	05040593          	add	a1,s0,80
     c3c:	01000613          	li	a2,16
     c40:	05010513          	add	a0,sp,80
     c44:	5a8000ef          	jal	11ec <memcpy>
  run_case("Case 3", A3, B3);
     c48:	00002537          	lui	a0,0x2
     c4c:	05010613          	add	a2,sp,80
     c50:	04010593          	add	a1,sp,64
     c54:	cd050513          	add	a0,a0,-816 # 1cd0 <__fini_array_end+0x130>
     c58:	bc9ff0ef          	jal	820 <run_case>

  // Case 4 (all 255)
  const uint8_t A4[4][4]={{255,255,255,255},{255,255,255,255},{255,255,255,255},{255,255,255,255}};
     c5c:	06040593          	add	a1,s0,96
     c60:	01000613          	li	a2,16
     c64:	06010513          	add	a0,sp,96
     c68:	584000ef          	jal	11ec <memcpy>
  const uint8_t B4[4][4]={{255,255,255,255},{255,255,255,255},{255,255,255,255},{255,255,255,255}};
     c6c:	000027b7          	lui	a5,0x2
     c70:	d5478593          	add	a1,a5,-684 # 1d54 <__fini_array_end+0x1b4>
     c74:	01000613          	li	a2,16
     c78:	07010513          	add	a0,sp,112
     c7c:	570000ef          	jal	11ec <memcpy>
  run_case("Case 4", A4, B4);
     c80:	00002537          	lui	a0,0x2
     c84:	07010613          	add	a2,sp,112
     c88:	06010593          	add	a1,sp,96
     c8c:	cd850513          	add	a0,a0,-808 # 1cd8 <__fini_array_end+0x138>
     c90:	b91ff0ef          	jal	820 <run_case>

  return 0;
}
     c94:	08c12083          	lw	ra,140(sp)
     c98:	08812403          	lw	s0,136(sp)
     c9c:	00000513          	li	a0,0
     ca0:	09010113          	add	sp,sp,144
     ca4:	00008067          	ret

00000ca8 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     ca8:	fa010113          	add	sp,sp,-96
     cac:	04912a23          	sw	s1,84(sp)
     cb0:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     cb4:	000025b7          	lui	a1,0x2
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     cb8:	04812c23          	sw	s0,88(sp)
     cbc:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     cc0:	ce058593          	add	a1,a1,-800 # 1ce0 <__fini_array_end+0x140>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     cc4:	00060913          	mv	s2,a2
     cc8:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     ccc:	01000613          	li	a2,16
     cd0:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     cd4:	04112e23          	sw	ra,92(sp)
     cd8:	05312623          	sw	s3,76(sp)
     cdc:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     ce0:	50c000ef          	jal	11ec <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     ce4:	02400613          	li	a2,36
     ce8:	00000593          	li	a1,0
     cec:	01c10513          	add	a0,sp,28
     cf0:	420000ef          	jal	1110 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     cf4:	ffe90713          	add	a4,s2,-2
     cf8:	00e00793          	li	a5,14
     cfc:	03f10993          	add	s3,sp,63
     d00:	02e7f463          	bgeu	a5,a4,d28 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     d04:	00040023          	sb	zero,0(s0)
}
     d08:	05c12083          	lw	ra,92(sp)
     d0c:	05812403          	lw	s0,88(sp)
     d10:	05412483          	lw	s1,84(sp)
     d14:	05012903          	lw	s2,80(sp)
     d18:	04c12983          	lw	s3,76(sp)
     d1c:	04812a03          	lw	s4,72(sp)
     d20:	06010113          	add	sp,sp,96
     d24:	00008067          	ret
    *tmp_ptr = digits[num%base];
     d28:	00090593          	mv	a1,s2
     d2c:	00048513          	mv	a0,s1
     d30:	60d000ef          	jal	1b3c <__umodsi3>
     d34:	04050793          	add	a5,a0,64
     d38:	00278533          	add	a0,a5,sp
     d3c:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     d40:	00090593          	mv	a1,s2
     d44:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     d48:	fef98fa3          	sb	a5,-1(s3)
     d4c:	00048a13          	mv	s4,s1
    num /= base;
     d50:	5a5000ef          	jal	1af4 <__hidden___udivsi3>
    tmp_ptr--;
     d54:	fff98993          	add	s3,s3,-1
    num /= base;
     d58:	00050493          	mv	s1,a0
  } while (num != 0);
     d5c:	fd2a76e3          	bgeu	s4,s2,d28 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     d60:	00000793          	li	a5,0
     d64:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     d68:	01c10713          	add	a4,sp,28
     d6c:	00f70733          	add	a4,a4,a5
     d70:	00074703          	lbu	a4,0(a4)
     d74:	00070663          	beqz	a4,d80 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     d78:	00e40023          	sb	a4,0(s0)
      buffer++;
     d7c:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     d80:	00178793          	add	a5,a5,1
     d84:	fed792e3          	bne	a5,a3,d68 <neorv32_aux_itoa+0xc0>
     d88:	f7dff06f          	j	d04 <neorv32_aux_itoa+0x5c>

00000d8c <neorv32_cpu_get_cycle>:
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     d8c:	c80027f3          	rdcycleh	a5
     d90:	c0002573          	rdcycle	a0
     d94:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     d98:	fef59ae3          	bne	a1,a5,d8c <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     d9c:	00008067          	ret

00000da0 <neorv32_cpu_get_instret>:
     da0:	c82027f3          	rdinstreth	a5
     da4:	c0202573          	rdinstret	a0
     da8:	c82025f3          	rdinstreth	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_INSTRETH);
    tmp2 = neorv32_cpu_csr_read(CSR_INSTRET);
    tmp3 = neorv32_cpu_csr_read(CSR_INSTRETH);
    if (tmp1 == tmp3) {
     dac:	fef59ae3          	bne	a1,a5,da0 <neorv32_cpu_get_instret>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     db0:	00008067          	ret

00000db4 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     db4:	ff010113          	add	sp,sp,-16
     db8:	00812423          	sw	s0,8(sp)
     dbc:	00912223          	sw	s1,4(sp)
     dc0:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     dc4:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     dc8:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     dcc:	00050493          	mv	s1,a0
     dd0:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     dd4:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     dd8:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     ddc:	519000ef          	jal	1af4 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     de0:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     de4:	3fe00693          	li	a3,1022
     de8:	04a6e663          	bltu	a3,a0,e34 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     dec:	fff50793          	add	a5,a0,-1
     df0:	000106b7          	lui	a3,0x10
     df4:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
     df8:	00679793          	sll	a5,a5,0x6
     dfc:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e00:	07c006b7          	lui	a3,0x7c00
     e04:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     e08:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e0c:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     e10:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
     e14:	00c12083          	lw	ra,12(sp)
     e18:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e1c:	00e7e7b3          	or	a5,a5,a4
     e20:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     e24:	00f4a023          	sw	a5,0(s1)
}
     e28:	00412483          	lw	s1,4(sp)
     e2c:	01010113          	add	sp,sp,16
     e30:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     e34:	ffe70793          	add	a5,a4,-2
     e38:	ffd7f793          	and	a5,a5,-3
     e3c:	00079863          	bnez	a5,e4c <neorv32_uart_setup+0x98>
      baud_div >>= 3;
     e40:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     e44:	00170713          	add	a4,a4,1
     e48:	fa1ff06f          	j	de8 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
     e4c:	00155513          	srl	a0,a0,0x1
     e50:	ff5ff06f          	j	e44 <neorv32_uart_setup+0x90>

00000e54 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     e54:	00052783          	lw	a5,0(a0)
     e58:	00a79713          	sll	a4,a5,0xa
     e5c:	fe075ce3          	bgez	a4,e54 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     e60:	00b52223          	sw	a1,4(a0)
}
     e64:	00008067          	ret

00000e68 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     e68:	fe010113          	add	sp,sp,-32
     e6c:	00812c23          	sw	s0,24(sp)
     e70:	00912a23          	sw	s1,20(sp)
     e74:	01312623          	sw	s3,12(sp)
     e78:	00112e23          	sw	ra,28(sp)
     e7c:	01212823          	sw	s2,16(sp)
     e80:	00050493          	mv	s1,a0
     e84:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     e88:	00a00993          	li	s3,10
  while ((c = *s++)) {
     e8c:	00044903          	lbu	s2,0(s0)
     e90:	00140413          	add	s0,s0,1
     e94:	02091063          	bnez	s2,eb4 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     e98:	01c12083          	lw	ra,28(sp)
     e9c:	01812403          	lw	s0,24(sp)
     ea0:	01412483          	lw	s1,20(sp)
     ea4:	01012903          	lw	s2,16(sp)
     ea8:	00c12983          	lw	s3,12(sp)
     eac:	02010113          	add	sp,sp,32
     eb0:	00008067          	ret
    if (c == '\n') {
     eb4:	01391863          	bne	s2,s3,ec4 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     eb8:	00d00593          	li	a1,13
     ebc:	00048513          	mv	a0,s1
     ec0:	f95ff0ef          	jal	e54 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     ec4:	00090593          	mv	a1,s2
     ec8:	00048513          	mv	a0,s1
     ecc:	f89ff0ef          	jal	e54 <neorv32_uart_putc>
     ed0:	fbdff06f          	j	e8c <neorv32_uart_puts+0x24>

00000ed4 <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     ed4:	f9010113          	add	sp,sp,-112
     ed8:	06812423          	sw	s0,104(sp)
     edc:	06912223          	sw	s1,100(sp)
     ee0:	07212023          	sw	s2,96(sp)
     ee4:	05312e23          	sw	s3,92(sp)
     ee8:	00050493          	mv	s1,a0
     eec:	00058913          	mv	s2,a1
     ef0:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
     ef4:	00000593          	li	a1,0
     ef8:	02400613          	li	a2,36
     efc:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
     f00:	000029b7          	lui	s3,0x2
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     f04:	05412c23          	sw	s4,88(sp)
     f08:	05512a23          	sw	s5,84(sp)
     f0c:	05712623          	sw	s7,76(sp)
     f10:	05812423          	sw	s8,72(sp)
     f14:	05912223          	sw	s9,68(sp)
     f18:	05a12023          	sw	s10,64(sp)
     f1c:	06112623          	sw	ra,108(sp)
     f20:	05612823          	sw	s6,80(sp)
     f24:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
     f28:	02500b93          	li	s7,37
    string_buf[i] = 0;
     f2c:	1e4000ef          	jal	1110 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
     f30:	00a00c13          	li	s8,10
      c = tolower(*format++);
     f34:	d6598993          	add	s3,s3,-667 # 1d65 <_ctype_+0x1>
     f38:	00100c93          	li	s9,1
      switch (c) {
     f3c:	07000a13          	li	s4,112
     f40:	07500d13          	li	s10,117
     f44:	06300a93          	li	s5,99
  while ((c = *format++)) {
     f48:	00094d83          	lbu	s11,0(s2)
     f4c:	040d9063          	bnez	s11,f8c <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
     f50:	06c12083          	lw	ra,108(sp)
     f54:	06812403          	lw	s0,104(sp)
     f58:	06412483          	lw	s1,100(sp)
     f5c:	06012903          	lw	s2,96(sp)
     f60:	05c12983          	lw	s3,92(sp)
     f64:	05812a03          	lw	s4,88(sp)
     f68:	05412a83          	lw	s5,84(sp)
     f6c:	05012b03          	lw	s6,80(sp)
     f70:	04c12b83          	lw	s7,76(sp)
     f74:	04812c03          	lw	s8,72(sp)
     f78:	04412c83          	lw	s9,68(sp)
     f7c:	04012d03          	lw	s10,64(sp)
     f80:	03c12d83          	lw	s11,60(sp)
     f84:	07010113          	add	sp,sp,112
     f88:	00008067          	ret
    if (c == '%') {
     f8c:	137d9863          	bne	s11,s7,10bc <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
     f90:	00290b13          	add	s6,s2,2
     f94:	00194903          	lbu	s2,1(s2)
     f98:	013907b3          	add	a5,s2,s3
     f9c:	0007c783          	lbu	a5,0(a5)
     fa0:	0037f793          	and	a5,a5,3
     fa4:	01979463          	bne	a5,s9,fac <neorv32_uart_vprintf+0xd8>
     fa8:	02090913          	add	s2,s2,32
      switch (c) {
     fac:	0ff97793          	zext.b	a5,s2
     fb0:	0d478863          	beq	a5,s4,1080 <neorv32_uart_vprintf+0x1ac>
     fb4:	06fa4c63          	blt	s4,a5,102c <neorv32_uart_vprintf+0x158>
     fb8:	09578e63          	beq	a5,s5,1054 <neorv32_uart_vprintf+0x180>
     fbc:	02fac663          	blt	s5,a5,fe8 <neorv32_uart_vprintf+0x114>
     fc0:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
     fc4:	02500593          	li	a1,37
      switch (c) {
     fc8:	00e78a63          	beq	a5,a4,fdc <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
     fcc:	02500593          	li	a1,37
     fd0:	00048513          	mv	a0,s1
     fd4:	e81ff0ef          	jal	e54 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     fd8:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
     fdc:	00048513          	mv	a0,s1
     fe0:	e75ff0ef          	jal	e54 <neorv32_uart_putc>
     fe4:	0840006f          	j	1068 <neorv32_uart_vprintf+0x194>
      switch (c) {
     fe8:	06400713          	li	a4,100
     fec:	00e78663          	beq	a5,a4,ff8 <neorv32_uart_vprintf+0x124>
     ff0:	06900713          	li	a4,105
     ff4:	fce79ce3          	bne	a5,a4,fcc <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
     ff8:	00440913          	add	s2,s0,4
     ffc:	00042403          	lw	s0,0(s0)
          if (n < 0) {
    1000:	00045a63          	bgez	s0,1014 <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
    1004:	02d00593          	li	a1,45
    1008:	00048513          	mv	a0,s1
            n = -n;
    100c:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
    1010:	e45ff0ef          	jal	e54 <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
    1014:	00a00613          	li	a2,10
    1018:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    101c:	00c10513          	add	a0,sp,12
    1020:	c89ff0ef          	jal	ca8 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
    1024:	00c10593          	add	a1,sp,12
    1028:	0200006f          	j	1048 <neorv32_uart_vprintf+0x174>
      switch (c) {
    102c:	05a78263          	beq	a5,s10,1070 <neorv32_uart_vprintf+0x19c>
    1030:	07800713          	li	a4,120
    1034:	04e78663          	beq	a5,a4,1080 <neorv32_uart_vprintf+0x1ac>
    1038:	07300713          	li	a4,115
    103c:	f8e798e3          	bne	a5,a4,fcc <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1040:	00042583          	lw	a1,0(s0)
    1044:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
    1048:	00048513          	mv	a0,s1
    104c:	e1dff0ef          	jal	e68 <neorv32_uart_puts>
          break;
    1050:	0140006f          	j	1064 <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
    1054:	00044583          	lbu	a1,0(s0)
    1058:	00048513          	mv	a0,s1
    105c:	00440913          	add	s2,s0,4
    1060:	df5ff0ef          	jal	e54 <neorv32_uart_putc>
    1064:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    1068:	000b0913          	mv	s2,s6
    106c:	eddff06f          	j	f48 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
    1070:	00042583          	lw	a1,0(s0)
    1074:	00440913          	add	s2,s0,4
    1078:	00a00613          	li	a2,10
    107c:	fa1ff06f          	j	101c <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    1080:	00042583          	lw	a1,0(s0)
    1084:	01000613          	li	a2,16
    1088:	00c10513          	add	a0,sp,12
    108c:	c1dff0ef          	jal	ca8 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
    1090:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    1094:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
    1098:	2f8000ef          	jal	1390 <strlen>
    109c:	00800413          	li	s0,8
    10a0:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
    10a4:	f80400e3          	beqz	s0,1024 <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
    10a8:	03000593          	li	a1,48
    10ac:	00048513          	mv	a0,s1
    10b0:	da5ff0ef          	jal	e54 <neorv32_uart_putc>
    10b4:	fff40413          	add	s0,s0,-1
    10b8:	fedff06f          	j	10a4 <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
    10bc:	018d9863          	bne	s11,s8,10cc <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
    10c0:	00d00593          	li	a1,13
    10c4:	00048513          	mv	a0,s1
    10c8:	d8dff0ef          	jal	e54 <neorv32_uart_putc>
  while ((c = *format++)) {
    10cc:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
    10d0:	000d8593          	mv	a1,s11
    10d4:	f09ff06f          	j	fdc <neorv32_uart_vprintf+0x108>

000010d8 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    10d8:	fc010113          	add	sp,sp,-64
    10dc:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
    10e0:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    10e4:	00112e23          	sw	ra,28(sp)
    10e8:	02d12623          	sw	a3,44(sp)
    10ec:	02e12823          	sw	a4,48(sp)
    10f0:	02f12a23          	sw	a5,52(sp)
    10f4:	03012c23          	sw	a6,56(sp)
    10f8:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
    10fc:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    1100:	dd5ff0ef          	jal	ed4 <neorv32_uart_vprintf>
  va_end(args);
}
    1104:	01c12083          	lw	ra,28(sp)
    1108:	04010113          	add	sp,sp,64
    110c:	00008067          	ret

00001110 <memset>:
    1110:	00f00313          	li	t1,15
    1114:	00050713          	mv	a4,a0
    1118:	02c37e63          	bgeu	t1,a2,1154 <memset+0x44>
    111c:	00f77793          	and	a5,a4,15
    1120:	0a079063          	bnez	a5,11c0 <memset+0xb0>
    1124:	08059263          	bnez	a1,11a8 <memset+0x98>
    1128:	ff067693          	and	a3,a2,-16
    112c:	00f67613          	and	a2,a2,15
    1130:	00e686b3          	add	a3,a3,a4
    1134:	00b72023          	sw	a1,0(a4)
    1138:	00b72223          	sw	a1,4(a4)
    113c:	00b72423          	sw	a1,8(a4)
    1140:	00b72623          	sw	a1,12(a4)
    1144:	01070713          	add	a4,a4,16
    1148:	fed766e3          	bltu	a4,a3,1134 <memset+0x24>
    114c:	00061463          	bnez	a2,1154 <memset+0x44>
    1150:	00008067          	ret
    1154:	40c306b3          	sub	a3,t1,a2
    1158:	00269693          	sll	a3,a3,0x2
    115c:	00000297          	auipc	t0,0x0
    1160:	005686b3          	add	a3,a3,t0
    1164:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
    1168:	00b70723          	sb	a1,14(a4)
    116c:	00b706a3          	sb	a1,13(a4)
    1170:	00b70623          	sb	a1,12(a4)
    1174:	00b705a3          	sb	a1,11(a4)
    1178:	00b70523          	sb	a1,10(a4)
    117c:	00b704a3          	sb	a1,9(a4)
    1180:	00b70423          	sb	a1,8(a4)
    1184:	00b703a3          	sb	a1,7(a4)
    1188:	00b70323          	sb	a1,6(a4)
    118c:	00b702a3          	sb	a1,5(a4)
    1190:	00b70223          	sb	a1,4(a4)
    1194:	00b701a3          	sb	a1,3(a4)
    1198:	00b70123          	sb	a1,2(a4)
    119c:	00b700a3          	sb	a1,1(a4)
    11a0:	00b70023          	sb	a1,0(a4)
    11a4:	00008067          	ret
    11a8:	0ff5f593          	zext.b	a1,a1
    11ac:	00859693          	sll	a3,a1,0x8
    11b0:	00d5e5b3          	or	a1,a1,a3
    11b4:	01059693          	sll	a3,a1,0x10
    11b8:	00d5e5b3          	or	a1,a1,a3
    11bc:	f6dff06f          	j	1128 <memset+0x18>
    11c0:	00279693          	sll	a3,a5,0x2
    11c4:	00000297          	auipc	t0,0x0
    11c8:	005686b3          	add	a3,a3,t0
    11cc:	00008293          	mv	t0,ra
    11d0:	fa0680e7          	jalr	-96(a3)
    11d4:	00028093          	mv	ra,t0
    11d8:	ff078793          	add	a5,a5,-16
    11dc:	40f70733          	sub	a4,a4,a5
    11e0:	00f60633          	add	a2,a2,a5
    11e4:	f6c378e3          	bgeu	t1,a2,1154 <memset+0x44>
    11e8:	f3dff06f          	j	1124 <memset+0x14>

000011ec <memcpy>:
    11ec:	00a5c7b3          	xor	a5,a1,a0
    11f0:	0037f793          	and	a5,a5,3
    11f4:	00c508b3          	add	a7,a0,a2
    11f8:	06079463          	bnez	a5,1260 <memcpy+0x74>
    11fc:	00300793          	li	a5,3
    1200:	06c7f063          	bgeu	a5,a2,1260 <memcpy+0x74>
    1204:	00357793          	and	a5,a0,3
    1208:	00050713          	mv	a4,a0
    120c:	06079a63          	bnez	a5,1280 <memcpy+0x94>
    1210:	ffc8f613          	and	a2,a7,-4
    1214:	40e606b3          	sub	a3,a2,a4
    1218:	02000793          	li	a5,32
    121c:	08d7ce63          	blt	a5,a3,12b8 <memcpy+0xcc>
    1220:	00058693          	mv	a3,a1
    1224:	00070793          	mv	a5,a4
    1228:	02c77863          	bgeu	a4,a2,1258 <memcpy+0x6c>
    122c:	0006a803          	lw	a6,0(a3)
    1230:	00478793          	add	a5,a5,4
    1234:	00468693          	add	a3,a3,4
    1238:	ff07ae23          	sw	a6,-4(a5)
    123c:	fec7e8e3          	bltu	a5,a2,122c <memcpy+0x40>
    1240:	fff60793          	add	a5,a2,-1 # ffeaffff <__crt0_ram_last+0x7feae000>
    1244:	40e787b3          	sub	a5,a5,a4
    1248:	ffc7f793          	and	a5,a5,-4
    124c:	00478793          	add	a5,a5,4
    1250:	00f70733          	add	a4,a4,a5
    1254:	00f585b3          	add	a1,a1,a5
    1258:	01176863          	bltu	a4,a7,1268 <memcpy+0x7c>
    125c:	00008067          	ret
    1260:	00050713          	mv	a4,a0
    1264:	05157863          	bgeu	a0,a7,12b4 <memcpy+0xc8>
    1268:	0005c783          	lbu	a5,0(a1)
    126c:	00170713          	add	a4,a4,1
    1270:	00158593          	add	a1,a1,1
    1274:	fef70fa3          	sb	a5,-1(a4)
    1278:	fee898e3          	bne	a7,a4,1268 <memcpy+0x7c>
    127c:	00008067          	ret
    1280:	0005c683          	lbu	a3,0(a1)
    1284:	00170713          	add	a4,a4,1
    1288:	00377793          	and	a5,a4,3
    128c:	fed70fa3          	sb	a3,-1(a4)
    1290:	00158593          	add	a1,a1,1
    1294:	f6078ee3          	beqz	a5,1210 <memcpy+0x24>
    1298:	0005c683          	lbu	a3,0(a1)
    129c:	00170713          	add	a4,a4,1
    12a0:	00377793          	and	a5,a4,3
    12a4:	fed70fa3          	sb	a3,-1(a4)
    12a8:	00158593          	add	a1,a1,1
    12ac:	fc079ae3          	bnez	a5,1280 <memcpy+0x94>
    12b0:	f61ff06f          	j	1210 <memcpy+0x24>
    12b4:	00008067          	ret
    12b8:	ff010113          	add	sp,sp,-16
    12bc:	00812623          	sw	s0,12(sp)
    12c0:	02000413          	li	s0,32
    12c4:	0005a383          	lw	t2,0(a1)
    12c8:	0045a283          	lw	t0,4(a1)
    12cc:	0085af83          	lw	t6,8(a1)
    12d0:	00c5af03          	lw	t5,12(a1)
    12d4:	0105ae83          	lw	t4,16(a1)
    12d8:	0145ae03          	lw	t3,20(a1)
    12dc:	0185a303          	lw	t1,24(a1)
    12e0:	01c5a803          	lw	a6,28(a1)
    12e4:	0205a683          	lw	a3,32(a1)
    12e8:	02470713          	add	a4,a4,36
    12ec:	40e607b3          	sub	a5,a2,a4
    12f0:	fc772e23          	sw	t2,-36(a4)
    12f4:	fe572023          	sw	t0,-32(a4)
    12f8:	fff72223          	sw	t6,-28(a4)
    12fc:	ffe72423          	sw	t5,-24(a4)
    1300:	ffd72623          	sw	t4,-20(a4)
    1304:	ffc72823          	sw	t3,-16(a4)
    1308:	fe672a23          	sw	t1,-12(a4)
    130c:	ff072c23          	sw	a6,-8(a4)
    1310:	fed72e23          	sw	a3,-4(a4)
    1314:	02458593          	add	a1,a1,36
    1318:	faf446e3          	blt	s0,a5,12c4 <memcpy+0xd8>
    131c:	00058693          	mv	a3,a1
    1320:	00070793          	mv	a5,a4
    1324:	02c77863          	bgeu	a4,a2,1354 <memcpy+0x168>
    1328:	0006a803          	lw	a6,0(a3)
    132c:	00478793          	add	a5,a5,4
    1330:	00468693          	add	a3,a3,4
    1334:	ff07ae23          	sw	a6,-4(a5)
    1338:	fec7e8e3          	bltu	a5,a2,1328 <memcpy+0x13c>
    133c:	fff60793          	add	a5,a2,-1
    1340:	40e787b3          	sub	a5,a5,a4
    1344:	ffc7f793          	and	a5,a5,-4
    1348:	00478793          	add	a5,a5,4
    134c:	00f70733          	add	a4,a4,a5
    1350:	00f585b3          	add	a1,a1,a5
    1354:	01176863          	bltu	a4,a7,1364 <memcpy+0x178>
    1358:	00c12403          	lw	s0,12(sp)
    135c:	01010113          	add	sp,sp,16
    1360:	00008067          	ret
    1364:	0005c783          	lbu	a5,0(a1)
    1368:	00170713          	add	a4,a4,1
    136c:	00158593          	add	a1,a1,1
    1370:	fef70fa3          	sb	a5,-1(a4)
    1374:	fee882e3          	beq	a7,a4,1358 <memcpy+0x16c>
    1378:	0005c783          	lbu	a5,0(a1)
    137c:	00170713          	add	a4,a4,1
    1380:	00158593          	add	a1,a1,1
    1384:	fef70fa3          	sb	a5,-1(a4)
    1388:	fce89ee3          	bne	a7,a4,1364 <memcpy+0x178>
    138c:	fcdff06f          	j	1358 <memcpy+0x16c>

00001390 <strlen>:
    1390:	00357793          	and	a5,a0,3
    1394:	00050713          	mv	a4,a0
    1398:	04079c63          	bnez	a5,13f0 <strlen+0x60>
    139c:	7f7f86b7          	lui	a3,0x7f7f8
    13a0:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
    13a4:	fff00593          	li	a1,-1
    13a8:	00072603          	lw	a2,0(a4)
    13ac:	00470713          	add	a4,a4,4
    13b0:	00d677b3          	and	a5,a2,a3
    13b4:	00d787b3          	add	a5,a5,a3
    13b8:	00c7e7b3          	or	a5,a5,a2
    13bc:	00d7e7b3          	or	a5,a5,a3
    13c0:	feb784e3          	beq	a5,a1,13a8 <strlen+0x18>
    13c4:	ffc74683          	lbu	a3,-4(a4)
    13c8:	40a707b3          	sub	a5,a4,a0
    13cc:	04068463          	beqz	a3,1414 <strlen+0x84>
    13d0:	ffd74683          	lbu	a3,-3(a4)
    13d4:	02068c63          	beqz	a3,140c <strlen+0x7c>
    13d8:	ffe74503          	lbu	a0,-2(a4)
    13dc:	00a03533          	snez	a0,a0
    13e0:	00f50533          	add	a0,a0,a5
    13e4:	ffe50513          	add	a0,a0,-2
    13e8:	00008067          	ret
    13ec:	fa0688e3          	beqz	a3,139c <strlen+0xc>
    13f0:	00074783          	lbu	a5,0(a4)
    13f4:	00170713          	add	a4,a4,1
    13f8:	00377693          	and	a3,a4,3
    13fc:	fe0798e3          	bnez	a5,13ec <strlen+0x5c>
    1400:	40a70733          	sub	a4,a4,a0
    1404:	fff70513          	add	a0,a4,-1
    1408:	00008067          	ret
    140c:	ffd78513          	add	a0,a5,-3
    1410:	00008067          	ret
    1414:	ffc78513          	add	a0,a5,-4
    1418:	00008067          	ret

0000141c <__udivdi3>:
    141c:	fd010113          	add	sp,sp,-48
    1420:	01312e23          	sw	s3,28(sp)
    1424:	02112623          	sw	ra,44(sp)
    1428:	01612823          	sw	s6,16(sp)
    142c:	00050993          	mv	s3,a0
    1430:	16069663          	bnez	a3,159c <__udivdi3+0x180>
    1434:	02812423          	sw	s0,40(sp)
    1438:	01512a23          	sw	s5,20(sp)
    143c:	02912223          	sw	s1,36(sp)
    1440:	03212023          	sw	s2,32(sp)
    1444:	01412c23          	sw	s4,24(sp)
    1448:	00060a93          	mv	s5,a2
    144c:	00050413          	mv	s0,a0
    1450:	1cc5f063          	bgeu	a1,a2,1610 <__udivdi3+0x1f4>
    1454:	000107b7          	lui	a5,0x10
    1458:	00058493          	mv	s1,a1
    145c:	2af66e63          	bltu	a2,a5,1718 <__udivdi3+0x2fc>
    1460:	010007b7          	lui	a5,0x1000
    1464:	01800713          	li	a4,24
    1468:	00f67463          	bgeu	a2,a5,1470 <__udivdi3+0x54>
    146c:	01000713          	li	a4,16
    1470:	00e656b3          	srl	a3,a2,a4
    1474:	00001797          	auipc	a5,0x1
    1478:	9f478793          	add	a5,a5,-1548 # 1e68 <__clz_tab>
    147c:	00d787b3          	add	a5,a5,a3
    1480:	0007c783          	lbu	a5,0(a5)
    1484:	02000693          	li	a3,32
    1488:	00e787b3          	add	a5,a5,a4
    148c:	40f68733          	sub	a4,a3,a5
    1490:	00f68c63          	beq	a3,a5,14a8 <__udivdi3+0x8c>
    1494:	00e594b3          	sll	s1,a1,a4
    1498:	00f9d7b3          	srl	a5,s3,a5
    149c:	00e61ab3          	sll	s5,a2,a4
    14a0:	0097e4b3          	or	s1,a5,s1
    14a4:	00e99433          	sll	s0,s3,a4
    14a8:	010ada13          	srl	s4,s5,0x10
    14ac:	000a0593          	mv	a1,s4
    14b0:	00048513          	mv	a0,s1
    14b4:	010a9b13          	sll	s6,s5,0x10
    14b8:	63c000ef          	jal	1af4 <__hidden___udivsi3>
    14bc:	010b5b13          	srl	s6,s6,0x10
    14c0:	00050593          	mv	a1,a0
    14c4:	00050913          	mv	s2,a0
    14c8:	000b0513          	mv	a0,s6
    14cc:	5fc000ef          	jal	1ac8 <__mulsi3>
    14d0:	00050793          	mv	a5,a0
    14d4:	000a0593          	mv	a1,s4
    14d8:	00048513          	mv	a0,s1
    14dc:	00078493          	mv	s1,a5
    14e0:	65c000ef          	jal	1b3c <__umodsi3>
    14e4:	01051513          	sll	a0,a0,0x10
    14e8:	01045793          	srl	a5,s0,0x10
    14ec:	00a7e7b3          	or	a5,a5,a0
    14f0:	0097fc63          	bgeu	a5,s1,1508 <__udivdi3+0xec>
    14f4:	00fa87b3          	add	a5,s5,a5
    14f8:	fff90713          	add	a4,s2,-1
    14fc:	0157e463          	bltu	a5,s5,1504 <__udivdi3+0xe8>
    1500:	5a97e863          	bltu	a5,s1,1ab0 <__udivdi3+0x694>
    1504:	00070913          	mv	s2,a4
    1508:	409784b3          	sub	s1,a5,s1
    150c:	000a0593          	mv	a1,s4
    1510:	00048513          	mv	a0,s1
    1514:	5e0000ef          	jal	1af4 <__hidden___udivsi3>
    1518:	00050593          	mv	a1,a0
    151c:	00050993          	mv	s3,a0
    1520:	000b0513          	mv	a0,s6
    1524:	5a4000ef          	jal	1ac8 <__mulsi3>
    1528:	00050793          	mv	a5,a0
    152c:	000a0593          	mv	a1,s4
    1530:	00048513          	mv	a0,s1
    1534:	01041413          	sll	s0,s0,0x10
    1538:	00078493          	mv	s1,a5
    153c:	600000ef          	jal	1b3c <__umodsi3>
    1540:	01051513          	sll	a0,a0,0x10
    1544:	01045413          	srl	s0,s0,0x10
    1548:	00a46433          	or	s0,s0,a0
    154c:	00947c63          	bgeu	s0,s1,1564 <__udivdi3+0x148>
    1550:	008a8433          	add	s0,s5,s0
    1554:	fff98793          	add	a5,s3,-1
    1558:	4d546e63          	bltu	s0,s5,1a34 <__udivdi3+0x618>
    155c:	ffe98993          	add	s3,s3,-2
    1560:	4c947a63          	bgeu	s0,s1,1a34 <__udivdi3+0x618>
    1564:	01091613          	sll	a2,s2,0x10
    1568:	01366533          	or	a0,a2,s3
    156c:	00000b13          	li	s6,0
    1570:	02812403          	lw	s0,40(sp)
    1574:	02c12083          	lw	ra,44(sp)
    1578:	02412483          	lw	s1,36(sp)
    157c:	02012903          	lw	s2,32(sp)
    1580:	01812a03          	lw	s4,24(sp)
    1584:	01412a83          	lw	s5,20(sp)
    1588:	01c12983          	lw	s3,28(sp)
    158c:	000b0593          	mv	a1,s6
    1590:	01012b03          	lw	s6,16(sp)
    1594:	03010113          	add	sp,sp,48
    1598:	00008067          	ret
    159c:	02d5f263          	bgeu	a1,a3,15c0 <__udivdi3+0x1a4>
    15a0:	00000b13          	li	s6,0
    15a4:	00000513          	li	a0,0
    15a8:	02c12083          	lw	ra,44(sp)
    15ac:	01c12983          	lw	s3,28(sp)
    15b0:	000b0593          	mv	a1,s6
    15b4:	01012b03          	lw	s6,16(sp)
    15b8:	03010113          	add	sp,sp,48
    15bc:	00008067          	ret
    15c0:	000107b7          	lui	a5,0x10
    15c4:	26f6ee63          	bltu	a3,a5,1840 <__udivdi3+0x424>
    15c8:	01000737          	lui	a4,0x1000
    15cc:	01800793          	li	a5,24
    15d0:	00e6f463          	bgeu	a3,a4,15d8 <__udivdi3+0x1bc>
    15d4:	01000793          	li	a5,16
    15d8:	00f6d533          	srl	a0,a3,a5
    15dc:	00001717          	auipc	a4,0x1
    15e0:	88c70713          	add	a4,a4,-1908 # 1e68 <__clz_tab>
    15e4:	00a70733          	add	a4,a4,a0
    15e8:	00074703          	lbu	a4,0(a4)
    15ec:	02000513          	li	a0,32
    15f0:	00f70733          	add	a4,a4,a5
    15f4:	40e50b33          	sub	s6,a0,a4
    15f8:	26e51c63          	bne	a0,a4,1870 <__udivdi3+0x454>
    15fc:	46b6ee63          	bltu	a3,a1,1a78 <__udivdi3+0x65c>
    1600:	00c9b533          	sltu	a0,s3,a2
    1604:	00153513          	seqz	a0,a0
    1608:	00000b13          	li	s6,0
    160c:	f9dff06f          	j	15a8 <__udivdi3+0x18c>
    1610:	10060c63          	beqz	a2,1728 <__udivdi3+0x30c>
    1614:	000107b7          	lui	a5,0x10
    1618:	44f67663          	bgeu	a2,a5,1a64 <__udivdi3+0x648>
    161c:	10063713          	sltiu	a4,a2,256
    1620:	00173713          	seqz	a4,a4
    1624:	00371713          	sll	a4,a4,0x3
    1628:	00e656b3          	srl	a3,a2,a4
    162c:	00001797          	auipc	a5,0x1
    1630:	83c78793          	add	a5,a5,-1988 # 1e68 <__clz_tab>
    1634:	00d787b3          	add	a5,a5,a3
    1638:	0007c483          	lbu	s1,0(a5)
    163c:	02000793          	li	a5,32
    1640:	00e484b3          	add	s1,s1,a4
    1644:	40978733          	sub	a4,a5,s1
    1648:	10979463          	bne	a5,s1,1750 <__udivdi3+0x334>
    164c:	01061a13          	sll	s4,a2,0x10
    1650:	40c584b3          	sub	s1,a1,a2
    1654:	01065913          	srl	s2,a2,0x10
    1658:	010a5a13          	srl	s4,s4,0x10
    165c:	00100b13          	li	s6,1
    1660:	00090593          	mv	a1,s2
    1664:	00048513          	mv	a0,s1
    1668:	48c000ef          	jal	1af4 <__hidden___udivsi3>
    166c:	000a0593          	mv	a1,s4
    1670:	00050993          	mv	s3,a0
    1674:	454000ef          	jal	1ac8 <__mulsi3>
    1678:	00050793          	mv	a5,a0
    167c:	00090593          	mv	a1,s2
    1680:	00048513          	mv	a0,s1
    1684:	00078493          	mv	s1,a5
    1688:	4b4000ef          	jal	1b3c <__umodsi3>
    168c:	01051513          	sll	a0,a0,0x10
    1690:	01045793          	srl	a5,s0,0x10
    1694:	00a7e7b3          	or	a5,a5,a0
    1698:	0097fc63          	bgeu	a5,s1,16b0 <__udivdi3+0x294>
    169c:	00fa87b3          	add	a5,s5,a5
    16a0:	fff98713          	add	a4,s3,-1
    16a4:	0157e463          	bltu	a5,s5,16ac <__udivdi3+0x290>
    16a8:	3e97ee63          	bltu	a5,s1,1aa4 <__udivdi3+0x688>
    16ac:	00070993          	mv	s3,a4
    16b0:	409784b3          	sub	s1,a5,s1
    16b4:	00090593          	mv	a1,s2
    16b8:	00048513          	mv	a0,s1
    16bc:	438000ef          	jal	1af4 <__hidden___udivsi3>
    16c0:	000a0593          	mv	a1,s4
    16c4:	00050a13          	mv	s4,a0
    16c8:	400000ef          	jal	1ac8 <__mulsi3>
    16cc:	00050793          	mv	a5,a0
    16d0:	00090593          	mv	a1,s2
    16d4:	00048513          	mv	a0,s1
    16d8:	01041413          	sll	s0,s0,0x10
    16dc:	00078493          	mv	s1,a5
    16e0:	45c000ef          	jal	1b3c <__umodsi3>
    16e4:	01051513          	sll	a0,a0,0x10
    16e8:	01045413          	srl	s0,s0,0x10
    16ec:	00a46433          	or	s0,s0,a0
    16f0:	00947e63          	bgeu	s0,s1,170c <__udivdi3+0x2f0>
    16f4:	008a8433          	add	s0,s5,s0
    16f8:	fffa0793          	add	a5,s4,-1
    16fc:	01546663          	bltu	s0,s5,1708 <__udivdi3+0x2ec>
    1700:	ffea0a13          	add	s4,s4,-2
    1704:	00946463          	bltu	s0,s1,170c <__udivdi3+0x2f0>
    1708:	00078a13          	mv	s4,a5
    170c:	01099613          	sll	a2,s3,0x10
    1710:	01466533          	or	a0,a2,s4
    1714:	e5dff06f          	j	1570 <__udivdi3+0x154>
    1718:	10063713          	sltiu	a4,a2,256
    171c:	00173713          	seqz	a4,a4
    1720:	00371713          	sll	a4,a4,0x3
    1724:	d4dff06f          	j	1470 <__udivdi3+0x54>
    1728:	00000693          	li	a3,0
    172c:	00000797          	auipc	a5,0x0
    1730:	73c78793          	add	a5,a5,1852 # 1e68 <__clz_tab>
    1734:	00d787b3          	add	a5,a5,a3
    1738:	0007c483          	lbu	s1,0(a5)
    173c:	00000713          	li	a4,0
    1740:	02000793          	li	a5,32
    1744:	00e484b3          	add	s1,s1,a4
    1748:	40978733          	sub	a4,a5,s1
    174c:	f09780e3          	beq	a5,s1,164c <__udivdi3+0x230>
    1750:	00e61ab3          	sll	s5,a2,a4
    1754:	01712623          	sw	s7,12(sp)
    1758:	010ad913          	srl	s2,s5,0x10
    175c:	0095dbb3          	srl	s7,a1,s1
    1760:	00e597b3          	sll	a5,a1,a4
    1764:	0099d4b3          	srl	s1,s3,s1
    1768:	00090593          	mv	a1,s2
    176c:	000b8513          	mv	a0,s7
    1770:	010a9a13          	sll	s4,s5,0x10
    1774:	00f4e4b3          	or	s1,s1,a5
    1778:	00e99433          	sll	s0,s3,a4
    177c:	010a5a13          	srl	s4,s4,0x10
    1780:	374000ef          	jal	1af4 <__hidden___udivsi3>
    1784:	00050593          	mv	a1,a0
    1788:	00050b13          	mv	s6,a0
    178c:	000a0513          	mv	a0,s4
    1790:	338000ef          	jal	1ac8 <__mulsi3>
    1794:	00050993          	mv	s3,a0
    1798:	00090593          	mv	a1,s2
    179c:	000b8513          	mv	a0,s7
    17a0:	39c000ef          	jal	1b3c <__umodsi3>
    17a4:	01051513          	sll	a0,a0,0x10
    17a8:	0104d793          	srl	a5,s1,0x10
    17ac:	00a7e7b3          	or	a5,a5,a0
    17b0:	0137fe63          	bgeu	a5,s3,17cc <__udivdi3+0x3b0>
    17b4:	00fa87b3          	add	a5,s5,a5
    17b8:	fffb0713          	add	a4,s6,-1
    17bc:	2d57ec63          	bltu	a5,s5,1a94 <__udivdi3+0x678>
    17c0:	2d37fa63          	bgeu	a5,s3,1a94 <__udivdi3+0x678>
    17c4:	ffeb0b13          	add	s6,s6,-2
    17c8:	015787b3          	add	a5,a5,s5
    17cc:	413789b3          	sub	s3,a5,s3
    17d0:	00090593          	mv	a1,s2
    17d4:	00098513          	mv	a0,s3
    17d8:	31c000ef          	jal	1af4 <__hidden___udivsi3>
    17dc:	00050593          	mv	a1,a0
    17e0:	00050b93          	mv	s7,a0
    17e4:	000a0513          	mv	a0,s4
    17e8:	2e0000ef          	jal	1ac8 <__mulsi3>
    17ec:	00050793          	mv	a5,a0
    17f0:	00090593          	mv	a1,s2
    17f4:	00098513          	mv	a0,s3
    17f8:	01049493          	sll	s1,s1,0x10
    17fc:	00078993          	mv	s3,a5
    1800:	33c000ef          	jal	1b3c <__umodsi3>
    1804:	01051513          	sll	a0,a0,0x10
    1808:	0104d493          	srl	s1,s1,0x10
    180c:	00a4e4b3          	or	s1,s1,a0
    1810:	0134fe63          	bgeu	s1,s3,182c <__udivdi3+0x410>
    1814:	009a84b3          	add	s1,s5,s1
    1818:	fffb8793          	add	a5,s7,-1
    181c:	2754e463          	bltu	s1,s5,1a84 <__udivdi3+0x668>
    1820:	2734f263          	bgeu	s1,s3,1a84 <__udivdi3+0x668>
    1824:	ffeb8b93          	add	s7,s7,-2
    1828:	015484b3          	add	s1,s1,s5
    182c:	010b1b13          	sll	s6,s6,0x10
    1830:	017b6b33          	or	s6,s6,s7
    1834:	413484b3          	sub	s1,s1,s3
    1838:	00c12b83          	lw	s7,12(sp)
    183c:	e25ff06f          	j	1660 <__udivdi3+0x244>
    1840:	1006b793          	sltiu	a5,a3,256
    1844:	0017b793          	seqz	a5,a5
    1848:	00379793          	sll	a5,a5,0x3
    184c:	00f6d533          	srl	a0,a3,a5
    1850:	00000717          	auipc	a4,0x0
    1854:	61870713          	add	a4,a4,1560 # 1e68 <__clz_tab>
    1858:	00a70733          	add	a4,a4,a0
    185c:	00074703          	lbu	a4,0(a4)
    1860:	02000513          	li	a0,32
    1864:	00f70733          	add	a4,a4,a5
    1868:	40e50b33          	sub	s6,a0,a4
    186c:	d8e508e3          	beq	a0,a4,15fc <__udivdi3+0x1e0>
    1870:	016696b3          	sll	a3,a3,s6
    1874:	01912223          	sw	s9,4(sp)
    1878:	00e65cb3          	srl	s9,a2,a4
    187c:	00dcecb3          	or	s9,s9,a3
    1880:	01512a23          	sw	s5,20(sp)
    1884:	01712623          	sw	s7,12(sp)
    1888:	010cda93          	srl	s5,s9,0x10
    188c:	00e5dbb3          	srl	s7,a1,a4
    1890:	016597b3          	sll	a5,a1,s6
    1894:	00e9d733          	srl	a4,s3,a4
    1898:	01812423          	sw	s8,8(sp)
    189c:	000a8593          	mv	a1,s5
    18a0:	000b8513          	mv	a0,s7
    18a4:	010c9c13          	sll	s8,s9,0x10
    18a8:	02812423          	sw	s0,40(sp)
    18ac:	02912223          	sw	s1,36(sp)
    18b0:	03212023          	sw	s2,32(sp)
    18b4:	00f764b3          	or	s1,a4,a5
    18b8:	01661933          	sll	s2,a2,s6
    18bc:	01412c23          	sw	s4,24(sp)
    18c0:	010c5c13          	srl	s8,s8,0x10
    18c4:	230000ef          	jal	1af4 <__hidden___udivsi3>
    18c8:	00050593          	mv	a1,a0
    18cc:	00050413          	mv	s0,a0
    18d0:	000c0513          	mv	a0,s8
    18d4:	1f4000ef          	jal	1ac8 <__mulsi3>
    18d8:	00050a13          	mv	s4,a0
    18dc:	000a8593          	mv	a1,s5
    18e0:	000b8513          	mv	a0,s7
    18e4:	258000ef          	jal	1b3c <__umodsi3>
    18e8:	01051513          	sll	a0,a0,0x10
    18ec:	0104d793          	srl	a5,s1,0x10
    18f0:	00a7e7b3          	or	a5,a5,a0
    18f4:	0147fe63          	bgeu	a5,s4,1910 <__udivdi3+0x4f4>
    18f8:	00fc87b3          	add	a5,s9,a5
    18fc:	fff40713          	add	a4,s0,-1
    1900:	1997ee63          	bltu	a5,s9,1a9c <__udivdi3+0x680>
    1904:	1947fc63          	bgeu	a5,s4,1a9c <__udivdi3+0x680>
    1908:	ffe40413          	add	s0,s0,-2
    190c:	019787b3          	add	a5,a5,s9
    1910:	41478a33          	sub	s4,a5,s4
    1914:	000a8593          	mv	a1,s5
    1918:	000a0513          	mv	a0,s4
    191c:	1d8000ef          	jal	1af4 <__hidden___udivsi3>
    1920:	00050593          	mv	a1,a0
    1924:	00050b93          	mv	s7,a0
    1928:	000c0513          	mv	a0,s8
    192c:	19c000ef          	jal	1ac8 <__mulsi3>
    1930:	00050793          	mv	a5,a0
    1934:	000a8593          	mv	a1,s5
    1938:	000a0513          	mv	a0,s4
    193c:	00078a13          	mv	s4,a5
    1940:	1fc000ef          	jal	1b3c <__umodsi3>
    1944:	01049713          	sll	a4,s1,0x10
    1948:	01051513          	sll	a0,a0,0x10
    194c:	01075713          	srl	a4,a4,0x10
    1950:	00a76733          	or	a4,a4,a0
    1954:	01477e63          	bgeu	a4,s4,1970 <__udivdi3+0x554>
    1958:	00ec8733          	add	a4,s9,a4
    195c:	fffb8793          	add	a5,s7,-1
    1960:	13976663          	bltu	a4,s9,1a8c <__udivdi3+0x670>
    1964:	13477463          	bgeu	a4,s4,1a8c <__udivdi3+0x670>
    1968:	ffeb8b93          	add	s7,s7,-2
    196c:	01970733          	add	a4,a4,s9
    1970:	00010e37          	lui	t3,0x10
    1974:	01041413          	sll	s0,s0,0x10
    1978:	01746433          	or	s0,s0,s7
    197c:	fffe0793          	add	a5,t3,-1 # ffff <__neorv32_rom_size+0xbfff>
    1980:	00f47833          	and	a6,s0,a5
    1984:	00f977b3          	and	a5,s2,a5
    1988:	41470733          	sub	a4,a4,s4
    198c:	01045e93          	srl	t4,s0,0x10
    1990:	01095913          	srl	s2,s2,0x10
    1994:	00080513          	mv	a0,a6
    1998:	00078593          	mv	a1,a5
    199c:	12c000ef          	jal	1ac8 <__mulsi3>
    19a0:	00050313          	mv	t1,a0
    19a4:	00090593          	mv	a1,s2
    19a8:	00080513          	mv	a0,a6
    19ac:	11c000ef          	jal	1ac8 <__mulsi3>
    19b0:	00050813          	mv	a6,a0
    19b4:	00078593          	mv	a1,a5
    19b8:	000e8513          	mv	a0,t4
    19bc:	10c000ef          	jal	1ac8 <__mulsi3>
    19c0:	00050893          	mv	a7,a0
    19c4:	00090593          	mv	a1,s2
    19c8:	000e8513          	mv	a0,t4
    19cc:	0fc000ef          	jal	1ac8 <__mulsi3>
    19d0:	01035793          	srl	a5,t1,0x10
    19d4:	01180833          	add	a6,a6,a7
    19d8:	010787b3          	add	a5,a5,a6
    19dc:	0117f463          	bgeu	a5,a7,19e4 <__udivdi3+0x5c8>
    19e0:	01c50533          	add	a0,a0,t3
    19e4:	0107d693          	srl	a3,a5,0x10
    19e8:	00a686b3          	add	a3,a3,a0
    19ec:	06d76863          	bltu	a4,a3,1a5c <__udivdi3+0x640>
    19f0:	04d70663          	beq	a4,a3,1a3c <__udivdi3+0x620>
    19f4:	00040513          	mv	a0,s0
    19f8:	02812403          	lw	s0,40(sp)
    19fc:	02c12083          	lw	ra,44(sp)
    1a00:	00000b13          	li	s6,0
    1a04:	02412483          	lw	s1,36(sp)
    1a08:	02012903          	lw	s2,32(sp)
    1a0c:	01812a03          	lw	s4,24(sp)
    1a10:	01412a83          	lw	s5,20(sp)
    1a14:	00c12b83          	lw	s7,12(sp)
    1a18:	00812c03          	lw	s8,8(sp)
    1a1c:	00412c83          	lw	s9,4(sp)
    1a20:	01c12983          	lw	s3,28(sp)
    1a24:	000b0593          	mv	a1,s6
    1a28:	01012b03          	lw	s6,16(sp)
    1a2c:	03010113          	add	sp,sp,48
    1a30:	00008067          	ret
    1a34:	00078993          	mv	s3,a5
    1a38:	b2dff06f          	j	1564 <__udivdi3+0x148>
    1a3c:	00010737          	lui	a4,0x10
    1a40:	fff70713          	add	a4,a4,-1 # ffff <__neorv32_rom_size+0xbfff>
    1a44:	00e7f7b3          	and	a5,a5,a4
    1a48:	01079793          	sll	a5,a5,0x10
    1a4c:	00e37333          	and	t1,t1,a4
    1a50:	01699533          	sll	a0,s3,s6
    1a54:	006787b3          	add	a5,a5,t1
    1a58:	f8f57ee3          	bgeu	a0,a5,19f4 <__udivdi3+0x5d8>
    1a5c:	fff40513          	add	a0,s0,-1
    1a60:	f99ff06f          	j	19f8 <__udivdi3+0x5dc>
    1a64:	010007b7          	lui	a5,0x1000
    1a68:	04f67a63          	bgeu	a2,a5,1abc <__udivdi3+0x6a0>
    1a6c:	01065693          	srl	a3,a2,0x10
    1a70:	01000713          	li	a4,16
    1a74:	bb9ff06f          	j	162c <__udivdi3+0x210>
    1a78:	00000b13          	li	s6,0
    1a7c:	00100513          	li	a0,1
    1a80:	b29ff06f          	j	15a8 <__udivdi3+0x18c>
    1a84:	00078b93          	mv	s7,a5
    1a88:	da5ff06f          	j	182c <__udivdi3+0x410>
    1a8c:	00078b93          	mv	s7,a5
    1a90:	ee1ff06f          	j	1970 <__udivdi3+0x554>
    1a94:	00070b13          	mv	s6,a4
    1a98:	d35ff06f          	j	17cc <__udivdi3+0x3b0>
    1a9c:	00070413          	mv	s0,a4
    1aa0:	e71ff06f          	j	1910 <__udivdi3+0x4f4>
    1aa4:	ffe98993          	add	s3,s3,-2
    1aa8:	015787b3          	add	a5,a5,s5
    1aac:	c05ff06f          	j	16b0 <__udivdi3+0x294>
    1ab0:	ffe90913          	add	s2,s2,-2
    1ab4:	015787b3          	add	a5,a5,s5
    1ab8:	a51ff06f          	j	1508 <__udivdi3+0xec>
    1abc:	01865693          	srl	a3,a2,0x18
    1ac0:	01800713          	li	a4,24
    1ac4:	b69ff06f          	j	162c <__udivdi3+0x210>

00001ac8 <__mulsi3>:
    1ac8:	00050613          	mv	a2,a0
    1acc:	00000513          	li	a0,0
    1ad0:	0015f693          	and	a3,a1,1
    1ad4:	00068463          	beqz	a3,1adc <__mulsi3+0x14>
    1ad8:	00c50533          	add	a0,a0,a2
    1adc:	0015d593          	srl	a1,a1,0x1
    1ae0:	00161613          	sll	a2,a2,0x1
    1ae4:	fe0596e3          	bnez	a1,1ad0 <__mulsi3+0x8>
    1ae8:	00008067          	ret

00001aec <__divsi3>:
    1aec:	06054063          	bltz	a0,1b4c <__umodsi3+0x10>
    1af0:	0605c663          	bltz	a1,1b5c <__umodsi3+0x20>

00001af4 <__hidden___udivsi3>:
    1af4:	00058613          	mv	a2,a1
    1af8:	00050593          	mv	a1,a0
    1afc:	fff00513          	li	a0,-1
    1b00:	02060c63          	beqz	a2,1b38 <__hidden___udivsi3+0x44>
    1b04:	00100693          	li	a3,1
    1b08:	00b67a63          	bgeu	a2,a1,1b1c <__hidden___udivsi3+0x28>
    1b0c:	00c05863          	blez	a2,1b1c <__hidden___udivsi3+0x28>
    1b10:	00161613          	sll	a2,a2,0x1
    1b14:	00169693          	sll	a3,a3,0x1
    1b18:	feb66ae3          	bltu	a2,a1,1b0c <__hidden___udivsi3+0x18>
    1b1c:	00000513          	li	a0,0
    1b20:	00c5e663          	bltu	a1,a2,1b2c <__hidden___udivsi3+0x38>
    1b24:	40c585b3          	sub	a1,a1,a2
    1b28:	00d56533          	or	a0,a0,a3
    1b2c:	0016d693          	srl	a3,a3,0x1
    1b30:	00165613          	srl	a2,a2,0x1
    1b34:	fe0696e3          	bnez	a3,1b20 <__hidden___udivsi3+0x2c>
    1b38:	00008067          	ret

00001b3c <__umodsi3>:
    1b3c:	00008293          	mv	t0,ra
    1b40:	fb5ff0ef          	jal	1af4 <__hidden___udivsi3>
    1b44:	00058513          	mv	a0,a1
    1b48:	00028067          	jr	t0 # 11c4 <memset+0xb4>
    1b4c:	40a00533          	neg	a0,a0
    1b50:	00b04863          	bgtz	a1,1b60 <__umodsi3+0x24>
    1b54:	40b005b3          	neg	a1,a1
    1b58:	f9dff06f          	j	1af4 <__hidden___udivsi3>
    1b5c:	40b005b3          	neg	a1,a1
    1b60:	00008293          	mv	t0,ra
    1b64:	f91ff0ef          	jal	1af4 <__hidden___udivsi3>
    1b68:	40a00533          	neg	a0,a0
    1b6c:	00028067          	jr	t0

00001b70 <__modsi3>:
    1b70:	00008293          	mv	t0,ra
    1b74:	0005ca63          	bltz	a1,1b88 <__modsi3+0x18>
    1b78:	00054c63          	bltz	a0,1b90 <__modsi3+0x20>
    1b7c:	f79ff0ef          	jal	1af4 <__hidden___udivsi3>
    1b80:	00058513          	mv	a0,a1
    1b84:	00028067          	jr	t0
    1b88:	40b005b3          	neg	a1,a1
    1b8c:	fe0558e3          	bgez	a0,1b7c <__modsi3+0xc>
    1b90:	40a00533          	neg	a0,a0
    1b94:	f61ff0ef          	jal	1af4 <__hidden___udivsi3>
    1b98:	40b00533          	neg	a0,a1
    1b9c:	00028067          	jr	t0
