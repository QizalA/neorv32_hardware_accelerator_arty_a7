
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <__udivdi3+0x5ac>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00002397          	auipc	t2,0x2
      38:	30c38393          	add	t2,t2,780 # 2340 <__crt0_copy_data_src_begin>
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
     10c:	00002417          	auipc	s0,0x2
     110:	fbc40413          	add	s0,s0,-68 # 20c8 <__fini_array_end>
     114:	00002497          	auipc	s1,0x2
     118:	fb448493          	add	s1,s1,-76 # 20c8 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	45460613          	add	a2,a2,1108 # 584 <main>

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
     178:	f5440413          	add	s0,s0,-172 # 20c8 <__fini_array_end>
     17c:	00002497          	auipc	s1,0x2
     180:	f4c48493          	add	s1,s1,-180 # 20c8 <__fini_array_end>

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

000001e4 <genA>:
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
}

/* deterministic int8 data */
static inline int8_t genA(int i,int k){
  int v = (i*7 + k*5 - 9);
     1e4:	00351793          	sll	a5,a0,0x3
     1e8:	40a78533          	sub	a0,a5,a0
     1ec:	00259793          	sll	a5,a1,0x2
     1f0:	00b787b3          	add	a5,a5,a1
     1f4:	00f50533          	add	a0,a0,a5
static inline int8_t genA(int i,int k){
     1f8:	ff010113          	add	sp,sp,-16
  v = ((v%19)+19)%19; /* 0..18 */
     1fc:	01300593          	li	a1,19
     200:	ff750513          	add	a0,a0,-9
static inline int8_t genA(int i,int k){
     204:	00112623          	sw	ra,12(sp)
  v = ((v%19)+19)%19; /* 0..18 */
     208:	691010ef          	jal	2098 <__modsi3>
     20c:	01300593          	li	a1,19
     210:	01350513          	add	a0,a0,19
     214:	685010ef          	jal	2098 <__modsi3>
  return (int8_t)(v - 9); /* -9..+9 */
}
     218:	00c12083          	lw	ra,12(sp)
  return (int8_t)(v - 9); /* -9..+9 */
     21c:	ff750513          	add	a0,a0,-9
}
     220:	01851513          	sll	a0,a0,0x18
     224:	41855513          	sra	a0,a0,0x18
     228:	01010113          	add	sp,sp,16
     22c:	00008067          	ret

00000230 <genB>:
static inline int8_t genB(int k,int j){
  int v = (k*3 - j*5 + 11);
     230:	00151793          	sll	a5,a0,0x1
     234:	00a78533          	add	a0,a5,a0
     238:	00259793          	sll	a5,a1,0x2
     23c:	00b787b3          	add	a5,a5,a1
     240:	40f50533          	sub	a0,a0,a5
static inline int8_t genB(int k,int j){
     244:	ff010113          	add	sp,sp,-16
  v = ((v%21)+21)%21; /* 0..20 */
     248:	01500593          	li	a1,21
     24c:	00b50513          	add	a0,a0,11
static inline int8_t genB(int k,int j){
     250:	00112623          	sw	ra,12(sp)
  v = ((v%21)+21)%21; /* 0..20 */
     254:	645010ef          	jal	2098 <__modsi3>
     258:	01500593          	li	a1,21
     25c:	01550513          	add	a0,a0,21
     260:	639010ef          	jal	2098 <__modsi3>
  return (int8_t)(v - 10); /* -10..+10 */
}
     264:	00c12083          	lw	ra,12(sp)
  return (int8_t)(v - 10); /* -10..+10 */
     268:	ff650513          	add	a0,a0,-10
}
     26c:	01851513          	sll	a0,a0,0x18
     270:	41855513          	sra	a0,a0,0x18
     274:	01010113          	add	sp,sp,16
     278:	00008067          	ret

0000027c <put_str>:
static void put_str(const char* s){ neorv32_uart0_puts(s); }
     27c:	00050593          	mv	a1,a0
     280:	fff50537          	lui	a0,0xfff50
     284:	7650006f          	j	11e8 <neorv32_uart_puts>

00000288 <put_ch>:
static void put_ch(char c){ neorv32_uart0_putc(c); }
     288:	00050593          	mv	a1,a0
     28c:	fff50537          	lui	a0,0xfff50
     290:	7450006f          	j	11d4 <neorv32_uart_putc>

00000294 <put_hex32>:
static void put_hex32(uint32_t x){
     294:	fe010113          	add	sp,sp,-32
     298:	01212823          	sw	s2,16(sp)
     29c:	00050913          	mv	s2,a0
  put_str("0x");
     2a0:	00002537          	lui	a0,0x2
static void put_hex32(uint32_t x){
     2a4:	00912a23          	sw	s1,20(sp)
  put_str("0x");
     2a8:	0c850513          	add	a0,a0,200 # 20c8 <__fini_array_end>
  for(int i=7;i>=0;i--) put_ch(H[(x>>(i*4))&0xF]);
     2ac:	000024b7          	lui	s1,0x2
static void put_hex32(uint32_t x){
     2b0:	00812c23          	sw	s0,24(sp)
     2b4:	01312623          	sw	s3,12(sp)
     2b8:	00112e23          	sw	ra,28(sp)
  put_str("0x");
     2bc:	01c00413          	li	s0,28
     2c0:	fbdff0ef          	jal	27c <put_str>
  for(int i=7;i>=0;i--) put_ch(H[(x>>(i*4))&0xF]);
     2c4:	22c48493          	add	s1,s1,556 # 222c <H.0>
     2c8:	ffc00993          	li	s3,-4
     2cc:	008957b3          	srl	a5,s2,s0
     2d0:	00f7f793          	and	a5,a5,15
     2d4:	00f487b3          	add	a5,s1,a5
     2d8:	0007c503          	lbu	a0,0(a5)
     2dc:	ffc40413          	add	s0,s0,-4
     2e0:	fa9ff0ef          	jal	288 <put_ch>
     2e4:	ff3414e3          	bne	s0,s3,2cc <put_hex32+0x38>
}
     2e8:	01c12083          	lw	ra,28(sp)
     2ec:	01812403          	lw	s0,24(sp)
     2f0:	01412483          	lw	s1,20(sp)
     2f4:	01012903          	lw	s2,16(sp)
     2f8:	00c12983          	lw	s3,12(sp)
     2fc:	02010113          	add	sp,sp,32
     300:	00008067          	ret

00000304 <put_u32_commas>:
  if(v==0){ put_ch('0'); return; }
     304:	08051663          	bnez	a0,390 <put_u32_commas+0x8c>
     308:	03000513          	li	a0,48
     30c:	f7dff06f          	j	288 <put_ch>
    if(cnt==3){ buf[len++]=','; cnt=0; }
     310:	01599c63          	bne	s3,s5,328 <put_u32_commas+0x24>
     314:	01090793          	add	a5,s2,16
     318:	00278933          	add	s2,a5,sp
     31c:	ff690823          	sb	s6,-16(s2)
     320:	00000993          	li	s3,0
     324:	00240913          	add	s2,s0,2
     328:	00050493          	mv	s1,a0
     32c:	00090413          	mv	s0,s2
    buf[len++] = '0' + (v%10u); v/=10u; cnt++;
     330:	00a00593          	li	a1,10
     334:	00048513          	mv	a0,s1
     338:	52d010ef          	jal	2064 <__umodsi3>
     33c:	01040793          	add	a5,s0,16
     340:	03050513          	add	a0,a0,48
     344:	002787b3          	add	a5,a5,sp
     348:	fea78823          	sb	a0,-16(a5)
     34c:	00a00593          	li	a1,10
     350:	00048513          	mv	a0,s1
     354:	00140913          	add	s2,s0,1
     358:	4c5010ef          	jal	201c <__hidden___udivsi3>
     35c:	00198993          	add	s3,s3,1
  while(v){
     360:	fa9a68e3          	bltu	s4,s1,310 <put_u32_commas+0xc>
  for(int i=len-1;i>=0;i--) put_ch(buf[i]);
     364:	06045663          	bgez	s0,3d0 <put_u32_commas+0xcc>
}
     368:	02c12083          	lw	ra,44(sp)
     36c:	02812403          	lw	s0,40(sp)
     370:	02412483          	lw	s1,36(sp)
     374:	02012903          	lw	s2,32(sp)
     378:	01c12983          	lw	s3,28(sp)
     37c:	01812a03          	lw	s4,24(sp)
     380:	01412a83          	lw	s5,20(sp)
     384:	01012b03          	lw	s6,16(sp)
     388:	03010113          	add	sp,sp,48
     38c:	00008067          	ret
static void put_u32_commas(uint32_t v){
     390:	fd010113          	add	sp,sp,-48
     394:	02812423          	sw	s0,40(sp)
     398:	02912223          	sw	s1,36(sp)
     39c:	01312e23          	sw	s3,28(sp)
     3a0:	01412c23          	sw	s4,24(sp)
     3a4:	01512a23          	sw	s5,20(sp)
     3a8:	01612823          	sw	s6,16(sp)
     3ac:	02112623          	sw	ra,44(sp)
     3b0:	03212023          	sw	s2,32(sp)
     3b4:	00050493          	mv	s1,a0
  char buf[16]; int len=0, cnt=0;
     3b8:	00000993          	li	s3,0
     3bc:	00000413          	li	s0,0
  while(v){
     3c0:	00900a13          	li	s4,9
    if(cnt==3){ buf[len++]=','; cnt=0; }
     3c4:	00300a93          	li	s5,3
     3c8:	02c00b13          	li	s6,44
     3cc:	f65ff06f          	j	330 <put_u32_commas+0x2c>
  for(int i=len-1;i>=0;i--) put_ch(buf[i]);
     3d0:	008107b3          	add	a5,sp,s0
     3d4:	0007c503          	lbu	a0,0(a5)
     3d8:	fff40413          	add	s0,s0,-1
     3dc:	eadff0ef          	jal	288 <put_ch>
     3e0:	f85ff06f          	j	364 <put_u32_commas+0x60>

000003e4 <print_kv_u32>:
static void print_kv_u32(const char* key, uint32_t v){
     3e4:	ff010113          	add	sp,sp,-16
     3e8:	00112623          	sw	ra,12(sp)
     3ec:	00812423          	sw	s0,8(sp)
     3f0:	00058413          	mv	s0,a1
  put_str(key); put_str(": "); put_u32_commas(v); put_ch('\n');
     3f4:	e89ff0ef          	jal	27c <put_str>
     3f8:	00002537          	lui	a0,0x2
     3fc:	0cc50513          	add	a0,a0,204 # 20cc <__fini_array_end+0x4>
     400:	e7dff0ef          	jal	27c <put_str>
     404:	00040513          	mv	a0,s0
     408:	efdff0ef          	jal	304 <put_u32_commas>
}
     40c:	00812403          	lw	s0,8(sp)
     410:	00c12083          	lw	ra,12(sp)
  put_str(key); put_str(": "); put_u32_commas(v); put_ch('\n');
     414:	00a00513          	li	a0,10
}
     418:	01010113          	add	sp,sp,16
  put_str(key); put_str(": "); put_u32_commas(v); put_ch('\n');
     41c:	e6dff06f          	j	288 <put_ch>

00000420 <print_speedup_2dp>:
static void print_speedup_2dp(const char* label, uint32_t num, uint32_t den){
     420:	fe010113          	add	sp,sp,-32
     424:	00812c23          	sw	s0,24(sp)
     428:	01212823          	sw	s2,16(sp)
     42c:	00112e23          	sw	ra,28(sp)
     430:	00912a23          	sw	s1,20(sp)
     434:	01312623          	sw	s3,12(sp)
     438:	00050913          	mv	s2,a0
     43c:	00100413          	li	s0,1
     440:	00058513          	mv	a0,a1
     444:	00060463          	beqz	a2,44c <print_speedup_2dp+0x2c>
     448:	00060413          	mv	s0,a2
  uint64_t scaled = (n * 100ull + d/2) / d; /* round to nearest */
     44c:	06400613          	li	a2,100
     450:	00000693          	li	a3,0
     454:	00000593          	li	a1,0
     458:	325010ef          	jal	1f7c <__muldi3>
     45c:	00145713          	srl	a4,s0,0x1
     460:	00050793          	mv	a5,a0
     464:	00e50533          	add	a0,a0,a4
     468:	00f537b3          	sltu	a5,a0,a5
     46c:	00b785b3          	add	a1,a5,a1
     470:	00040613          	mv	a2,s0
     474:	00000693          	li	a3,0
     478:	5dd000ef          	jal	1254 <__udivdi3>
  uint32_t frac  = (uint32_t)(scaled % 100ull);
     47c:	06400613          	li	a2,100
     480:	00000693          	li	a3,0
  uint64_t scaled = (n * 100ull + d/2) / d; /* round to nearest */
     484:	00050993          	mv	s3,a0
     488:	00058493          	mv	s1,a1
  uint32_t frac  = (uint32_t)(scaled % 100ull);
     48c:	474010ef          	jal	1900 <__umoddi3>
     490:	00050413          	mv	s0,a0
  put_str(label); put_str(": ");
     494:	00090513          	mv	a0,s2
     498:	de5ff0ef          	jal	27c <put_str>
     49c:	00002537          	lui	a0,0x2
     4a0:	0cc50513          	add	a0,a0,204 # 20cc <__fini_array_end+0x4>
     4a4:	dd9ff0ef          	jal	27c <put_str>
  uint32_t whole = (uint32_t)(scaled / 100ull);
     4a8:	06400613          	li	a2,100
     4ac:	00000693          	li	a3,0
     4b0:	00098513          	mv	a0,s3
     4b4:	00048593          	mv	a1,s1
     4b8:	59d000ef          	jal	1254 <__udivdi3>
  put_u32_commas(whole); put_ch('.');
     4bc:	e49ff0ef          	jal	304 <put_u32_commas>
     4c0:	02e00513          	li	a0,46
     4c4:	dc5ff0ef          	jal	288 <put_ch>
  put_ch('0' + (frac/10)); put_ch('0' + (frac%10));
     4c8:	00a00593          	li	a1,10
     4cc:	00040513          	mv	a0,s0
     4d0:	34d010ef          	jal	201c <__hidden___udivsi3>
     4d4:	03050513          	add	a0,a0,48
     4d8:	0ff57513          	zext.b	a0,a0
     4dc:	dadff0ef          	jal	288 <put_ch>
     4e0:	00a00593          	li	a1,10
     4e4:	00040513          	mv	a0,s0
     4e8:	37d010ef          	jal	2064 <__umodsi3>
     4ec:	03050513          	add	a0,a0,48
     4f0:	0ff57513          	zext.b	a0,a0
     4f4:	d95ff0ef          	jal	288 <put_ch>
  put_ch('x'); put_ch('\n');
     4f8:	07800513          	li	a0,120
     4fc:	d8dff0ef          	jal	288 <put_ch>
}
     500:	01812403          	lw	s0,24(sp)
     504:	01c12083          	lw	ra,28(sp)
     508:	01412483          	lw	s1,20(sp)
     50c:	01012903          	lw	s2,16(sp)
     510:	00c12983          	lw	s3,12(sp)
  put_ch('x'); put_ch('\n');
     514:	00a00513          	li	a0,10
}
     518:	02010113          	add	sp,sp,32
  put_ch('x'); put_ch('\n');
     51c:	d6dff06f          	j	288 <put_ch>

00000520 <put_i32_dec>:
  if(x<0){ put_ch('-'); uint32_t u = (uint32_t)(-x); put_u32_commas(u); }
     520:	02055663          	bgez	a0,54c <put_i32_dec+0x2c>
static void put_i32_dec(int32_t x){
     524:	ff010113          	add	sp,sp,-16
     528:	00812423          	sw	s0,8(sp)
     52c:	00050413          	mv	s0,a0
  if(x<0){ put_ch('-'); uint32_t u = (uint32_t)(-x); put_u32_commas(u); }
     530:	02d00513          	li	a0,45
static void put_i32_dec(int32_t x){
     534:	00112623          	sw	ra,12(sp)
  if(x<0){ put_ch('-'); uint32_t u = (uint32_t)(-x); put_u32_commas(u); }
     538:	d51ff0ef          	jal	288 <put_ch>
     53c:	40800533          	neg	a0,s0
}
     540:	00812403          	lw	s0,8(sp)
     544:	00c12083          	lw	ra,12(sp)
     548:	01010113          	add	sp,sp,16
  else { put_u32_commas((uint32_t)x); }
     54c:	db9ff06f          	j	304 <put_u32_commas>

00000550 <print_line.constprop.0>:
static void print_line(char c, int n){
     550:	ff010113          	add	sp,sp,-16
     554:	00812423          	sw	s0,8(sp)
     558:	00112623          	sw	ra,12(sp)
     55c:	03c00413          	li	s0,60
  for(int i=0;i<n;i++) put_ch(c);
     560:	02d00513          	li	a0,45
     564:	fff40413          	add	s0,s0,-1
     568:	d21ff0ef          	jal	288 <put_ch>
     56c:	fe041ae3          	bnez	s0,560 <print_line.constprop.0+0x10>
}
     570:	00812403          	lw	s0,8(sp)
     574:	00c12083          	lw	ra,12(sp)
  put_ch('\n');
     578:	00a00513          	li	a0,10
}
     57c:	01010113          	add	sp,sp,16
  put_ch('\n');
     580:	d09ff06f          	j	288 <put_ch>

00000584 <main>:
  }
}

/* ==================== Main ==================== */
int main(void){
  neorv32_uart0_setup(BAUD, 0);
     584:	000055b7          	lui	a1,0x5
int main(void){
     588:	f0010113          	add	sp,sp,-256
  neorv32_uart0_setup(BAUD, 0);
     58c:	00000613          	li	a2,0
     590:	b0058593          	add	a1,a1,-1280 # 4b00 <__neorv32_rom_size+0xb00>
     594:	fff50537          	lui	a0,0xfff50
int main(void){
     598:	0e112e23          	sw	ra,252(sp)
     59c:	0e812c23          	sw	s0,248(sp)
     5a0:	0d712e23          	sw	s7,220(sp)
     5a4:	0da12823          	sw	s10,208(sp)
     5a8:	0e912a23          	sw	s1,244(sp)
     5ac:	0f212823          	sw	s2,240(sp)
     5b0:	0f312623          	sw	s3,236(sp)
     5b4:	0f412423          	sw	s4,232(sp)
     5b8:	0f512223          	sw	s5,228(sp)
     5bc:	0f612023          	sw	s6,224(sp)
     5c0:	0d812c23          	sw	s8,216(sp)
     5c4:	0d912a23          	sw	s9,212(sp)
     5c8:	0db12623          	sw	s11,204(sp)
  neorv32_uart0_setup(BAUD, 0);
     5cc:	369000ef          	jal	1134 <neorv32_uart_setup>

  put_str("\n[NEORV32] GEMM i8 — CFS vs SW (4x4 tiling)\n");
     5d0:	00002537          	lui	a0,0x2
     5d4:	0d050513          	add	a0,a0,208 # 20d0 <__fini_array_end+0x8>
     5d8:	ca5ff0ef          	jal	27c <put_str>
  put_str("Config : M="); put_u32_commas(M);
     5dc:	00002537          	lui	a0,0x2
     5e0:	10050513          	add	a0,a0,256 # 2100 <__fini_array_end+0x38>
     5e4:	c99ff0ef          	jal	27c <put_str>
     5e8:	08000513          	li	a0,128
     5ec:	d19ff0ef          	jal	304 <put_u32_commas>
  put_str("  N=");        put_u32_commas(N);
     5f0:	00002537          	lui	a0,0x2
     5f4:	10c50513          	add	a0,a0,268 # 210c <__fini_array_end+0x44>
     5f8:	c85ff0ef          	jal	27c <put_str>
     5fc:	08000513          	li	a0,128
     600:	d05ff0ef          	jal	304 <put_u32_commas>
  put_str("  K=");        put_u32_commas(K);
     604:	00002537          	lui	a0,0x2
     608:	11450513          	add	a0,a0,276 # 2114 <__fini_array_end+0x4c>
     60c:	c71ff0ef          	jal	27c <put_str>
     610:	08000513          	li	a0,128
     614:	cf1ff0ef          	jal	304 <put_u32_commas>
  put_str("  CFS_BASE="); put_hex32(CFS_BASE); put_ch('\n');
     618:	00002537          	lui	a0,0x2
     61c:	11c50513          	add	a0,a0,284 # 211c <__fini_array_end+0x54>
     620:	c5dff0ef          	jal	27c <put_str>
     624:	ffeb0537          	lui	a0,0xffeb0
     628:	c6dff0ef          	jal	294 <put_hex32>
     62c:	00a00513          	li	a0,10
     630:	c59ff0ef          	jal	288 <put_ch>
  print_line('-', 60);
     634:	f1dff0ef          	jal	550 <print_line.constprop.0>
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
  int32_t sample_c0=0, sample_cmid=0, sample_clast=0;
  int32_t sample_d0=0, sample_dmid=0, sample_dlast=0;

  /* --- CFS run --- */
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
     638:	2d5000ef          	jal	110c <neorv32_cpu_get_cycle>
     63c:	02a12e23          	sw	a0,60(sp)
     640:	2e1000ef          	jal	1120 <neorv32_cpu_get_instret>
    REG32_OF(CFS_A1_OFS) = pack4(a10,a11,a12,a13);
     644:	ffeb07b7          	lui	a5,0xffeb0
     648:	00878793          	add	a5,a5,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     64c:	02f12423          	sw	a5,40(sp)
    REG32_OF(CFS_A2_OFS) = pack4(a20,a21,a22,a23);
     650:	ffeb07b7          	lui	a5,0xffeb0
     654:	00c78793          	add	a5,a5,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     658:	02f12623          	sw	a5,44(sp)
    REG32_OF(CFS_A3_OFS) = pack4(a30,a31,a32,a33);
     65c:	ffeb07b7          	lui	a5,0xffeb0
     660:	01078793          	add	a5,a5,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     664:	02f12823          	sw	a5,48(sp)
    REG32_OF(CFS_B0_OFS) = pack4(b00,b01,b02,b03);
     668:	ffeb07b7          	lui	a5,0xffeb0
     66c:	01478793          	add	a5,a5,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     670:	02f12a23          	sw	a5,52(sp)
    REG32_OF(CFS_B1_OFS) = pack4(b10,b11,b12,b13);
     674:	ffeb07b7          	lui	a5,0xffeb0
     678:	01878793          	add	a5,a5,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     67c:	02f12c23          	sw	a5,56(sp)
  h ^= x; h *= 16777619u; return h;
     680:	010007b7          	lui	a5,0x1000
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
     684:	811cad37          	lui	s10,0x811ca
    REG32_OF(CFS_A0_OFS) = pack4(a00,a01,a02,a03);
     688:	ffeb0bb7          	lui	s7,0xffeb0
    REG32_OF(CFS_B2_OFS) = pack4(b20,b21,b22,b23);
     68c:	ffeb0f37          	lui	t5,0xffeb0
    REG32_OF(CFS_B3_OFS) = pack4(b30,b31,b32,b33);
     690:	ffeb0fb7          	lui	t6,0xffeb0
  for(int t=0; t<16; t++) c[t] = (int32_t)REG32_OF(CFS_C_OFS(t));
     694:	ffeb02b7          	lui	t0,0xffeb0
  h ^= x; h *= 16777619u; return h;
     698:	19378793          	add	a5,a5,403 # 1000193 <__neorv32_ram_size+0xf80193>
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
     69c:	04a12023          	sw	a0,64(sp)
  for(int ii=0; ii<M; ii+=4){
     6a0:	00000413          	li	s0,0
  int32_t sample_c0=0, sample_cmid=0, sample_clast=0;
     6a4:	00012c23          	sw	zero,24(sp)
     6a8:	00012e23          	sw	zero,28(sp)
     6ac:	02012223          	sw	zero,36(sp)
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
     6b0:	dc5d0d13          	add	s10,s10,-571 # 811c9dc5 <__crt0_ram_last+0x1149dc6>
    REG32_OF(CFS_A0_OFS) = pack4(a00,a01,a02,a03);
     6b4:	004b8b93          	add	s7,s7,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
    REG32_OF(CFS_B2_OFS) = pack4(b20,b21,b22,b23);
     6b8:	01cf0f13          	add	t5,t5,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
    REG32_OF(CFS_B3_OFS) = pack4(b30,b31,b32,b33);
     6bc:	020f8f93          	add	t6,t6,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
  for(int t=0; t<16; t++) c[t] = (int32_t)REG32_OF(CFS_C_OFS(t));
     6c0:	08028293          	add	t0,t0,128 # ffeb0080 <__crt0_ram_last+0x7fe30081>
  h ^= x; h *= 16777619u; return h;
     6c4:	04f12223          	sw	a5,68(sp)
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     6c8:	00140793          	add	a5,s0,1
     6cc:	00f12023          	sw	a5,0(sp)
    int8_t a20=genA(i0+2,k+0), a21=genA(i0+2,k+1), a22=genA(i0+2,k+2), a23=genA(i0+2,k+3);
     6d0:	00240793          	add	a5,s0,2
     6d4:	00f12223          	sw	a5,4(sp)
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);
     6d8:	00340793          	add	a5,s0,3
    for(int jj=0; jj<N; jj+=4){
     6dc:	00000493          	li	s1,0
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);
     6e0:	00f12423          	sw	a5,8(sp)
  REG32_OF(CFS_CTL_OFS) = CTL_CLEAR; fence_io();
     6e4:	ffeb07b7          	lui	a5,0xffeb0
     6e8:	00200713          	li	a4,2
     6ec:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void fence_io(void){ __asm__ volatile("fence iorw, iorw" ::: "memory"); }
     6f0:	0ff0000f          	fence
    int8_t b10=genB(k+0,j0+1), b11=genB(k+1,j0+1), b12=genB(k+2,j0+1), b13=genB(k+3,j0+1);
     6f4:	00148793          	add	a5,s1,1
     6f8:	00f12623          	sw	a5,12(sp)
    int8_t b20=genB(k+0,j0+2), b21=genB(k+1,j0+2), b22=genB(k+2,j0+2), b23=genB(k+3,j0+2);
     6fc:	00248793          	add	a5,s1,2
     700:	00f12823          	sw	a5,16(sp)
    int8_t b30=genB(k+0,j0+3), b31=genB(k+1,j0+3), b32=genB(k+2,j0+3), b33=genB(k+3,j0+3);
     704:	00348793          	add	a5,s1,3
  for(int k=0; k<K; k+=4){
     708:	00000913          	li	s2,0
    int8_t b30=genB(k+0,j0+3), b31=genB(k+1,j0+3), b32=genB(k+2,j0+3), b33=genB(k+3,j0+3);
     70c:	00f12a23          	sw	a5,20(sp)
    int8_t a00=genA(i0+0,k+0), a01=genA(i0+0,k+1), a02=genA(i0+0,k+2), a03=genA(i0+0,k+3);
     710:	00090593          	mv	a1,s2
     714:	00040513          	mv	a0,s0
     718:	07f12423          	sw	t6,104(sp)
     71c:	07e12223          	sw	t5,100(sp)
     720:	06512623          	sw	t0,108(sp)
     724:	ac1ff0ef          	jal	1e4 <genA>
     728:	06a12023          	sw	a0,96(sp)
     72c:	00190593          	add	a1,s2,1
     730:	00040513          	mv	a0,s0
     734:	ab1ff0ef          	jal	1e4 <genA>
     738:	00290593          	add	a1,s2,2
     73c:	00050b13          	mv	s6,a0
     740:	00040513          	mv	a0,s0
     744:	aa1ff0ef          	jal	1e4 <genA>
     748:	04a12e23          	sw	a0,92(sp)
     74c:	00390593          	add	a1,s2,3
     750:	00040513          	mv	a0,s0
     754:	a91ff0ef          	jal	1e4 <genA>
     758:	04a12c23          	sw	a0,88(sp)
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     75c:	00012503          	lw	a0,0(sp)
     760:	00090593          	mv	a1,s2
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     764:	0ffb7b13          	zext.b	s6,s6
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     768:	a7dff0ef          	jal	1e4 <genA>
     76c:	04a12a23          	sw	a0,84(sp)
     770:	00012503          	lw	a0,0(sp)
     774:	00190593          	add	a1,s2,1
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     778:	008b1b13          	sll	s6,s6,0x8
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     77c:	a69ff0ef          	jal	1e4 <genA>
     780:	00050a93          	mv	s5,a0
     784:	00012503          	lw	a0,0(sp)
     788:	00290593          	add	a1,s2,2
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     78c:	0ffafa93          	zext.b	s5,s5
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     790:	a55ff0ef          	jal	1e4 <genA>
     794:	04a12823          	sw	a0,80(sp)
     798:	00012503          	lw	a0,0(sp)
     79c:	00390593          	add	a1,s2,3
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     7a0:	008a9a93          	sll	s5,s5,0x8
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
     7a4:	a41ff0ef          	jal	1e4 <genA>
     7a8:	04a12623          	sw	a0,76(sp)
    int8_t a20=genA(i0+2,k+0), a21=genA(i0+2,k+1), a22=genA(i0+2,k+2), a23=genA(i0+2,k+3);
     7ac:	00412503          	lw	a0,4(sp)
     7b0:	00090593          	mv	a1,s2
     7b4:	a31ff0ef          	jal	1e4 <genA>
     7b8:	04a12423          	sw	a0,72(sp)
     7bc:	00412503          	lw	a0,4(sp)
     7c0:	00190593          	add	a1,s2,1
     7c4:	a21ff0ef          	jal	1e4 <genA>
     7c8:	00050a13          	mv	s4,a0
     7cc:	00412503          	lw	a0,4(sp)
     7d0:	00290593          	add	a1,s2,2
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     7d4:	0ffa7a13          	zext.b	s4,s4
    int8_t a20=genA(i0+2,k+0), a21=genA(i0+2,k+1), a22=genA(i0+2,k+2), a23=genA(i0+2,k+3);
     7d8:	a0dff0ef          	jal	1e4 <genA>
     7dc:	02a12023          	sw	a0,32(sp)
     7e0:	00412503          	lw	a0,4(sp)
     7e4:	00390593          	add	a1,s2,3
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     7e8:	008a1a13          	sll	s4,s4,0x8
    int8_t a20=genA(i0+2,k+0), a21=genA(i0+2,k+1), a22=genA(i0+2,k+2), a23=genA(i0+2,k+3);
     7ec:	9f9ff0ef          	jal	1e4 <genA>
     7f0:	00050c93          	mv	s9,a0
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);
     7f4:	00812503          	lw	a0,8(sp)
     7f8:	00090593          	mv	a1,s2
     7fc:	9e9ff0ef          	jal	1e4 <genA>
     800:	00050c13          	mv	s8,a0
     804:	00812503          	lw	a0,8(sp)
     808:	00190593          	add	a1,s2,1
     80c:	9d9ff0ef          	jal	1e4 <genA>
     810:	00050993          	mv	s3,a0
     814:	00812503          	lw	a0,8(sp)
     818:	00290593          	add	a1,s2,2
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     81c:	0ff9f993          	zext.b	s3,s3
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);
     820:	9c5ff0ef          	jal	1e4 <genA>
     824:	00050d93          	mv	s11,a0
     828:	00812503          	lw	a0,8(sp)
     82c:	00390593          	add	a1,s2,3
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     830:	0ffdfd93          	zext.b	s11,s11
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);
     834:	9b1ff0ef          	jal	1e4 <genA>
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     838:	05c12683          	lw	a3,92(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     83c:	06012383          	lw	t2,96(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     840:	05812e83          	lw	t4,88(sp)
     844:	0ff6f693          	zext.b	a3,a3
     848:	01069693          	sll	a3,a3,0x10
     84c:	00db6b33          	or	s6,s6,a3
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     850:	0ff3f393          	zext.b	t2,t2
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     854:	007b63b3          	or	t2,s6,t2
     858:	018e9e93          	sll	t4,t4,0x18
     85c:	01d3eeb3          	or	t4,t2,t4
    REG32_OF(CFS_A0_OFS) = pack4(a00,a01,a02,a03);
     860:	01dba023          	sw	t4,0(s7)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     864:	05012703          	lw	a4,80(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     868:	05412e03          	lw	t3,84(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     86c:	04c12303          	lw	t1,76(sp)
     870:	0ff77713          	zext.b	a4,a4
     874:	01071713          	sll	a4,a4,0x10
     878:	00eaeab3          	or	s5,s5,a4
    REG32_OF(CFS_A1_OFS) = pack4(a10,a11,a12,a13);
     87c:	02812783          	lw	a5,40(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     880:	0ffe7e13          	zext.b	t3,t3
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     884:	01caee33          	or	t3,s5,t3
     888:	01831313          	sll	t1,t1,0x18
     88c:	006e6333          	or	t1,t3,t1
    REG32_OF(CFS_A1_OFS) = pack4(a10,a11,a12,a13);
     890:	0067a023          	sw	t1,0(a5)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     894:	02012783          	lw	a5,32(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     898:	04812883          	lw	a7,72(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     89c:	018c9813          	sll	a6,s9,0x18
     8a0:	0ff7f793          	zext.b	a5,a5
     8a4:	01079793          	sll	a5,a5,0x10
     8a8:	00fa6a33          	or	s4,s4,a5
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     8ac:	0ff8f893          	zext.b	a7,a7
    REG32_OF(CFS_A2_OFS) = pack4(a20,a21,a22,a23);
     8b0:	02c12783          	lw	a5,44(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     8b4:	011a68b3          	or	a7,s4,a7
     8b8:	0108e833          	or	a6,a7,a6
     8bc:	010d9d93          	sll	s11,s11,0x10
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     8c0:	00899993          	sll	s3,s3,0x8
    REG32_OF(CFS_A2_OFS) = pack4(a20,a21,a22,a23);
     8c4:	0107a023          	sw	a6,0(a5)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     8c8:	01b9e9b3          	or	s3,s3,s11
    REG32_OF(CFS_A3_OFS) = pack4(a30,a31,a32,a33);
     8cc:	03012783          	lw	a5,48(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     8d0:	0ffc7613          	zext.b	a2,s8
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     8d4:	00c9e633          	or	a2,s3,a2
     8d8:	01851513          	sll	a0,a0,0x18
     8dc:	00a66633          	or	a2,a2,a0
    REG32_OF(CFS_A3_OFS) = pack4(a30,a31,a32,a33);
     8e0:	00c7a023          	sw	a2,0(a5)
    int8_t b00=genB(k+0,j0+0), b01=genB(k+1,j0+0), b02=genB(k+2,j0+0), b03=genB(k+3,j0+0);
     8e4:	00048593          	mv	a1,s1
     8e8:	00090513          	mv	a0,s2
     8ec:	945ff0ef          	jal	230 <genB>
     8f0:	06a12023          	sw	a0,96(sp)
     8f4:	00048593          	mv	a1,s1
     8f8:	00190513          	add	a0,s2,1
     8fc:	935ff0ef          	jal	230 <genB>
     900:	00048593          	mv	a1,s1
     904:	00050a93          	mv	s5,a0
     908:	00290513          	add	a0,s2,2
     90c:	925ff0ef          	jal	230 <genB>
     910:	04a12e23          	sw	a0,92(sp)
     914:	00048593          	mv	a1,s1
     918:	00390513          	add	a0,s2,3
     91c:	915ff0ef          	jal	230 <genB>
    int8_t b10=genB(k+0,j0+1), b11=genB(k+1,j0+1), b12=genB(k+2,j0+1), b13=genB(k+3,j0+1);
     920:	00c12583          	lw	a1,12(sp)
    int8_t b00=genB(k+0,j0+0), b01=genB(k+1,j0+0), b02=genB(k+2,j0+0), b03=genB(k+3,j0+0);
     924:	04a12c23          	sw	a0,88(sp)
    int8_t b10=genB(k+0,j0+1), b11=genB(k+1,j0+1), b12=genB(k+2,j0+1), b13=genB(k+3,j0+1);
     928:	00090513          	mv	a0,s2
     92c:	905ff0ef          	jal	230 <genB>
     930:	00c12583          	lw	a1,12(sp)
     934:	04a12a23          	sw	a0,84(sp)
     938:	00190513          	add	a0,s2,1
     93c:	8f5ff0ef          	jal	230 <genB>
     940:	00c12583          	lw	a1,12(sp)
     944:	00050a13          	mv	s4,a0
     948:	00290513          	add	a0,s2,2
     94c:	8e5ff0ef          	jal	230 <genB>
     950:	00c12583          	lw	a1,12(sp)
     954:	00050d93          	mv	s11,a0
     958:	00390513          	add	a0,s2,3
     95c:	8d5ff0ef          	jal	230 <genB>
    int8_t b20=genB(k+0,j0+2), b21=genB(k+1,j0+2), b22=genB(k+2,j0+2), b23=genB(k+3,j0+2);
     960:	01012583          	lw	a1,16(sp)
    int8_t b10=genB(k+0,j0+1), b11=genB(k+1,j0+1), b12=genB(k+2,j0+1), b13=genB(k+3,j0+1);
     964:	04a12823          	sw	a0,80(sp)
    int8_t b20=genB(k+0,j0+2), b21=genB(k+1,j0+2), b22=genB(k+2,j0+2), b23=genB(k+3,j0+2);
     968:	00090513          	mv	a0,s2
     96c:	8c5ff0ef          	jal	230 <genB>
     970:	01012583          	lw	a1,16(sp)
     974:	04a12623          	sw	a0,76(sp)
     978:	00190513          	add	a0,s2,1
     97c:	8b5ff0ef          	jal	230 <genB>
     980:	01012583          	lw	a1,16(sp)
     984:	00050993          	mv	s3,a0
     988:	00290513          	add	a0,s2,2
     98c:	8a5ff0ef          	jal	230 <genB>
     990:	01012583          	lw	a1,16(sp)
     994:	00050b13          	mv	s6,a0
     998:	00390513          	add	a0,s2,3
     99c:	895ff0ef          	jal	230 <genB>
    int8_t b30=genB(k+0,j0+3), b31=genB(k+1,j0+3), b32=genB(k+2,j0+3), b33=genB(k+3,j0+3);
     9a0:	01412583          	lw	a1,20(sp)
    int8_t b20=genB(k+0,j0+2), b21=genB(k+1,j0+2), b22=genB(k+2,j0+2), b23=genB(k+3,j0+2);
     9a4:	04a12423          	sw	a0,72(sp)
    int8_t b30=genB(k+0,j0+3), b31=genB(k+1,j0+3), b32=genB(k+2,j0+3), b33=genB(k+3,j0+3);
     9a8:	00090513          	mv	a0,s2
     9ac:	885ff0ef          	jal	230 <genB>
     9b0:	01412583          	lw	a1,20(sp)
     9b4:	02a12023          	sw	a0,32(sp)
     9b8:	00190513          	add	a0,s2,1
     9bc:	875ff0ef          	jal	230 <genB>
     9c0:	01412583          	lw	a1,20(sp)
     9c4:	00050c93          	mv	s9,a0
     9c8:	00290513          	add	a0,s2,2
     9cc:	865ff0ef          	jal	230 <genB>
     9d0:	01412583          	lw	a1,20(sp)
     9d4:	00050c13          	mv	s8,a0
     9d8:	00390513          	add	a0,s2,3
     9dc:	855ff0ef          	jal	230 <genB>
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     9e0:	05c12783          	lw	a5,92(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     9e4:	06012e03          	lw	t3,96(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     9e8:	05812303          	lw	t1,88(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     9ec:	0ffafa93          	zext.b	s5,s5
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     9f0:	0ff7f793          	zext.b	a5,a5
     9f4:	01079793          	sll	a5,a5,0x10
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     9f8:	008a9a93          	sll	s5,s5,0x8
     9fc:	05412883          	lw	a7,84(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a00:	00faeab3          	or	s5,s5,a5
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a04:	0ffe7e13          	zext.b	t3,t3
    REG32_OF(CFS_B0_OFS) = pack4(b00,b01,b02,b03);
     a08:	03412783          	lw	a5,52(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a0c:	05012803          	lw	a6,80(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a10:	04c12603          	lw	a2,76(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a14:	01caee33          	or	t3,s5,t3
     a18:	01831313          	sll	t1,t1,0x18
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a1c:	0ffa7a13          	zext.b	s4,s4
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a20:	0ffdfd93          	zext.b	s11,s11
     a24:	04812683          	lw	a3,72(sp)
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a28:	02012703          	lw	a4,32(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a2c:	006e6333          	or	t1,t3,t1
     a30:	010d9d93          	sll	s11,s11,0x10
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a34:	008a1a13          	sll	s4,s4,0x8
     a38:	0ff9f993          	zext.b	s3,s3
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a3c:	0ffb7b13          	zext.b	s6,s6
    REG32_OF(CFS_B0_OFS) = pack4(b00,b01,b02,b03);
     a40:	0067a023          	sw	t1,0(a5)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a44:	01ba6a33          	or	s4,s4,s11
    REG32_OF(CFS_B1_OFS) = pack4(b10,b11,b12,b13);
     a48:	03812783          	lw	a5,56(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a4c:	010b1b13          	sll	s6,s6,0x10
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a50:	0ff8f893          	zext.b	a7,a7
     a54:	00899993          	sll	s3,s3,0x8
     a58:	0ffcfc93          	zext.b	s9,s9
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a5c:	0ffc7c13          	zext.b	s8,s8
    REG32_OF(CFS_B2_OFS) = pack4(b20,b21,b22,b23);
     a60:	06412f03          	lw	t5,100(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a64:	011a68b3          	or	a7,s4,a7
     a68:	0169e9b3          	or	s3,s3,s6
     a6c:	010c1c13          	sll	s8,s8,0x10
     a70:	01881813          	sll	a6,a6,0x18
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a74:	0ff67613          	zext.b	a2,a2
     a78:	008c9c93          	sll	s9,s9,0x8
    REG32_OF(CFS_B3_OFS) = pack4(b30,b31,b32,b33);
     a7c:	06812f83          	lw	t6,104(sp)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a80:	0108e833          	or	a6,a7,a6
     a84:	00c9e633          	or	a2,s3,a2
     a88:	018cecb3          	or	s9,s9,s8
     a8c:	01869693          	sll	a3,a3,0x18
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
     a90:	0ff77713          	zext.b	a4,a4
    REG32_OF(CFS_B1_OFS) = pack4(b10,b11,b12,b13);
     a94:	0107a023          	sw	a6,0(a5)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     a98:	00d666b3          	or	a3,a2,a3
     a9c:	00ece733          	or	a4,s9,a4
     aa0:	01851513          	sll	a0,a0,0x18
    REG32_OF(CFS_B2_OFS) = pack4(b20,b21,b22,b23);
     aa4:	00df2023          	sw	a3,0(t5)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
     aa8:	00a76733          	or	a4,a4,a0
    REG32_OF(CFS_B3_OFS) = pack4(b30,b31,b32,b33);
     aac:	00efa023          	sw	a4,0(t6)
    REG32_OF(CFS_CTL_OFS) = CTL_START; fence_io();
     ab0:	ffeb07b7          	lui	a5,0xffeb0
     ab4:	00100713          	li	a4,1
     ab8:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void fence_io(void){ __asm__ volatile("fence iorw, iorw" ::: "memory"); }
     abc:	0ff0000f          	fence
  for(int k=0; k<K; k+=4){
     ac0:	08000793          	li	a5,128
     ac4:	00490913          	add	s2,s2,4
     ac8:	06c12283          	lw	t0,108(sp)
     acc:	c4f912e3          	bne	s2,a5,710 <main+0x18c>
     ad0:	08010913          	add	s2,sp,128
     ad4:	ffeb07b7          	lui	a5,0xffeb0
     ad8:	00090713          	mv	a4,s2
     adc:	04078793          	add	a5,a5,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int t=0; t<16; t++) c[t] = (int32_t)REG32_OF(CFS_C_OFS(t));
     ae0:	0007a683          	lw	a3,0(a5)
     ae4:	00478793          	add	a5,a5,4
     ae8:	00470713          	add	a4,a4,4
     aec:	fed72e23          	sw	a3,-4(a4)
     af0:	fe5798e3          	bne	a5,t0,ae0 <main+0x55c>
     af4:	04090993          	add	s3,s2,64
  h ^= x; h *= 16777619u; return h;
     af8:	00092783          	lw	a5,0(s2)
     afc:	04412583          	lw	a1,68(sp)
     b00:	00512a23          	sw	t0,20(sp)
     b04:	00fd47b3          	xor	a5,s10,a5
     b08:	00078513          	mv	a0,a5
     b0c:	01f12823          	sw	t6,16(sp)
     b10:	01e12623          	sw	t5,12(sp)
     b14:	02f12023          	sw	a5,32(sp)
      int32_t c[16];
      cfs_tile_4x4(ii, jj, c);
      for(int t=0;t<16;t++) h_cfs = fnv32_update(h_cfs, (uint32_t)c[t]);
     b18:	00490913          	add	s2,s2,4
  h ^= x; h *= 16777619u; return h;
     b1c:	43c010ef          	jal	1f58 <__mulsi3>
      for(int t=0;t<16;t++) h_cfs = fnv32_update(h_cfs, (uint32_t)c[t]);
     b20:	00c12f03          	lw	t5,12(sp)
     b24:	01012f83          	lw	t6,16(sp)
     b28:	01412283          	lw	t0,20(sp)
  h ^= x; h *= 16777619u; return h;
     b2c:	00050d13          	mv	s10,a0
      for(int t=0;t<16;t++) h_cfs = fnv32_update(h_cfs, (uint32_t)c[t]);
     b30:	fd2994e3          	bne	s3,s2,af8 <main+0x574>
      if(ii==0 && jj==0)                         sample_c0    = c[0];
     b34:	009467b3          	or	a5,s0,s1
     b38:	12079463          	bnez	a5,c60 <main+0x6dc>
     b3c:	08012783          	lw	a5,128(sp)
     b40:	02f12223          	sw	a5,36(sp)
    for(int jj=0; jj<N; jj+=4){
     b44:	00448493          	add	s1,s1,4
     b48:	08000793          	li	a5,128
     b4c:	b8f49ce3          	bne	s1,a5,6e4 <main+0x160>
  for(int ii=0; ii<M; ii+=4){
     b50:	00440413          	add	s0,s0,4
     b54:	b6941ae3          	bne	s0,s1,6c8 <main+0x144>
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_cmid  = c[0];
      if(ii==(M-4) && jj==(N-4))                 sample_clast = c[15];
    }
  }
  t1 = neorv32_cpu_get_cycle(); i1 = neorv32_cpu_get_instret();
     b58:	5b4000ef          	jal	110c <neorv32_cpu_get_cycle>
     b5c:	00050413          	mv	s0,a0
     b60:	5c0000ef          	jal	1120 <neorv32_cpu_get_instret>
  uint32_t cyc_cfs = (uint32_t)(t1 - t0);
     b64:	03c12783          	lw	a5,60(sp)
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
     b68:	811caab7          	lui	s5,0x811ca
  put_str("  C[last]=");          put_i32_dec(sample_clast); put_ch('\n');
  print_line('-', 60);

  /* --- SW run --- */
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
  for(int ii=0; ii<M; ii+=4){
     b6c:	00000b13          	li	s6,0
  uint32_t cyc_cfs = (uint32_t)(t1 - t0);
     b70:	40f407b3          	sub	a5,s0,a5
     b74:	02f12423          	sw	a5,40(sp)
  uint32_t ins_cfs = (uint32_t)(i1 - i0);
     b78:	04012783          	lw	a5,64(sp)
  print_kv_u32("CFS cycles", cyc_cfs);
     b7c:	02812583          	lw	a1,40(sp)
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
     b80:	dc5a8a93          	add	s5,s5,-571 # 811c9dc5 <__crt0_ram_last+0x1149dc6>
  uint32_t ins_cfs = (uint32_t)(i1 - i0);
     b84:	40f507b3          	sub	a5,a0,a5
  print_kv_u32("CFS cycles", cyc_cfs);
     b88:	00002537          	lui	a0,0x2
     b8c:	12850513          	add	a0,a0,296 # 2128 <__fini_array_end+0x60>
  uint32_t ins_cfs = (uint32_t)(i1 - i0);
     b90:	02f12623          	sw	a5,44(sp)
  print_kv_u32("CFS cycles", cyc_cfs);
     b94:	851ff0ef          	jal	3e4 <print_kv_u32>
  print_kv_u32("CFS instret", ins_cfs);
     b98:	02c12583          	lw	a1,44(sp)
     b9c:	00002537          	lui	a0,0x2
     ba0:	13450513          	add	a0,a0,308 # 2134 <__fini_array_end+0x6c>
     ba4:	841ff0ef          	jal	3e4 <print_kv_u32>
  put_str(key); put_str(": "); put_hex32(v); put_ch('\n');
     ba8:	00002537          	lui	a0,0x2
     bac:	14050513          	add	a0,a0,320 # 2140 <__fini_array_end+0x78>
     bb0:	eccff0ef          	jal	27c <put_str>
     bb4:	00002537          	lui	a0,0x2
     bb8:	0cc50513          	add	a0,a0,204 # 20cc <__fini_array_end+0x4>
     bbc:	ec0ff0ef          	jal	27c <put_str>
     bc0:	000d0513          	mv	a0,s10
     bc4:	ed0ff0ef          	jal	294 <put_hex32>
     bc8:	00a00513          	li	a0,10
     bcc:	ebcff0ef          	jal	288 <put_ch>
  put_str("CFS samples: C[0,0]="); put_i32_dec(sample_c0);
     bd0:	00002537          	lui	a0,0x2
     bd4:	14c50513          	add	a0,a0,332 # 214c <__fini_array_end+0x84>
     bd8:	ea4ff0ef          	jal	27c <put_str>
     bdc:	02412503          	lw	a0,36(sp)
     be0:	941ff0ef          	jal	520 <put_i32_dec>
  put_str("  C[mid]=");           put_i32_dec(sample_cmid);
     be4:	00002537          	lui	a0,0x2
     be8:	16450513          	add	a0,a0,356 # 2164 <__fini_array_end+0x9c>
     bec:	e90ff0ef          	jal	27c <put_str>
     bf0:	01c12503          	lw	a0,28(sp)
     bf4:	92dff0ef          	jal	520 <put_i32_dec>
  put_str("  C[last]=");          put_i32_dec(sample_clast); put_ch('\n');
     bf8:	00002537          	lui	a0,0x2
     bfc:	17050513          	add	a0,a0,368 # 2170 <__fini_array_end+0xa8>
     c00:	e7cff0ef          	jal	27c <put_str>
     c04:	01812503          	lw	a0,24(sp)
     c08:	919ff0ef          	jal	520 <put_i32_dec>
     c0c:	00a00513          	li	a0,10
     c10:	e78ff0ef          	jal	288 <put_ch>
  print_line('-', 60);
     c14:	93dff0ef          	jal	550 <print_line.constprop.0>
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
     c18:	4f4000ef          	jal	110c <neorv32_cpu_get_cycle>
     c1c:	04a12823          	sw	a0,80(sp)
     c20:	500000ef          	jal	1120 <neorv32_cpu_get_instret>
  h ^= x; h *= 16777619u; return h;
     c24:	010007b7          	lui	a5,0x1000
     c28:	19378793          	add	a5,a5,403 # 1000193 <__neorv32_ram_size+0xf80193>
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
     c2c:	04a12a23          	sw	a0,84(sp)
  int32_t sample_d0=0, sample_dmid=0, sample_dlast=0;
     c30:	02012223          	sw	zero,36(sp)
     c34:	02012823          	sw	zero,48(sp)
     c38:	02012a23          	sw	zero,52(sp)
  h ^= x; h *= 16777619u; return h;
     c3c:	04f12c23          	sw	a5,88(sp)
    int8_t a0 = genA(i0 + 0, k), a1 = genA(i0 + 1, k), a2 = genA(i0 + 2, k), a3 = genA(i0 + 3, k);
     c40:	001b0793          	add	a5,s6,1
     c44:	02f12c23          	sw	a5,56(sp)
     c48:	002b0793          	add	a5,s6,2
     c4c:	02f12e23          	sw	a5,60(sp)
     c50:	003b0793          	add	a5,s6,3
    for(int jj=0; jj<N; jj+=4){
     c54:	00000b93          	li	s7,0
    int8_t a0 = genA(i0 + 0, k), a1 = genA(i0 + 1, k), a2 = genA(i0 + 2, k), a3 = genA(i0 + 3, k);
     c58:	04f12023          	sw	a5,64(sp)
     c5c:	0580006f          	j	cb4 <main+0x730>
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_cmid  = c[0];
     c60:	04000793          	li	a5,64
     c64:	00f41a63          	bne	s0,a5,c78 <main+0x6f4>
     c68:	ec849ee3          	bne	s1,s0,b44 <main+0x5c0>
     c6c:	08012783          	lw	a5,128(sp)
     c70:	00f12e23          	sw	a5,28(sp)
      if(ii==(M-4) && jj==(N-4))                 sample_clast = c[15];
     c74:	ed1ff06f          	j	b44 <main+0x5c0>
     c78:	07c00793          	li	a5,124
     c7c:	ecf414e3          	bne	s0,a5,b44 <main+0x5c0>
     c80:	ec8492e3          	bne	s1,s0,b44 <main+0x5c0>
     c84:	0bc12783          	lw	a5,188(sp)
     c88:	00f12c23          	sw	a5,24(sp)
     c8c:	eb9ff06f          	j	b44 <main+0x5c0>
      int32_t d[16];
      sw_tile_4x4(ii, jj, d);
      for(int t=0;t<16;t++) h_sw = fnv32_update(h_sw, (uint32_t)d[t]);
      if(ii==0 && jj==0)                         sample_d0    = d[0];
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_dmid  = d[0];
      if(ii==(M-4) && jj==(N-4))                 sample_dlast = d[15];
     c90:	07c00793          	li	a5,124
     c94:	00fb1a63          	bne	s6,a5,ca8 <main+0x724>
     c98:	016b9863          	bne	s7,s6,ca8 <main+0x724>
     c9c:	03012223          	sw	a6,36(sp)
     ca0:	0080006f          	j	ca8 <main+0x724>
      if(ii==0 && jj==0)                         sample_d0    = d[0];
     ca4:	03912a23          	sw	s9,52(sp)
    for(int jj=0; jj<N; jj+=4){
     ca8:	004b8b93          	add	s7,s7,4
     cac:	08000793          	li	a5,128
     cb0:	2efb8863          	beq	s7,a5,fa0 <main+0xa1c>
    int8_t b0 = genB(k, j0 + 0), b1 = genB(k, j0 + 1), b2 = genB(k, j0 + 2), b3 = genB(k, j0 + 3);
     cb4:	001b8793          	add	a5,s7,1
     cb8:	04f12223          	sw	a5,68(sp)
     cbc:	002b8793          	add	a5,s7,2
     cc0:	04f12423          	sw	a5,72(sp)
     cc4:	003b8793          	add	a5,s7,3
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
     cc8:	00000813          	li	a6,0
     ccc:	00000393          	li	t2,0
     cd0:	00000293          	li	t0,0
     cd4:	00000f93          	li	t6,0
     cd8:	00000f13          	li	t5,0
     cdc:	00000e93          	li	t4,0
     ce0:	00000e13          	li	t3,0
     ce4:	00000313          	li	t1,0
     ce8:	00000c13          	li	s8,0
     cec:	00000a13          	li	s4,0
     cf0:	00000993          	li	s3,0
     cf4:	00000913          	li	s2,0
     cf8:	00000d93          	li	s11,0
     cfc:	00000d13          	li	s10,0
     d00:	00000493          	li	s1,0
     d04:	00000c93          	li	s9,0
  for(int k = 0; k < K; k++) {
     d08:	00000413          	li	s0,0
    int8_t b0 = genB(k, j0 + 0), b1 = genB(k, j0 + 1), b2 = genB(k, j0 + 2), b3 = genB(k, j0 + 3);
     d0c:	04f12623          	sw	a5,76(sp)
    int8_t a0 = genA(i0 + 0, k), a1 = genA(i0 + 1, k), a2 = genA(i0 + 2, k), a3 = genA(i0 + 3, k);
     d10:	00040593          	mv	a1,s0
     d14:	000b0513          	mv	a0,s6
     d18:	07012e23          	sw	a6,124(sp)
     d1c:	06712623          	sw	t2,108(sp)
     d20:	06512823          	sw	t0,112(sp)
     d24:	07f12a23          	sw	t6,116(sp)
     d28:	05e12e23          	sw	t5,92(sp)
     d2c:	07d12c23          	sw	t4,120(sp)
     d30:	07c12223          	sw	t3,100(sp)
     d34:	06612023          	sw	t1,96(sp)
     d38:	cacff0ef          	jal	1e4 <genA>
     d3c:	00a12023          	sw	a0,0(sp)
     d40:	03812503          	lw	a0,56(sp)
     d44:	00040593          	mv	a1,s0
     d48:	c9cff0ef          	jal	1e4 <genA>
     d4c:	00a12223          	sw	a0,4(sp)
     d50:	03c12503          	lw	a0,60(sp)
     d54:	00040593          	mv	a1,s0
     d58:	c8cff0ef          	jal	1e4 <genA>
     d5c:	00a12423          	sw	a0,8(sp)
     d60:	04012503          	lw	a0,64(sp)
     d64:	00040593          	mv	a1,s0
     d68:	c7cff0ef          	jal	1e4 <genA>
     d6c:	00a12623          	sw	a0,12(sp)
    int8_t b0 = genB(k, j0 + 0), b1 = genB(k, j0 + 1), b2 = genB(k, j0 + 2), b3 = genB(k, j0 + 3);
     d70:	000b8593          	mv	a1,s7
     d74:	00040513          	mv	a0,s0
     d78:	cb8ff0ef          	jal	230 <genB>
     d7c:	04412583          	lw	a1,68(sp)
     d80:	00a12823          	sw	a0,16(sp)
     d84:	00040513          	mv	a0,s0
     d88:	ca8ff0ef          	jal	230 <genB>
     d8c:	04812583          	lw	a1,72(sp)
     d90:	00a12a23          	sw	a0,20(sp)
     d94:	00040513          	mv	a0,s0
     d98:	c98ff0ef          	jal	230 <genB>
     d9c:	04c12583          	lw	a1,76(sp)
     da0:	00a12c23          	sw	a0,24(sp)
     da4:	00040513          	mv	a0,s0
     da8:	c88ff0ef          	jal	230 <genB>
    d[0] += (int32_t)a0 * b0; d[1] += (int32_t)a0 * b1; d[2] += (int32_t)a0 * b2; d[3] += (int32_t)a0 * b3;
     dac:	01012583          	lw	a1,16(sp)
    int8_t b0 = genB(k, j0 + 0), b1 = genB(k, j0 + 1), b2 = genB(k, j0 + 2), b3 = genB(k, j0 + 3);
     db0:	00a12e23          	sw	a0,28(sp)
    d[0] += (int32_t)a0 * b0; d[1] += (int32_t)a0 * b1; d[2] += (int32_t)a0 * b2; d[3] += (int32_t)a0 * b3;
     db4:	00012503          	lw	a0,0(sp)
  for(int k = 0; k < K; k++) {
     db8:	00140413          	add	s0,s0,1
    d[0] += (int32_t)a0 * b0; d[1] += (int32_t)a0 * b1; d[2] += (int32_t)a0 * b2; d[3] += (int32_t)a0 * b3;
     dbc:	19c010ef          	jal	1f58 <__mulsi3>
     dc0:	01412583          	lw	a1,20(sp)
     dc4:	00ac8cb3          	add	s9,s9,a0
     dc8:	00012503          	lw	a0,0(sp)
     dcc:	18c010ef          	jal	1f58 <__mulsi3>
     dd0:	01812583          	lw	a1,24(sp)
     dd4:	00a484b3          	add	s1,s1,a0
     dd8:	00012503          	lw	a0,0(sp)
     ddc:	17c010ef          	jal	1f58 <__mulsi3>
     de0:	01c12583          	lw	a1,28(sp)
     de4:	00ad0d33          	add	s10,s10,a0
     de8:	00012503          	lw	a0,0(sp)
     dec:	16c010ef          	jal	1f58 <__mulsi3>
    d[4] += (int32_t)a1 * b0; d[5] += (int32_t)a1 * b1; d[6] += (int32_t)a1 * b2; d[7] += (int32_t)a1 * b3;
     df0:	00412583          	lw	a1,4(sp)
    d[0] += (int32_t)a0 * b0; d[1] += (int32_t)a0 * b1; d[2] += (int32_t)a0 * b2; d[3] += (int32_t)a0 * b3;
     df4:	00ad8db3          	add	s11,s11,a0
    d[4] += (int32_t)a1 * b0; d[5] += (int32_t)a1 * b1; d[6] += (int32_t)a1 * b2; d[7] += (int32_t)a1 * b3;
     df8:	01012503          	lw	a0,16(sp)
     dfc:	15c010ef          	jal	1f58 <__mulsi3>
     e00:	00412583          	lw	a1,4(sp)
     e04:	00a90933          	add	s2,s2,a0
     e08:	01412503          	lw	a0,20(sp)
     e0c:	14c010ef          	jal	1f58 <__mulsi3>
     e10:	00412583          	lw	a1,4(sp)
     e14:	00a989b3          	add	s3,s3,a0
     e18:	01812503          	lw	a0,24(sp)
     e1c:	13c010ef          	jal	1f58 <__mulsi3>
     e20:	00412583          	lw	a1,4(sp)
     e24:	00aa0a33          	add	s4,s4,a0
     e28:	01c12503          	lw	a0,28(sp)
     e2c:	12c010ef          	jal	1f58 <__mulsi3>
    d[8] += (int32_t)a2 * b0; d[9] += (int32_t)a2 * b1; d[10] += (int32_t)a2 * b2; d[11] += (int32_t)a2 * b3;
     e30:	00812583          	lw	a1,8(sp)
    d[4] += (int32_t)a1 * b0; d[5] += (int32_t)a1 * b1; d[6] += (int32_t)a1 * b2; d[7] += (int32_t)a1 * b3;
     e34:	00ac0c33          	add	s8,s8,a0
    d[8] += (int32_t)a2 * b0; d[9] += (int32_t)a2 * b1; d[10] += (int32_t)a2 * b2; d[11] += (int32_t)a2 * b3;
     e38:	01012503          	lw	a0,16(sp)
     e3c:	11c010ef          	jal	1f58 <__mulsi3>
     e40:	06012303          	lw	t1,96(sp)
     e44:	00812583          	lw	a1,8(sp)
     e48:	00a30333          	add	t1,t1,a0
     e4c:	01412503          	lw	a0,20(sp)
     e50:	06612423          	sw	t1,104(sp)
     e54:	104010ef          	jal	1f58 <__mulsi3>
     e58:	06412e03          	lw	t3,100(sp)
     e5c:	00812583          	lw	a1,8(sp)
     e60:	00ae0e33          	add	t3,t3,a0
     e64:	01812503          	lw	a0,24(sp)
     e68:	07c12223          	sw	t3,100(sp)
     e6c:	0ec010ef          	jal	1f58 <__mulsi3>
     e70:	07812e83          	lw	t4,120(sp)
     e74:	00812583          	lw	a1,8(sp)
     e78:	00ae8eb3          	add	t4,t4,a0
     e7c:	01c12503          	lw	a0,28(sp)
     e80:	07d12023          	sw	t4,96(sp)
     e84:	0d4010ef          	jal	1f58 <__mulsi3>
     e88:	05c12f03          	lw	t5,92(sp)
    d[12] += (int32_t)a3 * b0; d[13] += (int32_t)a3 * b1; d[14] += (int32_t)a3 * b2; d[15] += (int32_t)a3 * b3;
     e8c:	00c12583          	lw	a1,12(sp)
    d[8] += (int32_t)a2 * b0; d[9] += (int32_t)a2 * b1; d[10] += (int32_t)a2 * b2; d[11] += (int32_t)a2 * b3;
     e90:	00af0f33          	add	t5,t5,a0
    d[12] += (int32_t)a3 * b0; d[13] += (int32_t)a3 * b1; d[14] += (int32_t)a3 * b2; d[15] += (int32_t)a3 * b3;
     e94:	01012503          	lw	a0,16(sp)
    d[8] += (int32_t)a2 * b0; d[9] += (int32_t)a2 * b1; d[10] += (int32_t)a2 * b2; d[11] += (int32_t)a2 * b3;
     e98:	05e12e23          	sw	t5,92(sp)
    d[12] += (int32_t)a3 * b0; d[13] += (int32_t)a3 * b1; d[14] += (int32_t)a3 * b2; d[15] += (int32_t)a3 * b3;
     e9c:	0bc010ef          	jal	1f58 <__mulsi3>
     ea0:	07412f83          	lw	t6,116(sp)
     ea4:	00c12583          	lw	a1,12(sp)
     ea8:	00af8fb3          	add	t6,t6,a0
     eac:	01412503          	lw	a0,20(sp)
     eb0:	01f12423          	sw	t6,8(sp)
     eb4:	0a4010ef          	jal	1f58 <__mulsi3>
     eb8:	07012283          	lw	t0,112(sp)
     ebc:	00c12583          	lw	a1,12(sp)
     ec0:	00a282b3          	add	t0,t0,a0
     ec4:	00512223          	sw	t0,4(sp)
     ec8:	01812503          	lw	a0,24(sp)
     ecc:	08c010ef          	jal	1f58 <__mulsi3>
     ed0:	06c12383          	lw	t2,108(sp)
     ed4:	00c12583          	lw	a1,12(sp)
     ed8:	00a383b3          	add	t2,t2,a0
     edc:	01c12503          	lw	a0,28(sp)
     ee0:	00712023          	sw	t2,0(sp)
     ee4:	074010ef          	jal	1f58 <__mulsi3>
     ee8:	07c12803          	lw	a6,124(sp)
  for(int k = 0; k < K; k++) {
     eec:	08000793          	li	a5,128
     ef0:	00012383          	lw	t2,0(sp)
     ef4:	00412283          	lw	t0,4(sp)
     ef8:	00812f83          	lw	t6,8(sp)
     efc:	05c12f03          	lw	t5,92(sp)
     f00:	06012e83          	lw	t4,96(sp)
     f04:	06412e03          	lw	t3,100(sp)
     f08:	06812303          	lw	t1,104(sp)
    d[12] += (int32_t)a3 * b0; d[13] += (int32_t)a3 * b1; d[14] += (int32_t)a3 * b2; d[15] += (int32_t)a3 * b3;
     f0c:	00a80833          	add	a6,a6,a0
  for(int k = 0; k < K; k++) {
     f10:	e0f410e3          	bne	s0,a5,d10 <main+0x78c>
     f14:	08912223          	sw	s1,132(sp)
     f18:	09912023          	sw	s9,128(sp)
     f1c:	09a12423          	sw	s10,136(sp)
     f20:	09b12623          	sw	s11,140(sp)
     f24:	09212823          	sw	s2,144(sp)
     f28:	09312a23          	sw	s3,148(sp)
     f2c:	09412c23          	sw	s4,152(sp)
     f30:	09812e23          	sw	s8,156(sp)
     f34:	0a612023          	sw	t1,160(sp)
     f38:	0bc12223          	sw	t3,164(sp)
     f3c:	0bd12423          	sw	t4,168(sp)
     f40:	0be12623          	sw	t5,172(sp)
     f44:	0bf12823          	sw	t6,176(sp)
     f48:	0a512a23          	sw	t0,180(sp)
     f4c:	0a712c23          	sw	t2,184(sp)
     f50:	0b012e23          	sw	a6,188(sp)
     f54:	08010493          	add	s1,sp,128
  h ^= x; h *= 16777619u; return h;
     f58:	0004a403          	lw	s0,0(s1)
     f5c:	05812583          	lw	a1,88(sp)
     f60:	01012023          	sw	a6,0(sp)
     f64:	008ac433          	xor	s0,s5,s0
     f68:	00040513          	mv	a0,s0
     f6c:	7ed000ef          	jal	1f58 <__mulsi3>
      for(int t=0;t<16;t++) h_sw = fnv32_update(h_sw, (uint32_t)d[t]);
     f70:	00448493          	add	s1,s1,4
     f74:	0c010793          	add	a5,sp,192
     f78:	00012803          	lw	a6,0(sp)
  h ^= x; h *= 16777619u; return h;
     f7c:	00050a93          	mv	s5,a0
      for(int t=0;t<16;t++) h_sw = fnv32_update(h_sw, (uint32_t)d[t]);
     f80:	fc979ce3          	bne	a5,s1,f58 <main+0x9d4>
      if(ii==0 && jj==0)                         sample_d0    = d[0];
     f84:	017b65b3          	or	a1,s6,s7
     f88:	d0058ee3          	beqz	a1,ca4 <main+0x720>
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_dmid  = d[0];
     f8c:	04000793          	li	a5,64
     f90:	d0fb10e3          	bne	s6,a5,c90 <main+0x70c>
     f94:	d16b9ae3          	bne	s7,s6,ca8 <main+0x724>
     f98:	03912823          	sw	s9,48(sp)
     f9c:	d0dff06f          	j	ca8 <main+0x724>
  for(int ii=0; ii<M; ii+=4){
     fa0:	004b0b13          	add	s6,s6,4
     fa4:	c97b1ee3          	bne	s6,s7,c40 <main+0x6bc>
    }
  }
  t1 = neorv32_cpu_get_cycle(); i1 = neorv32_cpu_get_instret();
     fa8:	164000ef          	jal	110c <neorv32_cpu_get_cycle>
     fac:	00050493          	mv	s1,a0
     fb0:	170000ef          	jal	1120 <neorv32_cpu_get_instret>
  uint32_t cyc_sw = (uint32_t)(t1 - t0);
     fb4:	05012783          	lw	a5,80(sp)
  put_str(key); put_str(": "); put_hex32(v); put_ch('\n');
     fb8:	000029b7          	lui	s3,0x2
  uint32_t cyc_sw = (uint32_t)(t1 - t0);
     fbc:	40f484b3          	sub	s1,s1,a5
  uint32_t ins_sw = (uint32_t)(i1 - i0);
     fc0:	05412783          	lw	a5,84(sp)
  print_kv_u32("SW  cycles", cyc_sw);
     fc4:	00048593          	mv	a1,s1
  uint32_t ins_sw = (uint32_t)(i1 - i0);
     fc8:	40f50933          	sub	s2,a0,a5
  print_kv_u32("SW  cycles", cyc_sw);
     fcc:	00002537          	lui	a0,0x2
     fd0:	17c50513          	add	a0,a0,380 # 217c <__fini_array_end+0xb4>
     fd4:	c10ff0ef          	jal	3e4 <print_kv_u32>
  print_kv_u32("SW  instret", ins_sw);
     fd8:	00002537          	lui	a0,0x2
     fdc:	00090593          	mv	a1,s2
     fe0:	18850513          	add	a0,a0,392 # 2188 <__fini_array_end+0xc0>
     fe4:	c00ff0ef          	jal	3e4 <print_kv_u32>
  put_str(key); put_str(": "); put_hex32(v); put_ch('\n');
     fe8:	00002537          	lui	a0,0x2
     fec:	19450513          	add	a0,a0,404 # 2194 <__fini_array_end+0xcc>
     ff0:	a8cff0ef          	jal	27c <put_str>
     ff4:	0cc98513          	add	a0,s3,204 # 20cc <__fini_array_end+0x4>
     ff8:	a84ff0ef          	jal	27c <put_str>
     ffc:	000a8513          	mv	a0,s5
    1000:	a94ff0ef          	jal	294 <put_hex32>
    1004:	00a00513          	li	a0,10
    1008:	a80ff0ef          	jal	288 <put_ch>
  print_kv_hex("SW  hash", h_sw);
  put_str("SW  samples: D[0,0]="); put_i32_dec(sample_d0);
    100c:	00002537          	lui	a0,0x2
    1010:	1a050513          	add	a0,a0,416 # 21a0 <__fini_array_end+0xd8>
    1014:	a68ff0ef          	jal	27c <put_str>
    1018:	03412503          	lw	a0,52(sp)
    101c:	d04ff0ef          	jal	520 <put_i32_dec>
  put_str("  D[mid]=");            put_i32_dec(sample_dmid);
    1020:	00002537          	lui	a0,0x2
    1024:	1b850513          	add	a0,a0,440 # 21b8 <__fini_array_end+0xf0>
    1028:	a54ff0ef          	jal	27c <put_str>
    102c:	03012503          	lw	a0,48(sp)
    1030:	cf0ff0ef          	jal	520 <put_i32_dec>
  put_str("  D[last]=");           put_i32_dec(sample_dlast); put_ch('\n');
    1034:	00002537          	lui	a0,0x2
    1038:	1c450513          	add	a0,a0,452 # 21c4 <__fini_array_end+0xfc>
    103c:	a40ff0ef          	jal	27c <put_str>
    1040:	02412503          	lw	a0,36(sp)
    1044:	cdcff0ef          	jal	520 <put_i32_dec>
    1048:	00a00513          	li	a0,10
    104c:	a3cff0ef          	jal	288 <put_ch>
  print_line('-', 60);
    1050:	d00ff0ef          	jal	550 <print_line.constprop.0>

  /* --- verdict & speedup (from this run) --- */
  if(h_cfs == h_sw){
    1054:	02012783          	lw	a5,32(sp)
    1058:	00002537          	lui	a0,0x2
  put_str(key); put_str(": "); put_str(value); put_ch('\n');
    105c:	1d050513          	add	a0,a0,464 # 21d0 <__fini_array_end+0x108>
  if(h_cfs == h_sw){
    1060:	08879a63          	bne	a5,s0,10f4 <main+0xb70>
  put_str(key); put_str(": "); put_str(value); put_ch('\n');
    1064:	a18ff0ef          	jal	27c <put_str>
    1068:	0cc98513          	add	a0,s3,204
    106c:	a10ff0ef          	jal	27c <put_str>
    1070:	00002537          	lui	a0,0x2
    1074:	1d850513          	add	a0,a0,472 # 21d8 <__fini_array_end+0x110>
    1078:	a04ff0ef          	jal	27c <put_str>
    107c:	00a00513          	li	a0,10
    1080:	a08ff0ef          	jal	288 <put_ch>
    print_kv_str("Verdict", "PASS (hash match)");
  } else {
    print_kv_str("Verdict", "FAIL (hash mismatch)");
  }
  print_speedup_2dp("Speedup (cycles)",  cyc_sw,  cyc_cfs);
    1084:	02812603          	lw	a2,40(sp)
    1088:	00002537          	lui	a0,0x2
    108c:	00048593          	mv	a1,s1
    1090:	20450513          	add	a0,a0,516 # 2204 <__fini_array_end+0x13c>
    1094:	b8cff0ef          	jal	420 <print_speedup_2dp>
  print_speedup_2dp("Speedup (instret)", ins_sw,  ins_cfs);
    1098:	02c12603          	lw	a2,44(sp)
    109c:	00002537          	lui	a0,0x2
    10a0:	00090593          	mv	a1,s2
    10a4:	21850513          	add	a0,a0,536 # 2218 <__fini_array_end+0x150>
    10a8:	b78ff0ef          	jal	420 <print_speedup_2dp>

  return (h_cfs==h_sw)? 0 : 1;
    10ac:	02012783          	lw	a5,32(sp)
}
    10b0:	0fc12083          	lw	ra,252(sp)
    10b4:	0f412483          	lw	s1,244(sp)
  return (h_cfs==h_sw)? 0 : 1;
    10b8:	40878533          	sub	a0,a5,s0
}
    10bc:	0f812403          	lw	s0,248(sp)
    10c0:	0f012903          	lw	s2,240(sp)
    10c4:	0ec12983          	lw	s3,236(sp)
    10c8:	0e812a03          	lw	s4,232(sp)
    10cc:	0e412a83          	lw	s5,228(sp)
    10d0:	0e012b03          	lw	s6,224(sp)
    10d4:	0dc12b83          	lw	s7,220(sp)
    10d8:	0d812c03          	lw	s8,216(sp)
    10dc:	0d412c83          	lw	s9,212(sp)
    10e0:	0d012d03          	lw	s10,208(sp)
    10e4:	0cc12d83          	lw	s11,204(sp)
    10e8:	00a03533          	snez	a0,a0
    10ec:	10010113          	add	sp,sp,256
    10f0:	00008067          	ret
  put_str(key); put_str(": "); put_str(value); put_ch('\n');
    10f4:	988ff0ef          	jal	27c <put_str>
    10f8:	0cc98513          	add	a0,s3,204
    10fc:	980ff0ef          	jal	27c <put_str>
    1100:	00002537          	lui	a0,0x2
    1104:	1ec50513          	add	a0,a0,492 # 21ec <__fini_array_end+0x124>
    1108:	f71ff06f          	j	1078 <main+0xaf4>

0000110c <neorv32_cpu_get_cycle>:
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    110c:	c80027f3          	rdcycleh	a5
    1110:	c0002573          	rdcycle	a0
    1114:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
    1118:	fef59ae3          	bne	a1,a5,110c <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
    111c:	00008067          	ret

00001120 <neorv32_cpu_get_instret>:
    1120:	c82027f3          	rdinstreth	a5
    1124:	c0202573          	rdinstret	a0
    1128:	c82025f3          	rdinstreth	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_INSTRETH);
    tmp2 = neorv32_cpu_csr_read(CSR_INSTRET);
    tmp3 = neorv32_cpu_csr_read(CSR_INSTRETH);
    if (tmp1 == tmp3) {
    112c:	fef59ae3          	bne	a1,a5,1120 <neorv32_cpu_get_instret>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
    1130:	00008067          	ret

00001134 <neorv32_uart_setup>:
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] baudrate Targeted BAUD rate (e.g. 19200).
 * @param[in] irq_mask Interrupt configuration bit mask (CTRL's irq_* bits).
 **************************************************************************/
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    1134:	ff010113          	add	sp,sp,-16
    1138:	00812423          	sw	s0,8(sp)
    113c:	00912223          	sw	s1,4(sp)
    1140:	00112623          	sw	ra,12(sp)

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
    1144:	00052023          	sw	zero,0(a0)
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
    1148:	fffe07b7          	lui	a5,0xfffe0
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    114c:	00050493          	mv	s1,a0
    1150:	0007a503          	lw	a0,0(a5) # fffe0000 <__crt0_ram_last+0x7ff60001>

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
    1154:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
    1158:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
    115c:	6c1000ef          	jal	201c <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
    1160:	00000713          	li	a4,0
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
    1164:	3fe00693          	li	a3,1022
    1168:	04a6e663          	bltu	a3,a0,11b4 <neorv32_uart_setup+0x80>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    116c:	fff50793          	add	a5,a0,-1
    1170:	000106b7          	lui	a3,0x10
    1174:	fc068693          	add	a3,a3,-64 # ffc0 <__neorv32_rom_size+0xbfc0>
    1178:	00679793          	sll	a5,a5,0x6
    117c:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    1180:	07c006b7          	lui	a3,0x7c00
    1184:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    1188:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    118c:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    1190:	01877713          	and	a4,a4,24
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
}
    1194:	00c12083          	lw	ra,12(sp)
    1198:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    119c:	00e7e7b3          	or	a5,a5,a4
    11a0:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
    11a4:	00f4a023          	sw	a5,0(s1)
}
    11a8:	00412483          	lw	s1,4(sp)
    11ac:	01010113          	add	sp,sp,16
    11b0:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
    11b4:	ffe70793          	add	a5,a4,-2
    11b8:	ffd7f793          	and	a5,a5,-3
    11bc:	00079863          	bnez	a5,11cc <neorv32_uart_setup+0x98>
      baud_div >>= 3;
    11c0:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
    11c4:	00170713          	add	a4,a4,1
    11c8:	fa1ff06f          	j	1168 <neorv32_uart_setup+0x34>
      baud_div >>= 1;
    11cc:	00155513          	srl	a0,a0,0x1
    11d0:	ff5ff06f          	j	11c4 <neorv32_uart_setup+0x90>

000011d4 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    11d4:	00052783          	lw	a5,0(a0)
    11d8:	00a79713          	sll	a4,a5,0xa
    11dc:	fe075ce3          	bgez	a4,11d4 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    11e0:	00b52223          	sw	a1,4(a0)
}
    11e4:	00008067          	ret

000011e8 <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
    11e8:	fe010113          	add	sp,sp,-32
    11ec:	00812c23          	sw	s0,24(sp)
    11f0:	00912a23          	sw	s1,20(sp)
    11f4:	01312623          	sw	s3,12(sp)
    11f8:	00112e23          	sw	ra,28(sp)
    11fc:	01212823          	sw	s2,16(sp)
    1200:	00050493          	mv	s1,a0
    1204:	00058413          	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
    1208:	00a00993          	li	s3,10
  while ((c = *s++)) {
    120c:	00044903          	lbu	s2,0(s0)
    1210:	00140413          	add	s0,s0,1
    1214:	02091063          	bnez	s2,1234 <neorv32_uart_puts+0x4c>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
    1218:	01c12083          	lw	ra,28(sp)
    121c:	01812403          	lw	s0,24(sp)
    1220:	01412483          	lw	s1,20(sp)
    1224:	01012903          	lw	s2,16(sp)
    1228:	00c12983          	lw	s3,12(sp)
    122c:	02010113          	add	sp,sp,32
    1230:	00008067          	ret
    if (c == '\n') {
    1234:	01391863          	bne	s2,s3,1244 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
    1238:	00d00593          	li	a1,13
    123c:	00048513          	mv	a0,s1
    1240:	f95ff0ef          	jal	11d4 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
    1244:	00090593          	mv	a1,s2
    1248:	00048513          	mv	a0,s1
    124c:	f89ff0ef          	jal	11d4 <neorv32_uart_putc>
    1250:	fbdff06f          	j	120c <neorv32_uart_puts+0x24>

00001254 <__udivdi3>:
    1254:	fd010113          	add	sp,sp,-48
    1258:	01312e23          	sw	s3,28(sp)
    125c:	02112623          	sw	ra,44(sp)
    1260:	01612823          	sw	s6,16(sp)
    1264:	00050993          	mv	s3,a0
    1268:	16069663          	bnez	a3,13d4 <__udivdi3+0x180>
    126c:	02812423          	sw	s0,40(sp)
    1270:	01512a23          	sw	s5,20(sp)
    1274:	02912223          	sw	s1,36(sp)
    1278:	03212023          	sw	s2,32(sp)
    127c:	01412c23          	sw	s4,24(sp)
    1280:	00060a93          	mv	s5,a2
    1284:	00050413          	mv	s0,a0
    1288:	1cc5f063          	bgeu	a1,a2,1448 <__udivdi3+0x1f4>
    128c:	000107b7          	lui	a5,0x10
    1290:	00058493          	mv	s1,a1
    1294:	2af66e63          	bltu	a2,a5,1550 <__udivdi3+0x2fc>
    1298:	010007b7          	lui	a5,0x1000
    129c:	01800713          	li	a4,24
    12a0:	00f67463          	bgeu	a2,a5,12a8 <__udivdi3+0x54>
    12a4:	01000713          	li	a4,16
    12a8:	00e656b3          	srl	a3,a2,a4
    12ac:	00001797          	auipc	a5,0x1
    12b0:	f9478793          	add	a5,a5,-108 # 2240 <__clz_tab>
    12b4:	00d787b3          	add	a5,a5,a3
    12b8:	0007c783          	lbu	a5,0(a5)
    12bc:	02000693          	li	a3,32
    12c0:	00e787b3          	add	a5,a5,a4
    12c4:	40f68733          	sub	a4,a3,a5
    12c8:	00f68c63          	beq	a3,a5,12e0 <__udivdi3+0x8c>
    12cc:	00e594b3          	sll	s1,a1,a4
    12d0:	00f9d7b3          	srl	a5,s3,a5
    12d4:	00e61ab3          	sll	s5,a2,a4
    12d8:	0097e4b3          	or	s1,a5,s1
    12dc:	00e99433          	sll	s0,s3,a4
    12e0:	010ada13          	srl	s4,s5,0x10
    12e4:	000a0593          	mv	a1,s4
    12e8:	00048513          	mv	a0,s1
    12ec:	010a9b13          	sll	s6,s5,0x10
    12f0:	52d000ef          	jal	201c <__hidden___udivsi3>
    12f4:	010b5b13          	srl	s6,s6,0x10
    12f8:	00050593          	mv	a1,a0
    12fc:	00050913          	mv	s2,a0
    1300:	000b0513          	mv	a0,s6
    1304:	455000ef          	jal	1f58 <__mulsi3>
    1308:	00050793          	mv	a5,a0
    130c:	000a0593          	mv	a1,s4
    1310:	00048513          	mv	a0,s1
    1314:	00078493          	mv	s1,a5
    1318:	54d000ef          	jal	2064 <__umodsi3>
    131c:	01051513          	sll	a0,a0,0x10
    1320:	01045793          	srl	a5,s0,0x10
    1324:	00a7e7b3          	or	a5,a5,a0
    1328:	0097fc63          	bgeu	a5,s1,1340 <__udivdi3+0xec>
    132c:	00fa87b3          	add	a5,s5,a5
    1330:	fff90713          	add	a4,s2,-1
    1334:	0157e463          	bltu	a5,s5,133c <__udivdi3+0xe8>
    1338:	5a97e863          	bltu	a5,s1,18e8 <__udivdi3+0x694>
    133c:	00070913          	mv	s2,a4
    1340:	409784b3          	sub	s1,a5,s1
    1344:	000a0593          	mv	a1,s4
    1348:	00048513          	mv	a0,s1
    134c:	4d1000ef          	jal	201c <__hidden___udivsi3>
    1350:	00050593          	mv	a1,a0
    1354:	00050993          	mv	s3,a0
    1358:	000b0513          	mv	a0,s6
    135c:	3fd000ef          	jal	1f58 <__mulsi3>
    1360:	00050793          	mv	a5,a0
    1364:	000a0593          	mv	a1,s4
    1368:	00048513          	mv	a0,s1
    136c:	01041413          	sll	s0,s0,0x10
    1370:	00078493          	mv	s1,a5
    1374:	4f1000ef          	jal	2064 <__umodsi3>
    1378:	01051513          	sll	a0,a0,0x10
    137c:	01045413          	srl	s0,s0,0x10
    1380:	00a46433          	or	s0,s0,a0
    1384:	00947c63          	bgeu	s0,s1,139c <__udivdi3+0x148>
    1388:	008a8433          	add	s0,s5,s0
    138c:	fff98793          	add	a5,s3,-1
    1390:	4d546e63          	bltu	s0,s5,186c <__udivdi3+0x618>
    1394:	ffe98993          	add	s3,s3,-2
    1398:	4c947a63          	bgeu	s0,s1,186c <__udivdi3+0x618>
    139c:	01091613          	sll	a2,s2,0x10
    13a0:	01366533          	or	a0,a2,s3
    13a4:	00000b13          	li	s6,0
    13a8:	02812403          	lw	s0,40(sp)
    13ac:	02c12083          	lw	ra,44(sp)
    13b0:	02412483          	lw	s1,36(sp)
    13b4:	02012903          	lw	s2,32(sp)
    13b8:	01812a03          	lw	s4,24(sp)
    13bc:	01412a83          	lw	s5,20(sp)
    13c0:	01c12983          	lw	s3,28(sp)
    13c4:	000b0593          	mv	a1,s6
    13c8:	01012b03          	lw	s6,16(sp)
    13cc:	03010113          	add	sp,sp,48
    13d0:	00008067          	ret
    13d4:	02d5f263          	bgeu	a1,a3,13f8 <__udivdi3+0x1a4>
    13d8:	00000b13          	li	s6,0
    13dc:	00000513          	li	a0,0
    13e0:	02c12083          	lw	ra,44(sp)
    13e4:	01c12983          	lw	s3,28(sp)
    13e8:	000b0593          	mv	a1,s6
    13ec:	01012b03          	lw	s6,16(sp)
    13f0:	03010113          	add	sp,sp,48
    13f4:	00008067          	ret
    13f8:	000107b7          	lui	a5,0x10
    13fc:	26f6ee63          	bltu	a3,a5,1678 <__udivdi3+0x424>
    1400:	01000737          	lui	a4,0x1000
    1404:	01800793          	li	a5,24
    1408:	00e6f463          	bgeu	a3,a4,1410 <__udivdi3+0x1bc>
    140c:	01000793          	li	a5,16
    1410:	00f6d533          	srl	a0,a3,a5
    1414:	00001717          	auipc	a4,0x1
    1418:	e2c70713          	add	a4,a4,-468 # 2240 <__clz_tab>
    141c:	00a70733          	add	a4,a4,a0
    1420:	00074703          	lbu	a4,0(a4)
    1424:	02000513          	li	a0,32
    1428:	00f70733          	add	a4,a4,a5
    142c:	40e50b33          	sub	s6,a0,a4
    1430:	26e51c63          	bne	a0,a4,16a8 <__udivdi3+0x454>
    1434:	46b6ee63          	bltu	a3,a1,18b0 <__udivdi3+0x65c>
    1438:	00c9b533          	sltu	a0,s3,a2
    143c:	00153513          	seqz	a0,a0
    1440:	00000b13          	li	s6,0
    1444:	f9dff06f          	j	13e0 <__udivdi3+0x18c>
    1448:	10060c63          	beqz	a2,1560 <__udivdi3+0x30c>
    144c:	000107b7          	lui	a5,0x10
    1450:	44f67663          	bgeu	a2,a5,189c <__udivdi3+0x648>
    1454:	10063713          	sltiu	a4,a2,256
    1458:	00173713          	seqz	a4,a4
    145c:	00371713          	sll	a4,a4,0x3
    1460:	00e656b3          	srl	a3,a2,a4
    1464:	00001797          	auipc	a5,0x1
    1468:	ddc78793          	add	a5,a5,-548 # 2240 <__clz_tab>
    146c:	00d787b3          	add	a5,a5,a3
    1470:	0007c483          	lbu	s1,0(a5)
    1474:	02000793          	li	a5,32
    1478:	00e484b3          	add	s1,s1,a4
    147c:	40978733          	sub	a4,a5,s1
    1480:	10979463          	bne	a5,s1,1588 <__udivdi3+0x334>
    1484:	01061a13          	sll	s4,a2,0x10
    1488:	40c584b3          	sub	s1,a1,a2
    148c:	01065913          	srl	s2,a2,0x10
    1490:	010a5a13          	srl	s4,s4,0x10
    1494:	00100b13          	li	s6,1
    1498:	00090593          	mv	a1,s2
    149c:	00048513          	mv	a0,s1
    14a0:	37d000ef          	jal	201c <__hidden___udivsi3>
    14a4:	000a0593          	mv	a1,s4
    14a8:	00050993          	mv	s3,a0
    14ac:	2ad000ef          	jal	1f58 <__mulsi3>
    14b0:	00050793          	mv	a5,a0
    14b4:	00090593          	mv	a1,s2
    14b8:	00048513          	mv	a0,s1
    14bc:	00078493          	mv	s1,a5
    14c0:	3a5000ef          	jal	2064 <__umodsi3>
    14c4:	01051513          	sll	a0,a0,0x10
    14c8:	01045793          	srl	a5,s0,0x10
    14cc:	00a7e7b3          	or	a5,a5,a0
    14d0:	0097fc63          	bgeu	a5,s1,14e8 <__udivdi3+0x294>
    14d4:	00fa87b3          	add	a5,s5,a5
    14d8:	fff98713          	add	a4,s3,-1
    14dc:	0157e463          	bltu	a5,s5,14e4 <__udivdi3+0x290>
    14e0:	3e97ee63          	bltu	a5,s1,18dc <__udivdi3+0x688>
    14e4:	00070993          	mv	s3,a4
    14e8:	409784b3          	sub	s1,a5,s1
    14ec:	00090593          	mv	a1,s2
    14f0:	00048513          	mv	a0,s1
    14f4:	329000ef          	jal	201c <__hidden___udivsi3>
    14f8:	000a0593          	mv	a1,s4
    14fc:	00050a13          	mv	s4,a0
    1500:	259000ef          	jal	1f58 <__mulsi3>
    1504:	00050793          	mv	a5,a0
    1508:	00090593          	mv	a1,s2
    150c:	00048513          	mv	a0,s1
    1510:	01041413          	sll	s0,s0,0x10
    1514:	00078493          	mv	s1,a5
    1518:	34d000ef          	jal	2064 <__umodsi3>
    151c:	01051513          	sll	a0,a0,0x10
    1520:	01045413          	srl	s0,s0,0x10
    1524:	00a46433          	or	s0,s0,a0
    1528:	00947e63          	bgeu	s0,s1,1544 <__udivdi3+0x2f0>
    152c:	008a8433          	add	s0,s5,s0
    1530:	fffa0793          	add	a5,s4,-1
    1534:	01546663          	bltu	s0,s5,1540 <__udivdi3+0x2ec>
    1538:	ffea0a13          	add	s4,s4,-2
    153c:	00946463          	bltu	s0,s1,1544 <__udivdi3+0x2f0>
    1540:	00078a13          	mv	s4,a5
    1544:	01099613          	sll	a2,s3,0x10
    1548:	01466533          	or	a0,a2,s4
    154c:	e5dff06f          	j	13a8 <__udivdi3+0x154>
    1550:	10063713          	sltiu	a4,a2,256
    1554:	00173713          	seqz	a4,a4
    1558:	00371713          	sll	a4,a4,0x3
    155c:	d4dff06f          	j	12a8 <__udivdi3+0x54>
    1560:	00000693          	li	a3,0
    1564:	00001797          	auipc	a5,0x1
    1568:	cdc78793          	add	a5,a5,-804 # 2240 <__clz_tab>
    156c:	00d787b3          	add	a5,a5,a3
    1570:	0007c483          	lbu	s1,0(a5)
    1574:	00000713          	li	a4,0
    1578:	02000793          	li	a5,32
    157c:	00e484b3          	add	s1,s1,a4
    1580:	40978733          	sub	a4,a5,s1
    1584:	f09780e3          	beq	a5,s1,1484 <__udivdi3+0x230>
    1588:	00e61ab3          	sll	s5,a2,a4
    158c:	01712623          	sw	s7,12(sp)
    1590:	010ad913          	srl	s2,s5,0x10
    1594:	0095dbb3          	srl	s7,a1,s1
    1598:	00e597b3          	sll	a5,a1,a4
    159c:	0099d4b3          	srl	s1,s3,s1
    15a0:	00090593          	mv	a1,s2
    15a4:	000b8513          	mv	a0,s7
    15a8:	010a9a13          	sll	s4,s5,0x10
    15ac:	00f4e4b3          	or	s1,s1,a5
    15b0:	00e99433          	sll	s0,s3,a4
    15b4:	010a5a13          	srl	s4,s4,0x10
    15b8:	265000ef          	jal	201c <__hidden___udivsi3>
    15bc:	00050593          	mv	a1,a0
    15c0:	00050b13          	mv	s6,a0
    15c4:	000a0513          	mv	a0,s4
    15c8:	191000ef          	jal	1f58 <__mulsi3>
    15cc:	00050993          	mv	s3,a0
    15d0:	00090593          	mv	a1,s2
    15d4:	000b8513          	mv	a0,s7
    15d8:	28d000ef          	jal	2064 <__umodsi3>
    15dc:	01051513          	sll	a0,a0,0x10
    15e0:	0104d793          	srl	a5,s1,0x10
    15e4:	00a7e7b3          	or	a5,a5,a0
    15e8:	0137fe63          	bgeu	a5,s3,1604 <__udivdi3+0x3b0>
    15ec:	00fa87b3          	add	a5,s5,a5
    15f0:	fffb0713          	add	a4,s6,-1
    15f4:	2d57ec63          	bltu	a5,s5,18cc <__udivdi3+0x678>
    15f8:	2d37fa63          	bgeu	a5,s3,18cc <__udivdi3+0x678>
    15fc:	ffeb0b13          	add	s6,s6,-2
    1600:	015787b3          	add	a5,a5,s5
    1604:	413789b3          	sub	s3,a5,s3
    1608:	00090593          	mv	a1,s2
    160c:	00098513          	mv	a0,s3
    1610:	20d000ef          	jal	201c <__hidden___udivsi3>
    1614:	00050593          	mv	a1,a0
    1618:	00050b93          	mv	s7,a0
    161c:	000a0513          	mv	a0,s4
    1620:	139000ef          	jal	1f58 <__mulsi3>
    1624:	00050793          	mv	a5,a0
    1628:	00090593          	mv	a1,s2
    162c:	00098513          	mv	a0,s3
    1630:	01049493          	sll	s1,s1,0x10
    1634:	00078993          	mv	s3,a5
    1638:	22d000ef          	jal	2064 <__umodsi3>
    163c:	01051513          	sll	a0,a0,0x10
    1640:	0104d493          	srl	s1,s1,0x10
    1644:	00a4e4b3          	or	s1,s1,a0
    1648:	0134fe63          	bgeu	s1,s3,1664 <__udivdi3+0x410>
    164c:	009a84b3          	add	s1,s5,s1
    1650:	fffb8793          	add	a5,s7,-1
    1654:	2754e463          	bltu	s1,s5,18bc <__udivdi3+0x668>
    1658:	2734f263          	bgeu	s1,s3,18bc <__udivdi3+0x668>
    165c:	ffeb8b93          	add	s7,s7,-2
    1660:	015484b3          	add	s1,s1,s5
    1664:	010b1b13          	sll	s6,s6,0x10
    1668:	017b6b33          	or	s6,s6,s7
    166c:	413484b3          	sub	s1,s1,s3
    1670:	00c12b83          	lw	s7,12(sp)
    1674:	e25ff06f          	j	1498 <__udivdi3+0x244>
    1678:	1006b793          	sltiu	a5,a3,256
    167c:	0017b793          	seqz	a5,a5
    1680:	00379793          	sll	a5,a5,0x3
    1684:	00f6d533          	srl	a0,a3,a5
    1688:	00001717          	auipc	a4,0x1
    168c:	bb870713          	add	a4,a4,-1096 # 2240 <__clz_tab>
    1690:	00a70733          	add	a4,a4,a0
    1694:	00074703          	lbu	a4,0(a4)
    1698:	02000513          	li	a0,32
    169c:	00f70733          	add	a4,a4,a5
    16a0:	40e50b33          	sub	s6,a0,a4
    16a4:	d8e508e3          	beq	a0,a4,1434 <__udivdi3+0x1e0>
    16a8:	016696b3          	sll	a3,a3,s6
    16ac:	01912223          	sw	s9,4(sp)
    16b0:	00e65cb3          	srl	s9,a2,a4
    16b4:	00dcecb3          	or	s9,s9,a3
    16b8:	01512a23          	sw	s5,20(sp)
    16bc:	01712623          	sw	s7,12(sp)
    16c0:	010cda93          	srl	s5,s9,0x10
    16c4:	00e5dbb3          	srl	s7,a1,a4
    16c8:	016597b3          	sll	a5,a1,s6
    16cc:	00e9d733          	srl	a4,s3,a4
    16d0:	01812423          	sw	s8,8(sp)
    16d4:	000a8593          	mv	a1,s5
    16d8:	000b8513          	mv	a0,s7
    16dc:	010c9c13          	sll	s8,s9,0x10
    16e0:	02812423          	sw	s0,40(sp)
    16e4:	02912223          	sw	s1,36(sp)
    16e8:	03212023          	sw	s2,32(sp)
    16ec:	00f764b3          	or	s1,a4,a5
    16f0:	01661933          	sll	s2,a2,s6
    16f4:	01412c23          	sw	s4,24(sp)
    16f8:	010c5c13          	srl	s8,s8,0x10
    16fc:	121000ef          	jal	201c <__hidden___udivsi3>
    1700:	00050593          	mv	a1,a0
    1704:	00050413          	mv	s0,a0
    1708:	000c0513          	mv	a0,s8
    170c:	04d000ef          	jal	1f58 <__mulsi3>
    1710:	00050a13          	mv	s4,a0
    1714:	000a8593          	mv	a1,s5
    1718:	000b8513          	mv	a0,s7
    171c:	149000ef          	jal	2064 <__umodsi3>
    1720:	01051513          	sll	a0,a0,0x10
    1724:	0104d793          	srl	a5,s1,0x10
    1728:	00a7e7b3          	or	a5,a5,a0
    172c:	0147fe63          	bgeu	a5,s4,1748 <__udivdi3+0x4f4>
    1730:	00fc87b3          	add	a5,s9,a5
    1734:	fff40713          	add	a4,s0,-1
    1738:	1997ee63          	bltu	a5,s9,18d4 <__udivdi3+0x680>
    173c:	1947fc63          	bgeu	a5,s4,18d4 <__udivdi3+0x680>
    1740:	ffe40413          	add	s0,s0,-2
    1744:	019787b3          	add	a5,a5,s9
    1748:	41478a33          	sub	s4,a5,s4
    174c:	000a8593          	mv	a1,s5
    1750:	000a0513          	mv	a0,s4
    1754:	0c9000ef          	jal	201c <__hidden___udivsi3>
    1758:	00050593          	mv	a1,a0
    175c:	00050b93          	mv	s7,a0
    1760:	000c0513          	mv	a0,s8
    1764:	7f4000ef          	jal	1f58 <__mulsi3>
    1768:	00050793          	mv	a5,a0
    176c:	000a8593          	mv	a1,s5
    1770:	000a0513          	mv	a0,s4
    1774:	00078a13          	mv	s4,a5
    1778:	0ed000ef          	jal	2064 <__umodsi3>
    177c:	01049713          	sll	a4,s1,0x10
    1780:	01051513          	sll	a0,a0,0x10
    1784:	01075713          	srl	a4,a4,0x10
    1788:	00a76733          	or	a4,a4,a0
    178c:	01477e63          	bgeu	a4,s4,17a8 <__udivdi3+0x554>
    1790:	00ec8733          	add	a4,s9,a4
    1794:	fffb8793          	add	a5,s7,-1
    1798:	13976663          	bltu	a4,s9,18c4 <__udivdi3+0x670>
    179c:	13477463          	bgeu	a4,s4,18c4 <__udivdi3+0x670>
    17a0:	ffeb8b93          	add	s7,s7,-2
    17a4:	01970733          	add	a4,a4,s9
    17a8:	00010e37          	lui	t3,0x10
    17ac:	01041413          	sll	s0,s0,0x10
    17b0:	01746433          	or	s0,s0,s7
    17b4:	fffe0793          	add	a5,t3,-1 # ffff <__neorv32_rom_size+0xbfff>
    17b8:	00f47833          	and	a6,s0,a5
    17bc:	00f977b3          	and	a5,s2,a5
    17c0:	41470733          	sub	a4,a4,s4
    17c4:	01045e93          	srl	t4,s0,0x10
    17c8:	01095913          	srl	s2,s2,0x10
    17cc:	00080513          	mv	a0,a6
    17d0:	00078593          	mv	a1,a5
    17d4:	784000ef          	jal	1f58 <__mulsi3>
    17d8:	00050313          	mv	t1,a0
    17dc:	00090593          	mv	a1,s2
    17e0:	00080513          	mv	a0,a6
    17e4:	774000ef          	jal	1f58 <__mulsi3>
    17e8:	00050813          	mv	a6,a0
    17ec:	00078593          	mv	a1,a5
    17f0:	000e8513          	mv	a0,t4
    17f4:	764000ef          	jal	1f58 <__mulsi3>
    17f8:	00050893          	mv	a7,a0
    17fc:	00090593          	mv	a1,s2
    1800:	000e8513          	mv	a0,t4
    1804:	754000ef          	jal	1f58 <__mulsi3>
    1808:	01035793          	srl	a5,t1,0x10
    180c:	01180833          	add	a6,a6,a7
    1810:	010787b3          	add	a5,a5,a6
    1814:	0117f463          	bgeu	a5,a7,181c <__udivdi3+0x5c8>
    1818:	01c50533          	add	a0,a0,t3
    181c:	0107d693          	srl	a3,a5,0x10
    1820:	00a686b3          	add	a3,a3,a0
    1824:	06d76863          	bltu	a4,a3,1894 <__udivdi3+0x640>
    1828:	04d70663          	beq	a4,a3,1874 <__udivdi3+0x620>
    182c:	00040513          	mv	a0,s0
    1830:	02812403          	lw	s0,40(sp)
    1834:	02c12083          	lw	ra,44(sp)
    1838:	00000b13          	li	s6,0
    183c:	02412483          	lw	s1,36(sp)
    1840:	02012903          	lw	s2,32(sp)
    1844:	01812a03          	lw	s4,24(sp)
    1848:	01412a83          	lw	s5,20(sp)
    184c:	00c12b83          	lw	s7,12(sp)
    1850:	00812c03          	lw	s8,8(sp)
    1854:	00412c83          	lw	s9,4(sp)
    1858:	01c12983          	lw	s3,28(sp)
    185c:	000b0593          	mv	a1,s6
    1860:	01012b03          	lw	s6,16(sp)
    1864:	03010113          	add	sp,sp,48
    1868:	00008067          	ret
    186c:	00078993          	mv	s3,a5
    1870:	b2dff06f          	j	139c <__udivdi3+0x148>
    1874:	00010737          	lui	a4,0x10
    1878:	fff70713          	add	a4,a4,-1 # ffff <__neorv32_rom_size+0xbfff>
    187c:	00e7f7b3          	and	a5,a5,a4
    1880:	01079793          	sll	a5,a5,0x10
    1884:	00e37333          	and	t1,t1,a4
    1888:	01699533          	sll	a0,s3,s6
    188c:	006787b3          	add	a5,a5,t1
    1890:	f8f57ee3          	bgeu	a0,a5,182c <__udivdi3+0x5d8>
    1894:	fff40513          	add	a0,s0,-1
    1898:	f99ff06f          	j	1830 <__udivdi3+0x5dc>
    189c:	010007b7          	lui	a5,0x1000
    18a0:	04f67a63          	bgeu	a2,a5,18f4 <__udivdi3+0x6a0>
    18a4:	01065693          	srl	a3,a2,0x10
    18a8:	01000713          	li	a4,16
    18ac:	bb9ff06f          	j	1464 <__udivdi3+0x210>
    18b0:	00000b13          	li	s6,0
    18b4:	00100513          	li	a0,1
    18b8:	b29ff06f          	j	13e0 <__udivdi3+0x18c>
    18bc:	00078b93          	mv	s7,a5
    18c0:	da5ff06f          	j	1664 <__udivdi3+0x410>
    18c4:	00078b93          	mv	s7,a5
    18c8:	ee1ff06f          	j	17a8 <__udivdi3+0x554>
    18cc:	00070b13          	mv	s6,a4
    18d0:	d35ff06f          	j	1604 <__udivdi3+0x3b0>
    18d4:	00070413          	mv	s0,a4
    18d8:	e71ff06f          	j	1748 <__udivdi3+0x4f4>
    18dc:	ffe98993          	add	s3,s3,-2
    18e0:	015787b3          	add	a5,a5,s5
    18e4:	c05ff06f          	j	14e8 <__udivdi3+0x294>
    18e8:	ffe90913          	add	s2,s2,-2
    18ec:	015787b3          	add	a5,a5,s5
    18f0:	a51ff06f          	j	1340 <__udivdi3+0xec>
    18f4:	01865693          	srl	a3,a2,0x18
    18f8:	01800713          	li	a4,24
    18fc:	b69ff06f          	j	1464 <__udivdi3+0x210>

00001900 <__umoddi3>:
    1900:	fd010113          	add	sp,sp,-48
    1904:	02112623          	sw	ra,44(sp)
    1908:	00050793          	mv	a5,a0
    190c:	14069663          	bnez	a3,1a58 <__umoddi3+0x158>
    1910:	03212023          	sw	s2,32(sp)
    1914:	01412c23          	sw	s4,24(sp)
    1918:	02812423          	sw	s0,40(sp)
    191c:	02912223          	sw	s1,36(sp)
    1920:	01312e23          	sw	s3,28(sp)
    1924:	01512a23          	sw	s5,20(sp)
    1928:	00060a13          	mv	s4,a2
    192c:	00050913          	mv	s2,a0
    1930:	1ac5f663          	bgeu	a1,a2,1adc <__umoddi3+0x1dc>
    1934:	01612823          	sw	s6,16(sp)
    1938:	00010737          	lui	a4,0x10
    193c:	00058993          	mv	s3,a1
    1940:	28e66063          	bltu	a2,a4,1bc0 <__umoddi3+0x2c0>
    1944:	01000737          	lui	a4,0x1000
    1948:	01800693          	li	a3,24
    194c:	00e67463          	bgeu	a2,a4,1954 <__umoddi3+0x54>
    1950:	01000693          	li	a3,16
    1954:	00d65533          	srl	a0,a2,a3
    1958:	00001717          	auipc	a4,0x1
    195c:	8e870713          	add	a4,a4,-1816 # 2240 <__clz_tab>
    1960:	00a70733          	add	a4,a4,a0
    1964:	00074703          	lbu	a4,0(a4)
    1968:	02000513          	li	a0,32
    196c:	00d70733          	add	a4,a4,a3
    1970:	40e504b3          	sub	s1,a0,a4
    1974:	00e50c63          	beq	a0,a4,198c <__umoddi3+0x8c>
    1978:	009599b3          	sll	s3,a1,s1
    197c:	00e7d733          	srl	a4,a5,a4
    1980:	00961a33          	sll	s4,a2,s1
    1984:	013769b3          	or	s3,a4,s3
    1988:	00979933          	sll	s2,a5,s1
    198c:	010a5a93          	srl	s5,s4,0x10
    1990:	000a8593          	mv	a1,s5
    1994:	00098513          	mv	a0,s3
    1998:	010a1b13          	sll	s6,s4,0x10
    199c:	680000ef          	jal	201c <__hidden___udivsi3>
    19a0:	010b5b13          	srl	s6,s6,0x10
    19a4:	000b0593          	mv	a1,s6
    19a8:	5b0000ef          	jal	1f58 <__mulsi3>
    19ac:	00050413          	mv	s0,a0
    19b0:	000a8593          	mv	a1,s5
    19b4:	00098513          	mv	a0,s3
    19b8:	6ac000ef          	jal	2064 <__umodsi3>
    19bc:	01051513          	sll	a0,a0,0x10
    19c0:	01095793          	srl	a5,s2,0x10
    19c4:	00a7e7b3          	or	a5,a5,a0
    19c8:	0087f863          	bgeu	a5,s0,19d8 <__umoddi3+0xd8>
    19cc:	00fa07b3          	add	a5,s4,a5
    19d0:	0147e463          	bltu	a5,s4,19d8 <__umoddi3+0xd8>
    19d4:	5687e863          	bltu	a5,s0,1f44 <__umoddi3+0x644>
    19d8:	40878433          	sub	s0,a5,s0
    19dc:	000a8593          	mv	a1,s5
    19e0:	00040513          	mv	a0,s0
    19e4:	638000ef          	jal	201c <__hidden___udivsi3>
    19e8:	000b0593          	mv	a1,s6
    19ec:	56c000ef          	jal	1f58 <__mulsi3>
    19f0:	00050793          	mv	a5,a0
    19f4:	000a8593          	mv	a1,s5
    19f8:	00040513          	mv	a0,s0
    19fc:	00078413          	mv	s0,a5
    1a00:	664000ef          	jal	2064 <__umodsi3>
    1a04:	01091793          	sll	a5,s2,0x10
    1a08:	01051513          	sll	a0,a0,0x10
    1a0c:	0107d793          	srl	a5,a5,0x10
    1a10:	00a7e7b3          	or	a5,a5,a0
    1a14:	0087f863          	bgeu	a5,s0,1a24 <__umoddi3+0x124>
    1a18:	00fa07b3          	add	a5,s4,a5
    1a1c:	0147e463          	bltu	a5,s4,1a24 <__umoddi3+0x124>
    1a20:	5087ea63          	bltu	a5,s0,1f34 <__umoddi3+0x634>
    1a24:	01012b03          	lw	s6,16(sp)
    1a28:	408787b3          	sub	a5,a5,s0
    1a2c:	0097d533          	srl	a0,a5,s1
    1a30:	02812403          	lw	s0,40(sp)
    1a34:	02412483          	lw	s1,36(sp)
    1a38:	02012903          	lw	s2,32(sp)
    1a3c:	01c12983          	lw	s3,28(sp)
    1a40:	01812a03          	lw	s4,24(sp)
    1a44:	01412a83          	lw	s5,20(sp)
    1a48:	00000593          	li	a1,0
    1a4c:	02c12083          	lw	ra,44(sp)
    1a50:	03010113          	add	sp,sp,48
    1a54:	00008067          	ret
    1a58:	00050893          	mv	a7,a0
    1a5c:	fed5e8e3          	bltu	a1,a3,1a4c <__umoddi3+0x14c>
    1a60:	03212023          	sw	s2,32(sp)
    1a64:	01312e23          	sw	s3,28(sp)
    1a68:	00010737          	lui	a4,0x10
    1a6c:	00058813          	mv	a6,a1
    1a70:	24e6ec63          	bltu	a3,a4,1cc8 <__umoddi3+0x3c8>
    1a74:	01000737          	lui	a4,0x1000
    1a78:	01800513          	li	a0,24
    1a7c:	00e6f463          	bgeu	a3,a4,1a84 <__umoddi3+0x184>
    1a80:	01000513          	li	a0,16
    1a84:	00a6d333          	srl	t1,a3,a0
    1a88:	00000717          	auipc	a4,0x0
    1a8c:	7b870713          	add	a4,a4,1976 # 2240 <__clz_tab>
    1a90:	00670733          	add	a4,a4,t1
    1a94:	00074703          	lbu	a4,0(a4)
    1a98:	02000313          	li	t1,32
    1a9c:	00a709b3          	add	s3,a4,a0
    1aa0:	41330933          	sub	s2,t1,s3
    1aa4:	25331a63          	bne	t1,s3,1cf8 <__umoddi3+0x3f8>
    1aa8:	00b6e463          	bltu	a3,a1,1ab0 <__umoddi3+0x1b0>
    1aac:	00c7ea63          	bltu	a5,a2,1ac0 <__umoddi3+0x1c0>
    1ab0:	40c788b3          	sub	a7,a5,a2
    1ab4:	40d586b3          	sub	a3,a1,a3
    1ab8:	0117b833          	sltu	a6,a5,a7
    1abc:	41068833          	sub	a6,a3,a6
    1ac0:	02c12083          	lw	ra,44(sp)
    1ac4:	02012903          	lw	s2,32(sp)
    1ac8:	01c12983          	lw	s3,28(sp)
    1acc:	00088513          	mv	a0,a7
    1ad0:	00080593          	mv	a1,a6
    1ad4:	03010113          	add	sp,sp,48
    1ad8:	00008067          	ret
    1adc:	0e060a63          	beqz	a2,1bd0 <__umoddi3+0x2d0>
    1ae0:	00010737          	lui	a4,0x10
    1ae4:	42e67663          	bgeu	a2,a4,1f10 <__umoddi3+0x610>
    1ae8:	10063693          	sltiu	a3,a2,256
    1aec:	0016b693          	seqz	a3,a3
    1af0:	00369693          	sll	a3,a3,0x3
    1af4:	00d65533          	srl	a0,a2,a3
    1af8:	00000717          	auipc	a4,0x0
    1afc:	74870713          	add	a4,a4,1864 # 2240 <__clz_tab>
    1b00:	00a70733          	add	a4,a4,a0
    1b04:	00074983          	lbu	s3,0(a4)
    1b08:	02000713          	li	a4,32
    1b0c:	00d989b3          	add	s3,s3,a3
    1b10:	413704b3          	sub	s1,a4,s3
    1b14:	0f371263          	bne	a4,s3,1bf8 <__umoddi3+0x2f8>
    1b18:	01061413          	sll	s0,a2,0x10
    1b1c:	40c589b3          	sub	s3,a1,a2
    1b20:	01065a93          	srl	s5,a2,0x10
    1b24:	01045413          	srl	s0,s0,0x10
    1b28:	000a8593          	mv	a1,s5
    1b2c:	00098513          	mv	a0,s3
    1b30:	4ec000ef          	jal	201c <__hidden___udivsi3>
    1b34:	00040593          	mv	a1,s0
    1b38:	420000ef          	jal	1f58 <__mulsi3>
    1b3c:	00050793          	mv	a5,a0
    1b40:	000a8593          	mv	a1,s5
    1b44:	00098513          	mv	a0,s3
    1b48:	00078993          	mv	s3,a5
    1b4c:	518000ef          	jal	2064 <__umodsi3>
    1b50:	01051513          	sll	a0,a0,0x10
    1b54:	01095793          	srl	a5,s2,0x10
    1b58:	00a7e7b3          	or	a5,a5,a0
    1b5c:	0137f863          	bgeu	a5,s3,1b6c <__umoddi3+0x26c>
    1b60:	00fa07b3          	add	a5,s4,a5
    1b64:	0147e463          	bltu	a5,s4,1b6c <__umoddi3+0x26c>
    1b68:	3d37ea63          	bltu	a5,s3,1f3c <__umoddi3+0x63c>
    1b6c:	413789b3          	sub	s3,a5,s3
    1b70:	000a8593          	mv	a1,s5
    1b74:	00098513          	mv	a0,s3
    1b78:	4a4000ef          	jal	201c <__hidden___udivsi3>
    1b7c:	00040593          	mv	a1,s0
    1b80:	3d8000ef          	jal	1f58 <__mulsi3>
    1b84:	00050413          	mv	s0,a0
    1b88:	000a8593          	mv	a1,s5
    1b8c:	00098513          	mv	a0,s3
    1b90:	4d4000ef          	jal	2064 <__umodsi3>
    1b94:	01091913          	sll	s2,s2,0x10
    1b98:	01051793          	sll	a5,a0,0x10
    1b9c:	01095913          	srl	s2,s2,0x10
    1ba0:	00f967b3          	or	a5,s2,a5
    1ba4:	0087fa63          	bgeu	a5,s0,1bb8 <__umoddi3+0x2b8>
    1ba8:	00fa07b3          	add	a5,s4,a5
    1bac:	0147e663          	bltu	a5,s4,1bb8 <__umoddi3+0x2b8>
    1bb0:	0087f463          	bgeu	a5,s0,1bb8 <__umoddi3+0x2b8>
    1bb4:	014787b3          	add	a5,a5,s4
    1bb8:	408787b3          	sub	a5,a5,s0
    1bbc:	e71ff06f          	j	1a2c <__umoddi3+0x12c>
    1bc0:	10063693          	sltiu	a3,a2,256
    1bc4:	0016b693          	seqz	a3,a3
    1bc8:	00369693          	sll	a3,a3,0x3
    1bcc:	d89ff06f          	j	1954 <__umoddi3+0x54>
    1bd0:	00000513          	li	a0,0
    1bd4:	00000717          	auipc	a4,0x0
    1bd8:	66c70713          	add	a4,a4,1644 # 2240 <__clz_tab>
    1bdc:	00a70733          	add	a4,a4,a0
    1be0:	00074983          	lbu	s3,0(a4)
    1be4:	00000693          	li	a3,0
    1be8:	02000713          	li	a4,32
    1bec:	00d989b3          	add	s3,s3,a3
    1bf0:	413704b3          	sub	s1,a4,s3
    1bf4:	f33702e3          	beq	a4,s3,1b18 <__umoddi3+0x218>
    1bf8:	00961a33          	sll	s4,a2,s1
    1bfc:	01712623          	sw	s7,12(sp)
    1c00:	010a5a93          	srl	s5,s4,0x10
    1c04:	0135dbb3          	srl	s7,a1,s3
    1c08:	00959733          	sll	a4,a1,s1
    1c0c:	0137d9b3          	srl	s3,a5,s3
    1c10:	000a8593          	mv	a1,s5
    1c14:	000b8513          	mv	a0,s7
    1c18:	010a1413          	sll	s0,s4,0x10
    1c1c:	00e9e9b3          	or	s3,s3,a4
    1c20:	00979933          	sll	s2,a5,s1
    1c24:	01612823          	sw	s6,16(sp)
    1c28:	01045413          	srl	s0,s0,0x10
    1c2c:	3f0000ef          	jal	201c <__hidden___udivsi3>
    1c30:	00040593          	mv	a1,s0
    1c34:	324000ef          	jal	1f58 <__mulsi3>
    1c38:	00050b13          	mv	s6,a0
    1c3c:	000a8593          	mv	a1,s5
    1c40:	000b8513          	mv	a0,s7
    1c44:	420000ef          	jal	2064 <__umodsi3>
    1c48:	01051513          	sll	a0,a0,0x10
    1c4c:	0109d793          	srl	a5,s3,0x10
    1c50:	00a7e7b3          	or	a5,a5,a0
    1c54:	0167fa63          	bgeu	a5,s6,1c68 <__umoddi3+0x368>
    1c58:	00fa07b3          	add	a5,s4,a5
    1c5c:	0147e663          	bltu	a5,s4,1c68 <__umoddi3+0x368>
    1c60:	0167f463          	bgeu	a5,s6,1c68 <__umoddi3+0x368>
    1c64:	014787b3          	add	a5,a5,s4
    1c68:	41678b33          	sub	s6,a5,s6
    1c6c:	000a8593          	mv	a1,s5
    1c70:	000b0513          	mv	a0,s6
    1c74:	3a8000ef          	jal	201c <__hidden___udivsi3>
    1c78:	00040593          	mv	a1,s0
    1c7c:	2dc000ef          	jal	1f58 <__mulsi3>
    1c80:	00050793          	mv	a5,a0
    1c84:	000a8593          	mv	a1,s5
    1c88:	000b0513          	mv	a0,s6
    1c8c:	01099993          	sll	s3,s3,0x10
    1c90:	00078b13          	mv	s6,a5
    1c94:	3d0000ef          	jal	2064 <__umodsi3>
    1c98:	01051513          	sll	a0,a0,0x10
    1c9c:	0109d993          	srl	s3,s3,0x10
    1ca0:	00a9e9b3          	or	s3,s3,a0
    1ca4:	0169fa63          	bgeu	s3,s6,1cb8 <__umoddi3+0x3b8>
    1ca8:	013a09b3          	add	s3,s4,s3
    1cac:	0149e663          	bltu	s3,s4,1cb8 <__umoddi3+0x3b8>
    1cb0:	0169f463          	bgeu	s3,s6,1cb8 <__umoddi3+0x3b8>
    1cb4:	014989b3          	add	s3,s3,s4
    1cb8:	416989b3          	sub	s3,s3,s6
    1cbc:	00c12b83          	lw	s7,12(sp)
    1cc0:	01012b03          	lw	s6,16(sp)
    1cc4:	e65ff06f          	j	1b28 <__umoddi3+0x228>
    1cc8:	1006b513          	sltiu	a0,a3,256
    1ccc:	00153513          	seqz	a0,a0
    1cd0:	00351513          	sll	a0,a0,0x3
    1cd4:	00a6d333          	srl	t1,a3,a0
    1cd8:	00000717          	auipc	a4,0x0
    1cdc:	56870713          	add	a4,a4,1384 # 2240 <__clz_tab>
    1ce0:	00670733          	add	a4,a4,t1
    1ce4:	00074703          	lbu	a4,0(a4)
    1ce8:	02000313          	li	t1,32
    1cec:	00a709b3          	add	s3,a4,a0
    1cf0:	41330933          	sub	s2,t1,s3
    1cf4:	db330ae3          	beq	t1,s3,1aa8 <__umoddi3+0x1a8>
    1cf8:	01512a23          	sw	s5,20(sp)
    1cfc:	012696b3          	sll	a3,a3,s2
    1d00:	01365ab3          	srl	s5,a2,s3
    1d04:	00daeab3          	or	s5,s5,a3
    1d08:	01712623          	sw	s7,12(sp)
    1d0c:	01a12023          	sw	s10,0(sp)
    1d10:	010adb93          	srl	s7,s5,0x10
    1d14:	0135dd33          	srl	s10,a1,s3
    1d18:	01259733          	sll	a4,a1,s2
    1d1c:	0137d6b3          	srl	a3,a5,s3
    1d20:	01912223          	sw	s9,4(sp)
    1d24:	000b8593          	mv	a1,s7
    1d28:	000d0513          	mv	a0,s10
    1d2c:	010a9c93          	sll	s9,s5,0x10
    1d30:	02812423          	sw	s0,40(sp)
    1d34:	02912223          	sw	s1,36(sp)
    1d38:	01261433          	sll	s0,a2,s2
    1d3c:	012794b3          	sll	s1,a5,s2
    1d40:	01412c23          	sw	s4,24(sp)
    1d44:	01612823          	sw	s6,16(sp)
    1d48:	00e6ea33          	or	s4,a3,a4
    1d4c:	01812423          	sw	s8,8(sp)
    1d50:	010cdc93          	srl	s9,s9,0x10
    1d54:	2c8000ef          	jal	201c <__hidden___udivsi3>
    1d58:	00050593          	mv	a1,a0
    1d5c:	00050b13          	mv	s6,a0
    1d60:	000c8513          	mv	a0,s9
    1d64:	1f4000ef          	jal	1f58 <__mulsi3>
    1d68:	00050c13          	mv	s8,a0
    1d6c:	000b8593          	mv	a1,s7
    1d70:	000d0513          	mv	a0,s10
    1d74:	2f0000ef          	jal	2064 <__umodsi3>
    1d78:	01051513          	sll	a0,a0,0x10
    1d7c:	010a5793          	srl	a5,s4,0x10
    1d80:	00a7e7b3          	or	a5,a5,a0
    1d84:	0187fe63          	bgeu	a5,s8,1da0 <__umoddi3+0x4a0>
    1d88:	00fa87b3          	add	a5,s5,a5
    1d8c:	fffb0713          	add	a4,s6,-1
    1d90:	1957ee63          	bltu	a5,s5,1f2c <__umoddi3+0x62c>
    1d94:	1987fc63          	bgeu	a5,s8,1f2c <__umoddi3+0x62c>
    1d98:	ffeb0b13          	add	s6,s6,-2
    1d9c:	015787b3          	add	a5,a5,s5
    1da0:	41878c33          	sub	s8,a5,s8
    1da4:	000b8593          	mv	a1,s7
    1da8:	000c0513          	mv	a0,s8
    1dac:	270000ef          	jal	201c <__hidden___udivsi3>
    1db0:	00050593          	mv	a1,a0
    1db4:	00050d13          	mv	s10,a0
    1db8:	000c8513          	mv	a0,s9
    1dbc:	19c000ef          	jal	1f58 <__mulsi3>
    1dc0:	00050793          	mv	a5,a0
    1dc4:	000b8593          	mv	a1,s7
    1dc8:	000c0513          	mv	a0,s8
    1dcc:	00078b93          	mv	s7,a5
    1dd0:	294000ef          	jal	2064 <__umodsi3>
    1dd4:	010a1593          	sll	a1,s4,0x10
    1dd8:	01051513          	sll	a0,a0,0x10
    1ddc:	0105d593          	srl	a1,a1,0x10
    1de0:	00a5e5b3          	or	a1,a1,a0
    1de4:	0175fe63          	bgeu	a1,s7,1e00 <__umoddi3+0x500>
    1de8:	00ba85b3          	add	a1,s5,a1
    1dec:	fffd0793          	add	a5,s10,-1
    1df0:	1355ea63          	bltu	a1,s5,1f24 <__umoddi3+0x624>
    1df4:	1375f863          	bgeu	a1,s7,1f24 <__umoddi3+0x624>
    1df8:	ffed0d13          	add	s10,s10,-2
    1dfc:	015585b3          	add	a1,a1,s5
    1e00:	010b1793          	sll	a5,s6,0x10
    1e04:	00010e37          	lui	t3,0x10
    1e08:	01a7e7b3          	or	a5,a5,s10
    1e0c:	fffe0313          	add	t1,t3,-1 # ffff <__neorv32_rom_size+0xbfff>
    1e10:	0067f8b3          	and	a7,a5,t1
    1e14:	00647333          	and	t1,s0,t1
    1e18:	41758733          	sub	a4,a1,s7
    1e1c:	0107d793          	srl	a5,a5,0x10
    1e20:	01045e93          	srl	t4,s0,0x10
    1e24:	00088513          	mv	a0,a7
    1e28:	00030593          	mv	a1,t1
    1e2c:	12c000ef          	jal	1f58 <__mulsi3>
    1e30:	00050813          	mv	a6,a0
    1e34:	000e8593          	mv	a1,t4
    1e38:	00088513          	mv	a0,a7
    1e3c:	11c000ef          	jal	1f58 <__mulsi3>
    1e40:	00050893          	mv	a7,a0
    1e44:	00030593          	mv	a1,t1
    1e48:	00078513          	mv	a0,a5
    1e4c:	10c000ef          	jal	1f58 <__mulsi3>
    1e50:	00050313          	mv	t1,a0
    1e54:	000e8593          	mv	a1,t4
    1e58:	00078513          	mv	a0,a5
    1e5c:	0fc000ef          	jal	1f58 <__mulsi3>
    1e60:	01085793          	srl	a5,a6,0x10
    1e64:	006888b3          	add	a7,a7,t1
    1e68:	011787b3          	add	a5,a5,a7
    1e6c:	0067f463          	bgeu	a5,t1,1e74 <__umoddi3+0x574>
    1e70:	01c50533          	add	a0,a0,t3
    1e74:	00010637          	lui	a2,0x10
    1e78:	fff60613          	add	a2,a2,-1 # ffff <__neorv32_rom_size+0xbfff>
    1e7c:	0107d693          	srl	a3,a5,0x10
    1e80:	00c7f7b3          	and	a5,a5,a2
    1e84:	01079793          	sll	a5,a5,0x10
    1e88:	00c87833          	and	a6,a6,a2
    1e8c:	00a686b3          	add	a3,a3,a0
    1e90:	010787b3          	add	a5,a5,a6
    1e94:	06d76263          	bltu	a4,a3,1ef8 <__umoddi3+0x5f8>
    1e98:	04d70e63          	beq	a4,a3,1ef4 <__umoddi3+0x5f4>
    1e9c:	40f487b3          	sub	a5,s1,a5
    1ea0:	00f4b4b3          	sltu	s1,s1,a5
    1ea4:	02812403          	lw	s0,40(sp)
    1ea8:	02c12083          	lw	ra,44(sp)
    1eac:	40d705b3          	sub	a1,a4,a3
    1eb0:	409585b3          	sub	a1,a1,s1
    1eb4:	01359733          	sll	a4,a1,s3
    1eb8:	0127d7b3          	srl	a5,a5,s2
    1ebc:	02412483          	lw	s1,36(sp)
    1ec0:	01c12983          	lw	s3,28(sp)
    1ec4:	01812a03          	lw	s4,24(sp)
    1ec8:	01412a83          	lw	s5,20(sp)
    1ecc:	01012b03          	lw	s6,16(sp)
    1ed0:	00c12b83          	lw	s7,12(sp)
    1ed4:	00812c03          	lw	s8,8(sp)
    1ed8:	00412c83          	lw	s9,4(sp)
    1edc:	00012d03          	lw	s10,0(sp)
    1ee0:	0125d5b3          	srl	a1,a1,s2
    1ee4:	00f76533          	or	a0,a4,a5
    1ee8:	02012903          	lw	s2,32(sp)
    1eec:	03010113          	add	sp,sp,48
    1ef0:	00008067          	ret
    1ef4:	faf4f4e3          	bgeu	s1,a5,1e9c <__umoddi3+0x59c>
    1ef8:	40878433          	sub	s0,a5,s0
    1efc:	0087b7b3          	sltu	a5,a5,s0
    1f00:	01578ab3          	add	s5,a5,s5
    1f04:	415686b3          	sub	a3,a3,s5
    1f08:	00040793          	mv	a5,s0
    1f0c:	f91ff06f          	j	1e9c <__umoddi3+0x59c>
    1f10:	01000737          	lui	a4,0x1000
    1f14:	02e67c63          	bgeu	a2,a4,1f4c <__umoddi3+0x64c>
    1f18:	01065513          	srl	a0,a2,0x10
    1f1c:	01000693          	li	a3,16
    1f20:	bd9ff06f          	j	1af8 <__umoddi3+0x1f8>
    1f24:	00078d13          	mv	s10,a5
    1f28:	ed9ff06f          	j	1e00 <__umoddi3+0x500>
    1f2c:	00070b13          	mv	s6,a4
    1f30:	e71ff06f          	j	1da0 <__umoddi3+0x4a0>
    1f34:	014787b3          	add	a5,a5,s4
    1f38:	aedff06f          	j	1a24 <__umoddi3+0x124>
    1f3c:	014787b3          	add	a5,a5,s4
    1f40:	c2dff06f          	j	1b6c <__umoddi3+0x26c>
    1f44:	014787b3          	add	a5,a5,s4
    1f48:	a91ff06f          	j	19d8 <__umoddi3+0xd8>
    1f4c:	01865513          	srl	a0,a2,0x18
    1f50:	01800693          	li	a3,24
    1f54:	ba5ff06f          	j	1af8 <__umoddi3+0x1f8>

00001f58 <__mulsi3>:
    1f58:	00050613          	mv	a2,a0
    1f5c:	00000513          	li	a0,0
    1f60:	0015f693          	and	a3,a1,1
    1f64:	00068463          	beqz	a3,1f6c <__mulsi3+0x14>
    1f68:	00c50533          	add	a0,a0,a2
    1f6c:	0015d593          	srl	a1,a1,0x1
    1f70:	00161613          	sll	a2,a2,0x1
    1f74:	fe0596e3          	bnez	a1,1f60 <__mulsi3+0x8>
    1f78:	00008067          	ret

00001f7c <__muldi3>:
    1f7c:	ff010113          	add	sp,sp,-16
    1f80:	00812423          	sw	s0,8(sp)
    1f84:	00050413          	mv	s0,a0
    1f88:	00112623          	sw	ra,12(sp)
    1f8c:	00060513          	mv	a0,a2
    1f90:	00068393          	mv	t2,a3
    1f94:	00040713          	mv	a4,s0
    1f98:	00060813          	mv	a6,a2
    1f9c:	00000793          	li	a5,0
    1fa0:	00000313          	li	t1,0
    1fa4:	00000f13          	li	t5,0
    1fa8:	01e708b3          	add	a7,a4,t5
    1fac:	00187e93          	and	t4,a6,1
    1fb0:	00f30fb3          	add	t6,t1,a5
    1fb4:	01f75e13          	srl	t3,a4,0x1f
    1fb8:	00185813          	srl	a6,a6,0x1
    1fbc:	00e8b2b3          	sltu	t0,a7,a4
    1fc0:	00179793          	sll	a5,a5,0x1
    1fc4:	000e8663          	beqz	t4,1fd0 <__muldi3+0x54>
    1fc8:	00088f13          	mv	t5,a7
    1fcc:	01f28333          	add	t1,t0,t6
    1fd0:	00171713          	sll	a4,a4,0x1
    1fd4:	01c7e7b3          	or	a5,a5,t3
    1fd8:	fc0818e3          	bnez	a6,1fa8 <__muldi3+0x2c>
    1fdc:	00058663          	beqz	a1,1fe8 <__muldi3+0x6c>
    1fe0:	f79ff0ef          	jal	1f58 <__mulsi3>
    1fe4:	00650333          	add	t1,a0,t1
    1fe8:	00038a63          	beqz	t2,1ffc <__muldi3+0x80>
    1fec:	00040513          	mv	a0,s0
    1ff0:	00038593          	mv	a1,t2
    1ff4:	f65ff0ef          	jal	1f58 <__mulsi3>
    1ff8:	00650333          	add	t1,a0,t1
    1ffc:	00c12083          	lw	ra,12(sp)
    2000:	00812403          	lw	s0,8(sp)
    2004:	000f0513          	mv	a0,t5
    2008:	00030593          	mv	a1,t1
    200c:	01010113          	add	sp,sp,16
    2010:	00008067          	ret

00002014 <__divsi3>:
    2014:	06054063          	bltz	a0,2074 <__umodsi3+0x10>
    2018:	0605c663          	bltz	a1,2084 <__umodsi3+0x20>

0000201c <__hidden___udivsi3>:
    201c:	00058613          	mv	a2,a1
    2020:	00050593          	mv	a1,a0
    2024:	fff00513          	li	a0,-1
    2028:	02060c63          	beqz	a2,2060 <__hidden___udivsi3+0x44>
    202c:	00100693          	li	a3,1
    2030:	00b67a63          	bgeu	a2,a1,2044 <__hidden___udivsi3+0x28>
    2034:	00c05863          	blez	a2,2044 <__hidden___udivsi3+0x28>
    2038:	00161613          	sll	a2,a2,0x1
    203c:	00169693          	sll	a3,a3,0x1
    2040:	feb66ae3          	bltu	a2,a1,2034 <__hidden___udivsi3+0x18>
    2044:	00000513          	li	a0,0
    2048:	00c5e663          	bltu	a1,a2,2054 <__hidden___udivsi3+0x38>
    204c:	40c585b3          	sub	a1,a1,a2
    2050:	00d56533          	or	a0,a0,a3
    2054:	0016d693          	srl	a3,a3,0x1
    2058:	00165613          	srl	a2,a2,0x1
    205c:	fe0696e3          	bnez	a3,2048 <__hidden___udivsi3+0x2c>
    2060:	00008067          	ret

00002064 <__umodsi3>:
    2064:	00008293          	mv	t0,ra
    2068:	fb5ff0ef          	jal	201c <__hidden___udivsi3>
    206c:	00058513          	mv	a0,a1
    2070:	00028067          	jr	t0
    2074:	40a00533          	neg	a0,a0
    2078:	00b04863          	bgtz	a1,2088 <__umodsi3+0x24>
    207c:	40b005b3          	neg	a1,a1
    2080:	f9dff06f          	j	201c <__hidden___udivsi3>
    2084:	40b005b3          	neg	a1,a1
    2088:	00008293          	mv	t0,ra
    208c:	f91ff0ef          	jal	201c <__hidden___udivsi3>
    2090:	40a00533          	neg	a0,a0
    2094:	00028067          	jr	t0

00002098 <__modsi3>:
    2098:	00008293          	mv	t0,ra
    209c:	0005ca63          	bltz	a1,20b0 <__modsi3+0x18>
    20a0:	00054c63          	bltz	a0,20b8 <__modsi3+0x20>
    20a4:	f79ff0ef          	jal	201c <__hidden___udivsi3>
    20a8:	00058513          	mv	a0,a1
    20ac:	00028067          	jr	t0
    20b0:	40b005b3          	neg	a1,a1
    20b4:	fe0558e3          	bgez	a0,20a4 <__modsi3+0xc>
    20b8:	40a00533          	neg	a0,a0
    20bc:	f61ff0ef          	jal	201c <__hidden___udivsi3>
    20c0:	40b00533          	neg	a0,a1
    20c4:	00028067          	jr	t0
