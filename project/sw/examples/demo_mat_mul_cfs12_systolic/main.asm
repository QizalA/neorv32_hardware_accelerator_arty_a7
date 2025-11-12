
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x66c>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	0000f397          	auipc	t2,0xf
      38:	27c38393          	add	t2,t2,636 # f2b0 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	a4058593          	add	a1,a1,-1472 # 80000a94 <__crt0_bss_end>
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
     110:	83840413          	add	s0,s0,-1992 # e944 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	83048493          	add	s1,s1,-2000 # e944 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	12860613          	add	a2,a2,296 # 258 <main>

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
     174:	0000e417          	auipc	s0,0xe
     178:	7d040413          	add	s0,s0,2000 # e944 <__fini_array_end>
     17c:	0000e497          	auipc	s1,0xe
     180:	7c848493          	add	s1,s1,1992 # e944 <__fini_array_end>

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

000001e4 <print_i32_4x4>:
    cfs_step();
  }
}

/* Pretty-print 4x4 int32 matrix */
static void print_i32_4x4(const char* name, const int32_t M[4][4]) {
     1e4:	fe010113          	add	sp,sp,-32
     1e8:	00812c23          	sw	s0,24(sp)
     1ec:	00058413          	mv	s0,a1
  printf("%s:\n", name);
     1f0:	00050593          	mv	a1,a0
     1f4:	0000f537          	lui	a0,0xf
     1f8:	94850513          	add	a0,a0,-1720 # e948 <__fini_array_end+0x4>
static void print_i32_4x4(const char* name, const int32_t M[4][4]) {
     1fc:	01212823          	sw	s2,16(sp)
     200:	01312623          	sw	s3,12(sp)
     204:	00112e23          	sw	ra,28(sp)
     208:	00912a23          	sw	s1,20(sp)
     20c:	04040913          	add	s2,s0,64
  printf("%s:\n", name);
     210:	674000ef          	jal	884 <printf>
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      printf("%6ld ", (long)M[i][j]);
     214:	0000f9b7          	lui	s3,0xf
    for (int j = 0; j < 4; ++j) {
     218:	01040493          	add	s1,s0,16
      printf("%6ld ", (long)M[i][j]);
     21c:	00042583          	lw	a1,0(s0)
     220:	95098513          	add	a0,s3,-1712 # e950 <__fini_array_end+0xc>
    for (int j = 0; j < 4; ++j) {
     224:	00440413          	add	s0,s0,4
      printf("%6ld ", (long)M[i][j]);
     228:	65c000ef          	jal	884 <printf>
    for (int j = 0; j < 4; ++j) {
     22c:	fe9418e3          	bne	s0,s1,21c <print_i32_4x4+0x38>
    }
    printf("\n");
     230:	00a00513          	li	a0,10
     234:	6a0000ef          	jal	8d4 <putchar>
  for (int i = 0; i < 4; ++i) {
     238:	fe8910e3          	bne	s2,s0,218 <print_i32_4x4+0x34>
  }
}
     23c:	01c12083          	lw	ra,28(sp)
     240:	01812403          	lw	s0,24(sp)
     244:	01412483          	lw	s1,20(sp)
     248:	01012903          	lw	s2,16(sp)
     24c:	00c12983          	lw	s3,12(sp)
     250:	02010113          	add	sp,sp,32
     254:	00008067          	ret

00000258 <main>:
static inline uint32_t cfs_read(uint32_t off) { return CFS_REG(off); }
     258:	ffeb07b7          	lui	a5,0xffeb0
     25c:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
      B_flat[k*LDB + j] = clamp_s8(v);
    }
  }
}

int main(void) {
     260:	f3010113          	add	sp,sp,-208
  /* Sanity check the ID register */
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08lX (expect 0xCAFEBABE)\n", (unsigned long)id);
     264:	0000f537          	lui	a0,0xf
int main(void) {
     268:	0c912223          	sw	s1,196(sp)
     26c:	0d212023          	sw	s2,192(sp)
  printf("CFS ID = 0x%08lX (expect 0xCAFEBABE)\n", (unsigned long)id);
     270:	95850513          	add	a0,a0,-1704 # e958 <__fini_array_end+0x14>
     274:	800014b7          	lui	s1,0x80001
      A_flat[i*LDA + k] = clamp_s8(v);
     278:	80001937          	lui	s2,0x80001
int main(void) {
     27c:	0c812423          	sw	s0,200(sp)
     280:	0b712623          	sw	s7,172(sp)
     284:	0c112623          	sw	ra,204(sp)
     288:	0b312e23          	sw	s3,188(sp)
     28c:	0b412c23          	sw	s4,184(sp)
     290:	0b512a23          	sw	s5,180(sp)
     294:	0b612823          	sw	s6,176(sp)
     298:	0b812423          	sw	s8,168(sp)
     29c:	0b912223          	sw	s9,164(sp)
     2a0:	0ba12023          	sw	s10,160(sp)
     2a4:	09b12e23          	sw	s11,156(sp)
     2a8:	83c48493          	add	s1,s1,-1988 # 8000083c <A_flat.1+0x8>
  printf("CFS ID = 0x%08lX (expect 0xCAFEBABE)\n", (unsigned long)id);
     2ac:	5d8000ef          	jal	884 <printf>
  for (int i = 0; i < 4; ++i) {
     2b0:	00000413          	li	s0,0
      A_flat[i*LDA + k] = clamp_s8(v);
     2b4:	83490913          	add	s2,s2,-1996 # 80000834 <A_flat.1>
  for (int i = 0; i < 4; ++i) {
     2b8:	00400b93          	li	s7,4
      A_flat[i*LDA + k] = clamp_s8(v);
     2bc:	00641b13          	sll	s6,s0,0x6
     2c0:	00800a13          	li	s4,8
    for (int k = 0; k < K; ++k) {
     2c4:	00000993          	li	s3,0
      int v = (i + 1) * (k - 3);
     2c8:	00140413          	add	s0,s0,1
      A_flat[i*LDA + k] = clamp_s8(v);
     2cc:	013b0ab3          	add	s5,s6,s3
      int v = (i + 1) * (k - 3);
     2d0:	ffd98593          	add	a1,s3,-3
     2d4:	00040513          	mv	a0,s0
      A_flat[i*LDA + k] = clamp_s8(v);
     2d8:	012a8ab3          	add	s5,s5,s2
      int v = (i + 1) * (k - 3);
     2dc:	5080e0ef          	jal	e7e4 <__mulsi3>
  return (int8_t)v;
     2e0:	00aa8023          	sb	a0,0(s5)
    for (int k = 0; k < K; ++k) {
     2e4:	fffa0a13          	add	s4,s4,-1
     2e8:	00198993          	add	s3,s3,1
     2ec:	fe0a10e3          	bnez	s4,2cc <main+0x74>
      A_flat[i*LDA + k] = 0;
     2f0:	00048513          	mv	a0,s1
     2f4:	03800613          	li	a2,56
     2f8:	00000593          	li	a1,0
     2fc:	73c000ef          	jal	a38 <memset>
  for (int i = 0; i < 4; ++i) {
     300:	04048493          	add	s1,s1,64
     304:	fb741ce3          	bne	s0,s7,2bc <main+0x64>
      B_flat[k*LDB + j] = clamp_s8(v);
     308:	80000b37          	lui	s6,0x80000
  for (int k = 0; k < K; ++k) {
     30c:	00000413          	li	s0,0
      B_flat[k*LDB + j] = clamp_s8(v);
     310:	734b0a93          	add	s5,s6,1844 # 80000734 <B_flat.0>
      int v = (j - 2) * (5 - k);
     314:	00500c13          	li	s8,5
  for (int k = 0; k < K; ++k) {
     318:	00800d13          	li	s10,8
      B_flat[k*LDB + j] = clamp_s8(v);
     31c:	00241c93          	sll	s9,s0,0x2
     320:	00400993          	li	s3,4
    for (int j = 0; j < 4; ++j) {
     324:	00000493          	li	s1,0
      int v = (j - 2) * (5 - k);
     328:	408c0bb3          	sub	s7,s8,s0
      B_flat[k*LDB + j] = clamp_s8(v);
     32c:	009c8a33          	add	s4,s9,s1
      int v = (j - 2) * (5 - k);
     330:	ffe48513          	add	a0,s1,-2
     334:	000b8593          	mv	a1,s7
      B_flat[k*LDB + j] = clamp_s8(v);
     338:	015a0a33          	add	s4,s4,s5
      int v = (j - 2) * (5 - k);
     33c:	4a80e0ef          	jal	e7e4 <__mulsi3>
  return (int8_t)v;
     340:	00aa0023          	sb	a0,0(s4)
    for (int j = 0; j < 4; ++j) {
     344:	fff98993          	add	s3,s3,-1
     348:	00148493          	add	s1,s1,1
     34c:	fe0990e3          	bnez	s3,32c <main+0xd4>
  for (int k = 0; k < K; ++k) {
     350:	00140413          	add	s0,s0,1
     354:	fda414e3          	bne	s0,s10,31c <main+0xc4>
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     358:	ffeb07b7          	lui	a5,0xffeb0
     35c:	00200713          	li	a4,2
     360:	ffeb0fb7          	lui	t6,0xffeb0
     364:	ffeb0f37          	lui	t5,0xffeb0
     368:	ffeb0eb7          	lui	t4,0xffeb0
     36c:	ffeb0e37          	lui	t3,0xffeb0
     370:	ffeb0337          	lui	t1,0xffeb0
     374:	ffeb08b7          	lui	a7,0xffeb0
     378:	ffeb0837          	lui	a6,0xffeb0
     37c:	ffeb0537          	lui	a0,0xffeb0
     380:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
      if (k >= 0 && k < K)
     384:	00700293          	li	t0,7
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     388:	734b0713          	add	a4,s6,1844
  for (int t = 0; t < T; ++t) {
     38c:	00000793          	li	a5,0
    for (int i = 0; i < 4; ++i) {
     390:	00400393          	li	t2,4
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     394:	ffeb04b7          	lui	s1,0xffeb0
     398:	004f8f93          	add	t6,t6,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     39c:	008f0f13          	add	t5,t5,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     3a0:	00ce8e93          	add	t4,t4,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     3a4:	010e0e13          	add	t3,t3,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     3a8:	01430313          	add	t1,t1,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     3ac:	01888893          	add	a7,a7,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     3b0:	01c80813          	add	a6,a6,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     3b4:	02050513          	add	a0,a0,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     3b8:	00100993          	li	s3,1
  for (int t = 0; t < T; ++t) {
     3bc:	00e00413          	li	s0,14
    int8_t a_in[4] = {0,0,0,0};
     3c0:	00012823          	sw	zero,16(sp)
    int8_t b_in[4] = {0,0,0,0};
     3c4:	04012823          	sw	zero,80(sp)
    for (int i = 0; i < 4; ++i) {
     3c8:	00f90633          	add	a2,s2,a5
     3cc:	00000693          	li	a3,0
      if (k >= 0 && k < K)
     3d0:	40d785b3          	sub	a1,a5,a3
     3d4:	00b2ea63          	bltu	t0,a1,3e8 <main+0x190>
        a_in[i] = A_flat[i*LDA + k];
     3d8:	00064a03          	lbu	s4,0(a2)
     3dc:	01068593          	add	a1,a3,16
     3e0:	002585b3          	add	a1,a1,sp
     3e4:	01458023          	sb	s4,0(a1)
    for (int i = 0; i < 4; ++i) {
     3e8:	00168693          	add	a3,a3,1
     3ec:	03f60613          	add	a2,a2,63
     3f0:	fe7690e3          	bne	a3,t2,3d0 <main+0x178>
     3f4:	00070613          	mv	a2,a4
    for (int j = 0; j < 4; ++j) {
     3f8:	00000693          	li	a3,0
      if (k >= 0 && k < K)
     3fc:	40d785b3          	sub	a1,a5,a3
     400:	00b2ea63          	bltu	t0,a1,414 <main+0x1bc>
        b_in[j] = B_flat[k*LDB + j];
     404:	00064a03          	lbu	s4,0(a2)
     408:	05010593          	add	a1,sp,80
     40c:	00d585b3          	add	a1,a1,a3
     410:	01458023          	sb	s4,0(a1)
    for (int j = 0; j < 4; ++j) {
     414:	00168693          	add	a3,a3,1
     418:	ffd60613          	add	a2,a2,-3
     41c:	fe7690e3          	bne	a3,t2,3fc <main+0x1a4>
  return  ((uint32_t)(uint8_t)x0)        |
     420:	01014683          	lbu	a3,16(sp)
  for (int t = 0; t < T; ++t) {
     424:	00178793          	add	a5,a5,1
     428:	00470713          	add	a4,a4,4
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     42c:	00dfa023          	sw	a3,0(t6)
  return  ((uint32_t)(uint8_t)x0)        |
     430:	01114683          	lbu	a3,17(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     434:	00df2023          	sw	a3,0(t5)
  return  ((uint32_t)(uint8_t)x0)        |
     438:	01214683          	lbu	a3,18(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     43c:	00dea023          	sw	a3,0(t4)
  return  ((uint32_t)(uint8_t)x0)        |
     440:	01314683          	lbu	a3,19(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     444:	00de2023          	sw	a3,0(t3)
  return  ((uint32_t)(uint8_t)x0)        |
     448:	05014683          	lbu	a3,80(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     44c:	00d32023          	sw	a3,0(t1)
  return  ((uint32_t)(uint8_t)x0)        |
     450:	05114683          	lbu	a3,81(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     454:	00d8a023          	sw	a3,0(a7)
  return  ((uint32_t)(uint8_t)x0)        |
     458:	05214683          	lbu	a3,82(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     45c:	00d82023          	sw	a3,0(a6)
  return  ((uint32_t)(uint8_t)x0)        |
     460:	05314683          	lbu	a3,83(sp)
static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
     464:	00d52023          	sw	a3,0(a0)
     468:	0134a023          	sw	s3,0(s1) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for (int t = 0; t < T; ++t) {
     46c:	f4879ae3          	bne	a5,s0,3c0 <main+0x168>
     470:	01010713          	add	a4,sp,16
static inline uint32_t cfs_read(uint32_t off) { return CFS_REG(off); }
     474:	ffeb0637          	lui	a2,0xffeb0
  for (int t = 0; t < T; ++t) {
     478:	00000413          	li	s0,0
     47c:	00070b13          	mv	s6,a4
static inline uint32_t cfs_read(uint32_t off) { return CFS_REG(off); }
     480:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
    for (int j = 0; j < 4; ++j) {
     484:	01000593          	li	a1,16
     488:	00241693          	sll	a3,s0,0x2
      dst[i][j] = (int32_t)u; /* HW stores 32-bit; reinterpret is fine */
     48c:	00000793          	li	a5,0
static inline uint32_t cfs_read(uint32_t off) { return CFS_REG(off); }
     490:	00c686b3          	add	a3,a3,a2
     494:	00f68533          	add	a0,a3,a5
     498:	00052803          	lw	a6,0(a0)
      dst[i][j] = (int32_t)u; /* HW stores 32-bit; reinterpret is fine */
     49c:	00f70533          	add	a0,a4,a5
    for (int j = 0; j < 4; ++j) {
     4a0:	00478793          	add	a5,a5,4
      dst[i][j] = (int32_t)u; /* HW stores 32-bit; reinterpret is fine */
     4a4:	01052023          	sw	a6,0(a0)
    for (int j = 0; j < 4; ++j) {
     4a8:	feb796e3          	bne	a5,a1,494 <main+0x23c>
  for (int i = 0; i < 4; ++i) {
     4ac:	00440413          	add	s0,s0,4
     4b0:	01070713          	add	a4,a4,16
     4b4:	fcf41ae3          	bne	s0,a5,488 <main+0x230>
      C[i][j] = 0;
     4b8:	04000613          	li	a2,64
     4bc:	00000593          	li	a1,0
     4c0:	05010513          	add	a0,sp,80
     4c4:	574000ef          	jal	a38 <memset>
     4c8:	05010c13          	add	s8,sp,80
     4cc:	00000993          	li	s3,0
    for (int k = 0; k < K; ++k) {
     4d0:	02000d13          	li	s10,32
  for (int i = 0; i < 4; ++i) {
     4d4:	10000d93          	li	s11,256
    for (int k = 0; k < K; ++k) {
     4d8:	01390bb3          	add	s7,s2,s3
      C[i][j] = 0;
     4dc:	00000a13          	li	s4,0
     4e0:	010c0693          	add	a3,s8,16
      int32_t a = (int32_t)A_flat[arow_off + k];
     4e4:	000b8583          	lb	a1,0(s7)
      for (int j = 0; j < 4; ++j) {
     4e8:	014a8cb3          	add	s9,s5,s4
      int32_t a = (int32_t)A_flat[arow_off + k];
     4ec:	000c0493          	mv	s1,s8
        C[i][j] += a * (int32_t)B_flat[brow_off + j];
     4f0:	000c8503          	lb	a0,0(s9)
     4f4:	00d12623          	sw	a3,12(sp)
     4f8:	00b12423          	sw	a1,8(sp)
     4fc:	2e80e0ef          	jal	e7e4 <__mulsi3>
     500:	0004a783          	lw	a5,0(s1)
      for (int j = 0; j < 4; ++j) {
     504:	00c12683          	lw	a3,12(sp)
     508:	00448493          	add	s1,s1,4
        C[i][j] += a * (int32_t)B_flat[brow_off + j];
     50c:	00a787b3          	add	a5,a5,a0
     510:	fef4ae23          	sw	a5,-4(s1)
      for (int j = 0; j < 4; ++j) {
     514:	00812583          	lw	a1,8(sp)
     518:	001c8c93          	add	s9,s9,1
     51c:	fcd49ae3          	bne	s1,a3,4f0 <main+0x298>
    for (int k = 0; k < K; ++k) {
     520:	004a0a13          	add	s4,s4,4
     524:	001b8b93          	add	s7,s7,1
     528:	fbaa1ee3          	bne	s4,s10,4e4 <main+0x28c>
  for (int i = 0; i < 4; ++i) {
     52c:	04098993          	add	s3,s3,64
     530:	0bb99663          	bne	s3,s11,5dc <main+0x384>

  /* Reference */
  gemm_ref_4xK_Kx4(A_flat, B_flat, K, C_sw);

  /* Compare */
  int errors = 0;
     534:	00000493          	li	s1,0
  for (int i = 0; i < 4; ++i) {
     538:	05000693          	li	a3,80
    for (int j = 0; j < 4; ++j) {
     53c:	ff040793          	add	a5,s0,-16
      if (C_hw[i][j] != C_sw[i][j]) {
     540:	00fb0733          	add	a4,s6,a5
     544:	00072603          	lw	a2,0(a4)
     548:	05010713          	add	a4,sp,80
     54c:	00f70733          	add	a4,a4,a5
     550:	00072703          	lw	a4,0(a4)
     554:	00e60463          	beq	a2,a4,55c <main+0x304>
        ++errors;
     558:	00148493          	add	s1,s1,1
    for (int j = 0; j < 4; ++j) {
     55c:	00478793          	add	a5,a5,4
     560:	fef410e3          	bne	s0,a5,540 <main+0x2e8>
  for (int i = 0; i < 4; ++i) {
     564:	01040413          	add	s0,s0,16
     568:	fcd41ae3          	bne	s0,a3,53c <main+0x2e4>
      }
    }
  }

  print_i32_4x4("C (HW)", C_hw);
     56c:	0000f537          	lui	a0,0xf
     570:	000b0593          	mv	a1,s6
     574:	98050513          	add	a0,a0,-1664 # e980 <__fini_array_end+0x3c>
     578:	c6dff0ef          	jal	1e4 <print_i32_4x4>
  print_i32_4x4("C (SW)", C_sw);
     57c:	0000f537          	lui	a0,0xf
     580:	05010593          	add	a1,sp,80
     584:	98850513          	add	a0,a0,-1656 # e988 <__fini_array_end+0x44>
     588:	c5dff0ef          	jal	1e4 <print_i32_4x4>

  if (errors == 0) {
     58c:	04049c63          	bnez	s1,5e4 <main+0x38c>
    printf("Verdict: PASS (HW matches SW)\n");
     590:	0000f537          	lui	a0,0xf
     594:	99050513          	add	a0,a0,-1648 # e990 <__fini_array_end+0x4c>
     598:	480000ef          	jal	a18 <puts>
  } else {
    printf("Verdict: FAIL (%d mismatches)\n", errors);
  }

  return (errors == 0) ? 0 : 1;
}
     59c:	0cc12083          	lw	ra,204(sp)
     5a0:	0c812403          	lw	s0,200(sp)
     5a4:	0c012903          	lw	s2,192(sp)
     5a8:	0bc12983          	lw	s3,188(sp)
     5ac:	0b812a03          	lw	s4,184(sp)
     5b0:	0b412a83          	lw	s5,180(sp)
     5b4:	0b012b03          	lw	s6,176(sp)
     5b8:	0ac12b83          	lw	s7,172(sp)
     5bc:	0a812c03          	lw	s8,168(sp)
     5c0:	0a412c83          	lw	s9,164(sp)
     5c4:	0a012d03          	lw	s10,160(sp)
     5c8:	09c12d83          	lw	s11,156(sp)
     5cc:	00903533          	snez	a0,s1
     5d0:	0c412483          	lw	s1,196(sp)
     5d4:	0d010113          	add	sp,sp,208
     5d8:	00008067          	ret
     5dc:	00048c13          	mv	s8,s1
     5e0:	ef9ff06f          	j	4d8 <main+0x280>
    printf("Verdict: FAIL (%d mismatches)\n", errors);
     5e4:	0000f537          	lui	a0,0xf
     5e8:	00048593          	mv	a1,s1
     5ec:	9b050513          	add	a0,a0,-1616 # e9b0 <__fini_array_end+0x6c>
     5f0:	294000ef          	jal	884 <printf>
     5f4:	fa9ff06f          	j	59c <main+0x344>

000005f8 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     5f8:	00000097          	auipc	ra,0x0
     5fc:	b6008093          	add	ra,ra,-1184 # 158 <__crt0_main_exit>
     600:	00050513          	mv	a0,a0
     604:	00008067          	ret

00000608 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     608:	fff00513          	li	a0,-1
     60c:	00008067          	ret

00000610 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     610:	000027b7          	lui	a5,0x2
     614:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     618:	00000513          	li	a0,0
     61c:	00008067          	ret

00000620 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     620:	00100513          	li	a0,1
     624:	00008067          	ret

00000628 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     628:	00100513          	li	a0,1
     62c:	00008067          	ret

00000630 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     630:	800007b7          	lui	a5,0x80000
     634:	01600713          	li	a4,22
     638:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     63c:	fff00513          	li	a0,-1
     640:	00008067          	ret

00000644 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     644:	00000513          	li	a0,0
     648:	00008067          	ret

0000064c <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     64c:	fe010113          	add	sp,sp,-32
     650:	00912a23          	sw	s1,20(sp)
     654:	01212823          	sw	s2,16(sp)
     658:	00112e23          	sw	ra,28(sp)
     65c:	00812c23          	sw	s0,24(sp)
     660:	01312623          	sw	s3,12(sp)
     664:	01412423          	sw	s4,8(sp)
     668:	00058913          	mv	s2,a1
     66c:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     670:	06051463          	bnez	a0,6d8 <_read+0x8c>
     674:	00050413          	mv	s0,a0
     678:	fff50537          	lui	a0,0xfff50
     67c:	1a0000ef          	jal	81c <neorv32_uart_available>
     680:	04050c63          	beqz	a0,6d8 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     684:	00a00993          	li	s3,10
     688:	00d00a13          	li	s4,13
    while (len--) {
     68c:	00941663          	bne	s0,s1,698 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     690:	00048413          	mv	s0,s1
     694:	0200006f          	j	6b4 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     698:	fff50537          	lui	a0,0xfff50
     69c:	1d0000ef          	jal	86c <neorv32_uart_getc>
      *ptr++ = c;
     6a0:	008907b3          	add	a5,s2,s0
     6a4:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     6a8:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     6ac:	01350463          	beq	a0,s3,6b4 <_read+0x68>
     6b0:	fd451ee3          	bne	a0,s4,68c <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     6b4:	01c12083          	lw	ra,28(sp)
     6b8:	00040513          	mv	a0,s0
     6bc:	01812403          	lw	s0,24(sp)
     6c0:	01412483          	lw	s1,20(sp)
     6c4:	01012903          	lw	s2,16(sp)
     6c8:	00c12983          	lw	s3,12(sp)
     6cc:	00812a03          	lw	s4,8(sp)
     6d0:	02010113          	add	sp,sp,32
     6d4:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     6d8:	fff60537          	lui	a0,0xfff60
     6dc:	140000ef          	jal	81c <neorv32_uart_available>
  int read_cnt = 0;
     6e0:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     6e4:	02050863          	beqz	a0,714 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     6e8:	00a00993          	li	s3,10
     6ec:	00d00a13          	li	s4,13
    while (len--) {
     6f0:	fa9400e3          	beq	s0,s1,690 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     6f4:	fff60537          	lui	a0,0xfff60
     6f8:	174000ef          	jal	86c <neorv32_uart_getc>
      *ptr++ = c;
     6fc:	008907b3          	add	a5,s2,s0
     700:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     704:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     708:	fb3506e3          	beq	a0,s3,6b4 <_read+0x68>
     70c:	ff4512e3          	bne	a0,s4,6f0 <_read+0xa4>
     710:	fa5ff06f          	j	6b4 <_read+0x68>
    errno = ENOSYS;
     714:	800007b7          	lui	a5,0x80000
     718:	05800713          	li	a4,88
     71c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     720:	fff00413          	li	s0,-1
     724:	f91ff06f          	j	6b4 <_read+0x68>

00000728 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     728:	ff010113          	add	sp,sp,-16
     72c:	00812423          	sw	s0,8(sp)
     730:	00912223          	sw	s1,4(sp)
     734:	00112623          	sw	ra,12(sp)
     738:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     73c:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     740:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     744:	00058413          	mv	s0,a1
     748:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     74c:	04a7ec63          	bltu	a5,a0,7a4 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     750:	fff50537          	lui	a0,0xfff50
     754:	0c8000ef          	jal	81c <neorv32_uart_available>
     758:	00940933          	add	s2,s0,s1
     75c:	02051463          	bnez	a0,784 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     760:	800007b7          	lui	a5,0x80000
     764:	05800713          	li	a4,88
     768:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     76c:	fff00493          	li	s1,-1
     770:	0180006f          	j	788 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     774:	00044583          	lbu	a1,0(s0)
     778:	fff50537          	lui	a0,0xfff50
     77c:	00140413          	add	s0,s0,1
     780:	0d8000ef          	jal	858 <neorv32_uart_putc>
      while (len--) {
     784:	fe8918e3          	bne	s2,s0,774 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     788:	00c12083          	lw	ra,12(sp)
     78c:	00812403          	lw	s0,8(sp)
     790:	00012903          	lw	s2,0(sp)
     794:	00048513          	mv	a0,s1
     798:	00412483          	lw	s1,4(sp)
     79c:	01010113          	add	sp,sp,16
     7a0:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     7a4:	fff60537          	lui	a0,0xfff60
     7a8:	074000ef          	jal	81c <neorv32_uart_available>
     7ac:	00940933          	add	s2,s0,s1
     7b0:	fa0508e3          	beqz	a0,760 <_write+0x38>
    while (len--) {
     7b4:	fd240ae3          	beq	s0,s2,788 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     7b8:	00044583          	lbu	a1,0(s0)
     7bc:	fff60537          	lui	a0,0xfff60
     7c0:	00140413          	add	s0,s0,1
     7c4:	094000ef          	jal	858 <neorv32_uart_putc>
      write_cnt++;
     7c8:	fedff06f          	j	7b4 <_write+0x8c>

000007cc <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     7cc:	80000737          	lui	a4,0x80000
     7d0:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     7d4:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     7d8:	00050793          	mv	a5,a0
     7dc:	a9460613          	add	a2,a2,-1388 # 80000a94 <__crt0_bss_end>
  if (curr_heap == NULL) {
     7e0:	00069463          	bnez	a3,7e8 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     7e4:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     7e8:	800016b7          	lui	a3,0x80001
     7ec:	a9468693          	add	a3,a3,-1388 # 80000a94 <__crt0_bss_end>
     7f0:	00c69c63          	bne	a3,a2,808 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     7f4:	800007b7          	lui	a5,0x80000
     7f8:	00c00713          	li	a4,12
     7fc:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     800:	fff00513          	li	a0,-1
     804:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     808:	71472503          	lw	a0,1812(a4)
     80c:	00f507b3          	add	a5,a0,a5
     810:	fed7f2e3          	bgeu	a5,a3,7f4 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     814:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     818:	00008067          	ret

0000081c <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     81c:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     820:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     824:	00e51c63          	bne	a0,a4,83c <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     828:	fffe07b7          	lui	a5,0xfffe0
     82c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     830:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     834:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     838:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     83c:	fff60737          	lui	a4,0xfff60
    return 0;
     840:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     844:	fee79ae3          	bne	a5,a4,838 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     848:	fffe07b7          	lui	a5,0xfffe0
     84c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     850:	020007b7          	lui	a5,0x2000
     854:	fe1ff06f          	j	834 <neorv32_uart_available+0x18>

00000858 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     858:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     85c:	00a79713          	sll	a4,a5,0xa
     860:	fe075ce3          	bgez	a4,858 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     864:	00b52223          	sw	a1,4(a0)
}
     868:	00008067          	ret

0000086c <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     86c:	00052783          	lw	a5,0(a0)
     870:	00f79713          	sll	a4,a5,0xf
     874:	fe075ce3          	bgez	a4,86c <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     878:	00452503          	lw	a0,4(a0)
}
     87c:	0ff57513          	zext.b	a0,a0
     880:	00008067          	ret

00000884 <printf>:
     884:	fc010113          	add	sp,sp,-64
     888:	02c12423          	sw	a2,40(sp)
     88c:	02d12623          	sw	a3,44(sp)
     890:	80000317          	auipc	t1,0x80000
     894:	e7832303          	lw	t1,-392(t1) # 80000708 <_impure_ptr>
     898:	02b12223          	sw	a1,36(sp)
     89c:	02e12823          	sw	a4,48(sp)
     8a0:	02f12a23          	sw	a5,52(sp)
     8a4:	03012c23          	sw	a6,56(sp)
     8a8:	03112e23          	sw	a7,60(sp)
     8ac:	00832583          	lw	a1,8(t1)
     8b0:	02410693          	add	a3,sp,36
     8b4:	00050613          	mv	a2,a0
     8b8:	00030513          	mv	a0,t1
     8bc:	00112e23          	sw	ra,28(sp)
     8c0:	00d12623          	sw	a3,12(sp)
     8c4:	0c8010ef          	jal	198c <_vfprintf_r>
     8c8:	01c12083          	lw	ra,28(sp)
     8cc:	04010113          	add	sp,sp,64
     8d0:	00008067          	ret

000008d4 <putchar>:
     8d4:	80000797          	auipc	a5,0x80000
     8d8:	e347a783          	lw	a5,-460(a5) # 80000708 <_impure_ptr>
     8dc:	0087a603          	lw	a2,8(a5)
     8e0:	00050593          	mv	a1,a0
     8e4:	00078513          	mv	a0,a5
     8e8:	3c00606f          	j	6ca8 <_putc_r>

000008ec <_puts_r>:
     8ec:	fd010113          	add	sp,sp,-48
     8f0:	02812423          	sw	s0,40(sp)
     8f4:	00050413          	mv	s0,a0
     8f8:	00058513          	mv	a0,a1
     8fc:	02912223          	sw	s1,36(sp)
     900:	02112623          	sw	ra,44(sp)
     904:	00058493          	mv	s1,a1
     908:	3b0000ef          	jal	cb8 <strlen>
     90c:	00150713          	add	a4,a0,1
     910:	0000e697          	auipc	a3,0xe
     914:	06c68693          	add	a3,a3,108 # e97c <__fini_array_end+0x38>
     918:	00e12623          	sw	a4,12(sp)
     91c:	03442783          	lw	a5,52(s0)
     920:	01010713          	add	a4,sp,16
     924:	00d12c23          	sw	a3,24(sp)
     928:	00e12223          	sw	a4,4(sp)
     92c:	00100693          	li	a3,1
     930:	00200713          	li	a4,2
     934:	00912823          	sw	s1,16(sp)
     938:	00a12a23          	sw	a0,20(sp)
     93c:	00d12e23          	sw	a3,28(sp)
     940:	00e12423          	sw	a4,8(sp)
     944:	00842483          	lw	s1,8(s0)
     948:	0c078263          	beqz	a5,a0c <_puts_r+0x120>
     94c:	0644a703          	lw	a4,100(s1)
     950:	00c49783          	lh	a5,12(s1)
     954:	00177713          	and	a4,a4,1
     958:	00071663          	bnez	a4,964 <_puts_r+0x78>
     95c:	2007f713          	and	a4,a5,512
     960:	08070e63          	beqz	a4,9fc <_puts_r+0x110>
     964:	01279713          	sll	a4,a5,0x12
     968:	02074263          	bltz	a4,98c <_puts_r+0xa0>
     96c:	0644a703          	lw	a4,100(s1)
     970:	ffffe6b7          	lui	a3,0xffffe
     974:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     978:	00002637          	lui	a2,0x2
     97c:	00c7e7b3          	or	a5,a5,a2
     980:	00d77733          	and	a4,a4,a3
     984:	00f49623          	sh	a5,12(s1)
     988:	06e4a223          	sw	a4,100(s1)
     98c:	00040513          	mv	a0,s0
     990:	00410613          	add	a2,sp,4
     994:	00048593          	mv	a1,s1
     998:	549050ef          	jal	66e0 <__sfvwrite_r>
     99c:	0644a783          	lw	a5,100(s1)
     9a0:	00153413          	seqz	s0,a0
     9a4:	40800433          	neg	s0,s0
     9a8:	00b47413          	and	s0,s0,11
     9ac:	0017f793          	and	a5,a5,1
     9b0:	fff40413          	add	s0,s0,-1
     9b4:	00079863          	bnez	a5,9c4 <_puts_r+0xd8>
     9b8:	00c4d783          	lhu	a5,12(s1)
     9bc:	2007f793          	and	a5,a5,512
     9c0:	00078e63          	beqz	a5,9dc <_puts_r+0xf0>
     9c4:	02c12083          	lw	ra,44(sp)
     9c8:	00040513          	mv	a0,s0
     9cc:	02812403          	lw	s0,40(sp)
     9d0:	02412483          	lw	s1,36(sp)
     9d4:	03010113          	add	sp,sp,48
     9d8:	00008067          	ret
     9dc:	0584a503          	lw	a0,88(s1)
     9e0:	054000ef          	jal	a34 <__retarget_lock_release_recursive>
     9e4:	02c12083          	lw	ra,44(sp)
     9e8:	00040513          	mv	a0,s0
     9ec:	02812403          	lw	s0,40(sp)
     9f0:	02412483          	lw	s1,36(sp)
     9f4:	03010113          	add	sp,sp,48
     9f8:	00008067          	ret
     9fc:	0584a503          	lw	a0,88(s1)
     a00:	030000ef          	jal	a30 <__retarget_lock_acquire_recursive>
     a04:	00c49783          	lh	a5,12(s1)
     a08:	f5dff06f          	j	964 <_puts_r+0x78>
     a0c:	00040513          	mv	a0,s0
     a10:	449050ef          	jal	6658 <__sinit>
     a14:	f39ff06f          	j	94c <_puts_r+0x60>

00000a18 <puts>:
     a18:	00050593          	mv	a1,a0
     a1c:	80000517          	auipc	a0,0x80000
     a20:	cec52503          	lw	a0,-788(a0) # 80000708 <_impure_ptr>
     a24:	ec9ff06f          	j	8ec <_puts_r>

00000a28 <__retarget_lock_init_recursive>:
     a28:	00008067          	ret

00000a2c <__retarget_lock_close_recursive>:
     a2c:	00008067          	ret

00000a30 <__retarget_lock_acquire_recursive>:
     a30:	00008067          	ret

00000a34 <__retarget_lock_release_recursive>:
     a34:	00008067          	ret

00000a38 <memset>:
     a38:	00f00313          	li	t1,15
     a3c:	00050713          	mv	a4,a0
     a40:	02c37e63          	bgeu	t1,a2,a7c <memset+0x44>
     a44:	00f77793          	and	a5,a4,15
     a48:	0a079063          	bnez	a5,ae8 <memset+0xb0>
     a4c:	08059263          	bnez	a1,ad0 <memset+0x98>
     a50:	ff067693          	and	a3,a2,-16
     a54:	00f67613          	and	a2,a2,15
     a58:	00e686b3          	add	a3,a3,a4
     a5c:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     a60:	00b72223          	sw	a1,4(a4)
     a64:	00b72423          	sw	a1,8(a4)
     a68:	00b72623          	sw	a1,12(a4)
     a6c:	01070713          	add	a4,a4,16
     a70:	fed766e3          	bltu	a4,a3,a5c <memset+0x24>
     a74:	00061463          	bnez	a2,a7c <memset+0x44>
     a78:	00008067          	ret
     a7c:	40c306b3          	sub	a3,t1,a2
     a80:	00269693          	sll	a3,a3,0x2
     a84:	00000297          	auipc	t0,0x0
     a88:	005686b3          	add	a3,a3,t0
     a8c:	00c68067          	jr	12(a3)
     a90:	00b70723          	sb	a1,14(a4)
     a94:	00b706a3          	sb	a1,13(a4)
     a98:	00b70623          	sb	a1,12(a4)
     a9c:	00b705a3          	sb	a1,11(a4)
     aa0:	00b70523          	sb	a1,10(a4)
     aa4:	00b704a3          	sb	a1,9(a4)
     aa8:	00b70423          	sb	a1,8(a4)
     aac:	00b703a3          	sb	a1,7(a4)
     ab0:	00b70323          	sb	a1,6(a4)
     ab4:	00b702a3          	sb	a1,5(a4)
     ab8:	00b70223          	sb	a1,4(a4)
     abc:	00b701a3          	sb	a1,3(a4)
     ac0:	00b70123          	sb	a1,2(a4)
     ac4:	00b700a3          	sb	a1,1(a4)
     ac8:	00b70023          	sb	a1,0(a4)
     acc:	00008067          	ret
     ad0:	0ff5f593          	zext.b	a1,a1
     ad4:	00859693          	sll	a3,a1,0x8
     ad8:	00d5e5b3          	or	a1,a1,a3
     adc:	01059693          	sll	a3,a1,0x10
     ae0:	00d5e5b3          	or	a1,a1,a3
     ae4:	f6dff06f          	j	a50 <memset+0x18>
     ae8:	00279693          	sll	a3,a5,0x2
     aec:	00000297          	auipc	t0,0x0
     af0:	005686b3          	add	a3,a3,t0
     af4:	00008293          	mv	t0,ra
     af8:	fa0680e7          	jalr	-96(a3)
     afc:	00028093          	mv	ra,t0
     b00:	ff078793          	add	a5,a5,-16
     b04:	40f70733          	sub	a4,a4,a5
     b08:	00f60633          	add	a2,a2,a5
     b0c:	f6c378e3          	bgeu	t1,a2,a7c <memset+0x44>
     b10:	f3dff06f          	j	a4c <memset+0x14>

00000b14 <memcpy>:
     b14:	00a5c7b3          	xor	a5,a1,a0
     b18:	0037f793          	and	a5,a5,3
     b1c:	00c508b3          	add	a7,a0,a2
     b20:	06079463          	bnez	a5,b88 <memcpy+0x74>
     b24:	00300793          	li	a5,3
     b28:	06c7f063          	bgeu	a5,a2,b88 <memcpy+0x74>
     b2c:	00357793          	and	a5,a0,3
     b30:	00050713          	mv	a4,a0
     b34:	06079a63          	bnez	a5,ba8 <memcpy+0x94>
     b38:	ffc8f613          	and	a2,a7,-4
     b3c:	40e606b3          	sub	a3,a2,a4
     b40:	02000793          	li	a5,32
     b44:	08d7ce63          	blt	a5,a3,be0 <memcpy+0xcc>
     b48:	00058693          	mv	a3,a1
     b4c:	00070793          	mv	a5,a4
     b50:	02c77863          	bgeu	a4,a2,b80 <memcpy+0x6c>
     b54:	0006a803          	lw	a6,0(a3)
     b58:	00478793          	add	a5,a5,4
     b5c:	00468693          	add	a3,a3,4
     b60:	ff07ae23          	sw	a6,-4(a5)
     b64:	fec7e8e3          	bltu	a5,a2,b54 <memcpy+0x40>
     b68:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x673>
     b6c:	40e787b3          	sub	a5,a5,a4
     b70:	ffc7f793          	and	a5,a5,-4
     b74:	00478793          	add	a5,a5,4
     b78:	00f70733          	add	a4,a4,a5
     b7c:	00f585b3          	add	a1,a1,a5
     b80:	01176863          	bltu	a4,a7,b90 <memcpy+0x7c>
     b84:	00008067          	ret
     b88:	00050713          	mv	a4,a0
     b8c:	05157863          	bgeu	a0,a7,bdc <memcpy+0xc8>
     b90:	0005c783          	lbu	a5,0(a1)
     b94:	00170713          	add	a4,a4,1
     b98:	00158593          	add	a1,a1,1
     b9c:	fef70fa3          	sb	a5,-1(a4)
     ba0:	fee898e3          	bne	a7,a4,b90 <memcpy+0x7c>
     ba4:	00008067          	ret
     ba8:	0005c683          	lbu	a3,0(a1)
     bac:	00170713          	add	a4,a4,1
     bb0:	00377793          	and	a5,a4,3
     bb4:	fed70fa3          	sb	a3,-1(a4)
     bb8:	00158593          	add	a1,a1,1
     bbc:	f6078ee3          	beqz	a5,b38 <memcpy+0x24>
     bc0:	0005c683          	lbu	a3,0(a1)
     bc4:	00170713          	add	a4,a4,1
     bc8:	00377793          	and	a5,a4,3
     bcc:	fed70fa3          	sb	a3,-1(a4)
     bd0:	00158593          	add	a1,a1,1
     bd4:	fc079ae3          	bnez	a5,ba8 <memcpy+0x94>
     bd8:	f61ff06f          	j	b38 <memcpy+0x24>
     bdc:	00008067          	ret
     be0:	ff010113          	add	sp,sp,-16
     be4:	00812623          	sw	s0,12(sp)
     be8:	02000413          	li	s0,32
     bec:	0005a383          	lw	t2,0(a1)
     bf0:	0045a283          	lw	t0,4(a1)
     bf4:	0085af83          	lw	t6,8(a1)
     bf8:	00c5af03          	lw	t5,12(a1)
     bfc:	0105ae83          	lw	t4,16(a1)
     c00:	0145ae03          	lw	t3,20(a1)
     c04:	0185a303          	lw	t1,24(a1)
     c08:	01c5a803          	lw	a6,28(a1)
     c0c:	0205a683          	lw	a3,32(a1)
     c10:	02470713          	add	a4,a4,36
     c14:	40e607b3          	sub	a5,a2,a4
     c18:	fc772e23          	sw	t2,-36(a4)
     c1c:	fe572023          	sw	t0,-32(a4)
     c20:	fff72223          	sw	t6,-28(a4)
     c24:	ffe72423          	sw	t5,-24(a4)
     c28:	ffd72623          	sw	t4,-20(a4)
     c2c:	ffc72823          	sw	t3,-16(a4)
     c30:	fe672a23          	sw	t1,-12(a4)
     c34:	ff072c23          	sw	a6,-8(a4)
     c38:	fed72e23          	sw	a3,-4(a4)
     c3c:	02458593          	add	a1,a1,36
     c40:	faf446e3          	blt	s0,a5,bec <memcpy+0xd8>
     c44:	00058693          	mv	a3,a1
     c48:	00070793          	mv	a5,a4
     c4c:	02c77863          	bgeu	a4,a2,c7c <memcpy+0x168>
     c50:	0006a803          	lw	a6,0(a3)
     c54:	00478793          	add	a5,a5,4
     c58:	00468693          	add	a3,a3,4
     c5c:	ff07ae23          	sw	a6,-4(a5)
     c60:	fec7e8e3          	bltu	a5,a2,c50 <memcpy+0x13c>
     c64:	fff60793          	add	a5,a2,-1
     c68:	40e787b3          	sub	a5,a5,a4
     c6c:	ffc7f793          	and	a5,a5,-4
     c70:	00478793          	add	a5,a5,4
     c74:	00f70733          	add	a4,a4,a5
     c78:	00f585b3          	add	a1,a1,a5
     c7c:	01176863          	bltu	a4,a7,c8c <memcpy+0x178>
     c80:	00c12403          	lw	s0,12(sp)
     c84:	01010113          	add	sp,sp,16
     c88:	00008067          	ret
     c8c:	0005c783          	lbu	a5,0(a1)
     c90:	00170713          	add	a4,a4,1
     c94:	00158593          	add	a1,a1,1
     c98:	fef70fa3          	sb	a5,-1(a4)
     c9c:	fee882e3          	beq	a7,a4,c80 <memcpy+0x16c>
     ca0:	0005c783          	lbu	a5,0(a1)
     ca4:	00170713          	add	a4,a4,1
     ca8:	00158593          	add	a1,a1,1
     cac:	fef70fa3          	sb	a5,-1(a4)
     cb0:	fce89ee3          	bne	a7,a4,c8c <memcpy+0x178>
     cb4:	fcdff06f          	j	c80 <memcpy+0x16c>

00000cb8 <strlen>:
     cb8:	00357793          	and	a5,a0,3
     cbc:	00050713          	mv	a4,a0
     cc0:	04079c63          	bnez	a5,d18 <strlen+0x60>
     cc4:	7f7f86b7          	lui	a3,0x7f7f8
     cc8:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
     ccc:	fff00593          	li	a1,-1
     cd0:	00072603          	lw	a2,0(a4)
     cd4:	00470713          	add	a4,a4,4
     cd8:	00d677b3          	and	a5,a2,a3
     cdc:	00d787b3          	add	a5,a5,a3
     ce0:	00c7e7b3          	or	a5,a5,a2
     ce4:	00d7e7b3          	or	a5,a5,a3
     ce8:	feb784e3          	beq	a5,a1,cd0 <strlen+0x18>
     cec:	ffc74683          	lbu	a3,-4(a4)
     cf0:	40a707b3          	sub	a5,a4,a0
     cf4:	04068463          	beqz	a3,d3c <strlen+0x84>
     cf8:	ffd74683          	lbu	a3,-3(a4)
     cfc:	02068c63          	beqz	a3,d34 <strlen+0x7c>
     d00:	ffe74503          	lbu	a0,-2(a4)
     d04:	00a03533          	snez	a0,a0
     d08:	00f50533          	add	a0,a0,a5
     d0c:	ffe50513          	add	a0,a0,-2
     d10:	00008067          	ret
     d14:	fa0688e3          	beqz	a3,cc4 <strlen+0xc>
     d18:	00074783          	lbu	a5,0(a4)
     d1c:	00170713          	add	a4,a4,1
     d20:	00377693          	and	a3,a4,3
     d24:	fe0798e3          	bnez	a5,d14 <strlen+0x5c>
     d28:	40a70733          	sub	a4,a4,a0
     d2c:	fff70513          	add	a0,a4,-1
     d30:	00008067          	ret
     d34:	ffd78513          	add	a0,a5,-3
     d38:	00008067          	ret
     d3c:	ffc78513          	add	a0,a5,-4
     d40:	00008067          	ret

00000d44 <_malloc_trim_r>:
     d44:	fe010113          	add	sp,sp,-32
     d48:	00812c23          	sw	s0,24(sp)
     d4c:	00912a23          	sw	s1,20(sp)
     d50:	01212823          	sw	s2,16(sp)
     d54:	01312623          	sw	s3,12(sp)
     d58:	01412423          	sw	s4,8(sp)
     d5c:	00058993          	mv	s3,a1
     d60:	00112e23          	sw	ra,28(sp)
     d64:	00050913          	mv	s2,a0
     d68:	7ffffa17          	auipc	s4,0x7ffff
     d6c:	3b8a0a13          	add	s4,s4,952 # 80000120 <__malloc_av_>
     d70:	405000ef          	jal	1974 <__malloc_lock>
     d74:	008a2703          	lw	a4,8(s4)
     d78:	000017b7          	lui	a5,0x1
     d7c:	fef78793          	add	a5,a5,-17 # fef <_free_r+0x167>
     d80:	00472483          	lw	s1,4(a4)
     d84:	00001737          	lui	a4,0x1
     d88:	ffc4f493          	and	s1,s1,-4
     d8c:	00f48433          	add	s0,s1,a5
     d90:	41340433          	sub	s0,s0,s3
     d94:	00c45413          	srl	s0,s0,0xc
     d98:	fff40413          	add	s0,s0,-1
     d9c:	00c41413          	sll	s0,s0,0xc
     da0:	00e44e63          	blt	s0,a4,dbc <_malloc_trim_r+0x78>
     da4:	00000593          	li	a1,0
     da8:	00090513          	mv	a0,s2
     dac:	105060ef          	jal	76b0 <_sbrk_r>
     db0:	008a2783          	lw	a5,8(s4)
     db4:	009787b3          	add	a5,a5,s1
     db8:	02f50863          	beq	a0,a5,de8 <_malloc_trim_r+0xa4>
     dbc:	00090513          	mv	a0,s2
     dc0:	3c1000ef          	jal	1980 <__malloc_unlock>
     dc4:	01c12083          	lw	ra,28(sp)
     dc8:	01812403          	lw	s0,24(sp)
     dcc:	01412483          	lw	s1,20(sp)
     dd0:	01012903          	lw	s2,16(sp)
     dd4:	00c12983          	lw	s3,12(sp)
     dd8:	00812a03          	lw	s4,8(sp)
     ddc:	00000513          	li	a0,0
     de0:	02010113          	add	sp,sp,32
     de4:	00008067          	ret
     de8:	408005b3          	neg	a1,s0
     dec:	00090513          	mv	a0,s2
     df0:	0c1060ef          	jal	76b0 <_sbrk_r>
     df4:	fff00793          	li	a5,-1
     df8:	04f50a63          	beq	a0,a5,e4c <_malloc_trim_r+0x108>
     dfc:	80000717          	auipc	a4,0x80000
     e00:	b3870713          	add	a4,a4,-1224 # 80000934 <__malloc_current_mallinfo>
     e04:	00072783          	lw	a5,0(a4)
     e08:	008a2683          	lw	a3,8(s4)
     e0c:	408484b3          	sub	s1,s1,s0
     e10:	0014e493          	or	s1,s1,1
     e14:	408787b3          	sub	a5,a5,s0
     e18:	00090513          	mv	a0,s2
     e1c:	0096a223          	sw	s1,4(a3)
     e20:	00f72023          	sw	a5,0(a4)
     e24:	35d000ef          	jal	1980 <__malloc_unlock>
     e28:	01c12083          	lw	ra,28(sp)
     e2c:	01812403          	lw	s0,24(sp)
     e30:	01412483          	lw	s1,20(sp)
     e34:	01012903          	lw	s2,16(sp)
     e38:	00c12983          	lw	s3,12(sp)
     e3c:	00812a03          	lw	s4,8(sp)
     e40:	00100513          	li	a0,1
     e44:	02010113          	add	sp,sp,32
     e48:	00008067          	ret
     e4c:	00000593          	li	a1,0
     e50:	00090513          	mv	a0,s2
     e54:	05d060ef          	jal	76b0 <_sbrk_r>
     e58:	008a2703          	lw	a4,8(s4)
     e5c:	00f00693          	li	a3,15
     e60:	40e507b3          	sub	a5,a0,a4
     e64:	f4f6dce3          	bge	a3,a5,dbc <_malloc_trim_r+0x78>
     e68:	80000697          	auipc	a3,0x80000
     e6c:	8a46a683          	lw	a3,-1884(a3) # 8000070c <__malloc_sbrk_base>
     e70:	40d50533          	sub	a0,a0,a3
     e74:	0017e793          	or	a5,a5,1
     e78:	80000697          	auipc	a3,0x80000
     e7c:	aaa6ae23          	sw	a0,-1348(a3) # 80000934 <__malloc_current_mallinfo>
     e80:	00f72223          	sw	a5,4(a4)
     e84:	f39ff06f          	j	dbc <_malloc_trim_r+0x78>

00000e88 <_free_r>:
     e88:	18058263          	beqz	a1,100c <_free_r+0x184>
     e8c:	ff010113          	add	sp,sp,-16
     e90:	00812423          	sw	s0,8(sp)
     e94:	00912223          	sw	s1,4(sp)
     e98:	00058413          	mv	s0,a1
     e9c:	00050493          	mv	s1,a0
     ea0:	00112623          	sw	ra,12(sp)
     ea4:	2d1000ef          	jal	1974 <__malloc_lock>
     ea8:	ffc42583          	lw	a1,-4(s0)
     eac:	ff840713          	add	a4,s0,-8
     eb0:	7ffff517          	auipc	a0,0x7ffff
     eb4:	27050513          	add	a0,a0,624 # 80000120 <__malloc_av_>
     eb8:	ffe5f793          	and	a5,a1,-2
     ebc:	00f70633          	add	a2,a4,a5
     ec0:	00462683          	lw	a3,4(a2)
     ec4:	00852803          	lw	a6,8(a0)
     ec8:	ffc6f693          	and	a3,a3,-4
     ecc:	1ac80263          	beq	a6,a2,1070 <_free_r+0x1e8>
     ed0:	00d62223          	sw	a3,4(a2)
     ed4:	0015f593          	and	a1,a1,1
     ed8:	00d60833          	add	a6,a2,a3
     edc:	0a059063          	bnez	a1,f7c <_free_r+0xf4>
     ee0:	ff842303          	lw	t1,-8(s0)
     ee4:	00482583          	lw	a1,4(a6)
     ee8:	7ffff897          	auipc	a7,0x7ffff
     eec:	24088893          	add	a7,a7,576 # 80000128 <__malloc_av_+0x8>
     ef0:	40670733          	sub	a4,a4,t1
     ef4:	00872803          	lw	a6,8(a4)
     ef8:	006787b3          	add	a5,a5,t1
     efc:	0015f593          	and	a1,a1,1
     f00:	15180263          	beq	a6,a7,1044 <_free_r+0x1bc>
     f04:	00c72303          	lw	t1,12(a4)
     f08:	00682623          	sw	t1,12(a6)
     f0c:	01032423          	sw	a6,8(t1)
     f10:	1a058a63          	beqz	a1,10c4 <_free_r+0x23c>
     f14:	0017e693          	or	a3,a5,1
     f18:	00d72223          	sw	a3,4(a4)
     f1c:	00f62023          	sw	a5,0(a2)
     f20:	1ff00693          	li	a3,511
     f24:	06f6ec63          	bltu	a3,a5,f9c <_free_r+0x114>
     f28:	ff87f693          	and	a3,a5,-8
     f2c:	00868693          	add	a3,a3,8
     f30:	00452583          	lw	a1,4(a0)
     f34:	00d506b3          	add	a3,a0,a3
     f38:	0006a603          	lw	a2,0(a3)
     f3c:	0057d813          	srl	a6,a5,0x5
     f40:	00100793          	li	a5,1
     f44:	010797b3          	sll	a5,a5,a6
     f48:	00b7e7b3          	or	a5,a5,a1
     f4c:	ff868593          	add	a1,a3,-8
     f50:	00b72623          	sw	a1,12(a4)
     f54:	00c72423          	sw	a2,8(a4)
     f58:	00f52223          	sw	a5,4(a0)
     f5c:	00e6a023          	sw	a4,0(a3)
     f60:	00e62623          	sw	a4,12(a2)
     f64:	00812403          	lw	s0,8(sp)
     f68:	00c12083          	lw	ra,12(sp)
     f6c:	00048513          	mv	a0,s1
     f70:	00412483          	lw	s1,4(sp)
     f74:	01010113          	add	sp,sp,16
     f78:	2090006f          	j	1980 <__malloc_unlock>
     f7c:	00482583          	lw	a1,4(a6)
     f80:	0015f593          	and	a1,a1,1
     f84:	08058663          	beqz	a1,1010 <_free_r+0x188>
     f88:	0017e693          	or	a3,a5,1
     f8c:	fed42e23          	sw	a3,-4(s0)
     f90:	00f62023          	sw	a5,0(a2)
     f94:	1ff00693          	li	a3,511
     f98:	f8f6f8e3          	bgeu	a3,a5,f28 <_free_r+0xa0>
     f9c:	0097d693          	srl	a3,a5,0x9
     fa0:	00400613          	li	a2,4
     fa4:	12d66463          	bltu	a2,a3,10cc <_free_r+0x244>
     fa8:	0067d693          	srl	a3,a5,0x6
     fac:	03968593          	add	a1,a3,57
     fb0:	03868613          	add	a2,a3,56
     fb4:	00359593          	sll	a1,a1,0x3
     fb8:	00b505b3          	add	a1,a0,a1
     fbc:	0005a683          	lw	a3,0(a1)
     fc0:	ff858593          	add	a1,a1,-8
     fc4:	00d59863          	bne	a1,a3,fd4 <_free_r+0x14c>
     fc8:	15c0006f          	j	1124 <_free_r+0x29c>
     fcc:	0086a683          	lw	a3,8(a3)
     fd0:	00d58863          	beq	a1,a3,fe0 <_free_r+0x158>
     fd4:	0046a603          	lw	a2,4(a3)
     fd8:	ffc67613          	and	a2,a2,-4
     fdc:	fec7e8e3          	bltu	a5,a2,fcc <_free_r+0x144>
     fe0:	00c6a583          	lw	a1,12(a3)
     fe4:	00b72623          	sw	a1,12(a4)
     fe8:	00d72423          	sw	a3,8(a4)
     fec:	00812403          	lw	s0,8(sp)
     ff0:	00c12083          	lw	ra,12(sp)
     ff4:	00e5a423          	sw	a4,8(a1)
     ff8:	00048513          	mv	a0,s1
     ffc:	00412483          	lw	s1,4(sp)
    1000:	00e6a623          	sw	a4,12(a3)
    1004:	01010113          	add	sp,sp,16
    1008:	1790006f          	j	1980 <__malloc_unlock>
    100c:	00008067          	ret
    1010:	00d787b3          	add	a5,a5,a3
    1014:	7ffff897          	auipc	a7,0x7ffff
    1018:	11488893          	add	a7,a7,276 # 80000128 <__malloc_av_+0x8>
    101c:	00862683          	lw	a3,8(a2)
    1020:	0f168063          	beq	a3,a7,1100 <_free_r+0x278>
    1024:	00c62803          	lw	a6,12(a2)
    1028:	0017e593          	or	a1,a5,1
    102c:	00f70633          	add	a2,a4,a5
    1030:	0106a623          	sw	a6,12(a3)
    1034:	00d82423          	sw	a3,8(a6)
    1038:	00b72223          	sw	a1,4(a4)
    103c:	00f62023          	sw	a5,0(a2)
    1040:	ee1ff06f          	j	f20 <_free_r+0x98>
    1044:	14059063          	bnez	a1,1184 <_free_r+0x2fc>
    1048:	00862583          	lw	a1,8(a2)
    104c:	00c62603          	lw	a2,12(a2)
    1050:	00f686b3          	add	a3,a3,a5
    1054:	0016e793          	or	a5,a3,1
    1058:	00c5a623          	sw	a2,12(a1)
    105c:	00b62423          	sw	a1,8(a2)
    1060:	00f72223          	sw	a5,4(a4)
    1064:	00d70733          	add	a4,a4,a3
    1068:	00d72023          	sw	a3,0(a4)
    106c:	ef9ff06f          	j	f64 <_free_r+0xdc>
    1070:	0015f593          	and	a1,a1,1
    1074:	00d786b3          	add	a3,a5,a3
    1078:	02059063          	bnez	a1,1098 <_free_r+0x210>
    107c:	ff842583          	lw	a1,-8(s0)
    1080:	40b70733          	sub	a4,a4,a1
    1084:	00c72783          	lw	a5,12(a4)
    1088:	00872603          	lw	a2,8(a4)
    108c:	00b686b3          	add	a3,a3,a1
    1090:	00f62623          	sw	a5,12(a2)
    1094:	00c7a423          	sw	a2,8(a5)
    1098:	0016e793          	or	a5,a3,1
    109c:	00f72223          	sw	a5,4(a4)
    10a0:	00e52423          	sw	a4,8(a0)
    10a4:	7ffff797          	auipc	a5,0x7ffff
    10a8:	66c7a783          	lw	a5,1644(a5) # 80000710 <__malloc_trim_threshold>
    10ac:	eaf6ece3          	bltu	a3,a5,f64 <_free_r+0xdc>
    10b0:	7ffff597          	auipc	a1,0x7ffff
    10b4:	67c5a583          	lw	a1,1660(a1) # 8000072c <__malloc_top_pad>
    10b8:	00048513          	mv	a0,s1
    10bc:	c89ff0ef          	jal	d44 <_malloc_trim_r>
    10c0:	ea5ff06f          	j	f64 <_free_r+0xdc>
    10c4:	00d787b3          	add	a5,a5,a3
    10c8:	f55ff06f          	j	101c <_free_r+0x194>
    10cc:	01400613          	li	a2,20
    10d0:	02d67063          	bgeu	a2,a3,10f0 <_free_r+0x268>
    10d4:	05400613          	li	a2,84
    10d8:	06d66463          	bltu	a2,a3,1140 <_free_r+0x2b8>
    10dc:	00c7d693          	srl	a3,a5,0xc
    10e0:	06f68593          	add	a1,a3,111
    10e4:	06e68613          	add	a2,a3,110
    10e8:	00359593          	sll	a1,a1,0x3
    10ec:	ecdff06f          	j	fb8 <_free_r+0x130>
    10f0:	05c68593          	add	a1,a3,92
    10f4:	05b68613          	add	a2,a3,91
    10f8:	00359593          	sll	a1,a1,0x3
    10fc:	ebdff06f          	j	fb8 <_free_r+0x130>
    1100:	00e52a23          	sw	a4,20(a0)
    1104:	00e52823          	sw	a4,16(a0)
    1108:	0017e693          	or	a3,a5,1
    110c:	01172623          	sw	a7,12(a4)
    1110:	01172423          	sw	a7,8(a4)
    1114:	00d72223          	sw	a3,4(a4)
    1118:	00f70733          	add	a4,a4,a5
    111c:	00f72023          	sw	a5,0(a4)
    1120:	e45ff06f          	j	f64 <_free_r+0xdc>
    1124:	00452803          	lw	a6,4(a0)
    1128:	40265613          	sra	a2,a2,0x2
    112c:	00100793          	li	a5,1
    1130:	00c797b3          	sll	a5,a5,a2
    1134:	0107e7b3          	or	a5,a5,a6
    1138:	00f52223          	sw	a5,4(a0)
    113c:	ea9ff06f          	j	fe4 <_free_r+0x15c>
    1140:	15400613          	li	a2,340
    1144:	00d66c63          	bltu	a2,a3,115c <_free_r+0x2d4>
    1148:	00f7d693          	srl	a3,a5,0xf
    114c:	07868593          	add	a1,a3,120
    1150:	07768613          	add	a2,a3,119
    1154:	00359593          	sll	a1,a1,0x3
    1158:	e61ff06f          	j	fb8 <_free_r+0x130>
    115c:	55400613          	li	a2,1364
    1160:	00d66c63          	bltu	a2,a3,1178 <_free_r+0x2f0>
    1164:	0127d693          	srl	a3,a5,0x12
    1168:	07d68593          	add	a1,a3,125
    116c:	07c68613          	add	a2,a3,124
    1170:	00359593          	sll	a1,a1,0x3
    1174:	e45ff06f          	j	fb8 <_free_r+0x130>
    1178:	3f800593          	li	a1,1016
    117c:	07e00613          	li	a2,126
    1180:	e39ff06f          	j	fb8 <_free_r+0x130>
    1184:	0017e693          	or	a3,a5,1
    1188:	00d72223          	sw	a3,4(a4)
    118c:	00f62023          	sw	a5,0(a2)
    1190:	dd5ff06f          	j	f64 <_free_r+0xdc>

00001194 <_malloc_r>:
    1194:	fd010113          	add	sp,sp,-48
    1198:	03212023          	sw	s2,32(sp)
    119c:	02112623          	sw	ra,44(sp)
    11a0:	02812423          	sw	s0,40(sp)
    11a4:	02912223          	sw	s1,36(sp)
    11a8:	01312e23          	sw	s3,28(sp)
    11ac:	00b58793          	add	a5,a1,11
    11b0:	01600713          	li	a4,22
    11b4:	00050913          	mv	s2,a0
    11b8:	08f76263          	bltu	a4,a5,123c <_malloc_r+0xa8>
    11bc:	01000793          	li	a5,16
    11c0:	20b7e663          	bltu	a5,a1,13cc <_malloc_r+0x238>
    11c4:	7b0000ef          	jal	1974 <__malloc_lock>
    11c8:	01800793          	li	a5,24
    11cc:	00200593          	li	a1,2
    11d0:	01000493          	li	s1,16
    11d4:	7ffff997          	auipc	s3,0x7ffff
    11d8:	f4c98993          	add	s3,s3,-180 # 80000120 <__malloc_av_>
    11dc:	00f987b3          	add	a5,s3,a5
    11e0:	0047a403          	lw	s0,4(a5)
    11e4:	ff878713          	add	a4,a5,-8
    11e8:	36e40463          	beq	s0,a4,1550 <_malloc_r+0x3bc>
    11ec:	00442783          	lw	a5,4(s0)
    11f0:	00c42683          	lw	a3,12(s0)
    11f4:	00842603          	lw	a2,8(s0)
    11f8:	ffc7f793          	and	a5,a5,-4
    11fc:	00f407b3          	add	a5,s0,a5
    1200:	0047a703          	lw	a4,4(a5)
    1204:	00d62623          	sw	a3,12(a2)
    1208:	00c6a423          	sw	a2,8(a3)
    120c:	00176713          	or	a4,a4,1
    1210:	00090513          	mv	a0,s2
    1214:	00e7a223          	sw	a4,4(a5)
    1218:	768000ef          	jal	1980 <__malloc_unlock>
    121c:	00840513          	add	a0,s0,8
    1220:	02c12083          	lw	ra,44(sp)
    1224:	02812403          	lw	s0,40(sp)
    1228:	02412483          	lw	s1,36(sp)
    122c:	02012903          	lw	s2,32(sp)
    1230:	01c12983          	lw	s3,28(sp)
    1234:	03010113          	add	sp,sp,48
    1238:	00008067          	ret
    123c:	ff87f493          	and	s1,a5,-8
    1240:	1807c663          	bltz	a5,13cc <_malloc_r+0x238>
    1244:	18b4e463          	bltu	s1,a1,13cc <_malloc_r+0x238>
    1248:	72c000ef          	jal	1974 <__malloc_lock>
    124c:	1f700793          	li	a5,503
    1250:	4097fa63          	bgeu	a5,s1,1664 <_malloc_r+0x4d0>
    1254:	0094d793          	srl	a5,s1,0x9
    1258:	18078263          	beqz	a5,13dc <_malloc_r+0x248>
    125c:	00400713          	li	a4,4
    1260:	36f76063          	bltu	a4,a5,15c0 <_malloc_r+0x42c>
    1264:	0064d793          	srl	a5,s1,0x6
    1268:	03978593          	add	a1,a5,57
    126c:	03878813          	add	a6,a5,56
    1270:	00359613          	sll	a2,a1,0x3
    1274:	7ffff997          	auipc	s3,0x7ffff
    1278:	eac98993          	add	s3,s3,-340 # 80000120 <__malloc_av_>
    127c:	00c98633          	add	a2,s3,a2
    1280:	00462403          	lw	s0,4(a2)
    1284:	ff860613          	add	a2,a2,-8
    1288:	02860863          	beq	a2,s0,12b8 <_malloc_r+0x124>
    128c:	00f00513          	li	a0,15
    1290:	0140006f          	j	12a4 <_malloc_r+0x110>
    1294:	00c42683          	lw	a3,12(s0)
    1298:	2a075863          	bgez	a4,1548 <_malloc_r+0x3b4>
    129c:	00d60e63          	beq	a2,a3,12b8 <_malloc_r+0x124>
    12a0:	00068413          	mv	s0,a3
    12a4:	00442783          	lw	a5,4(s0)
    12a8:	ffc7f793          	and	a5,a5,-4
    12ac:	40978733          	sub	a4,a5,s1
    12b0:	fee552e3          	bge	a0,a4,1294 <_malloc_r+0x100>
    12b4:	00080593          	mv	a1,a6
    12b8:	0109a403          	lw	s0,16(s3)
    12bc:	7ffff897          	auipc	a7,0x7ffff
    12c0:	e6c88893          	add	a7,a7,-404 # 80000128 <__malloc_av_+0x8>
    12c4:	27140e63          	beq	s0,a7,1540 <_malloc_r+0x3ac>
    12c8:	00442783          	lw	a5,4(s0)
    12cc:	00f00693          	li	a3,15
    12d0:	ffc7f793          	and	a5,a5,-4
    12d4:	40978733          	sub	a4,a5,s1
    12d8:	38e6cc63          	blt	a3,a4,1670 <_malloc_r+0x4dc>
    12dc:	0119aa23          	sw	a7,20(s3)
    12e0:	0119a823          	sw	a7,16(s3)
    12e4:	36075063          	bgez	a4,1644 <_malloc_r+0x4b0>
    12e8:	1ff00713          	li	a4,511
    12ec:	0049a503          	lw	a0,4(s3)
    12f0:	26f76863          	bltu	a4,a5,1560 <_malloc_r+0x3cc>
    12f4:	ff87f713          	and	a4,a5,-8
    12f8:	00870713          	add	a4,a4,8
    12fc:	00e98733          	add	a4,s3,a4
    1300:	00072683          	lw	a3,0(a4)
    1304:	0057d613          	srl	a2,a5,0x5
    1308:	00100793          	li	a5,1
    130c:	00c797b3          	sll	a5,a5,a2
    1310:	00f56533          	or	a0,a0,a5
    1314:	ff870793          	add	a5,a4,-8
    1318:	00f42623          	sw	a5,12(s0)
    131c:	00d42423          	sw	a3,8(s0)
    1320:	00a9a223          	sw	a0,4(s3)
    1324:	00872023          	sw	s0,0(a4)
    1328:	0086a623          	sw	s0,12(a3)
    132c:	4025d793          	sra	a5,a1,0x2
    1330:	00100613          	li	a2,1
    1334:	00f61633          	sll	a2,a2,a5
    1338:	0ac56a63          	bltu	a0,a2,13ec <_malloc_r+0x258>
    133c:	00a677b3          	and	a5,a2,a0
    1340:	02079463          	bnez	a5,1368 <_malloc_r+0x1d4>
    1344:	00161613          	sll	a2,a2,0x1
    1348:	ffc5f593          	and	a1,a1,-4
    134c:	00a677b3          	and	a5,a2,a0
    1350:	00458593          	add	a1,a1,4
    1354:	00079a63          	bnez	a5,1368 <_malloc_r+0x1d4>
    1358:	00161613          	sll	a2,a2,0x1
    135c:	00a677b3          	and	a5,a2,a0
    1360:	00458593          	add	a1,a1,4
    1364:	fe078ae3          	beqz	a5,1358 <_malloc_r+0x1c4>
    1368:	00f00813          	li	a6,15
    136c:	00359313          	sll	t1,a1,0x3
    1370:	00698333          	add	t1,s3,t1
    1374:	00030513          	mv	a0,t1
    1378:	00c52783          	lw	a5,12(a0)
    137c:	00058e13          	mv	t3,a1
    1380:	26f50263          	beq	a0,a5,15e4 <_malloc_r+0x450>
    1384:	0047a703          	lw	a4,4(a5)
    1388:	00078413          	mv	s0,a5
    138c:	00c7a783          	lw	a5,12(a5)
    1390:	ffc77713          	and	a4,a4,-4
    1394:	409706b3          	sub	a3,a4,s1
    1398:	26d84263          	blt	a6,a3,15fc <_malloc_r+0x468>
    139c:	fe06c2e3          	bltz	a3,1380 <_malloc_r+0x1ec>
    13a0:	00e40733          	add	a4,s0,a4
    13a4:	00472683          	lw	a3,4(a4)
    13a8:	00842603          	lw	a2,8(s0)
    13ac:	00090513          	mv	a0,s2
    13b0:	0016e693          	or	a3,a3,1
    13b4:	00d72223          	sw	a3,4(a4)
    13b8:	00f62623          	sw	a5,12(a2)
    13bc:	00c7a423          	sw	a2,8(a5)
    13c0:	5c0000ef          	jal	1980 <__malloc_unlock>
    13c4:	00840513          	add	a0,s0,8
    13c8:	e59ff06f          	j	1220 <_malloc_r+0x8c>
    13cc:	00c00793          	li	a5,12
    13d0:	00f92023          	sw	a5,0(s2)
    13d4:	00000513          	li	a0,0
    13d8:	e49ff06f          	j	1220 <_malloc_r+0x8c>
    13dc:	20000613          	li	a2,512
    13e0:	04000593          	li	a1,64
    13e4:	03f00813          	li	a6,63
    13e8:	e8dff06f          	j	1274 <_malloc_r+0xe0>
    13ec:	0089a403          	lw	s0,8(s3)
    13f0:	01612823          	sw	s6,16(sp)
    13f4:	00442783          	lw	a5,4(s0)
    13f8:	ffc7fb13          	and	s6,a5,-4
    13fc:	009b6863          	bltu	s6,s1,140c <_malloc_r+0x278>
    1400:	409b0733          	sub	a4,s6,s1
    1404:	00f00793          	li	a5,15
    1408:	0ee7ca63          	blt	a5,a4,14fc <_malloc_r+0x368>
    140c:	01912223          	sw	s9,4(sp)
    1410:	7ffffc97          	auipc	s9,0x7ffff
    1414:	2fcc8c93          	add	s9,s9,764 # 8000070c <__malloc_sbrk_base>
    1418:	000ca703          	lw	a4,0(s9)
    141c:	01412c23          	sw	s4,24(sp)
    1420:	01512a23          	sw	s5,20(sp)
    1424:	01712623          	sw	s7,12(sp)
    1428:	7ffffa97          	auipc	s5,0x7ffff
    142c:	304aaa83          	lw	s5,772(s5) # 8000072c <__malloc_top_pad>
    1430:	fff00793          	li	a5,-1
    1434:	01640a33          	add	s4,s0,s6
    1438:	01548ab3          	add	s5,s1,s5
    143c:	3ef70263          	beq	a4,a5,1820 <_malloc_r+0x68c>
    1440:	000017b7          	lui	a5,0x1
    1444:	00f78793          	add	a5,a5,15 # 100f <_free_r+0x187>
    1448:	00fa8ab3          	add	s5,s5,a5
    144c:	fffff7b7          	lui	a5,0xfffff
    1450:	00fafab3          	and	s5,s5,a5
    1454:	000a8593          	mv	a1,s5
    1458:	00090513          	mv	a0,s2
    145c:	254060ef          	jal	76b0 <_sbrk_r>
    1460:	fff00793          	li	a5,-1
    1464:	00050b93          	mv	s7,a0
    1468:	46f50663          	beq	a0,a5,18d4 <_malloc_r+0x740>
    146c:	01812423          	sw	s8,8(sp)
    1470:	25456863          	bltu	a0,s4,16c0 <_malloc_r+0x52c>
    1474:	7ffffc17          	auipc	s8,0x7ffff
    1478:	4c0c0c13          	add	s8,s8,1216 # 80000934 <__malloc_current_mallinfo>
    147c:	000c2583          	lw	a1,0(s8)
    1480:	00ba85b3          	add	a1,s5,a1
    1484:	00bc2023          	sw	a1,0(s8)
    1488:	00058713          	mv	a4,a1
    148c:	2caa1063          	bne	s4,a0,174c <_malloc_r+0x5b8>
    1490:	01451793          	sll	a5,a0,0x14
    1494:	2a079c63          	bnez	a5,174c <_malloc_r+0x5b8>
    1498:	0089ab83          	lw	s7,8(s3)
    149c:	015b07b3          	add	a5,s6,s5
    14a0:	0017e793          	or	a5,a5,1
    14a4:	00fba223          	sw	a5,4(s7)
    14a8:	7ffff717          	auipc	a4,0x7ffff
    14ac:	28070713          	add	a4,a4,640 # 80000728 <__malloc_max_sbrked_mem>
    14b0:	00072683          	lw	a3,0(a4)
    14b4:	00b6f463          	bgeu	a3,a1,14bc <_malloc_r+0x328>
    14b8:	00b72023          	sw	a1,0(a4)
    14bc:	7ffff717          	auipc	a4,0x7ffff
    14c0:	26870713          	add	a4,a4,616 # 80000724 <__malloc_max_total_mem>
    14c4:	00072683          	lw	a3,0(a4)
    14c8:	00b6f463          	bgeu	a3,a1,14d0 <_malloc_r+0x33c>
    14cc:	00b72023          	sw	a1,0(a4)
    14d0:	00812c03          	lw	s8,8(sp)
    14d4:	000b8413          	mv	s0,s7
    14d8:	ffc7f793          	and	a5,a5,-4
    14dc:	40978733          	sub	a4,a5,s1
    14e0:	3897ec63          	bltu	a5,s1,1878 <_malloc_r+0x6e4>
    14e4:	00f00793          	li	a5,15
    14e8:	38e7d863          	bge	a5,a4,1878 <_malloc_r+0x6e4>
    14ec:	01812a03          	lw	s4,24(sp)
    14f0:	01412a83          	lw	s5,20(sp)
    14f4:	00c12b83          	lw	s7,12(sp)
    14f8:	00412c83          	lw	s9,4(sp)
    14fc:	0014e793          	or	a5,s1,1
    1500:	00f42223          	sw	a5,4(s0)
    1504:	009404b3          	add	s1,s0,s1
    1508:	0099a423          	sw	s1,8(s3)
    150c:	00176713          	or	a4,a4,1
    1510:	00090513          	mv	a0,s2
    1514:	00e4a223          	sw	a4,4(s1)
    1518:	468000ef          	jal	1980 <__malloc_unlock>
    151c:	02c12083          	lw	ra,44(sp)
    1520:	00840513          	add	a0,s0,8
    1524:	02812403          	lw	s0,40(sp)
    1528:	01012b03          	lw	s6,16(sp)
    152c:	02412483          	lw	s1,36(sp)
    1530:	02012903          	lw	s2,32(sp)
    1534:	01c12983          	lw	s3,28(sp)
    1538:	03010113          	add	sp,sp,48
    153c:	00008067          	ret
    1540:	0049a503          	lw	a0,4(s3)
    1544:	de9ff06f          	j	132c <_malloc_r+0x198>
    1548:	00842603          	lw	a2,8(s0)
    154c:	cb1ff06f          	j	11fc <_malloc_r+0x68>
    1550:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1554:	00258593          	add	a1,a1,2
    1558:	d68780e3          	beq	a5,s0,12b8 <_malloc_r+0x124>
    155c:	c91ff06f          	j	11ec <_malloc_r+0x58>
    1560:	0097d713          	srl	a4,a5,0x9
    1564:	00400693          	li	a3,4
    1568:	14e6f263          	bgeu	a3,a4,16ac <_malloc_r+0x518>
    156c:	01400693          	li	a3,20
    1570:	32e6e663          	bltu	a3,a4,189c <_malloc_r+0x708>
    1574:	05c70613          	add	a2,a4,92
    1578:	05b70693          	add	a3,a4,91
    157c:	00361613          	sll	a2,a2,0x3
    1580:	00c98633          	add	a2,s3,a2
    1584:	00062703          	lw	a4,0(a2)
    1588:	ff860613          	add	a2,a2,-8
    158c:	00e61863          	bne	a2,a4,159c <_malloc_r+0x408>
    1590:	2980006f          	j	1828 <_malloc_r+0x694>
    1594:	00872703          	lw	a4,8(a4)
    1598:	00e60863          	beq	a2,a4,15a8 <_malloc_r+0x414>
    159c:	00472683          	lw	a3,4(a4)
    15a0:	ffc6f693          	and	a3,a3,-4
    15a4:	fed7e8e3          	bltu	a5,a3,1594 <_malloc_r+0x400>
    15a8:	00c72603          	lw	a2,12(a4)
    15ac:	00c42623          	sw	a2,12(s0)
    15b0:	00e42423          	sw	a4,8(s0)
    15b4:	00862423          	sw	s0,8(a2)
    15b8:	00872623          	sw	s0,12(a4)
    15bc:	d71ff06f          	j	132c <_malloc_r+0x198>
    15c0:	01400713          	li	a4,20
    15c4:	10f77863          	bgeu	a4,a5,16d4 <_malloc_r+0x540>
    15c8:	05400713          	li	a4,84
    15cc:	2ef76663          	bltu	a4,a5,18b8 <_malloc_r+0x724>
    15d0:	00c4d793          	srl	a5,s1,0xc
    15d4:	06f78593          	add	a1,a5,111
    15d8:	06e78813          	add	a6,a5,110
    15dc:	00359613          	sll	a2,a1,0x3
    15e0:	c95ff06f          	j	1274 <_malloc_r+0xe0>
    15e4:	001e0e13          	add	t3,t3,1
    15e8:	003e7793          	and	a5,t3,3
    15ec:	00850513          	add	a0,a0,8
    15f0:	10078063          	beqz	a5,16f0 <_malloc_r+0x55c>
    15f4:	00c52783          	lw	a5,12(a0)
    15f8:	d89ff06f          	j	1380 <_malloc_r+0x1ec>
    15fc:	00842603          	lw	a2,8(s0)
    1600:	0014e593          	or	a1,s1,1
    1604:	00b42223          	sw	a1,4(s0)
    1608:	00f62623          	sw	a5,12(a2)
    160c:	00c7a423          	sw	a2,8(a5)
    1610:	009404b3          	add	s1,s0,s1
    1614:	0099aa23          	sw	s1,20(s3)
    1618:	0099a823          	sw	s1,16(s3)
    161c:	0016e793          	or	a5,a3,1
    1620:	0114a623          	sw	a7,12(s1)
    1624:	0114a423          	sw	a7,8(s1)
    1628:	00f4a223          	sw	a5,4(s1)
    162c:	00e40733          	add	a4,s0,a4
    1630:	00090513          	mv	a0,s2
    1634:	00d72023          	sw	a3,0(a4)
    1638:	348000ef          	jal	1980 <__malloc_unlock>
    163c:	00840513          	add	a0,s0,8
    1640:	be1ff06f          	j	1220 <_malloc_r+0x8c>
    1644:	00f407b3          	add	a5,s0,a5
    1648:	0047a703          	lw	a4,4(a5)
    164c:	00090513          	mv	a0,s2
    1650:	00176713          	or	a4,a4,1
    1654:	00e7a223          	sw	a4,4(a5)
    1658:	328000ef          	jal	1980 <__malloc_unlock>
    165c:	00840513          	add	a0,s0,8
    1660:	bc1ff06f          	j	1220 <_malloc_r+0x8c>
    1664:	0034d593          	srl	a1,s1,0x3
    1668:	00848793          	add	a5,s1,8
    166c:	b69ff06f          	j	11d4 <_malloc_r+0x40>
    1670:	0014e693          	or	a3,s1,1
    1674:	00d42223          	sw	a3,4(s0)
    1678:	009404b3          	add	s1,s0,s1
    167c:	0099aa23          	sw	s1,20(s3)
    1680:	0099a823          	sw	s1,16(s3)
    1684:	00176693          	or	a3,a4,1
    1688:	0114a623          	sw	a7,12(s1)
    168c:	0114a423          	sw	a7,8(s1)
    1690:	00d4a223          	sw	a3,4(s1)
    1694:	00f407b3          	add	a5,s0,a5
    1698:	00090513          	mv	a0,s2
    169c:	00e7a023          	sw	a4,0(a5)
    16a0:	2e0000ef          	jal	1980 <__malloc_unlock>
    16a4:	00840513          	add	a0,s0,8
    16a8:	b79ff06f          	j	1220 <_malloc_r+0x8c>
    16ac:	0067d713          	srl	a4,a5,0x6
    16b0:	03970613          	add	a2,a4,57
    16b4:	03870693          	add	a3,a4,56
    16b8:	00361613          	sll	a2,a2,0x3
    16bc:	ec5ff06f          	j	1580 <_malloc_r+0x3ec>
    16c0:	07340c63          	beq	s0,s3,1738 <_malloc_r+0x5a4>
    16c4:	0089a403          	lw	s0,8(s3)
    16c8:	00812c03          	lw	s8,8(sp)
    16cc:	00442783          	lw	a5,4(s0)
    16d0:	e09ff06f          	j	14d8 <_malloc_r+0x344>
    16d4:	05c78593          	add	a1,a5,92
    16d8:	05b78813          	add	a6,a5,91
    16dc:	00359613          	sll	a2,a1,0x3
    16e0:	b95ff06f          	j	1274 <_malloc_r+0xe0>
    16e4:	00832783          	lw	a5,8(t1)
    16e8:	fff58593          	add	a1,a1,-1
    16ec:	28679063          	bne	a5,t1,196c <_malloc_r+0x7d8>
    16f0:	0035f793          	and	a5,a1,3
    16f4:	ff830313          	add	t1,t1,-8
    16f8:	fe0796e3          	bnez	a5,16e4 <_malloc_r+0x550>
    16fc:	0049a703          	lw	a4,4(s3)
    1700:	fff64793          	not	a5,a2
    1704:	00e7f7b3          	and	a5,a5,a4
    1708:	00f9a223          	sw	a5,4(s3)
    170c:	00161613          	sll	a2,a2,0x1
    1710:	ccc7eee3          	bltu	a5,a2,13ec <_malloc_r+0x258>
    1714:	cc060ce3          	beqz	a2,13ec <_malloc_r+0x258>
    1718:	00f67733          	and	a4,a2,a5
    171c:	00071a63          	bnez	a4,1730 <_malloc_r+0x59c>
    1720:	00161613          	sll	a2,a2,0x1
    1724:	00f67733          	and	a4,a2,a5
    1728:	004e0e13          	add	t3,t3,4
    172c:	fe070ae3          	beqz	a4,1720 <_malloc_r+0x58c>
    1730:	000e0593          	mv	a1,t3
    1734:	c39ff06f          	j	136c <_malloc_r+0x1d8>
    1738:	7ffffc17          	auipc	s8,0x7ffff
    173c:	1fcc0c13          	add	s8,s8,508 # 80000934 <__malloc_current_mallinfo>
    1740:	000c2703          	lw	a4,0(s8)
    1744:	00ea8733          	add	a4,s5,a4
    1748:	00ec2023          	sw	a4,0(s8)
    174c:	000ca683          	lw	a3,0(s9)
    1750:	fff00793          	li	a5,-1
    1754:	18f68663          	beq	a3,a5,18e0 <_malloc_r+0x74c>
    1758:	414b87b3          	sub	a5,s7,s4
    175c:	00e787b3          	add	a5,a5,a4
    1760:	00fc2023          	sw	a5,0(s8)
    1764:	007bfc93          	and	s9,s7,7
    1768:	0c0c8c63          	beqz	s9,1840 <_malloc_r+0x6ac>
    176c:	419b8bb3          	sub	s7,s7,s9
    1770:	000017b7          	lui	a5,0x1
    1774:	00878793          	add	a5,a5,8 # 1008 <_free_r+0x180>
    1778:	008b8b93          	add	s7,s7,8
    177c:	419785b3          	sub	a1,a5,s9
    1780:	015b8ab3          	add	s5,s7,s5
    1784:	415585b3          	sub	a1,a1,s5
    1788:	01459593          	sll	a1,a1,0x14
    178c:	0145da13          	srl	s4,a1,0x14
    1790:	000a0593          	mv	a1,s4
    1794:	00090513          	mv	a0,s2
    1798:	719050ef          	jal	76b0 <_sbrk_r>
    179c:	fff00793          	li	a5,-1
    17a0:	18f50063          	beq	a0,a5,1920 <_malloc_r+0x78c>
    17a4:	41750533          	sub	a0,a0,s7
    17a8:	01450ab3          	add	s5,a0,s4
    17ac:	000c2703          	lw	a4,0(s8)
    17b0:	0179a423          	sw	s7,8(s3)
    17b4:	001ae793          	or	a5,s5,1
    17b8:	00ea05b3          	add	a1,s4,a4
    17bc:	00bc2023          	sw	a1,0(s8)
    17c0:	00fba223          	sw	a5,4(s7)
    17c4:	cf3402e3          	beq	s0,s3,14a8 <_malloc_r+0x314>
    17c8:	00f00693          	li	a3,15
    17cc:	0b66f063          	bgeu	a3,s6,186c <_malloc_r+0x6d8>
    17d0:	00442703          	lw	a4,4(s0)
    17d4:	ff4b0793          	add	a5,s6,-12
    17d8:	ff87f793          	and	a5,a5,-8
    17dc:	00177713          	and	a4,a4,1
    17e0:	00f76733          	or	a4,a4,a5
    17e4:	00e42223          	sw	a4,4(s0)
    17e8:	00500613          	li	a2,5
    17ec:	00f40733          	add	a4,s0,a5
    17f0:	00c72223          	sw	a2,4(a4)
    17f4:	00c72423          	sw	a2,8(a4)
    17f8:	00f6e663          	bltu	a3,a5,1804 <_malloc_r+0x670>
    17fc:	004ba783          	lw	a5,4(s7)
    1800:	ca9ff06f          	j	14a8 <_malloc_r+0x314>
    1804:	00840593          	add	a1,s0,8
    1808:	00090513          	mv	a0,s2
    180c:	e7cff0ef          	jal	e88 <_free_r>
    1810:	0089ab83          	lw	s7,8(s3)
    1814:	000c2583          	lw	a1,0(s8)
    1818:	004ba783          	lw	a5,4(s7)
    181c:	c8dff06f          	j	14a8 <_malloc_r+0x314>
    1820:	010a8a93          	add	s5,s5,16
    1824:	c31ff06f          	j	1454 <_malloc_r+0x2c0>
    1828:	4026d693          	sra	a3,a3,0x2
    182c:	00100793          	li	a5,1
    1830:	00d797b3          	sll	a5,a5,a3
    1834:	00f56533          	or	a0,a0,a5
    1838:	00a9a223          	sw	a0,4(s3)
    183c:	d71ff06f          	j	15ac <_malloc_r+0x418>
    1840:	015b85b3          	add	a1,s7,s5
    1844:	40b005b3          	neg	a1,a1
    1848:	01459593          	sll	a1,a1,0x14
    184c:	0145da13          	srl	s4,a1,0x14
    1850:	000a0593          	mv	a1,s4
    1854:	00090513          	mv	a0,s2
    1858:	659050ef          	jal	76b0 <_sbrk_r>
    185c:	fff00793          	li	a5,-1
    1860:	f4f512e3          	bne	a0,a5,17a4 <_malloc_r+0x610>
    1864:	00000a13          	li	s4,0
    1868:	f45ff06f          	j	17ac <_malloc_r+0x618>
    186c:	00812c03          	lw	s8,8(sp)
    1870:	00100793          	li	a5,1
    1874:	00fba223          	sw	a5,4(s7)
    1878:	00090513          	mv	a0,s2
    187c:	104000ef          	jal	1980 <__malloc_unlock>
    1880:	00000513          	li	a0,0
    1884:	01812a03          	lw	s4,24(sp)
    1888:	01412a83          	lw	s5,20(sp)
    188c:	01012b03          	lw	s6,16(sp)
    1890:	00c12b83          	lw	s7,12(sp)
    1894:	00412c83          	lw	s9,4(sp)
    1898:	989ff06f          	j	1220 <_malloc_r+0x8c>
    189c:	05400693          	li	a3,84
    18a0:	04e6e463          	bltu	a3,a4,18e8 <_malloc_r+0x754>
    18a4:	00c7d713          	srl	a4,a5,0xc
    18a8:	06f70613          	add	a2,a4,111
    18ac:	06e70693          	add	a3,a4,110
    18b0:	00361613          	sll	a2,a2,0x3
    18b4:	ccdff06f          	j	1580 <_malloc_r+0x3ec>
    18b8:	15400713          	li	a4,340
    18bc:	04f76463          	bltu	a4,a5,1904 <_malloc_r+0x770>
    18c0:	00f4d793          	srl	a5,s1,0xf
    18c4:	07878593          	add	a1,a5,120
    18c8:	07778813          	add	a6,a5,119
    18cc:	00359613          	sll	a2,a1,0x3
    18d0:	9a5ff06f          	j	1274 <_malloc_r+0xe0>
    18d4:	0089a403          	lw	s0,8(s3)
    18d8:	00442783          	lw	a5,4(s0)
    18dc:	bfdff06f          	j	14d8 <_malloc_r+0x344>
    18e0:	017ca023          	sw	s7,0(s9)
    18e4:	e81ff06f          	j	1764 <_malloc_r+0x5d0>
    18e8:	15400693          	li	a3,340
    18ec:	04e6e463          	bltu	a3,a4,1934 <_malloc_r+0x7a0>
    18f0:	00f7d713          	srl	a4,a5,0xf
    18f4:	07870613          	add	a2,a4,120
    18f8:	07770693          	add	a3,a4,119
    18fc:	00361613          	sll	a2,a2,0x3
    1900:	c81ff06f          	j	1580 <_malloc_r+0x3ec>
    1904:	55400713          	li	a4,1364
    1908:	04f76463          	bltu	a4,a5,1950 <_malloc_r+0x7bc>
    190c:	0124d793          	srl	a5,s1,0x12
    1910:	07d78593          	add	a1,a5,125
    1914:	07c78813          	add	a6,a5,124
    1918:	00359613          	sll	a2,a1,0x3
    191c:	959ff06f          	j	1274 <_malloc_r+0xe0>
    1920:	ff8c8c93          	add	s9,s9,-8
    1924:	019a8ab3          	add	s5,s5,s9
    1928:	417a8ab3          	sub	s5,s5,s7
    192c:	00000a13          	li	s4,0
    1930:	e7dff06f          	j	17ac <_malloc_r+0x618>
    1934:	55400693          	li	a3,1364
    1938:	02e6e463          	bltu	a3,a4,1960 <_malloc_r+0x7cc>
    193c:	0127d713          	srl	a4,a5,0x12
    1940:	07d70613          	add	a2,a4,125
    1944:	07c70693          	add	a3,a4,124
    1948:	00361613          	sll	a2,a2,0x3
    194c:	c35ff06f          	j	1580 <_malloc_r+0x3ec>
    1950:	3f800613          	li	a2,1016
    1954:	07f00593          	li	a1,127
    1958:	07e00813          	li	a6,126
    195c:	919ff06f          	j	1274 <_malloc_r+0xe0>
    1960:	3f800613          	li	a2,1016
    1964:	07e00693          	li	a3,126
    1968:	c19ff06f          	j	1580 <_malloc_r+0x3ec>
    196c:	0049a783          	lw	a5,4(s3)
    1970:	d9dff06f          	j	170c <_malloc_r+0x578>

00001974 <__malloc_lock>:
    1974:	7ffff517          	auipc	a0,0x7ffff
    1978:	da850513          	add	a0,a0,-600 # 8000071c <__lock___malloc_recursive_mutex>
    197c:	8b4ff06f          	j	a30 <__retarget_lock_acquire_recursive>

00001980 <__malloc_unlock>:
    1980:	7ffff517          	auipc	a0,0x7ffff
    1984:	d9c50513          	add	a0,a0,-612 # 8000071c <__lock___malloc_recursive_mutex>
    1988:	8acff06f          	j	a34 <__retarget_lock_release_recursive>

0000198c <_vfprintf_r>:
    198c:	e7010113          	add	sp,sp,-400
    1990:	18112623          	sw	ra,396(sp)
    1994:	00b12423          	sw	a1,8(sp)
    1998:	00c12623          	sw	a2,12(sp)
    199c:	00d12a23          	sw	a3,20(sp)
    19a0:	17312e23          	sw	s3,380(sp)
    19a4:	18812423          	sw	s0,392(sp)
    19a8:	00050993          	mv	s3,a0
    19ac:	3d9050ef          	jal	7584 <_localeconv_r>
    19b0:	00052783          	lw	a5,0(a0)
    19b4:	00078513          	mv	a0,a5
    19b8:	02f12a23          	sw	a5,52(sp)
    19bc:	afcff0ef          	jal	cb8 <strlen>
    19c0:	00050713          	mv	a4,a0
    19c4:	00800613          	li	a2,8
    19c8:	00000593          	li	a1,0
    19cc:	09010513          	add	a0,sp,144
    19d0:	02e12823          	sw	a4,48(sp)
    19d4:	864ff0ef          	jal	a38 <memset>
    19d8:	00c12783          	lw	a5,12(sp)
    19dc:	00098863          	beqz	s3,19ec <_vfprintf_r+0x60>
    19e0:	0349a703          	lw	a4,52(s3)
    19e4:	00071463          	bnez	a4,19ec <_vfprintf_r+0x60>
    19e8:	29d0106f          	j	3484 <_vfprintf_r+0x1af8>
    19ec:	00812703          	lw	a4,8(sp)
    19f0:	06472683          	lw	a3,100(a4)
    19f4:	00c71703          	lh	a4,12(a4)
    19f8:	0016f693          	and	a3,a3,1
    19fc:	00069863          	bnez	a3,1a0c <_vfprintf_r+0x80>
    1a00:	20077693          	and	a3,a4,512
    1a04:	00069463          	bnez	a3,1a0c <_vfprintf_r+0x80>
    1a08:	3ec0106f          	j	2df4 <_vfprintf_r+0x1468>
    1a0c:	01271693          	sll	a3,a4,0x12
    1a10:	0206c863          	bltz	a3,1a40 <_vfprintf_r+0xb4>
    1a14:	00812503          	lw	a0,8(sp)
    1a18:	000025b7          	lui	a1,0x2
    1a1c:	ffffe637          	lui	a2,0xffffe
    1a20:	06452683          	lw	a3,100(a0)
    1a24:	00b76733          	or	a4,a4,a1
    1a28:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1a2c:	01071713          	sll	a4,a4,0x10
    1a30:	41075713          	sra	a4,a4,0x10
    1a34:	00c6f6b3          	and	a3,a3,a2
    1a38:	00e51623          	sh	a4,12(a0)
    1a3c:	06d52223          	sw	a3,100(a0)
    1a40:	00877693          	and	a3,a4,8
    1a44:	2a068063          	beqz	a3,1ce4 <_vfprintf_r+0x358>
    1a48:	00812683          	lw	a3,8(sp)
    1a4c:	0106a683          	lw	a3,16(a3)
    1a50:	28068a63          	beqz	a3,1ce4 <_vfprintf_r+0x358>
    1a54:	01a77693          	and	a3,a4,26
    1a58:	00a00613          	li	a2,10
    1a5c:	2ac68c63          	beq	a3,a2,1d14 <_vfprintf_r+0x388>
    1a60:	0ac10713          	add	a4,sp,172
    1a64:	17512a23          	sw	s5,372(sp)
    1a68:	17812423          	sw	s8,360(sp)
    1a6c:	15b12e23          	sw	s11,348(sp)
    1a70:	18912223          	sw	s1,388(sp)
    1a74:	19212023          	sw	s2,384(sp)
    1a78:	17412c23          	sw	s4,376(sp)
    1a7c:	17612823          	sw	s6,368(sp)
    1a80:	17712623          	sw	s7,364(sp)
    1a84:	17912223          	sw	s9,356(sp)
    1a88:	17a12023          	sw	s10,352(sp)
    1a8c:	0ae12023          	sw	a4,160(sp)
    1a90:	0a012423          	sw	zero,168(sp)
    1a94:	0a012223          	sw	zero,164(sp)
    1a98:	00012c23          	sw	zero,24(sp)
    1a9c:	02012423          	sw	zero,40(sp)
    1aa0:	02012623          	sw	zero,44(sp)
    1aa4:	00070413          	mv	s0,a4
    1aa8:	02012c23          	sw	zero,56(sp)
    1aac:	04012023          	sw	zero,64(sp)
    1ab0:	02012e23          	sw	zero,60(sp)
    1ab4:	04012623          	sw	zero,76(sp)
    1ab8:	04012423          	sw	zero,72(sp)
    1abc:	00012623          	sw	zero,12(sp)
    1ac0:	7ffffa97          	auipc	s5,0x7ffff
    1ac4:	a74a8a93          	add	s5,s5,-1420 # 80000534 <__global_locale>
    1ac8:	02500d93          	li	s11,37
    1acc:	00078c13          	mv	s8,a5
    1ad0:	000c0913          	mv	s2,s8
    1ad4:	0e4aa483          	lw	s1,228(s5)
    1ad8:	2a1050ef          	jal	7578 <__locale_mb_cur_max>
    1adc:	00050693          	mv	a3,a0
    1ae0:	09010713          	add	a4,sp,144
    1ae4:	00090613          	mv	a2,s2
    1ae8:	08010593          	add	a1,sp,128
    1aec:	00098513          	mv	a0,s3
    1af0:	000480e7          	jalr	s1
    1af4:	2c050a63          	beqz	a0,1dc8 <_vfprintf_r+0x43c>
    1af8:	2a054a63          	bltz	a0,1dac <_vfprintf_r+0x420>
    1afc:	08012783          	lw	a5,128(sp)
    1b00:	01b78663          	beq	a5,s11,1b0c <_vfprintf_r+0x180>
    1b04:	00a90933          	add	s2,s2,a0
    1b08:	fcdff06f          	j	1ad4 <_vfprintf_r+0x148>
    1b0c:	00050493          	mv	s1,a0
    1b10:	41890cb3          	sub	s9,s2,s8
    1b14:	2d891063          	bne	s2,s8,1dd4 <_vfprintf_r+0x448>
    1b18:	fff00313          	li	t1,-1
    1b1c:	00000e93          	li	t4,0
    1b20:	00194e03          	lbu	t3,1(s2)
    1b24:	06010ba3          	sb	zero,119(sp)
    1b28:	00190913          	add	s2,s2,1
    1b2c:	00000b93          	li	s7,0
    1b30:	05a00493          	li	s1,90
    1b34:	000e8a13          	mv	s4,t4
    1b38:	00030b13          	mv	s6,t1
    1b3c:	00190913          	add	s2,s2,1
    1b40:	fe0e0793          	add	a5,t3,-32
    1b44:	04f4ea63          	bltu	s1,a5,1b98 <_vfprintf_r+0x20c>
    1b48:	0000d717          	auipc	a4,0xd
    1b4c:	17c70713          	add	a4,a4,380 # ecc4 <_ctype_+0x104>
    1b50:	00279793          	sll	a5,a5,0x2
    1b54:	00e787b3          	add	a5,a5,a4
    1b58:	0007a783          	lw	a5,0(a5)
    1b5c:	00e787b3          	add	a5,a5,a4
    1b60:	00078067          	jr	a5
    1b64:	00000b93          	li	s7,0
    1b68:	fd0e0713          	add	a4,t3,-48
    1b6c:	00900693          	li	a3,9
    1b70:	00094e03          	lbu	t3,0(s2)
    1b74:	002b9793          	sll	a5,s7,0x2
    1b78:	017787b3          	add	a5,a5,s7
    1b7c:	00179793          	sll	a5,a5,0x1
    1b80:	00f70bb3          	add	s7,a4,a5
    1b84:	fd0e0713          	add	a4,t3,-48
    1b88:	00190913          	add	s2,s2,1
    1b8c:	fee6f2e3          	bgeu	a3,a4,1b70 <_vfprintf_r+0x1e4>
    1b90:	fe0e0793          	add	a5,t3,-32
    1b94:	faf4fae3          	bgeu	s1,a5,1b48 <_vfprintf_r+0x1bc>
    1b98:	000a0e93          	mv	t4,s4
    1b9c:	260e0a63          	beqz	t3,1e10 <_vfprintf_r+0x484>
    1ba0:	0fc10623          	sb	t3,236(sp)
    1ba4:	06010ba3          	sb	zero,119(sp)
    1ba8:	00100c93          	li	s9,1
    1bac:	00000613          	li	a2,0
    1bb0:	00012823          	sw	zero,16(sp)
    1bb4:	00100d13          	li	s10,1
    1bb8:	00000313          	li	t1,0
    1bbc:	02012223          	sw	zero,36(sp)
    1bc0:	02012023          	sw	zero,32(sp)
    1bc4:	00000a13          	li	s4,0
    1bc8:	0ec10c13          	add	s8,sp,236
    1bcc:	002ef293          	and	t0,t4,2
    1bd0:	00028463          	beqz	t0,1bd8 <_vfprintf_r+0x24c>
    1bd4:	002c8c93          	add	s9,s9,2
    1bd8:	084eff93          	and	t6,t4,132
    1bdc:	0a812483          	lw	s1,168(sp)
    1be0:	000f9663          	bnez	t6,1bec <_vfprintf_r+0x260>
    1be4:	419b8733          	sub	a4,s7,s9
    1be8:	40e04663          	bgtz	a4,1ff4 <_vfprintf_r+0x668>
    1bec:	02060a63          	beqz	a2,1c20 <_vfprintf_r+0x294>
    1bf0:	0a412703          	lw	a4,164(sp)
    1bf4:	07710613          	add	a2,sp,119
    1bf8:	00148493          	add	s1,s1,1
    1bfc:	00170713          	add	a4,a4,1
    1c00:	00100793          	li	a5,1
    1c04:	00c42023          	sw	a2,0(s0)
    1c08:	00f42223          	sw	a5,4(s0)
    1c0c:	0a912423          	sw	s1,168(sp)
    1c10:	0ae12223          	sw	a4,164(sp)
    1c14:	00700613          	li	a2,7
    1c18:	00840413          	add	s0,s0,8
    1c1c:	4ce64863          	blt	a2,a4,20ec <_vfprintf_r+0x760>
    1c20:	02028a63          	beqz	t0,1c54 <_vfprintf_r+0x2c8>
    1c24:	0a412703          	lw	a4,164(sp)
    1c28:	07810613          	add	a2,sp,120
    1c2c:	00c42023          	sw	a2,0(s0)
    1c30:	00248493          	add	s1,s1,2
    1c34:	00200613          	li	a2,2
    1c38:	00170713          	add	a4,a4,1
    1c3c:	00c42223          	sw	a2,4(s0)
    1c40:	0a912423          	sw	s1,168(sp)
    1c44:	0ae12223          	sw	a4,164(sp)
    1c48:	00700613          	li	a2,7
    1c4c:	00840413          	add	s0,s0,8
    1c50:	5ce644e3          	blt	a2,a4,2a18 <_vfprintf_r+0x108c>
    1c54:	08000713          	li	a4,128
    1c58:	3aef80e3          	beq	t6,a4,27f8 <_vfprintf_r+0xe6c>
    1c5c:	41a30b33          	sub	s6,t1,s10
    1c60:	4b604ae3          	bgtz	s6,2914 <_vfprintf_r+0xf88>
    1c64:	100ef713          	and	a4,t4,256
    1c68:	1a0710e3          	bnez	a4,2608 <_vfprintf_r+0xc7c>
    1c6c:	0a412783          	lw	a5,164(sp)
    1c70:	01a484b3          	add	s1,s1,s10
    1c74:	01842023          	sw	s8,0(s0)
    1c78:	00178793          	add	a5,a5,1
    1c7c:	01a42223          	sw	s10,4(s0)
    1c80:	0a912423          	sw	s1,168(sp)
    1c84:	0af12223          	sw	a5,164(sp)
    1c88:	00700713          	li	a4,7
    1c8c:	58f74c63          	blt	a4,a5,2224 <_vfprintf_r+0x898>
    1c90:	00840413          	add	s0,s0,8
    1c94:	004eff13          	and	t5,t4,4
    1c98:	000f0663          	beqz	t5,1ca4 <_vfprintf_r+0x318>
    1c9c:	419b8d33          	sub	s10,s7,s9
    1ca0:	5ba04ce3          	bgtz	s10,2a58 <_vfprintf_r+0x10cc>
    1ca4:	000b8e93          	mv	t4,s7
    1ca8:	019bd463          	bge	s7,s9,1cb0 <_vfprintf_r+0x324>
    1cac:	000c8e93          	mv	t4,s9
    1cb0:	00c12783          	lw	a5,12(sp)
    1cb4:	01d787b3          	add	a5,a5,t4
    1cb8:	00f12623          	sw	a5,12(sp)
    1cbc:	18049663          	bnez	s1,1e48 <_vfprintf_r+0x4bc>
    1cc0:	01012783          	lw	a5,16(sp)
    1cc4:	0a012223          	sw	zero,164(sp)
    1cc8:	00078863          	beqz	a5,1cd8 <_vfprintf_r+0x34c>
    1ccc:	01012583          	lw	a1,16(sp)
    1cd0:	00098513          	mv	a0,s3
    1cd4:	9b4ff0ef          	jal	e88 <_free_r>
    1cd8:	0ac10413          	add	s0,sp,172
    1cdc:	00090c13          	mv	s8,s2
    1ce0:	df1ff06f          	j	1ad0 <_vfprintf_r+0x144>
    1ce4:	00812403          	lw	s0,8(sp)
    1ce8:	00098513          	mv	a0,s3
    1cec:	00f12623          	sw	a5,12(sp)
    1cf0:	00040593          	mv	a1,s0
    1cf4:	3a4050ef          	jal	7098 <__swsetup_r>
    1cf8:	00050463          	beqz	a0,1d00 <_vfprintf_r+0x374>
    1cfc:	5600206f          	j	425c <_vfprintf_r+0x28d0>
    1d00:	00c41703          	lh	a4,12(s0)
    1d04:	00a00613          	li	a2,10
    1d08:	00c12783          	lw	a5,12(sp)
    1d0c:	01a77693          	and	a3,a4,26
    1d10:	d4c698e3          	bne	a3,a2,1a60 <_vfprintf_r+0xd4>
    1d14:	00812603          	lw	a2,8(sp)
    1d18:	00e61683          	lh	a3,14(a2)
    1d1c:	d406c2e3          	bltz	a3,1a60 <_vfprintf_r+0xd4>
    1d20:	06462683          	lw	a3,100(a2)
    1d24:	0016f693          	and	a3,a3,1
    1d28:	00069863          	bnez	a3,1d38 <_vfprintf_r+0x3ac>
    1d2c:	20077713          	and	a4,a4,512
    1d30:	00071463          	bnez	a4,1d38 <_vfprintf_r+0x3ac>
    1d34:	53d0106f          	j	3a70 <_vfprintf_r+0x20e4>
    1d38:	01412683          	lw	a3,20(sp)
    1d3c:	00812583          	lw	a1,8(sp)
    1d40:	00098513          	mv	a0,s3
    1d44:	00078613          	mv	a2,a5
    1d48:	0e5020ef          	jal	462c <__sbprintf>
    1d4c:	18c12083          	lw	ra,396(sp)
    1d50:	18812403          	lw	s0,392(sp)
    1d54:	00a12623          	sw	a0,12(sp)
    1d58:	00c12503          	lw	a0,12(sp)
    1d5c:	17c12983          	lw	s3,380(sp)
    1d60:	19010113          	add	sp,sp,400
    1d64:	00008067          	ret
    1d68:	00098513          	mv	a0,s3
    1d6c:	019050ef          	jal	7584 <_localeconv_r>
    1d70:	00452783          	lw	a5,4(a0)
    1d74:	00078513          	mv	a0,a5
    1d78:	04f12423          	sw	a5,72(sp)
    1d7c:	f3dfe0ef          	jal	cb8 <strlen>
    1d80:	00050793          	mv	a5,a0
    1d84:	00098513          	mv	a0,s3
    1d88:	00078c93          	mv	s9,a5
    1d8c:	04f12623          	sw	a5,76(sp)
    1d90:	7f4050ef          	jal	7584 <_localeconv_r>
    1d94:	00852703          	lw	a4,8(a0)
    1d98:	02e12e23          	sw	a4,60(sp)
    1d9c:	000c8463          	beqz	s9,1da4 <_vfprintf_r+0x418>
    1da0:	1ec0106f          	j	2f8c <_vfprintf_r+0x1600>
    1da4:	00094e03          	lbu	t3,0(s2)
    1da8:	d95ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    1dac:	00800613          	li	a2,8
    1db0:	00000593          	li	a1,0
    1db4:	09010513          	add	a0,sp,144
    1db8:	c81fe0ef          	jal	a38 <memset>
    1dbc:	00100513          	li	a0,1
    1dc0:	00a90933          	add	s2,s2,a0
    1dc4:	d11ff06f          	j	1ad4 <_vfprintf_r+0x148>
    1dc8:	00050493          	mv	s1,a0
    1dcc:	41890cb3          	sub	s9,s2,s8
    1dd0:	05890063          	beq	s2,s8,1e10 <_vfprintf_r+0x484>
    1dd4:	0a812683          	lw	a3,168(sp)
    1dd8:	0a412703          	lw	a4,164(sp)
    1ddc:	01842023          	sw	s8,0(s0)
    1de0:	019686b3          	add	a3,a3,s9
    1de4:	00170713          	add	a4,a4,1
    1de8:	01942223          	sw	s9,4(s0)
    1dec:	0ad12423          	sw	a3,168(sp)
    1df0:	0ae12223          	sw	a4,164(sp)
    1df4:	00700693          	li	a3,7
    1df8:	00840413          	add	s0,s0,8
    1dfc:	02e6c863          	blt	a3,a4,1e2c <_vfprintf_r+0x4a0>
    1e00:	00c12783          	lw	a5,12(sp)
    1e04:	019787b3          	add	a5,a5,s9
    1e08:	00f12623          	sw	a5,12(sp)
    1e0c:	d00496e3          	bnez	s1,1b18 <_vfprintf_r+0x18c>
    1e10:	0a812783          	lw	a5,168(sp)
    1e14:	00078463          	beqz	a5,1e1c <_vfprintf_r+0x490>
    1e18:	4090106f          	j	3a20 <_vfprintf_r+0x2094>
    1e1c:	00812783          	lw	a5,8(sp)
    1e20:	0a012223          	sw	zero,164(sp)
    1e24:	00c79783          	lh	a5,12(a5)
    1e28:	0500006f          	j	1e78 <_vfprintf_r+0x4ec>
    1e2c:	00812583          	lw	a1,8(sp)
    1e30:	0a010613          	add	a2,sp,160
    1e34:	00098513          	mv	a0,s3
    1e38:	211020ef          	jal	4848 <__sprint_r>
    1e3c:	02051a63          	bnez	a0,1e70 <_vfprintf_r+0x4e4>
    1e40:	0ac10413          	add	s0,sp,172
    1e44:	fbdff06f          	j	1e00 <_vfprintf_r+0x474>
    1e48:	00812583          	lw	a1,8(sp)
    1e4c:	0a010613          	add	a2,sp,160
    1e50:	00098513          	mv	a0,s3
    1e54:	1f5020ef          	jal	4848 <__sprint_r>
    1e58:	e60504e3          	beqz	a0,1cc0 <_vfprintf_r+0x334>
    1e5c:	01012283          	lw	t0,16(sp)
    1e60:	00028863          	beqz	t0,1e70 <_vfprintf_r+0x4e4>
    1e64:	00028593          	mv	a1,t0
    1e68:	00098513          	mv	a0,s3
    1e6c:	81cff0ef          	jal	e88 <_free_r>
    1e70:	00812783          	lw	a5,8(sp)
    1e74:	00c79783          	lh	a5,12(a5)
    1e78:	00812703          	lw	a4,8(sp)
    1e7c:	06472703          	lw	a4,100(a4)
    1e80:	00177713          	and	a4,a4,1
    1e84:	3c070463          	beqz	a4,224c <_vfprintf_r+0x8c0>
    1e88:	0407f793          	and	a5,a5,64
    1e8c:	18412483          	lw	s1,388(sp)
    1e90:	18012903          	lw	s2,384(sp)
    1e94:	17812a03          	lw	s4,376(sp)
    1e98:	17412a83          	lw	s5,372(sp)
    1e9c:	17012b03          	lw	s6,368(sp)
    1ea0:	16c12b83          	lw	s7,364(sp)
    1ea4:	16812c03          	lw	s8,360(sp)
    1ea8:	16412c83          	lw	s9,356(sp)
    1eac:	16012d03          	lw	s10,352(sp)
    1eb0:	15c12d83          	lw	s11,348(sp)
    1eb4:	00078463          	beqz	a5,1ebc <_vfprintf_r+0x530>
    1eb8:	3d00206f          	j	4288 <_vfprintf_r+0x28fc>
    1ebc:	18c12083          	lw	ra,396(sp)
    1ec0:	18812403          	lw	s0,392(sp)
    1ec4:	00c12503          	lw	a0,12(sp)
    1ec8:	17c12983          	lw	s3,380(sp)
    1ecc:	19010113          	add	sp,sp,400
    1ed0:	00008067          	ret
    1ed4:	008a7713          	and	a4,s4,8
    1ed8:	000a0e93          	mv	t4,s4
    1edc:	000b0313          	mv	t1,s6
    1ee0:	00070463          	beqz	a4,1ee8 <_vfprintf_r+0x55c>
    1ee4:	0200106f          	j	2f04 <_vfprintf_r+0x1578>
    1ee8:	01412783          	lw	a5,20(sp)
    1eec:	00778b13          	add	s6,a5,7
    1ef0:	ff8b7b13          	and	s6,s6,-8
    1ef4:	000b2783          	lw	a5,0(s6)
    1ef8:	02f12423          	sw	a5,40(sp)
    1efc:	004b2783          	lw	a5,4(s6)
    1f00:	02f12623          	sw	a5,44(sp)
    1f04:	008b0793          	add	a5,s6,8
    1f08:	00f12a23          	sw	a5,20(sp)
    1f0c:	02c12a03          	lw	s4,44(sp)
    1f10:	7fffe717          	auipc	a4,0x7fffe
    1f14:	79070713          	add	a4,a4,1936 # 800006a0 <__global_locale+0x16c>
    1f18:	00072c83          	lw	s9,0(a4)
    1f1c:	00472d03          	lw	s10,4(a4)
    1f20:	02812b03          	lw	s6,40(sp)
    1f24:	001a1493          	sll	s1,s4,0x1
    1f28:	0014d493          	srl	s1,s1,0x1
    1f2c:	000b0513          	mv	a0,s6
    1f30:	00048593          	mv	a1,s1
    1f34:	000c8613          	mv	a2,s9
    1f38:	000d0693          	mv	a3,s10
    1f3c:	02612223          	sw	t1,36(sp)
    1f40:	03c12023          	sw	t3,32(sp)
    1f44:	01d12823          	sw	t4,16(sp)
    1f48:	26c0c0ef          	jal	e1b4 <__unorddf2>
    1f4c:	01012e83          	lw	t4,16(sp)
    1f50:	02012e03          	lw	t3,32(sp)
    1f54:	02412303          	lw	t1,36(sp)
    1f58:	00050463          	beqz	a0,1f60 <_vfprintf_r+0x5d4>
    1f5c:	4080106f          	j	3364 <_vfprintf_r+0x19d8>
    1f60:	000b0513          	mv	a0,s6
    1f64:	00048593          	mv	a1,s1
    1f68:	000c8613          	mv	a2,s9
    1f6c:	000d0693          	mv	a3,s10
    1f70:	0a40b0ef          	jal	d014 <__ledf2>
    1f74:	01012e83          	lw	t4,16(sp)
    1f78:	02012e03          	lw	t3,32(sp)
    1f7c:	02412303          	lw	t1,36(sp)
    1f80:	00a04463          	bgtz	a0,1f88 <_vfprintf_r+0x5fc>
    1f84:	3e00106f          	j	3364 <_vfprintf_r+0x19d8>
    1f88:	000b0513          	mv	a0,s6
    1f8c:	000a0593          	mv	a1,s4
    1f90:	00000613          	li	a2,0
    1f94:	00000693          	li	a3,0
    1f98:	07c0b0ef          	jal	d014 <__ledf2>
    1f9c:	01012e83          	lw	t4,16(sp)
    1fa0:	02012e03          	lw	t3,32(sp)
    1fa4:	00055463          	bgez	a0,1fac <_vfprintf_r+0x620>
    1fa8:	6650106f          	j	3e0c <_vfprintf_r+0x2480>
    1fac:	07714603          	lbu	a2,119(sp)
    1fb0:	04700713          	li	a4,71
    1fb4:	0000dc17          	auipc	s8,0xd
    1fb8:	a20c0c13          	add	s8,s8,-1504 # e9d4 <__fini_array_end+0x90>
    1fbc:	01c74663          	blt	a4,t3,1fc8 <_vfprintf_r+0x63c>
    1fc0:	0000dc17          	auipc	s8,0xd
    1fc4:	a10c0c13          	add	s8,s8,-1520 # e9d0 <__fini_array_end+0x8c>
    1fc8:	00012823          	sw	zero,16(sp)
    1fcc:	02012223          	sw	zero,36(sp)
    1fd0:	02012023          	sw	zero,32(sp)
    1fd4:	f7fefe93          	and	t4,t4,-129
    1fd8:	00300c93          	li	s9,3
    1fdc:	00300d13          	li	s10,3
    1fe0:	00000313          	li	t1,0
    1fe4:	00000a13          	li	s4,0
    1fe8:	be0602e3          	beqz	a2,1bcc <_vfprintf_r+0x240>
    1fec:	001c8c93          	add	s9,s9,1
    1ff0:	bddff06f          	j	1bcc <_vfprintf_r+0x240>
    1ff4:	01000593          	li	a1,16
    1ff8:	0a412603          	lw	a2,164(sp)
    1ffc:	0000db17          	auipc	s6,0xd
    2000:	edcb0b13          	add	s6,s6,-292 # eed8 <blanks.1>
    2004:	0ae5dc63          	bge	a1,a4,20bc <_vfprintf_r+0x730>
    2008:	00040793          	mv	a5,s0
    200c:	00048693          	mv	a3,s1
    2010:	01000893          	li	a7,16
    2014:	000b0493          	mv	s1,s6
    2018:	00700393          	li	t2,7
    201c:	000a0b13          	mv	s6,s4
    2020:	04512223          	sw	t0,68(sp)
    2024:	05f12823          	sw	t6,80(sp)
    2028:	05d12a23          	sw	t4,84(sp)
    202c:	05c12c23          	sw	t3,88(sp)
    2030:	00070413          	mv	s0,a4
    2034:	00030a13          	mv	s4,t1
    2038:	00c0006f          	j	2044 <_vfprintf_r+0x6b8>
    203c:	ff040413          	add	s0,s0,-16
    2040:	0488da63          	bge	a7,s0,2094 <_vfprintf_r+0x708>
    2044:	01068693          	add	a3,a3,16
    2048:	00160613          	add	a2,a2,1
    204c:	0097a023          	sw	s1,0(a5)
    2050:	0117a223          	sw	a7,4(a5)
    2054:	0ad12423          	sw	a3,168(sp)
    2058:	0ac12223          	sw	a2,164(sp)
    205c:	00878793          	add	a5,a5,8
    2060:	fcc3dee3          	bge	t2,a2,203c <_vfprintf_r+0x6b0>
    2064:	00812583          	lw	a1,8(sp)
    2068:	0a010613          	add	a2,sp,160
    206c:	00098513          	mv	a0,s3
    2070:	7d8020ef          	jal	4848 <__sprint_r>
    2074:	de0514e3          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2078:	01000893          	li	a7,16
    207c:	ff040413          	add	s0,s0,-16
    2080:	0a812683          	lw	a3,168(sp)
    2084:	0a412603          	lw	a2,164(sp)
    2088:	0ac10793          	add	a5,sp,172
    208c:	00700393          	li	t2,7
    2090:	fa88cae3          	blt	a7,s0,2044 <_vfprintf_r+0x6b8>
    2094:	04412283          	lw	t0,68(sp)
    2098:	05012f83          	lw	t6,80(sp)
    209c:	05412e83          	lw	t4,84(sp)
    20a0:	05812e03          	lw	t3,88(sp)
    20a4:	000a0313          	mv	t1,s4
    20a8:	00040713          	mv	a4,s0
    20ac:	000b0a13          	mv	s4,s6
    20b0:	00078413          	mv	s0,a5
    20b4:	00048b13          	mv	s6,s1
    20b8:	00068493          	mv	s1,a3
    20bc:	00e484b3          	add	s1,s1,a4
    20c0:	00160613          	add	a2,a2,1
    20c4:	00e42223          	sw	a4,4(s0)
    20c8:	01642023          	sw	s6,0(s0)
    20cc:	0a912423          	sw	s1,168(sp)
    20d0:	0ac12223          	sw	a2,164(sp)
    20d4:	00700713          	li	a4,7
    20d8:	00c75463          	bge	a4,a2,20e0 <_vfprintf_r+0x754>
    20dc:	2380106f          	j	3314 <_vfprintf_r+0x1988>
    20e0:	07714603          	lbu	a2,119(sp)
    20e4:	00840413          	add	s0,s0,8
    20e8:	b05ff06f          	j	1bec <_vfprintf_r+0x260>
    20ec:	00812583          	lw	a1,8(sp)
    20f0:	0a010613          	add	a2,sp,160
    20f4:	00098513          	mv	a0,s3
    20f8:	04612e23          	sw	t1,92(sp)
    20fc:	05c12c23          	sw	t3,88(sp)
    2100:	05d12a23          	sw	t4,84(sp)
    2104:	05f12823          	sw	t6,80(sp)
    2108:	04512223          	sw	t0,68(sp)
    210c:	73c020ef          	jal	4848 <__sprint_r>
    2110:	d40516e3          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2114:	0a812483          	lw	s1,168(sp)
    2118:	05c12303          	lw	t1,92(sp)
    211c:	05812e03          	lw	t3,88(sp)
    2120:	05412e83          	lw	t4,84(sp)
    2124:	05012f83          	lw	t6,80(sp)
    2128:	04412283          	lw	t0,68(sp)
    212c:	0ac10413          	add	s0,sp,172
    2130:	af1ff06f          	j	1c20 <_vfprintf_r+0x294>
    2134:	0a412d03          	lw	s10,164(sp)
    2138:	01812783          	lw	a5,24(sp)
    213c:	00100693          	li	a3,1
    2140:	01842023          	sw	s8,0(s0)
    2144:	00148493          	add	s1,s1,1
    2148:	001d0d13          	add	s10,s10,1
    214c:	00840b13          	add	s6,s0,8
    2150:	32f6d0e3          	bge	a3,a5,2c70 <_vfprintf_r+0x12e4>
    2154:	00100693          	li	a3,1
    2158:	00d42223          	sw	a3,4(s0)
    215c:	0a912423          	sw	s1,168(sp)
    2160:	0ba12223          	sw	s10,164(sp)
    2164:	00700693          	li	a3,7
    2168:	01a6d463          	bge	a3,s10,2170 <_vfprintf_r+0x7e4>
    216c:	0680106f          	j	31d4 <_vfprintf_r+0x1848>
    2170:	03012783          	lw	a5,48(sp)
    2174:	03412703          	lw	a4,52(sp)
    2178:	001d0d13          	add	s10,s10,1
    217c:	00f484b3          	add	s1,s1,a5
    2180:	00eb2023          	sw	a4,0(s6)
    2184:	00fb2223          	sw	a5,4(s6)
    2188:	0a912423          	sw	s1,168(sp)
    218c:	0ba12223          	sw	s10,164(sp)
    2190:	00700693          	li	a3,7
    2194:	008b0b13          	add	s6,s6,8
    2198:	01a6d463          	bge	a3,s10,21a0 <_vfprintf_r+0x814>
    219c:	0680106f          	j	3204 <_vfprintf_r+0x1878>
    21a0:	02812603          	lw	a2,40(sp)
    21a4:	02c12683          	lw	a3,44(sp)
    21a8:	01812783          	lw	a5,24(sp)
    21ac:	00060513          	mv	a0,a2
    21b0:	00068593          	mv	a1,a3
    21b4:	00000613          	li	a2,0
    21b8:	00000693          	li	a3,0
    21bc:	03d12023          	sw	t4,32(sp)
    21c0:	fff78413          	add	s0,a5,-1
    21c4:	4c50a0ef          	jal	ce88 <__eqdf2>
    21c8:	02012e83          	lw	t4,32(sp)
    21cc:	2e0506e3          	beqz	a0,2cb8 <_vfprintf_r+0x132c>
    21d0:	001c0793          	add	a5,s8,1
    21d4:	001d0d13          	add	s10,s10,1
    21d8:	008484b3          	add	s1,s1,s0
    21dc:	00fb2023          	sw	a5,0(s6)
    21e0:	008b2223          	sw	s0,4(s6)
    21e4:	0a912423          	sw	s1,168(sp)
    21e8:	0ba12223          	sw	s10,164(sp)
    21ec:	00700793          	li	a5,7
    21f0:	008b0b13          	add	s6,s6,8
    21f4:	29a7cce3          	blt	a5,s10,2c8c <_vfprintf_r+0x1300>
    21f8:	04012703          	lw	a4,64(sp)
    21fc:	08810793          	add	a5,sp,136
    2200:	001d0d13          	add	s10,s10,1
    2204:	009704b3          	add	s1,a4,s1
    2208:	00fb2023          	sw	a5,0(s6)
    220c:	00eb2223          	sw	a4,4(s6)
    2210:	0a912423          	sw	s1,168(sp)
    2214:	0ba12223          	sw	s10,164(sp)
    2218:	00700793          	li	a5,7
    221c:	008b0413          	add	s0,s6,8
    2220:	a7a7dae3          	bge	a5,s10,1c94 <_vfprintf_r+0x308>
    2224:	00812583          	lw	a1,8(sp)
    2228:	0a010613          	add	a2,sp,160
    222c:	00098513          	mv	a0,s3
    2230:	03d12023          	sw	t4,32(sp)
    2234:	614020ef          	jal	4848 <__sprint_r>
    2238:	c20512e3          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    223c:	0a812483          	lw	s1,168(sp)
    2240:	02012e83          	lw	t4,32(sp)
    2244:	0ac10413          	add	s0,sp,172
    2248:	a4dff06f          	j	1c94 <_vfprintf_r+0x308>
    224c:	2007f713          	and	a4,a5,512
    2250:	c2071ce3          	bnez	a4,1e88 <_vfprintf_r+0x4fc>
    2254:	00812403          	lw	s0,8(sp)
    2258:	05842503          	lw	a0,88(s0)
    225c:	fd8fe0ef          	jal	a34 <__retarget_lock_release_recursive>
    2260:	00c41783          	lh	a5,12(s0)
    2264:	c25ff06f          	j	1e88 <_vfprintf_r+0x4fc>
    2268:	00094e03          	lbu	t3,0(s2)
    226c:	020a6a13          	or	s4,s4,32
    2270:	8cdff06f          	j	1b3c <_vfprintf_r+0x1b0>
    2274:	01412703          	lw	a4,20(sp)
    2278:	04300793          	li	a5,67
    227c:	000a0e93          	mv	t4,s4
    2280:	00470493          	add	s1,a4,4
    2284:	64fe08e3          	beq	t3,a5,30d4 <_vfprintf_r+0x1748>
    2288:	010a7793          	and	a5,s4,16
    228c:	640794e3          	bnez	a5,30d4 <_vfprintf_r+0x1748>
    2290:	01412783          	lw	a5,20(sp)
    2294:	00100c93          	li	s9,1
    2298:	00100d13          	li	s10,1
    229c:	0007a783          	lw	a5,0(a5)
    22a0:	0ec10c13          	add	s8,sp,236
    22a4:	0ef10623          	sb	a5,236(sp)
    22a8:	06010ba3          	sb	zero,119(sp)
    22ac:	00912a23          	sw	s1,20(sp)
    22b0:	00000613          	li	a2,0
    22b4:	00012823          	sw	zero,16(sp)
    22b8:	00000313          	li	t1,0
    22bc:	02012223          	sw	zero,36(sp)
    22c0:	02012023          	sw	zero,32(sp)
    22c4:	00000a13          	li	s4,0
    22c8:	905ff06f          	j	1bcc <_vfprintf_r+0x240>
    22cc:	01412783          	lw	a5,20(sp)
    22d0:	06010ba3          	sb	zero,119(sp)
    22d4:	000b0313          	mv	t1,s6
    22d8:	0007ac03          	lw	s8,0(a5)
    22dc:	000a0e93          	mv	t4,s4
    22e0:	00478b13          	add	s6,a5,4
    22e4:	5a0c0ce3          	beqz	s8,309c <_vfprintf_r+0x1710>
    22e8:	05300713          	li	a4,83
    22ec:	00ee1463          	bne	t3,a4,22f4 <_vfprintf_r+0x968>
    22f0:	1d00106f          	j	34c0 <_vfprintf_r+0x1b34>
    22f4:	010a7a13          	and	s4,s4,16
    22f8:	000a0463          	beqz	s4,2300 <_vfprintf_r+0x974>
    22fc:	1c40106f          	j	34c0 <_vfprintf_r+0x1b34>
    2300:	00035463          	bgez	t1,2308 <_vfprintf_r+0x97c>
    2304:	6d40106f          	j	39d8 <_vfprintf_r+0x204c>
    2308:	00030613          	mv	a2,t1
    230c:	00000593          	li	a1,0
    2310:	000c0513          	mv	a0,s8
    2314:	03d12023          	sw	t4,32(sp)
    2318:	00612a23          	sw	t1,20(sp)
    231c:	0ec050ef          	jal	7408 <memchr>
    2320:	00a12823          	sw	a0,16(sp)
    2324:	01412303          	lw	t1,20(sp)
    2328:	02012e83          	lw	t4,32(sp)
    232c:	00051463          	bnez	a0,2334 <_vfprintf_r+0x9a8>
    2330:	1780206f          	j	44a8 <_vfprintf_r+0x2b1c>
    2334:	01012783          	lw	a5,16(sp)
    2338:	07714603          	lbu	a2,119(sp)
    233c:	01612a23          	sw	s6,20(sp)
    2340:	41878d33          	sub	s10,a5,s8
    2344:	fffd4813          	not	a6,s10
    2348:	41f85813          	sra	a6,a6,0x1f
    234c:	02012223          	sw	zero,36(sp)
    2350:	02012023          	sw	zero,32(sp)
    2354:	00012823          	sw	zero,16(sp)
    2358:	010d7cb3          	and	s9,s10,a6
    235c:	00000313          	li	t1,0
    2360:	07300e13          	li	t3,115
    2364:	860604e3          	beqz	a2,1bcc <_vfprintf_r+0x240>
    2368:	c85ff06f          	j	1fec <_vfprintf_r+0x660>
    236c:	01412783          	lw	a5,20(sp)
    2370:	0007ab83          	lw	s7,0(a5)
    2374:	00478793          	add	a5,a5,4
    2378:	2a0bdae3          	bgez	s7,2e2c <_vfprintf_r+0x14a0>
    237c:	41700bb3          	neg	s7,s7
    2380:	00f12a23          	sw	a5,20(sp)
    2384:	00094e03          	lbu	t3,0(s2)
    2388:	004a6a13          	or	s4,s4,4
    238c:	fb0ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    2390:	02b00793          	li	a5,43
    2394:	00094e03          	lbu	t3,0(s2)
    2398:	06f10ba3          	sb	a5,119(sp)
    239c:	fa0ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    23a0:	000b0313          	mv	t1,s6
    23a4:	010a6613          	or	a2,s4,16
    23a8:	02067793          	and	a5,a2,32
    23ac:	1c0780e3          	beqz	a5,2d6c <_vfprintf_r+0x13e0>
    23b0:	01412783          	lw	a5,20(sp)
    23b4:	00778b13          	add	s6,a5,7
    23b8:	ff8b7b13          	and	s6,s6,-8
    23bc:	000b2d03          	lw	s10,0(s6)
    23c0:	004b2c83          	lw	s9,4(s6)
    23c4:	008b0793          	add	a5,s6,8
    23c8:	00f12a23          	sw	a5,20(sp)
    23cc:	00100793          	li	a5,1
    23d0:	00000713          	li	a4,0
    23d4:	06e10ba3          	sb	a4,119(sp)
    23d8:	34034c63          	bltz	t1,2730 <_vfprintf_r+0xda4>
    23dc:	019d6733          	or	a4,s10,s9
    23e0:	f7f67e93          	and	t4,a2,-129
    23e4:	34071463          	bnez	a4,272c <_vfprintf_r+0xda0>
    23e8:	3a031a63          	bnez	t1,279c <_vfprintf_r+0xe10>
    23ec:	5c079ee3          	bnez	a5,31c8 <_vfprintf_r+0x183c>
    23f0:	00167d13          	and	s10,a2,1
    23f4:	15010c13          	add	s8,sp,336
    23f8:	2c0d10e3          	bnez	s10,2eb8 <_vfprintf_r+0x152c>
    23fc:	07714603          	lbu	a2,119(sp)
    2400:	00030c93          	mv	s9,t1
    2404:	01a35463          	bge	t1,s10,240c <_vfprintf_r+0xa80>
    2408:	000d0c93          	mv	s9,s10
    240c:	00012823          	sw	zero,16(sp)
    2410:	02012223          	sw	zero,36(sp)
    2414:	02012023          	sw	zero,32(sp)
    2418:	00000a13          	li	s4,0
    241c:	fa060863          	beqz	a2,1bcc <_vfprintf_r+0x240>
    2420:	bcdff06f          	j	1fec <_vfprintf_r+0x660>
    2424:	00094e03          	lbu	t3,0(s2)
    2428:	080a6a13          	or	s4,s4,128
    242c:	f10ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    2430:	00094e03          	lbu	t3,0(s2)
    2434:	02a00793          	li	a5,42
    2438:	00190693          	add	a3,s2,1
    243c:	00fe1463          	bne	t3,a5,2444 <_vfprintf_r+0xab8>
    2440:	1100206f          	j	4550 <_vfprintf_r+0x2bc4>
    2444:	fd0e0713          	add	a4,t3,-48
    2448:	00900793          	li	a5,9
    244c:	00000b13          	li	s6,0
    2450:	00900613          	li	a2,9
    2454:	02e7e463          	bltu	a5,a4,247c <_vfprintf_r+0xaf0>
    2458:	0006ce03          	lbu	t3,0(a3)
    245c:	002b1793          	sll	a5,s6,0x2
    2460:	016787b3          	add	a5,a5,s6
    2464:	00179793          	sll	a5,a5,0x1
    2468:	00e78b33          	add	s6,a5,a4
    246c:	fd0e0713          	add	a4,t3,-48
    2470:	00168693          	add	a3,a3,1
    2474:	fee672e3          	bgeu	a2,a4,2458 <_vfprintf_r+0xacc>
    2478:	320b4ce3          	bltz	s6,2fb0 <_vfprintf_r+0x1624>
    247c:	00068913          	mv	s2,a3
    2480:	ec0ff06f          	j	1b40 <_vfprintf_r+0x1b4>
    2484:	00094e03          	lbu	t3,0(s2)
    2488:	001a6a13          	or	s4,s4,1
    248c:	eb0ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    2490:	07714783          	lbu	a5,119(sp)
    2494:	00094e03          	lbu	t3,0(s2)
    2498:	ea079263          	bnez	a5,1b3c <_vfprintf_r+0x1b0>
    249c:	02000793          	li	a5,32
    24a0:	06f10ba3          	sb	a5,119(sp)
    24a4:	e98ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    24a8:	00094e03          	lbu	t3,0(s2)
    24ac:	06c00793          	li	a5,108
    24b0:	3afe00e3          	beq	t3,a5,3050 <_vfprintf_r+0x16c4>
    24b4:	010a6a13          	or	s4,s4,16
    24b8:	e84ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    24bc:	00094e03          	lbu	t3,0(s2)
    24c0:	008a6a13          	or	s4,s4,8
    24c4:	e78ff06f          	j	1b3c <_vfprintf_r+0x1b0>
    24c8:	000b0313          	mv	t1,s6
    24cc:	010a6e93          	or	t4,s4,16
    24d0:	020ef793          	and	a5,t4,32
    24d4:	0c0786e3          	beqz	a5,2da0 <_vfprintf_r+0x1414>
    24d8:	01412783          	lw	a5,20(sp)
    24dc:	00778b13          	add	s6,a5,7
    24e0:	ff8b7b13          	and	s6,s6,-8
    24e4:	004b2783          	lw	a5,4(s6)
    24e8:	000b2d03          	lw	s10,0(s6)
    24ec:	008b0713          	add	a4,s6,8
    24f0:	00e12a23          	sw	a4,20(sp)
    24f4:	00078c93          	mv	s9,a5
    24f8:	0c07cee3          	bltz	a5,2dd4 <_vfprintf_r+0x1448>
    24fc:	000e8613          	mv	a2,t4
    2500:	02034263          	bltz	t1,2524 <_vfprintf_r+0xb98>
    2504:	019d67b3          	or	a5,s10,s9
    2508:	f7fef613          	and	a2,t4,-129
    250c:	00079c63          	bnez	a5,2524 <_vfprintf_r+0xb98>
    2510:	02031063          	bnez	t1,2530 <_vfprintf_r+0xba4>
    2514:	00000d13          	li	s10,0
    2518:	00060e93          	mv	t4,a2
    251c:	15010c13          	add	s8,sp,336
    2520:	eddff06f          	j	23fc <_vfprintf_r+0xa70>
    2524:	520c90e3          	bnez	s9,3244 <_vfprintf_r+0x18b8>
    2528:	00900793          	li	a5,9
    252c:	51a7ece3          	bltu	a5,s10,3244 <_vfprintf_r+0x18b8>
    2530:	030d0d13          	add	s10,s10,48
    2534:	15a107a3          	sb	s10,335(sp)
    2538:	00060e93          	mv	t4,a2
    253c:	00100d13          	li	s10,1
    2540:	14f10c13          	add	s8,sp,335
    2544:	eb9ff06f          	j	23fc <_vfprintf_r+0xa70>
    2548:	000b0313          	mv	t1,s6
    254c:	010a6e93          	or	t4,s4,16
    2550:	020ef793          	and	a5,t4,32
    2554:	7e078463          	beqz	a5,2d3c <_vfprintf_r+0x13b0>
    2558:	01412783          	lw	a5,20(sp)
    255c:	00778b13          	add	s6,a5,7
    2560:	ff8b7b13          	and	s6,s6,-8
    2564:	000b2d03          	lw	s10,0(s6)
    2568:	004b2c83          	lw	s9,4(s6)
    256c:	008b0793          	add	a5,s6,8
    2570:	00f12a23          	sw	a5,20(sp)
    2574:	bffef613          	and	a2,t4,-1025
    2578:	00000793          	li	a5,0
    257c:	e55ff06f          	j	23d0 <_vfprintf_r+0xa44>
    2580:	00094e03          	lbu	t3,0(s2)
    2584:	06800793          	li	a5,104
    2588:	2cfe0ce3          	beq	t3,a5,3060 <_vfprintf_r+0x16d4>
    258c:	040a6a13          	or	s4,s4,64
    2590:	dacff06f          	j	1b3c <_vfprintf_r+0x1b0>
    2594:	01412703          	lw	a4,20(sp)
    2598:	000087b7          	lui	a5,0x8
    259c:	83078793          	add	a5,a5,-2000 # 7830 <memmove+0xc4>
    25a0:	06f11c23          	sh	a5,120(sp)
    25a4:	00470793          	add	a5,a4,4
    25a8:	00f12a23          	sw	a5,20(sp)
    25ac:	0000c797          	auipc	a5,0xc
    25b0:	43478793          	add	a5,a5,1076 # e9e0 <__fini_array_end+0x9c>
    25b4:	02f12c23          	sw	a5,56(sp)
    25b8:	00072d03          	lw	s10,0(a4)
    25bc:	000b0313          	mv	t1,s6
    25c0:	00000c93          	li	s9,0
    25c4:	002a6613          	or	a2,s4,2
    25c8:	00200793          	li	a5,2
    25cc:	07800e13          	li	t3,120
    25d0:	e01ff06f          	j	23d0 <_vfprintf_r+0xa44>
    25d4:	020a7793          	and	a5,s4,32
    25d8:	180784e3          	beqz	a5,2f60 <_vfprintf_r+0x15d4>
    25dc:	01412783          	lw	a5,20(sp)
    25e0:	00c12683          	lw	a3,12(sp)
    25e4:	0007a783          	lw	a5,0(a5)
    25e8:	41f6d713          	sra	a4,a3,0x1f
    25ec:	00d7a023          	sw	a3,0(a5)
    25f0:	00e7a223          	sw	a4,4(a5)
    25f4:	01412783          	lw	a5,20(sp)
    25f8:	00090c13          	mv	s8,s2
    25fc:	00478793          	add	a5,a5,4
    2600:	00f12a23          	sw	a5,20(sp)
    2604:	cccff06f          	j	1ad0 <_vfprintf_r+0x144>
    2608:	06500713          	li	a4,101
    260c:	b3c754e3          	bge	a4,t3,2134 <_vfprintf_r+0x7a8>
    2610:	02812683          	lw	a3,40(sp)
    2614:	02c12703          	lw	a4,44(sp)
    2618:	00000613          	li	a2,0
    261c:	00068513          	mv	a0,a3
    2620:	00070593          	mv	a1,a4
    2624:	00000693          	li	a3,0
    2628:	05d12223          	sw	t4,68(sp)
    262c:	05d0a0ef          	jal	ce88 <__eqdf2>
    2630:	04412e83          	lw	t4,68(sp)
    2634:	4e051463          	bnez	a0,2b1c <_vfprintf_r+0x1190>
    2638:	0a412783          	lw	a5,164(sp)
    263c:	0000c717          	auipc	a4,0xc
    2640:	3d470713          	add	a4,a4,980 # ea10 <__fini_array_end+0xcc>
    2644:	00e42023          	sw	a4,0(s0)
    2648:	00148493          	add	s1,s1,1
    264c:	00100713          	li	a4,1
    2650:	00178793          	add	a5,a5,1
    2654:	00e42223          	sw	a4,4(s0)
    2658:	0a912423          	sw	s1,168(sp)
    265c:	0af12223          	sw	a5,164(sp)
    2660:	00700713          	li	a4,7
    2664:	00840413          	add	s0,s0,8
    2668:	62f746e3          	blt	a4,a5,3494 <_vfprintf_r+0x1b08>
    266c:	07c12783          	lw	a5,124(sp)
    2670:	01812703          	lw	a4,24(sp)
    2674:	78e7de63          	bge	a5,a4,2e10 <_vfprintf_r+0x1484>
    2678:	03412783          	lw	a5,52(sp)
    267c:	03012703          	lw	a4,48(sp)
    2680:	00840413          	add	s0,s0,8
    2684:	fef42c23          	sw	a5,-8(s0)
    2688:	0a412783          	lw	a5,164(sp)
    268c:	00e484b3          	add	s1,s1,a4
    2690:	fee42e23          	sw	a4,-4(s0)
    2694:	00178793          	add	a5,a5,1
    2698:	0a912423          	sw	s1,168(sp)
    269c:	0af12223          	sw	a5,164(sp)
    26a0:	00700713          	li	a4,7
    26a4:	1cf746e3          	blt	a4,a5,3070 <_vfprintf_r+0x16e4>
    26a8:	01812783          	lw	a5,24(sp)
    26ac:	fff78d13          	add	s10,a5,-1
    26b0:	dfa05263          	blez	s10,1c94 <_vfprintf_r+0x308>
    26b4:	01000713          	li	a4,16
    26b8:	0a412783          	lw	a5,164(sp)
    26bc:	0000d297          	auipc	t0,0xd
    26c0:	80c28293          	add	t0,t0,-2036 # eec8 <zeroes.0>
    26c4:	77a752e3          	bge	a4,s10,3628 <_vfprintf_r+0x1c9c>
    26c8:	00048713          	mv	a4,s1
    26cc:	01000c13          	li	s8,16
    26d0:	00700b13          	li	s6,7
    26d4:	000e8493          	mv	s1,t4
    26d8:	00028a13          	mv	s4,t0
    26dc:	00c0006f          	j	26e8 <_vfprintf_r+0xd5c>
    26e0:	ff0d0d13          	add	s10,s10,-16
    26e4:	73ac5ce3          	bge	s8,s10,361c <_vfprintf_r+0x1c90>
    26e8:	01070713          	add	a4,a4,16
    26ec:	00178793          	add	a5,a5,1
    26f0:	01442023          	sw	s4,0(s0)
    26f4:	01842223          	sw	s8,4(s0)
    26f8:	0ae12423          	sw	a4,168(sp)
    26fc:	0af12223          	sw	a5,164(sp)
    2700:	00840413          	add	s0,s0,8
    2704:	fcfb5ee3          	bge	s6,a5,26e0 <_vfprintf_r+0xd54>
    2708:	00812583          	lw	a1,8(sp)
    270c:	0a010613          	add	a2,sp,160
    2710:	00098513          	mv	a0,s3
    2714:	134020ef          	jal	4848 <__sprint_r>
    2718:	f4051263          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    271c:	0a812703          	lw	a4,168(sp)
    2720:	0a412783          	lw	a5,164(sp)
    2724:	0ac10413          	add	s0,sp,172
    2728:	fb9ff06f          	j	26e0 <_vfprintf_r+0xd54>
    272c:	000e8613          	mv	a2,t4
    2730:	00100713          	li	a4,1
    2734:	dee788e3          	beq	a5,a4,2524 <_vfprintf_r+0xb98>
    2738:	00200713          	li	a4,2
    273c:	06e78c63          	beq	a5,a4,27b4 <_vfprintf_r+0xe28>
    2740:	15010c13          	add	s8,sp,336
    2744:	01dc9793          	sll	a5,s9,0x1d
    2748:	007d7713          	and	a4,s10,7
    274c:	003d5d13          	srl	s10,s10,0x3
    2750:	03070713          	add	a4,a4,48
    2754:	01a7ed33          	or	s10,a5,s10
    2758:	003cdc93          	srl	s9,s9,0x3
    275c:	feec0fa3          	sb	a4,-1(s8)
    2760:	019d67b3          	or	a5,s10,s9
    2764:	000c0593          	mv	a1,s8
    2768:	fffc0c13          	add	s8,s8,-1
    276c:	fc079ce3          	bnez	a5,2744 <_vfprintf_r+0xdb8>
    2770:	00167693          	and	a3,a2,1
    2774:	06068a63          	beqz	a3,27e8 <_vfprintf_r+0xe5c>
    2778:	03000693          	li	a3,48
    277c:	06d70663          	beq	a4,a3,27e8 <_vfprintf_r+0xe5c>
    2780:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x672>
    2784:	15010793          	add	a5,sp,336
    2788:	fedc0fa3          	sb	a3,-1(s8)
    278c:	40b78d33          	sub	s10,a5,a1
    2790:	00060e93          	mv	t4,a2
    2794:	00058c13          	mv	s8,a1
    2798:	c65ff06f          	j	23fc <_vfprintf_r+0xa70>
    279c:	00100713          	li	a4,1
    27a0:	00e79463          	bne	a5,a4,27a8 <_vfprintf_r+0xe1c>
    27a4:	2b10106f          	j	4254 <_vfprintf_r+0x28c8>
    27a8:	00200713          	li	a4,2
    27ac:	000e8613          	mv	a2,t4
    27b0:	f8e798e3          	bne	a5,a4,2740 <_vfprintf_r+0xdb4>
    27b4:	03812683          	lw	a3,56(sp)
    27b8:	15010c13          	add	s8,sp,336
    27bc:	00fd7793          	and	a5,s10,15
    27c0:	00f687b3          	add	a5,a3,a5
    27c4:	0007c703          	lbu	a4,0(a5)
    27c8:	004d5d13          	srl	s10,s10,0x4
    27cc:	01cc9793          	sll	a5,s9,0x1c
    27d0:	01a7ed33          	or	s10,a5,s10
    27d4:	004cdc93          	srl	s9,s9,0x4
    27d8:	feec0fa3          	sb	a4,-1(s8)
    27dc:	019d67b3          	or	a5,s10,s9
    27e0:	fffc0c13          	add	s8,s8,-1
    27e4:	fc079ce3          	bnez	a5,27bc <_vfprintf_r+0xe30>
    27e8:	15010793          	add	a5,sp,336
    27ec:	41878d33          	sub	s10,a5,s8
    27f0:	00060e93          	mv	t4,a2
    27f4:	c09ff06f          	j	23fc <_vfprintf_r+0xa70>
    27f8:	419b8b33          	sub	s6,s7,s9
    27fc:	c7605063          	blez	s6,1c5c <_vfprintf_r+0x2d0>
    2800:	01000593          	li	a1,16
    2804:	0a412603          	lw	a2,164(sp)
    2808:	0000c297          	auipc	t0,0xc
    280c:	6c028293          	add	t0,t0,1728 # eec8 <zeroes.0>
    2810:	0b65d463          	bge	a1,s6,28b8 <_vfprintf_r+0xf2c>
    2814:	00040793          	mv	a5,s0
    2818:	00048713          	mv	a4,s1
    281c:	000b0413          	mv	s0,s6
    2820:	01000893          	li	a7,16
    2824:	000a0b13          	mv	s6,s4
    2828:	00700f93          	li	t6,7
    282c:	05d12223          	sw	t4,68(sp)
    2830:	05c12823          	sw	t3,80(sp)
    2834:	00030a13          	mv	s4,t1
    2838:	00028493          	mv	s1,t0
    283c:	00c0006f          	j	2848 <_vfprintf_r+0xebc>
    2840:	ff040413          	add	s0,s0,-16
    2844:	0488da63          	bge	a7,s0,2898 <_vfprintf_r+0xf0c>
    2848:	01070713          	add	a4,a4,16
    284c:	00160613          	add	a2,a2,1
    2850:	0097a023          	sw	s1,0(a5)
    2854:	0117a223          	sw	a7,4(a5)
    2858:	0ae12423          	sw	a4,168(sp)
    285c:	0ac12223          	sw	a2,164(sp)
    2860:	00878793          	add	a5,a5,8
    2864:	fccfdee3          	bge	t6,a2,2840 <_vfprintf_r+0xeb4>
    2868:	00812583          	lw	a1,8(sp)
    286c:	0a010613          	add	a2,sp,160
    2870:	00098513          	mv	a0,s3
    2874:	7d5010ef          	jal	4848 <__sprint_r>
    2878:	de051263          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    287c:	01000893          	li	a7,16
    2880:	ff040413          	add	s0,s0,-16
    2884:	0a812703          	lw	a4,168(sp)
    2888:	0a412603          	lw	a2,164(sp)
    288c:	0ac10793          	add	a5,sp,172
    2890:	00700f93          	li	t6,7
    2894:	fa88cae3          	blt	a7,s0,2848 <_vfprintf_r+0xebc>
    2898:	04412e83          	lw	t4,68(sp)
    289c:	05012e03          	lw	t3,80(sp)
    28a0:	000a0313          	mv	t1,s4
    28a4:	00048293          	mv	t0,s1
    28a8:	000b0a13          	mv	s4,s6
    28ac:	00070493          	mv	s1,a4
    28b0:	00040b13          	mv	s6,s0
    28b4:	00078413          	mv	s0,a5
    28b8:	016484b3          	add	s1,s1,s6
    28bc:	00160613          	add	a2,a2,1
    28c0:	00542023          	sw	t0,0(s0)
    28c4:	01642223          	sw	s6,4(s0)
    28c8:	0a912423          	sw	s1,168(sp)
    28cc:	0ac12223          	sw	a2,164(sp)
    28d0:	00700713          	li	a4,7
    28d4:	00840413          	add	s0,s0,8
    28d8:	b8c75263          	bge	a4,a2,1c5c <_vfprintf_r+0x2d0>
    28dc:	00812583          	lw	a1,8(sp)
    28e0:	0a010613          	add	a2,sp,160
    28e4:	00098513          	mv	a0,s3
    28e8:	04612a23          	sw	t1,84(sp)
    28ec:	05c12823          	sw	t3,80(sp)
    28f0:	05d12223          	sw	t4,68(sp)
    28f4:	755010ef          	jal	4848 <__sprint_r>
    28f8:	d6051263          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    28fc:	0a812483          	lw	s1,168(sp)
    2900:	05412303          	lw	t1,84(sp)
    2904:	05012e03          	lw	t3,80(sp)
    2908:	04412e83          	lw	t4,68(sp)
    290c:	0ac10413          	add	s0,sp,172
    2910:	b4cff06f          	j	1c5c <_vfprintf_r+0x2d0>
    2914:	01000713          	li	a4,16
    2918:	0a412603          	lw	a2,164(sp)
    291c:	0000c297          	auipc	t0,0xc
    2920:	5ac28293          	add	t0,t0,1452 # eec8 <zeroes.0>
    2924:	0b675063          	bge	a4,s6,29c4 <_vfprintf_r+0x1038>
    2928:	00040793          	mv	a5,s0
    292c:	00048693          	mv	a3,s1
    2930:	000b0413          	mv	s0,s6
    2934:	01000713          	li	a4,16
    2938:	00700893          	li	a7,7
    293c:	05d12223          	sw	t4,68(sp)
    2940:	000e0493          	mv	s1,t3
    2944:	00028b13          	mv	s6,t0
    2948:	00c0006f          	j	2954 <_vfprintf_r+0xfc8>
    294c:	ff040413          	add	s0,s0,-16
    2950:	04875e63          	bge	a4,s0,29ac <_vfprintf_r+0x1020>
    2954:	01068693          	add	a3,a3,16
    2958:	00160613          	add	a2,a2,1
    295c:	0000c597          	auipc	a1,0xc
    2960:	56c58593          	add	a1,a1,1388 # eec8 <zeroes.0>
    2964:	00b7a023          	sw	a1,0(a5)
    2968:	00e7a223          	sw	a4,4(a5)
    296c:	0ad12423          	sw	a3,168(sp)
    2970:	0ac12223          	sw	a2,164(sp)
    2974:	00878793          	add	a5,a5,8
    2978:	fcc8dae3          	bge	a7,a2,294c <_vfprintf_r+0xfc0>
    297c:	00812583          	lw	a1,8(sp)
    2980:	0a010613          	add	a2,sp,160
    2984:	00098513          	mv	a0,s3
    2988:	6c1010ef          	jal	4848 <__sprint_r>
    298c:	cc051863          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2990:	01000713          	li	a4,16
    2994:	ff040413          	add	s0,s0,-16
    2998:	0a812683          	lw	a3,168(sp)
    299c:	0a412603          	lw	a2,164(sp)
    29a0:	0ac10793          	add	a5,sp,172
    29a4:	00700893          	li	a7,7
    29a8:	fa8746e3          	blt	a4,s0,2954 <_vfprintf_r+0xfc8>
    29ac:	04412e83          	lw	t4,68(sp)
    29b0:	00048e13          	mv	t3,s1
    29b4:	000b0293          	mv	t0,s6
    29b8:	00068493          	mv	s1,a3
    29bc:	00040b13          	mv	s6,s0
    29c0:	00078413          	mv	s0,a5
    29c4:	016484b3          	add	s1,s1,s6
    29c8:	00160613          	add	a2,a2,1
    29cc:	00542023          	sw	t0,0(s0)
    29d0:	01642223          	sw	s6,4(s0)
    29d4:	0a912423          	sw	s1,168(sp)
    29d8:	0ac12223          	sw	a2,164(sp)
    29dc:	00700713          	li	a4,7
    29e0:	00840413          	add	s0,s0,8
    29e4:	a8c75063          	bge	a4,a2,1c64 <_vfprintf_r+0x2d8>
    29e8:	00812583          	lw	a1,8(sp)
    29ec:	0a010613          	add	a2,sp,160
    29f0:	00098513          	mv	a0,s3
    29f4:	05c12823          	sw	t3,80(sp)
    29f8:	05d12223          	sw	t4,68(sp)
    29fc:	64d010ef          	jal	4848 <__sprint_r>
    2a00:	c4051e63          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2a04:	0a812483          	lw	s1,168(sp)
    2a08:	05012e03          	lw	t3,80(sp)
    2a0c:	04412e83          	lw	t4,68(sp)
    2a10:	0ac10413          	add	s0,sp,172
    2a14:	a50ff06f          	j	1c64 <_vfprintf_r+0x2d8>
    2a18:	00812583          	lw	a1,8(sp)
    2a1c:	0a010613          	add	a2,sp,160
    2a20:	00098513          	mv	a0,s3
    2a24:	04612c23          	sw	t1,88(sp)
    2a28:	05c12a23          	sw	t3,84(sp)
    2a2c:	05d12823          	sw	t4,80(sp)
    2a30:	05f12223          	sw	t6,68(sp)
    2a34:	615010ef          	jal	4848 <__sprint_r>
    2a38:	c2051263          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2a3c:	0a812483          	lw	s1,168(sp)
    2a40:	05812303          	lw	t1,88(sp)
    2a44:	05412e03          	lw	t3,84(sp)
    2a48:	05012e83          	lw	t4,80(sp)
    2a4c:	04412f83          	lw	t6,68(sp)
    2a50:	0ac10413          	add	s0,sp,172
    2a54:	a00ff06f          	j	1c54 <_vfprintf_r+0x2c8>
    2a58:	01000713          	li	a4,16
    2a5c:	0a412783          	lw	a5,164(sp)
    2a60:	0000cb17          	auipc	s6,0xc
    2a64:	478b0b13          	add	s6,s6,1144 # eed8 <blanks.1>
    2a68:	07a75c63          	bge	a4,s10,2ae0 <_vfprintf_r+0x1154>
    2a6c:	000b0713          	mv	a4,s6
    2a70:	01000c13          	li	s8,16
    2a74:	00090b13          	mv	s6,s2
    2a78:	00700a13          	li	s4,7
    2a7c:	00070913          	mv	s2,a4
    2a80:	00c0006f          	j	2a8c <_vfprintf_r+0x1100>
    2a84:	ff0d0d13          	add	s10,s10,-16
    2a88:	05ac5663          	bge	s8,s10,2ad4 <_vfprintf_r+0x1148>
    2a8c:	01048493          	add	s1,s1,16
    2a90:	00178793          	add	a5,a5,1
    2a94:	01242023          	sw	s2,0(s0)
    2a98:	01842223          	sw	s8,4(s0)
    2a9c:	0a912423          	sw	s1,168(sp)
    2aa0:	0af12223          	sw	a5,164(sp)
    2aa4:	00840413          	add	s0,s0,8
    2aa8:	fcfa5ee3          	bge	s4,a5,2a84 <_vfprintf_r+0x10f8>
    2aac:	00812583          	lw	a1,8(sp)
    2ab0:	0a010613          	add	a2,sp,160
    2ab4:	00098513          	mv	a0,s3
    2ab8:	591010ef          	jal	4848 <__sprint_r>
    2abc:	ba051063          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2ac0:	ff0d0d13          	add	s10,s10,-16
    2ac4:	0a812483          	lw	s1,168(sp)
    2ac8:	0a412783          	lw	a5,164(sp)
    2acc:	0ac10413          	add	s0,sp,172
    2ad0:	fbac4ee3          	blt	s8,s10,2a8c <_vfprintf_r+0x1100>
    2ad4:	00090713          	mv	a4,s2
    2ad8:	000b0913          	mv	s2,s6
    2adc:	00070b13          	mv	s6,a4
    2ae0:	01a484b3          	add	s1,s1,s10
    2ae4:	00178793          	add	a5,a5,1
    2ae8:	01642023          	sw	s6,0(s0)
    2aec:	01a42223          	sw	s10,4(s0)
    2af0:	0a912423          	sw	s1,168(sp)
    2af4:	0af12223          	sw	a5,164(sp)
    2af8:	00700713          	li	a4,7
    2afc:	9af75463          	bge	a4,a5,1ca4 <_vfprintf_r+0x318>
    2b00:	00812583          	lw	a1,8(sp)
    2b04:	0a010613          	add	a2,sp,160
    2b08:	00098513          	mv	a0,s3
    2b0c:	53d010ef          	jal	4848 <__sprint_r>
    2b10:	b4051663          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2b14:	0a812483          	lw	s1,168(sp)
    2b18:	98cff06f          	j	1ca4 <_vfprintf_r+0x318>
    2b1c:	07c12683          	lw	a3,124(sp)
    2b20:	30d05c63          	blez	a3,2e38 <_vfprintf_r+0x14ac>
    2b24:	01812783          	lw	a5,24(sp)
    2b28:	000a0b13          	mv	s6,s4
    2b2c:	0147d463          	bge	a5,s4,2b34 <_vfprintf_r+0x11a8>
    2b30:	00078b13          	mv	s6,a5
    2b34:	03605863          	blez	s6,2b64 <_vfprintf_r+0x11d8>
    2b38:	0a412683          	lw	a3,164(sp)
    2b3c:	016484b3          	add	s1,s1,s6
    2b40:	01842023          	sw	s8,0(s0)
    2b44:	00168693          	add	a3,a3,1
    2b48:	01642223          	sw	s6,4(s0)
    2b4c:	0a912423          	sw	s1,168(sp)
    2b50:	0ad12223          	sw	a3,164(sp)
    2b54:	00700613          	li	a2,7
    2b58:	00840413          	add	s0,s0,8
    2b5c:	00d65463          	bge	a2,a3,2b64 <_vfprintf_r+0x11d8>
    2b60:	5c40106f          	j	4124 <_vfprintf_r+0x2798>
    2b64:	fffb4693          	not	a3,s6
    2b68:	41f6d693          	sra	a3,a3,0x1f
    2b6c:	00db7733          	and	a4,s6,a3
    2b70:	40ea0b33          	sub	s6,s4,a4
    2b74:	35604ae3          	bgtz	s6,36c8 <_vfprintf_r+0x1d3c>
    2b78:	400ef713          	and	a4,t4,1024
    2b7c:	014c0333          	add	t1,s8,s4
    2b80:	00070463          	beqz	a4,2b88 <_vfprintf_r+0x11fc>
    2b84:	2980106f          	j	3e1c <_vfprintf_r+0x2490>
    2b88:	07c12d03          	lw	s10,124(sp)
    2b8c:	01812783          	lw	a5,24(sp)
    2b90:	5afd4063          	blt	s10,a5,3130 <_vfprintf_r+0x17a4>
    2b94:	001ef713          	and	a4,t4,1
    2b98:	58071c63          	bnez	a4,3130 <_vfprintf_r+0x17a4>
    2b9c:	01812703          	lw	a4,24(sp)
    2ba0:	00ec07b3          	add	a5,s8,a4
    2ba4:	41a70d33          	sub	s10,a4,s10
    2ba8:	40678b33          	sub	s6,a5,t1
    2bac:	016d5463          	bge	s10,s6,2bb4 <_vfprintf_r+0x1228>
    2bb0:	000d0b13          	mv	s6,s10
    2bb4:	03605863          	blez	s6,2be4 <_vfprintf_r+0x1258>
    2bb8:	0a412703          	lw	a4,164(sp)
    2bbc:	016484b3          	add	s1,s1,s6
    2bc0:	00642023          	sw	t1,0(s0)
    2bc4:	00170713          	add	a4,a4,1
    2bc8:	01642223          	sw	s6,4(s0)
    2bcc:	0a912423          	sw	s1,168(sp)
    2bd0:	0ae12223          	sw	a4,164(sp)
    2bd4:	00700693          	li	a3,7
    2bd8:	00840413          	add	s0,s0,8
    2bdc:	00e6d463          	bge	a3,a4,2be4 <_vfprintf_r+0x1258>
    2be0:	5880106f          	j	4168 <_vfprintf_r+0x27dc>
    2be4:	fffb4713          	not	a4,s6
    2be8:	41f75713          	sra	a4,a4,0x1f
    2bec:	00eb77b3          	and	a5,s6,a4
    2bf0:	40fd0d33          	sub	s10,s10,a5
    2bf4:	8ba05063          	blez	s10,1c94 <_vfprintf_r+0x308>
    2bf8:	01000713          	li	a4,16
    2bfc:	0a412783          	lw	a5,164(sp)
    2c00:	0000c297          	auipc	t0,0xc
    2c04:	2c828293          	add	t0,t0,712 # eec8 <zeroes.0>
    2c08:	23a750e3          	bge	a4,s10,3628 <_vfprintf_r+0x1c9c>
    2c0c:	00048713          	mv	a4,s1
    2c10:	01000c13          	li	s8,16
    2c14:	00700b13          	li	s6,7
    2c18:	000e8493          	mv	s1,t4
    2c1c:	00028a13          	mv	s4,t0
    2c20:	00c0006f          	j	2c2c <_vfprintf_r+0x12a0>
    2c24:	ff0d0d13          	add	s10,s10,-16
    2c28:	1fac5ae3          	bge	s8,s10,361c <_vfprintf_r+0x1c90>
    2c2c:	01070713          	add	a4,a4,16
    2c30:	00178793          	add	a5,a5,1
    2c34:	01442023          	sw	s4,0(s0)
    2c38:	01842223          	sw	s8,4(s0)
    2c3c:	0ae12423          	sw	a4,168(sp)
    2c40:	0af12223          	sw	a5,164(sp)
    2c44:	00840413          	add	s0,s0,8
    2c48:	fcfb5ee3          	bge	s6,a5,2c24 <_vfprintf_r+0x1298>
    2c4c:	00812583          	lw	a1,8(sp)
    2c50:	0a010613          	add	a2,sp,160
    2c54:	00098513          	mv	a0,s3
    2c58:	3f1010ef          	jal	4848 <__sprint_r>
    2c5c:	a0051063          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2c60:	0a812703          	lw	a4,168(sp)
    2c64:	0a412783          	lw	a5,164(sp)
    2c68:	0ac10413          	add	s0,sp,172
    2c6c:	fb9ff06f          	j	2c24 <_vfprintf_r+0x1298>
    2c70:	001ef613          	and	a2,t4,1
    2c74:	ce061063          	bnez	a2,2154 <_vfprintf_r+0x7c8>
    2c78:	00d42223          	sw	a3,4(s0)
    2c7c:	0a912423          	sw	s1,168(sp)
    2c80:	0ba12223          	sw	s10,164(sp)
    2c84:	00700793          	li	a5,7
    2c88:	d7a7d863          	bge	a5,s10,21f8 <_vfprintf_r+0x86c>
    2c8c:	00812583          	lw	a1,8(sp)
    2c90:	0a010613          	add	a2,sp,160
    2c94:	00098513          	mv	a0,s3
    2c98:	03d12023          	sw	t4,32(sp)
    2c9c:	3ad010ef          	jal	4848 <__sprint_r>
    2ca0:	9a051e63          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2ca4:	0a812483          	lw	s1,168(sp)
    2ca8:	0a412d03          	lw	s10,164(sp)
    2cac:	02012e83          	lw	t4,32(sp)
    2cb0:	0ac10b13          	add	s6,sp,172
    2cb4:	d44ff06f          	j	21f8 <_vfprintf_r+0x86c>
    2cb8:	01812703          	lw	a4,24(sp)
    2cbc:	00100793          	li	a5,1
    2cc0:	d2e7dc63          	bge	a5,a4,21f8 <_vfprintf_r+0x86c>
    2cc4:	01100793          	li	a5,17
    2cc8:	0000c297          	auipc	t0,0xc
    2ccc:	20028293          	add	t0,t0,512 # eec8 <zeroes.0>
    2cd0:	18e7d4e3          	bge	a5,a4,3658 <_vfprintf_r+0x1ccc>
    2cd4:	00040a13          	mv	s4,s0
    2cd8:	01000793          	li	a5,16
    2cdc:	00700c13          	li	s8,7
    2ce0:	03d12023          	sw	t4,32(sp)
    2ce4:	00028413          	mv	s0,t0
    2ce8:	00c0006f          	j	2cf4 <_vfprintf_r+0x1368>
    2cec:	ff0a0a13          	add	s4,s4,-16
    2cf0:	1547dee3          	bge	a5,s4,364c <_vfprintf_r+0x1cc0>
    2cf4:	01048493          	add	s1,s1,16
    2cf8:	001d0d13          	add	s10,s10,1
    2cfc:	008b2023          	sw	s0,0(s6)
    2d00:	00fb2223          	sw	a5,4(s6)
    2d04:	0a912423          	sw	s1,168(sp)
    2d08:	0ba12223          	sw	s10,164(sp)
    2d0c:	008b0b13          	add	s6,s6,8
    2d10:	fdac5ee3          	bge	s8,s10,2cec <_vfprintf_r+0x1360>
    2d14:	00812583          	lw	a1,8(sp)
    2d18:	0a010613          	add	a2,sp,160
    2d1c:	00098513          	mv	a0,s3
    2d20:	329010ef          	jal	4848 <__sprint_r>
    2d24:	92051c63          	bnez	a0,1e5c <_vfprintf_r+0x4d0>
    2d28:	0a812483          	lw	s1,168(sp)
    2d2c:	0a412d03          	lw	s10,164(sp)
    2d30:	0ac10b13          	add	s6,sp,172
    2d34:	01000793          	li	a5,16
    2d38:	fb5ff06f          	j	2cec <_vfprintf_r+0x1360>
    2d3c:	01412703          	lw	a4,20(sp)
    2d40:	010ef793          	and	a5,t4,16
    2d44:	00072d03          	lw	s10,0(a4)
    2d48:	00470713          	add	a4,a4,4
    2d4c:	00e12a23          	sw	a4,20(sp)
    2d50:	1a079663          	bnez	a5,2efc <_vfprintf_r+0x1570>
    2d54:	040ef793          	and	a5,t4,64
    2d58:	18078e63          	beqz	a5,2ef4 <_vfprintf_r+0x1568>
    2d5c:	010d1d13          	sll	s10,s10,0x10
    2d60:	010d5d13          	srl	s10,s10,0x10
    2d64:	00000c93          	li	s9,0
    2d68:	80dff06f          	j	2574 <_vfprintf_r+0xbe8>
    2d6c:	01412703          	lw	a4,20(sp)
    2d70:	01067793          	and	a5,a2,16
    2d74:	00072d03          	lw	s10,0(a4)
    2d78:	00470713          	add	a4,a4,4
    2d7c:	00e12a23          	sw	a4,20(sp)
    2d80:	14079a63          	bnez	a5,2ed4 <_vfprintf_r+0x1548>
    2d84:	04067793          	and	a5,a2,64
    2d88:	14078063          	beqz	a5,2ec8 <_vfprintf_r+0x153c>
    2d8c:	010d1d13          	sll	s10,s10,0x10
    2d90:	010d5d13          	srl	s10,s10,0x10
    2d94:	00000c93          	li	s9,0
    2d98:	00100793          	li	a5,1
    2d9c:	e34ff06f          	j	23d0 <_vfprintf_r+0xa44>
    2da0:	01412703          	lw	a4,20(sp)
    2da4:	010ef793          	and	a5,t4,16
    2da8:	00072d03          	lw	s10,0(a4)
    2dac:	00470713          	add	a4,a4,4
    2db0:	00e12a23          	sw	a4,20(sp)
    2db4:	12079a63          	bnez	a5,2ee8 <_vfprintf_r+0x155c>
    2db8:	040ef793          	and	a5,t4,64
    2dbc:	12078263          	beqz	a5,2ee0 <_vfprintf_r+0x1554>
    2dc0:	010d1d13          	sll	s10,s10,0x10
    2dc4:	410d5d13          	sra	s10,s10,0x10
    2dc8:	41fd5c93          	sra	s9,s10,0x1f
    2dcc:	000c8793          	mv	a5,s9
    2dd0:	f207d663          	bgez	a5,24fc <_vfprintf_r+0xb70>
    2dd4:	01a037b3          	snez	a5,s10
    2dd8:	419000b3          	neg	ra,s9
    2ddc:	40f08cb3          	sub	s9,ra,a5
    2de0:	41a00d33          	neg	s10,s10
    2de4:	000e8613          	mv	a2,t4
    2de8:	02d00713          	li	a4,45
    2dec:	00100793          	li	a5,1
    2df0:	de4ff06f          	j	23d4 <_vfprintf_r+0xa48>
    2df4:	00812403          	lw	s0,8(sp)
    2df8:	00f12623          	sw	a5,12(sp)
    2dfc:	05842503          	lw	a0,88(s0)
    2e00:	c31fd0ef          	jal	a30 <__retarget_lock_acquire_recursive>
    2e04:	00c41703          	lh	a4,12(s0)
    2e08:	00c12783          	lw	a5,12(sp)
    2e0c:	c01fe06f          	j	1a0c <_vfprintf_r+0x80>
    2e10:	001ef793          	and	a5,t4,1
    2e14:	00079463          	bnez	a5,2e1c <_vfprintf_r+0x1490>
    2e18:	e7dfe06f          	j	1c94 <_vfprintf_r+0x308>
    2e1c:	85dff06f          	j	2678 <_vfprintf_r+0xcec>
    2e20:	000a0e93          	mv	t4,s4
    2e24:	000b0313          	mv	t1,s6
    2e28:	ea8ff06f          	j	24d0 <_vfprintf_r+0xb44>
    2e2c:	00094e03          	lbu	t3,0(s2)
    2e30:	00f12a23          	sw	a5,20(sp)
    2e34:	d09fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    2e38:	0a412703          	lw	a4,164(sp)
    2e3c:	0000c617          	auipc	a2,0xc
    2e40:	bd460613          	add	a2,a2,-1068 # ea10 <__fini_array_end+0xcc>
    2e44:	00c42023          	sw	a2,0(s0)
    2e48:	00148493          	add	s1,s1,1
    2e4c:	00100613          	li	a2,1
    2e50:	00170713          	add	a4,a4,1
    2e54:	00c42223          	sw	a2,4(s0)
    2e58:	0a912423          	sw	s1,168(sp)
    2e5c:	0ae12223          	sw	a4,164(sp)
    2e60:	00700613          	li	a2,7
    2e64:	00840413          	add	s0,s0,8
    2e68:	2ee64ce3          	blt	a2,a4,3960 <_vfprintf_r+0x1fd4>
    2e6c:	7e069e63          	bnez	a3,3668 <_vfprintf_r+0x1cdc>
    2e70:	01812783          	lw	a5,24(sp)
    2e74:	001ef713          	and	a4,t4,1
    2e78:	00f76733          	or	a4,a4,a5
    2e7c:	00071463          	bnez	a4,2e84 <_vfprintf_r+0x14f8>
    2e80:	e15fe06f          	j	1c94 <_vfprintf_r+0x308>
    2e84:	03412703          	lw	a4,52(sp)
    2e88:	03012783          	lw	a5,48(sp)
    2e8c:	00700693          	li	a3,7
    2e90:	00e42023          	sw	a4,0(s0)
    2e94:	0a412703          	lw	a4,164(sp)
    2e98:	009784b3          	add	s1,a5,s1
    2e9c:	00f42223          	sw	a5,4(s0)
    2ea0:	00170713          	add	a4,a4,1
    2ea4:	0a912423          	sw	s1,168(sp)
    2ea8:	0ae12223          	sw	a4,164(sp)
    2eac:	38e6c8e3          	blt	a3,a4,3a3c <_vfprintf_r+0x20b0>
    2eb0:	00840413          	add	s0,s0,8
    2eb4:	7e80006f          	j	369c <_vfprintf_r+0x1d10>
    2eb8:	03000793          	li	a5,48
    2ebc:	14f107a3          	sb	a5,335(sp)
    2ec0:	14f10c13          	add	s8,sp,335
    2ec4:	d38ff06f          	j	23fc <_vfprintf_r+0xa70>
    2ec8:	20067793          	and	a5,a2,512
    2ecc:	00078463          	beqz	a5,2ed4 <_vfprintf_r+0x1548>
    2ed0:	0ffd7d13          	zext.b	s10,s10
    2ed4:	00000c93          	li	s9,0
    2ed8:	00100793          	li	a5,1
    2edc:	cf4ff06f          	j	23d0 <_vfprintf_r+0xa44>
    2ee0:	200ef793          	and	a5,t4,512
    2ee4:	2c0796e3          	bnez	a5,39b0 <_vfprintf_r+0x2024>
    2ee8:	41fd5c93          	sra	s9,s10,0x1f
    2eec:	000c8793          	mv	a5,s9
    2ef0:	e08ff06f          	j	24f8 <_vfprintf_r+0xb6c>
    2ef4:	200ef793          	and	a5,t4,512
    2ef8:	2a0790e3          	bnez	a5,3998 <_vfprintf_r+0x200c>
    2efc:	00000c93          	li	s9,0
    2f00:	e74ff06f          	j	2574 <_vfprintf_r+0xbe8>
    2f04:	01412783          	lw	a5,20(sp)
    2f08:	06010513          	add	a0,sp,96
    2f0c:	03612223          	sw	s6,36(sp)
    2f10:	0007a703          	lw	a4,0(a5)
    2f14:	03c12023          	sw	t3,32(sp)
    2f18:	00478b13          	add	s6,a5,4
    2f1c:	00072683          	lw	a3,0(a4)
    2f20:	01412823          	sw	s4,16(sp)
    2f24:	06d12023          	sw	a3,96(sp)
    2f28:	00472683          	lw	a3,4(a4)
    2f2c:	06d12223          	sw	a3,100(sp)
    2f30:	00872683          	lw	a3,8(a4)
    2f34:	06d12423          	sw	a3,104(sp)
    2f38:	00c72703          	lw	a4,12(a4)
    2f3c:	06e12623          	sw	a4,108(sp)
    2f40:	4c80b0ef          	jal	e408 <__trunctfdf2>
    2f44:	02012e03          	lw	t3,32(sp)
    2f48:	02412303          	lw	t1,36(sp)
    2f4c:	02a12423          	sw	a0,40(sp)
    2f50:	02b12623          	sw	a1,44(sp)
    2f54:	01612a23          	sw	s6,20(sp)
    2f58:	000a0e93          	mv	t4,s4
    2f5c:	fb1fe06f          	j	1f0c <_vfprintf_r+0x580>
    2f60:	010a7793          	and	a5,s4,16
    2f64:	6c079a63          	bnez	a5,3638 <_vfprintf_r+0x1cac>
    2f68:	040a7793          	and	a5,s4,64
    2f6c:	24079ce3          	bnez	a5,39c4 <_vfprintf_r+0x2038>
    2f70:	200a7f13          	and	t5,s4,512
    2f74:	6c0f0263          	beqz	t5,3638 <_vfprintf_r+0x1cac>
    2f78:	01412783          	lw	a5,20(sp)
    2f7c:	00c12703          	lw	a4,12(sp)
    2f80:	0007a783          	lw	a5,0(a5)
    2f84:	00e78023          	sb	a4,0(a5)
    2f88:	e6cff06f          	j	25f4 <_vfprintf_r+0xc68>
    2f8c:	03c12783          	lw	a5,60(sp)
    2f90:	00094e03          	lbu	t3,0(s2)
    2f94:	00079463          	bnez	a5,2f9c <_vfprintf_r+0x1610>
    2f98:	ba5fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    2f9c:	0007c783          	lbu	a5,0(a5)
    2fa0:	00079463          	bnez	a5,2fa8 <_vfprintf_r+0x161c>
    2fa4:	b99fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    2fa8:	400a6a13          	or	s4,s4,1024
    2fac:	b91fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    2fb0:	fff00b13          	li	s6,-1
    2fb4:	00068913          	mv	s2,a3
    2fb8:	b89fe06f          	j	1b40 <_vfprintf_r+0x1b4>
    2fbc:	0000c797          	auipc	a5,0xc
    2fc0:	a3878793          	add	a5,a5,-1480 # e9f4 <__fini_array_end+0xb0>
    2fc4:	000a0e93          	mv	t4,s4
    2fc8:	000b0313          	mv	t1,s6
    2fcc:	02f12c23          	sw	a5,56(sp)
    2fd0:	020ef793          	and	a5,t4,32
    2fd4:	1c078263          	beqz	a5,3198 <_vfprintf_r+0x180c>
    2fd8:	01412783          	lw	a5,20(sp)
    2fdc:	00778b13          	add	s6,a5,7
    2fe0:	ff8b7b13          	and	s6,s6,-8
    2fe4:	000b2d03          	lw	s10,0(s6)
    2fe8:	004b2c83          	lw	s9,4(s6)
    2fec:	008b0793          	add	a5,s6,8
    2ff0:	00f12a23          	sw	a5,20(sp)
    2ff4:	001ef793          	and	a5,t4,1
    2ff8:	00078e63          	beqz	a5,3014 <_vfprintf_r+0x1688>
    2ffc:	019d67b3          	or	a5,s10,s9
    3000:	00078a63          	beqz	a5,3014 <_vfprintf_r+0x1688>
    3004:	03000793          	li	a5,48
    3008:	06f10c23          	sb	a5,120(sp)
    300c:	07c10ca3          	sb	t3,121(sp)
    3010:	002eee93          	or	t4,t4,2
    3014:	bffef613          	and	a2,t4,-1025
    3018:	00200793          	li	a5,2
    301c:	bb4ff06f          	j	23d0 <_vfprintf_r+0xa44>
    3020:	000b0313          	mv	t1,s6
    3024:	000a0613          	mv	a2,s4
    3028:	b80ff06f          	j	23a8 <_vfprintf_r+0xa1c>
    302c:	000a0e93          	mv	t4,s4
    3030:	000b0313          	mv	t1,s6
    3034:	d1cff06f          	j	2550 <_vfprintf_r+0xbc4>
    3038:	0000c797          	auipc	a5,0xc
    303c:	9a878793          	add	a5,a5,-1624 # e9e0 <__fini_array_end+0x9c>
    3040:	000a0e93          	mv	t4,s4
    3044:	000b0313          	mv	t1,s6
    3048:	02f12c23          	sw	a5,56(sp)
    304c:	f85ff06f          	j	2fd0 <_vfprintf_r+0x1644>
    3050:	00194e03          	lbu	t3,1(s2)
    3054:	020a6a13          	or	s4,s4,32
    3058:	00190913          	add	s2,s2,1
    305c:	ae1fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    3060:	00194e03          	lbu	t3,1(s2)
    3064:	200a6a13          	or	s4,s4,512
    3068:	00190913          	add	s2,s2,1
    306c:	ad1fe06f          	j	1b3c <_vfprintf_r+0x1b0>
    3070:	00812583          	lw	a1,8(sp)
    3074:	0a010613          	add	a2,sp,160
    3078:	00098513          	mv	a0,s3
    307c:	03d12023          	sw	t4,32(sp)
    3080:	7c8010ef          	jal	4848 <__sprint_r>
    3084:	00050463          	beqz	a0,308c <_vfprintf_r+0x1700>
    3088:	dd5fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    308c:	0a812483          	lw	s1,168(sp)
    3090:	02012e83          	lw	t4,32(sp)
    3094:	0ac10413          	add	s0,sp,172
    3098:	e10ff06f          	j	26a8 <_vfprintf_r+0xd1c>
    309c:	00600793          	li	a5,6
    30a0:	00030c93          	mv	s9,t1
    30a4:	0e67e6e3          	bltu	a5,t1,3990 <_vfprintf_r+0x2004>
    30a8:	01612a23          	sw	s6,20(sp)
    30ac:	00012823          	sw	zero,16(sp)
    30b0:	000c8d13          	mv	s10,s9
    30b4:	00000613          	li	a2,0
    30b8:	00000313          	li	t1,0
    30bc:	02012223          	sw	zero,36(sp)
    30c0:	02012023          	sw	zero,32(sp)
    30c4:	00000a13          	li	s4,0
    30c8:	0000cc17          	auipc	s8,0xc
    30cc:	940c0c13          	add	s8,s8,-1728 # ea08 <__fini_array_end+0xc4>
    30d0:	afdfe06f          	j	1bcc <_vfprintf_r+0x240>
    30d4:	00800613          	li	a2,8
    30d8:	00000593          	li	a1,0
    30dc:	09810513          	add	a0,sp,152
    30e0:	03c12023          	sw	t3,32(sp)
    30e4:	01d12823          	sw	t4,16(sp)
    30e8:	951fd0ef          	jal	a38 <memset>
    30ec:	01412783          	lw	a5,20(sp)
    30f0:	0ec10c13          	add	s8,sp,236
    30f4:	09810693          	add	a3,sp,152
    30f8:	0007a603          	lw	a2,0(a5)
    30fc:	000c0593          	mv	a1,s8
    3100:	00098513          	mv	a0,s3
    3104:	530070ef          	jal	a634 <_wcrtomb_r>
    3108:	fff00793          	li	a5,-1
    310c:	01012e83          	lw	t4,16(sp)
    3110:	02012e03          	lw	t3,32(sp)
    3114:	00050d13          	mv	s10,a0
    3118:	00f51463          	bne	a0,a5,3120 <_vfprintf_r+0x1794>
    311c:	4980106f          	j	45b4 <_vfprintf_r+0x2c28>
    3120:	fff54813          	not	a6,a0
    3124:	41f85813          	sra	a6,a6,0x1f
    3128:	01057cb3          	and	s9,a0,a6
    312c:	97cff06f          	j	22a8 <_vfprintf_r+0x91c>
    3130:	03412703          	lw	a4,52(sp)
    3134:	03012783          	lw	a5,48(sp)
    3138:	00700693          	li	a3,7
    313c:	00e42023          	sw	a4,0(s0)
    3140:	0a412703          	lw	a4,164(sp)
    3144:	00f484b3          	add	s1,s1,a5
    3148:	00f42223          	sw	a5,4(s0)
    314c:	00170713          	add	a4,a4,1
    3150:	0a912423          	sw	s1,168(sp)
    3154:	0ae12223          	sw	a4,164(sp)
    3158:	00840413          	add	s0,s0,8
    315c:	a4e6d0e3          	bge	a3,a4,2b9c <_vfprintf_r+0x1210>
    3160:	00812583          	lw	a1,8(sp)
    3164:	0a010613          	add	a2,sp,160
    3168:	00098513          	mv	a0,s3
    316c:	02612223          	sw	t1,36(sp)
    3170:	03d12023          	sw	t4,32(sp)
    3174:	6d4010ef          	jal	4848 <__sprint_r>
    3178:	00050463          	beqz	a0,3180 <_vfprintf_r+0x17f4>
    317c:	ce1fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    3180:	07c12d03          	lw	s10,124(sp)
    3184:	0a812483          	lw	s1,168(sp)
    3188:	02412303          	lw	t1,36(sp)
    318c:	02012e83          	lw	t4,32(sp)
    3190:	0ac10413          	add	s0,sp,172
    3194:	a09ff06f          	j	2b9c <_vfprintf_r+0x1210>
    3198:	01412703          	lw	a4,20(sp)
    319c:	010ef793          	and	a5,t4,16
    31a0:	00072d03          	lw	s10,0(a4)
    31a4:	00470713          	add	a4,a4,4
    31a8:	00e12a23          	sw	a4,20(sp)
    31ac:	08079863          	bnez	a5,323c <_vfprintf_r+0x18b0>
    31b0:	040ef793          	and	a5,t4,64
    31b4:	08078063          	beqz	a5,3234 <_vfprintf_r+0x18a8>
    31b8:	010d1d13          	sll	s10,s10,0x10
    31bc:	010d5d13          	srl	s10,s10,0x10
    31c0:	00000c93          	li	s9,0
    31c4:	e31ff06f          	j	2ff4 <_vfprintf_r+0x1668>
    31c8:	00000d13          	li	s10,0
    31cc:	15010c13          	add	s8,sp,336
    31d0:	a2cff06f          	j	23fc <_vfprintf_r+0xa70>
    31d4:	00812583          	lw	a1,8(sp)
    31d8:	0a010613          	add	a2,sp,160
    31dc:	00098513          	mv	a0,s3
    31e0:	03d12023          	sw	t4,32(sp)
    31e4:	664010ef          	jal	4848 <__sprint_r>
    31e8:	00050463          	beqz	a0,31f0 <_vfprintf_r+0x1864>
    31ec:	c71fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    31f0:	0a812483          	lw	s1,168(sp)
    31f4:	0a412d03          	lw	s10,164(sp)
    31f8:	02012e83          	lw	t4,32(sp)
    31fc:	0ac10b13          	add	s6,sp,172
    3200:	f71fe06f          	j	2170 <_vfprintf_r+0x7e4>
    3204:	00812583          	lw	a1,8(sp)
    3208:	0a010613          	add	a2,sp,160
    320c:	00098513          	mv	a0,s3
    3210:	03d12023          	sw	t4,32(sp)
    3214:	634010ef          	jal	4848 <__sprint_r>
    3218:	00050463          	beqz	a0,3220 <_vfprintf_r+0x1894>
    321c:	c41fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    3220:	0a812483          	lw	s1,168(sp)
    3224:	0a412d03          	lw	s10,164(sp)
    3228:	02012e83          	lw	t4,32(sp)
    322c:	0ac10b13          	add	s6,sp,172
    3230:	f71fe06f          	j	21a0 <_vfprintf_r+0x814>
    3234:	200ef793          	and	a5,t4,512
    3238:	76079663          	bnez	a5,39a4 <_vfprintf_r+0x2018>
    323c:	00000c93          	li	s9,0
    3240:	db5ff06f          	j	2ff4 <_vfprintf_r+0x1668>
    3244:	00000793          	li	a5,0
    3248:	15010b13          	add	s6,sp,336
    324c:	01212823          	sw	s2,16(sp)
    3250:	00078913          	mv	s2,a5
    3254:	00098793          	mv	a5,s3
    3258:	04812823          	sw	s0,80(sp)
    325c:	000b0993          	mv	s3,s6
    3260:	03c12403          	lw	s0,60(sp)
    3264:	40067493          	and	s1,a2,1024
    3268:	0ff00a13          	li	s4,255
    326c:	03c12023          	sw	t3,32(sp)
    3270:	02c12223          	sw	a2,36(sp)
    3274:	04612223          	sw	t1,68(sp)
    3278:	00078b13          	mv	s6,a5
    327c:	0280006f          	j	32a4 <_vfprintf_r+0x1918>
    3280:	00a00613          	li	a2,10
    3284:	00000693          	li	a3,0
    3288:	000d0513          	mv	a0,s10
    328c:	000c8593          	mv	a1,s9
    3290:	581070ef          	jal	b010 <__udivdi3>
    3294:	6a0c8ee3          	beqz	s9,4150 <_vfprintf_r+0x27c4>
    3298:	00050d13          	mv	s10,a0
    329c:	00058c93          	mv	s9,a1
    32a0:	000c0993          	mv	s3,s8
    32a4:	00a00613          	li	a2,10
    32a8:	00000693          	li	a3,0
    32ac:	000d0513          	mv	a0,s10
    32b0:	000c8593          	mv	a1,s9
    32b4:	408080ef          	jal	b6bc <__umoddi3>
    32b8:	03050513          	add	a0,a0,48
    32bc:	fea98fa3          	sb	a0,-1(s3)
    32c0:	fff98c13          	add	s8,s3,-1
    32c4:	00190913          	add	s2,s2,1
    32c8:	fa048ce3          	beqz	s1,3280 <_vfprintf_r+0x18f4>
    32cc:	00044783          	lbu	a5,0(s0)
    32d0:	faf918e3          	bne	s2,a5,3280 <_vfprintf_r+0x18f4>
    32d4:	fb4906e3          	beq	s2,s4,3280 <_vfprintf_r+0x18f4>
    32d8:	560c9ae3          	bnez	s9,404c <_vfprintf_r+0x26c0>
    32dc:	00900793          	li	a5,9
    32e0:	57a7e6e3          	bltu	a5,s10,404c <_vfprintf_r+0x26c0>
    32e4:	02412603          	lw	a2,36(sp)
    32e8:	15010793          	add	a5,sp,336
    32ec:	02812e23          	sw	s0,60(sp)
    32f0:	01212c23          	sw	s2,24(sp)
    32f4:	02012e03          	lw	t3,32(sp)
    32f8:	01012903          	lw	s2,16(sp)
    32fc:	04412303          	lw	t1,68(sp)
    3300:	05012403          	lw	s0,80(sp)
    3304:	000b0993          	mv	s3,s6
    3308:	41878d33          	sub	s10,a5,s8
    330c:	00060e93          	mv	t4,a2
    3310:	8ecff06f          	j	23fc <_vfprintf_r+0xa70>
    3314:	00812583          	lw	a1,8(sp)
    3318:	0a010613          	add	a2,sp,160
    331c:	00098513          	mv	a0,s3
    3320:	04612e23          	sw	t1,92(sp)
    3324:	05c12c23          	sw	t3,88(sp)
    3328:	05d12a23          	sw	t4,84(sp)
    332c:	05f12823          	sw	t6,80(sp)
    3330:	04512223          	sw	t0,68(sp)
    3334:	514010ef          	jal	4848 <__sprint_r>
    3338:	00050463          	beqz	a0,3340 <_vfprintf_r+0x19b4>
    333c:	b21fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    3340:	07714603          	lbu	a2,119(sp)
    3344:	0a812483          	lw	s1,168(sp)
    3348:	05c12303          	lw	t1,92(sp)
    334c:	05812e03          	lw	t3,88(sp)
    3350:	05412e83          	lw	t4,84(sp)
    3354:	05012f83          	lw	t6,80(sp)
    3358:	04412283          	lw	t0,68(sp)
    335c:	0ac10413          	add	s0,sp,172
    3360:	88dfe06f          	j	1bec <_vfprintf_r+0x260>
    3364:	02812883          	lw	a7,40(sp)
    3368:	02c12703          	lw	a4,44(sp)
    336c:	02612223          	sw	t1,36(sp)
    3370:	00088613          	mv	a2,a7
    3374:	00088513          	mv	a0,a7
    3378:	00070693          	mv	a3,a4
    337c:	00070593          	mv	a1,a4
    3380:	03c12023          	sw	t3,32(sp)
    3384:	01d12823          	sw	t4,16(sp)
    3388:	62d0a0ef          	jal	e1b4 <__unorddf2>
    338c:	01012e83          	lw	t4,16(sp)
    3390:	02012e03          	lw	t3,32(sp)
    3394:	02412303          	lw	t1,36(sp)
    3398:	00050463          	beqz	a0,33a0 <_vfprintf_r+0x1a14>
    339c:	0e00106f          	j	447c <_vfprintf_r+0x2af0>
    33a0:	06100713          	li	a4,97
    33a4:	08ee0263          	beq	t3,a4,3428 <_vfprintf_r+0x1a9c>
    33a8:	04100713          	li	a4,65
    33ac:	05800793          	li	a5,88
    33b0:	06ee0e63          	beq	t3,a4,342c <_vfprintf_r+0x1aa0>
    33b4:	fff00713          	li	a4,-1
    33b8:	00e31463          	bne	t1,a4,33c0 <_vfprintf_r+0x1a34>
    33bc:	01c0106f          	j	43d8 <_vfprintf_r+0x2a4c>
    33c0:	fdfe7713          	and	a4,t3,-33
    33c4:	04700693          	li	a3,71
    33c8:	00012823          	sw	zero,16(sp)
    33cc:	00d71663          	bne	a4,a3,33d8 <_vfprintf_r+0x1a4c>
    33d0:	00031463          	bnez	t1,33d8 <_vfprintf_r+0x1a4c>
    33d4:	00100313          	li	t1,1
    33d8:	100ee793          	or	a5,t4,256
    33dc:	00078b13          	mv	s6,a5
    33e0:	02c12783          	lw	a5,44(sp)
    33e4:	04012223          	sw	zero,68(sp)
    33e8:	00078493          	mv	s1,a5
    33ec:	0007da63          	bgez	a5,3400 <_vfprintf_r+0x1a74>
    33f0:	800004b7          	lui	s1,0x80000
    33f4:	00f4c4b3          	xor	s1,s1,a5
    33f8:	02d00793          	li	a5,45
    33fc:	04f12223          	sw	a5,68(sp)
    3400:	fbfe0713          	add	a4,t3,-65
    3404:	02500693          	li	a3,37
    3408:	3ae6e463          	bltu	a3,a4,37b0 <_vfprintf_r+0x1e24>
    340c:	0000c697          	auipc	a3,0xc
    3410:	a2468693          	add	a3,a3,-1500 # ee30 <_ctype_+0x270>
    3414:	00271713          	sll	a4,a4,0x2
    3418:	00d70733          	add	a4,a4,a3
    341c:	00072703          	lw	a4,0(a4)
    3420:	00d70733          	add	a4,a4,a3
    3424:	00070067          	jr	a4
    3428:	07800793          	li	a5,120
    342c:	03000713          	li	a4,48
    3430:	06e10c23          	sb	a4,120(sp)
    3434:	06f10ca3          	sb	a5,121(sp)
    3438:	06300713          	li	a4,99
    343c:	00012823          	sw	zero,16(sp)
    3440:	002eee93          	or	t4,t4,2
    3444:	0ec10c13          	add	s8,sp,236
    3448:	f86758e3          	bge	a4,t1,33d8 <_vfprintf_r+0x1a4c>
    344c:	00130593          	add	a1,t1,1
    3450:	00098513          	mv	a0,s3
    3454:	03c12023          	sw	t3,32(sp)
    3458:	01d12c23          	sw	t4,24(sp)
    345c:	00612823          	sw	t1,16(sp)
    3460:	d35fd0ef          	jal	1194 <_malloc_r>
    3464:	01012303          	lw	t1,16(sp)
    3468:	01812e83          	lw	t4,24(sp)
    346c:	02012e03          	lw	t3,32(sp)
    3470:	00050c13          	mv	s8,a0
    3474:	00051463          	bnez	a0,347c <_vfprintf_r+0x1af0>
    3478:	13c0106f          	j	45b4 <_vfprintf_r+0x2c28>
    347c:	00a12823          	sw	a0,16(sp)
    3480:	f59ff06f          	j	33d8 <_vfprintf_r+0x1a4c>
    3484:	00098513          	mv	a0,s3
    3488:	1d0030ef          	jal	6658 <__sinit>
    348c:	00c12783          	lw	a5,12(sp)
    3490:	d5cfe06f          	j	19ec <_vfprintf_r+0x60>
    3494:	00812583          	lw	a1,8(sp)
    3498:	0a010613          	add	a2,sp,160
    349c:	00098513          	mv	a0,s3
    34a0:	03d12023          	sw	t4,32(sp)
    34a4:	3a4010ef          	jal	4848 <__sprint_r>
    34a8:	00050463          	beqz	a0,34b0 <_vfprintf_r+0x1b24>
    34ac:	9b1fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    34b0:	0a812483          	lw	s1,168(sp)
    34b4:	02012e83          	lw	t4,32(sp)
    34b8:	0ac10413          	add	s0,sp,172
    34bc:	9b0ff06f          	j	266c <_vfprintf_r+0xce0>
    34c0:	00800613          	li	a2,8
    34c4:	00000593          	li	a1,0
    34c8:	09810513          	add	a0,sp,152
    34cc:	02612023          	sw	t1,32(sp)
    34d0:	01c12a23          	sw	t3,20(sp)
    34d4:	01d12823          	sw	t4,16(sp)
    34d8:	09812223          	sw	s8,132(sp)
    34dc:	d5cfd0ef          	jal	a38 <memset>
    34e0:	02012303          	lw	t1,32(sp)
    34e4:	01012e83          	lw	t4,16(sp)
    34e8:	01412e03          	lw	t3,20(sp)
    34ec:	3a0340e3          	bltz	t1,408c <_vfprintf_r+0x2700>
    34f0:	00000d13          	li	s10,0
    34f4:	01212823          	sw	s2,16(sp)
    34f8:	000c0c93          	mv	s9,s8
    34fc:	fff00493          	li	s1,-1
    3500:	000b0c13          	mv	s8,s6
    3504:	000e8a13          	mv	s4,t4
    3508:	00040b13          	mv	s6,s0
    350c:	000d0913          	mv	s2,s10
    3510:	00030413          	mv	s0,t1
    3514:	0300006f          	j	3544 <_vfprintf_r+0x1bb8>
    3518:	09810693          	add	a3,sp,152
    351c:	0ec10593          	add	a1,sp,236
    3520:	00098513          	mv	a0,s3
    3524:	110070ef          	jal	a634 <_wcrtomb_r>
    3528:	68950ae3          	beq	a0,s1,43bc <_vfprintf_r+0x2a30>
    352c:	00a907b3          	add	a5,s2,a0
    3530:	02f44263          	blt	s0,a5,3554 <_vfprintf_r+0x1bc8>
    3534:	004d0d13          	add	s10,s10,4
    3538:	00879463          	bne	a5,s0,3540 <_vfprintf_r+0x1bb4>
    353c:	7990006f          	j	44d4 <_vfprintf_r+0x2b48>
    3540:	00078913          	mv	s2,a5
    3544:	08412783          	lw	a5,132(sp)
    3548:	01a787b3          	add	a5,a5,s10
    354c:	0007a603          	lw	a2,0(a5)
    3550:	fc0614e3          	bnez	a2,3518 <_vfprintf_r+0x1b8c>
    3554:	00090d13          	mv	s10,s2
    3558:	01412e03          	lw	t3,20(sp)
    355c:	01012903          	lw	s2,16(sp)
    3560:	000b0413          	mv	s0,s6
    3564:	000a0e93          	mv	t4,s4
    3568:	000c0b13          	mv	s6,s8
    356c:	000c8c13          	mv	s8,s9
    3570:	340d0ce3          	beqz	s10,40c8 <_vfprintf_r+0x273c>
    3574:	06300793          	li	a5,99
    3578:	59a7dee3          	bge	a5,s10,4314 <_vfprintf_r+0x2988>
    357c:	001d0593          	add	a1,s10,1
    3580:	00098513          	mv	a0,s3
    3584:	01c12a23          	sw	t3,20(sp)
    3588:	01d12823          	sw	t4,16(sp)
    358c:	c09fd0ef          	jal	1194 <_malloc_r>
    3590:	01012e83          	lw	t4,16(sp)
    3594:	01412e03          	lw	t3,20(sp)
    3598:	00050c13          	mv	s8,a0
    359c:	620500e3          	beqz	a0,43bc <_vfprintf_r+0x2a30>
    35a0:	00a12823          	sw	a0,16(sp)
    35a4:	00800613          	li	a2,8
    35a8:	00000593          	li	a1,0
    35ac:	09810513          	add	a0,sp,152
    35b0:	03c12023          	sw	t3,32(sp)
    35b4:	01d12a23          	sw	t4,20(sp)
    35b8:	c80fd0ef          	jal	a38 <memset>
    35bc:	09810713          	add	a4,sp,152
    35c0:	000d0693          	mv	a3,s10
    35c4:	08410613          	add	a2,sp,132
    35c8:	000c0593          	mv	a1,s8
    35cc:	00098513          	mv	a0,s3
    35d0:	0f0070ef          	jal	a6c0 <_wcsrtombs_r>
    35d4:	01412e83          	lw	t4,20(sp)
    35d8:	02012e03          	lw	t3,32(sp)
    35dc:	00ad0463          	beq	s10,a0,35e4 <_vfprintf_r+0x1c58>
    35e0:	0240106f          	j	4604 <_vfprintf_r+0x2c78>
    35e4:	01ac0733          	add	a4,s8,s10
    35e8:	00070023          	sb	zero,0(a4)
    35ec:	07714603          	lbu	a2,119(sp)
    35f0:	fffd4813          	not	a6,s10
    35f4:	41f85813          	sra	a6,a6,0x1f
    35f8:	01612a23          	sw	s6,20(sp)
    35fc:	02012223          	sw	zero,36(sp)
    3600:	02012023          	sw	zero,32(sp)
    3604:	010d7cb3          	and	s9,s10,a6
    3608:	00000313          	li	t1,0
    360c:	00000a13          	li	s4,0
    3610:	00061463          	bnez	a2,3618 <_vfprintf_r+0x1c8c>
    3614:	db8fe06f          	j	1bcc <_vfprintf_r+0x240>
    3618:	9d5fe06f          	j	1fec <_vfprintf_r+0x660>
    361c:	00048e93          	mv	t4,s1
    3620:	000a0293          	mv	t0,s4
    3624:	00070493          	mv	s1,a4
    3628:	01a484b3          	add	s1,s1,s10
    362c:	00178793          	add	a5,a5,1
    3630:	00542023          	sw	t0,0(s0)
    3634:	e48fe06f          	j	1c7c <_vfprintf_r+0x2f0>
    3638:	01412783          	lw	a5,20(sp)
    363c:	00c12703          	lw	a4,12(sp)
    3640:	0007a783          	lw	a5,0(a5)
    3644:	00e7a023          	sw	a4,0(a5)
    3648:	fadfe06f          	j	25f4 <_vfprintf_r+0xc68>
    364c:	02012e83          	lw	t4,32(sp)
    3650:	00040293          	mv	t0,s0
    3654:	000a0413          	mv	s0,s4
    3658:	008484b3          	add	s1,s1,s0
    365c:	001d0d13          	add	s10,s10,1
    3660:	005b2023          	sw	t0,0(s6)
    3664:	b7dfe06f          	j	21e0 <_vfprintf_r+0x854>
    3668:	03412703          	lw	a4,52(sp)
    366c:	03012783          	lw	a5,48(sp)
    3670:	00700613          	li	a2,7
    3674:	00e42023          	sw	a4,0(s0)
    3678:	0a412703          	lw	a4,164(sp)
    367c:	009784b3          	add	s1,a5,s1
    3680:	00f42223          	sw	a5,4(s0)
    3684:	00170713          	add	a4,a4,1
    3688:	0a912423          	sw	s1,168(sp)
    368c:	0ae12223          	sw	a4,164(sp)
    3690:	00840413          	add	s0,s0,8
    3694:	3ae64463          	blt	a2,a4,3a3c <_vfprintf_r+0x20b0>
    3698:	3e06cee3          	bltz	a3,4294 <_vfprintf_r+0x2908>
    369c:	01812783          	lw	a5,24(sp)
    36a0:	00170713          	add	a4,a4,1
    36a4:	01842023          	sw	s8,0(s0)
    36a8:	009784b3          	add	s1,a5,s1
    36ac:	00f42223          	sw	a5,4(s0)
    36b0:	0a912423          	sw	s1,168(sp)
    36b4:	0ae12223          	sw	a4,164(sp)
    36b8:	00700793          	li	a5,7
    36bc:	00e7c463          	blt	a5,a4,36c4 <_vfprintf_r+0x1d38>
    36c0:	dd0fe06f          	j	1c90 <_vfprintf_r+0x304>
    36c4:	b61fe06f          	j	2224 <_vfprintf_r+0x898>
    36c8:	01000613          	li	a2,16
    36cc:	0a412683          	lw	a3,164(sp)
    36d0:	0000b297          	auipc	t0,0xb
    36d4:	7f828293          	add	t0,t0,2040 # eec8 <zeroes.0>
    36d8:	09665463          	bge	a2,s6,3760 <_vfprintf_r+0x1dd4>
    36dc:	00040793          	mv	a5,s0
    36e0:	00048713          	mv	a4,s1
    36e4:	00812403          	lw	s0,8(sp)
    36e8:	01000893          	li	a7,16
    36ec:	00700d13          	li	s10,7
    36f0:	05d12223          	sw	t4,68(sp)
    36f4:	00028493          	mv	s1,t0
    36f8:	00c0006f          	j	3704 <_vfprintf_r+0x1d78>
    36fc:	ff0b0b13          	add	s6,s6,-16
    3700:	0568d863          	bge	a7,s6,3750 <_vfprintf_r+0x1dc4>
    3704:	01070713          	add	a4,a4,16
    3708:	00168693          	add	a3,a3,1
    370c:	0097a023          	sw	s1,0(a5)
    3710:	0117a223          	sw	a7,4(a5)
    3714:	0ae12423          	sw	a4,168(sp)
    3718:	0ad12223          	sw	a3,164(sp)
    371c:	00878793          	add	a5,a5,8
    3720:	fcdd5ee3          	bge	s10,a3,36fc <_vfprintf_r+0x1d70>
    3724:	0a010613          	add	a2,sp,160
    3728:	00040593          	mv	a1,s0
    372c:	00098513          	mv	a0,s3
    3730:	118010ef          	jal	4848 <__sprint_r>
    3734:	00050463          	beqz	a0,373c <_vfprintf_r+0x1db0>
    3738:	f24fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    373c:	0a812703          	lw	a4,168(sp)
    3740:	0a412683          	lw	a3,164(sp)
    3744:	0ac10793          	add	a5,sp,172
    3748:	01000893          	li	a7,16
    374c:	fb1ff06f          	j	36fc <_vfprintf_r+0x1d70>
    3750:	04412e83          	lw	t4,68(sp)
    3754:	00048293          	mv	t0,s1
    3758:	00078413          	mv	s0,a5
    375c:	00070493          	mv	s1,a4
    3760:	016484b3          	add	s1,s1,s6
    3764:	00168693          	add	a3,a3,1
    3768:	00542023          	sw	t0,0(s0)
    376c:	01642223          	sw	s6,4(s0)
    3770:	0a912423          	sw	s1,168(sp)
    3774:	0ad12223          	sw	a3,164(sp)
    3778:	00700713          	li	a4,7
    377c:	00840413          	add	s0,s0,8
    3780:	bed75c63          	bge	a4,a3,2b78 <_vfprintf_r+0x11ec>
    3784:	00812583          	lw	a1,8(sp)
    3788:	0a010613          	add	a2,sp,160
    378c:	00098513          	mv	a0,s3
    3790:	05d12223          	sw	t4,68(sp)
    3794:	0b4010ef          	jal	4848 <__sprint_r>
    3798:	00050463          	beqz	a0,37a0 <_vfprintf_r+0x1e14>
    379c:	ec0fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    37a0:	0a812483          	lw	s1,168(sp)
    37a4:	04412e83          	lw	t4,68(sp)
    37a8:	0ac10413          	add	s0,sp,172
    37ac:	bccff06f          	j	2b78 <_vfprintf_r+0x11ec>
    37b0:	02812703          	lw	a4,40(sp)
    37b4:	09810893          	add	a7,sp,152
    37b8:	08410813          	add	a6,sp,132
    37bc:	00070513          	mv	a0,a4
    37c0:	00050593          	mv	a1,a0
    37c4:	00030713          	mv	a4,t1
    37c8:	07c10793          	add	a5,sp,124
    37cc:	00200693          	li	a3,2
    37d0:	00048613          	mv	a2,s1
    37d4:	00098513          	mv	a0,s3
    37d8:	03c12223          	sw	t3,36(sp)
    37dc:	03d12023          	sw	t4,32(sp)
    37e0:	00612c23          	sw	t1,24(sp)
    37e4:	3a8040ef          	jal	7b8c <_dtoa_r>
    37e8:	02012e83          	lw	t4,32(sp)
    37ec:	01812303          	lw	t1,24(sp)
    37f0:	02412e03          	lw	t3,36(sp)
    37f4:	001ef713          	and	a4,t4,1
    37f8:	00050c13          	mv	s8,a0
    37fc:	1a0712e3          	bnez	a4,41a0 <_vfprintf_r+0x2814>
    3800:	09812783          	lw	a5,152(sp)
    3804:	07c12a03          	lw	s4,124(sp)
    3808:	40a787b3          	sub	a5,a5,a0
    380c:	00f12c23          	sw	a5,24(sp)
    3810:	ffd00713          	li	a4,-3
    3814:	00ea4463          	blt	s4,a4,381c <_vfprintf_r+0x1e90>
    3818:	5b435663          	bge	t1,s4,3dc4 <_vfprintf_r+0x2438>
    381c:	ffee0e13          	add	t3,t3,-2
    3820:	fffa0d13          	add	s10,s4,-1
    3824:	07a12e23          	sw	s10,124(sp)
    3828:	0ffe7693          	zext.b	a3,t3
    382c:	00000613          	li	a2,0
    3830:	08d10423          	sb	a3,136(sp)
    3834:	02b00693          	li	a3,43
    3838:	000d5863          	bgez	s10,3848 <_vfprintf_r+0x1ebc>
    383c:	00100713          	li	a4,1
    3840:	41470d33          	sub	s10,a4,s4
    3844:	02d00693          	li	a3,45
    3848:	08d104a3          	sb	a3,137(sp)
    384c:	00900693          	li	a3,9
    3850:	33a6d8e3          	bge	a3,s10,4380 <_vfprintf_r+0x29f4>
    3854:	000c0793          	mv	a5,s8
    3858:	09f10493          	add	s1,sp,159
    385c:	03212023          	sw	s2,32(sp)
    3860:	00040c13          	mv	s8,s0
    3864:	06300a13          	li	s4,99
    3868:	000d0413          	mv	s0,s10
    386c:	03d12223          	sw	t4,36(sp)
    3870:	05c12023          	sw	t3,64(sp)
    3874:	00048913          	mv	s2,s1
    3878:	00098c93          	mv	s9,s3
    387c:	00078d13          	mv	s10,a5
    3880:	00a00593          	li	a1,10
    3884:	00040513          	mv	a0,s0
    3888:	0040b0ef          	jal	e88c <__modsi3>
    388c:	03050713          	add	a4,a0,48
    3890:	00090b13          	mv	s6,s2
    3894:	00040513          	mv	a0,s0
    3898:	feeb0fa3          	sb	a4,-1(s6)
    389c:	00a00593          	li	a1,10
    38a0:	00040993          	mv	s3,s0
    38a4:	7650a0ef          	jal	e808 <__divsi3>
    38a8:	fff90913          	add	s2,s2,-1
    38ac:	00050413          	mv	s0,a0
    38b0:	fd3a48e3          	blt	s4,s3,3880 <_vfprintf_r+0x1ef4>
    38b4:	000c8993          	mv	s3,s9
    38b8:	03050713          	add	a4,a0,48
    38bc:	00090c93          	mv	s9,s2
    38c0:	ffeb0693          	add	a3,s6,-2
    38c4:	feec8fa3          	sb	a4,-1(s9)
    38c8:	000c0413          	mv	s0,s8
    38cc:	02412e83          	lw	t4,36(sp)
    38d0:	04012e03          	lw	t3,64(sp)
    38d4:	02012903          	lw	s2,32(sp)
    38d8:	000d0c13          	mv	s8,s10
    38dc:	4c96f6e3          	bgeu	a3,s1,45a8 <_vfprintf_r+0x2c1c>
    38e0:	08a10713          	add	a4,sp,138
    38e4:	0006c783          	lbu	a5,0(a3)
    38e8:	00168693          	add	a3,a3,1
    38ec:	00170713          	add	a4,a4,1
    38f0:	fef70fa3          	sb	a5,-1(a4)
    38f4:	fe9698e3          	bne	a3,s1,38e4 <_vfprintf_r+0x1f58>
    38f8:	15010793          	add	a5,sp,336
    38fc:	41678633          	sub	a2,a5,s6
    3900:	f5360793          	add	a5,a2,-173
    3904:	04f12023          	sw	a5,64(sp)
    3908:	01812783          	lw	a5,24(sp)
    390c:	04012683          	lw	a3,64(sp)
    3910:	00100713          	li	a4,1
    3914:	00d78d33          	add	s10,a5,a3
    3918:	28f75ce3          	bge	a4,a5,43b0 <_vfprintf_r+0x2a24>
    391c:	03012783          	lw	a5,48(sp)
    3920:	00fd0d33          	add	s10,s10,a5
    3924:	fffd4813          	not	a6,s10
    3928:	bffeff13          	and	t5,t4,-1025
    392c:	41f85813          	sra	a6,a6,0x1f
    3930:	100f6e93          	or	t4,t5,256
    3934:	010d7cb3          	and	s9,s10,a6
    3938:	02012223          	sw	zero,36(sp)
    393c:	02012023          	sw	zero,32(sp)
    3940:	00000a13          	li	s4,0
    3944:	04412783          	lw	a5,68(sp)
    3948:	46079263          	bnez	a5,3dac <_vfprintf_r+0x2420>
    394c:	07714603          	lbu	a2,119(sp)
    3950:	00000313          	li	t1,0
    3954:	00061463          	bnez	a2,395c <_vfprintf_r+0x1fd0>
    3958:	a74fe06f          	j	1bcc <_vfprintf_r+0x240>
    395c:	e90fe06f          	j	1fec <_vfprintf_r+0x660>
    3960:	00812583          	lw	a1,8(sp)
    3964:	0a010613          	add	a2,sp,160
    3968:	00098513          	mv	a0,s3
    396c:	03d12023          	sw	t4,32(sp)
    3970:	6d9000ef          	jal	4848 <__sprint_r>
    3974:	00050463          	beqz	a0,397c <_vfprintf_r+0x1ff0>
    3978:	ce4fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    397c:	07c12683          	lw	a3,124(sp)
    3980:	0a812483          	lw	s1,168(sp)
    3984:	02012e83          	lw	t4,32(sp)
    3988:	0ac10413          	add	s0,sp,172
    398c:	ce0ff06f          	j	2e6c <_vfprintf_r+0x14e0>
    3990:	00600c93          	li	s9,6
    3994:	f14ff06f          	j	30a8 <_vfprintf_r+0x171c>
    3998:	0ffd7d13          	zext.b	s10,s10
    399c:	00000c93          	li	s9,0
    39a0:	bd5fe06f          	j	2574 <_vfprintf_r+0xbe8>
    39a4:	0ffd7d13          	zext.b	s10,s10
    39a8:	00000c93          	li	s9,0
    39ac:	e48ff06f          	j	2ff4 <_vfprintf_r+0x1668>
    39b0:	018d1d13          	sll	s10,s10,0x18
    39b4:	418d5d13          	sra	s10,s10,0x18
    39b8:	41fd5c93          	sra	s9,s10,0x1f
    39bc:	000c8793          	mv	a5,s9
    39c0:	b39fe06f          	j	24f8 <_vfprintf_r+0xb6c>
    39c4:	01412783          	lw	a5,20(sp)
    39c8:	00c12703          	lw	a4,12(sp)
    39cc:	0007a783          	lw	a5,0(a5)
    39d0:	00e79023          	sh	a4,0(a5)
    39d4:	c21fe06f          	j	25f4 <_vfprintf_r+0xc68>
    39d8:	000c0513          	mv	a0,s8
    39dc:	05d12223          	sw	t4,68(sp)
    39e0:	ad8fd0ef          	jal	cb8 <strlen>
    39e4:	07714603          	lbu	a2,119(sp)
    39e8:	fff54813          	not	a6,a0
    39ec:	41f85813          	sra	a6,a6,0x1f
    39f0:	01612a23          	sw	s6,20(sp)
    39f4:	02012223          	sw	zero,36(sp)
    39f8:	02012023          	sw	zero,32(sp)
    39fc:	00012823          	sw	zero,16(sp)
    3a00:	04412e83          	lw	t4,68(sp)
    3a04:	00050d13          	mv	s10,a0
    3a08:	01057cb3          	and	s9,a0,a6
    3a0c:	00000313          	li	t1,0
    3a10:	07300e13          	li	t3,115
    3a14:	00061463          	bnez	a2,3a1c <_vfprintf_r+0x2090>
    3a18:	9b4fe06f          	j	1bcc <_vfprintf_r+0x240>
    3a1c:	dd0fe06f          	j	1fec <_vfprintf_r+0x660>
    3a20:	00812583          	lw	a1,8(sp)
    3a24:	0a010613          	add	a2,sp,160
    3a28:	00098513          	mv	a0,s3
    3a2c:	61d000ef          	jal	4848 <__sprint_r>
    3a30:	00051463          	bnez	a0,3a38 <_vfprintf_r+0x20ac>
    3a34:	be8fe06f          	j	1e1c <_vfprintf_r+0x490>
    3a38:	c38fe06f          	j	1e70 <_vfprintf_r+0x4e4>
    3a3c:	00812583          	lw	a1,8(sp)
    3a40:	0a010613          	add	a2,sp,160
    3a44:	00098513          	mv	a0,s3
    3a48:	03d12023          	sw	t4,32(sp)
    3a4c:	5fd000ef          	jal	4848 <__sprint_r>
    3a50:	00050463          	beqz	a0,3a58 <_vfprintf_r+0x20cc>
    3a54:	c08fe06f          	j	1e5c <_vfprintf_r+0x4d0>
    3a58:	07c12683          	lw	a3,124(sp)
    3a5c:	0a812483          	lw	s1,168(sp)
    3a60:	0a412703          	lw	a4,164(sp)
    3a64:	02012e83          	lw	t4,32(sp)
    3a68:	0ac10413          	add	s0,sp,172
    3a6c:	c2dff06f          	j	3698 <_vfprintf_r+0x1d0c>
    3a70:	05862503          	lw	a0,88(a2)
    3a74:	00f12623          	sw	a5,12(sp)
    3a78:	fbdfc0ef          	jal	a34 <__retarget_lock_release_recursive>
    3a7c:	00c12783          	lw	a5,12(sp)
    3a80:	ab8fe06f          	j	1d38 <_vfprintf_r+0x3ac>
    3a84:	00130a13          	add	s4,t1,1
    3a88:	00200693          	li	a3,2
    3a8c:	02812703          	lw	a4,40(sp)
    3a90:	09810893          	add	a7,sp,152
    3a94:	08410813          	add	a6,sp,132
    3a98:	00070513          	mv	a0,a4
    3a9c:	00050593          	mv	a1,a0
    3aa0:	000a0713          	mv	a4,s4
    3aa4:	07c10793          	add	a5,sp,124
    3aa8:	00048613          	mv	a2,s1
    3aac:	00098513          	mv	a0,s3
    3ab0:	02612223          	sw	t1,36(sp)
    3ab4:	03c12023          	sw	t3,32(sp)
    3ab8:	01d12c23          	sw	t4,24(sp)
    3abc:	0d0040ef          	jal	7b8c <_dtoa_r>
    3ac0:	02012e03          	lw	t3,32(sp)
    3ac4:	04600693          	li	a3,70
    3ac8:	01812e83          	lw	t4,24(sp)
    3acc:	fdfe7d13          	and	s10,t3,-33
    3ad0:	02412303          	lw	t1,36(sp)
    3ad4:	00050c13          	mv	s8,a0
    3ad8:	01450733          	add	a4,a0,s4
    3adc:	34dd14e3          	bne	s10,a3,4624 <_vfprintf_r+0x2c98>
    3ae0:	000c4603          	lbu	a2,0(s8)
    3ae4:	03000693          	li	a3,48
    3ae8:	6cd60263          	beq	a2,a3,41ac <_vfprintf_r+0x2820>
    3aec:	07c12683          	lw	a3,124(sp)
    3af0:	00d70733          	add	a4,a4,a3
    3af4:	02812683          	lw	a3,40(sp)
    3af8:	00048593          	mv	a1,s1
    3afc:	00000613          	li	a2,0
    3b00:	00068513          	mv	a0,a3
    3b04:	00000693          	li	a3,0
    3b08:	04e12823          	sw	a4,80(sp)
    3b0c:	02612223          	sw	t1,36(sp)
    3b10:	03c12023          	sw	t3,32(sp)
    3b14:	01d12c23          	sw	t4,24(sp)
    3b18:	370090ef          	jal	ce88 <__eqdf2>
    3b1c:	01812e83          	lw	t4,24(sp)
    3b20:	02012e03          	lw	t3,32(sp)
    3b24:	02412303          	lw	t1,36(sp)
    3b28:	05012703          	lw	a4,80(sp)
    3b2c:	62050863          	beqz	a0,415c <_vfprintf_r+0x27d0>
    3b30:	09812783          	lw	a5,152(sp)
    3b34:	00e7fe63          	bgeu	a5,a4,3b50 <_vfprintf_r+0x21c4>
    3b38:	03000613          	li	a2,48
    3b3c:	00178693          	add	a3,a5,1
    3b40:	08d12c23          	sw	a3,152(sp)
    3b44:	00c78023          	sb	a2,0(a5)
    3b48:	09812783          	lw	a5,152(sp)
    3b4c:	fee7e8e3          	bltu	a5,a4,3b3c <_vfprintf_r+0x21b0>
    3b50:	07c12a03          	lw	s4,124(sp)
    3b54:	418787b3          	sub	a5,a5,s8
    3b58:	04700713          	li	a4,71
    3b5c:	00f12c23          	sw	a5,24(sp)
    3b60:	caed08e3          	beq	s10,a4,3810 <_vfprintf_r+0x1e84>
    3b64:	04600713          	li	a4,70
    3b68:	68ed0863          	beq	s10,a4,41f8 <_vfprintf_r+0x286c>
    3b6c:	fffa0d13          	add	s10,s4,-1
    3b70:	cb5ff06f          	j	3824 <_vfprintf_r+0x1e98>
    3b74:	02812703          	lw	a4,40(sp)
    3b78:	07c10613          	add	a2,sp,124
    3b7c:	00048593          	mv	a1,s1
    3b80:	00070513          	mv	a0,a4
    3b84:	02612223          	sw	t1,36(sp)
    3b88:	03c12023          	sw	t3,32(sp)
    3b8c:	01d12c23          	sw	t4,24(sp)
    3b90:	4e9030ef          	jal	7878 <frexp>
    3b94:	7fffd717          	auipc	a4,0x7fffd
    3b98:	b1470713          	add	a4,a4,-1260 # 800006a8 <__global_locale+0x174>
    3b9c:	00072603          	lw	a2,0(a4)
    3ba0:	00472683          	lw	a3,4(a4)
    3ba4:	578090ef          	jal	d11c <__muldf3>
    3ba8:	00000613          	li	a2,0
    3bac:	00000693          	li	a3,0
    3bb0:	00050a13          	mv	s4,a0
    3bb4:	00058d13          	mv	s10,a1
    3bb8:	2d0090ef          	jal	ce88 <__eqdf2>
    3bbc:	01812e83          	lw	t4,24(sp)
    3bc0:	02012e03          	lw	t3,32(sp)
    3bc4:	02412303          	lw	t1,36(sp)
    3bc8:	00051663          	bnez	a0,3bd4 <_vfprintf_r+0x2248>
    3bcc:	00100713          	li	a4,1
    3bd0:	06e12e23          	sw	a4,124(sp)
    3bd4:	0000b797          	auipc	a5,0xb
    3bd8:	e2078793          	add	a5,a5,-480 # e9f4 <__fini_array_end+0xb0>
    3bdc:	06100713          	li	a4,97
    3be0:	02f12023          	sw	a5,32(sp)
    3be4:	00ee1863          	bne	t3,a4,3bf4 <_vfprintf_r+0x2268>
    3be8:	0000b797          	auipc	a5,0xb
    3bec:	df878793          	add	a5,a5,-520 # e9e0 <__fini_array_end+0x9c>
    3bf0:	02f12023          	sw	a5,32(sp)
    3bf4:	7fffd717          	auipc	a4,0x7fffd
    3bf8:	abc70713          	add	a4,a4,-1348 # 800006b0 <__global_locale+0x17c>
    3bfc:	00072783          	lw	a5,0(a4)
    3c00:	00472803          	lw	a6,4(a4)
    3c04:	000c0493          	mv	s1,s8
    3c08:	00f12c23          	sw	a5,24(sp)
    3c0c:	000d0793          	mv	a5,s10
    3c10:	03212223          	sw	s2,36(sp)
    3c14:	000c0d13          	mv	s10,s8
    3c18:	02012903          	lw	s2,32(sp)
    3c1c:	00098c13          	mv	s8,s3
    3c20:	01012e23          	sw	a6,28(sp)
    3c24:	fff30b13          	add	s6,t1,-1
    3c28:	fff00c93          	li	s9,-1
    3c2c:	05d12023          	sw	t4,64(sp)
    3c30:	05c12823          	sw	t3,80(sp)
    3c34:	04812a23          	sw	s0,84(sp)
    3c38:	00078993          	mv	s3,a5
    3c3c:	01c0006f          	j	3c58 <_vfprintf_r+0x22cc>
    3c40:	00000613          	li	a2,0
    3c44:	00000693          	li	a3,0
    3c48:	fffb0413          	add	s0,s6,-1
    3c4c:	23c090ef          	jal	ce88 <__eqdf2>
    3c50:	0a0504e3          	beqz	a0,44f8 <_vfprintf_r+0x2b6c>
    3c54:	00040b13          	mv	s6,s0
    3c58:	01812603          	lw	a2,24(sp)
    3c5c:	01c12683          	lw	a3,28(sp)
    3c60:	000a0513          	mv	a0,s4
    3c64:	00098593          	mv	a1,s3
    3c68:	4b4090ef          	jal	d11c <__muldf3>
    3c6c:	00058a13          	mv	s4,a1
    3c70:	00050993          	mv	s3,a0
    3c74:	5940a0ef          	jal	e208 <__fixdfsi>
    3c78:	00050413          	mv	s0,a0
    3c7c:	6100a0ef          	jal	e28c <__floatsidf>
    3c80:	00050613          	mv	a2,a0
    3c84:	00058693          	mv	a3,a1
    3c88:	00098513          	mv	a0,s3
    3c8c:	000a0593          	mv	a1,s4
    3c90:	41d090ef          	jal	d8ac <__subdf3>
    3c94:	00890733          	add	a4,s2,s0
    3c98:	00074703          	lbu	a4,0(a4)
    3c9c:	00048813          	mv	a6,s1
    3ca0:	00050a13          	mv	s4,a0
    3ca4:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    3ca8:	00058993          	mv	s3,a1
    3cac:	00148493          	add	s1,s1,1
    3cb0:	f99b18e3          	bne	s6,s9,3c40 <_vfprintf_r+0x22b4>
    3cb4:	7fffd697          	auipc	a3,0x7fffd
    3cb8:	a0468693          	add	a3,a3,-1532 # 800006b8 <__global_locale+0x184>
    3cbc:	0006a303          	lw	t1,0(a3)
    3cc0:	0046a383          	lw	t2,4(a3)
    3cc4:	05012e03          	lw	t3,80(sp)
    3cc8:	00030613          	mv	a2,t1
    3ccc:	00038693          	mv	a3,t2
    3cd0:	01012c23          	sw	a6,24(sp)
    3cd4:	02412903          	lw	s2,36(sp)
    3cd8:	000c0993          	mv	s3,s8
    3cdc:	03c12223          	sw	t3,36(sp)
    3ce0:	000d0c13          	mv	s8,s10
    3ce4:	00058d13          	mv	s10,a1
    3ce8:	22c090ef          	jal	cf14 <__gedf2>
    3cec:	7fffd797          	auipc	a5,0x7fffd
    3cf0:	9cc78793          	add	a5,a5,-1588 # 800006b8 <__global_locale+0x184>
    3cf4:	00040b13          	mv	s6,s0
    3cf8:	0007a303          	lw	t1,0(a5)
    3cfc:	05412403          	lw	s0,84(sp)
    3d00:	0047a383          	lw	t2,4(a5)
    3d04:	01812803          	lw	a6,24(sp)
    3d08:	02412e03          	lw	t3,36(sp)
    3d0c:	04012e83          	lw	t4,64(sp)
    3d10:	0aa05ce3          	blez	a0,45c8 <_vfprintf_r+0x2c3c>
    3d14:	02012783          	lw	a5,32(sp)
    3d18:	09012c23          	sw	a6,152(sp)
    3d1c:	fff4c603          	lbu	a2,-1(s1)
    3d20:	00f7c583          	lbu	a1,15(a5)
    3d24:	00048693          	mv	a3,s1
    3d28:	02b61063          	bne	a2,a1,3d48 <_vfprintf_r+0x23bc>
    3d2c:	03000513          	li	a0,48
    3d30:	fea68fa3          	sb	a0,-1(a3)
    3d34:	09812683          	lw	a3,152(sp)
    3d38:	fff68793          	add	a5,a3,-1
    3d3c:	08f12c23          	sw	a5,152(sp)
    3d40:	fff6c603          	lbu	a2,-1(a3)
    3d44:	feb606e3          	beq	a2,a1,3d30 <_vfprintf_r+0x23a4>
    3d48:	00160593          	add	a1,a2,1
    3d4c:	03900513          	li	a0,57
    3d50:	0ff5f593          	zext.b	a1,a1
    3d54:	04a60463          	beq	a2,a0,3d9c <_vfprintf_r+0x2410>
    3d58:	feb68fa3          	sb	a1,-1(a3)
    3d5c:	00048793          	mv	a5,s1
    3d60:	07c12a03          	lw	s4,124(sp)
    3d64:	418787b3          	sub	a5,a5,s8
    3d68:	06100613          	li	a2,97
    3d6c:	fffa0d13          	add	s10,s4,-1
    3d70:	00f12c23          	sw	a5,24(sp)
    3d74:	07a12e23          	sw	s10,124(sp)
    3d78:	07000693          	li	a3,112
    3d7c:	00ce0663          	beq	t3,a2,3d88 <_vfprintf_r+0x23fc>
    3d80:	05000693          	li	a3,80
    3d84:	04100e13          	li	t3,65
    3d88:	00100613          	li	a2,1
    3d8c:	aa5ff06f          	j	3830 <_vfprintf_r+0x1ea4>
    3d90:	00030a13          	mv	s4,t1
    3d94:	00300693          	li	a3,3
    3d98:	cf5ff06f          	j	3a8c <_vfprintf_r+0x2100>
    3d9c:	02012783          	lw	a5,32(sp)
    3da0:	00a7c583          	lbu	a1,10(a5)
    3da4:	feb68fa3          	sb	a1,-1(a3)
    3da8:	fb5ff06f          	j	3d5c <_vfprintf_r+0x23d0>
    3dac:	02d00713          	li	a4,45
    3db0:	06e10ba3          	sb	a4,119(sp)
    3db4:	02d00613          	li	a2,45
    3db8:	00000313          	li	t1,0
    3dbc:	001c8c93          	add	s9,s9,1
    3dc0:	e0dfd06f          	j	1bcc <_vfprintf_r+0x240>
    3dc4:	01812783          	lw	a5,24(sp)
    3dc8:	46fa4063          	blt	s4,a5,4228 <_vfprintf_r+0x289c>
    3dcc:	001ef713          	and	a4,t4,1
    3dd0:	000a0d13          	mv	s10,s4
    3dd4:	00070663          	beqz	a4,3de0 <_vfprintf_r+0x2454>
    3dd8:	03012783          	lw	a5,48(sp)
    3ddc:	00fa0d33          	add	s10,s4,a5
    3de0:	400eff13          	and	t5,t4,1024
    3de4:	000f0463          	beqz	t5,3dec <_vfprintf_r+0x2460>
    3de8:	5f404e63          	bgtz	s4,43e4 <_vfprintf_r+0x2a58>
    3dec:	fffd4813          	not	a6,s10
    3df0:	41f85813          	sra	a6,a6,0x1f
    3df4:	010d7cb3          	and	s9,s10,a6
    3df8:	06700e13          	li	t3,103
    3dfc:	000b0e93          	mv	t4,s6
    3e00:	02012223          	sw	zero,36(sp)
    3e04:	02012023          	sw	zero,32(sp)
    3e08:	b3dff06f          	j	3944 <_vfprintf_r+0x1fb8>
    3e0c:	02d00793          	li	a5,45
    3e10:	06f10ba3          	sb	a5,119(sp)
    3e14:	02d00613          	li	a2,45
    3e18:	998fe06f          	j	1fb0 <_vfprintf_r+0x624>
    3e1c:	01812783          	lw	a5,24(sp)
    3e20:	02012a03          	lw	s4,32(sp)
    3e24:	05212823          	sw	s2,80(sp)
    3e28:	00fc07b3          	add	a5,s8,a5
    3e2c:	05712c23          	sw	s7,88(sp)
    3e30:	05912e23          	sw	s9,92(sp)
    3e34:	00040713          	mv	a4,s0
    3e38:	04f12223          	sw	a5,68(sp)
    3e3c:	02412403          	lw	s0,36(sp)
    3e40:	05d12a23          	sw	t4,84(sp)
    3e44:	03812223          	sw	s8,36(sp)
    3e48:	03c12b83          	lw	s7,60(sp)
    3e4c:	04c12c83          	lw	s9,76(sp)
    3e50:	00812903          	lw	s2,8(sp)
    3e54:	00700693          	li	a3,7
    3e58:	01000d13          	li	s10,16
    3e5c:	0000bb17          	auipc	s6,0xb
    3e60:	06cb0b13          	add	s6,s6,108 # eec8 <zeroes.0>
    3e64:	00048613          	mv	a2,s1
    3e68:	00030c13          	mv	s8,t1
    3e6c:	09405863          	blez	s4,3efc <_vfprintf_r+0x2570>
    3e70:	16805e63          	blez	s0,3fec <_vfprintf_r+0x2660>
    3e74:	fff40413          	add	s0,s0,-1
    3e78:	04812783          	lw	a5,72(sp)
    3e7c:	01960633          	add	a2,a2,s9
    3e80:	01972223          	sw	s9,4(a4)
    3e84:	00f72023          	sw	a5,0(a4)
    3e88:	0a412783          	lw	a5,164(sp)
    3e8c:	0ac12423          	sw	a2,168(sp)
    3e90:	00870713          	add	a4,a4,8
    3e94:	00178793          	add	a5,a5,1
    3e98:	0af12223          	sw	a5,164(sp)
    3e9c:	14f6ce63          	blt	a3,a5,3ff8 <_vfprintf_r+0x266c>
    3ea0:	04412783          	lw	a5,68(sp)
    3ea4:	000bc583          	lbu	a1,0(s7)
    3ea8:	418784b3          	sub	s1,a5,s8
    3eac:	0095d463          	bge	a1,s1,3eb4 <_vfprintf_r+0x2528>
    3eb0:	00058493          	mv	s1,a1
    3eb4:	02905663          	blez	s1,3ee0 <_vfprintf_r+0x2554>
    3eb8:	0a412583          	lw	a1,164(sp)
    3ebc:	00960633          	add	a2,a2,s1
    3ec0:	01872023          	sw	s8,0(a4)
    3ec4:	00158593          	add	a1,a1,1
    3ec8:	00972223          	sw	s1,4(a4)
    3ecc:	0ac12423          	sw	a2,168(sp)
    3ed0:	0ab12223          	sw	a1,164(sp)
    3ed4:	14b6c663          	blt	a3,a1,4020 <_vfprintf_r+0x2694>
    3ed8:	000bc583          	lbu	a1,0(s7)
    3edc:	00870713          	add	a4,a4,8
    3ee0:	fff4c513          	not	a0,s1
    3ee4:	41f55513          	sra	a0,a0,0x1f
    3ee8:	00a4f7b3          	and	a5,s1,a0
    3eec:	40f584b3          	sub	s1,a1,a5
    3ef0:	04904663          	bgtz	s1,3f3c <_vfprintf_r+0x25b0>
    3ef4:	00bc0c33          	add	s8,s8,a1
    3ef8:	f7404ce3          	bgtz	s4,3e70 <_vfprintf_r+0x24e4>
    3efc:	f6804ce3          	bgtz	s0,3e74 <_vfprintf_r+0x24e8>
    3f00:	01812783          	lw	a5,24(sp)
    3f04:	000c0313          	mv	t1,s8
    3f08:	02412c03          	lw	s8,36(sp)
    3f0c:	03712e23          	sw	s7,60(sp)
    3f10:	00070413          	mv	s0,a4
    3f14:	00fc0733          	add	a4,s8,a5
    3f18:	05012903          	lw	s2,80(sp)
    3f1c:	05412e83          	lw	t4,84(sp)
    3f20:	05812b83          	lw	s7,88(sp)
    3f24:	05c12c83          	lw	s9,92(sp)
    3f28:	00060493          	mv	s1,a2
    3f2c:	00676463          	bltu	a4,t1,3f34 <_vfprintf_r+0x25a8>
    3f30:	c59fe06f          	j	2b88 <_vfprintf_r+0x11fc>
    3f34:	00070313          	mv	t1,a4
    3f38:	c51fe06f          	j	2b88 <_vfprintf_r+0x11fc>
    3f3c:	0a412583          	lw	a1,164(sp)
    3f40:	0000be97          	auipc	t4,0xb
    3f44:	f88e8e93          	add	t4,t4,-120 # eec8 <zeroes.0>
    3f48:	069d5c63          	bge	s10,s1,3fc0 <_vfprintf_r+0x2634>
    3f4c:	02812023          	sw	s0,32(sp)
    3f50:	00048413          	mv	s0,s1
    3f54:	000b0493          	mv	s1,s6
    3f58:	00c0006f          	j	3f64 <_vfprintf_r+0x25d8>
    3f5c:	ff040413          	add	s0,s0,-16
    3f60:	048d5a63          	bge	s10,s0,3fb4 <_vfprintf_r+0x2628>
    3f64:	01060613          	add	a2,a2,16
    3f68:	00158593          	add	a1,a1,1
    3f6c:	01672023          	sw	s6,0(a4)
    3f70:	01a72223          	sw	s10,4(a4)
    3f74:	0ac12423          	sw	a2,168(sp)
    3f78:	0ab12223          	sw	a1,164(sp)
    3f7c:	00870713          	add	a4,a4,8
    3f80:	fcb6dee3          	bge	a3,a1,3f5c <_vfprintf_r+0x25d0>
    3f84:	0a010613          	add	a2,sp,160
    3f88:	00090593          	mv	a1,s2
    3f8c:	00098513          	mv	a0,s3
    3f90:	0b9000ef          	jal	4848 <__sprint_r>
    3f94:	00050463          	beqz	a0,3f9c <_vfprintf_r+0x2610>
    3f98:	ec5fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    3f9c:	ff040413          	add	s0,s0,-16
    3fa0:	0a812603          	lw	a2,168(sp)
    3fa4:	0a412583          	lw	a1,164(sp)
    3fa8:	0ac10713          	add	a4,sp,172
    3fac:	00700693          	li	a3,7
    3fb0:	fa8d4ae3          	blt	s10,s0,3f64 <_vfprintf_r+0x25d8>
    3fb4:	00048e93          	mv	t4,s1
    3fb8:	00040493          	mv	s1,s0
    3fbc:	02012403          	lw	s0,32(sp)
    3fc0:	00960633          	add	a2,a2,s1
    3fc4:	00158593          	add	a1,a1,1
    3fc8:	01d72023          	sw	t4,0(a4)
    3fcc:	00972223          	sw	s1,4(a4)
    3fd0:	0ac12423          	sw	a2,168(sp)
    3fd4:	0ab12223          	sw	a1,164(sp)
    3fd8:	10b6ce63          	blt	a3,a1,40f4 <_vfprintf_r+0x2768>
    3fdc:	000bc583          	lbu	a1,0(s7)
    3fe0:	00870713          	add	a4,a4,8
    3fe4:	00bc0c33          	add	s8,s8,a1
    3fe8:	f11ff06f          	j	3ef8 <_vfprintf_r+0x256c>
    3fec:	fffb8b93          	add	s7,s7,-1
    3ff0:	fffa0a13          	add	s4,s4,-1
    3ff4:	e85ff06f          	j	3e78 <_vfprintf_r+0x24ec>
    3ff8:	0a010613          	add	a2,sp,160
    3ffc:	00090593          	mv	a1,s2
    4000:	00098513          	mv	a0,s3
    4004:	045000ef          	jal	4848 <__sprint_r>
    4008:	00050463          	beqz	a0,4010 <_vfprintf_r+0x2684>
    400c:	e51fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    4010:	0a812603          	lw	a2,168(sp)
    4014:	0ac10713          	add	a4,sp,172
    4018:	00700693          	li	a3,7
    401c:	e85ff06f          	j	3ea0 <_vfprintf_r+0x2514>
    4020:	0a010613          	add	a2,sp,160
    4024:	00090593          	mv	a1,s2
    4028:	00098513          	mv	a0,s3
    402c:	01d000ef          	jal	4848 <__sprint_r>
    4030:	00050463          	beqz	a0,4038 <_vfprintf_r+0x26ac>
    4034:	e29fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    4038:	000bc583          	lbu	a1,0(s7)
    403c:	0a812603          	lw	a2,168(sp)
    4040:	0ac10713          	add	a4,sp,172
    4044:	00700693          	li	a3,7
    4048:	e99ff06f          	j	3ee0 <_vfprintf_r+0x2554>
    404c:	04c12783          	lw	a5,76(sp)
    4050:	04812583          	lw	a1,72(sp)
    4054:	00000913          	li	s2,0
    4058:	40fc0c33          	sub	s8,s8,a5
    405c:	00078613          	mv	a2,a5
    4060:	000c0513          	mv	a0,s8
    4064:	468030ef          	jal	74cc <strncpy>
    4068:	00144783          	lbu	a5,1(s0)
    406c:	00a00613          	li	a2,10
    4070:	00000693          	li	a3,0
    4074:	00f037b3          	snez	a5,a5
    4078:	000d0513          	mv	a0,s10
    407c:	000c8593          	mv	a1,s9
    4080:	00f40433          	add	s0,s0,a5
    4084:	78d060ef          	jal	b010 <__udivdi3>
    4088:	a10ff06f          	j	3298 <_vfprintf_r+0x190c>
    408c:	09810713          	add	a4,sp,152
    4090:	00000693          	li	a3,0
    4094:	08410613          	add	a2,sp,132
    4098:	00000593          	li	a1,0
    409c:	00098513          	mv	a0,s3
    40a0:	01c12a23          	sw	t3,20(sp)
    40a4:	01d12823          	sw	t4,16(sp)
    40a8:	618060ef          	jal	a6c0 <_wcsrtombs_r>
    40ac:	fff00713          	li	a4,-1
    40b0:	01012e83          	lw	t4,16(sp)
    40b4:	01412e03          	lw	t3,20(sp)
    40b8:	00050d13          	mv	s10,a0
    40bc:	30e50063          	beq	a0,a4,43bc <_vfprintf_r+0x2a30>
    40c0:	09812223          	sw	s8,132(sp)
    40c4:	cacff06f          	j	3570 <_vfprintf_r+0x1be4>
    40c8:	07714603          	lbu	a2,119(sp)
    40cc:	01612a23          	sw	s6,20(sp)
    40d0:	02012223          	sw	zero,36(sp)
    40d4:	02012023          	sw	zero,32(sp)
    40d8:	00012823          	sw	zero,16(sp)
    40dc:	00000c93          	li	s9,0
    40e0:	00000313          	li	t1,0
    40e4:	00000a13          	li	s4,0
    40e8:	00061463          	bnez	a2,40f0 <_vfprintf_r+0x2764>
    40ec:	ae1fd06f          	j	1bcc <_vfprintf_r+0x240>
    40f0:	efdfd06f          	j	1fec <_vfprintf_r+0x660>
    40f4:	0a010613          	add	a2,sp,160
    40f8:	00090593          	mv	a1,s2
    40fc:	00098513          	mv	a0,s3
    4100:	748000ef          	jal	4848 <__sprint_r>
    4104:	00050463          	beqz	a0,410c <_vfprintf_r+0x2780>
    4108:	d55fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    410c:	000bc583          	lbu	a1,0(s7)
    4110:	0a812603          	lw	a2,168(sp)
    4114:	0ac10713          	add	a4,sp,172
    4118:	00700693          	li	a3,7
    411c:	00bc0c33          	add	s8,s8,a1
    4120:	dd9ff06f          	j	3ef8 <_vfprintf_r+0x256c>
    4124:	00812583          	lw	a1,8(sp)
    4128:	0a010613          	add	a2,sp,160
    412c:	00098513          	mv	a0,s3
    4130:	05d12223          	sw	t4,68(sp)
    4134:	714000ef          	jal	4848 <__sprint_r>
    4138:	00050463          	beqz	a0,4140 <_vfprintf_r+0x27b4>
    413c:	d21fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    4140:	0a812483          	lw	s1,168(sp)
    4144:	04412e83          	lw	t4,68(sp)
    4148:	0ac10413          	add	s0,sp,172
    414c:	a19fe06f          	j	2b64 <_vfprintf_r+0x11d8>
    4150:	00900793          	li	a5,9
    4154:	95a7e263          	bltu	a5,s10,3298 <_vfprintf_r+0x190c>
    4158:	98cff06f          	j	32e4 <_vfprintf_r+0x1958>
    415c:	07c12a03          	lw	s4,124(sp)
    4160:	00070793          	mv	a5,a4
    4164:	9f1ff06f          	j	3b54 <_vfprintf_r+0x21c8>
    4168:	00812583          	lw	a1,8(sp)
    416c:	0a010613          	add	a2,sp,160
    4170:	00098513          	mv	a0,s3
    4174:	03d12023          	sw	t4,32(sp)
    4178:	6d0000ef          	jal	4848 <__sprint_r>
    417c:	00050463          	beqz	a0,4184 <_vfprintf_r+0x27f8>
    4180:	cddfd06f          	j	1e5c <_vfprintf_r+0x4d0>
    4184:	07c12d03          	lw	s10,124(sp)
    4188:	01812783          	lw	a5,24(sp)
    418c:	0a812483          	lw	s1,168(sp)
    4190:	02012e83          	lw	t4,32(sp)
    4194:	0ac10413          	add	s0,sp,172
    4198:	41a78d33          	sub	s10,a5,s10
    419c:	a49fe06f          	j	2be4 <_vfprintf_r+0x1258>
    41a0:	00650733          	add	a4,a0,t1
    41a4:	04700d13          	li	s10,71
    41a8:	94dff06f          	j	3af4 <_vfprintf_r+0x2168>
    41ac:	02812603          	lw	a2,40(sp)
    41b0:	00048593          	mv	a1,s1
    41b4:	00000693          	li	a3,0
    41b8:	00060513          	mv	a0,a2
    41bc:	00000613          	li	a2,0
    41c0:	04e12823          	sw	a4,80(sp)
    41c4:	02612223          	sw	t1,36(sp)
    41c8:	03c12023          	sw	t3,32(sp)
    41cc:	01d12c23          	sw	t4,24(sp)
    41d0:	4b9080ef          	jal	ce88 <__eqdf2>
    41d4:	01812e83          	lw	t4,24(sp)
    41d8:	02012e03          	lw	t3,32(sp)
    41dc:	02412303          	lw	t1,36(sp)
    41e0:	05012703          	lw	a4,80(sp)
    41e4:	34051e63          	bnez	a0,4540 <_vfprintf_r+0x2bb4>
    41e8:	07c12a03          	lw	s4,124(sp)
    41ec:	01470733          	add	a4,a4,s4
    41f0:	418707b3          	sub	a5,a4,s8
    41f4:	00f12c23          	sw	a5,24(sp)
    41f8:	001ef713          	and	a4,t4,1
    41fc:	00676733          	or	a4,a4,t1
    4200:	37405a63          	blez	s4,4574 <_vfprintf_r+0x2be8>
    4204:	26071263          	bnez	a4,4468 <_vfprintf_r+0x2adc>
    4208:	000a0d13          	mv	s10,s4
    420c:	06600e13          	li	t3,102
    4210:	400eff13          	and	t5,t4,1024
    4214:	1c0f1a63          	bnez	t5,43e8 <_vfprintf_r+0x2a5c>
    4218:	fffd4813          	not	a6,s10
    421c:	41f85813          	sra	a6,a6,0x1f
    4220:	010d7cb3          	and	s9,s10,a6
    4224:	bd9ff06f          	j	3dfc <_vfprintf_r+0x2470>
    4228:	01812783          	lw	a5,24(sp)
    422c:	03012703          	lw	a4,48(sp)
    4230:	06700e13          	li	t3,103
    4234:	00e78d33          	add	s10,a5,a4
    4238:	fd404ce3          	bgtz	s4,4210 <_vfprintf_r+0x2884>
    423c:	414d06b3          	sub	a3,s10,s4
    4240:	00168d13          	add	s10,a3,1
    4244:	fffd4813          	not	a6,s10
    4248:	41f85813          	sra	a6,a6,0x1f
    424c:	010d7cb3          	and	s9,s10,a6
    4250:	badff06f          	j	3dfc <_vfprintf_r+0x2470>
    4254:	000e8613          	mv	a2,t4
    4258:	ad8fe06f          	j	2530 <_vfprintf_r+0xba4>
    425c:	00812783          	lw	a5,8(sp)
    4260:	0647a783          	lw	a5,100(a5)
    4264:	0017f793          	and	a5,a5,1
    4268:	02079063          	bnez	a5,4288 <_vfprintf_r+0x28fc>
    426c:	00812783          	lw	a5,8(sp)
    4270:	00c7d783          	lhu	a5,12(a5)
    4274:	2007f793          	and	a5,a5,512
    4278:	00079863          	bnez	a5,4288 <_vfprintf_r+0x28fc>
    427c:	00812783          	lw	a5,8(sp)
    4280:	0587a503          	lw	a0,88(a5)
    4284:	fb0fc0ef          	jal	a34 <__retarget_lock_release_recursive>
    4288:	fff00793          	li	a5,-1
    428c:	00f12623          	sw	a5,12(sp)
    4290:	c2dfd06f          	j	1ebc <_vfprintf_r+0x530>
    4294:	ff000613          	li	a2,-16
    4298:	40d00d33          	neg	s10,a3
    429c:	0000b297          	auipc	t0,0xb
    42a0:	c2c28293          	add	t0,t0,-980 # eec8 <zeroes.0>
    42a4:	08c6d463          	bge	a3,a2,432c <_vfprintf_r+0x29a0>
    42a8:	03212023          	sw	s2,32(sp)
    42ac:	01000693          	li	a3,16
    42b0:	00700b13          	li	s6,7
    42b4:	000e8a13          	mv	s4,t4
    42b8:	00028913          	mv	s2,t0
    42bc:	00c0006f          	j	42c8 <_vfprintf_r+0x293c>
    42c0:	ff0d0d13          	add	s10,s10,-16
    42c4:	05a6de63          	bge	a3,s10,4320 <_vfprintf_r+0x2994>
    42c8:	01048493          	add	s1,s1,16
    42cc:	00170713          	add	a4,a4,1
    42d0:	01242023          	sw	s2,0(s0)
    42d4:	00d42223          	sw	a3,4(s0)
    42d8:	0a912423          	sw	s1,168(sp)
    42dc:	0ae12223          	sw	a4,164(sp)
    42e0:	00840413          	add	s0,s0,8
    42e4:	fceb5ee3          	bge	s6,a4,42c0 <_vfprintf_r+0x2934>
    42e8:	00812583          	lw	a1,8(sp)
    42ec:	0a010613          	add	a2,sp,160
    42f0:	00098513          	mv	a0,s3
    42f4:	554000ef          	jal	4848 <__sprint_r>
    42f8:	00050463          	beqz	a0,4300 <_vfprintf_r+0x2974>
    42fc:	b61fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    4300:	0a812483          	lw	s1,168(sp)
    4304:	0a412703          	lw	a4,164(sp)
    4308:	0ac10413          	add	s0,sp,172
    430c:	01000693          	li	a3,16
    4310:	fb1ff06f          	j	42c0 <_vfprintf_r+0x2934>
    4314:	00012823          	sw	zero,16(sp)
    4318:	0ec10c13          	add	s8,sp,236
    431c:	a88ff06f          	j	35a4 <_vfprintf_r+0x1c18>
    4320:	00090293          	mv	t0,s2
    4324:	02012903          	lw	s2,32(sp)
    4328:	000a0e93          	mv	t4,s4
    432c:	01a484b3          	add	s1,s1,s10
    4330:	00170713          	add	a4,a4,1
    4334:	00542023          	sw	t0,0(s0)
    4338:	01a42223          	sw	s10,4(s0)
    433c:	0a912423          	sw	s1,168(sp)
    4340:	0ae12223          	sw	a4,164(sp)
    4344:	00700693          	li	a3,7
    4348:	00e6c463          	blt	a3,a4,4350 <_vfprintf_r+0x29c4>
    434c:	b65fe06f          	j	2eb0 <_vfprintf_r+0x1524>
    4350:	00812583          	lw	a1,8(sp)
    4354:	0a010613          	add	a2,sp,160
    4358:	00098513          	mv	a0,s3
    435c:	03d12023          	sw	t4,32(sp)
    4360:	4e8000ef          	jal	4848 <__sprint_r>
    4364:	00050463          	beqz	a0,436c <_vfprintf_r+0x29e0>
    4368:	af5fd06f          	j	1e5c <_vfprintf_r+0x4d0>
    436c:	0a812483          	lw	s1,168(sp)
    4370:	0a412703          	lw	a4,164(sp)
    4374:	02012e83          	lw	t4,32(sp)
    4378:	0ac10413          	add	s0,sp,172
    437c:	b20ff06f          	j	369c <_vfprintf_r+0x1d10>
    4380:	08a10693          	add	a3,sp,138
    4384:	00061863          	bnez	a2,4394 <_vfprintf_r+0x2a08>
    4388:	03000693          	li	a3,48
    438c:	08d10523          	sb	a3,138(sp)
    4390:	08b10693          	add	a3,sp,139
    4394:	15010793          	add	a5,sp,336
    4398:	40f68633          	sub	a2,a3,a5
    439c:	030d0713          	add	a4,s10,48
    43a0:	0c960793          	add	a5,a2,201
    43a4:	00e68023          	sb	a4,0(a3)
    43a8:	04f12023          	sw	a5,64(sp)
    43ac:	d5cff06f          	j	3908 <_vfprintf_r+0x1f7c>
    43b0:	001ef713          	and	a4,t4,1
    43b4:	d6070863          	beqz	a4,3924 <_vfprintf_r+0x1f98>
    43b8:	d64ff06f          	j	391c <_vfprintf_r+0x1f90>
    43bc:	00812783          	lw	a5,8(sp)
    43c0:	00000293          	li	t0,0
    43c4:	00c79783          	lh	a5,12(a5)
    43c8:	0407e793          	or	a5,a5,64
    43cc:	00812703          	lw	a4,8(sp)
    43d0:	00f71623          	sh	a5,12(a4)
    43d4:	a8dfd06f          	j	1e60 <_vfprintf_r+0x4d4>
    43d8:	00012823          	sw	zero,16(sp)
    43dc:	00600313          	li	t1,6
    43e0:	ff9fe06f          	j	33d8 <_vfprintf_r+0x1a4c>
    43e4:	06700e13          	li	t3,103
    43e8:	03c12783          	lw	a5,60(sp)
    43ec:	0ff00613          	li	a2,255
    43f0:	0007c703          	lbu	a4,0(a5)
    43f4:	22c70263          	beq	a4,a2,4618 <_vfprintf_r+0x2c8c>
    43f8:	00000593          	li	a1,0
    43fc:	00000693          	li	a3,0
    4400:	01475e63          	bge	a4,s4,441c <_vfprintf_r+0x2a90>
    4404:	40ea0a33          	sub	s4,s4,a4
    4408:	0017c703          	lbu	a4,1(a5)
    440c:	04070863          	beqz	a4,445c <_vfprintf_r+0x2ad0>
    4410:	00168693          	add	a3,a3,1
    4414:	00178793          	add	a5,a5,1
    4418:	fec714e3          	bne	a4,a2,4400 <_vfprintf_r+0x2a74>
    441c:	02f12e23          	sw	a5,60(sp)
    4420:	02d12023          	sw	a3,32(sp)
    4424:	02b12223          	sw	a1,36(sp)
    4428:	02012783          	lw	a5,32(sp)
    442c:	02412703          	lw	a4,36(sp)
    4430:	04c12583          	lw	a1,76(sp)
    4434:	05c12823          	sw	t3,80(sp)
    4438:	00e78533          	add	a0,a5,a4
    443c:	3a80a0ef          	jal	e7e4 <__mulsi3>
    4440:	01a50d33          	add	s10,a0,s10
    4444:	fffd4813          	not	a6,s10
    4448:	41f85813          	sra	a6,a6,0x1f
    444c:	05012e03          	lw	t3,80(sp)
    4450:	010d7cb3          	and	s9,s10,a6
    4454:	000b0e93          	mv	t4,s6
    4458:	cecff06f          	j	3944 <_vfprintf_r+0x1fb8>
    445c:	0007c703          	lbu	a4,0(a5)
    4460:	00158593          	add	a1,a1,1
    4464:	fb5ff06f          	j	4418 <_vfprintf_r+0x2a8c>
    4468:	03012783          	lw	a5,48(sp)
    446c:	06600e13          	li	t3,102
    4470:	00f306b3          	add	a3,t1,a5
    4474:	01468d33          	add	s10,a3,s4
    4478:	d99ff06f          	j	4210 <_vfprintf_r+0x2884>
    447c:	02c12783          	lw	a5,44(sp)
    4480:	0a07c863          	bltz	a5,4530 <_vfprintf_r+0x2ba4>
    4484:	07714603          	lbu	a2,119(sp)
    4488:	04700713          	li	a4,71
    448c:	0000ac17          	auipc	s8,0xa
    4490:	550c0c13          	add	s8,s8,1360 # e9dc <__fini_array_end+0x98>
    4494:	01c75463          	bge	a4,t3,449c <_vfprintf_r+0x2b10>
    4498:	b31fd06f          	j	1fc8 <_vfprintf_r+0x63c>
    449c:	0000ac17          	auipc	s8,0xa
    44a0:	53cc0c13          	add	s8,s8,1340 # e9d8 <__fini_array_end+0x94>
    44a4:	b25fd06f          	j	1fc8 <_vfprintf_r+0x63c>
    44a8:	07714603          	lbu	a2,119(sp)
    44ac:	01612a23          	sw	s6,20(sp)
    44b0:	02012223          	sw	zero,36(sp)
    44b4:	02012023          	sw	zero,32(sp)
    44b8:	00030c93          	mv	s9,t1
    44bc:	00030d13          	mv	s10,t1
    44c0:	07300e13          	li	t3,115
    44c4:	00000313          	li	t1,0
    44c8:	00061463          	bnez	a2,44d0 <_vfprintf_r+0x2b44>
    44cc:	f00fd06f          	j	1bcc <_vfprintf_r+0x240>
    44d0:	b1dfd06f          	j	1fec <_vfprintf_r+0x660>
    44d4:	00040313          	mv	t1,s0
    44d8:	01012903          	lw	s2,16(sp)
    44dc:	000b0413          	mv	s0,s6
    44e0:	01412e03          	lw	t3,20(sp)
    44e4:	000c0b13          	mv	s6,s8
    44e8:	000a0e93          	mv	t4,s4
    44ec:	000c8c13          	mv	s8,s9
    44f0:	00030d13          	mv	s10,t1
    44f4:	87cff06f          	j	3570 <_vfprintf_r+0x1be4>
    44f8:	001b0793          	add	a5,s6,1
    44fc:	000c0993          	mv	s3,s8
    4500:	02412903          	lw	s2,36(sp)
    4504:	04012e83          	lw	t4,64(sp)
    4508:	05012e03          	lw	t3,80(sp)
    450c:	05412403          	lw	s0,84(sp)
    4510:	000d0c13          	mv	s8,s10
    4514:	00f487b3          	add	a5,s1,a5
    4518:	03000693          	li	a3,48
    451c:	840b40e3          	bltz	s6,3d5c <_vfprintf_r+0x23d0>
    4520:	00148493          	add	s1,s1,1
    4524:	fed48fa3          	sb	a3,-1(s1)
    4528:	fe979ce3          	bne	a5,s1,4520 <_vfprintf_r+0x2b94>
    452c:	835ff06f          	j	3d60 <_vfprintf_r+0x23d4>
    4530:	02d00793          	li	a5,45
    4534:	06f10ba3          	sb	a5,119(sp)
    4538:	02d00613          	li	a2,45
    453c:	f4dff06f          	j	4488 <_vfprintf_r+0x2afc>
    4540:	00100693          	li	a3,1
    4544:	414686b3          	sub	a3,a3,s4
    4548:	06d12e23          	sw	a3,124(sp)
    454c:	da4ff06f          	j	3af0 <_vfprintf_r+0x2164>
    4550:	01412783          	lw	a5,20(sp)
    4554:	0007ab03          	lw	s6,0(a5)
    4558:	00478793          	add	a5,a5,4
    455c:	000b5463          	bgez	s6,4564 <_vfprintf_r+0x2bd8>
    4560:	fff00b13          	li	s6,-1
    4564:	00194e03          	lbu	t3,1(s2)
    4568:	00f12a23          	sw	a5,20(sp)
    456c:	00068913          	mv	s2,a3
    4570:	dccfd06f          	j	1b3c <_vfprintf_r+0x1b0>
    4574:	00071a63          	bnez	a4,4588 <_vfprintf_r+0x2bfc>
    4578:	00100c93          	li	s9,1
    457c:	06600e13          	li	t3,102
    4580:	00100d13          	li	s10,1
    4584:	879ff06f          	j	3dfc <_vfprintf_r+0x2470>
    4588:	03012783          	lw	a5,48(sp)
    458c:	06600e13          	li	t3,102
    4590:	00178693          	add	a3,a5,1
    4594:	00668d33          	add	s10,a3,t1
    4598:	fffd4813          	not	a6,s10
    459c:	41f85813          	sra	a6,a6,0x1f
    45a0:	010d7cb3          	and	s9,s10,a6
    45a4:	859ff06f          	j	3dfc <_vfprintf_r+0x2470>
    45a8:	00200793          	li	a5,2
    45ac:	04f12023          	sw	a5,64(sp)
    45b0:	b58ff06f          	j	3908 <_vfprintf_r+0x1f7c>
    45b4:	00812703          	lw	a4,8(sp)
    45b8:	00c71783          	lh	a5,12(a4)
    45bc:	0407e793          	or	a5,a5,64
    45c0:	00f71623          	sh	a5,12(a4)
    45c4:	8b5fd06f          	j	1e78 <_vfprintf_r+0x4ec>
    45c8:	000a0513          	mv	a0,s4
    45cc:	000d0593          	mv	a1,s10
    45d0:	00030613          	mv	a2,t1
    45d4:	00038693          	mv	a3,t2
    45d8:	05012023          	sw	a6,64(sp)
    45dc:	03c12223          	sw	t3,36(sp)
    45e0:	01d12c23          	sw	t4,24(sp)
    45e4:	0a5080ef          	jal	ce88 <__eqdf2>
    45e8:	01812e83          	lw	t4,24(sp)
    45ec:	02412e03          	lw	t3,36(sp)
    45f0:	04012803          	lw	a6,64(sp)
    45f4:	f6051463          	bnez	a0,3d5c <_vfprintf_r+0x23d0>
    45f8:	001b7693          	and	a3,s6,1
    45fc:	f6068063          	beqz	a3,3d5c <_vfprintf_r+0x23d0>
    4600:	f14ff06f          	j	3d14 <_vfprintf_r+0x2388>
    4604:	00812783          	lw	a5,8(sp)
    4608:	01012283          	lw	t0,16(sp)
    460c:	00c79783          	lh	a5,12(a5)
    4610:	0407e793          	or	a5,a5,64
    4614:	db9ff06f          	j	43cc <_vfprintf_r+0x2a40>
    4618:	02012223          	sw	zero,36(sp)
    461c:	02012023          	sw	zero,32(sp)
    4620:	e09ff06f          	j	4428 <_vfprintf_r+0x2a9c>
    4624:	04500d13          	li	s10,69
    4628:	cccff06f          	j	3af4 <_vfprintf_r+0x2168>

0000462c <__sbprintf>:
    462c:	b7010113          	add	sp,sp,-1168
    4630:	00c59783          	lh	a5,12(a1)
    4634:	00e5d703          	lhu	a4,14(a1)
    4638:	48812423          	sw	s0,1160(sp)
    463c:	00058413          	mv	s0,a1
    4640:	000105b7          	lui	a1,0x10
    4644:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0xd4d>
    4648:	06442303          	lw	t1,100(s0)
    464c:	01c42883          	lw	a7,28(s0)
    4650:	02442803          	lw	a6,36(s0)
    4654:	01071713          	sll	a4,a4,0x10
    4658:	00b7f7b3          	and	a5,a5,a1
    465c:	00e7e7b3          	or	a5,a5,a4
    4660:	40000593          	li	a1,1024
    4664:	49212023          	sw	s2,1152(sp)
    4668:	00f12a23          	sw	a5,20(sp)
    466c:	00050913          	mv	s2,a0
    4670:	07010793          	add	a5,sp,112
    4674:	06010513          	add	a0,sp,96
    4678:	48112623          	sw	ra,1164(sp)
    467c:	48912223          	sw	s1,1156(sp)
    4680:	47312e23          	sw	s3,1148(sp)
    4684:	00060493          	mv	s1,a2
    4688:	00068993          	mv	s3,a3
    468c:	06612623          	sw	t1,108(sp)
    4690:	03112223          	sw	a7,36(sp)
    4694:	03012623          	sw	a6,44(sp)
    4698:	00f12423          	sw	a5,8(sp)
    469c:	00f12c23          	sw	a5,24(sp)
    46a0:	00b12823          	sw	a1,16(sp)
    46a4:	00b12e23          	sw	a1,28(sp)
    46a8:	02012023          	sw	zero,32(sp)
    46ac:	b7cfc0ef          	jal	a28 <__retarget_lock_init_recursive>
    46b0:	00048613          	mv	a2,s1
    46b4:	00098693          	mv	a3,s3
    46b8:	00810593          	add	a1,sp,8
    46bc:	00090513          	mv	a0,s2
    46c0:	accfd0ef          	jal	198c <_vfprintf_r>
    46c4:	00050493          	mv	s1,a0
    46c8:	04055263          	bgez	a0,470c <__sbprintf+0xe0>
    46cc:	01415783          	lhu	a5,20(sp)
    46d0:	0407f793          	and	a5,a5,64
    46d4:	00078863          	beqz	a5,46e4 <__sbprintf+0xb8>
    46d8:	00c45783          	lhu	a5,12(s0)
    46dc:	0407e793          	or	a5,a5,64
    46e0:	00f41623          	sh	a5,12(s0)
    46e4:	06012503          	lw	a0,96(sp)
    46e8:	b44fc0ef          	jal	a2c <__retarget_lock_close_recursive>
    46ec:	48c12083          	lw	ra,1164(sp)
    46f0:	48812403          	lw	s0,1160(sp)
    46f4:	48012903          	lw	s2,1152(sp)
    46f8:	47c12983          	lw	s3,1148(sp)
    46fc:	00048513          	mv	a0,s1
    4700:	48412483          	lw	s1,1156(sp)
    4704:	49010113          	add	sp,sp,1168
    4708:	00008067          	ret
    470c:	00810593          	add	a1,sp,8
    4710:	00090513          	mv	a0,s2
    4714:	449010ef          	jal	635c <_fflush_r>
    4718:	fa050ae3          	beqz	a0,46cc <__sbprintf+0xa0>
    471c:	fff00493          	li	s1,-1
    4720:	fadff06f          	j	46cc <__sbprintf+0xa0>

00004724 <__sprint_r.part.0>:
    4724:	0645a783          	lw	a5,100(a1)
    4728:	fd010113          	add	sp,sp,-48
    472c:	01612823          	sw	s6,16(sp)
    4730:	02112623          	sw	ra,44(sp)
    4734:	01279713          	sll	a4,a5,0x12
    4738:	00060b13          	mv	s6,a2
    473c:	0e075863          	bgez	a4,482c <__sprint_r.part.0+0x108>
    4740:	00862783          	lw	a5,8(a2)
    4744:	03212023          	sw	s2,32(sp)
    4748:	01312e23          	sw	s3,28(sp)
    474c:	01512a23          	sw	s5,20(sp)
    4750:	01712623          	sw	s7,12(sp)
    4754:	00058913          	mv	s2,a1
    4758:	00062b83          	lw	s7,0(a2)
    475c:	00050993          	mv	s3,a0
    4760:	fff00a93          	li	s5,-1
    4764:	0a078863          	beqz	a5,4814 <__sprint_r.part.0+0xf0>
    4768:	02812423          	sw	s0,40(sp)
    476c:	02912223          	sw	s1,36(sp)
    4770:	01412c23          	sw	s4,24(sp)
    4774:	01812423          	sw	s8,8(sp)
    4778:	004bac03          	lw	s8,4(s7)
    477c:	000ba403          	lw	s0,0(s7)
    4780:	002c5a13          	srl	s4,s8,0x2
    4784:	060a0663          	beqz	s4,47f0 <__sprint_r.part.0+0xcc>
    4788:	00000493          	li	s1,0
    478c:	00c0006f          	j	4798 <__sprint_r.part.0+0x74>
    4790:	00440413          	add	s0,s0,4
    4794:	049a0c63          	beq	s4,s1,47ec <__sprint_r.part.0+0xc8>
    4798:	00042583          	lw	a1,0(s0)
    479c:	00090613          	mv	a2,s2
    47a0:	00098513          	mv	a0,s3
    47a4:	399020ef          	jal	733c <_fputwc_r>
    47a8:	00148493          	add	s1,s1,1
    47ac:	ff5512e3          	bne	a0,s5,4790 <__sprint_r.part.0+0x6c>
    47b0:	02812403          	lw	s0,40(sp)
    47b4:	02412483          	lw	s1,36(sp)
    47b8:	02012903          	lw	s2,32(sp)
    47bc:	01c12983          	lw	s3,28(sp)
    47c0:	01812a03          	lw	s4,24(sp)
    47c4:	01412a83          	lw	s5,20(sp)
    47c8:	00c12b83          	lw	s7,12(sp)
    47cc:	00812c03          	lw	s8,8(sp)
    47d0:	fff00513          	li	a0,-1
    47d4:	02c12083          	lw	ra,44(sp)
    47d8:	000b2423          	sw	zero,8(s6)
    47dc:	000b2223          	sw	zero,4(s6)
    47e0:	01012b03          	lw	s6,16(sp)
    47e4:	03010113          	add	sp,sp,48
    47e8:	00008067          	ret
    47ec:	008b2783          	lw	a5,8(s6)
    47f0:	ffcc7c13          	and	s8,s8,-4
    47f4:	418787b3          	sub	a5,a5,s8
    47f8:	00fb2423          	sw	a5,8(s6)
    47fc:	008b8b93          	add	s7,s7,8
    4800:	f6079ce3          	bnez	a5,4778 <__sprint_r.part.0+0x54>
    4804:	02812403          	lw	s0,40(sp)
    4808:	02412483          	lw	s1,36(sp)
    480c:	01812a03          	lw	s4,24(sp)
    4810:	00812c03          	lw	s8,8(sp)
    4814:	02012903          	lw	s2,32(sp)
    4818:	01c12983          	lw	s3,28(sp)
    481c:	01412a83          	lw	s5,20(sp)
    4820:	00c12b83          	lw	s7,12(sp)
    4824:	00000513          	li	a0,0
    4828:	fadff06f          	j	47d4 <__sprint_r.part.0+0xb0>
    482c:	6b5010ef          	jal	66e0 <__sfvwrite_r>
    4830:	02c12083          	lw	ra,44(sp)
    4834:	000b2423          	sw	zero,8(s6)
    4838:	000b2223          	sw	zero,4(s6)
    483c:	01012b03          	lw	s6,16(sp)
    4840:	03010113          	add	sp,sp,48
    4844:	00008067          	ret

00004848 <__sprint_r>:
    4848:	00862703          	lw	a4,8(a2)
    484c:	00070463          	beqz	a4,4854 <__sprint_r+0xc>
    4850:	ed5ff06f          	j	4724 <__sprint_r.part.0>
    4854:	00062223          	sw	zero,4(a2)
    4858:	00000513          	li	a0,0
    485c:	00008067          	ret

00004860 <_vfiprintf_r>:
    4860:	eb010113          	add	sp,sp,-336
    4864:	14812423          	sw	s0,328(sp)
    4868:	13312e23          	sw	s3,316(sp)
    486c:	13812423          	sw	s8,296(sp)
    4870:	00050413          	mv	s0,a0
    4874:	00058993          	mv	s3,a1
    4878:	00060c13          	mv	s8,a2
    487c:	00000593          	li	a1,0
    4880:	00800613          	li	a2,8
    4884:	05010513          	add	a0,sp,80
    4888:	13512a23          	sw	s5,308(sp)
    488c:	14112623          	sw	ra,332(sp)
    4890:	00068a93          	mv	s5,a3
    4894:	9a4fc0ef          	jal	a38 <memset>
    4898:	00040863          	beqz	s0,48a8 <_vfiprintf_r+0x48>
    489c:	03442783          	lw	a5,52(s0)
    48a0:	00079463          	bnez	a5,48a8 <_vfiprintf_r+0x48>
    48a4:	49c0106f          	j	5d40 <_vfiprintf_r+0x14e0>
    48a8:	0649a703          	lw	a4,100(s3)
    48ac:	00c99783          	lh	a5,12(s3)
    48b0:	00177713          	and	a4,a4,1
    48b4:	00071863          	bnez	a4,48c4 <_vfiprintf_r+0x64>
    48b8:	2007f713          	and	a4,a5,512
    48bc:	00071463          	bnez	a4,48c4 <_vfiprintf_r+0x64>
    48c0:	0b80106f          	j	5978 <_vfiprintf_r+0x1118>
    48c4:	01279713          	sll	a4,a5,0x12
    48c8:	02074663          	bltz	a4,48f4 <_vfiprintf_r+0x94>
    48cc:	0649a703          	lw	a4,100(s3)
    48d0:	00002637          	lui	a2,0x2
    48d4:	ffffe6b7          	lui	a3,0xffffe
    48d8:	00c7e7b3          	or	a5,a5,a2
    48dc:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    48e0:	01079793          	sll	a5,a5,0x10
    48e4:	4107d793          	sra	a5,a5,0x10
    48e8:	00d77733          	and	a4,a4,a3
    48ec:	00f99623          	sh	a5,12(s3)
    48f0:	06e9a223          	sw	a4,100(s3)
    48f4:	0087f713          	and	a4,a5,8
    48f8:	2e070463          	beqz	a4,4be0 <_vfiprintf_r+0x380>
    48fc:	0109a703          	lw	a4,16(s3)
    4900:	2e070063          	beqz	a4,4be0 <_vfiprintf_r+0x380>
    4904:	01a7f713          	and	a4,a5,26
    4908:	00a00693          	li	a3,10
    490c:	2ed70c63          	beq	a4,a3,4c04 <_vfiprintf_r+0x3a4>
    4910:	13412c23          	sw	s4,312(sp)
    4914:	06c10a13          	add	s4,sp,108
    4918:	14912223          	sw	s1,324(sp)
    491c:	15212023          	sw	s2,320(sp)
    4920:	13612823          	sw	s6,304(sp)
    4924:	13712623          	sw	s7,300(sp)
    4928:	13912223          	sw	s9,292(sp)
    492c:	13a12023          	sw	s10,288(sp)
    4930:	000c0c93          	mv	s9,s8
    4934:	11b12e23          	sw	s11,284(sp)
    4938:	07412023          	sw	s4,96(sp)
    493c:	06012423          	sw	zero,104(sp)
    4940:	06012223          	sw	zero,100(sp)
    4944:	00012a23          	sw	zero,20(sp)
    4948:	02012623          	sw	zero,44(sp)
    494c:	02012823          	sw	zero,48(sp)
    4950:	02012a23          	sw	zero,52(sp)
    4954:	00012623          	sw	zero,12(sp)
    4958:	7fffc497          	auipc	s1,0x7fffc
    495c:	bdc48493          	add	s1,s1,-1060 # 80000534 <__global_locale>
    4960:	02500913          	li	s2,37
    4964:	0000ab97          	auipc	s7,0xa
    4968:	584b8b93          	add	s7,s7,1412 # eee8 <blanks.1+0x10>
    496c:	0000ab17          	auipc	s6,0xa
    4970:	6e8b0b13          	add	s6,s6,1768 # f054 <zeroes.0>
    4974:	000a0c13          	mv	s8,s4
    4978:	000c8d93          	mv	s11,s9
    497c:	0e44ad03          	lw	s10,228(s1)
    4980:	3f9020ef          	jal	7578 <__locale_mb_cur_max>
    4984:	00050693          	mv	a3,a0
    4988:	05010713          	add	a4,sp,80
    498c:	000d8613          	mv	a2,s11
    4990:	04810593          	add	a1,sp,72
    4994:	00040513          	mv	a0,s0
    4998:	000d00e7          	jalr	s10
    499c:	2e050e63          	beqz	a0,4c98 <_vfiprintf_r+0x438>
    49a0:	2c054e63          	bltz	a0,4c7c <_vfiprintf_r+0x41c>
    49a4:	04812783          	lw	a5,72(sp)
    49a8:	01278663          	beq	a5,s2,49b4 <_vfiprintf_r+0x154>
    49ac:	00ad8db3          	add	s11,s11,a0
    49b0:	fcdff06f          	j	497c <_vfiprintf_r+0x11c>
    49b4:	00050d13          	mv	s10,a0
    49b8:	419d87b3          	sub	a5,s11,s9
    49bc:	2f9d9463          	bne	s11,s9,4ca4 <_vfiprintf_r+0x444>
    49c0:	00000e13          	li	t3,0
    49c4:	001dc683          	lbu	a3,1(s11)
    49c8:	001d8c93          	add	s9,s11,1
    49cc:	040101a3          	sb	zero,67(sp)
    49d0:	fff00713          	li	a4,-1
    49d4:	00000893          	li	a7,0
    49d8:	05a00d13          	li	s10,90
    49dc:	000e0d93          	mv	s11,t3
    49e0:	001c8c93          	add	s9,s9,1
    49e4:	fe068793          	add	a5,a3,-32
    49e8:	04fd6663          	bltu	s10,a5,4a34 <_vfiprintf_r+0x1d4>
    49ec:	00279793          	sll	a5,a5,0x2
    49f0:	017787b3          	add	a5,a5,s7
    49f4:	0007a783          	lw	a5,0(a5)
    49f8:	017787b3          	add	a5,a5,s7
    49fc:	00078067          	jr	a5
    4a00:	00000893          	li	a7,0
    4a04:	fd068793          	add	a5,a3,-48
    4a08:	00900593          	li	a1,9
    4a0c:	000cc683          	lbu	a3,0(s9)
    4a10:	00289613          	sll	a2,a7,0x2
    4a14:	011608b3          	add	a7,a2,a7
    4a18:	00189893          	sll	a7,a7,0x1
    4a1c:	011788b3          	add	a7,a5,a7
    4a20:	fd068793          	add	a5,a3,-48
    4a24:	001c8c93          	add	s9,s9,1
    4a28:	fef5f2e3          	bgeu	a1,a5,4a0c <_vfiprintf_r+0x1ac>
    4a2c:	fe068793          	add	a5,a3,-32
    4a30:	fafd7ee3          	bgeu	s10,a5,49ec <_vfiprintf_r+0x18c>
    4a34:	000d8e13          	mv	t3,s11
    4a38:	2c068663          	beqz	a3,4d04 <_vfiprintf_r+0x4a4>
    4a3c:	0ad10623          	sb	a3,172(sp)
    4a40:	040101a3          	sb	zero,67(sp)
    4a44:	00100e93          	li	t4,1
    4a48:	00100d13          	li	s10,1
    4a4c:	0ac10813          	add	a6,sp,172
    4a50:	00012823          	sw	zero,16(sp)
    4a54:	00000713          	li	a4,0
    4a58:	00000f93          	li	t6,0
    4a5c:	06412603          	lw	a2,100(sp)
    4a60:	084e7293          	and	t0,t3,132
    4a64:	06812783          	lw	a5,104(sp)
    4a68:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x675>
    4a6c:	00058f13          	mv	t5,a1
    4a70:	00029663          	bnez	t0,4a7c <_vfiprintf_r+0x21c>
    4a74:	41d88db3          	sub	s11,a7,t4
    4a78:	47b046e3          	bgtz	s11,56e4 <_vfiprintf_r+0xe84>
    4a7c:	04314583          	lbu	a1,67(sp)
    4a80:	02058a63          	beqz	a1,4ab4 <_vfiprintf_r+0x254>
    4a84:	04310613          	add	a2,sp,67
    4a88:	00178793          	add	a5,a5,1
    4a8c:	00100693          	li	a3,1
    4a90:	00cc2023          	sw	a2,0(s8)
    4a94:	00dc2223          	sw	a3,4(s8)
    4a98:	06f12423          	sw	a5,104(sp)
    4a9c:	07e12223          	sw	t5,100(sp)
    4aa0:	00700613          	li	a2,7
    4aa4:	35e64ce3          	blt	a2,t5,55fc <_vfiprintf_r+0xd9c>
    4aa8:	000f0613          	mv	a2,t5
    4aac:	008c0c13          	add	s8,s8,8
    4ab0:	001f0f13          	add	t5,t5,1
    4ab4:	080f8063          	beqz	t6,4b34 <_vfiprintf_r+0x2d4>
    4ab8:	00200613          	li	a2,2
    4abc:	00278793          	add	a5,a5,2
    4ac0:	04410693          	add	a3,sp,68
    4ac4:	00cc2223          	sw	a2,4(s8)
    4ac8:	00dc2023          	sw	a3,0(s8)
    4acc:	06f12423          	sw	a5,104(sp)
    4ad0:	07e12223          	sw	t5,100(sp)
    4ad4:	00700613          	li	a2,7
    4ad8:	3be652e3          	bge	a2,t5,567c <_vfiprintf_r+0xe1c>
    4adc:	60078ae3          	beqz	a5,58f0 <_vfiprintf_r+0x1090>
    4ae0:	06010613          	add	a2,sp,96
    4ae4:	00098593          	mv	a1,s3
    4ae8:	00040513          	mv	a0,s0
    4aec:	03d12c23          	sw	t4,56(sp)
    4af0:	02e12423          	sw	a4,40(sp)
    4af4:	03112223          	sw	a7,36(sp)
    4af8:	03012023          	sw	a6,32(sp)
    4afc:	00512e23          	sw	t0,28(sp)
    4b00:	01c12c23          	sw	t3,24(sp)
    4b04:	c21ff0ef          	jal	4724 <__sprint_r.part.0>
    4b08:	22051463          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    4b0c:	06412603          	lw	a2,100(sp)
    4b10:	06812783          	lw	a5,104(sp)
    4b14:	03812e83          	lw	t4,56(sp)
    4b18:	02812703          	lw	a4,40(sp)
    4b1c:	02412883          	lw	a7,36(sp)
    4b20:	02012803          	lw	a6,32(sp)
    4b24:	01c12283          	lw	t0,28(sp)
    4b28:	01812e03          	lw	t3,24(sp)
    4b2c:	000a0c13          	mv	s8,s4
    4b30:	00160f13          	add	t5,a2,1
    4b34:	08000593          	li	a1,128
    4b38:	06b286e3          	beq	t0,a1,53a4 <_vfiprintf_r+0xb44>
    4b3c:	41a70733          	sub	a4,a4,s10
    4b40:	1ae04ae3          	bgtz	a4,54f4 <_vfiprintf_r+0xc94>
    4b44:	00fd07b3          	add	a5,s10,a5
    4b48:	010c2023          	sw	a6,0(s8)
    4b4c:	01ac2223          	sw	s10,4(s8)
    4b50:	06f12423          	sw	a5,104(sp)
    4b54:	07e12223          	sw	t5,100(sp)
    4b58:	00700713          	li	a4,7
    4b5c:	03e758e3          	bge	a4,t5,538c <_vfiprintf_r+0xb2c>
    4b60:	24078063          	beqz	a5,4da0 <_vfiprintf_r+0x540>
    4b64:	06010613          	add	a2,sp,96
    4b68:	00098593          	mv	a1,s3
    4b6c:	00040513          	mv	a0,s0
    4b70:	03d12023          	sw	t4,32(sp)
    4b74:	01112e23          	sw	a7,28(sp)
    4b78:	01c12c23          	sw	t3,24(sp)
    4b7c:	ba9ff0ef          	jal	4724 <__sprint_r.part.0>
    4b80:	1a051863          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    4b84:	06812783          	lw	a5,104(sp)
    4b88:	02012e83          	lw	t4,32(sp)
    4b8c:	01c12883          	lw	a7,28(sp)
    4b90:	01812e03          	lw	t3,24(sp)
    4b94:	000a0c13          	mv	s8,s4
    4b98:	004e7e13          	and	t3,t3,4
    4b9c:	000e0663          	beqz	t3,4ba8 <_vfiprintf_r+0x348>
    4ba0:	41d88db3          	sub	s11,a7,t4
    4ba4:	21b04a63          	bgtz	s11,4db8 <_vfiprintf_r+0x558>
    4ba8:	01d8d463          	bge	a7,t4,4bb0 <_vfiprintf_r+0x350>
    4bac:	000e8893          	mv	a7,t4
    4bb0:	00c12703          	lw	a4,12(sp)
    4bb4:	01170733          	add	a4,a4,a7
    4bb8:	00e12623          	sw	a4,12(sp)
    4bbc:	16079063          	bnez	a5,4d1c <_vfiprintf_r+0x4bc>
    4bc0:	01012783          	lw	a5,16(sp)
    4bc4:	06012223          	sw	zero,100(sp)
    4bc8:	00078863          	beqz	a5,4bd8 <_vfiprintf_r+0x378>
    4bcc:	00078593          	mv	a1,a5
    4bd0:	00040513          	mv	a0,s0
    4bd4:	ab4fc0ef          	jal	e88 <_free_r>
    4bd8:	000a0c13          	mv	s8,s4
    4bdc:	d9dff06f          	j	4978 <_vfiprintf_r+0x118>
    4be0:	00098593          	mv	a1,s3
    4be4:	00040513          	mv	a0,s0
    4be8:	4b0020ef          	jal	7098 <__swsetup_r>
    4bec:	00050463          	beqz	a0,4bf4 <_vfiprintf_r+0x394>
    4bf0:	3840106f          	j	5f74 <_vfiprintf_r+0x1714>
    4bf4:	00c99783          	lh	a5,12(s3)
    4bf8:	00a00693          	li	a3,10
    4bfc:	01a7f713          	and	a4,a5,26
    4c00:	d0d718e3          	bne	a4,a3,4910 <_vfiprintf_r+0xb0>
    4c04:	00e99703          	lh	a4,14(s3)
    4c08:	d00744e3          	bltz	a4,4910 <_vfiprintf_r+0xb0>
    4c0c:	0649a703          	lw	a4,100(s3)
    4c10:	00177713          	and	a4,a4,1
    4c14:	00071863          	bnez	a4,4c24 <_vfiprintf_r+0x3c4>
    4c18:	2007f793          	and	a5,a5,512
    4c1c:	00079463          	bnez	a5,4c24 <_vfiprintf_r+0x3c4>
    4c20:	2ac0106f          	j	5ecc <_vfiprintf_r+0x166c>
    4c24:	000a8693          	mv	a3,s5
    4c28:	000c0613          	mv	a2,s8
    4c2c:	00098593          	mv	a1,s3
    4c30:	00040513          	mv	a0,s0
    4c34:	3e4010ef          	jal	6018 <__sbprintf>
    4c38:	14c12083          	lw	ra,332(sp)
    4c3c:	14812403          	lw	s0,328(sp)
    4c40:	00a12623          	sw	a0,12(sp)
    4c44:	00c12503          	lw	a0,12(sp)
    4c48:	13c12983          	lw	s3,316(sp)
    4c4c:	13412a83          	lw	s5,308(sp)
    4c50:	12812c03          	lw	s8,296(sp)
    4c54:	15010113          	add	sp,sp,336
    4c58:	00008067          	ret
    4c5c:	000aa883          	lw	a7,0(s5)
    4c60:	004a8a93          	add	s5,s5,4
    4c64:	3608cc63          	bltz	a7,4fdc <_vfiprintf_r+0x77c>
    4c68:	000cc683          	lbu	a3,0(s9)
    4c6c:	d75ff06f          	j	49e0 <_vfiprintf_r+0x180>
    4c70:	000cc683          	lbu	a3,0(s9)
    4c74:	020ded93          	or	s11,s11,32
    4c78:	d69ff06f          	j	49e0 <_vfiprintf_r+0x180>
    4c7c:	00800613          	li	a2,8
    4c80:	00000593          	li	a1,0
    4c84:	05010513          	add	a0,sp,80
    4c88:	db1fb0ef          	jal	a38 <memset>
    4c8c:	00100513          	li	a0,1
    4c90:	00ad8db3          	add	s11,s11,a0
    4c94:	ce9ff06f          	j	497c <_vfiprintf_r+0x11c>
    4c98:	00050d13          	mv	s10,a0
    4c9c:	419d87b3          	sub	a5,s11,s9
    4ca0:	079d8263          	beq	s11,s9,4d04 <_vfiprintf_r+0x4a4>
    4ca4:	06812683          	lw	a3,104(sp)
    4ca8:	06412703          	lw	a4,100(sp)
    4cac:	019c2023          	sw	s9,0(s8)
    4cb0:	00d786b3          	add	a3,a5,a3
    4cb4:	00170713          	add	a4,a4,1
    4cb8:	00fc2223          	sw	a5,4(s8)
    4cbc:	06d12423          	sw	a3,104(sp)
    4cc0:	06e12223          	sw	a4,100(sp)
    4cc4:	00700613          	li	a2,7
    4cc8:	008c0c13          	add	s8,s8,8
    4ccc:	02e65463          	bge	a2,a4,4cf4 <_vfiprintf_r+0x494>
    4cd0:	38068ce3          	beqz	a3,5868 <_vfiprintf_r+0x1008>
    4cd4:	06010613          	add	a2,sp,96
    4cd8:	00098593          	mv	a1,s3
    4cdc:	00040513          	mv	a0,s0
    4ce0:	00f12823          	sw	a5,16(sp)
    4ce4:	a41ff0ef          	jal	4724 <__sprint_r.part.0>
    4ce8:	01012783          	lw	a5,16(sp)
    4cec:	04051c63          	bnez	a0,4d44 <_vfiprintf_r+0x4e4>
    4cf0:	000a0c13          	mv	s8,s4
    4cf4:	00c12703          	lw	a4,12(sp)
    4cf8:	00f707b3          	add	a5,a4,a5
    4cfc:	00f12623          	sw	a5,12(sp)
    4d00:	cc0d10e3          	bnez	s10,49c0 <_vfiprintf_r+0x160>
    4d04:	06812783          	lw	a5,104(sp)
    4d08:	00078463          	beqz	a5,4d10 <_vfiprintf_r+0x4b0>
    4d0c:	22c0106f          	j	5f38 <_vfiprintf_r+0x16d8>
    4d10:	00c99783          	lh	a5,12(s3)
    4d14:	06012223          	sw	zero,100(sp)
    4d18:	0300006f          	j	4d48 <_vfiprintf_r+0x4e8>
    4d1c:	06010613          	add	a2,sp,96
    4d20:	00098593          	mv	a1,s3
    4d24:	00040513          	mv	a0,s0
    4d28:	9fdff0ef          	jal	4724 <__sprint_r.part.0>
    4d2c:	e8050ae3          	beqz	a0,4bc0 <_vfiprintf_r+0x360>
    4d30:	01012783          	lw	a5,16(sp)
    4d34:	00078863          	beqz	a5,4d44 <_vfiprintf_r+0x4e4>
    4d38:	01012583          	lw	a1,16(sp)
    4d3c:	00040513          	mv	a0,s0
    4d40:	948fc0ef          	jal	e88 <_free_r>
    4d44:	00c99783          	lh	a5,12(s3)
    4d48:	0649a703          	lw	a4,100(s3)
    4d4c:	00177713          	and	a4,a4,1
    4d50:	16070a63          	beqz	a4,4ec4 <_vfiprintf_r+0x664>
    4d54:	0407f793          	and	a5,a5,64
    4d58:	14412483          	lw	s1,324(sp)
    4d5c:	14012903          	lw	s2,320(sp)
    4d60:	13812a03          	lw	s4,312(sp)
    4d64:	13012b03          	lw	s6,304(sp)
    4d68:	12c12b83          	lw	s7,300(sp)
    4d6c:	12412c83          	lw	s9,292(sp)
    4d70:	12012d03          	lw	s10,288(sp)
    4d74:	11c12d83          	lw	s11,284(sp)
    4d78:	00078463          	beqz	a5,4d80 <_vfiprintf_r+0x520>
    4d7c:	2180106f          	j	5f94 <_vfiprintf_r+0x1734>
    4d80:	14c12083          	lw	ra,332(sp)
    4d84:	14812403          	lw	s0,328(sp)
    4d88:	00c12503          	lw	a0,12(sp)
    4d8c:	13c12983          	lw	s3,316(sp)
    4d90:	13412a83          	lw	s5,308(sp)
    4d94:	12812c03          	lw	s8,296(sp)
    4d98:	15010113          	add	sp,sp,336
    4d9c:	00008067          	ret
    4da0:	06012223          	sw	zero,100(sp)
    4da4:	004e7e13          	and	t3,t3,4
    4da8:	240e0ee3          	beqz	t3,5804 <_vfiprintf_r+0xfa4>
    4dac:	41d88db3          	sub	s11,a7,t4
    4db0:	25b05ae3          	blez	s11,5804 <_vfiprintf_r+0xfa4>
    4db4:	000a0c13          	mv	s8,s4
    4db8:	01000713          	li	a4,16
    4dbc:	06412683          	lw	a3,100(sp)
    4dc0:	01b74463          	blt	a4,s11,4dc8 <_vfiprintf_r+0x568>
    4dc4:	1900106f          	j	5f54 <_vfiprintf_r+0x16f4>
    4dc8:	000a8713          	mv	a4,s5
    4dcc:	0000a317          	auipc	t1,0xa
    4dd0:	29830313          	add	t1,t1,664 # f064 <blanks.1>
    4dd4:	000c0593          	mv	a1,s8
    4dd8:	000d8a93          	mv	s5,s11
    4ddc:	01000813          	li	a6,16
    4de0:	00700d13          	li	s10,7
    4de4:	01112c23          	sw	a7,24(sp)
    4de8:	01d12e23          	sw	t4,28(sp)
    4dec:	00030c13          	mv	s8,t1
    4df0:	00070d93          	mv	s11,a4
    4df4:	0180006f          	j	4e0c <_vfiprintf_r+0x5ac>
    4df8:	00268613          	add	a2,a3,2
    4dfc:	00858593          	add	a1,a1,8
    4e00:	00070693          	mv	a3,a4
    4e04:	ff0a8a93          	add	s5,s5,-16
    4e08:	05585a63          	bge	a6,s5,4e5c <_vfiprintf_r+0x5fc>
    4e0c:	01078793          	add	a5,a5,16
    4e10:	00168713          	add	a4,a3,1
    4e14:	0185a023          	sw	s8,0(a1)
    4e18:	0105a223          	sw	a6,4(a1)
    4e1c:	06f12423          	sw	a5,104(sp)
    4e20:	06e12223          	sw	a4,100(sp)
    4e24:	fced5ae3          	bge	s10,a4,4df8 <_vfiprintf_r+0x598>
    4e28:	56078663          	beqz	a5,5394 <_vfiprintf_r+0xb34>
    4e2c:	06010613          	add	a2,sp,96
    4e30:	00098593          	mv	a1,s3
    4e34:	00040513          	mv	a0,s0
    4e38:	8edff0ef          	jal	4724 <__sprint_r.part.0>
    4e3c:	ee051ae3          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    4e40:	06412683          	lw	a3,100(sp)
    4e44:	01000813          	li	a6,16
    4e48:	ff0a8a93          	add	s5,s5,-16
    4e4c:	06812783          	lw	a5,104(sp)
    4e50:	000a0593          	mv	a1,s4
    4e54:	00168613          	add	a2,a3,1
    4e58:	fb584ae3          	blt	a6,s5,4e0c <_vfiprintf_r+0x5ac>
    4e5c:	01812883          	lw	a7,24(sp)
    4e60:	01c12e83          	lw	t4,28(sp)
    4e64:	000d8713          	mv	a4,s11
    4e68:	000c0313          	mv	t1,s8
    4e6c:	000a8d93          	mv	s11,s5
    4e70:	00058c13          	mv	s8,a1
    4e74:	00070a93          	mv	s5,a4
    4e78:	01b787b3          	add	a5,a5,s11
    4e7c:	006c2023          	sw	t1,0(s8)
    4e80:	01bc2223          	sw	s11,4(s8)
    4e84:	06f12423          	sw	a5,104(sp)
    4e88:	06c12223          	sw	a2,100(sp)
    4e8c:	00700713          	li	a4,7
    4e90:	d0c75ce3          	bge	a4,a2,4ba8 <_vfiprintf_r+0x348>
    4e94:	160788e3          	beqz	a5,5804 <_vfiprintf_r+0xfa4>
    4e98:	06010613          	add	a2,sp,96
    4e9c:	00098593          	mv	a1,s3
    4ea0:	00040513          	mv	a0,s0
    4ea4:	01d12e23          	sw	t4,28(sp)
    4ea8:	01112c23          	sw	a7,24(sp)
    4eac:	879ff0ef          	jal	4724 <__sprint_r.part.0>
    4eb0:	e80510e3          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    4eb4:	06812783          	lw	a5,104(sp)
    4eb8:	01c12e83          	lw	t4,28(sp)
    4ebc:	01812883          	lw	a7,24(sp)
    4ec0:	ce9ff06f          	j	4ba8 <_vfiprintf_r+0x348>
    4ec4:	2007f713          	and	a4,a5,512
    4ec8:	e80716e3          	bnez	a4,4d54 <_vfiprintf_r+0x4f4>
    4ecc:	0589a503          	lw	a0,88(s3)
    4ed0:	b65fb0ef          	jal	a34 <__retarget_lock_release_recursive>
    4ed4:	00c99783          	lh	a5,12(s3)
    4ed8:	e7dff06f          	j	4d54 <_vfiprintf_r+0x4f4>
    4edc:	000aa803          	lw	a6,0(s5)
    4ee0:	040101a3          	sb	zero,67(sp)
    4ee4:	000d8e13          	mv	t3,s11
    4ee8:	004a8a93          	add	s5,s5,4
    4eec:	68080ae3          	beqz	a6,5d80 <_vfiprintf_r+0x1520>
    4ef0:	05300793          	li	a5,83
    4ef4:	3cf68ce3          	beq	a3,a5,5acc <_vfiprintf_r+0x126c>
    4ef8:	010df793          	and	a5,s11,16
    4efc:	3c0798e3          	bnez	a5,5acc <_vfiprintf_r+0x126c>
    4f00:	00075463          	bgez	a4,4f08 <_vfiprintf_r+0x6a8>
    4f04:	7fd0006f          	j	5f00 <_vfiprintf_r+0x16a0>
    4f08:	00070613          	mv	a2,a4
    4f0c:	00080513          	mv	a0,a6
    4f10:	00000593          	li	a1,0
    4f14:	03112223          	sw	a7,36(sp)
    4f18:	00e12e23          	sw	a4,28(sp)
    4f1c:	01012c23          	sw	a6,24(sp)
    4f20:	03b12023          	sw	s11,32(sp)
    4f24:	4e4020ef          	jal	7408 <memchr>
    4f28:	00a12823          	sw	a0,16(sp)
    4f2c:	01812803          	lw	a6,24(sp)
    4f30:	01c12703          	lw	a4,28(sp)
    4f34:	02012e03          	lw	t3,32(sp)
    4f38:	02412883          	lw	a7,36(sp)
    4f3c:	00051463          	bnez	a0,4f44 <_vfiprintf_r+0x6e4>
    4f40:	7990006f          	j	5ed8 <_vfiprintf_r+0x1678>
    4f44:	41050d33          	sub	s10,a0,a6
    4f48:	fffd4e93          	not	t4,s10
    4f4c:	41fede93          	sra	t4,t4,0x1f
    4f50:	01dd7eb3          	and	t4,s10,t4
    4f54:	00012823          	sw	zero,16(sp)
    4f58:	6dd0006f          	j	5e34 <_vfiprintf_r+0x15d4>
    4f5c:	04300793          	li	a5,67
    4f60:	000d8e13          	mv	t3,s11
    4f64:	004a8d93          	add	s11,s5,4
    4f68:	00f68663          	beq	a3,a5,4f74 <_vfiprintf_r+0x714>
    4f6c:	010e7793          	and	a5,t3,16
    4f70:	280788e3          	beqz	a5,5a00 <_vfiprintf_r+0x11a0>
    4f74:	00800613          	li	a2,8
    4f78:	00000593          	li	a1,0
    4f7c:	05810513          	add	a0,sp,88
    4f80:	01112e23          	sw	a7,28(sp)
    4f84:	01c12c23          	sw	t3,24(sp)
    4f88:	ab1fb0ef          	jal	a38 <memset>
    4f8c:	000aa603          	lw	a2,0(s5)
    4f90:	0ac10593          	add	a1,sp,172
    4f94:	05810693          	add	a3,sp,88
    4f98:	00040513          	mv	a0,s0
    4f9c:	00b12823          	sw	a1,16(sp)
    4fa0:	694050ef          	jal	a634 <_wcrtomb_r>
    4fa4:	fff00793          	li	a5,-1
    4fa8:	01012583          	lw	a1,16(sp)
    4fac:	01812e03          	lw	t3,24(sp)
    4fb0:	01c12883          	lw	a7,28(sp)
    4fb4:	00050d13          	mv	s10,a0
    4fb8:	00f51463          	bne	a0,a5,4fc0 <_vfiprintf_r+0x760>
    4fbc:	0200106f          	j	5fdc <_vfiprintf_r+0x177c>
    4fc0:	fff54e93          	not	t4,a0
    4fc4:	41fede93          	sra	t4,t4,0x1f
    4fc8:	01d57eb3          	and	t4,a0,t4
    4fcc:	040101a3          	sb	zero,67(sp)
    4fd0:	000d8a93          	mv	s5,s11
    4fd4:	00058813          	mv	a6,a1
    4fd8:	a79ff06f          	j	4a50 <_vfiprintf_r+0x1f0>
    4fdc:	411008b3          	neg	a7,a7
    4fe0:	000cc683          	lbu	a3,0(s9)
    4fe4:	004ded93          	or	s11,s11,4
    4fe8:	9f9ff06f          	j	49e0 <_vfiprintf_r+0x180>
    4fec:	010dee13          	or	t3,s11,16
    4ff0:	020e7793          	and	a5,t3,32
    4ff4:	0c0788e3          	beqz	a5,58c4 <_vfiprintf_r+0x1064>
    4ff8:	007a8a93          	add	s5,s5,7
    4ffc:	ff8afa93          	and	s5,s5,-8
    5000:	004aa683          	lw	a3,4(s5)
    5004:	000aad83          	lw	s11,0(s5)
    5008:	008a8a93          	add	s5,s5,8
    500c:	00068d13          	mv	s10,a3
    5010:	3006c263          	bltz	a3,5314 <_vfiprintf_r+0xab4>
    5014:	32074063          	bltz	a4,5334 <_vfiprintf_r+0xad4>
    5018:	01ade6b3          	or	a3,s11,s10
    501c:	f7fe7e13          	and	t3,t3,-129
    5020:	30069a63          	bnez	a3,5334 <_vfiprintf_r+0xad4>
    5024:	68071ae3          	bnez	a4,5eb8 <_vfiprintf_r+0x1658>
    5028:	04314783          	lbu	a5,67(sp)
    502c:	00012823          	sw	zero,16(sp)
    5030:	00000e93          	li	t4,0
    5034:	00000d13          	li	s10,0
    5038:	11010813          	add	a6,sp,272
    503c:	00078463          	beqz	a5,5044 <_vfiprintf_r+0x7e4>
    5040:	001e8e93          	add	t4,t4,1
    5044:	002e7f93          	and	t6,t3,2
    5048:	a00f8ae3          	beqz	t6,4a5c <_vfiprintf_r+0x1fc>
    504c:	002e8e93          	add	t4,t4,2
    5050:	00200f93          	li	t6,2
    5054:	a09ff06f          	j	4a5c <_vfiprintf_r+0x1fc>
    5058:	000cc683          	lbu	a3,0(s9)
    505c:	06800793          	li	a5,104
    5060:	4ef686e3          	beq	a3,a5,5d4c <_vfiprintf_r+0x14ec>
    5064:	040ded93          	or	s11,s11,64
    5068:	979ff06f          	j	49e0 <_vfiprintf_r+0x180>
    506c:	010de613          	or	a2,s11,16
    5070:	02067793          	and	a5,a2,32
    5074:	000780e3          	beqz	a5,5874 <_vfiprintf_r+0x1014>
    5078:	007a8a93          	add	s5,s5,7
    507c:	ff8afa93          	and	s5,s5,-8
    5080:	000aad83          	lw	s11,0(s5)
    5084:	004aad03          	lw	s10,4(s5)
    5088:	008a8a93          	add	s5,s5,8
    508c:	040101a3          	sb	zero,67(sp)
    5090:	00060e13          	mv	t3,a2
    5094:	2a074063          	bltz	a4,5334 <_vfiprintf_r+0xad4>
    5098:	01ade6b3          	or	a3,s11,s10
    509c:	f7f67e13          	and	t3,a2,-129
    50a0:	28069a63          	bnez	a3,5334 <_vfiprintf_r+0xad4>
    50a4:	00100793          	li	a5,1
    50a8:	06071e63          	bnez	a4,5124 <_vfiprintf_r+0x8c4>
    50ac:	f6079ee3          	bnez	a5,5028 <_vfiprintf_r+0x7c8>
    50b0:	00167d13          	and	s10,a2,1
    50b4:	0a0d0ce3          	beqz	s10,596c <_vfiprintf_r+0x110c>
    50b8:	03000793          	li	a5,48
    50bc:	10f107a3          	sb	a5,271(sp)
    50c0:	000d0e93          	mv	t4,s10
    50c4:	10f10813          	add	a6,sp,271
    50c8:	2980006f          	j	5360 <_vfiprintf_r+0xb00>
    50cc:	02b00793          	li	a5,43
    50d0:	000cc683          	lbu	a3,0(s9)
    50d4:	04f101a3          	sb	a5,67(sp)
    50d8:	909ff06f          	j	49e0 <_vfiprintf_r+0x180>
    50dc:	010de693          	or	a3,s11,16
    50e0:	0206f793          	and	a5,a3,32
    50e4:	7a078c63          	beqz	a5,589c <_vfiprintf_r+0x103c>
    50e8:	007a8a93          	add	s5,s5,7
    50ec:	ff8afa93          	and	s5,s5,-8
    50f0:	000aa783          	lw	a5,0(s5)
    50f4:	004aa583          	lw	a1,4(s5)
    50f8:	008a8a93          	add	s5,s5,8
    50fc:	040101a3          	sb	zero,67(sp)
    5100:	bff6fe13          	and	t3,a3,-1025
    5104:	02074c63          	bltz	a4,513c <_vfiprintf_r+0x8dc>
    5108:	00b7e633          	or	a2,a5,a1
    510c:	b7f6f693          	and	a3,a3,-1153
    5110:	420610e3          	bnez	a2,5d30 <_vfiprintf_r+0x14d0>
    5114:	000e0613          	mv	a2,t3
    5118:	00000793          	li	a5,0
    511c:	00068e13          	mv	t3,a3
    5120:	f80706e3          	beqz	a4,50ac <_vfiprintf_r+0x84c>
    5124:	00100693          	li	a3,1
    5128:	58d788e3          	beq	a5,a3,5eb8 <_vfiprintf_r+0x1658>
    512c:	00200693          	li	a3,2
    5130:	46d786e3          	beq	a5,a3,5d9c <_vfiprintf_r+0x153c>
    5134:	00000793          	li	a5,0
    5138:	00000593          	li	a1,0
    513c:	11010813          	add	a6,sp,272
    5140:	01d59613          	sll	a2,a1,0x1d
    5144:	0077f693          	and	a3,a5,7
    5148:	0037d793          	srl	a5,a5,0x3
    514c:	03068693          	add	a3,a3,48
    5150:	00f667b3          	or	a5,a2,a5
    5154:	0035d593          	srl	a1,a1,0x3
    5158:	fed80fa3          	sb	a3,-1(a6)
    515c:	00b7e633          	or	a2,a5,a1
    5160:	00080513          	mv	a0,a6
    5164:	fff80813          	add	a6,a6,-1
    5168:	fc061ce3          	bnez	a2,5140 <_vfiprintf_r+0x8e0>
    516c:	001e7793          	and	a5,t3,1
    5170:	54078e63          	beqz	a5,56cc <_vfiprintf_r+0xe6c>
    5174:	03000793          	li	a5,48
    5178:	54f68a63          	beq	a3,a5,56cc <_vfiprintf_r+0xe6c>
    517c:	ffe50513          	add	a0,a0,-2
    5180:	fef80fa3          	sb	a5,-1(a6)
    5184:	11010793          	add	a5,sp,272
    5188:	40a78d33          	sub	s10,a5,a0
    518c:	00070e93          	mv	t4,a4
    5190:	09a744e3          	blt	a4,s10,5a18 <_vfiprintf_r+0x11b8>
    5194:	00050813          	mv	a6,a0
    5198:	1c80006f          	j	5360 <_vfiprintf_r+0xb00>
    519c:	000086b7          	lui	a3,0x8
    51a0:	83068693          	add	a3,a3,-2000 # 7830 <memmove+0xc4>
    51a4:	04d11223          	sh	a3,68(sp)
    51a8:	0000a697          	auipc	a3,0xa
    51ac:	83868693          	add	a3,a3,-1992 # e9e0 <__fini_array_end+0x9c>
    51b0:	000aa783          	lw	a5,0(s5)
    51b4:	00000593          	li	a1,0
    51b8:	002dee13          	or	t3,s11,2
    51bc:	004a8a93          	add	s5,s5,4
    51c0:	00d12a23          	sw	a3,20(sp)
    51c4:	040101a3          	sb	zero,67(sp)
    51c8:	4c074863          	bltz	a4,5698 <_vfiprintf_r+0xe38>
    51cc:	00b7e6b3          	or	a3,a5,a1
    51d0:	f7fe7513          	and	a0,t3,-129
    51d4:	4a069c63          	bnez	a3,568c <_vfiprintf_r+0xe2c>
    51d8:	000e0613          	mv	a2,t3
    51dc:	00200793          	li	a5,2
    51e0:	00050e13          	mv	t3,a0
    51e4:	ec5ff06f          	j	50a8 <_vfiprintf_r+0x848>
    51e8:	00040513          	mv	a0,s0
    51ec:	00e12c23          	sw	a4,24(sp)
    51f0:	01112823          	sw	a7,16(sp)
    51f4:	390020ef          	jal	7584 <_localeconv_r>
    51f8:	00452783          	lw	a5,4(a0)
    51fc:	00078513          	mv	a0,a5
    5200:	02f12a23          	sw	a5,52(sp)
    5204:	ab5fb0ef          	jal	cb8 <strlen>
    5208:	00050793          	mv	a5,a0
    520c:	00040513          	mv	a0,s0
    5210:	02f12823          	sw	a5,48(sp)
    5214:	370020ef          	jal	7584 <_localeconv_r>
    5218:	00852703          	lw	a4,8(a0)
    521c:	03012783          	lw	a5,48(sp)
    5220:	01012883          	lw	a7,16(sp)
    5224:	02e12623          	sw	a4,44(sp)
    5228:	01812703          	lw	a4,24(sp)
    522c:	a2078ee3          	beqz	a5,4c68 <_vfiprintf_r+0x408>
    5230:	02c12783          	lw	a5,44(sp)
    5234:	000cc683          	lbu	a3,0(s9)
    5238:	fa078463          	beqz	a5,49e0 <_vfiprintf_r+0x180>
    523c:	0007c783          	lbu	a5,0(a5)
    5240:	fa078063          	beqz	a5,49e0 <_vfiprintf_r+0x180>
    5244:	400ded93          	or	s11,s11,1024
    5248:	f98ff06f          	j	49e0 <_vfiprintf_r+0x180>
    524c:	020df793          	and	a5,s11,32
    5250:	78079263          	bnez	a5,59d4 <_vfiprintf_r+0x1174>
    5254:	010df793          	and	a5,s11,16
    5258:	30079ae3          	bnez	a5,5d6c <_vfiprintf_r+0x150c>
    525c:	040df793          	and	a5,s11,64
    5260:	400796e3          	bnez	a5,5e6c <_vfiprintf_r+0x160c>
    5264:	200dfe13          	and	t3,s11,512
    5268:	300e02e3          	beqz	t3,5d6c <_vfiprintf_r+0x150c>
    526c:	000aa783          	lw	a5,0(s5)
    5270:	00c12703          	lw	a4,12(sp)
    5274:	004a8a93          	add	s5,s5,4
    5278:	00e78023          	sb	a4,0(a5)
    527c:	efcff06f          	j	4978 <_vfiprintf_r+0x118>
    5280:	000cc683          	lbu	a3,0(s9)
    5284:	06c00793          	li	a5,108
    5288:	2cf68ae3          	beq	a3,a5,5d5c <_vfiprintf_r+0x14fc>
    528c:	010ded93          	or	s11,s11,16
    5290:	f50ff06f          	j	49e0 <_vfiprintf_r+0x180>
    5294:	000cc683          	lbu	a3,0(s9)
    5298:	080ded93          	or	s11,s11,128
    529c:	f44ff06f          	j	49e0 <_vfiprintf_r+0x180>
    52a0:	000cc683          	lbu	a3,0(s9)
    52a4:	02a00793          	li	a5,42
    52a8:	001c8593          	add	a1,s9,1
    52ac:	54f680e3          	beq	a3,a5,5fec <_vfiprintf_r+0x178c>
    52b0:	fd068793          	add	a5,a3,-48
    52b4:	00900613          	li	a2,9
    52b8:	00000713          	li	a4,0
    52bc:	00900513          	li	a0,9
    52c0:	02f66463          	bltu	a2,a5,52e8 <_vfiprintf_r+0xa88>
    52c4:	0005c683          	lbu	a3,0(a1)
    52c8:	00271613          	sll	a2,a4,0x2
    52cc:	00e60733          	add	a4,a2,a4
    52d0:	00171713          	sll	a4,a4,0x1
    52d4:	00f70733          	add	a4,a4,a5
    52d8:	fd068793          	add	a5,a3,-48
    52dc:	00158593          	add	a1,a1,1
    52e0:	fef572e3          	bgeu	a0,a5,52c4 <_vfiprintf_r+0xa64>
    52e4:	74074063          	bltz	a4,5a24 <_vfiprintf_r+0x11c4>
    52e8:	00058c93          	mv	s9,a1
    52ec:	ef8ff06f          	j	49e4 <_vfiprintf_r+0x184>
    52f0:	000cc683          	lbu	a3,0(s9)
    52f4:	001ded93          	or	s11,s11,1
    52f8:	ee8ff06f          	j	49e0 <_vfiprintf_r+0x180>
    52fc:	04314783          	lbu	a5,67(sp)
    5300:	000cc683          	lbu	a3,0(s9)
    5304:	ec079e63          	bnez	a5,49e0 <_vfiprintf_r+0x180>
    5308:	02000793          	li	a5,32
    530c:	04f101a3          	sb	a5,67(sp)
    5310:	ed0ff06f          	j	49e0 <_vfiprintf_r+0x180>
    5314:	02d00613          	li	a2,45
    5318:	01b036b3          	snez	a3,s11
    531c:	41a000b3          	neg	ra,s10
    5320:	04c101a3          	sb	a2,67(sp)
    5324:	40d08d33          	sub	s10,ra,a3
    5328:	41b00db3          	neg	s11,s11
    532c:	00074463          	bltz	a4,5334 <_vfiprintf_r+0xad4>
    5330:	f7fe7e13          	and	t3,t3,-129
    5334:	120d14e3          	bnez	s10,5c5c <_vfiprintf_r+0x13fc>
    5338:	00900693          	li	a3,9
    533c:	13b6e0e3          	bltu	a3,s11,5c5c <_vfiprintf_r+0x13fc>
    5340:	030d8793          	add	a5,s11,48
    5344:	0ff7f793          	zext.b	a5,a5
    5348:	10f107a3          	sb	a5,271(sp)
    534c:	00070e93          	mv	t4,a4
    5350:	00e04463          	bgtz	a4,5358 <_vfiprintf_r+0xaf8>
    5354:	00100e93          	li	t4,1
    5358:	00100d13          	li	s10,1
    535c:	10f10813          	add	a6,sp,271
    5360:	04314783          	lbu	a5,67(sp)
    5364:	00012823          	sw	zero,16(sp)
    5368:	cc079ce3          	bnez	a5,5040 <_vfiprintf_r+0x7e0>
    536c:	cd9ff06f          	j	5044 <_vfiprintf_r+0x7e4>
    5370:	00100713          	li	a4,1
    5374:	000d0793          	mv	a5,s10
    5378:	07012623          	sw	a6,108(sp)
    537c:	07a12823          	sw	s10,112(sp)
    5380:	07a12423          	sw	s10,104(sp)
    5384:	06e12223          	sw	a4,100(sp)
    5388:	000a0c13          	mv	s8,s4
    538c:	008c0c13          	add	s8,s8,8
    5390:	809ff06f          	j	4b98 <_vfiprintf_r+0x338>
    5394:	00100613          	li	a2,1
    5398:	00000693          	li	a3,0
    539c:	000a0593          	mv	a1,s4
    53a0:	a65ff06f          	j	4e04 <_vfiprintf_r+0x5a4>
    53a4:	41d88db3          	sub	s11,a7,t4
    53a8:	f9b05a63          	blez	s11,4b3c <_vfiprintf_r+0x2dc>
    53ac:	01000593          	li	a1,16
    53b0:	3bb5dae3          	bge	a1,s11,5f64 <_vfiprintf_r+0x1704>
    53b4:	0000af97          	auipc	t6,0xa
    53b8:	ca0f8f93          	add	t6,t6,-864 # f054 <zeroes.0>
    53bc:	02e12223          	sw	a4,36(sp)
    53c0:	000a8713          	mv	a4,s5
    53c4:	000c0693          	mv	a3,s8
    53c8:	000d8a93          	mv	s5,s11
    53cc:	01000f13          	li	t5,16
    53d0:	00700293          	li	t0,7
    53d4:	01c12c23          	sw	t3,24(sp)
    53d8:	01012e23          	sw	a6,28(sp)
    53dc:	03112023          	sw	a7,32(sp)
    53e0:	03d12423          	sw	t4,40(sp)
    53e4:	000f8c13          	mv	s8,t6
    53e8:	00070d93          	mv	s11,a4
    53ec:	0180006f          	j	5404 <_vfiprintf_r+0xba4>
    53f0:	00260513          	add	a0,a2,2
    53f4:	00868693          	add	a3,a3,8
    53f8:	00070613          	mv	a2,a4
    53fc:	ff0a8a93          	add	s5,s5,-16
    5400:	055f5c63          	bge	t5,s5,5458 <_vfiprintf_r+0xbf8>
    5404:	01078793          	add	a5,a5,16
    5408:	00160713          	add	a4,a2,1
    540c:	0186a023          	sw	s8,0(a3)
    5410:	01e6a223          	sw	t5,4(a3)
    5414:	06f12423          	sw	a5,104(sp)
    5418:	06e12223          	sw	a4,100(sp)
    541c:	fce2dae3          	bge	t0,a4,53f0 <_vfiprintf_r+0xb90>
    5420:	1c078663          	beqz	a5,55ec <_vfiprintf_r+0xd8c>
    5424:	06010613          	add	a2,sp,96
    5428:	00098593          	mv	a1,s3
    542c:	00040513          	mv	a0,s0
    5430:	af4ff0ef          	jal	4724 <__sprint_r.part.0>
    5434:	8e051ee3          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5438:	06412603          	lw	a2,100(sp)
    543c:	01000f13          	li	t5,16
    5440:	ff0a8a93          	add	s5,s5,-16
    5444:	06812783          	lw	a5,104(sp)
    5448:	000a0693          	mv	a3,s4
    544c:	00160513          	add	a0,a2,1
    5450:	00700293          	li	t0,7
    5454:	fb5f48e3          	blt	t5,s5,5404 <_vfiprintf_r+0xba4>
    5458:	01812e03          	lw	t3,24(sp)
    545c:	01c12803          	lw	a6,28(sp)
    5460:	02012883          	lw	a7,32(sp)
    5464:	02412703          	lw	a4,36(sp)
    5468:	02812e83          	lw	t4,40(sp)
    546c:	000d8613          	mv	a2,s11
    5470:	000c0f93          	mv	t6,s8
    5474:	000a8d93          	mv	s11,s5
    5478:	00068c13          	mv	s8,a3
    547c:	00060a93          	mv	s5,a2
    5480:	01b787b3          	add	a5,a5,s11
    5484:	01fc2023          	sw	t6,0(s8)
    5488:	01bc2223          	sw	s11,4(s8)
    548c:	06f12423          	sw	a5,104(sp)
    5490:	06a12223          	sw	a0,100(sp)
    5494:	00700613          	li	a2,7
    5498:	4ea65863          	bge	a2,a0,5988 <_vfiprintf_r+0x1128>
    549c:	1a0786e3          	beqz	a5,5e48 <_vfiprintf_r+0x15e8>
    54a0:	06010613          	add	a2,sp,96
    54a4:	00098593          	mv	a1,s3
    54a8:	00040513          	mv	a0,s0
    54ac:	03d12423          	sw	t4,40(sp)
    54b0:	02e12223          	sw	a4,36(sp)
    54b4:	03112023          	sw	a7,32(sp)
    54b8:	01012e23          	sw	a6,28(sp)
    54bc:	01c12c23          	sw	t3,24(sp)
    54c0:	a64ff0ef          	jal	4724 <__sprint_r.part.0>
    54c4:	860516e3          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    54c8:	02412703          	lw	a4,36(sp)
    54cc:	06412603          	lw	a2,100(sp)
    54d0:	06812783          	lw	a5,104(sp)
    54d4:	41a70733          	sub	a4,a4,s10
    54d8:	02812e83          	lw	t4,40(sp)
    54dc:	02012883          	lw	a7,32(sp)
    54e0:	01c12803          	lw	a6,28(sp)
    54e4:	01812e03          	lw	t3,24(sp)
    54e8:	000a0c13          	mv	s8,s4
    54ec:	00160f13          	add	t5,a2,1
    54f0:	e4e05a63          	blez	a4,4b44 <_vfiprintf_r+0x2e4>
    54f4:	01000593          	li	a1,16
    54f8:	0000af97          	auipc	t6,0xa
    54fc:	b5cf8f93          	add	t6,t6,-1188 # f054 <zeroes.0>
    5500:	0ae5da63          	bge	a1,a4,55b4 <_vfiprintf_r+0xd54>
    5504:	000c0593          	mv	a1,s8
    5508:	03512423          	sw	s5,40(sp)
    550c:	01000d93          	li	s11,16
    5510:	00700293          	li	t0,7
    5514:	01c12c23          	sw	t3,24(sp)
    5518:	01012e23          	sw	a6,28(sp)
    551c:	03112023          	sw	a7,32(sp)
    5520:	03d12223          	sw	t4,36(sp)
    5524:	00070a93          	mv	s5,a4
    5528:	000b0c13          	mv	s8,s6
    552c:	0180006f          	j	5544 <_vfiprintf_r+0xce4>
    5530:	00260f13          	add	t5,a2,2
    5534:	00858593          	add	a1,a1,8
    5538:	00068613          	mv	a2,a3
    553c:	ff0a8a93          	add	s5,s5,-16
    5540:	055dda63          	bge	s11,s5,5594 <_vfiprintf_r+0xd34>
    5544:	01078793          	add	a5,a5,16
    5548:	00160693          	add	a3,a2,1
    554c:	0165a023          	sw	s6,0(a1)
    5550:	01b5a223          	sw	s11,4(a1)
    5554:	06f12423          	sw	a5,104(sp)
    5558:	06d12223          	sw	a3,100(sp)
    555c:	fcd2dae3          	bge	t0,a3,5530 <_vfiprintf_r+0xcd0>
    5560:	06078e63          	beqz	a5,55dc <_vfiprintf_r+0xd7c>
    5564:	06010613          	add	a2,sp,96
    5568:	00098593          	mv	a1,s3
    556c:	00040513          	mv	a0,s0
    5570:	9b4ff0ef          	jal	4724 <__sprint_r.part.0>
    5574:	fa051e63          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5578:	06412603          	lw	a2,100(sp)
    557c:	ff0a8a93          	add	s5,s5,-16
    5580:	06812783          	lw	a5,104(sp)
    5584:	000a0593          	mv	a1,s4
    5588:	00160f13          	add	t5,a2,1
    558c:	00700293          	li	t0,7
    5590:	fb5dcae3          	blt	s11,s5,5544 <_vfiprintf_r+0xce4>
    5594:	000a8713          	mv	a4,s5
    5598:	01812e03          	lw	t3,24(sp)
    559c:	01c12803          	lw	a6,28(sp)
    55a0:	02012883          	lw	a7,32(sp)
    55a4:	02412e83          	lw	t4,36(sp)
    55a8:	02812a83          	lw	s5,40(sp)
    55ac:	000c0f93          	mv	t6,s8
    55b0:	00058c13          	mv	s8,a1
    55b4:	00e787b3          	add	a5,a5,a4
    55b8:	00ec2223          	sw	a4,4(s8)
    55bc:	01fc2023          	sw	t6,0(s8)
    55c0:	06f12423          	sw	a5,104(sp)
    55c4:	07e12223          	sw	t5,100(sp)
    55c8:	00700713          	li	a4,7
    55cc:	25e74863          	blt	a4,t5,581c <_vfiprintf_r+0xfbc>
    55d0:	008c0c13          	add	s8,s8,8
    55d4:	001f0f13          	add	t5,t5,1
    55d8:	d6cff06f          	j	4b44 <_vfiprintf_r+0x2e4>
    55dc:	00100f13          	li	t5,1
    55e0:	00000613          	li	a2,0
    55e4:	000a0593          	mv	a1,s4
    55e8:	f55ff06f          	j	553c <_vfiprintf_r+0xcdc>
    55ec:	00100513          	li	a0,1
    55f0:	00000613          	li	a2,0
    55f4:	000a0693          	mv	a3,s4
    55f8:	e05ff06f          	j	53fc <_vfiprintf_r+0xb9c>
    55fc:	06078263          	beqz	a5,5660 <_vfiprintf_r+0xe00>
    5600:	06010613          	add	a2,sp,96
    5604:	00098593          	mv	a1,s3
    5608:	00040513          	mv	a0,s0
    560c:	03d12e23          	sw	t4,60(sp)
    5610:	02e12c23          	sw	a4,56(sp)
    5614:	03112423          	sw	a7,40(sp)
    5618:	03012223          	sw	a6,36(sp)
    561c:	02512023          	sw	t0,32(sp)
    5620:	01f12e23          	sw	t6,28(sp)
    5624:	01c12c23          	sw	t3,24(sp)
    5628:	8fcff0ef          	jal	4724 <__sprint_r.part.0>
    562c:	f0051263          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5630:	06412603          	lw	a2,100(sp)
    5634:	06812783          	lw	a5,104(sp)
    5638:	03c12e83          	lw	t4,60(sp)
    563c:	03812703          	lw	a4,56(sp)
    5640:	02812883          	lw	a7,40(sp)
    5644:	02412803          	lw	a6,36(sp)
    5648:	02012283          	lw	t0,32(sp)
    564c:	01c12f83          	lw	t6,28(sp)
    5650:	01812e03          	lw	t3,24(sp)
    5654:	000a0c13          	mv	s8,s4
    5658:	00160f13          	add	t5,a2,1
    565c:	c58ff06f          	j	4ab4 <_vfiprintf_r+0x254>
    5660:	380f8863          	beqz	t6,59f0 <_vfiprintf_r+0x1190>
    5664:	04410793          	add	a5,sp,68
    5668:	06f12623          	sw	a5,108(sp)
    566c:	00200793          	li	a5,2
    5670:	06f12823          	sw	a5,112(sp)
    5674:	00100f13          	li	t5,1
    5678:	000a0c13          	mv	s8,s4
    567c:	000f0613          	mv	a2,t5
    5680:	008c0c13          	add	s8,s8,8
    5684:	001f0f13          	add	t5,t5,1
    5688:	cacff06f          	j	4b34 <_vfiprintf_r+0x2d4>
    568c:	00200693          	li	a3,2
    5690:	00050e13          	mv	t3,a0
    5694:	aa0684e3          	beqz	a3,513c <_vfiprintf_r+0x8dc>
    5698:	01412503          	lw	a0,20(sp)
    569c:	11010813          	add	a6,sp,272
    56a0:	00f7f693          	and	a3,a5,15
    56a4:	00d506b3          	add	a3,a0,a3
    56a8:	0006c603          	lbu	a2,0(a3)
    56ac:	0047d793          	srl	a5,a5,0x4
    56b0:	01c59693          	sll	a3,a1,0x1c
    56b4:	00f6e7b3          	or	a5,a3,a5
    56b8:	0045d593          	srl	a1,a1,0x4
    56bc:	fec80fa3          	sb	a2,-1(a6)
    56c0:	00b7e6b3          	or	a3,a5,a1
    56c4:	fff80813          	add	a6,a6,-1
    56c8:	fc069ce3          	bnez	a3,56a0 <_vfiprintf_r+0xe40>
    56cc:	11010793          	add	a5,sp,272
    56d0:	41078d33          	sub	s10,a5,a6
    56d4:	00070e93          	mv	t4,a4
    56d8:	c9a754e3          	bge	a4,s10,5360 <_vfiprintf_r+0xb00>
    56dc:	000d0e93          	mv	t4,s10
    56e0:	c81ff06f          	j	5360 <_vfiprintf_r+0xb00>
    56e4:	01000513          	li	a0,16
    56e8:	01b554e3          	bge	a0,s11,5ef0 <_vfiprintf_r+0x1690>
    56ec:	000a8693          	mv	a3,s5
    56f0:	0000a317          	auipc	t1,0xa
    56f4:	97430313          	add	t1,t1,-1676 # f064 <blanks.1>
    56f8:	02e12c23          	sw	a4,56(sp)
    56fc:	000d8a93          	mv	s5,s11
    5700:	000c0713          	mv	a4,s8
    5704:	01000f13          	li	t5,16
    5708:	00700393          	li	t2,7
    570c:	01c12c23          	sw	t3,24(sp)
    5710:	01f12e23          	sw	t6,28(sp)
    5714:	02512023          	sw	t0,32(sp)
    5718:	03012223          	sw	a6,36(sp)
    571c:	03112423          	sw	a7,40(sp)
    5720:	03d12e23          	sw	t4,60(sp)
    5724:	00030c13          	mv	s8,t1
    5728:	00068d93          	mv	s11,a3
    572c:	01c0006f          	j	5748 <_vfiprintf_r+0xee8>
    5730:	00260513          	add	a0,a2,2
    5734:	00870713          	add	a4,a4,8
    5738:	00058613          	mv	a2,a1
    573c:	ff0a8a93          	add	s5,s5,-16
    5740:	055f5c63          	bge	t5,s5,5798 <_vfiprintf_r+0xf38>
    5744:	00160593          	add	a1,a2,1
    5748:	01078793          	add	a5,a5,16
    574c:	01872023          	sw	s8,0(a4)
    5750:	01e72223          	sw	t5,4(a4)
    5754:	06f12423          	sw	a5,104(sp)
    5758:	06b12223          	sw	a1,100(sp)
    575c:	fcb3dae3          	bge	t2,a1,5730 <_vfiprintf_r+0xed0>
    5760:	08078a63          	beqz	a5,57f4 <_vfiprintf_r+0xf94>
    5764:	06010613          	add	a2,sp,96
    5768:	00098593          	mv	a1,s3
    576c:	00040513          	mv	a0,s0
    5770:	fb5fe0ef          	jal	4724 <__sprint_r.part.0>
    5774:	da051e63          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5778:	06412603          	lw	a2,100(sp)
    577c:	01000f13          	li	t5,16
    5780:	ff0a8a93          	add	s5,s5,-16
    5784:	06812783          	lw	a5,104(sp)
    5788:	000a0713          	mv	a4,s4
    578c:	00160513          	add	a0,a2,1
    5790:	00700393          	li	t2,7
    5794:	fb5f48e3          	blt	t5,s5,5744 <_vfiprintf_r+0xee4>
    5798:	000c0313          	mv	t1,s8
    579c:	01812e03          	lw	t3,24(sp)
    57a0:	00070c13          	mv	s8,a4
    57a4:	01c12f83          	lw	t6,28(sp)
    57a8:	02012283          	lw	t0,32(sp)
    57ac:	02412803          	lw	a6,36(sp)
    57b0:	02812883          	lw	a7,40(sp)
    57b4:	03c12e83          	lw	t4,60(sp)
    57b8:	03812703          	lw	a4,56(sp)
    57bc:	000d8693          	mv	a3,s11
    57c0:	000a8d93          	mv	s11,s5
    57c4:	00068a93          	mv	s5,a3
    57c8:	01b787b3          	add	a5,a5,s11
    57cc:	006c2023          	sw	t1,0(s8)
    57d0:	01bc2223          	sw	s11,4(s8)
    57d4:	06f12423          	sw	a5,104(sp)
    57d8:	06a12223          	sw	a0,100(sp)
    57dc:	00700613          	li	a2,7
    57e0:	12a64063          	blt	a2,a0,5900 <_vfiprintf_r+0x10a0>
    57e4:	008c0c13          	add	s8,s8,8
    57e8:	00150f13          	add	t5,a0,1
    57ec:	00050613          	mv	a2,a0
    57f0:	a8cff06f          	j	4a7c <_vfiprintf_r+0x21c>
    57f4:	00000613          	li	a2,0
    57f8:	00100513          	li	a0,1
    57fc:	000a0713          	mv	a4,s4
    5800:	f3dff06f          	j	573c <_vfiprintf_r+0xedc>
    5804:	01d8d463          	bge	a7,t4,580c <_vfiprintf_r+0xfac>
    5808:	000e8893          	mv	a7,t4
    580c:	00c12783          	lw	a5,12(sp)
    5810:	011787b3          	add	a5,a5,a7
    5814:	00f12623          	sw	a5,12(sp)
    5818:	ba8ff06f          	j	4bc0 <_vfiprintf_r+0x360>
    581c:	b4078ae3          	beqz	a5,5370 <_vfiprintf_r+0xb10>
    5820:	06010613          	add	a2,sp,96
    5824:	00098593          	mv	a1,s3
    5828:	00040513          	mv	a0,s0
    582c:	03d12223          	sw	t4,36(sp)
    5830:	03112023          	sw	a7,32(sp)
    5834:	01012e23          	sw	a6,28(sp)
    5838:	01c12c23          	sw	t3,24(sp)
    583c:	ee9fe0ef          	jal	4724 <__sprint_r.part.0>
    5840:	ce051863          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5844:	06412f03          	lw	t5,100(sp)
    5848:	06812783          	lw	a5,104(sp)
    584c:	02412e83          	lw	t4,36(sp)
    5850:	02012883          	lw	a7,32(sp)
    5854:	01c12803          	lw	a6,28(sp)
    5858:	01812e03          	lw	t3,24(sp)
    585c:	000a0c13          	mv	s8,s4
    5860:	001f0f13          	add	t5,t5,1
    5864:	ae0ff06f          	j	4b44 <_vfiprintf_r+0x2e4>
    5868:	06012223          	sw	zero,100(sp)
    586c:	000a0c13          	mv	s8,s4
    5870:	c84ff06f          	j	4cf4 <_vfiprintf_r+0x494>
    5874:	01067693          	and	a3,a2,16
    5878:	000aa783          	lw	a5,0(s5)
    587c:	004a8a93          	add	s5,s5,4
    5880:	12069c63          	bnez	a3,59b8 <_vfiprintf_r+0x1158>
    5884:	04067693          	and	a3,a2,64
    5888:	12068463          	beqz	a3,59b0 <_vfiprintf_r+0x1150>
    588c:	01079d93          	sll	s11,a5,0x10
    5890:	010ddd93          	srl	s11,s11,0x10
    5894:	00000d13          	li	s10,0
    5898:	ff4ff06f          	j	508c <_vfiprintf_r+0x82c>
    589c:	0106f613          	and	a2,a3,16
    58a0:	000aa783          	lw	a5,0(s5)
    58a4:	004a8a93          	add	s5,s5,4
    58a8:	12061263          	bnez	a2,59cc <_vfiprintf_r+0x116c>
    58ac:	0406f613          	and	a2,a3,64
    58b0:	10060a63          	beqz	a2,59c4 <_vfiprintf_r+0x1164>
    58b4:	01079793          	sll	a5,a5,0x10
    58b8:	0107d793          	srl	a5,a5,0x10
    58bc:	00000593          	li	a1,0
    58c0:	83dff06f          	j	50fc <_vfiprintf_r+0x89c>
    58c4:	010e7693          	and	a3,t3,16
    58c8:	000aa783          	lw	a5,0(s5)
    58cc:	004a8a93          	add	s5,s5,4
    58d0:	0c069863          	bnez	a3,59a0 <_vfiprintf_r+0x1140>
    58d4:	040e7693          	and	a3,t3,64
    58d8:	0c068063          	beqz	a3,5998 <_vfiprintf_r+0x1138>
    58dc:	01079d93          	sll	s11,a5,0x10
    58e0:	410ddd93          	sra	s11,s11,0x10
    58e4:	41fddd13          	sra	s10,s11,0x1f
    58e8:	000d0693          	mv	a3,s10
    58ec:	f24ff06f          	j	5010 <_vfiprintf_r+0x7b0>
    58f0:	00100f13          	li	t5,1
    58f4:	00000613          	li	a2,0
    58f8:	000a0c13          	mv	s8,s4
    58fc:	a38ff06f          	j	4b34 <_vfiprintf_r+0x2d4>
    5900:	1a078463          	beqz	a5,5aa8 <_vfiprintf_r+0x1248>
    5904:	06010613          	add	a2,sp,96
    5908:	00098593          	mv	a1,s3
    590c:	00040513          	mv	a0,s0
    5910:	03d12e23          	sw	t4,60(sp)
    5914:	02e12c23          	sw	a4,56(sp)
    5918:	03112423          	sw	a7,40(sp)
    591c:	03012223          	sw	a6,36(sp)
    5920:	02512023          	sw	t0,32(sp)
    5924:	01f12e23          	sw	t6,28(sp)
    5928:	01c12c23          	sw	t3,24(sp)
    592c:	df9fe0ef          	jal	4724 <__sprint_r.part.0>
    5930:	c0051063          	bnez	a0,4d30 <_vfiprintf_r+0x4d0>
    5934:	06412603          	lw	a2,100(sp)
    5938:	06812783          	lw	a5,104(sp)
    593c:	03c12e83          	lw	t4,60(sp)
    5940:	03812703          	lw	a4,56(sp)
    5944:	02812883          	lw	a7,40(sp)
    5948:	02412803          	lw	a6,36(sp)
    594c:	02012283          	lw	t0,32(sp)
    5950:	01c12f83          	lw	t6,28(sp)
    5954:	01812e03          	lw	t3,24(sp)
    5958:	000a0c13          	mv	s8,s4
    595c:	00160f13          	add	t5,a2,1
    5960:	91cff06f          	j	4a7c <_vfiprintf_r+0x21c>
    5964:	000d8e13          	mv	t3,s11
    5968:	e88ff06f          	j	4ff0 <_vfiprintf_r+0x790>
    596c:	00000e93          	li	t4,0
    5970:	11010813          	add	a6,sp,272
    5974:	9edff06f          	j	5360 <_vfiprintf_r+0xb00>
    5978:	0589a503          	lw	a0,88(s3)
    597c:	8b4fb0ef          	jal	a30 <__retarget_lock_acquire_recursive>
    5980:	00c99783          	lh	a5,12(s3)
    5984:	f41fe06f          	j	48c4 <_vfiprintf_r+0x64>
    5988:	008c0c13          	add	s8,s8,8
    598c:	00150f13          	add	t5,a0,1
    5990:	00050613          	mv	a2,a0
    5994:	9a8ff06f          	j	4b3c <_vfiprintf_r+0x2dc>
    5998:	200e7693          	and	a3,t3,512
    599c:	50069463          	bnez	a3,5ea4 <_vfiprintf_r+0x1644>
    59a0:	41f7dd13          	sra	s10,a5,0x1f
    59a4:	00078d93          	mv	s11,a5
    59a8:	000d0693          	mv	a3,s10
    59ac:	e64ff06f          	j	5010 <_vfiprintf_r+0x7b0>
    59b0:	20067693          	and	a3,a2,512
    59b4:	4c069663          	bnez	a3,5e80 <_vfiprintf_r+0x1620>
    59b8:	00078d93          	mv	s11,a5
    59bc:	00000d13          	li	s10,0
    59c0:	eccff06f          	j	508c <_vfiprintf_r+0x82c>
    59c4:	2006f613          	and	a2,a3,512
    59c8:	4c061863          	bnez	a2,5e98 <_vfiprintf_r+0x1638>
    59cc:	00000593          	li	a1,0
    59d0:	f2cff06f          	j	50fc <_vfiprintf_r+0x89c>
    59d4:	00c12683          	lw	a3,12(sp)
    59d8:	000aa783          	lw	a5,0(s5)
    59dc:	004a8a93          	add	s5,s5,4
    59e0:	41f6d713          	sra	a4,a3,0x1f
    59e4:	00d7a023          	sw	a3,0(a5)
    59e8:	00e7a223          	sw	a4,4(a5)
    59ec:	f8dfe06f          	j	4978 <_vfiprintf_r+0x118>
    59f0:	00000613          	li	a2,0
    59f4:	00100f13          	li	t5,1
    59f8:	000a0c13          	mv	s8,s4
    59fc:	938ff06f          	j	4b34 <_vfiprintf_r+0x2d4>
    5a00:	000aa783          	lw	a5,0(s5)
    5a04:	00100e93          	li	t4,1
    5a08:	00100d13          	li	s10,1
    5a0c:	0af10623          	sb	a5,172(sp)
    5a10:	0ac10593          	add	a1,sp,172
    5a14:	db8ff06f          	j	4fcc <_vfiprintf_r+0x76c>
    5a18:	000d0e93          	mv	t4,s10
    5a1c:	00050813          	mv	a6,a0
    5a20:	941ff06f          	j	5360 <_vfiprintf_r+0xb00>
    5a24:	fff00713          	li	a4,-1
    5a28:	00058c93          	mv	s9,a1
    5a2c:	fb9fe06f          	j	49e4 <_vfiprintf_r+0x184>
    5a30:	000d8613          	mv	a2,s11
    5a34:	e3cff06f          	j	5070 <_vfiprintf_r+0x810>
    5a38:	00009797          	auipc	a5,0x9
    5a3c:	fbc78793          	add	a5,a5,-68 # e9f4 <__fini_array_end+0xb0>
    5a40:	000d8e13          	mv	t3,s11
    5a44:	00f12a23          	sw	a5,20(sp)
    5a48:	020e7793          	and	a5,t3,32
    5a4c:	1c078c63          	beqz	a5,5c24 <_vfiprintf_r+0x13c4>
    5a50:	007a8a93          	add	s5,s5,7
    5a54:	ff8afa93          	and	s5,s5,-8
    5a58:	000aa783          	lw	a5,0(s5)
    5a5c:	004aa583          	lw	a1,4(s5)
    5a60:	008a8a93          	add	s5,s5,8
    5a64:	001e7613          	and	a2,t3,1
    5a68:	00060e63          	beqz	a2,5a84 <_vfiprintf_r+0x1224>
    5a6c:	00b7e633          	or	a2,a5,a1
    5a70:	00060a63          	beqz	a2,5a84 <_vfiprintf_r+0x1224>
    5a74:	03000613          	li	a2,48
    5a78:	04c10223          	sb	a2,68(sp)
    5a7c:	04d102a3          	sb	a3,69(sp)
    5a80:	002e6e13          	or	t3,t3,2
    5a84:	bffe7e13          	and	t3,t3,-1025
    5a88:	f3cff06f          	j	51c4 <_vfiprintf_r+0x964>
    5a8c:	000d8693          	mv	a3,s11
    5a90:	e50ff06f          	j	50e0 <_vfiprintf_r+0x880>
    5a94:	00009797          	auipc	a5,0x9
    5a98:	f4c78793          	add	a5,a5,-180 # e9e0 <__fini_array_end+0x9c>
    5a9c:	000d8e13          	mv	t3,s11
    5aa0:	00f12a23          	sw	a5,20(sp)
    5aa4:	fa5ff06f          	j	5a48 <_vfiprintf_r+0x11e8>
    5aa8:	04314603          	lbu	a2,67(sp)
    5aac:	3a060a63          	beqz	a2,5e60 <_vfiprintf_r+0x1600>
    5ab0:	04310793          	add	a5,sp,67
    5ab4:	06f12623          	sw	a5,108(sp)
    5ab8:	00100793          	li	a5,1
    5abc:	06f12823          	sw	a5,112(sp)
    5ac0:	00100f13          	li	t5,1
    5ac4:	000a0c13          	mv	s8,s4
    5ac8:	fe1fe06f          	j	4aa8 <_vfiprintf_r+0x248>
    5acc:	00800613          	li	a2,8
    5ad0:	00000593          	li	a1,0
    5ad4:	05810513          	add	a0,sp,88
    5ad8:	02e12023          	sw	a4,32(sp)
    5adc:	01112e23          	sw	a7,28(sp)
    5ae0:	01c12c23          	sw	t3,24(sp)
    5ae4:	05012623          	sw	a6,76(sp)
    5ae8:	01012823          	sw	a6,16(sp)
    5aec:	f4dfa0ef          	jal	a38 <memset>
    5af0:	02012703          	lw	a4,32(sp)
    5af4:	01012803          	lw	a6,16(sp)
    5af8:	01812e03          	lw	t3,24(sp)
    5afc:	01c12883          	lw	a7,28(sp)
    5b00:	2a074463          	bltz	a4,5da8 <_vfiprintf_r+0x1548>
    5b04:	00000d93          	li	s11,0
    5b08:	00000d13          	li	s10,0
    5b0c:	01812823          	sw	s8,16(sp)
    5b10:	01012e23          	sw	a6,28(sp)
    5b14:	000d8c13          	mv	s8,s11
    5b18:	03112023          	sw	a7,32(sp)
    5b1c:	000c8d93          	mv	s11,s9
    5b20:	000a8c93          	mv	s9,s5
    5b24:	000d0a93          	mv	s5,s10
    5b28:	00098d13          	mv	s10,s3
    5b2c:	00070993          	mv	s3,a4
    5b30:	0300006f          	j	5b60 <_vfiprintf_r+0x1300>
    5b34:	05810693          	add	a3,sp,88
    5b38:	0ac10593          	add	a1,sp,172
    5b3c:	00040513          	mv	a0,s0
    5b40:	2f5040ef          	jal	a634 <_wcrtomb_r>
    5b44:	fff00793          	li	a5,-1
    5b48:	48f50063          	beq	a0,a5,5fc8 <_vfiprintf_r+0x1768>
    5b4c:	00aa87b3          	add	a5,s5,a0
    5b50:	02f9c063          	blt	s3,a5,5b70 <_vfiprintf_r+0x1310>
    5b54:	004c0c13          	add	s8,s8,4
    5b58:	45378463          	beq	a5,s3,5fa0 <_vfiprintf_r+0x1740>
    5b5c:	00078a93          	mv	s5,a5
    5b60:	04c12783          	lw	a5,76(sp)
    5b64:	018787b3          	add	a5,a5,s8
    5b68:	0007a603          	lw	a2,0(a5)
    5b6c:	fc0614e3          	bnez	a2,5b34 <_vfiprintf_r+0x12d4>
    5b70:	01012c03          	lw	s8,16(sp)
    5b74:	01812e03          	lw	t3,24(sp)
    5b78:	01c12803          	lw	a6,28(sp)
    5b7c:	02012883          	lw	a7,32(sp)
    5b80:	000d0993          	mv	s3,s10
    5b84:	000a8d13          	mv	s10,s5
    5b88:	000c8a93          	mv	s5,s9
    5b8c:	000d8c93          	mv	s9,s11
    5b90:	280d0e63          	beqz	s10,5e2c <_vfiprintf_r+0x15cc>
    5b94:	06300793          	li	a5,99
    5b98:	33a7d463          	bge	a5,s10,5ec0 <_vfiprintf_r+0x1660>
    5b9c:	001d0593          	add	a1,s10,1
    5ba0:	00040513          	mv	a0,s0
    5ba4:	01112c23          	sw	a7,24(sp)
    5ba8:	01c12823          	sw	t3,16(sp)
    5bac:	de8fb0ef          	jal	1194 <_malloc_r>
    5bb0:	01012e03          	lw	t3,16(sp)
    5bb4:	01812883          	lw	a7,24(sp)
    5bb8:	00050813          	mv	a6,a0
    5bbc:	42050063          	beqz	a0,5fdc <_vfiprintf_r+0x177c>
    5bc0:	00a12823          	sw	a0,16(sp)
    5bc4:	00800613          	li	a2,8
    5bc8:	00000593          	li	a1,0
    5bcc:	05810513          	add	a0,sp,88
    5bd0:	03112023          	sw	a7,32(sp)
    5bd4:	01c12e23          	sw	t3,28(sp)
    5bd8:	01012c23          	sw	a6,24(sp)
    5bdc:	e5dfa0ef          	jal	a38 <memset>
    5be0:	01812803          	lw	a6,24(sp)
    5be4:	05810713          	add	a4,sp,88
    5be8:	000d0693          	mv	a3,s10
    5bec:	00080593          	mv	a1,a6
    5bf0:	04c10613          	add	a2,sp,76
    5bf4:	00040513          	mv	a0,s0
    5bf8:	2c9040ef          	jal	a6c0 <_wcsrtombs_r>
    5bfc:	01812803          	lw	a6,24(sp)
    5c00:	01c12e03          	lw	t3,28(sp)
    5c04:	02012883          	lw	a7,32(sp)
    5c08:	40ad1063          	bne	s10,a0,6008 <_vfiprintf_r+0x17a8>
    5c0c:	fffd4e93          	not	t4,s10
    5c10:	01a807b3          	add	a5,a6,s10
    5c14:	41fede93          	sra	t4,t4,0x1f
    5c18:	00078023          	sb	zero,0(a5)
    5c1c:	01dd7eb3          	and	t4,s10,t4
    5c20:	2140006f          	j	5e34 <_vfiprintf_r+0x15d4>
    5c24:	010e7613          	and	a2,t3,16
    5c28:	000aa783          	lw	a5,0(s5)
    5c2c:	004a8a93          	add	s5,s5,4
    5c30:	02061263          	bnez	a2,5c54 <_vfiprintf_r+0x13f4>
    5c34:	040e7613          	and	a2,t3,64
    5c38:	00060a63          	beqz	a2,5c4c <_vfiprintf_r+0x13ec>
    5c3c:	01079793          	sll	a5,a5,0x10
    5c40:	0107d793          	srl	a5,a5,0x10
    5c44:	00000593          	li	a1,0
    5c48:	e1dff06f          	j	5a64 <_vfiprintf_r+0x1204>
    5c4c:	200e7613          	and	a2,t3,512
    5c50:	22061e63          	bnez	a2,5e8c <_vfiprintf_r+0x162c>
    5c54:	00000593          	li	a1,0
    5c58:	e0dff06f          	j	5a64 <_vfiprintf_r+0x1204>
    5c5c:	400e7793          	and	a5,t3,1024
    5c60:	00000693          	li	a3,0
    5c64:	11010e93          	add	t4,sp,272
    5c68:	01812823          	sw	s8,16(sp)
    5c6c:	02812223          	sw	s0,36(sp)
    5c70:	03912c23          	sw	s9,56(sp)
    5c74:	03512e23          	sw	s5,60(sp)
    5c78:	02c12c83          	lw	s9,44(sp)
    5c7c:	01c12c23          	sw	t3,24(sp)
    5c80:	01112e23          	sw	a7,28(sp)
    5c84:	02e12023          	sw	a4,32(sp)
    5c88:	00078c13          	mv	s8,a5
    5c8c:	00068413          	mv	s0,a3
    5c90:	03312423          	sw	s3,40(sp)
    5c94:	000e8a93          	mv	s5,t4
    5c98:	0280006f          	j	5cc0 <_vfiprintf_r+0x1460>
    5c9c:	00a00613          	li	a2,10
    5ca0:	00000693          	li	a3,0
    5ca4:	000d8513          	mv	a0,s11
    5ca8:	000d0593          	mv	a1,s10
    5cac:	364050ef          	jal	b010 <__udivdi3>
    5cb0:	220d0a63          	beqz	s10,5ee4 <_vfiprintf_r+0x1684>
    5cb4:	00050d93          	mv	s11,a0
    5cb8:	00058d13          	mv	s10,a1
    5cbc:	00098a93          	mv	s5,s3
    5cc0:	00a00613          	li	a2,10
    5cc4:	00000693          	li	a3,0
    5cc8:	000d8513          	mv	a0,s11
    5ccc:	000d0593          	mv	a1,s10
    5cd0:	1ed050ef          	jal	b6bc <__umoddi3>
    5cd4:	03050513          	add	a0,a0,48
    5cd8:	feaa8fa3          	sb	a0,-1(s5)
    5cdc:	fffa8993          	add	s3,s5,-1
    5ce0:	00140413          	add	s0,s0,1
    5ce4:	fa0c0ce3          	beqz	s8,5c9c <_vfiprintf_r+0x143c>
    5ce8:	000cc783          	lbu	a5,0(s9)
    5cec:	fa8798e3          	bne	a5,s0,5c9c <_vfiprintf_r+0x143c>
    5cf0:	0ff00793          	li	a5,255
    5cf4:	faf404e3          	beq	s0,a5,5c9c <_vfiprintf_r+0x143c>
    5cf8:	0e0d1a63          	bnez	s10,5dec <_vfiprintf_r+0x158c>
    5cfc:	00900793          	li	a5,9
    5d00:	0fb7e663          	bltu	a5,s11,5dec <_vfiprintf_r+0x158c>
    5d04:	00098813          	mv	a6,s3
    5d08:	03912623          	sw	s9,44(sp)
    5d0c:	01012c03          	lw	s8,16(sp)
    5d10:	01812e03          	lw	t3,24(sp)
    5d14:	01c12883          	lw	a7,28(sp)
    5d18:	02012703          	lw	a4,32(sp)
    5d1c:	02412403          	lw	s0,36(sp)
    5d20:	02812983          	lw	s3,40(sp)
    5d24:	03812c83          	lw	s9,56(sp)
    5d28:	03c12a83          	lw	s5,60(sp)
    5d2c:	9a1ff06f          	j	56cc <_vfiprintf_r+0xe6c>
    5d30:	00068e13          	mv	t3,a3
    5d34:	00000693          	li	a3,0
    5d38:	c0068263          	beqz	a3,513c <_vfiprintf_r+0x8dc>
    5d3c:	95dff06f          	j	5698 <_vfiprintf_r+0xe38>
    5d40:	00040513          	mv	a0,s0
    5d44:	115000ef          	jal	6658 <__sinit>
    5d48:	b61fe06f          	j	48a8 <_vfiprintf_r+0x48>
    5d4c:	001cc683          	lbu	a3,1(s9)
    5d50:	200ded93          	or	s11,s11,512
    5d54:	001c8c93          	add	s9,s9,1
    5d58:	c89fe06f          	j	49e0 <_vfiprintf_r+0x180>
    5d5c:	001cc683          	lbu	a3,1(s9)
    5d60:	020ded93          	or	s11,s11,32
    5d64:	001c8c93          	add	s9,s9,1
    5d68:	c79fe06f          	j	49e0 <_vfiprintf_r+0x180>
    5d6c:	000aa783          	lw	a5,0(s5)
    5d70:	00c12703          	lw	a4,12(sp)
    5d74:	004a8a93          	add	s5,s5,4
    5d78:	00e7a023          	sw	a4,0(a5)
    5d7c:	bfdfe06f          	j	4978 <_vfiprintf_r+0x118>
    5d80:	00600793          	li	a5,6
    5d84:	00070d13          	mv	s10,a4
    5d88:	0ce7e863          	bltu	a5,a4,5e58 <_vfiprintf_r+0x15f8>
    5d8c:	000d0e93          	mv	t4,s10
    5d90:	00009817          	auipc	a6,0x9
    5d94:	c7880813          	add	a6,a6,-904 # ea08 <__fini_array_end+0xc4>
    5d98:	cb9fe06f          	j	4a50 <_vfiprintf_r+0x1f0>
    5d9c:	00000793          	li	a5,0
    5da0:	00000593          	li	a1,0
    5da4:	8f5ff06f          	j	5698 <_vfiprintf_r+0xe38>
    5da8:	05810713          	add	a4,sp,88
    5dac:	00000693          	li	a3,0
    5db0:	04c10613          	add	a2,sp,76
    5db4:	00000593          	li	a1,0
    5db8:	00040513          	mv	a0,s0
    5dbc:	01112e23          	sw	a7,28(sp)
    5dc0:	01012c23          	sw	a6,24(sp)
    5dc4:	01c12823          	sw	t3,16(sp)
    5dc8:	0f9040ef          	jal	a6c0 <_wcsrtombs_r>
    5dcc:	fff00793          	li	a5,-1
    5dd0:	01012e03          	lw	t3,16(sp)
    5dd4:	01812803          	lw	a6,24(sp)
    5dd8:	01c12883          	lw	a7,28(sp)
    5ddc:	00050d13          	mv	s10,a0
    5de0:	1ef50e63          	beq	a0,a5,5fdc <_vfiprintf_r+0x177c>
    5de4:	05012623          	sw	a6,76(sp)
    5de8:	da9ff06f          	j	5b90 <_vfiprintf_r+0x1330>
    5dec:	03012783          	lw	a5,48(sp)
    5df0:	03412583          	lw	a1,52(sp)
    5df4:	00000413          	li	s0,0
    5df8:	40f989b3          	sub	s3,s3,a5
    5dfc:	00078613          	mv	a2,a5
    5e00:	00098513          	mv	a0,s3
    5e04:	6c8010ef          	jal	74cc <strncpy>
    5e08:	001cc783          	lbu	a5,1(s9)
    5e0c:	00a00613          	li	a2,10
    5e10:	00000693          	li	a3,0
    5e14:	00f037b3          	snez	a5,a5
    5e18:	000d8513          	mv	a0,s11
    5e1c:	000d0593          	mv	a1,s10
    5e20:	00fc8cb3          	add	s9,s9,a5
    5e24:	1ec050ef          	jal	b010 <__udivdi3>
    5e28:	e8dff06f          	j	5cb4 <_vfiprintf_r+0x1454>
    5e2c:	00000e93          	li	t4,0
    5e30:	00012823          	sw	zero,16(sp)
    5e34:	04314783          	lbu	a5,67(sp)
    5e38:	00000713          	li	a4,0
    5e3c:	00000f93          	li	t6,0
    5e40:	a0079063          	bnez	a5,5040 <_vfiprintf_r+0x7e0>
    5e44:	c19fe06f          	j	4a5c <_vfiprintf_r+0x1fc>
    5e48:	00100f13          	li	t5,1
    5e4c:	00000613          	li	a2,0
    5e50:	000a0c13          	mv	s8,s4
    5e54:	ce9fe06f          	j	4b3c <_vfiprintf_r+0x2dc>
    5e58:	00600d13          	li	s10,6
    5e5c:	f31ff06f          	j	5d8c <_vfiprintf_r+0x152c>
    5e60:	00100f13          	li	t5,1
    5e64:	000a0c13          	mv	s8,s4
    5e68:	c4dfe06f          	j	4ab4 <_vfiprintf_r+0x254>
    5e6c:	000aa783          	lw	a5,0(s5)
    5e70:	00c12703          	lw	a4,12(sp)
    5e74:	004a8a93          	add	s5,s5,4
    5e78:	00e79023          	sh	a4,0(a5)
    5e7c:	afdfe06f          	j	4978 <_vfiprintf_r+0x118>
    5e80:	0ff7fd93          	zext.b	s11,a5
    5e84:	00000d13          	li	s10,0
    5e88:	a04ff06f          	j	508c <_vfiprintf_r+0x82c>
    5e8c:	0ff7f793          	zext.b	a5,a5
    5e90:	00000593          	li	a1,0
    5e94:	bd1ff06f          	j	5a64 <_vfiprintf_r+0x1204>
    5e98:	0ff7f793          	zext.b	a5,a5
    5e9c:	00000593          	li	a1,0
    5ea0:	a5cff06f          	j	50fc <_vfiprintf_r+0x89c>
    5ea4:	01879d93          	sll	s11,a5,0x18
    5ea8:	418ddd93          	sra	s11,s11,0x18
    5eac:	41fddd13          	sra	s10,s11,0x1f
    5eb0:	000d0693          	mv	a3,s10
    5eb4:	95cff06f          	j	5010 <_vfiprintf_r+0x7b0>
    5eb8:	03000793          	li	a5,48
    5ebc:	c8cff06f          	j	5348 <_vfiprintf_r+0xae8>
    5ec0:	00012823          	sw	zero,16(sp)
    5ec4:	0ac10813          	add	a6,sp,172
    5ec8:	cfdff06f          	j	5bc4 <_vfiprintf_r+0x1364>
    5ecc:	0589a503          	lw	a0,88(s3)
    5ed0:	b65fa0ef          	jal	a34 <__retarget_lock_release_recursive>
    5ed4:	d51fe06f          	j	4c24 <_vfiprintf_r+0x3c4>
    5ed8:	00070e93          	mv	t4,a4
    5edc:	00070d13          	mv	s10,a4
    5ee0:	f55ff06f          	j	5e34 <_vfiprintf_r+0x15d4>
    5ee4:	00900793          	li	a5,9
    5ee8:	ddb7e6e3          	bltu	a5,s11,5cb4 <_vfiprintf_r+0x1454>
    5eec:	e19ff06f          	j	5d04 <_vfiprintf_r+0x14a4>
    5ef0:	00058513          	mv	a0,a1
    5ef4:	00009317          	auipc	t1,0x9
    5ef8:	17030313          	add	t1,t1,368 # f064 <blanks.1>
    5efc:	8cdff06f          	j	57c8 <_vfiprintf_r+0xf68>
    5f00:	00080513          	mv	a0,a6
    5f04:	03112023          	sw	a7,32(sp)
    5f08:	01012c23          	sw	a6,24(sp)
    5f0c:	01b12e23          	sw	s11,28(sp)
    5f10:	da9fa0ef          	jal	cb8 <strlen>
    5f14:	fff54e93          	not	t4,a0
    5f18:	41fede93          	sra	t4,t4,0x1f
    5f1c:	01812803          	lw	a6,24(sp)
    5f20:	01c12e03          	lw	t3,28(sp)
    5f24:	02012883          	lw	a7,32(sp)
    5f28:	00050d13          	mv	s10,a0
    5f2c:	01d57eb3          	and	t4,a0,t4
    5f30:	00012823          	sw	zero,16(sp)
    5f34:	f01ff06f          	j	5e34 <_vfiprintf_r+0x15d4>
    5f38:	06010613          	add	a2,sp,96
    5f3c:	00098593          	mv	a1,s3
    5f40:	00040513          	mv	a0,s0
    5f44:	fe0fe0ef          	jal	4724 <__sprint_r.part.0>
    5f48:	00051463          	bnez	a0,5f50 <_vfiprintf_r+0x16f0>
    5f4c:	dc5fe06f          	j	4d10 <_vfiprintf_r+0x4b0>
    5f50:	df5fe06f          	j	4d44 <_vfiprintf_r+0x4e4>
    5f54:	00168613          	add	a2,a3,1
    5f58:	00009317          	auipc	t1,0x9
    5f5c:	10c30313          	add	t1,t1,268 # f064 <blanks.1>
    5f60:	f19fe06f          	j	4e78 <_vfiprintf_r+0x618>
    5f64:	000f0513          	mv	a0,t5
    5f68:	00009f97          	auipc	t6,0x9
    5f6c:	0ecf8f93          	add	t6,t6,236 # f054 <zeroes.0>
    5f70:	d10ff06f          	j	5480 <_vfiprintf_r+0xc20>
    5f74:	0649a783          	lw	a5,100(s3)
    5f78:	0017f793          	and	a5,a5,1
    5f7c:	00079c63          	bnez	a5,5f94 <_vfiprintf_r+0x1734>
    5f80:	00c9d783          	lhu	a5,12(s3)
    5f84:	2007f793          	and	a5,a5,512
    5f88:	00079663          	bnez	a5,5f94 <_vfiprintf_r+0x1734>
    5f8c:	0589a503          	lw	a0,88(s3)
    5f90:	aa5fa0ef          	jal	a34 <__retarget_lock_release_recursive>
    5f94:	fff00793          	li	a5,-1
    5f98:	00f12623          	sw	a5,12(sp)
    5f9c:	de5fe06f          	j	4d80 <_vfiprintf_r+0x520>
    5fa0:	00098713          	mv	a4,s3
    5fa4:	000c8a93          	mv	s5,s9
    5fa8:	000d0993          	mv	s3,s10
    5fac:	01012c03          	lw	s8,16(sp)
    5fb0:	01812e03          	lw	t3,24(sp)
    5fb4:	01c12803          	lw	a6,28(sp)
    5fb8:	02012883          	lw	a7,32(sp)
    5fbc:	000d8c93          	mv	s9,s11
    5fc0:	00070d13          	mv	s10,a4
    5fc4:	bcdff06f          	j	5b90 <_vfiprintf_r+0x1330>
    5fc8:	00cd1783          	lh	a5,12(s10)
    5fcc:	000d0993          	mv	s3,s10
    5fd0:	0407e793          	or	a5,a5,64
    5fd4:	00fd1623          	sh	a5,12(s10)
    5fd8:	d71fe06f          	j	4d48 <_vfiprintf_r+0x4e8>
    5fdc:	00c99783          	lh	a5,12(s3)
    5fe0:	0407e793          	or	a5,a5,64
    5fe4:	00f99623          	sh	a5,12(s3)
    5fe8:	d61fe06f          	j	4d48 <_vfiprintf_r+0x4e8>
    5fec:	000aa703          	lw	a4,0(s5)
    5ff0:	004a8a93          	add	s5,s5,4
    5ff4:	00075463          	bgez	a4,5ffc <_vfiprintf_r+0x179c>
    5ff8:	fff00713          	li	a4,-1
    5ffc:	001cc683          	lbu	a3,1(s9)
    6000:	00058c93          	mv	s9,a1
    6004:	9ddfe06f          	j	49e0 <_vfiprintf_r+0x180>
    6008:	00c9d783          	lhu	a5,12(s3)
    600c:	0407e793          	or	a5,a5,64
    6010:	00f99623          	sh	a5,12(s3)
    6014:	d1dfe06f          	j	4d30 <_vfiprintf_r+0x4d0>

00006018 <__sbprintf>:
    6018:	b7010113          	add	sp,sp,-1168
    601c:	00c59783          	lh	a5,12(a1)
    6020:	00e5d703          	lhu	a4,14(a1)
    6024:	48812423          	sw	s0,1160(sp)
    6028:	00058413          	mv	s0,a1
    602c:	000105b7          	lui	a1,0x10
    6030:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0xd4d>
    6034:	06442303          	lw	t1,100(s0)
    6038:	01c42883          	lw	a7,28(s0)
    603c:	02442803          	lw	a6,36(s0)
    6040:	01071713          	sll	a4,a4,0x10
    6044:	00b7f7b3          	and	a5,a5,a1
    6048:	00e7e7b3          	or	a5,a5,a4
    604c:	40000593          	li	a1,1024
    6050:	49212023          	sw	s2,1152(sp)
    6054:	00f12a23          	sw	a5,20(sp)
    6058:	00050913          	mv	s2,a0
    605c:	07010793          	add	a5,sp,112
    6060:	06010513          	add	a0,sp,96
    6064:	48112623          	sw	ra,1164(sp)
    6068:	48912223          	sw	s1,1156(sp)
    606c:	47312e23          	sw	s3,1148(sp)
    6070:	00060493          	mv	s1,a2
    6074:	00068993          	mv	s3,a3
    6078:	06612623          	sw	t1,108(sp)
    607c:	03112223          	sw	a7,36(sp)
    6080:	03012623          	sw	a6,44(sp)
    6084:	00f12423          	sw	a5,8(sp)
    6088:	00f12c23          	sw	a5,24(sp)
    608c:	00b12823          	sw	a1,16(sp)
    6090:	00b12e23          	sw	a1,28(sp)
    6094:	02012023          	sw	zero,32(sp)
    6098:	991fa0ef          	jal	a28 <__retarget_lock_init_recursive>
    609c:	00048613          	mv	a2,s1
    60a0:	00098693          	mv	a3,s3
    60a4:	00810593          	add	a1,sp,8
    60a8:	00090513          	mv	a0,s2
    60ac:	fb4fe0ef          	jal	4860 <_vfiprintf_r>
    60b0:	00050493          	mv	s1,a0
    60b4:	04055263          	bgez	a0,60f8 <__sbprintf+0xe0>
    60b8:	01415783          	lhu	a5,20(sp)
    60bc:	0407f793          	and	a5,a5,64
    60c0:	00078863          	beqz	a5,60d0 <__sbprintf+0xb8>
    60c4:	00c45783          	lhu	a5,12(s0)
    60c8:	0407e793          	or	a5,a5,64
    60cc:	00f41623          	sh	a5,12(s0)
    60d0:	06012503          	lw	a0,96(sp)
    60d4:	959fa0ef          	jal	a2c <__retarget_lock_close_recursive>
    60d8:	48c12083          	lw	ra,1164(sp)
    60dc:	48812403          	lw	s0,1160(sp)
    60e0:	48012903          	lw	s2,1152(sp)
    60e4:	47c12983          	lw	s3,1148(sp)
    60e8:	00048513          	mv	a0,s1
    60ec:	48412483          	lw	s1,1156(sp)
    60f0:	49010113          	add	sp,sp,1168
    60f4:	00008067          	ret
    60f8:	00810593          	add	a1,sp,8
    60fc:	00090513          	mv	a0,s2
    6100:	25c000ef          	jal	635c <_fflush_r>
    6104:	fa050ae3          	beqz	a0,60b8 <__sbprintf+0xa0>
    6108:	fff00493          	li	s1,-1
    610c:	fadff06f          	j	60b8 <__sbprintf+0xa0>

00006110 <__sflush_r>:
    6110:	00c59703          	lh	a4,12(a1)
    6114:	fe010113          	add	sp,sp,-32
    6118:	00812c23          	sw	s0,24(sp)
    611c:	01312623          	sw	s3,12(sp)
    6120:	00112e23          	sw	ra,28(sp)
    6124:	00877793          	and	a5,a4,8
    6128:	00058413          	mv	s0,a1
    612c:	00050993          	mv	s3,a0
    6130:	12079063          	bnez	a5,6250 <__sflush_r+0x140>
    6134:	000017b7          	lui	a5,0x1
    6138:	80078793          	add	a5,a5,-2048 # 800 <_sbrk+0x34>
    613c:	0045a683          	lw	a3,4(a1)
    6140:	00f767b3          	or	a5,a4,a5
    6144:	00f59623          	sh	a5,12(a1)
    6148:	18d05263          	blez	a3,62cc <__sflush_r+0x1bc>
    614c:	02842803          	lw	a6,40(s0)
    6150:	0e080463          	beqz	a6,6238 <__sflush_r+0x128>
    6154:	00912a23          	sw	s1,20(sp)
    6158:	01371693          	sll	a3,a4,0x13
    615c:	0009a483          	lw	s1,0(s3)
    6160:	0009a023          	sw	zero,0(s3)
    6164:	01c42583          	lw	a1,28(s0)
    6168:	1606ce63          	bltz	a3,62e4 <__sflush_r+0x1d4>
    616c:	00000613          	li	a2,0
    6170:	00100693          	li	a3,1
    6174:	00098513          	mv	a0,s3
    6178:	000800e7          	jalr	a6
    617c:	fff00793          	li	a5,-1
    6180:	00050613          	mv	a2,a0
    6184:	1af50463          	beq	a0,a5,632c <__sflush_r+0x21c>
    6188:	00c41783          	lh	a5,12(s0)
    618c:	02842803          	lw	a6,40(s0)
    6190:	01c42583          	lw	a1,28(s0)
    6194:	0047f793          	and	a5,a5,4
    6198:	00078e63          	beqz	a5,61b4 <__sflush_r+0xa4>
    619c:	00442703          	lw	a4,4(s0)
    61a0:	03042783          	lw	a5,48(s0)
    61a4:	40e60633          	sub	a2,a2,a4
    61a8:	00078663          	beqz	a5,61b4 <__sflush_r+0xa4>
    61ac:	03c42783          	lw	a5,60(s0)
    61b0:	40f60633          	sub	a2,a2,a5
    61b4:	00000693          	li	a3,0
    61b8:	00098513          	mv	a0,s3
    61bc:	000800e7          	jalr	a6
    61c0:	fff00793          	li	a5,-1
    61c4:	12f51463          	bne	a0,a5,62ec <__sflush_r+0x1dc>
    61c8:	0009a683          	lw	a3,0(s3)
    61cc:	01d00793          	li	a5,29
    61d0:	00c41703          	lh	a4,12(s0)
    61d4:	16d7ea63          	bltu	a5,a3,6348 <__sflush_r+0x238>
    61d8:	204007b7          	lui	a5,0x20400
    61dc:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    61e0:	00d7d7b3          	srl	a5,a5,a3
    61e4:	0017f793          	and	a5,a5,1
    61e8:	16078063          	beqz	a5,6348 <__sflush_r+0x238>
    61ec:	01042603          	lw	a2,16(s0)
    61f0:	fffff7b7          	lui	a5,0xfffff
    61f4:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    61f8:	00f777b3          	and	a5,a4,a5
    61fc:	00f41623          	sh	a5,12(s0)
    6200:	00042223          	sw	zero,4(s0)
    6204:	00c42023          	sw	a2,0(s0)
    6208:	01371793          	sll	a5,a4,0x13
    620c:	0007d463          	bgez	a5,6214 <__sflush_r+0x104>
    6210:	10068263          	beqz	a3,6314 <__sflush_r+0x204>
    6214:	03042583          	lw	a1,48(s0)
    6218:	0099a023          	sw	s1,0(s3)
    621c:	10058463          	beqz	a1,6324 <__sflush_r+0x214>
    6220:	04040793          	add	a5,s0,64
    6224:	00f58663          	beq	a1,a5,6230 <__sflush_r+0x120>
    6228:	00098513          	mv	a0,s3
    622c:	c5dfa0ef          	jal	e88 <_free_r>
    6230:	01412483          	lw	s1,20(sp)
    6234:	02042823          	sw	zero,48(s0)
    6238:	00000513          	li	a0,0
    623c:	01c12083          	lw	ra,28(sp)
    6240:	01812403          	lw	s0,24(sp)
    6244:	00c12983          	lw	s3,12(sp)
    6248:	02010113          	add	sp,sp,32
    624c:	00008067          	ret
    6250:	01212823          	sw	s2,16(sp)
    6254:	0105a903          	lw	s2,16(a1)
    6258:	08090263          	beqz	s2,62dc <__sflush_r+0x1cc>
    625c:	00912a23          	sw	s1,20(sp)
    6260:	0005a483          	lw	s1,0(a1)
    6264:	00377713          	and	a4,a4,3
    6268:	0125a023          	sw	s2,0(a1)
    626c:	412484b3          	sub	s1,s1,s2
    6270:	00000793          	li	a5,0
    6274:	00071463          	bnez	a4,627c <__sflush_r+0x16c>
    6278:	0145a783          	lw	a5,20(a1)
    627c:	00f42423          	sw	a5,8(s0)
    6280:	00904863          	bgtz	s1,6290 <__sflush_r+0x180>
    6284:	0540006f          	j	62d8 <__sflush_r+0x1c8>
    6288:	00a90933          	add	s2,s2,a0
    628c:	04905663          	blez	s1,62d8 <__sflush_r+0x1c8>
    6290:	02442783          	lw	a5,36(s0)
    6294:	01c42583          	lw	a1,28(s0)
    6298:	00048693          	mv	a3,s1
    629c:	00090613          	mv	a2,s2
    62a0:	00098513          	mv	a0,s3
    62a4:	000780e7          	jalr	a5
    62a8:	40a484b3          	sub	s1,s1,a0
    62ac:	fca04ee3          	bgtz	a0,6288 <__sflush_r+0x178>
    62b0:	00c41703          	lh	a4,12(s0)
    62b4:	01012903          	lw	s2,16(sp)
    62b8:	04076713          	or	a4,a4,64
    62bc:	01412483          	lw	s1,20(sp)
    62c0:	00e41623          	sh	a4,12(s0)
    62c4:	fff00513          	li	a0,-1
    62c8:	f75ff06f          	j	623c <__sflush_r+0x12c>
    62cc:	03c5a683          	lw	a3,60(a1)
    62d0:	e6d04ee3          	bgtz	a3,614c <__sflush_r+0x3c>
    62d4:	f65ff06f          	j	6238 <__sflush_r+0x128>
    62d8:	01412483          	lw	s1,20(sp)
    62dc:	01012903          	lw	s2,16(sp)
    62e0:	f59ff06f          	j	6238 <__sflush_r+0x128>
    62e4:	05042603          	lw	a2,80(s0)
    62e8:	eadff06f          	j	6194 <__sflush_r+0x84>
    62ec:	00c41703          	lh	a4,12(s0)
    62f0:	01042683          	lw	a3,16(s0)
    62f4:	fffff7b7          	lui	a5,0xfffff
    62f8:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    62fc:	00f777b3          	and	a5,a4,a5
    6300:	00f41623          	sh	a5,12(s0)
    6304:	00042223          	sw	zero,4(s0)
    6308:	00d42023          	sw	a3,0(s0)
    630c:	01371793          	sll	a5,a4,0x13
    6310:	f007d2e3          	bgez	a5,6214 <__sflush_r+0x104>
    6314:	03042583          	lw	a1,48(s0)
    6318:	04a42823          	sw	a0,80(s0)
    631c:	0099a023          	sw	s1,0(s3)
    6320:	f00590e3          	bnez	a1,6220 <__sflush_r+0x110>
    6324:	01412483          	lw	s1,20(sp)
    6328:	f11ff06f          	j	6238 <__sflush_r+0x128>
    632c:	0009a783          	lw	a5,0(s3)
    6330:	e4078ce3          	beqz	a5,6188 <__sflush_r+0x78>
    6334:	01d00713          	li	a4,29
    6338:	00e78c63          	beq	a5,a4,6350 <__sflush_r+0x240>
    633c:	01600713          	li	a4,22
    6340:	00e78863          	beq	a5,a4,6350 <__sflush_r+0x240>
    6344:	00c41703          	lh	a4,12(s0)
    6348:	04076713          	or	a4,a4,64
    634c:	f71ff06f          	j	62bc <__sflush_r+0x1ac>
    6350:	0099a023          	sw	s1,0(s3)
    6354:	01412483          	lw	s1,20(sp)
    6358:	ee1ff06f          	j	6238 <__sflush_r+0x128>

0000635c <_fflush_r>:
    635c:	ff010113          	add	sp,sp,-16
    6360:	00812423          	sw	s0,8(sp)
    6364:	00912223          	sw	s1,4(sp)
    6368:	00112623          	sw	ra,12(sp)
    636c:	01212023          	sw	s2,0(sp)
    6370:	00050493          	mv	s1,a0
    6374:	00058413          	mv	s0,a1
    6378:	00050663          	beqz	a0,6384 <_fflush_r+0x28>
    637c:	03452783          	lw	a5,52(a0)
    6380:	0a078a63          	beqz	a5,6434 <_fflush_r+0xd8>
    6384:	00c41783          	lh	a5,12(s0)
    6388:	00000913          	li	s2,0
    638c:	04078063          	beqz	a5,63cc <_fflush_r+0x70>
    6390:	06442703          	lw	a4,100(s0)
    6394:	00177713          	and	a4,a4,1
    6398:	00071663          	bnez	a4,63a4 <_fflush_r+0x48>
    639c:	2007f793          	and	a5,a5,512
    63a0:	04078463          	beqz	a5,63e8 <_fflush_r+0x8c>
    63a4:	00040593          	mv	a1,s0
    63a8:	00048513          	mv	a0,s1
    63ac:	d65ff0ef          	jal	6110 <__sflush_r>
    63b0:	06442783          	lw	a5,100(s0)
    63b4:	00050913          	mv	s2,a0
    63b8:	0017f793          	and	a5,a5,1
    63bc:	00079863          	bnez	a5,63cc <_fflush_r+0x70>
    63c0:	00c45783          	lhu	a5,12(s0)
    63c4:	2007f793          	and	a5,a5,512
    63c8:	04078463          	beqz	a5,6410 <_fflush_r+0xb4>
    63cc:	00c12083          	lw	ra,12(sp)
    63d0:	00812403          	lw	s0,8(sp)
    63d4:	00412483          	lw	s1,4(sp)
    63d8:	00090513          	mv	a0,s2
    63dc:	00012903          	lw	s2,0(sp)
    63e0:	01010113          	add	sp,sp,16
    63e4:	00008067          	ret
    63e8:	05842503          	lw	a0,88(s0)
    63ec:	e44fa0ef          	jal	a30 <__retarget_lock_acquire_recursive>
    63f0:	00040593          	mv	a1,s0
    63f4:	00048513          	mv	a0,s1
    63f8:	d19ff0ef          	jal	6110 <__sflush_r>
    63fc:	06442783          	lw	a5,100(s0)
    6400:	00050913          	mv	s2,a0
    6404:	0017f793          	and	a5,a5,1
    6408:	fc0792e3          	bnez	a5,63cc <_fflush_r+0x70>
    640c:	fb5ff06f          	j	63c0 <_fflush_r+0x64>
    6410:	05842503          	lw	a0,88(s0)
    6414:	e20fa0ef          	jal	a34 <__retarget_lock_release_recursive>
    6418:	00c12083          	lw	ra,12(sp)
    641c:	00812403          	lw	s0,8(sp)
    6420:	00412483          	lw	s1,4(sp)
    6424:	00090513          	mv	a0,s2
    6428:	00012903          	lw	s2,0(sp)
    642c:	01010113          	add	sp,sp,16
    6430:	00008067          	ret
    6434:	224000ef          	jal	6658 <__sinit>
    6438:	f4dff06f          	j	6384 <_fflush_r+0x28>

0000643c <stdio_exit_handler>:
    643c:	7fffa617          	auipc	a2,0x7fffa
    6440:	0ec60613          	add	a2,a2,236 # 80000528 <__sglue>
    6444:	00004597          	auipc	a1,0x4
    6448:	28c58593          	add	a1,a1,652 # a6d0 <_fclose_r>
    644c:	7fffa517          	auipc	a0,0x7fffa
    6450:	bb450513          	add	a0,a0,-1100 # 80000000 <_impure_data>
    6454:	7a00006f          	j	6bf4 <_fwalk_sglue>

00006458 <cleanup_stdio>:
    6458:	00452583          	lw	a1,4(a0)
    645c:	ff010113          	add	sp,sp,-16
    6460:	00812423          	sw	s0,8(sp)
    6464:	00112623          	sw	ra,12(sp)
    6468:	7fffa797          	auipc	a5,0x7fffa
    646c:	4f478793          	add	a5,a5,1268 # 8000095c <__sf>
    6470:	00050413          	mv	s0,a0
    6474:	00f58463          	beq	a1,a5,647c <cleanup_stdio+0x24>
    6478:	258040ef          	jal	a6d0 <_fclose_r>
    647c:	00842583          	lw	a1,8(s0)
    6480:	7fffa797          	auipc	a5,0x7fffa
    6484:	54478793          	add	a5,a5,1348 # 800009c4 <__sf+0x68>
    6488:	00f58663          	beq	a1,a5,6494 <cleanup_stdio+0x3c>
    648c:	00040513          	mv	a0,s0
    6490:	240040ef          	jal	a6d0 <_fclose_r>
    6494:	00c42583          	lw	a1,12(s0)
    6498:	7fffa797          	auipc	a5,0x7fffa
    649c:	59478793          	add	a5,a5,1428 # 80000a2c <__sf+0xd0>
    64a0:	00f58c63          	beq	a1,a5,64b8 <cleanup_stdio+0x60>
    64a4:	00040513          	mv	a0,s0
    64a8:	00812403          	lw	s0,8(sp)
    64ac:	00c12083          	lw	ra,12(sp)
    64b0:	01010113          	add	sp,sp,16
    64b4:	21c0406f          	j	a6d0 <_fclose_r>
    64b8:	00c12083          	lw	ra,12(sp)
    64bc:	00812403          	lw	s0,8(sp)
    64c0:	01010113          	add	sp,sp,16
    64c4:	00008067          	ret

000064c8 <global_stdio_init.part.0>:
    64c8:	fe010113          	add	sp,sp,-32
    64cc:	00000797          	auipc	a5,0x0
    64d0:	f7078793          	add	a5,a5,-144 # 643c <stdio_exit_handler>
    64d4:	00112e23          	sw	ra,28(sp)
    64d8:	00812c23          	sw	s0,24(sp)
    64dc:	00912a23          	sw	s1,20(sp)
    64e0:	7fffa417          	auipc	s0,0x7fffa
    64e4:	47c40413          	add	s0,s0,1148 # 8000095c <__sf>
    64e8:	01212823          	sw	s2,16(sp)
    64ec:	01312623          	sw	s3,12(sp)
    64f0:	01412423          	sw	s4,8(sp)
    64f4:	00800613          	li	a2,8
    64f8:	00000593          	li	a1,0
    64fc:	7fffa717          	auipc	a4,0x7fffa
    6500:	22f72a23          	sw	a5,564(a4) # 80000730 <__stdio_exit_handler>
    6504:	7fffa517          	auipc	a0,0x7fffa
    6508:	4b450513          	add	a0,a0,1204 # 800009b8 <__sf+0x5c>
    650c:	00400793          	li	a5,4
    6510:	00f42623          	sw	a5,12(s0)
    6514:	00042023          	sw	zero,0(s0)
    6518:	00042223          	sw	zero,4(s0)
    651c:	00042423          	sw	zero,8(s0)
    6520:	06042223          	sw	zero,100(s0)
    6524:	00042823          	sw	zero,16(s0)
    6528:	00042a23          	sw	zero,20(s0)
    652c:	00042c23          	sw	zero,24(s0)
    6530:	d08fa0ef          	jal	a38 <memset>
    6534:	00001a17          	auipc	s4,0x1
    6538:	870a0a13          	add	s4,s4,-1936 # 6da4 <__sread>
    653c:	00001997          	auipc	s3,0x1
    6540:	8c498993          	add	s3,s3,-1852 # 6e00 <__swrite>
    6544:	00001917          	auipc	s2,0x1
    6548:	94490913          	add	s2,s2,-1724 # 6e88 <__sseek>
    654c:	00001497          	auipc	s1,0x1
    6550:	9b448493          	add	s1,s1,-1612 # 6f00 <__sclose>
    6554:	7fffa517          	auipc	a0,0x7fffa
    6558:	46050513          	add	a0,a0,1120 # 800009b4 <__sf+0x58>
    655c:	03442023          	sw	s4,32(s0)
    6560:	03342223          	sw	s3,36(s0)
    6564:	03242423          	sw	s2,40(s0)
    6568:	02942623          	sw	s1,44(s0)
    656c:	00842e23          	sw	s0,28(s0)
    6570:	cb8fa0ef          	jal	a28 <__retarget_lock_init_recursive>
    6574:	000107b7          	lui	a5,0x10
    6578:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0xd59>
    657c:	00800613          	li	a2,8
    6580:	00000593          	li	a1,0
    6584:	7fffa517          	auipc	a0,0x7fffa
    6588:	49c50513          	add	a0,a0,1180 # 80000a20 <__sf+0xc4>
    658c:	06f42a23          	sw	a5,116(s0)
    6590:	06042423          	sw	zero,104(s0)
    6594:	06042623          	sw	zero,108(s0)
    6598:	06042823          	sw	zero,112(s0)
    659c:	0c042623          	sw	zero,204(s0)
    65a0:	06042c23          	sw	zero,120(s0)
    65a4:	06042e23          	sw	zero,124(s0)
    65a8:	08042023          	sw	zero,128(s0)
    65ac:	c8cfa0ef          	jal	a38 <memset>
    65b0:	7fffa797          	auipc	a5,0x7fffa
    65b4:	41478793          	add	a5,a5,1044 # 800009c4 <__sf+0x68>
    65b8:	7fffa517          	auipc	a0,0x7fffa
    65bc:	46450513          	add	a0,a0,1124 # 80000a1c <__sf+0xc0>
    65c0:	08f42223          	sw	a5,132(s0)
    65c4:	09442423          	sw	s4,136(s0)
    65c8:	09342623          	sw	s3,140(s0)
    65cc:	09242823          	sw	s2,144(s0)
    65d0:	08942a23          	sw	s1,148(s0)
    65d4:	c54fa0ef          	jal	a28 <__retarget_lock_init_recursive>
    65d8:	000207b7          	lui	a5,0x20
    65dc:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    65e0:	00800613          	li	a2,8
    65e4:	00000593          	li	a1,0
    65e8:	7fffa517          	auipc	a0,0x7fffa
    65ec:	4a050513          	add	a0,a0,1184 # 80000a88 <__sf+0x12c>
    65f0:	0cf42e23          	sw	a5,220(s0)
    65f4:	0c042823          	sw	zero,208(s0)
    65f8:	0c042a23          	sw	zero,212(s0)
    65fc:	0c042c23          	sw	zero,216(s0)
    6600:	12042a23          	sw	zero,308(s0)
    6604:	0e042023          	sw	zero,224(s0)
    6608:	0e042223          	sw	zero,228(s0)
    660c:	0e042423          	sw	zero,232(s0)
    6610:	c28fa0ef          	jal	a38 <memset>
    6614:	7fffa797          	auipc	a5,0x7fffa
    6618:	41878793          	add	a5,a5,1048 # 80000a2c <__sf+0xd0>
    661c:	0f442823          	sw	s4,240(s0)
    6620:	0f342a23          	sw	s3,244(s0)
    6624:	0f242c23          	sw	s2,248(s0)
    6628:	0e942e23          	sw	s1,252(s0)
    662c:	0ef42623          	sw	a5,236(s0)
    6630:	01812403          	lw	s0,24(sp)
    6634:	01c12083          	lw	ra,28(sp)
    6638:	01412483          	lw	s1,20(sp)
    663c:	01012903          	lw	s2,16(sp)
    6640:	00c12983          	lw	s3,12(sp)
    6644:	00812a03          	lw	s4,8(sp)
    6648:	7fffa517          	auipc	a0,0x7fffa
    664c:	43c50513          	add	a0,a0,1084 # 80000a84 <__sf+0x128>
    6650:	02010113          	add	sp,sp,32
    6654:	bd4fa06f          	j	a28 <__retarget_lock_init_recursive>

00006658 <__sinit>:
    6658:	ff010113          	add	sp,sp,-16
    665c:	00812423          	sw	s0,8(sp)
    6660:	00050413          	mv	s0,a0
    6664:	7fffa517          	auipc	a0,0x7fffa
    6668:	0bc50513          	add	a0,a0,188 # 80000720 <__lock___sfp_recursive_mutex>
    666c:	00112623          	sw	ra,12(sp)
    6670:	bc0fa0ef          	jal	a30 <__retarget_lock_acquire_recursive>
    6674:	03442783          	lw	a5,52(s0)
    6678:	00079e63          	bnez	a5,6694 <__sinit+0x3c>
    667c:	00000797          	auipc	a5,0x0
    6680:	ddc78793          	add	a5,a5,-548 # 6458 <cleanup_stdio>
    6684:	02f42a23          	sw	a5,52(s0)
    6688:	7fffa797          	auipc	a5,0x7fffa
    668c:	0a87a783          	lw	a5,168(a5) # 80000730 <__stdio_exit_handler>
    6690:	00078e63          	beqz	a5,66ac <__sinit+0x54>
    6694:	00812403          	lw	s0,8(sp)
    6698:	00c12083          	lw	ra,12(sp)
    669c:	7fffa517          	auipc	a0,0x7fffa
    66a0:	08450513          	add	a0,a0,132 # 80000720 <__lock___sfp_recursive_mutex>
    66a4:	01010113          	add	sp,sp,16
    66a8:	b8cfa06f          	j	a34 <__retarget_lock_release_recursive>
    66ac:	e1dff0ef          	jal	64c8 <global_stdio_init.part.0>
    66b0:	00812403          	lw	s0,8(sp)
    66b4:	00c12083          	lw	ra,12(sp)
    66b8:	7fffa517          	auipc	a0,0x7fffa
    66bc:	06850513          	add	a0,a0,104 # 80000720 <__lock___sfp_recursive_mutex>
    66c0:	01010113          	add	sp,sp,16
    66c4:	b70fa06f          	j	a34 <__retarget_lock_release_recursive>

000066c8 <__sfp_lock_acquire>:
    66c8:	7fffa517          	auipc	a0,0x7fffa
    66cc:	05850513          	add	a0,a0,88 # 80000720 <__lock___sfp_recursive_mutex>
    66d0:	b60fa06f          	j	a30 <__retarget_lock_acquire_recursive>

000066d4 <__sfp_lock_release>:
    66d4:	7fffa517          	auipc	a0,0x7fffa
    66d8:	04c50513          	add	a0,a0,76 # 80000720 <__lock___sfp_recursive_mutex>
    66dc:	b58fa06f          	j	a34 <__retarget_lock_release_recursive>

000066e0 <__sfvwrite_r>:
    66e0:	00862783          	lw	a5,8(a2)
    66e4:	2c078463          	beqz	a5,69ac <__sfvwrite_r+0x2cc>
    66e8:	00c59683          	lh	a3,12(a1)
    66ec:	fd010113          	add	sp,sp,-48
    66f0:	02812423          	sw	s0,40(sp)
    66f4:	01412c23          	sw	s4,24(sp)
    66f8:	01612823          	sw	s6,16(sp)
    66fc:	02112623          	sw	ra,44(sp)
    6700:	0086f793          	and	a5,a3,8
    6704:	00060b13          	mv	s6,a2
    6708:	00050a13          	mv	s4,a0
    670c:	00058413          	mv	s0,a1
    6710:	08078e63          	beqz	a5,67ac <__sfvwrite_r+0xcc>
    6714:	0105a783          	lw	a5,16(a1)
    6718:	08078a63          	beqz	a5,67ac <__sfvwrite_r+0xcc>
    671c:	02912223          	sw	s1,36(sp)
    6720:	03212023          	sw	s2,32(sp)
    6724:	01312e23          	sw	s3,28(sp)
    6728:	01512a23          	sw	s5,20(sp)
    672c:	0026f793          	and	a5,a3,2
    6730:	000b2483          	lw	s1,0(s6)
    6734:	0a078463          	beqz	a5,67dc <__sfvwrite_r+0xfc>
    6738:	02442783          	lw	a5,36(s0)
    673c:	01c42583          	lw	a1,28(s0)
    6740:	80000ab7          	lui	s5,0x80000
    6744:	00000993          	li	s3,0
    6748:	00000913          	li	s2,0
    674c:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6750:	00098613          	mv	a2,s3
    6754:	000a0513          	mv	a0,s4
    6758:	04090263          	beqz	s2,679c <__sfvwrite_r+0xbc>
    675c:	00090693          	mv	a3,s2
    6760:	012af463          	bgeu	s5,s2,6768 <__sfvwrite_r+0x88>
    6764:	000a8693          	mv	a3,s5
    6768:	000780e7          	jalr	a5
    676c:	46a05263          	blez	a0,6bd0 <__sfvwrite_r+0x4f0>
    6770:	008b2783          	lw	a5,8(s6)
    6774:	00a989b3          	add	s3,s3,a0
    6778:	40a90933          	sub	s2,s2,a0
    677c:	40a787b3          	sub	a5,a5,a0
    6780:	00fb2423          	sw	a5,8(s6)
    6784:	1a078663          	beqz	a5,6930 <__sfvwrite_r+0x250>
    6788:	02442783          	lw	a5,36(s0)
    678c:	01c42583          	lw	a1,28(s0)
    6790:	00098613          	mv	a2,s3
    6794:	000a0513          	mv	a0,s4
    6798:	fc0912e3          	bnez	s2,675c <__sfvwrite_r+0x7c>
    679c:	0004a983          	lw	s3,0(s1)
    67a0:	0044a903          	lw	s2,4(s1)
    67a4:	00848493          	add	s1,s1,8
    67a8:	fa9ff06f          	j	6750 <__sfvwrite_r+0x70>
    67ac:	00040593          	mv	a1,s0
    67b0:	000a0513          	mv	a0,s4
    67b4:	0e5000ef          	jal	7098 <__swsetup_r>
    67b8:	1c051c63          	bnez	a0,6990 <__sfvwrite_r+0x2b0>
    67bc:	00c41683          	lh	a3,12(s0)
    67c0:	02912223          	sw	s1,36(sp)
    67c4:	03212023          	sw	s2,32(sp)
    67c8:	01312e23          	sw	s3,28(sp)
    67cc:	01512a23          	sw	s5,20(sp)
    67d0:	0026f793          	and	a5,a3,2
    67d4:	000b2483          	lw	s1,0(s6)
    67d8:	f60790e3          	bnez	a5,6738 <__sfvwrite_r+0x58>
    67dc:	01712623          	sw	s7,12(sp)
    67e0:	01812423          	sw	s8,8(sp)
    67e4:	0016f793          	and	a5,a3,1
    67e8:	1c079663          	bnez	a5,69b4 <__sfvwrite_r+0x2d4>
    67ec:	00042783          	lw	a5,0(s0)
    67f0:	00842703          	lw	a4,8(s0)
    67f4:	80000ab7          	lui	s5,0x80000
    67f8:	01912223          	sw	s9,4(sp)
    67fc:	00000b93          	li	s7,0
    6800:	00000993          	li	s3,0
    6804:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6808:	00078513          	mv	a0,a5
    680c:	00070c13          	mv	s8,a4
    6810:	10098263          	beqz	s3,6914 <__sfvwrite_r+0x234>
    6814:	2006f613          	and	a2,a3,512
    6818:	28060863          	beqz	a2,6aa8 <__sfvwrite_r+0x3c8>
    681c:	00070c93          	mv	s9,a4
    6820:	32e9e863          	bltu	s3,a4,6b50 <__sfvwrite_r+0x470>
    6824:	4806f713          	and	a4,a3,1152
    6828:	08070a63          	beqz	a4,68bc <__sfvwrite_r+0x1dc>
    682c:	01442603          	lw	a2,20(s0)
    6830:	01042583          	lw	a1,16(s0)
    6834:	00161713          	sll	a4,a2,0x1
    6838:	00c70733          	add	a4,a4,a2
    683c:	40b78933          	sub	s2,a5,a1
    6840:	01f75c13          	srl	s8,a4,0x1f
    6844:	00ec0c33          	add	s8,s8,a4
    6848:	00190793          	add	a5,s2,1
    684c:	401c5c13          	sra	s8,s8,0x1
    6850:	013787b3          	add	a5,a5,s3
    6854:	000c0613          	mv	a2,s8
    6858:	00fc7663          	bgeu	s8,a5,6864 <__sfvwrite_r+0x184>
    685c:	00078c13          	mv	s8,a5
    6860:	00078613          	mv	a2,a5
    6864:	4006f693          	and	a3,a3,1024
    6868:	32068063          	beqz	a3,6b88 <__sfvwrite_r+0x4a8>
    686c:	00060593          	mv	a1,a2
    6870:	000a0513          	mv	a0,s4
    6874:	921fa0ef          	jal	1194 <_malloc_r>
    6878:	00050c93          	mv	s9,a0
    687c:	34050e63          	beqz	a0,6bd8 <__sfvwrite_r+0x4f8>
    6880:	01042583          	lw	a1,16(s0)
    6884:	00090613          	mv	a2,s2
    6888:	a8cfa0ef          	jal	b14 <memcpy>
    688c:	00c45783          	lhu	a5,12(s0)
    6890:	b7f7f793          	and	a5,a5,-1153
    6894:	0807e793          	or	a5,a5,128
    6898:	00f41623          	sh	a5,12(s0)
    689c:	012c8533          	add	a0,s9,s2
    68a0:	412c07b3          	sub	a5,s8,s2
    68a4:	01942823          	sw	s9,16(s0)
    68a8:	01842a23          	sw	s8,20(s0)
    68ac:	00a42023          	sw	a0,0(s0)
    68b0:	00098c13          	mv	s8,s3
    68b4:	00f42423          	sw	a5,8(s0)
    68b8:	00098c93          	mv	s9,s3
    68bc:	000c8613          	mv	a2,s9
    68c0:	000b8593          	mv	a1,s7
    68c4:	6a9000ef          	jal	776c <memmove>
    68c8:	00842703          	lw	a4,8(s0)
    68cc:	00042783          	lw	a5,0(s0)
    68d0:	00098913          	mv	s2,s3
    68d4:	41870733          	sub	a4,a4,s8
    68d8:	019787b3          	add	a5,a5,s9
    68dc:	00e42423          	sw	a4,8(s0)
    68e0:	00f42023          	sw	a5,0(s0)
    68e4:	00000993          	li	s3,0
    68e8:	008b2783          	lw	a5,8(s6)
    68ec:	012b8bb3          	add	s7,s7,s2
    68f0:	412787b3          	sub	a5,a5,s2
    68f4:	00fb2423          	sw	a5,8(s6)
    68f8:	02078663          	beqz	a5,6924 <__sfvwrite_r+0x244>
    68fc:	00042783          	lw	a5,0(s0)
    6900:	00842703          	lw	a4,8(s0)
    6904:	00c41683          	lh	a3,12(s0)
    6908:	00078513          	mv	a0,a5
    690c:	00070c13          	mv	s8,a4
    6910:	f00992e3          	bnez	s3,6814 <__sfvwrite_r+0x134>
    6914:	0004ab83          	lw	s7,0(s1)
    6918:	0044a983          	lw	s3,4(s1)
    691c:	00848493          	add	s1,s1,8
    6920:	ee9ff06f          	j	6808 <__sfvwrite_r+0x128>
    6924:	00c12b83          	lw	s7,12(sp)
    6928:	00812c03          	lw	s8,8(sp)
    692c:	00412c83          	lw	s9,4(sp)
    6930:	02c12083          	lw	ra,44(sp)
    6934:	02812403          	lw	s0,40(sp)
    6938:	02412483          	lw	s1,36(sp)
    693c:	02012903          	lw	s2,32(sp)
    6940:	01c12983          	lw	s3,28(sp)
    6944:	01412a83          	lw	s5,20(sp)
    6948:	01812a03          	lw	s4,24(sp)
    694c:	01012b03          	lw	s6,16(sp)
    6950:	00000513          	li	a0,0
    6954:	03010113          	add	sp,sp,48
    6958:	00008067          	ret
    695c:	00040593          	mv	a1,s0
    6960:	000a0513          	mv	a0,s4
    6964:	9f9ff0ef          	jal	635c <_fflush_r>
    6968:	0a050e63          	beqz	a0,6a24 <__sfvwrite_r+0x344>
    696c:	00c41783          	lh	a5,12(s0)
    6970:	00c12b83          	lw	s7,12(sp)
    6974:	00812c03          	lw	s8,8(sp)
    6978:	02412483          	lw	s1,36(sp)
    697c:	02012903          	lw	s2,32(sp)
    6980:	01c12983          	lw	s3,28(sp)
    6984:	01412a83          	lw	s5,20(sp)
    6988:	0407e793          	or	a5,a5,64
    698c:	00f41623          	sh	a5,12(s0)
    6990:	02c12083          	lw	ra,44(sp)
    6994:	02812403          	lw	s0,40(sp)
    6998:	01812a03          	lw	s4,24(sp)
    699c:	01012b03          	lw	s6,16(sp)
    69a0:	fff00513          	li	a0,-1
    69a4:	03010113          	add	sp,sp,48
    69a8:	00008067          	ret
    69ac:	00000513          	li	a0,0
    69b0:	00008067          	ret
    69b4:	00000a93          	li	s5,0
    69b8:	00000513          	li	a0,0
    69bc:	00000c13          	li	s8,0
    69c0:	00000993          	li	s3,0
    69c4:	08098263          	beqz	s3,6a48 <__sfvwrite_r+0x368>
    69c8:	08050a63          	beqz	a0,6a5c <__sfvwrite_r+0x37c>
    69cc:	000a8793          	mv	a5,s5
    69d0:	00098b93          	mv	s7,s3
    69d4:	0137f463          	bgeu	a5,s3,69dc <__sfvwrite_r+0x2fc>
    69d8:	00078b93          	mv	s7,a5
    69dc:	00042503          	lw	a0,0(s0)
    69e0:	01042783          	lw	a5,16(s0)
    69e4:	00842903          	lw	s2,8(s0)
    69e8:	01442683          	lw	a3,20(s0)
    69ec:	00a7f663          	bgeu	a5,a0,69f8 <__sfvwrite_r+0x318>
    69f0:	00d90933          	add	s2,s2,a3
    69f4:	09794463          	blt	s2,s7,6a7c <__sfvwrite_r+0x39c>
    69f8:	16dbc263          	blt	s7,a3,6b5c <__sfvwrite_r+0x47c>
    69fc:	02442783          	lw	a5,36(s0)
    6a00:	01c42583          	lw	a1,28(s0)
    6a04:	000c0613          	mv	a2,s8
    6a08:	000a0513          	mv	a0,s4
    6a0c:	000780e7          	jalr	a5
    6a10:	00050913          	mv	s2,a0
    6a14:	f4a05ce3          	blez	a0,696c <__sfvwrite_r+0x28c>
    6a18:	412a8ab3          	sub	s5,s5,s2
    6a1c:	00100513          	li	a0,1
    6a20:	f20a8ee3          	beqz	s5,695c <__sfvwrite_r+0x27c>
    6a24:	008b2783          	lw	a5,8(s6)
    6a28:	012c0c33          	add	s8,s8,s2
    6a2c:	412989b3          	sub	s3,s3,s2
    6a30:	412787b3          	sub	a5,a5,s2
    6a34:	00fb2423          	sw	a5,8(s6)
    6a38:	f80796e3          	bnez	a5,69c4 <__sfvwrite_r+0x2e4>
    6a3c:	00c12b83          	lw	s7,12(sp)
    6a40:	00812c03          	lw	s8,8(sp)
    6a44:	eedff06f          	j	6930 <__sfvwrite_r+0x250>
    6a48:	0044a983          	lw	s3,4(s1)
    6a4c:	00048793          	mv	a5,s1
    6a50:	00848493          	add	s1,s1,8
    6a54:	fe098ae3          	beqz	s3,6a48 <__sfvwrite_r+0x368>
    6a58:	0007ac03          	lw	s8,0(a5)
    6a5c:	00098613          	mv	a2,s3
    6a60:	00a00593          	li	a1,10
    6a64:	000c0513          	mv	a0,s8
    6a68:	1a1000ef          	jal	7408 <memchr>
    6a6c:	14050c63          	beqz	a0,6bc4 <__sfvwrite_r+0x4e4>
    6a70:	00150513          	add	a0,a0,1
    6a74:	41850ab3          	sub	s5,a0,s8
    6a78:	f55ff06f          	j	69cc <__sfvwrite_r+0x2ec>
    6a7c:	000c0593          	mv	a1,s8
    6a80:	00090613          	mv	a2,s2
    6a84:	4e9000ef          	jal	776c <memmove>
    6a88:	00042783          	lw	a5,0(s0)
    6a8c:	00040593          	mv	a1,s0
    6a90:	000a0513          	mv	a0,s4
    6a94:	012787b3          	add	a5,a5,s2
    6a98:	00f42023          	sw	a5,0(s0)
    6a9c:	8c1ff0ef          	jal	635c <_fflush_r>
    6aa0:	f6050ce3          	beqz	a0,6a18 <__sfvwrite_r+0x338>
    6aa4:	ec9ff06f          	j	696c <__sfvwrite_r+0x28c>
    6aa8:	01042683          	lw	a3,16(s0)
    6aac:	04f6e463          	bltu	a3,a5,6af4 <__sfvwrite_r+0x414>
    6ab0:	01442583          	lw	a1,20(s0)
    6ab4:	04b9e063          	bltu	s3,a1,6af4 <__sfvwrite_r+0x414>
    6ab8:	00098913          	mv	s2,s3
    6abc:	013af463          	bgeu	s5,s3,6ac4 <__sfvwrite_r+0x3e4>
    6ac0:	000a8913          	mv	s2,s5
    6ac4:	00090513          	mv	a0,s2
    6ac8:	5c5070ef          	jal	e88c <__modsi3>
    6acc:	02442783          	lw	a5,36(s0)
    6ad0:	01c42583          	lw	a1,28(s0)
    6ad4:	40a906b3          	sub	a3,s2,a0
    6ad8:	000b8613          	mv	a2,s7
    6adc:	000a0513          	mv	a0,s4
    6ae0:	000780e7          	jalr	a5
    6ae4:	00050913          	mv	s2,a0
    6ae8:	04a05a63          	blez	a0,6b3c <__sfvwrite_r+0x45c>
    6aec:	412989b3          	sub	s3,s3,s2
    6af0:	df9ff06f          	j	68e8 <__sfvwrite_r+0x208>
    6af4:	00070913          	mv	s2,a4
    6af8:	00e9f463          	bgeu	s3,a4,6b00 <__sfvwrite_r+0x420>
    6afc:	00098913          	mv	s2,s3
    6b00:	00078513          	mv	a0,a5
    6b04:	00090613          	mv	a2,s2
    6b08:	000b8593          	mv	a1,s7
    6b0c:	461000ef          	jal	776c <memmove>
    6b10:	00842703          	lw	a4,8(s0)
    6b14:	00042783          	lw	a5,0(s0)
    6b18:	41270733          	sub	a4,a4,s2
    6b1c:	012787b3          	add	a5,a5,s2
    6b20:	00e42423          	sw	a4,8(s0)
    6b24:	00f42023          	sw	a5,0(s0)
    6b28:	fc0712e3          	bnez	a4,6aec <__sfvwrite_r+0x40c>
    6b2c:	00040593          	mv	a1,s0
    6b30:	000a0513          	mv	a0,s4
    6b34:	829ff0ef          	jal	635c <_fflush_r>
    6b38:	fa050ae3          	beqz	a0,6aec <__sfvwrite_r+0x40c>
    6b3c:	00c41783          	lh	a5,12(s0)
    6b40:	00c12b83          	lw	s7,12(sp)
    6b44:	00812c03          	lw	s8,8(sp)
    6b48:	00412c83          	lw	s9,4(sp)
    6b4c:	e2dff06f          	j	6978 <__sfvwrite_r+0x298>
    6b50:	00098c13          	mv	s8,s3
    6b54:	00098c93          	mv	s9,s3
    6b58:	d65ff06f          	j	68bc <__sfvwrite_r+0x1dc>
    6b5c:	000b8613          	mv	a2,s7
    6b60:	000c0593          	mv	a1,s8
    6b64:	409000ef          	jal	776c <memmove>
    6b68:	00842703          	lw	a4,8(s0)
    6b6c:	00042783          	lw	a5,0(s0)
    6b70:	000b8913          	mv	s2,s7
    6b74:	41770733          	sub	a4,a4,s7
    6b78:	017787b3          	add	a5,a5,s7
    6b7c:	00e42423          	sw	a4,8(s0)
    6b80:	00f42023          	sw	a5,0(s0)
    6b84:	e95ff06f          	j	6a18 <__sfvwrite_r+0x338>
    6b88:	000a0513          	mv	a0,s4
    6b8c:	508030ef          	jal	a094 <_realloc_r>
    6b90:	00050c93          	mv	s9,a0
    6b94:	d00514e3          	bnez	a0,689c <__sfvwrite_r+0x1bc>
    6b98:	01042583          	lw	a1,16(s0)
    6b9c:	000a0513          	mv	a0,s4
    6ba0:	ae8fa0ef          	jal	e88 <_free_r>
    6ba4:	00c41783          	lh	a5,12(s0)
    6ba8:	00c00713          	li	a4,12
    6bac:	00c12b83          	lw	s7,12(sp)
    6bb0:	00812c03          	lw	s8,8(sp)
    6bb4:	00412c83          	lw	s9,4(sp)
    6bb8:	00ea2023          	sw	a4,0(s4)
    6bbc:	f7f7f793          	and	a5,a5,-129
    6bc0:	db9ff06f          	j	6978 <__sfvwrite_r+0x298>
    6bc4:	00198793          	add	a5,s3,1
    6bc8:	00078a93          	mv	s5,a5
    6bcc:	e05ff06f          	j	69d0 <__sfvwrite_r+0x2f0>
    6bd0:	00c41783          	lh	a5,12(s0)
    6bd4:	da5ff06f          	j	6978 <__sfvwrite_r+0x298>
    6bd8:	00c00713          	li	a4,12
    6bdc:	00c41783          	lh	a5,12(s0)
    6be0:	00c12b83          	lw	s7,12(sp)
    6be4:	00812c03          	lw	s8,8(sp)
    6be8:	00412c83          	lw	s9,4(sp)
    6bec:	00ea2023          	sw	a4,0(s4)
    6bf0:	d89ff06f          	j	6978 <__sfvwrite_r+0x298>

00006bf4 <_fwalk_sglue>:
    6bf4:	fd010113          	add	sp,sp,-48
    6bf8:	03212023          	sw	s2,32(sp)
    6bfc:	01312e23          	sw	s3,28(sp)
    6c00:	01412c23          	sw	s4,24(sp)
    6c04:	01512a23          	sw	s5,20(sp)
    6c08:	01612823          	sw	s6,16(sp)
    6c0c:	01712623          	sw	s7,12(sp)
    6c10:	02112623          	sw	ra,44(sp)
    6c14:	02812423          	sw	s0,40(sp)
    6c18:	02912223          	sw	s1,36(sp)
    6c1c:	00050b13          	mv	s6,a0
    6c20:	00058b93          	mv	s7,a1
    6c24:	00060a93          	mv	s5,a2
    6c28:	00000a13          	li	s4,0
    6c2c:	00100993          	li	s3,1
    6c30:	fff00913          	li	s2,-1
    6c34:	004aa483          	lw	s1,4(s5)
    6c38:	008aa403          	lw	s0,8(s5)
    6c3c:	fff48493          	add	s1,s1,-1
    6c40:	0204c863          	bltz	s1,6c70 <_fwalk_sglue+0x7c>
    6c44:	00c45783          	lhu	a5,12(s0)
    6c48:	00f9fe63          	bgeu	s3,a5,6c64 <_fwalk_sglue+0x70>
    6c4c:	00e41783          	lh	a5,14(s0)
    6c50:	00040593          	mv	a1,s0
    6c54:	000b0513          	mv	a0,s6
    6c58:	01278663          	beq	a5,s2,6c64 <_fwalk_sglue+0x70>
    6c5c:	000b80e7          	jalr	s7
    6c60:	00aa6a33          	or	s4,s4,a0
    6c64:	fff48493          	add	s1,s1,-1
    6c68:	06840413          	add	s0,s0,104
    6c6c:	fd249ce3          	bne	s1,s2,6c44 <_fwalk_sglue+0x50>
    6c70:	000aaa83          	lw	s5,0(s5)
    6c74:	fc0a90e3          	bnez	s5,6c34 <_fwalk_sglue+0x40>
    6c78:	02c12083          	lw	ra,44(sp)
    6c7c:	02812403          	lw	s0,40(sp)
    6c80:	02412483          	lw	s1,36(sp)
    6c84:	02012903          	lw	s2,32(sp)
    6c88:	01c12983          	lw	s3,28(sp)
    6c8c:	01412a83          	lw	s5,20(sp)
    6c90:	01012b03          	lw	s6,16(sp)
    6c94:	00c12b83          	lw	s7,12(sp)
    6c98:	000a0513          	mv	a0,s4
    6c9c:	01812a03          	lw	s4,24(sp)
    6ca0:	03010113          	add	sp,sp,48
    6ca4:	00008067          	ret

00006ca8 <_putc_r>:
    6ca8:	fe010113          	add	sp,sp,-32
    6cac:	00812c23          	sw	s0,24(sp)
    6cb0:	01212a23          	sw	s2,20(sp)
    6cb4:	00112e23          	sw	ra,28(sp)
    6cb8:	00050913          	mv	s2,a0
    6cbc:	00060413          	mv	s0,a2
    6cc0:	00050663          	beqz	a0,6ccc <_putc_r+0x24>
    6cc4:	03452783          	lw	a5,52(a0)
    6cc8:	0c078663          	beqz	a5,6d94 <_putc_r+0xec>
    6ccc:	06442783          	lw	a5,100(s0)
    6cd0:	0017f793          	and	a5,a5,1
    6cd4:	00079863          	bnez	a5,6ce4 <_putc_r+0x3c>
    6cd8:	00c45783          	lhu	a5,12(s0)
    6cdc:	2007f793          	and	a5,a5,512
    6ce0:	08078063          	beqz	a5,6d60 <_putc_r+0xb8>
    6ce4:	00842783          	lw	a5,8(s0)
    6ce8:	fff78793          	add	a5,a5,-1
    6cec:	00f42423          	sw	a5,8(s0)
    6cf0:	0007dc63          	bgez	a5,6d08 <_putc_r+0x60>
    6cf4:	01842703          	lw	a4,24(s0)
    6cf8:	04e7ca63          	blt	a5,a4,6d4c <_putc_r+0xa4>
    6cfc:	0ff5f793          	zext.b	a5,a1
    6d00:	00a00713          	li	a4,10
    6d04:	04e78463          	beq	a5,a4,6d4c <_putc_r+0xa4>
    6d08:	00042783          	lw	a5,0(s0)
    6d0c:	0ff5f913          	zext.b	s2,a1
    6d10:	00178713          	add	a4,a5,1
    6d14:	00e42023          	sw	a4,0(s0)
    6d18:	00b78023          	sb	a1,0(a5)
    6d1c:	06442783          	lw	a5,100(s0)
    6d20:	0017f793          	and	a5,a5,1
    6d24:	00079863          	bnez	a5,6d34 <_putc_r+0x8c>
    6d28:	00c45783          	lhu	a5,12(s0)
    6d2c:	2007f793          	and	a5,a5,512
    6d30:	04078263          	beqz	a5,6d74 <_putc_r+0xcc>
    6d34:	01c12083          	lw	ra,28(sp)
    6d38:	01812403          	lw	s0,24(sp)
    6d3c:	00090513          	mv	a0,s2
    6d40:	01412903          	lw	s2,20(sp)
    6d44:	02010113          	add	sp,sp,32
    6d48:	00008067          	ret
    6d4c:	00090513          	mv	a0,s2
    6d50:	00040613          	mv	a2,s0
    6d54:	1b4000ef          	jal	6f08 <__swbuf_r>
    6d58:	00050913          	mv	s2,a0
    6d5c:	fc1ff06f          	j	6d1c <_putc_r+0x74>
    6d60:	05842503          	lw	a0,88(s0)
    6d64:	00b12623          	sw	a1,12(sp)
    6d68:	cc9f90ef          	jal	a30 <__retarget_lock_acquire_recursive>
    6d6c:	00c12583          	lw	a1,12(sp)
    6d70:	f75ff06f          	j	6ce4 <_putc_r+0x3c>
    6d74:	05842503          	lw	a0,88(s0)
    6d78:	cbdf90ef          	jal	a34 <__retarget_lock_release_recursive>
    6d7c:	01c12083          	lw	ra,28(sp)
    6d80:	01812403          	lw	s0,24(sp)
    6d84:	00090513          	mv	a0,s2
    6d88:	01412903          	lw	s2,20(sp)
    6d8c:	02010113          	add	sp,sp,32
    6d90:	00008067          	ret
    6d94:	00b12623          	sw	a1,12(sp)
    6d98:	8c1ff0ef          	jal	6658 <__sinit>
    6d9c:	00c12583          	lw	a1,12(sp)
    6da0:	f2dff06f          	j	6ccc <_putc_r+0x24>

00006da4 <__sread>:
    6da4:	ff010113          	add	sp,sp,-16
    6da8:	00812423          	sw	s0,8(sp)
    6dac:	00058413          	mv	s0,a1
    6db0:	00e59583          	lh	a1,14(a1)
    6db4:	00112623          	sw	ra,12(sp)
    6db8:	095000ef          	jal	764c <_read_r>
    6dbc:	02054063          	bltz	a0,6ddc <__sread+0x38>
    6dc0:	05042783          	lw	a5,80(s0)
    6dc4:	00c12083          	lw	ra,12(sp)
    6dc8:	00a787b3          	add	a5,a5,a0
    6dcc:	04f42823          	sw	a5,80(s0)
    6dd0:	00812403          	lw	s0,8(sp)
    6dd4:	01010113          	add	sp,sp,16
    6dd8:	00008067          	ret
    6ddc:	00c45783          	lhu	a5,12(s0)
    6de0:	fffff737          	lui	a4,0xfffff
    6de4:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6de8:	00e7f7b3          	and	a5,a5,a4
    6dec:	00c12083          	lw	ra,12(sp)
    6df0:	00f41623          	sh	a5,12(s0)
    6df4:	00812403          	lw	s0,8(sp)
    6df8:	01010113          	add	sp,sp,16
    6dfc:	00008067          	ret

00006e00 <__swrite>:
    6e00:	00c59783          	lh	a5,12(a1)
    6e04:	fe010113          	add	sp,sp,-32
    6e08:	00812c23          	sw	s0,24(sp)
    6e0c:	00912a23          	sw	s1,20(sp)
    6e10:	01212823          	sw	s2,16(sp)
    6e14:	01312623          	sw	s3,12(sp)
    6e18:	00112e23          	sw	ra,28(sp)
    6e1c:	1007f713          	and	a4,a5,256
    6e20:	00058413          	mv	s0,a1
    6e24:	00050493          	mv	s1,a0
    6e28:	00060913          	mv	s2,a2
    6e2c:	00068993          	mv	s3,a3
    6e30:	04071063          	bnez	a4,6e70 <__swrite+0x70>
    6e34:	fffff737          	lui	a4,0xfffff
    6e38:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6e3c:	00e7f7b3          	and	a5,a5,a4
    6e40:	00e41583          	lh	a1,14(s0)
    6e44:	00f41623          	sh	a5,12(s0)
    6e48:	01812403          	lw	s0,24(sp)
    6e4c:	01c12083          	lw	ra,28(sp)
    6e50:	00098693          	mv	a3,s3
    6e54:	00090613          	mv	a2,s2
    6e58:	00c12983          	lw	s3,12(sp)
    6e5c:	01012903          	lw	s2,16(sp)
    6e60:	00048513          	mv	a0,s1
    6e64:	01412483          	lw	s1,20(sp)
    6e68:	02010113          	add	sp,sp,32
    6e6c:	09d0006f          	j	7708 <_write_r>
    6e70:	00e59583          	lh	a1,14(a1)
    6e74:	00200693          	li	a3,2
    6e78:	00000613          	li	a2,0
    6e7c:	76c000ef          	jal	75e8 <_lseek_r>
    6e80:	00c41783          	lh	a5,12(s0)
    6e84:	fb1ff06f          	j	6e34 <__swrite+0x34>

00006e88 <__sseek>:
    6e88:	ff010113          	add	sp,sp,-16
    6e8c:	00812423          	sw	s0,8(sp)
    6e90:	00058413          	mv	s0,a1
    6e94:	00e59583          	lh	a1,14(a1)
    6e98:	00112623          	sw	ra,12(sp)
    6e9c:	74c000ef          	jal	75e8 <_lseek_r>
    6ea0:	fff00793          	li	a5,-1
    6ea4:	02f50863          	beq	a0,a5,6ed4 <__sseek+0x4c>
    6ea8:	00c45783          	lhu	a5,12(s0)
    6eac:	00001737          	lui	a4,0x1
    6eb0:	00c12083          	lw	ra,12(sp)
    6eb4:	00e7e7b3          	or	a5,a5,a4
    6eb8:	01079793          	sll	a5,a5,0x10
    6ebc:	4107d793          	sra	a5,a5,0x10
    6ec0:	04a42823          	sw	a0,80(s0)
    6ec4:	00f41623          	sh	a5,12(s0)
    6ec8:	00812403          	lw	s0,8(sp)
    6ecc:	01010113          	add	sp,sp,16
    6ed0:	00008067          	ret
    6ed4:	00c45783          	lhu	a5,12(s0)
    6ed8:	fffff737          	lui	a4,0xfffff
    6edc:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6ee0:	00e7f7b3          	and	a5,a5,a4
    6ee4:	01079793          	sll	a5,a5,0x10
    6ee8:	4107d793          	sra	a5,a5,0x10
    6eec:	00c12083          	lw	ra,12(sp)
    6ef0:	00f41623          	sh	a5,12(s0)
    6ef4:	00812403          	lw	s0,8(sp)
    6ef8:	01010113          	add	sp,sp,16
    6efc:	00008067          	ret

00006f00 <__sclose>:
    6f00:	00e59583          	lh	a1,14(a1)
    6f04:	68c0006f          	j	7590 <_close_r>

00006f08 <__swbuf_r>:
    6f08:	fe010113          	add	sp,sp,-32
    6f0c:	00812c23          	sw	s0,24(sp)
    6f10:	00912a23          	sw	s1,20(sp)
    6f14:	01212823          	sw	s2,16(sp)
    6f18:	00112e23          	sw	ra,28(sp)
    6f1c:	00050913          	mv	s2,a0
    6f20:	00058493          	mv	s1,a1
    6f24:	00060413          	mv	s0,a2
    6f28:	00050663          	beqz	a0,6f34 <__swbuf_r+0x2c>
    6f2c:	03452783          	lw	a5,52(a0)
    6f30:	16078063          	beqz	a5,7090 <__swbuf_r+0x188>
    6f34:	01842783          	lw	a5,24(s0)
    6f38:	00c41703          	lh	a4,12(s0)
    6f3c:	00f42423          	sw	a5,8(s0)
    6f40:	00877793          	and	a5,a4,8
    6f44:	08078063          	beqz	a5,6fc4 <__swbuf_r+0xbc>
    6f48:	01042783          	lw	a5,16(s0)
    6f4c:	06078c63          	beqz	a5,6fc4 <__swbuf_r+0xbc>
    6f50:	01312623          	sw	s3,12(sp)
    6f54:	01271693          	sll	a3,a4,0x12
    6f58:	0ff4f993          	zext.b	s3,s1
    6f5c:	0ff4f493          	zext.b	s1,s1
    6f60:	0806d863          	bgez	a3,6ff0 <__swbuf_r+0xe8>
    6f64:	00042703          	lw	a4,0(s0)
    6f68:	01442683          	lw	a3,20(s0)
    6f6c:	40f707b3          	sub	a5,a4,a5
    6f70:	0ad7d863          	bge	a5,a3,7020 <__swbuf_r+0x118>
    6f74:	00842683          	lw	a3,8(s0)
    6f78:	00170613          	add	a2,a4,1
    6f7c:	00c42023          	sw	a2,0(s0)
    6f80:	fff68693          	add	a3,a3,-1
    6f84:	00d42423          	sw	a3,8(s0)
    6f88:	01370023          	sb	s3,0(a4)
    6f8c:	01442703          	lw	a4,20(s0)
    6f90:	00178793          	add	a5,a5,1
    6f94:	0cf70263          	beq	a4,a5,7058 <__swbuf_r+0x150>
    6f98:	00c45783          	lhu	a5,12(s0)
    6f9c:	0017f793          	and	a5,a5,1
    6fa0:	0c079a63          	bnez	a5,7074 <__swbuf_r+0x16c>
    6fa4:	00c12983          	lw	s3,12(sp)
    6fa8:	01c12083          	lw	ra,28(sp)
    6fac:	01812403          	lw	s0,24(sp)
    6fb0:	01012903          	lw	s2,16(sp)
    6fb4:	00048513          	mv	a0,s1
    6fb8:	01412483          	lw	s1,20(sp)
    6fbc:	02010113          	add	sp,sp,32
    6fc0:	00008067          	ret
    6fc4:	00040593          	mv	a1,s0
    6fc8:	00090513          	mv	a0,s2
    6fcc:	0cc000ef          	jal	7098 <__swsetup_r>
    6fd0:	08051e63          	bnez	a0,706c <__swbuf_r+0x164>
    6fd4:	00c41703          	lh	a4,12(s0)
    6fd8:	01312623          	sw	s3,12(sp)
    6fdc:	01042783          	lw	a5,16(s0)
    6fe0:	01271693          	sll	a3,a4,0x12
    6fe4:	0ff4f993          	zext.b	s3,s1
    6fe8:	0ff4f493          	zext.b	s1,s1
    6fec:	f606cce3          	bltz	a3,6f64 <__swbuf_r+0x5c>
    6ff0:	06442683          	lw	a3,100(s0)
    6ff4:	ffffe637          	lui	a2,0xffffe
    6ff8:	000025b7          	lui	a1,0x2
    6ffc:	00b76733          	or	a4,a4,a1
    7000:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7004:	00c6f6b3          	and	a3,a3,a2
    7008:	00e41623          	sh	a4,12(s0)
    700c:	00042703          	lw	a4,0(s0)
    7010:	06d42223          	sw	a3,100(s0)
    7014:	01442683          	lw	a3,20(s0)
    7018:	40f707b3          	sub	a5,a4,a5
    701c:	f4d7cce3          	blt	a5,a3,6f74 <__swbuf_r+0x6c>
    7020:	00040593          	mv	a1,s0
    7024:	00090513          	mv	a0,s2
    7028:	b34ff0ef          	jal	635c <_fflush_r>
    702c:	02051e63          	bnez	a0,7068 <__swbuf_r+0x160>
    7030:	00042703          	lw	a4,0(s0)
    7034:	00842683          	lw	a3,8(s0)
    7038:	00100793          	li	a5,1
    703c:	00170613          	add	a2,a4,1
    7040:	fff68693          	add	a3,a3,-1
    7044:	00c42023          	sw	a2,0(s0)
    7048:	00d42423          	sw	a3,8(s0)
    704c:	01370023          	sb	s3,0(a4)
    7050:	01442703          	lw	a4,20(s0)
    7054:	f4f712e3          	bne	a4,a5,6f98 <__swbuf_r+0x90>
    7058:	00040593          	mv	a1,s0
    705c:	00090513          	mv	a0,s2
    7060:	afcff0ef          	jal	635c <_fflush_r>
    7064:	f40500e3          	beqz	a0,6fa4 <__swbuf_r+0x9c>
    7068:	00c12983          	lw	s3,12(sp)
    706c:	fff00493          	li	s1,-1
    7070:	f39ff06f          	j	6fa8 <__swbuf_r+0xa0>
    7074:	00a00793          	li	a5,10
    7078:	f2f496e3          	bne	s1,a5,6fa4 <__swbuf_r+0x9c>
    707c:	00040593          	mv	a1,s0
    7080:	00090513          	mv	a0,s2
    7084:	ad8ff0ef          	jal	635c <_fflush_r>
    7088:	f0050ee3          	beqz	a0,6fa4 <__swbuf_r+0x9c>
    708c:	fddff06f          	j	7068 <__swbuf_r+0x160>
    7090:	dc8ff0ef          	jal	6658 <__sinit>
    7094:	ea1ff06f          	j	6f34 <__swbuf_r+0x2c>

00007098 <__swsetup_r>:
    7098:	ff010113          	add	sp,sp,-16
    709c:	00812423          	sw	s0,8(sp)
    70a0:	00912223          	sw	s1,4(sp)
    70a4:	00112623          	sw	ra,12(sp)
    70a8:	7fff9797          	auipc	a5,0x7fff9
    70ac:	6607a783          	lw	a5,1632(a5) # 80000708 <_impure_ptr>
    70b0:	00050493          	mv	s1,a0
    70b4:	00058413          	mv	s0,a1
    70b8:	00078663          	beqz	a5,70c4 <__swsetup_r+0x2c>
    70bc:	0347a703          	lw	a4,52(a5)
    70c0:	0e070c63          	beqz	a4,71b8 <__swsetup_r+0x120>
    70c4:	00c41783          	lh	a5,12(s0)
    70c8:	0087f713          	and	a4,a5,8
    70cc:	06070a63          	beqz	a4,7140 <__swsetup_r+0xa8>
    70d0:	01042703          	lw	a4,16(s0)
    70d4:	08070663          	beqz	a4,7160 <__swsetup_r+0xc8>
    70d8:	0017f693          	and	a3,a5,1
    70dc:	02068863          	beqz	a3,710c <__swsetup_r+0x74>
    70e0:	01442683          	lw	a3,20(s0)
    70e4:	00042423          	sw	zero,8(s0)
    70e8:	00000513          	li	a0,0
    70ec:	40d006b3          	neg	a3,a3
    70f0:	00d42c23          	sw	a3,24(s0)
    70f4:	02070a63          	beqz	a4,7128 <__swsetup_r+0x90>
    70f8:	00c12083          	lw	ra,12(sp)
    70fc:	00812403          	lw	s0,8(sp)
    7100:	00412483          	lw	s1,4(sp)
    7104:	01010113          	add	sp,sp,16
    7108:	00008067          	ret
    710c:	0027f693          	and	a3,a5,2
    7110:	00000613          	li	a2,0
    7114:	00069463          	bnez	a3,711c <__swsetup_r+0x84>
    7118:	01442603          	lw	a2,20(s0)
    711c:	00c42423          	sw	a2,8(s0)
    7120:	00000513          	li	a0,0
    7124:	fc071ae3          	bnez	a4,70f8 <__swsetup_r+0x60>
    7128:	0807f713          	and	a4,a5,128
    712c:	fc0706e3          	beqz	a4,70f8 <__swsetup_r+0x60>
    7130:	0407e793          	or	a5,a5,64
    7134:	00f41623          	sh	a5,12(s0)
    7138:	fff00513          	li	a0,-1
    713c:	fbdff06f          	j	70f8 <__swsetup_r+0x60>
    7140:	0107f713          	and	a4,a5,16
    7144:	08070063          	beqz	a4,71c4 <__swsetup_r+0x12c>
    7148:	0047f713          	and	a4,a5,4
    714c:	02071c63          	bnez	a4,7184 <__swsetup_r+0xec>
    7150:	01042703          	lw	a4,16(s0)
    7154:	0087e793          	or	a5,a5,8
    7158:	00f41623          	sh	a5,12(s0)
    715c:	f6071ee3          	bnez	a4,70d8 <__swsetup_r+0x40>
    7160:	2807f693          	and	a3,a5,640
    7164:	20000613          	li	a2,512
    7168:	f6c688e3          	beq	a3,a2,70d8 <__swsetup_r+0x40>
    716c:	00040593          	mv	a1,s0
    7170:	00048513          	mv	a0,s1
    7174:	6cc030ef          	jal	a840 <__smakebuf_r>
    7178:	00c41783          	lh	a5,12(s0)
    717c:	01042703          	lw	a4,16(s0)
    7180:	f59ff06f          	j	70d8 <__swsetup_r+0x40>
    7184:	03042583          	lw	a1,48(s0)
    7188:	00058e63          	beqz	a1,71a4 <__swsetup_r+0x10c>
    718c:	04040713          	add	a4,s0,64
    7190:	00e58863          	beq	a1,a4,71a0 <__swsetup_r+0x108>
    7194:	00048513          	mv	a0,s1
    7198:	cf1f90ef          	jal	e88 <_free_r>
    719c:	00c41783          	lh	a5,12(s0)
    71a0:	02042823          	sw	zero,48(s0)
    71a4:	01042703          	lw	a4,16(s0)
    71a8:	fdb7f793          	and	a5,a5,-37
    71ac:	00042223          	sw	zero,4(s0)
    71b0:	00e42023          	sw	a4,0(s0)
    71b4:	fa1ff06f          	j	7154 <__swsetup_r+0xbc>
    71b8:	00078513          	mv	a0,a5
    71bc:	c9cff0ef          	jal	6658 <__sinit>
    71c0:	f05ff06f          	j	70c4 <__swsetup_r+0x2c>
    71c4:	00900713          	li	a4,9
    71c8:	00e4a023          	sw	a4,0(s1)
    71cc:	0407e793          	or	a5,a5,64
    71d0:	00f41623          	sh	a5,12(s0)
    71d4:	fff00513          	li	a0,-1
    71d8:	f21ff06f          	j	70f8 <__swsetup_r+0x60>

000071dc <__fputwc>:
    71dc:	fc010113          	add	sp,sp,-64
    71e0:	02812c23          	sw	s0,56(sp)
    71e4:	03412423          	sw	s4,40(sp)
    71e8:	03512223          	sw	s5,36(sp)
    71ec:	02112e23          	sw	ra,60(sp)
    71f0:	02912a23          	sw	s1,52(sp)
    71f4:	03312623          	sw	s3,44(sp)
    71f8:	00050a13          	mv	s4,a0
    71fc:	00058a93          	mv	s5,a1
    7200:	00060413          	mv	s0,a2
    7204:	374000ef          	jal	7578 <__locale_mb_cur_max>
    7208:	00100793          	li	a5,1
    720c:	02f51663          	bne	a0,a5,7238 <__fputwc+0x5c>
    7210:	fffa8793          	add	a5,s5,-1
    7214:	0fe00713          	li	a4,254
    7218:	02f76063          	bltu	a4,a5,7238 <__fputwc+0x5c>
    721c:	03212823          	sw	s2,48(sp)
    7220:	03612023          	sw	s6,32(sp)
    7224:	01712e23          	sw	s7,28(sp)
    7228:	01510423          	sb	s5,8(sp)
    722c:	00100993          	li	s3,1
    7230:	00810493          	add	s1,sp,8
    7234:	0380006f          	j	726c <__fputwc+0x90>
    7238:	00810493          	add	s1,sp,8
    723c:	05c40693          	add	a3,s0,92
    7240:	000a8613          	mv	a2,s5
    7244:	00048593          	mv	a1,s1
    7248:	000a0513          	mv	a0,s4
    724c:	3e8030ef          	jal	a634 <_wcrtomb_r>
    7250:	fff00793          	li	a5,-1
    7254:	00050993          	mv	s3,a0
    7258:	0cf50a63          	beq	a0,a5,732c <__fputwc+0x150>
    725c:	0a050663          	beqz	a0,7308 <__fputwc+0x12c>
    7260:	03212823          	sw	s2,48(sp)
    7264:	03612023          	sw	s6,32(sp)
    7268:	01712e23          	sw	s7,28(sp)
    726c:	00000913          	li	s2,0
    7270:	fff00b13          	li	s6,-1
    7274:	00a00b93          	li	s7,10
    7278:	0200006f          	j	7298 <__fputwc+0xbc>
    727c:	00042783          	lw	a5,0(s0)
    7280:	00178693          	add	a3,a5,1
    7284:	00d42023          	sw	a3,0(s0)
    7288:	00e78023          	sb	a4,0(a5)
    728c:	00190913          	add	s2,s2,1
    7290:	00148493          	add	s1,s1,1
    7294:	07397463          	bgeu	s2,s3,72fc <__fputwc+0x120>
    7298:	00842783          	lw	a5,8(s0)
    729c:	0004c703          	lbu	a4,0(s1)
    72a0:	fff78793          	add	a5,a5,-1
    72a4:	00f42423          	sw	a5,8(s0)
    72a8:	fc07dae3          	bgez	a5,727c <__fputwc+0xa0>
    72ac:	01842683          	lw	a3,24(s0)
    72b0:	00040613          	mv	a2,s0
    72b4:	00070593          	mv	a1,a4
    72b8:	000a0513          	mv	a0,s4
    72bc:	00d7c463          	blt	a5,a3,72c4 <__fputwc+0xe8>
    72c0:	fb771ee3          	bne	a4,s7,727c <__fputwc+0xa0>
    72c4:	c45ff0ef          	jal	6f08 <__swbuf_r>
    72c8:	fd6512e3          	bne	a0,s6,728c <__fputwc+0xb0>
    72cc:	03012903          	lw	s2,48(sp)
    72d0:	02012b03          	lw	s6,32(sp)
    72d4:	01c12b83          	lw	s7,28(sp)
    72d8:	03c12083          	lw	ra,60(sp)
    72dc:	03812403          	lw	s0,56(sp)
    72e0:	03412483          	lw	s1,52(sp)
    72e4:	02c12983          	lw	s3,44(sp)
    72e8:	02812a03          	lw	s4,40(sp)
    72ec:	02412a83          	lw	s5,36(sp)
    72f0:	fff00513          	li	a0,-1
    72f4:	04010113          	add	sp,sp,64
    72f8:	00008067          	ret
    72fc:	03012903          	lw	s2,48(sp)
    7300:	02012b03          	lw	s6,32(sp)
    7304:	01c12b83          	lw	s7,28(sp)
    7308:	03c12083          	lw	ra,60(sp)
    730c:	03812403          	lw	s0,56(sp)
    7310:	03412483          	lw	s1,52(sp)
    7314:	02c12983          	lw	s3,44(sp)
    7318:	02812a03          	lw	s4,40(sp)
    731c:	000a8513          	mv	a0,s5
    7320:	02412a83          	lw	s5,36(sp)
    7324:	04010113          	add	sp,sp,64
    7328:	00008067          	ret
    732c:	00c45783          	lhu	a5,12(s0)
    7330:	0407e793          	or	a5,a5,64
    7334:	00f41623          	sh	a5,12(s0)
    7338:	fa1ff06f          	j	72d8 <__fputwc+0xfc>

0000733c <_fputwc_r>:
    733c:	06462783          	lw	a5,100(a2)
    7340:	fe010113          	add	sp,sp,-32
    7344:	00812c23          	sw	s0,24(sp)
    7348:	00912a23          	sw	s1,20(sp)
    734c:	0017f713          	and	a4,a5,1
    7350:	00112e23          	sw	ra,28(sp)
    7354:	00c61783          	lh	a5,12(a2)
    7358:	00060413          	mv	s0,a2
    735c:	00050493          	mv	s1,a0
    7360:	00071663          	bnez	a4,736c <_fputwc_r+0x30>
    7364:	2007f713          	and	a4,a5,512
    7368:	08070463          	beqz	a4,73f0 <_fputwc_r+0xb4>
    736c:	01279713          	sll	a4,a5,0x12
    7370:	02074063          	bltz	a4,7390 <_fputwc_r+0x54>
    7374:	06442703          	lw	a4,100(s0)
    7378:	000026b7          	lui	a3,0x2
    737c:	00d7e7b3          	or	a5,a5,a3
    7380:	000026b7          	lui	a3,0x2
    7384:	00d76733          	or	a4,a4,a3
    7388:	00f41623          	sh	a5,12(s0)
    738c:	06e42223          	sw	a4,100(s0)
    7390:	00048513          	mv	a0,s1
    7394:	00040613          	mv	a2,s0
    7398:	e45ff0ef          	jal	71dc <__fputwc>
    739c:	06442783          	lw	a5,100(s0)
    73a0:	00050493          	mv	s1,a0
    73a4:	0017f793          	and	a5,a5,1
    73a8:	00079863          	bnez	a5,73b8 <_fputwc_r+0x7c>
    73ac:	00c45783          	lhu	a5,12(s0)
    73b0:	2007f793          	and	a5,a5,512
    73b4:	00078e63          	beqz	a5,73d0 <_fputwc_r+0x94>
    73b8:	01c12083          	lw	ra,28(sp)
    73bc:	01812403          	lw	s0,24(sp)
    73c0:	00048513          	mv	a0,s1
    73c4:	01412483          	lw	s1,20(sp)
    73c8:	02010113          	add	sp,sp,32
    73cc:	00008067          	ret
    73d0:	05842503          	lw	a0,88(s0)
    73d4:	e60f90ef          	jal	a34 <__retarget_lock_release_recursive>
    73d8:	01c12083          	lw	ra,28(sp)
    73dc:	01812403          	lw	s0,24(sp)
    73e0:	00048513          	mv	a0,s1
    73e4:	01412483          	lw	s1,20(sp)
    73e8:	02010113          	add	sp,sp,32
    73ec:	00008067          	ret
    73f0:	05862503          	lw	a0,88(a2)
    73f4:	00b12623          	sw	a1,12(sp)
    73f8:	e38f90ef          	jal	a30 <__retarget_lock_acquire_recursive>
    73fc:	00c41783          	lh	a5,12(s0)
    7400:	00c12583          	lw	a1,12(sp)
    7404:	f69ff06f          	j	736c <_fputwc_r+0x30>

00007408 <memchr>:
    7408:	00357793          	and	a5,a0,3
    740c:	0ff5f693          	zext.b	a3,a1
    7410:	02078a63          	beqz	a5,7444 <memchr+0x3c>
    7414:	fff60793          	add	a5,a2,-1
    7418:	02060e63          	beqz	a2,7454 <memchr+0x4c>
    741c:	fff00613          	li	a2,-1
    7420:	0180006f          	j	7438 <memchr+0x30>
    7424:	00150513          	add	a0,a0,1
    7428:	00357713          	and	a4,a0,3
    742c:	00070e63          	beqz	a4,7448 <memchr+0x40>
    7430:	fff78793          	add	a5,a5,-1
    7434:	02c78063          	beq	a5,a2,7454 <memchr+0x4c>
    7438:	00054703          	lbu	a4,0(a0)
    743c:	fed714e3          	bne	a4,a3,7424 <memchr+0x1c>
    7440:	00008067          	ret
    7444:	00060793          	mv	a5,a2
    7448:	00300713          	li	a4,3
    744c:	00f76863          	bltu	a4,a5,745c <memchr+0x54>
    7450:	06079063          	bnez	a5,74b0 <memchr+0xa8>
    7454:	00000513          	li	a0,0
    7458:	00008067          	ret
    745c:	0ff5f593          	zext.b	a1,a1
    7460:	00859713          	sll	a4,a1,0x8
    7464:	00b705b3          	add	a1,a4,a1
    7468:	01059713          	sll	a4,a1,0x10
    746c:	feff08b7          	lui	a7,0xfeff0
    7470:	80808837          	lui	a6,0x80808
    7474:	00e585b3          	add	a1,a1,a4
    7478:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    747c:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7480:	00300313          	li	t1,3
    7484:	0100006f          	j	7494 <memchr+0x8c>
    7488:	ffc78793          	add	a5,a5,-4
    748c:	00450513          	add	a0,a0,4
    7490:	fcf370e3          	bgeu	t1,a5,7450 <memchr+0x48>
    7494:	00052703          	lw	a4,0(a0)
    7498:	00e5c733          	xor	a4,a1,a4
    749c:	01170633          	add	a2,a4,a7
    74a0:	fff74713          	not	a4,a4
    74a4:	00e67733          	and	a4,a2,a4
    74a8:	01077733          	and	a4,a4,a6
    74ac:	fc070ee3          	beqz	a4,7488 <memchr+0x80>
    74b0:	00f507b3          	add	a5,a0,a5
    74b4:	00c0006f          	j	74c0 <memchr+0xb8>
    74b8:	00150513          	add	a0,a0,1
    74bc:	f8f50ce3          	beq	a0,a5,7454 <memchr+0x4c>
    74c0:	00054703          	lbu	a4,0(a0)
    74c4:	fed71ae3          	bne	a4,a3,74b8 <memchr+0xb0>
    74c8:	00008067          	ret

000074cc <strncpy>:
    74cc:	00a5e7b3          	or	a5,a1,a0
    74d0:	0037f793          	and	a5,a5,3
    74d4:	00079663          	bnez	a5,74e0 <strncpy+0x14>
    74d8:	00300793          	li	a5,3
    74dc:	04c7e663          	bltu	a5,a2,7528 <strncpy+0x5c>
    74e0:	00050713          	mv	a4,a0
    74e4:	01c0006f          	j	7500 <strncpy+0x34>
    74e8:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x673>
    74ec:	fff60813          	add	a6,a2,-1
    74f0:	fed78fa3          	sb	a3,-1(a5)
    74f4:	00068e63          	beqz	a3,7510 <strncpy+0x44>
    74f8:	00078713          	mv	a4,a5
    74fc:	00080613          	mv	a2,a6
    7500:	00158593          	add	a1,a1,1
    7504:	00170793          	add	a5,a4,1
    7508:	fe0610e3          	bnez	a2,74e8 <strncpy+0x1c>
    750c:	00008067          	ret
    7510:	00c70733          	add	a4,a4,a2
    7514:	06080063          	beqz	a6,7574 <strncpy+0xa8>
    7518:	00178793          	add	a5,a5,1
    751c:	fe078fa3          	sb	zero,-1(a5)
    7520:	fee79ce3          	bne	a5,a4,7518 <strncpy+0x4c>
    7524:	00008067          	ret
    7528:	feff0337          	lui	t1,0xfeff0
    752c:	808088b7          	lui	a7,0x80808
    7530:	00050713          	mv	a4,a0
    7534:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7538:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    753c:	00300e13          	li	t3,3
    7540:	0180006f          	j	7558 <strncpy+0x8c>
    7544:	00d72023          	sw	a3,0(a4)
    7548:	ffc60613          	add	a2,a2,-4
    754c:	00470713          	add	a4,a4,4
    7550:	00458593          	add	a1,a1,4
    7554:	face76e3          	bgeu	t3,a2,7500 <strncpy+0x34>
    7558:	0005a683          	lw	a3,0(a1)
    755c:	006687b3          	add	a5,a3,t1
    7560:	fff6c813          	not	a6,a3
    7564:	0107f7b3          	and	a5,a5,a6
    7568:	0117f7b3          	and	a5,a5,a7
    756c:	fc078ce3          	beqz	a5,7544 <strncpy+0x78>
    7570:	f91ff06f          	j	7500 <strncpy+0x34>
    7574:	00008067          	ret

00007578 <__locale_mb_cur_max>:
    7578:	7fff9517          	auipc	a0,0x7fff9
    757c:	0e454503          	lbu	a0,228(a0) # 8000065c <__global_locale+0x128>
    7580:	00008067          	ret

00007584 <_localeconv_r>:
    7584:	7fff9517          	auipc	a0,0x7fff9
    7588:	0a050513          	add	a0,a0,160 # 80000624 <__global_locale+0xf0>
    758c:	00008067          	ret

00007590 <_close_r>:
    7590:	ff010113          	add	sp,sp,-16
    7594:	00812423          	sw	s0,8(sp)
    7598:	00050413          	mv	s0,a0
    759c:	00058513          	mv	a0,a1
    75a0:	7fff9797          	auipc	a5,0x7fff9
    75a4:	1607ac23          	sw	zero,376(a5) # 80000718 <errno>
    75a8:	00112623          	sw	ra,12(sp)
    75ac:	85cf90ef          	jal	608 <_close>
    75b0:	fff00793          	li	a5,-1
    75b4:	00f50a63          	beq	a0,a5,75c8 <_close_r+0x38>
    75b8:	00c12083          	lw	ra,12(sp)
    75bc:	00812403          	lw	s0,8(sp)
    75c0:	01010113          	add	sp,sp,16
    75c4:	00008067          	ret
    75c8:	7fff9797          	auipc	a5,0x7fff9
    75cc:	1507a783          	lw	a5,336(a5) # 80000718 <errno>
    75d0:	fe0784e3          	beqz	a5,75b8 <_close_r+0x28>
    75d4:	00c12083          	lw	ra,12(sp)
    75d8:	00f42023          	sw	a5,0(s0)
    75dc:	00812403          	lw	s0,8(sp)
    75e0:	01010113          	add	sp,sp,16
    75e4:	00008067          	ret

000075e8 <_lseek_r>:
    75e8:	ff010113          	add	sp,sp,-16
    75ec:	00058713          	mv	a4,a1
    75f0:	00812423          	sw	s0,8(sp)
    75f4:	00060593          	mv	a1,a2
    75f8:	00050413          	mv	s0,a0
    75fc:	00068613          	mv	a2,a3
    7600:	00070513          	mv	a0,a4
    7604:	7fff9797          	auipc	a5,0x7fff9
    7608:	1007aa23          	sw	zero,276(a5) # 80000718 <errno>
    760c:	00112623          	sw	ra,12(sp)
    7610:	834f90ef          	jal	644 <_lseek>
    7614:	fff00793          	li	a5,-1
    7618:	00f50a63          	beq	a0,a5,762c <_lseek_r+0x44>
    761c:	00c12083          	lw	ra,12(sp)
    7620:	00812403          	lw	s0,8(sp)
    7624:	01010113          	add	sp,sp,16
    7628:	00008067          	ret
    762c:	7fff9797          	auipc	a5,0x7fff9
    7630:	0ec7a783          	lw	a5,236(a5) # 80000718 <errno>
    7634:	fe0784e3          	beqz	a5,761c <_lseek_r+0x34>
    7638:	00c12083          	lw	ra,12(sp)
    763c:	00f42023          	sw	a5,0(s0)
    7640:	00812403          	lw	s0,8(sp)
    7644:	01010113          	add	sp,sp,16
    7648:	00008067          	ret

0000764c <_read_r>:
    764c:	ff010113          	add	sp,sp,-16
    7650:	00058713          	mv	a4,a1
    7654:	00812423          	sw	s0,8(sp)
    7658:	00060593          	mv	a1,a2
    765c:	00050413          	mv	s0,a0
    7660:	00068613          	mv	a2,a3
    7664:	00070513          	mv	a0,a4
    7668:	7fff9797          	auipc	a5,0x7fff9
    766c:	0a07a823          	sw	zero,176(a5) # 80000718 <errno>
    7670:	00112623          	sw	ra,12(sp)
    7674:	fd9f80ef          	jal	64c <_read>
    7678:	fff00793          	li	a5,-1
    767c:	00f50a63          	beq	a0,a5,7690 <_read_r+0x44>
    7680:	00c12083          	lw	ra,12(sp)
    7684:	00812403          	lw	s0,8(sp)
    7688:	01010113          	add	sp,sp,16
    768c:	00008067          	ret
    7690:	7fff9797          	auipc	a5,0x7fff9
    7694:	0887a783          	lw	a5,136(a5) # 80000718 <errno>
    7698:	fe0784e3          	beqz	a5,7680 <_read_r+0x34>
    769c:	00c12083          	lw	ra,12(sp)
    76a0:	00f42023          	sw	a5,0(s0)
    76a4:	00812403          	lw	s0,8(sp)
    76a8:	01010113          	add	sp,sp,16
    76ac:	00008067          	ret

000076b0 <_sbrk_r>:
    76b0:	ff010113          	add	sp,sp,-16
    76b4:	00812423          	sw	s0,8(sp)
    76b8:	00050413          	mv	s0,a0
    76bc:	00058513          	mv	a0,a1
    76c0:	7fff9797          	auipc	a5,0x7fff9
    76c4:	0407ac23          	sw	zero,88(a5) # 80000718 <errno>
    76c8:	00112623          	sw	ra,12(sp)
    76cc:	900f90ef          	jal	7cc <_sbrk>
    76d0:	fff00793          	li	a5,-1
    76d4:	00f50a63          	beq	a0,a5,76e8 <_sbrk_r+0x38>
    76d8:	00c12083          	lw	ra,12(sp)
    76dc:	00812403          	lw	s0,8(sp)
    76e0:	01010113          	add	sp,sp,16
    76e4:	00008067          	ret
    76e8:	7fff9797          	auipc	a5,0x7fff9
    76ec:	0307a783          	lw	a5,48(a5) # 80000718 <errno>
    76f0:	fe0784e3          	beqz	a5,76d8 <_sbrk_r+0x28>
    76f4:	00c12083          	lw	ra,12(sp)
    76f8:	00f42023          	sw	a5,0(s0)
    76fc:	00812403          	lw	s0,8(sp)
    7700:	01010113          	add	sp,sp,16
    7704:	00008067          	ret

00007708 <_write_r>:
    7708:	ff010113          	add	sp,sp,-16
    770c:	00058713          	mv	a4,a1
    7710:	00812423          	sw	s0,8(sp)
    7714:	00060593          	mv	a1,a2
    7718:	00050413          	mv	s0,a0
    771c:	00068613          	mv	a2,a3
    7720:	00070513          	mv	a0,a4
    7724:	7fff9797          	auipc	a5,0x7fff9
    7728:	fe07aa23          	sw	zero,-12(a5) # 80000718 <errno>
    772c:	00112623          	sw	ra,12(sp)
    7730:	ff9f80ef          	jal	728 <_write>
    7734:	fff00793          	li	a5,-1
    7738:	00f50a63          	beq	a0,a5,774c <_write_r+0x44>
    773c:	00c12083          	lw	ra,12(sp)
    7740:	00812403          	lw	s0,8(sp)
    7744:	01010113          	add	sp,sp,16
    7748:	00008067          	ret
    774c:	7fff9797          	auipc	a5,0x7fff9
    7750:	fcc7a783          	lw	a5,-52(a5) # 80000718 <errno>
    7754:	fe0784e3          	beqz	a5,773c <_write_r+0x34>
    7758:	00c12083          	lw	ra,12(sp)
    775c:	00f42023          	sw	a5,0(s0)
    7760:	00812403          	lw	s0,8(sp)
    7764:	01010113          	add	sp,sp,16
    7768:	00008067          	ret

0000776c <memmove>:
    776c:	02a5f663          	bgeu	a1,a0,7798 <memmove+0x2c>
    7770:	00c58733          	add	a4,a1,a2
    7774:	02e57263          	bgeu	a0,a4,7798 <memmove+0x2c>
    7778:	00c507b3          	add	a5,a0,a2
    777c:	04060663          	beqz	a2,77c8 <memmove+0x5c>
    7780:	fff74683          	lbu	a3,-1(a4)
    7784:	fff78793          	add	a5,a5,-1
    7788:	fff70713          	add	a4,a4,-1
    778c:	00d78023          	sb	a3,0(a5)
    7790:	fef518e3          	bne	a0,a5,7780 <memmove+0x14>
    7794:	00008067          	ret
    7798:	00f00793          	li	a5,15
    779c:	02c7e863          	bltu	a5,a2,77cc <memmove+0x60>
    77a0:	00050793          	mv	a5,a0
    77a4:	fff60693          	add	a3,a2,-1
    77a8:	0c060263          	beqz	a2,786c <memmove+0x100>
    77ac:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x675>
    77b0:	00d786b3          	add	a3,a5,a3
    77b4:	0005c703          	lbu	a4,0(a1)
    77b8:	00178793          	add	a5,a5,1
    77bc:	00158593          	add	a1,a1,1
    77c0:	fee78fa3          	sb	a4,-1(a5)
    77c4:	fed798e3          	bne	a5,a3,77b4 <memmove+0x48>
    77c8:	00008067          	ret
    77cc:	00b567b3          	or	a5,a0,a1
    77d0:	0037f793          	and	a5,a5,3
    77d4:	08079663          	bnez	a5,7860 <memmove+0xf4>
    77d8:	ff060893          	add	a7,a2,-16
    77dc:	ff08f893          	and	a7,a7,-16
    77e0:	01088893          	add	a7,a7,16
    77e4:	011506b3          	add	a3,a0,a7
    77e8:	00058713          	mv	a4,a1
    77ec:	00050793          	mv	a5,a0
    77f0:	00072803          	lw	a6,0(a4)
    77f4:	01070713          	add	a4,a4,16
    77f8:	01078793          	add	a5,a5,16
    77fc:	ff07a823          	sw	a6,-16(a5)
    7800:	ff472803          	lw	a6,-12(a4)
    7804:	ff07aa23          	sw	a6,-12(a5)
    7808:	ff872803          	lw	a6,-8(a4)
    780c:	ff07ac23          	sw	a6,-8(a5)
    7810:	ffc72803          	lw	a6,-4(a4)
    7814:	ff07ae23          	sw	a6,-4(a5)
    7818:	fcd79ce3          	bne	a5,a3,77f0 <memmove+0x84>
    781c:	00c67813          	and	a6,a2,12
    7820:	011585b3          	add	a1,a1,a7
    7824:	00f67713          	and	a4,a2,15
    7828:	04080463          	beqz	a6,7870 <memmove+0x104>
    782c:	ffc70813          	add	a6,a4,-4
    7830:	ffc87813          	and	a6,a6,-4
    7834:	00480813          	add	a6,a6,4
    7838:	010687b3          	add	a5,a3,a6
    783c:	00058713          	mv	a4,a1
    7840:	00072883          	lw	a7,0(a4)
    7844:	00468693          	add	a3,a3,4
    7848:	00470713          	add	a4,a4,4
    784c:	ff16ae23          	sw	a7,-4(a3)
    7850:	fef698e3          	bne	a3,a5,7840 <memmove+0xd4>
    7854:	00367613          	and	a2,a2,3
    7858:	010585b3          	add	a1,a1,a6
    785c:	f49ff06f          	j	77a4 <memmove+0x38>
    7860:	fff60693          	add	a3,a2,-1
    7864:	00050793          	mv	a5,a0
    7868:	f45ff06f          	j	77ac <memmove+0x40>
    786c:	00008067          	ret
    7870:	00070613          	mv	a2,a4
    7874:	f31ff06f          	j	77a4 <memmove+0x38>

00007878 <frexp>:
    7878:	ff010113          	add	sp,sp,-16
    787c:	00912223          	sw	s1,4(sp)
    7880:	800004b7          	lui	s1,0x80000
    7884:	00812423          	sw	s0,8(sp)
    7888:	00112623          	sw	ra,12(sp)
    788c:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7890:	00060413          	mv	s0,a2
    7894:	00062023          	sw	zero,0(a2)
    7898:	00b4f6b3          	and	a3,s1,a1
    789c:	7ff00637          	lui	a2,0x7ff00
    78a0:	00058793          	mv	a5,a1
    78a4:	00050713          	mv	a4,a0
    78a8:	04c6f063          	bgeu	a3,a2,78e8 <frexp+0x70>
    78ac:	00a6e633          	or	a2,a3,a0
    78b0:	02060c63          	beqz	a2,78e8 <frexp+0x70>
    78b4:	0145d613          	srl	a2,a1,0x14
    78b8:	7ff67613          	and	a2,a2,2047
    78bc:	04060463          	beqz	a2,7904 <frexp+0x8c>
    78c0:	00000593          	li	a1,0
    78c4:	80100637          	lui	a2,0x80100
    78c8:	4146d693          	sra	a3,a3,0x14
    78cc:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    78d0:	c0268693          	add	a3,a3,-1022
    78d4:	00c7f7b3          	and	a5,a5,a2
    78d8:	00b686b3          	add	a3,a3,a1
    78dc:	3fe00637          	lui	a2,0x3fe00
    78e0:	00c7e7b3          	or	a5,a5,a2
    78e4:	00d42023          	sw	a3,0(s0)
    78e8:	00c12083          	lw	ra,12(sp)
    78ec:	00812403          	lw	s0,8(sp)
    78f0:	00412483          	lw	s1,4(sp)
    78f4:	00070513          	mv	a0,a4
    78f8:	00078593          	mv	a1,a5
    78fc:	01010113          	add	sp,sp,16
    7900:	00008067          	ret
    7904:	7fff9797          	auipc	a5,0x7fff9
    7908:	dbc78793          	add	a5,a5,-580 # 800006c0 <__global_locale+0x18c>
    790c:	0047a683          	lw	a3,4(a5)
    7910:	0007a603          	lw	a2,0(a5)
    7914:	009050ef          	jal	d11c <__muldf3>
    7918:	00058793          	mv	a5,a1
    791c:	00b4f6b3          	and	a3,s1,a1
    7920:	00050713          	mv	a4,a0
    7924:	fca00593          	li	a1,-54
    7928:	f9dff06f          	j	78c4 <frexp+0x4c>

0000792c <quorem>:
    792c:	fb010113          	add	sp,sp,-80
    7930:	04912223          	sw	s1,68(sp)
    7934:	01052783          	lw	a5,16(a0)
    7938:	0105a483          	lw	s1,16(a1)
    793c:	04112623          	sw	ra,76(sp)
    7940:	00b12423          	sw	a1,8(sp)
    7944:	2097ca63          	blt	a5,s1,7b58 <quorem+0x22c>
    7948:	fff48493          	add	s1,s1,-1
    794c:	03512a23          	sw	s5,52(sp)
    7950:	03812423          	sw	s8,40(sp)
    7954:	00249a93          	sll	s5,s1,0x2
    7958:	01458c13          	add	s8,a1,20
    795c:	05212023          	sw	s2,64(sp)
    7960:	03312e23          	sw	s3,60(sp)
    7964:	015c0933          	add	s2,s8,s5
    7968:	01450993          	add	s3,a0,20
    796c:	015987b3          	add	a5,s3,s5
    7970:	03712623          	sw	s7,44(sp)
    7974:	00092b83          	lw	s7,0(s2)
    7978:	03912223          	sw	s9,36(sp)
    797c:	0007ac83          	lw	s9,0(a5)
    7980:	001b8b93          	add	s7,s7,1
    7984:	03412c23          	sw	s4,56(sp)
    7988:	000b8593          	mv	a1,s7
    798c:	00050a13          	mv	s4,a0
    7990:	000c8513          	mv	a0,s9
    7994:	04812423          	sw	s0,72(sp)
    7998:	00f12623          	sw	a5,12(sp)
    799c:	675060ef          	jal	e810 <__hidden___udivsi3>
    79a0:	00050413          	mv	s0,a0
    79a4:	0d7cee63          	bltu	s9,s7,7a80 <quorem+0x154>
    79a8:	03a12023          	sw	s10,32(sp)
    79ac:	00010d37          	lui	s10,0x10
    79b0:	01b12e23          	sw	s11,28(sp)
    79b4:	03612823          	sw	s6,48(sp)
    79b8:	000c0a93          	mv	s5,s8
    79bc:	00098d93          	mv	s11,s3
    79c0:	00000c93          	li	s9,0
    79c4:	00000b93          	li	s7,0
    79c8:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    79cc:	000aab03          	lw	s6,0(s5)
    79d0:	00040593          	mv	a1,s0
    79d4:	004d8d93          	add	s11,s11,4
    79d8:	01ab7533          	and	a0,s6,s10
    79dc:	609060ef          	jal	e7e4 <__mulsi3>
    79e0:	00050793          	mv	a5,a0
    79e4:	00040593          	mv	a1,s0
    79e8:	010b5513          	srl	a0,s6,0x10
    79ec:	01978cb3          	add	s9,a5,s9
    79f0:	5f5060ef          	jal	e7e4 <__mulsi3>
    79f4:	ffcda603          	lw	a2,-4(s11)
    79f8:	01acf733          	and	a4,s9,s10
    79fc:	010cdc93          	srl	s9,s9,0x10
    7a00:	01a677b3          	and	a5,a2,s10
    7a04:	40e787b3          	sub	a5,a5,a4
    7a08:	017787b3          	add	a5,a5,s7
    7a0c:	01950533          	add	a0,a0,s9
    7a10:	4107d713          	sra	a4,a5,0x10
    7a14:	01a575b3          	and	a1,a0,s10
    7a18:	01065613          	srl	a2,a2,0x10
    7a1c:	40b70733          	sub	a4,a4,a1
    7a20:	00c70733          	add	a4,a4,a2
    7a24:	01a7f7b3          	and	a5,a5,s10
    7a28:	01071613          	sll	a2,a4,0x10
    7a2c:	00c7e7b3          	or	a5,a5,a2
    7a30:	004a8a93          	add	s5,s5,4
    7a34:	fefdae23          	sw	a5,-4(s11)
    7a38:	01055c93          	srl	s9,a0,0x10
    7a3c:	41075b93          	sra	s7,a4,0x10
    7a40:	f95976e3          	bgeu	s2,s5,79cc <quorem+0xa0>
    7a44:	00c12703          	lw	a4,12(sp)
    7a48:	00072783          	lw	a5,0(a4)
    7a4c:	12079063          	bnez	a5,7b6c <quorem+0x240>
    7a50:	ffc70a93          	add	s5,a4,-4
    7a54:	0159e863          	bltu	s3,s5,7a64 <quorem+0x138>
    7a58:	0180006f          	j	7a70 <quorem+0x144>
    7a5c:	fff48493          	add	s1,s1,-1
    7a60:	0159f863          	bgeu	s3,s5,7a70 <quorem+0x144>
    7a64:	000aa783          	lw	a5,0(s5)
    7a68:	ffca8a93          	add	s5,s5,-4
    7a6c:	fe0788e3          	beqz	a5,7a5c <quorem+0x130>
    7a70:	03012b03          	lw	s6,48(sp)
    7a74:	02012d03          	lw	s10,32(sp)
    7a78:	01c12d83          	lw	s11,28(sp)
    7a7c:	009a2823          	sw	s1,16(s4)
    7a80:	00812583          	lw	a1,8(sp)
    7a84:	000a0513          	mv	a0,s4
    7a88:	1fc020ef          	jal	9c84 <__mcmp>
    7a8c:	08054c63          	bltz	a0,7b24 <quorem+0x1f8>
    7a90:	00010537          	lui	a0,0x10
    7a94:	00098593          	mv	a1,s3
    7a98:	00000713          	li	a4,0
    7a9c:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    7aa0:	0005a683          	lw	a3,0(a1)
    7aa4:	000c2603          	lw	a2,0(s8)
    7aa8:	00458593          	add	a1,a1,4
    7aac:	00a6f7b3          	and	a5,a3,a0
    7ab0:	00a67833          	and	a6,a2,a0
    7ab4:	410787b3          	sub	a5,a5,a6
    7ab8:	00e787b3          	add	a5,a5,a4
    7abc:	4107d713          	sra	a4,a5,0x10
    7ac0:	01065613          	srl	a2,a2,0x10
    7ac4:	0106d693          	srl	a3,a3,0x10
    7ac8:	40c70733          	sub	a4,a4,a2
    7acc:	00d70733          	add	a4,a4,a3
    7ad0:	01071693          	sll	a3,a4,0x10
    7ad4:	00a7f7b3          	and	a5,a5,a0
    7ad8:	00d7e7b3          	or	a5,a5,a3
    7adc:	004c0c13          	add	s8,s8,4
    7ae0:	fef5ae23          	sw	a5,-4(a1)
    7ae4:	41075713          	sra	a4,a4,0x10
    7ae8:	fb897ce3          	bgeu	s2,s8,7aa0 <quorem+0x174>
    7aec:	00249793          	sll	a5,s1,0x2
    7af0:	00f987b3          	add	a5,s3,a5
    7af4:	0007a703          	lw	a4,0(a5)
    7af8:	02071463          	bnez	a4,7b20 <quorem+0x1f4>
    7afc:	ffc78793          	add	a5,a5,-4
    7b00:	00f9e863          	bltu	s3,a5,7b10 <quorem+0x1e4>
    7b04:	0180006f          	j	7b1c <quorem+0x1f0>
    7b08:	fff48493          	add	s1,s1,-1
    7b0c:	00f9f863          	bgeu	s3,a5,7b1c <quorem+0x1f0>
    7b10:	0007a703          	lw	a4,0(a5)
    7b14:	ffc78793          	add	a5,a5,-4
    7b18:	fe0708e3          	beqz	a4,7b08 <quorem+0x1dc>
    7b1c:	009a2823          	sw	s1,16(s4)
    7b20:	00140413          	add	s0,s0,1
    7b24:	04c12083          	lw	ra,76(sp)
    7b28:	00040513          	mv	a0,s0
    7b2c:	04812403          	lw	s0,72(sp)
    7b30:	04012903          	lw	s2,64(sp)
    7b34:	03c12983          	lw	s3,60(sp)
    7b38:	03812a03          	lw	s4,56(sp)
    7b3c:	03412a83          	lw	s5,52(sp)
    7b40:	02c12b83          	lw	s7,44(sp)
    7b44:	02812c03          	lw	s8,40(sp)
    7b48:	02412c83          	lw	s9,36(sp)
    7b4c:	04412483          	lw	s1,68(sp)
    7b50:	05010113          	add	sp,sp,80
    7b54:	00008067          	ret
    7b58:	04c12083          	lw	ra,76(sp)
    7b5c:	04412483          	lw	s1,68(sp)
    7b60:	00000513          	li	a0,0
    7b64:	05010113          	add	sp,sp,80
    7b68:	00008067          	ret
    7b6c:	00812583          	lw	a1,8(sp)
    7b70:	000a0513          	mv	a0,s4
    7b74:	03012b03          	lw	s6,48(sp)
    7b78:	02012d03          	lw	s10,32(sp)
    7b7c:	01c12d83          	lw	s11,28(sp)
    7b80:	104020ef          	jal	9c84 <__mcmp>
    7b84:	f00556e3          	bgez	a0,7a90 <quorem+0x164>
    7b88:	f9dff06f          	j	7b24 <quorem+0x1f8>

00007b8c <_dtoa_r>:
    7b8c:	03852303          	lw	t1,56(a0)
    7b90:	f5010113          	add	sp,sp,-176
    7b94:	0a812423          	sw	s0,168(sp)
    7b98:	0a912223          	sw	s1,164(sp)
    7b9c:	0b212023          	sw	s2,160(sp)
    7ba0:	09412c23          	sw	s4,152(sp)
    7ba4:	07b12e23          	sw	s11,124(sp)
    7ba8:	0a112623          	sw	ra,172(sp)
    7bac:	09312e23          	sw	s3,156(sp)
    7bb0:	09512a23          	sw	s5,148(sp)
    7bb4:	00e12a23          	sw	a4,20(sp)
    7bb8:	00f12623          	sw	a5,12(sp)
    7bbc:	01112423          	sw	a7,8(sp)
    7bc0:	02b12223          	sw	a1,36(sp)
    7bc4:	00c12023          	sw	a2,0(sp)
    7bc8:	00050413          	mv	s0,a0
    7bcc:	00058d93          	mv	s11,a1
    7bd0:	00060493          	mv	s1,a2
    7bd4:	00068a13          	mv	s4,a3
    7bd8:	00080913          	mv	s2,a6
    7bdc:	02030263          	beqz	t1,7c00 <_dtoa_r+0x74>
    7be0:	03c52703          	lw	a4,60(a0)
    7be4:	00100793          	li	a5,1
    7be8:	00030593          	mv	a1,t1
    7bec:	00e797b3          	sll	a5,a5,a4
    7bf0:	00e32223          	sw	a4,4(t1)
    7bf4:	00f32423          	sw	a5,8(t1)
    7bf8:	734010ef          	jal	932c <_Bfree>
    7bfc:	02042c23          	sw	zero,56(s0)
    7c00:	00048993          	mv	s3,s1
    7c04:	00000693          	li	a3,0
    7c08:	0004dc63          	bgez	s1,7c20 <_dtoa_r+0x94>
    7c0c:	00149493          	sll	s1,s1,0x1
    7c10:	0014d793          	srl	a5,s1,0x1
    7c14:	00f12023          	sw	a5,0(sp)
    7c18:	00078993          	mv	s3,a5
    7c1c:	00100693          	li	a3,1
    7c20:	7ff00737          	lui	a4,0x7ff00
    7c24:	00d92023          	sw	a3,0(s2)
    7c28:	00e9f6b3          	and	a3,s3,a4
    7c2c:	64e68463          	beq	a3,a4,8274 <_dtoa_r+0x6e8>
    7c30:	00012483          	lw	s1,0(sp)
    7c34:	000d8513          	mv	a0,s11
    7c38:	00000613          	li	a2,0
    7c3c:	00048593          	mv	a1,s1
    7c40:	00000693          	li	a3,0
    7c44:	01b12c23          	sw	s11,24(sp)
    7c48:	00912e23          	sw	s1,28(sp)
    7c4c:	23c050ef          	jal	ce88 <__eqdf2>
    7c50:	04051c63          	bnez	a0,7ca8 <_dtoa_r+0x11c>
    7c54:	00c12703          	lw	a4,12(sp)
    7c58:	00100793          	li	a5,1
    7c5c:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7c60:	00812703          	lw	a4,8(sp)
    7c64:	00070863          	beqz	a4,7c74 <_dtoa_r+0xe8>
    7c68:	00007797          	auipc	a5,0x7
    7c6c:	da978793          	add	a5,a5,-599 # ea11 <__fini_array_end+0xcd>
    7c70:	00f72023          	sw	a5,0(a4)
    7c74:	00007a97          	auipc	s5,0x7
    7c78:	d9ca8a93          	add	s5,s5,-612 # ea10 <__fini_array_end+0xcc>
    7c7c:	0ac12083          	lw	ra,172(sp)
    7c80:	0a812403          	lw	s0,168(sp)
    7c84:	0a412483          	lw	s1,164(sp)
    7c88:	0a012903          	lw	s2,160(sp)
    7c8c:	09c12983          	lw	s3,156(sp)
    7c90:	09812a03          	lw	s4,152(sp)
    7c94:	07c12d83          	lw	s11,124(sp)
    7c98:	000a8513          	mv	a0,s5
    7c9c:	09412a83          	lw	s5,148(sp)
    7ca0:	0b010113          	add	sp,sp,176
    7ca4:	00008067          	ret
    7ca8:	00048613          	mv	a2,s1
    7cac:	06810713          	add	a4,sp,104
    7cb0:	06c10693          	add	a3,sp,108
    7cb4:	000d8593          	mv	a1,s11
    7cb8:	00040513          	mv	a0,s0
    7cbc:	09612823          	sw	s6,144(sp)
    7cc0:	09712623          	sw	s7,140(sp)
    7cc4:	09812423          	sw	s8,136(sp)
    7cc8:	09912223          	sw	s9,132(sp)
    7ccc:	09a12023          	sw	s10,128(sp)
    7cd0:	0149d913          	srl	s2,s3,0x14
    7cd4:	268020ef          	jal	9f3c <__d2b>
    7cd8:	00050493          	mv	s1,a0
    7cdc:	5c091e63          	bnez	s2,82b8 <_dtoa_r+0x72c>
    7ce0:	06812a83          	lw	s5,104(sp)
    7ce4:	06c12903          	lw	s2,108(sp)
    7ce8:	02000793          	li	a5,32
    7cec:	012a8933          	add	s2,s5,s2
    7cf0:	43290713          	add	a4,s2,1074
    7cf4:	36e7dae3          	bge	a5,a4,8868 <_dtoa_r+0xcdc>
    7cf8:	04000793          	li	a5,64
    7cfc:	40e787b3          	sub	a5,a5,a4
    7d00:	41290513          	add	a0,s2,1042
    7d04:	00f997b3          	sll	a5,s3,a5
    7d08:	00add533          	srl	a0,s11,a0
    7d0c:	00a7e533          	or	a0,a5,a0
    7d10:	634060ef          	jal	e344 <__floatunsidf>
    7d14:	fe1007b7          	lui	a5,0xfe100
    7d18:	00100693          	li	a3,1
    7d1c:	00050713          	mv	a4,a0
    7d20:	00b787b3          	add	a5,a5,a1
    7d24:	fff90913          	add	s2,s2,-1
    7d28:	02d12c23          	sw	a3,56(sp)
    7d2c:	7fff9697          	auipc	a3,0x7fff9
    7d30:	99c68693          	add	a3,a3,-1636 # 800006c8 <__global_locale+0x194>
    7d34:	0006a603          	lw	a2,0(a3)
    7d38:	0046a683          	lw	a3,4(a3)
    7d3c:	00070513          	mv	a0,a4
    7d40:	00078593          	mv	a1,a5
    7d44:	369050ef          	jal	d8ac <__subdf3>
    7d48:	7fff9797          	auipc	a5,0x7fff9
    7d4c:	98878793          	add	a5,a5,-1656 # 800006d0 <__global_locale+0x19c>
    7d50:	0007a603          	lw	a2,0(a5)
    7d54:	0047a683          	lw	a3,4(a5)
    7d58:	3c4050ef          	jal	d11c <__muldf3>
    7d5c:	7fff9797          	auipc	a5,0x7fff9
    7d60:	97c78793          	add	a5,a5,-1668 # 800006d8 <__global_locale+0x1a4>
    7d64:	0007a603          	lw	a2,0(a5)
    7d68:	0047a683          	lw	a3,4(a5)
    7d6c:	7a9030ef          	jal	bd14 <__adddf3>
    7d70:	00050b13          	mv	s6,a0
    7d74:	00090513          	mv	a0,s2
    7d78:	00058993          	mv	s3,a1
    7d7c:	510060ef          	jal	e28c <__floatsidf>
    7d80:	7fff9797          	auipc	a5,0x7fff9
    7d84:	96078793          	add	a5,a5,-1696 # 800006e0 <__global_locale+0x1ac>
    7d88:	0007a603          	lw	a2,0(a5)
    7d8c:	0047a683          	lw	a3,4(a5)
    7d90:	38c050ef          	jal	d11c <__muldf3>
    7d94:	00050613          	mv	a2,a0
    7d98:	00058693          	mv	a3,a1
    7d9c:	000b0513          	mv	a0,s6
    7da0:	00098593          	mv	a1,s3
    7da4:	771030ef          	jal	bd14 <__adddf3>
    7da8:	00050b93          	mv	s7,a0
    7dac:	00058b13          	mv	s6,a1
    7db0:	458060ef          	jal	e208 <__fixdfsi>
    7db4:	00050993          	mv	s3,a0
    7db8:	000b0593          	mv	a1,s6
    7dbc:	000b8513          	mv	a0,s7
    7dc0:	00000613          	li	a2,0
    7dc4:	00000693          	li	a3,0
    7dc8:	24c050ef          	jal	d014 <__ledf2>
    7dcc:	02055063          	bgez	a0,7dec <_dtoa_r+0x260>
    7dd0:	00098513          	mv	a0,s3
    7dd4:	4b8060ef          	jal	e28c <__floatsidf>
    7dd8:	000b8613          	mv	a2,s7
    7ddc:	000b0693          	mv	a3,s6
    7de0:	0a8050ef          	jal	ce88 <__eqdf2>
    7de4:	00a03533          	snez	a0,a0
    7de8:	40a989b3          	sub	s3,s3,a0
    7dec:	412a8ab3          	sub	s5,s5,s2
    7df0:	01600793          	li	a5,22
    7df4:	fffa8b13          	add	s6,s5,-1
    7df8:	2137e2e3          	bltu	a5,s3,87fc <_dtoa_r+0xc70>
    7dfc:	00399713          	sll	a4,s3,0x3
    7e00:	00007797          	auipc	a5,0x7
    7e04:	2a878793          	add	a5,a5,680 # f0a8 <__mprec_tens>
    7e08:	00e787b3          	add	a5,a5,a4
    7e0c:	0007a603          	lw	a2,0(a5)
    7e10:	0047a683          	lw	a3,4(a5)
    7e14:	01812503          	lw	a0,24(sp)
    7e18:	01c12583          	lw	a1,28(sp)
    7e1c:	1f8050ef          	jal	d014 <__ledf2>
    7e20:	220554e3          	bgez	a0,8848 <_dtoa_r+0xcbc>
    7e24:	fff98993          	add	s3,s3,-1
    7e28:	02012a23          	sw	zero,52(sp)
    7e2c:	00012823          	sw	zero,16(sp)
    7e30:	4a0b4863          	bltz	s6,82e0 <_dtoa_r+0x754>
    7e34:	4c09d063          	bgez	s3,82f4 <_dtoa_r+0x768>
    7e38:	01012783          	lw	a5,16(sp)
    7e3c:	03312023          	sw	s3,32(sp)
    7e40:	413787b3          	sub	a5,a5,s3
    7e44:	00f12823          	sw	a5,16(sp)
    7e48:	413007b3          	neg	a5,s3
    7e4c:	02f12823          	sw	a5,48(sp)
    7e50:	00900793          	li	a5,9
    7e54:	00000993          	li	s3,0
    7e58:	4b47e863          	bltu	a5,s4,8308 <_dtoa_r+0x77c>
    7e5c:	00500793          	li	a5,5
    7e60:	2147dae3          	bge	a5,s4,8874 <_dtoa_r+0xce8>
    7e64:	ffca0a13          	add	s4,s4,-4
    7e68:	00300793          	li	a5,3
    7e6c:	00000913          	li	s2,0
    7e70:	66fa02e3          	beq	s4,a5,8cd4 <_dtoa_r+0x1148>
    7e74:	6147dae3          	bge	a5,s4,8c88 <_dtoa_r+0x10fc>
    7e78:	00400793          	li	a5,4
    7e7c:	54fa1ae3          	bne	s4,a5,8bd0 <_dtoa_r+0x1044>
    7e80:	00100793          	li	a5,1
    7e84:	02f12423          	sw	a5,40(sp)
    7e88:	01412603          	lw	a2,20(sp)
    7e8c:	62c05ce3          	blez	a2,8cc4 <_dtoa_r+0x1138>
    7e90:	02c12e23          	sw	a2,60(sp)
    7e94:	00060c13          	mv	s8,a2
    7e98:	01700693          	li	a3,23
    7e9c:	00100713          	li	a4,1
    7ea0:	00400793          	li	a5,4
    7ea4:	00c6c463          	blt	a3,a2,7eac <_dtoa_r+0x320>
    7ea8:	3540106f          	j	91fc <_dtoa_r+0x1670>
    7eac:	00179793          	sll	a5,a5,0x1
    7eb0:	01478693          	add	a3,a5,20
    7eb4:	00070593          	mv	a1,a4
    7eb8:	00170713          	add	a4,a4,1
    7ebc:	fed678e3          	bgeu	a2,a3,7eac <_dtoa_r+0x320>
    7ec0:	02b42e23          	sw	a1,60(s0)
    7ec4:	00040513          	mv	a0,s0
    7ec8:	3b0010ef          	jal	9278 <_Balloc>
    7ecc:	00050a93          	mv	s5,a0
    7ed0:	00051463          	bnez	a0,7ed8 <_dtoa_r+0x34c>
    7ed4:	30c0106f          	j	91e0 <_dtoa_r+0x1654>
    7ed8:	02a42c23          	sw	a0,56(s0)
    7edc:	00e00793          	li	a5,14
    7ee0:	5187ea63          	bltu	a5,s8,83f4 <_dtoa_r+0x868>
    7ee4:	50090863          	beqz	s2,83f4 <_dtoa_r+0x868>
    7ee8:	02012783          	lw	a5,32(sp)
    7eec:	62f054e3          	blez	a5,8d14 <_dtoa_r+0x1188>
    7ef0:	00f7f713          	and	a4,a5,15
    7ef4:	00371713          	sll	a4,a4,0x3
    7ef8:	4047dc93          	sra	s9,a5,0x4
    7efc:	00007797          	auipc	a5,0x7
    7f00:	1ac78793          	add	a5,a5,428 # f0a8 <__mprec_tens>
    7f04:	00e787b3          	add	a5,a5,a4
    7f08:	010cf693          	and	a3,s9,16
    7f0c:	0007a803          	lw	a6,0(a5)
    7f10:	0047a703          	lw	a4,4(a5)
    7f14:	560682e3          	beqz	a3,8c78 <_dtoa_r+0x10ec>
    7f18:	00007797          	auipc	a5,0x7
    7f1c:	16878793          	add	a5,a5,360 # f080 <__mprec_bigtens>
    7f20:	0207a603          	lw	a2,32(a5)
    7f24:	0247a683          	lw	a3,36(a5)
    7f28:	01812503          	lw	a0,24(sp)
    7f2c:	01c12583          	lw	a1,28(sp)
    7f30:	04e12423          	sw	a4,72(sp)
    7f34:	05012023          	sw	a6,64(sp)
    7f38:	6a4040ef          	jal	c5dc <__divdf3>
    7f3c:	04012803          	lw	a6,64(sp)
    7f40:	04812703          	lw	a4,72(sp)
    7f44:	00fcfc93          	and	s9,s9,15
    7f48:	00050313          	mv	t1,a0
    7f4c:	00058d13          	mv	s10,a1
    7f50:	00300913          	li	s2,3
    7f54:	040c8c63          	beqz	s9,7fac <_dtoa_r+0x420>
    7f58:	04812023          	sw	s0,64(sp)
    7f5c:	00007b97          	auipc	s7,0x7
    7f60:	124b8b93          	add	s7,s7,292 # f080 <__mprec_bigtens>
    7f64:	00090413          	mv	s0,s2
    7f68:	00070593          	mv	a1,a4
    7f6c:	00030913          	mv	s2,t1
    7f70:	001cf793          	and	a5,s9,1
    7f74:	00078e63          	beqz	a5,7f90 <_dtoa_r+0x404>
    7f78:	000ba603          	lw	a2,0(s7)
    7f7c:	004ba683          	lw	a3,4(s7)
    7f80:	00080513          	mv	a0,a6
    7f84:	00140413          	add	s0,s0,1
    7f88:	194050ef          	jal	d11c <__muldf3>
    7f8c:	00050813          	mv	a6,a0
    7f90:	401cdc93          	sra	s9,s9,0x1
    7f94:	008b8b93          	add	s7,s7,8
    7f98:	fc0c9ce3          	bnez	s9,7f70 <_dtoa_r+0x3e4>
    7f9c:	00090313          	mv	t1,s2
    7fa0:	00040913          	mv	s2,s0
    7fa4:	04012403          	lw	s0,64(sp)
    7fa8:	00058713          	mv	a4,a1
    7fac:	00070693          	mv	a3,a4
    7fb0:	00080613          	mv	a2,a6
    7fb4:	00030513          	mv	a0,t1
    7fb8:	000d0593          	mv	a1,s10
    7fbc:	620040ef          	jal	c5dc <__divdf3>
    7fc0:	00050713          	mv	a4,a0
    7fc4:	00058793          	mv	a5,a1
    7fc8:	03412683          	lw	a3,52(sp)
    7fcc:	02068c63          	beqz	a3,8004 <_dtoa_r+0x478>
    7fd0:	7fff8697          	auipc	a3,0x7fff8
    7fd4:	71868693          	add	a3,a3,1816 # 800006e8 <__global_locale+0x1b4>
    7fd8:	0006a603          	lw	a2,0(a3)
    7fdc:	0046a683          	lw	a3,4(a3)
    7fe0:	00070513          	mv	a0,a4
    7fe4:	00078593          	mv	a1,a5
    7fe8:	04e12423          	sw	a4,72(sp)
    7fec:	04f12023          	sw	a5,64(sp)
    7ff0:	024050ef          	jal	d014 <__ledf2>
    7ff4:	04012783          	lw	a5,64(sp)
    7ff8:	04812703          	lw	a4,72(sp)
    7ffc:	00055463          	bgez	a0,8004 <_dtoa_r+0x478>
    8000:	04c0106f          	j	904c <_dtoa_r+0x14c0>
    8004:	00090513          	mv	a0,s2
    8008:	04f12623          	sw	a5,76(sp)
    800c:	04e12023          	sw	a4,64(sp)
    8010:	27c060ef          	jal	e28c <__floatsidf>
    8014:	04012703          	lw	a4,64(sp)
    8018:	04c12783          	lw	a5,76(sp)
    801c:	00070613          	mv	a2,a4
    8020:	00078693          	mv	a3,a5
    8024:	04e12423          	sw	a4,72(sp)
    8028:	04f12023          	sw	a5,64(sp)
    802c:	0f0050ef          	jal	d11c <__muldf3>
    8030:	7fff8697          	auipc	a3,0x7fff8
    8034:	6c868693          	add	a3,a3,1736 # 800006f8 <__global_locale+0x1c4>
    8038:	0006a603          	lw	a2,0(a3)
    803c:	0046a683          	lw	a3,4(a3)
    8040:	4d5030ef          	jal	bd14 <__adddf3>
    8044:	fcc006b7          	lui	a3,0xfcc00
    8048:	04012783          	lw	a5,64(sp)
    804c:	04812703          	lw	a4,72(sp)
    8050:	00050c93          	mv	s9,a0
    8054:	00b68bb3          	add	s7,a3,a1
    8058:	340c0463          	beqz	s8,83a0 <_dtoa_r+0x814>
    805c:	02012683          	lw	a3,32(sp)
    8060:	05812423          	sw	s8,72(sp)
    8064:	04d12e23          	sw	a3,92(sp)
    8068:	00070513          	mv	a0,a4
    806c:	00078593          	mv	a1,a5
    8070:	04e12623          	sw	a4,76(sp)
    8074:	04f12023          	sw	a5,64(sp)
    8078:	190060ef          	jal	e208 <__fixdfsi>
    807c:	04812783          	lw	a5,72(sp)
    8080:	00050913          	mv	s2,a0
    8084:	05912c23          	sw	s9,88(sp)
    8088:	fff78693          	add	a3,a5,-1
    808c:	00369693          	sll	a3,a3,0x3
    8090:	00007797          	auipc	a5,0x7
    8094:	01878793          	add	a5,a5,24 # f0a8 <__mprec_tens>
    8098:	00d786b3          	add	a3,a5,a3
    809c:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    80a0:	0046a803          	lw	a6,4(a3)
    80a4:	001a8d13          	add	s10,s5,1
    80a8:	04f12823          	sw	a5,80(sp)
    80ac:	05012a23          	sw	a6,84(sp)
    80b0:	1dc060ef          	jal	e28c <__floatsidf>
    80b4:	04c12703          	lw	a4,76(sp)
    80b8:	04012783          	lw	a5,64(sp)
    80bc:	00050613          	mv	a2,a0
    80c0:	00058693          	mv	a3,a1
    80c4:	00070513          	mv	a0,a4
    80c8:	00078593          	mv	a1,a5
    80cc:	7e0050ef          	jal	d8ac <__subdf3>
    80d0:	02812703          	lw	a4,40(sp)
    80d4:	03090313          	add	t1,s2,48
    80d8:	05a12023          	sw	s10,64(sp)
    80dc:	00050c93          	mv	s9,a0
    80e0:	0ff37313          	zext.b	t1,t1
    80e4:	5c0706e3          	beqz	a4,8eb0 <_dtoa_r+0x1324>
    80e8:	7fff8797          	auipc	a5,0x7fff8
    80ec:	5d078793          	add	a5,a5,1488 # 800006b8 <__global_locale+0x184>
    80f0:	0007a503          	lw	a0,0(a5)
    80f4:	05012603          	lw	a2,80(sp)
    80f8:	05412683          	lw	a3,84(sp)
    80fc:	04b12023          	sw	a1,64(sp)
    8100:	0047a583          	lw	a1,4(a5)
    8104:	04612623          	sw	t1,76(sp)
    8108:	4d4040ef          	jal	c5dc <__divdf3>
    810c:	05812603          	lw	a2,88(sp)
    8110:	000b8693          	mv	a3,s7
    8114:	798050ef          	jal	d8ac <__subdf3>
    8118:	04012883          	lw	a7,64(sp)
    811c:	04c12303          	lw	t1,76(sp)
    8120:	000c8613          	mv	a2,s9
    8124:	00088693          	mv	a3,a7
    8128:	006a8023          	sb	t1,0(s5)
    812c:	00050913          	mv	s2,a0
    8130:	00058b93          	mv	s7,a1
    8134:	5e1040ef          	jal	cf14 <__gedf2>
    8138:	04012883          	lw	a7,64(sp)
    813c:	00a05463          	blez	a0,8144 <_dtoa_r+0x5b8>
    8140:	7c90006f          	j	9108 <_dtoa_r+0x157c>
    8144:	7fff8697          	auipc	a3,0x7fff8
    8148:	5a468693          	add	a3,a3,1444 # 800006e8 <__global_locale+0x1b4>
    814c:	0006a783          	lw	a5,0(a3)
    8150:	0046a803          	lw	a6,4(a3)
    8154:	05312623          	sw	s3,76(sp)
    8158:	04f12023          	sw	a5,64(sp)
    815c:	00000793          	li	a5,0
    8160:	05612823          	sw	s6,80(sp)
    8164:	05812c23          	sw	s8,88(sp)
    8168:	05012223          	sw	a6,68(sp)
    816c:	04812c03          	lw	s8,72(sp)
    8170:	00078b13          	mv	s6,a5
    8174:	05412423          	sw	s4,72(sp)
    8178:	00088993          	mv	s3,a7
    817c:	0980006f          	j	8214 <_dtoa_r+0x688>
    8180:	001b0b13          	add	s6,s6,1
    8184:	018b4463          	blt	s6,s8,818c <_dtoa_r+0x600>
    8188:	7d10006f          	j	9158 <_dtoa_r+0x15cc>
    818c:	7fff8a17          	auipc	s4,0x7fff8
    8190:	564a0a13          	add	s4,s4,1380 # 800006f0 <__global_locale+0x1bc>
    8194:	000a2603          	lw	a2,0(s4)
    8198:	004a2683          	lw	a3,4(s4)
    819c:	00090513          	mv	a0,s2
    81a0:	000b8593          	mv	a1,s7
    81a4:	779040ef          	jal	d11c <__muldf3>
    81a8:	000a2603          	lw	a2,0(s4)
    81ac:	004a2683          	lw	a3,4(s4)
    81b0:	00050913          	mv	s2,a0
    81b4:	00058b93          	mv	s7,a1
    81b8:	000c8513          	mv	a0,s9
    81bc:	00098593          	mv	a1,s3
    81c0:	75d040ef          	jal	d11c <__muldf3>
    81c4:	00058c93          	mv	s9,a1
    81c8:	00050a13          	mv	s4,a0
    81cc:	03c060ef          	jal	e208 <__fixdfsi>
    81d0:	00050993          	mv	s3,a0
    81d4:	0b8060ef          	jal	e28c <__floatsidf>
    81d8:	00050613          	mv	a2,a0
    81dc:	00058693          	mv	a3,a1
    81e0:	000a0513          	mv	a0,s4
    81e4:	000c8593          	mv	a1,s9
    81e8:	6c4050ef          	jal	d8ac <__subdf3>
    81ec:	03098793          	add	a5,s3,48
    81f0:	00090613          	mv	a2,s2
    81f4:	000b8693          	mv	a3,s7
    81f8:	00fd0023          	sb	a5,0(s10)
    81fc:	001d0d13          	add	s10,s10,1
    8200:	00050c93          	mv	s9,a0
    8204:	00058993          	mv	s3,a1
    8208:	60d040ef          	jal	d014 <__ledf2>
    820c:	00055463          	bgez	a0,8214 <_dtoa_r+0x688>
    8210:	6f90006f          	j	9108 <_dtoa_r+0x157c>
    8214:	04012503          	lw	a0,64(sp)
    8218:	04412583          	lw	a1,68(sp)
    821c:	000c8613          	mv	a2,s9
    8220:	00098693          	mv	a3,s3
    8224:	688050ef          	jal	d8ac <__subdf3>
    8228:	00090613          	mv	a2,s2
    822c:	000b8693          	mv	a3,s7
    8230:	5e5040ef          	jal	d014 <__ledf2>
    8234:	f40556e3          	bgez	a0,8180 <_dtoa_r+0x5f4>
    8238:	05c12783          	lw	a5,92(sp)
    823c:	000d0b93          	mv	s7,s10
    8240:	00178c13          	add	s8,a5,1
    8244:	03900613          	li	a2,57
    8248:	0080006f          	j	8250 <_dtoa_r+0x6c4>
    824c:	697a88e3          	beq	s5,s7,90dc <_dtoa_r+0x1550>
    8250:	fffbc683          	lbu	a3,-1(s7)
    8254:	000b8d13          	mv	s10,s7
    8258:	fffb8b93          	add	s7,s7,-1
    825c:	fec688e3          	beq	a3,a2,824c <_dtoa_r+0x6c0>
    8260:	00168693          	add	a3,a3,1
    8264:	0ff6f693          	zext.b	a3,a3
    8268:	00db8023          	sb	a3,0(s7)
    826c:	000c0a13          	mv	s4,s8
    8270:	4f00006f          	j	8760 <_dtoa_r+0xbd4>
    8274:	00c12683          	lw	a3,12(sp)
    8278:	00002737          	lui	a4,0x2
    827c:	00c99793          	sll	a5,s3,0xc
    8280:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0xd83>
    8284:	00c7d793          	srl	a5,a5,0xc
    8288:	00e6a023          	sw	a4,0(a3)
    828c:	01b7e7b3          	or	a5,a5,s11
    8290:	0a078063          	beqz	a5,8330 <_dtoa_r+0x7a4>
    8294:	00812783          	lw	a5,8(sp)
    8298:	00006a97          	auipc	s5,0x6
    829c:	7d0a8a93          	add	s5,s5,2000 # ea68 <__fini_array_end+0x124>
    82a0:	9c078ee3          	beqz	a5,7c7c <_dtoa_r+0xf0>
    82a4:	00006797          	auipc	a5,0x6
    82a8:	7c778793          	add	a5,a5,1991 # ea6b <__fini_array_end+0x127>
    82ac:	00812703          	lw	a4,8(sp)
    82b0:	00f72023          	sw	a5,0(a4)
    82b4:	9c9ff06f          	j	7c7c <_dtoa_r+0xf0>
    82b8:	01c12783          	lw	a5,28(sp)
    82bc:	3ff006b7          	lui	a3,0x3ff00
    82c0:	06812a83          	lw	s5,104(sp)
    82c4:	00c79793          	sll	a5,a5,0xc
    82c8:	00c7d793          	srl	a5,a5,0xc
    82cc:	01812703          	lw	a4,24(sp)
    82d0:	00d7e7b3          	or	a5,a5,a3
    82d4:	c0190913          	add	s2,s2,-1023
    82d8:	02012c23          	sw	zero,56(sp)
    82dc:	a51ff06f          	j	7d2c <_dtoa_r+0x1a0>
    82e0:	00100793          	li	a5,1
    82e4:	415787b3          	sub	a5,a5,s5
    82e8:	00f12823          	sw	a5,16(sp)
    82ec:	00000b13          	li	s6,0
    82f0:	b409c4e3          	bltz	s3,7e38 <_dtoa_r+0x2ac>
    82f4:	03312023          	sw	s3,32(sp)
    82f8:	02012823          	sw	zero,48(sp)
    82fc:	00900793          	li	a5,9
    8300:	013b0b33          	add	s6,s6,s3
    8304:	b547fce3          	bgeu	a5,s4,7e5c <_dtoa_r+0x2d0>
    8308:	00100793          	li	a5,1
    830c:	00100913          	li	s2,1
    8310:	00000a13          	li	s4,0
    8314:	02f12423          	sw	a5,40(sp)
    8318:	fff00c13          	li	s8,-1
    831c:	00012a23          	sw	zero,20(sp)
    8320:	02042e23          	sw	zero,60(s0)
    8324:	03812e23          	sw	s8,60(sp)
    8328:	00000593          	li	a1,0
    832c:	b99ff06f          	j	7ec4 <_dtoa_r+0x338>
    8330:	00812703          	lw	a4,8(sp)
    8334:	00006a97          	auipc	s5,0x6
    8338:	728a8a93          	add	s5,s5,1832 # ea5c <__fini_array_end+0x118>
    833c:	00006797          	auipc	a5,0x6
    8340:	72878793          	add	a5,a5,1832 # ea64 <__fini_array_end+0x120>
    8344:	f60714e3          	bnez	a4,82ac <_dtoa_r+0x720>
    8348:	935ff06f          	j	7c7c <_dtoa_r+0xf0>
    834c:	00090513          	mv	a0,s2
    8350:	04f12623          	sw	a5,76(sp)
    8354:	04e12023          	sw	a4,64(sp)
    8358:	735050ef          	jal	e28c <__floatsidf>
    835c:	04012703          	lw	a4,64(sp)
    8360:	04c12783          	lw	a5,76(sp)
    8364:	00070613          	mv	a2,a4
    8368:	00078693          	mv	a3,a5
    836c:	04e12423          	sw	a4,72(sp)
    8370:	04f12023          	sw	a5,64(sp)
    8374:	5a9040ef          	jal	d11c <__muldf3>
    8378:	7fff8697          	auipc	a3,0x7fff8
    837c:	38068693          	add	a3,a3,896 # 800006f8 <__global_locale+0x1c4>
    8380:	0006a603          	lw	a2,0(a3)
    8384:	0046a683          	lw	a3,4(a3)
    8388:	18d030ef          	jal	bd14 <__adddf3>
    838c:	04012783          	lw	a5,64(sp)
    8390:	04812703          	lw	a4,72(sp)
    8394:	fcc006b7          	lui	a3,0xfcc00
    8398:	00050c93          	mv	s9,a0
    839c:	00b68bb3          	add	s7,a3,a1
    83a0:	7fff8697          	auipc	a3,0x7fff8
    83a4:	36068693          	add	a3,a3,864 # 80000700 <__global_locale+0x1cc>
    83a8:	0006a603          	lw	a2,0(a3)
    83ac:	0046a683          	lw	a3,4(a3)
    83b0:	00070513          	mv	a0,a4
    83b4:	00078593          	mv	a1,a5
    83b8:	4f4050ef          	jal	d8ac <__subdf3>
    83bc:	000c8613          	mv	a2,s9
    83c0:	000b8693          	mv	a3,s7
    83c4:	00050d13          	mv	s10,a0
    83c8:	00058913          	mv	s2,a1
    83cc:	349040ef          	jal	cf14 <__gedf2>
    83d0:	50a04ce3          	bgtz	a0,90e8 <_dtoa_r+0x155c>
    83d4:	800007b7          	lui	a5,0x80000
    83d8:	0177c7b3          	xor	a5,a5,s7
    83dc:	000c8613          	mv	a2,s9
    83e0:	000d0513          	mv	a0,s10
    83e4:	00078693          	mv	a3,a5
    83e8:	00090593          	mv	a1,s2
    83ec:	429040ef          	jal	d014 <__ledf2>
    83f0:	06054c63          	bltz	a0,8468 <_dtoa_r+0x8dc>
    83f4:	06c12783          	lw	a5,108(sp)
    83f8:	1a07c663          	bltz	a5,85a4 <_dtoa_r+0xa18>
    83fc:	02012683          	lw	a3,32(sp)
    8400:	00e00713          	li	a4,14
    8404:	1ad74063          	blt	a4,a3,85a4 <_dtoa_r+0xa18>
    8408:	02012783          	lw	a5,32(sp)
    840c:	00379713          	sll	a4,a5,0x3
    8410:	00007797          	auipc	a5,0x7
    8414:	c9878793          	add	a5,a5,-872 # f0a8 <__mprec_tens>
    8418:	00e787b3          	add	a5,a5,a4
    841c:	0007a903          	lw	s2,0(a5)
    8420:	0047a983          	lw	s3,4(a5)
    8424:	01412783          	lw	a5,20(sp)
    8428:	0407dc63          	bgez	a5,8480 <_dtoa_r+0x8f4>
    842c:	05804a63          	bgtz	s8,8480 <_dtoa_r+0x8f4>
    8430:	020c1c63          	bnez	s8,8468 <_dtoa_r+0x8dc>
    8434:	7fff8797          	auipc	a5,0x7fff8
    8438:	2cc78793          	add	a5,a5,716 # 80000700 <__global_locale+0x1cc>
    843c:	0007a603          	lw	a2,0(a5)
    8440:	0047a683          	lw	a3,4(a5)
    8444:	00090513          	mv	a0,s2
    8448:	00098593          	mv	a1,s3
    844c:	4d1040ef          	jal	d11c <__muldf3>
    8450:	00050613          	mv	a2,a0
    8454:	00058693          	mv	a3,a1
    8458:	01812503          	lw	a0,24(sp)
    845c:	01c12583          	lw	a1,28(sp)
    8460:	3b5040ef          	jal	d014 <__ledf2>
    8464:	48a042e3          	bgtz	a0,90e8 <_dtoa_r+0x155c>
    8468:	000a8d13          	mv	s10,s5
    846c:	00012c23          	sw	zero,24(sp)
    8470:	00000913          	li	s2,0
    8474:	01412783          	lw	a5,20(sp)
    8478:	fff7ca13          	not	s4,a5
    847c:	6980006f          	j	8b14 <_dtoa_r+0xf88>
    8480:	001a8793          	add	a5,s5,1
    8484:	04f12023          	sw	a5,64(sp)
    8488:	01812b03          	lw	s6,24(sp)
    848c:	01c12a03          	lw	s4,28(sp)
    8490:	00090613          	mv	a2,s2
    8494:	00098693          	mv	a3,s3
    8498:	000b0513          	mv	a0,s6
    849c:	000a0593          	mv	a1,s4
    84a0:	13c040ef          	jal	c5dc <__divdf3>
    84a4:	565050ef          	jal	e208 <__fixdfsi>
    84a8:	00050d13          	mv	s10,a0
    84ac:	5e1050ef          	jal	e28c <__floatsidf>
    84b0:	00090613          	mv	a2,s2
    84b4:	00098693          	mv	a3,s3
    84b8:	465040ef          	jal	d11c <__muldf3>
    84bc:	00050613          	mv	a2,a0
    84c0:	00058693          	mv	a3,a1
    84c4:	000b0513          	mv	a0,s6
    84c8:	000a0593          	mv	a1,s4
    84cc:	3e0050ef          	jal	d8ac <__subdf3>
    84d0:	030d0793          	add	a5,s10,48
    84d4:	00fa8023          	sb	a5,0(s5)
    84d8:	00100613          	li	a2,1
    84dc:	04012b83          	lw	s7,64(sp)
    84e0:	00050713          	mv	a4,a0
    84e4:	00058693          	mv	a3,a1
    84e8:	0ccc0ee3          	beq	s8,a2,8dc4 <_dtoa_r+0x1238>
    84ec:	7fff8617          	auipc	a2,0x7fff8
    84f0:	20460613          	add	a2,a2,516 # 800006f0 <__global_locale+0x1bc>
    84f4:	00062783          	lw	a5,0(a2)
    84f8:	00462803          	lw	a6,4(a2)
    84fc:	00100d93          	li	s11,1
    8500:	00f12023          	sw	a5,0(sp)
    8504:	01012223          	sw	a6,4(sp)
    8508:	0600006f          	j	8568 <_dtoa_r+0x9dc>
    850c:	00090613          	mv	a2,s2
    8510:	00098693          	mv	a3,s3
    8514:	000b0513          	mv	a0,s6
    8518:	000a0593          	mv	a1,s4
    851c:	0c0040ef          	jal	c5dc <__divdf3>
    8520:	4e9050ef          	jal	e208 <__fixdfsi>
    8524:	00050d13          	mv	s10,a0
    8528:	565050ef          	jal	e28c <__floatsidf>
    852c:	00090613          	mv	a2,s2
    8530:	00098693          	mv	a3,s3
    8534:	3e9040ef          	jal	d11c <__muldf3>
    8538:	00058693          	mv	a3,a1
    853c:	00050613          	mv	a2,a0
    8540:	000a0593          	mv	a1,s4
    8544:	000b0513          	mv	a0,s6
    8548:	364050ef          	jal	d8ac <__subdf3>
    854c:	001b8b93          	add	s7,s7,1
    8550:	030d0793          	add	a5,s10,48
    8554:	001d8d93          	add	s11,s11,1
    8558:	fefb8fa3          	sb	a5,-1(s7)
    855c:	00050713          	mv	a4,a0
    8560:	00058693          	mv	a3,a1
    8564:	07bc00e3          	beq	s8,s11,8dc4 <_dtoa_r+0x1238>
    8568:	00012603          	lw	a2,0(sp)
    856c:	00068593          	mv	a1,a3
    8570:	00412683          	lw	a3,4(sp)
    8574:	00070513          	mv	a0,a4
    8578:	3a5040ef          	jal	d11c <__muldf3>
    857c:	00000613          	li	a2,0
    8580:	00000693          	li	a3,0
    8584:	00050b13          	mv	s6,a0
    8588:	00058a13          	mv	s4,a1
    858c:	0fd040ef          	jal	ce88 <__eqdf2>
    8590:	f6051ee3          	bnez	a0,850c <_dtoa_r+0x980>
    8594:	02012783          	lw	a5,32(sp)
    8598:	000b8d13          	mv	s10,s7
    859c:	00178a13          	add	s4,a5,1
    85a0:	1c00006f          	j	8760 <_dtoa_r+0xbd4>
    85a4:	02812703          	lw	a4,40(sp)
    85a8:	26071463          	bnez	a4,8810 <_dtoa_r+0xc84>
    85ac:	03012b83          	lw	s7,48(sp)
    85b0:	01012c83          	lw	s9,16(sp)
    85b4:	02012423          	sw	zero,40(sp)
    85b8:	00000913          	li	s2,0
    85bc:	020c8263          	beqz	s9,85e0 <_dtoa_r+0xa54>
    85c0:	03605063          	blez	s6,85e0 <_dtoa_r+0xa54>
    85c4:	000c8793          	mv	a5,s9
    85c8:	679b4263          	blt	s6,s9,8c2c <_dtoa_r+0x10a0>
    85cc:	01012703          	lw	a4,16(sp)
    85d0:	40fc8cb3          	sub	s9,s9,a5
    85d4:	40fb0b33          	sub	s6,s6,a5
    85d8:	40f70733          	sub	a4,a4,a5
    85dc:	00e12823          	sw	a4,16(sp)
    85e0:	03012783          	lw	a5,48(sp)
    85e4:	02078263          	beqz	a5,8608 <_dtoa_r+0xa7c>
    85e8:	02812783          	lw	a5,40(sp)
    85ec:	00078463          	beqz	a5,85f4 <_dtoa_r+0xa68>
    85f0:	060b9ae3          	bnez	s7,8e64 <_dtoa_r+0x12d8>
    85f4:	03012603          	lw	a2,48(sp)
    85f8:	00048593          	mv	a1,s1
    85fc:	00040513          	mv	a0,s0
    8600:	3a4010ef          	jal	99a4 <__pow5mult>
    8604:	00050493          	mv	s1,a0
    8608:	00100593          	li	a1,1
    860c:	00040513          	mv	a0,s0
    8610:	01c010ef          	jal	962c <__i2b>
    8614:	00a12c23          	sw	a0,24(sp)
    8618:	50099a63          	bnez	s3,8b2c <_dtoa_r+0xfa0>
    861c:	00100793          	li	a5,1
    8620:	5547da63          	bge	a5,s4,8b74 <_dtoa_r+0xfe8>
    8624:	016787b3          	add	a5,a5,s6
    8628:	01f7f793          	and	a5,a5,31
    862c:	1c078e63          	beqz	a5,8808 <_dtoa_r+0xc7c>
    8630:	02000713          	li	a4,32
    8634:	40f70733          	sub	a4,a4,a5
    8638:	00400693          	li	a3,4
    863c:	58e6d263          	bge	a3,a4,8bc0 <_dtoa_r+0x1034>
    8640:	01c00713          	li	a4,28
    8644:	40f707b3          	sub	a5,a4,a5
    8648:	01012703          	lw	a4,16(sp)
    864c:	00fc8cb3          	add	s9,s9,a5
    8650:	00fb0b33          	add	s6,s6,a5
    8654:	00f70733          	add	a4,a4,a5
    8658:	00e12823          	sw	a4,16(sp)
    865c:	01012783          	lw	a5,16(sp)
    8660:	12f04e63          	bgtz	a5,879c <_dtoa_r+0xc10>
    8664:	01605c63          	blez	s6,867c <_dtoa_r+0xaf0>
    8668:	01812583          	lw	a1,24(sp)
    866c:	000b0613          	mv	a2,s6
    8670:	00040513          	mv	a0,s0
    8674:	480010ef          	jal	9af4 <__lshift>
    8678:	00a12c23          	sw	a0,24(sp)
    867c:	03412783          	lw	a5,52(sp)
    8680:	12079a63          	bnez	a5,87b4 <_dtoa_r+0xc28>
    8684:	45805263          	blez	s8,8ac8 <_dtoa_r+0xf3c>
    8688:	02812783          	lw	a5,40(sp)
    868c:	24079e63          	bnez	a5,88e8 <_dtoa_r+0xd5c>
    8690:	02012783          	lw	a5,32(sp)
    8694:	00178a13          	add	s4,a5,1
    8698:	01812b03          	lw	s6,24(sp)
    869c:	00100993          	li	s3,1
    86a0:	0200006f          	j	86c0 <_dtoa_r+0xb34>
    86a4:	00048593          	mv	a1,s1
    86a8:	00000693          	li	a3,0
    86ac:	00a00613          	li	a2,10
    86b0:	00040513          	mv	a0,s0
    86b4:	49d000ef          	jal	9350 <__multadd>
    86b8:	00050493          	mv	s1,a0
    86bc:	00198993          	add	s3,s3,1
    86c0:	000b0593          	mv	a1,s6
    86c4:	00048513          	mv	a0,s1
    86c8:	a64ff0ef          	jal	792c <quorem>
    86cc:	03050b93          	add	s7,a0,48
    86d0:	013a87b3          	add	a5,s5,s3
    86d4:	ff778fa3          	sb	s7,-1(a5)
    86d8:	fd89c6e3          	blt	s3,s8,86a4 <_dtoa_r+0xb18>
    86dc:	00100993          	li	s3,1
    86e0:	55804263          	bgtz	s8,8c24 <_dtoa_r+0x1098>
    86e4:	013a89b3          	add	s3,s5,s3
    86e8:	00000c13          	li	s8,0
    86ec:	00048593          	mv	a1,s1
    86f0:	00100613          	li	a2,1
    86f4:	00040513          	mv	a0,s0
    86f8:	3fc010ef          	jal	9af4 <__lshift>
    86fc:	01812583          	lw	a1,24(sp)
    8700:	00050493          	mv	s1,a0
    8704:	580010ef          	jal	9c84 <__mcmp>
    8708:	4ea05c63          	blez	a0,8c00 <_dtoa_r+0x1074>
    870c:	03900693          	li	a3,57
    8710:	0080006f          	j	8718 <_dtoa_r+0xb8c>
    8714:	5f3a8863          	beq	s5,s3,8d04 <_dtoa_r+0x1178>
    8718:	fff9c783          	lbu	a5,-1(s3)
    871c:	00098d13          	mv	s10,s3
    8720:	fff98993          	add	s3,s3,-1
    8724:	fed788e3          	beq	a5,a3,8714 <_dtoa_r+0xb88>
    8728:	00178793          	add	a5,a5,1
    872c:	00f98023          	sb	a5,0(s3)
    8730:	01812583          	lw	a1,24(sp)
    8734:	00040513          	mv	a0,s0
    8738:	3f5000ef          	jal	932c <_Bfree>
    873c:	02090263          	beqz	s2,8760 <_dtoa_r+0xbd4>
    8740:	000c0a63          	beqz	s8,8754 <_dtoa_r+0xbc8>
    8744:	012c0863          	beq	s8,s2,8754 <_dtoa_r+0xbc8>
    8748:	000c0593          	mv	a1,s8
    874c:	00040513          	mv	a0,s0
    8750:	3dd000ef          	jal	932c <_Bfree>
    8754:	00090593          	mv	a1,s2
    8758:	00040513          	mv	a0,s0
    875c:	3d1000ef          	jal	932c <_Bfree>
    8760:	00048593          	mv	a1,s1
    8764:	00040513          	mv	a0,s0
    8768:	3c5000ef          	jal	932c <_Bfree>
    876c:	00c12783          	lw	a5,12(sp)
    8770:	000d0023          	sb	zero,0(s10)
    8774:	0147a023          	sw	s4,0(a5)
    8778:	00812783          	lw	a5,8(sp)
    877c:	00078463          	beqz	a5,8784 <_dtoa_r+0xbf8>
    8780:	01a7a023          	sw	s10,0(a5)
    8784:	09012b03          	lw	s6,144(sp)
    8788:	08c12b83          	lw	s7,140(sp)
    878c:	08812c03          	lw	s8,136(sp)
    8790:	08412c83          	lw	s9,132(sp)
    8794:	08012d03          	lw	s10,128(sp)
    8798:	ce4ff06f          	j	7c7c <_dtoa_r+0xf0>
    879c:	00048593          	mv	a1,s1
    87a0:	00078613          	mv	a2,a5
    87a4:	00040513          	mv	a0,s0
    87a8:	34c010ef          	jal	9af4 <__lshift>
    87ac:	00050493          	mv	s1,a0
    87b0:	eb5ff06f          	j	8664 <_dtoa_r+0xad8>
    87b4:	01812583          	lw	a1,24(sp)
    87b8:	00048513          	mv	a0,s1
    87bc:	4c8010ef          	jal	9c84 <__mcmp>
    87c0:	ec0552e3          	bgez	a0,8684 <_dtoa_r+0xaf8>
    87c4:	02012783          	lw	a5,32(sp)
    87c8:	00048593          	mv	a1,s1
    87cc:	00000693          	li	a3,0
    87d0:	00a00613          	li	a2,10
    87d4:	00040513          	mv	a0,s0
    87d8:	fff78b13          	add	s6,a5,-1
    87dc:	375000ef          	jal	9350 <__multadd>
    87e0:	02812783          	lw	a5,40(sp)
    87e4:	00050493          	mv	s1,a0
    87e8:	0c079e63          	bnez	a5,88c4 <_dtoa_r+0xd38>
    87ec:	03c12c03          	lw	s8,60(sp)
    87f0:	17805ee3          	blez	s8,916c <_dtoa_r+0x15e0>
    87f4:	02012a03          	lw	s4,32(sp)
    87f8:	ea1ff06f          	j	8698 <_dtoa_r+0xb0c>
    87fc:	00100793          	li	a5,1
    8800:	02f12a23          	sw	a5,52(sp)
    8804:	e28ff06f          	j	7e2c <_dtoa_r+0x2a0>
    8808:	01c00793          	li	a5,28
    880c:	e3dff06f          	j	8648 <_dtoa_r+0xabc>
    8810:	00100713          	li	a4,1
    8814:	4d475463          	bge	a4,s4,8cdc <_dtoa_r+0x1150>
    8818:	03012783          	lw	a5,48(sp)
    881c:	fffc0b93          	add	s7,s8,-1
    8820:	4177ca63          	blt	a5,s7,8c34 <_dtoa_r+0x10a8>
    8824:	41778bb3          	sub	s7,a5,s7
    8828:	01012783          	lw	a5,16(sp)
    882c:	41878cb3          	sub	s9,a5,s8
    8830:	100c54e3          	bgez	s8,9138 <_dtoa_r+0x15ac>
    8834:	00100593          	li	a1,1
    8838:	00040513          	mv	a0,s0
    883c:	5f1000ef          	jal	962c <__i2b>
    8840:	00050913          	mv	s2,a0
    8844:	d79ff06f          	j	85bc <_dtoa_r+0xa30>
    8848:	02012a23          	sw	zero,52(sp)
    884c:	00012823          	sw	zero,16(sp)
    8850:	ab5042e3          	bgtz	s5,82f4 <_dtoa_r+0x768>
    8854:	00100793          	li	a5,1
    8858:	415787b3          	sub	a5,a5,s5
    885c:	00f12823          	sw	a5,16(sp)
    8860:	00000b13          	li	s6,0
    8864:	a91ff06f          	j	82f4 <_dtoa_r+0x768>
    8868:	40e787b3          	sub	a5,a5,a4
    886c:	00fd9533          	sll	a0,s11,a5
    8870:	ca0ff06f          	j	7d10 <_dtoa_r+0x184>
    8874:	00300793          	li	a5,3
    8878:	00100913          	li	s2,1
    887c:	44fa0c63          	beq	s4,a5,8cd4 <_dtoa_r+0x1148>
    8880:	df47cc63          	blt	a5,s4,7e78 <_dtoa_r+0x2ec>
    8884:	00200793          	li	a5,2
    8888:	18fa00e3          	beq	s4,a5,9208 <_dtoa_r+0x167c>
    888c:	02042e23          	sw	zero,60(s0)
    8890:	00000593          	li	a1,0
    8894:	00040513          	mv	a0,s0
    8898:	1e1000ef          	jal	9278 <_Balloc>
    889c:	00050a93          	mv	s5,a0
    88a0:	140500e3          	beqz	a0,91e0 <_dtoa_r+0x1654>
    88a4:	00100793          	li	a5,1
    88a8:	02f12423          	sw	a5,40(sp)
    88ac:	fff00793          	li	a5,-1
    88b0:	02a42c23          	sw	a0,56(s0)
    88b4:	02f12e23          	sw	a5,60(sp)
    88b8:	fff00c13          	li	s8,-1
    88bc:	00012a23          	sw	zero,20(sp)
    88c0:	b35ff06f          	j	83f4 <_dtoa_r+0x868>
    88c4:	00090593          	mv	a1,s2
    88c8:	00000693          	li	a3,0
    88cc:	00a00613          	li	a2,10
    88d0:	00040513          	mv	a0,s0
    88d4:	27d000ef          	jal	9350 <__multadd>
    88d8:	03c12c03          	lw	s8,60(sp)
    88dc:	00050913          	mv	s2,a0
    88e0:	0b805ae3          	blez	s8,9194 <_dtoa_r+0x1608>
    88e4:	03612023          	sw	s6,32(sp)
    88e8:	01905c63          	blez	s9,8900 <_dtoa_r+0xd74>
    88ec:	00090593          	mv	a1,s2
    88f0:	000c8613          	mv	a2,s9
    88f4:	00040513          	mv	a0,s0
    88f8:	1fc010ef          	jal	9af4 <__lshift>
    88fc:	00050913          	mv	s2,a0
    8900:	00090b13          	mv	s6,s2
    8904:	50099e63          	bnez	s3,8e20 <_dtoa_r+0x1294>
    8908:	02412783          	lw	a5,36(sp)
    890c:	fffa8d13          	add	s10,s5,-1
    8910:	000a8c93          	mv	s9,s5
    8914:	01512823          	sw	s5,16(sp)
    8918:	01812a83          	lw	s5,24(sp)
    891c:	0017f793          	and	a5,a5,1
    8920:	018d0d33          	add	s10,s10,s8
    8924:	00f12023          	sw	a5,0(sp)
    8928:	01b12a23          	sw	s11,20(sp)
    892c:	000a8593          	mv	a1,s5
    8930:	00048513          	mv	a0,s1
    8934:	ff9fe0ef          	jal	792c <quorem>
    8938:	00050c13          	mv	s8,a0
    893c:	00090593          	mv	a1,s2
    8940:	00048513          	mv	a0,s1
    8944:	340010ef          	jal	9c84 <__mcmp>
    8948:	00050993          	mv	s3,a0
    894c:	000b0613          	mv	a2,s6
    8950:	000a8593          	mv	a1,s5
    8954:	00040513          	mv	a0,s0
    8958:	384010ef          	jal	9cdc <__mdiff>
    895c:	00c52703          	lw	a4,12(a0)
    8960:	030c0b93          	add	s7,s8,48
    8964:	00050d93          	mv	s11,a0
    8968:	08071c63          	bnez	a4,8a00 <_dtoa_r+0xe74>
    896c:	00050593          	mv	a1,a0
    8970:	00048513          	mv	a0,s1
    8974:	310010ef          	jal	9c84 <__mcmp>
    8978:	00050713          	mv	a4,a0
    897c:	000d8593          	mv	a1,s11
    8980:	00040513          	mv	a0,s0
    8984:	00070d93          	mv	s11,a4
    8988:	1a5000ef          	jal	932c <_Bfree>
    898c:	014de6b3          	or	a3,s11,s4
    8990:	0e069a63          	bnez	a3,8a84 <_dtoa_r+0xef8>
    8994:	00012783          	lw	a5,0(sp)
    8998:	76078e63          	beqz	a5,9114 <_dtoa_r+0x1588>
    899c:	7809c663          	bltz	s3,9128 <_dtoa_r+0x159c>
    89a0:	017c8023          	sb	s7,0(s9)
    89a4:	001c8993          	add	s3,s9,1
    89a8:	679d0e63          	beq	s10,s9,9024 <_dtoa_r+0x1498>
    89ac:	00048593          	mv	a1,s1
    89b0:	00000693          	li	a3,0
    89b4:	00a00613          	li	a2,10
    89b8:	00040513          	mv	a0,s0
    89bc:	195000ef          	jal	9350 <__multadd>
    89c0:	00050493          	mv	s1,a0
    89c4:	00000693          	li	a3,0
    89c8:	00a00613          	li	a2,10
    89cc:	00090593          	mv	a1,s2
    89d0:	00040513          	mv	a0,s0
    89d4:	09690e63          	beq	s2,s6,8a70 <_dtoa_r+0xee4>
    89d8:	179000ef          	jal	9350 <__multadd>
    89dc:	000b0593          	mv	a1,s6
    89e0:	00050913          	mv	s2,a0
    89e4:	00000693          	li	a3,0
    89e8:	00a00613          	li	a2,10
    89ec:	00040513          	mv	a0,s0
    89f0:	161000ef          	jal	9350 <__multadd>
    89f4:	00050b13          	mv	s6,a0
    89f8:	00098c93          	mv	s9,s3
    89fc:	f31ff06f          	j	892c <_dtoa_r+0xda0>
    8a00:	00050593          	mv	a1,a0
    8a04:	00040513          	mv	a0,s0
    8a08:	01012a83          	lw	s5,16(sp)
    8a0c:	01412d83          	lw	s11,20(sp)
    8a10:	11d000ef          	jal	932c <_Bfree>
    8a14:	0009ca63          	bltz	s3,8a28 <_dtoa_r+0xe9c>
    8a18:	001df713          	and	a4,s11,1
    8a1c:	0149e9b3          	or	s3,s3,s4
    8a20:	01376733          	or	a4,a4,s3
    8a24:	06071e63          	bnez	a4,8aa0 <_dtoa_r+0xf14>
    8a28:	00048593          	mv	a1,s1
    8a2c:	00100613          	li	a2,1
    8a30:	00040513          	mv	a0,s0
    8a34:	0c0010ef          	jal	9af4 <__lshift>
    8a38:	01812583          	lw	a1,24(sp)
    8a3c:	00050493          	mv	s1,a0
    8a40:	244010ef          	jal	9c84 <__mcmp>
    8a44:	24a05863          	blez	a0,8c94 <_dtoa_r+0x1108>
    8a48:	03900713          	li	a4,57
    8a4c:	24eb8c63          	beq	s7,a4,8ca4 <_dtoa_r+0x1118>
    8a50:	031c0b93          	add	s7,s8,49
    8a54:	02012783          	lw	a5,32(sp)
    8a58:	00090c13          	mv	s8,s2
    8a5c:	001c8d13          	add	s10,s9,1
    8a60:	017c8023          	sb	s7,0(s9)
    8a64:	00178a13          	add	s4,a5,1
    8a68:	000b0913          	mv	s2,s6
    8a6c:	cc5ff06f          	j	8730 <_dtoa_r+0xba4>
    8a70:	0e1000ef          	jal	9350 <__multadd>
    8a74:	00050913          	mv	s2,a0
    8a78:	00050b13          	mv	s6,a0
    8a7c:	00098c93          	mv	s9,s3
    8a80:	eadff06f          	j	892c <_dtoa_r+0xda0>
    8a84:	7409c863          	bltz	s3,91d4 <_dtoa_r+0x1648>
    8a88:	00012783          	lw	a5,0(sp)
    8a8c:	0149e9b3          	or	s3,s3,s4
    8a90:	0137e9b3          	or	s3,a5,s3
    8a94:	74098063          	beqz	s3,91d4 <_dtoa_r+0x1648>
    8a98:	f1b054e3          	blez	s11,89a0 <_dtoa_r+0xe14>
    8a9c:	01012a83          	lw	s5,16(sp)
    8aa0:	03900713          	li	a4,57
    8aa4:	20eb8063          	beq	s7,a4,8ca4 <_dtoa_r+0x1118>
    8aa8:	02012703          	lw	a4,32(sp)
    8aac:	001b8793          	add	a5,s7,1
    8ab0:	00090c13          	mv	s8,s2
    8ab4:	001c8d13          	add	s10,s9,1
    8ab8:	00170a13          	add	s4,a4,1
    8abc:	00fc8023          	sb	a5,0(s9)
    8ac0:	000b0913          	mv	s2,s6
    8ac4:	c6dff06f          	j	8730 <_dtoa_r+0xba4>
    8ac8:	00200793          	li	a5,2
    8acc:	bb47dee3          	bge	a5,s4,8688 <_dtoa_r+0xafc>
    8ad0:	000a8d13          	mv	s10,s5
    8ad4:	9a0c10e3          	bnez	s8,8474 <_dtoa_r+0x8e8>
    8ad8:	01812583          	lw	a1,24(sp)
    8adc:	00000693          	li	a3,0
    8ae0:	00500613          	li	a2,5
    8ae4:	00040513          	mv	a0,s0
    8ae8:	069000ef          	jal	9350 <__multadd>
    8aec:	00050593          	mv	a1,a0
    8af0:	00a12c23          	sw	a0,24(sp)
    8af4:	00048513          	mv	a0,s1
    8af8:	18c010ef          	jal	9c84 <__mcmp>
    8afc:	96a05ce3          	blez	a0,8474 <_dtoa_r+0x8e8>
    8b00:	03100793          	li	a5,49
    8b04:	00fa8023          	sb	a5,0(s5)
    8b08:	02012783          	lw	a5,32(sp)
    8b0c:	001a8d13          	add	s10,s5,1
    8b10:	00178a13          	add	s4,a5,1
    8b14:	01812583          	lw	a1,24(sp)
    8b18:	00040513          	mv	a0,s0
    8b1c:	001a0a13          	add	s4,s4,1
    8b20:	00d000ef          	jal	932c <_Bfree>
    8b24:	c20918e3          	bnez	s2,8754 <_dtoa_r+0xbc8>
    8b28:	c39ff06f          	j	8760 <_dtoa_r+0xbd4>
    8b2c:	00050593          	mv	a1,a0
    8b30:	00098613          	mv	a2,s3
    8b34:	00040513          	mv	a0,s0
    8b38:	66d000ef          	jal	99a4 <__pow5mult>
    8b3c:	00100793          	li	a5,1
    8b40:	00a12c23          	sw	a0,24(sp)
    8b44:	1147de63          	bge	a5,s4,8c60 <_dtoa_r+0x10d4>
    8b48:	00000993          	li	s3,0
    8b4c:	01812703          	lw	a4,24(sp)
    8b50:	01072783          	lw	a5,16(a4)
    8b54:	00378793          	add	a5,a5,3
    8b58:	00279793          	sll	a5,a5,0x2
    8b5c:	00f707b3          	add	a5,a4,a5
    8b60:	0047a503          	lw	a0,4(a5)
    8b64:	171000ef          	jal	94d4 <__hi0bits>
    8b68:	02000793          	li	a5,32
    8b6c:	40a787b3          	sub	a5,a5,a0
    8b70:	ab5ff06f          	j	8624 <_dtoa_r+0xa98>
    8b74:	02412783          	lw	a5,36(sp)
    8b78:	04079063          	bnez	a5,8bb8 <_dtoa_r+0x102c>
    8b7c:	00012783          	lw	a5,0(sp)
    8b80:	00c79793          	sll	a5,a5,0xc
    8b84:	02079a63          	bnez	a5,8bb8 <_dtoa_r+0x102c>
    8b88:	00012683          	lw	a3,0(sp)
    8b8c:	00000793          	li	a5,0
    8b90:	0146d713          	srl	a4,a3,0x14
    8b94:	7ff77713          	and	a4,a4,2047
    8b98:	00070c63          	beqz	a4,8bb0 <_dtoa_r+0x1024>
    8b9c:	01012783          	lw	a5,16(sp)
    8ba0:	001b0b13          	add	s6,s6,1
    8ba4:	00178793          	add	a5,a5,1
    8ba8:	00f12823          	sw	a5,16(sp)
    8bac:	00100793          	li	a5,1
    8bb0:	58099063          	bnez	s3,9130 <_dtoa_r+0x15a4>
    8bb4:	00078993          	mv	s3,a5
    8bb8:	00100793          	li	a5,1
    8bbc:	a69ff06f          	j	8624 <_dtoa_r+0xa98>
    8bc0:	a8d70ee3          	beq	a4,a3,865c <_dtoa_r+0xad0>
    8bc4:	03c00713          	li	a4,60
    8bc8:	40f707b3          	sub	a5,a4,a5
    8bcc:	a7dff06f          	j	8648 <_dtoa_r+0xabc>
    8bd0:	00100793          	li	a5,1
    8bd4:	00500a13          	li	s4,5
    8bd8:	02f12423          	sw	a5,40(sp)
    8bdc:	01412783          	lw	a5,20(sp)
    8be0:	02012703          	lw	a4,32(sp)
    8be4:	00e787b3          	add	a5,a5,a4
    8be8:	00178c13          	add	s8,a5,1
    8bec:	02f12e23          	sw	a5,60(sp)
    8bf0:	000c0613          	mv	a2,s8
    8bf4:	ab804263          	bgtz	s8,7e98 <_dtoa_r+0x30c>
    8bf8:	00100613          	li	a2,1
    8bfc:	a9cff06f          	j	7e98 <_dtoa_r+0x30c>
    8c00:	00051663          	bnez	a0,8c0c <_dtoa_r+0x1080>
    8c04:	001bf793          	and	a5,s7,1
    8c08:	b00792e3          	bnez	a5,870c <_dtoa_r+0xb80>
    8c0c:	03000693          	li	a3,48
    8c10:	fff9c783          	lbu	a5,-1(s3)
    8c14:	00098d13          	mv	s10,s3
    8c18:	fff98993          	add	s3,s3,-1
    8c1c:	fed78ae3          	beq	a5,a3,8c10 <_dtoa_r+0x1084>
    8c20:	b11ff06f          	j	8730 <_dtoa_r+0xba4>
    8c24:	000c0993          	mv	s3,s8
    8c28:	abdff06f          	j	86e4 <_dtoa_r+0xb58>
    8c2c:	000b0793          	mv	a5,s6
    8c30:	99dff06f          	j	85cc <_dtoa_r+0xa40>
    8c34:	03012783          	lw	a5,48(sp)
    8c38:	01012703          	lw	a4,16(sp)
    8c3c:	03712823          	sw	s7,48(sp)
    8c40:	40fb87b3          	sub	a5,s7,a5
    8c44:	00f989b3          	add	s3,s3,a5
    8c48:	018707b3          	add	a5,a4,s8
    8c4c:	00070c93          	mv	s9,a4
    8c50:	018b0b33          	add	s6,s6,s8
    8c54:	00f12823          	sw	a5,16(sp)
    8c58:	00000b93          	li	s7,0
    8c5c:	bd9ff06f          	j	8834 <_dtoa_r+0xca8>
    8c60:	02412783          	lw	a5,36(sp)
    8c64:	ee0792e3          	bnez	a5,8b48 <_dtoa_r+0xfbc>
    8c68:	00012783          	lw	a5,0(sp)
    8c6c:	00c79793          	sll	a5,a5,0xc
    8c70:	ec079ce3          	bnez	a5,8b48 <_dtoa_r+0xfbc>
    8c74:	f15ff06f          	j	8b88 <_dtoa_r+0xffc>
    8c78:	01812303          	lw	t1,24(sp)
    8c7c:	01c12d03          	lw	s10,28(sp)
    8c80:	00200913          	li	s2,2
    8c84:	ad0ff06f          	j	7f54 <_dtoa_r+0x3c8>
    8c88:	00200a13          	li	s4,2
    8c8c:	02012423          	sw	zero,40(sp)
    8c90:	9f8ff06f          	j	7e88 <_dtoa_r+0x2fc>
    8c94:	dc0510e3          	bnez	a0,8a54 <_dtoa_r+0xec8>
    8c98:	001bf713          	and	a4,s7,1
    8c9c:	da0716e3          	bnez	a4,8a48 <_dtoa_r+0xebc>
    8ca0:	db5ff06f          	j	8a54 <_dtoa_r+0xec8>
    8ca4:	03900793          	li	a5,57
    8ca8:	00fc8023          	sb	a5,0(s9)
    8cac:	02012783          	lw	a5,32(sp)
    8cb0:	00090c13          	mv	s8,s2
    8cb4:	001c8993          	add	s3,s9,1
    8cb8:	00178a13          	add	s4,a5,1
    8cbc:	000b0913          	mv	s2,s6
    8cc0:	a4dff06f          	j	870c <_dtoa_r+0xb80>
    8cc4:	00100793          	li	a5,1
    8cc8:	00100c13          	li	s8,1
    8ccc:	00f12a23          	sw	a5,20(sp)
    8cd0:	e50ff06f          	j	8320 <_dtoa_r+0x794>
    8cd4:	02012423          	sw	zero,40(sp)
    8cd8:	f05ff06f          	j	8bdc <_dtoa_r+0x1050>
    8cdc:	03812703          	lw	a4,56(sp)
    8ce0:	30070e63          	beqz	a4,8ffc <_dtoa_r+0x1470>
    8ce4:	01012703          	lw	a4,16(sp)
    8ce8:	43378793          	add	a5,a5,1075
    8cec:	00fb0b33          	add	s6,s6,a5
    8cf0:	00f707b3          	add	a5,a4,a5
    8cf4:	03012b83          	lw	s7,48(sp)
    8cf8:	00070c93          	mv	s9,a4
    8cfc:	00f12823          	sw	a5,16(sp)
    8d00:	b35ff06f          	j	8834 <_dtoa_r+0xca8>
    8d04:	03100793          	li	a5,49
    8d08:	00fa8023          	sb	a5,0(s5)
    8d0c:	001a0a13          	add	s4,s4,1
    8d10:	a21ff06f          	j	8730 <_dtoa_r+0xba4>
    8d14:	02012783          	lw	a5,32(sp)
    8d18:	32078263          	beqz	a5,903c <_dtoa_r+0x14b0>
    8d1c:	40f00bb3          	neg	s7,a5
    8d20:	00fbf713          	and	a4,s7,15
    8d24:	00371713          	sll	a4,a4,0x3
    8d28:	00006797          	auipc	a5,0x6
    8d2c:	38078793          	add	a5,a5,896 # f0a8 <__mprec_tens>
    8d30:	00e787b3          	add	a5,a5,a4
    8d34:	0007a603          	lw	a2,0(a5)
    8d38:	0047a683          	lw	a3,4(a5)
    8d3c:	01812503          	lw	a0,24(sp)
    8d40:	01c12583          	lw	a1,28(sp)
    8d44:	404bdb93          	sra	s7,s7,0x4
    8d48:	3d4040ef          	jal	d11c <__muldf3>
    8d4c:	00058d13          	mv	s10,a1
    8d50:	440b8c63          	beqz	s7,91a8 <_dtoa_r+0x161c>
    8d54:	00200913          	li	s2,2
    8d58:	04812023          	sw	s0,64(sp)
    8d5c:	00006c97          	auipc	s9,0x6
    8d60:	324c8c93          	add	s9,s9,804 # f080 <__mprec_bigtens>
    8d64:	00090413          	mv	s0,s2
    8d68:	00050713          	mv	a4,a0
    8d6c:	00000613          	li	a2,0
    8d70:	00050913          	mv	s2,a0
    8d74:	001bf693          	and	a3,s7,1
    8d78:	02068063          	beqz	a3,8d98 <_dtoa_r+0x120c>
    8d7c:	000ca603          	lw	a2,0(s9)
    8d80:	004ca683          	lw	a3,4(s9)
    8d84:	00070513          	mv	a0,a4
    8d88:	00140413          	add	s0,s0,1
    8d8c:	390040ef          	jal	d11c <__muldf3>
    8d90:	00050713          	mv	a4,a0
    8d94:	00100613          	li	a2,1
    8d98:	401bdb93          	sra	s7,s7,0x1
    8d9c:	008c8c93          	add	s9,s9,8
    8da0:	fc0b9ae3          	bnez	s7,8d74 <_dtoa_r+0x11e8>
    8da4:	00090513          	mv	a0,s2
    8da8:	00058793          	mv	a5,a1
    8dac:	00040913          	mv	s2,s0
    8db0:	04012403          	lw	s0,64(sp)
    8db4:	a0061a63          	bnez	a2,7fc8 <_dtoa_r+0x43c>
    8db8:	00050713          	mv	a4,a0
    8dbc:	000d0793          	mv	a5,s10
    8dc0:	a08ff06f          	j	7fc8 <_dtoa_r+0x43c>
    8dc4:	00068593          	mv	a1,a3
    8dc8:	00070613          	mv	a2,a4
    8dcc:	00070513          	mv	a0,a4
    8dd0:	745020ef          	jal	bd14 <__adddf3>
    8dd4:	02012783          	lw	a5,32(sp)
    8dd8:	00090613          	mv	a2,s2
    8ddc:	00098693          	mv	a3,s3
    8de0:	00178a13          	add	s4,a5,1
    8de4:	00050c93          	mv	s9,a0
    8de8:	00058b13          	mv	s6,a1
    8dec:	000a0c13          	mv	s8,s4
    8df0:	124040ef          	jal	cf14 <__gedf2>
    8df4:	c4a04863          	bgtz	a0,8244 <_dtoa_r+0x6b8>
    8df8:	000c8513          	mv	a0,s9
    8dfc:	000b0593          	mv	a1,s6
    8e00:	00090613          	mv	a2,s2
    8e04:	00098693          	mv	a3,s3
    8e08:	080040ef          	jal	ce88 <__eqdf2>
    8e0c:	00051663          	bnez	a0,8e18 <_dtoa_r+0x128c>
    8e10:	001d7d13          	and	s10,s10,1
    8e14:	c20d1863          	bnez	s10,8244 <_dtoa_r+0x6b8>
    8e18:	000b8d13          	mv	s10,s7
    8e1c:	945ff06f          	j	8760 <_dtoa_r+0xbd4>
    8e20:	00492583          	lw	a1,4(s2)
    8e24:	00040513          	mv	a0,s0
    8e28:	450000ef          	jal	9278 <_Balloc>
    8e2c:	00050993          	mv	s3,a0
    8e30:	38050463          	beqz	a0,91b8 <_dtoa_r+0x162c>
    8e34:	01092603          	lw	a2,16(s2)
    8e38:	00c90593          	add	a1,s2,12
    8e3c:	00c50513          	add	a0,a0,12
    8e40:	00260613          	add	a2,a2,2
    8e44:	00261613          	sll	a2,a2,0x2
    8e48:	ccdf70ef          	jal	b14 <memcpy>
    8e4c:	00100613          	li	a2,1
    8e50:	00098593          	mv	a1,s3
    8e54:	00040513          	mv	a0,s0
    8e58:	49d000ef          	jal	9af4 <__lshift>
    8e5c:	00050b13          	mv	s6,a0
    8e60:	aa9ff06f          	j	8908 <_dtoa_r+0xd7c>
    8e64:	00090593          	mv	a1,s2
    8e68:	000b8613          	mv	a2,s7
    8e6c:	00040513          	mv	a0,s0
    8e70:	335000ef          	jal	99a4 <__pow5mult>
    8e74:	00048613          	mv	a2,s1
    8e78:	00050593          	mv	a1,a0
    8e7c:	00050913          	mv	s2,a0
    8e80:	00040513          	mv	a0,s0
    8e84:	059000ef          	jal	96dc <__multiply>
    8e88:	00050793          	mv	a5,a0
    8e8c:	00048593          	mv	a1,s1
    8e90:	00040513          	mv	a0,s0
    8e94:	00078493          	mv	s1,a5
    8e98:	494000ef          	jal	932c <_Bfree>
    8e9c:	03012783          	lw	a5,48(sp)
    8ea0:	417787b3          	sub	a5,a5,s7
    8ea4:	02f12823          	sw	a5,48(sp)
    8ea8:	f6078063          	beqz	a5,8608 <_dtoa_r+0xa7c>
    8eac:	f48ff06f          	j	85f4 <_dtoa_r+0xa68>
    8eb0:	05012603          	lw	a2,80(sp)
    8eb4:	05412683          	lw	a3,84(sp)
    8eb8:	05812503          	lw	a0,88(sp)
    8ebc:	04b12623          	sw	a1,76(sp)
    8ec0:	000b8593          	mv	a1,s7
    8ec4:	02612423          	sw	t1,40(sp)
    8ec8:	254040ef          	jal	d11c <__muldf3>
    8ecc:	02812303          	lw	t1,40(sp)
    8ed0:	04812783          	lw	a5,72(sp)
    8ed4:	00100693          	li	a3,1
    8ed8:	006a8023          	sb	t1,0(s5)
    8edc:	02a12c23          	sw	a0,56(sp)
    8ee0:	04c12883          	lw	a7,76(sp)
    8ee4:	00058913          	mv	s2,a1
    8ee8:	00fa8bb3          	add	s7,s5,a5
    8eec:	7fff8617          	auipc	a2,0x7fff8
    8ef0:	80460613          	add	a2,a2,-2044 # 800006f0 <__global_locale+0x1bc>
    8ef4:	28d78c63          	beq	a5,a3,918c <_dtoa_r+0x1600>
    8ef8:	00062783          	lw	a5,0(a2)
    8efc:	00462803          	lw	a6,4(a2)
    8f00:	04912423          	sw	s1,72(sp)
    8f04:	02f12423          	sw	a5,40(sp)
    8f08:	03012623          	sw	a6,44(sp)
    8f0c:	04812623          	sw	s0,76(sp)
    8f10:	000c8513          	mv	a0,s9
    8f14:	00088593          	mv	a1,a7
    8f18:	02812603          	lw	a2,40(sp)
    8f1c:	02c12683          	lw	a3,44(sp)
    8f20:	001d0d13          	add	s10,s10,1
    8f24:	1f8040ef          	jal	d11c <__muldf3>
    8f28:	00058413          	mv	s0,a1
    8f2c:	00050493          	mv	s1,a0
    8f30:	2d8050ef          	jal	e208 <__fixdfsi>
    8f34:	00050c93          	mv	s9,a0
    8f38:	354050ef          	jal	e28c <__floatsidf>
    8f3c:	00050613          	mv	a2,a0
    8f40:	00058693          	mv	a3,a1
    8f44:	00048513          	mv	a0,s1
    8f48:	00040593          	mv	a1,s0
    8f4c:	030c8c93          	add	s9,s9,48
    8f50:	15d040ef          	jal	d8ac <__subdf3>
    8f54:	ff9d0fa3          	sb	s9,-1(s10)
    8f58:	fdab90e3          	bne	s7,s10,8f18 <_dtoa_r+0x138c>
    8f5c:	04812483          	lw	s1,72(sp)
    8f60:	04c12403          	lw	s0,76(sp)
    8f64:	00050c93          	mv	s9,a0
    8f68:	00058893          	mv	a7,a1
    8f6c:	7fff7d17          	auipc	s10,0x7fff7
    8f70:	74cd0d13          	add	s10,s10,1868 # 800006b8 <__global_locale+0x184>
    8f74:	000d2603          	lw	a2,0(s10)
    8f78:	004d2683          	lw	a3,4(s10)
    8f7c:	03812503          	lw	a0,56(sp)
    8f80:	00090593          	mv	a1,s2
    8f84:	03112423          	sw	a7,40(sp)
    8f88:	58d020ef          	jal	bd14 <__adddf3>
    8f8c:	02812883          	lw	a7,40(sp)
    8f90:	000c8613          	mv	a2,s9
    8f94:	00088693          	mv	a3,a7
    8f98:	07c040ef          	jal	d014 <__ledf2>
    8f9c:	1a054863          	bltz	a0,914c <_dtoa_r+0x15c0>
    8fa0:	03812603          	lw	a2,56(sp)
    8fa4:	000d2503          	lw	a0,0(s10)
    8fa8:	004d2583          	lw	a1,4(s10)
    8fac:	00090693          	mv	a3,s2
    8fb0:	0fd040ef          	jal	d8ac <__subdf3>
    8fb4:	02812883          	lw	a7,40(sp)
    8fb8:	000c8613          	mv	a2,s9
    8fbc:	00088693          	mv	a3,a7
    8fc0:	755030ef          	jal	cf14 <__gedf2>
    8fc4:	12a04863          	bgtz	a0,90f4 <_dtoa_r+0x1568>
    8fc8:	06c12783          	lw	a5,108(sp)
    8fcc:	de07c063          	bltz	a5,85ac <_dtoa_r+0xa20>
    8fd0:	02012703          	lw	a4,32(sp)
    8fd4:	00e00793          	li	a5,14
    8fd8:	dce7ca63          	blt	a5,a4,85ac <_dtoa_r+0xa20>
    8fdc:	02012783          	lw	a5,32(sp)
    8fe0:	00006717          	auipc	a4,0x6
    8fe4:	0c870713          	add	a4,a4,200 # f0a8 <__mprec_tens>
    8fe8:	00379793          	sll	a5,a5,0x3
    8fec:	00f707b3          	add	a5,a4,a5
    8ff0:	0007a903          	lw	s2,0(a5)
    8ff4:	0047a983          	lw	s3,4(a5)
    8ff8:	c90ff06f          	j	8488 <_dtoa_r+0x8fc>
    8ffc:	06812703          	lw	a4,104(sp)
    9000:	01012683          	lw	a3,16(sp)
    9004:	03600793          	li	a5,54
    9008:	40e787b3          	sub	a5,a5,a4
    900c:	00fb0b33          	add	s6,s6,a5
    9010:	00f687b3          	add	a5,a3,a5
    9014:	03012b83          	lw	s7,48(sp)
    9018:	00068c93          	mv	s9,a3
    901c:	00f12823          	sw	a5,16(sp)
    9020:	815ff06f          	j	8834 <_dtoa_r+0xca8>
    9024:	02012783          	lw	a5,32(sp)
    9028:	00090c13          	mv	s8,s2
    902c:	01012a83          	lw	s5,16(sp)
    9030:	00178a13          	add	s4,a5,1
    9034:	000b0913          	mv	s2,s6
    9038:	eb4ff06f          	j	86ec <_dtoa_r+0xb60>
    903c:	01812703          	lw	a4,24(sp)
    9040:	01c12783          	lw	a5,28(sp)
    9044:	00200913          	li	s2,2
    9048:	f81fe06f          	j	7fc8 <_dtoa_r+0x43c>
    904c:	b00c0063          	beqz	s8,834c <_dtoa_r+0x7c0>
    9050:	03c12d03          	lw	s10,60(sp)
    9054:	bba05063          	blez	s10,83f4 <_dtoa_r+0x868>
    9058:	7fff7617          	auipc	a2,0x7fff7
    905c:	69860613          	add	a2,a2,1688 # 800006f0 <__global_locale+0x1bc>
    9060:	00078593          	mv	a1,a5
    9064:	02012783          	lw	a5,32(sp)
    9068:	00462683          	lw	a3,4(a2)
    906c:	00062603          	lw	a2,0(a2)
    9070:	fff78793          	add	a5,a5,-1
    9074:	00070513          	mv	a0,a4
    9078:	04f12e23          	sw	a5,92(sp)
    907c:	0a0040ef          	jal	d11c <__muldf3>
    9080:	00050713          	mv	a4,a0
    9084:	00190513          	add	a0,s2,1
    9088:	04e12423          	sw	a4,72(sp)
    908c:	04b12023          	sw	a1,64(sp)
    9090:	1fc050ef          	jal	e28c <__floatsidf>
    9094:	04812703          	lw	a4,72(sp)
    9098:	04012783          	lw	a5,64(sp)
    909c:	00070613          	mv	a2,a4
    90a0:	00078693          	mv	a3,a5
    90a4:	04e12623          	sw	a4,76(sp)
    90a8:	074040ef          	jal	d11c <__muldf3>
    90ac:	7fff7697          	auipc	a3,0x7fff7
    90b0:	64c68693          	add	a3,a3,1612 # 800006f8 <__global_locale+0x1c4>
    90b4:	0006a603          	lw	a2,0(a3)
    90b8:	0046a683          	lw	a3,4(a3)
    90bc:	459020ef          	jal	bd14 <__adddf3>
    90c0:	fcc006b7          	lui	a3,0xfcc00
    90c4:	04012783          	lw	a5,64(sp)
    90c8:	04c12703          	lw	a4,76(sp)
    90cc:	00050c93          	mv	s9,a0
    90d0:	00b68bb3          	add	s7,a3,a1
    90d4:	05a12423          	sw	s10,72(sp)
    90d8:	f91fe06f          	j	8068 <_dtoa_r+0x4dc>
    90dc:	03100693          	li	a3,49
    90e0:	001c0c13          	add	s8,s8,1
    90e4:	984ff06f          	j	8268 <_dtoa_r+0x6dc>
    90e8:	00012c23          	sw	zero,24(sp)
    90ec:	00000913          	li	s2,0
    90f0:	a11ff06f          	j	8b00 <_dtoa_r+0xf74>
    90f4:	03000613          	li	a2,48
    90f8:	fffbc783          	lbu	a5,-1(s7)
    90fc:	000b8d13          	mv	s10,s7
    9100:	fffb8b93          	add	s7,s7,-1
    9104:	fec78ae3          	beq	a5,a2,90f8 <_dtoa_r+0x156c>
    9108:	05c12783          	lw	a5,92(sp)
    910c:	00178a13          	add	s4,a5,1
    9110:	e50ff06f          	j	8760 <_dtoa_r+0xbd4>
    9114:	03900713          	li	a4,57
    9118:	01012a83          	lw	s5,16(sp)
    911c:	b8eb84e3          	beq	s7,a4,8ca4 <_dtoa_r+0x1118>
    9120:	933048e3          	bgtz	s3,8a50 <_dtoa_r+0xec4>
    9124:	931ff06f          	j	8a54 <_dtoa_r+0xec8>
    9128:	01012a83          	lw	s5,16(sp)
    912c:	929ff06f          	j	8a54 <_dtoa_r+0xec8>
    9130:	00078993          	mv	s3,a5
    9134:	a19ff06f          	j	8b4c <_dtoa_r+0xfc0>
    9138:	00078c93          	mv	s9,a5
    913c:	018787b3          	add	a5,a5,s8
    9140:	018b0b33          	add	s6,s6,s8
    9144:	00f12823          	sw	a5,16(sp)
    9148:	eecff06f          	j	8834 <_dtoa_r+0xca8>
    914c:	05c12783          	lw	a5,92(sp)
    9150:	00178c13          	add	s8,a5,1
    9154:	8f0ff06f          	j	8244 <_dtoa_r+0x6b8>
    9158:	04c12983          	lw	s3,76(sp)
    915c:	05012b03          	lw	s6,80(sp)
    9160:	05812c03          	lw	s8,88(sp)
    9164:	04812a03          	lw	s4,72(sp)
    9168:	a8cff06f          	j	83f4 <_dtoa_r+0x868>
    916c:	00200793          	li	a5,2
    9170:	0147c863          	blt	a5,s4,9180 <_dtoa_r+0x15f4>
    9174:	02012a03          	lw	s4,32(sp)
    9178:	03c12c03          	lw	s8,60(sp)
    917c:	d1cff06f          	j	8698 <_dtoa_r+0xb0c>
    9180:	03c12c03          	lw	s8,60(sp)
    9184:	03612023          	sw	s6,32(sp)
    9188:	949ff06f          	j	8ad0 <_dtoa_r+0xf44>
    918c:	04012b83          	lw	s7,64(sp)
    9190:	dddff06f          	j	8f6c <_dtoa_r+0x13e0>
    9194:	00200793          	li	a5,2
    9198:	ff47c4e3          	blt	a5,s4,9180 <_dtoa_r+0x15f4>
    919c:	03c12c03          	lw	s8,60(sp)
    91a0:	03612023          	sw	s6,32(sp)
    91a4:	f44ff06f          	j	88e8 <_dtoa_r+0xd5c>
    91a8:	00050713          	mv	a4,a0
    91ac:	00058793          	mv	a5,a1
    91b0:	00200913          	li	s2,2
    91b4:	e15fe06f          	j	7fc8 <_dtoa_r+0x43c>
    91b8:	00006697          	auipc	a3,0x6
    91bc:	8b468693          	add	a3,a3,-1868 # ea6c <__fini_array_end+0x128>
    91c0:	00000613          	li	a2,0
    91c4:	2ef00593          	li	a1,751
    91c8:	00006517          	auipc	a0,0x6
    91cc:	8b850513          	add	a0,a0,-1864 # ea80 <__fini_array_end+0x13c>
    91d0:	0cd010ef          	jal	aa9c <__assert_func>
    91d4:	01012a83          	lw	s5,16(sp)
    91d8:	85b048e3          	bgtz	s11,8a28 <_dtoa_r+0xe9c>
    91dc:	879ff06f          	j	8a54 <_dtoa_r+0xec8>
    91e0:	00006697          	auipc	a3,0x6
    91e4:	88c68693          	add	a3,a3,-1908 # ea6c <__fini_array_end+0x128>
    91e8:	00000613          	li	a2,0
    91ec:	1af00593          	li	a1,431
    91f0:	00006517          	auipc	a0,0x6
    91f4:	89050513          	add	a0,a0,-1904 # ea80 <__fini_array_end+0x13c>
    91f8:	0a5010ef          	jal	aa9c <__assert_func>
    91fc:	02042e23          	sw	zero,60(s0)
    9200:	00000593          	li	a1,0
    9204:	cc1fe06f          	j	7ec4 <_dtoa_r+0x338>
    9208:	02012423          	sw	zero,40(sp)
    920c:	c7dfe06f          	j	7e88 <_dtoa_r+0x2fc>

00009210 <__ascii_mbtowc>:
    9210:	02058063          	beqz	a1,9230 <__ascii_mbtowc+0x20>
    9214:	04060263          	beqz	a2,9258 <__ascii_mbtowc+0x48>
    9218:	04068863          	beqz	a3,9268 <__ascii_mbtowc+0x58>
    921c:	00064783          	lbu	a5,0(a2)
    9220:	00f5a023          	sw	a5,0(a1)
    9224:	00064503          	lbu	a0,0(a2)
    9228:	00a03533          	snez	a0,a0
    922c:	00008067          	ret
    9230:	ff010113          	add	sp,sp,-16
    9234:	00c10593          	add	a1,sp,12
    9238:	02060463          	beqz	a2,9260 <__ascii_mbtowc+0x50>
    923c:	02068a63          	beqz	a3,9270 <__ascii_mbtowc+0x60>
    9240:	00064783          	lbu	a5,0(a2)
    9244:	00f5a023          	sw	a5,0(a1)
    9248:	00064503          	lbu	a0,0(a2)
    924c:	00a03533          	snez	a0,a0
    9250:	01010113          	add	sp,sp,16
    9254:	00008067          	ret
    9258:	00000513          	li	a0,0
    925c:	00008067          	ret
    9260:	00000513          	li	a0,0
    9264:	fedff06f          	j	9250 <__ascii_mbtowc+0x40>
    9268:	ffe00513          	li	a0,-2
    926c:	00008067          	ret
    9270:	ffe00513          	li	a0,-2
    9274:	fddff06f          	j	9250 <__ascii_mbtowc+0x40>

00009278 <_Balloc>:
    9278:	04452783          	lw	a5,68(a0)
    927c:	ff010113          	add	sp,sp,-16
    9280:	00812423          	sw	s0,8(sp)
    9284:	00912223          	sw	s1,4(sp)
    9288:	00112623          	sw	ra,12(sp)
    928c:	00050413          	mv	s0,a0
    9290:	00058493          	mv	s1,a1
    9294:	02078c63          	beqz	a5,92cc <_Balloc+0x54>
    9298:	00249713          	sll	a4,s1,0x2
    929c:	00e787b3          	add	a5,a5,a4
    92a0:	0007a503          	lw	a0,0(a5)
    92a4:	04050463          	beqz	a0,92ec <_Balloc+0x74>
    92a8:	00052703          	lw	a4,0(a0)
    92ac:	00e7a023          	sw	a4,0(a5)
    92b0:	00052823          	sw	zero,16(a0)
    92b4:	00052623          	sw	zero,12(a0)
    92b8:	00c12083          	lw	ra,12(sp)
    92bc:	00812403          	lw	s0,8(sp)
    92c0:	00412483          	lw	s1,4(sp)
    92c4:	01010113          	add	sp,sp,16
    92c8:	00008067          	ret
    92cc:	02100613          	li	a2,33
    92d0:	00400593          	li	a1,4
    92d4:	021010ef          	jal	aaf4 <_calloc_r>
    92d8:	04a42223          	sw	a0,68(s0)
    92dc:	00050793          	mv	a5,a0
    92e0:	fa051ce3          	bnez	a0,9298 <_Balloc+0x20>
    92e4:	00000513          	li	a0,0
    92e8:	fd1ff06f          	j	92b8 <_Balloc+0x40>
    92ec:	01212023          	sw	s2,0(sp)
    92f0:	00100913          	li	s2,1
    92f4:	00991933          	sll	s2,s2,s1
    92f8:	00590613          	add	a2,s2,5
    92fc:	00261613          	sll	a2,a2,0x2
    9300:	00100593          	li	a1,1
    9304:	00040513          	mv	a0,s0
    9308:	7ec010ef          	jal	aaf4 <_calloc_r>
    930c:	00050a63          	beqz	a0,9320 <_Balloc+0xa8>
    9310:	01252423          	sw	s2,8(a0)
    9314:	00952223          	sw	s1,4(a0)
    9318:	00012903          	lw	s2,0(sp)
    931c:	f95ff06f          	j	92b0 <_Balloc+0x38>
    9320:	00012903          	lw	s2,0(sp)
    9324:	00000513          	li	a0,0
    9328:	f91ff06f          	j	92b8 <_Balloc+0x40>

0000932c <_Bfree>:
    932c:	02058063          	beqz	a1,934c <_Bfree+0x20>
    9330:	0045a703          	lw	a4,4(a1)
    9334:	04452783          	lw	a5,68(a0)
    9338:	00271713          	sll	a4,a4,0x2
    933c:	00e787b3          	add	a5,a5,a4
    9340:	0007a703          	lw	a4,0(a5)
    9344:	00e5a023          	sw	a4,0(a1)
    9348:	00b7a023          	sw	a1,0(a5)
    934c:	00008067          	ret

00009350 <__multadd>:
    9350:	fd010113          	add	sp,sp,-48
    9354:	01412c23          	sw	s4,24(sp)
    9358:	0105aa03          	lw	s4,16(a1)
    935c:	01912223          	sw	s9,4(sp)
    9360:	00010cb7          	lui	s9,0x10
    9364:	02912223          	sw	s1,36(sp)
    9368:	03212023          	sw	s2,32(sp)
    936c:	01312e23          	sw	s3,28(sp)
    9370:	01512a23          	sw	s5,20(sp)
    9374:	01612823          	sw	s6,16(sp)
    9378:	01712623          	sw	s7,12(sp)
    937c:	02112623          	sw	ra,44(sp)
    9380:	02812423          	sw	s0,40(sp)
    9384:	01812423          	sw	s8,8(sp)
    9388:	00058a93          	mv	s5,a1
    938c:	00050b13          	mv	s6,a0
    9390:	00060993          	mv	s3,a2
    9394:	00068493          	mv	s1,a3
    9398:	01458913          	add	s2,a1,20
    939c:	00000b93          	li	s7,0
    93a0:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    93a4:	00092c03          	lw	s8,0(s2)
    93a8:	00098593          	mv	a1,s3
    93ac:	00490913          	add	s2,s2,4
    93b0:	019c7533          	and	a0,s8,s9
    93b4:	430050ef          	jal	e7e4 <__mulsi3>
    93b8:	00050413          	mv	s0,a0
    93bc:	00098593          	mv	a1,s3
    93c0:	010c5513          	srl	a0,s8,0x10
    93c4:	00940433          	add	s0,s0,s1
    93c8:	41c050ef          	jal	e7e4 <__mulsi3>
    93cc:	01045793          	srl	a5,s0,0x10
    93d0:	00f50533          	add	a0,a0,a5
    93d4:	01051793          	sll	a5,a0,0x10
    93d8:	01947433          	and	s0,s0,s9
    93dc:	008787b3          	add	a5,a5,s0
    93e0:	fef92e23          	sw	a5,-4(s2)
    93e4:	001b8b93          	add	s7,s7,1
    93e8:	01055493          	srl	s1,a0,0x10
    93ec:	fb4bcce3          	blt	s7,s4,93a4 <__multadd+0x54>
    93f0:	02048263          	beqz	s1,9414 <__multadd+0xc4>
    93f4:	008aa783          	lw	a5,8(s5)
    93f8:	04fa5a63          	bge	s4,a5,944c <__multadd+0xfc>
    93fc:	004a0793          	add	a5,s4,4
    9400:	00279793          	sll	a5,a5,0x2
    9404:	00fa87b3          	add	a5,s5,a5
    9408:	0097a223          	sw	s1,4(a5)
    940c:	001a0a13          	add	s4,s4,1
    9410:	014aa823          	sw	s4,16(s5)
    9414:	02c12083          	lw	ra,44(sp)
    9418:	02812403          	lw	s0,40(sp)
    941c:	02412483          	lw	s1,36(sp)
    9420:	02012903          	lw	s2,32(sp)
    9424:	01c12983          	lw	s3,28(sp)
    9428:	01812a03          	lw	s4,24(sp)
    942c:	01012b03          	lw	s6,16(sp)
    9430:	00c12b83          	lw	s7,12(sp)
    9434:	00812c03          	lw	s8,8(sp)
    9438:	00412c83          	lw	s9,4(sp)
    943c:	000a8513          	mv	a0,s5
    9440:	01412a83          	lw	s5,20(sp)
    9444:	03010113          	add	sp,sp,48
    9448:	00008067          	ret
    944c:	004aa583          	lw	a1,4(s5)
    9450:	000b0513          	mv	a0,s6
    9454:	00158593          	add	a1,a1,1
    9458:	e21ff0ef          	jal	9278 <_Balloc>
    945c:	00050413          	mv	s0,a0
    9460:	04050c63          	beqz	a0,94b8 <__multadd+0x168>
    9464:	010aa603          	lw	a2,16(s5)
    9468:	00ca8593          	add	a1,s5,12
    946c:	00c50513          	add	a0,a0,12
    9470:	00260613          	add	a2,a2,2
    9474:	00261613          	sll	a2,a2,0x2
    9478:	e9cf70ef          	jal	b14 <memcpy>
    947c:	004aa703          	lw	a4,4(s5)
    9480:	044b2783          	lw	a5,68(s6)
    9484:	00271713          	sll	a4,a4,0x2
    9488:	00e787b3          	add	a5,a5,a4
    948c:	0007a703          	lw	a4,0(a5)
    9490:	00eaa023          	sw	a4,0(s5)
    9494:	0157a023          	sw	s5,0(a5)
    9498:	004a0793          	add	a5,s4,4
    949c:	00040a93          	mv	s5,s0
    94a0:	00279793          	sll	a5,a5,0x2
    94a4:	00fa87b3          	add	a5,s5,a5
    94a8:	0097a223          	sw	s1,4(a5)
    94ac:	001a0a13          	add	s4,s4,1
    94b0:	014aa823          	sw	s4,16(s5)
    94b4:	f61ff06f          	j	9414 <__multadd+0xc4>
    94b8:	00005697          	auipc	a3,0x5
    94bc:	5b468693          	add	a3,a3,1460 # ea6c <__fini_array_end+0x128>
    94c0:	00000613          	li	a2,0
    94c4:	0ba00593          	li	a1,186
    94c8:	00005517          	auipc	a0,0x5
    94cc:	63850513          	add	a0,a0,1592 # eb00 <__fini_array_end+0x1bc>
    94d0:	5cc010ef          	jal	aa9c <__assert_func>

000094d4 <__hi0bits>:
    94d4:	00050793          	mv	a5,a0
    94d8:	00010737          	lui	a4,0x10
    94dc:	00000513          	li	a0,0
    94e0:	00e7f663          	bgeu	a5,a4,94ec <__hi0bits+0x18>
    94e4:	01079793          	sll	a5,a5,0x10
    94e8:	01000513          	li	a0,16
    94ec:	01000737          	lui	a4,0x1000
    94f0:	00e7f663          	bgeu	a5,a4,94fc <__hi0bits+0x28>
    94f4:	00850513          	add	a0,a0,8
    94f8:	00879793          	sll	a5,a5,0x8
    94fc:	10000737          	lui	a4,0x10000
    9500:	00e7f663          	bgeu	a5,a4,950c <__hi0bits+0x38>
    9504:	00450513          	add	a0,a0,4
    9508:	00479793          	sll	a5,a5,0x4
    950c:	40000737          	lui	a4,0x40000
    9510:	00e7ea63          	bltu	a5,a4,9524 <__hi0bits+0x50>
    9514:	fff7c793          	not	a5,a5
    9518:	01f7d793          	srl	a5,a5,0x1f
    951c:	00f50533          	add	a0,a0,a5
    9520:	00008067          	ret
    9524:	00279793          	sll	a5,a5,0x2
    9528:	0007ca63          	bltz	a5,953c <__hi0bits+0x68>
    952c:	00179713          	sll	a4,a5,0x1
    9530:	00074a63          	bltz	a4,9544 <__hi0bits+0x70>
    9534:	02000513          	li	a0,32
    9538:	00008067          	ret
    953c:	00250513          	add	a0,a0,2
    9540:	00008067          	ret
    9544:	00350513          	add	a0,a0,3
    9548:	00008067          	ret

0000954c <__lo0bits>:
    954c:	00052783          	lw	a5,0(a0)
    9550:	00050713          	mv	a4,a0
    9554:	0077f693          	and	a3,a5,7
    9558:	02068463          	beqz	a3,9580 <__lo0bits+0x34>
    955c:	0017f693          	and	a3,a5,1
    9560:	00000513          	li	a0,0
    9564:	04069e63          	bnez	a3,95c0 <__lo0bits+0x74>
    9568:	0027f693          	and	a3,a5,2
    956c:	0a068863          	beqz	a3,961c <__lo0bits+0xd0>
    9570:	0017d793          	srl	a5,a5,0x1
    9574:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9578:	00100513          	li	a0,1
    957c:	00008067          	ret
    9580:	01079693          	sll	a3,a5,0x10
    9584:	0106d693          	srl	a3,a3,0x10
    9588:	00000513          	li	a0,0
    958c:	06068e63          	beqz	a3,9608 <__lo0bits+0xbc>
    9590:	0ff7f693          	zext.b	a3,a5
    9594:	06068063          	beqz	a3,95f4 <__lo0bits+0xa8>
    9598:	00f7f693          	and	a3,a5,15
    959c:	04068263          	beqz	a3,95e0 <__lo0bits+0x94>
    95a0:	0037f693          	and	a3,a5,3
    95a4:	02068463          	beqz	a3,95cc <__lo0bits+0x80>
    95a8:	0017f693          	and	a3,a5,1
    95ac:	00069c63          	bnez	a3,95c4 <__lo0bits+0x78>
    95b0:	0017d793          	srl	a5,a5,0x1
    95b4:	00150513          	add	a0,a0,1
    95b8:	00079663          	bnez	a5,95c4 <__lo0bits+0x78>
    95bc:	02000513          	li	a0,32
    95c0:	00008067          	ret
    95c4:	00f72023          	sw	a5,0(a4)
    95c8:	00008067          	ret
    95cc:	0027d793          	srl	a5,a5,0x2
    95d0:	0017f693          	and	a3,a5,1
    95d4:	00250513          	add	a0,a0,2
    95d8:	fe0696e3          	bnez	a3,95c4 <__lo0bits+0x78>
    95dc:	fd5ff06f          	j	95b0 <__lo0bits+0x64>
    95e0:	0047d793          	srl	a5,a5,0x4
    95e4:	0037f693          	and	a3,a5,3
    95e8:	00450513          	add	a0,a0,4
    95ec:	fa069ee3          	bnez	a3,95a8 <__lo0bits+0x5c>
    95f0:	fddff06f          	j	95cc <__lo0bits+0x80>
    95f4:	0087d793          	srl	a5,a5,0x8
    95f8:	00f7f693          	and	a3,a5,15
    95fc:	00850513          	add	a0,a0,8
    9600:	fa0690e3          	bnez	a3,95a0 <__lo0bits+0x54>
    9604:	fddff06f          	j	95e0 <__lo0bits+0x94>
    9608:	0107d793          	srl	a5,a5,0x10
    960c:	0ff7f693          	zext.b	a3,a5
    9610:	01000513          	li	a0,16
    9614:	f80692e3          	bnez	a3,9598 <__lo0bits+0x4c>
    9618:	fddff06f          	j	95f4 <__lo0bits+0xa8>
    961c:	0027d793          	srl	a5,a5,0x2
    9620:	00f72023          	sw	a5,0(a4)
    9624:	00200513          	li	a0,2
    9628:	00008067          	ret

0000962c <__i2b>:
    962c:	04452783          	lw	a5,68(a0)
    9630:	ff010113          	add	sp,sp,-16
    9634:	00812423          	sw	s0,8(sp)
    9638:	00912223          	sw	s1,4(sp)
    963c:	00112623          	sw	ra,12(sp)
    9640:	00050413          	mv	s0,a0
    9644:	00058493          	mv	s1,a1
    9648:	02078c63          	beqz	a5,9680 <__i2b+0x54>
    964c:	0047a503          	lw	a0,4(a5)
    9650:	06050263          	beqz	a0,96b4 <__i2b+0x88>
    9654:	00052703          	lw	a4,0(a0)
    9658:	00e7a223          	sw	a4,4(a5)
    965c:	00c12083          	lw	ra,12(sp)
    9660:	00812403          	lw	s0,8(sp)
    9664:	00100793          	li	a5,1
    9668:	00952a23          	sw	s1,20(a0)
    966c:	00052623          	sw	zero,12(a0)
    9670:	00f52823          	sw	a5,16(a0)
    9674:	00412483          	lw	s1,4(sp)
    9678:	01010113          	add	sp,sp,16
    967c:	00008067          	ret
    9680:	02100613          	li	a2,33
    9684:	00400593          	li	a1,4
    9688:	46c010ef          	jal	aaf4 <_calloc_r>
    968c:	04a42223          	sw	a0,68(s0)
    9690:	00050793          	mv	a5,a0
    9694:	fa051ce3          	bnez	a0,964c <__i2b+0x20>
    9698:	00005697          	auipc	a3,0x5
    969c:	3d468693          	add	a3,a3,980 # ea6c <__fini_array_end+0x128>
    96a0:	00000613          	li	a2,0
    96a4:	14500593          	li	a1,325
    96a8:	00005517          	auipc	a0,0x5
    96ac:	45850513          	add	a0,a0,1112 # eb00 <__fini_array_end+0x1bc>
    96b0:	3ec010ef          	jal	aa9c <__assert_func>
    96b4:	01c00613          	li	a2,28
    96b8:	00100593          	li	a1,1
    96bc:	00040513          	mv	a0,s0
    96c0:	434010ef          	jal	aaf4 <_calloc_r>
    96c4:	fc050ae3          	beqz	a0,9698 <__i2b+0x6c>
    96c8:	00100793          	li	a5,1
    96cc:	00f52223          	sw	a5,4(a0)
    96d0:	00200793          	li	a5,2
    96d4:	00f52423          	sw	a5,8(a0)
    96d8:	f85ff06f          	j	965c <__i2b+0x30>

000096dc <__multiply>:
    96dc:	fb010113          	add	sp,sp,-80
    96e0:	03312e23          	sw	s3,60(sp)
    96e4:	03812423          	sw	s8,40(sp)
    96e8:	01062983          	lw	s3,16(a2)
    96ec:	0105ac03          	lw	s8,16(a1)
    96f0:	04812423          	sw	s0,72(sp)
    96f4:	03412c23          	sw	s4,56(sp)
    96f8:	04112623          	sw	ra,76(sp)
    96fc:	03712623          	sw	s7,44(sp)
    9700:	00058a13          	mv	s4,a1
    9704:	00060413          	mv	s0,a2
    9708:	013c4c63          	blt	s8,s3,9720 <__multiply+0x44>
    970c:	00098713          	mv	a4,s3
    9710:	00058413          	mv	s0,a1
    9714:	000c0993          	mv	s3,s8
    9718:	00060a13          	mv	s4,a2
    971c:	00070c13          	mv	s8,a4
    9720:	00842783          	lw	a5,8(s0)
    9724:	00442583          	lw	a1,4(s0)
    9728:	01898bb3          	add	s7,s3,s8
    972c:	0177a7b3          	slt	a5,a5,s7
    9730:	00f585b3          	add	a1,a1,a5
    9734:	b45ff0ef          	jal	9278 <_Balloc>
    9738:	00a12623          	sw	a0,12(sp)
    973c:	22050863          	beqz	a0,996c <__multiply+0x290>
    9740:	00c12783          	lw	a5,12(sp)
    9744:	03512a23          	sw	s5,52(sp)
    9748:	03612823          	sw	s6,48(sp)
    974c:	002b9a93          	sll	s5,s7,0x2
    9750:	01478b13          	add	s6,a5,20
    9754:	015b0ab3          	add	s5,s6,s5
    9758:	000b0793          	mv	a5,s6
    975c:	015b7863          	bgeu	s6,s5,976c <__multiply+0x90>
    9760:	0007a023          	sw	zero,0(a5)
    9764:	00478793          	add	a5,a5,4
    9768:	ff57ece3          	bltu	a5,s5,9760 <__multiply+0x84>
    976c:	014a0a13          	add	s4,s4,20
    9770:	002c1c13          	sll	s8,s8,0x2
    9774:	01440793          	add	a5,s0,20
    9778:	018a0733          	add	a4,s4,s8
    977c:	00299993          	sll	s3,s3,0x2
    9780:	00f12423          	sw	a5,8(sp)
    9784:	00e12023          	sw	a4,0(sp)
    9788:	013789b3          	add	s3,a5,s3
    978c:	16ea7c63          	bgeu	s4,a4,9904 <__multiply+0x228>
    9790:	00400713          	li	a4,4
    9794:	04912223          	sw	s1,68(sp)
    9798:	05212023          	sw	s2,64(sp)
    979c:	03912223          	sw	s9,36(sp)
    97a0:	03a12023          	sw	s10,32(sp)
    97a4:	01b12e23          	sw	s11,28(sp)
    97a8:	01540793          	add	a5,s0,21
    97ac:	00e12223          	sw	a4,4(sp)
    97b0:	1af9f263          	bgeu	s3,a5,9954 <__multiply+0x278>
    97b4:	00010437          	lui	s0,0x10
    97b8:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    97bc:	01c0006f          	j	97d8 <__multiply+0xfc>
    97c0:	01095913          	srl	s2,s2,0x10
    97c4:	0a091063          	bnez	s2,9864 <__multiply+0x188>
    97c8:	00012783          	lw	a5,0(sp)
    97cc:	004a0a13          	add	s4,s4,4
    97d0:	004b0b13          	add	s6,s6,4
    97d4:	10fa7e63          	bgeu	s4,a5,98f0 <__multiply+0x214>
    97d8:	000a2903          	lw	s2,0(s4)
    97dc:	008974b3          	and	s1,s2,s0
    97e0:	fe0480e3          	beqz	s1,97c0 <__multiply+0xe4>
    97e4:	00812c83          	lw	s9,8(sp)
    97e8:	000b0d13          	mv	s10,s6
    97ec:	00000c13          	li	s8,0
    97f0:	000cad83          	lw	s11,0(s9)
    97f4:	000d2903          	lw	s2,0(s10)
    97f8:	00048593          	mv	a1,s1
    97fc:	008df533          	and	a0,s11,s0
    9800:	7e5040ef          	jal	e7e4 <__mulsi3>
    9804:	00897733          	and	a4,s2,s0
    9808:	00e50733          	add	a4,a0,a4
    980c:	00048593          	mv	a1,s1
    9810:	010dd513          	srl	a0,s11,0x10
    9814:	01870c33          	add	s8,a4,s8
    9818:	01095913          	srl	s2,s2,0x10
    981c:	7c9040ef          	jal	e7e4 <__mulsi3>
    9820:	010c5713          	srl	a4,s8,0x10
    9824:	01250533          	add	a0,a0,s2
    9828:	00e50533          	add	a0,a0,a4
    982c:	008c77b3          	and	a5,s8,s0
    9830:	01051713          	sll	a4,a0,0x10
    9834:	004d0d13          	add	s10,s10,4
    9838:	00f767b3          	or	a5,a4,a5
    983c:	004c8c93          	add	s9,s9,4
    9840:	fefd2e23          	sw	a5,-4(s10)
    9844:	01055c13          	srl	s8,a0,0x10
    9848:	fb3ce4e3          	bltu	s9,s3,97f0 <__multiply+0x114>
    984c:	00412783          	lw	a5,4(sp)
    9850:	00fb0733          	add	a4,s6,a5
    9854:	01872023          	sw	s8,0(a4)
    9858:	000a2903          	lw	s2,0(s4)
    985c:	01095913          	srl	s2,s2,0x10
    9860:	f60904e3          	beqz	s2,97c8 <__multiply+0xec>
    9864:	000b2c83          	lw	s9,0(s6)
    9868:	00812d03          	lw	s10,8(sp)
    986c:	000b0c13          	mv	s8,s6
    9870:	000c8493          	mv	s1,s9
    9874:	00000d93          	li	s11,0
    9878:	000d2503          	lw	a0,0(s10)
    987c:	00090593          	mv	a1,s2
    9880:	0104d493          	srl	s1,s1,0x10
    9884:	00857533          	and	a0,a0,s0
    9888:	75d040ef          	jal	e7e4 <__mulsi3>
    988c:	01b50733          	add	a4,a0,s11
    9890:	00970db3          	add	s11,a4,s1
    9894:	010d9593          	sll	a1,s11,0x10
    9898:	008cf7b3          	and	a5,s9,s0
    989c:	00f5e7b3          	or	a5,a1,a5
    98a0:	00fc2023          	sw	a5,0(s8)
    98a4:	002d5503          	lhu	a0,2(s10)
    98a8:	004c2483          	lw	s1,4(s8)
    98ac:	00090593          	mv	a1,s2
    98b0:	735040ef          	jal	e7e4 <__mulsi3>
    98b4:	0084f7b3          	and	a5,s1,s0
    98b8:	010dd713          	srl	a4,s11,0x10
    98bc:	00f507b3          	add	a5,a0,a5
    98c0:	004d0d13          	add	s10,s10,4
    98c4:	00e78cb3          	add	s9,a5,a4
    98c8:	004c0c13          	add	s8,s8,4
    98cc:	010cdd93          	srl	s11,s9,0x10
    98d0:	fb3d64e3          	bltu	s10,s3,9878 <__multiply+0x19c>
    98d4:	00412783          	lw	a5,4(sp)
    98d8:	004a0a13          	add	s4,s4,4
    98dc:	00fb0733          	add	a4,s6,a5
    98e0:	00012783          	lw	a5,0(sp)
    98e4:	01972023          	sw	s9,0(a4)
    98e8:	004b0b13          	add	s6,s6,4
    98ec:	eefa66e3          	bltu	s4,a5,97d8 <__multiply+0xfc>
    98f0:	04412483          	lw	s1,68(sp)
    98f4:	04012903          	lw	s2,64(sp)
    98f8:	02412c83          	lw	s9,36(sp)
    98fc:	02012d03          	lw	s10,32(sp)
    9900:	01c12d83          	lw	s11,28(sp)
    9904:	01704863          	bgtz	s7,9914 <__multiply+0x238>
    9908:	0180006f          	j	9920 <__multiply+0x244>
    990c:	fffb8b93          	add	s7,s7,-1
    9910:	000b8863          	beqz	s7,9920 <__multiply+0x244>
    9914:	ffcaa783          	lw	a5,-4(s5)
    9918:	ffca8a93          	add	s5,s5,-4
    991c:	fe0788e3          	beqz	a5,990c <__multiply+0x230>
    9920:	00c12783          	lw	a5,12(sp)
    9924:	04c12083          	lw	ra,76(sp)
    9928:	04812403          	lw	s0,72(sp)
    992c:	0177a823          	sw	s7,16(a5)
    9930:	03412a83          	lw	s5,52(sp)
    9934:	03012b03          	lw	s6,48(sp)
    9938:	03c12983          	lw	s3,60(sp)
    993c:	03812a03          	lw	s4,56(sp)
    9940:	02c12b83          	lw	s7,44(sp)
    9944:	02812c03          	lw	s8,40(sp)
    9948:	00078513          	mv	a0,a5
    994c:	05010113          	add	sp,sp,80
    9950:	00008067          	ret
    9954:	408987b3          	sub	a5,s3,s0
    9958:	feb78793          	add	a5,a5,-21
    995c:	ffc7f793          	and	a5,a5,-4
    9960:	00478793          	add	a5,a5,4
    9964:	00f12223          	sw	a5,4(sp)
    9968:	e4dff06f          	j	97b4 <__multiply+0xd8>
    996c:	00005697          	auipc	a3,0x5
    9970:	10068693          	add	a3,a3,256 # ea6c <__fini_array_end+0x128>
    9974:	00000613          	li	a2,0
    9978:	16200593          	li	a1,354
    997c:	00005517          	auipc	a0,0x5
    9980:	18450513          	add	a0,a0,388 # eb00 <__fini_array_end+0x1bc>
    9984:	04912223          	sw	s1,68(sp)
    9988:	05212023          	sw	s2,64(sp)
    998c:	03512a23          	sw	s5,52(sp)
    9990:	03612823          	sw	s6,48(sp)
    9994:	03912223          	sw	s9,36(sp)
    9998:	03a12023          	sw	s10,32(sp)
    999c:	01b12e23          	sw	s11,28(sp)
    99a0:	0fc010ef          	jal	aa9c <__assert_func>

000099a4 <__pow5mult>:
    99a4:	fe010113          	add	sp,sp,-32
    99a8:	00812c23          	sw	s0,24(sp)
    99ac:	01212823          	sw	s2,16(sp)
    99b0:	01312623          	sw	s3,12(sp)
    99b4:	00112e23          	sw	ra,28(sp)
    99b8:	00367793          	and	a5,a2,3
    99bc:	00060413          	mv	s0,a2
    99c0:	00050993          	mv	s3,a0
    99c4:	00058913          	mv	s2,a1
    99c8:	0a079c63          	bnez	a5,9a80 <__pow5mult+0xdc>
    99cc:	40245413          	sra	s0,s0,0x2
    99d0:	06040a63          	beqz	s0,9a44 <__pow5mult+0xa0>
    99d4:	00912a23          	sw	s1,20(sp)
    99d8:	0409a483          	lw	s1,64(s3)
    99dc:	0c048663          	beqz	s1,9aa8 <__pow5mult+0x104>
    99e0:	00147793          	and	a5,s0,1
    99e4:	02079063          	bnez	a5,9a04 <__pow5mult+0x60>
    99e8:	40145413          	sra	s0,s0,0x1
    99ec:	04040a63          	beqz	s0,9a40 <__pow5mult+0x9c>
    99f0:	0004a503          	lw	a0,0(s1)
    99f4:	06050663          	beqz	a0,9a60 <__pow5mult+0xbc>
    99f8:	00050493          	mv	s1,a0
    99fc:	00147793          	and	a5,s0,1
    9a00:	fe0784e3          	beqz	a5,99e8 <__pow5mult+0x44>
    9a04:	00048613          	mv	a2,s1
    9a08:	00090593          	mv	a1,s2
    9a0c:	00098513          	mv	a0,s3
    9a10:	ccdff0ef          	jal	96dc <__multiply>
    9a14:	02090063          	beqz	s2,9a34 <__pow5mult+0x90>
    9a18:	00492703          	lw	a4,4(s2)
    9a1c:	0449a783          	lw	a5,68(s3)
    9a20:	00271713          	sll	a4,a4,0x2
    9a24:	00e787b3          	add	a5,a5,a4
    9a28:	0007a703          	lw	a4,0(a5)
    9a2c:	00e92023          	sw	a4,0(s2)
    9a30:	0127a023          	sw	s2,0(a5)
    9a34:	40145413          	sra	s0,s0,0x1
    9a38:	00050913          	mv	s2,a0
    9a3c:	fa041ae3          	bnez	s0,99f0 <__pow5mult+0x4c>
    9a40:	01412483          	lw	s1,20(sp)
    9a44:	01c12083          	lw	ra,28(sp)
    9a48:	01812403          	lw	s0,24(sp)
    9a4c:	00c12983          	lw	s3,12(sp)
    9a50:	00090513          	mv	a0,s2
    9a54:	01012903          	lw	s2,16(sp)
    9a58:	02010113          	add	sp,sp,32
    9a5c:	00008067          	ret
    9a60:	00048613          	mv	a2,s1
    9a64:	00048593          	mv	a1,s1
    9a68:	00098513          	mv	a0,s3
    9a6c:	c71ff0ef          	jal	96dc <__multiply>
    9a70:	00a4a023          	sw	a0,0(s1)
    9a74:	00052023          	sw	zero,0(a0)
    9a78:	00050493          	mv	s1,a0
    9a7c:	f81ff06f          	j	99fc <__pow5mult+0x58>
    9a80:	fff78793          	add	a5,a5,-1
    9a84:	00005717          	auipc	a4,0x5
    9a88:	5f070713          	add	a4,a4,1520 # f074 <p05.0>
    9a8c:	00279793          	sll	a5,a5,0x2
    9a90:	00f707b3          	add	a5,a4,a5
    9a94:	0007a603          	lw	a2,0(a5)
    9a98:	00000693          	li	a3,0
    9a9c:	8b5ff0ef          	jal	9350 <__multadd>
    9aa0:	00050913          	mv	s2,a0
    9aa4:	f29ff06f          	j	99cc <__pow5mult+0x28>
    9aa8:	00100593          	li	a1,1
    9aac:	00098513          	mv	a0,s3
    9ab0:	fc8ff0ef          	jal	9278 <_Balloc>
    9ab4:	00050493          	mv	s1,a0
    9ab8:	02050063          	beqz	a0,9ad8 <__pow5mult+0x134>
    9abc:	27100793          	li	a5,625
    9ac0:	00f52a23          	sw	a5,20(a0)
    9ac4:	00100793          	li	a5,1
    9ac8:	00f52823          	sw	a5,16(a0)
    9acc:	04a9a023          	sw	a0,64(s3)
    9ad0:	00052023          	sw	zero,0(a0)
    9ad4:	f0dff06f          	j	99e0 <__pow5mult+0x3c>
    9ad8:	00005697          	auipc	a3,0x5
    9adc:	f9468693          	add	a3,a3,-108 # ea6c <__fini_array_end+0x128>
    9ae0:	00000613          	li	a2,0
    9ae4:	14500593          	li	a1,325
    9ae8:	00005517          	auipc	a0,0x5
    9aec:	01850513          	add	a0,a0,24 # eb00 <__fini_array_end+0x1bc>
    9af0:	7ad000ef          	jal	aa9c <__assert_func>

00009af4 <__lshift>:
    9af4:	fe010113          	add	sp,sp,-32
    9af8:	01512223          	sw	s5,4(sp)
    9afc:	0105aa83          	lw	s5,16(a1)
    9b00:	0085a783          	lw	a5,8(a1)
    9b04:	01312623          	sw	s3,12(sp)
    9b08:	40565993          	sra	s3,a2,0x5
    9b0c:	01598ab3          	add	s5,s3,s5
    9b10:	00812c23          	sw	s0,24(sp)
    9b14:	00912a23          	sw	s1,20(sp)
    9b18:	01212823          	sw	s2,16(sp)
    9b1c:	01412423          	sw	s4,8(sp)
    9b20:	00112e23          	sw	ra,28(sp)
    9b24:	001a8913          	add	s2,s5,1
    9b28:	00058493          	mv	s1,a1
    9b2c:	00060413          	mv	s0,a2
    9b30:	0045a583          	lw	a1,4(a1)
    9b34:	00050a13          	mv	s4,a0
    9b38:	0127d863          	bge	a5,s2,9b48 <__lshift+0x54>
    9b3c:	00179793          	sll	a5,a5,0x1
    9b40:	00158593          	add	a1,a1,1
    9b44:	ff27cce3          	blt	a5,s2,9b3c <__lshift+0x48>
    9b48:	000a0513          	mv	a0,s4
    9b4c:	f2cff0ef          	jal	9278 <_Balloc>
    9b50:	10050c63          	beqz	a0,9c68 <__lshift+0x174>
    9b54:	01450813          	add	a6,a0,20
    9b58:	03305463          	blez	s3,9b80 <__lshift+0x8c>
    9b5c:	00598993          	add	s3,s3,5
    9b60:	00299993          	sll	s3,s3,0x2
    9b64:	01350733          	add	a4,a0,s3
    9b68:	00080793          	mv	a5,a6
    9b6c:	00478793          	add	a5,a5,4
    9b70:	fe07ae23          	sw	zero,-4(a5)
    9b74:	fee79ce3          	bne	a5,a4,9b6c <__lshift+0x78>
    9b78:	fec98993          	add	s3,s3,-20
    9b7c:	01380833          	add	a6,a6,s3
    9b80:	0104a883          	lw	a7,16(s1)
    9b84:	01448793          	add	a5,s1,20
    9b88:	01f47613          	and	a2,s0,31
    9b8c:	00289893          	sll	a7,a7,0x2
    9b90:	011788b3          	add	a7,a5,a7
    9b94:	0a060463          	beqz	a2,9c3c <__lshift+0x148>
    9b98:	02000593          	li	a1,32
    9b9c:	40c585b3          	sub	a1,a1,a2
    9ba0:	00080313          	mv	t1,a6
    9ba4:	00000693          	li	a3,0
    9ba8:	0007a703          	lw	a4,0(a5)
    9bac:	00430313          	add	t1,t1,4
    9bb0:	00478793          	add	a5,a5,4
    9bb4:	00c71733          	sll	a4,a4,a2
    9bb8:	00d76733          	or	a4,a4,a3
    9bbc:	fee32e23          	sw	a4,-4(t1)
    9bc0:	ffc7a683          	lw	a3,-4(a5)
    9bc4:	00b6d6b3          	srl	a3,a3,a1
    9bc8:	ff17e0e3          	bltu	a5,a7,9ba8 <__lshift+0xb4>
    9bcc:	01548793          	add	a5,s1,21
    9bd0:	00400713          	li	a4,4
    9bd4:	00f8ea63          	bltu	a7,a5,9be8 <__lshift+0xf4>
    9bd8:	409887b3          	sub	a5,a7,s1
    9bdc:	feb78793          	add	a5,a5,-21
    9be0:	ffc7f793          	and	a5,a5,-4
    9be4:	00478713          	add	a4,a5,4
    9be8:	00e80833          	add	a6,a6,a4
    9bec:	00d82023          	sw	a3,0(a6)
    9bf0:	00069463          	bnez	a3,9bf8 <__lshift+0x104>
    9bf4:	000a8913          	mv	s2,s5
    9bf8:	0044a703          	lw	a4,4(s1)
    9bfc:	044a2783          	lw	a5,68(s4)
    9c00:	01c12083          	lw	ra,28(sp)
    9c04:	00271713          	sll	a4,a4,0x2
    9c08:	00e787b3          	add	a5,a5,a4
    9c0c:	0007a703          	lw	a4,0(a5)
    9c10:	01252823          	sw	s2,16(a0)
    9c14:	01812403          	lw	s0,24(sp)
    9c18:	00e4a023          	sw	a4,0(s1)
    9c1c:	0097a023          	sw	s1,0(a5)
    9c20:	01012903          	lw	s2,16(sp)
    9c24:	01412483          	lw	s1,20(sp)
    9c28:	00c12983          	lw	s3,12(sp)
    9c2c:	00812a03          	lw	s4,8(sp)
    9c30:	00412a83          	lw	s5,4(sp)
    9c34:	02010113          	add	sp,sp,32
    9c38:	00008067          	ret
    9c3c:	0007a703          	lw	a4,0(a5)
    9c40:	00478793          	add	a5,a5,4
    9c44:	00480813          	add	a6,a6,4
    9c48:	fee82e23          	sw	a4,-4(a6)
    9c4c:	fb17f4e3          	bgeu	a5,a7,9bf4 <__lshift+0x100>
    9c50:	0007a703          	lw	a4,0(a5)
    9c54:	00478793          	add	a5,a5,4
    9c58:	00480813          	add	a6,a6,4
    9c5c:	fee82e23          	sw	a4,-4(a6)
    9c60:	fd17eee3          	bltu	a5,a7,9c3c <__lshift+0x148>
    9c64:	f91ff06f          	j	9bf4 <__lshift+0x100>
    9c68:	00005697          	auipc	a3,0x5
    9c6c:	e0468693          	add	a3,a3,-508 # ea6c <__fini_array_end+0x128>
    9c70:	00000613          	li	a2,0
    9c74:	1de00593          	li	a1,478
    9c78:	00005517          	auipc	a0,0x5
    9c7c:	e8850513          	add	a0,a0,-376 # eb00 <__fini_array_end+0x1bc>
    9c80:	61d000ef          	jal	aa9c <__assert_func>

00009c84 <__mcmp>:
    9c84:	01052703          	lw	a4,16(a0)
    9c88:	0105a783          	lw	a5,16(a1)
    9c8c:	00050813          	mv	a6,a0
    9c90:	40f70533          	sub	a0,a4,a5
    9c94:	04f71263          	bne	a4,a5,9cd8 <__mcmp+0x54>
    9c98:	00279793          	sll	a5,a5,0x2
    9c9c:	01480813          	add	a6,a6,20
    9ca0:	01458593          	add	a1,a1,20
    9ca4:	00f80733          	add	a4,a6,a5
    9ca8:	00f587b3          	add	a5,a1,a5
    9cac:	0080006f          	j	9cb4 <__mcmp+0x30>
    9cb0:	02e87463          	bgeu	a6,a4,9cd8 <__mcmp+0x54>
    9cb4:	ffc72603          	lw	a2,-4(a4)
    9cb8:	ffc7a683          	lw	a3,-4(a5)
    9cbc:	ffc70713          	add	a4,a4,-4
    9cc0:	ffc78793          	add	a5,a5,-4
    9cc4:	fed606e3          	beq	a2,a3,9cb0 <__mcmp+0x2c>
    9cc8:	00100513          	li	a0,1
    9ccc:	00d67663          	bgeu	a2,a3,9cd8 <__mcmp+0x54>
    9cd0:	fff00513          	li	a0,-1
    9cd4:	00008067          	ret
    9cd8:	00008067          	ret

00009cdc <__mdiff>:
    9cdc:	0105a703          	lw	a4,16(a1)
    9ce0:	01062783          	lw	a5,16(a2)
    9ce4:	ff010113          	add	sp,sp,-16
    9ce8:	00812423          	sw	s0,8(sp)
    9cec:	00912223          	sw	s1,4(sp)
    9cf0:	00112623          	sw	ra,12(sp)
    9cf4:	01212023          	sw	s2,0(sp)
    9cf8:	00058413          	mv	s0,a1
    9cfc:	00060493          	mv	s1,a2
    9d00:	40f706b3          	sub	a3,a4,a5
    9d04:	18f71e63          	bne	a4,a5,9ea0 <__mdiff+0x1c4>
    9d08:	00279693          	sll	a3,a5,0x2
    9d0c:	01458613          	add	a2,a1,20
    9d10:	01448713          	add	a4,s1,20
    9d14:	00d607b3          	add	a5,a2,a3
    9d18:	00d70733          	add	a4,a4,a3
    9d1c:	0080006f          	j	9d24 <__mdiff+0x48>
    9d20:	18f67c63          	bgeu	a2,a5,9eb8 <__mdiff+0x1dc>
    9d24:	ffc7a583          	lw	a1,-4(a5)
    9d28:	ffc72683          	lw	a3,-4(a4)
    9d2c:	ffc78793          	add	a5,a5,-4
    9d30:	ffc70713          	add	a4,a4,-4
    9d34:	fed586e3          	beq	a1,a3,9d20 <__mdiff+0x44>
    9d38:	00100913          	li	s2,1
    9d3c:	00d5ea63          	bltu	a1,a3,9d50 <__mdiff+0x74>
    9d40:	00048793          	mv	a5,s1
    9d44:	00000913          	li	s2,0
    9d48:	00040493          	mv	s1,s0
    9d4c:	00078413          	mv	s0,a5
    9d50:	0044a583          	lw	a1,4(s1)
    9d54:	d24ff0ef          	jal	9278 <_Balloc>
    9d58:	1a050663          	beqz	a0,9f04 <__mdiff+0x228>
    9d5c:	0104a883          	lw	a7,16(s1)
    9d60:	01042283          	lw	t0,16(s0)
    9d64:	01448f93          	add	t6,s1,20
    9d68:	00289313          	sll	t1,a7,0x2
    9d6c:	01440813          	add	a6,s0,20
    9d70:	00229293          	sll	t0,t0,0x2
    9d74:	01450593          	add	a1,a0,20
    9d78:	00010e37          	lui	t3,0x10
    9d7c:	01252623          	sw	s2,12(a0)
    9d80:	006f8333          	add	t1,t6,t1
    9d84:	005802b3          	add	t0,a6,t0
    9d88:	00058f13          	mv	t5,a1
    9d8c:	000f8e93          	mv	t4,t6
    9d90:	00000693          	li	a3,0
    9d94:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    9d98:	000ea703          	lw	a4,0(t4)
    9d9c:	00082603          	lw	a2,0(a6)
    9da0:	004f0f13          	add	t5,t5,4
    9da4:	01c777b3          	and	a5,a4,t3
    9da8:	01c673b3          	and	t2,a2,t3
    9dac:	407787b3          	sub	a5,a5,t2
    9db0:	00d787b3          	add	a5,a5,a3
    9db4:	01075713          	srl	a4,a4,0x10
    9db8:	01065613          	srl	a2,a2,0x10
    9dbc:	4107d693          	sra	a3,a5,0x10
    9dc0:	40c70733          	sub	a4,a4,a2
    9dc4:	00d70733          	add	a4,a4,a3
    9dc8:	01071693          	sll	a3,a4,0x10
    9dcc:	01c7f7b3          	and	a5,a5,t3
    9dd0:	00d7e7b3          	or	a5,a5,a3
    9dd4:	00480813          	add	a6,a6,4
    9dd8:	feff2e23          	sw	a5,-4(t5)
    9ddc:	004e8e93          	add	t4,t4,4
    9de0:	41075693          	sra	a3,a4,0x10
    9de4:	fa586ae3          	bltu	a6,t0,9d98 <__mdiff+0xbc>
    9de8:	01540713          	add	a4,s0,21
    9dec:	40828433          	sub	s0,t0,s0
    9df0:	feb40413          	add	s0,s0,-21
    9df4:	00e2b2b3          	sltu	t0,t0,a4
    9df8:	0012cf13          	xor	t5,t0,1
    9dfc:	00245413          	srl	s0,s0,0x2
    9e00:	00400713          	li	a4,4
    9e04:	0a028463          	beqz	t0,9eac <__mdiff+0x1d0>
    9e08:	00ef8fb3          	add	t6,t6,a4
    9e0c:	00e58833          	add	a6,a1,a4
    9e10:	00010eb7          	lui	t4,0x10
    9e14:	00080e13          	mv	t3,a6
    9e18:	000f8613          	mv	a2,t6
    9e1c:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    9e20:	0c6ff463          	bgeu	t6,t1,9ee8 <__mdiff+0x20c>
    9e24:	00062783          	lw	a5,0(a2)
    9e28:	004e0e13          	add	t3,t3,4
    9e2c:	00460613          	add	a2,a2,4
    9e30:	01d7f733          	and	a4,a5,t4
    9e34:	00d70733          	add	a4,a4,a3
    9e38:	0107d593          	srl	a1,a5,0x10
    9e3c:	41075713          	sra	a4,a4,0x10
    9e40:	00b70733          	add	a4,a4,a1
    9e44:	00d787b3          	add	a5,a5,a3
    9e48:	01d7f7b3          	and	a5,a5,t4
    9e4c:	01071693          	sll	a3,a4,0x10
    9e50:	00d7e7b3          	or	a5,a5,a3
    9e54:	fefe2e23          	sw	a5,-4(t3)
    9e58:	41075693          	sra	a3,a4,0x10
    9e5c:	fc6664e3          	bltu	a2,t1,9e24 <__mdiff+0x148>
    9e60:	fff30313          	add	t1,t1,-1
    9e64:	41f30333          	sub	t1,t1,t6
    9e68:	ffc37313          	and	t1,t1,-4
    9e6c:	00680733          	add	a4,a6,t1
    9e70:	00079a63          	bnez	a5,9e84 <__mdiff+0x1a8>
    9e74:	ffc72783          	lw	a5,-4(a4)
    9e78:	fff88893          	add	a7,a7,-1
    9e7c:	ffc70713          	add	a4,a4,-4
    9e80:	fe078ae3          	beqz	a5,9e74 <__mdiff+0x198>
    9e84:	00c12083          	lw	ra,12(sp)
    9e88:	00812403          	lw	s0,8(sp)
    9e8c:	01152823          	sw	a7,16(a0)
    9e90:	00412483          	lw	s1,4(sp)
    9e94:	00012903          	lw	s2,0(sp)
    9e98:	01010113          	add	sp,sp,16
    9e9c:	00008067          	ret
    9ea0:	00100913          	li	s2,1
    9ea4:	e806dee3          	bgez	a3,9d40 <__mdiff+0x64>
    9ea8:	ea9ff06f          	j	9d50 <__mdiff+0x74>
    9eac:	00140713          	add	a4,s0,1
    9eb0:	00271713          	sll	a4,a4,0x2
    9eb4:	f55ff06f          	j	9e08 <__mdiff+0x12c>
    9eb8:	00000593          	li	a1,0
    9ebc:	bbcff0ef          	jal	9278 <_Balloc>
    9ec0:	06050063          	beqz	a0,9f20 <__mdiff+0x244>
    9ec4:	00c12083          	lw	ra,12(sp)
    9ec8:	00812403          	lw	s0,8(sp)
    9ecc:	00100793          	li	a5,1
    9ed0:	00f52823          	sw	a5,16(a0)
    9ed4:	00052a23          	sw	zero,20(a0)
    9ed8:	00412483          	lw	s1,4(sp)
    9edc:	00012903          	lw	s2,0(sp)
    9ee0:	01010113          	add	sp,sp,16
    9ee4:	00008067          	ret
    9ee8:	00000713          	li	a4,0
    9eec:	000f1663          	bnez	t5,9ef8 <__mdiff+0x21c>
    9ef0:	00e58733          	add	a4,a1,a4
    9ef4:	f7dff06f          	j	9e70 <__mdiff+0x194>
    9ef8:	00241713          	sll	a4,s0,0x2
    9efc:	00e58733          	add	a4,a1,a4
    9f00:	f71ff06f          	j	9e70 <__mdiff+0x194>
    9f04:	00005697          	auipc	a3,0x5
    9f08:	b6868693          	add	a3,a3,-1176 # ea6c <__fini_array_end+0x128>
    9f0c:	00000613          	li	a2,0
    9f10:	24500593          	li	a1,581
    9f14:	00005517          	auipc	a0,0x5
    9f18:	bec50513          	add	a0,a0,-1044 # eb00 <__fini_array_end+0x1bc>
    9f1c:	381000ef          	jal	aa9c <__assert_func>
    9f20:	00005697          	auipc	a3,0x5
    9f24:	b4c68693          	add	a3,a3,-1204 # ea6c <__fini_array_end+0x128>
    9f28:	00000613          	li	a2,0
    9f2c:	23700593          	li	a1,567
    9f30:	00005517          	auipc	a0,0x5
    9f34:	bd050513          	add	a0,a0,-1072 # eb00 <__fini_array_end+0x1bc>
    9f38:	365000ef          	jal	aa9c <__assert_func>

00009f3c <__d2b>:
    9f3c:	fd010113          	add	sp,sp,-48
    9f40:	01512a23          	sw	s5,20(sp)
    9f44:	00058a93          	mv	s5,a1
    9f48:	00100593          	li	a1,1
    9f4c:	02912223          	sw	s1,36(sp)
    9f50:	01312e23          	sw	s3,28(sp)
    9f54:	01412c23          	sw	s4,24(sp)
    9f58:	02112623          	sw	ra,44(sp)
    9f5c:	02812423          	sw	s0,40(sp)
    9f60:	03212023          	sw	s2,32(sp)
    9f64:	00060493          	mv	s1,a2
    9f68:	00068a13          	mv	s4,a3
    9f6c:	00070993          	mv	s3,a4
    9f70:	b08ff0ef          	jal	9278 <_Balloc>
    9f74:	10050263          	beqz	a0,a078 <__d2b+0x13c>
    9f78:	00100737          	lui	a4,0x100
    9f7c:	0144d913          	srl	s2,s1,0x14
    9f80:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    9f84:	7ff97913          	and	s2,s2,2047
    9f88:	00050413          	mv	s0,a0
    9f8c:	0097f7b3          	and	a5,a5,s1
    9f90:	00090463          	beqz	s2,9f98 <__d2b+0x5c>
    9f94:	00e7e7b3          	or	a5,a5,a4
    9f98:	00f12623          	sw	a5,12(sp)
    9f9c:	060a9263          	bnez	s5,a000 <__d2b+0xc4>
    9fa0:	00c10513          	add	a0,sp,12
    9fa4:	da8ff0ef          	jal	954c <__lo0bits>
    9fa8:	00c12703          	lw	a4,12(sp)
    9fac:	00100493          	li	s1,1
    9fb0:	00942823          	sw	s1,16(s0)
    9fb4:	00e42a23          	sw	a4,20(s0)
    9fb8:	02050793          	add	a5,a0,32
    9fbc:	08090863          	beqz	s2,a04c <__d2b+0x110>
    9fc0:	bcd90913          	add	s2,s2,-1075
    9fc4:	00f90933          	add	s2,s2,a5
    9fc8:	03500493          	li	s1,53
    9fcc:	012a2023          	sw	s2,0(s4)
    9fd0:	40f48533          	sub	a0,s1,a5
    9fd4:	00a9a023          	sw	a0,0(s3)
    9fd8:	02c12083          	lw	ra,44(sp)
    9fdc:	00040513          	mv	a0,s0
    9fe0:	02812403          	lw	s0,40(sp)
    9fe4:	02412483          	lw	s1,36(sp)
    9fe8:	02012903          	lw	s2,32(sp)
    9fec:	01c12983          	lw	s3,28(sp)
    9ff0:	01812a03          	lw	s4,24(sp)
    9ff4:	01412a83          	lw	s5,20(sp)
    9ff8:	03010113          	add	sp,sp,48
    9ffc:	00008067          	ret
    a000:	00810513          	add	a0,sp,8
    a004:	01512423          	sw	s5,8(sp)
    a008:	d44ff0ef          	jal	954c <__lo0bits>
    a00c:	00c12703          	lw	a4,12(sp)
    a010:	00050793          	mv	a5,a0
    a014:	04050e63          	beqz	a0,a070 <__d2b+0x134>
    a018:	00812603          	lw	a2,8(sp)
    a01c:	02000693          	li	a3,32
    a020:	40a686b3          	sub	a3,a3,a0
    a024:	00d716b3          	sll	a3,a4,a3
    a028:	00a75733          	srl	a4,a4,a0
    a02c:	00c6e6b3          	or	a3,a3,a2
    a030:	00e12623          	sw	a4,12(sp)
    a034:	00e034b3          	snez	s1,a4
    a038:	00148493          	add	s1,s1,1
    a03c:	00d42a23          	sw	a3,20(s0)
    a040:	00e42c23          	sw	a4,24(s0)
    a044:	00942823          	sw	s1,16(s0)
    a048:	f6091ce3          	bnez	s2,9fc0 <__d2b+0x84>
    a04c:	00249713          	sll	a4,s1,0x2
    a050:	00e40733          	add	a4,s0,a4
    a054:	01072503          	lw	a0,16(a4)
    a058:	bce78793          	add	a5,a5,-1074
    a05c:	00fa2023          	sw	a5,0(s4)
    a060:	c74ff0ef          	jal	94d4 <__hi0bits>
    a064:	00549493          	sll	s1,s1,0x5
    a068:	40a48533          	sub	a0,s1,a0
    a06c:	f69ff06f          	j	9fd4 <__d2b+0x98>
    a070:	00812683          	lw	a3,8(sp)
    a074:	fc1ff06f          	j	a034 <__d2b+0xf8>
    a078:	00005697          	auipc	a3,0x5
    a07c:	9f468693          	add	a3,a3,-1548 # ea6c <__fini_array_end+0x128>
    a080:	00000613          	li	a2,0
    a084:	30f00593          	li	a1,783
    a088:	00005517          	auipc	a0,0x5
    a08c:	a7850513          	add	a0,a0,-1416 # eb00 <__fini_array_end+0x1bc>
    a090:	20d000ef          	jal	aa9c <__assert_func>

0000a094 <_realloc_r>:
    a094:	fd010113          	add	sp,sp,-48
    a098:	02912223          	sw	s1,36(sp)
    a09c:	02112623          	sw	ra,44(sp)
    a0a0:	00060493          	mv	s1,a2
    a0a4:	1e058863          	beqz	a1,a294 <_realloc_r+0x200>
    a0a8:	02812423          	sw	s0,40(sp)
    a0ac:	03212023          	sw	s2,32(sp)
    a0b0:	00058413          	mv	s0,a1
    a0b4:	01312e23          	sw	s3,28(sp)
    a0b8:	01512a23          	sw	s5,20(sp)
    a0bc:	01412c23          	sw	s4,24(sp)
    a0c0:	00050913          	mv	s2,a0
    a0c4:	8b1f70ef          	jal	1974 <__malloc_lock>
    a0c8:	ffc42703          	lw	a4,-4(s0)
    a0cc:	00b48793          	add	a5,s1,11
    a0d0:	01600693          	li	a3,22
    a0d4:	ff840a93          	add	s5,s0,-8
    a0d8:	ffc77993          	and	s3,a4,-4
    a0dc:	10f6f263          	bgeu	a3,a5,a1e0 <_realloc_r+0x14c>
    a0e0:	ff87fa13          	and	s4,a5,-8
    a0e4:	1007c263          	bltz	a5,a1e8 <_realloc_r+0x154>
    a0e8:	109a6063          	bltu	s4,s1,a1e8 <_realloc_r+0x154>
    a0ec:	1349d263          	bge	s3,s4,a210 <_realloc_r+0x17c>
    a0f0:	01812423          	sw	s8,8(sp)
    a0f4:	7fff6c17          	auipc	s8,0x7fff6
    a0f8:	02cc0c13          	add	s8,s8,44 # 80000120 <__malloc_av_>
    a0fc:	008c2603          	lw	a2,8(s8)
    a100:	013a86b3          	add	a3,s5,s3
    a104:	0046a783          	lw	a5,4(a3)
    a108:	1cd60863          	beq	a2,a3,a2d8 <_realloc_r+0x244>
    a10c:	ffe7f613          	and	a2,a5,-2
    a110:	00c68633          	add	a2,a3,a2
    a114:	00462603          	lw	a2,4(a2)
    a118:	00167613          	and	a2,a2,1
    a11c:	14061a63          	bnez	a2,a270 <_realloc_r+0x1dc>
    a120:	ffc7f793          	and	a5,a5,-4
    a124:	00f98633          	add	a2,s3,a5
    a128:	0d465863          	bge	a2,s4,a1f8 <_realloc_r+0x164>
    a12c:	00177713          	and	a4,a4,1
    a130:	02071c63          	bnez	a4,a168 <_realloc_r+0xd4>
    a134:	01712623          	sw	s7,12(sp)
    a138:	ff842b83          	lw	s7,-8(s0)
    a13c:	01612823          	sw	s6,16(sp)
    a140:	417a8bb3          	sub	s7,s5,s7
    a144:	004ba703          	lw	a4,4(s7)
    a148:	ffc77713          	and	a4,a4,-4
    a14c:	00e787b3          	add	a5,a5,a4
    a150:	01378b33          	add	s6,a5,s3
    a154:	334b5c63          	bge	s6,s4,a48c <_realloc_r+0x3f8>
    a158:	00e98b33          	add	s6,s3,a4
    a15c:	294b5863          	bge	s6,s4,a3ec <_realloc_r+0x358>
    a160:	01012b03          	lw	s6,16(sp)
    a164:	00c12b83          	lw	s7,12(sp)
    a168:	00048593          	mv	a1,s1
    a16c:	00090513          	mv	a0,s2
    a170:	824f70ef          	jal	1194 <_malloc_r>
    a174:	00050493          	mv	s1,a0
    a178:	40050863          	beqz	a0,a588 <_realloc_r+0x4f4>
    a17c:	ffc42783          	lw	a5,-4(s0)
    a180:	ff850713          	add	a4,a0,-8
    a184:	ffe7f793          	and	a5,a5,-2
    a188:	00fa87b3          	add	a5,s5,a5
    a18c:	24e78663          	beq	a5,a4,a3d8 <_realloc_r+0x344>
    a190:	ffc98613          	add	a2,s3,-4
    a194:	02400793          	li	a5,36
    a198:	2ec7e463          	bltu	a5,a2,a480 <_realloc_r+0x3ec>
    a19c:	01300713          	li	a4,19
    a1a0:	20c76a63          	bltu	a4,a2,a3b4 <_realloc_r+0x320>
    a1a4:	00050793          	mv	a5,a0
    a1a8:	00040713          	mv	a4,s0
    a1ac:	00072683          	lw	a3,0(a4)
    a1b0:	00d7a023          	sw	a3,0(a5)
    a1b4:	00472683          	lw	a3,4(a4)
    a1b8:	00d7a223          	sw	a3,4(a5)
    a1bc:	00872703          	lw	a4,8(a4)
    a1c0:	00e7a423          	sw	a4,8(a5)
    a1c4:	00040593          	mv	a1,s0
    a1c8:	00090513          	mv	a0,s2
    a1cc:	cbdf60ef          	jal	e88 <_free_r>
    a1d0:	00090513          	mv	a0,s2
    a1d4:	facf70ef          	jal	1980 <__malloc_unlock>
    a1d8:	00812c03          	lw	s8,8(sp)
    a1dc:	06c0006f          	j	a248 <_realloc_r+0x1b4>
    a1e0:	01000a13          	li	s4,16
    a1e4:	f09a74e3          	bgeu	s4,s1,a0ec <_realloc_r+0x58>
    a1e8:	00c00793          	li	a5,12
    a1ec:	00f92023          	sw	a5,0(s2)
    a1f0:	00000493          	li	s1,0
    a1f4:	0540006f          	j	a248 <_realloc_r+0x1b4>
    a1f8:	00c6a783          	lw	a5,12(a3)
    a1fc:	0086a703          	lw	a4,8(a3)
    a200:	00812c03          	lw	s8,8(sp)
    a204:	00060993          	mv	s3,a2
    a208:	00f72623          	sw	a5,12(a4)
    a20c:	00e7a423          	sw	a4,8(a5)
    a210:	004aa783          	lw	a5,4(s5)
    a214:	414986b3          	sub	a3,s3,s4
    a218:	00f00613          	li	a2,15
    a21c:	0017f793          	and	a5,a5,1
    a220:	013a8733          	add	a4,s5,s3
    a224:	08d66263          	bltu	a2,a3,a2a8 <_realloc_r+0x214>
    a228:	0137e7b3          	or	a5,a5,s3
    a22c:	00faa223          	sw	a5,4(s5)
    a230:	00472783          	lw	a5,4(a4)
    a234:	0017e793          	or	a5,a5,1
    a238:	00f72223          	sw	a5,4(a4)
    a23c:	00090513          	mv	a0,s2
    a240:	f40f70ef          	jal	1980 <__malloc_unlock>
    a244:	00040493          	mv	s1,s0
    a248:	02812403          	lw	s0,40(sp)
    a24c:	02c12083          	lw	ra,44(sp)
    a250:	02012903          	lw	s2,32(sp)
    a254:	01c12983          	lw	s3,28(sp)
    a258:	01812a03          	lw	s4,24(sp)
    a25c:	01412a83          	lw	s5,20(sp)
    a260:	00048513          	mv	a0,s1
    a264:	02412483          	lw	s1,36(sp)
    a268:	03010113          	add	sp,sp,48
    a26c:	00008067          	ret
    a270:	00177713          	and	a4,a4,1
    a274:	ee071ae3          	bnez	a4,a168 <_realloc_r+0xd4>
    a278:	01712623          	sw	s7,12(sp)
    a27c:	ff842b83          	lw	s7,-8(s0)
    a280:	01612823          	sw	s6,16(sp)
    a284:	417a8bb3          	sub	s7,s5,s7
    a288:	004ba703          	lw	a4,4(s7)
    a28c:	ffc77713          	and	a4,a4,-4
    a290:	ec9ff06f          	j	a158 <_realloc_r+0xc4>
    a294:	02c12083          	lw	ra,44(sp)
    a298:	02412483          	lw	s1,36(sp)
    a29c:	00060593          	mv	a1,a2
    a2a0:	03010113          	add	sp,sp,48
    a2a4:	ef1f606f          	j	1194 <_malloc_r>
    a2a8:	0147e7b3          	or	a5,a5,s4
    a2ac:	00faa223          	sw	a5,4(s5)
    a2b0:	014a85b3          	add	a1,s5,s4
    a2b4:	0016e693          	or	a3,a3,1
    a2b8:	00d5a223          	sw	a3,4(a1)
    a2bc:	00472783          	lw	a5,4(a4)
    a2c0:	00858593          	add	a1,a1,8
    a2c4:	00090513          	mv	a0,s2
    a2c8:	0017e793          	or	a5,a5,1
    a2cc:	00f72223          	sw	a5,4(a4)
    a2d0:	bb9f60ef          	jal	e88 <_free_r>
    a2d4:	f69ff06f          	j	a23c <_realloc_r+0x1a8>
    a2d8:	ffc7f793          	and	a5,a5,-4
    a2dc:	013786b3          	add	a3,a5,s3
    a2e0:	010a0613          	add	a2,s4,16
    a2e4:	26c6d063          	bge	a3,a2,a544 <_realloc_r+0x4b0>
    a2e8:	00177713          	and	a4,a4,1
    a2ec:	e6071ee3          	bnez	a4,a168 <_realloc_r+0xd4>
    a2f0:	01712623          	sw	s7,12(sp)
    a2f4:	ff842b83          	lw	s7,-8(s0)
    a2f8:	01612823          	sw	s6,16(sp)
    a2fc:	417a8bb3          	sub	s7,s5,s7
    a300:	004ba703          	lw	a4,4(s7)
    a304:	ffc77713          	and	a4,a4,-4
    a308:	00e787b3          	add	a5,a5,a4
    a30c:	01378b33          	add	s6,a5,s3
    a310:	e4cb44e3          	blt	s6,a2,a158 <_realloc_r+0xc4>
    a314:	00cba783          	lw	a5,12(s7)
    a318:	008ba703          	lw	a4,8(s7)
    a31c:	ffc98613          	add	a2,s3,-4
    a320:	02400693          	li	a3,36
    a324:	00f72623          	sw	a5,12(a4)
    a328:	00e7a423          	sw	a4,8(a5)
    a32c:	008b8493          	add	s1,s7,8
    a330:	28c6e463          	bltu	a3,a2,a5b8 <_realloc_r+0x524>
    a334:	01300713          	li	a4,19
    a338:	00048793          	mv	a5,s1
    a33c:	02c77263          	bgeu	a4,a2,a360 <_realloc_r+0x2cc>
    a340:	00042703          	lw	a4,0(s0)
    a344:	01b00793          	li	a5,27
    a348:	00eba423          	sw	a4,8(s7)
    a34c:	00442703          	lw	a4,4(s0)
    a350:	00eba623          	sw	a4,12(s7)
    a354:	26c7ea63          	bltu	a5,a2,a5c8 <_realloc_r+0x534>
    a358:	00840413          	add	s0,s0,8
    a35c:	010b8793          	add	a5,s7,16
    a360:	00042703          	lw	a4,0(s0)
    a364:	00e7a023          	sw	a4,0(a5)
    a368:	00442703          	lw	a4,4(s0)
    a36c:	00e7a223          	sw	a4,4(a5)
    a370:	00842703          	lw	a4,8(s0)
    a374:	00e7a423          	sw	a4,8(a5)
    a378:	014b8733          	add	a4,s7,s4
    a37c:	414b07b3          	sub	a5,s6,s4
    a380:	00ec2423          	sw	a4,8(s8)
    a384:	0017e793          	or	a5,a5,1
    a388:	00f72223          	sw	a5,4(a4)
    a38c:	004ba783          	lw	a5,4(s7)
    a390:	00090513          	mv	a0,s2
    a394:	0017f793          	and	a5,a5,1
    a398:	0147e7b3          	or	a5,a5,s4
    a39c:	00fba223          	sw	a5,4(s7)
    a3a0:	de0f70ef          	jal	1980 <__malloc_unlock>
    a3a4:	01012b03          	lw	s6,16(sp)
    a3a8:	00c12b83          	lw	s7,12(sp)
    a3ac:	00812c03          	lw	s8,8(sp)
    a3b0:	e99ff06f          	j	a248 <_realloc_r+0x1b4>
    a3b4:	00042683          	lw	a3,0(s0)
    a3b8:	01b00713          	li	a4,27
    a3bc:	00d52023          	sw	a3,0(a0)
    a3c0:	00442683          	lw	a3,4(s0)
    a3c4:	00d52223          	sw	a3,4(a0)
    a3c8:	14c76e63          	bltu	a4,a2,a524 <_realloc_r+0x490>
    a3cc:	00840713          	add	a4,s0,8
    a3d0:	00850793          	add	a5,a0,8
    a3d4:	dd9ff06f          	j	a1ac <_realloc_r+0x118>
    a3d8:	ffc52783          	lw	a5,-4(a0)
    a3dc:	00812c03          	lw	s8,8(sp)
    a3e0:	ffc7f793          	and	a5,a5,-4
    a3e4:	00f989b3          	add	s3,s3,a5
    a3e8:	e29ff06f          	j	a210 <_realloc_r+0x17c>
    a3ec:	00cba783          	lw	a5,12(s7)
    a3f0:	008ba703          	lw	a4,8(s7)
    a3f4:	ffc98613          	add	a2,s3,-4
    a3f8:	02400693          	li	a3,36
    a3fc:	00f72623          	sw	a5,12(a4)
    a400:	00e7a423          	sw	a4,8(a5)
    a404:	008b8493          	add	s1,s7,8
    a408:	10c6e663          	bltu	a3,a2,a514 <_realloc_r+0x480>
    a40c:	01300713          	li	a4,19
    a410:	00048793          	mv	a5,s1
    a414:	02c77c63          	bgeu	a4,a2,a44c <_realloc_r+0x3b8>
    a418:	00042703          	lw	a4,0(s0)
    a41c:	01b00793          	li	a5,27
    a420:	00eba423          	sw	a4,8(s7)
    a424:	00442703          	lw	a4,4(s0)
    a428:	00eba623          	sw	a4,12(s7)
    a42c:	14c7f863          	bgeu	a5,a2,a57c <_realloc_r+0x4e8>
    a430:	00842783          	lw	a5,8(s0)
    a434:	00fba823          	sw	a5,16(s7)
    a438:	00c42783          	lw	a5,12(s0)
    a43c:	00fbaa23          	sw	a5,20(s7)
    a440:	0ad60c63          	beq	a2,a3,a4f8 <_realloc_r+0x464>
    a444:	01040413          	add	s0,s0,16
    a448:	018b8793          	add	a5,s7,24
    a44c:	00042703          	lw	a4,0(s0)
    a450:	00e7a023          	sw	a4,0(a5)
    a454:	00442703          	lw	a4,4(s0)
    a458:	00e7a223          	sw	a4,4(a5)
    a45c:	00842703          	lw	a4,8(s0)
    a460:	00e7a423          	sw	a4,8(a5)
    a464:	000b0993          	mv	s3,s6
    a468:	000b8a93          	mv	s5,s7
    a46c:	01012b03          	lw	s6,16(sp)
    a470:	00c12b83          	lw	s7,12(sp)
    a474:	00812c03          	lw	s8,8(sp)
    a478:	00048413          	mv	s0,s1
    a47c:	d95ff06f          	j	a210 <_realloc_r+0x17c>
    a480:	00040593          	mv	a1,s0
    a484:	ae8fd0ef          	jal	776c <memmove>
    a488:	d3dff06f          	j	a1c4 <_realloc_r+0x130>
    a48c:	00c6a783          	lw	a5,12(a3)
    a490:	0086a703          	lw	a4,8(a3)
    a494:	ffc98613          	add	a2,s3,-4
    a498:	02400693          	li	a3,36
    a49c:	00f72623          	sw	a5,12(a4)
    a4a0:	00e7a423          	sw	a4,8(a5)
    a4a4:	008ba703          	lw	a4,8(s7)
    a4a8:	00cba783          	lw	a5,12(s7)
    a4ac:	008b8493          	add	s1,s7,8
    a4b0:	00f72623          	sw	a5,12(a4)
    a4b4:	00e7a423          	sw	a4,8(a5)
    a4b8:	04c6ee63          	bltu	a3,a2,a514 <_realloc_r+0x480>
    a4bc:	01300713          	li	a4,19
    a4c0:	00048793          	mv	a5,s1
    a4c4:	f8c774e3          	bgeu	a4,a2,a44c <_realloc_r+0x3b8>
    a4c8:	00042703          	lw	a4,0(s0)
    a4cc:	01b00793          	li	a5,27
    a4d0:	00eba423          	sw	a4,8(s7)
    a4d4:	00442703          	lw	a4,4(s0)
    a4d8:	00eba623          	sw	a4,12(s7)
    a4dc:	0ac7f063          	bgeu	a5,a2,a57c <_realloc_r+0x4e8>
    a4e0:	00842703          	lw	a4,8(s0)
    a4e4:	02400793          	li	a5,36
    a4e8:	00eba823          	sw	a4,16(s7)
    a4ec:	00c42703          	lw	a4,12(s0)
    a4f0:	00ebaa23          	sw	a4,20(s7)
    a4f4:	f4f618e3          	bne	a2,a5,a444 <_realloc_r+0x3b0>
    a4f8:	01042703          	lw	a4,16(s0)
    a4fc:	020b8793          	add	a5,s7,32
    a500:	01840413          	add	s0,s0,24
    a504:	00ebac23          	sw	a4,24(s7)
    a508:	ffc42703          	lw	a4,-4(s0)
    a50c:	00ebae23          	sw	a4,28(s7)
    a510:	f3dff06f          	j	a44c <_realloc_r+0x3b8>
    a514:	00040593          	mv	a1,s0
    a518:	00048513          	mv	a0,s1
    a51c:	a50fd0ef          	jal	776c <memmove>
    a520:	f45ff06f          	j	a464 <_realloc_r+0x3d0>
    a524:	00842703          	lw	a4,8(s0)
    a528:	00e52423          	sw	a4,8(a0)
    a52c:	00c42703          	lw	a4,12(s0)
    a530:	00e52623          	sw	a4,12(a0)
    a534:	06f60463          	beq	a2,a5,a59c <_realloc_r+0x508>
    a538:	01040713          	add	a4,s0,16
    a53c:	01050793          	add	a5,a0,16
    a540:	c6dff06f          	j	a1ac <_realloc_r+0x118>
    a544:	014a8ab3          	add	s5,s5,s4
    a548:	414687b3          	sub	a5,a3,s4
    a54c:	015c2423          	sw	s5,8(s8)
    a550:	0017e793          	or	a5,a5,1
    a554:	00faa223          	sw	a5,4(s5)
    a558:	ffc42783          	lw	a5,-4(s0)
    a55c:	00090513          	mv	a0,s2
    a560:	00040493          	mv	s1,s0
    a564:	0017f793          	and	a5,a5,1
    a568:	0147e7b3          	or	a5,a5,s4
    a56c:	fef42e23          	sw	a5,-4(s0)
    a570:	c10f70ef          	jal	1980 <__malloc_unlock>
    a574:	00812c03          	lw	s8,8(sp)
    a578:	cd1ff06f          	j	a248 <_realloc_r+0x1b4>
    a57c:	00840413          	add	s0,s0,8
    a580:	010b8793          	add	a5,s7,16
    a584:	ec9ff06f          	j	a44c <_realloc_r+0x3b8>
    a588:	00090513          	mv	a0,s2
    a58c:	bf4f70ef          	jal	1980 <__malloc_unlock>
    a590:	00000493          	li	s1,0
    a594:	00812c03          	lw	s8,8(sp)
    a598:	cb1ff06f          	j	a248 <_realloc_r+0x1b4>
    a59c:	01042683          	lw	a3,16(s0)
    a5a0:	01840713          	add	a4,s0,24
    a5a4:	01850793          	add	a5,a0,24
    a5a8:	00d52823          	sw	a3,16(a0)
    a5ac:	01442683          	lw	a3,20(s0)
    a5b0:	00d52a23          	sw	a3,20(a0)
    a5b4:	bf9ff06f          	j	a1ac <_realloc_r+0x118>
    a5b8:	00040593          	mv	a1,s0
    a5bc:	00048513          	mv	a0,s1
    a5c0:	9acfd0ef          	jal	776c <memmove>
    a5c4:	db5ff06f          	j	a378 <_realloc_r+0x2e4>
    a5c8:	00842783          	lw	a5,8(s0)
    a5cc:	00fba823          	sw	a5,16(s7)
    a5d0:	00c42783          	lw	a5,12(s0)
    a5d4:	00fbaa23          	sw	a5,20(s7)
    a5d8:	00d60863          	beq	a2,a3,a5e8 <_realloc_r+0x554>
    a5dc:	01040413          	add	s0,s0,16
    a5e0:	018b8793          	add	a5,s7,24
    a5e4:	d7dff06f          	j	a360 <_realloc_r+0x2cc>
    a5e8:	01042703          	lw	a4,16(s0)
    a5ec:	020b8793          	add	a5,s7,32
    a5f0:	01840413          	add	s0,s0,24
    a5f4:	00ebac23          	sw	a4,24(s7)
    a5f8:	ffc42703          	lw	a4,-4(s0)
    a5fc:	00ebae23          	sw	a4,28(s7)
    a600:	d61ff06f          	j	a360 <_realloc_r+0x2cc>

0000a604 <__ascii_wctomb>:
    a604:	02058463          	beqz	a1,a62c <__ascii_wctomb+0x28>
    a608:	0ff00793          	li	a5,255
    a60c:	00c7e863          	bltu	a5,a2,a61c <__ascii_wctomb+0x18>
    a610:	00c58023          	sb	a2,0(a1)
    a614:	00100513          	li	a0,1
    a618:	00008067          	ret
    a61c:	08a00793          	li	a5,138
    a620:	00f52023          	sw	a5,0(a0)
    a624:	fff00513          	li	a0,-1
    a628:	00008067          	ret
    a62c:	00000513          	li	a0,0
    a630:	00008067          	ret

0000a634 <_wcrtomb_r>:
    a634:	fe010113          	add	sp,sp,-32
    a638:	00812c23          	sw	s0,24(sp)
    a63c:	00912a23          	sw	s1,20(sp)
    a640:	00112e23          	sw	ra,28(sp)
    a644:	00050493          	mv	s1,a0
    a648:	10450413          	add	s0,a0,260
    a64c:	00068463          	beqz	a3,a654 <_wcrtomb_r+0x20>
    a650:	00068413          	mv	s0,a3
    a654:	7fff6797          	auipc	a5,0x7fff6
    a658:	fc07a783          	lw	a5,-64(a5) # 80000614 <__global_locale+0xe0>
    a65c:	00040693          	mv	a3,s0
    a660:	02058463          	beqz	a1,a688 <_wcrtomb_r+0x54>
    a664:	00048513          	mv	a0,s1
    a668:	000780e7          	jalr	a5
    a66c:	fff00793          	li	a5,-1
    a670:	02f50863          	beq	a0,a5,a6a0 <_wcrtomb_r+0x6c>
    a674:	01c12083          	lw	ra,28(sp)
    a678:	01812403          	lw	s0,24(sp)
    a67c:	01412483          	lw	s1,20(sp)
    a680:	02010113          	add	sp,sp,32
    a684:	00008067          	ret
    a688:	00000613          	li	a2,0
    a68c:	00410593          	add	a1,sp,4
    a690:	00048513          	mv	a0,s1
    a694:	000780e7          	jalr	a5
    a698:	fff00793          	li	a5,-1
    a69c:	fcf51ce3          	bne	a0,a5,a674 <_wcrtomb_r+0x40>
    a6a0:	00042023          	sw	zero,0(s0)
    a6a4:	01c12083          	lw	ra,28(sp)
    a6a8:	01812403          	lw	s0,24(sp)
    a6ac:	08a00793          	li	a5,138
    a6b0:	00f4a023          	sw	a5,0(s1)
    a6b4:	01412483          	lw	s1,20(sp)
    a6b8:	02010113          	add	sp,sp,32
    a6bc:	00008067          	ret

0000a6c0 <_wcsrtombs_r>:
    a6c0:	00070793          	mv	a5,a4
    a6c4:	00068713          	mv	a4,a3
    a6c8:	fff00693          	li	a3,-1
    a6cc:	7a40006f          	j	ae70 <_wcsnrtombs_r>

0000a6d0 <_fclose_r>:
    a6d0:	ff010113          	add	sp,sp,-16
    a6d4:	00112623          	sw	ra,12(sp)
    a6d8:	01212023          	sw	s2,0(sp)
    a6dc:	0e058263          	beqz	a1,a7c0 <_fclose_r+0xf0>
    a6e0:	00812423          	sw	s0,8(sp)
    a6e4:	00912223          	sw	s1,4(sp)
    a6e8:	00058413          	mv	s0,a1
    a6ec:	00050493          	mv	s1,a0
    a6f0:	00050663          	beqz	a0,a6fc <_fclose_r+0x2c>
    a6f4:	03452783          	lw	a5,52(a0)
    a6f8:	10078063          	beqz	a5,a7f8 <_fclose_r+0x128>
    a6fc:	06442783          	lw	a5,100(s0)
    a700:	00c41703          	lh	a4,12(s0)
    a704:	0017f793          	and	a5,a5,1
    a708:	0a079663          	bnez	a5,a7b4 <_fclose_r+0xe4>
    a70c:	20077713          	and	a4,a4,512
    a710:	0e070863          	beqz	a4,a800 <_fclose_r+0x130>
    a714:	00040593          	mv	a1,s0
    a718:	00048513          	mv	a0,s1
    a71c:	9f5fb0ef          	jal	6110 <__sflush_r>
    a720:	02c42783          	lw	a5,44(s0)
    a724:	00050913          	mv	s2,a0
    a728:	00078a63          	beqz	a5,a73c <_fclose_r+0x6c>
    a72c:	01c42583          	lw	a1,28(s0)
    a730:	00048513          	mv	a0,s1
    a734:	000780e7          	jalr	a5
    a738:	0a054063          	bltz	a0,a7d8 <_fclose_r+0x108>
    a73c:	00c45783          	lhu	a5,12(s0)
    a740:	0807f793          	and	a5,a5,128
    a744:	0a079263          	bnez	a5,a7e8 <_fclose_r+0x118>
    a748:	03042583          	lw	a1,48(s0)
    a74c:	00058c63          	beqz	a1,a764 <_fclose_r+0x94>
    a750:	04040793          	add	a5,s0,64
    a754:	00f58663          	beq	a1,a5,a760 <_fclose_r+0x90>
    a758:	00048513          	mv	a0,s1
    a75c:	f2cf60ef          	jal	e88 <_free_r>
    a760:	02042823          	sw	zero,48(s0)
    a764:	04442583          	lw	a1,68(s0)
    a768:	00058863          	beqz	a1,a778 <_fclose_r+0xa8>
    a76c:	00048513          	mv	a0,s1
    a770:	f18f60ef          	jal	e88 <_free_r>
    a774:	04042223          	sw	zero,68(s0)
    a778:	f51fb0ef          	jal	66c8 <__sfp_lock_acquire>
    a77c:	06442783          	lw	a5,100(s0)
    a780:	00041623          	sh	zero,12(s0)
    a784:	0017f793          	and	a5,a5,1
    a788:	0a078663          	beqz	a5,a834 <_fclose_r+0x164>
    a78c:	05842503          	lw	a0,88(s0)
    a790:	a9cf60ef          	jal	a2c <__retarget_lock_close_recursive>
    a794:	f41fb0ef          	jal	66d4 <__sfp_lock_release>
    a798:	00c12083          	lw	ra,12(sp)
    a79c:	00812403          	lw	s0,8(sp)
    a7a0:	00412483          	lw	s1,4(sp)
    a7a4:	00090513          	mv	a0,s2
    a7a8:	00012903          	lw	s2,0(sp)
    a7ac:	01010113          	add	sp,sp,16
    a7b0:	00008067          	ret
    a7b4:	f60710e3          	bnez	a4,a714 <_fclose_r+0x44>
    a7b8:	00812403          	lw	s0,8(sp)
    a7bc:	00412483          	lw	s1,4(sp)
    a7c0:	00000913          	li	s2,0
    a7c4:	00c12083          	lw	ra,12(sp)
    a7c8:	00090513          	mv	a0,s2
    a7cc:	00012903          	lw	s2,0(sp)
    a7d0:	01010113          	add	sp,sp,16
    a7d4:	00008067          	ret
    a7d8:	00c45783          	lhu	a5,12(s0)
    a7dc:	fff00913          	li	s2,-1
    a7e0:	0807f793          	and	a5,a5,128
    a7e4:	f60782e3          	beqz	a5,a748 <_fclose_r+0x78>
    a7e8:	01042583          	lw	a1,16(s0)
    a7ec:	00048513          	mv	a0,s1
    a7f0:	e98f60ef          	jal	e88 <_free_r>
    a7f4:	f55ff06f          	j	a748 <_fclose_r+0x78>
    a7f8:	e61fb0ef          	jal	6658 <__sinit>
    a7fc:	f01ff06f          	j	a6fc <_fclose_r+0x2c>
    a800:	05842503          	lw	a0,88(s0)
    a804:	a2cf60ef          	jal	a30 <__retarget_lock_acquire_recursive>
    a808:	00c41783          	lh	a5,12(s0)
    a80c:	f00794e3          	bnez	a5,a714 <_fclose_r+0x44>
    a810:	06442783          	lw	a5,100(s0)
    a814:	0017f793          	and	a5,a5,1
    a818:	fa0790e3          	bnez	a5,a7b8 <_fclose_r+0xe8>
    a81c:	05842503          	lw	a0,88(s0)
    a820:	00000913          	li	s2,0
    a824:	a10f60ef          	jal	a34 <__retarget_lock_release_recursive>
    a828:	00812403          	lw	s0,8(sp)
    a82c:	00412483          	lw	s1,4(sp)
    a830:	f95ff06f          	j	a7c4 <_fclose_r+0xf4>
    a834:	05842503          	lw	a0,88(s0)
    a838:	9fcf60ef          	jal	a34 <__retarget_lock_release_recursive>
    a83c:	f51ff06f          	j	a78c <_fclose_r+0xbc>

0000a840 <__smakebuf_r>:
    a840:	00c59783          	lh	a5,12(a1)
    a844:	f8010113          	add	sp,sp,-128
    a848:	06812c23          	sw	s0,120(sp)
    a84c:	06112e23          	sw	ra,124(sp)
    a850:	0027f713          	and	a4,a5,2
    a854:	00058413          	mv	s0,a1
    a858:	02070463          	beqz	a4,a880 <__smakebuf_r+0x40>
    a85c:	04358793          	add	a5,a1,67
    a860:	00f5a023          	sw	a5,0(a1)
    a864:	00f5a823          	sw	a5,16(a1)
    a868:	00100793          	li	a5,1
    a86c:	00f5aa23          	sw	a5,20(a1)
    a870:	07c12083          	lw	ra,124(sp)
    a874:	07812403          	lw	s0,120(sp)
    a878:	08010113          	add	sp,sp,128
    a87c:	00008067          	ret
    a880:	00e59583          	lh	a1,14(a1)
    a884:	06912a23          	sw	s1,116(sp)
    a888:	07212823          	sw	s2,112(sp)
    a88c:	07312623          	sw	s3,108(sp)
    a890:	07412423          	sw	s4,104(sp)
    a894:	00050493          	mv	s1,a0
    a898:	0805c663          	bltz	a1,a924 <__smakebuf_r+0xe4>
    a89c:	00810613          	add	a2,sp,8
    a8a0:	138000ef          	jal	a9d8 <_fstat_r>
    a8a4:	06054e63          	bltz	a0,a920 <__smakebuf_r+0xe0>
    a8a8:	00c12783          	lw	a5,12(sp)
    a8ac:	0000f937          	lui	s2,0xf
    a8b0:	000019b7          	lui	s3,0x1
    a8b4:	00f97933          	and	s2,s2,a5
    a8b8:	ffffe7b7          	lui	a5,0xffffe
    a8bc:	00f90933          	add	s2,s2,a5
    a8c0:	00193913          	seqz	s2,s2
    a8c4:	40000a13          	li	s4,1024
    a8c8:	80098993          	add	s3,s3,-2048 # 800 <_sbrk+0x34>
    a8cc:	000a0593          	mv	a1,s4
    a8d0:	00048513          	mv	a0,s1
    a8d4:	8c1f60ef          	jal	1194 <_malloc_r>
    a8d8:	00c41783          	lh	a5,12(s0)
    a8dc:	06050863          	beqz	a0,a94c <__smakebuf_r+0x10c>
    a8e0:	0807e793          	or	a5,a5,128
    a8e4:	00a42023          	sw	a0,0(s0)
    a8e8:	00a42823          	sw	a0,16(s0)
    a8ec:	00f41623          	sh	a5,12(s0)
    a8f0:	01442a23          	sw	s4,20(s0)
    a8f4:	0a091063          	bnez	s2,a994 <__smakebuf_r+0x154>
    a8f8:	0137e7b3          	or	a5,a5,s3
    a8fc:	07c12083          	lw	ra,124(sp)
    a900:	00f41623          	sh	a5,12(s0)
    a904:	07812403          	lw	s0,120(sp)
    a908:	07412483          	lw	s1,116(sp)
    a90c:	07012903          	lw	s2,112(sp)
    a910:	06c12983          	lw	s3,108(sp)
    a914:	06812a03          	lw	s4,104(sp)
    a918:	08010113          	add	sp,sp,128
    a91c:	00008067          	ret
    a920:	00c41783          	lh	a5,12(s0)
    a924:	0807f793          	and	a5,a5,128
    a928:	00000913          	li	s2,0
    a92c:	04078e63          	beqz	a5,a988 <__smakebuf_r+0x148>
    a930:	04000a13          	li	s4,64
    a934:	000a0593          	mv	a1,s4
    a938:	00048513          	mv	a0,s1
    a93c:	859f60ef          	jal	1194 <_malloc_r>
    a940:	00c41783          	lh	a5,12(s0)
    a944:	00000993          	li	s3,0
    a948:	f8051ce3          	bnez	a0,a8e0 <__smakebuf_r+0xa0>
    a94c:	2007f713          	and	a4,a5,512
    a950:	04071e63          	bnez	a4,a9ac <__smakebuf_r+0x16c>
    a954:	ffc7f793          	and	a5,a5,-4
    a958:	0027e793          	or	a5,a5,2
    a95c:	04340713          	add	a4,s0,67
    a960:	00f41623          	sh	a5,12(s0)
    a964:	00100793          	li	a5,1
    a968:	07412483          	lw	s1,116(sp)
    a96c:	07012903          	lw	s2,112(sp)
    a970:	06c12983          	lw	s3,108(sp)
    a974:	06812a03          	lw	s4,104(sp)
    a978:	00e42023          	sw	a4,0(s0)
    a97c:	00e42823          	sw	a4,16(s0)
    a980:	00f42a23          	sw	a5,20(s0)
    a984:	eedff06f          	j	a870 <__smakebuf_r+0x30>
    a988:	40000a13          	li	s4,1024
    a98c:	00000993          	li	s3,0
    a990:	f3dff06f          	j	a8cc <__smakebuf_r+0x8c>
    a994:	00e41583          	lh	a1,14(s0)
    a998:	00048513          	mv	a0,s1
    a99c:	09c000ef          	jal	aa38 <_isatty_r>
    a9a0:	02051063          	bnez	a0,a9c0 <__smakebuf_r+0x180>
    a9a4:	00c41783          	lh	a5,12(s0)
    a9a8:	f51ff06f          	j	a8f8 <__smakebuf_r+0xb8>
    a9ac:	07412483          	lw	s1,116(sp)
    a9b0:	07012903          	lw	s2,112(sp)
    a9b4:	06c12983          	lw	s3,108(sp)
    a9b8:	06812a03          	lw	s4,104(sp)
    a9bc:	eb5ff06f          	j	a870 <__smakebuf_r+0x30>
    a9c0:	00c45783          	lhu	a5,12(s0)
    a9c4:	ffc7f793          	and	a5,a5,-4
    a9c8:	0017e793          	or	a5,a5,1
    a9cc:	01079793          	sll	a5,a5,0x10
    a9d0:	4107d793          	sra	a5,a5,0x10
    a9d4:	f25ff06f          	j	a8f8 <__smakebuf_r+0xb8>

0000a9d8 <_fstat_r>:
    a9d8:	ff010113          	add	sp,sp,-16
    a9dc:	00058713          	mv	a4,a1
    a9e0:	00812423          	sw	s0,8(sp)
    a9e4:	00060593          	mv	a1,a2
    a9e8:	00050413          	mv	s0,a0
    a9ec:	00070513          	mv	a0,a4
    a9f0:	7fff6797          	auipc	a5,0x7fff6
    a9f4:	d207a423          	sw	zero,-728(a5) # 80000718 <errno>
    a9f8:	00112623          	sw	ra,12(sp)
    a9fc:	c15f50ef          	jal	610 <_fstat>
    aa00:	fff00793          	li	a5,-1
    aa04:	00f50a63          	beq	a0,a5,aa18 <_fstat_r+0x40>
    aa08:	00c12083          	lw	ra,12(sp)
    aa0c:	00812403          	lw	s0,8(sp)
    aa10:	01010113          	add	sp,sp,16
    aa14:	00008067          	ret
    aa18:	7fff6797          	auipc	a5,0x7fff6
    aa1c:	d007a783          	lw	a5,-768(a5) # 80000718 <errno>
    aa20:	fe0784e3          	beqz	a5,aa08 <_fstat_r+0x30>
    aa24:	00c12083          	lw	ra,12(sp)
    aa28:	00f42023          	sw	a5,0(s0)
    aa2c:	00812403          	lw	s0,8(sp)
    aa30:	01010113          	add	sp,sp,16
    aa34:	00008067          	ret

0000aa38 <_isatty_r>:
    aa38:	ff010113          	add	sp,sp,-16
    aa3c:	00812423          	sw	s0,8(sp)
    aa40:	00050413          	mv	s0,a0
    aa44:	00058513          	mv	a0,a1
    aa48:	7fff6797          	auipc	a5,0x7fff6
    aa4c:	cc07a823          	sw	zero,-816(a5) # 80000718 <errno>
    aa50:	00112623          	sw	ra,12(sp)
    aa54:	bd5f50ef          	jal	628 <_isatty>
    aa58:	fff00793          	li	a5,-1
    aa5c:	00f50a63          	beq	a0,a5,aa70 <_isatty_r+0x38>
    aa60:	00c12083          	lw	ra,12(sp)
    aa64:	00812403          	lw	s0,8(sp)
    aa68:	01010113          	add	sp,sp,16
    aa6c:	00008067          	ret
    aa70:	7fff6797          	auipc	a5,0x7fff6
    aa74:	ca87a783          	lw	a5,-856(a5) # 80000718 <errno>
    aa78:	fe0784e3          	beqz	a5,aa60 <_isatty_r+0x28>
    aa7c:	00c12083          	lw	ra,12(sp)
    aa80:	00f42023          	sw	a5,0(s0)
    aa84:	00812403          	lw	s0,8(sp)
    aa88:	01010113          	add	sp,sp,16
    aa8c:	00008067          	ret

0000aa90 <__errno>:
    aa90:	7fff6517          	auipc	a0,0x7fff6
    aa94:	c7852503          	lw	a0,-904(a0) # 80000708 <_impure_ptr>
    aa98:	00008067          	ret

0000aa9c <__assert_func>:
    aa9c:	ff010113          	add	sp,sp,-16
    aaa0:	00068793          	mv	a5,a3
    aaa4:	7fff6717          	auipc	a4,0x7fff6
    aaa8:	c6472703          	lw	a4,-924(a4) # 80000708 <_impure_ptr>
    aaac:	00060813          	mv	a6,a2
    aab0:	00112623          	sw	ra,12(sp)
    aab4:	00c72883          	lw	a7,12(a4)
    aab8:	00078613          	mv	a2,a5
    aabc:	00050693          	mv	a3,a0
    aac0:	00058713          	mv	a4,a1
    aac4:	00004797          	auipc	a5,0x4
    aac8:	0bc78793          	add	a5,a5,188 # eb80 <__fini_array_end+0x23c>
    aacc:	00080c63          	beqz	a6,aae4 <__assert_func+0x48>
    aad0:	00004597          	auipc	a1,0x4
    aad4:	0c058593          	add	a1,a1,192 # eb90 <__fini_array_end+0x24c>
    aad8:	00088513          	mv	a0,a7
    aadc:	3a8000ef          	jal	ae84 <fiprintf>
    aae0:	3f0000ef          	jal	aed0 <abort>
    aae4:	00004797          	auipc	a5,0x4
    aae8:	e6878793          	add	a5,a5,-408 # e94c <__fini_array_end+0x8>
    aaec:	00078813          	mv	a6,a5
    aaf0:	fe1ff06f          	j	aad0 <__assert_func+0x34>

0000aaf4 <_calloc_r>:
    aaf4:	fe010113          	add	sp,sp,-32
    aaf8:	00812c23          	sw	s0,24(sp)
    aafc:	00112e23          	sw	ra,28(sp)
    ab00:	0105d693          	srl	a3,a1,0x10
    ab04:	00058793          	mv	a5,a1
    ab08:	00050413          	mv	s0,a0
    ab0c:	01065713          	srl	a4,a2,0x10
    ab10:	0c069063          	bnez	a3,abd0 <_calloc_r+0xdc>
    ab14:	14071a63          	bnez	a4,ac68 <_calloc_r+0x174>
    ab18:	01061593          	sll	a1,a2,0x10
    ab1c:	01079513          	sll	a0,a5,0x10
    ab20:	0105d593          	srl	a1,a1,0x10
    ab24:	01055513          	srl	a0,a0,0x10
    ab28:	4bd030ef          	jal	e7e4 <__mulsi3>
    ab2c:	00050593          	mv	a1,a0
    ab30:	00040513          	mv	a0,s0
    ab34:	e60f60ef          	jal	1194 <_malloc_r>
    ab38:	00050413          	mv	s0,a0
    ab3c:	10050a63          	beqz	a0,ac50 <_calloc_r+0x15c>
    ab40:	ffc52603          	lw	a2,-4(a0)
    ab44:	02400713          	li	a4,36
    ab48:	ffc67613          	and	a2,a2,-4
    ab4c:	ffc60613          	add	a2,a2,-4
    ab50:	04c76863          	bltu	a4,a2,aba0 <_calloc_r+0xac>
    ab54:	01300693          	li	a3,19
    ab58:	00050793          	mv	a5,a0
    ab5c:	02c6f263          	bgeu	a3,a2,ab80 <_calloc_r+0x8c>
    ab60:	00052023          	sw	zero,0(a0)
    ab64:	00052223          	sw	zero,4(a0)
    ab68:	01b00793          	li	a5,27
    ab6c:	04c7f863          	bgeu	a5,a2,abbc <_calloc_r+0xc8>
    ab70:	00052423          	sw	zero,8(a0)
    ab74:	00052623          	sw	zero,12(a0)
    ab78:	01050793          	add	a5,a0,16
    ab7c:	10e60263          	beq	a2,a4,ac80 <_calloc_r+0x18c>
    ab80:	0007a023          	sw	zero,0(a5)
    ab84:	0007a223          	sw	zero,4(a5)
    ab88:	0007a423          	sw	zero,8(a5)
    ab8c:	01c12083          	lw	ra,28(sp)
    ab90:	00040513          	mv	a0,s0
    ab94:	01812403          	lw	s0,24(sp)
    ab98:	02010113          	add	sp,sp,32
    ab9c:	00008067          	ret
    aba0:	00000593          	li	a1,0
    aba4:	e95f50ef          	jal	a38 <memset>
    aba8:	01c12083          	lw	ra,28(sp)
    abac:	00040513          	mv	a0,s0
    abb0:	01812403          	lw	s0,24(sp)
    abb4:	02010113          	add	sp,sp,32
    abb8:	00008067          	ret
    abbc:	00850793          	add	a5,a0,8
    abc0:	0007a023          	sw	zero,0(a5)
    abc4:	0007a223          	sw	zero,4(a5)
    abc8:	0007a423          	sw	zero,8(a5)
    abcc:	fc1ff06f          	j	ab8c <_calloc_r+0x98>
    abd0:	0c071663          	bnez	a4,ac9c <_calloc_r+0x1a8>
    abd4:	01212823          	sw	s2,16(sp)
    abd8:	01312623          	sw	s3,12(sp)
    abdc:	00912a23          	sw	s1,20(sp)
    abe0:	00068913          	mv	s2,a3
    abe4:	00060993          	mv	s3,a2
    abe8:	01079513          	sll	a0,a5,0x10
    abec:	01061593          	sll	a1,a2,0x10
    abf0:	0105d593          	srl	a1,a1,0x10
    abf4:	01055513          	srl	a0,a0,0x10
    abf8:	3ed030ef          	jal	e7e4 <__mulsi3>
    abfc:	00050493          	mv	s1,a0
    ac00:	01091593          	sll	a1,s2,0x10
    ac04:	01099513          	sll	a0,s3,0x10
    ac08:	0105d593          	srl	a1,a1,0x10
    ac0c:	01055513          	srl	a0,a0,0x10
    ac10:	3d5030ef          	jal	e7e4 <__mulsi3>
    ac14:	0104d793          	srl	a5,s1,0x10
    ac18:	00f505b3          	add	a1,a0,a5
    ac1c:	0105d793          	srl	a5,a1,0x10
    ac20:	06079863          	bnez	a5,ac90 <_calloc_r+0x19c>
    ac24:	01049493          	sll	s1,s1,0x10
    ac28:	0104d493          	srl	s1,s1,0x10
    ac2c:	01059593          	sll	a1,a1,0x10
    ac30:	0095e5b3          	or	a1,a1,s1
    ac34:	00040513          	mv	a0,s0
    ac38:	01412483          	lw	s1,20(sp)
    ac3c:	01012903          	lw	s2,16(sp)
    ac40:	00c12983          	lw	s3,12(sp)
    ac44:	d50f60ef          	jal	1194 <_malloc_r>
    ac48:	00050413          	mv	s0,a0
    ac4c:	ee051ae3          	bnez	a0,ab40 <_calloc_r+0x4c>
    ac50:	00000413          	li	s0,0
    ac54:	01c12083          	lw	ra,28(sp)
    ac58:	00040513          	mv	a0,s0
    ac5c:	01812403          	lw	s0,24(sp)
    ac60:	02010113          	add	sp,sp,32
    ac64:	00008067          	ret
    ac68:	01212823          	sw	s2,16(sp)
    ac6c:	01312623          	sw	s3,12(sp)
    ac70:	00912a23          	sw	s1,20(sp)
    ac74:	00070913          	mv	s2,a4
    ac78:	00058993          	mv	s3,a1
    ac7c:	f6dff06f          	j	abe8 <_calloc_r+0xf4>
    ac80:	00052823          	sw	zero,16(a0)
    ac84:	01850793          	add	a5,a0,24
    ac88:	00052a23          	sw	zero,20(a0)
    ac8c:	ef5ff06f          	j	ab80 <_calloc_r+0x8c>
    ac90:	01412483          	lw	s1,20(sp)
    ac94:	01012903          	lw	s2,16(sp)
    ac98:	00c12983          	lw	s3,12(sp)
    ac9c:	df5ff0ef          	jal	aa90 <__errno>
    aca0:	00c00793          	li	a5,12
    aca4:	00f52023          	sw	a5,0(a0)
    aca8:	00000413          	li	s0,0
    acac:	fa9ff06f          	j	ac54 <_calloc_r+0x160>

0000acb0 <_wcsnrtombs_l>:
    acb0:	fa010113          	add	sp,sp,-96
    acb4:	04912a23          	sw	s1,84(sp)
    acb8:	05212823          	sw	s2,80(sp)
    acbc:	05312623          	sw	s3,76(sp)
    acc0:	05412423          	sw	s4,72(sp)
    acc4:	05512223          	sw	s5,68(sp)
    acc8:	04112e23          	sw	ra,92(sp)
    accc:	03912a23          	sw	s9,52(sp)
    acd0:	03a12823          	sw	s10,48(sp)
    acd4:	00a12623          	sw	a0,12(sp)
    acd8:	00058a13          	mv	s4,a1
    acdc:	00060a93          	mv	s5,a2
    ace0:	00070913          	mv	s2,a4
    ace4:	00080993          	mv	s3,a6
    ace8:	00078493          	mv	s1,a5
    acec:	12078063          	beqz	a5,ae0c <_wcsnrtombs_l+0x15c>
    acf0:	000aac83          	lw	s9,0(s5)
    acf4:	120a0263          	beqz	s4,ae18 <_wcsnrtombs_l+0x168>
    acf8:	14090e63          	beqz	s2,ae54 <_wcsnrtombs_l+0x1a4>
    acfc:	05612023          	sw	s6,64(sp)
    ad00:	fff68b13          	add	s6,a3,-1
    ad04:	16068063          	beqz	a3,ae64 <_wcsnrtombs_l+0x1b4>
    ad08:	04812c23          	sw	s0,88(sp)
    ad0c:	03b12623          	sw	s11,44(sp)
    ad10:	03712e23          	sw	s7,60(sp)
    ad14:	03812c23          	sw	s8,56(sp)
    ad18:	000a0413          	mv	s0,s4
    ad1c:	00000d13          	li	s10,0
    ad20:	fff00d93          	li	s11,-1
    ad24:	0240006f          	j	ad48 <_wcsnrtombs_l+0x98>
    ad28:	080a1a63          	bnez	s4,adbc <_wcsnrtombs_l+0x10c>
    ad2c:	000ca783          	lw	a5,0(s9)
    ad30:	004c8c93          	add	s9,s9,4
    ad34:	0c078263          	beqz	a5,adf8 <_wcsnrtombs_l+0x148>
    ad38:	1326f263          	bgeu	a3,s2,ae5c <_wcsnrtombs_l+0x1ac>
    ad3c:	fffb0b13          	add	s6,s6,-1
    ad40:	00068d13          	mv	s10,a3
    ad44:	03bb0c63          	beq	s6,s11,ad7c <_wcsnrtombs_l+0xcc>
    ad48:	0e09a783          	lw	a5,224(s3)
    ad4c:	000ca603          	lw	a2,0(s9)
    ad50:	00c12503          	lw	a0,12(sp)
    ad54:	00048693          	mv	a3,s1
    ad58:	01410593          	add	a1,sp,20
    ad5c:	0004ac03          	lw	s8,0(s1)
    ad60:	0044ab83          	lw	s7,4(s1)
    ad64:	000780e7          	jalr	a5
    ad68:	0bb50e63          	beq	a0,s11,ae24 <_wcsnrtombs_l+0x174>
    ad6c:	01a506b3          	add	a3,a0,s10
    ad70:	fad97ce3          	bgeu	s2,a3,ad28 <_wcsnrtombs_l+0x78>
    ad74:	0184a023          	sw	s8,0(s1)
    ad78:	0174a223          	sw	s7,4(s1)
    ad7c:	05812403          	lw	s0,88(sp)
    ad80:	04012b03          	lw	s6,64(sp)
    ad84:	03c12b83          	lw	s7,60(sp)
    ad88:	03812c03          	lw	s8,56(sp)
    ad8c:	02c12d83          	lw	s11,44(sp)
    ad90:	05c12083          	lw	ra,92(sp)
    ad94:	05412483          	lw	s1,84(sp)
    ad98:	05012903          	lw	s2,80(sp)
    ad9c:	04c12983          	lw	s3,76(sp)
    ada0:	04812a03          	lw	s4,72(sp)
    ada4:	04412a83          	lw	s5,68(sp)
    ada8:	03412c83          	lw	s9,52(sp)
    adac:	000d0513          	mv	a0,s10
    adb0:	03012d03          	lw	s10,48(sp)
    adb4:	06010113          	add	sp,sp,96
    adb8:	00008067          	ret
    adbc:	08a05063          	blez	a0,ae3c <_wcsnrtombs_l+0x18c>
    adc0:	01410893          	add	a7,sp,20
    adc4:	00a40533          	add	a0,s0,a0
    adc8:	0008c783          	lbu	a5,0(a7)
    adcc:	00140413          	add	s0,s0,1
    add0:	00188893          	add	a7,a7,1
    add4:	fef40fa3          	sb	a5,-1(s0)
    add8:	fe8518e3          	bne	a0,s0,adc8 <_wcsnrtombs_l+0x118>
    addc:	000aa783          	lw	a5,0(s5)
    ade0:	00050413          	mv	s0,a0
    ade4:	00478793          	add	a5,a5,4
    ade8:	00faa023          	sw	a5,0(s5)
    adec:	000ca783          	lw	a5,0(s9)
    adf0:	004c8c93          	add	s9,s9,4
    adf4:	f40792e3          	bnez	a5,ad38 <_wcsnrtombs_l+0x88>
    adf8:	000a0463          	beqz	s4,ae00 <_wcsnrtombs_l+0x150>
    adfc:	000aa023          	sw	zero,0(s5)
    ae00:	0004a023          	sw	zero,0(s1)
    ae04:	fff68d13          	add	s10,a3,-1
    ae08:	f75ff06f          	j	ad7c <_wcsnrtombs_l+0xcc>
    ae0c:	000aac83          	lw	s9,0(s5)
    ae10:	10c50493          	add	s1,a0,268
    ae14:	ee0a12e3          	bnez	s4,acf8 <_wcsnrtombs_l+0x48>
    ae18:	05612023          	sw	s6,64(sp)
    ae1c:	fff00913          	li	s2,-1
    ae20:	ee1ff06f          	j	ad00 <_wcsnrtombs_l+0x50>
    ae24:	00c12703          	lw	a4,12(sp)
    ae28:	08a00793          	li	a5,138
    ae2c:	fff00d13          	li	s10,-1
    ae30:	00f72023          	sw	a5,0(a4)
    ae34:	0004a023          	sw	zero,0(s1)
    ae38:	f45ff06f          	j	ad7c <_wcsnrtombs_l+0xcc>
    ae3c:	000aa783          	lw	a5,0(s5)
    ae40:	00040513          	mv	a0,s0
    ae44:	00050413          	mv	s0,a0
    ae48:	00478793          	add	a5,a5,4
    ae4c:	00faa023          	sw	a5,0(s5)
    ae50:	f9dff06f          	j	adec <_wcsnrtombs_l+0x13c>
    ae54:	00000d13          	li	s10,0
    ae58:	f39ff06f          	j	ad90 <_wcsnrtombs_l+0xe0>
    ae5c:	00068d13          	mv	s10,a3
    ae60:	f1dff06f          	j	ad7c <_wcsnrtombs_l+0xcc>
    ae64:	04012b03          	lw	s6,64(sp)
    ae68:	00000d13          	li	s10,0
    ae6c:	f25ff06f          	j	ad90 <_wcsnrtombs_l+0xe0>

0000ae70 <_wcsnrtombs_r>:
    ae70:	7fff5817          	auipc	a6,0x7fff5
    ae74:	6c480813          	add	a6,a6,1732 # 80000534 <__global_locale>
    ae78:	7fff6517          	auipc	a0,0x7fff6
    ae7c:	89052503          	lw	a0,-1904(a0) # 80000708 <_impure_ptr>
    ae80:	e31ff06f          	j	acb0 <_wcsnrtombs_l>

0000ae84 <fiprintf>:
    ae84:	fc010113          	add	sp,sp,-64
    ae88:	02810313          	add	t1,sp,40
    ae8c:	02c12423          	sw	a2,40(sp)
    ae90:	02d12623          	sw	a3,44(sp)
    ae94:	00058613          	mv	a2,a1
    ae98:	00030693          	mv	a3,t1
    ae9c:	00050593          	mv	a1,a0
    aea0:	7fff6517          	auipc	a0,0x7fff6
    aea4:	86852503          	lw	a0,-1944(a0) # 80000708 <_impure_ptr>
    aea8:	00112e23          	sw	ra,28(sp)
    aeac:	02e12823          	sw	a4,48(sp)
    aeb0:	02f12a23          	sw	a5,52(sp)
    aeb4:	03012c23          	sw	a6,56(sp)
    aeb8:	03112e23          	sw	a7,60(sp)
    aebc:	00612623          	sw	t1,12(sp)
    aec0:	9a1f90ef          	jal	4860 <_vfiprintf_r>
    aec4:	01c12083          	lw	ra,28(sp)
    aec8:	04010113          	add	sp,sp,64
    aecc:	00008067          	ret

0000aed0 <abort>:
    aed0:	ff010113          	add	sp,sp,-16
    aed4:	00600513          	li	a0,6
    aed8:	00112623          	sw	ra,12(sp)
    aedc:	00c000ef          	jal	aee8 <raise>
    aee0:	00100513          	li	a0,1
    aee4:	f14f50ef          	jal	5f8 <_exit>

0000aee8 <raise>:
    aee8:	ff010113          	add	sp,sp,-16
    aeec:	00912223          	sw	s1,4(sp)
    aef0:	00112623          	sw	ra,12(sp)
    aef4:	01f00793          	li	a5,31
    aef8:	7fff6497          	auipc	s1,0x7fff6
    aefc:	8104a483          	lw	s1,-2032(s1) # 80000708 <_impure_ptr>
    af00:	08a7ee63          	bltu	a5,a0,af9c <raise+0xb4>
    af04:	1184a783          	lw	a5,280(s1)
    af08:	00812423          	sw	s0,8(sp)
    af0c:	00050413          	mv	s0,a0
    af10:	04078263          	beqz	a5,af54 <raise+0x6c>
    af14:	00251713          	sll	a4,a0,0x2
    af18:	00e787b3          	add	a5,a5,a4
    af1c:	0007a703          	lw	a4,0(a5)
    af20:	02070a63          	beqz	a4,af54 <raise+0x6c>
    af24:	00100693          	li	a3,1
    af28:	00d70a63          	beq	a4,a3,af3c <raise+0x54>
    af2c:	fff00693          	li	a3,-1
    af30:	04d70663          	beq	a4,a3,af7c <raise+0x94>
    af34:	0007a023          	sw	zero,0(a5)
    af38:	000700e7          	jalr	a4
    af3c:	00812403          	lw	s0,8(sp)
    af40:	00000513          	li	a0,0
    af44:	00c12083          	lw	ra,12(sp)
    af48:	00412483          	lw	s1,4(sp)
    af4c:	01010113          	add	sp,sp,16
    af50:	00008067          	ret
    af54:	00048513          	mv	a0,s1
    af58:	0b4000ef          	jal	b00c <_getpid_r>
    af5c:	00040613          	mv	a2,s0
    af60:	00812403          	lw	s0,8(sp)
    af64:	00c12083          	lw	ra,12(sp)
    af68:	00050593          	mv	a1,a0
    af6c:	00048513          	mv	a0,s1
    af70:	00412483          	lw	s1,4(sp)
    af74:	01010113          	add	sp,sp,16
    af78:	0340006f          	j	afac <_kill_r>
    af7c:	00812403          	lw	s0,8(sp)
    af80:	00c12083          	lw	ra,12(sp)
    af84:	01600793          	li	a5,22
    af88:	00f4a023          	sw	a5,0(s1)
    af8c:	00100513          	li	a0,1
    af90:	00412483          	lw	s1,4(sp)
    af94:	01010113          	add	sp,sp,16
    af98:	00008067          	ret
    af9c:	01600793          	li	a5,22
    afa0:	00f4a023          	sw	a5,0(s1)
    afa4:	fff00513          	li	a0,-1
    afa8:	f9dff06f          	j	af44 <raise+0x5c>

0000afac <_kill_r>:
    afac:	ff010113          	add	sp,sp,-16
    afb0:	00058713          	mv	a4,a1
    afb4:	00812423          	sw	s0,8(sp)
    afb8:	00060593          	mv	a1,a2
    afbc:	00050413          	mv	s0,a0
    afc0:	00070513          	mv	a0,a4
    afc4:	7fff5797          	auipc	a5,0x7fff5
    afc8:	7407aa23          	sw	zero,1876(a5) # 80000718 <errno>
    afcc:	00112623          	sw	ra,12(sp)
    afd0:	e60f50ef          	jal	630 <_kill>
    afd4:	fff00793          	li	a5,-1
    afd8:	00f50a63          	beq	a0,a5,afec <_kill_r+0x40>
    afdc:	00c12083          	lw	ra,12(sp)
    afe0:	00812403          	lw	s0,8(sp)
    afe4:	01010113          	add	sp,sp,16
    afe8:	00008067          	ret
    afec:	7fff5797          	auipc	a5,0x7fff5
    aff0:	72c7a783          	lw	a5,1836(a5) # 80000718 <errno>
    aff4:	fe0784e3          	beqz	a5,afdc <_kill_r+0x30>
    aff8:	00c12083          	lw	ra,12(sp)
    affc:	00f42023          	sw	a5,0(s0)
    b000:	00812403          	lw	s0,8(sp)
    b004:	01010113          	add	sp,sp,16
    b008:	00008067          	ret

0000b00c <_getpid_r>:
    b00c:	e14f506f          	j	620 <_getpid>

0000b010 <__udivdi3>:
    b010:	fd010113          	add	sp,sp,-48
    b014:	01312e23          	sw	s3,28(sp)
    b018:	02112623          	sw	ra,44(sp)
    b01c:	01612823          	sw	s6,16(sp)
    b020:	00050993          	mv	s3,a0
    b024:	16069663          	bnez	a3,b190 <__udivdi3+0x180>
    b028:	02812423          	sw	s0,40(sp)
    b02c:	01512a23          	sw	s5,20(sp)
    b030:	02912223          	sw	s1,36(sp)
    b034:	03212023          	sw	s2,32(sp)
    b038:	01412c23          	sw	s4,24(sp)
    b03c:	00060a93          	mv	s5,a2
    b040:	00050413          	mv	s0,a0
    b044:	1cc5f063          	bgeu	a1,a2,b204 <__udivdi3+0x1f4>
    b048:	000107b7          	lui	a5,0x10
    b04c:	00058493          	mv	s1,a1
    b050:	2af66e63          	bltu	a2,a5,b30c <__udivdi3+0x2fc>
    b054:	010007b7          	lui	a5,0x1000
    b058:	01800713          	li	a4,24
    b05c:	00f67463          	bgeu	a2,a5,b064 <__udivdi3+0x54>
    b060:	01000713          	li	a4,16
    b064:	00e656b3          	srl	a3,a2,a4
    b068:	00004797          	auipc	a5,0x4
    b06c:	14878793          	add	a5,a5,328 # f1b0 <__clz_tab>
    b070:	00d787b3          	add	a5,a5,a3
    b074:	0007c783          	lbu	a5,0(a5)
    b078:	02000693          	li	a3,32
    b07c:	00e787b3          	add	a5,a5,a4
    b080:	40f68733          	sub	a4,a3,a5
    b084:	00f68c63          	beq	a3,a5,b09c <__udivdi3+0x8c>
    b088:	00e594b3          	sll	s1,a1,a4
    b08c:	00f9d7b3          	srl	a5,s3,a5
    b090:	00e61ab3          	sll	s5,a2,a4
    b094:	0097e4b3          	or	s1,a5,s1
    b098:	00e99433          	sll	s0,s3,a4
    b09c:	010ada13          	srl	s4,s5,0x10
    b0a0:	000a0593          	mv	a1,s4
    b0a4:	00048513          	mv	a0,s1
    b0a8:	010a9b13          	sll	s6,s5,0x10
    b0ac:	764030ef          	jal	e810 <__hidden___udivsi3>
    b0b0:	010b5b13          	srl	s6,s6,0x10
    b0b4:	00050593          	mv	a1,a0
    b0b8:	00050913          	mv	s2,a0
    b0bc:	000b0513          	mv	a0,s6
    b0c0:	724030ef          	jal	e7e4 <__mulsi3>
    b0c4:	00050793          	mv	a5,a0
    b0c8:	000a0593          	mv	a1,s4
    b0cc:	00048513          	mv	a0,s1
    b0d0:	00078493          	mv	s1,a5
    b0d4:	784030ef          	jal	e858 <__umodsi3>
    b0d8:	01051513          	sll	a0,a0,0x10
    b0dc:	01045793          	srl	a5,s0,0x10
    b0e0:	00a7e7b3          	or	a5,a5,a0
    b0e4:	0097fc63          	bgeu	a5,s1,b0fc <__udivdi3+0xec>
    b0e8:	00fa87b3          	add	a5,s5,a5
    b0ec:	fff90713          	add	a4,s2,-1 # efff <blanks.1+0x127>
    b0f0:	0157e463          	bltu	a5,s5,b0f8 <__udivdi3+0xe8>
    b0f4:	5a97e863          	bltu	a5,s1,b6a4 <__udivdi3+0x694>
    b0f8:	00070913          	mv	s2,a4
    b0fc:	409784b3          	sub	s1,a5,s1
    b100:	000a0593          	mv	a1,s4
    b104:	00048513          	mv	a0,s1
    b108:	708030ef          	jal	e810 <__hidden___udivsi3>
    b10c:	00050593          	mv	a1,a0
    b110:	00050993          	mv	s3,a0
    b114:	000b0513          	mv	a0,s6
    b118:	6cc030ef          	jal	e7e4 <__mulsi3>
    b11c:	00050793          	mv	a5,a0
    b120:	000a0593          	mv	a1,s4
    b124:	00048513          	mv	a0,s1
    b128:	01041413          	sll	s0,s0,0x10
    b12c:	00078493          	mv	s1,a5
    b130:	728030ef          	jal	e858 <__umodsi3>
    b134:	01051513          	sll	a0,a0,0x10
    b138:	01045413          	srl	s0,s0,0x10
    b13c:	00a46433          	or	s0,s0,a0
    b140:	00947c63          	bgeu	s0,s1,b158 <__udivdi3+0x148>
    b144:	008a8433          	add	s0,s5,s0
    b148:	fff98793          	add	a5,s3,-1
    b14c:	4d546e63          	bltu	s0,s5,b628 <__udivdi3+0x618>
    b150:	ffe98993          	add	s3,s3,-2
    b154:	4c947a63          	bgeu	s0,s1,b628 <__udivdi3+0x618>
    b158:	01091613          	sll	a2,s2,0x10
    b15c:	01366533          	or	a0,a2,s3
    b160:	00000b13          	li	s6,0
    b164:	02812403          	lw	s0,40(sp)
    b168:	02c12083          	lw	ra,44(sp)
    b16c:	02412483          	lw	s1,36(sp)
    b170:	02012903          	lw	s2,32(sp)
    b174:	01812a03          	lw	s4,24(sp)
    b178:	01412a83          	lw	s5,20(sp)
    b17c:	01c12983          	lw	s3,28(sp)
    b180:	000b0593          	mv	a1,s6
    b184:	01012b03          	lw	s6,16(sp)
    b188:	03010113          	add	sp,sp,48
    b18c:	00008067          	ret
    b190:	02d5f263          	bgeu	a1,a3,b1b4 <__udivdi3+0x1a4>
    b194:	00000b13          	li	s6,0
    b198:	00000513          	li	a0,0
    b19c:	02c12083          	lw	ra,44(sp)
    b1a0:	01c12983          	lw	s3,28(sp)
    b1a4:	000b0593          	mv	a1,s6
    b1a8:	01012b03          	lw	s6,16(sp)
    b1ac:	03010113          	add	sp,sp,48
    b1b0:	00008067          	ret
    b1b4:	000107b7          	lui	a5,0x10
    b1b8:	26f6ee63          	bltu	a3,a5,b434 <__udivdi3+0x424>
    b1bc:	01000737          	lui	a4,0x1000
    b1c0:	01800793          	li	a5,24
    b1c4:	00e6f463          	bgeu	a3,a4,b1cc <__udivdi3+0x1bc>
    b1c8:	01000793          	li	a5,16
    b1cc:	00f6d533          	srl	a0,a3,a5
    b1d0:	00004717          	auipc	a4,0x4
    b1d4:	fe070713          	add	a4,a4,-32 # f1b0 <__clz_tab>
    b1d8:	00a70733          	add	a4,a4,a0
    b1dc:	00074703          	lbu	a4,0(a4)
    b1e0:	02000513          	li	a0,32
    b1e4:	00f70733          	add	a4,a4,a5
    b1e8:	40e50b33          	sub	s6,a0,a4
    b1ec:	26e51c63          	bne	a0,a4,b464 <__udivdi3+0x454>
    b1f0:	46b6ee63          	bltu	a3,a1,b66c <__udivdi3+0x65c>
    b1f4:	00c9b533          	sltu	a0,s3,a2
    b1f8:	00153513          	seqz	a0,a0
    b1fc:	00000b13          	li	s6,0
    b200:	f9dff06f          	j	b19c <__udivdi3+0x18c>
    b204:	10060c63          	beqz	a2,b31c <__udivdi3+0x30c>
    b208:	000107b7          	lui	a5,0x10
    b20c:	44f67663          	bgeu	a2,a5,b658 <__udivdi3+0x648>
    b210:	10063713          	sltiu	a4,a2,256
    b214:	00173713          	seqz	a4,a4
    b218:	00371713          	sll	a4,a4,0x3
    b21c:	00e656b3          	srl	a3,a2,a4
    b220:	00004797          	auipc	a5,0x4
    b224:	f9078793          	add	a5,a5,-112 # f1b0 <__clz_tab>
    b228:	00d787b3          	add	a5,a5,a3
    b22c:	0007c483          	lbu	s1,0(a5)
    b230:	02000793          	li	a5,32
    b234:	00e484b3          	add	s1,s1,a4
    b238:	40978733          	sub	a4,a5,s1
    b23c:	10979463          	bne	a5,s1,b344 <__udivdi3+0x334>
    b240:	01061a13          	sll	s4,a2,0x10
    b244:	40c584b3          	sub	s1,a1,a2
    b248:	01065913          	srl	s2,a2,0x10
    b24c:	010a5a13          	srl	s4,s4,0x10
    b250:	00100b13          	li	s6,1
    b254:	00090593          	mv	a1,s2
    b258:	00048513          	mv	a0,s1
    b25c:	5b4030ef          	jal	e810 <__hidden___udivsi3>
    b260:	000a0593          	mv	a1,s4
    b264:	00050993          	mv	s3,a0
    b268:	57c030ef          	jal	e7e4 <__mulsi3>
    b26c:	00050793          	mv	a5,a0
    b270:	00090593          	mv	a1,s2
    b274:	00048513          	mv	a0,s1
    b278:	00078493          	mv	s1,a5
    b27c:	5dc030ef          	jal	e858 <__umodsi3>
    b280:	01051513          	sll	a0,a0,0x10
    b284:	01045793          	srl	a5,s0,0x10
    b288:	00a7e7b3          	or	a5,a5,a0
    b28c:	0097fc63          	bgeu	a5,s1,b2a4 <__udivdi3+0x294>
    b290:	00fa87b3          	add	a5,s5,a5
    b294:	fff98713          	add	a4,s3,-1
    b298:	0157e463          	bltu	a5,s5,b2a0 <__udivdi3+0x290>
    b29c:	3e97ee63          	bltu	a5,s1,b698 <__udivdi3+0x688>
    b2a0:	00070993          	mv	s3,a4
    b2a4:	409784b3          	sub	s1,a5,s1
    b2a8:	00090593          	mv	a1,s2
    b2ac:	00048513          	mv	a0,s1
    b2b0:	560030ef          	jal	e810 <__hidden___udivsi3>
    b2b4:	000a0593          	mv	a1,s4
    b2b8:	00050a13          	mv	s4,a0
    b2bc:	528030ef          	jal	e7e4 <__mulsi3>
    b2c0:	00050793          	mv	a5,a0
    b2c4:	00090593          	mv	a1,s2
    b2c8:	00048513          	mv	a0,s1
    b2cc:	01041413          	sll	s0,s0,0x10
    b2d0:	00078493          	mv	s1,a5
    b2d4:	584030ef          	jal	e858 <__umodsi3>
    b2d8:	01051513          	sll	a0,a0,0x10
    b2dc:	01045413          	srl	s0,s0,0x10
    b2e0:	00a46433          	or	s0,s0,a0
    b2e4:	00947e63          	bgeu	s0,s1,b300 <__udivdi3+0x2f0>
    b2e8:	008a8433          	add	s0,s5,s0
    b2ec:	fffa0793          	add	a5,s4,-1
    b2f0:	01546663          	bltu	s0,s5,b2fc <__udivdi3+0x2ec>
    b2f4:	ffea0a13          	add	s4,s4,-2
    b2f8:	00946463          	bltu	s0,s1,b300 <__udivdi3+0x2f0>
    b2fc:	00078a13          	mv	s4,a5
    b300:	01099613          	sll	a2,s3,0x10
    b304:	01466533          	or	a0,a2,s4
    b308:	e5dff06f          	j	b164 <__udivdi3+0x154>
    b30c:	10063713          	sltiu	a4,a2,256
    b310:	00173713          	seqz	a4,a4
    b314:	00371713          	sll	a4,a4,0x3
    b318:	d4dff06f          	j	b064 <__udivdi3+0x54>
    b31c:	00000693          	li	a3,0
    b320:	00004797          	auipc	a5,0x4
    b324:	e9078793          	add	a5,a5,-368 # f1b0 <__clz_tab>
    b328:	00d787b3          	add	a5,a5,a3
    b32c:	0007c483          	lbu	s1,0(a5)
    b330:	00000713          	li	a4,0
    b334:	02000793          	li	a5,32
    b338:	00e484b3          	add	s1,s1,a4
    b33c:	40978733          	sub	a4,a5,s1
    b340:	f09780e3          	beq	a5,s1,b240 <__udivdi3+0x230>
    b344:	00e61ab3          	sll	s5,a2,a4
    b348:	01712623          	sw	s7,12(sp)
    b34c:	010ad913          	srl	s2,s5,0x10
    b350:	0095dbb3          	srl	s7,a1,s1
    b354:	00e597b3          	sll	a5,a1,a4
    b358:	0099d4b3          	srl	s1,s3,s1
    b35c:	00090593          	mv	a1,s2
    b360:	000b8513          	mv	a0,s7
    b364:	010a9a13          	sll	s4,s5,0x10
    b368:	00f4e4b3          	or	s1,s1,a5
    b36c:	00e99433          	sll	s0,s3,a4
    b370:	010a5a13          	srl	s4,s4,0x10
    b374:	49c030ef          	jal	e810 <__hidden___udivsi3>
    b378:	00050593          	mv	a1,a0
    b37c:	00050b13          	mv	s6,a0
    b380:	000a0513          	mv	a0,s4
    b384:	460030ef          	jal	e7e4 <__mulsi3>
    b388:	00050993          	mv	s3,a0
    b38c:	00090593          	mv	a1,s2
    b390:	000b8513          	mv	a0,s7
    b394:	4c4030ef          	jal	e858 <__umodsi3>
    b398:	01051513          	sll	a0,a0,0x10
    b39c:	0104d793          	srl	a5,s1,0x10
    b3a0:	00a7e7b3          	or	a5,a5,a0
    b3a4:	0137fe63          	bgeu	a5,s3,b3c0 <__udivdi3+0x3b0>
    b3a8:	00fa87b3          	add	a5,s5,a5
    b3ac:	fffb0713          	add	a4,s6,-1
    b3b0:	2d57ec63          	bltu	a5,s5,b688 <__udivdi3+0x678>
    b3b4:	2d37fa63          	bgeu	a5,s3,b688 <__udivdi3+0x678>
    b3b8:	ffeb0b13          	add	s6,s6,-2
    b3bc:	015787b3          	add	a5,a5,s5
    b3c0:	413789b3          	sub	s3,a5,s3
    b3c4:	00090593          	mv	a1,s2
    b3c8:	00098513          	mv	a0,s3
    b3cc:	444030ef          	jal	e810 <__hidden___udivsi3>
    b3d0:	00050593          	mv	a1,a0
    b3d4:	00050b93          	mv	s7,a0
    b3d8:	000a0513          	mv	a0,s4
    b3dc:	408030ef          	jal	e7e4 <__mulsi3>
    b3e0:	00050793          	mv	a5,a0
    b3e4:	00090593          	mv	a1,s2
    b3e8:	00098513          	mv	a0,s3
    b3ec:	01049493          	sll	s1,s1,0x10
    b3f0:	00078993          	mv	s3,a5
    b3f4:	464030ef          	jal	e858 <__umodsi3>
    b3f8:	01051513          	sll	a0,a0,0x10
    b3fc:	0104d493          	srl	s1,s1,0x10
    b400:	00a4e4b3          	or	s1,s1,a0
    b404:	0134fe63          	bgeu	s1,s3,b420 <__udivdi3+0x410>
    b408:	009a84b3          	add	s1,s5,s1
    b40c:	fffb8793          	add	a5,s7,-1
    b410:	2754e463          	bltu	s1,s5,b678 <__udivdi3+0x668>
    b414:	2734f263          	bgeu	s1,s3,b678 <__udivdi3+0x668>
    b418:	ffeb8b93          	add	s7,s7,-2
    b41c:	015484b3          	add	s1,s1,s5
    b420:	010b1b13          	sll	s6,s6,0x10
    b424:	017b6b33          	or	s6,s6,s7
    b428:	413484b3          	sub	s1,s1,s3
    b42c:	00c12b83          	lw	s7,12(sp)
    b430:	e25ff06f          	j	b254 <__udivdi3+0x244>
    b434:	1006b793          	sltiu	a5,a3,256
    b438:	0017b793          	seqz	a5,a5
    b43c:	00379793          	sll	a5,a5,0x3
    b440:	00f6d533          	srl	a0,a3,a5
    b444:	00004717          	auipc	a4,0x4
    b448:	d6c70713          	add	a4,a4,-660 # f1b0 <__clz_tab>
    b44c:	00a70733          	add	a4,a4,a0
    b450:	00074703          	lbu	a4,0(a4)
    b454:	02000513          	li	a0,32
    b458:	00f70733          	add	a4,a4,a5
    b45c:	40e50b33          	sub	s6,a0,a4
    b460:	d8e508e3          	beq	a0,a4,b1f0 <__udivdi3+0x1e0>
    b464:	016696b3          	sll	a3,a3,s6
    b468:	01912223          	sw	s9,4(sp)
    b46c:	00e65cb3          	srl	s9,a2,a4
    b470:	00dcecb3          	or	s9,s9,a3
    b474:	01512a23          	sw	s5,20(sp)
    b478:	01712623          	sw	s7,12(sp)
    b47c:	010cda93          	srl	s5,s9,0x10
    b480:	00e5dbb3          	srl	s7,a1,a4
    b484:	016597b3          	sll	a5,a1,s6
    b488:	00e9d733          	srl	a4,s3,a4
    b48c:	01812423          	sw	s8,8(sp)
    b490:	000a8593          	mv	a1,s5
    b494:	000b8513          	mv	a0,s7
    b498:	010c9c13          	sll	s8,s9,0x10
    b49c:	02812423          	sw	s0,40(sp)
    b4a0:	02912223          	sw	s1,36(sp)
    b4a4:	03212023          	sw	s2,32(sp)
    b4a8:	00f764b3          	or	s1,a4,a5
    b4ac:	01661933          	sll	s2,a2,s6
    b4b0:	01412c23          	sw	s4,24(sp)
    b4b4:	010c5c13          	srl	s8,s8,0x10
    b4b8:	358030ef          	jal	e810 <__hidden___udivsi3>
    b4bc:	00050593          	mv	a1,a0
    b4c0:	00050413          	mv	s0,a0
    b4c4:	000c0513          	mv	a0,s8
    b4c8:	31c030ef          	jal	e7e4 <__mulsi3>
    b4cc:	00050a13          	mv	s4,a0
    b4d0:	000a8593          	mv	a1,s5
    b4d4:	000b8513          	mv	a0,s7
    b4d8:	380030ef          	jal	e858 <__umodsi3>
    b4dc:	01051513          	sll	a0,a0,0x10
    b4e0:	0104d793          	srl	a5,s1,0x10
    b4e4:	00a7e7b3          	or	a5,a5,a0
    b4e8:	0147fe63          	bgeu	a5,s4,b504 <__udivdi3+0x4f4>
    b4ec:	00fc87b3          	add	a5,s9,a5
    b4f0:	fff40713          	add	a4,s0,-1
    b4f4:	1997ee63          	bltu	a5,s9,b690 <__udivdi3+0x680>
    b4f8:	1947fc63          	bgeu	a5,s4,b690 <__udivdi3+0x680>
    b4fc:	ffe40413          	add	s0,s0,-2
    b500:	019787b3          	add	a5,a5,s9
    b504:	41478a33          	sub	s4,a5,s4
    b508:	000a8593          	mv	a1,s5
    b50c:	000a0513          	mv	a0,s4
    b510:	300030ef          	jal	e810 <__hidden___udivsi3>
    b514:	00050593          	mv	a1,a0
    b518:	00050b93          	mv	s7,a0
    b51c:	000c0513          	mv	a0,s8
    b520:	2c4030ef          	jal	e7e4 <__mulsi3>
    b524:	00050793          	mv	a5,a0
    b528:	000a8593          	mv	a1,s5
    b52c:	000a0513          	mv	a0,s4
    b530:	00078a13          	mv	s4,a5
    b534:	324030ef          	jal	e858 <__umodsi3>
    b538:	01049713          	sll	a4,s1,0x10
    b53c:	01051513          	sll	a0,a0,0x10
    b540:	01075713          	srl	a4,a4,0x10
    b544:	00a76733          	or	a4,a4,a0
    b548:	01477e63          	bgeu	a4,s4,b564 <__udivdi3+0x554>
    b54c:	00ec8733          	add	a4,s9,a4
    b550:	fffb8793          	add	a5,s7,-1
    b554:	13976663          	bltu	a4,s9,b680 <__udivdi3+0x670>
    b558:	13477463          	bgeu	a4,s4,b680 <__udivdi3+0x670>
    b55c:	ffeb8b93          	add	s7,s7,-2
    b560:	01970733          	add	a4,a4,s9
    b564:	00010e37          	lui	t3,0x10
    b568:	01041413          	sll	s0,s0,0x10
    b56c:	01746433          	or	s0,s0,s7
    b570:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    b574:	00f47833          	and	a6,s0,a5
    b578:	00f977b3          	and	a5,s2,a5
    b57c:	41470733          	sub	a4,a4,s4
    b580:	01045e93          	srl	t4,s0,0x10
    b584:	01095913          	srl	s2,s2,0x10
    b588:	00080513          	mv	a0,a6
    b58c:	00078593          	mv	a1,a5
    b590:	254030ef          	jal	e7e4 <__mulsi3>
    b594:	00050313          	mv	t1,a0
    b598:	00090593          	mv	a1,s2
    b59c:	00080513          	mv	a0,a6
    b5a0:	244030ef          	jal	e7e4 <__mulsi3>
    b5a4:	00050813          	mv	a6,a0
    b5a8:	00078593          	mv	a1,a5
    b5ac:	000e8513          	mv	a0,t4
    b5b0:	234030ef          	jal	e7e4 <__mulsi3>
    b5b4:	00050893          	mv	a7,a0
    b5b8:	00090593          	mv	a1,s2
    b5bc:	000e8513          	mv	a0,t4
    b5c0:	224030ef          	jal	e7e4 <__mulsi3>
    b5c4:	01035793          	srl	a5,t1,0x10
    b5c8:	01180833          	add	a6,a6,a7
    b5cc:	010787b3          	add	a5,a5,a6
    b5d0:	0117f463          	bgeu	a5,a7,b5d8 <__udivdi3+0x5c8>
    b5d4:	01c50533          	add	a0,a0,t3
    b5d8:	0107d693          	srl	a3,a5,0x10
    b5dc:	00a686b3          	add	a3,a3,a0
    b5e0:	06d76863          	bltu	a4,a3,b650 <__udivdi3+0x640>
    b5e4:	04d70663          	beq	a4,a3,b630 <__udivdi3+0x620>
    b5e8:	00040513          	mv	a0,s0
    b5ec:	02812403          	lw	s0,40(sp)
    b5f0:	02c12083          	lw	ra,44(sp)
    b5f4:	00000b13          	li	s6,0
    b5f8:	02412483          	lw	s1,36(sp)
    b5fc:	02012903          	lw	s2,32(sp)
    b600:	01812a03          	lw	s4,24(sp)
    b604:	01412a83          	lw	s5,20(sp)
    b608:	00c12b83          	lw	s7,12(sp)
    b60c:	00812c03          	lw	s8,8(sp)
    b610:	00412c83          	lw	s9,4(sp)
    b614:	01c12983          	lw	s3,28(sp)
    b618:	000b0593          	mv	a1,s6
    b61c:	01012b03          	lw	s6,16(sp)
    b620:	03010113          	add	sp,sp,48
    b624:	00008067          	ret
    b628:	00078993          	mv	s3,a5
    b62c:	b2dff06f          	j	b158 <__udivdi3+0x148>
    b630:	00010737          	lui	a4,0x10
    b634:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    b638:	00e7f7b3          	and	a5,a5,a4
    b63c:	01079793          	sll	a5,a5,0x10
    b640:	00e37333          	and	t1,t1,a4
    b644:	01699533          	sll	a0,s3,s6
    b648:	006787b3          	add	a5,a5,t1
    b64c:	f8f57ee3          	bgeu	a0,a5,b5e8 <__udivdi3+0x5d8>
    b650:	fff40513          	add	a0,s0,-1
    b654:	f99ff06f          	j	b5ec <__udivdi3+0x5dc>
    b658:	010007b7          	lui	a5,0x1000
    b65c:	04f67a63          	bgeu	a2,a5,b6b0 <__udivdi3+0x6a0>
    b660:	01065693          	srl	a3,a2,0x10
    b664:	01000713          	li	a4,16
    b668:	bb9ff06f          	j	b220 <__udivdi3+0x210>
    b66c:	00000b13          	li	s6,0
    b670:	00100513          	li	a0,1
    b674:	b29ff06f          	j	b19c <__udivdi3+0x18c>
    b678:	00078b93          	mv	s7,a5
    b67c:	da5ff06f          	j	b420 <__udivdi3+0x410>
    b680:	00078b93          	mv	s7,a5
    b684:	ee1ff06f          	j	b564 <__udivdi3+0x554>
    b688:	00070b13          	mv	s6,a4
    b68c:	d35ff06f          	j	b3c0 <__udivdi3+0x3b0>
    b690:	00070413          	mv	s0,a4
    b694:	e71ff06f          	j	b504 <__udivdi3+0x4f4>
    b698:	ffe98993          	add	s3,s3,-2
    b69c:	015787b3          	add	a5,a5,s5
    b6a0:	c05ff06f          	j	b2a4 <__udivdi3+0x294>
    b6a4:	ffe90913          	add	s2,s2,-2
    b6a8:	015787b3          	add	a5,a5,s5
    b6ac:	a51ff06f          	j	b0fc <__udivdi3+0xec>
    b6b0:	01865693          	srl	a3,a2,0x18
    b6b4:	01800713          	li	a4,24
    b6b8:	b69ff06f          	j	b220 <__udivdi3+0x210>

0000b6bc <__umoddi3>:
    b6bc:	fd010113          	add	sp,sp,-48
    b6c0:	02112623          	sw	ra,44(sp)
    b6c4:	00050793          	mv	a5,a0
    b6c8:	14069663          	bnez	a3,b814 <__umoddi3+0x158>
    b6cc:	03212023          	sw	s2,32(sp)
    b6d0:	01412c23          	sw	s4,24(sp)
    b6d4:	02812423          	sw	s0,40(sp)
    b6d8:	02912223          	sw	s1,36(sp)
    b6dc:	01312e23          	sw	s3,28(sp)
    b6e0:	01512a23          	sw	s5,20(sp)
    b6e4:	00060a13          	mv	s4,a2
    b6e8:	00050913          	mv	s2,a0
    b6ec:	1ac5f663          	bgeu	a1,a2,b898 <__umoddi3+0x1dc>
    b6f0:	01612823          	sw	s6,16(sp)
    b6f4:	00010737          	lui	a4,0x10
    b6f8:	00058993          	mv	s3,a1
    b6fc:	28e66063          	bltu	a2,a4,b97c <__umoddi3+0x2c0>
    b700:	01000737          	lui	a4,0x1000
    b704:	01800693          	li	a3,24
    b708:	00e67463          	bgeu	a2,a4,b710 <__umoddi3+0x54>
    b70c:	01000693          	li	a3,16
    b710:	00d65533          	srl	a0,a2,a3
    b714:	00004717          	auipc	a4,0x4
    b718:	a9c70713          	add	a4,a4,-1380 # f1b0 <__clz_tab>
    b71c:	00a70733          	add	a4,a4,a0
    b720:	00074703          	lbu	a4,0(a4)
    b724:	02000513          	li	a0,32
    b728:	00d70733          	add	a4,a4,a3
    b72c:	40e504b3          	sub	s1,a0,a4
    b730:	00e50c63          	beq	a0,a4,b748 <__umoddi3+0x8c>
    b734:	009599b3          	sll	s3,a1,s1
    b738:	00e7d733          	srl	a4,a5,a4
    b73c:	00961a33          	sll	s4,a2,s1
    b740:	013769b3          	or	s3,a4,s3
    b744:	00979933          	sll	s2,a5,s1
    b748:	010a5a93          	srl	s5,s4,0x10
    b74c:	000a8593          	mv	a1,s5
    b750:	00098513          	mv	a0,s3
    b754:	010a1b13          	sll	s6,s4,0x10
    b758:	0b8030ef          	jal	e810 <__hidden___udivsi3>
    b75c:	010b5b13          	srl	s6,s6,0x10
    b760:	000b0593          	mv	a1,s6
    b764:	080030ef          	jal	e7e4 <__mulsi3>
    b768:	00050413          	mv	s0,a0
    b76c:	000a8593          	mv	a1,s5
    b770:	00098513          	mv	a0,s3
    b774:	0e4030ef          	jal	e858 <__umodsi3>
    b778:	01051513          	sll	a0,a0,0x10
    b77c:	01095793          	srl	a5,s2,0x10
    b780:	00a7e7b3          	or	a5,a5,a0
    b784:	0087f863          	bgeu	a5,s0,b794 <__umoddi3+0xd8>
    b788:	00fa07b3          	add	a5,s4,a5
    b78c:	0147e463          	bltu	a5,s4,b794 <__umoddi3+0xd8>
    b790:	5687e863          	bltu	a5,s0,bd00 <__umoddi3+0x644>
    b794:	40878433          	sub	s0,a5,s0
    b798:	000a8593          	mv	a1,s5
    b79c:	00040513          	mv	a0,s0
    b7a0:	070030ef          	jal	e810 <__hidden___udivsi3>
    b7a4:	000b0593          	mv	a1,s6
    b7a8:	03c030ef          	jal	e7e4 <__mulsi3>
    b7ac:	00050793          	mv	a5,a0
    b7b0:	000a8593          	mv	a1,s5
    b7b4:	00040513          	mv	a0,s0
    b7b8:	00078413          	mv	s0,a5
    b7bc:	09c030ef          	jal	e858 <__umodsi3>
    b7c0:	01091793          	sll	a5,s2,0x10
    b7c4:	01051513          	sll	a0,a0,0x10
    b7c8:	0107d793          	srl	a5,a5,0x10
    b7cc:	00a7e7b3          	or	a5,a5,a0
    b7d0:	0087f863          	bgeu	a5,s0,b7e0 <__umoddi3+0x124>
    b7d4:	00fa07b3          	add	a5,s4,a5
    b7d8:	0147e463          	bltu	a5,s4,b7e0 <__umoddi3+0x124>
    b7dc:	5087ea63          	bltu	a5,s0,bcf0 <__umoddi3+0x634>
    b7e0:	01012b03          	lw	s6,16(sp)
    b7e4:	408787b3          	sub	a5,a5,s0
    b7e8:	0097d533          	srl	a0,a5,s1
    b7ec:	02812403          	lw	s0,40(sp)
    b7f0:	02412483          	lw	s1,36(sp)
    b7f4:	02012903          	lw	s2,32(sp)
    b7f8:	01c12983          	lw	s3,28(sp)
    b7fc:	01812a03          	lw	s4,24(sp)
    b800:	01412a83          	lw	s5,20(sp)
    b804:	00000593          	li	a1,0
    b808:	02c12083          	lw	ra,44(sp)
    b80c:	03010113          	add	sp,sp,48
    b810:	00008067          	ret
    b814:	00050893          	mv	a7,a0
    b818:	fed5e8e3          	bltu	a1,a3,b808 <__umoddi3+0x14c>
    b81c:	03212023          	sw	s2,32(sp)
    b820:	01312e23          	sw	s3,28(sp)
    b824:	00010737          	lui	a4,0x10
    b828:	00058813          	mv	a6,a1
    b82c:	24e6ec63          	bltu	a3,a4,ba84 <__umoddi3+0x3c8>
    b830:	01000737          	lui	a4,0x1000
    b834:	01800513          	li	a0,24
    b838:	00e6f463          	bgeu	a3,a4,b840 <__umoddi3+0x184>
    b83c:	01000513          	li	a0,16
    b840:	00a6d333          	srl	t1,a3,a0
    b844:	00004717          	auipc	a4,0x4
    b848:	96c70713          	add	a4,a4,-1684 # f1b0 <__clz_tab>
    b84c:	00670733          	add	a4,a4,t1
    b850:	00074703          	lbu	a4,0(a4)
    b854:	02000313          	li	t1,32
    b858:	00a709b3          	add	s3,a4,a0
    b85c:	41330933          	sub	s2,t1,s3
    b860:	25331a63          	bne	t1,s3,bab4 <__umoddi3+0x3f8>
    b864:	00b6e463          	bltu	a3,a1,b86c <__umoddi3+0x1b0>
    b868:	00c7ea63          	bltu	a5,a2,b87c <__umoddi3+0x1c0>
    b86c:	40c788b3          	sub	a7,a5,a2
    b870:	40d586b3          	sub	a3,a1,a3
    b874:	0117b833          	sltu	a6,a5,a7
    b878:	41068833          	sub	a6,a3,a6
    b87c:	02c12083          	lw	ra,44(sp)
    b880:	02012903          	lw	s2,32(sp)
    b884:	01c12983          	lw	s3,28(sp)
    b888:	00088513          	mv	a0,a7
    b88c:	00080593          	mv	a1,a6
    b890:	03010113          	add	sp,sp,48
    b894:	00008067          	ret
    b898:	0e060a63          	beqz	a2,b98c <__umoddi3+0x2d0>
    b89c:	00010737          	lui	a4,0x10
    b8a0:	42e67663          	bgeu	a2,a4,bccc <__umoddi3+0x610>
    b8a4:	10063693          	sltiu	a3,a2,256
    b8a8:	0016b693          	seqz	a3,a3
    b8ac:	00369693          	sll	a3,a3,0x3
    b8b0:	00d65533          	srl	a0,a2,a3
    b8b4:	00004717          	auipc	a4,0x4
    b8b8:	8fc70713          	add	a4,a4,-1796 # f1b0 <__clz_tab>
    b8bc:	00a70733          	add	a4,a4,a0
    b8c0:	00074983          	lbu	s3,0(a4)
    b8c4:	02000713          	li	a4,32
    b8c8:	00d989b3          	add	s3,s3,a3
    b8cc:	413704b3          	sub	s1,a4,s3
    b8d0:	0f371263          	bne	a4,s3,b9b4 <__umoddi3+0x2f8>
    b8d4:	01061413          	sll	s0,a2,0x10
    b8d8:	40c589b3          	sub	s3,a1,a2
    b8dc:	01065a93          	srl	s5,a2,0x10
    b8e0:	01045413          	srl	s0,s0,0x10
    b8e4:	000a8593          	mv	a1,s5
    b8e8:	00098513          	mv	a0,s3
    b8ec:	725020ef          	jal	e810 <__hidden___udivsi3>
    b8f0:	00040593          	mv	a1,s0
    b8f4:	6f1020ef          	jal	e7e4 <__mulsi3>
    b8f8:	00050793          	mv	a5,a0
    b8fc:	000a8593          	mv	a1,s5
    b900:	00098513          	mv	a0,s3
    b904:	00078993          	mv	s3,a5
    b908:	751020ef          	jal	e858 <__umodsi3>
    b90c:	01051513          	sll	a0,a0,0x10
    b910:	01095793          	srl	a5,s2,0x10
    b914:	00a7e7b3          	or	a5,a5,a0
    b918:	0137f863          	bgeu	a5,s3,b928 <__umoddi3+0x26c>
    b91c:	00fa07b3          	add	a5,s4,a5
    b920:	0147e463          	bltu	a5,s4,b928 <__umoddi3+0x26c>
    b924:	3d37ea63          	bltu	a5,s3,bcf8 <__umoddi3+0x63c>
    b928:	413789b3          	sub	s3,a5,s3
    b92c:	000a8593          	mv	a1,s5
    b930:	00098513          	mv	a0,s3
    b934:	6dd020ef          	jal	e810 <__hidden___udivsi3>
    b938:	00040593          	mv	a1,s0
    b93c:	6a9020ef          	jal	e7e4 <__mulsi3>
    b940:	00050413          	mv	s0,a0
    b944:	000a8593          	mv	a1,s5
    b948:	00098513          	mv	a0,s3
    b94c:	70d020ef          	jal	e858 <__umodsi3>
    b950:	01091913          	sll	s2,s2,0x10
    b954:	01051793          	sll	a5,a0,0x10
    b958:	01095913          	srl	s2,s2,0x10
    b95c:	00f967b3          	or	a5,s2,a5
    b960:	0087fa63          	bgeu	a5,s0,b974 <__umoddi3+0x2b8>
    b964:	00fa07b3          	add	a5,s4,a5
    b968:	0147e663          	bltu	a5,s4,b974 <__umoddi3+0x2b8>
    b96c:	0087f463          	bgeu	a5,s0,b974 <__umoddi3+0x2b8>
    b970:	014787b3          	add	a5,a5,s4
    b974:	408787b3          	sub	a5,a5,s0
    b978:	e71ff06f          	j	b7e8 <__umoddi3+0x12c>
    b97c:	10063693          	sltiu	a3,a2,256
    b980:	0016b693          	seqz	a3,a3
    b984:	00369693          	sll	a3,a3,0x3
    b988:	d89ff06f          	j	b710 <__umoddi3+0x54>
    b98c:	00000513          	li	a0,0
    b990:	00004717          	auipc	a4,0x4
    b994:	82070713          	add	a4,a4,-2016 # f1b0 <__clz_tab>
    b998:	00a70733          	add	a4,a4,a0
    b99c:	00074983          	lbu	s3,0(a4)
    b9a0:	00000693          	li	a3,0
    b9a4:	02000713          	li	a4,32
    b9a8:	00d989b3          	add	s3,s3,a3
    b9ac:	413704b3          	sub	s1,a4,s3
    b9b0:	f33702e3          	beq	a4,s3,b8d4 <__umoddi3+0x218>
    b9b4:	00961a33          	sll	s4,a2,s1
    b9b8:	01712623          	sw	s7,12(sp)
    b9bc:	010a5a93          	srl	s5,s4,0x10
    b9c0:	0135dbb3          	srl	s7,a1,s3
    b9c4:	00959733          	sll	a4,a1,s1
    b9c8:	0137d9b3          	srl	s3,a5,s3
    b9cc:	000a8593          	mv	a1,s5
    b9d0:	000b8513          	mv	a0,s7
    b9d4:	010a1413          	sll	s0,s4,0x10
    b9d8:	00e9e9b3          	or	s3,s3,a4
    b9dc:	00979933          	sll	s2,a5,s1
    b9e0:	01612823          	sw	s6,16(sp)
    b9e4:	01045413          	srl	s0,s0,0x10
    b9e8:	629020ef          	jal	e810 <__hidden___udivsi3>
    b9ec:	00040593          	mv	a1,s0
    b9f0:	5f5020ef          	jal	e7e4 <__mulsi3>
    b9f4:	00050b13          	mv	s6,a0
    b9f8:	000a8593          	mv	a1,s5
    b9fc:	000b8513          	mv	a0,s7
    ba00:	659020ef          	jal	e858 <__umodsi3>
    ba04:	01051513          	sll	a0,a0,0x10
    ba08:	0109d793          	srl	a5,s3,0x10
    ba0c:	00a7e7b3          	or	a5,a5,a0
    ba10:	0167fa63          	bgeu	a5,s6,ba24 <__umoddi3+0x368>
    ba14:	00fa07b3          	add	a5,s4,a5
    ba18:	0147e663          	bltu	a5,s4,ba24 <__umoddi3+0x368>
    ba1c:	0167f463          	bgeu	a5,s6,ba24 <__umoddi3+0x368>
    ba20:	014787b3          	add	a5,a5,s4
    ba24:	41678b33          	sub	s6,a5,s6
    ba28:	000a8593          	mv	a1,s5
    ba2c:	000b0513          	mv	a0,s6
    ba30:	5e1020ef          	jal	e810 <__hidden___udivsi3>
    ba34:	00040593          	mv	a1,s0
    ba38:	5ad020ef          	jal	e7e4 <__mulsi3>
    ba3c:	00050793          	mv	a5,a0
    ba40:	000a8593          	mv	a1,s5
    ba44:	000b0513          	mv	a0,s6
    ba48:	01099993          	sll	s3,s3,0x10
    ba4c:	00078b13          	mv	s6,a5
    ba50:	609020ef          	jal	e858 <__umodsi3>
    ba54:	01051513          	sll	a0,a0,0x10
    ba58:	0109d993          	srl	s3,s3,0x10
    ba5c:	00a9e9b3          	or	s3,s3,a0
    ba60:	0169fa63          	bgeu	s3,s6,ba74 <__umoddi3+0x3b8>
    ba64:	013a09b3          	add	s3,s4,s3
    ba68:	0149e663          	bltu	s3,s4,ba74 <__umoddi3+0x3b8>
    ba6c:	0169f463          	bgeu	s3,s6,ba74 <__umoddi3+0x3b8>
    ba70:	014989b3          	add	s3,s3,s4
    ba74:	416989b3          	sub	s3,s3,s6
    ba78:	00c12b83          	lw	s7,12(sp)
    ba7c:	01012b03          	lw	s6,16(sp)
    ba80:	e65ff06f          	j	b8e4 <__umoddi3+0x228>
    ba84:	1006b513          	sltiu	a0,a3,256
    ba88:	00153513          	seqz	a0,a0
    ba8c:	00351513          	sll	a0,a0,0x3
    ba90:	00a6d333          	srl	t1,a3,a0
    ba94:	00003717          	auipc	a4,0x3
    ba98:	71c70713          	add	a4,a4,1820 # f1b0 <__clz_tab>
    ba9c:	00670733          	add	a4,a4,t1
    baa0:	00074703          	lbu	a4,0(a4)
    baa4:	02000313          	li	t1,32
    baa8:	00a709b3          	add	s3,a4,a0
    baac:	41330933          	sub	s2,t1,s3
    bab0:	db330ae3          	beq	t1,s3,b864 <__umoddi3+0x1a8>
    bab4:	01512a23          	sw	s5,20(sp)
    bab8:	012696b3          	sll	a3,a3,s2
    babc:	01365ab3          	srl	s5,a2,s3
    bac0:	00daeab3          	or	s5,s5,a3
    bac4:	01712623          	sw	s7,12(sp)
    bac8:	01a12023          	sw	s10,0(sp)
    bacc:	010adb93          	srl	s7,s5,0x10
    bad0:	0135dd33          	srl	s10,a1,s3
    bad4:	01259733          	sll	a4,a1,s2
    bad8:	0137d6b3          	srl	a3,a5,s3
    badc:	01912223          	sw	s9,4(sp)
    bae0:	000b8593          	mv	a1,s7
    bae4:	000d0513          	mv	a0,s10
    bae8:	010a9c93          	sll	s9,s5,0x10
    baec:	02812423          	sw	s0,40(sp)
    baf0:	02912223          	sw	s1,36(sp)
    baf4:	01261433          	sll	s0,a2,s2
    baf8:	012794b3          	sll	s1,a5,s2
    bafc:	01412c23          	sw	s4,24(sp)
    bb00:	01612823          	sw	s6,16(sp)
    bb04:	00e6ea33          	or	s4,a3,a4
    bb08:	01812423          	sw	s8,8(sp)
    bb0c:	010cdc93          	srl	s9,s9,0x10
    bb10:	501020ef          	jal	e810 <__hidden___udivsi3>
    bb14:	00050593          	mv	a1,a0
    bb18:	00050b13          	mv	s6,a0
    bb1c:	000c8513          	mv	a0,s9
    bb20:	4c5020ef          	jal	e7e4 <__mulsi3>
    bb24:	00050c13          	mv	s8,a0
    bb28:	000b8593          	mv	a1,s7
    bb2c:	000d0513          	mv	a0,s10
    bb30:	529020ef          	jal	e858 <__umodsi3>
    bb34:	01051513          	sll	a0,a0,0x10
    bb38:	010a5793          	srl	a5,s4,0x10
    bb3c:	00a7e7b3          	or	a5,a5,a0
    bb40:	0187fe63          	bgeu	a5,s8,bb5c <__umoddi3+0x4a0>
    bb44:	00fa87b3          	add	a5,s5,a5
    bb48:	fffb0713          	add	a4,s6,-1
    bb4c:	1957ee63          	bltu	a5,s5,bce8 <__umoddi3+0x62c>
    bb50:	1987fc63          	bgeu	a5,s8,bce8 <__umoddi3+0x62c>
    bb54:	ffeb0b13          	add	s6,s6,-2
    bb58:	015787b3          	add	a5,a5,s5
    bb5c:	41878c33          	sub	s8,a5,s8
    bb60:	000b8593          	mv	a1,s7
    bb64:	000c0513          	mv	a0,s8
    bb68:	4a9020ef          	jal	e810 <__hidden___udivsi3>
    bb6c:	00050593          	mv	a1,a0
    bb70:	00050d13          	mv	s10,a0
    bb74:	000c8513          	mv	a0,s9
    bb78:	46d020ef          	jal	e7e4 <__mulsi3>
    bb7c:	00050793          	mv	a5,a0
    bb80:	000b8593          	mv	a1,s7
    bb84:	000c0513          	mv	a0,s8
    bb88:	00078b93          	mv	s7,a5
    bb8c:	4cd020ef          	jal	e858 <__umodsi3>
    bb90:	010a1593          	sll	a1,s4,0x10
    bb94:	01051513          	sll	a0,a0,0x10
    bb98:	0105d593          	srl	a1,a1,0x10
    bb9c:	00a5e5b3          	or	a1,a1,a0
    bba0:	0175fe63          	bgeu	a1,s7,bbbc <__umoddi3+0x500>
    bba4:	00ba85b3          	add	a1,s5,a1
    bba8:	fffd0793          	add	a5,s10,-1
    bbac:	1355ea63          	bltu	a1,s5,bce0 <__umoddi3+0x624>
    bbb0:	1375f863          	bgeu	a1,s7,bce0 <__umoddi3+0x624>
    bbb4:	ffed0d13          	add	s10,s10,-2
    bbb8:	015585b3          	add	a1,a1,s5
    bbbc:	010b1793          	sll	a5,s6,0x10
    bbc0:	00010e37          	lui	t3,0x10
    bbc4:	01a7e7b3          	or	a5,a5,s10
    bbc8:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    bbcc:	0067f8b3          	and	a7,a5,t1
    bbd0:	00647333          	and	t1,s0,t1
    bbd4:	41758733          	sub	a4,a1,s7
    bbd8:	0107d793          	srl	a5,a5,0x10
    bbdc:	01045e93          	srl	t4,s0,0x10
    bbe0:	00088513          	mv	a0,a7
    bbe4:	00030593          	mv	a1,t1
    bbe8:	3fd020ef          	jal	e7e4 <__mulsi3>
    bbec:	00050813          	mv	a6,a0
    bbf0:	000e8593          	mv	a1,t4
    bbf4:	00088513          	mv	a0,a7
    bbf8:	3ed020ef          	jal	e7e4 <__mulsi3>
    bbfc:	00050893          	mv	a7,a0
    bc00:	00030593          	mv	a1,t1
    bc04:	00078513          	mv	a0,a5
    bc08:	3dd020ef          	jal	e7e4 <__mulsi3>
    bc0c:	00050313          	mv	t1,a0
    bc10:	000e8593          	mv	a1,t4
    bc14:	00078513          	mv	a0,a5
    bc18:	3cd020ef          	jal	e7e4 <__mulsi3>
    bc1c:	01085793          	srl	a5,a6,0x10
    bc20:	006888b3          	add	a7,a7,t1
    bc24:	011787b3          	add	a5,a5,a7
    bc28:	0067f463          	bgeu	a5,t1,bc30 <__umoddi3+0x574>
    bc2c:	01c50533          	add	a0,a0,t3
    bc30:	00010637          	lui	a2,0x10
    bc34:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    bc38:	0107d693          	srl	a3,a5,0x10
    bc3c:	00c7f7b3          	and	a5,a5,a2
    bc40:	01079793          	sll	a5,a5,0x10
    bc44:	00c87833          	and	a6,a6,a2
    bc48:	00a686b3          	add	a3,a3,a0
    bc4c:	010787b3          	add	a5,a5,a6
    bc50:	06d76263          	bltu	a4,a3,bcb4 <__umoddi3+0x5f8>
    bc54:	04d70e63          	beq	a4,a3,bcb0 <__umoddi3+0x5f4>
    bc58:	40f487b3          	sub	a5,s1,a5
    bc5c:	00f4b4b3          	sltu	s1,s1,a5
    bc60:	02812403          	lw	s0,40(sp)
    bc64:	02c12083          	lw	ra,44(sp)
    bc68:	40d705b3          	sub	a1,a4,a3
    bc6c:	409585b3          	sub	a1,a1,s1
    bc70:	01359733          	sll	a4,a1,s3
    bc74:	0127d7b3          	srl	a5,a5,s2
    bc78:	02412483          	lw	s1,36(sp)
    bc7c:	01c12983          	lw	s3,28(sp)
    bc80:	01812a03          	lw	s4,24(sp)
    bc84:	01412a83          	lw	s5,20(sp)
    bc88:	01012b03          	lw	s6,16(sp)
    bc8c:	00c12b83          	lw	s7,12(sp)
    bc90:	00812c03          	lw	s8,8(sp)
    bc94:	00412c83          	lw	s9,4(sp)
    bc98:	00012d03          	lw	s10,0(sp)
    bc9c:	0125d5b3          	srl	a1,a1,s2
    bca0:	00f76533          	or	a0,a4,a5
    bca4:	02012903          	lw	s2,32(sp)
    bca8:	03010113          	add	sp,sp,48
    bcac:	00008067          	ret
    bcb0:	faf4f4e3          	bgeu	s1,a5,bc58 <__umoddi3+0x59c>
    bcb4:	40878433          	sub	s0,a5,s0
    bcb8:	0087b7b3          	sltu	a5,a5,s0
    bcbc:	01578ab3          	add	s5,a5,s5
    bcc0:	415686b3          	sub	a3,a3,s5
    bcc4:	00040793          	mv	a5,s0
    bcc8:	f91ff06f          	j	bc58 <__umoddi3+0x59c>
    bccc:	01000737          	lui	a4,0x1000
    bcd0:	02e67c63          	bgeu	a2,a4,bd08 <__umoddi3+0x64c>
    bcd4:	01065513          	srl	a0,a2,0x10
    bcd8:	01000693          	li	a3,16
    bcdc:	bd9ff06f          	j	b8b4 <__umoddi3+0x1f8>
    bce0:	00078d13          	mv	s10,a5
    bce4:	ed9ff06f          	j	bbbc <__umoddi3+0x500>
    bce8:	00070b13          	mv	s6,a4
    bcec:	e71ff06f          	j	bb5c <__umoddi3+0x4a0>
    bcf0:	014787b3          	add	a5,a5,s4
    bcf4:	aedff06f          	j	b7e0 <__umoddi3+0x124>
    bcf8:	014787b3          	add	a5,a5,s4
    bcfc:	c2dff06f          	j	b928 <__umoddi3+0x26c>
    bd00:	014787b3          	add	a5,a5,s4
    bd04:	a91ff06f          	j	b794 <__umoddi3+0xd8>
    bd08:	01865513          	srl	a0,a2,0x18
    bd0c:	01800693          	li	a3,24
    bd10:	ba5ff06f          	j	b8b4 <__umoddi3+0x1f8>

0000bd14 <__adddf3>:
    bd14:	001007b7          	lui	a5,0x100
    bd18:	fe010113          	add	sp,sp,-32
    bd1c:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    bd20:	00bef833          	and	a6,t4,a1
    bd24:	00def7b3          	and	a5,t4,a3
    bd28:	0146d313          	srl	t1,a3,0x14
    bd2c:	01212823          	sw	s2,16(sp)
    bd30:	0145d913          	srl	s2,a1,0x14
    bd34:	00379793          	sll	a5,a5,0x3
    bd38:	00812c23          	sw	s0,24(sp)
    bd3c:	00381813          	sll	a6,a6,0x3
    bd40:	01f5d413          	srl	s0,a1,0x1f
    bd44:	01d55713          	srl	a4,a0,0x1d
    bd48:	01d65893          	srl	a7,a2,0x1d
    bd4c:	7ff97913          	and	s2,s2,2047
    bd50:	7ff37313          	and	t1,t1,2047
    bd54:	00112e23          	sw	ra,28(sp)
    bd58:	00912a23          	sw	s1,20(sp)
    bd5c:	01312623          	sw	s3,12(sp)
    bd60:	01f6d693          	srl	a3,a3,0x1f
    bd64:	00f8e8b3          	or	a7,a7,a5
    bd68:	01076733          	or	a4,a4,a6
    bd6c:	00351593          	sll	a1,a0,0x3
    bd70:	00361f13          	sll	t5,a2,0x3
    bd74:	406907b3          	sub	a5,s2,t1
    bd78:	1ed40463          	beq	s0,a3,bf60 <__adddf3+0x24c>
    bd7c:	16f05263          	blez	a5,bee0 <__adddf3+0x1cc>
    bd80:	28030663          	beqz	t1,c00c <__adddf3+0x2f8>
    bd84:	7ff00693          	li	a3,2047
    bd88:	42d90663          	beq	s2,a3,c1b4 <__adddf3+0x4a0>
    bd8c:	03800693          	li	a3,56
    bd90:	00100613          	li	a2,1
    bd94:	02f6ce63          	blt	a3,a5,bdd0 <__adddf3+0xbc>
    bd98:	008006b7          	lui	a3,0x800
    bd9c:	00d8e8b3          	or	a7,a7,a3
    bda0:	01f00693          	li	a3,31
    bda4:	52f6ce63          	blt	a3,a5,c2e0 <__adddf3+0x5cc>
    bda8:	02000693          	li	a3,32
    bdac:	40f686b3          	sub	a3,a3,a5
    bdb0:	00d89633          	sll	a2,a7,a3
    bdb4:	00ff5533          	srl	a0,t5,a5
    bdb8:	00df16b3          	sll	a3,t5,a3
    bdbc:	00a66633          	or	a2,a2,a0
    bdc0:	00d036b3          	snez	a3,a3
    bdc4:	00f8d8b3          	srl	a7,a7,a5
    bdc8:	00d66633          	or	a2,a2,a3
    bdcc:	41170733          	sub	a4,a4,a7
    bdd0:	40c58633          	sub	a2,a1,a2
    bdd4:	00c5b5b3          	sltu	a1,a1,a2
    bdd8:	00060493          	mv	s1,a2
    bddc:	40b709b3          	sub	s3,a4,a1
    bde0:	00899793          	sll	a5,s3,0x8
    bde4:	3207da63          	bgez	a5,c118 <__adddf3+0x404>
    bde8:	008007b7          	lui	a5,0x800
    bdec:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    bdf0:	00f9f9b3          	and	s3,s3,a5
    bdf4:	2c098863          	beqz	s3,c0c4 <__adddf3+0x3b0>
    bdf8:	00098513          	mv	a0,s3
    bdfc:	2c1020ef          	jal	e8bc <__clzsi2>
    be00:	ff850793          	add	a5,a0,-8
    be04:	02000693          	li	a3,32
    be08:	40f68733          	sub	a4,a3,a5
    be0c:	00e4d733          	srl	a4,s1,a4
    be10:	00f999b3          	sll	s3,s3,a5
    be14:	01376733          	or	a4,a4,s3
    be18:	00f494b3          	sll	s1,s1,a5
    be1c:	4b27c863          	blt	a5,s2,c2cc <__adddf3+0x5b8>
    be20:	412787b3          	sub	a5,a5,s2
    be24:	00178793          	add	a5,a5,1
    be28:	40f686b3          	sub	a3,a3,a5
    be2c:	00d49633          	sll	a2,s1,a3
    be30:	00f4d9b3          	srl	s3,s1,a5
    be34:	00c03633          	snez	a2,a2
    be38:	01366633          	or	a2,a2,s3
    be3c:	00d716b3          	sll	a3,a4,a3
    be40:	00c6e4b3          	or	s1,a3,a2
    be44:	00f759b3          	srl	s3,a4,a5
    be48:	00000913          	li	s2,0
    be4c:	0074f793          	and	a5,s1,7
    be50:	02078063          	beqz	a5,be70 <__adddf3+0x15c>
    be54:	00f4f793          	and	a5,s1,15
    be58:	00400713          	li	a4,4
    be5c:	00e78a63          	beq	a5,a4,be70 <__adddf3+0x15c>
    be60:	00448793          	add	a5,s1,4
    be64:	0097b633          	sltu	a2,a5,s1
    be68:	00c989b3          	add	s3,s3,a2
    be6c:	00078493          	mv	s1,a5
    be70:	00899793          	sll	a5,s3,0x8
    be74:	6e07da63          	bgez	a5,c568 <__adddf3+0x854>
    be78:	00190793          	add	a5,s2,1
    be7c:	7ff00713          	li	a4,2047
    be80:	00040e13          	mv	t3,s0
    be84:	2ae78663          	beq	a5,a4,c130 <__adddf3+0x41c>
    be88:	ff800737          	lui	a4,0xff800
    be8c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    be90:	00e9f733          	and	a4,s3,a4
    be94:	7ff7f793          	and	a5,a5,2047
    be98:	01d71813          	sll	a6,a4,0x1d
    be9c:	0034d613          	srl	a2,s1,0x3
    bea0:	00971713          	sll	a4,a4,0x9
    bea4:	00c86833          	or	a6,a6,a2
    bea8:	00c75713          	srl	a4,a4,0xc
    beac:	01c12083          	lw	ra,28(sp)
    beb0:	01812403          	lw	s0,24(sp)
    beb4:	01479793          	sll	a5,a5,0x14
    beb8:	00e7e7b3          	or	a5,a5,a4
    bebc:	01fe1713          	sll	a4,t3,0x1f
    bec0:	00e7e7b3          	or	a5,a5,a4
    bec4:	01412483          	lw	s1,20(sp)
    bec8:	01012903          	lw	s2,16(sp)
    becc:	00c12983          	lw	s3,12(sp)
    bed0:	00080513          	mv	a0,a6
    bed4:	00078593          	mv	a1,a5
    bed8:	02010113          	add	sp,sp,32
    bedc:	00008067          	ret
    bee0:	14078c63          	beqz	a5,c038 <__adddf3+0x324>
    bee4:	412307b3          	sub	a5,t1,s2
    bee8:	3c091263          	bnez	s2,c2ac <__adddf3+0x598>
    beec:	00b76533          	or	a0,a4,a1
    bef0:	4c050463          	beqz	a0,c3b8 <__adddf3+0x6a4>
    bef4:	fff78513          	add	a0,a5,-1
    bef8:	60050263          	beqz	a0,c4fc <__adddf3+0x7e8>
    befc:	7ff00813          	li	a6,2047
    bf00:	57078663          	beq	a5,a6,c46c <__adddf3+0x758>
    bf04:	03800793          	li	a5,56
    bf08:	00100613          	li	a2,1
    bf0c:	02a7cc63          	blt	a5,a0,bf44 <__adddf3+0x230>
    bf10:	00050793          	mv	a5,a0
    bf14:	01f00613          	li	a2,31
    bf18:	56f64c63          	blt	a2,a5,c490 <__adddf3+0x77c>
    bf1c:	02000513          	li	a0,32
    bf20:	40f50533          	sub	a0,a0,a5
    bf24:	00a71633          	sll	a2,a4,a0
    bf28:	00f5d833          	srl	a6,a1,a5
    bf2c:	00a59533          	sll	a0,a1,a0
    bf30:	01066633          	or	a2,a2,a6
    bf34:	00a03533          	snez	a0,a0
    bf38:	00f75733          	srl	a4,a4,a5
    bf3c:	00a66633          	or	a2,a2,a0
    bf40:	40e888b3          	sub	a7,a7,a4
    bf44:	40cf0633          	sub	a2,t5,a2
    bf48:	00cf3733          	sltu	a4,t5,a2
    bf4c:	00060493          	mv	s1,a2
    bf50:	40e889b3          	sub	s3,a7,a4
    bf54:	00030913          	mv	s2,t1
    bf58:	00068413          	mv	s0,a3
    bf5c:	e85ff06f          	j	bde0 <__adddf3+0xcc>
    bf60:	1ef05063          	blez	a5,c140 <__adddf3+0x42c>
    bf64:	14031063          	bnez	t1,c0a4 <__adddf3+0x390>
    bf68:	01e8e6b3          	or	a3,a7,t5
    bf6c:	26068c63          	beqz	a3,c1e4 <__adddf3+0x4d0>
    bf70:	fff78693          	add	a3,a5,-1
    bf74:	48068063          	beqz	a3,c3f4 <__adddf3+0x6e0>
    bf78:	7ff00613          	li	a2,2047
    bf7c:	22c78c63          	beq	a5,a2,c1b4 <__adddf3+0x4a0>
    bf80:	03800793          	li	a5,56
    bf84:	00100993          	li	s3,1
    bf88:	02d7cc63          	blt	a5,a3,bfc0 <__adddf3+0x2ac>
    bf8c:	00068793          	mv	a5,a3
    bf90:	01f00693          	li	a3,31
    bf94:	4af6c063          	blt	a3,a5,c434 <__adddf3+0x720>
    bf98:	02000693          	li	a3,32
    bf9c:	40f686b3          	sub	a3,a3,a5
    bfa0:	00d899b3          	sll	s3,a7,a3
    bfa4:	00ff5633          	srl	a2,t5,a5
    bfa8:	00df16b3          	sll	a3,t5,a3
    bfac:	00c9e9b3          	or	s3,s3,a2
    bfb0:	00d036b3          	snez	a3,a3
    bfb4:	00f8d8b3          	srl	a7,a7,a5
    bfb8:	00d9e9b3          	or	s3,s3,a3
    bfbc:	01170733          	add	a4,a4,a7
    bfc0:	00b985b3          	add	a1,s3,a1
    bfc4:	0135b9b3          	sltu	s3,a1,s3
    bfc8:	00058493          	mv	s1,a1
    bfcc:	00e989b3          	add	s3,s3,a4
    bfd0:	00899793          	sll	a5,s3,0x8
    bfd4:	1407d263          	bgez	a5,c118 <__adddf3+0x404>
    bfd8:	00190913          	add	s2,s2,1
    bfdc:	7ff00793          	li	a5,2047
    bfe0:	36f90c63          	beq	s2,a5,c358 <__adddf3+0x644>
    bfe4:	ff8007b7          	lui	a5,0xff800
    bfe8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    bfec:	0014f613          	and	a2,s1,1
    bff0:	00f9f7b3          	and	a5,s3,a5
    bff4:	0014d713          	srl	a4,s1,0x1
    bff8:	00c76733          	or	a4,a4,a2
    bffc:	01f79613          	sll	a2,a5,0x1f
    c000:	00e664b3          	or	s1,a2,a4
    c004:	0017d993          	srl	s3,a5,0x1
    c008:	e45ff06f          	j	be4c <__adddf3+0x138>
    c00c:	01e8e6b3          	or	a3,a7,t5
    c010:	1c068a63          	beqz	a3,c1e4 <__adddf3+0x4d0>
    c014:	fff78693          	add	a3,a5,-1
    c018:	40068063          	beqz	a3,c418 <__adddf3+0x704>
    c01c:	7ff00613          	li	a2,2047
    c020:	18c78a63          	beq	a5,a2,c1b4 <__adddf3+0x4a0>
    c024:	03800793          	li	a5,56
    c028:	00100613          	li	a2,1
    c02c:	dad7c2e3          	blt	a5,a3,bdd0 <__adddf3+0xbc>
    c030:	00068793          	mv	a5,a3
    c034:	d6dff06f          	j	bda0 <__adddf3+0x8c>
    c038:	00190813          	add	a6,s2,1
    c03c:	7fe87813          	and	a6,a6,2046
    c040:	22081c63          	bnez	a6,c278 <__adddf3+0x564>
    c044:	00b76333          	or	t1,a4,a1
    c048:	01e8e833          	or	a6,a7,t5
    c04c:	38091063          	bnez	s2,c3cc <__adddf3+0x6b8>
    c050:	46030e63          	beqz	t1,c4cc <__adddf3+0x7b8>
    c054:	40080663          	beqz	a6,c460 <__adddf3+0x74c>
    c058:	41e589b3          	sub	s3,a1,t5
    c05c:	0135b533          	sltu	a0,a1,s3
    c060:	41170633          	sub	a2,a4,a7
    c064:	40a60633          	sub	a2,a2,a0
    c068:	00861513          	sll	a0,a2,0x8
    c06c:	50055e63          	bgez	a0,c588 <__adddf3+0x874>
    c070:	40bf05b3          	sub	a1,t5,a1
    c074:	40e88733          	sub	a4,a7,a4
    c078:	00bf3f33          	sltu	t5,t5,a1
    c07c:	41e70733          	sub	a4,a4,t5
    c080:	00871613          	sll	a2,a4,0x8
    c084:	00058493          	mv	s1,a1
    c088:	52065e63          	bgez	a2,c5c4 <__adddf3+0x8b0>
    c08c:	ff8007b7          	lui	a5,0xff800
    c090:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c094:	00f77733          	and	a4,a4,a5
    c098:	00068e13          	mv	t3,a3
    c09c:	00100793          	li	a5,1
    c0a0:	df9ff06f          	j	be98 <__adddf3+0x184>
    c0a4:	7ff00693          	li	a3,2047
    c0a8:	10d90663          	beq	s2,a3,c1b4 <__adddf3+0x4a0>
    c0ac:	03800693          	li	a3,56
    c0b0:	00100993          	li	s3,1
    c0b4:	f0f6c6e3          	blt	a3,a5,bfc0 <__adddf3+0x2ac>
    c0b8:	008006b7          	lui	a3,0x800
    c0bc:	00d8e8b3          	or	a7,a7,a3
    c0c0:	ed1ff06f          	j	bf90 <__adddf3+0x27c>
    c0c4:	00048513          	mv	a0,s1
    c0c8:	7f4020ef          	jal	e8bc <__clzsi2>
    c0cc:	01850793          	add	a5,a0,24
    c0d0:	01f00693          	li	a3,31
    c0d4:	d2f6d8e3          	bge	a3,a5,be04 <__adddf3+0xf0>
    c0d8:	ff850713          	add	a4,a0,-8
    c0dc:	00e49733          	sll	a4,s1,a4
    c0e0:	2327c663          	blt	a5,s2,c30c <__adddf3+0x5f8>
    c0e4:	41278933          	sub	s2,a5,s2
    c0e8:	00190793          	add	a5,s2,1
    c0ec:	48f6d663          	bge	a3,a5,c578 <__adddf3+0x864>
    c0f0:	fe190913          	add	s2,s2,-31
    c0f4:	02000693          	li	a3,32
    c0f8:	012754b3          	srl	s1,a4,s2
    c0fc:	00d78c63          	beq	a5,a3,c114 <__adddf3+0x400>
    c100:	04000693          	li	a3,64
    c104:	40f687b3          	sub	a5,a3,a5
    c108:	00f71733          	sll	a4,a4,a5
    c10c:	00e03733          	snez	a4,a4
    c110:	00e4e4b3          	or	s1,s1,a4
    c114:	00000913          	li	s2,0
    c118:	0074f793          	and	a5,s1,7
    c11c:	d2079ce3          	bnez	a5,be54 <__adddf3+0x140>
    c120:	00090793          	mv	a5,s2
    c124:	0034d613          	srl	a2,s1,0x3
    c128:	00098713          	mv	a4,s3
    c12c:	0c00006f          	j	c1ec <__adddf3+0x4d8>
    c130:	7ff00793          	li	a5,2047
    c134:	00000713          	li	a4,0
    c138:	00000813          	li	a6,0
    c13c:	d71ff06f          	j	beac <__adddf3+0x198>
    c140:	0c078a63          	beqz	a5,c214 <__adddf3+0x500>
    c144:	412307b3          	sub	a5,t1,s2
    c148:	1e090263          	beqz	s2,c32c <__adddf3+0x618>
    c14c:	7ff00693          	li	a3,2047
    c150:	32d30863          	beq	t1,a3,c480 <__adddf3+0x76c>
    c154:	03800693          	li	a3,56
    c158:	00100993          	li	s3,1
    c15c:	02f6ce63          	blt	a3,a5,c198 <__adddf3+0x484>
    c160:	008006b7          	lui	a3,0x800
    c164:	00d76733          	or	a4,a4,a3
    c168:	01f00693          	li	a3,31
    c16c:	3cf6c863          	blt	a3,a5,c53c <__adddf3+0x828>
    c170:	02000693          	li	a3,32
    c174:	40f686b3          	sub	a3,a3,a5
    c178:	00d719b3          	sll	s3,a4,a3
    c17c:	00f5d633          	srl	a2,a1,a5
    c180:	00d596b3          	sll	a3,a1,a3
    c184:	00c9e9b3          	or	s3,s3,a2
    c188:	00d036b3          	snez	a3,a3
    c18c:	00f75733          	srl	a4,a4,a5
    c190:	00d9e9b3          	or	s3,s3,a3
    c194:	00e888b3          	add	a7,a7,a4
    c198:	01e98733          	add	a4,s3,t5
    c19c:	013739b3          	sltu	s3,a4,s3
    c1a0:	00070493          	mv	s1,a4
    c1a4:	011989b3          	add	s3,s3,a7
    c1a8:	00030913          	mv	s2,t1
    c1ac:	e25ff06f          	j	bfd0 <__adddf3+0x2bc>
    c1b0:	02081063          	bnez	a6,c1d0 <__adddf3+0x4bc>
    c1b4:	00351613          	sll	a2,a0,0x3
    c1b8:	00365613          	srl	a2,a2,0x3
    c1bc:	01d71813          	sll	a6,a4,0x1d
    c1c0:	00c86833          	or	a6,a6,a2
    c1c4:	00375713          	srl	a4,a4,0x3
    c1c8:	01076733          	or	a4,a4,a6
    c1cc:	18070663          	beqz	a4,c358 <__adddf3+0x644>
    c1d0:	00000e13          	li	t3,0
    c1d4:	7ff00793          	li	a5,2047
    c1d8:	00080737          	lui	a4,0x80
    c1dc:	00000813          	li	a6,0
    c1e0:	ccdff06f          	j	beac <__adddf3+0x198>
    c1e4:	00351613          	sll	a2,a0,0x3
    c1e8:	00365613          	srl	a2,a2,0x3
    c1ec:	01d71813          	sll	a6,a4,0x1d
    c1f0:	7ff00693          	li	a3,2047
    c1f4:	00c86833          	or	a6,a6,a2
    c1f8:	00375713          	srl	a4,a4,0x3
    c1fc:	fcd786e3          	beq	a5,a3,c1c8 <__adddf3+0x4b4>
    c200:	00c71713          	sll	a4,a4,0xc
    c204:	00c75713          	srl	a4,a4,0xc
    c208:	7ff7f793          	and	a5,a5,2047
    c20c:	00040e13          	mv	t3,s0
    c210:	c9dff06f          	j	beac <__adddf3+0x198>
    c214:	00190693          	add	a3,s2,1
    c218:	7fe6f813          	and	a6,a3,2046
    c21c:	14081863          	bnez	a6,c36c <__adddf3+0x658>
    c220:	00b766b3          	or	a3,a4,a1
    c224:	28091c63          	bnez	s2,c4bc <__adddf3+0x7a8>
    c228:	30068263          	beqz	a3,c52c <__adddf3+0x818>
    c22c:	01e8e6b3          	or	a3,a7,t5
    c230:	22068863          	beqz	a3,c460 <__adddf3+0x74c>
    c234:	01e587b3          	add	a5,a1,t5
    c238:	00b7b5b3          	sltu	a1,a5,a1
    c23c:	01170733          	add	a4,a4,a7
    c240:	00b70733          	add	a4,a4,a1
    c244:	0037d813          	srl	a6,a5,0x3
    c248:	00871793          	sll	a5,a4,0x8
    c24c:	00040e13          	mv	t3,s0
    c250:	3407de63          	bgez	a5,c5ac <__adddf3+0x898>
    c254:	ff8007b7          	lui	a5,0xff800
    c258:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c25c:	00f77733          	and	a4,a4,a5
    c260:	01d71793          	sll	a5,a4,0x1d
    c264:	00375713          	srl	a4,a4,0x3
    c268:	0107e833          	or	a6,a5,a6
    c26c:	01d77733          	and	a4,a4,t4
    c270:	00100793          	li	a5,1
    c274:	c39ff06f          	j	beac <__adddf3+0x198>
    c278:	41e58833          	sub	a6,a1,t5
    c27c:	0105b7b3          	sltu	a5,a1,a6
    c280:	411709b3          	sub	s3,a4,a7
    c284:	40f989b3          	sub	s3,s3,a5
    c288:	00899793          	sll	a5,s3,0x8
    c28c:	00080493          	mv	s1,a6
    c290:	1007c663          	bltz	a5,c39c <__adddf3+0x688>
    c294:	01386833          	or	a6,a6,s3
    c298:	b4081ee3          	bnez	a6,bdf4 <__adddf3+0xe0>
    c29c:	00000e13          	li	t3,0
    c2a0:	00000793          	li	a5,0
    c2a4:	00000713          	li	a4,0
    c2a8:	c05ff06f          	j	beac <__adddf3+0x198>
    c2ac:	7ff00513          	li	a0,2047
    c2b0:	1aa30e63          	beq	t1,a0,c46c <__adddf3+0x758>
    c2b4:	03800513          	li	a0,56
    c2b8:	00100613          	li	a2,1
    c2bc:	c8f544e3          	blt	a0,a5,bf44 <__adddf3+0x230>
    c2c0:	00800637          	lui	a2,0x800
    c2c4:	00c76733          	or	a4,a4,a2
    c2c8:	c4dff06f          	j	bf14 <__adddf3+0x200>
    c2cc:	ff8009b7          	lui	s3,0xff800
    c2d0:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c2d4:	40f90933          	sub	s2,s2,a5
    c2d8:	013779b3          	and	s3,a4,s3
    c2dc:	b71ff06f          	j	be4c <__adddf3+0x138>
    c2e0:	fe078693          	add	a3,a5,-32
    c2e4:	02000613          	li	a2,32
    c2e8:	00d8d6b3          	srl	a3,a7,a3
    c2ec:	00c78a63          	beq	a5,a2,c300 <__adddf3+0x5ec>
    c2f0:	04000613          	li	a2,64
    c2f4:	40f607b3          	sub	a5,a2,a5
    c2f8:	00f897b3          	sll	a5,a7,a5
    c2fc:	00ff6f33          	or	t5,t5,a5
    c300:	01e03633          	snez	a2,t5
    c304:	00d66633          	or	a2,a2,a3
    c308:	ac9ff06f          	j	bdd0 <__adddf3+0xbc>
    c30c:	ff8006b7          	lui	a3,0xff800
    c310:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c314:	40f907b3          	sub	a5,s2,a5
    c318:	00d77733          	and	a4,a4,a3
    c31c:	01d71813          	sll	a6,a4,0x1d
    c320:	01386833          	or	a6,a6,s3
    c324:	00375713          	srl	a4,a4,0x3
    c328:	ed9ff06f          	j	c200 <__adddf3+0x4ec>
    c32c:	00b766b3          	or	a3,a4,a1
    c330:	1e068663          	beqz	a3,c51c <__adddf3+0x808>
    c334:	fff78693          	add	a3,a5,-1
    c338:	0a068e63          	beqz	a3,c3f4 <__adddf3+0x6e0>
    c33c:	7ff00513          	li	a0,2047
    c340:	14a78063          	beq	a5,a0,c480 <__adddf3+0x76c>
    c344:	03800793          	li	a5,56
    c348:	00100993          	li	s3,1
    c34c:	e4d7c6e3          	blt	a5,a3,c198 <__adddf3+0x484>
    c350:	00068793          	mv	a5,a3
    c354:	e15ff06f          	j	c168 <__adddf3+0x454>
    c358:	00040e13          	mv	t3,s0
    c35c:	7ff00793          	li	a5,2047
    c360:	00000713          	li	a4,0
    c364:	00000813          	li	a6,0
    c368:	b45ff06f          	j	beac <__adddf3+0x198>
    c36c:	7ff00793          	li	a5,2047
    c370:	fef684e3          	beq	a3,a5,c358 <__adddf3+0x644>
    c374:	01e58f33          	add	t5,a1,t5
    c378:	00bf35b3          	sltu	a1,t5,a1
    c37c:	011707b3          	add	a5,a4,a7
    c380:	00b787b3          	add	a5,a5,a1
    c384:	01f79613          	sll	a2,a5,0x1f
    c388:	001f5f13          	srl	t5,t5,0x1
    c38c:	01e664b3          	or	s1,a2,t5
    c390:	0017d993          	srl	s3,a5,0x1
    c394:	00068913          	mv	s2,a3
    c398:	ab5ff06f          	j	be4c <__adddf3+0x138>
    c39c:	40bf0633          	sub	a2,t5,a1
    c3a0:	40e887b3          	sub	a5,a7,a4
    c3a4:	00cf3733          	sltu	a4,t5,a2
    c3a8:	00060493          	mv	s1,a2
    c3ac:	40e789b3          	sub	s3,a5,a4
    c3b0:	00068413          	mv	s0,a3
    c3b4:	a41ff06f          	j	bdf4 <__adddf3+0xe0>
    c3b8:	00361613          	sll	a2,a2,0x3
    c3bc:	00365613          	srl	a2,a2,0x3
    c3c0:	00068413          	mv	s0,a3
    c3c4:	00088713          	mv	a4,a7
    c3c8:	e25ff06f          	j	c1ec <__adddf3+0x4d8>
    c3cc:	de0312e3          	bnez	t1,c1b0 <__adddf3+0x49c>
    c3d0:	1c080663          	beqz	a6,c59c <__adddf3+0x888>
    c3d4:	0038d713          	srl	a4,a7,0x3
    c3d8:	00361613          	sll	a2,a2,0x3
    c3dc:	01d89893          	sll	a7,a7,0x1d
    c3e0:	01176733          	or	a4,a4,a7
    c3e4:	00365613          	srl	a2,a2,0x3
    c3e8:	00c76733          	or	a4,a4,a2
    c3ec:	00068413          	mv	s0,a3
    c3f0:	dddff06f          	j	c1cc <__adddf3+0x4b8>
    c3f4:	01e58f33          	add	t5,a1,t5
    c3f8:	011708b3          	add	a7,a4,a7
    c3fc:	00bf35b3          	sltu	a1,t5,a1
    c400:	00b889b3          	add	s3,a7,a1
    c404:	00899793          	sll	a5,s3,0x8
    c408:	000f0493          	mv	s1,t5
    c40c:	0e07d463          	bgez	a5,c4f4 <__adddf3+0x7e0>
    c410:	00200913          	li	s2,2
    c414:	bd1ff06f          	j	bfe4 <__adddf3+0x2d0>
    c418:	41e58f33          	sub	t5,a1,t5
    c41c:	411708b3          	sub	a7,a4,a7
    c420:	01e5b5b3          	sltu	a1,a1,t5
    c424:	000f0493          	mv	s1,t5
    c428:	40b889b3          	sub	s3,a7,a1
    c42c:	00100913          	li	s2,1
    c430:	9b1ff06f          	j	bde0 <__adddf3+0xcc>
    c434:	fe078693          	add	a3,a5,-32
    c438:	02000613          	li	a2,32
    c43c:	00d8d6b3          	srl	a3,a7,a3
    c440:	00c78a63          	beq	a5,a2,c454 <__adddf3+0x740>
    c444:	04000613          	li	a2,64
    c448:	40f607b3          	sub	a5,a2,a5
    c44c:	00f897b3          	sll	a5,a7,a5
    c450:	00ff6f33          	or	t5,t5,a5
    c454:	01e039b3          	snez	s3,t5
    c458:	00d9e9b3          	or	s3,s3,a3
    c45c:	b65ff06f          	j	bfc0 <__adddf3+0x2ac>
    c460:	00351613          	sll	a2,a0,0x3
    c464:	00365993          	srl	s3,a2,0x3
    c468:	eb5ff06f          	j	c31c <__adddf3+0x608>
    c46c:	00361613          	sll	a2,a2,0x3
    c470:	00365613          	srl	a2,a2,0x3
    c474:	00068413          	mv	s0,a3
    c478:	00088713          	mv	a4,a7
    c47c:	d41ff06f          	j	c1bc <__adddf3+0x4a8>
    c480:	00361613          	sll	a2,a2,0x3
    c484:	00365613          	srl	a2,a2,0x3
    c488:	00088713          	mv	a4,a7
    c48c:	d31ff06f          	j	c1bc <__adddf3+0x4a8>
    c490:	fe078513          	add	a0,a5,-32
    c494:	02000613          	li	a2,32
    c498:	00a75533          	srl	a0,a4,a0
    c49c:	00c78a63          	beq	a5,a2,c4b0 <__adddf3+0x79c>
    c4a0:	04000613          	li	a2,64
    c4a4:	40f607b3          	sub	a5,a2,a5
    c4a8:	00f717b3          	sll	a5,a4,a5
    c4ac:	00f5e5b3          	or	a1,a1,a5
    c4b0:	00b03633          	snez	a2,a1
    c4b4:	00a66633          	or	a2,a2,a0
    c4b8:	a8dff06f          	j	bf44 <__adddf3+0x230>
    c4bc:	fc0682e3          	beqz	a3,c480 <__adddf3+0x76c>
    c4c0:	01e8ef33          	or	t5,a7,t5
    c4c4:	d00f16e3          	bnez	t5,c1d0 <__adddf3+0x4bc>
    c4c8:	cedff06f          	j	c1b4 <__adddf3+0x4a0>
    c4cc:	dc0808e3          	beqz	a6,c29c <__adddf3+0x588>
    c4d0:	00361813          	sll	a6,a2,0x3
    c4d4:	01d89793          	sll	a5,a7,0x1d
    c4d8:	00385813          	srl	a6,a6,0x3
    c4dc:	0038d713          	srl	a4,a7,0x3
    c4e0:	00f86833          	or	a6,a6,a5
    c4e4:	01d77733          	and	a4,a4,t4
    c4e8:	00068e13          	mv	t3,a3
    c4ec:	00000793          	li	a5,0
    c4f0:	9bdff06f          	j	beac <__adddf3+0x198>
    c4f4:	00100793          	li	a5,1
    c4f8:	c2dff06f          	j	c124 <__adddf3+0x410>
    c4fc:	40bf05b3          	sub	a1,t5,a1
    c500:	40e888b3          	sub	a7,a7,a4
    c504:	00bf3733          	sltu	a4,t5,a1
    c508:	00058493          	mv	s1,a1
    c50c:	40e889b3          	sub	s3,a7,a4
    c510:	00068413          	mv	s0,a3
    c514:	00100913          	li	s2,1
    c518:	8c9ff06f          	j	bde0 <__adddf3+0xcc>
    c51c:	00361613          	sll	a2,a2,0x3
    c520:	00365613          	srl	a2,a2,0x3
    c524:	00088713          	mv	a4,a7
    c528:	cc5ff06f          	j	c1ec <__adddf3+0x4d8>
    c52c:	00361613          	sll	a2,a2,0x3
    c530:	00365993          	srl	s3,a2,0x3
    c534:	00088713          	mv	a4,a7
    c538:	de5ff06f          	j	c31c <__adddf3+0x608>
    c53c:	fe078693          	add	a3,a5,-32
    c540:	02000613          	li	a2,32
    c544:	00d756b3          	srl	a3,a4,a3
    c548:	00c78a63          	beq	a5,a2,c55c <__adddf3+0x848>
    c54c:	04000613          	li	a2,64
    c550:	40f607b3          	sub	a5,a2,a5
    c554:	00f717b3          	sll	a5,a4,a5
    c558:	00f5e5b3          	or	a1,a1,a5
    c55c:	00b039b3          	snez	s3,a1
    c560:	00d9e9b3          	or	s3,s3,a3
    c564:	c35ff06f          	j	c198 <__adddf3+0x484>
    c568:	0034d613          	srl	a2,s1,0x3
    c56c:	00090793          	mv	a5,s2
    c570:	00098713          	mv	a4,s3
    c574:	c79ff06f          	j	c1ec <__adddf3+0x4d8>
    c578:	02000693          	li	a3,32
    c57c:	40f686b3          	sub	a3,a3,a5
    c580:	00000613          	li	a2,0
    c584:	8b5ff06f          	j	be38 <__adddf3+0x124>
    c588:	00c9e833          	or	a6,s3,a2
    c58c:	d00808e3          	beqz	a6,c29c <__adddf3+0x588>
    c590:	0039d993          	srl	s3,s3,0x3
    c594:	00060713          	mv	a4,a2
    c598:	d85ff06f          	j	c31c <__adddf3+0x608>
    c59c:	00000e13          	li	t3,0
    c5a0:	7ff00793          	li	a5,2047
    c5a4:	00080737          	lui	a4,0x80
    c5a8:	905ff06f          	j	beac <__adddf3+0x198>
    c5ac:	01d71793          	sll	a5,a4,0x1d
    c5b0:	00375713          	srl	a4,a4,0x3
    c5b4:	0107e833          	or	a6,a5,a6
    c5b8:	01d77733          	and	a4,a4,t4
    c5bc:	00000793          	li	a5,0
    c5c0:	8edff06f          	j	beac <__adddf3+0x198>
    c5c4:	01d71813          	sll	a6,a4,0x1d
    c5c8:	0035d593          	srl	a1,a1,0x3
    c5cc:	00b86833          	or	a6,a6,a1
    c5d0:	00375713          	srl	a4,a4,0x3
    c5d4:	00068413          	mv	s0,a3
    c5d8:	c29ff06f          	j	c200 <__adddf3+0x4ec>

0000c5dc <__divdf3>:
    c5dc:	fb010113          	add	sp,sp,-80
    c5e0:	0145d793          	srl	a5,a1,0x14
    c5e4:	04812423          	sw	s0,72(sp)
    c5e8:	04912223          	sw	s1,68(sp)
    c5ec:	05212023          	sw	s2,64(sp)
    c5f0:	03412c23          	sw	s4,56(sp)
    c5f4:	03512a23          	sw	s5,52(sp)
    c5f8:	00c59493          	sll	s1,a1,0xc
    c5fc:	04112623          	sw	ra,76(sp)
    c600:	03312e23          	sw	s3,60(sp)
    c604:	03612823          	sw	s6,48(sp)
    c608:	03712623          	sw	s7,44(sp)
    c60c:	03812423          	sw	s8,40(sp)
    c610:	7ff7f793          	and	a5,a5,2047
    c614:	00050413          	mv	s0,a0
    c618:	00060a13          	mv	s4,a2
    c61c:	00068913          	mv	s2,a3
    c620:	00c4d493          	srl	s1,s1,0xc
    c624:	01f5da93          	srl	s5,a1,0x1f
    c628:	18078c63          	beqz	a5,c7c0 <__divdf3+0x1e4>
    c62c:	7ff00713          	li	a4,2047
    c630:	08e78a63          	beq	a5,a4,c6c4 <__divdf3+0xe8>
    c634:	01d55b13          	srl	s6,a0,0x1d
    c638:	00349493          	sll	s1,s1,0x3
    c63c:	009b64b3          	or	s1,s6,s1
    c640:	00800737          	lui	a4,0x800
    c644:	00e4eb33          	or	s6,s1,a4
    c648:	00351b93          	sll	s7,a0,0x3
    c64c:	c0178993          	add	s3,a5,-1023
    c650:	00000493          	li	s1,0
    c654:	00000c13          	li	s8,0
    c658:	01495793          	srl	a5,s2,0x14
    c65c:	00c91413          	sll	s0,s2,0xc
    c660:	7ff7f793          	and	a5,a5,2047
    c664:	00c45413          	srl	s0,s0,0xc
    c668:	01f95913          	srl	s2,s2,0x1f
    c66c:	08078463          	beqz	a5,c6f4 <__divdf3+0x118>
    c670:	7ff00713          	li	a4,2047
    c674:	18e78c63          	beq	a5,a4,c80c <__divdf3+0x230>
    c678:	00341413          	sll	s0,s0,0x3
    c67c:	01da5713          	srl	a4,s4,0x1d
    c680:	00876733          	or	a4,a4,s0
    c684:	c0178793          	add	a5,a5,-1023
    c688:	00800437          	lui	s0,0x800
    c68c:	40f989b3          	sub	s3,s3,a5
    c690:	00876433          	or	s0,a4,s0
    c694:	003a1813          	sll	a6,s4,0x3
    c698:	00000793          	li	a5,0
    c69c:	00f00713          	li	a4,15
    c6a0:	012aca33          	xor	s4,s5,s2
    c6a4:	24976663          	bltu	a4,s1,c8f0 <__divdf3+0x314>
    c6a8:	00003697          	auipc	a3,0x3
    c6ac:	ac868693          	add	a3,a3,-1336 # f170 <__mprec_tens+0xc8>
    c6b0:	00249493          	sll	s1,s1,0x2
    c6b4:	00d484b3          	add	s1,s1,a3
    c6b8:	0004a703          	lw	a4,0(s1)
    c6bc:	00d70733          	add	a4,a4,a3
    c6c0:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    c6c4:	00a4eb33          	or	s6,s1,a0
    c6c8:	1c0b1e63          	bnez	s6,c8a4 <__divdf3+0x2c8>
    c6cc:	01495793          	srl	a5,s2,0x14
    c6d0:	00c91413          	sll	s0,s2,0xc
    c6d4:	7ff7f793          	and	a5,a5,2047
    c6d8:	00000b93          	li	s7,0
    c6dc:	00800493          	li	s1,8
    c6e0:	7ff00993          	li	s3,2047
    c6e4:	00200c13          	li	s8,2
    c6e8:	00c45413          	srl	s0,s0,0xc
    c6ec:	01f95913          	srl	s2,s2,0x1f
    c6f0:	f80790e3          	bnez	a5,c670 <__divdf3+0x94>
    c6f4:	01446833          	or	a6,s0,s4
    c6f8:	1c080263          	beqz	a6,c8bc <__divdf3+0x2e0>
    c6fc:	5c040663          	beqz	s0,ccc8 <__divdf3+0x6ec>
    c700:	00040513          	mv	a0,s0
    c704:	1b8020ef          	jal	e8bc <__clzsi2>
    c708:	00050793          	mv	a5,a0
    c70c:	ff550693          	add	a3,a0,-11
    c710:	01d00713          	li	a4,29
    c714:	ff878813          	add	a6,a5,-8
    c718:	40d70733          	sub	a4,a4,a3
    c71c:	01041433          	sll	s0,s0,a6
    c720:	00ea5733          	srl	a4,s4,a4
    c724:	00876433          	or	s0,a4,s0
    c728:	010a1833          	sll	a6,s4,a6
    c72c:	013787b3          	add	a5,a5,s3
    c730:	3f378993          	add	s3,a5,1011
    c734:	00000793          	li	a5,0
    c738:	f65ff06f          	j	c69c <__divdf3+0xc0>
    c73c:	40f70733          	sub	a4,a4,a5
    c740:	03800693          	li	a3,56
    c744:	60e6d063          	bge	a3,a4,cd44 <__divdf3+0x768>
    c748:	00000793          	li	a5,0
    c74c:	00000693          	li	a3,0
    c750:	00000713          	li	a4,0
    c754:	04c12083          	lw	ra,76(sp)
    c758:	04812403          	lw	s0,72(sp)
    c75c:	01479793          	sll	a5,a5,0x14
    c760:	00d7e7b3          	or	a5,a5,a3
    c764:	01fa1693          	sll	a3,s4,0x1f
    c768:	00d7e7b3          	or	a5,a5,a3
    c76c:	04412483          	lw	s1,68(sp)
    c770:	04012903          	lw	s2,64(sp)
    c774:	03c12983          	lw	s3,60(sp)
    c778:	03812a03          	lw	s4,56(sp)
    c77c:	03412a83          	lw	s5,52(sp)
    c780:	03012b03          	lw	s6,48(sp)
    c784:	02c12b83          	lw	s7,44(sp)
    c788:	02812c03          	lw	s8,40(sp)
    c78c:	00070513          	mv	a0,a4
    c790:	00078593          	mv	a1,a5
    c794:	05010113          	add	sp,sp,80
    c798:	00008067          	ret
    c79c:	7ff00793          	li	a5,2047
    c7a0:	00000693          	li	a3,0
    c7a4:	00000713          	li	a4,0
    c7a8:	fadff06f          	j	c754 <__divdf3+0x178>
    c7ac:	00000a13          	li	s4,0
    c7b0:	7ff00793          	li	a5,2047
    c7b4:	000806b7          	lui	a3,0x80
    c7b8:	00000713          	li	a4,0
    c7bc:	f99ff06f          	j	c754 <__divdf3+0x178>
    c7c0:	00a4eb33          	or	s6,s1,a0
    c7c4:	100b0c63          	beqz	s6,c8dc <__divdf3+0x300>
    c7c8:	52048463          	beqz	s1,ccf0 <__divdf3+0x714>
    c7cc:	00048513          	mv	a0,s1
    c7d0:	0ec020ef          	jal	e8bc <__clzsi2>
    c7d4:	00050713          	mv	a4,a0
    c7d8:	ff550793          	add	a5,a0,-11
    c7dc:	01d00b13          	li	s6,29
    c7e0:	ff870b93          	add	s7,a4,-8
    c7e4:	40fb0b33          	sub	s6,s6,a5
    c7e8:	017494b3          	sll	s1,s1,s7
    c7ec:	01645b33          	srl	s6,s0,s6
    c7f0:	009b6b33          	or	s6,s6,s1
    c7f4:	01741bb3          	sll	s7,s0,s7
    c7f8:	c0d00793          	li	a5,-1011
    c7fc:	40e789b3          	sub	s3,a5,a4
    c800:	00000493          	li	s1,0
    c804:	00000c13          	li	s8,0
    c808:	e51ff06f          	j	c658 <__divdf3+0x7c>
    c80c:	01446833          	or	a6,s0,s4
    c810:	80198993          	add	s3,s3,-2047
    c814:	0a081c63          	bnez	a6,c8cc <__divdf3+0x2f0>
    c818:	0024e493          	or	s1,s1,2
    c81c:	00000413          	li	s0,0
    c820:	00200793          	li	a5,2
    c824:	e79ff06f          	j	c69c <__divdf3+0xc0>
    c828:	000a8913          	mv	s2,s5
    c82c:	000b0413          	mv	s0,s6
    c830:	000b8813          	mv	a6,s7
    c834:	00200793          	li	a5,2
    c838:	60fc0863          	beq	s8,a5,ce48 <__divdf3+0x86c>
    c83c:	00300793          	li	a5,3
    c840:	f6fc06e3          	beq	s8,a5,c7ac <__divdf3+0x1d0>
    c844:	00100793          	li	a5,1
    c848:	00090a13          	mv	s4,s2
    c84c:	eefc0ee3          	beq	s8,a5,c748 <__divdf3+0x16c>
    c850:	3ff98793          	add	a5,s3,1023
    c854:	3cf05263          	blez	a5,cc18 <__divdf3+0x63c>
    c858:	00787713          	and	a4,a6,7
    c85c:	5c071663          	bnez	a4,ce28 <__divdf3+0x84c>
    c860:	00741713          	sll	a4,s0,0x7
    c864:	00075a63          	bgez	a4,c878 <__divdf3+0x29c>
    c868:	ff0007b7          	lui	a5,0xff000
    c86c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    c870:	00f47433          	and	s0,s0,a5
    c874:	40098793          	add	a5,s3,1024
    c878:	7fe00713          	li	a4,2046
    c87c:	f2f740e3          	blt	a4,a5,c79c <__divdf3+0x1c0>
    c880:	00385813          	srl	a6,a6,0x3
    c884:	01d41713          	sll	a4,s0,0x1d
    c888:	00941693          	sll	a3,s0,0x9
    c88c:	01076733          	or	a4,a4,a6
    c890:	00c6d693          	srl	a3,a3,0xc
    c894:	7ff7f793          	and	a5,a5,2047
    c898:	ebdff06f          	j	c754 <__divdf3+0x178>
    c89c:	00078c13          	mv	s8,a5
    c8a0:	f95ff06f          	j	c834 <__divdf3+0x258>
    c8a4:	00048b13          	mv	s6,s1
    c8a8:	00050b93          	mv	s7,a0
    c8ac:	00c00493          	li	s1,12
    c8b0:	7ff00993          	li	s3,2047
    c8b4:	00300c13          	li	s8,3
    c8b8:	da1ff06f          	j	c658 <__divdf3+0x7c>
    c8bc:	0014e493          	or	s1,s1,1
    c8c0:	00000413          	li	s0,0
    c8c4:	00100793          	li	a5,1
    c8c8:	dd5ff06f          	j	c69c <__divdf3+0xc0>
    c8cc:	0034e493          	or	s1,s1,3
    c8d0:	000a0813          	mv	a6,s4
    c8d4:	00300793          	li	a5,3
    c8d8:	dc5ff06f          	j	c69c <__divdf3+0xc0>
    c8dc:	00000b93          	li	s7,0
    c8e0:	00400493          	li	s1,4
    c8e4:	00000993          	li	s3,0
    c8e8:	00100c13          	li	s8,1
    c8ec:	d6dff06f          	j	c658 <__divdf3+0x7c>
    c8f0:	03912223          	sw	s9,36(sp)
    c8f4:	03a12023          	sw	s10,32(sp)
    c8f8:	01b12e23          	sw	s11,28(sp)
    c8fc:	3b646a63          	bltu	s0,s6,ccb0 <__divdf3+0x6d4>
    c900:	3a8b0663          	beq	s6,s0,ccac <__divdf3+0x6d0>
    c904:	fff98993          	add	s3,s3,-1
    c908:	000b8c13          	mv	s8,s7
    c90c:	000b0493          	mv	s1,s6
    c910:	00000d13          	li	s10,0
    c914:	01885c93          	srl	s9,a6,0x18
    c918:	00841413          	sll	s0,s0,0x8
    c91c:	01045913          	srl	s2,s0,0x10
    c920:	008cecb3          	or	s9,s9,s0
    c924:	00090593          	mv	a1,s2
    c928:	00048513          	mv	a0,s1
    c92c:	010c9b13          	sll	s6,s9,0x10
    c930:	00881a93          	sll	s5,a6,0x8
    c934:	010b5b13          	srl	s6,s6,0x10
    c938:	6d9010ef          	jal	e810 <__hidden___udivsi3>
    c93c:	00050593          	mv	a1,a0
    c940:	00050413          	mv	s0,a0
    c944:	000b0513          	mv	a0,s6
    c948:	69d010ef          	jal	e7e4 <__mulsi3>
    c94c:	00050793          	mv	a5,a0
    c950:	00090593          	mv	a1,s2
    c954:	00048513          	mv	a0,s1
    c958:	00078493          	mv	s1,a5
    c95c:	6fd010ef          	jal	e858 <__umodsi3>
    c960:	01051513          	sll	a0,a0,0x10
    c964:	010c5793          	srl	a5,s8,0x10
    c968:	00a7e7b3          	or	a5,a5,a0
    c96c:	0097fa63          	bgeu	a5,s1,c980 <__divdf3+0x3a4>
    c970:	00fc87b3          	add	a5,s9,a5
    c974:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c978:	3b97fe63          	bgeu	a5,s9,cd34 <__divdf3+0x758>
    c97c:	00070413          	mv	s0,a4
    c980:	409784b3          	sub	s1,a5,s1
    c984:	00090593          	mv	a1,s2
    c988:	00048513          	mv	a0,s1
    c98c:	685010ef          	jal	e810 <__hidden___udivsi3>
    c990:	00050593          	mv	a1,a0
    c994:	00050b93          	mv	s7,a0
    c998:	000b0513          	mv	a0,s6
    c99c:	649010ef          	jal	e7e4 <__mulsi3>
    c9a0:	00050793          	mv	a5,a0
    c9a4:	00090593          	mv	a1,s2
    c9a8:	00048513          	mv	a0,s1
    c9ac:	00078493          	mv	s1,a5
    c9b0:	6a9010ef          	jal	e858 <__umodsi3>
    c9b4:	010c1793          	sll	a5,s8,0x10
    c9b8:	01051513          	sll	a0,a0,0x10
    c9bc:	0107d793          	srl	a5,a5,0x10
    c9c0:	00a7e7b3          	or	a5,a5,a0
    c9c4:	0097fa63          	bgeu	a5,s1,c9d8 <__divdf3+0x3fc>
    c9c8:	00fc87b3          	add	a5,s9,a5
    c9cc:	fffb8713          	add	a4,s7,-1
    c9d0:	3597fa63          	bgeu	a5,s9,cd24 <__divdf3+0x748>
    c9d4:	00070b93          	mv	s7,a4
    c9d8:	00010337          	lui	t1,0x10
    c9dc:	01041413          	sll	s0,s0,0x10
    c9e0:	01746433          	or	s0,s0,s7
    c9e4:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    c9e8:	01b478b3          	and	a7,s0,s11
    c9ec:	01bafdb3          	and	s11,s5,s11
    c9f0:	40978bb3          	sub	s7,a5,s1
    c9f4:	010adc13          	srl	s8,s5,0x10
    c9f8:	01045793          	srl	a5,s0,0x10
    c9fc:	00088513          	mv	a0,a7
    ca00:	000d8593          	mv	a1,s11
    ca04:	5e1010ef          	jal	e7e4 <__mulsi3>
    ca08:	00050813          	mv	a6,a0
    ca0c:	000c0593          	mv	a1,s8
    ca10:	00088513          	mv	a0,a7
    ca14:	5d1010ef          	jal	e7e4 <__mulsi3>
    ca18:	00050893          	mv	a7,a0
    ca1c:	000d8593          	mv	a1,s11
    ca20:	00078513          	mv	a0,a5
    ca24:	5c1010ef          	jal	e7e4 <__mulsi3>
    ca28:	00050e13          	mv	t3,a0
    ca2c:	000c0593          	mv	a1,s8
    ca30:	00078513          	mv	a0,a5
    ca34:	5b1010ef          	jal	e7e4 <__mulsi3>
    ca38:	01085793          	srl	a5,a6,0x10
    ca3c:	01c888b3          	add	a7,a7,t3
    ca40:	011787b3          	add	a5,a5,a7
    ca44:	01c7f463          	bgeu	a5,t3,ca4c <__divdf3+0x470>
    ca48:	00650533          	add	a0,a0,t1
    ca4c:	00010637          	lui	a2,0x10
    ca50:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    ca54:	00c7f4b3          	and	s1,a5,a2
    ca58:	0107d693          	srl	a3,a5,0x10
    ca5c:	01049493          	sll	s1,s1,0x10
    ca60:	00c87833          	and	a6,a6,a2
    ca64:	00a687b3          	add	a5,a3,a0
    ca68:	010484b3          	add	s1,s1,a6
    ca6c:	20fbea63          	bltu	s7,a5,cc80 <__divdf3+0x6a4>
    ca70:	20fb8663          	beq	s7,a5,cc7c <__divdf3+0x6a0>
    ca74:	409d04b3          	sub	s1,s10,s1
    ca78:	40fb8bb3          	sub	s7,s7,a5
    ca7c:	009d3d33          	sltu	s10,s10,s1
    ca80:	41ab8bb3          	sub	s7,s7,s10
    ca84:	377c8a63          	beq	s9,s7,cdf8 <__divdf3+0x81c>
    ca88:	00090593          	mv	a1,s2
    ca8c:	000b8513          	mv	a0,s7
    ca90:	581010ef          	jal	e810 <__hidden___udivsi3>
    ca94:	00050593          	mv	a1,a0
    ca98:	00a12623          	sw	a0,12(sp)
    ca9c:	00050d13          	mv	s10,a0
    caa0:	000b0513          	mv	a0,s6
    caa4:	541010ef          	jal	e7e4 <__mulsi3>
    caa8:	00050793          	mv	a5,a0
    caac:	00090593          	mv	a1,s2
    cab0:	000b8513          	mv	a0,s7
    cab4:	00078b93          	mv	s7,a5
    cab8:	5a1010ef          	jal	e858 <__umodsi3>
    cabc:	01051513          	sll	a0,a0,0x10
    cac0:	0104d793          	srl	a5,s1,0x10
    cac4:	00a7e7b3          	or	a5,a5,a0
    cac8:	0377f063          	bgeu	a5,s7,cae8 <__divdf3+0x50c>
    cacc:	00fc87b3          	add	a5,s9,a5
    cad0:	fffd0693          	add	a3,s10,-1
    cad4:	3797e263          	bltu	a5,s9,ce38 <__divdf3+0x85c>
    cad8:	3777f063          	bgeu	a5,s7,ce38 <__divdf3+0x85c>
    cadc:	ffed0713          	add	a4,s10,-2
    cae0:	00e12623          	sw	a4,12(sp)
    cae4:	019787b3          	add	a5,a5,s9
    cae8:	41778bb3          	sub	s7,a5,s7
    caec:	00090593          	mv	a1,s2
    caf0:	000b8513          	mv	a0,s7
    caf4:	51d010ef          	jal	e810 <__hidden___udivsi3>
    caf8:	00050593          	mv	a1,a0
    cafc:	00050d13          	mv	s10,a0
    cb00:	000b0513          	mv	a0,s6
    cb04:	4e1010ef          	jal	e7e4 <__mulsi3>
    cb08:	00050793          	mv	a5,a0
    cb0c:	00090593          	mv	a1,s2
    cb10:	000b8513          	mv	a0,s7
    cb14:	00078913          	mv	s2,a5
    cb18:	01049493          	sll	s1,s1,0x10
    cb1c:	53d010ef          	jal	e858 <__umodsi3>
    cb20:	01051513          	sll	a0,a0,0x10
    cb24:	0104d493          	srl	s1,s1,0x10
    cb28:	00a4e4b3          	or	s1,s1,a0
    cb2c:	0124fe63          	bgeu	s1,s2,cb48 <__divdf3+0x56c>
    cb30:	009c84b3          	add	s1,s9,s1
    cb34:	fffd0793          	add	a5,s10,-1
    cb38:	3194e463          	bltu	s1,s9,ce40 <__divdf3+0x864>
    cb3c:	3124f263          	bgeu	s1,s2,ce40 <__divdf3+0x864>
    cb40:	ffed0d13          	add	s10,s10,-2
    cb44:	019484b3          	add	s1,s1,s9
    cb48:	00c12783          	lw	a5,12(sp)
    cb4c:	412484b3          	sub	s1,s1,s2
    cb50:	000d8593          	mv	a1,s11
    cb54:	01079813          	sll	a6,a5,0x10
    cb58:	01a86833          	or	a6,a6,s10
    cb5c:	01081313          	sll	t1,a6,0x10
    cb60:	01035313          	srl	t1,t1,0x10
    cb64:	01085793          	srl	a5,a6,0x10
    cb68:	00030513          	mv	a0,t1
    cb6c:	479010ef          	jal	e7e4 <__mulsi3>
    cb70:	00050893          	mv	a7,a0
    cb74:	000c0593          	mv	a1,s8
    cb78:	00030513          	mv	a0,t1
    cb7c:	469010ef          	jal	e7e4 <__mulsi3>
    cb80:	00050313          	mv	t1,a0
    cb84:	000d8593          	mv	a1,s11
    cb88:	00078513          	mv	a0,a5
    cb8c:	459010ef          	jal	e7e4 <__mulsi3>
    cb90:	00050e13          	mv	t3,a0
    cb94:	000c0593          	mv	a1,s8
    cb98:	00078513          	mv	a0,a5
    cb9c:	449010ef          	jal	e7e4 <__mulsi3>
    cba0:	0108d793          	srl	a5,a7,0x10
    cba4:	01c30333          	add	t1,t1,t3
    cba8:	006787b3          	add	a5,a5,t1
    cbac:	01c7f663          	bgeu	a5,t3,cbb8 <__divdf3+0x5dc>
    cbb0:	00010737          	lui	a4,0x10
    cbb4:	00e50533          	add	a0,a0,a4
    cbb8:	000106b7          	lui	a3,0x10
    cbbc:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    cbc0:	0107d713          	srl	a4,a5,0x10
    cbc4:	00d7f7b3          	and	a5,a5,a3
    cbc8:	01079793          	sll	a5,a5,0x10
    cbcc:	00d8f8b3          	and	a7,a7,a3
    cbd0:	00a70733          	add	a4,a4,a0
    cbd4:	011787b3          	add	a5,a5,a7
    cbd8:	02e4e063          	bltu	s1,a4,cbf8 <__divdf3+0x61c>
    cbdc:	00e48c63          	beq	s1,a4,cbf4 <__divdf3+0x618>
    cbe0:	02412c83          	lw	s9,36(sp)
    cbe4:	02012d03          	lw	s10,32(sp)
    cbe8:	01c12d83          	lw	s11,28(sp)
    cbec:	00186813          	or	a6,a6,1
    cbf0:	c61ff06f          	j	c850 <__divdf3+0x274>
    cbf4:	1c078a63          	beqz	a5,cdc8 <__divdf3+0x7ec>
    cbf8:	009c84b3          	add	s1,s9,s1
    cbfc:	fff80613          	add	a2,a6,-1
    cc00:	00048693          	mv	a3,s1
    cc04:	1b94ec63          	bltu	s1,s9,cdbc <__divdf3+0x7e0>
    cc08:	24e4ea63          	bltu	s1,a4,ce5c <__divdf3+0x880>
    cc0c:	26e48863          	beq	s1,a4,ce7c <__divdf3+0x8a0>
    cc10:	00060813          	mv	a6,a2
    cc14:	fcdff06f          	j	cbe0 <__divdf3+0x604>
    cc18:	00100713          	li	a4,1
    cc1c:	b20790e3          	bnez	a5,c73c <__divdf3+0x160>
    cc20:	41e98793          	add	a5,s3,1054
    cc24:	00f816b3          	sll	a3,a6,a5
    cc28:	00d036b3          	snez	a3,a3
    cc2c:	00f417b3          	sll	a5,s0,a5
    cc30:	00f6e7b3          	or	a5,a3,a5
    cc34:	00e85833          	srl	a6,a6,a4
    cc38:	00f86833          	or	a6,a6,a5
    cc3c:	00787793          	and	a5,a6,7
    cc40:	00e45433          	srl	s0,s0,a4
    cc44:	02078063          	beqz	a5,cc64 <__divdf3+0x688>
    cc48:	00f87793          	and	a5,a6,15
    cc4c:	00400713          	li	a4,4
    cc50:	00e78a63          	beq	a5,a4,cc64 <__divdf3+0x688>
    cc54:	00480793          	add	a5,a6,4
    cc58:	0107b833          	sltu	a6,a5,a6
    cc5c:	01040433          	add	s0,s0,a6
    cc60:	00078813          	mv	a6,a5
    cc64:	00841613          	sll	a2,s0,0x8
    cc68:	00100793          	li	a5,1
    cc6c:	00000693          	li	a3,0
    cc70:	00000713          	li	a4,0
    cc74:	ae0640e3          	bltz	a2,c754 <__divdf3+0x178>
    cc78:	1280006f          	j	cda0 <__divdf3+0x7c4>
    cc7c:	de9d7ce3          	bgeu	s10,s1,ca74 <__divdf3+0x498>
    cc80:	015d06b3          	add	a3,s10,s5
    cc84:	01a6b633          	sltu	a2,a3,s10
    cc88:	019605b3          	add	a1,a2,s9
    cc8c:	00bb8bb3          	add	s7,s7,a1
    cc90:	00068d13          	mv	s10,a3
    cc94:	fff40593          	add	a1,s0,-1
    cc98:	077cfe63          	bgeu	s9,s7,cd14 <__divdf3+0x738>
    cc9c:	14fbe063          	bltu	s7,a5,cddc <__divdf3+0x800>
    cca0:	13778c63          	beq	a5,s7,cdd8 <__divdf3+0x7fc>
    cca4:	00058413          	mv	s0,a1
    cca8:	dcdff06f          	j	ca74 <__divdf3+0x498>
    ccac:	c50bece3          	bltu	s7,a6,c904 <__divdf3+0x328>
    ccb0:	01fb1c13          	sll	s8,s6,0x1f
    ccb4:	001bd713          	srl	a4,s7,0x1
    ccb8:	001b5493          	srl	s1,s6,0x1
    ccbc:	00ec6c33          	or	s8,s8,a4
    ccc0:	01fb9d13          	sll	s10,s7,0x1f
    ccc4:	c51ff06f          	j	c914 <__divdf3+0x338>
    ccc8:	000a0513          	mv	a0,s4
    cccc:	3f1010ef          	jal	e8bc <__clzsi2>
    ccd0:	01550693          	add	a3,a0,21
    ccd4:	01c00713          	li	a4,28
    ccd8:	02050793          	add	a5,a0,32
    ccdc:	a2d75ae3          	bge	a4,a3,c710 <__divdf3+0x134>
    cce0:	ff850513          	add	a0,a0,-8
    cce4:	00000813          	li	a6,0
    cce8:	00aa1433          	sll	s0,s4,a0
    ccec:	a41ff06f          	j	c72c <__divdf3+0x150>
    ccf0:	3cd010ef          	jal	e8bc <__clzsi2>
    ccf4:	01550793          	add	a5,a0,21
    ccf8:	01c00693          	li	a3,28
    ccfc:	02050713          	add	a4,a0,32
    cd00:	acf6dee3          	bge	a3,a5,c7dc <__divdf3+0x200>
    cd04:	ff850493          	add	s1,a0,-8
    cd08:	00941b33          	sll	s6,s0,s1
    cd0c:	00000b93          	li	s7,0
    cd10:	ae9ff06f          	j	c7f8 <__divdf3+0x21c>
    cd14:	f97c98e3          	bne	s9,s7,cca4 <__divdf3+0x6c8>
    cd18:	f80602e3          	beqz	a2,cc9c <__divdf3+0x6c0>
    cd1c:	00058413          	mv	s0,a1
    cd20:	d55ff06f          	j	ca74 <__divdf3+0x498>
    cd24:	ca97f8e3          	bgeu	a5,s1,c9d4 <__divdf3+0x3f8>
    cd28:	ffeb8b93          	add	s7,s7,-2
    cd2c:	019787b3          	add	a5,a5,s9
    cd30:	ca9ff06f          	j	c9d8 <__divdf3+0x3fc>
    cd34:	c497f4e3          	bgeu	a5,s1,c97c <__divdf3+0x3a0>
    cd38:	ffe40413          	add	s0,s0,-2
    cd3c:	019787b3          	add	a5,a5,s9
    cd40:	c41ff06f          	j	c980 <__divdf3+0x3a4>
    cd44:	01f00693          	li	a3,31
    cd48:	ece6dce3          	bge	a3,a4,cc20 <__divdf3+0x644>
    cd4c:	fe100693          	li	a3,-31
    cd50:	40f686b3          	sub	a3,a3,a5
    cd54:	02000793          	li	a5,32
    cd58:	00d456b3          	srl	a3,s0,a3
    cd5c:	00f70863          	beq	a4,a5,cd6c <__divdf3+0x790>
    cd60:	43e98793          	add	a5,s3,1086
    cd64:	00f417b3          	sll	a5,s0,a5
    cd68:	00f86833          	or	a6,a6,a5
    cd6c:	01003833          	snez	a6,a6
    cd70:	00d86833          	or	a6,a6,a3
    cd74:	00787713          	and	a4,a6,7
    cd78:	00000693          	li	a3,0
    cd7c:	02070863          	beqz	a4,cdac <__divdf3+0x7d0>
    cd80:	00f87793          	and	a5,a6,15
    cd84:	00400713          	li	a4,4
    cd88:	00000413          	li	s0,0
    cd8c:	00e78a63          	beq	a5,a4,cda0 <__divdf3+0x7c4>
    cd90:	00480793          	add	a5,a6,4
    cd94:	0107b833          	sltu	a6,a5,a6
    cd98:	01003433          	snez	s0,a6
    cd9c:	00078813          	mv	a6,a5
    cda0:	00941693          	sll	a3,s0,0x9
    cda4:	01d41713          	sll	a4,s0,0x1d
    cda8:	00c6d693          	srl	a3,a3,0xc
    cdac:	00385813          	srl	a6,a6,0x3
    cdb0:	00e86733          	or	a4,a6,a4
    cdb4:	00000793          	li	a5,0
    cdb8:	99dff06f          	j	c754 <__divdf3+0x178>
    cdbc:	00060813          	mv	a6,a2
    cdc0:	e2e690e3          	bne	a3,a4,cbe0 <__divdf3+0x604>
    cdc4:	e1579ee3          	bne	a5,s5,cbe0 <__divdf3+0x604>
    cdc8:	02412c83          	lw	s9,36(sp)
    cdcc:	02012d03          	lw	s10,32(sp)
    cdd0:	01c12d83          	lw	s11,28(sp)
    cdd4:	a7dff06f          	j	c850 <__divdf3+0x274>
    cdd8:	ec96f6e3          	bgeu	a3,s1,cca4 <__divdf3+0x6c8>
    cddc:	00da86b3          	add	a3,s5,a3
    cde0:	0156b633          	sltu	a2,a3,s5
    cde4:	01960633          	add	a2,a2,s9
    cde8:	ffe40413          	add	s0,s0,-2
    cdec:	00068d13          	mv	s10,a3
    cdf0:	00cb8bb3          	add	s7,s7,a2
    cdf4:	c81ff06f          	j	ca74 <__divdf3+0x498>
    cdf8:	c0200713          	li	a4,-1022
    cdfc:	02412c83          	lw	s9,36(sp)
    ce00:	02012d03          	lw	s10,32(sp)
    ce04:	01c12d83          	lw	s11,28(sp)
    ce08:	3ff98793          	add	a5,s3,1023
    ce0c:	fff00813          	li	a6,-1
    ce10:	e0e9c4e3          	blt	s3,a4,cc18 <__divdf3+0x63c>
    ce14:	00480713          	add	a4,a6,4
    ce18:	01073833          	sltu	a6,a4,a6
    ce1c:	01040433          	add	s0,s0,a6
    ce20:	00070813          	mv	a6,a4
    ce24:	a3dff06f          	j	c860 <__divdf3+0x284>
    ce28:	00f87713          	and	a4,a6,15
    ce2c:	00400693          	li	a3,4
    ce30:	a2d708e3          	beq	a4,a3,c860 <__divdf3+0x284>
    ce34:	fe1ff06f          	j	ce14 <__divdf3+0x838>
    ce38:	00d12623          	sw	a3,12(sp)
    ce3c:	cadff06f          	j	cae8 <__divdf3+0x50c>
    ce40:	00078d13          	mv	s10,a5
    ce44:	d05ff06f          	j	cb48 <__divdf3+0x56c>
    ce48:	00090a13          	mv	s4,s2
    ce4c:	7ff00793          	li	a5,2047
    ce50:	00000693          	li	a3,0
    ce54:	00000713          	li	a4,0
    ce58:	8fdff06f          	j	c754 <__divdf3+0x178>
    ce5c:	001a9613          	sll	a2,s5,0x1
    ce60:	015636b3          	sltu	a3,a2,s5
    ce64:	019686b3          	add	a3,a3,s9
    ce68:	00d486b3          	add	a3,s1,a3
    ce6c:	ffe80813          	add	a6,a6,-2
    ce70:	00060a93          	mv	s5,a2
    ce74:	f4e688e3          	beq	a3,a4,cdc4 <__divdf3+0x7e8>
    ce78:	d69ff06f          	j	cbe0 <__divdf3+0x604>
    ce7c:	fefae0e3          	bltu	s5,a5,ce5c <__divdf3+0x880>
    ce80:	00060813          	mv	a6,a2
    ce84:	f41ff06f          	j	cdc4 <__divdf3+0x7e8>

0000ce88 <__eqdf2>:
    ce88:	0145d713          	srl	a4,a1,0x14
    ce8c:	001007b7          	lui	a5,0x100
    ce90:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    ce94:	0146d813          	srl	a6,a3,0x14
    ce98:	7ff77713          	and	a4,a4,2047
    ce9c:	7ff00313          	li	t1,2047
    cea0:	00b7fe33          	and	t3,a5,a1
    cea4:	00050893          	mv	a7,a0
    cea8:	00d7f7b3          	and	a5,a5,a3
    ceac:	01f5d593          	srl	a1,a1,0x1f
    ceb0:	7ff87813          	and	a6,a6,2047
    ceb4:	01f6d693          	srl	a3,a3,0x1f
    ceb8:	00100513          	li	a0,1
    cebc:	00670c63          	beq	a4,t1,ced4 <__eqdf2+0x4c>
    cec0:	00680863          	beq	a6,t1,ced0 <__eqdf2+0x48>
    cec4:	01071463          	bne	a4,a6,cecc <__eqdf2+0x44>
    cec8:	02fe0663          	beq	t3,a5,cef4 <__eqdf2+0x6c>
    cecc:	00008067          	ret
    ced0:	00008067          	ret
    ced4:	fee81ce3          	bne	a6,a4,cecc <__eqdf2+0x44>
    ced8:	00fe67b3          	or	a5,t3,a5
    cedc:	00c7e7b3          	or	a5,a5,a2
    cee0:	0117e7b3          	or	a5,a5,a7
    cee4:	fe0794e3          	bnez	a5,cecc <__eqdf2+0x44>
    cee8:	40d585b3          	sub	a1,a1,a3
    ceec:	00b03533          	snez	a0,a1
    cef0:	00008067          	ret
    cef4:	fcc89ce3          	bne	a7,a2,cecc <__eqdf2+0x44>
    cef8:	00d58a63          	beq	a1,a3,cf0c <__eqdf2+0x84>
    cefc:	fc0718e3          	bnez	a4,cecc <__eqdf2+0x44>
    cf00:	011e6e33          	or	t3,t3,a7
    cf04:	01c03533          	snez	a0,t3
    cf08:	00008067          	ret
    cf0c:	00000513          	li	a0,0
    cf10:	00008067          	ret

0000cf14 <__gedf2>:
    cf14:	0145d893          	srl	a7,a1,0x14
    cf18:	001007b7          	lui	a5,0x100
    cf1c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    cf20:	0146d713          	srl	a4,a3,0x14
    cf24:	7ff8f893          	and	a7,a7,2047
    cf28:	7ff00e13          	li	t3,2047
    cf2c:	00b7f333          	and	t1,a5,a1
    cf30:	00050813          	mv	a6,a0
    cf34:	00050e93          	mv	t4,a0
    cf38:	00d7f7b3          	and	a5,a5,a3
    cf3c:	01f5d593          	srl	a1,a1,0x1f
    cf40:	00060f13          	mv	t5,a2
    cf44:	7ff77513          	and	a0,a4,2047
    cf48:	01f6d693          	srl	a3,a3,0x1f
    cf4c:	05c88863          	beq	a7,t3,cf9c <__gedf2+0x88>
    cf50:	03c50463          	beq	a0,t3,cf78 <__gedf2+0x64>
    cf54:	06089a63          	bnez	a7,cfc8 <__gedf2+0xb4>
    cf58:	01036833          	or	a6,t1,a6
    cf5c:	06051063          	bnez	a0,cfbc <__gedf2+0xa8>
    cf60:	00c7e633          	or	a2,a5,a2
    cf64:	08060c63          	beqz	a2,cffc <__gedf2+0xe8>
    cf68:	0a081263          	bnez	a6,d00c <__gedf2+0xf8>
    cf6c:	00100513          	li	a0,1
    cf70:	08068263          	beqz	a3,cff4 <__gedf2+0xe0>
    cf74:	00008067          	ret
    cf78:	00c7e633          	or	a2,a5,a2
    cf7c:	08061463          	bnez	a2,d004 <__gedf2+0xf0>
    cf80:	00089663          	bnez	a7,cf8c <__gedf2+0x78>
    cf84:	01036333          	or	t1,t1,a6
    cf88:	fe0302e3          	beqz	t1,cf6c <__gedf2+0x58>
    cf8c:	06d58063          	beq	a1,a3,cfec <__gedf2+0xd8>
    cf90:	06059263          	bnez	a1,cff4 <__gedf2+0xe0>
    cf94:	00100513          	li	a0,1
    cf98:	00008067          	ret
    cf9c:	01036333          	or	t1,t1,a6
    cfa0:	06031263          	bnez	t1,d004 <__gedf2+0xf0>
    cfa4:	ff1516e3          	bne	a0,a7,cf90 <__gedf2+0x7c>
    cfa8:	00c7e7b3          	or	a5,a5,a2
    cfac:	04079c63          	bnez	a5,d004 <__gedf2+0xf0>
    cfb0:	fed590e3          	bne	a1,a3,cf90 <__gedf2+0x7c>
    cfb4:	00000513          	li	a0,0
    cfb8:	00008067          	ret
    cfbc:	fa0808e3          	beqz	a6,cf6c <__gedf2+0x58>
    cfc0:	fcd598e3          	bne	a1,a3,cf90 <__gedf2+0x7c>
    cfc4:	0280006f          	j	cfec <__gedf2+0xd8>
    cfc8:	fc0504e3          	beqz	a0,cf90 <__gedf2+0x7c>
    cfcc:	fcd592e3          	bne	a1,a3,cf90 <__gedf2+0x7c>
    cfd0:	fd1540e3          	blt	a0,a7,cf90 <__gedf2+0x7c>
    cfd4:	00a8cc63          	blt	a7,a0,cfec <__gedf2+0xd8>
    cfd8:	fa67ece3          	bltu	a5,t1,cf90 <__gedf2+0x7c>
    cfdc:	00f31863          	bne	t1,a5,cfec <__gedf2+0xd8>
    cfe0:	fbdf68e3          	bltu	t5,t4,cf90 <__gedf2+0x7c>
    cfe4:	00000513          	li	a0,0
    cfe8:	f9eef6e3          	bgeu	t4,t5,cf74 <__gedf2+0x60>
    cfec:	00100513          	li	a0,1
    cff0:	f80592e3          	bnez	a1,cf74 <__gedf2+0x60>
    cff4:	fff00513          	li	a0,-1
    cff8:	00008067          	ret
    cffc:	f8081ae3          	bnez	a6,cf90 <__gedf2+0x7c>
    d000:	00008067          	ret
    d004:	ffe00513          	li	a0,-2
    d008:	00008067          	ret
    d00c:	fcd586e3          	beq	a1,a3,cfd8 <__gedf2+0xc4>
    d010:	f81ff06f          	j	cf90 <__gedf2+0x7c>

0000d014 <__ledf2>:
    d014:	0145d893          	srl	a7,a1,0x14
    d018:	001007b7          	lui	a5,0x100
    d01c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d020:	0146d713          	srl	a4,a3,0x14
    d024:	7ff8f893          	and	a7,a7,2047
    d028:	7ff00313          	li	t1,2047
    d02c:	00b7fe33          	and	t3,a5,a1
    d030:	00050813          	mv	a6,a0
    d034:	00050e93          	mv	t4,a0
    d038:	00d7f7b3          	and	a5,a5,a3
    d03c:	01f5d593          	srl	a1,a1,0x1f
    d040:	00060f13          	mv	t5,a2
    d044:	7ff77513          	and	a0,a4,2047
    d048:	01f6d693          	srl	a3,a3,0x1f
    d04c:	04688a63          	beq	a7,t1,d0a0 <__ledf2+0x8c>
    d050:	02650463          	beq	a0,t1,d078 <__ledf2+0x64>
    d054:	06089863          	bnez	a7,d0c4 <__ledf2+0xb0>
    d058:	010e6833          	or	a6,t3,a6
    d05c:	08051e63          	bnez	a0,d0f8 <__ledf2+0xe4>
    d060:	00c7e633          	or	a2,a5,a2
    d064:	0a060463          	beqz	a2,d10c <__ledf2+0xf8>
    d068:	0a081663          	bnez	a6,d114 <__ledf2+0x100>
    d06c:	00100513          	li	a0,1
    d070:	08068063          	beqz	a3,d0f0 <__ledf2+0xdc>
    d074:	00008067          	ret
    d078:	00c7e633          	or	a2,a5,a2
    d07c:	00200513          	li	a0,2
    d080:	fe061ae3          	bnez	a2,d074 <__ledf2+0x60>
    d084:	00089663          	bnez	a7,d090 <__ledf2+0x7c>
    d088:	010e6e33          	or	t3,t3,a6
    d08c:	fe0e00e3          	beqz	t3,d06c <__ledf2+0x58>
    d090:	04d58c63          	beq	a1,a3,d0e8 <__ledf2+0xd4>
    d094:	04059e63          	bnez	a1,d0f0 <__ledf2+0xdc>
    d098:	00100513          	li	a0,1
    d09c:	00008067          	ret
    d0a0:	010e6e33          	or	t3,t3,a6
    d0a4:	060e1063          	bnez	t3,d104 <__ledf2+0xf0>
    d0a8:	ff1516e3          	bne	a0,a7,d094 <__ledf2+0x80>
    d0ac:	00c7e7b3          	or	a5,a5,a2
    d0b0:	00200513          	li	a0,2
    d0b4:	fc0790e3          	bnez	a5,d074 <__ledf2+0x60>
    d0b8:	fcd59ee3          	bne	a1,a3,d094 <__ledf2+0x80>
    d0bc:	00000513          	li	a0,0
    d0c0:	00008067          	ret
    d0c4:	fc0508e3          	beqz	a0,d094 <__ledf2+0x80>
    d0c8:	fcd596e3          	bne	a1,a3,d094 <__ledf2+0x80>
    d0cc:	fd1544e3          	blt	a0,a7,d094 <__ledf2+0x80>
    d0d0:	00a8cc63          	blt	a7,a0,d0e8 <__ledf2+0xd4>
    d0d4:	fdc7e0e3          	bltu	a5,t3,d094 <__ledf2+0x80>
    d0d8:	00fe1863          	bne	t3,a5,d0e8 <__ledf2+0xd4>
    d0dc:	fbdf6ce3          	bltu	t5,t4,d094 <__ledf2+0x80>
    d0e0:	00000513          	li	a0,0
    d0e4:	f9eef8e3          	bgeu	t4,t5,d074 <__ledf2+0x60>
    d0e8:	00100513          	li	a0,1
    d0ec:	f80594e3          	bnez	a1,d074 <__ledf2+0x60>
    d0f0:	fff00513          	li	a0,-1
    d0f4:	00008067          	ret
    d0f8:	f6080ae3          	beqz	a6,d06c <__ledf2+0x58>
    d0fc:	f8d59ce3          	bne	a1,a3,d094 <__ledf2+0x80>
    d100:	fe9ff06f          	j	d0e8 <__ledf2+0xd4>
    d104:	00200513          	li	a0,2
    d108:	00008067          	ret
    d10c:	f80814e3          	bnez	a6,d094 <__ledf2+0x80>
    d110:	00008067          	ret
    d114:	fcd580e3          	beq	a1,a3,d0d4 <__ledf2+0xc0>
    d118:	f7dff06f          	j	d094 <__ledf2+0x80>

0000d11c <__muldf3>:
    d11c:	fd010113          	add	sp,sp,-48
    d120:	0145d793          	srl	a5,a1,0x14
    d124:	02812423          	sw	s0,40(sp)
    d128:	02912223          	sw	s1,36(sp)
    d12c:	03212023          	sw	s2,32(sp)
    d130:	01312e23          	sw	s3,28(sp)
    d134:	01512a23          	sw	s5,20(sp)
    d138:	00c59493          	sll	s1,a1,0xc
    d13c:	02112623          	sw	ra,44(sp)
    d140:	01412c23          	sw	s4,24(sp)
    d144:	01612823          	sw	s6,16(sp)
    d148:	01712623          	sw	s7,12(sp)
    d14c:	01812423          	sw	s8,8(sp)
    d150:	7ff7f793          	and	a5,a5,2047
    d154:	00050413          	mv	s0,a0
    d158:	00060a93          	mv	s5,a2
    d15c:	00068993          	mv	s3,a3
    d160:	00c4d493          	srl	s1,s1,0xc
    d164:	01f5d913          	srl	s2,a1,0x1f
    d168:	4e078063          	beqz	a5,d648 <__muldf3+0x52c>
    d16c:	7ff00713          	li	a4,2047
    d170:	0ae78663          	beq	a5,a4,d21c <__muldf3+0x100>
    d174:	00349693          	sll	a3,s1,0x3
    d178:	01d55713          	srl	a4,a0,0x1d
    d17c:	00d76733          	or	a4,a4,a3
    d180:	008006b7          	lui	a3,0x800
    d184:	00d764b3          	or	s1,a4,a3
    d188:	00351a13          	sll	s4,a0,0x3
    d18c:	c0178c13          	add	s8,a5,-1023
    d190:	00000b13          	li	s6,0
    d194:	00000b93          	li	s7,0
    d198:	0149d793          	srl	a5,s3,0x14
    d19c:	00c99713          	sll	a4,s3,0xc
    d1a0:	7ff7f793          	and	a5,a5,2047
    d1a4:	000a8e13          	mv	t3,s5
    d1a8:	00c75413          	srl	s0,a4,0xc
    d1ac:	01f9d993          	srl	s3,s3,0x1f
    d1b0:	0a078063          	beqz	a5,d250 <__muldf3+0x134>
    d1b4:	7ff00713          	li	a4,2047
    d1b8:	14e78e63          	beq	a5,a4,d314 <__muldf3+0x1f8>
    d1bc:	00341713          	sll	a4,s0,0x3
    d1c0:	01dad693          	srl	a3,s5,0x1d
    d1c4:	00e6e6b3          	or	a3,a3,a4
    d1c8:	c0178793          	add	a5,a5,-1023
    d1cc:	00800737          	lui	a4,0x800
    d1d0:	00e6e433          	or	s0,a3,a4
    d1d4:	003a9e13          	sll	t3,s5,0x3
    d1d8:	01878333          	add	t1,a5,s8
    d1dc:	00000693          	li	a3,0
    d1e0:	00a00793          	li	a5,10
    d1e4:	00130893          	add	a7,t1,1
    d1e8:	0b67cc63          	blt	a5,s6,d2a0 <__muldf3+0x184>
    d1ec:	013945b3          	xor	a1,s2,s3
    d1f0:	00200793          	li	a5,2
    d1f4:	00058813          	mv	a6,a1
    d1f8:	1567c663          	blt	a5,s6,d344 <__muldf3+0x228>
    d1fc:	fffb0b13          	add	s6,s6,-1
    d200:	00100713          	li	a4,1
    d204:	17676063          	bltu	a4,s6,d364 <__muldf3+0x248>
    d208:	48f68663          	beq	a3,a5,d694 <__muldf3+0x578>
    d20c:	00040493          	mv	s1,s0
    d210:	000e0a13          	mv	s4,t3
    d214:	00068b93          	mv	s7,a3
    d218:	09c0006f          	j	d2b4 <__muldf3+0x198>
    d21c:	00a4ea33          	or	s4,s1,a0
    d220:	480a1463          	bnez	s4,d6a8 <__muldf3+0x58c>
    d224:	0149d793          	srl	a5,s3,0x14
    d228:	00c99713          	sll	a4,s3,0xc
    d22c:	7ff7f793          	and	a5,a5,2047
    d230:	00000493          	li	s1,0
    d234:	00800b13          	li	s6,8
    d238:	7ff00c13          	li	s8,2047
    d23c:	00200b93          	li	s7,2
    d240:	000a8e13          	mv	t3,s5
    d244:	00c75413          	srl	s0,a4,0xc
    d248:	01f9d993          	srl	s3,s3,0x1f
    d24c:	f60794e3          	bnez	a5,d1b4 <__muldf3+0x98>
    d250:	015467b3          	or	a5,s0,s5
    d254:	46078e63          	beqz	a5,d6d0 <__muldf3+0x5b4>
    d258:	54040c63          	beqz	s0,d7b0 <__muldf3+0x694>
    d25c:	00040513          	mv	a0,s0
    d260:	65c010ef          	jal	e8bc <__clzsi2>
    d264:	00050313          	mv	t1,a0
    d268:	ff550713          	add	a4,a0,-11
    d26c:	01d00793          	li	a5,29
    d270:	ff830e13          	add	t3,t1,-8
    d274:	40e787b3          	sub	a5,a5,a4
    d278:	00fad7b3          	srl	a5,s5,a5
    d27c:	01c41733          	sll	a4,s0,t3
    d280:	00e7e433          	or	s0,a5,a4
    d284:	01ca9e33          	sll	t3,s5,t3
    d288:	406c0333          	sub	t1,s8,t1
    d28c:	c0d30313          	add	t1,t1,-1011
    d290:	00a00793          	li	a5,10
    d294:	00000693          	li	a3,0
    d298:	00130893          	add	a7,t1,1
    d29c:	f567d8e3          	bge	a5,s6,d1ec <__muldf3+0xd0>
    d2a0:	00090593          	mv	a1,s2
    d2a4:	00200793          	li	a5,2
    d2a8:	3efb8663          	beq	s7,a5,d694 <__muldf3+0x578>
    d2ac:	00300793          	li	a5,3
    d2b0:	54fb8863          	beq	s7,a5,d800 <__muldf3+0x6e4>
    d2b4:	00100793          	li	a5,1
    d2b8:	00058813          	mv	a6,a1
    d2bc:	52fb9663          	bne	s7,a5,d7e8 <__muldf3+0x6cc>
    d2c0:	00000793          	li	a5,0
    d2c4:	00000693          	li	a3,0
    d2c8:	00000713          	li	a4,0
    d2cc:	02c12083          	lw	ra,44(sp)
    d2d0:	02812403          	lw	s0,40(sp)
    d2d4:	01479793          	sll	a5,a5,0x14
    d2d8:	00d7e7b3          	or	a5,a5,a3
    d2dc:	01f81813          	sll	a6,a6,0x1f
    d2e0:	0107e7b3          	or	a5,a5,a6
    d2e4:	02412483          	lw	s1,36(sp)
    d2e8:	02012903          	lw	s2,32(sp)
    d2ec:	01c12983          	lw	s3,28(sp)
    d2f0:	01812a03          	lw	s4,24(sp)
    d2f4:	01412a83          	lw	s5,20(sp)
    d2f8:	01012b03          	lw	s6,16(sp)
    d2fc:	00c12b83          	lw	s7,12(sp)
    d300:	00812c03          	lw	s8,8(sp)
    d304:	00070513          	mv	a0,a4
    d308:	00078593          	mv	a1,a5
    d30c:	03010113          	add	sp,sp,48
    d310:	00008067          	ret
    d314:	01546733          	or	a4,s0,s5
    d318:	7ffc0313          	add	t1,s8,2047
    d31c:	3c070663          	beqz	a4,d6e8 <__muldf3+0x5cc>
    d320:	00001737          	lui	a4,0x1
    d324:	01394833          	xor	a6,s2,s3
    d328:	80070713          	add	a4,a4,-2048 # 800 <_sbrk+0x34>
    d32c:	003b6b13          	or	s6,s6,3
    d330:	00a00693          	li	a3,10
    d334:	00080593          	mv	a1,a6
    d338:	00ec08b3          	add	a7,s8,a4
    d33c:	4366cc63          	blt	a3,s6,d774 <__muldf3+0x658>
    d340:	00300693          	li	a3,3
    d344:	00100613          	li	a2,1
    d348:	01661633          	sll	a2,a2,s6
    d34c:	53067713          	and	a4,a2,1328
    d350:	f4071ae3          	bnez	a4,d2a4 <__muldf3+0x188>
    d354:	24067793          	and	a5,a2,576
    d358:	48079063          	bnez	a5,d7d8 <__muldf3+0x6bc>
    d35c:	08867613          	and	a2,a2,136
    d360:	38061e63          	bnez	a2,d6fc <__muldf3+0x5e0>
    d364:	00010fb7          	lui	t6,0x10
    d368:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    d36c:	005a7f33          	and	t5,s4,t0
    d370:	005e72b3          	and	t0,t3,t0
    d374:	010a5a13          	srl	s4,s4,0x10
    d378:	010e5e13          	srl	t3,t3,0x10
    d37c:	000f0513          	mv	a0,t5
    d380:	00028593          	mv	a1,t0
    d384:	460010ef          	jal	e7e4 <__mulsi3>
    d388:	00050713          	mv	a4,a0
    d38c:	000e0593          	mv	a1,t3
    d390:	000f0513          	mv	a0,t5
    d394:	450010ef          	jal	e7e4 <__mulsi3>
    d398:	00050793          	mv	a5,a0
    d39c:	00028593          	mv	a1,t0
    d3a0:	000a0513          	mv	a0,s4
    d3a4:	440010ef          	jal	e7e4 <__mulsi3>
    d3a8:	00050e93          	mv	t4,a0
    d3ac:	000e0593          	mv	a1,t3
    d3b0:	000a0513          	mv	a0,s4
    d3b4:	430010ef          	jal	e7e4 <__mulsi3>
    d3b8:	01d786b3          	add	a3,a5,t4
    d3bc:	01075393          	srl	t2,a4,0x10
    d3c0:	00d383b3          	add	t2,t2,a3
    d3c4:	00050793          	mv	a5,a0
    d3c8:	01d3f463          	bgeu	t2,t4,d3d0 <__muldf3+0x2b4>
    d3cc:	01f507b3          	add	a5,a0,t6
    d3d0:	000109b7          	lui	s3,0x10
    d3d4:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    d3d8:	0123feb3          	and	t4,t2,s2
    d3dc:	01277733          	and	a4,a4,s2
    d3e0:	010e9e93          	sll	t4,t4,0x10
    d3e4:	01247933          	and	s2,s0,s2
    d3e8:	0103d393          	srl	t2,t2,0x10
    d3ec:	00ee8eb3          	add	t4,t4,a4
    d3f0:	01045413          	srl	s0,s0,0x10
    d3f4:	000f0513          	mv	a0,t5
    d3f8:	00090593          	mv	a1,s2
    d3fc:	3e8010ef          	jal	e7e4 <__mulsi3>
    d400:	00050f93          	mv	t6,a0
    d404:	00040593          	mv	a1,s0
    d408:	000f0513          	mv	a0,t5
    d40c:	3d8010ef          	jal	e7e4 <__mulsi3>
    d410:	00050713          	mv	a4,a0
    d414:	00090593          	mv	a1,s2
    d418:	000a0513          	mv	a0,s4
    d41c:	3c8010ef          	jal	e7e4 <__mulsi3>
    d420:	00050f13          	mv	t5,a0
    d424:	00040593          	mv	a1,s0
    d428:	000a0513          	mv	a0,s4
    d42c:	3b8010ef          	jal	e7e4 <__mulsi3>
    d430:	010fd693          	srl	a3,t6,0x10
    d434:	01e70733          	add	a4,a4,t5
    d438:	00e686b3          	add	a3,a3,a4
    d43c:	01e6f463          	bgeu	a3,t5,d444 <__muldf3+0x328>
    d440:	01350533          	add	a0,a0,s3
    d444:	00010a37          	lui	s4,0x10
    d448:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    d44c:	01e6f733          	and	a4,a3,t5
    d450:	01efffb3          	and	t6,t6,t5
    d454:	01071713          	sll	a4,a4,0x10
    d458:	01f70733          	add	a4,a4,t6
    d45c:	01e4ff33          	and	t5,s1,t5
    d460:	0106d693          	srl	a3,a3,0x10
    d464:	00a68fb3          	add	t6,a3,a0
    d468:	00e383b3          	add	t2,t2,a4
    d46c:	0104d493          	srl	s1,s1,0x10
    d470:	000f0513          	mv	a0,t5
    d474:	00028593          	mv	a1,t0
    d478:	36c010ef          	jal	e7e4 <__mulsi3>
    d47c:	00050a93          	mv	s5,a0
    d480:	000e0593          	mv	a1,t3
    d484:	000f0513          	mv	a0,t5
    d488:	35c010ef          	jal	e7e4 <__mulsi3>
    d48c:	00050993          	mv	s3,a0
    d490:	00028593          	mv	a1,t0
    d494:	00048513          	mv	a0,s1
    d498:	34c010ef          	jal	e7e4 <__mulsi3>
    d49c:	00050293          	mv	t0,a0
    d4a0:	000e0593          	mv	a1,t3
    d4a4:	00048513          	mv	a0,s1
    d4a8:	33c010ef          	jal	e7e4 <__mulsi3>
    d4ac:	010ad613          	srl	a2,s5,0x10
    d4b0:	005989b3          	add	s3,s3,t0
    d4b4:	01360633          	add	a2,a2,s3
    d4b8:	00567463          	bgeu	a2,t0,d4c0 <__muldf3+0x3a4>
    d4bc:	01450533          	add	a0,a0,s4
    d4c0:	00010a37          	lui	s4,0x10
    d4c4:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    d4c8:	00d672b3          	and	t0,a2,a3
    d4cc:	00dafab3          	and	s5,s5,a3
    d4d0:	01065613          	srl	a2,a2,0x10
    d4d4:	01029293          	sll	t0,t0,0x10
    d4d8:	00a60e33          	add	t3,a2,a0
    d4dc:	015282b3          	add	t0,t0,s5
    d4e0:	000f0513          	mv	a0,t5
    d4e4:	00090593          	mv	a1,s2
    d4e8:	2fc010ef          	jal	e7e4 <__mulsi3>
    d4ec:	00050993          	mv	s3,a0
    d4f0:	00040593          	mv	a1,s0
    d4f4:	000f0513          	mv	a0,t5
    d4f8:	2ec010ef          	jal	e7e4 <__mulsi3>
    d4fc:	00050f13          	mv	t5,a0
    d500:	00090593          	mv	a1,s2
    d504:	00048513          	mv	a0,s1
    d508:	2dc010ef          	jal	e7e4 <__mulsi3>
    d50c:	00050913          	mv	s2,a0
    d510:	00040593          	mv	a1,s0
    d514:	00048513          	mv	a0,s1
    d518:	2cc010ef          	jal	e7e4 <__mulsi3>
    d51c:	012f06b3          	add	a3,t5,s2
    d520:	0109d593          	srl	a1,s3,0x10
    d524:	00d58433          	add	s0,a1,a3
    d528:	00050f13          	mv	t5,a0
    d52c:	01247463          	bgeu	s0,s2,d534 <__muldf3+0x418>
    d530:	01450f33          	add	t5,a0,s4
    d534:	00010637          	lui	a2,0x10
    d538:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xd4f>
    d53c:	00c476b3          	and	a3,s0,a2
    d540:	00c9f9b3          	and	s3,s3,a2
    d544:	01069693          	sll	a3,a3,0x10
    d548:	007787b3          	add	a5,a5,t2
    d54c:	013686b3          	add	a3,a3,s3
    d550:	01f685b3          	add	a1,a3,t6
    d554:	00e7b733          	sltu	a4,a5,a4
    d558:	00e58733          	add	a4,a1,a4
    d55c:	005782b3          	add	t0,a5,t0
    d560:	01c70633          	add	a2,a4,t3
    d564:	00f2b7b3          	sltu	a5,t0,a5
    d568:	00f607b3          	add	a5,a2,a5
    d56c:	00d5b6b3          	sltu	a3,a1,a3
    d570:	00b735b3          	sltu	a1,a4,a1
    d574:	00b6e6b3          	or	a3,a3,a1
    d578:	00e63733          	sltu	a4,a2,a4
    d57c:	01045593          	srl	a1,s0,0x10
    d580:	00c7b633          	sltu	a2,a5,a2
    d584:	00b686b3          	add	a3,a3,a1
    d588:	00929a13          	sll	s4,t0,0x9
    d58c:	00c76733          	or	a4,a4,a2
    d590:	00d70733          	add	a4,a4,a3
    d594:	01da6a33          	or	s4,s4,t4
    d598:	01e70733          	add	a4,a4,t5
    d59c:	01403a33          	snez	s4,s4
    d5a0:	0172d293          	srl	t0,t0,0x17
    d5a4:	00971713          	sll	a4,a4,0x9
    d5a8:	0177d693          	srl	a3,a5,0x17
    d5ac:	005a6a33          	or	s4,s4,t0
    d5b0:	00979793          	sll	a5,a5,0x9
    d5b4:	00fa6a33          	or	s4,s4,a5
    d5b8:	00771793          	sll	a5,a4,0x7
    d5bc:	00d764b3          	or	s1,a4,a3
    d5c0:	0207d063          	bgez	a5,d5e0 <__muldf3+0x4c4>
    d5c4:	001a5793          	srl	a5,s4,0x1
    d5c8:	001a7a13          	and	s4,s4,1
    d5cc:	01f49713          	sll	a4,s1,0x1f
    d5d0:	0147e7b3          	or	a5,a5,s4
    d5d4:	00e7ea33          	or	s4,a5,a4
    d5d8:	0014d493          	srl	s1,s1,0x1
    d5dc:	00088313          	mv	t1,a7
    d5e0:	3ff30793          	add	a5,t1,1023
    d5e4:	12f05663          	blez	a5,d710 <__muldf3+0x5f4>
    d5e8:	007a7713          	and	a4,s4,7
    d5ec:	02070063          	beqz	a4,d60c <__muldf3+0x4f0>
    d5f0:	00fa7713          	and	a4,s4,15
    d5f4:	00400693          	li	a3,4
    d5f8:	00d70a63          	beq	a4,a3,d60c <__muldf3+0x4f0>
    d5fc:	004a0713          	add	a4,s4,4
    d600:	01473a33          	sltu	s4,a4,s4
    d604:	014484b3          	add	s1,s1,s4
    d608:	00070a13          	mv	s4,a4
    d60c:	00749713          	sll	a4,s1,0x7
    d610:	00075a63          	bgez	a4,d624 <__muldf3+0x508>
    d614:	ff0007b7          	lui	a5,0xff000
    d618:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d61c:	00f4f4b3          	and	s1,s1,a5
    d620:	40030793          	add	a5,t1,1024
    d624:	7fe00713          	li	a4,2046
    d628:	1cf74463          	blt	a4,a5,d7f0 <__muldf3+0x6d4>
    d62c:	003a5a13          	srl	s4,s4,0x3
    d630:	01d49713          	sll	a4,s1,0x1d
    d634:	00949693          	sll	a3,s1,0x9
    d638:	01476733          	or	a4,a4,s4
    d63c:	00c6d693          	srl	a3,a3,0xc
    d640:	7ff7f793          	and	a5,a5,2047
    d644:	c89ff06f          	j	d2cc <__muldf3+0x1b0>
    d648:	00a4ea33          	or	s4,s1,a0
    d64c:	060a0863          	beqz	s4,d6bc <__muldf3+0x5a0>
    d650:	12048e63          	beqz	s1,d78c <__muldf3+0x670>
    d654:	00048513          	mv	a0,s1
    d658:	264010ef          	jal	e8bc <__clzsi2>
    d65c:	00050713          	mv	a4,a0
    d660:	ff550693          	add	a3,a0,-11
    d664:	01d00793          	li	a5,29
    d668:	ff870a13          	add	s4,a4,-8
    d66c:	40d787b3          	sub	a5,a5,a3
    d670:	00f457b3          	srl	a5,s0,a5
    d674:	014496b3          	sll	a3,s1,s4
    d678:	00d7e4b3          	or	s1,a5,a3
    d67c:	01441a33          	sll	s4,s0,s4
    d680:	c0d00793          	li	a5,-1011
    d684:	40e78c33          	sub	s8,a5,a4
    d688:	00000b13          	li	s6,0
    d68c:	00000b93          	li	s7,0
    d690:	b09ff06f          	j	d198 <__muldf3+0x7c>
    d694:	00058813          	mv	a6,a1
    d698:	7ff00793          	li	a5,2047
    d69c:	00000693          	li	a3,0
    d6a0:	00000713          	li	a4,0
    d6a4:	c29ff06f          	j	d2cc <__muldf3+0x1b0>
    d6a8:	00050a13          	mv	s4,a0
    d6ac:	00c00b13          	li	s6,12
    d6b0:	7ff00c13          	li	s8,2047
    d6b4:	00300b93          	li	s7,3
    d6b8:	ae1ff06f          	j	d198 <__muldf3+0x7c>
    d6bc:	00000493          	li	s1,0
    d6c0:	00400b13          	li	s6,4
    d6c4:	00000c13          	li	s8,0
    d6c8:	00100b93          	li	s7,1
    d6cc:	acdff06f          	j	d198 <__muldf3+0x7c>
    d6d0:	001b6b13          	or	s6,s6,1
    d6d4:	000c0313          	mv	t1,s8
    d6d8:	00000413          	li	s0,0
    d6dc:	00000e13          	li	t3,0
    d6e0:	00100693          	li	a3,1
    d6e4:	afdff06f          	j	d1e0 <__muldf3+0xc4>
    d6e8:	002b6b13          	or	s6,s6,2
    d6ec:	00000413          	li	s0,0
    d6f0:	00000e13          	li	t3,0
    d6f4:	00200693          	li	a3,2
    d6f8:	ae9ff06f          	j	d1e0 <__muldf3+0xc4>
    d6fc:	00040493          	mv	s1,s0
    d700:	000e0a13          	mv	s4,t3
    d704:	00068b93          	mv	s7,a3
    d708:	00098593          	mv	a1,s3
    d70c:	b99ff06f          	j	d2a4 <__muldf3+0x188>
    d710:	00100713          	li	a4,1
    d714:	10079063          	bnez	a5,d814 <__muldf3+0x6f8>
    d718:	41e30313          	add	t1,t1,1054
    d71c:	006a1633          	sll	a2,s4,t1
    d720:	00c03633          	snez	a2,a2
    d724:	00649333          	sll	t1,s1,t1
    d728:	00ea5a33          	srl	s4,s4,a4
    d72c:	00666633          	or	a2,a2,t1
    d730:	01466633          	or	a2,a2,s4
    d734:	00767793          	and	a5,a2,7
    d738:	00e4d5b3          	srl	a1,s1,a4
    d73c:	02078063          	beqz	a5,d75c <__muldf3+0x640>
    d740:	00f67793          	and	a5,a2,15
    d744:	00400713          	li	a4,4
    d748:	00e78a63          	beq	a5,a4,d75c <__muldf3+0x640>
    d74c:	00460793          	add	a5,a2,4
    d750:	00c7b633          	sltu	a2,a5,a2
    d754:	00c585b3          	add	a1,a1,a2
    d758:	00078613          	mv	a2,a5
    d75c:	00859513          	sll	a0,a1,0x8
    d760:	00100793          	li	a5,1
    d764:	00000693          	li	a3,0
    d768:	00000713          	li	a4,0
    d76c:	b60540e3          	bltz	a0,d2cc <__muldf3+0x1b0>
    d770:	10c0006f          	j	d87c <__muldf3+0x760>
    d774:	00f00713          	li	a4,15
    d778:	12eb1063          	bne	s6,a4,d898 <__muldf3+0x77c>
    d77c:	00000813          	li	a6,0
    d780:	000806b7          	lui	a3,0x80
    d784:	00000713          	li	a4,0
    d788:	b45ff06f          	j	d2cc <__muldf3+0x1b0>
    d78c:	130010ef          	jal	e8bc <__clzsi2>
    d790:	01550693          	add	a3,a0,21
    d794:	01c00793          	li	a5,28
    d798:	02050713          	add	a4,a0,32
    d79c:	ecd7d4e3          	bge	a5,a3,d664 <__muldf3+0x548>
    d7a0:	ff850513          	add	a0,a0,-8
    d7a4:	00000a13          	li	s4,0
    d7a8:	00a414b3          	sll	s1,s0,a0
    d7ac:	ed5ff06f          	j	d680 <__muldf3+0x564>
    d7b0:	000a8513          	mv	a0,s5
    d7b4:	108010ef          	jal	e8bc <__clzsi2>
    d7b8:	01550713          	add	a4,a0,21
    d7bc:	01c00793          	li	a5,28
    d7c0:	02050313          	add	t1,a0,32
    d7c4:	aae7d4e3          	bge	a5,a4,d26c <__muldf3+0x150>
    d7c8:	ff850513          	add	a0,a0,-8
    d7cc:	00000e13          	li	t3,0
    d7d0:	00aa9433          	sll	s0,s5,a0
    d7d4:	ab5ff06f          	j	d288 <__muldf3+0x16c>
    d7d8:	00000813          	li	a6,0
    d7dc:	7ff00793          	li	a5,2047
    d7e0:	000806b7          	lui	a3,0x80
    d7e4:	ae9ff06f          	j	d2cc <__muldf3+0x1b0>
    d7e8:	00088313          	mv	t1,a7
    d7ec:	df5ff06f          	j	d5e0 <__muldf3+0x4c4>
    d7f0:	7ff00793          	li	a5,2047
    d7f4:	00000693          	li	a3,0
    d7f8:	00000713          	li	a4,0
    d7fc:	ad1ff06f          	j	d2cc <__muldf3+0x1b0>
    d800:	00000813          	li	a6,0
    d804:	7ff00793          	li	a5,2047
    d808:	000806b7          	lui	a3,0x80
    d80c:	00000713          	li	a4,0
    d810:	abdff06f          	j	d2cc <__muldf3+0x1b0>
    d814:	40f70733          	sub	a4,a4,a5
    d818:	03800693          	li	a3,56
    d81c:	aae6c2e3          	blt	a3,a4,d2c0 <__muldf3+0x1a4>
    d820:	01f00693          	li	a3,31
    d824:	eee6dae3          	bge	a3,a4,d718 <__muldf3+0x5fc>
    d828:	fe100693          	li	a3,-31
    d82c:	40f687b3          	sub	a5,a3,a5
    d830:	02000693          	li	a3,32
    d834:	00f4d7b3          	srl	a5,s1,a5
    d838:	00d70863          	beq	a4,a3,d848 <__muldf3+0x72c>
    d83c:	43e30313          	add	t1,t1,1086
    d840:	00649333          	sll	t1,s1,t1
    d844:	006a6a33          	or	s4,s4,t1
    d848:	01403633          	snez	a2,s4
    d84c:	00f66633          	or	a2,a2,a5
    d850:	00767713          	and	a4,a2,7
    d854:	00000693          	li	a3,0
    d858:	02070863          	beqz	a4,d888 <__muldf3+0x76c>
    d85c:	00f67793          	and	a5,a2,15
    d860:	00400713          	li	a4,4
    d864:	00000593          	li	a1,0
    d868:	00e78a63          	beq	a5,a4,d87c <__muldf3+0x760>
    d86c:	00460793          	add	a5,a2,4
    d870:	00c7b633          	sltu	a2,a5,a2
    d874:	00c035b3          	snez	a1,a2
    d878:	00078613          	mv	a2,a5
    d87c:	00959693          	sll	a3,a1,0x9
    d880:	01d59713          	sll	a4,a1,0x1d
    d884:	00c6d693          	srl	a3,a3,0xc
    d888:	00365613          	srl	a2,a2,0x3
    d88c:	00e66733          	or	a4,a2,a4
    d890:	00000793          	li	a5,0
    d894:	a39ff06f          	j	d2cc <__muldf3+0x1b0>
    d898:	00040493          	mv	s1,s0
    d89c:	000a8a13          	mv	s4,s5
    d8a0:	00300b93          	li	s7,3
    d8a4:	00098593          	mv	a1,s3
    d8a8:	9fdff06f          	j	d2a4 <__muldf3+0x188>

0000d8ac <__subdf3>:
    d8ac:	001007b7          	lui	a5,0x100
    d8b0:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d8b4:	fe010113          	add	sp,sp,-32
    d8b8:	00b7f8b3          	and	a7,a5,a1
    d8bc:	00d7f833          	and	a6,a5,a3
    d8c0:	0146d793          	srl	a5,a3,0x14
    d8c4:	00389893          	sll	a7,a7,0x3
    d8c8:	00812c23          	sw	s0,24(sp)
    d8cc:	01312623          	sw	s3,12(sp)
    d8d0:	01f5d413          	srl	s0,a1,0x1f
    d8d4:	0145d993          	srl	s3,a1,0x14
    d8d8:	01d55713          	srl	a4,a0,0x1d
    d8dc:	00381813          	sll	a6,a6,0x3
    d8e0:	01d65593          	srl	a1,a2,0x1d
    d8e4:	00112e23          	sw	ra,28(sp)
    d8e8:	00912a23          	sw	s1,20(sp)
    d8ec:	01212823          	sw	s2,16(sp)
    d8f0:	7ff7ff13          	and	t5,a5,2047
    d8f4:	7ff00313          	li	t1,2047
    d8f8:	01176733          	or	a4,a4,a7
    d8fc:	7ff9f993          	and	s3,s3,2047
    d900:	00040e13          	mv	t3,s0
    d904:	00351893          	sll	a7,a0,0x3
    d908:	01f6d693          	srl	a3,a3,0x1f
    d90c:	0105e5b3          	or	a1,a1,a6
    d910:	00361e93          	sll	t4,a2,0x3
    d914:	206f0c63          	beq	t5,t1,db2c <__subdf3+0x280>
    d918:	0016c693          	xor	a3,a3,1
    d91c:	41e987b3          	sub	a5,s3,t5
    d920:	16d40263          	beq	s0,a3,da84 <__subdf3+0x1d8>
    d924:	00f05ae3          	blez	a5,e138 <__subdf3+0x88c>
    d928:	240f0a63          	beqz	t5,db7c <__subdf3+0x2d0>
    d92c:	3c698463          	beq	s3,t1,dcf4 <__subdf3+0x448>
    d930:	03800693          	li	a3,56
    d934:	00100513          	li	a0,1
    d938:	02f6ce63          	blt	a3,a5,d974 <__subdf3+0xc8>
    d93c:	008006b7          	lui	a3,0x800
    d940:	00d5e5b3          	or	a1,a1,a3
    d944:	01f00693          	li	a3,31
    d948:	4ef6c463          	blt	a3,a5,de30 <__subdf3+0x584>
    d94c:	02000693          	li	a3,32
    d950:	40f686b3          	sub	a3,a3,a5
    d954:	00d59533          	sll	a0,a1,a3
    d958:	00fed633          	srl	a2,t4,a5
    d95c:	00de96b3          	sll	a3,t4,a3
    d960:	00c56533          	or	a0,a0,a2
    d964:	00d036b3          	snez	a3,a3
    d968:	00f5d7b3          	srl	a5,a1,a5
    d96c:	00d56533          	or	a0,a0,a3
    d970:	40f70733          	sub	a4,a4,a5
    d974:	40a88533          	sub	a0,a7,a0
    d978:	00a8b633          	sltu	a2,a7,a0
    d97c:	00050493          	mv	s1,a0
    d980:	40c70933          	sub	s2,a4,a2
    d984:	00891793          	sll	a5,s2,0x8
    d988:	3407d863          	bgez	a5,dcd8 <__subdf3+0x42c>
    d98c:	008007b7          	lui	a5,0x800
    d990:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d994:	00f97933          	and	s2,s2,a5
    d998:	2e090663          	beqz	s2,dc84 <__subdf3+0x3d8>
    d99c:	00090513          	mv	a0,s2
    d9a0:	71d000ef          	jal	e8bc <__clzsi2>
    d9a4:	ff850793          	add	a5,a0,-8
    d9a8:	02000693          	li	a3,32
    d9ac:	40f68733          	sub	a4,a3,a5
    d9b0:	00e4d733          	srl	a4,s1,a4
    d9b4:	00f91933          	sll	s2,s2,a5
    d9b8:	01276733          	or	a4,a4,s2
    d9bc:	00f494b3          	sll	s1,s1,a5
    d9c0:	3f37c463          	blt	a5,s3,dda8 <__subdf3+0x4fc>
    d9c4:	413787b3          	sub	a5,a5,s3
    d9c8:	00178793          	add	a5,a5,1
    d9cc:	40f686b3          	sub	a3,a3,a5
    d9d0:	00d49633          	sll	a2,s1,a3
    d9d4:	00f4d933          	srl	s2,s1,a5
    d9d8:	00c03633          	snez	a2,a2
    d9dc:	00c96633          	or	a2,s2,a2
    d9e0:	00d716b3          	sll	a3,a4,a3
    d9e4:	00c6e4b3          	or	s1,a3,a2
    d9e8:	00f75933          	srl	s2,a4,a5
    d9ec:	00000993          	li	s3,0
    d9f0:	0074f793          	and	a5,s1,7
    d9f4:	02078063          	beqz	a5,da14 <__subdf3+0x168>
    d9f8:	00f4f793          	and	a5,s1,15
    d9fc:	00400713          	li	a4,4
    da00:	00e78a63          	beq	a5,a4,da14 <__subdf3+0x168>
    da04:	00448793          	add	a5,s1,4
    da08:	0097b533          	sltu	a0,a5,s1
    da0c:	00a90933          	add	s2,s2,a0
    da10:	00078493          	mv	s1,a5
    da14:	00891793          	sll	a5,s2,0x8
    da18:	6c07d063          	bgez	a5,e0d8 <__subdf3+0x82c>
    da1c:	00198793          	add	a5,s3,1
    da20:	7ff00713          	li	a4,2047
    da24:	24e78663          	beq	a5,a4,dc70 <__subdf3+0x3c4>
    da28:	ff800737          	lui	a4,0xff800
    da2c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    da30:	00e97733          	and	a4,s2,a4
    da34:	7ff7f793          	and	a5,a5,2047
    da38:	01d71813          	sll	a6,a4,0x1d
    da3c:	0034d513          	srl	a0,s1,0x3
    da40:	00971713          	sll	a4,a4,0x9
    da44:	00a86833          	or	a6,a6,a0
    da48:	00c75713          	srl	a4,a4,0xc
    da4c:	00147e13          	and	t3,s0,1
    da50:	01c12083          	lw	ra,28(sp)
    da54:	01812403          	lw	s0,24(sp)
    da58:	01479793          	sll	a5,a5,0x14
    da5c:	00e7e7b3          	or	a5,a5,a4
    da60:	01fe1713          	sll	a4,t3,0x1f
    da64:	00e7e7b3          	or	a5,a5,a4
    da68:	01412483          	lw	s1,20(sp)
    da6c:	01012903          	lw	s2,16(sp)
    da70:	00c12983          	lw	s3,12(sp)
    da74:	00080513          	mv	a0,a6
    da78:	00078593          	mv	a1,a5
    da7c:	02010113          	add	sp,sp,32
    da80:	00008067          	ret
    da84:	70f05263          	blez	a5,e188 <__subdf3+0x8dc>
    da88:	1c0f1663          	bnez	t5,dc54 <__subdf3+0x3a8>
    da8c:	01d5e6b3          	or	a3,a1,t4
    da90:	26068e63          	beqz	a3,dd0c <__subdf3+0x460>
    da94:	fff78693          	add	a3,a5,-1
    da98:	46068863          	beqz	a3,df08 <__subdf3+0x65c>
    da9c:	24678c63          	beq	a5,t1,dcf4 <__subdf3+0x448>
    daa0:	03800793          	li	a5,56
    daa4:	00100913          	li	s2,1
    daa8:	02d7cc63          	blt	a5,a3,dae0 <__subdf3+0x234>
    daac:	00068793          	mv	a5,a3
    dab0:	01f00693          	li	a3,31
    dab4:	48f6ca63          	blt	a3,a5,df48 <__subdf3+0x69c>
    dab8:	02000693          	li	a3,32
    dabc:	40f686b3          	sub	a3,a3,a5
    dac0:	00d59933          	sll	s2,a1,a3
    dac4:	00fed633          	srl	a2,t4,a5
    dac8:	00de96b3          	sll	a3,t4,a3
    dacc:	00c96933          	or	s2,s2,a2
    dad0:	00d036b3          	snez	a3,a3
    dad4:	00f5d7b3          	srl	a5,a1,a5
    dad8:	00d96933          	or	s2,s2,a3
    dadc:	00f70733          	add	a4,a4,a5
    dae0:	01190633          	add	a2,s2,a7
    dae4:	01263933          	sltu	s2,a2,s2
    dae8:	00060493          	mv	s1,a2
    daec:	00e90933          	add	s2,s2,a4
    daf0:	00891793          	sll	a5,s2,0x8
    daf4:	1e07d263          	bgez	a5,dcd8 <__subdf3+0x42c>
    daf8:	00198993          	add	s3,s3,1
    dafc:	7ff00793          	li	a5,2047
    db00:	16f98863          	beq	s3,a5,dc70 <__subdf3+0x3c4>
    db04:	ff8007b7          	lui	a5,0xff800
    db08:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    db0c:	0014f513          	and	a0,s1,1
    db10:	00f977b3          	and	a5,s2,a5
    db14:	0014d713          	srl	a4,s1,0x1
    db18:	00a76733          	or	a4,a4,a0
    db1c:	01f79513          	sll	a0,a5,0x1f
    db20:	00e564b3          	or	s1,a0,a4
    db24:	0017d913          	srl	s2,a5,0x1
    db28:	ec9ff06f          	j	d9f0 <__subdf3+0x144>
    db2c:	01d5e833          	or	a6,a1,t4
    db30:	80198313          	add	t1,s3,-2047
    db34:	06080863          	beqz	a6,dba4 <__subdf3+0x2f8>
    db38:	06d40a63          	beq	s0,a3,dbac <__subdf3+0x300>
    db3c:	0e030463          	beqz	t1,dc24 <__subdf3+0x378>
    db40:	26098e63          	beqz	s3,ddbc <__subdf3+0x510>
    db44:	00361513          	sll	a0,a2,0x3
    db48:	00355513          	srl	a0,a0,0x3
    db4c:	00068413          	mv	s0,a3
    db50:	00058713          	mv	a4,a1
    db54:	01d71813          	sll	a6,a4,0x1d
    db58:	00a86833          	or	a6,a6,a0
    db5c:	00375713          	srl	a4,a4,0x3
    db60:	01076733          	or	a4,a4,a6
    db64:	10070663          	beqz	a4,dc70 <__subdf3+0x3c4>
    db68:	00000e13          	li	t3,0
    db6c:	7ff00793          	li	a5,2047
    db70:	00080737          	lui	a4,0x80
    db74:	00000813          	li	a6,0
    db78:	ed9ff06f          	j	da50 <__subdf3+0x1a4>
    db7c:	01d5e6b3          	or	a3,a1,t4
    db80:	18068663          	beqz	a3,dd0c <__subdf3+0x460>
    db84:	fff78693          	add	a3,a5,-1
    db88:	3a068263          	beqz	a3,df2c <__subdf3+0x680>
    db8c:	16678463          	beq	a5,t1,dcf4 <__subdf3+0x448>
    db90:	03800793          	li	a5,56
    db94:	00100513          	li	a0,1
    db98:	dcd7cee3          	blt	a5,a3,d974 <__subdf3+0xc8>
    db9c:	00068793          	mv	a5,a3
    dba0:	da5ff06f          	j	d944 <__subdf3+0x98>
    dba4:	0016c693          	xor	a3,a3,1
    dba8:	f8d41ae3          	bne	s0,a3,db3c <__subdf3+0x290>
    dbac:	18030863          	beqz	t1,dd3c <__subdf3+0x490>
    dbb0:	2c099063          	bnez	s3,de70 <__subdf3+0x5c4>
    dbb4:	7ff00793          	li	a5,2047
    dbb8:	011766b3          	or	a3,a4,a7
    dbbc:	48068863          	beqz	a3,e04c <__subdf3+0x7a0>
    dbc0:	fff78693          	add	a3,a5,-1
    dbc4:	34068263          	beqz	a3,df08 <__subdf3+0x65c>
    dbc8:	7ff00513          	li	a0,2047
    dbcc:	2aa78263          	beq	a5,a0,de70 <__subdf3+0x5c4>
    dbd0:	03800793          	li	a5,56
    dbd4:	00100913          	li	s2,1
    dbd8:	02d7ca63          	blt	a5,a3,dc0c <__subdf3+0x360>
    dbdc:	01f00793          	li	a5,31
    dbe0:	4cd7c663          	blt	a5,a3,e0ac <__subdf3+0x800>
    dbe4:	02000793          	li	a5,32
    dbe8:	40d787b3          	sub	a5,a5,a3
    dbec:	00f71933          	sll	s2,a4,a5
    dbf0:	00d8d633          	srl	a2,a7,a3
    dbf4:	00f897b3          	sll	a5,a7,a5
    dbf8:	00c96933          	or	s2,s2,a2
    dbfc:	00f037b3          	snez	a5,a5
    dc00:	00d756b3          	srl	a3,a4,a3
    dc04:	00f96933          	or	s2,s2,a5
    dc08:	00d585b3          	add	a1,a1,a3
    dc0c:	01d90733          	add	a4,s2,t4
    dc10:	01273933          	sltu	s2,a4,s2
    dc14:	00070493          	mv	s1,a4
    dc18:	00b90933          	add	s2,s2,a1
    dc1c:	000f0993          	mv	s3,t5
    dc20:	ed1ff06f          	j	daf0 <__subdf3+0x244>
    dc24:	00198793          	add	a5,s3,1
    dc28:	7fe7f793          	and	a5,a5,2046
    dc2c:	14079463          	bnez	a5,dd74 <__subdf3+0x4c8>
    dc30:	01d5e833          	or	a6,a1,t4
    dc34:	011767b3          	or	a5,a4,a7
    dc38:	2a099463          	bnez	s3,dee0 <__subdf3+0x634>
    dc3c:	38078e63          	beqz	a5,dfd8 <__subdf3+0x72c>
    dc40:	3c081063          	bnez	a6,e000 <__subdf3+0x754>
    dc44:	00351513          	sll	a0,a0,0x3
    dc48:	00355913          	srl	s2,a0,0x3
    dc4c:	00000793          	li	a5,0
    dc50:	1140006f          	j	dd64 <__subdf3+0x4b8>
    dc54:	0a698063          	beq	s3,t1,dcf4 <__subdf3+0x448>
    dc58:	03800693          	li	a3,56
    dc5c:	00100913          	li	s2,1
    dc60:	e8f6c0e3          	blt	a3,a5,dae0 <__subdf3+0x234>
    dc64:	008006b7          	lui	a3,0x800
    dc68:	00d5e5b3          	or	a1,a1,a3
    dc6c:	e45ff06f          	j	dab0 <__subdf3+0x204>
    dc70:	00147e13          	and	t3,s0,1
    dc74:	7ff00793          	li	a5,2047
    dc78:	00000713          	li	a4,0
    dc7c:	00000813          	li	a6,0
    dc80:	dd1ff06f          	j	da50 <__subdf3+0x1a4>
    dc84:	00048513          	mv	a0,s1
    dc88:	435000ef          	jal	e8bc <__clzsi2>
    dc8c:	01850793          	add	a5,a0,24
    dc90:	01f00693          	li	a3,31
    dc94:	d0f6dae3          	bge	a3,a5,d9a8 <__subdf3+0xfc>
    dc98:	ff850713          	add	a4,a0,-8
    dc9c:	00e49733          	sll	a4,s1,a4
    dca0:	1b37ce63          	blt	a5,s3,de5c <__subdf3+0x5b0>
    dca4:	413789b3          	sub	s3,a5,s3
    dca8:	00198793          	add	a5,s3,1
    dcac:	42f6de63          	bge	a3,a5,e0e8 <__subdf3+0x83c>
    dcb0:	fe198993          	add	s3,s3,-31
    dcb4:	02000693          	li	a3,32
    dcb8:	013754b3          	srl	s1,a4,s3
    dcbc:	00d78c63          	beq	a5,a3,dcd4 <__subdf3+0x428>
    dcc0:	04000693          	li	a3,64
    dcc4:	40f687b3          	sub	a5,a3,a5
    dcc8:	00f71733          	sll	a4,a4,a5
    dccc:	00e03733          	snez	a4,a4
    dcd0:	00e4e4b3          	or	s1,s1,a4
    dcd4:	00000993          	li	s3,0
    dcd8:	0074f793          	and	a5,s1,7
    dcdc:	d0079ee3          	bnez	a5,d9f8 <__subdf3+0x14c>
    dce0:	00098793          	mv	a5,s3
    dce4:	0034d513          	srl	a0,s1,0x3
    dce8:	00090713          	mv	a4,s2
    dcec:	0280006f          	j	dd14 <__subdf3+0x468>
    dcf0:	e6081ce3          	bnez	a6,db68 <__subdf3+0x2bc>
    dcf4:	00351513          	sll	a0,a0,0x3
    dcf8:	01d71813          	sll	a6,a4,0x1d
    dcfc:	00355513          	srl	a0,a0,0x3
    dd00:	00a86833          	or	a6,a6,a0
    dd04:	00375713          	srl	a4,a4,0x3
    dd08:	e59ff06f          	j	db60 <__subdf3+0x2b4>
    dd0c:	00351513          	sll	a0,a0,0x3
    dd10:	00355513          	srl	a0,a0,0x3
    dd14:	01d71813          	sll	a6,a4,0x1d
    dd18:	7ff00693          	li	a3,2047
    dd1c:	00a86833          	or	a6,a6,a0
    dd20:	00375713          	srl	a4,a4,0x3
    dd24:	e2d78ee3          	beq	a5,a3,db60 <__subdf3+0x2b4>
    dd28:	00c71713          	sll	a4,a4,0xc
    dd2c:	00c75713          	srl	a4,a4,0xc
    dd30:	7ff7f793          	and	a5,a5,2047
    dd34:	00147e13          	and	t3,s0,1
    dd38:	d19ff06f          	j	da50 <__subdf3+0x1a4>
    dd3c:	00198693          	add	a3,s3,1
    dd40:	7fe6f793          	and	a5,a3,2046
    dd44:	12079e63          	bnez	a5,de80 <__subdf3+0x5d4>
    dd48:	011767b3          	or	a5,a4,a7
    dd4c:	24099a63          	bnez	s3,dfa0 <__subdf3+0x6f4>
    dd50:	30078663          	beqz	a5,e05c <__subdf3+0x7b0>
    dd54:	01d5e7b3          	or	a5,a1,t4
    dd58:	30079a63          	bnez	a5,e06c <__subdf3+0x7c0>
    dd5c:	00351513          	sll	a0,a0,0x3
    dd60:	00355913          	srl	s2,a0,0x3
    dd64:	01d71813          	sll	a6,a4,0x1d
    dd68:	01286833          	or	a6,a6,s2
    dd6c:	00375713          	srl	a4,a4,0x3
    dd70:	fb9ff06f          	j	dd28 <__subdf3+0x47c>
    dd74:	41d88833          	sub	a6,a7,t4
    dd78:	0108b7b3          	sltu	a5,a7,a6
    dd7c:	40b70933          	sub	s2,a4,a1
    dd80:	40f90933          	sub	s2,s2,a5
    dd84:	00891793          	sll	a5,s2,0x8
    dd88:	00080493          	mv	s1,a6
    dd8c:	1207c263          	bltz	a5,deb0 <__subdf3+0x604>
    dd90:	01286833          	or	a6,a6,s2
    dd94:	c00812e3          	bnez	a6,d998 <__subdf3+0xec>
    dd98:	00000e13          	li	t3,0
    dd9c:	00000793          	li	a5,0
    dda0:	00000713          	li	a4,0
    dda4:	cadff06f          	j	da50 <__subdf3+0x1a4>
    dda8:	ff800937          	lui	s2,0xff800
    ddac:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ddb0:	40f989b3          	sub	s3,s3,a5
    ddb4:	01277933          	and	s2,a4,s2
    ddb8:	c39ff06f          	j	d9f0 <__subdf3+0x144>
    ddbc:	7ff00793          	li	a5,2047
    ddc0:	01176533          	or	a0,a4,a7
    ddc4:	10050463          	beqz	a0,decc <__subdf3+0x620>
    ddc8:	fff78813          	add	a6,a5,-1
    ddcc:	1e080263          	beqz	a6,dfb0 <__subdf3+0x704>
    ddd0:	7ff00513          	li	a0,2047
    ddd4:	d6a788e3          	beq	a5,a0,db44 <__subdf3+0x298>
    ddd8:	03800793          	li	a5,56
    dddc:	00068413          	mv	s0,a3
    dde0:	00100513          	li	a0,1
    dde4:	0307ca63          	blt	a5,a6,de18 <__subdf3+0x56c>
    dde8:	01f00793          	li	a5,31
    ddec:	1907c463          	blt	a5,a6,df74 <__subdf3+0x6c8>
    ddf0:	02000793          	li	a5,32
    ddf4:	410787b3          	sub	a5,a5,a6
    ddf8:	00f71533          	sll	a0,a4,a5
    ddfc:	0108d6b3          	srl	a3,a7,a6
    de00:	00f897b3          	sll	a5,a7,a5
    de04:	00d56533          	or	a0,a0,a3
    de08:	00f037b3          	snez	a5,a5
    de0c:	01075833          	srl	a6,a4,a6
    de10:	00f56533          	or	a0,a0,a5
    de14:	410585b3          	sub	a1,a1,a6
    de18:	40ae8533          	sub	a0,t4,a0
    de1c:	00aeb733          	sltu	a4,t4,a0
    de20:	00050493          	mv	s1,a0
    de24:	40e58933          	sub	s2,a1,a4
    de28:	000f0993          	mv	s3,t5
    de2c:	b59ff06f          	j	d984 <__subdf3+0xd8>
    de30:	fe078693          	add	a3,a5,-32
    de34:	02000613          	li	a2,32
    de38:	00d5d6b3          	srl	a3,a1,a3
    de3c:	00c78a63          	beq	a5,a2,de50 <__subdf3+0x5a4>
    de40:	04000613          	li	a2,64
    de44:	40f607b3          	sub	a5,a2,a5
    de48:	00f597b3          	sll	a5,a1,a5
    de4c:	00feeeb3          	or	t4,t4,a5
    de50:	01d03533          	snez	a0,t4
    de54:	00d56533          	or	a0,a0,a3
    de58:	b1dff06f          	j	d974 <__subdf3+0xc8>
    de5c:	ff8006b7          	lui	a3,0xff800
    de60:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de64:	40f987b3          	sub	a5,s3,a5
    de68:	00d77733          	and	a4,a4,a3
    de6c:	ef9ff06f          	j	dd64 <__subdf3+0x4b8>
    de70:	00361513          	sll	a0,a2,0x3
    de74:	00355513          	srl	a0,a0,0x3
    de78:	00058713          	mv	a4,a1
    de7c:	cd9ff06f          	j	db54 <__subdf3+0x2a8>
    de80:	7ff00793          	li	a5,2047
    de84:	def686e3          	beq	a3,a5,dc70 <__subdf3+0x3c4>
    de88:	01d88eb3          	add	t4,a7,t4
    de8c:	011eb633          	sltu	a2,t4,a7
    de90:	00b707b3          	add	a5,a4,a1
    de94:	00c787b3          	add	a5,a5,a2
    de98:	01f79513          	sll	a0,a5,0x1f
    de9c:	001ede93          	srl	t4,t4,0x1
    dea0:	01d564b3          	or	s1,a0,t4
    dea4:	0017d913          	srl	s2,a5,0x1
    dea8:	00068993          	mv	s3,a3
    deac:	b45ff06f          	j	d9f0 <__subdf3+0x144>
    deb0:	411e8633          	sub	a2,t4,a7
    deb4:	40e587b3          	sub	a5,a1,a4
    deb8:	00ceb733          	sltu	a4,t4,a2
    debc:	00060493          	mv	s1,a2
    dec0:	40e78933          	sub	s2,a5,a4
    dec4:	00068413          	mv	s0,a3
    dec8:	ad1ff06f          	j	d998 <__subdf3+0xec>
    decc:	00361613          	sll	a2,a2,0x3
    ded0:	00365513          	srl	a0,a2,0x3
    ded4:	00068413          	mv	s0,a3
    ded8:	00058713          	mv	a4,a1
    dedc:	e39ff06f          	j	dd14 <__subdf3+0x468>
    dee0:	e00798e3          	bnez	a5,dcf0 <__subdf3+0x444>
    dee4:	22080663          	beqz	a6,e110 <__subdf3+0x864>
    dee8:	0035d713          	srl	a4,a1,0x3
    deec:	00361613          	sll	a2,a2,0x3
    def0:	01d59593          	sll	a1,a1,0x1d
    def4:	00b76733          	or	a4,a4,a1
    def8:	00365613          	srl	a2,a2,0x3
    defc:	00c76733          	or	a4,a4,a2
    df00:	00068413          	mv	s0,a3
    df04:	c61ff06f          	j	db64 <__subdf3+0x2b8>
    df08:	01d88eb3          	add	t4,a7,t4
    df0c:	00b705b3          	add	a1,a4,a1
    df10:	011eb633          	sltu	a2,t4,a7
    df14:	00c58933          	add	s2,a1,a2
    df18:	00891793          	sll	a5,s2,0x8
    df1c:	000e8493          	mv	s1,t4
    df20:	0a07d863          	bgez	a5,dfd0 <__subdf3+0x724>
    df24:	00200993          	li	s3,2
    df28:	bddff06f          	j	db04 <__subdf3+0x258>
    df2c:	41d88eb3          	sub	t4,a7,t4
    df30:	40b705b3          	sub	a1,a4,a1
    df34:	01d8b633          	sltu	a2,a7,t4
    df38:	000e8493          	mv	s1,t4
    df3c:	40c58933          	sub	s2,a1,a2
    df40:	00100993          	li	s3,1
    df44:	a41ff06f          	j	d984 <__subdf3+0xd8>
    df48:	fe078693          	add	a3,a5,-32
    df4c:	02000613          	li	a2,32
    df50:	00d5d6b3          	srl	a3,a1,a3
    df54:	00c78a63          	beq	a5,a2,df68 <__subdf3+0x6bc>
    df58:	04000613          	li	a2,64
    df5c:	40f607b3          	sub	a5,a2,a5
    df60:	00f597b3          	sll	a5,a1,a5
    df64:	00feeeb3          	or	t4,t4,a5
    df68:	01d03933          	snez	s2,t4
    df6c:	00d96933          	or	s2,s2,a3
    df70:	b71ff06f          	j	dae0 <__subdf3+0x234>
    df74:	fe080793          	add	a5,a6,-32
    df78:	02000693          	li	a3,32
    df7c:	00f757b3          	srl	a5,a4,a5
    df80:	00d80a63          	beq	a6,a3,df94 <__subdf3+0x6e8>
    df84:	04000693          	li	a3,64
    df88:	410686b3          	sub	a3,a3,a6
    df8c:	00d71733          	sll	a4,a4,a3
    df90:	00e8e8b3          	or	a7,a7,a4
    df94:	01103533          	snez	a0,a7
    df98:	00f56533          	or	a0,a0,a5
    df9c:	e7dff06f          	j	de18 <__subdf3+0x56c>
    dfa0:	ec0788e3          	beqz	a5,de70 <__subdf3+0x5c4>
    dfa4:	01d5eeb3          	or	t4,a1,t4
    dfa8:	bc0e90e3          	bnez	t4,db68 <__subdf3+0x2bc>
    dfac:	d49ff06f          	j	dcf4 <__subdf3+0x448>
    dfb0:	411e8633          	sub	a2,t4,a7
    dfb4:	40e585b3          	sub	a1,a1,a4
    dfb8:	00ceb733          	sltu	a4,t4,a2
    dfbc:	00060493          	mv	s1,a2
    dfc0:	40e58933          	sub	s2,a1,a4
    dfc4:	00068413          	mv	s0,a3
    dfc8:	00100993          	li	s3,1
    dfcc:	9b9ff06f          	j	d984 <__subdf3+0xd8>
    dfd0:	00100793          	li	a5,1
    dfd4:	d11ff06f          	j	dce4 <__subdf3+0x438>
    dfd8:	dc0800e3          	beqz	a6,dd98 <__subdf3+0x4ec>
    dfdc:	00361613          	sll	a2,a2,0x3
    dfe0:	00365793          	srl	a5,a2,0x3
    dfe4:	01d59813          	sll	a6,a1,0x1d
    dfe8:	00959713          	sll	a4,a1,0x9
    dfec:	00f86833          	or	a6,a6,a5
    dff0:	00c75713          	srl	a4,a4,0xc
    dff4:	00068e13          	mv	t3,a3
    dff8:	00000793          	li	a5,0
    dffc:	a55ff06f          	j	da50 <__subdf3+0x1a4>
    e000:	41d88933          	sub	s2,a7,t4
    e004:	0128b7b3          	sltu	a5,a7,s2
    e008:	40b70633          	sub	a2,a4,a1
    e00c:	40f60633          	sub	a2,a2,a5
    e010:	00861793          	sll	a5,a2,0x8
    e014:	0e07d263          	bgez	a5,e0f8 <__subdf3+0x84c>
    e018:	411e8633          	sub	a2,t4,a7
    e01c:	40e58733          	sub	a4,a1,a4
    e020:	00cebeb3          	sltu	t4,t4,a2
    e024:	41d70733          	sub	a4,a4,t4
    e028:	00871793          	sll	a5,a4,0x8
    e02c:	00060493          	mv	s1,a2
    e030:	1207de63          	bgez	a5,e16c <__subdf3+0x8c0>
    e034:	ff8007b7          	lui	a5,0xff800
    e038:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e03c:	00f77733          	and	a4,a4,a5
    e040:	00068413          	mv	s0,a3
    e044:	00100793          	li	a5,1
    e048:	9f1ff06f          	j	da38 <__subdf3+0x18c>
    e04c:	00361613          	sll	a2,a2,0x3
    e050:	00365513          	srl	a0,a2,0x3
    e054:	00058713          	mv	a4,a1
    e058:	cbdff06f          	j	dd14 <__subdf3+0x468>
    e05c:	00361613          	sll	a2,a2,0x3
    e060:	00365913          	srl	s2,a2,0x3
    e064:	00058713          	mv	a4,a1
    e068:	cfdff06f          	j	dd64 <__subdf3+0x4b8>
    e06c:	01d886b3          	add	a3,a7,t4
    e070:	00b707b3          	add	a5,a4,a1
    e074:	0116b633          	sltu	a2,a3,a7
    e078:	00c787b3          	add	a5,a5,a2
    e07c:	00879713          	sll	a4,a5,0x8
    e080:	0036d813          	srl	a6,a3,0x3
    e084:	08075e63          	bgez	a4,e120 <__subdf3+0x874>
    e088:	ff800737          	lui	a4,0xff800
    e08c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e090:	00e7f7b3          	and	a5,a5,a4
    e094:	01d79713          	sll	a4,a5,0x1d
    e098:	00979793          	sll	a5,a5,0x9
    e09c:	01076833          	or	a6,a4,a6
    e0a0:	00c7d713          	srl	a4,a5,0xc
    e0a4:	00100793          	li	a5,1
    e0a8:	9a9ff06f          	j	da50 <__subdf3+0x1a4>
    e0ac:	fe068793          	add	a5,a3,-32
    e0b0:	02000613          	li	a2,32
    e0b4:	00f757b3          	srl	a5,a4,a5
    e0b8:	00c68a63          	beq	a3,a2,e0cc <__subdf3+0x820>
    e0bc:	04000613          	li	a2,64
    e0c0:	40d606b3          	sub	a3,a2,a3
    e0c4:	00d71733          	sll	a4,a4,a3
    e0c8:	00e8e8b3          	or	a7,a7,a4
    e0cc:	01103933          	snez	s2,a7
    e0d0:	00f96933          	or	s2,s2,a5
    e0d4:	b39ff06f          	j	dc0c <__subdf3+0x360>
    e0d8:	0034d513          	srl	a0,s1,0x3
    e0dc:	00098793          	mv	a5,s3
    e0e0:	00090713          	mv	a4,s2
    e0e4:	c31ff06f          	j	dd14 <__subdf3+0x468>
    e0e8:	02000693          	li	a3,32
    e0ec:	40f686b3          	sub	a3,a3,a5
    e0f0:	00000613          	li	a2,0
    e0f4:	8e9ff06f          	j	d9dc <__subdf3+0x130>
    e0f8:	00c96833          	or	a6,s2,a2
    e0fc:	c8080ee3          	beqz	a6,dd98 <__subdf3+0x4ec>
    e100:	00395913          	srl	s2,s2,0x3
    e104:	00000793          	li	a5,0
    e108:	00060713          	mv	a4,a2
    e10c:	c59ff06f          	j	dd64 <__subdf3+0x4b8>
    e110:	00000e13          	li	t3,0
    e114:	7ff00793          	li	a5,2047
    e118:	00080737          	lui	a4,0x80
    e11c:	935ff06f          	j	da50 <__subdf3+0x1a4>
    e120:	01d79713          	sll	a4,a5,0x1d
    e124:	00979793          	sll	a5,a5,0x9
    e128:	01076833          	or	a6,a4,a6
    e12c:	00c7d713          	srl	a4,a5,0xc
    e130:	00000793          	li	a5,0
    e134:	91dff06f          	j	da50 <__subdf3+0x1a4>
    e138:	ae0786e3          	beqz	a5,dc24 <__subdf3+0x378>
    e13c:	413f0833          	sub	a6,t5,s3
    e140:	00080793          	mv	a5,a6
    e144:	c6098ee3          	beqz	s3,ddc0 <__subdf3+0x514>
    e148:	03800793          	li	a5,56
    e14c:	0107ca63          	blt	a5,a6,e160 <__subdf3+0x8b4>
    e150:	008007b7          	lui	a5,0x800
    e154:	00f76733          	or	a4,a4,a5
    e158:	00068413          	mv	s0,a3
    e15c:	c8dff06f          	j	dde8 <__subdf3+0x53c>
    e160:	00068413          	mv	s0,a3
    e164:	00100513          	li	a0,1
    e168:	cb1ff06f          	j	de18 <__subdf3+0x56c>
    e16c:	01d71813          	sll	a6,a4,0x1d
    e170:	00365613          	srl	a2,a2,0x3
    e174:	00c86833          	or	a6,a6,a2
    e178:	00375713          	srl	a4,a4,0x3
    e17c:	00000793          	li	a5,0
    e180:	00068413          	mv	s0,a3
    e184:	ba5ff06f          	j	dd28 <__subdf3+0x47c>
    e188:	ba078ae3          	beqz	a5,dd3c <__subdf3+0x490>
    e18c:	413f06b3          	sub	a3,t5,s3
    e190:	00099663          	bnez	s3,e19c <__subdf3+0x8f0>
    e194:	00068793          	mv	a5,a3
    e198:	a21ff06f          	j	dbb8 <__subdf3+0x30c>
    e19c:	03800793          	li	a5,56
    e1a0:	00100913          	li	s2,1
    e1a4:	a6d7c4e3          	blt	a5,a3,dc0c <__subdf3+0x360>
    e1a8:	008007b7          	lui	a5,0x800
    e1ac:	00f76733          	or	a4,a4,a5
    e1b0:	a2dff06f          	j	dbdc <__subdf3+0x330>

0000e1b4 <__unorddf2>:
    e1b4:	0145d713          	srl	a4,a1,0x14
    e1b8:	001007b7          	lui	a5,0x100
    e1bc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e1c0:	fff74713          	not	a4,a4
    e1c4:	0146d813          	srl	a6,a3,0x14
    e1c8:	00b7f5b3          	and	a1,a5,a1
    e1cc:	00d7f7b3          	and	a5,a5,a3
    e1d0:	01571693          	sll	a3,a4,0x15
    e1d4:	7ff87813          	and	a6,a6,2047
    e1d8:	02068063          	beqz	a3,e1f8 <__unorddf2+0x44>
    e1dc:	7ff00713          	li	a4,2047
    e1e0:	00000513          	li	a0,0
    e1e4:	00e80463          	beq	a6,a4,e1ec <__unorddf2+0x38>
    e1e8:	00008067          	ret
    e1ec:	00c7e7b3          	or	a5,a5,a2
    e1f0:	00f03533          	snez	a0,a5
    e1f4:	00008067          	ret
    e1f8:	00a5e5b3          	or	a1,a1,a0
    e1fc:	00100513          	li	a0,1
    e200:	fc058ee3          	beqz	a1,e1dc <__unorddf2+0x28>
    e204:	00008067          	ret

0000e208 <__fixdfsi>:
    e208:	0145d793          	srl	a5,a1,0x14
    e20c:	001006b7          	lui	a3,0x100
    e210:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e214:	7ff7f793          	and	a5,a5,2047
    e218:	3fe00613          	li	a2,1022
    e21c:	00b77733          	and	a4,a4,a1
    e220:	01f5d593          	srl	a1,a1,0x1f
    e224:	00f65e63          	bge	a2,a5,e240 <__fixdfsi+0x38>
    e228:	41d00613          	li	a2,1053
    e22c:	00f65e63          	bge	a2,a5,e248 <__fixdfsi+0x40>
    e230:	80000537          	lui	a0,0x80000
    e234:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e238:	00a58533          	add	a0,a1,a0
    e23c:	00008067          	ret
    e240:	00000513          	li	a0,0
    e244:	00008067          	ret
    e248:	43300613          	li	a2,1075
    e24c:	40f60633          	sub	a2,a2,a5
    e250:	01f00813          	li	a6,31
    e254:	00d76733          	or	a4,a4,a3
    e258:	02c85063          	bge	a6,a2,e278 <__fixdfsi+0x70>
    e25c:	41300693          	li	a3,1043
    e260:	40f687b3          	sub	a5,a3,a5
    e264:	00f75733          	srl	a4,a4,a5
    e268:	40e00533          	neg	a0,a4
    e26c:	fc059ce3          	bnez	a1,e244 <__fixdfsi+0x3c>
    e270:	00070513          	mv	a0,a4
    e274:	00008067          	ret
    e278:	bed78793          	add	a5,a5,-1043
    e27c:	00f71733          	sll	a4,a4,a5
    e280:	00c55533          	srl	a0,a0,a2
    e284:	00a76733          	or	a4,a4,a0
    e288:	fe1ff06f          	j	e268 <__fixdfsi+0x60>

0000e28c <__floatsidf>:
    e28c:	ff010113          	add	sp,sp,-16
    e290:	00112623          	sw	ra,12(sp)
    e294:	00812423          	sw	s0,8(sp)
    e298:	00912223          	sw	s1,4(sp)
    e29c:	04050a63          	beqz	a0,e2f0 <__floatsidf+0x64>
    e2a0:	41f55713          	sra	a4,a0,0x1f
    e2a4:	00a744b3          	xor	s1,a4,a0
    e2a8:	40e484b3          	sub	s1,s1,a4
    e2ac:	00050793          	mv	a5,a0
    e2b0:	00048513          	mv	a0,s1
    e2b4:	01f7d413          	srl	s0,a5,0x1f
    e2b8:	604000ef          	jal	e8bc <__clzsi2>
    e2bc:	41e00793          	li	a5,1054
    e2c0:	40a787b3          	sub	a5,a5,a0
    e2c4:	00a00713          	li	a4,10
    e2c8:	7ff7f793          	and	a5,a5,2047
    e2cc:	06a74063          	blt	a4,a0,e32c <__floatsidf+0xa0>
    e2d0:	00b00713          	li	a4,11
    e2d4:	40a70733          	sub	a4,a4,a0
    e2d8:	00e4d733          	srl	a4,s1,a4
    e2dc:	01550513          	add	a0,a0,21
    e2e0:	00c71713          	sll	a4,a4,0xc
    e2e4:	00a494b3          	sll	s1,s1,a0
    e2e8:	00c75713          	srl	a4,a4,0xc
    e2ec:	0140006f          	j	e300 <__floatsidf+0x74>
    e2f0:	00000413          	li	s0,0
    e2f4:	00000793          	li	a5,0
    e2f8:	00000713          	li	a4,0
    e2fc:	00000493          	li	s1,0
    e300:	01479793          	sll	a5,a5,0x14
    e304:	01f41413          	sll	s0,s0,0x1f
    e308:	00e7e7b3          	or	a5,a5,a4
    e30c:	00c12083          	lw	ra,12(sp)
    e310:	0087e7b3          	or	a5,a5,s0
    e314:	00812403          	lw	s0,8(sp)
    e318:	00048513          	mv	a0,s1
    e31c:	00078593          	mv	a1,a5
    e320:	00412483          	lw	s1,4(sp)
    e324:	01010113          	add	sp,sp,16
    e328:	00008067          	ret
    e32c:	ff550513          	add	a0,a0,-11
    e330:	00a49733          	sll	a4,s1,a0
    e334:	00c71713          	sll	a4,a4,0xc
    e338:	00c75713          	srl	a4,a4,0xc
    e33c:	00000493          	li	s1,0
    e340:	fc1ff06f          	j	e300 <__floatsidf+0x74>

0000e344 <__floatunsidf>:
    e344:	ff010113          	add	sp,sp,-16
    e348:	00812423          	sw	s0,8(sp)
    e34c:	00112623          	sw	ra,12(sp)
    e350:	00050413          	mv	s0,a0
    e354:	04050c63          	beqz	a0,e3ac <__floatunsidf+0x68>
    e358:	564000ef          	jal	e8bc <__clzsi2>
    e35c:	41e00793          	li	a5,1054
    e360:	40a787b3          	sub	a5,a5,a0
    e364:	00a00713          	li	a4,10
    e368:	7ff7f793          	and	a5,a5,2047
    e36c:	06a74463          	blt	a4,a0,e3d4 <__floatunsidf+0x90>
    e370:	00b00713          	li	a4,11
    e374:	40a70733          	sub	a4,a4,a0
    e378:	01550513          	add	a0,a0,21
    e37c:	00e45733          	srl	a4,s0,a4
    e380:	00a41433          	sll	s0,s0,a0
    e384:	00c12083          	lw	ra,12(sp)
    e388:	00040513          	mv	a0,s0
    e38c:	00c71713          	sll	a4,a4,0xc
    e390:	00812403          	lw	s0,8(sp)
    e394:	00c75713          	srl	a4,a4,0xc
    e398:	01479793          	sll	a5,a5,0x14
    e39c:	00e7e7b3          	or	a5,a5,a4
    e3a0:	00078593          	mv	a1,a5
    e3a4:	01010113          	add	sp,sp,16
    e3a8:	00008067          	ret
    e3ac:	00c12083          	lw	ra,12(sp)
    e3b0:	00040513          	mv	a0,s0
    e3b4:	00000793          	li	a5,0
    e3b8:	00812403          	lw	s0,8(sp)
    e3bc:	00000713          	li	a4,0
    e3c0:	01479793          	sll	a5,a5,0x14
    e3c4:	00e7e7b3          	or	a5,a5,a4
    e3c8:	00078593          	mv	a1,a5
    e3cc:	01010113          	add	sp,sp,16
    e3d0:	00008067          	ret
    e3d4:	ff550513          	add	a0,a0,-11
    e3d8:	00a41733          	sll	a4,s0,a0
    e3dc:	00000413          	li	s0,0
    e3e0:	00c12083          	lw	ra,12(sp)
    e3e4:	00040513          	mv	a0,s0
    e3e8:	00c71713          	sll	a4,a4,0xc
    e3ec:	00812403          	lw	s0,8(sp)
    e3f0:	00c75713          	srl	a4,a4,0xc
    e3f4:	01479793          	sll	a5,a5,0x14
    e3f8:	00e7e7b3          	or	a5,a5,a4
    e3fc:	00078593          	mv	a1,a5
    e400:	01010113          	add	sp,sp,16
    e404:	00008067          	ret

0000e408 <__trunctfdf2>:
    e408:	00c52583          	lw	a1,12(a0)
    e40c:	00852783          	lw	a5,8(a0)
    e410:	00052803          	lw	a6,0(a0)
    e414:	00452683          	lw	a3,4(a0)
    e418:	01059613          	sll	a2,a1,0x10
    e41c:	fe010113          	add	sp,sp,-32
    e420:	00159713          	sll	a4,a1,0x1
    e424:	01065613          	srl	a2,a2,0x10
    e428:	00f12423          	sw	a5,8(sp)
    e42c:	00b12623          	sw	a1,12(sp)
    e430:	00f12c23          	sw	a5,24(sp)
    e434:	01012023          	sw	a6,0(sp)
    e438:	00d12223          	sw	a3,4(sp)
    e43c:	01012823          	sw	a6,16(sp)
    e440:	00d12a23          	sw	a3,20(sp)
    e444:	00c12e23          	sw	a2,28(sp)
    e448:	01175713          	srl	a4,a4,0x11
    e44c:	01f5d593          	srl	a1,a1,0x1f
    e450:	01010893          	add	a7,sp,16
    e454:	01c10793          	add	a5,sp,28
    e458:	00361513          	sll	a0,a2,0x3
    e45c:	ffc7a603          	lw	a2,-4(a5)
    e460:	ffc78793          	add	a5,a5,-4
    e464:	01d65693          	srl	a3,a2,0x1d
    e468:	00a6e6b3          	or	a3,a3,a0
    e46c:	00d7a223          	sw	a3,4(a5)
    e470:	fef894e3          	bne	a7,a5,e458 <__trunctfdf2+0x50>
    e474:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e478:	00381813          	sll	a6,a6,0x3
    e47c:	01169613          	sll	a2,a3,0x11
    e480:	01012823          	sw	a6,16(sp)
    e484:	01265613          	srl	a2,a2,0x12
    e488:	04060263          	beqz	a2,e4cc <__trunctfdf2+0xc4>
    e48c:	ffffc6b7          	lui	a3,0xffffc
    e490:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e494:	00d70733          	add	a4,a4,a3
    e498:	7fe00693          	li	a3,2046
    e49c:	10e6d463          	bge	a3,a4,e5a4 <__trunctfdf2+0x19c>
    e4a0:	7ff00793          	li	a5,2047
    e4a4:	00000613          	li	a2,0
    e4a8:	00000693          	li	a3,0
    e4ac:	01479793          	sll	a5,a5,0x14
    e4b0:	01f59593          	sll	a1,a1,0x1f
    e4b4:	00c7e7b3          	or	a5,a5,a2
    e4b8:	00b7e7b3          	or	a5,a5,a1
    e4bc:	00068513          	mv	a0,a3
    e4c0:	00078593          	mv	a1,a5
    e4c4:	02010113          	add	sp,sp,32
    e4c8:	00008067          	ret
    e4cc:	01412603          	lw	a2,20(sp)
    e4d0:	01812883          	lw	a7,24(sp)
    e4d4:	01c12503          	lw	a0,28(sp)
    e4d8:	011666b3          	or	a3,a2,a7
    e4dc:	00a6e6b3          	or	a3,a3,a0
    e4e0:	0106e6b3          	or	a3,a3,a6
    e4e4:	04071463          	bnez	a4,e52c <__trunctfdf2+0x124>
    e4e8:	14068263          	beqz	a3,e62c <__trunctfdf2+0x224>
    e4ec:	00500693          	li	a3,5
    e4f0:	00000613          	li	a2,0
    e4f4:	0036d793          	srl	a5,a3,0x3
    e4f8:	01d61693          	sll	a3,a2,0x1d
    e4fc:	00f6e6b3          	or	a3,a3,a5
    e500:	00961613          	sll	a2,a2,0x9
    e504:	7ff77793          	and	a5,a4,2047
    e508:	00c65613          	srl	a2,a2,0xc
    e50c:	01479793          	sll	a5,a5,0x14
    e510:	01f59593          	sll	a1,a1,0x1f
    e514:	00c7e7b3          	or	a5,a5,a2
    e518:	00b7e7b3          	or	a5,a5,a1
    e51c:	00068513          	mv	a0,a3
    e520:	00078593          	mv	a1,a5
    e524:	02010113          	add	sp,sp,32
    e528:	00008067          	ret
    e52c:	12068463          	beqz	a3,e654 <__trunctfdf2+0x24c>
    e530:	01c8d793          	srl	a5,a7,0x1c
    e534:	00451513          	sll	a0,a0,0x4
    e538:	00a7e7b3          	or	a5,a5,a0
    e53c:	008006b7          	lui	a3,0x800
    e540:	00d7f6b3          	and	a3,a5,a3
    e544:	1c068263          	beqz	a3,e708 <__trunctfdf2+0x300>
    e548:	ff800737          	lui	a4,0xff800
    e54c:	01c65693          	srl	a3,a2,0x1c
    e550:	00489893          	sll	a7,a7,0x4
    e554:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e558:	00e7f633          	and	a2,a5,a4
    e55c:	0116e6b3          	or	a3,a3,a7
    e560:	004007b7          	lui	a5,0x400
    e564:	00f66633          	or	a2,a2,a5
    e568:	ff86f693          	and	a3,a3,-8
    e56c:	00000793          	li	a5,0
    e570:	0036d713          	srl	a4,a3,0x3
    e574:	01d61693          	sll	a3,a2,0x1d
    e578:	00961613          	sll	a2,a2,0x9
    e57c:	00c65613          	srl	a2,a2,0xc
    e580:	01479793          	sll	a5,a5,0x14
    e584:	01f59593          	sll	a1,a1,0x1f
    e588:	00c7e7b3          	or	a5,a5,a2
    e58c:	00e6e6b3          	or	a3,a3,a4
    e590:	00b7e7b3          	or	a5,a5,a1
    e594:	00068513          	mv	a0,a3
    e598:	00078593          	mv	a1,a5
    e59c:	02010113          	add	sp,sp,32
    e5a0:	00008067          	ret
    e5a4:	0ce05c63          	blez	a4,e67c <__trunctfdf2+0x274>
    e5a8:	01412783          	lw	a5,20(sp)
    e5ac:	01812503          	lw	a0,24(sp)
    e5b0:	01c12603          	lw	a2,28(sp)
    e5b4:	00479693          	sll	a3,a5,0x4
    e5b8:	0106e6b3          	or	a3,a3,a6
    e5bc:	01c7d793          	srl	a5,a5,0x1c
    e5c0:	00451813          	sll	a6,a0,0x4
    e5c4:	00461613          	sll	a2,a2,0x4
    e5c8:	01c55513          	srl	a0,a0,0x1c
    e5cc:	00d036b3          	snez	a3,a3
    e5d0:	0107e7b3          	or	a5,a5,a6
    e5d4:	00a66633          	or	a2,a2,a0
    e5d8:	00f6e6b3          	or	a3,a3,a5
    e5dc:	0076f793          	and	a5,a3,7
    e5e0:	02078063          	beqz	a5,e600 <__trunctfdf2+0x1f8>
    e5e4:	00f6f793          	and	a5,a3,15
    e5e8:	00400513          	li	a0,4
    e5ec:	00a78a63          	beq	a5,a0,e600 <__trunctfdf2+0x1f8>
    e5f0:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e5f4:	00d7b6b3          	sltu	a3,a5,a3
    e5f8:	00d60633          	add	a2,a2,a3
    e5fc:	00078693          	mv	a3,a5
    e600:	008007b7          	lui	a5,0x800
    e604:	00f677b3          	and	a5,a2,a5
    e608:	ee0786e3          	beqz	a5,e4f4 <__trunctfdf2+0xec>
    e60c:	00170713          	add	a4,a4,1
    e610:	7ff00793          	li	a5,2047
    e614:	e8f706e3          	beq	a4,a5,e4a0 <__trunctfdf2+0x98>
    e618:	ff8007b7          	lui	a5,0xff800
    e61c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e620:	00f67633          	and	a2,a2,a5
    e624:	7ff77793          	and	a5,a4,2047
    e628:	f49ff06f          	j	e570 <__trunctfdf2+0x168>
    e62c:	00000793          	li	a5,0
    e630:	00000613          	li	a2,0
    e634:	01479793          	sll	a5,a5,0x14
    e638:	01f59593          	sll	a1,a1,0x1f
    e63c:	00c7e7b3          	or	a5,a5,a2
    e640:	00b7e7b3          	or	a5,a5,a1
    e644:	00068513          	mv	a0,a3
    e648:	00078593          	mv	a1,a5
    e64c:	02010113          	add	sp,sp,32
    e650:	00008067          	ret
    e654:	7ff00793          	li	a5,2047
    e658:	00000613          	li	a2,0
    e65c:	01479793          	sll	a5,a5,0x14
    e660:	01f59593          	sll	a1,a1,0x1f
    e664:	00c7e7b3          	or	a5,a5,a2
    e668:	00b7e7b3          	or	a5,a5,a1
    e66c:	00068513          	mv	a0,a3
    e670:	00078593          	mv	a1,a5
    e674:	02010113          	add	sp,sp,32
    e678:	00008067          	ret
    e67c:	fcc00693          	li	a3,-52
    e680:	08d74c63          	blt	a4,a3,e718 <__trunctfdf2+0x310>
    e684:	03d00693          	li	a3,61
    e688:	40e686b3          	sub	a3,a3,a4
    e68c:	01c12703          	lw	a4,28(sp)
    e690:	4056de13          	sra	t3,a3,0x5
    e694:	00080eb7          	lui	t4,0x80
    e698:	00eeeeb3          	or	t4,t4,a4
    e69c:	002e1513          	sll	a0,t3,0x2
    e6a0:	01d12e23          	sw	t4,28(sp)
    e6a4:	01f6f693          	and	a3,a3,31
    e6a8:	00a88833          	add	a6,a7,a0
    e6ac:	00088613          	mv	a2,a7
    e6b0:	00000713          	li	a4,0
    e6b4:	00062303          	lw	t1,0(a2)
    e6b8:	00460613          	add	a2,a2,4
    e6bc:	00676733          	or	a4,a4,t1
    e6c0:	fec81ae3          	bne	a6,a2,e6b4 <__trunctfdf2+0x2ac>
    e6c4:	00300613          	li	a2,3
    e6c8:	41c60633          	sub	a2,a2,t3
    e6cc:	04069a63          	bnez	a3,e720 <__trunctfdf2+0x318>
    e6d0:	00082803          	lw	a6,0(a6)
    e6d4:	00168693          	add	a3,a3,1
    e6d8:	00478793          	add	a5,a5,4
    e6dc:	ff07ae23          	sw	a6,-4(a5)
    e6e0:	00d64e63          	blt	a2,a3,e6fc <__trunctfdf2+0x2f4>
    e6e4:	00a78833          	add	a6,a5,a0
    e6e8:	00082803          	lw	a6,0(a6)
    e6ec:	00168693          	add	a3,a3,1
    e6f0:	00478793          	add	a5,a5,4
    e6f4:	ff07ae23          	sw	a6,-4(a5)
    e6f8:	fed656e3          	bge	a2,a3,e6e4 <__trunctfdf2+0x2dc>
    e6fc:	00400793          	li	a5,4
    e700:	41c787b3          	sub	a5,a5,t3
    e704:	0840006f          	j	e788 <__trunctfdf2+0x380>
    e708:	00000593          	li	a1,0
    e70c:	7ff00793          	li	a5,2047
    e710:	00080637          	lui	a2,0x80
    e714:	d99ff06f          	j	e4ac <__trunctfdf2+0xa4>
    e718:	00000713          	li	a4,0
    e71c:	dd1ff06f          	j	e4ec <__trunctfdf2+0xe4>
    e720:	02050813          	add	a6,a0,32
    e724:	00280833          	add	a6,a6,sp
    e728:	ff082803          	lw	a6,-16(a6)
    e72c:	02000f13          	li	t5,32
    e730:	40df0f33          	sub	t5,t5,a3
    e734:	01e81833          	sll	a6,a6,t5
    e738:	01076733          	or	a4,a4,a6
    e73c:	08060e63          	beqz	a2,e7d8 <__trunctfdf2+0x3d0>
    e740:	00261813          	sll	a6,a2,0x2
    e744:	00f80fb3          	add	t6,a6,a5
    e748:	00a88633          	add	a2,a7,a0
    e74c:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    e750:	00462303          	lw	t1,4(a2)
    e754:	00478793          	add	a5,a5,4
    e758:	00d55533          	srl	a0,a0,a3
    e75c:	01e31333          	sll	t1,t1,t5
    e760:	00656533          	or	a0,a0,t1
    e764:	fea7ae23          	sw	a0,-4(a5)
    e768:	00460613          	add	a2,a2,4
    e76c:	feff90e3          	bne	t6,a5,e74c <__trunctfdf2+0x344>
    e770:	00400793          	li	a5,4
    e774:	41c787b3          	sub	a5,a5,t3
    e778:	02080613          	add	a2,a6,32
    e77c:	00260633          	add	a2,a2,sp
    e780:	00dedeb3          	srl	t4,t4,a3
    e784:	ffd62823          	sw	t4,-16(a2)
    e788:	00400693          	li	a3,4
    e78c:	40f686b3          	sub	a3,a3,a5
    e790:	00269693          	sll	a3,a3,0x2
    e794:	00279793          	sll	a5,a5,0x2
    e798:	00800613          	li	a2,8
    e79c:	00f888b3          	add	a7,a7,a5
    e7a0:	00c6ea63          	bltu	a3,a2,e7b4 <__trunctfdf2+0x3ac>
    e7a4:	0008a023          	sw	zero,0(a7)
    e7a8:	0008a223          	sw	zero,4(a7)
    e7ac:	ff868693          	add	a3,a3,-8
    e7b0:	00888893          	add	a7,a7,8
    e7b4:	00400793          	li	a5,4
    e7b8:	00f6e463          	bltu	a3,a5,e7c0 <__trunctfdf2+0x3b8>
    e7bc:	0008a023          	sw	zero,0(a7)
    e7c0:	01012783          	lw	a5,16(sp)
    e7c4:	00e03733          	snez	a4,a4
    e7c8:	01412603          	lw	a2,20(sp)
    e7cc:	00f766b3          	or	a3,a4,a5
    e7d0:	00000713          	li	a4,0
    e7d4:	e09ff06f          	j	e5dc <__trunctfdf2+0x1d4>
    e7d8:	00100793          	li	a5,1
    e7dc:	00000813          	li	a6,0
    e7e0:	f99ff06f          	j	e778 <__trunctfdf2+0x370>

0000e7e4 <__mulsi3>:
    e7e4:	00050613          	mv	a2,a0
    e7e8:	00000513          	li	a0,0
    e7ec:	0015f693          	and	a3,a1,1
    e7f0:	00068463          	beqz	a3,e7f8 <__mulsi3+0x14>
    e7f4:	00c50533          	add	a0,a0,a2
    e7f8:	0015d593          	srl	a1,a1,0x1
    e7fc:	00161613          	sll	a2,a2,0x1
    e800:	fe0596e3          	bnez	a1,e7ec <__mulsi3+0x8>
    e804:	00008067          	ret

0000e808 <__divsi3>:
    e808:	06054063          	bltz	a0,e868 <__umodsi3+0x10>
    e80c:	0605c663          	bltz	a1,e878 <__umodsi3+0x20>

0000e810 <__hidden___udivsi3>:
    e810:	00058613          	mv	a2,a1
    e814:	00050593          	mv	a1,a0
    e818:	fff00513          	li	a0,-1
    e81c:	02060c63          	beqz	a2,e854 <__hidden___udivsi3+0x44>
    e820:	00100693          	li	a3,1
    e824:	00b67a63          	bgeu	a2,a1,e838 <__hidden___udivsi3+0x28>
    e828:	00c05863          	blez	a2,e838 <__hidden___udivsi3+0x28>
    e82c:	00161613          	sll	a2,a2,0x1
    e830:	00169693          	sll	a3,a3,0x1
    e834:	feb66ae3          	bltu	a2,a1,e828 <__hidden___udivsi3+0x18>
    e838:	00000513          	li	a0,0
    e83c:	00c5e663          	bltu	a1,a2,e848 <__hidden___udivsi3+0x38>
    e840:	40c585b3          	sub	a1,a1,a2
    e844:	00d56533          	or	a0,a0,a3
    e848:	0016d693          	srl	a3,a3,0x1
    e84c:	00165613          	srl	a2,a2,0x1
    e850:	fe0696e3          	bnez	a3,e83c <__hidden___udivsi3+0x2c>
    e854:	00008067          	ret

0000e858 <__umodsi3>:
    e858:	00008293          	mv	t0,ra
    e85c:	fb5ff0ef          	jal	e810 <__hidden___udivsi3>
    e860:	00058513          	mv	a0,a1
    e864:	00028067          	jr	t0
    e868:	40a00533          	neg	a0,a0
    e86c:	00b04863          	bgtz	a1,e87c <__umodsi3+0x24>
    e870:	40b005b3          	neg	a1,a1
    e874:	f9dff06f          	j	e810 <__hidden___udivsi3>
    e878:	40b005b3          	neg	a1,a1
    e87c:	00008293          	mv	t0,ra
    e880:	f91ff0ef          	jal	e810 <__hidden___udivsi3>
    e884:	40a00533          	neg	a0,a0
    e888:	00028067          	jr	t0

0000e88c <__modsi3>:
    e88c:	00008293          	mv	t0,ra
    e890:	0005ca63          	bltz	a1,e8a4 <__modsi3+0x18>
    e894:	00054c63          	bltz	a0,e8ac <__modsi3+0x20>
    e898:	f79ff0ef          	jal	e810 <__hidden___udivsi3>
    e89c:	00058513          	mv	a0,a1
    e8a0:	00028067          	jr	t0
    e8a4:	40b005b3          	neg	a1,a1
    e8a8:	fe0558e3          	bgez	a0,e898 <__modsi3+0xc>
    e8ac:	40a00533          	neg	a0,a0
    e8b0:	f61ff0ef          	jal	e810 <__hidden___udivsi3>
    e8b4:	40b00533          	neg	a0,a1
    e8b8:	00028067          	jr	t0

0000e8bc <__clzsi2>:
    e8bc:	000107b7          	lui	a5,0x10
    e8c0:	02f57a63          	bgeu	a0,a5,e8f4 <__clzsi2+0x38>
    e8c4:	10053793          	sltiu	a5,a0,256
    e8c8:	0017b793          	seqz	a5,a5
    e8cc:	00379793          	sll	a5,a5,0x3
    e8d0:	02000713          	li	a4,32
    e8d4:	40f70733          	sub	a4,a4,a5
    e8d8:	00f55533          	srl	a0,a0,a5
    e8dc:	00001797          	auipc	a5,0x1
    e8e0:	8d478793          	add	a5,a5,-1836 # f1b0 <__clz_tab>
    e8e4:	00a787b3          	add	a5,a5,a0
    e8e8:	0007c503          	lbu	a0,0(a5)
    e8ec:	40a70533          	sub	a0,a4,a0
    e8f0:	00008067          	ret
    e8f4:	010007b7          	lui	a5,0x1000
    e8f8:	02f57463          	bgeu	a0,a5,e920 <__clzsi2+0x64>
    e8fc:	01000793          	li	a5,16
    e900:	00f55533          	srl	a0,a0,a5
    e904:	00001797          	auipc	a5,0x1
    e908:	8ac78793          	add	a5,a5,-1876 # f1b0 <__clz_tab>
    e90c:	00a787b3          	add	a5,a5,a0
    e910:	0007c503          	lbu	a0,0(a5)
    e914:	01000713          	li	a4,16
    e918:	40a70533          	sub	a0,a4,a0
    e91c:	00008067          	ret
    e920:	01800793          	li	a5,24
    e924:	00f55533          	srl	a0,a0,a5
    e928:	00001797          	auipc	a5,0x1
    e92c:	88878793          	add	a5,a5,-1912 # f1b0 <__clz_tab>
    e930:	00a787b3          	add	a5,a5,a0
    e934:	0007c503          	lbu	a0,0(a5)
    e938:	00800713          	li	a4,8
    e93c:	40a70533          	sub	a0,a4,a0
    e940:	00008067          	ret
