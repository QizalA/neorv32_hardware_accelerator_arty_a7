
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__modsi3+0x8>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	bcc38393          	add	t2,t2,-1076 # 1c00 <__crt0_copy_data_src_begin>
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
     10c:	00001417          	auipc	s0,0x1
     110:	71c40413          	add	s0,s0,1820 # 1828 <__fini_array_end>
     114:	00001497          	auipc	s1,0x1
     118:	71448493          	add	s1,s1,1812 # 1828 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	6f460613          	add	a2,a2,1780 # 824 <main>

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
     178:	6b440413          	add	s0,s0,1716 # 1828 <__fini_array_end>
     17c:	00001497          	auipc	s1,0x1
     180:	6ac48493          	add	s1,s1,1708 # 1828 <__fini_array_end>

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

000001e4 <bench_cfs_once>:
/* ========= Bench HW (CFS) =========
   Returns C sum (to avoid optimization).
   Fences/brackets exactly the 2 writes + 4 reads.
*/
static uint32_t bench_cfs_once(uint32_t A_packed, uint32_t B_packed,
                               uint32_t *cycles, uint32_t *insts) {
     1e4:	fd010113          	add	sp,sp,-48
     1e8:	02112623          	sw	ra,44(sp)
     1ec:	02812423          	sw	s0,40(sp)
     1f0:	02912223          	sw	s1,36(sp)
     1f4:	03212023          	sw	s2,32(sp)
     1f8:	01312e23          	sw	s3,28(sp)
     1fc:	01412c23          	sw	s4,24(sp)
     200:	01512a23          	sw	s5,20(sp)
     204:	00068493          	mv	s1,a3
     208:	00060993          	mv	s3,a2
     20c:	00050a93          	mv	s5,a0
     210:	00058413          	mv	s0,a1
  uint64_t c0 = neorv32_cpu_get_cycle();
     214:	001000ef          	jal	a14 <neorv32_cpu_get_cycle>
     218:	00050a13          	mv	s4,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     21c:	00d000ef          	jal	a28 <neorv32_cpu_get_instret>
  *(volatile uint32_t*)addr = val;
     220:	ffeb0737          	lui	a4,0xffeb0
     224:	01572023          	sw	s5,0(a4) # ffeb0000 <__crt0_ram_last+0x7feae001>
     228:	ffeb07b7          	lui	a5,0xffeb0
     22c:	0087a223          	sw	s0,4(a5) # ffeb0004 <__crt0_ram_last+0x7feae005>
  return *(volatile uint32_t*)addr;
     230:	00072703          	lw	a4,0(a4)
  *(volatile uint32_t*)addr = val;
     234:	00478793          	add	a5,a5,4
  uint64_t i0 = neorv32_cpu_get_instret();
     238:	00050913          	mv	s2,a0

  mmio_write32(CFS_REG_A_WR, A_packed);
  mmio_write32(CFS_REG_B_WR, B_packed);
  volatile uint32_t C00 = mmio_read32(CFS_REG_C00);
     23c:	00e12023          	sw	a4,0(sp)
  return *(volatile uint32_t*)addr;
     240:	0007a783          	lw	a5,0(a5)
  volatile uint32_t C01 = mmio_read32(CFS_REG_C01);
     244:	00f12223          	sw	a5,4(sp)
  return *(volatile uint32_t*)addr;
     248:	ffeb07b7          	lui	a5,0xffeb0
     24c:	00878793          	add	a5,a5,8 # ffeb0008 <__crt0_ram_last+0x7feae009>
     250:	0007a783          	lw	a5,0(a5)
  volatile uint32_t C10 = mmio_read32(CFS_REG_C10);
     254:	00f12423          	sw	a5,8(sp)
  return *(volatile uint32_t*)addr;
     258:	ffeb07b7          	lui	a5,0xffeb0
     25c:	00c78793          	add	a5,a5,12 # ffeb000c <__crt0_ram_last+0x7feae00d>
     260:	0007a783          	lw	a5,0(a5)
  volatile uint32_t C11 = mmio_read32(CFS_REG_C11);
     264:	00f12623          	sw	a5,12(sp)

  uint64_t c1 = neorv32_cpu_get_cycle();
     268:	7ac000ef          	jal	a14 <neorv32_cpu_get_cycle>
     26c:	00050413          	mv	s0,a0
  uint64_t i1 = neorv32_cpu_get_instret();
     270:	7b8000ef          	jal	a28 <neorv32_cpu_get_instret>

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);
  return C00 + C01 + C10 + C11; // consume
     274:	00012783          	lw	a5,0(sp)
  *cycles = (uint32_t)(c1 - c0);
     278:	41440433          	sub	s0,s0,s4
  return C00 + C01 + C10 + C11; // consume
     27c:	00412683          	lw	a3,4(sp)
  *cycles = (uint32_t)(c1 - c0);
     280:	0089a023          	sw	s0,0(s3)
  return C00 + C01 + C10 + C11; // consume
     284:	00812703          	lw	a4,8(sp)
  *insts  = (uint32_t)(i1 - i0);
     288:	41250533          	sub	a0,a0,s2
     28c:	00a4a023          	sw	a0,0(s1)
}
     290:	02c12083          	lw	ra,44(sp)
  return C00 + C01 + C10 + C11; // consume
     294:	00c12503          	lw	a0,12(sp)
}
     298:	02812403          	lw	s0,40(sp)
  return C00 + C01 + C10 + C11; // consume
     29c:	00d787b3          	add	a5,a5,a3
     2a0:	00e787b3          	add	a5,a5,a4
}
     2a4:	02412483          	lw	s1,36(sp)
     2a8:	02012903          	lw	s2,32(sp)
     2ac:	01c12983          	lw	s3,28(sp)
     2b0:	01812a03          	lw	s4,24(sp)
     2b4:	01412a83          	lw	s5,20(sp)
     2b8:	00a78533          	add	a0,a5,a0
     2bc:	03010113          	add	sp,sp,48
     2c0:	00008067          	ret

000002c4 <bench_sw_once>:
/* ========= Bench SW (CPU ref) =========
   Brackets just the math (no printing/packing).
*/
static uint32_t bench_sw_once(uint8_t a00, uint8_t a01, uint8_t a10, uint8_t a11,
                              uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11,
                              uint32_t *cycles, uint32_t *insts) {
     2c4:	fd010113          	add	sp,sp,-48
     2c8:	02112623          	sw	ra,44(sp)
     2cc:	02812423          	sw	s0,40(sp)
     2d0:	02912223          	sw	s1,36(sp)
     2d4:	03212023          	sw	s2,32(sp)
     2d8:	01312e23          	sw	s3,28(sp)
     2dc:	01412c23          	sw	s4,24(sp)
     2e0:	01512a23          	sw	s5,20(sp)
     2e4:	01612823          	sw	s6,16(sp)
     2e8:	01712623          	sw	s7,12(sp)
     2ec:	01812423          	sw	s8,8(sp)
     2f0:	01912223          	sw	s9,4(sp)
     2f4:	00078493          	mv	s1,a5
     2f8:	00060c13          	mv	s8,a2
     2fc:	00068413          	mv	s0,a3
     300:	00070b93          	mv	s7,a4
     304:	00080b13          	mv	s6,a6
     308:	00088a93          	mv	s5,a7
     30c:	00050c93          	mv	s9,a0
     310:	00058913          	mv	s2,a1
  uint32_t c00,c01,c10,c11;

  uint64_t c0 = neorv32_cpu_get_cycle();
     314:	700000ef          	jal	a14 <neorv32_cpu_get_cycle>
     318:	00050a13          	mv	s4,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     31c:	70c000ef          	jal	a28 <neorv32_cpu_get_instret>
     320:	018c85b3          	add	a1,s9,s8
     324:	00050993          	mv	s3,a0
  *c10 = (uint32_t)a10*b00 + (uint32_t)a11*b10;
     328:	009b8533          	add	a0,s7,s1
     32c:	424010ef          	jal	1750 <__mulsi3>
     330:	015b05b3          	add	a1,s6,s5
     334:	00050493          	mv	s1,a0
     338:	00890533          	add	a0,s2,s0
     33c:	414010ef          	jal	1750 <__mulsi3>
     340:	00050913          	mv	s2,a0

  mul2x2_ref(a00,a01,a10,a11,b00,b01,b10,b11, &c00,&c01,&c10,&c11);

  uint64_t c1 = neorv32_cpu_get_cycle();
     344:	6d0000ef          	jal	a14 <neorv32_cpu_get_cycle>
     348:	00050413          	mv	s0,a0
  uint64_t i1 = neorv32_cpu_get_instret();
     34c:	6dc000ef          	jal	a28 <neorv32_cpu_get_instret>

  *cycles = (uint32_t)(c1 - c0);
     350:	03012783          	lw	a5,48(sp)
     354:	41440433          	sub	s0,s0,s4
  *insts  = (uint32_t)(i1 - i0);
  return c00 + c01 + c10 + c11;
}
     358:	02c12083          	lw	ra,44(sp)
  *cycles = (uint32_t)(c1 - c0);
     35c:	0087a023          	sw	s0,0(a5)
  *insts  = (uint32_t)(i1 - i0);
     360:	03412783          	lw	a5,52(sp)
}
     364:	02812403          	lw	s0,40(sp)
  *insts  = (uint32_t)(i1 - i0);
     368:	41350533          	sub	a0,a0,s3
     36c:	00a7a023          	sw	a0,0(a5)
}
     370:	01c12983          	lw	s3,28(sp)
     374:	00990533          	add	a0,s2,s1
     378:	01812a03          	lw	s4,24(sp)
     37c:	02412483          	lw	s1,36(sp)
     380:	02012903          	lw	s2,32(sp)
     384:	01412a83          	lw	s5,20(sp)
     388:	01012b03          	lw	s6,16(sp)
     38c:	00c12b83          	lw	s7,12(sp)
     390:	00812c03          	lw	s8,8(sp)
     394:	00412c83          	lw	s9,4(sp)
     398:	03010113          	add	sp,sp,48
     39c:	00008067          	ret

000003a0 <run_case_bench>:

/* ========= One full case ========= */
static void run_case_bench(const char *tag,
                           uint8_t a00, uint8_t a01, uint8_t a10, uint8_t a11,
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     3a0:	f6010113          	add	sp,sp,-160
     3a4:	02f12623          	sw	a5,44(sp)
     3a8:	0a014783          	lbu	a5,160(sp)
     3ac:	08812c23          	sw	s0,152(sp)
  return ((uint32_t)m11 << 24) |
     3b0:	01871413          	sll	s0,a4,0x18
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     3b4:	02f12c23          	sw	a5,56(sp)
         ((uint32_t)m10 << 16) |
     3b8:	01069793          	sll	a5,a3,0x10
  return ((uint32_t)m11 << 24) |
     3bc:	00f46433          	or	s0,s0,a5
         ((uint32_t)m01 << 8)  |
     3c0:	00861793          	sll	a5,a2,0x8
         ((uint32_t)m10 << 16) |
     3c4:	00f46433          	or	s0,s0,a5
  return ((uint32_t)m11 << 24) |
     3c8:	03812783          	lw	a5,56(sp)
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     3cc:	08912a23          	sw	s1,148(sp)
         ((uint32_t)m01 << 8)  |
     3d0:	00b46433          	or	s0,s0,a1
  return ((uint32_t)m11 << 24) |
     3d4:	01879493          	sll	s1,a5,0x18
         ((uint32_t)m10 << 16) |
     3d8:	01089793          	sll	a5,a7,0x10
  return ((uint32_t)m11 << 24) |
     3dc:	00f4e4b3          	or	s1,s1,a5
         ((uint32_t)m01 << 8)  |
     3e0:	00881793          	sll	a5,a6,0x8
         ((uint32_t)m10 << 16) |
     3e4:	00f4e4b3          	or	s1,s1,a5
         ((uint32_t)m01 << 8)  |
     3e8:	02c12783          	lw	a5,44(sp)
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     3ec:	00b12e23          	sw	a1,28(sp)

  uint32_t A_packed = pack2x2_u8(a00,a01,a10,a11);
  uint32_t B_packed = pack2x2_u8(b00,b01,b10,b11);

  // Show inputs
  neorv32_uart0_printf("\n-- %s --\n", tag);
     3f0:	000025b7          	lui	a1,0x2
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     3f4:	02c12023          	sw	a2,32(sp)
  neorv32_uart0_printf("\n-- %s --\n", tag);
     3f8:	83058593          	add	a1,a1,-2000 # 1830 <__fini_array_end+0x8>
     3fc:	00050613          	mv	a2,a0
     400:	fff50537          	lui	a0,0xfff50
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     404:	08112e23          	sw	ra,156(sp)
     408:	03112a23          	sw	a7,52(sp)
         ((uint32_t)m01 << 8)  |
     40c:	00f4e4b3          	or	s1,s1,a5
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {
     410:	09212823          	sw	s2,144(sp)
     414:	09312623          	sw	s3,140(sp)
     418:	09612023          	sw	s6,128(sp)
     41c:	07712e23          	sw	s7,124(sp)
     420:	07812c23          	sw	s8,120(sp)
     424:	07912a23          	sw	s9,116(sp)
     428:	07a12823          	sw	s10,112(sp)
     42c:	07b12623          	sw	s11,108(sp)
     430:	09412423          	sw	s4,136(sp)
     434:	09512223          	sw	s5,132(sp)
     438:	02d12223          	sw	a3,36(sp)
     43c:	02e12423          	sw	a4,40(sp)
     440:	03012823          	sw	a6,48(sp)
  neorv32_uart0_printf("\n-- %s --\n", tag);
     444:	11d000ef          	jal	d60 <neorv32_uart_printf>
  neorv32_uart0_printf("A = [[%u,%u],[%u,%u]]  packed=0x%08x\n", a00,a01,a10,a11, A_packed);
     448:	02812783          	lw	a5,40(sp)
     44c:	02412703          	lw	a4,36(sp)
     450:	02012683          	lw	a3,32(sp)
     454:	01c12603          	lw	a2,28(sp)
     458:	000025b7          	lui	a1,0x2
     45c:	00040813          	mv	a6,s0
     460:	83c58593          	add	a1,a1,-1988 # 183c <__fini_array_end+0x14>
     464:	fff50537          	lui	a0,0xfff50
     468:	0f9000ef          	jal	d60 <neorv32_uart_printf>
  neorv32_uart0_printf("B = [[%u,%u],[%u,%u]]  packed=0x%08x\n", b00,b01,b10,b11, B_packed);
     46c:	03812783          	lw	a5,56(sp)
     470:	03412703          	lw	a4,52(sp)
     474:	03012683          	lw	a3,48(sp)
     478:	02c12603          	lw	a2,44(sp)
     47c:	000025b7          	lui	a1,0x2
     480:	00048813          	mv	a6,s1
     484:	86458593          	add	a1,a1,-1948 # 1864 <__fini_array_end+0x3c>
     488:	fff50537          	lui	a0,0xfff50
     48c:	0d5000ef          	jal	d60 <neorv32_uart_printf>
  *(volatile uint32_t*)addr = val;
     490:	ffeb0737          	lui	a4,0xffeb0
     494:	00872023          	sw	s0,0(a4) # ffeb0000 <__crt0_ram_last+0x7feae001>
     498:	ffeb07b7          	lui	a5,0xffeb0
     49c:	0097a223          	sw	s1,4(a5) # ffeb0004 <__crt0_ram_last+0x7feae005>
  return *(volatile uint32_t*)addr;
     4a0:	00072983          	lw	s3,0(a4)
     4a4:	0047a903          	lw	s2,4(a5)
     4a8:	ffeb07b7          	lui	a5,0xffeb0
     4ac:	0087ad83          	lw	s11,8(a5) # ffeb0008 <__crt0_ram_last+0x7feae009>
     4b0:	ffeb07b7          	lui	a5,0xffeb0
     4b4:	00c7ad03          	lw	s10,12(a5) # ffeb000c <__crt0_ram_last+0x7feae00d>
  mmio_write32(CFS_REG_B_WR, B_packed);
  uint32_t C00 = mmio_read32(CFS_REG_C00);
  uint32_t C01 = mmio_read32(CFS_REG_C01);
  uint32_t C10 = mmio_read32(CFS_REG_C10);
  uint32_t C11 = mmio_read32(CFS_REG_C11);
  neorv32_uart0_printf("CFS C = [[%u,%u],[%u,%u]]\n", C00,C01,C10,C11);
     4b8:	000025b7          	lui	a1,0x2
     4bc:	000d8713          	mv	a4,s11
     4c0:	000d0793          	mv	a5,s10
     4c4:	00090693          	mv	a3,s2
     4c8:	00098613          	mv	a2,s3
     4cc:	88c58593          	add	a1,a1,-1908 # 188c <__fini_array_end+0x64>
     4d0:	fff50537          	lui	a0,0xfff50
     4d4:	08d000ef          	jal	d60 <neorv32_uart_printf>
  *c00 = (uint32_t)a00*b00 + (uint32_t)a01*b10;
     4d8:	01c12583          	lw	a1,28(sp)
     4dc:	02c12503          	lw	a0,44(sp)
     4e0:	270010ef          	jal	1750 <__mulsi3>
     4e4:	02012583          	lw	a1,32(sp)
     4e8:	00050c13          	mv	s8,a0
     4ec:	03412503          	lw	a0,52(sp)
     4f0:	260010ef          	jal	1750 <__mulsi3>
     4f4:	00ac0c33          	add	s8,s8,a0
  *c01 = (uint32_t)a00*b01 + (uint32_t)a01*b11;
     4f8:	01c12583          	lw	a1,28(sp)
     4fc:	03012503          	lw	a0,48(sp)
     500:	250010ef          	jal	1750 <__mulsi3>
     504:	02012583          	lw	a1,32(sp)
     508:	00050b93          	mv	s7,a0
     50c:	03812503          	lw	a0,56(sp)
     510:	240010ef          	jal	1750 <__mulsi3>
  *c10 = (uint32_t)a10*b00 + (uint32_t)a11*b10;
     514:	02412583          	lw	a1,36(sp)
  *c01 = (uint32_t)a00*b01 + (uint32_t)a01*b11;
     518:	00ab8bb3          	add	s7,s7,a0
  *c10 = (uint32_t)a10*b00 + (uint32_t)a11*b10;
     51c:	02c12503          	lw	a0,44(sp)
     520:	230010ef          	jal	1750 <__mulsi3>
     524:	02812583          	lw	a1,40(sp)
     528:	00050b13          	mv	s6,a0
     52c:	03412503          	lw	a0,52(sp)
     530:	220010ef          	jal	1750 <__mulsi3>
  *c11 = (uint32_t)a10*b01 + (uint32_t)a11*b11;
     534:	02412583          	lw	a1,36(sp)
  *c10 = (uint32_t)a10*b00 + (uint32_t)a11*b10;
     538:	00ab0b33          	add	s6,s6,a0
  *c11 = (uint32_t)a10*b01 + (uint32_t)a11*b11;
     53c:	03012503          	lw	a0,48(sp)
     540:	210010ef          	jal	1750 <__mulsi3>
     544:	02812583          	lw	a1,40(sp)
     548:	00050c93          	mv	s9,a0
     54c:	03812503          	lw	a0,56(sp)
     550:	200010ef          	jal	1750 <__mulsi3>
     554:	00ac8cb3          	add	s9,s9,a0

  // Reference (also print & verify)
  uint32_t r00,r01,r10,r11;
  mul2x2_ref(a00,a01,a10,a11,b00,b01,b10,b11, &r00,&r01,&r10,&r11);
  neorv32_uart0_printf("REF C = [[%u,%u],[%u,%u]]\n", r00,r01,r10,r11);
     558:	000025b7          	lui	a1,0x2
     55c:	000c8793          	mv	a5,s9
     560:	000b0713          	mv	a4,s6
     564:	000b8693          	mv	a3,s7
     568:	000c0613          	mv	a2,s8
     56c:	8a858593          	add	a1,a1,-1880 # 18a8 <__fini_array_end+0x80>
     570:	fff50537          	lui	a0,0xfff50
     574:	7ec000ef          	jal	d60 <neorv32_uart_printf>
  neorv32_uart0_printf("Match: %s\n", (C00==r00 && C01==r01 && C10==r10 && C11==r11) ? "YES" : "NO");
     578:	01899863          	bne	s3,s8,588 <run_case_bench+0x1e8>
     57c:	01791663          	bne	s2,s7,588 <run_case_bench+0x1e8>
     580:	016d9463          	bne	s11,s6,588 <run_case_bench+0x1e8>
     584:	299d0a63          	beq	s10,s9,818 <run_case_bench+0x478>
     588:	00002637          	lui	a2,0x2
     58c:	82c60613          	add	a2,a2,-2004 # 182c <__fini_array_end+0x4>
     590:	000025b7          	lui	a1,0x2
     594:	8c458593          	add	a1,a1,-1852 # 18c4 <__fini_array_end+0x9c>
     598:	fff50537          	lui	a0,0xfff50
     59c:	7c4000ef          	jal	d60 <neorv32_uart_printf>

  // --- Single-shot timing ---
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;
  volatile uint32_t sink = 0;
  sink += bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
     5a0:	05010693          	add	a3,sp,80
     5a4:	04c10613          	add	a2,sp,76
     5a8:	00048593          	mv	a1,s1
     5ac:	00040513          	mv	a0,s0
  volatile uint32_t sink = 0;
     5b0:	04012e23          	sw	zero,92(sp)
  sink += bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
     5b4:	c31ff0ef          	jal	1e4 <bench_cfs_once>
     5b8:	05c12783          	lw	a5,92(sp)
  sink += bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     5bc:	03812883          	lw	a7,56(sp)
     5c0:	03412803          	lw	a6,52(sp)
  sink += bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
     5c4:	00a787b3          	add	a5,a5,a0
     5c8:	04f12e23          	sw	a5,92(sp)
  sink += bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     5cc:	05810793          	add	a5,sp,88
     5d0:	00f12223          	sw	a5,4(sp)
     5d4:	05410793          	add	a5,sp,84
     5d8:	02c12703          	lw	a4,44(sp)
     5dc:	02812683          	lw	a3,40(sp)
     5e0:	02412603          	lw	a2,36(sp)
     5e4:	02012583          	lw	a1,32(sp)
     5e8:	00f12023          	sw	a5,0(sp)
     5ec:	01c12503          	lw	a0,28(sp)
     5f0:	03012783          	lw	a5,48(sp)
  (void)sink;

  neorv32_uart0_printf("Single-shot:  CFS cycles=%u, inst=%u | SW cycles=%u, inst=%u\n",
     5f4:	01000b13          	li	s6,16
  sink += bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     5f8:	ccdff0ef          	jal	2c4 <bench_sw_once>
     5fc:	05c12783          	lw	a5,92(sp)
  neorv32_uart0_printf("Single-shot:  CFS cycles=%u, inst=%u | SW cycles=%u, inst=%u\n",
     600:	05412703          	lw	a4,84(sp)
     604:	05012683          	lw	a3,80(sp)
  sink += bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     608:	00a787b3          	add	a5,a5,a0
     60c:	04f12e23          	sw	a5,92(sp)
  (void)sink;
     610:	05c12783          	lw	a5,92(sp)
  neorv32_uart0_printf("Single-shot:  CFS cycles=%u, inst=%u | SW cycles=%u, inst=%u\n",
     614:	05812783          	lw	a5,88(sp)
     618:	04c12603          	lw	a2,76(sp)
     61c:	000025b7          	lui	a1,0x2
     620:	8d058593          	add	a1,a1,-1840 # 18d0 <__fini_array_end+0xa8>
     624:	fff50537          	lui	a0,0xfff50
     628:	738000ef          	jal	d60 <neorv32_uart_printf>
  // --- Averaged timing over N iterations ---
  uint64_t sum_cyc_hw = 0, sum_ins_hw = 0, sum_cyc_sw = 0, sum_ins_sw = 0;

  // warm-up
  for (int i=0;i<16;i++) {
    bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
     62c:	05010693          	add	a3,sp,80
     630:	04c10613          	add	a2,sp,76
     634:	00048593          	mv	a1,s1
     638:	00040513          	mv	a0,s0
     63c:	ba9ff0ef          	jal	1e4 <bench_cfs_once>
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     640:	05810793          	add	a5,sp,88
     644:	00f12223          	sw	a5,4(sp)
     648:	05410793          	add	a5,sp,84
     64c:	00f12023          	sw	a5,0(sp)
     650:	03812883          	lw	a7,56(sp)
     654:	03412803          	lw	a6,52(sp)
     658:	03012783          	lw	a5,48(sp)
     65c:	02c12703          	lw	a4,44(sp)
     660:	02812683          	lw	a3,40(sp)
     664:	02412603          	lw	a2,36(sp)
     668:	02012583          	lw	a1,32(sp)
     66c:	01c12503          	lw	a0,28(sp)
  for (int i=0;i<16;i++) {
     670:	fffb0b13          	add	s6,s6,-1
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     674:	c51ff0ef          	jal	2c4 <bench_sw_once>
  for (int i=0;i<16;i++) {
     678:	fa0b1ae3          	bnez	s6,62c <run_case_bench+0x28c>
     67c:	3e800f93          	li	t6,1000
  uint64_t sum_cyc_hw = 0, sum_ins_hw = 0, sum_cyc_sw = 0, sum_ins_sw = 0;
     680:	00000993          	li	s3,0
     684:	00000b93          	li	s7,0
     688:	00000913          	li	s2,0
     68c:	00000a93          	li	s5,0
     690:	00000c93          	li	s9,0
     694:	00000a13          	li	s4,0
     698:	00000c13          	li	s8,0
  }

  for (int i=0;i<N_BENCH_ITERS;i++) {
    bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     69c:	05810d93          	add	s11,sp,88
     6a0:	05410d13          	add	s10,sp,84
    bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
     6a4:	05010693          	add	a3,sp,80
     6a8:	04c10613          	add	a2,sp,76
     6ac:	00048593          	mv	a1,s1
     6b0:	00040513          	mv	a0,s0
     6b4:	03f12e23          	sw	t6,60(sp)
     6b8:	b2dff0ef          	jal	1e4 <bench_cfs_once>
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
     6bc:	03012783          	lw	a5,48(sp)
     6c0:	02c12703          	lw	a4,44(sp)
     6c4:	03812883          	lw	a7,56(sp)
     6c8:	03412803          	lw	a6,52(sp)
     6cc:	02812683          	lw	a3,40(sp)
     6d0:	02412603          	lw	a2,36(sp)
     6d4:	02012583          	lw	a1,32(sp)
     6d8:	01c12503          	lw	a0,28(sp)
     6dc:	01b12223          	sw	s11,4(sp)
     6e0:	01a12023          	sw	s10,0(sp)
     6e4:	be1ff0ef          	jal	2c4 <bench_sw_once>
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     6e8:	04c12783          	lw	a5,76(sp)
  for (int i=0;i<N_BENCH_ITERS;i++) {
     6ec:	03c12f83          	lw	t6,60(sp)
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     6f0:	00fa07b3          	add	a5,s4,a5
     6f4:	0147b733          	sltu	a4,a5,s4
     6f8:	00078a13          	mv	s4,a5
     6fc:	05012783          	lw	a5,80(sp)
     700:	01870c33          	add	s8,a4,s8
  for (int i=0;i<N_BENCH_ITERS;i++) {
     704:	ffff8f93          	add	t6,t6,-1
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     708:	00fa87b3          	add	a5,s5,a5
     70c:	0157b733          	sltu	a4,a5,s5
     710:	00078a93          	mv	s5,a5
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     714:	05412783          	lw	a5,84(sp)
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     718:	01970cb3          	add	s9,a4,s9
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     71c:	00f907b3          	add	a5,s2,a5
     720:	0127b733          	sltu	a4,a5,s2
     724:	00078913          	mv	s2,a5
     728:	05812783          	lw	a5,88(sp)
     72c:	01670b33          	add	s6,a4,s6
     730:	00f987b3          	add	a5,s3,a5
     734:	0137b733          	sltu	a4,a5,s3
     738:	01770bb3          	add	s7,a4,s7
     73c:	00078993          	mv	s3,a5
  for (int i=0;i<N_BENCH_ITERS;i++) {
     740:	f60f92e3          	bnez	t6,6a4 <run_case_bench+0x304>
  uint32_t avg_cyc_hw = (uint32_t)(sum_cyc_hw / N_BENCH_ITERS);
  uint32_t avg_ins_hw = (uint32_t)(sum_ins_hw / N_BENCH_ITERS);
  uint32_t avg_cyc_sw = (uint32_t)(sum_cyc_sw / N_BENCH_ITERS);
  uint32_t avg_ins_sw = (uint32_t)(sum_ins_sw / N_BENCH_ITERS);

  neorv32_uart0_printf("Averaged over %u iters:\n", (unsigned)N_BENCH_ITERS);
     744:	000025b7          	lui	a1,0x2
     748:	3e800613          	li	a2,1000
     74c:	91058593          	add	a1,a1,-1776 # 1910 <__fini_array_end+0xe8>
     750:	fff50537          	lui	a0,0xfff50
     754:	60c000ef          	jal	d60 <neorv32_uart_printf>
  uint32_t avg_ins_hw = (uint32_t)(sum_ins_hw / N_BENCH_ITERS);
     758:	3e800613          	li	a2,1000
     75c:	00000693          	li	a3,0
     760:	000a8513          	mv	a0,s5
     764:	000c8593          	mv	a1,s9
     768:	13d000ef          	jal	10a4 <__udivdi3>
     76c:	00050413          	mv	s0,a0
  uint32_t avg_cyc_hw = (uint32_t)(sum_cyc_hw / N_BENCH_ITERS);
     770:	3e800613          	li	a2,1000
     774:	00000693          	li	a3,0
     778:	000a0513          	mv	a0,s4
     77c:	000c0593          	mv	a1,s8
     780:	125000ef          	jal	10a4 <__udivdi3>
  neorv32_uart0_printf("  CFS avg cycles=%u, inst=%u\n", avg_cyc_hw, avg_ins_hw);
     784:	000025b7          	lui	a1,0x2
  uint32_t avg_cyc_hw = (uint32_t)(sum_cyc_hw / N_BENCH_ITERS);
     788:	00050613          	mv	a2,a0
  neorv32_uart0_printf("  CFS avg cycles=%u, inst=%u\n", avg_cyc_hw, avg_ins_hw);
     78c:	00040693          	mv	a3,s0
     790:	92c58593          	add	a1,a1,-1748 # 192c <__fini_array_end+0x104>
     794:	fff50537          	lui	a0,0xfff50
     798:	5c8000ef          	jal	d60 <neorv32_uart_printf>
  uint32_t avg_ins_sw = (uint32_t)(sum_ins_sw / N_BENCH_ITERS);
     79c:	3e800613          	li	a2,1000
     7a0:	00000693          	li	a3,0
     7a4:	00098513          	mv	a0,s3
     7a8:	000b8593          	mv	a1,s7
     7ac:	0f9000ef          	jal	10a4 <__udivdi3>
     7b0:	00050413          	mv	s0,a0
  uint32_t avg_cyc_sw = (uint32_t)(sum_cyc_sw / N_BENCH_ITERS);
     7b4:	3e800613          	li	a2,1000
     7b8:	00000693          	li	a3,0
     7bc:	00090513          	mv	a0,s2
     7c0:	000b0593          	mv	a1,s6
     7c4:	0e1000ef          	jal	10a4 <__udivdi3>
  neorv32_uart0_printf("  SW  avg cycles=%u, inst=%u\n", avg_cyc_sw, avg_ins_sw);
     7c8:	00040693          	mv	a3,s0
}
     7cc:	09812403          	lw	s0,152(sp)
     7d0:	09c12083          	lw	ra,156(sp)
     7d4:	09412483          	lw	s1,148(sp)
     7d8:	09012903          	lw	s2,144(sp)
     7dc:	08c12983          	lw	s3,140(sp)
     7e0:	08812a03          	lw	s4,136(sp)
     7e4:	08412a83          	lw	s5,132(sp)
     7e8:	08012b03          	lw	s6,128(sp)
     7ec:	07c12b83          	lw	s7,124(sp)
     7f0:	07812c03          	lw	s8,120(sp)
     7f4:	07412c83          	lw	s9,116(sp)
     7f8:	07012d03          	lw	s10,112(sp)
     7fc:	06c12d83          	lw	s11,108(sp)
  neorv32_uart0_printf("  SW  avg cycles=%u, inst=%u\n", avg_cyc_sw, avg_ins_sw);
     800:	000025b7          	lui	a1,0x2
  uint32_t avg_cyc_sw = (uint32_t)(sum_cyc_sw / N_BENCH_ITERS);
     804:	00050613          	mv	a2,a0
  neorv32_uart0_printf("  SW  avg cycles=%u, inst=%u\n", avg_cyc_sw, avg_ins_sw);
     808:	94c58593          	add	a1,a1,-1716 # 194c <__fini_array_end+0x124>
     80c:	fff50537          	lui	a0,0xfff50
}
     810:	0a010113          	add	sp,sp,160
  neorv32_uart0_printf("  SW  avg cycles=%u, inst=%u\n", avg_cyc_sw, avg_ins_sw);
     814:	54c0006f          	j	d60 <neorv32_uart_printf>
  neorv32_uart0_printf("Match: %s\n", (C00==r00 && C01==r01 && C10==r10 && C11==r11) ? "YES" : "NO");
     818:	00002637          	lui	a2,0x2
     81c:	82860613          	add	a2,a2,-2008 # 1828 <__fini_array_end>
     820:	d71ff06f          	j	590 <run_case_bench+0x1f0>

00000824 <main>:

/* ========= main ========= */
int main(void) {
  neorv32_uart0_setup(19200, 0);
     824:	000055b7          	lui	a1,0x5
int main(void) {
     828:	fe010113          	add	sp,sp,-32
  neorv32_uart0_setup(19200, 0);
     82c:	00000613          	li	a2,0
     830:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     834:	fff50537          	lui	a0,0xfff50
int main(void) {
     838:	00112e23          	sw	ra,28(sp)
  neorv32_uart0_setup(19200, 0);
     83c:	200000ef          	jal	a3c <neorv32_uart_setup>
  neorv32_uart0_printf("\n[NEORV32 CFS 2x2 MatMul - Cycle/Instruction Benchmark]\n");
     840:	000025b7          	lui	a1,0x2
     844:	96c58593          	add	a1,a1,-1684 # 196c <__fini_array_end+0x144>
     848:	fff50537          	lui	a0,0xfff50
     84c:	514000ef          	jal	d60 <neorv32_uart_printf>
  neorv32_uart0_printf("CFS base = 0x%08x   iters=%u\n", (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);
     850:	000025b7          	lui	a1,0x2
     854:	3e800693          	li	a3,1000
     858:	ffeb0637          	lui	a2,0xffeb0
     85c:	9a858593          	add	a1,a1,-1624 # 19a8 <__fini_array_end+0x180>
     860:	fff50537          	lui	a0,0xfff50
     864:	4fc000ef          	jal	d60 <neorv32_uart_printf>

  // Case 1
  run_case_bench("Case 1",
     868:	00800793          	li	a5,8
     86c:	00002537          	lui	a0,0x2
     870:	00f12023          	sw	a5,0(sp)
     874:	00700893          	li	a7,7
     878:	00600813          	li	a6,6
     87c:	00500793          	li	a5,5
     880:	00400713          	li	a4,4
     884:	00300693          	li	a3,3
     888:	00200613          	li	a2,2
     88c:	00100593          	li	a1,1
     890:	9c850513          	add	a0,a0,-1592 # 19c8 <__fini_array_end+0x1a0>
     894:	b0dff0ef          	jal	3a0 <run_case_bench>
                 1,2,
                 3,4,
                 5,6,
                 7,8);
  // Case 2
  run_case_bench("Case 2",
     898:	00002537          	lui	a0,0x2
     89c:	00012023          	sw	zero,0(sp)
     8a0:	00400893          	li	a7,4
     8a4:	00300813          	li	a6,3
     8a8:	00000793          	li	a5,0
     8ac:	00000713          	li	a4,0
     8b0:	01400693          	li	a3,20
     8b4:	00a00613          	li	a2,10
     8b8:	00000593          	li	a1,0
     8bc:	9d050513          	add	a0,a0,-1584 # 19d0 <__fini_array_end+0x1a8>
     8c0:	ae1ff0ef          	jal	3a0 <run_case_bench>
                 0,10,
                 20,0,
                 0,3,
                 4,0);
  // Case 3
  run_case_bench("Case 3",
     8c4:	00200793          	li	a5,2
     8c8:	00002537          	lui	a0,0x2
     8cc:	00f12023          	sw	a5,0(sp)
     8d0:	00d00893          	li	a7,13
     8d4:	00b00813          	li	a6,11
     8d8:	00800793          	li	a5,8
     8dc:	00900713          	li	a4,9
     8e0:	00500693          	li	a3,5
     8e4:	00700613          	li	a2,7
     8e8:	00c00593          	li	a1,12
     8ec:	9d850513          	add	a0,a0,-1576 # 19d8 <__fini_array_end+0x1b0>
     8f0:	ab1ff0ef          	jal	3a0 <run_case_bench>
                 12,7,
                 5,9,
                 8,11,
                 13,2);
  // Case 4 (max)
  run_case_bench("Case 4",
     8f4:	0ff00793          	li	a5,255
     8f8:	00002537          	lui	a0,0x2
     8fc:	00f12023          	sw	a5,0(sp)
     900:	9e050513          	add	a0,a0,-1568 # 19e0 <__fini_array_end+0x1b8>
     904:	0ff00893          	li	a7,255
     908:	0ff00813          	li	a6,255
     90c:	0ff00713          	li	a4,255
     910:	0ff00693          	li	a3,255
     914:	0ff00613          	li	a2,255
     918:	0ff00593          	li	a1,255
     91c:	a85ff0ef          	jal	3a0 <run_case_bench>
                 255,255,
                 255,255,
                 255,255);

  return 0;
}
     920:	01c12083          	lw	ra,28(sp)
     924:	00000513          	li	a0,0
     928:	02010113          	add	sp,sp,32
     92c:	00008067          	ret

00000930 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     930:	fa010113          	add	sp,sp,-96
     934:	04912a23          	sw	s1,84(sp)
     938:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     93c:	000025b7          	lui	a1,0x2
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     940:	04812c23          	sw	s0,88(sp)
     944:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     948:	9e858593          	add	a1,a1,-1560 # 19e8 <__fini_array_end+0x1c0>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     94c:	00060913          	mv	s2,a2
     950:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     954:	01000613          	li	a2,16
     958:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     95c:	04112e23          	sw	ra,92(sp)
     960:	05312623          	sw	s3,76(sp)
     964:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     968:	50c000ef          	jal	e74 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     96c:	02400613          	li	a2,36
     970:	00000593          	li	a1,0
     974:	01c10513          	add	a0,sp,28
     978:	420000ef          	jal	d98 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     97c:	ffe90713          	add	a4,s2,-2
     980:	00e00793          	li	a5,14
     984:	03f10993          	add	s3,sp,63
     988:	02e7f463          	bgeu	a5,a4,9b0 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     98c:	00040023          	sb	zero,0(s0)
}
     990:	05c12083          	lw	ra,92(sp)
     994:	05812403          	lw	s0,88(sp)
     998:	05412483          	lw	s1,84(sp)
     99c:	05012903          	lw	s2,80(sp)
     9a0:	04c12983          	lw	s3,76(sp)
     9a4:	04812a03          	lw	s4,72(sp)
     9a8:	06010113          	add	sp,sp,96
     9ac:	00008067          	ret
    *tmp_ptr = digits[num%base];
     9b0:	00090593          	mv	a1,s2
     9b4:	00048513          	mv	a0,s1
     9b8:	60d000ef          	jal	17c4 <__umodsi3>
     9bc:	04050793          	add	a5,a0,64
     9c0:	00278533          	add	a0,a5,sp
     9c4:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     9c8:	00090593          	mv	a1,s2
     9cc:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     9d0:	fef98fa3          	sb	a5,-1(s3)
     9d4:	00048a13          	mv	s4,s1
    num /= base;
     9d8:	5a5000ef          	jal	177c <__hidden___udivsi3>
    tmp_ptr--;
     9dc:	fff98993          	add	s3,s3,-1
    num /= base;
     9e0:	00050493          	mv	s1,a0
  } while (num != 0);
     9e4:	fd2a76e3          	bgeu	s4,s2,9b0 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     9e8:	00000793          	li	a5,0
     9ec:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     9f0:	01c10713          	add	a4,sp,28
     9f4:	00f70733          	add	a4,a4,a5
     9f8:	00074703          	lbu	a4,0(a4)
     9fc:	00070663          	beqz	a4,a08 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     a00:	00e40023          	sb	a4,0(s0)
      buffer++;
     a04:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     a08:	00178793          	add	a5,a5,1
     a0c:	fed792e3          	bne	a5,a3,9f0 <neorv32_aux_itoa+0xc0>
     a10:	f7dff06f          	j	98c <neorv32_aux_itoa+0x5c>

00000a14 <neorv32_cpu_get_cycle>:
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     a14:	c80027f3          	rdcycleh	a5
     a18:	c0002573          	rdcycle	a0
     a1c:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     a20:	fef59ae3          	bne	a1,a5,a14 <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     a24:	00008067          	ret

00000a28 <neorv32_cpu_get_instret>:
     a28:	c82027f3          	rdinstreth	a5
     a2c:	c0202573          	rdinstret	a0
     a30:	c82025f3          	rdinstreth	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_INSTRETH);
    tmp2 = neorv32_cpu_csr_read(CSR_INSTRET);
    tmp3 = neorv32_cpu_csr_read(CSR_INSTRETH);
    if (tmp1 == tmp3) {
     a34:	fef59ae3          	bne	a1,a5,a28 <neorv32_cpu_get_instret>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     a38:	00008067          	ret

00000a3c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     a3c:	ff010113          	add	sp,sp,-16
     a40:	00812423          	sw	s0,8(sp)
     a44:	00912223          	sw	s1,4(sp)
     a48:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     a4c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     a50:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     a54:	00050493          	mv	s1,a0
     a58:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     a5c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     a60:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     a64:	519000ef          	jal	177c <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     a68:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     a6c:	3fe00693          	li	a3,1022
     a70:	04a6e663          	bltu	a3,a0,abc <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     a74:	fff50793          	add	a5,a0,-1
     a78:	000106b7          	lui	a3,0x10
     a7c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
     a80:	00679793          	sll	a5,a5,0x6
     a84:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     a88:	07c006b7          	lui	a3,0x7c00
     a8c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     a90:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     a94:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     a98:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
     a9c:	00c12083          	lw	ra,12(sp)
     aa0:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     aa4:	00e7e7b3          	or	a5,a5,a4
     aa8:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     aac:	00f4a023          	sw	a5,0(s1)
}
     ab0:	00412483          	lw	s1,4(sp)
     ab4:	01010113          	add	sp,sp,16
     ab8:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     abc:	ffe70793          	add	a5,a4,-2
     ac0:	ffd7f793          	and	a5,a5,-3
     ac4:	00079863          	bnez	a5,ad4 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
     ac8:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     acc:	00170713          	add	a4,a4,1
     ad0:	fa1ff06f          	j	a70 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
     ad4:	00155513          	srl	a0,a0,0x1
     ad8:	ff5ff06f          	j	acc <neorv32_uart_setup+0x90>

00000adc <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     adc:	00052783          	lw	a5,0(a0)
     ae0:	00a79713          	sll	a4,a5,0xa
     ae4:	fe075ce3          	bgez	a4,adc <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     ae8:	00b52223          	sw	a1,4(a0)
}
     aec:	00008067          	ret

00000af0 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     af0:	fe010113          	add	sp,sp,-32
     af4:	00812c23          	sw	s0,24(sp)
     af8:	00912a23          	sw	s1,20(sp)
     afc:	01312623          	sw	s3,12(sp)
     b00:	00112e23          	sw	ra,28(sp)
     b04:	01212823          	sw	s2,16(sp)
     b08:	00050493          	mv	s1,a0
     b0c:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     b10:	00a00993          	li	s3,10
  while ((c = *s++)) {
     b14:	00044903          	lbu	s2,0(s0)
     b18:	00140413          	add	s0,s0,1
     b1c:	02091063          	bnez	s2,b3c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     b20:	01c12083          	lw	ra,28(sp)
     b24:	01812403          	lw	s0,24(sp)
     b28:	01412483          	lw	s1,20(sp)
     b2c:	01012903          	lw	s2,16(sp)
     b30:	00c12983          	lw	s3,12(sp)
     b34:	02010113          	add	sp,sp,32
     b38:	00008067          	ret
    if (c == '\n') {
     b3c:	01391863          	bne	s2,s3,b4c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     b40:	00d00593          	li	a1,13
     b44:	00048513          	mv	a0,s1
     b48:	f95ff0ef          	jal	adc <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     b4c:	00090593          	mv	a1,s2
     b50:	00048513          	mv	a0,s1
     b54:	f89ff0ef          	jal	adc <neorv32_uart_putc>
     b58:	fbdff06f          	j	b14 <neorv32_uart_puts+0x24>

00000b5c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     b5c:	f9010113          	add	sp,sp,-112
     b60:	06812423          	sw	s0,104(sp)
     b64:	06912223          	sw	s1,100(sp)
     b68:	07212023          	sw	s2,96(sp)
     b6c:	05312e23          	sw	s3,92(sp)
     b70:	00050493          	mv	s1,a0
     b74:	00058913          	mv	s2,a1
     b78:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
     b7c:	00000593          	li	a1,0
     b80:	02400613          	li	a2,36
     b84:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
     b88:	000029b7          	lui	s3,0x2
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     b8c:	05412c23          	sw	s4,88(sp)
     b90:	05512a23          	sw	s5,84(sp)
     b94:	05712623          	sw	s7,76(sp)
     b98:	05812423          	sw	s8,72(sp)
     b9c:	05912223          	sw	s9,68(sp)
     ba0:	05a12023          	sw	s10,64(sp)
     ba4:	06112623          	sw	ra,108(sp)
     ba8:	05612823          	sw	s6,80(sp)
     bac:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
     bb0:	02500b93          	li	s7,37
    string_buf[i] = 0;
     bb4:	1e4000ef          	jal	d98 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
     bb8:	00a00c13          	li	s8,10
      c = tolower(*format++);
     bbc:	9fd98993          	add	s3,s3,-1539 # 19fd <_ctype_+0x1>
     bc0:	00100c93          	li	s9,1
      switch (c) {
     bc4:	07000a13          	li	s4,112
     bc8:	07500d13          	li	s10,117
     bcc:	06300a93          	li	s5,99
  while ((c = *format++)) {
     bd0:	00094d83          	lbu	s11,0(s2)
     bd4:	040d9063          	bnez	s11,c14 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
     bd8:	06c12083          	lw	ra,108(sp)
     bdc:	06812403          	lw	s0,104(sp)
     be0:	06412483          	lw	s1,100(sp)
     be4:	06012903          	lw	s2,96(sp)
     be8:	05c12983          	lw	s3,92(sp)
     bec:	05812a03          	lw	s4,88(sp)
     bf0:	05412a83          	lw	s5,84(sp)
     bf4:	05012b03          	lw	s6,80(sp)
     bf8:	04c12b83          	lw	s7,76(sp)
     bfc:	04812c03          	lw	s8,72(sp)
     c00:	04412c83          	lw	s9,68(sp)
     c04:	04012d03          	lw	s10,64(sp)
     c08:	03c12d83          	lw	s11,60(sp)
     c0c:	07010113          	add	sp,sp,112
     c10:	00008067          	ret
    if (c == '%') {
     c14:	137d9863          	bne	s11,s7,d44 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
     c18:	00290b13          	add	s6,s2,2
     c1c:	00194903          	lbu	s2,1(s2)
     c20:	013907b3          	add	a5,s2,s3
     c24:	0007c783          	lbu	a5,0(a5)
     c28:	0037f793          	and	a5,a5,3
     c2c:	01979463          	bne	a5,s9,c34 <neorv32_uart_vprintf+0xd8>
     c30:	02090913          	add	s2,s2,32
      switch (c) {
     c34:	0ff97793          	zext.b	a5,s2
     c38:	0d478863          	beq	a5,s4,d08 <neorv32_uart_vprintf+0x1ac>
     c3c:	06fa4c63          	blt	s4,a5,cb4 <neorv32_uart_vprintf+0x158>
     c40:	09578e63          	beq	a5,s5,cdc <neorv32_uart_vprintf+0x180>
     c44:	02fac663          	blt	s5,a5,c70 <neorv32_uart_vprintf+0x114>
     c48:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
     c4c:	02500593          	li	a1,37
      switch (c) {
     c50:	00e78a63          	beq	a5,a4,c64 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
     c54:	02500593          	li	a1,37
     c58:	00048513          	mv	a0,s1
     c5c:	e81ff0ef          	jal	adc <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     c60:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
     c64:	00048513          	mv	a0,s1
     c68:	e75ff0ef          	jal	adc <neorv32_uart_putc>
     c6c:	0840006f          	j	cf0 <neorv32_uart_vprintf+0x194>
      switch (c) {
     c70:	06400713          	li	a4,100
     c74:	00e78663          	beq	a5,a4,c80 <neorv32_uart_vprintf+0x124>
     c78:	06900713          	li	a4,105
     c7c:	fce79ce3          	bne	a5,a4,c54 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
     c80:	00440913          	add	s2,s0,4
     c84:	00042403          	lw	s0,0(s0)
          if (n < 0) {
     c88:	00045a63          	bgez	s0,c9c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
     c8c:	02d00593          	li	a1,45
     c90:	00048513          	mv	a0,s1
            n = -n;
     c94:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
     c98:	e45ff0ef          	jal	adc <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
     c9c:	00a00613          	li	a2,10
     ca0:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     ca4:	00c10513          	add	a0,sp,12
     ca8:	c89ff0ef          	jal	930 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
     cac:	00c10593          	add	a1,sp,12
     cb0:	0200006f          	j	cd0 <neorv32_uart_vprintf+0x174>
      switch (c) {
     cb4:	05a78263          	beq	a5,s10,cf8 <neorv32_uart_vprintf+0x19c>
     cb8:	07800713          	li	a4,120
     cbc:	04e78663          	beq	a5,a4,d08 <neorv32_uart_vprintf+0x1ac>
     cc0:	07300713          	li	a4,115
     cc4:	f8e798e3          	bne	a5,a4,c54 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     cc8:	00042583          	lw	a1,0(s0)
     ccc:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
     cd0:	00048513          	mv	a0,s1
     cd4:	e1dff0ef          	jal	af0 <neorv32_uart_puts>
          break;
     cd8:	0140006f          	j	cec <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
     cdc:	00044583          	lbu	a1,0(s0)
     ce0:	00048513          	mv	a0,s1
     ce4:	00440913          	add	s2,s0,4
     ce8:	df5ff0ef          	jal	adc <neorv32_uart_putc>
     cec:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     cf0:	000b0913          	mv	s2,s6
     cf4:	eddff06f          	j	bd0 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     cf8:	00042583          	lw	a1,0(s0)
     cfc:	00440913          	add	s2,s0,4
     d00:	00a00613          	li	a2,10
     d04:	fa1ff06f          	j	ca4 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     d08:	00042583          	lw	a1,0(s0)
     d0c:	01000613          	li	a2,16
     d10:	00c10513          	add	a0,sp,12
     d14:	c1dff0ef          	jal	930 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
     d18:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     d1c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
     d20:	2f8000ef          	jal	1018 <strlen>
     d24:	00800413          	li	s0,8
     d28:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
     d2c:	f80400e3          	beqz	s0,cac <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
     d30:	03000593          	li	a1,48
     d34:	00048513          	mv	a0,s1
     d38:	da5ff0ef          	jal	adc <neorv32_uart_putc>
     d3c:	fff40413          	add	s0,s0,-1
     d40:	fedff06f          	j	d2c <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
     d44:	018d9863          	bne	s11,s8,d54 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
     d48:	00d00593          	li	a1,13
     d4c:	00048513          	mv	a0,s1
     d50:	d8dff0ef          	jal	adc <neorv32_uart_putc>
  while ((c = *format++)) {
     d54:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
     d58:	000d8593          	mv	a1,s11
     d5c:	f09ff06f          	j	c64 <neorv32_uart_vprintf+0x108>

00000d60 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     d60:	fc010113          	add	sp,sp,-64
     d64:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
     d68:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
     d6c:	00112e23          	sw	ra,28(sp)
     d70:	02d12623          	sw	a3,44(sp)
     d74:	02e12823          	sw	a4,48(sp)
     d78:	02f12a23          	sw	a5,52(sp)
     d7c:	03012c23          	sw	a6,56(sp)
     d80:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
     d84:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
     d88:	dd5ff0ef          	jal	b5c <neorv32_uart_vprintf>
  va_end(args);
}
     d8c:	01c12083          	lw	ra,28(sp)
     d90:	04010113          	add	sp,sp,64
     d94:	00008067          	ret

00000d98 <memset>:
     d98:	00f00313          	li	t1,15
     d9c:	00050713          	mv	a4,a0
     da0:	02c37e63          	bgeu	t1,a2,ddc <memset+0x44>
     da4:	00f77793          	and	a5,a4,15
     da8:	0a079063          	bnez	a5,e48 <memset+0xb0>
     dac:	08059263          	bnez	a1,e30 <memset+0x98>
     db0:	ff067693          	and	a3,a2,-16
     db4:	00f67613          	and	a2,a2,15
     db8:	00e686b3          	add	a3,a3,a4
     dbc:	00b72023          	sw	a1,0(a4)
     dc0:	00b72223          	sw	a1,4(a4)
     dc4:	00b72423          	sw	a1,8(a4)
     dc8:	00b72623          	sw	a1,12(a4)
     dcc:	01070713          	add	a4,a4,16
     dd0:	fed766e3          	bltu	a4,a3,dbc <memset+0x24>
     dd4:	00061463          	bnez	a2,ddc <memset+0x44>
     dd8:	00008067          	ret
     ddc:	40c306b3          	sub	a3,t1,a2
     de0:	00269693          	sll	a3,a3,0x2
     de4:	00000297          	auipc	t0,0x0
     de8:	005686b3          	add	a3,a3,t0
     dec:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
     df0:	00b70723          	sb	a1,14(a4)
     df4:	00b706a3          	sb	a1,13(a4)
     df8:	00b70623          	sb	a1,12(a4)
     dfc:	00b705a3          	sb	a1,11(a4)
     e00:	00b70523          	sb	a1,10(a4)
     e04:	00b704a3          	sb	a1,9(a4)
     e08:	00b70423          	sb	a1,8(a4)
     e0c:	00b703a3          	sb	a1,7(a4)
     e10:	00b70323          	sb	a1,6(a4)
     e14:	00b702a3          	sb	a1,5(a4)
     e18:	00b70223          	sb	a1,4(a4)
     e1c:	00b701a3          	sb	a1,3(a4)
     e20:	00b70123          	sb	a1,2(a4)
     e24:	00b700a3          	sb	a1,1(a4)
     e28:	00b70023          	sb	a1,0(a4)
     e2c:	00008067          	ret
     e30:	0ff5f593          	zext.b	a1,a1
     e34:	00859693          	sll	a3,a1,0x8
     e38:	00d5e5b3          	or	a1,a1,a3
     e3c:	01059693          	sll	a3,a1,0x10
     e40:	00d5e5b3          	or	a1,a1,a3
     e44:	f6dff06f          	j	db0 <memset+0x18>
     e48:	00279693          	sll	a3,a5,0x2
     e4c:	00000297          	auipc	t0,0x0
     e50:	005686b3          	add	a3,a3,t0
     e54:	00008293          	mv	t0,ra
     e58:	fa0680e7          	jalr	-96(a3)
     e5c:	00028093          	mv	ra,t0
     e60:	ff078793          	add	a5,a5,-16
     e64:	40f70733          	sub	a4,a4,a5
     e68:	00f60633          	add	a2,a2,a5
     e6c:	f6c378e3          	bgeu	t1,a2,ddc <memset+0x44>
     e70:	f3dff06f          	j	dac <memset+0x14>

00000e74 <memcpy>:
     e74:	00a5c7b3          	xor	a5,a1,a0
     e78:	0037f793          	and	a5,a5,3
     e7c:	00c508b3          	add	a7,a0,a2
     e80:	06079463          	bnez	a5,ee8 <memcpy+0x74>
     e84:	00300793          	li	a5,3
     e88:	06c7f063          	bgeu	a5,a2,ee8 <memcpy+0x74>
     e8c:	00357793          	and	a5,a0,3
     e90:	00050713          	mv	a4,a0
     e94:	06079a63          	bnez	a5,f08 <memcpy+0x94>
     e98:	ffc8f613          	and	a2,a7,-4
     e9c:	40e606b3          	sub	a3,a2,a4
     ea0:	02000793          	li	a5,32
     ea4:	08d7ce63          	blt	a5,a3,f40 <memcpy+0xcc>
     ea8:	00058693          	mv	a3,a1
     eac:	00070793          	mv	a5,a4
     eb0:	02c77863          	bgeu	a4,a2,ee0 <memcpy+0x6c>
     eb4:	0006a803          	lw	a6,0(a3)
     eb8:	00478793          	add	a5,a5,4
     ebc:	00468693          	add	a3,a3,4
     ec0:	ff07ae23          	sw	a6,-4(a5)
     ec4:	fec7e8e3          	bltu	a5,a2,eb4 <memcpy+0x40>
     ec8:	fff60793          	add	a5,a2,-1 # ffeaffff <__crt0_ram_last+0x7feae000>
     ecc:	40e787b3          	sub	a5,a5,a4
     ed0:	ffc7f793          	and	a5,a5,-4
     ed4:	00478793          	add	a5,a5,4
     ed8:	00f70733          	add	a4,a4,a5
     edc:	00f585b3          	add	a1,a1,a5
     ee0:	01176863          	bltu	a4,a7,ef0 <memcpy+0x7c>
     ee4:	00008067          	ret
     ee8:	00050713          	mv	a4,a0
     eec:	05157863          	bgeu	a0,a7,f3c <memcpy+0xc8>
     ef0:	0005c783          	lbu	a5,0(a1)
     ef4:	00170713          	add	a4,a4,1
     ef8:	00158593          	add	a1,a1,1
     efc:	fef70fa3          	sb	a5,-1(a4)
     f00:	fee898e3          	bne	a7,a4,ef0 <memcpy+0x7c>
     f04:	00008067          	ret
     f08:	0005c683          	lbu	a3,0(a1)
     f0c:	00170713          	add	a4,a4,1
     f10:	00377793          	and	a5,a4,3
     f14:	fed70fa3          	sb	a3,-1(a4)
     f18:	00158593          	add	a1,a1,1
     f1c:	f6078ee3          	beqz	a5,e98 <memcpy+0x24>
     f20:	0005c683          	lbu	a3,0(a1)
     f24:	00170713          	add	a4,a4,1
     f28:	00377793          	and	a5,a4,3
     f2c:	fed70fa3          	sb	a3,-1(a4)
     f30:	00158593          	add	a1,a1,1
     f34:	fc079ae3          	bnez	a5,f08 <memcpy+0x94>
     f38:	f61ff06f          	j	e98 <memcpy+0x24>
     f3c:	00008067          	ret
     f40:	ff010113          	add	sp,sp,-16
     f44:	00812623          	sw	s0,12(sp)
     f48:	02000413          	li	s0,32
     f4c:	0005a383          	lw	t2,0(a1)
     f50:	0045a283          	lw	t0,4(a1)
     f54:	0085af83          	lw	t6,8(a1)
     f58:	00c5af03          	lw	t5,12(a1)
     f5c:	0105ae83          	lw	t4,16(a1)
     f60:	0145ae03          	lw	t3,20(a1)
     f64:	0185a303          	lw	t1,24(a1)
     f68:	01c5a803          	lw	a6,28(a1)
     f6c:	0205a683          	lw	a3,32(a1)
     f70:	02470713          	add	a4,a4,36
     f74:	40e607b3          	sub	a5,a2,a4
     f78:	fc772e23          	sw	t2,-36(a4)
     f7c:	fe572023          	sw	t0,-32(a4)
     f80:	fff72223          	sw	t6,-28(a4)
     f84:	ffe72423          	sw	t5,-24(a4)
     f88:	ffd72623          	sw	t4,-20(a4)
     f8c:	ffc72823          	sw	t3,-16(a4)
     f90:	fe672a23          	sw	t1,-12(a4)
     f94:	ff072c23          	sw	a6,-8(a4)
     f98:	fed72e23          	sw	a3,-4(a4)
     f9c:	02458593          	add	a1,a1,36
     fa0:	faf446e3          	blt	s0,a5,f4c <memcpy+0xd8>
     fa4:	00058693          	mv	a3,a1
     fa8:	00070793          	mv	a5,a4
     fac:	02c77863          	bgeu	a4,a2,fdc <memcpy+0x168>
     fb0:	0006a803          	lw	a6,0(a3)
     fb4:	00478793          	add	a5,a5,4
     fb8:	00468693          	add	a3,a3,4
     fbc:	ff07ae23          	sw	a6,-4(a5)
     fc0:	fec7e8e3          	bltu	a5,a2,fb0 <memcpy+0x13c>
     fc4:	fff60793          	add	a5,a2,-1
     fc8:	40e787b3          	sub	a5,a5,a4
     fcc:	ffc7f793          	and	a5,a5,-4
     fd0:	00478793          	add	a5,a5,4
     fd4:	00f70733          	add	a4,a4,a5
     fd8:	00f585b3          	add	a1,a1,a5
     fdc:	01176863          	bltu	a4,a7,fec <memcpy+0x178>
     fe0:	00c12403          	lw	s0,12(sp)
     fe4:	01010113          	add	sp,sp,16
     fe8:	00008067          	ret
     fec:	0005c783          	lbu	a5,0(a1)
     ff0:	00170713          	add	a4,a4,1
     ff4:	00158593          	add	a1,a1,1
     ff8:	fef70fa3          	sb	a5,-1(a4)
     ffc:	fee882e3          	beq	a7,a4,fe0 <memcpy+0x16c>
    1000:	0005c783          	lbu	a5,0(a1)
    1004:	00170713          	add	a4,a4,1
    1008:	00158593          	add	a1,a1,1
    100c:	fef70fa3          	sb	a5,-1(a4)
    1010:	fce89ee3          	bne	a7,a4,fec <memcpy+0x178>
    1014:	fcdff06f          	j	fe0 <memcpy+0x16c>

00001018 <strlen>:
    1018:	00357793          	and	a5,a0,3
    101c:	00050713          	mv	a4,a0
    1020:	04079c63          	bnez	a5,1078 <strlen+0x60>
    1024:	7f7f86b7          	lui	a3,0x7f7f8
    1028:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
    102c:	fff00593          	li	a1,-1
    1030:	00072603          	lw	a2,0(a4)
    1034:	00470713          	add	a4,a4,4
    1038:	00d677b3          	and	a5,a2,a3
    103c:	00d787b3          	add	a5,a5,a3
    1040:	00c7e7b3          	or	a5,a5,a2
    1044:	00d7e7b3          	or	a5,a5,a3
    1048:	feb784e3          	beq	a5,a1,1030 <strlen+0x18>
    104c:	ffc74683          	lbu	a3,-4(a4)
    1050:	40a707b3          	sub	a5,a4,a0
    1054:	04068463          	beqz	a3,109c <strlen+0x84>
    1058:	ffd74683          	lbu	a3,-3(a4)
    105c:	02068c63          	beqz	a3,1094 <strlen+0x7c>
    1060:	ffe74503          	lbu	a0,-2(a4)
    1064:	00a03533          	snez	a0,a0
    1068:	00f50533          	add	a0,a0,a5
    106c:	ffe50513          	add	a0,a0,-2
    1070:	00008067          	ret
    1074:	fa0688e3          	beqz	a3,1024 <strlen+0xc>
    1078:	00074783          	lbu	a5,0(a4)
    107c:	00170713          	add	a4,a4,1
    1080:	00377693          	and	a3,a4,3
    1084:	fe0798e3          	bnez	a5,1074 <strlen+0x5c>
    1088:	40a70733          	sub	a4,a4,a0
    108c:	fff70513          	add	a0,a4,-1
    1090:	00008067          	ret
    1094:	ffd78513          	add	a0,a5,-3
    1098:	00008067          	ret
    109c:	ffc78513          	add	a0,a5,-4
    10a0:	00008067          	ret

000010a4 <__udivdi3>:
    10a4:	fd010113          	add	sp,sp,-48
    10a8:	01312e23          	sw	s3,28(sp)
    10ac:	02112623          	sw	ra,44(sp)
    10b0:	01612823          	sw	s6,16(sp)
    10b4:	00050993          	mv	s3,a0
    10b8:	16069663          	bnez	a3,1224 <__udivdi3+0x180>
    10bc:	02812423          	sw	s0,40(sp)
    10c0:	01512a23          	sw	s5,20(sp)
    10c4:	02912223          	sw	s1,36(sp)
    10c8:	03212023          	sw	s2,32(sp)
    10cc:	01412c23          	sw	s4,24(sp)
    10d0:	00060a93          	mv	s5,a2
    10d4:	00050413          	mv	s0,a0
    10d8:	1cc5f063          	bgeu	a1,a2,1298 <__udivdi3+0x1f4>
    10dc:	000107b7          	lui	a5,0x10
    10e0:	00058493          	mv	s1,a1
    10e4:	2af66e63          	bltu	a2,a5,13a0 <__udivdi3+0x2fc>
    10e8:	010007b7          	lui	a5,0x1000
    10ec:	01800713          	li	a4,24
    10f0:	00f67463          	bgeu	a2,a5,10f8 <__udivdi3+0x54>
    10f4:	01000713          	li	a4,16
    10f8:	00e656b3          	srl	a3,a2,a4
    10fc:	00001797          	auipc	a5,0x1
    1100:	a0478793          	add	a5,a5,-1532 # 1b00 <__clz_tab>
    1104:	00d787b3          	add	a5,a5,a3
    1108:	0007c783          	lbu	a5,0(a5)
    110c:	02000693          	li	a3,32
    1110:	00e787b3          	add	a5,a5,a4
    1114:	40f68733          	sub	a4,a3,a5
    1118:	00f68c63          	beq	a3,a5,1130 <__udivdi3+0x8c>
    111c:	00e594b3          	sll	s1,a1,a4
    1120:	00f9d7b3          	srl	a5,s3,a5
    1124:	00e61ab3          	sll	s5,a2,a4
    1128:	0097e4b3          	or	s1,a5,s1
    112c:	00e99433          	sll	s0,s3,a4
    1130:	010ada13          	srl	s4,s5,0x10
    1134:	000a0593          	mv	a1,s4
    1138:	00048513          	mv	a0,s1
    113c:	010a9b13          	sll	s6,s5,0x10
    1140:	63c000ef          	jal	177c <__hidden___udivsi3>
    1144:	010b5b13          	srl	s6,s6,0x10
    1148:	00050593          	mv	a1,a0
    114c:	00050913          	mv	s2,a0
    1150:	000b0513          	mv	a0,s6
    1154:	5fc000ef          	jal	1750 <__mulsi3>
    1158:	00050793          	mv	a5,a0
    115c:	000a0593          	mv	a1,s4
    1160:	00048513          	mv	a0,s1
    1164:	00078493          	mv	s1,a5
    1168:	65c000ef          	jal	17c4 <__umodsi3>
    116c:	01051513          	sll	a0,a0,0x10
    1170:	01045793          	srl	a5,s0,0x10
    1174:	00a7e7b3          	or	a5,a5,a0
    1178:	0097fc63          	bgeu	a5,s1,1190 <__udivdi3+0xec>
    117c:	00fa87b3          	add	a5,s5,a5
    1180:	fff90713          	add	a4,s2,-1
    1184:	0157e463          	bltu	a5,s5,118c <__udivdi3+0xe8>
    1188:	5a97e863          	bltu	a5,s1,1738 <__udivdi3+0x694>
    118c:	00070913          	mv	s2,a4
    1190:	409784b3          	sub	s1,a5,s1
    1194:	000a0593          	mv	a1,s4
    1198:	00048513          	mv	a0,s1
    119c:	5e0000ef          	jal	177c <__hidden___udivsi3>
    11a0:	00050593          	mv	a1,a0
    11a4:	00050993          	mv	s3,a0
    11a8:	000b0513          	mv	a0,s6
    11ac:	5a4000ef          	jal	1750 <__mulsi3>
    11b0:	00050793          	mv	a5,a0
    11b4:	000a0593          	mv	a1,s4
    11b8:	00048513          	mv	a0,s1
    11bc:	01041413          	sll	s0,s0,0x10
    11c0:	00078493          	mv	s1,a5
    11c4:	600000ef          	jal	17c4 <__umodsi3>
    11c8:	01051513          	sll	a0,a0,0x10
    11cc:	01045413          	srl	s0,s0,0x10
    11d0:	00a46433          	or	s0,s0,a0
    11d4:	00947c63          	bgeu	s0,s1,11ec <__udivdi3+0x148>
    11d8:	008a8433          	add	s0,s5,s0
    11dc:	fff98793          	add	a5,s3,-1
    11e0:	4d546e63          	bltu	s0,s5,16bc <__udivdi3+0x618>
    11e4:	ffe98993          	add	s3,s3,-2
    11e8:	4c947a63          	bgeu	s0,s1,16bc <__udivdi3+0x618>
    11ec:	01091613          	sll	a2,s2,0x10
    11f0:	01366533          	or	a0,a2,s3
    11f4:	00000b13          	li	s6,0
    11f8:	02812403          	lw	s0,40(sp)
    11fc:	02c12083          	lw	ra,44(sp)
    1200:	02412483          	lw	s1,36(sp)
    1204:	02012903          	lw	s2,32(sp)
    1208:	01812a03          	lw	s4,24(sp)
    120c:	01412a83          	lw	s5,20(sp)
    1210:	01c12983          	lw	s3,28(sp)
    1214:	000b0593          	mv	a1,s6
    1218:	01012b03          	lw	s6,16(sp)
    121c:	03010113          	add	sp,sp,48
    1220:	00008067          	ret
    1224:	02d5f263          	bgeu	a1,a3,1248 <__udivdi3+0x1a4>
    1228:	00000b13          	li	s6,0
    122c:	00000513          	li	a0,0
    1230:	02c12083          	lw	ra,44(sp)
    1234:	01c12983          	lw	s3,28(sp)
    1238:	000b0593          	mv	a1,s6
    123c:	01012b03          	lw	s6,16(sp)
    1240:	03010113          	add	sp,sp,48
    1244:	00008067          	ret
    1248:	000107b7          	lui	a5,0x10
    124c:	26f6ee63          	bltu	a3,a5,14c8 <__udivdi3+0x424>
    1250:	01000737          	lui	a4,0x1000
    1254:	01800793          	li	a5,24
    1258:	00e6f463          	bgeu	a3,a4,1260 <__udivdi3+0x1bc>
    125c:	01000793          	li	a5,16
    1260:	00f6d533          	srl	a0,a3,a5
    1264:	00001717          	auipc	a4,0x1
    1268:	89c70713          	add	a4,a4,-1892 # 1b00 <__clz_tab>
    126c:	00a70733          	add	a4,a4,a0
    1270:	00074703          	lbu	a4,0(a4)
    1274:	02000513          	li	a0,32
    1278:	00f70733          	add	a4,a4,a5
    127c:	40e50b33          	sub	s6,a0,a4
    1280:	26e51c63          	bne	a0,a4,14f8 <__udivdi3+0x454>
    1284:	46b6ee63          	bltu	a3,a1,1700 <__udivdi3+0x65c>
    1288:	00c9b533          	sltu	a0,s3,a2
    128c:	00153513          	seqz	a0,a0
    1290:	00000b13          	li	s6,0
    1294:	f9dff06f          	j	1230 <__udivdi3+0x18c>
    1298:	10060c63          	beqz	a2,13b0 <__udivdi3+0x30c>
    129c:	000107b7          	lui	a5,0x10
    12a0:	44f67663          	bgeu	a2,a5,16ec <__udivdi3+0x648>
    12a4:	10063713          	sltiu	a4,a2,256
    12a8:	00173713          	seqz	a4,a4
    12ac:	00371713          	sll	a4,a4,0x3
    12b0:	00e656b3          	srl	a3,a2,a4
    12b4:	00001797          	auipc	a5,0x1
    12b8:	84c78793          	add	a5,a5,-1972 # 1b00 <__clz_tab>
    12bc:	00d787b3          	add	a5,a5,a3
    12c0:	0007c483          	lbu	s1,0(a5)
    12c4:	02000793          	li	a5,32
    12c8:	00e484b3          	add	s1,s1,a4
    12cc:	40978733          	sub	a4,a5,s1
    12d0:	10979463          	bne	a5,s1,13d8 <__udivdi3+0x334>
    12d4:	01061a13          	sll	s4,a2,0x10
    12d8:	40c584b3          	sub	s1,a1,a2
    12dc:	01065913          	srl	s2,a2,0x10
    12e0:	010a5a13          	srl	s4,s4,0x10
    12e4:	00100b13          	li	s6,1
    12e8:	00090593          	mv	a1,s2
    12ec:	00048513          	mv	a0,s1
    12f0:	48c000ef          	jal	177c <__hidden___udivsi3>
    12f4:	000a0593          	mv	a1,s4
    12f8:	00050993          	mv	s3,a0
    12fc:	454000ef          	jal	1750 <__mulsi3>
    1300:	00050793          	mv	a5,a0
    1304:	00090593          	mv	a1,s2
    1308:	00048513          	mv	a0,s1
    130c:	00078493          	mv	s1,a5
    1310:	4b4000ef          	jal	17c4 <__umodsi3>
    1314:	01051513          	sll	a0,a0,0x10
    1318:	01045793          	srl	a5,s0,0x10
    131c:	00a7e7b3          	or	a5,a5,a0
    1320:	0097fc63          	bgeu	a5,s1,1338 <__udivdi3+0x294>
    1324:	00fa87b3          	add	a5,s5,a5
    1328:	fff98713          	add	a4,s3,-1
    132c:	0157e463          	bltu	a5,s5,1334 <__udivdi3+0x290>
    1330:	3e97ee63          	bltu	a5,s1,172c <__udivdi3+0x688>
    1334:	00070993          	mv	s3,a4
    1338:	409784b3          	sub	s1,a5,s1
    133c:	00090593          	mv	a1,s2
    1340:	00048513          	mv	a0,s1
    1344:	438000ef          	jal	177c <__hidden___udivsi3>
    1348:	000a0593          	mv	a1,s4
    134c:	00050a13          	mv	s4,a0
    1350:	400000ef          	jal	1750 <__mulsi3>
    1354:	00050793          	mv	a5,a0
    1358:	00090593          	mv	a1,s2
    135c:	00048513          	mv	a0,s1
    1360:	01041413          	sll	s0,s0,0x10
    1364:	00078493          	mv	s1,a5
    1368:	45c000ef          	jal	17c4 <__umodsi3>
    136c:	01051513          	sll	a0,a0,0x10
    1370:	01045413          	srl	s0,s0,0x10
    1374:	00a46433          	or	s0,s0,a0
    1378:	00947e63          	bgeu	s0,s1,1394 <__udivdi3+0x2f0>
    137c:	008a8433          	add	s0,s5,s0
    1380:	fffa0793          	add	a5,s4,-1
    1384:	01546663          	bltu	s0,s5,1390 <__udivdi3+0x2ec>
    1388:	ffea0a13          	add	s4,s4,-2
    138c:	00946463          	bltu	s0,s1,1394 <__udivdi3+0x2f0>
    1390:	00078a13          	mv	s4,a5
    1394:	01099613          	sll	a2,s3,0x10
    1398:	01466533          	or	a0,a2,s4
    139c:	e5dff06f          	j	11f8 <__udivdi3+0x154>
    13a0:	10063713          	sltiu	a4,a2,256
    13a4:	00173713          	seqz	a4,a4
    13a8:	00371713          	sll	a4,a4,0x3
    13ac:	d4dff06f          	j	10f8 <__udivdi3+0x54>
    13b0:	00000693          	li	a3,0
    13b4:	00000797          	auipc	a5,0x0
    13b8:	74c78793          	add	a5,a5,1868 # 1b00 <__clz_tab>
    13bc:	00d787b3          	add	a5,a5,a3
    13c0:	0007c483          	lbu	s1,0(a5)
    13c4:	00000713          	li	a4,0
    13c8:	02000793          	li	a5,32
    13cc:	00e484b3          	add	s1,s1,a4
    13d0:	40978733          	sub	a4,a5,s1
    13d4:	f09780e3          	beq	a5,s1,12d4 <__udivdi3+0x230>
    13d8:	00e61ab3          	sll	s5,a2,a4
    13dc:	01712623          	sw	s7,12(sp)
    13e0:	010ad913          	srl	s2,s5,0x10
    13e4:	0095dbb3          	srl	s7,a1,s1
    13e8:	00e597b3          	sll	a5,a1,a4
    13ec:	0099d4b3          	srl	s1,s3,s1
    13f0:	00090593          	mv	a1,s2
    13f4:	000b8513          	mv	a0,s7
    13f8:	010a9a13          	sll	s4,s5,0x10
    13fc:	00f4e4b3          	or	s1,s1,a5
    1400:	00e99433          	sll	s0,s3,a4
    1404:	010a5a13          	srl	s4,s4,0x10
    1408:	374000ef          	jal	177c <__hidden___udivsi3>
    140c:	00050593          	mv	a1,a0
    1410:	00050b13          	mv	s6,a0
    1414:	000a0513          	mv	a0,s4
    1418:	338000ef          	jal	1750 <__mulsi3>
    141c:	00050993          	mv	s3,a0
    1420:	00090593          	mv	a1,s2
    1424:	000b8513          	mv	a0,s7
    1428:	39c000ef          	jal	17c4 <__umodsi3>
    142c:	01051513          	sll	a0,a0,0x10
    1430:	0104d793          	srl	a5,s1,0x10
    1434:	00a7e7b3          	or	a5,a5,a0
    1438:	0137fe63          	bgeu	a5,s3,1454 <__udivdi3+0x3b0>
    143c:	00fa87b3          	add	a5,s5,a5
    1440:	fffb0713          	add	a4,s6,-1
    1444:	2d57ec63          	bltu	a5,s5,171c <__udivdi3+0x678>
    1448:	2d37fa63          	bgeu	a5,s3,171c <__udivdi3+0x678>
    144c:	ffeb0b13          	add	s6,s6,-2
    1450:	015787b3          	add	a5,a5,s5
    1454:	413789b3          	sub	s3,a5,s3
    1458:	00090593          	mv	a1,s2
    145c:	00098513          	mv	a0,s3
    1460:	31c000ef          	jal	177c <__hidden___udivsi3>
    1464:	00050593          	mv	a1,a0
    1468:	00050b93          	mv	s7,a0
    146c:	000a0513          	mv	a0,s4
    1470:	2e0000ef          	jal	1750 <__mulsi3>
    1474:	00050793          	mv	a5,a0
    1478:	00090593          	mv	a1,s2
    147c:	00098513          	mv	a0,s3
    1480:	01049493          	sll	s1,s1,0x10
    1484:	00078993          	mv	s3,a5
    1488:	33c000ef          	jal	17c4 <__umodsi3>
    148c:	01051513          	sll	a0,a0,0x10
    1490:	0104d493          	srl	s1,s1,0x10
    1494:	00a4e4b3          	or	s1,s1,a0
    1498:	0134fe63          	bgeu	s1,s3,14b4 <__udivdi3+0x410>
    149c:	009a84b3          	add	s1,s5,s1
    14a0:	fffb8793          	add	a5,s7,-1
    14a4:	2754e463          	bltu	s1,s5,170c <__udivdi3+0x668>
    14a8:	2734f263          	bgeu	s1,s3,170c <__udivdi3+0x668>
    14ac:	ffeb8b93          	add	s7,s7,-2
    14b0:	015484b3          	add	s1,s1,s5
    14b4:	010b1b13          	sll	s6,s6,0x10
    14b8:	017b6b33          	or	s6,s6,s7
    14bc:	413484b3          	sub	s1,s1,s3
    14c0:	00c12b83          	lw	s7,12(sp)
    14c4:	e25ff06f          	j	12e8 <__udivdi3+0x244>
    14c8:	1006b793          	sltiu	a5,a3,256
    14cc:	0017b793          	seqz	a5,a5
    14d0:	00379793          	sll	a5,a5,0x3
    14d4:	00f6d533          	srl	a0,a3,a5
    14d8:	00000717          	auipc	a4,0x0
    14dc:	62870713          	add	a4,a4,1576 # 1b00 <__clz_tab>
    14e0:	00a70733          	add	a4,a4,a0
    14e4:	00074703          	lbu	a4,0(a4)
    14e8:	02000513          	li	a0,32
    14ec:	00f70733          	add	a4,a4,a5
    14f0:	40e50b33          	sub	s6,a0,a4
    14f4:	d8e508e3          	beq	a0,a4,1284 <__udivdi3+0x1e0>
    14f8:	016696b3          	sll	a3,a3,s6
    14fc:	01912223          	sw	s9,4(sp)
    1500:	00e65cb3          	srl	s9,a2,a4
    1504:	00dcecb3          	or	s9,s9,a3
    1508:	01512a23          	sw	s5,20(sp)
    150c:	01712623          	sw	s7,12(sp)
    1510:	010cda93          	srl	s5,s9,0x10
    1514:	00e5dbb3          	srl	s7,a1,a4
    1518:	016597b3          	sll	a5,a1,s6
    151c:	00e9d733          	srl	a4,s3,a4
    1520:	01812423          	sw	s8,8(sp)
    1524:	000a8593          	mv	a1,s5
    1528:	000b8513          	mv	a0,s7
    152c:	010c9c13          	sll	s8,s9,0x10
    1530:	02812423          	sw	s0,40(sp)
    1534:	02912223          	sw	s1,36(sp)
    1538:	03212023          	sw	s2,32(sp)
    153c:	00f764b3          	or	s1,a4,a5
    1540:	01661933          	sll	s2,a2,s6
    1544:	01412c23          	sw	s4,24(sp)
    1548:	010c5c13          	srl	s8,s8,0x10
    154c:	230000ef          	jal	177c <__hidden___udivsi3>
    1550:	00050593          	mv	a1,a0
    1554:	00050413          	mv	s0,a0
    1558:	000c0513          	mv	a0,s8
    155c:	1f4000ef          	jal	1750 <__mulsi3>
    1560:	00050a13          	mv	s4,a0
    1564:	000a8593          	mv	a1,s5
    1568:	000b8513          	mv	a0,s7
    156c:	258000ef          	jal	17c4 <__umodsi3>
    1570:	01051513          	sll	a0,a0,0x10
    1574:	0104d793          	srl	a5,s1,0x10
    1578:	00a7e7b3          	or	a5,a5,a0
    157c:	0147fe63          	bgeu	a5,s4,1598 <__udivdi3+0x4f4>
    1580:	00fc87b3          	add	a5,s9,a5
    1584:	fff40713          	add	a4,s0,-1
    1588:	1997ee63          	bltu	a5,s9,1724 <__udivdi3+0x680>
    158c:	1947fc63          	bgeu	a5,s4,1724 <__udivdi3+0x680>
    1590:	ffe40413          	add	s0,s0,-2
    1594:	019787b3          	add	a5,a5,s9
    1598:	41478a33          	sub	s4,a5,s4
    159c:	000a8593          	mv	a1,s5
    15a0:	000a0513          	mv	a0,s4
    15a4:	1d8000ef          	jal	177c <__hidden___udivsi3>
    15a8:	00050593          	mv	a1,a0
    15ac:	00050b93          	mv	s7,a0
    15b0:	000c0513          	mv	a0,s8
    15b4:	19c000ef          	jal	1750 <__mulsi3>
    15b8:	00050793          	mv	a5,a0
    15bc:	000a8593          	mv	a1,s5
    15c0:	000a0513          	mv	a0,s4
    15c4:	00078a13          	mv	s4,a5
    15c8:	1fc000ef          	jal	17c4 <__umodsi3>
    15cc:	01049713          	sll	a4,s1,0x10
    15d0:	01051513          	sll	a0,a0,0x10
    15d4:	01075713          	srl	a4,a4,0x10
    15d8:	00a76733          	or	a4,a4,a0
    15dc:	01477e63          	bgeu	a4,s4,15f8 <__udivdi3+0x554>
    15e0:	00ec8733          	add	a4,s9,a4
    15e4:	fffb8793          	add	a5,s7,-1
    15e8:	13976663          	bltu	a4,s9,1714 <__udivdi3+0x670>
    15ec:	13477463          	bgeu	a4,s4,1714 <__udivdi3+0x670>
    15f0:	ffeb8b93          	add	s7,s7,-2
    15f4:	01970733          	add	a4,a4,s9
    15f8:	00010e37          	lui	t3,0x10
    15fc:	01041413          	sll	s0,s0,0x10
    1600:	01746433          	or	s0,s0,s7
    1604:	fffe0793          	add	a5,t3,-1 # ffff <__neorv32_rom_size+0xbfff>
    1608:	00f47833          	and	a6,s0,a5
    160c:	00f977b3          	and	a5,s2,a5
    1610:	41470733          	sub	a4,a4,s4
    1614:	01045e93          	srl	t4,s0,0x10
    1618:	01095913          	srl	s2,s2,0x10
    161c:	00080513          	mv	a0,a6
    1620:	00078593          	mv	a1,a5
    1624:	12c000ef          	jal	1750 <__mulsi3>
    1628:	00050313          	mv	t1,a0
    162c:	00090593          	mv	a1,s2
    1630:	00080513          	mv	a0,a6
    1634:	11c000ef          	jal	1750 <__mulsi3>
    1638:	00050813          	mv	a6,a0
    163c:	00078593          	mv	a1,a5
    1640:	000e8513          	mv	a0,t4
    1644:	10c000ef          	jal	1750 <__mulsi3>
    1648:	00050893          	mv	a7,a0
    164c:	00090593          	mv	a1,s2
    1650:	000e8513          	mv	a0,t4
    1654:	0fc000ef          	jal	1750 <__mulsi3>
    1658:	01035793          	srl	a5,t1,0x10
    165c:	01180833          	add	a6,a6,a7
    1660:	010787b3          	add	a5,a5,a6
    1664:	0117f463          	bgeu	a5,a7,166c <__udivdi3+0x5c8>
    1668:	01c50533          	add	a0,a0,t3
    166c:	0107d693          	srl	a3,a5,0x10
    1670:	00a686b3          	add	a3,a3,a0
    1674:	06d76863          	bltu	a4,a3,16e4 <__udivdi3+0x640>
    1678:	04d70663          	beq	a4,a3,16c4 <__udivdi3+0x620>
    167c:	00040513          	mv	a0,s0
    1680:	02812403          	lw	s0,40(sp)
    1684:	02c12083          	lw	ra,44(sp)
    1688:	00000b13          	li	s6,0
    168c:	02412483          	lw	s1,36(sp)
    1690:	02012903          	lw	s2,32(sp)
    1694:	01812a03          	lw	s4,24(sp)
    1698:	01412a83          	lw	s5,20(sp)
    169c:	00c12b83          	lw	s7,12(sp)
    16a0:	00812c03          	lw	s8,8(sp)
    16a4:	00412c83          	lw	s9,4(sp)
    16a8:	01c12983          	lw	s3,28(sp)
    16ac:	000b0593          	mv	a1,s6
    16b0:	01012b03          	lw	s6,16(sp)
    16b4:	03010113          	add	sp,sp,48
    16b8:	00008067          	ret
    16bc:	00078993          	mv	s3,a5
    16c0:	b2dff06f          	j	11ec <__udivdi3+0x148>
    16c4:	00010737          	lui	a4,0x10
    16c8:	fff70713          	add	a4,a4,-1 # ffff <__neorv32_rom_size+0xbfff>
    16cc:	00e7f7b3          	and	a5,a5,a4
    16d0:	01079793          	sll	a5,a5,0x10
    16d4:	00e37333          	and	t1,t1,a4
    16d8:	01699533          	sll	a0,s3,s6
    16dc:	006787b3          	add	a5,a5,t1
    16e0:	f8f57ee3          	bgeu	a0,a5,167c <__udivdi3+0x5d8>
    16e4:	fff40513          	add	a0,s0,-1
    16e8:	f99ff06f          	j	1680 <__udivdi3+0x5dc>
    16ec:	010007b7          	lui	a5,0x1000
    16f0:	04f67a63          	bgeu	a2,a5,1744 <__udivdi3+0x6a0>
    16f4:	01065693          	srl	a3,a2,0x10
    16f8:	01000713          	li	a4,16
    16fc:	bb9ff06f          	j	12b4 <__udivdi3+0x210>
    1700:	00000b13          	li	s6,0
    1704:	00100513          	li	a0,1
    1708:	b29ff06f          	j	1230 <__udivdi3+0x18c>
    170c:	00078b93          	mv	s7,a5
    1710:	da5ff06f          	j	14b4 <__udivdi3+0x410>
    1714:	00078b93          	mv	s7,a5
    1718:	ee1ff06f          	j	15f8 <__udivdi3+0x554>
    171c:	00070b13          	mv	s6,a4
    1720:	d35ff06f          	j	1454 <__udivdi3+0x3b0>
    1724:	00070413          	mv	s0,a4
    1728:	e71ff06f          	j	1598 <__udivdi3+0x4f4>
    172c:	ffe98993          	add	s3,s3,-2
    1730:	015787b3          	add	a5,a5,s5
    1734:	c05ff06f          	j	1338 <__udivdi3+0x294>
    1738:	ffe90913          	add	s2,s2,-2
    173c:	015787b3          	add	a5,a5,s5
    1740:	a51ff06f          	j	1190 <__udivdi3+0xec>
    1744:	01865693          	srl	a3,a2,0x18
    1748:	01800713          	li	a4,24
    174c:	b69ff06f          	j	12b4 <__udivdi3+0x210>

00001750 <__mulsi3>:
    1750:	00050613          	mv	a2,a0
    1754:	00000513          	li	a0,0
    1758:	0015f693          	and	a3,a1,1
    175c:	00068463          	beqz	a3,1764 <__mulsi3+0x14>
    1760:	00c50533          	add	a0,a0,a2
    1764:	0015d593          	srl	a1,a1,0x1
    1768:	00161613          	sll	a2,a2,0x1
    176c:	fe0596e3          	bnez	a1,1758 <__mulsi3+0x8>
    1770:	00008067          	ret

00001774 <__divsi3>:
    1774:	06054063          	bltz	a0,17d4 <__umodsi3+0x10>
    1778:	0605c663          	bltz	a1,17e4 <__umodsi3+0x20>

0000177c <__hidden___udivsi3>:
    177c:	00058613          	mv	a2,a1
    1780:	00050593          	mv	a1,a0
    1784:	fff00513          	li	a0,-1
    1788:	02060c63          	beqz	a2,17c0 <__hidden___udivsi3+0x44>
    178c:	00100693          	li	a3,1
    1790:	00b67a63          	bgeu	a2,a1,17a4 <__hidden___udivsi3+0x28>
    1794:	00c05863          	blez	a2,17a4 <__hidden___udivsi3+0x28>
    1798:	00161613          	sll	a2,a2,0x1
    179c:	00169693          	sll	a3,a3,0x1
    17a0:	feb66ae3          	bltu	a2,a1,1794 <__hidden___udivsi3+0x18>
    17a4:	00000513          	li	a0,0
    17a8:	00c5e663          	bltu	a1,a2,17b4 <__hidden___udivsi3+0x38>
    17ac:	40c585b3          	sub	a1,a1,a2
    17b0:	00d56533          	or	a0,a0,a3
    17b4:	0016d693          	srl	a3,a3,0x1
    17b8:	00165613          	srl	a2,a2,0x1
    17bc:	fe0696e3          	bnez	a3,17a8 <__hidden___udivsi3+0x2c>
    17c0:	00008067          	ret

000017c4 <__umodsi3>:
    17c4:	00008293          	mv	t0,ra
    17c8:	fb5ff0ef          	jal	177c <__hidden___udivsi3>
    17cc:	00058513          	mv	a0,a1
    17d0:	00028067          	jr	t0 # e4c <memset+0xb4>
    17d4:	40a00533          	neg	a0,a0
    17d8:	00b04863          	bgtz	a1,17e8 <__umodsi3+0x24>
    17dc:	40b005b3          	neg	a1,a1
    17e0:	f9dff06f          	j	177c <__hidden___udivsi3>
    17e4:	40b005b3          	neg	a1,a1
    17e8:	00008293          	mv	t0,ra
    17ec:	f91ff0ef          	jal	177c <__hidden___udivsi3>
    17f0:	40a00533          	neg	a0,a0
    17f4:	00028067          	jr	t0

000017f8 <__modsi3>:
    17f8:	00008293          	mv	t0,ra
    17fc:	0005ca63          	bltz	a1,1810 <__modsi3+0x18>
    1800:	00054c63          	bltz	a0,1818 <__modsi3+0x20>
    1804:	f79ff0ef          	jal	177c <__hidden___udivsi3>
    1808:	00058513          	mv	a0,a1
    180c:	00028067          	jr	t0
    1810:	40b005b3          	neg	a1,a1
    1814:	fe0558e3          	bgez	a0,1804 <__modsi3+0xc>
    1818:	40a00533          	neg	a0,a0
    181c:	f61ff0ef          	jal	177c <__hidden___udivsi3>
    1820:	40b00533          	neg	a0,a1
    1824:	00028067          	jr	t0
