
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__udivdi3+0x46c>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	ea438393          	add	t2,t2,-348 # 1ed8 <__crt0_copy_data_src_begin>
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
     110:	a0c40413          	add	s0,s0,-1524 # 1b18 <__fini_array_end>
     114:	00002497          	auipc	s1,0x2
     118:	a0448493          	add	s1,s1,-1532 # 1b18 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00001617          	auipc	a2,0x1
     134:	93060613          	add	a2,a2,-1744 # a60 <main>

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
     178:	9a440413          	add	s0,s0,-1628 # 1b18 <__fini_array_end>
     17c:	00002497          	auipc	s1,0x2
     180:	99c48493          	add	s1,s1,-1636 # 1b18 <__fini_array_end>

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
  }
}

/* ===== Bench: CFS path (6 writes + 9 reads only) ===== */
static uint32_t bench_cfs_once(const uint8_t A[3][3], const uint8_t B[3][3],
                               uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
     1e4:	fd010113          	add	sp,sp,-48
     1e8:	02112623          	sw	ra,44(sp)
     1ec:	02812423          	sw	s0,40(sp)
     1f0:	01512a23          	sw	s5,20(sp)
     1f4:	01612823          	sw	s6,16(sp)
     1f8:	01912223          	sw	s9,4(sp)
     1fc:	01a12023          	sw	s10,0(sp)
     200:	02912223          	sw	s1,36(sp)
     204:	03212023          	sw	s2,32(sp)
     208:	01312e23          	sw	s3,28(sp)
     20c:	01412c23          	sw	s4,24(sp)
     210:	01712623          	sw	s7,12(sp)
     214:	01812423          	sw	s8,8(sp)
  return ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     218:	00254c03          	lbu	s8,2(a0)
     21c:	00154783          	lbu	a5,1(a0)
     220:	00554b83          	lbu	s7,5(a0)
     224:	010c1c13          	sll	s8,s8,0x10
     228:	00879793          	sll	a5,a5,0x8
     22c:	00fc6c33          	or	s8,s8,a5
     230:	00054783          	lbu	a5,0(a0)
     234:	010b9b93          	sll	s7,s7,0x10
     238:	00854a03          	lbu	s4,8(a0)
     23c:	00fc6c33          	or	s8,s8,a5
     240:	00454783          	lbu	a5,4(a0)
     244:	010a1a13          	sll	s4,s4,0x10
     248:	0025c983          	lbu	s3,2(a1)
     24c:	00879793          	sll	a5,a5,0x8
     250:	00fbebb3          	or	s7,s7,a5
     254:	00354783          	lbu	a5,3(a0)
     258:	01099993          	sll	s3,s3,0x10
     25c:	0055c903          	lbu	s2,5(a1)
     260:	00fbebb3          	or	s7,s7,a5
     264:	00754783          	lbu	a5,7(a0)
     268:	01091913          	sll	s2,s2,0x10
     26c:	0085c483          	lbu	s1,8(a1)
     270:	00879793          	sll	a5,a5,0x8
     274:	00fa6a33          	or	s4,s4,a5
     278:	00654783          	lbu	a5,6(a0)
     27c:	01049493          	sll	s1,s1,0x10
                               uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
     280:	00070413          	mv	s0,a4
  return ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     284:	00fa6a33          	or	s4,s4,a5
     288:	0015c783          	lbu	a5,1(a1)
                               uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
     28c:	00060a93          	mv	s5,a2
     290:	00068b13          	mv	s6,a3
  return ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
     294:	00879793          	sll	a5,a5,0x8
     298:	00f9e9b3          	or	s3,s3,a5
     29c:	0005c783          	lbu	a5,0(a1)
     2a0:	00f9e9b3          	or	s3,s3,a5
     2a4:	0045c783          	lbu	a5,4(a1)
     2a8:	00879793          	sll	a5,a5,0x8
     2ac:	00f96933          	or	s2,s2,a5
     2b0:	0035c783          	lbu	a5,3(a1)
     2b4:	00f96933          	or	s2,s2,a5
     2b8:	0075c783          	lbu	a5,7(a1)
     2bc:	00879793          	sll	a5,a5,0x8
     2c0:	00f4e4b3          	or	s1,s1,a5
     2c4:	0065c783          	lbu	a5,6(a1)
     2c8:	00f4e4b3          	or	s1,s1,a5
  uint32_t Ap2 = pack3_u8(A[2][0],A[2][1],A[2][2]);
  uint32_t Bp0 = pack3_u8(B[0][0],B[0][1],B[0][2]);
  uint32_t Bp1 = pack3_u8(B[1][0],B[1][1],B[1][2]);
  uint32_t Bp2 = pack3_u8(B[2][0],B[2][1],B[2][2]);

  uint64_t c0 = neorv32_cpu_get_cycle();
     2cc:	239000ef          	jal	d04 <neorv32_cpu_get_cycle>
     2d0:	00050d13          	mv	s10,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     2d4:	245000ef          	jal	d18 <neorv32_cpu_get_instret>
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
     2d8:	ffeb07b7          	lui	a5,0xffeb0
     2dc:	0187a023          	sw	s8,0(a5) # ffeb0000 <__crt0_ram_last+0x7feae001>
     2e0:	0177a223          	sw	s7,4(a5)
     2e4:	ffeb07b7          	lui	a5,0xffeb0
     2e8:	0147a423          	sw	s4,8(a5) # ffeb0008 <__crt0_ram_last+0x7feae009>
     2ec:	ffeb07b7          	lui	a5,0xffeb0
     2f0:	0137a623          	sw	s3,12(a5) # ffeb000c <__crt0_ram_last+0x7feae00d>
     2f4:	ffeb07b7          	lui	a5,0xffeb0
     2f8:	0127a823          	sw	s2,16(a5) # ffeb0010 <__crt0_ram_last+0x7feae011>
     2fc:	ffeb07b7          	lui	a5,0xffeb0
     300:	0097aa23          	sw	s1,20(a5) # ffeb0014 <__crt0_ram_last+0x7feae015>
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     304:	ffeb07b7          	lui	a5,0xffeb0
     308:	02078793          	add	a5,a5,32 # ffeb0020 <__crt0_ram_last+0x7feae021>
     30c:	0007a783          	lw	a5,0(a5)
  uint64_t i0 = neorv32_cpu_get_instret();
     310:	00050c93          	mv	s9,a0

  wr32(CFS_A_ROW0, Ap0); wr32(CFS_A_ROW1, Ap1); wr32(CFS_A_ROW2, Ap2);
  wr32(CFS_B_ROW0, Bp0); wr32(CFS_B_ROW1, Bp1); wr32(CFS_B_ROW2, Bp2);

  C[0][0]=rd32(CFS_C00); C[0][1]=rd32(CFS_C01); C[0][2]=rd32(CFS_C02);
     314:	00f42023          	sw	a5,0(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     318:	ffeb07b7          	lui	a5,0xffeb0
     31c:	02478793          	add	a5,a5,36 # ffeb0024 <__crt0_ram_last+0x7feae025>
     320:	0007a783          	lw	a5,0(a5)
  C[0][0]=rd32(CFS_C00); C[0][1]=rd32(CFS_C01); C[0][2]=rd32(CFS_C02);
     324:	00f42223          	sw	a5,4(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     328:	ffeb07b7          	lui	a5,0xffeb0
     32c:	02878793          	add	a5,a5,40 # ffeb0028 <__crt0_ram_last+0x7feae029>
     330:	0007a783          	lw	a5,0(a5)
  C[0][0]=rd32(CFS_C00); C[0][1]=rd32(CFS_C01); C[0][2]=rd32(CFS_C02);
     334:	00f42423          	sw	a5,8(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     338:	ffeb07b7          	lui	a5,0xffeb0
     33c:	02c78793          	add	a5,a5,44 # ffeb002c <__crt0_ram_last+0x7feae02d>
     340:	0007a783          	lw	a5,0(a5)
  C[1][0]=rd32(CFS_C10); C[1][1]=rd32(CFS_C11); C[1][2]=rd32(CFS_C12);
     344:	00f42623          	sw	a5,12(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     348:	ffeb07b7          	lui	a5,0xffeb0
     34c:	03078793          	add	a5,a5,48 # ffeb0030 <__crt0_ram_last+0x7feae031>
     350:	0007a783          	lw	a5,0(a5)
  C[1][0]=rd32(CFS_C10); C[1][1]=rd32(CFS_C11); C[1][2]=rd32(CFS_C12);
     354:	00f42823          	sw	a5,16(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     358:	ffeb07b7          	lui	a5,0xffeb0
     35c:	03478793          	add	a5,a5,52 # ffeb0034 <__crt0_ram_last+0x7feae035>
     360:	0007a783          	lw	a5,0(a5)
  C[1][0]=rd32(CFS_C10); C[1][1]=rd32(CFS_C11); C[1][2]=rd32(CFS_C12);
     364:	00f42a23          	sw	a5,20(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     368:	ffeb07b7          	lui	a5,0xffeb0
     36c:	03878793          	add	a5,a5,56 # ffeb0038 <__crt0_ram_last+0x7feae039>
     370:	0007a783          	lw	a5,0(a5)
  C[2][0]=rd32(CFS_C20); C[2][1]=rd32(CFS_C21); C[2][2]=rd32(CFS_C22);
     374:	00f42c23          	sw	a5,24(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     378:	ffeb07b7          	lui	a5,0xffeb0
     37c:	03c78793          	add	a5,a5,60 # ffeb003c <__crt0_ram_last+0x7feae03d>
     380:	0007a783          	lw	a5,0(a5)
  C[2][0]=rd32(CFS_C20); C[2][1]=rd32(CFS_C21); C[2][2]=rd32(CFS_C22);
     384:	00f42e23          	sw	a5,28(s0)
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }
     388:	ffeb07b7          	lui	a5,0xffeb0
     38c:	04078793          	add	a5,a5,64 # ffeb0040 <__crt0_ram_last+0x7feae041>
     390:	0007a783          	lw	a5,0(a5)
  C[2][0]=rd32(CFS_C20); C[2][1]=rd32(CFS_C21); C[2][2]=rd32(CFS_C22);
     394:	02f42023          	sw	a5,32(s0)

  uint64_t c1 = neorv32_cpu_get_cycle();
     398:	16d000ef          	jal	d04 <neorv32_cpu_get_cycle>
     39c:	00050493          	mv	s1,a0
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
     3a0:	41a484b3          	sub	s1,s1,s10
  uint64_t i1 = neorv32_cpu_get_instret();
     3a4:	175000ef          	jal	d18 <neorv32_cpu_get_instret>
  *insts  = (uint32_t)(i1 - i0);
     3a8:	41950533          	sub	a0,a0,s9
  *cycles = (uint32_t)(c1 - c0);
     3ac:	009aa023          	sw	s1,0(s5)
  *insts  = (uint32_t)(i1 - i0);
     3b0:	00ab2023          	sw	a0,0(s6)

  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     3b4:	00442703          	lw	a4,4(s0)
     3b8:	00042783          	lw	a5,0(s0)
     3bc:	02042503          	lw	a0,32(s0)
}
     3c0:	02c12083          	lw	ra,44(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     3c4:	00e787b3          	add	a5,a5,a4
     3c8:	00842703          	lw	a4,8(s0)
}
     3cc:	02412483          	lw	s1,36(sp)
     3d0:	02012903          	lw	s2,32(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     3d4:	00e787b3          	add	a5,a5,a4
     3d8:	00c42703          	lw	a4,12(s0)
}
     3dc:	01c12983          	lw	s3,28(sp)
     3e0:	01812a03          	lw	s4,24(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     3e4:	00e787b3          	add	a5,a5,a4
     3e8:	01042703          	lw	a4,16(s0)
}
     3ec:	01412a83          	lw	s5,20(sp)
     3f0:	01012b03          	lw	s6,16(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     3f4:	00e787b3          	add	a5,a5,a4
     3f8:	01442703          	lw	a4,20(s0)
}
     3fc:	00c12b83          	lw	s7,12(sp)
     400:	00812c03          	lw	s8,8(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     404:	00e787b3          	add	a5,a5,a4
     408:	01842703          	lw	a4,24(s0)
}
     40c:	00412c83          	lw	s9,4(sp)
     410:	00012d03          	lw	s10,0(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     414:	00e787b3          	add	a5,a5,a4
     418:	01c42703          	lw	a4,28(s0)
}
     41c:	02812403          	lw	s0,40(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     420:	00e787b3          	add	a5,a5,a4
}
     424:	00a78533          	add	a0,a5,a0
     428:	03010113          	add	sp,sp,48
     42c:	00008067          	ret

00000430 <bench_sw_once>:

/* ===== Bench: SW path (math only) ===== */
static uint32_t bench_sw_once(const uint8_t A[3][3], const uint8_t B[3][3],
                              uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
     430:	fb010113          	add	sp,sp,-80
     434:	04112623          	sw	ra,76(sp)
     438:	04812423          	sw	s0,72(sp)
     43c:	04912223          	sw	s1,68(sp)
     440:	00070413          	mv	s0,a4
     444:	03412c23          	sw	s4,56(sp)
     448:	03512a23          	sw	s5,52(sp)
     44c:	03612823          	sw	s6,48(sp)
     450:	03712623          	sw	s7,44(sp)
     454:	03812423          	sw	s8,40(sp)
     458:	03a12023          	sw	s10,32(sp)
     45c:	01b12e23          	sw	s11,28(sp)
     460:	00050493          	mv	s1,a0
     464:	00058c13          	mv	s8,a1
     468:	00060b13          	mv	s6,a2
     46c:	00068a13          	mv	s4,a3
     470:	05212023          	sw	s2,64(sp)
     474:	03312e23          	sw	s3,60(sp)
     478:	03912223          	sw	s9,36(sp)
  uint64_t c0 = neorv32_cpu_get_cycle();
     47c:	089000ef          	jal	d04 <neorv32_cpu_get_cycle>
     480:	00050b93          	mv	s7,a0
  uint64_t i0 = neorv32_cpu_get_instret();
     484:	095000ef          	jal	d18 <neorv32_cpu_get_instret>
     488:	00050a93          	mv	s5,a0
  for(int i=0;i<3;i++){
     48c:	00040d13          	mv	s10,s0
     490:	00948d93          	add	s11,s1,9
     494:	003c0793          	add	a5,s8,3
    for(int j=0;j<3;j++){
     498:	000c0913          	mv	s2,s8
                              uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
     49c:	000d0c93          	mv	s9,s10
      for(int k=0;k<3;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     4a0:	0004c583          	lbu	a1,0(s1)
     4a4:	00094503          	lbu	a0,0(s2)
     4a8:	00f12623          	sw	a5,12(sp)
    for(int j=0;j<3;j++){
     4ac:	00190913          	add	s2,s2,1
      for(int k=0;k<3;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     4b0:	590010ef          	jal	1a40 <__mulsi3>
     4b4:	0014c583          	lbu	a1,1(s1)
     4b8:	00050993          	mv	s3,a0
     4bc:	00294503          	lbu	a0,2(s2)
    for(int j=0;j<3;j++){
     4c0:	004c8c93          	add	s9,s9,4
      for(int k=0;k<3;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     4c4:	57c010ef          	jal	1a40 <__mulsi3>
     4c8:	00594583          	lbu	a1,5(s2)
     4cc:	00a989b3          	add	s3,s3,a0
     4d0:	0024c503          	lbu	a0,2(s1)
     4d4:	56c010ef          	jal	1a40 <__mulsi3>
    for(int j=0;j<3;j++){
     4d8:	00c12783          	lw	a5,12(sp)
      for(int k=0;k<3;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
     4dc:	01350533          	add	a0,a0,s3
      C[i][j]=s;
     4e0:	feacae23          	sw	a0,-4(s9)
    for(int j=0;j<3;j++){
     4e4:	fb279ee3          	bne	a5,s2,4a0 <bench_sw_once+0x70>
  for(int i=0;i<3;i++){
     4e8:	00348493          	add	s1,s1,3
     4ec:	00cd0d13          	add	s10,s10,12
     4f0:	fa9d94e3          	bne	s11,s1,498 <bench_sw_once+0x68>

  mul3x3_ref(A,B,C);

  uint64_t c1 = neorv32_cpu_get_cycle();
     4f4:	011000ef          	jal	d04 <neorv32_cpu_get_cycle>
     4f8:	00050493          	mv	s1,a0
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
     4fc:	417484b3          	sub	s1,s1,s7
  uint64_t i1 = neorv32_cpu_get_instret();
     500:	019000ef          	jal	d18 <neorv32_cpu_get_instret>
  *insts  = (uint32_t)(i1 - i0);
     504:	41550533          	sub	a0,a0,s5
  *cycles = (uint32_t)(c1 - c0);
     508:	009b2023          	sw	s1,0(s6)
  *insts  = (uint32_t)(i1 - i0);
     50c:	00aa2023          	sw	a0,0(s4)

  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     510:	00442703          	lw	a4,4(s0)
     514:	00042783          	lw	a5,0(s0)
     518:	02042503          	lw	a0,32(s0)
}
     51c:	04c12083          	lw	ra,76(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     520:	00e787b3          	add	a5,a5,a4
     524:	00842703          	lw	a4,8(s0)
}
     528:	04412483          	lw	s1,68(sp)
     52c:	04012903          	lw	s2,64(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     530:	00e787b3          	add	a5,a5,a4
     534:	00c42703          	lw	a4,12(s0)
}
     538:	03c12983          	lw	s3,60(sp)
     53c:	03812a03          	lw	s4,56(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     540:	00e787b3          	add	a5,a5,a4
     544:	01042703          	lw	a4,16(s0)
}
     548:	03412a83          	lw	s5,52(sp)
     54c:	03012b03          	lw	s6,48(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     550:	00e787b3          	add	a5,a5,a4
     554:	01442703          	lw	a4,20(s0)
}
     558:	02c12b83          	lw	s7,44(sp)
     55c:	02812c03          	lw	s8,40(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     560:	00e787b3          	add	a5,a5,a4
     564:	01842703          	lw	a4,24(s0)
}
     568:	02412c83          	lw	s9,36(sp)
     56c:	02012d03          	lw	s10,32(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     570:	00e787b3          	add	a5,a5,a4
     574:	01c42703          	lw	a4,28(s0)
}
     578:	04812403          	lw	s0,72(sp)
     57c:	01c12d83          	lw	s11,28(sp)
  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
     580:	00e787b3          	add	a5,a5,a4
}
     584:	00a78533          	add	a0,a5,a0
     588:	05010113          	add	sp,sp,80
     58c:	00008067          	ret

00000590 <run_case>:
                     uint8_t a00,uint8_t a01,uint8_t a02,
                     uint8_t a10,uint8_t a11,uint8_t a12,
                     uint8_t a20,uint8_t a21,uint8_t a22,
                     uint8_t b00,uint8_t b01,uint8_t b02,
                     uint8_t b10,uint8_t b11,uint8_t b12,
                     uint8_t b20,uint8_t b21,uint8_t b22) {
     590:	f1010113          	add	sp,sp,-240
     594:	0d412c23          	sw	s4,216(sp)
     598:	00078a13          	mv	s4,a5
     59c:	0f014783          	lbu	a5,240(sp)
     5a0:	10c14303          	lbu	t1,268(sp)
     5a4:	11014e03          	lbu	t3,272(sp)
     5a8:	11414e83          	lbu	t4,276(sp)
     5ac:	11814f03          	lbu	t5,280(sp)
     5b0:	0d312e23          	sw	s3,220(sp)
     5b4:	0d712623          	sw	s7,204(sp)
     5b8:	00070993          	mv	s3,a4
     5bc:	0f814b83          	lbu	s7,248(sp)
     5c0:	0f414703          	lbu	a4,244(sp)
     5c4:	0d812423          	sw	s8,200(sp)
     5c8:	0d912223          	sw	s9,196(sp)
     5cc:	0fc14c03          	lbu	s8,252(sp)
     5d0:	10014c83          	lbu	s9,256(sp)
     5d4:	0da12023          	sw	s10,192(sp)
     5d8:	0bb12e23          	sw	s11,188(sp)
     5dc:	10414d03          	lbu	s10,260(sp)
     5e0:	10814d83          	lbu	s11,264(sp)
     5e4:	0e812423          	sw	s0,232(sp)
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     5e8:	04b10823          	sb	a1,80(sp)
                     uint8_t b20,uint8_t b21,uint8_t b22) {
     5ec:	00058413          	mv	s0,a1
  uint8_t  B[3][3] = {{b00,b01,b02},{b10,b11,b12},{b20,b21,b22}};
  uint32_t Ccfs[3][3], Csw[3][3];
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;

  neorv32_uart0_printf("\n-- %s --\n", tag);
     5f0:	000025b7          	lui	a1,0x2
                     uint8_t b20,uint8_t b21,uint8_t b22) {
     5f4:	0e112623          	sw	ra,236(sp)
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     5f8:	04d10923          	sb	a3,82(sp)
     5fc:	05010aa3          	sb	a6,85(sp)
     600:	05110b23          	sb	a7,86(sp)
     604:	04f10ba3          	sb	a5,87(sp)
                     uint8_t b20,uint8_t b21,uint8_t b22) {
     608:	0e912223          	sw	s1,228(sp)
     60c:	0f212023          	sw	s2,224(sp)
     610:	00060493          	mv	s1,a2
     614:	0d512a23          	sw	s5,212(sp)
     618:	0d612823          	sw	s6,208(sp)
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     61c:	04c108a3          	sb	a2,81(sp)
     620:	053109a3          	sb	s3,83(sp)
  neorv32_uart0_printf("\n-- %s --\n", tag);
     624:	00050613          	mv	a2,a0
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     628:	05410a23          	sb	s4,84(sp)
  neorv32_uart0_printf("\n-- %s --\n", tag);
     62c:	b2058593          	add	a1,a1,-1248 # 1b20 <__fini_array_end+0x8>
     630:	fff50537          	lui	a0,0xfff50
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     634:	02f12623          	sw	a5,44(sp)
                     uint8_t b20,uint8_t b21,uint8_t b22) {
     638:	00068913          	mv	s2,a3
     63c:	00080a93          	mv	s5,a6
     640:	00088b13          	mv	s6,a7
  uint8_t  B[3][3] = {{b00,b01,b02},{b10,b11,b12},{b20,b21,b22}};
     644:	066100a3          	sb	t1,97(sp)
     648:	02612223          	sw	t1,36(sp)
     64c:	07c10123          	sb	t3,98(sp)
     650:	03c12023          	sw	t3,32(sp)
     654:	07d101a3          	sb	t4,99(sp)
     658:	01d12e23          	sw	t4,28(sp)
     65c:	07e10223          	sb	t5,100(sp)
     660:	01e12c23          	sw	t5,24(sp)
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
     664:	04e10c23          	sb	a4,88(sp)
     668:	02e12423          	sw	a4,40(sp)
  uint8_t  B[3][3] = {{b00,b01,b02},{b10,b11,b12},{b20,b21,b22}};
     66c:	05710e23          	sb	s7,92(sp)
     670:	05810ea3          	sb	s8,93(sp)
     674:	05910f23          	sb	s9,94(sp)
     678:	05a10fa3          	sb	s10,95(sp)
     67c:	07b10023          	sb	s11,96(sp)
  neorv32_uart0_printf("\n-- %s --\n", tag);
     680:	1d1000ef          	jal	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("A = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     684:	02812703          	lw	a4,40(sp)
     688:	02c12783          	lw	a5,44(sp)
     68c:	000025b7          	lui	a1,0x2
     690:	000a8893          	mv	a7,s5
     694:	000a0813          	mv	a6,s4
     698:	00048693          	mv	a3,s1
     69c:	00040613          	mv	a2,s0
     6a0:	00e12423          	sw	a4,8(sp)
     6a4:	00f12223          	sw	a5,4(sp)
     6a8:	00090713          	mv	a4,s2
     6ac:	00098793          	mv	a5,s3
     6b0:	01612023          	sw	s6,0(sp)
     6b4:	b2c58593          	add	a1,a1,-1236 # 1b2c <__fini_array_end+0x14>
     6b8:	fff50537          	lui	a0,0xfff50
     6bc:	195000ef          	jal	1050 <neorv32_uart_printf>
                       A[0][0],A[0][1],A[0][2], A[1][0],A[1][1],A[1][2], A[2][0],A[2][1],A[2][2]);
  neorv32_uart0_printf("B = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     6c0:	01812f03          	lw	t5,24(sp)
     6c4:	01c12e83          	lw	t4,28(sp)
     6c8:	02012e03          	lw	t3,32(sp)
     6cc:	02412303          	lw	t1,36(sp)
     6d0:	000025b7          	lui	a1,0x2
     6d4:	01e12423          	sw	t5,8(sp)
     6d8:	00030893          	mv	a7,t1
     6dc:	000d8813          	mv	a6,s11
     6e0:	01d12223          	sw	t4,4(sp)
     6e4:	01c12023          	sw	t3,0(sp)
     6e8:	000d0793          	mv	a5,s10
     6ec:	000c8713          	mv	a4,s9
     6f0:	000c0693          	mv	a3,s8
     6f4:	000b8613          	mv	a2,s7
     6f8:	b5458593          	add	a1,a1,-1196 # 1b54 <__fini_array_end+0x3c>
     6fc:	fff50537          	lui	a0,0xfff50
     700:	151000ef          	jal	1050 <neorv32_uart_printf>
                       B[0][0],B[0][1],B[0][2], B[1][0],B[1][1],B[1][2], B[2][0],B[2][1],B[2][2]);

  /* single-shot */
  volatile uint32_t sink = 0;
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     704:	06810713          	add	a4,sp,104
     708:	04010693          	add	a3,sp,64
     70c:	03c10613          	add	a2,sp,60
     710:	05c10593          	add	a1,sp,92
     714:	05010513          	add	a0,sp,80
  volatile uint32_t sink = 0;
     718:	04012623          	sw	zero,76(sp)
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     71c:	ac9ff0ef          	jal	1e4 <bench_cfs_once>
     720:	04c12783          	lw	a5,76(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     724:	08c10713          	add	a4,sp,140
     728:	04810693          	add	a3,sp,72
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     72c:	00a787b3          	add	a5,a5,a0
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     730:	04410613          	add	a2,sp,68
     734:	05c10593          	add	a1,sp,92
     738:	05010513          	add	a0,sp,80
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     73c:	04f12623          	sw	a5,76(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     740:	cf1ff0ef          	jal	430 <bench_sw_once>
     744:	04c12783          	lw	a5,76(sp)
  (void)sink;

  /* results + match */
  neorv32_uart0_printf("CFS C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     748:	06812e83          	lw	t4,104(sp)
     74c:	06c12e03          	lw	t3,108(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     750:	00a787b3          	add	a5,a5,a0
  neorv32_uart0_printf("CFS C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     754:	07012303          	lw	t1,112(sp)
     758:	07412d83          	lw	s11,116(sp)
     75c:	07812c83          	lw	s9,120(sp)
     760:	07c12b83          	lw	s7,124(sp)
     764:	08012a83          	lw	s5,128(sp)
     768:	08412983          	lw	s3,132(sp)
     76c:	08812483          	lw	s1,136(sp)
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     770:	04f12623          	sw	a5,76(sp)
  (void)sink;
     774:	04c12783          	lw	a5,76(sp)
  neorv32_uart0_printf("CFS C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     778:	000025b7          	lui	a1,0x2
     77c:	00030713          	mv	a4,t1
     780:	000e0693          	mv	a3,t3
     784:	000e8613          	mv	a2,t4
     788:	000b8893          	mv	a7,s7
     78c:	000c8813          	mv	a6,s9
     790:	000d8793          	mv	a5,s11
     794:	b7c58593          	add	a1,a1,-1156 # 1b7c <__fini_array_end+0x64>
     798:	fff50537          	lui	a0,0xfff50
     79c:	00912423          	sw	s1,8(sp)
     7a0:	01312223          	sw	s3,4(sp)
     7a4:	01512023          	sw	s5,0(sp)
     7a8:	02612623          	sw	t1,44(sp)
     7ac:	03c12423          	sw	t3,40(sp)
     7b0:	03d12223          	sw	t4,36(sp)
     7b4:	09d000ef          	jal	1050 <neorv32_uart_printf>
                       Ccfs[0][0],Ccfs[0][1],Ccfs[0][2], Ccfs[1][0],Ccfs[1][1],Ccfs[1][2], Ccfs[2][0],Ccfs[2][1],Ccfs[2][2]);
  neorv32_uart0_printf("SW  C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
     7b8:	09812d03          	lw	s10,152(sp)
     7bc:	09c12c03          	lw	s8,156(sp)
     7c0:	0a012b03          	lw	s6,160(sp)
     7c4:	0a412a03          	lw	s4,164(sp)
     7c8:	0a812903          	lw	s2,168(sp)
     7cc:	0ac12403          	lw	s0,172(sp)
     7d0:	08c12603          	lw	a2,140(sp)
     7d4:	09012683          	lw	a3,144(sp)
     7d8:	09412703          	lw	a4,148(sp)
     7dc:	000025b7          	lui	a1,0x2
     7e0:	00812423          	sw	s0,8(sp)
     7e4:	01212223          	sw	s2,4(sp)
     7e8:	01412023          	sw	s4,0(sp)
     7ec:	000b0893          	mv	a7,s6
     7f0:	000c0813          	mv	a6,s8
     7f4:	000d0793          	mv	a5,s10
     7f8:	ba858593          	add	a1,a1,-1112 # 1ba8 <__fini_array_end+0x90>
     7fc:	fff50537          	lui	a0,0xfff50
     800:	02e12023          	sw	a4,32(sp)
     804:	00d12e23          	sw	a3,28(sp)
     808:	00c12c23          	sw	a2,24(sp)
     80c:	045000ef          	jal	1050 <neorv32_uart_printf>
                       Csw[0][0],Csw[0][1],Csw[0][2], Csw[1][0],Csw[1][1],Csw[1][2], Csw[2][0],Csw[2][1],Csw[2][2]);
  neorv32_uart0_printf("Match: %s\n",
     810:	01812603          	lw	a2,24(sp)
     814:	02412e83          	lw	t4,36(sp)
     818:	01c12683          	lw	a3,28(sp)
     81c:	02012703          	lw	a4,32(sp)
     820:	02812e03          	lw	t3,40(sp)
     824:	02c12303          	lw	t1,44(sp)
     828:	02ce9263          	bne	t4,a2,84c <run_case+0x2bc>
     82c:	02de1063          	bne	t3,a3,84c <run_case+0x2bc>
     830:	00e31e63          	bne	t1,a4,84c <run_case+0x2bc>
     834:	01ad9c63          	bne	s11,s10,84c <run_case+0x2bc>
     838:	018c9a63          	bne	s9,s8,84c <run_case+0x2bc>
     83c:	016b9863          	bne	s7,s6,84c <run_case+0x2bc>
     840:	014a9663          	bne	s5,s4,84c <run_case+0x2bc>
     844:	01299463          	bne	s3,s2,84c <run_case+0x2bc>
     848:	20848663          	beq	s1,s0,a54 <run_case+0x4c4>
     84c:	00002637          	lui	a2,0x2
     850:	b1c60613          	add	a2,a2,-1252 # 1b1c <__fini_array_end+0x4>
     854:	000025b7          	lui	a1,0x2
     858:	bd458593          	add	a1,a1,-1068 # 1bd4 <__fini_array_end+0xbc>
     85c:	fff50537          	lui	a0,0xfff50
     860:	7f0000ef          	jal	1050 <neorv32_uart_printf>
                       (Ccfs[0][0]==Csw[0][0] && Ccfs[0][1]==Csw[0][1] && Ccfs[0][2]==Csw[0][2] &&
                        Ccfs[1][0]==Csw[1][0] && Ccfs[1][1]==Csw[1][1] && Ccfs[1][2]==Csw[1][2] &&
                        Ccfs[2][0]==Csw[2][0] && Ccfs[2][1]==Csw[2][1] && Ccfs[2][2]==Csw[2][2]) ? "YES" : "NO");

  neorv32_uart0_printf("Single-shot:\n");
     864:	000025b7          	lui	a1,0x2
     868:	be058593          	add	a1,a1,-1056 # 1be0 <__fini_array_end+0xc8>
     86c:	fff50537          	lui	a0,0xfff50
     870:	7e0000ef          	jal	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n", cyc_hw, ins_hw);
     874:	04012683          	lw	a3,64(sp)
     878:	03c12603          	lw	a2,60(sp)
     87c:	00002cb7          	lui	s9,0x2
     880:	bf0c8593          	add	a1,s9,-1040 # 1bf0 <__fini_array_end+0xd8>
     884:	fff50537          	lui	a0,0xfff50
     888:	7c8000ef          	jal	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",  cyc_sw,  ins_sw);
     88c:	04812683          	lw	a3,72(sp)
     890:	04412603          	lw	a2,68(sp)
     894:	00002c37          	lui	s8,0x2
     898:	c0cc0593          	add	a1,s8,-1012 # 1c0c <__fini_array_end+0xf4>
     89c:	fff50537          	lui	a0,0xfff50
     8a0:	7b0000ef          	jal	1050 <neorv32_uart_printf>
     8a4:	01000413          	li	s0,16

  /* warm-up */
  for(int i=0;i<16;i++){ bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs); bench_sw_once(A,B,&cyc_sw,&ins_sw,Csw); }
     8a8:	06810713          	add	a4,sp,104
     8ac:	04010693          	add	a3,sp,64
     8b0:	03c10613          	add	a2,sp,60
     8b4:	05c10593          	add	a1,sp,92
     8b8:	05010513          	add	a0,sp,80
     8bc:	929ff0ef          	jal	1e4 <bench_cfs_once>
     8c0:	08c10713          	add	a4,sp,140
     8c4:	04810693          	add	a3,sp,72
     8c8:	04410613          	add	a2,sp,68
     8cc:	05c10593          	add	a1,sp,92
     8d0:	05010513          	add	a0,sp,80
     8d4:	fff40413          	add	s0,s0,-1
     8d8:	b59ff0ef          	jal	430 <bench_sw_once>
     8dc:	fc0416e3          	bnez	s0,8a8 <run_case+0x318>
     8e0:	3e800d13          	li	s10,1000

  /* averaged */
  uint64_t sum_cyc_hw=0,sum_ins_hw=0,sum_cyc_sw=0,sum_ins_sw=0;
     8e4:	00000493          	li	s1,0
     8e8:	00000a93          	li	s5,0
     8ec:	00000a13          	li	s4,0
     8f0:	00000993          	li	s3,0
     8f4:	00000b93          	li	s7,0
     8f8:	00000913          	li	s2,0
     8fc:	00000b13          	li	s6,0
  for(int i=0;i<N_BENCH_ITERS;i++){
    bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
     900:	06810713          	add	a4,sp,104
     904:	04010693          	add	a3,sp,64
     908:	03c10613          	add	a2,sp,60
     90c:	05c10593          	add	a1,sp,92
     910:	05010513          	add	a0,sp,80
     914:	8d1ff0ef          	jal	1e4 <bench_cfs_once>
    bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
     918:	08c10713          	add	a4,sp,140
     91c:	04810693          	add	a3,sp,72
     920:	04410613          	add	a2,sp,68
     924:	05c10593          	add	a1,sp,92
     928:	05010513          	add	a0,sp,80
     92c:	b05ff0ef          	jal	430 <bench_sw_once>
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     930:	03c12783          	lw	a5,60(sp)
  for(int i=0;i<N_BENCH_ITERS;i++){
     934:	fffd0d13          	add	s10,s10,-1
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     938:	00f907b3          	add	a5,s2,a5
     93c:	0127b733          	sltu	a4,a5,s2
     940:	00078913          	mv	s2,a5
     944:	04012783          	lw	a5,64(sp)
     948:	01670b33          	add	s6,a4,s6
     94c:	00f987b3          	add	a5,s3,a5
     950:	0137b733          	sltu	a4,a5,s3
     954:	00078993          	mv	s3,a5
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     958:	04412783          	lw	a5,68(sp)
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
     95c:	01770bb3          	add	s7,a4,s7
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
     960:	00f407b3          	add	a5,s0,a5
     964:	0087b733          	sltu	a4,a5,s0
     968:	00078413          	mv	s0,a5
     96c:	04812783          	lw	a5,72(sp)
     970:	01470a33          	add	s4,a4,s4
     974:	00f487b3          	add	a5,s1,a5
     978:	0097b733          	sltu	a4,a5,s1
     97c:	01570ab3          	add	s5,a4,s5
     980:	00078493          	mv	s1,a5
  for(int i=0;i<N_BENCH_ITERS;i++){
     984:	f60d1ee3          	bnez	s10,900 <run_case+0x370>
  }
  neorv32_uart0_printf("Averaged over %u iters:\n", (unsigned)N_BENCH_ITERS);
     988:	000025b7          	lui	a1,0x2
     98c:	3e800613          	li	a2,1000
     990:	c2858593          	add	a1,a1,-984 # 1c28 <__fini_array_end+0x110>
     994:	fff50537          	lui	a0,0xfff50
     998:	6b8000ef          	jal	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n",
     99c:	3e800613          	li	a2,1000
     9a0:	00000693          	li	a3,0
     9a4:	00098513          	mv	a0,s3
     9a8:	000b8593          	mv	a1,s7
     9ac:	1e9000ef          	jal	1394 <__udivdi3>
     9b0:	00050993          	mv	s3,a0
     9b4:	3e800613          	li	a2,1000
     9b8:	00000693          	li	a3,0
     9bc:	00090513          	mv	a0,s2
     9c0:	000b0593          	mv	a1,s6
     9c4:	1d1000ef          	jal	1394 <__udivdi3>
     9c8:	00050613          	mv	a2,a0
     9cc:	00098693          	mv	a3,s3
     9d0:	bf0c8593          	add	a1,s9,-1040
     9d4:	fff50537          	lui	a0,0xfff50
     9d8:	678000ef          	jal	1050 <neorv32_uart_printf>
    (uint32_t)(sum_cyc_hw/N_BENCH_ITERS), (uint32_t)(sum_ins_hw/N_BENCH_ITERS));
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     9dc:	3e800613          	li	a2,1000
     9e0:	00000693          	li	a3,0
     9e4:	00048513          	mv	a0,s1
     9e8:	000a8593          	mv	a1,s5
     9ec:	1a9000ef          	jal	1394 <__udivdi3>
     9f0:	00050493          	mv	s1,a0
     9f4:	3e800613          	li	a2,1000
     9f8:	00000693          	li	a3,0
     9fc:	00040513          	mv	a0,s0
     a00:	000a0593          	mv	a1,s4
     a04:	191000ef          	jal	1394 <__udivdi3>
    (uint32_t)(sum_cyc_sw/N_BENCH_ITERS), (uint32_t)(sum_ins_sw/N_BENCH_ITERS));
}
     a08:	0e812403          	lw	s0,232(sp)
     a0c:	0ec12083          	lw	ra,236(sp)
     a10:	0e012903          	lw	s2,224(sp)
     a14:	0dc12983          	lw	s3,220(sp)
     a18:	0d812a03          	lw	s4,216(sp)
     a1c:	0d412a83          	lw	s5,212(sp)
     a20:	0d012b03          	lw	s6,208(sp)
     a24:	0cc12b83          	lw	s7,204(sp)
     a28:	0c412c83          	lw	s9,196(sp)
     a2c:	0c012d03          	lw	s10,192(sp)
     a30:	0bc12d83          	lw	s11,188(sp)
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     a34:	00048693          	mv	a3,s1
     a38:	c0cc0593          	add	a1,s8,-1012
}
     a3c:	0e412483          	lw	s1,228(sp)
     a40:	0c812c03          	lw	s8,200(sp)
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     a44:	00050613          	mv	a2,a0
     a48:	fff50537          	lui	a0,0xfff50
}
     a4c:	0f010113          	add	sp,sp,240
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
     a50:	6000006f          	j	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("Match: %s\n",
     a54:	00002637          	lui	a2,0x2
     a58:	b1860613          	add	a2,a2,-1256 # 1b18 <__fini_array_end>
     a5c:	df9ff06f          	j	854 <run_case+0x2c4>

00000a60 <main>:

int main(void){
  neorv32_uart0_setup(19200,0);
     a60:	000055b7          	lui	a1,0x5
int main(void){
     a64:	fa010113          	add	sp,sp,-96
  neorv32_uart0_setup(19200,0);
     a68:	00000613          	li	a2,0
     a6c:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     a70:	fff50537          	lui	a0,0xfff50
int main(void){
     a74:	04112e23          	sw	ra,92(sp)
     a78:	04812c23          	sw	s0,88(sp)
     a7c:	04912a23          	sw	s1,84(sp)
     a80:	05212823          	sw	s2,80(sp)
     a84:	05312623          	sw	s3,76(sp)
     a88:	05412423          	sw	s4,72(sp)
     a8c:	05512223          	sw	s5,68(sp)
     a90:	05612023          	sw	s6,64(sp)
     a94:	03712e23          	sw	s7,60(sp)
  neorv32_uart0_setup(19200,0);
     a98:	294000ef          	jal	d2c <neorv32_uart_setup>
  neorv32_uart0_printf("\n[NEORV32 CFS 3x3 MatMul - Inputs, Results, Cycles, Instructions]\n");
     a9c:	000025b7          	lui	a1,0x2
     aa0:	c4458593          	add	a1,a1,-956 # 1c44 <__fini_array_end+0x12c>
     aa4:	fff50537          	lui	a0,0xfff50
     aa8:	5a8000ef          	jal	1050 <neorv32_uart_printf>
  neorv32_uart0_printf("CFS base = 0x%08x, iters=%u\n",
     aac:	000025b7          	lui	a1,0x2
     ab0:	3e800693          	li	a3,1000
     ab4:	ffeb0637          	lui	a2,0xffeb0
     ab8:	c8858593          	add	a1,a1,-888 # 1c88 <__fini_array_end+0x170>
     abc:	fff50537          	lui	a0,0xfff50
     ac0:	590000ef          	jal	1050 <neorv32_uart_printf>
                       (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);

  run_case("Case 1",
     ac4:	00500413          	li	s0,5
     ac8:	00200493          	li	s1,2
     acc:	00400913          	li	s2,4
     ad0:	00600993          	li	s3,6
     ad4:	00800a13          	li	s4,8
     ad8:	00100a93          	li	s5,1
     adc:	00300b93          	li	s7,3
     ae0:	00700b13          	li	s6,7
     ae4:	00900793          	li	a5,9
     ae8:	00002537          	lui	a0,0x2
     aec:	03512423          	sw	s5,40(sp)
     af0:	02912223          	sw	s1,36(sp)
     af4:	03712023          	sw	s7,32(sp)
     af8:	01212e23          	sw	s2,28(sp)
     afc:	00812c23          	sw	s0,24(sp)
     b00:	01312a23          	sw	s3,20(sp)
     b04:	01612823          	sw	s6,16(sp)
     b08:	01412623          	sw	s4,12(sp)
     b0c:	00f12423          	sw	a5,8(sp)
     b10:	00f12223          	sw	a5,4(sp)
     b14:	01412023          	sw	s4,0(sp)
     b18:	00700893          	li	a7,7
     b1c:	00600813          	li	a6,6
     b20:	00500793          	li	a5,5
     b24:	00400713          	li	a4,4
     b28:	00300693          	li	a3,3
     b2c:	00200613          	li	a2,2
     b30:	00100593          	li	a1,1
     b34:	ca850513          	add	a0,a0,-856 # 1ca8 <__fini_array_end+0x190>
     b38:	a59ff0ef          	jal	590 <run_case>
           7,8,9,
           9,8,7,
           6,5,4,
           3,2,1);

  run_case("Case 2",
     b3c:	00002537          	lui	a0,0x2
     b40:	03312223          	sw	s3,36(sp)
     b44:	00812e23          	sw	s0,28(sp)
     b48:	00812a23          	sw	s0,20(sp)
     b4c:	01212623          	sw	s2,12(sp)
     b50:	01712023          	sw	s7,0(sp)
     b54:	02012423          	sw	zero,40(sp)
     b58:	02012023          	sw	zero,32(sp)
     b5c:	00012c23          	sw	zero,24(sp)
     b60:	00012823          	sw	zero,16(sp)
     b64:	00012423          	sw	zero,8(sp)
     b68:	00012223          	sw	zero,4(sp)
     b6c:	00000893          	li	a7,0
     b70:	00200813          	li	a6,2
     b74:	00000793          	li	a5,0
     b78:	00200713          	li	a4,2
     b7c:	00000693          	li	a3,0
     b80:	00100613          	li	a2,1
     b84:	00000593          	li	a1,0
     b88:	cb050513          	add	a0,a0,-848 # 1cb0 <__fini_array_end+0x198>
     b8c:	a05ff0ef          	jal	590 <run_case>
           0,3,0,
           0,4,0,
           5,0,5,
           0,6,0);

  run_case("Case 3",
     b90:	00e00793          	li	a5,14
     b94:	02f12423          	sw	a5,40(sp)
     b98:	00a00793          	li	a5,10
     b9c:	00f12a23          	sw	a5,20(sp)
     ba0:	00002537          	lui	a0,0x2
     ba4:	00d00793          	li	a5,13
     ba8:	03412223          	sw	s4,36(sp)
     bac:	03612023          	sw	s6,32(sp)
     bb0:	01512e23          	sw	s5,28(sp)
     bb4:	00812c23          	sw	s0,24(sp)
     bb8:	01312823          	sw	s3,16(sp)
     bbc:	00912623          	sw	s1,12(sp)
     bc0:	00f12423          	sw	a5,8(sp)
     bc4:	01212223          	sw	s2,4(sp)
     bc8:	00912023          	sw	s1,0(sp)
     bcc:	cb850513          	add	a0,a0,-840 # 1cb8 <__fini_array_end+0x1a0>
     bd0:	00800893          	li	a7,8
     bd4:	00b00813          	li	a6,11
     bd8:	00900793          	li	a5,9
     bdc:	00500713          	li	a4,5
     be0:	00300693          	li	a3,3
     be4:	00700613          	li	a2,7
     be8:	00c00593          	li	a1,12
     bec:	9a5ff0ef          	jal	590 <run_case>
           13,2,6,
           10,5,1,
           7, 8,14);

  return 0;
}
     bf0:	05c12083          	lw	ra,92(sp)
     bf4:	05812403          	lw	s0,88(sp)
     bf8:	05412483          	lw	s1,84(sp)
     bfc:	05012903          	lw	s2,80(sp)
     c00:	04c12983          	lw	s3,76(sp)
     c04:	04812a03          	lw	s4,72(sp)
     c08:	04412a83          	lw	s5,68(sp)
     c0c:	04012b03          	lw	s6,64(sp)
     c10:	03c12b83          	lw	s7,60(sp)
     c14:	00000513          	li	a0,0
     c18:	06010113          	add	sp,sp,96
     c1c:	00008067          	ret

00000c20 <neorv32_aux_itoa>:
 *
 * @param[in,out] buffer Pointer to array for the result string [33 chars].
 * @param[in] num Number to convert.
 * @param[in] base Base of number representation (2..16).
 **************************************************************************/
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     c20:	fa010113          	add	sp,sp,-96
     c24:	04912a23          	sw	s1,84(sp)
     c28:	00058493          	mv	s1,a1

  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     c2c:	000025b7          	lui	a1,0x2
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     c30:	04812c23          	sw	s0,88(sp)
     c34:	05212823          	sw	s2,80(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     c38:	cc058593          	add	a1,a1,-832 # 1cc0 <__fini_array_end+0x1a8>
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     c3c:	00060913          	mv	s2,a2
     c40:	00050413          	mv	s0,a0
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     c44:	01000613          	li	a2,16
     c48:	00c10513          	add	a0,sp,12
void neorv32_aux_itoa(char *buffer, uint32_t num, uint32_t base) {
     c4c:	04112e23          	sw	ra,92(sp)
     c50:	05312623          	sw	s3,76(sp)
     c54:	05412423          	sw	s4,72(sp)
  const char digits[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
     c58:	50c000ef          	jal	1164 <memcpy>
  char *tmp_ptr = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(tmp); i++) {
    tmp[i] = 0;
     c5c:	02400613          	li	a2,36
     c60:	00000593          	li	a1,0
     c64:	01c10513          	add	a0,sp,28
     c68:	420000ef          	jal	1088 <memset>
  }

  if ((base < 2) || (base > 16)) { // invalid base?
     c6c:	ffe90713          	add	a4,s2,-2
     c70:	00e00793          	li	a5,14
     c74:	03f10993          	add	s3,sp,63
     c78:	02e7f463          	bgeu	a5,a4,ca0 <neorv32_aux_itoa+0x80>
      buffer++;
    }
  }

  // terminate result string
  *buffer = '\0';
     c7c:	00040023          	sb	zero,0(s0)
}
     c80:	05c12083          	lw	ra,92(sp)
     c84:	05812403          	lw	s0,88(sp)
     c88:	05412483          	lw	s1,84(sp)
     c8c:	05012903          	lw	s2,80(sp)
     c90:	04c12983          	lw	s3,76(sp)
     c94:	04812a03          	lw	s4,72(sp)
     c98:	06010113          	add	sp,sp,96
     c9c:	00008067          	ret
    *tmp_ptr = digits[num%base];
     ca0:	00090593          	mv	a1,s2
     ca4:	00048513          	mv	a0,s1
     ca8:	60d000ef          	jal	1ab4 <__umodsi3>
     cac:	04050793          	add	a5,a0,64
     cb0:	00278533          	add	a0,a5,sp
     cb4:	fcc54783          	lbu	a5,-52(a0)
    num /= base;
     cb8:	00090593          	mv	a1,s2
     cbc:	00048513          	mv	a0,s1
    *tmp_ptr = digits[num%base];
     cc0:	fef98fa3          	sb	a5,-1(s3)
     cc4:	00048a13          	mv	s4,s1
    num /= base;
     cc8:	5a5000ef          	jal	1a6c <__hidden___udivsi3>
    tmp_ptr--;
     ccc:	fff98993          	add	s3,s3,-1
    num /= base;
     cd0:	00050493          	mv	s1,a0
  } while (num != 0);
     cd4:	fd2a76e3          	bgeu	s4,s2,ca0 <neorv32_aux_itoa+0x80>
  for (i=0; i<sizeof(tmp); i++) {
     cd8:	00000793          	li	a5,0
     cdc:	02400693          	li	a3,36
    if (tmp[i] != '\0') {
     ce0:	01c10713          	add	a4,sp,28
     ce4:	00f70733          	add	a4,a4,a5
     ce8:	00074703          	lbu	a4,0(a4)
     cec:	00070663          	beqz	a4,cf8 <neorv32_aux_itoa+0xd8>
      *buffer = tmp[i];
     cf0:	00e40023          	sb	a4,0(s0)
      buffer++;
     cf4:	00140413          	add	s0,s0,1
  for (i=0; i<sizeof(tmp); i++) {
     cf8:	00178793          	add	a5,a5,1
     cfc:	fed792e3          	bne	a5,a3,ce0 <neorv32_aux_itoa+0xc0>
     d00:	f7dff06f          	j	c7c <neorv32_aux_itoa+0x5c>

00000d04 <neorv32_cpu_get_cycle>:
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     d04:	c80027f3          	rdcycleh	a5
     d08:	c0002573          	rdcycle	a0
     d0c:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     d10:	fef59ae3          	bne	a1,a5,d04 <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     d14:	00008067          	ret

00000d18 <neorv32_cpu_get_instret>:
     d18:	c82027f3          	rdinstreth	a5
     d1c:	c0202573          	rdinstret	a0
     d20:	c82025f3          	rdinstreth	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_INSTRETH);
    tmp2 = neorv32_cpu_csr_read(CSR_INSTRET);
    tmp3 = neorv32_cpu_csr_read(CSR_INSTRETH);
    if (tmp1 == tmp3) {
     d24:	fef59ae3          	bne	a1,a5,d18 <neorv32_cpu_get_instret>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     d28:	00008067          	ret

00000d2c <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     d2c:	ff010113          	add	sp,sp,-16
     d30:	00812423          	sw	s0,8(sp)
     d34:	00912223          	sw	s1,4(sp)
     d38:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
     d3c:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     d40:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     d44:	00050493          	mv	s1,a0
     d48:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ffde001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
     d4c:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     d50:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     d54:	519000ef          	jal	1a6c <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     d58:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
     d5c:	3fe00693          	li	a3,1022
     d60:	04a6e663          	bltu	a3,a0,dac <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     d64:	fff50793          	add	a5,a0,-1
     d68:	000106b7          	lui	a3,0x10
     d6c:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
     d70:	00679793          	sll	a5,a5,0x6
     d74:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     d78:	07c006b7          	lui	a3,0x7c00
     d7c:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     d80:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     d84:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     d88:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
     d8c:	00c12083          	lw	ra,12(sp)
     d90:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     d94:	00e7e7b3          	or	a5,a5,a4
     d98:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     d9c:	00f4a023          	sw	a5,0(s1)
}
     da0:	00412483          	lw	s1,4(sp)
     da4:	01010113          	add	sp,sp,16
     da8:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     dac:	ffe70793          	add	a5,a4,-2
     db0:	ffd7f793          	and	a5,a5,-3
     db4:	00079863          	bnez	a5,dc4 <neorv32_uart_setup+0x98>
      baud_div >>= 3;
     db8:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     dbc:	00170713          	add	a4,a4,1
     dc0:	fa1ff06f          	j	d60 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
     dc4:	00155513          	srl	a0,a0,0x1
     dc8:	ff5ff06f          	j	dbc <neorv32_uart_setup+0x90>

00000dcc <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     dcc:	00052783          	lw	a5,0(a0)
     dd0:	00a79713          	sll	a4,a5,0xa
     dd4:	fe075ce3          	bgez	a4,dcc <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     dd8:	00b52223          	sw	a1,4(a0)
}
     ddc:	00008067          	ret

00000de0 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     de0:	fe010113          	add	sp,sp,-32
     de4:	00812c23          	sw	s0,24(sp)
     de8:	00912a23          	sw	s1,20(sp)
     dec:	01312623          	sw	s3,12(sp)
     df0:	00112e23          	sw	ra,28(sp)
     df4:	01212823          	sw	s2,16(sp)
     df8:	00050493          	mv	s1,a0
     dfc:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     e00:	00a00993          	li	s3,10
  while ((c = *s++)) {
     e04:	00044903          	lbu	s2,0(s0)
     e08:	00140413          	add	s0,s0,1
     e0c:	02091063          	bnez	s2,e2c <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     e10:	01c12083          	lw	ra,28(sp)
     e14:	01812403          	lw	s0,24(sp)
     e18:	01412483          	lw	s1,20(sp)
     e1c:	01012903          	lw	s2,16(sp)
     e20:	00c12983          	lw	s3,12(sp)
     e24:	02010113          	add	sp,sp,32
     e28:	00008067          	ret
    if (c == '\n') {
     e2c:	01391863          	bne	s2,s3,e3c <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     e30:	00d00593          	li	a1,13
     e34:	00048513          	mv	a0,s1
     e38:	f95ff0ef          	jal	dcc <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     e3c:	00090593          	mv	a1,s2
     e40:	00048513          	mv	a0,s1
     e44:	f89ff0ef          	jal	dcc <neorv32_uart_putc>
     e48:	fbdff06f          	j	e04 <neorv32_uart_puts+0x24>

00000e4c <neorv32_uart_vprintf>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string.
 * @param[in] args A value identifying a variable arguments list.
 **************************************************************************/
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     e4c:	f9010113          	add	sp,sp,-112
     e50:	06812423          	sw	s0,104(sp)
     e54:	06912223          	sw	s1,100(sp)
     e58:	07212023          	sw	s2,96(sp)
     e5c:	05312e23          	sw	s3,92(sp)
     e60:	00050493          	mv	s1,a0
     e64:	00058913          	mv	s2,a1
     e68:	00060413          	mv	s0,a2
  int32_t n = 0;
  unsigned int i = 0;

  // prevent uninitialized stack bytes
  for (i=0; i<sizeof(string_buf); i++) {
    string_buf[i] = 0;
     e6c:	00000593          	li	a1,0
     e70:	02400613          	li	a2,36
     e74:	00c10513          	add	a0,sp,12
  }

  while ((c = *format++)) {
    if (c == '%') {
      c = tolower(*format++);
     e78:	000029b7          	lui	s3,0x2
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     e7c:	05412c23          	sw	s4,88(sp)
     e80:	05512a23          	sw	s5,84(sp)
     e84:	05712623          	sw	s7,76(sp)
     e88:	05812423          	sw	s8,72(sp)
     e8c:	05912223          	sw	s9,68(sp)
     e90:	05a12023          	sw	s10,64(sp)
     e94:	06112623          	sw	ra,108(sp)
     e98:	05612823          	sw	s6,80(sp)
     e9c:	03b12e23          	sw	s11,60(sp)
    if (c == '%') {
     ea0:	02500b93          	li	s7,37
    string_buf[i] = 0;
     ea4:	1e4000ef          	jal	1088 <memset>
          neorv32_uart_putc(UARTx, c);
          break;
      }
    }
    else {
      if (c == '\n') {
     ea8:	00a00c13          	li	s8,10
      c = tolower(*format++);
     eac:	cd598993          	add	s3,s3,-811 # 1cd5 <_ctype_+0x1>
     eb0:	00100c93          	li	s9,1
      switch (c) {
     eb4:	07000a13          	li	s4,112
     eb8:	07500d13          	li	s10,117
     ebc:	06300a93          	li	s5,99
  while ((c = *format++)) {
     ec0:	00094d83          	lbu	s11,0(s2)
     ec4:	040d9063          	bnez	s11,f04 <neorv32_uart_vprintf+0xb8>
        neorv32_uart_putc(UARTx, '\r');
      }
      neorv32_uart_putc(UARTx, c);
    }
  }
}
     ec8:	06c12083          	lw	ra,108(sp)
     ecc:	06812403          	lw	s0,104(sp)
     ed0:	06412483          	lw	s1,100(sp)
     ed4:	06012903          	lw	s2,96(sp)
     ed8:	05c12983          	lw	s3,92(sp)
     edc:	05812a03          	lw	s4,88(sp)
     ee0:	05412a83          	lw	s5,84(sp)
     ee4:	05012b03          	lw	s6,80(sp)
     ee8:	04c12b83          	lw	s7,76(sp)
     eec:	04812c03          	lw	s8,72(sp)
     ef0:	04412c83          	lw	s9,68(sp)
     ef4:	04012d03          	lw	s10,64(sp)
     ef8:	03c12d83          	lw	s11,60(sp)
     efc:	07010113          	add	sp,sp,112
     f00:	00008067          	ret
    if (c == '%') {
     f04:	137d9863          	bne	s11,s7,1034 <neorv32_uart_vprintf+0x1e8>
      c = tolower(*format++);
     f08:	00290b13          	add	s6,s2,2
     f0c:	00194903          	lbu	s2,1(s2)
     f10:	013907b3          	add	a5,s2,s3
     f14:	0007c783          	lbu	a5,0(a5)
     f18:	0037f793          	and	a5,a5,3
     f1c:	01979463          	bne	a5,s9,f24 <neorv32_uart_vprintf+0xd8>
     f20:	02090913          	add	s2,s2,32
      switch (c) {
     f24:	0ff97793          	zext.b	a5,s2
     f28:	0d478863          	beq	a5,s4,ff8 <neorv32_uart_vprintf+0x1ac>
     f2c:	06fa4c63          	blt	s4,a5,fa4 <neorv32_uart_vprintf+0x158>
     f30:	09578e63          	beq	a5,s5,fcc <neorv32_uart_vprintf+0x180>
     f34:	02fac663          	blt	s5,a5,f60 <neorv32_uart_vprintf+0x114>
     f38:	02500713          	li	a4,37
          neorv32_uart_putc(UARTx, c);
     f3c:	02500593          	li	a1,37
      switch (c) {
     f40:	00e78a63          	beq	a5,a4,f54 <neorv32_uart_vprintf+0x108>
          neorv32_uart_putc(UARTx, '%');
     f44:	02500593          	li	a1,37
     f48:	00048513          	mv	a0,s1
     f4c:	e81ff0ef          	jal	dcc <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     f50:	0ff97593          	zext.b	a1,s2
      neorv32_uart_putc(UARTx, c);
     f54:	00048513          	mv	a0,s1
     f58:	e75ff0ef          	jal	dcc <neorv32_uart_putc>
     f5c:	0840006f          	j	fe0 <neorv32_uart_vprintf+0x194>
      switch (c) {
     f60:	06400713          	li	a4,100
     f64:	00e78663          	beq	a5,a4,f70 <neorv32_uart_vprintf+0x124>
     f68:	06900713          	li	a4,105
     f6c:	fce79ce3          	bne	a5,a4,f44 <neorv32_uart_vprintf+0xf8>
          n = (int32_t)va_arg(args, int32_t);
     f70:	00440913          	add	s2,s0,4
     f74:	00042403          	lw	s0,0(s0)
          if (n < 0) {
     f78:	00045a63          	bgez	s0,f8c <neorv32_uart_vprintf+0x140>
            neorv32_uart_putc(UARTx, '-');
     f7c:	02d00593          	li	a1,45
     f80:	00048513          	mv	a0,s1
            n = -n;
     f84:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
     f88:	e45ff0ef          	jal	dcc <neorv32_uart_putc>
          neorv32_aux_itoa(string_buf, (uint32_t)n, 10);
     f8c:	00a00613          	li	a2,10
     f90:	00040593          	mv	a1,s0
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     f94:	00c10513          	add	a0,sp,12
     f98:	c89ff0ef          	jal	c20 <neorv32_aux_itoa>
          neorv32_uart_puts(UARTx, string_buf);
     f9c:	00c10593          	add	a1,sp,12
     fa0:	0200006f          	j	fc0 <neorv32_uart_vprintf+0x174>
      switch (c) {
     fa4:	05a78263          	beq	a5,s10,fe8 <neorv32_uart_vprintf+0x19c>
     fa8:	07800713          	li	a4,120
     fac:	04e78663          	beq	a5,a4,ff8 <neorv32_uart_vprintf+0x1ac>
     fb0:	07300713          	li	a4,115
     fb4:	f8e798e3          	bne	a5,a4,f44 <neorv32_uart_vprintf+0xf8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     fb8:	00042583          	lw	a1,0(s0)
     fbc:	00440913          	add	s2,s0,4
          neorv32_uart_puts(UARTx, string_buf);
     fc0:	00048513          	mv	a0,s1
     fc4:	e1dff0ef          	jal	de0 <neorv32_uart_puts>
          break;
     fc8:	0140006f          	j	fdc <neorv32_uart_vprintf+0x190>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
     fcc:	00044583          	lbu	a1,0(s0)
     fd0:	00048513          	mv	a0,s1
     fd4:	00440913          	add	s2,s0,4
     fd8:	df5ff0ef          	jal	dcc <neorv32_uart_putc>
     fdc:	00090413          	mv	s0,s2
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     fe0:	000b0913          	mv	s2,s6
     fe4:	eddff06f          	j	ec0 <neorv32_uart_vprintf+0x74>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 10);
     fe8:	00042583          	lw	a1,0(s0)
     fec:	00440913          	add	s2,s0,4
     ff0:	00a00613          	li	a2,10
     ff4:	fa1ff06f          	j	f94 <neorv32_uart_vprintf+0x148>
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
     ff8:	00042583          	lw	a1,0(s0)
     ffc:	01000613          	li	a2,16
    1000:	00c10513          	add	a0,sp,12
    1004:	c1dff0ef          	jal	c20 <neorv32_aux_itoa>
          i = 8 - strlen(string_buf);
    1008:	00c10513          	add	a0,sp,12
          neorv32_aux_itoa(string_buf, va_arg(args, uint32_t), 16);
    100c:	00440913          	add	s2,s0,4
          i = 8 - strlen(string_buf);
    1010:	2f8000ef          	jal	1308 <strlen>
    1014:	00800413          	li	s0,8
    1018:	40a40433          	sub	s0,s0,a0
          while (i--) { // add leading zeros
    101c:	f80400e3          	beqz	s0,f9c <neorv32_uart_vprintf+0x150>
            neorv32_uart_putc(UARTx, '0');
    1020:	03000593          	li	a1,48
    1024:	00048513          	mv	a0,s1
    1028:	da5ff0ef          	jal	dcc <neorv32_uart_putc>
    102c:	fff40413          	add	s0,s0,-1
    1030:	fedff06f          	j	101c <neorv32_uart_vprintf+0x1d0>
      if (c == '\n') {
    1034:	018d9863          	bne	s11,s8,1044 <neorv32_uart_vprintf+0x1f8>
        neorv32_uart_putc(UARTx, '\r');
    1038:	00d00593          	li	a1,13
    103c:	00048513          	mv	a0,s1
    1040:	d8dff0ef          	jal	dcc <neorv32_uart_putc>
  while ((c = *format++)) {
    1044:	00190b13          	add	s6,s2,1
      neorv32_uart_putc(UARTx, c);
    1048:	000d8593          	mv	a1,s11
    104c:	f09ff06f          	j	f54 <neorv32_uart_vprintf+0x108>

00001050 <neorv32_uart_printf>:
 * @note This function is blocking.
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] format Pointer to format string. See neorv32_uart_vprintf.
 **************************************************************************/
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    1050:	fc010113          	add	sp,sp,-64
    1054:	02c12423          	sw	a2,40(sp)

  va_list args;
  va_start(args, format);
    1058:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    105c:	00112e23          	sw	ra,28(sp)
    1060:	02d12623          	sw	a3,44(sp)
    1064:	02e12823          	sw	a4,48(sp)
    1068:	02f12a23          	sw	a5,52(sp)
    106c:	03012c23          	sw	a6,56(sp)
    1070:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
    1074:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    1078:	dd5ff0ef          	jal	e4c <neorv32_uart_vprintf>
  va_end(args);
}
    107c:	01c12083          	lw	ra,28(sp)
    1080:	04010113          	add	sp,sp,64
    1084:	00008067          	ret

00001088 <memset>:
    1088:	00f00313          	li	t1,15
    108c:	00050713          	mv	a4,a0
    1090:	02c37e63          	bgeu	t1,a2,10cc <memset+0x44>
    1094:	00f77793          	and	a5,a4,15
    1098:	0a079063          	bnez	a5,1138 <memset+0xb0>
    109c:	08059263          	bnez	a1,1120 <memset+0x98>
    10a0:	ff067693          	and	a3,a2,-16
    10a4:	00f67613          	and	a2,a2,15
    10a8:	00e686b3          	add	a3,a3,a4
    10ac:	00b72023          	sw	a1,0(a4)
    10b0:	00b72223          	sw	a1,4(a4)
    10b4:	00b72423          	sw	a1,8(a4)
    10b8:	00b72623          	sw	a1,12(a4)
    10bc:	01070713          	add	a4,a4,16
    10c0:	fed766e3          	bltu	a4,a3,10ac <memset+0x24>
    10c4:	00061463          	bnez	a2,10cc <memset+0x44>
    10c8:	00008067          	ret
    10cc:	40c306b3          	sub	a3,t1,a2
    10d0:	00269693          	sll	a3,a3,0x2
    10d4:	00000297          	auipc	t0,0x0
    10d8:	005686b3          	add	a3,a3,t0
    10dc:	00c68067          	jr	12(a3) # 7c0000c <__neorv32_rom_size+0x7bfc00c>
    10e0:	00b70723          	sb	a1,14(a4)
    10e4:	00b706a3          	sb	a1,13(a4)
    10e8:	00b70623          	sb	a1,12(a4)
    10ec:	00b705a3          	sb	a1,11(a4)
    10f0:	00b70523          	sb	a1,10(a4)
    10f4:	00b704a3          	sb	a1,9(a4)
    10f8:	00b70423          	sb	a1,8(a4)
    10fc:	00b703a3          	sb	a1,7(a4)
    1100:	00b70323          	sb	a1,6(a4)
    1104:	00b702a3          	sb	a1,5(a4)
    1108:	00b70223          	sb	a1,4(a4)
    110c:	00b701a3          	sb	a1,3(a4)
    1110:	00b70123          	sb	a1,2(a4)
    1114:	00b700a3          	sb	a1,1(a4)
    1118:	00b70023          	sb	a1,0(a4)
    111c:	00008067          	ret
    1120:	0ff5f593          	zext.b	a1,a1
    1124:	00859693          	sll	a3,a1,0x8
    1128:	00d5e5b3          	or	a1,a1,a3
    112c:	01059693          	sll	a3,a1,0x10
    1130:	00d5e5b3          	or	a1,a1,a3
    1134:	f6dff06f          	j	10a0 <memset+0x18>
    1138:	00279693          	sll	a3,a5,0x2
    113c:	00000297          	auipc	t0,0x0
    1140:	005686b3          	add	a3,a3,t0
    1144:	00008293          	mv	t0,ra
    1148:	fa0680e7          	jalr	-96(a3)
    114c:	00028093          	mv	ra,t0
    1150:	ff078793          	add	a5,a5,-16
    1154:	40f70733          	sub	a4,a4,a5
    1158:	00f60633          	add	a2,a2,a5
    115c:	f6c378e3          	bgeu	t1,a2,10cc <memset+0x44>
    1160:	f3dff06f          	j	109c <memset+0x14>

00001164 <memcpy>:
    1164:	00a5c7b3          	xor	a5,a1,a0
    1168:	0037f793          	and	a5,a5,3
    116c:	00c508b3          	add	a7,a0,a2
    1170:	06079463          	bnez	a5,11d8 <memcpy+0x74>
    1174:	00300793          	li	a5,3
    1178:	06c7f063          	bgeu	a5,a2,11d8 <memcpy+0x74>
    117c:	00357793          	and	a5,a0,3
    1180:	00050713          	mv	a4,a0
    1184:	06079a63          	bnez	a5,11f8 <memcpy+0x94>
    1188:	ffc8f613          	and	a2,a7,-4
    118c:	40e606b3          	sub	a3,a2,a4
    1190:	02000793          	li	a5,32
    1194:	08d7ce63          	blt	a5,a3,1230 <memcpy+0xcc>
    1198:	00058693          	mv	a3,a1
    119c:	00070793          	mv	a5,a4
    11a0:	02c77863          	bgeu	a4,a2,11d0 <memcpy+0x6c>
    11a4:	0006a803          	lw	a6,0(a3)
    11a8:	00478793          	add	a5,a5,4
    11ac:	00468693          	add	a3,a3,4
    11b0:	ff07ae23          	sw	a6,-4(a5)
    11b4:	fec7e8e3          	bltu	a5,a2,11a4 <memcpy+0x40>
    11b8:	fff60793          	add	a5,a2,-1 # ffeaffff <__crt0_ram_last+0x7feae000>
    11bc:	40e787b3          	sub	a5,a5,a4
    11c0:	ffc7f793          	and	a5,a5,-4
    11c4:	00478793          	add	a5,a5,4
    11c8:	00f70733          	add	a4,a4,a5
    11cc:	00f585b3          	add	a1,a1,a5
    11d0:	01176863          	bltu	a4,a7,11e0 <memcpy+0x7c>
    11d4:	00008067          	ret
    11d8:	00050713          	mv	a4,a0
    11dc:	05157863          	bgeu	a0,a7,122c <memcpy+0xc8>
    11e0:	0005c783          	lbu	a5,0(a1)
    11e4:	00170713          	add	a4,a4,1
    11e8:	00158593          	add	a1,a1,1
    11ec:	fef70fa3          	sb	a5,-1(a4)
    11f0:	fee898e3          	bne	a7,a4,11e0 <memcpy+0x7c>
    11f4:	00008067          	ret
    11f8:	0005c683          	lbu	a3,0(a1)
    11fc:	00170713          	add	a4,a4,1
    1200:	00377793          	and	a5,a4,3
    1204:	fed70fa3          	sb	a3,-1(a4)
    1208:	00158593          	add	a1,a1,1
    120c:	f6078ee3          	beqz	a5,1188 <memcpy+0x24>
    1210:	0005c683          	lbu	a3,0(a1)
    1214:	00170713          	add	a4,a4,1
    1218:	00377793          	and	a5,a4,3
    121c:	fed70fa3          	sb	a3,-1(a4)
    1220:	00158593          	add	a1,a1,1
    1224:	fc079ae3          	bnez	a5,11f8 <memcpy+0x94>
    1228:	f61ff06f          	j	1188 <memcpy+0x24>
    122c:	00008067          	ret
    1230:	ff010113          	add	sp,sp,-16
    1234:	00812623          	sw	s0,12(sp)
    1238:	02000413          	li	s0,32
    123c:	0005a383          	lw	t2,0(a1)
    1240:	0045a283          	lw	t0,4(a1)
    1244:	0085af83          	lw	t6,8(a1)
    1248:	00c5af03          	lw	t5,12(a1)
    124c:	0105ae83          	lw	t4,16(a1)
    1250:	0145ae03          	lw	t3,20(a1)
    1254:	0185a303          	lw	t1,24(a1)
    1258:	01c5a803          	lw	a6,28(a1)
    125c:	0205a683          	lw	a3,32(a1)
    1260:	02470713          	add	a4,a4,36
    1264:	40e607b3          	sub	a5,a2,a4
    1268:	fc772e23          	sw	t2,-36(a4)
    126c:	fe572023          	sw	t0,-32(a4)
    1270:	fff72223          	sw	t6,-28(a4)
    1274:	ffe72423          	sw	t5,-24(a4)
    1278:	ffd72623          	sw	t4,-20(a4)
    127c:	ffc72823          	sw	t3,-16(a4)
    1280:	fe672a23          	sw	t1,-12(a4)
    1284:	ff072c23          	sw	a6,-8(a4)
    1288:	fed72e23          	sw	a3,-4(a4)
    128c:	02458593          	add	a1,a1,36
    1290:	faf446e3          	blt	s0,a5,123c <memcpy+0xd8>
    1294:	00058693          	mv	a3,a1
    1298:	00070793          	mv	a5,a4
    129c:	02c77863          	bgeu	a4,a2,12cc <memcpy+0x168>
    12a0:	0006a803          	lw	a6,0(a3)
    12a4:	00478793          	add	a5,a5,4
    12a8:	00468693          	add	a3,a3,4
    12ac:	ff07ae23          	sw	a6,-4(a5)
    12b0:	fec7e8e3          	bltu	a5,a2,12a0 <memcpy+0x13c>
    12b4:	fff60793          	add	a5,a2,-1
    12b8:	40e787b3          	sub	a5,a5,a4
    12bc:	ffc7f793          	and	a5,a5,-4
    12c0:	00478793          	add	a5,a5,4
    12c4:	00f70733          	add	a4,a4,a5
    12c8:	00f585b3          	add	a1,a1,a5
    12cc:	01176863          	bltu	a4,a7,12dc <memcpy+0x178>
    12d0:	00c12403          	lw	s0,12(sp)
    12d4:	01010113          	add	sp,sp,16
    12d8:	00008067          	ret
    12dc:	0005c783          	lbu	a5,0(a1)
    12e0:	00170713          	add	a4,a4,1
    12e4:	00158593          	add	a1,a1,1
    12e8:	fef70fa3          	sb	a5,-1(a4)
    12ec:	fee882e3          	beq	a7,a4,12d0 <memcpy+0x16c>
    12f0:	0005c783          	lbu	a5,0(a1)
    12f4:	00170713          	add	a4,a4,1
    12f8:	00158593          	add	a1,a1,1
    12fc:	fef70fa3          	sb	a5,-1(a4)
    1300:	fce89ee3          	bne	a7,a4,12dc <memcpy+0x178>
    1304:	fcdff06f          	j	12d0 <memcpy+0x16c>

00001308 <strlen>:
    1308:	00357793          	and	a5,a0,3
    130c:	00050713          	mv	a4,a0
    1310:	04079c63          	bnez	a5,1368 <strlen+0x60>
    1314:	7f7f86b7          	lui	a3,0x7f7f8
    1318:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7f3f7f>
    131c:	fff00593          	li	a1,-1
    1320:	00072603          	lw	a2,0(a4)
    1324:	00470713          	add	a4,a4,4
    1328:	00d677b3          	and	a5,a2,a3
    132c:	00d787b3          	add	a5,a5,a3
    1330:	00c7e7b3          	or	a5,a5,a2
    1334:	00d7e7b3          	or	a5,a5,a3
    1338:	feb784e3          	beq	a5,a1,1320 <strlen+0x18>
    133c:	ffc74683          	lbu	a3,-4(a4)
    1340:	40a707b3          	sub	a5,a4,a0
    1344:	04068463          	beqz	a3,138c <strlen+0x84>
    1348:	ffd74683          	lbu	a3,-3(a4)
    134c:	02068c63          	beqz	a3,1384 <strlen+0x7c>
    1350:	ffe74503          	lbu	a0,-2(a4)
    1354:	00a03533          	snez	a0,a0
    1358:	00f50533          	add	a0,a0,a5
    135c:	ffe50513          	add	a0,a0,-2
    1360:	00008067          	ret
    1364:	fa0688e3          	beqz	a3,1314 <strlen+0xc>
    1368:	00074783          	lbu	a5,0(a4)
    136c:	00170713          	add	a4,a4,1
    1370:	00377693          	and	a3,a4,3
    1374:	fe0798e3          	bnez	a5,1364 <strlen+0x5c>
    1378:	40a70733          	sub	a4,a4,a0
    137c:	fff70513          	add	a0,a4,-1
    1380:	00008067          	ret
    1384:	ffd78513          	add	a0,a5,-3
    1388:	00008067          	ret
    138c:	ffc78513          	add	a0,a5,-4
    1390:	00008067          	ret

00001394 <__udivdi3>:
    1394:	fd010113          	add	sp,sp,-48
    1398:	01312e23          	sw	s3,28(sp)
    139c:	02112623          	sw	ra,44(sp)
    13a0:	01612823          	sw	s6,16(sp)
    13a4:	00050993          	mv	s3,a0
    13a8:	16069663          	bnez	a3,1514 <__udivdi3+0x180>
    13ac:	02812423          	sw	s0,40(sp)
    13b0:	01512a23          	sw	s5,20(sp)
    13b4:	02912223          	sw	s1,36(sp)
    13b8:	03212023          	sw	s2,32(sp)
    13bc:	01412c23          	sw	s4,24(sp)
    13c0:	00060a93          	mv	s5,a2
    13c4:	00050413          	mv	s0,a0
    13c8:	1cc5f063          	bgeu	a1,a2,1588 <__udivdi3+0x1f4>
    13cc:	000107b7          	lui	a5,0x10
    13d0:	00058493          	mv	s1,a1
    13d4:	2af66e63          	bltu	a2,a5,1690 <__udivdi3+0x2fc>
    13d8:	010007b7          	lui	a5,0x1000
    13dc:	01800713          	li	a4,24
    13e0:	00f67463          	bgeu	a2,a5,13e8 <__udivdi3+0x54>
    13e4:	01000713          	li	a4,16
    13e8:	00e656b3          	srl	a3,a2,a4
    13ec:	00001797          	auipc	a5,0x1
    13f0:	9ec78793          	add	a5,a5,-1556 # 1dd8 <__clz_tab>
    13f4:	00d787b3          	add	a5,a5,a3
    13f8:	0007c783          	lbu	a5,0(a5)
    13fc:	02000693          	li	a3,32
    1400:	00e787b3          	add	a5,a5,a4
    1404:	40f68733          	sub	a4,a3,a5
    1408:	00f68c63          	beq	a3,a5,1420 <__udivdi3+0x8c>
    140c:	00e594b3          	sll	s1,a1,a4
    1410:	00f9d7b3          	srl	a5,s3,a5
    1414:	00e61ab3          	sll	s5,a2,a4
    1418:	0097e4b3          	or	s1,a5,s1
    141c:	00e99433          	sll	s0,s3,a4
    1420:	010ada13          	srl	s4,s5,0x10
    1424:	000a0593          	mv	a1,s4
    1428:	00048513          	mv	a0,s1
    142c:	010a9b13          	sll	s6,s5,0x10
    1430:	63c000ef          	jal	1a6c <__hidden___udivsi3>
    1434:	010b5b13          	srl	s6,s6,0x10
    1438:	00050593          	mv	a1,a0
    143c:	00050913          	mv	s2,a0
    1440:	000b0513          	mv	a0,s6
    1444:	5fc000ef          	jal	1a40 <__mulsi3>
    1448:	00050793          	mv	a5,a0
    144c:	000a0593          	mv	a1,s4
    1450:	00048513          	mv	a0,s1
    1454:	00078493          	mv	s1,a5
    1458:	65c000ef          	jal	1ab4 <__umodsi3>
    145c:	01051513          	sll	a0,a0,0x10
    1460:	01045793          	srl	a5,s0,0x10
    1464:	00a7e7b3          	or	a5,a5,a0
    1468:	0097fc63          	bgeu	a5,s1,1480 <__udivdi3+0xec>
    146c:	00fa87b3          	add	a5,s5,a5
    1470:	fff90713          	add	a4,s2,-1
    1474:	0157e463          	bltu	a5,s5,147c <__udivdi3+0xe8>
    1478:	5a97e863          	bltu	a5,s1,1a28 <__udivdi3+0x694>
    147c:	00070913          	mv	s2,a4
    1480:	409784b3          	sub	s1,a5,s1
    1484:	000a0593          	mv	a1,s4
    1488:	00048513          	mv	a0,s1
    148c:	5e0000ef          	jal	1a6c <__hidden___udivsi3>
    1490:	00050593          	mv	a1,a0
    1494:	00050993          	mv	s3,a0
    1498:	000b0513          	mv	a0,s6
    149c:	5a4000ef          	jal	1a40 <__mulsi3>
    14a0:	00050793          	mv	a5,a0
    14a4:	000a0593          	mv	a1,s4
    14a8:	00048513          	mv	a0,s1
    14ac:	01041413          	sll	s0,s0,0x10
    14b0:	00078493          	mv	s1,a5
    14b4:	600000ef          	jal	1ab4 <__umodsi3>
    14b8:	01051513          	sll	a0,a0,0x10
    14bc:	01045413          	srl	s0,s0,0x10
    14c0:	00a46433          	or	s0,s0,a0
    14c4:	00947c63          	bgeu	s0,s1,14dc <__udivdi3+0x148>
    14c8:	008a8433          	add	s0,s5,s0
    14cc:	fff98793          	add	a5,s3,-1
    14d0:	4d546e63          	bltu	s0,s5,19ac <__udivdi3+0x618>
    14d4:	ffe98993          	add	s3,s3,-2
    14d8:	4c947a63          	bgeu	s0,s1,19ac <__udivdi3+0x618>
    14dc:	01091613          	sll	a2,s2,0x10
    14e0:	01366533          	or	a0,a2,s3
    14e4:	00000b13          	li	s6,0
    14e8:	02812403          	lw	s0,40(sp)
    14ec:	02c12083          	lw	ra,44(sp)
    14f0:	02412483          	lw	s1,36(sp)
    14f4:	02012903          	lw	s2,32(sp)
    14f8:	01812a03          	lw	s4,24(sp)
    14fc:	01412a83          	lw	s5,20(sp)
    1500:	01c12983          	lw	s3,28(sp)
    1504:	000b0593          	mv	a1,s6
    1508:	01012b03          	lw	s6,16(sp)
    150c:	03010113          	add	sp,sp,48
    1510:	00008067          	ret
    1514:	02d5f263          	bgeu	a1,a3,1538 <__udivdi3+0x1a4>
    1518:	00000b13          	li	s6,0
    151c:	00000513          	li	a0,0
    1520:	02c12083          	lw	ra,44(sp)
    1524:	01c12983          	lw	s3,28(sp)
    1528:	000b0593          	mv	a1,s6
    152c:	01012b03          	lw	s6,16(sp)
    1530:	03010113          	add	sp,sp,48
    1534:	00008067          	ret
    1538:	000107b7          	lui	a5,0x10
    153c:	26f6ee63          	bltu	a3,a5,17b8 <__udivdi3+0x424>
    1540:	01000737          	lui	a4,0x1000
    1544:	01800793          	li	a5,24
    1548:	00e6f463          	bgeu	a3,a4,1550 <__udivdi3+0x1bc>
    154c:	01000793          	li	a5,16
    1550:	00f6d533          	srl	a0,a3,a5
    1554:	00001717          	auipc	a4,0x1
    1558:	88470713          	add	a4,a4,-1916 # 1dd8 <__clz_tab>
    155c:	00a70733          	add	a4,a4,a0
    1560:	00074703          	lbu	a4,0(a4)
    1564:	02000513          	li	a0,32
    1568:	00f70733          	add	a4,a4,a5
    156c:	40e50b33          	sub	s6,a0,a4
    1570:	26e51c63          	bne	a0,a4,17e8 <__udivdi3+0x454>
    1574:	46b6ee63          	bltu	a3,a1,19f0 <__udivdi3+0x65c>
    1578:	00c9b533          	sltu	a0,s3,a2
    157c:	00153513          	seqz	a0,a0
    1580:	00000b13          	li	s6,0
    1584:	f9dff06f          	j	1520 <__udivdi3+0x18c>
    1588:	10060c63          	beqz	a2,16a0 <__udivdi3+0x30c>
    158c:	000107b7          	lui	a5,0x10
    1590:	44f67663          	bgeu	a2,a5,19dc <__udivdi3+0x648>
    1594:	10063713          	sltiu	a4,a2,256
    1598:	00173713          	seqz	a4,a4
    159c:	00371713          	sll	a4,a4,0x3
    15a0:	00e656b3          	srl	a3,a2,a4
    15a4:	00001797          	auipc	a5,0x1
    15a8:	83478793          	add	a5,a5,-1996 # 1dd8 <__clz_tab>
    15ac:	00d787b3          	add	a5,a5,a3
    15b0:	0007c483          	lbu	s1,0(a5)
    15b4:	02000793          	li	a5,32
    15b8:	00e484b3          	add	s1,s1,a4
    15bc:	40978733          	sub	a4,a5,s1
    15c0:	10979463          	bne	a5,s1,16c8 <__udivdi3+0x334>
    15c4:	01061a13          	sll	s4,a2,0x10
    15c8:	40c584b3          	sub	s1,a1,a2
    15cc:	01065913          	srl	s2,a2,0x10
    15d0:	010a5a13          	srl	s4,s4,0x10
    15d4:	00100b13          	li	s6,1
    15d8:	00090593          	mv	a1,s2
    15dc:	00048513          	mv	a0,s1
    15e0:	48c000ef          	jal	1a6c <__hidden___udivsi3>
    15e4:	000a0593          	mv	a1,s4
    15e8:	00050993          	mv	s3,a0
    15ec:	454000ef          	jal	1a40 <__mulsi3>
    15f0:	00050793          	mv	a5,a0
    15f4:	00090593          	mv	a1,s2
    15f8:	00048513          	mv	a0,s1
    15fc:	00078493          	mv	s1,a5
    1600:	4b4000ef          	jal	1ab4 <__umodsi3>
    1604:	01051513          	sll	a0,a0,0x10
    1608:	01045793          	srl	a5,s0,0x10
    160c:	00a7e7b3          	or	a5,a5,a0
    1610:	0097fc63          	bgeu	a5,s1,1628 <__udivdi3+0x294>
    1614:	00fa87b3          	add	a5,s5,a5
    1618:	fff98713          	add	a4,s3,-1
    161c:	0157e463          	bltu	a5,s5,1624 <__udivdi3+0x290>
    1620:	3e97ee63          	bltu	a5,s1,1a1c <__udivdi3+0x688>
    1624:	00070993          	mv	s3,a4
    1628:	409784b3          	sub	s1,a5,s1
    162c:	00090593          	mv	a1,s2
    1630:	00048513          	mv	a0,s1
    1634:	438000ef          	jal	1a6c <__hidden___udivsi3>
    1638:	000a0593          	mv	a1,s4
    163c:	00050a13          	mv	s4,a0
    1640:	400000ef          	jal	1a40 <__mulsi3>
    1644:	00050793          	mv	a5,a0
    1648:	00090593          	mv	a1,s2
    164c:	00048513          	mv	a0,s1
    1650:	01041413          	sll	s0,s0,0x10
    1654:	00078493          	mv	s1,a5
    1658:	45c000ef          	jal	1ab4 <__umodsi3>
    165c:	01051513          	sll	a0,a0,0x10
    1660:	01045413          	srl	s0,s0,0x10
    1664:	00a46433          	or	s0,s0,a0
    1668:	00947e63          	bgeu	s0,s1,1684 <__udivdi3+0x2f0>
    166c:	008a8433          	add	s0,s5,s0
    1670:	fffa0793          	add	a5,s4,-1
    1674:	01546663          	bltu	s0,s5,1680 <__udivdi3+0x2ec>
    1678:	ffea0a13          	add	s4,s4,-2
    167c:	00946463          	bltu	s0,s1,1684 <__udivdi3+0x2f0>
    1680:	00078a13          	mv	s4,a5
    1684:	01099613          	sll	a2,s3,0x10
    1688:	01466533          	or	a0,a2,s4
    168c:	e5dff06f          	j	14e8 <__udivdi3+0x154>
    1690:	10063713          	sltiu	a4,a2,256
    1694:	00173713          	seqz	a4,a4
    1698:	00371713          	sll	a4,a4,0x3
    169c:	d4dff06f          	j	13e8 <__udivdi3+0x54>
    16a0:	00000693          	li	a3,0
    16a4:	00000797          	auipc	a5,0x0
    16a8:	73478793          	add	a5,a5,1844 # 1dd8 <__clz_tab>
    16ac:	00d787b3          	add	a5,a5,a3
    16b0:	0007c483          	lbu	s1,0(a5)
    16b4:	00000713          	li	a4,0
    16b8:	02000793          	li	a5,32
    16bc:	00e484b3          	add	s1,s1,a4
    16c0:	40978733          	sub	a4,a5,s1
    16c4:	f09780e3          	beq	a5,s1,15c4 <__udivdi3+0x230>
    16c8:	00e61ab3          	sll	s5,a2,a4
    16cc:	01712623          	sw	s7,12(sp)
    16d0:	010ad913          	srl	s2,s5,0x10
    16d4:	0095dbb3          	srl	s7,a1,s1
    16d8:	00e597b3          	sll	a5,a1,a4
    16dc:	0099d4b3          	srl	s1,s3,s1
    16e0:	00090593          	mv	a1,s2
    16e4:	000b8513          	mv	a0,s7
    16e8:	010a9a13          	sll	s4,s5,0x10
    16ec:	00f4e4b3          	or	s1,s1,a5
    16f0:	00e99433          	sll	s0,s3,a4
    16f4:	010a5a13          	srl	s4,s4,0x10
    16f8:	374000ef          	jal	1a6c <__hidden___udivsi3>
    16fc:	00050593          	mv	a1,a0
    1700:	00050b13          	mv	s6,a0
    1704:	000a0513          	mv	a0,s4
    1708:	338000ef          	jal	1a40 <__mulsi3>
    170c:	00050993          	mv	s3,a0
    1710:	00090593          	mv	a1,s2
    1714:	000b8513          	mv	a0,s7
    1718:	39c000ef          	jal	1ab4 <__umodsi3>
    171c:	01051513          	sll	a0,a0,0x10
    1720:	0104d793          	srl	a5,s1,0x10
    1724:	00a7e7b3          	or	a5,a5,a0
    1728:	0137fe63          	bgeu	a5,s3,1744 <__udivdi3+0x3b0>
    172c:	00fa87b3          	add	a5,s5,a5
    1730:	fffb0713          	add	a4,s6,-1
    1734:	2d57ec63          	bltu	a5,s5,1a0c <__udivdi3+0x678>
    1738:	2d37fa63          	bgeu	a5,s3,1a0c <__udivdi3+0x678>
    173c:	ffeb0b13          	add	s6,s6,-2
    1740:	015787b3          	add	a5,a5,s5
    1744:	413789b3          	sub	s3,a5,s3
    1748:	00090593          	mv	a1,s2
    174c:	00098513          	mv	a0,s3
    1750:	31c000ef          	jal	1a6c <__hidden___udivsi3>
    1754:	00050593          	mv	a1,a0
    1758:	00050b93          	mv	s7,a0
    175c:	000a0513          	mv	a0,s4
    1760:	2e0000ef          	jal	1a40 <__mulsi3>
    1764:	00050793          	mv	a5,a0
    1768:	00090593          	mv	a1,s2
    176c:	00098513          	mv	a0,s3
    1770:	01049493          	sll	s1,s1,0x10
    1774:	00078993          	mv	s3,a5
    1778:	33c000ef          	jal	1ab4 <__umodsi3>
    177c:	01051513          	sll	a0,a0,0x10
    1780:	0104d493          	srl	s1,s1,0x10
    1784:	00a4e4b3          	or	s1,s1,a0
    1788:	0134fe63          	bgeu	s1,s3,17a4 <__udivdi3+0x410>
    178c:	009a84b3          	add	s1,s5,s1
    1790:	fffb8793          	add	a5,s7,-1
    1794:	2754e463          	bltu	s1,s5,19fc <__udivdi3+0x668>
    1798:	2734f263          	bgeu	s1,s3,19fc <__udivdi3+0x668>
    179c:	ffeb8b93          	add	s7,s7,-2
    17a0:	015484b3          	add	s1,s1,s5
    17a4:	010b1b13          	sll	s6,s6,0x10
    17a8:	017b6b33          	or	s6,s6,s7
    17ac:	413484b3          	sub	s1,s1,s3
    17b0:	00c12b83          	lw	s7,12(sp)
    17b4:	e25ff06f          	j	15d8 <__udivdi3+0x244>
    17b8:	1006b793          	sltiu	a5,a3,256
    17bc:	0017b793          	seqz	a5,a5
    17c0:	00379793          	sll	a5,a5,0x3
    17c4:	00f6d533          	srl	a0,a3,a5
    17c8:	00000717          	auipc	a4,0x0
    17cc:	61070713          	add	a4,a4,1552 # 1dd8 <__clz_tab>
    17d0:	00a70733          	add	a4,a4,a0
    17d4:	00074703          	lbu	a4,0(a4)
    17d8:	02000513          	li	a0,32
    17dc:	00f70733          	add	a4,a4,a5
    17e0:	40e50b33          	sub	s6,a0,a4
    17e4:	d8e508e3          	beq	a0,a4,1574 <__udivdi3+0x1e0>
    17e8:	016696b3          	sll	a3,a3,s6
    17ec:	01912223          	sw	s9,4(sp)
    17f0:	00e65cb3          	srl	s9,a2,a4
    17f4:	00dcecb3          	or	s9,s9,a3
    17f8:	01512a23          	sw	s5,20(sp)
    17fc:	01712623          	sw	s7,12(sp)
    1800:	010cda93          	srl	s5,s9,0x10
    1804:	00e5dbb3          	srl	s7,a1,a4
    1808:	016597b3          	sll	a5,a1,s6
    180c:	00e9d733          	srl	a4,s3,a4
    1810:	01812423          	sw	s8,8(sp)
    1814:	000a8593          	mv	a1,s5
    1818:	000b8513          	mv	a0,s7
    181c:	010c9c13          	sll	s8,s9,0x10
    1820:	02812423          	sw	s0,40(sp)
    1824:	02912223          	sw	s1,36(sp)
    1828:	03212023          	sw	s2,32(sp)
    182c:	00f764b3          	or	s1,a4,a5
    1830:	01661933          	sll	s2,a2,s6
    1834:	01412c23          	sw	s4,24(sp)
    1838:	010c5c13          	srl	s8,s8,0x10
    183c:	230000ef          	jal	1a6c <__hidden___udivsi3>
    1840:	00050593          	mv	a1,a0
    1844:	00050413          	mv	s0,a0
    1848:	000c0513          	mv	a0,s8
    184c:	1f4000ef          	jal	1a40 <__mulsi3>
    1850:	00050a13          	mv	s4,a0
    1854:	000a8593          	mv	a1,s5
    1858:	000b8513          	mv	a0,s7
    185c:	258000ef          	jal	1ab4 <__umodsi3>
    1860:	01051513          	sll	a0,a0,0x10
    1864:	0104d793          	srl	a5,s1,0x10
    1868:	00a7e7b3          	or	a5,a5,a0
    186c:	0147fe63          	bgeu	a5,s4,1888 <__udivdi3+0x4f4>
    1870:	00fc87b3          	add	a5,s9,a5
    1874:	fff40713          	add	a4,s0,-1
    1878:	1997ee63          	bltu	a5,s9,1a14 <__udivdi3+0x680>
    187c:	1947fc63          	bgeu	a5,s4,1a14 <__udivdi3+0x680>
    1880:	ffe40413          	add	s0,s0,-2
    1884:	019787b3          	add	a5,a5,s9
    1888:	41478a33          	sub	s4,a5,s4
    188c:	000a8593          	mv	a1,s5
    1890:	000a0513          	mv	a0,s4
    1894:	1d8000ef          	jal	1a6c <__hidden___udivsi3>
    1898:	00050593          	mv	a1,a0
    189c:	00050b93          	mv	s7,a0
    18a0:	000c0513          	mv	a0,s8
    18a4:	19c000ef          	jal	1a40 <__mulsi3>
    18a8:	00050793          	mv	a5,a0
    18ac:	000a8593          	mv	a1,s5
    18b0:	000a0513          	mv	a0,s4
    18b4:	00078a13          	mv	s4,a5
    18b8:	1fc000ef          	jal	1ab4 <__umodsi3>
    18bc:	01049713          	sll	a4,s1,0x10
    18c0:	01051513          	sll	a0,a0,0x10
    18c4:	01075713          	srl	a4,a4,0x10
    18c8:	00a76733          	or	a4,a4,a0
    18cc:	01477e63          	bgeu	a4,s4,18e8 <__udivdi3+0x554>
    18d0:	00ec8733          	add	a4,s9,a4
    18d4:	fffb8793          	add	a5,s7,-1
    18d8:	13976663          	bltu	a4,s9,1a04 <__udivdi3+0x670>
    18dc:	13477463          	bgeu	a4,s4,1a04 <__udivdi3+0x670>
    18e0:	ffeb8b93          	add	s7,s7,-2
    18e4:	01970733          	add	a4,a4,s9
    18e8:	00010e37          	lui	t3,0x10
    18ec:	01041413          	sll	s0,s0,0x10
    18f0:	01746433          	or	s0,s0,s7
    18f4:	fffe0793          	add	a5,t3,-1 # ffff <__neorv32_rom_size+0xbfff>
    18f8:	00f47833          	and	a6,s0,a5
    18fc:	00f977b3          	and	a5,s2,a5
    1900:	41470733          	sub	a4,a4,s4
    1904:	01045e93          	srl	t4,s0,0x10
    1908:	01095913          	srl	s2,s2,0x10
    190c:	00080513          	mv	a0,a6
    1910:	00078593          	mv	a1,a5
    1914:	12c000ef          	jal	1a40 <__mulsi3>
    1918:	00050313          	mv	t1,a0
    191c:	00090593          	mv	a1,s2
    1920:	00080513          	mv	a0,a6
    1924:	11c000ef          	jal	1a40 <__mulsi3>
    1928:	00050813          	mv	a6,a0
    192c:	00078593          	mv	a1,a5
    1930:	000e8513          	mv	a0,t4
    1934:	10c000ef          	jal	1a40 <__mulsi3>
    1938:	00050893          	mv	a7,a0
    193c:	00090593          	mv	a1,s2
    1940:	000e8513          	mv	a0,t4
    1944:	0fc000ef          	jal	1a40 <__mulsi3>
    1948:	01035793          	srl	a5,t1,0x10
    194c:	01180833          	add	a6,a6,a7
    1950:	010787b3          	add	a5,a5,a6
    1954:	0117f463          	bgeu	a5,a7,195c <__udivdi3+0x5c8>
    1958:	01c50533          	add	a0,a0,t3
    195c:	0107d693          	srl	a3,a5,0x10
    1960:	00a686b3          	add	a3,a3,a0
    1964:	06d76863          	bltu	a4,a3,19d4 <__udivdi3+0x640>
    1968:	04d70663          	beq	a4,a3,19b4 <__udivdi3+0x620>
    196c:	00040513          	mv	a0,s0
    1970:	02812403          	lw	s0,40(sp)
    1974:	02c12083          	lw	ra,44(sp)
    1978:	00000b13          	li	s6,0
    197c:	02412483          	lw	s1,36(sp)
    1980:	02012903          	lw	s2,32(sp)
    1984:	01812a03          	lw	s4,24(sp)
    1988:	01412a83          	lw	s5,20(sp)
    198c:	00c12b83          	lw	s7,12(sp)
    1990:	00812c03          	lw	s8,8(sp)
    1994:	00412c83          	lw	s9,4(sp)
    1998:	01c12983          	lw	s3,28(sp)
    199c:	000b0593          	mv	a1,s6
    19a0:	01012b03          	lw	s6,16(sp)
    19a4:	03010113          	add	sp,sp,48
    19a8:	00008067          	ret
    19ac:	00078993          	mv	s3,a5
    19b0:	b2dff06f          	j	14dc <__udivdi3+0x148>
    19b4:	00010737          	lui	a4,0x10
    19b8:	fff70713          	add	a4,a4,-1 # ffff <__neorv32_rom_size+0xbfff>
    19bc:	00e7f7b3          	and	a5,a5,a4
    19c0:	01079793          	sll	a5,a5,0x10
    19c4:	00e37333          	and	t1,t1,a4
    19c8:	01699533          	sll	a0,s3,s6
    19cc:	006787b3          	add	a5,a5,t1
    19d0:	f8f57ee3          	bgeu	a0,a5,196c <__udivdi3+0x5d8>
    19d4:	fff40513          	add	a0,s0,-1
    19d8:	f99ff06f          	j	1970 <__udivdi3+0x5dc>
    19dc:	010007b7          	lui	a5,0x1000
    19e0:	04f67a63          	bgeu	a2,a5,1a34 <__udivdi3+0x6a0>
    19e4:	01065693          	srl	a3,a2,0x10
    19e8:	01000713          	li	a4,16
    19ec:	bb9ff06f          	j	15a4 <__udivdi3+0x210>
    19f0:	00000b13          	li	s6,0
    19f4:	00100513          	li	a0,1
    19f8:	b29ff06f          	j	1520 <__udivdi3+0x18c>
    19fc:	00078b93          	mv	s7,a5
    1a00:	da5ff06f          	j	17a4 <__udivdi3+0x410>
    1a04:	00078b93          	mv	s7,a5
    1a08:	ee1ff06f          	j	18e8 <__udivdi3+0x554>
    1a0c:	00070b13          	mv	s6,a4
    1a10:	d35ff06f          	j	1744 <__udivdi3+0x3b0>
    1a14:	00070413          	mv	s0,a4
    1a18:	e71ff06f          	j	1888 <__udivdi3+0x4f4>
    1a1c:	ffe98993          	add	s3,s3,-2
    1a20:	015787b3          	add	a5,a5,s5
    1a24:	c05ff06f          	j	1628 <__udivdi3+0x294>
    1a28:	ffe90913          	add	s2,s2,-2
    1a2c:	015787b3          	add	a5,a5,s5
    1a30:	a51ff06f          	j	1480 <__udivdi3+0xec>
    1a34:	01865693          	srl	a3,a2,0x18
    1a38:	01800713          	li	a4,24
    1a3c:	b69ff06f          	j	15a4 <__udivdi3+0x210>

00001a40 <__mulsi3>:
    1a40:	00050613          	mv	a2,a0
    1a44:	00000513          	li	a0,0
    1a48:	0015f693          	and	a3,a1,1
    1a4c:	00068463          	beqz	a3,1a54 <__mulsi3+0x14>
    1a50:	00c50533          	add	a0,a0,a2
    1a54:	0015d593          	srl	a1,a1,0x1
    1a58:	00161613          	sll	a2,a2,0x1
    1a5c:	fe0596e3          	bnez	a1,1a48 <__mulsi3+0x8>
    1a60:	00008067          	ret

00001a64 <__divsi3>:
    1a64:	06054063          	bltz	a0,1ac4 <__umodsi3+0x10>
    1a68:	0605c663          	bltz	a1,1ad4 <__umodsi3+0x20>

00001a6c <__hidden___udivsi3>:
    1a6c:	00058613          	mv	a2,a1
    1a70:	00050593          	mv	a1,a0
    1a74:	fff00513          	li	a0,-1
    1a78:	02060c63          	beqz	a2,1ab0 <__hidden___udivsi3+0x44>
    1a7c:	00100693          	li	a3,1
    1a80:	00b67a63          	bgeu	a2,a1,1a94 <__hidden___udivsi3+0x28>
    1a84:	00c05863          	blez	a2,1a94 <__hidden___udivsi3+0x28>
    1a88:	00161613          	sll	a2,a2,0x1
    1a8c:	00169693          	sll	a3,a3,0x1
    1a90:	feb66ae3          	bltu	a2,a1,1a84 <__hidden___udivsi3+0x18>
    1a94:	00000513          	li	a0,0
    1a98:	00c5e663          	bltu	a1,a2,1aa4 <__hidden___udivsi3+0x38>
    1a9c:	40c585b3          	sub	a1,a1,a2
    1aa0:	00d56533          	or	a0,a0,a3
    1aa4:	0016d693          	srl	a3,a3,0x1
    1aa8:	00165613          	srl	a2,a2,0x1
    1aac:	fe0696e3          	bnez	a3,1a98 <__hidden___udivsi3+0x2c>
    1ab0:	00008067          	ret

00001ab4 <__umodsi3>:
    1ab4:	00008293          	mv	t0,ra
    1ab8:	fb5ff0ef          	jal	1a6c <__hidden___udivsi3>
    1abc:	00058513          	mv	a0,a1
    1ac0:	00028067          	jr	t0 # 113c <memset+0xb4>
    1ac4:	40a00533          	neg	a0,a0
    1ac8:	00b04863          	bgtz	a1,1ad8 <__umodsi3+0x24>
    1acc:	40b005b3          	neg	a1,a1
    1ad0:	f9dff06f          	j	1a6c <__hidden___udivsi3>
    1ad4:	40b005b3          	neg	a1,a1
    1ad8:	00008293          	mv	t0,ra
    1adc:	f91ff0ef          	jal	1a6c <__hidden___udivsi3>
    1ae0:	40a00533          	neg	a0,a0
    1ae4:	00028067          	jr	t0

00001ae8 <__modsi3>:
    1ae8:	00008293          	mv	t0,ra
    1aec:	0005ca63          	bltz	a1,1b00 <__modsi3+0x18>
    1af0:	00054c63          	bltz	a0,1b08 <__modsi3+0x20>
    1af4:	f79ff0ef          	jal	1a6c <__hidden___udivsi3>
    1af8:	00058513          	mv	a0,a1
    1afc:	00028067          	jr	t0
    1b00:	40b005b3          	neg	a1,a1
    1b04:	fe0558e3          	bgez	a0,1af4 <__modsi3+0xc>
    1b08:	40a00533          	neg	a0,a0
    1b0c:	f61ff0ef          	jal	1a6c <__hidden___udivsi3>
    1b10:	40b00533          	neg	a0,a1
    1b14:	00028067          	jr	t0
