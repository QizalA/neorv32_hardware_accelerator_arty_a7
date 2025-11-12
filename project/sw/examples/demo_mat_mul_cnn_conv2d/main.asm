
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_free_r+0x4c>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	dac38393          	add	t2,t2,-596 # fde0 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <g_sink>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <g_sink>
      54:	80007597          	auipc	a1,0x80007
      58:	fa458593          	add	a1,a1,-92 # 80006ff8 <__crt0_bss_end>
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
     110:	1fc40413          	add	s0,s0,508 # f308 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	1f448493          	add	s1,s1,500 # f308 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	1a060613          	add	a2,a2,416 # 2d0 <main>

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
     178:	19440413          	add	s0,s0,404 # f308 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	18c48493          	add	s1,s1,396 # f308 <__fini_array_end>

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
static inline uint64_t rdcycle(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
     1ec:	b80027f3          	csrr	a5,mcycleh
     1f0:	fef59ae3          	bne	a1,a5,1e4 <rdcycle>
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
     1f4:	00008067          	ret

000001f8 <rdinstret>:
static inline uint64_t rdinstret(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
     1f8:	b82025f3          	csrr	a1,minstreth
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
     1fc:	b0202573          	csrr	a0,minstret
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
     200:	b82027f3          	csrr	a5,minstreth
     204:	fef59ae3          	bne	a1,a5,1f8 <rdinstret>
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}
     208:	00008067          	ret

0000020c <print_speedup_fixed>:

/* =======================
   Utility
   ======================= */
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	30850513          	add	a0,a0,776 # f308 <__fini_array_end>
     21c:	7950006f          	j	11b0 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     220:	fe010113          	add	sp,sp,-32
     224:	00812c23          	sw	s0,24(sp)
     228:	00912a23          	sw	s1,20(sp)
     22c:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     230:	00060493          	mv	s1,a2
     234:	00000693          	li	a3,0
     238:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     23c:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     240:	6f50e0ef          	jal	f134 <__muldi3>
     244:	00050793          	mv	a5,a0
     248:	01f41713          	sll	a4,s0,0x1f
     24c:	0014d513          	srl	a0,s1,0x1
     250:	00a76533          	or	a0,a4,a0
     254:	00a78533          	add	a0,a5,a0
     258:	00145713          	srl	a4,s0,0x1
     25c:	00f537b3          	sltu	a5,a0,a5
     260:	00e585b3          	add	a1,a1,a4
     264:	00b785b3          	add	a1,a5,a1
     268:	00048613          	mv	a2,s1
     26c:	00040693          	mv	a3,s0
     270:	6cc0b0ef          	jal	b93c <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	5650b0ef          	jal	bfe8 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	69c0b0ef          	jal	b93c <__udivdi3>
}
     2a4:	01812403          	lw	s0,24(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2a8:	00c12703          	lw	a4,12(sp)
     2ac:	00812783          	lw	a5,8(sp)
}
     2b0:	01c12083          	lw	ra,28(sp)
     2b4:	01412483          	lw	s1,20(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2b8:	00050613          	mv	a2,a0
     2bc:	0000f537          	lui	a0,0xf
     2c0:	00058693          	mv	a3,a1
     2c4:	31450513          	add	a0,a0,788 # f314 <__fini_array_end+0xc>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2cc:	6e50006f          	j	11b0 <printf>

000002d0 <main>:
   Main
   ======================= */
static volatile uint32_t g_sink; /* prevent DCE */

int main(void){
  printf("== Conv2D int8: SW vs CFU vs CFS ==\n");
     2d0:	0000f537          	lui	a0,0xf
int main(void){
     2d4:	f0010113          	add	sp,sp,-256
  printf("== Conv2D int8: SW vs CFU vs CFS ==\n");
     2d8:	33450513          	add	a0,a0,820 # f334 <__fini_array_end+0x2c>
int main(void){
     2dc:	0e112e23          	sw	ra,252(sp)
     2e0:	0e812c23          	sw	s0,248(sp)
     2e4:	0e912a23          	sw	s1,244(sp)
     2e8:	0f212823          	sw	s2,240(sp)
     2ec:	0f312623          	sw	s3,236(sp)
     2f0:	0f412423          	sw	s4,232(sp)
     2f4:	0f512223          	sw	s5,228(sp)
     2f8:	0f612023          	sw	s6,224(sp)
     2fc:	0d712e23          	sw	s7,220(sp)
     300:	0d812c23          	sw	s8,216(sp)
     304:	0d912a23          	sw	s9,212(sp)
     308:	0da12823          	sw	s10,208(sp)
     30c:	0db12623          	sw	s11,204(sp)
  printf("== Conv2D int8: SW vs CFU vs CFS ==\n");
     310:	034010ef          	jal	1344 <puts>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     314:	ffeb07b7          	lui	a5,0xffeb0
     318:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     31c:	0000f537          	lui	a0,0xf
     320:	35850513          	add	a0,a0,856 # f358 <__fini_array_end+0x50>
     324:	68d000ef          	jal	11b0 <printf>
  static int32_t O_sw [Cout][OH][OW];
  static int32_t O_cfu[Cout][OH][OW];
  static int32_t O_cfs[Cout][OH][OW];

  /* Fill inputs/weights with deterministic patterns */
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     328:	80007737          	lui	a4,0x80007
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     32c:	a9870713          	add	a4,a4,-1384 # 80006a98 <IN.7>
     330:	00100613          	li	a2,1
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     334:	01000e93          	li	t4,16
     338:	00500f13          	li	t5,5
     33c:	0ff67e13          	zext.b	t3,a2
     340:	001e1793          	sll	a5,t3,0x1
     344:	ffd78793          	add	a5,a5,-3
     348:	0ff7f793          	zext.b	a5,a5
int main(void){
     34c:	00070513          	mv	a0,a4
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     350:	00000593          	li	a1,0
     354:	0340006f          	j	388 <main+0xb8>
static inline int8_t patt_in (int c, int y, int x){ return (int8_t)(((c+1)*(y+2) + (x-3)) & 0x0F) - 8; }
     358:	00f6f313          	and	t1,a3,15
     35c:	ff830313          	add	t1,t1,-8
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     360:	00168693          	add	a3,a3,1
    IN[c][y][x] = patt_in(c,y,x);
     364:	00688023          	sb	t1,0(a7)
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     368:	0ff6f693          	zext.b	a3,a3
     36c:	00188893          	add	a7,a7,1
     370:	ff0694e3          	bne	a3,a6,358 <main+0x88>
     374:	01c787b3          	add	a5,a5,t3
     378:	00158593          	add	a1,a1,1
     37c:	0ff7f793          	zext.b	a5,a5
     380:	01050513          	add	a0,a0,16
     384:	01d58c63          	beq	a1,t4,39c <main+0xcc>
     388:	01078813          	add	a6,a5,16
int main(void){
     38c:	00050893          	mv	a7,a0
     390:	00078693          	mv	a3,a5
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
     394:	0ff87813          	zext.b	a6,a6
     398:	fc1ff06f          	j	358 <main+0x88>
     39c:	00160613          	add	a2,a2,1
     3a0:	10070713          	add	a4,a4,256
     3a4:	f9e61ce3          	bne	a2,t5,33c <main+0x6c>
     3a8:	00000513          	li	a0,0
     3ac:	00200713          	li	a4,2
     3b0:	800078b7          	lui	a7,0x80007
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cin;++c)
     3b4:	00400313          	li	t1,4
     3b8:	12000e13          	li	t3,288
     3bc:	97888793          	add	a5,a7,-1672 # 80006978 <WGT.6>
     3c0:	00f12423          	sw	a5,8(sp)
     3c4:	00f50833          	add	a6,a0,a5
     3c8:	00000593          	li	a1,0
     3cc:	0580006f          	j	424 <main+0x154>
static inline int8_t patt_wgt(int oc, int c, int ky, int kx){ return (int8_t)(((oc+2)*(ky+1) + (kx-2) + c) & 0x0F) - 8; }
     3d0:	ffe78613          	add	a2,a5,-2
     3d4:	00f67613          	and	a2,a2,15
     3d8:	ff860613          	add	a2,a2,-8
    for(int ky=0;ky<Kh;++ky) for(int kx=0;kx<Kw;++kx)
      WGT[oc][c][ky][kx] = patt_wgt(oc,c,ky,kx);
     3dc:	00c68023          	sb	a2,0(a3)
static inline int8_t patt_wgt(int oc, int c, int ky, int kx){ return (int8_t)(((oc+2)*(ky+1) + (kx-2) + c) & 0x0F) - 8; }
     3e0:	fff78613          	add	a2,a5,-1
     3e4:	00f67613          	and	a2,a2,15
     3e8:	ff860613          	add	a2,a2,-8
      WGT[oc][c][ky][kx] = patt_wgt(oc,c,ky,kx);
     3ec:	00c680a3          	sb	a2,1(a3)
static inline int8_t patt_wgt(int oc, int c, int ky, int kx){ return (int8_t)(((oc+2)*(ky+1) + (kx-2) + c) & 0x0F) - 8; }
     3f0:	00f7f613          	and	a2,a5,15
     3f4:	ff860613          	add	a2,a2,-8
      WGT[oc][c][ky][kx] = patt_wgt(oc,c,ky,kx);
     3f8:	00c68123          	sb	a2,2(a3)
    for(int ky=0;ky<Kh;++ky) for(int kx=0;kx<Kw;++kx)
     3fc:	00412603          	lw	a2,4(sp)
     400:	00e787b3          	add	a5,a5,a4
     404:	0ff7f793          	zext.b	a5,a5
     408:	fff60613          	add	a2,a2,-1
     40c:	00c12223          	sw	a2,4(sp)
     410:	00368693          	add	a3,a3,3
     414:	fa061ee3          	bnez	a2,3d0 <main+0x100>
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cin;++c)
     418:	00158593          	add	a1,a1,1
     41c:	00980813          	add	a6,a6,9
     420:	00658e63          	beq	a1,t1,43c <main+0x16c>
    for(int ky=0;ky<Kh;++ky) for(int kx=0;kx<Kw;++kx)
     424:	00b707b3          	add	a5,a4,a1
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     428:	00300613          	li	a2,3
     42c:	0ff7f793          	zext.b	a5,a5
     430:	00080693          	mv	a3,a6
     434:	00c12223          	sw	a2,4(sp)
     438:	f99ff06f          	j	3d0 <main+0x100>
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cin;++c)
     43c:	00170713          	add	a4,a4,1
     440:	02450513          	add	a0,a0,36
     444:	0ff77713          	zext.b	a4,a4
     448:	f7c51ae3          	bne	a0,t3,3bc <main+0xec>

  /* SW */
  __asm__ volatile("" ::: "memory");
  uint64_t c0=rdcycle(), i0=rdinstret();
     44c:	d99ff0ef          	jal	1e4 <rdcycle>
     450:	00050d13          	mv	s10,a0
     454:	00058c93          	mv	s9,a1
     458:	da1ff0ef          	jal	1f8 <rdinstret>
     45c:	00812d83          	lw	s11,8(sp)
     460:	80005937          	lui	s2,0x80005
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     464:	00020737          	lui	a4,0x20
  uint64_t c0=rdcycle(), i0=rdinstret();
     468:	00050c13          	mv	s8,a0
     46c:	00058b93          	mv	s7,a1
  for(int oc=0; oc<Cout; ++oc){
     470:	97890913          	add	s2,s2,-1672 # 80004978 <O_sw.5>
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     474:	00f00313          	li	t1,15
     478:	00170713          	add	a4,a4,1 # 20001 <__neorv32_rom_size+0x1>
    for(int oy=0; oy<OH; ++oy){
     47c:	00000413          	li	s0,0
     480:	0f40006f          	j	574 <main+0x2a4>
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     484:	00000593          	li	a1,0
     488:	01436c63          	bltu	t1,s4,4a0 <main+0x1d0>
              int ix = ox*STR + kx - PAD;
     48c:	009a8533          	add	a0,s5,s1
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     490:	00a75533          	srl	a0,a4,a0
     494:	00157513          	and	a0,a0,1
     498:	00051463          	bnez	a0,4a0 <main+0x1d0>
     49c:	fefb0583          	lb	a1,-17(s6)
              int8_t b = w[oc][c][ky][kx];
     4a0:	01580533          	add	a0,a6,s5
              acc += (int32_t)a * (int32_t)b;
     4a4:	00050503          	lb	a0,0(a0)
     4a8:	02e12223          	sw	a4,36(sp)
     4ac:	02512023          	sw	t0,32(sp)
     4b0:	01f12e23          	sw	t6,28(sp)
     4b4:	00c12c23          	sw	a2,24(sp)
     4b8:	00f12a23          	sw	a5,20(sp)
     4bc:	00d12823          	sw	a3,16(sp)
              int8_t b = w[oc][c][ky][kx];
     4c0:	01012623          	sw	a6,12(sp)
              acc += (int32_t)a * (int32_t)b;
     4c4:	44d0e0ef          	jal	f110 <__mulsi3>
     4c8:	01012683          	lw	a3,16(sp)
            for(int kx=0; kx<Kw; ++kx){
     4cc:	80007737          	lui	a4,0x80007
     4d0:	001a8a93          	add	s5,s5,1
     4d4:	00300e13          	li	t3,3
     4d8:	a9870893          	add	a7,a4,-1384 # 80006a98 <IN.7>
     4dc:	00c12803          	lw	a6,12(sp)
     4e0:	01412783          	lw	a5,20(sp)
     4e4:	01812603          	lw	a2,24(sp)
     4e8:	01c12f83          	lw	t6,28(sp)
     4ec:	02012283          	lw	t0,32(sp)
     4f0:	02412703          	lw	a4,36(sp)
              acc += (int32_t)a * (int32_t)b;
     4f4:	00a686b3          	add	a3,a3,a0
            for(int kx=0; kx<Kw; ++kx){
     4f8:	001b0b13          	add	s6,s6,1
     4fc:	00f00313          	li	t1,15
     500:	02400e93          	li	t4,36
     504:	01000f13          	li	t5,16
     508:	f7ca9ee3          	bne	s5,t3,484 <main+0x1b4>
          for(int ky=0; ky<Kh; ++ky)
     50c:	001a0a13          	add	s4,s4,1
     510:	00380813          	add	a6,a6,3
     514:	01fa0a63          	beq	s4,t6,528 <main+0x258>
            for(int kx=0; kx<Kw; ++kx){
     518:	004a1b13          	sll	s6,s4,0x4
     51c:	01628b33          	add	s6,t0,s6
     520:	00000a93          	li	s5,0
     524:	f61ff06f          	j	484 <main+0x1b4>
        for(int c=0; c<Cin; ++c)
     528:	00978793          	add	a5,a5,9
     52c:	10060613          	add	a2,a2,256
     530:	01d78a63          	beq	a5,t4,544 <main+0x274>
          for(int ky=0; ky<Kh; ++ky)
     534:	01b78833          	add	a6,a5,s11
     538:	fff40a13          	add	s4,s0,-1
     53c:	01060293          	add	t0,a2,16
     540:	fd9ff06f          	j	518 <main+0x248>
        out[oc][oy][ox] = acc;
     544:	00d9a023          	sw	a3,0(s3)
      for(int ox=0; ox<OW; ++ox){
     548:	00148493          	add	s1,s1,1
     54c:	00498993          	add	s3,s3,4
     550:	01e48e63          	beq	s1,t5,56c <main+0x29c>
        for(int c=0; c<Cin; ++c)
     554:	800077b7          	lui	a5,0x80007
     558:	a9878793          	add	a5,a5,-1384 # 80006a98 <IN.7>
     55c:	00f48633          	add	a2,s1,a5
        int32_t acc=0;
     560:	00000693          	li	a3,0
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     564:	00000793          	li	a5,0
     568:	fcdff06f          	j	534 <main+0x264>
    for(int oy=0; oy<OH; ++oy){
     56c:	00140413          	add	s0,s0,1
     570:	00940c63          	beq	s0,s1,588 <main+0x2b8>
      for(int ox=0; ox<OW; ++ox){
     574:	00641993          	sll	s3,s0,0x6
     578:	012989b3          	add	s3,s3,s2
     57c:	00000493          	li	s1,0
          for(int ky=0; ky<Kh; ++ky)
     580:	00240f93          	add	t6,s0,2
     584:	fd1ff06f          	j	554 <main+0x284>
  for(int oc=0; oc<Cout; ++oc){
     588:	024d8d93          	add	s11,s11,36
     58c:	40090913          	add	s2,s2,1024
     590:	ef1d96e3          	bne	s11,a7,47c <main+0x1ac>
  conv2d_sw(IN, WGT, O_sw);
  uint64_t i1=rdinstret(), c1=rdcycle();
     594:	c65ff0ef          	jal	1f8 <rdinstret>
     598:	00050413          	mv	s0,a0
     59c:	00058493          	mv	s1,a1
     5a0:	c45ff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0; g_sink ^= (uint32_t)sw_cyc;
     5a4:	41a507b3          	sub	a5,a0,s10
     5a8:	00f53533          	sltu	a0,a0,a5
     5ac:	419585b3          	sub	a1,a1,s9
     5b0:	00f12623          	sw	a5,12(sp)
     5b4:	40a587b3          	sub	a5,a1,a0
     5b8:	02f12023          	sw	a5,32(sp)
     5bc:	418407b3          	sub	a5,s0,s8
     5c0:	00f43433          	sltu	s0,s0,a5
     5c4:	417484b3          	sub	s1,s1,s7
     5c8:	80000737          	lui	a4,0x80000
     5cc:	00f12823          	sw	a5,16(sp)
     5d0:	408487b3          	sub	a5,s1,s0
     5d4:	00c12683          	lw	a3,12(sp)
     5d8:	02f12223          	sw	a5,36(sp)
     5dc:	71472783          	lw	a5,1812(a4) # 80000714 <g_sink>
     5e0:	00d7c7b3          	xor	a5,a5,a3
     5e4:	70f72a23          	sw	a5,1812(a4)

  /* CFU */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
     5e8:	bfdff0ef          	jal	1e4 <rdcycle>
     5ec:	04a12823          	sw	a0,80(sp)
     5f0:	04b12a23          	sw	a1,84(sp)
     5f4:	c05ff0ef          	jal	1f8 <rdinstret>
     5f8:	04a12c23          	sw	a0,88(sp)
     5fc:	04b12e23          	sw	a1,92(sp)
     600:	00000413          	li	s0,0
     604:	800019b7          	lui	s3,0x80001
    for(int c=0;c<Cin;++c)
     608:	02400a13          	li	s4,36
  for(int oc=0; oc<Cout; ++oc){
     60c:	12000a93          	li	s5,288
          wflat[oc][idx++] = w[oc][c][ky][kx];
     610:	00812783          	lw	a5,8(sp)
    int idx=0;
     614:	00000493          	li	s1,0
          wflat[oc][idx++] = w[oc][c][ky][kx];
     618:	00f40933          	add	s2,s0,a5
      for(int ky=0;ky<Kh;++ky)
     61c:	85898c93          	add	s9,s3,-1960 # 80000858 <wflat.2>
          wflat[oc][idx++] = w[oc][c][ky][kx];
     620:	008c8533          	add	a0,s9,s0
     624:	009905b3          	add	a1,s2,s1
     628:	00950533          	add	a0,a0,s1
     62c:	00900613          	li	a2,9
     630:	00948493          	add	s1,s1,9
     634:	60d000ef          	jal	1440 <memcpy>
    for(int c=0;c<Cin;++c)
     638:	ff4492e3          	bne	s1,s4,61c <main+0x34c>
  for(int oc=0; oc<Cout; ++oc){
     63c:	02440413          	add	s0,s0,36
     640:	fd5418e3          	bne	s0,s5,610 <main+0x340>
     644:	800037b7          	lui	a5,0x80003
     648:	97878d93          	add	s11,a5,-1672 # 80002978 <O_cfu.4>
     64c:	000027b7          	lui	a5,0x2
     650:	00fd87b3          	add	a5,s11,a5
     654:	04f12623          	sw	a5,76(sp)
          int8_t a0=(iy0>=0&&iy0<H&&ix0>=0&&ix0<W)? in[c0][iy0][ix0]:0;
     658:	800077b7          	lui	a5,0x80007
     65c:	00020b37          	lui	s6,0x20
     660:	a9878793          	add	a5,a5,-1384 # 80006a98 <IN.7>
     664:	00f00d13          	li	s10,15
     668:	001b0b13          	add	s6,s6,1 # 20001 <__neorv32_rom_size+0x1>
     66c:	00f12a23          	sw	a5,20(sp)
    for(int oy=0; oy<OH; ++oy){
     670:	00000413          	li	s0,0
     674:	2a00006f          	j	914 <main+0x644>
          int8_t  wb0 = wflat[oc][k+0];
     678:	000b8783          	lb	a5,0(s7)
          int rem = tmp % (Kh*Kw);
     67c:	00900593          	li	a1,9
     680:	00090513          	mv	a0,s2
          int8_t  wb0 = wflat[oc][k+0];
     684:	02f12e23          	sw	a5,60(sp)
          int8_t  wb1 = wflat[oc][k+1];
     688:	001b8783          	lb	a5,1(s7)
     68c:	04f12023          	sw	a5,64(sp)
          int8_t  wb2 = wflat[oc][k+2];
     690:	002b8783          	lb	a5,2(s7)
     694:	04f12223          	sw	a5,68(sp)
          int8_t  wb3 = wflat[oc][k+3];
     698:	00390793          	add	a5,s2,3
     69c:	02f12423          	sw	a5,40(sp)
     6a0:	003b8783          	lb	a5,3(s7)
     6a4:	04f12423          	sw	a5,72(sp)
          int rem = tmp % (Kh*Kw);
     6a8:	3a90e0ef          	jal	f250 <__modsi3>
     6ac:	00050c13          	mv	s8,a0
          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
     6b0:	00900593          	li	a1,9
     6b4:	00190513          	add	a0,s2,1
     6b8:	3990e0ef          	jal	f250 <__modsi3>
     6bc:	02a12423          	sw	a0,40(sp)
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
     6c0:	00900593          	li	a1,9
     6c4:	00290513          	add	a0,s2,2
     6c8:	3890e0ef          	jal	f250 <__modsi3>
     6cc:	02a12623          	sw	a0,44(sp)
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;
     6d0:	00900593          	li	a1,9
     6d4:	00390513          	add	a0,s2,3
     6d8:	3790e0ef          	jal	f250 <__modsi3>
     6dc:	02a12823          	sw	a0,48(sp)
          int ky0 = rem / Kw;
     6e0:	00300593          	li	a1,3
     6e4:	000c0513          	mv	a0,s8
     6e8:	2e50e0ef          	jal	f1cc <__divsi3>
          int iy0=oy*STR+ky0-PAD, ix0=ox*STR+kx0-PAD;
     6ec:	00850ab3          	add	s5,a0,s0
          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
     6f0:	02812503          	lw	a0,40(sp)
     6f4:	00300593          	li	a1,3
          int iy0=oy*STR+ky0-PAD, ix0=ox*STR+kx0-PAD;
     6f8:	fffa8a93          	add	s5,s5,-1
          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
     6fc:	2d10e0ef          	jal	f1cc <__divsi3>
          int iy1=oy*STR+ky1-PAD, ix1=ox*STR+kx1-PAD;
     700:	00850a33          	add	s4,a0,s0
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
     704:	02c12503          	lw	a0,44(sp)
     708:	00300593          	li	a1,3
          int iy1=oy*STR+ky1-PAD, ix1=ox*STR+kx1-PAD;
     70c:	fffa0a13          	add	s4,s4,-1
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
     710:	2bd0e0ef          	jal	f1cc <__divsi3>
          int iy2=oy*STR+ky2-PAD, ix2=ox*STR+kx2-PAD;
     714:	008509b3          	add	s3,a0,s0
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;
     718:	03012503          	lw	a0,48(sp)
     71c:	00300593          	li	a1,3
          int iy2=oy*STR+ky2-PAD, ix2=ox*STR+kx2-PAD;
     720:	fff98993          	add	s3,s3,-1
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;
     724:	2a90e0ef          	jal	f1cc <__divsi3>
          int iy3=oy*STR+ky3-PAD, ix3=ox*STR+kx3-PAD;
     728:	00850533          	add	a0,a0,s0
     72c:	fff50793          	add	a5,a0,-1
     730:	02f12a23          	sw	a5,52(sp)
          int8_t a0=(iy0>=0&&iy0<H&&ix0>=0&&ix0<W)? in[c0][iy0][ix0]:0;
     734:	02012c23          	sw	zero,56(sp)
     738:	055d6663          	bltu	s10,s5,784 <main+0x4b4>
          int kx0 = rem % Kw;
     73c:	000c0513          	mv	a0,s8
     740:	00300593          	li	a1,3
     744:	30d0e0ef          	jal	f250 <__modsi3>
          int iy0=oy*STR+ky0-PAD, ix0=ox*STR+kx0-PAD;
     748:	00950c33          	add	s8,a0,s1
          int8_t a0=(iy0>=0&&iy0<H&&ix0>=0&&ix0<W)? in[c0][iy0][ix0]:0;
     74c:	018b57b3          	srl	a5,s6,s8
     750:	0017f793          	and	a5,a5,1
     754:	02079863          	bnez	a5,784 <main+0x4b4>
          int c0  = tmp / (Kh*Kw);
     758:	00900593          	li	a1,9
     75c:	00090513          	mv	a0,s2
     760:	26d0e0ef          	jal	f1cc <__divsi3>
          int8_t a0=(iy0>=0&&iy0<H&&ix0>=0&&ix0<W)? in[c0][iy0][ix0]:0;
     764:	01412703          	lw	a4,20(sp)
     768:	00851793          	sll	a5,a0,0x8
     76c:	004a9a93          	sll	s5,s5,0x4
     770:	00e787b3          	add	a5,a5,a4
     774:	015787b3          	add	a5,a5,s5
     778:	018787b3          	add	a5,a5,s8
     77c:	fff78783          	lb	a5,-1(a5)
     780:	02f12c23          	sw	a5,56(sp)
          int8_t a1=(iy1>=0&&iy1<H&&ix1>=0&&ix1<W)? in[c1][iy1][ix1]:0;
     784:	00000a93          	li	s5,0
     788:	054d6463          	bltu	s10,s4,7d0 <main+0x500>
          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
     78c:	02812503          	lw	a0,40(sp)
     790:	00300593          	li	a1,3
     794:	2bd0e0ef          	jal	f250 <__modsi3>
          int iy1=oy*STR+ky1-PAD, ix1=ox*STR+kx1-PAD;
     798:	00950c33          	add	s8,a0,s1
          int8_t a1=(iy1>=0&&iy1<H&&ix1>=0&&ix1<W)? in[c1][iy1][ix1]:0;
     79c:	018b57b3          	srl	a5,s6,s8
     7a0:	0017f793          	and	a5,a5,1
     7a4:	02079663          	bnez	a5,7d0 <main+0x500>
          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
     7a8:	00900593          	li	a1,9
     7ac:	00190513          	add	a0,s2,1
     7b0:	21d0e0ef          	jal	f1cc <__divsi3>
          int8_t a1=(iy1>=0&&iy1<H&&ix1>=0&&ix1<W)? in[c1][iy1][ix1]:0;
     7b4:	01412703          	lw	a4,20(sp)
     7b8:	00851793          	sll	a5,a0,0x8
     7bc:	004a1a13          	sll	s4,s4,0x4
     7c0:	00e787b3          	add	a5,a5,a4
     7c4:	014787b3          	add	a5,a5,s4
     7c8:	018787b3          	add	a5,a5,s8
     7cc:	fff78a83          	lb	s5,-1(a5)
          int8_t a2=(iy2>=0&&iy2<H&&ix2>=0&&ix2<W)? in[c2][iy2][ix2]:0;
     7d0:	00000a13          	li	s4,0
     7d4:	053d6463          	bltu	s10,s3,81c <main+0x54c>
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
     7d8:	02c12503          	lw	a0,44(sp)
     7dc:	00300593          	li	a1,3
     7e0:	2710e0ef          	jal	f250 <__modsi3>
          int iy2=oy*STR+ky2-PAD, ix2=ox*STR+kx2-PAD;
     7e4:	00950c33          	add	s8,a0,s1
          int8_t a2=(iy2>=0&&iy2<H&&ix2>=0&&ix2<W)? in[c2][iy2][ix2]:0;
     7e8:	018b57b3          	srl	a5,s6,s8
     7ec:	0017f793          	and	a5,a5,1
     7f0:	02079663          	bnez	a5,81c <main+0x54c>
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
     7f4:	00900593          	li	a1,9
     7f8:	00290513          	add	a0,s2,2
     7fc:	1d10e0ef          	jal	f1cc <__divsi3>
          int8_t a2=(iy2>=0&&iy2<H&&ix2>=0&&ix2<W)? in[c2][iy2][ix2]:0;
     800:	01412703          	lw	a4,20(sp)
     804:	00851793          	sll	a5,a0,0x8
     808:	00499993          	sll	s3,s3,0x4
     80c:	00e787b3          	add	a5,a5,a4
     810:	013787b3          	add	a5,a5,s3
     814:	018787b3          	add	a5,a5,s8
     818:	fff78a03          	lb	s4,-1(a5)
          int8_t a3=(iy3>=0&&iy3<H&&ix3>=0&&ix3<W)? in[c3][iy3][ix3]:0;
     81c:	03412783          	lw	a5,52(sp)
     820:	00000993          	li	s3,0
     824:	04fd6663          	bltu	s10,a5,870 <main+0x5a0>
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;
     828:	03012503          	lw	a0,48(sp)
     82c:	00300593          	li	a1,3
     830:	2210e0ef          	jal	f250 <__modsi3>
          int iy3=oy*STR+ky3-PAD, ix3=ox*STR+kx3-PAD;
     834:	00950c33          	add	s8,a0,s1
          int8_t a3=(iy3>=0&&iy3<H&&ix3>=0&&ix3<W)? in[c3][iy3][ix3]:0;
     838:	018b57b3          	srl	a5,s6,s8
     83c:	0017f793          	and	a5,a5,1
     840:	02079863          	bnez	a5,870 <main+0x5a0>
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;
     844:	00900593          	li	a1,9
     848:	00390513          	add	a0,s2,3
     84c:	1810e0ef          	jal	f1cc <__divsi3>
          int8_t a3=(iy3>=0&&iy3<H&&ix3>=0&&ix3<W)? in[c3][iy3][ix3]:0;
     850:	01412703          	lw	a4,20(sp)
     854:	00851793          	sll	a5,a0,0x8
     858:	00e787b3          	add	a5,a5,a4
     85c:	03412703          	lw	a4,52(sp)
     860:	00471713          	sll	a4,a4,0x4
     864:	00e787b3          	add	a5,a5,a4
     868:	018787b3          	add	a5,a5,s8
     86c:	fff78983          	lb	s3,-1(a5)
  return  ((uint32_t)(uint8_t)x0)        |
     870:	03814703          	lbu	a4,56(sp)
         (((uint32_t)(uint8_t)x1) << 8)  |
     874:	0ffaf793          	zext.b	a5,s5
     878:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     87c:	04414683          	lbu	a3,68(sp)
  return  ((uint32_t)(uint8_t)x0)        |
     880:	00e7e7b3          	or	a5,a5,a4
         (((uint32_t)(uint8_t)x1) << 8)  |
     884:	04014703          	lbu	a4,64(sp)
         (((uint32_t)(uint8_t)x2) << 16) |
     888:	01069693          	sll	a3,a3,0x10
     88c:	0ffa7a13          	zext.b	s4,s4
         (((uint32_t)(uint8_t)x1) << 8)  |
     890:	00871713          	sll	a4,a4,0x8
     894:	00d76733          	or	a4,a4,a3
  return  ((uint32_t)(uint8_t)x0)        |
     898:	03c14683          	lbu	a3,60(sp)
         (((uint32_t)(uint8_t)x2) << 16) |
     89c:	010a1a13          	sll	s4,s4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     8a0:	0147e7b3          	or	a5,a5,s4
     8a4:	00d76733          	or	a4,a4,a3
         (((uint32_t)(uint8_t)x3) << 24);
     8a8:	04812683          	lw	a3,72(sp)
     8ac:	01899993          	sll	s3,s3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     8b0:	0137e7b3          	or	a5,a5,s3
         (((uint32_t)(uint8_t)x3) << 24);
     8b4:	01869693          	sll	a3,a3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     8b8:	00d76733          	or	a4,a4,a3
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     8bc:	02e7878b          	.insn	4, 0x02e7878b
          acc += cfu_dp4a((int32_t)ap, (int32_t)bp);
     8c0:	01c12703          	lw	a4,28(sp)
        for(; k+3<K; k+=4){
     8c4:	00490913          	add	s2,s2,4
     8c8:	004b8b93          	add	s7,s7,4
          acc += cfu_dp4a((int32_t)ap, (int32_t)bp);
     8cc:	00f707b3          	add	a5,a4,a5
     8d0:	00f12e23          	sw	a5,28(sp)
        for(; k+3<K; k+=4){
     8d4:	02400793          	li	a5,36
     8d8:	daf910e3          	bne	s2,a5,678 <main+0x3a8>
        out[oc][oy][ox]=acc;
     8dc:	01812783          	lw	a5,24(sp)
     8e0:	01c12703          	lw	a4,28(sp)
      for(int ox=0; ox<OW; ++ox){
     8e4:	00148493          	add	s1,s1,1
     8e8:	00478793          	add	a5,a5,4
        out[oc][oy][ox]=acc;
     8ec:	fee7ae23          	sw	a4,-4(a5)
      for(int ox=0; ox<OW; ++ox){
     8f0:	00f12c23          	sw	a5,24(sp)
     8f4:	01000793          	li	a5,16
     8f8:	00f48a63          	beq	s1,a5,90c <main+0x63c>
  c0=rdcycle(); i0=rdinstret();
     8fc:	000c8b93          	mv	s7,s9
        int32_t acc=0;
     900:	00012e23          	sw	zero,28(sp)
        int k=0;
     904:	00000913          	li	s2,0
     908:	d71ff06f          	j	678 <main+0x3a8>
    for(int oy=0; oy<OH; ++oy){
     90c:	00140413          	add	s0,s0,1
     910:	00940c63          	beq	s0,s1,928 <main+0x658>
      for(int ox=0; ox<OW; ++ox){
     914:	00641793          	sll	a5,s0,0x6
     918:	01b787b3          	add	a5,a5,s11
     91c:	00f12c23          	sw	a5,24(sp)
     920:	00000493          	li	s1,0
     924:	fd9ff06f          	j	8fc <main+0x62c>
  for(int oc=0; oc<Cout; ++oc){
     928:	04c12783          	lw	a5,76(sp)
     92c:	400d8d93          	add	s11,s11,1024
     930:	024c8c93          	add	s9,s9,36
     934:	d2fd9ee3          	bne	s11,a5,670 <main+0x3a0>
  conv2d_cfu(IN, WGT, O_cfu);
  i1=rdinstret(); c1=rdcycle();
     938:	8c1ff0ef          	jal	1f8 <rdinstret>
     93c:	00050493          	mv	s1,a0
     940:	00058913          	mv	s2,a1
     944:	8a1ff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0; g_sink ^= (uint32_t)cfu_cyc;
     948:	05012783          	lw	a5,80(sp)
     94c:	80000737          	lui	a4,0x80000
     950:	40f509b3          	sub	s3,a0,a5
     954:	05412783          	lw	a5,84(sp)
     958:	01353533          	sltu	a0,a0,s3
     95c:	40f58433          	sub	s0,a1,a5
     960:	40a407b3          	sub	a5,s0,a0
     964:	00f12a23          	sw	a5,20(sp)
     968:	05812783          	lw	a5,88(sp)
     96c:	40f48a33          	sub	s4,s1,a5
     970:	05c12783          	lw	a5,92(sp)
     974:	0144b4b3          	sltu	s1,s1,s4
     978:	40f90933          	sub	s2,s2,a5
     97c:	409907b3          	sub	a5,s2,s1
     980:	00f12c23          	sw	a5,24(sp)
     984:	71472783          	lw	a5,1812(a4) # 80000714 <g_sink>
     988:	0137c7b3          	xor	a5,a5,s3
     98c:	70f72a23          	sw	a5,1812(a4)

  /* CFS */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
     990:	855ff0ef          	jal	1e4 <rdcycle>
     994:	00a12e23          	sw	a0,28(sp)
     998:	02b12423          	sw	a1,40(sp)
     99c:	85dff0ef          	jal	1f8 <rdinstret>
     9a0:	80001937          	lui	s2,0x80001
     9a4:	800007b7          	lui	a5,0x80000
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     9a8:	00020b37          	lui	s6,0x20
  c0=rdcycle(); i0=rdinstret();
     9ac:	02a12623          	sw	a0,44(sp)
     9b0:	02b12823          	sw	a1,48(sp)
  for(int oc0=0; oc0<Cout; oc0+=4){
     9b4:	97890913          	add	s2,s2,-1672 # 80000978 <O_cfs.3>
     9b8:	00000d93          	li	s11,0
     9bc:	7c878413          	add	s0,a5,1992 # 800007c8 <Aflat.1>
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     9c0:	001b0b13          	add	s6,s6,1 # 20001 <__neorv32_rom_size+0x1>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     9c4:	ffeb0ab7          	lui	s5,0xffeb0
    for(int j0=0; j0<NPOS; j0+=4){
     9c8:	00000493          	li	s1,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     9cc:	004a8a93          	add	s5,s5,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     9d0:	2440006f          	j	c14 <main+0x944>
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     9d4:	00000f13          	li	t5,0
     9d8:	02c2e063          	bltu	t0,a2,9f8 <main+0x728>
     9dc:	00ab5e33          	srl	t3,s6,a0
     9e0:	001e7e13          	and	t3,t3,1
     9e4:	000e1a63          	bnez	t3,9f8 <main+0x728>
     9e8:	00461e13          	sll	t3,a2,0x4
     9ec:	017e0e33          	add	t3,t3,s7
     9f0:	00ae0e33          	add	t3,t3,a0
     9f4:	fefe0f03          	lb	t5,-17(t3)
          Bflat[idx*ldb + s] = a;
     9f8:	01e78023          	sb	t5,0(a5)
        for(int kx=0;kx<Kw;++kx){
     9fc:	00150513          	add	a0,a0,1
     a00:	00478793          	add	a5,a5,4
     a04:	fcac98e3          	bne	s9,a0,9d4 <main+0x704>
      for(int ky=0;ky<Kh;++ky)
     a08:	00160613          	add	a2,a2,1
     a0c:	00330313          	add	t1,t1,3
     a10:	02cc0063          	beq	s8,a2,a30 <main+0x760>
        for(int kx=0;kx<Kw;++kx){
     a14:	800007b7          	lui	a5,0x80000
     a18:	73878713          	add	a4,a5,1848 # 80000738 <Bflat.0>
     a1c:	00e68533          	add	a0,a3,a4
     a20:	00231793          	sll	a5,t1,0x2
     a24:	00a787b3          	add	a5,a5,a0
  for(int s=0; s<4; ++s){
     a28:	00058513          	mv	a0,a1
     a2c:	fa9ff06f          	j	9d4 <main+0x704>
     a30:	00980813          	add	a6,a6,9
    for(int c=0;c<Cin;++c)
     a34:	10088893          	add	a7,a7,256
     a38:	24781c63          	bne	a6,t2,c90 <main+0x9c0>
  for(int s=0; s<4; ++s){
     a3c:	00168693          	add	a3,a3,1
     a40:	23f69863          	bne	a3,t6,c70 <main+0x9a0>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     a44:	ffeb07b7          	lui	a5,0xffeb0
     a48:	00200693          	li	a3,2
     a4c:	00d7a023          	sw	a3,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     a50:	0007a783          	lw	a5,0(a5)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     a54:	ffeb0eb7          	lui	t4,0xffeb0
     a58:	ffeb0e37          	lui	t3,0xffeb0
     a5c:	ffeb0337          	lui	t1,0xffeb0
     a60:	ffeb08b7          	lui	a7,0xffeb0
     a64:	ffeb0837          	lui	a6,0xffeb0
     a68:	ffeb0537          	lui	a0,0xffeb0
     a6c:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0; s<T; ++s){
     a70:	00000793          	li	a5,0
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<Klen)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     a74:	02300293          	li	t0,35
     a78:	00400393          	li	t2,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     a7c:	ffeb0fb7          	lui	t6,0xffeb0
     a80:	008e8e93          	add	t4,t4,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     a84:	00ce0e13          	add	t3,t3,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     a88:	01030313          	add	t1,t1,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     a8c:	01488893          	add	a7,a7,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     a90:	01880813          	add	a6,a6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     a94:	01c50513          	add	a0,a0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     a98:	02058593          	add	a1,a1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     a9c:	00100c13          	li	s8,1
  for(int s=0; s<T; ++s){
     aa0:	02a00b93          	li	s7,42
    uint32_t Aw[4]={0}, Bw[4]={0};
     aa4:	06012023          	sw	zero,96(sp)
     aa8:	06012223          	sw	zero,100(sp)
     aac:	06012423          	sw	zero,104(sp)
     ab0:	06012623          	sw	zero,108(sp)
     ab4:	06012823          	sw	zero,112(sp)
     ab8:	06012a23          	sw	zero,116(sp)
     abc:	06012c23          	sw	zero,120(sp)
     ac0:	06012e23          	sw	zero,124(sp)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<Klen)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     ac4:	06010c93          	add	s9,sp,96
     ac8:	00f40f33          	add	t5,s0,a5
     acc:	00000693          	li	a3,0
     ad0:	40d78d33          	sub	s10,a5,a3
     ad4:	00000613          	li	a2,0
     ad8:	01a2e463          	bltu	t0,s10,ae0 <main+0x810>
     adc:	000f0603          	lb	a2,0(t5)
     ae0:	0ff67613          	zext.b	a2,a2
     ae4:	00cca023          	sw	a2,0(s9)
     ae8:	00168693          	add	a3,a3,1
     aec:	004c8c93          	add	s9,s9,4
     af0:	023f0f13          	add	t5,t5,35
     af4:	fc769ee3          	bne	a3,t2,ad0 <main+0x800>
     af8:	07010c93          	add	s9,sp,112
     afc:	00070f13          	mv	t5,a4
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<Klen)? Bflat[k*ldb+j] : 0; Bw[j]=(uint32_t)(uint8_t)b; }
     b00:	00000693          	li	a3,0
     b04:	40d78d33          	sub	s10,a5,a3
     b08:	00000613          	li	a2,0
     b0c:	01a2e463          	bltu	t0,s10,b14 <main+0x844>
     b10:	000f0603          	lb	a2,0(t5)
     b14:	0ff67613          	zext.b	a2,a2
     b18:	00cca023          	sw	a2,0(s9)
     b1c:	00168693          	add	a3,a3,1
     b20:	004c8c93          	add	s9,s9,4
     b24:	ffdf0f13          	add	t5,t5,-3
     b28:	fc769ee3          	bne	a3,t2,b04 <main+0x834>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     b2c:	06012683          	lw	a3,96(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b30:	00daa023          	sw	a3,0(s5)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     b34:	06412683          	lw	a3,100(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b38:	00dea023          	sw	a3,0(t4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     b3c:	06812683          	lw	a3,104(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b40:	00de2023          	sw	a3,0(t3)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     b44:	06c12683          	lw	a3,108(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b48:	00d32023          	sw	a3,0(t1)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     b4c:	07012683          	lw	a3,112(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b50:	00d8a023          	sw	a3,0(a7)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     b54:	07412683          	lw	a3,116(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b58:	00d82023          	sw	a3,0(a6)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     b5c:	07812683          	lw	a3,120(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b60:	00d52023          	sw	a3,0(a0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     b64:	07c12683          	lw	a3,124(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b68:	00d5a023          	sw	a3,0(a1)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     b6c:	000fa683          	lw	a3,0(t6) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b70:	018fa023          	sw	s8,0(t6)
  for(int s=0; s<T; ++s){
     b74:	00178793          	add	a5,a5,1
     b78:	00470713          	add	a4,a4,4
     b7c:	f37794e3          	bne	a5,s7,aa4 <main+0x7d4>
     b80:	08010793          	add	a5,sp,128
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     b84:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0; s<T; ++s){
     b88:	00078513          	mv	a0,a5
     b8c:	00000693          	li	a3,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     b90:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j)
     b94:	01000813          	li	a6,16
     b98:	00269613          	sll	a2,a3,0x2
    C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     b9c:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     ba0:	00b60633          	add	a2,a2,a1
     ba4:	00e608b3          	add	a7,a2,a4
     ba8:	0008a303          	lw	t1,0(a7)
    C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     bac:	00e508b3          	add	a7,a0,a4
  for(int i=0;i<4;++i) for(int j=0;j<4;++j)
     bb0:	00470713          	add	a4,a4,4
    C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     bb4:	0068a023          	sw	t1,0(a7)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j)
     bb8:	ff0716e3          	bne	a4,a6,ba4 <main+0x8d4>
     bbc:	00468693          	add	a3,a3,4
     bc0:	01050513          	add	a0,a0,16
     bc4:	fce69ae3          	bne	a3,a4,b98 <main+0x8c8>
     bc8:	04078513          	add	a0,a5,64
     bcc:	00090613          	mv	a2,s2
        for(int s=0;s<4;++s){
     bd0:	00400813          	li	a6,4
          out[oc][oy][ox] = C4[r][s];
     bd4:	00078593          	mv	a1,a5
        for(int s=0;s<4;++s){
     bd8:	00000713          	li	a4,0
          out[oc][oy][ox] = C4[r][s];
     bdc:	0005a883          	lw	a7,0(a1)
     be0:	009706b3          	add	a3,a4,s1
     be4:	00269693          	sll	a3,a3,0x2
     be8:	00d606b3          	add	a3,a2,a3
     bec:	0116a023          	sw	a7,0(a3)
        for(int s=0;s<4;++s){
     bf0:	00170713          	add	a4,a4,1
     bf4:	00458593          	add	a1,a1,4
     bf8:	ff0712e3          	bne	a4,a6,bdc <main+0x90c>
      for(int r=0;r<4;++r){
     bfc:	01078793          	add	a5,a5,16
     c00:	40060613          	add	a2,a2,1024
     c04:	fcf518e3          	bne	a0,a5,bd4 <main+0x904>
    for(int j0=0; j0<NPOS; j0+=4){
     c08:	00448493          	add	s1,s1,4
     c0c:	10000793          	li	a5,256
     c10:	08f48863          	beq	s1,a5,ca0 <main+0x9d0>
    for(int oy=0; oy<OH; ++oy){
     c14:	00000b93          	li	s7,0
    for(int c=0;c<Cin;++c)
     c18:	02400d13          	li	s10,36
  for(int r=0;r<4;++r){
     c1c:	09000c93          	li	s9,144
          Aflat[r*lda + idx++] = (oc<Cout)? w[oc][c][ky][kx] : 0;
     c20:	00812703          	lw	a4,8(sp)
    int idx=0;
     c24:	00000c13          	li	s8,0
          Aflat[r*lda + idx++] = (oc<Cout)? w[oc][c][ky][kx] : 0;
     c28:	008b87b3          	add	a5,s7,s0
     c2c:	01770733          	add	a4,a4,s7
     c30:	018705b3          	add	a1,a4,s8
     c34:	01878533          	add	a0,a5,s8
     c38:	00900613          	li	a2,9
     c3c:	02e12c23          	sw	a4,56(sp)
     c40:	02f12a23          	sw	a5,52(sp)
     c44:	009c0c13          	add	s8,s8,9
     c48:	7f8000ef          	jal	1440 <memcpy>
    for(int c=0;c<Cin;++c)
     c4c:	03412783          	lw	a5,52(sp)
     c50:	03812703          	lw	a4,56(sp)
     c54:	fdac1ee3          	bne	s8,s10,c30 <main+0x960>
  for(int r=0;r<4;++r){
     c58:	024b8b93          	add	s7,s7,36
     c5c:	fd9b92e3          	bne	s7,s9,c20 <main+0x950>
  for(int s=0; s<4; ++s){
     c60:	00000693          	li	a3,0
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     c64:	00f00293          	li	t0,15
    for(int c=0;c<Cin;++c)
     c68:	02400393          	li	t2,36
  for(int s=0; s<4; ++s){
     c6c:	00400f93          	li	t6,4
    int pos = j0 + s;
     c70:	00d485b3          	add	a1,s1,a3
    int oy = pos / OW;
     c74:	4045de93          	sra	t4,a1,0x4
    int ox = pos % OW;
     c78:	800077b7          	lui	a5,0x80007
     c7c:	00f5f593          	and	a1,a1,15
    if (pos >= NPOS){ /* pad col with zeros */
     c80:	a9878893          	add	a7,a5,-1384 # 80006a98 <IN.7>
    int idx=0;
     c84:	00000813          	li	a6,0
     c88:	002e8c13          	add	s8,t4,2
     c8c:	00358c93          	add	s9,a1,3
      for(int ky=0;ky<Kh;++ky)
     c90:	fffe8613          	add	a2,t4,-1
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
     c94:	00080313          	mv	t1,a6
     c98:	01088b93          	add	s7,a7,16
     c9c:	d79ff06f          	j	a14 <main+0x744>
  for(int oc0=0; oc0<Cout; oc0+=4){
     ca0:	000017b7          	lui	a5,0x1
     ca4:	00f90933          	add	s2,s2,a5
     ca8:	00812783          	lw	a5,8(sp)
     cac:	09078793          	add	a5,a5,144 # 1090 <_write+0x3c>
     cb0:	00f12423          	sw	a5,8(sp)
     cb4:	00ed8663          	beq	s11,a4,cc0 <main+0x9f0>
     cb8:	00400d93          	li	s11,4
     cbc:	d09ff06f          	j	9c4 <main+0x6f4>
  conv2d_cfs(IN, WGT, O_cfs);
  i1=rdinstret(); c1=rdcycle();
     cc0:	d38ff0ef          	jal	1f8 <rdinstret>
     cc4:	00050b93          	mv	s7,a0
     cc8:	00058b13          	mv	s6,a1
     ccc:	d18ff0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     cd0:	01c12783          	lw	a5,28(sp)
     cd4:	80000cb7          	lui	s9,0x80000
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     cd8:	80005737          	lui	a4,0x80005
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     cdc:	40f504b3          	sub	s1,a0,a5
     ce0:	02812783          	lw	a5,40(sp)
     ce4:	00953533          	sltu	a0,a0,s1
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     ce8:	800036b7          	lui	a3,0x80003
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     cec:	40f58933          	sub	s2,a1,a5
     cf0:	02c12783          	lw	a5,44(sp)
     cf4:	40a90933          	sub	s2,s2,a0
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     cf8:	97870713          	add	a4,a4,-1672 # 80004978 <O_sw.5>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     cfc:	40fb8ab3          	sub	s5,s7,a5
     d00:	03012783          	lw	a5,48(sp)
     d04:	015bbbb3          	sltu	s7,s7,s5
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     d08:	97868693          	add	a3,a3,-1672 # 80002978 <O_cfu.4>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     d0c:	40fb0b33          	sub	s6,s6,a5
     d10:	714ca783          	lw	a5,1812(s9) # 80000714 <g_sink>
     d14:	417b0b33          	sub	s6,s6,s7
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     d18:	00002537          	lui	a0,0x2
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;
     d1c:	0097c7b3          	xor	a5,a5,s1
     d20:	70fcaa23          	sw	a5,1812(s9)
     d24:	00000793          	li	a5,0
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     d28:	00e785b3          	add	a1,a5,a4
     d2c:	00d78633          	add	a2,a5,a3
     d30:	0005a583          	lw	a1,0(a1)
     d34:	00062603          	lw	a2,0(a2)
     d38:	1cc59263          	bne	a1,a2,efc <main+0xc2c>
     d3c:	00478793          	add	a5,a5,4
     d40:	fea794e3          	bne	a5,a0,d28 <main+0xa58>
     d44:	00100c13          	li	s8,1
     d48:	800017b7          	lui	a5,0x80001
     d4c:	97878793          	add	a5,a5,-1672 # 80000978 <O_cfs.3>
     d50:	000025b7          	lui	a1,0x2
     d54:	00412683          	lw	a3,4(sp)
     d58:	00d70633          	add	a2,a4,a3
     d5c:	00f686b3          	add	a3,a3,a5
     d60:	00062603          	lw	a2,0(a2)
     d64:	0006a683          	lw	a3,0(a3)
     d68:	18d61e63          	bne	a2,a3,f04 <main+0xc34>
     d6c:	00412683          	lw	a3,4(sp)
     d70:	00468693          	add	a3,a3,4
     d74:	00d12223          	sw	a3,4(sp)
     d78:	fcb69ee3          	bne	a3,a1,d54 <main+0xa84>
     d7c:	00100b93          	li	s7,1
  printf("CFU: "); for(int x=0;x<8;++x) printf("%6ld ", (long)O_cfu[0][0][x]); printf("\n");
  printf("CFS: "); for(int x=0;x<8;++x) printf("%6ld ", (long)O_cfs[0][0][x]); printf("\n");
#endif

  /* Timing table */
  printf("\nConv2D timing summary  (Cin=%d,Cout=%d, HxW=%dx%d, KhxKw=%dx%d)\n", Cin,Cout,H,W,Kh,Kw);
     d80:	0000f537          	lui	a0,0xf
     d84:	00300813          	li	a6,3
     d88:	00400593          	li	a1,4
     d8c:	00300793          	li	a5,3
     d90:	01000713          	li	a4,16
     d94:	01000693          	li	a3,16
     d98:	00800613          	li	a2,8
     d9c:	38050513          	add	a0,a0,896 # f380 <__fini_array_end+0x78>
     da0:	410000ef          	jal	11b0 <printf>
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
     da4:	0000f537          	lui	a0,0xf
     da8:	3c450513          	add	a0,a0,964 # f3c4 <__fini_array_end+0xbc>
     dac:	598000ef          	jal	1344 <puts>
  printf("-----+----------------+---------------+--------------+--------------\n");
     db0:	0000f537          	lui	a0,0xf
     db4:	40c50513          	add	a0,a0,1036 # f40c <__fini_array_end+0x104>
     db8:	58c000ef          	jal	1344 <puts>
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     dbc:	01012703          	lw	a4,16(sp)
     dc0:	02412783          	lw	a5,36(sp)
     dc4:	00c12603          	lw	a2,12(sp)
     dc8:	02012683          	lw	a3,32(sp)
     dcc:	0000f537          	lui	a0,0xf
     dd0:	45450513          	add	a0,a0,1108 # f454 <__fini_array_end+0x14c>
     dd4:	3dc000ef          	jal	11b0 <printf>
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     dd8:	01812783          	lw	a5,24(sp)
     ddc:	01412683          	lw	a3,20(sp)
     de0:	0000f537          	lui	a0,0xf
     de4:	000a0713          	mv	a4,s4
     de8:	00098613          	mv	a2,s3
     dec:	48c50513          	add	a0,a0,1164 # f48c <__fini_array_end+0x184>
     df0:	3c0000ef          	jal	11b0 <printf>
     df4:	01412683          	lw	a3,20(sp)
     df8:	02012583          	lw	a1,32(sp)
     dfc:	00c12503          	lw	a0,12(sp)
     e00:	00098613          	mv	a2,s3
     e04:	0000f437          	lui	s0,0xf
     e08:	c04ff0ef          	jal	20c <print_speedup_fixed>
     e0c:	4a840513          	add	a0,s0,1192 # f4a8 <__fini_array_end+0x1a0>
     e10:	3a0000ef          	jal	11b0 <printf>
     e14:	02412583          	lw	a1,36(sp)
     e18:	01812683          	lw	a3,24(sp)
     e1c:	01012503          	lw	a0,16(sp)
     e20:	000a0613          	mv	a2,s4
     e24:	be8ff0ef          	jal	20c <print_speedup_fixed>
     e28:	00a00513          	li	a0,10
     e2c:	3d4000ef          	jal	1200 <putchar>
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     e30:	0000f537          	lui	a0,0xf
     e34:	000a8713          	mv	a4,s5
     e38:	000b0793          	mv	a5,s6
     e3c:	00048613          	mv	a2,s1
     e40:	00090693          	mv	a3,s2
     e44:	4b450513          	add	a0,a0,1204 # f4b4 <__fini_array_end+0x1ac>
     e48:	368000ef          	jal	11b0 <printf>
     e4c:	02012583          	lw	a1,32(sp)
     e50:	00c12503          	lw	a0,12(sp)
     e54:	00048613          	mv	a2,s1
     e58:	00090693          	mv	a3,s2
     e5c:	bb0ff0ef          	jal	20c <print_speedup_fixed>
     e60:	4a840513          	add	a0,s0,1192
     e64:	34c000ef          	jal	11b0 <printf>
     e68:	01012503          	lw	a0,16(sp)
     e6c:	02412583          	lw	a1,36(sp)
     e70:	000a8613          	mv	a2,s5
     e74:	000b0693          	mv	a3,s6
     e78:	b94ff0ef          	jal	20c <print_speedup_fixed>
     e7c:	00a00513          	li	a0,10
     e80:	380000ef          	jal	1200 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
     e84:	080c0463          	beqz	s8,f0c <main+0xc3c>
     e88:	0000f5b7          	lui	a1,0xf
     e8c:	32458593          	add	a1,a1,804 # f324 <__fini_array_end+0x1c>
     e90:	080b8463          	beqz	s7,f18 <main+0xc48>
     e94:	0000f637          	lui	a2,0xf
     e98:	32460613          	add	a2,a2,804 # f324 <__fini_array_end+0x1c>
     e9c:	0000f537          	lui	a0,0xf
     ea0:	4d050513          	add	a0,a0,1232 # f4d0 <__fini_array_end+0x1c8>
     ea4:	30c000ef          	jal	11b0 <printf>
  printf("(sink=0x%08" PRIX32 ")\n", g_sink); /* keeps work observable */
     ea8:	714ca583          	lw	a1,1812(s9)
     eac:	0000f537          	lui	a0,0xf
     eb0:	4ec50513          	add	a0,a0,1260 # f4ec <__fini_array_end+0x1e4>
     eb4:	2fc000ef          	jal	11b0 <printf>
  return (ok_cfu && ok_cfs) ? 0 : 1;
}
     eb8:	0fc12083          	lw	ra,252(sp)
     ebc:	0f812403          	lw	s0,248(sp)
  return (ok_cfu && ok_cfs) ? 0 : 1;
     ec0:	018bf533          	and	a0,s7,s8
}
     ec4:	0f412483          	lw	s1,244(sp)
     ec8:	0f012903          	lw	s2,240(sp)
     ecc:	0ec12983          	lw	s3,236(sp)
     ed0:	0e812a03          	lw	s4,232(sp)
     ed4:	0e412a83          	lw	s5,228(sp)
     ed8:	0e012b03          	lw	s6,224(sp)
     edc:	0dc12b83          	lw	s7,220(sp)
     ee0:	0d812c03          	lw	s8,216(sp)
     ee4:	0d412c83          	lw	s9,212(sp)
     ee8:	0d012d03          	lw	s10,208(sp)
     eec:	0cc12d83          	lw	s11,204(sp)
     ef0:	00154513          	xor	a0,a0,1
     ef4:	10010113          	add	sp,sp,256
     ef8:	00008067          	ret
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
     efc:	00000c13          	li	s8,0
     f00:	e49ff06f          	j	d48 <main+0xa78>
     f04:	00000b93          	li	s7,0
     f08:	e79ff06f          	j	d80 <main+0xab0>
  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
     f0c:	0000f5b7          	lui	a1,0xf
     f10:	32c58593          	add	a1,a1,812 # f32c <__fini_array_end+0x24>
     f14:	f7dff06f          	j	e90 <main+0xbc0>
     f18:	0000f637          	lui	a2,0xf
     f1c:	32c60613          	add	a2,a2,812 # f32c <__fini_array_end+0x24>
     f20:	f7dff06f          	j	e9c <main+0xbcc>

00000f24 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     f24:	fffff097          	auipc	ra,0xfffff
     f28:	23408093          	add	ra,ra,564 # 158 <__crt0_main_exit>
     f2c:	00050513          	mv	a0,a0
     f30:	00008067          	ret

00000f34 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     f34:	fff00513          	li	a0,-1
     f38:	00008067          	ret

00000f3c <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     f3c:	000027b7          	lui	a5,0x2
     f40:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     f44:	00000513          	li	a0,0
     f48:	00008067          	ret

00000f4c <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     f4c:	00100513          	li	a0,1
     f50:	00008067          	ret

00000f54 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     f54:	00100513          	li	a0,1
     f58:	00008067          	ret

00000f5c <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     f5c:	800007b7          	lui	a5,0x80000
     f60:	01600713          	li	a4,22
     f64:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
  return -1;
}
     f68:	fff00513          	li	a0,-1
     f6c:	00008067          	ret

00000f70 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     f70:	00000513          	li	a0,0
     f74:	00008067          	ret

00000f78 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     f78:	fe010113          	add	sp,sp,-32
     f7c:	00912a23          	sw	s1,20(sp)
     f80:	01212823          	sw	s2,16(sp)
     f84:	00112e23          	sw	ra,28(sp)
     f88:	00812c23          	sw	s0,24(sp)
     f8c:	01312623          	sw	s3,12(sp)
     f90:	01412423          	sw	s4,8(sp)
     f94:	00058913          	mv	s2,a1
     f98:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     f9c:	06051463          	bnez	a0,1004 <_read+0x8c>
     fa0:	00050413          	mv	s0,a0
     fa4:	fff50537          	lui	a0,0xfff50
     fa8:	1a0000ef          	jal	1148 <neorv32_uart_available>
     fac:	04050c63          	beqz	a0,1004 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     fb0:	00a00993          	li	s3,10
     fb4:	00d00a13          	li	s4,13
    while (len--) {
     fb8:	00941663          	bne	s0,s1,fc4 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     fbc:	00048413          	mv	s0,s1
     fc0:	0200006f          	j	fe0 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     fc4:	fff50537          	lui	a0,0xfff50
     fc8:	1d0000ef          	jal	1198 <neorv32_uart_getc>
      *ptr++ = c;
     fcc:	008907b3          	add	a5,s2,s0
     fd0:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     fd4:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     fd8:	01350463          	beq	a0,s3,fe0 <_read+0x68>
     fdc:	fd451ee3          	bne	a0,s4,fb8 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     fe0:	01c12083          	lw	ra,28(sp)
     fe4:	00040513          	mv	a0,s0
     fe8:	01812403          	lw	s0,24(sp)
     fec:	01412483          	lw	s1,20(sp)
     ff0:	01012903          	lw	s2,16(sp)
     ff4:	00c12983          	lw	s3,12(sp)
     ff8:	00812a03          	lw	s4,8(sp)
     ffc:	02010113          	add	sp,sp,32
    1000:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1004:	fff60537          	lui	a0,0xfff60
    1008:	140000ef          	jal	1148 <neorv32_uart_available>
  int read_cnt = 0;
    100c:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1010:	02050863          	beqz	a0,1040 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1014:	00a00993          	li	s3,10
    1018:	00d00a13          	li	s4,13
    while (len--) {
    101c:	fa9400e3          	beq	s0,s1,fbc <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
    1020:	fff60537          	lui	a0,0xfff60
    1024:	174000ef          	jal	1198 <neorv32_uart_getc>
      *ptr++ = c;
    1028:	008907b3          	add	a5,s2,s0
    102c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
    1030:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1034:	fb3506e3          	beq	a0,s3,fe0 <_read+0x68>
    1038:	ff4512e3          	bne	a0,s4,101c <_read+0xa4>
    103c:	fa5ff06f          	j	fe0 <_read+0x68>
    errno = ENOSYS;
    1040:	800007b7          	lui	a5,0x80000
    1044:	05800713          	li	a4,88
    1048:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return -1;
    104c:	fff00413          	li	s0,-1
    1050:	f91ff06f          	j	fe0 <_read+0x68>

00001054 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
    1054:	ff010113          	add	sp,sp,-16
    1058:	00812423          	sw	s0,8(sp)
    105c:	00912223          	sw	s1,4(sp)
    1060:	00112623          	sw	ra,12(sp)
    1064:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1068:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
    106c:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
    1070:	00058413          	mv	s0,a1
    1074:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1078:	04a7ec63          	bltu	a5,a0,10d0 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
    107c:	fff50537          	lui	a0,0xfff50
    1080:	0c8000ef          	jal	1148 <neorv32_uart_available>
    1084:	00940933          	add	s2,s0,s1
    1088:	02051463          	bnez	a0,10b0 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
    108c:	800007b7          	lui	a5,0x80000
    1090:	05800713          	li	a4,88
    1094:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
      return -1;
    1098:	fff00493          	li	s1,-1
    109c:	0180006f          	j	10b4 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
    10a0:	00044583          	lbu	a1,0(s0)
    10a4:	fff50537          	lui	a0,0xfff50
    10a8:	00140413          	add	s0,s0,1
    10ac:	0d8000ef          	jal	1184 <neorv32_uart_putc>
      while (len--) {
    10b0:	fe8918e3          	bne	s2,s0,10a0 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    10b4:	00c12083          	lw	ra,12(sp)
    10b8:	00812403          	lw	s0,8(sp)
    10bc:	00012903          	lw	s2,0(sp)
    10c0:	00048513          	mv	a0,s1
    10c4:	00412483          	lw	s1,4(sp)
    10c8:	01010113          	add	sp,sp,16
    10cc:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
    10d0:	fff60537          	lui	a0,0xfff60
    10d4:	074000ef          	jal	1148 <neorv32_uart_available>
    10d8:	00940933          	add	s2,s0,s1
    10dc:	fa0508e3          	beqz	a0,108c <_write+0x38>
    while (len--) {
    10e0:	fd240ae3          	beq	s0,s2,10b4 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
    10e4:	00044583          	lbu	a1,0(s0)
    10e8:	fff60537          	lui	a0,0xfff60
    10ec:	00140413          	add	s0,s0,1
    10f0:	094000ef          	jal	1184 <neorv32_uart_putc>
      write_cnt++;
    10f4:	fedff06f          	j	10e0 <_write+0x8c>

000010f8 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
    10f8:	80000737          	lui	a4,0x80000
    10fc:	71872683          	lw	a3,1816(a4) # 80000718 <curr_heap.0>
    1100:	80007637          	lui	a2,0x80007
void *_sbrk(int incr) {
    1104:	00050793          	mv	a5,a0
    1108:	ff860613          	add	a2,a2,-8 # 80006ff8 <__crt0_bss_end>
  if (curr_heap == NULL) {
    110c:	00069463          	bnez	a3,1114 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
    1110:	70c72c23          	sw	a2,1816(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
    1114:	800076b7          	lui	a3,0x80007
    1118:	ff868693          	add	a3,a3,-8 # 80006ff8 <__crt0_bss_end>
    111c:	00c69c63          	bne	a3,a2,1134 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
    1120:	800007b7          	lui	a5,0x80000
    1124:	00c00713          	li	a4,12
    1128:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return (void*)-1; // error - no more memory
    112c:	fff00513          	li	a0,-1
    1130:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
    1134:	71872503          	lw	a0,1816(a4)
    1138:	00f507b3          	add	a5,a0,a5
    113c:	fed7f2e3          	bgeu	a5,a3,1120 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
    1140:	70f72c23          	sw	a5,1816(a4)

  return (void*)prev_heap;
}
    1144:	00008067          	ret

00001148 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
    1148:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
    114c:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
    1150:	00e51c63          	bne	a0,a4,1168 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
    1154:	fffe07b7          	lui	a5,0xfffe0
    1158:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
    115c:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    1160:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
    1164:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
    1168:	fff60737          	lui	a4,0xfff60
    return 0;
    116c:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
    1170:	fee79ae3          	bne	a5,a4,1164 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    1174:	fffe07b7          	lui	a5,0xfffe0
    1178:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
    117c:	020007b7          	lui	a5,0x2000
    1180:	fe1ff06f          	j	1160 <neorv32_uart_available+0x18>

00001184 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1184:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
    1188:	00a79713          	sll	a4,a5,0xa
    118c:	fe075ce3          	bgez	a4,1184 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1190:	00b52223          	sw	a1,4(a0)
}
    1194:	00008067          	ret

00001198 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
    1198:	00052783          	lw	a5,0(a0)
    119c:	00f79713          	sll	a4,a5,0xf
    11a0:	fe075ce3          	bgez	a4,1198 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
    11a4:	00452503          	lw	a0,4(a0)
}
    11a8:	0ff57513          	zext.b	a0,a0
    11ac:	00008067          	ret

000011b0 <printf>:
    11b0:	fc010113          	add	sp,sp,-64
    11b4:	02c12423          	sw	a2,40(sp)
    11b8:	02d12623          	sw	a3,44(sp)
    11bc:	7ffff317          	auipc	t1,0x7ffff
    11c0:	54c32303          	lw	t1,1356(t1) # 80000708 <_impure_ptr>
    11c4:	02b12223          	sw	a1,36(sp)
    11c8:	02e12823          	sw	a4,48(sp)
    11cc:	02f12a23          	sw	a5,52(sp)
    11d0:	03012c23          	sw	a6,56(sp)
    11d4:	03112e23          	sw	a7,60(sp)
    11d8:	00832583          	lw	a1,8(t1)
    11dc:	02410693          	add	a3,sp,36
    11e0:	00050613          	mv	a2,a0
    11e4:	00030513          	mv	a0,t1
    11e8:	00112e23          	sw	ra,28(sp)
    11ec:	00d12623          	sw	a3,12(sp)
    11f0:	0c8010ef          	jal	22b8 <_vfprintf_r>
    11f4:	01c12083          	lw	ra,28(sp)
    11f8:	04010113          	add	sp,sp,64
    11fc:	00008067          	ret

00001200 <putchar>:
    1200:	7ffff797          	auipc	a5,0x7ffff
    1204:	5087a783          	lw	a5,1288(a5) # 80000708 <_impure_ptr>
    1208:	0087a603          	lw	a2,8(a5)
    120c:	00050593          	mv	a1,a0
    1210:	00078513          	mv	a0,a5
    1214:	3c00606f          	j	75d4 <_putc_r>

00001218 <_puts_r>:
    1218:	fd010113          	add	sp,sp,-48
    121c:	02812423          	sw	s0,40(sp)
    1220:	00050413          	mv	s0,a0
    1224:	00058513          	mv	a0,a1
    1228:	02912223          	sw	s1,36(sp)
    122c:	02112623          	sw	ra,44(sp)
    1230:	00058493          	mv	s1,a1
    1234:	3b0000ef          	jal	15e4 <strlen>
    1238:	00150713          	add	a4,a0,1
    123c:	0000e697          	auipc	a3,0xe
    1240:	14068693          	add	a3,a3,320 # f37c <__fini_array_end+0x74>
    1244:	00e12623          	sw	a4,12(sp)
    1248:	03442783          	lw	a5,52(s0)
    124c:	01010713          	add	a4,sp,16
    1250:	00d12c23          	sw	a3,24(sp)
    1254:	00e12223          	sw	a4,4(sp)
    1258:	00100693          	li	a3,1
    125c:	00200713          	li	a4,2
    1260:	00912823          	sw	s1,16(sp)
    1264:	00a12a23          	sw	a0,20(sp)
    1268:	00d12e23          	sw	a3,28(sp)
    126c:	00e12423          	sw	a4,8(sp)
    1270:	00842483          	lw	s1,8(s0)
    1274:	0c078263          	beqz	a5,1338 <_puts_r+0x120>
    1278:	0644a703          	lw	a4,100(s1)
    127c:	00c49783          	lh	a5,12(s1)
    1280:	00177713          	and	a4,a4,1
    1284:	00071663          	bnez	a4,1290 <_puts_r+0x78>
    1288:	2007f713          	and	a4,a5,512
    128c:	08070e63          	beqz	a4,1328 <_puts_r+0x110>
    1290:	01279713          	sll	a4,a5,0x12
    1294:	02074263          	bltz	a4,12b8 <_puts_r+0xa0>
    1298:	0644a703          	lw	a4,100(s1)
    129c:	ffffe6b7          	lui	a3,0xffffe
    12a0:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    12a4:	00002637          	lui	a2,0x2
    12a8:	00c7e7b3          	or	a5,a5,a2
    12ac:	00d77733          	and	a4,a4,a3
    12b0:	00f49623          	sh	a5,12(s1)
    12b4:	06e4a223          	sw	a4,100(s1)
    12b8:	00040513          	mv	a0,s0
    12bc:	00410613          	add	a2,sp,4
    12c0:	00048593          	mv	a1,s1
    12c4:	549050ef          	jal	700c <__sfvwrite_r>
    12c8:	0644a783          	lw	a5,100(s1)
    12cc:	00153413          	seqz	s0,a0
    12d0:	40800433          	neg	s0,s0
    12d4:	00b47413          	and	s0,s0,11
    12d8:	0017f793          	and	a5,a5,1
    12dc:	fff40413          	add	s0,s0,-1
    12e0:	00079863          	bnez	a5,12f0 <_puts_r+0xd8>
    12e4:	00c4d783          	lhu	a5,12(s1)
    12e8:	2007f793          	and	a5,a5,512
    12ec:	00078e63          	beqz	a5,1308 <_puts_r+0xf0>
    12f0:	02c12083          	lw	ra,44(sp)
    12f4:	00040513          	mv	a0,s0
    12f8:	02812403          	lw	s0,40(sp)
    12fc:	02412483          	lw	s1,36(sp)
    1300:	03010113          	add	sp,sp,48
    1304:	00008067          	ret
    1308:	0584a503          	lw	a0,88(s1)
    130c:	054000ef          	jal	1360 <__retarget_lock_release_recursive>
    1310:	02c12083          	lw	ra,44(sp)
    1314:	00040513          	mv	a0,s0
    1318:	02812403          	lw	s0,40(sp)
    131c:	02412483          	lw	s1,36(sp)
    1320:	03010113          	add	sp,sp,48
    1324:	00008067          	ret
    1328:	0584a503          	lw	a0,88(s1)
    132c:	030000ef          	jal	135c <__retarget_lock_acquire_recursive>
    1330:	00c49783          	lh	a5,12(s1)
    1334:	f5dff06f          	j	1290 <_puts_r+0x78>
    1338:	00040513          	mv	a0,s0
    133c:	449050ef          	jal	6f84 <__sinit>
    1340:	f39ff06f          	j	1278 <_puts_r+0x60>

00001344 <puts>:
    1344:	00050593          	mv	a1,a0
    1348:	7ffff517          	auipc	a0,0x7ffff
    134c:	3c052503          	lw	a0,960(a0) # 80000708 <_impure_ptr>
    1350:	ec9ff06f          	j	1218 <_puts_r>

00001354 <__retarget_lock_init_recursive>:
    1354:	00008067          	ret

00001358 <__retarget_lock_close_recursive>:
    1358:	00008067          	ret

0000135c <__retarget_lock_acquire_recursive>:
    135c:	00008067          	ret

00001360 <__retarget_lock_release_recursive>:
    1360:	00008067          	ret

00001364 <memset>:
    1364:	00f00313          	li	t1,15
    1368:	00050713          	mv	a4,a0
    136c:	02c37e63          	bgeu	t1,a2,13a8 <memset+0x44>
    1370:	00f77793          	and	a5,a4,15
    1374:	0a079063          	bnez	a5,1414 <memset+0xb0>
    1378:	08059263          	bnez	a1,13fc <memset+0x98>
    137c:	ff067693          	and	a3,a2,-16
    1380:	00f67613          	and	a2,a2,15
    1384:	00e686b3          	add	a3,a3,a4
    1388:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    138c:	00b72223          	sw	a1,4(a4)
    1390:	00b72423          	sw	a1,8(a4)
    1394:	00b72623          	sw	a1,12(a4)
    1398:	01070713          	add	a4,a4,16
    139c:	fed766e3          	bltu	a4,a3,1388 <memset+0x24>
    13a0:	00061463          	bnez	a2,13a8 <memset+0x44>
    13a4:	00008067          	ret
    13a8:	40c306b3          	sub	a3,t1,a2
    13ac:	00269693          	sll	a3,a3,0x2
    13b0:	00000297          	auipc	t0,0x0
    13b4:	005686b3          	add	a3,a3,t0
    13b8:	00c68067          	jr	12(a3)
    13bc:	00b70723          	sb	a1,14(a4)
    13c0:	00b706a3          	sb	a1,13(a4)
    13c4:	00b70623          	sb	a1,12(a4)
    13c8:	00b705a3          	sb	a1,11(a4)
    13cc:	00b70523          	sb	a1,10(a4)
    13d0:	00b704a3          	sb	a1,9(a4)
    13d4:	00b70423          	sb	a1,8(a4)
    13d8:	00b703a3          	sb	a1,7(a4)
    13dc:	00b70323          	sb	a1,6(a4)
    13e0:	00b702a3          	sb	a1,5(a4)
    13e4:	00b70223          	sb	a1,4(a4)
    13e8:	00b701a3          	sb	a1,3(a4)
    13ec:	00b70123          	sb	a1,2(a4)
    13f0:	00b700a3          	sb	a1,1(a4)
    13f4:	00b70023          	sb	a1,0(a4)
    13f8:	00008067          	ret
    13fc:	0ff5f593          	zext.b	a1,a1
    1400:	00859693          	sll	a3,a1,0x8
    1404:	00d5e5b3          	or	a1,a1,a3
    1408:	01059693          	sll	a3,a1,0x10
    140c:	00d5e5b3          	or	a1,a1,a3
    1410:	f6dff06f          	j	137c <memset+0x18>
    1414:	00279693          	sll	a3,a5,0x2
    1418:	00000297          	auipc	t0,0x0
    141c:	005686b3          	add	a3,a3,t0
    1420:	00008293          	mv	t0,ra
    1424:	fa0680e7          	jalr	-96(a3)
    1428:	00028093          	mv	ra,t0
    142c:	ff078793          	add	a5,a5,-16
    1430:	40f70733          	sub	a4,a4,a5
    1434:	00f60633          	add	a2,a2,a5
    1438:	f6c378e3          	bgeu	t1,a2,13a8 <memset+0x44>
    143c:	f3dff06f          	j	1378 <memset+0x14>

00001440 <memcpy>:
    1440:	00a5c7b3          	xor	a5,a1,a0
    1444:	0037f793          	and	a5,a5,3
    1448:	00c508b3          	add	a7,a0,a2
    144c:	06079463          	bnez	a5,14b4 <memcpy+0x74>
    1450:	00300793          	li	a5,3
    1454:	06c7f063          	bgeu	a5,a2,14b4 <memcpy+0x74>
    1458:	00357793          	and	a5,a0,3
    145c:	00050713          	mv	a4,a0
    1460:	06079a63          	bnez	a5,14d4 <memcpy+0x94>
    1464:	ffc8f613          	and	a2,a7,-4
    1468:	40e606b3          	sub	a3,a2,a4
    146c:	02000793          	li	a5,32
    1470:	08d7ce63          	blt	a5,a3,150c <memcpy+0xcc>
    1474:	00058693          	mv	a3,a1
    1478:	00070793          	mv	a5,a4
    147c:	02c77863          	bgeu	a4,a2,14ac <memcpy+0x6c>
    1480:	0006a803          	lw	a6,0(a3)
    1484:	00478793          	add	a5,a5,4
    1488:	00468693          	add	a3,a3,4
    148c:	ff07ae23          	sw	a6,-4(a5)
    1490:	fec7e8e3          	bltu	a5,a2,1480 <memcpy+0x40>
    1494:	fff60793          	add	a5,a2,-1 # 1fff <_malloc_r+0x53f>
    1498:	40e787b3          	sub	a5,a5,a4
    149c:	ffc7f793          	and	a5,a5,-4
    14a0:	00478793          	add	a5,a5,4
    14a4:	00f70733          	add	a4,a4,a5
    14a8:	00f585b3          	add	a1,a1,a5
    14ac:	01176863          	bltu	a4,a7,14bc <memcpy+0x7c>
    14b0:	00008067          	ret
    14b4:	00050713          	mv	a4,a0
    14b8:	05157863          	bgeu	a0,a7,1508 <memcpy+0xc8>
    14bc:	0005c783          	lbu	a5,0(a1)
    14c0:	00170713          	add	a4,a4,1
    14c4:	00158593          	add	a1,a1,1
    14c8:	fef70fa3          	sb	a5,-1(a4)
    14cc:	fee898e3          	bne	a7,a4,14bc <memcpy+0x7c>
    14d0:	00008067          	ret
    14d4:	0005c683          	lbu	a3,0(a1)
    14d8:	00170713          	add	a4,a4,1
    14dc:	00377793          	and	a5,a4,3
    14e0:	fed70fa3          	sb	a3,-1(a4)
    14e4:	00158593          	add	a1,a1,1
    14e8:	f6078ee3          	beqz	a5,1464 <memcpy+0x24>
    14ec:	0005c683          	lbu	a3,0(a1)
    14f0:	00170713          	add	a4,a4,1
    14f4:	00377793          	and	a5,a4,3
    14f8:	fed70fa3          	sb	a3,-1(a4)
    14fc:	00158593          	add	a1,a1,1
    1500:	fc079ae3          	bnez	a5,14d4 <memcpy+0x94>
    1504:	f61ff06f          	j	1464 <memcpy+0x24>
    1508:	00008067          	ret
    150c:	ff010113          	add	sp,sp,-16
    1510:	00812623          	sw	s0,12(sp)
    1514:	02000413          	li	s0,32
    1518:	0005a383          	lw	t2,0(a1)
    151c:	0045a283          	lw	t0,4(a1)
    1520:	0085af83          	lw	t6,8(a1)
    1524:	00c5af03          	lw	t5,12(a1)
    1528:	0105ae83          	lw	t4,16(a1)
    152c:	0145ae03          	lw	t3,20(a1)
    1530:	0185a303          	lw	t1,24(a1)
    1534:	01c5a803          	lw	a6,28(a1)
    1538:	0205a683          	lw	a3,32(a1)
    153c:	02470713          	add	a4,a4,36
    1540:	40e607b3          	sub	a5,a2,a4
    1544:	fc772e23          	sw	t2,-36(a4)
    1548:	fe572023          	sw	t0,-32(a4)
    154c:	fff72223          	sw	t6,-28(a4)
    1550:	ffe72423          	sw	t5,-24(a4)
    1554:	ffd72623          	sw	t4,-20(a4)
    1558:	ffc72823          	sw	t3,-16(a4)
    155c:	fe672a23          	sw	t1,-12(a4)
    1560:	ff072c23          	sw	a6,-8(a4)
    1564:	fed72e23          	sw	a3,-4(a4)
    1568:	02458593          	add	a1,a1,36
    156c:	faf446e3          	blt	s0,a5,1518 <memcpy+0xd8>
    1570:	00058693          	mv	a3,a1
    1574:	00070793          	mv	a5,a4
    1578:	02c77863          	bgeu	a4,a2,15a8 <memcpy+0x168>
    157c:	0006a803          	lw	a6,0(a3)
    1580:	00478793          	add	a5,a5,4
    1584:	00468693          	add	a3,a3,4
    1588:	ff07ae23          	sw	a6,-4(a5)
    158c:	fec7e8e3          	bltu	a5,a2,157c <memcpy+0x13c>
    1590:	fff60793          	add	a5,a2,-1
    1594:	40e787b3          	sub	a5,a5,a4
    1598:	ffc7f793          	and	a5,a5,-4
    159c:	00478793          	add	a5,a5,4
    15a0:	00f70733          	add	a4,a4,a5
    15a4:	00f585b3          	add	a1,a1,a5
    15a8:	01176863          	bltu	a4,a7,15b8 <memcpy+0x178>
    15ac:	00c12403          	lw	s0,12(sp)
    15b0:	01010113          	add	sp,sp,16
    15b4:	00008067          	ret
    15b8:	0005c783          	lbu	a5,0(a1)
    15bc:	00170713          	add	a4,a4,1
    15c0:	00158593          	add	a1,a1,1
    15c4:	fef70fa3          	sb	a5,-1(a4)
    15c8:	fee882e3          	beq	a7,a4,15ac <memcpy+0x16c>
    15cc:	0005c783          	lbu	a5,0(a1)
    15d0:	00170713          	add	a4,a4,1
    15d4:	00158593          	add	a1,a1,1
    15d8:	fef70fa3          	sb	a5,-1(a4)
    15dc:	fce89ee3          	bne	a7,a4,15b8 <memcpy+0x178>
    15e0:	fcdff06f          	j	15ac <memcpy+0x16c>

000015e4 <strlen>:
    15e4:	00357793          	and	a5,a0,3
    15e8:	00050713          	mv	a4,a0
    15ec:	04079c63          	bnez	a5,1644 <strlen+0x60>
    15f0:	7f7f86b7          	lui	a3,0x7f7f8
    15f4:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    15f8:	fff00593          	li	a1,-1
    15fc:	00072603          	lw	a2,0(a4)
    1600:	00470713          	add	a4,a4,4
    1604:	00d677b3          	and	a5,a2,a3
    1608:	00d787b3          	add	a5,a5,a3
    160c:	00c7e7b3          	or	a5,a5,a2
    1610:	00d7e7b3          	or	a5,a5,a3
    1614:	feb784e3          	beq	a5,a1,15fc <strlen+0x18>
    1618:	ffc74683          	lbu	a3,-4(a4)
    161c:	40a707b3          	sub	a5,a4,a0
    1620:	04068463          	beqz	a3,1668 <strlen+0x84>
    1624:	ffd74683          	lbu	a3,-3(a4)
    1628:	02068c63          	beqz	a3,1660 <strlen+0x7c>
    162c:	ffe74503          	lbu	a0,-2(a4)
    1630:	00a03533          	snez	a0,a0
    1634:	00f50533          	add	a0,a0,a5
    1638:	ffe50513          	add	a0,a0,-2
    163c:	00008067          	ret
    1640:	fa0688e3          	beqz	a3,15f0 <strlen+0xc>
    1644:	00074783          	lbu	a5,0(a4)
    1648:	00170713          	add	a4,a4,1
    164c:	00377693          	and	a3,a4,3
    1650:	fe0798e3          	bnez	a5,1640 <strlen+0x5c>
    1654:	40a70733          	sub	a4,a4,a0
    1658:	fff70513          	add	a0,a4,-1
    165c:	00008067          	ret
    1660:	ffd78513          	add	a0,a5,-3
    1664:	00008067          	ret
    1668:	ffc78513          	add	a0,a5,-4
    166c:	00008067          	ret

00001670 <_malloc_trim_r>:
    1670:	fe010113          	add	sp,sp,-32
    1674:	00812c23          	sw	s0,24(sp)
    1678:	00912a23          	sw	s1,20(sp)
    167c:	01212823          	sw	s2,16(sp)
    1680:	01312623          	sw	s3,12(sp)
    1684:	01412423          	sw	s4,8(sp)
    1688:	00058993          	mv	s3,a1
    168c:	00112e23          	sw	ra,28(sp)
    1690:	00050913          	mv	s2,a0
    1694:	7ffffa17          	auipc	s4,0x7ffff
    1698:	a8ca0a13          	add	s4,s4,-1396 # 80000120 <__malloc_av_>
    169c:	405000ef          	jal	22a0 <__malloc_lock>
    16a0:	008a2703          	lw	a4,8(s4)
    16a4:	000017b7          	lui	a5,0x1
    16a8:	fef78793          	add	a5,a5,-17 # fef <_read+0x77>
    16ac:	00472483          	lw	s1,4(a4)
    16b0:	00001737          	lui	a4,0x1
    16b4:	ffc4f493          	and	s1,s1,-4
    16b8:	00f48433          	add	s0,s1,a5
    16bc:	41340433          	sub	s0,s0,s3
    16c0:	00c45413          	srl	s0,s0,0xc
    16c4:	fff40413          	add	s0,s0,-1
    16c8:	00c41413          	sll	s0,s0,0xc
    16cc:	00e44e63          	blt	s0,a4,16e8 <_malloc_trim_r+0x78>
    16d0:	00000593          	li	a1,0
    16d4:	00090513          	mv	a0,s2
    16d8:	105060ef          	jal	7fdc <_sbrk_r>
    16dc:	008a2783          	lw	a5,8(s4)
    16e0:	009787b3          	add	a5,a5,s1
    16e4:	02f50863          	beq	a0,a5,1714 <_malloc_trim_r+0xa4>
    16e8:	00090513          	mv	a0,s2
    16ec:	3c1000ef          	jal	22ac <__malloc_unlock>
    16f0:	01c12083          	lw	ra,28(sp)
    16f4:	01812403          	lw	s0,24(sp)
    16f8:	01412483          	lw	s1,20(sp)
    16fc:	01012903          	lw	s2,16(sp)
    1700:	00c12983          	lw	s3,12(sp)
    1704:	00812a03          	lw	s4,8(sp)
    1708:	00000513          	li	a0,0
    170c:	02010113          	add	sp,sp,32
    1710:	00008067          	ret
    1714:	408005b3          	neg	a1,s0
    1718:	00090513          	mv	a0,s2
    171c:	0c1060ef          	jal	7fdc <_sbrk_r>
    1720:	fff00793          	li	a5,-1
    1724:	04f50a63          	beq	a0,a5,1778 <_malloc_trim_r+0x108>
    1728:	80005717          	auipc	a4,0x80005
    172c:	77070713          	add	a4,a4,1904 # 80006e98 <__malloc_current_mallinfo>
    1730:	00072783          	lw	a5,0(a4)
    1734:	008a2683          	lw	a3,8(s4)
    1738:	408484b3          	sub	s1,s1,s0
    173c:	0014e493          	or	s1,s1,1
    1740:	408787b3          	sub	a5,a5,s0
    1744:	00090513          	mv	a0,s2
    1748:	0096a223          	sw	s1,4(a3)
    174c:	00f72023          	sw	a5,0(a4)
    1750:	35d000ef          	jal	22ac <__malloc_unlock>
    1754:	01c12083          	lw	ra,28(sp)
    1758:	01812403          	lw	s0,24(sp)
    175c:	01412483          	lw	s1,20(sp)
    1760:	01012903          	lw	s2,16(sp)
    1764:	00c12983          	lw	s3,12(sp)
    1768:	00812a03          	lw	s4,8(sp)
    176c:	00100513          	li	a0,1
    1770:	02010113          	add	sp,sp,32
    1774:	00008067          	ret
    1778:	00000593          	li	a1,0
    177c:	00090513          	mv	a0,s2
    1780:	05d060ef          	jal	7fdc <_sbrk_r>
    1784:	008a2703          	lw	a4,8(s4)
    1788:	00f00693          	li	a3,15
    178c:	40e507b3          	sub	a5,a0,a4
    1790:	f4f6dce3          	bge	a3,a5,16e8 <_malloc_trim_r+0x78>
    1794:	7ffff697          	auipc	a3,0x7ffff
    1798:	f786a683          	lw	a3,-136(a3) # 8000070c <__malloc_sbrk_base>
    179c:	40d50533          	sub	a0,a0,a3
    17a0:	0017e793          	or	a5,a5,1
    17a4:	80005697          	auipc	a3,0x80005
    17a8:	6ea6aa23          	sw	a0,1780(a3) # 80006e98 <__malloc_current_mallinfo>
    17ac:	00f72223          	sw	a5,4(a4)
    17b0:	f39ff06f          	j	16e8 <_malloc_trim_r+0x78>

000017b4 <_free_r>:
    17b4:	18058263          	beqz	a1,1938 <_free_r+0x184>
    17b8:	ff010113          	add	sp,sp,-16
    17bc:	00812423          	sw	s0,8(sp)
    17c0:	00912223          	sw	s1,4(sp)
    17c4:	00058413          	mv	s0,a1
    17c8:	00050493          	mv	s1,a0
    17cc:	00112623          	sw	ra,12(sp)
    17d0:	2d1000ef          	jal	22a0 <__malloc_lock>
    17d4:	ffc42583          	lw	a1,-4(s0)
    17d8:	ff840713          	add	a4,s0,-8
    17dc:	7ffff517          	auipc	a0,0x7ffff
    17e0:	94450513          	add	a0,a0,-1724 # 80000120 <__malloc_av_>
    17e4:	ffe5f793          	and	a5,a1,-2
    17e8:	00f70633          	add	a2,a4,a5
    17ec:	00462683          	lw	a3,4(a2)
    17f0:	00852803          	lw	a6,8(a0)
    17f4:	ffc6f693          	and	a3,a3,-4
    17f8:	1ac80263          	beq	a6,a2,199c <_free_r+0x1e8>
    17fc:	00d62223          	sw	a3,4(a2)
    1800:	0015f593          	and	a1,a1,1
    1804:	00d60833          	add	a6,a2,a3
    1808:	0a059063          	bnez	a1,18a8 <_free_r+0xf4>
    180c:	ff842303          	lw	t1,-8(s0)
    1810:	00482583          	lw	a1,4(a6)
    1814:	7ffff897          	auipc	a7,0x7ffff
    1818:	91488893          	add	a7,a7,-1772 # 80000128 <__malloc_av_+0x8>
    181c:	40670733          	sub	a4,a4,t1
    1820:	00872803          	lw	a6,8(a4)
    1824:	006787b3          	add	a5,a5,t1
    1828:	0015f593          	and	a1,a1,1
    182c:	15180263          	beq	a6,a7,1970 <_free_r+0x1bc>
    1830:	00c72303          	lw	t1,12(a4)
    1834:	00682623          	sw	t1,12(a6)
    1838:	01032423          	sw	a6,8(t1)
    183c:	1a058a63          	beqz	a1,19f0 <_free_r+0x23c>
    1840:	0017e693          	or	a3,a5,1
    1844:	00d72223          	sw	a3,4(a4)
    1848:	00f62023          	sw	a5,0(a2)
    184c:	1ff00693          	li	a3,511
    1850:	06f6ec63          	bltu	a3,a5,18c8 <_free_r+0x114>
    1854:	ff87f693          	and	a3,a5,-8
    1858:	00868693          	add	a3,a3,8
    185c:	00452583          	lw	a1,4(a0)
    1860:	00d506b3          	add	a3,a0,a3
    1864:	0006a603          	lw	a2,0(a3)
    1868:	0057d813          	srl	a6,a5,0x5
    186c:	00100793          	li	a5,1
    1870:	010797b3          	sll	a5,a5,a6
    1874:	00b7e7b3          	or	a5,a5,a1
    1878:	ff868593          	add	a1,a3,-8
    187c:	00b72623          	sw	a1,12(a4)
    1880:	00c72423          	sw	a2,8(a4)
    1884:	00f52223          	sw	a5,4(a0)
    1888:	00e6a023          	sw	a4,0(a3)
    188c:	00e62623          	sw	a4,12(a2)
    1890:	00812403          	lw	s0,8(sp)
    1894:	00c12083          	lw	ra,12(sp)
    1898:	00048513          	mv	a0,s1
    189c:	00412483          	lw	s1,4(sp)
    18a0:	01010113          	add	sp,sp,16
    18a4:	2090006f          	j	22ac <__malloc_unlock>
    18a8:	00482583          	lw	a1,4(a6)
    18ac:	0015f593          	and	a1,a1,1
    18b0:	08058663          	beqz	a1,193c <_free_r+0x188>
    18b4:	0017e693          	or	a3,a5,1
    18b8:	fed42e23          	sw	a3,-4(s0)
    18bc:	00f62023          	sw	a5,0(a2)
    18c0:	1ff00693          	li	a3,511
    18c4:	f8f6f8e3          	bgeu	a3,a5,1854 <_free_r+0xa0>
    18c8:	0097d693          	srl	a3,a5,0x9
    18cc:	00400613          	li	a2,4
    18d0:	12d66463          	bltu	a2,a3,19f8 <_free_r+0x244>
    18d4:	0067d693          	srl	a3,a5,0x6
    18d8:	03968593          	add	a1,a3,57
    18dc:	03868613          	add	a2,a3,56
    18e0:	00359593          	sll	a1,a1,0x3
    18e4:	00b505b3          	add	a1,a0,a1
    18e8:	0005a683          	lw	a3,0(a1)
    18ec:	ff858593          	add	a1,a1,-8
    18f0:	00d59863          	bne	a1,a3,1900 <_free_r+0x14c>
    18f4:	15c0006f          	j	1a50 <_free_r+0x29c>
    18f8:	0086a683          	lw	a3,8(a3)
    18fc:	00d58863          	beq	a1,a3,190c <_free_r+0x158>
    1900:	0046a603          	lw	a2,4(a3)
    1904:	ffc67613          	and	a2,a2,-4
    1908:	fec7e8e3          	bltu	a5,a2,18f8 <_free_r+0x144>
    190c:	00c6a583          	lw	a1,12(a3)
    1910:	00b72623          	sw	a1,12(a4)
    1914:	00d72423          	sw	a3,8(a4)
    1918:	00812403          	lw	s0,8(sp)
    191c:	00c12083          	lw	ra,12(sp)
    1920:	00e5a423          	sw	a4,8(a1)
    1924:	00048513          	mv	a0,s1
    1928:	00412483          	lw	s1,4(sp)
    192c:	00e6a623          	sw	a4,12(a3)
    1930:	01010113          	add	sp,sp,16
    1934:	1790006f          	j	22ac <__malloc_unlock>
    1938:	00008067          	ret
    193c:	00d787b3          	add	a5,a5,a3
    1940:	7fffe897          	auipc	a7,0x7fffe
    1944:	7e888893          	add	a7,a7,2024 # 80000128 <__malloc_av_+0x8>
    1948:	00862683          	lw	a3,8(a2)
    194c:	0f168063          	beq	a3,a7,1a2c <_free_r+0x278>
    1950:	00c62803          	lw	a6,12(a2)
    1954:	0017e593          	or	a1,a5,1
    1958:	00f70633          	add	a2,a4,a5
    195c:	0106a623          	sw	a6,12(a3)
    1960:	00d82423          	sw	a3,8(a6)
    1964:	00b72223          	sw	a1,4(a4)
    1968:	00f62023          	sw	a5,0(a2)
    196c:	ee1ff06f          	j	184c <_free_r+0x98>
    1970:	14059063          	bnez	a1,1ab0 <_free_r+0x2fc>
    1974:	00862583          	lw	a1,8(a2)
    1978:	00c62603          	lw	a2,12(a2)
    197c:	00f686b3          	add	a3,a3,a5
    1980:	0016e793          	or	a5,a3,1
    1984:	00c5a623          	sw	a2,12(a1)
    1988:	00b62423          	sw	a1,8(a2)
    198c:	00f72223          	sw	a5,4(a4)
    1990:	00d70733          	add	a4,a4,a3
    1994:	00d72023          	sw	a3,0(a4)
    1998:	ef9ff06f          	j	1890 <_free_r+0xdc>
    199c:	0015f593          	and	a1,a1,1
    19a0:	00d786b3          	add	a3,a5,a3
    19a4:	02059063          	bnez	a1,19c4 <_free_r+0x210>
    19a8:	ff842583          	lw	a1,-8(s0)
    19ac:	40b70733          	sub	a4,a4,a1
    19b0:	00c72783          	lw	a5,12(a4)
    19b4:	00872603          	lw	a2,8(a4)
    19b8:	00b686b3          	add	a3,a3,a1
    19bc:	00f62623          	sw	a5,12(a2)
    19c0:	00c7a423          	sw	a2,8(a5)
    19c4:	0016e793          	or	a5,a3,1
    19c8:	00f72223          	sw	a5,4(a4)
    19cc:	00e52423          	sw	a4,8(a0)
    19d0:	7ffff797          	auipc	a5,0x7ffff
    19d4:	d407a783          	lw	a5,-704(a5) # 80000710 <__malloc_trim_threshold>
    19d8:	eaf6ece3          	bltu	a3,a5,1890 <_free_r+0xdc>
    19dc:	7ffff597          	auipc	a1,0x7ffff
    19e0:	d545a583          	lw	a1,-684(a1) # 80000730 <__malloc_top_pad>
    19e4:	00048513          	mv	a0,s1
    19e8:	c89ff0ef          	jal	1670 <_malloc_trim_r>
    19ec:	ea5ff06f          	j	1890 <_free_r+0xdc>
    19f0:	00d787b3          	add	a5,a5,a3
    19f4:	f55ff06f          	j	1948 <_free_r+0x194>
    19f8:	01400613          	li	a2,20
    19fc:	02d67063          	bgeu	a2,a3,1a1c <_free_r+0x268>
    1a00:	05400613          	li	a2,84
    1a04:	06d66463          	bltu	a2,a3,1a6c <_free_r+0x2b8>
    1a08:	00c7d693          	srl	a3,a5,0xc
    1a0c:	06f68593          	add	a1,a3,111
    1a10:	06e68613          	add	a2,a3,110
    1a14:	00359593          	sll	a1,a1,0x3
    1a18:	ecdff06f          	j	18e4 <_free_r+0x130>
    1a1c:	05c68593          	add	a1,a3,92
    1a20:	05b68613          	add	a2,a3,91
    1a24:	00359593          	sll	a1,a1,0x3
    1a28:	ebdff06f          	j	18e4 <_free_r+0x130>
    1a2c:	00e52a23          	sw	a4,20(a0)
    1a30:	00e52823          	sw	a4,16(a0)
    1a34:	0017e693          	or	a3,a5,1
    1a38:	01172623          	sw	a7,12(a4)
    1a3c:	01172423          	sw	a7,8(a4)
    1a40:	00d72223          	sw	a3,4(a4)
    1a44:	00f70733          	add	a4,a4,a5
    1a48:	00f72023          	sw	a5,0(a4)
    1a4c:	e45ff06f          	j	1890 <_free_r+0xdc>
    1a50:	00452803          	lw	a6,4(a0)
    1a54:	40265613          	sra	a2,a2,0x2
    1a58:	00100793          	li	a5,1
    1a5c:	00c797b3          	sll	a5,a5,a2
    1a60:	0107e7b3          	or	a5,a5,a6
    1a64:	00f52223          	sw	a5,4(a0)
    1a68:	ea9ff06f          	j	1910 <_free_r+0x15c>
    1a6c:	15400613          	li	a2,340
    1a70:	00d66c63          	bltu	a2,a3,1a88 <_free_r+0x2d4>
    1a74:	00f7d693          	srl	a3,a5,0xf
    1a78:	07868593          	add	a1,a3,120
    1a7c:	07768613          	add	a2,a3,119
    1a80:	00359593          	sll	a1,a1,0x3
    1a84:	e61ff06f          	j	18e4 <_free_r+0x130>
    1a88:	55400613          	li	a2,1364
    1a8c:	00d66c63          	bltu	a2,a3,1aa4 <_free_r+0x2f0>
    1a90:	0127d693          	srl	a3,a5,0x12
    1a94:	07d68593          	add	a1,a3,125
    1a98:	07c68613          	add	a2,a3,124
    1a9c:	00359593          	sll	a1,a1,0x3
    1aa0:	e45ff06f          	j	18e4 <_free_r+0x130>
    1aa4:	3f800593          	li	a1,1016
    1aa8:	07e00613          	li	a2,126
    1aac:	e39ff06f          	j	18e4 <_free_r+0x130>
    1ab0:	0017e693          	or	a3,a5,1
    1ab4:	00d72223          	sw	a3,4(a4)
    1ab8:	00f62023          	sw	a5,0(a2)
    1abc:	dd5ff06f          	j	1890 <_free_r+0xdc>

00001ac0 <_malloc_r>:
    1ac0:	fd010113          	add	sp,sp,-48
    1ac4:	03212023          	sw	s2,32(sp)
    1ac8:	02112623          	sw	ra,44(sp)
    1acc:	02812423          	sw	s0,40(sp)
    1ad0:	02912223          	sw	s1,36(sp)
    1ad4:	01312e23          	sw	s3,28(sp)
    1ad8:	00b58793          	add	a5,a1,11
    1adc:	01600713          	li	a4,22
    1ae0:	00050913          	mv	s2,a0
    1ae4:	08f76263          	bltu	a4,a5,1b68 <_malloc_r+0xa8>
    1ae8:	01000793          	li	a5,16
    1aec:	20b7e663          	bltu	a5,a1,1cf8 <_malloc_r+0x238>
    1af0:	7b0000ef          	jal	22a0 <__malloc_lock>
    1af4:	01800793          	li	a5,24
    1af8:	00200593          	li	a1,2
    1afc:	01000493          	li	s1,16
    1b00:	7fffe997          	auipc	s3,0x7fffe
    1b04:	62098993          	add	s3,s3,1568 # 80000120 <__malloc_av_>
    1b08:	00f987b3          	add	a5,s3,a5
    1b0c:	0047a403          	lw	s0,4(a5)
    1b10:	ff878713          	add	a4,a5,-8
    1b14:	36e40463          	beq	s0,a4,1e7c <_malloc_r+0x3bc>
    1b18:	00442783          	lw	a5,4(s0)
    1b1c:	00c42683          	lw	a3,12(s0)
    1b20:	00842603          	lw	a2,8(s0)
    1b24:	ffc7f793          	and	a5,a5,-4
    1b28:	00f407b3          	add	a5,s0,a5
    1b2c:	0047a703          	lw	a4,4(a5)
    1b30:	00d62623          	sw	a3,12(a2)
    1b34:	00c6a423          	sw	a2,8(a3)
    1b38:	00176713          	or	a4,a4,1
    1b3c:	00090513          	mv	a0,s2
    1b40:	00e7a223          	sw	a4,4(a5)
    1b44:	768000ef          	jal	22ac <__malloc_unlock>
    1b48:	00840513          	add	a0,s0,8
    1b4c:	02c12083          	lw	ra,44(sp)
    1b50:	02812403          	lw	s0,40(sp)
    1b54:	02412483          	lw	s1,36(sp)
    1b58:	02012903          	lw	s2,32(sp)
    1b5c:	01c12983          	lw	s3,28(sp)
    1b60:	03010113          	add	sp,sp,48
    1b64:	00008067          	ret
    1b68:	ff87f493          	and	s1,a5,-8
    1b6c:	1807c663          	bltz	a5,1cf8 <_malloc_r+0x238>
    1b70:	18b4e463          	bltu	s1,a1,1cf8 <_malloc_r+0x238>
    1b74:	72c000ef          	jal	22a0 <__malloc_lock>
    1b78:	1f700793          	li	a5,503
    1b7c:	4097fa63          	bgeu	a5,s1,1f90 <_malloc_r+0x4d0>
    1b80:	0094d793          	srl	a5,s1,0x9
    1b84:	18078263          	beqz	a5,1d08 <_malloc_r+0x248>
    1b88:	00400713          	li	a4,4
    1b8c:	36f76063          	bltu	a4,a5,1eec <_malloc_r+0x42c>
    1b90:	0064d793          	srl	a5,s1,0x6
    1b94:	03978593          	add	a1,a5,57
    1b98:	03878813          	add	a6,a5,56
    1b9c:	00359613          	sll	a2,a1,0x3
    1ba0:	7fffe997          	auipc	s3,0x7fffe
    1ba4:	58098993          	add	s3,s3,1408 # 80000120 <__malloc_av_>
    1ba8:	00c98633          	add	a2,s3,a2
    1bac:	00462403          	lw	s0,4(a2)
    1bb0:	ff860613          	add	a2,a2,-8
    1bb4:	02860863          	beq	a2,s0,1be4 <_malloc_r+0x124>
    1bb8:	00f00513          	li	a0,15
    1bbc:	0140006f          	j	1bd0 <_malloc_r+0x110>
    1bc0:	00c42683          	lw	a3,12(s0)
    1bc4:	2a075863          	bgez	a4,1e74 <_malloc_r+0x3b4>
    1bc8:	00d60e63          	beq	a2,a3,1be4 <_malloc_r+0x124>
    1bcc:	00068413          	mv	s0,a3
    1bd0:	00442783          	lw	a5,4(s0)
    1bd4:	ffc7f793          	and	a5,a5,-4
    1bd8:	40978733          	sub	a4,a5,s1
    1bdc:	fee552e3          	bge	a0,a4,1bc0 <_malloc_r+0x100>
    1be0:	00080593          	mv	a1,a6
    1be4:	0109a403          	lw	s0,16(s3)
    1be8:	7fffe897          	auipc	a7,0x7fffe
    1bec:	54088893          	add	a7,a7,1344 # 80000128 <__malloc_av_+0x8>
    1bf0:	27140e63          	beq	s0,a7,1e6c <_malloc_r+0x3ac>
    1bf4:	00442783          	lw	a5,4(s0)
    1bf8:	00f00693          	li	a3,15
    1bfc:	ffc7f793          	and	a5,a5,-4
    1c00:	40978733          	sub	a4,a5,s1
    1c04:	38e6cc63          	blt	a3,a4,1f9c <_malloc_r+0x4dc>
    1c08:	0119aa23          	sw	a7,20(s3)
    1c0c:	0119a823          	sw	a7,16(s3)
    1c10:	36075063          	bgez	a4,1f70 <_malloc_r+0x4b0>
    1c14:	1ff00713          	li	a4,511
    1c18:	0049a503          	lw	a0,4(s3)
    1c1c:	26f76863          	bltu	a4,a5,1e8c <_malloc_r+0x3cc>
    1c20:	ff87f713          	and	a4,a5,-8
    1c24:	00870713          	add	a4,a4,8
    1c28:	00e98733          	add	a4,s3,a4
    1c2c:	00072683          	lw	a3,0(a4)
    1c30:	0057d613          	srl	a2,a5,0x5
    1c34:	00100793          	li	a5,1
    1c38:	00c797b3          	sll	a5,a5,a2
    1c3c:	00f56533          	or	a0,a0,a5
    1c40:	ff870793          	add	a5,a4,-8
    1c44:	00f42623          	sw	a5,12(s0)
    1c48:	00d42423          	sw	a3,8(s0)
    1c4c:	00a9a223          	sw	a0,4(s3)
    1c50:	00872023          	sw	s0,0(a4)
    1c54:	0086a623          	sw	s0,12(a3)
    1c58:	4025d793          	sra	a5,a1,0x2
    1c5c:	00100613          	li	a2,1
    1c60:	00f61633          	sll	a2,a2,a5
    1c64:	0ac56a63          	bltu	a0,a2,1d18 <_malloc_r+0x258>
    1c68:	00a677b3          	and	a5,a2,a0
    1c6c:	02079463          	bnez	a5,1c94 <_malloc_r+0x1d4>
    1c70:	00161613          	sll	a2,a2,0x1
    1c74:	ffc5f593          	and	a1,a1,-4
    1c78:	00a677b3          	and	a5,a2,a0
    1c7c:	00458593          	add	a1,a1,4
    1c80:	00079a63          	bnez	a5,1c94 <_malloc_r+0x1d4>
    1c84:	00161613          	sll	a2,a2,0x1
    1c88:	00a677b3          	and	a5,a2,a0
    1c8c:	00458593          	add	a1,a1,4
    1c90:	fe078ae3          	beqz	a5,1c84 <_malloc_r+0x1c4>
    1c94:	00f00813          	li	a6,15
    1c98:	00359313          	sll	t1,a1,0x3
    1c9c:	00698333          	add	t1,s3,t1
    1ca0:	00030513          	mv	a0,t1
    1ca4:	00c52783          	lw	a5,12(a0)
    1ca8:	00058e13          	mv	t3,a1
    1cac:	26f50263          	beq	a0,a5,1f10 <_malloc_r+0x450>
    1cb0:	0047a703          	lw	a4,4(a5)
    1cb4:	00078413          	mv	s0,a5
    1cb8:	00c7a783          	lw	a5,12(a5)
    1cbc:	ffc77713          	and	a4,a4,-4
    1cc0:	409706b3          	sub	a3,a4,s1
    1cc4:	26d84263          	blt	a6,a3,1f28 <_malloc_r+0x468>
    1cc8:	fe06c2e3          	bltz	a3,1cac <_malloc_r+0x1ec>
    1ccc:	00e40733          	add	a4,s0,a4
    1cd0:	00472683          	lw	a3,4(a4)
    1cd4:	00842603          	lw	a2,8(s0)
    1cd8:	00090513          	mv	a0,s2
    1cdc:	0016e693          	or	a3,a3,1
    1ce0:	00d72223          	sw	a3,4(a4)
    1ce4:	00f62623          	sw	a5,12(a2)
    1ce8:	00c7a423          	sw	a2,8(a5)
    1cec:	5c0000ef          	jal	22ac <__malloc_unlock>
    1cf0:	00840513          	add	a0,s0,8
    1cf4:	e59ff06f          	j	1b4c <_malloc_r+0x8c>
    1cf8:	00c00793          	li	a5,12
    1cfc:	00f92023          	sw	a5,0(s2)
    1d00:	00000513          	li	a0,0
    1d04:	e49ff06f          	j	1b4c <_malloc_r+0x8c>
    1d08:	20000613          	li	a2,512
    1d0c:	04000593          	li	a1,64
    1d10:	03f00813          	li	a6,63
    1d14:	e8dff06f          	j	1ba0 <_malloc_r+0xe0>
    1d18:	0089a403          	lw	s0,8(s3)
    1d1c:	01612823          	sw	s6,16(sp)
    1d20:	00442783          	lw	a5,4(s0)
    1d24:	ffc7fb13          	and	s6,a5,-4
    1d28:	009b6863          	bltu	s6,s1,1d38 <_malloc_r+0x278>
    1d2c:	409b0733          	sub	a4,s6,s1
    1d30:	00f00793          	li	a5,15
    1d34:	0ee7ca63          	blt	a5,a4,1e28 <_malloc_r+0x368>
    1d38:	01912223          	sw	s9,4(sp)
    1d3c:	7ffffc97          	auipc	s9,0x7ffff
    1d40:	9d0c8c93          	add	s9,s9,-1584 # 8000070c <__malloc_sbrk_base>
    1d44:	000ca703          	lw	a4,0(s9)
    1d48:	01412c23          	sw	s4,24(sp)
    1d4c:	01512a23          	sw	s5,20(sp)
    1d50:	01712623          	sw	s7,12(sp)
    1d54:	7ffffa97          	auipc	s5,0x7ffff
    1d58:	9dcaaa83          	lw	s5,-1572(s5) # 80000730 <__malloc_top_pad>
    1d5c:	fff00793          	li	a5,-1
    1d60:	01640a33          	add	s4,s0,s6
    1d64:	01548ab3          	add	s5,s1,s5
    1d68:	3ef70263          	beq	a4,a5,214c <_malloc_r+0x68c>
    1d6c:	000017b7          	lui	a5,0x1
    1d70:	00f78793          	add	a5,a5,15 # 100f <_read+0x97>
    1d74:	00fa8ab3          	add	s5,s5,a5
    1d78:	fffff7b7          	lui	a5,0xfffff
    1d7c:	00fafab3          	and	s5,s5,a5
    1d80:	000a8593          	mv	a1,s5
    1d84:	00090513          	mv	a0,s2
    1d88:	254060ef          	jal	7fdc <_sbrk_r>
    1d8c:	fff00793          	li	a5,-1
    1d90:	00050b93          	mv	s7,a0
    1d94:	46f50663          	beq	a0,a5,2200 <_malloc_r+0x740>
    1d98:	01812423          	sw	s8,8(sp)
    1d9c:	25456863          	bltu	a0,s4,1fec <_malloc_r+0x52c>
    1da0:	80005c17          	auipc	s8,0x80005
    1da4:	0f8c0c13          	add	s8,s8,248 # 80006e98 <__malloc_current_mallinfo>
    1da8:	000c2583          	lw	a1,0(s8)
    1dac:	00ba85b3          	add	a1,s5,a1
    1db0:	00bc2023          	sw	a1,0(s8)
    1db4:	00058713          	mv	a4,a1
    1db8:	2caa1063          	bne	s4,a0,2078 <_malloc_r+0x5b8>
    1dbc:	01451793          	sll	a5,a0,0x14
    1dc0:	2a079c63          	bnez	a5,2078 <_malloc_r+0x5b8>
    1dc4:	0089ab83          	lw	s7,8(s3)
    1dc8:	015b07b3          	add	a5,s6,s5
    1dcc:	0017e793          	or	a5,a5,1
    1dd0:	00fba223          	sw	a5,4(s7)
    1dd4:	7ffff717          	auipc	a4,0x7ffff
    1dd8:	95870713          	add	a4,a4,-1704 # 8000072c <__malloc_max_sbrked_mem>
    1ddc:	00072683          	lw	a3,0(a4)
    1de0:	00b6f463          	bgeu	a3,a1,1de8 <_malloc_r+0x328>
    1de4:	00b72023          	sw	a1,0(a4)
    1de8:	7ffff717          	auipc	a4,0x7ffff
    1dec:	94070713          	add	a4,a4,-1728 # 80000728 <__malloc_max_total_mem>
    1df0:	00072683          	lw	a3,0(a4)
    1df4:	00b6f463          	bgeu	a3,a1,1dfc <_malloc_r+0x33c>
    1df8:	00b72023          	sw	a1,0(a4)
    1dfc:	00812c03          	lw	s8,8(sp)
    1e00:	000b8413          	mv	s0,s7
    1e04:	ffc7f793          	and	a5,a5,-4
    1e08:	40978733          	sub	a4,a5,s1
    1e0c:	3897ec63          	bltu	a5,s1,21a4 <_malloc_r+0x6e4>
    1e10:	00f00793          	li	a5,15
    1e14:	38e7d863          	bge	a5,a4,21a4 <_malloc_r+0x6e4>
    1e18:	01812a03          	lw	s4,24(sp)
    1e1c:	01412a83          	lw	s5,20(sp)
    1e20:	00c12b83          	lw	s7,12(sp)
    1e24:	00412c83          	lw	s9,4(sp)
    1e28:	0014e793          	or	a5,s1,1
    1e2c:	00f42223          	sw	a5,4(s0)
    1e30:	009404b3          	add	s1,s0,s1
    1e34:	0099a423          	sw	s1,8(s3)
    1e38:	00176713          	or	a4,a4,1
    1e3c:	00090513          	mv	a0,s2
    1e40:	00e4a223          	sw	a4,4(s1)
    1e44:	468000ef          	jal	22ac <__malloc_unlock>
    1e48:	02c12083          	lw	ra,44(sp)
    1e4c:	00840513          	add	a0,s0,8
    1e50:	02812403          	lw	s0,40(sp)
    1e54:	01012b03          	lw	s6,16(sp)
    1e58:	02412483          	lw	s1,36(sp)
    1e5c:	02012903          	lw	s2,32(sp)
    1e60:	01c12983          	lw	s3,28(sp)
    1e64:	03010113          	add	sp,sp,48
    1e68:	00008067          	ret
    1e6c:	0049a503          	lw	a0,4(s3)
    1e70:	de9ff06f          	j	1c58 <_malloc_r+0x198>
    1e74:	00842603          	lw	a2,8(s0)
    1e78:	cb1ff06f          	j	1b28 <_malloc_r+0x68>
    1e7c:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1e80:	00258593          	add	a1,a1,2
    1e84:	d68780e3          	beq	a5,s0,1be4 <_malloc_r+0x124>
    1e88:	c91ff06f          	j	1b18 <_malloc_r+0x58>
    1e8c:	0097d713          	srl	a4,a5,0x9
    1e90:	00400693          	li	a3,4
    1e94:	14e6f263          	bgeu	a3,a4,1fd8 <_malloc_r+0x518>
    1e98:	01400693          	li	a3,20
    1e9c:	32e6e663          	bltu	a3,a4,21c8 <_malloc_r+0x708>
    1ea0:	05c70613          	add	a2,a4,92
    1ea4:	05b70693          	add	a3,a4,91
    1ea8:	00361613          	sll	a2,a2,0x3
    1eac:	00c98633          	add	a2,s3,a2
    1eb0:	00062703          	lw	a4,0(a2)
    1eb4:	ff860613          	add	a2,a2,-8
    1eb8:	00e61863          	bne	a2,a4,1ec8 <_malloc_r+0x408>
    1ebc:	2980006f          	j	2154 <_malloc_r+0x694>
    1ec0:	00872703          	lw	a4,8(a4)
    1ec4:	00e60863          	beq	a2,a4,1ed4 <_malloc_r+0x414>
    1ec8:	00472683          	lw	a3,4(a4)
    1ecc:	ffc6f693          	and	a3,a3,-4
    1ed0:	fed7e8e3          	bltu	a5,a3,1ec0 <_malloc_r+0x400>
    1ed4:	00c72603          	lw	a2,12(a4)
    1ed8:	00c42623          	sw	a2,12(s0)
    1edc:	00e42423          	sw	a4,8(s0)
    1ee0:	00862423          	sw	s0,8(a2)
    1ee4:	00872623          	sw	s0,12(a4)
    1ee8:	d71ff06f          	j	1c58 <_malloc_r+0x198>
    1eec:	01400713          	li	a4,20
    1ef0:	10f77863          	bgeu	a4,a5,2000 <_malloc_r+0x540>
    1ef4:	05400713          	li	a4,84
    1ef8:	2ef76663          	bltu	a4,a5,21e4 <_malloc_r+0x724>
    1efc:	00c4d793          	srl	a5,s1,0xc
    1f00:	06f78593          	add	a1,a5,111
    1f04:	06e78813          	add	a6,a5,110
    1f08:	00359613          	sll	a2,a1,0x3
    1f0c:	c95ff06f          	j	1ba0 <_malloc_r+0xe0>
    1f10:	001e0e13          	add	t3,t3,1
    1f14:	003e7793          	and	a5,t3,3
    1f18:	00850513          	add	a0,a0,8
    1f1c:	10078063          	beqz	a5,201c <_malloc_r+0x55c>
    1f20:	00c52783          	lw	a5,12(a0)
    1f24:	d89ff06f          	j	1cac <_malloc_r+0x1ec>
    1f28:	00842603          	lw	a2,8(s0)
    1f2c:	0014e593          	or	a1,s1,1
    1f30:	00b42223          	sw	a1,4(s0)
    1f34:	00f62623          	sw	a5,12(a2)
    1f38:	00c7a423          	sw	a2,8(a5)
    1f3c:	009404b3          	add	s1,s0,s1
    1f40:	0099aa23          	sw	s1,20(s3)
    1f44:	0099a823          	sw	s1,16(s3)
    1f48:	0016e793          	or	a5,a3,1
    1f4c:	0114a623          	sw	a7,12(s1)
    1f50:	0114a423          	sw	a7,8(s1)
    1f54:	00f4a223          	sw	a5,4(s1)
    1f58:	00e40733          	add	a4,s0,a4
    1f5c:	00090513          	mv	a0,s2
    1f60:	00d72023          	sw	a3,0(a4)
    1f64:	348000ef          	jal	22ac <__malloc_unlock>
    1f68:	00840513          	add	a0,s0,8
    1f6c:	be1ff06f          	j	1b4c <_malloc_r+0x8c>
    1f70:	00f407b3          	add	a5,s0,a5
    1f74:	0047a703          	lw	a4,4(a5)
    1f78:	00090513          	mv	a0,s2
    1f7c:	00176713          	or	a4,a4,1
    1f80:	00e7a223          	sw	a4,4(a5)
    1f84:	328000ef          	jal	22ac <__malloc_unlock>
    1f88:	00840513          	add	a0,s0,8
    1f8c:	bc1ff06f          	j	1b4c <_malloc_r+0x8c>
    1f90:	0034d593          	srl	a1,s1,0x3
    1f94:	00848793          	add	a5,s1,8
    1f98:	b69ff06f          	j	1b00 <_malloc_r+0x40>
    1f9c:	0014e693          	or	a3,s1,1
    1fa0:	00d42223          	sw	a3,4(s0)
    1fa4:	009404b3          	add	s1,s0,s1
    1fa8:	0099aa23          	sw	s1,20(s3)
    1fac:	0099a823          	sw	s1,16(s3)
    1fb0:	00176693          	or	a3,a4,1
    1fb4:	0114a623          	sw	a7,12(s1)
    1fb8:	0114a423          	sw	a7,8(s1)
    1fbc:	00d4a223          	sw	a3,4(s1)
    1fc0:	00f407b3          	add	a5,s0,a5
    1fc4:	00090513          	mv	a0,s2
    1fc8:	00e7a023          	sw	a4,0(a5)
    1fcc:	2e0000ef          	jal	22ac <__malloc_unlock>
    1fd0:	00840513          	add	a0,s0,8
    1fd4:	b79ff06f          	j	1b4c <_malloc_r+0x8c>
    1fd8:	0067d713          	srl	a4,a5,0x6
    1fdc:	03970613          	add	a2,a4,57
    1fe0:	03870693          	add	a3,a4,56
    1fe4:	00361613          	sll	a2,a2,0x3
    1fe8:	ec5ff06f          	j	1eac <_malloc_r+0x3ec>
    1fec:	07340c63          	beq	s0,s3,2064 <_malloc_r+0x5a4>
    1ff0:	0089a403          	lw	s0,8(s3)
    1ff4:	00812c03          	lw	s8,8(sp)
    1ff8:	00442783          	lw	a5,4(s0)
    1ffc:	e09ff06f          	j	1e04 <_malloc_r+0x344>
    2000:	05c78593          	add	a1,a5,92
    2004:	05b78813          	add	a6,a5,91
    2008:	00359613          	sll	a2,a1,0x3
    200c:	b95ff06f          	j	1ba0 <_malloc_r+0xe0>
    2010:	00832783          	lw	a5,8(t1)
    2014:	fff58593          	add	a1,a1,-1
    2018:	28679063          	bne	a5,t1,2298 <_malloc_r+0x7d8>
    201c:	0035f793          	and	a5,a1,3
    2020:	ff830313          	add	t1,t1,-8
    2024:	fe0796e3          	bnez	a5,2010 <_malloc_r+0x550>
    2028:	0049a703          	lw	a4,4(s3)
    202c:	fff64793          	not	a5,a2
    2030:	00e7f7b3          	and	a5,a5,a4
    2034:	00f9a223          	sw	a5,4(s3)
    2038:	00161613          	sll	a2,a2,0x1
    203c:	ccc7eee3          	bltu	a5,a2,1d18 <_malloc_r+0x258>
    2040:	cc060ce3          	beqz	a2,1d18 <_malloc_r+0x258>
    2044:	00f67733          	and	a4,a2,a5
    2048:	00071a63          	bnez	a4,205c <_malloc_r+0x59c>
    204c:	00161613          	sll	a2,a2,0x1
    2050:	00f67733          	and	a4,a2,a5
    2054:	004e0e13          	add	t3,t3,4
    2058:	fe070ae3          	beqz	a4,204c <_malloc_r+0x58c>
    205c:	000e0593          	mv	a1,t3
    2060:	c39ff06f          	j	1c98 <_malloc_r+0x1d8>
    2064:	80005c17          	auipc	s8,0x80005
    2068:	e34c0c13          	add	s8,s8,-460 # 80006e98 <__malloc_current_mallinfo>
    206c:	000c2703          	lw	a4,0(s8)
    2070:	00ea8733          	add	a4,s5,a4
    2074:	00ec2023          	sw	a4,0(s8)
    2078:	000ca683          	lw	a3,0(s9)
    207c:	fff00793          	li	a5,-1
    2080:	18f68663          	beq	a3,a5,220c <_malloc_r+0x74c>
    2084:	414b87b3          	sub	a5,s7,s4
    2088:	00e787b3          	add	a5,a5,a4
    208c:	00fc2023          	sw	a5,0(s8)
    2090:	007bfc93          	and	s9,s7,7
    2094:	0c0c8c63          	beqz	s9,216c <_malloc_r+0x6ac>
    2098:	419b8bb3          	sub	s7,s7,s9
    209c:	000017b7          	lui	a5,0x1
    20a0:	00878793          	add	a5,a5,8 # 1008 <_read+0x90>
    20a4:	008b8b93          	add	s7,s7,8
    20a8:	419785b3          	sub	a1,a5,s9
    20ac:	015b8ab3          	add	s5,s7,s5
    20b0:	415585b3          	sub	a1,a1,s5
    20b4:	01459593          	sll	a1,a1,0x14
    20b8:	0145da13          	srl	s4,a1,0x14
    20bc:	000a0593          	mv	a1,s4
    20c0:	00090513          	mv	a0,s2
    20c4:	719050ef          	jal	7fdc <_sbrk_r>
    20c8:	fff00793          	li	a5,-1
    20cc:	18f50063          	beq	a0,a5,224c <_malloc_r+0x78c>
    20d0:	41750533          	sub	a0,a0,s7
    20d4:	01450ab3          	add	s5,a0,s4
    20d8:	000c2703          	lw	a4,0(s8)
    20dc:	0179a423          	sw	s7,8(s3)
    20e0:	001ae793          	or	a5,s5,1
    20e4:	00ea05b3          	add	a1,s4,a4
    20e8:	00bc2023          	sw	a1,0(s8)
    20ec:	00fba223          	sw	a5,4(s7)
    20f0:	cf3402e3          	beq	s0,s3,1dd4 <_malloc_r+0x314>
    20f4:	00f00693          	li	a3,15
    20f8:	0b66f063          	bgeu	a3,s6,2198 <_malloc_r+0x6d8>
    20fc:	00442703          	lw	a4,4(s0)
    2100:	ff4b0793          	add	a5,s6,-12
    2104:	ff87f793          	and	a5,a5,-8
    2108:	00177713          	and	a4,a4,1
    210c:	00f76733          	or	a4,a4,a5
    2110:	00e42223          	sw	a4,4(s0)
    2114:	00500613          	li	a2,5
    2118:	00f40733          	add	a4,s0,a5
    211c:	00c72223          	sw	a2,4(a4)
    2120:	00c72423          	sw	a2,8(a4)
    2124:	00f6e663          	bltu	a3,a5,2130 <_malloc_r+0x670>
    2128:	004ba783          	lw	a5,4(s7)
    212c:	ca9ff06f          	j	1dd4 <_malloc_r+0x314>
    2130:	00840593          	add	a1,s0,8
    2134:	00090513          	mv	a0,s2
    2138:	e7cff0ef          	jal	17b4 <_free_r>
    213c:	0089ab83          	lw	s7,8(s3)
    2140:	000c2583          	lw	a1,0(s8)
    2144:	004ba783          	lw	a5,4(s7)
    2148:	c8dff06f          	j	1dd4 <_malloc_r+0x314>
    214c:	010a8a93          	add	s5,s5,16
    2150:	c31ff06f          	j	1d80 <_malloc_r+0x2c0>
    2154:	4026d693          	sra	a3,a3,0x2
    2158:	00100793          	li	a5,1
    215c:	00d797b3          	sll	a5,a5,a3
    2160:	00f56533          	or	a0,a0,a5
    2164:	00a9a223          	sw	a0,4(s3)
    2168:	d71ff06f          	j	1ed8 <_malloc_r+0x418>
    216c:	015b85b3          	add	a1,s7,s5
    2170:	40b005b3          	neg	a1,a1
    2174:	01459593          	sll	a1,a1,0x14
    2178:	0145da13          	srl	s4,a1,0x14
    217c:	000a0593          	mv	a1,s4
    2180:	00090513          	mv	a0,s2
    2184:	659050ef          	jal	7fdc <_sbrk_r>
    2188:	fff00793          	li	a5,-1
    218c:	f4f512e3          	bne	a0,a5,20d0 <_malloc_r+0x610>
    2190:	00000a13          	li	s4,0
    2194:	f45ff06f          	j	20d8 <_malloc_r+0x618>
    2198:	00812c03          	lw	s8,8(sp)
    219c:	00100793          	li	a5,1
    21a0:	00fba223          	sw	a5,4(s7)
    21a4:	00090513          	mv	a0,s2
    21a8:	104000ef          	jal	22ac <__malloc_unlock>
    21ac:	00000513          	li	a0,0
    21b0:	01812a03          	lw	s4,24(sp)
    21b4:	01412a83          	lw	s5,20(sp)
    21b8:	01012b03          	lw	s6,16(sp)
    21bc:	00c12b83          	lw	s7,12(sp)
    21c0:	00412c83          	lw	s9,4(sp)
    21c4:	989ff06f          	j	1b4c <_malloc_r+0x8c>
    21c8:	05400693          	li	a3,84
    21cc:	04e6e463          	bltu	a3,a4,2214 <_malloc_r+0x754>
    21d0:	00c7d713          	srl	a4,a5,0xc
    21d4:	06f70613          	add	a2,a4,111
    21d8:	06e70693          	add	a3,a4,110
    21dc:	00361613          	sll	a2,a2,0x3
    21e0:	ccdff06f          	j	1eac <_malloc_r+0x3ec>
    21e4:	15400713          	li	a4,340
    21e8:	04f76463          	bltu	a4,a5,2230 <_malloc_r+0x770>
    21ec:	00f4d793          	srl	a5,s1,0xf
    21f0:	07878593          	add	a1,a5,120
    21f4:	07778813          	add	a6,a5,119
    21f8:	00359613          	sll	a2,a1,0x3
    21fc:	9a5ff06f          	j	1ba0 <_malloc_r+0xe0>
    2200:	0089a403          	lw	s0,8(s3)
    2204:	00442783          	lw	a5,4(s0)
    2208:	bfdff06f          	j	1e04 <_malloc_r+0x344>
    220c:	017ca023          	sw	s7,0(s9)
    2210:	e81ff06f          	j	2090 <_malloc_r+0x5d0>
    2214:	15400693          	li	a3,340
    2218:	04e6e463          	bltu	a3,a4,2260 <_malloc_r+0x7a0>
    221c:	00f7d713          	srl	a4,a5,0xf
    2220:	07870613          	add	a2,a4,120
    2224:	07770693          	add	a3,a4,119
    2228:	00361613          	sll	a2,a2,0x3
    222c:	c81ff06f          	j	1eac <_malloc_r+0x3ec>
    2230:	55400713          	li	a4,1364
    2234:	04f76463          	bltu	a4,a5,227c <_malloc_r+0x7bc>
    2238:	0124d793          	srl	a5,s1,0x12
    223c:	07d78593          	add	a1,a5,125
    2240:	07c78813          	add	a6,a5,124
    2244:	00359613          	sll	a2,a1,0x3
    2248:	959ff06f          	j	1ba0 <_malloc_r+0xe0>
    224c:	ff8c8c93          	add	s9,s9,-8
    2250:	019a8ab3          	add	s5,s5,s9
    2254:	417a8ab3          	sub	s5,s5,s7
    2258:	00000a13          	li	s4,0
    225c:	e7dff06f          	j	20d8 <_malloc_r+0x618>
    2260:	55400693          	li	a3,1364
    2264:	02e6e463          	bltu	a3,a4,228c <_malloc_r+0x7cc>
    2268:	0127d713          	srl	a4,a5,0x12
    226c:	07d70613          	add	a2,a4,125
    2270:	07c70693          	add	a3,a4,124
    2274:	00361613          	sll	a2,a2,0x3
    2278:	c35ff06f          	j	1eac <_malloc_r+0x3ec>
    227c:	3f800613          	li	a2,1016
    2280:	07f00593          	li	a1,127
    2284:	07e00813          	li	a6,126
    2288:	919ff06f          	j	1ba0 <_malloc_r+0xe0>
    228c:	3f800613          	li	a2,1016
    2290:	07e00693          	li	a3,126
    2294:	c19ff06f          	j	1eac <_malloc_r+0x3ec>
    2298:	0049a783          	lw	a5,4(s3)
    229c:	d9dff06f          	j	2038 <_malloc_r+0x578>

000022a0 <__malloc_lock>:
    22a0:	7fffe517          	auipc	a0,0x7fffe
    22a4:	48050513          	add	a0,a0,1152 # 80000720 <__lock___malloc_recursive_mutex>
    22a8:	8b4ff06f          	j	135c <__retarget_lock_acquire_recursive>

000022ac <__malloc_unlock>:
    22ac:	7fffe517          	auipc	a0,0x7fffe
    22b0:	47450513          	add	a0,a0,1140 # 80000720 <__lock___malloc_recursive_mutex>
    22b4:	8acff06f          	j	1360 <__retarget_lock_release_recursive>

000022b8 <_vfprintf_r>:
    22b8:	e7010113          	add	sp,sp,-400
    22bc:	18112623          	sw	ra,396(sp)
    22c0:	00b12423          	sw	a1,8(sp)
    22c4:	00c12623          	sw	a2,12(sp)
    22c8:	00d12a23          	sw	a3,20(sp)
    22cc:	17312e23          	sw	s3,380(sp)
    22d0:	18812423          	sw	s0,392(sp)
    22d4:	00050993          	mv	s3,a0
    22d8:	3d9050ef          	jal	7eb0 <_localeconv_r>
    22dc:	00052783          	lw	a5,0(a0)
    22e0:	00078513          	mv	a0,a5
    22e4:	02f12a23          	sw	a5,52(sp)
    22e8:	afcff0ef          	jal	15e4 <strlen>
    22ec:	00050713          	mv	a4,a0
    22f0:	00800613          	li	a2,8
    22f4:	00000593          	li	a1,0
    22f8:	09010513          	add	a0,sp,144
    22fc:	02e12823          	sw	a4,48(sp)
    2300:	864ff0ef          	jal	1364 <memset>
    2304:	00c12783          	lw	a5,12(sp)
    2308:	00098863          	beqz	s3,2318 <_vfprintf_r+0x60>
    230c:	0349a703          	lw	a4,52(s3)
    2310:	00071463          	bnez	a4,2318 <_vfprintf_r+0x60>
    2314:	29d0106f          	j	3db0 <_vfprintf_r+0x1af8>
    2318:	00812703          	lw	a4,8(sp)
    231c:	06472683          	lw	a3,100(a4)
    2320:	00c71703          	lh	a4,12(a4)
    2324:	0016f693          	and	a3,a3,1
    2328:	00069863          	bnez	a3,2338 <_vfprintf_r+0x80>
    232c:	20077693          	and	a3,a4,512
    2330:	00069463          	bnez	a3,2338 <_vfprintf_r+0x80>
    2334:	3ec0106f          	j	3720 <_vfprintf_r+0x1468>
    2338:	01271693          	sll	a3,a4,0x12
    233c:	0206c863          	bltz	a3,236c <_vfprintf_r+0xb4>
    2340:	00812503          	lw	a0,8(sp)
    2344:	000025b7          	lui	a1,0x2
    2348:	ffffe637          	lui	a2,0xffffe
    234c:	06452683          	lw	a3,100(a0)
    2350:	00b76733          	or	a4,a4,a1
    2354:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    2358:	01071713          	sll	a4,a4,0x10
    235c:	41075713          	sra	a4,a4,0x10
    2360:	00c6f6b3          	and	a3,a3,a2
    2364:	00e51623          	sh	a4,12(a0)
    2368:	06d52223          	sw	a3,100(a0)
    236c:	00877693          	and	a3,a4,8
    2370:	2a068063          	beqz	a3,2610 <_vfprintf_r+0x358>
    2374:	00812683          	lw	a3,8(sp)
    2378:	0106a683          	lw	a3,16(a3)
    237c:	28068a63          	beqz	a3,2610 <_vfprintf_r+0x358>
    2380:	01a77693          	and	a3,a4,26
    2384:	00a00613          	li	a2,10
    2388:	2ac68c63          	beq	a3,a2,2640 <_vfprintf_r+0x388>
    238c:	0ac10713          	add	a4,sp,172
    2390:	17512a23          	sw	s5,372(sp)
    2394:	17812423          	sw	s8,360(sp)
    2398:	15b12e23          	sw	s11,348(sp)
    239c:	18912223          	sw	s1,388(sp)
    23a0:	19212023          	sw	s2,384(sp)
    23a4:	17412c23          	sw	s4,376(sp)
    23a8:	17612823          	sw	s6,368(sp)
    23ac:	17712623          	sw	s7,364(sp)
    23b0:	17912223          	sw	s9,356(sp)
    23b4:	17a12023          	sw	s10,352(sp)
    23b8:	0ae12023          	sw	a4,160(sp)
    23bc:	0a012423          	sw	zero,168(sp)
    23c0:	0a012223          	sw	zero,164(sp)
    23c4:	00012c23          	sw	zero,24(sp)
    23c8:	02012423          	sw	zero,40(sp)
    23cc:	02012623          	sw	zero,44(sp)
    23d0:	00070413          	mv	s0,a4
    23d4:	02012c23          	sw	zero,56(sp)
    23d8:	04012023          	sw	zero,64(sp)
    23dc:	02012e23          	sw	zero,60(sp)
    23e0:	04012623          	sw	zero,76(sp)
    23e4:	04012423          	sw	zero,72(sp)
    23e8:	00012623          	sw	zero,12(sp)
    23ec:	7fffea97          	auipc	s5,0x7fffe
    23f0:	148a8a93          	add	s5,s5,328 # 80000534 <__global_locale>
    23f4:	02500d93          	li	s11,37
    23f8:	00078c13          	mv	s8,a5
    23fc:	000c0913          	mv	s2,s8
    2400:	0e4aa483          	lw	s1,228(s5)
    2404:	2a1050ef          	jal	7ea4 <__locale_mb_cur_max>
    2408:	00050693          	mv	a3,a0
    240c:	09010713          	add	a4,sp,144
    2410:	00090613          	mv	a2,s2
    2414:	08010593          	add	a1,sp,128
    2418:	00098513          	mv	a0,s3
    241c:	000480e7          	jalr	s1
    2420:	2c050a63          	beqz	a0,26f4 <_vfprintf_r+0x43c>
    2424:	2a054a63          	bltz	a0,26d8 <_vfprintf_r+0x420>
    2428:	08012783          	lw	a5,128(sp)
    242c:	01b78663          	beq	a5,s11,2438 <_vfprintf_r+0x180>
    2430:	00a90933          	add	s2,s2,a0
    2434:	fcdff06f          	j	2400 <_vfprintf_r+0x148>
    2438:	00050493          	mv	s1,a0
    243c:	41890cb3          	sub	s9,s2,s8
    2440:	2d891063          	bne	s2,s8,2700 <_vfprintf_r+0x448>
    2444:	fff00313          	li	t1,-1
    2448:	00000e93          	li	t4,0
    244c:	00194e03          	lbu	t3,1(s2)
    2450:	06010ba3          	sb	zero,119(sp)
    2454:	00190913          	add	s2,s2,1
    2458:	00000b93          	li	s7,0
    245c:	05a00493          	li	s1,90
    2460:	000e8a13          	mv	s4,t4
    2464:	00030b13          	mv	s6,t1
    2468:	00190913          	add	s2,s2,1
    246c:	fe0e0793          	add	a5,t3,-32
    2470:	04f4ea63          	bltu	s1,a5,24c4 <_vfprintf_r+0x20c>
    2474:	0000d717          	auipc	a4,0xd
    2478:	37c70713          	add	a4,a4,892 # f7f0 <_ctype_+0x104>
    247c:	00279793          	sll	a5,a5,0x2
    2480:	00e787b3          	add	a5,a5,a4
    2484:	0007a783          	lw	a5,0(a5)
    2488:	00e787b3          	add	a5,a5,a4
    248c:	00078067          	jr	a5
    2490:	00000b93          	li	s7,0
    2494:	fd0e0713          	add	a4,t3,-48
    2498:	00900693          	li	a3,9
    249c:	00094e03          	lbu	t3,0(s2)
    24a0:	002b9793          	sll	a5,s7,0x2
    24a4:	017787b3          	add	a5,a5,s7
    24a8:	00179793          	sll	a5,a5,0x1
    24ac:	00f70bb3          	add	s7,a4,a5
    24b0:	fd0e0713          	add	a4,t3,-48
    24b4:	00190913          	add	s2,s2,1
    24b8:	fee6f2e3          	bgeu	a3,a4,249c <_vfprintf_r+0x1e4>
    24bc:	fe0e0793          	add	a5,t3,-32
    24c0:	faf4fae3          	bgeu	s1,a5,2474 <_vfprintf_r+0x1bc>
    24c4:	000a0e93          	mv	t4,s4
    24c8:	260e0a63          	beqz	t3,273c <_vfprintf_r+0x484>
    24cc:	0fc10623          	sb	t3,236(sp)
    24d0:	06010ba3          	sb	zero,119(sp)
    24d4:	00100c93          	li	s9,1
    24d8:	00000613          	li	a2,0
    24dc:	00012823          	sw	zero,16(sp)
    24e0:	00100d13          	li	s10,1
    24e4:	00000313          	li	t1,0
    24e8:	02012223          	sw	zero,36(sp)
    24ec:	02012023          	sw	zero,32(sp)
    24f0:	00000a13          	li	s4,0
    24f4:	0ec10c13          	add	s8,sp,236
    24f8:	002ef293          	and	t0,t4,2
    24fc:	00028463          	beqz	t0,2504 <_vfprintf_r+0x24c>
    2500:	002c8c93          	add	s9,s9,2
    2504:	084eff93          	and	t6,t4,132
    2508:	0a812483          	lw	s1,168(sp)
    250c:	000f9663          	bnez	t6,2518 <_vfprintf_r+0x260>
    2510:	419b8733          	sub	a4,s7,s9
    2514:	40e04663          	bgtz	a4,2920 <_vfprintf_r+0x668>
    2518:	02060a63          	beqz	a2,254c <_vfprintf_r+0x294>
    251c:	0a412703          	lw	a4,164(sp)
    2520:	07710613          	add	a2,sp,119
    2524:	00148493          	add	s1,s1,1
    2528:	00170713          	add	a4,a4,1
    252c:	00100793          	li	a5,1
    2530:	00c42023          	sw	a2,0(s0)
    2534:	00f42223          	sw	a5,4(s0)
    2538:	0a912423          	sw	s1,168(sp)
    253c:	0ae12223          	sw	a4,164(sp)
    2540:	00700613          	li	a2,7
    2544:	00840413          	add	s0,s0,8
    2548:	4ce64863          	blt	a2,a4,2a18 <_vfprintf_r+0x760>
    254c:	02028a63          	beqz	t0,2580 <_vfprintf_r+0x2c8>
    2550:	0a412703          	lw	a4,164(sp)
    2554:	07810613          	add	a2,sp,120
    2558:	00c42023          	sw	a2,0(s0)
    255c:	00248493          	add	s1,s1,2
    2560:	00200613          	li	a2,2
    2564:	00170713          	add	a4,a4,1
    2568:	00c42223          	sw	a2,4(s0)
    256c:	0a912423          	sw	s1,168(sp)
    2570:	0ae12223          	sw	a4,164(sp)
    2574:	00700613          	li	a2,7
    2578:	00840413          	add	s0,s0,8
    257c:	5ce644e3          	blt	a2,a4,3344 <_vfprintf_r+0x108c>
    2580:	08000713          	li	a4,128
    2584:	3aef80e3          	beq	t6,a4,3124 <_vfprintf_r+0xe6c>
    2588:	41a30b33          	sub	s6,t1,s10
    258c:	4b604ae3          	bgtz	s6,3240 <_vfprintf_r+0xf88>
    2590:	100ef713          	and	a4,t4,256
    2594:	1a0710e3          	bnez	a4,2f34 <_vfprintf_r+0xc7c>
    2598:	0a412783          	lw	a5,164(sp)
    259c:	01a484b3          	add	s1,s1,s10
    25a0:	01842023          	sw	s8,0(s0)
    25a4:	00178793          	add	a5,a5,1
    25a8:	01a42223          	sw	s10,4(s0)
    25ac:	0a912423          	sw	s1,168(sp)
    25b0:	0af12223          	sw	a5,164(sp)
    25b4:	00700713          	li	a4,7
    25b8:	58f74c63          	blt	a4,a5,2b50 <_vfprintf_r+0x898>
    25bc:	00840413          	add	s0,s0,8
    25c0:	004eff13          	and	t5,t4,4
    25c4:	000f0663          	beqz	t5,25d0 <_vfprintf_r+0x318>
    25c8:	419b8d33          	sub	s10,s7,s9
    25cc:	5ba04ce3          	bgtz	s10,3384 <_vfprintf_r+0x10cc>
    25d0:	000b8e93          	mv	t4,s7
    25d4:	019bd463          	bge	s7,s9,25dc <_vfprintf_r+0x324>
    25d8:	000c8e93          	mv	t4,s9
    25dc:	00c12783          	lw	a5,12(sp)
    25e0:	01d787b3          	add	a5,a5,t4
    25e4:	00f12623          	sw	a5,12(sp)
    25e8:	18049663          	bnez	s1,2774 <_vfprintf_r+0x4bc>
    25ec:	01012783          	lw	a5,16(sp)
    25f0:	0a012223          	sw	zero,164(sp)
    25f4:	00078863          	beqz	a5,2604 <_vfprintf_r+0x34c>
    25f8:	01012583          	lw	a1,16(sp)
    25fc:	00098513          	mv	a0,s3
    2600:	9b4ff0ef          	jal	17b4 <_free_r>
    2604:	0ac10413          	add	s0,sp,172
    2608:	00090c13          	mv	s8,s2
    260c:	df1ff06f          	j	23fc <_vfprintf_r+0x144>
    2610:	00812403          	lw	s0,8(sp)
    2614:	00098513          	mv	a0,s3
    2618:	00f12623          	sw	a5,12(sp)
    261c:	00040593          	mv	a1,s0
    2620:	3a4050ef          	jal	79c4 <__swsetup_r>
    2624:	00050463          	beqz	a0,262c <_vfprintf_r+0x374>
    2628:	5600206f          	j	4b88 <_vfprintf_r+0x28d0>
    262c:	00c41703          	lh	a4,12(s0)
    2630:	00a00613          	li	a2,10
    2634:	00c12783          	lw	a5,12(sp)
    2638:	01a77693          	and	a3,a4,26
    263c:	d4c698e3          	bne	a3,a2,238c <_vfprintf_r+0xd4>
    2640:	00812603          	lw	a2,8(sp)
    2644:	00e61683          	lh	a3,14(a2)
    2648:	d406c2e3          	bltz	a3,238c <_vfprintf_r+0xd4>
    264c:	06462683          	lw	a3,100(a2)
    2650:	0016f693          	and	a3,a3,1
    2654:	00069863          	bnez	a3,2664 <_vfprintf_r+0x3ac>
    2658:	20077713          	and	a4,a4,512
    265c:	00071463          	bnez	a4,2664 <_vfprintf_r+0x3ac>
    2660:	53d0106f          	j	439c <_vfprintf_r+0x20e4>
    2664:	01412683          	lw	a3,20(sp)
    2668:	00812583          	lw	a1,8(sp)
    266c:	00098513          	mv	a0,s3
    2670:	00078613          	mv	a2,a5
    2674:	0e5020ef          	jal	4f58 <__sbprintf>
    2678:	18c12083          	lw	ra,396(sp)
    267c:	18812403          	lw	s0,392(sp)
    2680:	00a12623          	sw	a0,12(sp)
    2684:	00c12503          	lw	a0,12(sp)
    2688:	17c12983          	lw	s3,380(sp)
    268c:	19010113          	add	sp,sp,400
    2690:	00008067          	ret
    2694:	00098513          	mv	a0,s3
    2698:	019050ef          	jal	7eb0 <_localeconv_r>
    269c:	00452783          	lw	a5,4(a0)
    26a0:	00078513          	mv	a0,a5
    26a4:	04f12423          	sw	a5,72(sp)
    26a8:	f3dfe0ef          	jal	15e4 <strlen>
    26ac:	00050793          	mv	a5,a0
    26b0:	00098513          	mv	a0,s3
    26b4:	00078c93          	mv	s9,a5
    26b8:	04f12623          	sw	a5,76(sp)
    26bc:	7f4050ef          	jal	7eb0 <_localeconv_r>
    26c0:	00852703          	lw	a4,8(a0)
    26c4:	02e12e23          	sw	a4,60(sp)
    26c8:	000c8463          	beqz	s9,26d0 <_vfprintf_r+0x418>
    26cc:	1ec0106f          	j	38b8 <_vfprintf_r+0x1600>
    26d0:	00094e03          	lbu	t3,0(s2)
    26d4:	d95ff06f          	j	2468 <_vfprintf_r+0x1b0>
    26d8:	00800613          	li	a2,8
    26dc:	00000593          	li	a1,0
    26e0:	09010513          	add	a0,sp,144
    26e4:	c81fe0ef          	jal	1364 <memset>
    26e8:	00100513          	li	a0,1
    26ec:	00a90933          	add	s2,s2,a0
    26f0:	d11ff06f          	j	2400 <_vfprintf_r+0x148>
    26f4:	00050493          	mv	s1,a0
    26f8:	41890cb3          	sub	s9,s2,s8
    26fc:	05890063          	beq	s2,s8,273c <_vfprintf_r+0x484>
    2700:	0a812683          	lw	a3,168(sp)
    2704:	0a412703          	lw	a4,164(sp)
    2708:	01842023          	sw	s8,0(s0)
    270c:	019686b3          	add	a3,a3,s9
    2710:	00170713          	add	a4,a4,1
    2714:	01942223          	sw	s9,4(s0)
    2718:	0ad12423          	sw	a3,168(sp)
    271c:	0ae12223          	sw	a4,164(sp)
    2720:	00700693          	li	a3,7
    2724:	00840413          	add	s0,s0,8
    2728:	02e6c863          	blt	a3,a4,2758 <_vfprintf_r+0x4a0>
    272c:	00c12783          	lw	a5,12(sp)
    2730:	019787b3          	add	a5,a5,s9
    2734:	00f12623          	sw	a5,12(sp)
    2738:	d00496e3          	bnez	s1,2444 <_vfprintf_r+0x18c>
    273c:	0a812783          	lw	a5,168(sp)
    2740:	00078463          	beqz	a5,2748 <_vfprintf_r+0x490>
    2744:	4090106f          	j	434c <_vfprintf_r+0x2094>
    2748:	00812783          	lw	a5,8(sp)
    274c:	0a012223          	sw	zero,164(sp)
    2750:	00c79783          	lh	a5,12(a5)
    2754:	0500006f          	j	27a4 <_vfprintf_r+0x4ec>
    2758:	00812583          	lw	a1,8(sp)
    275c:	0a010613          	add	a2,sp,160
    2760:	00098513          	mv	a0,s3
    2764:	211020ef          	jal	5174 <__sprint_r>
    2768:	02051a63          	bnez	a0,279c <_vfprintf_r+0x4e4>
    276c:	0ac10413          	add	s0,sp,172
    2770:	fbdff06f          	j	272c <_vfprintf_r+0x474>
    2774:	00812583          	lw	a1,8(sp)
    2778:	0a010613          	add	a2,sp,160
    277c:	00098513          	mv	a0,s3
    2780:	1f5020ef          	jal	5174 <__sprint_r>
    2784:	e60504e3          	beqz	a0,25ec <_vfprintf_r+0x334>
    2788:	01012283          	lw	t0,16(sp)
    278c:	00028863          	beqz	t0,279c <_vfprintf_r+0x4e4>
    2790:	00028593          	mv	a1,t0
    2794:	00098513          	mv	a0,s3
    2798:	81cff0ef          	jal	17b4 <_free_r>
    279c:	00812783          	lw	a5,8(sp)
    27a0:	00c79783          	lh	a5,12(a5)
    27a4:	00812703          	lw	a4,8(sp)
    27a8:	06472703          	lw	a4,100(a4)
    27ac:	00177713          	and	a4,a4,1
    27b0:	3c070463          	beqz	a4,2b78 <_vfprintf_r+0x8c0>
    27b4:	0407f793          	and	a5,a5,64
    27b8:	18412483          	lw	s1,388(sp)
    27bc:	18012903          	lw	s2,384(sp)
    27c0:	17812a03          	lw	s4,376(sp)
    27c4:	17412a83          	lw	s5,372(sp)
    27c8:	17012b03          	lw	s6,368(sp)
    27cc:	16c12b83          	lw	s7,364(sp)
    27d0:	16812c03          	lw	s8,360(sp)
    27d4:	16412c83          	lw	s9,356(sp)
    27d8:	16012d03          	lw	s10,352(sp)
    27dc:	15c12d83          	lw	s11,348(sp)
    27e0:	00078463          	beqz	a5,27e8 <_vfprintf_r+0x530>
    27e4:	3d00206f          	j	4bb4 <_vfprintf_r+0x28fc>
    27e8:	18c12083          	lw	ra,396(sp)
    27ec:	18812403          	lw	s0,392(sp)
    27f0:	00c12503          	lw	a0,12(sp)
    27f4:	17c12983          	lw	s3,380(sp)
    27f8:	19010113          	add	sp,sp,400
    27fc:	00008067          	ret
    2800:	008a7713          	and	a4,s4,8
    2804:	000a0e93          	mv	t4,s4
    2808:	000b0313          	mv	t1,s6
    280c:	00070463          	beqz	a4,2814 <_vfprintf_r+0x55c>
    2810:	0200106f          	j	3830 <_vfprintf_r+0x1578>
    2814:	01412783          	lw	a5,20(sp)
    2818:	00778b13          	add	s6,a5,7
    281c:	ff8b7b13          	and	s6,s6,-8
    2820:	000b2783          	lw	a5,0(s6)
    2824:	02f12423          	sw	a5,40(sp)
    2828:	004b2783          	lw	a5,4(s6)
    282c:	02f12623          	sw	a5,44(sp)
    2830:	008b0793          	add	a5,s6,8
    2834:	00f12a23          	sw	a5,20(sp)
    2838:	02c12a03          	lw	s4,44(sp)
    283c:	7fffe717          	auipc	a4,0x7fffe
    2840:	e6470713          	add	a4,a4,-412 # 800006a0 <__global_locale+0x16c>
    2844:	00072c83          	lw	s9,0(a4)
    2848:	00472d03          	lw	s10,4(a4)
    284c:	02812b03          	lw	s6,40(sp)
    2850:	001a1493          	sll	s1,s4,0x1
    2854:	0014d493          	srl	s1,s1,0x1
    2858:	000b0513          	mv	a0,s6
    285c:	00048593          	mv	a1,s1
    2860:	000c8613          	mv	a2,s9
    2864:	000d0693          	mv	a3,s10
    2868:	02612223          	sw	t1,36(sp)
    286c:	03c12023          	sw	t3,32(sp)
    2870:	01d12823          	sw	t4,16(sp)
    2874:	26c0c0ef          	jal	eae0 <__unorddf2>
    2878:	01012e83          	lw	t4,16(sp)
    287c:	02012e03          	lw	t3,32(sp)
    2880:	02412303          	lw	t1,36(sp)
    2884:	00050463          	beqz	a0,288c <_vfprintf_r+0x5d4>
    2888:	4080106f          	j	3c90 <_vfprintf_r+0x19d8>
    288c:	000b0513          	mv	a0,s6
    2890:	00048593          	mv	a1,s1
    2894:	000c8613          	mv	a2,s9
    2898:	000d0693          	mv	a3,s10
    289c:	0a40b0ef          	jal	d940 <__ledf2>
    28a0:	01012e83          	lw	t4,16(sp)
    28a4:	02012e03          	lw	t3,32(sp)
    28a8:	02412303          	lw	t1,36(sp)
    28ac:	00a04463          	bgtz	a0,28b4 <_vfprintf_r+0x5fc>
    28b0:	3e00106f          	j	3c90 <_vfprintf_r+0x19d8>
    28b4:	000b0513          	mv	a0,s6
    28b8:	000a0593          	mv	a1,s4
    28bc:	00000613          	li	a2,0
    28c0:	00000693          	li	a3,0
    28c4:	07c0b0ef          	jal	d940 <__ledf2>
    28c8:	01012e83          	lw	t4,16(sp)
    28cc:	02012e03          	lw	t3,32(sp)
    28d0:	00055463          	bgez	a0,28d8 <_vfprintf_r+0x620>
    28d4:	6650106f          	j	4738 <_vfprintf_r+0x2480>
    28d8:	07714603          	lbu	a2,119(sp)
    28dc:	04700713          	li	a4,71
    28e0:	0000dc17          	auipc	s8,0xd
    28e4:	c20c0c13          	add	s8,s8,-992 # f500 <__fini_array_end+0x1f8>
    28e8:	01c74663          	blt	a4,t3,28f4 <_vfprintf_r+0x63c>
    28ec:	0000dc17          	auipc	s8,0xd
    28f0:	c10c0c13          	add	s8,s8,-1008 # f4fc <__fini_array_end+0x1f4>
    28f4:	00012823          	sw	zero,16(sp)
    28f8:	02012223          	sw	zero,36(sp)
    28fc:	02012023          	sw	zero,32(sp)
    2900:	f7fefe93          	and	t4,t4,-129
    2904:	00300c93          	li	s9,3
    2908:	00300d13          	li	s10,3
    290c:	00000313          	li	t1,0
    2910:	00000a13          	li	s4,0
    2914:	be0602e3          	beqz	a2,24f8 <_vfprintf_r+0x240>
    2918:	001c8c93          	add	s9,s9,1
    291c:	bddff06f          	j	24f8 <_vfprintf_r+0x240>
    2920:	01000593          	li	a1,16
    2924:	0a412603          	lw	a2,164(sp)
    2928:	0000db17          	auipc	s6,0xd
    292c:	0dcb0b13          	add	s6,s6,220 # fa04 <blanks.1>
    2930:	0ae5dc63          	bge	a1,a4,29e8 <_vfprintf_r+0x730>
    2934:	00040793          	mv	a5,s0
    2938:	00048693          	mv	a3,s1
    293c:	01000893          	li	a7,16
    2940:	000b0493          	mv	s1,s6
    2944:	00700393          	li	t2,7
    2948:	000a0b13          	mv	s6,s4
    294c:	04512223          	sw	t0,68(sp)
    2950:	05f12823          	sw	t6,80(sp)
    2954:	05d12a23          	sw	t4,84(sp)
    2958:	05c12c23          	sw	t3,88(sp)
    295c:	00070413          	mv	s0,a4
    2960:	00030a13          	mv	s4,t1
    2964:	00c0006f          	j	2970 <_vfprintf_r+0x6b8>
    2968:	ff040413          	add	s0,s0,-16
    296c:	0488da63          	bge	a7,s0,29c0 <_vfprintf_r+0x708>
    2970:	01068693          	add	a3,a3,16
    2974:	00160613          	add	a2,a2,1
    2978:	0097a023          	sw	s1,0(a5)
    297c:	0117a223          	sw	a7,4(a5)
    2980:	0ad12423          	sw	a3,168(sp)
    2984:	0ac12223          	sw	a2,164(sp)
    2988:	00878793          	add	a5,a5,8
    298c:	fcc3dee3          	bge	t2,a2,2968 <_vfprintf_r+0x6b0>
    2990:	00812583          	lw	a1,8(sp)
    2994:	0a010613          	add	a2,sp,160
    2998:	00098513          	mv	a0,s3
    299c:	7d8020ef          	jal	5174 <__sprint_r>
    29a0:	de0514e3          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    29a4:	01000893          	li	a7,16
    29a8:	ff040413          	add	s0,s0,-16
    29ac:	0a812683          	lw	a3,168(sp)
    29b0:	0a412603          	lw	a2,164(sp)
    29b4:	0ac10793          	add	a5,sp,172
    29b8:	00700393          	li	t2,7
    29bc:	fa88cae3          	blt	a7,s0,2970 <_vfprintf_r+0x6b8>
    29c0:	04412283          	lw	t0,68(sp)
    29c4:	05012f83          	lw	t6,80(sp)
    29c8:	05412e83          	lw	t4,84(sp)
    29cc:	05812e03          	lw	t3,88(sp)
    29d0:	000a0313          	mv	t1,s4
    29d4:	00040713          	mv	a4,s0
    29d8:	000b0a13          	mv	s4,s6
    29dc:	00078413          	mv	s0,a5
    29e0:	00048b13          	mv	s6,s1
    29e4:	00068493          	mv	s1,a3
    29e8:	00e484b3          	add	s1,s1,a4
    29ec:	00160613          	add	a2,a2,1
    29f0:	00e42223          	sw	a4,4(s0)
    29f4:	01642023          	sw	s6,0(s0)
    29f8:	0a912423          	sw	s1,168(sp)
    29fc:	0ac12223          	sw	a2,164(sp)
    2a00:	00700713          	li	a4,7
    2a04:	00c75463          	bge	a4,a2,2a0c <_vfprintf_r+0x754>
    2a08:	2380106f          	j	3c40 <_vfprintf_r+0x1988>
    2a0c:	07714603          	lbu	a2,119(sp)
    2a10:	00840413          	add	s0,s0,8
    2a14:	b05ff06f          	j	2518 <_vfprintf_r+0x260>
    2a18:	00812583          	lw	a1,8(sp)
    2a1c:	0a010613          	add	a2,sp,160
    2a20:	00098513          	mv	a0,s3
    2a24:	04612e23          	sw	t1,92(sp)
    2a28:	05c12c23          	sw	t3,88(sp)
    2a2c:	05d12a23          	sw	t4,84(sp)
    2a30:	05f12823          	sw	t6,80(sp)
    2a34:	04512223          	sw	t0,68(sp)
    2a38:	73c020ef          	jal	5174 <__sprint_r>
    2a3c:	d40516e3          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    2a40:	0a812483          	lw	s1,168(sp)
    2a44:	05c12303          	lw	t1,92(sp)
    2a48:	05812e03          	lw	t3,88(sp)
    2a4c:	05412e83          	lw	t4,84(sp)
    2a50:	05012f83          	lw	t6,80(sp)
    2a54:	04412283          	lw	t0,68(sp)
    2a58:	0ac10413          	add	s0,sp,172
    2a5c:	af1ff06f          	j	254c <_vfprintf_r+0x294>
    2a60:	0a412d03          	lw	s10,164(sp)
    2a64:	01812783          	lw	a5,24(sp)
    2a68:	00100693          	li	a3,1
    2a6c:	01842023          	sw	s8,0(s0)
    2a70:	00148493          	add	s1,s1,1
    2a74:	001d0d13          	add	s10,s10,1
    2a78:	00840b13          	add	s6,s0,8
    2a7c:	32f6d0e3          	bge	a3,a5,359c <_vfprintf_r+0x12e4>
    2a80:	00100693          	li	a3,1
    2a84:	00d42223          	sw	a3,4(s0)
    2a88:	0a912423          	sw	s1,168(sp)
    2a8c:	0ba12223          	sw	s10,164(sp)
    2a90:	00700693          	li	a3,7
    2a94:	01a6d463          	bge	a3,s10,2a9c <_vfprintf_r+0x7e4>
    2a98:	0680106f          	j	3b00 <_vfprintf_r+0x1848>
    2a9c:	03012783          	lw	a5,48(sp)
    2aa0:	03412703          	lw	a4,52(sp)
    2aa4:	001d0d13          	add	s10,s10,1
    2aa8:	00f484b3          	add	s1,s1,a5
    2aac:	00eb2023          	sw	a4,0(s6)
    2ab0:	00fb2223          	sw	a5,4(s6)
    2ab4:	0a912423          	sw	s1,168(sp)
    2ab8:	0ba12223          	sw	s10,164(sp)
    2abc:	00700693          	li	a3,7
    2ac0:	008b0b13          	add	s6,s6,8
    2ac4:	01a6d463          	bge	a3,s10,2acc <_vfprintf_r+0x814>
    2ac8:	0680106f          	j	3b30 <_vfprintf_r+0x1878>
    2acc:	02812603          	lw	a2,40(sp)
    2ad0:	02c12683          	lw	a3,44(sp)
    2ad4:	01812783          	lw	a5,24(sp)
    2ad8:	00060513          	mv	a0,a2
    2adc:	00068593          	mv	a1,a3
    2ae0:	00000613          	li	a2,0
    2ae4:	00000693          	li	a3,0
    2ae8:	03d12023          	sw	t4,32(sp)
    2aec:	fff78413          	add	s0,a5,-1
    2af0:	4c50a0ef          	jal	d7b4 <__eqdf2>
    2af4:	02012e83          	lw	t4,32(sp)
    2af8:	2e0506e3          	beqz	a0,35e4 <_vfprintf_r+0x132c>
    2afc:	001c0793          	add	a5,s8,1
    2b00:	001d0d13          	add	s10,s10,1
    2b04:	008484b3          	add	s1,s1,s0
    2b08:	00fb2023          	sw	a5,0(s6)
    2b0c:	008b2223          	sw	s0,4(s6)
    2b10:	0a912423          	sw	s1,168(sp)
    2b14:	0ba12223          	sw	s10,164(sp)
    2b18:	00700793          	li	a5,7
    2b1c:	008b0b13          	add	s6,s6,8
    2b20:	29a7cce3          	blt	a5,s10,35b8 <_vfprintf_r+0x1300>
    2b24:	04012703          	lw	a4,64(sp)
    2b28:	08810793          	add	a5,sp,136
    2b2c:	001d0d13          	add	s10,s10,1
    2b30:	009704b3          	add	s1,a4,s1
    2b34:	00fb2023          	sw	a5,0(s6)
    2b38:	00eb2223          	sw	a4,4(s6)
    2b3c:	0a912423          	sw	s1,168(sp)
    2b40:	0ba12223          	sw	s10,164(sp)
    2b44:	00700793          	li	a5,7
    2b48:	008b0413          	add	s0,s6,8
    2b4c:	a7a7dae3          	bge	a5,s10,25c0 <_vfprintf_r+0x308>
    2b50:	00812583          	lw	a1,8(sp)
    2b54:	0a010613          	add	a2,sp,160
    2b58:	00098513          	mv	a0,s3
    2b5c:	03d12023          	sw	t4,32(sp)
    2b60:	614020ef          	jal	5174 <__sprint_r>
    2b64:	c20512e3          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    2b68:	0a812483          	lw	s1,168(sp)
    2b6c:	02012e83          	lw	t4,32(sp)
    2b70:	0ac10413          	add	s0,sp,172
    2b74:	a4dff06f          	j	25c0 <_vfprintf_r+0x308>
    2b78:	2007f713          	and	a4,a5,512
    2b7c:	c2071ce3          	bnez	a4,27b4 <_vfprintf_r+0x4fc>
    2b80:	00812403          	lw	s0,8(sp)
    2b84:	05842503          	lw	a0,88(s0)
    2b88:	fd8fe0ef          	jal	1360 <__retarget_lock_release_recursive>
    2b8c:	00c41783          	lh	a5,12(s0)
    2b90:	c25ff06f          	j	27b4 <_vfprintf_r+0x4fc>
    2b94:	00094e03          	lbu	t3,0(s2)
    2b98:	020a6a13          	or	s4,s4,32
    2b9c:	8cdff06f          	j	2468 <_vfprintf_r+0x1b0>
    2ba0:	01412703          	lw	a4,20(sp)
    2ba4:	04300793          	li	a5,67
    2ba8:	000a0e93          	mv	t4,s4
    2bac:	00470493          	add	s1,a4,4
    2bb0:	64fe08e3          	beq	t3,a5,3a00 <_vfprintf_r+0x1748>
    2bb4:	010a7793          	and	a5,s4,16
    2bb8:	640794e3          	bnez	a5,3a00 <_vfprintf_r+0x1748>
    2bbc:	01412783          	lw	a5,20(sp)
    2bc0:	00100c93          	li	s9,1
    2bc4:	00100d13          	li	s10,1
    2bc8:	0007a783          	lw	a5,0(a5)
    2bcc:	0ec10c13          	add	s8,sp,236
    2bd0:	0ef10623          	sb	a5,236(sp)
    2bd4:	06010ba3          	sb	zero,119(sp)
    2bd8:	00912a23          	sw	s1,20(sp)
    2bdc:	00000613          	li	a2,0
    2be0:	00012823          	sw	zero,16(sp)
    2be4:	00000313          	li	t1,0
    2be8:	02012223          	sw	zero,36(sp)
    2bec:	02012023          	sw	zero,32(sp)
    2bf0:	00000a13          	li	s4,0
    2bf4:	905ff06f          	j	24f8 <_vfprintf_r+0x240>
    2bf8:	01412783          	lw	a5,20(sp)
    2bfc:	06010ba3          	sb	zero,119(sp)
    2c00:	000b0313          	mv	t1,s6
    2c04:	0007ac03          	lw	s8,0(a5)
    2c08:	000a0e93          	mv	t4,s4
    2c0c:	00478b13          	add	s6,a5,4
    2c10:	5a0c0ce3          	beqz	s8,39c8 <_vfprintf_r+0x1710>
    2c14:	05300713          	li	a4,83
    2c18:	00ee1463          	bne	t3,a4,2c20 <_vfprintf_r+0x968>
    2c1c:	1d00106f          	j	3dec <_vfprintf_r+0x1b34>
    2c20:	010a7a13          	and	s4,s4,16
    2c24:	000a0463          	beqz	s4,2c2c <_vfprintf_r+0x974>
    2c28:	1c40106f          	j	3dec <_vfprintf_r+0x1b34>
    2c2c:	00035463          	bgez	t1,2c34 <_vfprintf_r+0x97c>
    2c30:	6d40106f          	j	4304 <_vfprintf_r+0x204c>
    2c34:	00030613          	mv	a2,t1
    2c38:	00000593          	li	a1,0
    2c3c:	000c0513          	mv	a0,s8
    2c40:	03d12023          	sw	t4,32(sp)
    2c44:	00612a23          	sw	t1,20(sp)
    2c48:	0ec050ef          	jal	7d34 <memchr>
    2c4c:	00a12823          	sw	a0,16(sp)
    2c50:	01412303          	lw	t1,20(sp)
    2c54:	02012e83          	lw	t4,32(sp)
    2c58:	00051463          	bnez	a0,2c60 <_vfprintf_r+0x9a8>
    2c5c:	1780206f          	j	4dd4 <_vfprintf_r+0x2b1c>
    2c60:	01012783          	lw	a5,16(sp)
    2c64:	07714603          	lbu	a2,119(sp)
    2c68:	01612a23          	sw	s6,20(sp)
    2c6c:	41878d33          	sub	s10,a5,s8
    2c70:	fffd4813          	not	a6,s10
    2c74:	41f85813          	sra	a6,a6,0x1f
    2c78:	02012223          	sw	zero,36(sp)
    2c7c:	02012023          	sw	zero,32(sp)
    2c80:	00012823          	sw	zero,16(sp)
    2c84:	010d7cb3          	and	s9,s10,a6
    2c88:	00000313          	li	t1,0
    2c8c:	07300e13          	li	t3,115
    2c90:	860604e3          	beqz	a2,24f8 <_vfprintf_r+0x240>
    2c94:	c85ff06f          	j	2918 <_vfprintf_r+0x660>
    2c98:	01412783          	lw	a5,20(sp)
    2c9c:	0007ab83          	lw	s7,0(a5)
    2ca0:	00478793          	add	a5,a5,4
    2ca4:	2a0bdae3          	bgez	s7,3758 <_vfprintf_r+0x14a0>
    2ca8:	41700bb3          	neg	s7,s7
    2cac:	00f12a23          	sw	a5,20(sp)
    2cb0:	00094e03          	lbu	t3,0(s2)
    2cb4:	004a6a13          	or	s4,s4,4
    2cb8:	fb0ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2cbc:	02b00793          	li	a5,43
    2cc0:	00094e03          	lbu	t3,0(s2)
    2cc4:	06f10ba3          	sb	a5,119(sp)
    2cc8:	fa0ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2ccc:	000b0313          	mv	t1,s6
    2cd0:	010a6613          	or	a2,s4,16
    2cd4:	02067793          	and	a5,a2,32
    2cd8:	1c0780e3          	beqz	a5,3698 <_vfprintf_r+0x13e0>
    2cdc:	01412783          	lw	a5,20(sp)
    2ce0:	00778b13          	add	s6,a5,7
    2ce4:	ff8b7b13          	and	s6,s6,-8
    2ce8:	000b2d03          	lw	s10,0(s6)
    2cec:	004b2c83          	lw	s9,4(s6)
    2cf0:	008b0793          	add	a5,s6,8
    2cf4:	00f12a23          	sw	a5,20(sp)
    2cf8:	00100793          	li	a5,1
    2cfc:	00000713          	li	a4,0
    2d00:	06e10ba3          	sb	a4,119(sp)
    2d04:	34034c63          	bltz	t1,305c <_vfprintf_r+0xda4>
    2d08:	019d6733          	or	a4,s10,s9
    2d0c:	f7f67e93          	and	t4,a2,-129
    2d10:	34071463          	bnez	a4,3058 <_vfprintf_r+0xda0>
    2d14:	3a031a63          	bnez	t1,30c8 <_vfprintf_r+0xe10>
    2d18:	5c079ee3          	bnez	a5,3af4 <_vfprintf_r+0x183c>
    2d1c:	00167d13          	and	s10,a2,1
    2d20:	15010c13          	add	s8,sp,336
    2d24:	2c0d10e3          	bnez	s10,37e4 <_vfprintf_r+0x152c>
    2d28:	07714603          	lbu	a2,119(sp)
    2d2c:	00030c93          	mv	s9,t1
    2d30:	01a35463          	bge	t1,s10,2d38 <_vfprintf_r+0xa80>
    2d34:	000d0c93          	mv	s9,s10
    2d38:	00012823          	sw	zero,16(sp)
    2d3c:	02012223          	sw	zero,36(sp)
    2d40:	02012023          	sw	zero,32(sp)
    2d44:	00000a13          	li	s4,0
    2d48:	fa060863          	beqz	a2,24f8 <_vfprintf_r+0x240>
    2d4c:	bcdff06f          	j	2918 <_vfprintf_r+0x660>
    2d50:	00094e03          	lbu	t3,0(s2)
    2d54:	080a6a13          	or	s4,s4,128
    2d58:	f10ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2d5c:	00094e03          	lbu	t3,0(s2)
    2d60:	02a00793          	li	a5,42
    2d64:	00190693          	add	a3,s2,1
    2d68:	00fe1463          	bne	t3,a5,2d70 <_vfprintf_r+0xab8>
    2d6c:	1100206f          	j	4e7c <_vfprintf_r+0x2bc4>
    2d70:	fd0e0713          	add	a4,t3,-48
    2d74:	00900793          	li	a5,9
    2d78:	00000b13          	li	s6,0
    2d7c:	00900613          	li	a2,9
    2d80:	02e7e463          	bltu	a5,a4,2da8 <_vfprintf_r+0xaf0>
    2d84:	0006ce03          	lbu	t3,0(a3)
    2d88:	002b1793          	sll	a5,s6,0x2
    2d8c:	016787b3          	add	a5,a5,s6
    2d90:	00179793          	sll	a5,a5,0x1
    2d94:	00e78b33          	add	s6,a5,a4
    2d98:	fd0e0713          	add	a4,t3,-48
    2d9c:	00168693          	add	a3,a3,1
    2da0:	fee672e3          	bgeu	a2,a4,2d84 <_vfprintf_r+0xacc>
    2da4:	320b4ce3          	bltz	s6,38dc <_vfprintf_r+0x1624>
    2da8:	00068913          	mv	s2,a3
    2dac:	ec0ff06f          	j	246c <_vfprintf_r+0x1b4>
    2db0:	00094e03          	lbu	t3,0(s2)
    2db4:	001a6a13          	or	s4,s4,1
    2db8:	eb0ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2dbc:	07714783          	lbu	a5,119(sp)
    2dc0:	00094e03          	lbu	t3,0(s2)
    2dc4:	ea079263          	bnez	a5,2468 <_vfprintf_r+0x1b0>
    2dc8:	02000793          	li	a5,32
    2dcc:	06f10ba3          	sb	a5,119(sp)
    2dd0:	e98ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2dd4:	00094e03          	lbu	t3,0(s2)
    2dd8:	06c00793          	li	a5,108
    2ddc:	3afe00e3          	beq	t3,a5,397c <_vfprintf_r+0x16c4>
    2de0:	010a6a13          	or	s4,s4,16
    2de4:	e84ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2de8:	00094e03          	lbu	t3,0(s2)
    2dec:	008a6a13          	or	s4,s4,8
    2df0:	e78ff06f          	j	2468 <_vfprintf_r+0x1b0>
    2df4:	000b0313          	mv	t1,s6
    2df8:	010a6e93          	or	t4,s4,16
    2dfc:	020ef793          	and	a5,t4,32
    2e00:	0c0786e3          	beqz	a5,36cc <_vfprintf_r+0x1414>
    2e04:	01412783          	lw	a5,20(sp)
    2e08:	00778b13          	add	s6,a5,7
    2e0c:	ff8b7b13          	and	s6,s6,-8
    2e10:	004b2783          	lw	a5,4(s6)
    2e14:	000b2d03          	lw	s10,0(s6)
    2e18:	008b0713          	add	a4,s6,8
    2e1c:	00e12a23          	sw	a4,20(sp)
    2e20:	00078c93          	mv	s9,a5
    2e24:	0c07cee3          	bltz	a5,3700 <_vfprintf_r+0x1448>
    2e28:	000e8613          	mv	a2,t4
    2e2c:	02034263          	bltz	t1,2e50 <_vfprintf_r+0xb98>
    2e30:	019d67b3          	or	a5,s10,s9
    2e34:	f7fef613          	and	a2,t4,-129
    2e38:	00079c63          	bnez	a5,2e50 <_vfprintf_r+0xb98>
    2e3c:	02031063          	bnez	t1,2e5c <_vfprintf_r+0xba4>
    2e40:	00000d13          	li	s10,0
    2e44:	00060e93          	mv	t4,a2
    2e48:	15010c13          	add	s8,sp,336
    2e4c:	eddff06f          	j	2d28 <_vfprintf_r+0xa70>
    2e50:	520c90e3          	bnez	s9,3b70 <_vfprintf_r+0x18b8>
    2e54:	00900793          	li	a5,9
    2e58:	51a7ece3          	bltu	a5,s10,3b70 <_vfprintf_r+0x18b8>
    2e5c:	030d0d13          	add	s10,s10,48
    2e60:	15a107a3          	sb	s10,335(sp)
    2e64:	00060e93          	mv	t4,a2
    2e68:	00100d13          	li	s10,1
    2e6c:	14f10c13          	add	s8,sp,335
    2e70:	eb9ff06f          	j	2d28 <_vfprintf_r+0xa70>
    2e74:	000b0313          	mv	t1,s6
    2e78:	010a6e93          	or	t4,s4,16
    2e7c:	020ef793          	and	a5,t4,32
    2e80:	7e078463          	beqz	a5,3668 <_vfprintf_r+0x13b0>
    2e84:	01412783          	lw	a5,20(sp)
    2e88:	00778b13          	add	s6,a5,7
    2e8c:	ff8b7b13          	and	s6,s6,-8
    2e90:	000b2d03          	lw	s10,0(s6)
    2e94:	004b2c83          	lw	s9,4(s6)
    2e98:	008b0793          	add	a5,s6,8
    2e9c:	00f12a23          	sw	a5,20(sp)
    2ea0:	bffef613          	and	a2,t4,-1025
    2ea4:	00000793          	li	a5,0
    2ea8:	e55ff06f          	j	2cfc <_vfprintf_r+0xa44>
    2eac:	00094e03          	lbu	t3,0(s2)
    2eb0:	06800793          	li	a5,104
    2eb4:	2cfe0ce3          	beq	t3,a5,398c <_vfprintf_r+0x16d4>
    2eb8:	040a6a13          	or	s4,s4,64
    2ebc:	dacff06f          	j	2468 <_vfprintf_r+0x1b0>
    2ec0:	01412703          	lw	a4,20(sp)
    2ec4:	000087b7          	lui	a5,0x8
    2ec8:	83078793          	add	a5,a5,-2000 # 7830 <__sclose+0x4>
    2ecc:	06f11c23          	sh	a5,120(sp)
    2ed0:	00470793          	add	a5,a4,4
    2ed4:	00f12a23          	sw	a5,20(sp)
    2ed8:	0000c797          	auipc	a5,0xc
    2edc:	63478793          	add	a5,a5,1588 # f50c <__fini_array_end+0x204>
    2ee0:	02f12c23          	sw	a5,56(sp)
    2ee4:	00072d03          	lw	s10,0(a4)
    2ee8:	000b0313          	mv	t1,s6
    2eec:	00000c93          	li	s9,0
    2ef0:	002a6613          	or	a2,s4,2
    2ef4:	00200793          	li	a5,2
    2ef8:	07800e13          	li	t3,120
    2efc:	e01ff06f          	j	2cfc <_vfprintf_r+0xa44>
    2f00:	020a7793          	and	a5,s4,32
    2f04:	180784e3          	beqz	a5,388c <_vfprintf_r+0x15d4>
    2f08:	01412783          	lw	a5,20(sp)
    2f0c:	00c12683          	lw	a3,12(sp)
    2f10:	0007a783          	lw	a5,0(a5)
    2f14:	41f6d713          	sra	a4,a3,0x1f
    2f18:	00d7a023          	sw	a3,0(a5)
    2f1c:	00e7a223          	sw	a4,4(a5)
    2f20:	01412783          	lw	a5,20(sp)
    2f24:	00090c13          	mv	s8,s2
    2f28:	00478793          	add	a5,a5,4
    2f2c:	00f12a23          	sw	a5,20(sp)
    2f30:	cccff06f          	j	23fc <_vfprintf_r+0x144>
    2f34:	06500713          	li	a4,101
    2f38:	b3c754e3          	bge	a4,t3,2a60 <_vfprintf_r+0x7a8>
    2f3c:	02812683          	lw	a3,40(sp)
    2f40:	02c12703          	lw	a4,44(sp)
    2f44:	00000613          	li	a2,0
    2f48:	00068513          	mv	a0,a3
    2f4c:	00070593          	mv	a1,a4
    2f50:	00000693          	li	a3,0
    2f54:	05d12223          	sw	t4,68(sp)
    2f58:	05d0a0ef          	jal	d7b4 <__eqdf2>
    2f5c:	04412e83          	lw	t4,68(sp)
    2f60:	4e051463          	bnez	a0,3448 <_vfprintf_r+0x1190>
    2f64:	0a412783          	lw	a5,164(sp)
    2f68:	0000c717          	auipc	a4,0xc
    2f6c:	5d470713          	add	a4,a4,1492 # f53c <__fini_array_end+0x234>
    2f70:	00e42023          	sw	a4,0(s0)
    2f74:	00148493          	add	s1,s1,1
    2f78:	00100713          	li	a4,1
    2f7c:	00178793          	add	a5,a5,1
    2f80:	00e42223          	sw	a4,4(s0)
    2f84:	0a912423          	sw	s1,168(sp)
    2f88:	0af12223          	sw	a5,164(sp)
    2f8c:	00700713          	li	a4,7
    2f90:	00840413          	add	s0,s0,8
    2f94:	62f746e3          	blt	a4,a5,3dc0 <_vfprintf_r+0x1b08>
    2f98:	07c12783          	lw	a5,124(sp)
    2f9c:	01812703          	lw	a4,24(sp)
    2fa0:	78e7de63          	bge	a5,a4,373c <_vfprintf_r+0x1484>
    2fa4:	03412783          	lw	a5,52(sp)
    2fa8:	03012703          	lw	a4,48(sp)
    2fac:	00840413          	add	s0,s0,8
    2fb0:	fef42c23          	sw	a5,-8(s0)
    2fb4:	0a412783          	lw	a5,164(sp)
    2fb8:	00e484b3          	add	s1,s1,a4
    2fbc:	fee42e23          	sw	a4,-4(s0)
    2fc0:	00178793          	add	a5,a5,1
    2fc4:	0a912423          	sw	s1,168(sp)
    2fc8:	0af12223          	sw	a5,164(sp)
    2fcc:	00700713          	li	a4,7
    2fd0:	1cf746e3          	blt	a4,a5,399c <_vfprintf_r+0x16e4>
    2fd4:	01812783          	lw	a5,24(sp)
    2fd8:	fff78d13          	add	s10,a5,-1
    2fdc:	dfa05263          	blez	s10,25c0 <_vfprintf_r+0x308>
    2fe0:	01000713          	li	a4,16
    2fe4:	0a412783          	lw	a5,164(sp)
    2fe8:	0000d297          	auipc	t0,0xd
    2fec:	a0c28293          	add	t0,t0,-1524 # f9f4 <zeroes.0>
    2ff0:	77a752e3          	bge	a4,s10,3f54 <_vfprintf_r+0x1c9c>
    2ff4:	00048713          	mv	a4,s1
    2ff8:	01000c13          	li	s8,16
    2ffc:	00700b13          	li	s6,7
    3000:	000e8493          	mv	s1,t4
    3004:	00028a13          	mv	s4,t0
    3008:	00c0006f          	j	3014 <_vfprintf_r+0xd5c>
    300c:	ff0d0d13          	add	s10,s10,-16
    3010:	73ac5ce3          	bge	s8,s10,3f48 <_vfprintf_r+0x1c90>
    3014:	01070713          	add	a4,a4,16
    3018:	00178793          	add	a5,a5,1
    301c:	01442023          	sw	s4,0(s0)
    3020:	01842223          	sw	s8,4(s0)
    3024:	0ae12423          	sw	a4,168(sp)
    3028:	0af12223          	sw	a5,164(sp)
    302c:	00840413          	add	s0,s0,8
    3030:	fcfb5ee3          	bge	s6,a5,300c <_vfprintf_r+0xd54>
    3034:	00812583          	lw	a1,8(sp)
    3038:	0a010613          	add	a2,sp,160
    303c:	00098513          	mv	a0,s3
    3040:	134020ef          	jal	5174 <__sprint_r>
    3044:	f4051263          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3048:	0a812703          	lw	a4,168(sp)
    304c:	0a412783          	lw	a5,164(sp)
    3050:	0ac10413          	add	s0,sp,172
    3054:	fb9ff06f          	j	300c <_vfprintf_r+0xd54>
    3058:	000e8613          	mv	a2,t4
    305c:	00100713          	li	a4,1
    3060:	dee788e3          	beq	a5,a4,2e50 <_vfprintf_r+0xb98>
    3064:	00200713          	li	a4,2
    3068:	06e78c63          	beq	a5,a4,30e0 <_vfprintf_r+0xe28>
    306c:	15010c13          	add	s8,sp,336
    3070:	01dc9793          	sll	a5,s9,0x1d
    3074:	007d7713          	and	a4,s10,7
    3078:	003d5d13          	srl	s10,s10,0x3
    307c:	03070713          	add	a4,a4,48
    3080:	01a7ed33          	or	s10,a5,s10
    3084:	003cdc93          	srl	s9,s9,0x3
    3088:	feec0fa3          	sb	a4,-1(s8)
    308c:	019d67b3          	or	a5,s10,s9
    3090:	000c0593          	mv	a1,s8
    3094:	fffc0c13          	add	s8,s8,-1
    3098:	fc079ce3          	bnez	a5,3070 <_vfprintf_r+0xdb8>
    309c:	00167693          	and	a3,a2,1
    30a0:	06068a63          	beqz	a3,3114 <_vfprintf_r+0xe5c>
    30a4:	03000693          	li	a3,48
    30a8:	06d70663          	beq	a4,a3,3114 <_vfprintf_r+0xe5c>
    30ac:	ffe58593          	add	a1,a1,-2 # 1ffe <_malloc_r+0x53e>
    30b0:	15010793          	add	a5,sp,336
    30b4:	fedc0fa3          	sb	a3,-1(s8)
    30b8:	40b78d33          	sub	s10,a5,a1
    30bc:	00060e93          	mv	t4,a2
    30c0:	00058c13          	mv	s8,a1
    30c4:	c65ff06f          	j	2d28 <_vfprintf_r+0xa70>
    30c8:	00100713          	li	a4,1
    30cc:	00e79463          	bne	a5,a4,30d4 <_vfprintf_r+0xe1c>
    30d0:	2b10106f          	j	4b80 <_vfprintf_r+0x28c8>
    30d4:	00200713          	li	a4,2
    30d8:	000e8613          	mv	a2,t4
    30dc:	f8e798e3          	bne	a5,a4,306c <_vfprintf_r+0xdb4>
    30e0:	03812683          	lw	a3,56(sp)
    30e4:	15010c13          	add	s8,sp,336
    30e8:	00fd7793          	and	a5,s10,15
    30ec:	00f687b3          	add	a5,a3,a5
    30f0:	0007c703          	lbu	a4,0(a5)
    30f4:	004d5d13          	srl	s10,s10,0x4
    30f8:	01cc9793          	sll	a5,s9,0x1c
    30fc:	01a7ed33          	or	s10,a5,s10
    3100:	004cdc93          	srl	s9,s9,0x4
    3104:	feec0fa3          	sb	a4,-1(s8)
    3108:	019d67b3          	or	a5,s10,s9
    310c:	fffc0c13          	add	s8,s8,-1
    3110:	fc079ce3          	bnez	a5,30e8 <_vfprintf_r+0xe30>
    3114:	15010793          	add	a5,sp,336
    3118:	41878d33          	sub	s10,a5,s8
    311c:	00060e93          	mv	t4,a2
    3120:	c09ff06f          	j	2d28 <_vfprintf_r+0xa70>
    3124:	419b8b33          	sub	s6,s7,s9
    3128:	c7605063          	blez	s6,2588 <_vfprintf_r+0x2d0>
    312c:	01000593          	li	a1,16
    3130:	0a412603          	lw	a2,164(sp)
    3134:	0000d297          	auipc	t0,0xd
    3138:	8c028293          	add	t0,t0,-1856 # f9f4 <zeroes.0>
    313c:	0b65d463          	bge	a1,s6,31e4 <_vfprintf_r+0xf2c>
    3140:	00040793          	mv	a5,s0
    3144:	00048713          	mv	a4,s1
    3148:	000b0413          	mv	s0,s6
    314c:	01000893          	li	a7,16
    3150:	000a0b13          	mv	s6,s4
    3154:	00700f93          	li	t6,7
    3158:	05d12223          	sw	t4,68(sp)
    315c:	05c12823          	sw	t3,80(sp)
    3160:	00030a13          	mv	s4,t1
    3164:	00028493          	mv	s1,t0
    3168:	00c0006f          	j	3174 <_vfprintf_r+0xebc>
    316c:	ff040413          	add	s0,s0,-16
    3170:	0488da63          	bge	a7,s0,31c4 <_vfprintf_r+0xf0c>
    3174:	01070713          	add	a4,a4,16
    3178:	00160613          	add	a2,a2,1
    317c:	0097a023          	sw	s1,0(a5)
    3180:	0117a223          	sw	a7,4(a5)
    3184:	0ae12423          	sw	a4,168(sp)
    3188:	0ac12223          	sw	a2,164(sp)
    318c:	00878793          	add	a5,a5,8
    3190:	fccfdee3          	bge	t6,a2,316c <_vfprintf_r+0xeb4>
    3194:	00812583          	lw	a1,8(sp)
    3198:	0a010613          	add	a2,sp,160
    319c:	00098513          	mv	a0,s3
    31a0:	7d5010ef          	jal	5174 <__sprint_r>
    31a4:	de051263          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    31a8:	01000893          	li	a7,16
    31ac:	ff040413          	add	s0,s0,-16
    31b0:	0a812703          	lw	a4,168(sp)
    31b4:	0a412603          	lw	a2,164(sp)
    31b8:	0ac10793          	add	a5,sp,172
    31bc:	00700f93          	li	t6,7
    31c0:	fa88cae3          	blt	a7,s0,3174 <_vfprintf_r+0xebc>
    31c4:	04412e83          	lw	t4,68(sp)
    31c8:	05012e03          	lw	t3,80(sp)
    31cc:	000a0313          	mv	t1,s4
    31d0:	00048293          	mv	t0,s1
    31d4:	000b0a13          	mv	s4,s6
    31d8:	00070493          	mv	s1,a4
    31dc:	00040b13          	mv	s6,s0
    31e0:	00078413          	mv	s0,a5
    31e4:	016484b3          	add	s1,s1,s6
    31e8:	00160613          	add	a2,a2,1
    31ec:	00542023          	sw	t0,0(s0)
    31f0:	01642223          	sw	s6,4(s0)
    31f4:	0a912423          	sw	s1,168(sp)
    31f8:	0ac12223          	sw	a2,164(sp)
    31fc:	00700713          	li	a4,7
    3200:	00840413          	add	s0,s0,8
    3204:	b8c75263          	bge	a4,a2,2588 <_vfprintf_r+0x2d0>
    3208:	00812583          	lw	a1,8(sp)
    320c:	0a010613          	add	a2,sp,160
    3210:	00098513          	mv	a0,s3
    3214:	04612a23          	sw	t1,84(sp)
    3218:	05c12823          	sw	t3,80(sp)
    321c:	05d12223          	sw	t4,68(sp)
    3220:	755010ef          	jal	5174 <__sprint_r>
    3224:	d6051263          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3228:	0a812483          	lw	s1,168(sp)
    322c:	05412303          	lw	t1,84(sp)
    3230:	05012e03          	lw	t3,80(sp)
    3234:	04412e83          	lw	t4,68(sp)
    3238:	0ac10413          	add	s0,sp,172
    323c:	b4cff06f          	j	2588 <_vfprintf_r+0x2d0>
    3240:	01000713          	li	a4,16
    3244:	0a412603          	lw	a2,164(sp)
    3248:	0000c297          	auipc	t0,0xc
    324c:	7ac28293          	add	t0,t0,1964 # f9f4 <zeroes.0>
    3250:	0b675063          	bge	a4,s6,32f0 <_vfprintf_r+0x1038>
    3254:	00040793          	mv	a5,s0
    3258:	00048693          	mv	a3,s1
    325c:	000b0413          	mv	s0,s6
    3260:	01000713          	li	a4,16
    3264:	00700893          	li	a7,7
    3268:	05d12223          	sw	t4,68(sp)
    326c:	000e0493          	mv	s1,t3
    3270:	00028b13          	mv	s6,t0
    3274:	00c0006f          	j	3280 <_vfprintf_r+0xfc8>
    3278:	ff040413          	add	s0,s0,-16
    327c:	04875e63          	bge	a4,s0,32d8 <_vfprintf_r+0x1020>
    3280:	01068693          	add	a3,a3,16
    3284:	00160613          	add	a2,a2,1
    3288:	0000c597          	auipc	a1,0xc
    328c:	76c58593          	add	a1,a1,1900 # f9f4 <zeroes.0>
    3290:	00b7a023          	sw	a1,0(a5)
    3294:	00e7a223          	sw	a4,4(a5)
    3298:	0ad12423          	sw	a3,168(sp)
    329c:	0ac12223          	sw	a2,164(sp)
    32a0:	00878793          	add	a5,a5,8
    32a4:	fcc8dae3          	bge	a7,a2,3278 <_vfprintf_r+0xfc0>
    32a8:	00812583          	lw	a1,8(sp)
    32ac:	0a010613          	add	a2,sp,160
    32b0:	00098513          	mv	a0,s3
    32b4:	6c1010ef          	jal	5174 <__sprint_r>
    32b8:	cc051863          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    32bc:	01000713          	li	a4,16
    32c0:	ff040413          	add	s0,s0,-16
    32c4:	0a812683          	lw	a3,168(sp)
    32c8:	0a412603          	lw	a2,164(sp)
    32cc:	0ac10793          	add	a5,sp,172
    32d0:	00700893          	li	a7,7
    32d4:	fa8746e3          	blt	a4,s0,3280 <_vfprintf_r+0xfc8>
    32d8:	04412e83          	lw	t4,68(sp)
    32dc:	00048e13          	mv	t3,s1
    32e0:	000b0293          	mv	t0,s6
    32e4:	00068493          	mv	s1,a3
    32e8:	00040b13          	mv	s6,s0
    32ec:	00078413          	mv	s0,a5
    32f0:	016484b3          	add	s1,s1,s6
    32f4:	00160613          	add	a2,a2,1
    32f8:	00542023          	sw	t0,0(s0)
    32fc:	01642223          	sw	s6,4(s0)
    3300:	0a912423          	sw	s1,168(sp)
    3304:	0ac12223          	sw	a2,164(sp)
    3308:	00700713          	li	a4,7
    330c:	00840413          	add	s0,s0,8
    3310:	a8c75063          	bge	a4,a2,2590 <_vfprintf_r+0x2d8>
    3314:	00812583          	lw	a1,8(sp)
    3318:	0a010613          	add	a2,sp,160
    331c:	00098513          	mv	a0,s3
    3320:	05c12823          	sw	t3,80(sp)
    3324:	05d12223          	sw	t4,68(sp)
    3328:	64d010ef          	jal	5174 <__sprint_r>
    332c:	c4051e63          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3330:	0a812483          	lw	s1,168(sp)
    3334:	05012e03          	lw	t3,80(sp)
    3338:	04412e83          	lw	t4,68(sp)
    333c:	0ac10413          	add	s0,sp,172
    3340:	a50ff06f          	j	2590 <_vfprintf_r+0x2d8>
    3344:	00812583          	lw	a1,8(sp)
    3348:	0a010613          	add	a2,sp,160
    334c:	00098513          	mv	a0,s3
    3350:	04612c23          	sw	t1,88(sp)
    3354:	05c12a23          	sw	t3,84(sp)
    3358:	05d12823          	sw	t4,80(sp)
    335c:	05f12223          	sw	t6,68(sp)
    3360:	615010ef          	jal	5174 <__sprint_r>
    3364:	c2051263          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3368:	0a812483          	lw	s1,168(sp)
    336c:	05812303          	lw	t1,88(sp)
    3370:	05412e03          	lw	t3,84(sp)
    3374:	05012e83          	lw	t4,80(sp)
    3378:	04412f83          	lw	t6,68(sp)
    337c:	0ac10413          	add	s0,sp,172
    3380:	a00ff06f          	j	2580 <_vfprintf_r+0x2c8>
    3384:	01000713          	li	a4,16
    3388:	0a412783          	lw	a5,164(sp)
    338c:	0000cb17          	auipc	s6,0xc
    3390:	678b0b13          	add	s6,s6,1656 # fa04 <blanks.1>
    3394:	07a75c63          	bge	a4,s10,340c <_vfprintf_r+0x1154>
    3398:	000b0713          	mv	a4,s6
    339c:	01000c13          	li	s8,16
    33a0:	00090b13          	mv	s6,s2
    33a4:	00700a13          	li	s4,7
    33a8:	00070913          	mv	s2,a4
    33ac:	00c0006f          	j	33b8 <_vfprintf_r+0x1100>
    33b0:	ff0d0d13          	add	s10,s10,-16
    33b4:	05ac5663          	bge	s8,s10,3400 <_vfprintf_r+0x1148>
    33b8:	01048493          	add	s1,s1,16
    33bc:	00178793          	add	a5,a5,1
    33c0:	01242023          	sw	s2,0(s0)
    33c4:	01842223          	sw	s8,4(s0)
    33c8:	0a912423          	sw	s1,168(sp)
    33cc:	0af12223          	sw	a5,164(sp)
    33d0:	00840413          	add	s0,s0,8
    33d4:	fcfa5ee3          	bge	s4,a5,33b0 <_vfprintf_r+0x10f8>
    33d8:	00812583          	lw	a1,8(sp)
    33dc:	0a010613          	add	a2,sp,160
    33e0:	00098513          	mv	a0,s3
    33e4:	591010ef          	jal	5174 <__sprint_r>
    33e8:	ba051063          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    33ec:	ff0d0d13          	add	s10,s10,-16
    33f0:	0a812483          	lw	s1,168(sp)
    33f4:	0a412783          	lw	a5,164(sp)
    33f8:	0ac10413          	add	s0,sp,172
    33fc:	fbac4ee3          	blt	s8,s10,33b8 <_vfprintf_r+0x1100>
    3400:	00090713          	mv	a4,s2
    3404:	000b0913          	mv	s2,s6
    3408:	00070b13          	mv	s6,a4
    340c:	01a484b3          	add	s1,s1,s10
    3410:	00178793          	add	a5,a5,1
    3414:	01642023          	sw	s6,0(s0)
    3418:	01a42223          	sw	s10,4(s0)
    341c:	0a912423          	sw	s1,168(sp)
    3420:	0af12223          	sw	a5,164(sp)
    3424:	00700713          	li	a4,7
    3428:	9af75463          	bge	a4,a5,25d0 <_vfprintf_r+0x318>
    342c:	00812583          	lw	a1,8(sp)
    3430:	0a010613          	add	a2,sp,160
    3434:	00098513          	mv	a0,s3
    3438:	53d010ef          	jal	5174 <__sprint_r>
    343c:	b4051663          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3440:	0a812483          	lw	s1,168(sp)
    3444:	98cff06f          	j	25d0 <_vfprintf_r+0x318>
    3448:	07c12683          	lw	a3,124(sp)
    344c:	30d05c63          	blez	a3,3764 <_vfprintf_r+0x14ac>
    3450:	01812783          	lw	a5,24(sp)
    3454:	000a0b13          	mv	s6,s4
    3458:	0147d463          	bge	a5,s4,3460 <_vfprintf_r+0x11a8>
    345c:	00078b13          	mv	s6,a5
    3460:	03605863          	blez	s6,3490 <_vfprintf_r+0x11d8>
    3464:	0a412683          	lw	a3,164(sp)
    3468:	016484b3          	add	s1,s1,s6
    346c:	01842023          	sw	s8,0(s0)
    3470:	00168693          	add	a3,a3,1
    3474:	01642223          	sw	s6,4(s0)
    3478:	0a912423          	sw	s1,168(sp)
    347c:	0ad12223          	sw	a3,164(sp)
    3480:	00700613          	li	a2,7
    3484:	00840413          	add	s0,s0,8
    3488:	00d65463          	bge	a2,a3,3490 <_vfprintf_r+0x11d8>
    348c:	5c40106f          	j	4a50 <_vfprintf_r+0x2798>
    3490:	fffb4693          	not	a3,s6
    3494:	41f6d693          	sra	a3,a3,0x1f
    3498:	00db7733          	and	a4,s6,a3
    349c:	40ea0b33          	sub	s6,s4,a4
    34a0:	35604ae3          	bgtz	s6,3ff4 <_vfprintf_r+0x1d3c>
    34a4:	400ef713          	and	a4,t4,1024
    34a8:	014c0333          	add	t1,s8,s4
    34ac:	00070463          	beqz	a4,34b4 <_vfprintf_r+0x11fc>
    34b0:	2980106f          	j	4748 <_vfprintf_r+0x2490>
    34b4:	07c12d03          	lw	s10,124(sp)
    34b8:	01812783          	lw	a5,24(sp)
    34bc:	5afd4063          	blt	s10,a5,3a5c <_vfprintf_r+0x17a4>
    34c0:	001ef713          	and	a4,t4,1
    34c4:	58071c63          	bnez	a4,3a5c <_vfprintf_r+0x17a4>
    34c8:	01812703          	lw	a4,24(sp)
    34cc:	00ec07b3          	add	a5,s8,a4
    34d0:	41a70d33          	sub	s10,a4,s10
    34d4:	40678b33          	sub	s6,a5,t1
    34d8:	016d5463          	bge	s10,s6,34e0 <_vfprintf_r+0x1228>
    34dc:	000d0b13          	mv	s6,s10
    34e0:	03605863          	blez	s6,3510 <_vfprintf_r+0x1258>
    34e4:	0a412703          	lw	a4,164(sp)
    34e8:	016484b3          	add	s1,s1,s6
    34ec:	00642023          	sw	t1,0(s0)
    34f0:	00170713          	add	a4,a4,1
    34f4:	01642223          	sw	s6,4(s0)
    34f8:	0a912423          	sw	s1,168(sp)
    34fc:	0ae12223          	sw	a4,164(sp)
    3500:	00700693          	li	a3,7
    3504:	00840413          	add	s0,s0,8
    3508:	00e6d463          	bge	a3,a4,3510 <_vfprintf_r+0x1258>
    350c:	5880106f          	j	4a94 <_vfprintf_r+0x27dc>
    3510:	fffb4713          	not	a4,s6
    3514:	41f75713          	sra	a4,a4,0x1f
    3518:	00eb77b3          	and	a5,s6,a4
    351c:	40fd0d33          	sub	s10,s10,a5
    3520:	8ba05063          	blez	s10,25c0 <_vfprintf_r+0x308>
    3524:	01000713          	li	a4,16
    3528:	0a412783          	lw	a5,164(sp)
    352c:	0000c297          	auipc	t0,0xc
    3530:	4c828293          	add	t0,t0,1224 # f9f4 <zeroes.0>
    3534:	23a750e3          	bge	a4,s10,3f54 <_vfprintf_r+0x1c9c>
    3538:	00048713          	mv	a4,s1
    353c:	01000c13          	li	s8,16
    3540:	00700b13          	li	s6,7
    3544:	000e8493          	mv	s1,t4
    3548:	00028a13          	mv	s4,t0
    354c:	00c0006f          	j	3558 <_vfprintf_r+0x12a0>
    3550:	ff0d0d13          	add	s10,s10,-16
    3554:	1fac5ae3          	bge	s8,s10,3f48 <_vfprintf_r+0x1c90>
    3558:	01070713          	add	a4,a4,16
    355c:	00178793          	add	a5,a5,1
    3560:	01442023          	sw	s4,0(s0)
    3564:	01842223          	sw	s8,4(s0)
    3568:	0ae12423          	sw	a4,168(sp)
    356c:	0af12223          	sw	a5,164(sp)
    3570:	00840413          	add	s0,s0,8
    3574:	fcfb5ee3          	bge	s6,a5,3550 <_vfprintf_r+0x1298>
    3578:	00812583          	lw	a1,8(sp)
    357c:	0a010613          	add	a2,sp,160
    3580:	00098513          	mv	a0,s3
    3584:	3f1010ef          	jal	5174 <__sprint_r>
    3588:	a0051063          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    358c:	0a812703          	lw	a4,168(sp)
    3590:	0a412783          	lw	a5,164(sp)
    3594:	0ac10413          	add	s0,sp,172
    3598:	fb9ff06f          	j	3550 <_vfprintf_r+0x1298>
    359c:	001ef613          	and	a2,t4,1
    35a0:	ce061063          	bnez	a2,2a80 <_vfprintf_r+0x7c8>
    35a4:	00d42223          	sw	a3,4(s0)
    35a8:	0a912423          	sw	s1,168(sp)
    35ac:	0ba12223          	sw	s10,164(sp)
    35b0:	00700793          	li	a5,7
    35b4:	d7a7d863          	bge	a5,s10,2b24 <_vfprintf_r+0x86c>
    35b8:	00812583          	lw	a1,8(sp)
    35bc:	0a010613          	add	a2,sp,160
    35c0:	00098513          	mv	a0,s3
    35c4:	03d12023          	sw	t4,32(sp)
    35c8:	3ad010ef          	jal	5174 <__sprint_r>
    35cc:	9a051e63          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    35d0:	0a812483          	lw	s1,168(sp)
    35d4:	0a412d03          	lw	s10,164(sp)
    35d8:	02012e83          	lw	t4,32(sp)
    35dc:	0ac10b13          	add	s6,sp,172
    35e0:	d44ff06f          	j	2b24 <_vfprintf_r+0x86c>
    35e4:	01812703          	lw	a4,24(sp)
    35e8:	00100793          	li	a5,1
    35ec:	d2e7dc63          	bge	a5,a4,2b24 <_vfprintf_r+0x86c>
    35f0:	01100793          	li	a5,17
    35f4:	0000c297          	auipc	t0,0xc
    35f8:	40028293          	add	t0,t0,1024 # f9f4 <zeroes.0>
    35fc:	18e7d4e3          	bge	a5,a4,3f84 <_vfprintf_r+0x1ccc>
    3600:	00040a13          	mv	s4,s0
    3604:	01000793          	li	a5,16
    3608:	00700c13          	li	s8,7
    360c:	03d12023          	sw	t4,32(sp)
    3610:	00028413          	mv	s0,t0
    3614:	00c0006f          	j	3620 <_vfprintf_r+0x1368>
    3618:	ff0a0a13          	add	s4,s4,-16
    361c:	1547dee3          	bge	a5,s4,3f78 <_vfprintf_r+0x1cc0>
    3620:	01048493          	add	s1,s1,16
    3624:	001d0d13          	add	s10,s10,1
    3628:	008b2023          	sw	s0,0(s6)
    362c:	00fb2223          	sw	a5,4(s6)
    3630:	0a912423          	sw	s1,168(sp)
    3634:	0ba12223          	sw	s10,164(sp)
    3638:	008b0b13          	add	s6,s6,8
    363c:	fdac5ee3          	bge	s8,s10,3618 <_vfprintf_r+0x1360>
    3640:	00812583          	lw	a1,8(sp)
    3644:	0a010613          	add	a2,sp,160
    3648:	00098513          	mv	a0,s3
    364c:	329010ef          	jal	5174 <__sprint_r>
    3650:	92051c63          	bnez	a0,2788 <_vfprintf_r+0x4d0>
    3654:	0a812483          	lw	s1,168(sp)
    3658:	0a412d03          	lw	s10,164(sp)
    365c:	0ac10b13          	add	s6,sp,172
    3660:	01000793          	li	a5,16
    3664:	fb5ff06f          	j	3618 <_vfprintf_r+0x1360>
    3668:	01412703          	lw	a4,20(sp)
    366c:	010ef793          	and	a5,t4,16
    3670:	00072d03          	lw	s10,0(a4)
    3674:	00470713          	add	a4,a4,4
    3678:	00e12a23          	sw	a4,20(sp)
    367c:	1a079663          	bnez	a5,3828 <_vfprintf_r+0x1570>
    3680:	040ef793          	and	a5,t4,64
    3684:	18078e63          	beqz	a5,3820 <_vfprintf_r+0x1568>
    3688:	010d1d13          	sll	s10,s10,0x10
    368c:	010d5d13          	srl	s10,s10,0x10
    3690:	00000c93          	li	s9,0
    3694:	80dff06f          	j	2ea0 <_vfprintf_r+0xbe8>
    3698:	01412703          	lw	a4,20(sp)
    369c:	01067793          	and	a5,a2,16
    36a0:	00072d03          	lw	s10,0(a4)
    36a4:	00470713          	add	a4,a4,4
    36a8:	00e12a23          	sw	a4,20(sp)
    36ac:	14079a63          	bnez	a5,3800 <_vfprintf_r+0x1548>
    36b0:	04067793          	and	a5,a2,64
    36b4:	14078063          	beqz	a5,37f4 <_vfprintf_r+0x153c>
    36b8:	010d1d13          	sll	s10,s10,0x10
    36bc:	010d5d13          	srl	s10,s10,0x10
    36c0:	00000c93          	li	s9,0
    36c4:	00100793          	li	a5,1
    36c8:	e34ff06f          	j	2cfc <_vfprintf_r+0xa44>
    36cc:	01412703          	lw	a4,20(sp)
    36d0:	010ef793          	and	a5,t4,16
    36d4:	00072d03          	lw	s10,0(a4)
    36d8:	00470713          	add	a4,a4,4
    36dc:	00e12a23          	sw	a4,20(sp)
    36e0:	12079a63          	bnez	a5,3814 <_vfprintf_r+0x155c>
    36e4:	040ef793          	and	a5,t4,64
    36e8:	12078263          	beqz	a5,380c <_vfprintf_r+0x1554>
    36ec:	010d1d13          	sll	s10,s10,0x10
    36f0:	410d5d13          	sra	s10,s10,0x10
    36f4:	41fd5c93          	sra	s9,s10,0x1f
    36f8:	000c8793          	mv	a5,s9
    36fc:	f207d663          	bgez	a5,2e28 <_vfprintf_r+0xb70>
    3700:	01a037b3          	snez	a5,s10
    3704:	419000b3          	neg	ra,s9
    3708:	40f08cb3          	sub	s9,ra,a5
    370c:	41a00d33          	neg	s10,s10
    3710:	000e8613          	mv	a2,t4
    3714:	02d00713          	li	a4,45
    3718:	00100793          	li	a5,1
    371c:	de4ff06f          	j	2d00 <_vfprintf_r+0xa48>
    3720:	00812403          	lw	s0,8(sp)
    3724:	00f12623          	sw	a5,12(sp)
    3728:	05842503          	lw	a0,88(s0)
    372c:	c31fd0ef          	jal	135c <__retarget_lock_acquire_recursive>
    3730:	00c41703          	lh	a4,12(s0)
    3734:	00c12783          	lw	a5,12(sp)
    3738:	c01fe06f          	j	2338 <_vfprintf_r+0x80>
    373c:	001ef793          	and	a5,t4,1
    3740:	00079463          	bnez	a5,3748 <_vfprintf_r+0x1490>
    3744:	e7dfe06f          	j	25c0 <_vfprintf_r+0x308>
    3748:	85dff06f          	j	2fa4 <_vfprintf_r+0xcec>
    374c:	000a0e93          	mv	t4,s4
    3750:	000b0313          	mv	t1,s6
    3754:	ea8ff06f          	j	2dfc <_vfprintf_r+0xb44>
    3758:	00094e03          	lbu	t3,0(s2)
    375c:	00f12a23          	sw	a5,20(sp)
    3760:	d09fe06f          	j	2468 <_vfprintf_r+0x1b0>
    3764:	0a412703          	lw	a4,164(sp)
    3768:	0000c617          	auipc	a2,0xc
    376c:	dd460613          	add	a2,a2,-556 # f53c <__fini_array_end+0x234>
    3770:	00c42023          	sw	a2,0(s0)
    3774:	00148493          	add	s1,s1,1
    3778:	00100613          	li	a2,1
    377c:	00170713          	add	a4,a4,1
    3780:	00c42223          	sw	a2,4(s0)
    3784:	0a912423          	sw	s1,168(sp)
    3788:	0ae12223          	sw	a4,164(sp)
    378c:	00700613          	li	a2,7
    3790:	00840413          	add	s0,s0,8
    3794:	2ee64ce3          	blt	a2,a4,428c <_vfprintf_r+0x1fd4>
    3798:	7e069e63          	bnez	a3,3f94 <_vfprintf_r+0x1cdc>
    379c:	01812783          	lw	a5,24(sp)
    37a0:	001ef713          	and	a4,t4,1
    37a4:	00f76733          	or	a4,a4,a5
    37a8:	00071463          	bnez	a4,37b0 <_vfprintf_r+0x14f8>
    37ac:	e15fe06f          	j	25c0 <_vfprintf_r+0x308>
    37b0:	03412703          	lw	a4,52(sp)
    37b4:	03012783          	lw	a5,48(sp)
    37b8:	00700693          	li	a3,7
    37bc:	00e42023          	sw	a4,0(s0)
    37c0:	0a412703          	lw	a4,164(sp)
    37c4:	009784b3          	add	s1,a5,s1
    37c8:	00f42223          	sw	a5,4(s0)
    37cc:	00170713          	add	a4,a4,1
    37d0:	0a912423          	sw	s1,168(sp)
    37d4:	0ae12223          	sw	a4,164(sp)
    37d8:	38e6c8e3          	blt	a3,a4,4368 <_vfprintf_r+0x20b0>
    37dc:	00840413          	add	s0,s0,8
    37e0:	7e80006f          	j	3fc8 <_vfprintf_r+0x1d10>
    37e4:	03000793          	li	a5,48
    37e8:	14f107a3          	sb	a5,335(sp)
    37ec:	14f10c13          	add	s8,sp,335
    37f0:	d38ff06f          	j	2d28 <_vfprintf_r+0xa70>
    37f4:	20067793          	and	a5,a2,512
    37f8:	00078463          	beqz	a5,3800 <_vfprintf_r+0x1548>
    37fc:	0ffd7d13          	zext.b	s10,s10
    3800:	00000c93          	li	s9,0
    3804:	00100793          	li	a5,1
    3808:	cf4ff06f          	j	2cfc <_vfprintf_r+0xa44>
    380c:	200ef793          	and	a5,t4,512
    3810:	2c0796e3          	bnez	a5,42dc <_vfprintf_r+0x2024>
    3814:	41fd5c93          	sra	s9,s10,0x1f
    3818:	000c8793          	mv	a5,s9
    381c:	e08ff06f          	j	2e24 <_vfprintf_r+0xb6c>
    3820:	200ef793          	and	a5,t4,512
    3824:	2a0790e3          	bnez	a5,42c4 <_vfprintf_r+0x200c>
    3828:	00000c93          	li	s9,0
    382c:	e74ff06f          	j	2ea0 <_vfprintf_r+0xbe8>
    3830:	01412783          	lw	a5,20(sp)
    3834:	06010513          	add	a0,sp,96
    3838:	03612223          	sw	s6,36(sp)
    383c:	0007a703          	lw	a4,0(a5)
    3840:	03c12023          	sw	t3,32(sp)
    3844:	00478b13          	add	s6,a5,4
    3848:	00072683          	lw	a3,0(a4)
    384c:	01412823          	sw	s4,16(sp)
    3850:	06d12023          	sw	a3,96(sp)
    3854:	00472683          	lw	a3,4(a4)
    3858:	06d12223          	sw	a3,100(sp)
    385c:	00872683          	lw	a3,8(a4)
    3860:	06d12423          	sw	a3,104(sp)
    3864:	00c72703          	lw	a4,12(a4)
    3868:	06e12623          	sw	a4,108(sp)
    386c:	4c80b0ef          	jal	ed34 <__trunctfdf2>
    3870:	02012e03          	lw	t3,32(sp)
    3874:	02412303          	lw	t1,36(sp)
    3878:	02a12423          	sw	a0,40(sp)
    387c:	02b12623          	sw	a1,44(sp)
    3880:	01612a23          	sw	s6,20(sp)
    3884:	000a0e93          	mv	t4,s4
    3888:	fb1fe06f          	j	2838 <_vfprintf_r+0x580>
    388c:	010a7793          	and	a5,s4,16
    3890:	6c079a63          	bnez	a5,3f64 <_vfprintf_r+0x1cac>
    3894:	040a7793          	and	a5,s4,64
    3898:	24079ce3          	bnez	a5,42f0 <_vfprintf_r+0x2038>
    389c:	200a7f13          	and	t5,s4,512
    38a0:	6c0f0263          	beqz	t5,3f64 <_vfprintf_r+0x1cac>
    38a4:	01412783          	lw	a5,20(sp)
    38a8:	00c12703          	lw	a4,12(sp)
    38ac:	0007a783          	lw	a5,0(a5)
    38b0:	00e78023          	sb	a4,0(a5)
    38b4:	e6cff06f          	j	2f20 <_vfprintf_r+0xc68>
    38b8:	03c12783          	lw	a5,60(sp)
    38bc:	00094e03          	lbu	t3,0(s2)
    38c0:	00079463          	bnez	a5,38c8 <_vfprintf_r+0x1610>
    38c4:	ba5fe06f          	j	2468 <_vfprintf_r+0x1b0>
    38c8:	0007c783          	lbu	a5,0(a5)
    38cc:	00079463          	bnez	a5,38d4 <_vfprintf_r+0x161c>
    38d0:	b99fe06f          	j	2468 <_vfprintf_r+0x1b0>
    38d4:	400a6a13          	or	s4,s4,1024
    38d8:	b91fe06f          	j	2468 <_vfprintf_r+0x1b0>
    38dc:	fff00b13          	li	s6,-1
    38e0:	00068913          	mv	s2,a3
    38e4:	b89fe06f          	j	246c <_vfprintf_r+0x1b4>
    38e8:	0000c797          	auipc	a5,0xc
    38ec:	c3878793          	add	a5,a5,-968 # f520 <__fini_array_end+0x218>
    38f0:	000a0e93          	mv	t4,s4
    38f4:	000b0313          	mv	t1,s6
    38f8:	02f12c23          	sw	a5,56(sp)
    38fc:	020ef793          	and	a5,t4,32
    3900:	1c078263          	beqz	a5,3ac4 <_vfprintf_r+0x180c>
    3904:	01412783          	lw	a5,20(sp)
    3908:	00778b13          	add	s6,a5,7
    390c:	ff8b7b13          	and	s6,s6,-8
    3910:	000b2d03          	lw	s10,0(s6)
    3914:	004b2c83          	lw	s9,4(s6)
    3918:	008b0793          	add	a5,s6,8
    391c:	00f12a23          	sw	a5,20(sp)
    3920:	001ef793          	and	a5,t4,1
    3924:	00078e63          	beqz	a5,3940 <_vfprintf_r+0x1688>
    3928:	019d67b3          	or	a5,s10,s9
    392c:	00078a63          	beqz	a5,3940 <_vfprintf_r+0x1688>
    3930:	03000793          	li	a5,48
    3934:	06f10c23          	sb	a5,120(sp)
    3938:	07c10ca3          	sb	t3,121(sp)
    393c:	002eee93          	or	t4,t4,2
    3940:	bffef613          	and	a2,t4,-1025
    3944:	00200793          	li	a5,2
    3948:	bb4ff06f          	j	2cfc <_vfprintf_r+0xa44>
    394c:	000b0313          	mv	t1,s6
    3950:	000a0613          	mv	a2,s4
    3954:	b80ff06f          	j	2cd4 <_vfprintf_r+0xa1c>
    3958:	000a0e93          	mv	t4,s4
    395c:	000b0313          	mv	t1,s6
    3960:	d1cff06f          	j	2e7c <_vfprintf_r+0xbc4>
    3964:	0000c797          	auipc	a5,0xc
    3968:	ba878793          	add	a5,a5,-1112 # f50c <__fini_array_end+0x204>
    396c:	000a0e93          	mv	t4,s4
    3970:	000b0313          	mv	t1,s6
    3974:	02f12c23          	sw	a5,56(sp)
    3978:	f85ff06f          	j	38fc <_vfprintf_r+0x1644>
    397c:	00194e03          	lbu	t3,1(s2)
    3980:	020a6a13          	or	s4,s4,32
    3984:	00190913          	add	s2,s2,1
    3988:	ae1fe06f          	j	2468 <_vfprintf_r+0x1b0>
    398c:	00194e03          	lbu	t3,1(s2)
    3990:	200a6a13          	or	s4,s4,512
    3994:	00190913          	add	s2,s2,1
    3998:	ad1fe06f          	j	2468 <_vfprintf_r+0x1b0>
    399c:	00812583          	lw	a1,8(sp)
    39a0:	0a010613          	add	a2,sp,160
    39a4:	00098513          	mv	a0,s3
    39a8:	03d12023          	sw	t4,32(sp)
    39ac:	7c8010ef          	jal	5174 <__sprint_r>
    39b0:	00050463          	beqz	a0,39b8 <_vfprintf_r+0x1700>
    39b4:	dd5fe06f          	j	2788 <_vfprintf_r+0x4d0>
    39b8:	0a812483          	lw	s1,168(sp)
    39bc:	02012e83          	lw	t4,32(sp)
    39c0:	0ac10413          	add	s0,sp,172
    39c4:	e10ff06f          	j	2fd4 <_vfprintf_r+0xd1c>
    39c8:	00600793          	li	a5,6
    39cc:	00030c93          	mv	s9,t1
    39d0:	0e67e6e3          	bltu	a5,t1,42bc <_vfprintf_r+0x2004>
    39d4:	01612a23          	sw	s6,20(sp)
    39d8:	00012823          	sw	zero,16(sp)
    39dc:	000c8d13          	mv	s10,s9
    39e0:	00000613          	li	a2,0
    39e4:	00000313          	li	t1,0
    39e8:	02012223          	sw	zero,36(sp)
    39ec:	02012023          	sw	zero,32(sp)
    39f0:	00000a13          	li	s4,0
    39f4:	0000cc17          	auipc	s8,0xc
    39f8:	b40c0c13          	add	s8,s8,-1216 # f534 <__fini_array_end+0x22c>
    39fc:	afdfe06f          	j	24f8 <_vfprintf_r+0x240>
    3a00:	00800613          	li	a2,8
    3a04:	00000593          	li	a1,0
    3a08:	09810513          	add	a0,sp,152
    3a0c:	03c12023          	sw	t3,32(sp)
    3a10:	01d12823          	sw	t4,16(sp)
    3a14:	951fd0ef          	jal	1364 <memset>
    3a18:	01412783          	lw	a5,20(sp)
    3a1c:	0ec10c13          	add	s8,sp,236
    3a20:	09810693          	add	a3,sp,152
    3a24:	0007a603          	lw	a2,0(a5)
    3a28:	000c0593          	mv	a1,s8
    3a2c:	00098513          	mv	a0,s3
    3a30:	530070ef          	jal	af60 <_wcrtomb_r>
    3a34:	fff00793          	li	a5,-1
    3a38:	01012e83          	lw	t4,16(sp)
    3a3c:	02012e03          	lw	t3,32(sp)
    3a40:	00050d13          	mv	s10,a0
    3a44:	00f51463          	bne	a0,a5,3a4c <_vfprintf_r+0x1794>
    3a48:	4980106f          	j	4ee0 <_vfprintf_r+0x2c28>
    3a4c:	fff54813          	not	a6,a0
    3a50:	41f85813          	sra	a6,a6,0x1f
    3a54:	01057cb3          	and	s9,a0,a6
    3a58:	97cff06f          	j	2bd4 <_vfprintf_r+0x91c>
    3a5c:	03412703          	lw	a4,52(sp)
    3a60:	03012783          	lw	a5,48(sp)
    3a64:	00700693          	li	a3,7
    3a68:	00e42023          	sw	a4,0(s0)
    3a6c:	0a412703          	lw	a4,164(sp)
    3a70:	00f484b3          	add	s1,s1,a5
    3a74:	00f42223          	sw	a5,4(s0)
    3a78:	00170713          	add	a4,a4,1
    3a7c:	0a912423          	sw	s1,168(sp)
    3a80:	0ae12223          	sw	a4,164(sp)
    3a84:	00840413          	add	s0,s0,8
    3a88:	a4e6d0e3          	bge	a3,a4,34c8 <_vfprintf_r+0x1210>
    3a8c:	00812583          	lw	a1,8(sp)
    3a90:	0a010613          	add	a2,sp,160
    3a94:	00098513          	mv	a0,s3
    3a98:	02612223          	sw	t1,36(sp)
    3a9c:	03d12023          	sw	t4,32(sp)
    3aa0:	6d4010ef          	jal	5174 <__sprint_r>
    3aa4:	00050463          	beqz	a0,3aac <_vfprintf_r+0x17f4>
    3aa8:	ce1fe06f          	j	2788 <_vfprintf_r+0x4d0>
    3aac:	07c12d03          	lw	s10,124(sp)
    3ab0:	0a812483          	lw	s1,168(sp)
    3ab4:	02412303          	lw	t1,36(sp)
    3ab8:	02012e83          	lw	t4,32(sp)
    3abc:	0ac10413          	add	s0,sp,172
    3ac0:	a09ff06f          	j	34c8 <_vfprintf_r+0x1210>
    3ac4:	01412703          	lw	a4,20(sp)
    3ac8:	010ef793          	and	a5,t4,16
    3acc:	00072d03          	lw	s10,0(a4)
    3ad0:	00470713          	add	a4,a4,4
    3ad4:	00e12a23          	sw	a4,20(sp)
    3ad8:	08079863          	bnez	a5,3b68 <_vfprintf_r+0x18b0>
    3adc:	040ef793          	and	a5,t4,64
    3ae0:	08078063          	beqz	a5,3b60 <_vfprintf_r+0x18a8>
    3ae4:	010d1d13          	sll	s10,s10,0x10
    3ae8:	010d5d13          	srl	s10,s10,0x10
    3aec:	00000c93          	li	s9,0
    3af0:	e31ff06f          	j	3920 <_vfprintf_r+0x1668>
    3af4:	00000d13          	li	s10,0
    3af8:	15010c13          	add	s8,sp,336
    3afc:	a2cff06f          	j	2d28 <_vfprintf_r+0xa70>
    3b00:	00812583          	lw	a1,8(sp)
    3b04:	0a010613          	add	a2,sp,160
    3b08:	00098513          	mv	a0,s3
    3b0c:	03d12023          	sw	t4,32(sp)
    3b10:	664010ef          	jal	5174 <__sprint_r>
    3b14:	00050463          	beqz	a0,3b1c <_vfprintf_r+0x1864>
    3b18:	c71fe06f          	j	2788 <_vfprintf_r+0x4d0>
    3b1c:	0a812483          	lw	s1,168(sp)
    3b20:	0a412d03          	lw	s10,164(sp)
    3b24:	02012e83          	lw	t4,32(sp)
    3b28:	0ac10b13          	add	s6,sp,172
    3b2c:	f71fe06f          	j	2a9c <_vfprintf_r+0x7e4>
    3b30:	00812583          	lw	a1,8(sp)
    3b34:	0a010613          	add	a2,sp,160
    3b38:	00098513          	mv	a0,s3
    3b3c:	03d12023          	sw	t4,32(sp)
    3b40:	634010ef          	jal	5174 <__sprint_r>
    3b44:	00050463          	beqz	a0,3b4c <_vfprintf_r+0x1894>
    3b48:	c41fe06f          	j	2788 <_vfprintf_r+0x4d0>
    3b4c:	0a812483          	lw	s1,168(sp)
    3b50:	0a412d03          	lw	s10,164(sp)
    3b54:	02012e83          	lw	t4,32(sp)
    3b58:	0ac10b13          	add	s6,sp,172
    3b5c:	f71fe06f          	j	2acc <_vfprintf_r+0x814>
    3b60:	200ef793          	and	a5,t4,512
    3b64:	76079663          	bnez	a5,42d0 <_vfprintf_r+0x2018>
    3b68:	00000c93          	li	s9,0
    3b6c:	db5ff06f          	j	3920 <_vfprintf_r+0x1668>
    3b70:	00000793          	li	a5,0
    3b74:	15010b13          	add	s6,sp,336
    3b78:	01212823          	sw	s2,16(sp)
    3b7c:	00078913          	mv	s2,a5
    3b80:	00098793          	mv	a5,s3
    3b84:	04812823          	sw	s0,80(sp)
    3b88:	000b0993          	mv	s3,s6
    3b8c:	03c12403          	lw	s0,60(sp)
    3b90:	40067493          	and	s1,a2,1024
    3b94:	0ff00a13          	li	s4,255
    3b98:	03c12023          	sw	t3,32(sp)
    3b9c:	02c12223          	sw	a2,36(sp)
    3ba0:	04612223          	sw	t1,68(sp)
    3ba4:	00078b13          	mv	s6,a5
    3ba8:	0280006f          	j	3bd0 <_vfprintf_r+0x1918>
    3bac:	00a00613          	li	a2,10
    3bb0:	00000693          	li	a3,0
    3bb4:	000d0513          	mv	a0,s10
    3bb8:	000c8593          	mv	a1,s9
    3bbc:	581070ef          	jal	b93c <__udivdi3>
    3bc0:	6a0c8ee3          	beqz	s9,4a7c <_vfprintf_r+0x27c4>
    3bc4:	00050d13          	mv	s10,a0
    3bc8:	00058c93          	mv	s9,a1
    3bcc:	000c0993          	mv	s3,s8
    3bd0:	00a00613          	li	a2,10
    3bd4:	00000693          	li	a3,0
    3bd8:	000d0513          	mv	a0,s10
    3bdc:	000c8593          	mv	a1,s9
    3be0:	408080ef          	jal	bfe8 <__umoddi3>
    3be4:	03050513          	add	a0,a0,48
    3be8:	fea98fa3          	sb	a0,-1(s3)
    3bec:	fff98c13          	add	s8,s3,-1
    3bf0:	00190913          	add	s2,s2,1
    3bf4:	fa048ce3          	beqz	s1,3bac <_vfprintf_r+0x18f4>
    3bf8:	00044783          	lbu	a5,0(s0)
    3bfc:	faf918e3          	bne	s2,a5,3bac <_vfprintf_r+0x18f4>
    3c00:	fb4906e3          	beq	s2,s4,3bac <_vfprintf_r+0x18f4>
    3c04:	560c9ae3          	bnez	s9,4978 <_vfprintf_r+0x26c0>
    3c08:	00900793          	li	a5,9
    3c0c:	57a7e6e3          	bltu	a5,s10,4978 <_vfprintf_r+0x26c0>
    3c10:	02412603          	lw	a2,36(sp)
    3c14:	15010793          	add	a5,sp,336
    3c18:	02812e23          	sw	s0,60(sp)
    3c1c:	01212c23          	sw	s2,24(sp)
    3c20:	02012e03          	lw	t3,32(sp)
    3c24:	01012903          	lw	s2,16(sp)
    3c28:	04412303          	lw	t1,68(sp)
    3c2c:	05012403          	lw	s0,80(sp)
    3c30:	000b0993          	mv	s3,s6
    3c34:	41878d33          	sub	s10,a5,s8
    3c38:	00060e93          	mv	t4,a2
    3c3c:	8ecff06f          	j	2d28 <_vfprintf_r+0xa70>
    3c40:	00812583          	lw	a1,8(sp)
    3c44:	0a010613          	add	a2,sp,160
    3c48:	00098513          	mv	a0,s3
    3c4c:	04612e23          	sw	t1,92(sp)
    3c50:	05c12c23          	sw	t3,88(sp)
    3c54:	05d12a23          	sw	t4,84(sp)
    3c58:	05f12823          	sw	t6,80(sp)
    3c5c:	04512223          	sw	t0,68(sp)
    3c60:	514010ef          	jal	5174 <__sprint_r>
    3c64:	00050463          	beqz	a0,3c6c <_vfprintf_r+0x19b4>
    3c68:	b21fe06f          	j	2788 <_vfprintf_r+0x4d0>
    3c6c:	07714603          	lbu	a2,119(sp)
    3c70:	0a812483          	lw	s1,168(sp)
    3c74:	05c12303          	lw	t1,92(sp)
    3c78:	05812e03          	lw	t3,88(sp)
    3c7c:	05412e83          	lw	t4,84(sp)
    3c80:	05012f83          	lw	t6,80(sp)
    3c84:	04412283          	lw	t0,68(sp)
    3c88:	0ac10413          	add	s0,sp,172
    3c8c:	88dfe06f          	j	2518 <_vfprintf_r+0x260>
    3c90:	02812883          	lw	a7,40(sp)
    3c94:	02c12703          	lw	a4,44(sp)
    3c98:	02612223          	sw	t1,36(sp)
    3c9c:	00088613          	mv	a2,a7
    3ca0:	00088513          	mv	a0,a7
    3ca4:	00070693          	mv	a3,a4
    3ca8:	00070593          	mv	a1,a4
    3cac:	03c12023          	sw	t3,32(sp)
    3cb0:	01d12823          	sw	t4,16(sp)
    3cb4:	62d0a0ef          	jal	eae0 <__unorddf2>
    3cb8:	01012e83          	lw	t4,16(sp)
    3cbc:	02012e03          	lw	t3,32(sp)
    3cc0:	02412303          	lw	t1,36(sp)
    3cc4:	00050463          	beqz	a0,3ccc <_vfprintf_r+0x1a14>
    3cc8:	0e00106f          	j	4da8 <_vfprintf_r+0x2af0>
    3ccc:	06100713          	li	a4,97
    3cd0:	08ee0263          	beq	t3,a4,3d54 <_vfprintf_r+0x1a9c>
    3cd4:	04100713          	li	a4,65
    3cd8:	05800793          	li	a5,88
    3cdc:	06ee0e63          	beq	t3,a4,3d58 <_vfprintf_r+0x1aa0>
    3ce0:	fff00713          	li	a4,-1
    3ce4:	00e31463          	bne	t1,a4,3cec <_vfprintf_r+0x1a34>
    3ce8:	01c0106f          	j	4d04 <_vfprintf_r+0x2a4c>
    3cec:	fdfe7713          	and	a4,t3,-33
    3cf0:	04700693          	li	a3,71
    3cf4:	00012823          	sw	zero,16(sp)
    3cf8:	00d71663          	bne	a4,a3,3d04 <_vfprintf_r+0x1a4c>
    3cfc:	00031463          	bnez	t1,3d04 <_vfprintf_r+0x1a4c>
    3d00:	00100313          	li	t1,1
    3d04:	100ee793          	or	a5,t4,256
    3d08:	00078b13          	mv	s6,a5
    3d0c:	02c12783          	lw	a5,44(sp)
    3d10:	04012223          	sw	zero,68(sp)
    3d14:	00078493          	mv	s1,a5
    3d18:	0007da63          	bgez	a5,3d2c <_vfprintf_r+0x1a74>
    3d1c:	800004b7          	lui	s1,0x80000
    3d20:	00f4c4b3          	xor	s1,s1,a5
    3d24:	02d00793          	li	a5,45
    3d28:	04f12223          	sw	a5,68(sp)
    3d2c:	fbfe0713          	add	a4,t3,-65
    3d30:	02500693          	li	a3,37
    3d34:	3ae6e463          	bltu	a3,a4,40dc <_vfprintf_r+0x1e24>
    3d38:	0000c697          	auipc	a3,0xc
    3d3c:	c2468693          	add	a3,a3,-988 # f95c <_ctype_+0x270>
    3d40:	00271713          	sll	a4,a4,0x2
    3d44:	00d70733          	add	a4,a4,a3
    3d48:	00072703          	lw	a4,0(a4)
    3d4c:	00d70733          	add	a4,a4,a3
    3d50:	00070067          	jr	a4
    3d54:	07800793          	li	a5,120
    3d58:	03000713          	li	a4,48
    3d5c:	06e10c23          	sb	a4,120(sp)
    3d60:	06f10ca3          	sb	a5,121(sp)
    3d64:	06300713          	li	a4,99
    3d68:	00012823          	sw	zero,16(sp)
    3d6c:	002eee93          	or	t4,t4,2
    3d70:	0ec10c13          	add	s8,sp,236
    3d74:	f86758e3          	bge	a4,t1,3d04 <_vfprintf_r+0x1a4c>
    3d78:	00130593          	add	a1,t1,1
    3d7c:	00098513          	mv	a0,s3
    3d80:	03c12023          	sw	t3,32(sp)
    3d84:	01d12c23          	sw	t4,24(sp)
    3d88:	00612823          	sw	t1,16(sp)
    3d8c:	d35fd0ef          	jal	1ac0 <_malloc_r>
    3d90:	01012303          	lw	t1,16(sp)
    3d94:	01812e83          	lw	t4,24(sp)
    3d98:	02012e03          	lw	t3,32(sp)
    3d9c:	00050c13          	mv	s8,a0
    3da0:	00051463          	bnez	a0,3da8 <_vfprintf_r+0x1af0>
    3da4:	13c0106f          	j	4ee0 <_vfprintf_r+0x2c28>
    3da8:	00a12823          	sw	a0,16(sp)
    3dac:	f59ff06f          	j	3d04 <_vfprintf_r+0x1a4c>
    3db0:	00098513          	mv	a0,s3
    3db4:	1d0030ef          	jal	6f84 <__sinit>
    3db8:	00c12783          	lw	a5,12(sp)
    3dbc:	d5cfe06f          	j	2318 <_vfprintf_r+0x60>
    3dc0:	00812583          	lw	a1,8(sp)
    3dc4:	0a010613          	add	a2,sp,160
    3dc8:	00098513          	mv	a0,s3
    3dcc:	03d12023          	sw	t4,32(sp)
    3dd0:	3a4010ef          	jal	5174 <__sprint_r>
    3dd4:	00050463          	beqz	a0,3ddc <_vfprintf_r+0x1b24>
    3dd8:	9b1fe06f          	j	2788 <_vfprintf_r+0x4d0>
    3ddc:	0a812483          	lw	s1,168(sp)
    3de0:	02012e83          	lw	t4,32(sp)
    3de4:	0ac10413          	add	s0,sp,172
    3de8:	9b0ff06f          	j	2f98 <_vfprintf_r+0xce0>
    3dec:	00800613          	li	a2,8
    3df0:	00000593          	li	a1,0
    3df4:	09810513          	add	a0,sp,152
    3df8:	02612023          	sw	t1,32(sp)
    3dfc:	01c12a23          	sw	t3,20(sp)
    3e00:	01d12823          	sw	t4,16(sp)
    3e04:	09812223          	sw	s8,132(sp)
    3e08:	d5cfd0ef          	jal	1364 <memset>
    3e0c:	02012303          	lw	t1,32(sp)
    3e10:	01012e83          	lw	t4,16(sp)
    3e14:	01412e03          	lw	t3,20(sp)
    3e18:	3a0340e3          	bltz	t1,49b8 <_vfprintf_r+0x2700>
    3e1c:	00000d13          	li	s10,0
    3e20:	01212823          	sw	s2,16(sp)
    3e24:	000c0c93          	mv	s9,s8
    3e28:	fff00493          	li	s1,-1
    3e2c:	000b0c13          	mv	s8,s6
    3e30:	000e8a13          	mv	s4,t4
    3e34:	00040b13          	mv	s6,s0
    3e38:	000d0913          	mv	s2,s10
    3e3c:	00030413          	mv	s0,t1
    3e40:	0300006f          	j	3e70 <_vfprintf_r+0x1bb8>
    3e44:	09810693          	add	a3,sp,152
    3e48:	0ec10593          	add	a1,sp,236
    3e4c:	00098513          	mv	a0,s3
    3e50:	110070ef          	jal	af60 <_wcrtomb_r>
    3e54:	68950ae3          	beq	a0,s1,4ce8 <_vfprintf_r+0x2a30>
    3e58:	00a907b3          	add	a5,s2,a0
    3e5c:	02f44263          	blt	s0,a5,3e80 <_vfprintf_r+0x1bc8>
    3e60:	004d0d13          	add	s10,s10,4
    3e64:	00879463          	bne	a5,s0,3e6c <_vfprintf_r+0x1bb4>
    3e68:	7990006f          	j	4e00 <_vfprintf_r+0x2b48>
    3e6c:	00078913          	mv	s2,a5
    3e70:	08412783          	lw	a5,132(sp)
    3e74:	01a787b3          	add	a5,a5,s10
    3e78:	0007a603          	lw	a2,0(a5)
    3e7c:	fc0614e3          	bnez	a2,3e44 <_vfprintf_r+0x1b8c>
    3e80:	00090d13          	mv	s10,s2
    3e84:	01412e03          	lw	t3,20(sp)
    3e88:	01012903          	lw	s2,16(sp)
    3e8c:	000b0413          	mv	s0,s6
    3e90:	000a0e93          	mv	t4,s4
    3e94:	000c0b13          	mv	s6,s8
    3e98:	000c8c13          	mv	s8,s9
    3e9c:	340d0ce3          	beqz	s10,49f4 <_vfprintf_r+0x273c>
    3ea0:	06300793          	li	a5,99
    3ea4:	59a7dee3          	bge	a5,s10,4c40 <_vfprintf_r+0x2988>
    3ea8:	001d0593          	add	a1,s10,1
    3eac:	00098513          	mv	a0,s3
    3eb0:	01c12a23          	sw	t3,20(sp)
    3eb4:	01d12823          	sw	t4,16(sp)
    3eb8:	c09fd0ef          	jal	1ac0 <_malloc_r>
    3ebc:	01012e83          	lw	t4,16(sp)
    3ec0:	01412e03          	lw	t3,20(sp)
    3ec4:	00050c13          	mv	s8,a0
    3ec8:	620500e3          	beqz	a0,4ce8 <_vfprintf_r+0x2a30>
    3ecc:	00a12823          	sw	a0,16(sp)
    3ed0:	00800613          	li	a2,8
    3ed4:	00000593          	li	a1,0
    3ed8:	09810513          	add	a0,sp,152
    3edc:	03c12023          	sw	t3,32(sp)
    3ee0:	01d12a23          	sw	t4,20(sp)
    3ee4:	c80fd0ef          	jal	1364 <memset>
    3ee8:	09810713          	add	a4,sp,152
    3eec:	000d0693          	mv	a3,s10
    3ef0:	08410613          	add	a2,sp,132
    3ef4:	000c0593          	mv	a1,s8
    3ef8:	00098513          	mv	a0,s3
    3efc:	0f0070ef          	jal	afec <_wcsrtombs_r>
    3f00:	01412e83          	lw	t4,20(sp)
    3f04:	02012e03          	lw	t3,32(sp)
    3f08:	00ad0463          	beq	s10,a0,3f10 <_vfprintf_r+0x1c58>
    3f0c:	0240106f          	j	4f30 <_vfprintf_r+0x2c78>
    3f10:	01ac0733          	add	a4,s8,s10
    3f14:	00070023          	sb	zero,0(a4)
    3f18:	07714603          	lbu	a2,119(sp)
    3f1c:	fffd4813          	not	a6,s10
    3f20:	41f85813          	sra	a6,a6,0x1f
    3f24:	01612a23          	sw	s6,20(sp)
    3f28:	02012223          	sw	zero,36(sp)
    3f2c:	02012023          	sw	zero,32(sp)
    3f30:	010d7cb3          	and	s9,s10,a6
    3f34:	00000313          	li	t1,0
    3f38:	00000a13          	li	s4,0
    3f3c:	00061463          	bnez	a2,3f44 <_vfprintf_r+0x1c8c>
    3f40:	db8fe06f          	j	24f8 <_vfprintf_r+0x240>
    3f44:	9d5fe06f          	j	2918 <_vfprintf_r+0x660>
    3f48:	00048e93          	mv	t4,s1
    3f4c:	000a0293          	mv	t0,s4
    3f50:	00070493          	mv	s1,a4
    3f54:	01a484b3          	add	s1,s1,s10
    3f58:	00178793          	add	a5,a5,1
    3f5c:	00542023          	sw	t0,0(s0)
    3f60:	e48fe06f          	j	25a8 <_vfprintf_r+0x2f0>
    3f64:	01412783          	lw	a5,20(sp)
    3f68:	00c12703          	lw	a4,12(sp)
    3f6c:	0007a783          	lw	a5,0(a5)
    3f70:	00e7a023          	sw	a4,0(a5)
    3f74:	fadfe06f          	j	2f20 <_vfprintf_r+0xc68>
    3f78:	02012e83          	lw	t4,32(sp)
    3f7c:	00040293          	mv	t0,s0
    3f80:	000a0413          	mv	s0,s4
    3f84:	008484b3          	add	s1,s1,s0
    3f88:	001d0d13          	add	s10,s10,1
    3f8c:	005b2023          	sw	t0,0(s6)
    3f90:	b7dfe06f          	j	2b0c <_vfprintf_r+0x854>
    3f94:	03412703          	lw	a4,52(sp)
    3f98:	03012783          	lw	a5,48(sp)
    3f9c:	00700613          	li	a2,7
    3fa0:	00e42023          	sw	a4,0(s0)
    3fa4:	0a412703          	lw	a4,164(sp)
    3fa8:	009784b3          	add	s1,a5,s1
    3fac:	00f42223          	sw	a5,4(s0)
    3fb0:	00170713          	add	a4,a4,1
    3fb4:	0a912423          	sw	s1,168(sp)
    3fb8:	0ae12223          	sw	a4,164(sp)
    3fbc:	00840413          	add	s0,s0,8
    3fc0:	3ae64463          	blt	a2,a4,4368 <_vfprintf_r+0x20b0>
    3fc4:	3e06cee3          	bltz	a3,4bc0 <_vfprintf_r+0x2908>
    3fc8:	01812783          	lw	a5,24(sp)
    3fcc:	00170713          	add	a4,a4,1
    3fd0:	01842023          	sw	s8,0(s0)
    3fd4:	009784b3          	add	s1,a5,s1
    3fd8:	00f42223          	sw	a5,4(s0)
    3fdc:	0a912423          	sw	s1,168(sp)
    3fe0:	0ae12223          	sw	a4,164(sp)
    3fe4:	00700793          	li	a5,7
    3fe8:	00e7c463          	blt	a5,a4,3ff0 <_vfprintf_r+0x1d38>
    3fec:	dd0fe06f          	j	25bc <_vfprintf_r+0x304>
    3ff0:	b61fe06f          	j	2b50 <_vfprintf_r+0x898>
    3ff4:	01000613          	li	a2,16
    3ff8:	0a412683          	lw	a3,164(sp)
    3ffc:	0000c297          	auipc	t0,0xc
    4000:	9f828293          	add	t0,t0,-1544 # f9f4 <zeroes.0>
    4004:	09665463          	bge	a2,s6,408c <_vfprintf_r+0x1dd4>
    4008:	00040793          	mv	a5,s0
    400c:	00048713          	mv	a4,s1
    4010:	00812403          	lw	s0,8(sp)
    4014:	01000893          	li	a7,16
    4018:	00700d13          	li	s10,7
    401c:	05d12223          	sw	t4,68(sp)
    4020:	00028493          	mv	s1,t0
    4024:	00c0006f          	j	4030 <_vfprintf_r+0x1d78>
    4028:	ff0b0b13          	add	s6,s6,-16
    402c:	0568d863          	bge	a7,s6,407c <_vfprintf_r+0x1dc4>
    4030:	01070713          	add	a4,a4,16
    4034:	00168693          	add	a3,a3,1
    4038:	0097a023          	sw	s1,0(a5)
    403c:	0117a223          	sw	a7,4(a5)
    4040:	0ae12423          	sw	a4,168(sp)
    4044:	0ad12223          	sw	a3,164(sp)
    4048:	00878793          	add	a5,a5,8
    404c:	fcdd5ee3          	bge	s10,a3,4028 <_vfprintf_r+0x1d70>
    4050:	0a010613          	add	a2,sp,160
    4054:	00040593          	mv	a1,s0
    4058:	00098513          	mv	a0,s3
    405c:	118010ef          	jal	5174 <__sprint_r>
    4060:	00050463          	beqz	a0,4068 <_vfprintf_r+0x1db0>
    4064:	f24fe06f          	j	2788 <_vfprintf_r+0x4d0>
    4068:	0a812703          	lw	a4,168(sp)
    406c:	0a412683          	lw	a3,164(sp)
    4070:	0ac10793          	add	a5,sp,172
    4074:	01000893          	li	a7,16
    4078:	fb1ff06f          	j	4028 <_vfprintf_r+0x1d70>
    407c:	04412e83          	lw	t4,68(sp)
    4080:	00048293          	mv	t0,s1
    4084:	00078413          	mv	s0,a5
    4088:	00070493          	mv	s1,a4
    408c:	016484b3          	add	s1,s1,s6
    4090:	00168693          	add	a3,a3,1
    4094:	00542023          	sw	t0,0(s0)
    4098:	01642223          	sw	s6,4(s0)
    409c:	0a912423          	sw	s1,168(sp)
    40a0:	0ad12223          	sw	a3,164(sp)
    40a4:	00700713          	li	a4,7
    40a8:	00840413          	add	s0,s0,8
    40ac:	bed75c63          	bge	a4,a3,34a4 <_vfprintf_r+0x11ec>
    40b0:	00812583          	lw	a1,8(sp)
    40b4:	0a010613          	add	a2,sp,160
    40b8:	00098513          	mv	a0,s3
    40bc:	05d12223          	sw	t4,68(sp)
    40c0:	0b4010ef          	jal	5174 <__sprint_r>
    40c4:	00050463          	beqz	a0,40cc <_vfprintf_r+0x1e14>
    40c8:	ec0fe06f          	j	2788 <_vfprintf_r+0x4d0>
    40cc:	0a812483          	lw	s1,168(sp)
    40d0:	04412e83          	lw	t4,68(sp)
    40d4:	0ac10413          	add	s0,sp,172
    40d8:	bccff06f          	j	34a4 <_vfprintf_r+0x11ec>
    40dc:	02812703          	lw	a4,40(sp)
    40e0:	09810893          	add	a7,sp,152
    40e4:	08410813          	add	a6,sp,132
    40e8:	00070513          	mv	a0,a4
    40ec:	00050593          	mv	a1,a0
    40f0:	00030713          	mv	a4,t1
    40f4:	07c10793          	add	a5,sp,124
    40f8:	00200693          	li	a3,2
    40fc:	00048613          	mv	a2,s1
    4100:	00098513          	mv	a0,s3
    4104:	03c12223          	sw	t3,36(sp)
    4108:	03d12023          	sw	t4,32(sp)
    410c:	00612c23          	sw	t1,24(sp)
    4110:	3a8040ef          	jal	84b8 <_dtoa_r>
    4114:	02012e83          	lw	t4,32(sp)
    4118:	01812303          	lw	t1,24(sp)
    411c:	02412e03          	lw	t3,36(sp)
    4120:	001ef713          	and	a4,t4,1
    4124:	00050c13          	mv	s8,a0
    4128:	1a0712e3          	bnez	a4,4acc <_vfprintf_r+0x2814>
    412c:	09812783          	lw	a5,152(sp)
    4130:	07c12a03          	lw	s4,124(sp)
    4134:	40a787b3          	sub	a5,a5,a0
    4138:	00f12c23          	sw	a5,24(sp)
    413c:	ffd00713          	li	a4,-3
    4140:	00ea4463          	blt	s4,a4,4148 <_vfprintf_r+0x1e90>
    4144:	5b435663          	bge	t1,s4,46f0 <_vfprintf_r+0x2438>
    4148:	ffee0e13          	add	t3,t3,-2
    414c:	fffa0d13          	add	s10,s4,-1
    4150:	07a12e23          	sw	s10,124(sp)
    4154:	0ffe7693          	zext.b	a3,t3
    4158:	00000613          	li	a2,0
    415c:	08d10423          	sb	a3,136(sp)
    4160:	02b00693          	li	a3,43
    4164:	000d5863          	bgez	s10,4174 <_vfprintf_r+0x1ebc>
    4168:	00100713          	li	a4,1
    416c:	41470d33          	sub	s10,a4,s4
    4170:	02d00693          	li	a3,45
    4174:	08d104a3          	sb	a3,137(sp)
    4178:	00900693          	li	a3,9
    417c:	33a6d8e3          	bge	a3,s10,4cac <_vfprintf_r+0x29f4>
    4180:	000c0793          	mv	a5,s8
    4184:	09f10493          	add	s1,sp,159
    4188:	03212023          	sw	s2,32(sp)
    418c:	00040c13          	mv	s8,s0
    4190:	06300a13          	li	s4,99
    4194:	000d0413          	mv	s0,s10
    4198:	03d12223          	sw	t4,36(sp)
    419c:	05c12023          	sw	t3,64(sp)
    41a0:	00048913          	mv	s2,s1
    41a4:	00098c93          	mv	s9,s3
    41a8:	00078d13          	mv	s10,a5
    41ac:	00a00593          	li	a1,10
    41b0:	00040513          	mv	a0,s0
    41b4:	09c0b0ef          	jal	f250 <__modsi3>
    41b8:	03050713          	add	a4,a0,48
    41bc:	00090b13          	mv	s6,s2
    41c0:	00040513          	mv	a0,s0
    41c4:	feeb0fa3          	sb	a4,-1(s6)
    41c8:	00a00593          	li	a1,10
    41cc:	00040993          	mv	s3,s0
    41d0:	7fd0a0ef          	jal	f1cc <__divsi3>
    41d4:	fff90913          	add	s2,s2,-1
    41d8:	00050413          	mv	s0,a0
    41dc:	fd3a48e3          	blt	s4,s3,41ac <_vfprintf_r+0x1ef4>
    41e0:	000c8993          	mv	s3,s9
    41e4:	03050713          	add	a4,a0,48
    41e8:	00090c93          	mv	s9,s2
    41ec:	ffeb0693          	add	a3,s6,-2
    41f0:	feec8fa3          	sb	a4,-1(s9)
    41f4:	000c0413          	mv	s0,s8
    41f8:	02412e83          	lw	t4,36(sp)
    41fc:	04012e03          	lw	t3,64(sp)
    4200:	02012903          	lw	s2,32(sp)
    4204:	000d0c13          	mv	s8,s10
    4208:	4c96f6e3          	bgeu	a3,s1,4ed4 <_vfprintf_r+0x2c1c>
    420c:	08a10713          	add	a4,sp,138
    4210:	0006c783          	lbu	a5,0(a3)
    4214:	00168693          	add	a3,a3,1
    4218:	00170713          	add	a4,a4,1
    421c:	fef70fa3          	sb	a5,-1(a4)
    4220:	fe9698e3          	bne	a3,s1,4210 <_vfprintf_r+0x1f58>
    4224:	15010793          	add	a5,sp,336
    4228:	41678633          	sub	a2,a5,s6
    422c:	f5360793          	add	a5,a2,-173
    4230:	04f12023          	sw	a5,64(sp)
    4234:	01812783          	lw	a5,24(sp)
    4238:	04012683          	lw	a3,64(sp)
    423c:	00100713          	li	a4,1
    4240:	00d78d33          	add	s10,a5,a3
    4244:	28f75ce3          	bge	a4,a5,4cdc <_vfprintf_r+0x2a24>
    4248:	03012783          	lw	a5,48(sp)
    424c:	00fd0d33          	add	s10,s10,a5
    4250:	fffd4813          	not	a6,s10
    4254:	bffeff13          	and	t5,t4,-1025
    4258:	41f85813          	sra	a6,a6,0x1f
    425c:	100f6e93          	or	t4,t5,256
    4260:	010d7cb3          	and	s9,s10,a6
    4264:	02012223          	sw	zero,36(sp)
    4268:	02012023          	sw	zero,32(sp)
    426c:	00000a13          	li	s4,0
    4270:	04412783          	lw	a5,68(sp)
    4274:	46079263          	bnez	a5,46d8 <_vfprintf_r+0x2420>
    4278:	07714603          	lbu	a2,119(sp)
    427c:	00000313          	li	t1,0
    4280:	00061463          	bnez	a2,4288 <_vfprintf_r+0x1fd0>
    4284:	a74fe06f          	j	24f8 <_vfprintf_r+0x240>
    4288:	e90fe06f          	j	2918 <_vfprintf_r+0x660>
    428c:	00812583          	lw	a1,8(sp)
    4290:	0a010613          	add	a2,sp,160
    4294:	00098513          	mv	a0,s3
    4298:	03d12023          	sw	t4,32(sp)
    429c:	6d9000ef          	jal	5174 <__sprint_r>
    42a0:	00050463          	beqz	a0,42a8 <_vfprintf_r+0x1ff0>
    42a4:	ce4fe06f          	j	2788 <_vfprintf_r+0x4d0>
    42a8:	07c12683          	lw	a3,124(sp)
    42ac:	0a812483          	lw	s1,168(sp)
    42b0:	02012e83          	lw	t4,32(sp)
    42b4:	0ac10413          	add	s0,sp,172
    42b8:	ce0ff06f          	j	3798 <_vfprintf_r+0x14e0>
    42bc:	00600c93          	li	s9,6
    42c0:	f14ff06f          	j	39d4 <_vfprintf_r+0x171c>
    42c4:	0ffd7d13          	zext.b	s10,s10
    42c8:	00000c93          	li	s9,0
    42cc:	bd5fe06f          	j	2ea0 <_vfprintf_r+0xbe8>
    42d0:	0ffd7d13          	zext.b	s10,s10
    42d4:	00000c93          	li	s9,0
    42d8:	e48ff06f          	j	3920 <_vfprintf_r+0x1668>
    42dc:	018d1d13          	sll	s10,s10,0x18
    42e0:	418d5d13          	sra	s10,s10,0x18
    42e4:	41fd5c93          	sra	s9,s10,0x1f
    42e8:	000c8793          	mv	a5,s9
    42ec:	b39fe06f          	j	2e24 <_vfprintf_r+0xb6c>
    42f0:	01412783          	lw	a5,20(sp)
    42f4:	00c12703          	lw	a4,12(sp)
    42f8:	0007a783          	lw	a5,0(a5)
    42fc:	00e79023          	sh	a4,0(a5)
    4300:	c21fe06f          	j	2f20 <_vfprintf_r+0xc68>
    4304:	000c0513          	mv	a0,s8
    4308:	05d12223          	sw	t4,68(sp)
    430c:	ad8fd0ef          	jal	15e4 <strlen>
    4310:	07714603          	lbu	a2,119(sp)
    4314:	fff54813          	not	a6,a0
    4318:	41f85813          	sra	a6,a6,0x1f
    431c:	01612a23          	sw	s6,20(sp)
    4320:	02012223          	sw	zero,36(sp)
    4324:	02012023          	sw	zero,32(sp)
    4328:	00012823          	sw	zero,16(sp)
    432c:	04412e83          	lw	t4,68(sp)
    4330:	00050d13          	mv	s10,a0
    4334:	01057cb3          	and	s9,a0,a6
    4338:	00000313          	li	t1,0
    433c:	07300e13          	li	t3,115
    4340:	00061463          	bnez	a2,4348 <_vfprintf_r+0x2090>
    4344:	9b4fe06f          	j	24f8 <_vfprintf_r+0x240>
    4348:	dd0fe06f          	j	2918 <_vfprintf_r+0x660>
    434c:	00812583          	lw	a1,8(sp)
    4350:	0a010613          	add	a2,sp,160
    4354:	00098513          	mv	a0,s3
    4358:	61d000ef          	jal	5174 <__sprint_r>
    435c:	00051463          	bnez	a0,4364 <_vfprintf_r+0x20ac>
    4360:	be8fe06f          	j	2748 <_vfprintf_r+0x490>
    4364:	c38fe06f          	j	279c <_vfprintf_r+0x4e4>
    4368:	00812583          	lw	a1,8(sp)
    436c:	0a010613          	add	a2,sp,160
    4370:	00098513          	mv	a0,s3
    4374:	03d12023          	sw	t4,32(sp)
    4378:	5fd000ef          	jal	5174 <__sprint_r>
    437c:	00050463          	beqz	a0,4384 <_vfprintf_r+0x20cc>
    4380:	c08fe06f          	j	2788 <_vfprintf_r+0x4d0>
    4384:	07c12683          	lw	a3,124(sp)
    4388:	0a812483          	lw	s1,168(sp)
    438c:	0a412703          	lw	a4,164(sp)
    4390:	02012e83          	lw	t4,32(sp)
    4394:	0ac10413          	add	s0,sp,172
    4398:	c2dff06f          	j	3fc4 <_vfprintf_r+0x1d0c>
    439c:	05862503          	lw	a0,88(a2)
    43a0:	00f12623          	sw	a5,12(sp)
    43a4:	fbdfc0ef          	jal	1360 <__retarget_lock_release_recursive>
    43a8:	00c12783          	lw	a5,12(sp)
    43ac:	ab8fe06f          	j	2664 <_vfprintf_r+0x3ac>
    43b0:	00130a13          	add	s4,t1,1
    43b4:	00200693          	li	a3,2
    43b8:	02812703          	lw	a4,40(sp)
    43bc:	09810893          	add	a7,sp,152
    43c0:	08410813          	add	a6,sp,132
    43c4:	00070513          	mv	a0,a4
    43c8:	00050593          	mv	a1,a0
    43cc:	000a0713          	mv	a4,s4
    43d0:	07c10793          	add	a5,sp,124
    43d4:	00048613          	mv	a2,s1
    43d8:	00098513          	mv	a0,s3
    43dc:	02612223          	sw	t1,36(sp)
    43e0:	03c12023          	sw	t3,32(sp)
    43e4:	01d12c23          	sw	t4,24(sp)
    43e8:	0d0040ef          	jal	84b8 <_dtoa_r>
    43ec:	02012e03          	lw	t3,32(sp)
    43f0:	04600693          	li	a3,70
    43f4:	01812e83          	lw	t4,24(sp)
    43f8:	fdfe7d13          	and	s10,t3,-33
    43fc:	02412303          	lw	t1,36(sp)
    4400:	00050c13          	mv	s8,a0
    4404:	01450733          	add	a4,a0,s4
    4408:	34dd14e3          	bne	s10,a3,4f50 <_vfprintf_r+0x2c98>
    440c:	000c4603          	lbu	a2,0(s8)
    4410:	03000693          	li	a3,48
    4414:	6cd60263          	beq	a2,a3,4ad8 <_vfprintf_r+0x2820>
    4418:	07c12683          	lw	a3,124(sp)
    441c:	00d70733          	add	a4,a4,a3
    4420:	02812683          	lw	a3,40(sp)
    4424:	00048593          	mv	a1,s1
    4428:	00000613          	li	a2,0
    442c:	00068513          	mv	a0,a3
    4430:	00000693          	li	a3,0
    4434:	04e12823          	sw	a4,80(sp)
    4438:	02612223          	sw	t1,36(sp)
    443c:	03c12023          	sw	t3,32(sp)
    4440:	01d12c23          	sw	t4,24(sp)
    4444:	370090ef          	jal	d7b4 <__eqdf2>
    4448:	01812e83          	lw	t4,24(sp)
    444c:	02012e03          	lw	t3,32(sp)
    4450:	02412303          	lw	t1,36(sp)
    4454:	05012703          	lw	a4,80(sp)
    4458:	62050863          	beqz	a0,4a88 <_vfprintf_r+0x27d0>
    445c:	09812783          	lw	a5,152(sp)
    4460:	00e7fe63          	bgeu	a5,a4,447c <_vfprintf_r+0x21c4>
    4464:	03000613          	li	a2,48
    4468:	00178693          	add	a3,a5,1
    446c:	08d12c23          	sw	a3,152(sp)
    4470:	00c78023          	sb	a2,0(a5)
    4474:	09812783          	lw	a5,152(sp)
    4478:	fee7e8e3          	bltu	a5,a4,4468 <_vfprintf_r+0x21b0>
    447c:	07c12a03          	lw	s4,124(sp)
    4480:	418787b3          	sub	a5,a5,s8
    4484:	04700713          	li	a4,71
    4488:	00f12c23          	sw	a5,24(sp)
    448c:	caed08e3          	beq	s10,a4,413c <_vfprintf_r+0x1e84>
    4490:	04600713          	li	a4,70
    4494:	68ed0863          	beq	s10,a4,4b24 <_vfprintf_r+0x286c>
    4498:	fffa0d13          	add	s10,s4,-1
    449c:	cb5ff06f          	j	4150 <_vfprintf_r+0x1e98>
    44a0:	02812703          	lw	a4,40(sp)
    44a4:	07c10613          	add	a2,sp,124
    44a8:	00048593          	mv	a1,s1
    44ac:	00070513          	mv	a0,a4
    44b0:	02612223          	sw	t1,36(sp)
    44b4:	03c12023          	sw	t3,32(sp)
    44b8:	01d12c23          	sw	t4,24(sp)
    44bc:	4e9030ef          	jal	81a4 <frexp>
    44c0:	7fffc717          	auipc	a4,0x7fffc
    44c4:	1e870713          	add	a4,a4,488 # 800006a8 <__global_locale+0x174>
    44c8:	00072603          	lw	a2,0(a4)
    44cc:	00472683          	lw	a3,4(a4)
    44d0:	578090ef          	jal	da48 <__muldf3>
    44d4:	00000613          	li	a2,0
    44d8:	00000693          	li	a3,0
    44dc:	00050a13          	mv	s4,a0
    44e0:	00058d13          	mv	s10,a1
    44e4:	2d0090ef          	jal	d7b4 <__eqdf2>
    44e8:	01812e83          	lw	t4,24(sp)
    44ec:	02012e03          	lw	t3,32(sp)
    44f0:	02412303          	lw	t1,36(sp)
    44f4:	00051663          	bnez	a0,4500 <_vfprintf_r+0x2248>
    44f8:	00100713          	li	a4,1
    44fc:	06e12e23          	sw	a4,124(sp)
    4500:	0000b797          	auipc	a5,0xb
    4504:	02078793          	add	a5,a5,32 # f520 <__fini_array_end+0x218>
    4508:	06100713          	li	a4,97
    450c:	02f12023          	sw	a5,32(sp)
    4510:	00ee1863          	bne	t3,a4,4520 <_vfprintf_r+0x2268>
    4514:	0000b797          	auipc	a5,0xb
    4518:	ff878793          	add	a5,a5,-8 # f50c <__fini_array_end+0x204>
    451c:	02f12023          	sw	a5,32(sp)
    4520:	7fffc717          	auipc	a4,0x7fffc
    4524:	19070713          	add	a4,a4,400 # 800006b0 <__global_locale+0x17c>
    4528:	00072783          	lw	a5,0(a4)
    452c:	00472803          	lw	a6,4(a4)
    4530:	000c0493          	mv	s1,s8
    4534:	00f12c23          	sw	a5,24(sp)
    4538:	000d0793          	mv	a5,s10
    453c:	03212223          	sw	s2,36(sp)
    4540:	000c0d13          	mv	s10,s8
    4544:	02012903          	lw	s2,32(sp)
    4548:	00098c13          	mv	s8,s3
    454c:	01012e23          	sw	a6,28(sp)
    4550:	fff30b13          	add	s6,t1,-1
    4554:	fff00c93          	li	s9,-1
    4558:	05d12023          	sw	t4,64(sp)
    455c:	05c12823          	sw	t3,80(sp)
    4560:	04812a23          	sw	s0,84(sp)
    4564:	00078993          	mv	s3,a5
    4568:	01c0006f          	j	4584 <_vfprintf_r+0x22cc>
    456c:	00000613          	li	a2,0
    4570:	00000693          	li	a3,0
    4574:	fffb0413          	add	s0,s6,-1
    4578:	23c090ef          	jal	d7b4 <__eqdf2>
    457c:	0a0504e3          	beqz	a0,4e24 <_vfprintf_r+0x2b6c>
    4580:	00040b13          	mv	s6,s0
    4584:	01812603          	lw	a2,24(sp)
    4588:	01c12683          	lw	a3,28(sp)
    458c:	000a0513          	mv	a0,s4
    4590:	00098593          	mv	a1,s3
    4594:	4b4090ef          	jal	da48 <__muldf3>
    4598:	00058a13          	mv	s4,a1
    459c:	00050993          	mv	s3,a0
    45a0:	5940a0ef          	jal	eb34 <__fixdfsi>
    45a4:	00050413          	mv	s0,a0
    45a8:	6100a0ef          	jal	ebb8 <__floatsidf>
    45ac:	00050613          	mv	a2,a0
    45b0:	00058693          	mv	a3,a1
    45b4:	00098513          	mv	a0,s3
    45b8:	000a0593          	mv	a1,s4
    45bc:	41d090ef          	jal	e1d8 <__subdf3>
    45c0:	00890733          	add	a4,s2,s0
    45c4:	00074703          	lbu	a4,0(a4)
    45c8:	00048813          	mv	a6,s1
    45cc:	00050a13          	mv	s4,a0
    45d0:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    45d4:	00058993          	mv	s3,a1
    45d8:	00148493          	add	s1,s1,1
    45dc:	f99b18e3          	bne	s6,s9,456c <_vfprintf_r+0x22b4>
    45e0:	7fffc697          	auipc	a3,0x7fffc
    45e4:	0d868693          	add	a3,a3,216 # 800006b8 <__global_locale+0x184>
    45e8:	0006a303          	lw	t1,0(a3)
    45ec:	0046a383          	lw	t2,4(a3)
    45f0:	05012e03          	lw	t3,80(sp)
    45f4:	00030613          	mv	a2,t1
    45f8:	00038693          	mv	a3,t2
    45fc:	01012c23          	sw	a6,24(sp)
    4600:	02412903          	lw	s2,36(sp)
    4604:	000c0993          	mv	s3,s8
    4608:	03c12223          	sw	t3,36(sp)
    460c:	000d0c13          	mv	s8,s10
    4610:	00058d13          	mv	s10,a1
    4614:	22c090ef          	jal	d840 <__gedf2>
    4618:	7fffc797          	auipc	a5,0x7fffc
    461c:	0a078793          	add	a5,a5,160 # 800006b8 <__global_locale+0x184>
    4620:	00040b13          	mv	s6,s0
    4624:	0007a303          	lw	t1,0(a5)
    4628:	05412403          	lw	s0,84(sp)
    462c:	0047a383          	lw	t2,4(a5)
    4630:	01812803          	lw	a6,24(sp)
    4634:	02412e03          	lw	t3,36(sp)
    4638:	04012e83          	lw	t4,64(sp)
    463c:	0aa05ce3          	blez	a0,4ef4 <_vfprintf_r+0x2c3c>
    4640:	02012783          	lw	a5,32(sp)
    4644:	09012c23          	sw	a6,152(sp)
    4648:	fff4c603          	lbu	a2,-1(s1)
    464c:	00f7c583          	lbu	a1,15(a5)
    4650:	00048693          	mv	a3,s1
    4654:	02b61063          	bne	a2,a1,4674 <_vfprintf_r+0x23bc>
    4658:	03000513          	li	a0,48
    465c:	fea68fa3          	sb	a0,-1(a3)
    4660:	09812683          	lw	a3,152(sp)
    4664:	fff68793          	add	a5,a3,-1
    4668:	08f12c23          	sw	a5,152(sp)
    466c:	fff6c603          	lbu	a2,-1(a3)
    4670:	feb606e3          	beq	a2,a1,465c <_vfprintf_r+0x23a4>
    4674:	00160593          	add	a1,a2,1
    4678:	03900513          	li	a0,57
    467c:	0ff5f593          	zext.b	a1,a1
    4680:	04a60463          	beq	a2,a0,46c8 <_vfprintf_r+0x2410>
    4684:	feb68fa3          	sb	a1,-1(a3)
    4688:	00048793          	mv	a5,s1
    468c:	07c12a03          	lw	s4,124(sp)
    4690:	418787b3          	sub	a5,a5,s8
    4694:	06100613          	li	a2,97
    4698:	fffa0d13          	add	s10,s4,-1
    469c:	00f12c23          	sw	a5,24(sp)
    46a0:	07a12e23          	sw	s10,124(sp)
    46a4:	07000693          	li	a3,112
    46a8:	00ce0663          	beq	t3,a2,46b4 <_vfprintf_r+0x23fc>
    46ac:	05000693          	li	a3,80
    46b0:	04100e13          	li	t3,65
    46b4:	00100613          	li	a2,1
    46b8:	aa5ff06f          	j	415c <_vfprintf_r+0x1ea4>
    46bc:	00030a13          	mv	s4,t1
    46c0:	00300693          	li	a3,3
    46c4:	cf5ff06f          	j	43b8 <_vfprintf_r+0x2100>
    46c8:	02012783          	lw	a5,32(sp)
    46cc:	00a7c583          	lbu	a1,10(a5)
    46d0:	feb68fa3          	sb	a1,-1(a3)
    46d4:	fb5ff06f          	j	4688 <_vfprintf_r+0x23d0>
    46d8:	02d00713          	li	a4,45
    46dc:	06e10ba3          	sb	a4,119(sp)
    46e0:	02d00613          	li	a2,45
    46e4:	00000313          	li	t1,0
    46e8:	001c8c93          	add	s9,s9,1
    46ec:	e0dfd06f          	j	24f8 <_vfprintf_r+0x240>
    46f0:	01812783          	lw	a5,24(sp)
    46f4:	46fa4063          	blt	s4,a5,4b54 <_vfprintf_r+0x289c>
    46f8:	001ef713          	and	a4,t4,1
    46fc:	000a0d13          	mv	s10,s4
    4700:	00070663          	beqz	a4,470c <_vfprintf_r+0x2454>
    4704:	03012783          	lw	a5,48(sp)
    4708:	00fa0d33          	add	s10,s4,a5
    470c:	400eff13          	and	t5,t4,1024
    4710:	000f0463          	beqz	t5,4718 <_vfprintf_r+0x2460>
    4714:	5f404e63          	bgtz	s4,4d10 <_vfprintf_r+0x2a58>
    4718:	fffd4813          	not	a6,s10
    471c:	41f85813          	sra	a6,a6,0x1f
    4720:	010d7cb3          	and	s9,s10,a6
    4724:	06700e13          	li	t3,103
    4728:	000b0e93          	mv	t4,s6
    472c:	02012223          	sw	zero,36(sp)
    4730:	02012023          	sw	zero,32(sp)
    4734:	b3dff06f          	j	4270 <_vfprintf_r+0x1fb8>
    4738:	02d00793          	li	a5,45
    473c:	06f10ba3          	sb	a5,119(sp)
    4740:	02d00613          	li	a2,45
    4744:	998fe06f          	j	28dc <_vfprintf_r+0x624>
    4748:	01812783          	lw	a5,24(sp)
    474c:	02012a03          	lw	s4,32(sp)
    4750:	05212823          	sw	s2,80(sp)
    4754:	00fc07b3          	add	a5,s8,a5
    4758:	05712c23          	sw	s7,88(sp)
    475c:	05912e23          	sw	s9,92(sp)
    4760:	00040713          	mv	a4,s0
    4764:	04f12223          	sw	a5,68(sp)
    4768:	02412403          	lw	s0,36(sp)
    476c:	05d12a23          	sw	t4,84(sp)
    4770:	03812223          	sw	s8,36(sp)
    4774:	03c12b83          	lw	s7,60(sp)
    4778:	04c12c83          	lw	s9,76(sp)
    477c:	00812903          	lw	s2,8(sp)
    4780:	00700693          	li	a3,7
    4784:	01000d13          	li	s10,16
    4788:	0000bb17          	auipc	s6,0xb
    478c:	26cb0b13          	add	s6,s6,620 # f9f4 <zeroes.0>
    4790:	00048613          	mv	a2,s1
    4794:	00030c13          	mv	s8,t1
    4798:	09405863          	blez	s4,4828 <_vfprintf_r+0x2570>
    479c:	16805e63          	blez	s0,4918 <_vfprintf_r+0x2660>
    47a0:	fff40413          	add	s0,s0,-1
    47a4:	04812783          	lw	a5,72(sp)
    47a8:	01960633          	add	a2,a2,s9
    47ac:	01972223          	sw	s9,4(a4)
    47b0:	00f72023          	sw	a5,0(a4)
    47b4:	0a412783          	lw	a5,164(sp)
    47b8:	0ac12423          	sw	a2,168(sp)
    47bc:	00870713          	add	a4,a4,8
    47c0:	00178793          	add	a5,a5,1
    47c4:	0af12223          	sw	a5,164(sp)
    47c8:	14f6ce63          	blt	a3,a5,4924 <_vfprintf_r+0x266c>
    47cc:	04412783          	lw	a5,68(sp)
    47d0:	000bc583          	lbu	a1,0(s7)
    47d4:	418784b3          	sub	s1,a5,s8
    47d8:	0095d463          	bge	a1,s1,47e0 <_vfprintf_r+0x2528>
    47dc:	00058493          	mv	s1,a1
    47e0:	02905663          	blez	s1,480c <_vfprintf_r+0x2554>
    47e4:	0a412583          	lw	a1,164(sp)
    47e8:	00960633          	add	a2,a2,s1
    47ec:	01872023          	sw	s8,0(a4)
    47f0:	00158593          	add	a1,a1,1
    47f4:	00972223          	sw	s1,4(a4)
    47f8:	0ac12423          	sw	a2,168(sp)
    47fc:	0ab12223          	sw	a1,164(sp)
    4800:	14b6c663          	blt	a3,a1,494c <_vfprintf_r+0x2694>
    4804:	000bc583          	lbu	a1,0(s7)
    4808:	00870713          	add	a4,a4,8
    480c:	fff4c513          	not	a0,s1
    4810:	41f55513          	sra	a0,a0,0x1f
    4814:	00a4f7b3          	and	a5,s1,a0
    4818:	40f584b3          	sub	s1,a1,a5
    481c:	04904663          	bgtz	s1,4868 <_vfprintf_r+0x25b0>
    4820:	00bc0c33          	add	s8,s8,a1
    4824:	f7404ce3          	bgtz	s4,479c <_vfprintf_r+0x24e4>
    4828:	f6804ce3          	bgtz	s0,47a0 <_vfprintf_r+0x24e8>
    482c:	01812783          	lw	a5,24(sp)
    4830:	000c0313          	mv	t1,s8
    4834:	02412c03          	lw	s8,36(sp)
    4838:	03712e23          	sw	s7,60(sp)
    483c:	00070413          	mv	s0,a4
    4840:	00fc0733          	add	a4,s8,a5
    4844:	05012903          	lw	s2,80(sp)
    4848:	05412e83          	lw	t4,84(sp)
    484c:	05812b83          	lw	s7,88(sp)
    4850:	05c12c83          	lw	s9,92(sp)
    4854:	00060493          	mv	s1,a2
    4858:	00676463          	bltu	a4,t1,4860 <_vfprintf_r+0x25a8>
    485c:	c59fe06f          	j	34b4 <_vfprintf_r+0x11fc>
    4860:	00070313          	mv	t1,a4
    4864:	c51fe06f          	j	34b4 <_vfprintf_r+0x11fc>
    4868:	0a412583          	lw	a1,164(sp)
    486c:	0000be97          	auipc	t4,0xb
    4870:	188e8e93          	add	t4,t4,392 # f9f4 <zeroes.0>
    4874:	069d5c63          	bge	s10,s1,48ec <_vfprintf_r+0x2634>
    4878:	02812023          	sw	s0,32(sp)
    487c:	00048413          	mv	s0,s1
    4880:	000b0493          	mv	s1,s6
    4884:	00c0006f          	j	4890 <_vfprintf_r+0x25d8>
    4888:	ff040413          	add	s0,s0,-16
    488c:	048d5a63          	bge	s10,s0,48e0 <_vfprintf_r+0x2628>
    4890:	01060613          	add	a2,a2,16
    4894:	00158593          	add	a1,a1,1
    4898:	01672023          	sw	s6,0(a4)
    489c:	01a72223          	sw	s10,4(a4)
    48a0:	0ac12423          	sw	a2,168(sp)
    48a4:	0ab12223          	sw	a1,164(sp)
    48a8:	00870713          	add	a4,a4,8
    48ac:	fcb6dee3          	bge	a3,a1,4888 <_vfprintf_r+0x25d0>
    48b0:	0a010613          	add	a2,sp,160
    48b4:	00090593          	mv	a1,s2
    48b8:	00098513          	mv	a0,s3
    48bc:	0b9000ef          	jal	5174 <__sprint_r>
    48c0:	00050463          	beqz	a0,48c8 <_vfprintf_r+0x2610>
    48c4:	ec5fd06f          	j	2788 <_vfprintf_r+0x4d0>
    48c8:	ff040413          	add	s0,s0,-16
    48cc:	0a812603          	lw	a2,168(sp)
    48d0:	0a412583          	lw	a1,164(sp)
    48d4:	0ac10713          	add	a4,sp,172
    48d8:	00700693          	li	a3,7
    48dc:	fa8d4ae3          	blt	s10,s0,4890 <_vfprintf_r+0x25d8>
    48e0:	00048e93          	mv	t4,s1
    48e4:	00040493          	mv	s1,s0
    48e8:	02012403          	lw	s0,32(sp)
    48ec:	00960633          	add	a2,a2,s1
    48f0:	00158593          	add	a1,a1,1
    48f4:	01d72023          	sw	t4,0(a4)
    48f8:	00972223          	sw	s1,4(a4)
    48fc:	0ac12423          	sw	a2,168(sp)
    4900:	0ab12223          	sw	a1,164(sp)
    4904:	10b6ce63          	blt	a3,a1,4a20 <_vfprintf_r+0x2768>
    4908:	000bc583          	lbu	a1,0(s7)
    490c:	00870713          	add	a4,a4,8
    4910:	00bc0c33          	add	s8,s8,a1
    4914:	f11ff06f          	j	4824 <_vfprintf_r+0x256c>
    4918:	fffb8b93          	add	s7,s7,-1
    491c:	fffa0a13          	add	s4,s4,-1
    4920:	e85ff06f          	j	47a4 <_vfprintf_r+0x24ec>
    4924:	0a010613          	add	a2,sp,160
    4928:	00090593          	mv	a1,s2
    492c:	00098513          	mv	a0,s3
    4930:	045000ef          	jal	5174 <__sprint_r>
    4934:	00050463          	beqz	a0,493c <_vfprintf_r+0x2684>
    4938:	e51fd06f          	j	2788 <_vfprintf_r+0x4d0>
    493c:	0a812603          	lw	a2,168(sp)
    4940:	0ac10713          	add	a4,sp,172
    4944:	00700693          	li	a3,7
    4948:	e85ff06f          	j	47cc <_vfprintf_r+0x2514>
    494c:	0a010613          	add	a2,sp,160
    4950:	00090593          	mv	a1,s2
    4954:	00098513          	mv	a0,s3
    4958:	01d000ef          	jal	5174 <__sprint_r>
    495c:	00050463          	beqz	a0,4964 <_vfprintf_r+0x26ac>
    4960:	e29fd06f          	j	2788 <_vfprintf_r+0x4d0>
    4964:	000bc583          	lbu	a1,0(s7)
    4968:	0a812603          	lw	a2,168(sp)
    496c:	0ac10713          	add	a4,sp,172
    4970:	00700693          	li	a3,7
    4974:	e99ff06f          	j	480c <_vfprintf_r+0x2554>
    4978:	04c12783          	lw	a5,76(sp)
    497c:	04812583          	lw	a1,72(sp)
    4980:	00000913          	li	s2,0
    4984:	40fc0c33          	sub	s8,s8,a5
    4988:	00078613          	mv	a2,a5
    498c:	000c0513          	mv	a0,s8
    4990:	468030ef          	jal	7df8 <strncpy>
    4994:	00144783          	lbu	a5,1(s0)
    4998:	00a00613          	li	a2,10
    499c:	00000693          	li	a3,0
    49a0:	00f037b3          	snez	a5,a5
    49a4:	000d0513          	mv	a0,s10
    49a8:	000c8593          	mv	a1,s9
    49ac:	00f40433          	add	s0,s0,a5
    49b0:	78d060ef          	jal	b93c <__udivdi3>
    49b4:	a10ff06f          	j	3bc4 <_vfprintf_r+0x190c>
    49b8:	09810713          	add	a4,sp,152
    49bc:	00000693          	li	a3,0
    49c0:	08410613          	add	a2,sp,132
    49c4:	00000593          	li	a1,0
    49c8:	00098513          	mv	a0,s3
    49cc:	01c12a23          	sw	t3,20(sp)
    49d0:	01d12823          	sw	t4,16(sp)
    49d4:	618060ef          	jal	afec <_wcsrtombs_r>
    49d8:	fff00713          	li	a4,-1
    49dc:	01012e83          	lw	t4,16(sp)
    49e0:	01412e03          	lw	t3,20(sp)
    49e4:	00050d13          	mv	s10,a0
    49e8:	30e50063          	beq	a0,a4,4ce8 <_vfprintf_r+0x2a30>
    49ec:	09812223          	sw	s8,132(sp)
    49f0:	cacff06f          	j	3e9c <_vfprintf_r+0x1be4>
    49f4:	07714603          	lbu	a2,119(sp)
    49f8:	01612a23          	sw	s6,20(sp)
    49fc:	02012223          	sw	zero,36(sp)
    4a00:	02012023          	sw	zero,32(sp)
    4a04:	00012823          	sw	zero,16(sp)
    4a08:	00000c93          	li	s9,0
    4a0c:	00000313          	li	t1,0
    4a10:	00000a13          	li	s4,0
    4a14:	00061463          	bnez	a2,4a1c <_vfprintf_r+0x2764>
    4a18:	ae1fd06f          	j	24f8 <_vfprintf_r+0x240>
    4a1c:	efdfd06f          	j	2918 <_vfprintf_r+0x660>
    4a20:	0a010613          	add	a2,sp,160
    4a24:	00090593          	mv	a1,s2
    4a28:	00098513          	mv	a0,s3
    4a2c:	748000ef          	jal	5174 <__sprint_r>
    4a30:	00050463          	beqz	a0,4a38 <_vfprintf_r+0x2780>
    4a34:	d55fd06f          	j	2788 <_vfprintf_r+0x4d0>
    4a38:	000bc583          	lbu	a1,0(s7)
    4a3c:	0a812603          	lw	a2,168(sp)
    4a40:	0ac10713          	add	a4,sp,172
    4a44:	00700693          	li	a3,7
    4a48:	00bc0c33          	add	s8,s8,a1
    4a4c:	dd9ff06f          	j	4824 <_vfprintf_r+0x256c>
    4a50:	00812583          	lw	a1,8(sp)
    4a54:	0a010613          	add	a2,sp,160
    4a58:	00098513          	mv	a0,s3
    4a5c:	05d12223          	sw	t4,68(sp)
    4a60:	714000ef          	jal	5174 <__sprint_r>
    4a64:	00050463          	beqz	a0,4a6c <_vfprintf_r+0x27b4>
    4a68:	d21fd06f          	j	2788 <_vfprintf_r+0x4d0>
    4a6c:	0a812483          	lw	s1,168(sp)
    4a70:	04412e83          	lw	t4,68(sp)
    4a74:	0ac10413          	add	s0,sp,172
    4a78:	a19fe06f          	j	3490 <_vfprintf_r+0x11d8>
    4a7c:	00900793          	li	a5,9
    4a80:	95a7e263          	bltu	a5,s10,3bc4 <_vfprintf_r+0x190c>
    4a84:	98cff06f          	j	3c10 <_vfprintf_r+0x1958>
    4a88:	07c12a03          	lw	s4,124(sp)
    4a8c:	00070793          	mv	a5,a4
    4a90:	9f1ff06f          	j	4480 <_vfprintf_r+0x21c8>
    4a94:	00812583          	lw	a1,8(sp)
    4a98:	0a010613          	add	a2,sp,160
    4a9c:	00098513          	mv	a0,s3
    4aa0:	03d12023          	sw	t4,32(sp)
    4aa4:	6d0000ef          	jal	5174 <__sprint_r>
    4aa8:	00050463          	beqz	a0,4ab0 <_vfprintf_r+0x27f8>
    4aac:	cddfd06f          	j	2788 <_vfprintf_r+0x4d0>
    4ab0:	07c12d03          	lw	s10,124(sp)
    4ab4:	01812783          	lw	a5,24(sp)
    4ab8:	0a812483          	lw	s1,168(sp)
    4abc:	02012e83          	lw	t4,32(sp)
    4ac0:	0ac10413          	add	s0,sp,172
    4ac4:	41a78d33          	sub	s10,a5,s10
    4ac8:	a49fe06f          	j	3510 <_vfprintf_r+0x1258>
    4acc:	00650733          	add	a4,a0,t1
    4ad0:	04700d13          	li	s10,71
    4ad4:	94dff06f          	j	4420 <_vfprintf_r+0x2168>
    4ad8:	02812603          	lw	a2,40(sp)
    4adc:	00048593          	mv	a1,s1
    4ae0:	00000693          	li	a3,0
    4ae4:	00060513          	mv	a0,a2
    4ae8:	00000613          	li	a2,0
    4aec:	04e12823          	sw	a4,80(sp)
    4af0:	02612223          	sw	t1,36(sp)
    4af4:	03c12023          	sw	t3,32(sp)
    4af8:	01d12c23          	sw	t4,24(sp)
    4afc:	4b9080ef          	jal	d7b4 <__eqdf2>
    4b00:	01812e83          	lw	t4,24(sp)
    4b04:	02012e03          	lw	t3,32(sp)
    4b08:	02412303          	lw	t1,36(sp)
    4b0c:	05012703          	lw	a4,80(sp)
    4b10:	34051e63          	bnez	a0,4e6c <_vfprintf_r+0x2bb4>
    4b14:	07c12a03          	lw	s4,124(sp)
    4b18:	01470733          	add	a4,a4,s4
    4b1c:	418707b3          	sub	a5,a4,s8
    4b20:	00f12c23          	sw	a5,24(sp)
    4b24:	001ef713          	and	a4,t4,1
    4b28:	00676733          	or	a4,a4,t1
    4b2c:	37405a63          	blez	s4,4ea0 <_vfprintf_r+0x2be8>
    4b30:	26071263          	bnez	a4,4d94 <_vfprintf_r+0x2adc>
    4b34:	000a0d13          	mv	s10,s4
    4b38:	06600e13          	li	t3,102
    4b3c:	400eff13          	and	t5,t4,1024
    4b40:	1c0f1a63          	bnez	t5,4d14 <_vfprintf_r+0x2a5c>
    4b44:	fffd4813          	not	a6,s10
    4b48:	41f85813          	sra	a6,a6,0x1f
    4b4c:	010d7cb3          	and	s9,s10,a6
    4b50:	bd9ff06f          	j	4728 <_vfprintf_r+0x2470>
    4b54:	01812783          	lw	a5,24(sp)
    4b58:	03012703          	lw	a4,48(sp)
    4b5c:	06700e13          	li	t3,103
    4b60:	00e78d33          	add	s10,a5,a4
    4b64:	fd404ce3          	bgtz	s4,4b3c <_vfprintf_r+0x2884>
    4b68:	414d06b3          	sub	a3,s10,s4
    4b6c:	00168d13          	add	s10,a3,1
    4b70:	fffd4813          	not	a6,s10
    4b74:	41f85813          	sra	a6,a6,0x1f
    4b78:	010d7cb3          	and	s9,s10,a6
    4b7c:	badff06f          	j	4728 <_vfprintf_r+0x2470>
    4b80:	000e8613          	mv	a2,t4
    4b84:	ad8fe06f          	j	2e5c <_vfprintf_r+0xba4>
    4b88:	00812783          	lw	a5,8(sp)
    4b8c:	0647a783          	lw	a5,100(a5)
    4b90:	0017f793          	and	a5,a5,1
    4b94:	02079063          	bnez	a5,4bb4 <_vfprintf_r+0x28fc>
    4b98:	00812783          	lw	a5,8(sp)
    4b9c:	00c7d783          	lhu	a5,12(a5)
    4ba0:	2007f793          	and	a5,a5,512
    4ba4:	00079863          	bnez	a5,4bb4 <_vfprintf_r+0x28fc>
    4ba8:	00812783          	lw	a5,8(sp)
    4bac:	0587a503          	lw	a0,88(a5)
    4bb0:	fb0fc0ef          	jal	1360 <__retarget_lock_release_recursive>
    4bb4:	fff00793          	li	a5,-1
    4bb8:	00f12623          	sw	a5,12(sp)
    4bbc:	c2dfd06f          	j	27e8 <_vfprintf_r+0x530>
    4bc0:	ff000613          	li	a2,-16
    4bc4:	40d00d33          	neg	s10,a3
    4bc8:	0000b297          	auipc	t0,0xb
    4bcc:	e2c28293          	add	t0,t0,-468 # f9f4 <zeroes.0>
    4bd0:	08c6d463          	bge	a3,a2,4c58 <_vfprintf_r+0x29a0>
    4bd4:	03212023          	sw	s2,32(sp)
    4bd8:	01000693          	li	a3,16
    4bdc:	00700b13          	li	s6,7
    4be0:	000e8a13          	mv	s4,t4
    4be4:	00028913          	mv	s2,t0
    4be8:	00c0006f          	j	4bf4 <_vfprintf_r+0x293c>
    4bec:	ff0d0d13          	add	s10,s10,-16
    4bf0:	05a6de63          	bge	a3,s10,4c4c <_vfprintf_r+0x2994>
    4bf4:	01048493          	add	s1,s1,16
    4bf8:	00170713          	add	a4,a4,1
    4bfc:	01242023          	sw	s2,0(s0)
    4c00:	00d42223          	sw	a3,4(s0)
    4c04:	0a912423          	sw	s1,168(sp)
    4c08:	0ae12223          	sw	a4,164(sp)
    4c0c:	00840413          	add	s0,s0,8
    4c10:	fceb5ee3          	bge	s6,a4,4bec <_vfprintf_r+0x2934>
    4c14:	00812583          	lw	a1,8(sp)
    4c18:	0a010613          	add	a2,sp,160
    4c1c:	00098513          	mv	a0,s3
    4c20:	554000ef          	jal	5174 <__sprint_r>
    4c24:	00050463          	beqz	a0,4c2c <_vfprintf_r+0x2974>
    4c28:	b61fd06f          	j	2788 <_vfprintf_r+0x4d0>
    4c2c:	0a812483          	lw	s1,168(sp)
    4c30:	0a412703          	lw	a4,164(sp)
    4c34:	0ac10413          	add	s0,sp,172
    4c38:	01000693          	li	a3,16
    4c3c:	fb1ff06f          	j	4bec <_vfprintf_r+0x2934>
    4c40:	00012823          	sw	zero,16(sp)
    4c44:	0ec10c13          	add	s8,sp,236
    4c48:	a88ff06f          	j	3ed0 <_vfprintf_r+0x1c18>
    4c4c:	00090293          	mv	t0,s2
    4c50:	02012903          	lw	s2,32(sp)
    4c54:	000a0e93          	mv	t4,s4
    4c58:	01a484b3          	add	s1,s1,s10
    4c5c:	00170713          	add	a4,a4,1
    4c60:	00542023          	sw	t0,0(s0)
    4c64:	01a42223          	sw	s10,4(s0)
    4c68:	0a912423          	sw	s1,168(sp)
    4c6c:	0ae12223          	sw	a4,164(sp)
    4c70:	00700693          	li	a3,7
    4c74:	00e6c463          	blt	a3,a4,4c7c <_vfprintf_r+0x29c4>
    4c78:	b65fe06f          	j	37dc <_vfprintf_r+0x1524>
    4c7c:	00812583          	lw	a1,8(sp)
    4c80:	0a010613          	add	a2,sp,160
    4c84:	00098513          	mv	a0,s3
    4c88:	03d12023          	sw	t4,32(sp)
    4c8c:	4e8000ef          	jal	5174 <__sprint_r>
    4c90:	00050463          	beqz	a0,4c98 <_vfprintf_r+0x29e0>
    4c94:	af5fd06f          	j	2788 <_vfprintf_r+0x4d0>
    4c98:	0a812483          	lw	s1,168(sp)
    4c9c:	0a412703          	lw	a4,164(sp)
    4ca0:	02012e83          	lw	t4,32(sp)
    4ca4:	0ac10413          	add	s0,sp,172
    4ca8:	b20ff06f          	j	3fc8 <_vfprintf_r+0x1d10>
    4cac:	08a10693          	add	a3,sp,138
    4cb0:	00061863          	bnez	a2,4cc0 <_vfprintf_r+0x2a08>
    4cb4:	03000693          	li	a3,48
    4cb8:	08d10523          	sb	a3,138(sp)
    4cbc:	08b10693          	add	a3,sp,139
    4cc0:	15010793          	add	a5,sp,336
    4cc4:	40f68633          	sub	a2,a3,a5
    4cc8:	030d0713          	add	a4,s10,48
    4ccc:	0c960793          	add	a5,a2,201
    4cd0:	00e68023          	sb	a4,0(a3)
    4cd4:	04f12023          	sw	a5,64(sp)
    4cd8:	d5cff06f          	j	4234 <_vfprintf_r+0x1f7c>
    4cdc:	001ef713          	and	a4,t4,1
    4ce0:	d6070863          	beqz	a4,4250 <_vfprintf_r+0x1f98>
    4ce4:	d64ff06f          	j	4248 <_vfprintf_r+0x1f90>
    4ce8:	00812783          	lw	a5,8(sp)
    4cec:	00000293          	li	t0,0
    4cf0:	00c79783          	lh	a5,12(a5)
    4cf4:	0407e793          	or	a5,a5,64
    4cf8:	00812703          	lw	a4,8(sp)
    4cfc:	00f71623          	sh	a5,12(a4)
    4d00:	a8dfd06f          	j	278c <_vfprintf_r+0x4d4>
    4d04:	00012823          	sw	zero,16(sp)
    4d08:	00600313          	li	t1,6
    4d0c:	ff9fe06f          	j	3d04 <_vfprintf_r+0x1a4c>
    4d10:	06700e13          	li	t3,103
    4d14:	03c12783          	lw	a5,60(sp)
    4d18:	0ff00613          	li	a2,255
    4d1c:	0007c703          	lbu	a4,0(a5)
    4d20:	22c70263          	beq	a4,a2,4f44 <_vfprintf_r+0x2c8c>
    4d24:	00000593          	li	a1,0
    4d28:	00000693          	li	a3,0
    4d2c:	01475e63          	bge	a4,s4,4d48 <_vfprintf_r+0x2a90>
    4d30:	40ea0a33          	sub	s4,s4,a4
    4d34:	0017c703          	lbu	a4,1(a5)
    4d38:	04070863          	beqz	a4,4d88 <_vfprintf_r+0x2ad0>
    4d3c:	00168693          	add	a3,a3,1
    4d40:	00178793          	add	a5,a5,1
    4d44:	fec714e3          	bne	a4,a2,4d2c <_vfprintf_r+0x2a74>
    4d48:	02f12e23          	sw	a5,60(sp)
    4d4c:	02d12023          	sw	a3,32(sp)
    4d50:	02b12223          	sw	a1,36(sp)
    4d54:	02012783          	lw	a5,32(sp)
    4d58:	02412703          	lw	a4,36(sp)
    4d5c:	04c12583          	lw	a1,76(sp)
    4d60:	05c12823          	sw	t3,80(sp)
    4d64:	00e78533          	add	a0,a5,a4
    4d68:	3a80a0ef          	jal	f110 <__mulsi3>
    4d6c:	01a50d33          	add	s10,a0,s10
    4d70:	fffd4813          	not	a6,s10
    4d74:	41f85813          	sra	a6,a6,0x1f
    4d78:	05012e03          	lw	t3,80(sp)
    4d7c:	010d7cb3          	and	s9,s10,a6
    4d80:	000b0e93          	mv	t4,s6
    4d84:	cecff06f          	j	4270 <_vfprintf_r+0x1fb8>
    4d88:	0007c703          	lbu	a4,0(a5)
    4d8c:	00158593          	add	a1,a1,1
    4d90:	fb5ff06f          	j	4d44 <_vfprintf_r+0x2a8c>
    4d94:	03012783          	lw	a5,48(sp)
    4d98:	06600e13          	li	t3,102
    4d9c:	00f306b3          	add	a3,t1,a5
    4da0:	01468d33          	add	s10,a3,s4
    4da4:	d99ff06f          	j	4b3c <_vfprintf_r+0x2884>
    4da8:	02c12783          	lw	a5,44(sp)
    4dac:	0a07c863          	bltz	a5,4e5c <_vfprintf_r+0x2ba4>
    4db0:	07714603          	lbu	a2,119(sp)
    4db4:	04700713          	li	a4,71
    4db8:	0000ac17          	auipc	s8,0xa
    4dbc:	750c0c13          	add	s8,s8,1872 # f508 <__fini_array_end+0x200>
    4dc0:	01c75463          	bge	a4,t3,4dc8 <_vfprintf_r+0x2b10>
    4dc4:	b31fd06f          	j	28f4 <_vfprintf_r+0x63c>
    4dc8:	0000ac17          	auipc	s8,0xa
    4dcc:	73cc0c13          	add	s8,s8,1852 # f504 <__fini_array_end+0x1fc>
    4dd0:	b25fd06f          	j	28f4 <_vfprintf_r+0x63c>
    4dd4:	07714603          	lbu	a2,119(sp)
    4dd8:	01612a23          	sw	s6,20(sp)
    4ddc:	02012223          	sw	zero,36(sp)
    4de0:	02012023          	sw	zero,32(sp)
    4de4:	00030c93          	mv	s9,t1
    4de8:	00030d13          	mv	s10,t1
    4dec:	07300e13          	li	t3,115
    4df0:	00000313          	li	t1,0
    4df4:	00061463          	bnez	a2,4dfc <_vfprintf_r+0x2b44>
    4df8:	f00fd06f          	j	24f8 <_vfprintf_r+0x240>
    4dfc:	b1dfd06f          	j	2918 <_vfprintf_r+0x660>
    4e00:	00040313          	mv	t1,s0
    4e04:	01012903          	lw	s2,16(sp)
    4e08:	000b0413          	mv	s0,s6
    4e0c:	01412e03          	lw	t3,20(sp)
    4e10:	000c0b13          	mv	s6,s8
    4e14:	000a0e93          	mv	t4,s4
    4e18:	000c8c13          	mv	s8,s9
    4e1c:	00030d13          	mv	s10,t1
    4e20:	87cff06f          	j	3e9c <_vfprintf_r+0x1be4>
    4e24:	001b0793          	add	a5,s6,1
    4e28:	000c0993          	mv	s3,s8
    4e2c:	02412903          	lw	s2,36(sp)
    4e30:	04012e83          	lw	t4,64(sp)
    4e34:	05012e03          	lw	t3,80(sp)
    4e38:	05412403          	lw	s0,84(sp)
    4e3c:	000d0c13          	mv	s8,s10
    4e40:	00f487b3          	add	a5,s1,a5
    4e44:	03000693          	li	a3,48
    4e48:	840b40e3          	bltz	s6,4688 <_vfprintf_r+0x23d0>
    4e4c:	00148493          	add	s1,s1,1
    4e50:	fed48fa3          	sb	a3,-1(s1)
    4e54:	fe979ce3          	bne	a5,s1,4e4c <_vfprintf_r+0x2b94>
    4e58:	835ff06f          	j	468c <_vfprintf_r+0x23d4>
    4e5c:	02d00793          	li	a5,45
    4e60:	06f10ba3          	sb	a5,119(sp)
    4e64:	02d00613          	li	a2,45
    4e68:	f4dff06f          	j	4db4 <_vfprintf_r+0x2afc>
    4e6c:	00100693          	li	a3,1
    4e70:	414686b3          	sub	a3,a3,s4
    4e74:	06d12e23          	sw	a3,124(sp)
    4e78:	da4ff06f          	j	441c <_vfprintf_r+0x2164>
    4e7c:	01412783          	lw	a5,20(sp)
    4e80:	0007ab03          	lw	s6,0(a5)
    4e84:	00478793          	add	a5,a5,4
    4e88:	000b5463          	bgez	s6,4e90 <_vfprintf_r+0x2bd8>
    4e8c:	fff00b13          	li	s6,-1
    4e90:	00194e03          	lbu	t3,1(s2)
    4e94:	00f12a23          	sw	a5,20(sp)
    4e98:	00068913          	mv	s2,a3
    4e9c:	dccfd06f          	j	2468 <_vfprintf_r+0x1b0>
    4ea0:	00071a63          	bnez	a4,4eb4 <_vfprintf_r+0x2bfc>
    4ea4:	00100c93          	li	s9,1
    4ea8:	06600e13          	li	t3,102
    4eac:	00100d13          	li	s10,1
    4eb0:	879ff06f          	j	4728 <_vfprintf_r+0x2470>
    4eb4:	03012783          	lw	a5,48(sp)
    4eb8:	06600e13          	li	t3,102
    4ebc:	00178693          	add	a3,a5,1
    4ec0:	00668d33          	add	s10,a3,t1
    4ec4:	fffd4813          	not	a6,s10
    4ec8:	41f85813          	sra	a6,a6,0x1f
    4ecc:	010d7cb3          	and	s9,s10,a6
    4ed0:	859ff06f          	j	4728 <_vfprintf_r+0x2470>
    4ed4:	00200793          	li	a5,2
    4ed8:	04f12023          	sw	a5,64(sp)
    4edc:	b58ff06f          	j	4234 <_vfprintf_r+0x1f7c>
    4ee0:	00812703          	lw	a4,8(sp)
    4ee4:	00c71783          	lh	a5,12(a4)
    4ee8:	0407e793          	or	a5,a5,64
    4eec:	00f71623          	sh	a5,12(a4)
    4ef0:	8b5fd06f          	j	27a4 <_vfprintf_r+0x4ec>
    4ef4:	000a0513          	mv	a0,s4
    4ef8:	000d0593          	mv	a1,s10
    4efc:	00030613          	mv	a2,t1
    4f00:	00038693          	mv	a3,t2
    4f04:	05012023          	sw	a6,64(sp)
    4f08:	03c12223          	sw	t3,36(sp)
    4f0c:	01d12c23          	sw	t4,24(sp)
    4f10:	0a5080ef          	jal	d7b4 <__eqdf2>
    4f14:	01812e83          	lw	t4,24(sp)
    4f18:	02412e03          	lw	t3,36(sp)
    4f1c:	04012803          	lw	a6,64(sp)
    4f20:	f6051463          	bnez	a0,4688 <_vfprintf_r+0x23d0>
    4f24:	001b7693          	and	a3,s6,1
    4f28:	f6068063          	beqz	a3,4688 <_vfprintf_r+0x23d0>
    4f2c:	f14ff06f          	j	4640 <_vfprintf_r+0x2388>
    4f30:	00812783          	lw	a5,8(sp)
    4f34:	01012283          	lw	t0,16(sp)
    4f38:	00c79783          	lh	a5,12(a5)
    4f3c:	0407e793          	or	a5,a5,64
    4f40:	db9ff06f          	j	4cf8 <_vfprintf_r+0x2a40>
    4f44:	02012223          	sw	zero,36(sp)
    4f48:	02012023          	sw	zero,32(sp)
    4f4c:	e09ff06f          	j	4d54 <_vfprintf_r+0x2a9c>
    4f50:	04500d13          	li	s10,69
    4f54:	cccff06f          	j	4420 <_vfprintf_r+0x2168>

00004f58 <__sbprintf>:
    4f58:	b7010113          	add	sp,sp,-1168
    4f5c:	00c59783          	lh	a5,12(a1)
    4f60:	00e5d703          	lhu	a4,14(a1)
    4f64:	48812423          	sw	s0,1160(sp)
    4f68:	00058413          	mv	s0,a1
    4f6c:	000105b7          	lui	a1,0x10
    4f70:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x21d>
    4f74:	06442303          	lw	t1,100(s0)
    4f78:	01c42883          	lw	a7,28(s0)
    4f7c:	02442803          	lw	a6,36(s0)
    4f80:	01071713          	sll	a4,a4,0x10
    4f84:	00b7f7b3          	and	a5,a5,a1
    4f88:	00e7e7b3          	or	a5,a5,a4
    4f8c:	40000593          	li	a1,1024
    4f90:	49212023          	sw	s2,1152(sp)
    4f94:	00f12a23          	sw	a5,20(sp)
    4f98:	00050913          	mv	s2,a0
    4f9c:	07010793          	add	a5,sp,112
    4fa0:	06010513          	add	a0,sp,96
    4fa4:	48112623          	sw	ra,1164(sp)
    4fa8:	48912223          	sw	s1,1156(sp)
    4fac:	47312e23          	sw	s3,1148(sp)
    4fb0:	00060493          	mv	s1,a2
    4fb4:	00068993          	mv	s3,a3
    4fb8:	06612623          	sw	t1,108(sp)
    4fbc:	03112223          	sw	a7,36(sp)
    4fc0:	03012623          	sw	a6,44(sp)
    4fc4:	00f12423          	sw	a5,8(sp)
    4fc8:	00f12c23          	sw	a5,24(sp)
    4fcc:	00b12823          	sw	a1,16(sp)
    4fd0:	00b12e23          	sw	a1,28(sp)
    4fd4:	02012023          	sw	zero,32(sp)
    4fd8:	b7cfc0ef          	jal	1354 <__retarget_lock_init_recursive>
    4fdc:	00048613          	mv	a2,s1
    4fe0:	00098693          	mv	a3,s3
    4fe4:	00810593          	add	a1,sp,8
    4fe8:	00090513          	mv	a0,s2
    4fec:	accfd0ef          	jal	22b8 <_vfprintf_r>
    4ff0:	00050493          	mv	s1,a0
    4ff4:	04055263          	bgez	a0,5038 <__sbprintf+0xe0>
    4ff8:	01415783          	lhu	a5,20(sp)
    4ffc:	0407f793          	and	a5,a5,64
    5000:	00078863          	beqz	a5,5010 <__sbprintf+0xb8>
    5004:	00c45783          	lhu	a5,12(s0)
    5008:	0407e793          	or	a5,a5,64
    500c:	00f41623          	sh	a5,12(s0)
    5010:	06012503          	lw	a0,96(sp)
    5014:	b44fc0ef          	jal	1358 <__retarget_lock_close_recursive>
    5018:	48c12083          	lw	ra,1164(sp)
    501c:	48812403          	lw	s0,1160(sp)
    5020:	48012903          	lw	s2,1152(sp)
    5024:	47c12983          	lw	s3,1148(sp)
    5028:	00048513          	mv	a0,s1
    502c:	48412483          	lw	s1,1156(sp)
    5030:	49010113          	add	sp,sp,1168
    5034:	00008067          	ret
    5038:	00810593          	add	a1,sp,8
    503c:	00090513          	mv	a0,s2
    5040:	449010ef          	jal	6c88 <_fflush_r>
    5044:	fa050ae3          	beqz	a0,4ff8 <__sbprintf+0xa0>
    5048:	fff00493          	li	s1,-1
    504c:	fadff06f          	j	4ff8 <__sbprintf+0xa0>

00005050 <__sprint_r.part.0>:
    5050:	0645a783          	lw	a5,100(a1)
    5054:	fd010113          	add	sp,sp,-48
    5058:	01612823          	sw	s6,16(sp)
    505c:	02112623          	sw	ra,44(sp)
    5060:	01279713          	sll	a4,a5,0x12
    5064:	00060b13          	mv	s6,a2
    5068:	0e075863          	bgez	a4,5158 <__sprint_r.part.0+0x108>
    506c:	00862783          	lw	a5,8(a2)
    5070:	03212023          	sw	s2,32(sp)
    5074:	01312e23          	sw	s3,28(sp)
    5078:	01512a23          	sw	s5,20(sp)
    507c:	01712623          	sw	s7,12(sp)
    5080:	00058913          	mv	s2,a1
    5084:	00062b83          	lw	s7,0(a2)
    5088:	00050993          	mv	s3,a0
    508c:	fff00a93          	li	s5,-1
    5090:	0a078863          	beqz	a5,5140 <__sprint_r.part.0+0xf0>
    5094:	02812423          	sw	s0,40(sp)
    5098:	02912223          	sw	s1,36(sp)
    509c:	01412c23          	sw	s4,24(sp)
    50a0:	01812423          	sw	s8,8(sp)
    50a4:	004bac03          	lw	s8,4(s7)
    50a8:	000ba403          	lw	s0,0(s7)
    50ac:	002c5a13          	srl	s4,s8,0x2
    50b0:	060a0663          	beqz	s4,511c <__sprint_r.part.0+0xcc>
    50b4:	00000493          	li	s1,0
    50b8:	00c0006f          	j	50c4 <__sprint_r.part.0+0x74>
    50bc:	00440413          	add	s0,s0,4
    50c0:	049a0c63          	beq	s4,s1,5118 <__sprint_r.part.0+0xc8>
    50c4:	00042583          	lw	a1,0(s0)
    50c8:	00090613          	mv	a2,s2
    50cc:	00098513          	mv	a0,s3
    50d0:	399020ef          	jal	7c68 <_fputwc_r>
    50d4:	00148493          	add	s1,s1,1
    50d8:	ff5512e3          	bne	a0,s5,50bc <__sprint_r.part.0+0x6c>
    50dc:	02812403          	lw	s0,40(sp)
    50e0:	02412483          	lw	s1,36(sp)
    50e4:	02012903          	lw	s2,32(sp)
    50e8:	01c12983          	lw	s3,28(sp)
    50ec:	01812a03          	lw	s4,24(sp)
    50f0:	01412a83          	lw	s5,20(sp)
    50f4:	00c12b83          	lw	s7,12(sp)
    50f8:	00812c03          	lw	s8,8(sp)
    50fc:	fff00513          	li	a0,-1
    5100:	02c12083          	lw	ra,44(sp)
    5104:	000b2423          	sw	zero,8(s6)
    5108:	000b2223          	sw	zero,4(s6)
    510c:	01012b03          	lw	s6,16(sp)
    5110:	03010113          	add	sp,sp,48
    5114:	00008067          	ret
    5118:	008b2783          	lw	a5,8(s6)
    511c:	ffcc7c13          	and	s8,s8,-4
    5120:	418787b3          	sub	a5,a5,s8
    5124:	00fb2423          	sw	a5,8(s6)
    5128:	008b8b93          	add	s7,s7,8
    512c:	f6079ce3          	bnez	a5,50a4 <__sprint_r.part.0+0x54>
    5130:	02812403          	lw	s0,40(sp)
    5134:	02412483          	lw	s1,36(sp)
    5138:	01812a03          	lw	s4,24(sp)
    513c:	00812c03          	lw	s8,8(sp)
    5140:	02012903          	lw	s2,32(sp)
    5144:	01c12983          	lw	s3,28(sp)
    5148:	01412a83          	lw	s5,20(sp)
    514c:	00c12b83          	lw	s7,12(sp)
    5150:	00000513          	li	a0,0
    5154:	fadff06f          	j	5100 <__sprint_r.part.0+0xb0>
    5158:	6b5010ef          	jal	700c <__sfvwrite_r>
    515c:	02c12083          	lw	ra,44(sp)
    5160:	000b2423          	sw	zero,8(s6)
    5164:	000b2223          	sw	zero,4(s6)
    5168:	01012b03          	lw	s6,16(sp)
    516c:	03010113          	add	sp,sp,48
    5170:	00008067          	ret

00005174 <__sprint_r>:
    5174:	00862703          	lw	a4,8(a2)
    5178:	00070463          	beqz	a4,5180 <__sprint_r+0xc>
    517c:	ed5ff06f          	j	5050 <__sprint_r.part.0>
    5180:	00062223          	sw	zero,4(a2)
    5184:	00000513          	li	a0,0
    5188:	00008067          	ret

0000518c <_vfiprintf_r>:
    518c:	eb010113          	add	sp,sp,-336
    5190:	14812423          	sw	s0,328(sp)
    5194:	13312e23          	sw	s3,316(sp)
    5198:	13812423          	sw	s8,296(sp)
    519c:	00050413          	mv	s0,a0
    51a0:	00058993          	mv	s3,a1
    51a4:	00060c13          	mv	s8,a2
    51a8:	00000593          	li	a1,0
    51ac:	00800613          	li	a2,8
    51b0:	05010513          	add	a0,sp,80
    51b4:	13512a23          	sw	s5,308(sp)
    51b8:	14112623          	sw	ra,332(sp)
    51bc:	00068a93          	mv	s5,a3
    51c0:	9a4fc0ef          	jal	1364 <memset>
    51c4:	00040863          	beqz	s0,51d4 <_vfiprintf_r+0x48>
    51c8:	03442783          	lw	a5,52(s0)
    51cc:	00079463          	bnez	a5,51d4 <_vfiprintf_r+0x48>
    51d0:	49c0106f          	j	666c <_vfiprintf_r+0x14e0>
    51d4:	0649a703          	lw	a4,100(s3)
    51d8:	00c99783          	lh	a5,12(s3)
    51dc:	00177713          	and	a4,a4,1
    51e0:	00071863          	bnez	a4,51f0 <_vfiprintf_r+0x64>
    51e4:	2007f713          	and	a4,a5,512
    51e8:	00071463          	bnez	a4,51f0 <_vfiprintf_r+0x64>
    51ec:	0b80106f          	j	62a4 <_vfiprintf_r+0x1118>
    51f0:	01279713          	sll	a4,a5,0x12
    51f4:	02074663          	bltz	a4,5220 <_vfiprintf_r+0x94>
    51f8:	0649a703          	lw	a4,100(s3)
    51fc:	00002637          	lui	a2,0x2
    5200:	ffffe6b7          	lui	a3,0xffffe
    5204:	00c7e7b3          	or	a5,a5,a2
    5208:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    520c:	01079793          	sll	a5,a5,0x10
    5210:	4107d793          	sra	a5,a5,0x10
    5214:	00d77733          	and	a4,a4,a3
    5218:	00f99623          	sh	a5,12(s3)
    521c:	06e9a223          	sw	a4,100(s3)
    5220:	0087f713          	and	a4,a5,8
    5224:	2e070463          	beqz	a4,550c <_vfiprintf_r+0x380>
    5228:	0109a703          	lw	a4,16(s3)
    522c:	2e070063          	beqz	a4,550c <_vfiprintf_r+0x380>
    5230:	01a7f713          	and	a4,a5,26
    5234:	00a00693          	li	a3,10
    5238:	2ed70c63          	beq	a4,a3,5530 <_vfiprintf_r+0x3a4>
    523c:	13412c23          	sw	s4,312(sp)
    5240:	06c10a13          	add	s4,sp,108
    5244:	14912223          	sw	s1,324(sp)
    5248:	15212023          	sw	s2,320(sp)
    524c:	13612823          	sw	s6,304(sp)
    5250:	13712623          	sw	s7,300(sp)
    5254:	13912223          	sw	s9,292(sp)
    5258:	13a12023          	sw	s10,288(sp)
    525c:	000c0c93          	mv	s9,s8
    5260:	11b12e23          	sw	s11,284(sp)
    5264:	07412023          	sw	s4,96(sp)
    5268:	06012423          	sw	zero,104(sp)
    526c:	06012223          	sw	zero,100(sp)
    5270:	00012a23          	sw	zero,20(sp)
    5274:	02012623          	sw	zero,44(sp)
    5278:	02012823          	sw	zero,48(sp)
    527c:	02012a23          	sw	zero,52(sp)
    5280:	00012623          	sw	zero,12(sp)
    5284:	7fffb497          	auipc	s1,0x7fffb
    5288:	2b048493          	add	s1,s1,688 # 80000534 <__global_locale>
    528c:	02500913          	li	s2,37
    5290:	0000ab97          	auipc	s7,0xa
    5294:	784b8b93          	add	s7,s7,1924 # fa14 <blanks.1+0x10>
    5298:	0000bb17          	auipc	s6,0xb
    529c:	8e8b0b13          	add	s6,s6,-1816 # fb80 <zeroes.0>
    52a0:	000a0c13          	mv	s8,s4
    52a4:	000c8d93          	mv	s11,s9
    52a8:	0e44ad03          	lw	s10,228(s1)
    52ac:	3f9020ef          	jal	7ea4 <__locale_mb_cur_max>
    52b0:	00050693          	mv	a3,a0
    52b4:	05010713          	add	a4,sp,80
    52b8:	000d8613          	mv	a2,s11
    52bc:	04810593          	add	a1,sp,72
    52c0:	00040513          	mv	a0,s0
    52c4:	000d00e7          	jalr	s10
    52c8:	2e050e63          	beqz	a0,55c4 <_vfiprintf_r+0x438>
    52cc:	2c054e63          	bltz	a0,55a8 <_vfiprintf_r+0x41c>
    52d0:	04812783          	lw	a5,72(sp)
    52d4:	01278663          	beq	a5,s2,52e0 <_vfiprintf_r+0x154>
    52d8:	00ad8db3          	add	s11,s11,a0
    52dc:	fcdff06f          	j	52a8 <_vfiprintf_r+0x11c>
    52e0:	00050d13          	mv	s10,a0
    52e4:	419d87b3          	sub	a5,s11,s9
    52e8:	2f9d9463          	bne	s11,s9,55d0 <_vfiprintf_r+0x444>
    52ec:	00000e13          	li	t3,0
    52f0:	001dc683          	lbu	a3,1(s11)
    52f4:	001d8c93          	add	s9,s11,1
    52f8:	040101a3          	sb	zero,67(sp)
    52fc:	fff00713          	li	a4,-1
    5300:	00000893          	li	a7,0
    5304:	05a00d13          	li	s10,90
    5308:	000e0d93          	mv	s11,t3
    530c:	001c8c93          	add	s9,s9,1
    5310:	fe068793          	add	a5,a3,-32
    5314:	04fd6663          	bltu	s10,a5,5360 <_vfiprintf_r+0x1d4>
    5318:	00279793          	sll	a5,a5,0x2
    531c:	017787b3          	add	a5,a5,s7
    5320:	0007a783          	lw	a5,0(a5)
    5324:	017787b3          	add	a5,a5,s7
    5328:	00078067          	jr	a5
    532c:	00000893          	li	a7,0
    5330:	fd068793          	add	a5,a3,-48
    5334:	00900593          	li	a1,9
    5338:	000cc683          	lbu	a3,0(s9)
    533c:	00289613          	sll	a2,a7,0x2
    5340:	011608b3          	add	a7,a2,a7
    5344:	00189893          	sll	a7,a7,0x1
    5348:	011788b3          	add	a7,a5,a7
    534c:	fd068793          	add	a5,a3,-48
    5350:	001c8c93          	add	s9,s9,1
    5354:	fef5f2e3          	bgeu	a1,a5,5338 <_vfiprintf_r+0x1ac>
    5358:	fe068793          	add	a5,a3,-32
    535c:	fafd7ee3          	bgeu	s10,a5,5318 <_vfiprintf_r+0x18c>
    5360:	000d8e13          	mv	t3,s11
    5364:	2c068663          	beqz	a3,5630 <_vfiprintf_r+0x4a4>
    5368:	0ad10623          	sb	a3,172(sp)
    536c:	040101a3          	sb	zero,67(sp)
    5370:	00100e93          	li	t4,1
    5374:	00100d13          	li	s10,1
    5378:	0ac10813          	add	a6,sp,172
    537c:	00012823          	sw	zero,16(sp)
    5380:	00000713          	li	a4,0
    5384:	00000f93          	li	t6,0
    5388:	06412603          	lw	a2,100(sp)
    538c:	084e7293          	and	t0,t3,132
    5390:	06812783          	lw	a5,104(sp)
    5394:	00160593          	add	a1,a2,1 # 2001 <_malloc_r+0x541>
    5398:	00058f13          	mv	t5,a1
    539c:	00029663          	bnez	t0,53a8 <_vfiprintf_r+0x21c>
    53a0:	41d88db3          	sub	s11,a7,t4
    53a4:	47b046e3          	bgtz	s11,6010 <_vfiprintf_r+0xe84>
    53a8:	04314583          	lbu	a1,67(sp)
    53ac:	02058a63          	beqz	a1,53e0 <_vfiprintf_r+0x254>
    53b0:	04310613          	add	a2,sp,67
    53b4:	00178793          	add	a5,a5,1
    53b8:	00100693          	li	a3,1
    53bc:	00cc2023          	sw	a2,0(s8)
    53c0:	00dc2223          	sw	a3,4(s8)
    53c4:	06f12423          	sw	a5,104(sp)
    53c8:	07e12223          	sw	t5,100(sp)
    53cc:	00700613          	li	a2,7
    53d0:	35e64ce3          	blt	a2,t5,5f28 <_vfiprintf_r+0xd9c>
    53d4:	000f0613          	mv	a2,t5
    53d8:	008c0c13          	add	s8,s8,8
    53dc:	001f0f13          	add	t5,t5,1
    53e0:	080f8063          	beqz	t6,5460 <_vfiprintf_r+0x2d4>
    53e4:	00200613          	li	a2,2
    53e8:	00278793          	add	a5,a5,2
    53ec:	04410693          	add	a3,sp,68
    53f0:	00cc2223          	sw	a2,4(s8)
    53f4:	00dc2023          	sw	a3,0(s8)
    53f8:	06f12423          	sw	a5,104(sp)
    53fc:	07e12223          	sw	t5,100(sp)
    5400:	00700613          	li	a2,7
    5404:	3be652e3          	bge	a2,t5,5fa8 <_vfiprintf_r+0xe1c>
    5408:	60078ae3          	beqz	a5,621c <_vfiprintf_r+0x1090>
    540c:	06010613          	add	a2,sp,96
    5410:	00098593          	mv	a1,s3
    5414:	00040513          	mv	a0,s0
    5418:	03d12c23          	sw	t4,56(sp)
    541c:	02e12423          	sw	a4,40(sp)
    5420:	03112223          	sw	a7,36(sp)
    5424:	03012023          	sw	a6,32(sp)
    5428:	00512e23          	sw	t0,28(sp)
    542c:	01c12c23          	sw	t3,24(sp)
    5430:	c21ff0ef          	jal	5050 <__sprint_r.part.0>
    5434:	22051463          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    5438:	06412603          	lw	a2,100(sp)
    543c:	06812783          	lw	a5,104(sp)
    5440:	03812e83          	lw	t4,56(sp)
    5444:	02812703          	lw	a4,40(sp)
    5448:	02412883          	lw	a7,36(sp)
    544c:	02012803          	lw	a6,32(sp)
    5450:	01c12283          	lw	t0,28(sp)
    5454:	01812e03          	lw	t3,24(sp)
    5458:	000a0c13          	mv	s8,s4
    545c:	00160f13          	add	t5,a2,1
    5460:	08000593          	li	a1,128
    5464:	06b286e3          	beq	t0,a1,5cd0 <_vfiprintf_r+0xb44>
    5468:	41a70733          	sub	a4,a4,s10
    546c:	1ae04ae3          	bgtz	a4,5e20 <_vfiprintf_r+0xc94>
    5470:	00fd07b3          	add	a5,s10,a5
    5474:	010c2023          	sw	a6,0(s8)
    5478:	01ac2223          	sw	s10,4(s8)
    547c:	06f12423          	sw	a5,104(sp)
    5480:	07e12223          	sw	t5,100(sp)
    5484:	00700713          	li	a4,7
    5488:	03e758e3          	bge	a4,t5,5cb8 <_vfiprintf_r+0xb2c>
    548c:	24078063          	beqz	a5,56cc <_vfiprintf_r+0x540>
    5490:	06010613          	add	a2,sp,96
    5494:	00098593          	mv	a1,s3
    5498:	00040513          	mv	a0,s0
    549c:	03d12023          	sw	t4,32(sp)
    54a0:	01112e23          	sw	a7,28(sp)
    54a4:	01c12c23          	sw	t3,24(sp)
    54a8:	ba9ff0ef          	jal	5050 <__sprint_r.part.0>
    54ac:	1a051863          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    54b0:	06812783          	lw	a5,104(sp)
    54b4:	02012e83          	lw	t4,32(sp)
    54b8:	01c12883          	lw	a7,28(sp)
    54bc:	01812e03          	lw	t3,24(sp)
    54c0:	000a0c13          	mv	s8,s4
    54c4:	004e7e13          	and	t3,t3,4
    54c8:	000e0663          	beqz	t3,54d4 <_vfiprintf_r+0x348>
    54cc:	41d88db3          	sub	s11,a7,t4
    54d0:	21b04a63          	bgtz	s11,56e4 <_vfiprintf_r+0x558>
    54d4:	01d8d463          	bge	a7,t4,54dc <_vfiprintf_r+0x350>
    54d8:	000e8893          	mv	a7,t4
    54dc:	00c12703          	lw	a4,12(sp)
    54e0:	01170733          	add	a4,a4,a7
    54e4:	00e12623          	sw	a4,12(sp)
    54e8:	16079063          	bnez	a5,5648 <_vfiprintf_r+0x4bc>
    54ec:	01012783          	lw	a5,16(sp)
    54f0:	06012223          	sw	zero,100(sp)
    54f4:	00078863          	beqz	a5,5504 <_vfiprintf_r+0x378>
    54f8:	00078593          	mv	a1,a5
    54fc:	00040513          	mv	a0,s0
    5500:	ab4fc0ef          	jal	17b4 <_free_r>
    5504:	000a0c13          	mv	s8,s4
    5508:	d9dff06f          	j	52a4 <_vfiprintf_r+0x118>
    550c:	00098593          	mv	a1,s3
    5510:	00040513          	mv	a0,s0
    5514:	4b0020ef          	jal	79c4 <__swsetup_r>
    5518:	00050463          	beqz	a0,5520 <_vfiprintf_r+0x394>
    551c:	3840106f          	j	68a0 <_vfiprintf_r+0x1714>
    5520:	00c99783          	lh	a5,12(s3)
    5524:	00a00693          	li	a3,10
    5528:	01a7f713          	and	a4,a5,26
    552c:	d0d718e3          	bne	a4,a3,523c <_vfiprintf_r+0xb0>
    5530:	00e99703          	lh	a4,14(s3)
    5534:	d00744e3          	bltz	a4,523c <_vfiprintf_r+0xb0>
    5538:	0649a703          	lw	a4,100(s3)
    553c:	00177713          	and	a4,a4,1
    5540:	00071863          	bnez	a4,5550 <_vfiprintf_r+0x3c4>
    5544:	2007f793          	and	a5,a5,512
    5548:	00079463          	bnez	a5,5550 <_vfiprintf_r+0x3c4>
    554c:	2ac0106f          	j	67f8 <_vfiprintf_r+0x166c>
    5550:	000a8693          	mv	a3,s5
    5554:	000c0613          	mv	a2,s8
    5558:	00098593          	mv	a1,s3
    555c:	00040513          	mv	a0,s0
    5560:	3e4010ef          	jal	6944 <__sbprintf>
    5564:	14c12083          	lw	ra,332(sp)
    5568:	14812403          	lw	s0,328(sp)
    556c:	00a12623          	sw	a0,12(sp)
    5570:	00c12503          	lw	a0,12(sp)
    5574:	13c12983          	lw	s3,316(sp)
    5578:	13412a83          	lw	s5,308(sp)
    557c:	12812c03          	lw	s8,296(sp)
    5580:	15010113          	add	sp,sp,336
    5584:	00008067          	ret
    5588:	000aa883          	lw	a7,0(s5)
    558c:	004a8a93          	add	s5,s5,4
    5590:	3608cc63          	bltz	a7,5908 <_vfiprintf_r+0x77c>
    5594:	000cc683          	lbu	a3,0(s9)
    5598:	d75ff06f          	j	530c <_vfiprintf_r+0x180>
    559c:	000cc683          	lbu	a3,0(s9)
    55a0:	020ded93          	or	s11,s11,32
    55a4:	d69ff06f          	j	530c <_vfiprintf_r+0x180>
    55a8:	00800613          	li	a2,8
    55ac:	00000593          	li	a1,0
    55b0:	05010513          	add	a0,sp,80
    55b4:	db1fb0ef          	jal	1364 <memset>
    55b8:	00100513          	li	a0,1
    55bc:	00ad8db3          	add	s11,s11,a0
    55c0:	ce9ff06f          	j	52a8 <_vfiprintf_r+0x11c>
    55c4:	00050d13          	mv	s10,a0
    55c8:	419d87b3          	sub	a5,s11,s9
    55cc:	079d8263          	beq	s11,s9,5630 <_vfiprintf_r+0x4a4>
    55d0:	06812683          	lw	a3,104(sp)
    55d4:	06412703          	lw	a4,100(sp)
    55d8:	019c2023          	sw	s9,0(s8)
    55dc:	00d786b3          	add	a3,a5,a3
    55e0:	00170713          	add	a4,a4,1
    55e4:	00fc2223          	sw	a5,4(s8)
    55e8:	06d12423          	sw	a3,104(sp)
    55ec:	06e12223          	sw	a4,100(sp)
    55f0:	00700613          	li	a2,7
    55f4:	008c0c13          	add	s8,s8,8
    55f8:	02e65463          	bge	a2,a4,5620 <_vfiprintf_r+0x494>
    55fc:	38068ce3          	beqz	a3,6194 <_vfiprintf_r+0x1008>
    5600:	06010613          	add	a2,sp,96
    5604:	00098593          	mv	a1,s3
    5608:	00040513          	mv	a0,s0
    560c:	00f12823          	sw	a5,16(sp)
    5610:	a41ff0ef          	jal	5050 <__sprint_r.part.0>
    5614:	01012783          	lw	a5,16(sp)
    5618:	04051c63          	bnez	a0,5670 <_vfiprintf_r+0x4e4>
    561c:	000a0c13          	mv	s8,s4
    5620:	00c12703          	lw	a4,12(sp)
    5624:	00f707b3          	add	a5,a4,a5
    5628:	00f12623          	sw	a5,12(sp)
    562c:	cc0d10e3          	bnez	s10,52ec <_vfiprintf_r+0x160>
    5630:	06812783          	lw	a5,104(sp)
    5634:	00078463          	beqz	a5,563c <_vfiprintf_r+0x4b0>
    5638:	22c0106f          	j	6864 <_vfiprintf_r+0x16d8>
    563c:	00c99783          	lh	a5,12(s3)
    5640:	06012223          	sw	zero,100(sp)
    5644:	0300006f          	j	5674 <_vfiprintf_r+0x4e8>
    5648:	06010613          	add	a2,sp,96
    564c:	00098593          	mv	a1,s3
    5650:	00040513          	mv	a0,s0
    5654:	9fdff0ef          	jal	5050 <__sprint_r.part.0>
    5658:	e8050ae3          	beqz	a0,54ec <_vfiprintf_r+0x360>
    565c:	01012783          	lw	a5,16(sp)
    5660:	00078863          	beqz	a5,5670 <_vfiprintf_r+0x4e4>
    5664:	01012583          	lw	a1,16(sp)
    5668:	00040513          	mv	a0,s0
    566c:	948fc0ef          	jal	17b4 <_free_r>
    5670:	00c99783          	lh	a5,12(s3)
    5674:	0649a703          	lw	a4,100(s3)
    5678:	00177713          	and	a4,a4,1
    567c:	16070a63          	beqz	a4,57f0 <_vfiprintf_r+0x664>
    5680:	0407f793          	and	a5,a5,64
    5684:	14412483          	lw	s1,324(sp)
    5688:	14012903          	lw	s2,320(sp)
    568c:	13812a03          	lw	s4,312(sp)
    5690:	13012b03          	lw	s6,304(sp)
    5694:	12c12b83          	lw	s7,300(sp)
    5698:	12412c83          	lw	s9,292(sp)
    569c:	12012d03          	lw	s10,288(sp)
    56a0:	11c12d83          	lw	s11,284(sp)
    56a4:	00078463          	beqz	a5,56ac <_vfiprintf_r+0x520>
    56a8:	2180106f          	j	68c0 <_vfiprintf_r+0x1734>
    56ac:	14c12083          	lw	ra,332(sp)
    56b0:	14812403          	lw	s0,328(sp)
    56b4:	00c12503          	lw	a0,12(sp)
    56b8:	13c12983          	lw	s3,316(sp)
    56bc:	13412a83          	lw	s5,308(sp)
    56c0:	12812c03          	lw	s8,296(sp)
    56c4:	15010113          	add	sp,sp,336
    56c8:	00008067          	ret
    56cc:	06012223          	sw	zero,100(sp)
    56d0:	004e7e13          	and	t3,t3,4
    56d4:	240e0ee3          	beqz	t3,6130 <_vfiprintf_r+0xfa4>
    56d8:	41d88db3          	sub	s11,a7,t4
    56dc:	25b05ae3          	blez	s11,6130 <_vfiprintf_r+0xfa4>
    56e0:	000a0c13          	mv	s8,s4
    56e4:	01000713          	li	a4,16
    56e8:	06412683          	lw	a3,100(sp)
    56ec:	01b74463          	blt	a4,s11,56f4 <_vfiprintf_r+0x568>
    56f0:	1900106f          	j	6880 <_vfiprintf_r+0x16f4>
    56f4:	000a8713          	mv	a4,s5
    56f8:	0000a317          	auipc	t1,0xa
    56fc:	49830313          	add	t1,t1,1176 # fb90 <blanks.1>
    5700:	000c0593          	mv	a1,s8
    5704:	000d8a93          	mv	s5,s11
    5708:	01000813          	li	a6,16
    570c:	00700d13          	li	s10,7
    5710:	01112c23          	sw	a7,24(sp)
    5714:	01d12e23          	sw	t4,28(sp)
    5718:	00030c13          	mv	s8,t1
    571c:	00070d93          	mv	s11,a4
    5720:	0180006f          	j	5738 <_vfiprintf_r+0x5ac>
    5724:	00268613          	add	a2,a3,2
    5728:	00858593          	add	a1,a1,8
    572c:	00070693          	mv	a3,a4
    5730:	ff0a8a93          	add	s5,s5,-16
    5734:	05585a63          	bge	a6,s5,5788 <_vfiprintf_r+0x5fc>
    5738:	01078793          	add	a5,a5,16
    573c:	00168713          	add	a4,a3,1
    5740:	0185a023          	sw	s8,0(a1)
    5744:	0105a223          	sw	a6,4(a1)
    5748:	06f12423          	sw	a5,104(sp)
    574c:	06e12223          	sw	a4,100(sp)
    5750:	fced5ae3          	bge	s10,a4,5724 <_vfiprintf_r+0x598>
    5754:	56078663          	beqz	a5,5cc0 <_vfiprintf_r+0xb34>
    5758:	06010613          	add	a2,sp,96
    575c:	00098593          	mv	a1,s3
    5760:	00040513          	mv	a0,s0
    5764:	8edff0ef          	jal	5050 <__sprint_r.part.0>
    5768:	ee051ae3          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    576c:	06412683          	lw	a3,100(sp)
    5770:	01000813          	li	a6,16
    5774:	ff0a8a93          	add	s5,s5,-16
    5778:	06812783          	lw	a5,104(sp)
    577c:	000a0593          	mv	a1,s4
    5780:	00168613          	add	a2,a3,1
    5784:	fb584ae3          	blt	a6,s5,5738 <_vfiprintf_r+0x5ac>
    5788:	01812883          	lw	a7,24(sp)
    578c:	01c12e83          	lw	t4,28(sp)
    5790:	000d8713          	mv	a4,s11
    5794:	000c0313          	mv	t1,s8
    5798:	000a8d93          	mv	s11,s5
    579c:	00058c13          	mv	s8,a1
    57a0:	00070a93          	mv	s5,a4
    57a4:	01b787b3          	add	a5,a5,s11
    57a8:	006c2023          	sw	t1,0(s8)
    57ac:	01bc2223          	sw	s11,4(s8)
    57b0:	06f12423          	sw	a5,104(sp)
    57b4:	06c12223          	sw	a2,100(sp)
    57b8:	00700713          	li	a4,7
    57bc:	d0c75ce3          	bge	a4,a2,54d4 <_vfiprintf_r+0x348>
    57c0:	160788e3          	beqz	a5,6130 <_vfiprintf_r+0xfa4>
    57c4:	06010613          	add	a2,sp,96
    57c8:	00098593          	mv	a1,s3
    57cc:	00040513          	mv	a0,s0
    57d0:	01d12e23          	sw	t4,28(sp)
    57d4:	01112c23          	sw	a7,24(sp)
    57d8:	879ff0ef          	jal	5050 <__sprint_r.part.0>
    57dc:	e80510e3          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    57e0:	06812783          	lw	a5,104(sp)
    57e4:	01c12e83          	lw	t4,28(sp)
    57e8:	01812883          	lw	a7,24(sp)
    57ec:	ce9ff06f          	j	54d4 <_vfiprintf_r+0x348>
    57f0:	2007f713          	and	a4,a5,512
    57f4:	e80716e3          	bnez	a4,5680 <_vfiprintf_r+0x4f4>
    57f8:	0589a503          	lw	a0,88(s3)
    57fc:	b65fb0ef          	jal	1360 <__retarget_lock_release_recursive>
    5800:	00c99783          	lh	a5,12(s3)
    5804:	e7dff06f          	j	5680 <_vfiprintf_r+0x4f4>
    5808:	000aa803          	lw	a6,0(s5)
    580c:	040101a3          	sb	zero,67(sp)
    5810:	000d8e13          	mv	t3,s11
    5814:	004a8a93          	add	s5,s5,4
    5818:	68080ae3          	beqz	a6,66ac <_vfiprintf_r+0x1520>
    581c:	05300793          	li	a5,83
    5820:	3cf68ce3          	beq	a3,a5,63f8 <_vfiprintf_r+0x126c>
    5824:	010df793          	and	a5,s11,16
    5828:	3c0798e3          	bnez	a5,63f8 <_vfiprintf_r+0x126c>
    582c:	00075463          	bgez	a4,5834 <_vfiprintf_r+0x6a8>
    5830:	7fd0006f          	j	682c <_vfiprintf_r+0x16a0>
    5834:	00070613          	mv	a2,a4
    5838:	00080513          	mv	a0,a6
    583c:	00000593          	li	a1,0
    5840:	03112223          	sw	a7,36(sp)
    5844:	00e12e23          	sw	a4,28(sp)
    5848:	01012c23          	sw	a6,24(sp)
    584c:	03b12023          	sw	s11,32(sp)
    5850:	4e4020ef          	jal	7d34 <memchr>
    5854:	00a12823          	sw	a0,16(sp)
    5858:	01812803          	lw	a6,24(sp)
    585c:	01c12703          	lw	a4,28(sp)
    5860:	02012e03          	lw	t3,32(sp)
    5864:	02412883          	lw	a7,36(sp)
    5868:	00051463          	bnez	a0,5870 <_vfiprintf_r+0x6e4>
    586c:	7990006f          	j	6804 <_vfiprintf_r+0x1678>
    5870:	41050d33          	sub	s10,a0,a6
    5874:	fffd4e93          	not	t4,s10
    5878:	41fede93          	sra	t4,t4,0x1f
    587c:	01dd7eb3          	and	t4,s10,t4
    5880:	00012823          	sw	zero,16(sp)
    5884:	6dd0006f          	j	6760 <_vfiprintf_r+0x15d4>
    5888:	04300793          	li	a5,67
    588c:	000d8e13          	mv	t3,s11
    5890:	004a8d93          	add	s11,s5,4
    5894:	00f68663          	beq	a3,a5,58a0 <_vfiprintf_r+0x714>
    5898:	010e7793          	and	a5,t3,16
    589c:	280788e3          	beqz	a5,632c <_vfiprintf_r+0x11a0>
    58a0:	00800613          	li	a2,8
    58a4:	00000593          	li	a1,0
    58a8:	05810513          	add	a0,sp,88
    58ac:	01112e23          	sw	a7,28(sp)
    58b0:	01c12c23          	sw	t3,24(sp)
    58b4:	ab1fb0ef          	jal	1364 <memset>
    58b8:	000aa603          	lw	a2,0(s5)
    58bc:	0ac10593          	add	a1,sp,172
    58c0:	05810693          	add	a3,sp,88
    58c4:	00040513          	mv	a0,s0
    58c8:	00b12823          	sw	a1,16(sp)
    58cc:	694050ef          	jal	af60 <_wcrtomb_r>
    58d0:	fff00793          	li	a5,-1
    58d4:	01012583          	lw	a1,16(sp)
    58d8:	01812e03          	lw	t3,24(sp)
    58dc:	01c12883          	lw	a7,28(sp)
    58e0:	00050d13          	mv	s10,a0
    58e4:	00f51463          	bne	a0,a5,58ec <_vfiprintf_r+0x760>
    58e8:	0200106f          	j	6908 <_vfiprintf_r+0x177c>
    58ec:	fff54e93          	not	t4,a0
    58f0:	41fede93          	sra	t4,t4,0x1f
    58f4:	01d57eb3          	and	t4,a0,t4
    58f8:	040101a3          	sb	zero,67(sp)
    58fc:	000d8a93          	mv	s5,s11
    5900:	00058813          	mv	a6,a1
    5904:	a79ff06f          	j	537c <_vfiprintf_r+0x1f0>
    5908:	411008b3          	neg	a7,a7
    590c:	000cc683          	lbu	a3,0(s9)
    5910:	004ded93          	or	s11,s11,4
    5914:	9f9ff06f          	j	530c <_vfiprintf_r+0x180>
    5918:	010dee13          	or	t3,s11,16
    591c:	020e7793          	and	a5,t3,32
    5920:	0c0788e3          	beqz	a5,61f0 <_vfiprintf_r+0x1064>
    5924:	007a8a93          	add	s5,s5,7
    5928:	ff8afa93          	and	s5,s5,-8
    592c:	004aa683          	lw	a3,4(s5)
    5930:	000aad83          	lw	s11,0(s5)
    5934:	008a8a93          	add	s5,s5,8
    5938:	00068d13          	mv	s10,a3
    593c:	3006c263          	bltz	a3,5c40 <_vfiprintf_r+0xab4>
    5940:	32074063          	bltz	a4,5c60 <_vfiprintf_r+0xad4>
    5944:	01ade6b3          	or	a3,s11,s10
    5948:	f7fe7e13          	and	t3,t3,-129
    594c:	30069a63          	bnez	a3,5c60 <_vfiprintf_r+0xad4>
    5950:	68071ae3          	bnez	a4,67e4 <_vfiprintf_r+0x1658>
    5954:	04314783          	lbu	a5,67(sp)
    5958:	00012823          	sw	zero,16(sp)
    595c:	00000e93          	li	t4,0
    5960:	00000d13          	li	s10,0
    5964:	11010813          	add	a6,sp,272
    5968:	00078463          	beqz	a5,5970 <_vfiprintf_r+0x7e4>
    596c:	001e8e93          	add	t4,t4,1
    5970:	002e7f93          	and	t6,t3,2
    5974:	a00f8ae3          	beqz	t6,5388 <_vfiprintf_r+0x1fc>
    5978:	002e8e93          	add	t4,t4,2
    597c:	00200f93          	li	t6,2
    5980:	a09ff06f          	j	5388 <_vfiprintf_r+0x1fc>
    5984:	000cc683          	lbu	a3,0(s9)
    5988:	06800793          	li	a5,104
    598c:	4ef686e3          	beq	a3,a5,6678 <_vfiprintf_r+0x14ec>
    5990:	040ded93          	or	s11,s11,64
    5994:	979ff06f          	j	530c <_vfiprintf_r+0x180>
    5998:	010de613          	or	a2,s11,16
    599c:	02067793          	and	a5,a2,32
    59a0:	000780e3          	beqz	a5,61a0 <_vfiprintf_r+0x1014>
    59a4:	007a8a93          	add	s5,s5,7
    59a8:	ff8afa93          	and	s5,s5,-8
    59ac:	000aad83          	lw	s11,0(s5)
    59b0:	004aad03          	lw	s10,4(s5)
    59b4:	008a8a93          	add	s5,s5,8
    59b8:	040101a3          	sb	zero,67(sp)
    59bc:	00060e13          	mv	t3,a2
    59c0:	2a074063          	bltz	a4,5c60 <_vfiprintf_r+0xad4>
    59c4:	01ade6b3          	or	a3,s11,s10
    59c8:	f7f67e13          	and	t3,a2,-129
    59cc:	28069a63          	bnez	a3,5c60 <_vfiprintf_r+0xad4>
    59d0:	00100793          	li	a5,1
    59d4:	06071e63          	bnez	a4,5a50 <_vfiprintf_r+0x8c4>
    59d8:	f6079ee3          	bnez	a5,5954 <_vfiprintf_r+0x7c8>
    59dc:	00167d13          	and	s10,a2,1
    59e0:	0a0d0ce3          	beqz	s10,6298 <_vfiprintf_r+0x110c>
    59e4:	03000793          	li	a5,48
    59e8:	10f107a3          	sb	a5,271(sp)
    59ec:	000d0e93          	mv	t4,s10
    59f0:	10f10813          	add	a6,sp,271
    59f4:	2980006f          	j	5c8c <_vfiprintf_r+0xb00>
    59f8:	02b00793          	li	a5,43
    59fc:	000cc683          	lbu	a3,0(s9)
    5a00:	04f101a3          	sb	a5,67(sp)
    5a04:	909ff06f          	j	530c <_vfiprintf_r+0x180>
    5a08:	010de693          	or	a3,s11,16
    5a0c:	0206f793          	and	a5,a3,32
    5a10:	7a078c63          	beqz	a5,61c8 <_vfiprintf_r+0x103c>
    5a14:	007a8a93          	add	s5,s5,7
    5a18:	ff8afa93          	and	s5,s5,-8
    5a1c:	000aa783          	lw	a5,0(s5)
    5a20:	004aa583          	lw	a1,4(s5)
    5a24:	008a8a93          	add	s5,s5,8
    5a28:	040101a3          	sb	zero,67(sp)
    5a2c:	bff6fe13          	and	t3,a3,-1025
    5a30:	02074c63          	bltz	a4,5a68 <_vfiprintf_r+0x8dc>
    5a34:	00b7e633          	or	a2,a5,a1
    5a38:	b7f6f693          	and	a3,a3,-1153
    5a3c:	420610e3          	bnez	a2,665c <_vfiprintf_r+0x14d0>
    5a40:	000e0613          	mv	a2,t3
    5a44:	00000793          	li	a5,0
    5a48:	00068e13          	mv	t3,a3
    5a4c:	f80706e3          	beqz	a4,59d8 <_vfiprintf_r+0x84c>
    5a50:	00100693          	li	a3,1
    5a54:	58d788e3          	beq	a5,a3,67e4 <_vfiprintf_r+0x1658>
    5a58:	00200693          	li	a3,2
    5a5c:	46d786e3          	beq	a5,a3,66c8 <_vfiprintf_r+0x153c>
    5a60:	00000793          	li	a5,0
    5a64:	00000593          	li	a1,0
    5a68:	11010813          	add	a6,sp,272
    5a6c:	01d59613          	sll	a2,a1,0x1d
    5a70:	0077f693          	and	a3,a5,7
    5a74:	0037d793          	srl	a5,a5,0x3
    5a78:	03068693          	add	a3,a3,48
    5a7c:	00f667b3          	or	a5,a2,a5
    5a80:	0035d593          	srl	a1,a1,0x3
    5a84:	fed80fa3          	sb	a3,-1(a6)
    5a88:	00b7e633          	or	a2,a5,a1
    5a8c:	00080513          	mv	a0,a6
    5a90:	fff80813          	add	a6,a6,-1
    5a94:	fc061ce3          	bnez	a2,5a6c <_vfiprintf_r+0x8e0>
    5a98:	001e7793          	and	a5,t3,1
    5a9c:	54078e63          	beqz	a5,5ff8 <_vfiprintf_r+0xe6c>
    5aa0:	03000793          	li	a5,48
    5aa4:	54f68a63          	beq	a3,a5,5ff8 <_vfiprintf_r+0xe6c>
    5aa8:	ffe50513          	add	a0,a0,-2
    5aac:	fef80fa3          	sb	a5,-1(a6)
    5ab0:	11010793          	add	a5,sp,272
    5ab4:	40a78d33          	sub	s10,a5,a0
    5ab8:	00070e93          	mv	t4,a4
    5abc:	09a744e3          	blt	a4,s10,6344 <_vfiprintf_r+0x11b8>
    5ac0:	00050813          	mv	a6,a0
    5ac4:	1c80006f          	j	5c8c <_vfiprintf_r+0xb00>
    5ac8:	000086b7          	lui	a3,0x8
    5acc:	83068693          	add	a3,a3,-2000 # 7830 <__sclose+0x4>
    5ad0:	04d11223          	sh	a3,68(sp)
    5ad4:	0000a697          	auipc	a3,0xa
    5ad8:	a3868693          	add	a3,a3,-1480 # f50c <__fini_array_end+0x204>
    5adc:	000aa783          	lw	a5,0(s5)
    5ae0:	00000593          	li	a1,0
    5ae4:	002dee13          	or	t3,s11,2
    5ae8:	004a8a93          	add	s5,s5,4
    5aec:	00d12a23          	sw	a3,20(sp)
    5af0:	040101a3          	sb	zero,67(sp)
    5af4:	4c074863          	bltz	a4,5fc4 <_vfiprintf_r+0xe38>
    5af8:	00b7e6b3          	or	a3,a5,a1
    5afc:	f7fe7513          	and	a0,t3,-129
    5b00:	4a069c63          	bnez	a3,5fb8 <_vfiprintf_r+0xe2c>
    5b04:	000e0613          	mv	a2,t3
    5b08:	00200793          	li	a5,2
    5b0c:	00050e13          	mv	t3,a0
    5b10:	ec5ff06f          	j	59d4 <_vfiprintf_r+0x848>
    5b14:	00040513          	mv	a0,s0
    5b18:	00e12c23          	sw	a4,24(sp)
    5b1c:	01112823          	sw	a7,16(sp)
    5b20:	390020ef          	jal	7eb0 <_localeconv_r>
    5b24:	00452783          	lw	a5,4(a0)
    5b28:	00078513          	mv	a0,a5
    5b2c:	02f12a23          	sw	a5,52(sp)
    5b30:	ab5fb0ef          	jal	15e4 <strlen>
    5b34:	00050793          	mv	a5,a0
    5b38:	00040513          	mv	a0,s0
    5b3c:	02f12823          	sw	a5,48(sp)
    5b40:	370020ef          	jal	7eb0 <_localeconv_r>
    5b44:	00852703          	lw	a4,8(a0)
    5b48:	03012783          	lw	a5,48(sp)
    5b4c:	01012883          	lw	a7,16(sp)
    5b50:	02e12623          	sw	a4,44(sp)
    5b54:	01812703          	lw	a4,24(sp)
    5b58:	a2078ee3          	beqz	a5,5594 <_vfiprintf_r+0x408>
    5b5c:	02c12783          	lw	a5,44(sp)
    5b60:	000cc683          	lbu	a3,0(s9)
    5b64:	fa078463          	beqz	a5,530c <_vfiprintf_r+0x180>
    5b68:	0007c783          	lbu	a5,0(a5)
    5b6c:	fa078063          	beqz	a5,530c <_vfiprintf_r+0x180>
    5b70:	400ded93          	or	s11,s11,1024
    5b74:	f98ff06f          	j	530c <_vfiprintf_r+0x180>
    5b78:	020df793          	and	a5,s11,32
    5b7c:	78079263          	bnez	a5,6300 <_vfiprintf_r+0x1174>
    5b80:	010df793          	and	a5,s11,16
    5b84:	30079ae3          	bnez	a5,6698 <_vfiprintf_r+0x150c>
    5b88:	040df793          	and	a5,s11,64
    5b8c:	400796e3          	bnez	a5,6798 <_vfiprintf_r+0x160c>
    5b90:	200dfe13          	and	t3,s11,512
    5b94:	300e02e3          	beqz	t3,6698 <_vfiprintf_r+0x150c>
    5b98:	000aa783          	lw	a5,0(s5)
    5b9c:	00c12703          	lw	a4,12(sp)
    5ba0:	004a8a93          	add	s5,s5,4
    5ba4:	00e78023          	sb	a4,0(a5)
    5ba8:	efcff06f          	j	52a4 <_vfiprintf_r+0x118>
    5bac:	000cc683          	lbu	a3,0(s9)
    5bb0:	06c00793          	li	a5,108
    5bb4:	2cf68ae3          	beq	a3,a5,6688 <_vfiprintf_r+0x14fc>
    5bb8:	010ded93          	or	s11,s11,16
    5bbc:	f50ff06f          	j	530c <_vfiprintf_r+0x180>
    5bc0:	000cc683          	lbu	a3,0(s9)
    5bc4:	080ded93          	or	s11,s11,128
    5bc8:	f44ff06f          	j	530c <_vfiprintf_r+0x180>
    5bcc:	000cc683          	lbu	a3,0(s9)
    5bd0:	02a00793          	li	a5,42
    5bd4:	001c8593          	add	a1,s9,1
    5bd8:	54f680e3          	beq	a3,a5,6918 <_vfiprintf_r+0x178c>
    5bdc:	fd068793          	add	a5,a3,-48
    5be0:	00900613          	li	a2,9
    5be4:	00000713          	li	a4,0
    5be8:	00900513          	li	a0,9
    5bec:	02f66463          	bltu	a2,a5,5c14 <_vfiprintf_r+0xa88>
    5bf0:	0005c683          	lbu	a3,0(a1)
    5bf4:	00271613          	sll	a2,a4,0x2
    5bf8:	00e60733          	add	a4,a2,a4
    5bfc:	00171713          	sll	a4,a4,0x1
    5c00:	00f70733          	add	a4,a4,a5
    5c04:	fd068793          	add	a5,a3,-48
    5c08:	00158593          	add	a1,a1,1
    5c0c:	fef572e3          	bgeu	a0,a5,5bf0 <_vfiprintf_r+0xa64>
    5c10:	74074063          	bltz	a4,6350 <_vfiprintf_r+0x11c4>
    5c14:	00058c93          	mv	s9,a1
    5c18:	ef8ff06f          	j	5310 <_vfiprintf_r+0x184>
    5c1c:	000cc683          	lbu	a3,0(s9)
    5c20:	001ded93          	or	s11,s11,1
    5c24:	ee8ff06f          	j	530c <_vfiprintf_r+0x180>
    5c28:	04314783          	lbu	a5,67(sp)
    5c2c:	000cc683          	lbu	a3,0(s9)
    5c30:	ec079e63          	bnez	a5,530c <_vfiprintf_r+0x180>
    5c34:	02000793          	li	a5,32
    5c38:	04f101a3          	sb	a5,67(sp)
    5c3c:	ed0ff06f          	j	530c <_vfiprintf_r+0x180>
    5c40:	02d00613          	li	a2,45
    5c44:	01b036b3          	snez	a3,s11
    5c48:	41a000b3          	neg	ra,s10
    5c4c:	04c101a3          	sb	a2,67(sp)
    5c50:	40d08d33          	sub	s10,ra,a3
    5c54:	41b00db3          	neg	s11,s11
    5c58:	00074463          	bltz	a4,5c60 <_vfiprintf_r+0xad4>
    5c5c:	f7fe7e13          	and	t3,t3,-129
    5c60:	120d14e3          	bnez	s10,6588 <_vfiprintf_r+0x13fc>
    5c64:	00900693          	li	a3,9
    5c68:	13b6e0e3          	bltu	a3,s11,6588 <_vfiprintf_r+0x13fc>
    5c6c:	030d8793          	add	a5,s11,48
    5c70:	0ff7f793          	zext.b	a5,a5
    5c74:	10f107a3          	sb	a5,271(sp)
    5c78:	00070e93          	mv	t4,a4
    5c7c:	00e04463          	bgtz	a4,5c84 <_vfiprintf_r+0xaf8>
    5c80:	00100e93          	li	t4,1
    5c84:	00100d13          	li	s10,1
    5c88:	10f10813          	add	a6,sp,271
    5c8c:	04314783          	lbu	a5,67(sp)
    5c90:	00012823          	sw	zero,16(sp)
    5c94:	cc079ce3          	bnez	a5,596c <_vfiprintf_r+0x7e0>
    5c98:	cd9ff06f          	j	5970 <_vfiprintf_r+0x7e4>
    5c9c:	00100713          	li	a4,1
    5ca0:	000d0793          	mv	a5,s10
    5ca4:	07012623          	sw	a6,108(sp)
    5ca8:	07a12823          	sw	s10,112(sp)
    5cac:	07a12423          	sw	s10,104(sp)
    5cb0:	06e12223          	sw	a4,100(sp)
    5cb4:	000a0c13          	mv	s8,s4
    5cb8:	008c0c13          	add	s8,s8,8
    5cbc:	809ff06f          	j	54c4 <_vfiprintf_r+0x338>
    5cc0:	00100613          	li	a2,1
    5cc4:	00000693          	li	a3,0
    5cc8:	000a0593          	mv	a1,s4
    5ccc:	a65ff06f          	j	5730 <_vfiprintf_r+0x5a4>
    5cd0:	41d88db3          	sub	s11,a7,t4
    5cd4:	f9b05a63          	blez	s11,5468 <_vfiprintf_r+0x2dc>
    5cd8:	01000593          	li	a1,16
    5cdc:	3bb5dae3          	bge	a1,s11,6890 <_vfiprintf_r+0x1704>
    5ce0:	0000af97          	auipc	t6,0xa
    5ce4:	ea0f8f93          	add	t6,t6,-352 # fb80 <zeroes.0>
    5ce8:	02e12223          	sw	a4,36(sp)
    5cec:	000a8713          	mv	a4,s5
    5cf0:	000c0693          	mv	a3,s8
    5cf4:	000d8a93          	mv	s5,s11
    5cf8:	01000f13          	li	t5,16
    5cfc:	00700293          	li	t0,7
    5d00:	01c12c23          	sw	t3,24(sp)
    5d04:	01012e23          	sw	a6,28(sp)
    5d08:	03112023          	sw	a7,32(sp)
    5d0c:	03d12423          	sw	t4,40(sp)
    5d10:	000f8c13          	mv	s8,t6
    5d14:	00070d93          	mv	s11,a4
    5d18:	0180006f          	j	5d30 <_vfiprintf_r+0xba4>
    5d1c:	00260513          	add	a0,a2,2
    5d20:	00868693          	add	a3,a3,8
    5d24:	00070613          	mv	a2,a4
    5d28:	ff0a8a93          	add	s5,s5,-16
    5d2c:	055f5c63          	bge	t5,s5,5d84 <_vfiprintf_r+0xbf8>
    5d30:	01078793          	add	a5,a5,16
    5d34:	00160713          	add	a4,a2,1
    5d38:	0186a023          	sw	s8,0(a3)
    5d3c:	01e6a223          	sw	t5,4(a3)
    5d40:	06f12423          	sw	a5,104(sp)
    5d44:	06e12223          	sw	a4,100(sp)
    5d48:	fce2dae3          	bge	t0,a4,5d1c <_vfiprintf_r+0xb90>
    5d4c:	1c078663          	beqz	a5,5f18 <_vfiprintf_r+0xd8c>
    5d50:	06010613          	add	a2,sp,96
    5d54:	00098593          	mv	a1,s3
    5d58:	00040513          	mv	a0,s0
    5d5c:	af4ff0ef          	jal	5050 <__sprint_r.part.0>
    5d60:	8e051ee3          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    5d64:	06412603          	lw	a2,100(sp)
    5d68:	01000f13          	li	t5,16
    5d6c:	ff0a8a93          	add	s5,s5,-16
    5d70:	06812783          	lw	a5,104(sp)
    5d74:	000a0693          	mv	a3,s4
    5d78:	00160513          	add	a0,a2,1
    5d7c:	00700293          	li	t0,7
    5d80:	fb5f48e3          	blt	t5,s5,5d30 <_vfiprintf_r+0xba4>
    5d84:	01812e03          	lw	t3,24(sp)
    5d88:	01c12803          	lw	a6,28(sp)
    5d8c:	02012883          	lw	a7,32(sp)
    5d90:	02412703          	lw	a4,36(sp)
    5d94:	02812e83          	lw	t4,40(sp)
    5d98:	000d8613          	mv	a2,s11
    5d9c:	000c0f93          	mv	t6,s8
    5da0:	000a8d93          	mv	s11,s5
    5da4:	00068c13          	mv	s8,a3
    5da8:	00060a93          	mv	s5,a2
    5dac:	01b787b3          	add	a5,a5,s11
    5db0:	01fc2023          	sw	t6,0(s8)
    5db4:	01bc2223          	sw	s11,4(s8)
    5db8:	06f12423          	sw	a5,104(sp)
    5dbc:	06a12223          	sw	a0,100(sp)
    5dc0:	00700613          	li	a2,7
    5dc4:	4ea65863          	bge	a2,a0,62b4 <_vfiprintf_r+0x1128>
    5dc8:	1a0786e3          	beqz	a5,6774 <_vfiprintf_r+0x15e8>
    5dcc:	06010613          	add	a2,sp,96
    5dd0:	00098593          	mv	a1,s3
    5dd4:	00040513          	mv	a0,s0
    5dd8:	03d12423          	sw	t4,40(sp)
    5ddc:	02e12223          	sw	a4,36(sp)
    5de0:	03112023          	sw	a7,32(sp)
    5de4:	01012e23          	sw	a6,28(sp)
    5de8:	01c12c23          	sw	t3,24(sp)
    5dec:	a64ff0ef          	jal	5050 <__sprint_r.part.0>
    5df0:	860516e3          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    5df4:	02412703          	lw	a4,36(sp)
    5df8:	06412603          	lw	a2,100(sp)
    5dfc:	06812783          	lw	a5,104(sp)
    5e00:	41a70733          	sub	a4,a4,s10
    5e04:	02812e83          	lw	t4,40(sp)
    5e08:	02012883          	lw	a7,32(sp)
    5e0c:	01c12803          	lw	a6,28(sp)
    5e10:	01812e03          	lw	t3,24(sp)
    5e14:	000a0c13          	mv	s8,s4
    5e18:	00160f13          	add	t5,a2,1
    5e1c:	e4e05a63          	blez	a4,5470 <_vfiprintf_r+0x2e4>
    5e20:	01000593          	li	a1,16
    5e24:	0000af97          	auipc	t6,0xa
    5e28:	d5cf8f93          	add	t6,t6,-676 # fb80 <zeroes.0>
    5e2c:	0ae5da63          	bge	a1,a4,5ee0 <_vfiprintf_r+0xd54>
    5e30:	000c0593          	mv	a1,s8
    5e34:	03512423          	sw	s5,40(sp)
    5e38:	01000d93          	li	s11,16
    5e3c:	00700293          	li	t0,7
    5e40:	01c12c23          	sw	t3,24(sp)
    5e44:	01012e23          	sw	a6,28(sp)
    5e48:	03112023          	sw	a7,32(sp)
    5e4c:	03d12223          	sw	t4,36(sp)
    5e50:	00070a93          	mv	s5,a4
    5e54:	000b0c13          	mv	s8,s6
    5e58:	0180006f          	j	5e70 <_vfiprintf_r+0xce4>
    5e5c:	00260f13          	add	t5,a2,2
    5e60:	00858593          	add	a1,a1,8
    5e64:	00068613          	mv	a2,a3
    5e68:	ff0a8a93          	add	s5,s5,-16
    5e6c:	055dda63          	bge	s11,s5,5ec0 <_vfiprintf_r+0xd34>
    5e70:	01078793          	add	a5,a5,16
    5e74:	00160693          	add	a3,a2,1
    5e78:	0165a023          	sw	s6,0(a1)
    5e7c:	01b5a223          	sw	s11,4(a1)
    5e80:	06f12423          	sw	a5,104(sp)
    5e84:	06d12223          	sw	a3,100(sp)
    5e88:	fcd2dae3          	bge	t0,a3,5e5c <_vfiprintf_r+0xcd0>
    5e8c:	06078e63          	beqz	a5,5f08 <_vfiprintf_r+0xd7c>
    5e90:	06010613          	add	a2,sp,96
    5e94:	00098593          	mv	a1,s3
    5e98:	00040513          	mv	a0,s0
    5e9c:	9b4ff0ef          	jal	5050 <__sprint_r.part.0>
    5ea0:	fa051e63          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    5ea4:	06412603          	lw	a2,100(sp)
    5ea8:	ff0a8a93          	add	s5,s5,-16
    5eac:	06812783          	lw	a5,104(sp)
    5eb0:	000a0593          	mv	a1,s4
    5eb4:	00160f13          	add	t5,a2,1
    5eb8:	00700293          	li	t0,7
    5ebc:	fb5dcae3          	blt	s11,s5,5e70 <_vfiprintf_r+0xce4>
    5ec0:	000a8713          	mv	a4,s5
    5ec4:	01812e03          	lw	t3,24(sp)
    5ec8:	01c12803          	lw	a6,28(sp)
    5ecc:	02012883          	lw	a7,32(sp)
    5ed0:	02412e83          	lw	t4,36(sp)
    5ed4:	02812a83          	lw	s5,40(sp)
    5ed8:	000c0f93          	mv	t6,s8
    5edc:	00058c13          	mv	s8,a1
    5ee0:	00e787b3          	add	a5,a5,a4
    5ee4:	00ec2223          	sw	a4,4(s8)
    5ee8:	01fc2023          	sw	t6,0(s8)
    5eec:	06f12423          	sw	a5,104(sp)
    5ef0:	07e12223          	sw	t5,100(sp)
    5ef4:	00700713          	li	a4,7
    5ef8:	25e74863          	blt	a4,t5,6148 <_vfiprintf_r+0xfbc>
    5efc:	008c0c13          	add	s8,s8,8
    5f00:	001f0f13          	add	t5,t5,1
    5f04:	d6cff06f          	j	5470 <_vfiprintf_r+0x2e4>
    5f08:	00100f13          	li	t5,1
    5f0c:	00000613          	li	a2,0
    5f10:	000a0593          	mv	a1,s4
    5f14:	f55ff06f          	j	5e68 <_vfiprintf_r+0xcdc>
    5f18:	00100513          	li	a0,1
    5f1c:	00000613          	li	a2,0
    5f20:	000a0693          	mv	a3,s4
    5f24:	e05ff06f          	j	5d28 <_vfiprintf_r+0xb9c>
    5f28:	06078263          	beqz	a5,5f8c <_vfiprintf_r+0xe00>
    5f2c:	06010613          	add	a2,sp,96
    5f30:	00098593          	mv	a1,s3
    5f34:	00040513          	mv	a0,s0
    5f38:	03d12e23          	sw	t4,60(sp)
    5f3c:	02e12c23          	sw	a4,56(sp)
    5f40:	03112423          	sw	a7,40(sp)
    5f44:	03012223          	sw	a6,36(sp)
    5f48:	02512023          	sw	t0,32(sp)
    5f4c:	01f12e23          	sw	t6,28(sp)
    5f50:	01c12c23          	sw	t3,24(sp)
    5f54:	8fcff0ef          	jal	5050 <__sprint_r.part.0>
    5f58:	f0051263          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    5f5c:	06412603          	lw	a2,100(sp)
    5f60:	06812783          	lw	a5,104(sp)
    5f64:	03c12e83          	lw	t4,60(sp)
    5f68:	03812703          	lw	a4,56(sp)
    5f6c:	02812883          	lw	a7,40(sp)
    5f70:	02412803          	lw	a6,36(sp)
    5f74:	02012283          	lw	t0,32(sp)
    5f78:	01c12f83          	lw	t6,28(sp)
    5f7c:	01812e03          	lw	t3,24(sp)
    5f80:	000a0c13          	mv	s8,s4
    5f84:	00160f13          	add	t5,a2,1
    5f88:	c58ff06f          	j	53e0 <_vfiprintf_r+0x254>
    5f8c:	380f8863          	beqz	t6,631c <_vfiprintf_r+0x1190>
    5f90:	04410793          	add	a5,sp,68
    5f94:	06f12623          	sw	a5,108(sp)
    5f98:	00200793          	li	a5,2
    5f9c:	06f12823          	sw	a5,112(sp)
    5fa0:	00100f13          	li	t5,1
    5fa4:	000a0c13          	mv	s8,s4
    5fa8:	000f0613          	mv	a2,t5
    5fac:	008c0c13          	add	s8,s8,8
    5fb0:	001f0f13          	add	t5,t5,1
    5fb4:	cacff06f          	j	5460 <_vfiprintf_r+0x2d4>
    5fb8:	00200693          	li	a3,2
    5fbc:	00050e13          	mv	t3,a0
    5fc0:	aa0684e3          	beqz	a3,5a68 <_vfiprintf_r+0x8dc>
    5fc4:	01412503          	lw	a0,20(sp)
    5fc8:	11010813          	add	a6,sp,272
    5fcc:	00f7f693          	and	a3,a5,15
    5fd0:	00d506b3          	add	a3,a0,a3
    5fd4:	0006c603          	lbu	a2,0(a3)
    5fd8:	0047d793          	srl	a5,a5,0x4
    5fdc:	01c59693          	sll	a3,a1,0x1c
    5fe0:	00f6e7b3          	or	a5,a3,a5
    5fe4:	0045d593          	srl	a1,a1,0x4
    5fe8:	fec80fa3          	sb	a2,-1(a6)
    5fec:	00b7e6b3          	or	a3,a5,a1
    5ff0:	fff80813          	add	a6,a6,-1
    5ff4:	fc069ce3          	bnez	a3,5fcc <_vfiprintf_r+0xe40>
    5ff8:	11010793          	add	a5,sp,272
    5ffc:	41078d33          	sub	s10,a5,a6
    6000:	00070e93          	mv	t4,a4
    6004:	c9a754e3          	bge	a4,s10,5c8c <_vfiprintf_r+0xb00>
    6008:	000d0e93          	mv	t4,s10
    600c:	c81ff06f          	j	5c8c <_vfiprintf_r+0xb00>
    6010:	01000513          	li	a0,16
    6014:	01b554e3          	bge	a0,s11,681c <_vfiprintf_r+0x1690>
    6018:	000a8693          	mv	a3,s5
    601c:	0000a317          	auipc	t1,0xa
    6020:	b7430313          	add	t1,t1,-1164 # fb90 <blanks.1>
    6024:	02e12c23          	sw	a4,56(sp)
    6028:	000d8a93          	mv	s5,s11
    602c:	000c0713          	mv	a4,s8
    6030:	01000f13          	li	t5,16
    6034:	00700393          	li	t2,7
    6038:	01c12c23          	sw	t3,24(sp)
    603c:	01f12e23          	sw	t6,28(sp)
    6040:	02512023          	sw	t0,32(sp)
    6044:	03012223          	sw	a6,36(sp)
    6048:	03112423          	sw	a7,40(sp)
    604c:	03d12e23          	sw	t4,60(sp)
    6050:	00030c13          	mv	s8,t1
    6054:	00068d93          	mv	s11,a3
    6058:	01c0006f          	j	6074 <_vfiprintf_r+0xee8>
    605c:	00260513          	add	a0,a2,2
    6060:	00870713          	add	a4,a4,8
    6064:	00058613          	mv	a2,a1
    6068:	ff0a8a93          	add	s5,s5,-16
    606c:	055f5c63          	bge	t5,s5,60c4 <_vfiprintf_r+0xf38>
    6070:	00160593          	add	a1,a2,1
    6074:	01078793          	add	a5,a5,16
    6078:	01872023          	sw	s8,0(a4)
    607c:	01e72223          	sw	t5,4(a4)
    6080:	06f12423          	sw	a5,104(sp)
    6084:	06b12223          	sw	a1,100(sp)
    6088:	fcb3dae3          	bge	t2,a1,605c <_vfiprintf_r+0xed0>
    608c:	08078a63          	beqz	a5,6120 <_vfiprintf_r+0xf94>
    6090:	06010613          	add	a2,sp,96
    6094:	00098593          	mv	a1,s3
    6098:	00040513          	mv	a0,s0
    609c:	fb5fe0ef          	jal	5050 <__sprint_r.part.0>
    60a0:	da051e63          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    60a4:	06412603          	lw	a2,100(sp)
    60a8:	01000f13          	li	t5,16
    60ac:	ff0a8a93          	add	s5,s5,-16
    60b0:	06812783          	lw	a5,104(sp)
    60b4:	000a0713          	mv	a4,s4
    60b8:	00160513          	add	a0,a2,1
    60bc:	00700393          	li	t2,7
    60c0:	fb5f48e3          	blt	t5,s5,6070 <_vfiprintf_r+0xee4>
    60c4:	000c0313          	mv	t1,s8
    60c8:	01812e03          	lw	t3,24(sp)
    60cc:	00070c13          	mv	s8,a4
    60d0:	01c12f83          	lw	t6,28(sp)
    60d4:	02012283          	lw	t0,32(sp)
    60d8:	02412803          	lw	a6,36(sp)
    60dc:	02812883          	lw	a7,40(sp)
    60e0:	03c12e83          	lw	t4,60(sp)
    60e4:	03812703          	lw	a4,56(sp)
    60e8:	000d8693          	mv	a3,s11
    60ec:	000a8d93          	mv	s11,s5
    60f0:	00068a93          	mv	s5,a3
    60f4:	01b787b3          	add	a5,a5,s11
    60f8:	006c2023          	sw	t1,0(s8)
    60fc:	01bc2223          	sw	s11,4(s8)
    6100:	06f12423          	sw	a5,104(sp)
    6104:	06a12223          	sw	a0,100(sp)
    6108:	00700613          	li	a2,7
    610c:	12a64063          	blt	a2,a0,622c <_vfiprintf_r+0x10a0>
    6110:	008c0c13          	add	s8,s8,8
    6114:	00150f13          	add	t5,a0,1
    6118:	00050613          	mv	a2,a0
    611c:	a8cff06f          	j	53a8 <_vfiprintf_r+0x21c>
    6120:	00000613          	li	a2,0
    6124:	00100513          	li	a0,1
    6128:	000a0713          	mv	a4,s4
    612c:	f3dff06f          	j	6068 <_vfiprintf_r+0xedc>
    6130:	01d8d463          	bge	a7,t4,6138 <_vfiprintf_r+0xfac>
    6134:	000e8893          	mv	a7,t4
    6138:	00c12783          	lw	a5,12(sp)
    613c:	011787b3          	add	a5,a5,a7
    6140:	00f12623          	sw	a5,12(sp)
    6144:	ba8ff06f          	j	54ec <_vfiprintf_r+0x360>
    6148:	b4078ae3          	beqz	a5,5c9c <_vfiprintf_r+0xb10>
    614c:	06010613          	add	a2,sp,96
    6150:	00098593          	mv	a1,s3
    6154:	00040513          	mv	a0,s0
    6158:	03d12223          	sw	t4,36(sp)
    615c:	03112023          	sw	a7,32(sp)
    6160:	01012e23          	sw	a6,28(sp)
    6164:	01c12c23          	sw	t3,24(sp)
    6168:	ee9fe0ef          	jal	5050 <__sprint_r.part.0>
    616c:	ce051863          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    6170:	06412f03          	lw	t5,100(sp)
    6174:	06812783          	lw	a5,104(sp)
    6178:	02412e83          	lw	t4,36(sp)
    617c:	02012883          	lw	a7,32(sp)
    6180:	01c12803          	lw	a6,28(sp)
    6184:	01812e03          	lw	t3,24(sp)
    6188:	000a0c13          	mv	s8,s4
    618c:	001f0f13          	add	t5,t5,1
    6190:	ae0ff06f          	j	5470 <_vfiprintf_r+0x2e4>
    6194:	06012223          	sw	zero,100(sp)
    6198:	000a0c13          	mv	s8,s4
    619c:	c84ff06f          	j	5620 <_vfiprintf_r+0x494>
    61a0:	01067693          	and	a3,a2,16
    61a4:	000aa783          	lw	a5,0(s5)
    61a8:	004a8a93          	add	s5,s5,4
    61ac:	12069c63          	bnez	a3,62e4 <_vfiprintf_r+0x1158>
    61b0:	04067693          	and	a3,a2,64
    61b4:	12068463          	beqz	a3,62dc <_vfiprintf_r+0x1150>
    61b8:	01079d93          	sll	s11,a5,0x10
    61bc:	010ddd93          	srl	s11,s11,0x10
    61c0:	00000d13          	li	s10,0
    61c4:	ff4ff06f          	j	59b8 <_vfiprintf_r+0x82c>
    61c8:	0106f613          	and	a2,a3,16
    61cc:	000aa783          	lw	a5,0(s5)
    61d0:	004a8a93          	add	s5,s5,4
    61d4:	12061263          	bnez	a2,62f8 <_vfiprintf_r+0x116c>
    61d8:	0406f613          	and	a2,a3,64
    61dc:	10060a63          	beqz	a2,62f0 <_vfiprintf_r+0x1164>
    61e0:	01079793          	sll	a5,a5,0x10
    61e4:	0107d793          	srl	a5,a5,0x10
    61e8:	00000593          	li	a1,0
    61ec:	83dff06f          	j	5a28 <_vfiprintf_r+0x89c>
    61f0:	010e7693          	and	a3,t3,16
    61f4:	000aa783          	lw	a5,0(s5)
    61f8:	004a8a93          	add	s5,s5,4
    61fc:	0c069863          	bnez	a3,62cc <_vfiprintf_r+0x1140>
    6200:	040e7693          	and	a3,t3,64
    6204:	0c068063          	beqz	a3,62c4 <_vfiprintf_r+0x1138>
    6208:	01079d93          	sll	s11,a5,0x10
    620c:	410ddd93          	sra	s11,s11,0x10
    6210:	41fddd13          	sra	s10,s11,0x1f
    6214:	000d0693          	mv	a3,s10
    6218:	f24ff06f          	j	593c <_vfiprintf_r+0x7b0>
    621c:	00100f13          	li	t5,1
    6220:	00000613          	li	a2,0
    6224:	000a0c13          	mv	s8,s4
    6228:	a38ff06f          	j	5460 <_vfiprintf_r+0x2d4>
    622c:	1a078463          	beqz	a5,63d4 <_vfiprintf_r+0x1248>
    6230:	06010613          	add	a2,sp,96
    6234:	00098593          	mv	a1,s3
    6238:	00040513          	mv	a0,s0
    623c:	03d12e23          	sw	t4,60(sp)
    6240:	02e12c23          	sw	a4,56(sp)
    6244:	03112423          	sw	a7,40(sp)
    6248:	03012223          	sw	a6,36(sp)
    624c:	02512023          	sw	t0,32(sp)
    6250:	01f12e23          	sw	t6,28(sp)
    6254:	01c12c23          	sw	t3,24(sp)
    6258:	df9fe0ef          	jal	5050 <__sprint_r.part.0>
    625c:	c0051063          	bnez	a0,565c <_vfiprintf_r+0x4d0>
    6260:	06412603          	lw	a2,100(sp)
    6264:	06812783          	lw	a5,104(sp)
    6268:	03c12e83          	lw	t4,60(sp)
    626c:	03812703          	lw	a4,56(sp)
    6270:	02812883          	lw	a7,40(sp)
    6274:	02412803          	lw	a6,36(sp)
    6278:	02012283          	lw	t0,32(sp)
    627c:	01c12f83          	lw	t6,28(sp)
    6280:	01812e03          	lw	t3,24(sp)
    6284:	000a0c13          	mv	s8,s4
    6288:	00160f13          	add	t5,a2,1
    628c:	91cff06f          	j	53a8 <_vfiprintf_r+0x21c>
    6290:	000d8e13          	mv	t3,s11
    6294:	e88ff06f          	j	591c <_vfiprintf_r+0x790>
    6298:	00000e93          	li	t4,0
    629c:	11010813          	add	a6,sp,272
    62a0:	9edff06f          	j	5c8c <_vfiprintf_r+0xb00>
    62a4:	0589a503          	lw	a0,88(s3)
    62a8:	8b4fb0ef          	jal	135c <__retarget_lock_acquire_recursive>
    62ac:	00c99783          	lh	a5,12(s3)
    62b0:	f41fe06f          	j	51f0 <_vfiprintf_r+0x64>
    62b4:	008c0c13          	add	s8,s8,8
    62b8:	00150f13          	add	t5,a0,1
    62bc:	00050613          	mv	a2,a0
    62c0:	9a8ff06f          	j	5468 <_vfiprintf_r+0x2dc>
    62c4:	200e7693          	and	a3,t3,512
    62c8:	50069463          	bnez	a3,67d0 <_vfiprintf_r+0x1644>
    62cc:	41f7dd13          	sra	s10,a5,0x1f
    62d0:	00078d93          	mv	s11,a5
    62d4:	000d0693          	mv	a3,s10
    62d8:	e64ff06f          	j	593c <_vfiprintf_r+0x7b0>
    62dc:	20067693          	and	a3,a2,512
    62e0:	4c069663          	bnez	a3,67ac <_vfiprintf_r+0x1620>
    62e4:	00078d93          	mv	s11,a5
    62e8:	00000d13          	li	s10,0
    62ec:	eccff06f          	j	59b8 <_vfiprintf_r+0x82c>
    62f0:	2006f613          	and	a2,a3,512
    62f4:	4c061863          	bnez	a2,67c4 <_vfiprintf_r+0x1638>
    62f8:	00000593          	li	a1,0
    62fc:	f2cff06f          	j	5a28 <_vfiprintf_r+0x89c>
    6300:	00c12683          	lw	a3,12(sp)
    6304:	000aa783          	lw	a5,0(s5)
    6308:	004a8a93          	add	s5,s5,4
    630c:	41f6d713          	sra	a4,a3,0x1f
    6310:	00d7a023          	sw	a3,0(a5)
    6314:	00e7a223          	sw	a4,4(a5)
    6318:	f8dfe06f          	j	52a4 <_vfiprintf_r+0x118>
    631c:	00000613          	li	a2,0
    6320:	00100f13          	li	t5,1
    6324:	000a0c13          	mv	s8,s4
    6328:	938ff06f          	j	5460 <_vfiprintf_r+0x2d4>
    632c:	000aa783          	lw	a5,0(s5)
    6330:	00100e93          	li	t4,1
    6334:	00100d13          	li	s10,1
    6338:	0af10623          	sb	a5,172(sp)
    633c:	0ac10593          	add	a1,sp,172
    6340:	db8ff06f          	j	58f8 <_vfiprintf_r+0x76c>
    6344:	000d0e93          	mv	t4,s10
    6348:	00050813          	mv	a6,a0
    634c:	941ff06f          	j	5c8c <_vfiprintf_r+0xb00>
    6350:	fff00713          	li	a4,-1
    6354:	00058c93          	mv	s9,a1
    6358:	fb9fe06f          	j	5310 <_vfiprintf_r+0x184>
    635c:	000d8613          	mv	a2,s11
    6360:	e3cff06f          	j	599c <_vfiprintf_r+0x810>
    6364:	00009797          	auipc	a5,0x9
    6368:	1bc78793          	add	a5,a5,444 # f520 <__fini_array_end+0x218>
    636c:	000d8e13          	mv	t3,s11
    6370:	00f12a23          	sw	a5,20(sp)
    6374:	020e7793          	and	a5,t3,32
    6378:	1c078c63          	beqz	a5,6550 <_vfiprintf_r+0x13c4>
    637c:	007a8a93          	add	s5,s5,7
    6380:	ff8afa93          	and	s5,s5,-8
    6384:	000aa783          	lw	a5,0(s5)
    6388:	004aa583          	lw	a1,4(s5)
    638c:	008a8a93          	add	s5,s5,8
    6390:	001e7613          	and	a2,t3,1
    6394:	00060e63          	beqz	a2,63b0 <_vfiprintf_r+0x1224>
    6398:	00b7e633          	or	a2,a5,a1
    639c:	00060a63          	beqz	a2,63b0 <_vfiprintf_r+0x1224>
    63a0:	03000613          	li	a2,48
    63a4:	04c10223          	sb	a2,68(sp)
    63a8:	04d102a3          	sb	a3,69(sp)
    63ac:	002e6e13          	or	t3,t3,2
    63b0:	bffe7e13          	and	t3,t3,-1025
    63b4:	f3cff06f          	j	5af0 <_vfiprintf_r+0x964>
    63b8:	000d8693          	mv	a3,s11
    63bc:	e50ff06f          	j	5a0c <_vfiprintf_r+0x880>
    63c0:	00009797          	auipc	a5,0x9
    63c4:	14c78793          	add	a5,a5,332 # f50c <__fini_array_end+0x204>
    63c8:	000d8e13          	mv	t3,s11
    63cc:	00f12a23          	sw	a5,20(sp)
    63d0:	fa5ff06f          	j	6374 <_vfiprintf_r+0x11e8>
    63d4:	04314603          	lbu	a2,67(sp)
    63d8:	3a060a63          	beqz	a2,678c <_vfiprintf_r+0x1600>
    63dc:	04310793          	add	a5,sp,67
    63e0:	06f12623          	sw	a5,108(sp)
    63e4:	00100793          	li	a5,1
    63e8:	06f12823          	sw	a5,112(sp)
    63ec:	00100f13          	li	t5,1
    63f0:	000a0c13          	mv	s8,s4
    63f4:	fe1fe06f          	j	53d4 <_vfiprintf_r+0x248>
    63f8:	00800613          	li	a2,8
    63fc:	00000593          	li	a1,0
    6400:	05810513          	add	a0,sp,88
    6404:	02e12023          	sw	a4,32(sp)
    6408:	01112e23          	sw	a7,28(sp)
    640c:	01c12c23          	sw	t3,24(sp)
    6410:	05012623          	sw	a6,76(sp)
    6414:	01012823          	sw	a6,16(sp)
    6418:	f4dfa0ef          	jal	1364 <memset>
    641c:	02012703          	lw	a4,32(sp)
    6420:	01012803          	lw	a6,16(sp)
    6424:	01812e03          	lw	t3,24(sp)
    6428:	01c12883          	lw	a7,28(sp)
    642c:	2a074463          	bltz	a4,66d4 <_vfiprintf_r+0x1548>
    6430:	00000d93          	li	s11,0
    6434:	00000d13          	li	s10,0
    6438:	01812823          	sw	s8,16(sp)
    643c:	01012e23          	sw	a6,28(sp)
    6440:	000d8c13          	mv	s8,s11
    6444:	03112023          	sw	a7,32(sp)
    6448:	000c8d93          	mv	s11,s9
    644c:	000a8c93          	mv	s9,s5
    6450:	000d0a93          	mv	s5,s10
    6454:	00098d13          	mv	s10,s3
    6458:	00070993          	mv	s3,a4
    645c:	0300006f          	j	648c <_vfiprintf_r+0x1300>
    6460:	05810693          	add	a3,sp,88
    6464:	0ac10593          	add	a1,sp,172
    6468:	00040513          	mv	a0,s0
    646c:	2f5040ef          	jal	af60 <_wcrtomb_r>
    6470:	fff00793          	li	a5,-1
    6474:	48f50063          	beq	a0,a5,68f4 <_vfiprintf_r+0x1768>
    6478:	00aa87b3          	add	a5,s5,a0
    647c:	02f9c063          	blt	s3,a5,649c <_vfiprintf_r+0x1310>
    6480:	004c0c13          	add	s8,s8,4
    6484:	45378463          	beq	a5,s3,68cc <_vfiprintf_r+0x1740>
    6488:	00078a93          	mv	s5,a5
    648c:	04c12783          	lw	a5,76(sp)
    6490:	018787b3          	add	a5,a5,s8
    6494:	0007a603          	lw	a2,0(a5)
    6498:	fc0614e3          	bnez	a2,6460 <_vfiprintf_r+0x12d4>
    649c:	01012c03          	lw	s8,16(sp)
    64a0:	01812e03          	lw	t3,24(sp)
    64a4:	01c12803          	lw	a6,28(sp)
    64a8:	02012883          	lw	a7,32(sp)
    64ac:	000d0993          	mv	s3,s10
    64b0:	000a8d13          	mv	s10,s5
    64b4:	000c8a93          	mv	s5,s9
    64b8:	000d8c93          	mv	s9,s11
    64bc:	280d0e63          	beqz	s10,6758 <_vfiprintf_r+0x15cc>
    64c0:	06300793          	li	a5,99
    64c4:	33a7d463          	bge	a5,s10,67ec <_vfiprintf_r+0x1660>
    64c8:	001d0593          	add	a1,s10,1
    64cc:	00040513          	mv	a0,s0
    64d0:	01112c23          	sw	a7,24(sp)
    64d4:	01c12823          	sw	t3,16(sp)
    64d8:	de8fb0ef          	jal	1ac0 <_malloc_r>
    64dc:	01012e03          	lw	t3,16(sp)
    64e0:	01812883          	lw	a7,24(sp)
    64e4:	00050813          	mv	a6,a0
    64e8:	42050063          	beqz	a0,6908 <_vfiprintf_r+0x177c>
    64ec:	00a12823          	sw	a0,16(sp)
    64f0:	00800613          	li	a2,8
    64f4:	00000593          	li	a1,0
    64f8:	05810513          	add	a0,sp,88
    64fc:	03112023          	sw	a7,32(sp)
    6500:	01c12e23          	sw	t3,28(sp)
    6504:	01012c23          	sw	a6,24(sp)
    6508:	e5dfa0ef          	jal	1364 <memset>
    650c:	01812803          	lw	a6,24(sp)
    6510:	05810713          	add	a4,sp,88
    6514:	000d0693          	mv	a3,s10
    6518:	00080593          	mv	a1,a6
    651c:	04c10613          	add	a2,sp,76
    6520:	00040513          	mv	a0,s0
    6524:	2c9040ef          	jal	afec <_wcsrtombs_r>
    6528:	01812803          	lw	a6,24(sp)
    652c:	01c12e03          	lw	t3,28(sp)
    6530:	02012883          	lw	a7,32(sp)
    6534:	40ad1063          	bne	s10,a0,6934 <_vfiprintf_r+0x17a8>
    6538:	fffd4e93          	not	t4,s10
    653c:	01a807b3          	add	a5,a6,s10
    6540:	41fede93          	sra	t4,t4,0x1f
    6544:	00078023          	sb	zero,0(a5)
    6548:	01dd7eb3          	and	t4,s10,t4
    654c:	2140006f          	j	6760 <_vfiprintf_r+0x15d4>
    6550:	010e7613          	and	a2,t3,16
    6554:	000aa783          	lw	a5,0(s5)
    6558:	004a8a93          	add	s5,s5,4
    655c:	02061263          	bnez	a2,6580 <_vfiprintf_r+0x13f4>
    6560:	040e7613          	and	a2,t3,64
    6564:	00060a63          	beqz	a2,6578 <_vfiprintf_r+0x13ec>
    6568:	01079793          	sll	a5,a5,0x10
    656c:	0107d793          	srl	a5,a5,0x10
    6570:	00000593          	li	a1,0
    6574:	e1dff06f          	j	6390 <_vfiprintf_r+0x1204>
    6578:	200e7613          	and	a2,t3,512
    657c:	22061e63          	bnez	a2,67b8 <_vfiprintf_r+0x162c>
    6580:	00000593          	li	a1,0
    6584:	e0dff06f          	j	6390 <_vfiprintf_r+0x1204>
    6588:	400e7793          	and	a5,t3,1024
    658c:	00000693          	li	a3,0
    6590:	11010e93          	add	t4,sp,272
    6594:	01812823          	sw	s8,16(sp)
    6598:	02812223          	sw	s0,36(sp)
    659c:	03912c23          	sw	s9,56(sp)
    65a0:	03512e23          	sw	s5,60(sp)
    65a4:	02c12c83          	lw	s9,44(sp)
    65a8:	01c12c23          	sw	t3,24(sp)
    65ac:	01112e23          	sw	a7,28(sp)
    65b0:	02e12023          	sw	a4,32(sp)
    65b4:	00078c13          	mv	s8,a5
    65b8:	00068413          	mv	s0,a3
    65bc:	03312423          	sw	s3,40(sp)
    65c0:	000e8a93          	mv	s5,t4
    65c4:	0280006f          	j	65ec <_vfiprintf_r+0x1460>
    65c8:	00a00613          	li	a2,10
    65cc:	00000693          	li	a3,0
    65d0:	000d8513          	mv	a0,s11
    65d4:	000d0593          	mv	a1,s10
    65d8:	364050ef          	jal	b93c <__udivdi3>
    65dc:	220d0a63          	beqz	s10,6810 <_vfiprintf_r+0x1684>
    65e0:	00050d93          	mv	s11,a0
    65e4:	00058d13          	mv	s10,a1
    65e8:	00098a93          	mv	s5,s3
    65ec:	00a00613          	li	a2,10
    65f0:	00000693          	li	a3,0
    65f4:	000d8513          	mv	a0,s11
    65f8:	000d0593          	mv	a1,s10
    65fc:	1ed050ef          	jal	bfe8 <__umoddi3>
    6600:	03050513          	add	a0,a0,48
    6604:	feaa8fa3          	sb	a0,-1(s5)
    6608:	fffa8993          	add	s3,s5,-1
    660c:	00140413          	add	s0,s0,1
    6610:	fa0c0ce3          	beqz	s8,65c8 <_vfiprintf_r+0x143c>
    6614:	000cc783          	lbu	a5,0(s9)
    6618:	fa8798e3          	bne	a5,s0,65c8 <_vfiprintf_r+0x143c>
    661c:	0ff00793          	li	a5,255
    6620:	faf404e3          	beq	s0,a5,65c8 <_vfiprintf_r+0x143c>
    6624:	0e0d1a63          	bnez	s10,6718 <_vfiprintf_r+0x158c>
    6628:	00900793          	li	a5,9
    662c:	0fb7e663          	bltu	a5,s11,6718 <_vfiprintf_r+0x158c>
    6630:	00098813          	mv	a6,s3
    6634:	03912623          	sw	s9,44(sp)
    6638:	01012c03          	lw	s8,16(sp)
    663c:	01812e03          	lw	t3,24(sp)
    6640:	01c12883          	lw	a7,28(sp)
    6644:	02012703          	lw	a4,32(sp)
    6648:	02412403          	lw	s0,36(sp)
    664c:	02812983          	lw	s3,40(sp)
    6650:	03812c83          	lw	s9,56(sp)
    6654:	03c12a83          	lw	s5,60(sp)
    6658:	9a1ff06f          	j	5ff8 <_vfiprintf_r+0xe6c>
    665c:	00068e13          	mv	t3,a3
    6660:	00000693          	li	a3,0
    6664:	c0068263          	beqz	a3,5a68 <_vfiprintf_r+0x8dc>
    6668:	95dff06f          	j	5fc4 <_vfiprintf_r+0xe38>
    666c:	00040513          	mv	a0,s0
    6670:	115000ef          	jal	6f84 <__sinit>
    6674:	b61fe06f          	j	51d4 <_vfiprintf_r+0x48>
    6678:	001cc683          	lbu	a3,1(s9)
    667c:	200ded93          	or	s11,s11,512
    6680:	001c8c93          	add	s9,s9,1
    6684:	c89fe06f          	j	530c <_vfiprintf_r+0x180>
    6688:	001cc683          	lbu	a3,1(s9)
    668c:	020ded93          	or	s11,s11,32
    6690:	001c8c93          	add	s9,s9,1
    6694:	c79fe06f          	j	530c <_vfiprintf_r+0x180>
    6698:	000aa783          	lw	a5,0(s5)
    669c:	00c12703          	lw	a4,12(sp)
    66a0:	004a8a93          	add	s5,s5,4
    66a4:	00e7a023          	sw	a4,0(a5)
    66a8:	bfdfe06f          	j	52a4 <_vfiprintf_r+0x118>
    66ac:	00600793          	li	a5,6
    66b0:	00070d13          	mv	s10,a4
    66b4:	0ce7e863          	bltu	a5,a4,6784 <_vfiprintf_r+0x15f8>
    66b8:	000d0e93          	mv	t4,s10
    66bc:	00009817          	auipc	a6,0x9
    66c0:	e7880813          	add	a6,a6,-392 # f534 <__fini_array_end+0x22c>
    66c4:	cb9fe06f          	j	537c <_vfiprintf_r+0x1f0>
    66c8:	00000793          	li	a5,0
    66cc:	00000593          	li	a1,0
    66d0:	8f5ff06f          	j	5fc4 <_vfiprintf_r+0xe38>
    66d4:	05810713          	add	a4,sp,88
    66d8:	00000693          	li	a3,0
    66dc:	04c10613          	add	a2,sp,76
    66e0:	00000593          	li	a1,0
    66e4:	00040513          	mv	a0,s0
    66e8:	01112e23          	sw	a7,28(sp)
    66ec:	01012c23          	sw	a6,24(sp)
    66f0:	01c12823          	sw	t3,16(sp)
    66f4:	0f9040ef          	jal	afec <_wcsrtombs_r>
    66f8:	fff00793          	li	a5,-1
    66fc:	01012e03          	lw	t3,16(sp)
    6700:	01812803          	lw	a6,24(sp)
    6704:	01c12883          	lw	a7,28(sp)
    6708:	00050d13          	mv	s10,a0
    670c:	1ef50e63          	beq	a0,a5,6908 <_vfiprintf_r+0x177c>
    6710:	05012623          	sw	a6,76(sp)
    6714:	da9ff06f          	j	64bc <_vfiprintf_r+0x1330>
    6718:	03012783          	lw	a5,48(sp)
    671c:	03412583          	lw	a1,52(sp)
    6720:	00000413          	li	s0,0
    6724:	40f989b3          	sub	s3,s3,a5
    6728:	00078613          	mv	a2,a5
    672c:	00098513          	mv	a0,s3
    6730:	6c8010ef          	jal	7df8 <strncpy>
    6734:	001cc783          	lbu	a5,1(s9)
    6738:	00a00613          	li	a2,10
    673c:	00000693          	li	a3,0
    6740:	00f037b3          	snez	a5,a5
    6744:	000d8513          	mv	a0,s11
    6748:	000d0593          	mv	a1,s10
    674c:	00fc8cb3          	add	s9,s9,a5
    6750:	1ec050ef          	jal	b93c <__udivdi3>
    6754:	e8dff06f          	j	65e0 <_vfiprintf_r+0x1454>
    6758:	00000e93          	li	t4,0
    675c:	00012823          	sw	zero,16(sp)
    6760:	04314783          	lbu	a5,67(sp)
    6764:	00000713          	li	a4,0
    6768:	00000f93          	li	t6,0
    676c:	a0079063          	bnez	a5,596c <_vfiprintf_r+0x7e0>
    6770:	c19fe06f          	j	5388 <_vfiprintf_r+0x1fc>
    6774:	00100f13          	li	t5,1
    6778:	00000613          	li	a2,0
    677c:	000a0c13          	mv	s8,s4
    6780:	ce9fe06f          	j	5468 <_vfiprintf_r+0x2dc>
    6784:	00600d13          	li	s10,6
    6788:	f31ff06f          	j	66b8 <_vfiprintf_r+0x152c>
    678c:	00100f13          	li	t5,1
    6790:	000a0c13          	mv	s8,s4
    6794:	c4dfe06f          	j	53e0 <_vfiprintf_r+0x254>
    6798:	000aa783          	lw	a5,0(s5)
    679c:	00c12703          	lw	a4,12(sp)
    67a0:	004a8a93          	add	s5,s5,4
    67a4:	00e79023          	sh	a4,0(a5)
    67a8:	afdfe06f          	j	52a4 <_vfiprintf_r+0x118>
    67ac:	0ff7fd93          	zext.b	s11,a5
    67b0:	00000d13          	li	s10,0
    67b4:	a04ff06f          	j	59b8 <_vfiprintf_r+0x82c>
    67b8:	0ff7f793          	zext.b	a5,a5
    67bc:	00000593          	li	a1,0
    67c0:	bd1ff06f          	j	6390 <_vfiprintf_r+0x1204>
    67c4:	0ff7f793          	zext.b	a5,a5
    67c8:	00000593          	li	a1,0
    67cc:	a5cff06f          	j	5a28 <_vfiprintf_r+0x89c>
    67d0:	01879d93          	sll	s11,a5,0x18
    67d4:	418ddd93          	sra	s11,s11,0x18
    67d8:	41fddd13          	sra	s10,s11,0x1f
    67dc:	000d0693          	mv	a3,s10
    67e0:	95cff06f          	j	593c <_vfiprintf_r+0x7b0>
    67e4:	03000793          	li	a5,48
    67e8:	c8cff06f          	j	5c74 <_vfiprintf_r+0xae8>
    67ec:	00012823          	sw	zero,16(sp)
    67f0:	0ac10813          	add	a6,sp,172
    67f4:	cfdff06f          	j	64f0 <_vfiprintf_r+0x1364>
    67f8:	0589a503          	lw	a0,88(s3)
    67fc:	b65fa0ef          	jal	1360 <__retarget_lock_release_recursive>
    6800:	d51fe06f          	j	5550 <_vfiprintf_r+0x3c4>
    6804:	00070e93          	mv	t4,a4
    6808:	00070d13          	mv	s10,a4
    680c:	f55ff06f          	j	6760 <_vfiprintf_r+0x15d4>
    6810:	00900793          	li	a5,9
    6814:	ddb7e6e3          	bltu	a5,s11,65e0 <_vfiprintf_r+0x1454>
    6818:	e19ff06f          	j	6630 <_vfiprintf_r+0x14a4>
    681c:	00058513          	mv	a0,a1
    6820:	00009317          	auipc	t1,0x9
    6824:	37030313          	add	t1,t1,880 # fb90 <blanks.1>
    6828:	8cdff06f          	j	60f4 <_vfiprintf_r+0xf68>
    682c:	00080513          	mv	a0,a6
    6830:	03112023          	sw	a7,32(sp)
    6834:	01012c23          	sw	a6,24(sp)
    6838:	01b12e23          	sw	s11,28(sp)
    683c:	da9fa0ef          	jal	15e4 <strlen>
    6840:	fff54e93          	not	t4,a0
    6844:	41fede93          	sra	t4,t4,0x1f
    6848:	01812803          	lw	a6,24(sp)
    684c:	01c12e03          	lw	t3,28(sp)
    6850:	02012883          	lw	a7,32(sp)
    6854:	00050d13          	mv	s10,a0
    6858:	01d57eb3          	and	t4,a0,t4
    685c:	00012823          	sw	zero,16(sp)
    6860:	f01ff06f          	j	6760 <_vfiprintf_r+0x15d4>
    6864:	06010613          	add	a2,sp,96
    6868:	00098593          	mv	a1,s3
    686c:	00040513          	mv	a0,s0
    6870:	fe0fe0ef          	jal	5050 <__sprint_r.part.0>
    6874:	00051463          	bnez	a0,687c <_vfiprintf_r+0x16f0>
    6878:	dc5fe06f          	j	563c <_vfiprintf_r+0x4b0>
    687c:	df5fe06f          	j	5670 <_vfiprintf_r+0x4e4>
    6880:	00168613          	add	a2,a3,1
    6884:	00009317          	auipc	t1,0x9
    6888:	30c30313          	add	t1,t1,780 # fb90 <blanks.1>
    688c:	f19fe06f          	j	57a4 <_vfiprintf_r+0x618>
    6890:	000f0513          	mv	a0,t5
    6894:	00009f97          	auipc	t6,0x9
    6898:	2ecf8f93          	add	t6,t6,748 # fb80 <zeroes.0>
    689c:	d10ff06f          	j	5dac <_vfiprintf_r+0xc20>
    68a0:	0649a783          	lw	a5,100(s3)
    68a4:	0017f793          	and	a5,a5,1
    68a8:	00079c63          	bnez	a5,68c0 <_vfiprintf_r+0x1734>
    68ac:	00c9d783          	lhu	a5,12(s3)
    68b0:	2007f793          	and	a5,a5,512
    68b4:	00079663          	bnez	a5,68c0 <_vfiprintf_r+0x1734>
    68b8:	0589a503          	lw	a0,88(s3)
    68bc:	aa5fa0ef          	jal	1360 <__retarget_lock_release_recursive>
    68c0:	fff00793          	li	a5,-1
    68c4:	00f12623          	sw	a5,12(sp)
    68c8:	de5fe06f          	j	56ac <_vfiprintf_r+0x520>
    68cc:	00098713          	mv	a4,s3
    68d0:	000c8a93          	mv	s5,s9
    68d4:	000d0993          	mv	s3,s10
    68d8:	01012c03          	lw	s8,16(sp)
    68dc:	01812e03          	lw	t3,24(sp)
    68e0:	01c12803          	lw	a6,28(sp)
    68e4:	02012883          	lw	a7,32(sp)
    68e8:	000d8c93          	mv	s9,s11
    68ec:	00070d13          	mv	s10,a4
    68f0:	bcdff06f          	j	64bc <_vfiprintf_r+0x1330>
    68f4:	00cd1783          	lh	a5,12(s10)
    68f8:	000d0993          	mv	s3,s10
    68fc:	0407e793          	or	a5,a5,64
    6900:	00fd1623          	sh	a5,12(s10)
    6904:	d71fe06f          	j	5674 <_vfiprintf_r+0x4e8>
    6908:	00c99783          	lh	a5,12(s3)
    690c:	0407e793          	or	a5,a5,64
    6910:	00f99623          	sh	a5,12(s3)
    6914:	d61fe06f          	j	5674 <_vfiprintf_r+0x4e8>
    6918:	000aa703          	lw	a4,0(s5)
    691c:	004a8a93          	add	s5,s5,4
    6920:	00075463          	bgez	a4,6928 <_vfiprintf_r+0x179c>
    6924:	fff00713          	li	a4,-1
    6928:	001cc683          	lbu	a3,1(s9)
    692c:	00058c93          	mv	s9,a1
    6930:	9ddfe06f          	j	530c <_vfiprintf_r+0x180>
    6934:	00c9d783          	lhu	a5,12(s3)
    6938:	0407e793          	or	a5,a5,64
    693c:	00f99623          	sh	a5,12(s3)
    6940:	d1dfe06f          	j	565c <_vfiprintf_r+0x4d0>

00006944 <__sbprintf>:
    6944:	b7010113          	add	sp,sp,-1168
    6948:	00c59783          	lh	a5,12(a1)
    694c:	00e5d703          	lhu	a4,14(a1)
    6950:	48812423          	sw	s0,1160(sp)
    6954:	00058413          	mv	s0,a1
    6958:	000105b7          	lui	a1,0x10
    695c:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x21d>
    6960:	06442303          	lw	t1,100(s0)
    6964:	01c42883          	lw	a7,28(s0)
    6968:	02442803          	lw	a6,36(s0)
    696c:	01071713          	sll	a4,a4,0x10
    6970:	00b7f7b3          	and	a5,a5,a1
    6974:	00e7e7b3          	or	a5,a5,a4
    6978:	40000593          	li	a1,1024
    697c:	49212023          	sw	s2,1152(sp)
    6980:	00f12a23          	sw	a5,20(sp)
    6984:	00050913          	mv	s2,a0
    6988:	07010793          	add	a5,sp,112
    698c:	06010513          	add	a0,sp,96
    6990:	48112623          	sw	ra,1164(sp)
    6994:	48912223          	sw	s1,1156(sp)
    6998:	47312e23          	sw	s3,1148(sp)
    699c:	00060493          	mv	s1,a2
    69a0:	00068993          	mv	s3,a3
    69a4:	06612623          	sw	t1,108(sp)
    69a8:	03112223          	sw	a7,36(sp)
    69ac:	03012623          	sw	a6,44(sp)
    69b0:	00f12423          	sw	a5,8(sp)
    69b4:	00f12c23          	sw	a5,24(sp)
    69b8:	00b12823          	sw	a1,16(sp)
    69bc:	00b12e23          	sw	a1,28(sp)
    69c0:	02012023          	sw	zero,32(sp)
    69c4:	991fa0ef          	jal	1354 <__retarget_lock_init_recursive>
    69c8:	00048613          	mv	a2,s1
    69cc:	00098693          	mv	a3,s3
    69d0:	00810593          	add	a1,sp,8
    69d4:	00090513          	mv	a0,s2
    69d8:	fb4fe0ef          	jal	518c <_vfiprintf_r>
    69dc:	00050493          	mv	s1,a0
    69e0:	04055263          	bgez	a0,6a24 <__sbprintf+0xe0>
    69e4:	01415783          	lhu	a5,20(sp)
    69e8:	0407f793          	and	a5,a5,64
    69ec:	00078863          	beqz	a5,69fc <__sbprintf+0xb8>
    69f0:	00c45783          	lhu	a5,12(s0)
    69f4:	0407e793          	or	a5,a5,64
    69f8:	00f41623          	sh	a5,12(s0)
    69fc:	06012503          	lw	a0,96(sp)
    6a00:	959fa0ef          	jal	1358 <__retarget_lock_close_recursive>
    6a04:	48c12083          	lw	ra,1164(sp)
    6a08:	48812403          	lw	s0,1160(sp)
    6a0c:	48012903          	lw	s2,1152(sp)
    6a10:	47c12983          	lw	s3,1148(sp)
    6a14:	00048513          	mv	a0,s1
    6a18:	48412483          	lw	s1,1156(sp)
    6a1c:	49010113          	add	sp,sp,1168
    6a20:	00008067          	ret
    6a24:	00810593          	add	a1,sp,8
    6a28:	00090513          	mv	a0,s2
    6a2c:	25c000ef          	jal	6c88 <_fflush_r>
    6a30:	fa050ae3          	beqz	a0,69e4 <__sbprintf+0xa0>
    6a34:	fff00493          	li	s1,-1
    6a38:	fadff06f          	j	69e4 <__sbprintf+0xa0>

00006a3c <__sflush_r>:
    6a3c:	00c59703          	lh	a4,12(a1)
    6a40:	fe010113          	add	sp,sp,-32
    6a44:	00812c23          	sw	s0,24(sp)
    6a48:	01312623          	sw	s3,12(sp)
    6a4c:	00112e23          	sw	ra,28(sp)
    6a50:	00877793          	and	a5,a4,8
    6a54:	00058413          	mv	s0,a1
    6a58:	00050993          	mv	s3,a0
    6a5c:	12079063          	bnez	a5,6b7c <__sflush_r+0x140>
    6a60:	000017b7          	lui	a5,0x1
    6a64:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    6a68:	0045a683          	lw	a3,4(a1)
    6a6c:	00f767b3          	or	a5,a4,a5
    6a70:	00f59623          	sh	a5,12(a1)
    6a74:	18d05263          	blez	a3,6bf8 <__sflush_r+0x1bc>
    6a78:	02842803          	lw	a6,40(s0)
    6a7c:	0e080463          	beqz	a6,6b64 <__sflush_r+0x128>
    6a80:	00912a23          	sw	s1,20(sp)
    6a84:	01371693          	sll	a3,a4,0x13
    6a88:	0009a483          	lw	s1,0(s3)
    6a8c:	0009a023          	sw	zero,0(s3)
    6a90:	01c42583          	lw	a1,28(s0)
    6a94:	1606ce63          	bltz	a3,6c10 <__sflush_r+0x1d4>
    6a98:	00000613          	li	a2,0
    6a9c:	00100693          	li	a3,1
    6aa0:	00098513          	mv	a0,s3
    6aa4:	000800e7          	jalr	a6
    6aa8:	fff00793          	li	a5,-1
    6aac:	00050613          	mv	a2,a0
    6ab0:	1af50463          	beq	a0,a5,6c58 <__sflush_r+0x21c>
    6ab4:	00c41783          	lh	a5,12(s0)
    6ab8:	02842803          	lw	a6,40(s0)
    6abc:	01c42583          	lw	a1,28(s0)
    6ac0:	0047f793          	and	a5,a5,4
    6ac4:	00078e63          	beqz	a5,6ae0 <__sflush_r+0xa4>
    6ac8:	00442703          	lw	a4,4(s0)
    6acc:	03042783          	lw	a5,48(s0)
    6ad0:	40e60633          	sub	a2,a2,a4
    6ad4:	00078663          	beqz	a5,6ae0 <__sflush_r+0xa4>
    6ad8:	03c42783          	lw	a5,60(s0)
    6adc:	40f60633          	sub	a2,a2,a5
    6ae0:	00000693          	li	a3,0
    6ae4:	00098513          	mv	a0,s3
    6ae8:	000800e7          	jalr	a6
    6aec:	fff00793          	li	a5,-1
    6af0:	12f51463          	bne	a0,a5,6c18 <__sflush_r+0x1dc>
    6af4:	0009a683          	lw	a3,0(s3)
    6af8:	01d00793          	li	a5,29
    6afc:	00c41703          	lh	a4,12(s0)
    6b00:	16d7ea63          	bltu	a5,a3,6c74 <__sflush_r+0x238>
    6b04:	204007b7          	lui	a5,0x20400
    6b08:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6b0c:	00d7d7b3          	srl	a5,a5,a3
    6b10:	0017f793          	and	a5,a5,1
    6b14:	16078063          	beqz	a5,6c74 <__sflush_r+0x238>
    6b18:	01042603          	lw	a2,16(s0)
    6b1c:	fffff7b7          	lui	a5,0xfffff
    6b20:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6b24:	00f777b3          	and	a5,a4,a5
    6b28:	00f41623          	sh	a5,12(s0)
    6b2c:	00042223          	sw	zero,4(s0)
    6b30:	00c42023          	sw	a2,0(s0)
    6b34:	01371793          	sll	a5,a4,0x13
    6b38:	0007d463          	bgez	a5,6b40 <__sflush_r+0x104>
    6b3c:	10068263          	beqz	a3,6c40 <__sflush_r+0x204>
    6b40:	03042583          	lw	a1,48(s0)
    6b44:	0099a023          	sw	s1,0(s3)
    6b48:	10058463          	beqz	a1,6c50 <__sflush_r+0x214>
    6b4c:	04040793          	add	a5,s0,64
    6b50:	00f58663          	beq	a1,a5,6b5c <__sflush_r+0x120>
    6b54:	00098513          	mv	a0,s3
    6b58:	c5dfa0ef          	jal	17b4 <_free_r>
    6b5c:	01412483          	lw	s1,20(sp)
    6b60:	02042823          	sw	zero,48(s0)
    6b64:	00000513          	li	a0,0
    6b68:	01c12083          	lw	ra,28(sp)
    6b6c:	01812403          	lw	s0,24(sp)
    6b70:	00c12983          	lw	s3,12(sp)
    6b74:	02010113          	add	sp,sp,32
    6b78:	00008067          	ret
    6b7c:	01212823          	sw	s2,16(sp)
    6b80:	0105a903          	lw	s2,16(a1)
    6b84:	08090263          	beqz	s2,6c08 <__sflush_r+0x1cc>
    6b88:	00912a23          	sw	s1,20(sp)
    6b8c:	0005a483          	lw	s1,0(a1)
    6b90:	00377713          	and	a4,a4,3
    6b94:	0125a023          	sw	s2,0(a1)
    6b98:	412484b3          	sub	s1,s1,s2
    6b9c:	00000793          	li	a5,0
    6ba0:	00071463          	bnez	a4,6ba8 <__sflush_r+0x16c>
    6ba4:	0145a783          	lw	a5,20(a1)
    6ba8:	00f42423          	sw	a5,8(s0)
    6bac:	00904863          	bgtz	s1,6bbc <__sflush_r+0x180>
    6bb0:	0540006f          	j	6c04 <__sflush_r+0x1c8>
    6bb4:	00a90933          	add	s2,s2,a0
    6bb8:	04905663          	blez	s1,6c04 <__sflush_r+0x1c8>
    6bbc:	02442783          	lw	a5,36(s0)
    6bc0:	01c42583          	lw	a1,28(s0)
    6bc4:	00048693          	mv	a3,s1
    6bc8:	00090613          	mv	a2,s2
    6bcc:	00098513          	mv	a0,s3
    6bd0:	000780e7          	jalr	a5
    6bd4:	40a484b3          	sub	s1,s1,a0
    6bd8:	fca04ee3          	bgtz	a0,6bb4 <__sflush_r+0x178>
    6bdc:	00c41703          	lh	a4,12(s0)
    6be0:	01012903          	lw	s2,16(sp)
    6be4:	04076713          	or	a4,a4,64
    6be8:	01412483          	lw	s1,20(sp)
    6bec:	00e41623          	sh	a4,12(s0)
    6bf0:	fff00513          	li	a0,-1
    6bf4:	f75ff06f          	j	6b68 <__sflush_r+0x12c>
    6bf8:	03c5a683          	lw	a3,60(a1)
    6bfc:	e6d04ee3          	bgtz	a3,6a78 <__sflush_r+0x3c>
    6c00:	f65ff06f          	j	6b64 <__sflush_r+0x128>
    6c04:	01412483          	lw	s1,20(sp)
    6c08:	01012903          	lw	s2,16(sp)
    6c0c:	f59ff06f          	j	6b64 <__sflush_r+0x128>
    6c10:	05042603          	lw	a2,80(s0)
    6c14:	eadff06f          	j	6ac0 <__sflush_r+0x84>
    6c18:	00c41703          	lh	a4,12(s0)
    6c1c:	01042683          	lw	a3,16(s0)
    6c20:	fffff7b7          	lui	a5,0xfffff
    6c24:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6c28:	00f777b3          	and	a5,a4,a5
    6c2c:	00f41623          	sh	a5,12(s0)
    6c30:	00042223          	sw	zero,4(s0)
    6c34:	00d42023          	sw	a3,0(s0)
    6c38:	01371793          	sll	a5,a4,0x13
    6c3c:	f007d2e3          	bgez	a5,6b40 <__sflush_r+0x104>
    6c40:	03042583          	lw	a1,48(s0)
    6c44:	04a42823          	sw	a0,80(s0)
    6c48:	0099a023          	sw	s1,0(s3)
    6c4c:	f00590e3          	bnez	a1,6b4c <__sflush_r+0x110>
    6c50:	01412483          	lw	s1,20(sp)
    6c54:	f11ff06f          	j	6b64 <__sflush_r+0x128>
    6c58:	0009a783          	lw	a5,0(s3)
    6c5c:	e4078ce3          	beqz	a5,6ab4 <__sflush_r+0x78>
    6c60:	01d00713          	li	a4,29
    6c64:	00e78c63          	beq	a5,a4,6c7c <__sflush_r+0x240>
    6c68:	01600713          	li	a4,22
    6c6c:	00e78863          	beq	a5,a4,6c7c <__sflush_r+0x240>
    6c70:	00c41703          	lh	a4,12(s0)
    6c74:	04076713          	or	a4,a4,64
    6c78:	f71ff06f          	j	6be8 <__sflush_r+0x1ac>
    6c7c:	0099a023          	sw	s1,0(s3)
    6c80:	01412483          	lw	s1,20(sp)
    6c84:	ee1ff06f          	j	6b64 <__sflush_r+0x128>

00006c88 <_fflush_r>:
    6c88:	ff010113          	add	sp,sp,-16
    6c8c:	00812423          	sw	s0,8(sp)
    6c90:	00912223          	sw	s1,4(sp)
    6c94:	00112623          	sw	ra,12(sp)
    6c98:	01212023          	sw	s2,0(sp)
    6c9c:	00050493          	mv	s1,a0
    6ca0:	00058413          	mv	s0,a1
    6ca4:	00050663          	beqz	a0,6cb0 <_fflush_r+0x28>
    6ca8:	03452783          	lw	a5,52(a0)
    6cac:	0a078a63          	beqz	a5,6d60 <_fflush_r+0xd8>
    6cb0:	00c41783          	lh	a5,12(s0)
    6cb4:	00000913          	li	s2,0
    6cb8:	04078063          	beqz	a5,6cf8 <_fflush_r+0x70>
    6cbc:	06442703          	lw	a4,100(s0)
    6cc0:	00177713          	and	a4,a4,1
    6cc4:	00071663          	bnez	a4,6cd0 <_fflush_r+0x48>
    6cc8:	2007f793          	and	a5,a5,512
    6ccc:	04078463          	beqz	a5,6d14 <_fflush_r+0x8c>
    6cd0:	00040593          	mv	a1,s0
    6cd4:	00048513          	mv	a0,s1
    6cd8:	d65ff0ef          	jal	6a3c <__sflush_r>
    6cdc:	06442783          	lw	a5,100(s0)
    6ce0:	00050913          	mv	s2,a0
    6ce4:	0017f793          	and	a5,a5,1
    6ce8:	00079863          	bnez	a5,6cf8 <_fflush_r+0x70>
    6cec:	00c45783          	lhu	a5,12(s0)
    6cf0:	2007f793          	and	a5,a5,512
    6cf4:	04078463          	beqz	a5,6d3c <_fflush_r+0xb4>
    6cf8:	00c12083          	lw	ra,12(sp)
    6cfc:	00812403          	lw	s0,8(sp)
    6d00:	00412483          	lw	s1,4(sp)
    6d04:	00090513          	mv	a0,s2
    6d08:	00012903          	lw	s2,0(sp)
    6d0c:	01010113          	add	sp,sp,16
    6d10:	00008067          	ret
    6d14:	05842503          	lw	a0,88(s0)
    6d18:	e44fa0ef          	jal	135c <__retarget_lock_acquire_recursive>
    6d1c:	00040593          	mv	a1,s0
    6d20:	00048513          	mv	a0,s1
    6d24:	d19ff0ef          	jal	6a3c <__sflush_r>
    6d28:	06442783          	lw	a5,100(s0)
    6d2c:	00050913          	mv	s2,a0
    6d30:	0017f793          	and	a5,a5,1
    6d34:	fc0792e3          	bnez	a5,6cf8 <_fflush_r+0x70>
    6d38:	fb5ff06f          	j	6cec <_fflush_r+0x64>
    6d3c:	05842503          	lw	a0,88(s0)
    6d40:	e20fa0ef          	jal	1360 <__retarget_lock_release_recursive>
    6d44:	00c12083          	lw	ra,12(sp)
    6d48:	00812403          	lw	s0,8(sp)
    6d4c:	00412483          	lw	s1,4(sp)
    6d50:	00090513          	mv	a0,s2
    6d54:	00012903          	lw	s2,0(sp)
    6d58:	01010113          	add	sp,sp,16
    6d5c:	00008067          	ret
    6d60:	224000ef          	jal	6f84 <__sinit>
    6d64:	f4dff06f          	j	6cb0 <_fflush_r+0x28>

00006d68 <stdio_exit_handler>:
    6d68:	7fff9617          	auipc	a2,0x7fff9
    6d6c:	7c060613          	add	a2,a2,1984 # 80000528 <__sglue>
    6d70:	00004597          	auipc	a1,0x4
    6d74:	28c58593          	add	a1,a1,652 # affc <_fclose_r>
    6d78:	7fff9517          	auipc	a0,0x7fff9
    6d7c:	28850513          	add	a0,a0,648 # 80000000 <_impure_data>
    6d80:	7a00006f          	j	7520 <_fwalk_sglue>

00006d84 <cleanup_stdio>:
    6d84:	00452583          	lw	a1,4(a0)
    6d88:	ff010113          	add	sp,sp,-16
    6d8c:	00812423          	sw	s0,8(sp)
    6d90:	00112623          	sw	ra,12(sp)
    6d94:	80000797          	auipc	a5,0x80000
    6d98:	12c78793          	add	a5,a5,300 # 80006ec0 <__sf>
    6d9c:	00050413          	mv	s0,a0
    6da0:	00f58463          	beq	a1,a5,6da8 <cleanup_stdio+0x24>
    6da4:	258040ef          	jal	affc <_fclose_r>
    6da8:	00842583          	lw	a1,8(s0)
    6dac:	80000797          	auipc	a5,0x80000
    6db0:	17c78793          	add	a5,a5,380 # 80006f28 <__sf+0x68>
    6db4:	00f58663          	beq	a1,a5,6dc0 <cleanup_stdio+0x3c>
    6db8:	00040513          	mv	a0,s0
    6dbc:	240040ef          	jal	affc <_fclose_r>
    6dc0:	00c42583          	lw	a1,12(s0)
    6dc4:	80000797          	auipc	a5,0x80000
    6dc8:	1cc78793          	add	a5,a5,460 # 80006f90 <__sf+0xd0>
    6dcc:	00f58c63          	beq	a1,a5,6de4 <cleanup_stdio+0x60>
    6dd0:	00040513          	mv	a0,s0
    6dd4:	00812403          	lw	s0,8(sp)
    6dd8:	00c12083          	lw	ra,12(sp)
    6ddc:	01010113          	add	sp,sp,16
    6de0:	21c0406f          	j	affc <_fclose_r>
    6de4:	00c12083          	lw	ra,12(sp)
    6de8:	00812403          	lw	s0,8(sp)
    6dec:	01010113          	add	sp,sp,16
    6df0:	00008067          	ret

00006df4 <global_stdio_init.part.0>:
    6df4:	fe010113          	add	sp,sp,-32
    6df8:	00000797          	auipc	a5,0x0
    6dfc:	f7078793          	add	a5,a5,-144 # 6d68 <stdio_exit_handler>
    6e00:	00112e23          	sw	ra,28(sp)
    6e04:	00812c23          	sw	s0,24(sp)
    6e08:	00912a23          	sw	s1,20(sp)
    6e0c:	80000417          	auipc	s0,0x80000
    6e10:	0b440413          	add	s0,s0,180 # 80006ec0 <__sf>
    6e14:	01212823          	sw	s2,16(sp)
    6e18:	01312623          	sw	s3,12(sp)
    6e1c:	01412423          	sw	s4,8(sp)
    6e20:	00800613          	li	a2,8
    6e24:	00000593          	li	a1,0
    6e28:	7fffa717          	auipc	a4,0x7fffa
    6e2c:	90f72623          	sw	a5,-1780(a4) # 80000734 <__stdio_exit_handler>
    6e30:	80000517          	auipc	a0,0x80000
    6e34:	0ec50513          	add	a0,a0,236 # 80006f1c <__sf+0x5c>
    6e38:	00400793          	li	a5,4
    6e3c:	00f42623          	sw	a5,12(s0)
    6e40:	00042023          	sw	zero,0(s0)
    6e44:	00042223          	sw	zero,4(s0)
    6e48:	00042423          	sw	zero,8(s0)
    6e4c:	06042223          	sw	zero,100(s0)
    6e50:	00042823          	sw	zero,16(s0)
    6e54:	00042a23          	sw	zero,20(s0)
    6e58:	00042c23          	sw	zero,24(s0)
    6e5c:	d08fa0ef          	jal	1364 <memset>
    6e60:	00001a17          	auipc	s4,0x1
    6e64:	870a0a13          	add	s4,s4,-1936 # 76d0 <__sread>
    6e68:	00001997          	auipc	s3,0x1
    6e6c:	8c498993          	add	s3,s3,-1852 # 772c <__swrite>
    6e70:	00001917          	auipc	s2,0x1
    6e74:	94490913          	add	s2,s2,-1724 # 77b4 <__sseek>
    6e78:	00001497          	auipc	s1,0x1
    6e7c:	9b448493          	add	s1,s1,-1612 # 782c <__sclose>
    6e80:	80000517          	auipc	a0,0x80000
    6e84:	09850513          	add	a0,a0,152 # 80006f18 <__sf+0x58>
    6e88:	03442023          	sw	s4,32(s0)
    6e8c:	03342223          	sw	s3,36(s0)
    6e90:	03242423          	sw	s2,40(s0)
    6e94:	02942623          	sw	s1,44(s0)
    6e98:	00842e23          	sw	s0,28(s0)
    6e9c:	cb8fa0ef          	jal	1354 <__retarget_lock_init_recursive>
    6ea0:	000107b7          	lui	a5,0x10
    6ea4:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x229>
    6ea8:	00800613          	li	a2,8
    6eac:	00000593          	li	a1,0
    6eb0:	80000517          	auipc	a0,0x80000
    6eb4:	0d450513          	add	a0,a0,212 # 80006f84 <__sf+0xc4>
    6eb8:	06f42a23          	sw	a5,116(s0)
    6ebc:	06042423          	sw	zero,104(s0)
    6ec0:	06042623          	sw	zero,108(s0)
    6ec4:	06042823          	sw	zero,112(s0)
    6ec8:	0c042623          	sw	zero,204(s0)
    6ecc:	06042c23          	sw	zero,120(s0)
    6ed0:	06042e23          	sw	zero,124(s0)
    6ed4:	08042023          	sw	zero,128(s0)
    6ed8:	c8cfa0ef          	jal	1364 <memset>
    6edc:	80000797          	auipc	a5,0x80000
    6ee0:	04c78793          	add	a5,a5,76 # 80006f28 <__sf+0x68>
    6ee4:	80000517          	auipc	a0,0x80000
    6ee8:	09c50513          	add	a0,a0,156 # 80006f80 <__sf+0xc0>
    6eec:	08f42223          	sw	a5,132(s0)
    6ef0:	09442423          	sw	s4,136(s0)
    6ef4:	09342623          	sw	s3,140(s0)
    6ef8:	09242823          	sw	s2,144(s0)
    6efc:	08942a23          	sw	s1,148(s0)
    6f00:	c54fa0ef          	jal	1354 <__retarget_lock_init_recursive>
    6f04:	000207b7          	lui	a5,0x20
    6f08:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6f0c:	00800613          	li	a2,8
    6f10:	00000593          	li	a1,0
    6f14:	80000517          	auipc	a0,0x80000
    6f18:	0d850513          	add	a0,a0,216 # 80006fec <__sf+0x12c>
    6f1c:	0cf42e23          	sw	a5,220(s0)
    6f20:	0c042823          	sw	zero,208(s0)
    6f24:	0c042a23          	sw	zero,212(s0)
    6f28:	0c042c23          	sw	zero,216(s0)
    6f2c:	12042a23          	sw	zero,308(s0)
    6f30:	0e042023          	sw	zero,224(s0)
    6f34:	0e042223          	sw	zero,228(s0)
    6f38:	0e042423          	sw	zero,232(s0)
    6f3c:	c28fa0ef          	jal	1364 <memset>
    6f40:	80000797          	auipc	a5,0x80000
    6f44:	05078793          	add	a5,a5,80 # 80006f90 <__sf+0xd0>
    6f48:	0f442823          	sw	s4,240(s0)
    6f4c:	0f342a23          	sw	s3,244(s0)
    6f50:	0f242c23          	sw	s2,248(s0)
    6f54:	0e942e23          	sw	s1,252(s0)
    6f58:	0ef42623          	sw	a5,236(s0)
    6f5c:	01812403          	lw	s0,24(sp)
    6f60:	01c12083          	lw	ra,28(sp)
    6f64:	01412483          	lw	s1,20(sp)
    6f68:	01012903          	lw	s2,16(sp)
    6f6c:	00c12983          	lw	s3,12(sp)
    6f70:	00812a03          	lw	s4,8(sp)
    6f74:	80000517          	auipc	a0,0x80000
    6f78:	07450513          	add	a0,a0,116 # 80006fe8 <__sf+0x128>
    6f7c:	02010113          	add	sp,sp,32
    6f80:	bd4fa06f          	j	1354 <__retarget_lock_init_recursive>

00006f84 <__sinit>:
    6f84:	ff010113          	add	sp,sp,-16
    6f88:	00812423          	sw	s0,8(sp)
    6f8c:	00050413          	mv	s0,a0
    6f90:	7fff9517          	auipc	a0,0x7fff9
    6f94:	79450513          	add	a0,a0,1940 # 80000724 <__lock___sfp_recursive_mutex>
    6f98:	00112623          	sw	ra,12(sp)
    6f9c:	bc0fa0ef          	jal	135c <__retarget_lock_acquire_recursive>
    6fa0:	03442783          	lw	a5,52(s0)
    6fa4:	00079e63          	bnez	a5,6fc0 <__sinit+0x3c>
    6fa8:	00000797          	auipc	a5,0x0
    6fac:	ddc78793          	add	a5,a5,-548 # 6d84 <cleanup_stdio>
    6fb0:	02f42a23          	sw	a5,52(s0)
    6fb4:	7fff9797          	auipc	a5,0x7fff9
    6fb8:	7807a783          	lw	a5,1920(a5) # 80000734 <__stdio_exit_handler>
    6fbc:	00078e63          	beqz	a5,6fd8 <__sinit+0x54>
    6fc0:	00812403          	lw	s0,8(sp)
    6fc4:	00c12083          	lw	ra,12(sp)
    6fc8:	7fff9517          	auipc	a0,0x7fff9
    6fcc:	75c50513          	add	a0,a0,1884 # 80000724 <__lock___sfp_recursive_mutex>
    6fd0:	01010113          	add	sp,sp,16
    6fd4:	b8cfa06f          	j	1360 <__retarget_lock_release_recursive>
    6fd8:	e1dff0ef          	jal	6df4 <global_stdio_init.part.0>
    6fdc:	00812403          	lw	s0,8(sp)
    6fe0:	00c12083          	lw	ra,12(sp)
    6fe4:	7fff9517          	auipc	a0,0x7fff9
    6fe8:	74050513          	add	a0,a0,1856 # 80000724 <__lock___sfp_recursive_mutex>
    6fec:	01010113          	add	sp,sp,16
    6ff0:	b70fa06f          	j	1360 <__retarget_lock_release_recursive>

00006ff4 <__sfp_lock_acquire>:
    6ff4:	7fff9517          	auipc	a0,0x7fff9
    6ff8:	73050513          	add	a0,a0,1840 # 80000724 <__lock___sfp_recursive_mutex>
    6ffc:	b60fa06f          	j	135c <__retarget_lock_acquire_recursive>

00007000 <__sfp_lock_release>:
    7000:	7fff9517          	auipc	a0,0x7fff9
    7004:	72450513          	add	a0,a0,1828 # 80000724 <__lock___sfp_recursive_mutex>
    7008:	b58fa06f          	j	1360 <__retarget_lock_release_recursive>

0000700c <__sfvwrite_r>:
    700c:	00862783          	lw	a5,8(a2)
    7010:	2c078463          	beqz	a5,72d8 <__sfvwrite_r+0x2cc>
    7014:	00c59683          	lh	a3,12(a1)
    7018:	fd010113          	add	sp,sp,-48
    701c:	02812423          	sw	s0,40(sp)
    7020:	01412c23          	sw	s4,24(sp)
    7024:	01612823          	sw	s6,16(sp)
    7028:	02112623          	sw	ra,44(sp)
    702c:	0086f793          	and	a5,a3,8
    7030:	00060b13          	mv	s6,a2
    7034:	00050a13          	mv	s4,a0
    7038:	00058413          	mv	s0,a1
    703c:	08078e63          	beqz	a5,70d8 <__sfvwrite_r+0xcc>
    7040:	0105a783          	lw	a5,16(a1)
    7044:	08078a63          	beqz	a5,70d8 <__sfvwrite_r+0xcc>
    7048:	02912223          	sw	s1,36(sp)
    704c:	03212023          	sw	s2,32(sp)
    7050:	01312e23          	sw	s3,28(sp)
    7054:	01512a23          	sw	s5,20(sp)
    7058:	0026f793          	and	a5,a3,2
    705c:	000b2483          	lw	s1,0(s6)
    7060:	0a078463          	beqz	a5,7108 <__sfvwrite_r+0xfc>
    7064:	02442783          	lw	a5,36(s0)
    7068:	01c42583          	lw	a1,28(s0)
    706c:	80000ab7          	lui	s5,0x80000
    7070:	00000993          	li	s3,0
    7074:	00000913          	li	s2,0
    7078:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    707c:	00098613          	mv	a2,s3
    7080:	000a0513          	mv	a0,s4
    7084:	04090263          	beqz	s2,70c8 <__sfvwrite_r+0xbc>
    7088:	00090693          	mv	a3,s2
    708c:	012af463          	bgeu	s5,s2,7094 <__sfvwrite_r+0x88>
    7090:	000a8693          	mv	a3,s5
    7094:	000780e7          	jalr	a5
    7098:	46a05263          	blez	a0,74fc <__sfvwrite_r+0x4f0>
    709c:	008b2783          	lw	a5,8(s6)
    70a0:	00a989b3          	add	s3,s3,a0
    70a4:	40a90933          	sub	s2,s2,a0
    70a8:	40a787b3          	sub	a5,a5,a0
    70ac:	00fb2423          	sw	a5,8(s6)
    70b0:	1a078663          	beqz	a5,725c <__sfvwrite_r+0x250>
    70b4:	02442783          	lw	a5,36(s0)
    70b8:	01c42583          	lw	a1,28(s0)
    70bc:	00098613          	mv	a2,s3
    70c0:	000a0513          	mv	a0,s4
    70c4:	fc0912e3          	bnez	s2,7088 <__sfvwrite_r+0x7c>
    70c8:	0004a983          	lw	s3,0(s1)
    70cc:	0044a903          	lw	s2,4(s1)
    70d0:	00848493          	add	s1,s1,8
    70d4:	fa9ff06f          	j	707c <__sfvwrite_r+0x70>
    70d8:	00040593          	mv	a1,s0
    70dc:	000a0513          	mv	a0,s4
    70e0:	0e5000ef          	jal	79c4 <__swsetup_r>
    70e4:	1c051c63          	bnez	a0,72bc <__sfvwrite_r+0x2b0>
    70e8:	00c41683          	lh	a3,12(s0)
    70ec:	02912223          	sw	s1,36(sp)
    70f0:	03212023          	sw	s2,32(sp)
    70f4:	01312e23          	sw	s3,28(sp)
    70f8:	01512a23          	sw	s5,20(sp)
    70fc:	0026f793          	and	a5,a3,2
    7100:	000b2483          	lw	s1,0(s6)
    7104:	f60790e3          	bnez	a5,7064 <__sfvwrite_r+0x58>
    7108:	01712623          	sw	s7,12(sp)
    710c:	01812423          	sw	s8,8(sp)
    7110:	0016f793          	and	a5,a3,1
    7114:	1c079663          	bnez	a5,72e0 <__sfvwrite_r+0x2d4>
    7118:	00042783          	lw	a5,0(s0)
    711c:	00842703          	lw	a4,8(s0)
    7120:	80000ab7          	lui	s5,0x80000
    7124:	01912223          	sw	s9,4(sp)
    7128:	00000b93          	li	s7,0
    712c:	00000993          	li	s3,0
    7130:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7134:	00078513          	mv	a0,a5
    7138:	00070c13          	mv	s8,a4
    713c:	10098263          	beqz	s3,7240 <__sfvwrite_r+0x234>
    7140:	2006f613          	and	a2,a3,512
    7144:	28060863          	beqz	a2,73d4 <__sfvwrite_r+0x3c8>
    7148:	00070c93          	mv	s9,a4
    714c:	32e9e863          	bltu	s3,a4,747c <__sfvwrite_r+0x470>
    7150:	4806f713          	and	a4,a3,1152
    7154:	08070a63          	beqz	a4,71e8 <__sfvwrite_r+0x1dc>
    7158:	01442603          	lw	a2,20(s0)
    715c:	01042583          	lw	a1,16(s0)
    7160:	00161713          	sll	a4,a2,0x1
    7164:	00c70733          	add	a4,a4,a2
    7168:	40b78933          	sub	s2,a5,a1
    716c:	01f75c13          	srl	s8,a4,0x1f
    7170:	00ec0c33          	add	s8,s8,a4
    7174:	00190793          	add	a5,s2,1
    7178:	401c5c13          	sra	s8,s8,0x1
    717c:	013787b3          	add	a5,a5,s3
    7180:	000c0613          	mv	a2,s8
    7184:	00fc7663          	bgeu	s8,a5,7190 <__sfvwrite_r+0x184>
    7188:	00078c13          	mv	s8,a5
    718c:	00078613          	mv	a2,a5
    7190:	4006f693          	and	a3,a3,1024
    7194:	32068063          	beqz	a3,74b4 <__sfvwrite_r+0x4a8>
    7198:	00060593          	mv	a1,a2
    719c:	000a0513          	mv	a0,s4
    71a0:	921fa0ef          	jal	1ac0 <_malloc_r>
    71a4:	00050c93          	mv	s9,a0
    71a8:	34050e63          	beqz	a0,7504 <__sfvwrite_r+0x4f8>
    71ac:	01042583          	lw	a1,16(s0)
    71b0:	00090613          	mv	a2,s2
    71b4:	a8cfa0ef          	jal	1440 <memcpy>
    71b8:	00c45783          	lhu	a5,12(s0)
    71bc:	b7f7f793          	and	a5,a5,-1153
    71c0:	0807e793          	or	a5,a5,128
    71c4:	00f41623          	sh	a5,12(s0)
    71c8:	012c8533          	add	a0,s9,s2
    71cc:	412c07b3          	sub	a5,s8,s2
    71d0:	01942823          	sw	s9,16(s0)
    71d4:	01842a23          	sw	s8,20(s0)
    71d8:	00a42023          	sw	a0,0(s0)
    71dc:	00098c13          	mv	s8,s3
    71e0:	00f42423          	sw	a5,8(s0)
    71e4:	00098c93          	mv	s9,s3
    71e8:	000c8613          	mv	a2,s9
    71ec:	000b8593          	mv	a1,s7
    71f0:	6a9000ef          	jal	8098 <memmove>
    71f4:	00842703          	lw	a4,8(s0)
    71f8:	00042783          	lw	a5,0(s0)
    71fc:	00098913          	mv	s2,s3
    7200:	41870733          	sub	a4,a4,s8
    7204:	019787b3          	add	a5,a5,s9
    7208:	00e42423          	sw	a4,8(s0)
    720c:	00f42023          	sw	a5,0(s0)
    7210:	00000993          	li	s3,0
    7214:	008b2783          	lw	a5,8(s6)
    7218:	012b8bb3          	add	s7,s7,s2
    721c:	412787b3          	sub	a5,a5,s2
    7220:	00fb2423          	sw	a5,8(s6)
    7224:	02078663          	beqz	a5,7250 <__sfvwrite_r+0x244>
    7228:	00042783          	lw	a5,0(s0)
    722c:	00842703          	lw	a4,8(s0)
    7230:	00c41683          	lh	a3,12(s0)
    7234:	00078513          	mv	a0,a5
    7238:	00070c13          	mv	s8,a4
    723c:	f00992e3          	bnez	s3,7140 <__sfvwrite_r+0x134>
    7240:	0004ab83          	lw	s7,0(s1)
    7244:	0044a983          	lw	s3,4(s1)
    7248:	00848493          	add	s1,s1,8
    724c:	ee9ff06f          	j	7134 <__sfvwrite_r+0x128>
    7250:	00c12b83          	lw	s7,12(sp)
    7254:	00812c03          	lw	s8,8(sp)
    7258:	00412c83          	lw	s9,4(sp)
    725c:	02c12083          	lw	ra,44(sp)
    7260:	02812403          	lw	s0,40(sp)
    7264:	02412483          	lw	s1,36(sp)
    7268:	02012903          	lw	s2,32(sp)
    726c:	01c12983          	lw	s3,28(sp)
    7270:	01412a83          	lw	s5,20(sp)
    7274:	01812a03          	lw	s4,24(sp)
    7278:	01012b03          	lw	s6,16(sp)
    727c:	00000513          	li	a0,0
    7280:	03010113          	add	sp,sp,48
    7284:	00008067          	ret
    7288:	00040593          	mv	a1,s0
    728c:	000a0513          	mv	a0,s4
    7290:	9f9ff0ef          	jal	6c88 <_fflush_r>
    7294:	0a050e63          	beqz	a0,7350 <__sfvwrite_r+0x344>
    7298:	00c41783          	lh	a5,12(s0)
    729c:	00c12b83          	lw	s7,12(sp)
    72a0:	00812c03          	lw	s8,8(sp)
    72a4:	02412483          	lw	s1,36(sp)
    72a8:	02012903          	lw	s2,32(sp)
    72ac:	01c12983          	lw	s3,28(sp)
    72b0:	01412a83          	lw	s5,20(sp)
    72b4:	0407e793          	or	a5,a5,64
    72b8:	00f41623          	sh	a5,12(s0)
    72bc:	02c12083          	lw	ra,44(sp)
    72c0:	02812403          	lw	s0,40(sp)
    72c4:	01812a03          	lw	s4,24(sp)
    72c8:	01012b03          	lw	s6,16(sp)
    72cc:	fff00513          	li	a0,-1
    72d0:	03010113          	add	sp,sp,48
    72d4:	00008067          	ret
    72d8:	00000513          	li	a0,0
    72dc:	00008067          	ret
    72e0:	00000a93          	li	s5,0
    72e4:	00000513          	li	a0,0
    72e8:	00000c13          	li	s8,0
    72ec:	00000993          	li	s3,0
    72f0:	08098263          	beqz	s3,7374 <__sfvwrite_r+0x368>
    72f4:	08050a63          	beqz	a0,7388 <__sfvwrite_r+0x37c>
    72f8:	000a8793          	mv	a5,s5
    72fc:	00098b93          	mv	s7,s3
    7300:	0137f463          	bgeu	a5,s3,7308 <__sfvwrite_r+0x2fc>
    7304:	00078b93          	mv	s7,a5
    7308:	00042503          	lw	a0,0(s0)
    730c:	01042783          	lw	a5,16(s0)
    7310:	00842903          	lw	s2,8(s0)
    7314:	01442683          	lw	a3,20(s0)
    7318:	00a7f663          	bgeu	a5,a0,7324 <__sfvwrite_r+0x318>
    731c:	00d90933          	add	s2,s2,a3
    7320:	09794463          	blt	s2,s7,73a8 <__sfvwrite_r+0x39c>
    7324:	16dbc263          	blt	s7,a3,7488 <__sfvwrite_r+0x47c>
    7328:	02442783          	lw	a5,36(s0)
    732c:	01c42583          	lw	a1,28(s0)
    7330:	000c0613          	mv	a2,s8
    7334:	000a0513          	mv	a0,s4
    7338:	000780e7          	jalr	a5
    733c:	00050913          	mv	s2,a0
    7340:	f4a05ce3          	blez	a0,7298 <__sfvwrite_r+0x28c>
    7344:	412a8ab3          	sub	s5,s5,s2
    7348:	00100513          	li	a0,1
    734c:	f20a8ee3          	beqz	s5,7288 <__sfvwrite_r+0x27c>
    7350:	008b2783          	lw	a5,8(s6)
    7354:	012c0c33          	add	s8,s8,s2
    7358:	412989b3          	sub	s3,s3,s2
    735c:	412787b3          	sub	a5,a5,s2
    7360:	00fb2423          	sw	a5,8(s6)
    7364:	f80796e3          	bnez	a5,72f0 <__sfvwrite_r+0x2e4>
    7368:	00c12b83          	lw	s7,12(sp)
    736c:	00812c03          	lw	s8,8(sp)
    7370:	eedff06f          	j	725c <__sfvwrite_r+0x250>
    7374:	0044a983          	lw	s3,4(s1)
    7378:	00048793          	mv	a5,s1
    737c:	00848493          	add	s1,s1,8
    7380:	fe098ae3          	beqz	s3,7374 <__sfvwrite_r+0x368>
    7384:	0007ac03          	lw	s8,0(a5)
    7388:	00098613          	mv	a2,s3
    738c:	00a00593          	li	a1,10
    7390:	000c0513          	mv	a0,s8
    7394:	1a1000ef          	jal	7d34 <memchr>
    7398:	14050c63          	beqz	a0,74f0 <__sfvwrite_r+0x4e4>
    739c:	00150513          	add	a0,a0,1
    73a0:	41850ab3          	sub	s5,a0,s8
    73a4:	f55ff06f          	j	72f8 <__sfvwrite_r+0x2ec>
    73a8:	000c0593          	mv	a1,s8
    73ac:	00090613          	mv	a2,s2
    73b0:	4e9000ef          	jal	8098 <memmove>
    73b4:	00042783          	lw	a5,0(s0)
    73b8:	00040593          	mv	a1,s0
    73bc:	000a0513          	mv	a0,s4
    73c0:	012787b3          	add	a5,a5,s2
    73c4:	00f42023          	sw	a5,0(s0)
    73c8:	8c1ff0ef          	jal	6c88 <_fflush_r>
    73cc:	f6050ce3          	beqz	a0,7344 <__sfvwrite_r+0x338>
    73d0:	ec9ff06f          	j	7298 <__sfvwrite_r+0x28c>
    73d4:	01042683          	lw	a3,16(s0)
    73d8:	04f6e463          	bltu	a3,a5,7420 <__sfvwrite_r+0x414>
    73dc:	01442583          	lw	a1,20(s0)
    73e0:	04b9e063          	bltu	s3,a1,7420 <__sfvwrite_r+0x414>
    73e4:	00098913          	mv	s2,s3
    73e8:	013af463          	bgeu	s5,s3,73f0 <__sfvwrite_r+0x3e4>
    73ec:	000a8913          	mv	s2,s5
    73f0:	00090513          	mv	a0,s2
    73f4:	65d070ef          	jal	f250 <__modsi3>
    73f8:	02442783          	lw	a5,36(s0)
    73fc:	01c42583          	lw	a1,28(s0)
    7400:	40a906b3          	sub	a3,s2,a0
    7404:	000b8613          	mv	a2,s7
    7408:	000a0513          	mv	a0,s4
    740c:	000780e7          	jalr	a5
    7410:	00050913          	mv	s2,a0
    7414:	04a05a63          	blez	a0,7468 <__sfvwrite_r+0x45c>
    7418:	412989b3          	sub	s3,s3,s2
    741c:	df9ff06f          	j	7214 <__sfvwrite_r+0x208>
    7420:	00070913          	mv	s2,a4
    7424:	00e9f463          	bgeu	s3,a4,742c <__sfvwrite_r+0x420>
    7428:	00098913          	mv	s2,s3
    742c:	00078513          	mv	a0,a5
    7430:	00090613          	mv	a2,s2
    7434:	000b8593          	mv	a1,s7
    7438:	461000ef          	jal	8098 <memmove>
    743c:	00842703          	lw	a4,8(s0)
    7440:	00042783          	lw	a5,0(s0)
    7444:	41270733          	sub	a4,a4,s2
    7448:	012787b3          	add	a5,a5,s2
    744c:	00e42423          	sw	a4,8(s0)
    7450:	00f42023          	sw	a5,0(s0)
    7454:	fc0712e3          	bnez	a4,7418 <__sfvwrite_r+0x40c>
    7458:	00040593          	mv	a1,s0
    745c:	000a0513          	mv	a0,s4
    7460:	829ff0ef          	jal	6c88 <_fflush_r>
    7464:	fa050ae3          	beqz	a0,7418 <__sfvwrite_r+0x40c>
    7468:	00c41783          	lh	a5,12(s0)
    746c:	00c12b83          	lw	s7,12(sp)
    7470:	00812c03          	lw	s8,8(sp)
    7474:	00412c83          	lw	s9,4(sp)
    7478:	e2dff06f          	j	72a4 <__sfvwrite_r+0x298>
    747c:	00098c13          	mv	s8,s3
    7480:	00098c93          	mv	s9,s3
    7484:	d65ff06f          	j	71e8 <__sfvwrite_r+0x1dc>
    7488:	000b8613          	mv	a2,s7
    748c:	000c0593          	mv	a1,s8
    7490:	409000ef          	jal	8098 <memmove>
    7494:	00842703          	lw	a4,8(s0)
    7498:	00042783          	lw	a5,0(s0)
    749c:	000b8913          	mv	s2,s7
    74a0:	41770733          	sub	a4,a4,s7
    74a4:	017787b3          	add	a5,a5,s7
    74a8:	00e42423          	sw	a4,8(s0)
    74ac:	00f42023          	sw	a5,0(s0)
    74b0:	e95ff06f          	j	7344 <__sfvwrite_r+0x338>
    74b4:	000a0513          	mv	a0,s4
    74b8:	508030ef          	jal	a9c0 <_realloc_r>
    74bc:	00050c93          	mv	s9,a0
    74c0:	d00514e3          	bnez	a0,71c8 <__sfvwrite_r+0x1bc>
    74c4:	01042583          	lw	a1,16(s0)
    74c8:	000a0513          	mv	a0,s4
    74cc:	ae8fa0ef          	jal	17b4 <_free_r>
    74d0:	00c41783          	lh	a5,12(s0)
    74d4:	00c00713          	li	a4,12
    74d8:	00c12b83          	lw	s7,12(sp)
    74dc:	00812c03          	lw	s8,8(sp)
    74e0:	00412c83          	lw	s9,4(sp)
    74e4:	00ea2023          	sw	a4,0(s4)
    74e8:	f7f7f793          	and	a5,a5,-129
    74ec:	db9ff06f          	j	72a4 <__sfvwrite_r+0x298>
    74f0:	00198793          	add	a5,s3,1
    74f4:	00078a93          	mv	s5,a5
    74f8:	e05ff06f          	j	72fc <__sfvwrite_r+0x2f0>
    74fc:	00c41783          	lh	a5,12(s0)
    7500:	da5ff06f          	j	72a4 <__sfvwrite_r+0x298>
    7504:	00c00713          	li	a4,12
    7508:	00c41783          	lh	a5,12(s0)
    750c:	00c12b83          	lw	s7,12(sp)
    7510:	00812c03          	lw	s8,8(sp)
    7514:	00412c83          	lw	s9,4(sp)
    7518:	00ea2023          	sw	a4,0(s4)
    751c:	d89ff06f          	j	72a4 <__sfvwrite_r+0x298>

00007520 <_fwalk_sglue>:
    7520:	fd010113          	add	sp,sp,-48
    7524:	03212023          	sw	s2,32(sp)
    7528:	01312e23          	sw	s3,28(sp)
    752c:	01412c23          	sw	s4,24(sp)
    7530:	01512a23          	sw	s5,20(sp)
    7534:	01612823          	sw	s6,16(sp)
    7538:	01712623          	sw	s7,12(sp)
    753c:	02112623          	sw	ra,44(sp)
    7540:	02812423          	sw	s0,40(sp)
    7544:	02912223          	sw	s1,36(sp)
    7548:	00050b13          	mv	s6,a0
    754c:	00058b93          	mv	s7,a1
    7550:	00060a93          	mv	s5,a2
    7554:	00000a13          	li	s4,0
    7558:	00100993          	li	s3,1
    755c:	fff00913          	li	s2,-1
    7560:	004aa483          	lw	s1,4(s5)
    7564:	008aa403          	lw	s0,8(s5)
    7568:	fff48493          	add	s1,s1,-1
    756c:	0204c863          	bltz	s1,759c <_fwalk_sglue+0x7c>
    7570:	00c45783          	lhu	a5,12(s0)
    7574:	00f9fe63          	bgeu	s3,a5,7590 <_fwalk_sglue+0x70>
    7578:	00e41783          	lh	a5,14(s0)
    757c:	00040593          	mv	a1,s0
    7580:	000b0513          	mv	a0,s6
    7584:	01278663          	beq	a5,s2,7590 <_fwalk_sglue+0x70>
    7588:	000b80e7          	jalr	s7
    758c:	00aa6a33          	or	s4,s4,a0
    7590:	fff48493          	add	s1,s1,-1
    7594:	06840413          	add	s0,s0,104
    7598:	fd249ce3          	bne	s1,s2,7570 <_fwalk_sglue+0x50>
    759c:	000aaa83          	lw	s5,0(s5)
    75a0:	fc0a90e3          	bnez	s5,7560 <_fwalk_sglue+0x40>
    75a4:	02c12083          	lw	ra,44(sp)
    75a8:	02812403          	lw	s0,40(sp)
    75ac:	02412483          	lw	s1,36(sp)
    75b0:	02012903          	lw	s2,32(sp)
    75b4:	01c12983          	lw	s3,28(sp)
    75b8:	01412a83          	lw	s5,20(sp)
    75bc:	01012b03          	lw	s6,16(sp)
    75c0:	00c12b83          	lw	s7,12(sp)
    75c4:	000a0513          	mv	a0,s4
    75c8:	01812a03          	lw	s4,24(sp)
    75cc:	03010113          	add	sp,sp,48
    75d0:	00008067          	ret

000075d4 <_putc_r>:
    75d4:	fe010113          	add	sp,sp,-32
    75d8:	00812c23          	sw	s0,24(sp)
    75dc:	01212a23          	sw	s2,20(sp)
    75e0:	00112e23          	sw	ra,28(sp)
    75e4:	00050913          	mv	s2,a0
    75e8:	00060413          	mv	s0,a2
    75ec:	00050663          	beqz	a0,75f8 <_putc_r+0x24>
    75f0:	03452783          	lw	a5,52(a0)
    75f4:	0c078663          	beqz	a5,76c0 <_putc_r+0xec>
    75f8:	06442783          	lw	a5,100(s0)
    75fc:	0017f793          	and	a5,a5,1
    7600:	00079863          	bnez	a5,7610 <_putc_r+0x3c>
    7604:	00c45783          	lhu	a5,12(s0)
    7608:	2007f793          	and	a5,a5,512
    760c:	08078063          	beqz	a5,768c <_putc_r+0xb8>
    7610:	00842783          	lw	a5,8(s0)
    7614:	fff78793          	add	a5,a5,-1
    7618:	00f42423          	sw	a5,8(s0)
    761c:	0007dc63          	bgez	a5,7634 <_putc_r+0x60>
    7620:	01842703          	lw	a4,24(s0)
    7624:	04e7ca63          	blt	a5,a4,7678 <_putc_r+0xa4>
    7628:	0ff5f793          	zext.b	a5,a1
    762c:	00a00713          	li	a4,10
    7630:	04e78463          	beq	a5,a4,7678 <_putc_r+0xa4>
    7634:	00042783          	lw	a5,0(s0)
    7638:	0ff5f913          	zext.b	s2,a1
    763c:	00178713          	add	a4,a5,1
    7640:	00e42023          	sw	a4,0(s0)
    7644:	00b78023          	sb	a1,0(a5)
    7648:	06442783          	lw	a5,100(s0)
    764c:	0017f793          	and	a5,a5,1
    7650:	00079863          	bnez	a5,7660 <_putc_r+0x8c>
    7654:	00c45783          	lhu	a5,12(s0)
    7658:	2007f793          	and	a5,a5,512
    765c:	04078263          	beqz	a5,76a0 <_putc_r+0xcc>
    7660:	01c12083          	lw	ra,28(sp)
    7664:	01812403          	lw	s0,24(sp)
    7668:	00090513          	mv	a0,s2
    766c:	01412903          	lw	s2,20(sp)
    7670:	02010113          	add	sp,sp,32
    7674:	00008067          	ret
    7678:	00090513          	mv	a0,s2
    767c:	00040613          	mv	a2,s0
    7680:	1b4000ef          	jal	7834 <__swbuf_r>
    7684:	00050913          	mv	s2,a0
    7688:	fc1ff06f          	j	7648 <_putc_r+0x74>
    768c:	05842503          	lw	a0,88(s0)
    7690:	00b12623          	sw	a1,12(sp)
    7694:	cc9f90ef          	jal	135c <__retarget_lock_acquire_recursive>
    7698:	00c12583          	lw	a1,12(sp)
    769c:	f75ff06f          	j	7610 <_putc_r+0x3c>
    76a0:	05842503          	lw	a0,88(s0)
    76a4:	cbdf90ef          	jal	1360 <__retarget_lock_release_recursive>
    76a8:	01c12083          	lw	ra,28(sp)
    76ac:	01812403          	lw	s0,24(sp)
    76b0:	00090513          	mv	a0,s2
    76b4:	01412903          	lw	s2,20(sp)
    76b8:	02010113          	add	sp,sp,32
    76bc:	00008067          	ret
    76c0:	00b12623          	sw	a1,12(sp)
    76c4:	8c1ff0ef          	jal	6f84 <__sinit>
    76c8:	00c12583          	lw	a1,12(sp)
    76cc:	f2dff06f          	j	75f8 <_putc_r+0x24>

000076d0 <__sread>:
    76d0:	ff010113          	add	sp,sp,-16
    76d4:	00812423          	sw	s0,8(sp)
    76d8:	00058413          	mv	s0,a1
    76dc:	00e59583          	lh	a1,14(a1)
    76e0:	00112623          	sw	ra,12(sp)
    76e4:	095000ef          	jal	7f78 <_read_r>
    76e8:	02054063          	bltz	a0,7708 <__sread+0x38>
    76ec:	05042783          	lw	a5,80(s0)
    76f0:	00c12083          	lw	ra,12(sp)
    76f4:	00a787b3          	add	a5,a5,a0
    76f8:	04f42823          	sw	a5,80(s0)
    76fc:	00812403          	lw	s0,8(sp)
    7700:	01010113          	add	sp,sp,16
    7704:	00008067          	ret
    7708:	00c45783          	lhu	a5,12(s0)
    770c:	fffff737          	lui	a4,0xfffff
    7710:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7714:	00e7f7b3          	and	a5,a5,a4
    7718:	00c12083          	lw	ra,12(sp)
    771c:	00f41623          	sh	a5,12(s0)
    7720:	00812403          	lw	s0,8(sp)
    7724:	01010113          	add	sp,sp,16
    7728:	00008067          	ret

0000772c <__swrite>:
    772c:	00c59783          	lh	a5,12(a1)
    7730:	fe010113          	add	sp,sp,-32
    7734:	00812c23          	sw	s0,24(sp)
    7738:	00912a23          	sw	s1,20(sp)
    773c:	01212823          	sw	s2,16(sp)
    7740:	01312623          	sw	s3,12(sp)
    7744:	00112e23          	sw	ra,28(sp)
    7748:	1007f713          	and	a4,a5,256
    774c:	00058413          	mv	s0,a1
    7750:	00050493          	mv	s1,a0
    7754:	00060913          	mv	s2,a2
    7758:	00068993          	mv	s3,a3
    775c:	04071063          	bnez	a4,779c <__swrite+0x70>
    7760:	fffff737          	lui	a4,0xfffff
    7764:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7768:	00e7f7b3          	and	a5,a5,a4
    776c:	00e41583          	lh	a1,14(s0)
    7770:	00f41623          	sh	a5,12(s0)
    7774:	01812403          	lw	s0,24(sp)
    7778:	01c12083          	lw	ra,28(sp)
    777c:	00098693          	mv	a3,s3
    7780:	00090613          	mv	a2,s2
    7784:	00c12983          	lw	s3,12(sp)
    7788:	01012903          	lw	s2,16(sp)
    778c:	00048513          	mv	a0,s1
    7790:	01412483          	lw	s1,20(sp)
    7794:	02010113          	add	sp,sp,32
    7798:	09d0006f          	j	8034 <_write_r>
    779c:	00e59583          	lh	a1,14(a1)
    77a0:	00200693          	li	a3,2
    77a4:	00000613          	li	a2,0
    77a8:	76c000ef          	jal	7f14 <_lseek_r>
    77ac:	00c41783          	lh	a5,12(s0)
    77b0:	fb1ff06f          	j	7760 <__swrite+0x34>

000077b4 <__sseek>:
    77b4:	ff010113          	add	sp,sp,-16
    77b8:	00812423          	sw	s0,8(sp)
    77bc:	00058413          	mv	s0,a1
    77c0:	00e59583          	lh	a1,14(a1)
    77c4:	00112623          	sw	ra,12(sp)
    77c8:	74c000ef          	jal	7f14 <_lseek_r>
    77cc:	fff00793          	li	a5,-1
    77d0:	02f50863          	beq	a0,a5,7800 <__sseek+0x4c>
    77d4:	00c45783          	lhu	a5,12(s0)
    77d8:	00001737          	lui	a4,0x1
    77dc:	00c12083          	lw	ra,12(sp)
    77e0:	00e7e7b3          	or	a5,a5,a4
    77e4:	01079793          	sll	a5,a5,0x10
    77e8:	4107d793          	sra	a5,a5,0x10
    77ec:	04a42823          	sw	a0,80(s0)
    77f0:	00f41623          	sh	a5,12(s0)
    77f4:	00812403          	lw	s0,8(sp)
    77f8:	01010113          	add	sp,sp,16
    77fc:	00008067          	ret
    7800:	00c45783          	lhu	a5,12(s0)
    7804:	fffff737          	lui	a4,0xfffff
    7808:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    780c:	00e7f7b3          	and	a5,a5,a4
    7810:	01079793          	sll	a5,a5,0x10
    7814:	4107d793          	sra	a5,a5,0x10
    7818:	00c12083          	lw	ra,12(sp)
    781c:	00f41623          	sh	a5,12(s0)
    7820:	00812403          	lw	s0,8(sp)
    7824:	01010113          	add	sp,sp,16
    7828:	00008067          	ret

0000782c <__sclose>:
    782c:	00e59583          	lh	a1,14(a1)
    7830:	68c0006f          	j	7ebc <_close_r>

00007834 <__swbuf_r>:
    7834:	fe010113          	add	sp,sp,-32
    7838:	00812c23          	sw	s0,24(sp)
    783c:	00912a23          	sw	s1,20(sp)
    7840:	01212823          	sw	s2,16(sp)
    7844:	00112e23          	sw	ra,28(sp)
    7848:	00050913          	mv	s2,a0
    784c:	00058493          	mv	s1,a1
    7850:	00060413          	mv	s0,a2
    7854:	00050663          	beqz	a0,7860 <__swbuf_r+0x2c>
    7858:	03452783          	lw	a5,52(a0)
    785c:	16078063          	beqz	a5,79bc <__swbuf_r+0x188>
    7860:	01842783          	lw	a5,24(s0)
    7864:	00c41703          	lh	a4,12(s0)
    7868:	00f42423          	sw	a5,8(s0)
    786c:	00877793          	and	a5,a4,8
    7870:	08078063          	beqz	a5,78f0 <__swbuf_r+0xbc>
    7874:	01042783          	lw	a5,16(s0)
    7878:	06078c63          	beqz	a5,78f0 <__swbuf_r+0xbc>
    787c:	01312623          	sw	s3,12(sp)
    7880:	01271693          	sll	a3,a4,0x12
    7884:	0ff4f993          	zext.b	s3,s1
    7888:	0ff4f493          	zext.b	s1,s1
    788c:	0806d863          	bgez	a3,791c <__swbuf_r+0xe8>
    7890:	00042703          	lw	a4,0(s0)
    7894:	01442683          	lw	a3,20(s0)
    7898:	40f707b3          	sub	a5,a4,a5
    789c:	0ad7d863          	bge	a5,a3,794c <__swbuf_r+0x118>
    78a0:	00842683          	lw	a3,8(s0)
    78a4:	00170613          	add	a2,a4,1
    78a8:	00c42023          	sw	a2,0(s0)
    78ac:	fff68693          	add	a3,a3,-1
    78b0:	00d42423          	sw	a3,8(s0)
    78b4:	01370023          	sb	s3,0(a4)
    78b8:	01442703          	lw	a4,20(s0)
    78bc:	00178793          	add	a5,a5,1
    78c0:	0cf70263          	beq	a4,a5,7984 <__swbuf_r+0x150>
    78c4:	00c45783          	lhu	a5,12(s0)
    78c8:	0017f793          	and	a5,a5,1
    78cc:	0c079a63          	bnez	a5,79a0 <__swbuf_r+0x16c>
    78d0:	00c12983          	lw	s3,12(sp)
    78d4:	01c12083          	lw	ra,28(sp)
    78d8:	01812403          	lw	s0,24(sp)
    78dc:	01012903          	lw	s2,16(sp)
    78e0:	00048513          	mv	a0,s1
    78e4:	01412483          	lw	s1,20(sp)
    78e8:	02010113          	add	sp,sp,32
    78ec:	00008067          	ret
    78f0:	00040593          	mv	a1,s0
    78f4:	00090513          	mv	a0,s2
    78f8:	0cc000ef          	jal	79c4 <__swsetup_r>
    78fc:	08051e63          	bnez	a0,7998 <__swbuf_r+0x164>
    7900:	00c41703          	lh	a4,12(s0)
    7904:	01312623          	sw	s3,12(sp)
    7908:	01042783          	lw	a5,16(s0)
    790c:	01271693          	sll	a3,a4,0x12
    7910:	0ff4f993          	zext.b	s3,s1
    7914:	0ff4f493          	zext.b	s1,s1
    7918:	f606cce3          	bltz	a3,7890 <__swbuf_r+0x5c>
    791c:	06442683          	lw	a3,100(s0)
    7920:	ffffe637          	lui	a2,0xffffe
    7924:	000025b7          	lui	a1,0x2
    7928:	00b76733          	or	a4,a4,a1
    792c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7930:	00c6f6b3          	and	a3,a3,a2
    7934:	00e41623          	sh	a4,12(s0)
    7938:	00042703          	lw	a4,0(s0)
    793c:	06d42223          	sw	a3,100(s0)
    7940:	01442683          	lw	a3,20(s0)
    7944:	40f707b3          	sub	a5,a4,a5
    7948:	f4d7cce3          	blt	a5,a3,78a0 <__swbuf_r+0x6c>
    794c:	00040593          	mv	a1,s0
    7950:	00090513          	mv	a0,s2
    7954:	b34ff0ef          	jal	6c88 <_fflush_r>
    7958:	02051e63          	bnez	a0,7994 <__swbuf_r+0x160>
    795c:	00042703          	lw	a4,0(s0)
    7960:	00842683          	lw	a3,8(s0)
    7964:	00100793          	li	a5,1
    7968:	00170613          	add	a2,a4,1
    796c:	fff68693          	add	a3,a3,-1
    7970:	00c42023          	sw	a2,0(s0)
    7974:	00d42423          	sw	a3,8(s0)
    7978:	01370023          	sb	s3,0(a4)
    797c:	01442703          	lw	a4,20(s0)
    7980:	f4f712e3          	bne	a4,a5,78c4 <__swbuf_r+0x90>
    7984:	00040593          	mv	a1,s0
    7988:	00090513          	mv	a0,s2
    798c:	afcff0ef          	jal	6c88 <_fflush_r>
    7990:	f40500e3          	beqz	a0,78d0 <__swbuf_r+0x9c>
    7994:	00c12983          	lw	s3,12(sp)
    7998:	fff00493          	li	s1,-1
    799c:	f39ff06f          	j	78d4 <__swbuf_r+0xa0>
    79a0:	00a00793          	li	a5,10
    79a4:	f2f496e3          	bne	s1,a5,78d0 <__swbuf_r+0x9c>
    79a8:	00040593          	mv	a1,s0
    79ac:	00090513          	mv	a0,s2
    79b0:	ad8ff0ef          	jal	6c88 <_fflush_r>
    79b4:	f0050ee3          	beqz	a0,78d0 <__swbuf_r+0x9c>
    79b8:	fddff06f          	j	7994 <__swbuf_r+0x160>
    79bc:	dc8ff0ef          	jal	6f84 <__sinit>
    79c0:	ea1ff06f          	j	7860 <__swbuf_r+0x2c>

000079c4 <__swsetup_r>:
    79c4:	ff010113          	add	sp,sp,-16
    79c8:	00812423          	sw	s0,8(sp)
    79cc:	00912223          	sw	s1,4(sp)
    79d0:	00112623          	sw	ra,12(sp)
    79d4:	7fff9797          	auipc	a5,0x7fff9
    79d8:	d347a783          	lw	a5,-716(a5) # 80000708 <_impure_ptr>
    79dc:	00050493          	mv	s1,a0
    79e0:	00058413          	mv	s0,a1
    79e4:	00078663          	beqz	a5,79f0 <__swsetup_r+0x2c>
    79e8:	0347a703          	lw	a4,52(a5)
    79ec:	0e070c63          	beqz	a4,7ae4 <__swsetup_r+0x120>
    79f0:	00c41783          	lh	a5,12(s0)
    79f4:	0087f713          	and	a4,a5,8
    79f8:	06070a63          	beqz	a4,7a6c <__swsetup_r+0xa8>
    79fc:	01042703          	lw	a4,16(s0)
    7a00:	08070663          	beqz	a4,7a8c <__swsetup_r+0xc8>
    7a04:	0017f693          	and	a3,a5,1
    7a08:	02068863          	beqz	a3,7a38 <__swsetup_r+0x74>
    7a0c:	01442683          	lw	a3,20(s0)
    7a10:	00042423          	sw	zero,8(s0)
    7a14:	00000513          	li	a0,0
    7a18:	40d006b3          	neg	a3,a3
    7a1c:	00d42c23          	sw	a3,24(s0)
    7a20:	02070a63          	beqz	a4,7a54 <__swsetup_r+0x90>
    7a24:	00c12083          	lw	ra,12(sp)
    7a28:	00812403          	lw	s0,8(sp)
    7a2c:	00412483          	lw	s1,4(sp)
    7a30:	01010113          	add	sp,sp,16
    7a34:	00008067          	ret
    7a38:	0027f693          	and	a3,a5,2
    7a3c:	00000613          	li	a2,0
    7a40:	00069463          	bnez	a3,7a48 <__swsetup_r+0x84>
    7a44:	01442603          	lw	a2,20(s0)
    7a48:	00c42423          	sw	a2,8(s0)
    7a4c:	00000513          	li	a0,0
    7a50:	fc071ae3          	bnez	a4,7a24 <__swsetup_r+0x60>
    7a54:	0807f713          	and	a4,a5,128
    7a58:	fc0706e3          	beqz	a4,7a24 <__swsetup_r+0x60>
    7a5c:	0407e793          	or	a5,a5,64
    7a60:	00f41623          	sh	a5,12(s0)
    7a64:	fff00513          	li	a0,-1
    7a68:	fbdff06f          	j	7a24 <__swsetup_r+0x60>
    7a6c:	0107f713          	and	a4,a5,16
    7a70:	08070063          	beqz	a4,7af0 <__swsetup_r+0x12c>
    7a74:	0047f713          	and	a4,a5,4
    7a78:	02071c63          	bnez	a4,7ab0 <__swsetup_r+0xec>
    7a7c:	01042703          	lw	a4,16(s0)
    7a80:	0087e793          	or	a5,a5,8
    7a84:	00f41623          	sh	a5,12(s0)
    7a88:	f6071ee3          	bnez	a4,7a04 <__swsetup_r+0x40>
    7a8c:	2807f693          	and	a3,a5,640
    7a90:	20000613          	li	a2,512
    7a94:	f6c688e3          	beq	a3,a2,7a04 <__swsetup_r+0x40>
    7a98:	00040593          	mv	a1,s0
    7a9c:	00048513          	mv	a0,s1
    7aa0:	6cc030ef          	jal	b16c <__smakebuf_r>
    7aa4:	00c41783          	lh	a5,12(s0)
    7aa8:	01042703          	lw	a4,16(s0)
    7aac:	f59ff06f          	j	7a04 <__swsetup_r+0x40>
    7ab0:	03042583          	lw	a1,48(s0)
    7ab4:	00058e63          	beqz	a1,7ad0 <__swsetup_r+0x10c>
    7ab8:	04040713          	add	a4,s0,64
    7abc:	00e58863          	beq	a1,a4,7acc <__swsetup_r+0x108>
    7ac0:	00048513          	mv	a0,s1
    7ac4:	cf1f90ef          	jal	17b4 <_free_r>
    7ac8:	00c41783          	lh	a5,12(s0)
    7acc:	02042823          	sw	zero,48(s0)
    7ad0:	01042703          	lw	a4,16(s0)
    7ad4:	fdb7f793          	and	a5,a5,-37
    7ad8:	00042223          	sw	zero,4(s0)
    7adc:	00e42023          	sw	a4,0(s0)
    7ae0:	fa1ff06f          	j	7a80 <__swsetup_r+0xbc>
    7ae4:	00078513          	mv	a0,a5
    7ae8:	c9cff0ef          	jal	6f84 <__sinit>
    7aec:	f05ff06f          	j	79f0 <__swsetup_r+0x2c>
    7af0:	00900713          	li	a4,9
    7af4:	00e4a023          	sw	a4,0(s1)
    7af8:	0407e793          	or	a5,a5,64
    7afc:	00f41623          	sh	a5,12(s0)
    7b00:	fff00513          	li	a0,-1
    7b04:	f21ff06f          	j	7a24 <__swsetup_r+0x60>

00007b08 <__fputwc>:
    7b08:	fc010113          	add	sp,sp,-64
    7b0c:	02812c23          	sw	s0,56(sp)
    7b10:	03412423          	sw	s4,40(sp)
    7b14:	03512223          	sw	s5,36(sp)
    7b18:	02112e23          	sw	ra,60(sp)
    7b1c:	02912a23          	sw	s1,52(sp)
    7b20:	03312623          	sw	s3,44(sp)
    7b24:	00050a13          	mv	s4,a0
    7b28:	00058a93          	mv	s5,a1
    7b2c:	00060413          	mv	s0,a2
    7b30:	374000ef          	jal	7ea4 <__locale_mb_cur_max>
    7b34:	00100793          	li	a5,1
    7b38:	02f51663          	bne	a0,a5,7b64 <__fputwc+0x5c>
    7b3c:	fffa8793          	add	a5,s5,-1
    7b40:	0fe00713          	li	a4,254
    7b44:	02f76063          	bltu	a4,a5,7b64 <__fputwc+0x5c>
    7b48:	03212823          	sw	s2,48(sp)
    7b4c:	03612023          	sw	s6,32(sp)
    7b50:	01712e23          	sw	s7,28(sp)
    7b54:	01510423          	sb	s5,8(sp)
    7b58:	00100993          	li	s3,1
    7b5c:	00810493          	add	s1,sp,8
    7b60:	0380006f          	j	7b98 <__fputwc+0x90>
    7b64:	00810493          	add	s1,sp,8
    7b68:	05c40693          	add	a3,s0,92
    7b6c:	000a8613          	mv	a2,s5
    7b70:	00048593          	mv	a1,s1
    7b74:	000a0513          	mv	a0,s4
    7b78:	3e8030ef          	jal	af60 <_wcrtomb_r>
    7b7c:	fff00793          	li	a5,-1
    7b80:	00050993          	mv	s3,a0
    7b84:	0cf50a63          	beq	a0,a5,7c58 <__fputwc+0x150>
    7b88:	0a050663          	beqz	a0,7c34 <__fputwc+0x12c>
    7b8c:	03212823          	sw	s2,48(sp)
    7b90:	03612023          	sw	s6,32(sp)
    7b94:	01712e23          	sw	s7,28(sp)
    7b98:	00000913          	li	s2,0
    7b9c:	fff00b13          	li	s6,-1
    7ba0:	00a00b93          	li	s7,10
    7ba4:	0200006f          	j	7bc4 <__fputwc+0xbc>
    7ba8:	00042783          	lw	a5,0(s0)
    7bac:	00178693          	add	a3,a5,1
    7bb0:	00d42023          	sw	a3,0(s0)
    7bb4:	00e78023          	sb	a4,0(a5)
    7bb8:	00190913          	add	s2,s2,1
    7bbc:	00148493          	add	s1,s1,1
    7bc0:	07397463          	bgeu	s2,s3,7c28 <__fputwc+0x120>
    7bc4:	00842783          	lw	a5,8(s0)
    7bc8:	0004c703          	lbu	a4,0(s1)
    7bcc:	fff78793          	add	a5,a5,-1
    7bd0:	00f42423          	sw	a5,8(s0)
    7bd4:	fc07dae3          	bgez	a5,7ba8 <__fputwc+0xa0>
    7bd8:	01842683          	lw	a3,24(s0)
    7bdc:	00040613          	mv	a2,s0
    7be0:	00070593          	mv	a1,a4
    7be4:	000a0513          	mv	a0,s4
    7be8:	00d7c463          	blt	a5,a3,7bf0 <__fputwc+0xe8>
    7bec:	fb771ee3          	bne	a4,s7,7ba8 <__fputwc+0xa0>
    7bf0:	c45ff0ef          	jal	7834 <__swbuf_r>
    7bf4:	fd6512e3          	bne	a0,s6,7bb8 <__fputwc+0xb0>
    7bf8:	03012903          	lw	s2,48(sp)
    7bfc:	02012b03          	lw	s6,32(sp)
    7c00:	01c12b83          	lw	s7,28(sp)
    7c04:	03c12083          	lw	ra,60(sp)
    7c08:	03812403          	lw	s0,56(sp)
    7c0c:	03412483          	lw	s1,52(sp)
    7c10:	02c12983          	lw	s3,44(sp)
    7c14:	02812a03          	lw	s4,40(sp)
    7c18:	02412a83          	lw	s5,36(sp)
    7c1c:	fff00513          	li	a0,-1
    7c20:	04010113          	add	sp,sp,64
    7c24:	00008067          	ret
    7c28:	03012903          	lw	s2,48(sp)
    7c2c:	02012b03          	lw	s6,32(sp)
    7c30:	01c12b83          	lw	s7,28(sp)
    7c34:	03c12083          	lw	ra,60(sp)
    7c38:	03812403          	lw	s0,56(sp)
    7c3c:	03412483          	lw	s1,52(sp)
    7c40:	02c12983          	lw	s3,44(sp)
    7c44:	02812a03          	lw	s4,40(sp)
    7c48:	000a8513          	mv	a0,s5
    7c4c:	02412a83          	lw	s5,36(sp)
    7c50:	04010113          	add	sp,sp,64
    7c54:	00008067          	ret
    7c58:	00c45783          	lhu	a5,12(s0)
    7c5c:	0407e793          	or	a5,a5,64
    7c60:	00f41623          	sh	a5,12(s0)
    7c64:	fa1ff06f          	j	7c04 <__fputwc+0xfc>

00007c68 <_fputwc_r>:
    7c68:	06462783          	lw	a5,100(a2)
    7c6c:	fe010113          	add	sp,sp,-32
    7c70:	00812c23          	sw	s0,24(sp)
    7c74:	00912a23          	sw	s1,20(sp)
    7c78:	0017f713          	and	a4,a5,1
    7c7c:	00112e23          	sw	ra,28(sp)
    7c80:	00c61783          	lh	a5,12(a2)
    7c84:	00060413          	mv	s0,a2
    7c88:	00050493          	mv	s1,a0
    7c8c:	00071663          	bnez	a4,7c98 <_fputwc_r+0x30>
    7c90:	2007f713          	and	a4,a5,512
    7c94:	08070463          	beqz	a4,7d1c <_fputwc_r+0xb4>
    7c98:	01279713          	sll	a4,a5,0x12
    7c9c:	02074063          	bltz	a4,7cbc <_fputwc_r+0x54>
    7ca0:	06442703          	lw	a4,100(s0)
    7ca4:	000026b7          	lui	a3,0x2
    7ca8:	00d7e7b3          	or	a5,a5,a3
    7cac:	000026b7          	lui	a3,0x2
    7cb0:	00d76733          	or	a4,a4,a3
    7cb4:	00f41623          	sh	a5,12(s0)
    7cb8:	06e42223          	sw	a4,100(s0)
    7cbc:	00048513          	mv	a0,s1
    7cc0:	00040613          	mv	a2,s0
    7cc4:	e45ff0ef          	jal	7b08 <__fputwc>
    7cc8:	06442783          	lw	a5,100(s0)
    7ccc:	00050493          	mv	s1,a0
    7cd0:	0017f793          	and	a5,a5,1
    7cd4:	00079863          	bnez	a5,7ce4 <_fputwc_r+0x7c>
    7cd8:	00c45783          	lhu	a5,12(s0)
    7cdc:	2007f793          	and	a5,a5,512
    7ce0:	00078e63          	beqz	a5,7cfc <_fputwc_r+0x94>
    7ce4:	01c12083          	lw	ra,28(sp)
    7ce8:	01812403          	lw	s0,24(sp)
    7cec:	00048513          	mv	a0,s1
    7cf0:	01412483          	lw	s1,20(sp)
    7cf4:	02010113          	add	sp,sp,32
    7cf8:	00008067          	ret
    7cfc:	05842503          	lw	a0,88(s0)
    7d00:	e60f90ef          	jal	1360 <__retarget_lock_release_recursive>
    7d04:	01c12083          	lw	ra,28(sp)
    7d08:	01812403          	lw	s0,24(sp)
    7d0c:	00048513          	mv	a0,s1
    7d10:	01412483          	lw	s1,20(sp)
    7d14:	02010113          	add	sp,sp,32
    7d18:	00008067          	ret
    7d1c:	05862503          	lw	a0,88(a2)
    7d20:	00b12623          	sw	a1,12(sp)
    7d24:	e38f90ef          	jal	135c <__retarget_lock_acquire_recursive>
    7d28:	00c41783          	lh	a5,12(s0)
    7d2c:	00c12583          	lw	a1,12(sp)
    7d30:	f69ff06f          	j	7c98 <_fputwc_r+0x30>

00007d34 <memchr>:
    7d34:	00357793          	and	a5,a0,3
    7d38:	0ff5f693          	zext.b	a3,a1
    7d3c:	02078a63          	beqz	a5,7d70 <memchr+0x3c>
    7d40:	fff60793          	add	a5,a2,-1
    7d44:	02060e63          	beqz	a2,7d80 <memchr+0x4c>
    7d48:	fff00613          	li	a2,-1
    7d4c:	0180006f          	j	7d64 <memchr+0x30>
    7d50:	00150513          	add	a0,a0,1
    7d54:	00357713          	and	a4,a0,3
    7d58:	00070e63          	beqz	a4,7d74 <memchr+0x40>
    7d5c:	fff78793          	add	a5,a5,-1
    7d60:	02c78063          	beq	a5,a2,7d80 <memchr+0x4c>
    7d64:	00054703          	lbu	a4,0(a0)
    7d68:	fed714e3          	bne	a4,a3,7d50 <memchr+0x1c>
    7d6c:	00008067          	ret
    7d70:	00060793          	mv	a5,a2
    7d74:	00300713          	li	a4,3
    7d78:	00f76863          	bltu	a4,a5,7d88 <memchr+0x54>
    7d7c:	06079063          	bnez	a5,7ddc <memchr+0xa8>
    7d80:	00000513          	li	a0,0
    7d84:	00008067          	ret
    7d88:	0ff5f593          	zext.b	a1,a1
    7d8c:	00859713          	sll	a4,a1,0x8
    7d90:	00b705b3          	add	a1,a4,a1
    7d94:	01059713          	sll	a4,a1,0x10
    7d98:	feff08b7          	lui	a7,0xfeff0
    7d9c:	80808837          	lui	a6,0x80808
    7da0:	00e585b3          	add	a1,a1,a4
    7da4:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7da8:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7dac:	00300313          	li	t1,3
    7db0:	0100006f          	j	7dc0 <memchr+0x8c>
    7db4:	ffc78793          	add	a5,a5,-4
    7db8:	00450513          	add	a0,a0,4
    7dbc:	fcf370e3          	bgeu	t1,a5,7d7c <memchr+0x48>
    7dc0:	00052703          	lw	a4,0(a0)
    7dc4:	00e5c733          	xor	a4,a1,a4
    7dc8:	01170633          	add	a2,a4,a7
    7dcc:	fff74713          	not	a4,a4
    7dd0:	00e67733          	and	a4,a2,a4
    7dd4:	01077733          	and	a4,a4,a6
    7dd8:	fc070ee3          	beqz	a4,7db4 <memchr+0x80>
    7ddc:	00f507b3          	add	a5,a0,a5
    7de0:	00c0006f          	j	7dec <memchr+0xb8>
    7de4:	00150513          	add	a0,a0,1
    7de8:	f8f50ce3          	beq	a0,a5,7d80 <memchr+0x4c>
    7dec:	00054703          	lbu	a4,0(a0)
    7df0:	fed71ae3          	bne	a4,a3,7de4 <memchr+0xb0>
    7df4:	00008067          	ret

00007df8 <strncpy>:
    7df8:	00a5e7b3          	or	a5,a1,a0
    7dfc:	0037f793          	and	a5,a5,3
    7e00:	00079663          	bnez	a5,7e0c <strncpy+0x14>
    7e04:	00300793          	li	a5,3
    7e08:	04c7e663          	bltu	a5,a2,7e54 <strncpy+0x5c>
    7e0c:	00050713          	mv	a4,a0
    7e10:	01c0006f          	j	7e2c <strncpy+0x34>
    7e14:	fff5c683          	lbu	a3,-1(a1) # 1fff <_malloc_r+0x53f>
    7e18:	fff60813          	add	a6,a2,-1
    7e1c:	fed78fa3          	sb	a3,-1(a5)
    7e20:	00068e63          	beqz	a3,7e3c <strncpy+0x44>
    7e24:	00078713          	mv	a4,a5
    7e28:	00080613          	mv	a2,a6
    7e2c:	00158593          	add	a1,a1,1
    7e30:	00170793          	add	a5,a4,1
    7e34:	fe0610e3          	bnez	a2,7e14 <strncpy+0x1c>
    7e38:	00008067          	ret
    7e3c:	00c70733          	add	a4,a4,a2
    7e40:	06080063          	beqz	a6,7ea0 <strncpy+0xa8>
    7e44:	00178793          	add	a5,a5,1
    7e48:	fe078fa3          	sb	zero,-1(a5)
    7e4c:	fee79ce3          	bne	a5,a4,7e44 <strncpy+0x4c>
    7e50:	00008067          	ret
    7e54:	feff0337          	lui	t1,0xfeff0
    7e58:	808088b7          	lui	a7,0x80808
    7e5c:	00050713          	mv	a4,a0
    7e60:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7e64:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7e68:	00300e13          	li	t3,3
    7e6c:	0180006f          	j	7e84 <strncpy+0x8c>
    7e70:	00d72023          	sw	a3,0(a4)
    7e74:	ffc60613          	add	a2,a2,-4
    7e78:	00470713          	add	a4,a4,4
    7e7c:	00458593          	add	a1,a1,4
    7e80:	face76e3          	bgeu	t3,a2,7e2c <strncpy+0x34>
    7e84:	0005a683          	lw	a3,0(a1)
    7e88:	006687b3          	add	a5,a3,t1
    7e8c:	fff6c813          	not	a6,a3
    7e90:	0107f7b3          	and	a5,a5,a6
    7e94:	0117f7b3          	and	a5,a5,a7
    7e98:	fc078ce3          	beqz	a5,7e70 <strncpy+0x78>
    7e9c:	f91ff06f          	j	7e2c <strncpy+0x34>
    7ea0:	00008067          	ret

00007ea4 <__locale_mb_cur_max>:
    7ea4:	7fff8517          	auipc	a0,0x7fff8
    7ea8:	7b854503          	lbu	a0,1976(a0) # 8000065c <__global_locale+0x128>
    7eac:	00008067          	ret

00007eb0 <_localeconv_r>:
    7eb0:	7fff8517          	auipc	a0,0x7fff8
    7eb4:	77450513          	add	a0,a0,1908 # 80000624 <__global_locale+0xf0>
    7eb8:	00008067          	ret

00007ebc <_close_r>:
    7ebc:	ff010113          	add	sp,sp,-16
    7ec0:	00812423          	sw	s0,8(sp)
    7ec4:	00050413          	mv	s0,a0
    7ec8:	00058513          	mv	a0,a1
    7ecc:	7fff9797          	auipc	a5,0x7fff9
    7ed0:	8407a823          	sw	zero,-1968(a5) # 8000071c <errno>
    7ed4:	00112623          	sw	ra,12(sp)
    7ed8:	85cf90ef          	jal	f34 <_close>
    7edc:	fff00793          	li	a5,-1
    7ee0:	00f50a63          	beq	a0,a5,7ef4 <_close_r+0x38>
    7ee4:	00c12083          	lw	ra,12(sp)
    7ee8:	00812403          	lw	s0,8(sp)
    7eec:	01010113          	add	sp,sp,16
    7ef0:	00008067          	ret
    7ef4:	7fff9797          	auipc	a5,0x7fff9
    7ef8:	8287a783          	lw	a5,-2008(a5) # 8000071c <errno>
    7efc:	fe0784e3          	beqz	a5,7ee4 <_close_r+0x28>
    7f00:	00c12083          	lw	ra,12(sp)
    7f04:	00f42023          	sw	a5,0(s0)
    7f08:	00812403          	lw	s0,8(sp)
    7f0c:	01010113          	add	sp,sp,16
    7f10:	00008067          	ret

00007f14 <_lseek_r>:
    7f14:	ff010113          	add	sp,sp,-16
    7f18:	00058713          	mv	a4,a1
    7f1c:	00812423          	sw	s0,8(sp)
    7f20:	00060593          	mv	a1,a2
    7f24:	00050413          	mv	s0,a0
    7f28:	00068613          	mv	a2,a3
    7f2c:	00070513          	mv	a0,a4
    7f30:	7fff8797          	auipc	a5,0x7fff8
    7f34:	7e07a623          	sw	zero,2028(a5) # 8000071c <errno>
    7f38:	00112623          	sw	ra,12(sp)
    7f3c:	834f90ef          	jal	f70 <_lseek>
    7f40:	fff00793          	li	a5,-1
    7f44:	00f50a63          	beq	a0,a5,7f58 <_lseek_r+0x44>
    7f48:	00c12083          	lw	ra,12(sp)
    7f4c:	00812403          	lw	s0,8(sp)
    7f50:	01010113          	add	sp,sp,16
    7f54:	00008067          	ret
    7f58:	7fff8797          	auipc	a5,0x7fff8
    7f5c:	7c47a783          	lw	a5,1988(a5) # 8000071c <errno>
    7f60:	fe0784e3          	beqz	a5,7f48 <_lseek_r+0x34>
    7f64:	00c12083          	lw	ra,12(sp)
    7f68:	00f42023          	sw	a5,0(s0)
    7f6c:	00812403          	lw	s0,8(sp)
    7f70:	01010113          	add	sp,sp,16
    7f74:	00008067          	ret

00007f78 <_read_r>:
    7f78:	ff010113          	add	sp,sp,-16
    7f7c:	00058713          	mv	a4,a1
    7f80:	00812423          	sw	s0,8(sp)
    7f84:	00060593          	mv	a1,a2
    7f88:	00050413          	mv	s0,a0
    7f8c:	00068613          	mv	a2,a3
    7f90:	00070513          	mv	a0,a4
    7f94:	7fff8797          	auipc	a5,0x7fff8
    7f98:	7807a423          	sw	zero,1928(a5) # 8000071c <errno>
    7f9c:	00112623          	sw	ra,12(sp)
    7fa0:	fd9f80ef          	jal	f78 <_read>
    7fa4:	fff00793          	li	a5,-1
    7fa8:	00f50a63          	beq	a0,a5,7fbc <_read_r+0x44>
    7fac:	00c12083          	lw	ra,12(sp)
    7fb0:	00812403          	lw	s0,8(sp)
    7fb4:	01010113          	add	sp,sp,16
    7fb8:	00008067          	ret
    7fbc:	7fff8797          	auipc	a5,0x7fff8
    7fc0:	7607a783          	lw	a5,1888(a5) # 8000071c <errno>
    7fc4:	fe0784e3          	beqz	a5,7fac <_read_r+0x34>
    7fc8:	00c12083          	lw	ra,12(sp)
    7fcc:	00f42023          	sw	a5,0(s0)
    7fd0:	00812403          	lw	s0,8(sp)
    7fd4:	01010113          	add	sp,sp,16
    7fd8:	00008067          	ret

00007fdc <_sbrk_r>:
    7fdc:	ff010113          	add	sp,sp,-16
    7fe0:	00812423          	sw	s0,8(sp)
    7fe4:	00050413          	mv	s0,a0
    7fe8:	00058513          	mv	a0,a1
    7fec:	7fff8797          	auipc	a5,0x7fff8
    7ff0:	7207a823          	sw	zero,1840(a5) # 8000071c <errno>
    7ff4:	00112623          	sw	ra,12(sp)
    7ff8:	900f90ef          	jal	10f8 <_sbrk>
    7ffc:	fff00793          	li	a5,-1
    8000:	00f50a63          	beq	a0,a5,8014 <_sbrk_r+0x38>
    8004:	00c12083          	lw	ra,12(sp)
    8008:	00812403          	lw	s0,8(sp)
    800c:	01010113          	add	sp,sp,16
    8010:	00008067          	ret
    8014:	7fff8797          	auipc	a5,0x7fff8
    8018:	7087a783          	lw	a5,1800(a5) # 8000071c <errno>
    801c:	fe0784e3          	beqz	a5,8004 <_sbrk_r+0x28>
    8020:	00c12083          	lw	ra,12(sp)
    8024:	00f42023          	sw	a5,0(s0)
    8028:	00812403          	lw	s0,8(sp)
    802c:	01010113          	add	sp,sp,16
    8030:	00008067          	ret

00008034 <_write_r>:
    8034:	ff010113          	add	sp,sp,-16
    8038:	00058713          	mv	a4,a1
    803c:	00812423          	sw	s0,8(sp)
    8040:	00060593          	mv	a1,a2
    8044:	00050413          	mv	s0,a0
    8048:	00068613          	mv	a2,a3
    804c:	00070513          	mv	a0,a4
    8050:	7fff8797          	auipc	a5,0x7fff8
    8054:	6c07a623          	sw	zero,1740(a5) # 8000071c <errno>
    8058:	00112623          	sw	ra,12(sp)
    805c:	ff9f80ef          	jal	1054 <_write>
    8060:	fff00793          	li	a5,-1
    8064:	00f50a63          	beq	a0,a5,8078 <_write_r+0x44>
    8068:	00c12083          	lw	ra,12(sp)
    806c:	00812403          	lw	s0,8(sp)
    8070:	01010113          	add	sp,sp,16
    8074:	00008067          	ret
    8078:	7fff8797          	auipc	a5,0x7fff8
    807c:	6a47a783          	lw	a5,1700(a5) # 8000071c <errno>
    8080:	fe0784e3          	beqz	a5,8068 <_write_r+0x34>
    8084:	00c12083          	lw	ra,12(sp)
    8088:	00f42023          	sw	a5,0(s0)
    808c:	00812403          	lw	s0,8(sp)
    8090:	01010113          	add	sp,sp,16
    8094:	00008067          	ret

00008098 <memmove>:
    8098:	02a5f663          	bgeu	a1,a0,80c4 <memmove+0x2c>
    809c:	00c58733          	add	a4,a1,a2
    80a0:	02e57263          	bgeu	a0,a4,80c4 <memmove+0x2c>
    80a4:	00c507b3          	add	a5,a0,a2
    80a8:	04060663          	beqz	a2,80f4 <memmove+0x5c>
    80ac:	fff74683          	lbu	a3,-1(a4)
    80b0:	fff78793          	add	a5,a5,-1
    80b4:	fff70713          	add	a4,a4,-1
    80b8:	00d78023          	sb	a3,0(a5)
    80bc:	fef518e3          	bne	a0,a5,80ac <memmove+0x14>
    80c0:	00008067          	ret
    80c4:	00f00793          	li	a5,15
    80c8:	02c7e863          	bltu	a5,a2,80f8 <memmove+0x60>
    80cc:	00050793          	mv	a5,a0
    80d0:	fff60693          	add	a3,a2,-1
    80d4:	0c060263          	beqz	a2,8198 <memmove+0x100>
    80d8:	00168693          	add	a3,a3,1 # 2001 <_malloc_r+0x541>
    80dc:	00d786b3          	add	a3,a5,a3
    80e0:	0005c703          	lbu	a4,0(a1)
    80e4:	00178793          	add	a5,a5,1
    80e8:	00158593          	add	a1,a1,1
    80ec:	fee78fa3          	sb	a4,-1(a5)
    80f0:	fed798e3          	bne	a5,a3,80e0 <memmove+0x48>
    80f4:	00008067          	ret
    80f8:	00b567b3          	or	a5,a0,a1
    80fc:	0037f793          	and	a5,a5,3
    8100:	08079663          	bnez	a5,818c <memmove+0xf4>
    8104:	ff060893          	add	a7,a2,-16
    8108:	ff08f893          	and	a7,a7,-16
    810c:	01088893          	add	a7,a7,16
    8110:	011506b3          	add	a3,a0,a7
    8114:	00058713          	mv	a4,a1
    8118:	00050793          	mv	a5,a0
    811c:	00072803          	lw	a6,0(a4)
    8120:	01070713          	add	a4,a4,16
    8124:	01078793          	add	a5,a5,16
    8128:	ff07a823          	sw	a6,-16(a5)
    812c:	ff472803          	lw	a6,-12(a4)
    8130:	ff07aa23          	sw	a6,-12(a5)
    8134:	ff872803          	lw	a6,-8(a4)
    8138:	ff07ac23          	sw	a6,-8(a5)
    813c:	ffc72803          	lw	a6,-4(a4)
    8140:	ff07ae23          	sw	a6,-4(a5)
    8144:	fcd79ce3          	bne	a5,a3,811c <memmove+0x84>
    8148:	00c67813          	and	a6,a2,12
    814c:	011585b3          	add	a1,a1,a7
    8150:	00f67713          	and	a4,a2,15
    8154:	04080463          	beqz	a6,819c <memmove+0x104>
    8158:	ffc70813          	add	a6,a4,-4
    815c:	ffc87813          	and	a6,a6,-4
    8160:	00480813          	add	a6,a6,4
    8164:	010687b3          	add	a5,a3,a6
    8168:	00058713          	mv	a4,a1
    816c:	00072883          	lw	a7,0(a4)
    8170:	00468693          	add	a3,a3,4
    8174:	00470713          	add	a4,a4,4
    8178:	ff16ae23          	sw	a7,-4(a3)
    817c:	fef698e3          	bne	a3,a5,816c <memmove+0xd4>
    8180:	00367613          	and	a2,a2,3
    8184:	010585b3          	add	a1,a1,a6
    8188:	f49ff06f          	j	80d0 <memmove+0x38>
    818c:	fff60693          	add	a3,a2,-1
    8190:	00050793          	mv	a5,a0
    8194:	f45ff06f          	j	80d8 <memmove+0x40>
    8198:	00008067          	ret
    819c:	00070613          	mv	a2,a4
    81a0:	f31ff06f          	j	80d0 <memmove+0x38>

000081a4 <frexp>:
    81a4:	ff010113          	add	sp,sp,-16
    81a8:	00912223          	sw	s1,4(sp)
    81ac:	800004b7          	lui	s1,0x80000
    81b0:	00812423          	sw	s0,8(sp)
    81b4:	00112623          	sw	ra,12(sp)
    81b8:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    81bc:	00060413          	mv	s0,a2
    81c0:	00062023          	sw	zero,0(a2)
    81c4:	00b4f6b3          	and	a3,s1,a1
    81c8:	7ff00637          	lui	a2,0x7ff00
    81cc:	00058793          	mv	a5,a1
    81d0:	00050713          	mv	a4,a0
    81d4:	04c6f063          	bgeu	a3,a2,8214 <frexp+0x70>
    81d8:	00a6e633          	or	a2,a3,a0
    81dc:	02060c63          	beqz	a2,8214 <frexp+0x70>
    81e0:	0145d613          	srl	a2,a1,0x14
    81e4:	7ff67613          	and	a2,a2,2047
    81e8:	04060463          	beqz	a2,8230 <frexp+0x8c>
    81ec:	00000593          	li	a1,0
    81f0:	80100637          	lui	a2,0x80100
    81f4:	4146d693          	sra	a3,a3,0x14
    81f8:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    81fc:	c0268693          	add	a3,a3,-1022
    8200:	00c7f7b3          	and	a5,a5,a2
    8204:	00b686b3          	add	a3,a3,a1
    8208:	3fe00637          	lui	a2,0x3fe00
    820c:	00c7e7b3          	or	a5,a5,a2
    8210:	00d42023          	sw	a3,0(s0)
    8214:	00c12083          	lw	ra,12(sp)
    8218:	00812403          	lw	s0,8(sp)
    821c:	00412483          	lw	s1,4(sp)
    8220:	00070513          	mv	a0,a4
    8224:	00078593          	mv	a1,a5
    8228:	01010113          	add	sp,sp,16
    822c:	00008067          	ret
    8230:	7fff8797          	auipc	a5,0x7fff8
    8234:	49078793          	add	a5,a5,1168 # 800006c0 <__global_locale+0x18c>
    8238:	0047a683          	lw	a3,4(a5)
    823c:	0007a603          	lw	a2,0(a5)
    8240:	009050ef          	jal	da48 <__muldf3>
    8244:	00058793          	mv	a5,a1
    8248:	00b4f6b3          	and	a3,s1,a1
    824c:	00050713          	mv	a4,a0
    8250:	fca00593          	li	a1,-54
    8254:	f9dff06f          	j	81f0 <frexp+0x4c>

00008258 <quorem>:
    8258:	fb010113          	add	sp,sp,-80
    825c:	04912223          	sw	s1,68(sp)
    8260:	01052783          	lw	a5,16(a0)
    8264:	0105a483          	lw	s1,16(a1)
    8268:	04112623          	sw	ra,76(sp)
    826c:	00b12423          	sw	a1,8(sp)
    8270:	2097ca63          	blt	a5,s1,8484 <quorem+0x22c>
    8274:	fff48493          	add	s1,s1,-1
    8278:	03512a23          	sw	s5,52(sp)
    827c:	03812423          	sw	s8,40(sp)
    8280:	00249a93          	sll	s5,s1,0x2
    8284:	01458c13          	add	s8,a1,20
    8288:	05212023          	sw	s2,64(sp)
    828c:	03312e23          	sw	s3,60(sp)
    8290:	015c0933          	add	s2,s8,s5
    8294:	01450993          	add	s3,a0,20
    8298:	015987b3          	add	a5,s3,s5
    829c:	03712623          	sw	s7,44(sp)
    82a0:	00092b83          	lw	s7,0(s2)
    82a4:	03912223          	sw	s9,36(sp)
    82a8:	0007ac83          	lw	s9,0(a5)
    82ac:	001b8b93          	add	s7,s7,1
    82b0:	03412c23          	sw	s4,56(sp)
    82b4:	000b8593          	mv	a1,s7
    82b8:	00050a13          	mv	s4,a0
    82bc:	000c8513          	mv	a0,s9
    82c0:	04812423          	sw	s0,72(sp)
    82c4:	00f12623          	sw	a5,12(sp)
    82c8:	70d060ef          	jal	f1d4 <__hidden___udivsi3>
    82cc:	00050413          	mv	s0,a0
    82d0:	0d7cee63          	bltu	s9,s7,83ac <quorem+0x154>
    82d4:	03a12023          	sw	s10,32(sp)
    82d8:	00010d37          	lui	s10,0x10
    82dc:	01b12e23          	sw	s11,28(sp)
    82e0:	03612823          	sw	s6,48(sp)
    82e4:	000c0a93          	mv	s5,s8
    82e8:	00098d93          	mv	s11,s3
    82ec:	00000c93          	li	s9,0
    82f0:	00000b93          	li	s7,0
    82f4:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    82f8:	000aab03          	lw	s6,0(s5)
    82fc:	00040593          	mv	a1,s0
    8300:	004d8d93          	add	s11,s11,4
    8304:	01ab7533          	and	a0,s6,s10
    8308:	609060ef          	jal	f110 <__mulsi3>
    830c:	00050793          	mv	a5,a0
    8310:	00040593          	mv	a1,s0
    8314:	010b5513          	srl	a0,s6,0x10
    8318:	01978cb3          	add	s9,a5,s9
    831c:	5f5060ef          	jal	f110 <__mulsi3>
    8320:	ffcda603          	lw	a2,-4(s11)
    8324:	01acf733          	and	a4,s9,s10
    8328:	010cdc93          	srl	s9,s9,0x10
    832c:	01a677b3          	and	a5,a2,s10
    8330:	40e787b3          	sub	a5,a5,a4
    8334:	017787b3          	add	a5,a5,s7
    8338:	01950533          	add	a0,a0,s9
    833c:	4107d713          	sra	a4,a5,0x10
    8340:	01a575b3          	and	a1,a0,s10
    8344:	01065613          	srl	a2,a2,0x10
    8348:	40b70733          	sub	a4,a4,a1
    834c:	00c70733          	add	a4,a4,a2
    8350:	01a7f7b3          	and	a5,a5,s10
    8354:	01071613          	sll	a2,a4,0x10
    8358:	00c7e7b3          	or	a5,a5,a2
    835c:	004a8a93          	add	s5,s5,4
    8360:	fefdae23          	sw	a5,-4(s11)
    8364:	01055c93          	srl	s9,a0,0x10
    8368:	41075b93          	sra	s7,a4,0x10
    836c:	f95976e3          	bgeu	s2,s5,82f8 <quorem+0xa0>
    8370:	00c12703          	lw	a4,12(sp)
    8374:	00072783          	lw	a5,0(a4)
    8378:	12079063          	bnez	a5,8498 <quorem+0x240>
    837c:	ffc70a93          	add	s5,a4,-4
    8380:	0159e863          	bltu	s3,s5,8390 <quorem+0x138>
    8384:	0180006f          	j	839c <quorem+0x144>
    8388:	fff48493          	add	s1,s1,-1
    838c:	0159f863          	bgeu	s3,s5,839c <quorem+0x144>
    8390:	000aa783          	lw	a5,0(s5)
    8394:	ffca8a93          	add	s5,s5,-4
    8398:	fe0788e3          	beqz	a5,8388 <quorem+0x130>
    839c:	03012b03          	lw	s6,48(sp)
    83a0:	02012d03          	lw	s10,32(sp)
    83a4:	01c12d83          	lw	s11,28(sp)
    83a8:	009a2823          	sw	s1,16(s4)
    83ac:	00812583          	lw	a1,8(sp)
    83b0:	000a0513          	mv	a0,s4
    83b4:	1fc020ef          	jal	a5b0 <__mcmp>
    83b8:	08054c63          	bltz	a0,8450 <quorem+0x1f8>
    83bc:	00010537          	lui	a0,0x10
    83c0:	00098593          	mv	a1,s3
    83c4:	00000713          	li	a4,0
    83c8:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    83cc:	0005a683          	lw	a3,0(a1)
    83d0:	000c2603          	lw	a2,0(s8)
    83d4:	00458593          	add	a1,a1,4
    83d8:	00a6f7b3          	and	a5,a3,a0
    83dc:	00a67833          	and	a6,a2,a0
    83e0:	410787b3          	sub	a5,a5,a6
    83e4:	00e787b3          	add	a5,a5,a4
    83e8:	4107d713          	sra	a4,a5,0x10
    83ec:	01065613          	srl	a2,a2,0x10
    83f0:	0106d693          	srl	a3,a3,0x10
    83f4:	40c70733          	sub	a4,a4,a2
    83f8:	00d70733          	add	a4,a4,a3
    83fc:	01071693          	sll	a3,a4,0x10
    8400:	00a7f7b3          	and	a5,a5,a0
    8404:	00d7e7b3          	or	a5,a5,a3
    8408:	004c0c13          	add	s8,s8,4
    840c:	fef5ae23          	sw	a5,-4(a1)
    8410:	41075713          	sra	a4,a4,0x10
    8414:	fb897ce3          	bgeu	s2,s8,83cc <quorem+0x174>
    8418:	00249793          	sll	a5,s1,0x2
    841c:	00f987b3          	add	a5,s3,a5
    8420:	0007a703          	lw	a4,0(a5)
    8424:	02071463          	bnez	a4,844c <quorem+0x1f4>
    8428:	ffc78793          	add	a5,a5,-4
    842c:	00f9e863          	bltu	s3,a5,843c <quorem+0x1e4>
    8430:	0180006f          	j	8448 <quorem+0x1f0>
    8434:	fff48493          	add	s1,s1,-1
    8438:	00f9f863          	bgeu	s3,a5,8448 <quorem+0x1f0>
    843c:	0007a703          	lw	a4,0(a5)
    8440:	ffc78793          	add	a5,a5,-4
    8444:	fe0708e3          	beqz	a4,8434 <quorem+0x1dc>
    8448:	009a2823          	sw	s1,16(s4)
    844c:	00140413          	add	s0,s0,1
    8450:	04c12083          	lw	ra,76(sp)
    8454:	00040513          	mv	a0,s0
    8458:	04812403          	lw	s0,72(sp)
    845c:	04012903          	lw	s2,64(sp)
    8460:	03c12983          	lw	s3,60(sp)
    8464:	03812a03          	lw	s4,56(sp)
    8468:	03412a83          	lw	s5,52(sp)
    846c:	02c12b83          	lw	s7,44(sp)
    8470:	02812c03          	lw	s8,40(sp)
    8474:	02412c83          	lw	s9,36(sp)
    8478:	04412483          	lw	s1,68(sp)
    847c:	05010113          	add	sp,sp,80
    8480:	00008067          	ret
    8484:	04c12083          	lw	ra,76(sp)
    8488:	04412483          	lw	s1,68(sp)
    848c:	00000513          	li	a0,0
    8490:	05010113          	add	sp,sp,80
    8494:	00008067          	ret
    8498:	00812583          	lw	a1,8(sp)
    849c:	000a0513          	mv	a0,s4
    84a0:	03012b03          	lw	s6,48(sp)
    84a4:	02012d03          	lw	s10,32(sp)
    84a8:	01c12d83          	lw	s11,28(sp)
    84ac:	104020ef          	jal	a5b0 <__mcmp>
    84b0:	f00556e3          	bgez	a0,83bc <quorem+0x164>
    84b4:	f9dff06f          	j	8450 <quorem+0x1f8>

000084b8 <_dtoa_r>:
    84b8:	03852303          	lw	t1,56(a0)
    84bc:	f5010113          	add	sp,sp,-176
    84c0:	0a812423          	sw	s0,168(sp)
    84c4:	0a912223          	sw	s1,164(sp)
    84c8:	0b212023          	sw	s2,160(sp)
    84cc:	09412c23          	sw	s4,152(sp)
    84d0:	07b12e23          	sw	s11,124(sp)
    84d4:	0a112623          	sw	ra,172(sp)
    84d8:	09312e23          	sw	s3,156(sp)
    84dc:	09512a23          	sw	s5,148(sp)
    84e0:	00e12a23          	sw	a4,20(sp)
    84e4:	00f12623          	sw	a5,12(sp)
    84e8:	01112423          	sw	a7,8(sp)
    84ec:	02b12223          	sw	a1,36(sp)
    84f0:	00c12023          	sw	a2,0(sp)
    84f4:	00050413          	mv	s0,a0
    84f8:	00058d93          	mv	s11,a1
    84fc:	00060493          	mv	s1,a2
    8500:	00068a13          	mv	s4,a3
    8504:	00080913          	mv	s2,a6
    8508:	02030263          	beqz	t1,852c <_dtoa_r+0x74>
    850c:	03c52703          	lw	a4,60(a0)
    8510:	00100793          	li	a5,1
    8514:	00030593          	mv	a1,t1
    8518:	00e797b3          	sll	a5,a5,a4
    851c:	00e32223          	sw	a4,4(t1)
    8520:	00f32423          	sw	a5,8(t1)
    8524:	734010ef          	jal	9c58 <_Bfree>
    8528:	02042c23          	sw	zero,56(s0)
    852c:	00048993          	mv	s3,s1
    8530:	00000693          	li	a3,0
    8534:	0004dc63          	bgez	s1,854c <_dtoa_r+0x94>
    8538:	00149493          	sll	s1,s1,0x1
    853c:	0014d793          	srl	a5,s1,0x1
    8540:	00f12023          	sw	a5,0(sp)
    8544:	00078993          	mv	s3,a5
    8548:	00100693          	li	a3,1
    854c:	7ff00737          	lui	a4,0x7ff00
    8550:	00d92023          	sw	a3,0(s2)
    8554:	00e9f6b3          	and	a3,s3,a4
    8558:	64e68463          	beq	a3,a4,8ba0 <_dtoa_r+0x6e8>
    855c:	00012483          	lw	s1,0(sp)
    8560:	000d8513          	mv	a0,s11
    8564:	00000613          	li	a2,0
    8568:	00048593          	mv	a1,s1
    856c:	00000693          	li	a3,0
    8570:	01b12c23          	sw	s11,24(sp)
    8574:	00912e23          	sw	s1,28(sp)
    8578:	23c050ef          	jal	d7b4 <__eqdf2>
    857c:	04051c63          	bnez	a0,85d4 <_dtoa_r+0x11c>
    8580:	00c12703          	lw	a4,12(sp)
    8584:	00100793          	li	a5,1
    8588:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    858c:	00812703          	lw	a4,8(sp)
    8590:	00070863          	beqz	a4,85a0 <_dtoa_r+0xe8>
    8594:	00007797          	auipc	a5,0x7
    8598:	fa978793          	add	a5,a5,-87 # f53d <__fini_array_end+0x235>
    859c:	00f72023          	sw	a5,0(a4)
    85a0:	00007a97          	auipc	s5,0x7
    85a4:	f9ca8a93          	add	s5,s5,-100 # f53c <__fini_array_end+0x234>
    85a8:	0ac12083          	lw	ra,172(sp)
    85ac:	0a812403          	lw	s0,168(sp)
    85b0:	0a412483          	lw	s1,164(sp)
    85b4:	0a012903          	lw	s2,160(sp)
    85b8:	09c12983          	lw	s3,156(sp)
    85bc:	09812a03          	lw	s4,152(sp)
    85c0:	07c12d83          	lw	s11,124(sp)
    85c4:	000a8513          	mv	a0,s5
    85c8:	09412a83          	lw	s5,148(sp)
    85cc:	0b010113          	add	sp,sp,176
    85d0:	00008067          	ret
    85d4:	00048613          	mv	a2,s1
    85d8:	06810713          	add	a4,sp,104
    85dc:	06c10693          	add	a3,sp,108
    85e0:	000d8593          	mv	a1,s11
    85e4:	00040513          	mv	a0,s0
    85e8:	09612823          	sw	s6,144(sp)
    85ec:	09712623          	sw	s7,140(sp)
    85f0:	09812423          	sw	s8,136(sp)
    85f4:	09912223          	sw	s9,132(sp)
    85f8:	09a12023          	sw	s10,128(sp)
    85fc:	0149d913          	srl	s2,s3,0x14
    8600:	268020ef          	jal	a868 <__d2b>
    8604:	00050493          	mv	s1,a0
    8608:	5c091e63          	bnez	s2,8be4 <_dtoa_r+0x72c>
    860c:	06812a83          	lw	s5,104(sp)
    8610:	06c12903          	lw	s2,108(sp)
    8614:	02000793          	li	a5,32
    8618:	012a8933          	add	s2,s5,s2
    861c:	43290713          	add	a4,s2,1074
    8620:	36e7dae3          	bge	a5,a4,9194 <_dtoa_r+0xcdc>
    8624:	04000793          	li	a5,64
    8628:	40e787b3          	sub	a5,a5,a4
    862c:	41290513          	add	a0,s2,1042
    8630:	00f997b3          	sll	a5,s3,a5
    8634:	00add533          	srl	a0,s11,a0
    8638:	00a7e533          	or	a0,a5,a0
    863c:	634060ef          	jal	ec70 <__floatunsidf>
    8640:	fe1007b7          	lui	a5,0xfe100
    8644:	00100693          	li	a3,1
    8648:	00050713          	mv	a4,a0
    864c:	00b787b3          	add	a5,a5,a1
    8650:	fff90913          	add	s2,s2,-1
    8654:	02d12c23          	sw	a3,56(sp)
    8658:	7fff8697          	auipc	a3,0x7fff8
    865c:	07068693          	add	a3,a3,112 # 800006c8 <__global_locale+0x194>
    8660:	0006a603          	lw	a2,0(a3)
    8664:	0046a683          	lw	a3,4(a3)
    8668:	00070513          	mv	a0,a4
    866c:	00078593          	mv	a1,a5
    8670:	369050ef          	jal	e1d8 <__subdf3>
    8674:	7fff8797          	auipc	a5,0x7fff8
    8678:	05c78793          	add	a5,a5,92 # 800006d0 <__global_locale+0x19c>
    867c:	0007a603          	lw	a2,0(a5)
    8680:	0047a683          	lw	a3,4(a5)
    8684:	3c4050ef          	jal	da48 <__muldf3>
    8688:	7fff8797          	auipc	a5,0x7fff8
    868c:	05078793          	add	a5,a5,80 # 800006d8 <__global_locale+0x1a4>
    8690:	0007a603          	lw	a2,0(a5)
    8694:	0047a683          	lw	a3,4(a5)
    8698:	7a9030ef          	jal	c640 <__adddf3>
    869c:	00050b13          	mv	s6,a0
    86a0:	00090513          	mv	a0,s2
    86a4:	00058993          	mv	s3,a1
    86a8:	510060ef          	jal	ebb8 <__floatsidf>
    86ac:	7fff8797          	auipc	a5,0x7fff8
    86b0:	03478793          	add	a5,a5,52 # 800006e0 <__global_locale+0x1ac>
    86b4:	0007a603          	lw	a2,0(a5)
    86b8:	0047a683          	lw	a3,4(a5)
    86bc:	38c050ef          	jal	da48 <__muldf3>
    86c0:	00050613          	mv	a2,a0
    86c4:	00058693          	mv	a3,a1
    86c8:	000b0513          	mv	a0,s6
    86cc:	00098593          	mv	a1,s3
    86d0:	771030ef          	jal	c640 <__adddf3>
    86d4:	00050b93          	mv	s7,a0
    86d8:	00058b13          	mv	s6,a1
    86dc:	458060ef          	jal	eb34 <__fixdfsi>
    86e0:	00050993          	mv	s3,a0
    86e4:	000b0593          	mv	a1,s6
    86e8:	000b8513          	mv	a0,s7
    86ec:	00000613          	li	a2,0
    86f0:	00000693          	li	a3,0
    86f4:	24c050ef          	jal	d940 <__ledf2>
    86f8:	02055063          	bgez	a0,8718 <_dtoa_r+0x260>
    86fc:	00098513          	mv	a0,s3
    8700:	4b8060ef          	jal	ebb8 <__floatsidf>
    8704:	000b8613          	mv	a2,s7
    8708:	000b0693          	mv	a3,s6
    870c:	0a8050ef          	jal	d7b4 <__eqdf2>
    8710:	00a03533          	snez	a0,a0
    8714:	40a989b3          	sub	s3,s3,a0
    8718:	412a8ab3          	sub	s5,s5,s2
    871c:	01600793          	li	a5,22
    8720:	fffa8b13          	add	s6,s5,-1
    8724:	2137e2e3          	bltu	a5,s3,9128 <_dtoa_r+0xc70>
    8728:	00399713          	sll	a4,s3,0x3
    872c:	00007797          	auipc	a5,0x7
    8730:	4ac78793          	add	a5,a5,1196 # fbd8 <__mprec_tens>
    8734:	00e787b3          	add	a5,a5,a4
    8738:	0007a603          	lw	a2,0(a5)
    873c:	0047a683          	lw	a3,4(a5)
    8740:	01812503          	lw	a0,24(sp)
    8744:	01c12583          	lw	a1,28(sp)
    8748:	1f8050ef          	jal	d940 <__ledf2>
    874c:	220554e3          	bgez	a0,9174 <_dtoa_r+0xcbc>
    8750:	fff98993          	add	s3,s3,-1
    8754:	02012a23          	sw	zero,52(sp)
    8758:	00012823          	sw	zero,16(sp)
    875c:	4a0b4863          	bltz	s6,8c0c <_dtoa_r+0x754>
    8760:	4c09d063          	bgez	s3,8c20 <_dtoa_r+0x768>
    8764:	01012783          	lw	a5,16(sp)
    8768:	03312023          	sw	s3,32(sp)
    876c:	413787b3          	sub	a5,a5,s3
    8770:	00f12823          	sw	a5,16(sp)
    8774:	413007b3          	neg	a5,s3
    8778:	02f12823          	sw	a5,48(sp)
    877c:	00900793          	li	a5,9
    8780:	00000993          	li	s3,0
    8784:	4b47e863          	bltu	a5,s4,8c34 <_dtoa_r+0x77c>
    8788:	00500793          	li	a5,5
    878c:	2147dae3          	bge	a5,s4,91a0 <_dtoa_r+0xce8>
    8790:	ffca0a13          	add	s4,s4,-4
    8794:	00300793          	li	a5,3
    8798:	00000913          	li	s2,0
    879c:	66fa02e3          	beq	s4,a5,9600 <_dtoa_r+0x1148>
    87a0:	6147dae3          	bge	a5,s4,95b4 <_dtoa_r+0x10fc>
    87a4:	00400793          	li	a5,4
    87a8:	54fa1ae3          	bne	s4,a5,94fc <_dtoa_r+0x1044>
    87ac:	00100793          	li	a5,1
    87b0:	02f12423          	sw	a5,40(sp)
    87b4:	01412603          	lw	a2,20(sp)
    87b8:	62c05ce3          	blez	a2,95f0 <_dtoa_r+0x1138>
    87bc:	02c12e23          	sw	a2,60(sp)
    87c0:	00060c13          	mv	s8,a2
    87c4:	01700693          	li	a3,23
    87c8:	00100713          	li	a4,1
    87cc:	00400793          	li	a5,4
    87d0:	00c6c463          	blt	a3,a2,87d8 <_dtoa_r+0x320>
    87d4:	3540106f          	j	9b28 <_dtoa_r+0x1670>
    87d8:	00179793          	sll	a5,a5,0x1
    87dc:	01478693          	add	a3,a5,20
    87e0:	00070593          	mv	a1,a4
    87e4:	00170713          	add	a4,a4,1
    87e8:	fed678e3          	bgeu	a2,a3,87d8 <_dtoa_r+0x320>
    87ec:	02b42e23          	sw	a1,60(s0)
    87f0:	00040513          	mv	a0,s0
    87f4:	3b0010ef          	jal	9ba4 <_Balloc>
    87f8:	00050a93          	mv	s5,a0
    87fc:	00051463          	bnez	a0,8804 <_dtoa_r+0x34c>
    8800:	30c0106f          	j	9b0c <_dtoa_r+0x1654>
    8804:	02a42c23          	sw	a0,56(s0)
    8808:	00e00793          	li	a5,14
    880c:	5187ea63          	bltu	a5,s8,8d20 <_dtoa_r+0x868>
    8810:	50090863          	beqz	s2,8d20 <_dtoa_r+0x868>
    8814:	02012783          	lw	a5,32(sp)
    8818:	62f054e3          	blez	a5,9640 <_dtoa_r+0x1188>
    881c:	00f7f713          	and	a4,a5,15
    8820:	00371713          	sll	a4,a4,0x3
    8824:	4047dc93          	sra	s9,a5,0x4
    8828:	00007797          	auipc	a5,0x7
    882c:	3b078793          	add	a5,a5,944 # fbd8 <__mprec_tens>
    8830:	00e787b3          	add	a5,a5,a4
    8834:	010cf693          	and	a3,s9,16
    8838:	0007a803          	lw	a6,0(a5)
    883c:	0047a703          	lw	a4,4(a5)
    8840:	560682e3          	beqz	a3,95a4 <_dtoa_r+0x10ec>
    8844:	00007797          	auipc	a5,0x7
    8848:	36c78793          	add	a5,a5,876 # fbb0 <__mprec_bigtens>
    884c:	0207a603          	lw	a2,32(a5)
    8850:	0247a683          	lw	a3,36(a5)
    8854:	01812503          	lw	a0,24(sp)
    8858:	01c12583          	lw	a1,28(sp)
    885c:	04e12423          	sw	a4,72(sp)
    8860:	05012023          	sw	a6,64(sp)
    8864:	6a4040ef          	jal	cf08 <__divdf3>
    8868:	04012803          	lw	a6,64(sp)
    886c:	04812703          	lw	a4,72(sp)
    8870:	00fcfc93          	and	s9,s9,15
    8874:	00050313          	mv	t1,a0
    8878:	00058d13          	mv	s10,a1
    887c:	00300913          	li	s2,3
    8880:	040c8c63          	beqz	s9,88d8 <_dtoa_r+0x420>
    8884:	04812023          	sw	s0,64(sp)
    8888:	00007b97          	auipc	s7,0x7
    888c:	328b8b93          	add	s7,s7,808 # fbb0 <__mprec_bigtens>
    8890:	00090413          	mv	s0,s2
    8894:	00070593          	mv	a1,a4
    8898:	00030913          	mv	s2,t1
    889c:	001cf793          	and	a5,s9,1
    88a0:	00078e63          	beqz	a5,88bc <_dtoa_r+0x404>
    88a4:	000ba603          	lw	a2,0(s7)
    88a8:	004ba683          	lw	a3,4(s7)
    88ac:	00080513          	mv	a0,a6
    88b0:	00140413          	add	s0,s0,1
    88b4:	194050ef          	jal	da48 <__muldf3>
    88b8:	00050813          	mv	a6,a0
    88bc:	401cdc93          	sra	s9,s9,0x1
    88c0:	008b8b93          	add	s7,s7,8
    88c4:	fc0c9ce3          	bnez	s9,889c <_dtoa_r+0x3e4>
    88c8:	00090313          	mv	t1,s2
    88cc:	00040913          	mv	s2,s0
    88d0:	04012403          	lw	s0,64(sp)
    88d4:	00058713          	mv	a4,a1
    88d8:	00070693          	mv	a3,a4
    88dc:	00080613          	mv	a2,a6
    88e0:	00030513          	mv	a0,t1
    88e4:	000d0593          	mv	a1,s10
    88e8:	620040ef          	jal	cf08 <__divdf3>
    88ec:	00050713          	mv	a4,a0
    88f0:	00058793          	mv	a5,a1
    88f4:	03412683          	lw	a3,52(sp)
    88f8:	02068c63          	beqz	a3,8930 <_dtoa_r+0x478>
    88fc:	7fff8697          	auipc	a3,0x7fff8
    8900:	dec68693          	add	a3,a3,-532 # 800006e8 <__global_locale+0x1b4>
    8904:	0006a603          	lw	a2,0(a3)
    8908:	0046a683          	lw	a3,4(a3)
    890c:	00070513          	mv	a0,a4
    8910:	00078593          	mv	a1,a5
    8914:	04e12423          	sw	a4,72(sp)
    8918:	04f12023          	sw	a5,64(sp)
    891c:	024050ef          	jal	d940 <__ledf2>
    8920:	04012783          	lw	a5,64(sp)
    8924:	04812703          	lw	a4,72(sp)
    8928:	00055463          	bgez	a0,8930 <_dtoa_r+0x478>
    892c:	04c0106f          	j	9978 <_dtoa_r+0x14c0>
    8930:	00090513          	mv	a0,s2
    8934:	04f12623          	sw	a5,76(sp)
    8938:	04e12023          	sw	a4,64(sp)
    893c:	27c060ef          	jal	ebb8 <__floatsidf>
    8940:	04012703          	lw	a4,64(sp)
    8944:	04c12783          	lw	a5,76(sp)
    8948:	00070613          	mv	a2,a4
    894c:	00078693          	mv	a3,a5
    8950:	04e12423          	sw	a4,72(sp)
    8954:	04f12023          	sw	a5,64(sp)
    8958:	0f0050ef          	jal	da48 <__muldf3>
    895c:	7fff8697          	auipc	a3,0x7fff8
    8960:	d9c68693          	add	a3,a3,-612 # 800006f8 <__global_locale+0x1c4>
    8964:	0006a603          	lw	a2,0(a3)
    8968:	0046a683          	lw	a3,4(a3)
    896c:	4d5030ef          	jal	c640 <__adddf3>
    8970:	fcc006b7          	lui	a3,0xfcc00
    8974:	04012783          	lw	a5,64(sp)
    8978:	04812703          	lw	a4,72(sp)
    897c:	00050c93          	mv	s9,a0
    8980:	00b68bb3          	add	s7,a3,a1
    8984:	340c0463          	beqz	s8,8ccc <_dtoa_r+0x814>
    8988:	02012683          	lw	a3,32(sp)
    898c:	05812423          	sw	s8,72(sp)
    8990:	04d12e23          	sw	a3,92(sp)
    8994:	00070513          	mv	a0,a4
    8998:	00078593          	mv	a1,a5
    899c:	04e12623          	sw	a4,76(sp)
    89a0:	04f12023          	sw	a5,64(sp)
    89a4:	190060ef          	jal	eb34 <__fixdfsi>
    89a8:	04812783          	lw	a5,72(sp)
    89ac:	00050913          	mv	s2,a0
    89b0:	05912c23          	sw	s9,88(sp)
    89b4:	fff78693          	add	a3,a5,-1
    89b8:	00369693          	sll	a3,a3,0x3
    89bc:	00007797          	auipc	a5,0x7
    89c0:	21c78793          	add	a5,a5,540 # fbd8 <__mprec_tens>
    89c4:	00d786b3          	add	a3,a5,a3
    89c8:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    89cc:	0046a803          	lw	a6,4(a3)
    89d0:	001a8d13          	add	s10,s5,1
    89d4:	04f12823          	sw	a5,80(sp)
    89d8:	05012a23          	sw	a6,84(sp)
    89dc:	1dc060ef          	jal	ebb8 <__floatsidf>
    89e0:	04c12703          	lw	a4,76(sp)
    89e4:	04012783          	lw	a5,64(sp)
    89e8:	00050613          	mv	a2,a0
    89ec:	00058693          	mv	a3,a1
    89f0:	00070513          	mv	a0,a4
    89f4:	00078593          	mv	a1,a5
    89f8:	7e0050ef          	jal	e1d8 <__subdf3>
    89fc:	02812703          	lw	a4,40(sp)
    8a00:	03090313          	add	t1,s2,48
    8a04:	05a12023          	sw	s10,64(sp)
    8a08:	00050c93          	mv	s9,a0
    8a0c:	0ff37313          	zext.b	t1,t1
    8a10:	5c0706e3          	beqz	a4,97dc <_dtoa_r+0x1324>
    8a14:	7fff8797          	auipc	a5,0x7fff8
    8a18:	ca478793          	add	a5,a5,-860 # 800006b8 <__global_locale+0x184>
    8a1c:	0007a503          	lw	a0,0(a5)
    8a20:	05012603          	lw	a2,80(sp)
    8a24:	05412683          	lw	a3,84(sp)
    8a28:	04b12023          	sw	a1,64(sp)
    8a2c:	0047a583          	lw	a1,4(a5)
    8a30:	04612623          	sw	t1,76(sp)
    8a34:	4d4040ef          	jal	cf08 <__divdf3>
    8a38:	05812603          	lw	a2,88(sp)
    8a3c:	000b8693          	mv	a3,s7
    8a40:	798050ef          	jal	e1d8 <__subdf3>
    8a44:	04012883          	lw	a7,64(sp)
    8a48:	04c12303          	lw	t1,76(sp)
    8a4c:	000c8613          	mv	a2,s9
    8a50:	00088693          	mv	a3,a7
    8a54:	006a8023          	sb	t1,0(s5)
    8a58:	00050913          	mv	s2,a0
    8a5c:	00058b93          	mv	s7,a1
    8a60:	5e1040ef          	jal	d840 <__gedf2>
    8a64:	04012883          	lw	a7,64(sp)
    8a68:	00a05463          	blez	a0,8a70 <_dtoa_r+0x5b8>
    8a6c:	7c90006f          	j	9a34 <_dtoa_r+0x157c>
    8a70:	7fff8697          	auipc	a3,0x7fff8
    8a74:	c7868693          	add	a3,a3,-904 # 800006e8 <__global_locale+0x1b4>
    8a78:	0006a783          	lw	a5,0(a3)
    8a7c:	0046a803          	lw	a6,4(a3)
    8a80:	05312623          	sw	s3,76(sp)
    8a84:	04f12023          	sw	a5,64(sp)
    8a88:	00000793          	li	a5,0
    8a8c:	05612823          	sw	s6,80(sp)
    8a90:	05812c23          	sw	s8,88(sp)
    8a94:	05012223          	sw	a6,68(sp)
    8a98:	04812c03          	lw	s8,72(sp)
    8a9c:	00078b13          	mv	s6,a5
    8aa0:	05412423          	sw	s4,72(sp)
    8aa4:	00088993          	mv	s3,a7
    8aa8:	0980006f          	j	8b40 <_dtoa_r+0x688>
    8aac:	001b0b13          	add	s6,s6,1
    8ab0:	018b4463          	blt	s6,s8,8ab8 <_dtoa_r+0x600>
    8ab4:	7d10006f          	j	9a84 <_dtoa_r+0x15cc>
    8ab8:	7fff8a17          	auipc	s4,0x7fff8
    8abc:	c38a0a13          	add	s4,s4,-968 # 800006f0 <__global_locale+0x1bc>
    8ac0:	000a2603          	lw	a2,0(s4)
    8ac4:	004a2683          	lw	a3,4(s4)
    8ac8:	00090513          	mv	a0,s2
    8acc:	000b8593          	mv	a1,s7
    8ad0:	779040ef          	jal	da48 <__muldf3>
    8ad4:	000a2603          	lw	a2,0(s4)
    8ad8:	004a2683          	lw	a3,4(s4)
    8adc:	00050913          	mv	s2,a0
    8ae0:	00058b93          	mv	s7,a1
    8ae4:	000c8513          	mv	a0,s9
    8ae8:	00098593          	mv	a1,s3
    8aec:	75d040ef          	jal	da48 <__muldf3>
    8af0:	00058c93          	mv	s9,a1
    8af4:	00050a13          	mv	s4,a0
    8af8:	03c060ef          	jal	eb34 <__fixdfsi>
    8afc:	00050993          	mv	s3,a0
    8b00:	0b8060ef          	jal	ebb8 <__floatsidf>
    8b04:	00050613          	mv	a2,a0
    8b08:	00058693          	mv	a3,a1
    8b0c:	000a0513          	mv	a0,s4
    8b10:	000c8593          	mv	a1,s9
    8b14:	6c4050ef          	jal	e1d8 <__subdf3>
    8b18:	03098793          	add	a5,s3,48
    8b1c:	00090613          	mv	a2,s2
    8b20:	000b8693          	mv	a3,s7
    8b24:	00fd0023          	sb	a5,0(s10)
    8b28:	001d0d13          	add	s10,s10,1
    8b2c:	00050c93          	mv	s9,a0
    8b30:	00058993          	mv	s3,a1
    8b34:	60d040ef          	jal	d940 <__ledf2>
    8b38:	00055463          	bgez	a0,8b40 <_dtoa_r+0x688>
    8b3c:	6f90006f          	j	9a34 <_dtoa_r+0x157c>
    8b40:	04012503          	lw	a0,64(sp)
    8b44:	04412583          	lw	a1,68(sp)
    8b48:	000c8613          	mv	a2,s9
    8b4c:	00098693          	mv	a3,s3
    8b50:	688050ef          	jal	e1d8 <__subdf3>
    8b54:	00090613          	mv	a2,s2
    8b58:	000b8693          	mv	a3,s7
    8b5c:	5e5040ef          	jal	d940 <__ledf2>
    8b60:	f40556e3          	bgez	a0,8aac <_dtoa_r+0x5f4>
    8b64:	05c12783          	lw	a5,92(sp)
    8b68:	000d0b93          	mv	s7,s10
    8b6c:	00178c13          	add	s8,a5,1
    8b70:	03900613          	li	a2,57
    8b74:	0080006f          	j	8b7c <_dtoa_r+0x6c4>
    8b78:	697a88e3          	beq	s5,s7,9a08 <_dtoa_r+0x1550>
    8b7c:	fffbc683          	lbu	a3,-1(s7)
    8b80:	000b8d13          	mv	s10,s7
    8b84:	fffb8b93          	add	s7,s7,-1
    8b88:	fec688e3          	beq	a3,a2,8b78 <_dtoa_r+0x6c0>
    8b8c:	00168693          	add	a3,a3,1
    8b90:	0ff6f693          	zext.b	a3,a3
    8b94:	00db8023          	sb	a3,0(s7)
    8b98:	000c0a13          	mv	s4,s8
    8b9c:	4f00006f          	j	908c <_dtoa_r+0xbd4>
    8ba0:	00c12683          	lw	a3,12(sp)
    8ba4:	00002737          	lui	a4,0x2
    8ba8:	00c99793          	sll	a5,s3,0xc
    8bac:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x457>
    8bb0:	00c7d793          	srl	a5,a5,0xc
    8bb4:	00e6a023          	sw	a4,0(a3)
    8bb8:	01b7e7b3          	or	a5,a5,s11
    8bbc:	0a078063          	beqz	a5,8c5c <_dtoa_r+0x7a4>
    8bc0:	00812783          	lw	a5,8(sp)
    8bc4:	00007a97          	auipc	s5,0x7
    8bc8:	9d0a8a93          	add	s5,s5,-1584 # f594 <__fini_array_end+0x28c>
    8bcc:	9c078ee3          	beqz	a5,85a8 <_dtoa_r+0xf0>
    8bd0:	00007797          	auipc	a5,0x7
    8bd4:	9c778793          	add	a5,a5,-1593 # f597 <__fini_array_end+0x28f>
    8bd8:	00812703          	lw	a4,8(sp)
    8bdc:	00f72023          	sw	a5,0(a4)
    8be0:	9c9ff06f          	j	85a8 <_dtoa_r+0xf0>
    8be4:	01c12783          	lw	a5,28(sp)
    8be8:	3ff006b7          	lui	a3,0x3ff00
    8bec:	06812a83          	lw	s5,104(sp)
    8bf0:	00c79793          	sll	a5,a5,0xc
    8bf4:	00c7d793          	srl	a5,a5,0xc
    8bf8:	01812703          	lw	a4,24(sp)
    8bfc:	00d7e7b3          	or	a5,a5,a3
    8c00:	c0190913          	add	s2,s2,-1023
    8c04:	02012c23          	sw	zero,56(sp)
    8c08:	a51ff06f          	j	8658 <_dtoa_r+0x1a0>
    8c0c:	00100793          	li	a5,1
    8c10:	415787b3          	sub	a5,a5,s5
    8c14:	00f12823          	sw	a5,16(sp)
    8c18:	00000b13          	li	s6,0
    8c1c:	b409c4e3          	bltz	s3,8764 <_dtoa_r+0x2ac>
    8c20:	03312023          	sw	s3,32(sp)
    8c24:	02012823          	sw	zero,48(sp)
    8c28:	00900793          	li	a5,9
    8c2c:	013b0b33          	add	s6,s6,s3
    8c30:	b547fce3          	bgeu	a5,s4,8788 <_dtoa_r+0x2d0>
    8c34:	00100793          	li	a5,1
    8c38:	00100913          	li	s2,1
    8c3c:	00000a13          	li	s4,0
    8c40:	02f12423          	sw	a5,40(sp)
    8c44:	fff00c13          	li	s8,-1
    8c48:	00012a23          	sw	zero,20(sp)
    8c4c:	02042e23          	sw	zero,60(s0)
    8c50:	03812e23          	sw	s8,60(sp)
    8c54:	00000593          	li	a1,0
    8c58:	b99ff06f          	j	87f0 <_dtoa_r+0x338>
    8c5c:	00812703          	lw	a4,8(sp)
    8c60:	00007a97          	auipc	s5,0x7
    8c64:	928a8a93          	add	s5,s5,-1752 # f588 <__fini_array_end+0x280>
    8c68:	00007797          	auipc	a5,0x7
    8c6c:	92878793          	add	a5,a5,-1752 # f590 <__fini_array_end+0x288>
    8c70:	f60714e3          	bnez	a4,8bd8 <_dtoa_r+0x720>
    8c74:	935ff06f          	j	85a8 <_dtoa_r+0xf0>
    8c78:	00090513          	mv	a0,s2
    8c7c:	04f12623          	sw	a5,76(sp)
    8c80:	04e12023          	sw	a4,64(sp)
    8c84:	735050ef          	jal	ebb8 <__floatsidf>
    8c88:	04012703          	lw	a4,64(sp)
    8c8c:	04c12783          	lw	a5,76(sp)
    8c90:	00070613          	mv	a2,a4
    8c94:	00078693          	mv	a3,a5
    8c98:	04e12423          	sw	a4,72(sp)
    8c9c:	04f12023          	sw	a5,64(sp)
    8ca0:	5a9040ef          	jal	da48 <__muldf3>
    8ca4:	7fff8697          	auipc	a3,0x7fff8
    8ca8:	a5468693          	add	a3,a3,-1452 # 800006f8 <__global_locale+0x1c4>
    8cac:	0006a603          	lw	a2,0(a3)
    8cb0:	0046a683          	lw	a3,4(a3)
    8cb4:	18d030ef          	jal	c640 <__adddf3>
    8cb8:	04012783          	lw	a5,64(sp)
    8cbc:	04812703          	lw	a4,72(sp)
    8cc0:	fcc006b7          	lui	a3,0xfcc00
    8cc4:	00050c93          	mv	s9,a0
    8cc8:	00b68bb3          	add	s7,a3,a1
    8ccc:	7fff8697          	auipc	a3,0x7fff8
    8cd0:	a3468693          	add	a3,a3,-1484 # 80000700 <__global_locale+0x1cc>
    8cd4:	0006a603          	lw	a2,0(a3)
    8cd8:	0046a683          	lw	a3,4(a3)
    8cdc:	00070513          	mv	a0,a4
    8ce0:	00078593          	mv	a1,a5
    8ce4:	4f4050ef          	jal	e1d8 <__subdf3>
    8ce8:	000c8613          	mv	a2,s9
    8cec:	000b8693          	mv	a3,s7
    8cf0:	00050d13          	mv	s10,a0
    8cf4:	00058913          	mv	s2,a1
    8cf8:	349040ef          	jal	d840 <__gedf2>
    8cfc:	50a04ce3          	bgtz	a0,9a14 <_dtoa_r+0x155c>
    8d00:	800007b7          	lui	a5,0x80000
    8d04:	0177c7b3          	xor	a5,a5,s7
    8d08:	000c8613          	mv	a2,s9
    8d0c:	000d0513          	mv	a0,s10
    8d10:	00078693          	mv	a3,a5
    8d14:	00090593          	mv	a1,s2
    8d18:	429040ef          	jal	d940 <__ledf2>
    8d1c:	06054c63          	bltz	a0,8d94 <_dtoa_r+0x8dc>
    8d20:	06c12783          	lw	a5,108(sp)
    8d24:	1a07c663          	bltz	a5,8ed0 <_dtoa_r+0xa18>
    8d28:	02012683          	lw	a3,32(sp)
    8d2c:	00e00713          	li	a4,14
    8d30:	1ad74063          	blt	a4,a3,8ed0 <_dtoa_r+0xa18>
    8d34:	02012783          	lw	a5,32(sp)
    8d38:	00379713          	sll	a4,a5,0x3
    8d3c:	00007797          	auipc	a5,0x7
    8d40:	e9c78793          	add	a5,a5,-356 # fbd8 <__mprec_tens>
    8d44:	00e787b3          	add	a5,a5,a4
    8d48:	0007a903          	lw	s2,0(a5)
    8d4c:	0047a983          	lw	s3,4(a5)
    8d50:	01412783          	lw	a5,20(sp)
    8d54:	0407dc63          	bgez	a5,8dac <_dtoa_r+0x8f4>
    8d58:	05804a63          	bgtz	s8,8dac <_dtoa_r+0x8f4>
    8d5c:	020c1c63          	bnez	s8,8d94 <_dtoa_r+0x8dc>
    8d60:	7fff8797          	auipc	a5,0x7fff8
    8d64:	9a078793          	add	a5,a5,-1632 # 80000700 <__global_locale+0x1cc>
    8d68:	0007a603          	lw	a2,0(a5)
    8d6c:	0047a683          	lw	a3,4(a5)
    8d70:	00090513          	mv	a0,s2
    8d74:	00098593          	mv	a1,s3
    8d78:	4d1040ef          	jal	da48 <__muldf3>
    8d7c:	00050613          	mv	a2,a0
    8d80:	00058693          	mv	a3,a1
    8d84:	01812503          	lw	a0,24(sp)
    8d88:	01c12583          	lw	a1,28(sp)
    8d8c:	3b5040ef          	jal	d940 <__ledf2>
    8d90:	48a042e3          	bgtz	a0,9a14 <_dtoa_r+0x155c>
    8d94:	000a8d13          	mv	s10,s5
    8d98:	00012c23          	sw	zero,24(sp)
    8d9c:	00000913          	li	s2,0
    8da0:	01412783          	lw	a5,20(sp)
    8da4:	fff7ca13          	not	s4,a5
    8da8:	6980006f          	j	9440 <_dtoa_r+0xf88>
    8dac:	001a8793          	add	a5,s5,1
    8db0:	04f12023          	sw	a5,64(sp)
    8db4:	01812b03          	lw	s6,24(sp)
    8db8:	01c12a03          	lw	s4,28(sp)
    8dbc:	00090613          	mv	a2,s2
    8dc0:	00098693          	mv	a3,s3
    8dc4:	000b0513          	mv	a0,s6
    8dc8:	000a0593          	mv	a1,s4
    8dcc:	13c040ef          	jal	cf08 <__divdf3>
    8dd0:	565050ef          	jal	eb34 <__fixdfsi>
    8dd4:	00050d13          	mv	s10,a0
    8dd8:	5e1050ef          	jal	ebb8 <__floatsidf>
    8ddc:	00090613          	mv	a2,s2
    8de0:	00098693          	mv	a3,s3
    8de4:	465040ef          	jal	da48 <__muldf3>
    8de8:	00050613          	mv	a2,a0
    8dec:	00058693          	mv	a3,a1
    8df0:	000b0513          	mv	a0,s6
    8df4:	000a0593          	mv	a1,s4
    8df8:	3e0050ef          	jal	e1d8 <__subdf3>
    8dfc:	030d0793          	add	a5,s10,48
    8e00:	00fa8023          	sb	a5,0(s5)
    8e04:	00100613          	li	a2,1
    8e08:	04012b83          	lw	s7,64(sp)
    8e0c:	00050713          	mv	a4,a0
    8e10:	00058693          	mv	a3,a1
    8e14:	0ccc0ee3          	beq	s8,a2,96f0 <_dtoa_r+0x1238>
    8e18:	7fff8617          	auipc	a2,0x7fff8
    8e1c:	8d860613          	add	a2,a2,-1832 # 800006f0 <__global_locale+0x1bc>
    8e20:	00062783          	lw	a5,0(a2)
    8e24:	00462803          	lw	a6,4(a2)
    8e28:	00100d93          	li	s11,1
    8e2c:	00f12023          	sw	a5,0(sp)
    8e30:	01012223          	sw	a6,4(sp)
    8e34:	0600006f          	j	8e94 <_dtoa_r+0x9dc>
    8e38:	00090613          	mv	a2,s2
    8e3c:	00098693          	mv	a3,s3
    8e40:	000b0513          	mv	a0,s6
    8e44:	000a0593          	mv	a1,s4
    8e48:	0c0040ef          	jal	cf08 <__divdf3>
    8e4c:	4e9050ef          	jal	eb34 <__fixdfsi>
    8e50:	00050d13          	mv	s10,a0
    8e54:	565050ef          	jal	ebb8 <__floatsidf>
    8e58:	00090613          	mv	a2,s2
    8e5c:	00098693          	mv	a3,s3
    8e60:	3e9040ef          	jal	da48 <__muldf3>
    8e64:	00058693          	mv	a3,a1
    8e68:	00050613          	mv	a2,a0
    8e6c:	000a0593          	mv	a1,s4
    8e70:	000b0513          	mv	a0,s6
    8e74:	364050ef          	jal	e1d8 <__subdf3>
    8e78:	001b8b93          	add	s7,s7,1
    8e7c:	030d0793          	add	a5,s10,48
    8e80:	001d8d93          	add	s11,s11,1
    8e84:	fefb8fa3          	sb	a5,-1(s7)
    8e88:	00050713          	mv	a4,a0
    8e8c:	00058693          	mv	a3,a1
    8e90:	07bc00e3          	beq	s8,s11,96f0 <_dtoa_r+0x1238>
    8e94:	00012603          	lw	a2,0(sp)
    8e98:	00068593          	mv	a1,a3
    8e9c:	00412683          	lw	a3,4(sp)
    8ea0:	00070513          	mv	a0,a4
    8ea4:	3a5040ef          	jal	da48 <__muldf3>
    8ea8:	00000613          	li	a2,0
    8eac:	00000693          	li	a3,0
    8eb0:	00050b13          	mv	s6,a0
    8eb4:	00058a13          	mv	s4,a1
    8eb8:	0fd040ef          	jal	d7b4 <__eqdf2>
    8ebc:	f6051ee3          	bnez	a0,8e38 <_dtoa_r+0x980>
    8ec0:	02012783          	lw	a5,32(sp)
    8ec4:	000b8d13          	mv	s10,s7
    8ec8:	00178a13          	add	s4,a5,1
    8ecc:	1c00006f          	j	908c <_dtoa_r+0xbd4>
    8ed0:	02812703          	lw	a4,40(sp)
    8ed4:	26071463          	bnez	a4,913c <_dtoa_r+0xc84>
    8ed8:	03012b83          	lw	s7,48(sp)
    8edc:	01012c83          	lw	s9,16(sp)
    8ee0:	02012423          	sw	zero,40(sp)
    8ee4:	00000913          	li	s2,0
    8ee8:	020c8263          	beqz	s9,8f0c <_dtoa_r+0xa54>
    8eec:	03605063          	blez	s6,8f0c <_dtoa_r+0xa54>
    8ef0:	000c8793          	mv	a5,s9
    8ef4:	679b4263          	blt	s6,s9,9558 <_dtoa_r+0x10a0>
    8ef8:	01012703          	lw	a4,16(sp)
    8efc:	40fc8cb3          	sub	s9,s9,a5
    8f00:	40fb0b33          	sub	s6,s6,a5
    8f04:	40f70733          	sub	a4,a4,a5
    8f08:	00e12823          	sw	a4,16(sp)
    8f0c:	03012783          	lw	a5,48(sp)
    8f10:	02078263          	beqz	a5,8f34 <_dtoa_r+0xa7c>
    8f14:	02812783          	lw	a5,40(sp)
    8f18:	00078463          	beqz	a5,8f20 <_dtoa_r+0xa68>
    8f1c:	060b9ae3          	bnez	s7,9790 <_dtoa_r+0x12d8>
    8f20:	03012603          	lw	a2,48(sp)
    8f24:	00048593          	mv	a1,s1
    8f28:	00040513          	mv	a0,s0
    8f2c:	3a4010ef          	jal	a2d0 <__pow5mult>
    8f30:	00050493          	mv	s1,a0
    8f34:	00100593          	li	a1,1
    8f38:	00040513          	mv	a0,s0
    8f3c:	01c010ef          	jal	9f58 <__i2b>
    8f40:	00a12c23          	sw	a0,24(sp)
    8f44:	50099a63          	bnez	s3,9458 <_dtoa_r+0xfa0>
    8f48:	00100793          	li	a5,1
    8f4c:	5547da63          	bge	a5,s4,94a0 <_dtoa_r+0xfe8>
    8f50:	016787b3          	add	a5,a5,s6
    8f54:	01f7f793          	and	a5,a5,31
    8f58:	1c078e63          	beqz	a5,9134 <_dtoa_r+0xc7c>
    8f5c:	02000713          	li	a4,32
    8f60:	40f70733          	sub	a4,a4,a5
    8f64:	00400693          	li	a3,4
    8f68:	58e6d263          	bge	a3,a4,94ec <_dtoa_r+0x1034>
    8f6c:	01c00713          	li	a4,28
    8f70:	40f707b3          	sub	a5,a4,a5
    8f74:	01012703          	lw	a4,16(sp)
    8f78:	00fc8cb3          	add	s9,s9,a5
    8f7c:	00fb0b33          	add	s6,s6,a5
    8f80:	00f70733          	add	a4,a4,a5
    8f84:	00e12823          	sw	a4,16(sp)
    8f88:	01012783          	lw	a5,16(sp)
    8f8c:	12f04e63          	bgtz	a5,90c8 <_dtoa_r+0xc10>
    8f90:	01605c63          	blez	s6,8fa8 <_dtoa_r+0xaf0>
    8f94:	01812583          	lw	a1,24(sp)
    8f98:	000b0613          	mv	a2,s6
    8f9c:	00040513          	mv	a0,s0
    8fa0:	480010ef          	jal	a420 <__lshift>
    8fa4:	00a12c23          	sw	a0,24(sp)
    8fa8:	03412783          	lw	a5,52(sp)
    8fac:	12079a63          	bnez	a5,90e0 <_dtoa_r+0xc28>
    8fb0:	45805263          	blez	s8,93f4 <_dtoa_r+0xf3c>
    8fb4:	02812783          	lw	a5,40(sp)
    8fb8:	24079e63          	bnez	a5,9214 <_dtoa_r+0xd5c>
    8fbc:	02012783          	lw	a5,32(sp)
    8fc0:	00178a13          	add	s4,a5,1
    8fc4:	01812b03          	lw	s6,24(sp)
    8fc8:	00100993          	li	s3,1
    8fcc:	0200006f          	j	8fec <_dtoa_r+0xb34>
    8fd0:	00048593          	mv	a1,s1
    8fd4:	00000693          	li	a3,0
    8fd8:	00a00613          	li	a2,10
    8fdc:	00040513          	mv	a0,s0
    8fe0:	49d000ef          	jal	9c7c <__multadd>
    8fe4:	00050493          	mv	s1,a0
    8fe8:	00198993          	add	s3,s3,1
    8fec:	000b0593          	mv	a1,s6
    8ff0:	00048513          	mv	a0,s1
    8ff4:	a64ff0ef          	jal	8258 <quorem>
    8ff8:	03050b93          	add	s7,a0,48
    8ffc:	013a87b3          	add	a5,s5,s3
    9000:	ff778fa3          	sb	s7,-1(a5)
    9004:	fd89c6e3          	blt	s3,s8,8fd0 <_dtoa_r+0xb18>
    9008:	00100993          	li	s3,1
    900c:	55804263          	bgtz	s8,9550 <_dtoa_r+0x1098>
    9010:	013a89b3          	add	s3,s5,s3
    9014:	00000c13          	li	s8,0
    9018:	00048593          	mv	a1,s1
    901c:	00100613          	li	a2,1
    9020:	00040513          	mv	a0,s0
    9024:	3fc010ef          	jal	a420 <__lshift>
    9028:	01812583          	lw	a1,24(sp)
    902c:	00050493          	mv	s1,a0
    9030:	580010ef          	jal	a5b0 <__mcmp>
    9034:	4ea05c63          	blez	a0,952c <_dtoa_r+0x1074>
    9038:	03900693          	li	a3,57
    903c:	0080006f          	j	9044 <_dtoa_r+0xb8c>
    9040:	5f3a8863          	beq	s5,s3,9630 <_dtoa_r+0x1178>
    9044:	fff9c783          	lbu	a5,-1(s3)
    9048:	00098d13          	mv	s10,s3
    904c:	fff98993          	add	s3,s3,-1
    9050:	fed788e3          	beq	a5,a3,9040 <_dtoa_r+0xb88>
    9054:	00178793          	add	a5,a5,1
    9058:	00f98023          	sb	a5,0(s3)
    905c:	01812583          	lw	a1,24(sp)
    9060:	00040513          	mv	a0,s0
    9064:	3f5000ef          	jal	9c58 <_Bfree>
    9068:	02090263          	beqz	s2,908c <_dtoa_r+0xbd4>
    906c:	000c0a63          	beqz	s8,9080 <_dtoa_r+0xbc8>
    9070:	012c0863          	beq	s8,s2,9080 <_dtoa_r+0xbc8>
    9074:	000c0593          	mv	a1,s8
    9078:	00040513          	mv	a0,s0
    907c:	3dd000ef          	jal	9c58 <_Bfree>
    9080:	00090593          	mv	a1,s2
    9084:	00040513          	mv	a0,s0
    9088:	3d1000ef          	jal	9c58 <_Bfree>
    908c:	00048593          	mv	a1,s1
    9090:	00040513          	mv	a0,s0
    9094:	3c5000ef          	jal	9c58 <_Bfree>
    9098:	00c12783          	lw	a5,12(sp)
    909c:	000d0023          	sb	zero,0(s10)
    90a0:	0147a023          	sw	s4,0(a5)
    90a4:	00812783          	lw	a5,8(sp)
    90a8:	00078463          	beqz	a5,90b0 <_dtoa_r+0xbf8>
    90ac:	01a7a023          	sw	s10,0(a5)
    90b0:	09012b03          	lw	s6,144(sp)
    90b4:	08c12b83          	lw	s7,140(sp)
    90b8:	08812c03          	lw	s8,136(sp)
    90bc:	08412c83          	lw	s9,132(sp)
    90c0:	08012d03          	lw	s10,128(sp)
    90c4:	ce4ff06f          	j	85a8 <_dtoa_r+0xf0>
    90c8:	00048593          	mv	a1,s1
    90cc:	00078613          	mv	a2,a5
    90d0:	00040513          	mv	a0,s0
    90d4:	34c010ef          	jal	a420 <__lshift>
    90d8:	00050493          	mv	s1,a0
    90dc:	eb5ff06f          	j	8f90 <_dtoa_r+0xad8>
    90e0:	01812583          	lw	a1,24(sp)
    90e4:	00048513          	mv	a0,s1
    90e8:	4c8010ef          	jal	a5b0 <__mcmp>
    90ec:	ec0552e3          	bgez	a0,8fb0 <_dtoa_r+0xaf8>
    90f0:	02012783          	lw	a5,32(sp)
    90f4:	00048593          	mv	a1,s1
    90f8:	00000693          	li	a3,0
    90fc:	00a00613          	li	a2,10
    9100:	00040513          	mv	a0,s0
    9104:	fff78b13          	add	s6,a5,-1
    9108:	375000ef          	jal	9c7c <__multadd>
    910c:	02812783          	lw	a5,40(sp)
    9110:	00050493          	mv	s1,a0
    9114:	0c079e63          	bnez	a5,91f0 <_dtoa_r+0xd38>
    9118:	03c12c03          	lw	s8,60(sp)
    911c:	17805ee3          	blez	s8,9a98 <_dtoa_r+0x15e0>
    9120:	02012a03          	lw	s4,32(sp)
    9124:	ea1ff06f          	j	8fc4 <_dtoa_r+0xb0c>
    9128:	00100793          	li	a5,1
    912c:	02f12a23          	sw	a5,52(sp)
    9130:	e28ff06f          	j	8758 <_dtoa_r+0x2a0>
    9134:	01c00793          	li	a5,28
    9138:	e3dff06f          	j	8f74 <_dtoa_r+0xabc>
    913c:	00100713          	li	a4,1
    9140:	4d475463          	bge	a4,s4,9608 <_dtoa_r+0x1150>
    9144:	03012783          	lw	a5,48(sp)
    9148:	fffc0b93          	add	s7,s8,-1
    914c:	4177ca63          	blt	a5,s7,9560 <_dtoa_r+0x10a8>
    9150:	41778bb3          	sub	s7,a5,s7
    9154:	01012783          	lw	a5,16(sp)
    9158:	41878cb3          	sub	s9,a5,s8
    915c:	100c54e3          	bgez	s8,9a64 <_dtoa_r+0x15ac>
    9160:	00100593          	li	a1,1
    9164:	00040513          	mv	a0,s0
    9168:	5f1000ef          	jal	9f58 <__i2b>
    916c:	00050913          	mv	s2,a0
    9170:	d79ff06f          	j	8ee8 <_dtoa_r+0xa30>
    9174:	02012a23          	sw	zero,52(sp)
    9178:	00012823          	sw	zero,16(sp)
    917c:	ab5042e3          	bgtz	s5,8c20 <_dtoa_r+0x768>
    9180:	00100793          	li	a5,1
    9184:	415787b3          	sub	a5,a5,s5
    9188:	00f12823          	sw	a5,16(sp)
    918c:	00000b13          	li	s6,0
    9190:	a91ff06f          	j	8c20 <_dtoa_r+0x768>
    9194:	40e787b3          	sub	a5,a5,a4
    9198:	00fd9533          	sll	a0,s11,a5
    919c:	ca0ff06f          	j	863c <_dtoa_r+0x184>
    91a0:	00300793          	li	a5,3
    91a4:	00100913          	li	s2,1
    91a8:	44fa0c63          	beq	s4,a5,9600 <_dtoa_r+0x1148>
    91ac:	df47cc63          	blt	a5,s4,87a4 <_dtoa_r+0x2ec>
    91b0:	00200793          	li	a5,2
    91b4:	18fa00e3          	beq	s4,a5,9b34 <_dtoa_r+0x167c>
    91b8:	02042e23          	sw	zero,60(s0)
    91bc:	00000593          	li	a1,0
    91c0:	00040513          	mv	a0,s0
    91c4:	1e1000ef          	jal	9ba4 <_Balloc>
    91c8:	00050a93          	mv	s5,a0
    91cc:	140500e3          	beqz	a0,9b0c <_dtoa_r+0x1654>
    91d0:	00100793          	li	a5,1
    91d4:	02f12423          	sw	a5,40(sp)
    91d8:	fff00793          	li	a5,-1
    91dc:	02a42c23          	sw	a0,56(s0)
    91e0:	02f12e23          	sw	a5,60(sp)
    91e4:	fff00c13          	li	s8,-1
    91e8:	00012a23          	sw	zero,20(sp)
    91ec:	b35ff06f          	j	8d20 <_dtoa_r+0x868>
    91f0:	00090593          	mv	a1,s2
    91f4:	00000693          	li	a3,0
    91f8:	00a00613          	li	a2,10
    91fc:	00040513          	mv	a0,s0
    9200:	27d000ef          	jal	9c7c <__multadd>
    9204:	03c12c03          	lw	s8,60(sp)
    9208:	00050913          	mv	s2,a0
    920c:	0b805ae3          	blez	s8,9ac0 <_dtoa_r+0x1608>
    9210:	03612023          	sw	s6,32(sp)
    9214:	01905c63          	blez	s9,922c <_dtoa_r+0xd74>
    9218:	00090593          	mv	a1,s2
    921c:	000c8613          	mv	a2,s9
    9220:	00040513          	mv	a0,s0
    9224:	1fc010ef          	jal	a420 <__lshift>
    9228:	00050913          	mv	s2,a0
    922c:	00090b13          	mv	s6,s2
    9230:	50099e63          	bnez	s3,974c <_dtoa_r+0x1294>
    9234:	02412783          	lw	a5,36(sp)
    9238:	fffa8d13          	add	s10,s5,-1
    923c:	000a8c93          	mv	s9,s5
    9240:	01512823          	sw	s5,16(sp)
    9244:	01812a83          	lw	s5,24(sp)
    9248:	0017f793          	and	a5,a5,1
    924c:	018d0d33          	add	s10,s10,s8
    9250:	00f12023          	sw	a5,0(sp)
    9254:	01b12a23          	sw	s11,20(sp)
    9258:	000a8593          	mv	a1,s5
    925c:	00048513          	mv	a0,s1
    9260:	ff9fe0ef          	jal	8258 <quorem>
    9264:	00050c13          	mv	s8,a0
    9268:	00090593          	mv	a1,s2
    926c:	00048513          	mv	a0,s1
    9270:	340010ef          	jal	a5b0 <__mcmp>
    9274:	00050993          	mv	s3,a0
    9278:	000b0613          	mv	a2,s6
    927c:	000a8593          	mv	a1,s5
    9280:	00040513          	mv	a0,s0
    9284:	384010ef          	jal	a608 <__mdiff>
    9288:	00c52703          	lw	a4,12(a0)
    928c:	030c0b93          	add	s7,s8,48
    9290:	00050d93          	mv	s11,a0
    9294:	08071c63          	bnez	a4,932c <_dtoa_r+0xe74>
    9298:	00050593          	mv	a1,a0
    929c:	00048513          	mv	a0,s1
    92a0:	310010ef          	jal	a5b0 <__mcmp>
    92a4:	00050713          	mv	a4,a0
    92a8:	000d8593          	mv	a1,s11
    92ac:	00040513          	mv	a0,s0
    92b0:	00070d93          	mv	s11,a4
    92b4:	1a5000ef          	jal	9c58 <_Bfree>
    92b8:	014de6b3          	or	a3,s11,s4
    92bc:	0e069a63          	bnez	a3,93b0 <_dtoa_r+0xef8>
    92c0:	00012783          	lw	a5,0(sp)
    92c4:	76078e63          	beqz	a5,9a40 <_dtoa_r+0x1588>
    92c8:	7809c663          	bltz	s3,9a54 <_dtoa_r+0x159c>
    92cc:	017c8023          	sb	s7,0(s9)
    92d0:	001c8993          	add	s3,s9,1
    92d4:	679d0e63          	beq	s10,s9,9950 <_dtoa_r+0x1498>
    92d8:	00048593          	mv	a1,s1
    92dc:	00000693          	li	a3,0
    92e0:	00a00613          	li	a2,10
    92e4:	00040513          	mv	a0,s0
    92e8:	195000ef          	jal	9c7c <__multadd>
    92ec:	00050493          	mv	s1,a0
    92f0:	00000693          	li	a3,0
    92f4:	00a00613          	li	a2,10
    92f8:	00090593          	mv	a1,s2
    92fc:	00040513          	mv	a0,s0
    9300:	09690e63          	beq	s2,s6,939c <_dtoa_r+0xee4>
    9304:	179000ef          	jal	9c7c <__multadd>
    9308:	000b0593          	mv	a1,s6
    930c:	00050913          	mv	s2,a0
    9310:	00000693          	li	a3,0
    9314:	00a00613          	li	a2,10
    9318:	00040513          	mv	a0,s0
    931c:	161000ef          	jal	9c7c <__multadd>
    9320:	00050b13          	mv	s6,a0
    9324:	00098c93          	mv	s9,s3
    9328:	f31ff06f          	j	9258 <_dtoa_r+0xda0>
    932c:	00050593          	mv	a1,a0
    9330:	00040513          	mv	a0,s0
    9334:	01012a83          	lw	s5,16(sp)
    9338:	01412d83          	lw	s11,20(sp)
    933c:	11d000ef          	jal	9c58 <_Bfree>
    9340:	0009ca63          	bltz	s3,9354 <_dtoa_r+0xe9c>
    9344:	001df713          	and	a4,s11,1
    9348:	0149e9b3          	or	s3,s3,s4
    934c:	01376733          	or	a4,a4,s3
    9350:	06071e63          	bnez	a4,93cc <_dtoa_r+0xf14>
    9354:	00048593          	mv	a1,s1
    9358:	00100613          	li	a2,1
    935c:	00040513          	mv	a0,s0
    9360:	0c0010ef          	jal	a420 <__lshift>
    9364:	01812583          	lw	a1,24(sp)
    9368:	00050493          	mv	s1,a0
    936c:	244010ef          	jal	a5b0 <__mcmp>
    9370:	24a05863          	blez	a0,95c0 <_dtoa_r+0x1108>
    9374:	03900713          	li	a4,57
    9378:	24eb8c63          	beq	s7,a4,95d0 <_dtoa_r+0x1118>
    937c:	031c0b93          	add	s7,s8,49
    9380:	02012783          	lw	a5,32(sp)
    9384:	00090c13          	mv	s8,s2
    9388:	001c8d13          	add	s10,s9,1
    938c:	017c8023          	sb	s7,0(s9)
    9390:	00178a13          	add	s4,a5,1
    9394:	000b0913          	mv	s2,s6
    9398:	cc5ff06f          	j	905c <_dtoa_r+0xba4>
    939c:	0e1000ef          	jal	9c7c <__multadd>
    93a0:	00050913          	mv	s2,a0
    93a4:	00050b13          	mv	s6,a0
    93a8:	00098c93          	mv	s9,s3
    93ac:	eadff06f          	j	9258 <_dtoa_r+0xda0>
    93b0:	7409c863          	bltz	s3,9b00 <_dtoa_r+0x1648>
    93b4:	00012783          	lw	a5,0(sp)
    93b8:	0149e9b3          	or	s3,s3,s4
    93bc:	0137e9b3          	or	s3,a5,s3
    93c0:	74098063          	beqz	s3,9b00 <_dtoa_r+0x1648>
    93c4:	f1b054e3          	blez	s11,92cc <_dtoa_r+0xe14>
    93c8:	01012a83          	lw	s5,16(sp)
    93cc:	03900713          	li	a4,57
    93d0:	20eb8063          	beq	s7,a4,95d0 <_dtoa_r+0x1118>
    93d4:	02012703          	lw	a4,32(sp)
    93d8:	001b8793          	add	a5,s7,1
    93dc:	00090c13          	mv	s8,s2
    93e0:	001c8d13          	add	s10,s9,1
    93e4:	00170a13          	add	s4,a4,1
    93e8:	00fc8023          	sb	a5,0(s9)
    93ec:	000b0913          	mv	s2,s6
    93f0:	c6dff06f          	j	905c <_dtoa_r+0xba4>
    93f4:	00200793          	li	a5,2
    93f8:	bb47dee3          	bge	a5,s4,8fb4 <_dtoa_r+0xafc>
    93fc:	000a8d13          	mv	s10,s5
    9400:	9a0c10e3          	bnez	s8,8da0 <_dtoa_r+0x8e8>
    9404:	01812583          	lw	a1,24(sp)
    9408:	00000693          	li	a3,0
    940c:	00500613          	li	a2,5
    9410:	00040513          	mv	a0,s0
    9414:	069000ef          	jal	9c7c <__multadd>
    9418:	00050593          	mv	a1,a0
    941c:	00a12c23          	sw	a0,24(sp)
    9420:	00048513          	mv	a0,s1
    9424:	18c010ef          	jal	a5b0 <__mcmp>
    9428:	96a05ce3          	blez	a0,8da0 <_dtoa_r+0x8e8>
    942c:	03100793          	li	a5,49
    9430:	00fa8023          	sb	a5,0(s5)
    9434:	02012783          	lw	a5,32(sp)
    9438:	001a8d13          	add	s10,s5,1
    943c:	00178a13          	add	s4,a5,1
    9440:	01812583          	lw	a1,24(sp)
    9444:	00040513          	mv	a0,s0
    9448:	001a0a13          	add	s4,s4,1
    944c:	00d000ef          	jal	9c58 <_Bfree>
    9450:	c20918e3          	bnez	s2,9080 <_dtoa_r+0xbc8>
    9454:	c39ff06f          	j	908c <_dtoa_r+0xbd4>
    9458:	00050593          	mv	a1,a0
    945c:	00098613          	mv	a2,s3
    9460:	00040513          	mv	a0,s0
    9464:	66d000ef          	jal	a2d0 <__pow5mult>
    9468:	00100793          	li	a5,1
    946c:	00a12c23          	sw	a0,24(sp)
    9470:	1147de63          	bge	a5,s4,958c <_dtoa_r+0x10d4>
    9474:	00000993          	li	s3,0
    9478:	01812703          	lw	a4,24(sp)
    947c:	01072783          	lw	a5,16(a4)
    9480:	00378793          	add	a5,a5,3
    9484:	00279793          	sll	a5,a5,0x2
    9488:	00f707b3          	add	a5,a4,a5
    948c:	0047a503          	lw	a0,4(a5)
    9490:	171000ef          	jal	9e00 <__hi0bits>
    9494:	02000793          	li	a5,32
    9498:	40a787b3          	sub	a5,a5,a0
    949c:	ab5ff06f          	j	8f50 <_dtoa_r+0xa98>
    94a0:	02412783          	lw	a5,36(sp)
    94a4:	04079063          	bnez	a5,94e4 <_dtoa_r+0x102c>
    94a8:	00012783          	lw	a5,0(sp)
    94ac:	00c79793          	sll	a5,a5,0xc
    94b0:	02079a63          	bnez	a5,94e4 <_dtoa_r+0x102c>
    94b4:	00012683          	lw	a3,0(sp)
    94b8:	00000793          	li	a5,0
    94bc:	0146d713          	srl	a4,a3,0x14
    94c0:	7ff77713          	and	a4,a4,2047
    94c4:	00070c63          	beqz	a4,94dc <_dtoa_r+0x1024>
    94c8:	01012783          	lw	a5,16(sp)
    94cc:	001b0b13          	add	s6,s6,1
    94d0:	00178793          	add	a5,a5,1
    94d4:	00f12823          	sw	a5,16(sp)
    94d8:	00100793          	li	a5,1
    94dc:	58099063          	bnez	s3,9a5c <_dtoa_r+0x15a4>
    94e0:	00078993          	mv	s3,a5
    94e4:	00100793          	li	a5,1
    94e8:	a69ff06f          	j	8f50 <_dtoa_r+0xa98>
    94ec:	a8d70ee3          	beq	a4,a3,8f88 <_dtoa_r+0xad0>
    94f0:	03c00713          	li	a4,60
    94f4:	40f707b3          	sub	a5,a4,a5
    94f8:	a7dff06f          	j	8f74 <_dtoa_r+0xabc>
    94fc:	00100793          	li	a5,1
    9500:	00500a13          	li	s4,5
    9504:	02f12423          	sw	a5,40(sp)
    9508:	01412783          	lw	a5,20(sp)
    950c:	02012703          	lw	a4,32(sp)
    9510:	00e787b3          	add	a5,a5,a4
    9514:	00178c13          	add	s8,a5,1
    9518:	02f12e23          	sw	a5,60(sp)
    951c:	000c0613          	mv	a2,s8
    9520:	ab804263          	bgtz	s8,87c4 <_dtoa_r+0x30c>
    9524:	00100613          	li	a2,1
    9528:	a9cff06f          	j	87c4 <_dtoa_r+0x30c>
    952c:	00051663          	bnez	a0,9538 <_dtoa_r+0x1080>
    9530:	001bf793          	and	a5,s7,1
    9534:	b00792e3          	bnez	a5,9038 <_dtoa_r+0xb80>
    9538:	03000693          	li	a3,48
    953c:	fff9c783          	lbu	a5,-1(s3)
    9540:	00098d13          	mv	s10,s3
    9544:	fff98993          	add	s3,s3,-1
    9548:	fed78ae3          	beq	a5,a3,953c <_dtoa_r+0x1084>
    954c:	b11ff06f          	j	905c <_dtoa_r+0xba4>
    9550:	000c0993          	mv	s3,s8
    9554:	abdff06f          	j	9010 <_dtoa_r+0xb58>
    9558:	000b0793          	mv	a5,s6
    955c:	99dff06f          	j	8ef8 <_dtoa_r+0xa40>
    9560:	03012783          	lw	a5,48(sp)
    9564:	01012703          	lw	a4,16(sp)
    9568:	03712823          	sw	s7,48(sp)
    956c:	40fb87b3          	sub	a5,s7,a5
    9570:	00f989b3          	add	s3,s3,a5
    9574:	018707b3          	add	a5,a4,s8
    9578:	00070c93          	mv	s9,a4
    957c:	018b0b33          	add	s6,s6,s8
    9580:	00f12823          	sw	a5,16(sp)
    9584:	00000b93          	li	s7,0
    9588:	bd9ff06f          	j	9160 <_dtoa_r+0xca8>
    958c:	02412783          	lw	a5,36(sp)
    9590:	ee0792e3          	bnez	a5,9474 <_dtoa_r+0xfbc>
    9594:	00012783          	lw	a5,0(sp)
    9598:	00c79793          	sll	a5,a5,0xc
    959c:	ec079ce3          	bnez	a5,9474 <_dtoa_r+0xfbc>
    95a0:	f15ff06f          	j	94b4 <_dtoa_r+0xffc>
    95a4:	01812303          	lw	t1,24(sp)
    95a8:	01c12d03          	lw	s10,28(sp)
    95ac:	00200913          	li	s2,2
    95b0:	ad0ff06f          	j	8880 <_dtoa_r+0x3c8>
    95b4:	00200a13          	li	s4,2
    95b8:	02012423          	sw	zero,40(sp)
    95bc:	9f8ff06f          	j	87b4 <_dtoa_r+0x2fc>
    95c0:	dc0510e3          	bnez	a0,9380 <_dtoa_r+0xec8>
    95c4:	001bf713          	and	a4,s7,1
    95c8:	da0716e3          	bnez	a4,9374 <_dtoa_r+0xebc>
    95cc:	db5ff06f          	j	9380 <_dtoa_r+0xec8>
    95d0:	03900793          	li	a5,57
    95d4:	00fc8023          	sb	a5,0(s9)
    95d8:	02012783          	lw	a5,32(sp)
    95dc:	00090c13          	mv	s8,s2
    95e0:	001c8993          	add	s3,s9,1
    95e4:	00178a13          	add	s4,a5,1
    95e8:	000b0913          	mv	s2,s6
    95ec:	a4dff06f          	j	9038 <_dtoa_r+0xb80>
    95f0:	00100793          	li	a5,1
    95f4:	00100c13          	li	s8,1
    95f8:	00f12a23          	sw	a5,20(sp)
    95fc:	e50ff06f          	j	8c4c <_dtoa_r+0x794>
    9600:	02012423          	sw	zero,40(sp)
    9604:	f05ff06f          	j	9508 <_dtoa_r+0x1050>
    9608:	03812703          	lw	a4,56(sp)
    960c:	30070e63          	beqz	a4,9928 <_dtoa_r+0x1470>
    9610:	01012703          	lw	a4,16(sp)
    9614:	43378793          	add	a5,a5,1075
    9618:	00fb0b33          	add	s6,s6,a5
    961c:	00f707b3          	add	a5,a4,a5
    9620:	03012b83          	lw	s7,48(sp)
    9624:	00070c93          	mv	s9,a4
    9628:	00f12823          	sw	a5,16(sp)
    962c:	b35ff06f          	j	9160 <_dtoa_r+0xca8>
    9630:	03100793          	li	a5,49
    9634:	00fa8023          	sb	a5,0(s5)
    9638:	001a0a13          	add	s4,s4,1
    963c:	a21ff06f          	j	905c <_dtoa_r+0xba4>
    9640:	02012783          	lw	a5,32(sp)
    9644:	32078263          	beqz	a5,9968 <_dtoa_r+0x14b0>
    9648:	40f00bb3          	neg	s7,a5
    964c:	00fbf713          	and	a4,s7,15
    9650:	00371713          	sll	a4,a4,0x3
    9654:	00006797          	auipc	a5,0x6
    9658:	58478793          	add	a5,a5,1412 # fbd8 <__mprec_tens>
    965c:	00e787b3          	add	a5,a5,a4
    9660:	0007a603          	lw	a2,0(a5)
    9664:	0047a683          	lw	a3,4(a5)
    9668:	01812503          	lw	a0,24(sp)
    966c:	01c12583          	lw	a1,28(sp)
    9670:	404bdb93          	sra	s7,s7,0x4
    9674:	3d4040ef          	jal	da48 <__muldf3>
    9678:	00058d13          	mv	s10,a1
    967c:	440b8c63          	beqz	s7,9ad4 <_dtoa_r+0x161c>
    9680:	00200913          	li	s2,2
    9684:	04812023          	sw	s0,64(sp)
    9688:	00006c97          	auipc	s9,0x6
    968c:	528c8c93          	add	s9,s9,1320 # fbb0 <__mprec_bigtens>
    9690:	00090413          	mv	s0,s2
    9694:	00050713          	mv	a4,a0
    9698:	00000613          	li	a2,0
    969c:	00050913          	mv	s2,a0
    96a0:	001bf693          	and	a3,s7,1
    96a4:	02068063          	beqz	a3,96c4 <_dtoa_r+0x120c>
    96a8:	000ca603          	lw	a2,0(s9)
    96ac:	004ca683          	lw	a3,4(s9)
    96b0:	00070513          	mv	a0,a4
    96b4:	00140413          	add	s0,s0,1
    96b8:	390040ef          	jal	da48 <__muldf3>
    96bc:	00050713          	mv	a4,a0
    96c0:	00100613          	li	a2,1
    96c4:	401bdb93          	sra	s7,s7,0x1
    96c8:	008c8c93          	add	s9,s9,8
    96cc:	fc0b9ae3          	bnez	s7,96a0 <_dtoa_r+0x11e8>
    96d0:	00090513          	mv	a0,s2
    96d4:	00058793          	mv	a5,a1
    96d8:	00040913          	mv	s2,s0
    96dc:	04012403          	lw	s0,64(sp)
    96e0:	a0061a63          	bnez	a2,88f4 <_dtoa_r+0x43c>
    96e4:	00050713          	mv	a4,a0
    96e8:	000d0793          	mv	a5,s10
    96ec:	a08ff06f          	j	88f4 <_dtoa_r+0x43c>
    96f0:	00068593          	mv	a1,a3
    96f4:	00070613          	mv	a2,a4
    96f8:	00070513          	mv	a0,a4
    96fc:	745020ef          	jal	c640 <__adddf3>
    9700:	02012783          	lw	a5,32(sp)
    9704:	00090613          	mv	a2,s2
    9708:	00098693          	mv	a3,s3
    970c:	00178a13          	add	s4,a5,1
    9710:	00050c93          	mv	s9,a0
    9714:	00058b13          	mv	s6,a1
    9718:	000a0c13          	mv	s8,s4
    971c:	124040ef          	jal	d840 <__gedf2>
    9720:	c4a04863          	bgtz	a0,8b70 <_dtoa_r+0x6b8>
    9724:	000c8513          	mv	a0,s9
    9728:	000b0593          	mv	a1,s6
    972c:	00090613          	mv	a2,s2
    9730:	00098693          	mv	a3,s3
    9734:	080040ef          	jal	d7b4 <__eqdf2>
    9738:	00051663          	bnez	a0,9744 <_dtoa_r+0x128c>
    973c:	001d7d13          	and	s10,s10,1
    9740:	c20d1863          	bnez	s10,8b70 <_dtoa_r+0x6b8>
    9744:	000b8d13          	mv	s10,s7
    9748:	945ff06f          	j	908c <_dtoa_r+0xbd4>
    974c:	00492583          	lw	a1,4(s2)
    9750:	00040513          	mv	a0,s0
    9754:	450000ef          	jal	9ba4 <_Balloc>
    9758:	00050993          	mv	s3,a0
    975c:	38050463          	beqz	a0,9ae4 <_dtoa_r+0x162c>
    9760:	01092603          	lw	a2,16(s2)
    9764:	00c90593          	add	a1,s2,12
    9768:	00c50513          	add	a0,a0,12
    976c:	00260613          	add	a2,a2,2
    9770:	00261613          	sll	a2,a2,0x2
    9774:	ccdf70ef          	jal	1440 <memcpy>
    9778:	00100613          	li	a2,1
    977c:	00098593          	mv	a1,s3
    9780:	00040513          	mv	a0,s0
    9784:	49d000ef          	jal	a420 <__lshift>
    9788:	00050b13          	mv	s6,a0
    978c:	aa9ff06f          	j	9234 <_dtoa_r+0xd7c>
    9790:	00090593          	mv	a1,s2
    9794:	000b8613          	mv	a2,s7
    9798:	00040513          	mv	a0,s0
    979c:	335000ef          	jal	a2d0 <__pow5mult>
    97a0:	00048613          	mv	a2,s1
    97a4:	00050593          	mv	a1,a0
    97a8:	00050913          	mv	s2,a0
    97ac:	00040513          	mv	a0,s0
    97b0:	059000ef          	jal	a008 <__multiply>
    97b4:	00050793          	mv	a5,a0
    97b8:	00048593          	mv	a1,s1
    97bc:	00040513          	mv	a0,s0
    97c0:	00078493          	mv	s1,a5
    97c4:	494000ef          	jal	9c58 <_Bfree>
    97c8:	03012783          	lw	a5,48(sp)
    97cc:	417787b3          	sub	a5,a5,s7
    97d0:	02f12823          	sw	a5,48(sp)
    97d4:	f6078063          	beqz	a5,8f34 <_dtoa_r+0xa7c>
    97d8:	f48ff06f          	j	8f20 <_dtoa_r+0xa68>
    97dc:	05012603          	lw	a2,80(sp)
    97e0:	05412683          	lw	a3,84(sp)
    97e4:	05812503          	lw	a0,88(sp)
    97e8:	04b12623          	sw	a1,76(sp)
    97ec:	000b8593          	mv	a1,s7
    97f0:	02612423          	sw	t1,40(sp)
    97f4:	254040ef          	jal	da48 <__muldf3>
    97f8:	02812303          	lw	t1,40(sp)
    97fc:	04812783          	lw	a5,72(sp)
    9800:	00100693          	li	a3,1
    9804:	006a8023          	sb	t1,0(s5)
    9808:	02a12c23          	sw	a0,56(sp)
    980c:	04c12883          	lw	a7,76(sp)
    9810:	00058913          	mv	s2,a1
    9814:	00fa8bb3          	add	s7,s5,a5
    9818:	7fff7617          	auipc	a2,0x7fff7
    981c:	ed860613          	add	a2,a2,-296 # 800006f0 <__global_locale+0x1bc>
    9820:	28d78c63          	beq	a5,a3,9ab8 <_dtoa_r+0x1600>
    9824:	00062783          	lw	a5,0(a2)
    9828:	00462803          	lw	a6,4(a2)
    982c:	04912423          	sw	s1,72(sp)
    9830:	02f12423          	sw	a5,40(sp)
    9834:	03012623          	sw	a6,44(sp)
    9838:	04812623          	sw	s0,76(sp)
    983c:	000c8513          	mv	a0,s9
    9840:	00088593          	mv	a1,a7
    9844:	02812603          	lw	a2,40(sp)
    9848:	02c12683          	lw	a3,44(sp)
    984c:	001d0d13          	add	s10,s10,1
    9850:	1f8040ef          	jal	da48 <__muldf3>
    9854:	00058413          	mv	s0,a1
    9858:	00050493          	mv	s1,a0
    985c:	2d8050ef          	jal	eb34 <__fixdfsi>
    9860:	00050c93          	mv	s9,a0
    9864:	354050ef          	jal	ebb8 <__floatsidf>
    9868:	00050613          	mv	a2,a0
    986c:	00058693          	mv	a3,a1
    9870:	00048513          	mv	a0,s1
    9874:	00040593          	mv	a1,s0
    9878:	030c8c93          	add	s9,s9,48
    987c:	15d040ef          	jal	e1d8 <__subdf3>
    9880:	ff9d0fa3          	sb	s9,-1(s10)
    9884:	fdab90e3          	bne	s7,s10,9844 <_dtoa_r+0x138c>
    9888:	04812483          	lw	s1,72(sp)
    988c:	04c12403          	lw	s0,76(sp)
    9890:	00050c93          	mv	s9,a0
    9894:	00058893          	mv	a7,a1
    9898:	7fff7d17          	auipc	s10,0x7fff7
    989c:	e20d0d13          	add	s10,s10,-480 # 800006b8 <__global_locale+0x184>
    98a0:	000d2603          	lw	a2,0(s10)
    98a4:	004d2683          	lw	a3,4(s10)
    98a8:	03812503          	lw	a0,56(sp)
    98ac:	00090593          	mv	a1,s2
    98b0:	03112423          	sw	a7,40(sp)
    98b4:	58d020ef          	jal	c640 <__adddf3>
    98b8:	02812883          	lw	a7,40(sp)
    98bc:	000c8613          	mv	a2,s9
    98c0:	00088693          	mv	a3,a7
    98c4:	07c040ef          	jal	d940 <__ledf2>
    98c8:	1a054863          	bltz	a0,9a78 <_dtoa_r+0x15c0>
    98cc:	03812603          	lw	a2,56(sp)
    98d0:	000d2503          	lw	a0,0(s10)
    98d4:	004d2583          	lw	a1,4(s10)
    98d8:	00090693          	mv	a3,s2
    98dc:	0fd040ef          	jal	e1d8 <__subdf3>
    98e0:	02812883          	lw	a7,40(sp)
    98e4:	000c8613          	mv	a2,s9
    98e8:	00088693          	mv	a3,a7
    98ec:	755030ef          	jal	d840 <__gedf2>
    98f0:	12a04863          	bgtz	a0,9a20 <_dtoa_r+0x1568>
    98f4:	06c12783          	lw	a5,108(sp)
    98f8:	de07c063          	bltz	a5,8ed8 <_dtoa_r+0xa20>
    98fc:	02012703          	lw	a4,32(sp)
    9900:	00e00793          	li	a5,14
    9904:	dce7ca63          	blt	a5,a4,8ed8 <_dtoa_r+0xa20>
    9908:	02012783          	lw	a5,32(sp)
    990c:	00006717          	auipc	a4,0x6
    9910:	2cc70713          	add	a4,a4,716 # fbd8 <__mprec_tens>
    9914:	00379793          	sll	a5,a5,0x3
    9918:	00f707b3          	add	a5,a4,a5
    991c:	0007a903          	lw	s2,0(a5)
    9920:	0047a983          	lw	s3,4(a5)
    9924:	c90ff06f          	j	8db4 <_dtoa_r+0x8fc>
    9928:	06812703          	lw	a4,104(sp)
    992c:	01012683          	lw	a3,16(sp)
    9930:	03600793          	li	a5,54
    9934:	40e787b3          	sub	a5,a5,a4
    9938:	00fb0b33          	add	s6,s6,a5
    993c:	00f687b3          	add	a5,a3,a5
    9940:	03012b83          	lw	s7,48(sp)
    9944:	00068c93          	mv	s9,a3
    9948:	00f12823          	sw	a5,16(sp)
    994c:	815ff06f          	j	9160 <_dtoa_r+0xca8>
    9950:	02012783          	lw	a5,32(sp)
    9954:	00090c13          	mv	s8,s2
    9958:	01012a83          	lw	s5,16(sp)
    995c:	00178a13          	add	s4,a5,1
    9960:	000b0913          	mv	s2,s6
    9964:	eb4ff06f          	j	9018 <_dtoa_r+0xb60>
    9968:	01812703          	lw	a4,24(sp)
    996c:	01c12783          	lw	a5,28(sp)
    9970:	00200913          	li	s2,2
    9974:	f81fe06f          	j	88f4 <_dtoa_r+0x43c>
    9978:	b00c0063          	beqz	s8,8c78 <_dtoa_r+0x7c0>
    997c:	03c12d03          	lw	s10,60(sp)
    9980:	bba05063          	blez	s10,8d20 <_dtoa_r+0x868>
    9984:	7fff7617          	auipc	a2,0x7fff7
    9988:	d6c60613          	add	a2,a2,-660 # 800006f0 <__global_locale+0x1bc>
    998c:	00078593          	mv	a1,a5
    9990:	02012783          	lw	a5,32(sp)
    9994:	00462683          	lw	a3,4(a2)
    9998:	00062603          	lw	a2,0(a2)
    999c:	fff78793          	add	a5,a5,-1
    99a0:	00070513          	mv	a0,a4
    99a4:	04f12e23          	sw	a5,92(sp)
    99a8:	0a0040ef          	jal	da48 <__muldf3>
    99ac:	00050713          	mv	a4,a0
    99b0:	00190513          	add	a0,s2,1
    99b4:	04e12423          	sw	a4,72(sp)
    99b8:	04b12023          	sw	a1,64(sp)
    99bc:	1fc050ef          	jal	ebb8 <__floatsidf>
    99c0:	04812703          	lw	a4,72(sp)
    99c4:	04012783          	lw	a5,64(sp)
    99c8:	00070613          	mv	a2,a4
    99cc:	00078693          	mv	a3,a5
    99d0:	04e12623          	sw	a4,76(sp)
    99d4:	074040ef          	jal	da48 <__muldf3>
    99d8:	7fff7697          	auipc	a3,0x7fff7
    99dc:	d2068693          	add	a3,a3,-736 # 800006f8 <__global_locale+0x1c4>
    99e0:	0006a603          	lw	a2,0(a3)
    99e4:	0046a683          	lw	a3,4(a3)
    99e8:	459020ef          	jal	c640 <__adddf3>
    99ec:	fcc006b7          	lui	a3,0xfcc00
    99f0:	04012783          	lw	a5,64(sp)
    99f4:	04c12703          	lw	a4,76(sp)
    99f8:	00050c93          	mv	s9,a0
    99fc:	00b68bb3          	add	s7,a3,a1
    9a00:	05a12423          	sw	s10,72(sp)
    9a04:	f91fe06f          	j	8994 <_dtoa_r+0x4dc>
    9a08:	03100693          	li	a3,49
    9a0c:	001c0c13          	add	s8,s8,1
    9a10:	984ff06f          	j	8b94 <_dtoa_r+0x6dc>
    9a14:	00012c23          	sw	zero,24(sp)
    9a18:	00000913          	li	s2,0
    9a1c:	a11ff06f          	j	942c <_dtoa_r+0xf74>
    9a20:	03000613          	li	a2,48
    9a24:	fffbc783          	lbu	a5,-1(s7)
    9a28:	000b8d13          	mv	s10,s7
    9a2c:	fffb8b93          	add	s7,s7,-1
    9a30:	fec78ae3          	beq	a5,a2,9a24 <_dtoa_r+0x156c>
    9a34:	05c12783          	lw	a5,92(sp)
    9a38:	00178a13          	add	s4,a5,1
    9a3c:	e50ff06f          	j	908c <_dtoa_r+0xbd4>
    9a40:	03900713          	li	a4,57
    9a44:	01012a83          	lw	s5,16(sp)
    9a48:	b8eb84e3          	beq	s7,a4,95d0 <_dtoa_r+0x1118>
    9a4c:	933048e3          	bgtz	s3,937c <_dtoa_r+0xec4>
    9a50:	931ff06f          	j	9380 <_dtoa_r+0xec8>
    9a54:	01012a83          	lw	s5,16(sp)
    9a58:	929ff06f          	j	9380 <_dtoa_r+0xec8>
    9a5c:	00078993          	mv	s3,a5
    9a60:	a19ff06f          	j	9478 <_dtoa_r+0xfc0>
    9a64:	00078c93          	mv	s9,a5
    9a68:	018787b3          	add	a5,a5,s8
    9a6c:	018b0b33          	add	s6,s6,s8
    9a70:	00f12823          	sw	a5,16(sp)
    9a74:	eecff06f          	j	9160 <_dtoa_r+0xca8>
    9a78:	05c12783          	lw	a5,92(sp)
    9a7c:	00178c13          	add	s8,a5,1
    9a80:	8f0ff06f          	j	8b70 <_dtoa_r+0x6b8>
    9a84:	04c12983          	lw	s3,76(sp)
    9a88:	05012b03          	lw	s6,80(sp)
    9a8c:	05812c03          	lw	s8,88(sp)
    9a90:	04812a03          	lw	s4,72(sp)
    9a94:	a8cff06f          	j	8d20 <_dtoa_r+0x868>
    9a98:	00200793          	li	a5,2
    9a9c:	0147c863          	blt	a5,s4,9aac <_dtoa_r+0x15f4>
    9aa0:	02012a03          	lw	s4,32(sp)
    9aa4:	03c12c03          	lw	s8,60(sp)
    9aa8:	d1cff06f          	j	8fc4 <_dtoa_r+0xb0c>
    9aac:	03c12c03          	lw	s8,60(sp)
    9ab0:	03612023          	sw	s6,32(sp)
    9ab4:	949ff06f          	j	93fc <_dtoa_r+0xf44>
    9ab8:	04012b83          	lw	s7,64(sp)
    9abc:	dddff06f          	j	9898 <_dtoa_r+0x13e0>
    9ac0:	00200793          	li	a5,2
    9ac4:	ff47c4e3          	blt	a5,s4,9aac <_dtoa_r+0x15f4>
    9ac8:	03c12c03          	lw	s8,60(sp)
    9acc:	03612023          	sw	s6,32(sp)
    9ad0:	f44ff06f          	j	9214 <_dtoa_r+0xd5c>
    9ad4:	00050713          	mv	a4,a0
    9ad8:	00058793          	mv	a5,a1
    9adc:	00200913          	li	s2,2
    9ae0:	e15fe06f          	j	88f4 <_dtoa_r+0x43c>
    9ae4:	00006697          	auipc	a3,0x6
    9ae8:	ab468693          	add	a3,a3,-1356 # f598 <__fini_array_end+0x290>
    9aec:	00000613          	li	a2,0
    9af0:	2ef00593          	li	a1,751
    9af4:	00006517          	auipc	a0,0x6
    9af8:	ab850513          	add	a0,a0,-1352 # f5ac <__fini_array_end+0x2a4>
    9afc:	0cd010ef          	jal	b3c8 <__assert_func>
    9b00:	01012a83          	lw	s5,16(sp)
    9b04:	85b048e3          	bgtz	s11,9354 <_dtoa_r+0xe9c>
    9b08:	879ff06f          	j	9380 <_dtoa_r+0xec8>
    9b0c:	00006697          	auipc	a3,0x6
    9b10:	a8c68693          	add	a3,a3,-1396 # f598 <__fini_array_end+0x290>
    9b14:	00000613          	li	a2,0
    9b18:	1af00593          	li	a1,431
    9b1c:	00006517          	auipc	a0,0x6
    9b20:	a9050513          	add	a0,a0,-1392 # f5ac <__fini_array_end+0x2a4>
    9b24:	0a5010ef          	jal	b3c8 <__assert_func>
    9b28:	02042e23          	sw	zero,60(s0)
    9b2c:	00000593          	li	a1,0
    9b30:	cc1fe06f          	j	87f0 <_dtoa_r+0x338>
    9b34:	02012423          	sw	zero,40(sp)
    9b38:	c7dfe06f          	j	87b4 <_dtoa_r+0x2fc>

00009b3c <__ascii_mbtowc>:
    9b3c:	02058063          	beqz	a1,9b5c <__ascii_mbtowc+0x20>
    9b40:	04060263          	beqz	a2,9b84 <__ascii_mbtowc+0x48>
    9b44:	04068863          	beqz	a3,9b94 <__ascii_mbtowc+0x58>
    9b48:	00064783          	lbu	a5,0(a2)
    9b4c:	00f5a023          	sw	a5,0(a1)
    9b50:	00064503          	lbu	a0,0(a2)
    9b54:	00a03533          	snez	a0,a0
    9b58:	00008067          	ret
    9b5c:	ff010113          	add	sp,sp,-16
    9b60:	00c10593          	add	a1,sp,12
    9b64:	02060463          	beqz	a2,9b8c <__ascii_mbtowc+0x50>
    9b68:	02068a63          	beqz	a3,9b9c <__ascii_mbtowc+0x60>
    9b6c:	00064783          	lbu	a5,0(a2)
    9b70:	00f5a023          	sw	a5,0(a1)
    9b74:	00064503          	lbu	a0,0(a2)
    9b78:	00a03533          	snez	a0,a0
    9b7c:	01010113          	add	sp,sp,16
    9b80:	00008067          	ret
    9b84:	00000513          	li	a0,0
    9b88:	00008067          	ret
    9b8c:	00000513          	li	a0,0
    9b90:	fedff06f          	j	9b7c <__ascii_mbtowc+0x40>
    9b94:	ffe00513          	li	a0,-2
    9b98:	00008067          	ret
    9b9c:	ffe00513          	li	a0,-2
    9ba0:	fddff06f          	j	9b7c <__ascii_mbtowc+0x40>

00009ba4 <_Balloc>:
    9ba4:	04452783          	lw	a5,68(a0)
    9ba8:	ff010113          	add	sp,sp,-16
    9bac:	00812423          	sw	s0,8(sp)
    9bb0:	00912223          	sw	s1,4(sp)
    9bb4:	00112623          	sw	ra,12(sp)
    9bb8:	00050413          	mv	s0,a0
    9bbc:	00058493          	mv	s1,a1
    9bc0:	02078c63          	beqz	a5,9bf8 <_Balloc+0x54>
    9bc4:	00249713          	sll	a4,s1,0x2
    9bc8:	00e787b3          	add	a5,a5,a4
    9bcc:	0007a503          	lw	a0,0(a5)
    9bd0:	04050463          	beqz	a0,9c18 <_Balloc+0x74>
    9bd4:	00052703          	lw	a4,0(a0)
    9bd8:	00e7a023          	sw	a4,0(a5)
    9bdc:	00052823          	sw	zero,16(a0)
    9be0:	00052623          	sw	zero,12(a0)
    9be4:	00c12083          	lw	ra,12(sp)
    9be8:	00812403          	lw	s0,8(sp)
    9bec:	00412483          	lw	s1,4(sp)
    9bf0:	01010113          	add	sp,sp,16
    9bf4:	00008067          	ret
    9bf8:	02100613          	li	a2,33
    9bfc:	00400593          	li	a1,4
    9c00:	021010ef          	jal	b420 <_calloc_r>
    9c04:	04a42223          	sw	a0,68(s0)
    9c08:	00050793          	mv	a5,a0
    9c0c:	fa051ce3          	bnez	a0,9bc4 <_Balloc+0x20>
    9c10:	00000513          	li	a0,0
    9c14:	fd1ff06f          	j	9be4 <_Balloc+0x40>
    9c18:	01212023          	sw	s2,0(sp)
    9c1c:	00100913          	li	s2,1
    9c20:	00991933          	sll	s2,s2,s1
    9c24:	00590613          	add	a2,s2,5
    9c28:	00261613          	sll	a2,a2,0x2
    9c2c:	00100593          	li	a1,1
    9c30:	00040513          	mv	a0,s0
    9c34:	7ec010ef          	jal	b420 <_calloc_r>
    9c38:	00050a63          	beqz	a0,9c4c <_Balloc+0xa8>
    9c3c:	01252423          	sw	s2,8(a0)
    9c40:	00952223          	sw	s1,4(a0)
    9c44:	00012903          	lw	s2,0(sp)
    9c48:	f95ff06f          	j	9bdc <_Balloc+0x38>
    9c4c:	00012903          	lw	s2,0(sp)
    9c50:	00000513          	li	a0,0
    9c54:	f91ff06f          	j	9be4 <_Balloc+0x40>

00009c58 <_Bfree>:
    9c58:	02058063          	beqz	a1,9c78 <_Bfree+0x20>
    9c5c:	0045a703          	lw	a4,4(a1)
    9c60:	04452783          	lw	a5,68(a0)
    9c64:	00271713          	sll	a4,a4,0x2
    9c68:	00e787b3          	add	a5,a5,a4
    9c6c:	0007a703          	lw	a4,0(a5)
    9c70:	00e5a023          	sw	a4,0(a1)
    9c74:	00b7a023          	sw	a1,0(a5)
    9c78:	00008067          	ret

00009c7c <__multadd>:
    9c7c:	fd010113          	add	sp,sp,-48
    9c80:	01412c23          	sw	s4,24(sp)
    9c84:	0105aa03          	lw	s4,16(a1)
    9c88:	01912223          	sw	s9,4(sp)
    9c8c:	00010cb7          	lui	s9,0x10
    9c90:	02912223          	sw	s1,36(sp)
    9c94:	03212023          	sw	s2,32(sp)
    9c98:	01312e23          	sw	s3,28(sp)
    9c9c:	01512a23          	sw	s5,20(sp)
    9ca0:	01612823          	sw	s6,16(sp)
    9ca4:	01712623          	sw	s7,12(sp)
    9ca8:	02112623          	sw	ra,44(sp)
    9cac:	02812423          	sw	s0,40(sp)
    9cb0:	01812423          	sw	s8,8(sp)
    9cb4:	00058a93          	mv	s5,a1
    9cb8:	00050b13          	mv	s6,a0
    9cbc:	00060993          	mv	s3,a2
    9cc0:	00068493          	mv	s1,a3
    9cc4:	01458913          	add	s2,a1,20
    9cc8:	00000b93          	li	s7,0
    9ccc:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    9cd0:	00092c03          	lw	s8,0(s2)
    9cd4:	00098593          	mv	a1,s3
    9cd8:	00490913          	add	s2,s2,4
    9cdc:	019c7533          	and	a0,s8,s9
    9ce0:	430050ef          	jal	f110 <__mulsi3>
    9ce4:	00050413          	mv	s0,a0
    9ce8:	00098593          	mv	a1,s3
    9cec:	010c5513          	srl	a0,s8,0x10
    9cf0:	00940433          	add	s0,s0,s1
    9cf4:	41c050ef          	jal	f110 <__mulsi3>
    9cf8:	01045793          	srl	a5,s0,0x10
    9cfc:	00f50533          	add	a0,a0,a5
    9d00:	01051793          	sll	a5,a0,0x10
    9d04:	01947433          	and	s0,s0,s9
    9d08:	008787b3          	add	a5,a5,s0
    9d0c:	fef92e23          	sw	a5,-4(s2)
    9d10:	001b8b93          	add	s7,s7,1
    9d14:	01055493          	srl	s1,a0,0x10
    9d18:	fb4bcce3          	blt	s7,s4,9cd0 <__multadd+0x54>
    9d1c:	02048263          	beqz	s1,9d40 <__multadd+0xc4>
    9d20:	008aa783          	lw	a5,8(s5)
    9d24:	04fa5a63          	bge	s4,a5,9d78 <__multadd+0xfc>
    9d28:	004a0793          	add	a5,s4,4
    9d2c:	00279793          	sll	a5,a5,0x2
    9d30:	00fa87b3          	add	a5,s5,a5
    9d34:	0097a223          	sw	s1,4(a5)
    9d38:	001a0a13          	add	s4,s4,1
    9d3c:	014aa823          	sw	s4,16(s5)
    9d40:	02c12083          	lw	ra,44(sp)
    9d44:	02812403          	lw	s0,40(sp)
    9d48:	02412483          	lw	s1,36(sp)
    9d4c:	02012903          	lw	s2,32(sp)
    9d50:	01c12983          	lw	s3,28(sp)
    9d54:	01812a03          	lw	s4,24(sp)
    9d58:	01012b03          	lw	s6,16(sp)
    9d5c:	00c12b83          	lw	s7,12(sp)
    9d60:	00812c03          	lw	s8,8(sp)
    9d64:	00412c83          	lw	s9,4(sp)
    9d68:	000a8513          	mv	a0,s5
    9d6c:	01412a83          	lw	s5,20(sp)
    9d70:	03010113          	add	sp,sp,48
    9d74:	00008067          	ret
    9d78:	004aa583          	lw	a1,4(s5)
    9d7c:	000b0513          	mv	a0,s6
    9d80:	00158593          	add	a1,a1,1
    9d84:	e21ff0ef          	jal	9ba4 <_Balloc>
    9d88:	00050413          	mv	s0,a0
    9d8c:	04050c63          	beqz	a0,9de4 <__multadd+0x168>
    9d90:	010aa603          	lw	a2,16(s5)
    9d94:	00ca8593          	add	a1,s5,12
    9d98:	00c50513          	add	a0,a0,12
    9d9c:	00260613          	add	a2,a2,2
    9da0:	00261613          	sll	a2,a2,0x2
    9da4:	e9cf70ef          	jal	1440 <memcpy>
    9da8:	004aa703          	lw	a4,4(s5)
    9dac:	044b2783          	lw	a5,68(s6)
    9db0:	00271713          	sll	a4,a4,0x2
    9db4:	00e787b3          	add	a5,a5,a4
    9db8:	0007a703          	lw	a4,0(a5)
    9dbc:	00eaa023          	sw	a4,0(s5)
    9dc0:	0157a023          	sw	s5,0(a5)
    9dc4:	004a0793          	add	a5,s4,4
    9dc8:	00040a93          	mv	s5,s0
    9dcc:	00279793          	sll	a5,a5,0x2
    9dd0:	00fa87b3          	add	a5,s5,a5
    9dd4:	0097a223          	sw	s1,4(a5)
    9dd8:	001a0a13          	add	s4,s4,1
    9ddc:	014aa823          	sw	s4,16(s5)
    9de0:	f61ff06f          	j	9d40 <__multadd+0xc4>
    9de4:	00005697          	auipc	a3,0x5
    9de8:	7b468693          	add	a3,a3,1972 # f598 <__fini_array_end+0x290>
    9dec:	00000613          	li	a2,0
    9df0:	0ba00593          	li	a1,186
    9df4:	00006517          	auipc	a0,0x6
    9df8:	83850513          	add	a0,a0,-1992 # f62c <__fini_array_end+0x324>
    9dfc:	5cc010ef          	jal	b3c8 <__assert_func>

00009e00 <__hi0bits>:
    9e00:	00050793          	mv	a5,a0
    9e04:	00010737          	lui	a4,0x10
    9e08:	00000513          	li	a0,0
    9e0c:	00e7f663          	bgeu	a5,a4,9e18 <__hi0bits+0x18>
    9e10:	01079793          	sll	a5,a5,0x10
    9e14:	01000513          	li	a0,16
    9e18:	01000737          	lui	a4,0x1000
    9e1c:	00e7f663          	bgeu	a5,a4,9e28 <__hi0bits+0x28>
    9e20:	00850513          	add	a0,a0,8
    9e24:	00879793          	sll	a5,a5,0x8
    9e28:	10000737          	lui	a4,0x10000
    9e2c:	00e7f663          	bgeu	a5,a4,9e38 <__hi0bits+0x38>
    9e30:	00450513          	add	a0,a0,4
    9e34:	00479793          	sll	a5,a5,0x4
    9e38:	40000737          	lui	a4,0x40000
    9e3c:	00e7ea63          	bltu	a5,a4,9e50 <__hi0bits+0x50>
    9e40:	fff7c793          	not	a5,a5
    9e44:	01f7d793          	srl	a5,a5,0x1f
    9e48:	00f50533          	add	a0,a0,a5
    9e4c:	00008067          	ret
    9e50:	00279793          	sll	a5,a5,0x2
    9e54:	0007ca63          	bltz	a5,9e68 <__hi0bits+0x68>
    9e58:	00179713          	sll	a4,a5,0x1
    9e5c:	00074a63          	bltz	a4,9e70 <__hi0bits+0x70>
    9e60:	02000513          	li	a0,32
    9e64:	00008067          	ret
    9e68:	00250513          	add	a0,a0,2
    9e6c:	00008067          	ret
    9e70:	00350513          	add	a0,a0,3
    9e74:	00008067          	ret

00009e78 <__lo0bits>:
    9e78:	00052783          	lw	a5,0(a0)
    9e7c:	00050713          	mv	a4,a0
    9e80:	0077f693          	and	a3,a5,7
    9e84:	02068463          	beqz	a3,9eac <__lo0bits+0x34>
    9e88:	0017f693          	and	a3,a5,1
    9e8c:	00000513          	li	a0,0
    9e90:	04069e63          	bnez	a3,9eec <__lo0bits+0x74>
    9e94:	0027f693          	and	a3,a5,2
    9e98:	0a068863          	beqz	a3,9f48 <__lo0bits+0xd0>
    9e9c:	0017d793          	srl	a5,a5,0x1
    9ea0:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9ea4:	00100513          	li	a0,1
    9ea8:	00008067          	ret
    9eac:	01079693          	sll	a3,a5,0x10
    9eb0:	0106d693          	srl	a3,a3,0x10
    9eb4:	00000513          	li	a0,0
    9eb8:	06068e63          	beqz	a3,9f34 <__lo0bits+0xbc>
    9ebc:	0ff7f693          	zext.b	a3,a5
    9ec0:	06068063          	beqz	a3,9f20 <__lo0bits+0xa8>
    9ec4:	00f7f693          	and	a3,a5,15
    9ec8:	04068263          	beqz	a3,9f0c <__lo0bits+0x94>
    9ecc:	0037f693          	and	a3,a5,3
    9ed0:	02068463          	beqz	a3,9ef8 <__lo0bits+0x80>
    9ed4:	0017f693          	and	a3,a5,1
    9ed8:	00069c63          	bnez	a3,9ef0 <__lo0bits+0x78>
    9edc:	0017d793          	srl	a5,a5,0x1
    9ee0:	00150513          	add	a0,a0,1
    9ee4:	00079663          	bnez	a5,9ef0 <__lo0bits+0x78>
    9ee8:	02000513          	li	a0,32
    9eec:	00008067          	ret
    9ef0:	00f72023          	sw	a5,0(a4)
    9ef4:	00008067          	ret
    9ef8:	0027d793          	srl	a5,a5,0x2
    9efc:	0017f693          	and	a3,a5,1
    9f00:	00250513          	add	a0,a0,2
    9f04:	fe0696e3          	bnez	a3,9ef0 <__lo0bits+0x78>
    9f08:	fd5ff06f          	j	9edc <__lo0bits+0x64>
    9f0c:	0047d793          	srl	a5,a5,0x4
    9f10:	0037f693          	and	a3,a5,3
    9f14:	00450513          	add	a0,a0,4
    9f18:	fa069ee3          	bnez	a3,9ed4 <__lo0bits+0x5c>
    9f1c:	fddff06f          	j	9ef8 <__lo0bits+0x80>
    9f20:	0087d793          	srl	a5,a5,0x8
    9f24:	00f7f693          	and	a3,a5,15
    9f28:	00850513          	add	a0,a0,8
    9f2c:	fa0690e3          	bnez	a3,9ecc <__lo0bits+0x54>
    9f30:	fddff06f          	j	9f0c <__lo0bits+0x94>
    9f34:	0107d793          	srl	a5,a5,0x10
    9f38:	0ff7f693          	zext.b	a3,a5
    9f3c:	01000513          	li	a0,16
    9f40:	f80692e3          	bnez	a3,9ec4 <__lo0bits+0x4c>
    9f44:	fddff06f          	j	9f20 <__lo0bits+0xa8>
    9f48:	0027d793          	srl	a5,a5,0x2
    9f4c:	00f72023          	sw	a5,0(a4)
    9f50:	00200513          	li	a0,2
    9f54:	00008067          	ret

00009f58 <__i2b>:
    9f58:	04452783          	lw	a5,68(a0)
    9f5c:	ff010113          	add	sp,sp,-16
    9f60:	00812423          	sw	s0,8(sp)
    9f64:	00912223          	sw	s1,4(sp)
    9f68:	00112623          	sw	ra,12(sp)
    9f6c:	00050413          	mv	s0,a0
    9f70:	00058493          	mv	s1,a1
    9f74:	02078c63          	beqz	a5,9fac <__i2b+0x54>
    9f78:	0047a503          	lw	a0,4(a5)
    9f7c:	06050263          	beqz	a0,9fe0 <__i2b+0x88>
    9f80:	00052703          	lw	a4,0(a0)
    9f84:	00e7a223          	sw	a4,4(a5)
    9f88:	00c12083          	lw	ra,12(sp)
    9f8c:	00812403          	lw	s0,8(sp)
    9f90:	00100793          	li	a5,1
    9f94:	00952a23          	sw	s1,20(a0)
    9f98:	00052623          	sw	zero,12(a0)
    9f9c:	00f52823          	sw	a5,16(a0)
    9fa0:	00412483          	lw	s1,4(sp)
    9fa4:	01010113          	add	sp,sp,16
    9fa8:	00008067          	ret
    9fac:	02100613          	li	a2,33
    9fb0:	00400593          	li	a1,4
    9fb4:	46c010ef          	jal	b420 <_calloc_r>
    9fb8:	04a42223          	sw	a0,68(s0)
    9fbc:	00050793          	mv	a5,a0
    9fc0:	fa051ce3          	bnez	a0,9f78 <__i2b+0x20>
    9fc4:	00005697          	auipc	a3,0x5
    9fc8:	5d468693          	add	a3,a3,1492 # f598 <__fini_array_end+0x290>
    9fcc:	00000613          	li	a2,0
    9fd0:	14500593          	li	a1,325
    9fd4:	00005517          	auipc	a0,0x5
    9fd8:	65850513          	add	a0,a0,1624 # f62c <__fini_array_end+0x324>
    9fdc:	3ec010ef          	jal	b3c8 <__assert_func>
    9fe0:	01c00613          	li	a2,28
    9fe4:	00100593          	li	a1,1
    9fe8:	00040513          	mv	a0,s0
    9fec:	434010ef          	jal	b420 <_calloc_r>
    9ff0:	fc050ae3          	beqz	a0,9fc4 <__i2b+0x6c>
    9ff4:	00100793          	li	a5,1
    9ff8:	00f52223          	sw	a5,4(a0)
    9ffc:	00200793          	li	a5,2
    a000:	00f52423          	sw	a5,8(a0)
    a004:	f85ff06f          	j	9f88 <__i2b+0x30>

0000a008 <__multiply>:
    a008:	fb010113          	add	sp,sp,-80
    a00c:	03312e23          	sw	s3,60(sp)
    a010:	03812423          	sw	s8,40(sp)
    a014:	01062983          	lw	s3,16(a2)
    a018:	0105ac03          	lw	s8,16(a1)
    a01c:	04812423          	sw	s0,72(sp)
    a020:	03412c23          	sw	s4,56(sp)
    a024:	04112623          	sw	ra,76(sp)
    a028:	03712623          	sw	s7,44(sp)
    a02c:	00058a13          	mv	s4,a1
    a030:	00060413          	mv	s0,a2
    a034:	013c4c63          	blt	s8,s3,a04c <__multiply+0x44>
    a038:	00098713          	mv	a4,s3
    a03c:	00058413          	mv	s0,a1
    a040:	000c0993          	mv	s3,s8
    a044:	00060a13          	mv	s4,a2
    a048:	00070c13          	mv	s8,a4
    a04c:	00842783          	lw	a5,8(s0)
    a050:	00442583          	lw	a1,4(s0)
    a054:	01898bb3          	add	s7,s3,s8
    a058:	0177a7b3          	slt	a5,a5,s7
    a05c:	00f585b3          	add	a1,a1,a5
    a060:	b45ff0ef          	jal	9ba4 <_Balloc>
    a064:	00a12623          	sw	a0,12(sp)
    a068:	22050863          	beqz	a0,a298 <__multiply+0x290>
    a06c:	00c12783          	lw	a5,12(sp)
    a070:	03512a23          	sw	s5,52(sp)
    a074:	03612823          	sw	s6,48(sp)
    a078:	002b9a93          	sll	s5,s7,0x2
    a07c:	01478b13          	add	s6,a5,20
    a080:	015b0ab3          	add	s5,s6,s5
    a084:	000b0793          	mv	a5,s6
    a088:	015b7863          	bgeu	s6,s5,a098 <__multiply+0x90>
    a08c:	0007a023          	sw	zero,0(a5)
    a090:	00478793          	add	a5,a5,4
    a094:	ff57ece3          	bltu	a5,s5,a08c <__multiply+0x84>
    a098:	014a0a13          	add	s4,s4,20
    a09c:	002c1c13          	sll	s8,s8,0x2
    a0a0:	01440793          	add	a5,s0,20
    a0a4:	018a0733          	add	a4,s4,s8
    a0a8:	00299993          	sll	s3,s3,0x2
    a0ac:	00f12423          	sw	a5,8(sp)
    a0b0:	00e12023          	sw	a4,0(sp)
    a0b4:	013789b3          	add	s3,a5,s3
    a0b8:	16ea7c63          	bgeu	s4,a4,a230 <__multiply+0x228>
    a0bc:	00400713          	li	a4,4
    a0c0:	04912223          	sw	s1,68(sp)
    a0c4:	05212023          	sw	s2,64(sp)
    a0c8:	03912223          	sw	s9,36(sp)
    a0cc:	03a12023          	sw	s10,32(sp)
    a0d0:	01b12e23          	sw	s11,28(sp)
    a0d4:	01540793          	add	a5,s0,21
    a0d8:	00e12223          	sw	a4,4(sp)
    a0dc:	1af9f263          	bgeu	s3,a5,a280 <__multiply+0x278>
    a0e0:	00010437          	lui	s0,0x10
    a0e4:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    a0e8:	01c0006f          	j	a104 <__multiply+0xfc>
    a0ec:	01095913          	srl	s2,s2,0x10
    a0f0:	0a091063          	bnez	s2,a190 <__multiply+0x188>
    a0f4:	00012783          	lw	a5,0(sp)
    a0f8:	004a0a13          	add	s4,s4,4
    a0fc:	004b0b13          	add	s6,s6,4
    a100:	10fa7e63          	bgeu	s4,a5,a21c <__multiply+0x214>
    a104:	000a2903          	lw	s2,0(s4)
    a108:	008974b3          	and	s1,s2,s0
    a10c:	fe0480e3          	beqz	s1,a0ec <__multiply+0xe4>
    a110:	00812c83          	lw	s9,8(sp)
    a114:	000b0d13          	mv	s10,s6
    a118:	00000c13          	li	s8,0
    a11c:	000cad83          	lw	s11,0(s9)
    a120:	000d2903          	lw	s2,0(s10)
    a124:	00048593          	mv	a1,s1
    a128:	008df533          	and	a0,s11,s0
    a12c:	7e5040ef          	jal	f110 <__mulsi3>
    a130:	00897733          	and	a4,s2,s0
    a134:	00e50733          	add	a4,a0,a4
    a138:	00048593          	mv	a1,s1
    a13c:	010dd513          	srl	a0,s11,0x10
    a140:	01870c33          	add	s8,a4,s8
    a144:	01095913          	srl	s2,s2,0x10
    a148:	7c9040ef          	jal	f110 <__mulsi3>
    a14c:	010c5713          	srl	a4,s8,0x10
    a150:	01250533          	add	a0,a0,s2
    a154:	00e50533          	add	a0,a0,a4
    a158:	008c77b3          	and	a5,s8,s0
    a15c:	01051713          	sll	a4,a0,0x10
    a160:	004d0d13          	add	s10,s10,4
    a164:	00f767b3          	or	a5,a4,a5
    a168:	004c8c93          	add	s9,s9,4
    a16c:	fefd2e23          	sw	a5,-4(s10)
    a170:	01055c13          	srl	s8,a0,0x10
    a174:	fb3ce4e3          	bltu	s9,s3,a11c <__multiply+0x114>
    a178:	00412783          	lw	a5,4(sp)
    a17c:	00fb0733          	add	a4,s6,a5
    a180:	01872023          	sw	s8,0(a4)
    a184:	000a2903          	lw	s2,0(s4)
    a188:	01095913          	srl	s2,s2,0x10
    a18c:	f60904e3          	beqz	s2,a0f4 <__multiply+0xec>
    a190:	000b2c83          	lw	s9,0(s6)
    a194:	00812d03          	lw	s10,8(sp)
    a198:	000b0c13          	mv	s8,s6
    a19c:	000c8493          	mv	s1,s9
    a1a0:	00000d93          	li	s11,0
    a1a4:	000d2503          	lw	a0,0(s10)
    a1a8:	00090593          	mv	a1,s2
    a1ac:	0104d493          	srl	s1,s1,0x10
    a1b0:	00857533          	and	a0,a0,s0
    a1b4:	75d040ef          	jal	f110 <__mulsi3>
    a1b8:	01b50733          	add	a4,a0,s11
    a1bc:	00970db3          	add	s11,a4,s1
    a1c0:	010d9593          	sll	a1,s11,0x10
    a1c4:	008cf7b3          	and	a5,s9,s0
    a1c8:	00f5e7b3          	or	a5,a1,a5
    a1cc:	00fc2023          	sw	a5,0(s8)
    a1d0:	002d5503          	lhu	a0,2(s10)
    a1d4:	004c2483          	lw	s1,4(s8)
    a1d8:	00090593          	mv	a1,s2
    a1dc:	735040ef          	jal	f110 <__mulsi3>
    a1e0:	0084f7b3          	and	a5,s1,s0
    a1e4:	010dd713          	srl	a4,s11,0x10
    a1e8:	00f507b3          	add	a5,a0,a5
    a1ec:	004d0d13          	add	s10,s10,4
    a1f0:	00e78cb3          	add	s9,a5,a4
    a1f4:	004c0c13          	add	s8,s8,4
    a1f8:	010cdd93          	srl	s11,s9,0x10
    a1fc:	fb3d64e3          	bltu	s10,s3,a1a4 <__multiply+0x19c>
    a200:	00412783          	lw	a5,4(sp)
    a204:	004a0a13          	add	s4,s4,4
    a208:	00fb0733          	add	a4,s6,a5
    a20c:	00012783          	lw	a5,0(sp)
    a210:	01972023          	sw	s9,0(a4)
    a214:	004b0b13          	add	s6,s6,4
    a218:	eefa66e3          	bltu	s4,a5,a104 <__multiply+0xfc>
    a21c:	04412483          	lw	s1,68(sp)
    a220:	04012903          	lw	s2,64(sp)
    a224:	02412c83          	lw	s9,36(sp)
    a228:	02012d03          	lw	s10,32(sp)
    a22c:	01c12d83          	lw	s11,28(sp)
    a230:	01704863          	bgtz	s7,a240 <__multiply+0x238>
    a234:	0180006f          	j	a24c <__multiply+0x244>
    a238:	fffb8b93          	add	s7,s7,-1
    a23c:	000b8863          	beqz	s7,a24c <__multiply+0x244>
    a240:	ffcaa783          	lw	a5,-4(s5)
    a244:	ffca8a93          	add	s5,s5,-4
    a248:	fe0788e3          	beqz	a5,a238 <__multiply+0x230>
    a24c:	00c12783          	lw	a5,12(sp)
    a250:	04c12083          	lw	ra,76(sp)
    a254:	04812403          	lw	s0,72(sp)
    a258:	0177a823          	sw	s7,16(a5)
    a25c:	03412a83          	lw	s5,52(sp)
    a260:	03012b03          	lw	s6,48(sp)
    a264:	03c12983          	lw	s3,60(sp)
    a268:	03812a03          	lw	s4,56(sp)
    a26c:	02c12b83          	lw	s7,44(sp)
    a270:	02812c03          	lw	s8,40(sp)
    a274:	00078513          	mv	a0,a5
    a278:	05010113          	add	sp,sp,80
    a27c:	00008067          	ret
    a280:	408987b3          	sub	a5,s3,s0
    a284:	feb78793          	add	a5,a5,-21
    a288:	ffc7f793          	and	a5,a5,-4
    a28c:	00478793          	add	a5,a5,4
    a290:	00f12223          	sw	a5,4(sp)
    a294:	e4dff06f          	j	a0e0 <__multiply+0xd8>
    a298:	00005697          	auipc	a3,0x5
    a29c:	30068693          	add	a3,a3,768 # f598 <__fini_array_end+0x290>
    a2a0:	00000613          	li	a2,0
    a2a4:	16200593          	li	a1,354
    a2a8:	00005517          	auipc	a0,0x5
    a2ac:	38450513          	add	a0,a0,900 # f62c <__fini_array_end+0x324>
    a2b0:	04912223          	sw	s1,68(sp)
    a2b4:	05212023          	sw	s2,64(sp)
    a2b8:	03512a23          	sw	s5,52(sp)
    a2bc:	03612823          	sw	s6,48(sp)
    a2c0:	03912223          	sw	s9,36(sp)
    a2c4:	03a12023          	sw	s10,32(sp)
    a2c8:	01b12e23          	sw	s11,28(sp)
    a2cc:	0fc010ef          	jal	b3c8 <__assert_func>

0000a2d0 <__pow5mult>:
    a2d0:	fe010113          	add	sp,sp,-32
    a2d4:	00812c23          	sw	s0,24(sp)
    a2d8:	01212823          	sw	s2,16(sp)
    a2dc:	01312623          	sw	s3,12(sp)
    a2e0:	00112e23          	sw	ra,28(sp)
    a2e4:	00367793          	and	a5,a2,3
    a2e8:	00060413          	mv	s0,a2
    a2ec:	00050993          	mv	s3,a0
    a2f0:	00058913          	mv	s2,a1
    a2f4:	0a079c63          	bnez	a5,a3ac <__pow5mult+0xdc>
    a2f8:	40245413          	sra	s0,s0,0x2
    a2fc:	06040a63          	beqz	s0,a370 <__pow5mult+0xa0>
    a300:	00912a23          	sw	s1,20(sp)
    a304:	0409a483          	lw	s1,64(s3)
    a308:	0c048663          	beqz	s1,a3d4 <__pow5mult+0x104>
    a30c:	00147793          	and	a5,s0,1
    a310:	02079063          	bnez	a5,a330 <__pow5mult+0x60>
    a314:	40145413          	sra	s0,s0,0x1
    a318:	04040a63          	beqz	s0,a36c <__pow5mult+0x9c>
    a31c:	0004a503          	lw	a0,0(s1)
    a320:	06050663          	beqz	a0,a38c <__pow5mult+0xbc>
    a324:	00050493          	mv	s1,a0
    a328:	00147793          	and	a5,s0,1
    a32c:	fe0784e3          	beqz	a5,a314 <__pow5mult+0x44>
    a330:	00048613          	mv	a2,s1
    a334:	00090593          	mv	a1,s2
    a338:	00098513          	mv	a0,s3
    a33c:	ccdff0ef          	jal	a008 <__multiply>
    a340:	02090063          	beqz	s2,a360 <__pow5mult+0x90>
    a344:	00492703          	lw	a4,4(s2)
    a348:	0449a783          	lw	a5,68(s3)
    a34c:	00271713          	sll	a4,a4,0x2
    a350:	00e787b3          	add	a5,a5,a4
    a354:	0007a703          	lw	a4,0(a5)
    a358:	00e92023          	sw	a4,0(s2)
    a35c:	0127a023          	sw	s2,0(a5)
    a360:	40145413          	sra	s0,s0,0x1
    a364:	00050913          	mv	s2,a0
    a368:	fa041ae3          	bnez	s0,a31c <__pow5mult+0x4c>
    a36c:	01412483          	lw	s1,20(sp)
    a370:	01c12083          	lw	ra,28(sp)
    a374:	01812403          	lw	s0,24(sp)
    a378:	00c12983          	lw	s3,12(sp)
    a37c:	00090513          	mv	a0,s2
    a380:	01012903          	lw	s2,16(sp)
    a384:	02010113          	add	sp,sp,32
    a388:	00008067          	ret
    a38c:	00048613          	mv	a2,s1
    a390:	00048593          	mv	a1,s1
    a394:	00098513          	mv	a0,s3
    a398:	c71ff0ef          	jal	a008 <__multiply>
    a39c:	00a4a023          	sw	a0,0(s1)
    a3a0:	00052023          	sw	zero,0(a0)
    a3a4:	00050493          	mv	s1,a0
    a3a8:	f81ff06f          	j	a328 <__pow5mult+0x58>
    a3ac:	fff78793          	add	a5,a5,-1
    a3b0:	00005717          	auipc	a4,0x5
    a3b4:	7f070713          	add	a4,a4,2032 # fba0 <p05.0>
    a3b8:	00279793          	sll	a5,a5,0x2
    a3bc:	00f707b3          	add	a5,a4,a5
    a3c0:	0007a603          	lw	a2,0(a5)
    a3c4:	00000693          	li	a3,0
    a3c8:	8b5ff0ef          	jal	9c7c <__multadd>
    a3cc:	00050913          	mv	s2,a0
    a3d0:	f29ff06f          	j	a2f8 <__pow5mult+0x28>
    a3d4:	00100593          	li	a1,1
    a3d8:	00098513          	mv	a0,s3
    a3dc:	fc8ff0ef          	jal	9ba4 <_Balloc>
    a3e0:	00050493          	mv	s1,a0
    a3e4:	02050063          	beqz	a0,a404 <__pow5mult+0x134>
    a3e8:	27100793          	li	a5,625
    a3ec:	00f52a23          	sw	a5,20(a0)
    a3f0:	00100793          	li	a5,1
    a3f4:	00f52823          	sw	a5,16(a0)
    a3f8:	04a9a023          	sw	a0,64(s3)
    a3fc:	00052023          	sw	zero,0(a0)
    a400:	f0dff06f          	j	a30c <__pow5mult+0x3c>
    a404:	00005697          	auipc	a3,0x5
    a408:	19468693          	add	a3,a3,404 # f598 <__fini_array_end+0x290>
    a40c:	00000613          	li	a2,0
    a410:	14500593          	li	a1,325
    a414:	00005517          	auipc	a0,0x5
    a418:	21850513          	add	a0,a0,536 # f62c <__fini_array_end+0x324>
    a41c:	7ad000ef          	jal	b3c8 <__assert_func>

0000a420 <__lshift>:
    a420:	fe010113          	add	sp,sp,-32
    a424:	01512223          	sw	s5,4(sp)
    a428:	0105aa83          	lw	s5,16(a1)
    a42c:	0085a783          	lw	a5,8(a1)
    a430:	01312623          	sw	s3,12(sp)
    a434:	40565993          	sra	s3,a2,0x5
    a438:	01598ab3          	add	s5,s3,s5
    a43c:	00812c23          	sw	s0,24(sp)
    a440:	00912a23          	sw	s1,20(sp)
    a444:	01212823          	sw	s2,16(sp)
    a448:	01412423          	sw	s4,8(sp)
    a44c:	00112e23          	sw	ra,28(sp)
    a450:	001a8913          	add	s2,s5,1
    a454:	00058493          	mv	s1,a1
    a458:	00060413          	mv	s0,a2
    a45c:	0045a583          	lw	a1,4(a1)
    a460:	00050a13          	mv	s4,a0
    a464:	0127d863          	bge	a5,s2,a474 <__lshift+0x54>
    a468:	00179793          	sll	a5,a5,0x1
    a46c:	00158593          	add	a1,a1,1
    a470:	ff27cce3          	blt	a5,s2,a468 <__lshift+0x48>
    a474:	000a0513          	mv	a0,s4
    a478:	f2cff0ef          	jal	9ba4 <_Balloc>
    a47c:	10050c63          	beqz	a0,a594 <__lshift+0x174>
    a480:	01450813          	add	a6,a0,20
    a484:	03305463          	blez	s3,a4ac <__lshift+0x8c>
    a488:	00598993          	add	s3,s3,5
    a48c:	00299993          	sll	s3,s3,0x2
    a490:	01350733          	add	a4,a0,s3
    a494:	00080793          	mv	a5,a6
    a498:	00478793          	add	a5,a5,4
    a49c:	fe07ae23          	sw	zero,-4(a5)
    a4a0:	fee79ce3          	bne	a5,a4,a498 <__lshift+0x78>
    a4a4:	fec98993          	add	s3,s3,-20
    a4a8:	01380833          	add	a6,a6,s3
    a4ac:	0104a883          	lw	a7,16(s1)
    a4b0:	01448793          	add	a5,s1,20
    a4b4:	01f47613          	and	a2,s0,31
    a4b8:	00289893          	sll	a7,a7,0x2
    a4bc:	011788b3          	add	a7,a5,a7
    a4c0:	0a060463          	beqz	a2,a568 <__lshift+0x148>
    a4c4:	02000593          	li	a1,32
    a4c8:	40c585b3          	sub	a1,a1,a2
    a4cc:	00080313          	mv	t1,a6
    a4d0:	00000693          	li	a3,0
    a4d4:	0007a703          	lw	a4,0(a5)
    a4d8:	00430313          	add	t1,t1,4
    a4dc:	00478793          	add	a5,a5,4
    a4e0:	00c71733          	sll	a4,a4,a2
    a4e4:	00d76733          	or	a4,a4,a3
    a4e8:	fee32e23          	sw	a4,-4(t1)
    a4ec:	ffc7a683          	lw	a3,-4(a5)
    a4f0:	00b6d6b3          	srl	a3,a3,a1
    a4f4:	ff17e0e3          	bltu	a5,a7,a4d4 <__lshift+0xb4>
    a4f8:	01548793          	add	a5,s1,21
    a4fc:	00400713          	li	a4,4
    a500:	00f8ea63          	bltu	a7,a5,a514 <__lshift+0xf4>
    a504:	409887b3          	sub	a5,a7,s1
    a508:	feb78793          	add	a5,a5,-21
    a50c:	ffc7f793          	and	a5,a5,-4
    a510:	00478713          	add	a4,a5,4
    a514:	00e80833          	add	a6,a6,a4
    a518:	00d82023          	sw	a3,0(a6)
    a51c:	00069463          	bnez	a3,a524 <__lshift+0x104>
    a520:	000a8913          	mv	s2,s5
    a524:	0044a703          	lw	a4,4(s1)
    a528:	044a2783          	lw	a5,68(s4)
    a52c:	01c12083          	lw	ra,28(sp)
    a530:	00271713          	sll	a4,a4,0x2
    a534:	00e787b3          	add	a5,a5,a4
    a538:	0007a703          	lw	a4,0(a5)
    a53c:	01252823          	sw	s2,16(a0)
    a540:	01812403          	lw	s0,24(sp)
    a544:	00e4a023          	sw	a4,0(s1)
    a548:	0097a023          	sw	s1,0(a5)
    a54c:	01012903          	lw	s2,16(sp)
    a550:	01412483          	lw	s1,20(sp)
    a554:	00c12983          	lw	s3,12(sp)
    a558:	00812a03          	lw	s4,8(sp)
    a55c:	00412a83          	lw	s5,4(sp)
    a560:	02010113          	add	sp,sp,32
    a564:	00008067          	ret
    a568:	0007a703          	lw	a4,0(a5)
    a56c:	00478793          	add	a5,a5,4
    a570:	00480813          	add	a6,a6,4
    a574:	fee82e23          	sw	a4,-4(a6)
    a578:	fb17f4e3          	bgeu	a5,a7,a520 <__lshift+0x100>
    a57c:	0007a703          	lw	a4,0(a5)
    a580:	00478793          	add	a5,a5,4
    a584:	00480813          	add	a6,a6,4
    a588:	fee82e23          	sw	a4,-4(a6)
    a58c:	fd17eee3          	bltu	a5,a7,a568 <__lshift+0x148>
    a590:	f91ff06f          	j	a520 <__lshift+0x100>
    a594:	00005697          	auipc	a3,0x5
    a598:	00468693          	add	a3,a3,4 # f598 <__fini_array_end+0x290>
    a59c:	00000613          	li	a2,0
    a5a0:	1de00593          	li	a1,478
    a5a4:	00005517          	auipc	a0,0x5
    a5a8:	08850513          	add	a0,a0,136 # f62c <__fini_array_end+0x324>
    a5ac:	61d000ef          	jal	b3c8 <__assert_func>

0000a5b0 <__mcmp>:
    a5b0:	01052703          	lw	a4,16(a0)
    a5b4:	0105a783          	lw	a5,16(a1)
    a5b8:	00050813          	mv	a6,a0
    a5bc:	40f70533          	sub	a0,a4,a5
    a5c0:	04f71263          	bne	a4,a5,a604 <__mcmp+0x54>
    a5c4:	00279793          	sll	a5,a5,0x2
    a5c8:	01480813          	add	a6,a6,20
    a5cc:	01458593          	add	a1,a1,20
    a5d0:	00f80733          	add	a4,a6,a5
    a5d4:	00f587b3          	add	a5,a1,a5
    a5d8:	0080006f          	j	a5e0 <__mcmp+0x30>
    a5dc:	02e87463          	bgeu	a6,a4,a604 <__mcmp+0x54>
    a5e0:	ffc72603          	lw	a2,-4(a4)
    a5e4:	ffc7a683          	lw	a3,-4(a5)
    a5e8:	ffc70713          	add	a4,a4,-4
    a5ec:	ffc78793          	add	a5,a5,-4
    a5f0:	fed606e3          	beq	a2,a3,a5dc <__mcmp+0x2c>
    a5f4:	00100513          	li	a0,1
    a5f8:	00d67663          	bgeu	a2,a3,a604 <__mcmp+0x54>
    a5fc:	fff00513          	li	a0,-1
    a600:	00008067          	ret
    a604:	00008067          	ret

0000a608 <__mdiff>:
    a608:	0105a703          	lw	a4,16(a1)
    a60c:	01062783          	lw	a5,16(a2)
    a610:	ff010113          	add	sp,sp,-16
    a614:	00812423          	sw	s0,8(sp)
    a618:	00912223          	sw	s1,4(sp)
    a61c:	00112623          	sw	ra,12(sp)
    a620:	01212023          	sw	s2,0(sp)
    a624:	00058413          	mv	s0,a1
    a628:	00060493          	mv	s1,a2
    a62c:	40f706b3          	sub	a3,a4,a5
    a630:	18f71e63          	bne	a4,a5,a7cc <__mdiff+0x1c4>
    a634:	00279693          	sll	a3,a5,0x2
    a638:	01458613          	add	a2,a1,20
    a63c:	01448713          	add	a4,s1,20
    a640:	00d607b3          	add	a5,a2,a3
    a644:	00d70733          	add	a4,a4,a3
    a648:	0080006f          	j	a650 <__mdiff+0x48>
    a64c:	18f67c63          	bgeu	a2,a5,a7e4 <__mdiff+0x1dc>
    a650:	ffc7a583          	lw	a1,-4(a5)
    a654:	ffc72683          	lw	a3,-4(a4)
    a658:	ffc78793          	add	a5,a5,-4
    a65c:	ffc70713          	add	a4,a4,-4
    a660:	fed586e3          	beq	a1,a3,a64c <__mdiff+0x44>
    a664:	00100913          	li	s2,1
    a668:	00d5ea63          	bltu	a1,a3,a67c <__mdiff+0x74>
    a66c:	00048793          	mv	a5,s1
    a670:	00000913          	li	s2,0
    a674:	00040493          	mv	s1,s0
    a678:	00078413          	mv	s0,a5
    a67c:	0044a583          	lw	a1,4(s1)
    a680:	d24ff0ef          	jal	9ba4 <_Balloc>
    a684:	1a050663          	beqz	a0,a830 <__mdiff+0x228>
    a688:	0104a883          	lw	a7,16(s1)
    a68c:	01042283          	lw	t0,16(s0)
    a690:	01448f93          	add	t6,s1,20
    a694:	00289313          	sll	t1,a7,0x2
    a698:	01440813          	add	a6,s0,20
    a69c:	00229293          	sll	t0,t0,0x2
    a6a0:	01450593          	add	a1,a0,20
    a6a4:	00010e37          	lui	t3,0x10
    a6a8:	01252623          	sw	s2,12(a0)
    a6ac:	006f8333          	add	t1,t6,t1
    a6b0:	005802b3          	add	t0,a6,t0
    a6b4:	00058f13          	mv	t5,a1
    a6b8:	000f8e93          	mv	t4,t6
    a6bc:	00000693          	li	a3,0
    a6c0:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    a6c4:	000ea703          	lw	a4,0(t4)
    a6c8:	00082603          	lw	a2,0(a6)
    a6cc:	004f0f13          	add	t5,t5,4
    a6d0:	01c777b3          	and	a5,a4,t3
    a6d4:	01c673b3          	and	t2,a2,t3
    a6d8:	407787b3          	sub	a5,a5,t2
    a6dc:	00d787b3          	add	a5,a5,a3
    a6e0:	01075713          	srl	a4,a4,0x10
    a6e4:	01065613          	srl	a2,a2,0x10
    a6e8:	4107d693          	sra	a3,a5,0x10
    a6ec:	40c70733          	sub	a4,a4,a2
    a6f0:	00d70733          	add	a4,a4,a3
    a6f4:	01071693          	sll	a3,a4,0x10
    a6f8:	01c7f7b3          	and	a5,a5,t3
    a6fc:	00d7e7b3          	or	a5,a5,a3
    a700:	00480813          	add	a6,a6,4
    a704:	feff2e23          	sw	a5,-4(t5)
    a708:	004e8e93          	add	t4,t4,4
    a70c:	41075693          	sra	a3,a4,0x10
    a710:	fa586ae3          	bltu	a6,t0,a6c4 <__mdiff+0xbc>
    a714:	01540713          	add	a4,s0,21
    a718:	40828433          	sub	s0,t0,s0
    a71c:	feb40413          	add	s0,s0,-21
    a720:	00e2b2b3          	sltu	t0,t0,a4
    a724:	0012cf13          	xor	t5,t0,1
    a728:	00245413          	srl	s0,s0,0x2
    a72c:	00400713          	li	a4,4
    a730:	0a028463          	beqz	t0,a7d8 <__mdiff+0x1d0>
    a734:	00ef8fb3          	add	t6,t6,a4
    a738:	00e58833          	add	a6,a1,a4
    a73c:	00010eb7          	lui	t4,0x10
    a740:	00080e13          	mv	t3,a6
    a744:	000f8613          	mv	a2,t6
    a748:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    a74c:	0c6ff463          	bgeu	t6,t1,a814 <__mdiff+0x20c>
    a750:	00062783          	lw	a5,0(a2)
    a754:	004e0e13          	add	t3,t3,4
    a758:	00460613          	add	a2,a2,4
    a75c:	01d7f733          	and	a4,a5,t4
    a760:	00d70733          	add	a4,a4,a3
    a764:	0107d593          	srl	a1,a5,0x10
    a768:	41075713          	sra	a4,a4,0x10
    a76c:	00b70733          	add	a4,a4,a1
    a770:	00d787b3          	add	a5,a5,a3
    a774:	01d7f7b3          	and	a5,a5,t4
    a778:	01071693          	sll	a3,a4,0x10
    a77c:	00d7e7b3          	or	a5,a5,a3
    a780:	fefe2e23          	sw	a5,-4(t3)
    a784:	41075693          	sra	a3,a4,0x10
    a788:	fc6664e3          	bltu	a2,t1,a750 <__mdiff+0x148>
    a78c:	fff30313          	add	t1,t1,-1
    a790:	41f30333          	sub	t1,t1,t6
    a794:	ffc37313          	and	t1,t1,-4
    a798:	00680733          	add	a4,a6,t1
    a79c:	00079a63          	bnez	a5,a7b0 <__mdiff+0x1a8>
    a7a0:	ffc72783          	lw	a5,-4(a4)
    a7a4:	fff88893          	add	a7,a7,-1
    a7a8:	ffc70713          	add	a4,a4,-4
    a7ac:	fe078ae3          	beqz	a5,a7a0 <__mdiff+0x198>
    a7b0:	00c12083          	lw	ra,12(sp)
    a7b4:	00812403          	lw	s0,8(sp)
    a7b8:	01152823          	sw	a7,16(a0)
    a7bc:	00412483          	lw	s1,4(sp)
    a7c0:	00012903          	lw	s2,0(sp)
    a7c4:	01010113          	add	sp,sp,16
    a7c8:	00008067          	ret
    a7cc:	00100913          	li	s2,1
    a7d0:	e806dee3          	bgez	a3,a66c <__mdiff+0x64>
    a7d4:	ea9ff06f          	j	a67c <__mdiff+0x74>
    a7d8:	00140713          	add	a4,s0,1
    a7dc:	00271713          	sll	a4,a4,0x2
    a7e0:	f55ff06f          	j	a734 <__mdiff+0x12c>
    a7e4:	00000593          	li	a1,0
    a7e8:	bbcff0ef          	jal	9ba4 <_Balloc>
    a7ec:	06050063          	beqz	a0,a84c <__mdiff+0x244>
    a7f0:	00c12083          	lw	ra,12(sp)
    a7f4:	00812403          	lw	s0,8(sp)
    a7f8:	00100793          	li	a5,1
    a7fc:	00f52823          	sw	a5,16(a0)
    a800:	00052a23          	sw	zero,20(a0)
    a804:	00412483          	lw	s1,4(sp)
    a808:	00012903          	lw	s2,0(sp)
    a80c:	01010113          	add	sp,sp,16
    a810:	00008067          	ret
    a814:	00000713          	li	a4,0
    a818:	000f1663          	bnez	t5,a824 <__mdiff+0x21c>
    a81c:	00e58733          	add	a4,a1,a4
    a820:	f7dff06f          	j	a79c <__mdiff+0x194>
    a824:	00241713          	sll	a4,s0,0x2
    a828:	00e58733          	add	a4,a1,a4
    a82c:	f71ff06f          	j	a79c <__mdiff+0x194>
    a830:	00005697          	auipc	a3,0x5
    a834:	d6868693          	add	a3,a3,-664 # f598 <__fini_array_end+0x290>
    a838:	00000613          	li	a2,0
    a83c:	24500593          	li	a1,581
    a840:	00005517          	auipc	a0,0x5
    a844:	dec50513          	add	a0,a0,-532 # f62c <__fini_array_end+0x324>
    a848:	381000ef          	jal	b3c8 <__assert_func>
    a84c:	00005697          	auipc	a3,0x5
    a850:	d4c68693          	add	a3,a3,-692 # f598 <__fini_array_end+0x290>
    a854:	00000613          	li	a2,0
    a858:	23700593          	li	a1,567
    a85c:	00005517          	auipc	a0,0x5
    a860:	dd050513          	add	a0,a0,-560 # f62c <__fini_array_end+0x324>
    a864:	365000ef          	jal	b3c8 <__assert_func>

0000a868 <__d2b>:
    a868:	fd010113          	add	sp,sp,-48
    a86c:	01512a23          	sw	s5,20(sp)
    a870:	00058a93          	mv	s5,a1
    a874:	00100593          	li	a1,1
    a878:	02912223          	sw	s1,36(sp)
    a87c:	01312e23          	sw	s3,28(sp)
    a880:	01412c23          	sw	s4,24(sp)
    a884:	02112623          	sw	ra,44(sp)
    a888:	02812423          	sw	s0,40(sp)
    a88c:	03212023          	sw	s2,32(sp)
    a890:	00060493          	mv	s1,a2
    a894:	00068a13          	mv	s4,a3
    a898:	00070993          	mv	s3,a4
    a89c:	b08ff0ef          	jal	9ba4 <_Balloc>
    a8a0:	10050263          	beqz	a0,a9a4 <__d2b+0x13c>
    a8a4:	00100737          	lui	a4,0x100
    a8a8:	0144d913          	srl	s2,s1,0x14
    a8ac:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a8b0:	7ff97913          	and	s2,s2,2047
    a8b4:	00050413          	mv	s0,a0
    a8b8:	0097f7b3          	and	a5,a5,s1
    a8bc:	00090463          	beqz	s2,a8c4 <__d2b+0x5c>
    a8c0:	00e7e7b3          	or	a5,a5,a4
    a8c4:	00f12623          	sw	a5,12(sp)
    a8c8:	060a9263          	bnez	s5,a92c <__d2b+0xc4>
    a8cc:	00c10513          	add	a0,sp,12
    a8d0:	da8ff0ef          	jal	9e78 <__lo0bits>
    a8d4:	00c12703          	lw	a4,12(sp)
    a8d8:	00100493          	li	s1,1
    a8dc:	00942823          	sw	s1,16(s0)
    a8e0:	00e42a23          	sw	a4,20(s0)
    a8e4:	02050793          	add	a5,a0,32
    a8e8:	08090863          	beqz	s2,a978 <__d2b+0x110>
    a8ec:	bcd90913          	add	s2,s2,-1075
    a8f0:	00f90933          	add	s2,s2,a5
    a8f4:	03500493          	li	s1,53
    a8f8:	012a2023          	sw	s2,0(s4)
    a8fc:	40f48533          	sub	a0,s1,a5
    a900:	00a9a023          	sw	a0,0(s3)
    a904:	02c12083          	lw	ra,44(sp)
    a908:	00040513          	mv	a0,s0
    a90c:	02812403          	lw	s0,40(sp)
    a910:	02412483          	lw	s1,36(sp)
    a914:	02012903          	lw	s2,32(sp)
    a918:	01c12983          	lw	s3,28(sp)
    a91c:	01812a03          	lw	s4,24(sp)
    a920:	01412a83          	lw	s5,20(sp)
    a924:	03010113          	add	sp,sp,48
    a928:	00008067          	ret
    a92c:	00810513          	add	a0,sp,8
    a930:	01512423          	sw	s5,8(sp)
    a934:	d44ff0ef          	jal	9e78 <__lo0bits>
    a938:	00c12703          	lw	a4,12(sp)
    a93c:	00050793          	mv	a5,a0
    a940:	04050e63          	beqz	a0,a99c <__d2b+0x134>
    a944:	00812603          	lw	a2,8(sp)
    a948:	02000693          	li	a3,32
    a94c:	40a686b3          	sub	a3,a3,a0
    a950:	00d716b3          	sll	a3,a4,a3
    a954:	00a75733          	srl	a4,a4,a0
    a958:	00c6e6b3          	or	a3,a3,a2
    a95c:	00e12623          	sw	a4,12(sp)
    a960:	00e034b3          	snez	s1,a4
    a964:	00148493          	add	s1,s1,1
    a968:	00d42a23          	sw	a3,20(s0)
    a96c:	00e42c23          	sw	a4,24(s0)
    a970:	00942823          	sw	s1,16(s0)
    a974:	f6091ce3          	bnez	s2,a8ec <__d2b+0x84>
    a978:	00249713          	sll	a4,s1,0x2
    a97c:	00e40733          	add	a4,s0,a4
    a980:	01072503          	lw	a0,16(a4)
    a984:	bce78793          	add	a5,a5,-1074
    a988:	00fa2023          	sw	a5,0(s4)
    a98c:	c74ff0ef          	jal	9e00 <__hi0bits>
    a990:	00549493          	sll	s1,s1,0x5
    a994:	40a48533          	sub	a0,s1,a0
    a998:	f69ff06f          	j	a900 <__d2b+0x98>
    a99c:	00812683          	lw	a3,8(sp)
    a9a0:	fc1ff06f          	j	a960 <__d2b+0xf8>
    a9a4:	00005697          	auipc	a3,0x5
    a9a8:	bf468693          	add	a3,a3,-1036 # f598 <__fini_array_end+0x290>
    a9ac:	00000613          	li	a2,0
    a9b0:	30f00593          	li	a1,783
    a9b4:	00005517          	auipc	a0,0x5
    a9b8:	c7850513          	add	a0,a0,-904 # f62c <__fini_array_end+0x324>
    a9bc:	20d000ef          	jal	b3c8 <__assert_func>

0000a9c0 <_realloc_r>:
    a9c0:	fd010113          	add	sp,sp,-48
    a9c4:	02912223          	sw	s1,36(sp)
    a9c8:	02112623          	sw	ra,44(sp)
    a9cc:	00060493          	mv	s1,a2
    a9d0:	1e058863          	beqz	a1,abc0 <_realloc_r+0x200>
    a9d4:	02812423          	sw	s0,40(sp)
    a9d8:	03212023          	sw	s2,32(sp)
    a9dc:	00058413          	mv	s0,a1
    a9e0:	01312e23          	sw	s3,28(sp)
    a9e4:	01512a23          	sw	s5,20(sp)
    a9e8:	01412c23          	sw	s4,24(sp)
    a9ec:	00050913          	mv	s2,a0
    a9f0:	8b1f70ef          	jal	22a0 <__malloc_lock>
    a9f4:	ffc42703          	lw	a4,-4(s0)
    a9f8:	00b48793          	add	a5,s1,11
    a9fc:	01600693          	li	a3,22
    aa00:	ff840a93          	add	s5,s0,-8
    aa04:	ffc77993          	and	s3,a4,-4
    aa08:	10f6f263          	bgeu	a3,a5,ab0c <_realloc_r+0x14c>
    aa0c:	ff87fa13          	and	s4,a5,-8
    aa10:	1007c263          	bltz	a5,ab14 <_realloc_r+0x154>
    aa14:	109a6063          	bltu	s4,s1,ab14 <_realloc_r+0x154>
    aa18:	1349d263          	bge	s3,s4,ab3c <_realloc_r+0x17c>
    aa1c:	01812423          	sw	s8,8(sp)
    aa20:	7fff5c17          	auipc	s8,0x7fff5
    aa24:	700c0c13          	add	s8,s8,1792 # 80000120 <__malloc_av_>
    aa28:	008c2603          	lw	a2,8(s8)
    aa2c:	013a86b3          	add	a3,s5,s3
    aa30:	0046a783          	lw	a5,4(a3)
    aa34:	1cd60863          	beq	a2,a3,ac04 <_realloc_r+0x244>
    aa38:	ffe7f613          	and	a2,a5,-2
    aa3c:	00c68633          	add	a2,a3,a2
    aa40:	00462603          	lw	a2,4(a2)
    aa44:	00167613          	and	a2,a2,1
    aa48:	14061a63          	bnez	a2,ab9c <_realloc_r+0x1dc>
    aa4c:	ffc7f793          	and	a5,a5,-4
    aa50:	00f98633          	add	a2,s3,a5
    aa54:	0d465863          	bge	a2,s4,ab24 <_realloc_r+0x164>
    aa58:	00177713          	and	a4,a4,1
    aa5c:	02071c63          	bnez	a4,aa94 <_realloc_r+0xd4>
    aa60:	01712623          	sw	s7,12(sp)
    aa64:	ff842b83          	lw	s7,-8(s0)
    aa68:	01612823          	sw	s6,16(sp)
    aa6c:	417a8bb3          	sub	s7,s5,s7
    aa70:	004ba703          	lw	a4,4(s7)
    aa74:	ffc77713          	and	a4,a4,-4
    aa78:	00e787b3          	add	a5,a5,a4
    aa7c:	01378b33          	add	s6,a5,s3
    aa80:	334b5c63          	bge	s6,s4,adb8 <_realloc_r+0x3f8>
    aa84:	00e98b33          	add	s6,s3,a4
    aa88:	294b5863          	bge	s6,s4,ad18 <_realloc_r+0x358>
    aa8c:	01012b03          	lw	s6,16(sp)
    aa90:	00c12b83          	lw	s7,12(sp)
    aa94:	00048593          	mv	a1,s1
    aa98:	00090513          	mv	a0,s2
    aa9c:	824f70ef          	jal	1ac0 <_malloc_r>
    aaa0:	00050493          	mv	s1,a0
    aaa4:	40050863          	beqz	a0,aeb4 <_realloc_r+0x4f4>
    aaa8:	ffc42783          	lw	a5,-4(s0)
    aaac:	ff850713          	add	a4,a0,-8
    aab0:	ffe7f793          	and	a5,a5,-2
    aab4:	00fa87b3          	add	a5,s5,a5
    aab8:	24e78663          	beq	a5,a4,ad04 <_realloc_r+0x344>
    aabc:	ffc98613          	add	a2,s3,-4
    aac0:	02400793          	li	a5,36
    aac4:	2ec7e463          	bltu	a5,a2,adac <_realloc_r+0x3ec>
    aac8:	01300713          	li	a4,19
    aacc:	20c76a63          	bltu	a4,a2,ace0 <_realloc_r+0x320>
    aad0:	00050793          	mv	a5,a0
    aad4:	00040713          	mv	a4,s0
    aad8:	00072683          	lw	a3,0(a4)
    aadc:	00d7a023          	sw	a3,0(a5)
    aae0:	00472683          	lw	a3,4(a4)
    aae4:	00d7a223          	sw	a3,4(a5)
    aae8:	00872703          	lw	a4,8(a4)
    aaec:	00e7a423          	sw	a4,8(a5)
    aaf0:	00040593          	mv	a1,s0
    aaf4:	00090513          	mv	a0,s2
    aaf8:	cbdf60ef          	jal	17b4 <_free_r>
    aafc:	00090513          	mv	a0,s2
    ab00:	facf70ef          	jal	22ac <__malloc_unlock>
    ab04:	00812c03          	lw	s8,8(sp)
    ab08:	06c0006f          	j	ab74 <_realloc_r+0x1b4>
    ab0c:	01000a13          	li	s4,16
    ab10:	f09a74e3          	bgeu	s4,s1,aa18 <_realloc_r+0x58>
    ab14:	00c00793          	li	a5,12
    ab18:	00f92023          	sw	a5,0(s2)
    ab1c:	00000493          	li	s1,0
    ab20:	0540006f          	j	ab74 <_realloc_r+0x1b4>
    ab24:	00c6a783          	lw	a5,12(a3)
    ab28:	0086a703          	lw	a4,8(a3)
    ab2c:	00812c03          	lw	s8,8(sp)
    ab30:	00060993          	mv	s3,a2
    ab34:	00f72623          	sw	a5,12(a4)
    ab38:	00e7a423          	sw	a4,8(a5)
    ab3c:	004aa783          	lw	a5,4(s5)
    ab40:	414986b3          	sub	a3,s3,s4
    ab44:	00f00613          	li	a2,15
    ab48:	0017f793          	and	a5,a5,1
    ab4c:	013a8733          	add	a4,s5,s3
    ab50:	08d66263          	bltu	a2,a3,abd4 <_realloc_r+0x214>
    ab54:	0137e7b3          	or	a5,a5,s3
    ab58:	00faa223          	sw	a5,4(s5)
    ab5c:	00472783          	lw	a5,4(a4)
    ab60:	0017e793          	or	a5,a5,1
    ab64:	00f72223          	sw	a5,4(a4)
    ab68:	00090513          	mv	a0,s2
    ab6c:	f40f70ef          	jal	22ac <__malloc_unlock>
    ab70:	00040493          	mv	s1,s0
    ab74:	02812403          	lw	s0,40(sp)
    ab78:	02c12083          	lw	ra,44(sp)
    ab7c:	02012903          	lw	s2,32(sp)
    ab80:	01c12983          	lw	s3,28(sp)
    ab84:	01812a03          	lw	s4,24(sp)
    ab88:	01412a83          	lw	s5,20(sp)
    ab8c:	00048513          	mv	a0,s1
    ab90:	02412483          	lw	s1,36(sp)
    ab94:	03010113          	add	sp,sp,48
    ab98:	00008067          	ret
    ab9c:	00177713          	and	a4,a4,1
    aba0:	ee071ae3          	bnez	a4,aa94 <_realloc_r+0xd4>
    aba4:	01712623          	sw	s7,12(sp)
    aba8:	ff842b83          	lw	s7,-8(s0)
    abac:	01612823          	sw	s6,16(sp)
    abb0:	417a8bb3          	sub	s7,s5,s7
    abb4:	004ba703          	lw	a4,4(s7)
    abb8:	ffc77713          	and	a4,a4,-4
    abbc:	ec9ff06f          	j	aa84 <_realloc_r+0xc4>
    abc0:	02c12083          	lw	ra,44(sp)
    abc4:	02412483          	lw	s1,36(sp)
    abc8:	00060593          	mv	a1,a2
    abcc:	03010113          	add	sp,sp,48
    abd0:	ef1f606f          	j	1ac0 <_malloc_r>
    abd4:	0147e7b3          	or	a5,a5,s4
    abd8:	00faa223          	sw	a5,4(s5)
    abdc:	014a85b3          	add	a1,s5,s4
    abe0:	0016e693          	or	a3,a3,1
    abe4:	00d5a223          	sw	a3,4(a1)
    abe8:	00472783          	lw	a5,4(a4)
    abec:	00858593          	add	a1,a1,8
    abf0:	00090513          	mv	a0,s2
    abf4:	0017e793          	or	a5,a5,1
    abf8:	00f72223          	sw	a5,4(a4)
    abfc:	bb9f60ef          	jal	17b4 <_free_r>
    ac00:	f69ff06f          	j	ab68 <_realloc_r+0x1a8>
    ac04:	ffc7f793          	and	a5,a5,-4
    ac08:	013786b3          	add	a3,a5,s3
    ac0c:	010a0613          	add	a2,s4,16
    ac10:	26c6d063          	bge	a3,a2,ae70 <_realloc_r+0x4b0>
    ac14:	00177713          	and	a4,a4,1
    ac18:	e6071ee3          	bnez	a4,aa94 <_realloc_r+0xd4>
    ac1c:	01712623          	sw	s7,12(sp)
    ac20:	ff842b83          	lw	s7,-8(s0)
    ac24:	01612823          	sw	s6,16(sp)
    ac28:	417a8bb3          	sub	s7,s5,s7
    ac2c:	004ba703          	lw	a4,4(s7)
    ac30:	ffc77713          	and	a4,a4,-4
    ac34:	00e787b3          	add	a5,a5,a4
    ac38:	01378b33          	add	s6,a5,s3
    ac3c:	e4cb44e3          	blt	s6,a2,aa84 <_realloc_r+0xc4>
    ac40:	00cba783          	lw	a5,12(s7)
    ac44:	008ba703          	lw	a4,8(s7)
    ac48:	ffc98613          	add	a2,s3,-4
    ac4c:	02400693          	li	a3,36
    ac50:	00f72623          	sw	a5,12(a4)
    ac54:	00e7a423          	sw	a4,8(a5)
    ac58:	008b8493          	add	s1,s7,8
    ac5c:	28c6e463          	bltu	a3,a2,aee4 <_realloc_r+0x524>
    ac60:	01300713          	li	a4,19
    ac64:	00048793          	mv	a5,s1
    ac68:	02c77263          	bgeu	a4,a2,ac8c <_realloc_r+0x2cc>
    ac6c:	00042703          	lw	a4,0(s0)
    ac70:	01b00793          	li	a5,27
    ac74:	00eba423          	sw	a4,8(s7)
    ac78:	00442703          	lw	a4,4(s0)
    ac7c:	00eba623          	sw	a4,12(s7)
    ac80:	26c7ea63          	bltu	a5,a2,aef4 <_realloc_r+0x534>
    ac84:	00840413          	add	s0,s0,8
    ac88:	010b8793          	add	a5,s7,16
    ac8c:	00042703          	lw	a4,0(s0)
    ac90:	00e7a023          	sw	a4,0(a5)
    ac94:	00442703          	lw	a4,4(s0)
    ac98:	00e7a223          	sw	a4,4(a5)
    ac9c:	00842703          	lw	a4,8(s0)
    aca0:	00e7a423          	sw	a4,8(a5)
    aca4:	014b8733          	add	a4,s7,s4
    aca8:	414b07b3          	sub	a5,s6,s4
    acac:	00ec2423          	sw	a4,8(s8)
    acb0:	0017e793          	or	a5,a5,1
    acb4:	00f72223          	sw	a5,4(a4)
    acb8:	004ba783          	lw	a5,4(s7)
    acbc:	00090513          	mv	a0,s2
    acc0:	0017f793          	and	a5,a5,1
    acc4:	0147e7b3          	or	a5,a5,s4
    acc8:	00fba223          	sw	a5,4(s7)
    accc:	de0f70ef          	jal	22ac <__malloc_unlock>
    acd0:	01012b03          	lw	s6,16(sp)
    acd4:	00c12b83          	lw	s7,12(sp)
    acd8:	00812c03          	lw	s8,8(sp)
    acdc:	e99ff06f          	j	ab74 <_realloc_r+0x1b4>
    ace0:	00042683          	lw	a3,0(s0)
    ace4:	01b00713          	li	a4,27
    ace8:	00d52023          	sw	a3,0(a0)
    acec:	00442683          	lw	a3,4(s0)
    acf0:	00d52223          	sw	a3,4(a0)
    acf4:	14c76e63          	bltu	a4,a2,ae50 <_realloc_r+0x490>
    acf8:	00840713          	add	a4,s0,8
    acfc:	00850793          	add	a5,a0,8
    ad00:	dd9ff06f          	j	aad8 <_realloc_r+0x118>
    ad04:	ffc52783          	lw	a5,-4(a0)
    ad08:	00812c03          	lw	s8,8(sp)
    ad0c:	ffc7f793          	and	a5,a5,-4
    ad10:	00f989b3          	add	s3,s3,a5
    ad14:	e29ff06f          	j	ab3c <_realloc_r+0x17c>
    ad18:	00cba783          	lw	a5,12(s7)
    ad1c:	008ba703          	lw	a4,8(s7)
    ad20:	ffc98613          	add	a2,s3,-4
    ad24:	02400693          	li	a3,36
    ad28:	00f72623          	sw	a5,12(a4)
    ad2c:	00e7a423          	sw	a4,8(a5)
    ad30:	008b8493          	add	s1,s7,8
    ad34:	10c6e663          	bltu	a3,a2,ae40 <_realloc_r+0x480>
    ad38:	01300713          	li	a4,19
    ad3c:	00048793          	mv	a5,s1
    ad40:	02c77c63          	bgeu	a4,a2,ad78 <_realloc_r+0x3b8>
    ad44:	00042703          	lw	a4,0(s0)
    ad48:	01b00793          	li	a5,27
    ad4c:	00eba423          	sw	a4,8(s7)
    ad50:	00442703          	lw	a4,4(s0)
    ad54:	00eba623          	sw	a4,12(s7)
    ad58:	14c7f863          	bgeu	a5,a2,aea8 <_realloc_r+0x4e8>
    ad5c:	00842783          	lw	a5,8(s0)
    ad60:	00fba823          	sw	a5,16(s7)
    ad64:	00c42783          	lw	a5,12(s0)
    ad68:	00fbaa23          	sw	a5,20(s7)
    ad6c:	0ad60c63          	beq	a2,a3,ae24 <_realloc_r+0x464>
    ad70:	01040413          	add	s0,s0,16
    ad74:	018b8793          	add	a5,s7,24
    ad78:	00042703          	lw	a4,0(s0)
    ad7c:	00e7a023          	sw	a4,0(a5)
    ad80:	00442703          	lw	a4,4(s0)
    ad84:	00e7a223          	sw	a4,4(a5)
    ad88:	00842703          	lw	a4,8(s0)
    ad8c:	00e7a423          	sw	a4,8(a5)
    ad90:	000b0993          	mv	s3,s6
    ad94:	000b8a93          	mv	s5,s7
    ad98:	01012b03          	lw	s6,16(sp)
    ad9c:	00c12b83          	lw	s7,12(sp)
    ada0:	00812c03          	lw	s8,8(sp)
    ada4:	00048413          	mv	s0,s1
    ada8:	d95ff06f          	j	ab3c <_realloc_r+0x17c>
    adac:	00040593          	mv	a1,s0
    adb0:	ae8fd0ef          	jal	8098 <memmove>
    adb4:	d3dff06f          	j	aaf0 <_realloc_r+0x130>
    adb8:	00c6a783          	lw	a5,12(a3)
    adbc:	0086a703          	lw	a4,8(a3)
    adc0:	ffc98613          	add	a2,s3,-4
    adc4:	02400693          	li	a3,36
    adc8:	00f72623          	sw	a5,12(a4)
    adcc:	00e7a423          	sw	a4,8(a5)
    add0:	008ba703          	lw	a4,8(s7)
    add4:	00cba783          	lw	a5,12(s7)
    add8:	008b8493          	add	s1,s7,8
    addc:	00f72623          	sw	a5,12(a4)
    ade0:	00e7a423          	sw	a4,8(a5)
    ade4:	04c6ee63          	bltu	a3,a2,ae40 <_realloc_r+0x480>
    ade8:	01300713          	li	a4,19
    adec:	00048793          	mv	a5,s1
    adf0:	f8c774e3          	bgeu	a4,a2,ad78 <_realloc_r+0x3b8>
    adf4:	00042703          	lw	a4,0(s0)
    adf8:	01b00793          	li	a5,27
    adfc:	00eba423          	sw	a4,8(s7)
    ae00:	00442703          	lw	a4,4(s0)
    ae04:	00eba623          	sw	a4,12(s7)
    ae08:	0ac7f063          	bgeu	a5,a2,aea8 <_realloc_r+0x4e8>
    ae0c:	00842703          	lw	a4,8(s0)
    ae10:	02400793          	li	a5,36
    ae14:	00eba823          	sw	a4,16(s7)
    ae18:	00c42703          	lw	a4,12(s0)
    ae1c:	00ebaa23          	sw	a4,20(s7)
    ae20:	f4f618e3          	bne	a2,a5,ad70 <_realloc_r+0x3b0>
    ae24:	01042703          	lw	a4,16(s0)
    ae28:	020b8793          	add	a5,s7,32
    ae2c:	01840413          	add	s0,s0,24
    ae30:	00ebac23          	sw	a4,24(s7)
    ae34:	ffc42703          	lw	a4,-4(s0)
    ae38:	00ebae23          	sw	a4,28(s7)
    ae3c:	f3dff06f          	j	ad78 <_realloc_r+0x3b8>
    ae40:	00040593          	mv	a1,s0
    ae44:	00048513          	mv	a0,s1
    ae48:	a50fd0ef          	jal	8098 <memmove>
    ae4c:	f45ff06f          	j	ad90 <_realloc_r+0x3d0>
    ae50:	00842703          	lw	a4,8(s0)
    ae54:	00e52423          	sw	a4,8(a0)
    ae58:	00c42703          	lw	a4,12(s0)
    ae5c:	00e52623          	sw	a4,12(a0)
    ae60:	06f60463          	beq	a2,a5,aec8 <_realloc_r+0x508>
    ae64:	01040713          	add	a4,s0,16
    ae68:	01050793          	add	a5,a0,16
    ae6c:	c6dff06f          	j	aad8 <_realloc_r+0x118>
    ae70:	014a8ab3          	add	s5,s5,s4
    ae74:	414687b3          	sub	a5,a3,s4
    ae78:	015c2423          	sw	s5,8(s8)
    ae7c:	0017e793          	or	a5,a5,1
    ae80:	00faa223          	sw	a5,4(s5)
    ae84:	ffc42783          	lw	a5,-4(s0)
    ae88:	00090513          	mv	a0,s2
    ae8c:	00040493          	mv	s1,s0
    ae90:	0017f793          	and	a5,a5,1
    ae94:	0147e7b3          	or	a5,a5,s4
    ae98:	fef42e23          	sw	a5,-4(s0)
    ae9c:	c10f70ef          	jal	22ac <__malloc_unlock>
    aea0:	00812c03          	lw	s8,8(sp)
    aea4:	cd1ff06f          	j	ab74 <_realloc_r+0x1b4>
    aea8:	00840413          	add	s0,s0,8
    aeac:	010b8793          	add	a5,s7,16
    aeb0:	ec9ff06f          	j	ad78 <_realloc_r+0x3b8>
    aeb4:	00090513          	mv	a0,s2
    aeb8:	bf4f70ef          	jal	22ac <__malloc_unlock>
    aebc:	00000493          	li	s1,0
    aec0:	00812c03          	lw	s8,8(sp)
    aec4:	cb1ff06f          	j	ab74 <_realloc_r+0x1b4>
    aec8:	01042683          	lw	a3,16(s0)
    aecc:	01840713          	add	a4,s0,24
    aed0:	01850793          	add	a5,a0,24
    aed4:	00d52823          	sw	a3,16(a0)
    aed8:	01442683          	lw	a3,20(s0)
    aedc:	00d52a23          	sw	a3,20(a0)
    aee0:	bf9ff06f          	j	aad8 <_realloc_r+0x118>
    aee4:	00040593          	mv	a1,s0
    aee8:	00048513          	mv	a0,s1
    aeec:	9acfd0ef          	jal	8098 <memmove>
    aef0:	db5ff06f          	j	aca4 <_realloc_r+0x2e4>
    aef4:	00842783          	lw	a5,8(s0)
    aef8:	00fba823          	sw	a5,16(s7)
    aefc:	00c42783          	lw	a5,12(s0)
    af00:	00fbaa23          	sw	a5,20(s7)
    af04:	00d60863          	beq	a2,a3,af14 <_realloc_r+0x554>
    af08:	01040413          	add	s0,s0,16
    af0c:	018b8793          	add	a5,s7,24
    af10:	d7dff06f          	j	ac8c <_realloc_r+0x2cc>
    af14:	01042703          	lw	a4,16(s0)
    af18:	020b8793          	add	a5,s7,32
    af1c:	01840413          	add	s0,s0,24
    af20:	00ebac23          	sw	a4,24(s7)
    af24:	ffc42703          	lw	a4,-4(s0)
    af28:	00ebae23          	sw	a4,28(s7)
    af2c:	d61ff06f          	j	ac8c <_realloc_r+0x2cc>

0000af30 <__ascii_wctomb>:
    af30:	02058463          	beqz	a1,af58 <__ascii_wctomb+0x28>
    af34:	0ff00793          	li	a5,255
    af38:	00c7e863          	bltu	a5,a2,af48 <__ascii_wctomb+0x18>
    af3c:	00c58023          	sb	a2,0(a1)
    af40:	00100513          	li	a0,1
    af44:	00008067          	ret
    af48:	08a00793          	li	a5,138
    af4c:	00f52023          	sw	a5,0(a0)
    af50:	fff00513          	li	a0,-1
    af54:	00008067          	ret
    af58:	00000513          	li	a0,0
    af5c:	00008067          	ret

0000af60 <_wcrtomb_r>:
    af60:	fe010113          	add	sp,sp,-32
    af64:	00812c23          	sw	s0,24(sp)
    af68:	00912a23          	sw	s1,20(sp)
    af6c:	00112e23          	sw	ra,28(sp)
    af70:	00050493          	mv	s1,a0
    af74:	10450413          	add	s0,a0,260
    af78:	00068463          	beqz	a3,af80 <_wcrtomb_r+0x20>
    af7c:	00068413          	mv	s0,a3
    af80:	7fff5797          	auipc	a5,0x7fff5
    af84:	6947a783          	lw	a5,1684(a5) # 80000614 <__global_locale+0xe0>
    af88:	00040693          	mv	a3,s0
    af8c:	02058463          	beqz	a1,afb4 <_wcrtomb_r+0x54>
    af90:	00048513          	mv	a0,s1
    af94:	000780e7          	jalr	a5
    af98:	fff00793          	li	a5,-1
    af9c:	02f50863          	beq	a0,a5,afcc <_wcrtomb_r+0x6c>
    afa0:	01c12083          	lw	ra,28(sp)
    afa4:	01812403          	lw	s0,24(sp)
    afa8:	01412483          	lw	s1,20(sp)
    afac:	02010113          	add	sp,sp,32
    afb0:	00008067          	ret
    afb4:	00000613          	li	a2,0
    afb8:	00410593          	add	a1,sp,4
    afbc:	00048513          	mv	a0,s1
    afc0:	000780e7          	jalr	a5
    afc4:	fff00793          	li	a5,-1
    afc8:	fcf51ce3          	bne	a0,a5,afa0 <_wcrtomb_r+0x40>
    afcc:	00042023          	sw	zero,0(s0)
    afd0:	01c12083          	lw	ra,28(sp)
    afd4:	01812403          	lw	s0,24(sp)
    afd8:	08a00793          	li	a5,138
    afdc:	00f4a023          	sw	a5,0(s1)
    afe0:	01412483          	lw	s1,20(sp)
    afe4:	02010113          	add	sp,sp,32
    afe8:	00008067          	ret

0000afec <_wcsrtombs_r>:
    afec:	00070793          	mv	a5,a4
    aff0:	00068713          	mv	a4,a3
    aff4:	fff00693          	li	a3,-1
    aff8:	7a40006f          	j	b79c <_wcsnrtombs_r>

0000affc <_fclose_r>:
    affc:	ff010113          	add	sp,sp,-16
    b000:	00112623          	sw	ra,12(sp)
    b004:	01212023          	sw	s2,0(sp)
    b008:	0e058263          	beqz	a1,b0ec <_fclose_r+0xf0>
    b00c:	00812423          	sw	s0,8(sp)
    b010:	00912223          	sw	s1,4(sp)
    b014:	00058413          	mv	s0,a1
    b018:	00050493          	mv	s1,a0
    b01c:	00050663          	beqz	a0,b028 <_fclose_r+0x2c>
    b020:	03452783          	lw	a5,52(a0)
    b024:	10078063          	beqz	a5,b124 <_fclose_r+0x128>
    b028:	06442783          	lw	a5,100(s0)
    b02c:	00c41703          	lh	a4,12(s0)
    b030:	0017f793          	and	a5,a5,1
    b034:	0a079663          	bnez	a5,b0e0 <_fclose_r+0xe4>
    b038:	20077713          	and	a4,a4,512
    b03c:	0e070863          	beqz	a4,b12c <_fclose_r+0x130>
    b040:	00040593          	mv	a1,s0
    b044:	00048513          	mv	a0,s1
    b048:	9f5fb0ef          	jal	6a3c <__sflush_r>
    b04c:	02c42783          	lw	a5,44(s0)
    b050:	00050913          	mv	s2,a0
    b054:	00078a63          	beqz	a5,b068 <_fclose_r+0x6c>
    b058:	01c42583          	lw	a1,28(s0)
    b05c:	00048513          	mv	a0,s1
    b060:	000780e7          	jalr	a5
    b064:	0a054063          	bltz	a0,b104 <_fclose_r+0x108>
    b068:	00c45783          	lhu	a5,12(s0)
    b06c:	0807f793          	and	a5,a5,128
    b070:	0a079263          	bnez	a5,b114 <_fclose_r+0x118>
    b074:	03042583          	lw	a1,48(s0)
    b078:	00058c63          	beqz	a1,b090 <_fclose_r+0x94>
    b07c:	04040793          	add	a5,s0,64
    b080:	00f58663          	beq	a1,a5,b08c <_fclose_r+0x90>
    b084:	00048513          	mv	a0,s1
    b088:	f2cf60ef          	jal	17b4 <_free_r>
    b08c:	02042823          	sw	zero,48(s0)
    b090:	04442583          	lw	a1,68(s0)
    b094:	00058863          	beqz	a1,b0a4 <_fclose_r+0xa8>
    b098:	00048513          	mv	a0,s1
    b09c:	f18f60ef          	jal	17b4 <_free_r>
    b0a0:	04042223          	sw	zero,68(s0)
    b0a4:	f51fb0ef          	jal	6ff4 <__sfp_lock_acquire>
    b0a8:	06442783          	lw	a5,100(s0)
    b0ac:	00041623          	sh	zero,12(s0)
    b0b0:	0017f793          	and	a5,a5,1
    b0b4:	0a078663          	beqz	a5,b160 <_fclose_r+0x164>
    b0b8:	05842503          	lw	a0,88(s0)
    b0bc:	a9cf60ef          	jal	1358 <__retarget_lock_close_recursive>
    b0c0:	f41fb0ef          	jal	7000 <__sfp_lock_release>
    b0c4:	00c12083          	lw	ra,12(sp)
    b0c8:	00812403          	lw	s0,8(sp)
    b0cc:	00412483          	lw	s1,4(sp)
    b0d0:	00090513          	mv	a0,s2
    b0d4:	00012903          	lw	s2,0(sp)
    b0d8:	01010113          	add	sp,sp,16
    b0dc:	00008067          	ret
    b0e0:	f60710e3          	bnez	a4,b040 <_fclose_r+0x44>
    b0e4:	00812403          	lw	s0,8(sp)
    b0e8:	00412483          	lw	s1,4(sp)
    b0ec:	00000913          	li	s2,0
    b0f0:	00c12083          	lw	ra,12(sp)
    b0f4:	00090513          	mv	a0,s2
    b0f8:	00012903          	lw	s2,0(sp)
    b0fc:	01010113          	add	sp,sp,16
    b100:	00008067          	ret
    b104:	00c45783          	lhu	a5,12(s0)
    b108:	fff00913          	li	s2,-1
    b10c:	0807f793          	and	a5,a5,128
    b110:	f60782e3          	beqz	a5,b074 <_fclose_r+0x78>
    b114:	01042583          	lw	a1,16(s0)
    b118:	00048513          	mv	a0,s1
    b11c:	e98f60ef          	jal	17b4 <_free_r>
    b120:	f55ff06f          	j	b074 <_fclose_r+0x78>
    b124:	e61fb0ef          	jal	6f84 <__sinit>
    b128:	f01ff06f          	j	b028 <_fclose_r+0x2c>
    b12c:	05842503          	lw	a0,88(s0)
    b130:	a2cf60ef          	jal	135c <__retarget_lock_acquire_recursive>
    b134:	00c41783          	lh	a5,12(s0)
    b138:	f00794e3          	bnez	a5,b040 <_fclose_r+0x44>
    b13c:	06442783          	lw	a5,100(s0)
    b140:	0017f793          	and	a5,a5,1
    b144:	fa0790e3          	bnez	a5,b0e4 <_fclose_r+0xe8>
    b148:	05842503          	lw	a0,88(s0)
    b14c:	00000913          	li	s2,0
    b150:	a10f60ef          	jal	1360 <__retarget_lock_release_recursive>
    b154:	00812403          	lw	s0,8(sp)
    b158:	00412483          	lw	s1,4(sp)
    b15c:	f95ff06f          	j	b0f0 <_fclose_r+0xf4>
    b160:	05842503          	lw	a0,88(s0)
    b164:	9fcf60ef          	jal	1360 <__retarget_lock_release_recursive>
    b168:	f51ff06f          	j	b0b8 <_fclose_r+0xbc>

0000b16c <__smakebuf_r>:
    b16c:	00c59783          	lh	a5,12(a1)
    b170:	f8010113          	add	sp,sp,-128
    b174:	06812c23          	sw	s0,120(sp)
    b178:	06112e23          	sw	ra,124(sp)
    b17c:	0027f713          	and	a4,a5,2
    b180:	00058413          	mv	s0,a1
    b184:	02070463          	beqz	a4,b1ac <__smakebuf_r+0x40>
    b188:	04358793          	add	a5,a1,67
    b18c:	00f5a023          	sw	a5,0(a1)
    b190:	00f5a823          	sw	a5,16(a1)
    b194:	00100793          	li	a5,1
    b198:	00f5aa23          	sw	a5,20(a1)
    b19c:	07c12083          	lw	ra,124(sp)
    b1a0:	07812403          	lw	s0,120(sp)
    b1a4:	08010113          	add	sp,sp,128
    b1a8:	00008067          	ret
    b1ac:	00e59583          	lh	a1,14(a1)
    b1b0:	06912a23          	sw	s1,116(sp)
    b1b4:	07212823          	sw	s2,112(sp)
    b1b8:	07312623          	sw	s3,108(sp)
    b1bc:	07412423          	sw	s4,104(sp)
    b1c0:	00050493          	mv	s1,a0
    b1c4:	0805c663          	bltz	a1,b250 <__smakebuf_r+0xe4>
    b1c8:	00810613          	add	a2,sp,8
    b1cc:	138000ef          	jal	b304 <_fstat_r>
    b1d0:	06054e63          	bltz	a0,b24c <__smakebuf_r+0xe0>
    b1d4:	00c12783          	lw	a5,12(sp)
    b1d8:	0000f937          	lui	s2,0xf
    b1dc:	000019b7          	lui	s3,0x1
    b1e0:	00f97933          	and	s2,s2,a5
    b1e4:	ffffe7b7          	lui	a5,0xffffe
    b1e8:	00f90933          	add	s2,s2,a5
    b1ec:	00193913          	seqz	s2,s2
    b1f0:	40000a13          	li	s4,1024
    b1f4:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    b1f8:	000a0593          	mv	a1,s4
    b1fc:	00048513          	mv	a0,s1
    b200:	8c1f60ef          	jal	1ac0 <_malloc_r>
    b204:	00c41783          	lh	a5,12(s0)
    b208:	06050863          	beqz	a0,b278 <__smakebuf_r+0x10c>
    b20c:	0807e793          	or	a5,a5,128
    b210:	00a42023          	sw	a0,0(s0)
    b214:	00a42823          	sw	a0,16(s0)
    b218:	00f41623          	sh	a5,12(s0)
    b21c:	01442a23          	sw	s4,20(s0)
    b220:	0a091063          	bnez	s2,b2c0 <__smakebuf_r+0x154>
    b224:	0137e7b3          	or	a5,a5,s3
    b228:	07c12083          	lw	ra,124(sp)
    b22c:	00f41623          	sh	a5,12(s0)
    b230:	07812403          	lw	s0,120(sp)
    b234:	07412483          	lw	s1,116(sp)
    b238:	07012903          	lw	s2,112(sp)
    b23c:	06c12983          	lw	s3,108(sp)
    b240:	06812a03          	lw	s4,104(sp)
    b244:	08010113          	add	sp,sp,128
    b248:	00008067          	ret
    b24c:	00c41783          	lh	a5,12(s0)
    b250:	0807f793          	and	a5,a5,128
    b254:	00000913          	li	s2,0
    b258:	04078e63          	beqz	a5,b2b4 <__smakebuf_r+0x148>
    b25c:	04000a13          	li	s4,64
    b260:	000a0593          	mv	a1,s4
    b264:	00048513          	mv	a0,s1
    b268:	859f60ef          	jal	1ac0 <_malloc_r>
    b26c:	00c41783          	lh	a5,12(s0)
    b270:	00000993          	li	s3,0
    b274:	f8051ce3          	bnez	a0,b20c <__smakebuf_r+0xa0>
    b278:	2007f713          	and	a4,a5,512
    b27c:	04071e63          	bnez	a4,b2d8 <__smakebuf_r+0x16c>
    b280:	ffc7f793          	and	a5,a5,-4
    b284:	0027e793          	or	a5,a5,2
    b288:	04340713          	add	a4,s0,67
    b28c:	00f41623          	sh	a5,12(s0)
    b290:	00100793          	li	a5,1
    b294:	07412483          	lw	s1,116(sp)
    b298:	07012903          	lw	s2,112(sp)
    b29c:	06c12983          	lw	s3,108(sp)
    b2a0:	06812a03          	lw	s4,104(sp)
    b2a4:	00e42023          	sw	a4,0(s0)
    b2a8:	00e42823          	sw	a4,16(s0)
    b2ac:	00f42a23          	sw	a5,20(s0)
    b2b0:	eedff06f          	j	b19c <__smakebuf_r+0x30>
    b2b4:	40000a13          	li	s4,1024
    b2b8:	00000993          	li	s3,0
    b2bc:	f3dff06f          	j	b1f8 <__smakebuf_r+0x8c>
    b2c0:	00e41583          	lh	a1,14(s0)
    b2c4:	00048513          	mv	a0,s1
    b2c8:	09c000ef          	jal	b364 <_isatty_r>
    b2cc:	02051063          	bnez	a0,b2ec <__smakebuf_r+0x180>
    b2d0:	00c41783          	lh	a5,12(s0)
    b2d4:	f51ff06f          	j	b224 <__smakebuf_r+0xb8>
    b2d8:	07412483          	lw	s1,116(sp)
    b2dc:	07012903          	lw	s2,112(sp)
    b2e0:	06c12983          	lw	s3,108(sp)
    b2e4:	06812a03          	lw	s4,104(sp)
    b2e8:	eb5ff06f          	j	b19c <__smakebuf_r+0x30>
    b2ec:	00c45783          	lhu	a5,12(s0)
    b2f0:	ffc7f793          	and	a5,a5,-4
    b2f4:	0017e793          	or	a5,a5,1
    b2f8:	01079793          	sll	a5,a5,0x10
    b2fc:	4107d793          	sra	a5,a5,0x10
    b300:	f25ff06f          	j	b224 <__smakebuf_r+0xb8>

0000b304 <_fstat_r>:
    b304:	ff010113          	add	sp,sp,-16
    b308:	00058713          	mv	a4,a1
    b30c:	00812423          	sw	s0,8(sp)
    b310:	00060593          	mv	a1,a2
    b314:	00050413          	mv	s0,a0
    b318:	00070513          	mv	a0,a4
    b31c:	7fff5797          	auipc	a5,0x7fff5
    b320:	4007a023          	sw	zero,1024(a5) # 8000071c <errno>
    b324:	00112623          	sw	ra,12(sp)
    b328:	c15f50ef          	jal	f3c <_fstat>
    b32c:	fff00793          	li	a5,-1
    b330:	00f50a63          	beq	a0,a5,b344 <_fstat_r+0x40>
    b334:	00c12083          	lw	ra,12(sp)
    b338:	00812403          	lw	s0,8(sp)
    b33c:	01010113          	add	sp,sp,16
    b340:	00008067          	ret
    b344:	7fff5797          	auipc	a5,0x7fff5
    b348:	3d87a783          	lw	a5,984(a5) # 8000071c <errno>
    b34c:	fe0784e3          	beqz	a5,b334 <_fstat_r+0x30>
    b350:	00c12083          	lw	ra,12(sp)
    b354:	00f42023          	sw	a5,0(s0)
    b358:	00812403          	lw	s0,8(sp)
    b35c:	01010113          	add	sp,sp,16
    b360:	00008067          	ret

0000b364 <_isatty_r>:
    b364:	ff010113          	add	sp,sp,-16
    b368:	00812423          	sw	s0,8(sp)
    b36c:	00050413          	mv	s0,a0
    b370:	00058513          	mv	a0,a1
    b374:	7fff5797          	auipc	a5,0x7fff5
    b378:	3a07a423          	sw	zero,936(a5) # 8000071c <errno>
    b37c:	00112623          	sw	ra,12(sp)
    b380:	bd5f50ef          	jal	f54 <_isatty>
    b384:	fff00793          	li	a5,-1
    b388:	00f50a63          	beq	a0,a5,b39c <_isatty_r+0x38>
    b38c:	00c12083          	lw	ra,12(sp)
    b390:	00812403          	lw	s0,8(sp)
    b394:	01010113          	add	sp,sp,16
    b398:	00008067          	ret
    b39c:	7fff5797          	auipc	a5,0x7fff5
    b3a0:	3807a783          	lw	a5,896(a5) # 8000071c <errno>
    b3a4:	fe0784e3          	beqz	a5,b38c <_isatty_r+0x28>
    b3a8:	00c12083          	lw	ra,12(sp)
    b3ac:	00f42023          	sw	a5,0(s0)
    b3b0:	00812403          	lw	s0,8(sp)
    b3b4:	01010113          	add	sp,sp,16
    b3b8:	00008067          	ret

0000b3bc <__errno>:
    b3bc:	7fff5517          	auipc	a0,0x7fff5
    b3c0:	34c52503          	lw	a0,844(a0) # 80000708 <_impure_ptr>
    b3c4:	00008067          	ret

0000b3c8 <__assert_func>:
    b3c8:	ff010113          	add	sp,sp,-16
    b3cc:	00068793          	mv	a5,a3
    b3d0:	7fff5717          	auipc	a4,0x7fff5
    b3d4:	33872703          	lw	a4,824(a4) # 80000708 <_impure_ptr>
    b3d8:	00060813          	mv	a6,a2
    b3dc:	00112623          	sw	ra,12(sp)
    b3e0:	00c72883          	lw	a7,12(a4)
    b3e4:	00078613          	mv	a2,a5
    b3e8:	00050693          	mv	a3,a0
    b3ec:	00058713          	mv	a4,a1
    b3f0:	00004797          	auipc	a5,0x4
    b3f4:	2bc78793          	add	a5,a5,700 # f6ac <__fini_array_end+0x3a4>
    b3f8:	00080c63          	beqz	a6,b410 <__assert_func+0x48>
    b3fc:	00004597          	auipc	a1,0x4
    b400:	2c058593          	add	a1,a1,704 # f6bc <__fini_array_end+0x3b4>
    b404:	00088513          	mv	a0,a7
    b408:	3a8000ef          	jal	b7b0 <fiprintf>
    b40c:	3f0000ef          	jal	b7fc <abort>
    b410:	00004797          	auipc	a5,0x4
    b414:	f0078793          	add	a5,a5,-256 # f310 <__fini_array_end+0x8>
    b418:	00078813          	mv	a6,a5
    b41c:	fe1ff06f          	j	b3fc <__assert_func+0x34>

0000b420 <_calloc_r>:
    b420:	fe010113          	add	sp,sp,-32
    b424:	00812c23          	sw	s0,24(sp)
    b428:	00112e23          	sw	ra,28(sp)
    b42c:	0105d693          	srl	a3,a1,0x10
    b430:	00058793          	mv	a5,a1
    b434:	00050413          	mv	s0,a0
    b438:	01065713          	srl	a4,a2,0x10
    b43c:	0c069063          	bnez	a3,b4fc <_calloc_r+0xdc>
    b440:	14071a63          	bnez	a4,b594 <_calloc_r+0x174>
    b444:	01061593          	sll	a1,a2,0x10
    b448:	01079513          	sll	a0,a5,0x10
    b44c:	0105d593          	srl	a1,a1,0x10
    b450:	01055513          	srl	a0,a0,0x10
    b454:	4bd030ef          	jal	f110 <__mulsi3>
    b458:	00050593          	mv	a1,a0
    b45c:	00040513          	mv	a0,s0
    b460:	e60f60ef          	jal	1ac0 <_malloc_r>
    b464:	00050413          	mv	s0,a0
    b468:	10050a63          	beqz	a0,b57c <_calloc_r+0x15c>
    b46c:	ffc52603          	lw	a2,-4(a0)
    b470:	02400713          	li	a4,36
    b474:	ffc67613          	and	a2,a2,-4
    b478:	ffc60613          	add	a2,a2,-4
    b47c:	04c76863          	bltu	a4,a2,b4cc <_calloc_r+0xac>
    b480:	01300693          	li	a3,19
    b484:	00050793          	mv	a5,a0
    b488:	02c6f263          	bgeu	a3,a2,b4ac <_calloc_r+0x8c>
    b48c:	00052023          	sw	zero,0(a0)
    b490:	00052223          	sw	zero,4(a0)
    b494:	01b00793          	li	a5,27
    b498:	04c7f863          	bgeu	a5,a2,b4e8 <_calloc_r+0xc8>
    b49c:	00052423          	sw	zero,8(a0)
    b4a0:	00052623          	sw	zero,12(a0)
    b4a4:	01050793          	add	a5,a0,16
    b4a8:	10e60263          	beq	a2,a4,b5ac <_calloc_r+0x18c>
    b4ac:	0007a023          	sw	zero,0(a5)
    b4b0:	0007a223          	sw	zero,4(a5)
    b4b4:	0007a423          	sw	zero,8(a5)
    b4b8:	01c12083          	lw	ra,28(sp)
    b4bc:	00040513          	mv	a0,s0
    b4c0:	01812403          	lw	s0,24(sp)
    b4c4:	02010113          	add	sp,sp,32
    b4c8:	00008067          	ret
    b4cc:	00000593          	li	a1,0
    b4d0:	e95f50ef          	jal	1364 <memset>
    b4d4:	01c12083          	lw	ra,28(sp)
    b4d8:	00040513          	mv	a0,s0
    b4dc:	01812403          	lw	s0,24(sp)
    b4e0:	02010113          	add	sp,sp,32
    b4e4:	00008067          	ret
    b4e8:	00850793          	add	a5,a0,8
    b4ec:	0007a023          	sw	zero,0(a5)
    b4f0:	0007a223          	sw	zero,4(a5)
    b4f4:	0007a423          	sw	zero,8(a5)
    b4f8:	fc1ff06f          	j	b4b8 <_calloc_r+0x98>
    b4fc:	0c071663          	bnez	a4,b5c8 <_calloc_r+0x1a8>
    b500:	01212823          	sw	s2,16(sp)
    b504:	01312623          	sw	s3,12(sp)
    b508:	00912a23          	sw	s1,20(sp)
    b50c:	00068913          	mv	s2,a3
    b510:	00060993          	mv	s3,a2
    b514:	01079513          	sll	a0,a5,0x10
    b518:	01061593          	sll	a1,a2,0x10
    b51c:	0105d593          	srl	a1,a1,0x10
    b520:	01055513          	srl	a0,a0,0x10
    b524:	3ed030ef          	jal	f110 <__mulsi3>
    b528:	00050493          	mv	s1,a0
    b52c:	01091593          	sll	a1,s2,0x10
    b530:	01099513          	sll	a0,s3,0x10
    b534:	0105d593          	srl	a1,a1,0x10
    b538:	01055513          	srl	a0,a0,0x10
    b53c:	3d5030ef          	jal	f110 <__mulsi3>
    b540:	0104d793          	srl	a5,s1,0x10
    b544:	00f505b3          	add	a1,a0,a5
    b548:	0105d793          	srl	a5,a1,0x10
    b54c:	06079863          	bnez	a5,b5bc <_calloc_r+0x19c>
    b550:	01049493          	sll	s1,s1,0x10
    b554:	0104d493          	srl	s1,s1,0x10
    b558:	01059593          	sll	a1,a1,0x10
    b55c:	0095e5b3          	or	a1,a1,s1
    b560:	00040513          	mv	a0,s0
    b564:	01412483          	lw	s1,20(sp)
    b568:	01012903          	lw	s2,16(sp)
    b56c:	00c12983          	lw	s3,12(sp)
    b570:	d50f60ef          	jal	1ac0 <_malloc_r>
    b574:	00050413          	mv	s0,a0
    b578:	ee051ae3          	bnez	a0,b46c <_calloc_r+0x4c>
    b57c:	00000413          	li	s0,0
    b580:	01c12083          	lw	ra,28(sp)
    b584:	00040513          	mv	a0,s0
    b588:	01812403          	lw	s0,24(sp)
    b58c:	02010113          	add	sp,sp,32
    b590:	00008067          	ret
    b594:	01212823          	sw	s2,16(sp)
    b598:	01312623          	sw	s3,12(sp)
    b59c:	00912a23          	sw	s1,20(sp)
    b5a0:	00070913          	mv	s2,a4
    b5a4:	00058993          	mv	s3,a1
    b5a8:	f6dff06f          	j	b514 <_calloc_r+0xf4>
    b5ac:	00052823          	sw	zero,16(a0)
    b5b0:	01850793          	add	a5,a0,24
    b5b4:	00052a23          	sw	zero,20(a0)
    b5b8:	ef5ff06f          	j	b4ac <_calloc_r+0x8c>
    b5bc:	01412483          	lw	s1,20(sp)
    b5c0:	01012903          	lw	s2,16(sp)
    b5c4:	00c12983          	lw	s3,12(sp)
    b5c8:	df5ff0ef          	jal	b3bc <__errno>
    b5cc:	00c00793          	li	a5,12
    b5d0:	00f52023          	sw	a5,0(a0)
    b5d4:	00000413          	li	s0,0
    b5d8:	fa9ff06f          	j	b580 <_calloc_r+0x160>

0000b5dc <_wcsnrtombs_l>:
    b5dc:	fa010113          	add	sp,sp,-96
    b5e0:	04912a23          	sw	s1,84(sp)
    b5e4:	05212823          	sw	s2,80(sp)
    b5e8:	05312623          	sw	s3,76(sp)
    b5ec:	05412423          	sw	s4,72(sp)
    b5f0:	05512223          	sw	s5,68(sp)
    b5f4:	04112e23          	sw	ra,92(sp)
    b5f8:	03912a23          	sw	s9,52(sp)
    b5fc:	03a12823          	sw	s10,48(sp)
    b600:	00a12623          	sw	a0,12(sp)
    b604:	00058a13          	mv	s4,a1
    b608:	00060a93          	mv	s5,a2
    b60c:	00070913          	mv	s2,a4
    b610:	00080993          	mv	s3,a6
    b614:	00078493          	mv	s1,a5
    b618:	12078063          	beqz	a5,b738 <_wcsnrtombs_l+0x15c>
    b61c:	000aac83          	lw	s9,0(s5)
    b620:	120a0263          	beqz	s4,b744 <_wcsnrtombs_l+0x168>
    b624:	14090e63          	beqz	s2,b780 <_wcsnrtombs_l+0x1a4>
    b628:	05612023          	sw	s6,64(sp)
    b62c:	fff68b13          	add	s6,a3,-1
    b630:	16068063          	beqz	a3,b790 <_wcsnrtombs_l+0x1b4>
    b634:	04812c23          	sw	s0,88(sp)
    b638:	03b12623          	sw	s11,44(sp)
    b63c:	03712e23          	sw	s7,60(sp)
    b640:	03812c23          	sw	s8,56(sp)
    b644:	000a0413          	mv	s0,s4
    b648:	00000d13          	li	s10,0
    b64c:	fff00d93          	li	s11,-1
    b650:	0240006f          	j	b674 <_wcsnrtombs_l+0x98>
    b654:	080a1a63          	bnez	s4,b6e8 <_wcsnrtombs_l+0x10c>
    b658:	000ca783          	lw	a5,0(s9)
    b65c:	004c8c93          	add	s9,s9,4
    b660:	0c078263          	beqz	a5,b724 <_wcsnrtombs_l+0x148>
    b664:	1326f263          	bgeu	a3,s2,b788 <_wcsnrtombs_l+0x1ac>
    b668:	fffb0b13          	add	s6,s6,-1
    b66c:	00068d13          	mv	s10,a3
    b670:	03bb0c63          	beq	s6,s11,b6a8 <_wcsnrtombs_l+0xcc>
    b674:	0e09a783          	lw	a5,224(s3)
    b678:	000ca603          	lw	a2,0(s9)
    b67c:	00c12503          	lw	a0,12(sp)
    b680:	00048693          	mv	a3,s1
    b684:	01410593          	add	a1,sp,20
    b688:	0004ac03          	lw	s8,0(s1)
    b68c:	0044ab83          	lw	s7,4(s1)
    b690:	000780e7          	jalr	a5
    b694:	0bb50e63          	beq	a0,s11,b750 <_wcsnrtombs_l+0x174>
    b698:	01a506b3          	add	a3,a0,s10
    b69c:	fad97ce3          	bgeu	s2,a3,b654 <_wcsnrtombs_l+0x78>
    b6a0:	0184a023          	sw	s8,0(s1)
    b6a4:	0174a223          	sw	s7,4(s1)
    b6a8:	05812403          	lw	s0,88(sp)
    b6ac:	04012b03          	lw	s6,64(sp)
    b6b0:	03c12b83          	lw	s7,60(sp)
    b6b4:	03812c03          	lw	s8,56(sp)
    b6b8:	02c12d83          	lw	s11,44(sp)
    b6bc:	05c12083          	lw	ra,92(sp)
    b6c0:	05412483          	lw	s1,84(sp)
    b6c4:	05012903          	lw	s2,80(sp)
    b6c8:	04c12983          	lw	s3,76(sp)
    b6cc:	04812a03          	lw	s4,72(sp)
    b6d0:	04412a83          	lw	s5,68(sp)
    b6d4:	03412c83          	lw	s9,52(sp)
    b6d8:	000d0513          	mv	a0,s10
    b6dc:	03012d03          	lw	s10,48(sp)
    b6e0:	06010113          	add	sp,sp,96
    b6e4:	00008067          	ret
    b6e8:	08a05063          	blez	a0,b768 <_wcsnrtombs_l+0x18c>
    b6ec:	01410893          	add	a7,sp,20
    b6f0:	00a40533          	add	a0,s0,a0
    b6f4:	0008c783          	lbu	a5,0(a7)
    b6f8:	00140413          	add	s0,s0,1
    b6fc:	00188893          	add	a7,a7,1
    b700:	fef40fa3          	sb	a5,-1(s0)
    b704:	fe8518e3          	bne	a0,s0,b6f4 <_wcsnrtombs_l+0x118>
    b708:	000aa783          	lw	a5,0(s5)
    b70c:	00050413          	mv	s0,a0
    b710:	00478793          	add	a5,a5,4
    b714:	00faa023          	sw	a5,0(s5)
    b718:	000ca783          	lw	a5,0(s9)
    b71c:	004c8c93          	add	s9,s9,4
    b720:	f40792e3          	bnez	a5,b664 <_wcsnrtombs_l+0x88>
    b724:	000a0463          	beqz	s4,b72c <_wcsnrtombs_l+0x150>
    b728:	000aa023          	sw	zero,0(s5)
    b72c:	0004a023          	sw	zero,0(s1)
    b730:	fff68d13          	add	s10,a3,-1
    b734:	f75ff06f          	j	b6a8 <_wcsnrtombs_l+0xcc>
    b738:	000aac83          	lw	s9,0(s5)
    b73c:	10c50493          	add	s1,a0,268
    b740:	ee0a12e3          	bnez	s4,b624 <_wcsnrtombs_l+0x48>
    b744:	05612023          	sw	s6,64(sp)
    b748:	fff00913          	li	s2,-1
    b74c:	ee1ff06f          	j	b62c <_wcsnrtombs_l+0x50>
    b750:	00c12703          	lw	a4,12(sp)
    b754:	08a00793          	li	a5,138
    b758:	fff00d13          	li	s10,-1
    b75c:	00f72023          	sw	a5,0(a4)
    b760:	0004a023          	sw	zero,0(s1)
    b764:	f45ff06f          	j	b6a8 <_wcsnrtombs_l+0xcc>
    b768:	000aa783          	lw	a5,0(s5)
    b76c:	00040513          	mv	a0,s0
    b770:	00050413          	mv	s0,a0
    b774:	00478793          	add	a5,a5,4
    b778:	00faa023          	sw	a5,0(s5)
    b77c:	f9dff06f          	j	b718 <_wcsnrtombs_l+0x13c>
    b780:	00000d13          	li	s10,0
    b784:	f39ff06f          	j	b6bc <_wcsnrtombs_l+0xe0>
    b788:	00068d13          	mv	s10,a3
    b78c:	f1dff06f          	j	b6a8 <_wcsnrtombs_l+0xcc>
    b790:	04012b03          	lw	s6,64(sp)
    b794:	00000d13          	li	s10,0
    b798:	f25ff06f          	j	b6bc <_wcsnrtombs_l+0xe0>

0000b79c <_wcsnrtombs_r>:
    b79c:	7fff5817          	auipc	a6,0x7fff5
    b7a0:	d9880813          	add	a6,a6,-616 # 80000534 <__global_locale>
    b7a4:	7fff5517          	auipc	a0,0x7fff5
    b7a8:	f6452503          	lw	a0,-156(a0) # 80000708 <_impure_ptr>
    b7ac:	e31ff06f          	j	b5dc <_wcsnrtombs_l>

0000b7b0 <fiprintf>:
    b7b0:	fc010113          	add	sp,sp,-64
    b7b4:	02810313          	add	t1,sp,40
    b7b8:	02c12423          	sw	a2,40(sp)
    b7bc:	02d12623          	sw	a3,44(sp)
    b7c0:	00058613          	mv	a2,a1
    b7c4:	00030693          	mv	a3,t1
    b7c8:	00050593          	mv	a1,a0
    b7cc:	7fff5517          	auipc	a0,0x7fff5
    b7d0:	f3c52503          	lw	a0,-196(a0) # 80000708 <_impure_ptr>
    b7d4:	00112e23          	sw	ra,28(sp)
    b7d8:	02e12823          	sw	a4,48(sp)
    b7dc:	02f12a23          	sw	a5,52(sp)
    b7e0:	03012c23          	sw	a6,56(sp)
    b7e4:	03112e23          	sw	a7,60(sp)
    b7e8:	00612623          	sw	t1,12(sp)
    b7ec:	9a1f90ef          	jal	518c <_vfiprintf_r>
    b7f0:	01c12083          	lw	ra,28(sp)
    b7f4:	04010113          	add	sp,sp,64
    b7f8:	00008067          	ret

0000b7fc <abort>:
    b7fc:	ff010113          	add	sp,sp,-16
    b800:	00600513          	li	a0,6
    b804:	00112623          	sw	ra,12(sp)
    b808:	00c000ef          	jal	b814 <raise>
    b80c:	00100513          	li	a0,1
    b810:	f14f50ef          	jal	f24 <_exit>

0000b814 <raise>:
    b814:	ff010113          	add	sp,sp,-16
    b818:	00912223          	sw	s1,4(sp)
    b81c:	00112623          	sw	ra,12(sp)
    b820:	01f00793          	li	a5,31
    b824:	7fff5497          	auipc	s1,0x7fff5
    b828:	ee44a483          	lw	s1,-284(s1) # 80000708 <_impure_ptr>
    b82c:	08a7ee63          	bltu	a5,a0,b8c8 <raise+0xb4>
    b830:	1184a783          	lw	a5,280(s1)
    b834:	00812423          	sw	s0,8(sp)
    b838:	00050413          	mv	s0,a0
    b83c:	04078263          	beqz	a5,b880 <raise+0x6c>
    b840:	00251713          	sll	a4,a0,0x2
    b844:	00e787b3          	add	a5,a5,a4
    b848:	0007a703          	lw	a4,0(a5)
    b84c:	02070a63          	beqz	a4,b880 <raise+0x6c>
    b850:	00100693          	li	a3,1
    b854:	00d70a63          	beq	a4,a3,b868 <raise+0x54>
    b858:	fff00693          	li	a3,-1
    b85c:	04d70663          	beq	a4,a3,b8a8 <raise+0x94>
    b860:	0007a023          	sw	zero,0(a5)
    b864:	000700e7          	jalr	a4
    b868:	00812403          	lw	s0,8(sp)
    b86c:	00000513          	li	a0,0
    b870:	00c12083          	lw	ra,12(sp)
    b874:	00412483          	lw	s1,4(sp)
    b878:	01010113          	add	sp,sp,16
    b87c:	00008067          	ret
    b880:	00048513          	mv	a0,s1
    b884:	0b4000ef          	jal	b938 <_getpid_r>
    b888:	00040613          	mv	a2,s0
    b88c:	00812403          	lw	s0,8(sp)
    b890:	00c12083          	lw	ra,12(sp)
    b894:	00050593          	mv	a1,a0
    b898:	00048513          	mv	a0,s1
    b89c:	00412483          	lw	s1,4(sp)
    b8a0:	01010113          	add	sp,sp,16
    b8a4:	0340006f          	j	b8d8 <_kill_r>
    b8a8:	00812403          	lw	s0,8(sp)
    b8ac:	00c12083          	lw	ra,12(sp)
    b8b0:	01600793          	li	a5,22
    b8b4:	00f4a023          	sw	a5,0(s1)
    b8b8:	00100513          	li	a0,1
    b8bc:	00412483          	lw	s1,4(sp)
    b8c0:	01010113          	add	sp,sp,16
    b8c4:	00008067          	ret
    b8c8:	01600793          	li	a5,22
    b8cc:	00f4a023          	sw	a5,0(s1)
    b8d0:	fff00513          	li	a0,-1
    b8d4:	f9dff06f          	j	b870 <raise+0x5c>

0000b8d8 <_kill_r>:
    b8d8:	ff010113          	add	sp,sp,-16
    b8dc:	00058713          	mv	a4,a1
    b8e0:	00812423          	sw	s0,8(sp)
    b8e4:	00060593          	mv	a1,a2
    b8e8:	00050413          	mv	s0,a0
    b8ec:	00070513          	mv	a0,a4
    b8f0:	7fff5797          	auipc	a5,0x7fff5
    b8f4:	e207a623          	sw	zero,-468(a5) # 8000071c <errno>
    b8f8:	00112623          	sw	ra,12(sp)
    b8fc:	e60f50ef          	jal	f5c <_kill>
    b900:	fff00793          	li	a5,-1
    b904:	00f50a63          	beq	a0,a5,b918 <_kill_r+0x40>
    b908:	00c12083          	lw	ra,12(sp)
    b90c:	00812403          	lw	s0,8(sp)
    b910:	01010113          	add	sp,sp,16
    b914:	00008067          	ret
    b918:	7fff5797          	auipc	a5,0x7fff5
    b91c:	e047a783          	lw	a5,-508(a5) # 8000071c <errno>
    b920:	fe0784e3          	beqz	a5,b908 <_kill_r+0x30>
    b924:	00c12083          	lw	ra,12(sp)
    b928:	00f42023          	sw	a5,0(s0)
    b92c:	00812403          	lw	s0,8(sp)
    b930:	01010113          	add	sp,sp,16
    b934:	00008067          	ret

0000b938 <_getpid_r>:
    b938:	e14f506f          	j	f4c <_getpid>

0000b93c <__udivdi3>:
    b93c:	fd010113          	add	sp,sp,-48
    b940:	01312e23          	sw	s3,28(sp)
    b944:	02112623          	sw	ra,44(sp)
    b948:	01612823          	sw	s6,16(sp)
    b94c:	00050993          	mv	s3,a0
    b950:	16069663          	bnez	a3,babc <__udivdi3+0x180>
    b954:	02812423          	sw	s0,40(sp)
    b958:	01512a23          	sw	s5,20(sp)
    b95c:	02912223          	sw	s1,36(sp)
    b960:	03212023          	sw	s2,32(sp)
    b964:	01412c23          	sw	s4,24(sp)
    b968:	00060a93          	mv	s5,a2
    b96c:	00050413          	mv	s0,a0
    b970:	1cc5f063          	bgeu	a1,a2,bb30 <__udivdi3+0x1f4>
    b974:	000107b7          	lui	a5,0x10
    b978:	00058493          	mv	s1,a1
    b97c:	2af66e63          	bltu	a2,a5,bc38 <__udivdi3+0x2fc>
    b980:	010007b7          	lui	a5,0x1000
    b984:	01800713          	li	a4,24
    b988:	00f67463          	bgeu	a2,a5,b990 <__udivdi3+0x54>
    b98c:	01000713          	li	a4,16
    b990:	00e656b3          	srl	a3,a2,a4
    b994:	00004797          	auipc	a5,0x4
    b998:	34c78793          	add	a5,a5,844 # fce0 <__clz_tab>
    b99c:	00d787b3          	add	a5,a5,a3
    b9a0:	0007c783          	lbu	a5,0(a5)
    b9a4:	02000693          	li	a3,32
    b9a8:	00e787b3          	add	a5,a5,a4
    b9ac:	40f68733          	sub	a4,a3,a5
    b9b0:	00f68c63          	beq	a3,a5,b9c8 <__udivdi3+0x8c>
    b9b4:	00e594b3          	sll	s1,a1,a4
    b9b8:	00f9d7b3          	srl	a5,s3,a5
    b9bc:	00e61ab3          	sll	s5,a2,a4
    b9c0:	0097e4b3          	or	s1,a5,s1
    b9c4:	00e99433          	sll	s0,s3,a4
    b9c8:	010ada13          	srl	s4,s5,0x10
    b9cc:	000a0593          	mv	a1,s4
    b9d0:	00048513          	mv	a0,s1
    b9d4:	010a9b13          	sll	s6,s5,0x10
    b9d8:	7fc030ef          	jal	f1d4 <__hidden___udivsi3>
    b9dc:	010b5b13          	srl	s6,s6,0x10
    b9e0:	00050593          	mv	a1,a0
    b9e4:	00050913          	mv	s2,a0
    b9e8:	000b0513          	mv	a0,s6
    b9ec:	724030ef          	jal	f110 <__mulsi3>
    b9f0:	00050793          	mv	a5,a0
    b9f4:	000a0593          	mv	a1,s4
    b9f8:	00048513          	mv	a0,s1
    b9fc:	00078493          	mv	s1,a5
    ba00:	01d030ef          	jal	f21c <__umodsi3>
    ba04:	01051513          	sll	a0,a0,0x10
    ba08:	01045793          	srl	a5,s0,0x10
    ba0c:	00a7e7b3          	or	a5,a5,a0
    ba10:	0097fc63          	bgeu	a5,s1,ba28 <__udivdi3+0xec>
    ba14:	00fa87b3          	add	a5,s5,a5
    ba18:	fff90713          	add	a4,s2,-1 # efff <__trunctfdf2+0x2cb>
    ba1c:	0157e463          	bltu	a5,s5,ba24 <__udivdi3+0xe8>
    ba20:	5a97e863          	bltu	a5,s1,bfd0 <__udivdi3+0x694>
    ba24:	00070913          	mv	s2,a4
    ba28:	409784b3          	sub	s1,a5,s1
    ba2c:	000a0593          	mv	a1,s4
    ba30:	00048513          	mv	a0,s1
    ba34:	7a0030ef          	jal	f1d4 <__hidden___udivsi3>
    ba38:	00050593          	mv	a1,a0
    ba3c:	00050993          	mv	s3,a0
    ba40:	000b0513          	mv	a0,s6
    ba44:	6cc030ef          	jal	f110 <__mulsi3>
    ba48:	00050793          	mv	a5,a0
    ba4c:	000a0593          	mv	a1,s4
    ba50:	00048513          	mv	a0,s1
    ba54:	01041413          	sll	s0,s0,0x10
    ba58:	00078493          	mv	s1,a5
    ba5c:	7c0030ef          	jal	f21c <__umodsi3>
    ba60:	01051513          	sll	a0,a0,0x10
    ba64:	01045413          	srl	s0,s0,0x10
    ba68:	00a46433          	or	s0,s0,a0
    ba6c:	00947c63          	bgeu	s0,s1,ba84 <__udivdi3+0x148>
    ba70:	008a8433          	add	s0,s5,s0
    ba74:	fff98793          	add	a5,s3,-1
    ba78:	4d546e63          	bltu	s0,s5,bf54 <__udivdi3+0x618>
    ba7c:	ffe98993          	add	s3,s3,-2
    ba80:	4c947a63          	bgeu	s0,s1,bf54 <__udivdi3+0x618>
    ba84:	01091613          	sll	a2,s2,0x10
    ba88:	01366533          	or	a0,a2,s3
    ba8c:	00000b13          	li	s6,0
    ba90:	02812403          	lw	s0,40(sp)
    ba94:	02c12083          	lw	ra,44(sp)
    ba98:	02412483          	lw	s1,36(sp)
    ba9c:	02012903          	lw	s2,32(sp)
    baa0:	01812a03          	lw	s4,24(sp)
    baa4:	01412a83          	lw	s5,20(sp)
    baa8:	01c12983          	lw	s3,28(sp)
    baac:	000b0593          	mv	a1,s6
    bab0:	01012b03          	lw	s6,16(sp)
    bab4:	03010113          	add	sp,sp,48
    bab8:	00008067          	ret
    babc:	02d5f263          	bgeu	a1,a3,bae0 <__udivdi3+0x1a4>
    bac0:	00000b13          	li	s6,0
    bac4:	00000513          	li	a0,0
    bac8:	02c12083          	lw	ra,44(sp)
    bacc:	01c12983          	lw	s3,28(sp)
    bad0:	000b0593          	mv	a1,s6
    bad4:	01012b03          	lw	s6,16(sp)
    bad8:	03010113          	add	sp,sp,48
    badc:	00008067          	ret
    bae0:	000107b7          	lui	a5,0x10
    bae4:	26f6ee63          	bltu	a3,a5,bd60 <__udivdi3+0x424>
    bae8:	01000737          	lui	a4,0x1000
    baec:	01800793          	li	a5,24
    baf0:	00e6f463          	bgeu	a3,a4,baf8 <__udivdi3+0x1bc>
    baf4:	01000793          	li	a5,16
    baf8:	00f6d533          	srl	a0,a3,a5
    bafc:	00004717          	auipc	a4,0x4
    bb00:	1e470713          	add	a4,a4,484 # fce0 <__clz_tab>
    bb04:	00a70733          	add	a4,a4,a0
    bb08:	00074703          	lbu	a4,0(a4)
    bb0c:	02000513          	li	a0,32
    bb10:	00f70733          	add	a4,a4,a5
    bb14:	40e50b33          	sub	s6,a0,a4
    bb18:	26e51c63          	bne	a0,a4,bd90 <__udivdi3+0x454>
    bb1c:	46b6ee63          	bltu	a3,a1,bf98 <__udivdi3+0x65c>
    bb20:	00c9b533          	sltu	a0,s3,a2
    bb24:	00153513          	seqz	a0,a0
    bb28:	00000b13          	li	s6,0
    bb2c:	f9dff06f          	j	bac8 <__udivdi3+0x18c>
    bb30:	10060c63          	beqz	a2,bc48 <__udivdi3+0x30c>
    bb34:	000107b7          	lui	a5,0x10
    bb38:	44f67663          	bgeu	a2,a5,bf84 <__udivdi3+0x648>
    bb3c:	10063713          	sltiu	a4,a2,256
    bb40:	00173713          	seqz	a4,a4
    bb44:	00371713          	sll	a4,a4,0x3
    bb48:	00e656b3          	srl	a3,a2,a4
    bb4c:	00004797          	auipc	a5,0x4
    bb50:	19478793          	add	a5,a5,404 # fce0 <__clz_tab>
    bb54:	00d787b3          	add	a5,a5,a3
    bb58:	0007c483          	lbu	s1,0(a5)
    bb5c:	02000793          	li	a5,32
    bb60:	00e484b3          	add	s1,s1,a4
    bb64:	40978733          	sub	a4,a5,s1
    bb68:	10979463          	bne	a5,s1,bc70 <__udivdi3+0x334>
    bb6c:	01061a13          	sll	s4,a2,0x10
    bb70:	40c584b3          	sub	s1,a1,a2
    bb74:	01065913          	srl	s2,a2,0x10
    bb78:	010a5a13          	srl	s4,s4,0x10
    bb7c:	00100b13          	li	s6,1
    bb80:	00090593          	mv	a1,s2
    bb84:	00048513          	mv	a0,s1
    bb88:	64c030ef          	jal	f1d4 <__hidden___udivsi3>
    bb8c:	000a0593          	mv	a1,s4
    bb90:	00050993          	mv	s3,a0
    bb94:	57c030ef          	jal	f110 <__mulsi3>
    bb98:	00050793          	mv	a5,a0
    bb9c:	00090593          	mv	a1,s2
    bba0:	00048513          	mv	a0,s1
    bba4:	00078493          	mv	s1,a5
    bba8:	674030ef          	jal	f21c <__umodsi3>
    bbac:	01051513          	sll	a0,a0,0x10
    bbb0:	01045793          	srl	a5,s0,0x10
    bbb4:	00a7e7b3          	or	a5,a5,a0
    bbb8:	0097fc63          	bgeu	a5,s1,bbd0 <__udivdi3+0x294>
    bbbc:	00fa87b3          	add	a5,s5,a5
    bbc0:	fff98713          	add	a4,s3,-1
    bbc4:	0157e463          	bltu	a5,s5,bbcc <__udivdi3+0x290>
    bbc8:	3e97ee63          	bltu	a5,s1,bfc4 <__udivdi3+0x688>
    bbcc:	00070993          	mv	s3,a4
    bbd0:	409784b3          	sub	s1,a5,s1
    bbd4:	00090593          	mv	a1,s2
    bbd8:	00048513          	mv	a0,s1
    bbdc:	5f8030ef          	jal	f1d4 <__hidden___udivsi3>
    bbe0:	000a0593          	mv	a1,s4
    bbe4:	00050a13          	mv	s4,a0
    bbe8:	528030ef          	jal	f110 <__mulsi3>
    bbec:	00050793          	mv	a5,a0
    bbf0:	00090593          	mv	a1,s2
    bbf4:	00048513          	mv	a0,s1
    bbf8:	01041413          	sll	s0,s0,0x10
    bbfc:	00078493          	mv	s1,a5
    bc00:	61c030ef          	jal	f21c <__umodsi3>
    bc04:	01051513          	sll	a0,a0,0x10
    bc08:	01045413          	srl	s0,s0,0x10
    bc0c:	00a46433          	or	s0,s0,a0
    bc10:	00947e63          	bgeu	s0,s1,bc2c <__udivdi3+0x2f0>
    bc14:	008a8433          	add	s0,s5,s0
    bc18:	fffa0793          	add	a5,s4,-1
    bc1c:	01546663          	bltu	s0,s5,bc28 <__udivdi3+0x2ec>
    bc20:	ffea0a13          	add	s4,s4,-2
    bc24:	00946463          	bltu	s0,s1,bc2c <__udivdi3+0x2f0>
    bc28:	00078a13          	mv	s4,a5
    bc2c:	01099613          	sll	a2,s3,0x10
    bc30:	01466533          	or	a0,a2,s4
    bc34:	e5dff06f          	j	ba90 <__udivdi3+0x154>
    bc38:	10063713          	sltiu	a4,a2,256
    bc3c:	00173713          	seqz	a4,a4
    bc40:	00371713          	sll	a4,a4,0x3
    bc44:	d4dff06f          	j	b990 <__udivdi3+0x54>
    bc48:	00000693          	li	a3,0
    bc4c:	00004797          	auipc	a5,0x4
    bc50:	09478793          	add	a5,a5,148 # fce0 <__clz_tab>
    bc54:	00d787b3          	add	a5,a5,a3
    bc58:	0007c483          	lbu	s1,0(a5)
    bc5c:	00000713          	li	a4,0
    bc60:	02000793          	li	a5,32
    bc64:	00e484b3          	add	s1,s1,a4
    bc68:	40978733          	sub	a4,a5,s1
    bc6c:	f09780e3          	beq	a5,s1,bb6c <__udivdi3+0x230>
    bc70:	00e61ab3          	sll	s5,a2,a4
    bc74:	01712623          	sw	s7,12(sp)
    bc78:	010ad913          	srl	s2,s5,0x10
    bc7c:	0095dbb3          	srl	s7,a1,s1
    bc80:	00e597b3          	sll	a5,a1,a4
    bc84:	0099d4b3          	srl	s1,s3,s1
    bc88:	00090593          	mv	a1,s2
    bc8c:	000b8513          	mv	a0,s7
    bc90:	010a9a13          	sll	s4,s5,0x10
    bc94:	00f4e4b3          	or	s1,s1,a5
    bc98:	00e99433          	sll	s0,s3,a4
    bc9c:	010a5a13          	srl	s4,s4,0x10
    bca0:	534030ef          	jal	f1d4 <__hidden___udivsi3>
    bca4:	00050593          	mv	a1,a0
    bca8:	00050b13          	mv	s6,a0
    bcac:	000a0513          	mv	a0,s4
    bcb0:	460030ef          	jal	f110 <__mulsi3>
    bcb4:	00050993          	mv	s3,a0
    bcb8:	00090593          	mv	a1,s2
    bcbc:	000b8513          	mv	a0,s7
    bcc0:	55c030ef          	jal	f21c <__umodsi3>
    bcc4:	01051513          	sll	a0,a0,0x10
    bcc8:	0104d793          	srl	a5,s1,0x10
    bccc:	00a7e7b3          	or	a5,a5,a0
    bcd0:	0137fe63          	bgeu	a5,s3,bcec <__udivdi3+0x3b0>
    bcd4:	00fa87b3          	add	a5,s5,a5
    bcd8:	fffb0713          	add	a4,s6,-1
    bcdc:	2d57ec63          	bltu	a5,s5,bfb4 <__udivdi3+0x678>
    bce0:	2d37fa63          	bgeu	a5,s3,bfb4 <__udivdi3+0x678>
    bce4:	ffeb0b13          	add	s6,s6,-2
    bce8:	015787b3          	add	a5,a5,s5
    bcec:	413789b3          	sub	s3,a5,s3
    bcf0:	00090593          	mv	a1,s2
    bcf4:	00098513          	mv	a0,s3
    bcf8:	4dc030ef          	jal	f1d4 <__hidden___udivsi3>
    bcfc:	00050593          	mv	a1,a0
    bd00:	00050b93          	mv	s7,a0
    bd04:	000a0513          	mv	a0,s4
    bd08:	408030ef          	jal	f110 <__mulsi3>
    bd0c:	00050793          	mv	a5,a0
    bd10:	00090593          	mv	a1,s2
    bd14:	00098513          	mv	a0,s3
    bd18:	01049493          	sll	s1,s1,0x10
    bd1c:	00078993          	mv	s3,a5
    bd20:	4fc030ef          	jal	f21c <__umodsi3>
    bd24:	01051513          	sll	a0,a0,0x10
    bd28:	0104d493          	srl	s1,s1,0x10
    bd2c:	00a4e4b3          	or	s1,s1,a0
    bd30:	0134fe63          	bgeu	s1,s3,bd4c <__udivdi3+0x410>
    bd34:	009a84b3          	add	s1,s5,s1
    bd38:	fffb8793          	add	a5,s7,-1
    bd3c:	2754e463          	bltu	s1,s5,bfa4 <__udivdi3+0x668>
    bd40:	2734f263          	bgeu	s1,s3,bfa4 <__udivdi3+0x668>
    bd44:	ffeb8b93          	add	s7,s7,-2
    bd48:	015484b3          	add	s1,s1,s5
    bd4c:	010b1b13          	sll	s6,s6,0x10
    bd50:	017b6b33          	or	s6,s6,s7
    bd54:	413484b3          	sub	s1,s1,s3
    bd58:	00c12b83          	lw	s7,12(sp)
    bd5c:	e25ff06f          	j	bb80 <__udivdi3+0x244>
    bd60:	1006b793          	sltiu	a5,a3,256
    bd64:	0017b793          	seqz	a5,a5
    bd68:	00379793          	sll	a5,a5,0x3
    bd6c:	00f6d533          	srl	a0,a3,a5
    bd70:	00004717          	auipc	a4,0x4
    bd74:	f7070713          	add	a4,a4,-144 # fce0 <__clz_tab>
    bd78:	00a70733          	add	a4,a4,a0
    bd7c:	00074703          	lbu	a4,0(a4)
    bd80:	02000513          	li	a0,32
    bd84:	00f70733          	add	a4,a4,a5
    bd88:	40e50b33          	sub	s6,a0,a4
    bd8c:	d8e508e3          	beq	a0,a4,bb1c <__udivdi3+0x1e0>
    bd90:	016696b3          	sll	a3,a3,s6
    bd94:	01912223          	sw	s9,4(sp)
    bd98:	00e65cb3          	srl	s9,a2,a4
    bd9c:	00dcecb3          	or	s9,s9,a3
    bda0:	01512a23          	sw	s5,20(sp)
    bda4:	01712623          	sw	s7,12(sp)
    bda8:	010cda93          	srl	s5,s9,0x10
    bdac:	00e5dbb3          	srl	s7,a1,a4
    bdb0:	016597b3          	sll	a5,a1,s6
    bdb4:	00e9d733          	srl	a4,s3,a4
    bdb8:	01812423          	sw	s8,8(sp)
    bdbc:	000a8593          	mv	a1,s5
    bdc0:	000b8513          	mv	a0,s7
    bdc4:	010c9c13          	sll	s8,s9,0x10
    bdc8:	02812423          	sw	s0,40(sp)
    bdcc:	02912223          	sw	s1,36(sp)
    bdd0:	03212023          	sw	s2,32(sp)
    bdd4:	00f764b3          	or	s1,a4,a5
    bdd8:	01661933          	sll	s2,a2,s6
    bddc:	01412c23          	sw	s4,24(sp)
    bde0:	010c5c13          	srl	s8,s8,0x10
    bde4:	3f0030ef          	jal	f1d4 <__hidden___udivsi3>
    bde8:	00050593          	mv	a1,a0
    bdec:	00050413          	mv	s0,a0
    bdf0:	000c0513          	mv	a0,s8
    bdf4:	31c030ef          	jal	f110 <__mulsi3>
    bdf8:	00050a13          	mv	s4,a0
    bdfc:	000a8593          	mv	a1,s5
    be00:	000b8513          	mv	a0,s7
    be04:	418030ef          	jal	f21c <__umodsi3>
    be08:	01051513          	sll	a0,a0,0x10
    be0c:	0104d793          	srl	a5,s1,0x10
    be10:	00a7e7b3          	or	a5,a5,a0
    be14:	0147fe63          	bgeu	a5,s4,be30 <__udivdi3+0x4f4>
    be18:	00fc87b3          	add	a5,s9,a5
    be1c:	fff40713          	add	a4,s0,-1
    be20:	1997ee63          	bltu	a5,s9,bfbc <__udivdi3+0x680>
    be24:	1947fc63          	bgeu	a5,s4,bfbc <__udivdi3+0x680>
    be28:	ffe40413          	add	s0,s0,-2
    be2c:	019787b3          	add	a5,a5,s9
    be30:	41478a33          	sub	s4,a5,s4
    be34:	000a8593          	mv	a1,s5
    be38:	000a0513          	mv	a0,s4
    be3c:	398030ef          	jal	f1d4 <__hidden___udivsi3>
    be40:	00050593          	mv	a1,a0
    be44:	00050b93          	mv	s7,a0
    be48:	000c0513          	mv	a0,s8
    be4c:	2c4030ef          	jal	f110 <__mulsi3>
    be50:	00050793          	mv	a5,a0
    be54:	000a8593          	mv	a1,s5
    be58:	000a0513          	mv	a0,s4
    be5c:	00078a13          	mv	s4,a5
    be60:	3bc030ef          	jal	f21c <__umodsi3>
    be64:	01049713          	sll	a4,s1,0x10
    be68:	01051513          	sll	a0,a0,0x10
    be6c:	01075713          	srl	a4,a4,0x10
    be70:	00a76733          	or	a4,a4,a0
    be74:	01477e63          	bgeu	a4,s4,be90 <__udivdi3+0x554>
    be78:	00ec8733          	add	a4,s9,a4
    be7c:	fffb8793          	add	a5,s7,-1
    be80:	13976663          	bltu	a4,s9,bfac <__udivdi3+0x670>
    be84:	13477463          	bgeu	a4,s4,bfac <__udivdi3+0x670>
    be88:	ffeb8b93          	add	s7,s7,-2
    be8c:	01970733          	add	a4,a4,s9
    be90:	00010e37          	lui	t3,0x10
    be94:	01041413          	sll	s0,s0,0x10
    be98:	01746433          	or	s0,s0,s7
    be9c:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    bea0:	00f47833          	and	a6,s0,a5
    bea4:	00f977b3          	and	a5,s2,a5
    bea8:	41470733          	sub	a4,a4,s4
    beac:	01045e93          	srl	t4,s0,0x10
    beb0:	01095913          	srl	s2,s2,0x10
    beb4:	00080513          	mv	a0,a6
    beb8:	00078593          	mv	a1,a5
    bebc:	254030ef          	jal	f110 <__mulsi3>
    bec0:	00050313          	mv	t1,a0
    bec4:	00090593          	mv	a1,s2
    bec8:	00080513          	mv	a0,a6
    becc:	244030ef          	jal	f110 <__mulsi3>
    bed0:	00050813          	mv	a6,a0
    bed4:	00078593          	mv	a1,a5
    bed8:	000e8513          	mv	a0,t4
    bedc:	234030ef          	jal	f110 <__mulsi3>
    bee0:	00050893          	mv	a7,a0
    bee4:	00090593          	mv	a1,s2
    bee8:	000e8513          	mv	a0,t4
    beec:	224030ef          	jal	f110 <__mulsi3>
    bef0:	01035793          	srl	a5,t1,0x10
    bef4:	01180833          	add	a6,a6,a7
    bef8:	010787b3          	add	a5,a5,a6
    befc:	0117f463          	bgeu	a5,a7,bf04 <__udivdi3+0x5c8>
    bf00:	01c50533          	add	a0,a0,t3
    bf04:	0107d693          	srl	a3,a5,0x10
    bf08:	00a686b3          	add	a3,a3,a0
    bf0c:	06d76863          	bltu	a4,a3,bf7c <__udivdi3+0x640>
    bf10:	04d70663          	beq	a4,a3,bf5c <__udivdi3+0x620>
    bf14:	00040513          	mv	a0,s0
    bf18:	02812403          	lw	s0,40(sp)
    bf1c:	02c12083          	lw	ra,44(sp)
    bf20:	00000b13          	li	s6,0
    bf24:	02412483          	lw	s1,36(sp)
    bf28:	02012903          	lw	s2,32(sp)
    bf2c:	01812a03          	lw	s4,24(sp)
    bf30:	01412a83          	lw	s5,20(sp)
    bf34:	00c12b83          	lw	s7,12(sp)
    bf38:	00812c03          	lw	s8,8(sp)
    bf3c:	00412c83          	lw	s9,4(sp)
    bf40:	01c12983          	lw	s3,28(sp)
    bf44:	000b0593          	mv	a1,s6
    bf48:	01012b03          	lw	s6,16(sp)
    bf4c:	03010113          	add	sp,sp,48
    bf50:	00008067          	ret
    bf54:	00078993          	mv	s3,a5
    bf58:	b2dff06f          	j	ba84 <__udivdi3+0x148>
    bf5c:	00010737          	lui	a4,0x10
    bf60:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    bf64:	00e7f7b3          	and	a5,a5,a4
    bf68:	01079793          	sll	a5,a5,0x10
    bf6c:	00e37333          	and	t1,t1,a4
    bf70:	01699533          	sll	a0,s3,s6
    bf74:	006787b3          	add	a5,a5,t1
    bf78:	f8f57ee3          	bgeu	a0,a5,bf14 <__udivdi3+0x5d8>
    bf7c:	fff40513          	add	a0,s0,-1
    bf80:	f99ff06f          	j	bf18 <__udivdi3+0x5dc>
    bf84:	010007b7          	lui	a5,0x1000
    bf88:	04f67a63          	bgeu	a2,a5,bfdc <__udivdi3+0x6a0>
    bf8c:	01065693          	srl	a3,a2,0x10
    bf90:	01000713          	li	a4,16
    bf94:	bb9ff06f          	j	bb4c <__udivdi3+0x210>
    bf98:	00000b13          	li	s6,0
    bf9c:	00100513          	li	a0,1
    bfa0:	b29ff06f          	j	bac8 <__udivdi3+0x18c>
    bfa4:	00078b93          	mv	s7,a5
    bfa8:	da5ff06f          	j	bd4c <__udivdi3+0x410>
    bfac:	00078b93          	mv	s7,a5
    bfb0:	ee1ff06f          	j	be90 <__udivdi3+0x554>
    bfb4:	00070b13          	mv	s6,a4
    bfb8:	d35ff06f          	j	bcec <__udivdi3+0x3b0>
    bfbc:	00070413          	mv	s0,a4
    bfc0:	e71ff06f          	j	be30 <__udivdi3+0x4f4>
    bfc4:	ffe98993          	add	s3,s3,-2
    bfc8:	015787b3          	add	a5,a5,s5
    bfcc:	c05ff06f          	j	bbd0 <__udivdi3+0x294>
    bfd0:	ffe90913          	add	s2,s2,-2
    bfd4:	015787b3          	add	a5,a5,s5
    bfd8:	a51ff06f          	j	ba28 <__udivdi3+0xec>
    bfdc:	01865693          	srl	a3,a2,0x18
    bfe0:	01800713          	li	a4,24
    bfe4:	b69ff06f          	j	bb4c <__udivdi3+0x210>

0000bfe8 <__umoddi3>:
    bfe8:	fd010113          	add	sp,sp,-48
    bfec:	02112623          	sw	ra,44(sp)
    bff0:	00050793          	mv	a5,a0
    bff4:	14069663          	bnez	a3,c140 <__umoddi3+0x158>
    bff8:	03212023          	sw	s2,32(sp)
    bffc:	01412c23          	sw	s4,24(sp)
    c000:	02812423          	sw	s0,40(sp)
    c004:	02912223          	sw	s1,36(sp)
    c008:	01312e23          	sw	s3,28(sp)
    c00c:	01512a23          	sw	s5,20(sp)
    c010:	00060a13          	mv	s4,a2
    c014:	00050913          	mv	s2,a0
    c018:	1ac5f663          	bgeu	a1,a2,c1c4 <__umoddi3+0x1dc>
    c01c:	01612823          	sw	s6,16(sp)
    c020:	00010737          	lui	a4,0x10
    c024:	00058993          	mv	s3,a1
    c028:	28e66063          	bltu	a2,a4,c2a8 <__umoddi3+0x2c0>
    c02c:	01000737          	lui	a4,0x1000
    c030:	01800693          	li	a3,24
    c034:	00e67463          	bgeu	a2,a4,c03c <__umoddi3+0x54>
    c038:	01000693          	li	a3,16
    c03c:	00d65533          	srl	a0,a2,a3
    c040:	00004717          	auipc	a4,0x4
    c044:	ca070713          	add	a4,a4,-864 # fce0 <__clz_tab>
    c048:	00a70733          	add	a4,a4,a0
    c04c:	00074703          	lbu	a4,0(a4)
    c050:	02000513          	li	a0,32
    c054:	00d70733          	add	a4,a4,a3
    c058:	40e504b3          	sub	s1,a0,a4
    c05c:	00e50c63          	beq	a0,a4,c074 <__umoddi3+0x8c>
    c060:	009599b3          	sll	s3,a1,s1
    c064:	00e7d733          	srl	a4,a5,a4
    c068:	00961a33          	sll	s4,a2,s1
    c06c:	013769b3          	or	s3,a4,s3
    c070:	00979933          	sll	s2,a5,s1
    c074:	010a5a93          	srl	s5,s4,0x10
    c078:	000a8593          	mv	a1,s5
    c07c:	00098513          	mv	a0,s3
    c080:	010a1b13          	sll	s6,s4,0x10
    c084:	150030ef          	jal	f1d4 <__hidden___udivsi3>
    c088:	010b5b13          	srl	s6,s6,0x10
    c08c:	000b0593          	mv	a1,s6
    c090:	080030ef          	jal	f110 <__mulsi3>
    c094:	00050413          	mv	s0,a0
    c098:	000a8593          	mv	a1,s5
    c09c:	00098513          	mv	a0,s3
    c0a0:	17c030ef          	jal	f21c <__umodsi3>
    c0a4:	01051513          	sll	a0,a0,0x10
    c0a8:	01095793          	srl	a5,s2,0x10
    c0ac:	00a7e7b3          	or	a5,a5,a0
    c0b0:	0087f863          	bgeu	a5,s0,c0c0 <__umoddi3+0xd8>
    c0b4:	00fa07b3          	add	a5,s4,a5
    c0b8:	0147e463          	bltu	a5,s4,c0c0 <__umoddi3+0xd8>
    c0bc:	5687e863          	bltu	a5,s0,c62c <__umoddi3+0x644>
    c0c0:	40878433          	sub	s0,a5,s0
    c0c4:	000a8593          	mv	a1,s5
    c0c8:	00040513          	mv	a0,s0
    c0cc:	108030ef          	jal	f1d4 <__hidden___udivsi3>
    c0d0:	000b0593          	mv	a1,s6
    c0d4:	03c030ef          	jal	f110 <__mulsi3>
    c0d8:	00050793          	mv	a5,a0
    c0dc:	000a8593          	mv	a1,s5
    c0e0:	00040513          	mv	a0,s0
    c0e4:	00078413          	mv	s0,a5
    c0e8:	134030ef          	jal	f21c <__umodsi3>
    c0ec:	01091793          	sll	a5,s2,0x10
    c0f0:	01051513          	sll	a0,a0,0x10
    c0f4:	0107d793          	srl	a5,a5,0x10
    c0f8:	00a7e7b3          	or	a5,a5,a0
    c0fc:	0087f863          	bgeu	a5,s0,c10c <__umoddi3+0x124>
    c100:	00fa07b3          	add	a5,s4,a5
    c104:	0147e463          	bltu	a5,s4,c10c <__umoddi3+0x124>
    c108:	5087ea63          	bltu	a5,s0,c61c <__umoddi3+0x634>
    c10c:	01012b03          	lw	s6,16(sp)
    c110:	408787b3          	sub	a5,a5,s0
    c114:	0097d533          	srl	a0,a5,s1
    c118:	02812403          	lw	s0,40(sp)
    c11c:	02412483          	lw	s1,36(sp)
    c120:	02012903          	lw	s2,32(sp)
    c124:	01c12983          	lw	s3,28(sp)
    c128:	01812a03          	lw	s4,24(sp)
    c12c:	01412a83          	lw	s5,20(sp)
    c130:	00000593          	li	a1,0
    c134:	02c12083          	lw	ra,44(sp)
    c138:	03010113          	add	sp,sp,48
    c13c:	00008067          	ret
    c140:	00050893          	mv	a7,a0
    c144:	fed5e8e3          	bltu	a1,a3,c134 <__umoddi3+0x14c>
    c148:	03212023          	sw	s2,32(sp)
    c14c:	01312e23          	sw	s3,28(sp)
    c150:	00010737          	lui	a4,0x10
    c154:	00058813          	mv	a6,a1
    c158:	24e6ec63          	bltu	a3,a4,c3b0 <__umoddi3+0x3c8>
    c15c:	01000737          	lui	a4,0x1000
    c160:	01800513          	li	a0,24
    c164:	00e6f463          	bgeu	a3,a4,c16c <__umoddi3+0x184>
    c168:	01000513          	li	a0,16
    c16c:	00a6d333          	srl	t1,a3,a0
    c170:	00004717          	auipc	a4,0x4
    c174:	b7070713          	add	a4,a4,-1168 # fce0 <__clz_tab>
    c178:	00670733          	add	a4,a4,t1
    c17c:	00074703          	lbu	a4,0(a4)
    c180:	02000313          	li	t1,32
    c184:	00a709b3          	add	s3,a4,a0
    c188:	41330933          	sub	s2,t1,s3
    c18c:	25331a63          	bne	t1,s3,c3e0 <__umoddi3+0x3f8>
    c190:	00b6e463          	bltu	a3,a1,c198 <__umoddi3+0x1b0>
    c194:	00c7ea63          	bltu	a5,a2,c1a8 <__umoddi3+0x1c0>
    c198:	40c788b3          	sub	a7,a5,a2
    c19c:	40d586b3          	sub	a3,a1,a3
    c1a0:	0117b833          	sltu	a6,a5,a7
    c1a4:	41068833          	sub	a6,a3,a6
    c1a8:	02c12083          	lw	ra,44(sp)
    c1ac:	02012903          	lw	s2,32(sp)
    c1b0:	01c12983          	lw	s3,28(sp)
    c1b4:	00088513          	mv	a0,a7
    c1b8:	00080593          	mv	a1,a6
    c1bc:	03010113          	add	sp,sp,48
    c1c0:	00008067          	ret
    c1c4:	0e060a63          	beqz	a2,c2b8 <__umoddi3+0x2d0>
    c1c8:	00010737          	lui	a4,0x10
    c1cc:	42e67663          	bgeu	a2,a4,c5f8 <__umoddi3+0x610>
    c1d0:	10063693          	sltiu	a3,a2,256
    c1d4:	0016b693          	seqz	a3,a3
    c1d8:	00369693          	sll	a3,a3,0x3
    c1dc:	00d65533          	srl	a0,a2,a3
    c1e0:	00004717          	auipc	a4,0x4
    c1e4:	b0070713          	add	a4,a4,-1280 # fce0 <__clz_tab>
    c1e8:	00a70733          	add	a4,a4,a0
    c1ec:	00074983          	lbu	s3,0(a4)
    c1f0:	02000713          	li	a4,32
    c1f4:	00d989b3          	add	s3,s3,a3
    c1f8:	413704b3          	sub	s1,a4,s3
    c1fc:	0f371263          	bne	a4,s3,c2e0 <__umoddi3+0x2f8>
    c200:	01061413          	sll	s0,a2,0x10
    c204:	40c589b3          	sub	s3,a1,a2
    c208:	01065a93          	srl	s5,a2,0x10
    c20c:	01045413          	srl	s0,s0,0x10
    c210:	000a8593          	mv	a1,s5
    c214:	00098513          	mv	a0,s3
    c218:	7bd020ef          	jal	f1d4 <__hidden___udivsi3>
    c21c:	00040593          	mv	a1,s0
    c220:	6f1020ef          	jal	f110 <__mulsi3>
    c224:	00050793          	mv	a5,a0
    c228:	000a8593          	mv	a1,s5
    c22c:	00098513          	mv	a0,s3
    c230:	00078993          	mv	s3,a5
    c234:	7e9020ef          	jal	f21c <__umodsi3>
    c238:	01051513          	sll	a0,a0,0x10
    c23c:	01095793          	srl	a5,s2,0x10
    c240:	00a7e7b3          	or	a5,a5,a0
    c244:	0137f863          	bgeu	a5,s3,c254 <__umoddi3+0x26c>
    c248:	00fa07b3          	add	a5,s4,a5
    c24c:	0147e463          	bltu	a5,s4,c254 <__umoddi3+0x26c>
    c250:	3d37ea63          	bltu	a5,s3,c624 <__umoddi3+0x63c>
    c254:	413789b3          	sub	s3,a5,s3
    c258:	000a8593          	mv	a1,s5
    c25c:	00098513          	mv	a0,s3
    c260:	775020ef          	jal	f1d4 <__hidden___udivsi3>
    c264:	00040593          	mv	a1,s0
    c268:	6a9020ef          	jal	f110 <__mulsi3>
    c26c:	00050413          	mv	s0,a0
    c270:	000a8593          	mv	a1,s5
    c274:	00098513          	mv	a0,s3
    c278:	7a5020ef          	jal	f21c <__umodsi3>
    c27c:	01091913          	sll	s2,s2,0x10
    c280:	01051793          	sll	a5,a0,0x10
    c284:	01095913          	srl	s2,s2,0x10
    c288:	00f967b3          	or	a5,s2,a5
    c28c:	0087fa63          	bgeu	a5,s0,c2a0 <__umoddi3+0x2b8>
    c290:	00fa07b3          	add	a5,s4,a5
    c294:	0147e663          	bltu	a5,s4,c2a0 <__umoddi3+0x2b8>
    c298:	0087f463          	bgeu	a5,s0,c2a0 <__umoddi3+0x2b8>
    c29c:	014787b3          	add	a5,a5,s4
    c2a0:	408787b3          	sub	a5,a5,s0
    c2a4:	e71ff06f          	j	c114 <__umoddi3+0x12c>
    c2a8:	10063693          	sltiu	a3,a2,256
    c2ac:	0016b693          	seqz	a3,a3
    c2b0:	00369693          	sll	a3,a3,0x3
    c2b4:	d89ff06f          	j	c03c <__umoddi3+0x54>
    c2b8:	00000513          	li	a0,0
    c2bc:	00004717          	auipc	a4,0x4
    c2c0:	a2470713          	add	a4,a4,-1500 # fce0 <__clz_tab>
    c2c4:	00a70733          	add	a4,a4,a0
    c2c8:	00074983          	lbu	s3,0(a4)
    c2cc:	00000693          	li	a3,0
    c2d0:	02000713          	li	a4,32
    c2d4:	00d989b3          	add	s3,s3,a3
    c2d8:	413704b3          	sub	s1,a4,s3
    c2dc:	f33702e3          	beq	a4,s3,c200 <__umoddi3+0x218>
    c2e0:	00961a33          	sll	s4,a2,s1
    c2e4:	01712623          	sw	s7,12(sp)
    c2e8:	010a5a93          	srl	s5,s4,0x10
    c2ec:	0135dbb3          	srl	s7,a1,s3
    c2f0:	00959733          	sll	a4,a1,s1
    c2f4:	0137d9b3          	srl	s3,a5,s3
    c2f8:	000a8593          	mv	a1,s5
    c2fc:	000b8513          	mv	a0,s7
    c300:	010a1413          	sll	s0,s4,0x10
    c304:	00e9e9b3          	or	s3,s3,a4
    c308:	00979933          	sll	s2,a5,s1
    c30c:	01612823          	sw	s6,16(sp)
    c310:	01045413          	srl	s0,s0,0x10
    c314:	6c1020ef          	jal	f1d4 <__hidden___udivsi3>
    c318:	00040593          	mv	a1,s0
    c31c:	5f5020ef          	jal	f110 <__mulsi3>
    c320:	00050b13          	mv	s6,a0
    c324:	000a8593          	mv	a1,s5
    c328:	000b8513          	mv	a0,s7
    c32c:	6f1020ef          	jal	f21c <__umodsi3>
    c330:	01051513          	sll	a0,a0,0x10
    c334:	0109d793          	srl	a5,s3,0x10
    c338:	00a7e7b3          	or	a5,a5,a0
    c33c:	0167fa63          	bgeu	a5,s6,c350 <__umoddi3+0x368>
    c340:	00fa07b3          	add	a5,s4,a5
    c344:	0147e663          	bltu	a5,s4,c350 <__umoddi3+0x368>
    c348:	0167f463          	bgeu	a5,s6,c350 <__umoddi3+0x368>
    c34c:	014787b3          	add	a5,a5,s4
    c350:	41678b33          	sub	s6,a5,s6
    c354:	000a8593          	mv	a1,s5
    c358:	000b0513          	mv	a0,s6
    c35c:	679020ef          	jal	f1d4 <__hidden___udivsi3>
    c360:	00040593          	mv	a1,s0
    c364:	5ad020ef          	jal	f110 <__mulsi3>
    c368:	00050793          	mv	a5,a0
    c36c:	000a8593          	mv	a1,s5
    c370:	000b0513          	mv	a0,s6
    c374:	01099993          	sll	s3,s3,0x10
    c378:	00078b13          	mv	s6,a5
    c37c:	6a1020ef          	jal	f21c <__umodsi3>
    c380:	01051513          	sll	a0,a0,0x10
    c384:	0109d993          	srl	s3,s3,0x10
    c388:	00a9e9b3          	or	s3,s3,a0
    c38c:	0169fa63          	bgeu	s3,s6,c3a0 <__umoddi3+0x3b8>
    c390:	013a09b3          	add	s3,s4,s3
    c394:	0149e663          	bltu	s3,s4,c3a0 <__umoddi3+0x3b8>
    c398:	0169f463          	bgeu	s3,s6,c3a0 <__umoddi3+0x3b8>
    c39c:	014989b3          	add	s3,s3,s4
    c3a0:	416989b3          	sub	s3,s3,s6
    c3a4:	00c12b83          	lw	s7,12(sp)
    c3a8:	01012b03          	lw	s6,16(sp)
    c3ac:	e65ff06f          	j	c210 <__umoddi3+0x228>
    c3b0:	1006b513          	sltiu	a0,a3,256
    c3b4:	00153513          	seqz	a0,a0
    c3b8:	00351513          	sll	a0,a0,0x3
    c3bc:	00a6d333          	srl	t1,a3,a0
    c3c0:	00004717          	auipc	a4,0x4
    c3c4:	92070713          	add	a4,a4,-1760 # fce0 <__clz_tab>
    c3c8:	00670733          	add	a4,a4,t1
    c3cc:	00074703          	lbu	a4,0(a4)
    c3d0:	02000313          	li	t1,32
    c3d4:	00a709b3          	add	s3,a4,a0
    c3d8:	41330933          	sub	s2,t1,s3
    c3dc:	db330ae3          	beq	t1,s3,c190 <__umoddi3+0x1a8>
    c3e0:	01512a23          	sw	s5,20(sp)
    c3e4:	012696b3          	sll	a3,a3,s2
    c3e8:	01365ab3          	srl	s5,a2,s3
    c3ec:	00daeab3          	or	s5,s5,a3
    c3f0:	01712623          	sw	s7,12(sp)
    c3f4:	01a12023          	sw	s10,0(sp)
    c3f8:	010adb93          	srl	s7,s5,0x10
    c3fc:	0135dd33          	srl	s10,a1,s3
    c400:	01259733          	sll	a4,a1,s2
    c404:	0137d6b3          	srl	a3,a5,s3
    c408:	01912223          	sw	s9,4(sp)
    c40c:	000b8593          	mv	a1,s7
    c410:	000d0513          	mv	a0,s10
    c414:	010a9c93          	sll	s9,s5,0x10
    c418:	02812423          	sw	s0,40(sp)
    c41c:	02912223          	sw	s1,36(sp)
    c420:	01261433          	sll	s0,a2,s2
    c424:	012794b3          	sll	s1,a5,s2
    c428:	01412c23          	sw	s4,24(sp)
    c42c:	01612823          	sw	s6,16(sp)
    c430:	00e6ea33          	or	s4,a3,a4
    c434:	01812423          	sw	s8,8(sp)
    c438:	010cdc93          	srl	s9,s9,0x10
    c43c:	599020ef          	jal	f1d4 <__hidden___udivsi3>
    c440:	00050593          	mv	a1,a0
    c444:	00050b13          	mv	s6,a0
    c448:	000c8513          	mv	a0,s9
    c44c:	4c5020ef          	jal	f110 <__mulsi3>
    c450:	00050c13          	mv	s8,a0
    c454:	000b8593          	mv	a1,s7
    c458:	000d0513          	mv	a0,s10
    c45c:	5c1020ef          	jal	f21c <__umodsi3>
    c460:	01051513          	sll	a0,a0,0x10
    c464:	010a5793          	srl	a5,s4,0x10
    c468:	00a7e7b3          	or	a5,a5,a0
    c46c:	0187fe63          	bgeu	a5,s8,c488 <__umoddi3+0x4a0>
    c470:	00fa87b3          	add	a5,s5,a5
    c474:	fffb0713          	add	a4,s6,-1
    c478:	1957ee63          	bltu	a5,s5,c614 <__umoddi3+0x62c>
    c47c:	1987fc63          	bgeu	a5,s8,c614 <__umoddi3+0x62c>
    c480:	ffeb0b13          	add	s6,s6,-2
    c484:	015787b3          	add	a5,a5,s5
    c488:	41878c33          	sub	s8,a5,s8
    c48c:	000b8593          	mv	a1,s7
    c490:	000c0513          	mv	a0,s8
    c494:	541020ef          	jal	f1d4 <__hidden___udivsi3>
    c498:	00050593          	mv	a1,a0
    c49c:	00050d13          	mv	s10,a0
    c4a0:	000c8513          	mv	a0,s9
    c4a4:	46d020ef          	jal	f110 <__mulsi3>
    c4a8:	00050793          	mv	a5,a0
    c4ac:	000b8593          	mv	a1,s7
    c4b0:	000c0513          	mv	a0,s8
    c4b4:	00078b93          	mv	s7,a5
    c4b8:	565020ef          	jal	f21c <__umodsi3>
    c4bc:	010a1593          	sll	a1,s4,0x10
    c4c0:	01051513          	sll	a0,a0,0x10
    c4c4:	0105d593          	srl	a1,a1,0x10
    c4c8:	00a5e5b3          	or	a1,a1,a0
    c4cc:	0175fe63          	bgeu	a1,s7,c4e8 <__umoddi3+0x500>
    c4d0:	00ba85b3          	add	a1,s5,a1
    c4d4:	fffd0793          	add	a5,s10,-1
    c4d8:	1355ea63          	bltu	a1,s5,c60c <__umoddi3+0x624>
    c4dc:	1375f863          	bgeu	a1,s7,c60c <__umoddi3+0x624>
    c4e0:	ffed0d13          	add	s10,s10,-2
    c4e4:	015585b3          	add	a1,a1,s5
    c4e8:	010b1793          	sll	a5,s6,0x10
    c4ec:	00010e37          	lui	t3,0x10
    c4f0:	01a7e7b3          	or	a5,a5,s10
    c4f4:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    c4f8:	0067f8b3          	and	a7,a5,t1
    c4fc:	00647333          	and	t1,s0,t1
    c500:	41758733          	sub	a4,a1,s7
    c504:	0107d793          	srl	a5,a5,0x10
    c508:	01045e93          	srl	t4,s0,0x10
    c50c:	00088513          	mv	a0,a7
    c510:	00030593          	mv	a1,t1
    c514:	3fd020ef          	jal	f110 <__mulsi3>
    c518:	00050813          	mv	a6,a0
    c51c:	000e8593          	mv	a1,t4
    c520:	00088513          	mv	a0,a7
    c524:	3ed020ef          	jal	f110 <__mulsi3>
    c528:	00050893          	mv	a7,a0
    c52c:	00030593          	mv	a1,t1
    c530:	00078513          	mv	a0,a5
    c534:	3dd020ef          	jal	f110 <__mulsi3>
    c538:	00050313          	mv	t1,a0
    c53c:	000e8593          	mv	a1,t4
    c540:	00078513          	mv	a0,a5
    c544:	3cd020ef          	jal	f110 <__mulsi3>
    c548:	01085793          	srl	a5,a6,0x10
    c54c:	006888b3          	add	a7,a7,t1
    c550:	011787b3          	add	a5,a5,a7
    c554:	0067f463          	bgeu	a5,t1,c55c <__umoddi3+0x574>
    c558:	01c50533          	add	a0,a0,t3
    c55c:	00010637          	lui	a2,0x10
    c560:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    c564:	0107d693          	srl	a3,a5,0x10
    c568:	00c7f7b3          	and	a5,a5,a2
    c56c:	01079793          	sll	a5,a5,0x10
    c570:	00c87833          	and	a6,a6,a2
    c574:	00a686b3          	add	a3,a3,a0
    c578:	010787b3          	add	a5,a5,a6
    c57c:	06d76263          	bltu	a4,a3,c5e0 <__umoddi3+0x5f8>
    c580:	04d70e63          	beq	a4,a3,c5dc <__umoddi3+0x5f4>
    c584:	40f487b3          	sub	a5,s1,a5
    c588:	00f4b4b3          	sltu	s1,s1,a5
    c58c:	02812403          	lw	s0,40(sp)
    c590:	02c12083          	lw	ra,44(sp)
    c594:	40d705b3          	sub	a1,a4,a3
    c598:	409585b3          	sub	a1,a1,s1
    c59c:	01359733          	sll	a4,a1,s3
    c5a0:	0127d7b3          	srl	a5,a5,s2
    c5a4:	02412483          	lw	s1,36(sp)
    c5a8:	01c12983          	lw	s3,28(sp)
    c5ac:	01812a03          	lw	s4,24(sp)
    c5b0:	01412a83          	lw	s5,20(sp)
    c5b4:	01012b03          	lw	s6,16(sp)
    c5b8:	00c12b83          	lw	s7,12(sp)
    c5bc:	00812c03          	lw	s8,8(sp)
    c5c0:	00412c83          	lw	s9,4(sp)
    c5c4:	00012d03          	lw	s10,0(sp)
    c5c8:	0125d5b3          	srl	a1,a1,s2
    c5cc:	00f76533          	or	a0,a4,a5
    c5d0:	02012903          	lw	s2,32(sp)
    c5d4:	03010113          	add	sp,sp,48
    c5d8:	00008067          	ret
    c5dc:	faf4f4e3          	bgeu	s1,a5,c584 <__umoddi3+0x59c>
    c5e0:	40878433          	sub	s0,a5,s0
    c5e4:	0087b7b3          	sltu	a5,a5,s0
    c5e8:	01578ab3          	add	s5,a5,s5
    c5ec:	415686b3          	sub	a3,a3,s5
    c5f0:	00040793          	mv	a5,s0
    c5f4:	f91ff06f          	j	c584 <__umoddi3+0x59c>
    c5f8:	01000737          	lui	a4,0x1000
    c5fc:	02e67c63          	bgeu	a2,a4,c634 <__umoddi3+0x64c>
    c600:	01065513          	srl	a0,a2,0x10
    c604:	01000693          	li	a3,16
    c608:	bd9ff06f          	j	c1e0 <__umoddi3+0x1f8>
    c60c:	00078d13          	mv	s10,a5
    c610:	ed9ff06f          	j	c4e8 <__umoddi3+0x500>
    c614:	00070b13          	mv	s6,a4
    c618:	e71ff06f          	j	c488 <__umoddi3+0x4a0>
    c61c:	014787b3          	add	a5,a5,s4
    c620:	aedff06f          	j	c10c <__umoddi3+0x124>
    c624:	014787b3          	add	a5,a5,s4
    c628:	c2dff06f          	j	c254 <__umoddi3+0x26c>
    c62c:	014787b3          	add	a5,a5,s4
    c630:	a91ff06f          	j	c0c0 <__umoddi3+0xd8>
    c634:	01865513          	srl	a0,a2,0x18
    c638:	01800693          	li	a3,24
    c63c:	ba5ff06f          	j	c1e0 <__umoddi3+0x1f8>

0000c640 <__adddf3>:
    c640:	001007b7          	lui	a5,0x100
    c644:	fe010113          	add	sp,sp,-32
    c648:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c64c:	00bef833          	and	a6,t4,a1
    c650:	00def7b3          	and	a5,t4,a3
    c654:	0146d313          	srl	t1,a3,0x14
    c658:	01212823          	sw	s2,16(sp)
    c65c:	0145d913          	srl	s2,a1,0x14
    c660:	00379793          	sll	a5,a5,0x3
    c664:	00812c23          	sw	s0,24(sp)
    c668:	00381813          	sll	a6,a6,0x3
    c66c:	01f5d413          	srl	s0,a1,0x1f
    c670:	01d55713          	srl	a4,a0,0x1d
    c674:	01d65893          	srl	a7,a2,0x1d
    c678:	7ff97913          	and	s2,s2,2047
    c67c:	7ff37313          	and	t1,t1,2047
    c680:	00112e23          	sw	ra,28(sp)
    c684:	00912a23          	sw	s1,20(sp)
    c688:	01312623          	sw	s3,12(sp)
    c68c:	01f6d693          	srl	a3,a3,0x1f
    c690:	00f8e8b3          	or	a7,a7,a5
    c694:	01076733          	or	a4,a4,a6
    c698:	00351593          	sll	a1,a0,0x3
    c69c:	00361f13          	sll	t5,a2,0x3
    c6a0:	406907b3          	sub	a5,s2,t1
    c6a4:	1ed40463          	beq	s0,a3,c88c <__adddf3+0x24c>
    c6a8:	16f05263          	blez	a5,c80c <__adddf3+0x1cc>
    c6ac:	28030663          	beqz	t1,c938 <__adddf3+0x2f8>
    c6b0:	7ff00693          	li	a3,2047
    c6b4:	42d90663          	beq	s2,a3,cae0 <__adddf3+0x4a0>
    c6b8:	03800693          	li	a3,56
    c6bc:	00100613          	li	a2,1
    c6c0:	02f6ce63          	blt	a3,a5,c6fc <__adddf3+0xbc>
    c6c4:	008006b7          	lui	a3,0x800
    c6c8:	00d8e8b3          	or	a7,a7,a3
    c6cc:	01f00693          	li	a3,31
    c6d0:	52f6ce63          	blt	a3,a5,cc0c <__adddf3+0x5cc>
    c6d4:	02000693          	li	a3,32
    c6d8:	40f686b3          	sub	a3,a3,a5
    c6dc:	00d89633          	sll	a2,a7,a3
    c6e0:	00ff5533          	srl	a0,t5,a5
    c6e4:	00df16b3          	sll	a3,t5,a3
    c6e8:	00a66633          	or	a2,a2,a0
    c6ec:	00d036b3          	snez	a3,a3
    c6f0:	00f8d8b3          	srl	a7,a7,a5
    c6f4:	00d66633          	or	a2,a2,a3
    c6f8:	41170733          	sub	a4,a4,a7
    c6fc:	40c58633          	sub	a2,a1,a2
    c700:	00c5b5b3          	sltu	a1,a1,a2
    c704:	00060493          	mv	s1,a2
    c708:	40b709b3          	sub	s3,a4,a1
    c70c:	00899793          	sll	a5,s3,0x8
    c710:	3207da63          	bgez	a5,ca44 <__adddf3+0x404>
    c714:	008007b7          	lui	a5,0x800
    c718:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c71c:	00f9f9b3          	and	s3,s3,a5
    c720:	2c098863          	beqz	s3,c9f0 <__adddf3+0x3b0>
    c724:	00098513          	mv	a0,s3
    c728:	359020ef          	jal	f280 <__clzsi2>
    c72c:	ff850793          	add	a5,a0,-8
    c730:	02000693          	li	a3,32
    c734:	40f68733          	sub	a4,a3,a5
    c738:	00e4d733          	srl	a4,s1,a4
    c73c:	00f999b3          	sll	s3,s3,a5
    c740:	01376733          	or	a4,a4,s3
    c744:	00f494b3          	sll	s1,s1,a5
    c748:	4b27c863          	blt	a5,s2,cbf8 <__adddf3+0x5b8>
    c74c:	412787b3          	sub	a5,a5,s2
    c750:	00178793          	add	a5,a5,1
    c754:	40f686b3          	sub	a3,a3,a5
    c758:	00d49633          	sll	a2,s1,a3
    c75c:	00f4d9b3          	srl	s3,s1,a5
    c760:	00c03633          	snez	a2,a2
    c764:	01366633          	or	a2,a2,s3
    c768:	00d716b3          	sll	a3,a4,a3
    c76c:	00c6e4b3          	or	s1,a3,a2
    c770:	00f759b3          	srl	s3,a4,a5
    c774:	00000913          	li	s2,0
    c778:	0074f793          	and	a5,s1,7
    c77c:	02078063          	beqz	a5,c79c <__adddf3+0x15c>
    c780:	00f4f793          	and	a5,s1,15
    c784:	00400713          	li	a4,4
    c788:	00e78a63          	beq	a5,a4,c79c <__adddf3+0x15c>
    c78c:	00448793          	add	a5,s1,4
    c790:	0097b633          	sltu	a2,a5,s1
    c794:	00c989b3          	add	s3,s3,a2
    c798:	00078493          	mv	s1,a5
    c79c:	00899793          	sll	a5,s3,0x8
    c7a0:	6e07da63          	bgez	a5,ce94 <__adddf3+0x854>
    c7a4:	00190793          	add	a5,s2,1
    c7a8:	7ff00713          	li	a4,2047
    c7ac:	00040e13          	mv	t3,s0
    c7b0:	2ae78663          	beq	a5,a4,ca5c <__adddf3+0x41c>
    c7b4:	ff800737          	lui	a4,0xff800
    c7b8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c7bc:	00e9f733          	and	a4,s3,a4
    c7c0:	7ff7f793          	and	a5,a5,2047
    c7c4:	01d71813          	sll	a6,a4,0x1d
    c7c8:	0034d613          	srl	a2,s1,0x3
    c7cc:	00971713          	sll	a4,a4,0x9
    c7d0:	00c86833          	or	a6,a6,a2
    c7d4:	00c75713          	srl	a4,a4,0xc
    c7d8:	01c12083          	lw	ra,28(sp)
    c7dc:	01812403          	lw	s0,24(sp)
    c7e0:	01479793          	sll	a5,a5,0x14
    c7e4:	00e7e7b3          	or	a5,a5,a4
    c7e8:	01fe1713          	sll	a4,t3,0x1f
    c7ec:	00e7e7b3          	or	a5,a5,a4
    c7f0:	01412483          	lw	s1,20(sp)
    c7f4:	01012903          	lw	s2,16(sp)
    c7f8:	00c12983          	lw	s3,12(sp)
    c7fc:	00080513          	mv	a0,a6
    c800:	00078593          	mv	a1,a5
    c804:	02010113          	add	sp,sp,32
    c808:	00008067          	ret
    c80c:	14078c63          	beqz	a5,c964 <__adddf3+0x324>
    c810:	412307b3          	sub	a5,t1,s2
    c814:	3c091263          	bnez	s2,cbd8 <__adddf3+0x598>
    c818:	00b76533          	or	a0,a4,a1
    c81c:	4c050463          	beqz	a0,cce4 <__adddf3+0x6a4>
    c820:	fff78513          	add	a0,a5,-1
    c824:	60050263          	beqz	a0,ce28 <__adddf3+0x7e8>
    c828:	7ff00813          	li	a6,2047
    c82c:	57078663          	beq	a5,a6,cd98 <__adddf3+0x758>
    c830:	03800793          	li	a5,56
    c834:	00100613          	li	a2,1
    c838:	02a7cc63          	blt	a5,a0,c870 <__adddf3+0x230>
    c83c:	00050793          	mv	a5,a0
    c840:	01f00613          	li	a2,31
    c844:	56f64c63          	blt	a2,a5,cdbc <__adddf3+0x77c>
    c848:	02000513          	li	a0,32
    c84c:	40f50533          	sub	a0,a0,a5
    c850:	00a71633          	sll	a2,a4,a0
    c854:	00f5d833          	srl	a6,a1,a5
    c858:	00a59533          	sll	a0,a1,a0
    c85c:	01066633          	or	a2,a2,a6
    c860:	00a03533          	snez	a0,a0
    c864:	00f75733          	srl	a4,a4,a5
    c868:	00a66633          	or	a2,a2,a0
    c86c:	40e888b3          	sub	a7,a7,a4
    c870:	40cf0633          	sub	a2,t5,a2
    c874:	00cf3733          	sltu	a4,t5,a2
    c878:	00060493          	mv	s1,a2
    c87c:	40e889b3          	sub	s3,a7,a4
    c880:	00030913          	mv	s2,t1
    c884:	00068413          	mv	s0,a3
    c888:	e85ff06f          	j	c70c <__adddf3+0xcc>
    c88c:	1ef05063          	blez	a5,ca6c <__adddf3+0x42c>
    c890:	14031063          	bnez	t1,c9d0 <__adddf3+0x390>
    c894:	01e8e6b3          	or	a3,a7,t5
    c898:	26068c63          	beqz	a3,cb10 <__adddf3+0x4d0>
    c89c:	fff78693          	add	a3,a5,-1
    c8a0:	48068063          	beqz	a3,cd20 <__adddf3+0x6e0>
    c8a4:	7ff00613          	li	a2,2047
    c8a8:	22c78c63          	beq	a5,a2,cae0 <__adddf3+0x4a0>
    c8ac:	03800793          	li	a5,56
    c8b0:	00100993          	li	s3,1
    c8b4:	02d7cc63          	blt	a5,a3,c8ec <__adddf3+0x2ac>
    c8b8:	00068793          	mv	a5,a3
    c8bc:	01f00693          	li	a3,31
    c8c0:	4af6c063          	blt	a3,a5,cd60 <__adddf3+0x720>
    c8c4:	02000693          	li	a3,32
    c8c8:	40f686b3          	sub	a3,a3,a5
    c8cc:	00d899b3          	sll	s3,a7,a3
    c8d0:	00ff5633          	srl	a2,t5,a5
    c8d4:	00df16b3          	sll	a3,t5,a3
    c8d8:	00c9e9b3          	or	s3,s3,a2
    c8dc:	00d036b3          	snez	a3,a3
    c8e0:	00f8d8b3          	srl	a7,a7,a5
    c8e4:	00d9e9b3          	or	s3,s3,a3
    c8e8:	01170733          	add	a4,a4,a7
    c8ec:	00b985b3          	add	a1,s3,a1
    c8f0:	0135b9b3          	sltu	s3,a1,s3
    c8f4:	00058493          	mv	s1,a1
    c8f8:	00e989b3          	add	s3,s3,a4
    c8fc:	00899793          	sll	a5,s3,0x8
    c900:	1407d263          	bgez	a5,ca44 <__adddf3+0x404>
    c904:	00190913          	add	s2,s2,1
    c908:	7ff00793          	li	a5,2047
    c90c:	36f90c63          	beq	s2,a5,cc84 <__adddf3+0x644>
    c910:	ff8007b7          	lui	a5,0xff800
    c914:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c918:	0014f613          	and	a2,s1,1
    c91c:	00f9f7b3          	and	a5,s3,a5
    c920:	0014d713          	srl	a4,s1,0x1
    c924:	00c76733          	or	a4,a4,a2
    c928:	01f79613          	sll	a2,a5,0x1f
    c92c:	00e664b3          	or	s1,a2,a4
    c930:	0017d993          	srl	s3,a5,0x1
    c934:	e45ff06f          	j	c778 <__adddf3+0x138>
    c938:	01e8e6b3          	or	a3,a7,t5
    c93c:	1c068a63          	beqz	a3,cb10 <__adddf3+0x4d0>
    c940:	fff78693          	add	a3,a5,-1
    c944:	40068063          	beqz	a3,cd44 <__adddf3+0x704>
    c948:	7ff00613          	li	a2,2047
    c94c:	18c78a63          	beq	a5,a2,cae0 <__adddf3+0x4a0>
    c950:	03800793          	li	a5,56
    c954:	00100613          	li	a2,1
    c958:	dad7c2e3          	blt	a5,a3,c6fc <__adddf3+0xbc>
    c95c:	00068793          	mv	a5,a3
    c960:	d6dff06f          	j	c6cc <__adddf3+0x8c>
    c964:	00190813          	add	a6,s2,1
    c968:	7fe87813          	and	a6,a6,2046
    c96c:	22081c63          	bnez	a6,cba4 <__adddf3+0x564>
    c970:	00b76333          	or	t1,a4,a1
    c974:	01e8e833          	or	a6,a7,t5
    c978:	38091063          	bnez	s2,ccf8 <__adddf3+0x6b8>
    c97c:	46030e63          	beqz	t1,cdf8 <__adddf3+0x7b8>
    c980:	40080663          	beqz	a6,cd8c <__adddf3+0x74c>
    c984:	41e589b3          	sub	s3,a1,t5
    c988:	0135b533          	sltu	a0,a1,s3
    c98c:	41170633          	sub	a2,a4,a7
    c990:	40a60633          	sub	a2,a2,a0
    c994:	00861513          	sll	a0,a2,0x8
    c998:	50055e63          	bgez	a0,ceb4 <__adddf3+0x874>
    c99c:	40bf05b3          	sub	a1,t5,a1
    c9a0:	40e88733          	sub	a4,a7,a4
    c9a4:	00bf3f33          	sltu	t5,t5,a1
    c9a8:	41e70733          	sub	a4,a4,t5
    c9ac:	00871613          	sll	a2,a4,0x8
    c9b0:	00058493          	mv	s1,a1
    c9b4:	52065e63          	bgez	a2,cef0 <__adddf3+0x8b0>
    c9b8:	ff8007b7          	lui	a5,0xff800
    c9bc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c9c0:	00f77733          	and	a4,a4,a5
    c9c4:	00068e13          	mv	t3,a3
    c9c8:	00100793          	li	a5,1
    c9cc:	df9ff06f          	j	c7c4 <__adddf3+0x184>
    c9d0:	7ff00693          	li	a3,2047
    c9d4:	10d90663          	beq	s2,a3,cae0 <__adddf3+0x4a0>
    c9d8:	03800693          	li	a3,56
    c9dc:	00100993          	li	s3,1
    c9e0:	f0f6c6e3          	blt	a3,a5,c8ec <__adddf3+0x2ac>
    c9e4:	008006b7          	lui	a3,0x800
    c9e8:	00d8e8b3          	or	a7,a7,a3
    c9ec:	ed1ff06f          	j	c8bc <__adddf3+0x27c>
    c9f0:	00048513          	mv	a0,s1
    c9f4:	08d020ef          	jal	f280 <__clzsi2>
    c9f8:	01850793          	add	a5,a0,24
    c9fc:	01f00693          	li	a3,31
    ca00:	d2f6d8e3          	bge	a3,a5,c730 <__adddf3+0xf0>
    ca04:	ff850713          	add	a4,a0,-8
    ca08:	00e49733          	sll	a4,s1,a4
    ca0c:	2327c663          	blt	a5,s2,cc38 <__adddf3+0x5f8>
    ca10:	41278933          	sub	s2,a5,s2
    ca14:	00190793          	add	a5,s2,1
    ca18:	48f6d663          	bge	a3,a5,cea4 <__adddf3+0x864>
    ca1c:	fe190913          	add	s2,s2,-31
    ca20:	02000693          	li	a3,32
    ca24:	012754b3          	srl	s1,a4,s2
    ca28:	00d78c63          	beq	a5,a3,ca40 <__adddf3+0x400>
    ca2c:	04000693          	li	a3,64
    ca30:	40f687b3          	sub	a5,a3,a5
    ca34:	00f71733          	sll	a4,a4,a5
    ca38:	00e03733          	snez	a4,a4
    ca3c:	00e4e4b3          	or	s1,s1,a4
    ca40:	00000913          	li	s2,0
    ca44:	0074f793          	and	a5,s1,7
    ca48:	d2079ce3          	bnez	a5,c780 <__adddf3+0x140>
    ca4c:	00090793          	mv	a5,s2
    ca50:	0034d613          	srl	a2,s1,0x3
    ca54:	00098713          	mv	a4,s3
    ca58:	0c00006f          	j	cb18 <__adddf3+0x4d8>
    ca5c:	7ff00793          	li	a5,2047
    ca60:	00000713          	li	a4,0
    ca64:	00000813          	li	a6,0
    ca68:	d71ff06f          	j	c7d8 <__adddf3+0x198>
    ca6c:	0c078a63          	beqz	a5,cb40 <__adddf3+0x500>
    ca70:	412307b3          	sub	a5,t1,s2
    ca74:	1e090263          	beqz	s2,cc58 <__adddf3+0x618>
    ca78:	7ff00693          	li	a3,2047
    ca7c:	32d30863          	beq	t1,a3,cdac <__adddf3+0x76c>
    ca80:	03800693          	li	a3,56
    ca84:	00100993          	li	s3,1
    ca88:	02f6ce63          	blt	a3,a5,cac4 <__adddf3+0x484>
    ca8c:	008006b7          	lui	a3,0x800
    ca90:	00d76733          	or	a4,a4,a3
    ca94:	01f00693          	li	a3,31
    ca98:	3cf6c863          	blt	a3,a5,ce68 <__adddf3+0x828>
    ca9c:	02000693          	li	a3,32
    caa0:	40f686b3          	sub	a3,a3,a5
    caa4:	00d719b3          	sll	s3,a4,a3
    caa8:	00f5d633          	srl	a2,a1,a5
    caac:	00d596b3          	sll	a3,a1,a3
    cab0:	00c9e9b3          	or	s3,s3,a2
    cab4:	00d036b3          	snez	a3,a3
    cab8:	00f75733          	srl	a4,a4,a5
    cabc:	00d9e9b3          	or	s3,s3,a3
    cac0:	00e888b3          	add	a7,a7,a4
    cac4:	01e98733          	add	a4,s3,t5
    cac8:	013739b3          	sltu	s3,a4,s3
    cacc:	00070493          	mv	s1,a4
    cad0:	011989b3          	add	s3,s3,a7
    cad4:	00030913          	mv	s2,t1
    cad8:	e25ff06f          	j	c8fc <__adddf3+0x2bc>
    cadc:	02081063          	bnez	a6,cafc <__adddf3+0x4bc>
    cae0:	00351613          	sll	a2,a0,0x3
    cae4:	00365613          	srl	a2,a2,0x3
    cae8:	01d71813          	sll	a6,a4,0x1d
    caec:	00c86833          	or	a6,a6,a2
    caf0:	00375713          	srl	a4,a4,0x3
    caf4:	01076733          	or	a4,a4,a6
    caf8:	18070663          	beqz	a4,cc84 <__adddf3+0x644>
    cafc:	00000e13          	li	t3,0
    cb00:	7ff00793          	li	a5,2047
    cb04:	00080737          	lui	a4,0x80
    cb08:	00000813          	li	a6,0
    cb0c:	ccdff06f          	j	c7d8 <__adddf3+0x198>
    cb10:	00351613          	sll	a2,a0,0x3
    cb14:	00365613          	srl	a2,a2,0x3
    cb18:	01d71813          	sll	a6,a4,0x1d
    cb1c:	7ff00693          	li	a3,2047
    cb20:	00c86833          	or	a6,a6,a2
    cb24:	00375713          	srl	a4,a4,0x3
    cb28:	fcd786e3          	beq	a5,a3,caf4 <__adddf3+0x4b4>
    cb2c:	00c71713          	sll	a4,a4,0xc
    cb30:	00c75713          	srl	a4,a4,0xc
    cb34:	7ff7f793          	and	a5,a5,2047
    cb38:	00040e13          	mv	t3,s0
    cb3c:	c9dff06f          	j	c7d8 <__adddf3+0x198>
    cb40:	00190693          	add	a3,s2,1
    cb44:	7fe6f813          	and	a6,a3,2046
    cb48:	14081863          	bnez	a6,cc98 <__adddf3+0x658>
    cb4c:	00b766b3          	or	a3,a4,a1
    cb50:	28091c63          	bnez	s2,cde8 <__adddf3+0x7a8>
    cb54:	30068263          	beqz	a3,ce58 <__adddf3+0x818>
    cb58:	01e8e6b3          	or	a3,a7,t5
    cb5c:	22068863          	beqz	a3,cd8c <__adddf3+0x74c>
    cb60:	01e587b3          	add	a5,a1,t5
    cb64:	00b7b5b3          	sltu	a1,a5,a1
    cb68:	01170733          	add	a4,a4,a7
    cb6c:	00b70733          	add	a4,a4,a1
    cb70:	0037d813          	srl	a6,a5,0x3
    cb74:	00871793          	sll	a5,a4,0x8
    cb78:	00040e13          	mv	t3,s0
    cb7c:	3407de63          	bgez	a5,ced8 <__adddf3+0x898>
    cb80:	ff8007b7          	lui	a5,0xff800
    cb84:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    cb88:	00f77733          	and	a4,a4,a5
    cb8c:	01d71793          	sll	a5,a4,0x1d
    cb90:	00375713          	srl	a4,a4,0x3
    cb94:	0107e833          	or	a6,a5,a6
    cb98:	01d77733          	and	a4,a4,t4
    cb9c:	00100793          	li	a5,1
    cba0:	c39ff06f          	j	c7d8 <__adddf3+0x198>
    cba4:	41e58833          	sub	a6,a1,t5
    cba8:	0105b7b3          	sltu	a5,a1,a6
    cbac:	411709b3          	sub	s3,a4,a7
    cbb0:	40f989b3          	sub	s3,s3,a5
    cbb4:	00899793          	sll	a5,s3,0x8
    cbb8:	00080493          	mv	s1,a6
    cbbc:	1007c663          	bltz	a5,ccc8 <__adddf3+0x688>
    cbc0:	01386833          	or	a6,a6,s3
    cbc4:	b4081ee3          	bnez	a6,c720 <__adddf3+0xe0>
    cbc8:	00000e13          	li	t3,0
    cbcc:	00000793          	li	a5,0
    cbd0:	00000713          	li	a4,0
    cbd4:	c05ff06f          	j	c7d8 <__adddf3+0x198>
    cbd8:	7ff00513          	li	a0,2047
    cbdc:	1aa30e63          	beq	t1,a0,cd98 <__adddf3+0x758>
    cbe0:	03800513          	li	a0,56
    cbe4:	00100613          	li	a2,1
    cbe8:	c8f544e3          	blt	a0,a5,c870 <__adddf3+0x230>
    cbec:	00800637          	lui	a2,0x800
    cbf0:	00c76733          	or	a4,a4,a2
    cbf4:	c4dff06f          	j	c840 <__adddf3+0x200>
    cbf8:	ff8009b7          	lui	s3,0xff800
    cbfc:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    cc00:	40f90933          	sub	s2,s2,a5
    cc04:	013779b3          	and	s3,a4,s3
    cc08:	b71ff06f          	j	c778 <__adddf3+0x138>
    cc0c:	fe078693          	add	a3,a5,-32
    cc10:	02000613          	li	a2,32
    cc14:	00d8d6b3          	srl	a3,a7,a3
    cc18:	00c78a63          	beq	a5,a2,cc2c <__adddf3+0x5ec>
    cc1c:	04000613          	li	a2,64
    cc20:	40f607b3          	sub	a5,a2,a5
    cc24:	00f897b3          	sll	a5,a7,a5
    cc28:	00ff6f33          	or	t5,t5,a5
    cc2c:	01e03633          	snez	a2,t5
    cc30:	00d66633          	or	a2,a2,a3
    cc34:	ac9ff06f          	j	c6fc <__adddf3+0xbc>
    cc38:	ff8006b7          	lui	a3,0xff800
    cc3c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    cc40:	40f907b3          	sub	a5,s2,a5
    cc44:	00d77733          	and	a4,a4,a3
    cc48:	01d71813          	sll	a6,a4,0x1d
    cc4c:	01386833          	or	a6,a6,s3
    cc50:	00375713          	srl	a4,a4,0x3
    cc54:	ed9ff06f          	j	cb2c <__adddf3+0x4ec>
    cc58:	00b766b3          	or	a3,a4,a1
    cc5c:	1e068663          	beqz	a3,ce48 <__adddf3+0x808>
    cc60:	fff78693          	add	a3,a5,-1
    cc64:	0a068e63          	beqz	a3,cd20 <__adddf3+0x6e0>
    cc68:	7ff00513          	li	a0,2047
    cc6c:	14a78063          	beq	a5,a0,cdac <__adddf3+0x76c>
    cc70:	03800793          	li	a5,56
    cc74:	00100993          	li	s3,1
    cc78:	e4d7c6e3          	blt	a5,a3,cac4 <__adddf3+0x484>
    cc7c:	00068793          	mv	a5,a3
    cc80:	e15ff06f          	j	ca94 <__adddf3+0x454>
    cc84:	00040e13          	mv	t3,s0
    cc88:	7ff00793          	li	a5,2047
    cc8c:	00000713          	li	a4,0
    cc90:	00000813          	li	a6,0
    cc94:	b45ff06f          	j	c7d8 <__adddf3+0x198>
    cc98:	7ff00793          	li	a5,2047
    cc9c:	fef684e3          	beq	a3,a5,cc84 <__adddf3+0x644>
    cca0:	01e58f33          	add	t5,a1,t5
    cca4:	00bf35b3          	sltu	a1,t5,a1
    cca8:	011707b3          	add	a5,a4,a7
    ccac:	00b787b3          	add	a5,a5,a1
    ccb0:	01f79613          	sll	a2,a5,0x1f
    ccb4:	001f5f13          	srl	t5,t5,0x1
    ccb8:	01e664b3          	or	s1,a2,t5
    ccbc:	0017d993          	srl	s3,a5,0x1
    ccc0:	00068913          	mv	s2,a3
    ccc4:	ab5ff06f          	j	c778 <__adddf3+0x138>
    ccc8:	40bf0633          	sub	a2,t5,a1
    cccc:	40e887b3          	sub	a5,a7,a4
    ccd0:	00cf3733          	sltu	a4,t5,a2
    ccd4:	00060493          	mv	s1,a2
    ccd8:	40e789b3          	sub	s3,a5,a4
    ccdc:	00068413          	mv	s0,a3
    cce0:	a41ff06f          	j	c720 <__adddf3+0xe0>
    cce4:	00361613          	sll	a2,a2,0x3
    cce8:	00365613          	srl	a2,a2,0x3
    ccec:	00068413          	mv	s0,a3
    ccf0:	00088713          	mv	a4,a7
    ccf4:	e25ff06f          	j	cb18 <__adddf3+0x4d8>
    ccf8:	de0312e3          	bnez	t1,cadc <__adddf3+0x49c>
    ccfc:	1c080663          	beqz	a6,cec8 <__adddf3+0x888>
    cd00:	0038d713          	srl	a4,a7,0x3
    cd04:	00361613          	sll	a2,a2,0x3
    cd08:	01d89893          	sll	a7,a7,0x1d
    cd0c:	01176733          	or	a4,a4,a7
    cd10:	00365613          	srl	a2,a2,0x3
    cd14:	00c76733          	or	a4,a4,a2
    cd18:	00068413          	mv	s0,a3
    cd1c:	dddff06f          	j	caf8 <__adddf3+0x4b8>
    cd20:	01e58f33          	add	t5,a1,t5
    cd24:	011708b3          	add	a7,a4,a7
    cd28:	00bf35b3          	sltu	a1,t5,a1
    cd2c:	00b889b3          	add	s3,a7,a1
    cd30:	00899793          	sll	a5,s3,0x8
    cd34:	000f0493          	mv	s1,t5
    cd38:	0e07d463          	bgez	a5,ce20 <__adddf3+0x7e0>
    cd3c:	00200913          	li	s2,2
    cd40:	bd1ff06f          	j	c910 <__adddf3+0x2d0>
    cd44:	41e58f33          	sub	t5,a1,t5
    cd48:	411708b3          	sub	a7,a4,a7
    cd4c:	01e5b5b3          	sltu	a1,a1,t5
    cd50:	000f0493          	mv	s1,t5
    cd54:	40b889b3          	sub	s3,a7,a1
    cd58:	00100913          	li	s2,1
    cd5c:	9b1ff06f          	j	c70c <__adddf3+0xcc>
    cd60:	fe078693          	add	a3,a5,-32
    cd64:	02000613          	li	a2,32
    cd68:	00d8d6b3          	srl	a3,a7,a3
    cd6c:	00c78a63          	beq	a5,a2,cd80 <__adddf3+0x740>
    cd70:	04000613          	li	a2,64
    cd74:	40f607b3          	sub	a5,a2,a5
    cd78:	00f897b3          	sll	a5,a7,a5
    cd7c:	00ff6f33          	or	t5,t5,a5
    cd80:	01e039b3          	snez	s3,t5
    cd84:	00d9e9b3          	or	s3,s3,a3
    cd88:	b65ff06f          	j	c8ec <__adddf3+0x2ac>
    cd8c:	00351613          	sll	a2,a0,0x3
    cd90:	00365993          	srl	s3,a2,0x3
    cd94:	eb5ff06f          	j	cc48 <__adddf3+0x608>
    cd98:	00361613          	sll	a2,a2,0x3
    cd9c:	00365613          	srl	a2,a2,0x3
    cda0:	00068413          	mv	s0,a3
    cda4:	00088713          	mv	a4,a7
    cda8:	d41ff06f          	j	cae8 <__adddf3+0x4a8>
    cdac:	00361613          	sll	a2,a2,0x3
    cdb0:	00365613          	srl	a2,a2,0x3
    cdb4:	00088713          	mv	a4,a7
    cdb8:	d31ff06f          	j	cae8 <__adddf3+0x4a8>
    cdbc:	fe078513          	add	a0,a5,-32
    cdc0:	02000613          	li	a2,32
    cdc4:	00a75533          	srl	a0,a4,a0
    cdc8:	00c78a63          	beq	a5,a2,cddc <__adddf3+0x79c>
    cdcc:	04000613          	li	a2,64
    cdd0:	40f607b3          	sub	a5,a2,a5
    cdd4:	00f717b3          	sll	a5,a4,a5
    cdd8:	00f5e5b3          	or	a1,a1,a5
    cddc:	00b03633          	snez	a2,a1
    cde0:	00a66633          	or	a2,a2,a0
    cde4:	a8dff06f          	j	c870 <__adddf3+0x230>
    cde8:	fc0682e3          	beqz	a3,cdac <__adddf3+0x76c>
    cdec:	01e8ef33          	or	t5,a7,t5
    cdf0:	d00f16e3          	bnez	t5,cafc <__adddf3+0x4bc>
    cdf4:	cedff06f          	j	cae0 <__adddf3+0x4a0>
    cdf8:	dc0808e3          	beqz	a6,cbc8 <__adddf3+0x588>
    cdfc:	00361813          	sll	a6,a2,0x3
    ce00:	01d89793          	sll	a5,a7,0x1d
    ce04:	00385813          	srl	a6,a6,0x3
    ce08:	0038d713          	srl	a4,a7,0x3
    ce0c:	00f86833          	or	a6,a6,a5
    ce10:	01d77733          	and	a4,a4,t4
    ce14:	00068e13          	mv	t3,a3
    ce18:	00000793          	li	a5,0
    ce1c:	9bdff06f          	j	c7d8 <__adddf3+0x198>
    ce20:	00100793          	li	a5,1
    ce24:	c2dff06f          	j	ca50 <__adddf3+0x410>
    ce28:	40bf05b3          	sub	a1,t5,a1
    ce2c:	40e888b3          	sub	a7,a7,a4
    ce30:	00bf3733          	sltu	a4,t5,a1
    ce34:	00058493          	mv	s1,a1
    ce38:	40e889b3          	sub	s3,a7,a4
    ce3c:	00068413          	mv	s0,a3
    ce40:	00100913          	li	s2,1
    ce44:	8c9ff06f          	j	c70c <__adddf3+0xcc>
    ce48:	00361613          	sll	a2,a2,0x3
    ce4c:	00365613          	srl	a2,a2,0x3
    ce50:	00088713          	mv	a4,a7
    ce54:	cc5ff06f          	j	cb18 <__adddf3+0x4d8>
    ce58:	00361613          	sll	a2,a2,0x3
    ce5c:	00365993          	srl	s3,a2,0x3
    ce60:	00088713          	mv	a4,a7
    ce64:	de5ff06f          	j	cc48 <__adddf3+0x608>
    ce68:	fe078693          	add	a3,a5,-32
    ce6c:	02000613          	li	a2,32
    ce70:	00d756b3          	srl	a3,a4,a3
    ce74:	00c78a63          	beq	a5,a2,ce88 <__adddf3+0x848>
    ce78:	04000613          	li	a2,64
    ce7c:	40f607b3          	sub	a5,a2,a5
    ce80:	00f717b3          	sll	a5,a4,a5
    ce84:	00f5e5b3          	or	a1,a1,a5
    ce88:	00b039b3          	snez	s3,a1
    ce8c:	00d9e9b3          	or	s3,s3,a3
    ce90:	c35ff06f          	j	cac4 <__adddf3+0x484>
    ce94:	0034d613          	srl	a2,s1,0x3
    ce98:	00090793          	mv	a5,s2
    ce9c:	00098713          	mv	a4,s3
    cea0:	c79ff06f          	j	cb18 <__adddf3+0x4d8>
    cea4:	02000693          	li	a3,32
    cea8:	40f686b3          	sub	a3,a3,a5
    ceac:	00000613          	li	a2,0
    ceb0:	8b5ff06f          	j	c764 <__adddf3+0x124>
    ceb4:	00c9e833          	or	a6,s3,a2
    ceb8:	d00808e3          	beqz	a6,cbc8 <__adddf3+0x588>
    cebc:	0039d993          	srl	s3,s3,0x3
    cec0:	00060713          	mv	a4,a2
    cec4:	d85ff06f          	j	cc48 <__adddf3+0x608>
    cec8:	00000e13          	li	t3,0
    cecc:	7ff00793          	li	a5,2047
    ced0:	00080737          	lui	a4,0x80
    ced4:	905ff06f          	j	c7d8 <__adddf3+0x198>
    ced8:	01d71793          	sll	a5,a4,0x1d
    cedc:	00375713          	srl	a4,a4,0x3
    cee0:	0107e833          	or	a6,a5,a6
    cee4:	01d77733          	and	a4,a4,t4
    cee8:	00000793          	li	a5,0
    ceec:	8edff06f          	j	c7d8 <__adddf3+0x198>
    cef0:	01d71813          	sll	a6,a4,0x1d
    cef4:	0035d593          	srl	a1,a1,0x3
    cef8:	00b86833          	or	a6,a6,a1
    cefc:	00375713          	srl	a4,a4,0x3
    cf00:	00068413          	mv	s0,a3
    cf04:	c29ff06f          	j	cb2c <__adddf3+0x4ec>

0000cf08 <__divdf3>:
    cf08:	fb010113          	add	sp,sp,-80
    cf0c:	0145d793          	srl	a5,a1,0x14
    cf10:	04812423          	sw	s0,72(sp)
    cf14:	04912223          	sw	s1,68(sp)
    cf18:	05212023          	sw	s2,64(sp)
    cf1c:	03412c23          	sw	s4,56(sp)
    cf20:	03512a23          	sw	s5,52(sp)
    cf24:	00c59493          	sll	s1,a1,0xc
    cf28:	04112623          	sw	ra,76(sp)
    cf2c:	03312e23          	sw	s3,60(sp)
    cf30:	03612823          	sw	s6,48(sp)
    cf34:	03712623          	sw	s7,44(sp)
    cf38:	03812423          	sw	s8,40(sp)
    cf3c:	7ff7f793          	and	a5,a5,2047
    cf40:	00050413          	mv	s0,a0
    cf44:	00060a13          	mv	s4,a2
    cf48:	00068913          	mv	s2,a3
    cf4c:	00c4d493          	srl	s1,s1,0xc
    cf50:	01f5da93          	srl	s5,a1,0x1f
    cf54:	18078c63          	beqz	a5,d0ec <__divdf3+0x1e4>
    cf58:	7ff00713          	li	a4,2047
    cf5c:	08e78a63          	beq	a5,a4,cff0 <__divdf3+0xe8>
    cf60:	01d55b13          	srl	s6,a0,0x1d
    cf64:	00349493          	sll	s1,s1,0x3
    cf68:	009b64b3          	or	s1,s6,s1
    cf6c:	00800737          	lui	a4,0x800
    cf70:	00e4eb33          	or	s6,s1,a4
    cf74:	00351b93          	sll	s7,a0,0x3
    cf78:	c0178993          	add	s3,a5,-1023
    cf7c:	00000493          	li	s1,0
    cf80:	00000c13          	li	s8,0
    cf84:	01495793          	srl	a5,s2,0x14
    cf88:	00c91413          	sll	s0,s2,0xc
    cf8c:	7ff7f793          	and	a5,a5,2047
    cf90:	00c45413          	srl	s0,s0,0xc
    cf94:	01f95913          	srl	s2,s2,0x1f
    cf98:	08078463          	beqz	a5,d020 <__divdf3+0x118>
    cf9c:	7ff00713          	li	a4,2047
    cfa0:	18e78c63          	beq	a5,a4,d138 <__divdf3+0x230>
    cfa4:	00341413          	sll	s0,s0,0x3
    cfa8:	01da5713          	srl	a4,s4,0x1d
    cfac:	00876733          	or	a4,a4,s0
    cfb0:	c0178793          	add	a5,a5,-1023
    cfb4:	00800437          	lui	s0,0x800
    cfb8:	40f989b3          	sub	s3,s3,a5
    cfbc:	00876433          	or	s0,a4,s0
    cfc0:	003a1813          	sll	a6,s4,0x3
    cfc4:	00000793          	li	a5,0
    cfc8:	00f00713          	li	a4,15
    cfcc:	012aca33          	xor	s4,s5,s2
    cfd0:	24976663          	bltu	a4,s1,d21c <__divdf3+0x314>
    cfd4:	00003697          	auipc	a3,0x3
    cfd8:	ccc68693          	add	a3,a3,-820 # fca0 <__mprec_tens+0xc8>
    cfdc:	00249493          	sll	s1,s1,0x2
    cfe0:	00d484b3          	add	s1,s1,a3
    cfe4:	0004a703          	lw	a4,0(s1)
    cfe8:	00d70733          	add	a4,a4,a3
    cfec:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cff0:	00a4eb33          	or	s6,s1,a0
    cff4:	1c0b1e63          	bnez	s6,d1d0 <__divdf3+0x2c8>
    cff8:	01495793          	srl	a5,s2,0x14
    cffc:	00c91413          	sll	s0,s2,0xc
    d000:	7ff7f793          	and	a5,a5,2047
    d004:	00000b93          	li	s7,0
    d008:	00800493          	li	s1,8
    d00c:	7ff00993          	li	s3,2047
    d010:	00200c13          	li	s8,2
    d014:	00c45413          	srl	s0,s0,0xc
    d018:	01f95913          	srl	s2,s2,0x1f
    d01c:	f80790e3          	bnez	a5,cf9c <__divdf3+0x94>
    d020:	01446833          	or	a6,s0,s4
    d024:	1c080263          	beqz	a6,d1e8 <__divdf3+0x2e0>
    d028:	5c040663          	beqz	s0,d5f4 <__divdf3+0x6ec>
    d02c:	00040513          	mv	a0,s0
    d030:	250020ef          	jal	f280 <__clzsi2>
    d034:	00050793          	mv	a5,a0
    d038:	ff550693          	add	a3,a0,-11
    d03c:	01d00713          	li	a4,29
    d040:	ff878813          	add	a6,a5,-8
    d044:	40d70733          	sub	a4,a4,a3
    d048:	01041433          	sll	s0,s0,a6
    d04c:	00ea5733          	srl	a4,s4,a4
    d050:	00876433          	or	s0,a4,s0
    d054:	010a1833          	sll	a6,s4,a6
    d058:	013787b3          	add	a5,a5,s3
    d05c:	3f378993          	add	s3,a5,1011
    d060:	00000793          	li	a5,0
    d064:	f65ff06f          	j	cfc8 <__divdf3+0xc0>
    d068:	40f70733          	sub	a4,a4,a5
    d06c:	03800693          	li	a3,56
    d070:	60e6d063          	bge	a3,a4,d670 <__divdf3+0x768>
    d074:	00000793          	li	a5,0
    d078:	00000693          	li	a3,0
    d07c:	00000713          	li	a4,0
    d080:	04c12083          	lw	ra,76(sp)
    d084:	04812403          	lw	s0,72(sp)
    d088:	01479793          	sll	a5,a5,0x14
    d08c:	00d7e7b3          	or	a5,a5,a3
    d090:	01fa1693          	sll	a3,s4,0x1f
    d094:	00d7e7b3          	or	a5,a5,a3
    d098:	04412483          	lw	s1,68(sp)
    d09c:	04012903          	lw	s2,64(sp)
    d0a0:	03c12983          	lw	s3,60(sp)
    d0a4:	03812a03          	lw	s4,56(sp)
    d0a8:	03412a83          	lw	s5,52(sp)
    d0ac:	03012b03          	lw	s6,48(sp)
    d0b0:	02c12b83          	lw	s7,44(sp)
    d0b4:	02812c03          	lw	s8,40(sp)
    d0b8:	00070513          	mv	a0,a4
    d0bc:	00078593          	mv	a1,a5
    d0c0:	05010113          	add	sp,sp,80
    d0c4:	00008067          	ret
    d0c8:	7ff00793          	li	a5,2047
    d0cc:	00000693          	li	a3,0
    d0d0:	00000713          	li	a4,0
    d0d4:	fadff06f          	j	d080 <__divdf3+0x178>
    d0d8:	00000a13          	li	s4,0
    d0dc:	7ff00793          	li	a5,2047
    d0e0:	000806b7          	lui	a3,0x80
    d0e4:	00000713          	li	a4,0
    d0e8:	f99ff06f          	j	d080 <__divdf3+0x178>
    d0ec:	00a4eb33          	or	s6,s1,a0
    d0f0:	100b0c63          	beqz	s6,d208 <__divdf3+0x300>
    d0f4:	52048463          	beqz	s1,d61c <__divdf3+0x714>
    d0f8:	00048513          	mv	a0,s1
    d0fc:	184020ef          	jal	f280 <__clzsi2>
    d100:	00050713          	mv	a4,a0
    d104:	ff550793          	add	a5,a0,-11
    d108:	01d00b13          	li	s6,29
    d10c:	ff870b93          	add	s7,a4,-8
    d110:	40fb0b33          	sub	s6,s6,a5
    d114:	017494b3          	sll	s1,s1,s7
    d118:	01645b33          	srl	s6,s0,s6
    d11c:	009b6b33          	or	s6,s6,s1
    d120:	01741bb3          	sll	s7,s0,s7
    d124:	c0d00793          	li	a5,-1011
    d128:	40e789b3          	sub	s3,a5,a4
    d12c:	00000493          	li	s1,0
    d130:	00000c13          	li	s8,0
    d134:	e51ff06f          	j	cf84 <__divdf3+0x7c>
    d138:	01446833          	or	a6,s0,s4
    d13c:	80198993          	add	s3,s3,-2047
    d140:	0a081c63          	bnez	a6,d1f8 <__divdf3+0x2f0>
    d144:	0024e493          	or	s1,s1,2
    d148:	00000413          	li	s0,0
    d14c:	00200793          	li	a5,2
    d150:	e79ff06f          	j	cfc8 <__divdf3+0xc0>
    d154:	000a8913          	mv	s2,s5
    d158:	000b0413          	mv	s0,s6
    d15c:	000b8813          	mv	a6,s7
    d160:	00200793          	li	a5,2
    d164:	60fc0863          	beq	s8,a5,d774 <__divdf3+0x86c>
    d168:	00300793          	li	a5,3
    d16c:	f6fc06e3          	beq	s8,a5,d0d8 <__divdf3+0x1d0>
    d170:	00100793          	li	a5,1
    d174:	00090a13          	mv	s4,s2
    d178:	eefc0ee3          	beq	s8,a5,d074 <__divdf3+0x16c>
    d17c:	3ff98793          	add	a5,s3,1023
    d180:	3cf05263          	blez	a5,d544 <__divdf3+0x63c>
    d184:	00787713          	and	a4,a6,7
    d188:	5c071663          	bnez	a4,d754 <__divdf3+0x84c>
    d18c:	00741713          	sll	a4,s0,0x7
    d190:	00075a63          	bgez	a4,d1a4 <__divdf3+0x29c>
    d194:	ff0007b7          	lui	a5,0xff000
    d198:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d19c:	00f47433          	and	s0,s0,a5
    d1a0:	40098793          	add	a5,s3,1024
    d1a4:	7fe00713          	li	a4,2046
    d1a8:	f2f740e3          	blt	a4,a5,d0c8 <__divdf3+0x1c0>
    d1ac:	00385813          	srl	a6,a6,0x3
    d1b0:	01d41713          	sll	a4,s0,0x1d
    d1b4:	00941693          	sll	a3,s0,0x9
    d1b8:	01076733          	or	a4,a4,a6
    d1bc:	00c6d693          	srl	a3,a3,0xc
    d1c0:	7ff7f793          	and	a5,a5,2047
    d1c4:	ebdff06f          	j	d080 <__divdf3+0x178>
    d1c8:	00078c13          	mv	s8,a5
    d1cc:	f95ff06f          	j	d160 <__divdf3+0x258>
    d1d0:	00048b13          	mv	s6,s1
    d1d4:	00050b93          	mv	s7,a0
    d1d8:	00c00493          	li	s1,12
    d1dc:	7ff00993          	li	s3,2047
    d1e0:	00300c13          	li	s8,3
    d1e4:	da1ff06f          	j	cf84 <__divdf3+0x7c>
    d1e8:	0014e493          	or	s1,s1,1
    d1ec:	00000413          	li	s0,0
    d1f0:	00100793          	li	a5,1
    d1f4:	dd5ff06f          	j	cfc8 <__divdf3+0xc0>
    d1f8:	0034e493          	or	s1,s1,3
    d1fc:	000a0813          	mv	a6,s4
    d200:	00300793          	li	a5,3
    d204:	dc5ff06f          	j	cfc8 <__divdf3+0xc0>
    d208:	00000b93          	li	s7,0
    d20c:	00400493          	li	s1,4
    d210:	00000993          	li	s3,0
    d214:	00100c13          	li	s8,1
    d218:	d6dff06f          	j	cf84 <__divdf3+0x7c>
    d21c:	03912223          	sw	s9,36(sp)
    d220:	03a12023          	sw	s10,32(sp)
    d224:	01b12e23          	sw	s11,28(sp)
    d228:	3b646a63          	bltu	s0,s6,d5dc <__divdf3+0x6d4>
    d22c:	3a8b0663          	beq	s6,s0,d5d8 <__divdf3+0x6d0>
    d230:	fff98993          	add	s3,s3,-1
    d234:	000b8c13          	mv	s8,s7
    d238:	000b0493          	mv	s1,s6
    d23c:	00000d13          	li	s10,0
    d240:	01885c93          	srl	s9,a6,0x18
    d244:	00841413          	sll	s0,s0,0x8
    d248:	01045913          	srl	s2,s0,0x10
    d24c:	008cecb3          	or	s9,s9,s0
    d250:	00090593          	mv	a1,s2
    d254:	00048513          	mv	a0,s1
    d258:	010c9b13          	sll	s6,s9,0x10
    d25c:	00881a93          	sll	s5,a6,0x8
    d260:	010b5b13          	srl	s6,s6,0x10
    d264:	771010ef          	jal	f1d4 <__hidden___udivsi3>
    d268:	00050593          	mv	a1,a0
    d26c:	00050413          	mv	s0,a0
    d270:	000b0513          	mv	a0,s6
    d274:	69d010ef          	jal	f110 <__mulsi3>
    d278:	00050793          	mv	a5,a0
    d27c:	00090593          	mv	a1,s2
    d280:	00048513          	mv	a0,s1
    d284:	00078493          	mv	s1,a5
    d288:	795010ef          	jal	f21c <__umodsi3>
    d28c:	01051513          	sll	a0,a0,0x10
    d290:	010c5793          	srl	a5,s8,0x10
    d294:	00a7e7b3          	or	a5,a5,a0
    d298:	0097fa63          	bgeu	a5,s1,d2ac <__divdf3+0x3a4>
    d29c:	00fc87b3          	add	a5,s9,a5
    d2a0:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d2a4:	3b97fe63          	bgeu	a5,s9,d660 <__divdf3+0x758>
    d2a8:	00070413          	mv	s0,a4
    d2ac:	409784b3          	sub	s1,a5,s1
    d2b0:	00090593          	mv	a1,s2
    d2b4:	00048513          	mv	a0,s1
    d2b8:	71d010ef          	jal	f1d4 <__hidden___udivsi3>
    d2bc:	00050593          	mv	a1,a0
    d2c0:	00050b93          	mv	s7,a0
    d2c4:	000b0513          	mv	a0,s6
    d2c8:	649010ef          	jal	f110 <__mulsi3>
    d2cc:	00050793          	mv	a5,a0
    d2d0:	00090593          	mv	a1,s2
    d2d4:	00048513          	mv	a0,s1
    d2d8:	00078493          	mv	s1,a5
    d2dc:	741010ef          	jal	f21c <__umodsi3>
    d2e0:	010c1793          	sll	a5,s8,0x10
    d2e4:	01051513          	sll	a0,a0,0x10
    d2e8:	0107d793          	srl	a5,a5,0x10
    d2ec:	00a7e7b3          	or	a5,a5,a0
    d2f0:	0097fa63          	bgeu	a5,s1,d304 <__divdf3+0x3fc>
    d2f4:	00fc87b3          	add	a5,s9,a5
    d2f8:	fffb8713          	add	a4,s7,-1
    d2fc:	3597fa63          	bgeu	a5,s9,d650 <__divdf3+0x748>
    d300:	00070b93          	mv	s7,a4
    d304:	00010337          	lui	t1,0x10
    d308:	01041413          	sll	s0,s0,0x10
    d30c:	01746433          	or	s0,s0,s7
    d310:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    d314:	01b478b3          	and	a7,s0,s11
    d318:	01bafdb3          	and	s11,s5,s11
    d31c:	40978bb3          	sub	s7,a5,s1
    d320:	010adc13          	srl	s8,s5,0x10
    d324:	01045793          	srl	a5,s0,0x10
    d328:	00088513          	mv	a0,a7
    d32c:	000d8593          	mv	a1,s11
    d330:	5e1010ef          	jal	f110 <__mulsi3>
    d334:	00050813          	mv	a6,a0
    d338:	000c0593          	mv	a1,s8
    d33c:	00088513          	mv	a0,a7
    d340:	5d1010ef          	jal	f110 <__mulsi3>
    d344:	00050893          	mv	a7,a0
    d348:	000d8593          	mv	a1,s11
    d34c:	00078513          	mv	a0,a5
    d350:	5c1010ef          	jal	f110 <__mulsi3>
    d354:	00050e13          	mv	t3,a0
    d358:	000c0593          	mv	a1,s8
    d35c:	00078513          	mv	a0,a5
    d360:	5b1010ef          	jal	f110 <__mulsi3>
    d364:	01085793          	srl	a5,a6,0x10
    d368:	01c888b3          	add	a7,a7,t3
    d36c:	011787b3          	add	a5,a5,a7
    d370:	01c7f463          	bgeu	a5,t3,d378 <__divdf3+0x470>
    d374:	00650533          	add	a0,a0,t1
    d378:	00010637          	lui	a2,0x10
    d37c:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    d380:	00c7f4b3          	and	s1,a5,a2
    d384:	0107d693          	srl	a3,a5,0x10
    d388:	01049493          	sll	s1,s1,0x10
    d38c:	00c87833          	and	a6,a6,a2
    d390:	00a687b3          	add	a5,a3,a0
    d394:	010484b3          	add	s1,s1,a6
    d398:	20fbea63          	bltu	s7,a5,d5ac <__divdf3+0x6a4>
    d39c:	20fb8663          	beq	s7,a5,d5a8 <__divdf3+0x6a0>
    d3a0:	409d04b3          	sub	s1,s10,s1
    d3a4:	40fb8bb3          	sub	s7,s7,a5
    d3a8:	009d3d33          	sltu	s10,s10,s1
    d3ac:	41ab8bb3          	sub	s7,s7,s10
    d3b0:	377c8a63          	beq	s9,s7,d724 <__divdf3+0x81c>
    d3b4:	00090593          	mv	a1,s2
    d3b8:	000b8513          	mv	a0,s7
    d3bc:	619010ef          	jal	f1d4 <__hidden___udivsi3>
    d3c0:	00050593          	mv	a1,a0
    d3c4:	00a12623          	sw	a0,12(sp)
    d3c8:	00050d13          	mv	s10,a0
    d3cc:	000b0513          	mv	a0,s6
    d3d0:	541010ef          	jal	f110 <__mulsi3>
    d3d4:	00050793          	mv	a5,a0
    d3d8:	00090593          	mv	a1,s2
    d3dc:	000b8513          	mv	a0,s7
    d3e0:	00078b93          	mv	s7,a5
    d3e4:	639010ef          	jal	f21c <__umodsi3>
    d3e8:	01051513          	sll	a0,a0,0x10
    d3ec:	0104d793          	srl	a5,s1,0x10
    d3f0:	00a7e7b3          	or	a5,a5,a0
    d3f4:	0377f063          	bgeu	a5,s7,d414 <__divdf3+0x50c>
    d3f8:	00fc87b3          	add	a5,s9,a5
    d3fc:	fffd0693          	add	a3,s10,-1
    d400:	3797e263          	bltu	a5,s9,d764 <__divdf3+0x85c>
    d404:	3777f063          	bgeu	a5,s7,d764 <__divdf3+0x85c>
    d408:	ffed0713          	add	a4,s10,-2
    d40c:	00e12623          	sw	a4,12(sp)
    d410:	019787b3          	add	a5,a5,s9
    d414:	41778bb3          	sub	s7,a5,s7
    d418:	00090593          	mv	a1,s2
    d41c:	000b8513          	mv	a0,s7
    d420:	5b5010ef          	jal	f1d4 <__hidden___udivsi3>
    d424:	00050593          	mv	a1,a0
    d428:	00050d13          	mv	s10,a0
    d42c:	000b0513          	mv	a0,s6
    d430:	4e1010ef          	jal	f110 <__mulsi3>
    d434:	00050793          	mv	a5,a0
    d438:	00090593          	mv	a1,s2
    d43c:	000b8513          	mv	a0,s7
    d440:	00078913          	mv	s2,a5
    d444:	01049493          	sll	s1,s1,0x10
    d448:	5d5010ef          	jal	f21c <__umodsi3>
    d44c:	01051513          	sll	a0,a0,0x10
    d450:	0104d493          	srl	s1,s1,0x10
    d454:	00a4e4b3          	or	s1,s1,a0
    d458:	0124fe63          	bgeu	s1,s2,d474 <__divdf3+0x56c>
    d45c:	009c84b3          	add	s1,s9,s1
    d460:	fffd0793          	add	a5,s10,-1
    d464:	3194e463          	bltu	s1,s9,d76c <__divdf3+0x864>
    d468:	3124f263          	bgeu	s1,s2,d76c <__divdf3+0x864>
    d46c:	ffed0d13          	add	s10,s10,-2
    d470:	019484b3          	add	s1,s1,s9
    d474:	00c12783          	lw	a5,12(sp)
    d478:	412484b3          	sub	s1,s1,s2
    d47c:	000d8593          	mv	a1,s11
    d480:	01079813          	sll	a6,a5,0x10
    d484:	01a86833          	or	a6,a6,s10
    d488:	01081313          	sll	t1,a6,0x10
    d48c:	01035313          	srl	t1,t1,0x10
    d490:	01085793          	srl	a5,a6,0x10
    d494:	00030513          	mv	a0,t1
    d498:	479010ef          	jal	f110 <__mulsi3>
    d49c:	00050893          	mv	a7,a0
    d4a0:	000c0593          	mv	a1,s8
    d4a4:	00030513          	mv	a0,t1
    d4a8:	469010ef          	jal	f110 <__mulsi3>
    d4ac:	00050313          	mv	t1,a0
    d4b0:	000d8593          	mv	a1,s11
    d4b4:	00078513          	mv	a0,a5
    d4b8:	459010ef          	jal	f110 <__mulsi3>
    d4bc:	00050e13          	mv	t3,a0
    d4c0:	000c0593          	mv	a1,s8
    d4c4:	00078513          	mv	a0,a5
    d4c8:	449010ef          	jal	f110 <__mulsi3>
    d4cc:	0108d793          	srl	a5,a7,0x10
    d4d0:	01c30333          	add	t1,t1,t3
    d4d4:	006787b3          	add	a5,a5,t1
    d4d8:	01c7f663          	bgeu	a5,t3,d4e4 <__divdf3+0x5dc>
    d4dc:	00010737          	lui	a4,0x10
    d4e0:	00e50533          	add	a0,a0,a4
    d4e4:	000106b7          	lui	a3,0x10
    d4e8:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    d4ec:	0107d713          	srl	a4,a5,0x10
    d4f0:	00d7f7b3          	and	a5,a5,a3
    d4f4:	01079793          	sll	a5,a5,0x10
    d4f8:	00d8f8b3          	and	a7,a7,a3
    d4fc:	00a70733          	add	a4,a4,a0
    d500:	011787b3          	add	a5,a5,a7
    d504:	02e4e063          	bltu	s1,a4,d524 <__divdf3+0x61c>
    d508:	00e48c63          	beq	s1,a4,d520 <__divdf3+0x618>
    d50c:	02412c83          	lw	s9,36(sp)
    d510:	02012d03          	lw	s10,32(sp)
    d514:	01c12d83          	lw	s11,28(sp)
    d518:	00186813          	or	a6,a6,1
    d51c:	c61ff06f          	j	d17c <__divdf3+0x274>
    d520:	1c078a63          	beqz	a5,d6f4 <__divdf3+0x7ec>
    d524:	009c84b3          	add	s1,s9,s1
    d528:	fff80613          	add	a2,a6,-1
    d52c:	00048693          	mv	a3,s1
    d530:	1b94ec63          	bltu	s1,s9,d6e8 <__divdf3+0x7e0>
    d534:	24e4ea63          	bltu	s1,a4,d788 <__divdf3+0x880>
    d538:	26e48863          	beq	s1,a4,d7a8 <__divdf3+0x8a0>
    d53c:	00060813          	mv	a6,a2
    d540:	fcdff06f          	j	d50c <__divdf3+0x604>
    d544:	00100713          	li	a4,1
    d548:	b20790e3          	bnez	a5,d068 <__divdf3+0x160>
    d54c:	41e98793          	add	a5,s3,1054
    d550:	00f816b3          	sll	a3,a6,a5
    d554:	00d036b3          	snez	a3,a3
    d558:	00f417b3          	sll	a5,s0,a5
    d55c:	00f6e7b3          	or	a5,a3,a5
    d560:	00e85833          	srl	a6,a6,a4
    d564:	00f86833          	or	a6,a6,a5
    d568:	00787793          	and	a5,a6,7
    d56c:	00e45433          	srl	s0,s0,a4
    d570:	02078063          	beqz	a5,d590 <__divdf3+0x688>
    d574:	00f87793          	and	a5,a6,15
    d578:	00400713          	li	a4,4
    d57c:	00e78a63          	beq	a5,a4,d590 <__divdf3+0x688>
    d580:	00480793          	add	a5,a6,4
    d584:	0107b833          	sltu	a6,a5,a6
    d588:	01040433          	add	s0,s0,a6
    d58c:	00078813          	mv	a6,a5
    d590:	00841613          	sll	a2,s0,0x8
    d594:	00100793          	li	a5,1
    d598:	00000693          	li	a3,0
    d59c:	00000713          	li	a4,0
    d5a0:	ae0640e3          	bltz	a2,d080 <__divdf3+0x178>
    d5a4:	1280006f          	j	d6cc <__divdf3+0x7c4>
    d5a8:	de9d7ce3          	bgeu	s10,s1,d3a0 <__divdf3+0x498>
    d5ac:	015d06b3          	add	a3,s10,s5
    d5b0:	01a6b633          	sltu	a2,a3,s10
    d5b4:	019605b3          	add	a1,a2,s9
    d5b8:	00bb8bb3          	add	s7,s7,a1
    d5bc:	00068d13          	mv	s10,a3
    d5c0:	fff40593          	add	a1,s0,-1
    d5c4:	077cfe63          	bgeu	s9,s7,d640 <__divdf3+0x738>
    d5c8:	14fbe063          	bltu	s7,a5,d708 <__divdf3+0x800>
    d5cc:	13778c63          	beq	a5,s7,d704 <__divdf3+0x7fc>
    d5d0:	00058413          	mv	s0,a1
    d5d4:	dcdff06f          	j	d3a0 <__divdf3+0x498>
    d5d8:	c50bece3          	bltu	s7,a6,d230 <__divdf3+0x328>
    d5dc:	01fb1c13          	sll	s8,s6,0x1f
    d5e0:	001bd713          	srl	a4,s7,0x1
    d5e4:	001b5493          	srl	s1,s6,0x1
    d5e8:	00ec6c33          	or	s8,s8,a4
    d5ec:	01fb9d13          	sll	s10,s7,0x1f
    d5f0:	c51ff06f          	j	d240 <__divdf3+0x338>
    d5f4:	000a0513          	mv	a0,s4
    d5f8:	489010ef          	jal	f280 <__clzsi2>
    d5fc:	01550693          	add	a3,a0,21
    d600:	01c00713          	li	a4,28
    d604:	02050793          	add	a5,a0,32
    d608:	a2d75ae3          	bge	a4,a3,d03c <__divdf3+0x134>
    d60c:	ff850513          	add	a0,a0,-8
    d610:	00000813          	li	a6,0
    d614:	00aa1433          	sll	s0,s4,a0
    d618:	a41ff06f          	j	d058 <__divdf3+0x150>
    d61c:	465010ef          	jal	f280 <__clzsi2>
    d620:	01550793          	add	a5,a0,21
    d624:	01c00693          	li	a3,28
    d628:	02050713          	add	a4,a0,32
    d62c:	acf6dee3          	bge	a3,a5,d108 <__divdf3+0x200>
    d630:	ff850493          	add	s1,a0,-8
    d634:	00941b33          	sll	s6,s0,s1
    d638:	00000b93          	li	s7,0
    d63c:	ae9ff06f          	j	d124 <__divdf3+0x21c>
    d640:	f97c98e3          	bne	s9,s7,d5d0 <__divdf3+0x6c8>
    d644:	f80602e3          	beqz	a2,d5c8 <__divdf3+0x6c0>
    d648:	00058413          	mv	s0,a1
    d64c:	d55ff06f          	j	d3a0 <__divdf3+0x498>
    d650:	ca97f8e3          	bgeu	a5,s1,d300 <__divdf3+0x3f8>
    d654:	ffeb8b93          	add	s7,s7,-2
    d658:	019787b3          	add	a5,a5,s9
    d65c:	ca9ff06f          	j	d304 <__divdf3+0x3fc>
    d660:	c497f4e3          	bgeu	a5,s1,d2a8 <__divdf3+0x3a0>
    d664:	ffe40413          	add	s0,s0,-2
    d668:	019787b3          	add	a5,a5,s9
    d66c:	c41ff06f          	j	d2ac <__divdf3+0x3a4>
    d670:	01f00693          	li	a3,31
    d674:	ece6dce3          	bge	a3,a4,d54c <__divdf3+0x644>
    d678:	fe100693          	li	a3,-31
    d67c:	40f686b3          	sub	a3,a3,a5
    d680:	02000793          	li	a5,32
    d684:	00d456b3          	srl	a3,s0,a3
    d688:	00f70863          	beq	a4,a5,d698 <__divdf3+0x790>
    d68c:	43e98793          	add	a5,s3,1086
    d690:	00f417b3          	sll	a5,s0,a5
    d694:	00f86833          	or	a6,a6,a5
    d698:	01003833          	snez	a6,a6
    d69c:	00d86833          	or	a6,a6,a3
    d6a0:	00787713          	and	a4,a6,7
    d6a4:	00000693          	li	a3,0
    d6a8:	02070863          	beqz	a4,d6d8 <__divdf3+0x7d0>
    d6ac:	00f87793          	and	a5,a6,15
    d6b0:	00400713          	li	a4,4
    d6b4:	00000413          	li	s0,0
    d6b8:	00e78a63          	beq	a5,a4,d6cc <__divdf3+0x7c4>
    d6bc:	00480793          	add	a5,a6,4
    d6c0:	0107b833          	sltu	a6,a5,a6
    d6c4:	01003433          	snez	s0,a6
    d6c8:	00078813          	mv	a6,a5
    d6cc:	00941693          	sll	a3,s0,0x9
    d6d0:	01d41713          	sll	a4,s0,0x1d
    d6d4:	00c6d693          	srl	a3,a3,0xc
    d6d8:	00385813          	srl	a6,a6,0x3
    d6dc:	00e86733          	or	a4,a6,a4
    d6e0:	00000793          	li	a5,0
    d6e4:	99dff06f          	j	d080 <__divdf3+0x178>
    d6e8:	00060813          	mv	a6,a2
    d6ec:	e2e690e3          	bne	a3,a4,d50c <__divdf3+0x604>
    d6f0:	e1579ee3          	bne	a5,s5,d50c <__divdf3+0x604>
    d6f4:	02412c83          	lw	s9,36(sp)
    d6f8:	02012d03          	lw	s10,32(sp)
    d6fc:	01c12d83          	lw	s11,28(sp)
    d700:	a7dff06f          	j	d17c <__divdf3+0x274>
    d704:	ec96f6e3          	bgeu	a3,s1,d5d0 <__divdf3+0x6c8>
    d708:	00da86b3          	add	a3,s5,a3
    d70c:	0156b633          	sltu	a2,a3,s5
    d710:	01960633          	add	a2,a2,s9
    d714:	ffe40413          	add	s0,s0,-2
    d718:	00068d13          	mv	s10,a3
    d71c:	00cb8bb3          	add	s7,s7,a2
    d720:	c81ff06f          	j	d3a0 <__divdf3+0x498>
    d724:	c0200713          	li	a4,-1022
    d728:	02412c83          	lw	s9,36(sp)
    d72c:	02012d03          	lw	s10,32(sp)
    d730:	01c12d83          	lw	s11,28(sp)
    d734:	3ff98793          	add	a5,s3,1023
    d738:	fff00813          	li	a6,-1
    d73c:	e0e9c4e3          	blt	s3,a4,d544 <__divdf3+0x63c>
    d740:	00480713          	add	a4,a6,4
    d744:	01073833          	sltu	a6,a4,a6
    d748:	01040433          	add	s0,s0,a6
    d74c:	00070813          	mv	a6,a4
    d750:	a3dff06f          	j	d18c <__divdf3+0x284>
    d754:	00f87713          	and	a4,a6,15
    d758:	00400693          	li	a3,4
    d75c:	a2d708e3          	beq	a4,a3,d18c <__divdf3+0x284>
    d760:	fe1ff06f          	j	d740 <__divdf3+0x838>
    d764:	00d12623          	sw	a3,12(sp)
    d768:	cadff06f          	j	d414 <__divdf3+0x50c>
    d76c:	00078d13          	mv	s10,a5
    d770:	d05ff06f          	j	d474 <__divdf3+0x56c>
    d774:	00090a13          	mv	s4,s2
    d778:	7ff00793          	li	a5,2047
    d77c:	00000693          	li	a3,0
    d780:	00000713          	li	a4,0
    d784:	8fdff06f          	j	d080 <__divdf3+0x178>
    d788:	001a9613          	sll	a2,s5,0x1
    d78c:	015636b3          	sltu	a3,a2,s5
    d790:	019686b3          	add	a3,a3,s9
    d794:	00d486b3          	add	a3,s1,a3
    d798:	ffe80813          	add	a6,a6,-2
    d79c:	00060a93          	mv	s5,a2
    d7a0:	f4e688e3          	beq	a3,a4,d6f0 <__divdf3+0x7e8>
    d7a4:	d69ff06f          	j	d50c <__divdf3+0x604>
    d7a8:	fefae0e3          	bltu	s5,a5,d788 <__divdf3+0x880>
    d7ac:	00060813          	mv	a6,a2
    d7b0:	f41ff06f          	j	d6f0 <__divdf3+0x7e8>

0000d7b4 <__eqdf2>:
    d7b4:	0145d713          	srl	a4,a1,0x14
    d7b8:	001007b7          	lui	a5,0x100
    d7bc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d7c0:	0146d813          	srl	a6,a3,0x14
    d7c4:	7ff77713          	and	a4,a4,2047
    d7c8:	7ff00313          	li	t1,2047
    d7cc:	00b7fe33          	and	t3,a5,a1
    d7d0:	00050893          	mv	a7,a0
    d7d4:	00d7f7b3          	and	a5,a5,a3
    d7d8:	01f5d593          	srl	a1,a1,0x1f
    d7dc:	7ff87813          	and	a6,a6,2047
    d7e0:	01f6d693          	srl	a3,a3,0x1f
    d7e4:	00100513          	li	a0,1
    d7e8:	00670c63          	beq	a4,t1,d800 <__eqdf2+0x4c>
    d7ec:	00680863          	beq	a6,t1,d7fc <__eqdf2+0x48>
    d7f0:	01071463          	bne	a4,a6,d7f8 <__eqdf2+0x44>
    d7f4:	02fe0663          	beq	t3,a5,d820 <__eqdf2+0x6c>
    d7f8:	00008067          	ret
    d7fc:	00008067          	ret
    d800:	fee81ce3          	bne	a6,a4,d7f8 <__eqdf2+0x44>
    d804:	00fe67b3          	or	a5,t3,a5
    d808:	00c7e7b3          	or	a5,a5,a2
    d80c:	0117e7b3          	or	a5,a5,a7
    d810:	fe0794e3          	bnez	a5,d7f8 <__eqdf2+0x44>
    d814:	40d585b3          	sub	a1,a1,a3
    d818:	00b03533          	snez	a0,a1
    d81c:	00008067          	ret
    d820:	fcc89ce3          	bne	a7,a2,d7f8 <__eqdf2+0x44>
    d824:	00d58a63          	beq	a1,a3,d838 <__eqdf2+0x84>
    d828:	fc0718e3          	bnez	a4,d7f8 <__eqdf2+0x44>
    d82c:	011e6e33          	or	t3,t3,a7
    d830:	01c03533          	snez	a0,t3
    d834:	00008067          	ret
    d838:	00000513          	li	a0,0
    d83c:	00008067          	ret

0000d840 <__gedf2>:
    d840:	0145d893          	srl	a7,a1,0x14
    d844:	001007b7          	lui	a5,0x100
    d848:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d84c:	0146d713          	srl	a4,a3,0x14
    d850:	7ff8f893          	and	a7,a7,2047
    d854:	7ff00e13          	li	t3,2047
    d858:	00b7f333          	and	t1,a5,a1
    d85c:	00050813          	mv	a6,a0
    d860:	00050e93          	mv	t4,a0
    d864:	00d7f7b3          	and	a5,a5,a3
    d868:	01f5d593          	srl	a1,a1,0x1f
    d86c:	00060f13          	mv	t5,a2
    d870:	7ff77513          	and	a0,a4,2047
    d874:	01f6d693          	srl	a3,a3,0x1f
    d878:	05c88863          	beq	a7,t3,d8c8 <__gedf2+0x88>
    d87c:	03c50463          	beq	a0,t3,d8a4 <__gedf2+0x64>
    d880:	06089a63          	bnez	a7,d8f4 <__gedf2+0xb4>
    d884:	01036833          	or	a6,t1,a6
    d888:	06051063          	bnez	a0,d8e8 <__gedf2+0xa8>
    d88c:	00c7e633          	or	a2,a5,a2
    d890:	08060c63          	beqz	a2,d928 <__gedf2+0xe8>
    d894:	0a081263          	bnez	a6,d938 <__gedf2+0xf8>
    d898:	00100513          	li	a0,1
    d89c:	08068263          	beqz	a3,d920 <__gedf2+0xe0>
    d8a0:	00008067          	ret
    d8a4:	00c7e633          	or	a2,a5,a2
    d8a8:	08061463          	bnez	a2,d930 <__gedf2+0xf0>
    d8ac:	00089663          	bnez	a7,d8b8 <__gedf2+0x78>
    d8b0:	01036333          	or	t1,t1,a6
    d8b4:	fe0302e3          	beqz	t1,d898 <__gedf2+0x58>
    d8b8:	06d58063          	beq	a1,a3,d918 <__gedf2+0xd8>
    d8bc:	06059263          	bnez	a1,d920 <__gedf2+0xe0>
    d8c0:	00100513          	li	a0,1
    d8c4:	00008067          	ret
    d8c8:	01036333          	or	t1,t1,a6
    d8cc:	06031263          	bnez	t1,d930 <__gedf2+0xf0>
    d8d0:	ff1516e3          	bne	a0,a7,d8bc <__gedf2+0x7c>
    d8d4:	00c7e7b3          	or	a5,a5,a2
    d8d8:	04079c63          	bnez	a5,d930 <__gedf2+0xf0>
    d8dc:	fed590e3          	bne	a1,a3,d8bc <__gedf2+0x7c>
    d8e0:	00000513          	li	a0,0
    d8e4:	00008067          	ret
    d8e8:	fa0808e3          	beqz	a6,d898 <__gedf2+0x58>
    d8ec:	fcd598e3          	bne	a1,a3,d8bc <__gedf2+0x7c>
    d8f0:	0280006f          	j	d918 <__gedf2+0xd8>
    d8f4:	fc0504e3          	beqz	a0,d8bc <__gedf2+0x7c>
    d8f8:	fcd592e3          	bne	a1,a3,d8bc <__gedf2+0x7c>
    d8fc:	fd1540e3          	blt	a0,a7,d8bc <__gedf2+0x7c>
    d900:	00a8cc63          	blt	a7,a0,d918 <__gedf2+0xd8>
    d904:	fa67ece3          	bltu	a5,t1,d8bc <__gedf2+0x7c>
    d908:	00f31863          	bne	t1,a5,d918 <__gedf2+0xd8>
    d90c:	fbdf68e3          	bltu	t5,t4,d8bc <__gedf2+0x7c>
    d910:	00000513          	li	a0,0
    d914:	f9eef6e3          	bgeu	t4,t5,d8a0 <__gedf2+0x60>
    d918:	00100513          	li	a0,1
    d91c:	f80592e3          	bnez	a1,d8a0 <__gedf2+0x60>
    d920:	fff00513          	li	a0,-1
    d924:	00008067          	ret
    d928:	f8081ae3          	bnez	a6,d8bc <__gedf2+0x7c>
    d92c:	00008067          	ret
    d930:	ffe00513          	li	a0,-2
    d934:	00008067          	ret
    d938:	fcd586e3          	beq	a1,a3,d904 <__gedf2+0xc4>
    d93c:	f81ff06f          	j	d8bc <__gedf2+0x7c>

0000d940 <__ledf2>:
    d940:	0145d893          	srl	a7,a1,0x14
    d944:	001007b7          	lui	a5,0x100
    d948:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d94c:	0146d713          	srl	a4,a3,0x14
    d950:	7ff8f893          	and	a7,a7,2047
    d954:	7ff00313          	li	t1,2047
    d958:	00b7fe33          	and	t3,a5,a1
    d95c:	00050813          	mv	a6,a0
    d960:	00050e93          	mv	t4,a0
    d964:	00d7f7b3          	and	a5,a5,a3
    d968:	01f5d593          	srl	a1,a1,0x1f
    d96c:	00060f13          	mv	t5,a2
    d970:	7ff77513          	and	a0,a4,2047
    d974:	01f6d693          	srl	a3,a3,0x1f
    d978:	04688a63          	beq	a7,t1,d9cc <__ledf2+0x8c>
    d97c:	02650463          	beq	a0,t1,d9a4 <__ledf2+0x64>
    d980:	06089863          	bnez	a7,d9f0 <__ledf2+0xb0>
    d984:	010e6833          	or	a6,t3,a6
    d988:	08051e63          	bnez	a0,da24 <__ledf2+0xe4>
    d98c:	00c7e633          	or	a2,a5,a2
    d990:	0a060463          	beqz	a2,da38 <__ledf2+0xf8>
    d994:	0a081663          	bnez	a6,da40 <__ledf2+0x100>
    d998:	00100513          	li	a0,1
    d99c:	08068063          	beqz	a3,da1c <__ledf2+0xdc>
    d9a0:	00008067          	ret
    d9a4:	00c7e633          	or	a2,a5,a2
    d9a8:	00200513          	li	a0,2
    d9ac:	fe061ae3          	bnez	a2,d9a0 <__ledf2+0x60>
    d9b0:	00089663          	bnez	a7,d9bc <__ledf2+0x7c>
    d9b4:	010e6e33          	or	t3,t3,a6
    d9b8:	fe0e00e3          	beqz	t3,d998 <__ledf2+0x58>
    d9bc:	04d58c63          	beq	a1,a3,da14 <__ledf2+0xd4>
    d9c0:	04059e63          	bnez	a1,da1c <__ledf2+0xdc>
    d9c4:	00100513          	li	a0,1
    d9c8:	00008067          	ret
    d9cc:	010e6e33          	or	t3,t3,a6
    d9d0:	060e1063          	bnez	t3,da30 <__ledf2+0xf0>
    d9d4:	ff1516e3          	bne	a0,a7,d9c0 <__ledf2+0x80>
    d9d8:	00c7e7b3          	or	a5,a5,a2
    d9dc:	00200513          	li	a0,2
    d9e0:	fc0790e3          	bnez	a5,d9a0 <__ledf2+0x60>
    d9e4:	fcd59ee3          	bne	a1,a3,d9c0 <__ledf2+0x80>
    d9e8:	00000513          	li	a0,0
    d9ec:	00008067          	ret
    d9f0:	fc0508e3          	beqz	a0,d9c0 <__ledf2+0x80>
    d9f4:	fcd596e3          	bne	a1,a3,d9c0 <__ledf2+0x80>
    d9f8:	fd1544e3          	blt	a0,a7,d9c0 <__ledf2+0x80>
    d9fc:	00a8cc63          	blt	a7,a0,da14 <__ledf2+0xd4>
    da00:	fdc7e0e3          	bltu	a5,t3,d9c0 <__ledf2+0x80>
    da04:	00fe1863          	bne	t3,a5,da14 <__ledf2+0xd4>
    da08:	fbdf6ce3          	bltu	t5,t4,d9c0 <__ledf2+0x80>
    da0c:	00000513          	li	a0,0
    da10:	f9eef8e3          	bgeu	t4,t5,d9a0 <__ledf2+0x60>
    da14:	00100513          	li	a0,1
    da18:	f80594e3          	bnez	a1,d9a0 <__ledf2+0x60>
    da1c:	fff00513          	li	a0,-1
    da20:	00008067          	ret
    da24:	f6080ae3          	beqz	a6,d998 <__ledf2+0x58>
    da28:	f8d59ce3          	bne	a1,a3,d9c0 <__ledf2+0x80>
    da2c:	fe9ff06f          	j	da14 <__ledf2+0xd4>
    da30:	00200513          	li	a0,2
    da34:	00008067          	ret
    da38:	f80814e3          	bnez	a6,d9c0 <__ledf2+0x80>
    da3c:	00008067          	ret
    da40:	fcd580e3          	beq	a1,a3,da00 <__ledf2+0xc0>
    da44:	f7dff06f          	j	d9c0 <__ledf2+0x80>

0000da48 <__muldf3>:
    da48:	fd010113          	add	sp,sp,-48
    da4c:	0145d793          	srl	a5,a1,0x14
    da50:	02812423          	sw	s0,40(sp)
    da54:	02912223          	sw	s1,36(sp)
    da58:	03212023          	sw	s2,32(sp)
    da5c:	01312e23          	sw	s3,28(sp)
    da60:	01512a23          	sw	s5,20(sp)
    da64:	00c59493          	sll	s1,a1,0xc
    da68:	02112623          	sw	ra,44(sp)
    da6c:	01412c23          	sw	s4,24(sp)
    da70:	01612823          	sw	s6,16(sp)
    da74:	01712623          	sw	s7,12(sp)
    da78:	01812423          	sw	s8,8(sp)
    da7c:	7ff7f793          	and	a5,a5,2047
    da80:	00050413          	mv	s0,a0
    da84:	00060a93          	mv	s5,a2
    da88:	00068993          	mv	s3,a3
    da8c:	00c4d493          	srl	s1,s1,0xc
    da90:	01f5d913          	srl	s2,a1,0x1f
    da94:	4e078063          	beqz	a5,df74 <__muldf3+0x52c>
    da98:	7ff00713          	li	a4,2047
    da9c:	0ae78663          	beq	a5,a4,db48 <__muldf3+0x100>
    daa0:	00349693          	sll	a3,s1,0x3
    daa4:	01d55713          	srl	a4,a0,0x1d
    daa8:	00d76733          	or	a4,a4,a3
    daac:	008006b7          	lui	a3,0x800
    dab0:	00d764b3          	or	s1,a4,a3
    dab4:	00351a13          	sll	s4,a0,0x3
    dab8:	c0178c13          	add	s8,a5,-1023
    dabc:	00000b13          	li	s6,0
    dac0:	00000b93          	li	s7,0
    dac4:	0149d793          	srl	a5,s3,0x14
    dac8:	00c99713          	sll	a4,s3,0xc
    dacc:	7ff7f793          	and	a5,a5,2047
    dad0:	000a8e13          	mv	t3,s5
    dad4:	00c75413          	srl	s0,a4,0xc
    dad8:	01f9d993          	srl	s3,s3,0x1f
    dadc:	0a078063          	beqz	a5,db7c <__muldf3+0x134>
    dae0:	7ff00713          	li	a4,2047
    dae4:	14e78e63          	beq	a5,a4,dc40 <__muldf3+0x1f8>
    dae8:	00341713          	sll	a4,s0,0x3
    daec:	01dad693          	srl	a3,s5,0x1d
    daf0:	00e6e6b3          	or	a3,a3,a4
    daf4:	c0178793          	add	a5,a5,-1023
    daf8:	00800737          	lui	a4,0x800
    dafc:	00e6e433          	or	s0,a3,a4
    db00:	003a9e13          	sll	t3,s5,0x3
    db04:	01878333          	add	t1,a5,s8
    db08:	00000693          	li	a3,0
    db0c:	00a00793          	li	a5,10
    db10:	00130893          	add	a7,t1,1
    db14:	0b67cc63          	blt	a5,s6,dbcc <__muldf3+0x184>
    db18:	013945b3          	xor	a1,s2,s3
    db1c:	00200793          	li	a5,2
    db20:	00058813          	mv	a6,a1
    db24:	1567c663          	blt	a5,s6,dc70 <__muldf3+0x228>
    db28:	fffb0b13          	add	s6,s6,-1
    db2c:	00100713          	li	a4,1
    db30:	17676063          	bltu	a4,s6,dc90 <__muldf3+0x248>
    db34:	48f68663          	beq	a3,a5,dfc0 <__muldf3+0x578>
    db38:	00040493          	mv	s1,s0
    db3c:	000e0a13          	mv	s4,t3
    db40:	00068b93          	mv	s7,a3
    db44:	09c0006f          	j	dbe0 <__muldf3+0x198>
    db48:	00a4ea33          	or	s4,s1,a0
    db4c:	480a1463          	bnez	s4,dfd4 <__muldf3+0x58c>
    db50:	0149d793          	srl	a5,s3,0x14
    db54:	00c99713          	sll	a4,s3,0xc
    db58:	7ff7f793          	and	a5,a5,2047
    db5c:	00000493          	li	s1,0
    db60:	00800b13          	li	s6,8
    db64:	7ff00c13          	li	s8,2047
    db68:	00200b93          	li	s7,2
    db6c:	000a8e13          	mv	t3,s5
    db70:	00c75413          	srl	s0,a4,0xc
    db74:	01f9d993          	srl	s3,s3,0x1f
    db78:	f60794e3          	bnez	a5,dae0 <__muldf3+0x98>
    db7c:	015467b3          	or	a5,s0,s5
    db80:	46078e63          	beqz	a5,dffc <__muldf3+0x5b4>
    db84:	54040c63          	beqz	s0,e0dc <__muldf3+0x694>
    db88:	00040513          	mv	a0,s0
    db8c:	6f4010ef          	jal	f280 <__clzsi2>
    db90:	00050313          	mv	t1,a0
    db94:	ff550713          	add	a4,a0,-11
    db98:	01d00793          	li	a5,29
    db9c:	ff830e13          	add	t3,t1,-8
    dba0:	40e787b3          	sub	a5,a5,a4
    dba4:	00fad7b3          	srl	a5,s5,a5
    dba8:	01c41733          	sll	a4,s0,t3
    dbac:	00e7e433          	or	s0,a5,a4
    dbb0:	01ca9e33          	sll	t3,s5,t3
    dbb4:	406c0333          	sub	t1,s8,t1
    dbb8:	c0d30313          	add	t1,t1,-1011
    dbbc:	00a00793          	li	a5,10
    dbc0:	00000693          	li	a3,0
    dbc4:	00130893          	add	a7,t1,1
    dbc8:	f567d8e3          	bge	a5,s6,db18 <__muldf3+0xd0>
    dbcc:	00090593          	mv	a1,s2
    dbd0:	00200793          	li	a5,2
    dbd4:	3efb8663          	beq	s7,a5,dfc0 <__muldf3+0x578>
    dbd8:	00300793          	li	a5,3
    dbdc:	54fb8863          	beq	s7,a5,e12c <__muldf3+0x6e4>
    dbe0:	00100793          	li	a5,1
    dbe4:	00058813          	mv	a6,a1
    dbe8:	52fb9663          	bne	s7,a5,e114 <__muldf3+0x6cc>
    dbec:	00000793          	li	a5,0
    dbf0:	00000693          	li	a3,0
    dbf4:	00000713          	li	a4,0
    dbf8:	02c12083          	lw	ra,44(sp)
    dbfc:	02812403          	lw	s0,40(sp)
    dc00:	01479793          	sll	a5,a5,0x14
    dc04:	00d7e7b3          	or	a5,a5,a3
    dc08:	01f81813          	sll	a6,a6,0x1f
    dc0c:	0107e7b3          	or	a5,a5,a6
    dc10:	02412483          	lw	s1,36(sp)
    dc14:	02012903          	lw	s2,32(sp)
    dc18:	01c12983          	lw	s3,28(sp)
    dc1c:	01812a03          	lw	s4,24(sp)
    dc20:	01412a83          	lw	s5,20(sp)
    dc24:	01012b03          	lw	s6,16(sp)
    dc28:	00c12b83          	lw	s7,12(sp)
    dc2c:	00812c03          	lw	s8,8(sp)
    dc30:	00070513          	mv	a0,a4
    dc34:	00078593          	mv	a1,a5
    dc38:	03010113          	add	sp,sp,48
    dc3c:	00008067          	ret
    dc40:	01546733          	or	a4,s0,s5
    dc44:	7ffc0313          	add	t1,s8,2047
    dc48:	3c070663          	beqz	a4,e014 <__muldf3+0x5cc>
    dc4c:	00001737          	lui	a4,0x1
    dc50:	01394833          	xor	a6,s2,s3
    dc54:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    dc58:	003b6b13          	or	s6,s6,3
    dc5c:	00a00693          	li	a3,10
    dc60:	00080593          	mv	a1,a6
    dc64:	00ec08b3          	add	a7,s8,a4
    dc68:	4366cc63          	blt	a3,s6,e0a0 <__muldf3+0x658>
    dc6c:	00300693          	li	a3,3
    dc70:	00100613          	li	a2,1
    dc74:	01661633          	sll	a2,a2,s6
    dc78:	53067713          	and	a4,a2,1328
    dc7c:	f4071ae3          	bnez	a4,dbd0 <__muldf3+0x188>
    dc80:	24067793          	and	a5,a2,576
    dc84:	48079063          	bnez	a5,e104 <__muldf3+0x6bc>
    dc88:	08867613          	and	a2,a2,136
    dc8c:	38061e63          	bnez	a2,e028 <__muldf3+0x5e0>
    dc90:	00010fb7          	lui	t6,0x10
    dc94:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    dc98:	005a7f33          	and	t5,s4,t0
    dc9c:	005e72b3          	and	t0,t3,t0
    dca0:	010a5a13          	srl	s4,s4,0x10
    dca4:	010e5e13          	srl	t3,t3,0x10
    dca8:	000f0513          	mv	a0,t5
    dcac:	00028593          	mv	a1,t0
    dcb0:	460010ef          	jal	f110 <__mulsi3>
    dcb4:	00050713          	mv	a4,a0
    dcb8:	000e0593          	mv	a1,t3
    dcbc:	000f0513          	mv	a0,t5
    dcc0:	450010ef          	jal	f110 <__mulsi3>
    dcc4:	00050793          	mv	a5,a0
    dcc8:	00028593          	mv	a1,t0
    dccc:	000a0513          	mv	a0,s4
    dcd0:	440010ef          	jal	f110 <__mulsi3>
    dcd4:	00050e93          	mv	t4,a0
    dcd8:	000e0593          	mv	a1,t3
    dcdc:	000a0513          	mv	a0,s4
    dce0:	430010ef          	jal	f110 <__mulsi3>
    dce4:	01d786b3          	add	a3,a5,t4
    dce8:	01075393          	srl	t2,a4,0x10
    dcec:	00d383b3          	add	t2,t2,a3
    dcf0:	00050793          	mv	a5,a0
    dcf4:	01d3f463          	bgeu	t2,t4,dcfc <__muldf3+0x2b4>
    dcf8:	01f507b3          	add	a5,a0,t6
    dcfc:	000109b7          	lui	s3,0x10
    dd00:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    dd04:	0123feb3          	and	t4,t2,s2
    dd08:	01277733          	and	a4,a4,s2
    dd0c:	010e9e93          	sll	t4,t4,0x10
    dd10:	01247933          	and	s2,s0,s2
    dd14:	0103d393          	srl	t2,t2,0x10
    dd18:	00ee8eb3          	add	t4,t4,a4
    dd1c:	01045413          	srl	s0,s0,0x10
    dd20:	000f0513          	mv	a0,t5
    dd24:	00090593          	mv	a1,s2
    dd28:	3e8010ef          	jal	f110 <__mulsi3>
    dd2c:	00050f93          	mv	t6,a0
    dd30:	00040593          	mv	a1,s0
    dd34:	000f0513          	mv	a0,t5
    dd38:	3d8010ef          	jal	f110 <__mulsi3>
    dd3c:	00050713          	mv	a4,a0
    dd40:	00090593          	mv	a1,s2
    dd44:	000a0513          	mv	a0,s4
    dd48:	3c8010ef          	jal	f110 <__mulsi3>
    dd4c:	00050f13          	mv	t5,a0
    dd50:	00040593          	mv	a1,s0
    dd54:	000a0513          	mv	a0,s4
    dd58:	3b8010ef          	jal	f110 <__mulsi3>
    dd5c:	010fd693          	srl	a3,t6,0x10
    dd60:	01e70733          	add	a4,a4,t5
    dd64:	00e686b3          	add	a3,a3,a4
    dd68:	01e6f463          	bgeu	a3,t5,dd70 <__muldf3+0x328>
    dd6c:	01350533          	add	a0,a0,s3
    dd70:	00010a37          	lui	s4,0x10
    dd74:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    dd78:	01e6f733          	and	a4,a3,t5
    dd7c:	01efffb3          	and	t6,t6,t5
    dd80:	01071713          	sll	a4,a4,0x10
    dd84:	01f70733          	add	a4,a4,t6
    dd88:	01e4ff33          	and	t5,s1,t5
    dd8c:	0106d693          	srl	a3,a3,0x10
    dd90:	00a68fb3          	add	t6,a3,a0
    dd94:	00e383b3          	add	t2,t2,a4
    dd98:	0104d493          	srl	s1,s1,0x10
    dd9c:	000f0513          	mv	a0,t5
    dda0:	00028593          	mv	a1,t0
    dda4:	36c010ef          	jal	f110 <__mulsi3>
    dda8:	00050a93          	mv	s5,a0
    ddac:	000e0593          	mv	a1,t3
    ddb0:	000f0513          	mv	a0,t5
    ddb4:	35c010ef          	jal	f110 <__mulsi3>
    ddb8:	00050993          	mv	s3,a0
    ddbc:	00028593          	mv	a1,t0
    ddc0:	00048513          	mv	a0,s1
    ddc4:	34c010ef          	jal	f110 <__mulsi3>
    ddc8:	00050293          	mv	t0,a0
    ddcc:	000e0593          	mv	a1,t3
    ddd0:	00048513          	mv	a0,s1
    ddd4:	33c010ef          	jal	f110 <__mulsi3>
    ddd8:	010ad613          	srl	a2,s5,0x10
    dddc:	005989b3          	add	s3,s3,t0
    dde0:	01360633          	add	a2,a2,s3
    dde4:	00567463          	bgeu	a2,t0,ddec <__muldf3+0x3a4>
    dde8:	01450533          	add	a0,a0,s4
    ddec:	00010a37          	lui	s4,0x10
    ddf0:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    ddf4:	00d672b3          	and	t0,a2,a3
    ddf8:	00dafab3          	and	s5,s5,a3
    ddfc:	01065613          	srl	a2,a2,0x10
    de00:	01029293          	sll	t0,t0,0x10
    de04:	00a60e33          	add	t3,a2,a0
    de08:	015282b3          	add	t0,t0,s5
    de0c:	000f0513          	mv	a0,t5
    de10:	00090593          	mv	a1,s2
    de14:	2fc010ef          	jal	f110 <__mulsi3>
    de18:	00050993          	mv	s3,a0
    de1c:	00040593          	mv	a1,s0
    de20:	000f0513          	mv	a0,t5
    de24:	2ec010ef          	jal	f110 <__mulsi3>
    de28:	00050f13          	mv	t5,a0
    de2c:	00090593          	mv	a1,s2
    de30:	00048513          	mv	a0,s1
    de34:	2dc010ef          	jal	f110 <__mulsi3>
    de38:	00050913          	mv	s2,a0
    de3c:	00040593          	mv	a1,s0
    de40:	00048513          	mv	a0,s1
    de44:	2cc010ef          	jal	f110 <__mulsi3>
    de48:	012f06b3          	add	a3,t5,s2
    de4c:	0109d593          	srl	a1,s3,0x10
    de50:	00d58433          	add	s0,a1,a3
    de54:	00050f13          	mv	t5,a0
    de58:	01247463          	bgeu	s0,s2,de60 <__muldf3+0x418>
    de5c:	01450f33          	add	t5,a0,s4
    de60:	00010637          	lui	a2,0x10
    de64:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x21f>
    de68:	00c476b3          	and	a3,s0,a2
    de6c:	00c9f9b3          	and	s3,s3,a2
    de70:	01069693          	sll	a3,a3,0x10
    de74:	007787b3          	add	a5,a5,t2
    de78:	013686b3          	add	a3,a3,s3
    de7c:	01f685b3          	add	a1,a3,t6
    de80:	00e7b733          	sltu	a4,a5,a4
    de84:	00e58733          	add	a4,a1,a4
    de88:	005782b3          	add	t0,a5,t0
    de8c:	01c70633          	add	a2,a4,t3
    de90:	00f2b7b3          	sltu	a5,t0,a5
    de94:	00f607b3          	add	a5,a2,a5
    de98:	00d5b6b3          	sltu	a3,a1,a3
    de9c:	00b735b3          	sltu	a1,a4,a1
    dea0:	00b6e6b3          	or	a3,a3,a1
    dea4:	00e63733          	sltu	a4,a2,a4
    dea8:	01045593          	srl	a1,s0,0x10
    deac:	00c7b633          	sltu	a2,a5,a2
    deb0:	00b686b3          	add	a3,a3,a1
    deb4:	00929a13          	sll	s4,t0,0x9
    deb8:	00c76733          	or	a4,a4,a2
    debc:	00d70733          	add	a4,a4,a3
    dec0:	01da6a33          	or	s4,s4,t4
    dec4:	01e70733          	add	a4,a4,t5
    dec8:	01403a33          	snez	s4,s4
    decc:	0172d293          	srl	t0,t0,0x17
    ded0:	00971713          	sll	a4,a4,0x9
    ded4:	0177d693          	srl	a3,a5,0x17
    ded8:	005a6a33          	or	s4,s4,t0
    dedc:	00979793          	sll	a5,a5,0x9
    dee0:	00fa6a33          	or	s4,s4,a5
    dee4:	00771793          	sll	a5,a4,0x7
    dee8:	00d764b3          	or	s1,a4,a3
    deec:	0207d063          	bgez	a5,df0c <__muldf3+0x4c4>
    def0:	001a5793          	srl	a5,s4,0x1
    def4:	001a7a13          	and	s4,s4,1
    def8:	01f49713          	sll	a4,s1,0x1f
    defc:	0147e7b3          	or	a5,a5,s4
    df00:	00e7ea33          	or	s4,a5,a4
    df04:	0014d493          	srl	s1,s1,0x1
    df08:	00088313          	mv	t1,a7
    df0c:	3ff30793          	add	a5,t1,1023
    df10:	12f05663          	blez	a5,e03c <__muldf3+0x5f4>
    df14:	007a7713          	and	a4,s4,7
    df18:	02070063          	beqz	a4,df38 <__muldf3+0x4f0>
    df1c:	00fa7713          	and	a4,s4,15
    df20:	00400693          	li	a3,4
    df24:	00d70a63          	beq	a4,a3,df38 <__muldf3+0x4f0>
    df28:	004a0713          	add	a4,s4,4
    df2c:	01473a33          	sltu	s4,a4,s4
    df30:	014484b3          	add	s1,s1,s4
    df34:	00070a13          	mv	s4,a4
    df38:	00749713          	sll	a4,s1,0x7
    df3c:	00075a63          	bgez	a4,df50 <__muldf3+0x508>
    df40:	ff0007b7          	lui	a5,0xff000
    df44:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    df48:	00f4f4b3          	and	s1,s1,a5
    df4c:	40030793          	add	a5,t1,1024
    df50:	7fe00713          	li	a4,2046
    df54:	1cf74463          	blt	a4,a5,e11c <__muldf3+0x6d4>
    df58:	003a5a13          	srl	s4,s4,0x3
    df5c:	01d49713          	sll	a4,s1,0x1d
    df60:	00949693          	sll	a3,s1,0x9
    df64:	01476733          	or	a4,a4,s4
    df68:	00c6d693          	srl	a3,a3,0xc
    df6c:	7ff7f793          	and	a5,a5,2047
    df70:	c89ff06f          	j	dbf8 <__muldf3+0x1b0>
    df74:	00a4ea33          	or	s4,s1,a0
    df78:	060a0863          	beqz	s4,dfe8 <__muldf3+0x5a0>
    df7c:	12048e63          	beqz	s1,e0b8 <__muldf3+0x670>
    df80:	00048513          	mv	a0,s1
    df84:	2fc010ef          	jal	f280 <__clzsi2>
    df88:	00050713          	mv	a4,a0
    df8c:	ff550693          	add	a3,a0,-11
    df90:	01d00793          	li	a5,29
    df94:	ff870a13          	add	s4,a4,-8
    df98:	40d787b3          	sub	a5,a5,a3
    df9c:	00f457b3          	srl	a5,s0,a5
    dfa0:	014496b3          	sll	a3,s1,s4
    dfa4:	00d7e4b3          	or	s1,a5,a3
    dfa8:	01441a33          	sll	s4,s0,s4
    dfac:	c0d00793          	li	a5,-1011
    dfb0:	40e78c33          	sub	s8,a5,a4
    dfb4:	00000b13          	li	s6,0
    dfb8:	00000b93          	li	s7,0
    dfbc:	b09ff06f          	j	dac4 <__muldf3+0x7c>
    dfc0:	00058813          	mv	a6,a1
    dfc4:	7ff00793          	li	a5,2047
    dfc8:	00000693          	li	a3,0
    dfcc:	00000713          	li	a4,0
    dfd0:	c29ff06f          	j	dbf8 <__muldf3+0x1b0>
    dfd4:	00050a13          	mv	s4,a0
    dfd8:	00c00b13          	li	s6,12
    dfdc:	7ff00c13          	li	s8,2047
    dfe0:	00300b93          	li	s7,3
    dfe4:	ae1ff06f          	j	dac4 <__muldf3+0x7c>
    dfe8:	00000493          	li	s1,0
    dfec:	00400b13          	li	s6,4
    dff0:	00000c13          	li	s8,0
    dff4:	00100b93          	li	s7,1
    dff8:	acdff06f          	j	dac4 <__muldf3+0x7c>
    dffc:	001b6b13          	or	s6,s6,1
    e000:	000c0313          	mv	t1,s8
    e004:	00000413          	li	s0,0
    e008:	00000e13          	li	t3,0
    e00c:	00100693          	li	a3,1
    e010:	afdff06f          	j	db0c <__muldf3+0xc4>
    e014:	002b6b13          	or	s6,s6,2
    e018:	00000413          	li	s0,0
    e01c:	00000e13          	li	t3,0
    e020:	00200693          	li	a3,2
    e024:	ae9ff06f          	j	db0c <__muldf3+0xc4>
    e028:	00040493          	mv	s1,s0
    e02c:	000e0a13          	mv	s4,t3
    e030:	00068b93          	mv	s7,a3
    e034:	00098593          	mv	a1,s3
    e038:	b99ff06f          	j	dbd0 <__muldf3+0x188>
    e03c:	00100713          	li	a4,1
    e040:	10079063          	bnez	a5,e140 <__muldf3+0x6f8>
    e044:	41e30313          	add	t1,t1,1054
    e048:	006a1633          	sll	a2,s4,t1
    e04c:	00c03633          	snez	a2,a2
    e050:	00649333          	sll	t1,s1,t1
    e054:	00ea5a33          	srl	s4,s4,a4
    e058:	00666633          	or	a2,a2,t1
    e05c:	01466633          	or	a2,a2,s4
    e060:	00767793          	and	a5,a2,7
    e064:	00e4d5b3          	srl	a1,s1,a4
    e068:	02078063          	beqz	a5,e088 <__muldf3+0x640>
    e06c:	00f67793          	and	a5,a2,15
    e070:	00400713          	li	a4,4
    e074:	00e78a63          	beq	a5,a4,e088 <__muldf3+0x640>
    e078:	00460793          	add	a5,a2,4
    e07c:	00c7b633          	sltu	a2,a5,a2
    e080:	00c585b3          	add	a1,a1,a2
    e084:	00078613          	mv	a2,a5
    e088:	00859513          	sll	a0,a1,0x8
    e08c:	00100793          	li	a5,1
    e090:	00000693          	li	a3,0
    e094:	00000713          	li	a4,0
    e098:	b60540e3          	bltz	a0,dbf8 <__muldf3+0x1b0>
    e09c:	10c0006f          	j	e1a8 <__muldf3+0x760>
    e0a0:	00f00713          	li	a4,15
    e0a4:	12eb1063          	bne	s6,a4,e1c4 <__muldf3+0x77c>
    e0a8:	00000813          	li	a6,0
    e0ac:	000806b7          	lui	a3,0x80
    e0b0:	00000713          	li	a4,0
    e0b4:	b45ff06f          	j	dbf8 <__muldf3+0x1b0>
    e0b8:	1c8010ef          	jal	f280 <__clzsi2>
    e0bc:	01550693          	add	a3,a0,21
    e0c0:	01c00793          	li	a5,28
    e0c4:	02050713          	add	a4,a0,32
    e0c8:	ecd7d4e3          	bge	a5,a3,df90 <__muldf3+0x548>
    e0cc:	ff850513          	add	a0,a0,-8
    e0d0:	00000a13          	li	s4,0
    e0d4:	00a414b3          	sll	s1,s0,a0
    e0d8:	ed5ff06f          	j	dfac <__muldf3+0x564>
    e0dc:	000a8513          	mv	a0,s5
    e0e0:	1a0010ef          	jal	f280 <__clzsi2>
    e0e4:	01550713          	add	a4,a0,21
    e0e8:	01c00793          	li	a5,28
    e0ec:	02050313          	add	t1,a0,32
    e0f0:	aae7d4e3          	bge	a5,a4,db98 <__muldf3+0x150>
    e0f4:	ff850513          	add	a0,a0,-8
    e0f8:	00000e13          	li	t3,0
    e0fc:	00aa9433          	sll	s0,s5,a0
    e100:	ab5ff06f          	j	dbb4 <__muldf3+0x16c>
    e104:	00000813          	li	a6,0
    e108:	7ff00793          	li	a5,2047
    e10c:	000806b7          	lui	a3,0x80
    e110:	ae9ff06f          	j	dbf8 <__muldf3+0x1b0>
    e114:	00088313          	mv	t1,a7
    e118:	df5ff06f          	j	df0c <__muldf3+0x4c4>
    e11c:	7ff00793          	li	a5,2047
    e120:	00000693          	li	a3,0
    e124:	00000713          	li	a4,0
    e128:	ad1ff06f          	j	dbf8 <__muldf3+0x1b0>
    e12c:	00000813          	li	a6,0
    e130:	7ff00793          	li	a5,2047
    e134:	000806b7          	lui	a3,0x80
    e138:	00000713          	li	a4,0
    e13c:	abdff06f          	j	dbf8 <__muldf3+0x1b0>
    e140:	40f70733          	sub	a4,a4,a5
    e144:	03800693          	li	a3,56
    e148:	aae6c2e3          	blt	a3,a4,dbec <__muldf3+0x1a4>
    e14c:	01f00693          	li	a3,31
    e150:	eee6dae3          	bge	a3,a4,e044 <__muldf3+0x5fc>
    e154:	fe100693          	li	a3,-31
    e158:	40f687b3          	sub	a5,a3,a5
    e15c:	02000693          	li	a3,32
    e160:	00f4d7b3          	srl	a5,s1,a5
    e164:	00d70863          	beq	a4,a3,e174 <__muldf3+0x72c>
    e168:	43e30313          	add	t1,t1,1086
    e16c:	00649333          	sll	t1,s1,t1
    e170:	006a6a33          	or	s4,s4,t1
    e174:	01403633          	snez	a2,s4
    e178:	00f66633          	or	a2,a2,a5
    e17c:	00767713          	and	a4,a2,7
    e180:	00000693          	li	a3,0
    e184:	02070863          	beqz	a4,e1b4 <__muldf3+0x76c>
    e188:	00f67793          	and	a5,a2,15
    e18c:	00400713          	li	a4,4
    e190:	00000593          	li	a1,0
    e194:	00e78a63          	beq	a5,a4,e1a8 <__muldf3+0x760>
    e198:	00460793          	add	a5,a2,4
    e19c:	00c7b633          	sltu	a2,a5,a2
    e1a0:	00c035b3          	snez	a1,a2
    e1a4:	00078613          	mv	a2,a5
    e1a8:	00959693          	sll	a3,a1,0x9
    e1ac:	01d59713          	sll	a4,a1,0x1d
    e1b0:	00c6d693          	srl	a3,a3,0xc
    e1b4:	00365613          	srl	a2,a2,0x3
    e1b8:	00e66733          	or	a4,a2,a4
    e1bc:	00000793          	li	a5,0
    e1c0:	a39ff06f          	j	dbf8 <__muldf3+0x1b0>
    e1c4:	00040493          	mv	s1,s0
    e1c8:	000a8a13          	mv	s4,s5
    e1cc:	00300b93          	li	s7,3
    e1d0:	00098593          	mv	a1,s3
    e1d4:	9fdff06f          	j	dbd0 <__muldf3+0x188>

0000e1d8 <__subdf3>:
    e1d8:	001007b7          	lui	a5,0x100
    e1dc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e1e0:	fe010113          	add	sp,sp,-32
    e1e4:	00b7f8b3          	and	a7,a5,a1
    e1e8:	00d7f833          	and	a6,a5,a3
    e1ec:	0146d793          	srl	a5,a3,0x14
    e1f0:	00389893          	sll	a7,a7,0x3
    e1f4:	00812c23          	sw	s0,24(sp)
    e1f8:	01312623          	sw	s3,12(sp)
    e1fc:	01f5d413          	srl	s0,a1,0x1f
    e200:	0145d993          	srl	s3,a1,0x14
    e204:	01d55713          	srl	a4,a0,0x1d
    e208:	00381813          	sll	a6,a6,0x3
    e20c:	01d65593          	srl	a1,a2,0x1d
    e210:	00112e23          	sw	ra,28(sp)
    e214:	00912a23          	sw	s1,20(sp)
    e218:	01212823          	sw	s2,16(sp)
    e21c:	7ff7ff13          	and	t5,a5,2047
    e220:	7ff00313          	li	t1,2047
    e224:	01176733          	or	a4,a4,a7
    e228:	7ff9f993          	and	s3,s3,2047
    e22c:	00040e13          	mv	t3,s0
    e230:	00351893          	sll	a7,a0,0x3
    e234:	01f6d693          	srl	a3,a3,0x1f
    e238:	0105e5b3          	or	a1,a1,a6
    e23c:	00361e93          	sll	t4,a2,0x3
    e240:	206f0c63          	beq	t5,t1,e458 <__subdf3+0x280>
    e244:	0016c693          	xor	a3,a3,1
    e248:	41e987b3          	sub	a5,s3,t5
    e24c:	16d40263          	beq	s0,a3,e3b0 <__subdf3+0x1d8>
    e250:	00f05ae3          	blez	a5,ea64 <__subdf3+0x88c>
    e254:	240f0a63          	beqz	t5,e4a8 <__subdf3+0x2d0>
    e258:	3c698463          	beq	s3,t1,e620 <__subdf3+0x448>
    e25c:	03800693          	li	a3,56
    e260:	00100513          	li	a0,1
    e264:	02f6ce63          	blt	a3,a5,e2a0 <__subdf3+0xc8>
    e268:	008006b7          	lui	a3,0x800
    e26c:	00d5e5b3          	or	a1,a1,a3
    e270:	01f00693          	li	a3,31
    e274:	4ef6c463          	blt	a3,a5,e75c <__subdf3+0x584>
    e278:	02000693          	li	a3,32
    e27c:	40f686b3          	sub	a3,a3,a5
    e280:	00d59533          	sll	a0,a1,a3
    e284:	00fed633          	srl	a2,t4,a5
    e288:	00de96b3          	sll	a3,t4,a3
    e28c:	00c56533          	or	a0,a0,a2
    e290:	00d036b3          	snez	a3,a3
    e294:	00f5d7b3          	srl	a5,a1,a5
    e298:	00d56533          	or	a0,a0,a3
    e29c:	40f70733          	sub	a4,a4,a5
    e2a0:	40a88533          	sub	a0,a7,a0
    e2a4:	00a8b633          	sltu	a2,a7,a0
    e2a8:	00050493          	mv	s1,a0
    e2ac:	40c70933          	sub	s2,a4,a2
    e2b0:	00891793          	sll	a5,s2,0x8
    e2b4:	3407d863          	bgez	a5,e604 <__subdf3+0x42c>
    e2b8:	008007b7          	lui	a5,0x800
    e2bc:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    e2c0:	00f97933          	and	s2,s2,a5
    e2c4:	2e090663          	beqz	s2,e5b0 <__subdf3+0x3d8>
    e2c8:	00090513          	mv	a0,s2
    e2cc:	7b5000ef          	jal	f280 <__clzsi2>
    e2d0:	ff850793          	add	a5,a0,-8
    e2d4:	02000693          	li	a3,32
    e2d8:	40f68733          	sub	a4,a3,a5
    e2dc:	00e4d733          	srl	a4,s1,a4
    e2e0:	00f91933          	sll	s2,s2,a5
    e2e4:	01276733          	or	a4,a4,s2
    e2e8:	00f494b3          	sll	s1,s1,a5
    e2ec:	3f37c463          	blt	a5,s3,e6d4 <__subdf3+0x4fc>
    e2f0:	413787b3          	sub	a5,a5,s3
    e2f4:	00178793          	add	a5,a5,1
    e2f8:	40f686b3          	sub	a3,a3,a5
    e2fc:	00d49633          	sll	a2,s1,a3
    e300:	00f4d933          	srl	s2,s1,a5
    e304:	00c03633          	snez	a2,a2
    e308:	00c96633          	or	a2,s2,a2
    e30c:	00d716b3          	sll	a3,a4,a3
    e310:	00c6e4b3          	or	s1,a3,a2
    e314:	00f75933          	srl	s2,a4,a5
    e318:	00000993          	li	s3,0
    e31c:	0074f793          	and	a5,s1,7
    e320:	02078063          	beqz	a5,e340 <__subdf3+0x168>
    e324:	00f4f793          	and	a5,s1,15
    e328:	00400713          	li	a4,4
    e32c:	00e78a63          	beq	a5,a4,e340 <__subdf3+0x168>
    e330:	00448793          	add	a5,s1,4
    e334:	0097b533          	sltu	a0,a5,s1
    e338:	00a90933          	add	s2,s2,a0
    e33c:	00078493          	mv	s1,a5
    e340:	00891793          	sll	a5,s2,0x8
    e344:	6c07d063          	bgez	a5,ea04 <__subdf3+0x82c>
    e348:	00198793          	add	a5,s3,1
    e34c:	7ff00713          	li	a4,2047
    e350:	24e78663          	beq	a5,a4,e59c <__subdf3+0x3c4>
    e354:	ff800737          	lui	a4,0xff800
    e358:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e35c:	00e97733          	and	a4,s2,a4
    e360:	7ff7f793          	and	a5,a5,2047
    e364:	01d71813          	sll	a6,a4,0x1d
    e368:	0034d513          	srl	a0,s1,0x3
    e36c:	00971713          	sll	a4,a4,0x9
    e370:	00a86833          	or	a6,a6,a0
    e374:	00c75713          	srl	a4,a4,0xc
    e378:	00147e13          	and	t3,s0,1
    e37c:	01c12083          	lw	ra,28(sp)
    e380:	01812403          	lw	s0,24(sp)
    e384:	01479793          	sll	a5,a5,0x14
    e388:	00e7e7b3          	or	a5,a5,a4
    e38c:	01fe1713          	sll	a4,t3,0x1f
    e390:	00e7e7b3          	or	a5,a5,a4
    e394:	01412483          	lw	s1,20(sp)
    e398:	01012903          	lw	s2,16(sp)
    e39c:	00c12983          	lw	s3,12(sp)
    e3a0:	00080513          	mv	a0,a6
    e3a4:	00078593          	mv	a1,a5
    e3a8:	02010113          	add	sp,sp,32
    e3ac:	00008067          	ret
    e3b0:	70f05263          	blez	a5,eab4 <__subdf3+0x8dc>
    e3b4:	1c0f1663          	bnez	t5,e580 <__subdf3+0x3a8>
    e3b8:	01d5e6b3          	or	a3,a1,t4
    e3bc:	26068e63          	beqz	a3,e638 <__subdf3+0x460>
    e3c0:	fff78693          	add	a3,a5,-1
    e3c4:	46068863          	beqz	a3,e834 <__subdf3+0x65c>
    e3c8:	24678c63          	beq	a5,t1,e620 <__subdf3+0x448>
    e3cc:	03800793          	li	a5,56
    e3d0:	00100913          	li	s2,1
    e3d4:	02d7cc63          	blt	a5,a3,e40c <__subdf3+0x234>
    e3d8:	00068793          	mv	a5,a3
    e3dc:	01f00693          	li	a3,31
    e3e0:	48f6ca63          	blt	a3,a5,e874 <__subdf3+0x69c>
    e3e4:	02000693          	li	a3,32
    e3e8:	40f686b3          	sub	a3,a3,a5
    e3ec:	00d59933          	sll	s2,a1,a3
    e3f0:	00fed633          	srl	a2,t4,a5
    e3f4:	00de96b3          	sll	a3,t4,a3
    e3f8:	00c96933          	or	s2,s2,a2
    e3fc:	00d036b3          	snez	a3,a3
    e400:	00f5d7b3          	srl	a5,a1,a5
    e404:	00d96933          	or	s2,s2,a3
    e408:	00f70733          	add	a4,a4,a5
    e40c:	01190633          	add	a2,s2,a7
    e410:	01263933          	sltu	s2,a2,s2
    e414:	00060493          	mv	s1,a2
    e418:	00e90933          	add	s2,s2,a4
    e41c:	00891793          	sll	a5,s2,0x8
    e420:	1e07d263          	bgez	a5,e604 <__subdf3+0x42c>
    e424:	00198993          	add	s3,s3,1
    e428:	7ff00793          	li	a5,2047
    e42c:	16f98863          	beq	s3,a5,e59c <__subdf3+0x3c4>
    e430:	ff8007b7          	lui	a5,0xff800
    e434:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e438:	0014f513          	and	a0,s1,1
    e43c:	00f977b3          	and	a5,s2,a5
    e440:	0014d713          	srl	a4,s1,0x1
    e444:	00a76733          	or	a4,a4,a0
    e448:	01f79513          	sll	a0,a5,0x1f
    e44c:	00e564b3          	or	s1,a0,a4
    e450:	0017d913          	srl	s2,a5,0x1
    e454:	ec9ff06f          	j	e31c <__subdf3+0x144>
    e458:	01d5e833          	or	a6,a1,t4
    e45c:	80198313          	add	t1,s3,-2047
    e460:	06080863          	beqz	a6,e4d0 <__subdf3+0x2f8>
    e464:	06d40a63          	beq	s0,a3,e4d8 <__subdf3+0x300>
    e468:	0e030463          	beqz	t1,e550 <__subdf3+0x378>
    e46c:	26098e63          	beqz	s3,e6e8 <__subdf3+0x510>
    e470:	00361513          	sll	a0,a2,0x3
    e474:	00355513          	srl	a0,a0,0x3
    e478:	00068413          	mv	s0,a3
    e47c:	00058713          	mv	a4,a1
    e480:	01d71813          	sll	a6,a4,0x1d
    e484:	00a86833          	or	a6,a6,a0
    e488:	00375713          	srl	a4,a4,0x3
    e48c:	01076733          	or	a4,a4,a6
    e490:	10070663          	beqz	a4,e59c <__subdf3+0x3c4>
    e494:	00000e13          	li	t3,0
    e498:	7ff00793          	li	a5,2047
    e49c:	00080737          	lui	a4,0x80
    e4a0:	00000813          	li	a6,0
    e4a4:	ed9ff06f          	j	e37c <__subdf3+0x1a4>
    e4a8:	01d5e6b3          	or	a3,a1,t4
    e4ac:	18068663          	beqz	a3,e638 <__subdf3+0x460>
    e4b0:	fff78693          	add	a3,a5,-1
    e4b4:	3a068263          	beqz	a3,e858 <__subdf3+0x680>
    e4b8:	16678463          	beq	a5,t1,e620 <__subdf3+0x448>
    e4bc:	03800793          	li	a5,56
    e4c0:	00100513          	li	a0,1
    e4c4:	dcd7cee3          	blt	a5,a3,e2a0 <__subdf3+0xc8>
    e4c8:	00068793          	mv	a5,a3
    e4cc:	da5ff06f          	j	e270 <__subdf3+0x98>
    e4d0:	0016c693          	xor	a3,a3,1
    e4d4:	f8d41ae3          	bne	s0,a3,e468 <__subdf3+0x290>
    e4d8:	18030863          	beqz	t1,e668 <__subdf3+0x490>
    e4dc:	2c099063          	bnez	s3,e79c <__subdf3+0x5c4>
    e4e0:	7ff00793          	li	a5,2047
    e4e4:	011766b3          	or	a3,a4,a7
    e4e8:	48068863          	beqz	a3,e978 <__subdf3+0x7a0>
    e4ec:	fff78693          	add	a3,a5,-1
    e4f0:	34068263          	beqz	a3,e834 <__subdf3+0x65c>
    e4f4:	7ff00513          	li	a0,2047
    e4f8:	2aa78263          	beq	a5,a0,e79c <__subdf3+0x5c4>
    e4fc:	03800793          	li	a5,56
    e500:	00100913          	li	s2,1
    e504:	02d7ca63          	blt	a5,a3,e538 <__subdf3+0x360>
    e508:	01f00793          	li	a5,31
    e50c:	4cd7c663          	blt	a5,a3,e9d8 <__subdf3+0x800>
    e510:	02000793          	li	a5,32
    e514:	40d787b3          	sub	a5,a5,a3
    e518:	00f71933          	sll	s2,a4,a5
    e51c:	00d8d633          	srl	a2,a7,a3
    e520:	00f897b3          	sll	a5,a7,a5
    e524:	00c96933          	or	s2,s2,a2
    e528:	00f037b3          	snez	a5,a5
    e52c:	00d756b3          	srl	a3,a4,a3
    e530:	00f96933          	or	s2,s2,a5
    e534:	00d585b3          	add	a1,a1,a3
    e538:	01d90733          	add	a4,s2,t4
    e53c:	01273933          	sltu	s2,a4,s2
    e540:	00070493          	mv	s1,a4
    e544:	00b90933          	add	s2,s2,a1
    e548:	000f0993          	mv	s3,t5
    e54c:	ed1ff06f          	j	e41c <__subdf3+0x244>
    e550:	00198793          	add	a5,s3,1
    e554:	7fe7f793          	and	a5,a5,2046
    e558:	14079463          	bnez	a5,e6a0 <__subdf3+0x4c8>
    e55c:	01d5e833          	or	a6,a1,t4
    e560:	011767b3          	or	a5,a4,a7
    e564:	2a099463          	bnez	s3,e80c <__subdf3+0x634>
    e568:	38078e63          	beqz	a5,e904 <__subdf3+0x72c>
    e56c:	3c081063          	bnez	a6,e92c <__subdf3+0x754>
    e570:	00351513          	sll	a0,a0,0x3
    e574:	00355913          	srl	s2,a0,0x3
    e578:	00000793          	li	a5,0
    e57c:	1140006f          	j	e690 <__subdf3+0x4b8>
    e580:	0a698063          	beq	s3,t1,e620 <__subdf3+0x448>
    e584:	03800693          	li	a3,56
    e588:	00100913          	li	s2,1
    e58c:	e8f6c0e3          	blt	a3,a5,e40c <__subdf3+0x234>
    e590:	008006b7          	lui	a3,0x800
    e594:	00d5e5b3          	or	a1,a1,a3
    e598:	e45ff06f          	j	e3dc <__subdf3+0x204>
    e59c:	00147e13          	and	t3,s0,1
    e5a0:	7ff00793          	li	a5,2047
    e5a4:	00000713          	li	a4,0
    e5a8:	00000813          	li	a6,0
    e5ac:	dd1ff06f          	j	e37c <__subdf3+0x1a4>
    e5b0:	00048513          	mv	a0,s1
    e5b4:	4cd000ef          	jal	f280 <__clzsi2>
    e5b8:	01850793          	add	a5,a0,24
    e5bc:	01f00693          	li	a3,31
    e5c0:	d0f6dae3          	bge	a3,a5,e2d4 <__subdf3+0xfc>
    e5c4:	ff850713          	add	a4,a0,-8
    e5c8:	00e49733          	sll	a4,s1,a4
    e5cc:	1b37ce63          	blt	a5,s3,e788 <__subdf3+0x5b0>
    e5d0:	413789b3          	sub	s3,a5,s3
    e5d4:	00198793          	add	a5,s3,1
    e5d8:	42f6de63          	bge	a3,a5,ea14 <__subdf3+0x83c>
    e5dc:	fe198993          	add	s3,s3,-31
    e5e0:	02000693          	li	a3,32
    e5e4:	013754b3          	srl	s1,a4,s3
    e5e8:	00d78c63          	beq	a5,a3,e600 <__subdf3+0x428>
    e5ec:	04000693          	li	a3,64
    e5f0:	40f687b3          	sub	a5,a3,a5
    e5f4:	00f71733          	sll	a4,a4,a5
    e5f8:	00e03733          	snez	a4,a4
    e5fc:	00e4e4b3          	or	s1,s1,a4
    e600:	00000993          	li	s3,0
    e604:	0074f793          	and	a5,s1,7
    e608:	d0079ee3          	bnez	a5,e324 <__subdf3+0x14c>
    e60c:	00098793          	mv	a5,s3
    e610:	0034d513          	srl	a0,s1,0x3
    e614:	00090713          	mv	a4,s2
    e618:	0280006f          	j	e640 <__subdf3+0x468>
    e61c:	e6081ce3          	bnez	a6,e494 <__subdf3+0x2bc>
    e620:	00351513          	sll	a0,a0,0x3
    e624:	01d71813          	sll	a6,a4,0x1d
    e628:	00355513          	srl	a0,a0,0x3
    e62c:	00a86833          	or	a6,a6,a0
    e630:	00375713          	srl	a4,a4,0x3
    e634:	e59ff06f          	j	e48c <__subdf3+0x2b4>
    e638:	00351513          	sll	a0,a0,0x3
    e63c:	00355513          	srl	a0,a0,0x3
    e640:	01d71813          	sll	a6,a4,0x1d
    e644:	7ff00693          	li	a3,2047
    e648:	00a86833          	or	a6,a6,a0
    e64c:	00375713          	srl	a4,a4,0x3
    e650:	e2d78ee3          	beq	a5,a3,e48c <__subdf3+0x2b4>
    e654:	00c71713          	sll	a4,a4,0xc
    e658:	00c75713          	srl	a4,a4,0xc
    e65c:	7ff7f793          	and	a5,a5,2047
    e660:	00147e13          	and	t3,s0,1
    e664:	d19ff06f          	j	e37c <__subdf3+0x1a4>
    e668:	00198693          	add	a3,s3,1
    e66c:	7fe6f793          	and	a5,a3,2046
    e670:	12079e63          	bnez	a5,e7ac <__subdf3+0x5d4>
    e674:	011767b3          	or	a5,a4,a7
    e678:	24099a63          	bnez	s3,e8cc <__subdf3+0x6f4>
    e67c:	30078663          	beqz	a5,e988 <__subdf3+0x7b0>
    e680:	01d5e7b3          	or	a5,a1,t4
    e684:	30079a63          	bnez	a5,e998 <__subdf3+0x7c0>
    e688:	00351513          	sll	a0,a0,0x3
    e68c:	00355913          	srl	s2,a0,0x3
    e690:	01d71813          	sll	a6,a4,0x1d
    e694:	01286833          	or	a6,a6,s2
    e698:	00375713          	srl	a4,a4,0x3
    e69c:	fb9ff06f          	j	e654 <__subdf3+0x47c>
    e6a0:	41d88833          	sub	a6,a7,t4
    e6a4:	0108b7b3          	sltu	a5,a7,a6
    e6a8:	40b70933          	sub	s2,a4,a1
    e6ac:	40f90933          	sub	s2,s2,a5
    e6b0:	00891793          	sll	a5,s2,0x8
    e6b4:	00080493          	mv	s1,a6
    e6b8:	1207c263          	bltz	a5,e7dc <__subdf3+0x604>
    e6bc:	01286833          	or	a6,a6,s2
    e6c0:	c00812e3          	bnez	a6,e2c4 <__subdf3+0xec>
    e6c4:	00000e13          	li	t3,0
    e6c8:	00000793          	li	a5,0
    e6cc:	00000713          	li	a4,0
    e6d0:	cadff06f          	j	e37c <__subdf3+0x1a4>
    e6d4:	ff800937          	lui	s2,0xff800
    e6d8:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e6dc:	40f989b3          	sub	s3,s3,a5
    e6e0:	01277933          	and	s2,a4,s2
    e6e4:	c39ff06f          	j	e31c <__subdf3+0x144>
    e6e8:	7ff00793          	li	a5,2047
    e6ec:	01176533          	or	a0,a4,a7
    e6f0:	10050463          	beqz	a0,e7f8 <__subdf3+0x620>
    e6f4:	fff78813          	add	a6,a5,-1
    e6f8:	1e080263          	beqz	a6,e8dc <__subdf3+0x704>
    e6fc:	7ff00513          	li	a0,2047
    e700:	d6a788e3          	beq	a5,a0,e470 <__subdf3+0x298>
    e704:	03800793          	li	a5,56
    e708:	00068413          	mv	s0,a3
    e70c:	00100513          	li	a0,1
    e710:	0307ca63          	blt	a5,a6,e744 <__subdf3+0x56c>
    e714:	01f00793          	li	a5,31
    e718:	1907c463          	blt	a5,a6,e8a0 <__subdf3+0x6c8>
    e71c:	02000793          	li	a5,32
    e720:	410787b3          	sub	a5,a5,a6
    e724:	00f71533          	sll	a0,a4,a5
    e728:	0108d6b3          	srl	a3,a7,a6
    e72c:	00f897b3          	sll	a5,a7,a5
    e730:	00d56533          	or	a0,a0,a3
    e734:	00f037b3          	snez	a5,a5
    e738:	01075833          	srl	a6,a4,a6
    e73c:	00f56533          	or	a0,a0,a5
    e740:	410585b3          	sub	a1,a1,a6
    e744:	40ae8533          	sub	a0,t4,a0
    e748:	00aeb733          	sltu	a4,t4,a0
    e74c:	00050493          	mv	s1,a0
    e750:	40e58933          	sub	s2,a1,a4
    e754:	000f0993          	mv	s3,t5
    e758:	b59ff06f          	j	e2b0 <__subdf3+0xd8>
    e75c:	fe078693          	add	a3,a5,-32
    e760:	02000613          	li	a2,32
    e764:	00d5d6b3          	srl	a3,a1,a3
    e768:	00c78a63          	beq	a5,a2,e77c <__subdf3+0x5a4>
    e76c:	04000613          	li	a2,64
    e770:	40f607b3          	sub	a5,a2,a5
    e774:	00f597b3          	sll	a5,a1,a5
    e778:	00feeeb3          	or	t4,t4,a5
    e77c:	01d03533          	snez	a0,t4
    e780:	00d56533          	or	a0,a0,a3
    e784:	b1dff06f          	j	e2a0 <__subdf3+0xc8>
    e788:	ff8006b7          	lui	a3,0xff800
    e78c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e790:	40f987b3          	sub	a5,s3,a5
    e794:	00d77733          	and	a4,a4,a3
    e798:	ef9ff06f          	j	e690 <__subdf3+0x4b8>
    e79c:	00361513          	sll	a0,a2,0x3
    e7a0:	00355513          	srl	a0,a0,0x3
    e7a4:	00058713          	mv	a4,a1
    e7a8:	cd9ff06f          	j	e480 <__subdf3+0x2a8>
    e7ac:	7ff00793          	li	a5,2047
    e7b0:	def686e3          	beq	a3,a5,e59c <__subdf3+0x3c4>
    e7b4:	01d88eb3          	add	t4,a7,t4
    e7b8:	011eb633          	sltu	a2,t4,a7
    e7bc:	00b707b3          	add	a5,a4,a1
    e7c0:	00c787b3          	add	a5,a5,a2
    e7c4:	01f79513          	sll	a0,a5,0x1f
    e7c8:	001ede93          	srl	t4,t4,0x1
    e7cc:	01d564b3          	or	s1,a0,t4
    e7d0:	0017d913          	srl	s2,a5,0x1
    e7d4:	00068993          	mv	s3,a3
    e7d8:	b45ff06f          	j	e31c <__subdf3+0x144>
    e7dc:	411e8633          	sub	a2,t4,a7
    e7e0:	40e587b3          	sub	a5,a1,a4
    e7e4:	00ceb733          	sltu	a4,t4,a2
    e7e8:	00060493          	mv	s1,a2
    e7ec:	40e78933          	sub	s2,a5,a4
    e7f0:	00068413          	mv	s0,a3
    e7f4:	ad1ff06f          	j	e2c4 <__subdf3+0xec>
    e7f8:	00361613          	sll	a2,a2,0x3
    e7fc:	00365513          	srl	a0,a2,0x3
    e800:	00068413          	mv	s0,a3
    e804:	00058713          	mv	a4,a1
    e808:	e39ff06f          	j	e640 <__subdf3+0x468>
    e80c:	e00798e3          	bnez	a5,e61c <__subdf3+0x444>
    e810:	22080663          	beqz	a6,ea3c <__subdf3+0x864>
    e814:	0035d713          	srl	a4,a1,0x3
    e818:	00361613          	sll	a2,a2,0x3
    e81c:	01d59593          	sll	a1,a1,0x1d
    e820:	00b76733          	or	a4,a4,a1
    e824:	00365613          	srl	a2,a2,0x3
    e828:	00c76733          	or	a4,a4,a2
    e82c:	00068413          	mv	s0,a3
    e830:	c61ff06f          	j	e490 <__subdf3+0x2b8>
    e834:	01d88eb3          	add	t4,a7,t4
    e838:	00b705b3          	add	a1,a4,a1
    e83c:	011eb633          	sltu	a2,t4,a7
    e840:	00c58933          	add	s2,a1,a2
    e844:	00891793          	sll	a5,s2,0x8
    e848:	000e8493          	mv	s1,t4
    e84c:	0a07d863          	bgez	a5,e8fc <__subdf3+0x724>
    e850:	00200993          	li	s3,2
    e854:	bddff06f          	j	e430 <__subdf3+0x258>
    e858:	41d88eb3          	sub	t4,a7,t4
    e85c:	40b705b3          	sub	a1,a4,a1
    e860:	01d8b633          	sltu	a2,a7,t4
    e864:	000e8493          	mv	s1,t4
    e868:	40c58933          	sub	s2,a1,a2
    e86c:	00100993          	li	s3,1
    e870:	a41ff06f          	j	e2b0 <__subdf3+0xd8>
    e874:	fe078693          	add	a3,a5,-32
    e878:	02000613          	li	a2,32
    e87c:	00d5d6b3          	srl	a3,a1,a3
    e880:	00c78a63          	beq	a5,a2,e894 <__subdf3+0x6bc>
    e884:	04000613          	li	a2,64
    e888:	40f607b3          	sub	a5,a2,a5
    e88c:	00f597b3          	sll	a5,a1,a5
    e890:	00feeeb3          	or	t4,t4,a5
    e894:	01d03933          	snez	s2,t4
    e898:	00d96933          	or	s2,s2,a3
    e89c:	b71ff06f          	j	e40c <__subdf3+0x234>
    e8a0:	fe080793          	add	a5,a6,-32
    e8a4:	02000693          	li	a3,32
    e8a8:	00f757b3          	srl	a5,a4,a5
    e8ac:	00d80a63          	beq	a6,a3,e8c0 <__subdf3+0x6e8>
    e8b0:	04000693          	li	a3,64
    e8b4:	410686b3          	sub	a3,a3,a6
    e8b8:	00d71733          	sll	a4,a4,a3
    e8bc:	00e8e8b3          	or	a7,a7,a4
    e8c0:	01103533          	snez	a0,a7
    e8c4:	00f56533          	or	a0,a0,a5
    e8c8:	e7dff06f          	j	e744 <__subdf3+0x56c>
    e8cc:	ec0788e3          	beqz	a5,e79c <__subdf3+0x5c4>
    e8d0:	01d5eeb3          	or	t4,a1,t4
    e8d4:	bc0e90e3          	bnez	t4,e494 <__subdf3+0x2bc>
    e8d8:	d49ff06f          	j	e620 <__subdf3+0x448>
    e8dc:	411e8633          	sub	a2,t4,a7
    e8e0:	40e585b3          	sub	a1,a1,a4
    e8e4:	00ceb733          	sltu	a4,t4,a2
    e8e8:	00060493          	mv	s1,a2
    e8ec:	40e58933          	sub	s2,a1,a4
    e8f0:	00068413          	mv	s0,a3
    e8f4:	00100993          	li	s3,1
    e8f8:	9b9ff06f          	j	e2b0 <__subdf3+0xd8>
    e8fc:	00100793          	li	a5,1
    e900:	d11ff06f          	j	e610 <__subdf3+0x438>
    e904:	dc0800e3          	beqz	a6,e6c4 <__subdf3+0x4ec>
    e908:	00361613          	sll	a2,a2,0x3
    e90c:	00365793          	srl	a5,a2,0x3
    e910:	01d59813          	sll	a6,a1,0x1d
    e914:	00959713          	sll	a4,a1,0x9
    e918:	00f86833          	or	a6,a6,a5
    e91c:	00c75713          	srl	a4,a4,0xc
    e920:	00068e13          	mv	t3,a3
    e924:	00000793          	li	a5,0
    e928:	a55ff06f          	j	e37c <__subdf3+0x1a4>
    e92c:	41d88933          	sub	s2,a7,t4
    e930:	0128b7b3          	sltu	a5,a7,s2
    e934:	40b70633          	sub	a2,a4,a1
    e938:	40f60633          	sub	a2,a2,a5
    e93c:	00861793          	sll	a5,a2,0x8
    e940:	0e07d263          	bgez	a5,ea24 <__subdf3+0x84c>
    e944:	411e8633          	sub	a2,t4,a7
    e948:	40e58733          	sub	a4,a1,a4
    e94c:	00cebeb3          	sltu	t4,t4,a2
    e950:	41d70733          	sub	a4,a4,t4
    e954:	00871793          	sll	a5,a4,0x8
    e958:	00060493          	mv	s1,a2
    e95c:	1207de63          	bgez	a5,ea98 <__subdf3+0x8c0>
    e960:	ff8007b7          	lui	a5,0xff800
    e964:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e968:	00f77733          	and	a4,a4,a5
    e96c:	00068413          	mv	s0,a3
    e970:	00100793          	li	a5,1
    e974:	9f1ff06f          	j	e364 <__subdf3+0x18c>
    e978:	00361613          	sll	a2,a2,0x3
    e97c:	00365513          	srl	a0,a2,0x3
    e980:	00058713          	mv	a4,a1
    e984:	cbdff06f          	j	e640 <__subdf3+0x468>
    e988:	00361613          	sll	a2,a2,0x3
    e98c:	00365913          	srl	s2,a2,0x3
    e990:	00058713          	mv	a4,a1
    e994:	cfdff06f          	j	e690 <__subdf3+0x4b8>
    e998:	01d886b3          	add	a3,a7,t4
    e99c:	00b707b3          	add	a5,a4,a1
    e9a0:	0116b633          	sltu	a2,a3,a7
    e9a4:	00c787b3          	add	a5,a5,a2
    e9a8:	00879713          	sll	a4,a5,0x8
    e9ac:	0036d813          	srl	a6,a3,0x3
    e9b0:	08075e63          	bgez	a4,ea4c <__subdf3+0x874>
    e9b4:	ff800737          	lui	a4,0xff800
    e9b8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e9bc:	00e7f7b3          	and	a5,a5,a4
    e9c0:	01d79713          	sll	a4,a5,0x1d
    e9c4:	00979793          	sll	a5,a5,0x9
    e9c8:	01076833          	or	a6,a4,a6
    e9cc:	00c7d713          	srl	a4,a5,0xc
    e9d0:	00100793          	li	a5,1
    e9d4:	9a9ff06f          	j	e37c <__subdf3+0x1a4>
    e9d8:	fe068793          	add	a5,a3,-32
    e9dc:	02000613          	li	a2,32
    e9e0:	00f757b3          	srl	a5,a4,a5
    e9e4:	00c68a63          	beq	a3,a2,e9f8 <__subdf3+0x820>
    e9e8:	04000613          	li	a2,64
    e9ec:	40d606b3          	sub	a3,a2,a3
    e9f0:	00d71733          	sll	a4,a4,a3
    e9f4:	00e8e8b3          	or	a7,a7,a4
    e9f8:	01103933          	snez	s2,a7
    e9fc:	00f96933          	or	s2,s2,a5
    ea00:	b39ff06f          	j	e538 <__subdf3+0x360>
    ea04:	0034d513          	srl	a0,s1,0x3
    ea08:	00098793          	mv	a5,s3
    ea0c:	00090713          	mv	a4,s2
    ea10:	c31ff06f          	j	e640 <__subdf3+0x468>
    ea14:	02000693          	li	a3,32
    ea18:	40f686b3          	sub	a3,a3,a5
    ea1c:	00000613          	li	a2,0
    ea20:	8e9ff06f          	j	e308 <__subdf3+0x130>
    ea24:	00c96833          	or	a6,s2,a2
    ea28:	c8080ee3          	beqz	a6,e6c4 <__subdf3+0x4ec>
    ea2c:	00395913          	srl	s2,s2,0x3
    ea30:	00000793          	li	a5,0
    ea34:	00060713          	mv	a4,a2
    ea38:	c59ff06f          	j	e690 <__subdf3+0x4b8>
    ea3c:	00000e13          	li	t3,0
    ea40:	7ff00793          	li	a5,2047
    ea44:	00080737          	lui	a4,0x80
    ea48:	935ff06f          	j	e37c <__subdf3+0x1a4>
    ea4c:	01d79713          	sll	a4,a5,0x1d
    ea50:	00979793          	sll	a5,a5,0x9
    ea54:	01076833          	or	a6,a4,a6
    ea58:	00c7d713          	srl	a4,a5,0xc
    ea5c:	00000793          	li	a5,0
    ea60:	91dff06f          	j	e37c <__subdf3+0x1a4>
    ea64:	ae0786e3          	beqz	a5,e550 <__subdf3+0x378>
    ea68:	413f0833          	sub	a6,t5,s3
    ea6c:	00080793          	mv	a5,a6
    ea70:	c6098ee3          	beqz	s3,e6ec <__subdf3+0x514>
    ea74:	03800793          	li	a5,56
    ea78:	0107ca63          	blt	a5,a6,ea8c <__subdf3+0x8b4>
    ea7c:	008007b7          	lui	a5,0x800
    ea80:	00f76733          	or	a4,a4,a5
    ea84:	00068413          	mv	s0,a3
    ea88:	c8dff06f          	j	e714 <__subdf3+0x53c>
    ea8c:	00068413          	mv	s0,a3
    ea90:	00100513          	li	a0,1
    ea94:	cb1ff06f          	j	e744 <__subdf3+0x56c>
    ea98:	01d71813          	sll	a6,a4,0x1d
    ea9c:	00365613          	srl	a2,a2,0x3
    eaa0:	00c86833          	or	a6,a6,a2
    eaa4:	00375713          	srl	a4,a4,0x3
    eaa8:	00000793          	li	a5,0
    eaac:	00068413          	mv	s0,a3
    eab0:	ba5ff06f          	j	e654 <__subdf3+0x47c>
    eab4:	ba078ae3          	beqz	a5,e668 <__subdf3+0x490>
    eab8:	413f06b3          	sub	a3,t5,s3
    eabc:	00099663          	bnez	s3,eac8 <__subdf3+0x8f0>
    eac0:	00068793          	mv	a5,a3
    eac4:	a21ff06f          	j	e4e4 <__subdf3+0x30c>
    eac8:	03800793          	li	a5,56
    eacc:	00100913          	li	s2,1
    ead0:	a6d7c4e3          	blt	a5,a3,e538 <__subdf3+0x360>
    ead4:	008007b7          	lui	a5,0x800
    ead8:	00f76733          	or	a4,a4,a5
    eadc:	a2dff06f          	j	e508 <__subdf3+0x330>

0000eae0 <__unorddf2>:
    eae0:	0145d713          	srl	a4,a1,0x14
    eae4:	001007b7          	lui	a5,0x100
    eae8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    eaec:	fff74713          	not	a4,a4
    eaf0:	0146d813          	srl	a6,a3,0x14
    eaf4:	00b7f5b3          	and	a1,a5,a1
    eaf8:	00d7f7b3          	and	a5,a5,a3
    eafc:	01571693          	sll	a3,a4,0x15
    eb00:	7ff87813          	and	a6,a6,2047
    eb04:	02068063          	beqz	a3,eb24 <__unorddf2+0x44>
    eb08:	7ff00713          	li	a4,2047
    eb0c:	00000513          	li	a0,0
    eb10:	00e80463          	beq	a6,a4,eb18 <__unorddf2+0x38>
    eb14:	00008067          	ret
    eb18:	00c7e7b3          	or	a5,a5,a2
    eb1c:	00f03533          	snez	a0,a5
    eb20:	00008067          	ret
    eb24:	00a5e5b3          	or	a1,a1,a0
    eb28:	00100513          	li	a0,1
    eb2c:	fc058ee3          	beqz	a1,eb08 <__unorddf2+0x28>
    eb30:	00008067          	ret

0000eb34 <__fixdfsi>:
    eb34:	0145d793          	srl	a5,a1,0x14
    eb38:	001006b7          	lui	a3,0x100
    eb3c:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    eb40:	7ff7f793          	and	a5,a5,2047
    eb44:	3fe00613          	li	a2,1022
    eb48:	00b77733          	and	a4,a4,a1
    eb4c:	01f5d593          	srl	a1,a1,0x1f
    eb50:	00f65e63          	bge	a2,a5,eb6c <__fixdfsi+0x38>
    eb54:	41d00613          	li	a2,1053
    eb58:	00f65e63          	bge	a2,a5,eb74 <__fixdfsi+0x40>
    eb5c:	80000537          	lui	a0,0x80000
    eb60:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    eb64:	00a58533          	add	a0,a1,a0
    eb68:	00008067          	ret
    eb6c:	00000513          	li	a0,0
    eb70:	00008067          	ret
    eb74:	43300613          	li	a2,1075
    eb78:	40f60633          	sub	a2,a2,a5
    eb7c:	01f00813          	li	a6,31
    eb80:	00d76733          	or	a4,a4,a3
    eb84:	02c85063          	bge	a6,a2,eba4 <__fixdfsi+0x70>
    eb88:	41300693          	li	a3,1043
    eb8c:	40f687b3          	sub	a5,a3,a5
    eb90:	00f75733          	srl	a4,a4,a5
    eb94:	40e00533          	neg	a0,a4
    eb98:	fc059ce3          	bnez	a1,eb70 <__fixdfsi+0x3c>
    eb9c:	00070513          	mv	a0,a4
    eba0:	00008067          	ret
    eba4:	bed78793          	add	a5,a5,-1043
    eba8:	00f71733          	sll	a4,a4,a5
    ebac:	00c55533          	srl	a0,a0,a2
    ebb0:	00a76733          	or	a4,a4,a0
    ebb4:	fe1ff06f          	j	eb94 <__fixdfsi+0x60>

0000ebb8 <__floatsidf>:
    ebb8:	ff010113          	add	sp,sp,-16
    ebbc:	00112623          	sw	ra,12(sp)
    ebc0:	00812423          	sw	s0,8(sp)
    ebc4:	00912223          	sw	s1,4(sp)
    ebc8:	04050a63          	beqz	a0,ec1c <__floatsidf+0x64>
    ebcc:	41f55713          	sra	a4,a0,0x1f
    ebd0:	00a744b3          	xor	s1,a4,a0
    ebd4:	40e484b3          	sub	s1,s1,a4
    ebd8:	00050793          	mv	a5,a0
    ebdc:	00048513          	mv	a0,s1
    ebe0:	01f7d413          	srl	s0,a5,0x1f
    ebe4:	69c000ef          	jal	f280 <__clzsi2>
    ebe8:	41e00793          	li	a5,1054
    ebec:	40a787b3          	sub	a5,a5,a0
    ebf0:	00a00713          	li	a4,10
    ebf4:	7ff7f793          	and	a5,a5,2047
    ebf8:	06a74063          	blt	a4,a0,ec58 <__floatsidf+0xa0>
    ebfc:	00b00713          	li	a4,11
    ec00:	40a70733          	sub	a4,a4,a0
    ec04:	00e4d733          	srl	a4,s1,a4
    ec08:	01550513          	add	a0,a0,21
    ec0c:	00c71713          	sll	a4,a4,0xc
    ec10:	00a494b3          	sll	s1,s1,a0
    ec14:	00c75713          	srl	a4,a4,0xc
    ec18:	0140006f          	j	ec2c <__floatsidf+0x74>
    ec1c:	00000413          	li	s0,0
    ec20:	00000793          	li	a5,0
    ec24:	00000713          	li	a4,0
    ec28:	00000493          	li	s1,0
    ec2c:	01479793          	sll	a5,a5,0x14
    ec30:	01f41413          	sll	s0,s0,0x1f
    ec34:	00e7e7b3          	or	a5,a5,a4
    ec38:	00c12083          	lw	ra,12(sp)
    ec3c:	0087e7b3          	or	a5,a5,s0
    ec40:	00812403          	lw	s0,8(sp)
    ec44:	00048513          	mv	a0,s1
    ec48:	00078593          	mv	a1,a5
    ec4c:	00412483          	lw	s1,4(sp)
    ec50:	01010113          	add	sp,sp,16
    ec54:	00008067          	ret
    ec58:	ff550513          	add	a0,a0,-11
    ec5c:	00a49733          	sll	a4,s1,a0
    ec60:	00c71713          	sll	a4,a4,0xc
    ec64:	00c75713          	srl	a4,a4,0xc
    ec68:	00000493          	li	s1,0
    ec6c:	fc1ff06f          	j	ec2c <__floatsidf+0x74>

0000ec70 <__floatunsidf>:
    ec70:	ff010113          	add	sp,sp,-16
    ec74:	00812423          	sw	s0,8(sp)
    ec78:	00112623          	sw	ra,12(sp)
    ec7c:	00050413          	mv	s0,a0
    ec80:	04050c63          	beqz	a0,ecd8 <__floatunsidf+0x68>
    ec84:	5fc000ef          	jal	f280 <__clzsi2>
    ec88:	41e00793          	li	a5,1054
    ec8c:	40a787b3          	sub	a5,a5,a0
    ec90:	00a00713          	li	a4,10
    ec94:	7ff7f793          	and	a5,a5,2047
    ec98:	06a74463          	blt	a4,a0,ed00 <__floatunsidf+0x90>
    ec9c:	00b00713          	li	a4,11
    eca0:	40a70733          	sub	a4,a4,a0
    eca4:	01550513          	add	a0,a0,21
    eca8:	00e45733          	srl	a4,s0,a4
    ecac:	00a41433          	sll	s0,s0,a0
    ecb0:	00c12083          	lw	ra,12(sp)
    ecb4:	00040513          	mv	a0,s0
    ecb8:	00c71713          	sll	a4,a4,0xc
    ecbc:	00812403          	lw	s0,8(sp)
    ecc0:	00c75713          	srl	a4,a4,0xc
    ecc4:	01479793          	sll	a5,a5,0x14
    ecc8:	00e7e7b3          	or	a5,a5,a4
    eccc:	00078593          	mv	a1,a5
    ecd0:	01010113          	add	sp,sp,16
    ecd4:	00008067          	ret
    ecd8:	00c12083          	lw	ra,12(sp)
    ecdc:	00040513          	mv	a0,s0
    ece0:	00000793          	li	a5,0
    ece4:	00812403          	lw	s0,8(sp)
    ece8:	00000713          	li	a4,0
    ecec:	01479793          	sll	a5,a5,0x14
    ecf0:	00e7e7b3          	or	a5,a5,a4
    ecf4:	00078593          	mv	a1,a5
    ecf8:	01010113          	add	sp,sp,16
    ecfc:	00008067          	ret
    ed00:	ff550513          	add	a0,a0,-11
    ed04:	00a41733          	sll	a4,s0,a0
    ed08:	00000413          	li	s0,0
    ed0c:	00c12083          	lw	ra,12(sp)
    ed10:	00040513          	mv	a0,s0
    ed14:	00c71713          	sll	a4,a4,0xc
    ed18:	00812403          	lw	s0,8(sp)
    ed1c:	00c75713          	srl	a4,a4,0xc
    ed20:	01479793          	sll	a5,a5,0x14
    ed24:	00e7e7b3          	or	a5,a5,a4
    ed28:	00078593          	mv	a1,a5
    ed2c:	01010113          	add	sp,sp,16
    ed30:	00008067          	ret

0000ed34 <__trunctfdf2>:
    ed34:	00c52583          	lw	a1,12(a0)
    ed38:	00852783          	lw	a5,8(a0)
    ed3c:	00052803          	lw	a6,0(a0)
    ed40:	00452683          	lw	a3,4(a0)
    ed44:	01059613          	sll	a2,a1,0x10
    ed48:	fe010113          	add	sp,sp,-32
    ed4c:	00159713          	sll	a4,a1,0x1
    ed50:	01065613          	srl	a2,a2,0x10
    ed54:	00f12423          	sw	a5,8(sp)
    ed58:	00b12623          	sw	a1,12(sp)
    ed5c:	00f12c23          	sw	a5,24(sp)
    ed60:	01012023          	sw	a6,0(sp)
    ed64:	00d12223          	sw	a3,4(sp)
    ed68:	01012823          	sw	a6,16(sp)
    ed6c:	00d12a23          	sw	a3,20(sp)
    ed70:	00c12e23          	sw	a2,28(sp)
    ed74:	01175713          	srl	a4,a4,0x11
    ed78:	01f5d593          	srl	a1,a1,0x1f
    ed7c:	01010893          	add	a7,sp,16
    ed80:	01c10793          	add	a5,sp,28
    ed84:	00361513          	sll	a0,a2,0x3
    ed88:	ffc7a603          	lw	a2,-4(a5)
    ed8c:	ffc78793          	add	a5,a5,-4
    ed90:	01d65693          	srl	a3,a2,0x1d
    ed94:	00a6e6b3          	or	a3,a3,a0
    ed98:	00d7a223          	sw	a3,4(a5)
    ed9c:	fef894e3          	bne	a7,a5,ed84 <__trunctfdf2+0x50>
    eda0:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    eda4:	00381813          	sll	a6,a6,0x3
    eda8:	01169613          	sll	a2,a3,0x11
    edac:	01012823          	sw	a6,16(sp)
    edb0:	01265613          	srl	a2,a2,0x12
    edb4:	04060263          	beqz	a2,edf8 <__trunctfdf2+0xc4>
    edb8:	ffffc6b7          	lui	a3,0xffffc
    edbc:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    edc0:	00d70733          	add	a4,a4,a3
    edc4:	7fe00693          	li	a3,2046
    edc8:	10e6d463          	bge	a3,a4,eed0 <__trunctfdf2+0x19c>
    edcc:	7ff00793          	li	a5,2047
    edd0:	00000613          	li	a2,0
    edd4:	00000693          	li	a3,0
    edd8:	01479793          	sll	a5,a5,0x14
    eddc:	01f59593          	sll	a1,a1,0x1f
    ede0:	00c7e7b3          	or	a5,a5,a2
    ede4:	00b7e7b3          	or	a5,a5,a1
    ede8:	00068513          	mv	a0,a3
    edec:	00078593          	mv	a1,a5
    edf0:	02010113          	add	sp,sp,32
    edf4:	00008067          	ret
    edf8:	01412603          	lw	a2,20(sp)
    edfc:	01812883          	lw	a7,24(sp)
    ee00:	01c12503          	lw	a0,28(sp)
    ee04:	011666b3          	or	a3,a2,a7
    ee08:	00a6e6b3          	or	a3,a3,a0
    ee0c:	0106e6b3          	or	a3,a3,a6
    ee10:	04071463          	bnez	a4,ee58 <__trunctfdf2+0x124>
    ee14:	14068263          	beqz	a3,ef58 <__trunctfdf2+0x224>
    ee18:	00500693          	li	a3,5
    ee1c:	00000613          	li	a2,0
    ee20:	0036d793          	srl	a5,a3,0x3
    ee24:	01d61693          	sll	a3,a2,0x1d
    ee28:	00f6e6b3          	or	a3,a3,a5
    ee2c:	00961613          	sll	a2,a2,0x9
    ee30:	7ff77793          	and	a5,a4,2047
    ee34:	00c65613          	srl	a2,a2,0xc
    ee38:	01479793          	sll	a5,a5,0x14
    ee3c:	01f59593          	sll	a1,a1,0x1f
    ee40:	00c7e7b3          	or	a5,a5,a2
    ee44:	00b7e7b3          	or	a5,a5,a1
    ee48:	00068513          	mv	a0,a3
    ee4c:	00078593          	mv	a1,a5
    ee50:	02010113          	add	sp,sp,32
    ee54:	00008067          	ret
    ee58:	12068463          	beqz	a3,ef80 <__trunctfdf2+0x24c>
    ee5c:	01c8d793          	srl	a5,a7,0x1c
    ee60:	00451513          	sll	a0,a0,0x4
    ee64:	00a7e7b3          	or	a5,a5,a0
    ee68:	008006b7          	lui	a3,0x800
    ee6c:	00d7f6b3          	and	a3,a5,a3
    ee70:	1c068263          	beqz	a3,f034 <__trunctfdf2+0x300>
    ee74:	ff800737          	lui	a4,0xff800
    ee78:	01c65693          	srl	a3,a2,0x1c
    ee7c:	00489893          	sll	a7,a7,0x4
    ee80:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ee84:	00e7f633          	and	a2,a5,a4
    ee88:	0116e6b3          	or	a3,a3,a7
    ee8c:	004007b7          	lui	a5,0x400
    ee90:	00f66633          	or	a2,a2,a5
    ee94:	ff86f693          	and	a3,a3,-8
    ee98:	00000793          	li	a5,0
    ee9c:	0036d713          	srl	a4,a3,0x3
    eea0:	01d61693          	sll	a3,a2,0x1d
    eea4:	00961613          	sll	a2,a2,0x9
    eea8:	00c65613          	srl	a2,a2,0xc
    eeac:	01479793          	sll	a5,a5,0x14
    eeb0:	01f59593          	sll	a1,a1,0x1f
    eeb4:	00c7e7b3          	or	a5,a5,a2
    eeb8:	00e6e6b3          	or	a3,a3,a4
    eebc:	00b7e7b3          	or	a5,a5,a1
    eec0:	00068513          	mv	a0,a3
    eec4:	00078593          	mv	a1,a5
    eec8:	02010113          	add	sp,sp,32
    eecc:	00008067          	ret
    eed0:	0ce05c63          	blez	a4,efa8 <__trunctfdf2+0x274>
    eed4:	01412783          	lw	a5,20(sp)
    eed8:	01812503          	lw	a0,24(sp)
    eedc:	01c12603          	lw	a2,28(sp)
    eee0:	00479693          	sll	a3,a5,0x4
    eee4:	0106e6b3          	or	a3,a3,a6
    eee8:	01c7d793          	srl	a5,a5,0x1c
    eeec:	00451813          	sll	a6,a0,0x4
    eef0:	00461613          	sll	a2,a2,0x4
    eef4:	01c55513          	srl	a0,a0,0x1c
    eef8:	00d036b3          	snez	a3,a3
    eefc:	0107e7b3          	or	a5,a5,a6
    ef00:	00a66633          	or	a2,a2,a0
    ef04:	00f6e6b3          	or	a3,a3,a5
    ef08:	0076f793          	and	a5,a3,7
    ef0c:	02078063          	beqz	a5,ef2c <__trunctfdf2+0x1f8>
    ef10:	00f6f793          	and	a5,a3,15
    ef14:	00400513          	li	a0,4
    ef18:	00a78a63          	beq	a5,a0,ef2c <__trunctfdf2+0x1f8>
    ef1c:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    ef20:	00d7b6b3          	sltu	a3,a5,a3
    ef24:	00d60633          	add	a2,a2,a3
    ef28:	00078693          	mv	a3,a5
    ef2c:	008007b7          	lui	a5,0x800
    ef30:	00f677b3          	and	a5,a2,a5
    ef34:	ee0786e3          	beqz	a5,ee20 <__trunctfdf2+0xec>
    ef38:	00170713          	add	a4,a4,1
    ef3c:	7ff00793          	li	a5,2047
    ef40:	e8f706e3          	beq	a4,a5,edcc <__trunctfdf2+0x98>
    ef44:	ff8007b7          	lui	a5,0xff800
    ef48:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ef4c:	00f67633          	and	a2,a2,a5
    ef50:	7ff77793          	and	a5,a4,2047
    ef54:	f49ff06f          	j	ee9c <__trunctfdf2+0x168>
    ef58:	00000793          	li	a5,0
    ef5c:	00000613          	li	a2,0
    ef60:	01479793          	sll	a5,a5,0x14
    ef64:	01f59593          	sll	a1,a1,0x1f
    ef68:	00c7e7b3          	or	a5,a5,a2
    ef6c:	00b7e7b3          	or	a5,a5,a1
    ef70:	00068513          	mv	a0,a3
    ef74:	00078593          	mv	a1,a5
    ef78:	02010113          	add	sp,sp,32
    ef7c:	00008067          	ret
    ef80:	7ff00793          	li	a5,2047
    ef84:	00000613          	li	a2,0
    ef88:	01479793          	sll	a5,a5,0x14
    ef8c:	01f59593          	sll	a1,a1,0x1f
    ef90:	00c7e7b3          	or	a5,a5,a2
    ef94:	00b7e7b3          	or	a5,a5,a1
    ef98:	00068513          	mv	a0,a3
    ef9c:	00078593          	mv	a1,a5
    efa0:	02010113          	add	sp,sp,32
    efa4:	00008067          	ret
    efa8:	fcc00693          	li	a3,-52
    efac:	08d74c63          	blt	a4,a3,f044 <__trunctfdf2+0x310>
    efb0:	03d00693          	li	a3,61
    efb4:	40e686b3          	sub	a3,a3,a4
    efb8:	01c12703          	lw	a4,28(sp)
    efbc:	4056de13          	sra	t3,a3,0x5
    efc0:	00080eb7          	lui	t4,0x80
    efc4:	00eeeeb3          	or	t4,t4,a4
    efc8:	002e1513          	sll	a0,t3,0x2
    efcc:	01d12e23          	sw	t4,28(sp)
    efd0:	01f6f693          	and	a3,a3,31
    efd4:	00a88833          	add	a6,a7,a0
    efd8:	00088613          	mv	a2,a7
    efdc:	00000713          	li	a4,0
    efe0:	00062303          	lw	t1,0(a2)
    efe4:	00460613          	add	a2,a2,4
    efe8:	00676733          	or	a4,a4,t1
    efec:	fec81ae3          	bne	a6,a2,efe0 <__trunctfdf2+0x2ac>
    eff0:	00300613          	li	a2,3
    eff4:	41c60633          	sub	a2,a2,t3
    eff8:	04069a63          	bnez	a3,f04c <__trunctfdf2+0x318>
    effc:	00082803          	lw	a6,0(a6)
    f000:	00168693          	add	a3,a3,1
    f004:	00478793          	add	a5,a5,4
    f008:	ff07ae23          	sw	a6,-4(a5)
    f00c:	00d64e63          	blt	a2,a3,f028 <__trunctfdf2+0x2f4>
    f010:	00a78833          	add	a6,a5,a0
    f014:	00082803          	lw	a6,0(a6)
    f018:	00168693          	add	a3,a3,1
    f01c:	00478793          	add	a5,a5,4
    f020:	ff07ae23          	sw	a6,-4(a5)
    f024:	fed656e3          	bge	a2,a3,f010 <__trunctfdf2+0x2dc>
    f028:	00400793          	li	a5,4
    f02c:	41c787b3          	sub	a5,a5,t3
    f030:	0840006f          	j	f0b4 <__trunctfdf2+0x380>
    f034:	00000593          	li	a1,0
    f038:	7ff00793          	li	a5,2047
    f03c:	00080637          	lui	a2,0x80
    f040:	d99ff06f          	j	edd8 <__trunctfdf2+0xa4>
    f044:	00000713          	li	a4,0
    f048:	dd1ff06f          	j	ee18 <__trunctfdf2+0xe4>
    f04c:	02050813          	add	a6,a0,32
    f050:	00280833          	add	a6,a6,sp
    f054:	ff082803          	lw	a6,-16(a6)
    f058:	02000f13          	li	t5,32
    f05c:	40df0f33          	sub	t5,t5,a3
    f060:	01e81833          	sll	a6,a6,t5
    f064:	01076733          	or	a4,a4,a6
    f068:	08060e63          	beqz	a2,f104 <__trunctfdf2+0x3d0>
    f06c:	00261813          	sll	a6,a2,0x2
    f070:	00f80fb3          	add	t6,a6,a5
    f074:	00a88633          	add	a2,a7,a0
    f078:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    f07c:	00462303          	lw	t1,4(a2)
    f080:	00478793          	add	a5,a5,4
    f084:	00d55533          	srl	a0,a0,a3
    f088:	01e31333          	sll	t1,t1,t5
    f08c:	00656533          	or	a0,a0,t1
    f090:	fea7ae23          	sw	a0,-4(a5)
    f094:	00460613          	add	a2,a2,4
    f098:	feff90e3          	bne	t6,a5,f078 <__trunctfdf2+0x344>
    f09c:	00400793          	li	a5,4
    f0a0:	41c787b3          	sub	a5,a5,t3
    f0a4:	02080613          	add	a2,a6,32
    f0a8:	00260633          	add	a2,a2,sp
    f0ac:	00dedeb3          	srl	t4,t4,a3
    f0b0:	ffd62823          	sw	t4,-16(a2)
    f0b4:	00400693          	li	a3,4
    f0b8:	40f686b3          	sub	a3,a3,a5
    f0bc:	00269693          	sll	a3,a3,0x2
    f0c0:	00279793          	sll	a5,a5,0x2
    f0c4:	00800613          	li	a2,8
    f0c8:	00f888b3          	add	a7,a7,a5
    f0cc:	00c6ea63          	bltu	a3,a2,f0e0 <__trunctfdf2+0x3ac>
    f0d0:	0008a023          	sw	zero,0(a7)
    f0d4:	0008a223          	sw	zero,4(a7)
    f0d8:	ff868693          	add	a3,a3,-8
    f0dc:	00888893          	add	a7,a7,8
    f0e0:	00400793          	li	a5,4
    f0e4:	00f6e463          	bltu	a3,a5,f0ec <__trunctfdf2+0x3b8>
    f0e8:	0008a023          	sw	zero,0(a7)
    f0ec:	01012783          	lw	a5,16(sp)
    f0f0:	00e03733          	snez	a4,a4
    f0f4:	01412603          	lw	a2,20(sp)
    f0f8:	00f766b3          	or	a3,a4,a5
    f0fc:	00000713          	li	a4,0
    f100:	e09ff06f          	j	ef08 <__trunctfdf2+0x1d4>
    f104:	00100793          	li	a5,1
    f108:	00000813          	li	a6,0
    f10c:	f99ff06f          	j	f0a4 <__trunctfdf2+0x370>

0000f110 <__mulsi3>:
    f110:	00050613          	mv	a2,a0
    f114:	00000513          	li	a0,0
    f118:	0015f693          	and	a3,a1,1
    f11c:	00068463          	beqz	a3,f124 <__mulsi3+0x14>
    f120:	00c50533          	add	a0,a0,a2
    f124:	0015d593          	srl	a1,a1,0x1
    f128:	00161613          	sll	a2,a2,0x1
    f12c:	fe0596e3          	bnez	a1,f118 <__mulsi3+0x8>
    f130:	00008067          	ret

0000f134 <__muldi3>:
    f134:	ff010113          	add	sp,sp,-16
    f138:	00812423          	sw	s0,8(sp)
    f13c:	00050413          	mv	s0,a0
    f140:	00112623          	sw	ra,12(sp)
    f144:	00060513          	mv	a0,a2
    f148:	00068393          	mv	t2,a3
    f14c:	00040713          	mv	a4,s0
    f150:	00060813          	mv	a6,a2
    f154:	00000793          	li	a5,0
    f158:	00000313          	li	t1,0
    f15c:	00000f13          	li	t5,0
    f160:	01e708b3          	add	a7,a4,t5
    f164:	00187e93          	and	t4,a6,1
    f168:	00f30fb3          	add	t6,t1,a5
    f16c:	01f75e13          	srl	t3,a4,0x1f
    f170:	00185813          	srl	a6,a6,0x1
    f174:	00e8b2b3          	sltu	t0,a7,a4
    f178:	00179793          	sll	a5,a5,0x1
    f17c:	000e8663          	beqz	t4,f188 <__muldi3+0x54>
    f180:	00088f13          	mv	t5,a7
    f184:	01f28333          	add	t1,t0,t6
    f188:	00171713          	sll	a4,a4,0x1
    f18c:	01c7e7b3          	or	a5,a5,t3
    f190:	fc0818e3          	bnez	a6,f160 <__muldi3+0x2c>
    f194:	00058663          	beqz	a1,f1a0 <__muldi3+0x6c>
    f198:	f79ff0ef          	jal	f110 <__mulsi3>
    f19c:	00650333          	add	t1,a0,t1
    f1a0:	00038a63          	beqz	t2,f1b4 <__muldi3+0x80>
    f1a4:	00040513          	mv	a0,s0
    f1a8:	00038593          	mv	a1,t2
    f1ac:	f65ff0ef          	jal	f110 <__mulsi3>
    f1b0:	00650333          	add	t1,a0,t1
    f1b4:	00c12083          	lw	ra,12(sp)
    f1b8:	00812403          	lw	s0,8(sp)
    f1bc:	000f0513          	mv	a0,t5
    f1c0:	00030593          	mv	a1,t1
    f1c4:	01010113          	add	sp,sp,16
    f1c8:	00008067          	ret

0000f1cc <__divsi3>:
    f1cc:	06054063          	bltz	a0,f22c <__umodsi3+0x10>
    f1d0:	0605c663          	bltz	a1,f23c <__umodsi3+0x20>

0000f1d4 <__hidden___udivsi3>:
    f1d4:	00058613          	mv	a2,a1
    f1d8:	00050593          	mv	a1,a0
    f1dc:	fff00513          	li	a0,-1
    f1e0:	02060c63          	beqz	a2,f218 <__hidden___udivsi3+0x44>
    f1e4:	00100693          	li	a3,1
    f1e8:	00b67a63          	bgeu	a2,a1,f1fc <__hidden___udivsi3+0x28>
    f1ec:	00c05863          	blez	a2,f1fc <__hidden___udivsi3+0x28>
    f1f0:	00161613          	sll	a2,a2,0x1
    f1f4:	00169693          	sll	a3,a3,0x1
    f1f8:	feb66ae3          	bltu	a2,a1,f1ec <__hidden___udivsi3+0x18>
    f1fc:	00000513          	li	a0,0
    f200:	00c5e663          	bltu	a1,a2,f20c <__hidden___udivsi3+0x38>
    f204:	40c585b3          	sub	a1,a1,a2
    f208:	00d56533          	or	a0,a0,a3
    f20c:	0016d693          	srl	a3,a3,0x1
    f210:	00165613          	srl	a2,a2,0x1
    f214:	fe0696e3          	bnez	a3,f200 <__hidden___udivsi3+0x2c>
    f218:	00008067          	ret

0000f21c <__umodsi3>:
    f21c:	00008293          	mv	t0,ra
    f220:	fb5ff0ef          	jal	f1d4 <__hidden___udivsi3>
    f224:	00058513          	mv	a0,a1
    f228:	00028067          	jr	t0
    f22c:	40a00533          	neg	a0,a0
    f230:	00b04863          	bgtz	a1,f240 <__umodsi3+0x24>
    f234:	40b005b3          	neg	a1,a1
    f238:	f9dff06f          	j	f1d4 <__hidden___udivsi3>
    f23c:	40b005b3          	neg	a1,a1
    f240:	00008293          	mv	t0,ra
    f244:	f91ff0ef          	jal	f1d4 <__hidden___udivsi3>
    f248:	40a00533          	neg	a0,a0
    f24c:	00028067          	jr	t0

0000f250 <__modsi3>:
    f250:	00008293          	mv	t0,ra
    f254:	0005ca63          	bltz	a1,f268 <__modsi3+0x18>
    f258:	00054c63          	bltz	a0,f270 <__modsi3+0x20>
    f25c:	f79ff0ef          	jal	f1d4 <__hidden___udivsi3>
    f260:	00058513          	mv	a0,a1
    f264:	00028067          	jr	t0
    f268:	40b005b3          	neg	a1,a1
    f26c:	fe0558e3          	bgez	a0,f25c <__modsi3+0xc>
    f270:	40a00533          	neg	a0,a0
    f274:	f61ff0ef          	jal	f1d4 <__hidden___udivsi3>
    f278:	40b00533          	neg	a0,a1
    f27c:	00028067          	jr	t0

0000f280 <__clzsi2>:
    f280:	000107b7          	lui	a5,0x10
    f284:	02f57a63          	bgeu	a0,a5,f2b8 <__clzsi2+0x38>
    f288:	10053793          	sltiu	a5,a0,256
    f28c:	0017b793          	seqz	a5,a5
    f290:	00379793          	sll	a5,a5,0x3
    f294:	02000713          	li	a4,32
    f298:	40f70733          	sub	a4,a4,a5
    f29c:	00f55533          	srl	a0,a0,a5
    f2a0:	00001797          	auipc	a5,0x1
    f2a4:	a4078793          	add	a5,a5,-1472 # fce0 <__clz_tab>
    f2a8:	00a787b3          	add	a5,a5,a0
    f2ac:	0007c503          	lbu	a0,0(a5)
    f2b0:	40a70533          	sub	a0,a4,a0
    f2b4:	00008067          	ret
    f2b8:	010007b7          	lui	a5,0x1000
    f2bc:	02f57463          	bgeu	a0,a5,f2e4 <__clzsi2+0x64>
    f2c0:	01000793          	li	a5,16
    f2c4:	00f55533          	srl	a0,a0,a5
    f2c8:	00001797          	auipc	a5,0x1
    f2cc:	a1878793          	add	a5,a5,-1512 # fce0 <__clz_tab>
    f2d0:	00a787b3          	add	a5,a5,a0
    f2d4:	0007c503          	lbu	a0,0(a5)
    f2d8:	01000713          	li	a4,16
    f2dc:	40a70533          	sub	a0,a4,a0
    f2e0:	00008067          	ret
    f2e4:	01800793          	li	a5,24
    f2e8:	00f55533          	srl	a0,a0,a5
    f2ec:	00001797          	auipc	a5,0x1
    f2f0:	9f478793          	add	a5,a5,-1548 # fce0 <__clz_tab>
    f2f4:	00a787b3          	add	a5,a5,a0
    f2f8:	0007c503          	lbu	a0,0(a5)
    f2fc:	00800713          	li	a4,8
    f300:	40a70533          	sub	a0,a4,a0
    f304:	00008067          	ret
