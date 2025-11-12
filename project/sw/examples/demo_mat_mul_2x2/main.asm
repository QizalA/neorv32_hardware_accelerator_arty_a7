
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_free_r+0x2e0>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	bbc38393          	add	t2,t2,-1092 # fbf0 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d848493          	add	s1,s1,1752 # 8000071c <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6d050513          	add	a0,a0,1744 # 8000071c <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	86858593          	add	a1,a1,-1944 # 800008bc <__crt0_bss_end>
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
     10c:	0000f417          	auipc	s0,0xf
     110:	f6840413          	add	s0,s0,-152 # f074 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	f6048493          	add	s1,s1,-160 # f074 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	6f060613          	add	a2,a2,1776 # 820 <main>

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
     174:	0000f417          	auipc	s0,0xf
     178:	f0040413          	add	s0,s0,-256 # f074 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	ef848493          	add	s1,s1,-264 # f074 <__fini_array_end>

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

000001e4 <rdcycle>:
   CSRs (cycles & instret)
   ======================= */
static inline uint64_t rdcycle(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
     1ec:	b80027f3          	csrr	a5,mcycleh
     1f0:	fef59ae3          	bne	a1,a5,1e4 <rdcycle>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
     1f4:	00008067          	ret

000001f8 <rdinstret>:
static inline uint64_t rdinstret(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
     1f8:	b82025f3          	csrr	a1,minstreth
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
     1fc:	b0202573          	csrr	a0,minstret
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
     200:	b82027f3          	csrr	a5,minstreth
     204:	fef59ae3          	bne	a1,a5,1f8 <rdinstret>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}
     208:	00008067          	ret

0000020c <cmp_NxN>:
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("  n/a    "); return; }
  uint64_t s = (num * 1000ull + den/2) / den;
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int cmp_NxN(const int32_t *A, const int32_t *B) {
     20c:	00000793          	li	a5,0
  for (int i = 0; i < N*N; ++i) if (A[i] != B[i]) return 0; return 1;
     210:	01000613          	li	a2,16
     214:	00f506b3          	add	a3,a0,a5
     218:	00f58733          	add	a4,a1,a5
     21c:	0006a683          	lw	a3,0(a3)
     220:	00072703          	lw	a4,0(a4)
     224:	00e69a63          	bne	a3,a4,238 <cmp_NxN+0x2c>
     228:	00478793          	add	a5,a5,4
     22c:	fec794e3          	bne	a5,a2,214 <cmp_NxN+0x8>
     230:	00100513          	li	a0,1
     234:	00008067          	ret
     238:	00000513          	li	a0,0
}
     23c:	00008067          	ret

00000240 <gemm_ref_2x2>:
}

/* =======================
   Kernels (2×2)
   ======================= */
static void gemm_ref_2x2(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]) {
     240:	fe010113          	add	sp,sp,-32
     244:	00112e23          	sw	ra,28(sp)
     248:	00812c23          	sw	s0,24(sp)
     24c:	00912a23          	sw	s1,20(sp)
     250:	01212823          	sw	s2,16(sp)
     254:	01312623          	sw	s3,12(sp)
     258:	00058493          	mv	s1,a1
     25c:	00050413          	mv	s0,a0
  for (int i = 0; i < N; ++i)
    for (int j = 0; j < N; ++j) {
      int32_t s = 0;
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     260:	00150583          	lb	a1,1(a0)
     264:	00248503          	lb	a0,2(s1)
static void gemm_ref_2x2(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]) {
     268:	00060913          	mv	s2,a2
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     26c:	4110e0ef          	jal	ee7c <__mulsi3>
     270:	00040583          	lb	a1,0(s0)
     274:	00050993          	mv	s3,a0
     278:	00048503          	lb	a0,0(s1)
     27c:	4010e0ef          	jal	ee7c <__mulsi3>
     280:	00a989b3          	add	s3,s3,a0
      C[i][j] = s;
     284:	01392023          	sw	s3,0(s2)
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     288:	00148583          	lb	a1,1(s1)
     28c:	00040503          	lb	a0,0(s0)
     290:	3ed0e0ef          	jal	ee7c <__mulsi3>
     294:	00348583          	lb	a1,3(s1)
     298:	00050993          	mv	s3,a0
     29c:	00140503          	lb	a0,1(s0)
     2a0:	3dd0e0ef          	jal	ee7c <__mulsi3>
     2a4:	00a989b3          	add	s3,s3,a0
      C[i][j] = s;
     2a8:	01392223          	sw	s3,4(s2)
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     2ac:	00340583          	lb	a1,3(s0)
     2b0:	00248503          	lb	a0,2(s1)
     2b4:	3c90e0ef          	jal	ee7c <__mulsi3>
     2b8:	00240583          	lb	a1,2(s0)
     2bc:	00050993          	mv	s3,a0
     2c0:	00048503          	lb	a0,0(s1)
     2c4:	3b90e0ef          	jal	ee7c <__mulsi3>
     2c8:	00a989b3          	add	s3,s3,a0
      C[i][j] = s;
     2cc:	01392423          	sw	s3,8(s2)
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     2d0:	00148583          	lb	a1,1(s1)
     2d4:	00240503          	lb	a0,2(s0)
     2d8:	3a50e0ef          	jal	ee7c <__mulsi3>
     2dc:	00348583          	lb	a1,3(s1)
     2e0:	00050993          	mv	s3,a0
     2e4:	00340503          	lb	a0,3(s0)
     2e8:	3950e0ef          	jal	ee7c <__mulsi3>
    }
}
     2ec:	01c12083          	lw	ra,28(sp)
     2f0:	01812403          	lw	s0,24(sp)
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     2f4:	00a989b3          	add	s3,s3,a0
      C[i][j] = s;
     2f8:	01392623          	sw	s3,12(s2)
}
     2fc:	01412483          	lw	s1,20(sp)
     300:	01012903          	lw	s2,16(sp)
     304:	00c12983          	lw	s3,12(sp)
     308:	02010113          	add	sp,sp,32
     30c:	00008067          	ret

00000310 <gemm_cfu_2x2>:
      /* K=2 -> pad to 4 lanes with zeros */
      int8_t ar0=A[i][0], ar1=A[i][1], ar2=0, ar3=0;
      int8_t bc0=B[0][j], bc1=B[1][j], bc2=0, bc3=0;
      uint32_t ap = pack4_s8_lsb(ar0,ar1,ar2,ar3);
      uint32_t bp = pack4_s8_lsb(bc0,bc1,bc2,bc3);
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     310:	00154783          	lbu	a5,1(a0)
     314:	00054703          	lbu	a4,0(a0)
  return  ((uint32_t)(uint8_t)x0)        |
     318:	0005c683          	lbu	a3,0(a1)
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     31c:	00879793          	sll	a5,a5,0x8
     320:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     324:	0025c703          	lbu	a4,2(a1)
     328:	00871713          	sll	a4,a4,0x8
  return  ((uint32_t)(uint8_t)x0)        |
     32c:	00d76733          	or	a4,a4,a3
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     330:	02e7878b          	.insn	4, 0x02e7878b
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     334:	00f62023          	sw	a5,0(a2)
     338:	00154783          	lbu	a5,1(a0)
     33c:	00054703          	lbu	a4,0(a0)
  return  ((uint32_t)(uint8_t)x0)        |
     340:	0015c683          	lbu	a3,1(a1)
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     344:	00879793          	sll	a5,a5,0x8
     348:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     34c:	0035c703          	lbu	a4,3(a1)
     350:	00871713          	sll	a4,a4,0x8
  return  ((uint32_t)(uint8_t)x0)        |
     354:	00d76733          	or	a4,a4,a3
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     358:	02e7878b          	.insn	4, 0x02e7878b
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     35c:	00f62223          	sw	a5,4(a2)
     360:	00354783          	lbu	a5,3(a0)
     364:	00254703          	lbu	a4,2(a0)
  return  ((uint32_t)(uint8_t)x0)        |
     368:	0005c683          	lbu	a3,0(a1)
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     36c:	00879793          	sll	a5,a5,0x8
     370:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     374:	0025c703          	lbu	a4,2(a1)
     378:	00871713          	sll	a4,a4,0x8
  return  ((uint32_t)(uint8_t)x0)        |
     37c:	00d76733          	or	a4,a4,a3
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     380:	02e7878b          	.insn	4, 0x02e7878b
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     384:	00f62423          	sw	a5,8(a2)
     388:	00354783          	lbu	a5,3(a0)
     38c:	00254703          	lbu	a4,2(a0)
  return  ((uint32_t)(uint8_t)x0)        |
     390:	0015c683          	lbu	a3,1(a1)
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     394:	00879793          	sll	a5,a5,0x8
     398:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     39c:	0035c703          	lbu	a4,3(a1)
     3a0:	00871713          	sll	a4,a4,0x8
  return  ((uint32_t)(uint8_t)x0)        |
     3a4:	00d76733          	or	a4,a4,a3
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     3a8:	02e7878b          	.insn	4, 0x02e7878b
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
     3ac:	00f62623          	sw	a5,12(a2)
    }
}
     3b0:	00008067          	ret

000003b4 <print_mat4>:
  for(int i=0;i<2;++i){ printf("  ");
    for(int j=0;j<2;++j) printf("%6ld ", (long)C[i][j]);
    printf("\n");
  }
}
static void print_mat4(const char* tag, const int32_t C[4][4]){
     3b4:	fe010113          	add	sp,sp,-32
     3b8:	00812c23          	sw	s0,24(sp)
     3bc:	00058413          	mv	s0,a1
  printf("%s (4x4):\n", tag);
     3c0:	00050593          	mv	a1,a0
     3c4:	0000f537          	lui	a0,0xf
     3c8:	07850513          	add	a0,a0,120 # f078 <__fini_array_end+0x4>
static void print_mat4(const char* tag, const int32_t C[4][4]){
     3cc:	00912a23          	sw	s1,20(sp)
     3d0:	01212823          	sw	s2,16(sp)
     3d4:	01312623          	sw	s3,12(sp)
     3d8:	00112e23          	sw	ra,28(sp)
     3dc:	01412423          	sw	s4,8(sp)
     3e0:	04040493          	add	s1,s0,64
  printf("%s (4x4):\n", tag);
     3e4:	339000ef          	jal	f1c <printf>
  for(int i=0;i<4;++i){ printf("  ");
     3e8:	0000f937          	lui	s2,0xf
    for(int j=0;j<4;++j) printf("%6ld ", (long)C[i][j]);
     3ec:	0000f9b7          	lui	s3,0xf
  for(int i=0;i<4;++i){ printf("  ");
     3f0:	2e890513          	add	a0,s2,744 # f2e8 <__fini_array_end+0x274>
     3f4:	329000ef          	jal	f1c <printf>
    for(int j=0;j<4;++j) printf("%6ld ", (long)C[i][j]);
     3f8:	01040a13          	add	s4,s0,16
     3fc:	00042583          	lw	a1,0(s0)
     400:	08498513          	add	a0,s3,132 # f084 <__fini_array_end+0x10>
     404:	00440413          	add	s0,s0,4
     408:	315000ef          	jal	f1c <printf>
     40c:	ff4418e3          	bne	s0,s4,3fc <print_mat4+0x48>
    printf("\n");
     410:	00a00513          	li	a0,10
     414:	359000ef          	jal	f6c <putchar>
  for(int i=0;i<4;++i){ printf("  ");
     418:	fc849ce3          	bne	s1,s0,3f0 <print_mat4+0x3c>
  }
}
     41c:	01c12083          	lw	ra,28(sp)
     420:	01812403          	lw	s0,24(sp)
     424:	01412483          	lw	s1,20(sp)
     428:	01012903          	lw	s2,16(sp)
     42c:	00c12983          	lw	s3,12(sp)
     430:	00812a03          	lw	s4,8(sp)
     434:	02010113          	add	sp,sp,32
     438:	00008067          	ret

0000043c <print_mat2>:
static void print_mat2(const char* tag, const int32_t C[2][2]){
     43c:	ff010113          	add	sp,sp,-16
     440:	00812423          	sw	s0,8(sp)
     444:	00058413          	mv	s0,a1
  printf("%s:\n", tag);
     448:	00050593          	mv	a1,a0
     44c:	0000f537          	lui	a0,0xf
     450:	08c50513          	add	a0,a0,140 # f08c <__fini_array_end+0x18>
static void print_mat2(const char* tag, const int32_t C[2][2]){
     454:	00112623          	sw	ra,12(sp)
     458:	00912223          	sw	s1,4(sp)
     45c:	01212023          	sw	s2,0(sp)
  printf("%s:\n", tag);
     460:	2bd000ef          	jal	f1c <printf>
  for(int i=0;i<2;++i){ printf("  ");
     464:	0000f937          	lui	s2,0xf
     468:	2e890513          	add	a0,s2,744 # f2e8 <__fini_array_end+0x274>
     46c:	2b1000ef          	jal	f1c <printf>
    for(int j=0;j<2;++j) printf("%6ld ", (long)C[i][j]);
     470:	00042583          	lw	a1,0(s0)
     474:	0000f4b7          	lui	s1,0xf
     478:	08448513          	add	a0,s1,132 # f084 <__fini_array_end+0x10>
     47c:	2a1000ef          	jal	f1c <printf>
     480:	00442583          	lw	a1,4(s0)
     484:	08448513          	add	a0,s1,132
     488:	295000ef          	jal	f1c <printf>
    printf("\n");
     48c:	00a00513          	li	a0,10
     490:	2dd000ef          	jal	f6c <putchar>
  for(int i=0;i<2;++i){ printf("  ");
     494:	2e890513          	add	a0,s2,744
     498:	285000ef          	jal	f1c <printf>
    for(int j=0;j<2;++j) printf("%6ld ", (long)C[i][j]);
     49c:	00842583          	lw	a1,8(s0)
     4a0:	08448513          	add	a0,s1,132
     4a4:	279000ef          	jal	f1c <printf>
     4a8:	00c42583          	lw	a1,12(s0)
     4ac:	08448513          	add	a0,s1,132
     4b0:	26d000ef          	jal	f1c <printf>
}
     4b4:	00812403          	lw	s0,8(sp)
     4b8:	00c12083          	lw	ra,12(sp)
     4bc:	00412483          	lw	s1,4(sp)
     4c0:	00012903          	lw	s2,0(sp)
    printf("\n");
     4c4:	00a00513          	li	a0,10
}
     4c8:	01010113          	add	sp,sp,16
    printf("\n");
     4cc:	2a10006f          	j	f6c <putchar>

000004d0 <print_speedup_fixed>:
  if (!den) { printf("  n/a    "); return; }
     4d0:	00d667b3          	or	a5,a2,a3
     4d4:	00079863          	bnez	a5,4e4 <print_speedup_fixed+0x14>
     4d8:	0000f537          	lui	a0,0xf
     4dc:	09450513          	add	a0,a0,148 # f094 <__fini_array_end+0x20>
     4e0:	23d0006f          	j	f1c <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     4e4:	fe010113          	add	sp,sp,-32
     4e8:	00812c23          	sw	s0,24(sp)
     4ec:	00912a23          	sw	s1,20(sp)
     4f0:	00068413          	mv	s0,a3
  uint64_t s = (num * 1000ull + den/2) / den;
     4f4:	00060493          	mv	s1,a2
     4f8:	00000693          	li	a3,0
     4fc:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     500:	00112e23          	sw	ra,28(sp)
  uint64_t s = (num * 1000ull + den/2) / den;
     504:	19d0e0ef          	jal	eea0 <__muldi3>
     508:	00050793          	mv	a5,a0
     50c:	01f41713          	sll	a4,s0,0x1f
     510:	0014d513          	srl	a0,s1,0x1
     514:	00a76533          	or	a0,a4,a0
     518:	00a78533          	add	a0,a5,a0
     51c:	00145713          	srl	a4,s0,0x1
     520:	00f537b3          	sltu	a5,a0,a5
     524:	00e585b3          	add	a1,a1,a4
     528:	00b785b3          	add	a1,a5,a1
     52c:	00048613          	mv	a2,s1
     530:	00040693          	mv	a3,s0
     534:	1740b0ef          	jal	b6a8 <__udivdi3>
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     538:	3e800613          	li	a2,1000
     53c:	00000693          	li	a3,0
  uint64_t s = (num * 1000ull + den/2) / den;
     540:	00050493          	mv	s1,a0
     544:	00058413          	mv	s0,a1
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     548:	00d0b0ef          	jal	bd54 <__umoddi3>
     54c:	00a12623          	sw	a0,12(sp)
     550:	00b12423          	sw	a1,8(sp)
     554:	3e800613          	li	a2,1000
     558:	00000693          	li	a3,0
     55c:	00048513          	mv	a0,s1
     560:	00040593          	mv	a1,s0
     564:	1440b0ef          	jal	b6a8 <__udivdi3>
}
     568:	01812403          	lw	s0,24(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     56c:	00c12703          	lw	a4,12(sp)
     570:	00812783          	lw	a5,8(sp)
}
     574:	01c12083          	lw	ra,28(sp)
     578:	01412483          	lw	s1,20(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     57c:	00050613          	mv	a2,a0
     580:	0000f537          	lui	a0,0xf
     584:	00058693          	mv	a3,a1
     588:	0a050513          	add	a0,a0,160 # f0a0 <__fini_array_end+0x2c>
}
     58c:	02010113          	add	sp,sp,32
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     590:	18d0006f          	j	f1c <printf>

00000594 <gemm_cfs_2x2>:
                         int32_t C4_dbg[4][4]) {
     594:	fc010113          	add	sp,sp,-64
     598:	80000737          	lui	a4,0x80000
     59c:	74c70313          	add	t1,a4,1868 # 8000074c <A_flat.1>
     5a0:	02812e23          	sw	s0,60(sp)
     5a4:	02912c23          	sw	s1,56(sp)
     5a8:	03212a23          	sw	s2,52(sp)
     5ac:	03312823          	sw	s3,48(sp)
     5b0:	03412623          	sw	s4,44(sp)
     5b4:	03512423          	sw	s5,40(sp)
     5b8:	03612223          	sw	s6,36(sp)
      A_flat[r*LDA + k] = (r < N && k < N) ? A[r][k] : 0;
     5bc:	74c70713          	add	a4,a4,1868
  for (int r = 0; r < 4; ++r)
     5c0:	00000813          	li	a6,0
      A_flat[r*LDA + k] = (r < N && k < N) ? A[r][k] : 0;
     5c4:	00100e13          	li	t3,1
    for (int k = 0; k < MAXK; ++k)
     5c8:	00400e93          	li	t4,4
     5cc:	00000793          	li	a5,0
      A_flat[r*LDA + k] = (r < N && k < N) ? A[r][k] : 0;
     5d0:	00000893          	li	a7,0
     5d4:	010e4c63          	blt	t3,a6,5ec <gemm_cfs_2x2+0x58>
     5d8:	00fe4a63          	blt	t3,a5,5ec <gemm_cfs_2x2+0x58>
     5dc:	00181893          	sll	a7,a6,0x1
     5e0:	011508b3          	add	a7,a0,a7
     5e4:	00f888b3          	add	a7,a7,a5
     5e8:	00088883          	lb	a7,0(a7)
     5ec:	00f70f33          	add	t5,a4,a5
     5f0:	011f0023          	sb	a7,0(t5)
    for (int k = 0; k < MAXK; ++k)
     5f4:	00178793          	add	a5,a5,1
     5f8:	fdd79ce3          	bne	a5,t4,5d0 <gemm_cfs_2x2+0x3c>
  for (int r = 0; r < 4; ++r)
     5fc:	00180813          	add	a6,a6,1
     600:	00470713          	add	a4,a4,4
     604:	fcf814e3          	bne	a6,a5,5cc <gemm_cfs_2x2+0x38>
     608:	80000737          	lui	a4,0x80000
     60c:	73c70893          	add	a7,a4,1852 # 8000073c <B_flat.0>
  for (int k = 0; k < MAXK; ++k)
     610:	00000513          	li	a0,0
  for (int r = 0; r < 4; ++r)
     614:	73c70713          	add	a4,a4,1852
      B_flat[k*LDB + c] = (k < N && c < N) ? B[k][c] : 0;
     618:	00100e13          	li	t3,1
    for (int c = 0; c < 4; ++c)
     61c:	00400e93          	li	t4,4
     620:	00000793          	li	a5,0
      B_flat[k*LDB + c] = (k < N && c < N) ? B[k][c] : 0;
     624:	00000813          	li	a6,0
     628:	00ae4c63          	blt	t3,a0,640 <gemm_cfs_2x2+0xac>
     62c:	00fe4a63          	blt	t3,a5,640 <gemm_cfs_2x2+0xac>
     630:	00151813          	sll	a6,a0,0x1
     634:	01058833          	add	a6,a1,a6
     638:	00f80833          	add	a6,a6,a5
     63c:	00080803          	lb	a6,0(a6)
     640:	00f70f33          	add	t5,a4,a5
     644:	010f0023          	sb	a6,0(t5)
    for (int c = 0; c < 4; ++c)
     648:	00178793          	add	a5,a5,1
     64c:	fdd79ce3          	bne	a5,t4,624 <gemm_cfs_2x2+0x90>
  for (int k = 0; k < MAXK; ++k)
     650:	00150513          	add	a0,a0,1
     654:	00470713          	add	a4,a4,4
     658:	fcf514e3          	bne	a0,a5,620 <gemm_cfs_2x2+0x8c>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     65c:	ffeb07b7          	lui	a5,0xffeb0
     660:	00200713          	li	a4,2
     664:	ffeb0437          	lui	s0,0xffeb0
     668:	ffeb03b7          	lui	t2,0xffeb0
     66c:	ffeb02b7          	lui	t0,0xffeb0
     670:	ffeb0fb7          	lui	t6,0xffeb0
     674:	ffeb0f37          	lui	t5,0xffeb0
     678:	ffeb0eb7          	lui	t4,0xffeb0
     67c:	ffeb0e37          	lui	t3,0xffeb0
     680:	ffeb0837          	lui	a6,0xffeb0
     684:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
      int8_t a = (k >= 0 && k < K) ? A_flat[i*LDA + k] : 0;
     688:	00100513          	li	a0,1
  for (int s = 0; s < T; ++s) {
     68c:	00000793          	li	a5,0
    for (int i = 0; i < 4; ++i) {
     690:	00400a13          	li	s4,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     694:	ffeb0b37          	lui	s6,0xffeb0
     698:	00440413          	add	s0,s0,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     69c:	00838393          	add	t2,t2,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     6a0:	00c28293          	add	t0,t0,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     6a4:	010f8f93          	add	t6,t6,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     6a8:	014f0f13          	add	t5,t5,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     6ac:	018e8e93          	add	t4,t4,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     6b0:	01ce0e13          	add	t3,t3,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     6b4:	02080813          	add	a6,a6,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
  for (int s = 0; s < T; ++s) {
     6b8:	00800a93          	li	s5,8
    uint32_t Aword[4] = {0,0,0,0};
     6bc:	00012023          	sw	zero,0(sp)
     6c0:	00012223          	sw	zero,4(sp)
     6c4:	00012423          	sw	zero,8(sp)
     6c8:	00012623          	sw	zero,12(sp)
    uint32_t Bword[4] = {0,0,0,0};
     6cc:	00012823          	sw	zero,16(sp)
     6d0:	00012a23          	sw	zero,20(sp)
     6d4:	00012c23          	sw	zero,24(sp)
     6d8:	00012e23          	sw	zero,28(sp)
    for (int i = 0; i < 4; ++i) {
     6dc:	00010913          	mv	s2,sp
     6e0:	006784b3          	add	s1,a5,t1
     6e4:	00000713          	li	a4,0
      int8_t a = (k >= 0 && k < K) ? A_flat[i*LDA + k] : 0;
     6e8:	40e789b3          	sub	s3,a5,a4
     6ec:	00000593          	li	a1,0
     6f0:	01356463          	bltu	a0,s3,6f8 <gemm_cfs_2x2+0x164>
     6f4:	00048583          	lb	a1,0(s1)
      Aword[i] = (uint32_t)(uint8_t)a; /* LSB-only */
     6f8:	0ff5f593          	zext.b	a1,a1
     6fc:	00b92023          	sw	a1,0(s2)
    for (int i = 0; i < 4; ++i) {
     700:	00170713          	add	a4,a4,1
     704:	00490913          	add	s2,s2,4
     708:	00348493          	add	s1,s1,3
     70c:	fd471ee3          	bne	a4,s4,6e8 <gemm_cfs_2x2+0x154>
     710:	01010913          	add	s2,sp,16
     714:	00088493          	mv	s1,a7
    for (int j = 0; j < 4; ++j) {
     718:	00000713          	li	a4,0
      int8_t b = (k >= 0 && k < K) ? B_flat[k*LDB + j] : 0;
     71c:	40e789b3          	sub	s3,a5,a4
     720:	00000593          	li	a1,0
     724:	01356463          	bltu	a0,s3,72c <gemm_cfs_2x2+0x198>
     728:	00048583          	lb	a1,0(s1)
      Bword[j] = (uint32_t)(uint8_t)b; /* LSB-only */
     72c:	0ff5f593          	zext.b	a1,a1
     730:	00b92023          	sw	a1,0(s2)
    for (int j = 0; j < 4; ++j) {
     734:	00170713          	add	a4,a4,1
     738:	00490913          	add	s2,s2,4
     73c:	ffd48493          	add	s1,s1,-3
     740:	fd471ee3          	bne	a4,s4,71c <gemm_cfs_2x2+0x188>
    cfs_write(CFS_A0, Aword[0]); cfs_write(CFS_A1, Aword[1]);
     744:	00012703          	lw	a4,0(sp)
  for (int s = 0; s < T; ++s) {
     748:	00178793          	add	a5,a5,1
     74c:	00488893          	add	a7,a7,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     750:	00e42023          	sw	a4,0(s0)
    cfs_write(CFS_A0, Aword[0]); cfs_write(CFS_A1, Aword[1]);
     754:	00412703          	lw	a4,4(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     758:	00e3a023          	sw	a4,0(t2)
    cfs_write(CFS_A2, Aword[2]); cfs_write(CFS_A3, Aword[3]);
     75c:	00812703          	lw	a4,8(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     760:	00e2a023          	sw	a4,0(t0)
    cfs_write(CFS_A2, Aword[2]); cfs_write(CFS_A3, Aword[3]);
     764:	00c12703          	lw	a4,12(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     768:	00efa023          	sw	a4,0(t6)
    cfs_write(CFS_B0, Bword[0]); cfs_write(CFS_B1, Bword[1]);
     76c:	01012703          	lw	a4,16(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     770:	00ef2023          	sw	a4,0(t5)
    cfs_write(CFS_B0, Bword[0]); cfs_write(CFS_B1, Bword[1]);
     774:	01412703          	lw	a4,20(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     778:	00eea023          	sw	a4,0(t4)
    cfs_write(CFS_B2, Bword[2]); cfs_write(CFS_B3, Bword[3]);
     77c:	01812703          	lw	a4,24(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     780:	00ee2023          	sw	a4,0(t3)
    cfs_write(CFS_B2, Bword[2]); cfs_write(CFS_B3, Bword[3]);
     784:	01c12703          	lw	a4,28(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     788:	00e82023          	sw	a4,0(a6)
     78c:	00ab2023          	sw	a0,0(s6) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for (int s = 0; s < T; ++s) {
     790:	f35796e3          	bne	a5,s5,6bc <gemm_cfs_2x2+0x128>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     794:	ffeb05b7          	lui	a1,0xffeb0
     798:	00000713          	li	a4,0
     79c:	01000513          	li	a0,16
     7a0:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
    for (int j = 0; j < 4; ++j)
     7a4:	01000313          	li	t1,16
  for (int i = 0; i < 4; ++i)
     7a8:	02000e13          	li	t3,32
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     7ac:	00e688b3          	add	a7,a3,a4
     7b0:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     7b4:	00b70833          	add	a6,a4,a1
     7b8:	00f80eb3          	add	t4,a6,a5
     7bc:	000eaf03          	lw	t5,0(t4)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     7c0:	00f88eb3          	add	t4,a7,a5
    for (int j = 0; j < 4; ++j)
     7c4:	00478793          	add	a5,a5,4
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     7c8:	01eea023          	sw	t5,0(t4)
    for (int j = 0; j < 4; ++j)
     7cc:	fe6796e3          	bne	a5,t1,7b8 <gemm_cfs_2x2+0x224>
  for (int i = 0; i < 4; ++i)
     7d0:	00450513          	add	a0,a0,4
     7d4:	01070713          	add	a4,a4,16
     7d8:	fdc51ae3          	bne	a0,t3,7ac <gemm_cfs_2x2+0x218>
      C[i][j] = C4_dbg[i][j];
     7dc:	0006a783          	lw	a5,0(a3)
}
     7e0:	03c12403          	lw	s0,60(sp)
     7e4:	03812483          	lw	s1,56(sp)
      C[i][j] = C4_dbg[i][j];
     7e8:	00f62023          	sw	a5,0(a2)
     7ec:	0046a783          	lw	a5,4(a3)
}
     7f0:	03412903          	lw	s2,52(sp)
     7f4:	03012983          	lw	s3,48(sp)
      C[i][j] = C4_dbg[i][j];
     7f8:	00f62223          	sw	a5,4(a2)
     7fc:	0106a783          	lw	a5,16(a3)
}
     800:	02c12a03          	lw	s4,44(sp)
     804:	02812a83          	lw	s5,40(sp)
      C[i][j] = C4_dbg[i][j];
     808:	00f62423          	sw	a5,8(a2)
     80c:	0146a783          	lw	a5,20(a3)
}
     810:	02412b03          	lw	s6,36(sp)
      C[i][j] = C4_dbg[i][j];
     814:	00f62623          	sw	a5,12(a2)
}
     818:	04010113          	add	sp,sp,64
     81c:	00008067          	ret

00000820 <main>:

/* =======================
   Main
   ======================= */
int main(void) {
  printf("== 2x2 GEMM: SW vs CFU vs CFS ==\n");
     820:	0000f537          	lui	a0,0xf
int main(void) {
     824:	ec010113          	add	sp,sp,-320
  printf("== 2x2 GEMM: SW vs CFU vs CFS ==\n");
     828:	0c050513          	add	a0,a0,192 # f0c0 <__fini_array_end+0x4c>
int main(void) {
     82c:	12112e23          	sw	ra,316(sp)
     830:	12812c23          	sw	s0,312(sp)
     834:	12912a23          	sw	s1,308(sp)
     838:	13212823          	sw	s2,304(sp)
     83c:	13312623          	sw	s3,300(sp)
     840:	13412423          	sw	s4,296(sp)
     844:	13512223          	sw	s5,292(sp)
     848:	13612023          	sw	s6,288(sp)
     84c:	11712e23          	sw	s7,284(sp)
     850:	11812c23          	sw	s8,280(sp)
     854:	11912a23          	sw	s9,276(sp)
     858:	11a12823          	sw	s10,272(sp)
     85c:	11b12623          	sw	s11,268(sp)
  printf("== 2x2 GEMM: SW vs CFU vs CFS ==\n");
     860:	051000ef          	jal	10b0 <puts>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     864:	ffeb07b7          	lui	a5,0xffeb0
     868:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n", cfs_read(CFS_CTL));
     86c:	0000f537          	lui	a0,0xf
     870:	0e450513          	add	a0,a0,228 # f0e4 <__fini_array_end+0x70>
     874:	6a8000ef          	jal	f1c <printf>
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     878:	040305b7          	lui	a1,0x4030
     87c:	080707b7          	lui	a5,0x8070
     880:	20158593          	add	a1,a1,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
     884:	60578793          	add	a5,a5,1541 # 8070605 <__neorv32_ram_size+0x7ff0605>
     888:	02f5858b          	.insn	4, 0x02f5858b
  printf("CFU DP4A probe = %ld (expect 70)\n", (long)r);
     88c:	0000f537          	lui	a0,0xf
     890:	10c50513          	add	a0,a0,268 # f10c <__fini_array_end+0x98>
     894:	688000ef          	jal	f1c <printf>
  probe_cfu();

  /* Test 1: simple positive values */
  int8_t  A1[2][2] = {{1,2},{3,4}};
     898:	800007b7          	lui	a5,0x80000
     89c:	6a07a783          	lw	a5,1696(a5) # 800006a0 <__global_locale+0x16c>
     8a0:	00f12823          	sw	a5,16(sp)
  int8_t  B1[2][2] = {{5,6},{7,8}};
     8a4:	800007b7          	lui	a5,0x80000
     8a8:	6a47a783          	lw	a5,1700(a5) # 800006a4 <__global_locale+0x170>
     8ac:	00f12a23          	sw	a5,20(sp)
  int32_t Csw1[2][2], Ccfu1[2][2], Ccfs1[2][2], C4dbg1[4][4];

  uint64_t c0,i0,i1,c1;

  c0=rdcycle(); i0=rdinstret(); gemm_ref_2x2(A1,B1,Csw1); i1=rdinstret(); c1=rdcycle();
     8b0:	935ff0ef          	jal	1e4 <rdcycle>
     8b4:	945ff0ef          	jal	1f8 <rdinstret>
     8b8:	02010613          	add	a2,sp,32
     8bc:	01410593          	add	a1,sp,20
     8c0:	01010513          	add	a0,sp,16
     8c4:	97dff0ef          	jal	240 <gemm_ref_2x2>
     8c8:	931ff0ef          	jal	1f8 <rdinstret>
     8cc:	919ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc1=c1-c0, sw_ins1=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A1,B1,Ccfu1); i1=rdinstret(); c1=rdcycle();
     8d0:	915ff0ef          	jal	1e4 <rdcycle>
     8d4:	925ff0ef          	jal	1f8 <rdinstret>
     8d8:	03010613          	add	a2,sp,48
     8dc:	01410593          	add	a1,sp,20
     8e0:	01010513          	add	a0,sp,16
     8e4:	a2dff0ef          	jal	310 <gemm_cfu_2x2>
     8e8:	911ff0ef          	jal	1f8 <rdinstret>
     8ec:	8f9ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc1=c1-c0, cfu_ins1=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A1,B1,Ccfs1,C4dbg1); i1=rdinstret(); c1=rdcycle();
     8f0:	8f5ff0ef          	jal	1e4 <rdcycle>
     8f4:	905ff0ef          	jal	1f8 <rdinstret>
     8f8:	08010693          	add	a3,sp,128
     8fc:	04010613          	add	a2,sp,64
     900:	01410593          	add	a1,sp,20
     904:	01010513          	add	a0,sp,16
     908:	c8dff0ef          	jal	594 <gemm_cfs_2x2>
     90c:	8edff0ef          	jal	1f8 <rdinstret>
     910:	8d5ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc1=c1-c0, cfs_ins1=i1-i0;

  int ok_cfu1 = cmp_NxN(&Csw1[0][0], &Ccfu1[0][0]);
     914:	03010593          	add	a1,sp,48
     918:	02010513          	add	a0,sp,32
     91c:	8f1ff0ef          	jal	20c <cmp_NxN>
     920:	00050493          	mv	s1,a0
  int ok_cfs1 = cmp_NxN(&Csw1[0][0], &Ccfs1[0][0]);
     924:	04010593          	add	a1,sp,64
     928:	02010513          	add	a0,sp,32
     92c:	8e1ff0ef          	jal	20c <cmp_NxN>
     930:	00050413          	mv	s0,a0

  print_mat4("CFS C tile (Test1)", C4dbg1);
     934:	0000f537          	lui	a0,0xf
     938:	08010593          	add	a1,sp,128
     93c:	13050513          	add	a0,a0,304 # f130 <__fini_array_end+0xbc>
     940:	a75ff0ef          	jal	3b4 <print_mat4>
  print_mat2("SW C 2x2 (Test1)", Csw1);
     944:	0000f537          	lui	a0,0xf
     948:	02010593          	add	a1,sp,32
     94c:	14450513          	add	a0,a0,324 # f144 <__fini_array_end+0xd0>
     950:	aedff0ef          	jal	43c <print_mat2>
  print_mat2("CFS C 2x2 (Test1)", Ccfs1);
     954:	0000f537          	lui	a0,0xf
     958:	04010593          	add	a1,sp,64
     95c:	15850513          	add	a0,a0,344 # f158 <__fini_array_end+0xe4>
     960:	addff0ef          	jal	43c <print_mat2>
  printf("Test1 Verdict: CFU %s, CFS %s\n", ok_cfu1?"PASS":"FAIL", ok_cfs1?"PASS":"FAIL");
     964:	2e048e63          	beqz	s1,c60 <main+0x440>
     968:	0000f5b7          	lui	a1,0xf
     96c:	0b058593          	add	a1,a1,176 # f0b0 <__fini_array_end+0x3c>
     970:	2e040e63          	beqz	s0,c6c <main+0x44c>
     974:	0000f637          	lui	a2,0xf
     978:	0b060613          	add	a2,a2,176 # f0b0 <__fini_array_end+0x3c>
     97c:	0000f537          	lui	a0,0xf
     980:	16c50513          	add	a0,a0,364 # f16c <__fini_array_end+0xf8>
     984:	598000ef          	jal	f1c <printf>

  /* Test 2: your deterministic signed patterns */
  int8_t  A[2][2], B[2][2];
  for (int i = 0; i < N; ++i)
    for (int k = 0; k < N; ++k) A[i][k] = pattA(i, k);
     988:	040207b7          	lui	a5,0x4020
     98c:	60578793          	add	a5,a5,1541 # 4020605 <__neorv32_ram_size+0x3fa0605>
     990:	00f12c23          	sw	a5,24(sp)
  for (int k = 0; k < N; ++k)
    for (int j = 0; j < N; ++j) B[k][j] = pattB(k, j);
     994:	040007b7          	lui	a5,0x4000
     998:	3fe78793          	add	a5,a5,1022 # 40003fe <__neorv32_ram_size+0x3f803fe>
     99c:	00f12e23          	sw	a5,28(sp)

  int32_t C_sw[2][2], C_cfu[2][2], C_cfs[2][2], C4dbg[4][4];

  c0=rdcycle(); i0=rdinstret(); gemm_ref_2x2(A,B,C_sw); i1=rdinstret(); c1=rdcycle();
     9a0:	845ff0ef          	jal	1e4 <rdcycle>
     9a4:	00058a93          	mv	s5,a1
     9a8:	00050993          	mv	s3,a0
     9ac:	84dff0ef          	jal	1f8 <rdinstret>
     9b0:	05010613          	add	a2,sp,80
     9b4:	00058a13          	mv	s4,a1
     9b8:	00050493          	mv	s1,a0
     9bc:	01c10593          	add	a1,sp,28
     9c0:	01810513          	add	a0,sp,24
     9c4:	87dff0ef          	jal	240 <gemm_ref_2x2>
     9c8:	831ff0ef          	jal	1f8 <rdinstret>
     9cc:	00050913          	mv	s2,a0
     9d0:	00058413          	mv	s0,a1
     9d4:	811ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     9d8:	413509b3          	sub	s3,a0,s3
     9dc:	415585b3          	sub	a1,a1,s5
     9e0:	013537b3          	sltu	a5,a0,s3
     9e4:	40f587b3          	sub	a5,a1,a5
     9e8:	00f12223          	sw	a5,4(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A,B,C_cfu); i1=rdinstret(); c1=rdcycle();
     9ec:	ff8ff0ef          	jal	1e4 <rdcycle>
     9f0:	00058b93          	mv	s7,a1
     9f4:	00050c93          	mv	s9,a0
     9f8:	801ff0ef          	jal	1f8 <rdinstret>
     9fc:	06010613          	add	a2,sp,96
     a00:	00058a93          	mv	s5,a1
     a04:	00050c13          	mv	s8,a0
     a08:	01c10593          	add	a1,sp,28
     a0c:	01810513          	add	a0,sp,24
     a10:	901ff0ef          	jal	310 <gemm_cfu_2x2>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     a14:	409904b3          	sub	s1,s2,s1
  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A,B,C_cfu); i1=rdinstret(); c1=rdcycle();
     a18:	fe0ff0ef          	jal	1f8 <rdinstret>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     a1c:	00993933          	sltu	s2,s2,s1
     a20:	41440433          	sub	s0,s0,s4
     a24:	41240433          	sub	s0,s0,s2
  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A,B,C_cfu); i1=rdinstret(); c1=rdcycle();
     a28:	00058a13          	mv	s4,a1
     a2c:	00050913          	mv	s2,a0
     a30:	fb4ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     a34:	41950cb3          	sub	s9,a0,s9
     a38:	019537b3          	sltu	a5,a0,s9
     a3c:	417585b3          	sub	a1,a1,s7
     a40:	40f587b3          	sub	a5,a1,a5
     a44:	00f12423          	sw	a5,8(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A,B,C_cfs,C4dbg); i1=rdinstret(); c1=rdcycle();
     a48:	f9cff0ef          	jal	1e4 <rdcycle>
     a4c:	00058d13          	mv	s10,a1
     a50:	00050b93          	mv	s7,a0
     a54:	fa4ff0ef          	jal	1f8 <rdinstret>
     a58:	0c010693          	add	a3,sp,192
     a5c:	07010613          	add	a2,sp,112
     a60:	00058b13          	mv	s6,a1
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     a64:	415a0a33          	sub	s4,s4,s5
  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A,B,C_cfs,C4dbg); i1=rdinstret(); c1=rdcycle();
     a68:	01c10593          	add	a1,sp,28
     a6c:	00050a93          	mv	s5,a0
     a70:	01810513          	add	a0,sp,24
     a74:	b21ff0ef          	jal	594 <gemm_cfs_2x2>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     a78:	41890c33          	sub	s8,s2,s8
  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A,B,C_cfs,C4dbg); i1=rdinstret(); c1=rdcycle();
     a7c:	f7cff0ef          	jal	1f8 <rdinstret>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     a80:	01893933          	sltu	s2,s2,s8
     a84:	412a0a33          	sub	s4,s4,s2
  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A,B,C_cfs,C4dbg); i1=rdinstret(); c1=rdcycle();
     a88:	00058d93          	mv	s11,a1
     a8c:	00050913          	mv	s2,a0
     a90:	f54ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     a94:	41750bb3          	sub	s7,a0,s7
     a98:	41590ab3          	sub	s5,s2,s5
     a9c:	41a585b3          	sub	a1,a1,s10
     aa0:	017537b3          	sltu	a5,a0,s7
     aa4:	01593533          	sltu	a0,s2,s5
     aa8:	416d8933          	sub	s2,s11,s6
     aac:	40f587b3          	sub	a5,a1,a5
     ab0:	40a90933          	sub	s2,s2,a0

  int ok_cfu = cmp_NxN(&C_sw[0][0], &C_cfu[0][0]);
     ab4:	06010593          	add	a1,sp,96
     ab8:	05010513          	add	a0,sp,80
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     abc:	00f12623          	sw	a5,12(sp)
  int ok_cfu = cmp_NxN(&C_sw[0][0], &C_cfu[0][0]);
     ac0:	f4cff0ef          	jal	20c <cmp_NxN>
     ac4:	00050d13          	mv	s10,a0
  int ok_cfs = cmp_NxN(&C_sw[0][0], &C_cfs[0][0]);
     ac8:	07010593          	add	a1,sp,112
     acc:	05010513          	add	a0,sp,80
     ad0:	f3cff0ef          	jal	20c <cmp_NxN>
     ad4:	00050b13          	mv	s6,a0

  print_mat4("CFS C tile (Test2)", C4dbg);
     ad8:	0000f537          	lui	a0,0xf
     adc:	0c010593          	add	a1,sp,192
     ae0:	18c50513          	add	a0,a0,396 # f18c <__fini_array_end+0x118>
     ae4:	8d1ff0ef          	jal	3b4 <print_mat4>
  print_mat2("SW C 2x2 (Test2)", C_sw);
     ae8:	0000f537          	lui	a0,0xf
     aec:	05010593          	add	a1,sp,80
     af0:	1a050513          	add	a0,a0,416 # f1a0 <__fini_array_end+0x12c>
     af4:	949ff0ef          	jal	43c <print_mat2>
  print_mat2("CFS C 2x2 (Test2)", C_cfs);
     af8:	0000f537          	lui	a0,0xf
     afc:	07010593          	add	a1,sp,112
     b00:	1b450513          	add	a0,a0,436 # f1b4 <__fini_array_end+0x140>
     b04:	939ff0ef          	jal	43c <print_mat2>

  printf("\n2x2 timing summary (cycles / instret)\n");
     b08:	0000f537          	lui	a0,0xf
     b0c:	1c850513          	add	a0,a0,456 # f1c8 <__fini_array_end+0x154>
     b10:	5a0000ef          	jal	10b0 <puts>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     b14:	0000f537          	lui	a0,0xf
     b18:	1f050513          	add	a0,a0,496 # f1f0 <__fini_array_end+0x17c>
     b1c:	594000ef          	jal	10b0 <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     b20:	0000f537          	lui	a0,0xf
     b24:	23050513          	add	a0,a0,560 # f230 <__fini_array_end+0x1bc>
     b28:	588000ef          	jal	10b0 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc,  sw_ins);
     b2c:	00412683          	lw	a3,4(sp)
     b30:	0000f537          	lui	a0,0xf
     b34:	00048713          	mv	a4,s1
     b38:	00040793          	mv	a5,s0
     b3c:	00098613          	mv	a2,s3
     b40:	27050513          	add	a0,a0,624 # f270 <__fini_array_end+0x1fc>
     b44:	3d8000ef          	jal	f1c <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins);
     b48:	00812683          	lw	a3,8(sp)
     b4c:	0000f537          	lui	a0,0xf
     b50:	000c0713          	mv	a4,s8
     b54:	000a0793          	mv	a5,s4
     b58:	000c8613          	mv	a2,s9
     b5c:	2a850513          	add	a0,a0,680 # f2a8 <__fini_array_end+0x234>
     b60:	3bc000ef          	jal	f1c <printf>
  print_speedup_fixed(sw_cyc,  cfu_cyc);  printf("     |  "); print_speedup_fixed(sw_ins,  cfu_ins);  printf("\n");
     b64:	00812683          	lw	a3,8(sp)
     b68:	00412583          	lw	a1,4(sp)
     b6c:	000c8613          	mv	a2,s9
     b70:	00098513          	mv	a0,s3
     b74:	95dff0ef          	jal	4d0 <print_speedup_fixed>
     b78:	0000fcb7          	lui	s9,0xf
     b7c:	2c4c8513          	add	a0,s9,708 # f2c4 <__fini_array_end+0x250>
     b80:	39c000ef          	jal	f1c <printf>
     b84:	00040593          	mv	a1,s0
     b88:	000c0613          	mv	a2,s8
     b8c:	000a0693          	mv	a3,s4
     b90:	00048513          	mv	a0,s1
     b94:	93dff0ef          	jal	4d0 <print_speedup_fixed>
     b98:	00a00513          	li	a0,10
     b9c:	3d0000ef          	jal	f6c <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins);
     ba0:	00c12683          	lw	a3,12(sp)
     ba4:	0000f537          	lui	a0,0xf
     ba8:	000a8713          	mv	a4,s5
     bac:	00090793          	mv	a5,s2
     bb0:	000b8613          	mv	a2,s7
     bb4:	2d050513          	add	a0,a0,720 # f2d0 <__fini_array_end+0x25c>
     bb8:	364000ef          	jal	f1c <printf>
  print_speedup_fixed(sw_cyc,  cfs_cyc);  printf("     |  "); print_speedup_fixed(sw_ins,  cfs_ins);  printf("\n");
     bbc:	00c12683          	lw	a3,12(sp)
     bc0:	00412583          	lw	a1,4(sp)
     bc4:	000b8613          	mv	a2,s7
     bc8:	00098513          	mv	a0,s3
     bcc:	905ff0ef          	jal	4d0 <print_speedup_fixed>
     bd0:	2c4c8513          	add	a0,s9,708
     bd4:	348000ef          	jal	f1c <printf>
     bd8:	00048513          	mv	a0,s1
     bdc:	000a8613          	mv	a2,s5
     be0:	00090693          	mv	a3,s2
     be4:	00040593          	mv	a1,s0
     be8:	8e9ff0ef          	jal	4d0 <print_speedup_fixed>
     bec:	00a00513          	li	a0,10
     bf0:	37c000ef          	jal	f6c <putchar>

  printf("\nTest2 Verdict: CFU %s, CFS %s\n",
     bf4:	080d0263          	beqz	s10,c78 <main+0x458>
     bf8:	0000f5b7          	lui	a1,0xf
     bfc:	0b058593          	add	a1,a1,176 # f0b0 <__fini_array_end+0x3c>
     c00:	080b0263          	beqz	s6,c84 <main+0x464>
     c04:	0000f637          	lui	a2,0xf
     c08:	0b060613          	add	a2,a2,176 # f0b0 <__fini_array_end+0x3c>
     c0c:	0000f537          	lui	a0,0xf
     c10:	2ec50513          	add	a0,a0,748 # f2ec <__fini_array_end+0x278>
     c14:	308000ef          	jal	f1c <printf>
         ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");

  return (ok_cfu && ok_cfs) ? 0 : 1;
     c18:	00100513          	li	a0,1
     c1c:	000d0463          	beqz	s10,c24 <main+0x404>
     c20:	001b3513          	seqz	a0,s6
}
     c24:	13c12083          	lw	ra,316(sp)
     c28:	13812403          	lw	s0,312(sp)
     c2c:	13412483          	lw	s1,308(sp)
     c30:	13012903          	lw	s2,304(sp)
     c34:	12c12983          	lw	s3,300(sp)
     c38:	12812a03          	lw	s4,296(sp)
     c3c:	12412a83          	lw	s5,292(sp)
     c40:	12012b03          	lw	s6,288(sp)
     c44:	11c12b83          	lw	s7,284(sp)
     c48:	11812c03          	lw	s8,280(sp)
     c4c:	11412c83          	lw	s9,276(sp)
     c50:	11012d03          	lw	s10,272(sp)
     c54:	10c12d83          	lw	s11,268(sp)
     c58:	14010113          	add	sp,sp,320
     c5c:	00008067          	ret
  printf("Test1 Verdict: CFU %s, CFS %s\n", ok_cfu1?"PASS":"FAIL", ok_cfs1?"PASS":"FAIL");
     c60:	0000f5b7          	lui	a1,0xf
     c64:	0b858593          	add	a1,a1,184 # f0b8 <__fini_array_end+0x44>
     c68:	d09ff06f          	j	970 <main+0x150>
     c6c:	0000f637          	lui	a2,0xf
     c70:	0b860613          	add	a2,a2,184 # f0b8 <__fini_array_end+0x44>
     c74:	d09ff06f          	j	97c <main+0x15c>
  printf("\nTest2 Verdict: CFU %s, CFS %s\n",
     c78:	0000f5b7          	lui	a1,0xf
     c7c:	0b858593          	add	a1,a1,184 # f0b8 <__fini_array_end+0x44>
     c80:	f81ff06f          	j	c00 <main+0x3e0>
     c84:	0000f637          	lui	a2,0xf
     c88:	0b860613          	add	a2,a2,184 # f0b8 <__fini_array_end+0x44>
     c8c:	f81ff06f          	j	c0c <main+0x3ec>

00000c90 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     c90:	fffff097          	auipc	ra,0xfffff
     c94:	4c808093          	add	ra,ra,1224 # 158 <__crt0_main_exit>
     c98:	00050513          	mv	a0,a0
     c9c:	00008067          	ret

00000ca0 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     ca0:	fff00513          	li	a0,-1
     ca4:	00008067          	ret

00000ca8 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     ca8:	000027b7          	lui	a5,0x2
     cac:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     cb0:	00000513          	li	a0,0
     cb4:	00008067          	ret

00000cb8 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     cb8:	00100513          	li	a0,1
     cbc:	00008067          	ret

00000cc0 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     cc0:	00100513          	li	a0,1
     cc4:	00008067          	ret

00000cc8 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     cc8:	800007b7          	lui	a5,0x80000
     ccc:	01600713          	li	a4,22
     cd0:	72e7a023          	sw	a4,1824(a5) # 80000720 <errno>
  return -1;
}
     cd4:	fff00513          	li	a0,-1
     cd8:	00008067          	ret

00000cdc <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     cdc:	00000513          	li	a0,0
     ce0:	00008067          	ret

00000ce4 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     ce4:	fe010113          	add	sp,sp,-32
     ce8:	00912a23          	sw	s1,20(sp)
     cec:	01212823          	sw	s2,16(sp)
     cf0:	00112e23          	sw	ra,28(sp)
     cf4:	00812c23          	sw	s0,24(sp)
     cf8:	01312623          	sw	s3,12(sp)
     cfc:	01412423          	sw	s4,8(sp)
     d00:	00058913          	mv	s2,a1
     d04:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     d08:	06051463          	bnez	a0,d70 <_read+0x8c>
     d0c:	00050413          	mv	s0,a0
     d10:	fff50537          	lui	a0,0xfff50
     d14:	1a0000ef          	jal	eb4 <neorv32_uart_available>
     d18:	04050c63          	beqz	a0,d70 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d1c:	00a00993          	li	s3,10
     d20:	00d00a13          	li	s4,13
    while (len--) {
     d24:	00941663          	bne	s0,s1,d30 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     d28:	00048413          	mv	s0,s1
     d2c:	0200006f          	j	d4c <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     d30:	fff50537          	lui	a0,0xfff50
     d34:	1d0000ef          	jal	f04 <neorv32_uart_getc>
      *ptr++ = c;
     d38:	008907b3          	add	a5,s2,s0
     d3c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     d40:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d44:	01350463          	beq	a0,s3,d4c <_read+0x68>
     d48:	fd451ee3          	bne	a0,s4,d24 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     d4c:	01c12083          	lw	ra,28(sp)
     d50:	00040513          	mv	a0,s0
     d54:	01812403          	lw	s0,24(sp)
     d58:	01412483          	lw	s1,20(sp)
     d5c:	01012903          	lw	s2,16(sp)
     d60:	00c12983          	lw	s3,12(sp)
     d64:	00812a03          	lw	s4,8(sp)
     d68:	02010113          	add	sp,sp,32
     d6c:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     d70:	fff60537          	lui	a0,0xfff60
     d74:	140000ef          	jal	eb4 <neorv32_uart_available>
  int read_cnt = 0;
     d78:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     d7c:	02050863          	beqz	a0,dac <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     d80:	00a00993          	li	s3,10
     d84:	00d00a13          	li	s4,13
    while (len--) {
     d88:	fa9400e3          	beq	s0,s1,d28 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     d8c:	fff60537          	lui	a0,0xfff60
     d90:	174000ef          	jal	f04 <neorv32_uart_getc>
      *ptr++ = c;
     d94:	008907b3          	add	a5,s2,s0
     d98:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     d9c:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     da0:	fb3506e3          	beq	a0,s3,d4c <_read+0x68>
     da4:	ff4512e3          	bne	a0,s4,d88 <_read+0xa4>
     da8:	fa5ff06f          	j	d4c <_read+0x68>
    errno = ENOSYS;
     dac:	800007b7          	lui	a5,0x80000
     db0:	05800713          	li	a4,88
     db4:	72e7a023          	sw	a4,1824(a5) # 80000720 <errno>
    return -1;
     db8:	fff00413          	li	s0,-1
     dbc:	f91ff06f          	j	d4c <_read+0x68>

00000dc0 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     dc0:	ff010113          	add	sp,sp,-16
     dc4:	00812423          	sw	s0,8(sp)
     dc8:	00912223          	sw	s1,4(sp)
     dcc:	00112623          	sw	ra,12(sp)
     dd0:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     dd4:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     dd8:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     ddc:	00058413          	mv	s0,a1
     de0:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     de4:	04a7ec63          	bltu	a5,a0,e3c <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     de8:	fff50537          	lui	a0,0xfff50
     dec:	0c8000ef          	jal	eb4 <neorv32_uart_available>
     df0:	00940933          	add	s2,s0,s1
     df4:	02051463          	bnez	a0,e1c <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     df8:	800007b7          	lui	a5,0x80000
     dfc:	05800713          	li	a4,88
     e00:	72e7a023          	sw	a4,1824(a5) # 80000720 <errno>
      return -1;
     e04:	fff00493          	li	s1,-1
     e08:	0180006f          	j	e20 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     e0c:	00044583          	lbu	a1,0(s0)
     e10:	fff50537          	lui	a0,0xfff50
     e14:	00140413          	add	s0,s0,1
     e18:	0d8000ef          	jal	ef0 <neorv32_uart_putc>
      while (len--) {
     e1c:	fe8918e3          	bne	s2,s0,e0c <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     e20:	00c12083          	lw	ra,12(sp)
     e24:	00812403          	lw	s0,8(sp)
     e28:	00012903          	lw	s2,0(sp)
     e2c:	00048513          	mv	a0,s1
     e30:	00412483          	lw	s1,4(sp)
     e34:	01010113          	add	sp,sp,16
     e38:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     e3c:	fff60537          	lui	a0,0xfff60
     e40:	074000ef          	jal	eb4 <neorv32_uart_available>
     e44:	00940933          	add	s2,s0,s1
     e48:	fa0508e3          	beqz	a0,df8 <_write+0x38>
    while (len--) {
     e4c:	fd240ae3          	beq	s0,s2,e20 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     e50:	00044583          	lbu	a1,0(s0)
     e54:	fff60537          	lui	a0,0xfff60
     e58:	00140413          	add	s0,s0,1
     e5c:	094000ef          	jal	ef0 <neorv32_uart_putc>
      write_cnt++;
     e60:	fedff06f          	j	e4c <_write+0x8c>

00000e64 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     e64:	80000737          	lui	a4,0x80000
     e68:	71c72683          	lw	a3,1820(a4) # 8000071c <curr_heap.0>
     e6c:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     e70:	00050793          	mv	a5,a0
     e74:	8bc60613          	add	a2,a2,-1860 # 800008bc <__crt0_bss_end>
  if (curr_heap == NULL) {
     e78:	00069463          	bnez	a3,e80 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     e7c:	70c72e23          	sw	a2,1820(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     e80:	800016b7          	lui	a3,0x80001
     e84:	8bc68693          	add	a3,a3,-1860 # 800008bc <__crt0_bss_end>
     e88:	00c69c63          	bne	a3,a2,ea0 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     e8c:	800007b7          	lui	a5,0x80000
     e90:	00c00713          	li	a4,12
     e94:	72e7a023          	sw	a4,1824(a5) # 80000720 <errno>
    return (void*)-1; // error - no more memory
     e98:	fff00513          	li	a0,-1
     e9c:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     ea0:	71c72503          	lw	a0,1820(a4)
     ea4:	00f507b3          	add	a5,a0,a5
     ea8:	fed7f2e3          	bgeu	a5,a3,e8c <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     eac:	70f72e23          	sw	a5,1820(a4)

  return (void*)prev_heap;
}
     eb0:	00008067          	ret

00000eb4 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     eb4:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     eb8:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     ebc:	00e51c63          	bne	a0,a4,ed4 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     ec0:	fffe07b7          	lui	a5,0xfffe0
     ec4:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     ec8:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     ecc:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     ed0:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     ed4:	fff60737          	lui	a4,0xfff60
    return 0;
     ed8:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     edc:	fee79ae3          	bne	a5,a4,ed0 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     ee0:	fffe07b7          	lui	a5,0xfffe0
     ee4:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     ee8:	020007b7          	lui	a5,0x2000
     eec:	fe1ff06f          	j	ecc <neorv32_uart_available+0x18>

00000ef0 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     ef0:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     ef4:	00a79713          	sll	a4,a5,0xa
     ef8:	fe075ce3          	bgez	a4,ef0 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     efc:	00b52223          	sw	a1,4(a0)
}
     f00:	00008067          	ret

00000f04 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     f04:	00052783          	lw	a5,0(a0)
     f08:	00f79713          	sll	a4,a5,0xf
     f0c:	fe075ce3          	bgez	a4,f04 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     f10:	00452503          	lw	a0,4(a0)
}
     f14:	0ff57513          	zext.b	a0,a0
     f18:	00008067          	ret

00000f1c <printf>:
     f1c:	fc010113          	add	sp,sp,-64
     f20:	02c12423          	sw	a2,40(sp)
     f24:	02d12623          	sw	a3,44(sp)
     f28:	7ffff317          	auipc	t1,0x7ffff
     f2c:	7e832303          	lw	t1,2024(t1) # 80000710 <_impure_ptr>
     f30:	02b12223          	sw	a1,36(sp)
     f34:	02e12823          	sw	a4,48(sp)
     f38:	02f12a23          	sw	a5,52(sp)
     f3c:	03012c23          	sw	a6,56(sp)
     f40:	03112e23          	sw	a7,60(sp)
     f44:	00832583          	lw	a1,8(t1)
     f48:	02410693          	add	a3,sp,36
     f4c:	00050613          	mv	a2,a0
     f50:	00030513          	mv	a0,t1
     f54:	00112e23          	sw	ra,28(sp)
     f58:	00d12623          	sw	a3,12(sp)
     f5c:	0c8010ef          	jal	2024 <_vfprintf_r>
     f60:	01c12083          	lw	ra,28(sp)
     f64:	04010113          	add	sp,sp,64
     f68:	00008067          	ret

00000f6c <putchar>:
     f6c:	7ffff797          	auipc	a5,0x7ffff
     f70:	7a47a783          	lw	a5,1956(a5) # 80000710 <_impure_ptr>
     f74:	0087a603          	lw	a2,8(a5)
     f78:	00050593          	mv	a1,a0
     f7c:	00078513          	mv	a0,a5
     f80:	3c00606f          	j	7340 <_putc_r>

00000f84 <_puts_r>:
     f84:	fd010113          	add	sp,sp,-48
     f88:	02812423          	sw	s0,40(sp)
     f8c:	00050413          	mv	s0,a0
     f90:	00058513          	mv	a0,a1
     f94:	02912223          	sw	s1,36(sp)
     f98:	02112623          	sw	ra,44(sp)
     f9c:	00058493          	mv	s1,a1
     fa0:	3b0000ef          	jal	1350 <strlen>
     fa4:	00150713          	add	a4,a0,1
     fa8:	0000e697          	auipc	a3,0xe
     fac:	2fc68693          	add	a3,a3,764 # f2a4 <__fini_array_end+0x230>
     fb0:	00e12623          	sw	a4,12(sp)
     fb4:	03442783          	lw	a5,52(s0)
     fb8:	01010713          	add	a4,sp,16
     fbc:	00d12c23          	sw	a3,24(sp)
     fc0:	00e12223          	sw	a4,4(sp)
     fc4:	00100693          	li	a3,1
     fc8:	00200713          	li	a4,2
     fcc:	00912823          	sw	s1,16(sp)
     fd0:	00a12a23          	sw	a0,20(sp)
     fd4:	00d12e23          	sw	a3,28(sp)
     fd8:	00e12423          	sw	a4,8(sp)
     fdc:	00842483          	lw	s1,8(s0)
     fe0:	0c078263          	beqz	a5,10a4 <_puts_r+0x120>
     fe4:	0644a703          	lw	a4,100(s1)
     fe8:	00c49783          	lh	a5,12(s1)
     fec:	00177713          	and	a4,a4,1
     ff0:	00071663          	bnez	a4,ffc <_puts_r+0x78>
     ff4:	2007f713          	and	a4,a5,512
     ff8:	08070e63          	beqz	a4,1094 <_puts_r+0x110>
     ffc:	01279713          	sll	a4,a5,0x12
    1000:	02074263          	bltz	a4,1024 <_puts_r+0xa0>
    1004:	0644a703          	lw	a4,100(s1)
    1008:	ffffe6b7          	lui	a3,0xffffe
    100c:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1010:	00002637          	lui	a2,0x2
    1014:	00c7e7b3          	or	a5,a5,a2
    1018:	00d77733          	and	a4,a4,a3
    101c:	00f49623          	sh	a5,12(s1)
    1020:	06e4a223          	sw	a4,100(s1)
    1024:	00040513          	mv	a0,s0
    1028:	00410613          	add	a2,sp,4
    102c:	00048593          	mv	a1,s1
    1030:	549050ef          	jal	6d78 <__sfvwrite_r>
    1034:	0644a783          	lw	a5,100(s1)
    1038:	00153413          	seqz	s0,a0
    103c:	40800433          	neg	s0,s0
    1040:	00b47413          	and	s0,s0,11
    1044:	0017f793          	and	a5,a5,1
    1048:	fff40413          	add	s0,s0,-1
    104c:	00079863          	bnez	a5,105c <_puts_r+0xd8>
    1050:	00c4d783          	lhu	a5,12(s1)
    1054:	2007f793          	and	a5,a5,512
    1058:	00078e63          	beqz	a5,1074 <_puts_r+0xf0>
    105c:	02c12083          	lw	ra,44(sp)
    1060:	00040513          	mv	a0,s0
    1064:	02812403          	lw	s0,40(sp)
    1068:	02412483          	lw	s1,36(sp)
    106c:	03010113          	add	sp,sp,48
    1070:	00008067          	ret
    1074:	0584a503          	lw	a0,88(s1)
    1078:	054000ef          	jal	10cc <__retarget_lock_release_recursive>
    107c:	02c12083          	lw	ra,44(sp)
    1080:	00040513          	mv	a0,s0
    1084:	02812403          	lw	s0,40(sp)
    1088:	02412483          	lw	s1,36(sp)
    108c:	03010113          	add	sp,sp,48
    1090:	00008067          	ret
    1094:	0584a503          	lw	a0,88(s1)
    1098:	030000ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    109c:	00c49783          	lh	a5,12(s1)
    10a0:	f5dff06f          	j	ffc <_puts_r+0x78>
    10a4:	00040513          	mv	a0,s0
    10a8:	449050ef          	jal	6cf0 <__sinit>
    10ac:	f39ff06f          	j	fe4 <_puts_r+0x60>

000010b0 <puts>:
    10b0:	00050593          	mv	a1,a0
    10b4:	7ffff517          	auipc	a0,0x7ffff
    10b8:	65c52503          	lw	a0,1628(a0) # 80000710 <_impure_ptr>
    10bc:	ec9ff06f          	j	f84 <_puts_r>

000010c0 <__retarget_lock_init_recursive>:
    10c0:	00008067          	ret

000010c4 <__retarget_lock_close_recursive>:
    10c4:	00008067          	ret

000010c8 <__retarget_lock_acquire_recursive>:
    10c8:	00008067          	ret

000010cc <__retarget_lock_release_recursive>:
    10cc:	00008067          	ret

000010d0 <memset>:
    10d0:	00f00313          	li	t1,15
    10d4:	00050713          	mv	a4,a0
    10d8:	02c37e63          	bgeu	t1,a2,1114 <memset+0x44>
    10dc:	00f77793          	and	a5,a4,15
    10e0:	0a079063          	bnez	a5,1180 <memset+0xb0>
    10e4:	08059263          	bnez	a1,1168 <memset+0x98>
    10e8:	ff067693          	and	a3,a2,-16
    10ec:	00f67613          	and	a2,a2,15
    10f0:	00e686b3          	add	a3,a3,a4
    10f4:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    10f8:	00b72223          	sw	a1,4(a4)
    10fc:	00b72423          	sw	a1,8(a4)
    1100:	00b72623          	sw	a1,12(a4)
    1104:	01070713          	add	a4,a4,16
    1108:	fed766e3          	bltu	a4,a3,10f4 <memset+0x24>
    110c:	00061463          	bnez	a2,1114 <memset+0x44>
    1110:	00008067          	ret
    1114:	40c306b3          	sub	a3,t1,a2
    1118:	00269693          	sll	a3,a3,0x2
    111c:	00000297          	auipc	t0,0x0
    1120:	005686b3          	add	a3,a3,t0
    1124:	00c68067          	jr	12(a3)
    1128:	00b70723          	sb	a1,14(a4)
    112c:	00b706a3          	sb	a1,13(a4)
    1130:	00b70623          	sb	a1,12(a4)
    1134:	00b705a3          	sb	a1,11(a4)
    1138:	00b70523          	sb	a1,10(a4)
    113c:	00b704a3          	sb	a1,9(a4)
    1140:	00b70423          	sb	a1,8(a4)
    1144:	00b703a3          	sb	a1,7(a4)
    1148:	00b70323          	sb	a1,6(a4)
    114c:	00b702a3          	sb	a1,5(a4)
    1150:	00b70223          	sb	a1,4(a4)
    1154:	00b701a3          	sb	a1,3(a4)
    1158:	00b70123          	sb	a1,2(a4)
    115c:	00b700a3          	sb	a1,1(a4)
    1160:	00b70023          	sb	a1,0(a4)
    1164:	00008067          	ret
    1168:	0ff5f593          	zext.b	a1,a1
    116c:	00859693          	sll	a3,a1,0x8
    1170:	00d5e5b3          	or	a1,a1,a3
    1174:	01059693          	sll	a3,a1,0x10
    1178:	00d5e5b3          	or	a1,a1,a3
    117c:	f6dff06f          	j	10e8 <memset+0x18>
    1180:	00279693          	sll	a3,a5,0x2
    1184:	00000297          	auipc	t0,0x0
    1188:	005686b3          	add	a3,a3,t0
    118c:	00008293          	mv	t0,ra
    1190:	fa0680e7          	jalr	-96(a3)
    1194:	00028093          	mv	ra,t0
    1198:	ff078793          	add	a5,a5,-16
    119c:	40f70733          	sub	a4,a4,a5
    11a0:	00f60633          	add	a2,a2,a5
    11a4:	f6c378e3          	bgeu	t1,a2,1114 <memset+0x44>
    11a8:	f3dff06f          	j	10e4 <memset+0x14>

000011ac <memcpy>:
    11ac:	00a5c7b3          	xor	a5,a1,a0
    11b0:	0037f793          	and	a5,a5,3
    11b4:	00c508b3          	add	a7,a0,a2
    11b8:	06079463          	bnez	a5,1220 <memcpy+0x74>
    11bc:	00300793          	li	a5,3
    11c0:	06c7f063          	bgeu	a5,a2,1220 <memcpy+0x74>
    11c4:	00357793          	and	a5,a0,3
    11c8:	00050713          	mv	a4,a0
    11cc:	06079a63          	bnez	a5,1240 <memcpy+0x94>
    11d0:	ffc8f613          	and	a2,a7,-4
    11d4:	40e606b3          	sub	a3,a2,a4
    11d8:	02000793          	li	a5,32
    11dc:	08d7ce63          	blt	a5,a3,1278 <memcpy+0xcc>
    11e0:	00058693          	mv	a3,a1
    11e4:	00070793          	mv	a5,a4
    11e8:	02c77863          	bgeu	a4,a2,1218 <memcpy+0x6c>
    11ec:	0006a803          	lw	a6,0(a3)
    11f0:	00478793          	add	a5,a5,4
    11f4:	00468693          	add	a3,a3,4
    11f8:	ff07ae23          	sw	a6,-4(a5)
    11fc:	fec7e8e3          	bltu	a5,a2,11ec <memcpy+0x40>
    1200:	fff60793          	add	a5,a2,-1 # 1fff <_malloc_r+0x7d3>
    1204:	40e787b3          	sub	a5,a5,a4
    1208:	ffc7f793          	and	a5,a5,-4
    120c:	00478793          	add	a5,a5,4
    1210:	00f70733          	add	a4,a4,a5
    1214:	00f585b3          	add	a1,a1,a5
    1218:	01176863          	bltu	a4,a7,1228 <memcpy+0x7c>
    121c:	00008067          	ret
    1220:	00050713          	mv	a4,a0
    1224:	05157863          	bgeu	a0,a7,1274 <memcpy+0xc8>
    1228:	0005c783          	lbu	a5,0(a1)
    122c:	00170713          	add	a4,a4,1
    1230:	00158593          	add	a1,a1,1
    1234:	fef70fa3          	sb	a5,-1(a4)
    1238:	fee898e3          	bne	a7,a4,1228 <memcpy+0x7c>
    123c:	00008067          	ret
    1240:	0005c683          	lbu	a3,0(a1)
    1244:	00170713          	add	a4,a4,1
    1248:	00377793          	and	a5,a4,3
    124c:	fed70fa3          	sb	a3,-1(a4)
    1250:	00158593          	add	a1,a1,1
    1254:	f6078ee3          	beqz	a5,11d0 <memcpy+0x24>
    1258:	0005c683          	lbu	a3,0(a1)
    125c:	00170713          	add	a4,a4,1
    1260:	00377793          	and	a5,a4,3
    1264:	fed70fa3          	sb	a3,-1(a4)
    1268:	00158593          	add	a1,a1,1
    126c:	fc079ae3          	bnez	a5,1240 <memcpy+0x94>
    1270:	f61ff06f          	j	11d0 <memcpy+0x24>
    1274:	00008067          	ret
    1278:	ff010113          	add	sp,sp,-16
    127c:	00812623          	sw	s0,12(sp)
    1280:	02000413          	li	s0,32
    1284:	0005a383          	lw	t2,0(a1)
    1288:	0045a283          	lw	t0,4(a1)
    128c:	0085af83          	lw	t6,8(a1)
    1290:	00c5af03          	lw	t5,12(a1)
    1294:	0105ae83          	lw	t4,16(a1)
    1298:	0145ae03          	lw	t3,20(a1)
    129c:	0185a303          	lw	t1,24(a1)
    12a0:	01c5a803          	lw	a6,28(a1)
    12a4:	0205a683          	lw	a3,32(a1)
    12a8:	02470713          	add	a4,a4,36
    12ac:	40e607b3          	sub	a5,a2,a4
    12b0:	fc772e23          	sw	t2,-36(a4)
    12b4:	fe572023          	sw	t0,-32(a4)
    12b8:	fff72223          	sw	t6,-28(a4)
    12bc:	ffe72423          	sw	t5,-24(a4)
    12c0:	ffd72623          	sw	t4,-20(a4)
    12c4:	ffc72823          	sw	t3,-16(a4)
    12c8:	fe672a23          	sw	t1,-12(a4)
    12cc:	ff072c23          	sw	a6,-8(a4)
    12d0:	fed72e23          	sw	a3,-4(a4)
    12d4:	02458593          	add	a1,a1,36
    12d8:	faf446e3          	blt	s0,a5,1284 <memcpy+0xd8>
    12dc:	00058693          	mv	a3,a1
    12e0:	00070793          	mv	a5,a4
    12e4:	02c77863          	bgeu	a4,a2,1314 <memcpy+0x168>
    12e8:	0006a803          	lw	a6,0(a3)
    12ec:	00478793          	add	a5,a5,4
    12f0:	00468693          	add	a3,a3,4
    12f4:	ff07ae23          	sw	a6,-4(a5)
    12f8:	fec7e8e3          	bltu	a5,a2,12e8 <memcpy+0x13c>
    12fc:	fff60793          	add	a5,a2,-1
    1300:	40e787b3          	sub	a5,a5,a4
    1304:	ffc7f793          	and	a5,a5,-4
    1308:	00478793          	add	a5,a5,4
    130c:	00f70733          	add	a4,a4,a5
    1310:	00f585b3          	add	a1,a1,a5
    1314:	01176863          	bltu	a4,a7,1324 <memcpy+0x178>
    1318:	00c12403          	lw	s0,12(sp)
    131c:	01010113          	add	sp,sp,16
    1320:	00008067          	ret
    1324:	0005c783          	lbu	a5,0(a1)
    1328:	00170713          	add	a4,a4,1
    132c:	00158593          	add	a1,a1,1
    1330:	fef70fa3          	sb	a5,-1(a4)
    1334:	fee882e3          	beq	a7,a4,1318 <memcpy+0x16c>
    1338:	0005c783          	lbu	a5,0(a1)
    133c:	00170713          	add	a4,a4,1
    1340:	00158593          	add	a1,a1,1
    1344:	fef70fa3          	sb	a5,-1(a4)
    1348:	fce89ee3          	bne	a7,a4,1324 <memcpy+0x178>
    134c:	fcdff06f          	j	1318 <memcpy+0x16c>

00001350 <strlen>:
    1350:	00357793          	and	a5,a0,3
    1354:	00050713          	mv	a4,a0
    1358:	04079c63          	bnez	a5,13b0 <strlen+0x60>
    135c:	7f7f86b7          	lui	a3,0x7f7f8
    1360:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1364:	fff00593          	li	a1,-1
    1368:	00072603          	lw	a2,0(a4)
    136c:	00470713          	add	a4,a4,4
    1370:	00d677b3          	and	a5,a2,a3
    1374:	00d787b3          	add	a5,a5,a3
    1378:	00c7e7b3          	or	a5,a5,a2
    137c:	00d7e7b3          	or	a5,a5,a3
    1380:	feb784e3          	beq	a5,a1,1368 <strlen+0x18>
    1384:	ffc74683          	lbu	a3,-4(a4)
    1388:	40a707b3          	sub	a5,a4,a0
    138c:	04068463          	beqz	a3,13d4 <strlen+0x84>
    1390:	ffd74683          	lbu	a3,-3(a4)
    1394:	02068c63          	beqz	a3,13cc <strlen+0x7c>
    1398:	ffe74503          	lbu	a0,-2(a4)
    139c:	00a03533          	snez	a0,a0
    13a0:	00f50533          	add	a0,a0,a5
    13a4:	ffe50513          	add	a0,a0,-2
    13a8:	00008067          	ret
    13ac:	fa0688e3          	beqz	a3,135c <strlen+0xc>
    13b0:	00074783          	lbu	a5,0(a4)
    13b4:	00170713          	add	a4,a4,1
    13b8:	00377693          	and	a3,a4,3
    13bc:	fe0798e3          	bnez	a5,13ac <strlen+0x5c>
    13c0:	40a70733          	sub	a4,a4,a0
    13c4:	fff70513          	add	a0,a4,-1
    13c8:	00008067          	ret
    13cc:	ffd78513          	add	a0,a5,-3
    13d0:	00008067          	ret
    13d4:	ffc78513          	add	a0,a5,-4
    13d8:	00008067          	ret

000013dc <_malloc_trim_r>:
    13dc:	fe010113          	add	sp,sp,-32
    13e0:	00812c23          	sw	s0,24(sp)
    13e4:	00912a23          	sw	s1,20(sp)
    13e8:	01212823          	sw	s2,16(sp)
    13ec:	01312623          	sw	s3,12(sp)
    13f0:	01412423          	sw	s4,8(sp)
    13f4:	00058993          	mv	s3,a1
    13f8:	00112e23          	sw	ra,28(sp)
    13fc:	00050913          	mv	s2,a0
    1400:	7ffffa17          	auipc	s4,0x7ffff
    1404:	d20a0a13          	add	s4,s4,-736 # 80000120 <__malloc_av_>
    1408:	405000ef          	jal	200c <__malloc_lock>
    140c:	008a2703          	lw	a4,8(s4)
    1410:	000017b7          	lui	a5,0x1
    1414:	fef78793          	add	a5,a5,-17 # fef <_puts_r+0x6b>
    1418:	00472483          	lw	s1,4(a4)
    141c:	00001737          	lui	a4,0x1
    1420:	ffc4f493          	and	s1,s1,-4
    1424:	00f48433          	add	s0,s1,a5
    1428:	41340433          	sub	s0,s0,s3
    142c:	00c45413          	srl	s0,s0,0xc
    1430:	fff40413          	add	s0,s0,-1
    1434:	00c41413          	sll	s0,s0,0xc
    1438:	00e44e63          	blt	s0,a4,1454 <_malloc_trim_r+0x78>
    143c:	00000593          	li	a1,0
    1440:	00090513          	mv	a0,s2
    1444:	105060ef          	jal	7d48 <_sbrk_r>
    1448:	008a2783          	lw	a5,8(s4)
    144c:	009787b3          	add	a5,a5,s1
    1450:	02f50863          	beq	a0,a5,1480 <_malloc_trim_r+0xa4>
    1454:	00090513          	mv	a0,s2
    1458:	3c1000ef          	jal	2018 <__malloc_unlock>
    145c:	01c12083          	lw	ra,28(sp)
    1460:	01812403          	lw	s0,24(sp)
    1464:	01412483          	lw	s1,20(sp)
    1468:	01012903          	lw	s2,16(sp)
    146c:	00c12983          	lw	s3,12(sp)
    1470:	00812a03          	lw	s4,8(sp)
    1474:	00000513          	li	a0,0
    1478:	02010113          	add	sp,sp,32
    147c:	00008067          	ret
    1480:	408005b3          	neg	a1,s0
    1484:	00090513          	mv	a0,s2
    1488:	0c1060ef          	jal	7d48 <_sbrk_r>
    148c:	fff00793          	li	a5,-1
    1490:	04f50a63          	beq	a0,a5,14e4 <_malloc_trim_r+0x108>
    1494:	7ffff717          	auipc	a4,0x7ffff
    1498:	2c870713          	add	a4,a4,712 # 8000075c <__malloc_current_mallinfo>
    149c:	00072783          	lw	a5,0(a4)
    14a0:	008a2683          	lw	a3,8(s4)
    14a4:	408484b3          	sub	s1,s1,s0
    14a8:	0014e493          	or	s1,s1,1
    14ac:	408787b3          	sub	a5,a5,s0
    14b0:	00090513          	mv	a0,s2
    14b4:	0096a223          	sw	s1,4(a3)
    14b8:	00f72023          	sw	a5,0(a4)
    14bc:	35d000ef          	jal	2018 <__malloc_unlock>
    14c0:	01c12083          	lw	ra,28(sp)
    14c4:	01812403          	lw	s0,24(sp)
    14c8:	01412483          	lw	s1,20(sp)
    14cc:	01012903          	lw	s2,16(sp)
    14d0:	00c12983          	lw	s3,12(sp)
    14d4:	00812a03          	lw	s4,8(sp)
    14d8:	00100513          	li	a0,1
    14dc:	02010113          	add	sp,sp,32
    14e0:	00008067          	ret
    14e4:	00000593          	li	a1,0
    14e8:	00090513          	mv	a0,s2
    14ec:	05d060ef          	jal	7d48 <_sbrk_r>
    14f0:	008a2703          	lw	a4,8(s4)
    14f4:	00f00693          	li	a3,15
    14f8:	40e507b3          	sub	a5,a0,a4
    14fc:	f4f6dce3          	bge	a3,a5,1454 <_malloc_trim_r+0x78>
    1500:	7ffff697          	auipc	a3,0x7ffff
    1504:	2146a683          	lw	a3,532(a3) # 80000714 <__malloc_sbrk_base>
    1508:	40d50533          	sub	a0,a0,a3
    150c:	0017e793          	or	a5,a5,1
    1510:	7ffff697          	auipc	a3,0x7ffff
    1514:	24a6a623          	sw	a0,588(a3) # 8000075c <__malloc_current_mallinfo>
    1518:	00f72223          	sw	a5,4(a4)
    151c:	f39ff06f          	j	1454 <_malloc_trim_r+0x78>

00001520 <_free_r>:
    1520:	18058263          	beqz	a1,16a4 <_free_r+0x184>
    1524:	ff010113          	add	sp,sp,-16
    1528:	00812423          	sw	s0,8(sp)
    152c:	00912223          	sw	s1,4(sp)
    1530:	00058413          	mv	s0,a1
    1534:	00050493          	mv	s1,a0
    1538:	00112623          	sw	ra,12(sp)
    153c:	2d1000ef          	jal	200c <__malloc_lock>
    1540:	ffc42583          	lw	a1,-4(s0)
    1544:	ff840713          	add	a4,s0,-8
    1548:	7ffff517          	auipc	a0,0x7ffff
    154c:	bd850513          	add	a0,a0,-1064 # 80000120 <__malloc_av_>
    1550:	ffe5f793          	and	a5,a1,-2
    1554:	00f70633          	add	a2,a4,a5
    1558:	00462683          	lw	a3,4(a2)
    155c:	00852803          	lw	a6,8(a0)
    1560:	ffc6f693          	and	a3,a3,-4
    1564:	1ac80263          	beq	a6,a2,1708 <_free_r+0x1e8>
    1568:	00d62223          	sw	a3,4(a2)
    156c:	0015f593          	and	a1,a1,1
    1570:	00d60833          	add	a6,a2,a3
    1574:	0a059063          	bnez	a1,1614 <_free_r+0xf4>
    1578:	ff842303          	lw	t1,-8(s0)
    157c:	00482583          	lw	a1,4(a6)
    1580:	7ffff897          	auipc	a7,0x7ffff
    1584:	ba888893          	add	a7,a7,-1112 # 80000128 <__malloc_av_+0x8>
    1588:	40670733          	sub	a4,a4,t1
    158c:	00872803          	lw	a6,8(a4)
    1590:	006787b3          	add	a5,a5,t1
    1594:	0015f593          	and	a1,a1,1
    1598:	15180263          	beq	a6,a7,16dc <_free_r+0x1bc>
    159c:	00c72303          	lw	t1,12(a4)
    15a0:	00682623          	sw	t1,12(a6)
    15a4:	01032423          	sw	a6,8(t1)
    15a8:	1a058a63          	beqz	a1,175c <_free_r+0x23c>
    15ac:	0017e693          	or	a3,a5,1
    15b0:	00d72223          	sw	a3,4(a4)
    15b4:	00f62023          	sw	a5,0(a2)
    15b8:	1ff00693          	li	a3,511
    15bc:	06f6ec63          	bltu	a3,a5,1634 <_free_r+0x114>
    15c0:	ff87f693          	and	a3,a5,-8
    15c4:	00868693          	add	a3,a3,8
    15c8:	00452583          	lw	a1,4(a0)
    15cc:	00d506b3          	add	a3,a0,a3
    15d0:	0006a603          	lw	a2,0(a3)
    15d4:	0057d813          	srl	a6,a5,0x5
    15d8:	00100793          	li	a5,1
    15dc:	010797b3          	sll	a5,a5,a6
    15e0:	00b7e7b3          	or	a5,a5,a1
    15e4:	ff868593          	add	a1,a3,-8
    15e8:	00b72623          	sw	a1,12(a4)
    15ec:	00c72423          	sw	a2,8(a4)
    15f0:	00f52223          	sw	a5,4(a0)
    15f4:	00e6a023          	sw	a4,0(a3)
    15f8:	00e62623          	sw	a4,12(a2)
    15fc:	00812403          	lw	s0,8(sp)
    1600:	00c12083          	lw	ra,12(sp)
    1604:	00048513          	mv	a0,s1
    1608:	00412483          	lw	s1,4(sp)
    160c:	01010113          	add	sp,sp,16
    1610:	2090006f          	j	2018 <__malloc_unlock>
    1614:	00482583          	lw	a1,4(a6)
    1618:	0015f593          	and	a1,a1,1
    161c:	08058663          	beqz	a1,16a8 <_free_r+0x188>
    1620:	0017e693          	or	a3,a5,1
    1624:	fed42e23          	sw	a3,-4(s0)
    1628:	00f62023          	sw	a5,0(a2)
    162c:	1ff00693          	li	a3,511
    1630:	f8f6f8e3          	bgeu	a3,a5,15c0 <_free_r+0xa0>
    1634:	0097d693          	srl	a3,a5,0x9
    1638:	00400613          	li	a2,4
    163c:	12d66463          	bltu	a2,a3,1764 <_free_r+0x244>
    1640:	0067d693          	srl	a3,a5,0x6
    1644:	03968593          	add	a1,a3,57
    1648:	03868613          	add	a2,a3,56
    164c:	00359593          	sll	a1,a1,0x3
    1650:	00b505b3          	add	a1,a0,a1
    1654:	0005a683          	lw	a3,0(a1)
    1658:	ff858593          	add	a1,a1,-8
    165c:	00d59863          	bne	a1,a3,166c <_free_r+0x14c>
    1660:	15c0006f          	j	17bc <_free_r+0x29c>
    1664:	0086a683          	lw	a3,8(a3)
    1668:	00d58863          	beq	a1,a3,1678 <_free_r+0x158>
    166c:	0046a603          	lw	a2,4(a3)
    1670:	ffc67613          	and	a2,a2,-4
    1674:	fec7e8e3          	bltu	a5,a2,1664 <_free_r+0x144>
    1678:	00c6a583          	lw	a1,12(a3)
    167c:	00b72623          	sw	a1,12(a4)
    1680:	00d72423          	sw	a3,8(a4)
    1684:	00812403          	lw	s0,8(sp)
    1688:	00c12083          	lw	ra,12(sp)
    168c:	00e5a423          	sw	a4,8(a1)
    1690:	00048513          	mv	a0,s1
    1694:	00412483          	lw	s1,4(sp)
    1698:	00e6a623          	sw	a4,12(a3)
    169c:	01010113          	add	sp,sp,16
    16a0:	1790006f          	j	2018 <__malloc_unlock>
    16a4:	00008067          	ret
    16a8:	00d787b3          	add	a5,a5,a3
    16ac:	7ffff897          	auipc	a7,0x7ffff
    16b0:	a7c88893          	add	a7,a7,-1412 # 80000128 <__malloc_av_+0x8>
    16b4:	00862683          	lw	a3,8(a2)
    16b8:	0f168063          	beq	a3,a7,1798 <_free_r+0x278>
    16bc:	00c62803          	lw	a6,12(a2)
    16c0:	0017e593          	or	a1,a5,1
    16c4:	00f70633          	add	a2,a4,a5
    16c8:	0106a623          	sw	a6,12(a3)
    16cc:	00d82423          	sw	a3,8(a6)
    16d0:	00b72223          	sw	a1,4(a4)
    16d4:	00f62023          	sw	a5,0(a2)
    16d8:	ee1ff06f          	j	15b8 <_free_r+0x98>
    16dc:	14059063          	bnez	a1,181c <_free_r+0x2fc>
    16e0:	00862583          	lw	a1,8(a2)
    16e4:	00c62603          	lw	a2,12(a2)
    16e8:	00f686b3          	add	a3,a3,a5
    16ec:	0016e793          	or	a5,a3,1
    16f0:	00c5a623          	sw	a2,12(a1)
    16f4:	00b62423          	sw	a1,8(a2)
    16f8:	00f72223          	sw	a5,4(a4)
    16fc:	00d70733          	add	a4,a4,a3
    1700:	00d72023          	sw	a3,0(a4)
    1704:	ef9ff06f          	j	15fc <_free_r+0xdc>
    1708:	0015f593          	and	a1,a1,1
    170c:	00d786b3          	add	a3,a5,a3
    1710:	02059063          	bnez	a1,1730 <_free_r+0x210>
    1714:	ff842583          	lw	a1,-8(s0)
    1718:	40b70733          	sub	a4,a4,a1
    171c:	00c72783          	lw	a5,12(a4)
    1720:	00872603          	lw	a2,8(a4)
    1724:	00b686b3          	add	a3,a3,a1
    1728:	00f62623          	sw	a5,12(a2)
    172c:	00c7a423          	sw	a2,8(a5)
    1730:	0016e793          	or	a5,a3,1
    1734:	00f72223          	sw	a5,4(a4)
    1738:	00e52423          	sw	a4,8(a0)
    173c:	7ffff797          	auipc	a5,0x7ffff
    1740:	fdc7a783          	lw	a5,-36(a5) # 80000718 <__malloc_trim_threshold>
    1744:	eaf6ece3          	bltu	a3,a5,15fc <_free_r+0xdc>
    1748:	7ffff597          	auipc	a1,0x7ffff
    174c:	fec5a583          	lw	a1,-20(a1) # 80000734 <__malloc_top_pad>
    1750:	00048513          	mv	a0,s1
    1754:	c89ff0ef          	jal	13dc <_malloc_trim_r>
    1758:	ea5ff06f          	j	15fc <_free_r+0xdc>
    175c:	00d787b3          	add	a5,a5,a3
    1760:	f55ff06f          	j	16b4 <_free_r+0x194>
    1764:	01400613          	li	a2,20
    1768:	02d67063          	bgeu	a2,a3,1788 <_free_r+0x268>
    176c:	05400613          	li	a2,84
    1770:	06d66463          	bltu	a2,a3,17d8 <_free_r+0x2b8>
    1774:	00c7d693          	srl	a3,a5,0xc
    1778:	06f68593          	add	a1,a3,111
    177c:	06e68613          	add	a2,a3,110
    1780:	00359593          	sll	a1,a1,0x3
    1784:	ecdff06f          	j	1650 <_free_r+0x130>
    1788:	05c68593          	add	a1,a3,92
    178c:	05b68613          	add	a2,a3,91
    1790:	00359593          	sll	a1,a1,0x3
    1794:	ebdff06f          	j	1650 <_free_r+0x130>
    1798:	00e52a23          	sw	a4,20(a0)
    179c:	00e52823          	sw	a4,16(a0)
    17a0:	0017e693          	or	a3,a5,1
    17a4:	01172623          	sw	a7,12(a4)
    17a8:	01172423          	sw	a7,8(a4)
    17ac:	00d72223          	sw	a3,4(a4)
    17b0:	00f70733          	add	a4,a4,a5
    17b4:	00f72023          	sw	a5,0(a4)
    17b8:	e45ff06f          	j	15fc <_free_r+0xdc>
    17bc:	00452803          	lw	a6,4(a0)
    17c0:	40265613          	sra	a2,a2,0x2
    17c4:	00100793          	li	a5,1
    17c8:	00c797b3          	sll	a5,a5,a2
    17cc:	0107e7b3          	or	a5,a5,a6
    17d0:	00f52223          	sw	a5,4(a0)
    17d4:	ea9ff06f          	j	167c <_free_r+0x15c>
    17d8:	15400613          	li	a2,340
    17dc:	00d66c63          	bltu	a2,a3,17f4 <_free_r+0x2d4>
    17e0:	00f7d693          	srl	a3,a5,0xf
    17e4:	07868593          	add	a1,a3,120
    17e8:	07768613          	add	a2,a3,119
    17ec:	00359593          	sll	a1,a1,0x3
    17f0:	e61ff06f          	j	1650 <_free_r+0x130>
    17f4:	55400613          	li	a2,1364
    17f8:	00d66c63          	bltu	a2,a3,1810 <_free_r+0x2f0>
    17fc:	0127d693          	srl	a3,a5,0x12
    1800:	07d68593          	add	a1,a3,125
    1804:	07c68613          	add	a2,a3,124
    1808:	00359593          	sll	a1,a1,0x3
    180c:	e45ff06f          	j	1650 <_free_r+0x130>
    1810:	3f800593          	li	a1,1016
    1814:	07e00613          	li	a2,126
    1818:	e39ff06f          	j	1650 <_free_r+0x130>
    181c:	0017e693          	or	a3,a5,1
    1820:	00d72223          	sw	a3,4(a4)
    1824:	00f62023          	sw	a5,0(a2)
    1828:	dd5ff06f          	j	15fc <_free_r+0xdc>

0000182c <_malloc_r>:
    182c:	fd010113          	add	sp,sp,-48
    1830:	03212023          	sw	s2,32(sp)
    1834:	02112623          	sw	ra,44(sp)
    1838:	02812423          	sw	s0,40(sp)
    183c:	02912223          	sw	s1,36(sp)
    1840:	01312e23          	sw	s3,28(sp)
    1844:	00b58793          	add	a5,a1,11
    1848:	01600713          	li	a4,22
    184c:	00050913          	mv	s2,a0
    1850:	08f76263          	bltu	a4,a5,18d4 <_malloc_r+0xa8>
    1854:	01000793          	li	a5,16
    1858:	20b7e663          	bltu	a5,a1,1a64 <_malloc_r+0x238>
    185c:	7b0000ef          	jal	200c <__malloc_lock>
    1860:	01800793          	li	a5,24
    1864:	00200593          	li	a1,2
    1868:	01000493          	li	s1,16
    186c:	7ffff997          	auipc	s3,0x7ffff
    1870:	8b498993          	add	s3,s3,-1868 # 80000120 <__malloc_av_>
    1874:	00f987b3          	add	a5,s3,a5
    1878:	0047a403          	lw	s0,4(a5)
    187c:	ff878713          	add	a4,a5,-8
    1880:	36e40463          	beq	s0,a4,1be8 <_malloc_r+0x3bc>
    1884:	00442783          	lw	a5,4(s0)
    1888:	00c42683          	lw	a3,12(s0)
    188c:	00842603          	lw	a2,8(s0)
    1890:	ffc7f793          	and	a5,a5,-4
    1894:	00f407b3          	add	a5,s0,a5
    1898:	0047a703          	lw	a4,4(a5)
    189c:	00d62623          	sw	a3,12(a2)
    18a0:	00c6a423          	sw	a2,8(a3)
    18a4:	00176713          	or	a4,a4,1
    18a8:	00090513          	mv	a0,s2
    18ac:	00e7a223          	sw	a4,4(a5)
    18b0:	768000ef          	jal	2018 <__malloc_unlock>
    18b4:	00840513          	add	a0,s0,8
    18b8:	02c12083          	lw	ra,44(sp)
    18bc:	02812403          	lw	s0,40(sp)
    18c0:	02412483          	lw	s1,36(sp)
    18c4:	02012903          	lw	s2,32(sp)
    18c8:	01c12983          	lw	s3,28(sp)
    18cc:	03010113          	add	sp,sp,48
    18d0:	00008067          	ret
    18d4:	ff87f493          	and	s1,a5,-8
    18d8:	1807c663          	bltz	a5,1a64 <_malloc_r+0x238>
    18dc:	18b4e463          	bltu	s1,a1,1a64 <_malloc_r+0x238>
    18e0:	72c000ef          	jal	200c <__malloc_lock>
    18e4:	1f700793          	li	a5,503
    18e8:	4097fa63          	bgeu	a5,s1,1cfc <_malloc_r+0x4d0>
    18ec:	0094d793          	srl	a5,s1,0x9
    18f0:	18078263          	beqz	a5,1a74 <_malloc_r+0x248>
    18f4:	00400713          	li	a4,4
    18f8:	36f76063          	bltu	a4,a5,1c58 <_malloc_r+0x42c>
    18fc:	0064d793          	srl	a5,s1,0x6
    1900:	03978593          	add	a1,a5,57
    1904:	03878813          	add	a6,a5,56
    1908:	00359613          	sll	a2,a1,0x3
    190c:	7ffff997          	auipc	s3,0x7ffff
    1910:	81498993          	add	s3,s3,-2028 # 80000120 <__malloc_av_>
    1914:	00c98633          	add	a2,s3,a2
    1918:	00462403          	lw	s0,4(a2)
    191c:	ff860613          	add	a2,a2,-8
    1920:	02860863          	beq	a2,s0,1950 <_malloc_r+0x124>
    1924:	00f00513          	li	a0,15
    1928:	0140006f          	j	193c <_malloc_r+0x110>
    192c:	00c42683          	lw	a3,12(s0)
    1930:	2a075863          	bgez	a4,1be0 <_malloc_r+0x3b4>
    1934:	00d60e63          	beq	a2,a3,1950 <_malloc_r+0x124>
    1938:	00068413          	mv	s0,a3
    193c:	00442783          	lw	a5,4(s0)
    1940:	ffc7f793          	and	a5,a5,-4
    1944:	40978733          	sub	a4,a5,s1
    1948:	fee552e3          	bge	a0,a4,192c <_malloc_r+0x100>
    194c:	00080593          	mv	a1,a6
    1950:	0109a403          	lw	s0,16(s3)
    1954:	7fffe897          	auipc	a7,0x7fffe
    1958:	7d488893          	add	a7,a7,2004 # 80000128 <__malloc_av_+0x8>
    195c:	27140e63          	beq	s0,a7,1bd8 <_malloc_r+0x3ac>
    1960:	00442783          	lw	a5,4(s0)
    1964:	00f00693          	li	a3,15
    1968:	ffc7f793          	and	a5,a5,-4
    196c:	40978733          	sub	a4,a5,s1
    1970:	38e6cc63          	blt	a3,a4,1d08 <_malloc_r+0x4dc>
    1974:	0119aa23          	sw	a7,20(s3)
    1978:	0119a823          	sw	a7,16(s3)
    197c:	36075063          	bgez	a4,1cdc <_malloc_r+0x4b0>
    1980:	1ff00713          	li	a4,511
    1984:	0049a503          	lw	a0,4(s3)
    1988:	26f76863          	bltu	a4,a5,1bf8 <_malloc_r+0x3cc>
    198c:	ff87f713          	and	a4,a5,-8
    1990:	00870713          	add	a4,a4,8
    1994:	00e98733          	add	a4,s3,a4
    1998:	00072683          	lw	a3,0(a4)
    199c:	0057d613          	srl	a2,a5,0x5
    19a0:	00100793          	li	a5,1
    19a4:	00c797b3          	sll	a5,a5,a2
    19a8:	00f56533          	or	a0,a0,a5
    19ac:	ff870793          	add	a5,a4,-8
    19b0:	00f42623          	sw	a5,12(s0)
    19b4:	00d42423          	sw	a3,8(s0)
    19b8:	00a9a223          	sw	a0,4(s3)
    19bc:	00872023          	sw	s0,0(a4)
    19c0:	0086a623          	sw	s0,12(a3)
    19c4:	4025d793          	sra	a5,a1,0x2
    19c8:	00100613          	li	a2,1
    19cc:	00f61633          	sll	a2,a2,a5
    19d0:	0ac56a63          	bltu	a0,a2,1a84 <_malloc_r+0x258>
    19d4:	00a677b3          	and	a5,a2,a0
    19d8:	02079463          	bnez	a5,1a00 <_malloc_r+0x1d4>
    19dc:	00161613          	sll	a2,a2,0x1
    19e0:	ffc5f593          	and	a1,a1,-4
    19e4:	00a677b3          	and	a5,a2,a0
    19e8:	00458593          	add	a1,a1,4
    19ec:	00079a63          	bnez	a5,1a00 <_malloc_r+0x1d4>
    19f0:	00161613          	sll	a2,a2,0x1
    19f4:	00a677b3          	and	a5,a2,a0
    19f8:	00458593          	add	a1,a1,4
    19fc:	fe078ae3          	beqz	a5,19f0 <_malloc_r+0x1c4>
    1a00:	00f00813          	li	a6,15
    1a04:	00359313          	sll	t1,a1,0x3
    1a08:	00698333          	add	t1,s3,t1
    1a0c:	00030513          	mv	a0,t1
    1a10:	00c52783          	lw	a5,12(a0)
    1a14:	00058e13          	mv	t3,a1
    1a18:	26f50263          	beq	a0,a5,1c7c <_malloc_r+0x450>
    1a1c:	0047a703          	lw	a4,4(a5)
    1a20:	00078413          	mv	s0,a5
    1a24:	00c7a783          	lw	a5,12(a5)
    1a28:	ffc77713          	and	a4,a4,-4
    1a2c:	409706b3          	sub	a3,a4,s1
    1a30:	26d84263          	blt	a6,a3,1c94 <_malloc_r+0x468>
    1a34:	fe06c2e3          	bltz	a3,1a18 <_malloc_r+0x1ec>
    1a38:	00e40733          	add	a4,s0,a4
    1a3c:	00472683          	lw	a3,4(a4)
    1a40:	00842603          	lw	a2,8(s0)
    1a44:	00090513          	mv	a0,s2
    1a48:	0016e693          	or	a3,a3,1
    1a4c:	00d72223          	sw	a3,4(a4)
    1a50:	00f62623          	sw	a5,12(a2)
    1a54:	00c7a423          	sw	a2,8(a5)
    1a58:	5c0000ef          	jal	2018 <__malloc_unlock>
    1a5c:	00840513          	add	a0,s0,8
    1a60:	e59ff06f          	j	18b8 <_malloc_r+0x8c>
    1a64:	00c00793          	li	a5,12
    1a68:	00f92023          	sw	a5,0(s2)
    1a6c:	00000513          	li	a0,0
    1a70:	e49ff06f          	j	18b8 <_malloc_r+0x8c>
    1a74:	20000613          	li	a2,512
    1a78:	04000593          	li	a1,64
    1a7c:	03f00813          	li	a6,63
    1a80:	e8dff06f          	j	190c <_malloc_r+0xe0>
    1a84:	0089a403          	lw	s0,8(s3)
    1a88:	01612823          	sw	s6,16(sp)
    1a8c:	00442783          	lw	a5,4(s0)
    1a90:	ffc7fb13          	and	s6,a5,-4
    1a94:	009b6863          	bltu	s6,s1,1aa4 <_malloc_r+0x278>
    1a98:	409b0733          	sub	a4,s6,s1
    1a9c:	00f00793          	li	a5,15
    1aa0:	0ee7ca63          	blt	a5,a4,1b94 <_malloc_r+0x368>
    1aa4:	01912223          	sw	s9,4(sp)
    1aa8:	7ffffc97          	auipc	s9,0x7ffff
    1aac:	c6cc8c93          	add	s9,s9,-916 # 80000714 <__malloc_sbrk_base>
    1ab0:	000ca703          	lw	a4,0(s9)
    1ab4:	01412c23          	sw	s4,24(sp)
    1ab8:	01512a23          	sw	s5,20(sp)
    1abc:	01712623          	sw	s7,12(sp)
    1ac0:	7ffffa97          	auipc	s5,0x7ffff
    1ac4:	c74aaa83          	lw	s5,-908(s5) # 80000734 <__malloc_top_pad>
    1ac8:	fff00793          	li	a5,-1
    1acc:	01640a33          	add	s4,s0,s6
    1ad0:	01548ab3          	add	s5,s1,s5
    1ad4:	3ef70263          	beq	a4,a5,1eb8 <_malloc_r+0x68c>
    1ad8:	000017b7          	lui	a5,0x1
    1adc:	00f78793          	add	a5,a5,15 # 100f <_puts_r+0x8b>
    1ae0:	00fa8ab3          	add	s5,s5,a5
    1ae4:	fffff7b7          	lui	a5,0xfffff
    1ae8:	00fafab3          	and	s5,s5,a5
    1aec:	000a8593          	mv	a1,s5
    1af0:	00090513          	mv	a0,s2
    1af4:	254060ef          	jal	7d48 <_sbrk_r>
    1af8:	fff00793          	li	a5,-1
    1afc:	00050b93          	mv	s7,a0
    1b00:	46f50663          	beq	a0,a5,1f6c <_malloc_r+0x740>
    1b04:	01812423          	sw	s8,8(sp)
    1b08:	25456863          	bltu	a0,s4,1d58 <_malloc_r+0x52c>
    1b0c:	7ffffc17          	auipc	s8,0x7ffff
    1b10:	c50c0c13          	add	s8,s8,-944 # 8000075c <__malloc_current_mallinfo>
    1b14:	000c2583          	lw	a1,0(s8)
    1b18:	00ba85b3          	add	a1,s5,a1
    1b1c:	00bc2023          	sw	a1,0(s8)
    1b20:	00058713          	mv	a4,a1
    1b24:	2caa1063          	bne	s4,a0,1de4 <_malloc_r+0x5b8>
    1b28:	01451793          	sll	a5,a0,0x14
    1b2c:	2a079c63          	bnez	a5,1de4 <_malloc_r+0x5b8>
    1b30:	0089ab83          	lw	s7,8(s3)
    1b34:	015b07b3          	add	a5,s6,s5
    1b38:	0017e793          	or	a5,a5,1
    1b3c:	00fba223          	sw	a5,4(s7)
    1b40:	7ffff717          	auipc	a4,0x7ffff
    1b44:	bf070713          	add	a4,a4,-1040 # 80000730 <__malloc_max_sbrked_mem>
    1b48:	00072683          	lw	a3,0(a4)
    1b4c:	00b6f463          	bgeu	a3,a1,1b54 <_malloc_r+0x328>
    1b50:	00b72023          	sw	a1,0(a4)
    1b54:	7ffff717          	auipc	a4,0x7ffff
    1b58:	bd870713          	add	a4,a4,-1064 # 8000072c <__malloc_max_total_mem>
    1b5c:	00072683          	lw	a3,0(a4)
    1b60:	00b6f463          	bgeu	a3,a1,1b68 <_malloc_r+0x33c>
    1b64:	00b72023          	sw	a1,0(a4)
    1b68:	00812c03          	lw	s8,8(sp)
    1b6c:	000b8413          	mv	s0,s7
    1b70:	ffc7f793          	and	a5,a5,-4
    1b74:	40978733          	sub	a4,a5,s1
    1b78:	3897ec63          	bltu	a5,s1,1f10 <_malloc_r+0x6e4>
    1b7c:	00f00793          	li	a5,15
    1b80:	38e7d863          	bge	a5,a4,1f10 <_malloc_r+0x6e4>
    1b84:	01812a03          	lw	s4,24(sp)
    1b88:	01412a83          	lw	s5,20(sp)
    1b8c:	00c12b83          	lw	s7,12(sp)
    1b90:	00412c83          	lw	s9,4(sp)
    1b94:	0014e793          	or	a5,s1,1
    1b98:	00f42223          	sw	a5,4(s0)
    1b9c:	009404b3          	add	s1,s0,s1
    1ba0:	0099a423          	sw	s1,8(s3)
    1ba4:	00176713          	or	a4,a4,1
    1ba8:	00090513          	mv	a0,s2
    1bac:	00e4a223          	sw	a4,4(s1)
    1bb0:	468000ef          	jal	2018 <__malloc_unlock>
    1bb4:	02c12083          	lw	ra,44(sp)
    1bb8:	00840513          	add	a0,s0,8
    1bbc:	02812403          	lw	s0,40(sp)
    1bc0:	01012b03          	lw	s6,16(sp)
    1bc4:	02412483          	lw	s1,36(sp)
    1bc8:	02012903          	lw	s2,32(sp)
    1bcc:	01c12983          	lw	s3,28(sp)
    1bd0:	03010113          	add	sp,sp,48
    1bd4:	00008067          	ret
    1bd8:	0049a503          	lw	a0,4(s3)
    1bdc:	de9ff06f          	j	19c4 <_malloc_r+0x198>
    1be0:	00842603          	lw	a2,8(s0)
    1be4:	cb1ff06f          	j	1894 <_malloc_r+0x68>
    1be8:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1bec:	00258593          	add	a1,a1,2
    1bf0:	d68780e3          	beq	a5,s0,1950 <_malloc_r+0x124>
    1bf4:	c91ff06f          	j	1884 <_malloc_r+0x58>
    1bf8:	0097d713          	srl	a4,a5,0x9
    1bfc:	00400693          	li	a3,4
    1c00:	14e6f263          	bgeu	a3,a4,1d44 <_malloc_r+0x518>
    1c04:	01400693          	li	a3,20
    1c08:	32e6e663          	bltu	a3,a4,1f34 <_malloc_r+0x708>
    1c0c:	05c70613          	add	a2,a4,92
    1c10:	05b70693          	add	a3,a4,91
    1c14:	00361613          	sll	a2,a2,0x3
    1c18:	00c98633          	add	a2,s3,a2
    1c1c:	00062703          	lw	a4,0(a2)
    1c20:	ff860613          	add	a2,a2,-8
    1c24:	00e61863          	bne	a2,a4,1c34 <_malloc_r+0x408>
    1c28:	2980006f          	j	1ec0 <_malloc_r+0x694>
    1c2c:	00872703          	lw	a4,8(a4)
    1c30:	00e60863          	beq	a2,a4,1c40 <_malloc_r+0x414>
    1c34:	00472683          	lw	a3,4(a4)
    1c38:	ffc6f693          	and	a3,a3,-4
    1c3c:	fed7e8e3          	bltu	a5,a3,1c2c <_malloc_r+0x400>
    1c40:	00c72603          	lw	a2,12(a4)
    1c44:	00c42623          	sw	a2,12(s0)
    1c48:	00e42423          	sw	a4,8(s0)
    1c4c:	00862423          	sw	s0,8(a2)
    1c50:	00872623          	sw	s0,12(a4)
    1c54:	d71ff06f          	j	19c4 <_malloc_r+0x198>
    1c58:	01400713          	li	a4,20
    1c5c:	10f77863          	bgeu	a4,a5,1d6c <_malloc_r+0x540>
    1c60:	05400713          	li	a4,84
    1c64:	2ef76663          	bltu	a4,a5,1f50 <_malloc_r+0x724>
    1c68:	00c4d793          	srl	a5,s1,0xc
    1c6c:	06f78593          	add	a1,a5,111
    1c70:	06e78813          	add	a6,a5,110
    1c74:	00359613          	sll	a2,a1,0x3
    1c78:	c95ff06f          	j	190c <_malloc_r+0xe0>
    1c7c:	001e0e13          	add	t3,t3,1
    1c80:	003e7793          	and	a5,t3,3
    1c84:	00850513          	add	a0,a0,8
    1c88:	10078063          	beqz	a5,1d88 <_malloc_r+0x55c>
    1c8c:	00c52783          	lw	a5,12(a0)
    1c90:	d89ff06f          	j	1a18 <_malloc_r+0x1ec>
    1c94:	00842603          	lw	a2,8(s0)
    1c98:	0014e593          	or	a1,s1,1
    1c9c:	00b42223          	sw	a1,4(s0)
    1ca0:	00f62623          	sw	a5,12(a2)
    1ca4:	00c7a423          	sw	a2,8(a5)
    1ca8:	009404b3          	add	s1,s0,s1
    1cac:	0099aa23          	sw	s1,20(s3)
    1cb0:	0099a823          	sw	s1,16(s3)
    1cb4:	0016e793          	or	a5,a3,1
    1cb8:	0114a623          	sw	a7,12(s1)
    1cbc:	0114a423          	sw	a7,8(s1)
    1cc0:	00f4a223          	sw	a5,4(s1)
    1cc4:	00e40733          	add	a4,s0,a4
    1cc8:	00090513          	mv	a0,s2
    1ccc:	00d72023          	sw	a3,0(a4)
    1cd0:	348000ef          	jal	2018 <__malloc_unlock>
    1cd4:	00840513          	add	a0,s0,8
    1cd8:	be1ff06f          	j	18b8 <_malloc_r+0x8c>
    1cdc:	00f407b3          	add	a5,s0,a5
    1ce0:	0047a703          	lw	a4,4(a5)
    1ce4:	00090513          	mv	a0,s2
    1ce8:	00176713          	or	a4,a4,1
    1cec:	00e7a223          	sw	a4,4(a5)
    1cf0:	328000ef          	jal	2018 <__malloc_unlock>
    1cf4:	00840513          	add	a0,s0,8
    1cf8:	bc1ff06f          	j	18b8 <_malloc_r+0x8c>
    1cfc:	0034d593          	srl	a1,s1,0x3
    1d00:	00848793          	add	a5,s1,8
    1d04:	b69ff06f          	j	186c <_malloc_r+0x40>
    1d08:	0014e693          	or	a3,s1,1
    1d0c:	00d42223          	sw	a3,4(s0)
    1d10:	009404b3          	add	s1,s0,s1
    1d14:	0099aa23          	sw	s1,20(s3)
    1d18:	0099a823          	sw	s1,16(s3)
    1d1c:	00176693          	or	a3,a4,1
    1d20:	0114a623          	sw	a7,12(s1)
    1d24:	0114a423          	sw	a7,8(s1)
    1d28:	00d4a223          	sw	a3,4(s1)
    1d2c:	00f407b3          	add	a5,s0,a5
    1d30:	00090513          	mv	a0,s2
    1d34:	00e7a023          	sw	a4,0(a5)
    1d38:	2e0000ef          	jal	2018 <__malloc_unlock>
    1d3c:	00840513          	add	a0,s0,8
    1d40:	b79ff06f          	j	18b8 <_malloc_r+0x8c>
    1d44:	0067d713          	srl	a4,a5,0x6
    1d48:	03970613          	add	a2,a4,57
    1d4c:	03870693          	add	a3,a4,56
    1d50:	00361613          	sll	a2,a2,0x3
    1d54:	ec5ff06f          	j	1c18 <_malloc_r+0x3ec>
    1d58:	07340c63          	beq	s0,s3,1dd0 <_malloc_r+0x5a4>
    1d5c:	0089a403          	lw	s0,8(s3)
    1d60:	00812c03          	lw	s8,8(sp)
    1d64:	00442783          	lw	a5,4(s0)
    1d68:	e09ff06f          	j	1b70 <_malloc_r+0x344>
    1d6c:	05c78593          	add	a1,a5,92
    1d70:	05b78813          	add	a6,a5,91
    1d74:	00359613          	sll	a2,a1,0x3
    1d78:	b95ff06f          	j	190c <_malloc_r+0xe0>
    1d7c:	00832783          	lw	a5,8(t1)
    1d80:	fff58593          	add	a1,a1,-1
    1d84:	28679063          	bne	a5,t1,2004 <_malloc_r+0x7d8>
    1d88:	0035f793          	and	a5,a1,3
    1d8c:	ff830313          	add	t1,t1,-8
    1d90:	fe0796e3          	bnez	a5,1d7c <_malloc_r+0x550>
    1d94:	0049a703          	lw	a4,4(s3)
    1d98:	fff64793          	not	a5,a2
    1d9c:	00e7f7b3          	and	a5,a5,a4
    1da0:	00f9a223          	sw	a5,4(s3)
    1da4:	00161613          	sll	a2,a2,0x1
    1da8:	ccc7eee3          	bltu	a5,a2,1a84 <_malloc_r+0x258>
    1dac:	cc060ce3          	beqz	a2,1a84 <_malloc_r+0x258>
    1db0:	00f67733          	and	a4,a2,a5
    1db4:	00071a63          	bnez	a4,1dc8 <_malloc_r+0x59c>
    1db8:	00161613          	sll	a2,a2,0x1
    1dbc:	00f67733          	and	a4,a2,a5
    1dc0:	004e0e13          	add	t3,t3,4
    1dc4:	fe070ae3          	beqz	a4,1db8 <_malloc_r+0x58c>
    1dc8:	000e0593          	mv	a1,t3
    1dcc:	c39ff06f          	j	1a04 <_malloc_r+0x1d8>
    1dd0:	7ffffc17          	auipc	s8,0x7ffff
    1dd4:	98cc0c13          	add	s8,s8,-1652 # 8000075c <__malloc_current_mallinfo>
    1dd8:	000c2703          	lw	a4,0(s8)
    1ddc:	00ea8733          	add	a4,s5,a4
    1de0:	00ec2023          	sw	a4,0(s8)
    1de4:	000ca683          	lw	a3,0(s9)
    1de8:	fff00793          	li	a5,-1
    1dec:	18f68663          	beq	a3,a5,1f78 <_malloc_r+0x74c>
    1df0:	414b87b3          	sub	a5,s7,s4
    1df4:	00e787b3          	add	a5,a5,a4
    1df8:	00fc2023          	sw	a5,0(s8)
    1dfc:	007bfc93          	and	s9,s7,7
    1e00:	0c0c8c63          	beqz	s9,1ed8 <_malloc_r+0x6ac>
    1e04:	419b8bb3          	sub	s7,s7,s9
    1e08:	000017b7          	lui	a5,0x1
    1e0c:	00878793          	add	a5,a5,8 # 1008 <_puts_r+0x84>
    1e10:	008b8b93          	add	s7,s7,8
    1e14:	419785b3          	sub	a1,a5,s9
    1e18:	015b8ab3          	add	s5,s7,s5
    1e1c:	415585b3          	sub	a1,a1,s5
    1e20:	01459593          	sll	a1,a1,0x14
    1e24:	0145da13          	srl	s4,a1,0x14
    1e28:	000a0593          	mv	a1,s4
    1e2c:	00090513          	mv	a0,s2
    1e30:	719050ef          	jal	7d48 <_sbrk_r>
    1e34:	fff00793          	li	a5,-1
    1e38:	18f50063          	beq	a0,a5,1fb8 <_malloc_r+0x78c>
    1e3c:	41750533          	sub	a0,a0,s7
    1e40:	01450ab3          	add	s5,a0,s4
    1e44:	000c2703          	lw	a4,0(s8)
    1e48:	0179a423          	sw	s7,8(s3)
    1e4c:	001ae793          	or	a5,s5,1
    1e50:	00ea05b3          	add	a1,s4,a4
    1e54:	00bc2023          	sw	a1,0(s8)
    1e58:	00fba223          	sw	a5,4(s7)
    1e5c:	cf3402e3          	beq	s0,s3,1b40 <_malloc_r+0x314>
    1e60:	00f00693          	li	a3,15
    1e64:	0b66f063          	bgeu	a3,s6,1f04 <_malloc_r+0x6d8>
    1e68:	00442703          	lw	a4,4(s0)
    1e6c:	ff4b0793          	add	a5,s6,-12
    1e70:	ff87f793          	and	a5,a5,-8
    1e74:	00177713          	and	a4,a4,1
    1e78:	00f76733          	or	a4,a4,a5
    1e7c:	00e42223          	sw	a4,4(s0)
    1e80:	00500613          	li	a2,5
    1e84:	00f40733          	add	a4,s0,a5
    1e88:	00c72223          	sw	a2,4(a4)
    1e8c:	00c72423          	sw	a2,8(a4)
    1e90:	00f6e663          	bltu	a3,a5,1e9c <_malloc_r+0x670>
    1e94:	004ba783          	lw	a5,4(s7)
    1e98:	ca9ff06f          	j	1b40 <_malloc_r+0x314>
    1e9c:	00840593          	add	a1,s0,8
    1ea0:	00090513          	mv	a0,s2
    1ea4:	e7cff0ef          	jal	1520 <_free_r>
    1ea8:	0089ab83          	lw	s7,8(s3)
    1eac:	000c2583          	lw	a1,0(s8)
    1eb0:	004ba783          	lw	a5,4(s7)
    1eb4:	c8dff06f          	j	1b40 <_malloc_r+0x314>
    1eb8:	010a8a93          	add	s5,s5,16
    1ebc:	c31ff06f          	j	1aec <_malloc_r+0x2c0>
    1ec0:	4026d693          	sra	a3,a3,0x2
    1ec4:	00100793          	li	a5,1
    1ec8:	00d797b3          	sll	a5,a5,a3
    1ecc:	00f56533          	or	a0,a0,a5
    1ed0:	00a9a223          	sw	a0,4(s3)
    1ed4:	d71ff06f          	j	1c44 <_malloc_r+0x418>
    1ed8:	015b85b3          	add	a1,s7,s5
    1edc:	40b005b3          	neg	a1,a1
    1ee0:	01459593          	sll	a1,a1,0x14
    1ee4:	0145da13          	srl	s4,a1,0x14
    1ee8:	000a0593          	mv	a1,s4
    1eec:	00090513          	mv	a0,s2
    1ef0:	659050ef          	jal	7d48 <_sbrk_r>
    1ef4:	fff00793          	li	a5,-1
    1ef8:	f4f512e3          	bne	a0,a5,1e3c <_malloc_r+0x610>
    1efc:	00000a13          	li	s4,0
    1f00:	f45ff06f          	j	1e44 <_malloc_r+0x618>
    1f04:	00812c03          	lw	s8,8(sp)
    1f08:	00100793          	li	a5,1
    1f0c:	00fba223          	sw	a5,4(s7)
    1f10:	00090513          	mv	a0,s2
    1f14:	104000ef          	jal	2018 <__malloc_unlock>
    1f18:	00000513          	li	a0,0
    1f1c:	01812a03          	lw	s4,24(sp)
    1f20:	01412a83          	lw	s5,20(sp)
    1f24:	01012b03          	lw	s6,16(sp)
    1f28:	00c12b83          	lw	s7,12(sp)
    1f2c:	00412c83          	lw	s9,4(sp)
    1f30:	989ff06f          	j	18b8 <_malloc_r+0x8c>
    1f34:	05400693          	li	a3,84
    1f38:	04e6e463          	bltu	a3,a4,1f80 <_malloc_r+0x754>
    1f3c:	00c7d713          	srl	a4,a5,0xc
    1f40:	06f70613          	add	a2,a4,111
    1f44:	06e70693          	add	a3,a4,110
    1f48:	00361613          	sll	a2,a2,0x3
    1f4c:	ccdff06f          	j	1c18 <_malloc_r+0x3ec>
    1f50:	15400713          	li	a4,340
    1f54:	04f76463          	bltu	a4,a5,1f9c <_malloc_r+0x770>
    1f58:	00f4d793          	srl	a5,s1,0xf
    1f5c:	07878593          	add	a1,a5,120
    1f60:	07778813          	add	a6,a5,119
    1f64:	00359613          	sll	a2,a1,0x3
    1f68:	9a5ff06f          	j	190c <_malloc_r+0xe0>
    1f6c:	0089a403          	lw	s0,8(s3)
    1f70:	00442783          	lw	a5,4(s0)
    1f74:	bfdff06f          	j	1b70 <_malloc_r+0x344>
    1f78:	017ca023          	sw	s7,0(s9)
    1f7c:	e81ff06f          	j	1dfc <_malloc_r+0x5d0>
    1f80:	15400693          	li	a3,340
    1f84:	04e6e463          	bltu	a3,a4,1fcc <_malloc_r+0x7a0>
    1f88:	00f7d713          	srl	a4,a5,0xf
    1f8c:	07870613          	add	a2,a4,120
    1f90:	07770693          	add	a3,a4,119
    1f94:	00361613          	sll	a2,a2,0x3
    1f98:	c81ff06f          	j	1c18 <_malloc_r+0x3ec>
    1f9c:	55400713          	li	a4,1364
    1fa0:	04f76463          	bltu	a4,a5,1fe8 <_malloc_r+0x7bc>
    1fa4:	0124d793          	srl	a5,s1,0x12
    1fa8:	07d78593          	add	a1,a5,125
    1fac:	07c78813          	add	a6,a5,124
    1fb0:	00359613          	sll	a2,a1,0x3
    1fb4:	959ff06f          	j	190c <_malloc_r+0xe0>
    1fb8:	ff8c8c93          	add	s9,s9,-8
    1fbc:	019a8ab3          	add	s5,s5,s9
    1fc0:	417a8ab3          	sub	s5,s5,s7
    1fc4:	00000a13          	li	s4,0
    1fc8:	e7dff06f          	j	1e44 <_malloc_r+0x618>
    1fcc:	55400693          	li	a3,1364
    1fd0:	02e6e463          	bltu	a3,a4,1ff8 <_malloc_r+0x7cc>
    1fd4:	0127d713          	srl	a4,a5,0x12
    1fd8:	07d70613          	add	a2,a4,125
    1fdc:	07c70693          	add	a3,a4,124
    1fe0:	00361613          	sll	a2,a2,0x3
    1fe4:	c35ff06f          	j	1c18 <_malloc_r+0x3ec>
    1fe8:	3f800613          	li	a2,1016
    1fec:	07f00593          	li	a1,127
    1ff0:	07e00813          	li	a6,126
    1ff4:	919ff06f          	j	190c <_malloc_r+0xe0>
    1ff8:	3f800613          	li	a2,1016
    1ffc:	07e00693          	li	a3,126
    2000:	c19ff06f          	j	1c18 <_malloc_r+0x3ec>
    2004:	0049a783          	lw	a5,4(s3)
    2008:	d9dff06f          	j	1da4 <_malloc_r+0x578>

0000200c <__malloc_lock>:
    200c:	7fffe517          	auipc	a0,0x7fffe
    2010:	71850513          	add	a0,a0,1816 # 80000724 <__lock___malloc_recursive_mutex>
    2014:	8b4ff06f          	j	10c8 <__retarget_lock_acquire_recursive>

00002018 <__malloc_unlock>:
    2018:	7fffe517          	auipc	a0,0x7fffe
    201c:	70c50513          	add	a0,a0,1804 # 80000724 <__lock___malloc_recursive_mutex>
    2020:	8acff06f          	j	10cc <__retarget_lock_release_recursive>

00002024 <_vfprintf_r>:
    2024:	e7010113          	add	sp,sp,-400
    2028:	18112623          	sw	ra,396(sp)
    202c:	00b12423          	sw	a1,8(sp)
    2030:	00c12623          	sw	a2,12(sp)
    2034:	00d12a23          	sw	a3,20(sp)
    2038:	17312e23          	sw	s3,380(sp)
    203c:	18812423          	sw	s0,392(sp)
    2040:	00050993          	mv	s3,a0
    2044:	3d9050ef          	jal	7c1c <_localeconv_r>
    2048:	00052783          	lw	a5,0(a0)
    204c:	00078513          	mv	a0,a5
    2050:	02f12a23          	sw	a5,52(sp)
    2054:	afcff0ef          	jal	1350 <strlen>
    2058:	00050713          	mv	a4,a0
    205c:	00800613          	li	a2,8
    2060:	00000593          	li	a1,0
    2064:	09010513          	add	a0,sp,144
    2068:	02e12823          	sw	a4,48(sp)
    206c:	864ff0ef          	jal	10d0 <memset>
    2070:	00c12783          	lw	a5,12(sp)
    2074:	00098863          	beqz	s3,2084 <_vfprintf_r+0x60>
    2078:	0349a703          	lw	a4,52(s3)
    207c:	00071463          	bnez	a4,2084 <_vfprintf_r+0x60>
    2080:	29d0106f          	j	3b1c <_vfprintf_r+0x1af8>
    2084:	00812703          	lw	a4,8(sp)
    2088:	06472683          	lw	a3,100(a4)
    208c:	00c71703          	lh	a4,12(a4)
    2090:	0016f693          	and	a3,a3,1
    2094:	00069863          	bnez	a3,20a4 <_vfprintf_r+0x80>
    2098:	20077693          	and	a3,a4,512
    209c:	00069463          	bnez	a3,20a4 <_vfprintf_r+0x80>
    20a0:	3ec0106f          	j	348c <_vfprintf_r+0x1468>
    20a4:	01271693          	sll	a3,a4,0x12
    20a8:	0206c863          	bltz	a3,20d8 <_vfprintf_r+0xb4>
    20ac:	00812503          	lw	a0,8(sp)
    20b0:	000025b7          	lui	a1,0x2
    20b4:	ffffe637          	lui	a2,0xffffe
    20b8:	06452683          	lw	a3,100(a0)
    20bc:	00b76733          	or	a4,a4,a1
    20c0:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    20c4:	01071713          	sll	a4,a4,0x10
    20c8:	41075713          	sra	a4,a4,0x10
    20cc:	00c6f6b3          	and	a3,a3,a2
    20d0:	00e51623          	sh	a4,12(a0)
    20d4:	06d52223          	sw	a3,100(a0)
    20d8:	00877693          	and	a3,a4,8
    20dc:	2a068063          	beqz	a3,237c <_vfprintf_r+0x358>
    20e0:	00812683          	lw	a3,8(sp)
    20e4:	0106a683          	lw	a3,16(a3)
    20e8:	28068a63          	beqz	a3,237c <_vfprintf_r+0x358>
    20ec:	01a77693          	and	a3,a4,26
    20f0:	00a00613          	li	a2,10
    20f4:	2ac68c63          	beq	a3,a2,23ac <_vfprintf_r+0x388>
    20f8:	0ac10713          	add	a4,sp,172
    20fc:	17512a23          	sw	s5,372(sp)
    2100:	17812423          	sw	s8,360(sp)
    2104:	15b12e23          	sw	s11,348(sp)
    2108:	18912223          	sw	s1,388(sp)
    210c:	19212023          	sw	s2,384(sp)
    2110:	17412c23          	sw	s4,376(sp)
    2114:	17612823          	sw	s6,368(sp)
    2118:	17712623          	sw	s7,364(sp)
    211c:	17912223          	sw	s9,356(sp)
    2120:	17a12023          	sw	s10,352(sp)
    2124:	0ae12023          	sw	a4,160(sp)
    2128:	0a012423          	sw	zero,168(sp)
    212c:	0a012223          	sw	zero,164(sp)
    2130:	00012c23          	sw	zero,24(sp)
    2134:	02012423          	sw	zero,40(sp)
    2138:	02012623          	sw	zero,44(sp)
    213c:	00070413          	mv	s0,a4
    2140:	02012c23          	sw	zero,56(sp)
    2144:	04012023          	sw	zero,64(sp)
    2148:	02012e23          	sw	zero,60(sp)
    214c:	04012623          	sw	zero,76(sp)
    2150:	04012423          	sw	zero,72(sp)
    2154:	00012623          	sw	zero,12(sp)
    2158:	7fffea97          	auipc	s5,0x7fffe
    215c:	3dca8a93          	add	s5,s5,988 # 80000534 <__global_locale>
    2160:	02500d93          	li	s11,37
    2164:	00078c13          	mv	s8,a5
    2168:	000c0913          	mv	s2,s8
    216c:	0e4aa483          	lw	s1,228(s5)
    2170:	2a1050ef          	jal	7c10 <__locale_mb_cur_max>
    2174:	00050693          	mv	a3,a0
    2178:	09010713          	add	a4,sp,144
    217c:	00090613          	mv	a2,s2
    2180:	08010593          	add	a1,sp,128
    2184:	00098513          	mv	a0,s3
    2188:	000480e7          	jalr	s1
    218c:	2c050a63          	beqz	a0,2460 <_vfprintf_r+0x43c>
    2190:	2a054a63          	bltz	a0,2444 <_vfprintf_r+0x420>
    2194:	08012783          	lw	a5,128(sp)
    2198:	01b78663          	beq	a5,s11,21a4 <_vfprintf_r+0x180>
    219c:	00a90933          	add	s2,s2,a0
    21a0:	fcdff06f          	j	216c <_vfprintf_r+0x148>
    21a4:	00050493          	mv	s1,a0
    21a8:	41890cb3          	sub	s9,s2,s8
    21ac:	2d891063          	bne	s2,s8,246c <_vfprintf_r+0x448>
    21b0:	fff00313          	li	t1,-1
    21b4:	00000e93          	li	t4,0
    21b8:	00194e03          	lbu	t3,1(s2)
    21bc:	06010ba3          	sb	zero,119(sp)
    21c0:	00190913          	add	s2,s2,1
    21c4:	00000b93          	li	s7,0
    21c8:	05a00493          	li	s1,90
    21cc:	000e8a13          	mv	s4,t4
    21d0:	00030b13          	mv	s6,t1
    21d4:	00190913          	add	s2,s2,1
    21d8:	fe0e0793          	add	a5,t3,-32
    21dc:	04f4ea63          	bltu	s1,a5,2230 <_vfprintf_r+0x20c>
    21e0:	0000d717          	auipc	a4,0xd
    21e4:	42070713          	add	a4,a4,1056 # f600 <_ctype_+0x104>
    21e8:	00279793          	sll	a5,a5,0x2
    21ec:	00e787b3          	add	a5,a5,a4
    21f0:	0007a783          	lw	a5,0(a5)
    21f4:	00e787b3          	add	a5,a5,a4
    21f8:	00078067          	jr	a5
    21fc:	00000b93          	li	s7,0
    2200:	fd0e0713          	add	a4,t3,-48
    2204:	00900693          	li	a3,9
    2208:	00094e03          	lbu	t3,0(s2)
    220c:	002b9793          	sll	a5,s7,0x2
    2210:	017787b3          	add	a5,a5,s7
    2214:	00179793          	sll	a5,a5,0x1
    2218:	00f70bb3          	add	s7,a4,a5
    221c:	fd0e0713          	add	a4,t3,-48
    2220:	00190913          	add	s2,s2,1
    2224:	fee6f2e3          	bgeu	a3,a4,2208 <_vfprintf_r+0x1e4>
    2228:	fe0e0793          	add	a5,t3,-32
    222c:	faf4fae3          	bgeu	s1,a5,21e0 <_vfprintf_r+0x1bc>
    2230:	000a0e93          	mv	t4,s4
    2234:	260e0a63          	beqz	t3,24a8 <_vfprintf_r+0x484>
    2238:	0fc10623          	sb	t3,236(sp)
    223c:	06010ba3          	sb	zero,119(sp)
    2240:	00100c93          	li	s9,1
    2244:	00000613          	li	a2,0
    2248:	00012823          	sw	zero,16(sp)
    224c:	00100d13          	li	s10,1
    2250:	00000313          	li	t1,0
    2254:	02012223          	sw	zero,36(sp)
    2258:	02012023          	sw	zero,32(sp)
    225c:	00000a13          	li	s4,0
    2260:	0ec10c13          	add	s8,sp,236
    2264:	002ef293          	and	t0,t4,2
    2268:	00028463          	beqz	t0,2270 <_vfprintf_r+0x24c>
    226c:	002c8c93          	add	s9,s9,2
    2270:	084eff93          	and	t6,t4,132
    2274:	0a812483          	lw	s1,168(sp)
    2278:	000f9663          	bnez	t6,2284 <_vfprintf_r+0x260>
    227c:	419b8733          	sub	a4,s7,s9
    2280:	40e04663          	bgtz	a4,268c <_vfprintf_r+0x668>
    2284:	02060a63          	beqz	a2,22b8 <_vfprintf_r+0x294>
    2288:	0a412703          	lw	a4,164(sp)
    228c:	07710613          	add	a2,sp,119
    2290:	00148493          	add	s1,s1,1
    2294:	00170713          	add	a4,a4,1
    2298:	00100793          	li	a5,1
    229c:	00c42023          	sw	a2,0(s0)
    22a0:	00f42223          	sw	a5,4(s0)
    22a4:	0a912423          	sw	s1,168(sp)
    22a8:	0ae12223          	sw	a4,164(sp)
    22ac:	00700613          	li	a2,7
    22b0:	00840413          	add	s0,s0,8
    22b4:	4ce64863          	blt	a2,a4,2784 <_vfprintf_r+0x760>
    22b8:	02028a63          	beqz	t0,22ec <_vfprintf_r+0x2c8>
    22bc:	0a412703          	lw	a4,164(sp)
    22c0:	07810613          	add	a2,sp,120
    22c4:	00c42023          	sw	a2,0(s0)
    22c8:	00248493          	add	s1,s1,2
    22cc:	00200613          	li	a2,2
    22d0:	00170713          	add	a4,a4,1
    22d4:	00c42223          	sw	a2,4(s0)
    22d8:	0a912423          	sw	s1,168(sp)
    22dc:	0ae12223          	sw	a4,164(sp)
    22e0:	00700613          	li	a2,7
    22e4:	00840413          	add	s0,s0,8
    22e8:	5ce644e3          	blt	a2,a4,30b0 <_vfprintf_r+0x108c>
    22ec:	08000713          	li	a4,128
    22f0:	3aef80e3          	beq	t6,a4,2e90 <_vfprintf_r+0xe6c>
    22f4:	41a30b33          	sub	s6,t1,s10
    22f8:	4b604ae3          	bgtz	s6,2fac <_vfprintf_r+0xf88>
    22fc:	100ef713          	and	a4,t4,256
    2300:	1a0710e3          	bnez	a4,2ca0 <_vfprintf_r+0xc7c>
    2304:	0a412783          	lw	a5,164(sp)
    2308:	01a484b3          	add	s1,s1,s10
    230c:	01842023          	sw	s8,0(s0)
    2310:	00178793          	add	a5,a5,1
    2314:	01a42223          	sw	s10,4(s0)
    2318:	0a912423          	sw	s1,168(sp)
    231c:	0af12223          	sw	a5,164(sp)
    2320:	00700713          	li	a4,7
    2324:	58f74c63          	blt	a4,a5,28bc <_vfprintf_r+0x898>
    2328:	00840413          	add	s0,s0,8
    232c:	004eff13          	and	t5,t4,4
    2330:	000f0663          	beqz	t5,233c <_vfprintf_r+0x318>
    2334:	419b8d33          	sub	s10,s7,s9
    2338:	5ba04ce3          	bgtz	s10,30f0 <_vfprintf_r+0x10cc>
    233c:	000b8e93          	mv	t4,s7
    2340:	019bd463          	bge	s7,s9,2348 <_vfprintf_r+0x324>
    2344:	000c8e93          	mv	t4,s9
    2348:	00c12783          	lw	a5,12(sp)
    234c:	01d787b3          	add	a5,a5,t4
    2350:	00f12623          	sw	a5,12(sp)
    2354:	18049663          	bnez	s1,24e0 <_vfprintf_r+0x4bc>
    2358:	01012783          	lw	a5,16(sp)
    235c:	0a012223          	sw	zero,164(sp)
    2360:	00078863          	beqz	a5,2370 <_vfprintf_r+0x34c>
    2364:	01012583          	lw	a1,16(sp)
    2368:	00098513          	mv	a0,s3
    236c:	9b4ff0ef          	jal	1520 <_free_r>
    2370:	0ac10413          	add	s0,sp,172
    2374:	00090c13          	mv	s8,s2
    2378:	df1ff06f          	j	2168 <_vfprintf_r+0x144>
    237c:	00812403          	lw	s0,8(sp)
    2380:	00098513          	mv	a0,s3
    2384:	00f12623          	sw	a5,12(sp)
    2388:	00040593          	mv	a1,s0
    238c:	3a4050ef          	jal	7730 <__swsetup_r>
    2390:	00050463          	beqz	a0,2398 <_vfprintf_r+0x374>
    2394:	5600206f          	j	48f4 <_vfprintf_r+0x28d0>
    2398:	00c41703          	lh	a4,12(s0)
    239c:	00a00613          	li	a2,10
    23a0:	00c12783          	lw	a5,12(sp)
    23a4:	01a77693          	and	a3,a4,26
    23a8:	d4c698e3          	bne	a3,a2,20f8 <_vfprintf_r+0xd4>
    23ac:	00812603          	lw	a2,8(sp)
    23b0:	00e61683          	lh	a3,14(a2)
    23b4:	d406c2e3          	bltz	a3,20f8 <_vfprintf_r+0xd4>
    23b8:	06462683          	lw	a3,100(a2)
    23bc:	0016f693          	and	a3,a3,1
    23c0:	00069863          	bnez	a3,23d0 <_vfprintf_r+0x3ac>
    23c4:	20077713          	and	a4,a4,512
    23c8:	00071463          	bnez	a4,23d0 <_vfprintf_r+0x3ac>
    23cc:	53d0106f          	j	4108 <_vfprintf_r+0x20e4>
    23d0:	01412683          	lw	a3,20(sp)
    23d4:	00812583          	lw	a1,8(sp)
    23d8:	00098513          	mv	a0,s3
    23dc:	00078613          	mv	a2,a5
    23e0:	0e5020ef          	jal	4cc4 <__sbprintf>
    23e4:	18c12083          	lw	ra,396(sp)
    23e8:	18812403          	lw	s0,392(sp)
    23ec:	00a12623          	sw	a0,12(sp)
    23f0:	00c12503          	lw	a0,12(sp)
    23f4:	17c12983          	lw	s3,380(sp)
    23f8:	19010113          	add	sp,sp,400
    23fc:	00008067          	ret
    2400:	00098513          	mv	a0,s3
    2404:	019050ef          	jal	7c1c <_localeconv_r>
    2408:	00452783          	lw	a5,4(a0)
    240c:	00078513          	mv	a0,a5
    2410:	04f12423          	sw	a5,72(sp)
    2414:	f3dfe0ef          	jal	1350 <strlen>
    2418:	00050793          	mv	a5,a0
    241c:	00098513          	mv	a0,s3
    2420:	00078c93          	mv	s9,a5
    2424:	04f12623          	sw	a5,76(sp)
    2428:	7f4050ef          	jal	7c1c <_localeconv_r>
    242c:	00852703          	lw	a4,8(a0)
    2430:	02e12e23          	sw	a4,60(sp)
    2434:	000c8463          	beqz	s9,243c <_vfprintf_r+0x418>
    2438:	1ec0106f          	j	3624 <_vfprintf_r+0x1600>
    243c:	00094e03          	lbu	t3,0(s2)
    2440:	d95ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2444:	00800613          	li	a2,8
    2448:	00000593          	li	a1,0
    244c:	09010513          	add	a0,sp,144
    2450:	c81fe0ef          	jal	10d0 <memset>
    2454:	00100513          	li	a0,1
    2458:	00a90933          	add	s2,s2,a0
    245c:	d11ff06f          	j	216c <_vfprintf_r+0x148>
    2460:	00050493          	mv	s1,a0
    2464:	41890cb3          	sub	s9,s2,s8
    2468:	05890063          	beq	s2,s8,24a8 <_vfprintf_r+0x484>
    246c:	0a812683          	lw	a3,168(sp)
    2470:	0a412703          	lw	a4,164(sp)
    2474:	01842023          	sw	s8,0(s0)
    2478:	019686b3          	add	a3,a3,s9
    247c:	00170713          	add	a4,a4,1
    2480:	01942223          	sw	s9,4(s0)
    2484:	0ad12423          	sw	a3,168(sp)
    2488:	0ae12223          	sw	a4,164(sp)
    248c:	00700693          	li	a3,7
    2490:	00840413          	add	s0,s0,8
    2494:	02e6c863          	blt	a3,a4,24c4 <_vfprintf_r+0x4a0>
    2498:	00c12783          	lw	a5,12(sp)
    249c:	019787b3          	add	a5,a5,s9
    24a0:	00f12623          	sw	a5,12(sp)
    24a4:	d00496e3          	bnez	s1,21b0 <_vfprintf_r+0x18c>
    24a8:	0a812783          	lw	a5,168(sp)
    24ac:	00078463          	beqz	a5,24b4 <_vfprintf_r+0x490>
    24b0:	4090106f          	j	40b8 <_vfprintf_r+0x2094>
    24b4:	00812783          	lw	a5,8(sp)
    24b8:	0a012223          	sw	zero,164(sp)
    24bc:	00c79783          	lh	a5,12(a5)
    24c0:	0500006f          	j	2510 <_vfprintf_r+0x4ec>
    24c4:	00812583          	lw	a1,8(sp)
    24c8:	0a010613          	add	a2,sp,160
    24cc:	00098513          	mv	a0,s3
    24d0:	211020ef          	jal	4ee0 <__sprint_r>
    24d4:	02051a63          	bnez	a0,2508 <_vfprintf_r+0x4e4>
    24d8:	0ac10413          	add	s0,sp,172
    24dc:	fbdff06f          	j	2498 <_vfprintf_r+0x474>
    24e0:	00812583          	lw	a1,8(sp)
    24e4:	0a010613          	add	a2,sp,160
    24e8:	00098513          	mv	a0,s3
    24ec:	1f5020ef          	jal	4ee0 <__sprint_r>
    24f0:	e60504e3          	beqz	a0,2358 <_vfprintf_r+0x334>
    24f4:	01012283          	lw	t0,16(sp)
    24f8:	00028863          	beqz	t0,2508 <_vfprintf_r+0x4e4>
    24fc:	00028593          	mv	a1,t0
    2500:	00098513          	mv	a0,s3
    2504:	81cff0ef          	jal	1520 <_free_r>
    2508:	00812783          	lw	a5,8(sp)
    250c:	00c79783          	lh	a5,12(a5)
    2510:	00812703          	lw	a4,8(sp)
    2514:	06472703          	lw	a4,100(a4)
    2518:	00177713          	and	a4,a4,1
    251c:	3c070463          	beqz	a4,28e4 <_vfprintf_r+0x8c0>
    2520:	0407f793          	and	a5,a5,64
    2524:	18412483          	lw	s1,388(sp)
    2528:	18012903          	lw	s2,384(sp)
    252c:	17812a03          	lw	s4,376(sp)
    2530:	17412a83          	lw	s5,372(sp)
    2534:	17012b03          	lw	s6,368(sp)
    2538:	16c12b83          	lw	s7,364(sp)
    253c:	16812c03          	lw	s8,360(sp)
    2540:	16412c83          	lw	s9,356(sp)
    2544:	16012d03          	lw	s10,352(sp)
    2548:	15c12d83          	lw	s11,348(sp)
    254c:	00078463          	beqz	a5,2554 <_vfprintf_r+0x530>
    2550:	3d00206f          	j	4920 <_vfprintf_r+0x28fc>
    2554:	18c12083          	lw	ra,396(sp)
    2558:	18812403          	lw	s0,392(sp)
    255c:	00c12503          	lw	a0,12(sp)
    2560:	17c12983          	lw	s3,380(sp)
    2564:	19010113          	add	sp,sp,400
    2568:	00008067          	ret
    256c:	008a7713          	and	a4,s4,8
    2570:	000a0e93          	mv	t4,s4
    2574:	000b0313          	mv	t1,s6
    2578:	00070463          	beqz	a4,2580 <_vfprintf_r+0x55c>
    257c:	0200106f          	j	359c <_vfprintf_r+0x1578>
    2580:	01412783          	lw	a5,20(sp)
    2584:	00778b13          	add	s6,a5,7
    2588:	ff8b7b13          	and	s6,s6,-8
    258c:	000b2783          	lw	a5,0(s6)
    2590:	02f12423          	sw	a5,40(sp)
    2594:	004b2783          	lw	a5,4(s6)
    2598:	02f12623          	sw	a5,44(sp)
    259c:	008b0793          	add	a5,s6,8
    25a0:	00f12a23          	sw	a5,20(sp)
    25a4:	02c12a03          	lw	s4,44(sp)
    25a8:	7fffe717          	auipc	a4,0x7fffe
    25ac:	10070713          	add	a4,a4,256 # 800006a8 <__global_locale+0x174>
    25b0:	00072c83          	lw	s9,0(a4)
    25b4:	00472d03          	lw	s10,4(a4)
    25b8:	02812b03          	lw	s6,40(sp)
    25bc:	001a1493          	sll	s1,s4,0x1
    25c0:	0014d493          	srl	s1,s1,0x1
    25c4:	000b0513          	mv	a0,s6
    25c8:	00048593          	mv	a1,s1
    25cc:	000c8613          	mv	a2,s9
    25d0:	000d0693          	mv	a3,s10
    25d4:	02612223          	sw	t1,36(sp)
    25d8:	03c12023          	sw	t3,32(sp)
    25dc:	01d12823          	sw	t4,16(sp)
    25e0:	26c0c0ef          	jal	e84c <__unorddf2>
    25e4:	01012e83          	lw	t4,16(sp)
    25e8:	02012e03          	lw	t3,32(sp)
    25ec:	02412303          	lw	t1,36(sp)
    25f0:	00050463          	beqz	a0,25f8 <_vfprintf_r+0x5d4>
    25f4:	4080106f          	j	39fc <_vfprintf_r+0x19d8>
    25f8:	000b0513          	mv	a0,s6
    25fc:	00048593          	mv	a1,s1
    2600:	000c8613          	mv	a2,s9
    2604:	000d0693          	mv	a3,s10
    2608:	0a40b0ef          	jal	d6ac <__ledf2>
    260c:	01012e83          	lw	t4,16(sp)
    2610:	02012e03          	lw	t3,32(sp)
    2614:	02412303          	lw	t1,36(sp)
    2618:	00a04463          	bgtz	a0,2620 <_vfprintf_r+0x5fc>
    261c:	3e00106f          	j	39fc <_vfprintf_r+0x19d8>
    2620:	000b0513          	mv	a0,s6
    2624:	000a0593          	mv	a1,s4
    2628:	00000613          	li	a2,0
    262c:	00000693          	li	a3,0
    2630:	07c0b0ef          	jal	d6ac <__ledf2>
    2634:	01012e83          	lw	t4,16(sp)
    2638:	02012e03          	lw	t3,32(sp)
    263c:	00055463          	bgez	a0,2644 <_vfprintf_r+0x620>
    2640:	6650106f          	j	44a4 <_vfprintf_r+0x2480>
    2644:	07714603          	lbu	a2,119(sp)
    2648:	04700713          	li	a4,71
    264c:	0000dc17          	auipc	s8,0xd
    2650:	cc4c0c13          	add	s8,s8,-828 # f310 <__fini_array_end+0x29c>
    2654:	01c74663          	blt	a4,t3,2660 <_vfprintf_r+0x63c>
    2658:	0000dc17          	auipc	s8,0xd
    265c:	cb4c0c13          	add	s8,s8,-844 # f30c <__fini_array_end+0x298>
    2660:	00012823          	sw	zero,16(sp)
    2664:	02012223          	sw	zero,36(sp)
    2668:	02012023          	sw	zero,32(sp)
    266c:	f7fefe93          	and	t4,t4,-129
    2670:	00300c93          	li	s9,3
    2674:	00300d13          	li	s10,3
    2678:	00000313          	li	t1,0
    267c:	00000a13          	li	s4,0
    2680:	be0602e3          	beqz	a2,2264 <_vfprintf_r+0x240>
    2684:	001c8c93          	add	s9,s9,1
    2688:	bddff06f          	j	2264 <_vfprintf_r+0x240>
    268c:	01000593          	li	a1,16
    2690:	0a412603          	lw	a2,164(sp)
    2694:	0000db17          	auipc	s6,0xd
    2698:	180b0b13          	add	s6,s6,384 # f814 <blanks.1>
    269c:	0ae5dc63          	bge	a1,a4,2754 <_vfprintf_r+0x730>
    26a0:	00040793          	mv	a5,s0
    26a4:	00048693          	mv	a3,s1
    26a8:	01000893          	li	a7,16
    26ac:	000b0493          	mv	s1,s6
    26b0:	00700393          	li	t2,7
    26b4:	000a0b13          	mv	s6,s4
    26b8:	04512223          	sw	t0,68(sp)
    26bc:	05f12823          	sw	t6,80(sp)
    26c0:	05d12a23          	sw	t4,84(sp)
    26c4:	05c12c23          	sw	t3,88(sp)
    26c8:	00070413          	mv	s0,a4
    26cc:	00030a13          	mv	s4,t1
    26d0:	00c0006f          	j	26dc <_vfprintf_r+0x6b8>
    26d4:	ff040413          	add	s0,s0,-16
    26d8:	0488da63          	bge	a7,s0,272c <_vfprintf_r+0x708>
    26dc:	01068693          	add	a3,a3,16
    26e0:	00160613          	add	a2,a2,1
    26e4:	0097a023          	sw	s1,0(a5)
    26e8:	0117a223          	sw	a7,4(a5)
    26ec:	0ad12423          	sw	a3,168(sp)
    26f0:	0ac12223          	sw	a2,164(sp)
    26f4:	00878793          	add	a5,a5,8
    26f8:	fcc3dee3          	bge	t2,a2,26d4 <_vfprintf_r+0x6b0>
    26fc:	00812583          	lw	a1,8(sp)
    2700:	0a010613          	add	a2,sp,160
    2704:	00098513          	mv	a0,s3
    2708:	7d8020ef          	jal	4ee0 <__sprint_r>
    270c:	de0514e3          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    2710:	01000893          	li	a7,16
    2714:	ff040413          	add	s0,s0,-16
    2718:	0a812683          	lw	a3,168(sp)
    271c:	0a412603          	lw	a2,164(sp)
    2720:	0ac10793          	add	a5,sp,172
    2724:	00700393          	li	t2,7
    2728:	fa88cae3          	blt	a7,s0,26dc <_vfprintf_r+0x6b8>
    272c:	04412283          	lw	t0,68(sp)
    2730:	05012f83          	lw	t6,80(sp)
    2734:	05412e83          	lw	t4,84(sp)
    2738:	05812e03          	lw	t3,88(sp)
    273c:	000a0313          	mv	t1,s4
    2740:	00040713          	mv	a4,s0
    2744:	000b0a13          	mv	s4,s6
    2748:	00078413          	mv	s0,a5
    274c:	00048b13          	mv	s6,s1
    2750:	00068493          	mv	s1,a3
    2754:	00e484b3          	add	s1,s1,a4
    2758:	00160613          	add	a2,a2,1
    275c:	00e42223          	sw	a4,4(s0)
    2760:	01642023          	sw	s6,0(s0)
    2764:	0a912423          	sw	s1,168(sp)
    2768:	0ac12223          	sw	a2,164(sp)
    276c:	00700713          	li	a4,7
    2770:	00c75463          	bge	a4,a2,2778 <_vfprintf_r+0x754>
    2774:	2380106f          	j	39ac <_vfprintf_r+0x1988>
    2778:	07714603          	lbu	a2,119(sp)
    277c:	00840413          	add	s0,s0,8
    2780:	b05ff06f          	j	2284 <_vfprintf_r+0x260>
    2784:	00812583          	lw	a1,8(sp)
    2788:	0a010613          	add	a2,sp,160
    278c:	00098513          	mv	a0,s3
    2790:	04612e23          	sw	t1,92(sp)
    2794:	05c12c23          	sw	t3,88(sp)
    2798:	05d12a23          	sw	t4,84(sp)
    279c:	05f12823          	sw	t6,80(sp)
    27a0:	04512223          	sw	t0,68(sp)
    27a4:	73c020ef          	jal	4ee0 <__sprint_r>
    27a8:	d40516e3          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    27ac:	0a812483          	lw	s1,168(sp)
    27b0:	05c12303          	lw	t1,92(sp)
    27b4:	05812e03          	lw	t3,88(sp)
    27b8:	05412e83          	lw	t4,84(sp)
    27bc:	05012f83          	lw	t6,80(sp)
    27c0:	04412283          	lw	t0,68(sp)
    27c4:	0ac10413          	add	s0,sp,172
    27c8:	af1ff06f          	j	22b8 <_vfprintf_r+0x294>
    27cc:	0a412d03          	lw	s10,164(sp)
    27d0:	01812783          	lw	a5,24(sp)
    27d4:	00100693          	li	a3,1
    27d8:	01842023          	sw	s8,0(s0)
    27dc:	00148493          	add	s1,s1,1
    27e0:	001d0d13          	add	s10,s10,1
    27e4:	00840b13          	add	s6,s0,8
    27e8:	32f6d0e3          	bge	a3,a5,3308 <_vfprintf_r+0x12e4>
    27ec:	00100693          	li	a3,1
    27f0:	00d42223          	sw	a3,4(s0)
    27f4:	0a912423          	sw	s1,168(sp)
    27f8:	0ba12223          	sw	s10,164(sp)
    27fc:	00700693          	li	a3,7
    2800:	01a6d463          	bge	a3,s10,2808 <_vfprintf_r+0x7e4>
    2804:	0680106f          	j	386c <_vfprintf_r+0x1848>
    2808:	03012783          	lw	a5,48(sp)
    280c:	03412703          	lw	a4,52(sp)
    2810:	001d0d13          	add	s10,s10,1
    2814:	00f484b3          	add	s1,s1,a5
    2818:	00eb2023          	sw	a4,0(s6)
    281c:	00fb2223          	sw	a5,4(s6)
    2820:	0a912423          	sw	s1,168(sp)
    2824:	0ba12223          	sw	s10,164(sp)
    2828:	00700693          	li	a3,7
    282c:	008b0b13          	add	s6,s6,8
    2830:	01a6d463          	bge	a3,s10,2838 <_vfprintf_r+0x814>
    2834:	0680106f          	j	389c <_vfprintf_r+0x1878>
    2838:	02812603          	lw	a2,40(sp)
    283c:	02c12683          	lw	a3,44(sp)
    2840:	01812783          	lw	a5,24(sp)
    2844:	00060513          	mv	a0,a2
    2848:	00068593          	mv	a1,a3
    284c:	00000613          	li	a2,0
    2850:	00000693          	li	a3,0
    2854:	03d12023          	sw	t4,32(sp)
    2858:	fff78413          	add	s0,a5,-1
    285c:	4c50a0ef          	jal	d520 <__eqdf2>
    2860:	02012e83          	lw	t4,32(sp)
    2864:	2e0506e3          	beqz	a0,3350 <_vfprintf_r+0x132c>
    2868:	001c0793          	add	a5,s8,1
    286c:	001d0d13          	add	s10,s10,1
    2870:	008484b3          	add	s1,s1,s0
    2874:	00fb2023          	sw	a5,0(s6)
    2878:	008b2223          	sw	s0,4(s6)
    287c:	0a912423          	sw	s1,168(sp)
    2880:	0ba12223          	sw	s10,164(sp)
    2884:	00700793          	li	a5,7
    2888:	008b0b13          	add	s6,s6,8
    288c:	29a7cce3          	blt	a5,s10,3324 <_vfprintf_r+0x1300>
    2890:	04012703          	lw	a4,64(sp)
    2894:	08810793          	add	a5,sp,136
    2898:	001d0d13          	add	s10,s10,1
    289c:	009704b3          	add	s1,a4,s1
    28a0:	00fb2023          	sw	a5,0(s6)
    28a4:	00eb2223          	sw	a4,4(s6)
    28a8:	0a912423          	sw	s1,168(sp)
    28ac:	0ba12223          	sw	s10,164(sp)
    28b0:	00700793          	li	a5,7
    28b4:	008b0413          	add	s0,s6,8
    28b8:	a7a7dae3          	bge	a5,s10,232c <_vfprintf_r+0x308>
    28bc:	00812583          	lw	a1,8(sp)
    28c0:	0a010613          	add	a2,sp,160
    28c4:	00098513          	mv	a0,s3
    28c8:	03d12023          	sw	t4,32(sp)
    28cc:	614020ef          	jal	4ee0 <__sprint_r>
    28d0:	c20512e3          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    28d4:	0a812483          	lw	s1,168(sp)
    28d8:	02012e83          	lw	t4,32(sp)
    28dc:	0ac10413          	add	s0,sp,172
    28e0:	a4dff06f          	j	232c <_vfprintf_r+0x308>
    28e4:	2007f713          	and	a4,a5,512
    28e8:	c2071ce3          	bnez	a4,2520 <_vfprintf_r+0x4fc>
    28ec:	00812403          	lw	s0,8(sp)
    28f0:	05842503          	lw	a0,88(s0)
    28f4:	fd8fe0ef          	jal	10cc <__retarget_lock_release_recursive>
    28f8:	00c41783          	lh	a5,12(s0)
    28fc:	c25ff06f          	j	2520 <_vfprintf_r+0x4fc>
    2900:	00094e03          	lbu	t3,0(s2)
    2904:	020a6a13          	or	s4,s4,32
    2908:	8cdff06f          	j	21d4 <_vfprintf_r+0x1b0>
    290c:	01412703          	lw	a4,20(sp)
    2910:	04300793          	li	a5,67
    2914:	000a0e93          	mv	t4,s4
    2918:	00470493          	add	s1,a4,4
    291c:	64fe08e3          	beq	t3,a5,376c <_vfprintf_r+0x1748>
    2920:	010a7793          	and	a5,s4,16
    2924:	640794e3          	bnez	a5,376c <_vfprintf_r+0x1748>
    2928:	01412783          	lw	a5,20(sp)
    292c:	00100c93          	li	s9,1
    2930:	00100d13          	li	s10,1
    2934:	0007a783          	lw	a5,0(a5)
    2938:	0ec10c13          	add	s8,sp,236
    293c:	0ef10623          	sb	a5,236(sp)
    2940:	06010ba3          	sb	zero,119(sp)
    2944:	00912a23          	sw	s1,20(sp)
    2948:	00000613          	li	a2,0
    294c:	00012823          	sw	zero,16(sp)
    2950:	00000313          	li	t1,0
    2954:	02012223          	sw	zero,36(sp)
    2958:	02012023          	sw	zero,32(sp)
    295c:	00000a13          	li	s4,0
    2960:	905ff06f          	j	2264 <_vfprintf_r+0x240>
    2964:	01412783          	lw	a5,20(sp)
    2968:	06010ba3          	sb	zero,119(sp)
    296c:	000b0313          	mv	t1,s6
    2970:	0007ac03          	lw	s8,0(a5)
    2974:	000a0e93          	mv	t4,s4
    2978:	00478b13          	add	s6,a5,4
    297c:	5a0c0ce3          	beqz	s8,3734 <_vfprintf_r+0x1710>
    2980:	05300713          	li	a4,83
    2984:	00ee1463          	bne	t3,a4,298c <_vfprintf_r+0x968>
    2988:	1d00106f          	j	3b58 <_vfprintf_r+0x1b34>
    298c:	010a7a13          	and	s4,s4,16
    2990:	000a0463          	beqz	s4,2998 <_vfprintf_r+0x974>
    2994:	1c40106f          	j	3b58 <_vfprintf_r+0x1b34>
    2998:	00035463          	bgez	t1,29a0 <_vfprintf_r+0x97c>
    299c:	6d40106f          	j	4070 <_vfprintf_r+0x204c>
    29a0:	00030613          	mv	a2,t1
    29a4:	00000593          	li	a1,0
    29a8:	000c0513          	mv	a0,s8
    29ac:	03d12023          	sw	t4,32(sp)
    29b0:	00612a23          	sw	t1,20(sp)
    29b4:	0ec050ef          	jal	7aa0 <memchr>
    29b8:	00a12823          	sw	a0,16(sp)
    29bc:	01412303          	lw	t1,20(sp)
    29c0:	02012e83          	lw	t4,32(sp)
    29c4:	00051463          	bnez	a0,29cc <_vfprintf_r+0x9a8>
    29c8:	1780206f          	j	4b40 <_vfprintf_r+0x2b1c>
    29cc:	01012783          	lw	a5,16(sp)
    29d0:	07714603          	lbu	a2,119(sp)
    29d4:	01612a23          	sw	s6,20(sp)
    29d8:	41878d33          	sub	s10,a5,s8
    29dc:	fffd4813          	not	a6,s10
    29e0:	41f85813          	sra	a6,a6,0x1f
    29e4:	02012223          	sw	zero,36(sp)
    29e8:	02012023          	sw	zero,32(sp)
    29ec:	00012823          	sw	zero,16(sp)
    29f0:	010d7cb3          	and	s9,s10,a6
    29f4:	00000313          	li	t1,0
    29f8:	07300e13          	li	t3,115
    29fc:	860604e3          	beqz	a2,2264 <_vfprintf_r+0x240>
    2a00:	c85ff06f          	j	2684 <_vfprintf_r+0x660>
    2a04:	01412783          	lw	a5,20(sp)
    2a08:	0007ab83          	lw	s7,0(a5)
    2a0c:	00478793          	add	a5,a5,4
    2a10:	2a0bdae3          	bgez	s7,34c4 <_vfprintf_r+0x14a0>
    2a14:	41700bb3          	neg	s7,s7
    2a18:	00f12a23          	sw	a5,20(sp)
    2a1c:	00094e03          	lbu	t3,0(s2)
    2a20:	004a6a13          	or	s4,s4,4
    2a24:	fb0ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2a28:	02b00793          	li	a5,43
    2a2c:	00094e03          	lbu	t3,0(s2)
    2a30:	06f10ba3          	sb	a5,119(sp)
    2a34:	fa0ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2a38:	000b0313          	mv	t1,s6
    2a3c:	010a6613          	or	a2,s4,16
    2a40:	02067793          	and	a5,a2,32
    2a44:	1c0780e3          	beqz	a5,3404 <_vfprintf_r+0x13e0>
    2a48:	01412783          	lw	a5,20(sp)
    2a4c:	00778b13          	add	s6,a5,7
    2a50:	ff8b7b13          	and	s6,s6,-8
    2a54:	000b2d03          	lw	s10,0(s6)
    2a58:	004b2c83          	lw	s9,4(s6)
    2a5c:	008b0793          	add	a5,s6,8
    2a60:	00f12a23          	sw	a5,20(sp)
    2a64:	00100793          	li	a5,1
    2a68:	00000713          	li	a4,0
    2a6c:	06e10ba3          	sb	a4,119(sp)
    2a70:	34034c63          	bltz	t1,2dc8 <_vfprintf_r+0xda4>
    2a74:	019d6733          	or	a4,s10,s9
    2a78:	f7f67e93          	and	t4,a2,-129
    2a7c:	34071463          	bnez	a4,2dc4 <_vfprintf_r+0xda0>
    2a80:	3a031a63          	bnez	t1,2e34 <_vfprintf_r+0xe10>
    2a84:	5c079ee3          	bnez	a5,3860 <_vfprintf_r+0x183c>
    2a88:	00167d13          	and	s10,a2,1
    2a8c:	15010c13          	add	s8,sp,336
    2a90:	2c0d10e3          	bnez	s10,3550 <_vfprintf_r+0x152c>
    2a94:	07714603          	lbu	a2,119(sp)
    2a98:	00030c93          	mv	s9,t1
    2a9c:	01a35463          	bge	t1,s10,2aa4 <_vfprintf_r+0xa80>
    2aa0:	000d0c93          	mv	s9,s10
    2aa4:	00012823          	sw	zero,16(sp)
    2aa8:	02012223          	sw	zero,36(sp)
    2aac:	02012023          	sw	zero,32(sp)
    2ab0:	00000a13          	li	s4,0
    2ab4:	fa060863          	beqz	a2,2264 <_vfprintf_r+0x240>
    2ab8:	bcdff06f          	j	2684 <_vfprintf_r+0x660>
    2abc:	00094e03          	lbu	t3,0(s2)
    2ac0:	080a6a13          	or	s4,s4,128
    2ac4:	f10ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2ac8:	00094e03          	lbu	t3,0(s2)
    2acc:	02a00793          	li	a5,42
    2ad0:	00190693          	add	a3,s2,1
    2ad4:	00fe1463          	bne	t3,a5,2adc <_vfprintf_r+0xab8>
    2ad8:	1100206f          	j	4be8 <_vfprintf_r+0x2bc4>
    2adc:	fd0e0713          	add	a4,t3,-48
    2ae0:	00900793          	li	a5,9
    2ae4:	00000b13          	li	s6,0
    2ae8:	00900613          	li	a2,9
    2aec:	02e7e463          	bltu	a5,a4,2b14 <_vfprintf_r+0xaf0>
    2af0:	0006ce03          	lbu	t3,0(a3)
    2af4:	002b1793          	sll	a5,s6,0x2
    2af8:	016787b3          	add	a5,a5,s6
    2afc:	00179793          	sll	a5,a5,0x1
    2b00:	00e78b33          	add	s6,a5,a4
    2b04:	fd0e0713          	add	a4,t3,-48
    2b08:	00168693          	add	a3,a3,1
    2b0c:	fee672e3          	bgeu	a2,a4,2af0 <_vfprintf_r+0xacc>
    2b10:	320b4ce3          	bltz	s6,3648 <_vfprintf_r+0x1624>
    2b14:	00068913          	mv	s2,a3
    2b18:	ec0ff06f          	j	21d8 <_vfprintf_r+0x1b4>
    2b1c:	00094e03          	lbu	t3,0(s2)
    2b20:	001a6a13          	or	s4,s4,1
    2b24:	eb0ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2b28:	07714783          	lbu	a5,119(sp)
    2b2c:	00094e03          	lbu	t3,0(s2)
    2b30:	ea079263          	bnez	a5,21d4 <_vfprintf_r+0x1b0>
    2b34:	02000793          	li	a5,32
    2b38:	06f10ba3          	sb	a5,119(sp)
    2b3c:	e98ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2b40:	00094e03          	lbu	t3,0(s2)
    2b44:	06c00793          	li	a5,108
    2b48:	3afe00e3          	beq	t3,a5,36e8 <_vfprintf_r+0x16c4>
    2b4c:	010a6a13          	or	s4,s4,16
    2b50:	e84ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2b54:	00094e03          	lbu	t3,0(s2)
    2b58:	008a6a13          	or	s4,s4,8
    2b5c:	e78ff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2b60:	000b0313          	mv	t1,s6
    2b64:	010a6e93          	or	t4,s4,16
    2b68:	020ef793          	and	a5,t4,32
    2b6c:	0c0786e3          	beqz	a5,3438 <_vfprintf_r+0x1414>
    2b70:	01412783          	lw	a5,20(sp)
    2b74:	00778b13          	add	s6,a5,7
    2b78:	ff8b7b13          	and	s6,s6,-8
    2b7c:	004b2783          	lw	a5,4(s6)
    2b80:	000b2d03          	lw	s10,0(s6)
    2b84:	008b0713          	add	a4,s6,8
    2b88:	00e12a23          	sw	a4,20(sp)
    2b8c:	00078c93          	mv	s9,a5
    2b90:	0c07cee3          	bltz	a5,346c <_vfprintf_r+0x1448>
    2b94:	000e8613          	mv	a2,t4
    2b98:	02034263          	bltz	t1,2bbc <_vfprintf_r+0xb98>
    2b9c:	019d67b3          	or	a5,s10,s9
    2ba0:	f7fef613          	and	a2,t4,-129
    2ba4:	00079c63          	bnez	a5,2bbc <_vfprintf_r+0xb98>
    2ba8:	02031063          	bnez	t1,2bc8 <_vfprintf_r+0xba4>
    2bac:	00000d13          	li	s10,0
    2bb0:	00060e93          	mv	t4,a2
    2bb4:	15010c13          	add	s8,sp,336
    2bb8:	eddff06f          	j	2a94 <_vfprintf_r+0xa70>
    2bbc:	520c90e3          	bnez	s9,38dc <_vfprintf_r+0x18b8>
    2bc0:	00900793          	li	a5,9
    2bc4:	51a7ece3          	bltu	a5,s10,38dc <_vfprintf_r+0x18b8>
    2bc8:	030d0d13          	add	s10,s10,48
    2bcc:	15a107a3          	sb	s10,335(sp)
    2bd0:	00060e93          	mv	t4,a2
    2bd4:	00100d13          	li	s10,1
    2bd8:	14f10c13          	add	s8,sp,335
    2bdc:	eb9ff06f          	j	2a94 <_vfprintf_r+0xa70>
    2be0:	000b0313          	mv	t1,s6
    2be4:	010a6e93          	or	t4,s4,16
    2be8:	020ef793          	and	a5,t4,32
    2bec:	7e078463          	beqz	a5,33d4 <_vfprintf_r+0x13b0>
    2bf0:	01412783          	lw	a5,20(sp)
    2bf4:	00778b13          	add	s6,a5,7
    2bf8:	ff8b7b13          	and	s6,s6,-8
    2bfc:	000b2d03          	lw	s10,0(s6)
    2c00:	004b2c83          	lw	s9,4(s6)
    2c04:	008b0793          	add	a5,s6,8
    2c08:	00f12a23          	sw	a5,20(sp)
    2c0c:	bffef613          	and	a2,t4,-1025
    2c10:	00000793          	li	a5,0
    2c14:	e55ff06f          	j	2a68 <_vfprintf_r+0xa44>
    2c18:	00094e03          	lbu	t3,0(s2)
    2c1c:	06800793          	li	a5,104
    2c20:	2cfe0ce3          	beq	t3,a5,36f8 <_vfprintf_r+0x16d4>
    2c24:	040a6a13          	or	s4,s4,64
    2c28:	dacff06f          	j	21d4 <_vfprintf_r+0x1b0>
    2c2c:	01412703          	lw	a4,20(sp)
    2c30:	000087b7          	lui	a5,0x8
    2c34:	83078793          	add	a5,a5,-2000 # 7830 <__swsetup_r+0x100>
    2c38:	06f11c23          	sh	a5,120(sp)
    2c3c:	00470793          	add	a5,a4,4
    2c40:	00f12a23          	sw	a5,20(sp)
    2c44:	0000c797          	auipc	a5,0xc
    2c48:	6d878793          	add	a5,a5,1752 # f31c <__fini_array_end+0x2a8>
    2c4c:	02f12c23          	sw	a5,56(sp)
    2c50:	00072d03          	lw	s10,0(a4)
    2c54:	000b0313          	mv	t1,s6
    2c58:	00000c93          	li	s9,0
    2c5c:	002a6613          	or	a2,s4,2
    2c60:	00200793          	li	a5,2
    2c64:	07800e13          	li	t3,120
    2c68:	e01ff06f          	j	2a68 <_vfprintf_r+0xa44>
    2c6c:	020a7793          	and	a5,s4,32
    2c70:	180784e3          	beqz	a5,35f8 <_vfprintf_r+0x15d4>
    2c74:	01412783          	lw	a5,20(sp)
    2c78:	00c12683          	lw	a3,12(sp)
    2c7c:	0007a783          	lw	a5,0(a5)
    2c80:	41f6d713          	sra	a4,a3,0x1f
    2c84:	00d7a023          	sw	a3,0(a5)
    2c88:	00e7a223          	sw	a4,4(a5)
    2c8c:	01412783          	lw	a5,20(sp)
    2c90:	00090c13          	mv	s8,s2
    2c94:	00478793          	add	a5,a5,4
    2c98:	00f12a23          	sw	a5,20(sp)
    2c9c:	cccff06f          	j	2168 <_vfprintf_r+0x144>
    2ca0:	06500713          	li	a4,101
    2ca4:	b3c754e3          	bge	a4,t3,27cc <_vfprintf_r+0x7a8>
    2ca8:	02812683          	lw	a3,40(sp)
    2cac:	02c12703          	lw	a4,44(sp)
    2cb0:	00000613          	li	a2,0
    2cb4:	00068513          	mv	a0,a3
    2cb8:	00070593          	mv	a1,a4
    2cbc:	00000693          	li	a3,0
    2cc0:	05d12223          	sw	t4,68(sp)
    2cc4:	05d0a0ef          	jal	d520 <__eqdf2>
    2cc8:	04412e83          	lw	t4,68(sp)
    2ccc:	4e051463          	bnez	a0,31b4 <_vfprintf_r+0x1190>
    2cd0:	0a412783          	lw	a5,164(sp)
    2cd4:	0000c717          	auipc	a4,0xc
    2cd8:	67870713          	add	a4,a4,1656 # f34c <__fini_array_end+0x2d8>
    2cdc:	00e42023          	sw	a4,0(s0)
    2ce0:	00148493          	add	s1,s1,1
    2ce4:	00100713          	li	a4,1
    2ce8:	00178793          	add	a5,a5,1
    2cec:	00e42223          	sw	a4,4(s0)
    2cf0:	0a912423          	sw	s1,168(sp)
    2cf4:	0af12223          	sw	a5,164(sp)
    2cf8:	00700713          	li	a4,7
    2cfc:	00840413          	add	s0,s0,8
    2d00:	62f746e3          	blt	a4,a5,3b2c <_vfprintf_r+0x1b08>
    2d04:	07c12783          	lw	a5,124(sp)
    2d08:	01812703          	lw	a4,24(sp)
    2d0c:	78e7de63          	bge	a5,a4,34a8 <_vfprintf_r+0x1484>
    2d10:	03412783          	lw	a5,52(sp)
    2d14:	03012703          	lw	a4,48(sp)
    2d18:	00840413          	add	s0,s0,8
    2d1c:	fef42c23          	sw	a5,-8(s0)
    2d20:	0a412783          	lw	a5,164(sp)
    2d24:	00e484b3          	add	s1,s1,a4
    2d28:	fee42e23          	sw	a4,-4(s0)
    2d2c:	00178793          	add	a5,a5,1
    2d30:	0a912423          	sw	s1,168(sp)
    2d34:	0af12223          	sw	a5,164(sp)
    2d38:	00700713          	li	a4,7
    2d3c:	1cf746e3          	blt	a4,a5,3708 <_vfprintf_r+0x16e4>
    2d40:	01812783          	lw	a5,24(sp)
    2d44:	fff78d13          	add	s10,a5,-1
    2d48:	dfa05263          	blez	s10,232c <_vfprintf_r+0x308>
    2d4c:	01000713          	li	a4,16
    2d50:	0a412783          	lw	a5,164(sp)
    2d54:	0000d297          	auipc	t0,0xd
    2d58:	ab028293          	add	t0,t0,-1360 # f804 <zeroes.0>
    2d5c:	77a752e3          	bge	a4,s10,3cc0 <_vfprintf_r+0x1c9c>
    2d60:	00048713          	mv	a4,s1
    2d64:	01000c13          	li	s8,16
    2d68:	00700b13          	li	s6,7
    2d6c:	000e8493          	mv	s1,t4
    2d70:	00028a13          	mv	s4,t0
    2d74:	00c0006f          	j	2d80 <_vfprintf_r+0xd5c>
    2d78:	ff0d0d13          	add	s10,s10,-16
    2d7c:	73ac5ce3          	bge	s8,s10,3cb4 <_vfprintf_r+0x1c90>
    2d80:	01070713          	add	a4,a4,16
    2d84:	00178793          	add	a5,a5,1
    2d88:	01442023          	sw	s4,0(s0)
    2d8c:	01842223          	sw	s8,4(s0)
    2d90:	0ae12423          	sw	a4,168(sp)
    2d94:	0af12223          	sw	a5,164(sp)
    2d98:	00840413          	add	s0,s0,8
    2d9c:	fcfb5ee3          	bge	s6,a5,2d78 <_vfprintf_r+0xd54>
    2da0:	00812583          	lw	a1,8(sp)
    2da4:	0a010613          	add	a2,sp,160
    2da8:	00098513          	mv	a0,s3
    2dac:	134020ef          	jal	4ee0 <__sprint_r>
    2db0:	f4051263          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    2db4:	0a812703          	lw	a4,168(sp)
    2db8:	0a412783          	lw	a5,164(sp)
    2dbc:	0ac10413          	add	s0,sp,172
    2dc0:	fb9ff06f          	j	2d78 <_vfprintf_r+0xd54>
    2dc4:	000e8613          	mv	a2,t4
    2dc8:	00100713          	li	a4,1
    2dcc:	dee788e3          	beq	a5,a4,2bbc <_vfprintf_r+0xb98>
    2dd0:	00200713          	li	a4,2
    2dd4:	06e78c63          	beq	a5,a4,2e4c <_vfprintf_r+0xe28>
    2dd8:	15010c13          	add	s8,sp,336
    2ddc:	01dc9793          	sll	a5,s9,0x1d
    2de0:	007d7713          	and	a4,s10,7
    2de4:	003d5d13          	srl	s10,s10,0x3
    2de8:	03070713          	add	a4,a4,48
    2dec:	01a7ed33          	or	s10,a5,s10
    2df0:	003cdc93          	srl	s9,s9,0x3
    2df4:	feec0fa3          	sb	a4,-1(s8)
    2df8:	019d67b3          	or	a5,s10,s9
    2dfc:	000c0593          	mv	a1,s8
    2e00:	fffc0c13          	add	s8,s8,-1
    2e04:	fc079ce3          	bnez	a5,2ddc <_vfprintf_r+0xdb8>
    2e08:	00167693          	and	a3,a2,1
    2e0c:	06068a63          	beqz	a3,2e80 <_vfprintf_r+0xe5c>
    2e10:	03000693          	li	a3,48
    2e14:	06d70663          	beq	a4,a3,2e80 <_vfprintf_r+0xe5c>
    2e18:	ffe58593          	add	a1,a1,-2 # 1ffe <_malloc_r+0x7d2>
    2e1c:	15010793          	add	a5,sp,336
    2e20:	fedc0fa3          	sb	a3,-1(s8)
    2e24:	40b78d33          	sub	s10,a5,a1
    2e28:	00060e93          	mv	t4,a2
    2e2c:	00058c13          	mv	s8,a1
    2e30:	c65ff06f          	j	2a94 <_vfprintf_r+0xa70>
    2e34:	00100713          	li	a4,1
    2e38:	00e79463          	bne	a5,a4,2e40 <_vfprintf_r+0xe1c>
    2e3c:	2b10106f          	j	48ec <_vfprintf_r+0x28c8>
    2e40:	00200713          	li	a4,2
    2e44:	000e8613          	mv	a2,t4
    2e48:	f8e798e3          	bne	a5,a4,2dd8 <_vfprintf_r+0xdb4>
    2e4c:	03812683          	lw	a3,56(sp)
    2e50:	15010c13          	add	s8,sp,336
    2e54:	00fd7793          	and	a5,s10,15
    2e58:	00f687b3          	add	a5,a3,a5
    2e5c:	0007c703          	lbu	a4,0(a5)
    2e60:	004d5d13          	srl	s10,s10,0x4
    2e64:	01cc9793          	sll	a5,s9,0x1c
    2e68:	01a7ed33          	or	s10,a5,s10
    2e6c:	004cdc93          	srl	s9,s9,0x4
    2e70:	feec0fa3          	sb	a4,-1(s8)
    2e74:	019d67b3          	or	a5,s10,s9
    2e78:	fffc0c13          	add	s8,s8,-1
    2e7c:	fc079ce3          	bnez	a5,2e54 <_vfprintf_r+0xe30>
    2e80:	15010793          	add	a5,sp,336
    2e84:	41878d33          	sub	s10,a5,s8
    2e88:	00060e93          	mv	t4,a2
    2e8c:	c09ff06f          	j	2a94 <_vfprintf_r+0xa70>
    2e90:	419b8b33          	sub	s6,s7,s9
    2e94:	c7605063          	blez	s6,22f4 <_vfprintf_r+0x2d0>
    2e98:	01000593          	li	a1,16
    2e9c:	0a412603          	lw	a2,164(sp)
    2ea0:	0000d297          	auipc	t0,0xd
    2ea4:	96428293          	add	t0,t0,-1692 # f804 <zeroes.0>
    2ea8:	0b65d463          	bge	a1,s6,2f50 <_vfprintf_r+0xf2c>
    2eac:	00040793          	mv	a5,s0
    2eb0:	00048713          	mv	a4,s1
    2eb4:	000b0413          	mv	s0,s6
    2eb8:	01000893          	li	a7,16
    2ebc:	000a0b13          	mv	s6,s4
    2ec0:	00700f93          	li	t6,7
    2ec4:	05d12223          	sw	t4,68(sp)
    2ec8:	05c12823          	sw	t3,80(sp)
    2ecc:	00030a13          	mv	s4,t1
    2ed0:	00028493          	mv	s1,t0
    2ed4:	00c0006f          	j	2ee0 <_vfprintf_r+0xebc>
    2ed8:	ff040413          	add	s0,s0,-16
    2edc:	0488da63          	bge	a7,s0,2f30 <_vfprintf_r+0xf0c>
    2ee0:	01070713          	add	a4,a4,16
    2ee4:	00160613          	add	a2,a2,1
    2ee8:	0097a023          	sw	s1,0(a5)
    2eec:	0117a223          	sw	a7,4(a5)
    2ef0:	0ae12423          	sw	a4,168(sp)
    2ef4:	0ac12223          	sw	a2,164(sp)
    2ef8:	00878793          	add	a5,a5,8
    2efc:	fccfdee3          	bge	t6,a2,2ed8 <_vfprintf_r+0xeb4>
    2f00:	00812583          	lw	a1,8(sp)
    2f04:	0a010613          	add	a2,sp,160
    2f08:	00098513          	mv	a0,s3
    2f0c:	7d5010ef          	jal	4ee0 <__sprint_r>
    2f10:	de051263          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    2f14:	01000893          	li	a7,16
    2f18:	ff040413          	add	s0,s0,-16
    2f1c:	0a812703          	lw	a4,168(sp)
    2f20:	0a412603          	lw	a2,164(sp)
    2f24:	0ac10793          	add	a5,sp,172
    2f28:	00700f93          	li	t6,7
    2f2c:	fa88cae3          	blt	a7,s0,2ee0 <_vfprintf_r+0xebc>
    2f30:	04412e83          	lw	t4,68(sp)
    2f34:	05012e03          	lw	t3,80(sp)
    2f38:	000a0313          	mv	t1,s4
    2f3c:	00048293          	mv	t0,s1
    2f40:	000b0a13          	mv	s4,s6
    2f44:	00070493          	mv	s1,a4
    2f48:	00040b13          	mv	s6,s0
    2f4c:	00078413          	mv	s0,a5
    2f50:	016484b3          	add	s1,s1,s6
    2f54:	00160613          	add	a2,a2,1
    2f58:	00542023          	sw	t0,0(s0)
    2f5c:	01642223          	sw	s6,4(s0)
    2f60:	0a912423          	sw	s1,168(sp)
    2f64:	0ac12223          	sw	a2,164(sp)
    2f68:	00700713          	li	a4,7
    2f6c:	00840413          	add	s0,s0,8
    2f70:	b8c75263          	bge	a4,a2,22f4 <_vfprintf_r+0x2d0>
    2f74:	00812583          	lw	a1,8(sp)
    2f78:	0a010613          	add	a2,sp,160
    2f7c:	00098513          	mv	a0,s3
    2f80:	04612a23          	sw	t1,84(sp)
    2f84:	05c12823          	sw	t3,80(sp)
    2f88:	05d12223          	sw	t4,68(sp)
    2f8c:	755010ef          	jal	4ee0 <__sprint_r>
    2f90:	d6051263          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    2f94:	0a812483          	lw	s1,168(sp)
    2f98:	05412303          	lw	t1,84(sp)
    2f9c:	05012e03          	lw	t3,80(sp)
    2fa0:	04412e83          	lw	t4,68(sp)
    2fa4:	0ac10413          	add	s0,sp,172
    2fa8:	b4cff06f          	j	22f4 <_vfprintf_r+0x2d0>
    2fac:	01000713          	li	a4,16
    2fb0:	0a412603          	lw	a2,164(sp)
    2fb4:	0000d297          	auipc	t0,0xd
    2fb8:	85028293          	add	t0,t0,-1968 # f804 <zeroes.0>
    2fbc:	0b675063          	bge	a4,s6,305c <_vfprintf_r+0x1038>
    2fc0:	00040793          	mv	a5,s0
    2fc4:	00048693          	mv	a3,s1
    2fc8:	000b0413          	mv	s0,s6
    2fcc:	01000713          	li	a4,16
    2fd0:	00700893          	li	a7,7
    2fd4:	05d12223          	sw	t4,68(sp)
    2fd8:	000e0493          	mv	s1,t3
    2fdc:	00028b13          	mv	s6,t0
    2fe0:	00c0006f          	j	2fec <_vfprintf_r+0xfc8>
    2fe4:	ff040413          	add	s0,s0,-16
    2fe8:	04875e63          	bge	a4,s0,3044 <_vfprintf_r+0x1020>
    2fec:	01068693          	add	a3,a3,16
    2ff0:	00160613          	add	a2,a2,1
    2ff4:	0000d597          	auipc	a1,0xd
    2ff8:	81058593          	add	a1,a1,-2032 # f804 <zeroes.0>
    2ffc:	00b7a023          	sw	a1,0(a5)
    3000:	00e7a223          	sw	a4,4(a5)
    3004:	0ad12423          	sw	a3,168(sp)
    3008:	0ac12223          	sw	a2,164(sp)
    300c:	00878793          	add	a5,a5,8
    3010:	fcc8dae3          	bge	a7,a2,2fe4 <_vfprintf_r+0xfc0>
    3014:	00812583          	lw	a1,8(sp)
    3018:	0a010613          	add	a2,sp,160
    301c:	00098513          	mv	a0,s3
    3020:	6c1010ef          	jal	4ee0 <__sprint_r>
    3024:	cc051863          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    3028:	01000713          	li	a4,16
    302c:	ff040413          	add	s0,s0,-16
    3030:	0a812683          	lw	a3,168(sp)
    3034:	0a412603          	lw	a2,164(sp)
    3038:	0ac10793          	add	a5,sp,172
    303c:	00700893          	li	a7,7
    3040:	fa8746e3          	blt	a4,s0,2fec <_vfprintf_r+0xfc8>
    3044:	04412e83          	lw	t4,68(sp)
    3048:	00048e13          	mv	t3,s1
    304c:	000b0293          	mv	t0,s6
    3050:	00068493          	mv	s1,a3
    3054:	00040b13          	mv	s6,s0
    3058:	00078413          	mv	s0,a5
    305c:	016484b3          	add	s1,s1,s6
    3060:	00160613          	add	a2,a2,1
    3064:	00542023          	sw	t0,0(s0)
    3068:	01642223          	sw	s6,4(s0)
    306c:	0a912423          	sw	s1,168(sp)
    3070:	0ac12223          	sw	a2,164(sp)
    3074:	00700713          	li	a4,7
    3078:	00840413          	add	s0,s0,8
    307c:	a8c75063          	bge	a4,a2,22fc <_vfprintf_r+0x2d8>
    3080:	00812583          	lw	a1,8(sp)
    3084:	0a010613          	add	a2,sp,160
    3088:	00098513          	mv	a0,s3
    308c:	05c12823          	sw	t3,80(sp)
    3090:	05d12223          	sw	t4,68(sp)
    3094:	64d010ef          	jal	4ee0 <__sprint_r>
    3098:	c4051e63          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    309c:	0a812483          	lw	s1,168(sp)
    30a0:	05012e03          	lw	t3,80(sp)
    30a4:	04412e83          	lw	t4,68(sp)
    30a8:	0ac10413          	add	s0,sp,172
    30ac:	a50ff06f          	j	22fc <_vfprintf_r+0x2d8>
    30b0:	00812583          	lw	a1,8(sp)
    30b4:	0a010613          	add	a2,sp,160
    30b8:	00098513          	mv	a0,s3
    30bc:	04612c23          	sw	t1,88(sp)
    30c0:	05c12a23          	sw	t3,84(sp)
    30c4:	05d12823          	sw	t4,80(sp)
    30c8:	05f12223          	sw	t6,68(sp)
    30cc:	615010ef          	jal	4ee0 <__sprint_r>
    30d0:	c2051263          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    30d4:	0a812483          	lw	s1,168(sp)
    30d8:	05812303          	lw	t1,88(sp)
    30dc:	05412e03          	lw	t3,84(sp)
    30e0:	05012e83          	lw	t4,80(sp)
    30e4:	04412f83          	lw	t6,68(sp)
    30e8:	0ac10413          	add	s0,sp,172
    30ec:	a00ff06f          	j	22ec <_vfprintf_r+0x2c8>
    30f0:	01000713          	li	a4,16
    30f4:	0a412783          	lw	a5,164(sp)
    30f8:	0000cb17          	auipc	s6,0xc
    30fc:	71cb0b13          	add	s6,s6,1820 # f814 <blanks.1>
    3100:	07a75c63          	bge	a4,s10,3178 <_vfprintf_r+0x1154>
    3104:	000b0713          	mv	a4,s6
    3108:	01000c13          	li	s8,16
    310c:	00090b13          	mv	s6,s2
    3110:	00700a13          	li	s4,7
    3114:	00070913          	mv	s2,a4
    3118:	00c0006f          	j	3124 <_vfprintf_r+0x1100>
    311c:	ff0d0d13          	add	s10,s10,-16
    3120:	05ac5663          	bge	s8,s10,316c <_vfprintf_r+0x1148>
    3124:	01048493          	add	s1,s1,16
    3128:	00178793          	add	a5,a5,1
    312c:	01242023          	sw	s2,0(s0)
    3130:	01842223          	sw	s8,4(s0)
    3134:	0a912423          	sw	s1,168(sp)
    3138:	0af12223          	sw	a5,164(sp)
    313c:	00840413          	add	s0,s0,8
    3140:	fcfa5ee3          	bge	s4,a5,311c <_vfprintf_r+0x10f8>
    3144:	00812583          	lw	a1,8(sp)
    3148:	0a010613          	add	a2,sp,160
    314c:	00098513          	mv	a0,s3
    3150:	591010ef          	jal	4ee0 <__sprint_r>
    3154:	ba051063          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    3158:	ff0d0d13          	add	s10,s10,-16
    315c:	0a812483          	lw	s1,168(sp)
    3160:	0a412783          	lw	a5,164(sp)
    3164:	0ac10413          	add	s0,sp,172
    3168:	fbac4ee3          	blt	s8,s10,3124 <_vfprintf_r+0x1100>
    316c:	00090713          	mv	a4,s2
    3170:	000b0913          	mv	s2,s6
    3174:	00070b13          	mv	s6,a4
    3178:	01a484b3          	add	s1,s1,s10
    317c:	00178793          	add	a5,a5,1
    3180:	01642023          	sw	s6,0(s0)
    3184:	01a42223          	sw	s10,4(s0)
    3188:	0a912423          	sw	s1,168(sp)
    318c:	0af12223          	sw	a5,164(sp)
    3190:	00700713          	li	a4,7
    3194:	9af75463          	bge	a4,a5,233c <_vfprintf_r+0x318>
    3198:	00812583          	lw	a1,8(sp)
    319c:	0a010613          	add	a2,sp,160
    31a0:	00098513          	mv	a0,s3
    31a4:	53d010ef          	jal	4ee0 <__sprint_r>
    31a8:	b4051663          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    31ac:	0a812483          	lw	s1,168(sp)
    31b0:	98cff06f          	j	233c <_vfprintf_r+0x318>
    31b4:	07c12683          	lw	a3,124(sp)
    31b8:	30d05c63          	blez	a3,34d0 <_vfprintf_r+0x14ac>
    31bc:	01812783          	lw	a5,24(sp)
    31c0:	000a0b13          	mv	s6,s4
    31c4:	0147d463          	bge	a5,s4,31cc <_vfprintf_r+0x11a8>
    31c8:	00078b13          	mv	s6,a5
    31cc:	03605863          	blez	s6,31fc <_vfprintf_r+0x11d8>
    31d0:	0a412683          	lw	a3,164(sp)
    31d4:	016484b3          	add	s1,s1,s6
    31d8:	01842023          	sw	s8,0(s0)
    31dc:	00168693          	add	a3,a3,1
    31e0:	01642223          	sw	s6,4(s0)
    31e4:	0a912423          	sw	s1,168(sp)
    31e8:	0ad12223          	sw	a3,164(sp)
    31ec:	00700613          	li	a2,7
    31f0:	00840413          	add	s0,s0,8
    31f4:	00d65463          	bge	a2,a3,31fc <_vfprintf_r+0x11d8>
    31f8:	5c40106f          	j	47bc <_vfprintf_r+0x2798>
    31fc:	fffb4693          	not	a3,s6
    3200:	41f6d693          	sra	a3,a3,0x1f
    3204:	00db7733          	and	a4,s6,a3
    3208:	40ea0b33          	sub	s6,s4,a4
    320c:	35604ae3          	bgtz	s6,3d60 <_vfprintf_r+0x1d3c>
    3210:	400ef713          	and	a4,t4,1024
    3214:	014c0333          	add	t1,s8,s4
    3218:	00070463          	beqz	a4,3220 <_vfprintf_r+0x11fc>
    321c:	2980106f          	j	44b4 <_vfprintf_r+0x2490>
    3220:	07c12d03          	lw	s10,124(sp)
    3224:	01812783          	lw	a5,24(sp)
    3228:	5afd4063          	blt	s10,a5,37c8 <_vfprintf_r+0x17a4>
    322c:	001ef713          	and	a4,t4,1
    3230:	58071c63          	bnez	a4,37c8 <_vfprintf_r+0x17a4>
    3234:	01812703          	lw	a4,24(sp)
    3238:	00ec07b3          	add	a5,s8,a4
    323c:	41a70d33          	sub	s10,a4,s10
    3240:	40678b33          	sub	s6,a5,t1
    3244:	016d5463          	bge	s10,s6,324c <_vfprintf_r+0x1228>
    3248:	000d0b13          	mv	s6,s10
    324c:	03605863          	blez	s6,327c <_vfprintf_r+0x1258>
    3250:	0a412703          	lw	a4,164(sp)
    3254:	016484b3          	add	s1,s1,s6
    3258:	00642023          	sw	t1,0(s0)
    325c:	00170713          	add	a4,a4,1
    3260:	01642223          	sw	s6,4(s0)
    3264:	0a912423          	sw	s1,168(sp)
    3268:	0ae12223          	sw	a4,164(sp)
    326c:	00700693          	li	a3,7
    3270:	00840413          	add	s0,s0,8
    3274:	00e6d463          	bge	a3,a4,327c <_vfprintf_r+0x1258>
    3278:	5880106f          	j	4800 <_vfprintf_r+0x27dc>
    327c:	fffb4713          	not	a4,s6
    3280:	41f75713          	sra	a4,a4,0x1f
    3284:	00eb77b3          	and	a5,s6,a4
    3288:	40fd0d33          	sub	s10,s10,a5
    328c:	8ba05063          	blez	s10,232c <_vfprintf_r+0x308>
    3290:	01000713          	li	a4,16
    3294:	0a412783          	lw	a5,164(sp)
    3298:	0000c297          	auipc	t0,0xc
    329c:	56c28293          	add	t0,t0,1388 # f804 <zeroes.0>
    32a0:	23a750e3          	bge	a4,s10,3cc0 <_vfprintf_r+0x1c9c>
    32a4:	00048713          	mv	a4,s1
    32a8:	01000c13          	li	s8,16
    32ac:	00700b13          	li	s6,7
    32b0:	000e8493          	mv	s1,t4
    32b4:	00028a13          	mv	s4,t0
    32b8:	00c0006f          	j	32c4 <_vfprintf_r+0x12a0>
    32bc:	ff0d0d13          	add	s10,s10,-16
    32c0:	1fac5ae3          	bge	s8,s10,3cb4 <_vfprintf_r+0x1c90>
    32c4:	01070713          	add	a4,a4,16
    32c8:	00178793          	add	a5,a5,1
    32cc:	01442023          	sw	s4,0(s0)
    32d0:	01842223          	sw	s8,4(s0)
    32d4:	0ae12423          	sw	a4,168(sp)
    32d8:	0af12223          	sw	a5,164(sp)
    32dc:	00840413          	add	s0,s0,8
    32e0:	fcfb5ee3          	bge	s6,a5,32bc <_vfprintf_r+0x1298>
    32e4:	00812583          	lw	a1,8(sp)
    32e8:	0a010613          	add	a2,sp,160
    32ec:	00098513          	mv	a0,s3
    32f0:	3f1010ef          	jal	4ee0 <__sprint_r>
    32f4:	a0051063          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    32f8:	0a812703          	lw	a4,168(sp)
    32fc:	0a412783          	lw	a5,164(sp)
    3300:	0ac10413          	add	s0,sp,172
    3304:	fb9ff06f          	j	32bc <_vfprintf_r+0x1298>
    3308:	001ef613          	and	a2,t4,1
    330c:	ce061063          	bnez	a2,27ec <_vfprintf_r+0x7c8>
    3310:	00d42223          	sw	a3,4(s0)
    3314:	0a912423          	sw	s1,168(sp)
    3318:	0ba12223          	sw	s10,164(sp)
    331c:	00700793          	li	a5,7
    3320:	d7a7d863          	bge	a5,s10,2890 <_vfprintf_r+0x86c>
    3324:	00812583          	lw	a1,8(sp)
    3328:	0a010613          	add	a2,sp,160
    332c:	00098513          	mv	a0,s3
    3330:	03d12023          	sw	t4,32(sp)
    3334:	3ad010ef          	jal	4ee0 <__sprint_r>
    3338:	9a051e63          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    333c:	0a812483          	lw	s1,168(sp)
    3340:	0a412d03          	lw	s10,164(sp)
    3344:	02012e83          	lw	t4,32(sp)
    3348:	0ac10b13          	add	s6,sp,172
    334c:	d44ff06f          	j	2890 <_vfprintf_r+0x86c>
    3350:	01812703          	lw	a4,24(sp)
    3354:	00100793          	li	a5,1
    3358:	d2e7dc63          	bge	a5,a4,2890 <_vfprintf_r+0x86c>
    335c:	01100793          	li	a5,17
    3360:	0000c297          	auipc	t0,0xc
    3364:	4a428293          	add	t0,t0,1188 # f804 <zeroes.0>
    3368:	18e7d4e3          	bge	a5,a4,3cf0 <_vfprintf_r+0x1ccc>
    336c:	00040a13          	mv	s4,s0
    3370:	01000793          	li	a5,16
    3374:	00700c13          	li	s8,7
    3378:	03d12023          	sw	t4,32(sp)
    337c:	00028413          	mv	s0,t0
    3380:	00c0006f          	j	338c <_vfprintf_r+0x1368>
    3384:	ff0a0a13          	add	s4,s4,-16
    3388:	1547dee3          	bge	a5,s4,3ce4 <_vfprintf_r+0x1cc0>
    338c:	01048493          	add	s1,s1,16
    3390:	001d0d13          	add	s10,s10,1
    3394:	008b2023          	sw	s0,0(s6)
    3398:	00fb2223          	sw	a5,4(s6)
    339c:	0a912423          	sw	s1,168(sp)
    33a0:	0ba12223          	sw	s10,164(sp)
    33a4:	008b0b13          	add	s6,s6,8
    33a8:	fdac5ee3          	bge	s8,s10,3384 <_vfprintf_r+0x1360>
    33ac:	00812583          	lw	a1,8(sp)
    33b0:	0a010613          	add	a2,sp,160
    33b4:	00098513          	mv	a0,s3
    33b8:	329010ef          	jal	4ee0 <__sprint_r>
    33bc:	92051c63          	bnez	a0,24f4 <_vfprintf_r+0x4d0>
    33c0:	0a812483          	lw	s1,168(sp)
    33c4:	0a412d03          	lw	s10,164(sp)
    33c8:	0ac10b13          	add	s6,sp,172
    33cc:	01000793          	li	a5,16
    33d0:	fb5ff06f          	j	3384 <_vfprintf_r+0x1360>
    33d4:	01412703          	lw	a4,20(sp)
    33d8:	010ef793          	and	a5,t4,16
    33dc:	00072d03          	lw	s10,0(a4)
    33e0:	00470713          	add	a4,a4,4
    33e4:	00e12a23          	sw	a4,20(sp)
    33e8:	1a079663          	bnez	a5,3594 <_vfprintf_r+0x1570>
    33ec:	040ef793          	and	a5,t4,64
    33f0:	18078e63          	beqz	a5,358c <_vfprintf_r+0x1568>
    33f4:	010d1d13          	sll	s10,s10,0x10
    33f8:	010d5d13          	srl	s10,s10,0x10
    33fc:	00000c93          	li	s9,0
    3400:	80dff06f          	j	2c0c <_vfprintf_r+0xbe8>
    3404:	01412703          	lw	a4,20(sp)
    3408:	01067793          	and	a5,a2,16
    340c:	00072d03          	lw	s10,0(a4)
    3410:	00470713          	add	a4,a4,4
    3414:	00e12a23          	sw	a4,20(sp)
    3418:	14079a63          	bnez	a5,356c <_vfprintf_r+0x1548>
    341c:	04067793          	and	a5,a2,64
    3420:	14078063          	beqz	a5,3560 <_vfprintf_r+0x153c>
    3424:	010d1d13          	sll	s10,s10,0x10
    3428:	010d5d13          	srl	s10,s10,0x10
    342c:	00000c93          	li	s9,0
    3430:	00100793          	li	a5,1
    3434:	e34ff06f          	j	2a68 <_vfprintf_r+0xa44>
    3438:	01412703          	lw	a4,20(sp)
    343c:	010ef793          	and	a5,t4,16
    3440:	00072d03          	lw	s10,0(a4)
    3444:	00470713          	add	a4,a4,4
    3448:	00e12a23          	sw	a4,20(sp)
    344c:	12079a63          	bnez	a5,3580 <_vfprintf_r+0x155c>
    3450:	040ef793          	and	a5,t4,64
    3454:	12078263          	beqz	a5,3578 <_vfprintf_r+0x1554>
    3458:	010d1d13          	sll	s10,s10,0x10
    345c:	410d5d13          	sra	s10,s10,0x10
    3460:	41fd5c93          	sra	s9,s10,0x1f
    3464:	000c8793          	mv	a5,s9
    3468:	f207d663          	bgez	a5,2b94 <_vfprintf_r+0xb70>
    346c:	01a037b3          	snez	a5,s10
    3470:	419000b3          	neg	ra,s9
    3474:	40f08cb3          	sub	s9,ra,a5
    3478:	41a00d33          	neg	s10,s10
    347c:	000e8613          	mv	a2,t4
    3480:	02d00713          	li	a4,45
    3484:	00100793          	li	a5,1
    3488:	de4ff06f          	j	2a6c <_vfprintf_r+0xa48>
    348c:	00812403          	lw	s0,8(sp)
    3490:	00f12623          	sw	a5,12(sp)
    3494:	05842503          	lw	a0,88(s0)
    3498:	c31fd0ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    349c:	00c41703          	lh	a4,12(s0)
    34a0:	00c12783          	lw	a5,12(sp)
    34a4:	c01fe06f          	j	20a4 <_vfprintf_r+0x80>
    34a8:	001ef793          	and	a5,t4,1
    34ac:	00079463          	bnez	a5,34b4 <_vfprintf_r+0x1490>
    34b0:	e7dfe06f          	j	232c <_vfprintf_r+0x308>
    34b4:	85dff06f          	j	2d10 <_vfprintf_r+0xcec>
    34b8:	000a0e93          	mv	t4,s4
    34bc:	000b0313          	mv	t1,s6
    34c0:	ea8ff06f          	j	2b68 <_vfprintf_r+0xb44>
    34c4:	00094e03          	lbu	t3,0(s2)
    34c8:	00f12a23          	sw	a5,20(sp)
    34cc:	d09fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    34d0:	0a412703          	lw	a4,164(sp)
    34d4:	0000c617          	auipc	a2,0xc
    34d8:	e7860613          	add	a2,a2,-392 # f34c <__fini_array_end+0x2d8>
    34dc:	00c42023          	sw	a2,0(s0)
    34e0:	00148493          	add	s1,s1,1
    34e4:	00100613          	li	a2,1
    34e8:	00170713          	add	a4,a4,1
    34ec:	00c42223          	sw	a2,4(s0)
    34f0:	0a912423          	sw	s1,168(sp)
    34f4:	0ae12223          	sw	a4,164(sp)
    34f8:	00700613          	li	a2,7
    34fc:	00840413          	add	s0,s0,8
    3500:	2ee64ce3          	blt	a2,a4,3ff8 <_vfprintf_r+0x1fd4>
    3504:	7e069e63          	bnez	a3,3d00 <_vfprintf_r+0x1cdc>
    3508:	01812783          	lw	a5,24(sp)
    350c:	001ef713          	and	a4,t4,1
    3510:	00f76733          	or	a4,a4,a5
    3514:	00071463          	bnez	a4,351c <_vfprintf_r+0x14f8>
    3518:	e15fe06f          	j	232c <_vfprintf_r+0x308>
    351c:	03412703          	lw	a4,52(sp)
    3520:	03012783          	lw	a5,48(sp)
    3524:	00700693          	li	a3,7
    3528:	00e42023          	sw	a4,0(s0)
    352c:	0a412703          	lw	a4,164(sp)
    3530:	009784b3          	add	s1,a5,s1
    3534:	00f42223          	sw	a5,4(s0)
    3538:	00170713          	add	a4,a4,1
    353c:	0a912423          	sw	s1,168(sp)
    3540:	0ae12223          	sw	a4,164(sp)
    3544:	38e6c8e3          	blt	a3,a4,40d4 <_vfprintf_r+0x20b0>
    3548:	00840413          	add	s0,s0,8
    354c:	7e80006f          	j	3d34 <_vfprintf_r+0x1d10>
    3550:	03000793          	li	a5,48
    3554:	14f107a3          	sb	a5,335(sp)
    3558:	14f10c13          	add	s8,sp,335
    355c:	d38ff06f          	j	2a94 <_vfprintf_r+0xa70>
    3560:	20067793          	and	a5,a2,512
    3564:	00078463          	beqz	a5,356c <_vfprintf_r+0x1548>
    3568:	0ffd7d13          	zext.b	s10,s10
    356c:	00000c93          	li	s9,0
    3570:	00100793          	li	a5,1
    3574:	cf4ff06f          	j	2a68 <_vfprintf_r+0xa44>
    3578:	200ef793          	and	a5,t4,512
    357c:	2c0796e3          	bnez	a5,4048 <_vfprintf_r+0x2024>
    3580:	41fd5c93          	sra	s9,s10,0x1f
    3584:	000c8793          	mv	a5,s9
    3588:	e08ff06f          	j	2b90 <_vfprintf_r+0xb6c>
    358c:	200ef793          	and	a5,t4,512
    3590:	2a0790e3          	bnez	a5,4030 <_vfprintf_r+0x200c>
    3594:	00000c93          	li	s9,0
    3598:	e74ff06f          	j	2c0c <_vfprintf_r+0xbe8>
    359c:	01412783          	lw	a5,20(sp)
    35a0:	06010513          	add	a0,sp,96
    35a4:	03612223          	sw	s6,36(sp)
    35a8:	0007a703          	lw	a4,0(a5)
    35ac:	03c12023          	sw	t3,32(sp)
    35b0:	00478b13          	add	s6,a5,4
    35b4:	00072683          	lw	a3,0(a4)
    35b8:	01412823          	sw	s4,16(sp)
    35bc:	06d12023          	sw	a3,96(sp)
    35c0:	00472683          	lw	a3,4(a4)
    35c4:	06d12223          	sw	a3,100(sp)
    35c8:	00872683          	lw	a3,8(a4)
    35cc:	06d12423          	sw	a3,104(sp)
    35d0:	00c72703          	lw	a4,12(a4)
    35d4:	06e12623          	sw	a4,108(sp)
    35d8:	4c80b0ef          	jal	eaa0 <__trunctfdf2>
    35dc:	02012e03          	lw	t3,32(sp)
    35e0:	02412303          	lw	t1,36(sp)
    35e4:	02a12423          	sw	a0,40(sp)
    35e8:	02b12623          	sw	a1,44(sp)
    35ec:	01612a23          	sw	s6,20(sp)
    35f0:	000a0e93          	mv	t4,s4
    35f4:	fb1fe06f          	j	25a4 <_vfprintf_r+0x580>
    35f8:	010a7793          	and	a5,s4,16
    35fc:	6c079a63          	bnez	a5,3cd0 <_vfprintf_r+0x1cac>
    3600:	040a7793          	and	a5,s4,64
    3604:	24079ce3          	bnez	a5,405c <_vfprintf_r+0x2038>
    3608:	200a7f13          	and	t5,s4,512
    360c:	6c0f0263          	beqz	t5,3cd0 <_vfprintf_r+0x1cac>
    3610:	01412783          	lw	a5,20(sp)
    3614:	00c12703          	lw	a4,12(sp)
    3618:	0007a783          	lw	a5,0(a5)
    361c:	00e78023          	sb	a4,0(a5)
    3620:	e6cff06f          	j	2c8c <_vfprintf_r+0xc68>
    3624:	03c12783          	lw	a5,60(sp)
    3628:	00094e03          	lbu	t3,0(s2)
    362c:	00079463          	bnez	a5,3634 <_vfprintf_r+0x1610>
    3630:	ba5fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    3634:	0007c783          	lbu	a5,0(a5)
    3638:	00079463          	bnez	a5,3640 <_vfprintf_r+0x161c>
    363c:	b99fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    3640:	400a6a13          	or	s4,s4,1024
    3644:	b91fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    3648:	fff00b13          	li	s6,-1
    364c:	00068913          	mv	s2,a3
    3650:	b89fe06f          	j	21d8 <_vfprintf_r+0x1b4>
    3654:	0000c797          	auipc	a5,0xc
    3658:	cdc78793          	add	a5,a5,-804 # f330 <__fini_array_end+0x2bc>
    365c:	000a0e93          	mv	t4,s4
    3660:	000b0313          	mv	t1,s6
    3664:	02f12c23          	sw	a5,56(sp)
    3668:	020ef793          	and	a5,t4,32
    366c:	1c078263          	beqz	a5,3830 <_vfprintf_r+0x180c>
    3670:	01412783          	lw	a5,20(sp)
    3674:	00778b13          	add	s6,a5,7
    3678:	ff8b7b13          	and	s6,s6,-8
    367c:	000b2d03          	lw	s10,0(s6)
    3680:	004b2c83          	lw	s9,4(s6)
    3684:	008b0793          	add	a5,s6,8
    3688:	00f12a23          	sw	a5,20(sp)
    368c:	001ef793          	and	a5,t4,1
    3690:	00078e63          	beqz	a5,36ac <_vfprintf_r+0x1688>
    3694:	019d67b3          	or	a5,s10,s9
    3698:	00078a63          	beqz	a5,36ac <_vfprintf_r+0x1688>
    369c:	03000793          	li	a5,48
    36a0:	06f10c23          	sb	a5,120(sp)
    36a4:	07c10ca3          	sb	t3,121(sp)
    36a8:	002eee93          	or	t4,t4,2
    36ac:	bffef613          	and	a2,t4,-1025
    36b0:	00200793          	li	a5,2
    36b4:	bb4ff06f          	j	2a68 <_vfprintf_r+0xa44>
    36b8:	000b0313          	mv	t1,s6
    36bc:	000a0613          	mv	a2,s4
    36c0:	b80ff06f          	j	2a40 <_vfprintf_r+0xa1c>
    36c4:	000a0e93          	mv	t4,s4
    36c8:	000b0313          	mv	t1,s6
    36cc:	d1cff06f          	j	2be8 <_vfprintf_r+0xbc4>
    36d0:	0000c797          	auipc	a5,0xc
    36d4:	c4c78793          	add	a5,a5,-948 # f31c <__fini_array_end+0x2a8>
    36d8:	000a0e93          	mv	t4,s4
    36dc:	000b0313          	mv	t1,s6
    36e0:	02f12c23          	sw	a5,56(sp)
    36e4:	f85ff06f          	j	3668 <_vfprintf_r+0x1644>
    36e8:	00194e03          	lbu	t3,1(s2)
    36ec:	020a6a13          	or	s4,s4,32
    36f0:	00190913          	add	s2,s2,1
    36f4:	ae1fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    36f8:	00194e03          	lbu	t3,1(s2)
    36fc:	200a6a13          	or	s4,s4,512
    3700:	00190913          	add	s2,s2,1
    3704:	ad1fe06f          	j	21d4 <_vfprintf_r+0x1b0>
    3708:	00812583          	lw	a1,8(sp)
    370c:	0a010613          	add	a2,sp,160
    3710:	00098513          	mv	a0,s3
    3714:	03d12023          	sw	t4,32(sp)
    3718:	7c8010ef          	jal	4ee0 <__sprint_r>
    371c:	00050463          	beqz	a0,3724 <_vfprintf_r+0x1700>
    3720:	dd5fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3724:	0a812483          	lw	s1,168(sp)
    3728:	02012e83          	lw	t4,32(sp)
    372c:	0ac10413          	add	s0,sp,172
    3730:	e10ff06f          	j	2d40 <_vfprintf_r+0xd1c>
    3734:	00600793          	li	a5,6
    3738:	00030c93          	mv	s9,t1
    373c:	0e67e6e3          	bltu	a5,t1,4028 <_vfprintf_r+0x2004>
    3740:	01612a23          	sw	s6,20(sp)
    3744:	00012823          	sw	zero,16(sp)
    3748:	000c8d13          	mv	s10,s9
    374c:	00000613          	li	a2,0
    3750:	00000313          	li	t1,0
    3754:	02012223          	sw	zero,36(sp)
    3758:	02012023          	sw	zero,32(sp)
    375c:	00000a13          	li	s4,0
    3760:	0000cc17          	auipc	s8,0xc
    3764:	be4c0c13          	add	s8,s8,-1052 # f344 <__fini_array_end+0x2d0>
    3768:	afdfe06f          	j	2264 <_vfprintf_r+0x240>
    376c:	00800613          	li	a2,8
    3770:	00000593          	li	a1,0
    3774:	09810513          	add	a0,sp,152
    3778:	03c12023          	sw	t3,32(sp)
    377c:	01d12823          	sw	t4,16(sp)
    3780:	951fd0ef          	jal	10d0 <memset>
    3784:	01412783          	lw	a5,20(sp)
    3788:	0ec10c13          	add	s8,sp,236
    378c:	09810693          	add	a3,sp,152
    3790:	0007a603          	lw	a2,0(a5)
    3794:	000c0593          	mv	a1,s8
    3798:	00098513          	mv	a0,s3
    379c:	530070ef          	jal	accc <_wcrtomb_r>
    37a0:	fff00793          	li	a5,-1
    37a4:	01012e83          	lw	t4,16(sp)
    37a8:	02012e03          	lw	t3,32(sp)
    37ac:	00050d13          	mv	s10,a0
    37b0:	00f51463          	bne	a0,a5,37b8 <_vfprintf_r+0x1794>
    37b4:	4980106f          	j	4c4c <_vfprintf_r+0x2c28>
    37b8:	fff54813          	not	a6,a0
    37bc:	41f85813          	sra	a6,a6,0x1f
    37c0:	01057cb3          	and	s9,a0,a6
    37c4:	97cff06f          	j	2940 <_vfprintf_r+0x91c>
    37c8:	03412703          	lw	a4,52(sp)
    37cc:	03012783          	lw	a5,48(sp)
    37d0:	00700693          	li	a3,7
    37d4:	00e42023          	sw	a4,0(s0)
    37d8:	0a412703          	lw	a4,164(sp)
    37dc:	00f484b3          	add	s1,s1,a5
    37e0:	00f42223          	sw	a5,4(s0)
    37e4:	00170713          	add	a4,a4,1
    37e8:	0a912423          	sw	s1,168(sp)
    37ec:	0ae12223          	sw	a4,164(sp)
    37f0:	00840413          	add	s0,s0,8
    37f4:	a4e6d0e3          	bge	a3,a4,3234 <_vfprintf_r+0x1210>
    37f8:	00812583          	lw	a1,8(sp)
    37fc:	0a010613          	add	a2,sp,160
    3800:	00098513          	mv	a0,s3
    3804:	02612223          	sw	t1,36(sp)
    3808:	03d12023          	sw	t4,32(sp)
    380c:	6d4010ef          	jal	4ee0 <__sprint_r>
    3810:	00050463          	beqz	a0,3818 <_vfprintf_r+0x17f4>
    3814:	ce1fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3818:	07c12d03          	lw	s10,124(sp)
    381c:	0a812483          	lw	s1,168(sp)
    3820:	02412303          	lw	t1,36(sp)
    3824:	02012e83          	lw	t4,32(sp)
    3828:	0ac10413          	add	s0,sp,172
    382c:	a09ff06f          	j	3234 <_vfprintf_r+0x1210>
    3830:	01412703          	lw	a4,20(sp)
    3834:	010ef793          	and	a5,t4,16
    3838:	00072d03          	lw	s10,0(a4)
    383c:	00470713          	add	a4,a4,4
    3840:	00e12a23          	sw	a4,20(sp)
    3844:	08079863          	bnez	a5,38d4 <_vfprintf_r+0x18b0>
    3848:	040ef793          	and	a5,t4,64
    384c:	08078063          	beqz	a5,38cc <_vfprintf_r+0x18a8>
    3850:	010d1d13          	sll	s10,s10,0x10
    3854:	010d5d13          	srl	s10,s10,0x10
    3858:	00000c93          	li	s9,0
    385c:	e31ff06f          	j	368c <_vfprintf_r+0x1668>
    3860:	00000d13          	li	s10,0
    3864:	15010c13          	add	s8,sp,336
    3868:	a2cff06f          	j	2a94 <_vfprintf_r+0xa70>
    386c:	00812583          	lw	a1,8(sp)
    3870:	0a010613          	add	a2,sp,160
    3874:	00098513          	mv	a0,s3
    3878:	03d12023          	sw	t4,32(sp)
    387c:	664010ef          	jal	4ee0 <__sprint_r>
    3880:	00050463          	beqz	a0,3888 <_vfprintf_r+0x1864>
    3884:	c71fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3888:	0a812483          	lw	s1,168(sp)
    388c:	0a412d03          	lw	s10,164(sp)
    3890:	02012e83          	lw	t4,32(sp)
    3894:	0ac10b13          	add	s6,sp,172
    3898:	f71fe06f          	j	2808 <_vfprintf_r+0x7e4>
    389c:	00812583          	lw	a1,8(sp)
    38a0:	0a010613          	add	a2,sp,160
    38a4:	00098513          	mv	a0,s3
    38a8:	03d12023          	sw	t4,32(sp)
    38ac:	634010ef          	jal	4ee0 <__sprint_r>
    38b0:	00050463          	beqz	a0,38b8 <_vfprintf_r+0x1894>
    38b4:	c41fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    38b8:	0a812483          	lw	s1,168(sp)
    38bc:	0a412d03          	lw	s10,164(sp)
    38c0:	02012e83          	lw	t4,32(sp)
    38c4:	0ac10b13          	add	s6,sp,172
    38c8:	f71fe06f          	j	2838 <_vfprintf_r+0x814>
    38cc:	200ef793          	and	a5,t4,512
    38d0:	76079663          	bnez	a5,403c <_vfprintf_r+0x2018>
    38d4:	00000c93          	li	s9,0
    38d8:	db5ff06f          	j	368c <_vfprintf_r+0x1668>
    38dc:	00000793          	li	a5,0
    38e0:	15010b13          	add	s6,sp,336
    38e4:	01212823          	sw	s2,16(sp)
    38e8:	00078913          	mv	s2,a5
    38ec:	00098793          	mv	a5,s3
    38f0:	04812823          	sw	s0,80(sp)
    38f4:	000b0993          	mv	s3,s6
    38f8:	03c12403          	lw	s0,60(sp)
    38fc:	40067493          	and	s1,a2,1024
    3900:	0ff00a13          	li	s4,255
    3904:	03c12023          	sw	t3,32(sp)
    3908:	02c12223          	sw	a2,36(sp)
    390c:	04612223          	sw	t1,68(sp)
    3910:	00078b13          	mv	s6,a5
    3914:	0280006f          	j	393c <_vfprintf_r+0x1918>
    3918:	00a00613          	li	a2,10
    391c:	00000693          	li	a3,0
    3920:	000d0513          	mv	a0,s10
    3924:	000c8593          	mv	a1,s9
    3928:	581070ef          	jal	b6a8 <__udivdi3>
    392c:	6a0c8ee3          	beqz	s9,47e8 <_vfprintf_r+0x27c4>
    3930:	00050d13          	mv	s10,a0
    3934:	00058c93          	mv	s9,a1
    3938:	000c0993          	mv	s3,s8
    393c:	00a00613          	li	a2,10
    3940:	00000693          	li	a3,0
    3944:	000d0513          	mv	a0,s10
    3948:	000c8593          	mv	a1,s9
    394c:	408080ef          	jal	bd54 <__umoddi3>
    3950:	03050513          	add	a0,a0,48
    3954:	fea98fa3          	sb	a0,-1(s3)
    3958:	fff98c13          	add	s8,s3,-1
    395c:	00190913          	add	s2,s2,1
    3960:	fa048ce3          	beqz	s1,3918 <_vfprintf_r+0x18f4>
    3964:	00044783          	lbu	a5,0(s0)
    3968:	faf918e3          	bne	s2,a5,3918 <_vfprintf_r+0x18f4>
    396c:	fb4906e3          	beq	s2,s4,3918 <_vfprintf_r+0x18f4>
    3970:	560c9ae3          	bnez	s9,46e4 <_vfprintf_r+0x26c0>
    3974:	00900793          	li	a5,9
    3978:	57a7e6e3          	bltu	a5,s10,46e4 <_vfprintf_r+0x26c0>
    397c:	02412603          	lw	a2,36(sp)
    3980:	15010793          	add	a5,sp,336
    3984:	02812e23          	sw	s0,60(sp)
    3988:	01212c23          	sw	s2,24(sp)
    398c:	02012e03          	lw	t3,32(sp)
    3990:	01012903          	lw	s2,16(sp)
    3994:	04412303          	lw	t1,68(sp)
    3998:	05012403          	lw	s0,80(sp)
    399c:	000b0993          	mv	s3,s6
    39a0:	41878d33          	sub	s10,a5,s8
    39a4:	00060e93          	mv	t4,a2
    39a8:	8ecff06f          	j	2a94 <_vfprintf_r+0xa70>
    39ac:	00812583          	lw	a1,8(sp)
    39b0:	0a010613          	add	a2,sp,160
    39b4:	00098513          	mv	a0,s3
    39b8:	04612e23          	sw	t1,92(sp)
    39bc:	05c12c23          	sw	t3,88(sp)
    39c0:	05d12a23          	sw	t4,84(sp)
    39c4:	05f12823          	sw	t6,80(sp)
    39c8:	04512223          	sw	t0,68(sp)
    39cc:	514010ef          	jal	4ee0 <__sprint_r>
    39d0:	00050463          	beqz	a0,39d8 <_vfprintf_r+0x19b4>
    39d4:	b21fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    39d8:	07714603          	lbu	a2,119(sp)
    39dc:	0a812483          	lw	s1,168(sp)
    39e0:	05c12303          	lw	t1,92(sp)
    39e4:	05812e03          	lw	t3,88(sp)
    39e8:	05412e83          	lw	t4,84(sp)
    39ec:	05012f83          	lw	t6,80(sp)
    39f0:	04412283          	lw	t0,68(sp)
    39f4:	0ac10413          	add	s0,sp,172
    39f8:	88dfe06f          	j	2284 <_vfprintf_r+0x260>
    39fc:	02812883          	lw	a7,40(sp)
    3a00:	02c12703          	lw	a4,44(sp)
    3a04:	02612223          	sw	t1,36(sp)
    3a08:	00088613          	mv	a2,a7
    3a0c:	00088513          	mv	a0,a7
    3a10:	00070693          	mv	a3,a4
    3a14:	00070593          	mv	a1,a4
    3a18:	03c12023          	sw	t3,32(sp)
    3a1c:	01d12823          	sw	t4,16(sp)
    3a20:	62d0a0ef          	jal	e84c <__unorddf2>
    3a24:	01012e83          	lw	t4,16(sp)
    3a28:	02012e03          	lw	t3,32(sp)
    3a2c:	02412303          	lw	t1,36(sp)
    3a30:	00050463          	beqz	a0,3a38 <_vfprintf_r+0x1a14>
    3a34:	0e00106f          	j	4b14 <_vfprintf_r+0x2af0>
    3a38:	06100713          	li	a4,97
    3a3c:	08ee0263          	beq	t3,a4,3ac0 <_vfprintf_r+0x1a9c>
    3a40:	04100713          	li	a4,65
    3a44:	05800793          	li	a5,88
    3a48:	06ee0e63          	beq	t3,a4,3ac4 <_vfprintf_r+0x1aa0>
    3a4c:	fff00713          	li	a4,-1
    3a50:	00e31463          	bne	t1,a4,3a58 <_vfprintf_r+0x1a34>
    3a54:	01c0106f          	j	4a70 <_vfprintf_r+0x2a4c>
    3a58:	fdfe7713          	and	a4,t3,-33
    3a5c:	04700693          	li	a3,71
    3a60:	00012823          	sw	zero,16(sp)
    3a64:	00d71663          	bne	a4,a3,3a70 <_vfprintf_r+0x1a4c>
    3a68:	00031463          	bnez	t1,3a70 <_vfprintf_r+0x1a4c>
    3a6c:	00100313          	li	t1,1
    3a70:	100ee793          	or	a5,t4,256
    3a74:	00078b13          	mv	s6,a5
    3a78:	02c12783          	lw	a5,44(sp)
    3a7c:	04012223          	sw	zero,68(sp)
    3a80:	00078493          	mv	s1,a5
    3a84:	0007da63          	bgez	a5,3a98 <_vfprintf_r+0x1a74>
    3a88:	800004b7          	lui	s1,0x80000
    3a8c:	00f4c4b3          	xor	s1,s1,a5
    3a90:	02d00793          	li	a5,45
    3a94:	04f12223          	sw	a5,68(sp)
    3a98:	fbfe0713          	add	a4,t3,-65
    3a9c:	02500693          	li	a3,37
    3aa0:	3ae6e463          	bltu	a3,a4,3e48 <_vfprintf_r+0x1e24>
    3aa4:	0000c697          	auipc	a3,0xc
    3aa8:	cc868693          	add	a3,a3,-824 # f76c <_ctype_+0x270>
    3aac:	00271713          	sll	a4,a4,0x2
    3ab0:	00d70733          	add	a4,a4,a3
    3ab4:	00072703          	lw	a4,0(a4)
    3ab8:	00d70733          	add	a4,a4,a3
    3abc:	00070067          	jr	a4
    3ac0:	07800793          	li	a5,120
    3ac4:	03000713          	li	a4,48
    3ac8:	06e10c23          	sb	a4,120(sp)
    3acc:	06f10ca3          	sb	a5,121(sp)
    3ad0:	06300713          	li	a4,99
    3ad4:	00012823          	sw	zero,16(sp)
    3ad8:	002eee93          	or	t4,t4,2
    3adc:	0ec10c13          	add	s8,sp,236
    3ae0:	f86758e3          	bge	a4,t1,3a70 <_vfprintf_r+0x1a4c>
    3ae4:	00130593          	add	a1,t1,1
    3ae8:	00098513          	mv	a0,s3
    3aec:	03c12023          	sw	t3,32(sp)
    3af0:	01d12c23          	sw	t4,24(sp)
    3af4:	00612823          	sw	t1,16(sp)
    3af8:	d35fd0ef          	jal	182c <_malloc_r>
    3afc:	01012303          	lw	t1,16(sp)
    3b00:	01812e83          	lw	t4,24(sp)
    3b04:	02012e03          	lw	t3,32(sp)
    3b08:	00050c13          	mv	s8,a0
    3b0c:	00051463          	bnez	a0,3b14 <_vfprintf_r+0x1af0>
    3b10:	13c0106f          	j	4c4c <_vfprintf_r+0x2c28>
    3b14:	00a12823          	sw	a0,16(sp)
    3b18:	f59ff06f          	j	3a70 <_vfprintf_r+0x1a4c>
    3b1c:	00098513          	mv	a0,s3
    3b20:	1d0030ef          	jal	6cf0 <__sinit>
    3b24:	00c12783          	lw	a5,12(sp)
    3b28:	d5cfe06f          	j	2084 <_vfprintf_r+0x60>
    3b2c:	00812583          	lw	a1,8(sp)
    3b30:	0a010613          	add	a2,sp,160
    3b34:	00098513          	mv	a0,s3
    3b38:	03d12023          	sw	t4,32(sp)
    3b3c:	3a4010ef          	jal	4ee0 <__sprint_r>
    3b40:	00050463          	beqz	a0,3b48 <_vfprintf_r+0x1b24>
    3b44:	9b1fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3b48:	0a812483          	lw	s1,168(sp)
    3b4c:	02012e83          	lw	t4,32(sp)
    3b50:	0ac10413          	add	s0,sp,172
    3b54:	9b0ff06f          	j	2d04 <_vfprintf_r+0xce0>
    3b58:	00800613          	li	a2,8
    3b5c:	00000593          	li	a1,0
    3b60:	09810513          	add	a0,sp,152
    3b64:	02612023          	sw	t1,32(sp)
    3b68:	01c12a23          	sw	t3,20(sp)
    3b6c:	01d12823          	sw	t4,16(sp)
    3b70:	09812223          	sw	s8,132(sp)
    3b74:	d5cfd0ef          	jal	10d0 <memset>
    3b78:	02012303          	lw	t1,32(sp)
    3b7c:	01012e83          	lw	t4,16(sp)
    3b80:	01412e03          	lw	t3,20(sp)
    3b84:	3a0340e3          	bltz	t1,4724 <_vfprintf_r+0x2700>
    3b88:	00000d13          	li	s10,0
    3b8c:	01212823          	sw	s2,16(sp)
    3b90:	000c0c93          	mv	s9,s8
    3b94:	fff00493          	li	s1,-1
    3b98:	000b0c13          	mv	s8,s6
    3b9c:	000e8a13          	mv	s4,t4
    3ba0:	00040b13          	mv	s6,s0
    3ba4:	000d0913          	mv	s2,s10
    3ba8:	00030413          	mv	s0,t1
    3bac:	0300006f          	j	3bdc <_vfprintf_r+0x1bb8>
    3bb0:	09810693          	add	a3,sp,152
    3bb4:	0ec10593          	add	a1,sp,236
    3bb8:	00098513          	mv	a0,s3
    3bbc:	110070ef          	jal	accc <_wcrtomb_r>
    3bc0:	68950ae3          	beq	a0,s1,4a54 <_vfprintf_r+0x2a30>
    3bc4:	00a907b3          	add	a5,s2,a0
    3bc8:	02f44263          	blt	s0,a5,3bec <_vfprintf_r+0x1bc8>
    3bcc:	004d0d13          	add	s10,s10,4
    3bd0:	00879463          	bne	a5,s0,3bd8 <_vfprintf_r+0x1bb4>
    3bd4:	7990006f          	j	4b6c <_vfprintf_r+0x2b48>
    3bd8:	00078913          	mv	s2,a5
    3bdc:	08412783          	lw	a5,132(sp)
    3be0:	01a787b3          	add	a5,a5,s10
    3be4:	0007a603          	lw	a2,0(a5)
    3be8:	fc0614e3          	bnez	a2,3bb0 <_vfprintf_r+0x1b8c>
    3bec:	00090d13          	mv	s10,s2
    3bf0:	01412e03          	lw	t3,20(sp)
    3bf4:	01012903          	lw	s2,16(sp)
    3bf8:	000b0413          	mv	s0,s6
    3bfc:	000a0e93          	mv	t4,s4
    3c00:	000c0b13          	mv	s6,s8
    3c04:	000c8c13          	mv	s8,s9
    3c08:	340d0ce3          	beqz	s10,4760 <_vfprintf_r+0x273c>
    3c0c:	06300793          	li	a5,99
    3c10:	59a7dee3          	bge	a5,s10,49ac <_vfprintf_r+0x2988>
    3c14:	001d0593          	add	a1,s10,1
    3c18:	00098513          	mv	a0,s3
    3c1c:	01c12a23          	sw	t3,20(sp)
    3c20:	01d12823          	sw	t4,16(sp)
    3c24:	c09fd0ef          	jal	182c <_malloc_r>
    3c28:	01012e83          	lw	t4,16(sp)
    3c2c:	01412e03          	lw	t3,20(sp)
    3c30:	00050c13          	mv	s8,a0
    3c34:	620500e3          	beqz	a0,4a54 <_vfprintf_r+0x2a30>
    3c38:	00a12823          	sw	a0,16(sp)
    3c3c:	00800613          	li	a2,8
    3c40:	00000593          	li	a1,0
    3c44:	09810513          	add	a0,sp,152
    3c48:	03c12023          	sw	t3,32(sp)
    3c4c:	01d12a23          	sw	t4,20(sp)
    3c50:	c80fd0ef          	jal	10d0 <memset>
    3c54:	09810713          	add	a4,sp,152
    3c58:	000d0693          	mv	a3,s10
    3c5c:	08410613          	add	a2,sp,132
    3c60:	000c0593          	mv	a1,s8
    3c64:	00098513          	mv	a0,s3
    3c68:	0f0070ef          	jal	ad58 <_wcsrtombs_r>
    3c6c:	01412e83          	lw	t4,20(sp)
    3c70:	02012e03          	lw	t3,32(sp)
    3c74:	00ad0463          	beq	s10,a0,3c7c <_vfprintf_r+0x1c58>
    3c78:	0240106f          	j	4c9c <_vfprintf_r+0x2c78>
    3c7c:	01ac0733          	add	a4,s8,s10
    3c80:	00070023          	sb	zero,0(a4)
    3c84:	07714603          	lbu	a2,119(sp)
    3c88:	fffd4813          	not	a6,s10
    3c8c:	41f85813          	sra	a6,a6,0x1f
    3c90:	01612a23          	sw	s6,20(sp)
    3c94:	02012223          	sw	zero,36(sp)
    3c98:	02012023          	sw	zero,32(sp)
    3c9c:	010d7cb3          	and	s9,s10,a6
    3ca0:	00000313          	li	t1,0
    3ca4:	00000a13          	li	s4,0
    3ca8:	00061463          	bnez	a2,3cb0 <_vfprintf_r+0x1c8c>
    3cac:	db8fe06f          	j	2264 <_vfprintf_r+0x240>
    3cb0:	9d5fe06f          	j	2684 <_vfprintf_r+0x660>
    3cb4:	00048e93          	mv	t4,s1
    3cb8:	000a0293          	mv	t0,s4
    3cbc:	00070493          	mv	s1,a4
    3cc0:	01a484b3          	add	s1,s1,s10
    3cc4:	00178793          	add	a5,a5,1
    3cc8:	00542023          	sw	t0,0(s0)
    3ccc:	e48fe06f          	j	2314 <_vfprintf_r+0x2f0>
    3cd0:	01412783          	lw	a5,20(sp)
    3cd4:	00c12703          	lw	a4,12(sp)
    3cd8:	0007a783          	lw	a5,0(a5)
    3cdc:	00e7a023          	sw	a4,0(a5)
    3ce0:	fadfe06f          	j	2c8c <_vfprintf_r+0xc68>
    3ce4:	02012e83          	lw	t4,32(sp)
    3ce8:	00040293          	mv	t0,s0
    3cec:	000a0413          	mv	s0,s4
    3cf0:	008484b3          	add	s1,s1,s0
    3cf4:	001d0d13          	add	s10,s10,1
    3cf8:	005b2023          	sw	t0,0(s6)
    3cfc:	b7dfe06f          	j	2878 <_vfprintf_r+0x854>
    3d00:	03412703          	lw	a4,52(sp)
    3d04:	03012783          	lw	a5,48(sp)
    3d08:	00700613          	li	a2,7
    3d0c:	00e42023          	sw	a4,0(s0)
    3d10:	0a412703          	lw	a4,164(sp)
    3d14:	009784b3          	add	s1,a5,s1
    3d18:	00f42223          	sw	a5,4(s0)
    3d1c:	00170713          	add	a4,a4,1
    3d20:	0a912423          	sw	s1,168(sp)
    3d24:	0ae12223          	sw	a4,164(sp)
    3d28:	00840413          	add	s0,s0,8
    3d2c:	3ae64463          	blt	a2,a4,40d4 <_vfprintf_r+0x20b0>
    3d30:	3e06cee3          	bltz	a3,492c <_vfprintf_r+0x2908>
    3d34:	01812783          	lw	a5,24(sp)
    3d38:	00170713          	add	a4,a4,1
    3d3c:	01842023          	sw	s8,0(s0)
    3d40:	009784b3          	add	s1,a5,s1
    3d44:	00f42223          	sw	a5,4(s0)
    3d48:	0a912423          	sw	s1,168(sp)
    3d4c:	0ae12223          	sw	a4,164(sp)
    3d50:	00700793          	li	a5,7
    3d54:	00e7c463          	blt	a5,a4,3d5c <_vfprintf_r+0x1d38>
    3d58:	dd0fe06f          	j	2328 <_vfprintf_r+0x304>
    3d5c:	b61fe06f          	j	28bc <_vfprintf_r+0x898>
    3d60:	01000613          	li	a2,16
    3d64:	0a412683          	lw	a3,164(sp)
    3d68:	0000c297          	auipc	t0,0xc
    3d6c:	a9c28293          	add	t0,t0,-1380 # f804 <zeroes.0>
    3d70:	09665463          	bge	a2,s6,3df8 <_vfprintf_r+0x1dd4>
    3d74:	00040793          	mv	a5,s0
    3d78:	00048713          	mv	a4,s1
    3d7c:	00812403          	lw	s0,8(sp)
    3d80:	01000893          	li	a7,16
    3d84:	00700d13          	li	s10,7
    3d88:	05d12223          	sw	t4,68(sp)
    3d8c:	00028493          	mv	s1,t0
    3d90:	00c0006f          	j	3d9c <_vfprintf_r+0x1d78>
    3d94:	ff0b0b13          	add	s6,s6,-16
    3d98:	0568d863          	bge	a7,s6,3de8 <_vfprintf_r+0x1dc4>
    3d9c:	01070713          	add	a4,a4,16
    3da0:	00168693          	add	a3,a3,1
    3da4:	0097a023          	sw	s1,0(a5)
    3da8:	0117a223          	sw	a7,4(a5)
    3dac:	0ae12423          	sw	a4,168(sp)
    3db0:	0ad12223          	sw	a3,164(sp)
    3db4:	00878793          	add	a5,a5,8
    3db8:	fcdd5ee3          	bge	s10,a3,3d94 <_vfprintf_r+0x1d70>
    3dbc:	0a010613          	add	a2,sp,160
    3dc0:	00040593          	mv	a1,s0
    3dc4:	00098513          	mv	a0,s3
    3dc8:	118010ef          	jal	4ee0 <__sprint_r>
    3dcc:	00050463          	beqz	a0,3dd4 <_vfprintf_r+0x1db0>
    3dd0:	f24fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3dd4:	0a812703          	lw	a4,168(sp)
    3dd8:	0a412683          	lw	a3,164(sp)
    3ddc:	0ac10793          	add	a5,sp,172
    3de0:	01000893          	li	a7,16
    3de4:	fb1ff06f          	j	3d94 <_vfprintf_r+0x1d70>
    3de8:	04412e83          	lw	t4,68(sp)
    3dec:	00048293          	mv	t0,s1
    3df0:	00078413          	mv	s0,a5
    3df4:	00070493          	mv	s1,a4
    3df8:	016484b3          	add	s1,s1,s6
    3dfc:	00168693          	add	a3,a3,1
    3e00:	00542023          	sw	t0,0(s0)
    3e04:	01642223          	sw	s6,4(s0)
    3e08:	0a912423          	sw	s1,168(sp)
    3e0c:	0ad12223          	sw	a3,164(sp)
    3e10:	00700713          	li	a4,7
    3e14:	00840413          	add	s0,s0,8
    3e18:	bed75c63          	bge	a4,a3,3210 <_vfprintf_r+0x11ec>
    3e1c:	00812583          	lw	a1,8(sp)
    3e20:	0a010613          	add	a2,sp,160
    3e24:	00098513          	mv	a0,s3
    3e28:	05d12223          	sw	t4,68(sp)
    3e2c:	0b4010ef          	jal	4ee0 <__sprint_r>
    3e30:	00050463          	beqz	a0,3e38 <_vfprintf_r+0x1e14>
    3e34:	ec0fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    3e38:	0a812483          	lw	s1,168(sp)
    3e3c:	04412e83          	lw	t4,68(sp)
    3e40:	0ac10413          	add	s0,sp,172
    3e44:	bccff06f          	j	3210 <_vfprintf_r+0x11ec>
    3e48:	02812703          	lw	a4,40(sp)
    3e4c:	09810893          	add	a7,sp,152
    3e50:	08410813          	add	a6,sp,132
    3e54:	00070513          	mv	a0,a4
    3e58:	00050593          	mv	a1,a0
    3e5c:	00030713          	mv	a4,t1
    3e60:	07c10793          	add	a5,sp,124
    3e64:	00200693          	li	a3,2
    3e68:	00048613          	mv	a2,s1
    3e6c:	00098513          	mv	a0,s3
    3e70:	03c12223          	sw	t3,36(sp)
    3e74:	03d12023          	sw	t4,32(sp)
    3e78:	00612c23          	sw	t1,24(sp)
    3e7c:	3a8040ef          	jal	8224 <_dtoa_r>
    3e80:	02012e83          	lw	t4,32(sp)
    3e84:	01812303          	lw	t1,24(sp)
    3e88:	02412e03          	lw	t3,36(sp)
    3e8c:	001ef713          	and	a4,t4,1
    3e90:	00050c13          	mv	s8,a0
    3e94:	1a0712e3          	bnez	a4,4838 <_vfprintf_r+0x2814>
    3e98:	09812783          	lw	a5,152(sp)
    3e9c:	07c12a03          	lw	s4,124(sp)
    3ea0:	40a787b3          	sub	a5,a5,a0
    3ea4:	00f12c23          	sw	a5,24(sp)
    3ea8:	ffd00713          	li	a4,-3
    3eac:	00ea4463          	blt	s4,a4,3eb4 <_vfprintf_r+0x1e90>
    3eb0:	5b435663          	bge	t1,s4,445c <_vfprintf_r+0x2438>
    3eb4:	ffee0e13          	add	t3,t3,-2
    3eb8:	fffa0d13          	add	s10,s4,-1
    3ebc:	07a12e23          	sw	s10,124(sp)
    3ec0:	0ffe7693          	zext.b	a3,t3
    3ec4:	00000613          	li	a2,0
    3ec8:	08d10423          	sb	a3,136(sp)
    3ecc:	02b00693          	li	a3,43
    3ed0:	000d5863          	bgez	s10,3ee0 <_vfprintf_r+0x1ebc>
    3ed4:	00100713          	li	a4,1
    3ed8:	41470d33          	sub	s10,a4,s4
    3edc:	02d00693          	li	a3,45
    3ee0:	08d104a3          	sb	a3,137(sp)
    3ee4:	00900693          	li	a3,9
    3ee8:	33a6d8e3          	bge	a3,s10,4a18 <_vfprintf_r+0x29f4>
    3eec:	000c0793          	mv	a5,s8
    3ef0:	09f10493          	add	s1,sp,159
    3ef4:	03212023          	sw	s2,32(sp)
    3ef8:	00040c13          	mv	s8,s0
    3efc:	06300a13          	li	s4,99
    3f00:	000d0413          	mv	s0,s10
    3f04:	03d12223          	sw	t4,36(sp)
    3f08:	05c12023          	sw	t3,64(sp)
    3f0c:	00048913          	mv	s2,s1
    3f10:	00098c93          	mv	s9,s3
    3f14:	00078d13          	mv	s10,a5
    3f18:	00a00593          	li	a1,10
    3f1c:	00040513          	mv	a0,s0
    3f20:	09c0b0ef          	jal	efbc <__modsi3>
    3f24:	03050713          	add	a4,a0,48
    3f28:	00090b13          	mv	s6,s2
    3f2c:	00040513          	mv	a0,s0
    3f30:	feeb0fa3          	sb	a4,-1(s6)
    3f34:	00a00593          	li	a1,10
    3f38:	00040993          	mv	s3,s0
    3f3c:	7fd0a0ef          	jal	ef38 <__divsi3>
    3f40:	fff90913          	add	s2,s2,-1
    3f44:	00050413          	mv	s0,a0
    3f48:	fd3a48e3          	blt	s4,s3,3f18 <_vfprintf_r+0x1ef4>
    3f4c:	000c8993          	mv	s3,s9
    3f50:	03050713          	add	a4,a0,48
    3f54:	00090c93          	mv	s9,s2
    3f58:	ffeb0693          	add	a3,s6,-2
    3f5c:	feec8fa3          	sb	a4,-1(s9)
    3f60:	000c0413          	mv	s0,s8
    3f64:	02412e83          	lw	t4,36(sp)
    3f68:	04012e03          	lw	t3,64(sp)
    3f6c:	02012903          	lw	s2,32(sp)
    3f70:	000d0c13          	mv	s8,s10
    3f74:	4c96f6e3          	bgeu	a3,s1,4c40 <_vfprintf_r+0x2c1c>
    3f78:	08a10713          	add	a4,sp,138
    3f7c:	0006c783          	lbu	a5,0(a3)
    3f80:	00168693          	add	a3,a3,1
    3f84:	00170713          	add	a4,a4,1
    3f88:	fef70fa3          	sb	a5,-1(a4)
    3f8c:	fe9698e3          	bne	a3,s1,3f7c <_vfprintf_r+0x1f58>
    3f90:	15010793          	add	a5,sp,336
    3f94:	41678633          	sub	a2,a5,s6
    3f98:	f5360793          	add	a5,a2,-173
    3f9c:	04f12023          	sw	a5,64(sp)
    3fa0:	01812783          	lw	a5,24(sp)
    3fa4:	04012683          	lw	a3,64(sp)
    3fa8:	00100713          	li	a4,1
    3fac:	00d78d33          	add	s10,a5,a3
    3fb0:	28f75ce3          	bge	a4,a5,4a48 <_vfprintf_r+0x2a24>
    3fb4:	03012783          	lw	a5,48(sp)
    3fb8:	00fd0d33          	add	s10,s10,a5
    3fbc:	fffd4813          	not	a6,s10
    3fc0:	bffeff13          	and	t5,t4,-1025
    3fc4:	41f85813          	sra	a6,a6,0x1f
    3fc8:	100f6e93          	or	t4,t5,256
    3fcc:	010d7cb3          	and	s9,s10,a6
    3fd0:	02012223          	sw	zero,36(sp)
    3fd4:	02012023          	sw	zero,32(sp)
    3fd8:	00000a13          	li	s4,0
    3fdc:	04412783          	lw	a5,68(sp)
    3fe0:	46079263          	bnez	a5,4444 <_vfprintf_r+0x2420>
    3fe4:	07714603          	lbu	a2,119(sp)
    3fe8:	00000313          	li	t1,0
    3fec:	00061463          	bnez	a2,3ff4 <_vfprintf_r+0x1fd0>
    3ff0:	a74fe06f          	j	2264 <_vfprintf_r+0x240>
    3ff4:	e90fe06f          	j	2684 <_vfprintf_r+0x660>
    3ff8:	00812583          	lw	a1,8(sp)
    3ffc:	0a010613          	add	a2,sp,160
    4000:	00098513          	mv	a0,s3
    4004:	03d12023          	sw	t4,32(sp)
    4008:	6d9000ef          	jal	4ee0 <__sprint_r>
    400c:	00050463          	beqz	a0,4014 <_vfprintf_r+0x1ff0>
    4010:	ce4fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    4014:	07c12683          	lw	a3,124(sp)
    4018:	0a812483          	lw	s1,168(sp)
    401c:	02012e83          	lw	t4,32(sp)
    4020:	0ac10413          	add	s0,sp,172
    4024:	ce0ff06f          	j	3504 <_vfprintf_r+0x14e0>
    4028:	00600c93          	li	s9,6
    402c:	f14ff06f          	j	3740 <_vfprintf_r+0x171c>
    4030:	0ffd7d13          	zext.b	s10,s10
    4034:	00000c93          	li	s9,0
    4038:	bd5fe06f          	j	2c0c <_vfprintf_r+0xbe8>
    403c:	0ffd7d13          	zext.b	s10,s10
    4040:	00000c93          	li	s9,0
    4044:	e48ff06f          	j	368c <_vfprintf_r+0x1668>
    4048:	018d1d13          	sll	s10,s10,0x18
    404c:	418d5d13          	sra	s10,s10,0x18
    4050:	41fd5c93          	sra	s9,s10,0x1f
    4054:	000c8793          	mv	a5,s9
    4058:	b39fe06f          	j	2b90 <_vfprintf_r+0xb6c>
    405c:	01412783          	lw	a5,20(sp)
    4060:	00c12703          	lw	a4,12(sp)
    4064:	0007a783          	lw	a5,0(a5)
    4068:	00e79023          	sh	a4,0(a5)
    406c:	c21fe06f          	j	2c8c <_vfprintf_r+0xc68>
    4070:	000c0513          	mv	a0,s8
    4074:	05d12223          	sw	t4,68(sp)
    4078:	ad8fd0ef          	jal	1350 <strlen>
    407c:	07714603          	lbu	a2,119(sp)
    4080:	fff54813          	not	a6,a0
    4084:	41f85813          	sra	a6,a6,0x1f
    4088:	01612a23          	sw	s6,20(sp)
    408c:	02012223          	sw	zero,36(sp)
    4090:	02012023          	sw	zero,32(sp)
    4094:	00012823          	sw	zero,16(sp)
    4098:	04412e83          	lw	t4,68(sp)
    409c:	00050d13          	mv	s10,a0
    40a0:	01057cb3          	and	s9,a0,a6
    40a4:	00000313          	li	t1,0
    40a8:	07300e13          	li	t3,115
    40ac:	00061463          	bnez	a2,40b4 <_vfprintf_r+0x2090>
    40b0:	9b4fe06f          	j	2264 <_vfprintf_r+0x240>
    40b4:	dd0fe06f          	j	2684 <_vfprintf_r+0x660>
    40b8:	00812583          	lw	a1,8(sp)
    40bc:	0a010613          	add	a2,sp,160
    40c0:	00098513          	mv	a0,s3
    40c4:	61d000ef          	jal	4ee0 <__sprint_r>
    40c8:	00051463          	bnez	a0,40d0 <_vfprintf_r+0x20ac>
    40cc:	be8fe06f          	j	24b4 <_vfprintf_r+0x490>
    40d0:	c38fe06f          	j	2508 <_vfprintf_r+0x4e4>
    40d4:	00812583          	lw	a1,8(sp)
    40d8:	0a010613          	add	a2,sp,160
    40dc:	00098513          	mv	a0,s3
    40e0:	03d12023          	sw	t4,32(sp)
    40e4:	5fd000ef          	jal	4ee0 <__sprint_r>
    40e8:	00050463          	beqz	a0,40f0 <_vfprintf_r+0x20cc>
    40ec:	c08fe06f          	j	24f4 <_vfprintf_r+0x4d0>
    40f0:	07c12683          	lw	a3,124(sp)
    40f4:	0a812483          	lw	s1,168(sp)
    40f8:	0a412703          	lw	a4,164(sp)
    40fc:	02012e83          	lw	t4,32(sp)
    4100:	0ac10413          	add	s0,sp,172
    4104:	c2dff06f          	j	3d30 <_vfprintf_r+0x1d0c>
    4108:	05862503          	lw	a0,88(a2)
    410c:	00f12623          	sw	a5,12(sp)
    4110:	fbdfc0ef          	jal	10cc <__retarget_lock_release_recursive>
    4114:	00c12783          	lw	a5,12(sp)
    4118:	ab8fe06f          	j	23d0 <_vfprintf_r+0x3ac>
    411c:	00130a13          	add	s4,t1,1
    4120:	00200693          	li	a3,2
    4124:	02812703          	lw	a4,40(sp)
    4128:	09810893          	add	a7,sp,152
    412c:	08410813          	add	a6,sp,132
    4130:	00070513          	mv	a0,a4
    4134:	00050593          	mv	a1,a0
    4138:	000a0713          	mv	a4,s4
    413c:	07c10793          	add	a5,sp,124
    4140:	00048613          	mv	a2,s1
    4144:	00098513          	mv	a0,s3
    4148:	02612223          	sw	t1,36(sp)
    414c:	03c12023          	sw	t3,32(sp)
    4150:	01d12c23          	sw	t4,24(sp)
    4154:	0d0040ef          	jal	8224 <_dtoa_r>
    4158:	02012e03          	lw	t3,32(sp)
    415c:	04600693          	li	a3,70
    4160:	01812e83          	lw	t4,24(sp)
    4164:	fdfe7d13          	and	s10,t3,-33
    4168:	02412303          	lw	t1,36(sp)
    416c:	00050c13          	mv	s8,a0
    4170:	01450733          	add	a4,a0,s4
    4174:	34dd14e3          	bne	s10,a3,4cbc <_vfprintf_r+0x2c98>
    4178:	000c4603          	lbu	a2,0(s8)
    417c:	03000693          	li	a3,48
    4180:	6cd60263          	beq	a2,a3,4844 <_vfprintf_r+0x2820>
    4184:	07c12683          	lw	a3,124(sp)
    4188:	00d70733          	add	a4,a4,a3
    418c:	02812683          	lw	a3,40(sp)
    4190:	00048593          	mv	a1,s1
    4194:	00000613          	li	a2,0
    4198:	00068513          	mv	a0,a3
    419c:	00000693          	li	a3,0
    41a0:	04e12823          	sw	a4,80(sp)
    41a4:	02612223          	sw	t1,36(sp)
    41a8:	03c12023          	sw	t3,32(sp)
    41ac:	01d12c23          	sw	t4,24(sp)
    41b0:	370090ef          	jal	d520 <__eqdf2>
    41b4:	01812e83          	lw	t4,24(sp)
    41b8:	02012e03          	lw	t3,32(sp)
    41bc:	02412303          	lw	t1,36(sp)
    41c0:	05012703          	lw	a4,80(sp)
    41c4:	62050863          	beqz	a0,47f4 <_vfprintf_r+0x27d0>
    41c8:	09812783          	lw	a5,152(sp)
    41cc:	00e7fe63          	bgeu	a5,a4,41e8 <_vfprintf_r+0x21c4>
    41d0:	03000613          	li	a2,48
    41d4:	00178693          	add	a3,a5,1
    41d8:	08d12c23          	sw	a3,152(sp)
    41dc:	00c78023          	sb	a2,0(a5)
    41e0:	09812783          	lw	a5,152(sp)
    41e4:	fee7e8e3          	bltu	a5,a4,41d4 <_vfprintf_r+0x21b0>
    41e8:	07c12a03          	lw	s4,124(sp)
    41ec:	418787b3          	sub	a5,a5,s8
    41f0:	04700713          	li	a4,71
    41f4:	00f12c23          	sw	a5,24(sp)
    41f8:	caed08e3          	beq	s10,a4,3ea8 <_vfprintf_r+0x1e84>
    41fc:	04600713          	li	a4,70
    4200:	68ed0863          	beq	s10,a4,4890 <_vfprintf_r+0x286c>
    4204:	fffa0d13          	add	s10,s4,-1
    4208:	cb5ff06f          	j	3ebc <_vfprintf_r+0x1e98>
    420c:	02812703          	lw	a4,40(sp)
    4210:	07c10613          	add	a2,sp,124
    4214:	00048593          	mv	a1,s1
    4218:	00070513          	mv	a0,a4
    421c:	02612223          	sw	t1,36(sp)
    4220:	03c12023          	sw	t3,32(sp)
    4224:	01d12c23          	sw	t4,24(sp)
    4228:	4e9030ef          	jal	7f10 <frexp>
    422c:	7fffc717          	auipc	a4,0x7fffc
    4230:	48470713          	add	a4,a4,1156 # 800006b0 <__global_locale+0x17c>
    4234:	00072603          	lw	a2,0(a4)
    4238:	00472683          	lw	a3,4(a4)
    423c:	578090ef          	jal	d7b4 <__muldf3>
    4240:	00000613          	li	a2,0
    4244:	00000693          	li	a3,0
    4248:	00050a13          	mv	s4,a0
    424c:	00058d13          	mv	s10,a1
    4250:	2d0090ef          	jal	d520 <__eqdf2>
    4254:	01812e83          	lw	t4,24(sp)
    4258:	02012e03          	lw	t3,32(sp)
    425c:	02412303          	lw	t1,36(sp)
    4260:	00051663          	bnez	a0,426c <_vfprintf_r+0x2248>
    4264:	00100713          	li	a4,1
    4268:	06e12e23          	sw	a4,124(sp)
    426c:	0000b797          	auipc	a5,0xb
    4270:	0c478793          	add	a5,a5,196 # f330 <__fini_array_end+0x2bc>
    4274:	06100713          	li	a4,97
    4278:	02f12023          	sw	a5,32(sp)
    427c:	00ee1863          	bne	t3,a4,428c <_vfprintf_r+0x2268>
    4280:	0000b797          	auipc	a5,0xb
    4284:	09c78793          	add	a5,a5,156 # f31c <__fini_array_end+0x2a8>
    4288:	02f12023          	sw	a5,32(sp)
    428c:	7fffc717          	auipc	a4,0x7fffc
    4290:	42c70713          	add	a4,a4,1068 # 800006b8 <__global_locale+0x184>
    4294:	00072783          	lw	a5,0(a4)
    4298:	00472803          	lw	a6,4(a4)
    429c:	000c0493          	mv	s1,s8
    42a0:	00f12c23          	sw	a5,24(sp)
    42a4:	000d0793          	mv	a5,s10
    42a8:	03212223          	sw	s2,36(sp)
    42ac:	000c0d13          	mv	s10,s8
    42b0:	02012903          	lw	s2,32(sp)
    42b4:	00098c13          	mv	s8,s3
    42b8:	01012e23          	sw	a6,28(sp)
    42bc:	fff30b13          	add	s6,t1,-1
    42c0:	fff00c93          	li	s9,-1
    42c4:	05d12023          	sw	t4,64(sp)
    42c8:	05c12823          	sw	t3,80(sp)
    42cc:	04812a23          	sw	s0,84(sp)
    42d0:	00078993          	mv	s3,a5
    42d4:	01c0006f          	j	42f0 <_vfprintf_r+0x22cc>
    42d8:	00000613          	li	a2,0
    42dc:	00000693          	li	a3,0
    42e0:	fffb0413          	add	s0,s6,-1
    42e4:	23c090ef          	jal	d520 <__eqdf2>
    42e8:	0a0504e3          	beqz	a0,4b90 <_vfprintf_r+0x2b6c>
    42ec:	00040b13          	mv	s6,s0
    42f0:	01812603          	lw	a2,24(sp)
    42f4:	01c12683          	lw	a3,28(sp)
    42f8:	000a0513          	mv	a0,s4
    42fc:	00098593          	mv	a1,s3
    4300:	4b4090ef          	jal	d7b4 <__muldf3>
    4304:	00058a13          	mv	s4,a1
    4308:	00050993          	mv	s3,a0
    430c:	5940a0ef          	jal	e8a0 <__fixdfsi>
    4310:	00050413          	mv	s0,a0
    4314:	6100a0ef          	jal	e924 <__floatsidf>
    4318:	00050613          	mv	a2,a0
    431c:	00058693          	mv	a3,a1
    4320:	00098513          	mv	a0,s3
    4324:	000a0593          	mv	a1,s4
    4328:	41d090ef          	jal	df44 <__subdf3>
    432c:	00890733          	add	a4,s2,s0
    4330:	00074703          	lbu	a4,0(a4)
    4334:	00048813          	mv	a6,s1
    4338:	00050a13          	mv	s4,a0
    433c:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4340:	00058993          	mv	s3,a1
    4344:	00148493          	add	s1,s1,1
    4348:	f99b18e3          	bne	s6,s9,42d8 <_vfprintf_r+0x22b4>
    434c:	7fffc697          	auipc	a3,0x7fffc
    4350:	37468693          	add	a3,a3,884 # 800006c0 <__global_locale+0x18c>
    4354:	0006a303          	lw	t1,0(a3)
    4358:	0046a383          	lw	t2,4(a3)
    435c:	05012e03          	lw	t3,80(sp)
    4360:	00030613          	mv	a2,t1
    4364:	00038693          	mv	a3,t2
    4368:	01012c23          	sw	a6,24(sp)
    436c:	02412903          	lw	s2,36(sp)
    4370:	000c0993          	mv	s3,s8
    4374:	03c12223          	sw	t3,36(sp)
    4378:	000d0c13          	mv	s8,s10
    437c:	00058d13          	mv	s10,a1
    4380:	22c090ef          	jal	d5ac <__gedf2>
    4384:	7fffc797          	auipc	a5,0x7fffc
    4388:	33c78793          	add	a5,a5,828 # 800006c0 <__global_locale+0x18c>
    438c:	00040b13          	mv	s6,s0
    4390:	0007a303          	lw	t1,0(a5)
    4394:	05412403          	lw	s0,84(sp)
    4398:	0047a383          	lw	t2,4(a5)
    439c:	01812803          	lw	a6,24(sp)
    43a0:	02412e03          	lw	t3,36(sp)
    43a4:	04012e83          	lw	t4,64(sp)
    43a8:	0aa05ce3          	blez	a0,4c60 <_vfprintf_r+0x2c3c>
    43ac:	02012783          	lw	a5,32(sp)
    43b0:	09012c23          	sw	a6,152(sp)
    43b4:	fff4c603          	lbu	a2,-1(s1)
    43b8:	00f7c583          	lbu	a1,15(a5)
    43bc:	00048693          	mv	a3,s1
    43c0:	02b61063          	bne	a2,a1,43e0 <_vfprintf_r+0x23bc>
    43c4:	03000513          	li	a0,48
    43c8:	fea68fa3          	sb	a0,-1(a3)
    43cc:	09812683          	lw	a3,152(sp)
    43d0:	fff68793          	add	a5,a3,-1
    43d4:	08f12c23          	sw	a5,152(sp)
    43d8:	fff6c603          	lbu	a2,-1(a3)
    43dc:	feb606e3          	beq	a2,a1,43c8 <_vfprintf_r+0x23a4>
    43e0:	00160593          	add	a1,a2,1
    43e4:	03900513          	li	a0,57
    43e8:	0ff5f593          	zext.b	a1,a1
    43ec:	04a60463          	beq	a2,a0,4434 <_vfprintf_r+0x2410>
    43f0:	feb68fa3          	sb	a1,-1(a3)
    43f4:	00048793          	mv	a5,s1
    43f8:	07c12a03          	lw	s4,124(sp)
    43fc:	418787b3          	sub	a5,a5,s8
    4400:	06100613          	li	a2,97
    4404:	fffa0d13          	add	s10,s4,-1
    4408:	00f12c23          	sw	a5,24(sp)
    440c:	07a12e23          	sw	s10,124(sp)
    4410:	07000693          	li	a3,112
    4414:	00ce0663          	beq	t3,a2,4420 <_vfprintf_r+0x23fc>
    4418:	05000693          	li	a3,80
    441c:	04100e13          	li	t3,65
    4420:	00100613          	li	a2,1
    4424:	aa5ff06f          	j	3ec8 <_vfprintf_r+0x1ea4>
    4428:	00030a13          	mv	s4,t1
    442c:	00300693          	li	a3,3
    4430:	cf5ff06f          	j	4124 <_vfprintf_r+0x2100>
    4434:	02012783          	lw	a5,32(sp)
    4438:	00a7c583          	lbu	a1,10(a5)
    443c:	feb68fa3          	sb	a1,-1(a3)
    4440:	fb5ff06f          	j	43f4 <_vfprintf_r+0x23d0>
    4444:	02d00713          	li	a4,45
    4448:	06e10ba3          	sb	a4,119(sp)
    444c:	02d00613          	li	a2,45
    4450:	00000313          	li	t1,0
    4454:	001c8c93          	add	s9,s9,1
    4458:	e0dfd06f          	j	2264 <_vfprintf_r+0x240>
    445c:	01812783          	lw	a5,24(sp)
    4460:	46fa4063          	blt	s4,a5,48c0 <_vfprintf_r+0x289c>
    4464:	001ef713          	and	a4,t4,1
    4468:	000a0d13          	mv	s10,s4
    446c:	00070663          	beqz	a4,4478 <_vfprintf_r+0x2454>
    4470:	03012783          	lw	a5,48(sp)
    4474:	00fa0d33          	add	s10,s4,a5
    4478:	400eff13          	and	t5,t4,1024
    447c:	000f0463          	beqz	t5,4484 <_vfprintf_r+0x2460>
    4480:	5f404e63          	bgtz	s4,4a7c <_vfprintf_r+0x2a58>
    4484:	fffd4813          	not	a6,s10
    4488:	41f85813          	sra	a6,a6,0x1f
    448c:	010d7cb3          	and	s9,s10,a6
    4490:	06700e13          	li	t3,103
    4494:	000b0e93          	mv	t4,s6
    4498:	02012223          	sw	zero,36(sp)
    449c:	02012023          	sw	zero,32(sp)
    44a0:	b3dff06f          	j	3fdc <_vfprintf_r+0x1fb8>
    44a4:	02d00793          	li	a5,45
    44a8:	06f10ba3          	sb	a5,119(sp)
    44ac:	02d00613          	li	a2,45
    44b0:	998fe06f          	j	2648 <_vfprintf_r+0x624>
    44b4:	01812783          	lw	a5,24(sp)
    44b8:	02012a03          	lw	s4,32(sp)
    44bc:	05212823          	sw	s2,80(sp)
    44c0:	00fc07b3          	add	a5,s8,a5
    44c4:	05712c23          	sw	s7,88(sp)
    44c8:	05912e23          	sw	s9,92(sp)
    44cc:	00040713          	mv	a4,s0
    44d0:	04f12223          	sw	a5,68(sp)
    44d4:	02412403          	lw	s0,36(sp)
    44d8:	05d12a23          	sw	t4,84(sp)
    44dc:	03812223          	sw	s8,36(sp)
    44e0:	03c12b83          	lw	s7,60(sp)
    44e4:	04c12c83          	lw	s9,76(sp)
    44e8:	00812903          	lw	s2,8(sp)
    44ec:	00700693          	li	a3,7
    44f0:	01000d13          	li	s10,16
    44f4:	0000bb17          	auipc	s6,0xb
    44f8:	310b0b13          	add	s6,s6,784 # f804 <zeroes.0>
    44fc:	00048613          	mv	a2,s1
    4500:	00030c13          	mv	s8,t1
    4504:	09405863          	blez	s4,4594 <_vfprintf_r+0x2570>
    4508:	16805e63          	blez	s0,4684 <_vfprintf_r+0x2660>
    450c:	fff40413          	add	s0,s0,-1
    4510:	04812783          	lw	a5,72(sp)
    4514:	01960633          	add	a2,a2,s9
    4518:	01972223          	sw	s9,4(a4)
    451c:	00f72023          	sw	a5,0(a4)
    4520:	0a412783          	lw	a5,164(sp)
    4524:	0ac12423          	sw	a2,168(sp)
    4528:	00870713          	add	a4,a4,8
    452c:	00178793          	add	a5,a5,1
    4530:	0af12223          	sw	a5,164(sp)
    4534:	14f6ce63          	blt	a3,a5,4690 <_vfprintf_r+0x266c>
    4538:	04412783          	lw	a5,68(sp)
    453c:	000bc583          	lbu	a1,0(s7)
    4540:	418784b3          	sub	s1,a5,s8
    4544:	0095d463          	bge	a1,s1,454c <_vfprintf_r+0x2528>
    4548:	00058493          	mv	s1,a1
    454c:	02905663          	blez	s1,4578 <_vfprintf_r+0x2554>
    4550:	0a412583          	lw	a1,164(sp)
    4554:	00960633          	add	a2,a2,s1
    4558:	01872023          	sw	s8,0(a4)
    455c:	00158593          	add	a1,a1,1
    4560:	00972223          	sw	s1,4(a4)
    4564:	0ac12423          	sw	a2,168(sp)
    4568:	0ab12223          	sw	a1,164(sp)
    456c:	14b6c663          	blt	a3,a1,46b8 <_vfprintf_r+0x2694>
    4570:	000bc583          	lbu	a1,0(s7)
    4574:	00870713          	add	a4,a4,8
    4578:	fff4c513          	not	a0,s1
    457c:	41f55513          	sra	a0,a0,0x1f
    4580:	00a4f7b3          	and	a5,s1,a0
    4584:	40f584b3          	sub	s1,a1,a5
    4588:	04904663          	bgtz	s1,45d4 <_vfprintf_r+0x25b0>
    458c:	00bc0c33          	add	s8,s8,a1
    4590:	f7404ce3          	bgtz	s4,4508 <_vfprintf_r+0x24e4>
    4594:	f6804ce3          	bgtz	s0,450c <_vfprintf_r+0x24e8>
    4598:	01812783          	lw	a5,24(sp)
    459c:	000c0313          	mv	t1,s8
    45a0:	02412c03          	lw	s8,36(sp)
    45a4:	03712e23          	sw	s7,60(sp)
    45a8:	00070413          	mv	s0,a4
    45ac:	00fc0733          	add	a4,s8,a5
    45b0:	05012903          	lw	s2,80(sp)
    45b4:	05412e83          	lw	t4,84(sp)
    45b8:	05812b83          	lw	s7,88(sp)
    45bc:	05c12c83          	lw	s9,92(sp)
    45c0:	00060493          	mv	s1,a2
    45c4:	00676463          	bltu	a4,t1,45cc <_vfprintf_r+0x25a8>
    45c8:	c59fe06f          	j	3220 <_vfprintf_r+0x11fc>
    45cc:	00070313          	mv	t1,a4
    45d0:	c51fe06f          	j	3220 <_vfprintf_r+0x11fc>
    45d4:	0a412583          	lw	a1,164(sp)
    45d8:	0000be97          	auipc	t4,0xb
    45dc:	22ce8e93          	add	t4,t4,556 # f804 <zeroes.0>
    45e0:	069d5c63          	bge	s10,s1,4658 <_vfprintf_r+0x2634>
    45e4:	02812023          	sw	s0,32(sp)
    45e8:	00048413          	mv	s0,s1
    45ec:	000b0493          	mv	s1,s6
    45f0:	00c0006f          	j	45fc <_vfprintf_r+0x25d8>
    45f4:	ff040413          	add	s0,s0,-16
    45f8:	048d5a63          	bge	s10,s0,464c <_vfprintf_r+0x2628>
    45fc:	01060613          	add	a2,a2,16
    4600:	00158593          	add	a1,a1,1
    4604:	01672023          	sw	s6,0(a4)
    4608:	01a72223          	sw	s10,4(a4)
    460c:	0ac12423          	sw	a2,168(sp)
    4610:	0ab12223          	sw	a1,164(sp)
    4614:	00870713          	add	a4,a4,8
    4618:	fcb6dee3          	bge	a3,a1,45f4 <_vfprintf_r+0x25d0>
    461c:	0a010613          	add	a2,sp,160
    4620:	00090593          	mv	a1,s2
    4624:	00098513          	mv	a0,s3
    4628:	0b9000ef          	jal	4ee0 <__sprint_r>
    462c:	00050463          	beqz	a0,4634 <_vfprintf_r+0x2610>
    4630:	ec5fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    4634:	ff040413          	add	s0,s0,-16
    4638:	0a812603          	lw	a2,168(sp)
    463c:	0a412583          	lw	a1,164(sp)
    4640:	0ac10713          	add	a4,sp,172
    4644:	00700693          	li	a3,7
    4648:	fa8d4ae3          	blt	s10,s0,45fc <_vfprintf_r+0x25d8>
    464c:	00048e93          	mv	t4,s1
    4650:	00040493          	mv	s1,s0
    4654:	02012403          	lw	s0,32(sp)
    4658:	00960633          	add	a2,a2,s1
    465c:	00158593          	add	a1,a1,1
    4660:	01d72023          	sw	t4,0(a4)
    4664:	00972223          	sw	s1,4(a4)
    4668:	0ac12423          	sw	a2,168(sp)
    466c:	0ab12223          	sw	a1,164(sp)
    4670:	10b6ce63          	blt	a3,a1,478c <_vfprintf_r+0x2768>
    4674:	000bc583          	lbu	a1,0(s7)
    4678:	00870713          	add	a4,a4,8
    467c:	00bc0c33          	add	s8,s8,a1
    4680:	f11ff06f          	j	4590 <_vfprintf_r+0x256c>
    4684:	fffb8b93          	add	s7,s7,-1
    4688:	fffa0a13          	add	s4,s4,-1
    468c:	e85ff06f          	j	4510 <_vfprintf_r+0x24ec>
    4690:	0a010613          	add	a2,sp,160
    4694:	00090593          	mv	a1,s2
    4698:	00098513          	mv	a0,s3
    469c:	045000ef          	jal	4ee0 <__sprint_r>
    46a0:	00050463          	beqz	a0,46a8 <_vfprintf_r+0x2684>
    46a4:	e51fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    46a8:	0a812603          	lw	a2,168(sp)
    46ac:	0ac10713          	add	a4,sp,172
    46b0:	00700693          	li	a3,7
    46b4:	e85ff06f          	j	4538 <_vfprintf_r+0x2514>
    46b8:	0a010613          	add	a2,sp,160
    46bc:	00090593          	mv	a1,s2
    46c0:	00098513          	mv	a0,s3
    46c4:	01d000ef          	jal	4ee0 <__sprint_r>
    46c8:	00050463          	beqz	a0,46d0 <_vfprintf_r+0x26ac>
    46cc:	e29fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    46d0:	000bc583          	lbu	a1,0(s7)
    46d4:	0a812603          	lw	a2,168(sp)
    46d8:	0ac10713          	add	a4,sp,172
    46dc:	00700693          	li	a3,7
    46e0:	e99ff06f          	j	4578 <_vfprintf_r+0x2554>
    46e4:	04c12783          	lw	a5,76(sp)
    46e8:	04812583          	lw	a1,72(sp)
    46ec:	00000913          	li	s2,0
    46f0:	40fc0c33          	sub	s8,s8,a5
    46f4:	00078613          	mv	a2,a5
    46f8:	000c0513          	mv	a0,s8
    46fc:	468030ef          	jal	7b64 <strncpy>
    4700:	00144783          	lbu	a5,1(s0)
    4704:	00a00613          	li	a2,10
    4708:	00000693          	li	a3,0
    470c:	00f037b3          	snez	a5,a5
    4710:	000d0513          	mv	a0,s10
    4714:	000c8593          	mv	a1,s9
    4718:	00f40433          	add	s0,s0,a5
    471c:	78d060ef          	jal	b6a8 <__udivdi3>
    4720:	a10ff06f          	j	3930 <_vfprintf_r+0x190c>
    4724:	09810713          	add	a4,sp,152
    4728:	00000693          	li	a3,0
    472c:	08410613          	add	a2,sp,132
    4730:	00000593          	li	a1,0
    4734:	00098513          	mv	a0,s3
    4738:	01c12a23          	sw	t3,20(sp)
    473c:	01d12823          	sw	t4,16(sp)
    4740:	618060ef          	jal	ad58 <_wcsrtombs_r>
    4744:	fff00713          	li	a4,-1
    4748:	01012e83          	lw	t4,16(sp)
    474c:	01412e03          	lw	t3,20(sp)
    4750:	00050d13          	mv	s10,a0
    4754:	30e50063          	beq	a0,a4,4a54 <_vfprintf_r+0x2a30>
    4758:	09812223          	sw	s8,132(sp)
    475c:	cacff06f          	j	3c08 <_vfprintf_r+0x1be4>
    4760:	07714603          	lbu	a2,119(sp)
    4764:	01612a23          	sw	s6,20(sp)
    4768:	02012223          	sw	zero,36(sp)
    476c:	02012023          	sw	zero,32(sp)
    4770:	00012823          	sw	zero,16(sp)
    4774:	00000c93          	li	s9,0
    4778:	00000313          	li	t1,0
    477c:	00000a13          	li	s4,0
    4780:	00061463          	bnez	a2,4788 <_vfprintf_r+0x2764>
    4784:	ae1fd06f          	j	2264 <_vfprintf_r+0x240>
    4788:	efdfd06f          	j	2684 <_vfprintf_r+0x660>
    478c:	0a010613          	add	a2,sp,160
    4790:	00090593          	mv	a1,s2
    4794:	00098513          	mv	a0,s3
    4798:	748000ef          	jal	4ee0 <__sprint_r>
    479c:	00050463          	beqz	a0,47a4 <_vfprintf_r+0x2780>
    47a0:	d55fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    47a4:	000bc583          	lbu	a1,0(s7)
    47a8:	0a812603          	lw	a2,168(sp)
    47ac:	0ac10713          	add	a4,sp,172
    47b0:	00700693          	li	a3,7
    47b4:	00bc0c33          	add	s8,s8,a1
    47b8:	dd9ff06f          	j	4590 <_vfprintf_r+0x256c>
    47bc:	00812583          	lw	a1,8(sp)
    47c0:	0a010613          	add	a2,sp,160
    47c4:	00098513          	mv	a0,s3
    47c8:	05d12223          	sw	t4,68(sp)
    47cc:	714000ef          	jal	4ee0 <__sprint_r>
    47d0:	00050463          	beqz	a0,47d8 <_vfprintf_r+0x27b4>
    47d4:	d21fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    47d8:	0a812483          	lw	s1,168(sp)
    47dc:	04412e83          	lw	t4,68(sp)
    47e0:	0ac10413          	add	s0,sp,172
    47e4:	a19fe06f          	j	31fc <_vfprintf_r+0x11d8>
    47e8:	00900793          	li	a5,9
    47ec:	95a7e263          	bltu	a5,s10,3930 <_vfprintf_r+0x190c>
    47f0:	98cff06f          	j	397c <_vfprintf_r+0x1958>
    47f4:	07c12a03          	lw	s4,124(sp)
    47f8:	00070793          	mv	a5,a4
    47fc:	9f1ff06f          	j	41ec <_vfprintf_r+0x21c8>
    4800:	00812583          	lw	a1,8(sp)
    4804:	0a010613          	add	a2,sp,160
    4808:	00098513          	mv	a0,s3
    480c:	03d12023          	sw	t4,32(sp)
    4810:	6d0000ef          	jal	4ee0 <__sprint_r>
    4814:	00050463          	beqz	a0,481c <_vfprintf_r+0x27f8>
    4818:	cddfd06f          	j	24f4 <_vfprintf_r+0x4d0>
    481c:	07c12d03          	lw	s10,124(sp)
    4820:	01812783          	lw	a5,24(sp)
    4824:	0a812483          	lw	s1,168(sp)
    4828:	02012e83          	lw	t4,32(sp)
    482c:	0ac10413          	add	s0,sp,172
    4830:	41a78d33          	sub	s10,a5,s10
    4834:	a49fe06f          	j	327c <_vfprintf_r+0x1258>
    4838:	00650733          	add	a4,a0,t1
    483c:	04700d13          	li	s10,71
    4840:	94dff06f          	j	418c <_vfprintf_r+0x2168>
    4844:	02812603          	lw	a2,40(sp)
    4848:	00048593          	mv	a1,s1
    484c:	00000693          	li	a3,0
    4850:	00060513          	mv	a0,a2
    4854:	00000613          	li	a2,0
    4858:	04e12823          	sw	a4,80(sp)
    485c:	02612223          	sw	t1,36(sp)
    4860:	03c12023          	sw	t3,32(sp)
    4864:	01d12c23          	sw	t4,24(sp)
    4868:	4b9080ef          	jal	d520 <__eqdf2>
    486c:	01812e83          	lw	t4,24(sp)
    4870:	02012e03          	lw	t3,32(sp)
    4874:	02412303          	lw	t1,36(sp)
    4878:	05012703          	lw	a4,80(sp)
    487c:	34051e63          	bnez	a0,4bd8 <_vfprintf_r+0x2bb4>
    4880:	07c12a03          	lw	s4,124(sp)
    4884:	01470733          	add	a4,a4,s4
    4888:	418707b3          	sub	a5,a4,s8
    488c:	00f12c23          	sw	a5,24(sp)
    4890:	001ef713          	and	a4,t4,1
    4894:	00676733          	or	a4,a4,t1
    4898:	37405a63          	blez	s4,4c0c <_vfprintf_r+0x2be8>
    489c:	26071263          	bnez	a4,4b00 <_vfprintf_r+0x2adc>
    48a0:	000a0d13          	mv	s10,s4
    48a4:	06600e13          	li	t3,102
    48a8:	400eff13          	and	t5,t4,1024
    48ac:	1c0f1a63          	bnez	t5,4a80 <_vfprintf_r+0x2a5c>
    48b0:	fffd4813          	not	a6,s10
    48b4:	41f85813          	sra	a6,a6,0x1f
    48b8:	010d7cb3          	and	s9,s10,a6
    48bc:	bd9ff06f          	j	4494 <_vfprintf_r+0x2470>
    48c0:	01812783          	lw	a5,24(sp)
    48c4:	03012703          	lw	a4,48(sp)
    48c8:	06700e13          	li	t3,103
    48cc:	00e78d33          	add	s10,a5,a4
    48d0:	fd404ce3          	bgtz	s4,48a8 <_vfprintf_r+0x2884>
    48d4:	414d06b3          	sub	a3,s10,s4
    48d8:	00168d13          	add	s10,a3,1
    48dc:	fffd4813          	not	a6,s10
    48e0:	41f85813          	sra	a6,a6,0x1f
    48e4:	010d7cb3          	and	s9,s10,a6
    48e8:	badff06f          	j	4494 <_vfprintf_r+0x2470>
    48ec:	000e8613          	mv	a2,t4
    48f0:	ad8fe06f          	j	2bc8 <_vfprintf_r+0xba4>
    48f4:	00812783          	lw	a5,8(sp)
    48f8:	0647a783          	lw	a5,100(a5)
    48fc:	0017f793          	and	a5,a5,1
    4900:	02079063          	bnez	a5,4920 <_vfprintf_r+0x28fc>
    4904:	00812783          	lw	a5,8(sp)
    4908:	00c7d783          	lhu	a5,12(a5)
    490c:	2007f793          	and	a5,a5,512
    4910:	00079863          	bnez	a5,4920 <_vfprintf_r+0x28fc>
    4914:	00812783          	lw	a5,8(sp)
    4918:	0587a503          	lw	a0,88(a5)
    491c:	fb0fc0ef          	jal	10cc <__retarget_lock_release_recursive>
    4920:	fff00793          	li	a5,-1
    4924:	00f12623          	sw	a5,12(sp)
    4928:	c2dfd06f          	j	2554 <_vfprintf_r+0x530>
    492c:	ff000613          	li	a2,-16
    4930:	40d00d33          	neg	s10,a3
    4934:	0000b297          	auipc	t0,0xb
    4938:	ed028293          	add	t0,t0,-304 # f804 <zeroes.0>
    493c:	08c6d463          	bge	a3,a2,49c4 <_vfprintf_r+0x29a0>
    4940:	03212023          	sw	s2,32(sp)
    4944:	01000693          	li	a3,16
    4948:	00700b13          	li	s6,7
    494c:	000e8a13          	mv	s4,t4
    4950:	00028913          	mv	s2,t0
    4954:	00c0006f          	j	4960 <_vfprintf_r+0x293c>
    4958:	ff0d0d13          	add	s10,s10,-16
    495c:	05a6de63          	bge	a3,s10,49b8 <_vfprintf_r+0x2994>
    4960:	01048493          	add	s1,s1,16
    4964:	00170713          	add	a4,a4,1
    4968:	01242023          	sw	s2,0(s0)
    496c:	00d42223          	sw	a3,4(s0)
    4970:	0a912423          	sw	s1,168(sp)
    4974:	0ae12223          	sw	a4,164(sp)
    4978:	00840413          	add	s0,s0,8
    497c:	fceb5ee3          	bge	s6,a4,4958 <_vfprintf_r+0x2934>
    4980:	00812583          	lw	a1,8(sp)
    4984:	0a010613          	add	a2,sp,160
    4988:	00098513          	mv	a0,s3
    498c:	554000ef          	jal	4ee0 <__sprint_r>
    4990:	00050463          	beqz	a0,4998 <_vfprintf_r+0x2974>
    4994:	b61fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    4998:	0a812483          	lw	s1,168(sp)
    499c:	0a412703          	lw	a4,164(sp)
    49a0:	0ac10413          	add	s0,sp,172
    49a4:	01000693          	li	a3,16
    49a8:	fb1ff06f          	j	4958 <_vfprintf_r+0x2934>
    49ac:	00012823          	sw	zero,16(sp)
    49b0:	0ec10c13          	add	s8,sp,236
    49b4:	a88ff06f          	j	3c3c <_vfprintf_r+0x1c18>
    49b8:	00090293          	mv	t0,s2
    49bc:	02012903          	lw	s2,32(sp)
    49c0:	000a0e93          	mv	t4,s4
    49c4:	01a484b3          	add	s1,s1,s10
    49c8:	00170713          	add	a4,a4,1
    49cc:	00542023          	sw	t0,0(s0)
    49d0:	01a42223          	sw	s10,4(s0)
    49d4:	0a912423          	sw	s1,168(sp)
    49d8:	0ae12223          	sw	a4,164(sp)
    49dc:	00700693          	li	a3,7
    49e0:	00e6c463          	blt	a3,a4,49e8 <_vfprintf_r+0x29c4>
    49e4:	b65fe06f          	j	3548 <_vfprintf_r+0x1524>
    49e8:	00812583          	lw	a1,8(sp)
    49ec:	0a010613          	add	a2,sp,160
    49f0:	00098513          	mv	a0,s3
    49f4:	03d12023          	sw	t4,32(sp)
    49f8:	4e8000ef          	jal	4ee0 <__sprint_r>
    49fc:	00050463          	beqz	a0,4a04 <_vfprintf_r+0x29e0>
    4a00:	af5fd06f          	j	24f4 <_vfprintf_r+0x4d0>
    4a04:	0a812483          	lw	s1,168(sp)
    4a08:	0a412703          	lw	a4,164(sp)
    4a0c:	02012e83          	lw	t4,32(sp)
    4a10:	0ac10413          	add	s0,sp,172
    4a14:	b20ff06f          	j	3d34 <_vfprintf_r+0x1d10>
    4a18:	08a10693          	add	a3,sp,138
    4a1c:	00061863          	bnez	a2,4a2c <_vfprintf_r+0x2a08>
    4a20:	03000693          	li	a3,48
    4a24:	08d10523          	sb	a3,138(sp)
    4a28:	08b10693          	add	a3,sp,139
    4a2c:	15010793          	add	a5,sp,336
    4a30:	40f68633          	sub	a2,a3,a5
    4a34:	030d0713          	add	a4,s10,48
    4a38:	0c960793          	add	a5,a2,201
    4a3c:	00e68023          	sb	a4,0(a3)
    4a40:	04f12023          	sw	a5,64(sp)
    4a44:	d5cff06f          	j	3fa0 <_vfprintf_r+0x1f7c>
    4a48:	001ef713          	and	a4,t4,1
    4a4c:	d6070863          	beqz	a4,3fbc <_vfprintf_r+0x1f98>
    4a50:	d64ff06f          	j	3fb4 <_vfprintf_r+0x1f90>
    4a54:	00812783          	lw	a5,8(sp)
    4a58:	00000293          	li	t0,0
    4a5c:	00c79783          	lh	a5,12(a5)
    4a60:	0407e793          	or	a5,a5,64
    4a64:	00812703          	lw	a4,8(sp)
    4a68:	00f71623          	sh	a5,12(a4)
    4a6c:	a8dfd06f          	j	24f8 <_vfprintf_r+0x4d4>
    4a70:	00012823          	sw	zero,16(sp)
    4a74:	00600313          	li	t1,6
    4a78:	ff9fe06f          	j	3a70 <_vfprintf_r+0x1a4c>
    4a7c:	06700e13          	li	t3,103
    4a80:	03c12783          	lw	a5,60(sp)
    4a84:	0ff00613          	li	a2,255
    4a88:	0007c703          	lbu	a4,0(a5)
    4a8c:	22c70263          	beq	a4,a2,4cb0 <_vfprintf_r+0x2c8c>
    4a90:	00000593          	li	a1,0
    4a94:	00000693          	li	a3,0
    4a98:	01475e63          	bge	a4,s4,4ab4 <_vfprintf_r+0x2a90>
    4a9c:	40ea0a33          	sub	s4,s4,a4
    4aa0:	0017c703          	lbu	a4,1(a5)
    4aa4:	04070863          	beqz	a4,4af4 <_vfprintf_r+0x2ad0>
    4aa8:	00168693          	add	a3,a3,1
    4aac:	00178793          	add	a5,a5,1
    4ab0:	fec714e3          	bne	a4,a2,4a98 <_vfprintf_r+0x2a74>
    4ab4:	02f12e23          	sw	a5,60(sp)
    4ab8:	02d12023          	sw	a3,32(sp)
    4abc:	02b12223          	sw	a1,36(sp)
    4ac0:	02012783          	lw	a5,32(sp)
    4ac4:	02412703          	lw	a4,36(sp)
    4ac8:	04c12583          	lw	a1,76(sp)
    4acc:	05c12823          	sw	t3,80(sp)
    4ad0:	00e78533          	add	a0,a5,a4
    4ad4:	3a80a0ef          	jal	ee7c <__mulsi3>
    4ad8:	01a50d33          	add	s10,a0,s10
    4adc:	fffd4813          	not	a6,s10
    4ae0:	41f85813          	sra	a6,a6,0x1f
    4ae4:	05012e03          	lw	t3,80(sp)
    4ae8:	010d7cb3          	and	s9,s10,a6
    4aec:	000b0e93          	mv	t4,s6
    4af0:	cecff06f          	j	3fdc <_vfprintf_r+0x1fb8>
    4af4:	0007c703          	lbu	a4,0(a5)
    4af8:	00158593          	add	a1,a1,1
    4afc:	fb5ff06f          	j	4ab0 <_vfprintf_r+0x2a8c>
    4b00:	03012783          	lw	a5,48(sp)
    4b04:	06600e13          	li	t3,102
    4b08:	00f306b3          	add	a3,t1,a5
    4b0c:	01468d33          	add	s10,a3,s4
    4b10:	d99ff06f          	j	48a8 <_vfprintf_r+0x2884>
    4b14:	02c12783          	lw	a5,44(sp)
    4b18:	0a07c863          	bltz	a5,4bc8 <_vfprintf_r+0x2ba4>
    4b1c:	07714603          	lbu	a2,119(sp)
    4b20:	04700713          	li	a4,71
    4b24:	0000ac17          	auipc	s8,0xa
    4b28:	7f4c0c13          	add	s8,s8,2036 # f318 <__fini_array_end+0x2a4>
    4b2c:	01c75463          	bge	a4,t3,4b34 <_vfprintf_r+0x2b10>
    4b30:	b31fd06f          	j	2660 <_vfprintf_r+0x63c>
    4b34:	0000ac17          	auipc	s8,0xa
    4b38:	7e0c0c13          	add	s8,s8,2016 # f314 <__fini_array_end+0x2a0>
    4b3c:	b25fd06f          	j	2660 <_vfprintf_r+0x63c>
    4b40:	07714603          	lbu	a2,119(sp)
    4b44:	01612a23          	sw	s6,20(sp)
    4b48:	02012223          	sw	zero,36(sp)
    4b4c:	02012023          	sw	zero,32(sp)
    4b50:	00030c93          	mv	s9,t1
    4b54:	00030d13          	mv	s10,t1
    4b58:	07300e13          	li	t3,115
    4b5c:	00000313          	li	t1,0
    4b60:	00061463          	bnez	a2,4b68 <_vfprintf_r+0x2b44>
    4b64:	f00fd06f          	j	2264 <_vfprintf_r+0x240>
    4b68:	b1dfd06f          	j	2684 <_vfprintf_r+0x660>
    4b6c:	00040313          	mv	t1,s0
    4b70:	01012903          	lw	s2,16(sp)
    4b74:	000b0413          	mv	s0,s6
    4b78:	01412e03          	lw	t3,20(sp)
    4b7c:	000c0b13          	mv	s6,s8
    4b80:	000a0e93          	mv	t4,s4
    4b84:	000c8c13          	mv	s8,s9
    4b88:	00030d13          	mv	s10,t1
    4b8c:	87cff06f          	j	3c08 <_vfprintf_r+0x1be4>
    4b90:	001b0793          	add	a5,s6,1
    4b94:	000c0993          	mv	s3,s8
    4b98:	02412903          	lw	s2,36(sp)
    4b9c:	04012e83          	lw	t4,64(sp)
    4ba0:	05012e03          	lw	t3,80(sp)
    4ba4:	05412403          	lw	s0,84(sp)
    4ba8:	000d0c13          	mv	s8,s10
    4bac:	00f487b3          	add	a5,s1,a5
    4bb0:	03000693          	li	a3,48
    4bb4:	840b40e3          	bltz	s6,43f4 <_vfprintf_r+0x23d0>
    4bb8:	00148493          	add	s1,s1,1
    4bbc:	fed48fa3          	sb	a3,-1(s1)
    4bc0:	fe979ce3          	bne	a5,s1,4bb8 <_vfprintf_r+0x2b94>
    4bc4:	835ff06f          	j	43f8 <_vfprintf_r+0x23d4>
    4bc8:	02d00793          	li	a5,45
    4bcc:	06f10ba3          	sb	a5,119(sp)
    4bd0:	02d00613          	li	a2,45
    4bd4:	f4dff06f          	j	4b20 <_vfprintf_r+0x2afc>
    4bd8:	00100693          	li	a3,1
    4bdc:	414686b3          	sub	a3,a3,s4
    4be0:	06d12e23          	sw	a3,124(sp)
    4be4:	da4ff06f          	j	4188 <_vfprintf_r+0x2164>
    4be8:	01412783          	lw	a5,20(sp)
    4bec:	0007ab03          	lw	s6,0(a5)
    4bf0:	00478793          	add	a5,a5,4
    4bf4:	000b5463          	bgez	s6,4bfc <_vfprintf_r+0x2bd8>
    4bf8:	fff00b13          	li	s6,-1
    4bfc:	00194e03          	lbu	t3,1(s2)
    4c00:	00f12a23          	sw	a5,20(sp)
    4c04:	00068913          	mv	s2,a3
    4c08:	dccfd06f          	j	21d4 <_vfprintf_r+0x1b0>
    4c0c:	00071a63          	bnez	a4,4c20 <_vfprintf_r+0x2bfc>
    4c10:	00100c93          	li	s9,1
    4c14:	06600e13          	li	t3,102
    4c18:	00100d13          	li	s10,1
    4c1c:	879ff06f          	j	4494 <_vfprintf_r+0x2470>
    4c20:	03012783          	lw	a5,48(sp)
    4c24:	06600e13          	li	t3,102
    4c28:	00178693          	add	a3,a5,1
    4c2c:	00668d33          	add	s10,a3,t1
    4c30:	fffd4813          	not	a6,s10
    4c34:	41f85813          	sra	a6,a6,0x1f
    4c38:	010d7cb3          	and	s9,s10,a6
    4c3c:	859ff06f          	j	4494 <_vfprintf_r+0x2470>
    4c40:	00200793          	li	a5,2
    4c44:	04f12023          	sw	a5,64(sp)
    4c48:	b58ff06f          	j	3fa0 <_vfprintf_r+0x1f7c>
    4c4c:	00812703          	lw	a4,8(sp)
    4c50:	00c71783          	lh	a5,12(a4)
    4c54:	0407e793          	or	a5,a5,64
    4c58:	00f71623          	sh	a5,12(a4)
    4c5c:	8b5fd06f          	j	2510 <_vfprintf_r+0x4ec>
    4c60:	000a0513          	mv	a0,s4
    4c64:	000d0593          	mv	a1,s10
    4c68:	00030613          	mv	a2,t1
    4c6c:	00038693          	mv	a3,t2
    4c70:	05012023          	sw	a6,64(sp)
    4c74:	03c12223          	sw	t3,36(sp)
    4c78:	01d12c23          	sw	t4,24(sp)
    4c7c:	0a5080ef          	jal	d520 <__eqdf2>
    4c80:	01812e83          	lw	t4,24(sp)
    4c84:	02412e03          	lw	t3,36(sp)
    4c88:	04012803          	lw	a6,64(sp)
    4c8c:	f6051463          	bnez	a0,43f4 <_vfprintf_r+0x23d0>
    4c90:	001b7693          	and	a3,s6,1
    4c94:	f6068063          	beqz	a3,43f4 <_vfprintf_r+0x23d0>
    4c98:	f14ff06f          	j	43ac <_vfprintf_r+0x2388>
    4c9c:	00812783          	lw	a5,8(sp)
    4ca0:	01012283          	lw	t0,16(sp)
    4ca4:	00c79783          	lh	a5,12(a5)
    4ca8:	0407e793          	or	a5,a5,64
    4cac:	db9ff06f          	j	4a64 <_vfprintf_r+0x2a40>
    4cb0:	02012223          	sw	zero,36(sp)
    4cb4:	02012023          	sw	zero,32(sp)
    4cb8:	e09ff06f          	j	4ac0 <_vfprintf_r+0x2a9c>
    4cbc:	04500d13          	li	s10,69
    4cc0:	cccff06f          	j	418c <_vfprintf_r+0x2168>

00004cc4 <__sbprintf>:
    4cc4:	b7010113          	add	sp,sp,-1168
    4cc8:	00c59783          	lh	a5,12(a1)
    4ccc:	00e5d703          	lhu	a4,14(a1)
    4cd0:	48812423          	sw	s0,1160(sp)
    4cd4:	00058413          	mv	s0,a1
    4cd8:	000105b7          	lui	a1,0x10
    4cdc:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x40d>
    4ce0:	06442303          	lw	t1,100(s0)
    4ce4:	01c42883          	lw	a7,28(s0)
    4ce8:	02442803          	lw	a6,36(s0)
    4cec:	01071713          	sll	a4,a4,0x10
    4cf0:	00b7f7b3          	and	a5,a5,a1
    4cf4:	00e7e7b3          	or	a5,a5,a4
    4cf8:	40000593          	li	a1,1024
    4cfc:	49212023          	sw	s2,1152(sp)
    4d00:	00f12a23          	sw	a5,20(sp)
    4d04:	00050913          	mv	s2,a0
    4d08:	07010793          	add	a5,sp,112
    4d0c:	06010513          	add	a0,sp,96
    4d10:	48112623          	sw	ra,1164(sp)
    4d14:	48912223          	sw	s1,1156(sp)
    4d18:	47312e23          	sw	s3,1148(sp)
    4d1c:	00060493          	mv	s1,a2
    4d20:	00068993          	mv	s3,a3
    4d24:	06612623          	sw	t1,108(sp)
    4d28:	03112223          	sw	a7,36(sp)
    4d2c:	03012623          	sw	a6,44(sp)
    4d30:	00f12423          	sw	a5,8(sp)
    4d34:	00f12c23          	sw	a5,24(sp)
    4d38:	00b12823          	sw	a1,16(sp)
    4d3c:	00b12e23          	sw	a1,28(sp)
    4d40:	02012023          	sw	zero,32(sp)
    4d44:	b7cfc0ef          	jal	10c0 <__retarget_lock_init_recursive>
    4d48:	00048613          	mv	a2,s1
    4d4c:	00098693          	mv	a3,s3
    4d50:	00810593          	add	a1,sp,8
    4d54:	00090513          	mv	a0,s2
    4d58:	accfd0ef          	jal	2024 <_vfprintf_r>
    4d5c:	00050493          	mv	s1,a0
    4d60:	04055263          	bgez	a0,4da4 <__sbprintf+0xe0>
    4d64:	01415783          	lhu	a5,20(sp)
    4d68:	0407f793          	and	a5,a5,64
    4d6c:	00078863          	beqz	a5,4d7c <__sbprintf+0xb8>
    4d70:	00c45783          	lhu	a5,12(s0)
    4d74:	0407e793          	or	a5,a5,64
    4d78:	00f41623          	sh	a5,12(s0)
    4d7c:	06012503          	lw	a0,96(sp)
    4d80:	b44fc0ef          	jal	10c4 <__retarget_lock_close_recursive>
    4d84:	48c12083          	lw	ra,1164(sp)
    4d88:	48812403          	lw	s0,1160(sp)
    4d8c:	48012903          	lw	s2,1152(sp)
    4d90:	47c12983          	lw	s3,1148(sp)
    4d94:	00048513          	mv	a0,s1
    4d98:	48412483          	lw	s1,1156(sp)
    4d9c:	49010113          	add	sp,sp,1168
    4da0:	00008067          	ret
    4da4:	00810593          	add	a1,sp,8
    4da8:	00090513          	mv	a0,s2
    4dac:	449010ef          	jal	69f4 <_fflush_r>
    4db0:	fa050ae3          	beqz	a0,4d64 <__sbprintf+0xa0>
    4db4:	fff00493          	li	s1,-1
    4db8:	fadff06f          	j	4d64 <__sbprintf+0xa0>

00004dbc <__sprint_r.part.0>:
    4dbc:	0645a783          	lw	a5,100(a1)
    4dc0:	fd010113          	add	sp,sp,-48
    4dc4:	01612823          	sw	s6,16(sp)
    4dc8:	02112623          	sw	ra,44(sp)
    4dcc:	01279713          	sll	a4,a5,0x12
    4dd0:	00060b13          	mv	s6,a2
    4dd4:	0e075863          	bgez	a4,4ec4 <__sprint_r.part.0+0x108>
    4dd8:	00862783          	lw	a5,8(a2)
    4ddc:	03212023          	sw	s2,32(sp)
    4de0:	01312e23          	sw	s3,28(sp)
    4de4:	01512a23          	sw	s5,20(sp)
    4de8:	01712623          	sw	s7,12(sp)
    4dec:	00058913          	mv	s2,a1
    4df0:	00062b83          	lw	s7,0(a2)
    4df4:	00050993          	mv	s3,a0
    4df8:	fff00a93          	li	s5,-1
    4dfc:	0a078863          	beqz	a5,4eac <__sprint_r.part.0+0xf0>
    4e00:	02812423          	sw	s0,40(sp)
    4e04:	02912223          	sw	s1,36(sp)
    4e08:	01412c23          	sw	s4,24(sp)
    4e0c:	01812423          	sw	s8,8(sp)
    4e10:	004bac03          	lw	s8,4(s7)
    4e14:	000ba403          	lw	s0,0(s7)
    4e18:	002c5a13          	srl	s4,s8,0x2
    4e1c:	060a0663          	beqz	s4,4e88 <__sprint_r.part.0+0xcc>
    4e20:	00000493          	li	s1,0
    4e24:	00c0006f          	j	4e30 <__sprint_r.part.0+0x74>
    4e28:	00440413          	add	s0,s0,4
    4e2c:	049a0c63          	beq	s4,s1,4e84 <__sprint_r.part.0+0xc8>
    4e30:	00042583          	lw	a1,0(s0)
    4e34:	00090613          	mv	a2,s2
    4e38:	00098513          	mv	a0,s3
    4e3c:	399020ef          	jal	79d4 <_fputwc_r>
    4e40:	00148493          	add	s1,s1,1
    4e44:	ff5512e3          	bne	a0,s5,4e28 <__sprint_r.part.0+0x6c>
    4e48:	02812403          	lw	s0,40(sp)
    4e4c:	02412483          	lw	s1,36(sp)
    4e50:	02012903          	lw	s2,32(sp)
    4e54:	01c12983          	lw	s3,28(sp)
    4e58:	01812a03          	lw	s4,24(sp)
    4e5c:	01412a83          	lw	s5,20(sp)
    4e60:	00c12b83          	lw	s7,12(sp)
    4e64:	00812c03          	lw	s8,8(sp)
    4e68:	fff00513          	li	a0,-1
    4e6c:	02c12083          	lw	ra,44(sp)
    4e70:	000b2423          	sw	zero,8(s6)
    4e74:	000b2223          	sw	zero,4(s6)
    4e78:	01012b03          	lw	s6,16(sp)
    4e7c:	03010113          	add	sp,sp,48
    4e80:	00008067          	ret
    4e84:	008b2783          	lw	a5,8(s6)
    4e88:	ffcc7c13          	and	s8,s8,-4
    4e8c:	418787b3          	sub	a5,a5,s8
    4e90:	00fb2423          	sw	a5,8(s6)
    4e94:	008b8b93          	add	s7,s7,8
    4e98:	f6079ce3          	bnez	a5,4e10 <__sprint_r.part.0+0x54>
    4e9c:	02812403          	lw	s0,40(sp)
    4ea0:	02412483          	lw	s1,36(sp)
    4ea4:	01812a03          	lw	s4,24(sp)
    4ea8:	00812c03          	lw	s8,8(sp)
    4eac:	02012903          	lw	s2,32(sp)
    4eb0:	01c12983          	lw	s3,28(sp)
    4eb4:	01412a83          	lw	s5,20(sp)
    4eb8:	00c12b83          	lw	s7,12(sp)
    4ebc:	00000513          	li	a0,0
    4ec0:	fadff06f          	j	4e6c <__sprint_r.part.0+0xb0>
    4ec4:	6b5010ef          	jal	6d78 <__sfvwrite_r>
    4ec8:	02c12083          	lw	ra,44(sp)
    4ecc:	000b2423          	sw	zero,8(s6)
    4ed0:	000b2223          	sw	zero,4(s6)
    4ed4:	01012b03          	lw	s6,16(sp)
    4ed8:	03010113          	add	sp,sp,48
    4edc:	00008067          	ret

00004ee0 <__sprint_r>:
    4ee0:	00862703          	lw	a4,8(a2)
    4ee4:	00070463          	beqz	a4,4eec <__sprint_r+0xc>
    4ee8:	ed5ff06f          	j	4dbc <__sprint_r.part.0>
    4eec:	00062223          	sw	zero,4(a2)
    4ef0:	00000513          	li	a0,0
    4ef4:	00008067          	ret

00004ef8 <_vfiprintf_r>:
    4ef8:	eb010113          	add	sp,sp,-336
    4efc:	14812423          	sw	s0,328(sp)
    4f00:	13312e23          	sw	s3,316(sp)
    4f04:	13812423          	sw	s8,296(sp)
    4f08:	00050413          	mv	s0,a0
    4f0c:	00058993          	mv	s3,a1
    4f10:	00060c13          	mv	s8,a2
    4f14:	00000593          	li	a1,0
    4f18:	00800613          	li	a2,8
    4f1c:	05010513          	add	a0,sp,80
    4f20:	13512a23          	sw	s5,308(sp)
    4f24:	14112623          	sw	ra,332(sp)
    4f28:	00068a93          	mv	s5,a3
    4f2c:	9a4fc0ef          	jal	10d0 <memset>
    4f30:	00040863          	beqz	s0,4f40 <_vfiprintf_r+0x48>
    4f34:	03442783          	lw	a5,52(s0)
    4f38:	00079463          	bnez	a5,4f40 <_vfiprintf_r+0x48>
    4f3c:	49c0106f          	j	63d8 <_vfiprintf_r+0x14e0>
    4f40:	0649a703          	lw	a4,100(s3)
    4f44:	00c99783          	lh	a5,12(s3)
    4f48:	00177713          	and	a4,a4,1
    4f4c:	00071863          	bnez	a4,4f5c <_vfiprintf_r+0x64>
    4f50:	2007f713          	and	a4,a5,512
    4f54:	00071463          	bnez	a4,4f5c <_vfiprintf_r+0x64>
    4f58:	0b80106f          	j	6010 <_vfiprintf_r+0x1118>
    4f5c:	01279713          	sll	a4,a5,0x12
    4f60:	02074663          	bltz	a4,4f8c <_vfiprintf_r+0x94>
    4f64:	0649a703          	lw	a4,100(s3)
    4f68:	00002637          	lui	a2,0x2
    4f6c:	ffffe6b7          	lui	a3,0xffffe
    4f70:	00c7e7b3          	or	a5,a5,a2
    4f74:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4f78:	01079793          	sll	a5,a5,0x10
    4f7c:	4107d793          	sra	a5,a5,0x10
    4f80:	00d77733          	and	a4,a4,a3
    4f84:	00f99623          	sh	a5,12(s3)
    4f88:	06e9a223          	sw	a4,100(s3)
    4f8c:	0087f713          	and	a4,a5,8
    4f90:	2e070463          	beqz	a4,5278 <_vfiprintf_r+0x380>
    4f94:	0109a703          	lw	a4,16(s3)
    4f98:	2e070063          	beqz	a4,5278 <_vfiprintf_r+0x380>
    4f9c:	01a7f713          	and	a4,a5,26
    4fa0:	00a00693          	li	a3,10
    4fa4:	2ed70c63          	beq	a4,a3,529c <_vfiprintf_r+0x3a4>
    4fa8:	13412c23          	sw	s4,312(sp)
    4fac:	06c10a13          	add	s4,sp,108
    4fb0:	14912223          	sw	s1,324(sp)
    4fb4:	15212023          	sw	s2,320(sp)
    4fb8:	13612823          	sw	s6,304(sp)
    4fbc:	13712623          	sw	s7,300(sp)
    4fc0:	13912223          	sw	s9,292(sp)
    4fc4:	13a12023          	sw	s10,288(sp)
    4fc8:	000c0c93          	mv	s9,s8
    4fcc:	11b12e23          	sw	s11,284(sp)
    4fd0:	07412023          	sw	s4,96(sp)
    4fd4:	06012423          	sw	zero,104(sp)
    4fd8:	06012223          	sw	zero,100(sp)
    4fdc:	00012a23          	sw	zero,20(sp)
    4fe0:	02012623          	sw	zero,44(sp)
    4fe4:	02012823          	sw	zero,48(sp)
    4fe8:	02012a23          	sw	zero,52(sp)
    4fec:	00012623          	sw	zero,12(sp)
    4ff0:	7fffb497          	auipc	s1,0x7fffb
    4ff4:	54448493          	add	s1,s1,1348 # 80000534 <__global_locale>
    4ff8:	02500913          	li	s2,37
    4ffc:	0000bb97          	auipc	s7,0xb
    5000:	828b8b93          	add	s7,s7,-2008 # f824 <blanks.1+0x10>
    5004:	0000bb17          	auipc	s6,0xb
    5008:	98cb0b13          	add	s6,s6,-1652 # f990 <zeroes.0>
    500c:	000a0c13          	mv	s8,s4
    5010:	000c8d93          	mv	s11,s9
    5014:	0e44ad03          	lw	s10,228(s1)
    5018:	3f9020ef          	jal	7c10 <__locale_mb_cur_max>
    501c:	00050693          	mv	a3,a0
    5020:	05010713          	add	a4,sp,80
    5024:	000d8613          	mv	a2,s11
    5028:	04810593          	add	a1,sp,72
    502c:	00040513          	mv	a0,s0
    5030:	000d00e7          	jalr	s10
    5034:	2e050e63          	beqz	a0,5330 <_vfiprintf_r+0x438>
    5038:	2c054e63          	bltz	a0,5314 <_vfiprintf_r+0x41c>
    503c:	04812783          	lw	a5,72(sp)
    5040:	01278663          	beq	a5,s2,504c <_vfiprintf_r+0x154>
    5044:	00ad8db3          	add	s11,s11,a0
    5048:	fcdff06f          	j	5014 <_vfiprintf_r+0x11c>
    504c:	00050d13          	mv	s10,a0
    5050:	419d87b3          	sub	a5,s11,s9
    5054:	2f9d9463          	bne	s11,s9,533c <_vfiprintf_r+0x444>
    5058:	00000e13          	li	t3,0
    505c:	001dc683          	lbu	a3,1(s11)
    5060:	001d8c93          	add	s9,s11,1
    5064:	040101a3          	sb	zero,67(sp)
    5068:	fff00713          	li	a4,-1
    506c:	00000893          	li	a7,0
    5070:	05a00d13          	li	s10,90
    5074:	000e0d93          	mv	s11,t3
    5078:	001c8c93          	add	s9,s9,1
    507c:	fe068793          	add	a5,a3,-32
    5080:	04fd6663          	bltu	s10,a5,50cc <_vfiprintf_r+0x1d4>
    5084:	00279793          	sll	a5,a5,0x2
    5088:	017787b3          	add	a5,a5,s7
    508c:	0007a783          	lw	a5,0(a5)
    5090:	017787b3          	add	a5,a5,s7
    5094:	00078067          	jr	a5
    5098:	00000893          	li	a7,0
    509c:	fd068793          	add	a5,a3,-48
    50a0:	00900593          	li	a1,9
    50a4:	000cc683          	lbu	a3,0(s9)
    50a8:	00289613          	sll	a2,a7,0x2
    50ac:	011608b3          	add	a7,a2,a7
    50b0:	00189893          	sll	a7,a7,0x1
    50b4:	011788b3          	add	a7,a5,a7
    50b8:	fd068793          	add	a5,a3,-48
    50bc:	001c8c93          	add	s9,s9,1
    50c0:	fef5f2e3          	bgeu	a1,a5,50a4 <_vfiprintf_r+0x1ac>
    50c4:	fe068793          	add	a5,a3,-32
    50c8:	fafd7ee3          	bgeu	s10,a5,5084 <_vfiprintf_r+0x18c>
    50cc:	000d8e13          	mv	t3,s11
    50d0:	2c068663          	beqz	a3,539c <_vfiprintf_r+0x4a4>
    50d4:	0ad10623          	sb	a3,172(sp)
    50d8:	040101a3          	sb	zero,67(sp)
    50dc:	00100e93          	li	t4,1
    50e0:	00100d13          	li	s10,1
    50e4:	0ac10813          	add	a6,sp,172
    50e8:	00012823          	sw	zero,16(sp)
    50ec:	00000713          	li	a4,0
    50f0:	00000f93          	li	t6,0
    50f4:	06412603          	lw	a2,100(sp)
    50f8:	084e7293          	and	t0,t3,132
    50fc:	06812783          	lw	a5,104(sp)
    5100:	00160593          	add	a1,a2,1 # 2001 <_malloc_r+0x7d5>
    5104:	00058f13          	mv	t5,a1
    5108:	00029663          	bnez	t0,5114 <_vfiprintf_r+0x21c>
    510c:	41d88db3          	sub	s11,a7,t4
    5110:	47b046e3          	bgtz	s11,5d7c <_vfiprintf_r+0xe84>
    5114:	04314583          	lbu	a1,67(sp)
    5118:	02058a63          	beqz	a1,514c <_vfiprintf_r+0x254>
    511c:	04310613          	add	a2,sp,67
    5120:	00178793          	add	a5,a5,1
    5124:	00100693          	li	a3,1
    5128:	00cc2023          	sw	a2,0(s8)
    512c:	00dc2223          	sw	a3,4(s8)
    5130:	06f12423          	sw	a5,104(sp)
    5134:	07e12223          	sw	t5,100(sp)
    5138:	00700613          	li	a2,7
    513c:	35e64ce3          	blt	a2,t5,5c94 <_vfiprintf_r+0xd9c>
    5140:	000f0613          	mv	a2,t5
    5144:	008c0c13          	add	s8,s8,8
    5148:	001f0f13          	add	t5,t5,1
    514c:	080f8063          	beqz	t6,51cc <_vfiprintf_r+0x2d4>
    5150:	00200613          	li	a2,2
    5154:	00278793          	add	a5,a5,2
    5158:	04410693          	add	a3,sp,68
    515c:	00cc2223          	sw	a2,4(s8)
    5160:	00dc2023          	sw	a3,0(s8)
    5164:	06f12423          	sw	a5,104(sp)
    5168:	07e12223          	sw	t5,100(sp)
    516c:	00700613          	li	a2,7
    5170:	3be652e3          	bge	a2,t5,5d14 <_vfiprintf_r+0xe1c>
    5174:	60078ae3          	beqz	a5,5f88 <_vfiprintf_r+0x1090>
    5178:	06010613          	add	a2,sp,96
    517c:	00098593          	mv	a1,s3
    5180:	00040513          	mv	a0,s0
    5184:	03d12c23          	sw	t4,56(sp)
    5188:	02e12423          	sw	a4,40(sp)
    518c:	03112223          	sw	a7,36(sp)
    5190:	03012023          	sw	a6,32(sp)
    5194:	00512e23          	sw	t0,28(sp)
    5198:	01c12c23          	sw	t3,24(sp)
    519c:	c21ff0ef          	jal	4dbc <__sprint_r.part.0>
    51a0:	22051463          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    51a4:	06412603          	lw	a2,100(sp)
    51a8:	06812783          	lw	a5,104(sp)
    51ac:	03812e83          	lw	t4,56(sp)
    51b0:	02812703          	lw	a4,40(sp)
    51b4:	02412883          	lw	a7,36(sp)
    51b8:	02012803          	lw	a6,32(sp)
    51bc:	01c12283          	lw	t0,28(sp)
    51c0:	01812e03          	lw	t3,24(sp)
    51c4:	000a0c13          	mv	s8,s4
    51c8:	00160f13          	add	t5,a2,1
    51cc:	08000593          	li	a1,128
    51d0:	06b286e3          	beq	t0,a1,5a3c <_vfiprintf_r+0xb44>
    51d4:	41a70733          	sub	a4,a4,s10
    51d8:	1ae04ae3          	bgtz	a4,5b8c <_vfiprintf_r+0xc94>
    51dc:	00fd07b3          	add	a5,s10,a5
    51e0:	010c2023          	sw	a6,0(s8)
    51e4:	01ac2223          	sw	s10,4(s8)
    51e8:	06f12423          	sw	a5,104(sp)
    51ec:	07e12223          	sw	t5,100(sp)
    51f0:	00700713          	li	a4,7
    51f4:	03e758e3          	bge	a4,t5,5a24 <_vfiprintf_r+0xb2c>
    51f8:	24078063          	beqz	a5,5438 <_vfiprintf_r+0x540>
    51fc:	06010613          	add	a2,sp,96
    5200:	00098593          	mv	a1,s3
    5204:	00040513          	mv	a0,s0
    5208:	03d12023          	sw	t4,32(sp)
    520c:	01112e23          	sw	a7,28(sp)
    5210:	01c12c23          	sw	t3,24(sp)
    5214:	ba9ff0ef          	jal	4dbc <__sprint_r.part.0>
    5218:	1a051863          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    521c:	06812783          	lw	a5,104(sp)
    5220:	02012e83          	lw	t4,32(sp)
    5224:	01c12883          	lw	a7,28(sp)
    5228:	01812e03          	lw	t3,24(sp)
    522c:	000a0c13          	mv	s8,s4
    5230:	004e7e13          	and	t3,t3,4
    5234:	000e0663          	beqz	t3,5240 <_vfiprintf_r+0x348>
    5238:	41d88db3          	sub	s11,a7,t4
    523c:	21b04a63          	bgtz	s11,5450 <_vfiprintf_r+0x558>
    5240:	01d8d463          	bge	a7,t4,5248 <_vfiprintf_r+0x350>
    5244:	000e8893          	mv	a7,t4
    5248:	00c12703          	lw	a4,12(sp)
    524c:	01170733          	add	a4,a4,a7
    5250:	00e12623          	sw	a4,12(sp)
    5254:	16079063          	bnez	a5,53b4 <_vfiprintf_r+0x4bc>
    5258:	01012783          	lw	a5,16(sp)
    525c:	06012223          	sw	zero,100(sp)
    5260:	00078863          	beqz	a5,5270 <_vfiprintf_r+0x378>
    5264:	00078593          	mv	a1,a5
    5268:	00040513          	mv	a0,s0
    526c:	ab4fc0ef          	jal	1520 <_free_r>
    5270:	000a0c13          	mv	s8,s4
    5274:	d9dff06f          	j	5010 <_vfiprintf_r+0x118>
    5278:	00098593          	mv	a1,s3
    527c:	00040513          	mv	a0,s0
    5280:	4b0020ef          	jal	7730 <__swsetup_r>
    5284:	00050463          	beqz	a0,528c <_vfiprintf_r+0x394>
    5288:	3840106f          	j	660c <_vfiprintf_r+0x1714>
    528c:	00c99783          	lh	a5,12(s3)
    5290:	00a00693          	li	a3,10
    5294:	01a7f713          	and	a4,a5,26
    5298:	d0d718e3          	bne	a4,a3,4fa8 <_vfiprintf_r+0xb0>
    529c:	00e99703          	lh	a4,14(s3)
    52a0:	d00744e3          	bltz	a4,4fa8 <_vfiprintf_r+0xb0>
    52a4:	0649a703          	lw	a4,100(s3)
    52a8:	00177713          	and	a4,a4,1
    52ac:	00071863          	bnez	a4,52bc <_vfiprintf_r+0x3c4>
    52b0:	2007f793          	and	a5,a5,512
    52b4:	00079463          	bnez	a5,52bc <_vfiprintf_r+0x3c4>
    52b8:	2ac0106f          	j	6564 <_vfiprintf_r+0x166c>
    52bc:	000a8693          	mv	a3,s5
    52c0:	000c0613          	mv	a2,s8
    52c4:	00098593          	mv	a1,s3
    52c8:	00040513          	mv	a0,s0
    52cc:	3e4010ef          	jal	66b0 <__sbprintf>
    52d0:	14c12083          	lw	ra,332(sp)
    52d4:	14812403          	lw	s0,328(sp)
    52d8:	00a12623          	sw	a0,12(sp)
    52dc:	00c12503          	lw	a0,12(sp)
    52e0:	13c12983          	lw	s3,316(sp)
    52e4:	13412a83          	lw	s5,308(sp)
    52e8:	12812c03          	lw	s8,296(sp)
    52ec:	15010113          	add	sp,sp,336
    52f0:	00008067          	ret
    52f4:	000aa883          	lw	a7,0(s5)
    52f8:	004a8a93          	add	s5,s5,4
    52fc:	3608cc63          	bltz	a7,5674 <_vfiprintf_r+0x77c>
    5300:	000cc683          	lbu	a3,0(s9)
    5304:	d75ff06f          	j	5078 <_vfiprintf_r+0x180>
    5308:	000cc683          	lbu	a3,0(s9)
    530c:	020ded93          	or	s11,s11,32
    5310:	d69ff06f          	j	5078 <_vfiprintf_r+0x180>
    5314:	00800613          	li	a2,8
    5318:	00000593          	li	a1,0
    531c:	05010513          	add	a0,sp,80
    5320:	db1fb0ef          	jal	10d0 <memset>
    5324:	00100513          	li	a0,1
    5328:	00ad8db3          	add	s11,s11,a0
    532c:	ce9ff06f          	j	5014 <_vfiprintf_r+0x11c>
    5330:	00050d13          	mv	s10,a0
    5334:	419d87b3          	sub	a5,s11,s9
    5338:	079d8263          	beq	s11,s9,539c <_vfiprintf_r+0x4a4>
    533c:	06812683          	lw	a3,104(sp)
    5340:	06412703          	lw	a4,100(sp)
    5344:	019c2023          	sw	s9,0(s8)
    5348:	00d786b3          	add	a3,a5,a3
    534c:	00170713          	add	a4,a4,1
    5350:	00fc2223          	sw	a5,4(s8)
    5354:	06d12423          	sw	a3,104(sp)
    5358:	06e12223          	sw	a4,100(sp)
    535c:	00700613          	li	a2,7
    5360:	008c0c13          	add	s8,s8,8
    5364:	02e65463          	bge	a2,a4,538c <_vfiprintf_r+0x494>
    5368:	38068ce3          	beqz	a3,5f00 <_vfiprintf_r+0x1008>
    536c:	06010613          	add	a2,sp,96
    5370:	00098593          	mv	a1,s3
    5374:	00040513          	mv	a0,s0
    5378:	00f12823          	sw	a5,16(sp)
    537c:	a41ff0ef          	jal	4dbc <__sprint_r.part.0>
    5380:	01012783          	lw	a5,16(sp)
    5384:	04051c63          	bnez	a0,53dc <_vfiprintf_r+0x4e4>
    5388:	000a0c13          	mv	s8,s4
    538c:	00c12703          	lw	a4,12(sp)
    5390:	00f707b3          	add	a5,a4,a5
    5394:	00f12623          	sw	a5,12(sp)
    5398:	cc0d10e3          	bnez	s10,5058 <_vfiprintf_r+0x160>
    539c:	06812783          	lw	a5,104(sp)
    53a0:	00078463          	beqz	a5,53a8 <_vfiprintf_r+0x4b0>
    53a4:	22c0106f          	j	65d0 <_vfiprintf_r+0x16d8>
    53a8:	00c99783          	lh	a5,12(s3)
    53ac:	06012223          	sw	zero,100(sp)
    53b0:	0300006f          	j	53e0 <_vfiprintf_r+0x4e8>
    53b4:	06010613          	add	a2,sp,96
    53b8:	00098593          	mv	a1,s3
    53bc:	00040513          	mv	a0,s0
    53c0:	9fdff0ef          	jal	4dbc <__sprint_r.part.0>
    53c4:	e8050ae3          	beqz	a0,5258 <_vfiprintf_r+0x360>
    53c8:	01012783          	lw	a5,16(sp)
    53cc:	00078863          	beqz	a5,53dc <_vfiprintf_r+0x4e4>
    53d0:	01012583          	lw	a1,16(sp)
    53d4:	00040513          	mv	a0,s0
    53d8:	948fc0ef          	jal	1520 <_free_r>
    53dc:	00c99783          	lh	a5,12(s3)
    53e0:	0649a703          	lw	a4,100(s3)
    53e4:	00177713          	and	a4,a4,1
    53e8:	16070a63          	beqz	a4,555c <_vfiprintf_r+0x664>
    53ec:	0407f793          	and	a5,a5,64
    53f0:	14412483          	lw	s1,324(sp)
    53f4:	14012903          	lw	s2,320(sp)
    53f8:	13812a03          	lw	s4,312(sp)
    53fc:	13012b03          	lw	s6,304(sp)
    5400:	12c12b83          	lw	s7,300(sp)
    5404:	12412c83          	lw	s9,292(sp)
    5408:	12012d03          	lw	s10,288(sp)
    540c:	11c12d83          	lw	s11,284(sp)
    5410:	00078463          	beqz	a5,5418 <_vfiprintf_r+0x520>
    5414:	2180106f          	j	662c <_vfiprintf_r+0x1734>
    5418:	14c12083          	lw	ra,332(sp)
    541c:	14812403          	lw	s0,328(sp)
    5420:	00c12503          	lw	a0,12(sp)
    5424:	13c12983          	lw	s3,316(sp)
    5428:	13412a83          	lw	s5,308(sp)
    542c:	12812c03          	lw	s8,296(sp)
    5430:	15010113          	add	sp,sp,336
    5434:	00008067          	ret
    5438:	06012223          	sw	zero,100(sp)
    543c:	004e7e13          	and	t3,t3,4
    5440:	240e0ee3          	beqz	t3,5e9c <_vfiprintf_r+0xfa4>
    5444:	41d88db3          	sub	s11,a7,t4
    5448:	25b05ae3          	blez	s11,5e9c <_vfiprintf_r+0xfa4>
    544c:	000a0c13          	mv	s8,s4
    5450:	01000713          	li	a4,16
    5454:	06412683          	lw	a3,100(sp)
    5458:	01b74463          	blt	a4,s11,5460 <_vfiprintf_r+0x568>
    545c:	1900106f          	j	65ec <_vfiprintf_r+0x16f4>
    5460:	000a8713          	mv	a4,s5
    5464:	0000a317          	auipc	t1,0xa
    5468:	53c30313          	add	t1,t1,1340 # f9a0 <blanks.1>
    546c:	000c0593          	mv	a1,s8
    5470:	000d8a93          	mv	s5,s11
    5474:	01000813          	li	a6,16
    5478:	00700d13          	li	s10,7
    547c:	01112c23          	sw	a7,24(sp)
    5480:	01d12e23          	sw	t4,28(sp)
    5484:	00030c13          	mv	s8,t1
    5488:	00070d93          	mv	s11,a4
    548c:	0180006f          	j	54a4 <_vfiprintf_r+0x5ac>
    5490:	00268613          	add	a2,a3,2
    5494:	00858593          	add	a1,a1,8
    5498:	00070693          	mv	a3,a4
    549c:	ff0a8a93          	add	s5,s5,-16
    54a0:	05585a63          	bge	a6,s5,54f4 <_vfiprintf_r+0x5fc>
    54a4:	01078793          	add	a5,a5,16
    54a8:	00168713          	add	a4,a3,1
    54ac:	0185a023          	sw	s8,0(a1)
    54b0:	0105a223          	sw	a6,4(a1)
    54b4:	06f12423          	sw	a5,104(sp)
    54b8:	06e12223          	sw	a4,100(sp)
    54bc:	fced5ae3          	bge	s10,a4,5490 <_vfiprintf_r+0x598>
    54c0:	56078663          	beqz	a5,5a2c <_vfiprintf_r+0xb34>
    54c4:	06010613          	add	a2,sp,96
    54c8:	00098593          	mv	a1,s3
    54cc:	00040513          	mv	a0,s0
    54d0:	8edff0ef          	jal	4dbc <__sprint_r.part.0>
    54d4:	ee051ae3          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    54d8:	06412683          	lw	a3,100(sp)
    54dc:	01000813          	li	a6,16
    54e0:	ff0a8a93          	add	s5,s5,-16
    54e4:	06812783          	lw	a5,104(sp)
    54e8:	000a0593          	mv	a1,s4
    54ec:	00168613          	add	a2,a3,1
    54f0:	fb584ae3          	blt	a6,s5,54a4 <_vfiprintf_r+0x5ac>
    54f4:	01812883          	lw	a7,24(sp)
    54f8:	01c12e83          	lw	t4,28(sp)
    54fc:	000d8713          	mv	a4,s11
    5500:	000c0313          	mv	t1,s8
    5504:	000a8d93          	mv	s11,s5
    5508:	00058c13          	mv	s8,a1
    550c:	00070a93          	mv	s5,a4
    5510:	01b787b3          	add	a5,a5,s11
    5514:	006c2023          	sw	t1,0(s8)
    5518:	01bc2223          	sw	s11,4(s8)
    551c:	06f12423          	sw	a5,104(sp)
    5520:	06c12223          	sw	a2,100(sp)
    5524:	00700713          	li	a4,7
    5528:	d0c75ce3          	bge	a4,a2,5240 <_vfiprintf_r+0x348>
    552c:	160788e3          	beqz	a5,5e9c <_vfiprintf_r+0xfa4>
    5530:	06010613          	add	a2,sp,96
    5534:	00098593          	mv	a1,s3
    5538:	00040513          	mv	a0,s0
    553c:	01d12e23          	sw	t4,28(sp)
    5540:	01112c23          	sw	a7,24(sp)
    5544:	879ff0ef          	jal	4dbc <__sprint_r.part.0>
    5548:	e80510e3          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    554c:	06812783          	lw	a5,104(sp)
    5550:	01c12e83          	lw	t4,28(sp)
    5554:	01812883          	lw	a7,24(sp)
    5558:	ce9ff06f          	j	5240 <_vfiprintf_r+0x348>
    555c:	2007f713          	and	a4,a5,512
    5560:	e80716e3          	bnez	a4,53ec <_vfiprintf_r+0x4f4>
    5564:	0589a503          	lw	a0,88(s3)
    5568:	b65fb0ef          	jal	10cc <__retarget_lock_release_recursive>
    556c:	00c99783          	lh	a5,12(s3)
    5570:	e7dff06f          	j	53ec <_vfiprintf_r+0x4f4>
    5574:	000aa803          	lw	a6,0(s5)
    5578:	040101a3          	sb	zero,67(sp)
    557c:	000d8e13          	mv	t3,s11
    5580:	004a8a93          	add	s5,s5,4
    5584:	68080ae3          	beqz	a6,6418 <_vfiprintf_r+0x1520>
    5588:	05300793          	li	a5,83
    558c:	3cf68ce3          	beq	a3,a5,6164 <_vfiprintf_r+0x126c>
    5590:	010df793          	and	a5,s11,16
    5594:	3c0798e3          	bnez	a5,6164 <_vfiprintf_r+0x126c>
    5598:	00075463          	bgez	a4,55a0 <_vfiprintf_r+0x6a8>
    559c:	7fd0006f          	j	6598 <_vfiprintf_r+0x16a0>
    55a0:	00070613          	mv	a2,a4
    55a4:	00080513          	mv	a0,a6
    55a8:	00000593          	li	a1,0
    55ac:	03112223          	sw	a7,36(sp)
    55b0:	00e12e23          	sw	a4,28(sp)
    55b4:	01012c23          	sw	a6,24(sp)
    55b8:	03b12023          	sw	s11,32(sp)
    55bc:	4e4020ef          	jal	7aa0 <memchr>
    55c0:	00a12823          	sw	a0,16(sp)
    55c4:	01812803          	lw	a6,24(sp)
    55c8:	01c12703          	lw	a4,28(sp)
    55cc:	02012e03          	lw	t3,32(sp)
    55d0:	02412883          	lw	a7,36(sp)
    55d4:	00051463          	bnez	a0,55dc <_vfiprintf_r+0x6e4>
    55d8:	7990006f          	j	6570 <_vfiprintf_r+0x1678>
    55dc:	41050d33          	sub	s10,a0,a6
    55e0:	fffd4e93          	not	t4,s10
    55e4:	41fede93          	sra	t4,t4,0x1f
    55e8:	01dd7eb3          	and	t4,s10,t4
    55ec:	00012823          	sw	zero,16(sp)
    55f0:	6dd0006f          	j	64cc <_vfiprintf_r+0x15d4>
    55f4:	04300793          	li	a5,67
    55f8:	000d8e13          	mv	t3,s11
    55fc:	004a8d93          	add	s11,s5,4
    5600:	00f68663          	beq	a3,a5,560c <_vfiprintf_r+0x714>
    5604:	010e7793          	and	a5,t3,16
    5608:	280788e3          	beqz	a5,6098 <_vfiprintf_r+0x11a0>
    560c:	00800613          	li	a2,8
    5610:	00000593          	li	a1,0
    5614:	05810513          	add	a0,sp,88
    5618:	01112e23          	sw	a7,28(sp)
    561c:	01c12c23          	sw	t3,24(sp)
    5620:	ab1fb0ef          	jal	10d0 <memset>
    5624:	000aa603          	lw	a2,0(s5)
    5628:	0ac10593          	add	a1,sp,172
    562c:	05810693          	add	a3,sp,88
    5630:	00040513          	mv	a0,s0
    5634:	00b12823          	sw	a1,16(sp)
    5638:	694050ef          	jal	accc <_wcrtomb_r>
    563c:	fff00793          	li	a5,-1
    5640:	01012583          	lw	a1,16(sp)
    5644:	01812e03          	lw	t3,24(sp)
    5648:	01c12883          	lw	a7,28(sp)
    564c:	00050d13          	mv	s10,a0
    5650:	00f51463          	bne	a0,a5,5658 <_vfiprintf_r+0x760>
    5654:	0200106f          	j	6674 <_vfiprintf_r+0x177c>
    5658:	fff54e93          	not	t4,a0
    565c:	41fede93          	sra	t4,t4,0x1f
    5660:	01d57eb3          	and	t4,a0,t4
    5664:	040101a3          	sb	zero,67(sp)
    5668:	000d8a93          	mv	s5,s11
    566c:	00058813          	mv	a6,a1
    5670:	a79ff06f          	j	50e8 <_vfiprintf_r+0x1f0>
    5674:	411008b3          	neg	a7,a7
    5678:	000cc683          	lbu	a3,0(s9)
    567c:	004ded93          	or	s11,s11,4
    5680:	9f9ff06f          	j	5078 <_vfiprintf_r+0x180>
    5684:	010dee13          	or	t3,s11,16
    5688:	020e7793          	and	a5,t3,32
    568c:	0c0788e3          	beqz	a5,5f5c <_vfiprintf_r+0x1064>
    5690:	007a8a93          	add	s5,s5,7
    5694:	ff8afa93          	and	s5,s5,-8
    5698:	004aa683          	lw	a3,4(s5)
    569c:	000aad83          	lw	s11,0(s5)
    56a0:	008a8a93          	add	s5,s5,8
    56a4:	00068d13          	mv	s10,a3
    56a8:	3006c263          	bltz	a3,59ac <_vfiprintf_r+0xab4>
    56ac:	32074063          	bltz	a4,59cc <_vfiprintf_r+0xad4>
    56b0:	01ade6b3          	or	a3,s11,s10
    56b4:	f7fe7e13          	and	t3,t3,-129
    56b8:	30069a63          	bnez	a3,59cc <_vfiprintf_r+0xad4>
    56bc:	68071ae3          	bnez	a4,6550 <_vfiprintf_r+0x1658>
    56c0:	04314783          	lbu	a5,67(sp)
    56c4:	00012823          	sw	zero,16(sp)
    56c8:	00000e93          	li	t4,0
    56cc:	00000d13          	li	s10,0
    56d0:	11010813          	add	a6,sp,272
    56d4:	00078463          	beqz	a5,56dc <_vfiprintf_r+0x7e4>
    56d8:	001e8e93          	add	t4,t4,1
    56dc:	002e7f93          	and	t6,t3,2
    56e0:	a00f8ae3          	beqz	t6,50f4 <_vfiprintf_r+0x1fc>
    56e4:	002e8e93          	add	t4,t4,2
    56e8:	00200f93          	li	t6,2
    56ec:	a09ff06f          	j	50f4 <_vfiprintf_r+0x1fc>
    56f0:	000cc683          	lbu	a3,0(s9)
    56f4:	06800793          	li	a5,104
    56f8:	4ef686e3          	beq	a3,a5,63e4 <_vfiprintf_r+0x14ec>
    56fc:	040ded93          	or	s11,s11,64
    5700:	979ff06f          	j	5078 <_vfiprintf_r+0x180>
    5704:	010de613          	or	a2,s11,16
    5708:	02067793          	and	a5,a2,32
    570c:	000780e3          	beqz	a5,5f0c <_vfiprintf_r+0x1014>
    5710:	007a8a93          	add	s5,s5,7
    5714:	ff8afa93          	and	s5,s5,-8
    5718:	000aad83          	lw	s11,0(s5)
    571c:	004aad03          	lw	s10,4(s5)
    5720:	008a8a93          	add	s5,s5,8
    5724:	040101a3          	sb	zero,67(sp)
    5728:	00060e13          	mv	t3,a2
    572c:	2a074063          	bltz	a4,59cc <_vfiprintf_r+0xad4>
    5730:	01ade6b3          	or	a3,s11,s10
    5734:	f7f67e13          	and	t3,a2,-129
    5738:	28069a63          	bnez	a3,59cc <_vfiprintf_r+0xad4>
    573c:	00100793          	li	a5,1
    5740:	06071e63          	bnez	a4,57bc <_vfiprintf_r+0x8c4>
    5744:	f6079ee3          	bnez	a5,56c0 <_vfiprintf_r+0x7c8>
    5748:	00167d13          	and	s10,a2,1
    574c:	0a0d0ce3          	beqz	s10,6004 <_vfiprintf_r+0x110c>
    5750:	03000793          	li	a5,48
    5754:	10f107a3          	sb	a5,271(sp)
    5758:	000d0e93          	mv	t4,s10
    575c:	10f10813          	add	a6,sp,271
    5760:	2980006f          	j	59f8 <_vfiprintf_r+0xb00>
    5764:	02b00793          	li	a5,43
    5768:	000cc683          	lbu	a3,0(s9)
    576c:	04f101a3          	sb	a5,67(sp)
    5770:	909ff06f          	j	5078 <_vfiprintf_r+0x180>
    5774:	010de693          	or	a3,s11,16
    5778:	0206f793          	and	a5,a3,32
    577c:	7a078c63          	beqz	a5,5f34 <_vfiprintf_r+0x103c>
    5780:	007a8a93          	add	s5,s5,7
    5784:	ff8afa93          	and	s5,s5,-8
    5788:	000aa783          	lw	a5,0(s5)
    578c:	004aa583          	lw	a1,4(s5)
    5790:	008a8a93          	add	s5,s5,8
    5794:	040101a3          	sb	zero,67(sp)
    5798:	bff6fe13          	and	t3,a3,-1025
    579c:	02074c63          	bltz	a4,57d4 <_vfiprintf_r+0x8dc>
    57a0:	00b7e633          	or	a2,a5,a1
    57a4:	b7f6f693          	and	a3,a3,-1153
    57a8:	420610e3          	bnez	a2,63c8 <_vfiprintf_r+0x14d0>
    57ac:	000e0613          	mv	a2,t3
    57b0:	00000793          	li	a5,0
    57b4:	00068e13          	mv	t3,a3
    57b8:	f80706e3          	beqz	a4,5744 <_vfiprintf_r+0x84c>
    57bc:	00100693          	li	a3,1
    57c0:	58d788e3          	beq	a5,a3,6550 <_vfiprintf_r+0x1658>
    57c4:	00200693          	li	a3,2
    57c8:	46d786e3          	beq	a5,a3,6434 <_vfiprintf_r+0x153c>
    57cc:	00000793          	li	a5,0
    57d0:	00000593          	li	a1,0
    57d4:	11010813          	add	a6,sp,272
    57d8:	01d59613          	sll	a2,a1,0x1d
    57dc:	0077f693          	and	a3,a5,7
    57e0:	0037d793          	srl	a5,a5,0x3
    57e4:	03068693          	add	a3,a3,48
    57e8:	00f667b3          	or	a5,a2,a5
    57ec:	0035d593          	srl	a1,a1,0x3
    57f0:	fed80fa3          	sb	a3,-1(a6)
    57f4:	00b7e633          	or	a2,a5,a1
    57f8:	00080513          	mv	a0,a6
    57fc:	fff80813          	add	a6,a6,-1
    5800:	fc061ce3          	bnez	a2,57d8 <_vfiprintf_r+0x8e0>
    5804:	001e7793          	and	a5,t3,1
    5808:	54078e63          	beqz	a5,5d64 <_vfiprintf_r+0xe6c>
    580c:	03000793          	li	a5,48
    5810:	54f68a63          	beq	a3,a5,5d64 <_vfiprintf_r+0xe6c>
    5814:	ffe50513          	add	a0,a0,-2
    5818:	fef80fa3          	sb	a5,-1(a6)
    581c:	11010793          	add	a5,sp,272
    5820:	40a78d33          	sub	s10,a5,a0
    5824:	00070e93          	mv	t4,a4
    5828:	09a744e3          	blt	a4,s10,60b0 <_vfiprintf_r+0x11b8>
    582c:	00050813          	mv	a6,a0
    5830:	1c80006f          	j	59f8 <_vfiprintf_r+0xb00>
    5834:	000086b7          	lui	a3,0x8
    5838:	83068693          	add	a3,a3,-2000 # 7830 <__swsetup_r+0x100>
    583c:	04d11223          	sh	a3,68(sp)
    5840:	0000a697          	auipc	a3,0xa
    5844:	adc68693          	add	a3,a3,-1316 # f31c <__fini_array_end+0x2a8>
    5848:	000aa783          	lw	a5,0(s5)
    584c:	00000593          	li	a1,0
    5850:	002dee13          	or	t3,s11,2
    5854:	004a8a93          	add	s5,s5,4
    5858:	00d12a23          	sw	a3,20(sp)
    585c:	040101a3          	sb	zero,67(sp)
    5860:	4c074863          	bltz	a4,5d30 <_vfiprintf_r+0xe38>
    5864:	00b7e6b3          	or	a3,a5,a1
    5868:	f7fe7513          	and	a0,t3,-129
    586c:	4a069c63          	bnez	a3,5d24 <_vfiprintf_r+0xe2c>
    5870:	000e0613          	mv	a2,t3
    5874:	00200793          	li	a5,2
    5878:	00050e13          	mv	t3,a0
    587c:	ec5ff06f          	j	5740 <_vfiprintf_r+0x848>
    5880:	00040513          	mv	a0,s0
    5884:	00e12c23          	sw	a4,24(sp)
    5888:	01112823          	sw	a7,16(sp)
    588c:	390020ef          	jal	7c1c <_localeconv_r>
    5890:	00452783          	lw	a5,4(a0)
    5894:	00078513          	mv	a0,a5
    5898:	02f12a23          	sw	a5,52(sp)
    589c:	ab5fb0ef          	jal	1350 <strlen>
    58a0:	00050793          	mv	a5,a0
    58a4:	00040513          	mv	a0,s0
    58a8:	02f12823          	sw	a5,48(sp)
    58ac:	370020ef          	jal	7c1c <_localeconv_r>
    58b0:	00852703          	lw	a4,8(a0)
    58b4:	03012783          	lw	a5,48(sp)
    58b8:	01012883          	lw	a7,16(sp)
    58bc:	02e12623          	sw	a4,44(sp)
    58c0:	01812703          	lw	a4,24(sp)
    58c4:	a2078ee3          	beqz	a5,5300 <_vfiprintf_r+0x408>
    58c8:	02c12783          	lw	a5,44(sp)
    58cc:	000cc683          	lbu	a3,0(s9)
    58d0:	fa078463          	beqz	a5,5078 <_vfiprintf_r+0x180>
    58d4:	0007c783          	lbu	a5,0(a5)
    58d8:	fa078063          	beqz	a5,5078 <_vfiprintf_r+0x180>
    58dc:	400ded93          	or	s11,s11,1024
    58e0:	f98ff06f          	j	5078 <_vfiprintf_r+0x180>
    58e4:	020df793          	and	a5,s11,32
    58e8:	78079263          	bnez	a5,606c <_vfiprintf_r+0x1174>
    58ec:	010df793          	and	a5,s11,16
    58f0:	30079ae3          	bnez	a5,6404 <_vfiprintf_r+0x150c>
    58f4:	040df793          	and	a5,s11,64
    58f8:	400796e3          	bnez	a5,6504 <_vfiprintf_r+0x160c>
    58fc:	200dfe13          	and	t3,s11,512
    5900:	300e02e3          	beqz	t3,6404 <_vfiprintf_r+0x150c>
    5904:	000aa783          	lw	a5,0(s5)
    5908:	00c12703          	lw	a4,12(sp)
    590c:	004a8a93          	add	s5,s5,4
    5910:	00e78023          	sb	a4,0(a5)
    5914:	efcff06f          	j	5010 <_vfiprintf_r+0x118>
    5918:	000cc683          	lbu	a3,0(s9)
    591c:	06c00793          	li	a5,108
    5920:	2cf68ae3          	beq	a3,a5,63f4 <_vfiprintf_r+0x14fc>
    5924:	010ded93          	or	s11,s11,16
    5928:	f50ff06f          	j	5078 <_vfiprintf_r+0x180>
    592c:	000cc683          	lbu	a3,0(s9)
    5930:	080ded93          	or	s11,s11,128
    5934:	f44ff06f          	j	5078 <_vfiprintf_r+0x180>
    5938:	000cc683          	lbu	a3,0(s9)
    593c:	02a00793          	li	a5,42
    5940:	001c8593          	add	a1,s9,1
    5944:	54f680e3          	beq	a3,a5,6684 <_vfiprintf_r+0x178c>
    5948:	fd068793          	add	a5,a3,-48
    594c:	00900613          	li	a2,9
    5950:	00000713          	li	a4,0
    5954:	00900513          	li	a0,9
    5958:	02f66463          	bltu	a2,a5,5980 <_vfiprintf_r+0xa88>
    595c:	0005c683          	lbu	a3,0(a1)
    5960:	00271613          	sll	a2,a4,0x2
    5964:	00e60733          	add	a4,a2,a4
    5968:	00171713          	sll	a4,a4,0x1
    596c:	00f70733          	add	a4,a4,a5
    5970:	fd068793          	add	a5,a3,-48
    5974:	00158593          	add	a1,a1,1
    5978:	fef572e3          	bgeu	a0,a5,595c <_vfiprintf_r+0xa64>
    597c:	74074063          	bltz	a4,60bc <_vfiprintf_r+0x11c4>
    5980:	00058c93          	mv	s9,a1
    5984:	ef8ff06f          	j	507c <_vfiprintf_r+0x184>
    5988:	000cc683          	lbu	a3,0(s9)
    598c:	001ded93          	or	s11,s11,1
    5990:	ee8ff06f          	j	5078 <_vfiprintf_r+0x180>
    5994:	04314783          	lbu	a5,67(sp)
    5998:	000cc683          	lbu	a3,0(s9)
    599c:	ec079e63          	bnez	a5,5078 <_vfiprintf_r+0x180>
    59a0:	02000793          	li	a5,32
    59a4:	04f101a3          	sb	a5,67(sp)
    59a8:	ed0ff06f          	j	5078 <_vfiprintf_r+0x180>
    59ac:	02d00613          	li	a2,45
    59b0:	01b036b3          	snez	a3,s11
    59b4:	41a000b3          	neg	ra,s10
    59b8:	04c101a3          	sb	a2,67(sp)
    59bc:	40d08d33          	sub	s10,ra,a3
    59c0:	41b00db3          	neg	s11,s11
    59c4:	00074463          	bltz	a4,59cc <_vfiprintf_r+0xad4>
    59c8:	f7fe7e13          	and	t3,t3,-129
    59cc:	120d14e3          	bnez	s10,62f4 <_vfiprintf_r+0x13fc>
    59d0:	00900693          	li	a3,9
    59d4:	13b6e0e3          	bltu	a3,s11,62f4 <_vfiprintf_r+0x13fc>
    59d8:	030d8793          	add	a5,s11,48
    59dc:	0ff7f793          	zext.b	a5,a5
    59e0:	10f107a3          	sb	a5,271(sp)
    59e4:	00070e93          	mv	t4,a4
    59e8:	00e04463          	bgtz	a4,59f0 <_vfiprintf_r+0xaf8>
    59ec:	00100e93          	li	t4,1
    59f0:	00100d13          	li	s10,1
    59f4:	10f10813          	add	a6,sp,271
    59f8:	04314783          	lbu	a5,67(sp)
    59fc:	00012823          	sw	zero,16(sp)
    5a00:	cc079ce3          	bnez	a5,56d8 <_vfiprintf_r+0x7e0>
    5a04:	cd9ff06f          	j	56dc <_vfiprintf_r+0x7e4>
    5a08:	00100713          	li	a4,1
    5a0c:	000d0793          	mv	a5,s10
    5a10:	07012623          	sw	a6,108(sp)
    5a14:	07a12823          	sw	s10,112(sp)
    5a18:	07a12423          	sw	s10,104(sp)
    5a1c:	06e12223          	sw	a4,100(sp)
    5a20:	000a0c13          	mv	s8,s4
    5a24:	008c0c13          	add	s8,s8,8
    5a28:	809ff06f          	j	5230 <_vfiprintf_r+0x338>
    5a2c:	00100613          	li	a2,1
    5a30:	00000693          	li	a3,0
    5a34:	000a0593          	mv	a1,s4
    5a38:	a65ff06f          	j	549c <_vfiprintf_r+0x5a4>
    5a3c:	41d88db3          	sub	s11,a7,t4
    5a40:	f9b05a63          	blez	s11,51d4 <_vfiprintf_r+0x2dc>
    5a44:	01000593          	li	a1,16
    5a48:	3bb5dae3          	bge	a1,s11,65fc <_vfiprintf_r+0x1704>
    5a4c:	0000af97          	auipc	t6,0xa
    5a50:	f44f8f93          	add	t6,t6,-188 # f990 <zeroes.0>
    5a54:	02e12223          	sw	a4,36(sp)
    5a58:	000a8713          	mv	a4,s5
    5a5c:	000c0693          	mv	a3,s8
    5a60:	000d8a93          	mv	s5,s11
    5a64:	01000f13          	li	t5,16
    5a68:	00700293          	li	t0,7
    5a6c:	01c12c23          	sw	t3,24(sp)
    5a70:	01012e23          	sw	a6,28(sp)
    5a74:	03112023          	sw	a7,32(sp)
    5a78:	03d12423          	sw	t4,40(sp)
    5a7c:	000f8c13          	mv	s8,t6
    5a80:	00070d93          	mv	s11,a4
    5a84:	0180006f          	j	5a9c <_vfiprintf_r+0xba4>
    5a88:	00260513          	add	a0,a2,2
    5a8c:	00868693          	add	a3,a3,8
    5a90:	00070613          	mv	a2,a4
    5a94:	ff0a8a93          	add	s5,s5,-16
    5a98:	055f5c63          	bge	t5,s5,5af0 <_vfiprintf_r+0xbf8>
    5a9c:	01078793          	add	a5,a5,16
    5aa0:	00160713          	add	a4,a2,1
    5aa4:	0186a023          	sw	s8,0(a3)
    5aa8:	01e6a223          	sw	t5,4(a3)
    5aac:	06f12423          	sw	a5,104(sp)
    5ab0:	06e12223          	sw	a4,100(sp)
    5ab4:	fce2dae3          	bge	t0,a4,5a88 <_vfiprintf_r+0xb90>
    5ab8:	1c078663          	beqz	a5,5c84 <_vfiprintf_r+0xd8c>
    5abc:	06010613          	add	a2,sp,96
    5ac0:	00098593          	mv	a1,s3
    5ac4:	00040513          	mv	a0,s0
    5ac8:	af4ff0ef          	jal	4dbc <__sprint_r.part.0>
    5acc:	8e051ee3          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5ad0:	06412603          	lw	a2,100(sp)
    5ad4:	01000f13          	li	t5,16
    5ad8:	ff0a8a93          	add	s5,s5,-16
    5adc:	06812783          	lw	a5,104(sp)
    5ae0:	000a0693          	mv	a3,s4
    5ae4:	00160513          	add	a0,a2,1
    5ae8:	00700293          	li	t0,7
    5aec:	fb5f48e3          	blt	t5,s5,5a9c <_vfiprintf_r+0xba4>
    5af0:	01812e03          	lw	t3,24(sp)
    5af4:	01c12803          	lw	a6,28(sp)
    5af8:	02012883          	lw	a7,32(sp)
    5afc:	02412703          	lw	a4,36(sp)
    5b00:	02812e83          	lw	t4,40(sp)
    5b04:	000d8613          	mv	a2,s11
    5b08:	000c0f93          	mv	t6,s8
    5b0c:	000a8d93          	mv	s11,s5
    5b10:	00068c13          	mv	s8,a3
    5b14:	00060a93          	mv	s5,a2
    5b18:	01b787b3          	add	a5,a5,s11
    5b1c:	01fc2023          	sw	t6,0(s8)
    5b20:	01bc2223          	sw	s11,4(s8)
    5b24:	06f12423          	sw	a5,104(sp)
    5b28:	06a12223          	sw	a0,100(sp)
    5b2c:	00700613          	li	a2,7
    5b30:	4ea65863          	bge	a2,a0,6020 <_vfiprintf_r+0x1128>
    5b34:	1a0786e3          	beqz	a5,64e0 <_vfiprintf_r+0x15e8>
    5b38:	06010613          	add	a2,sp,96
    5b3c:	00098593          	mv	a1,s3
    5b40:	00040513          	mv	a0,s0
    5b44:	03d12423          	sw	t4,40(sp)
    5b48:	02e12223          	sw	a4,36(sp)
    5b4c:	03112023          	sw	a7,32(sp)
    5b50:	01012e23          	sw	a6,28(sp)
    5b54:	01c12c23          	sw	t3,24(sp)
    5b58:	a64ff0ef          	jal	4dbc <__sprint_r.part.0>
    5b5c:	860516e3          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5b60:	02412703          	lw	a4,36(sp)
    5b64:	06412603          	lw	a2,100(sp)
    5b68:	06812783          	lw	a5,104(sp)
    5b6c:	41a70733          	sub	a4,a4,s10
    5b70:	02812e83          	lw	t4,40(sp)
    5b74:	02012883          	lw	a7,32(sp)
    5b78:	01c12803          	lw	a6,28(sp)
    5b7c:	01812e03          	lw	t3,24(sp)
    5b80:	000a0c13          	mv	s8,s4
    5b84:	00160f13          	add	t5,a2,1
    5b88:	e4e05a63          	blez	a4,51dc <_vfiprintf_r+0x2e4>
    5b8c:	01000593          	li	a1,16
    5b90:	0000af97          	auipc	t6,0xa
    5b94:	e00f8f93          	add	t6,t6,-512 # f990 <zeroes.0>
    5b98:	0ae5da63          	bge	a1,a4,5c4c <_vfiprintf_r+0xd54>
    5b9c:	000c0593          	mv	a1,s8
    5ba0:	03512423          	sw	s5,40(sp)
    5ba4:	01000d93          	li	s11,16
    5ba8:	00700293          	li	t0,7
    5bac:	01c12c23          	sw	t3,24(sp)
    5bb0:	01012e23          	sw	a6,28(sp)
    5bb4:	03112023          	sw	a7,32(sp)
    5bb8:	03d12223          	sw	t4,36(sp)
    5bbc:	00070a93          	mv	s5,a4
    5bc0:	000b0c13          	mv	s8,s6
    5bc4:	0180006f          	j	5bdc <_vfiprintf_r+0xce4>
    5bc8:	00260f13          	add	t5,a2,2
    5bcc:	00858593          	add	a1,a1,8
    5bd0:	00068613          	mv	a2,a3
    5bd4:	ff0a8a93          	add	s5,s5,-16
    5bd8:	055dda63          	bge	s11,s5,5c2c <_vfiprintf_r+0xd34>
    5bdc:	01078793          	add	a5,a5,16
    5be0:	00160693          	add	a3,a2,1
    5be4:	0165a023          	sw	s6,0(a1)
    5be8:	01b5a223          	sw	s11,4(a1)
    5bec:	06f12423          	sw	a5,104(sp)
    5bf0:	06d12223          	sw	a3,100(sp)
    5bf4:	fcd2dae3          	bge	t0,a3,5bc8 <_vfiprintf_r+0xcd0>
    5bf8:	06078e63          	beqz	a5,5c74 <_vfiprintf_r+0xd7c>
    5bfc:	06010613          	add	a2,sp,96
    5c00:	00098593          	mv	a1,s3
    5c04:	00040513          	mv	a0,s0
    5c08:	9b4ff0ef          	jal	4dbc <__sprint_r.part.0>
    5c0c:	fa051e63          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5c10:	06412603          	lw	a2,100(sp)
    5c14:	ff0a8a93          	add	s5,s5,-16
    5c18:	06812783          	lw	a5,104(sp)
    5c1c:	000a0593          	mv	a1,s4
    5c20:	00160f13          	add	t5,a2,1
    5c24:	00700293          	li	t0,7
    5c28:	fb5dcae3          	blt	s11,s5,5bdc <_vfiprintf_r+0xce4>
    5c2c:	000a8713          	mv	a4,s5
    5c30:	01812e03          	lw	t3,24(sp)
    5c34:	01c12803          	lw	a6,28(sp)
    5c38:	02012883          	lw	a7,32(sp)
    5c3c:	02412e83          	lw	t4,36(sp)
    5c40:	02812a83          	lw	s5,40(sp)
    5c44:	000c0f93          	mv	t6,s8
    5c48:	00058c13          	mv	s8,a1
    5c4c:	00e787b3          	add	a5,a5,a4
    5c50:	00ec2223          	sw	a4,4(s8)
    5c54:	01fc2023          	sw	t6,0(s8)
    5c58:	06f12423          	sw	a5,104(sp)
    5c5c:	07e12223          	sw	t5,100(sp)
    5c60:	00700713          	li	a4,7
    5c64:	25e74863          	blt	a4,t5,5eb4 <_vfiprintf_r+0xfbc>
    5c68:	008c0c13          	add	s8,s8,8
    5c6c:	001f0f13          	add	t5,t5,1
    5c70:	d6cff06f          	j	51dc <_vfiprintf_r+0x2e4>
    5c74:	00100f13          	li	t5,1
    5c78:	00000613          	li	a2,0
    5c7c:	000a0593          	mv	a1,s4
    5c80:	f55ff06f          	j	5bd4 <_vfiprintf_r+0xcdc>
    5c84:	00100513          	li	a0,1
    5c88:	00000613          	li	a2,0
    5c8c:	000a0693          	mv	a3,s4
    5c90:	e05ff06f          	j	5a94 <_vfiprintf_r+0xb9c>
    5c94:	06078263          	beqz	a5,5cf8 <_vfiprintf_r+0xe00>
    5c98:	06010613          	add	a2,sp,96
    5c9c:	00098593          	mv	a1,s3
    5ca0:	00040513          	mv	a0,s0
    5ca4:	03d12e23          	sw	t4,60(sp)
    5ca8:	02e12c23          	sw	a4,56(sp)
    5cac:	03112423          	sw	a7,40(sp)
    5cb0:	03012223          	sw	a6,36(sp)
    5cb4:	02512023          	sw	t0,32(sp)
    5cb8:	01f12e23          	sw	t6,28(sp)
    5cbc:	01c12c23          	sw	t3,24(sp)
    5cc0:	8fcff0ef          	jal	4dbc <__sprint_r.part.0>
    5cc4:	f0051263          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5cc8:	06412603          	lw	a2,100(sp)
    5ccc:	06812783          	lw	a5,104(sp)
    5cd0:	03c12e83          	lw	t4,60(sp)
    5cd4:	03812703          	lw	a4,56(sp)
    5cd8:	02812883          	lw	a7,40(sp)
    5cdc:	02412803          	lw	a6,36(sp)
    5ce0:	02012283          	lw	t0,32(sp)
    5ce4:	01c12f83          	lw	t6,28(sp)
    5ce8:	01812e03          	lw	t3,24(sp)
    5cec:	000a0c13          	mv	s8,s4
    5cf0:	00160f13          	add	t5,a2,1
    5cf4:	c58ff06f          	j	514c <_vfiprintf_r+0x254>
    5cf8:	380f8863          	beqz	t6,6088 <_vfiprintf_r+0x1190>
    5cfc:	04410793          	add	a5,sp,68
    5d00:	06f12623          	sw	a5,108(sp)
    5d04:	00200793          	li	a5,2
    5d08:	06f12823          	sw	a5,112(sp)
    5d0c:	00100f13          	li	t5,1
    5d10:	000a0c13          	mv	s8,s4
    5d14:	000f0613          	mv	a2,t5
    5d18:	008c0c13          	add	s8,s8,8
    5d1c:	001f0f13          	add	t5,t5,1
    5d20:	cacff06f          	j	51cc <_vfiprintf_r+0x2d4>
    5d24:	00200693          	li	a3,2
    5d28:	00050e13          	mv	t3,a0
    5d2c:	aa0684e3          	beqz	a3,57d4 <_vfiprintf_r+0x8dc>
    5d30:	01412503          	lw	a0,20(sp)
    5d34:	11010813          	add	a6,sp,272
    5d38:	00f7f693          	and	a3,a5,15
    5d3c:	00d506b3          	add	a3,a0,a3
    5d40:	0006c603          	lbu	a2,0(a3)
    5d44:	0047d793          	srl	a5,a5,0x4
    5d48:	01c59693          	sll	a3,a1,0x1c
    5d4c:	00f6e7b3          	or	a5,a3,a5
    5d50:	0045d593          	srl	a1,a1,0x4
    5d54:	fec80fa3          	sb	a2,-1(a6)
    5d58:	00b7e6b3          	or	a3,a5,a1
    5d5c:	fff80813          	add	a6,a6,-1
    5d60:	fc069ce3          	bnez	a3,5d38 <_vfiprintf_r+0xe40>
    5d64:	11010793          	add	a5,sp,272
    5d68:	41078d33          	sub	s10,a5,a6
    5d6c:	00070e93          	mv	t4,a4
    5d70:	c9a754e3          	bge	a4,s10,59f8 <_vfiprintf_r+0xb00>
    5d74:	000d0e93          	mv	t4,s10
    5d78:	c81ff06f          	j	59f8 <_vfiprintf_r+0xb00>
    5d7c:	01000513          	li	a0,16
    5d80:	01b554e3          	bge	a0,s11,6588 <_vfiprintf_r+0x1690>
    5d84:	000a8693          	mv	a3,s5
    5d88:	0000a317          	auipc	t1,0xa
    5d8c:	c1830313          	add	t1,t1,-1000 # f9a0 <blanks.1>
    5d90:	02e12c23          	sw	a4,56(sp)
    5d94:	000d8a93          	mv	s5,s11
    5d98:	000c0713          	mv	a4,s8
    5d9c:	01000f13          	li	t5,16
    5da0:	00700393          	li	t2,7
    5da4:	01c12c23          	sw	t3,24(sp)
    5da8:	01f12e23          	sw	t6,28(sp)
    5dac:	02512023          	sw	t0,32(sp)
    5db0:	03012223          	sw	a6,36(sp)
    5db4:	03112423          	sw	a7,40(sp)
    5db8:	03d12e23          	sw	t4,60(sp)
    5dbc:	00030c13          	mv	s8,t1
    5dc0:	00068d93          	mv	s11,a3
    5dc4:	01c0006f          	j	5de0 <_vfiprintf_r+0xee8>
    5dc8:	00260513          	add	a0,a2,2
    5dcc:	00870713          	add	a4,a4,8
    5dd0:	00058613          	mv	a2,a1
    5dd4:	ff0a8a93          	add	s5,s5,-16
    5dd8:	055f5c63          	bge	t5,s5,5e30 <_vfiprintf_r+0xf38>
    5ddc:	00160593          	add	a1,a2,1
    5de0:	01078793          	add	a5,a5,16
    5de4:	01872023          	sw	s8,0(a4)
    5de8:	01e72223          	sw	t5,4(a4)
    5dec:	06f12423          	sw	a5,104(sp)
    5df0:	06b12223          	sw	a1,100(sp)
    5df4:	fcb3dae3          	bge	t2,a1,5dc8 <_vfiprintf_r+0xed0>
    5df8:	08078a63          	beqz	a5,5e8c <_vfiprintf_r+0xf94>
    5dfc:	06010613          	add	a2,sp,96
    5e00:	00098593          	mv	a1,s3
    5e04:	00040513          	mv	a0,s0
    5e08:	fb5fe0ef          	jal	4dbc <__sprint_r.part.0>
    5e0c:	da051e63          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5e10:	06412603          	lw	a2,100(sp)
    5e14:	01000f13          	li	t5,16
    5e18:	ff0a8a93          	add	s5,s5,-16
    5e1c:	06812783          	lw	a5,104(sp)
    5e20:	000a0713          	mv	a4,s4
    5e24:	00160513          	add	a0,a2,1
    5e28:	00700393          	li	t2,7
    5e2c:	fb5f48e3          	blt	t5,s5,5ddc <_vfiprintf_r+0xee4>
    5e30:	000c0313          	mv	t1,s8
    5e34:	01812e03          	lw	t3,24(sp)
    5e38:	00070c13          	mv	s8,a4
    5e3c:	01c12f83          	lw	t6,28(sp)
    5e40:	02012283          	lw	t0,32(sp)
    5e44:	02412803          	lw	a6,36(sp)
    5e48:	02812883          	lw	a7,40(sp)
    5e4c:	03c12e83          	lw	t4,60(sp)
    5e50:	03812703          	lw	a4,56(sp)
    5e54:	000d8693          	mv	a3,s11
    5e58:	000a8d93          	mv	s11,s5
    5e5c:	00068a93          	mv	s5,a3
    5e60:	01b787b3          	add	a5,a5,s11
    5e64:	006c2023          	sw	t1,0(s8)
    5e68:	01bc2223          	sw	s11,4(s8)
    5e6c:	06f12423          	sw	a5,104(sp)
    5e70:	06a12223          	sw	a0,100(sp)
    5e74:	00700613          	li	a2,7
    5e78:	12a64063          	blt	a2,a0,5f98 <_vfiprintf_r+0x10a0>
    5e7c:	008c0c13          	add	s8,s8,8
    5e80:	00150f13          	add	t5,a0,1
    5e84:	00050613          	mv	a2,a0
    5e88:	a8cff06f          	j	5114 <_vfiprintf_r+0x21c>
    5e8c:	00000613          	li	a2,0
    5e90:	00100513          	li	a0,1
    5e94:	000a0713          	mv	a4,s4
    5e98:	f3dff06f          	j	5dd4 <_vfiprintf_r+0xedc>
    5e9c:	01d8d463          	bge	a7,t4,5ea4 <_vfiprintf_r+0xfac>
    5ea0:	000e8893          	mv	a7,t4
    5ea4:	00c12783          	lw	a5,12(sp)
    5ea8:	011787b3          	add	a5,a5,a7
    5eac:	00f12623          	sw	a5,12(sp)
    5eb0:	ba8ff06f          	j	5258 <_vfiprintf_r+0x360>
    5eb4:	b4078ae3          	beqz	a5,5a08 <_vfiprintf_r+0xb10>
    5eb8:	06010613          	add	a2,sp,96
    5ebc:	00098593          	mv	a1,s3
    5ec0:	00040513          	mv	a0,s0
    5ec4:	03d12223          	sw	t4,36(sp)
    5ec8:	03112023          	sw	a7,32(sp)
    5ecc:	01012e23          	sw	a6,28(sp)
    5ed0:	01c12c23          	sw	t3,24(sp)
    5ed4:	ee9fe0ef          	jal	4dbc <__sprint_r.part.0>
    5ed8:	ce051863          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5edc:	06412f03          	lw	t5,100(sp)
    5ee0:	06812783          	lw	a5,104(sp)
    5ee4:	02412e83          	lw	t4,36(sp)
    5ee8:	02012883          	lw	a7,32(sp)
    5eec:	01c12803          	lw	a6,28(sp)
    5ef0:	01812e03          	lw	t3,24(sp)
    5ef4:	000a0c13          	mv	s8,s4
    5ef8:	001f0f13          	add	t5,t5,1
    5efc:	ae0ff06f          	j	51dc <_vfiprintf_r+0x2e4>
    5f00:	06012223          	sw	zero,100(sp)
    5f04:	000a0c13          	mv	s8,s4
    5f08:	c84ff06f          	j	538c <_vfiprintf_r+0x494>
    5f0c:	01067693          	and	a3,a2,16
    5f10:	000aa783          	lw	a5,0(s5)
    5f14:	004a8a93          	add	s5,s5,4
    5f18:	12069c63          	bnez	a3,6050 <_vfiprintf_r+0x1158>
    5f1c:	04067693          	and	a3,a2,64
    5f20:	12068463          	beqz	a3,6048 <_vfiprintf_r+0x1150>
    5f24:	01079d93          	sll	s11,a5,0x10
    5f28:	010ddd93          	srl	s11,s11,0x10
    5f2c:	00000d13          	li	s10,0
    5f30:	ff4ff06f          	j	5724 <_vfiprintf_r+0x82c>
    5f34:	0106f613          	and	a2,a3,16
    5f38:	000aa783          	lw	a5,0(s5)
    5f3c:	004a8a93          	add	s5,s5,4
    5f40:	12061263          	bnez	a2,6064 <_vfiprintf_r+0x116c>
    5f44:	0406f613          	and	a2,a3,64
    5f48:	10060a63          	beqz	a2,605c <_vfiprintf_r+0x1164>
    5f4c:	01079793          	sll	a5,a5,0x10
    5f50:	0107d793          	srl	a5,a5,0x10
    5f54:	00000593          	li	a1,0
    5f58:	83dff06f          	j	5794 <_vfiprintf_r+0x89c>
    5f5c:	010e7693          	and	a3,t3,16
    5f60:	000aa783          	lw	a5,0(s5)
    5f64:	004a8a93          	add	s5,s5,4
    5f68:	0c069863          	bnez	a3,6038 <_vfiprintf_r+0x1140>
    5f6c:	040e7693          	and	a3,t3,64
    5f70:	0c068063          	beqz	a3,6030 <_vfiprintf_r+0x1138>
    5f74:	01079d93          	sll	s11,a5,0x10
    5f78:	410ddd93          	sra	s11,s11,0x10
    5f7c:	41fddd13          	sra	s10,s11,0x1f
    5f80:	000d0693          	mv	a3,s10
    5f84:	f24ff06f          	j	56a8 <_vfiprintf_r+0x7b0>
    5f88:	00100f13          	li	t5,1
    5f8c:	00000613          	li	a2,0
    5f90:	000a0c13          	mv	s8,s4
    5f94:	a38ff06f          	j	51cc <_vfiprintf_r+0x2d4>
    5f98:	1a078463          	beqz	a5,6140 <_vfiprintf_r+0x1248>
    5f9c:	06010613          	add	a2,sp,96
    5fa0:	00098593          	mv	a1,s3
    5fa4:	00040513          	mv	a0,s0
    5fa8:	03d12e23          	sw	t4,60(sp)
    5fac:	02e12c23          	sw	a4,56(sp)
    5fb0:	03112423          	sw	a7,40(sp)
    5fb4:	03012223          	sw	a6,36(sp)
    5fb8:	02512023          	sw	t0,32(sp)
    5fbc:	01f12e23          	sw	t6,28(sp)
    5fc0:	01c12c23          	sw	t3,24(sp)
    5fc4:	df9fe0ef          	jal	4dbc <__sprint_r.part.0>
    5fc8:	c0051063          	bnez	a0,53c8 <_vfiprintf_r+0x4d0>
    5fcc:	06412603          	lw	a2,100(sp)
    5fd0:	06812783          	lw	a5,104(sp)
    5fd4:	03c12e83          	lw	t4,60(sp)
    5fd8:	03812703          	lw	a4,56(sp)
    5fdc:	02812883          	lw	a7,40(sp)
    5fe0:	02412803          	lw	a6,36(sp)
    5fe4:	02012283          	lw	t0,32(sp)
    5fe8:	01c12f83          	lw	t6,28(sp)
    5fec:	01812e03          	lw	t3,24(sp)
    5ff0:	000a0c13          	mv	s8,s4
    5ff4:	00160f13          	add	t5,a2,1
    5ff8:	91cff06f          	j	5114 <_vfiprintf_r+0x21c>
    5ffc:	000d8e13          	mv	t3,s11
    6000:	e88ff06f          	j	5688 <_vfiprintf_r+0x790>
    6004:	00000e93          	li	t4,0
    6008:	11010813          	add	a6,sp,272
    600c:	9edff06f          	j	59f8 <_vfiprintf_r+0xb00>
    6010:	0589a503          	lw	a0,88(s3)
    6014:	8b4fb0ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    6018:	00c99783          	lh	a5,12(s3)
    601c:	f41fe06f          	j	4f5c <_vfiprintf_r+0x64>
    6020:	008c0c13          	add	s8,s8,8
    6024:	00150f13          	add	t5,a0,1
    6028:	00050613          	mv	a2,a0
    602c:	9a8ff06f          	j	51d4 <_vfiprintf_r+0x2dc>
    6030:	200e7693          	and	a3,t3,512
    6034:	50069463          	bnez	a3,653c <_vfiprintf_r+0x1644>
    6038:	41f7dd13          	sra	s10,a5,0x1f
    603c:	00078d93          	mv	s11,a5
    6040:	000d0693          	mv	a3,s10
    6044:	e64ff06f          	j	56a8 <_vfiprintf_r+0x7b0>
    6048:	20067693          	and	a3,a2,512
    604c:	4c069663          	bnez	a3,6518 <_vfiprintf_r+0x1620>
    6050:	00078d93          	mv	s11,a5
    6054:	00000d13          	li	s10,0
    6058:	eccff06f          	j	5724 <_vfiprintf_r+0x82c>
    605c:	2006f613          	and	a2,a3,512
    6060:	4c061863          	bnez	a2,6530 <_vfiprintf_r+0x1638>
    6064:	00000593          	li	a1,0
    6068:	f2cff06f          	j	5794 <_vfiprintf_r+0x89c>
    606c:	00c12683          	lw	a3,12(sp)
    6070:	000aa783          	lw	a5,0(s5)
    6074:	004a8a93          	add	s5,s5,4
    6078:	41f6d713          	sra	a4,a3,0x1f
    607c:	00d7a023          	sw	a3,0(a5)
    6080:	00e7a223          	sw	a4,4(a5)
    6084:	f8dfe06f          	j	5010 <_vfiprintf_r+0x118>
    6088:	00000613          	li	a2,0
    608c:	00100f13          	li	t5,1
    6090:	000a0c13          	mv	s8,s4
    6094:	938ff06f          	j	51cc <_vfiprintf_r+0x2d4>
    6098:	000aa783          	lw	a5,0(s5)
    609c:	00100e93          	li	t4,1
    60a0:	00100d13          	li	s10,1
    60a4:	0af10623          	sb	a5,172(sp)
    60a8:	0ac10593          	add	a1,sp,172
    60ac:	db8ff06f          	j	5664 <_vfiprintf_r+0x76c>
    60b0:	000d0e93          	mv	t4,s10
    60b4:	00050813          	mv	a6,a0
    60b8:	941ff06f          	j	59f8 <_vfiprintf_r+0xb00>
    60bc:	fff00713          	li	a4,-1
    60c0:	00058c93          	mv	s9,a1
    60c4:	fb9fe06f          	j	507c <_vfiprintf_r+0x184>
    60c8:	000d8613          	mv	a2,s11
    60cc:	e3cff06f          	j	5708 <_vfiprintf_r+0x810>
    60d0:	00009797          	auipc	a5,0x9
    60d4:	26078793          	add	a5,a5,608 # f330 <__fini_array_end+0x2bc>
    60d8:	000d8e13          	mv	t3,s11
    60dc:	00f12a23          	sw	a5,20(sp)
    60e0:	020e7793          	and	a5,t3,32
    60e4:	1c078c63          	beqz	a5,62bc <_vfiprintf_r+0x13c4>
    60e8:	007a8a93          	add	s5,s5,7
    60ec:	ff8afa93          	and	s5,s5,-8
    60f0:	000aa783          	lw	a5,0(s5)
    60f4:	004aa583          	lw	a1,4(s5)
    60f8:	008a8a93          	add	s5,s5,8
    60fc:	001e7613          	and	a2,t3,1
    6100:	00060e63          	beqz	a2,611c <_vfiprintf_r+0x1224>
    6104:	00b7e633          	or	a2,a5,a1
    6108:	00060a63          	beqz	a2,611c <_vfiprintf_r+0x1224>
    610c:	03000613          	li	a2,48
    6110:	04c10223          	sb	a2,68(sp)
    6114:	04d102a3          	sb	a3,69(sp)
    6118:	002e6e13          	or	t3,t3,2
    611c:	bffe7e13          	and	t3,t3,-1025
    6120:	f3cff06f          	j	585c <_vfiprintf_r+0x964>
    6124:	000d8693          	mv	a3,s11
    6128:	e50ff06f          	j	5778 <_vfiprintf_r+0x880>
    612c:	00009797          	auipc	a5,0x9
    6130:	1f078793          	add	a5,a5,496 # f31c <__fini_array_end+0x2a8>
    6134:	000d8e13          	mv	t3,s11
    6138:	00f12a23          	sw	a5,20(sp)
    613c:	fa5ff06f          	j	60e0 <_vfiprintf_r+0x11e8>
    6140:	04314603          	lbu	a2,67(sp)
    6144:	3a060a63          	beqz	a2,64f8 <_vfiprintf_r+0x1600>
    6148:	04310793          	add	a5,sp,67
    614c:	06f12623          	sw	a5,108(sp)
    6150:	00100793          	li	a5,1
    6154:	06f12823          	sw	a5,112(sp)
    6158:	00100f13          	li	t5,1
    615c:	000a0c13          	mv	s8,s4
    6160:	fe1fe06f          	j	5140 <_vfiprintf_r+0x248>
    6164:	00800613          	li	a2,8
    6168:	00000593          	li	a1,0
    616c:	05810513          	add	a0,sp,88
    6170:	02e12023          	sw	a4,32(sp)
    6174:	01112e23          	sw	a7,28(sp)
    6178:	01c12c23          	sw	t3,24(sp)
    617c:	05012623          	sw	a6,76(sp)
    6180:	01012823          	sw	a6,16(sp)
    6184:	f4dfa0ef          	jal	10d0 <memset>
    6188:	02012703          	lw	a4,32(sp)
    618c:	01012803          	lw	a6,16(sp)
    6190:	01812e03          	lw	t3,24(sp)
    6194:	01c12883          	lw	a7,28(sp)
    6198:	2a074463          	bltz	a4,6440 <_vfiprintf_r+0x1548>
    619c:	00000d93          	li	s11,0
    61a0:	00000d13          	li	s10,0
    61a4:	01812823          	sw	s8,16(sp)
    61a8:	01012e23          	sw	a6,28(sp)
    61ac:	000d8c13          	mv	s8,s11
    61b0:	03112023          	sw	a7,32(sp)
    61b4:	000c8d93          	mv	s11,s9
    61b8:	000a8c93          	mv	s9,s5
    61bc:	000d0a93          	mv	s5,s10
    61c0:	00098d13          	mv	s10,s3
    61c4:	00070993          	mv	s3,a4
    61c8:	0300006f          	j	61f8 <_vfiprintf_r+0x1300>
    61cc:	05810693          	add	a3,sp,88
    61d0:	0ac10593          	add	a1,sp,172
    61d4:	00040513          	mv	a0,s0
    61d8:	2f5040ef          	jal	accc <_wcrtomb_r>
    61dc:	fff00793          	li	a5,-1
    61e0:	48f50063          	beq	a0,a5,6660 <_vfiprintf_r+0x1768>
    61e4:	00aa87b3          	add	a5,s5,a0
    61e8:	02f9c063          	blt	s3,a5,6208 <_vfiprintf_r+0x1310>
    61ec:	004c0c13          	add	s8,s8,4
    61f0:	45378463          	beq	a5,s3,6638 <_vfiprintf_r+0x1740>
    61f4:	00078a93          	mv	s5,a5
    61f8:	04c12783          	lw	a5,76(sp)
    61fc:	018787b3          	add	a5,a5,s8
    6200:	0007a603          	lw	a2,0(a5)
    6204:	fc0614e3          	bnez	a2,61cc <_vfiprintf_r+0x12d4>
    6208:	01012c03          	lw	s8,16(sp)
    620c:	01812e03          	lw	t3,24(sp)
    6210:	01c12803          	lw	a6,28(sp)
    6214:	02012883          	lw	a7,32(sp)
    6218:	000d0993          	mv	s3,s10
    621c:	000a8d13          	mv	s10,s5
    6220:	000c8a93          	mv	s5,s9
    6224:	000d8c93          	mv	s9,s11
    6228:	280d0e63          	beqz	s10,64c4 <_vfiprintf_r+0x15cc>
    622c:	06300793          	li	a5,99
    6230:	33a7d463          	bge	a5,s10,6558 <_vfiprintf_r+0x1660>
    6234:	001d0593          	add	a1,s10,1
    6238:	00040513          	mv	a0,s0
    623c:	01112c23          	sw	a7,24(sp)
    6240:	01c12823          	sw	t3,16(sp)
    6244:	de8fb0ef          	jal	182c <_malloc_r>
    6248:	01012e03          	lw	t3,16(sp)
    624c:	01812883          	lw	a7,24(sp)
    6250:	00050813          	mv	a6,a0
    6254:	42050063          	beqz	a0,6674 <_vfiprintf_r+0x177c>
    6258:	00a12823          	sw	a0,16(sp)
    625c:	00800613          	li	a2,8
    6260:	00000593          	li	a1,0
    6264:	05810513          	add	a0,sp,88
    6268:	03112023          	sw	a7,32(sp)
    626c:	01c12e23          	sw	t3,28(sp)
    6270:	01012c23          	sw	a6,24(sp)
    6274:	e5dfa0ef          	jal	10d0 <memset>
    6278:	01812803          	lw	a6,24(sp)
    627c:	05810713          	add	a4,sp,88
    6280:	000d0693          	mv	a3,s10
    6284:	00080593          	mv	a1,a6
    6288:	04c10613          	add	a2,sp,76
    628c:	00040513          	mv	a0,s0
    6290:	2c9040ef          	jal	ad58 <_wcsrtombs_r>
    6294:	01812803          	lw	a6,24(sp)
    6298:	01c12e03          	lw	t3,28(sp)
    629c:	02012883          	lw	a7,32(sp)
    62a0:	40ad1063          	bne	s10,a0,66a0 <_vfiprintf_r+0x17a8>
    62a4:	fffd4e93          	not	t4,s10
    62a8:	01a807b3          	add	a5,a6,s10
    62ac:	41fede93          	sra	t4,t4,0x1f
    62b0:	00078023          	sb	zero,0(a5)
    62b4:	01dd7eb3          	and	t4,s10,t4
    62b8:	2140006f          	j	64cc <_vfiprintf_r+0x15d4>
    62bc:	010e7613          	and	a2,t3,16
    62c0:	000aa783          	lw	a5,0(s5)
    62c4:	004a8a93          	add	s5,s5,4
    62c8:	02061263          	bnez	a2,62ec <_vfiprintf_r+0x13f4>
    62cc:	040e7613          	and	a2,t3,64
    62d0:	00060a63          	beqz	a2,62e4 <_vfiprintf_r+0x13ec>
    62d4:	01079793          	sll	a5,a5,0x10
    62d8:	0107d793          	srl	a5,a5,0x10
    62dc:	00000593          	li	a1,0
    62e0:	e1dff06f          	j	60fc <_vfiprintf_r+0x1204>
    62e4:	200e7613          	and	a2,t3,512
    62e8:	22061e63          	bnez	a2,6524 <_vfiprintf_r+0x162c>
    62ec:	00000593          	li	a1,0
    62f0:	e0dff06f          	j	60fc <_vfiprintf_r+0x1204>
    62f4:	400e7793          	and	a5,t3,1024
    62f8:	00000693          	li	a3,0
    62fc:	11010e93          	add	t4,sp,272
    6300:	01812823          	sw	s8,16(sp)
    6304:	02812223          	sw	s0,36(sp)
    6308:	03912c23          	sw	s9,56(sp)
    630c:	03512e23          	sw	s5,60(sp)
    6310:	02c12c83          	lw	s9,44(sp)
    6314:	01c12c23          	sw	t3,24(sp)
    6318:	01112e23          	sw	a7,28(sp)
    631c:	02e12023          	sw	a4,32(sp)
    6320:	00078c13          	mv	s8,a5
    6324:	00068413          	mv	s0,a3
    6328:	03312423          	sw	s3,40(sp)
    632c:	000e8a93          	mv	s5,t4
    6330:	0280006f          	j	6358 <_vfiprintf_r+0x1460>
    6334:	00a00613          	li	a2,10
    6338:	00000693          	li	a3,0
    633c:	000d8513          	mv	a0,s11
    6340:	000d0593          	mv	a1,s10
    6344:	364050ef          	jal	b6a8 <__udivdi3>
    6348:	220d0a63          	beqz	s10,657c <_vfiprintf_r+0x1684>
    634c:	00050d93          	mv	s11,a0
    6350:	00058d13          	mv	s10,a1
    6354:	00098a93          	mv	s5,s3
    6358:	00a00613          	li	a2,10
    635c:	00000693          	li	a3,0
    6360:	000d8513          	mv	a0,s11
    6364:	000d0593          	mv	a1,s10
    6368:	1ed050ef          	jal	bd54 <__umoddi3>
    636c:	03050513          	add	a0,a0,48
    6370:	feaa8fa3          	sb	a0,-1(s5)
    6374:	fffa8993          	add	s3,s5,-1
    6378:	00140413          	add	s0,s0,1
    637c:	fa0c0ce3          	beqz	s8,6334 <_vfiprintf_r+0x143c>
    6380:	000cc783          	lbu	a5,0(s9)
    6384:	fa8798e3          	bne	a5,s0,6334 <_vfiprintf_r+0x143c>
    6388:	0ff00793          	li	a5,255
    638c:	faf404e3          	beq	s0,a5,6334 <_vfiprintf_r+0x143c>
    6390:	0e0d1a63          	bnez	s10,6484 <_vfiprintf_r+0x158c>
    6394:	00900793          	li	a5,9
    6398:	0fb7e663          	bltu	a5,s11,6484 <_vfiprintf_r+0x158c>
    639c:	00098813          	mv	a6,s3
    63a0:	03912623          	sw	s9,44(sp)
    63a4:	01012c03          	lw	s8,16(sp)
    63a8:	01812e03          	lw	t3,24(sp)
    63ac:	01c12883          	lw	a7,28(sp)
    63b0:	02012703          	lw	a4,32(sp)
    63b4:	02412403          	lw	s0,36(sp)
    63b8:	02812983          	lw	s3,40(sp)
    63bc:	03812c83          	lw	s9,56(sp)
    63c0:	03c12a83          	lw	s5,60(sp)
    63c4:	9a1ff06f          	j	5d64 <_vfiprintf_r+0xe6c>
    63c8:	00068e13          	mv	t3,a3
    63cc:	00000693          	li	a3,0
    63d0:	c0068263          	beqz	a3,57d4 <_vfiprintf_r+0x8dc>
    63d4:	95dff06f          	j	5d30 <_vfiprintf_r+0xe38>
    63d8:	00040513          	mv	a0,s0
    63dc:	115000ef          	jal	6cf0 <__sinit>
    63e0:	b61fe06f          	j	4f40 <_vfiprintf_r+0x48>
    63e4:	001cc683          	lbu	a3,1(s9)
    63e8:	200ded93          	or	s11,s11,512
    63ec:	001c8c93          	add	s9,s9,1
    63f0:	c89fe06f          	j	5078 <_vfiprintf_r+0x180>
    63f4:	001cc683          	lbu	a3,1(s9)
    63f8:	020ded93          	or	s11,s11,32
    63fc:	001c8c93          	add	s9,s9,1
    6400:	c79fe06f          	j	5078 <_vfiprintf_r+0x180>
    6404:	000aa783          	lw	a5,0(s5)
    6408:	00c12703          	lw	a4,12(sp)
    640c:	004a8a93          	add	s5,s5,4
    6410:	00e7a023          	sw	a4,0(a5)
    6414:	bfdfe06f          	j	5010 <_vfiprintf_r+0x118>
    6418:	00600793          	li	a5,6
    641c:	00070d13          	mv	s10,a4
    6420:	0ce7e863          	bltu	a5,a4,64f0 <_vfiprintf_r+0x15f8>
    6424:	000d0e93          	mv	t4,s10
    6428:	00009817          	auipc	a6,0x9
    642c:	f1c80813          	add	a6,a6,-228 # f344 <__fini_array_end+0x2d0>
    6430:	cb9fe06f          	j	50e8 <_vfiprintf_r+0x1f0>
    6434:	00000793          	li	a5,0
    6438:	00000593          	li	a1,0
    643c:	8f5ff06f          	j	5d30 <_vfiprintf_r+0xe38>
    6440:	05810713          	add	a4,sp,88
    6444:	00000693          	li	a3,0
    6448:	04c10613          	add	a2,sp,76
    644c:	00000593          	li	a1,0
    6450:	00040513          	mv	a0,s0
    6454:	01112e23          	sw	a7,28(sp)
    6458:	01012c23          	sw	a6,24(sp)
    645c:	01c12823          	sw	t3,16(sp)
    6460:	0f9040ef          	jal	ad58 <_wcsrtombs_r>
    6464:	fff00793          	li	a5,-1
    6468:	01012e03          	lw	t3,16(sp)
    646c:	01812803          	lw	a6,24(sp)
    6470:	01c12883          	lw	a7,28(sp)
    6474:	00050d13          	mv	s10,a0
    6478:	1ef50e63          	beq	a0,a5,6674 <_vfiprintf_r+0x177c>
    647c:	05012623          	sw	a6,76(sp)
    6480:	da9ff06f          	j	6228 <_vfiprintf_r+0x1330>
    6484:	03012783          	lw	a5,48(sp)
    6488:	03412583          	lw	a1,52(sp)
    648c:	00000413          	li	s0,0
    6490:	40f989b3          	sub	s3,s3,a5
    6494:	00078613          	mv	a2,a5
    6498:	00098513          	mv	a0,s3
    649c:	6c8010ef          	jal	7b64 <strncpy>
    64a0:	001cc783          	lbu	a5,1(s9)
    64a4:	00a00613          	li	a2,10
    64a8:	00000693          	li	a3,0
    64ac:	00f037b3          	snez	a5,a5
    64b0:	000d8513          	mv	a0,s11
    64b4:	000d0593          	mv	a1,s10
    64b8:	00fc8cb3          	add	s9,s9,a5
    64bc:	1ec050ef          	jal	b6a8 <__udivdi3>
    64c0:	e8dff06f          	j	634c <_vfiprintf_r+0x1454>
    64c4:	00000e93          	li	t4,0
    64c8:	00012823          	sw	zero,16(sp)
    64cc:	04314783          	lbu	a5,67(sp)
    64d0:	00000713          	li	a4,0
    64d4:	00000f93          	li	t6,0
    64d8:	a0079063          	bnez	a5,56d8 <_vfiprintf_r+0x7e0>
    64dc:	c19fe06f          	j	50f4 <_vfiprintf_r+0x1fc>
    64e0:	00100f13          	li	t5,1
    64e4:	00000613          	li	a2,0
    64e8:	000a0c13          	mv	s8,s4
    64ec:	ce9fe06f          	j	51d4 <_vfiprintf_r+0x2dc>
    64f0:	00600d13          	li	s10,6
    64f4:	f31ff06f          	j	6424 <_vfiprintf_r+0x152c>
    64f8:	00100f13          	li	t5,1
    64fc:	000a0c13          	mv	s8,s4
    6500:	c4dfe06f          	j	514c <_vfiprintf_r+0x254>
    6504:	000aa783          	lw	a5,0(s5)
    6508:	00c12703          	lw	a4,12(sp)
    650c:	004a8a93          	add	s5,s5,4
    6510:	00e79023          	sh	a4,0(a5)
    6514:	afdfe06f          	j	5010 <_vfiprintf_r+0x118>
    6518:	0ff7fd93          	zext.b	s11,a5
    651c:	00000d13          	li	s10,0
    6520:	a04ff06f          	j	5724 <_vfiprintf_r+0x82c>
    6524:	0ff7f793          	zext.b	a5,a5
    6528:	00000593          	li	a1,0
    652c:	bd1ff06f          	j	60fc <_vfiprintf_r+0x1204>
    6530:	0ff7f793          	zext.b	a5,a5
    6534:	00000593          	li	a1,0
    6538:	a5cff06f          	j	5794 <_vfiprintf_r+0x89c>
    653c:	01879d93          	sll	s11,a5,0x18
    6540:	418ddd93          	sra	s11,s11,0x18
    6544:	41fddd13          	sra	s10,s11,0x1f
    6548:	000d0693          	mv	a3,s10
    654c:	95cff06f          	j	56a8 <_vfiprintf_r+0x7b0>
    6550:	03000793          	li	a5,48
    6554:	c8cff06f          	j	59e0 <_vfiprintf_r+0xae8>
    6558:	00012823          	sw	zero,16(sp)
    655c:	0ac10813          	add	a6,sp,172
    6560:	cfdff06f          	j	625c <_vfiprintf_r+0x1364>
    6564:	0589a503          	lw	a0,88(s3)
    6568:	b65fa0ef          	jal	10cc <__retarget_lock_release_recursive>
    656c:	d51fe06f          	j	52bc <_vfiprintf_r+0x3c4>
    6570:	00070e93          	mv	t4,a4
    6574:	00070d13          	mv	s10,a4
    6578:	f55ff06f          	j	64cc <_vfiprintf_r+0x15d4>
    657c:	00900793          	li	a5,9
    6580:	ddb7e6e3          	bltu	a5,s11,634c <_vfiprintf_r+0x1454>
    6584:	e19ff06f          	j	639c <_vfiprintf_r+0x14a4>
    6588:	00058513          	mv	a0,a1
    658c:	00009317          	auipc	t1,0x9
    6590:	41430313          	add	t1,t1,1044 # f9a0 <blanks.1>
    6594:	8cdff06f          	j	5e60 <_vfiprintf_r+0xf68>
    6598:	00080513          	mv	a0,a6
    659c:	03112023          	sw	a7,32(sp)
    65a0:	01012c23          	sw	a6,24(sp)
    65a4:	01b12e23          	sw	s11,28(sp)
    65a8:	da9fa0ef          	jal	1350 <strlen>
    65ac:	fff54e93          	not	t4,a0
    65b0:	41fede93          	sra	t4,t4,0x1f
    65b4:	01812803          	lw	a6,24(sp)
    65b8:	01c12e03          	lw	t3,28(sp)
    65bc:	02012883          	lw	a7,32(sp)
    65c0:	00050d13          	mv	s10,a0
    65c4:	01d57eb3          	and	t4,a0,t4
    65c8:	00012823          	sw	zero,16(sp)
    65cc:	f01ff06f          	j	64cc <_vfiprintf_r+0x15d4>
    65d0:	06010613          	add	a2,sp,96
    65d4:	00098593          	mv	a1,s3
    65d8:	00040513          	mv	a0,s0
    65dc:	fe0fe0ef          	jal	4dbc <__sprint_r.part.0>
    65e0:	00051463          	bnez	a0,65e8 <_vfiprintf_r+0x16f0>
    65e4:	dc5fe06f          	j	53a8 <_vfiprintf_r+0x4b0>
    65e8:	df5fe06f          	j	53dc <_vfiprintf_r+0x4e4>
    65ec:	00168613          	add	a2,a3,1
    65f0:	00009317          	auipc	t1,0x9
    65f4:	3b030313          	add	t1,t1,944 # f9a0 <blanks.1>
    65f8:	f19fe06f          	j	5510 <_vfiprintf_r+0x618>
    65fc:	000f0513          	mv	a0,t5
    6600:	00009f97          	auipc	t6,0x9
    6604:	390f8f93          	add	t6,t6,912 # f990 <zeroes.0>
    6608:	d10ff06f          	j	5b18 <_vfiprintf_r+0xc20>
    660c:	0649a783          	lw	a5,100(s3)
    6610:	0017f793          	and	a5,a5,1
    6614:	00079c63          	bnez	a5,662c <_vfiprintf_r+0x1734>
    6618:	00c9d783          	lhu	a5,12(s3)
    661c:	2007f793          	and	a5,a5,512
    6620:	00079663          	bnez	a5,662c <_vfiprintf_r+0x1734>
    6624:	0589a503          	lw	a0,88(s3)
    6628:	aa5fa0ef          	jal	10cc <__retarget_lock_release_recursive>
    662c:	fff00793          	li	a5,-1
    6630:	00f12623          	sw	a5,12(sp)
    6634:	de5fe06f          	j	5418 <_vfiprintf_r+0x520>
    6638:	00098713          	mv	a4,s3
    663c:	000c8a93          	mv	s5,s9
    6640:	000d0993          	mv	s3,s10
    6644:	01012c03          	lw	s8,16(sp)
    6648:	01812e03          	lw	t3,24(sp)
    664c:	01c12803          	lw	a6,28(sp)
    6650:	02012883          	lw	a7,32(sp)
    6654:	000d8c93          	mv	s9,s11
    6658:	00070d13          	mv	s10,a4
    665c:	bcdff06f          	j	6228 <_vfiprintf_r+0x1330>
    6660:	00cd1783          	lh	a5,12(s10)
    6664:	000d0993          	mv	s3,s10
    6668:	0407e793          	or	a5,a5,64
    666c:	00fd1623          	sh	a5,12(s10)
    6670:	d71fe06f          	j	53e0 <_vfiprintf_r+0x4e8>
    6674:	00c99783          	lh	a5,12(s3)
    6678:	0407e793          	or	a5,a5,64
    667c:	00f99623          	sh	a5,12(s3)
    6680:	d61fe06f          	j	53e0 <_vfiprintf_r+0x4e8>
    6684:	000aa703          	lw	a4,0(s5)
    6688:	004a8a93          	add	s5,s5,4
    668c:	00075463          	bgez	a4,6694 <_vfiprintf_r+0x179c>
    6690:	fff00713          	li	a4,-1
    6694:	001cc683          	lbu	a3,1(s9)
    6698:	00058c93          	mv	s9,a1
    669c:	9ddfe06f          	j	5078 <_vfiprintf_r+0x180>
    66a0:	00c9d783          	lhu	a5,12(s3)
    66a4:	0407e793          	or	a5,a5,64
    66a8:	00f99623          	sh	a5,12(s3)
    66ac:	d1dfe06f          	j	53c8 <_vfiprintf_r+0x4d0>

000066b0 <__sbprintf>:
    66b0:	b7010113          	add	sp,sp,-1168
    66b4:	00c59783          	lh	a5,12(a1)
    66b8:	00e5d703          	lhu	a4,14(a1)
    66bc:	48812423          	sw	s0,1160(sp)
    66c0:	00058413          	mv	s0,a1
    66c4:	000105b7          	lui	a1,0x10
    66c8:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x40d>
    66cc:	06442303          	lw	t1,100(s0)
    66d0:	01c42883          	lw	a7,28(s0)
    66d4:	02442803          	lw	a6,36(s0)
    66d8:	01071713          	sll	a4,a4,0x10
    66dc:	00b7f7b3          	and	a5,a5,a1
    66e0:	00e7e7b3          	or	a5,a5,a4
    66e4:	40000593          	li	a1,1024
    66e8:	49212023          	sw	s2,1152(sp)
    66ec:	00f12a23          	sw	a5,20(sp)
    66f0:	00050913          	mv	s2,a0
    66f4:	07010793          	add	a5,sp,112
    66f8:	06010513          	add	a0,sp,96
    66fc:	48112623          	sw	ra,1164(sp)
    6700:	48912223          	sw	s1,1156(sp)
    6704:	47312e23          	sw	s3,1148(sp)
    6708:	00060493          	mv	s1,a2
    670c:	00068993          	mv	s3,a3
    6710:	06612623          	sw	t1,108(sp)
    6714:	03112223          	sw	a7,36(sp)
    6718:	03012623          	sw	a6,44(sp)
    671c:	00f12423          	sw	a5,8(sp)
    6720:	00f12c23          	sw	a5,24(sp)
    6724:	00b12823          	sw	a1,16(sp)
    6728:	00b12e23          	sw	a1,28(sp)
    672c:	02012023          	sw	zero,32(sp)
    6730:	991fa0ef          	jal	10c0 <__retarget_lock_init_recursive>
    6734:	00048613          	mv	a2,s1
    6738:	00098693          	mv	a3,s3
    673c:	00810593          	add	a1,sp,8
    6740:	00090513          	mv	a0,s2
    6744:	fb4fe0ef          	jal	4ef8 <_vfiprintf_r>
    6748:	00050493          	mv	s1,a0
    674c:	04055263          	bgez	a0,6790 <__sbprintf+0xe0>
    6750:	01415783          	lhu	a5,20(sp)
    6754:	0407f793          	and	a5,a5,64
    6758:	00078863          	beqz	a5,6768 <__sbprintf+0xb8>
    675c:	00c45783          	lhu	a5,12(s0)
    6760:	0407e793          	or	a5,a5,64
    6764:	00f41623          	sh	a5,12(s0)
    6768:	06012503          	lw	a0,96(sp)
    676c:	959fa0ef          	jal	10c4 <__retarget_lock_close_recursive>
    6770:	48c12083          	lw	ra,1164(sp)
    6774:	48812403          	lw	s0,1160(sp)
    6778:	48012903          	lw	s2,1152(sp)
    677c:	47c12983          	lw	s3,1148(sp)
    6780:	00048513          	mv	a0,s1
    6784:	48412483          	lw	s1,1156(sp)
    6788:	49010113          	add	sp,sp,1168
    678c:	00008067          	ret
    6790:	00810593          	add	a1,sp,8
    6794:	00090513          	mv	a0,s2
    6798:	25c000ef          	jal	69f4 <_fflush_r>
    679c:	fa050ae3          	beqz	a0,6750 <__sbprintf+0xa0>
    67a0:	fff00493          	li	s1,-1
    67a4:	fadff06f          	j	6750 <__sbprintf+0xa0>

000067a8 <__sflush_r>:
    67a8:	00c59703          	lh	a4,12(a1)
    67ac:	fe010113          	add	sp,sp,-32
    67b0:	00812c23          	sw	s0,24(sp)
    67b4:	01312623          	sw	s3,12(sp)
    67b8:	00112e23          	sw	ra,28(sp)
    67bc:	00877793          	and	a5,a4,8
    67c0:	00058413          	mv	s0,a1
    67c4:	00050993          	mv	s3,a0
    67c8:	12079063          	bnez	a5,68e8 <__sflush_r+0x140>
    67cc:	000017b7          	lui	a5,0x1
    67d0:	80078793          	add	a5,a5,-2048 # 800 <gemm_cfs_2x2+0x26c>
    67d4:	0045a683          	lw	a3,4(a1)
    67d8:	00f767b3          	or	a5,a4,a5
    67dc:	00f59623          	sh	a5,12(a1)
    67e0:	18d05263          	blez	a3,6964 <__sflush_r+0x1bc>
    67e4:	02842803          	lw	a6,40(s0)
    67e8:	0e080463          	beqz	a6,68d0 <__sflush_r+0x128>
    67ec:	00912a23          	sw	s1,20(sp)
    67f0:	01371693          	sll	a3,a4,0x13
    67f4:	0009a483          	lw	s1,0(s3)
    67f8:	0009a023          	sw	zero,0(s3)
    67fc:	01c42583          	lw	a1,28(s0)
    6800:	1606ce63          	bltz	a3,697c <__sflush_r+0x1d4>
    6804:	00000613          	li	a2,0
    6808:	00100693          	li	a3,1
    680c:	00098513          	mv	a0,s3
    6810:	000800e7          	jalr	a6
    6814:	fff00793          	li	a5,-1
    6818:	00050613          	mv	a2,a0
    681c:	1af50463          	beq	a0,a5,69c4 <__sflush_r+0x21c>
    6820:	00c41783          	lh	a5,12(s0)
    6824:	02842803          	lw	a6,40(s0)
    6828:	01c42583          	lw	a1,28(s0)
    682c:	0047f793          	and	a5,a5,4
    6830:	00078e63          	beqz	a5,684c <__sflush_r+0xa4>
    6834:	00442703          	lw	a4,4(s0)
    6838:	03042783          	lw	a5,48(s0)
    683c:	40e60633          	sub	a2,a2,a4
    6840:	00078663          	beqz	a5,684c <__sflush_r+0xa4>
    6844:	03c42783          	lw	a5,60(s0)
    6848:	40f60633          	sub	a2,a2,a5
    684c:	00000693          	li	a3,0
    6850:	00098513          	mv	a0,s3
    6854:	000800e7          	jalr	a6
    6858:	fff00793          	li	a5,-1
    685c:	12f51463          	bne	a0,a5,6984 <__sflush_r+0x1dc>
    6860:	0009a683          	lw	a3,0(s3)
    6864:	01d00793          	li	a5,29
    6868:	00c41703          	lh	a4,12(s0)
    686c:	16d7ea63          	bltu	a5,a3,69e0 <__sflush_r+0x238>
    6870:	204007b7          	lui	a5,0x20400
    6874:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6878:	00d7d7b3          	srl	a5,a5,a3
    687c:	0017f793          	and	a5,a5,1
    6880:	16078063          	beqz	a5,69e0 <__sflush_r+0x238>
    6884:	01042603          	lw	a2,16(s0)
    6888:	fffff7b7          	lui	a5,0xfffff
    688c:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6890:	00f777b3          	and	a5,a4,a5
    6894:	00f41623          	sh	a5,12(s0)
    6898:	00042223          	sw	zero,4(s0)
    689c:	00c42023          	sw	a2,0(s0)
    68a0:	01371793          	sll	a5,a4,0x13
    68a4:	0007d463          	bgez	a5,68ac <__sflush_r+0x104>
    68a8:	10068263          	beqz	a3,69ac <__sflush_r+0x204>
    68ac:	03042583          	lw	a1,48(s0)
    68b0:	0099a023          	sw	s1,0(s3)
    68b4:	10058463          	beqz	a1,69bc <__sflush_r+0x214>
    68b8:	04040793          	add	a5,s0,64
    68bc:	00f58663          	beq	a1,a5,68c8 <__sflush_r+0x120>
    68c0:	00098513          	mv	a0,s3
    68c4:	c5dfa0ef          	jal	1520 <_free_r>
    68c8:	01412483          	lw	s1,20(sp)
    68cc:	02042823          	sw	zero,48(s0)
    68d0:	00000513          	li	a0,0
    68d4:	01c12083          	lw	ra,28(sp)
    68d8:	01812403          	lw	s0,24(sp)
    68dc:	00c12983          	lw	s3,12(sp)
    68e0:	02010113          	add	sp,sp,32
    68e4:	00008067          	ret
    68e8:	01212823          	sw	s2,16(sp)
    68ec:	0105a903          	lw	s2,16(a1)
    68f0:	08090263          	beqz	s2,6974 <__sflush_r+0x1cc>
    68f4:	00912a23          	sw	s1,20(sp)
    68f8:	0005a483          	lw	s1,0(a1)
    68fc:	00377713          	and	a4,a4,3
    6900:	0125a023          	sw	s2,0(a1)
    6904:	412484b3          	sub	s1,s1,s2
    6908:	00000793          	li	a5,0
    690c:	00071463          	bnez	a4,6914 <__sflush_r+0x16c>
    6910:	0145a783          	lw	a5,20(a1)
    6914:	00f42423          	sw	a5,8(s0)
    6918:	00904863          	bgtz	s1,6928 <__sflush_r+0x180>
    691c:	0540006f          	j	6970 <__sflush_r+0x1c8>
    6920:	00a90933          	add	s2,s2,a0
    6924:	04905663          	blez	s1,6970 <__sflush_r+0x1c8>
    6928:	02442783          	lw	a5,36(s0)
    692c:	01c42583          	lw	a1,28(s0)
    6930:	00048693          	mv	a3,s1
    6934:	00090613          	mv	a2,s2
    6938:	00098513          	mv	a0,s3
    693c:	000780e7          	jalr	a5
    6940:	40a484b3          	sub	s1,s1,a0
    6944:	fca04ee3          	bgtz	a0,6920 <__sflush_r+0x178>
    6948:	00c41703          	lh	a4,12(s0)
    694c:	01012903          	lw	s2,16(sp)
    6950:	04076713          	or	a4,a4,64
    6954:	01412483          	lw	s1,20(sp)
    6958:	00e41623          	sh	a4,12(s0)
    695c:	fff00513          	li	a0,-1
    6960:	f75ff06f          	j	68d4 <__sflush_r+0x12c>
    6964:	03c5a683          	lw	a3,60(a1)
    6968:	e6d04ee3          	bgtz	a3,67e4 <__sflush_r+0x3c>
    696c:	f65ff06f          	j	68d0 <__sflush_r+0x128>
    6970:	01412483          	lw	s1,20(sp)
    6974:	01012903          	lw	s2,16(sp)
    6978:	f59ff06f          	j	68d0 <__sflush_r+0x128>
    697c:	05042603          	lw	a2,80(s0)
    6980:	eadff06f          	j	682c <__sflush_r+0x84>
    6984:	00c41703          	lh	a4,12(s0)
    6988:	01042683          	lw	a3,16(s0)
    698c:	fffff7b7          	lui	a5,0xfffff
    6990:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6994:	00f777b3          	and	a5,a4,a5
    6998:	00f41623          	sh	a5,12(s0)
    699c:	00042223          	sw	zero,4(s0)
    69a0:	00d42023          	sw	a3,0(s0)
    69a4:	01371793          	sll	a5,a4,0x13
    69a8:	f007d2e3          	bgez	a5,68ac <__sflush_r+0x104>
    69ac:	03042583          	lw	a1,48(s0)
    69b0:	04a42823          	sw	a0,80(s0)
    69b4:	0099a023          	sw	s1,0(s3)
    69b8:	f00590e3          	bnez	a1,68b8 <__sflush_r+0x110>
    69bc:	01412483          	lw	s1,20(sp)
    69c0:	f11ff06f          	j	68d0 <__sflush_r+0x128>
    69c4:	0009a783          	lw	a5,0(s3)
    69c8:	e4078ce3          	beqz	a5,6820 <__sflush_r+0x78>
    69cc:	01d00713          	li	a4,29
    69d0:	00e78c63          	beq	a5,a4,69e8 <__sflush_r+0x240>
    69d4:	01600713          	li	a4,22
    69d8:	00e78863          	beq	a5,a4,69e8 <__sflush_r+0x240>
    69dc:	00c41703          	lh	a4,12(s0)
    69e0:	04076713          	or	a4,a4,64
    69e4:	f71ff06f          	j	6954 <__sflush_r+0x1ac>
    69e8:	0099a023          	sw	s1,0(s3)
    69ec:	01412483          	lw	s1,20(sp)
    69f0:	ee1ff06f          	j	68d0 <__sflush_r+0x128>

000069f4 <_fflush_r>:
    69f4:	ff010113          	add	sp,sp,-16
    69f8:	00812423          	sw	s0,8(sp)
    69fc:	00912223          	sw	s1,4(sp)
    6a00:	00112623          	sw	ra,12(sp)
    6a04:	01212023          	sw	s2,0(sp)
    6a08:	00050493          	mv	s1,a0
    6a0c:	00058413          	mv	s0,a1
    6a10:	00050663          	beqz	a0,6a1c <_fflush_r+0x28>
    6a14:	03452783          	lw	a5,52(a0)
    6a18:	0a078a63          	beqz	a5,6acc <_fflush_r+0xd8>
    6a1c:	00c41783          	lh	a5,12(s0)
    6a20:	00000913          	li	s2,0
    6a24:	04078063          	beqz	a5,6a64 <_fflush_r+0x70>
    6a28:	06442703          	lw	a4,100(s0)
    6a2c:	00177713          	and	a4,a4,1
    6a30:	00071663          	bnez	a4,6a3c <_fflush_r+0x48>
    6a34:	2007f793          	and	a5,a5,512
    6a38:	04078463          	beqz	a5,6a80 <_fflush_r+0x8c>
    6a3c:	00040593          	mv	a1,s0
    6a40:	00048513          	mv	a0,s1
    6a44:	d65ff0ef          	jal	67a8 <__sflush_r>
    6a48:	06442783          	lw	a5,100(s0)
    6a4c:	00050913          	mv	s2,a0
    6a50:	0017f793          	and	a5,a5,1
    6a54:	00079863          	bnez	a5,6a64 <_fflush_r+0x70>
    6a58:	00c45783          	lhu	a5,12(s0)
    6a5c:	2007f793          	and	a5,a5,512
    6a60:	04078463          	beqz	a5,6aa8 <_fflush_r+0xb4>
    6a64:	00c12083          	lw	ra,12(sp)
    6a68:	00812403          	lw	s0,8(sp)
    6a6c:	00412483          	lw	s1,4(sp)
    6a70:	00090513          	mv	a0,s2
    6a74:	00012903          	lw	s2,0(sp)
    6a78:	01010113          	add	sp,sp,16
    6a7c:	00008067          	ret
    6a80:	05842503          	lw	a0,88(s0)
    6a84:	e44fa0ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    6a88:	00040593          	mv	a1,s0
    6a8c:	00048513          	mv	a0,s1
    6a90:	d19ff0ef          	jal	67a8 <__sflush_r>
    6a94:	06442783          	lw	a5,100(s0)
    6a98:	00050913          	mv	s2,a0
    6a9c:	0017f793          	and	a5,a5,1
    6aa0:	fc0792e3          	bnez	a5,6a64 <_fflush_r+0x70>
    6aa4:	fb5ff06f          	j	6a58 <_fflush_r+0x64>
    6aa8:	05842503          	lw	a0,88(s0)
    6aac:	e20fa0ef          	jal	10cc <__retarget_lock_release_recursive>
    6ab0:	00c12083          	lw	ra,12(sp)
    6ab4:	00812403          	lw	s0,8(sp)
    6ab8:	00412483          	lw	s1,4(sp)
    6abc:	00090513          	mv	a0,s2
    6ac0:	00012903          	lw	s2,0(sp)
    6ac4:	01010113          	add	sp,sp,16
    6ac8:	00008067          	ret
    6acc:	224000ef          	jal	6cf0 <__sinit>
    6ad0:	f4dff06f          	j	6a1c <_fflush_r+0x28>

00006ad4 <stdio_exit_handler>:
    6ad4:	7fffa617          	auipc	a2,0x7fffa
    6ad8:	a5460613          	add	a2,a2,-1452 # 80000528 <__sglue>
    6adc:	00004597          	auipc	a1,0x4
    6ae0:	28c58593          	add	a1,a1,652 # ad68 <_fclose_r>
    6ae4:	7fff9517          	auipc	a0,0x7fff9
    6ae8:	51c50513          	add	a0,a0,1308 # 80000000 <_impure_data>
    6aec:	7a00006f          	j	728c <_fwalk_sglue>

00006af0 <cleanup_stdio>:
    6af0:	00452583          	lw	a1,4(a0)
    6af4:	ff010113          	add	sp,sp,-16
    6af8:	00812423          	sw	s0,8(sp)
    6afc:	00112623          	sw	ra,12(sp)
    6b00:	7fffa797          	auipc	a5,0x7fffa
    6b04:	c8478793          	add	a5,a5,-892 # 80000784 <__sf>
    6b08:	00050413          	mv	s0,a0
    6b0c:	00f58463          	beq	a1,a5,6b14 <cleanup_stdio+0x24>
    6b10:	258040ef          	jal	ad68 <_fclose_r>
    6b14:	00842583          	lw	a1,8(s0)
    6b18:	7fffa797          	auipc	a5,0x7fffa
    6b1c:	cd478793          	add	a5,a5,-812 # 800007ec <__sf+0x68>
    6b20:	00f58663          	beq	a1,a5,6b2c <cleanup_stdio+0x3c>
    6b24:	00040513          	mv	a0,s0
    6b28:	240040ef          	jal	ad68 <_fclose_r>
    6b2c:	00c42583          	lw	a1,12(s0)
    6b30:	7fffa797          	auipc	a5,0x7fffa
    6b34:	d2478793          	add	a5,a5,-732 # 80000854 <__global_pointer+0x54>
    6b38:	00f58c63          	beq	a1,a5,6b50 <cleanup_stdio+0x60>
    6b3c:	00040513          	mv	a0,s0
    6b40:	00812403          	lw	s0,8(sp)
    6b44:	00c12083          	lw	ra,12(sp)
    6b48:	01010113          	add	sp,sp,16
    6b4c:	21c0406f          	j	ad68 <_fclose_r>
    6b50:	00c12083          	lw	ra,12(sp)
    6b54:	00812403          	lw	s0,8(sp)
    6b58:	01010113          	add	sp,sp,16
    6b5c:	00008067          	ret

00006b60 <global_stdio_init.part.0>:
    6b60:	fe010113          	add	sp,sp,-32
    6b64:	00000797          	auipc	a5,0x0
    6b68:	f7078793          	add	a5,a5,-144 # 6ad4 <stdio_exit_handler>
    6b6c:	00112e23          	sw	ra,28(sp)
    6b70:	00812c23          	sw	s0,24(sp)
    6b74:	00912a23          	sw	s1,20(sp)
    6b78:	7fffa417          	auipc	s0,0x7fffa
    6b7c:	c0c40413          	add	s0,s0,-1012 # 80000784 <__sf>
    6b80:	01212823          	sw	s2,16(sp)
    6b84:	01312623          	sw	s3,12(sp)
    6b88:	01412423          	sw	s4,8(sp)
    6b8c:	00800613          	li	a2,8
    6b90:	00000593          	li	a1,0
    6b94:	7fffa717          	auipc	a4,0x7fffa
    6b98:	baf72223          	sw	a5,-1116(a4) # 80000738 <__stdio_exit_handler>
    6b9c:	7fffa517          	auipc	a0,0x7fffa
    6ba0:	c4450513          	add	a0,a0,-956 # 800007e0 <__sf+0x5c>
    6ba4:	00400793          	li	a5,4
    6ba8:	00f42623          	sw	a5,12(s0)
    6bac:	00042023          	sw	zero,0(s0)
    6bb0:	00042223          	sw	zero,4(s0)
    6bb4:	00042423          	sw	zero,8(s0)
    6bb8:	06042223          	sw	zero,100(s0)
    6bbc:	00042823          	sw	zero,16(s0)
    6bc0:	00042a23          	sw	zero,20(s0)
    6bc4:	00042c23          	sw	zero,24(s0)
    6bc8:	d08fa0ef          	jal	10d0 <memset>
    6bcc:	00001a17          	auipc	s4,0x1
    6bd0:	870a0a13          	add	s4,s4,-1936 # 743c <__sread>
    6bd4:	00001997          	auipc	s3,0x1
    6bd8:	8c498993          	add	s3,s3,-1852 # 7498 <__swrite>
    6bdc:	00001917          	auipc	s2,0x1
    6be0:	94490913          	add	s2,s2,-1724 # 7520 <__sseek>
    6be4:	00001497          	auipc	s1,0x1
    6be8:	9b448493          	add	s1,s1,-1612 # 7598 <__sclose>
    6bec:	7fffa517          	auipc	a0,0x7fffa
    6bf0:	bf050513          	add	a0,a0,-1040 # 800007dc <__sf+0x58>
    6bf4:	03442023          	sw	s4,32(s0)
    6bf8:	03342223          	sw	s3,36(s0)
    6bfc:	03242423          	sw	s2,40(s0)
    6c00:	02942623          	sw	s1,44(s0)
    6c04:	00842e23          	sw	s0,28(s0)
    6c08:	cb8fa0ef          	jal	10c0 <__retarget_lock_init_recursive>
    6c0c:	000107b7          	lui	a5,0x10
    6c10:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x419>
    6c14:	00800613          	li	a2,8
    6c18:	00000593          	li	a1,0
    6c1c:	7fffa517          	auipc	a0,0x7fffa
    6c20:	c2c50513          	add	a0,a0,-980 # 80000848 <__global_pointer+0x48>
    6c24:	06f42a23          	sw	a5,116(s0)
    6c28:	06042423          	sw	zero,104(s0)
    6c2c:	06042623          	sw	zero,108(s0)
    6c30:	06042823          	sw	zero,112(s0)
    6c34:	0c042623          	sw	zero,204(s0)
    6c38:	06042c23          	sw	zero,120(s0)
    6c3c:	06042e23          	sw	zero,124(s0)
    6c40:	08042023          	sw	zero,128(s0)
    6c44:	c8cfa0ef          	jal	10d0 <memset>
    6c48:	7fffa797          	auipc	a5,0x7fffa
    6c4c:	ba478793          	add	a5,a5,-1116 # 800007ec <__sf+0x68>
    6c50:	7fffa517          	auipc	a0,0x7fffa
    6c54:	bf450513          	add	a0,a0,-1036 # 80000844 <__global_pointer+0x44>
    6c58:	08f42223          	sw	a5,132(s0)
    6c5c:	09442423          	sw	s4,136(s0)
    6c60:	09342623          	sw	s3,140(s0)
    6c64:	09242823          	sw	s2,144(s0)
    6c68:	08942a23          	sw	s1,148(s0)
    6c6c:	c54fa0ef          	jal	10c0 <__retarget_lock_init_recursive>
    6c70:	000207b7          	lui	a5,0x20
    6c74:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6c78:	00800613          	li	a2,8
    6c7c:	00000593          	li	a1,0
    6c80:	7fffa517          	auipc	a0,0x7fffa
    6c84:	c3050513          	add	a0,a0,-976 # 800008b0 <__global_pointer+0xb0>
    6c88:	0cf42e23          	sw	a5,220(s0)
    6c8c:	0c042823          	sw	zero,208(s0)
    6c90:	0c042a23          	sw	zero,212(s0)
    6c94:	0c042c23          	sw	zero,216(s0)
    6c98:	12042a23          	sw	zero,308(s0)
    6c9c:	0e042023          	sw	zero,224(s0)
    6ca0:	0e042223          	sw	zero,228(s0)
    6ca4:	0e042423          	sw	zero,232(s0)
    6ca8:	c28fa0ef          	jal	10d0 <memset>
    6cac:	7fffa797          	auipc	a5,0x7fffa
    6cb0:	ba878793          	add	a5,a5,-1112 # 80000854 <__global_pointer+0x54>
    6cb4:	0f442823          	sw	s4,240(s0)
    6cb8:	0f342a23          	sw	s3,244(s0)
    6cbc:	0f242c23          	sw	s2,248(s0)
    6cc0:	0e942e23          	sw	s1,252(s0)
    6cc4:	0ef42623          	sw	a5,236(s0)
    6cc8:	01812403          	lw	s0,24(sp)
    6ccc:	01c12083          	lw	ra,28(sp)
    6cd0:	01412483          	lw	s1,20(sp)
    6cd4:	01012903          	lw	s2,16(sp)
    6cd8:	00c12983          	lw	s3,12(sp)
    6cdc:	00812a03          	lw	s4,8(sp)
    6ce0:	7fffa517          	auipc	a0,0x7fffa
    6ce4:	bcc50513          	add	a0,a0,-1076 # 800008ac <__global_pointer+0xac>
    6ce8:	02010113          	add	sp,sp,32
    6cec:	bd4fa06f          	j	10c0 <__retarget_lock_init_recursive>

00006cf0 <__sinit>:
    6cf0:	ff010113          	add	sp,sp,-16
    6cf4:	00812423          	sw	s0,8(sp)
    6cf8:	00050413          	mv	s0,a0
    6cfc:	7fffa517          	auipc	a0,0x7fffa
    6d00:	a2c50513          	add	a0,a0,-1492 # 80000728 <__lock___sfp_recursive_mutex>
    6d04:	00112623          	sw	ra,12(sp)
    6d08:	bc0fa0ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    6d0c:	03442783          	lw	a5,52(s0)
    6d10:	00079e63          	bnez	a5,6d2c <__sinit+0x3c>
    6d14:	00000797          	auipc	a5,0x0
    6d18:	ddc78793          	add	a5,a5,-548 # 6af0 <cleanup_stdio>
    6d1c:	02f42a23          	sw	a5,52(s0)
    6d20:	7fffa797          	auipc	a5,0x7fffa
    6d24:	a187a783          	lw	a5,-1512(a5) # 80000738 <__stdio_exit_handler>
    6d28:	00078e63          	beqz	a5,6d44 <__sinit+0x54>
    6d2c:	00812403          	lw	s0,8(sp)
    6d30:	00c12083          	lw	ra,12(sp)
    6d34:	7fffa517          	auipc	a0,0x7fffa
    6d38:	9f450513          	add	a0,a0,-1548 # 80000728 <__lock___sfp_recursive_mutex>
    6d3c:	01010113          	add	sp,sp,16
    6d40:	b8cfa06f          	j	10cc <__retarget_lock_release_recursive>
    6d44:	e1dff0ef          	jal	6b60 <global_stdio_init.part.0>
    6d48:	00812403          	lw	s0,8(sp)
    6d4c:	00c12083          	lw	ra,12(sp)
    6d50:	7fffa517          	auipc	a0,0x7fffa
    6d54:	9d850513          	add	a0,a0,-1576 # 80000728 <__lock___sfp_recursive_mutex>
    6d58:	01010113          	add	sp,sp,16
    6d5c:	b70fa06f          	j	10cc <__retarget_lock_release_recursive>

00006d60 <__sfp_lock_acquire>:
    6d60:	7fffa517          	auipc	a0,0x7fffa
    6d64:	9c850513          	add	a0,a0,-1592 # 80000728 <__lock___sfp_recursive_mutex>
    6d68:	b60fa06f          	j	10c8 <__retarget_lock_acquire_recursive>

00006d6c <__sfp_lock_release>:
    6d6c:	7fffa517          	auipc	a0,0x7fffa
    6d70:	9bc50513          	add	a0,a0,-1604 # 80000728 <__lock___sfp_recursive_mutex>
    6d74:	b58fa06f          	j	10cc <__retarget_lock_release_recursive>

00006d78 <__sfvwrite_r>:
    6d78:	00862783          	lw	a5,8(a2)
    6d7c:	2c078463          	beqz	a5,7044 <__sfvwrite_r+0x2cc>
    6d80:	00c59683          	lh	a3,12(a1)
    6d84:	fd010113          	add	sp,sp,-48
    6d88:	02812423          	sw	s0,40(sp)
    6d8c:	01412c23          	sw	s4,24(sp)
    6d90:	01612823          	sw	s6,16(sp)
    6d94:	02112623          	sw	ra,44(sp)
    6d98:	0086f793          	and	a5,a3,8
    6d9c:	00060b13          	mv	s6,a2
    6da0:	00050a13          	mv	s4,a0
    6da4:	00058413          	mv	s0,a1
    6da8:	08078e63          	beqz	a5,6e44 <__sfvwrite_r+0xcc>
    6dac:	0105a783          	lw	a5,16(a1)
    6db0:	08078a63          	beqz	a5,6e44 <__sfvwrite_r+0xcc>
    6db4:	02912223          	sw	s1,36(sp)
    6db8:	03212023          	sw	s2,32(sp)
    6dbc:	01312e23          	sw	s3,28(sp)
    6dc0:	01512a23          	sw	s5,20(sp)
    6dc4:	0026f793          	and	a5,a3,2
    6dc8:	000b2483          	lw	s1,0(s6)
    6dcc:	0a078463          	beqz	a5,6e74 <__sfvwrite_r+0xfc>
    6dd0:	02442783          	lw	a5,36(s0)
    6dd4:	01c42583          	lw	a1,28(s0)
    6dd8:	80000ab7          	lui	s5,0x80000
    6ddc:	00000993          	li	s3,0
    6de0:	00000913          	li	s2,0
    6de4:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6de8:	00098613          	mv	a2,s3
    6dec:	000a0513          	mv	a0,s4
    6df0:	04090263          	beqz	s2,6e34 <__sfvwrite_r+0xbc>
    6df4:	00090693          	mv	a3,s2
    6df8:	012af463          	bgeu	s5,s2,6e00 <__sfvwrite_r+0x88>
    6dfc:	000a8693          	mv	a3,s5
    6e00:	000780e7          	jalr	a5
    6e04:	46a05263          	blez	a0,7268 <__sfvwrite_r+0x4f0>
    6e08:	008b2783          	lw	a5,8(s6)
    6e0c:	00a989b3          	add	s3,s3,a0
    6e10:	40a90933          	sub	s2,s2,a0
    6e14:	40a787b3          	sub	a5,a5,a0
    6e18:	00fb2423          	sw	a5,8(s6)
    6e1c:	1a078663          	beqz	a5,6fc8 <__sfvwrite_r+0x250>
    6e20:	02442783          	lw	a5,36(s0)
    6e24:	01c42583          	lw	a1,28(s0)
    6e28:	00098613          	mv	a2,s3
    6e2c:	000a0513          	mv	a0,s4
    6e30:	fc0912e3          	bnez	s2,6df4 <__sfvwrite_r+0x7c>
    6e34:	0004a983          	lw	s3,0(s1)
    6e38:	0044a903          	lw	s2,4(s1)
    6e3c:	00848493          	add	s1,s1,8
    6e40:	fa9ff06f          	j	6de8 <__sfvwrite_r+0x70>
    6e44:	00040593          	mv	a1,s0
    6e48:	000a0513          	mv	a0,s4
    6e4c:	0e5000ef          	jal	7730 <__swsetup_r>
    6e50:	1c051c63          	bnez	a0,7028 <__sfvwrite_r+0x2b0>
    6e54:	00c41683          	lh	a3,12(s0)
    6e58:	02912223          	sw	s1,36(sp)
    6e5c:	03212023          	sw	s2,32(sp)
    6e60:	01312e23          	sw	s3,28(sp)
    6e64:	01512a23          	sw	s5,20(sp)
    6e68:	0026f793          	and	a5,a3,2
    6e6c:	000b2483          	lw	s1,0(s6)
    6e70:	f60790e3          	bnez	a5,6dd0 <__sfvwrite_r+0x58>
    6e74:	01712623          	sw	s7,12(sp)
    6e78:	01812423          	sw	s8,8(sp)
    6e7c:	0016f793          	and	a5,a3,1
    6e80:	1c079663          	bnez	a5,704c <__sfvwrite_r+0x2d4>
    6e84:	00042783          	lw	a5,0(s0)
    6e88:	00842703          	lw	a4,8(s0)
    6e8c:	80000ab7          	lui	s5,0x80000
    6e90:	01912223          	sw	s9,4(sp)
    6e94:	00000b93          	li	s7,0
    6e98:	00000993          	li	s3,0
    6e9c:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6ea0:	00078513          	mv	a0,a5
    6ea4:	00070c13          	mv	s8,a4
    6ea8:	10098263          	beqz	s3,6fac <__sfvwrite_r+0x234>
    6eac:	2006f613          	and	a2,a3,512
    6eb0:	28060863          	beqz	a2,7140 <__sfvwrite_r+0x3c8>
    6eb4:	00070c93          	mv	s9,a4
    6eb8:	32e9e863          	bltu	s3,a4,71e8 <__sfvwrite_r+0x470>
    6ebc:	4806f713          	and	a4,a3,1152
    6ec0:	08070a63          	beqz	a4,6f54 <__sfvwrite_r+0x1dc>
    6ec4:	01442603          	lw	a2,20(s0)
    6ec8:	01042583          	lw	a1,16(s0)
    6ecc:	00161713          	sll	a4,a2,0x1
    6ed0:	00c70733          	add	a4,a4,a2
    6ed4:	40b78933          	sub	s2,a5,a1
    6ed8:	01f75c13          	srl	s8,a4,0x1f
    6edc:	00ec0c33          	add	s8,s8,a4
    6ee0:	00190793          	add	a5,s2,1
    6ee4:	401c5c13          	sra	s8,s8,0x1
    6ee8:	013787b3          	add	a5,a5,s3
    6eec:	000c0613          	mv	a2,s8
    6ef0:	00fc7663          	bgeu	s8,a5,6efc <__sfvwrite_r+0x184>
    6ef4:	00078c13          	mv	s8,a5
    6ef8:	00078613          	mv	a2,a5
    6efc:	4006f693          	and	a3,a3,1024
    6f00:	32068063          	beqz	a3,7220 <__sfvwrite_r+0x4a8>
    6f04:	00060593          	mv	a1,a2
    6f08:	000a0513          	mv	a0,s4
    6f0c:	921fa0ef          	jal	182c <_malloc_r>
    6f10:	00050c93          	mv	s9,a0
    6f14:	34050e63          	beqz	a0,7270 <__sfvwrite_r+0x4f8>
    6f18:	01042583          	lw	a1,16(s0)
    6f1c:	00090613          	mv	a2,s2
    6f20:	a8cfa0ef          	jal	11ac <memcpy>
    6f24:	00c45783          	lhu	a5,12(s0)
    6f28:	b7f7f793          	and	a5,a5,-1153
    6f2c:	0807e793          	or	a5,a5,128
    6f30:	00f41623          	sh	a5,12(s0)
    6f34:	012c8533          	add	a0,s9,s2
    6f38:	412c07b3          	sub	a5,s8,s2
    6f3c:	01942823          	sw	s9,16(s0)
    6f40:	01842a23          	sw	s8,20(s0)
    6f44:	00a42023          	sw	a0,0(s0)
    6f48:	00098c13          	mv	s8,s3
    6f4c:	00f42423          	sw	a5,8(s0)
    6f50:	00098c93          	mv	s9,s3
    6f54:	000c8613          	mv	a2,s9
    6f58:	000b8593          	mv	a1,s7
    6f5c:	6a9000ef          	jal	7e04 <memmove>
    6f60:	00842703          	lw	a4,8(s0)
    6f64:	00042783          	lw	a5,0(s0)
    6f68:	00098913          	mv	s2,s3
    6f6c:	41870733          	sub	a4,a4,s8
    6f70:	019787b3          	add	a5,a5,s9
    6f74:	00e42423          	sw	a4,8(s0)
    6f78:	00f42023          	sw	a5,0(s0)
    6f7c:	00000993          	li	s3,0
    6f80:	008b2783          	lw	a5,8(s6)
    6f84:	012b8bb3          	add	s7,s7,s2
    6f88:	412787b3          	sub	a5,a5,s2
    6f8c:	00fb2423          	sw	a5,8(s6)
    6f90:	02078663          	beqz	a5,6fbc <__sfvwrite_r+0x244>
    6f94:	00042783          	lw	a5,0(s0)
    6f98:	00842703          	lw	a4,8(s0)
    6f9c:	00c41683          	lh	a3,12(s0)
    6fa0:	00078513          	mv	a0,a5
    6fa4:	00070c13          	mv	s8,a4
    6fa8:	f00992e3          	bnez	s3,6eac <__sfvwrite_r+0x134>
    6fac:	0004ab83          	lw	s7,0(s1)
    6fb0:	0044a983          	lw	s3,4(s1)
    6fb4:	00848493          	add	s1,s1,8
    6fb8:	ee9ff06f          	j	6ea0 <__sfvwrite_r+0x128>
    6fbc:	00c12b83          	lw	s7,12(sp)
    6fc0:	00812c03          	lw	s8,8(sp)
    6fc4:	00412c83          	lw	s9,4(sp)
    6fc8:	02c12083          	lw	ra,44(sp)
    6fcc:	02812403          	lw	s0,40(sp)
    6fd0:	02412483          	lw	s1,36(sp)
    6fd4:	02012903          	lw	s2,32(sp)
    6fd8:	01c12983          	lw	s3,28(sp)
    6fdc:	01412a83          	lw	s5,20(sp)
    6fe0:	01812a03          	lw	s4,24(sp)
    6fe4:	01012b03          	lw	s6,16(sp)
    6fe8:	00000513          	li	a0,0
    6fec:	03010113          	add	sp,sp,48
    6ff0:	00008067          	ret
    6ff4:	00040593          	mv	a1,s0
    6ff8:	000a0513          	mv	a0,s4
    6ffc:	9f9ff0ef          	jal	69f4 <_fflush_r>
    7000:	0a050e63          	beqz	a0,70bc <__sfvwrite_r+0x344>
    7004:	00c41783          	lh	a5,12(s0)
    7008:	00c12b83          	lw	s7,12(sp)
    700c:	00812c03          	lw	s8,8(sp)
    7010:	02412483          	lw	s1,36(sp)
    7014:	02012903          	lw	s2,32(sp)
    7018:	01c12983          	lw	s3,28(sp)
    701c:	01412a83          	lw	s5,20(sp)
    7020:	0407e793          	or	a5,a5,64
    7024:	00f41623          	sh	a5,12(s0)
    7028:	02c12083          	lw	ra,44(sp)
    702c:	02812403          	lw	s0,40(sp)
    7030:	01812a03          	lw	s4,24(sp)
    7034:	01012b03          	lw	s6,16(sp)
    7038:	fff00513          	li	a0,-1
    703c:	03010113          	add	sp,sp,48
    7040:	00008067          	ret
    7044:	00000513          	li	a0,0
    7048:	00008067          	ret
    704c:	00000a93          	li	s5,0
    7050:	00000513          	li	a0,0
    7054:	00000c13          	li	s8,0
    7058:	00000993          	li	s3,0
    705c:	08098263          	beqz	s3,70e0 <__sfvwrite_r+0x368>
    7060:	08050a63          	beqz	a0,70f4 <__sfvwrite_r+0x37c>
    7064:	000a8793          	mv	a5,s5
    7068:	00098b93          	mv	s7,s3
    706c:	0137f463          	bgeu	a5,s3,7074 <__sfvwrite_r+0x2fc>
    7070:	00078b93          	mv	s7,a5
    7074:	00042503          	lw	a0,0(s0)
    7078:	01042783          	lw	a5,16(s0)
    707c:	00842903          	lw	s2,8(s0)
    7080:	01442683          	lw	a3,20(s0)
    7084:	00a7f663          	bgeu	a5,a0,7090 <__sfvwrite_r+0x318>
    7088:	00d90933          	add	s2,s2,a3
    708c:	09794463          	blt	s2,s7,7114 <__sfvwrite_r+0x39c>
    7090:	16dbc263          	blt	s7,a3,71f4 <__sfvwrite_r+0x47c>
    7094:	02442783          	lw	a5,36(s0)
    7098:	01c42583          	lw	a1,28(s0)
    709c:	000c0613          	mv	a2,s8
    70a0:	000a0513          	mv	a0,s4
    70a4:	000780e7          	jalr	a5
    70a8:	00050913          	mv	s2,a0
    70ac:	f4a05ce3          	blez	a0,7004 <__sfvwrite_r+0x28c>
    70b0:	412a8ab3          	sub	s5,s5,s2
    70b4:	00100513          	li	a0,1
    70b8:	f20a8ee3          	beqz	s5,6ff4 <__sfvwrite_r+0x27c>
    70bc:	008b2783          	lw	a5,8(s6)
    70c0:	012c0c33          	add	s8,s8,s2
    70c4:	412989b3          	sub	s3,s3,s2
    70c8:	412787b3          	sub	a5,a5,s2
    70cc:	00fb2423          	sw	a5,8(s6)
    70d0:	f80796e3          	bnez	a5,705c <__sfvwrite_r+0x2e4>
    70d4:	00c12b83          	lw	s7,12(sp)
    70d8:	00812c03          	lw	s8,8(sp)
    70dc:	eedff06f          	j	6fc8 <__sfvwrite_r+0x250>
    70e0:	0044a983          	lw	s3,4(s1)
    70e4:	00048793          	mv	a5,s1
    70e8:	00848493          	add	s1,s1,8
    70ec:	fe098ae3          	beqz	s3,70e0 <__sfvwrite_r+0x368>
    70f0:	0007ac03          	lw	s8,0(a5)
    70f4:	00098613          	mv	a2,s3
    70f8:	00a00593          	li	a1,10
    70fc:	000c0513          	mv	a0,s8
    7100:	1a1000ef          	jal	7aa0 <memchr>
    7104:	14050c63          	beqz	a0,725c <__sfvwrite_r+0x4e4>
    7108:	00150513          	add	a0,a0,1
    710c:	41850ab3          	sub	s5,a0,s8
    7110:	f55ff06f          	j	7064 <__sfvwrite_r+0x2ec>
    7114:	000c0593          	mv	a1,s8
    7118:	00090613          	mv	a2,s2
    711c:	4e9000ef          	jal	7e04 <memmove>
    7120:	00042783          	lw	a5,0(s0)
    7124:	00040593          	mv	a1,s0
    7128:	000a0513          	mv	a0,s4
    712c:	012787b3          	add	a5,a5,s2
    7130:	00f42023          	sw	a5,0(s0)
    7134:	8c1ff0ef          	jal	69f4 <_fflush_r>
    7138:	f6050ce3          	beqz	a0,70b0 <__sfvwrite_r+0x338>
    713c:	ec9ff06f          	j	7004 <__sfvwrite_r+0x28c>
    7140:	01042683          	lw	a3,16(s0)
    7144:	04f6e463          	bltu	a3,a5,718c <__sfvwrite_r+0x414>
    7148:	01442583          	lw	a1,20(s0)
    714c:	04b9e063          	bltu	s3,a1,718c <__sfvwrite_r+0x414>
    7150:	00098913          	mv	s2,s3
    7154:	013af463          	bgeu	s5,s3,715c <__sfvwrite_r+0x3e4>
    7158:	000a8913          	mv	s2,s5
    715c:	00090513          	mv	a0,s2
    7160:	65d070ef          	jal	efbc <__modsi3>
    7164:	02442783          	lw	a5,36(s0)
    7168:	01c42583          	lw	a1,28(s0)
    716c:	40a906b3          	sub	a3,s2,a0
    7170:	000b8613          	mv	a2,s7
    7174:	000a0513          	mv	a0,s4
    7178:	000780e7          	jalr	a5
    717c:	00050913          	mv	s2,a0
    7180:	04a05a63          	blez	a0,71d4 <__sfvwrite_r+0x45c>
    7184:	412989b3          	sub	s3,s3,s2
    7188:	df9ff06f          	j	6f80 <__sfvwrite_r+0x208>
    718c:	00070913          	mv	s2,a4
    7190:	00e9f463          	bgeu	s3,a4,7198 <__sfvwrite_r+0x420>
    7194:	00098913          	mv	s2,s3
    7198:	00078513          	mv	a0,a5
    719c:	00090613          	mv	a2,s2
    71a0:	000b8593          	mv	a1,s7
    71a4:	461000ef          	jal	7e04 <memmove>
    71a8:	00842703          	lw	a4,8(s0)
    71ac:	00042783          	lw	a5,0(s0)
    71b0:	41270733          	sub	a4,a4,s2
    71b4:	012787b3          	add	a5,a5,s2
    71b8:	00e42423          	sw	a4,8(s0)
    71bc:	00f42023          	sw	a5,0(s0)
    71c0:	fc0712e3          	bnez	a4,7184 <__sfvwrite_r+0x40c>
    71c4:	00040593          	mv	a1,s0
    71c8:	000a0513          	mv	a0,s4
    71cc:	829ff0ef          	jal	69f4 <_fflush_r>
    71d0:	fa050ae3          	beqz	a0,7184 <__sfvwrite_r+0x40c>
    71d4:	00c41783          	lh	a5,12(s0)
    71d8:	00c12b83          	lw	s7,12(sp)
    71dc:	00812c03          	lw	s8,8(sp)
    71e0:	00412c83          	lw	s9,4(sp)
    71e4:	e2dff06f          	j	7010 <__sfvwrite_r+0x298>
    71e8:	00098c13          	mv	s8,s3
    71ec:	00098c93          	mv	s9,s3
    71f0:	d65ff06f          	j	6f54 <__sfvwrite_r+0x1dc>
    71f4:	000b8613          	mv	a2,s7
    71f8:	000c0593          	mv	a1,s8
    71fc:	409000ef          	jal	7e04 <memmove>
    7200:	00842703          	lw	a4,8(s0)
    7204:	00042783          	lw	a5,0(s0)
    7208:	000b8913          	mv	s2,s7
    720c:	41770733          	sub	a4,a4,s7
    7210:	017787b3          	add	a5,a5,s7
    7214:	00e42423          	sw	a4,8(s0)
    7218:	00f42023          	sw	a5,0(s0)
    721c:	e95ff06f          	j	70b0 <__sfvwrite_r+0x338>
    7220:	000a0513          	mv	a0,s4
    7224:	508030ef          	jal	a72c <_realloc_r>
    7228:	00050c93          	mv	s9,a0
    722c:	d00514e3          	bnez	a0,6f34 <__sfvwrite_r+0x1bc>
    7230:	01042583          	lw	a1,16(s0)
    7234:	000a0513          	mv	a0,s4
    7238:	ae8fa0ef          	jal	1520 <_free_r>
    723c:	00c41783          	lh	a5,12(s0)
    7240:	00c00713          	li	a4,12
    7244:	00c12b83          	lw	s7,12(sp)
    7248:	00812c03          	lw	s8,8(sp)
    724c:	00412c83          	lw	s9,4(sp)
    7250:	00ea2023          	sw	a4,0(s4)
    7254:	f7f7f793          	and	a5,a5,-129
    7258:	db9ff06f          	j	7010 <__sfvwrite_r+0x298>
    725c:	00198793          	add	a5,s3,1
    7260:	00078a93          	mv	s5,a5
    7264:	e05ff06f          	j	7068 <__sfvwrite_r+0x2f0>
    7268:	00c41783          	lh	a5,12(s0)
    726c:	da5ff06f          	j	7010 <__sfvwrite_r+0x298>
    7270:	00c00713          	li	a4,12
    7274:	00c41783          	lh	a5,12(s0)
    7278:	00c12b83          	lw	s7,12(sp)
    727c:	00812c03          	lw	s8,8(sp)
    7280:	00412c83          	lw	s9,4(sp)
    7284:	00ea2023          	sw	a4,0(s4)
    7288:	d89ff06f          	j	7010 <__sfvwrite_r+0x298>

0000728c <_fwalk_sglue>:
    728c:	fd010113          	add	sp,sp,-48
    7290:	03212023          	sw	s2,32(sp)
    7294:	01312e23          	sw	s3,28(sp)
    7298:	01412c23          	sw	s4,24(sp)
    729c:	01512a23          	sw	s5,20(sp)
    72a0:	01612823          	sw	s6,16(sp)
    72a4:	01712623          	sw	s7,12(sp)
    72a8:	02112623          	sw	ra,44(sp)
    72ac:	02812423          	sw	s0,40(sp)
    72b0:	02912223          	sw	s1,36(sp)
    72b4:	00050b13          	mv	s6,a0
    72b8:	00058b93          	mv	s7,a1
    72bc:	00060a93          	mv	s5,a2
    72c0:	00000a13          	li	s4,0
    72c4:	00100993          	li	s3,1
    72c8:	fff00913          	li	s2,-1
    72cc:	004aa483          	lw	s1,4(s5)
    72d0:	008aa403          	lw	s0,8(s5)
    72d4:	fff48493          	add	s1,s1,-1
    72d8:	0204c863          	bltz	s1,7308 <_fwalk_sglue+0x7c>
    72dc:	00c45783          	lhu	a5,12(s0)
    72e0:	00f9fe63          	bgeu	s3,a5,72fc <_fwalk_sglue+0x70>
    72e4:	00e41783          	lh	a5,14(s0)
    72e8:	00040593          	mv	a1,s0
    72ec:	000b0513          	mv	a0,s6
    72f0:	01278663          	beq	a5,s2,72fc <_fwalk_sglue+0x70>
    72f4:	000b80e7          	jalr	s7
    72f8:	00aa6a33          	or	s4,s4,a0
    72fc:	fff48493          	add	s1,s1,-1
    7300:	06840413          	add	s0,s0,104
    7304:	fd249ce3          	bne	s1,s2,72dc <_fwalk_sglue+0x50>
    7308:	000aaa83          	lw	s5,0(s5)
    730c:	fc0a90e3          	bnez	s5,72cc <_fwalk_sglue+0x40>
    7310:	02c12083          	lw	ra,44(sp)
    7314:	02812403          	lw	s0,40(sp)
    7318:	02412483          	lw	s1,36(sp)
    731c:	02012903          	lw	s2,32(sp)
    7320:	01c12983          	lw	s3,28(sp)
    7324:	01412a83          	lw	s5,20(sp)
    7328:	01012b03          	lw	s6,16(sp)
    732c:	00c12b83          	lw	s7,12(sp)
    7330:	000a0513          	mv	a0,s4
    7334:	01812a03          	lw	s4,24(sp)
    7338:	03010113          	add	sp,sp,48
    733c:	00008067          	ret

00007340 <_putc_r>:
    7340:	fe010113          	add	sp,sp,-32
    7344:	00812c23          	sw	s0,24(sp)
    7348:	01212a23          	sw	s2,20(sp)
    734c:	00112e23          	sw	ra,28(sp)
    7350:	00050913          	mv	s2,a0
    7354:	00060413          	mv	s0,a2
    7358:	00050663          	beqz	a0,7364 <_putc_r+0x24>
    735c:	03452783          	lw	a5,52(a0)
    7360:	0c078663          	beqz	a5,742c <_putc_r+0xec>
    7364:	06442783          	lw	a5,100(s0)
    7368:	0017f793          	and	a5,a5,1
    736c:	00079863          	bnez	a5,737c <_putc_r+0x3c>
    7370:	00c45783          	lhu	a5,12(s0)
    7374:	2007f793          	and	a5,a5,512
    7378:	08078063          	beqz	a5,73f8 <_putc_r+0xb8>
    737c:	00842783          	lw	a5,8(s0)
    7380:	fff78793          	add	a5,a5,-1
    7384:	00f42423          	sw	a5,8(s0)
    7388:	0007dc63          	bgez	a5,73a0 <_putc_r+0x60>
    738c:	01842703          	lw	a4,24(s0)
    7390:	04e7ca63          	blt	a5,a4,73e4 <_putc_r+0xa4>
    7394:	0ff5f793          	zext.b	a5,a1
    7398:	00a00713          	li	a4,10
    739c:	04e78463          	beq	a5,a4,73e4 <_putc_r+0xa4>
    73a0:	00042783          	lw	a5,0(s0)
    73a4:	0ff5f913          	zext.b	s2,a1
    73a8:	00178713          	add	a4,a5,1
    73ac:	00e42023          	sw	a4,0(s0)
    73b0:	00b78023          	sb	a1,0(a5)
    73b4:	06442783          	lw	a5,100(s0)
    73b8:	0017f793          	and	a5,a5,1
    73bc:	00079863          	bnez	a5,73cc <_putc_r+0x8c>
    73c0:	00c45783          	lhu	a5,12(s0)
    73c4:	2007f793          	and	a5,a5,512
    73c8:	04078263          	beqz	a5,740c <_putc_r+0xcc>
    73cc:	01c12083          	lw	ra,28(sp)
    73d0:	01812403          	lw	s0,24(sp)
    73d4:	00090513          	mv	a0,s2
    73d8:	01412903          	lw	s2,20(sp)
    73dc:	02010113          	add	sp,sp,32
    73e0:	00008067          	ret
    73e4:	00090513          	mv	a0,s2
    73e8:	00040613          	mv	a2,s0
    73ec:	1b4000ef          	jal	75a0 <__swbuf_r>
    73f0:	00050913          	mv	s2,a0
    73f4:	fc1ff06f          	j	73b4 <_putc_r+0x74>
    73f8:	05842503          	lw	a0,88(s0)
    73fc:	00b12623          	sw	a1,12(sp)
    7400:	cc9f90ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    7404:	00c12583          	lw	a1,12(sp)
    7408:	f75ff06f          	j	737c <_putc_r+0x3c>
    740c:	05842503          	lw	a0,88(s0)
    7410:	cbdf90ef          	jal	10cc <__retarget_lock_release_recursive>
    7414:	01c12083          	lw	ra,28(sp)
    7418:	01812403          	lw	s0,24(sp)
    741c:	00090513          	mv	a0,s2
    7420:	01412903          	lw	s2,20(sp)
    7424:	02010113          	add	sp,sp,32
    7428:	00008067          	ret
    742c:	00b12623          	sw	a1,12(sp)
    7430:	8c1ff0ef          	jal	6cf0 <__sinit>
    7434:	00c12583          	lw	a1,12(sp)
    7438:	f2dff06f          	j	7364 <_putc_r+0x24>

0000743c <__sread>:
    743c:	ff010113          	add	sp,sp,-16
    7440:	00812423          	sw	s0,8(sp)
    7444:	00058413          	mv	s0,a1
    7448:	00e59583          	lh	a1,14(a1)
    744c:	00112623          	sw	ra,12(sp)
    7450:	095000ef          	jal	7ce4 <_read_r>
    7454:	02054063          	bltz	a0,7474 <__sread+0x38>
    7458:	05042783          	lw	a5,80(s0)
    745c:	00c12083          	lw	ra,12(sp)
    7460:	00a787b3          	add	a5,a5,a0
    7464:	04f42823          	sw	a5,80(s0)
    7468:	00812403          	lw	s0,8(sp)
    746c:	01010113          	add	sp,sp,16
    7470:	00008067          	ret
    7474:	00c45783          	lhu	a5,12(s0)
    7478:	fffff737          	lui	a4,0xfffff
    747c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7480:	00e7f7b3          	and	a5,a5,a4
    7484:	00c12083          	lw	ra,12(sp)
    7488:	00f41623          	sh	a5,12(s0)
    748c:	00812403          	lw	s0,8(sp)
    7490:	01010113          	add	sp,sp,16
    7494:	00008067          	ret

00007498 <__swrite>:
    7498:	00c59783          	lh	a5,12(a1)
    749c:	fe010113          	add	sp,sp,-32
    74a0:	00812c23          	sw	s0,24(sp)
    74a4:	00912a23          	sw	s1,20(sp)
    74a8:	01212823          	sw	s2,16(sp)
    74ac:	01312623          	sw	s3,12(sp)
    74b0:	00112e23          	sw	ra,28(sp)
    74b4:	1007f713          	and	a4,a5,256
    74b8:	00058413          	mv	s0,a1
    74bc:	00050493          	mv	s1,a0
    74c0:	00060913          	mv	s2,a2
    74c4:	00068993          	mv	s3,a3
    74c8:	04071063          	bnez	a4,7508 <__swrite+0x70>
    74cc:	fffff737          	lui	a4,0xfffff
    74d0:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    74d4:	00e7f7b3          	and	a5,a5,a4
    74d8:	00e41583          	lh	a1,14(s0)
    74dc:	00f41623          	sh	a5,12(s0)
    74e0:	01812403          	lw	s0,24(sp)
    74e4:	01c12083          	lw	ra,28(sp)
    74e8:	00098693          	mv	a3,s3
    74ec:	00090613          	mv	a2,s2
    74f0:	00c12983          	lw	s3,12(sp)
    74f4:	01012903          	lw	s2,16(sp)
    74f8:	00048513          	mv	a0,s1
    74fc:	01412483          	lw	s1,20(sp)
    7500:	02010113          	add	sp,sp,32
    7504:	09d0006f          	j	7da0 <_write_r>
    7508:	00e59583          	lh	a1,14(a1)
    750c:	00200693          	li	a3,2
    7510:	00000613          	li	a2,0
    7514:	76c000ef          	jal	7c80 <_lseek_r>
    7518:	00c41783          	lh	a5,12(s0)
    751c:	fb1ff06f          	j	74cc <__swrite+0x34>

00007520 <__sseek>:
    7520:	ff010113          	add	sp,sp,-16
    7524:	00812423          	sw	s0,8(sp)
    7528:	00058413          	mv	s0,a1
    752c:	00e59583          	lh	a1,14(a1)
    7530:	00112623          	sw	ra,12(sp)
    7534:	74c000ef          	jal	7c80 <_lseek_r>
    7538:	fff00793          	li	a5,-1
    753c:	02f50863          	beq	a0,a5,756c <__sseek+0x4c>
    7540:	00c45783          	lhu	a5,12(s0)
    7544:	00001737          	lui	a4,0x1
    7548:	00c12083          	lw	ra,12(sp)
    754c:	00e7e7b3          	or	a5,a5,a4
    7550:	01079793          	sll	a5,a5,0x10
    7554:	4107d793          	sra	a5,a5,0x10
    7558:	04a42823          	sw	a0,80(s0)
    755c:	00f41623          	sh	a5,12(s0)
    7560:	00812403          	lw	s0,8(sp)
    7564:	01010113          	add	sp,sp,16
    7568:	00008067          	ret
    756c:	00c45783          	lhu	a5,12(s0)
    7570:	fffff737          	lui	a4,0xfffff
    7574:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7578:	00e7f7b3          	and	a5,a5,a4
    757c:	01079793          	sll	a5,a5,0x10
    7580:	4107d793          	sra	a5,a5,0x10
    7584:	00c12083          	lw	ra,12(sp)
    7588:	00f41623          	sh	a5,12(s0)
    758c:	00812403          	lw	s0,8(sp)
    7590:	01010113          	add	sp,sp,16
    7594:	00008067          	ret

00007598 <__sclose>:
    7598:	00e59583          	lh	a1,14(a1)
    759c:	68c0006f          	j	7c28 <_close_r>

000075a0 <__swbuf_r>:
    75a0:	fe010113          	add	sp,sp,-32
    75a4:	00812c23          	sw	s0,24(sp)
    75a8:	00912a23          	sw	s1,20(sp)
    75ac:	01212823          	sw	s2,16(sp)
    75b0:	00112e23          	sw	ra,28(sp)
    75b4:	00050913          	mv	s2,a0
    75b8:	00058493          	mv	s1,a1
    75bc:	00060413          	mv	s0,a2
    75c0:	00050663          	beqz	a0,75cc <__swbuf_r+0x2c>
    75c4:	03452783          	lw	a5,52(a0)
    75c8:	16078063          	beqz	a5,7728 <__swbuf_r+0x188>
    75cc:	01842783          	lw	a5,24(s0)
    75d0:	00c41703          	lh	a4,12(s0)
    75d4:	00f42423          	sw	a5,8(s0)
    75d8:	00877793          	and	a5,a4,8
    75dc:	08078063          	beqz	a5,765c <__swbuf_r+0xbc>
    75e0:	01042783          	lw	a5,16(s0)
    75e4:	06078c63          	beqz	a5,765c <__swbuf_r+0xbc>
    75e8:	01312623          	sw	s3,12(sp)
    75ec:	01271693          	sll	a3,a4,0x12
    75f0:	0ff4f993          	zext.b	s3,s1
    75f4:	0ff4f493          	zext.b	s1,s1
    75f8:	0806d863          	bgez	a3,7688 <__swbuf_r+0xe8>
    75fc:	00042703          	lw	a4,0(s0)
    7600:	01442683          	lw	a3,20(s0)
    7604:	40f707b3          	sub	a5,a4,a5
    7608:	0ad7d863          	bge	a5,a3,76b8 <__swbuf_r+0x118>
    760c:	00842683          	lw	a3,8(s0)
    7610:	00170613          	add	a2,a4,1
    7614:	00c42023          	sw	a2,0(s0)
    7618:	fff68693          	add	a3,a3,-1
    761c:	00d42423          	sw	a3,8(s0)
    7620:	01370023          	sb	s3,0(a4)
    7624:	01442703          	lw	a4,20(s0)
    7628:	00178793          	add	a5,a5,1
    762c:	0cf70263          	beq	a4,a5,76f0 <__swbuf_r+0x150>
    7630:	00c45783          	lhu	a5,12(s0)
    7634:	0017f793          	and	a5,a5,1
    7638:	0c079a63          	bnez	a5,770c <__swbuf_r+0x16c>
    763c:	00c12983          	lw	s3,12(sp)
    7640:	01c12083          	lw	ra,28(sp)
    7644:	01812403          	lw	s0,24(sp)
    7648:	01012903          	lw	s2,16(sp)
    764c:	00048513          	mv	a0,s1
    7650:	01412483          	lw	s1,20(sp)
    7654:	02010113          	add	sp,sp,32
    7658:	00008067          	ret
    765c:	00040593          	mv	a1,s0
    7660:	00090513          	mv	a0,s2
    7664:	0cc000ef          	jal	7730 <__swsetup_r>
    7668:	08051e63          	bnez	a0,7704 <__swbuf_r+0x164>
    766c:	00c41703          	lh	a4,12(s0)
    7670:	01312623          	sw	s3,12(sp)
    7674:	01042783          	lw	a5,16(s0)
    7678:	01271693          	sll	a3,a4,0x12
    767c:	0ff4f993          	zext.b	s3,s1
    7680:	0ff4f493          	zext.b	s1,s1
    7684:	f606cce3          	bltz	a3,75fc <__swbuf_r+0x5c>
    7688:	06442683          	lw	a3,100(s0)
    768c:	ffffe637          	lui	a2,0xffffe
    7690:	000025b7          	lui	a1,0x2
    7694:	00b76733          	or	a4,a4,a1
    7698:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    769c:	00c6f6b3          	and	a3,a3,a2
    76a0:	00e41623          	sh	a4,12(s0)
    76a4:	00042703          	lw	a4,0(s0)
    76a8:	06d42223          	sw	a3,100(s0)
    76ac:	01442683          	lw	a3,20(s0)
    76b0:	40f707b3          	sub	a5,a4,a5
    76b4:	f4d7cce3          	blt	a5,a3,760c <__swbuf_r+0x6c>
    76b8:	00040593          	mv	a1,s0
    76bc:	00090513          	mv	a0,s2
    76c0:	b34ff0ef          	jal	69f4 <_fflush_r>
    76c4:	02051e63          	bnez	a0,7700 <__swbuf_r+0x160>
    76c8:	00042703          	lw	a4,0(s0)
    76cc:	00842683          	lw	a3,8(s0)
    76d0:	00100793          	li	a5,1
    76d4:	00170613          	add	a2,a4,1
    76d8:	fff68693          	add	a3,a3,-1
    76dc:	00c42023          	sw	a2,0(s0)
    76e0:	00d42423          	sw	a3,8(s0)
    76e4:	01370023          	sb	s3,0(a4)
    76e8:	01442703          	lw	a4,20(s0)
    76ec:	f4f712e3          	bne	a4,a5,7630 <__swbuf_r+0x90>
    76f0:	00040593          	mv	a1,s0
    76f4:	00090513          	mv	a0,s2
    76f8:	afcff0ef          	jal	69f4 <_fflush_r>
    76fc:	f40500e3          	beqz	a0,763c <__swbuf_r+0x9c>
    7700:	00c12983          	lw	s3,12(sp)
    7704:	fff00493          	li	s1,-1
    7708:	f39ff06f          	j	7640 <__swbuf_r+0xa0>
    770c:	00a00793          	li	a5,10
    7710:	f2f496e3          	bne	s1,a5,763c <__swbuf_r+0x9c>
    7714:	00040593          	mv	a1,s0
    7718:	00090513          	mv	a0,s2
    771c:	ad8ff0ef          	jal	69f4 <_fflush_r>
    7720:	f0050ee3          	beqz	a0,763c <__swbuf_r+0x9c>
    7724:	fddff06f          	j	7700 <__swbuf_r+0x160>
    7728:	dc8ff0ef          	jal	6cf0 <__sinit>
    772c:	ea1ff06f          	j	75cc <__swbuf_r+0x2c>

00007730 <__swsetup_r>:
    7730:	ff010113          	add	sp,sp,-16
    7734:	00812423          	sw	s0,8(sp)
    7738:	00912223          	sw	s1,4(sp)
    773c:	00112623          	sw	ra,12(sp)
    7740:	7fff9797          	auipc	a5,0x7fff9
    7744:	fd07a783          	lw	a5,-48(a5) # 80000710 <_impure_ptr>
    7748:	00050493          	mv	s1,a0
    774c:	00058413          	mv	s0,a1
    7750:	00078663          	beqz	a5,775c <__swsetup_r+0x2c>
    7754:	0347a703          	lw	a4,52(a5)
    7758:	0e070c63          	beqz	a4,7850 <__swsetup_r+0x120>
    775c:	00c41783          	lh	a5,12(s0)
    7760:	0087f713          	and	a4,a5,8
    7764:	06070a63          	beqz	a4,77d8 <__swsetup_r+0xa8>
    7768:	01042703          	lw	a4,16(s0)
    776c:	08070663          	beqz	a4,77f8 <__swsetup_r+0xc8>
    7770:	0017f693          	and	a3,a5,1
    7774:	02068863          	beqz	a3,77a4 <__swsetup_r+0x74>
    7778:	01442683          	lw	a3,20(s0)
    777c:	00042423          	sw	zero,8(s0)
    7780:	00000513          	li	a0,0
    7784:	40d006b3          	neg	a3,a3
    7788:	00d42c23          	sw	a3,24(s0)
    778c:	02070a63          	beqz	a4,77c0 <__swsetup_r+0x90>
    7790:	00c12083          	lw	ra,12(sp)
    7794:	00812403          	lw	s0,8(sp)
    7798:	00412483          	lw	s1,4(sp)
    779c:	01010113          	add	sp,sp,16
    77a0:	00008067          	ret
    77a4:	0027f693          	and	a3,a5,2
    77a8:	00000613          	li	a2,0
    77ac:	00069463          	bnez	a3,77b4 <__swsetup_r+0x84>
    77b0:	01442603          	lw	a2,20(s0)
    77b4:	00c42423          	sw	a2,8(s0)
    77b8:	00000513          	li	a0,0
    77bc:	fc071ae3          	bnez	a4,7790 <__swsetup_r+0x60>
    77c0:	0807f713          	and	a4,a5,128
    77c4:	fc0706e3          	beqz	a4,7790 <__swsetup_r+0x60>
    77c8:	0407e793          	or	a5,a5,64
    77cc:	00f41623          	sh	a5,12(s0)
    77d0:	fff00513          	li	a0,-1
    77d4:	fbdff06f          	j	7790 <__swsetup_r+0x60>
    77d8:	0107f713          	and	a4,a5,16
    77dc:	08070063          	beqz	a4,785c <__swsetup_r+0x12c>
    77e0:	0047f713          	and	a4,a5,4
    77e4:	02071c63          	bnez	a4,781c <__swsetup_r+0xec>
    77e8:	01042703          	lw	a4,16(s0)
    77ec:	0087e793          	or	a5,a5,8
    77f0:	00f41623          	sh	a5,12(s0)
    77f4:	f6071ee3          	bnez	a4,7770 <__swsetup_r+0x40>
    77f8:	2807f693          	and	a3,a5,640
    77fc:	20000613          	li	a2,512
    7800:	f6c688e3          	beq	a3,a2,7770 <__swsetup_r+0x40>
    7804:	00040593          	mv	a1,s0
    7808:	00048513          	mv	a0,s1
    780c:	6cc030ef          	jal	aed8 <__smakebuf_r>
    7810:	00c41783          	lh	a5,12(s0)
    7814:	01042703          	lw	a4,16(s0)
    7818:	f59ff06f          	j	7770 <__swsetup_r+0x40>
    781c:	03042583          	lw	a1,48(s0)
    7820:	00058e63          	beqz	a1,783c <__swsetup_r+0x10c>
    7824:	04040713          	add	a4,s0,64
    7828:	00e58863          	beq	a1,a4,7838 <__swsetup_r+0x108>
    782c:	00048513          	mv	a0,s1
    7830:	cf1f90ef          	jal	1520 <_free_r>
    7834:	00c41783          	lh	a5,12(s0)
    7838:	02042823          	sw	zero,48(s0)
    783c:	01042703          	lw	a4,16(s0)
    7840:	fdb7f793          	and	a5,a5,-37
    7844:	00042223          	sw	zero,4(s0)
    7848:	00e42023          	sw	a4,0(s0)
    784c:	fa1ff06f          	j	77ec <__swsetup_r+0xbc>
    7850:	00078513          	mv	a0,a5
    7854:	c9cff0ef          	jal	6cf0 <__sinit>
    7858:	f05ff06f          	j	775c <__swsetup_r+0x2c>
    785c:	00900713          	li	a4,9
    7860:	00e4a023          	sw	a4,0(s1)
    7864:	0407e793          	or	a5,a5,64
    7868:	00f41623          	sh	a5,12(s0)
    786c:	fff00513          	li	a0,-1
    7870:	f21ff06f          	j	7790 <__swsetup_r+0x60>

00007874 <__fputwc>:
    7874:	fc010113          	add	sp,sp,-64
    7878:	02812c23          	sw	s0,56(sp)
    787c:	03412423          	sw	s4,40(sp)
    7880:	03512223          	sw	s5,36(sp)
    7884:	02112e23          	sw	ra,60(sp)
    7888:	02912a23          	sw	s1,52(sp)
    788c:	03312623          	sw	s3,44(sp)
    7890:	00050a13          	mv	s4,a0
    7894:	00058a93          	mv	s5,a1
    7898:	00060413          	mv	s0,a2
    789c:	374000ef          	jal	7c10 <__locale_mb_cur_max>
    78a0:	00100793          	li	a5,1
    78a4:	02f51663          	bne	a0,a5,78d0 <__fputwc+0x5c>
    78a8:	fffa8793          	add	a5,s5,-1
    78ac:	0fe00713          	li	a4,254
    78b0:	02f76063          	bltu	a4,a5,78d0 <__fputwc+0x5c>
    78b4:	03212823          	sw	s2,48(sp)
    78b8:	03612023          	sw	s6,32(sp)
    78bc:	01712e23          	sw	s7,28(sp)
    78c0:	01510423          	sb	s5,8(sp)
    78c4:	00100993          	li	s3,1
    78c8:	00810493          	add	s1,sp,8
    78cc:	0380006f          	j	7904 <__fputwc+0x90>
    78d0:	00810493          	add	s1,sp,8
    78d4:	05c40693          	add	a3,s0,92
    78d8:	000a8613          	mv	a2,s5
    78dc:	00048593          	mv	a1,s1
    78e0:	000a0513          	mv	a0,s4
    78e4:	3e8030ef          	jal	accc <_wcrtomb_r>
    78e8:	fff00793          	li	a5,-1
    78ec:	00050993          	mv	s3,a0
    78f0:	0cf50a63          	beq	a0,a5,79c4 <__fputwc+0x150>
    78f4:	0a050663          	beqz	a0,79a0 <__fputwc+0x12c>
    78f8:	03212823          	sw	s2,48(sp)
    78fc:	03612023          	sw	s6,32(sp)
    7900:	01712e23          	sw	s7,28(sp)
    7904:	00000913          	li	s2,0
    7908:	fff00b13          	li	s6,-1
    790c:	00a00b93          	li	s7,10
    7910:	0200006f          	j	7930 <__fputwc+0xbc>
    7914:	00042783          	lw	a5,0(s0)
    7918:	00178693          	add	a3,a5,1
    791c:	00d42023          	sw	a3,0(s0)
    7920:	00e78023          	sb	a4,0(a5)
    7924:	00190913          	add	s2,s2,1
    7928:	00148493          	add	s1,s1,1
    792c:	07397463          	bgeu	s2,s3,7994 <__fputwc+0x120>
    7930:	00842783          	lw	a5,8(s0)
    7934:	0004c703          	lbu	a4,0(s1)
    7938:	fff78793          	add	a5,a5,-1
    793c:	00f42423          	sw	a5,8(s0)
    7940:	fc07dae3          	bgez	a5,7914 <__fputwc+0xa0>
    7944:	01842683          	lw	a3,24(s0)
    7948:	00040613          	mv	a2,s0
    794c:	00070593          	mv	a1,a4
    7950:	000a0513          	mv	a0,s4
    7954:	00d7c463          	blt	a5,a3,795c <__fputwc+0xe8>
    7958:	fb771ee3          	bne	a4,s7,7914 <__fputwc+0xa0>
    795c:	c45ff0ef          	jal	75a0 <__swbuf_r>
    7960:	fd6512e3          	bne	a0,s6,7924 <__fputwc+0xb0>
    7964:	03012903          	lw	s2,48(sp)
    7968:	02012b03          	lw	s6,32(sp)
    796c:	01c12b83          	lw	s7,28(sp)
    7970:	03c12083          	lw	ra,60(sp)
    7974:	03812403          	lw	s0,56(sp)
    7978:	03412483          	lw	s1,52(sp)
    797c:	02c12983          	lw	s3,44(sp)
    7980:	02812a03          	lw	s4,40(sp)
    7984:	02412a83          	lw	s5,36(sp)
    7988:	fff00513          	li	a0,-1
    798c:	04010113          	add	sp,sp,64
    7990:	00008067          	ret
    7994:	03012903          	lw	s2,48(sp)
    7998:	02012b03          	lw	s6,32(sp)
    799c:	01c12b83          	lw	s7,28(sp)
    79a0:	03c12083          	lw	ra,60(sp)
    79a4:	03812403          	lw	s0,56(sp)
    79a8:	03412483          	lw	s1,52(sp)
    79ac:	02c12983          	lw	s3,44(sp)
    79b0:	02812a03          	lw	s4,40(sp)
    79b4:	000a8513          	mv	a0,s5
    79b8:	02412a83          	lw	s5,36(sp)
    79bc:	04010113          	add	sp,sp,64
    79c0:	00008067          	ret
    79c4:	00c45783          	lhu	a5,12(s0)
    79c8:	0407e793          	or	a5,a5,64
    79cc:	00f41623          	sh	a5,12(s0)
    79d0:	fa1ff06f          	j	7970 <__fputwc+0xfc>

000079d4 <_fputwc_r>:
    79d4:	06462783          	lw	a5,100(a2)
    79d8:	fe010113          	add	sp,sp,-32
    79dc:	00812c23          	sw	s0,24(sp)
    79e0:	00912a23          	sw	s1,20(sp)
    79e4:	0017f713          	and	a4,a5,1
    79e8:	00112e23          	sw	ra,28(sp)
    79ec:	00c61783          	lh	a5,12(a2)
    79f0:	00060413          	mv	s0,a2
    79f4:	00050493          	mv	s1,a0
    79f8:	00071663          	bnez	a4,7a04 <_fputwc_r+0x30>
    79fc:	2007f713          	and	a4,a5,512
    7a00:	08070463          	beqz	a4,7a88 <_fputwc_r+0xb4>
    7a04:	01279713          	sll	a4,a5,0x12
    7a08:	02074063          	bltz	a4,7a28 <_fputwc_r+0x54>
    7a0c:	06442703          	lw	a4,100(s0)
    7a10:	000026b7          	lui	a3,0x2
    7a14:	00d7e7b3          	or	a5,a5,a3
    7a18:	000026b7          	lui	a3,0x2
    7a1c:	00d76733          	or	a4,a4,a3
    7a20:	00f41623          	sh	a5,12(s0)
    7a24:	06e42223          	sw	a4,100(s0)
    7a28:	00048513          	mv	a0,s1
    7a2c:	00040613          	mv	a2,s0
    7a30:	e45ff0ef          	jal	7874 <__fputwc>
    7a34:	06442783          	lw	a5,100(s0)
    7a38:	00050493          	mv	s1,a0
    7a3c:	0017f793          	and	a5,a5,1
    7a40:	00079863          	bnez	a5,7a50 <_fputwc_r+0x7c>
    7a44:	00c45783          	lhu	a5,12(s0)
    7a48:	2007f793          	and	a5,a5,512
    7a4c:	00078e63          	beqz	a5,7a68 <_fputwc_r+0x94>
    7a50:	01c12083          	lw	ra,28(sp)
    7a54:	01812403          	lw	s0,24(sp)
    7a58:	00048513          	mv	a0,s1
    7a5c:	01412483          	lw	s1,20(sp)
    7a60:	02010113          	add	sp,sp,32
    7a64:	00008067          	ret
    7a68:	05842503          	lw	a0,88(s0)
    7a6c:	e60f90ef          	jal	10cc <__retarget_lock_release_recursive>
    7a70:	01c12083          	lw	ra,28(sp)
    7a74:	01812403          	lw	s0,24(sp)
    7a78:	00048513          	mv	a0,s1
    7a7c:	01412483          	lw	s1,20(sp)
    7a80:	02010113          	add	sp,sp,32
    7a84:	00008067          	ret
    7a88:	05862503          	lw	a0,88(a2)
    7a8c:	00b12623          	sw	a1,12(sp)
    7a90:	e38f90ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    7a94:	00c41783          	lh	a5,12(s0)
    7a98:	00c12583          	lw	a1,12(sp)
    7a9c:	f69ff06f          	j	7a04 <_fputwc_r+0x30>

00007aa0 <memchr>:
    7aa0:	00357793          	and	a5,a0,3
    7aa4:	0ff5f693          	zext.b	a3,a1
    7aa8:	02078a63          	beqz	a5,7adc <memchr+0x3c>
    7aac:	fff60793          	add	a5,a2,-1
    7ab0:	02060e63          	beqz	a2,7aec <memchr+0x4c>
    7ab4:	fff00613          	li	a2,-1
    7ab8:	0180006f          	j	7ad0 <memchr+0x30>
    7abc:	00150513          	add	a0,a0,1
    7ac0:	00357713          	and	a4,a0,3
    7ac4:	00070e63          	beqz	a4,7ae0 <memchr+0x40>
    7ac8:	fff78793          	add	a5,a5,-1
    7acc:	02c78063          	beq	a5,a2,7aec <memchr+0x4c>
    7ad0:	00054703          	lbu	a4,0(a0)
    7ad4:	fed714e3          	bne	a4,a3,7abc <memchr+0x1c>
    7ad8:	00008067          	ret
    7adc:	00060793          	mv	a5,a2
    7ae0:	00300713          	li	a4,3
    7ae4:	00f76863          	bltu	a4,a5,7af4 <memchr+0x54>
    7ae8:	06079063          	bnez	a5,7b48 <memchr+0xa8>
    7aec:	00000513          	li	a0,0
    7af0:	00008067          	ret
    7af4:	0ff5f593          	zext.b	a1,a1
    7af8:	00859713          	sll	a4,a1,0x8
    7afc:	00b705b3          	add	a1,a4,a1
    7b00:	01059713          	sll	a4,a1,0x10
    7b04:	feff08b7          	lui	a7,0xfeff0
    7b08:	80808837          	lui	a6,0x80808
    7b0c:	00e585b3          	add	a1,a1,a4
    7b10:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7b14:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7b18:	00300313          	li	t1,3
    7b1c:	0100006f          	j	7b2c <memchr+0x8c>
    7b20:	ffc78793          	add	a5,a5,-4
    7b24:	00450513          	add	a0,a0,4
    7b28:	fcf370e3          	bgeu	t1,a5,7ae8 <memchr+0x48>
    7b2c:	00052703          	lw	a4,0(a0)
    7b30:	00e5c733          	xor	a4,a1,a4
    7b34:	01170633          	add	a2,a4,a7
    7b38:	fff74713          	not	a4,a4
    7b3c:	00e67733          	and	a4,a2,a4
    7b40:	01077733          	and	a4,a4,a6
    7b44:	fc070ee3          	beqz	a4,7b20 <memchr+0x80>
    7b48:	00f507b3          	add	a5,a0,a5
    7b4c:	00c0006f          	j	7b58 <memchr+0xb8>
    7b50:	00150513          	add	a0,a0,1
    7b54:	f8f50ce3          	beq	a0,a5,7aec <memchr+0x4c>
    7b58:	00054703          	lbu	a4,0(a0)
    7b5c:	fed71ae3          	bne	a4,a3,7b50 <memchr+0xb0>
    7b60:	00008067          	ret

00007b64 <strncpy>:
    7b64:	00a5e7b3          	or	a5,a1,a0
    7b68:	0037f793          	and	a5,a5,3
    7b6c:	00079663          	bnez	a5,7b78 <strncpy+0x14>
    7b70:	00300793          	li	a5,3
    7b74:	04c7e663          	bltu	a5,a2,7bc0 <strncpy+0x5c>
    7b78:	00050713          	mv	a4,a0
    7b7c:	01c0006f          	j	7b98 <strncpy+0x34>
    7b80:	fff5c683          	lbu	a3,-1(a1) # 1fff <_malloc_r+0x7d3>
    7b84:	fff60813          	add	a6,a2,-1
    7b88:	fed78fa3          	sb	a3,-1(a5)
    7b8c:	00068e63          	beqz	a3,7ba8 <strncpy+0x44>
    7b90:	00078713          	mv	a4,a5
    7b94:	00080613          	mv	a2,a6
    7b98:	00158593          	add	a1,a1,1
    7b9c:	00170793          	add	a5,a4,1
    7ba0:	fe0610e3          	bnez	a2,7b80 <strncpy+0x1c>
    7ba4:	00008067          	ret
    7ba8:	00c70733          	add	a4,a4,a2
    7bac:	06080063          	beqz	a6,7c0c <strncpy+0xa8>
    7bb0:	00178793          	add	a5,a5,1
    7bb4:	fe078fa3          	sb	zero,-1(a5)
    7bb8:	fee79ce3          	bne	a5,a4,7bb0 <strncpy+0x4c>
    7bbc:	00008067          	ret
    7bc0:	feff0337          	lui	t1,0xfeff0
    7bc4:	808088b7          	lui	a7,0x80808
    7bc8:	00050713          	mv	a4,a0
    7bcc:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7bd0:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7bd4:	00300e13          	li	t3,3
    7bd8:	0180006f          	j	7bf0 <strncpy+0x8c>
    7bdc:	00d72023          	sw	a3,0(a4)
    7be0:	ffc60613          	add	a2,a2,-4
    7be4:	00470713          	add	a4,a4,4
    7be8:	00458593          	add	a1,a1,4
    7bec:	face76e3          	bgeu	t3,a2,7b98 <strncpy+0x34>
    7bf0:	0005a683          	lw	a3,0(a1)
    7bf4:	006687b3          	add	a5,a3,t1
    7bf8:	fff6c813          	not	a6,a3
    7bfc:	0107f7b3          	and	a5,a5,a6
    7c00:	0117f7b3          	and	a5,a5,a7
    7c04:	fc078ce3          	beqz	a5,7bdc <strncpy+0x78>
    7c08:	f91ff06f          	j	7b98 <strncpy+0x34>
    7c0c:	00008067          	ret

00007c10 <__locale_mb_cur_max>:
    7c10:	7fff9517          	auipc	a0,0x7fff9
    7c14:	a4c54503          	lbu	a0,-1460(a0) # 8000065c <__global_locale+0x128>
    7c18:	00008067          	ret

00007c1c <_localeconv_r>:
    7c1c:	7fff9517          	auipc	a0,0x7fff9
    7c20:	a0850513          	add	a0,a0,-1528 # 80000624 <__global_locale+0xf0>
    7c24:	00008067          	ret

00007c28 <_close_r>:
    7c28:	ff010113          	add	sp,sp,-16
    7c2c:	00812423          	sw	s0,8(sp)
    7c30:	00050413          	mv	s0,a0
    7c34:	00058513          	mv	a0,a1
    7c38:	7fff9797          	auipc	a5,0x7fff9
    7c3c:	ae07a423          	sw	zero,-1304(a5) # 80000720 <errno>
    7c40:	00112623          	sw	ra,12(sp)
    7c44:	85cf90ef          	jal	ca0 <_close>
    7c48:	fff00793          	li	a5,-1
    7c4c:	00f50a63          	beq	a0,a5,7c60 <_close_r+0x38>
    7c50:	00c12083          	lw	ra,12(sp)
    7c54:	00812403          	lw	s0,8(sp)
    7c58:	01010113          	add	sp,sp,16
    7c5c:	00008067          	ret
    7c60:	7fff9797          	auipc	a5,0x7fff9
    7c64:	ac07a783          	lw	a5,-1344(a5) # 80000720 <errno>
    7c68:	fe0784e3          	beqz	a5,7c50 <_close_r+0x28>
    7c6c:	00c12083          	lw	ra,12(sp)
    7c70:	00f42023          	sw	a5,0(s0)
    7c74:	00812403          	lw	s0,8(sp)
    7c78:	01010113          	add	sp,sp,16
    7c7c:	00008067          	ret

00007c80 <_lseek_r>:
    7c80:	ff010113          	add	sp,sp,-16
    7c84:	00058713          	mv	a4,a1
    7c88:	00812423          	sw	s0,8(sp)
    7c8c:	00060593          	mv	a1,a2
    7c90:	00050413          	mv	s0,a0
    7c94:	00068613          	mv	a2,a3
    7c98:	00070513          	mv	a0,a4
    7c9c:	7fff9797          	auipc	a5,0x7fff9
    7ca0:	a807a223          	sw	zero,-1404(a5) # 80000720 <errno>
    7ca4:	00112623          	sw	ra,12(sp)
    7ca8:	834f90ef          	jal	cdc <_lseek>
    7cac:	fff00793          	li	a5,-1
    7cb0:	00f50a63          	beq	a0,a5,7cc4 <_lseek_r+0x44>
    7cb4:	00c12083          	lw	ra,12(sp)
    7cb8:	00812403          	lw	s0,8(sp)
    7cbc:	01010113          	add	sp,sp,16
    7cc0:	00008067          	ret
    7cc4:	7fff9797          	auipc	a5,0x7fff9
    7cc8:	a5c7a783          	lw	a5,-1444(a5) # 80000720 <errno>
    7ccc:	fe0784e3          	beqz	a5,7cb4 <_lseek_r+0x34>
    7cd0:	00c12083          	lw	ra,12(sp)
    7cd4:	00f42023          	sw	a5,0(s0)
    7cd8:	00812403          	lw	s0,8(sp)
    7cdc:	01010113          	add	sp,sp,16
    7ce0:	00008067          	ret

00007ce4 <_read_r>:
    7ce4:	ff010113          	add	sp,sp,-16
    7ce8:	00058713          	mv	a4,a1
    7cec:	00812423          	sw	s0,8(sp)
    7cf0:	00060593          	mv	a1,a2
    7cf4:	00050413          	mv	s0,a0
    7cf8:	00068613          	mv	a2,a3
    7cfc:	00070513          	mv	a0,a4
    7d00:	7fff9797          	auipc	a5,0x7fff9
    7d04:	a207a023          	sw	zero,-1504(a5) # 80000720 <errno>
    7d08:	00112623          	sw	ra,12(sp)
    7d0c:	fd9f80ef          	jal	ce4 <_read>
    7d10:	fff00793          	li	a5,-1
    7d14:	00f50a63          	beq	a0,a5,7d28 <_read_r+0x44>
    7d18:	00c12083          	lw	ra,12(sp)
    7d1c:	00812403          	lw	s0,8(sp)
    7d20:	01010113          	add	sp,sp,16
    7d24:	00008067          	ret
    7d28:	7fff9797          	auipc	a5,0x7fff9
    7d2c:	9f87a783          	lw	a5,-1544(a5) # 80000720 <errno>
    7d30:	fe0784e3          	beqz	a5,7d18 <_read_r+0x34>
    7d34:	00c12083          	lw	ra,12(sp)
    7d38:	00f42023          	sw	a5,0(s0)
    7d3c:	00812403          	lw	s0,8(sp)
    7d40:	01010113          	add	sp,sp,16
    7d44:	00008067          	ret

00007d48 <_sbrk_r>:
    7d48:	ff010113          	add	sp,sp,-16
    7d4c:	00812423          	sw	s0,8(sp)
    7d50:	00050413          	mv	s0,a0
    7d54:	00058513          	mv	a0,a1
    7d58:	7fff9797          	auipc	a5,0x7fff9
    7d5c:	9c07a423          	sw	zero,-1592(a5) # 80000720 <errno>
    7d60:	00112623          	sw	ra,12(sp)
    7d64:	900f90ef          	jal	e64 <_sbrk>
    7d68:	fff00793          	li	a5,-1
    7d6c:	00f50a63          	beq	a0,a5,7d80 <_sbrk_r+0x38>
    7d70:	00c12083          	lw	ra,12(sp)
    7d74:	00812403          	lw	s0,8(sp)
    7d78:	01010113          	add	sp,sp,16
    7d7c:	00008067          	ret
    7d80:	7fff9797          	auipc	a5,0x7fff9
    7d84:	9a07a783          	lw	a5,-1632(a5) # 80000720 <errno>
    7d88:	fe0784e3          	beqz	a5,7d70 <_sbrk_r+0x28>
    7d8c:	00c12083          	lw	ra,12(sp)
    7d90:	00f42023          	sw	a5,0(s0)
    7d94:	00812403          	lw	s0,8(sp)
    7d98:	01010113          	add	sp,sp,16
    7d9c:	00008067          	ret

00007da0 <_write_r>:
    7da0:	ff010113          	add	sp,sp,-16
    7da4:	00058713          	mv	a4,a1
    7da8:	00812423          	sw	s0,8(sp)
    7dac:	00060593          	mv	a1,a2
    7db0:	00050413          	mv	s0,a0
    7db4:	00068613          	mv	a2,a3
    7db8:	00070513          	mv	a0,a4
    7dbc:	7fff9797          	auipc	a5,0x7fff9
    7dc0:	9607a223          	sw	zero,-1692(a5) # 80000720 <errno>
    7dc4:	00112623          	sw	ra,12(sp)
    7dc8:	ff9f80ef          	jal	dc0 <_write>
    7dcc:	fff00793          	li	a5,-1
    7dd0:	00f50a63          	beq	a0,a5,7de4 <_write_r+0x44>
    7dd4:	00c12083          	lw	ra,12(sp)
    7dd8:	00812403          	lw	s0,8(sp)
    7ddc:	01010113          	add	sp,sp,16
    7de0:	00008067          	ret
    7de4:	7fff9797          	auipc	a5,0x7fff9
    7de8:	93c7a783          	lw	a5,-1732(a5) # 80000720 <errno>
    7dec:	fe0784e3          	beqz	a5,7dd4 <_write_r+0x34>
    7df0:	00c12083          	lw	ra,12(sp)
    7df4:	00f42023          	sw	a5,0(s0)
    7df8:	00812403          	lw	s0,8(sp)
    7dfc:	01010113          	add	sp,sp,16
    7e00:	00008067          	ret

00007e04 <memmove>:
    7e04:	02a5f663          	bgeu	a1,a0,7e30 <memmove+0x2c>
    7e08:	00c58733          	add	a4,a1,a2
    7e0c:	02e57263          	bgeu	a0,a4,7e30 <memmove+0x2c>
    7e10:	00c507b3          	add	a5,a0,a2
    7e14:	04060663          	beqz	a2,7e60 <memmove+0x5c>
    7e18:	fff74683          	lbu	a3,-1(a4)
    7e1c:	fff78793          	add	a5,a5,-1
    7e20:	fff70713          	add	a4,a4,-1
    7e24:	00d78023          	sb	a3,0(a5)
    7e28:	fef518e3          	bne	a0,a5,7e18 <memmove+0x14>
    7e2c:	00008067          	ret
    7e30:	00f00793          	li	a5,15
    7e34:	02c7e863          	bltu	a5,a2,7e64 <memmove+0x60>
    7e38:	00050793          	mv	a5,a0
    7e3c:	fff60693          	add	a3,a2,-1
    7e40:	0c060263          	beqz	a2,7f04 <memmove+0x100>
    7e44:	00168693          	add	a3,a3,1 # 2001 <_malloc_r+0x7d5>
    7e48:	00d786b3          	add	a3,a5,a3
    7e4c:	0005c703          	lbu	a4,0(a1)
    7e50:	00178793          	add	a5,a5,1
    7e54:	00158593          	add	a1,a1,1
    7e58:	fee78fa3          	sb	a4,-1(a5)
    7e5c:	fed798e3          	bne	a5,a3,7e4c <memmove+0x48>
    7e60:	00008067          	ret
    7e64:	00b567b3          	or	a5,a0,a1
    7e68:	0037f793          	and	a5,a5,3
    7e6c:	08079663          	bnez	a5,7ef8 <memmove+0xf4>
    7e70:	ff060893          	add	a7,a2,-16
    7e74:	ff08f893          	and	a7,a7,-16
    7e78:	01088893          	add	a7,a7,16
    7e7c:	011506b3          	add	a3,a0,a7
    7e80:	00058713          	mv	a4,a1
    7e84:	00050793          	mv	a5,a0
    7e88:	00072803          	lw	a6,0(a4)
    7e8c:	01070713          	add	a4,a4,16
    7e90:	01078793          	add	a5,a5,16
    7e94:	ff07a823          	sw	a6,-16(a5)
    7e98:	ff472803          	lw	a6,-12(a4)
    7e9c:	ff07aa23          	sw	a6,-12(a5)
    7ea0:	ff872803          	lw	a6,-8(a4)
    7ea4:	ff07ac23          	sw	a6,-8(a5)
    7ea8:	ffc72803          	lw	a6,-4(a4)
    7eac:	ff07ae23          	sw	a6,-4(a5)
    7eb0:	fcd79ce3          	bne	a5,a3,7e88 <memmove+0x84>
    7eb4:	00c67813          	and	a6,a2,12
    7eb8:	011585b3          	add	a1,a1,a7
    7ebc:	00f67713          	and	a4,a2,15
    7ec0:	04080463          	beqz	a6,7f08 <memmove+0x104>
    7ec4:	ffc70813          	add	a6,a4,-4
    7ec8:	ffc87813          	and	a6,a6,-4
    7ecc:	00480813          	add	a6,a6,4
    7ed0:	010687b3          	add	a5,a3,a6
    7ed4:	00058713          	mv	a4,a1
    7ed8:	00072883          	lw	a7,0(a4)
    7edc:	00468693          	add	a3,a3,4
    7ee0:	00470713          	add	a4,a4,4
    7ee4:	ff16ae23          	sw	a7,-4(a3)
    7ee8:	fef698e3          	bne	a3,a5,7ed8 <memmove+0xd4>
    7eec:	00367613          	and	a2,a2,3
    7ef0:	010585b3          	add	a1,a1,a6
    7ef4:	f49ff06f          	j	7e3c <memmove+0x38>
    7ef8:	fff60693          	add	a3,a2,-1
    7efc:	00050793          	mv	a5,a0
    7f00:	f45ff06f          	j	7e44 <memmove+0x40>
    7f04:	00008067          	ret
    7f08:	00070613          	mv	a2,a4
    7f0c:	f31ff06f          	j	7e3c <memmove+0x38>

00007f10 <frexp>:
    7f10:	ff010113          	add	sp,sp,-16
    7f14:	00912223          	sw	s1,4(sp)
    7f18:	800004b7          	lui	s1,0x80000
    7f1c:	00812423          	sw	s0,8(sp)
    7f20:	00112623          	sw	ra,12(sp)
    7f24:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7f28:	00060413          	mv	s0,a2
    7f2c:	00062023          	sw	zero,0(a2)
    7f30:	00b4f6b3          	and	a3,s1,a1
    7f34:	7ff00637          	lui	a2,0x7ff00
    7f38:	00058793          	mv	a5,a1
    7f3c:	00050713          	mv	a4,a0
    7f40:	04c6f063          	bgeu	a3,a2,7f80 <frexp+0x70>
    7f44:	00a6e633          	or	a2,a3,a0
    7f48:	02060c63          	beqz	a2,7f80 <frexp+0x70>
    7f4c:	0145d613          	srl	a2,a1,0x14
    7f50:	7ff67613          	and	a2,a2,2047
    7f54:	04060463          	beqz	a2,7f9c <frexp+0x8c>
    7f58:	00000593          	li	a1,0
    7f5c:	80100637          	lui	a2,0x80100
    7f60:	4146d693          	sra	a3,a3,0x14
    7f64:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7f68:	c0268693          	add	a3,a3,-1022
    7f6c:	00c7f7b3          	and	a5,a5,a2
    7f70:	00b686b3          	add	a3,a3,a1
    7f74:	3fe00637          	lui	a2,0x3fe00
    7f78:	00c7e7b3          	or	a5,a5,a2
    7f7c:	00d42023          	sw	a3,0(s0)
    7f80:	00c12083          	lw	ra,12(sp)
    7f84:	00812403          	lw	s0,8(sp)
    7f88:	00412483          	lw	s1,4(sp)
    7f8c:	00070513          	mv	a0,a4
    7f90:	00078593          	mv	a1,a5
    7f94:	01010113          	add	sp,sp,16
    7f98:	00008067          	ret
    7f9c:	7fff8797          	auipc	a5,0x7fff8
    7fa0:	72c78793          	add	a5,a5,1836 # 800006c8 <__global_locale+0x194>
    7fa4:	0047a683          	lw	a3,4(a5)
    7fa8:	0007a603          	lw	a2,0(a5)
    7fac:	009050ef          	jal	d7b4 <__muldf3>
    7fb0:	00058793          	mv	a5,a1
    7fb4:	00b4f6b3          	and	a3,s1,a1
    7fb8:	00050713          	mv	a4,a0
    7fbc:	fca00593          	li	a1,-54
    7fc0:	f9dff06f          	j	7f5c <frexp+0x4c>

00007fc4 <quorem>:
    7fc4:	fb010113          	add	sp,sp,-80
    7fc8:	04912223          	sw	s1,68(sp)
    7fcc:	01052783          	lw	a5,16(a0)
    7fd0:	0105a483          	lw	s1,16(a1)
    7fd4:	04112623          	sw	ra,76(sp)
    7fd8:	00b12423          	sw	a1,8(sp)
    7fdc:	2097ca63          	blt	a5,s1,81f0 <quorem+0x22c>
    7fe0:	fff48493          	add	s1,s1,-1
    7fe4:	03512a23          	sw	s5,52(sp)
    7fe8:	03812423          	sw	s8,40(sp)
    7fec:	00249a93          	sll	s5,s1,0x2
    7ff0:	01458c13          	add	s8,a1,20
    7ff4:	05212023          	sw	s2,64(sp)
    7ff8:	03312e23          	sw	s3,60(sp)
    7ffc:	015c0933          	add	s2,s8,s5
    8000:	01450993          	add	s3,a0,20
    8004:	015987b3          	add	a5,s3,s5
    8008:	03712623          	sw	s7,44(sp)
    800c:	00092b83          	lw	s7,0(s2)
    8010:	03912223          	sw	s9,36(sp)
    8014:	0007ac83          	lw	s9,0(a5)
    8018:	001b8b93          	add	s7,s7,1
    801c:	03412c23          	sw	s4,56(sp)
    8020:	000b8593          	mv	a1,s7
    8024:	00050a13          	mv	s4,a0
    8028:	000c8513          	mv	a0,s9
    802c:	04812423          	sw	s0,72(sp)
    8030:	00f12623          	sw	a5,12(sp)
    8034:	70d060ef          	jal	ef40 <__hidden___udivsi3>
    8038:	00050413          	mv	s0,a0
    803c:	0d7cee63          	bltu	s9,s7,8118 <quorem+0x154>
    8040:	03a12023          	sw	s10,32(sp)
    8044:	00010d37          	lui	s10,0x10
    8048:	01b12e23          	sw	s11,28(sp)
    804c:	03612823          	sw	s6,48(sp)
    8050:	000c0a93          	mv	s5,s8
    8054:	00098d93          	mv	s11,s3
    8058:	00000c93          	li	s9,0
    805c:	00000b93          	li	s7,0
    8060:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    8064:	000aab03          	lw	s6,0(s5)
    8068:	00040593          	mv	a1,s0
    806c:	004d8d93          	add	s11,s11,4
    8070:	01ab7533          	and	a0,s6,s10
    8074:	609060ef          	jal	ee7c <__mulsi3>
    8078:	00050793          	mv	a5,a0
    807c:	00040593          	mv	a1,s0
    8080:	010b5513          	srl	a0,s6,0x10
    8084:	01978cb3          	add	s9,a5,s9
    8088:	5f5060ef          	jal	ee7c <__mulsi3>
    808c:	ffcda603          	lw	a2,-4(s11)
    8090:	01acf733          	and	a4,s9,s10
    8094:	010cdc93          	srl	s9,s9,0x10
    8098:	01a677b3          	and	a5,a2,s10
    809c:	40e787b3          	sub	a5,a5,a4
    80a0:	017787b3          	add	a5,a5,s7
    80a4:	01950533          	add	a0,a0,s9
    80a8:	4107d713          	sra	a4,a5,0x10
    80ac:	01a575b3          	and	a1,a0,s10
    80b0:	01065613          	srl	a2,a2,0x10
    80b4:	40b70733          	sub	a4,a4,a1
    80b8:	00c70733          	add	a4,a4,a2
    80bc:	01a7f7b3          	and	a5,a5,s10
    80c0:	01071613          	sll	a2,a4,0x10
    80c4:	00c7e7b3          	or	a5,a5,a2
    80c8:	004a8a93          	add	s5,s5,4
    80cc:	fefdae23          	sw	a5,-4(s11)
    80d0:	01055c93          	srl	s9,a0,0x10
    80d4:	41075b93          	sra	s7,a4,0x10
    80d8:	f95976e3          	bgeu	s2,s5,8064 <quorem+0xa0>
    80dc:	00c12703          	lw	a4,12(sp)
    80e0:	00072783          	lw	a5,0(a4)
    80e4:	12079063          	bnez	a5,8204 <quorem+0x240>
    80e8:	ffc70a93          	add	s5,a4,-4
    80ec:	0159e863          	bltu	s3,s5,80fc <quorem+0x138>
    80f0:	0180006f          	j	8108 <quorem+0x144>
    80f4:	fff48493          	add	s1,s1,-1
    80f8:	0159f863          	bgeu	s3,s5,8108 <quorem+0x144>
    80fc:	000aa783          	lw	a5,0(s5)
    8100:	ffca8a93          	add	s5,s5,-4
    8104:	fe0788e3          	beqz	a5,80f4 <quorem+0x130>
    8108:	03012b03          	lw	s6,48(sp)
    810c:	02012d03          	lw	s10,32(sp)
    8110:	01c12d83          	lw	s11,28(sp)
    8114:	009a2823          	sw	s1,16(s4)
    8118:	00812583          	lw	a1,8(sp)
    811c:	000a0513          	mv	a0,s4
    8120:	1fc020ef          	jal	a31c <__mcmp>
    8124:	08054c63          	bltz	a0,81bc <quorem+0x1f8>
    8128:	00010537          	lui	a0,0x10
    812c:	00098593          	mv	a1,s3
    8130:	00000713          	li	a4,0
    8134:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    8138:	0005a683          	lw	a3,0(a1)
    813c:	000c2603          	lw	a2,0(s8)
    8140:	00458593          	add	a1,a1,4
    8144:	00a6f7b3          	and	a5,a3,a0
    8148:	00a67833          	and	a6,a2,a0
    814c:	410787b3          	sub	a5,a5,a6
    8150:	00e787b3          	add	a5,a5,a4
    8154:	4107d713          	sra	a4,a5,0x10
    8158:	01065613          	srl	a2,a2,0x10
    815c:	0106d693          	srl	a3,a3,0x10
    8160:	40c70733          	sub	a4,a4,a2
    8164:	00d70733          	add	a4,a4,a3
    8168:	01071693          	sll	a3,a4,0x10
    816c:	00a7f7b3          	and	a5,a5,a0
    8170:	00d7e7b3          	or	a5,a5,a3
    8174:	004c0c13          	add	s8,s8,4
    8178:	fef5ae23          	sw	a5,-4(a1)
    817c:	41075713          	sra	a4,a4,0x10
    8180:	fb897ce3          	bgeu	s2,s8,8138 <quorem+0x174>
    8184:	00249793          	sll	a5,s1,0x2
    8188:	00f987b3          	add	a5,s3,a5
    818c:	0007a703          	lw	a4,0(a5)
    8190:	02071463          	bnez	a4,81b8 <quorem+0x1f4>
    8194:	ffc78793          	add	a5,a5,-4
    8198:	00f9e863          	bltu	s3,a5,81a8 <quorem+0x1e4>
    819c:	0180006f          	j	81b4 <quorem+0x1f0>
    81a0:	fff48493          	add	s1,s1,-1
    81a4:	00f9f863          	bgeu	s3,a5,81b4 <quorem+0x1f0>
    81a8:	0007a703          	lw	a4,0(a5)
    81ac:	ffc78793          	add	a5,a5,-4
    81b0:	fe0708e3          	beqz	a4,81a0 <quorem+0x1dc>
    81b4:	009a2823          	sw	s1,16(s4)
    81b8:	00140413          	add	s0,s0,1
    81bc:	04c12083          	lw	ra,76(sp)
    81c0:	00040513          	mv	a0,s0
    81c4:	04812403          	lw	s0,72(sp)
    81c8:	04012903          	lw	s2,64(sp)
    81cc:	03c12983          	lw	s3,60(sp)
    81d0:	03812a03          	lw	s4,56(sp)
    81d4:	03412a83          	lw	s5,52(sp)
    81d8:	02c12b83          	lw	s7,44(sp)
    81dc:	02812c03          	lw	s8,40(sp)
    81e0:	02412c83          	lw	s9,36(sp)
    81e4:	04412483          	lw	s1,68(sp)
    81e8:	05010113          	add	sp,sp,80
    81ec:	00008067          	ret
    81f0:	04c12083          	lw	ra,76(sp)
    81f4:	04412483          	lw	s1,68(sp)
    81f8:	00000513          	li	a0,0
    81fc:	05010113          	add	sp,sp,80
    8200:	00008067          	ret
    8204:	00812583          	lw	a1,8(sp)
    8208:	000a0513          	mv	a0,s4
    820c:	03012b03          	lw	s6,48(sp)
    8210:	02012d03          	lw	s10,32(sp)
    8214:	01c12d83          	lw	s11,28(sp)
    8218:	104020ef          	jal	a31c <__mcmp>
    821c:	f00556e3          	bgez	a0,8128 <quorem+0x164>
    8220:	f9dff06f          	j	81bc <quorem+0x1f8>

00008224 <_dtoa_r>:
    8224:	03852303          	lw	t1,56(a0)
    8228:	f5010113          	add	sp,sp,-176
    822c:	0a812423          	sw	s0,168(sp)
    8230:	0a912223          	sw	s1,164(sp)
    8234:	0b212023          	sw	s2,160(sp)
    8238:	09412c23          	sw	s4,152(sp)
    823c:	07b12e23          	sw	s11,124(sp)
    8240:	0a112623          	sw	ra,172(sp)
    8244:	09312e23          	sw	s3,156(sp)
    8248:	09512a23          	sw	s5,148(sp)
    824c:	00e12a23          	sw	a4,20(sp)
    8250:	00f12623          	sw	a5,12(sp)
    8254:	01112423          	sw	a7,8(sp)
    8258:	02b12223          	sw	a1,36(sp)
    825c:	00c12023          	sw	a2,0(sp)
    8260:	00050413          	mv	s0,a0
    8264:	00058d93          	mv	s11,a1
    8268:	00060493          	mv	s1,a2
    826c:	00068a13          	mv	s4,a3
    8270:	00080913          	mv	s2,a6
    8274:	02030263          	beqz	t1,8298 <_dtoa_r+0x74>
    8278:	03c52703          	lw	a4,60(a0)
    827c:	00100793          	li	a5,1
    8280:	00030593          	mv	a1,t1
    8284:	00e797b3          	sll	a5,a5,a4
    8288:	00e32223          	sw	a4,4(t1)
    828c:	00f32423          	sw	a5,8(t1)
    8290:	734010ef          	jal	99c4 <_Bfree>
    8294:	02042c23          	sw	zero,56(s0)
    8298:	00048993          	mv	s3,s1
    829c:	00000693          	li	a3,0
    82a0:	0004dc63          	bgez	s1,82b8 <_dtoa_r+0x94>
    82a4:	00149493          	sll	s1,s1,0x1
    82a8:	0014d793          	srl	a5,s1,0x1
    82ac:	00f12023          	sw	a5,0(sp)
    82b0:	00078993          	mv	s3,a5
    82b4:	00100693          	li	a3,1
    82b8:	7ff00737          	lui	a4,0x7ff00
    82bc:	00d92023          	sw	a3,0(s2)
    82c0:	00e9f6b3          	and	a3,s3,a4
    82c4:	64e68463          	beq	a3,a4,890c <_dtoa_r+0x6e8>
    82c8:	00012483          	lw	s1,0(sp)
    82cc:	000d8513          	mv	a0,s11
    82d0:	00000613          	li	a2,0
    82d4:	00048593          	mv	a1,s1
    82d8:	00000693          	li	a3,0
    82dc:	01b12c23          	sw	s11,24(sp)
    82e0:	00912e23          	sw	s1,28(sp)
    82e4:	23c050ef          	jal	d520 <__eqdf2>
    82e8:	04051c63          	bnez	a0,8340 <_dtoa_r+0x11c>
    82ec:	00c12703          	lw	a4,12(sp)
    82f0:	00100793          	li	a5,1
    82f4:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    82f8:	00812703          	lw	a4,8(sp)
    82fc:	00070863          	beqz	a4,830c <_dtoa_r+0xe8>
    8300:	00007797          	auipc	a5,0x7
    8304:	04d78793          	add	a5,a5,77 # f34d <__fini_array_end+0x2d9>
    8308:	00f72023          	sw	a5,0(a4)
    830c:	00007a97          	auipc	s5,0x7
    8310:	040a8a93          	add	s5,s5,64 # f34c <__fini_array_end+0x2d8>
    8314:	0ac12083          	lw	ra,172(sp)
    8318:	0a812403          	lw	s0,168(sp)
    831c:	0a412483          	lw	s1,164(sp)
    8320:	0a012903          	lw	s2,160(sp)
    8324:	09c12983          	lw	s3,156(sp)
    8328:	09812a03          	lw	s4,152(sp)
    832c:	07c12d83          	lw	s11,124(sp)
    8330:	000a8513          	mv	a0,s5
    8334:	09412a83          	lw	s5,148(sp)
    8338:	0b010113          	add	sp,sp,176
    833c:	00008067          	ret
    8340:	00048613          	mv	a2,s1
    8344:	06810713          	add	a4,sp,104
    8348:	06c10693          	add	a3,sp,108
    834c:	000d8593          	mv	a1,s11
    8350:	00040513          	mv	a0,s0
    8354:	09612823          	sw	s6,144(sp)
    8358:	09712623          	sw	s7,140(sp)
    835c:	09812423          	sw	s8,136(sp)
    8360:	09912223          	sw	s9,132(sp)
    8364:	09a12023          	sw	s10,128(sp)
    8368:	0149d913          	srl	s2,s3,0x14
    836c:	268020ef          	jal	a5d4 <__d2b>
    8370:	00050493          	mv	s1,a0
    8374:	5c091e63          	bnez	s2,8950 <_dtoa_r+0x72c>
    8378:	06812a83          	lw	s5,104(sp)
    837c:	06c12903          	lw	s2,108(sp)
    8380:	02000793          	li	a5,32
    8384:	012a8933          	add	s2,s5,s2
    8388:	43290713          	add	a4,s2,1074
    838c:	36e7dae3          	bge	a5,a4,8f00 <_dtoa_r+0xcdc>
    8390:	04000793          	li	a5,64
    8394:	40e787b3          	sub	a5,a5,a4
    8398:	41290513          	add	a0,s2,1042
    839c:	00f997b3          	sll	a5,s3,a5
    83a0:	00add533          	srl	a0,s11,a0
    83a4:	00a7e533          	or	a0,a5,a0
    83a8:	634060ef          	jal	e9dc <__floatunsidf>
    83ac:	fe1007b7          	lui	a5,0xfe100
    83b0:	00100693          	li	a3,1
    83b4:	00050713          	mv	a4,a0
    83b8:	00b787b3          	add	a5,a5,a1
    83bc:	fff90913          	add	s2,s2,-1
    83c0:	02d12c23          	sw	a3,56(sp)
    83c4:	7fff8697          	auipc	a3,0x7fff8
    83c8:	30c68693          	add	a3,a3,780 # 800006d0 <__global_locale+0x19c>
    83cc:	0006a603          	lw	a2,0(a3)
    83d0:	0046a683          	lw	a3,4(a3)
    83d4:	00070513          	mv	a0,a4
    83d8:	00078593          	mv	a1,a5
    83dc:	369050ef          	jal	df44 <__subdf3>
    83e0:	7fff8797          	auipc	a5,0x7fff8
    83e4:	2f878793          	add	a5,a5,760 # 800006d8 <__global_locale+0x1a4>
    83e8:	0007a603          	lw	a2,0(a5)
    83ec:	0047a683          	lw	a3,4(a5)
    83f0:	3c4050ef          	jal	d7b4 <__muldf3>
    83f4:	7fff8797          	auipc	a5,0x7fff8
    83f8:	2ec78793          	add	a5,a5,748 # 800006e0 <__global_locale+0x1ac>
    83fc:	0007a603          	lw	a2,0(a5)
    8400:	0047a683          	lw	a3,4(a5)
    8404:	7a9030ef          	jal	c3ac <__adddf3>
    8408:	00050b13          	mv	s6,a0
    840c:	00090513          	mv	a0,s2
    8410:	00058993          	mv	s3,a1
    8414:	510060ef          	jal	e924 <__floatsidf>
    8418:	7fff8797          	auipc	a5,0x7fff8
    841c:	2d078793          	add	a5,a5,720 # 800006e8 <__global_locale+0x1b4>
    8420:	0007a603          	lw	a2,0(a5)
    8424:	0047a683          	lw	a3,4(a5)
    8428:	38c050ef          	jal	d7b4 <__muldf3>
    842c:	00050613          	mv	a2,a0
    8430:	00058693          	mv	a3,a1
    8434:	000b0513          	mv	a0,s6
    8438:	00098593          	mv	a1,s3
    843c:	771030ef          	jal	c3ac <__adddf3>
    8440:	00050b93          	mv	s7,a0
    8444:	00058b13          	mv	s6,a1
    8448:	458060ef          	jal	e8a0 <__fixdfsi>
    844c:	00050993          	mv	s3,a0
    8450:	000b0593          	mv	a1,s6
    8454:	000b8513          	mv	a0,s7
    8458:	00000613          	li	a2,0
    845c:	00000693          	li	a3,0
    8460:	24c050ef          	jal	d6ac <__ledf2>
    8464:	02055063          	bgez	a0,8484 <_dtoa_r+0x260>
    8468:	00098513          	mv	a0,s3
    846c:	4b8060ef          	jal	e924 <__floatsidf>
    8470:	000b8613          	mv	a2,s7
    8474:	000b0693          	mv	a3,s6
    8478:	0a8050ef          	jal	d520 <__eqdf2>
    847c:	00a03533          	snez	a0,a0
    8480:	40a989b3          	sub	s3,s3,a0
    8484:	412a8ab3          	sub	s5,s5,s2
    8488:	01600793          	li	a5,22
    848c:	fffa8b13          	add	s6,s5,-1
    8490:	2137e2e3          	bltu	a5,s3,8e94 <_dtoa_r+0xc70>
    8494:	00399713          	sll	a4,s3,0x3
    8498:	00007797          	auipc	a5,0x7
    849c:	55078793          	add	a5,a5,1360 # f9e8 <__mprec_tens>
    84a0:	00e787b3          	add	a5,a5,a4
    84a4:	0007a603          	lw	a2,0(a5)
    84a8:	0047a683          	lw	a3,4(a5)
    84ac:	01812503          	lw	a0,24(sp)
    84b0:	01c12583          	lw	a1,28(sp)
    84b4:	1f8050ef          	jal	d6ac <__ledf2>
    84b8:	220554e3          	bgez	a0,8ee0 <_dtoa_r+0xcbc>
    84bc:	fff98993          	add	s3,s3,-1
    84c0:	02012a23          	sw	zero,52(sp)
    84c4:	00012823          	sw	zero,16(sp)
    84c8:	4a0b4863          	bltz	s6,8978 <_dtoa_r+0x754>
    84cc:	4c09d063          	bgez	s3,898c <_dtoa_r+0x768>
    84d0:	01012783          	lw	a5,16(sp)
    84d4:	03312023          	sw	s3,32(sp)
    84d8:	413787b3          	sub	a5,a5,s3
    84dc:	00f12823          	sw	a5,16(sp)
    84e0:	413007b3          	neg	a5,s3
    84e4:	02f12823          	sw	a5,48(sp)
    84e8:	00900793          	li	a5,9
    84ec:	00000993          	li	s3,0
    84f0:	4b47e863          	bltu	a5,s4,89a0 <_dtoa_r+0x77c>
    84f4:	00500793          	li	a5,5
    84f8:	2147dae3          	bge	a5,s4,8f0c <_dtoa_r+0xce8>
    84fc:	ffca0a13          	add	s4,s4,-4
    8500:	00300793          	li	a5,3
    8504:	00000913          	li	s2,0
    8508:	66fa02e3          	beq	s4,a5,936c <_dtoa_r+0x1148>
    850c:	6147dae3          	bge	a5,s4,9320 <_dtoa_r+0x10fc>
    8510:	00400793          	li	a5,4
    8514:	54fa1ae3          	bne	s4,a5,9268 <_dtoa_r+0x1044>
    8518:	00100793          	li	a5,1
    851c:	02f12423          	sw	a5,40(sp)
    8520:	01412603          	lw	a2,20(sp)
    8524:	62c05ce3          	blez	a2,935c <_dtoa_r+0x1138>
    8528:	02c12e23          	sw	a2,60(sp)
    852c:	00060c13          	mv	s8,a2
    8530:	01700693          	li	a3,23
    8534:	00100713          	li	a4,1
    8538:	00400793          	li	a5,4
    853c:	00c6c463          	blt	a3,a2,8544 <_dtoa_r+0x320>
    8540:	3540106f          	j	9894 <_dtoa_r+0x1670>
    8544:	00179793          	sll	a5,a5,0x1
    8548:	01478693          	add	a3,a5,20
    854c:	00070593          	mv	a1,a4
    8550:	00170713          	add	a4,a4,1
    8554:	fed678e3          	bgeu	a2,a3,8544 <_dtoa_r+0x320>
    8558:	02b42e23          	sw	a1,60(s0)
    855c:	00040513          	mv	a0,s0
    8560:	3b0010ef          	jal	9910 <_Balloc>
    8564:	00050a93          	mv	s5,a0
    8568:	00051463          	bnez	a0,8570 <_dtoa_r+0x34c>
    856c:	30c0106f          	j	9878 <_dtoa_r+0x1654>
    8570:	02a42c23          	sw	a0,56(s0)
    8574:	00e00793          	li	a5,14
    8578:	5187ea63          	bltu	a5,s8,8a8c <_dtoa_r+0x868>
    857c:	50090863          	beqz	s2,8a8c <_dtoa_r+0x868>
    8580:	02012783          	lw	a5,32(sp)
    8584:	62f054e3          	blez	a5,93ac <_dtoa_r+0x1188>
    8588:	00f7f713          	and	a4,a5,15
    858c:	00371713          	sll	a4,a4,0x3
    8590:	4047dc93          	sra	s9,a5,0x4
    8594:	00007797          	auipc	a5,0x7
    8598:	45478793          	add	a5,a5,1108 # f9e8 <__mprec_tens>
    859c:	00e787b3          	add	a5,a5,a4
    85a0:	010cf693          	and	a3,s9,16
    85a4:	0007a803          	lw	a6,0(a5)
    85a8:	0047a703          	lw	a4,4(a5)
    85ac:	560682e3          	beqz	a3,9310 <_dtoa_r+0x10ec>
    85b0:	00007797          	auipc	a5,0x7
    85b4:	41078793          	add	a5,a5,1040 # f9c0 <__mprec_bigtens>
    85b8:	0207a603          	lw	a2,32(a5)
    85bc:	0247a683          	lw	a3,36(a5)
    85c0:	01812503          	lw	a0,24(sp)
    85c4:	01c12583          	lw	a1,28(sp)
    85c8:	04e12423          	sw	a4,72(sp)
    85cc:	05012023          	sw	a6,64(sp)
    85d0:	6a4040ef          	jal	cc74 <__divdf3>
    85d4:	04012803          	lw	a6,64(sp)
    85d8:	04812703          	lw	a4,72(sp)
    85dc:	00fcfc93          	and	s9,s9,15
    85e0:	00050313          	mv	t1,a0
    85e4:	00058d13          	mv	s10,a1
    85e8:	00300913          	li	s2,3
    85ec:	040c8c63          	beqz	s9,8644 <_dtoa_r+0x420>
    85f0:	04812023          	sw	s0,64(sp)
    85f4:	00007b97          	auipc	s7,0x7
    85f8:	3ccb8b93          	add	s7,s7,972 # f9c0 <__mprec_bigtens>
    85fc:	00090413          	mv	s0,s2
    8600:	00070593          	mv	a1,a4
    8604:	00030913          	mv	s2,t1
    8608:	001cf793          	and	a5,s9,1
    860c:	00078e63          	beqz	a5,8628 <_dtoa_r+0x404>
    8610:	000ba603          	lw	a2,0(s7)
    8614:	004ba683          	lw	a3,4(s7)
    8618:	00080513          	mv	a0,a6
    861c:	00140413          	add	s0,s0,1
    8620:	194050ef          	jal	d7b4 <__muldf3>
    8624:	00050813          	mv	a6,a0
    8628:	401cdc93          	sra	s9,s9,0x1
    862c:	008b8b93          	add	s7,s7,8
    8630:	fc0c9ce3          	bnez	s9,8608 <_dtoa_r+0x3e4>
    8634:	00090313          	mv	t1,s2
    8638:	00040913          	mv	s2,s0
    863c:	04012403          	lw	s0,64(sp)
    8640:	00058713          	mv	a4,a1
    8644:	00070693          	mv	a3,a4
    8648:	00080613          	mv	a2,a6
    864c:	00030513          	mv	a0,t1
    8650:	000d0593          	mv	a1,s10
    8654:	620040ef          	jal	cc74 <__divdf3>
    8658:	00050713          	mv	a4,a0
    865c:	00058793          	mv	a5,a1
    8660:	03412683          	lw	a3,52(sp)
    8664:	02068c63          	beqz	a3,869c <_dtoa_r+0x478>
    8668:	7fff8697          	auipc	a3,0x7fff8
    866c:	08868693          	add	a3,a3,136 # 800006f0 <__global_locale+0x1bc>
    8670:	0006a603          	lw	a2,0(a3)
    8674:	0046a683          	lw	a3,4(a3)
    8678:	00070513          	mv	a0,a4
    867c:	00078593          	mv	a1,a5
    8680:	04e12423          	sw	a4,72(sp)
    8684:	04f12023          	sw	a5,64(sp)
    8688:	024050ef          	jal	d6ac <__ledf2>
    868c:	04012783          	lw	a5,64(sp)
    8690:	04812703          	lw	a4,72(sp)
    8694:	00055463          	bgez	a0,869c <_dtoa_r+0x478>
    8698:	04c0106f          	j	96e4 <_dtoa_r+0x14c0>
    869c:	00090513          	mv	a0,s2
    86a0:	04f12623          	sw	a5,76(sp)
    86a4:	04e12023          	sw	a4,64(sp)
    86a8:	27c060ef          	jal	e924 <__floatsidf>
    86ac:	04012703          	lw	a4,64(sp)
    86b0:	04c12783          	lw	a5,76(sp)
    86b4:	00070613          	mv	a2,a4
    86b8:	00078693          	mv	a3,a5
    86bc:	04e12423          	sw	a4,72(sp)
    86c0:	04f12023          	sw	a5,64(sp)
    86c4:	0f0050ef          	jal	d7b4 <__muldf3>
    86c8:	7fff8697          	auipc	a3,0x7fff8
    86cc:	03868693          	add	a3,a3,56 # 80000700 <__global_locale+0x1cc>
    86d0:	0006a603          	lw	a2,0(a3)
    86d4:	0046a683          	lw	a3,4(a3)
    86d8:	4d5030ef          	jal	c3ac <__adddf3>
    86dc:	fcc006b7          	lui	a3,0xfcc00
    86e0:	04012783          	lw	a5,64(sp)
    86e4:	04812703          	lw	a4,72(sp)
    86e8:	00050c93          	mv	s9,a0
    86ec:	00b68bb3          	add	s7,a3,a1
    86f0:	340c0463          	beqz	s8,8a38 <_dtoa_r+0x814>
    86f4:	02012683          	lw	a3,32(sp)
    86f8:	05812423          	sw	s8,72(sp)
    86fc:	04d12e23          	sw	a3,92(sp)
    8700:	00070513          	mv	a0,a4
    8704:	00078593          	mv	a1,a5
    8708:	04e12623          	sw	a4,76(sp)
    870c:	04f12023          	sw	a5,64(sp)
    8710:	190060ef          	jal	e8a0 <__fixdfsi>
    8714:	04812783          	lw	a5,72(sp)
    8718:	00050913          	mv	s2,a0
    871c:	05912c23          	sw	s9,88(sp)
    8720:	fff78693          	add	a3,a5,-1
    8724:	00369693          	sll	a3,a3,0x3
    8728:	00007797          	auipc	a5,0x7
    872c:	2c078793          	add	a5,a5,704 # f9e8 <__mprec_tens>
    8730:	00d786b3          	add	a3,a5,a3
    8734:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8738:	0046a803          	lw	a6,4(a3)
    873c:	001a8d13          	add	s10,s5,1
    8740:	04f12823          	sw	a5,80(sp)
    8744:	05012a23          	sw	a6,84(sp)
    8748:	1dc060ef          	jal	e924 <__floatsidf>
    874c:	04c12703          	lw	a4,76(sp)
    8750:	04012783          	lw	a5,64(sp)
    8754:	00050613          	mv	a2,a0
    8758:	00058693          	mv	a3,a1
    875c:	00070513          	mv	a0,a4
    8760:	00078593          	mv	a1,a5
    8764:	7e0050ef          	jal	df44 <__subdf3>
    8768:	02812703          	lw	a4,40(sp)
    876c:	03090313          	add	t1,s2,48
    8770:	05a12023          	sw	s10,64(sp)
    8774:	00050c93          	mv	s9,a0
    8778:	0ff37313          	zext.b	t1,t1
    877c:	5c0706e3          	beqz	a4,9548 <_dtoa_r+0x1324>
    8780:	7fff8797          	auipc	a5,0x7fff8
    8784:	f4078793          	add	a5,a5,-192 # 800006c0 <__global_locale+0x18c>
    8788:	0007a503          	lw	a0,0(a5)
    878c:	05012603          	lw	a2,80(sp)
    8790:	05412683          	lw	a3,84(sp)
    8794:	04b12023          	sw	a1,64(sp)
    8798:	0047a583          	lw	a1,4(a5)
    879c:	04612623          	sw	t1,76(sp)
    87a0:	4d4040ef          	jal	cc74 <__divdf3>
    87a4:	05812603          	lw	a2,88(sp)
    87a8:	000b8693          	mv	a3,s7
    87ac:	798050ef          	jal	df44 <__subdf3>
    87b0:	04012883          	lw	a7,64(sp)
    87b4:	04c12303          	lw	t1,76(sp)
    87b8:	000c8613          	mv	a2,s9
    87bc:	00088693          	mv	a3,a7
    87c0:	006a8023          	sb	t1,0(s5)
    87c4:	00050913          	mv	s2,a0
    87c8:	00058b93          	mv	s7,a1
    87cc:	5e1040ef          	jal	d5ac <__gedf2>
    87d0:	04012883          	lw	a7,64(sp)
    87d4:	00a05463          	blez	a0,87dc <_dtoa_r+0x5b8>
    87d8:	7c90006f          	j	97a0 <_dtoa_r+0x157c>
    87dc:	7fff8697          	auipc	a3,0x7fff8
    87e0:	f1468693          	add	a3,a3,-236 # 800006f0 <__global_locale+0x1bc>
    87e4:	0006a783          	lw	a5,0(a3)
    87e8:	0046a803          	lw	a6,4(a3)
    87ec:	05312623          	sw	s3,76(sp)
    87f0:	04f12023          	sw	a5,64(sp)
    87f4:	00000793          	li	a5,0
    87f8:	05612823          	sw	s6,80(sp)
    87fc:	05812c23          	sw	s8,88(sp)
    8800:	05012223          	sw	a6,68(sp)
    8804:	04812c03          	lw	s8,72(sp)
    8808:	00078b13          	mv	s6,a5
    880c:	05412423          	sw	s4,72(sp)
    8810:	00088993          	mv	s3,a7
    8814:	0980006f          	j	88ac <_dtoa_r+0x688>
    8818:	001b0b13          	add	s6,s6,1
    881c:	018b4463          	blt	s6,s8,8824 <_dtoa_r+0x600>
    8820:	7d10006f          	j	97f0 <_dtoa_r+0x15cc>
    8824:	7fff8a17          	auipc	s4,0x7fff8
    8828:	ed4a0a13          	add	s4,s4,-300 # 800006f8 <__global_locale+0x1c4>
    882c:	000a2603          	lw	a2,0(s4)
    8830:	004a2683          	lw	a3,4(s4)
    8834:	00090513          	mv	a0,s2
    8838:	000b8593          	mv	a1,s7
    883c:	779040ef          	jal	d7b4 <__muldf3>
    8840:	000a2603          	lw	a2,0(s4)
    8844:	004a2683          	lw	a3,4(s4)
    8848:	00050913          	mv	s2,a0
    884c:	00058b93          	mv	s7,a1
    8850:	000c8513          	mv	a0,s9
    8854:	00098593          	mv	a1,s3
    8858:	75d040ef          	jal	d7b4 <__muldf3>
    885c:	00058c93          	mv	s9,a1
    8860:	00050a13          	mv	s4,a0
    8864:	03c060ef          	jal	e8a0 <__fixdfsi>
    8868:	00050993          	mv	s3,a0
    886c:	0b8060ef          	jal	e924 <__floatsidf>
    8870:	00050613          	mv	a2,a0
    8874:	00058693          	mv	a3,a1
    8878:	000a0513          	mv	a0,s4
    887c:	000c8593          	mv	a1,s9
    8880:	6c4050ef          	jal	df44 <__subdf3>
    8884:	03098793          	add	a5,s3,48
    8888:	00090613          	mv	a2,s2
    888c:	000b8693          	mv	a3,s7
    8890:	00fd0023          	sb	a5,0(s10)
    8894:	001d0d13          	add	s10,s10,1
    8898:	00050c93          	mv	s9,a0
    889c:	00058993          	mv	s3,a1
    88a0:	60d040ef          	jal	d6ac <__ledf2>
    88a4:	00055463          	bgez	a0,88ac <_dtoa_r+0x688>
    88a8:	6f90006f          	j	97a0 <_dtoa_r+0x157c>
    88ac:	04012503          	lw	a0,64(sp)
    88b0:	04412583          	lw	a1,68(sp)
    88b4:	000c8613          	mv	a2,s9
    88b8:	00098693          	mv	a3,s3
    88bc:	688050ef          	jal	df44 <__subdf3>
    88c0:	00090613          	mv	a2,s2
    88c4:	000b8693          	mv	a3,s7
    88c8:	5e5040ef          	jal	d6ac <__ledf2>
    88cc:	f40556e3          	bgez	a0,8818 <_dtoa_r+0x5f4>
    88d0:	05c12783          	lw	a5,92(sp)
    88d4:	000d0b93          	mv	s7,s10
    88d8:	00178c13          	add	s8,a5,1
    88dc:	03900613          	li	a2,57
    88e0:	0080006f          	j	88e8 <_dtoa_r+0x6c4>
    88e4:	697a88e3          	beq	s5,s7,9774 <_dtoa_r+0x1550>
    88e8:	fffbc683          	lbu	a3,-1(s7)
    88ec:	000b8d13          	mv	s10,s7
    88f0:	fffb8b93          	add	s7,s7,-1
    88f4:	fec688e3          	beq	a3,a2,88e4 <_dtoa_r+0x6c0>
    88f8:	00168693          	add	a3,a3,1
    88fc:	0ff6f693          	zext.b	a3,a3
    8900:	00db8023          	sb	a3,0(s7)
    8904:	000c0a13          	mv	s4,s8
    8908:	4f00006f          	j	8df8 <_dtoa_r+0xbd4>
    890c:	00c12683          	lw	a3,12(sp)
    8910:	00002737          	lui	a4,0x2
    8914:	00c99793          	sll	a5,s3,0xc
    8918:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x6eb>
    891c:	00c7d793          	srl	a5,a5,0xc
    8920:	00e6a023          	sw	a4,0(a3)
    8924:	01b7e7b3          	or	a5,a5,s11
    8928:	0a078063          	beqz	a5,89c8 <_dtoa_r+0x7a4>
    892c:	00812783          	lw	a5,8(sp)
    8930:	00007a97          	auipc	s5,0x7
    8934:	a74a8a93          	add	s5,s5,-1420 # f3a4 <__fini_array_end+0x330>
    8938:	9c078ee3          	beqz	a5,8314 <_dtoa_r+0xf0>
    893c:	00007797          	auipc	a5,0x7
    8940:	a6b78793          	add	a5,a5,-1429 # f3a7 <__fini_array_end+0x333>
    8944:	00812703          	lw	a4,8(sp)
    8948:	00f72023          	sw	a5,0(a4)
    894c:	9c9ff06f          	j	8314 <_dtoa_r+0xf0>
    8950:	01c12783          	lw	a5,28(sp)
    8954:	3ff006b7          	lui	a3,0x3ff00
    8958:	06812a83          	lw	s5,104(sp)
    895c:	00c79793          	sll	a5,a5,0xc
    8960:	00c7d793          	srl	a5,a5,0xc
    8964:	01812703          	lw	a4,24(sp)
    8968:	00d7e7b3          	or	a5,a5,a3
    896c:	c0190913          	add	s2,s2,-1023
    8970:	02012c23          	sw	zero,56(sp)
    8974:	a51ff06f          	j	83c4 <_dtoa_r+0x1a0>
    8978:	00100793          	li	a5,1
    897c:	415787b3          	sub	a5,a5,s5
    8980:	00f12823          	sw	a5,16(sp)
    8984:	00000b13          	li	s6,0
    8988:	b409c4e3          	bltz	s3,84d0 <_dtoa_r+0x2ac>
    898c:	03312023          	sw	s3,32(sp)
    8990:	02012823          	sw	zero,48(sp)
    8994:	00900793          	li	a5,9
    8998:	013b0b33          	add	s6,s6,s3
    899c:	b547fce3          	bgeu	a5,s4,84f4 <_dtoa_r+0x2d0>
    89a0:	00100793          	li	a5,1
    89a4:	00100913          	li	s2,1
    89a8:	00000a13          	li	s4,0
    89ac:	02f12423          	sw	a5,40(sp)
    89b0:	fff00c13          	li	s8,-1
    89b4:	00012a23          	sw	zero,20(sp)
    89b8:	02042e23          	sw	zero,60(s0)
    89bc:	03812e23          	sw	s8,60(sp)
    89c0:	00000593          	li	a1,0
    89c4:	b99ff06f          	j	855c <_dtoa_r+0x338>
    89c8:	00812703          	lw	a4,8(sp)
    89cc:	00007a97          	auipc	s5,0x7
    89d0:	9cca8a93          	add	s5,s5,-1588 # f398 <__fini_array_end+0x324>
    89d4:	00007797          	auipc	a5,0x7
    89d8:	9cc78793          	add	a5,a5,-1588 # f3a0 <__fini_array_end+0x32c>
    89dc:	f60714e3          	bnez	a4,8944 <_dtoa_r+0x720>
    89e0:	935ff06f          	j	8314 <_dtoa_r+0xf0>
    89e4:	00090513          	mv	a0,s2
    89e8:	04f12623          	sw	a5,76(sp)
    89ec:	04e12023          	sw	a4,64(sp)
    89f0:	735050ef          	jal	e924 <__floatsidf>
    89f4:	04012703          	lw	a4,64(sp)
    89f8:	04c12783          	lw	a5,76(sp)
    89fc:	00070613          	mv	a2,a4
    8a00:	00078693          	mv	a3,a5
    8a04:	04e12423          	sw	a4,72(sp)
    8a08:	04f12023          	sw	a5,64(sp)
    8a0c:	5a9040ef          	jal	d7b4 <__muldf3>
    8a10:	7fff8697          	auipc	a3,0x7fff8
    8a14:	cf068693          	add	a3,a3,-784 # 80000700 <__global_locale+0x1cc>
    8a18:	0006a603          	lw	a2,0(a3)
    8a1c:	0046a683          	lw	a3,4(a3)
    8a20:	18d030ef          	jal	c3ac <__adddf3>
    8a24:	04012783          	lw	a5,64(sp)
    8a28:	04812703          	lw	a4,72(sp)
    8a2c:	fcc006b7          	lui	a3,0xfcc00
    8a30:	00050c93          	mv	s9,a0
    8a34:	00b68bb3          	add	s7,a3,a1
    8a38:	7fff8697          	auipc	a3,0x7fff8
    8a3c:	cd068693          	add	a3,a3,-816 # 80000708 <__global_locale+0x1d4>
    8a40:	0006a603          	lw	a2,0(a3)
    8a44:	0046a683          	lw	a3,4(a3)
    8a48:	00070513          	mv	a0,a4
    8a4c:	00078593          	mv	a1,a5
    8a50:	4f4050ef          	jal	df44 <__subdf3>
    8a54:	000c8613          	mv	a2,s9
    8a58:	000b8693          	mv	a3,s7
    8a5c:	00050d13          	mv	s10,a0
    8a60:	00058913          	mv	s2,a1
    8a64:	349040ef          	jal	d5ac <__gedf2>
    8a68:	50a04ce3          	bgtz	a0,9780 <_dtoa_r+0x155c>
    8a6c:	800007b7          	lui	a5,0x80000
    8a70:	0177c7b3          	xor	a5,a5,s7
    8a74:	000c8613          	mv	a2,s9
    8a78:	000d0513          	mv	a0,s10
    8a7c:	00078693          	mv	a3,a5
    8a80:	00090593          	mv	a1,s2
    8a84:	429040ef          	jal	d6ac <__ledf2>
    8a88:	06054c63          	bltz	a0,8b00 <_dtoa_r+0x8dc>
    8a8c:	06c12783          	lw	a5,108(sp)
    8a90:	1a07c663          	bltz	a5,8c3c <_dtoa_r+0xa18>
    8a94:	02012683          	lw	a3,32(sp)
    8a98:	00e00713          	li	a4,14
    8a9c:	1ad74063          	blt	a4,a3,8c3c <_dtoa_r+0xa18>
    8aa0:	02012783          	lw	a5,32(sp)
    8aa4:	00379713          	sll	a4,a5,0x3
    8aa8:	00007797          	auipc	a5,0x7
    8aac:	f4078793          	add	a5,a5,-192 # f9e8 <__mprec_tens>
    8ab0:	00e787b3          	add	a5,a5,a4
    8ab4:	0007a903          	lw	s2,0(a5)
    8ab8:	0047a983          	lw	s3,4(a5)
    8abc:	01412783          	lw	a5,20(sp)
    8ac0:	0407dc63          	bgez	a5,8b18 <_dtoa_r+0x8f4>
    8ac4:	05804a63          	bgtz	s8,8b18 <_dtoa_r+0x8f4>
    8ac8:	020c1c63          	bnez	s8,8b00 <_dtoa_r+0x8dc>
    8acc:	7fff8797          	auipc	a5,0x7fff8
    8ad0:	c3c78793          	add	a5,a5,-964 # 80000708 <__global_locale+0x1d4>
    8ad4:	0007a603          	lw	a2,0(a5)
    8ad8:	0047a683          	lw	a3,4(a5)
    8adc:	00090513          	mv	a0,s2
    8ae0:	00098593          	mv	a1,s3
    8ae4:	4d1040ef          	jal	d7b4 <__muldf3>
    8ae8:	00050613          	mv	a2,a0
    8aec:	00058693          	mv	a3,a1
    8af0:	01812503          	lw	a0,24(sp)
    8af4:	01c12583          	lw	a1,28(sp)
    8af8:	3b5040ef          	jal	d6ac <__ledf2>
    8afc:	48a042e3          	bgtz	a0,9780 <_dtoa_r+0x155c>
    8b00:	000a8d13          	mv	s10,s5
    8b04:	00012c23          	sw	zero,24(sp)
    8b08:	00000913          	li	s2,0
    8b0c:	01412783          	lw	a5,20(sp)
    8b10:	fff7ca13          	not	s4,a5
    8b14:	6980006f          	j	91ac <_dtoa_r+0xf88>
    8b18:	001a8793          	add	a5,s5,1
    8b1c:	04f12023          	sw	a5,64(sp)
    8b20:	01812b03          	lw	s6,24(sp)
    8b24:	01c12a03          	lw	s4,28(sp)
    8b28:	00090613          	mv	a2,s2
    8b2c:	00098693          	mv	a3,s3
    8b30:	000b0513          	mv	a0,s6
    8b34:	000a0593          	mv	a1,s4
    8b38:	13c040ef          	jal	cc74 <__divdf3>
    8b3c:	565050ef          	jal	e8a0 <__fixdfsi>
    8b40:	00050d13          	mv	s10,a0
    8b44:	5e1050ef          	jal	e924 <__floatsidf>
    8b48:	00090613          	mv	a2,s2
    8b4c:	00098693          	mv	a3,s3
    8b50:	465040ef          	jal	d7b4 <__muldf3>
    8b54:	00050613          	mv	a2,a0
    8b58:	00058693          	mv	a3,a1
    8b5c:	000b0513          	mv	a0,s6
    8b60:	000a0593          	mv	a1,s4
    8b64:	3e0050ef          	jal	df44 <__subdf3>
    8b68:	030d0793          	add	a5,s10,48
    8b6c:	00fa8023          	sb	a5,0(s5)
    8b70:	00100613          	li	a2,1
    8b74:	04012b83          	lw	s7,64(sp)
    8b78:	00050713          	mv	a4,a0
    8b7c:	00058693          	mv	a3,a1
    8b80:	0ccc0ee3          	beq	s8,a2,945c <_dtoa_r+0x1238>
    8b84:	7fff8617          	auipc	a2,0x7fff8
    8b88:	b7460613          	add	a2,a2,-1164 # 800006f8 <__global_locale+0x1c4>
    8b8c:	00062783          	lw	a5,0(a2)
    8b90:	00462803          	lw	a6,4(a2)
    8b94:	00100d93          	li	s11,1
    8b98:	00f12023          	sw	a5,0(sp)
    8b9c:	01012223          	sw	a6,4(sp)
    8ba0:	0600006f          	j	8c00 <_dtoa_r+0x9dc>
    8ba4:	00090613          	mv	a2,s2
    8ba8:	00098693          	mv	a3,s3
    8bac:	000b0513          	mv	a0,s6
    8bb0:	000a0593          	mv	a1,s4
    8bb4:	0c0040ef          	jal	cc74 <__divdf3>
    8bb8:	4e9050ef          	jal	e8a0 <__fixdfsi>
    8bbc:	00050d13          	mv	s10,a0
    8bc0:	565050ef          	jal	e924 <__floatsidf>
    8bc4:	00090613          	mv	a2,s2
    8bc8:	00098693          	mv	a3,s3
    8bcc:	3e9040ef          	jal	d7b4 <__muldf3>
    8bd0:	00058693          	mv	a3,a1
    8bd4:	00050613          	mv	a2,a0
    8bd8:	000a0593          	mv	a1,s4
    8bdc:	000b0513          	mv	a0,s6
    8be0:	364050ef          	jal	df44 <__subdf3>
    8be4:	001b8b93          	add	s7,s7,1
    8be8:	030d0793          	add	a5,s10,48
    8bec:	001d8d93          	add	s11,s11,1
    8bf0:	fefb8fa3          	sb	a5,-1(s7)
    8bf4:	00050713          	mv	a4,a0
    8bf8:	00058693          	mv	a3,a1
    8bfc:	07bc00e3          	beq	s8,s11,945c <_dtoa_r+0x1238>
    8c00:	00012603          	lw	a2,0(sp)
    8c04:	00068593          	mv	a1,a3
    8c08:	00412683          	lw	a3,4(sp)
    8c0c:	00070513          	mv	a0,a4
    8c10:	3a5040ef          	jal	d7b4 <__muldf3>
    8c14:	00000613          	li	a2,0
    8c18:	00000693          	li	a3,0
    8c1c:	00050b13          	mv	s6,a0
    8c20:	00058a13          	mv	s4,a1
    8c24:	0fd040ef          	jal	d520 <__eqdf2>
    8c28:	f6051ee3          	bnez	a0,8ba4 <_dtoa_r+0x980>
    8c2c:	02012783          	lw	a5,32(sp)
    8c30:	000b8d13          	mv	s10,s7
    8c34:	00178a13          	add	s4,a5,1
    8c38:	1c00006f          	j	8df8 <_dtoa_r+0xbd4>
    8c3c:	02812703          	lw	a4,40(sp)
    8c40:	26071463          	bnez	a4,8ea8 <_dtoa_r+0xc84>
    8c44:	03012b83          	lw	s7,48(sp)
    8c48:	01012c83          	lw	s9,16(sp)
    8c4c:	02012423          	sw	zero,40(sp)
    8c50:	00000913          	li	s2,0
    8c54:	020c8263          	beqz	s9,8c78 <_dtoa_r+0xa54>
    8c58:	03605063          	blez	s6,8c78 <_dtoa_r+0xa54>
    8c5c:	000c8793          	mv	a5,s9
    8c60:	679b4263          	blt	s6,s9,92c4 <_dtoa_r+0x10a0>
    8c64:	01012703          	lw	a4,16(sp)
    8c68:	40fc8cb3          	sub	s9,s9,a5
    8c6c:	40fb0b33          	sub	s6,s6,a5
    8c70:	40f70733          	sub	a4,a4,a5
    8c74:	00e12823          	sw	a4,16(sp)
    8c78:	03012783          	lw	a5,48(sp)
    8c7c:	02078263          	beqz	a5,8ca0 <_dtoa_r+0xa7c>
    8c80:	02812783          	lw	a5,40(sp)
    8c84:	00078463          	beqz	a5,8c8c <_dtoa_r+0xa68>
    8c88:	060b9ae3          	bnez	s7,94fc <_dtoa_r+0x12d8>
    8c8c:	03012603          	lw	a2,48(sp)
    8c90:	00048593          	mv	a1,s1
    8c94:	00040513          	mv	a0,s0
    8c98:	3a4010ef          	jal	a03c <__pow5mult>
    8c9c:	00050493          	mv	s1,a0
    8ca0:	00100593          	li	a1,1
    8ca4:	00040513          	mv	a0,s0
    8ca8:	01c010ef          	jal	9cc4 <__i2b>
    8cac:	00a12c23          	sw	a0,24(sp)
    8cb0:	50099a63          	bnez	s3,91c4 <_dtoa_r+0xfa0>
    8cb4:	00100793          	li	a5,1
    8cb8:	5547da63          	bge	a5,s4,920c <_dtoa_r+0xfe8>
    8cbc:	016787b3          	add	a5,a5,s6
    8cc0:	01f7f793          	and	a5,a5,31
    8cc4:	1c078e63          	beqz	a5,8ea0 <_dtoa_r+0xc7c>
    8cc8:	02000713          	li	a4,32
    8ccc:	40f70733          	sub	a4,a4,a5
    8cd0:	00400693          	li	a3,4
    8cd4:	58e6d263          	bge	a3,a4,9258 <_dtoa_r+0x1034>
    8cd8:	01c00713          	li	a4,28
    8cdc:	40f707b3          	sub	a5,a4,a5
    8ce0:	01012703          	lw	a4,16(sp)
    8ce4:	00fc8cb3          	add	s9,s9,a5
    8ce8:	00fb0b33          	add	s6,s6,a5
    8cec:	00f70733          	add	a4,a4,a5
    8cf0:	00e12823          	sw	a4,16(sp)
    8cf4:	01012783          	lw	a5,16(sp)
    8cf8:	12f04e63          	bgtz	a5,8e34 <_dtoa_r+0xc10>
    8cfc:	01605c63          	blez	s6,8d14 <_dtoa_r+0xaf0>
    8d00:	01812583          	lw	a1,24(sp)
    8d04:	000b0613          	mv	a2,s6
    8d08:	00040513          	mv	a0,s0
    8d0c:	480010ef          	jal	a18c <__lshift>
    8d10:	00a12c23          	sw	a0,24(sp)
    8d14:	03412783          	lw	a5,52(sp)
    8d18:	12079a63          	bnez	a5,8e4c <_dtoa_r+0xc28>
    8d1c:	45805263          	blez	s8,9160 <_dtoa_r+0xf3c>
    8d20:	02812783          	lw	a5,40(sp)
    8d24:	24079e63          	bnez	a5,8f80 <_dtoa_r+0xd5c>
    8d28:	02012783          	lw	a5,32(sp)
    8d2c:	00178a13          	add	s4,a5,1
    8d30:	01812b03          	lw	s6,24(sp)
    8d34:	00100993          	li	s3,1
    8d38:	0200006f          	j	8d58 <_dtoa_r+0xb34>
    8d3c:	00048593          	mv	a1,s1
    8d40:	00000693          	li	a3,0
    8d44:	00a00613          	li	a2,10
    8d48:	00040513          	mv	a0,s0
    8d4c:	49d000ef          	jal	99e8 <__multadd>
    8d50:	00050493          	mv	s1,a0
    8d54:	00198993          	add	s3,s3,1
    8d58:	000b0593          	mv	a1,s6
    8d5c:	00048513          	mv	a0,s1
    8d60:	a64ff0ef          	jal	7fc4 <quorem>
    8d64:	03050b93          	add	s7,a0,48
    8d68:	013a87b3          	add	a5,s5,s3
    8d6c:	ff778fa3          	sb	s7,-1(a5)
    8d70:	fd89c6e3          	blt	s3,s8,8d3c <_dtoa_r+0xb18>
    8d74:	00100993          	li	s3,1
    8d78:	55804263          	bgtz	s8,92bc <_dtoa_r+0x1098>
    8d7c:	013a89b3          	add	s3,s5,s3
    8d80:	00000c13          	li	s8,0
    8d84:	00048593          	mv	a1,s1
    8d88:	00100613          	li	a2,1
    8d8c:	00040513          	mv	a0,s0
    8d90:	3fc010ef          	jal	a18c <__lshift>
    8d94:	01812583          	lw	a1,24(sp)
    8d98:	00050493          	mv	s1,a0
    8d9c:	580010ef          	jal	a31c <__mcmp>
    8da0:	4ea05c63          	blez	a0,9298 <_dtoa_r+0x1074>
    8da4:	03900693          	li	a3,57
    8da8:	0080006f          	j	8db0 <_dtoa_r+0xb8c>
    8dac:	5f3a8863          	beq	s5,s3,939c <_dtoa_r+0x1178>
    8db0:	fff9c783          	lbu	a5,-1(s3)
    8db4:	00098d13          	mv	s10,s3
    8db8:	fff98993          	add	s3,s3,-1
    8dbc:	fed788e3          	beq	a5,a3,8dac <_dtoa_r+0xb88>
    8dc0:	00178793          	add	a5,a5,1
    8dc4:	00f98023          	sb	a5,0(s3)
    8dc8:	01812583          	lw	a1,24(sp)
    8dcc:	00040513          	mv	a0,s0
    8dd0:	3f5000ef          	jal	99c4 <_Bfree>
    8dd4:	02090263          	beqz	s2,8df8 <_dtoa_r+0xbd4>
    8dd8:	000c0a63          	beqz	s8,8dec <_dtoa_r+0xbc8>
    8ddc:	012c0863          	beq	s8,s2,8dec <_dtoa_r+0xbc8>
    8de0:	000c0593          	mv	a1,s8
    8de4:	00040513          	mv	a0,s0
    8de8:	3dd000ef          	jal	99c4 <_Bfree>
    8dec:	00090593          	mv	a1,s2
    8df0:	00040513          	mv	a0,s0
    8df4:	3d1000ef          	jal	99c4 <_Bfree>
    8df8:	00048593          	mv	a1,s1
    8dfc:	00040513          	mv	a0,s0
    8e00:	3c5000ef          	jal	99c4 <_Bfree>
    8e04:	00c12783          	lw	a5,12(sp)
    8e08:	000d0023          	sb	zero,0(s10)
    8e0c:	0147a023          	sw	s4,0(a5)
    8e10:	00812783          	lw	a5,8(sp)
    8e14:	00078463          	beqz	a5,8e1c <_dtoa_r+0xbf8>
    8e18:	01a7a023          	sw	s10,0(a5)
    8e1c:	09012b03          	lw	s6,144(sp)
    8e20:	08c12b83          	lw	s7,140(sp)
    8e24:	08812c03          	lw	s8,136(sp)
    8e28:	08412c83          	lw	s9,132(sp)
    8e2c:	08012d03          	lw	s10,128(sp)
    8e30:	ce4ff06f          	j	8314 <_dtoa_r+0xf0>
    8e34:	00048593          	mv	a1,s1
    8e38:	00078613          	mv	a2,a5
    8e3c:	00040513          	mv	a0,s0
    8e40:	34c010ef          	jal	a18c <__lshift>
    8e44:	00050493          	mv	s1,a0
    8e48:	eb5ff06f          	j	8cfc <_dtoa_r+0xad8>
    8e4c:	01812583          	lw	a1,24(sp)
    8e50:	00048513          	mv	a0,s1
    8e54:	4c8010ef          	jal	a31c <__mcmp>
    8e58:	ec0552e3          	bgez	a0,8d1c <_dtoa_r+0xaf8>
    8e5c:	02012783          	lw	a5,32(sp)
    8e60:	00048593          	mv	a1,s1
    8e64:	00000693          	li	a3,0
    8e68:	00a00613          	li	a2,10
    8e6c:	00040513          	mv	a0,s0
    8e70:	fff78b13          	add	s6,a5,-1
    8e74:	375000ef          	jal	99e8 <__multadd>
    8e78:	02812783          	lw	a5,40(sp)
    8e7c:	00050493          	mv	s1,a0
    8e80:	0c079e63          	bnez	a5,8f5c <_dtoa_r+0xd38>
    8e84:	03c12c03          	lw	s8,60(sp)
    8e88:	17805ee3          	blez	s8,9804 <_dtoa_r+0x15e0>
    8e8c:	02012a03          	lw	s4,32(sp)
    8e90:	ea1ff06f          	j	8d30 <_dtoa_r+0xb0c>
    8e94:	00100793          	li	a5,1
    8e98:	02f12a23          	sw	a5,52(sp)
    8e9c:	e28ff06f          	j	84c4 <_dtoa_r+0x2a0>
    8ea0:	01c00793          	li	a5,28
    8ea4:	e3dff06f          	j	8ce0 <_dtoa_r+0xabc>
    8ea8:	00100713          	li	a4,1
    8eac:	4d475463          	bge	a4,s4,9374 <_dtoa_r+0x1150>
    8eb0:	03012783          	lw	a5,48(sp)
    8eb4:	fffc0b93          	add	s7,s8,-1
    8eb8:	4177ca63          	blt	a5,s7,92cc <_dtoa_r+0x10a8>
    8ebc:	41778bb3          	sub	s7,a5,s7
    8ec0:	01012783          	lw	a5,16(sp)
    8ec4:	41878cb3          	sub	s9,a5,s8
    8ec8:	100c54e3          	bgez	s8,97d0 <_dtoa_r+0x15ac>
    8ecc:	00100593          	li	a1,1
    8ed0:	00040513          	mv	a0,s0
    8ed4:	5f1000ef          	jal	9cc4 <__i2b>
    8ed8:	00050913          	mv	s2,a0
    8edc:	d79ff06f          	j	8c54 <_dtoa_r+0xa30>
    8ee0:	02012a23          	sw	zero,52(sp)
    8ee4:	00012823          	sw	zero,16(sp)
    8ee8:	ab5042e3          	bgtz	s5,898c <_dtoa_r+0x768>
    8eec:	00100793          	li	a5,1
    8ef0:	415787b3          	sub	a5,a5,s5
    8ef4:	00f12823          	sw	a5,16(sp)
    8ef8:	00000b13          	li	s6,0
    8efc:	a91ff06f          	j	898c <_dtoa_r+0x768>
    8f00:	40e787b3          	sub	a5,a5,a4
    8f04:	00fd9533          	sll	a0,s11,a5
    8f08:	ca0ff06f          	j	83a8 <_dtoa_r+0x184>
    8f0c:	00300793          	li	a5,3
    8f10:	00100913          	li	s2,1
    8f14:	44fa0c63          	beq	s4,a5,936c <_dtoa_r+0x1148>
    8f18:	df47cc63          	blt	a5,s4,8510 <_dtoa_r+0x2ec>
    8f1c:	00200793          	li	a5,2
    8f20:	18fa00e3          	beq	s4,a5,98a0 <_dtoa_r+0x167c>
    8f24:	02042e23          	sw	zero,60(s0)
    8f28:	00000593          	li	a1,0
    8f2c:	00040513          	mv	a0,s0
    8f30:	1e1000ef          	jal	9910 <_Balloc>
    8f34:	00050a93          	mv	s5,a0
    8f38:	140500e3          	beqz	a0,9878 <_dtoa_r+0x1654>
    8f3c:	00100793          	li	a5,1
    8f40:	02f12423          	sw	a5,40(sp)
    8f44:	fff00793          	li	a5,-1
    8f48:	02a42c23          	sw	a0,56(s0)
    8f4c:	02f12e23          	sw	a5,60(sp)
    8f50:	fff00c13          	li	s8,-1
    8f54:	00012a23          	sw	zero,20(sp)
    8f58:	b35ff06f          	j	8a8c <_dtoa_r+0x868>
    8f5c:	00090593          	mv	a1,s2
    8f60:	00000693          	li	a3,0
    8f64:	00a00613          	li	a2,10
    8f68:	00040513          	mv	a0,s0
    8f6c:	27d000ef          	jal	99e8 <__multadd>
    8f70:	03c12c03          	lw	s8,60(sp)
    8f74:	00050913          	mv	s2,a0
    8f78:	0b805ae3          	blez	s8,982c <_dtoa_r+0x1608>
    8f7c:	03612023          	sw	s6,32(sp)
    8f80:	01905c63          	blez	s9,8f98 <_dtoa_r+0xd74>
    8f84:	00090593          	mv	a1,s2
    8f88:	000c8613          	mv	a2,s9
    8f8c:	00040513          	mv	a0,s0
    8f90:	1fc010ef          	jal	a18c <__lshift>
    8f94:	00050913          	mv	s2,a0
    8f98:	00090b13          	mv	s6,s2
    8f9c:	50099e63          	bnez	s3,94b8 <_dtoa_r+0x1294>
    8fa0:	02412783          	lw	a5,36(sp)
    8fa4:	fffa8d13          	add	s10,s5,-1
    8fa8:	000a8c93          	mv	s9,s5
    8fac:	01512823          	sw	s5,16(sp)
    8fb0:	01812a83          	lw	s5,24(sp)
    8fb4:	0017f793          	and	a5,a5,1
    8fb8:	018d0d33          	add	s10,s10,s8
    8fbc:	00f12023          	sw	a5,0(sp)
    8fc0:	01b12a23          	sw	s11,20(sp)
    8fc4:	000a8593          	mv	a1,s5
    8fc8:	00048513          	mv	a0,s1
    8fcc:	ff9fe0ef          	jal	7fc4 <quorem>
    8fd0:	00050c13          	mv	s8,a0
    8fd4:	00090593          	mv	a1,s2
    8fd8:	00048513          	mv	a0,s1
    8fdc:	340010ef          	jal	a31c <__mcmp>
    8fe0:	00050993          	mv	s3,a0
    8fe4:	000b0613          	mv	a2,s6
    8fe8:	000a8593          	mv	a1,s5
    8fec:	00040513          	mv	a0,s0
    8ff0:	384010ef          	jal	a374 <__mdiff>
    8ff4:	00c52703          	lw	a4,12(a0)
    8ff8:	030c0b93          	add	s7,s8,48
    8ffc:	00050d93          	mv	s11,a0
    9000:	08071c63          	bnez	a4,9098 <_dtoa_r+0xe74>
    9004:	00050593          	mv	a1,a0
    9008:	00048513          	mv	a0,s1
    900c:	310010ef          	jal	a31c <__mcmp>
    9010:	00050713          	mv	a4,a0
    9014:	000d8593          	mv	a1,s11
    9018:	00040513          	mv	a0,s0
    901c:	00070d93          	mv	s11,a4
    9020:	1a5000ef          	jal	99c4 <_Bfree>
    9024:	014de6b3          	or	a3,s11,s4
    9028:	0e069a63          	bnez	a3,911c <_dtoa_r+0xef8>
    902c:	00012783          	lw	a5,0(sp)
    9030:	76078e63          	beqz	a5,97ac <_dtoa_r+0x1588>
    9034:	7809c663          	bltz	s3,97c0 <_dtoa_r+0x159c>
    9038:	017c8023          	sb	s7,0(s9)
    903c:	001c8993          	add	s3,s9,1
    9040:	679d0e63          	beq	s10,s9,96bc <_dtoa_r+0x1498>
    9044:	00048593          	mv	a1,s1
    9048:	00000693          	li	a3,0
    904c:	00a00613          	li	a2,10
    9050:	00040513          	mv	a0,s0
    9054:	195000ef          	jal	99e8 <__multadd>
    9058:	00050493          	mv	s1,a0
    905c:	00000693          	li	a3,0
    9060:	00a00613          	li	a2,10
    9064:	00090593          	mv	a1,s2
    9068:	00040513          	mv	a0,s0
    906c:	09690e63          	beq	s2,s6,9108 <_dtoa_r+0xee4>
    9070:	179000ef          	jal	99e8 <__multadd>
    9074:	000b0593          	mv	a1,s6
    9078:	00050913          	mv	s2,a0
    907c:	00000693          	li	a3,0
    9080:	00a00613          	li	a2,10
    9084:	00040513          	mv	a0,s0
    9088:	161000ef          	jal	99e8 <__multadd>
    908c:	00050b13          	mv	s6,a0
    9090:	00098c93          	mv	s9,s3
    9094:	f31ff06f          	j	8fc4 <_dtoa_r+0xda0>
    9098:	00050593          	mv	a1,a0
    909c:	00040513          	mv	a0,s0
    90a0:	01012a83          	lw	s5,16(sp)
    90a4:	01412d83          	lw	s11,20(sp)
    90a8:	11d000ef          	jal	99c4 <_Bfree>
    90ac:	0009ca63          	bltz	s3,90c0 <_dtoa_r+0xe9c>
    90b0:	001df713          	and	a4,s11,1
    90b4:	0149e9b3          	or	s3,s3,s4
    90b8:	01376733          	or	a4,a4,s3
    90bc:	06071e63          	bnez	a4,9138 <_dtoa_r+0xf14>
    90c0:	00048593          	mv	a1,s1
    90c4:	00100613          	li	a2,1
    90c8:	00040513          	mv	a0,s0
    90cc:	0c0010ef          	jal	a18c <__lshift>
    90d0:	01812583          	lw	a1,24(sp)
    90d4:	00050493          	mv	s1,a0
    90d8:	244010ef          	jal	a31c <__mcmp>
    90dc:	24a05863          	blez	a0,932c <_dtoa_r+0x1108>
    90e0:	03900713          	li	a4,57
    90e4:	24eb8c63          	beq	s7,a4,933c <_dtoa_r+0x1118>
    90e8:	031c0b93          	add	s7,s8,49
    90ec:	02012783          	lw	a5,32(sp)
    90f0:	00090c13          	mv	s8,s2
    90f4:	001c8d13          	add	s10,s9,1
    90f8:	017c8023          	sb	s7,0(s9)
    90fc:	00178a13          	add	s4,a5,1
    9100:	000b0913          	mv	s2,s6
    9104:	cc5ff06f          	j	8dc8 <_dtoa_r+0xba4>
    9108:	0e1000ef          	jal	99e8 <__multadd>
    910c:	00050913          	mv	s2,a0
    9110:	00050b13          	mv	s6,a0
    9114:	00098c93          	mv	s9,s3
    9118:	eadff06f          	j	8fc4 <_dtoa_r+0xda0>
    911c:	7409c863          	bltz	s3,986c <_dtoa_r+0x1648>
    9120:	00012783          	lw	a5,0(sp)
    9124:	0149e9b3          	or	s3,s3,s4
    9128:	0137e9b3          	or	s3,a5,s3
    912c:	74098063          	beqz	s3,986c <_dtoa_r+0x1648>
    9130:	f1b054e3          	blez	s11,9038 <_dtoa_r+0xe14>
    9134:	01012a83          	lw	s5,16(sp)
    9138:	03900713          	li	a4,57
    913c:	20eb8063          	beq	s7,a4,933c <_dtoa_r+0x1118>
    9140:	02012703          	lw	a4,32(sp)
    9144:	001b8793          	add	a5,s7,1
    9148:	00090c13          	mv	s8,s2
    914c:	001c8d13          	add	s10,s9,1
    9150:	00170a13          	add	s4,a4,1
    9154:	00fc8023          	sb	a5,0(s9)
    9158:	000b0913          	mv	s2,s6
    915c:	c6dff06f          	j	8dc8 <_dtoa_r+0xba4>
    9160:	00200793          	li	a5,2
    9164:	bb47dee3          	bge	a5,s4,8d20 <_dtoa_r+0xafc>
    9168:	000a8d13          	mv	s10,s5
    916c:	9a0c10e3          	bnez	s8,8b0c <_dtoa_r+0x8e8>
    9170:	01812583          	lw	a1,24(sp)
    9174:	00000693          	li	a3,0
    9178:	00500613          	li	a2,5
    917c:	00040513          	mv	a0,s0
    9180:	069000ef          	jal	99e8 <__multadd>
    9184:	00050593          	mv	a1,a0
    9188:	00a12c23          	sw	a0,24(sp)
    918c:	00048513          	mv	a0,s1
    9190:	18c010ef          	jal	a31c <__mcmp>
    9194:	96a05ce3          	blez	a0,8b0c <_dtoa_r+0x8e8>
    9198:	03100793          	li	a5,49
    919c:	00fa8023          	sb	a5,0(s5)
    91a0:	02012783          	lw	a5,32(sp)
    91a4:	001a8d13          	add	s10,s5,1
    91a8:	00178a13          	add	s4,a5,1
    91ac:	01812583          	lw	a1,24(sp)
    91b0:	00040513          	mv	a0,s0
    91b4:	001a0a13          	add	s4,s4,1
    91b8:	00d000ef          	jal	99c4 <_Bfree>
    91bc:	c20918e3          	bnez	s2,8dec <_dtoa_r+0xbc8>
    91c0:	c39ff06f          	j	8df8 <_dtoa_r+0xbd4>
    91c4:	00050593          	mv	a1,a0
    91c8:	00098613          	mv	a2,s3
    91cc:	00040513          	mv	a0,s0
    91d0:	66d000ef          	jal	a03c <__pow5mult>
    91d4:	00100793          	li	a5,1
    91d8:	00a12c23          	sw	a0,24(sp)
    91dc:	1147de63          	bge	a5,s4,92f8 <_dtoa_r+0x10d4>
    91e0:	00000993          	li	s3,0
    91e4:	01812703          	lw	a4,24(sp)
    91e8:	01072783          	lw	a5,16(a4)
    91ec:	00378793          	add	a5,a5,3
    91f0:	00279793          	sll	a5,a5,0x2
    91f4:	00f707b3          	add	a5,a4,a5
    91f8:	0047a503          	lw	a0,4(a5)
    91fc:	171000ef          	jal	9b6c <__hi0bits>
    9200:	02000793          	li	a5,32
    9204:	40a787b3          	sub	a5,a5,a0
    9208:	ab5ff06f          	j	8cbc <_dtoa_r+0xa98>
    920c:	02412783          	lw	a5,36(sp)
    9210:	04079063          	bnez	a5,9250 <_dtoa_r+0x102c>
    9214:	00012783          	lw	a5,0(sp)
    9218:	00c79793          	sll	a5,a5,0xc
    921c:	02079a63          	bnez	a5,9250 <_dtoa_r+0x102c>
    9220:	00012683          	lw	a3,0(sp)
    9224:	00000793          	li	a5,0
    9228:	0146d713          	srl	a4,a3,0x14
    922c:	7ff77713          	and	a4,a4,2047
    9230:	00070c63          	beqz	a4,9248 <_dtoa_r+0x1024>
    9234:	01012783          	lw	a5,16(sp)
    9238:	001b0b13          	add	s6,s6,1
    923c:	00178793          	add	a5,a5,1
    9240:	00f12823          	sw	a5,16(sp)
    9244:	00100793          	li	a5,1
    9248:	58099063          	bnez	s3,97c8 <_dtoa_r+0x15a4>
    924c:	00078993          	mv	s3,a5
    9250:	00100793          	li	a5,1
    9254:	a69ff06f          	j	8cbc <_dtoa_r+0xa98>
    9258:	a8d70ee3          	beq	a4,a3,8cf4 <_dtoa_r+0xad0>
    925c:	03c00713          	li	a4,60
    9260:	40f707b3          	sub	a5,a4,a5
    9264:	a7dff06f          	j	8ce0 <_dtoa_r+0xabc>
    9268:	00100793          	li	a5,1
    926c:	00500a13          	li	s4,5
    9270:	02f12423          	sw	a5,40(sp)
    9274:	01412783          	lw	a5,20(sp)
    9278:	02012703          	lw	a4,32(sp)
    927c:	00e787b3          	add	a5,a5,a4
    9280:	00178c13          	add	s8,a5,1
    9284:	02f12e23          	sw	a5,60(sp)
    9288:	000c0613          	mv	a2,s8
    928c:	ab804263          	bgtz	s8,8530 <_dtoa_r+0x30c>
    9290:	00100613          	li	a2,1
    9294:	a9cff06f          	j	8530 <_dtoa_r+0x30c>
    9298:	00051663          	bnez	a0,92a4 <_dtoa_r+0x1080>
    929c:	001bf793          	and	a5,s7,1
    92a0:	b00792e3          	bnez	a5,8da4 <_dtoa_r+0xb80>
    92a4:	03000693          	li	a3,48
    92a8:	fff9c783          	lbu	a5,-1(s3)
    92ac:	00098d13          	mv	s10,s3
    92b0:	fff98993          	add	s3,s3,-1
    92b4:	fed78ae3          	beq	a5,a3,92a8 <_dtoa_r+0x1084>
    92b8:	b11ff06f          	j	8dc8 <_dtoa_r+0xba4>
    92bc:	000c0993          	mv	s3,s8
    92c0:	abdff06f          	j	8d7c <_dtoa_r+0xb58>
    92c4:	000b0793          	mv	a5,s6
    92c8:	99dff06f          	j	8c64 <_dtoa_r+0xa40>
    92cc:	03012783          	lw	a5,48(sp)
    92d0:	01012703          	lw	a4,16(sp)
    92d4:	03712823          	sw	s7,48(sp)
    92d8:	40fb87b3          	sub	a5,s7,a5
    92dc:	00f989b3          	add	s3,s3,a5
    92e0:	018707b3          	add	a5,a4,s8
    92e4:	00070c93          	mv	s9,a4
    92e8:	018b0b33          	add	s6,s6,s8
    92ec:	00f12823          	sw	a5,16(sp)
    92f0:	00000b93          	li	s7,0
    92f4:	bd9ff06f          	j	8ecc <_dtoa_r+0xca8>
    92f8:	02412783          	lw	a5,36(sp)
    92fc:	ee0792e3          	bnez	a5,91e0 <_dtoa_r+0xfbc>
    9300:	00012783          	lw	a5,0(sp)
    9304:	00c79793          	sll	a5,a5,0xc
    9308:	ec079ce3          	bnez	a5,91e0 <_dtoa_r+0xfbc>
    930c:	f15ff06f          	j	9220 <_dtoa_r+0xffc>
    9310:	01812303          	lw	t1,24(sp)
    9314:	01c12d03          	lw	s10,28(sp)
    9318:	00200913          	li	s2,2
    931c:	ad0ff06f          	j	85ec <_dtoa_r+0x3c8>
    9320:	00200a13          	li	s4,2
    9324:	02012423          	sw	zero,40(sp)
    9328:	9f8ff06f          	j	8520 <_dtoa_r+0x2fc>
    932c:	dc0510e3          	bnez	a0,90ec <_dtoa_r+0xec8>
    9330:	001bf713          	and	a4,s7,1
    9334:	da0716e3          	bnez	a4,90e0 <_dtoa_r+0xebc>
    9338:	db5ff06f          	j	90ec <_dtoa_r+0xec8>
    933c:	03900793          	li	a5,57
    9340:	00fc8023          	sb	a5,0(s9)
    9344:	02012783          	lw	a5,32(sp)
    9348:	00090c13          	mv	s8,s2
    934c:	001c8993          	add	s3,s9,1
    9350:	00178a13          	add	s4,a5,1
    9354:	000b0913          	mv	s2,s6
    9358:	a4dff06f          	j	8da4 <_dtoa_r+0xb80>
    935c:	00100793          	li	a5,1
    9360:	00100c13          	li	s8,1
    9364:	00f12a23          	sw	a5,20(sp)
    9368:	e50ff06f          	j	89b8 <_dtoa_r+0x794>
    936c:	02012423          	sw	zero,40(sp)
    9370:	f05ff06f          	j	9274 <_dtoa_r+0x1050>
    9374:	03812703          	lw	a4,56(sp)
    9378:	30070e63          	beqz	a4,9694 <_dtoa_r+0x1470>
    937c:	01012703          	lw	a4,16(sp)
    9380:	43378793          	add	a5,a5,1075
    9384:	00fb0b33          	add	s6,s6,a5
    9388:	00f707b3          	add	a5,a4,a5
    938c:	03012b83          	lw	s7,48(sp)
    9390:	00070c93          	mv	s9,a4
    9394:	00f12823          	sw	a5,16(sp)
    9398:	b35ff06f          	j	8ecc <_dtoa_r+0xca8>
    939c:	03100793          	li	a5,49
    93a0:	00fa8023          	sb	a5,0(s5)
    93a4:	001a0a13          	add	s4,s4,1
    93a8:	a21ff06f          	j	8dc8 <_dtoa_r+0xba4>
    93ac:	02012783          	lw	a5,32(sp)
    93b0:	32078263          	beqz	a5,96d4 <_dtoa_r+0x14b0>
    93b4:	40f00bb3          	neg	s7,a5
    93b8:	00fbf713          	and	a4,s7,15
    93bc:	00371713          	sll	a4,a4,0x3
    93c0:	00006797          	auipc	a5,0x6
    93c4:	62878793          	add	a5,a5,1576 # f9e8 <__mprec_tens>
    93c8:	00e787b3          	add	a5,a5,a4
    93cc:	0007a603          	lw	a2,0(a5)
    93d0:	0047a683          	lw	a3,4(a5)
    93d4:	01812503          	lw	a0,24(sp)
    93d8:	01c12583          	lw	a1,28(sp)
    93dc:	404bdb93          	sra	s7,s7,0x4
    93e0:	3d4040ef          	jal	d7b4 <__muldf3>
    93e4:	00058d13          	mv	s10,a1
    93e8:	440b8c63          	beqz	s7,9840 <_dtoa_r+0x161c>
    93ec:	00200913          	li	s2,2
    93f0:	04812023          	sw	s0,64(sp)
    93f4:	00006c97          	auipc	s9,0x6
    93f8:	5ccc8c93          	add	s9,s9,1484 # f9c0 <__mprec_bigtens>
    93fc:	00090413          	mv	s0,s2
    9400:	00050713          	mv	a4,a0
    9404:	00000613          	li	a2,0
    9408:	00050913          	mv	s2,a0
    940c:	001bf693          	and	a3,s7,1
    9410:	02068063          	beqz	a3,9430 <_dtoa_r+0x120c>
    9414:	000ca603          	lw	a2,0(s9)
    9418:	004ca683          	lw	a3,4(s9)
    941c:	00070513          	mv	a0,a4
    9420:	00140413          	add	s0,s0,1
    9424:	390040ef          	jal	d7b4 <__muldf3>
    9428:	00050713          	mv	a4,a0
    942c:	00100613          	li	a2,1
    9430:	401bdb93          	sra	s7,s7,0x1
    9434:	008c8c93          	add	s9,s9,8
    9438:	fc0b9ae3          	bnez	s7,940c <_dtoa_r+0x11e8>
    943c:	00090513          	mv	a0,s2
    9440:	00058793          	mv	a5,a1
    9444:	00040913          	mv	s2,s0
    9448:	04012403          	lw	s0,64(sp)
    944c:	a0061a63          	bnez	a2,8660 <_dtoa_r+0x43c>
    9450:	00050713          	mv	a4,a0
    9454:	000d0793          	mv	a5,s10
    9458:	a08ff06f          	j	8660 <_dtoa_r+0x43c>
    945c:	00068593          	mv	a1,a3
    9460:	00070613          	mv	a2,a4
    9464:	00070513          	mv	a0,a4
    9468:	745020ef          	jal	c3ac <__adddf3>
    946c:	02012783          	lw	a5,32(sp)
    9470:	00090613          	mv	a2,s2
    9474:	00098693          	mv	a3,s3
    9478:	00178a13          	add	s4,a5,1
    947c:	00050c93          	mv	s9,a0
    9480:	00058b13          	mv	s6,a1
    9484:	000a0c13          	mv	s8,s4
    9488:	124040ef          	jal	d5ac <__gedf2>
    948c:	c4a04863          	bgtz	a0,88dc <_dtoa_r+0x6b8>
    9490:	000c8513          	mv	a0,s9
    9494:	000b0593          	mv	a1,s6
    9498:	00090613          	mv	a2,s2
    949c:	00098693          	mv	a3,s3
    94a0:	080040ef          	jal	d520 <__eqdf2>
    94a4:	00051663          	bnez	a0,94b0 <_dtoa_r+0x128c>
    94a8:	001d7d13          	and	s10,s10,1
    94ac:	c20d1863          	bnez	s10,88dc <_dtoa_r+0x6b8>
    94b0:	000b8d13          	mv	s10,s7
    94b4:	945ff06f          	j	8df8 <_dtoa_r+0xbd4>
    94b8:	00492583          	lw	a1,4(s2)
    94bc:	00040513          	mv	a0,s0
    94c0:	450000ef          	jal	9910 <_Balloc>
    94c4:	00050993          	mv	s3,a0
    94c8:	38050463          	beqz	a0,9850 <_dtoa_r+0x162c>
    94cc:	01092603          	lw	a2,16(s2)
    94d0:	00c90593          	add	a1,s2,12
    94d4:	00c50513          	add	a0,a0,12
    94d8:	00260613          	add	a2,a2,2
    94dc:	00261613          	sll	a2,a2,0x2
    94e0:	ccdf70ef          	jal	11ac <memcpy>
    94e4:	00100613          	li	a2,1
    94e8:	00098593          	mv	a1,s3
    94ec:	00040513          	mv	a0,s0
    94f0:	49d000ef          	jal	a18c <__lshift>
    94f4:	00050b13          	mv	s6,a0
    94f8:	aa9ff06f          	j	8fa0 <_dtoa_r+0xd7c>
    94fc:	00090593          	mv	a1,s2
    9500:	000b8613          	mv	a2,s7
    9504:	00040513          	mv	a0,s0
    9508:	335000ef          	jal	a03c <__pow5mult>
    950c:	00048613          	mv	a2,s1
    9510:	00050593          	mv	a1,a0
    9514:	00050913          	mv	s2,a0
    9518:	00040513          	mv	a0,s0
    951c:	059000ef          	jal	9d74 <__multiply>
    9520:	00050793          	mv	a5,a0
    9524:	00048593          	mv	a1,s1
    9528:	00040513          	mv	a0,s0
    952c:	00078493          	mv	s1,a5
    9530:	494000ef          	jal	99c4 <_Bfree>
    9534:	03012783          	lw	a5,48(sp)
    9538:	417787b3          	sub	a5,a5,s7
    953c:	02f12823          	sw	a5,48(sp)
    9540:	f6078063          	beqz	a5,8ca0 <_dtoa_r+0xa7c>
    9544:	f48ff06f          	j	8c8c <_dtoa_r+0xa68>
    9548:	05012603          	lw	a2,80(sp)
    954c:	05412683          	lw	a3,84(sp)
    9550:	05812503          	lw	a0,88(sp)
    9554:	04b12623          	sw	a1,76(sp)
    9558:	000b8593          	mv	a1,s7
    955c:	02612423          	sw	t1,40(sp)
    9560:	254040ef          	jal	d7b4 <__muldf3>
    9564:	02812303          	lw	t1,40(sp)
    9568:	04812783          	lw	a5,72(sp)
    956c:	00100693          	li	a3,1
    9570:	006a8023          	sb	t1,0(s5)
    9574:	02a12c23          	sw	a0,56(sp)
    9578:	04c12883          	lw	a7,76(sp)
    957c:	00058913          	mv	s2,a1
    9580:	00fa8bb3          	add	s7,s5,a5
    9584:	7fff7617          	auipc	a2,0x7fff7
    9588:	17460613          	add	a2,a2,372 # 800006f8 <__global_locale+0x1c4>
    958c:	28d78c63          	beq	a5,a3,9824 <_dtoa_r+0x1600>
    9590:	00062783          	lw	a5,0(a2)
    9594:	00462803          	lw	a6,4(a2)
    9598:	04912423          	sw	s1,72(sp)
    959c:	02f12423          	sw	a5,40(sp)
    95a0:	03012623          	sw	a6,44(sp)
    95a4:	04812623          	sw	s0,76(sp)
    95a8:	000c8513          	mv	a0,s9
    95ac:	00088593          	mv	a1,a7
    95b0:	02812603          	lw	a2,40(sp)
    95b4:	02c12683          	lw	a3,44(sp)
    95b8:	001d0d13          	add	s10,s10,1
    95bc:	1f8040ef          	jal	d7b4 <__muldf3>
    95c0:	00058413          	mv	s0,a1
    95c4:	00050493          	mv	s1,a0
    95c8:	2d8050ef          	jal	e8a0 <__fixdfsi>
    95cc:	00050c93          	mv	s9,a0
    95d0:	354050ef          	jal	e924 <__floatsidf>
    95d4:	00050613          	mv	a2,a0
    95d8:	00058693          	mv	a3,a1
    95dc:	00048513          	mv	a0,s1
    95e0:	00040593          	mv	a1,s0
    95e4:	030c8c93          	add	s9,s9,48
    95e8:	15d040ef          	jal	df44 <__subdf3>
    95ec:	ff9d0fa3          	sb	s9,-1(s10)
    95f0:	fdab90e3          	bne	s7,s10,95b0 <_dtoa_r+0x138c>
    95f4:	04812483          	lw	s1,72(sp)
    95f8:	04c12403          	lw	s0,76(sp)
    95fc:	00050c93          	mv	s9,a0
    9600:	00058893          	mv	a7,a1
    9604:	7fff7d17          	auipc	s10,0x7fff7
    9608:	0bcd0d13          	add	s10,s10,188 # 800006c0 <__global_locale+0x18c>
    960c:	000d2603          	lw	a2,0(s10)
    9610:	004d2683          	lw	a3,4(s10)
    9614:	03812503          	lw	a0,56(sp)
    9618:	00090593          	mv	a1,s2
    961c:	03112423          	sw	a7,40(sp)
    9620:	58d020ef          	jal	c3ac <__adddf3>
    9624:	02812883          	lw	a7,40(sp)
    9628:	000c8613          	mv	a2,s9
    962c:	00088693          	mv	a3,a7
    9630:	07c040ef          	jal	d6ac <__ledf2>
    9634:	1a054863          	bltz	a0,97e4 <_dtoa_r+0x15c0>
    9638:	03812603          	lw	a2,56(sp)
    963c:	000d2503          	lw	a0,0(s10)
    9640:	004d2583          	lw	a1,4(s10)
    9644:	00090693          	mv	a3,s2
    9648:	0fd040ef          	jal	df44 <__subdf3>
    964c:	02812883          	lw	a7,40(sp)
    9650:	000c8613          	mv	a2,s9
    9654:	00088693          	mv	a3,a7
    9658:	755030ef          	jal	d5ac <__gedf2>
    965c:	12a04863          	bgtz	a0,978c <_dtoa_r+0x1568>
    9660:	06c12783          	lw	a5,108(sp)
    9664:	de07c063          	bltz	a5,8c44 <_dtoa_r+0xa20>
    9668:	02012703          	lw	a4,32(sp)
    966c:	00e00793          	li	a5,14
    9670:	dce7ca63          	blt	a5,a4,8c44 <_dtoa_r+0xa20>
    9674:	02012783          	lw	a5,32(sp)
    9678:	00006717          	auipc	a4,0x6
    967c:	37070713          	add	a4,a4,880 # f9e8 <__mprec_tens>
    9680:	00379793          	sll	a5,a5,0x3
    9684:	00f707b3          	add	a5,a4,a5
    9688:	0007a903          	lw	s2,0(a5)
    968c:	0047a983          	lw	s3,4(a5)
    9690:	c90ff06f          	j	8b20 <_dtoa_r+0x8fc>
    9694:	06812703          	lw	a4,104(sp)
    9698:	01012683          	lw	a3,16(sp)
    969c:	03600793          	li	a5,54
    96a0:	40e787b3          	sub	a5,a5,a4
    96a4:	00fb0b33          	add	s6,s6,a5
    96a8:	00f687b3          	add	a5,a3,a5
    96ac:	03012b83          	lw	s7,48(sp)
    96b0:	00068c93          	mv	s9,a3
    96b4:	00f12823          	sw	a5,16(sp)
    96b8:	815ff06f          	j	8ecc <_dtoa_r+0xca8>
    96bc:	02012783          	lw	a5,32(sp)
    96c0:	00090c13          	mv	s8,s2
    96c4:	01012a83          	lw	s5,16(sp)
    96c8:	00178a13          	add	s4,a5,1
    96cc:	000b0913          	mv	s2,s6
    96d0:	eb4ff06f          	j	8d84 <_dtoa_r+0xb60>
    96d4:	01812703          	lw	a4,24(sp)
    96d8:	01c12783          	lw	a5,28(sp)
    96dc:	00200913          	li	s2,2
    96e0:	f81fe06f          	j	8660 <_dtoa_r+0x43c>
    96e4:	b00c0063          	beqz	s8,89e4 <_dtoa_r+0x7c0>
    96e8:	03c12d03          	lw	s10,60(sp)
    96ec:	bba05063          	blez	s10,8a8c <_dtoa_r+0x868>
    96f0:	7fff7617          	auipc	a2,0x7fff7
    96f4:	00860613          	add	a2,a2,8 # 800006f8 <__global_locale+0x1c4>
    96f8:	00078593          	mv	a1,a5
    96fc:	02012783          	lw	a5,32(sp)
    9700:	00462683          	lw	a3,4(a2)
    9704:	00062603          	lw	a2,0(a2)
    9708:	fff78793          	add	a5,a5,-1
    970c:	00070513          	mv	a0,a4
    9710:	04f12e23          	sw	a5,92(sp)
    9714:	0a0040ef          	jal	d7b4 <__muldf3>
    9718:	00050713          	mv	a4,a0
    971c:	00190513          	add	a0,s2,1
    9720:	04e12423          	sw	a4,72(sp)
    9724:	04b12023          	sw	a1,64(sp)
    9728:	1fc050ef          	jal	e924 <__floatsidf>
    972c:	04812703          	lw	a4,72(sp)
    9730:	04012783          	lw	a5,64(sp)
    9734:	00070613          	mv	a2,a4
    9738:	00078693          	mv	a3,a5
    973c:	04e12623          	sw	a4,76(sp)
    9740:	074040ef          	jal	d7b4 <__muldf3>
    9744:	7fff7697          	auipc	a3,0x7fff7
    9748:	fbc68693          	add	a3,a3,-68 # 80000700 <__global_locale+0x1cc>
    974c:	0006a603          	lw	a2,0(a3)
    9750:	0046a683          	lw	a3,4(a3)
    9754:	459020ef          	jal	c3ac <__adddf3>
    9758:	fcc006b7          	lui	a3,0xfcc00
    975c:	04012783          	lw	a5,64(sp)
    9760:	04c12703          	lw	a4,76(sp)
    9764:	00050c93          	mv	s9,a0
    9768:	00b68bb3          	add	s7,a3,a1
    976c:	05a12423          	sw	s10,72(sp)
    9770:	f91fe06f          	j	8700 <_dtoa_r+0x4dc>
    9774:	03100693          	li	a3,49
    9778:	001c0c13          	add	s8,s8,1
    977c:	984ff06f          	j	8900 <_dtoa_r+0x6dc>
    9780:	00012c23          	sw	zero,24(sp)
    9784:	00000913          	li	s2,0
    9788:	a11ff06f          	j	9198 <_dtoa_r+0xf74>
    978c:	03000613          	li	a2,48
    9790:	fffbc783          	lbu	a5,-1(s7)
    9794:	000b8d13          	mv	s10,s7
    9798:	fffb8b93          	add	s7,s7,-1
    979c:	fec78ae3          	beq	a5,a2,9790 <_dtoa_r+0x156c>
    97a0:	05c12783          	lw	a5,92(sp)
    97a4:	00178a13          	add	s4,a5,1
    97a8:	e50ff06f          	j	8df8 <_dtoa_r+0xbd4>
    97ac:	03900713          	li	a4,57
    97b0:	01012a83          	lw	s5,16(sp)
    97b4:	b8eb84e3          	beq	s7,a4,933c <_dtoa_r+0x1118>
    97b8:	933048e3          	bgtz	s3,90e8 <_dtoa_r+0xec4>
    97bc:	931ff06f          	j	90ec <_dtoa_r+0xec8>
    97c0:	01012a83          	lw	s5,16(sp)
    97c4:	929ff06f          	j	90ec <_dtoa_r+0xec8>
    97c8:	00078993          	mv	s3,a5
    97cc:	a19ff06f          	j	91e4 <_dtoa_r+0xfc0>
    97d0:	00078c93          	mv	s9,a5
    97d4:	018787b3          	add	a5,a5,s8
    97d8:	018b0b33          	add	s6,s6,s8
    97dc:	00f12823          	sw	a5,16(sp)
    97e0:	eecff06f          	j	8ecc <_dtoa_r+0xca8>
    97e4:	05c12783          	lw	a5,92(sp)
    97e8:	00178c13          	add	s8,a5,1
    97ec:	8f0ff06f          	j	88dc <_dtoa_r+0x6b8>
    97f0:	04c12983          	lw	s3,76(sp)
    97f4:	05012b03          	lw	s6,80(sp)
    97f8:	05812c03          	lw	s8,88(sp)
    97fc:	04812a03          	lw	s4,72(sp)
    9800:	a8cff06f          	j	8a8c <_dtoa_r+0x868>
    9804:	00200793          	li	a5,2
    9808:	0147c863          	blt	a5,s4,9818 <_dtoa_r+0x15f4>
    980c:	02012a03          	lw	s4,32(sp)
    9810:	03c12c03          	lw	s8,60(sp)
    9814:	d1cff06f          	j	8d30 <_dtoa_r+0xb0c>
    9818:	03c12c03          	lw	s8,60(sp)
    981c:	03612023          	sw	s6,32(sp)
    9820:	949ff06f          	j	9168 <_dtoa_r+0xf44>
    9824:	04012b83          	lw	s7,64(sp)
    9828:	dddff06f          	j	9604 <_dtoa_r+0x13e0>
    982c:	00200793          	li	a5,2
    9830:	ff47c4e3          	blt	a5,s4,9818 <_dtoa_r+0x15f4>
    9834:	03c12c03          	lw	s8,60(sp)
    9838:	03612023          	sw	s6,32(sp)
    983c:	f44ff06f          	j	8f80 <_dtoa_r+0xd5c>
    9840:	00050713          	mv	a4,a0
    9844:	00058793          	mv	a5,a1
    9848:	00200913          	li	s2,2
    984c:	e15fe06f          	j	8660 <_dtoa_r+0x43c>
    9850:	00006697          	auipc	a3,0x6
    9854:	b5868693          	add	a3,a3,-1192 # f3a8 <__fini_array_end+0x334>
    9858:	00000613          	li	a2,0
    985c:	2ef00593          	li	a1,751
    9860:	00006517          	auipc	a0,0x6
    9864:	b5c50513          	add	a0,a0,-1188 # f3bc <__fini_array_end+0x348>
    9868:	0cd010ef          	jal	b134 <__assert_func>
    986c:	01012a83          	lw	s5,16(sp)
    9870:	85b048e3          	bgtz	s11,90c0 <_dtoa_r+0xe9c>
    9874:	879ff06f          	j	90ec <_dtoa_r+0xec8>
    9878:	00006697          	auipc	a3,0x6
    987c:	b3068693          	add	a3,a3,-1232 # f3a8 <__fini_array_end+0x334>
    9880:	00000613          	li	a2,0
    9884:	1af00593          	li	a1,431
    9888:	00006517          	auipc	a0,0x6
    988c:	b3450513          	add	a0,a0,-1228 # f3bc <__fini_array_end+0x348>
    9890:	0a5010ef          	jal	b134 <__assert_func>
    9894:	02042e23          	sw	zero,60(s0)
    9898:	00000593          	li	a1,0
    989c:	cc1fe06f          	j	855c <_dtoa_r+0x338>
    98a0:	02012423          	sw	zero,40(sp)
    98a4:	c7dfe06f          	j	8520 <_dtoa_r+0x2fc>

000098a8 <__ascii_mbtowc>:
    98a8:	02058063          	beqz	a1,98c8 <__ascii_mbtowc+0x20>
    98ac:	04060263          	beqz	a2,98f0 <__ascii_mbtowc+0x48>
    98b0:	04068863          	beqz	a3,9900 <__ascii_mbtowc+0x58>
    98b4:	00064783          	lbu	a5,0(a2)
    98b8:	00f5a023          	sw	a5,0(a1)
    98bc:	00064503          	lbu	a0,0(a2)
    98c0:	00a03533          	snez	a0,a0
    98c4:	00008067          	ret
    98c8:	ff010113          	add	sp,sp,-16
    98cc:	00c10593          	add	a1,sp,12
    98d0:	02060463          	beqz	a2,98f8 <__ascii_mbtowc+0x50>
    98d4:	02068a63          	beqz	a3,9908 <__ascii_mbtowc+0x60>
    98d8:	00064783          	lbu	a5,0(a2)
    98dc:	00f5a023          	sw	a5,0(a1)
    98e0:	00064503          	lbu	a0,0(a2)
    98e4:	00a03533          	snez	a0,a0
    98e8:	01010113          	add	sp,sp,16
    98ec:	00008067          	ret
    98f0:	00000513          	li	a0,0
    98f4:	00008067          	ret
    98f8:	00000513          	li	a0,0
    98fc:	fedff06f          	j	98e8 <__ascii_mbtowc+0x40>
    9900:	ffe00513          	li	a0,-2
    9904:	00008067          	ret
    9908:	ffe00513          	li	a0,-2
    990c:	fddff06f          	j	98e8 <__ascii_mbtowc+0x40>

00009910 <_Balloc>:
    9910:	04452783          	lw	a5,68(a0)
    9914:	ff010113          	add	sp,sp,-16
    9918:	00812423          	sw	s0,8(sp)
    991c:	00912223          	sw	s1,4(sp)
    9920:	00112623          	sw	ra,12(sp)
    9924:	00050413          	mv	s0,a0
    9928:	00058493          	mv	s1,a1
    992c:	02078c63          	beqz	a5,9964 <_Balloc+0x54>
    9930:	00249713          	sll	a4,s1,0x2
    9934:	00e787b3          	add	a5,a5,a4
    9938:	0007a503          	lw	a0,0(a5)
    993c:	04050463          	beqz	a0,9984 <_Balloc+0x74>
    9940:	00052703          	lw	a4,0(a0)
    9944:	00e7a023          	sw	a4,0(a5)
    9948:	00052823          	sw	zero,16(a0)
    994c:	00052623          	sw	zero,12(a0)
    9950:	00c12083          	lw	ra,12(sp)
    9954:	00812403          	lw	s0,8(sp)
    9958:	00412483          	lw	s1,4(sp)
    995c:	01010113          	add	sp,sp,16
    9960:	00008067          	ret
    9964:	02100613          	li	a2,33
    9968:	00400593          	li	a1,4
    996c:	021010ef          	jal	b18c <_calloc_r>
    9970:	04a42223          	sw	a0,68(s0)
    9974:	00050793          	mv	a5,a0
    9978:	fa051ce3          	bnez	a0,9930 <_Balloc+0x20>
    997c:	00000513          	li	a0,0
    9980:	fd1ff06f          	j	9950 <_Balloc+0x40>
    9984:	01212023          	sw	s2,0(sp)
    9988:	00100913          	li	s2,1
    998c:	00991933          	sll	s2,s2,s1
    9990:	00590613          	add	a2,s2,5
    9994:	00261613          	sll	a2,a2,0x2
    9998:	00100593          	li	a1,1
    999c:	00040513          	mv	a0,s0
    99a0:	7ec010ef          	jal	b18c <_calloc_r>
    99a4:	00050a63          	beqz	a0,99b8 <_Balloc+0xa8>
    99a8:	01252423          	sw	s2,8(a0)
    99ac:	00952223          	sw	s1,4(a0)
    99b0:	00012903          	lw	s2,0(sp)
    99b4:	f95ff06f          	j	9948 <_Balloc+0x38>
    99b8:	00012903          	lw	s2,0(sp)
    99bc:	00000513          	li	a0,0
    99c0:	f91ff06f          	j	9950 <_Balloc+0x40>

000099c4 <_Bfree>:
    99c4:	02058063          	beqz	a1,99e4 <_Bfree+0x20>
    99c8:	0045a703          	lw	a4,4(a1)
    99cc:	04452783          	lw	a5,68(a0)
    99d0:	00271713          	sll	a4,a4,0x2
    99d4:	00e787b3          	add	a5,a5,a4
    99d8:	0007a703          	lw	a4,0(a5)
    99dc:	00e5a023          	sw	a4,0(a1)
    99e0:	00b7a023          	sw	a1,0(a5)
    99e4:	00008067          	ret

000099e8 <__multadd>:
    99e8:	fd010113          	add	sp,sp,-48
    99ec:	01412c23          	sw	s4,24(sp)
    99f0:	0105aa03          	lw	s4,16(a1)
    99f4:	01912223          	sw	s9,4(sp)
    99f8:	00010cb7          	lui	s9,0x10
    99fc:	02912223          	sw	s1,36(sp)
    9a00:	03212023          	sw	s2,32(sp)
    9a04:	01312e23          	sw	s3,28(sp)
    9a08:	01512a23          	sw	s5,20(sp)
    9a0c:	01612823          	sw	s6,16(sp)
    9a10:	01712623          	sw	s7,12(sp)
    9a14:	02112623          	sw	ra,44(sp)
    9a18:	02812423          	sw	s0,40(sp)
    9a1c:	01812423          	sw	s8,8(sp)
    9a20:	00058a93          	mv	s5,a1
    9a24:	00050b13          	mv	s6,a0
    9a28:	00060993          	mv	s3,a2
    9a2c:	00068493          	mv	s1,a3
    9a30:	01458913          	add	s2,a1,20
    9a34:	00000b93          	li	s7,0
    9a38:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    9a3c:	00092c03          	lw	s8,0(s2)
    9a40:	00098593          	mv	a1,s3
    9a44:	00490913          	add	s2,s2,4
    9a48:	019c7533          	and	a0,s8,s9
    9a4c:	430050ef          	jal	ee7c <__mulsi3>
    9a50:	00050413          	mv	s0,a0
    9a54:	00098593          	mv	a1,s3
    9a58:	010c5513          	srl	a0,s8,0x10
    9a5c:	00940433          	add	s0,s0,s1
    9a60:	41c050ef          	jal	ee7c <__mulsi3>
    9a64:	01045793          	srl	a5,s0,0x10
    9a68:	00f50533          	add	a0,a0,a5
    9a6c:	01051793          	sll	a5,a0,0x10
    9a70:	01947433          	and	s0,s0,s9
    9a74:	008787b3          	add	a5,a5,s0
    9a78:	fef92e23          	sw	a5,-4(s2)
    9a7c:	001b8b93          	add	s7,s7,1
    9a80:	01055493          	srl	s1,a0,0x10
    9a84:	fb4bcce3          	blt	s7,s4,9a3c <__multadd+0x54>
    9a88:	02048263          	beqz	s1,9aac <__multadd+0xc4>
    9a8c:	008aa783          	lw	a5,8(s5)
    9a90:	04fa5a63          	bge	s4,a5,9ae4 <__multadd+0xfc>
    9a94:	004a0793          	add	a5,s4,4
    9a98:	00279793          	sll	a5,a5,0x2
    9a9c:	00fa87b3          	add	a5,s5,a5
    9aa0:	0097a223          	sw	s1,4(a5)
    9aa4:	001a0a13          	add	s4,s4,1
    9aa8:	014aa823          	sw	s4,16(s5)
    9aac:	02c12083          	lw	ra,44(sp)
    9ab0:	02812403          	lw	s0,40(sp)
    9ab4:	02412483          	lw	s1,36(sp)
    9ab8:	02012903          	lw	s2,32(sp)
    9abc:	01c12983          	lw	s3,28(sp)
    9ac0:	01812a03          	lw	s4,24(sp)
    9ac4:	01012b03          	lw	s6,16(sp)
    9ac8:	00c12b83          	lw	s7,12(sp)
    9acc:	00812c03          	lw	s8,8(sp)
    9ad0:	00412c83          	lw	s9,4(sp)
    9ad4:	000a8513          	mv	a0,s5
    9ad8:	01412a83          	lw	s5,20(sp)
    9adc:	03010113          	add	sp,sp,48
    9ae0:	00008067          	ret
    9ae4:	004aa583          	lw	a1,4(s5)
    9ae8:	000b0513          	mv	a0,s6
    9aec:	00158593          	add	a1,a1,1
    9af0:	e21ff0ef          	jal	9910 <_Balloc>
    9af4:	00050413          	mv	s0,a0
    9af8:	04050c63          	beqz	a0,9b50 <__multadd+0x168>
    9afc:	010aa603          	lw	a2,16(s5)
    9b00:	00ca8593          	add	a1,s5,12
    9b04:	00c50513          	add	a0,a0,12
    9b08:	00260613          	add	a2,a2,2
    9b0c:	00261613          	sll	a2,a2,0x2
    9b10:	e9cf70ef          	jal	11ac <memcpy>
    9b14:	004aa703          	lw	a4,4(s5)
    9b18:	044b2783          	lw	a5,68(s6)
    9b1c:	00271713          	sll	a4,a4,0x2
    9b20:	00e787b3          	add	a5,a5,a4
    9b24:	0007a703          	lw	a4,0(a5)
    9b28:	00eaa023          	sw	a4,0(s5)
    9b2c:	0157a023          	sw	s5,0(a5)
    9b30:	004a0793          	add	a5,s4,4
    9b34:	00040a93          	mv	s5,s0
    9b38:	00279793          	sll	a5,a5,0x2
    9b3c:	00fa87b3          	add	a5,s5,a5
    9b40:	0097a223          	sw	s1,4(a5)
    9b44:	001a0a13          	add	s4,s4,1
    9b48:	014aa823          	sw	s4,16(s5)
    9b4c:	f61ff06f          	j	9aac <__multadd+0xc4>
    9b50:	00006697          	auipc	a3,0x6
    9b54:	85868693          	add	a3,a3,-1960 # f3a8 <__fini_array_end+0x334>
    9b58:	00000613          	li	a2,0
    9b5c:	0ba00593          	li	a1,186
    9b60:	00006517          	auipc	a0,0x6
    9b64:	8dc50513          	add	a0,a0,-1828 # f43c <__fini_array_end+0x3c8>
    9b68:	5cc010ef          	jal	b134 <__assert_func>

00009b6c <__hi0bits>:
    9b6c:	00050793          	mv	a5,a0
    9b70:	00010737          	lui	a4,0x10
    9b74:	00000513          	li	a0,0
    9b78:	00e7f663          	bgeu	a5,a4,9b84 <__hi0bits+0x18>
    9b7c:	01079793          	sll	a5,a5,0x10
    9b80:	01000513          	li	a0,16
    9b84:	01000737          	lui	a4,0x1000
    9b88:	00e7f663          	bgeu	a5,a4,9b94 <__hi0bits+0x28>
    9b8c:	00850513          	add	a0,a0,8
    9b90:	00879793          	sll	a5,a5,0x8
    9b94:	10000737          	lui	a4,0x10000
    9b98:	00e7f663          	bgeu	a5,a4,9ba4 <__hi0bits+0x38>
    9b9c:	00450513          	add	a0,a0,4
    9ba0:	00479793          	sll	a5,a5,0x4
    9ba4:	40000737          	lui	a4,0x40000
    9ba8:	00e7ea63          	bltu	a5,a4,9bbc <__hi0bits+0x50>
    9bac:	fff7c793          	not	a5,a5
    9bb0:	01f7d793          	srl	a5,a5,0x1f
    9bb4:	00f50533          	add	a0,a0,a5
    9bb8:	00008067          	ret
    9bbc:	00279793          	sll	a5,a5,0x2
    9bc0:	0007ca63          	bltz	a5,9bd4 <__hi0bits+0x68>
    9bc4:	00179713          	sll	a4,a5,0x1
    9bc8:	00074a63          	bltz	a4,9bdc <__hi0bits+0x70>
    9bcc:	02000513          	li	a0,32
    9bd0:	00008067          	ret
    9bd4:	00250513          	add	a0,a0,2
    9bd8:	00008067          	ret
    9bdc:	00350513          	add	a0,a0,3
    9be0:	00008067          	ret

00009be4 <__lo0bits>:
    9be4:	00052783          	lw	a5,0(a0)
    9be8:	00050713          	mv	a4,a0
    9bec:	0077f693          	and	a3,a5,7
    9bf0:	02068463          	beqz	a3,9c18 <__lo0bits+0x34>
    9bf4:	0017f693          	and	a3,a5,1
    9bf8:	00000513          	li	a0,0
    9bfc:	04069e63          	bnez	a3,9c58 <__lo0bits+0x74>
    9c00:	0027f693          	and	a3,a5,2
    9c04:	0a068863          	beqz	a3,9cb4 <__lo0bits+0xd0>
    9c08:	0017d793          	srl	a5,a5,0x1
    9c0c:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9c10:	00100513          	li	a0,1
    9c14:	00008067          	ret
    9c18:	01079693          	sll	a3,a5,0x10
    9c1c:	0106d693          	srl	a3,a3,0x10
    9c20:	00000513          	li	a0,0
    9c24:	06068e63          	beqz	a3,9ca0 <__lo0bits+0xbc>
    9c28:	0ff7f693          	zext.b	a3,a5
    9c2c:	06068063          	beqz	a3,9c8c <__lo0bits+0xa8>
    9c30:	00f7f693          	and	a3,a5,15
    9c34:	04068263          	beqz	a3,9c78 <__lo0bits+0x94>
    9c38:	0037f693          	and	a3,a5,3
    9c3c:	02068463          	beqz	a3,9c64 <__lo0bits+0x80>
    9c40:	0017f693          	and	a3,a5,1
    9c44:	00069c63          	bnez	a3,9c5c <__lo0bits+0x78>
    9c48:	0017d793          	srl	a5,a5,0x1
    9c4c:	00150513          	add	a0,a0,1
    9c50:	00079663          	bnez	a5,9c5c <__lo0bits+0x78>
    9c54:	02000513          	li	a0,32
    9c58:	00008067          	ret
    9c5c:	00f72023          	sw	a5,0(a4)
    9c60:	00008067          	ret
    9c64:	0027d793          	srl	a5,a5,0x2
    9c68:	0017f693          	and	a3,a5,1
    9c6c:	00250513          	add	a0,a0,2
    9c70:	fe0696e3          	bnez	a3,9c5c <__lo0bits+0x78>
    9c74:	fd5ff06f          	j	9c48 <__lo0bits+0x64>
    9c78:	0047d793          	srl	a5,a5,0x4
    9c7c:	0037f693          	and	a3,a5,3
    9c80:	00450513          	add	a0,a0,4
    9c84:	fa069ee3          	bnez	a3,9c40 <__lo0bits+0x5c>
    9c88:	fddff06f          	j	9c64 <__lo0bits+0x80>
    9c8c:	0087d793          	srl	a5,a5,0x8
    9c90:	00f7f693          	and	a3,a5,15
    9c94:	00850513          	add	a0,a0,8
    9c98:	fa0690e3          	bnez	a3,9c38 <__lo0bits+0x54>
    9c9c:	fddff06f          	j	9c78 <__lo0bits+0x94>
    9ca0:	0107d793          	srl	a5,a5,0x10
    9ca4:	0ff7f693          	zext.b	a3,a5
    9ca8:	01000513          	li	a0,16
    9cac:	f80692e3          	bnez	a3,9c30 <__lo0bits+0x4c>
    9cb0:	fddff06f          	j	9c8c <__lo0bits+0xa8>
    9cb4:	0027d793          	srl	a5,a5,0x2
    9cb8:	00f72023          	sw	a5,0(a4)
    9cbc:	00200513          	li	a0,2
    9cc0:	00008067          	ret

00009cc4 <__i2b>:
    9cc4:	04452783          	lw	a5,68(a0)
    9cc8:	ff010113          	add	sp,sp,-16
    9ccc:	00812423          	sw	s0,8(sp)
    9cd0:	00912223          	sw	s1,4(sp)
    9cd4:	00112623          	sw	ra,12(sp)
    9cd8:	00050413          	mv	s0,a0
    9cdc:	00058493          	mv	s1,a1
    9ce0:	02078c63          	beqz	a5,9d18 <__i2b+0x54>
    9ce4:	0047a503          	lw	a0,4(a5)
    9ce8:	06050263          	beqz	a0,9d4c <__i2b+0x88>
    9cec:	00052703          	lw	a4,0(a0)
    9cf0:	00e7a223          	sw	a4,4(a5)
    9cf4:	00c12083          	lw	ra,12(sp)
    9cf8:	00812403          	lw	s0,8(sp)
    9cfc:	00100793          	li	a5,1
    9d00:	00952a23          	sw	s1,20(a0)
    9d04:	00052623          	sw	zero,12(a0)
    9d08:	00f52823          	sw	a5,16(a0)
    9d0c:	00412483          	lw	s1,4(sp)
    9d10:	01010113          	add	sp,sp,16
    9d14:	00008067          	ret
    9d18:	02100613          	li	a2,33
    9d1c:	00400593          	li	a1,4
    9d20:	46c010ef          	jal	b18c <_calloc_r>
    9d24:	04a42223          	sw	a0,68(s0)
    9d28:	00050793          	mv	a5,a0
    9d2c:	fa051ce3          	bnez	a0,9ce4 <__i2b+0x20>
    9d30:	00005697          	auipc	a3,0x5
    9d34:	67868693          	add	a3,a3,1656 # f3a8 <__fini_array_end+0x334>
    9d38:	00000613          	li	a2,0
    9d3c:	14500593          	li	a1,325
    9d40:	00005517          	auipc	a0,0x5
    9d44:	6fc50513          	add	a0,a0,1788 # f43c <__fini_array_end+0x3c8>
    9d48:	3ec010ef          	jal	b134 <__assert_func>
    9d4c:	01c00613          	li	a2,28
    9d50:	00100593          	li	a1,1
    9d54:	00040513          	mv	a0,s0
    9d58:	434010ef          	jal	b18c <_calloc_r>
    9d5c:	fc050ae3          	beqz	a0,9d30 <__i2b+0x6c>
    9d60:	00100793          	li	a5,1
    9d64:	00f52223          	sw	a5,4(a0)
    9d68:	00200793          	li	a5,2
    9d6c:	00f52423          	sw	a5,8(a0)
    9d70:	f85ff06f          	j	9cf4 <__i2b+0x30>

00009d74 <__multiply>:
    9d74:	fb010113          	add	sp,sp,-80
    9d78:	03312e23          	sw	s3,60(sp)
    9d7c:	03812423          	sw	s8,40(sp)
    9d80:	01062983          	lw	s3,16(a2)
    9d84:	0105ac03          	lw	s8,16(a1)
    9d88:	04812423          	sw	s0,72(sp)
    9d8c:	03412c23          	sw	s4,56(sp)
    9d90:	04112623          	sw	ra,76(sp)
    9d94:	03712623          	sw	s7,44(sp)
    9d98:	00058a13          	mv	s4,a1
    9d9c:	00060413          	mv	s0,a2
    9da0:	013c4c63          	blt	s8,s3,9db8 <__multiply+0x44>
    9da4:	00098713          	mv	a4,s3
    9da8:	00058413          	mv	s0,a1
    9dac:	000c0993          	mv	s3,s8
    9db0:	00060a13          	mv	s4,a2
    9db4:	00070c13          	mv	s8,a4
    9db8:	00842783          	lw	a5,8(s0)
    9dbc:	00442583          	lw	a1,4(s0)
    9dc0:	01898bb3          	add	s7,s3,s8
    9dc4:	0177a7b3          	slt	a5,a5,s7
    9dc8:	00f585b3          	add	a1,a1,a5
    9dcc:	b45ff0ef          	jal	9910 <_Balloc>
    9dd0:	00a12623          	sw	a0,12(sp)
    9dd4:	22050863          	beqz	a0,a004 <__multiply+0x290>
    9dd8:	00c12783          	lw	a5,12(sp)
    9ddc:	03512a23          	sw	s5,52(sp)
    9de0:	03612823          	sw	s6,48(sp)
    9de4:	002b9a93          	sll	s5,s7,0x2
    9de8:	01478b13          	add	s6,a5,20
    9dec:	015b0ab3          	add	s5,s6,s5
    9df0:	000b0793          	mv	a5,s6
    9df4:	015b7863          	bgeu	s6,s5,9e04 <__multiply+0x90>
    9df8:	0007a023          	sw	zero,0(a5)
    9dfc:	00478793          	add	a5,a5,4
    9e00:	ff57ece3          	bltu	a5,s5,9df8 <__multiply+0x84>
    9e04:	014a0a13          	add	s4,s4,20
    9e08:	002c1c13          	sll	s8,s8,0x2
    9e0c:	01440793          	add	a5,s0,20
    9e10:	018a0733          	add	a4,s4,s8
    9e14:	00299993          	sll	s3,s3,0x2
    9e18:	00f12423          	sw	a5,8(sp)
    9e1c:	00e12023          	sw	a4,0(sp)
    9e20:	013789b3          	add	s3,a5,s3
    9e24:	16ea7c63          	bgeu	s4,a4,9f9c <__multiply+0x228>
    9e28:	00400713          	li	a4,4
    9e2c:	04912223          	sw	s1,68(sp)
    9e30:	05212023          	sw	s2,64(sp)
    9e34:	03912223          	sw	s9,36(sp)
    9e38:	03a12023          	sw	s10,32(sp)
    9e3c:	01b12e23          	sw	s11,28(sp)
    9e40:	01540793          	add	a5,s0,21
    9e44:	00e12223          	sw	a4,4(sp)
    9e48:	1af9f263          	bgeu	s3,a5,9fec <__multiply+0x278>
    9e4c:	00010437          	lui	s0,0x10
    9e50:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    9e54:	01c0006f          	j	9e70 <__multiply+0xfc>
    9e58:	01095913          	srl	s2,s2,0x10
    9e5c:	0a091063          	bnez	s2,9efc <__multiply+0x188>
    9e60:	00012783          	lw	a5,0(sp)
    9e64:	004a0a13          	add	s4,s4,4
    9e68:	004b0b13          	add	s6,s6,4
    9e6c:	10fa7e63          	bgeu	s4,a5,9f88 <__multiply+0x214>
    9e70:	000a2903          	lw	s2,0(s4)
    9e74:	008974b3          	and	s1,s2,s0
    9e78:	fe0480e3          	beqz	s1,9e58 <__multiply+0xe4>
    9e7c:	00812c83          	lw	s9,8(sp)
    9e80:	000b0d13          	mv	s10,s6
    9e84:	00000c13          	li	s8,0
    9e88:	000cad83          	lw	s11,0(s9)
    9e8c:	000d2903          	lw	s2,0(s10)
    9e90:	00048593          	mv	a1,s1
    9e94:	008df533          	and	a0,s11,s0
    9e98:	7e5040ef          	jal	ee7c <__mulsi3>
    9e9c:	00897733          	and	a4,s2,s0
    9ea0:	00e50733          	add	a4,a0,a4
    9ea4:	00048593          	mv	a1,s1
    9ea8:	010dd513          	srl	a0,s11,0x10
    9eac:	01870c33          	add	s8,a4,s8
    9eb0:	01095913          	srl	s2,s2,0x10
    9eb4:	7c9040ef          	jal	ee7c <__mulsi3>
    9eb8:	010c5713          	srl	a4,s8,0x10
    9ebc:	01250533          	add	a0,a0,s2
    9ec0:	00e50533          	add	a0,a0,a4
    9ec4:	008c77b3          	and	a5,s8,s0
    9ec8:	01051713          	sll	a4,a0,0x10
    9ecc:	004d0d13          	add	s10,s10,4
    9ed0:	00f767b3          	or	a5,a4,a5
    9ed4:	004c8c93          	add	s9,s9,4
    9ed8:	fefd2e23          	sw	a5,-4(s10)
    9edc:	01055c13          	srl	s8,a0,0x10
    9ee0:	fb3ce4e3          	bltu	s9,s3,9e88 <__multiply+0x114>
    9ee4:	00412783          	lw	a5,4(sp)
    9ee8:	00fb0733          	add	a4,s6,a5
    9eec:	01872023          	sw	s8,0(a4)
    9ef0:	000a2903          	lw	s2,0(s4)
    9ef4:	01095913          	srl	s2,s2,0x10
    9ef8:	f60904e3          	beqz	s2,9e60 <__multiply+0xec>
    9efc:	000b2c83          	lw	s9,0(s6)
    9f00:	00812d03          	lw	s10,8(sp)
    9f04:	000b0c13          	mv	s8,s6
    9f08:	000c8493          	mv	s1,s9
    9f0c:	00000d93          	li	s11,0
    9f10:	000d2503          	lw	a0,0(s10)
    9f14:	00090593          	mv	a1,s2
    9f18:	0104d493          	srl	s1,s1,0x10
    9f1c:	00857533          	and	a0,a0,s0
    9f20:	75d040ef          	jal	ee7c <__mulsi3>
    9f24:	01b50733          	add	a4,a0,s11
    9f28:	00970db3          	add	s11,a4,s1
    9f2c:	010d9593          	sll	a1,s11,0x10
    9f30:	008cf7b3          	and	a5,s9,s0
    9f34:	00f5e7b3          	or	a5,a1,a5
    9f38:	00fc2023          	sw	a5,0(s8)
    9f3c:	002d5503          	lhu	a0,2(s10)
    9f40:	004c2483          	lw	s1,4(s8)
    9f44:	00090593          	mv	a1,s2
    9f48:	735040ef          	jal	ee7c <__mulsi3>
    9f4c:	0084f7b3          	and	a5,s1,s0
    9f50:	010dd713          	srl	a4,s11,0x10
    9f54:	00f507b3          	add	a5,a0,a5
    9f58:	004d0d13          	add	s10,s10,4
    9f5c:	00e78cb3          	add	s9,a5,a4
    9f60:	004c0c13          	add	s8,s8,4
    9f64:	010cdd93          	srl	s11,s9,0x10
    9f68:	fb3d64e3          	bltu	s10,s3,9f10 <__multiply+0x19c>
    9f6c:	00412783          	lw	a5,4(sp)
    9f70:	004a0a13          	add	s4,s4,4
    9f74:	00fb0733          	add	a4,s6,a5
    9f78:	00012783          	lw	a5,0(sp)
    9f7c:	01972023          	sw	s9,0(a4)
    9f80:	004b0b13          	add	s6,s6,4
    9f84:	eefa66e3          	bltu	s4,a5,9e70 <__multiply+0xfc>
    9f88:	04412483          	lw	s1,68(sp)
    9f8c:	04012903          	lw	s2,64(sp)
    9f90:	02412c83          	lw	s9,36(sp)
    9f94:	02012d03          	lw	s10,32(sp)
    9f98:	01c12d83          	lw	s11,28(sp)
    9f9c:	01704863          	bgtz	s7,9fac <__multiply+0x238>
    9fa0:	0180006f          	j	9fb8 <__multiply+0x244>
    9fa4:	fffb8b93          	add	s7,s7,-1
    9fa8:	000b8863          	beqz	s7,9fb8 <__multiply+0x244>
    9fac:	ffcaa783          	lw	a5,-4(s5)
    9fb0:	ffca8a93          	add	s5,s5,-4
    9fb4:	fe0788e3          	beqz	a5,9fa4 <__multiply+0x230>
    9fb8:	00c12783          	lw	a5,12(sp)
    9fbc:	04c12083          	lw	ra,76(sp)
    9fc0:	04812403          	lw	s0,72(sp)
    9fc4:	0177a823          	sw	s7,16(a5)
    9fc8:	03412a83          	lw	s5,52(sp)
    9fcc:	03012b03          	lw	s6,48(sp)
    9fd0:	03c12983          	lw	s3,60(sp)
    9fd4:	03812a03          	lw	s4,56(sp)
    9fd8:	02c12b83          	lw	s7,44(sp)
    9fdc:	02812c03          	lw	s8,40(sp)
    9fe0:	00078513          	mv	a0,a5
    9fe4:	05010113          	add	sp,sp,80
    9fe8:	00008067          	ret
    9fec:	408987b3          	sub	a5,s3,s0
    9ff0:	feb78793          	add	a5,a5,-21
    9ff4:	ffc7f793          	and	a5,a5,-4
    9ff8:	00478793          	add	a5,a5,4
    9ffc:	00f12223          	sw	a5,4(sp)
    a000:	e4dff06f          	j	9e4c <__multiply+0xd8>
    a004:	00005697          	auipc	a3,0x5
    a008:	3a468693          	add	a3,a3,932 # f3a8 <__fini_array_end+0x334>
    a00c:	00000613          	li	a2,0
    a010:	16200593          	li	a1,354
    a014:	00005517          	auipc	a0,0x5
    a018:	42850513          	add	a0,a0,1064 # f43c <__fini_array_end+0x3c8>
    a01c:	04912223          	sw	s1,68(sp)
    a020:	05212023          	sw	s2,64(sp)
    a024:	03512a23          	sw	s5,52(sp)
    a028:	03612823          	sw	s6,48(sp)
    a02c:	03912223          	sw	s9,36(sp)
    a030:	03a12023          	sw	s10,32(sp)
    a034:	01b12e23          	sw	s11,28(sp)
    a038:	0fc010ef          	jal	b134 <__assert_func>

0000a03c <__pow5mult>:
    a03c:	fe010113          	add	sp,sp,-32
    a040:	00812c23          	sw	s0,24(sp)
    a044:	01212823          	sw	s2,16(sp)
    a048:	01312623          	sw	s3,12(sp)
    a04c:	00112e23          	sw	ra,28(sp)
    a050:	00367793          	and	a5,a2,3
    a054:	00060413          	mv	s0,a2
    a058:	00050993          	mv	s3,a0
    a05c:	00058913          	mv	s2,a1
    a060:	0a079c63          	bnez	a5,a118 <__pow5mult+0xdc>
    a064:	40245413          	sra	s0,s0,0x2
    a068:	06040a63          	beqz	s0,a0dc <__pow5mult+0xa0>
    a06c:	00912a23          	sw	s1,20(sp)
    a070:	0409a483          	lw	s1,64(s3)
    a074:	0c048663          	beqz	s1,a140 <__pow5mult+0x104>
    a078:	00147793          	and	a5,s0,1
    a07c:	02079063          	bnez	a5,a09c <__pow5mult+0x60>
    a080:	40145413          	sra	s0,s0,0x1
    a084:	04040a63          	beqz	s0,a0d8 <__pow5mult+0x9c>
    a088:	0004a503          	lw	a0,0(s1)
    a08c:	06050663          	beqz	a0,a0f8 <__pow5mult+0xbc>
    a090:	00050493          	mv	s1,a0
    a094:	00147793          	and	a5,s0,1
    a098:	fe0784e3          	beqz	a5,a080 <__pow5mult+0x44>
    a09c:	00048613          	mv	a2,s1
    a0a0:	00090593          	mv	a1,s2
    a0a4:	00098513          	mv	a0,s3
    a0a8:	ccdff0ef          	jal	9d74 <__multiply>
    a0ac:	02090063          	beqz	s2,a0cc <__pow5mult+0x90>
    a0b0:	00492703          	lw	a4,4(s2)
    a0b4:	0449a783          	lw	a5,68(s3)
    a0b8:	00271713          	sll	a4,a4,0x2
    a0bc:	00e787b3          	add	a5,a5,a4
    a0c0:	0007a703          	lw	a4,0(a5)
    a0c4:	00e92023          	sw	a4,0(s2)
    a0c8:	0127a023          	sw	s2,0(a5)
    a0cc:	40145413          	sra	s0,s0,0x1
    a0d0:	00050913          	mv	s2,a0
    a0d4:	fa041ae3          	bnez	s0,a088 <__pow5mult+0x4c>
    a0d8:	01412483          	lw	s1,20(sp)
    a0dc:	01c12083          	lw	ra,28(sp)
    a0e0:	01812403          	lw	s0,24(sp)
    a0e4:	00c12983          	lw	s3,12(sp)
    a0e8:	00090513          	mv	a0,s2
    a0ec:	01012903          	lw	s2,16(sp)
    a0f0:	02010113          	add	sp,sp,32
    a0f4:	00008067          	ret
    a0f8:	00048613          	mv	a2,s1
    a0fc:	00048593          	mv	a1,s1
    a100:	00098513          	mv	a0,s3
    a104:	c71ff0ef          	jal	9d74 <__multiply>
    a108:	00a4a023          	sw	a0,0(s1)
    a10c:	00052023          	sw	zero,0(a0)
    a110:	00050493          	mv	s1,a0
    a114:	f81ff06f          	j	a094 <__pow5mult+0x58>
    a118:	fff78793          	add	a5,a5,-1
    a11c:	00006717          	auipc	a4,0x6
    a120:	89470713          	add	a4,a4,-1900 # f9b0 <p05.0>
    a124:	00279793          	sll	a5,a5,0x2
    a128:	00f707b3          	add	a5,a4,a5
    a12c:	0007a603          	lw	a2,0(a5)
    a130:	00000693          	li	a3,0
    a134:	8b5ff0ef          	jal	99e8 <__multadd>
    a138:	00050913          	mv	s2,a0
    a13c:	f29ff06f          	j	a064 <__pow5mult+0x28>
    a140:	00100593          	li	a1,1
    a144:	00098513          	mv	a0,s3
    a148:	fc8ff0ef          	jal	9910 <_Balloc>
    a14c:	00050493          	mv	s1,a0
    a150:	02050063          	beqz	a0,a170 <__pow5mult+0x134>
    a154:	27100793          	li	a5,625
    a158:	00f52a23          	sw	a5,20(a0)
    a15c:	00100793          	li	a5,1
    a160:	00f52823          	sw	a5,16(a0)
    a164:	04a9a023          	sw	a0,64(s3)
    a168:	00052023          	sw	zero,0(a0)
    a16c:	f0dff06f          	j	a078 <__pow5mult+0x3c>
    a170:	00005697          	auipc	a3,0x5
    a174:	23868693          	add	a3,a3,568 # f3a8 <__fini_array_end+0x334>
    a178:	00000613          	li	a2,0
    a17c:	14500593          	li	a1,325
    a180:	00005517          	auipc	a0,0x5
    a184:	2bc50513          	add	a0,a0,700 # f43c <__fini_array_end+0x3c8>
    a188:	7ad000ef          	jal	b134 <__assert_func>

0000a18c <__lshift>:
    a18c:	fe010113          	add	sp,sp,-32
    a190:	01512223          	sw	s5,4(sp)
    a194:	0105aa83          	lw	s5,16(a1)
    a198:	0085a783          	lw	a5,8(a1)
    a19c:	01312623          	sw	s3,12(sp)
    a1a0:	40565993          	sra	s3,a2,0x5
    a1a4:	01598ab3          	add	s5,s3,s5
    a1a8:	00812c23          	sw	s0,24(sp)
    a1ac:	00912a23          	sw	s1,20(sp)
    a1b0:	01212823          	sw	s2,16(sp)
    a1b4:	01412423          	sw	s4,8(sp)
    a1b8:	00112e23          	sw	ra,28(sp)
    a1bc:	001a8913          	add	s2,s5,1
    a1c0:	00058493          	mv	s1,a1
    a1c4:	00060413          	mv	s0,a2
    a1c8:	0045a583          	lw	a1,4(a1)
    a1cc:	00050a13          	mv	s4,a0
    a1d0:	0127d863          	bge	a5,s2,a1e0 <__lshift+0x54>
    a1d4:	00179793          	sll	a5,a5,0x1
    a1d8:	00158593          	add	a1,a1,1
    a1dc:	ff27cce3          	blt	a5,s2,a1d4 <__lshift+0x48>
    a1e0:	000a0513          	mv	a0,s4
    a1e4:	f2cff0ef          	jal	9910 <_Balloc>
    a1e8:	10050c63          	beqz	a0,a300 <__lshift+0x174>
    a1ec:	01450813          	add	a6,a0,20
    a1f0:	03305463          	blez	s3,a218 <__lshift+0x8c>
    a1f4:	00598993          	add	s3,s3,5
    a1f8:	00299993          	sll	s3,s3,0x2
    a1fc:	01350733          	add	a4,a0,s3
    a200:	00080793          	mv	a5,a6
    a204:	00478793          	add	a5,a5,4
    a208:	fe07ae23          	sw	zero,-4(a5)
    a20c:	fee79ce3          	bne	a5,a4,a204 <__lshift+0x78>
    a210:	fec98993          	add	s3,s3,-20
    a214:	01380833          	add	a6,a6,s3
    a218:	0104a883          	lw	a7,16(s1)
    a21c:	01448793          	add	a5,s1,20
    a220:	01f47613          	and	a2,s0,31
    a224:	00289893          	sll	a7,a7,0x2
    a228:	011788b3          	add	a7,a5,a7
    a22c:	0a060463          	beqz	a2,a2d4 <__lshift+0x148>
    a230:	02000593          	li	a1,32
    a234:	40c585b3          	sub	a1,a1,a2
    a238:	00080313          	mv	t1,a6
    a23c:	00000693          	li	a3,0
    a240:	0007a703          	lw	a4,0(a5)
    a244:	00430313          	add	t1,t1,4
    a248:	00478793          	add	a5,a5,4
    a24c:	00c71733          	sll	a4,a4,a2
    a250:	00d76733          	or	a4,a4,a3
    a254:	fee32e23          	sw	a4,-4(t1)
    a258:	ffc7a683          	lw	a3,-4(a5)
    a25c:	00b6d6b3          	srl	a3,a3,a1
    a260:	ff17e0e3          	bltu	a5,a7,a240 <__lshift+0xb4>
    a264:	01548793          	add	a5,s1,21
    a268:	00400713          	li	a4,4
    a26c:	00f8ea63          	bltu	a7,a5,a280 <__lshift+0xf4>
    a270:	409887b3          	sub	a5,a7,s1
    a274:	feb78793          	add	a5,a5,-21
    a278:	ffc7f793          	and	a5,a5,-4
    a27c:	00478713          	add	a4,a5,4
    a280:	00e80833          	add	a6,a6,a4
    a284:	00d82023          	sw	a3,0(a6)
    a288:	00069463          	bnez	a3,a290 <__lshift+0x104>
    a28c:	000a8913          	mv	s2,s5
    a290:	0044a703          	lw	a4,4(s1)
    a294:	044a2783          	lw	a5,68(s4)
    a298:	01c12083          	lw	ra,28(sp)
    a29c:	00271713          	sll	a4,a4,0x2
    a2a0:	00e787b3          	add	a5,a5,a4
    a2a4:	0007a703          	lw	a4,0(a5)
    a2a8:	01252823          	sw	s2,16(a0)
    a2ac:	01812403          	lw	s0,24(sp)
    a2b0:	00e4a023          	sw	a4,0(s1)
    a2b4:	0097a023          	sw	s1,0(a5)
    a2b8:	01012903          	lw	s2,16(sp)
    a2bc:	01412483          	lw	s1,20(sp)
    a2c0:	00c12983          	lw	s3,12(sp)
    a2c4:	00812a03          	lw	s4,8(sp)
    a2c8:	00412a83          	lw	s5,4(sp)
    a2cc:	02010113          	add	sp,sp,32
    a2d0:	00008067          	ret
    a2d4:	0007a703          	lw	a4,0(a5)
    a2d8:	00478793          	add	a5,a5,4
    a2dc:	00480813          	add	a6,a6,4
    a2e0:	fee82e23          	sw	a4,-4(a6)
    a2e4:	fb17f4e3          	bgeu	a5,a7,a28c <__lshift+0x100>
    a2e8:	0007a703          	lw	a4,0(a5)
    a2ec:	00478793          	add	a5,a5,4
    a2f0:	00480813          	add	a6,a6,4
    a2f4:	fee82e23          	sw	a4,-4(a6)
    a2f8:	fd17eee3          	bltu	a5,a7,a2d4 <__lshift+0x148>
    a2fc:	f91ff06f          	j	a28c <__lshift+0x100>
    a300:	00005697          	auipc	a3,0x5
    a304:	0a868693          	add	a3,a3,168 # f3a8 <__fini_array_end+0x334>
    a308:	00000613          	li	a2,0
    a30c:	1de00593          	li	a1,478
    a310:	00005517          	auipc	a0,0x5
    a314:	12c50513          	add	a0,a0,300 # f43c <__fini_array_end+0x3c8>
    a318:	61d000ef          	jal	b134 <__assert_func>

0000a31c <__mcmp>:
    a31c:	01052703          	lw	a4,16(a0)
    a320:	0105a783          	lw	a5,16(a1)
    a324:	00050813          	mv	a6,a0
    a328:	40f70533          	sub	a0,a4,a5
    a32c:	04f71263          	bne	a4,a5,a370 <__mcmp+0x54>
    a330:	00279793          	sll	a5,a5,0x2
    a334:	01480813          	add	a6,a6,20
    a338:	01458593          	add	a1,a1,20
    a33c:	00f80733          	add	a4,a6,a5
    a340:	00f587b3          	add	a5,a1,a5
    a344:	0080006f          	j	a34c <__mcmp+0x30>
    a348:	02e87463          	bgeu	a6,a4,a370 <__mcmp+0x54>
    a34c:	ffc72603          	lw	a2,-4(a4)
    a350:	ffc7a683          	lw	a3,-4(a5)
    a354:	ffc70713          	add	a4,a4,-4
    a358:	ffc78793          	add	a5,a5,-4
    a35c:	fed606e3          	beq	a2,a3,a348 <__mcmp+0x2c>
    a360:	00100513          	li	a0,1
    a364:	00d67663          	bgeu	a2,a3,a370 <__mcmp+0x54>
    a368:	fff00513          	li	a0,-1
    a36c:	00008067          	ret
    a370:	00008067          	ret

0000a374 <__mdiff>:
    a374:	0105a703          	lw	a4,16(a1)
    a378:	01062783          	lw	a5,16(a2)
    a37c:	ff010113          	add	sp,sp,-16
    a380:	00812423          	sw	s0,8(sp)
    a384:	00912223          	sw	s1,4(sp)
    a388:	00112623          	sw	ra,12(sp)
    a38c:	01212023          	sw	s2,0(sp)
    a390:	00058413          	mv	s0,a1
    a394:	00060493          	mv	s1,a2
    a398:	40f706b3          	sub	a3,a4,a5
    a39c:	18f71e63          	bne	a4,a5,a538 <__mdiff+0x1c4>
    a3a0:	00279693          	sll	a3,a5,0x2
    a3a4:	01458613          	add	a2,a1,20
    a3a8:	01448713          	add	a4,s1,20
    a3ac:	00d607b3          	add	a5,a2,a3
    a3b0:	00d70733          	add	a4,a4,a3
    a3b4:	0080006f          	j	a3bc <__mdiff+0x48>
    a3b8:	18f67c63          	bgeu	a2,a5,a550 <__mdiff+0x1dc>
    a3bc:	ffc7a583          	lw	a1,-4(a5)
    a3c0:	ffc72683          	lw	a3,-4(a4)
    a3c4:	ffc78793          	add	a5,a5,-4
    a3c8:	ffc70713          	add	a4,a4,-4
    a3cc:	fed586e3          	beq	a1,a3,a3b8 <__mdiff+0x44>
    a3d0:	00100913          	li	s2,1
    a3d4:	00d5ea63          	bltu	a1,a3,a3e8 <__mdiff+0x74>
    a3d8:	00048793          	mv	a5,s1
    a3dc:	00000913          	li	s2,0
    a3e0:	00040493          	mv	s1,s0
    a3e4:	00078413          	mv	s0,a5
    a3e8:	0044a583          	lw	a1,4(s1)
    a3ec:	d24ff0ef          	jal	9910 <_Balloc>
    a3f0:	1a050663          	beqz	a0,a59c <__mdiff+0x228>
    a3f4:	0104a883          	lw	a7,16(s1)
    a3f8:	01042283          	lw	t0,16(s0)
    a3fc:	01448f93          	add	t6,s1,20
    a400:	00289313          	sll	t1,a7,0x2
    a404:	01440813          	add	a6,s0,20
    a408:	00229293          	sll	t0,t0,0x2
    a40c:	01450593          	add	a1,a0,20
    a410:	00010e37          	lui	t3,0x10
    a414:	01252623          	sw	s2,12(a0)
    a418:	006f8333          	add	t1,t6,t1
    a41c:	005802b3          	add	t0,a6,t0
    a420:	00058f13          	mv	t5,a1
    a424:	000f8e93          	mv	t4,t6
    a428:	00000693          	li	a3,0
    a42c:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    a430:	000ea703          	lw	a4,0(t4)
    a434:	00082603          	lw	a2,0(a6)
    a438:	004f0f13          	add	t5,t5,4
    a43c:	01c777b3          	and	a5,a4,t3
    a440:	01c673b3          	and	t2,a2,t3
    a444:	407787b3          	sub	a5,a5,t2
    a448:	00d787b3          	add	a5,a5,a3
    a44c:	01075713          	srl	a4,a4,0x10
    a450:	01065613          	srl	a2,a2,0x10
    a454:	4107d693          	sra	a3,a5,0x10
    a458:	40c70733          	sub	a4,a4,a2
    a45c:	00d70733          	add	a4,a4,a3
    a460:	01071693          	sll	a3,a4,0x10
    a464:	01c7f7b3          	and	a5,a5,t3
    a468:	00d7e7b3          	or	a5,a5,a3
    a46c:	00480813          	add	a6,a6,4
    a470:	feff2e23          	sw	a5,-4(t5)
    a474:	004e8e93          	add	t4,t4,4
    a478:	41075693          	sra	a3,a4,0x10
    a47c:	fa586ae3          	bltu	a6,t0,a430 <__mdiff+0xbc>
    a480:	01540713          	add	a4,s0,21
    a484:	40828433          	sub	s0,t0,s0
    a488:	feb40413          	add	s0,s0,-21
    a48c:	00e2b2b3          	sltu	t0,t0,a4
    a490:	0012cf13          	xor	t5,t0,1
    a494:	00245413          	srl	s0,s0,0x2
    a498:	00400713          	li	a4,4
    a49c:	0a028463          	beqz	t0,a544 <__mdiff+0x1d0>
    a4a0:	00ef8fb3          	add	t6,t6,a4
    a4a4:	00e58833          	add	a6,a1,a4
    a4a8:	00010eb7          	lui	t4,0x10
    a4ac:	00080e13          	mv	t3,a6
    a4b0:	000f8613          	mv	a2,t6
    a4b4:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    a4b8:	0c6ff463          	bgeu	t6,t1,a580 <__mdiff+0x20c>
    a4bc:	00062783          	lw	a5,0(a2)
    a4c0:	004e0e13          	add	t3,t3,4
    a4c4:	00460613          	add	a2,a2,4
    a4c8:	01d7f733          	and	a4,a5,t4
    a4cc:	00d70733          	add	a4,a4,a3
    a4d0:	0107d593          	srl	a1,a5,0x10
    a4d4:	41075713          	sra	a4,a4,0x10
    a4d8:	00b70733          	add	a4,a4,a1
    a4dc:	00d787b3          	add	a5,a5,a3
    a4e0:	01d7f7b3          	and	a5,a5,t4
    a4e4:	01071693          	sll	a3,a4,0x10
    a4e8:	00d7e7b3          	or	a5,a5,a3
    a4ec:	fefe2e23          	sw	a5,-4(t3)
    a4f0:	41075693          	sra	a3,a4,0x10
    a4f4:	fc6664e3          	bltu	a2,t1,a4bc <__mdiff+0x148>
    a4f8:	fff30313          	add	t1,t1,-1
    a4fc:	41f30333          	sub	t1,t1,t6
    a500:	ffc37313          	and	t1,t1,-4
    a504:	00680733          	add	a4,a6,t1
    a508:	00079a63          	bnez	a5,a51c <__mdiff+0x1a8>
    a50c:	ffc72783          	lw	a5,-4(a4)
    a510:	fff88893          	add	a7,a7,-1
    a514:	ffc70713          	add	a4,a4,-4
    a518:	fe078ae3          	beqz	a5,a50c <__mdiff+0x198>
    a51c:	00c12083          	lw	ra,12(sp)
    a520:	00812403          	lw	s0,8(sp)
    a524:	01152823          	sw	a7,16(a0)
    a528:	00412483          	lw	s1,4(sp)
    a52c:	00012903          	lw	s2,0(sp)
    a530:	01010113          	add	sp,sp,16
    a534:	00008067          	ret
    a538:	00100913          	li	s2,1
    a53c:	e806dee3          	bgez	a3,a3d8 <__mdiff+0x64>
    a540:	ea9ff06f          	j	a3e8 <__mdiff+0x74>
    a544:	00140713          	add	a4,s0,1
    a548:	00271713          	sll	a4,a4,0x2
    a54c:	f55ff06f          	j	a4a0 <__mdiff+0x12c>
    a550:	00000593          	li	a1,0
    a554:	bbcff0ef          	jal	9910 <_Balloc>
    a558:	06050063          	beqz	a0,a5b8 <__mdiff+0x244>
    a55c:	00c12083          	lw	ra,12(sp)
    a560:	00812403          	lw	s0,8(sp)
    a564:	00100793          	li	a5,1
    a568:	00f52823          	sw	a5,16(a0)
    a56c:	00052a23          	sw	zero,20(a0)
    a570:	00412483          	lw	s1,4(sp)
    a574:	00012903          	lw	s2,0(sp)
    a578:	01010113          	add	sp,sp,16
    a57c:	00008067          	ret
    a580:	00000713          	li	a4,0
    a584:	000f1663          	bnez	t5,a590 <__mdiff+0x21c>
    a588:	00e58733          	add	a4,a1,a4
    a58c:	f7dff06f          	j	a508 <__mdiff+0x194>
    a590:	00241713          	sll	a4,s0,0x2
    a594:	00e58733          	add	a4,a1,a4
    a598:	f71ff06f          	j	a508 <__mdiff+0x194>
    a59c:	00005697          	auipc	a3,0x5
    a5a0:	e0c68693          	add	a3,a3,-500 # f3a8 <__fini_array_end+0x334>
    a5a4:	00000613          	li	a2,0
    a5a8:	24500593          	li	a1,581
    a5ac:	00005517          	auipc	a0,0x5
    a5b0:	e9050513          	add	a0,a0,-368 # f43c <__fini_array_end+0x3c8>
    a5b4:	381000ef          	jal	b134 <__assert_func>
    a5b8:	00005697          	auipc	a3,0x5
    a5bc:	df068693          	add	a3,a3,-528 # f3a8 <__fini_array_end+0x334>
    a5c0:	00000613          	li	a2,0
    a5c4:	23700593          	li	a1,567
    a5c8:	00005517          	auipc	a0,0x5
    a5cc:	e7450513          	add	a0,a0,-396 # f43c <__fini_array_end+0x3c8>
    a5d0:	365000ef          	jal	b134 <__assert_func>

0000a5d4 <__d2b>:
    a5d4:	fd010113          	add	sp,sp,-48
    a5d8:	01512a23          	sw	s5,20(sp)
    a5dc:	00058a93          	mv	s5,a1
    a5e0:	00100593          	li	a1,1
    a5e4:	02912223          	sw	s1,36(sp)
    a5e8:	01312e23          	sw	s3,28(sp)
    a5ec:	01412c23          	sw	s4,24(sp)
    a5f0:	02112623          	sw	ra,44(sp)
    a5f4:	02812423          	sw	s0,40(sp)
    a5f8:	03212023          	sw	s2,32(sp)
    a5fc:	00060493          	mv	s1,a2
    a600:	00068a13          	mv	s4,a3
    a604:	00070993          	mv	s3,a4
    a608:	b08ff0ef          	jal	9910 <_Balloc>
    a60c:	10050263          	beqz	a0,a710 <__d2b+0x13c>
    a610:	00100737          	lui	a4,0x100
    a614:	0144d913          	srl	s2,s1,0x14
    a618:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a61c:	7ff97913          	and	s2,s2,2047
    a620:	00050413          	mv	s0,a0
    a624:	0097f7b3          	and	a5,a5,s1
    a628:	00090463          	beqz	s2,a630 <__d2b+0x5c>
    a62c:	00e7e7b3          	or	a5,a5,a4
    a630:	00f12623          	sw	a5,12(sp)
    a634:	060a9263          	bnez	s5,a698 <__d2b+0xc4>
    a638:	00c10513          	add	a0,sp,12
    a63c:	da8ff0ef          	jal	9be4 <__lo0bits>
    a640:	00c12703          	lw	a4,12(sp)
    a644:	00100493          	li	s1,1
    a648:	00942823          	sw	s1,16(s0)
    a64c:	00e42a23          	sw	a4,20(s0)
    a650:	02050793          	add	a5,a0,32
    a654:	08090863          	beqz	s2,a6e4 <__d2b+0x110>
    a658:	bcd90913          	add	s2,s2,-1075
    a65c:	00f90933          	add	s2,s2,a5
    a660:	03500493          	li	s1,53
    a664:	012a2023          	sw	s2,0(s4)
    a668:	40f48533          	sub	a0,s1,a5
    a66c:	00a9a023          	sw	a0,0(s3)
    a670:	02c12083          	lw	ra,44(sp)
    a674:	00040513          	mv	a0,s0
    a678:	02812403          	lw	s0,40(sp)
    a67c:	02412483          	lw	s1,36(sp)
    a680:	02012903          	lw	s2,32(sp)
    a684:	01c12983          	lw	s3,28(sp)
    a688:	01812a03          	lw	s4,24(sp)
    a68c:	01412a83          	lw	s5,20(sp)
    a690:	03010113          	add	sp,sp,48
    a694:	00008067          	ret
    a698:	00810513          	add	a0,sp,8
    a69c:	01512423          	sw	s5,8(sp)
    a6a0:	d44ff0ef          	jal	9be4 <__lo0bits>
    a6a4:	00c12703          	lw	a4,12(sp)
    a6a8:	00050793          	mv	a5,a0
    a6ac:	04050e63          	beqz	a0,a708 <__d2b+0x134>
    a6b0:	00812603          	lw	a2,8(sp)
    a6b4:	02000693          	li	a3,32
    a6b8:	40a686b3          	sub	a3,a3,a0
    a6bc:	00d716b3          	sll	a3,a4,a3
    a6c0:	00a75733          	srl	a4,a4,a0
    a6c4:	00c6e6b3          	or	a3,a3,a2
    a6c8:	00e12623          	sw	a4,12(sp)
    a6cc:	00e034b3          	snez	s1,a4
    a6d0:	00148493          	add	s1,s1,1
    a6d4:	00d42a23          	sw	a3,20(s0)
    a6d8:	00e42c23          	sw	a4,24(s0)
    a6dc:	00942823          	sw	s1,16(s0)
    a6e0:	f6091ce3          	bnez	s2,a658 <__d2b+0x84>
    a6e4:	00249713          	sll	a4,s1,0x2
    a6e8:	00e40733          	add	a4,s0,a4
    a6ec:	01072503          	lw	a0,16(a4)
    a6f0:	bce78793          	add	a5,a5,-1074
    a6f4:	00fa2023          	sw	a5,0(s4)
    a6f8:	c74ff0ef          	jal	9b6c <__hi0bits>
    a6fc:	00549493          	sll	s1,s1,0x5
    a700:	40a48533          	sub	a0,s1,a0
    a704:	f69ff06f          	j	a66c <__d2b+0x98>
    a708:	00812683          	lw	a3,8(sp)
    a70c:	fc1ff06f          	j	a6cc <__d2b+0xf8>
    a710:	00005697          	auipc	a3,0x5
    a714:	c9868693          	add	a3,a3,-872 # f3a8 <__fini_array_end+0x334>
    a718:	00000613          	li	a2,0
    a71c:	30f00593          	li	a1,783
    a720:	00005517          	auipc	a0,0x5
    a724:	d1c50513          	add	a0,a0,-740 # f43c <__fini_array_end+0x3c8>
    a728:	20d000ef          	jal	b134 <__assert_func>

0000a72c <_realloc_r>:
    a72c:	fd010113          	add	sp,sp,-48
    a730:	02912223          	sw	s1,36(sp)
    a734:	02112623          	sw	ra,44(sp)
    a738:	00060493          	mv	s1,a2
    a73c:	1e058863          	beqz	a1,a92c <_realloc_r+0x200>
    a740:	02812423          	sw	s0,40(sp)
    a744:	03212023          	sw	s2,32(sp)
    a748:	00058413          	mv	s0,a1
    a74c:	01312e23          	sw	s3,28(sp)
    a750:	01512a23          	sw	s5,20(sp)
    a754:	01412c23          	sw	s4,24(sp)
    a758:	00050913          	mv	s2,a0
    a75c:	8b1f70ef          	jal	200c <__malloc_lock>
    a760:	ffc42703          	lw	a4,-4(s0)
    a764:	00b48793          	add	a5,s1,11
    a768:	01600693          	li	a3,22
    a76c:	ff840a93          	add	s5,s0,-8
    a770:	ffc77993          	and	s3,a4,-4
    a774:	10f6f263          	bgeu	a3,a5,a878 <_realloc_r+0x14c>
    a778:	ff87fa13          	and	s4,a5,-8
    a77c:	1007c263          	bltz	a5,a880 <_realloc_r+0x154>
    a780:	109a6063          	bltu	s4,s1,a880 <_realloc_r+0x154>
    a784:	1349d263          	bge	s3,s4,a8a8 <_realloc_r+0x17c>
    a788:	01812423          	sw	s8,8(sp)
    a78c:	7fff6c17          	auipc	s8,0x7fff6
    a790:	994c0c13          	add	s8,s8,-1644 # 80000120 <__malloc_av_>
    a794:	008c2603          	lw	a2,8(s8)
    a798:	013a86b3          	add	a3,s5,s3
    a79c:	0046a783          	lw	a5,4(a3)
    a7a0:	1cd60863          	beq	a2,a3,a970 <_realloc_r+0x244>
    a7a4:	ffe7f613          	and	a2,a5,-2
    a7a8:	00c68633          	add	a2,a3,a2
    a7ac:	00462603          	lw	a2,4(a2)
    a7b0:	00167613          	and	a2,a2,1
    a7b4:	14061a63          	bnez	a2,a908 <_realloc_r+0x1dc>
    a7b8:	ffc7f793          	and	a5,a5,-4
    a7bc:	00f98633          	add	a2,s3,a5
    a7c0:	0d465863          	bge	a2,s4,a890 <_realloc_r+0x164>
    a7c4:	00177713          	and	a4,a4,1
    a7c8:	02071c63          	bnez	a4,a800 <_realloc_r+0xd4>
    a7cc:	01712623          	sw	s7,12(sp)
    a7d0:	ff842b83          	lw	s7,-8(s0)
    a7d4:	01612823          	sw	s6,16(sp)
    a7d8:	417a8bb3          	sub	s7,s5,s7
    a7dc:	004ba703          	lw	a4,4(s7)
    a7e0:	ffc77713          	and	a4,a4,-4
    a7e4:	00e787b3          	add	a5,a5,a4
    a7e8:	01378b33          	add	s6,a5,s3
    a7ec:	334b5c63          	bge	s6,s4,ab24 <_realloc_r+0x3f8>
    a7f0:	00e98b33          	add	s6,s3,a4
    a7f4:	294b5863          	bge	s6,s4,aa84 <_realloc_r+0x358>
    a7f8:	01012b03          	lw	s6,16(sp)
    a7fc:	00c12b83          	lw	s7,12(sp)
    a800:	00048593          	mv	a1,s1
    a804:	00090513          	mv	a0,s2
    a808:	824f70ef          	jal	182c <_malloc_r>
    a80c:	00050493          	mv	s1,a0
    a810:	40050863          	beqz	a0,ac20 <_realloc_r+0x4f4>
    a814:	ffc42783          	lw	a5,-4(s0)
    a818:	ff850713          	add	a4,a0,-8
    a81c:	ffe7f793          	and	a5,a5,-2
    a820:	00fa87b3          	add	a5,s5,a5
    a824:	24e78663          	beq	a5,a4,aa70 <_realloc_r+0x344>
    a828:	ffc98613          	add	a2,s3,-4
    a82c:	02400793          	li	a5,36
    a830:	2ec7e463          	bltu	a5,a2,ab18 <_realloc_r+0x3ec>
    a834:	01300713          	li	a4,19
    a838:	20c76a63          	bltu	a4,a2,aa4c <_realloc_r+0x320>
    a83c:	00050793          	mv	a5,a0
    a840:	00040713          	mv	a4,s0
    a844:	00072683          	lw	a3,0(a4)
    a848:	00d7a023          	sw	a3,0(a5)
    a84c:	00472683          	lw	a3,4(a4)
    a850:	00d7a223          	sw	a3,4(a5)
    a854:	00872703          	lw	a4,8(a4)
    a858:	00e7a423          	sw	a4,8(a5)
    a85c:	00040593          	mv	a1,s0
    a860:	00090513          	mv	a0,s2
    a864:	cbdf60ef          	jal	1520 <_free_r>
    a868:	00090513          	mv	a0,s2
    a86c:	facf70ef          	jal	2018 <__malloc_unlock>
    a870:	00812c03          	lw	s8,8(sp)
    a874:	06c0006f          	j	a8e0 <_realloc_r+0x1b4>
    a878:	01000a13          	li	s4,16
    a87c:	f09a74e3          	bgeu	s4,s1,a784 <_realloc_r+0x58>
    a880:	00c00793          	li	a5,12
    a884:	00f92023          	sw	a5,0(s2)
    a888:	00000493          	li	s1,0
    a88c:	0540006f          	j	a8e0 <_realloc_r+0x1b4>
    a890:	00c6a783          	lw	a5,12(a3)
    a894:	0086a703          	lw	a4,8(a3)
    a898:	00812c03          	lw	s8,8(sp)
    a89c:	00060993          	mv	s3,a2
    a8a0:	00f72623          	sw	a5,12(a4)
    a8a4:	00e7a423          	sw	a4,8(a5)
    a8a8:	004aa783          	lw	a5,4(s5)
    a8ac:	414986b3          	sub	a3,s3,s4
    a8b0:	00f00613          	li	a2,15
    a8b4:	0017f793          	and	a5,a5,1
    a8b8:	013a8733          	add	a4,s5,s3
    a8bc:	08d66263          	bltu	a2,a3,a940 <_realloc_r+0x214>
    a8c0:	0137e7b3          	or	a5,a5,s3
    a8c4:	00faa223          	sw	a5,4(s5)
    a8c8:	00472783          	lw	a5,4(a4)
    a8cc:	0017e793          	or	a5,a5,1
    a8d0:	00f72223          	sw	a5,4(a4)
    a8d4:	00090513          	mv	a0,s2
    a8d8:	f40f70ef          	jal	2018 <__malloc_unlock>
    a8dc:	00040493          	mv	s1,s0
    a8e0:	02812403          	lw	s0,40(sp)
    a8e4:	02c12083          	lw	ra,44(sp)
    a8e8:	02012903          	lw	s2,32(sp)
    a8ec:	01c12983          	lw	s3,28(sp)
    a8f0:	01812a03          	lw	s4,24(sp)
    a8f4:	01412a83          	lw	s5,20(sp)
    a8f8:	00048513          	mv	a0,s1
    a8fc:	02412483          	lw	s1,36(sp)
    a900:	03010113          	add	sp,sp,48
    a904:	00008067          	ret
    a908:	00177713          	and	a4,a4,1
    a90c:	ee071ae3          	bnez	a4,a800 <_realloc_r+0xd4>
    a910:	01712623          	sw	s7,12(sp)
    a914:	ff842b83          	lw	s7,-8(s0)
    a918:	01612823          	sw	s6,16(sp)
    a91c:	417a8bb3          	sub	s7,s5,s7
    a920:	004ba703          	lw	a4,4(s7)
    a924:	ffc77713          	and	a4,a4,-4
    a928:	ec9ff06f          	j	a7f0 <_realloc_r+0xc4>
    a92c:	02c12083          	lw	ra,44(sp)
    a930:	02412483          	lw	s1,36(sp)
    a934:	00060593          	mv	a1,a2
    a938:	03010113          	add	sp,sp,48
    a93c:	ef1f606f          	j	182c <_malloc_r>
    a940:	0147e7b3          	or	a5,a5,s4
    a944:	00faa223          	sw	a5,4(s5)
    a948:	014a85b3          	add	a1,s5,s4
    a94c:	0016e693          	or	a3,a3,1
    a950:	00d5a223          	sw	a3,4(a1)
    a954:	00472783          	lw	a5,4(a4)
    a958:	00858593          	add	a1,a1,8
    a95c:	00090513          	mv	a0,s2
    a960:	0017e793          	or	a5,a5,1
    a964:	00f72223          	sw	a5,4(a4)
    a968:	bb9f60ef          	jal	1520 <_free_r>
    a96c:	f69ff06f          	j	a8d4 <_realloc_r+0x1a8>
    a970:	ffc7f793          	and	a5,a5,-4
    a974:	013786b3          	add	a3,a5,s3
    a978:	010a0613          	add	a2,s4,16
    a97c:	26c6d063          	bge	a3,a2,abdc <_realloc_r+0x4b0>
    a980:	00177713          	and	a4,a4,1
    a984:	e6071ee3          	bnez	a4,a800 <_realloc_r+0xd4>
    a988:	01712623          	sw	s7,12(sp)
    a98c:	ff842b83          	lw	s7,-8(s0)
    a990:	01612823          	sw	s6,16(sp)
    a994:	417a8bb3          	sub	s7,s5,s7
    a998:	004ba703          	lw	a4,4(s7)
    a99c:	ffc77713          	and	a4,a4,-4
    a9a0:	00e787b3          	add	a5,a5,a4
    a9a4:	01378b33          	add	s6,a5,s3
    a9a8:	e4cb44e3          	blt	s6,a2,a7f0 <_realloc_r+0xc4>
    a9ac:	00cba783          	lw	a5,12(s7)
    a9b0:	008ba703          	lw	a4,8(s7)
    a9b4:	ffc98613          	add	a2,s3,-4
    a9b8:	02400693          	li	a3,36
    a9bc:	00f72623          	sw	a5,12(a4)
    a9c0:	00e7a423          	sw	a4,8(a5)
    a9c4:	008b8493          	add	s1,s7,8
    a9c8:	28c6e463          	bltu	a3,a2,ac50 <_realloc_r+0x524>
    a9cc:	01300713          	li	a4,19
    a9d0:	00048793          	mv	a5,s1
    a9d4:	02c77263          	bgeu	a4,a2,a9f8 <_realloc_r+0x2cc>
    a9d8:	00042703          	lw	a4,0(s0)
    a9dc:	01b00793          	li	a5,27
    a9e0:	00eba423          	sw	a4,8(s7)
    a9e4:	00442703          	lw	a4,4(s0)
    a9e8:	00eba623          	sw	a4,12(s7)
    a9ec:	26c7ea63          	bltu	a5,a2,ac60 <_realloc_r+0x534>
    a9f0:	00840413          	add	s0,s0,8
    a9f4:	010b8793          	add	a5,s7,16
    a9f8:	00042703          	lw	a4,0(s0)
    a9fc:	00e7a023          	sw	a4,0(a5)
    aa00:	00442703          	lw	a4,4(s0)
    aa04:	00e7a223          	sw	a4,4(a5)
    aa08:	00842703          	lw	a4,8(s0)
    aa0c:	00e7a423          	sw	a4,8(a5)
    aa10:	014b8733          	add	a4,s7,s4
    aa14:	414b07b3          	sub	a5,s6,s4
    aa18:	00ec2423          	sw	a4,8(s8)
    aa1c:	0017e793          	or	a5,a5,1
    aa20:	00f72223          	sw	a5,4(a4)
    aa24:	004ba783          	lw	a5,4(s7)
    aa28:	00090513          	mv	a0,s2
    aa2c:	0017f793          	and	a5,a5,1
    aa30:	0147e7b3          	or	a5,a5,s4
    aa34:	00fba223          	sw	a5,4(s7)
    aa38:	de0f70ef          	jal	2018 <__malloc_unlock>
    aa3c:	01012b03          	lw	s6,16(sp)
    aa40:	00c12b83          	lw	s7,12(sp)
    aa44:	00812c03          	lw	s8,8(sp)
    aa48:	e99ff06f          	j	a8e0 <_realloc_r+0x1b4>
    aa4c:	00042683          	lw	a3,0(s0)
    aa50:	01b00713          	li	a4,27
    aa54:	00d52023          	sw	a3,0(a0)
    aa58:	00442683          	lw	a3,4(s0)
    aa5c:	00d52223          	sw	a3,4(a0)
    aa60:	14c76e63          	bltu	a4,a2,abbc <_realloc_r+0x490>
    aa64:	00840713          	add	a4,s0,8
    aa68:	00850793          	add	a5,a0,8
    aa6c:	dd9ff06f          	j	a844 <_realloc_r+0x118>
    aa70:	ffc52783          	lw	a5,-4(a0)
    aa74:	00812c03          	lw	s8,8(sp)
    aa78:	ffc7f793          	and	a5,a5,-4
    aa7c:	00f989b3          	add	s3,s3,a5
    aa80:	e29ff06f          	j	a8a8 <_realloc_r+0x17c>
    aa84:	00cba783          	lw	a5,12(s7)
    aa88:	008ba703          	lw	a4,8(s7)
    aa8c:	ffc98613          	add	a2,s3,-4
    aa90:	02400693          	li	a3,36
    aa94:	00f72623          	sw	a5,12(a4)
    aa98:	00e7a423          	sw	a4,8(a5)
    aa9c:	008b8493          	add	s1,s7,8
    aaa0:	10c6e663          	bltu	a3,a2,abac <_realloc_r+0x480>
    aaa4:	01300713          	li	a4,19
    aaa8:	00048793          	mv	a5,s1
    aaac:	02c77c63          	bgeu	a4,a2,aae4 <_realloc_r+0x3b8>
    aab0:	00042703          	lw	a4,0(s0)
    aab4:	01b00793          	li	a5,27
    aab8:	00eba423          	sw	a4,8(s7)
    aabc:	00442703          	lw	a4,4(s0)
    aac0:	00eba623          	sw	a4,12(s7)
    aac4:	14c7f863          	bgeu	a5,a2,ac14 <_realloc_r+0x4e8>
    aac8:	00842783          	lw	a5,8(s0)
    aacc:	00fba823          	sw	a5,16(s7)
    aad0:	00c42783          	lw	a5,12(s0)
    aad4:	00fbaa23          	sw	a5,20(s7)
    aad8:	0ad60c63          	beq	a2,a3,ab90 <_realloc_r+0x464>
    aadc:	01040413          	add	s0,s0,16
    aae0:	018b8793          	add	a5,s7,24
    aae4:	00042703          	lw	a4,0(s0)
    aae8:	00e7a023          	sw	a4,0(a5)
    aaec:	00442703          	lw	a4,4(s0)
    aaf0:	00e7a223          	sw	a4,4(a5)
    aaf4:	00842703          	lw	a4,8(s0)
    aaf8:	00e7a423          	sw	a4,8(a5)
    aafc:	000b0993          	mv	s3,s6
    ab00:	000b8a93          	mv	s5,s7
    ab04:	01012b03          	lw	s6,16(sp)
    ab08:	00c12b83          	lw	s7,12(sp)
    ab0c:	00812c03          	lw	s8,8(sp)
    ab10:	00048413          	mv	s0,s1
    ab14:	d95ff06f          	j	a8a8 <_realloc_r+0x17c>
    ab18:	00040593          	mv	a1,s0
    ab1c:	ae8fd0ef          	jal	7e04 <memmove>
    ab20:	d3dff06f          	j	a85c <_realloc_r+0x130>
    ab24:	00c6a783          	lw	a5,12(a3)
    ab28:	0086a703          	lw	a4,8(a3)
    ab2c:	ffc98613          	add	a2,s3,-4
    ab30:	02400693          	li	a3,36
    ab34:	00f72623          	sw	a5,12(a4)
    ab38:	00e7a423          	sw	a4,8(a5)
    ab3c:	008ba703          	lw	a4,8(s7)
    ab40:	00cba783          	lw	a5,12(s7)
    ab44:	008b8493          	add	s1,s7,8
    ab48:	00f72623          	sw	a5,12(a4)
    ab4c:	00e7a423          	sw	a4,8(a5)
    ab50:	04c6ee63          	bltu	a3,a2,abac <_realloc_r+0x480>
    ab54:	01300713          	li	a4,19
    ab58:	00048793          	mv	a5,s1
    ab5c:	f8c774e3          	bgeu	a4,a2,aae4 <_realloc_r+0x3b8>
    ab60:	00042703          	lw	a4,0(s0)
    ab64:	01b00793          	li	a5,27
    ab68:	00eba423          	sw	a4,8(s7)
    ab6c:	00442703          	lw	a4,4(s0)
    ab70:	00eba623          	sw	a4,12(s7)
    ab74:	0ac7f063          	bgeu	a5,a2,ac14 <_realloc_r+0x4e8>
    ab78:	00842703          	lw	a4,8(s0)
    ab7c:	02400793          	li	a5,36
    ab80:	00eba823          	sw	a4,16(s7)
    ab84:	00c42703          	lw	a4,12(s0)
    ab88:	00ebaa23          	sw	a4,20(s7)
    ab8c:	f4f618e3          	bne	a2,a5,aadc <_realloc_r+0x3b0>
    ab90:	01042703          	lw	a4,16(s0)
    ab94:	020b8793          	add	a5,s7,32
    ab98:	01840413          	add	s0,s0,24
    ab9c:	00ebac23          	sw	a4,24(s7)
    aba0:	ffc42703          	lw	a4,-4(s0)
    aba4:	00ebae23          	sw	a4,28(s7)
    aba8:	f3dff06f          	j	aae4 <_realloc_r+0x3b8>
    abac:	00040593          	mv	a1,s0
    abb0:	00048513          	mv	a0,s1
    abb4:	a50fd0ef          	jal	7e04 <memmove>
    abb8:	f45ff06f          	j	aafc <_realloc_r+0x3d0>
    abbc:	00842703          	lw	a4,8(s0)
    abc0:	00e52423          	sw	a4,8(a0)
    abc4:	00c42703          	lw	a4,12(s0)
    abc8:	00e52623          	sw	a4,12(a0)
    abcc:	06f60463          	beq	a2,a5,ac34 <_realloc_r+0x508>
    abd0:	01040713          	add	a4,s0,16
    abd4:	01050793          	add	a5,a0,16
    abd8:	c6dff06f          	j	a844 <_realloc_r+0x118>
    abdc:	014a8ab3          	add	s5,s5,s4
    abe0:	414687b3          	sub	a5,a3,s4
    abe4:	015c2423          	sw	s5,8(s8)
    abe8:	0017e793          	or	a5,a5,1
    abec:	00faa223          	sw	a5,4(s5)
    abf0:	ffc42783          	lw	a5,-4(s0)
    abf4:	00090513          	mv	a0,s2
    abf8:	00040493          	mv	s1,s0
    abfc:	0017f793          	and	a5,a5,1
    ac00:	0147e7b3          	or	a5,a5,s4
    ac04:	fef42e23          	sw	a5,-4(s0)
    ac08:	c10f70ef          	jal	2018 <__malloc_unlock>
    ac0c:	00812c03          	lw	s8,8(sp)
    ac10:	cd1ff06f          	j	a8e0 <_realloc_r+0x1b4>
    ac14:	00840413          	add	s0,s0,8
    ac18:	010b8793          	add	a5,s7,16
    ac1c:	ec9ff06f          	j	aae4 <_realloc_r+0x3b8>
    ac20:	00090513          	mv	a0,s2
    ac24:	bf4f70ef          	jal	2018 <__malloc_unlock>
    ac28:	00000493          	li	s1,0
    ac2c:	00812c03          	lw	s8,8(sp)
    ac30:	cb1ff06f          	j	a8e0 <_realloc_r+0x1b4>
    ac34:	01042683          	lw	a3,16(s0)
    ac38:	01840713          	add	a4,s0,24
    ac3c:	01850793          	add	a5,a0,24
    ac40:	00d52823          	sw	a3,16(a0)
    ac44:	01442683          	lw	a3,20(s0)
    ac48:	00d52a23          	sw	a3,20(a0)
    ac4c:	bf9ff06f          	j	a844 <_realloc_r+0x118>
    ac50:	00040593          	mv	a1,s0
    ac54:	00048513          	mv	a0,s1
    ac58:	9acfd0ef          	jal	7e04 <memmove>
    ac5c:	db5ff06f          	j	aa10 <_realloc_r+0x2e4>
    ac60:	00842783          	lw	a5,8(s0)
    ac64:	00fba823          	sw	a5,16(s7)
    ac68:	00c42783          	lw	a5,12(s0)
    ac6c:	00fbaa23          	sw	a5,20(s7)
    ac70:	00d60863          	beq	a2,a3,ac80 <_realloc_r+0x554>
    ac74:	01040413          	add	s0,s0,16
    ac78:	018b8793          	add	a5,s7,24
    ac7c:	d7dff06f          	j	a9f8 <_realloc_r+0x2cc>
    ac80:	01042703          	lw	a4,16(s0)
    ac84:	020b8793          	add	a5,s7,32
    ac88:	01840413          	add	s0,s0,24
    ac8c:	00ebac23          	sw	a4,24(s7)
    ac90:	ffc42703          	lw	a4,-4(s0)
    ac94:	00ebae23          	sw	a4,28(s7)
    ac98:	d61ff06f          	j	a9f8 <_realloc_r+0x2cc>

0000ac9c <__ascii_wctomb>:
    ac9c:	02058463          	beqz	a1,acc4 <__ascii_wctomb+0x28>
    aca0:	0ff00793          	li	a5,255
    aca4:	00c7e863          	bltu	a5,a2,acb4 <__ascii_wctomb+0x18>
    aca8:	00c58023          	sb	a2,0(a1)
    acac:	00100513          	li	a0,1
    acb0:	00008067          	ret
    acb4:	08a00793          	li	a5,138
    acb8:	00f52023          	sw	a5,0(a0)
    acbc:	fff00513          	li	a0,-1
    acc0:	00008067          	ret
    acc4:	00000513          	li	a0,0
    acc8:	00008067          	ret

0000accc <_wcrtomb_r>:
    accc:	fe010113          	add	sp,sp,-32
    acd0:	00812c23          	sw	s0,24(sp)
    acd4:	00912a23          	sw	s1,20(sp)
    acd8:	00112e23          	sw	ra,28(sp)
    acdc:	00050493          	mv	s1,a0
    ace0:	10450413          	add	s0,a0,260
    ace4:	00068463          	beqz	a3,acec <_wcrtomb_r+0x20>
    ace8:	00068413          	mv	s0,a3
    acec:	7fff6797          	auipc	a5,0x7fff6
    acf0:	9287a783          	lw	a5,-1752(a5) # 80000614 <__global_locale+0xe0>
    acf4:	00040693          	mv	a3,s0
    acf8:	02058463          	beqz	a1,ad20 <_wcrtomb_r+0x54>
    acfc:	00048513          	mv	a0,s1
    ad00:	000780e7          	jalr	a5
    ad04:	fff00793          	li	a5,-1
    ad08:	02f50863          	beq	a0,a5,ad38 <_wcrtomb_r+0x6c>
    ad0c:	01c12083          	lw	ra,28(sp)
    ad10:	01812403          	lw	s0,24(sp)
    ad14:	01412483          	lw	s1,20(sp)
    ad18:	02010113          	add	sp,sp,32
    ad1c:	00008067          	ret
    ad20:	00000613          	li	a2,0
    ad24:	00410593          	add	a1,sp,4
    ad28:	00048513          	mv	a0,s1
    ad2c:	000780e7          	jalr	a5
    ad30:	fff00793          	li	a5,-1
    ad34:	fcf51ce3          	bne	a0,a5,ad0c <_wcrtomb_r+0x40>
    ad38:	00042023          	sw	zero,0(s0)
    ad3c:	01c12083          	lw	ra,28(sp)
    ad40:	01812403          	lw	s0,24(sp)
    ad44:	08a00793          	li	a5,138
    ad48:	00f4a023          	sw	a5,0(s1)
    ad4c:	01412483          	lw	s1,20(sp)
    ad50:	02010113          	add	sp,sp,32
    ad54:	00008067          	ret

0000ad58 <_wcsrtombs_r>:
    ad58:	00070793          	mv	a5,a4
    ad5c:	00068713          	mv	a4,a3
    ad60:	fff00693          	li	a3,-1
    ad64:	7a40006f          	j	b508 <_wcsnrtombs_r>

0000ad68 <_fclose_r>:
    ad68:	ff010113          	add	sp,sp,-16
    ad6c:	00112623          	sw	ra,12(sp)
    ad70:	01212023          	sw	s2,0(sp)
    ad74:	0e058263          	beqz	a1,ae58 <_fclose_r+0xf0>
    ad78:	00812423          	sw	s0,8(sp)
    ad7c:	00912223          	sw	s1,4(sp)
    ad80:	00058413          	mv	s0,a1
    ad84:	00050493          	mv	s1,a0
    ad88:	00050663          	beqz	a0,ad94 <_fclose_r+0x2c>
    ad8c:	03452783          	lw	a5,52(a0)
    ad90:	10078063          	beqz	a5,ae90 <_fclose_r+0x128>
    ad94:	06442783          	lw	a5,100(s0)
    ad98:	00c41703          	lh	a4,12(s0)
    ad9c:	0017f793          	and	a5,a5,1
    ada0:	0a079663          	bnez	a5,ae4c <_fclose_r+0xe4>
    ada4:	20077713          	and	a4,a4,512
    ada8:	0e070863          	beqz	a4,ae98 <_fclose_r+0x130>
    adac:	00040593          	mv	a1,s0
    adb0:	00048513          	mv	a0,s1
    adb4:	9f5fb0ef          	jal	67a8 <__sflush_r>
    adb8:	02c42783          	lw	a5,44(s0)
    adbc:	00050913          	mv	s2,a0
    adc0:	00078a63          	beqz	a5,add4 <_fclose_r+0x6c>
    adc4:	01c42583          	lw	a1,28(s0)
    adc8:	00048513          	mv	a0,s1
    adcc:	000780e7          	jalr	a5
    add0:	0a054063          	bltz	a0,ae70 <_fclose_r+0x108>
    add4:	00c45783          	lhu	a5,12(s0)
    add8:	0807f793          	and	a5,a5,128
    addc:	0a079263          	bnez	a5,ae80 <_fclose_r+0x118>
    ade0:	03042583          	lw	a1,48(s0)
    ade4:	00058c63          	beqz	a1,adfc <_fclose_r+0x94>
    ade8:	04040793          	add	a5,s0,64
    adec:	00f58663          	beq	a1,a5,adf8 <_fclose_r+0x90>
    adf0:	00048513          	mv	a0,s1
    adf4:	f2cf60ef          	jal	1520 <_free_r>
    adf8:	02042823          	sw	zero,48(s0)
    adfc:	04442583          	lw	a1,68(s0)
    ae00:	00058863          	beqz	a1,ae10 <_fclose_r+0xa8>
    ae04:	00048513          	mv	a0,s1
    ae08:	f18f60ef          	jal	1520 <_free_r>
    ae0c:	04042223          	sw	zero,68(s0)
    ae10:	f51fb0ef          	jal	6d60 <__sfp_lock_acquire>
    ae14:	06442783          	lw	a5,100(s0)
    ae18:	00041623          	sh	zero,12(s0)
    ae1c:	0017f793          	and	a5,a5,1
    ae20:	0a078663          	beqz	a5,aecc <_fclose_r+0x164>
    ae24:	05842503          	lw	a0,88(s0)
    ae28:	a9cf60ef          	jal	10c4 <__retarget_lock_close_recursive>
    ae2c:	f41fb0ef          	jal	6d6c <__sfp_lock_release>
    ae30:	00c12083          	lw	ra,12(sp)
    ae34:	00812403          	lw	s0,8(sp)
    ae38:	00412483          	lw	s1,4(sp)
    ae3c:	00090513          	mv	a0,s2
    ae40:	00012903          	lw	s2,0(sp)
    ae44:	01010113          	add	sp,sp,16
    ae48:	00008067          	ret
    ae4c:	f60710e3          	bnez	a4,adac <_fclose_r+0x44>
    ae50:	00812403          	lw	s0,8(sp)
    ae54:	00412483          	lw	s1,4(sp)
    ae58:	00000913          	li	s2,0
    ae5c:	00c12083          	lw	ra,12(sp)
    ae60:	00090513          	mv	a0,s2
    ae64:	00012903          	lw	s2,0(sp)
    ae68:	01010113          	add	sp,sp,16
    ae6c:	00008067          	ret
    ae70:	00c45783          	lhu	a5,12(s0)
    ae74:	fff00913          	li	s2,-1
    ae78:	0807f793          	and	a5,a5,128
    ae7c:	f60782e3          	beqz	a5,ade0 <_fclose_r+0x78>
    ae80:	01042583          	lw	a1,16(s0)
    ae84:	00048513          	mv	a0,s1
    ae88:	e98f60ef          	jal	1520 <_free_r>
    ae8c:	f55ff06f          	j	ade0 <_fclose_r+0x78>
    ae90:	e61fb0ef          	jal	6cf0 <__sinit>
    ae94:	f01ff06f          	j	ad94 <_fclose_r+0x2c>
    ae98:	05842503          	lw	a0,88(s0)
    ae9c:	a2cf60ef          	jal	10c8 <__retarget_lock_acquire_recursive>
    aea0:	00c41783          	lh	a5,12(s0)
    aea4:	f00794e3          	bnez	a5,adac <_fclose_r+0x44>
    aea8:	06442783          	lw	a5,100(s0)
    aeac:	0017f793          	and	a5,a5,1
    aeb0:	fa0790e3          	bnez	a5,ae50 <_fclose_r+0xe8>
    aeb4:	05842503          	lw	a0,88(s0)
    aeb8:	00000913          	li	s2,0
    aebc:	a10f60ef          	jal	10cc <__retarget_lock_release_recursive>
    aec0:	00812403          	lw	s0,8(sp)
    aec4:	00412483          	lw	s1,4(sp)
    aec8:	f95ff06f          	j	ae5c <_fclose_r+0xf4>
    aecc:	05842503          	lw	a0,88(s0)
    aed0:	9fcf60ef          	jal	10cc <__retarget_lock_release_recursive>
    aed4:	f51ff06f          	j	ae24 <_fclose_r+0xbc>

0000aed8 <__smakebuf_r>:
    aed8:	00c59783          	lh	a5,12(a1)
    aedc:	f8010113          	add	sp,sp,-128
    aee0:	06812c23          	sw	s0,120(sp)
    aee4:	06112e23          	sw	ra,124(sp)
    aee8:	0027f713          	and	a4,a5,2
    aeec:	00058413          	mv	s0,a1
    aef0:	02070463          	beqz	a4,af18 <__smakebuf_r+0x40>
    aef4:	04358793          	add	a5,a1,67
    aef8:	00f5a023          	sw	a5,0(a1)
    aefc:	00f5a823          	sw	a5,16(a1)
    af00:	00100793          	li	a5,1
    af04:	00f5aa23          	sw	a5,20(a1)
    af08:	07c12083          	lw	ra,124(sp)
    af0c:	07812403          	lw	s0,120(sp)
    af10:	08010113          	add	sp,sp,128
    af14:	00008067          	ret
    af18:	00e59583          	lh	a1,14(a1)
    af1c:	06912a23          	sw	s1,116(sp)
    af20:	07212823          	sw	s2,112(sp)
    af24:	07312623          	sw	s3,108(sp)
    af28:	07412423          	sw	s4,104(sp)
    af2c:	00050493          	mv	s1,a0
    af30:	0805c663          	bltz	a1,afbc <__smakebuf_r+0xe4>
    af34:	00810613          	add	a2,sp,8
    af38:	138000ef          	jal	b070 <_fstat_r>
    af3c:	06054e63          	bltz	a0,afb8 <__smakebuf_r+0xe0>
    af40:	00c12783          	lw	a5,12(sp)
    af44:	0000f937          	lui	s2,0xf
    af48:	000019b7          	lui	s3,0x1
    af4c:	00f97933          	and	s2,s2,a5
    af50:	ffffe7b7          	lui	a5,0xffffe
    af54:	00f90933          	add	s2,s2,a5
    af58:	00193913          	seqz	s2,s2
    af5c:	40000a13          	li	s4,1024
    af60:	80098993          	add	s3,s3,-2048 # 800 <gemm_cfs_2x2+0x26c>
    af64:	000a0593          	mv	a1,s4
    af68:	00048513          	mv	a0,s1
    af6c:	8c1f60ef          	jal	182c <_malloc_r>
    af70:	00c41783          	lh	a5,12(s0)
    af74:	06050863          	beqz	a0,afe4 <__smakebuf_r+0x10c>
    af78:	0807e793          	or	a5,a5,128
    af7c:	00a42023          	sw	a0,0(s0)
    af80:	00a42823          	sw	a0,16(s0)
    af84:	00f41623          	sh	a5,12(s0)
    af88:	01442a23          	sw	s4,20(s0)
    af8c:	0a091063          	bnez	s2,b02c <__smakebuf_r+0x154>
    af90:	0137e7b3          	or	a5,a5,s3
    af94:	07c12083          	lw	ra,124(sp)
    af98:	00f41623          	sh	a5,12(s0)
    af9c:	07812403          	lw	s0,120(sp)
    afa0:	07412483          	lw	s1,116(sp)
    afa4:	07012903          	lw	s2,112(sp)
    afa8:	06c12983          	lw	s3,108(sp)
    afac:	06812a03          	lw	s4,104(sp)
    afb0:	08010113          	add	sp,sp,128
    afb4:	00008067          	ret
    afb8:	00c41783          	lh	a5,12(s0)
    afbc:	0807f793          	and	a5,a5,128
    afc0:	00000913          	li	s2,0
    afc4:	04078e63          	beqz	a5,b020 <__smakebuf_r+0x148>
    afc8:	04000a13          	li	s4,64
    afcc:	000a0593          	mv	a1,s4
    afd0:	00048513          	mv	a0,s1
    afd4:	859f60ef          	jal	182c <_malloc_r>
    afd8:	00c41783          	lh	a5,12(s0)
    afdc:	00000993          	li	s3,0
    afe0:	f8051ce3          	bnez	a0,af78 <__smakebuf_r+0xa0>
    afe4:	2007f713          	and	a4,a5,512
    afe8:	04071e63          	bnez	a4,b044 <__smakebuf_r+0x16c>
    afec:	ffc7f793          	and	a5,a5,-4
    aff0:	0027e793          	or	a5,a5,2
    aff4:	04340713          	add	a4,s0,67
    aff8:	00f41623          	sh	a5,12(s0)
    affc:	00100793          	li	a5,1
    b000:	07412483          	lw	s1,116(sp)
    b004:	07012903          	lw	s2,112(sp)
    b008:	06c12983          	lw	s3,108(sp)
    b00c:	06812a03          	lw	s4,104(sp)
    b010:	00e42023          	sw	a4,0(s0)
    b014:	00e42823          	sw	a4,16(s0)
    b018:	00f42a23          	sw	a5,20(s0)
    b01c:	eedff06f          	j	af08 <__smakebuf_r+0x30>
    b020:	40000a13          	li	s4,1024
    b024:	00000993          	li	s3,0
    b028:	f3dff06f          	j	af64 <__smakebuf_r+0x8c>
    b02c:	00e41583          	lh	a1,14(s0)
    b030:	00048513          	mv	a0,s1
    b034:	09c000ef          	jal	b0d0 <_isatty_r>
    b038:	02051063          	bnez	a0,b058 <__smakebuf_r+0x180>
    b03c:	00c41783          	lh	a5,12(s0)
    b040:	f51ff06f          	j	af90 <__smakebuf_r+0xb8>
    b044:	07412483          	lw	s1,116(sp)
    b048:	07012903          	lw	s2,112(sp)
    b04c:	06c12983          	lw	s3,108(sp)
    b050:	06812a03          	lw	s4,104(sp)
    b054:	eb5ff06f          	j	af08 <__smakebuf_r+0x30>
    b058:	00c45783          	lhu	a5,12(s0)
    b05c:	ffc7f793          	and	a5,a5,-4
    b060:	0017e793          	or	a5,a5,1
    b064:	01079793          	sll	a5,a5,0x10
    b068:	4107d793          	sra	a5,a5,0x10
    b06c:	f25ff06f          	j	af90 <__smakebuf_r+0xb8>

0000b070 <_fstat_r>:
    b070:	ff010113          	add	sp,sp,-16
    b074:	00058713          	mv	a4,a1
    b078:	00812423          	sw	s0,8(sp)
    b07c:	00060593          	mv	a1,a2
    b080:	00050413          	mv	s0,a0
    b084:	00070513          	mv	a0,a4
    b088:	7fff5797          	auipc	a5,0x7fff5
    b08c:	6807ac23          	sw	zero,1688(a5) # 80000720 <errno>
    b090:	00112623          	sw	ra,12(sp)
    b094:	c15f50ef          	jal	ca8 <_fstat>
    b098:	fff00793          	li	a5,-1
    b09c:	00f50a63          	beq	a0,a5,b0b0 <_fstat_r+0x40>
    b0a0:	00c12083          	lw	ra,12(sp)
    b0a4:	00812403          	lw	s0,8(sp)
    b0a8:	01010113          	add	sp,sp,16
    b0ac:	00008067          	ret
    b0b0:	7fff5797          	auipc	a5,0x7fff5
    b0b4:	6707a783          	lw	a5,1648(a5) # 80000720 <errno>
    b0b8:	fe0784e3          	beqz	a5,b0a0 <_fstat_r+0x30>
    b0bc:	00c12083          	lw	ra,12(sp)
    b0c0:	00f42023          	sw	a5,0(s0)
    b0c4:	00812403          	lw	s0,8(sp)
    b0c8:	01010113          	add	sp,sp,16
    b0cc:	00008067          	ret

0000b0d0 <_isatty_r>:
    b0d0:	ff010113          	add	sp,sp,-16
    b0d4:	00812423          	sw	s0,8(sp)
    b0d8:	00050413          	mv	s0,a0
    b0dc:	00058513          	mv	a0,a1
    b0e0:	7fff5797          	auipc	a5,0x7fff5
    b0e4:	6407a023          	sw	zero,1600(a5) # 80000720 <errno>
    b0e8:	00112623          	sw	ra,12(sp)
    b0ec:	bd5f50ef          	jal	cc0 <_isatty>
    b0f0:	fff00793          	li	a5,-1
    b0f4:	00f50a63          	beq	a0,a5,b108 <_isatty_r+0x38>
    b0f8:	00c12083          	lw	ra,12(sp)
    b0fc:	00812403          	lw	s0,8(sp)
    b100:	01010113          	add	sp,sp,16
    b104:	00008067          	ret
    b108:	7fff5797          	auipc	a5,0x7fff5
    b10c:	6187a783          	lw	a5,1560(a5) # 80000720 <errno>
    b110:	fe0784e3          	beqz	a5,b0f8 <_isatty_r+0x28>
    b114:	00c12083          	lw	ra,12(sp)
    b118:	00f42023          	sw	a5,0(s0)
    b11c:	00812403          	lw	s0,8(sp)
    b120:	01010113          	add	sp,sp,16
    b124:	00008067          	ret

0000b128 <__errno>:
    b128:	7fff5517          	auipc	a0,0x7fff5
    b12c:	5e852503          	lw	a0,1512(a0) # 80000710 <_impure_ptr>
    b130:	00008067          	ret

0000b134 <__assert_func>:
    b134:	ff010113          	add	sp,sp,-16
    b138:	00068793          	mv	a5,a3
    b13c:	7fff5717          	auipc	a4,0x7fff5
    b140:	5d472703          	lw	a4,1492(a4) # 80000710 <_impure_ptr>
    b144:	00060813          	mv	a6,a2
    b148:	00112623          	sw	ra,12(sp)
    b14c:	00c72883          	lw	a7,12(a4)
    b150:	00078613          	mv	a2,a5
    b154:	00050693          	mv	a3,a0
    b158:	00058713          	mv	a4,a1
    b15c:	00004797          	auipc	a5,0x4
    b160:	36078793          	add	a5,a5,864 # f4bc <__fini_array_end+0x448>
    b164:	00080c63          	beqz	a6,b17c <__assert_func+0x48>
    b168:	00004597          	auipc	a1,0x4
    b16c:	36458593          	add	a1,a1,868 # f4cc <__fini_array_end+0x458>
    b170:	00088513          	mv	a0,a7
    b174:	3a8000ef          	jal	b51c <fiprintf>
    b178:	3f0000ef          	jal	b568 <abort>
    b17c:	00004797          	auipc	a5,0x4
    b180:	f8c78793          	add	a5,a5,-116 # f108 <__fini_array_end+0x94>
    b184:	00078813          	mv	a6,a5
    b188:	fe1ff06f          	j	b168 <__assert_func+0x34>

0000b18c <_calloc_r>:
    b18c:	fe010113          	add	sp,sp,-32
    b190:	00812c23          	sw	s0,24(sp)
    b194:	00112e23          	sw	ra,28(sp)
    b198:	0105d693          	srl	a3,a1,0x10
    b19c:	00058793          	mv	a5,a1
    b1a0:	00050413          	mv	s0,a0
    b1a4:	01065713          	srl	a4,a2,0x10
    b1a8:	0c069063          	bnez	a3,b268 <_calloc_r+0xdc>
    b1ac:	14071a63          	bnez	a4,b300 <_calloc_r+0x174>
    b1b0:	01061593          	sll	a1,a2,0x10
    b1b4:	01079513          	sll	a0,a5,0x10
    b1b8:	0105d593          	srl	a1,a1,0x10
    b1bc:	01055513          	srl	a0,a0,0x10
    b1c0:	4bd030ef          	jal	ee7c <__mulsi3>
    b1c4:	00050593          	mv	a1,a0
    b1c8:	00040513          	mv	a0,s0
    b1cc:	e60f60ef          	jal	182c <_malloc_r>
    b1d0:	00050413          	mv	s0,a0
    b1d4:	10050a63          	beqz	a0,b2e8 <_calloc_r+0x15c>
    b1d8:	ffc52603          	lw	a2,-4(a0)
    b1dc:	02400713          	li	a4,36
    b1e0:	ffc67613          	and	a2,a2,-4
    b1e4:	ffc60613          	add	a2,a2,-4
    b1e8:	04c76863          	bltu	a4,a2,b238 <_calloc_r+0xac>
    b1ec:	01300693          	li	a3,19
    b1f0:	00050793          	mv	a5,a0
    b1f4:	02c6f263          	bgeu	a3,a2,b218 <_calloc_r+0x8c>
    b1f8:	00052023          	sw	zero,0(a0)
    b1fc:	00052223          	sw	zero,4(a0)
    b200:	01b00793          	li	a5,27
    b204:	04c7f863          	bgeu	a5,a2,b254 <_calloc_r+0xc8>
    b208:	00052423          	sw	zero,8(a0)
    b20c:	00052623          	sw	zero,12(a0)
    b210:	01050793          	add	a5,a0,16
    b214:	10e60263          	beq	a2,a4,b318 <_calloc_r+0x18c>
    b218:	0007a023          	sw	zero,0(a5)
    b21c:	0007a223          	sw	zero,4(a5)
    b220:	0007a423          	sw	zero,8(a5)
    b224:	01c12083          	lw	ra,28(sp)
    b228:	00040513          	mv	a0,s0
    b22c:	01812403          	lw	s0,24(sp)
    b230:	02010113          	add	sp,sp,32
    b234:	00008067          	ret
    b238:	00000593          	li	a1,0
    b23c:	e95f50ef          	jal	10d0 <memset>
    b240:	01c12083          	lw	ra,28(sp)
    b244:	00040513          	mv	a0,s0
    b248:	01812403          	lw	s0,24(sp)
    b24c:	02010113          	add	sp,sp,32
    b250:	00008067          	ret
    b254:	00850793          	add	a5,a0,8
    b258:	0007a023          	sw	zero,0(a5)
    b25c:	0007a223          	sw	zero,4(a5)
    b260:	0007a423          	sw	zero,8(a5)
    b264:	fc1ff06f          	j	b224 <_calloc_r+0x98>
    b268:	0c071663          	bnez	a4,b334 <_calloc_r+0x1a8>
    b26c:	01212823          	sw	s2,16(sp)
    b270:	01312623          	sw	s3,12(sp)
    b274:	00912a23          	sw	s1,20(sp)
    b278:	00068913          	mv	s2,a3
    b27c:	00060993          	mv	s3,a2
    b280:	01079513          	sll	a0,a5,0x10
    b284:	01061593          	sll	a1,a2,0x10
    b288:	0105d593          	srl	a1,a1,0x10
    b28c:	01055513          	srl	a0,a0,0x10
    b290:	3ed030ef          	jal	ee7c <__mulsi3>
    b294:	00050493          	mv	s1,a0
    b298:	01091593          	sll	a1,s2,0x10
    b29c:	01099513          	sll	a0,s3,0x10
    b2a0:	0105d593          	srl	a1,a1,0x10
    b2a4:	01055513          	srl	a0,a0,0x10
    b2a8:	3d5030ef          	jal	ee7c <__mulsi3>
    b2ac:	0104d793          	srl	a5,s1,0x10
    b2b0:	00f505b3          	add	a1,a0,a5
    b2b4:	0105d793          	srl	a5,a1,0x10
    b2b8:	06079863          	bnez	a5,b328 <_calloc_r+0x19c>
    b2bc:	01049493          	sll	s1,s1,0x10
    b2c0:	0104d493          	srl	s1,s1,0x10
    b2c4:	01059593          	sll	a1,a1,0x10
    b2c8:	0095e5b3          	or	a1,a1,s1
    b2cc:	00040513          	mv	a0,s0
    b2d0:	01412483          	lw	s1,20(sp)
    b2d4:	01012903          	lw	s2,16(sp)
    b2d8:	00c12983          	lw	s3,12(sp)
    b2dc:	d50f60ef          	jal	182c <_malloc_r>
    b2e0:	00050413          	mv	s0,a0
    b2e4:	ee051ae3          	bnez	a0,b1d8 <_calloc_r+0x4c>
    b2e8:	00000413          	li	s0,0
    b2ec:	01c12083          	lw	ra,28(sp)
    b2f0:	00040513          	mv	a0,s0
    b2f4:	01812403          	lw	s0,24(sp)
    b2f8:	02010113          	add	sp,sp,32
    b2fc:	00008067          	ret
    b300:	01212823          	sw	s2,16(sp)
    b304:	01312623          	sw	s3,12(sp)
    b308:	00912a23          	sw	s1,20(sp)
    b30c:	00070913          	mv	s2,a4
    b310:	00058993          	mv	s3,a1
    b314:	f6dff06f          	j	b280 <_calloc_r+0xf4>
    b318:	00052823          	sw	zero,16(a0)
    b31c:	01850793          	add	a5,a0,24
    b320:	00052a23          	sw	zero,20(a0)
    b324:	ef5ff06f          	j	b218 <_calloc_r+0x8c>
    b328:	01412483          	lw	s1,20(sp)
    b32c:	01012903          	lw	s2,16(sp)
    b330:	00c12983          	lw	s3,12(sp)
    b334:	df5ff0ef          	jal	b128 <__errno>
    b338:	00c00793          	li	a5,12
    b33c:	00f52023          	sw	a5,0(a0)
    b340:	00000413          	li	s0,0
    b344:	fa9ff06f          	j	b2ec <_calloc_r+0x160>

0000b348 <_wcsnrtombs_l>:
    b348:	fa010113          	add	sp,sp,-96
    b34c:	04912a23          	sw	s1,84(sp)
    b350:	05212823          	sw	s2,80(sp)
    b354:	05312623          	sw	s3,76(sp)
    b358:	05412423          	sw	s4,72(sp)
    b35c:	05512223          	sw	s5,68(sp)
    b360:	04112e23          	sw	ra,92(sp)
    b364:	03912a23          	sw	s9,52(sp)
    b368:	03a12823          	sw	s10,48(sp)
    b36c:	00a12623          	sw	a0,12(sp)
    b370:	00058a13          	mv	s4,a1
    b374:	00060a93          	mv	s5,a2
    b378:	00070913          	mv	s2,a4
    b37c:	00080993          	mv	s3,a6
    b380:	00078493          	mv	s1,a5
    b384:	12078063          	beqz	a5,b4a4 <_wcsnrtombs_l+0x15c>
    b388:	000aac83          	lw	s9,0(s5)
    b38c:	120a0263          	beqz	s4,b4b0 <_wcsnrtombs_l+0x168>
    b390:	14090e63          	beqz	s2,b4ec <_wcsnrtombs_l+0x1a4>
    b394:	05612023          	sw	s6,64(sp)
    b398:	fff68b13          	add	s6,a3,-1
    b39c:	16068063          	beqz	a3,b4fc <_wcsnrtombs_l+0x1b4>
    b3a0:	04812c23          	sw	s0,88(sp)
    b3a4:	03b12623          	sw	s11,44(sp)
    b3a8:	03712e23          	sw	s7,60(sp)
    b3ac:	03812c23          	sw	s8,56(sp)
    b3b0:	000a0413          	mv	s0,s4
    b3b4:	00000d13          	li	s10,0
    b3b8:	fff00d93          	li	s11,-1
    b3bc:	0240006f          	j	b3e0 <_wcsnrtombs_l+0x98>
    b3c0:	080a1a63          	bnez	s4,b454 <_wcsnrtombs_l+0x10c>
    b3c4:	000ca783          	lw	a5,0(s9)
    b3c8:	004c8c93          	add	s9,s9,4
    b3cc:	0c078263          	beqz	a5,b490 <_wcsnrtombs_l+0x148>
    b3d0:	1326f263          	bgeu	a3,s2,b4f4 <_wcsnrtombs_l+0x1ac>
    b3d4:	fffb0b13          	add	s6,s6,-1
    b3d8:	00068d13          	mv	s10,a3
    b3dc:	03bb0c63          	beq	s6,s11,b414 <_wcsnrtombs_l+0xcc>
    b3e0:	0e09a783          	lw	a5,224(s3)
    b3e4:	000ca603          	lw	a2,0(s9)
    b3e8:	00c12503          	lw	a0,12(sp)
    b3ec:	00048693          	mv	a3,s1
    b3f0:	01410593          	add	a1,sp,20
    b3f4:	0004ac03          	lw	s8,0(s1)
    b3f8:	0044ab83          	lw	s7,4(s1)
    b3fc:	000780e7          	jalr	a5
    b400:	0bb50e63          	beq	a0,s11,b4bc <_wcsnrtombs_l+0x174>
    b404:	01a506b3          	add	a3,a0,s10
    b408:	fad97ce3          	bgeu	s2,a3,b3c0 <_wcsnrtombs_l+0x78>
    b40c:	0184a023          	sw	s8,0(s1)
    b410:	0174a223          	sw	s7,4(s1)
    b414:	05812403          	lw	s0,88(sp)
    b418:	04012b03          	lw	s6,64(sp)
    b41c:	03c12b83          	lw	s7,60(sp)
    b420:	03812c03          	lw	s8,56(sp)
    b424:	02c12d83          	lw	s11,44(sp)
    b428:	05c12083          	lw	ra,92(sp)
    b42c:	05412483          	lw	s1,84(sp)
    b430:	05012903          	lw	s2,80(sp)
    b434:	04c12983          	lw	s3,76(sp)
    b438:	04812a03          	lw	s4,72(sp)
    b43c:	04412a83          	lw	s5,68(sp)
    b440:	03412c83          	lw	s9,52(sp)
    b444:	000d0513          	mv	a0,s10
    b448:	03012d03          	lw	s10,48(sp)
    b44c:	06010113          	add	sp,sp,96
    b450:	00008067          	ret
    b454:	08a05063          	blez	a0,b4d4 <_wcsnrtombs_l+0x18c>
    b458:	01410893          	add	a7,sp,20
    b45c:	00a40533          	add	a0,s0,a0
    b460:	0008c783          	lbu	a5,0(a7)
    b464:	00140413          	add	s0,s0,1
    b468:	00188893          	add	a7,a7,1
    b46c:	fef40fa3          	sb	a5,-1(s0)
    b470:	fe8518e3          	bne	a0,s0,b460 <_wcsnrtombs_l+0x118>
    b474:	000aa783          	lw	a5,0(s5)
    b478:	00050413          	mv	s0,a0
    b47c:	00478793          	add	a5,a5,4
    b480:	00faa023          	sw	a5,0(s5)
    b484:	000ca783          	lw	a5,0(s9)
    b488:	004c8c93          	add	s9,s9,4
    b48c:	f40792e3          	bnez	a5,b3d0 <_wcsnrtombs_l+0x88>
    b490:	000a0463          	beqz	s4,b498 <_wcsnrtombs_l+0x150>
    b494:	000aa023          	sw	zero,0(s5)
    b498:	0004a023          	sw	zero,0(s1)
    b49c:	fff68d13          	add	s10,a3,-1
    b4a0:	f75ff06f          	j	b414 <_wcsnrtombs_l+0xcc>
    b4a4:	000aac83          	lw	s9,0(s5)
    b4a8:	10c50493          	add	s1,a0,268
    b4ac:	ee0a12e3          	bnez	s4,b390 <_wcsnrtombs_l+0x48>
    b4b0:	05612023          	sw	s6,64(sp)
    b4b4:	fff00913          	li	s2,-1
    b4b8:	ee1ff06f          	j	b398 <_wcsnrtombs_l+0x50>
    b4bc:	00c12703          	lw	a4,12(sp)
    b4c0:	08a00793          	li	a5,138
    b4c4:	fff00d13          	li	s10,-1
    b4c8:	00f72023          	sw	a5,0(a4)
    b4cc:	0004a023          	sw	zero,0(s1)
    b4d0:	f45ff06f          	j	b414 <_wcsnrtombs_l+0xcc>
    b4d4:	000aa783          	lw	a5,0(s5)
    b4d8:	00040513          	mv	a0,s0
    b4dc:	00050413          	mv	s0,a0
    b4e0:	00478793          	add	a5,a5,4
    b4e4:	00faa023          	sw	a5,0(s5)
    b4e8:	f9dff06f          	j	b484 <_wcsnrtombs_l+0x13c>
    b4ec:	00000d13          	li	s10,0
    b4f0:	f39ff06f          	j	b428 <_wcsnrtombs_l+0xe0>
    b4f4:	00068d13          	mv	s10,a3
    b4f8:	f1dff06f          	j	b414 <_wcsnrtombs_l+0xcc>
    b4fc:	04012b03          	lw	s6,64(sp)
    b500:	00000d13          	li	s10,0
    b504:	f25ff06f          	j	b428 <_wcsnrtombs_l+0xe0>

0000b508 <_wcsnrtombs_r>:
    b508:	7fff5817          	auipc	a6,0x7fff5
    b50c:	02c80813          	add	a6,a6,44 # 80000534 <__global_locale>
    b510:	7fff5517          	auipc	a0,0x7fff5
    b514:	20052503          	lw	a0,512(a0) # 80000710 <_impure_ptr>
    b518:	e31ff06f          	j	b348 <_wcsnrtombs_l>

0000b51c <fiprintf>:
    b51c:	fc010113          	add	sp,sp,-64
    b520:	02810313          	add	t1,sp,40
    b524:	02c12423          	sw	a2,40(sp)
    b528:	02d12623          	sw	a3,44(sp)
    b52c:	00058613          	mv	a2,a1
    b530:	00030693          	mv	a3,t1
    b534:	00050593          	mv	a1,a0
    b538:	7fff5517          	auipc	a0,0x7fff5
    b53c:	1d852503          	lw	a0,472(a0) # 80000710 <_impure_ptr>
    b540:	00112e23          	sw	ra,28(sp)
    b544:	02e12823          	sw	a4,48(sp)
    b548:	02f12a23          	sw	a5,52(sp)
    b54c:	03012c23          	sw	a6,56(sp)
    b550:	03112e23          	sw	a7,60(sp)
    b554:	00612623          	sw	t1,12(sp)
    b558:	9a1f90ef          	jal	4ef8 <_vfiprintf_r>
    b55c:	01c12083          	lw	ra,28(sp)
    b560:	04010113          	add	sp,sp,64
    b564:	00008067          	ret

0000b568 <abort>:
    b568:	ff010113          	add	sp,sp,-16
    b56c:	00600513          	li	a0,6
    b570:	00112623          	sw	ra,12(sp)
    b574:	00c000ef          	jal	b580 <raise>
    b578:	00100513          	li	a0,1
    b57c:	f14f50ef          	jal	c90 <_exit>

0000b580 <raise>:
    b580:	ff010113          	add	sp,sp,-16
    b584:	00912223          	sw	s1,4(sp)
    b588:	00112623          	sw	ra,12(sp)
    b58c:	01f00793          	li	a5,31
    b590:	7fff5497          	auipc	s1,0x7fff5
    b594:	1804a483          	lw	s1,384(s1) # 80000710 <_impure_ptr>
    b598:	08a7ee63          	bltu	a5,a0,b634 <raise+0xb4>
    b59c:	1184a783          	lw	a5,280(s1)
    b5a0:	00812423          	sw	s0,8(sp)
    b5a4:	00050413          	mv	s0,a0
    b5a8:	04078263          	beqz	a5,b5ec <raise+0x6c>
    b5ac:	00251713          	sll	a4,a0,0x2
    b5b0:	00e787b3          	add	a5,a5,a4
    b5b4:	0007a703          	lw	a4,0(a5)
    b5b8:	02070a63          	beqz	a4,b5ec <raise+0x6c>
    b5bc:	00100693          	li	a3,1
    b5c0:	00d70a63          	beq	a4,a3,b5d4 <raise+0x54>
    b5c4:	fff00693          	li	a3,-1
    b5c8:	04d70663          	beq	a4,a3,b614 <raise+0x94>
    b5cc:	0007a023          	sw	zero,0(a5)
    b5d0:	000700e7          	jalr	a4
    b5d4:	00812403          	lw	s0,8(sp)
    b5d8:	00000513          	li	a0,0
    b5dc:	00c12083          	lw	ra,12(sp)
    b5e0:	00412483          	lw	s1,4(sp)
    b5e4:	01010113          	add	sp,sp,16
    b5e8:	00008067          	ret
    b5ec:	00048513          	mv	a0,s1
    b5f0:	0b4000ef          	jal	b6a4 <_getpid_r>
    b5f4:	00040613          	mv	a2,s0
    b5f8:	00812403          	lw	s0,8(sp)
    b5fc:	00c12083          	lw	ra,12(sp)
    b600:	00050593          	mv	a1,a0
    b604:	00048513          	mv	a0,s1
    b608:	00412483          	lw	s1,4(sp)
    b60c:	01010113          	add	sp,sp,16
    b610:	0340006f          	j	b644 <_kill_r>
    b614:	00812403          	lw	s0,8(sp)
    b618:	00c12083          	lw	ra,12(sp)
    b61c:	01600793          	li	a5,22
    b620:	00f4a023          	sw	a5,0(s1)
    b624:	00100513          	li	a0,1
    b628:	00412483          	lw	s1,4(sp)
    b62c:	01010113          	add	sp,sp,16
    b630:	00008067          	ret
    b634:	01600793          	li	a5,22
    b638:	00f4a023          	sw	a5,0(s1)
    b63c:	fff00513          	li	a0,-1
    b640:	f9dff06f          	j	b5dc <raise+0x5c>

0000b644 <_kill_r>:
    b644:	ff010113          	add	sp,sp,-16
    b648:	00058713          	mv	a4,a1
    b64c:	00812423          	sw	s0,8(sp)
    b650:	00060593          	mv	a1,a2
    b654:	00050413          	mv	s0,a0
    b658:	00070513          	mv	a0,a4
    b65c:	7fff5797          	auipc	a5,0x7fff5
    b660:	0c07a223          	sw	zero,196(a5) # 80000720 <errno>
    b664:	00112623          	sw	ra,12(sp)
    b668:	e60f50ef          	jal	cc8 <_kill>
    b66c:	fff00793          	li	a5,-1
    b670:	00f50a63          	beq	a0,a5,b684 <_kill_r+0x40>
    b674:	00c12083          	lw	ra,12(sp)
    b678:	00812403          	lw	s0,8(sp)
    b67c:	01010113          	add	sp,sp,16
    b680:	00008067          	ret
    b684:	7fff5797          	auipc	a5,0x7fff5
    b688:	09c7a783          	lw	a5,156(a5) # 80000720 <errno>
    b68c:	fe0784e3          	beqz	a5,b674 <_kill_r+0x30>
    b690:	00c12083          	lw	ra,12(sp)
    b694:	00f42023          	sw	a5,0(s0)
    b698:	00812403          	lw	s0,8(sp)
    b69c:	01010113          	add	sp,sp,16
    b6a0:	00008067          	ret

0000b6a4 <_getpid_r>:
    b6a4:	e14f506f          	j	cb8 <_getpid>

0000b6a8 <__udivdi3>:
    b6a8:	fd010113          	add	sp,sp,-48
    b6ac:	01312e23          	sw	s3,28(sp)
    b6b0:	02112623          	sw	ra,44(sp)
    b6b4:	01612823          	sw	s6,16(sp)
    b6b8:	00050993          	mv	s3,a0
    b6bc:	16069663          	bnez	a3,b828 <__udivdi3+0x180>
    b6c0:	02812423          	sw	s0,40(sp)
    b6c4:	01512a23          	sw	s5,20(sp)
    b6c8:	02912223          	sw	s1,36(sp)
    b6cc:	03212023          	sw	s2,32(sp)
    b6d0:	01412c23          	sw	s4,24(sp)
    b6d4:	00060a93          	mv	s5,a2
    b6d8:	00050413          	mv	s0,a0
    b6dc:	1cc5f063          	bgeu	a1,a2,b89c <__udivdi3+0x1f4>
    b6e0:	000107b7          	lui	a5,0x10
    b6e4:	00058493          	mv	s1,a1
    b6e8:	2af66e63          	bltu	a2,a5,b9a4 <__udivdi3+0x2fc>
    b6ec:	010007b7          	lui	a5,0x1000
    b6f0:	01800713          	li	a4,24
    b6f4:	00f67463          	bgeu	a2,a5,b6fc <__udivdi3+0x54>
    b6f8:	01000713          	li	a4,16
    b6fc:	00e656b3          	srl	a3,a2,a4
    b700:	00004797          	auipc	a5,0x4
    b704:	3f078793          	add	a5,a5,1008 # faf0 <__clz_tab>
    b708:	00d787b3          	add	a5,a5,a3
    b70c:	0007c783          	lbu	a5,0(a5)
    b710:	02000693          	li	a3,32
    b714:	00e787b3          	add	a5,a5,a4
    b718:	40f68733          	sub	a4,a3,a5
    b71c:	00f68c63          	beq	a3,a5,b734 <__udivdi3+0x8c>
    b720:	00e594b3          	sll	s1,a1,a4
    b724:	00f9d7b3          	srl	a5,s3,a5
    b728:	00e61ab3          	sll	s5,a2,a4
    b72c:	0097e4b3          	or	s1,a5,s1
    b730:	00e99433          	sll	s0,s3,a4
    b734:	010ada13          	srl	s4,s5,0x10
    b738:	000a0593          	mv	a1,s4
    b73c:	00048513          	mv	a0,s1
    b740:	010a9b13          	sll	s6,s5,0x10
    b744:	7fc030ef          	jal	ef40 <__hidden___udivsi3>
    b748:	010b5b13          	srl	s6,s6,0x10
    b74c:	00050593          	mv	a1,a0
    b750:	00050913          	mv	s2,a0
    b754:	000b0513          	mv	a0,s6
    b758:	724030ef          	jal	ee7c <__mulsi3>
    b75c:	00050793          	mv	a5,a0
    b760:	000a0593          	mv	a1,s4
    b764:	00048513          	mv	a0,s1
    b768:	00078493          	mv	s1,a5
    b76c:	01d030ef          	jal	ef88 <__umodsi3>
    b770:	01051513          	sll	a0,a0,0x10
    b774:	01045793          	srl	a5,s0,0x10
    b778:	00a7e7b3          	or	a5,a5,a0
    b77c:	0097fc63          	bgeu	a5,s1,b794 <__udivdi3+0xec>
    b780:	00fa87b3          	add	a5,s5,a5
    b784:	fff90713          	add	a4,s2,-1 # efff <__clzsi2+0x13>
    b788:	0157e463          	bltu	a5,s5,b790 <__udivdi3+0xe8>
    b78c:	5a97e863          	bltu	a5,s1,bd3c <__udivdi3+0x694>
    b790:	00070913          	mv	s2,a4
    b794:	409784b3          	sub	s1,a5,s1
    b798:	000a0593          	mv	a1,s4
    b79c:	00048513          	mv	a0,s1
    b7a0:	7a0030ef          	jal	ef40 <__hidden___udivsi3>
    b7a4:	00050593          	mv	a1,a0
    b7a8:	00050993          	mv	s3,a0
    b7ac:	000b0513          	mv	a0,s6
    b7b0:	6cc030ef          	jal	ee7c <__mulsi3>
    b7b4:	00050793          	mv	a5,a0
    b7b8:	000a0593          	mv	a1,s4
    b7bc:	00048513          	mv	a0,s1
    b7c0:	01041413          	sll	s0,s0,0x10
    b7c4:	00078493          	mv	s1,a5
    b7c8:	7c0030ef          	jal	ef88 <__umodsi3>
    b7cc:	01051513          	sll	a0,a0,0x10
    b7d0:	01045413          	srl	s0,s0,0x10
    b7d4:	00a46433          	or	s0,s0,a0
    b7d8:	00947c63          	bgeu	s0,s1,b7f0 <__udivdi3+0x148>
    b7dc:	008a8433          	add	s0,s5,s0
    b7e0:	fff98793          	add	a5,s3,-1
    b7e4:	4d546e63          	bltu	s0,s5,bcc0 <__udivdi3+0x618>
    b7e8:	ffe98993          	add	s3,s3,-2
    b7ec:	4c947a63          	bgeu	s0,s1,bcc0 <__udivdi3+0x618>
    b7f0:	01091613          	sll	a2,s2,0x10
    b7f4:	01366533          	or	a0,a2,s3
    b7f8:	00000b13          	li	s6,0
    b7fc:	02812403          	lw	s0,40(sp)
    b800:	02c12083          	lw	ra,44(sp)
    b804:	02412483          	lw	s1,36(sp)
    b808:	02012903          	lw	s2,32(sp)
    b80c:	01812a03          	lw	s4,24(sp)
    b810:	01412a83          	lw	s5,20(sp)
    b814:	01c12983          	lw	s3,28(sp)
    b818:	000b0593          	mv	a1,s6
    b81c:	01012b03          	lw	s6,16(sp)
    b820:	03010113          	add	sp,sp,48
    b824:	00008067          	ret
    b828:	02d5f263          	bgeu	a1,a3,b84c <__udivdi3+0x1a4>
    b82c:	00000b13          	li	s6,0
    b830:	00000513          	li	a0,0
    b834:	02c12083          	lw	ra,44(sp)
    b838:	01c12983          	lw	s3,28(sp)
    b83c:	000b0593          	mv	a1,s6
    b840:	01012b03          	lw	s6,16(sp)
    b844:	03010113          	add	sp,sp,48
    b848:	00008067          	ret
    b84c:	000107b7          	lui	a5,0x10
    b850:	26f6ee63          	bltu	a3,a5,bacc <__udivdi3+0x424>
    b854:	01000737          	lui	a4,0x1000
    b858:	01800793          	li	a5,24
    b85c:	00e6f463          	bgeu	a3,a4,b864 <__udivdi3+0x1bc>
    b860:	01000793          	li	a5,16
    b864:	00f6d533          	srl	a0,a3,a5
    b868:	00004717          	auipc	a4,0x4
    b86c:	28870713          	add	a4,a4,648 # faf0 <__clz_tab>
    b870:	00a70733          	add	a4,a4,a0
    b874:	00074703          	lbu	a4,0(a4)
    b878:	02000513          	li	a0,32
    b87c:	00f70733          	add	a4,a4,a5
    b880:	40e50b33          	sub	s6,a0,a4
    b884:	26e51c63          	bne	a0,a4,bafc <__udivdi3+0x454>
    b888:	46b6ee63          	bltu	a3,a1,bd04 <__udivdi3+0x65c>
    b88c:	00c9b533          	sltu	a0,s3,a2
    b890:	00153513          	seqz	a0,a0
    b894:	00000b13          	li	s6,0
    b898:	f9dff06f          	j	b834 <__udivdi3+0x18c>
    b89c:	10060c63          	beqz	a2,b9b4 <__udivdi3+0x30c>
    b8a0:	000107b7          	lui	a5,0x10
    b8a4:	44f67663          	bgeu	a2,a5,bcf0 <__udivdi3+0x648>
    b8a8:	10063713          	sltiu	a4,a2,256
    b8ac:	00173713          	seqz	a4,a4
    b8b0:	00371713          	sll	a4,a4,0x3
    b8b4:	00e656b3          	srl	a3,a2,a4
    b8b8:	00004797          	auipc	a5,0x4
    b8bc:	23878793          	add	a5,a5,568 # faf0 <__clz_tab>
    b8c0:	00d787b3          	add	a5,a5,a3
    b8c4:	0007c483          	lbu	s1,0(a5)
    b8c8:	02000793          	li	a5,32
    b8cc:	00e484b3          	add	s1,s1,a4
    b8d0:	40978733          	sub	a4,a5,s1
    b8d4:	10979463          	bne	a5,s1,b9dc <__udivdi3+0x334>
    b8d8:	01061a13          	sll	s4,a2,0x10
    b8dc:	40c584b3          	sub	s1,a1,a2
    b8e0:	01065913          	srl	s2,a2,0x10
    b8e4:	010a5a13          	srl	s4,s4,0x10
    b8e8:	00100b13          	li	s6,1
    b8ec:	00090593          	mv	a1,s2
    b8f0:	00048513          	mv	a0,s1
    b8f4:	64c030ef          	jal	ef40 <__hidden___udivsi3>
    b8f8:	000a0593          	mv	a1,s4
    b8fc:	00050993          	mv	s3,a0
    b900:	57c030ef          	jal	ee7c <__mulsi3>
    b904:	00050793          	mv	a5,a0
    b908:	00090593          	mv	a1,s2
    b90c:	00048513          	mv	a0,s1
    b910:	00078493          	mv	s1,a5
    b914:	674030ef          	jal	ef88 <__umodsi3>
    b918:	01051513          	sll	a0,a0,0x10
    b91c:	01045793          	srl	a5,s0,0x10
    b920:	00a7e7b3          	or	a5,a5,a0
    b924:	0097fc63          	bgeu	a5,s1,b93c <__udivdi3+0x294>
    b928:	00fa87b3          	add	a5,s5,a5
    b92c:	fff98713          	add	a4,s3,-1
    b930:	0157e463          	bltu	a5,s5,b938 <__udivdi3+0x290>
    b934:	3e97ee63          	bltu	a5,s1,bd30 <__udivdi3+0x688>
    b938:	00070993          	mv	s3,a4
    b93c:	409784b3          	sub	s1,a5,s1
    b940:	00090593          	mv	a1,s2
    b944:	00048513          	mv	a0,s1
    b948:	5f8030ef          	jal	ef40 <__hidden___udivsi3>
    b94c:	000a0593          	mv	a1,s4
    b950:	00050a13          	mv	s4,a0
    b954:	528030ef          	jal	ee7c <__mulsi3>
    b958:	00050793          	mv	a5,a0
    b95c:	00090593          	mv	a1,s2
    b960:	00048513          	mv	a0,s1
    b964:	01041413          	sll	s0,s0,0x10
    b968:	00078493          	mv	s1,a5
    b96c:	61c030ef          	jal	ef88 <__umodsi3>
    b970:	01051513          	sll	a0,a0,0x10
    b974:	01045413          	srl	s0,s0,0x10
    b978:	00a46433          	or	s0,s0,a0
    b97c:	00947e63          	bgeu	s0,s1,b998 <__udivdi3+0x2f0>
    b980:	008a8433          	add	s0,s5,s0
    b984:	fffa0793          	add	a5,s4,-1
    b988:	01546663          	bltu	s0,s5,b994 <__udivdi3+0x2ec>
    b98c:	ffea0a13          	add	s4,s4,-2
    b990:	00946463          	bltu	s0,s1,b998 <__udivdi3+0x2f0>
    b994:	00078a13          	mv	s4,a5
    b998:	01099613          	sll	a2,s3,0x10
    b99c:	01466533          	or	a0,a2,s4
    b9a0:	e5dff06f          	j	b7fc <__udivdi3+0x154>
    b9a4:	10063713          	sltiu	a4,a2,256
    b9a8:	00173713          	seqz	a4,a4
    b9ac:	00371713          	sll	a4,a4,0x3
    b9b0:	d4dff06f          	j	b6fc <__udivdi3+0x54>
    b9b4:	00000693          	li	a3,0
    b9b8:	00004797          	auipc	a5,0x4
    b9bc:	13878793          	add	a5,a5,312 # faf0 <__clz_tab>
    b9c0:	00d787b3          	add	a5,a5,a3
    b9c4:	0007c483          	lbu	s1,0(a5)
    b9c8:	00000713          	li	a4,0
    b9cc:	02000793          	li	a5,32
    b9d0:	00e484b3          	add	s1,s1,a4
    b9d4:	40978733          	sub	a4,a5,s1
    b9d8:	f09780e3          	beq	a5,s1,b8d8 <__udivdi3+0x230>
    b9dc:	00e61ab3          	sll	s5,a2,a4
    b9e0:	01712623          	sw	s7,12(sp)
    b9e4:	010ad913          	srl	s2,s5,0x10
    b9e8:	0095dbb3          	srl	s7,a1,s1
    b9ec:	00e597b3          	sll	a5,a1,a4
    b9f0:	0099d4b3          	srl	s1,s3,s1
    b9f4:	00090593          	mv	a1,s2
    b9f8:	000b8513          	mv	a0,s7
    b9fc:	010a9a13          	sll	s4,s5,0x10
    ba00:	00f4e4b3          	or	s1,s1,a5
    ba04:	00e99433          	sll	s0,s3,a4
    ba08:	010a5a13          	srl	s4,s4,0x10
    ba0c:	534030ef          	jal	ef40 <__hidden___udivsi3>
    ba10:	00050593          	mv	a1,a0
    ba14:	00050b13          	mv	s6,a0
    ba18:	000a0513          	mv	a0,s4
    ba1c:	460030ef          	jal	ee7c <__mulsi3>
    ba20:	00050993          	mv	s3,a0
    ba24:	00090593          	mv	a1,s2
    ba28:	000b8513          	mv	a0,s7
    ba2c:	55c030ef          	jal	ef88 <__umodsi3>
    ba30:	01051513          	sll	a0,a0,0x10
    ba34:	0104d793          	srl	a5,s1,0x10
    ba38:	00a7e7b3          	or	a5,a5,a0
    ba3c:	0137fe63          	bgeu	a5,s3,ba58 <__udivdi3+0x3b0>
    ba40:	00fa87b3          	add	a5,s5,a5
    ba44:	fffb0713          	add	a4,s6,-1
    ba48:	2d57ec63          	bltu	a5,s5,bd20 <__udivdi3+0x678>
    ba4c:	2d37fa63          	bgeu	a5,s3,bd20 <__udivdi3+0x678>
    ba50:	ffeb0b13          	add	s6,s6,-2
    ba54:	015787b3          	add	a5,a5,s5
    ba58:	413789b3          	sub	s3,a5,s3
    ba5c:	00090593          	mv	a1,s2
    ba60:	00098513          	mv	a0,s3
    ba64:	4dc030ef          	jal	ef40 <__hidden___udivsi3>
    ba68:	00050593          	mv	a1,a0
    ba6c:	00050b93          	mv	s7,a0
    ba70:	000a0513          	mv	a0,s4
    ba74:	408030ef          	jal	ee7c <__mulsi3>
    ba78:	00050793          	mv	a5,a0
    ba7c:	00090593          	mv	a1,s2
    ba80:	00098513          	mv	a0,s3
    ba84:	01049493          	sll	s1,s1,0x10
    ba88:	00078993          	mv	s3,a5
    ba8c:	4fc030ef          	jal	ef88 <__umodsi3>
    ba90:	01051513          	sll	a0,a0,0x10
    ba94:	0104d493          	srl	s1,s1,0x10
    ba98:	00a4e4b3          	or	s1,s1,a0
    ba9c:	0134fe63          	bgeu	s1,s3,bab8 <__udivdi3+0x410>
    baa0:	009a84b3          	add	s1,s5,s1
    baa4:	fffb8793          	add	a5,s7,-1
    baa8:	2754e463          	bltu	s1,s5,bd10 <__udivdi3+0x668>
    baac:	2734f263          	bgeu	s1,s3,bd10 <__udivdi3+0x668>
    bab0:	ffeb8b93          	add	s7,s7,-2
    bab4:	015484b3          	add	s1,s1,s5
    bab8:	010b1b13          	sll	s6,s6,0x10
    babc:	017b6b33          	or	s6,s6,s7
    bac0:	413484b3          	sub	s1,s1,s3
    bac4:	00c12b83          	lw	s7,12(sp)
    bac8:	e25ff06f          	j	b8ec <__udivdi3+0x244>
    bacc:	1006b793          	sltiu	a5,a3,256
    bad0:	0017b793          	seqz	a5,a5
    bad4:	00379793          	sll	a5,a5,0x3
    bad8:	00f6d533          	srl	a0,a3,a5
    badc:	00004717          	auipc	a4,0x4
    bae0:	01470713          	add	a4,a4,20 # faf0 <__clz_tab>
    bae4:	00a70733          	add	a4,a4,a0
    bae8:	00074703          	lbu	a4,0(a4)
    baec:	02000513          	li	a0,32
    baf0:	00f70733          	add	a4,a4,a5
    baf4:	40e50b33          	sub	s6,a0,a4
    baf8:	d8e508e3          	beq	a0,a4,b888 <__udivdi3+0x1e0>
    bafc:	016696b3          	sll	a3,a3,s6
    bb00:	01912223          	sw	s9,4(sp)
    bb04:	00e65cb3          	srl	s9,a2,a4
    bb08:	00dcecb3          	or	s9,s9,a3
    bb0c:	01512a23          	sw	s5,20(sp)
    bb10:	01712623          	sw	s7,12(sp)
    bb14:	010cda93          	srl	s5,s9,0x10
    bb18:	00e5dbb3          	srl	s7,a1,a4
    bb1c:	016597b3          	sll	a5,a1,s6
    bb20:	00e9d733          	srl	a4,s3,a4
    bb24:	01812423          	sw	s8,8(sp)
    bb28:	000a8593          	mv	a1,s5
    bb2c:	000b8513          	mv	a0,s7
    bb30:	010c9c13          	sll	s8,s9,0x10
    bb34:	02812423          	sw	s0,40(sp)
    bb38:	02912223          	sw	s1,36(sp)
    bb3c:	03212023          	sw	s2,32(sp)
    bb40:	00f764b3          	or	s1,a4,a5
    bb44:	01661933          	sll	s2,a2,s6
    bb48:	01412c23          	sw	s4,24(sp)
    bb4c:	010c5c13          	srl	s8,s8,0x10
    bb50:	3f0030ef          	jal	ef40 <__hidden___udivsi3>
    bb54:	00050593          	mv	a1,a0
    bb58:	00050413          	mv	s0,a0
    bb5c:	000c0513          	mv	a0,s8
    bb60:	31c030ef          	jal	ee7c <__mulsi3>
    bb64:	00050a13          	mv	s4,a0
    bb68:	000a8593          	mv	a1,s5
    bb6c:	000b8513          	mv	a0,s7
    bb70:	418030ef          	jal	ef88 <__umodsi3>
    bb74:	01051513          	sll	a0,a0,0x10
    bb78:	0104d793          	srl	a5,s1,0x10
    bb7c:	00a7e7b3          	or	a5,a5,a0
    bb80:	0147fe63          	bgeu	a5,s4,bb9c <__udivdi3+0x4f4>
    bb84:	00fc87b3          	add	a5,s9,a5
    bb88:	fff40713          	add	a4,s0,-1
    bb8c:	1997ee63          	bltu	a5,s9,bd28 <__udivdi3+0x680>
    bb90:	1947fc63          	bgeu	a5,s4,bd28 <__udivdi3+0x680>
    bb94:	ffe40413          	add	s0,s0,-2
    bb98:	019787b3          	add	a5,a5,s9
    bb9c:	41478a33          	sub	s4,a5,s4
    bba0:	000a8593          	mv	a1,s5
    bba4:	000a0513          	mv	a0,s4
    bba8:	398030ef          	jal	ef40 <__hidden___udivsi3>
    bbac:	00050593          	mv	a1,a0
    bbb0:	00050b93          	mv	s7,a0
    bbb4:	000c0513          	mv	a0,s8
    bbb8:	2c4030ef          	jal	ee7c <__mulsi3>
    bbbc:	00050793          	mv	a5,a0
    bbc0:	000a8593          	mv	a1,s5
    bbc4:	000a0513          	mv	a0,s4
    bbc8:	00078a13          	mv	s4,a5
    bbcc:	3bc030ef          	jal	ef88 <__umodsi3>
    bbd0:	01049713          	sll	a4,s1,0x10
    bbd4:	01051513          	sll	a0,a0,0x10
    bbd8:	01075713          	srl	a4,a4,0x10
    bbdc:	00a76733          	or	a4,a4,a0
    bbe0:	01477e63          	bgeu	a4,s4,bbfc <__udivdi3+0x554>
    bbe4:	00ec8733          	add	a4,s9,a4
    bbe8:	fffb8793          	add	a5,s7,-1
    bbec:	13976663          	bltu	a4,s9,bd18 <__udivdi3+0x670>
    bbf0:	13477463          	bgeu	a4,s4,bd18 <__udivdi3+0x670>
    bbf4:	ffeb8b93          	add	s7,s7,-2
    bbf8:	01970733          	add	a4,a4,s9
    bbfc:	00010e37          	lui	t3,0x10
    bc00:	01041413          	sll	s0,s0,0x10
    bc04:	01746433          	or	s0,s0,s7
    bc08:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    bc0c:	00f47833          	and	a6,s0,a5
    bc10:	00f977b3          	and	a5,s2,a5
    bc14:	41470733          	sub	a4,a4,s4
    bc18:	01045e93          	srl	t4,s0,0x10
    bc1c:	01095913          	srl	s2,s2,0x10
    bc20:	00080513          	mv	a0,a6
    bc24:	00078593          	mv	a1,a5
    bc28:	254030ef          	jal	ee7c <__mulsi3>
    bc2c:	00050313          	mv	t1,a0
    bc30:	00090593          	mv	a1,s2
    bc34:	00080513          	mv	a0,a6
    bc38:	244030ef          	jal	ee7c <__mulsi3>
    bc3c:	00050813          	mv	a6,a0
    bc40:	00078593          	mv	a1,a5
    bc44:	000e8513          	mv	a0,t4
    bc48:	234030ef          	jal	ee7c <__mulsi3>
    bc4c:	00050893          	mv	a7,a0
    bc50:	00090593          	mv	a1,s2
    bc54:	000e8513          	mv	a0,t4
    bc58:	224030ef          	jal	ee7c <__mulsi3>
    bc5c:	01035793          	srl	a5,t1,0x10
    bc60:	01180833          	add	a6,a6,a7
    bc64:	010787b3          	add	a5,a5,a6
    bc68:	0117f463          	bgeu	a5,a7,bc70 <__udivdi3+0x5c8>
    bc6c:	01c50533          	add	a0,a0,t3
    bc70:	0107d693          	srl	a3,a5,0x10
    bc74:	00a686b3          	add	a3,a3,a0
    bc78:	06d76863          	bltu	a4,a3,bce8 <__udivdi3+0x640>
    bc7c:	04d70663          	beq	a4,a3,bcc8 <__udivdi3+0x620>
    bc80:	00040513          	mv	a0,s0
    bc84:	02812403          	lw	s0,40(sp)
    bc88:	02c12083          	lw	ra,44(sp)
    bc8c:	00000b13          	li	s6,0
    bc90:	02412483          	lw	s1,36(sp)
    bc94:	02012903          	lw	s2,32(sp)
    bc98:	01812a03          	lw	s4,24(sp)
    bc9c:	01412a83          	lw	s5,20(sp)
    bca0:	00c12b83          	lw	s7,12(sp)
    bca4:	00812c03          	lw	s8,8(sp)
    bca8:	00412c83          	lw	s9,4(sp)
    bcac:	01c12983          	lw	s3,28(sp)
    bcb0:	000b0593          	mv	a1,s6
    bcb4:	01012b03          	lw	s6,16(sp)
    bcb8:	03010113          	add	sp,sp,48
    bcbc:	00008067          	ret
    bcc0:	00078993          	mv	s3,a5
    bcc4:	b2dff06f          	j	b7f0 <__udivdi3+0x148>
    bcc8:	00010737          	lui	a4,0x10
    bccc:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    bcd0:	00e7f7b3          	and	a5,a5,a4
    bcd4:	01079793          	sll	a5,a5,0x10
    bcd8:	00e37333          	and	t1,t1,a4
    bcdc:	01699533          	sll	a0,s3,s6
    bce0:	006787b3          	add	a5,a5,t1
    bce4:	f8f57ee3          	bgeu	a0,a5,bc80 <__udivdi3+0x5d8>
    bce8:	fff40513          	add	a0,s0,-1
    bcec:	f99ff06f          	j	bc84 <__udivdi3+0x5dc>
    bcf0:	010007b7          	lui	a5,0x1000
    bcf4:	04f67a63          	bgeu	a2,a5,bd48 <__udivdi3+0x6a0>
    bcf8:	01065693          	srl	a3,a2,0x10
    bcfc:	01000713          	li	a4,16
    bd00:	bb9ff06f          	j	b8b8 <__udivdi3+0x210>
    bd04:	00000b13          	li	s6,0
    bd08:	00100513          	li	a0,1
    bd0c:	b29ff06f          	j	b834 <__udivdi3+0x18c>
    bd10:	00078b93          	mv	s7,a5
    bd14:	da5ff06f          	j	bab8 <__udivdi3+0x410>
    bd18:	00078b93          	mv	s7,a5
    bd1c:	ee1ff06f          	j	bbfc <__udivdi3+0x554>
    bd20:	00070b13          	mv	s6,a4
    bd24:	d35ff06f          	j	ba58 <__udivdi3+0x3b0>
    bd28:	00070413          	mv	s0,a4
    bd2c:	e71ff06f          	j	bb9c <__udivdi3+0x4f4>
    bd30:	ffe98993          	add	s3,s3,-2
    bd34:	015787b3          	add	a5,a5,s5
    bd38:	c05ff06f          	j	b93c <__udivdi3+0x294>
    bd3c:	ffe90913          	add	s2,s2,-2
    bd40:	015787b3          	add	a5,a5,s5
    bd44:	a51ff06f          	j	b794 <__udivdi3+0xec>
    bd48:	01865693          	srl	a3,a2,0x18
    bd4c:	01800713          	li	a4,24
    bd50:	b69ff06f          	j	b8b8 <__udivdi3+0x210>

0000bd54 <__umoddi3>:
    bd54:	fd010113          	add	sp,sp,-48
    bd58:	02112623          	sw	ra,44(sp)
    bd5c:	00050793          	mv	a5,a0
    bd60:	14069663          	bnez	a3,beac <__umoddi3+0x158>
    bd64:	03212023          	sw	s2,32(sp)
    bd68:	01412c23          	sw	s4,24(sp)
    bd6c:	02812423          	sw	s0,40(sp)
    bd70:	02912223          	sw	s1,36(sp)
    bd74:	01312e23          	sw	s3,28(sp)
    bd78:	01512a23          	sw	s5,20(sp)
    bd7c:	00060a13          	mv	s4,a2
    bd80:	00050913          	mv	s2,a0
    bd84:	1ac5f663          	bgeu	a1,a2,bf30 <__umoddi3+0x1dc>
    bd88:	01612823          	sw	s6,16(sp)
    bd8c:	00010737          	lui	a4,0x10
    bd90:	00058993          	mv	s3,a1
    bd94:	28e66063          	bltu	a2,a4,c014 <__umoddi3+0x2c0>
    bd98:	01000737          	lui	a4,0x1000
    bd9c:	01800693          	li	a3,24
    bda0:	00e67463          	bgeu	a2,a4,bda8 <__umoddi3+0x54>
    bda4:	01000693          	li	a3,16
    bda8:	00d65533          	srl	a0,a2,a3
    bdac:	00004717          	auipc	a4,0x4
    bdb0:	d4470713          	add	a4,a4,-700 # faf0 <__clz_tab>
    bdb4:	00a70733          	add	a4,a4,a0
    bdb8:	00074703          	lbu	a4,0(a4)
    bdbc:	02000513          	li	a0,32
    bdc0:	00d70733          	add	a4,a4,a3
    bdc4:	40e504b3          	sub	s1,a0,a4
    bdc8:	00e50c63          	beq	a0,a4,bde0 <__umoddi3+0x8c>
    bdcc:	009599b3          	sll	s3,a1,s1
    bdd0:	00e7d733          	srl	a4,a5,a4
    bdd4:	00961a33          	sll	s4,a2,s1
    bdd8:	013769b3          	or	s3,a4,s3
    bddc:	00979933          	sll	s2,a5,s1
    bde0:	010a5a93          	srl	s5,s4,0x10
    bde4:	000a8593          	mv	a1,s5
    bde8:	00098513          	mv	a0,s3
    bdec:	010a1b13          	sll	s6,s4,0x10
    bdf0:	150030ef          	jal	ef40 <__hidden___udivsi3>
    bdf4:	010b5b13          	srl	s6,s6,0x10
    bdf8:	000b0593          	mv	a1,s6
    bdfc:	080030ef          	jal	ee7c <__mulsi3>
    be00:	00050413          	mv	s0,a0
    be04:	000a8593          	mv	a1,s5
    be08:	00098513          	mv	a0,s3
    be0c:	17c030ef          	jal	ef88 <__umodsi3>
    be10:	01051513          	sll	a0,a0,0x10
    be14:	01095793          	srl	a5,s2,0x10
    be18:	00a7e7b3          	or	a5,a5,a0
    be1c:	0087f863          	bgeu	a5,s0,be2c <__umoddi3+0xd8>
    be20:	00fa07b3          	add	a5,s4,a5
    be24:	0147e463          	bltu	a5,s4,be2c <__umoddi3+0xd8>
    be28:	5687e863          	bltu	a5,s0,c398 <__umoddi3+0x644>
    be2c:	40878433          	sub	s0,a5,s0
    be30:	000a8593          	mv	a1,s5
    be34:	00040513          	mv	a0,s0
    be38:	108030ef          	jal	ef40 <__hidden___udivsi3>
    be3c:	000b0593          	mv	a1,s6
    be40:	03c030ef          	jal	ee7c <__mulsi3>
    be44:	00050793          	mv	a5,a0
    be48:	000a8593          	mv	a1,s5
    be4c:	00040513          	mv	a0,s0
    be50:	00078413          	mv	s0,a5
    be54:	134030ef          	jal	ef88 <__umodsi3>
    be58:	01091793          	sll	a5,s2,0x10
    be5c:	01051513          	sll	a0,a0,0x10
    be60:	0107d793          	srl	a5,a5,0x10
    be64:	00a7e7b3          	or	a5,a5,a0
    be68:	0087f863          	bgeu	a5,s0,be78 <__umoddi3+0x124>
    be6c:	00fa07b3          	add	a5,s4,a5
    be70:	0147e463          	bltu	a5,s4,be78 <__umoddi3+0x124>
    be74:	5087ea63          	bltu	a5,s0,c388 <__umoddi3+0x634>
    be78:	01012b03          	lw	s6,16(sp)
    be7c:	408787b3          	sub	a5,a5,s0
    be80:	0097d533          	srl	a0,a5,s1
    be84:	02812403          	lw	s0,40(sp)
    be88:	02412483          	lw	s1,36(sp)
    be8c:	02012903          	lw	s2,32(sp)
    be90:	01c12983          	lw	s3,28(sp)
    be94:	01812a03          	lw	s4,24(sp)
    be98:	01412a83          	lw	s5,20(sp)
    be9c:	00000593          	li	a1,0
    bea0:	02c12083          	lw	ra,44(sp)
    bea4:	03010113          	add	sp,sp,48
    bea8:	00008067          	ret
    beac:	00050893          	mv	a7,a0
    beb0:	fed5e8e3          	bltu	a1,a3,bea0 <__umoddi3+0x14c>
    beb4:	03212023          	sw	s2,32(sp)
    beb8:	01312e23          	sw	s3,28(sp)
    bebc:	00010737          	lui	a4,0x10
    bec0:	00058813          	mv	a6,a1
    bec4:	24e6ec63          	bltu	a3,a4,c11c <__umoddi3+0x3c8>
    bec8:	01000737          	lui	a4,0x1000
    becc:	01800513          	li	a0,24
    bed0:	00e6f463          	bgeu	a3,a4,bed8 <__umoddi3+0x184>
    bed4:	01000513          	li	a0,16
    bed8:	00a6d333          	srl	t1,a3,a0
    bedc:	00004717          	auipc	a4,0x4
    bee0:	c1470713          	add	a4,a4,-1004 # faf0 <__clz_tab>
    bee4:	00670733          	add	a4,a4,t1
    bee8:	00074703          	lbu	a4,0(a4)
    beec:	02000313          	li	t1,32
    bef0:	00a709b3          	add	s3,a4,a0
    bef4:	41330933          	sub	s2,t1,s3
    bef8:	25331a63          	bne	t1,s3,c14c <__umoddi3+0x3f8>
    befc:	00b6e463          	bltu	a3,a1,bf04 <__umoddi3+0x1b0>
    bf00:	00c7ea63          	bltu	a5,a2,bf14 <__umoddi3+0x1c0>
    bf04:	40c788b3          	sub	a7,a5,a2
    bf08:	40d586b3          	sub	a3,a1,a3
    bf0c:	0117b833          	sltu	a6,a5,a7
    bf10:	41068833          	sub	a6,a3,a6
    bf14:	02c12083          	lw	ra,44(sp)
    bf18:	02012903          	lw	s2,32(sp)
    bf1c:	01c12983          	lw	s3,28(sp)
    bf20:	00088513          	mv	a0,a7
    bf24:	00080593          	mv	a1,a6
    bf28:	03010113          	add	sp,sp,48
    bf2c:	00008067          	ret
    bf30:	0e060a63          	beqz	a2,c024 <__umoddi3+0x2d0>
    bf34:	00010737          	lui	a4,0x10
    bf38:	42e67663          	bgeu	a2,a4,c364 <__umoddi3+0x610>
    bf3c:	10063693          	sltiu	a3,a2,256
    bf40:	0016b693          	seqz	a3,a3
    bf44:	00369693          	sll	a3,a3,0x3
    bf48:	00d65533          	srl	a0,a2,a3
    bf4c:	00004717          	auipc	a4,0x4
    bf50:	ba470713          	add	a4,a4,-1116 # faf0 <__clz_tab>
    bf54:	00a70733          	add	a4,a4,a0
    bf58:	00074983          	lbu	s3,0(a4)
    bf5c:	02000713          	li	a4,32
    bf60:	00d989b3          	add	s3,s3,a3
    bf64:	413704b3          	sub	s1,a4,s3
    bf68:	0f371263          	bne	a4,s3,c04c <__umoddi3+0x2f8>
    bf6c:	01061413          	sll	s0,a2,0x10
    bf70:	40c589b3          	sub	s3,a1,a2
    bf74:	01065a93          	srl	s5,a2,0x10
    bf78:	01045413          	srl	s0,s0,0x10
    bf7c:	000a8593          	mv	a1,s5
    bf80:	00098513          	mv	a0,s3
    bf84:	7bd020ef          	jal	ef40 <__hidden___udivsi3>
    bf88:	00040593          	mv	a1,s0
    bf8c:	6f1020ef          	jal	ee7c <__mulsi3>
    bf90:	00050793          	mv	a5,a0
    bf94:	000a8593          	mv	a1,s5
    bf98:	00098513          	mv	a0,s3
    bf9c:	00078993          	mv	s3,a5
    bfa0:	7e9020ef          	jal	ef88 <__umodsi3>
    bfa4:	01051513          	sll	a0,a0,0x10
    bfa8:	01095793          	srl	a5,s2,0x10
    bfac:	00a7e7b3          	or	a5,a5,a0
    bfb0:	0137f863          	bgeu	a5,s3,bfc0 <__umoddi3+0x26c>
    bfb4:	00fa07b3          	add	a5,s4,a5
    bfb8:	0147e463          	bltu	a5,s4,bfc0 <__umoddi3+0x26c>
    bfbc:	3d37ea63          	bltu	a5,s3,c390 <__umoddi3+0x63c>
    bfc0:	413789b3          	sub	s3,a5,s3
    bfc4:	000a8593          	mv	a1,s5
    bfc8:	00098513          	mv	a0,s3
    bfcc:	775020ef          	jal	ef40 <__hidden___udivsi3>
    bfd0:	00040593          	mv	a1,s0
    bfd4:	6a9020ef          	jal	ee7c <__mulsi3>
    bfd8:	00050413          	mv	s0,a0
    bfdc:	000a8593          	mv	a1,s5
    bfe0:	00098513          	mv	a0,s3
    bfe4:	7a5020ef          	jal	ef88 <__umodsi3>
    bfe8:	01091913          	sll	s2,s2,0x10
    bfec:	01051793          	sll	a5,a0,0x10
    bff0:	01095913          	srl	s2,s2,0x10
    bff4:	00f967b3          	or	a5,s2,a5
    bff8:	0087fa63          	bgeu	a5,s0,c00c <__umoddi3+0x2b8>
    bffc:	00fa07b3          	add	a5,s4,a5
    c000:	0147e663          	bltu	a5,s4,c00c <__umoddi3+0x2b8>
    c004:	0087f463          	bgeu	a5,s0,c00c <__umoddi3+0x2b8>
    c008:	014787b3          	add	a5,a5,s4
    c00c:	408787b3          	sub	a5,a5,s0
    c010:	e71ff06f          	j	be80 <__umoddi3+0x12c>
    c014:	10063693          	sltiu	a3,a2,256
    c018:	0016b693          	seqz	a3,a3
    c01c:	00369693          	sll	a3,a3,0x3
    c020:	d89ff06f          	j	bda8 <__umoddi3+0x54>
    c024:	00000513          	li	a0,0
    c028:	00004717          	auipc	a4,0x4
    c02c:	ac870713          	add	a4,a4,-1336 # faf0 <__clz_tab>
    c030:	00a70733          	add	a4,a4,a0
    c034:	00074983          	lbu	s3,0(a4)
    c038:	00000693          	li	a3,0
    c03c:	02000713          	li	a4,32
    c040:	00d989b3          	add	s3,s3,a3
    c044:	413704b3          	sub	s1,a4,s3
    c048:	f33702e3          	beq	a4,s3,bf6c <__umoddi3+0x218>
    c04c:	00961a33          	sll	s4,a2,s1
    c050:	01712623          	sw	s7,12(sp)
    c054:	010a5a93          	srl	s5,s4,0x10
    c058:	0135dbb3          	srl	s7,a1,s3
    c05c:	00959733          	sll	a4,a1,s1
    c060:	0137d9b3          	srl	s3,a5,s3
    c064:	000a8593          	mv	a1,s5
    c068:	000b8513          	mv	a0,s7
    c06c:	010a1413          	sll	s0,s4,0x10
    c070:	00e9e9b3          	or	s3,s3,a4
    c074:	00979933          	sll	s2,a5,s1
    c078:	01612823          	sw	s6,16(sp)
    c07c:	01045413          	srl	s0,s0,0x10
    c080:	6c1020ef          	jal	ef40 <__hidden___udivsi3>
    c084:	00040593          	mv	a1,s0
    c088:	5f5020ef          	jal	ee7c <__mulsi3>
    c08c:	00050b13          	mv	s6,a0
    c090:	000a8593          	mv	a1,s5
    c094:	000b8513          	mv	a0,s7
    c098:	6f1020ef          	jal	ef88 <__umodsi3>
    c09c:	01051513          	sll	a0,a0,0x10
    c0a0:	0109d793          	srl	a5,s3,0x10
    c0a4:	00a7e7b3          	or	a5,a5,a0
    c0a8:	0167fa63          	bgeu	a5,s6,c0bc <__umoddi3+0x368>
    c0ac:	00fa07b3          	add	a5,s4,a5
    c0b0:	0147e663          	bltu	a5,s4,c0bc <__umoddi3+0x368>
    c0b4:	0167f463          	bgeu	a5,s6,c0bc <__umoddi3+0x368>
    c0b8:	014787b3          	add	a5,a5,s4
    c0bc:	41678b33          	sub	s6,a5,s6
    c0c0:	000a8593          	mv	a1,s5
    c0c4:	000b0513          	mv	a0,s6
    c0c8:	679020ef          	jal	ef40 <__hidden___udivsi3>
    c0cc:	00040593          	mv	a1,s0
    c0d0:	5ad020ef          	jal	ee7c <__mulsi3>
    c0d4:	00050793          	mv	a5,a0
    c0d8:	000a8593          	mv	a1,s5
    c0dc:	000b0513          	mv	a0,s6
    c0e0:	01099993          	sll	s3,s3,0x10
    c0e4:	00078b13          	mv	s6,a5
    c0e8:	6a1020ef          	jal	ef88 <__umodsi3>
    c0ec:	01051513          	sll	a0,a0,0x10
    c0f0:	0109d993          	srl	s3,s3,0x10
    c0f4:	00a9e9b3          	or	s3,s3,a0
    c0f8:	0169fa63          	bgeu	s3,s6,c10c <__umoddi3+0x3b8>
    c0fc:	013a09b3          	add	s3,s4,s3
    c100:	0149e663          	bltu	s3,s4,c10c <__umoddi3+0x3b8>
    c104:	0169f463          	bgeu	s3,s6,c10c <__umoddi3+0x3b8>
    c108:	014989b3          	add	s3,s3,s4
    c10c:	416989b3          	sub	s3,s3,s6
    c110:	00c12b83          	lw	s7,12(sp)
    c114:	01012b03          	lw	s6,16(sp)
    c118:	e65ff06f          	j	bf7c <__umoddi3+0x228>
    c11c:	1006b513          	sltiu	a0,a3,256
    c120:	00153513          	seqz	a0,a0
    c124:	00351513          	sll	a0,a0,0x3
    c128:	00a6d333          	srl	t1,a3,a0
    c12c:	00004717          	auipc	a4,0x4
    c130:	9c470713          	add	a4,a4,-1596 # faf0 <__clz_tab>
    c134:	00670733          	add	a4,a4,t1
    c138:	00074703          	lbu	a4,0(a4)
    c13c:	02000313          	li	t1,32
    c140:	00a709b3          	add	s3,a4,a0
    c144:	41330933          	sub	s2,t1,s3
    c148:	db330ae3          	beq	t1,s3,befc <__umoddi3+0x1a8>
    c14c:	01512a23          	sw	s5,20(sp)
    c150:	012696b3          	sll	a3,a3,s2
    c154:	01365ab3          	srl	s5,a2,s3
    c158:	00daeab3          	or	s5,s5,a3
    c15c:	01712623          	sw	s7,12(sp)
    c160:	01a12023          	sw	s10,0(sp)
    c164:	010adb93          	srl	s7,s5,0x10
    c168:	0135dd33          	srl	s10,a1,s3
    c16c:	01259733          	sll	a4,a1,s2
    c170:	0137d6b3          	srl	a3,a5,s3
    c174:	01912223          	sw	s9,4(sp)
    c178:	000b8593          	mv	a1,s7
    c17c:	000d0513          	mv	a0,s10
    c180:	010a9c93          	sll	s9,s5,0x10
    c184:	02812423          	sw	s0,40(sp)
    c188:	02912223          	sw	s1,36(sp)
    c18c:	01261433          	sll	s0,a2,s2
    c190:	012794b3          	sll	s1,a5,s2
    c194:	01412c23          	sw	s4,24(sp)
    c198:	01612823          	sw	s6,16(sp)
    c19c:	00e6ea33          	or	s4,a3,a4
    c1a0:	01812423          	sw	s8,8(sp)
    c1a4:	010cdc93          	srl	s9,s9,0x10
    c1a8:	599020ef          	jal	ef40 <__hidden___udivsi3>
    c1ac:	00050593          	mv	a1,a0
    c1b0:	00050b13          	mv	s6,a0
    c1b4:	000c8513          	mv	a0,s9
    c1b8:	4c5020ef          	jal	ee7c <__mulsi3>
    c1bc:	00050c13          	mv	s8,a0
    c1c0:	000b8593          	mv	a1,s7
    c1c4:	000d0513          	mv	a0,s10
    c1c8:	5c1020ef          	jal	ef88 <__umodsi3>
    c1cc:	01051513          	sll	a0,a0,0x10
    c1d0:	010a5793          	srl	a5,s4,0x10
    c1d4:	00a7e7b3          	or	a5,a5,a0
    c1d8:	0187fe63          	bgeu	a5,s8,c1f4 <__umoddi3+0x4a0>
    c1dc:	00fa87b3          	add	a5,s5,a5
    c1e0:	fffb0713          	add	a4,s6,-1
    c1e4:	1957ee63          	bltu	a5,s5,c380 <__umoddi3+0x62c>
    c1e8:	1987fc63          	bgeu	a5,s8,c380 <__umoddi3+0x62c>
    c1ec:	ffeb0b13          	add	s6,s6,-2
    c1f0:	015787b3          	add	a5,a5,s5
    c1f4:	41878c33          	sub	s8,a5,s8
    c1f8:	000b8593          	mv	a1,s7
    c1fc:	000c0513          	mv	a0,s8
    c200:	541020ef          	jal	ef40 <__hidden___udivsi3>
    c204:	00050593          	mv	a1,a0
    c208:	00050d13          	mv	s10,a0
    c20c:	000c8513          	mv	a0,s9
    c210:	46d020ef          	jal	ee7c <__mulsi3>
    c214:	00050793          	mv	a5,a0
    c218:	000b8593          	mv	a1,s7
    c21c:	000c0513          	mv	a0,s8
    c220:	00078b93          	mv	s7,a5
    c224:	565020ef          	jal	ef88 <__umodsi3>
    c228:	010a1593          	sll	a1,s4,0x10
    c22c:	01051513          	sll	a0,a0,0x10
    c230:	0105d593          	srl	a1,a1,0x10
    c234:	00a5e5b3          	or	a1,a1,a0
    c238:	0175fe63          	bgeu	a1,s7,c254 <__umoddi3+0x500>
    c23c:	00ba85b3          	add	a1,s5,a1
    c240:	fffd0793          	add	a5,s10,-1
    c244:	1355ea63          	bltu	a1,s5,c378 <__umoddi3+0x624>
    c248:	1375f863          	bgeu	a1,s7,c378 <__umoddi3+0x624>
    c24c:	ffed0d13          	add	s10,s10,-2
    c250:	015585b3          	add	a1,a1,s5
    c254:	010b1793          	sll	a5,s6,0x10
    c258:	00010e37          	lui	t3,0x10
    c25c:	01a7e7b3          	or	a5,a5,s10
    c260:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    c264:	0067f8b3          	and	a7,a5,t1
    c268:	00647333          	and	t1,s0,t1
    c26c:	41758733          	sub	a4,a1,s7
    c270:	0107d793          	srl	a5,a5,0x10
    c274:	01045e93          	srl	t4,s0,0x10
    c278:	00088513          	mv	a0,a7
    c27c:	00030593          	mv	a1,t1
    c280:	3fd020ef          	jal	ee7c <__mulsi3>
    c284:	00050813          	mv	a6,a0
    c288:	000e8593          	mv	a1,t4
    c28c:	00088513          	mv	a0,a7
    c290:	3ed020ef          	jal	ee7c <__mulsi3>
    c294:	00050893          	mv	a7,a0
    c298:	00030593          	mv	a1,t1
    c29c:	00078513          	mv	a0,a5
    c2a0:	3dd020ef          	jal	ee7c <__mulsi3>
    c2a4:	00050313          	mv	t1,a0
    c2a8:	000e8593          	mv	a1,t4
    c2ac:	00078513          	mv	a0,a5
    c2b0:	3cd020ef          	jal	ee7c <__mulsi3>
    c2b4:	01085793          	srl	a5,a6,0x10
    c2b8:	006888b3          	add	a7,a7,t1
    c2bc:	011787b3          	add	a5,a5,a7
    c2c0:	0067f463          	bgeu	a5,t1,c2c8 <__umoddi3+0x574>
    c2c4:	01c50533          	add	a0,a0,t3
    c2c8:	00010637          	lui	a2,0x10
    c2cc:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    c2d0:	0107d693          	srl	a3,a5,0x10
    c2d4:	00c7f7b3          	and	a5,a5,a2
    c2d8:	01079793          	sll	a5,a5,0x10
    c2dc:	00c87833          	and	a6,a6,a2
    c2e0:	00a686b3          	add	a3,a3,a0
    c2e4:	010787b3          	add	a5,a5,a6
    c2e8:	06d76263          	bltu	a4,a3,c34c <__umoddi3+0x5f8>
    c2ec:	04d70e63          	beq	a4,a3,c348 <__umoddi3+0x5f4>
    c2f0:	40f487b3          	sub	a5,s1,a5
    c2f4:	00f4b4b3          	sltu	s1,s1,a5
    c2f8:	02812403          	lw	s0,40(sp)
    c2fc:	02c12083          	lw	ra,44(sp)
    c300:	40d705b3          	sub	a1,a4,a3
    c304:	409585b3          	sub	a1,a1,s1
    c308:	01359733          	sll	a4,a1,s3
    c30c:	0127d7b3          	srl	a5,a5,s2
    c310:	02412483          	lw	s1,36(sp)
    c314:	01c12983          	lw	s3,28(sp)
    c318:	01812a03          	lw	s4,24(sp)
    c31c:	01412a83          	lw	s5,20(sp)
    c320:	01012b03          	lw	s6,16(sp)
    c324:	00c12b83          	lw	s7,12(sp)
    c328:	00812c03          	lw	s8,8(sp)
    c32c:	00412c83          	lw	s9,4(sp)
    c330:	00012d03          	lw	s10,0(sp)
    c334:	0125d5b3          	srl	a1,a1,s2
    c338:	00f76533          	or	a0,a4,a5
    c33c:	02012903          	lw	s2,32(sp)
    c340:	03010113          	add	sp,sp,48
    c344:	00008067          	ret
    c348:	faf4f4e3          	bgeu	s1,a5,c2f0 <__umoddi3+0x59c>
    c34c:	40878433          	sub	s0,a5,s0
    c350:	0087b7b3          	sltu	a5,a5,s0
    c354:	01578ab3          	add	s5,a5,s5
    c358:	415686b3          	sub	a3,a3,s5
    c35c:	00040793          	mv	a5,s0
    c360:	f91ff06f          	j	c2f0 <__umoddi3+0x59c>
    c364:	01000737          	lui	a4,0x1000
    c368:	02e67c63          	bgeu	a2,a4,c3a0 <__umoddi3+0x64c>
    c36c:	01065513          	srl	a0,a2,0x10
    c370:	01000693          	li	a3,16
    c374:	bd9ff06f          	j	bf4c <__umoddi3+0x1f8>
    c378:	00078d13          	mv	s10,a5
    c37c:	ed9ff06f          	j	c254 <__umoddi3+0x500>
    c380:	00070b13          	mv	s6,a4
    c384:	e71ff06f          	j	c1f4 <__umoddi3+0x4a0>
    c388:	014787b3          	add	a5,a5,s4
    c38c:	aedff06f          	j	be78 <__umoddi3+0x124>
    c390:	014787b3          	add	a5,a5,s4
    c394:	c2dff06f          	j	bfc0 <__umoddi3+0x26c>
    c398:	014787b3          	add	a5,a5,s4
    c39c:	a91ff06f          	j	be2c <__umoddi3+0xd8>
    c3a0:	01865513          	srl	a0,a2,0x18
    c3a4:	01800693          	li	a3,24
    c3a8:	ba5ff06f          	j	bf4c <__umoddi3+0x1f8>

0000c3ac <__adddf3>:
    c3ac:	001007b7          	lui	a5,0x100
    c3b0:	fe010113          	add	sp,sp,-32
    c3b4:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c3b8:	00bef833          	and	a6,t4,a1
    c3bc:	00def7b3          	and	a5,t4,a3
    c3c0:	0146d313          	srl	t1,a3,0x14
    c3c4:	01212823          	sw	s2,16(sp)
    c3c8:	0145d913          	srl	s2,a1,0x14
    c3cc:	00379793          	sll	a5,a5,0x3
    c3d0:	00812c23          	sw	s0,24(sp)
    c3d4:	00381813          	sll	a6,a6,0x3
    c3d8:	01f5d413          	srl	s0,a1,0x1f
    c3dc:	01d55713          	srl	a4,a0,0x1d
    c3e0:	01d65893          	srl	a7,a2,0x1d
    c3e4:	7ff97913          	and	s2,s2,2047
    c3e8:	7ff37313          	and	t1,t1,2047
    c3ec:	00112e23          	sw	ra,28(sp)
    c3f0:	00912a23          	sw	s1,20(sp)
    c3f4:	01312623          	sw	s3,12(sp)
    c3f8:	01f6d693          	srl	a3,a3,0x1f
    c3fc:	00f8e8b3          	or	a7,a7,a5
    c400:	01076733          	or	a4,a4,a6
    c404:	00351593          	sll	a1,a0,0x3
    c408:	00361f13          	sll	t5,a2,0x3
    c40c:	406907b3          	sub	a5,s2,t1
    c410:	1ed40463          	beq	s0,a3,c5f8 <__adddf3+0x24c>
    c414:	16f05263          	blez	a5,c578 <__adddf3+0x1cc>
    c418:	28030663          	beqz	t1,c6a4 <__adddf3+0x2f8>
    c41c:	7ff00693          	li	a3,2047
    c420:	42d90663          	beq	s2,a3,c84c <__adddf3+0x4a0>
    c424:	03800693          	li	a3,56
    c428:	00100613          	li	a2,1
    c42c:	02f6ce63          	blt	a3,a5,c468 <__adddf3+0xbc>
    c430:	008006b7          	lui	a3,0x800
    c434:	00d8e8b3          	or	a7,a7,a3
    c438:	01f00693          	li	a3,31
    c43c:	52f6ce63          	blt	a3,a5,c978 <__adddf3+0x5cc>
    c440:	02000693          	li	a3,32
    c444:	40f686b3          	sub	a3,a3,a5
    c448:	00d89633          	sll	a2,a7,a3
    c44c:	00ff5533          	srl	a0,t5,a5
    c450:	00df16b3          	sll	a3,t5,a3
    c454:	00a66633          	or	a2,a2,a0
    c458:	00d036b3          	snez	a3,a3
    c45c:	00f8d8b3          	srl	a7,a7,a5
    c460:	00d66633          	or	a2,a2,a3
    c464:	41170733          	sub	a4,a4,a7
    c468:	40c58633          	sub	a2,a1,a2
    c46c:	00c5b5b3          	sltu	a1,a1,a2
    c470:	00060493          	mv	s1,a2
    c474:	40b709b3          	sub	s3,a4,a1
    c478:	00899793          	sll	a5,s3,0x8
    c47c:	3207da63          	bgez	a5,c7b0 <__adddf3+0x404>
    c480:	008007b7          	lui	a5,0x800
    c484:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c488:	00f9f9b3          	and	s3,s3,a5
    c48c:	2c098863          	beqz	s3,c75c <__adddf3+0x3b0>
    c490:	00098513          	mv	a0,s3
    c494:	359020ef          	jal	efec <__clzsi2>
    c498:	ff850793          	add	a5,a0,-8
    c49c:	02000693          	li	a3,32
    c4a0:	40f68733          	sub	a4,a3,a5
    c4a4:	00e4d733          	srl	a4,s1,a4
    c4a8:	00f999b3          	sll	s3,s3,a5
    c4ac:	01376733          	or	a4,a4,s3
    c4b0:	00f494b3          	sll	s1,s1,a5
    c4b4:	4b27c863          	blt	a5,s2,c964 <__adddf3+0x5b8>
    c4b8:	412787b3          	sub	a5,a5,s2
    c4bc:	00178793          	add	a5,a5,1
    c4c0:	40f686b3          	sub	a3,a3,a5
    c4c4:	00d49633          	sll	a2,s1,a3
    c4c8:	00f4d9b3          	srl	s3,s1,a5
    c4cc:	00c03633          	snez	a2,a2
    c4d0:	01366633          	or	a2,a2,s3
    c4d4:	00d716b3          	sll	a3,a4,a3
    c4d8:	00c6e4b3          	or	s1,a3,a2
    c4dc:	00f759b3          	srl	s3,a4,a5
    c4e0:	00000913          	li	s2,0
    c4e4:	0074f793          	and	a5,s1,7
    c4e8:	02078063          	beqz	a5,c508 <__adddf3+0x15c>
    c4ec:	00f4f793          	and	a5,s1,15
    c4f0:	00400713          	li	a4,4
    c4f4:	00e78a63          	beq	a5,a4,c508 <__adddf3+0x15c>
    c4f8:	00448793          	add	a5,s1,4
    c4fc:	0097b633          	sltu	a2,a5,s1
    c500:	00c989b3          	add	s3,s3,a2
    c504:	00078493          	mv	s1,a5
    c508:	00899793          	sll	a5,s3,0x8
    c50c:	6e07da63          	bgez	a5,cc00 <__adddf3+0x854>
    c510:	00190793          	add	a5,s2,1
    c514:	7ff00713          	li	a4,2047
    c518:	00040e13          	mv	t3,s0
    c51c:	2ae78663          	beq	a5,a4,c7c8 <__adddf3+0x41c>
    c520:	ff800737          	lui	a4,0xff800
    c524:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c528:	00e9f733          	and	a4,s3,a4
    c52c:	7ff7f793          	and	a5,a5,2047
    c530:	01d71813          	sll	a6,a4,0x1d
    c534:	0034d613          	srl	a2,s1,0x3
    c538:	00971713          	sll	a4,a4,0x9
    c53c:	00c86833          	or	a6,a6,a2
    c540:	00c75713          	srl	a4,a4,0xc
    c544:	01c12083          	lw	ra,28(sp)
    c548:	01812403          	lw	s0,24(sp)
    c54c:	01479793          	sll	a5,a5,0x14
    c550:	00e7e7b3          	or	a5,a5,a4
    c554:	01fe1713          	sll	a4,t3,0x1f
    c558:	00e7e7b3          	or	a5,a5,a4
    c55c:	01412483          	lw	s1,20(sp)
    c560:	01012903          	lw	s2,16(sp)
    c564:	00c12983          	lw	s3,12(sp)
    c568:	00080513          	mv	a0,a6
    c56c:	00078593          	mv	a1,a5
    c570:	02010113          	add	sp,sp,32
    c574:	00008067          	ret
    c578:	14078c63          	beqz	a5,c6d0 <__adddf3+0x324>
    c57c:	412307b3          	sub	a5,t1,s2
    c580:	3c091263          	bnez	s2,c944 <__adddf3+0x598>
    c584:	00b76533          	or	a0,a4,a1
    c588:	4c050463          	beqz	a0,ca50 <__adddf3+0x6a4>
    c58c:	fff78513          	add	a0,a5,-1
    c590:	60050263          	beqz	a0,cb94 <__adddf3+0x7e8>
    c594:	7ff00813          	li	a6,2047
    c598:	57078663          	beq	a5,a6,cb04 <__adddf3+0x758>
    c59c:	03800793          	li	a5,56
    c5a0:	00100613          	li	a2,1
    c5a4:	02a7cc63          	blt	a5,a0,c5dc <__adddf3+0x230>
    c5a8:	00050793          	mv	a5,a0
    c5ac:	01f00613          	li	a2,31
    c5b0:	56f64c63          	blt	a2,a5,cb28 <__adddf3+0x77c>
    c5b4:	02000513          	li	a0,32
    c5b8:	40f50533          	sub	a0,a0,a5
    c5bc:	00a71633          	sll	a2,a4,a0
    c5c0:	00f5d833          	srl	a6,a1,a5
    c5c4:	00a59533          	sll	a0,a1,a0
    c5c8:	01066633          	or	a2,a2,a6
    c5cc:	00a03533          	snez	a0,a0
    c5d0:	00f75733          	srl	a4,a4,a5
    c5d4:	00a66633          	or	a2,a2,a0
    c5d8:	40e888b3          	sub	a7,a7,a4
    c5dc:	40cf0633          	sub	a2,t5,a2
    c5e0:	00cf3733          	sltu	a4,t5,a2
    c5e4:	00060493          	mv	s1,a2
    c5e8:	40e889b3          	sub	s3,a7,a4
    c5ec:	00030913          	mv	s2,t1
    c5f0:	00068413          	mv	s0,a3
    c5f4:	e85ff06f          	j	c478 <__adddf3+0xcc>
    c5f8:	1ef05063          	blez	a5,c7d8 <__adddf3+0x42c>
    c5fc:	14031063          	bnez	t1,c73c <__adddf3+0x390>
    c600:	01e8e6b3          	or	a3,a7,t5
    c604:	26068c63          	beqz	a3,c87c <__adddf3+0x4d0>
    c608:	fff78693          	add	a3,a5,-1
    c60c:	48068063          	beqz	a3,ca8c <__adddf3+0x6e0>
    c610:	7ff00613          	li	a2,2047
    c614:	22c78c63          	beq	a5,a2,c84c <__adddf3+0x4a0>
    c618:	03800793          	li	a5,56
    c61c:	00100993          	li	s3,1
    c620:	02d7cc63          	blt	a5,a3,c658 <__adddf3+0x2ac>
    c624:	00068793          	mv	a5,a3
    c628:	01f00693          	li	a3,31
    c62c:	4af6c063          	blt	a3,a5,cacc <__adddf3+0x720>
    c630:	02000693          	li	a3,32
    c634:	40f686b3          	sub	a3,a3,a5
    c638:	00d899b3          	sll	s3,a7,a3
    c63c:	00ff5633          	srl	a2,t5,a5
    c640:	00df16b3          	sll	a3,t5,a3
    c644:	00c9e9b3          	or	s3,s3,a2
    c648:	00d036b3          	snez	a3,a3
    c64c:	00f8d8b3          	srl	a7,a7,a5
    c650:	00d9e9b3          	or	s3,s3,a3
    c654:	01170733          	add	a4,a4,a7
    c658:	00b985b3          	add	a1,s3,a1
    c65c:	0135b9b3          	sltu	s3,a1,s3
    c660:	00058493          	mv	s1,a1
    c664:	00e989b3          	add	s3,s3,a4
    c668:	00899793          	sll	a5,s3,0x8
    c66c:	1407d263          	bgez	a5,c7b0 <__adddf3+0x404>
    c670:	00190913          	add	s2,s2,1
    c674:	7ff00793          	li	a5,2047
    c678:	36f90c63          	beq	s2,a5,c9f0 <__adddf3+0x644>
    c67c:	ff8007b7          	lui	a5,0xff800
    c680:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c684:	0014f613          	and	a2,s1,1
    c688:	00f9f7b3          	and	a5,s3,a5
    c68c:	0014d713          	srl	a4,s1,0x1
    c690:	00c76733          	or	a4,a4,a2
    c694:	01f79613          	sll	a2,a5,0x1f
    c698:	00e664b3          	or	s1,a2,a4
    c69c:	0017d993          	srl	s3,a5,0x1
    c6a0:	e45ff06f          	j	c4e4 <__adddf3+0x138>
    c6a4:	01e8e6b3          	or	a3,a7,t5
    c6a8:	1c068a63          	beqz	a3,c87c <__adddf3+0x4d0>
    c6ac:	fff78693          	add	a3,a5,-1
    c6b0:	40068063          	beqz	a3,cab0 <__adddf3+0x704>
    c6b4:	7ff00613          	li	a2,2047
    c6b8:	18c78a63          	beq	a5,a2,c84c <__adddf3+0x4a0>
    c6bc:	03800793          	li	a5,56
    c6c0:	00100613          	li	a2,1
    c6c4:	dad7c2e3          	blt	a5,a3,c468 <__adddf3+0xbc>
    c6c8:	00068793          	mv	a5,a3
    c6cc:	d6dff06f          	j	c438 <__adddf3+0x8c>
    c6d0:	00190813          	add	a6,s2,1
    c6d4:	7fe87813          	and	a6,a6,2046
    c6d8:	22081c63          	bnez	a6,c910 <__adddf3+0x564>
    c6dc:	00b76333          	or	t1,a4,a1
    c6e0:	01e8e833          	or	a6,a7,t5
    c6e4:	38091063          	bnez	s2,ca64 <__adddf3+0x6b8>
    c6e8:	46030e63          	beqz	t1,cb64 <__adddf3+0x7b8>
    c6ec:	40080663          	beqz	a6,caf8 <__adddf3+0x74c>
    c6f0:	41e589b3          	sub	s3,a1,t5
    c6f4:	0135b533          	sltu	a0,a1,s3
    c6f8:	41170633          	sub	a2,a4,a7
    c6fc:	40a60633          	sub	a2,a2,a0
    c700:	00861513          	sll	a0,a2,0x8
    c704:	50055e63          	bgez	a0,cc20 <__adddf3+0x874>
    c708:	40bf05b3          	sub	a1,t5,a1
    c70c:	40e88733          	sub	a4,a7,a4
    c710:	00bf3f33          	sltu	t5,t5,a1
    c714:	41e70733          	sub	a4,a4,t5
    c718:	00871613          	sll	a2,a4,0x8
    c71c:	00058493          	mv	s1,a1
    c720:	52065e63          	bgez	a2,cc5c <__adddf3+0x8b0>
    c724:	ff8007b7          	lui	a5,0xff800
    c728:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c72c:	00f77733          	and	a4,a4,a5
    c730:	00068e13          	mv	t3,a3
    c734:	00100793          	li	a5,1
    c738:	df9ff06f          	j	c530 <__adddf3+0x184>
    c73c:	7ff00693          	li	a3,2047
    c740:	10d90663          	beq	s2,a3,c84c <__adddf3+0x4a0>
    c744:	03800693          	li	a3,56
    c748:	00100993          	li	s3,1
    c74c:	f0f6c6e3          	blt	a3,a5,c658 <__adddf3+0x2ac>
    c750:	008006b7          	lui	a3,0x800
    c754:	00d8e8b3          	or	a7,a7,a3
    c758:	ed1ff06f          	j	c628 <__adddf3+0x27c>
    c75c:	00048513          	mv	a0,s1
    c760:	08d020ef          	jal	efec <__clzsi2>
    c764:	01850793          	add	a5,a0,24
    c768:	01f00693          	li	a3,31
    c76c:	d2f6d8e3          	bge	a3,a5,c49c <__adddf3+0xf0>
    c770:	ff850713          	add	a4,a0,-8
    c774:	00e49733          	sll	a4,s1,a4
    c778:	2327c663          	blt	a5,s2,c9a4 <__adddf3+0x5f8>
    c77c:	41278933          	sub	s2,a5,s2
    c780:	00190793          	add	a5,s2,1
    c784:	48f6d663          	bge	a3,a5,cc10 <__adddf3+0x864>
    c788:	fe190913          	add	s2,s2,-31
    c78c:	02000693          	li	a3,32
    c790:	012754b3          	srl	s1,a4,s2
    c794:	00d78c63          	beq	a5,a3,c7ac <__adddf3+0x400>
    c798:	04000693          	li	a3,64
    c79c:	40f687b3          	sub	a5,a3,a5
    c7a0:	00f71733          	sll	a4,a4,a5
    c7a4:	00e03733          	snez	a4,a4
    c7a8:	00e4e4b3          	or	s1,s1,a4
    c7ac:	00000913          	li	s2,0
    c7b0:	0074f793          	and	a5,s1,7
    c7b4:	d2079ce3          	bnez	a5,c4ec <__adddf3+0x140>
    c7b8:	00090793          	mv	a5,s2
    c7bc:	0034d613          	srl	a2,s1,0x3
    c7c0:	00098713          	mv	a4,s3
    c7c4:	0c00006f          	j	c884 <__adddf3+0x4d8>
    c7c8:	7ff00793          	li	a5,2047
    c7cc:	00000713          	li	a4,0
    c7d0:	00000813          	li	a6,0
    c7d4:	d71ff06f          	j	c544 <__adddf3+0x198>
    c7d8:	0c078a63          	beqz	a5,c8ac <__adddf3+0x500>
    c7dc:	412307b3          	sub	a5,t1,s2
    c7e0:	1e090263          	beqz	s2,c9c4 <__adddf3+0x618>
    c7e4:	7ff00693          	li	a3,2047
    c7e8:	32d30863          	beq	t1,a3,cb18 <__adddf3+0x76c>
    c7ec:	03800693          	li	a3,56
    c7f0:	00100993          	li	s3,1
    c7f4:	02f6ce63          	blt	a3,a5,c830 <__adddf3+0x484>
    c7f8:	008006b7          	lui	a3,0x800
    c7fc:	00d76733          	or	a4,a4,a3
    c800:	01f00693          	li	a3,31
    c804:	3cf6c863          	blt	a3,a5,cbd4 <__adddf3+0x828>
    c808:	02000693          	li	a3,32
    c80c:	40f686b3          	sub	a3,a3,a5
    c810:	00d719b3          	sll	s3,a4,a3
    c814:	00f5d633          	srl	a2,a1,a5
    c818:	00d596b3          	sll	a3,a1,a3
    c81c:	00c9e9b3          	or	s3,s3,a2
    c820:	00d036b3          	snez	a3,a3
    c824:	00f75733          	srl	a4,a4,a5
    c828:	00d9e9b3          	or	s3,s3,a3
    c82c:	00e888b3          	add	a7,a7,a4
    c830:	01e98733          	add	a4,s3,t5
    c834:	013739b3          	sltu	s3,a4,s3
    c838:	00070493          	mv	s1,a4
    c83c:	011989b3          	add	s3,s3,a7
    c840:	00030913          	mv	s2,t1
    c844:	e25ff06f          	j	c668 <__adddf3+0x2bc>
    c848:	02081063          	bnez	a6,c868 <__adddf3+0x4bc>
    c84c:	00351613          	sll	a2,a0,0x3
    c850:	00365613          	srl	a2,a2,0x3
    c854:	01d71813          	sll	a6,a4,0x1d
    c858:	00c86833          	or	a6,a6,a2
    c85c:	00375713          	srl	a4,a4,0x3
    c860:	01076733          	or	a4,a4,a6
    c864:	18070663          	beqz	a4,c9f0 <__adddf3+0x644>
    c868:	00000e13          	li	t3,0
    c86c:	7ff00793          	li	a5,2047
    c870:	00080737          	lui	a4,0x80
    c874:	00000813          	li	a6,0
    c878:	ccdff06f          	j	c544 <__adddf3+0x198>
    c87c:	00351613          	sll	a2,a0,0x3
    c880:	00365613          	srl	a2,a2,0x3
    c884:	01d71813          	sll	a6,a4,0x1d
    c888:	7ff00693          	li	a3,2047
    c88c:	00c86833          	or	a6,a6,a2
    c890:	00375713          	srl	a4,a4,0x3
    c894:	fcd786e3          	beq	a5,a3,c860 <__adddf3+0x4b4>
    c898:	00c71713          	sll	a4,a4,0xc
    c89c:	00c75713          	srl	a4,a4,0xc
    c8a0:	7ff7f793          	and	a5,a5,2047
    c8a4:	00040e13          	mv	t3,s0
    c8a8:	c9dff06f          	j	c544 <__adddf3+0x198>
    c8ac:	00190693          	add	a3,s2,1
    c8b0:	7fe6f813          	and	a6,a3,2046
    c8b4:	14081863          	bnez	a6,ca04 <__adddf3+0x658>
    c8b8:	00b766b3          	or	a3,a4,a1
    c8bc:	28091c63          	bnez	s2,cb54 <__adddf3+0x7a8>
    c8c0:	30068263          	beqz	a3,cbc4 <__adddf3+0x818>
    c8c4:	01e8e6b3          	or	a3,a7,t5
    c8c8:	22068863          	beqz	a3,caf8 <__adddf3+0x74c>
    c8cc:	01e587b3          	add	a5,a1,t5
    c8d0:	00b7b5b3          	sltu	a1,a5,a1
    c8d4:	01170733          	add	a4,a4,a7
    c8d8:	00b70733          	add	a4,a4,a1
    c8dc:	0037d813          	srl	a6,a5,0x3
    c8e0:	00871793          	sll	a5,a4,0x8
    c8e4:	00040e13          	mv	t3,s0
    c8e8:	3407de63          	bgez	a5,cc44 <__adddf3+0x898>
    c8ec:	ff8007b7          	lui	a5,0xff800
    c8f0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c8f4:	00f77733          	and	a4,a4,a5
    c8f8:	01d71793          	sll	a5,a4,0x1d
    c8fc:	00375713          	srl	a4,a4,0x3
    c900:	0107e833          	or	a6,a5,a6
    c904:	01d77733          	and	a4,a4,t4
    c908:	00100793          	li	a5,1
    c90c:	c39ff06f          	j	c544 <__adddf3+0x198>
    c910:	41e58833          	sub	a6,a1,t5
    c914:	0105b7b3          	sltu	a5,a1,a6
    c918:	411709b3          	sub	s3,a4,a7
    c91c:	40f989b3          	sub	s3,s3,a5
    c920:	00899793          	sll	a5,s3,0x8
    c924:	00080493          	mv	s1,a6
    c928:	1007c663          	bltz	a5,ca34 <__adddf3+0x688>
    c92c:	01386833          	or	a6,a6,s3
    c930:	b4081ee3          	bnez	a6,c48c <__adddf3+0xe0>
    c934:	00000e13          	li	t3,0
    c938:	00000793          	li	a5,0
    c93c:	00000713          	li	a4,0
    c940:	c05ff06f          	j	c544 <__adddf3+0x198>
    c944:	7ff00513          	li	a0,2047
    c948:	1aa30e63          	beq	t1,a0,cb04 <__adddf3+0x758>
    c94c:	03800513          	li	a0,56
    c950:	00100613          	li	a2,1
    c954:	c8f544e3          	blt	a0,a5,c5dc <__adddf3+0x230>
    c958:	00800637          	lui	a2,0x800
    c95c:	00c76733          	or	a4,a4,a2
    c960:	c4dff06f          	j	c5ac <__adddf3+0x200>
    c964:	ff8009b7          	lui	s3,0xff800
    c968:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c96c:	40f90933          	sub	s2,s2,a5
    c970:	013779b3          	and	s3,a4,s3
    c974:	b71ff06f          	j	c4e4 <__adddf3+0x138>
    c978:	fe078693          	add	a3,a5,-32
    c97c:	02000613          	li	a2,32
    c980:	00d8d6b3          	srl	a3,a7,a3
    c984:	00c78a63          	beq	a5,a2,c998 <__adddf3+0x5ec>
    c988:	04000613          	li	a2,64
    c98c:	40f607b3          	sub	a5,a2,a5
    c990:	00f897b3          	sll	a5,a7,a5
    c994:	00ff6f33          	or	t5,t5,a5
    c998:	01e03633          	snez	a2,t5
    c99c:	00d66633          	or	a2,a2,a3
    c9a0:	ac9ff06f          	j	c468 <__adddf3+0xbc>
    c9a4:	ff8006b7          	lui	a3,0xff800
    c9a8:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c9ac:	40f907b3          	sub	a5,s2,a5
    c9b0:	00d77733          	and	a4,a4,a3
    c9b4:	01d71813          	sll	a6,a4,0x1d
    c9b8:	01386833          	or	a6,a6,s3
    c9bc:	00375713          	srl	a4,a4,0x3
    c9c0:	ed9ff06f          	j	c898 <__adddf3+0x4ec>
    c9c4:	00b766b3          	or	a3,a4,a1
    c9c8:	1e068663          	beqz	a3,cbb4 <__adddf3+0x808>
    c9cc:	fff78693          	add	a3,a5,-1
    c9d0:	0a068e63          	beqz	a3,ca8c <__adddf3+0x6e0>
    c9d4:	7ff00513          	li	a0,2047
    c9d8:	14a78063          	beq	a5,a0,cb18 <__adddf3+0x76c>
    c9dc:	03800793          	li	a5,56
    c9e0:	00100993          	li	s3,1
    c9e4:	e4d7c6e3          	blt	a5,a3,c830 <__adddf3+0x484>
    c9e8:	00068793          	mv	a5,a3
    c9ec:	e15ff06f          	j	c800 <__adddf3+0x454>
    c9f0:	00040e13          	mv	t3,s0
    c9f4:	7ff00793          	li	a5,2047
    c9f8:	00000713          	li	a4,0
    c9fc:	00000813          	li	a6,0
    ca00:	b45ff06f          	j	c544 <__adddf3+0x198>
    ca04:	7ff00793          	li	a5,2047
    ca08:	fef684e3          	beq	a3,a5,c9f0 <__adddf3+0x644>
    ca0c:	01e58f33          	add	t5,a1,t5
    ca10:	00bf35b3          	sltu	a1,t5,a1
    ca14:	011707b3          	add	a5,a4,a7
    ca18:	00b787b3          	add	a5,a5,a1
    ca1c:	01f79613          	sll	a2,a5,0x1f
    ca20:	001f5f13          	srl	t5,t5,0x1
    ca24:	01e664b3          	or	s1,a2,t5
    ca28:	0017d993          	srl	s3,a5,0x1
    ca2c:	00068913          	mv	s2,a3
    ca30:	ab5ff06f          	j	c4e4 <__adddf3+0x138>
    ca34:	40bf0633          	sub	a2,t5,a1
    ca38:	40e887b3          	sub	a5,a7,a4
    ca3c:	00cf3733          	sltu	a4,t5,a2
    ca40:	00060493          	mv	s1,a2
    ca44:	40e789b3          	sub	s3,a5,a4
    ca48:	00068413          	mv	s0,a3
    ca4c:	a41ff06f          	j	c48c <__adddf3+0xe0>
    ca50:	00361613          	sll	a2,a2,0x3
    ca54:	00365613          	srl	a2,a2,0x3
    ca58:	00068413          	mv	s0,a3
    ca5c:	00088713          	mv	a4,a7
    ca60:	e25ff06f          	j	c884 <__adddf3+0x4d8>
    ca64:	de0312e3          	bnez	t1,c848 <__adddf3+0x49c>
    ca68:	1c080663          	beqz	a6,cc34 <__adddf3+0x888>
    ca6c:	0038d713          	srl	a4,a7,0x3
    ca70:	00361613          	sll	a2,a2,0x3
    ca74:	01d89893          	sll	a7,a7,0x1d
    ca78:	01176733          	or	a4,a4,a7
    ca7c:	00365613          	srl	a2,a2,0x3
    ca80:	00c76733          	or	a4,a4,a2
    ca84:	00068413          	mv	s0,a3
    ca88:	dddff06f          	j	c864 <__adddf3+0x4b8>
    ca8c:	01e58f33          	add	t5,a1,t5
    ca90:	011708b3          	add	a7,a4,a7
    ca94:	00bf35b3          	sltu	a1,t5,a1
    ca98:	00b889b3          	add	s3,a7,a1
    ca9c:	00899793          	sll	a5,s3,0x8
    caa0:	000f0493          	mv	s1,t5
    caa4:	0e07d463          	bgez	a5,cb8c <__adddf3+0x7e0>
    caa8:	00200913          	li	s2,2
    caac:	bd1ff06f          	j	c67c <__adddf3+0x2d0>
    cab0:	41e58f33          	sub	t5,a1,t5
    cab4:	411708b3          	sub	a7,a4,a7
    cab8:	01e5b5b3          	sltu	a1,a1,t5
    cabc:	000f0493          	mv	s1,t5
    cac0:	40b889b3          	sub	s3,a7,a1
    cac4:	00100913          	li	s2,1
    cac8:	9b1ff06f          	j	c478 <__adddf3+0xcc>
    cacc:	fe078693          	add	a3,a5,-32
    cad0:	02000613          	li	a2,32
    cad4:	00d8d6b3          	srl	a3,a7,a3
    cad8:	00c78a63          	beq	a5,a2,caec <__adddf3+0x740>
    cadc:	04000613          	li	a2,64
    cae0:	40f607b3          	sub	a5,a2,a5
    cae4:	00f897b3          	sll	a5,a7,a5
    cae8:	00ff6f33          	or	t5,t5,a5
    caec:	01e039b3          	snez	s3,t5
    caf0:	00d9e9b3          	or	s3,s3,a3
    caf4:	b65ff06f          	j	c658 <__adddf3+0x2ac>
    caf8:	00351613          	sll	a2,a0,0x3
    cafc:	00365993          	srl	s3,a2,0x3
    cb00:	eb5ff06f          	j	c9b4 <__adddf3+0x608>
    cb04:	00361613          	sll	a2,a2,0x3
    cb08:	00365613          	srl	a2,a2,0x3
    cb0c:	00068413          	mv	s0,a3
    cb10:	00088713          	mv	a4,a7
    cb14:	d41ff06f          	j	c854 <__adddf3+0x4a8>
    cb18:	00361613          	sll	a2,a2,0x3
    cb1c:	00365613          	srl	a2,a2,0x3
    cb20:	00088713          	mv	a4,a7
    cb24:	d31ff06f          	j	c854 <__adddf3+0x4a8>
    cb28:	fe078513          	add	a0,a5,-32
    cb2c:	02000613          	li	a2,32
    cb30:	00a75533          	srl	a0,a4,a0
    cb34:	00c78a63          	beq	a5,a2,cb48 <__adddf3+0x79c>
    cb38:	04000613          	li	a2,64
    cb3c:	40f607b3          	sub	a5,a2,a5
    cb40:	00f717b3          	sll	a5,a4,a5
    cb44:	00f5e5b3          	or	a1,a1,a5
    cb48:	00b03633          	snez	a2,a1
    cb4c:	00a66633          	or	a2,a2,a0
    cb50:	a8dff06f          	j	c5dc <__adddf3+0x230>
    cb54:	fc0682e3          	beqz	a3,cb18 <__adddf3+0x76c>
    cb58:	01e8ef33          	or	t5,a7,t5
    cb5c:	d00f16e3          	bnez	t5,c868 <__adddf3+0x4bc>
    cb60:	cedff06f          	j	c84c <__adddf3+0x4a0>
    cb64:	dc0808e3          	beqz	a6,c934 <__adddf3+0x588>
    cb68:	00361813          	sll	a6,a2,0x3
    cb6c:	01d89793          	sll	a5,a7,0x1d
    cb70:	00385813          	srl	a6,a6,0x3
    cb74:	0038d713          	srl	a4,a7,0x3
    cb78:	00f86833          	or	a6,a6,a5
    cb7c:	01d77733          	and	a4,a4,t4
    cb80:	00068e13          	mv	t3,a3
    cb84:	00000793          	li	a5,0
    cb88:	9bdff06f          	j	c544 <__adddf3+0x198>
    cb8c:	00100793          	li	a5,1
    cb90:	c2dff06f          	j	c7bc <__adddf3+0x410>
    cb94:	40bf05b3          	sub	a1,t5,a1
    cb98:	40e888b3          	sub	a7,a7,a4
    cb9c:	00bf3733          	sltu	a4,t5,a1
    cba0:	00058493          	mv	s1,a1
    cba4:	40e889b3          	sub	s3,a7,a4
    cba8:	00068413          	mv	s0,a3
    cbac:	00100913          	li	s2,1
    cbb0:	8c9ff06f          	j	c478 <__adddf3+0xcc>
    cbb4:	00361613          	sll	a2,a2,0x3
    cbb8:	00365613          	srl	a2,a2,0x3
    cbbc:	00088713          	mv	a4,a7
    cbc0:	cc5ff06f          	j	c884 <__adddf3+0x4d8>
    cbc4:	00361613          	sll	a2,a2,0x3
    cbc8:	00365993          	srl	s3,a2,0x3
    cbcc:	00088713          	mv	a4,a7
    cbd0:	de5ff06f          	j	c9b4 <__adddf3+0x608>
    cbd4:	fe078693          	add	a3,a5,-32
    cbd8:	02000613          	li	a2,32
    cbdc:	00d756b3          	srl	a3,a4,a3
    cbe0:	00c78a63          	beq	a5,a2,cbf4 <__adddf3+0x848>
    cbe4:	04000613          	li	a2,64
    cbe8:	40f607b3          	sub	a5,a2,a5
    cbec:	00f717b3          	sll	a5,a4,a5
    cbf0:	00f5e5b3          	or	a1,a1,a5
    cbf4:	00b039b3          	snez	s3,a1
    cbf8:	00d9e9b3          	or	s3,s3,a3
    cbfc:	c35ff06f          	j	c830 <__adddf3+0x484>
    cc00:	0034d613          	srl	a2,s1,0x3
    cc04:	00090793          	mv	a5,s2
    cc08:	00098713          	mv	a4,s3
    cc0c:	c79ff06f          	j	c884 <__adddf3+0x4d8>
    cc10:	02000693          	li	a3,32
    cc14:	40f686b3          	sub	a3,a3,a5
    cc18:	00000613          	li	a2,0
    cc1c:	8b5ff06f          	j	c4d0 <__adddf3+0x124>
    cc20:	00c9e833          	or	a6,s3,a2
    cc24:	d00808e3          	beqz	a6,c934 <__adddf3+0x588>
    cc28:	0039d993          	srl	s3,s3,0x3
    cc2c:	00060713          	mv	a4,a2
    cc30:	d85ff06f          	j	c9b4 <__adddf3+0x608>
    cc34:	00000e13          	li	t3,0
    cc38:	7ff00793          	li	a5,2047
    cc3c:	00080737          	lui	a4,0x80
    cc40:	905ff06f          	j	c544 <__adddf3+0x198>
    cc44:	01d71793          	sll	a5,a4,0x1d
    cc48:	00375713          	srl	a4,a4,0x3
    cc4c:	0107e833          	or	a6,a5,a6
    cc50:	01d77733          	and	a4,a4,t4
    cc54:	00000793          	li	a5,0
    cc58:	8edff06f          	j	c544 <__adddf3+0x198>
    cc5c:	01d71813          	sll	a6,a4,0x1d
    cc60:	0035d593          	srl	a1,a1,0x3
    cc64:	00b86833          	or	a6,a6,a1
    cc68:	00375713          	srl	a4,a4,0x3
    cc6c:	00068413          	mv	s0,a3
    cc70:	c29ff06f          	j	c898 <__adddf3+0x4ec>

0000cc74 <__divdf3>:
    cc74:	fb010113          	add	sp,sp,-80
    cc78:	0145d793          	srl	a5,a1,0x14
    cc7c:	04812423          	sw	s0,72(sp)
    cc80:	04912223          	sw	s1,68(sp)
    cc84:	05212023          	sw	s2,64(sp)
    cc88:	03412c23          	sw	s4,56(sp)
    cc8c:	03512a23          	sw	s5,52(sp)
    cc90:	00c59493          	sll	s1,a1,0xc
    cc94:	04112623          	sw	ra,76(sp)
    cc98:	03312e23          	sw	s3,60(sp)
    cc9c:	03612823          	sw	s6,48(sp)
    cca0:	03712623          	sw	s7,44(sp)
    cca4:	03812423          	sw	s8,40(sp)
    cca8:	7ff7f793          	and	a5,a5,2047
    ccac:	00050413          	mv	s0,a0
    ccb0:	00060a13          	mv	s4,a2
    ccb4:	00068913          	mv	s2,a3
    ccb8:	00c4d493          	srl	s1,s1,0xc
    ccbc:	01f5da93          	srl	s5,a1,0x1f
    ccc0:	18078c63          	beqz	a5,ce58 <__divdf3+0x1e4>
    ccc4:	7ff00713          	li	a4,2047
    ccc8:	08e78a63          	beq	a5,a4,cd5c <__divdf3+0xe8>
    cccc:	01d55b13          	srl	s6,a0,0x1d
    ccd0:	00349493          	sll	s1,s1,0x3
    ccd4:	009b64b3          	or	s1,s6,s1
    ccd8:	00800737          	lui	a4,0x800
    ccdc:	00e4eb33          	or	s6,s1,a4
    cce0:	00351b93          	sll	s7,a0,0x3
    cce4:	c0178993          	add	s3,a5,-1023
    cce8:	00000493          	li	s1,0
    ccec:	00000c13          	li	s8,0
    ccf0:	01495793          	srl	a5,s2,0x14
    ccf4:	00c91413          	sll	s0,s2,0xc
    ccf8:	7ff7f793          	and	a5,a5,2047
    ccfc:	00c45413          	srl	s0,s0,0xc
    cd00:	01f95913          	srl	s2,s2,0x1f
    cd04:	08078463          	beqz	a5,cd8c <__divdf3+0x118>
    cd08:	7ff00713          	li	a4,2047
    cd0c:	18e78c63          	beq	a5,a4,cea4 <__divdf3+0x230>
    cd10:	00341413          	sll	s0,s0,0x3
    cd14:	01da5713          	srl	a4,s4,0x1d
    cd18:	00876733          	or	a4,a4,s0
    cd1c:	c0178793          	add	a5,a5,-1023
    cd20:	00800437          	lui	s0,0x800
    cd24:	40f989b3          	sub	s3,s3,a5
    cd28:	00876433          	or	s0,a4,s0
    cd2c:	003a1813          	sll	a6,s4,0x3
    cd30:	00000793          	li	a5,0
    cd34:	00f00713          	li	a4,15
    cd38:	012aca33          	xor	s4,s5,s2
    cd3c:	24976663          	bltu	a4,s1,cf88 <__divdf3+0x314>
    cd40:	00003697          	auipc	a3,0x3
    cd44:	d7068693          	add	a3,a3,-656 # fab0 <__mprec_tens+0xc8>
    cd48:	00249493          	sll	s1,s1,0x2
    cd4c:	00d484b3          	add	s1,s1,a3
    cd50:	0004a703          	lw	a4,0(s1)
    cd54:	00d70733          	add	a4,a4,a3
    cd58:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cd5c:	00a4eb33          	or	s6,s1,a0
    cd60:	1c0b1e63          	bnez	s6,cf3c <__divdf3+0x2c8>
    cd64:	01495793          	srl	a5,s2,0x14
    cd68:	00c91413          	sll	s0,s2,0xc
    cd6c:	7ff7f793          	and	a5,a5,2047
    cd70:	00000b93          	li	s7,0
    cd74:	00800493          	li	s1,8
    cd78:	7ff00993          	li	s3,2047
    cd7c:	00200c13          	li	s8,2
    cd80:	00c45413          	srl	s0,s0,0xc
    cd84:	01f95913          	srl	s2,s2,0x1f
    cd88:	f80790e3          	bnez	a5,cd08 <__divdf3+0x94>
    cd8c:	01446833          	or	a6,s0,s4
    cd90:	1c080263          	beqz	a6,cf54 <__divdf3+0x2e0>
    cd94:	5c040663          	beqz	s0,d360 <__divdf3+0x6ec>
    cd98:	00040513          	mv	a0,s0
    cd9c:	250020ef          	jal	efec <__clzsi2>
    cda0:	00050793          	mv	a5,a0
    cda4:	ff550693          	add	a3,a0,-11
    cda8:	01d00713          	li	a4,29
    cdac:	ff878813          	add	a6,a5,-8
    cdb0:	40d70733          	sub	a4,a4,a3
    cdb4:	01041433          	sll	s0,s0,a6
    cdb8:	00ea5733          	srl	a4,s4,a4
    cdbc:	00876433          	or	s0,a4,s0
    cdc0:	010a1833          	sll	a6,s4,a6
    cdc4:	013787b3          	add	a5,a5,s3
    cdc8:	3f378993          	add	s3,a5,1011
    cdcc:	00000793          	li	a5,0
    cdd0:	f65ff06f          	j	cd34 <__divdf3+0xc0>
    cdd4:	40f70733          	sub	a4,a4,a5
    cdd8:	03800693          	li	a3,56
    cddc:	60e6d063          	bge	a3,a4,d3dc <__divdf3+0x768>
    cde0:	00000793          	li	a5,0
    cde4:	00000693          	li	a3,0
    cde8:	00000713          	li	a4,0
    cdec:	04c12083          	lw	ra,76(sp)
    cdf0:	04812403          	lw	s0,72(sp)
    cdf4:	01479793          	sll	a5,a5,0x14
    cdf8:	00d7e7b3          	or	a5,a5,a3
    cdfc:	01fa1693          	sll	a3,s4,0x1f
    ce00:	00d7e7b3          	or	a5,a5,a3
    ce04:	04412483          	lw	s1,68(sp)
    ce08:	04012903          	lw	s2,64(sp)
    ce0c:	03c12983          	lw	s3,60(sp)
    ce10:	03812a03          	lw	s4,56(sp)
    ce14:	03412a83          	lw	s5,52(sp)
    ce18:	03012b03          	lw	s6,48(sp)
    ce1c:	02c12b83          	lw	s7,44(sp)
    ce20:	02812c03          	lw	s8,40(sp)
    ce24:	00070513          	mv	a0,a4
    ce28:	00078593          	mv	a1,a5
    ce2c:	05010113          	add	sp,sp,80
    ce30:	00008067          	ret
    ce34:	7ff00793          	li	a5,2047
    ce38:	00000693          	li	a3,0
    ce3c:	00000713          	li	a4,0
    ce40:	fadff06f          	j	cdec <__divdf3+0x178>
    ce44:	00000a13          	li	s4,0
    ce48:	7ff00793          	li	a5,2047
    ce4c:	000806b7          	lui	a3,0x80
    ce50:	00000713          	li	a4,0
    ce54:	f99ff06f          	j	cdec <__divdf3+0x178>
    ce58:	00a4eb33          	or	s6,s1,a0
    ce5c:	100b0c63          	beqz	s6,cf74 <__divdf3+0x300>
    ce60:	52048463          	beqz	s1,d388 <__divdf3+0x714>
    ce64:	00048513          	mv	a0,s1
    ce68:	184020ef          	jal	efec <__clzsi2>
    ce6c:	00050713          	mv	a4,a0
    ce70:	ff550793          	add	a5,a0,-11
    ce74:	01d00b13          	li	s6,29
    ce78:	ff870b93          	add	s7,a4,-8
    ce7c:	40fb0b33          	sub	s6,s6,a5
    ce80:	017494b3          	sll	s1,s1,s7
    ce84:	01645b33          	srl	s6,s0,s6
    ce88:	009b6b33          	or	s6,s6,s1
    ce8c:	01741bb3          	sll	s7,s0,s7
    ce90:	c0d00793          	li	a5,-1011
    ce94:	40e789b3          	sub	s3,a5,a4
    ce98:	00000493          	li	s1,0
    ce9c:	00000c13          	li	s8,0
    cea0:	e51ff06f          	j	ccf0 <__divdf3+0x7c>
    cea4:	01446833          	or	a6,s0,s4
    cea8:	80198993          	add	s3,s3,-2047
    ceac:	0a081c63          	bnez	a6,cf64 <__divdf3+0x2f0>
    ceb0:	0024e493          	or	s1,s1,2
    ceb4:	00000413          	li	s0,0
    ceb8:	00200793          	li	a5,2
    cebc:	e79ff06f          	j	cd34 <__divdf3+0xc0>
    cec0:	000a8913          	mv	s2,s5
    cec4:	000b0413          	mv	s0,s6
    cec8:	000b8813          	mv	a6,s7
    cecc:	00200793          	li	a5,2
    ced0:	60fc0863          	beq	s8,a5,d4e0 <__divdf3+0x86c>
    ced4:	00300793          	li	a5,3
    ced8:	f6fc06e3          	beq	s8,a5,ce44 <__divdf3+0x1d0>
    cedc:	00100793          	li	a5,1
    cee0:	00090a13          	mv	s4,s2
    cee4:	eefc0ee3          	beq	s8,a5,cde0 <__divdf3+0x16c>
    cee8:	3ff98793          	add	a5,s3,1023
    ceec:	3cf05263          	blez	a5,d2b0 <__divdf3+0x63c>
    cef0:	00787713          	and	a4,a6,7
    cef4:	5c071663          	bnez	a4,d4c0 <__divdf3+0x84c>
    cef8:	00741713          	sll	a4,s0,0x7
    cefc:	00075a63          	bgez	a4,cf10 <__divdf3+0x29c>
    cf00:	ff0007b7          	lui	a5,0xff000
    cf04:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cf08:	00f47433          	and	s0,s0,a5
    cf0c:	40098793          	add	a5,s3,1024
    cf10:	7fe00713          	li	a4,2046
    cf14:	f2f740e3          	blt	a4,a5,ce34 <__divdf3+0x1c0>
    cf18:	00385813          	srl	a6,a6,0x3
    cf1c:	01d41713          	sll	a4,s0,0x1d
    cf20:	00941693          	sll	a3,s0,0x9
    cf24:	01076733          	or	a4,a4,a6
    cf28:	00c6d693          	srl	a3,a3,0xc
    cf2c:	7ff7f793          	and	a5,a5,2047
    cf30:	ebdff06f          	j	cdec <__divdf3+0x178>
    cf34:	00078c13          	mv	s8,a5
    cf38:	f95ff06f          	j	cecc <__divdf3+0x258>
    cf3c:	00048b13          	mv	s6,s1
    cf40:	00050b93          	mv	s7,a0
    cf44:	00c00493          	li	s1,12
    cf48:	7ff00993          	li	s3,2047
    cf4c:	00300c13          	li	s8,3
    cf50:	da1ff06f          	j	ccf0 <__divdf3+0x7c>
    cf54:	0014e493          	or	s1,s1,1
    cf58:	00000413          	li	s0,0
    cf5c:	00100793          	li	a5,1
    cf60:	dd5ff06f          	j	cd34 <__divdf3+0xc0>
    cf64:	0034e493          	or	s1,s1,3
    cf68:	000a0813          	mv	a6,s4
    cf6c:	00300793          	li	a5,3
    cf70:	dc5ff06f          	j	cd34 <__divdf3+0xc0>
    cf74:	00000b93          	li	s7,0
    cf78:	00400493          	li	s1,4
    cf7c:	00000993          	li	s3,0
    cf80:	00100c13          	li	s8,1
    cf84:	d6dff06f          	j	ccf0 <__divdf3+0x7c>
    cf88:	03912223          	sw	s9,36(sp)
    cf8c:	03a12023          	sw	s10,32(sp)
    cf90:	01b12e23          	sw	s11,28(sp)
    cf94:	3b646a63          	bltu	s0,s6,d348 <__divdf3+0x6d4>
    cf98:	3a8b0663          	beq	s6,s0,d344 <__divdf3+0x6d0>
    cf9c:	fff98993          	add	s3,s3,-1
    cfa0:	000b8c13          	mv	s8,s7
    cfa4:	000b0493          	mv	s1,s6
    cfa8:	00000d13          	li	s10,0
    cfac:	01885c93          	srl	s9,a6,0x18
    cfb0:	00841413          	sll	s0,s0,0x8
    cfb4:	01045913          	srl	s2,s0,0x10
    cfb8:	008cecb3          	or	s9,s9,s0
    cfbc:	00090593          	mv	a1,s2
    cfc0:	00048513          	mv	a0,s1
    cfc4:	010c9b13          	sll	s6,s9,0x10
    cfc8:	00881a93          	sll	s5,a6,0x8
    cfcc:	010b5b13          	srl	s6,s6,0x10
    cfd0:	771010ef          	jal	ef40 <__hidden___udivsi3>
    cfd4:	00050593          	mv	a1,a0
    cfd8:	00050413          	mv	s0,a0
    cfdc:	000b0513          	mv	a0,s6
    cfe0:	69d010ef          	jal	ee7c <__mulsi3>
    cfe4:	00050793          	mv	a5,a0
    cfe8:	00090593          	mv	a1,s2
    cfec:	00048513          	mv	a0,s1
    cff0:	00078493          	mv	s1,a5
    cff4:	795010ef          	jal	ef88 <__umodsi3>
    cff8:	01051513          	sll	a0,a0,0x10
    cffc:	010c5793          	srl	a5,s8,0x10
    d000:	00a7e7b3          	or	a5,a5,a0
    d004:	0097fa63          	bgeu	a5,s1,d018 <__divdf3+0x3a4>
    d008:	00fc87b3          	add	a5,s9,a5
    d00c:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d010:	3b97fe63          	bgeu	a5,s9,d3cc <__divdf3+0x758>
    d014:	00070413          	mv	s0,a4
    d018:	409784b3          	sub	s1,a5,s1
    d01c:	00090593          	mv	a1,s2
    d020:	00048513          	mv	a0,s1
    d024:	71d010ef          	jal	ef40 <__hidden___udivsi3>
    d028:	00050593          	mv	a1,a0
    d02c:	00050b93          	mv	s7,a0
    d030:	000b0513          	mv	a0,s6
    d034:	649010ef          	jal	ee7c <__mulsi3>
    d038:	00050793          	mv	a5,a0
    d03c:	00090593          	mv	a1,s2
    d040:	00048513          	mv	a0,s1
    d044:	00078493          	mv	s1,a5
    d048:	741010ef          	jal	ef88 <__umodsi3>
    d04c:	010c1793          	sll	a5,s8,0x10
    d050:	01051513          	sll	a0,a0,0x10
    d054:	0107d793          	srl	a5,a5,0x10
    d058:	00a7e7b3          	or	a5,a5,a0
    d05c:	0097fa63          	bgeu	a5,s1,d070 <__divdf3+0x3fc>
    d060:	00fc87b3          	add	a5,s9,a5
    d064:	fffb8713          	add	a4,s7,-1
    d068:	3597fa63          	bgeu	a5,s9,d3bc <__divdf3+0x748>
    d06c:	00070b93          	mv	s7,a4
    d070:	00010337          	lui	t1,0x10
    d074:	01041413          	sll	s0,s0,0x10
    d078:	01746433          	or	s0,s0,s7
    d07c:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    d080:	01b478b3          	and	a7,s0,s11
    d084:	01bafdb3          	and	s11,s5,s11
    d088:	40978bb3          	sub	s7,a5,s1
    d08c:	010adc13          	srl	s8,s5,0x10
    d090:	01045793          	srl	a5,s0,0x10
    d094:	00088513          	mv	a0,a7
    d098:	000d8593          	mv	a1,s11
    d09c:	5e1010ef          	jal	ee7c <__mulsi3>
    d0a0:	00050813          	mv	a6,a0
    d0a4:	000c0593          	mv	a1,s8
    d0a8:	00088513          	mv	a0,a7
    d0ac:	5d1010ef          	jal	ee7c <__mulsi3>
    d0b0:	00050893          	mv	a7,a0
    d0b4:	000d8593          	mv	a1,s11
    d0b8:	00078513          	mv	a0,a5
    d0bc:	5c1010ef          	jal	ee7c <__mulsi3>
    d0c0:	00050e13          	mv	t3,a0
    d0c4:	000c0593          	mv	a1,s8
    d0c8:	00078513          	mv	a0,a5
    d0cc:	5b1010ef          	jal	ee7c <__mulsi3>
    d0d0:	01085793          	srl	a5,a6,0x10
    d0d4:	01c888b3          	add	a7,a7,t3
    d0d8:	011787b3          	add	a5,a5,a7
    d0dc:	01c7f463          	bgeu	a5,t3,d0e4 <__divdf3+0x470>
    d0e0:	00650533          	add	a0,a0,t1
    d0e4:	00010637          	lui	a2,0x10
    d0e8:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    d0ec:	00c7f4b3          	and	s1,a5,a2
    d0f0:	0107d693          	srl	a3,a5,0x10
    d0f4:	01049493          	sll	s1,s1,0x10
    d0f8:	00c87833          	and	a6,a6,a2
    d0fc:	00a687b3          	add	a5,a3,a0
    d100:	010484b3          	add	s1,s1,a6
    d104:	20fbea63          	bltu	s7,a5,d318 <__divdf3+0x6a4>
    d108:	20fb8663          	beq	s7,a5,d314 <__divdf3+0x6a0>
    d10c:	409d04b3          	sub	s1,s10,s1
    d110:	40fb8bb3          	sub	s7,s7,a5
    d114:	009d3d33          	sltu	s10,s10,s1
    d118:	41ab8bb3          	sub	s7,s7,s10
    d11c:	377c8a63          	beq	s9,s7,d490 <__divdf3+0x81c>
    d120:	00090593          	mv	a1,s2
    d124:	000b8513          	mv	a0,s7
    d128:	619010ef          	jal	ef40 <__hidden___udivsi3>
    d12c:	00050593          	mv	a1,a0
    d130:	00a12623          	sw	a0,12(sp)
    d134:	00050d13          	mv	s10,a0
    d138:	000b0513          	mv	a0,s6
    d13c:	541010ef          	jal	ee7c <__mulsi3>
    d140:	00050793          	mv	a5,a0
    d144:	00090593          	mv	a1,s2
    d148:	000b8513          	mv	a0,s7
    d14c:	00078b93          	mv	s7,a5
    d150:	639010ef          	jal	ef88 <__umodsi3>
    d154:	01051513          	sll	a0,a0,0x10
    d158:	0104d793          	srl	a5,s1,0x10
    d15c:	00a7e7b3          	or	a5,a5,a0
    d160:	0377f063          	bgeu	a5,s7,d180 <__divdf3+0x50c>
    d164:	00fc87b3          	add	a5,s9,a5
    d168:	fffd0693          	add	a3,s10,-1
    d16c:	3797e263          	bltu	a5,s9,d4d0 <__divdf3+0x85c>
    d170:	3777f063          	bgeu	a5,s7,d4d0 <__divdf3+0x85c>
    d174:	ffed0713          	add	a4,s10,-2
    d178:	00e12623          	sw	a4,12(sp)
    d17c:	019787b3          	add	a5,a5,s9
    d180:	41778bb3          	sub	s7,a5,s7
    d184:	00090593          	mv	a1,s2
    d188:	000b8513          	mv	a0,s7
    d18c:	5b5010ef          	jal	ef40 <__hidden___udivsi3>
    d190:	00050593          	mv	a1,a0
    d194:	00050d13          	mv	s10,a0
    d198:	000b0513          	mv	a0,s6
    d19c:	4e1010ef          	jal	ee7c <__mulsi3>
    d1a0:	00050793          	mv	a5,a0
    d1a4:	00090593          	mv	a1,s2
    d1a8:	000b8513          	mv	a0,s7
    d1ac:	00078913          	mv	s2,a5
    d1b0:	01049493          	sll	s1,s1,0x10
    d1b4:	5d5010ef          	jal	ef88 <__umodsi3>
    d1b8:	01051513          	sll	a0,a0,0x10
    d1bc:	0104d493          	srl	s1,s1,0x10
    d1c0:	00a4e4b3          	or	s1,s1,a0
    d1c4:	0124fe63          	bgeu	s1,s2,d1e0 <__divdf3+0x56c>
    d1c8:	009c84b3          	add	s1,s9,s1
    d1cc:	fffd0793          	add	a5,s10,-1
    d1d0:	3194e463          	bltu	s1,s9,d4d8 <__divdf3+0x864>
    d1d4:	3124f263          	bgeu	s1,s2,d4d8 <__divdf3+0x864>
    d1d8:	ffed0d13          	add	s10,s10,-2
    d1dc:	019484b3          	add	s1,s1,s9
    d1e0:	00c12783          	lw	a5,12(sp)
    d1e4:	412484b3          	sub	s1,s1,s2
    d1e8:	000d8593          	mv	a1,s11
    d1ec:	01079813          	sll	a6,a5,0x10
    d1f0:	01a86833          	or	a6,a6,s10
    d1f4:	01081313          	sll	t1,a6,0x10
    d1f8:	01035313          	srl	t1,t1,0x10
    d1fc:	01085793          	srl	a5,a6,0x10
    d200:	00030513          	mv	a0,t1
    d204:	479010ef          	jal	ee7c <__mulsi3>
    d208:	00050893          	mv	a7,a0
    d20c:	000c0593          	mv	a1,s8
    d210:	00030513          	mv	a0,t1
    d214:	469010ef          	jal	ee7c <__mulsi3>
    d218:	00050313          	mv	t1,a0
    d21c:	000d8593          	mv	a1,s11
    d220:	00078513          	mv	a0,a5
    d224:	459010ef          	jal	ee7c <__mulsi3>
    d228:	00050e13          	mv	t3,a0
    d22c:	000c0593          	mv	a1,s8
    d230:	00078513          	mv	a0,a5
    d234:	449010ef          	jal	ee7c <__mulsi3>
    d238:	0108d793          	srl	a5,a7,0x10
    d23c:	01c30333          	add	t1,t1,t3
    d240:	006787b3          	add	a5,a5,t1
    d244:	01c7f663          	bgeu	a5,t3,d250 <__divdf3+0x5dc>
    d248:	00010737          	lui	a4,0x10
    d24c:	00e50533          	add	a0,a0,a4
    d250:	000106b7          	lui	a3,0x10
    d254:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    d258:	0107d713          	srl	a4,a5,0x10
    d25c:	00d7f7b3          	and	a5,a5,a3
    d260:	01079793          	sll	a5,a5,0x10
    d264:	00d8f8b3          	and	a7,a7,a3
    d268:	00a70733          	add	a4,a4,a0
    d26c:	011787b3          	add	a5,a5,a7
    d270:	02e4e063          	bltu	s1,a4,d290 <__divdf3+0x61c>
    d274:	00e48c63          	beq	s1,a4,d28c <__divdf3+0x618>
    d278:	02412c83          	lw	s9,36(sp)
    d27c:	02012d03          	lw	s10,32(sp)
    d280:	01c12d83          	lw	s11,28(sp)
    d284:	00186813          	or	a6,a6,1
    d288:	c61ff06f          	j	cee8 <__divdf3+0x274>
    d28c:	1c078a63          	beqz	a5,d460 <__divdf3+0x7ec>
    d290:	009c84b3          	add	s1,s9,s1
    d294:	fff80613          	add	a2,a6,-1
    d298:	00048693          	mv	a3,s1
    d29c:	1b94ec63          	bltu	s1,s9,d454 <__divdf3+0x7e0>
    d2a0:	24e4ea63          	bltu	s1,a4,d4f4 <__divdf3+0x880>
    d2a4:	26e48863          	beq	s1,a4,d514 <__divdf3+0x8a0>
    d2a8:	00060813          	mv	a6,a2
    d2ac:	fcdff06f          	j	d278 <__divdf3+0x604>
    d2b0:	00100713          	li	a4,1
    d2b4:	b20790e3          	bnez	a5,cdd4 <__divdf3+0x160>
    d2b8:	41e98793          	add	a5,s3,1054
    d2bc:	00f816b3          	sll	a3,a6,a5
    d2c0:	00d036b3          	snez	a3,a3
    d2c4:	00f417b3          	sll	a5,s0,a5
    d2c8:	00f6e7b3          	or	a5,a3,a5
    d2cc:	00e85833          	srl	a6,a6,a4
    d2d0:	00f86833          	or	a6,a6,a5
    d2d4:	00787793          	and	a5,a6,7
    d2d8:	00e45433          	srl	s0,s0,a4
    d2dc:	02078063          	beqz	a5,d2fc <__divdf3+0x688>
    d2e0:	00f87793          	and	a5,a6,15
    d2e4:	00400713          	li	a4,4
    d2e8:	00e78a63          	beq	a5,a4,d2fc <__divdf3+0x688>
    d2ec:	00480793          	add	a5,a6,4
    d2f0:	0107b833          	sltu	a6,a5,a6
    d2f4:	01040433          	add	s0,s0,a6
    d2f8:	00078813          	mv	a6,a5
    d2fc:	00841613          	sll	a2,s0,0x8
    d300:	00100793          	li	a5,1
    d304:	00000693          	li	a3,0
    d308:	00000713          	li	a4,0
    d30c:	ae0640e3          	bltz	a2,cdec <__divdf3+0x178>
    d310:	1280006f          	j	d438 <__divdf3+0x7c4>
    d314:	de9d7ce3          	bgeu	s10,s1,d10c <__divdf3+0x498>
    d318:	015d06b3          	add	a3,s10,s5
    d31c:	01a6b633          	sltu	a2,a3,s10
    d320:	019605b3          	add	a1,a2,s9
    d324:	00bb8bb3          	add	s7,s7,a1
    d328:	00068d13          	mv	s10,a3
    d32c:	fff40593          	add	a1,s0,-1
    d330:	077cfe63          	bgeu	s9,s7,d3ac <__divdf3+0x738>
    d334:	14fbe063          	bltu	s7,a5,d474 <__divdf3+0x800>
    d338:	13778c63          	beq	a5,s7,d470 <__divdf3+0x7fc>
    d33c:	00058413          	mv	s0,a1
    d340:	dcdff06f          	j	d10c <__divdf3+0x498>
    d344:	c50bece3          	bltu	s7,a6,cf9c <__divdf3+0x328>
    d348:	01fb1c13          	sll	s8,s6,0x1f
    d34c:	001bd713          	srl	a4,s7,0x1
    d350:	001b5493          	srl	s1,s6,0x1
    d354:	00ec6c33          	or	s8,s8,a4
    d358:	01fb9d13          	sll	s10,s7,0x1f
    d35c:	c51ff06f          	j	cfac <__divdf3+0x338>
    d360:	000a0513          	mv	a0,s4
    d364:	489010ef          	jal	efec <__clzsi2>
    d368:	01550693          	add	a3,a0,21
    d36c:	01c00713          	li	a4,28
    d370:	02050793          	add	a5,a0,32
    d374:	a2d75ae3          	bge	a4,a3,cda8 <__divdf3+0x134>
    d378:	ff850513          	add	a0,a0,-8
    d37c:	00000813          	li	a6,0
    d380:	00aa1433          	sll	s0,s4,a0
    d384:	a41ff06f          	j	cdc4 <__divdf3+0x150>
    d388:	465010ef          	jal	efec <__clzsi2>
    d38c:	01550793          	add	a5,a0,21
    d390:	01c00693          	li	a3,28
    d394:	02050713          	add	a4,a0,32
    d398:	acf6dee3          	bge	a3,a5,ce74 <__divdf3+0x200>
    d39c:	ff850493          	add	s1,a0,-8
    d3a0:	00941b33          	sll	s6,s0,s1
    d3a4:	00000b93          	li	s7,0
    d3a8:	ae9ff06f          	j	ce90 <__divdf3+0x21c>
    d3ac:	f97c98e3          	bne	s9,s7,d33c <__divdf3+0x6c8>
    d3b0:	f80602e3          	beqz	a2,d334 <__divdf3+0x6c0>
    d3b4:	00058413          	mv	s0,a1
    d3b8:	d55ff06f          	j	d10c <__divdf3+0x498>
    d3bc:	ca97f8e3          	bgeu	a5,s1,d06c <__divdf3+0x3f8>
    d3c0:	ffeb8b93          	add	s7,s7,-2
    d3c4:	019787b3          	add	a5,a5,s9
    d3c8:	ca9ff06f          	j	d070 <__divdf3+0x3fc>
    d3cc:	c497f4e3          	bgeu	a5,s1,d014 <__divdf3+0x3a0>
    d3d0:	ffe40413          	add	s0,s0,-2
    d3d4:	019787b3          	add	a5,a5,s9
    d3d8:	c41ff06f          	j	d018 <__divdf3+0x3a4>
    d3dc:	01f00693          	li	a3,31
    d3e0:	ece6dce3          	bge	a3,a4,d2b8 <__divdf3+0x644>
    d3e4:	fe100693          	li	a3,-31
    d3e8:	40f686b3          	sub	a3,a3,a5
    d3ec:	02000793          	li	a5,32
    d3f0:	00d456b3          	srl	a3,s0,a3
    d3f4:	00f70863          	beq	a4,a5,d404 <__divdf3+0x790>
    d3f8:	43e98793          	add	a5,s3,1086
    d3fc:	00f417b3          	sll	a5,s0,a5
    d400:	00f86833          	or	a6,a6,a5
    d404:	01003833          	snez	a6,a6
    d408:	00d86833          	or	a6,a6,a3
    d40c:	00787713          	and	a4,a6,7
    d410:	00000693          	li	a3,0
    d414:	02070863          	beqz	a4,d444 <__divdf3+0x7d0>
    d418:	00f87793          	and	a5,a6,15
    d41c:	00400713          	li	a4,4
    d420:	00000413          	li	s0,0
    d424:	00e78a63          	beq	a5,a4,d438 <__divdf3+0x7c4>
    d428:	00480793          	add	a5,a6,4
    d42c:	0107b833          	sltu	a6,a5,a6
    d430:	01003433          	snez	s0,a6
    d434:	00078813          	mv	a6,a5
    d438:	00941693          	sll	a3,s0,0x9
    d43c:	01d41713          	sll	a4,s0,0x1d
    d440:	00c6d693          	srl	a3,a3,0xc
    d444:	00385813          	srl	a6,a6,0x3
    d448:	00e86733          	or	a4,a6,a4
    d44c:	00000793          	li	a5,0
    d450:	99dff06f          	j	cdec <__divdf3+0x178>
    d454:	00060813          	mv	a6,a2
    d458:	e2e690e3          	bne	a3,a4,d278 <__divdf3+0x604>
    d45c:	e1579ee3          	bne	a5,s5,d278 <__divdf3+0x604>
    d460:	02412c83          	lw	s9,36(sp)
    d464:	02012d03          	lw	s10,32(sp)
    d468:	01c12d83          	lw	s11,28(sp)
    d46c:	a7dff06f          	j	cee8 <__divdf3+0x274>
    d470:	ec96f6e3          	bgeu	a3,s1,d33c <__divdf3+0x6c8>
    d474:	00da86b3          	add	a3,s5,a3
    d478:	0156b633          	sltu	a2,a3,s5
    d47c:	01960633          	add	a2,a2,s9
    d480:	ffe40413          	add	s0,s0,-2
    d484:	00068d13          	mv	s10,a3
    d488:	00cb8bb3          	add	s7,s7,a2
    d48c:	c81ff06f          	j	d10c <__divdf3+0x498>
    d490:	c0200713          	li	a4,-1022
    d494:	02412c83          	lw	s9,36(sp)
    d498:	02012d03          	lw	s10,32(sp)
    d49c:	01c12d83          	lw	s11,28(sp)
    d4a0:	3ff98793          	add	a5,s3,1023
    d4a4:	fff00813          	li	a6,-1
    d4a8:	e0e9c4e3          	blt	s3,a4,d2b0 <__divdf3+0x63c>
    d4ac:	00480713          	add	a4,a6,4
    d4b0:	01073833          	sltu	a6,a4,a6
    d4b4:	01040433          	add	s0,s0,a6
    d4b8:	00070813          	mv	a6,a4
    d4bc:	a3dff06f          	j	cef8 <__divdf3+0x284>
    d4c0:	00f87713          	and	a4,a6,15
    d4c4:	00400693          	li	a3,4
    d4c8:	a2d708e3          	beq	a4,a3,cef8 <__divdf3+0x284>
    d4cc:	fe1ff06f          	j	d4ac <__divdf3+0x838>
    d4d0:	00d12623          	sw	a3,12(sp)
    d4d4:	cadff06f          	j	d180 <__divdf3+0x50c>
    d4d8:	00078d13          	mv	s10,a5
    d4dc:	d05ff06f          	j	d1e0 <__divdf3+0x56c>
    d4e0:	00090a13          	mv	s4,s2
    d4e4:	7ff00793          	li	a5,2047
    d4e8:	00000693          	li	a3,0
    d4ec:	00000713          	li	a4,0
    d4f0:	8fdff06f          	j	cdec <__divdf3+0x178>
    d4f4:	001a9613          	sll	a2,s5,0x1
    d4f8:	015636b3          	sltu	a3,a2,s5
    d4fc:	019686b3          	add	a3,a3,s9
    d500:	00d486b3          	add	a3,s1,a3
    d504:	ffe80813          	add	a6,a6,-2
    d508:	00060a93          	mv	s5,a2
    d50c:	f4e688e3          	beq	a3,a4,d45c <__divdf3+0x7e8>
    d510:	d69ff06f          	j	d278 <__divdf3+0x604>
    d514:	fefae0e3          	bltu	s5,a5,d4f4 <__divdf3+0x880>
    d518:	00060813          	mv	a6,a2
    d51c:	f41ff06f          	j	d45c <__divdf3+0x7e8>

0000d520 <__eqdf2>:
    d520:	0145d713          	srl	a4,a1,0x14
    d524:	001007b7          	lui	a5,0x100
    d528:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d52c:	0146d813          	srl	a6,a3,0x14
    d530:	7ff77713          	and	a4,a4,2047
    d534:	7ff00313          	li	t1,2047
    d538:	00b7fe33          	and	t3,a5,a1
    d53c:	00050893          	mv	a7,a0
    d540:	00d7f7b3          	and	a5,a5,a3
    d544:	01f5d593          	srl	a1,a1,0x1f
    d548:	7ff87813          	and	a6,a6,2047
    d54c:	01f6d693          	srl	a3,a3,0x1f
    d550:	00100513          	li	a0,1
    d554:	00670c63          	beq	a4,t1,d56c <__eqdf2+0x4c>
    d558:	00680863          	beq	a6,t1,d568 <__eqdf2+0x48>
    d55c:	01071463          	bne	a4,a6,d564 <__eqdf2+0x44>
    d560:	02fe0663          	beq	t3,a5,d58c <__eqdf2+0x6c>
    d564:	00008067          	ret
    d568:	00008067          	ret
    d56c:	fee81ce3          	bne	a6,a4,d564 <__eqdf2+0x44>
    d570:	00fe67b3          	or	a5,t3,a5
    d574:	00c7e7b3          	or	a5,a5,a2
    d578:	0117e7b3          	or	a5,a5,a7
    d57c:	fe0794e3          	bnez	a5,d564 <__eqdf2+0x44>
    d580:	40d585b3          	sub	a1,a1,a3
    d584:	00b03533          	snez	a0,a1
    d588:	00008067          	ret
    d58c:	fcc89ce3          	bne	a7,a2,d564 <__eqdf2+0x44>
    d590:	00d58a63          	beq	a1,a3,d5a4 <__eqdf2+0x84>
    d594:	fc0718e3          	bnez	a4,d564 <__eqdf2+0x44>
    d598:	011e6e33          	or	t3,t3,a7
    d59c:	01c03533          	snez	a0,t3
    d5a0:	00008067          	ret
    d5a4:	00000513          	li	a0,0
    d5a8:	00008067          	ret

0000d5ac <__gedf2>:
    d5ac:	0145d893          	srl	a7,a1,0x14
    d5b0:	001007b7          	lui	a5,0x100
    d5b4:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d5b8:	0146d713          	srl	a4,a3,0x14
    d5bc:	7ff8f893          	and	a7,a7,2047
    d5c0:	7ff00e13          	li	t3,2047
    d5c4:	00b7f333          	and	t1,a5,a1
    d5c8:	00050813          	mv	a6,a0
    d5cc:	00050e93          	mv	t4,a0
    d5d0:	00d7f7b3          	and	a5,a5,a3
    d5d4:	01f5d593          	srl	a1,a1,0x1f
    d5d8:	00060f13          	mv	t5,a2
    d5dc:	7ff77513          	and	a0,a4,2047
    d5e0:	01f6d693          	srl	a3,a3,0x1f
    d5e4:	05c88863          	beq	a7,t3,d634 <__gedf2+0x88>
    d5e8:	03c50463          	beq	a0,t3,d610 <__gedf2+0x64>
    d5ec:	06089a63          	bnez	a7,d660 <__gedf2+0xb4>
    d5f0:	01036833          	or	a6,t1,a6
    d5f4:	06051063          	bnez	a0,d654 <__gedf2+0xa8>
    d5f8:	00c7e633          	or	a2,a5,a2
    d5fc:	08060c63          	beqz	a2,d694 <__gedf2+0xe8>
    d600:	0a081263          	bnez	a6,d6a4 <__gedf2+0xf8>
    d604:	00100513          	li	a0,1
    d608:	08068263          	beqz	a3,d68c <__gedf2+0xe0>
    d60c:	00008067          	ret
    d610:	00c7e633          	or	a2,a5,a2
    d614:	08061463          	bnez	a2,d69c <__gedf2+0xf0>
    d618:	00089663          	bnez	a7,d624 <__gedf2+0x78>
    d61c:	01036333          	or	t1,t1,a6
    d620:	fe0302e3          	beqz	t1,d604 <__gedf2+0x58>
    d624:	06d58063          	beq	a1,a3,d684 <__gedf2+0xd8>
    d628:	06059263          	bnez	a1,d68c <__gedf2+0xe0>
    d62c:	00100513          	li	a0,1
    d630:	00008067          	ret
    d634:	01036333          	or	t1,t1,a6
    d638:	06031263          	bnez	t1,d69c <__gedf2+0xf0>
    d63c:	ff1516e3          	bne	a0,a7,d628 <__gedf2+0x7c>
    d640:	00c7e7b3          	or	a5,a5,a2
    d644:	04079c63          	bnez	a5,d69c <__gedf2+0xf0>
    d648:	fed590e3          	bne	a1,a3,d628 <__gedf2+0x7c>
    d64c:	00000513          	li	a0,0
    d650:	00008067          	ret
    d654:	fa0808e3          	beqz	a6,d604 <__gedf2+0x58>
    d658:	fcd598e3          	bne	a1,a3,d628 <__gedf2+0x7c>
    d65c:	0280006f          	j	d684 <__gedf2+0xd8>
    d660:	fc0504e3          	beqz	a0,d628 <__gedf2+0x7c>
    d664:	fcd592e3          	bne	a1,a3,d628 <__gedf2+0x7c>
    d668:	fd1540e3          	blt	a0,a7,d628 <__gedf2+0x7c>
    d66c:	00a8cc63          	blt	a7,a0,d684 <__gedf2+0xd8>
    d670:	fa67ece3          	bltu	a5,t1,d628 <__gedf2+0x7c>
    d674:	00f31863          	bne	t1,a5,d684 <__gedf2+0xd8>
    d678:	fbdf68e3          	bltu	t5,t4,d628 <__gedf2+0x7c>
    d67c:	00000513          	li	a0,0
    d680:	f9eef6e3          	bgeu	t4,t5,d60c <__gedf2+0x60>
    d684:	00100513          	li	a0,1
    d688:	f80592e3          	bnez	a1,d60c <__gedf2+0x60>
    d68c:	fff00513          	li	a0,-1
    d690:	00008067          	ret
    d694:	f8081ae3          	bnez	a6,d628 <__gedf2+0x7c>
    d698:	00008067          	ret
    d69c:	ffe00513          	li	a0,-2
    d6a0:	00008067          	ret
    d6a4:	fcd586e3          	beq	a1,a3,d670 <__gedf2+0xc4>
    d6a8:	f81ff06f          	j	d628 <__gedf2+0x7c>

0000d6ac <__ledf2>:
    d6ac:	0145d893          	srl	a7,a1,0x14
    d6b0:	001007b7          	lui	a5,0x100
    d6b4:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d6b8:	0146d713          	srl	a4,a3,0x14
    d6bc:	7ff8f893          	and	a7,a7,2047
    d6c0:	7ff00313          	li	t1,2047
    d6c4:	00b7fe33          	and	t3,a5,a1
    d6c8:	00050813          	mv	a6,a0
    d6cc:	00050e93          	mv	t4,a0
    d6d0:	00d7f7b3          	and	a5,a5,a3
    d6d4:	01f5d593          	srl	a1,a1,0x1f
    d6d8:	00060f13          	mv	t5,a2
    d6dc:	7ff77513          	and	a0,a4,2047
    d6e0:	01f6d693          	srl	a3,a3,0x1f
    d6e4:	04688a63          	beq	a7,t1,d738 <__ledf2+0x8c>
    d6e8:	02650463          	beq	a0,t1,d710 <__ledf2+0x64>
    d6ec:	06089863          	bnez	a7,d75c <__ledf2+0xb0>
    d6f0:	010e6833          	or	a6,t3,a6
    d6f4:	08051e63          	bnez	a0,d790 <__ledf2+0xe4>
    d6f8:	00c7e633          	or	a2,a5,a2
    d6fc:	0a060463          	beqz	a2,d7a4 <__ledf2+0xf8>
    d700:	0a081663          	bnez	a6,d7ac <__ledf2+0x100>
    d704:	00100513          	li	a0,1
    d708:	08068063          	beqz	a3,d788 <__ledf2+0xdc>
    d70c:	00008067          	ret
    d710:	00c7e633          	or	a2,a5,a2
    d714:	00200513          	li	a0,2
    d718:	fe061ae3          	bnez	a2,d70c <__ledf2+0x60>
    d71c:	00089663          	bnez	a7,d728 <__ledf2+0x7c>
    d720:	010e6e33          	or	t3,t3,a6
    d724:	fe0e00e3          	beqz	t3,d704 <__ledf2+0x58>
    d728:	04d58c63          	beq	a1,a3,d780 <__ledf2+0xd4>
    d72c:	04059e63          	bnez	a1,d788 <__ledf2+0xdc>
    d730:	00100513          	li	a0,1
    d734:	00008067          	ret
    d738:	010e6e33          	or	t3,t3,a6
    d73c:	060e1063          	bnez	t3,d79c <__ledf2+0xf0>
    d740:	ff1516e3          	bne	a0,a7,d72c <__ledf2+0x80>
    d744:	00c7e7b3          	or	a5,a5,a2
    d748:	00200513          	li	a0,2
    d74c:	fc0790e3          	bnez	a5,d70c <__ledf2+0x60>
    d750:	fcd59ee3          	bne	a1,a3,d72c <__ledf2+0x80>
    d754:	00000513          	li	a0,0
    d758:	00008067          	ret
    d75c:	fc0508e3          	beqz	a0,d72c <__ledf2+0x80>
    d760:	fcd596e3          	bne	a1,a3,d72c <__ledf2+0x80>
    d764:	fd1544e3          	blt	a0,a7,d72c <__ledf2+0x80>
    d768:	00a8cc63          	blt	a7,a0,d780 <__ledf2+0xd4>
    d76c:	fdc7e0e3          	bltu	a5,t3,d72c <__ledf2+0x80>
    d770:	00fe1863          	bne	t3,a5,d780 <__ledf2+0xd4>
    d774:	fbdf6ce3          	bltu	t5,t4,d72c <__ledf2+0x80>
    d778:	00000513          	li	a0,0
    d77c:	f9eef8e3          	bgeu	t4,t5,d70c <__ledf2+0x60>
    d780:	00100513          	li	a0,1
    d784:	f80594e3          	bnez	a1,d70c <__ledf2+0x60>
    d788:	fff00513          	li	a0,-1
    d78c:	00008067          	ret
    d790:	f6080ae3          	beqz	a6,d704 <__ledf2+0x58>
    d794:	f8d59ce3          	bne	a1,a3,d72c <__ledf2+0x80>
    d798:	fe9ff06f          	j	d780 <__ledf2+0xd4>
    d79c:	00200513          	li	a0,2
    d7a0:	00008067          	ret
    d7a4:	f80814e3          	bnez	a6,d72c <__ledf2+0x80>
    d7a8:	00008067          	ret
    d7ac:	fcd580e3          	beq	a1,a3,d76c <__ledf2+0xc0>
    d7b0:	f7dff06f          	j	d72c <__ledf2+0x80>

0000d7b4 <__muldf3>:
    d7b4:	fd010113          	add	sp,sp,-48
    d7b8:	0145d793          	srl	a5,a1,0x14
    d7bc:	02812423          	sw	s0,40(sp)
    d7c0:	02912223          	sw	s1,36(sp)
    d7c4:	03212023          	sw	s2,32(sp)
    d7c8:	01312e23          	sw	s3,28(sp)
    d7cc:	01512a23          	sw	s5,20(sp)
    d7d0:	00c59493          	sll	s1,a1,0xc
    d7d4:	02112623          	sw	ra,44(sp)
    d7d8:	01412c23          	sw	s4,24(sp)
    d7dc:	01612823          	sw	s6,16(sp)
    d7e0:	01712623          	sw	s7,12(sp)
    d7e4:	01812423          	sw	s8,8(sp)
    d7e8:	7ff7f793          	and	a5,a5,2047
    d7ec:	00050413          	mv	s0,a0
    d7f0:	00060a93          	mv	s5,a2
    d7f4:	00068993          	mv	s3,a3
    d7f8:	00c4d493          	srl	s1,s1,0xc
    d7fc:	01f5d913          	srl	s2,a1,0x1f
    d800:	4e078063          	beqz	a5,dce0 <__muldf3+0x52c>
    d804:	7ff00713          	li	a4,2047
    d808:	0ae78663          	beq	a5,a4,d8b4 <__muldf3+0x100>
    d80c:	00349693          	sll	a3,s1,0x3
    d810:	01d55713          	srl	a4,a0,0x1d
    d814:	00d76733          	or	a4,a4,a3
    d818:	008006b7          	lui	a3,0x800
    d81c:	00d764b3          	or	s1,a4,a3
    d820:	00351a13          	sll	s4,a0,0x3
    d824:	c0178c13          	add	s8,a5,-1023
    d828:	00000b13          	li	s6,0
    d82c:	00000b93          	li	s7,0
    d830:	0149d793          	srl	a5,s3,0x14
    d834:	00c99713          	sll	a4,s3,0xc
    d838:	7ff7f793          	and	a5,a5,2047
    d83c:	000a8e13          	mv	t3,s5
    d840:	00c75413          	srl	s0,a4,0xc
    d844:	01f9d993          	srl	s3,s3,0x1f
    d848:	0a078063          	beqz	a5,d8e8 <__muldf3+0x134>
    d84c:	7ff00713          	li	a4,2047
    d850:	14e78e63          	beq	a5,a4,d9ac <__muldf3+0x1f8>
    d854:	00341713          	sll	a4,s0,0x3
    d858:	01dad693          	srl	a3,s5,0x1d
    d85c:	00e6e6b3          	or	a3,a3,a4
    d860:	c0178793          	add	a5,a5,-1023
    d864:	00800737          	lui	a4,0x800
    d868:	00e6e433          	or	s0,a3,a4
    d86c:	003a9e13          	sll	t3,s5,0x3
    d870:	01878333          	add	t1,a5,s8
    d874:	00000693          	li	a3,0
    d878:	00a00793          	li	a5,10
    d87c:	00130893          	add	a7,t1,1
    d880:	0b67cc63          	blt	a5,s6,d938 <__muldf3+0x184>
    d884:	013945b3          	xor	a1,s2,s3
    d888:	00200793          	li	a5,2
    d88c:	00058813          	mv	a6,a1
    d890:	1567c663          	blt	a5,s6,d9dc <__muldf3+0x228>
    d894:	fffb0b13          	add	s6,s6,-1
    d898:	00100713          	li	a4,1
    d89c:	17676063          	bltu	a4,s6,d9fc <__muldf3+0x248>
    d8a0:	48f68663          	beq	a3,a5,dd2c <__muldf3+0x578>
    d8a4:	00040493          	mv	s1,s0
    d8a8:	000e0a13          	mv	s4,t3
    d8ac:	00068b93          	mv	s7,a3
    d8b0:	09c0006f          	j	d94c <__muldf3+0x198>
    d8b4:	00a4ea33          	or	s4,s1,a0
    d8b8:	480a1463          	bnez	s4,dd40 <__muldf3+0x58c>
    d8bc:	0149d793          	srl	a5,s3,0x14
    d8c0:	00c99713          	sll	a4,s3,0xc
    d8c4:	7ff7f793          	and	a5,a5,2047
    d8c8:	00000493          	li	s1,0
    d8cc:	00800b13          	li	s6,8
    d8d0:	7ff00c13          	li	s8,2047
    d8d4:	00200b93          	li	s7,2
    d8d8:	000a8e13          	mv	t3,s5
    d8dc:	00c75413          	srl	s0,a4,0xc
    d8e0:	01f9d993          	srl	s3,s3,0x1f
    d8e4:	f60794e3          	bnez	a5,d84c <__muldf3+0x98>
    d8e8:	015467b3          	or	a5,s0,s5
    d8ec:	46078e63          	beqz	a5,dd68 <__muldf3+0x5b4>
    d8f0:	54040c63          	beqz	s0,de48 <__muldf3+0x694>
    d8f4:	00040513          	mv	a0,s0
    d8f8:	6f4010ef          	jal	efec <__clzsi2>
    d8fc:	00050313          	mv	t1,a0
    d900:	ff550713          	add	a4,a0,-11
    d904:	01d00793          	li	a5,29
    d908:	ff830e13          	add	t3,t1,-8
    d90c:	40e787b3          	sub	a5,a5,a4
    d910:	00fad7b3          	srl	a5,s5,a5
    d914:	01c41733          	sll	a4,s0,t3
    d918:	00e7e433          	or	s0,a5,a4
    d91c:	01ca9e33          	sll	t3,s5,t3
    d920:	406c0333          	sub	t1,s8,t1
    d924:	c0d30313          	add	t1,t1,-1011
    d928:	00a00793          	li	a5,10
    d92c:	00000693          	li	a3,0
    d930:	00130893          	add	a7,t1,1
    d934:	f567d8e3          	bge	a5,s6,d884 <__muldf3+0xd0>
    d938:	00090593          	mv	a1,s2
    d93c:	00200793          	li	a5,2
    d940:	3efb8663          	beq	s7,a5,dd2c <__muldf3+0x578>
    d944:	00300793          	li	a5,3
    d948:	54fb8863          	beq	s7,a5,de98 <__muldf3+0x6e4>
    d94c:	00100793          	li	a5,1
    d950:	00058813          	mv	a6,a1
    d954:	52fb9663          	bne	s7,a5,de80 <__muldf3+0x6cc>
    d958:	00000793          	li	a5,0
    d95c:	00000693          	li	a3,0
    d960:	00000713          	li	a4,0
    d964:	02c12083          	lw	ra,44(sp)
    d968:	02812403          	lw	s0,40(sp)
    d96c:	01479793          	sll	a5,a5,0x14
    d970:	00d7e7b3          	or	a5,a5,a3
    d974:	01f81813          	sll	a6,a6,0x1f
    d978:	0107e7b3          	or	a5,a5,a6
    d97c:	02412483          	lw	s1,36(sp)
    d980:	02012903          	lw	s2,32(sp)
    d984:	01c12983          	lw	s3,28(sp)
    d988:	01812a03          	lw	s4,24(sp)
    d98c:	01412a83          	lw	s5,20(sp)
    d990:	01012b03          	lw	s6,16(sp)
    d994:	00c12b83          	lw	s7,12(sp)
    d998:	00812c03          	lw	s8,8(sp)
    d99c:	00070513          	mv	a0,a4
    d9a0:	00078593          	mv	a1,a5
    d9a4:	03010113          	add	sp,sp,48
    d9a8:	00008067          	ret
    d9ac:	01546733          	or	a4,s0,s5
    d9b0:	7ffc0313          	add	t1,s8,2047
    d9b4:	3c070663          	beqz	a4,dd80 <__muldf3+0x5cc>
    d9b8:	00001737          	lui	a4,0x1
    d9bc:	01394833          	xor	a6,s2,s3
    d9c0:	80070713          	add	a4,a4,-2048 # 800 <gemm_cfs_2x2+0x26c>
    d9c4:	003b6b13          	or	s6,s6,3
    d9c8:	00a00693          	li	a3,10
    d9cc:	00080593          	mv	a1,a6
    d9d0:	00ec08b3          	add	a7,s8,a4
    d9d4:	4366cc63          	blt	a3,s6,de0c <__muldf3+0x658>
    d9d8:	00300693          	li	a3,3
    d9dc:	00100613          	li	a2,1
    d9e0:	01661633          	sll	a2,a2,s6
    d9e4:	53067713          	and	a4,a2,1328
    d9e8:	f4071ae3          	bnez	a4,d93c <__muldf3+0x188>
    d9ec:	24067793          	and	a5,a2,576
    d9f0:	48079063          	bnez	a5,de70 <__muldf3+0x6bc>
    d9f4:	08867613          	and	a2,a2,136
    d9f8:	38061e63          	bnez	a2,dd94 <__muldf3+0x5e0>
    d9fc:	00010fb7          	lui	t6,0x10
    da00:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    da04:	005a7f33          	and	t5,s4,t0
    da08:	005e72b3          	and	t0,t3,t0
    da0c:	010a5a13          	srl	s4,s4,0x10
    da10:	010e5e13          	srl	t3,t3,0x10
    da14:	000f0513          	mv	a0,t5
    da18:	00028593          	mv	a1,t0
    da1c:	460010ef          	jal	ee7c <__mulsi3>
    da20:	00050713          	mv	a4,a0
    da24:	000e0593          	mv	a1,t3
    da28:	000f0513          	mv	a0,t5
    da2c:	450010ef          	jal	ee7c <__mulsi3>
    da30:	00050793          	mv	a5,a0
    da34:	00028593          	mv	a1,t0
    da38:	000a0513          	mv	a0,s4
    da3c:	440010ef          	jal	ee7c <__mulsi3>
    da40:	00050e93          	mv	t4,a0
    da44:	000e0593          	mv	a1,t3
    da48:	000a0513          	mv	a0,s4
    da4c:	430010ef          	jal	ee7c <__mulsi3>
    da50:	01d786b3          	add	a3,a5,t4
    da54:	01075393          	srl	t2,a4,0x10
    da58:	00d383b3          	add	t2,t2,a3
    da5c:	00050793          	mv	a5,a0
    da60:	01d3f463          	bgeu	t2,t4,da68 <__muldf3+0x2b4>
    da64:	01f507b3          	add	a5,a0,t6
    da68:	000109b7          	lui	s3,0x10
    da6c:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    da70:	0123feb3          	and	t4,t2,s2
    da74:	01277733          	and	a4,a4,s2
    da78:	010e9e93          	sll	t4,t4,0x10
    da7c:	01247933          	and	s2,s0,s2
    da80:	0103d393          	srl	t2,t2,0x10
    da84:	00ee8eb3          	add	t4,t4,a4
    da88:	01045413          	srl	s0,s0,0x10
    da8c:	000f0513          	mv	a0,t5
    da90:	00090593          	mv	a1,s2
    da94:	3e8010ef          	jal	ee7c <__mulsi3>
    da98:	00050f93          	mv	t6,a0
    da9c:	00040593          	mv	a1,s0
    daa0:	000f0513          	mv	a0,t5
    daa4:	3d8010ef          	jal	ee7c <__mulsi3>
    daa8:	00050713          	mv	a4,a0
    daac:	00090593          	mv	a1,s2
    dab0:	000a0513          	mv	a0,s4
    dab4:	3c8010ef          	jal	ee7c <__mulsi3>
    dab8:	00050f13          	mv	t5,a0
    dabc:	00040593          	mv	a1,s0
    dac0:	000a0513          	mv	a0,s4
    dac4:	3b8010ef          	jal	ee7c <__mulsi3>
    dac8:	010fd693          	srl	a3,t6,0x10
    dacc:	01e70733          	add	a4,a4,t5
    dad0:	00e686b3          	add	a3,a3,a4
    dad4:	01e6f463          	bgeu	a3,t5,dadc <__muldf3+0x328>
    dad8:	01350533          	add	a0,a0,s3
    dadc:	00010a37          	lui	s4,0x10
    dae0:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    dae4:	01e6f733          	and	a4,a3,t5
    dae8:	01efffb3          	and	t6,t6,t5
    daec:	01071713          	sll	a4,a4,0x10
    daf0:	01f70733          	add	a4,a4,t6
    daf4:	01e4ff33          	and	t5,s1,t5
    daf8:	0106d693          	srl	a3,a3,0x10
    dafc:	00a68fb3          	add	t6,a3,a0
    db00:	00e383b3          	add	t2,t2,a4
    db04:	0104d493          	srl	s1,s1,0x10
    db08:	000f0513          	mv	a0,t5
    db0c:	00028593          	mv	a1,t0
    db10:	36c010ef          	jal	ee7c <__mulsi3>
    db14:	00050a93          	mv	s5,a0
    db18:	000e0593          	mv	a1,t3
    db1c:	000f0513          	mv	a0,t5
    db20:	35c010ef          	jal	ee7c <__mulsi3>
    db24:	00050993          	mv	s3,a0
    db28:	00028593          	mv	a1,t0
    db2c:	00048513          	mv	a0,s1
    db30:	34c010ef          	jal	ee7c <__mulsi3>
    db34:	00050293          	mv	t0,a0
    db38:	000e0593          	mv	a1,t3
    db3c:	00048513          	mv	a0,s1
    db40:	33c010ef          	jal	ee7c <__mulsi3>
    db44:	010ad613          	srl	a2,s5,0x10
    db48:	005989b3          	add	s3,s3,t0
    db4c:	01360633          	add	a2,a2,s3
    db50:	00567463          	bgeu	a2,t0,db58 <__muldf3+0x3a4>
    db54:	01450533          	add	a0,a0,s4
    db58:	00010a37          	lui	s4,0x10
    db5c:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    db60:	00d672b3          	and	t0,a2,a3
    db64:	00dafab3          	and	s5,s5,a3
    db68:	01065613          	srl	a2,a2,0x10
    db6c:	01029293          	sll	t0,t0,0x10
    db70:	00a60e33          	add	t3,a2,a0
    db74:	015282b3          	add	t0,t0,s5
    db78:	000f0513          	mv	a0,t5
    db7c:	00090593          	mv	a1,s2
    db80:	2fc010ef          	jal	ee7c <__mulsi3>
    db84:	00050993          	mv	s3,a0
    db88:	00040593          	mv	a1,s0
    db8c:	000f0513          	mv	a0,t5
    db90:	2ec010ef          	jal	ee7c <__mulsi3>
    db94:	00050f13          	mv	t5,a0
    db98:	00090593          	mv	a1,s2
    db9c:	00048513          	mv	a0,s1
    dba0:	2dc010ef          	jal	ee7c <__mulsi3>
    dba4:	00050913          	mv	s2,a0
    dba8:	00040593          	mv	a1,s0
    dbac:	00048513          	mv	a0,s1
    dbb0:	2cc010ef          	jal	ee7c <__mulsi3>
    dbb4:	012f06b3          	add	a3,t5,s2
    dbb8:	0109d593          	srl	a1,s3,0x10
    dbbc:	00d58433          	add	s0,a1,a3
    dbc0:	00050f13          	mv	t5,a0
    dbc4:	01247463          	bgeu	s0,s2,dbcc <__muldf3+0x418>
    dbc8:	01450f33          	add	t5,a0,s4
    dbcc:	00010637          	lui	a2,0x10
    dbd0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x40f>
    dbd4:	00c476b3          	and	a3,s0,a2
    dbd8:	00c9f9b3          	and	s3,s3,a2
    dbdc:	01069693          	sll	a3,a3,0x10
    dbe0:	007787b3          	add	a5,a5,t2
    dbe4:	013686b3          	add	a3,a3,s3
    dbe8:	01f685b3          	add	a1,a3,t6
    dbec:	00e7b733          	sltu	a4,a5,a4
    dbf0:	00e58733          	add	a4,a1,a4
    dbf4:	005782b3          	add	t0,a5,t0
    dbf8:	01c70633          	add	a2,a4,t3
    dbfc:	00f2b7b3          	sltu	a5,t0,a5
    dc00:	00f607b3          	add	a5,a2,a5
    dc04:	00d5b6b3          	sltu	a3,a1,a3
    dc08:	00b735b3          	sltu	a1,a4,a1
    dc0c:	00b6e6b3          	or	a3,a3,a1
    dc10:	00e63733          	sltu	a4,a2,a4
    dc14:	01045593          	srl	a1,s0,0x10
    dc18:	00c7b633          	sltu	a2,a5,a2
    dc1c:	00b686b3          	add	a3,a3,a1
    dc20:	00929a13          	sll	s4,t0,0x9
    dc24:	00c76733          	or	a4,a4,a2
    dc28:	00d70733          	add	a4,a4,a3
    dc2c:	01da6a33          	or	s4,s4,t4
    dc30:	01e70733          	add	a4,a4,t5
    dc34:	01403a33          	snez	s4,s4
    dc38:	0172d293          	srl	t0,t0,0x17
    dc3c:	00971713          	sll	a4,a4,0x9
    dc40:	0177d693          	srl	a3,a5,0x17
    dc44:	005a6a33          	or	s4,s4,t0
    dc48:	00979793          	sll	a5,a5,0x9
    dc4c:	00fa6a33          	or	s4,s4,a5
    dc50:	00771793          	sll	a5,a4,0x7
    dc54:	00d764b3          	or	s1,a4,a3
    dc58:	0207d063          	bgez	a5,dc78 <__muldf3+0x4c4>
    dc5c:	001a5793          	srl	a5,s4,0x1
    dc60:	001a7a13          	and	s4,s4,1
    dc64:	01f49713          	sll	a4,s1,0x1f
    dc68:	0147e7b3          	or	a5,a5,s4
    dc6c:	00e7ea33          	or	s4,a5,a4
    dc70:	0014d493          	srl	s1,s1,0x1
    dc74:	00088313          	mv	t1,a7
    dc78:	3ff30793          	add	a5,t1,1023
    dc7c:	12f05663          	blez	a5,dda8 <__muldf3+0x5f4>
    dc80:	007a7713          	and	a4,s4,7
    dc84:	02070063          	beqz	a4,dca4 <__muldf3+0x4f0>
    dc88:	00fa7713          	and	a4,s4,15
    dc8c:	00400693          	li	a3,4
    dc90:	00d70a63          	beq	a4,a3,dca4 <__muldf3+0x4f0>
    dc94:	004a0713          	add	a4,s4,4
    dc98:	01473a33          	sltu	s4,a4,s4
    dc9c:	014484b3          	add	s1,s1,s4
    dca0:	00070a13          	mv	s4,a4
    dca4:	00749713          	sll	a4,s1,0x7
    dca8:	00075a63          	bgez	a4,dcbc <__muldf3+0x508>
    dcac:	ff0007b7          	lui	a5,0xff000
    dcb0:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    dcb4:	00f4f4b3          	and	s1,s1,a5
    dcb8:	40030793          	add	a5,t1,1024
    dcbc:	7fe00713          	li	a4,2046
    dcc0:	1cf74463          	blt	a4,a5,de88 <__muldf3+0x6d4>
    dcc4:	003a5a13          	srl	s4,s4,0x3
    dcc8:	01d49713          	sll	a4,s1,0x1d
    dccc:	00949693          	sll	a3,s1,0x9
    dcd0:	01476733          	or	a4,a4,s4
    dcd4:	00c6d693          	srl	a3,a3,0xc
    dcd8:	7ff7f793          	and	a5,a5,2047
    dcdc:	c89ff06f          	j	d964 <__muldf3+0x1b0>
    dce0:	00a4ea33          	or	s4,s1,a0
    dce4:	060a0863          	beqz	s4,dd54 <__muldf3+0x5a0>
    dce8:	12048e63          	beqz	s1,de24 <__muldf3+0x670>
    dcec:	00048513          	mv	a0,s1
    dcf0:	2fc010ef          	jal	efec <__clzsi2>
    dcf4:	00050713          	mv	a4,a0
    dcf8:	ff550693          	add	a3,a0,-11
    dcfc:	01d00793          	li	a5,29
    dd00:	ff870a13          	add	s4,a4,-8
    dd04:	40d787b3          	sub	a5,a5,a3
    dd08:	00f457b3          	srl	a5,s0,a5
    dd0c:	014496b3          	sll	a3,s1,s4
    dd10:	00d7e4b3          	or	s1,a5,a3
    dd14:	01441a33          	sll	s4,s0,s4
    dd18:	c0d00793          	li	a5,-1011
    dd1c:	40e78c33          	sub	s8,a5,a4
    dd20:	00000b13          	li	s6,0
    dd24:	00000b93          	li	s7,0
    dd28:	b09ff06f          	j	d830 <__muldf3+0x7c>
    dd2c:	00058813          	mv	a6,a1
    dd30:	7ff00793          	li	a5,2047
    dd34:	00000693          	li	a3,0
    dd38:	00000713          	li	a4,0
    dd3c:	c29ff06f          	j	d964 <__muldf3+0x1b0>
    dd40:	00050a13          	mv	s4,a0
    dd44:	00c00b13          	li	s6,12
    dd48:	7ff00c13          	li	s8,2047
    dd4c:	00300b93          	li	s7,3
    dd50:	ae1ff06f          	j	d830 <__muldf3+0x7c>
    dd54:	00000493          	li	s1,0
    dd58:	00400b13          	li	s6,4
    dd5c:	00000c13          	li	s8,0
    dd60:	00100b93          	li	s7,1
    dd64:	acdff06f          	j	d830 <__muldf3+0x7c>
    dd68:	001b6b13          	or	s6,s6,1
    dd6c:	000c0313          	mv	t1,s8
    dd70:	00000413          	li	s0,0
    dd74:	00000e13          	li	t3,0
    dd78:	00100693          	li	a3,1
    dd7c:	afdff06f          	j	d878 <__muldf3+0xc4>
    dd80:	002b6b13          	or	s6,s6,2
    dd84:	00000413          	li	s0,0
    dd88:	00000e13          	li	t3,0
    dd8c:	00200693          	li	a3,2
    dd90:	ae9ff06f          	j	d878 <__muldf3+0xc4>
    dd94:	00040493          	mv	s1,s0
    dd98:	000e0a13          	mv	s4,t3
    dd9c:	00068b93          	mv	s7,a3
    dda0:	00098593          	mv	a1,s3
    dda4:	b99ff06f          	j	d93c <__muldf3+0x188>
    dda8:	00100713          	li	a4,1
    ddac:	10079063          	bnez	a5,deac <__muldf3+0x6f8>
    ddb0:	41e30313          	add	t1,t1,1054
    ddb4:	006a1633          	sll	a2,s4,t1
    ddb8:	00c03633          	snez	a2,a2
    ddbc:	00649333          	sll	t1,s1,t1
    ddc0:	00ea5a33          	srl	s4,s4,a4
    ddc4:	00666633          	or	a2,a2,t1
    ddc8:	01466633          	or	a2,a2,s4
    ddcc:	00767793          	and	a5,a2,7
    ddd0:	00e4d5b3          	srl	a1,s1,a4
    ddd4:	02078063          	beqz	a5,ddf4 <__muldf3+0x640>
    ddd8:	00f67793          	and	a5,a2,15
    dddc:	00400713          	li	a4,4
    dde0:	00e78a63          	beq	a5,a4,ddf4 <__muldf3+0x640>
    dde4:	00460793          	add	a5,a2,4
    dde8:	00c7b633          	sltu	a2,a5,a2
    ddec:	00c585b3          	add	a1,a1,a2
    ddf0:	00078613          	mv	a2,a5
    ddf4:	00859513          	sll	a0,a1,0x8
    ddf8:	00100793          	li	a5,1
    ddfc:	00000693          	li	a3,0
    de00:	00000713          	li	a4,0
    de04:	b60540e3          	bltz	a0,d964 <__muldf3+0x1b0>
    de08:	10c0006f          	j	df14 <__muldf3+0x760>
    de0c:	00f00713          	li	a4,15
    de10:	12eb1063          	bne	s6,a4,df30 <__muldf3+0x77c>
    de14:	00000813          	li	a6,0
    de18:	000806b7          	lui	a3,0x80
    de1c:	00000713          	li	a4,0
    de20:	b45ff06f          	j	d964 <__muldf3+0x1b0>
    de24:	1c8010ef          	jal	efec <__clzsi2>
    de28:	01550693          	add	a3,a0,21
    de2c:	01c00793          	li	a5,28
    de30:	02050713          	add	a4,a0,32
    de34:	ecd7d4e3          	bge	a5,a3,dcfc <__muldf3+0x548>
    de38:	ff850513          	add	a0,a0,-8
    de3c:	00000a13          	li	s4,0
    de40:	00a414b3          	sll	s1,s0,a0
    de44:	ed5ff06f          	j	dd18 <__muldf3+0x564>
    de48:	000a8513          	mv	a0,s5
    de4c:	1a0010ef          	jal	efec <__clzsi2>
    de50:	01550713          	add	a4,a0,21
    de54:	01c00793          	li	a5,28
    de58:	02050313          	add	t1,a0,32
    de5c:	aae7d4e3          	bge	a5,a4,d904 <__muldf3+0x150>
    de60:	ff850513          	add	a0,a0,-8
    de64:	00000e13          	li	t3,0
    de68:	00aa9433          	sll	s0,s5,a0
    de6c:	ab5ff06f          	j	d920 <__muldf3+0x16c>
    de70:	00000813          	li	a6,0
    de74:	7ff00793          	li	a5,2047
    de78:	000806b7          	lui	a3,0x80
    de7c:	ae9ff06f          	j	d964 <__muldf3+0x1b0>
    de80:	00088313          	mv	t1,a7
    de84:	df5ff06f          	j	dc78 <__muldf3+0x4c4>
    de88:	7ff00793          	li	a5,2047
    de8c:	00000693          	li	a3,0
    de90:	00000713          	li	a4,0
    de94:	ad1ff06f          	j	d964 <__muldf3+0x1b0>
    de98:	00000813          	li	a6,0
    de9c:	7ff00793          	li	a5,2047
    dea0:	000806b7          	lui	a3,0x80
    dea4:	00000713          	li	a4,0
    dea8:	abdff06f          	j	d964 <__muldf3+0x1b0>
    deac:	40f70733          	sub	a4,a4,a5
    deb0:	03800693          	li	a3,56
    deb4:	aae6c2e3          	blt	a3,a4,d958 <__muldf3+0x1a4>
    deb8:	01f00693          	li	a3,31
    debc:	eee6dae3          	bge	a3,a4,ddb0 <__muldf3+0x5fc>
    dec0:	fe100693          	li	a3,-31
    dec4:	40f687b3          	sub	a5,a3,a5
    dec8:	02000693          	li	a3,32
    decc:	00f4d7b3          	srl	a5,s1,a5
    ded0:	00d70863          	beq	a4,a3,dee0 <__muldf3+0x72c>
    ded4:	43e30313          	add	t1,t1,1086
    ded8:	00649333          	sll	t1,s1,t1
    dedc:	006a6a33          	or	s4,s4,t1
    dee0:	01403633          	snez	a2,s4
    dee4:	00f66633          	or	a2,a2,a5
    dee8:	00767713          	and	a4,a2,7
    deec:	00000693          	li	a3,0
    def0:	02070863          	beqz	a4,df20 <__muldf3+0x76c>
    def4:	00f67793          	and	a5,a2,15
    def8:	00400713          	li	a4,4
    defc:	00000593          	li	a1,0
    df00:	00e78a63          	beq	a5,a4,df14 <__muldf3+0x760>
    df04:	00460793          	add	a5,a2,4
    df08:	00c7b633          	sltu	a2,a5,a2
    df0c:	00c035b3          	snez	a1,a2
    df10:	00078613          	mv	a2,a5
    df14:	00959693          	sll	a3,a1,0x9
    df18:	01d59713          	sll	a4,a1,0x1d
    df1c:	00c6d693          	srl	a3,a3,0xc
    df20:	00365613          	srl	a2,a2,0x3
    df24:	00e66733          	or	a4,a2,a4
    df28:	00000793          	li	a5,0
    df2c:	a39ff06f          	j	d964 <__muldf3+0x1b0>
    df30:	00040493          	mv	s1,s0
    df34:	000a8a13          	mv	s4,s5
    df38:	00300b93          	li	s7,3
    df3c:	00098593          	mv	a1,s3
    df40:	9fdff06f          	j	d93c <__muldf3+0x188>

0000df44 <__subdf3>:
    df44:	001007b7          	lui	a5,0x100
    df48:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    df4c:	fe010113          	add	sp,sp,-32
    df50:	00b7f8b3          	and	a7,a5,a1
    df54:	00d7f833          	and	a6,a5,a3
    df58:	0146d793          	srl	a5,a3,0x14
    df5c:	00389893          	sll	a7,a7,0x3
    df60:	00812c23          	sw	s0,24(sp)
    df64:	01312623          	sw	s3,12(sp)
    df68:	01f5d413          	srl	s0,a1,0x1f
    df6c:	0145d993          	srl	s3,a1,0x14
    df70:	01d55713          	srl	a4,a0,0x1d
    df74:	00381813          	sll	a6,a6,0x3
    df78:	01d65593          	srl	a1,a2,0x1d
    df7c:	00112e23          	sw	ra,28(sp)
    df80:	00912a23          	sw	s1,20(sp)
    df84:	01212823          	sw	s2,16(sp)
    df88:	7ff7ff13          	and	t5,a5,2047
    df8c:	7ff00313          	li	t1,2047
    df90:	01176733          	or	a4,a4,a7
    df94:	7ff9f993          	and	s3,s3,2047
    df98:	00040e13          	mv	t3,s0
    df9c:	00351893          	sll	a7,a0,0x3
    dfa0:	01f6d693          	srl	a3,a3,0x1f
    dfa4:	0105e5b3          	or	a1,a1,a6
    dfa8:	00361e93          	sll	t4,a2,0x3
    dfac:	206f0c63          	beq	t5,t1,e1c4 <__subdf3+0x280>
    dfb0:	0016c693          	xor	a3,a3,1
    dfb4:	41e987b3          	sub	a5,s3,t5
    dfb8:	16d40263          	beq	s0,a3,e11c <__subdf3+0x1d8>
    dfbc:	00f05ae3          	blez	a5,e7d0 <__subdf3+0x88c>
    dfc0:	240f0a63          	beqz	t5,e214 <__subdf3+0x2d0>
    dfc4:	3c698463          	beq	s3,t1,e38c <__subdf3+0x448>
    dfc8:	03800693          	li	a3,56
    dfcc:	00100513          	li	a0,1
    dfd0:	02f6ce63          	blt	a3,a5,e00c <__subdf3+0xc8>
    dfd4:	008006b7          	lui	a3,0x800
    dfd8:	00d5e5b3          	or	a1,a1,a3
    dfdc:	01f00693          	li	a3,31
    dfe0:	4ef6c463          	blt	a3,a5,e4c8 <__subdf3+0x584>
    dfe4:	02000693          	li	a3,32
    dfe8:	40f686b3          	sub	a3,a3,a5
    dfec:	00d59533          	sll	a0,a1,a3
    dff0:	00fed633          	srl	a2,t4,a5
    dff4:	00de96b3          	sll	a3,t4,a3
    dff8:	00c56533          	or	a0,a0,a2
    dffc:	00d036b3          	snez	a3,a3
    e000:	00f5d7b3          	srl	a5,a1,a5
    e004:	00d56533          	or	a0,a0,a3
    e008:	40f70733          	sub	a4,a4,a5
    e00c:	40a88533          	sub	a0,a7,a0
    e010:	00a8b633          	sltu	a2,a7,a0
    e014:	00050493          	mv	s1,a0
    e018:	40c70933          	sub	s2,a4,a2
    e01c:	00891793          	sll	a5,s2,0x8
    e020:	3407d863          	bgez	a5,e370 <__subdf3+0x42c>
    e024:	008007b7          	lui	a5,0x800
    e028:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    e02c:	00f97933          	and	s2,s2,a5
    e030:	2e090663          	beqz	s2,e31c <__subdf3+0x3d8>
    e034:	00090513          	mv	a0,s2
    e038:	7b5000ef          	jal	efec <__clzsi2>
    e03c:	ff850793          	add	a5,a0,-8
    e040:	02000693          	li	a3,32
    e044:	40f68733          	sub	a4,a3,a5
    e048:	00e4d733          	srl	a4,s1,a4
    e04c:	00f91933          	sll	s2,s2,a5
    e050:	01276733          	or	a4,a4,s2
    e054:	00f494b3          	sll	s1,s1,a5
    e058:	3f37c463          	blt	a5,s3,e440 <__subdf3+0x4fc>
    e05c:	413787b3          	sub	a5,a5,s3
    e060:	00178793          	add	a5,a5,1
    e064:	40f686b3          	sub	a3,a3,a5
    e068:	00d49633          	sll	a2,s1,a3
    e06c:	00f4d933          	srl	s2,s1,a5
    e070:	00c03633          	snez	a2,a2
    e074:	00c96633          	or	a2,s2,a2
    e078:	00d716b3          	sll	a3,a4,a3
    e07c:	00c6e4b3          	or	s1,a3,a2
    e080:	00f75933          	srl	s2,a4,a5
    e084:	00000993          	li	s3,0
    e088:	0074f793          	and	a5,s1,7
    e08c:	02078063          	beqz	a5,e0ac <__subdf3+0x168>
    e090:	00f4f793          	and	a5,s1,15
    e094:	00400713          	li	a4,4
    e098:	00e78a63          	beq	a5,a4,e0ac <__subdf3+0x168>
    e09c:	00448793          	add	a5,s1,4
    e0a0:	0097b533          	sltu	a0,a5,s1
    e0a4:	00a90933          	add	s2,s2,a0
    e0a8:	00078493          	mv	s1,a5
    e0ac:	00891793          	sll	a5,s2,0x8
    e0b0:	6c07d063          	bgez	a5,e770 <__subdf3+0x82c>
    e0b4:	00198793          	add	a5,s3,1
    e0b8:	7ff00713          	li	a4,2047
    e0bc:	24e78663          	beq	a5,a4,e308 <__subdf3+0x3c4>
    e0c0:	ff800737          	lui	a4,0xff800
    e0c4:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0c8:	00e97733          	and	a4,s2,a4
    e0cc:	7ff7f793          	and	a5,a5,2047
    e0d0:	01d71813          	sll	a6,a4,0x1d
    e0d4:	0034d513          	srl	a0,s1,0x3
    e0d8:	00971713          	sll	a4,a4,0x9
    e0dc:	00a86833          	or	a6,a6,a0
    e0e0:	00c75713          	srl	a4,a4,0xc
    e0e4:	00147e13          	and	t3,s0,1
    e0e8:	01c12083          	lw	ra,28(sp)
    e0ec:	01812403          	lw	s0,24(sp)
    e0f0:	01479793          	sll	a5,a5,0x14
    e0f4:	00e7e7b3          	or	a5,a5,a4
    e0f8:	01fe1713          	sll	a4,t3,0x1f
    e0fc:	00e7e7b3          	or	a5,a5,a4
    e100:	01412483          	lw	s1,20(sp)
    e104:	01012903          	lw	s2,16(sp)
    e108:	00c12983          	lw	s3,12(sp)
    e10c:	00080513          	mv	a0,a6
    e110:	00078593          	mv	a1,a5
    e114:	02010113          	add	sp,sp,32
    e118:	00008067          	ret
    e11c:	70f05263          	blez	a5,e820 <__subdf3+0x8dc>
    e120:	1c0f1663          	bnez	t5,e2ec <__subdf3+0x3a8>
    e124:	01d5e6b3          	or	a3,a1,t4
    e128:	26068e63          	beqz	a3,e3a4 <__subdf3+0x460>
    e12c:	fff78693          	add	a3,a5,-1
    e130:	46068863          	beqz	a3,e5a0 <__subdf3+0x65c>
    e134:	24678c63          	beq	a5,t1,e38c <__subdf3+0x448>
    e138:	03800793          	li	a5,56
    e13c:	00100913          	li	s2,1
    e140:	02d7cc63          	blt	a5,a3,e178 <__subdf3+0x234>
    e144:	00068793          	mv	a5,a3
    e148:	01f00693          	li	a3,31
    e14c:	48f6ca63          	blt	a3,a5,e5e0 <__subdf3+0x69c>
    e150:	02000693          	li	a3,32
    e154:	40f686b3          	sub	a3,a3,a5
    e158:	00d59933          	sll	s2,a1,a3
    e15c:	00fed633          	srl	a2,t4,a5
    e160:	00de96b3          	sll	a3,t4,a3
    e164:	00c96933          	or	s2,s2,a2
    e168:	00d036b3          	snez	a3,a3
    e16c:	00f5d7b3          	srl	a5,a1,a5
    e170:	00d96933          	or	s2,s2,a3
    e174:	00f70733          	add	a4,a4,a5
    e178:	01190633          	add	a2,s2,a7
    e17c:	01263933          	sltu	s2,a2,s2
    e180:	00060493          	mv	s1,a2
    e184:	00e90933          	add	s2,s2,a4
    e188:	00891793          	sll	a5,s2,0x8
    e18c:	1e07d263          	bgez	a5,e370 <__subdf3+0x42c>
    e190:	00198993          	add	s3,s3,1
    e194:	7ff00793          	li	a5,2047
    e198:	16f98863          	beq	s3,a5,e308 <__subdf3+0x3c4>
    e19c:	ff8007b7          	lui	a5,0xff800
    e1a0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1a4:	0014f513          	and	a0,s1,1
    e1a8:	00f977b3          	and	a5,s2,a5
    e1ac:	0014d713          	srl	a4,s1,0x1
    e1b0:	00a76733          	or	a4,a4,a0
    e1b4:	01f79513          	sll	a0,a5,0x1f
    e1b8:	00e564b3          	or	s1,a0,a4
    e1bc:	0017d913          	srl	s2,a5,0x1
    e1c0:	ec9ff06f          	j	e088 <__subdf3+0x144>
    e1c4:	01d5e833          	or	a6,a1,t4
    e1c8:	80198313          	add	t1,s3,-2047
    e1cc:	06080863          	beqz	a6,e23c <__subdf3+0x2f8>
    e1d0:	06d40a63          	beq	s0,a3,e244 <__subdf3+0x300>
    e1d4:	0e030463          	beqz	t1,e2bc <__subdf3+0x378>
    e1d8:	26098e63          	beqz	s3,e454 <__subdf3+0x510>
    e1dc:	00361513          	sll	a0,a2,0x3
    e1e0:	00355513          	srl	a0,a0,0x3
    e1e4:	00068413          	mv	s0,a3
    e1e8:	00058713          	mv	a4,a1
    e1ec:	01d71813          	sll	a6,a4,0x1d
    e1f0:	00a86833          	or	a6,a6,a0
    e1f4:	00375713          	srl	a4,a4,0x3
    e1f8:	01076733          	or	a4,a4,a6
    e1fc:	10070663          	beqz	a4,e308 <__subdf3+0x3c4>
    e200:	00000e13          	li	t3,0
    e204:	7ff00793          	li	a5,2047
    e208:	00080737          	lui	a4,0x80
    e20c:	00000813          	li	a6,0
    e210:	ed9ff06f          	j	e0e8 <__subdf3+0x1a4>
    e214:	01d5e6b3          	or	a3,a1,t4
    e218:	18068663          	beqz	a3,e3a4 <__subdf3+0x460>
    e21c:	fff78693          	add	a3,a5,-1
    e220:	3a068263          	beqz	a3,e5c4 <__subdf3+0x680>
    e224:	16678463          	beq	a5,t1,e38c <__subdf3+0x448>
    e228:	03800793          	li	a5,56
    e22c:	00100513          	li	a0,1
    e230:	dcd7cee3          	blt	a5,a3,e00c <__subdf3+0xc8>
    e234:	00068793          	mv	a5,a3
    e238:	da5ff06f          	j	dfdc <__subdf3+0x98>
    e23c:	0016c693          	xor	a3,a3,1
    e240:	f8d41ae3          	bne	s0,a3,e1d4 <__subdf3+0x290>
    e244:	18030863          	beqz	t1,e3d4 <__subdf3+0x490>
    e248:	2c099063          	bnez	s3,e508 <__subdf3+0x5c4>
    e24c:	7ff00793          	li	a5,2047
    e250:	011766b3          	or	a3,a4,a7
    e254:	48068863          	beqz	a3,e6e4 <__subdf3+0x7a0>
    e258:	fff78693          	add	a3,a5,-1
    e25c:	34068263          	beqz	a3,e5a0 <__subdf3+0x65c>
    e260:	7ff00513          	li	a0,2047
    e264:	2aa78263          	beq	a5,a0,e508 <__subdf3+0x5c4>
    e268:	03800793          	li	a5,56
    e26c:	00100913          	li	s2,1
    e270:	02d7ca63          	blt	a5,a3,e2a4 <__subdf3+0x360>
    e274:	01f00793          	li	a5,31
    e278:	4cd7c663          	blt	a5,a3,e744 <__subdf3+0x800>
    e27c:	02000793          	li	a5,32
    e280:	40d787b3          	sub	a5,a5,a3
    e284:	00f71933          	sll	s2,a4,a5
    e288:	00d8d633          	srl	a2,a7,a3
    e28c:	00f897b3          	sll	a5,a7,a5
    e290:	00c96933          	or	s2,s2,a2
    e294:	00f037b3          	snez	a5,a5
    e298:	00d756b3          	srl	a3,a4,a3
    e29c:	00f96933          	or	s2,s2,a5
    e2a0:	00d585b3          	add	a1,a1,a3
    e2a4:	01d90733          	add	a4,s2,t4
    e2a8:	01273933          	sltu	s2,a4,s2
    e2ac:	00070493          	mv	s1,a4
    e2b0:	00b90933          	add	s2,s2,a1
    e2b4:	000f0993          	mv	s3,t5
    e2b8:	ed1ff06f          	j	e188 <__subdf3+0x244>
    e2bc:	00198793          	add	a5,s3,1
    e2c0:	7fe7f793          	and	a5,a5,2046
    e2c4:	14079463          	bnez	a5,e40c <__subdf3+0x4c8>
    e2c8:	01d5e833          	or	a6,a1,t4
    e2cc:	011767b3          	or	a5,a4,a7
    e2d0:	2a099463          	bnez	s3,e578 <__subdf3+0x634>
    e2d4:	38078e63          	beqz	a5,e670 <__subdf3+0x72c>
    e2d8:	3c081063          	bnez	a6,e698 <__subdf3+0x754>
    e2dc:	00351513          	sll	a0,a0,0x3
    e2e0:	00355913          	srl	s2,a0,0x3
    e2e4:	00000793          	li	a5,0
    e2e8:	1140006f          	j	e3fc <__subdf3+0x4b8>
    e2ec:	0a698063          	beq	s3,t1,e38c <__subdf3+0x448>
    e2f0:	03800693          	li	a3,56
    e2f4:	00100913          	li	s2,1
    e2f8:	e8f6c0e3          	blt	a3,a5,e178 <__subdf3+0x234>
    e2fc:	008006b7          	lui	a3,0x800
    e300:	00d5e5b3          	or	a1,a1,a3
    e304:	e45ff06f          	j	e148 <__subdf3+0x204>
    e308:	00147e13          	and	t3,s0,1
    e30c:	7ff00793          	li	a5,2047
    e310:	00000713          	li	a4,0
    e314:	00000813          	li	a6,0
    e318:	dd1ff06f          	j	e0e8 <__subdf3+0x1a4>
    e31c:	00048513          	mv	a0,s1
    e320:	4cd000ef          	jal	efec <__clzsi2>
    e324:	01850793          	add	a5,a0,24
    e328:	01f00693          	li	a3,31
    e32c:	d0f6dae3          	bge	a3,a5,e040 <__subdf3+0xfc>
    e330:	ff850713          	add	a4,a0,-8
    e334:	00e49733          	sll	a4,s1,a4
    e338:	1b37ce63          	blt	a5,s3,e4f4 <__subdf3+0x5b0>
    e33c:	413789b3          	sub	s3,a5,s3
    e340:	00198793          	add	a5,s3,1
    e344:	42f6de63          	bge	a3,a5,e780 <__subdf3+0x83c>
    e348:	fe198993          	add	s3,s3,-31
    e34c:	02000693          	li	a3,32
    e350:	013754b3          	srl	s1,a4,s3
    e354:	00d78c63          	beq	a5,a3,e36c <__subdf3+0x428>
    e358:	04000693          	li	a3,64
    e35c:	40f687b3          	sub	a5,a3,a5
    e360:	00f71733          	sll	a4,a4,a5
    e364:	00e03733          	snez	a4,a4
    e368:	00e4e4b3          	or	s1,s1,a4
    e36c:	00000993          	li	s3,0
    e370:	0074f793          	and	a5,s1,7
    e374:	d0079ee3          	bnez	a5,e090 <__subdf3+0x14c>
    e378:	00098793          	mv	a5,s3
    e37c:	0034d513          	srl	a0,s1,0x3
    e380:	00090713          	mv	a4,s2
    e384:	0280006f          	j	e3ac <__subdf3+0x468>
    e388:	e6081ce3          	bnez	a6,e200 <__subdf3+0x2bc>
    e38c:	00351513          	sll	a0,a0,0x3
    e390:	01d71813          	sll	a6,a4,0x1d
    e394:	00355513          	srl	a0,a0,0x3
    e398:	00a86833          	or	a6,a6,a0
    e39c:	00375713          	srl	a4,a4,0x3
    e3a0:	e59ff06f          	j	e1f8 <__subdf3+0x2b4>
    e3a4:	00351513          	sll	a0,a0,0x3
    e3a8:	00355513          	srl	a0,a0,0x3
    e3ac:	01d71813          	sll	a6,a4,0x1d
    e3b0:	7ff00693          	li	a3,2047
    e3b4:	00a86833          	or	a6,a6,a0
    e3b8:	00375713          	srl	a4,a4,0x3
    e3bc:	e2d78ee3          	beq	a5,a3,e1f8 <__subdf3+0x2b4>
    e3c0:	00c71713          	sll	a4,a4,0xc
    e3c4:	00c75713          	srl	a4,a4,0xc
    e3c8:	7ff7f793          	and	a5,a5,2047
    e3cc:	00147e13          	and	t3,s0,1
    e3d0:	d19ff06f          	j	e0e8 <__subdf3+0x1a4>
    e3d4:	00198693          	add	a3,s3,1
    e3d8:	7fe6f793          	and	a5,a3,2046
    e3dc:	12079e63          	bnez	a5,e518 <__subdf3+0x5d4>
    e3e0:	011767b3          	or	a5,a4,a7
    e3e4:	24099a63          	bnez	s3,e638 <__subdf3+0x6f4>
    e3e8:	30078663          	beqz	a5,e6f4 <__subdf3+0x7b0>
    e3ec:	01d5e7b3          	or	a5,a1,t4
    e3f0:	30079a63          	bnez	a5,e704 <__subdf3+0x7c0>
    e3f4:	00351513          	sll	a0,a0,0x3
    e3f8:	00355913          	srl	s2,a0,0x3
    e3fc:	01d71813          	sll	a6,a4,0x1d
    e400:	01286833          	or	a6,a6,s2
    e404:	00375713          	srl	a4,a4,0x3
    e408:	fb9ff06f          	j	e3c0 <__subdf3+0x47c>
    e40c:	41d88833          	sub	a6,a7,t4
    e410:	0108b7b3          	sltu	a5,a7,a6
    e414:	40b70933          	sub	s2,a4,a1
    e418:	40f90933          	sub	s2,s2,a5
    e41c:	00891793          	sll	a5,s2,0x8
    e420:	00080493          	mv	s1,a6
    e424:	1207c263          	bltz	a5,e548 <__subdf3+0x604>
    e428:	01286833          	or	a6,a6,s2
    e42c:	c00812e3          	bnez	a6,e030 <__subdf3+0xec>
    e430:	00000e13          	li	t3,0
    e434:	00000793          	li	a5,0
    e438:	00000713          	li	a4,0
    e43c:	cadff06f          	j	e0e8 <__subdf3+0x1a4>
    e440:	ff800937          	lui	s2,0xff800
    e444:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e448:	40f989b3          	sub	s3,s3,a5
    e44c:	01277933          	and	s2,a4,s2
    e450:	c39ff06f          	j	e088 <__subdf3+0x144>
    e454:	7ff00793          	li	a5,2047
    e458:	01176533          	or	a0,a4,a7
    e45c:	10050463          	beqz	a0,e564 <__subdf3+0x620>
    e460:	fff78813          	add	a6,a5,-1
    e464:	1e080263          	beqz	a6,e648 <__subdf3+0x704>
    e468:	7ff00513          	li	a0,2047
    e46c:	d6a788e3          	beq	a5,a0,e1dc <__subdf3+0x298>
    e470:	03800793          	li	a5,56
    e474:	00068413          	mv	s0,a3
    e478:	00100513          	li	a0,1
    e47c:	0307ca63          	blt	a5,a6,e4b0 <__subdf3+0x56c>
    e480:	01f00793          	li	a5,31
    e484:	1907c463          	blt	a5,a6,e60c <__subdf3+0x6c8>
    e488:	02000793          	li	a5,32
    e48c:	410787b3          	sub	a5,a5,a6
    e490:	00f71533          	sll	a0,a4,a5
    e494:	0108d6b3          	srl	a3,a7,a6
    e498:	00f897b3          	sll	a5,a7,a5
    e49c:	00d56533          	or	a0,a0,a3
    e4a0:	00f037b3          	snez	a5,a5
    e4a4:	01075833          	srl	a6,a4,a6
    e4a8:	00f56533          	or	a0,a0,a5
    e4ac:	410585b3          	sub	a1,a1,a6
    e4b0:	40ae8533          	sub	a0,t4,a0
    e4b4:	00aeb733          	sltu	a4,t4,a0
    e4b8:	00050493          	mv	s1,a0
    e4bc:	40e58933          	sub	s2,a1,a4
    e4c0:	000f0993          	mv	s3,t5
    e4c4:	b59ff06f          	j	e01c <__subdf3+0xd8>
    e4c8:	fe078693          	add	a3,a5,-32
    e4cc:	02000613          	li	a2,32
    e4d0:	00d5d6b3          	srl	a3,a1,a3
    e4d4:	00c78a63          	beq	a5,a2,e4e8 <__subdf3+0x5a4>
    e4d8:	04000613          	li	a2,64
    e4dc:	40f607b3          	sub	a5,a2,a5
    e4e0:	00f597b3          	sll	a5,a1,a5
    e4e4:	00feeeb3          	or	t4,t4,a5
    e4e8:	01d03533          	snez	a0,t4
    e4ec:	00d56533          	or	a0,a0,a3
    e4f0:	b1dff06f          	j	e00c <__subdf3+0xc8>
    e4f4:	ff8006b7          	lui	a3,0xff800
    e4f8:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e4fc:	40f987b3          	sub	a5,s3,a5
    e500:	00d77733          	and	a4,a4,a3
    e504:	ef9ff06f          	j	e3fc <__subdf3+0x4b8>
    e508:	00361513          	sll	a0,a2,0x3
    e50c:	00355513          	srl	a0,a0,0x3
    e510:	00058713          	mv	a4,a1
    e514:	cd9ff06f          	j	e1ec <__subdf3+0x2a8>
    e518:	7ff00793          	li	a5,2047
    e51c:	def686e3          	beq	a3,a5,e308 <__subdf3+0x3c4>
    e520:	01d88eb3          	add	t4,a7,t4
    e524:	011eb633          	sltu	a2,t4,a7
    e528:	00b707b3          	add	a5,a4,a1
    e52c:	00c787b3          	add	a5,a5,a2
    e530:	01f79513          	sll	a0,a5,0x1f
    e534:	001ede93          	srl	t4,t4,0x1
    e538:	01d564b3          	or	s1,a0,t4
    e53c:	0017d913          	srl	s2,a5,0x1
    e540:	00068993          	mv	s3,a3
    e544:	b45ff06f          	j	e088 <__subdf3+0x144>
    e548:	411e8633          	sub	a2,t4,a7
    e54c:	40e587b3          	sub	a5,a1,a4
    e550:	00ceb733          	sltu	a4,t4,a2
    e554:	00060493          	mv	s1,a2
    e558:	40e78933          	sub	s2,a5,a4
    e55c:	00068413          	mv	s0,a3
    e560:	ad1ff06f          	j	e030 <__subdf3+0xec>
    e564:	00361613          	sll	a2,a2,0x3
    e568:	00365513          	srl	a0,a2,0x3
    e56c:	00068413          	mv	s0,a3
    e570:	00058713          	mv	a4,a1
    e574:	e39ff06f          	j	e3ac <__subdf3+0x468>
    e578:	e00798e3          	bnez	a5,e388 <__subdf3+0x444>
    e57c:	22080663          	beqz	a6,e7a8 <__subdf3+0x864>
    e580:	0035d713          	srl	a4,a1,0x3
    e584:	00361613          	sll	a2,a2,0x3
    e588:	01d59593          	sll	a1,a1,0x1d
    e58c:	00b76733          	or	a4,a4,a1
    e590:	00365613          	srl	a2,a2,0x3
    e594:	00c76733          	or	a4,a4,a2
    e598:	00068413          	mv	s0,a3
    e59c:	c61ff06f          	j	e1fc <__subdf3+0x2b8>
    e5a0:	01d88eb3          	add	t4,a7,t4
    e5a4:	00b705b3          	add	a1,a4,a1
    e5a8:	011eb633          	sltu	a2,t4,a7
    e5ac:	00c58933          	add	s2,a1,a2
    e5b0:	00891793          	sll	a5,s2,0x8
    e5b4:	000e8493          	mv	s1,t4
    e5b8:	0a07d863          	bgez	a5,e668 <__subdf3+0x724>
    e5bc:	00200993          	li	s3,2
    e5c0:	bddff06f          	j	e19c <__subdf3+0x258>
    e5c4:	41d88eb3          	sub	t4,a7,t4
    e5c8:	40b705b3          	sub	a1,a4,a1
    e5cc:	01d8b633          	sltu	a2,a7,t4
    e5d0:	000e8493          	mv	s1,t4
    e5d4:	40c58933          	sub	s2,a1,a2
    e5d8:	00100993          	li	s3,1
    e5dc:	a41ff06f          	j	e01c <__subdf3+0xd8>
    e5e0:	fe078693          	add	a3,a5,-32
    e5e4:	02000613          	li	a2,32
    e5e8:	00d5d6b3          	srl	a3,a1,a3
    e5ec:	00c78a63          	beq	a5,a2,e600 <__subdf3+0x6bc>
    e5f0:	04000613          	li	a2,64
    e5f4:	40f607b3          	sub	a5,a2,a5
    e5f8:	00f597b3          	sll	a5,a1,a5
    e5fc:	00feeeb3          	or	t4,t4,a5
    e600:	01d03933          	snez	s2,t4
    e604:	00d96933          	or	s2,s2,a3
    e608:	b71ff06f          	j	e178 <__subdf3+0x234>
    e60c:	fe080793          	add	a5,a6,-32
    e610:	02000693          	li	a3,32
    e614:	00f757b3          	srl	a5,a4,a5
    e618:	00d80a63          	beq	a6,a3,e62c <__subdf3+0x6e8>
    e61c:	04000693          	li	a3,64
    e620:	410686b3          	sub	a3,a3,a6
    e624:	00d71733          	sll	a4,a4,a3
    e628:	00e8e8b3          	or	a7,a7,a4
    e62c:	01103533          	snez	a0,a7
    e630:	00f56533          	or	a0,a0,a5
    e634:	e7dff06f          	j	e4b0 <__subdf3+0x56c>
    e638:	ec0788e3          	beqz	a5,e508 <__subdf3+0x5c4>
    e63c:	01d5eeb3          	or	t4,a1,t4
    e640:	bc0e90e3          	bnez	t4,e200 <__subdf3+0x2bc>
    e644:	d49ff06f          	j	e38c <__subdf3+0x448>
    e648:	411e8633          	sub	a2,t4,a7
    e64c:	40e585b3          	sub	a1,a1,a4
    e650:	00ceb733          	sltu	a4,t4,a2
    e654:	00060493          	mv	s1,a2
    e658:	40e58933          	sub	s2,a1,a4
    e65c:	00068413          	mv	s0,a3
    e660:	00100993          	li	s3,1
    e664:	9b9ff06f          	j	e01c <__subdf3+0xd8>
    e668:	00100793          	li	a5,1
    e66c:	d11ff06f          	j	e37c <__subdf3+0x438>
    e670:	dc0800e3          	beqz	a6,e430 <__subdf3+0x4ec>
    e674:	00361613          	sll	a2,a2,0x3
    e678:	00365793          	srl	a5,a2,0x3
    e67c:	01d59813          	sll	a6,a1,0x1d
    e680:	00959713          	sll	a4,a1,0x9
    e684:	00f86833          	or	a6,a6,a5
    e688:	00c75713          	srl	a4,a4,0xc
    e68c:	00068e13          	mv	t3,a3
    e690:	00000793          	li	a5,0
    e694:	a55ff06f          	j	e0e8 <__subdf3+0x1a4>
    e698:	41d88933          	sub	s2,a7,t4
    e69c:	0128b7b3          	sltu	a5,a7,s2
    e6a0:	40b70633          	sub	a2,a4,a1
    e6a4:	40f60633          	sub	a2,a2,a5
    e6a8:	00861793          	sll	a5,a2,0x8
    e6ac:	0e07d263          	bgez	a5,e790 <__subdf3+0x84c>
    e6b0:	411e8633          	sub	a2,t4,a7
    e6b4:	40e58733          	sub	a4,a1,a4
    e6b8:	00cebeb3          	sltu	t4,t4,a2
    e6bc:	41d70733          	sub	a4,a4,t4
    e6c0:	00871793          	sll	a5,a4,0x8
    e6c4:	00060493          	mv	s1,a2
    e6c8:	1207de63          	bgez	a5,e804 <__subdf3+0x8c0>
    e6cc:	ff8007b7          	lui	a5,0xff800
    e6d0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e6d4:	00f77733          	and	a4,a4,a5
    e6d8:	00068413          	mv	s0,a3
    e6dc:	00100793          	li	a5,1
    e6e0:	9f1ff06f          	j	e0d0 <__subdf3+0x18c>
    e6e4:	00361613          	sll	a2,a2,0x3
    e6e8:	00365513          	srl	a0,a2,0x3
    e6ec:	00058713          	mv	a4,a1
    e6f0:	cbdff06f          	j	e3ac <__subdf3+0x468>
    e6f4:	00361613          	sll	a2,a2,0x3
    e6f8:	00365913          	srl	s2,a2,0x3
    e6fc:	00058713          	mv	a4,a1
    e700:	cfdff06f          	j	e3fc <__subdf3+0x4b8>
    e704:	01d886b3          	add	a3,a7,t4
    e708:	00b707b3          	add	a5,a4,a1
    e70c:	0116b633          	sltu	a2,a3,a7
    e710:	00c787b3          	add	a5,a5,a2
    e714:	00879713          	sll	a4,a5,0x8
    e718:	0036d813          	srl	a6,a3,0x3
    e71c:	08075e63          	bgez	a4,e7b8 <__subdf3+0x874>
    e720:	ff800737          	lui	a4,0xff800
    e724:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e728:	00e7f7b3          	and	a5,a5,a4
    e72c:	01d79713          	sll	a4,a5,0x1d
    e730:	00979793          	sll	a5,a5,0x9
    e734:	01076833          	or	a6,a4,a6
    e738:	00c7d713          	srl	a4,a5,0xc
    e73c:	00100793          	li	a5,1
    e740:	9a9ff06f          	j	e0e8 <__subdf3+0x1a4>
    e744:	fe068793          	add	a5,a3,-32
    e748:	02000613          	li	a2,32
    e74c:	00f757b3          	srl	a5,a4,a5
    e750:	00c68a63          	beq	a3,a2,e764 <__subdf3+0x820>
    e754:	04000613          	li	a2,64
    e758:	40d606b3          	sub	a3,a2,a3
    e75c:	00d71733          	sll	a4,a4,a3
    e760:	00e8e8b3          	or	a7,a7,a4
    e764:	01103933          	snez	s2,a7
    e768:	00f96933          	or	s2,s2,a5
    e76c:	b39ff06f          	j	e2a4 <__subdf3+0x360>
    e770:	0034d513          	srl	a0,s1,0x3
    e774:	00098793          	mv	a5,s3
    e778:	00090713          	mv	a4,s2
    e77c:	c31ff06f          	j	e3ac <__subdf3+0x468>
    e780:	02000693          	li	a3,32
    e784:	40f686b3          	sub	a3,a3,a5
    e788:	00000613          	li	a2,0
    e78c:	8e9ff06f          	j	e074 <__subdf3+0x130>
    e790:	00c96833          	or	a6,s2,a2
    e794:	c8080ee3          	beqz	a6,e430 <__subdf3+0x4ec>
    e798:	00395913          	srl	s2,s2,0x3
    e79c:	00000793          	li	a5,0
    e7a0:	00060713          	mv	a4,a2
    e7a4:	c59ff06f          	j	e3fc <__subdf3+0x4b8>
    e7a8:	00000e13          	li	t3,0
    e7ac:	7ff00793          	li	a5,2047
    e7b0:	00080737          	lui	a4,0x80
    e7b4:	935ff06f          	j	e0e8 <__subdf3+0x1a4>
    e7b8:	01d79713          	sll	a4,a5,0x1d
    e7bc:	00979793          	sll	a5,a5,0x9
    e7c0:	01076833          	or	a6,a4,a6
    e7c4:	00c7d713          	srl	a4,a5,0xc
    e7c8:	00000793          	li	a5,0
    e7cc:	91dff06f          	j	e0e8 <__subdf3+0x1a4>
    e7d0:	ae0786e3          	beqz	a5,e2bc <__subdf3+0x378>
    e7d4:	413f0833          	sub	a6,t5,s3
    e7d8:	00080793          	mv	a5,a6
    e7dc:	c6098ee3          	beqz	s3,e458 <__subdf3+0x514>
    e7e0:	03800793          	li	a5,56
    e7e4:	0107ca63          	blt	a5,a6,e7f8 <__subdf3+0x8b4>
    e7e8:	008007b7          	lui	a5,0x800
    e7ec:	00f76733          	or	a4,a4,a5
    e7f0:	00068413          	mv	s0,a3
    e7f4:	c8dff06f          	j	e480 <__subdf3+0x53c>
    e7f8:	00068413          	mv	s0,a3
    e7fc:	00100513          	li	a0,1
    e800:	cb1ff06f          	j	e4b0 <__subdf3+0x56c>
    e804:	01d71813          	sll	a6,a4,0x1d
    e808:	00365613          	srl	a2,a2,0x3
    e80c:	00c86833          	or	a6,a6,a2
    e810:	00375713          	srl	a4,a4,0x3
    e814:	00000793          	li	a5,0
    e818:	00068413          	mv	s0,a3
    e81c:	ba5ff06f          	j	e3c0 <__subdf3+0x47c>
    e820:	ba078ae3          	beqz	a5,e3d4 <__subdf3+0x490>
    e824:	413f06b3          	sub	a3,t5,s3
    e828:	00099663          	bnez	s3,e834 <__subdf3+0x8f0>
    e82c:	00068793          	mv	a5,a3
    e830:	a21ff06f          	j	e250 <__subdf3+0x30c>
    e834:	03800793          	li	a5,56
    e838:	00100913          	li	s2,1
    e83c:	a6d7c4e3          	blt	a5,a3,e2a4 <__subdf3+0x360>
    e840:	008007b7          	lui	a5,0x800
    e844:	00f76733          	or	a4,a4,a5
    e848:	a2dff06f          	j	e274 <__subdf3+0x330>

0000e84c <__unorddf2>:
    e84c:	0145d713          	srl	a4,a1,0x14
    e850:	001007b7          	lui	a5,0x100
    e854:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e858:	fff74713          	not	a4,a4
    e85c:	0146d813          	srl	a6,a3,0x14
    e860:	00b7f5b3          	and	a1,a5,a1
    e864:	00d7f7b3          	and	a5,a5,a3
    e868:	01571693          	sll	a3,a4,0x15
    e86c:	7ff87813          	and	a6,a6,2047
    e870:	02068063          	beqz	a3,e890 <__unorddf2+0x44>
    e874:	7ff00713          	li	a4,2047
    e878:	00000513          	li	a0,0
    e87c:	00e80463          	beq	a6,a4,e884 <__unorddf2+0x38>
    e880:	00008067          	ret
    e884:	00c7e7b3          	or	a5,a5,a2
    e888:	00f03533          	snez	a0,a5
    e88c:	00008067          	ret
    e890:	00a5e5b3          	or	a1,a1,a0
    e894:	00100513          	li	a0,1
    e898:	fc058ee3          	beqz	a1,e874 <__unorddf2+0x28>
    e89c:	00008067          	ret

0000e8a0 <__fixdfsi>:
    e8a0:	0145d793          	srl	a5,a1,0x14
    e8a4:	001006b7          	lui	a3,0x100
    e8a8:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e8ac:	7ff7f793          	and	a5,a5,2047
    e8b0:	3fe00613          	li	a2,1022
    e8b4:	00b77733          	and	a4,a4,a1
    e8b8:	01f5d593          	srl	a1,a1,0x1f
    e8bc:	00f65e63          	bge	a2,a5,e8d8 <__fixdfsi+0x38>
    e8c0:	41d00613          	li	a2,1053
    e8c4:	00f65e63          	bge	a2,a5,e8e0 <__fixdfsi+0x40>
    e8c8:	80000537          	lui	a0,0x80000
    e8cc:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e8d0:	00a58533          	add	a0,a1,a0
    e8d4:	00008067          	ret
    e8d8:	00000513          	li	a0,0
    e8dc:	00008067          	ret
    e8e0:	43300613          	li	a2,1075
    e8e4:	40f60633          	sub	a2,a2,a5
    e8e8:	01f00813          	li	a6,31
    e8ec:	00d76733          	or	a4,a4,a3
    e8f0:	02c85063          	bge	a6,a2,e910 <__fixdfsi+0x70>
    e8f4:	41300693          	li	a3,1043
    e8f8:	40f687b3          	sub	a5,a3,a5
    e8fc:	00f75733          	srl	a4,a4,a5
    e900:	40e00533          	neg	a0,a4
    e904:	fc059ce3          	bnez	a1,e8dc <__fixdfsi+0x3c>
    e908:	00070513          	mv	a0,a4
    e90c:	00008067          	ret
    e910:	bed78793          	add	a5,a5,-1043
    e914:	00f71733          	sll	a4,a4,a5
    e918:	00c55533          	srl	a0,a0,a2
    e91c:	00a76733          	or	a4,a4,a0
    e920:	fe1ff06f          	j	e900 <__fixdfsi+0x60>

0000e924 <__floatsidf>:
    e924:	ff010113          	add	sp,sp,-16
    e928:	00112623          	sw	ra,12(sp)
    e92c:	00812423          	sw	s0,8(sp)
    e930:	00912223          	sw	s1,4(sp)
    e934:	04050a63          	beqz	a0,e988 <__floatsidf+0x64>
    e938:	41f55713          	sra	a4,a0,0x1f
    e93c:	00a744b3          	xor	s1,a4,a0
    e940:	40e484b3          	sub	s1,s1,a4
    e944:	00050793          	mv	a5,a0
    e948:	00048513          	mv	a0,s1
    e94c:	01f7d413          	srl	s0,a5,0x1f
    e950:	69c000ef          	jal	efec <__clzsi2>
    e954:	41e00793          	li	a5,1054
    e958:	40a787b3          	sub	a5,a5,a0
    e95c:	00a00713          	li	a4,10
    e960:	7ff7f793          	and	a5,a5,2047
    e964:	06a74063          	blt	a4,a0,e9c4 <__floatsidf+0xa0>
    e968:	00b00713          	li	a4,11
    e96c:	40a70733          	sub	a4,a4,a0
    e970:	00e4d733          	srl	a4,s1,a4
    e974:	01550513          	add	a0,a0,21
    e978:	00c71713          	sll	a4,a4,0xc
    e97c:	00a494b3          	sll	s1,s1,a0
    e980:	00c75713          	srl	a4,a4,0xc
    e984:	0140006f          	j	e998 <__floatsidf+0x74>
    e988:	00000413          	li	s0,0
    e98c:	00000793          	li	a5,0
    e990:	00000713          	li	a4,0
    e994:	00000493          	li	s1,0
    e998:	01479793          	sll	a5,a5,0x14
    e99c:	01f41413          	sll	s0,s0,0x1f
    e9a0:	00e7e7b3          	or	a5,a5,a4
    e9a4:	00c12083          	lw	ra,12(sp)
    e9a8:	0087e7b3          	or	a5,a5,s0
    e9ac:	00812403          	lw	s0,8(sp)
    e9b0:	00048513          	mv	a0,s1
    e9b4:	00078593          	mv	a1,a5
    e9b8:	00412483          	lw	s1,4(sp)
    e9bc:	01010113          	add	sp,sp,16
    e9c0:	00008067          	ret
    e9c4:	ff550513          	add	a0,a0,-11
    e9c8:	00a49733          	sll	a4,s1,a0
    e9cc:	00c71713          	sll	a4,a4,0xc
    e9d0:	00c75713          	srl	a4,a4,0xc
    e9d4:	00000493          	li	s1,0
    e9d8:	fc1ff06f          	j	e998 <__floatsidf+0x74>

0000e9dc <__floatunsidf>:
    e9dc:	ff010113          	add	sp,sp,-16
    e9e0:	00812423          	sw	s0,8(sp)
    e9e4:	00112623          	sw	ra,12(sp)
    e9e8:	00050413          	mv	s0,a0
    e9ec:	04050c63          	beqz	a0,ea44 <__floatunsidf+0x68>
    e9f0:	5fc000ef          	jal	efec <__clzsi2>
    e9f4:	41e00793          	li	a5,1054
    e9f8:	40a787b3          	sub	a5,a5,a0
    e9fc:	00a00713          	li	a4,10
    ea00:	7ff7f793          	and	a5,a5,2047
    ea04:	06a74463          	blt	a4,a0,ea6c <__floatunsidf+0x90>
    ea08:	00b00713          	li	a4,11
    ea0c:	40a70733          	sub	a4,a4,a0
    ea10:	01550513          	add	a0,a0,21
    ea14:	00e45733          	srl	a4,s0,a4
    ea18:	00a41433          	sll	s0,s0,a0
    ea1c:	00c12083          	lw	ra,12(sp)
    ea20:	00040513          	mv	a0,s0
    ea24:	00c71713          	sll	a4,a4,0xc
    ea28:	00812403          	lw	s0,8(sp)
    ea2c:	00c75713          	srl	a4,a4,0xc
    ea30:	01479793          	sll	a5,a5,0x14
    ea34:	00e7e7b3          	or	a5,a5,a4
    ea38:	00078593          	mv	a1,a5
    ea3c:	01010113          	add	sp,sp,16
    ea40:	00008067          	ret
    ea44:	00c12083          	lw	ra,12(sp)
    ea48:	00040513          	mv	a0,s0
    ea4c:	00000793          	li	a5,0
    ea50:	00812403          	lw	s0,8(sp)
    ea54:	00000713          	li	a4,0
    ea58:	01479793          	sll	a5,a5,0x14
    ea5c:	00e7e7b3          	or	a5,a5,a4
    ea60:	00078593          	mv	a1,a5
    ea64:	01010113          	add	sp,sp,16
    ea68:	00008067          	ret
    ea6c:	ff550513          	add	a0,a0,-11
    ea70:	00a41733          	sll	a4,s0,a0
    ea74:	00000413          	li	s0,0
    ea78:	00c12083          	lw	ra,12(sp)
    ea7c:	00040513          	mv	a0,s0
    ea80:	00c71713          	sll	a4,a4,0xc
    ea84:	00812403          	lw	s0,8(sp)
    ea88:	00c75713          	srl	a4,a4,0xc
    ea8c:	01479793          	sll	a5,a5,0x14
    ea90:	00e7e7b3          	or	a5,a5,a4
    ea94:	00078593          	mv	a1,a5
    ea98:	01010113          	add	sp,sp,16
    ea9c:	00008067          	ret

0000eaa0 <__trunctfdf2>:
    eaa0:	00c52583          	lw	a1,12(a0)
    eaa4:	00852783          	lw	a5,8(a0)
    eaa8:	00052803          	lw	a6,0(a0)
    eaac:	00452683          	lw	a3,4(a0)
    eab0:	01059613          	sll	a2,a1,0x10
    eab4:	fe010113          	add	sp,sp,-32
    eab8:	00159713          	sll	a4,a1,0x1
    eabc:	01065613          	srl	a2,a2,0x10
    eac0:	00f12423          	sw	a5,8(sp)
    eac4:	00b12623          	sw	a1,12(sp)
    eac8:	00f12c23          	sw	a5,24(sp)
    eacc:	01012023          	sw	a6,0(sp)
    ead0:	00d12223          	sw	a3,4(sp)
    ead4:	01012823          	sw	a6,16(sp)
    ead8:	00d12a23          	sw	a3,20(sp)
    eadc:	00c12e23          	sw	a2,28(sp)
    eae0:	01175713          	srl	a4,a4,0x11
    eae4:	01f5d593          	srl	a1,a1,0x1f
    eae8:	01010893          	add	a7,sp,16
    eaec:	01c10793          	add	a5,sp,28
    eaf0:	00361513          	sll	a0,a2,0x3
    eaf4:	ffc7a603          	lw	a2,-4(a5)
    eaf8:	ffc78793          	add	a5,a5,-4
    eafc:	01d65693          	srl	a3,a2,0x1d
    eb00:	00a6e6b3          	or	a3,a3,a0
    eb04:	00d7a223          	sw	a3,4(a5)
    eb08:	fef894e3          	bne	a7,a5,eaf0 <__trunctfdf2+0x50>
    eb0c:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    eb10:	00381813          	sll	a6,a6,0x3
    eb14:	01169613          	sll	a2,a3,0x11
    eb18:	01012823          	sw	a6,16(sp)
    eb1c:	01265613          	srl	a2,a2,0x12
    eb20:	04060263          	beqz	a2,eb64 <__trunctfdf2+0xc4>
    eb24:	ffffc6b7          	lui	a3,0xffffc
    eb28:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    eb2c:	00d70733          	add	a4,a4,a3
    eb30:	7fe00693          	li	a3,2046
    eb34:	10e6d463          	bge	a3,a4,ec3c <__trunctfdf2+0x19c>
    eb38:	7ff00793          	li	a5,2047
    eb3c:	00000613          	li	a2,0
    eb40:	00000693          	li	a3,0
    eb44:	01479793          	sll	a5,a5,0x14
    eb48:	01f59593          	sll	a1,a1,0x1f
    eb4c:	00c7e7b3          	or	a5,a5,a2
    eb50:	00b7e7b3          	or	a5,a5,a1
    eb54:	00068513          	mv	a0,a3
    eb58:	00078593          	mv	a1,a5
    eb5c:	02010113          	add	sp,sp,32
    eb60:	00008067          	ret
    eb64:	01412603          	lw	a2,20(sp)
    eb68:	01812883          	lw	a7,24(sp)
    eb6c:	01c12503          	lw	a0,28(sp)
    eb70:	011666b3          	or	a3,a2,a7
    eb74:	00a6e6b3          	or	a3,a3,a0
    eb78:	0106e6b3          	or	a3,a3,a6
    eb7c:	04071463          	bnez	a4,ebc4 <__trunctfdf2+0x124>
    eb80:	14068263          	beqz	a3,ecc4 <__trunctfdf2+0x224>
    eb84:	00500693          	li	a3,5
    eb88:	00000613          	li	a2,0
    eb8c:	0036d793          	srl	a5,a3,0x3
    eb90:	01d61693          	sll	a3,a2,0x1d
    eb94:	00f6e6b3          	or	a3,a3,a5
    eb98:	00961613          	sll	a2,a2,0x9
    eb9c:	7ff77793          	and	a5,a4,2047
    eba0:	00c65613          	srl	a2,a2,0xc
    eba4:	01479793          	sll	a5,a5,0x14
    eba8:	01f59593          	sll	a1,a1,0x1f
    ebac:	00c7e7b3          	or	a5,a5,a2
    ebb0:	00b7e7b3          	or	a5,a5,a1
    ebb4:	00068513          	mv	a0,a3
    ebb8:	00078593          	mv	a1,a5
    ebbc:	02010113          	add	sp,sp,32
    ebc0:	00008067          	ret
    ebc4:	12068463          	beqz	a3,ecec <__trunctfdf2+0x24c>
    ebc8:	01c8d793          	srl	a5,a7,0x1c
    ebcc:	00451513          	sll	a0,a0,0x4
    ebd0:	00a7e7b3          	or	a5,a5,a0
    ebd4:	008006b7          	lui	a3,0x800
    ebd8:	00d7f6b3          	and	a3,a5,a3
    ebdc:	1c068263          	beqz	a3,eda0 <__trunctfdf2+0x300>
    ebe0:	ff800737          	lui	a4,0xff800
    ebe4:	01c65693          	srl	a3,a2,0x1c
    ebe8:	00489893          	sll	a7,a7,0x4
    ebec:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ebf0:	00e7f633          	and	a2,a5,a4
    ebf4:	0116e6b3          	or	a3,a3,a7
    ebf8:	004007b7          	lui	a5,0x400
    ebfc:	00f66633          	or	a2,a2,a5
    ec00:	ff86f693          	and	a3,a3,-8
    ec04:	00000793          	li	a5,0
    ec08:	0036d713          	srl	a4,a3,0x3
    ec0c:	01d61693          	sll	a3,a2,0x1d
    ec10:	00961613          	sll	a2,a2,0x9
    ec14:	00c65613          	srl	a2,a2,0xc
    ec18:	01479793          	sll	a5,a5,0x14
    ec1c:	01f59593          	sll	a1,a1,0x1f
    ec20:	00c7e7b3          	or	a5,a5,a2
    ec24:	00e6e6b3          	or	a3,a3,a4
    ec28:	00b7e7b3          	or	a5,a5,a1
    ec2c:	00068513          	mv	a0,a3
    ec30:	00078593          	mv	a1,a5
    ec34:	02010113          	add	sp,sp,32
    ec38:	00008067          	ret
    ec3c:	0ce05c63          	blez	a4,ed14 <__trunctfdf2+0x274>
    ec40:	01412783          	lw	a5,20(sp)
    ec44:	01812503          	lw	a0,24(sp)
    ec48:	01c12603          	lw	a2,28(sp)
    ec4c:	00479693          	sll	a3,a5,0x4
    ec50:	0106e6b3          	or	a3,a3,a6
    ec54:	01c7d793          	srl	a5,a5,0x1c
    ec58:	00451813          	sll	a6,a0,0x4
    ec5c:	00461613          	sll	a2,a2,0x4
    ec60:	01c55513          	srl	a0,a0,0x1c
    ec64:	00d036b3          	snez	a3,a3
    ec68:	0107e7b3          	or	a5,a5,a6
    ec6c:	00a66633          	or	a2,a2,a0
    ec70:	00f6e6b3          	or	a3,a3,a5
    ec74:	0076f793          	and	a5,a3,7
    ec78:	02078063          	beqz	a5,ec98 <__trunctfdf2+0x1f8>
    ec7c:	00f6f793          	and	a5,a3,15
    ec80:	00400513          	li	a0,4
    ec84:	00a78a63          	beq	a5,a0,ec98 <__trunctfdf2+0x1f8>
    ec88:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    ec8c:	00d7b6b3          	sltu	a3,a5,a3
    ec90:	00d60633          	add	a2,a2,a3
    ec94:	00078693          	mv	a3,a5
    ec98:	008007b7          	lui	a5,0x800
    ec9c:	00f677b3          	and	a5,a2,a5
    eca0:	ee0786e3          	beqz	a5,eb8c <__trunctfdf2+0xec>
    eca4:	00170713          	add	a4,a4,1
    eca8:	7ff00793          	li	a5,2047
    ecac:	e8f706e3          	beq	a4,a5,eb38 <__trunctfdf2+0x98>
    ecb0:	ff8007b7          	lui	a5,0xff800
    ecb4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ecb8:	00f67633          	and	a2,a2,a5
    ecbc:	7ff77793          	and	a5,a4,2047
    ecc0:	f49ff06f          	j	ec08 <__trunctfdf2+0x168>
    ecc4:	00000793          	li	a5,0
    ecc8:	00000613          	li	a2,0
    eccc:	01479793          	sll	a5,a5,0x14
    ecd0:	01f59593          	sll	a1,a1,0x1f
    ecd4:	00c7e7b3          	or	a5,a5,a2
    ecd8:	00b7e7b3          	or	a5,a5,a1
    ecdc:	00068513          	mv	a0,a3
    ece0:	00078593          	mv	a1,a5
    ece4:	02010113          	add	sp,sp,32
    ece8:	00008067          	ret
    ecec:	7ff00793          	li	a5,2047
    ecf0:	00000613          	li	a2,0
    ecf4:	01479793          	sll	a5,a5,0x14
    ecf8:	01f59593          	sll	a1,a1,0x1f
    ecfc:	00c7e7b3          	or	a5,a5,a2
    ed00:	00b7e7b3          	or	a5,a5,a1
    ed04:	00068513          	mv	a0,a3
    ed08:	00078593          	mv	a1,a5
    ed0c:	02010113          	add	sp,sp,32
    ed10:	00008067          	ret
    ed14:	fcc00693          	li	a3,-52
    ed18:	08d74c63          	blt	a4,a3,edb0 <__trunctfdf2+0x310>
    ed1c:	03d00693          	li	a3,61
    ed20:	40e686b3          	sub	a3,a3,a4
    ed24:	01c12703          	lw	a4,28(sp)
    ed28:	4056de13          	sra	t3,a3,0x5
    ed2c:	00080eb7          	lui	t4,0x80
    ed30:	00eeeeb3          	or	t4,t4,a4
    ed34:	002e1513          	sll	a0,t3,0x2
    ed38:	01d12e23          	sw	t4,28(sp)
    ed3c:	01f6f693          	and	a3,a3,31
    ed40:	00a88833          	add	a6,a7,a0
    ed44:	00088613          	mv	a2,a7
    ed48:	00000713          	li	a4,0
    ed4c:	00062303          	lw	t1,0(a2)
    ed50:	00460613          	add	a2,a2,4
    ed54:	00676733          	or	a4,a4,t1
    ed58:	fec81ae3          	bne	a6,a2,ed4c <__trunctfdf2+0x2ac>
    ed5c:	00300613          	li	a2,3
    ed60:	41c60633          	sub	a2,a2,t3
    ed64:	04069a63          	bnez	a3,edb8 <__trunctfdf2+0x318>
    ed68:	00082803          	lw	a6,0(a6)
    ed6c:	00168693          	add	a3,a3,1
    ed70:	00478793          	add	a5,a5,4
    ed74:	ff07ae23          	sw	a6,-4(a5)
    ed78:	00d64e63          	blt	a2,a3,ed94 <__trunctfdf2+0x2f4>
    ed7c:	00a78833          	add	a6,a5,a0
    ed80:	00082803          	lw	a6,0(a6)
    ed84:	00168693          	add	a3,a3,1
    ed88:	00478793          	add	a5,a5,4
    ed8c:	ff07ae23          	sw	a6,-4(a5)
    ed90:	fed656e3          	bge	a2,a3,ed7c <__trunctfdf2+0x2dc>
    ed94:	00400793          	li	a5,4
    ed98:	41c787b3          	sub	a5,a5,t3
    ed9c:	0840006f          	j	ee20 <__trunctfdf2+0x380>
    eda0:	00000593          	li	a1,0
    eda4:	7ff00793          	li	a5,2047
    eda8:	00080637          	lui	a2,0x80
    edac:	d99ff06f          	j	eb44 <__trunctfdf2+0xa4>
    edb0:	00000713          	li	a4,0
    edb4:	dd1ff06f          	j	eb84 <__trunctfdf2+0xe4>
    edb8:	02050813          	add	a6,a0,32
    edbc:	00280833          	add	a6,a6,sp
    edc0:	ff082803          	lw	a6,-16(a6)
    edc4:	02000f13          	li	t5,32
    edc8:	40df0f33          	sub	t5,t5,a3
    edcc:	01e81833          	sll	a6,a6,t5
    edd0:	01076733          	or	a4,a4,a6
    edd4:	08060e63          	beqz	a2,ee70 <__trunctfdf2+0x3d0>
    edd8:	00261813          	sll	a6,a2,0x2
    eddc:	00f80fb3          	add	t6,a6,a5
    ede0:	00a88633          	add	a2,a7,a0
    ede4:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ede8:	00462303          	lw	t1,4(a2)
    edec:	00478793          	add	a5,a5,4
    edf0:	00d55533          	srl	a0,a0,a3
    edf4:	01e31333          	sll	t1,t1,t5
    edf8:	00656533          	or	a0,a0,t1
    edfc:	fea7ae23          	sw	a0,-4(a5)
    ee00:	00460613          	add	a2,a2,4
    ee04:	feff90e3          	bne	t6,a5,ede4 <__trunctfdf2+0x344>
    ee08:	00400793          	li	a5,4
    ee0c:	41c787b3          	sub	a5,a5,t3
    ee10:	02080613          	add	a2,a6,32
    ee14:	00260633          	add	a2,a2,sp
    ee18:	00dedeb3          	srl	t4,t4,a3
    ee1c:	ffd62823          	sw	t4,-16(a2)
    ee20:	00400693          	li	a3,4
    ee24:	40f686b3          	sub	a3,a3,a5
    ee28:	00269693          	sll	a3,a3,0x2
    ee2c:	00279793          	sll	a5,a5,0x2
    ee30:	00800613          	li	a2,8
    ee34:	00f888b3          	add	a7,a7,a5
    ee38:	00c6ea63          	bltu	a3,a2,ee4c <__trunctfdf2+0x3ac>
    ee3c:	0008a023          	sw	zero,0(a7)
    ee40:	0008a223          	sw	zero,4(a7)
    ee44:	ff868693          	add	a3,a3,-8
    ee48:	00888893          	add	a7,a7,8
    ee4c:	00400793          	li	a5,4
    ee50:	00f6e463          	bltu	a3,a5,ee58 <__trunctfdf2+0x3b8>
    ee54:	0008a023          	sw	zero,0(a7)
    ee58:	01012783          	lw	a5,16(sp)
    ee5c:	00e03733          	snez	a4,a4
    ee60:	01412603          	lw	a2,20(sp)
    ee64:	00f766b3          	or	a3,a4,a5
    ee68:	00000713          	li	a4,0
    ee6c:	e09ff06f          	j	ec74 <__trunctfdf2+0x1d4>
    ee70:	00100793          	li	a5,1
    ee74:	00000813          	li	a6,0
    ee78:	f99ff06f          	j	ee10 <__trunctfdf2+0x370>

0000ee7c <__mulsi3>:
    ee7c:	00050613          	mv	a2,a0
    ee80:	00000513          	li	a0,0
    ee84:	0015f693          	and	a3,a1,1
    ee88:	00068463          	beqz	a3,ee90 <__mulsi3+0x14>
    ee8c:	00c50533          	add	a0,a0,a2
    ee90:	0015d593          	srl	a1,a1,0x1
    ee94:	00161613          	sll	a2,a2,0x1
    ee98:	fe0596e3          	bnez	a1,ee84 <__mulsi3+0x8>
    ee9c:	00008067          	ret

0000eea0 <__muldi3>:
    eea0:	ff010113          	add	sp,sp,-16
    eea4:	00812423          	sw	s0,8(sp)
    eea8:	00050413          	mv	s0,a0
    eeac:	00112623          	sw	ra,12(sp)
    eeb0:	00060513          	mv	a0,a2
    eeb4:	00068393          	mv	t2,a3
    eeb8:	00040713          	mv	a4,s0
    eebc:	00060813          	mv	a6,a2
    eec0:	00000793          	li	a5,0
    eec4:	00000313          	li	t1,0
    eec8:	00000f13          	li	t5,0
    eecc:	01e708b3          	add	a7,a4,t5
    eed0:	00187e93          	and	t4,a6,1
    eed4:	00f30fb3          	add	t6,t1,a5
    eed8:	01f75e13          	srl	t3,a4,0x1f
    eedc:	00185813          	srl	a6,a6,0x1
    eee0:	00e8b2b3          	sltu	t0,a7,a4
    eee4:	00179793          	sll	a5,a5,0x1
    eee8:	000e8663          	beqz	t4,eef4 <__muldi3+0x54>
    eeec:	00088f13          	mv	t5,a7
    eef0:	01f28333          	add	t1,t0,t6
    eef4:	00171713          	sll	a4,a4,0x1
    eef8:	01c7e7b3          	or	a5,a5,t3
    eefc:	fc0818e3          	bnez	a6,eecc <__muldi3+0x2c>
    ef00:	00058663          	beqz	a1,ef0c <__muldi3+0x6c>
    ef04:	f79ff0ef          	jal	ee7c <__mulsi3>
    ef08:	00650333          	add	t1,a0,t1
    ef0c:	00038a63          	beqz	t2,ef20 <__muldi3+0x80>
    ef10:	00040513          	mv	a0,s0
    ef14:	00038593          	mv	a1,t2
    ef18:	f65ff0ef          	jal	ee7c <__mulsi3>
    ef1c:	00650333          	add	t1,a0,t1
    ef20:	00c12083          	lw	ra,12(sp)
    ef24:	00812403          	lw	s0,8(sp)
    ef28:	000f0513          	mv	a0,t5
    ef2c:	00030593          	mv	a1,t1
    ef30:	01010113          	add	sp,sp,16
    ef34:	00008067          	ret

0000ef38 <__divsi3>:
    ef38:	06054063          	bltz	a0,ef98 <__umodsi3+0x10>
    ef3c:	0605c663          	bltz	a1,efa8 <__umodsi3+0x20>

0000ef40 <__hidden___udivsi3>:
    ef40:	00058613          	mv	a2,a1
    ef44:	00050593          	mv	a1,a0
    ef48:	fff00513          	li	a0,-1
    ef4c:	02060c63          	beqz	a2,ef84 <__hidden___udivsi3+0x44>
    ef50:	00100693          	li	a3,1
    ef54:	00b67a63          	bgeu	a2,a1,ef68 <__hidden___udivsi3+0x28>
    ef58:	00c05863          	blez	a2,ef68 <__hidden___udivsi3+0x28>
    ef5c:	00161613          	sll	a2,a2,0x1
    ef60:	00169693          	sll	a3,a3,0x1
    ef64:	feb66ae3          	bltu	a2,a1,ef58 <__hidden___udivsi3+0x18>
    ef68:	00000513          	li	a0,0
    ef6c:	00c5e663          	bltu	a1,a2,ef78 <__hidden___udivsi3+0x38>
    ef70:	40c585b3          	sub	a1,a1,a2
    ef74:	00d56533          	or	a0,a0,a3
    ef78:	0016d693          	srl	a3,a3,0x1
    ef7c:	00165613          	srl	a2,a2,0x1
    ef80:	fe0696e3          	bnez	a3,ef6c <__hidden___udivsi3+0x2c>
    ef84:	00008067          	ret

0000ef88 <__umodsi3>:
    ef88:	00008293          	mv	t0,ra
    ef8c:	fb5ff0ef          	jal	ef40 <__hidden___udivsi3>
    ef90:	00058513          	mv	a0,a1
    ef94:	00028067          	jr	t0
    ef98:	40a00533          	neg	a0,a0
    ef9c:	00b04863          	bgtz	a1,efac <__umodsi3+0x24>
    efa0:	40b005b3          	neg	a1,a1
    efa4:	f9dff06f          	j	ef40 <__hidden___udivsi3>
    efa8:	40b005b3          	neg	a1,a1
    efac:	00008293          	mv	t0,ra
    efb0:	f91ff0ef          	jal	ef40 <__hidden___udivsi3>
    efb4:	40a00533          	neg	a0,a0
    efb8:	00028067          	jr	t0

0000efbc <__modsi3>:
    efbc:	00008293          	mv	t0,ra
    efc0:	0005ca63          	bltz	a1,efd4 <__modsi3+0x18>
    efc4:	00054c63          	bltz	a0,efdc <__modsi3+0x20>
    efc8:	f79ff0ef          	jal	ef40 <__hidden___udivsi3>
    efcc:	00058513          	mv	a0,a1
    efd0:	00028067          	jr	t0
    efd4:	40b005b3          	neg	a1,a1
    efd8:	fe0558e3          	bgez	a0,efc8 <__modsi3+0xc>
    efdc:	40a00533          	neg	a0,a0
    efe0:	f61ff0ef          	jal	ef40 <__hidden___udivsi3>
    efe4:	40b00533          	neg	a0,a1
    efe8:	00028067          	jr	t0

0000efec <__clzsi2>:
    efec:	000107b7          	lui	a5,0x10
    eff0:	02f57a63          	bgeu	a0,a5,f024 <__clzsi2+0x38>
    eff4:	10053793          	sltiu	a5,a0,256
    eff8:	0017b793          	seqz	a5,a5
    effc:	00379793          	sll	a5,a5,0x3
    f000:	02000713          	li	a4,32
    f004:	40f70733          	sub	a4,a4,a5
    f008:	00f55533          	srl	a0,a0,a5
    f00c:	00001797          	auipc	a5,0x1
    f010:	ae478793          	add	a5,a5,-1308 # faf0 <__clz_tab>
    f014:	00a787b3          	add	a5,a5,a0
    f018:	0007c503          	lbu	a0,0(a5)
    f01c:	40a70533          	sub	a0,a4,a0
    f020:	00008067          	ret
    f024:	010007b7          	lui	a5,0x1000
    f028:	02f57463          	bgeu	a0,a5,f050 <__clzsi2+0x64>
    f02c:	01000793          	li	a5,16
    f030:	00f55533          	srl	a0,a0,a5
    f034:	00001797          	auipc	a5,0x1
    f038:	abc78793          	add	a5,a5,-1348 # faf0 <__clz_tab>
    f03c:	00a787b3          	add	a5,a5,a0
    f040:	0007c503          	lbu	a0,0(a5)
    f044:	01000713          	li	a4,16
    f048:	40a70533          	sub	a0,a4,a0
    f04c:	00008067          	ret
    f050:	01800793          	li	a5,24
    f054:	00f55533          	srl	a0,a0,a5
    f058:	00001797          	auipc	a5,0x1
    f05c:	a9878793          	add	a5,a5,-1384 # faf0 <__clz_tab>
    f060:	00a787b3          	add	a5,a5,a0
    f064:	0007c503          	lbu	a0,0(a5)
    f068:	00800713          	li	a4,8
    f06c:	40a70533          	sub	a0,a4,a0
    f070:	00008067          	ret
