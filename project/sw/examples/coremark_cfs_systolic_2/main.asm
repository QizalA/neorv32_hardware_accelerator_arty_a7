
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80002217          	auipc	tp,0x80002
       8:	ffb20213          	add	tp,tp,-5 # 80001fff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer>
      18:	6289                	lui	t0,0x2
      1a:	80028293          	add	t0,t0,-2048 # 1800 <main+0x5a8>
      1e:	30029073          	csrw	mstatus,t0
      22:	00000317          	auipc	t1,0x0
      26:	13630313          	add	t1,t1,310 # 158 <__crt0_trap>
      2a:	30531073          	csrw	mtvec,t1
      2e:	30401073          	csrw	mie,zero
      32:	00003397          	auipc	t2,0x3
      36:	31238393          	add	t2,t2,786 # 3344 <__crt0_copy_data_src_begin>
      3a:	80000417          	auipc	s0,0x80000
      3e:	fc640413          	add	s0,s0,-58 # 80000000 <_impure_data>
      42:	80000497          	auipc	s1,0x80000
      46:	4f648493          	add	s1,s1,1270 # 80000538 <curr_heap.0>
      4a:	80000517          	auipc	a0,0x80000
      4e:	4ee50513          	add	a0,a0,1262 # 80000538 <curr_heap.0>
      52:	80000597          	auipc	a1,0x80000
      56:	6ee58593          	add	a1,a1,1774 # 80000740 <__crt0_bss_end>
      5a:	4601                	li	a2,0
      5c:	4681                	li	a3,0
      5e:	4701                	li	a4,0
      60:	4781                	li	a5,0
      62:	4801                	li	a6,0
      64:	4881                	li	a7,0
      66:	4901                	li	s2,0
      68:	4981                	li	s3,0
      6a:	4a01                	li	s4,0
      6c:	4a81                	li	s5,0
      6e:	4b01                	li	s6,0
      70:	4b81                	li	s7,0
      72:	4c01                	li	s8,0
      74:	4c81                	li	s9,0
      76:	4d01                	li	s10,0
      78:	4d81                	li	s11,0
      7a:	4e01                	li	t3,0
      7c:	4e81                	li	t4,0
      7e:	4f01                	li	t5,0
      80:	4f81                	li	t6,0

00000082 <__crt0_smp_check>:
      82:	02008763          	beqz	ra,b0 <__crt0_smp_primary>
      86:	00000797          	auipc	a5,0x0
      8a:	01678793          	add	a5,a5,22 # 9c <__crt0_smp_wakeup>
      8e:	30579073          	csrw	mtvec,a5
      92:	30446073          	csrs	mie,8
      96:	30046073          	csrs	mstatus,8
      9a:	a85d                	j	150 <__crt0_sleep>

0000009c <__crt0_smp_wakeup>:
      9c:	fff44737          	lui	a4,0xfff44
      a0:	00872103          	lw	sp,8(a4) # fff44008 <__crt0_ram_last+0x7ff42009>
      a4:	4750                	lw	a2,12(a4)
      a6:	fff40737          	lui	a4,0xfff40
      aa:	00072223          	sw	zero,4(a4) # fff40004 <__crt0_ram_last+0x7ff3e005>
      ae:	a0a9                	j	f8 <__crt0_main_entry>

000000b0 <__crt0_smp_primary>:
      b0:	00838a63          	beq	t2,s0,c4 <__crt0_bss_clear>

000000b4 <__crt0_data_copy>:
      b4:	00945863          	bge	s0,s1,c4 <__crt0_bss_clear>
      b8:	0003a783          	lw	a5,0(t2)
      bc:	c01c                	sw	a5,0(s0)
      be:	0391                	add	t2,t2,4
      c0:	0411                	add	s0,s0,4
      c2:	bfcd                	j	b4 <__crt0_data_copy>

000000c4 <__crt0_bss_clear>:
      c4:	00b55663          	bge	a0,a1,d0 <__crt0_bss_clear_end>
      c8:	00052023          	sw	zero,0(a0)
      cc:	0511                	add	a0,a0,4
      ce:	bfdd                	j	c4 <__crt0_bss_clear>

000000d0 <__crt0_bss_clear_end>:
      d0:	00003417          	auipc	s0,0x3
      d4:	a4840413          	add	s0,s0,-1464 # 2b18 <__fini_array_end>
      d8:	00003497          	auipc	s1,0x3
      dc:	a4048493          	add	s1,s1,-1472 # 2b18 <__fini_array_end>

000000e0 <__crt0_constructors>:
      e0:	00945863          	bge	s0,s1,f0 <__crt0_constructors_end>
      e4:	00042083          	lw	ra,0(s0)
      e8:	000080e7          	jalr	ra
      ec:	0411                	add	s0,s0,4
      ee:	bfcd                	j	e0 <__crt0_constructors>

000000f0 <__crt0_constructors_end>:
      f0:	00001617          	auipc	a2,0x1
      f4:	16860613          	add	a2,a2,360 # 1258 <main>

000000f8 <__crt0_main_entry>:
      f8:	80000197          	auipc	gp,0x80000
      fc:	70818193          	add	gp,gp,1800 # 80000800 <__global_pointer>
     100:	0ff0000f          	fence
     104:	0000100f          	fence.i
     108:	30029073          	csrw	mstatus,t0
     10c:	4501                	li	a0,0
     10e:	4581                	li	a1,0
     110:	000600e7          	jalr	a2

00000114 <__crt0_main_exit>:
     114:	30401073          	csrw	mie,zero
     118:	34051073          	csrw	mscratch,a0
     11c:	00000517          	auipc	a0,0x0
     120:	03c50513          	add	a0,a0,60 # 158 <__crt0_trap>
     124:	30551073          	csrw	mtvec,a0
     128:	f1402473          	csrr	s0,mhartid
     12c:	e00d                	bnez	s0,14e <__crt0_destructors_end>
     12e:	00003417          	auipc	s0,0x3
     132:	9ea40413          	add	s0,s0,-1558 # 2b18 <__fini_array_end>
     136:	00003497          	auipc	s1,0x3
     13a:	9e248493          	add	s1,s1,-1566 # 2b18 <__fini_array_end>

0000013e <__crt0_destructors>:
     13e:	00945863          	bge	s0,s1,14e <__crt0_destructors_end>
     142:	00042083          	lw	ra,0(s0)
     146:	000080e7          	jalr	ra
     14a:	0411                	add	s0,s0,4
     14c:	bfcd                	j	13e <__crt0_destructors>

0000014e <__crt0_destructors_end>:
     14e:	9002                	ebreak

00000150 <__crt0_sleep>:
     150:	10500073          	wfi
     154:	bff5                	j	150 <__crt0_sleep>
     156:	0001                	nop

00000158 <__crt0_trap>:
     158:	34041073          	csrw	mscratch,s0
     15c:	34202473          	csrr	s0,mcause
     160:	807d                	srl	s0,s0,0x1f
     162:	e005                	bnez	s0,182 <__crt0_trap_end>
     164:	34102473          	csrr	s0,mepc
     168:	0411                	add	s0,s0,4
     16a:	34141073          	csrw	mepc,s0
     16e:	34a02473          	csrr	s0,0x34a
     172:	880d                	and	s0,s0,3
     174:	1475                	add	s0,s0,-3
     176:	c411                	beqz	s0,182 <__crt0_trap_end>
     178:	34102473          	csrr	s0,mepc
     17c:	1479                	add	s0,s0,-2
     17e:	34141073          	csrw	mepc,s0

00000182 <__crt0_trap_end>:
     182:	34002473          	csrr	s0,mscratch
     186:	30200073          	mret

0000018a <pack_s8_4>:
     18a:	00154703          	lbu	a4,1(a0)
     18e:	00054783          	lbu	a5,0(a0)
     192:	0722                	sll	a4,a4,0x8
     194:	8f5d                	or	a4,a4,a5
     196:	00254783          	lbu	a5,2(a0)
     19a:	00354503          	lbu	a0,3(a0)
     19e:	07c2                	sll	a5,a5,0x10
     1a0:	8fd9                	or	a5,a5,a4
     1a2:	0562                	sll	a0,a0,0x18
     1a4:	8d5d                	or	a0,a0,a5
     1a6:	8082                	ret

000001a8 <cfs_gemm4x4_i8_run>:
     1a8:	1101                	add	sp,sp,-32
     1aa:	4709                	li	a4,2
     1ac:	ce06                	sw	ra,28(sp)
     1ae:	cc22                	sw	s0,24(sp)
     1b0:	ca26                	sw	s1,20(sp)
     1b2:	c84a                	sw	s2,16(sp)
     1b4:	ffeb07b7          	lui	a5,0xffeb0
     1b8:	c398                	sw	a4,0(a5)
     1ba:	842e                	mv	s0,a1
     1bc:	8932                	mv	s2,a2
     1be:	84aa                	mv	s1,a0
     1c0:	37e9                	jal	18a <pack_s8_4>
     1c2:	ffeb07b7          	lui	a5,0xffeb0
     1c6:	c3c8                	sw	a0,4(a5)
     1c8:	00448513          	add	a0,s1,4
     1cc:	3f7d                	jal	18a <pack_s8_4>
     1ce:	ffeb07b7          	lui	a5,0xffeb0
     1d2:	c788                	sw	a0,8(a5)
     1d4:	00848513          	add	a0,s1,8
     1d8:	3f4d                	jal	18a <pack_s8_4>
     1da:	ffeb07b7          	lui	a5,0xffeb0
     1de:	c7c8                	sw	a0,12(a5)
     1e0:	00c48513          	add	a0,s1,12
     1e4:	375d                	jal	18a <pack_s8_4>
     1e6:	ffeb07b7          	lui	a5,0xffeb0
     1ea:	cb88                	sw	a0,16(a5)
     1ec:	00044783          	lbu	a5,0(s0)
     1f0:	0068                	add	a0,sp,12
     1f2:	00f10623          	sb	a5,12(sp)
     1f6:	00444783          	lbu	a5,4(s0)
     1fa:	00f106a3          	sb	a5,13(sp)
     1fe:	00844783          	lbu	a5,8(s0)
     202:	00f10723          	sb	a5,14(sp)
     206:	00c44783          	lbu	a5,12(s0)
     20a:	00f107a3          	sb	a5,15(sp)
     20e:	3fb5                	jal	18a <pack_s8_4>
     210:	ffeb07b7          	lui	a5,0xffeb0
     214:	cbc8                	sw	a0,20(a5)
     216:	00144783          	lbu	a5,1(s0)
     21a:	0068                	add	a0,sp,12
     21c:	00f10623          	sb	a5,12(sp)
     220:	00544783          	lbu	a5,5(s0)
     224:	00f106a3          	sb	a5,13(sp)
     228:	00944783          	lbu	a5,9(s0)
     22c:	00f10723          	sb	a5,14(sp)
     230:	00d44783          	lbu	a5,13(s0)
     234:	00f107a3          	sb	a5,15(sp)
     238:	3f89                	jal	18a <pack_s8_4>
     23a:	ffeb07b7          	lui	a5,0xffeb0
     23e:	cf88                	sw	a0,24(a5)
     240:	00244783          	lbu	a5,2(s0)
     244:	0068                	add	a0,sp,12
     246:	00f10623          	sb	a5,12(sp)
     24a:	00644783          	lbu	a5,6(s0)
     24e:	00f106a3          	sb	a5,13(sp)
     252:	00a44783          	lbu	a5,10(s0)
     256:	00f10723          	sb	a5,14(sp)
     25a:	00e44783          	lbu	a5,14(s0)
     25e:	00f107a3          	sb	a5,15(sp)
     262:	3725                	jal	18a <pack_s8_4>
     264:	ffeb07b7          	lui	a5,0xffeb0
     268:	cfc8                	sw	a0,28(a5)
     26a:	00344783          	lbu	a5,3(s0)
     26e:	0068                	add	a0,sp,12
     270:	00f10623          	sb	a5,12(sp)
     274:	00744783          	lbu	a5,7(s0)
     278:	00f106a3          	sb	a5,13(sp)
     27c:	00b44783          	lbu	a5,11(s0)
     280:	00f10723          	sb	a5,14(sp)
     284:	00f44783          	lbu	a5,15(s0)
     288:	00f107a3          	sb	a5,15(sp)
     28c:	3dfd                	jal	18a <pack_s8_4>
     28e:	ffeb07b7          	lui	a5,0xffeb0
     292:	d388                	sw	a0,32(a5)
     294:	ffeb0737          	lui	a4,0xffeb0
     298:	47a9                	li	a5,10
     29a:	4685                	li	a3,1
     29c:	c314                	sw	a3,0(a4)
     29e:	17fd                	add	a5,a5,-1 # ffeaffff <__crt0_ram_last+0x7feae000>
     2a0:	fff5                	bnez	a5,29c <cfs_gemm4x4_i8_run+0xf4>
     2a2:	ffeb05b7          	lui	a1,0xffeb0
     2a6:	4681                	li	a3,0
     2a8:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7feae041>
     2ac:	4541                	li	a0,16
     2ae:	00269713          	sll	a4,a3,0x2
     2b2:	00e90633          	add	a2,s2,a4
     2b6:	4781                	li	a5,0
     2b8:	972e                	add	a4,a4,a1
     2ba:	00f70833          	add	a6,a4,a5
     2be:	00082883          	lw	a7,0(a6)
     2c2:	00f60833          	add	a6,a2,a5
     2c6:	0791                	add	a5,a5,4
     2c8:	01182023          	sw	a7,0(a6)
     2cc:	fea797e3          	bne	a5,a0,2ba <cfs_gemm4x4_i8_run+0x112>
     2d0:	0691                	add	a3,a3,4
     2d2:	fcf69ee3          	bne	a3,a5,2ae <cfs_gemm4x4_i8_run+0x106>
     2d6:	40f2                	lw	ra,28(sp)
     2d8:	4462                	lw	s0,24(sp)
     2da:	44d2                	lw	s1,20(sp)
     2dc:	4942                	lw	s2,16(sp)
     2de:	6105                	add	sp,sp,32
     2e0:	8082                	ret

000002e2 <sw_gemm_4x4_i8i32>:

/* ========= Tiny 4x4x4 int8->int32 SW GEMM and helpers (no floats) ========= */
static void sw_gemm_4x4_i8i32(const int8_t A[4][4],
                              const int8_t B[4][4],
                              int32_t C[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
     2e2:	04060313          	add	t1,a2,64
    int32_t acc=0; for (int k=0;k<4;k++) acc += (int32_t)A[i][k]*(int32_t)B[k][j];
     2e6:	4e11                	li	t3,4
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
     2e8:	4781                	li	a5,0
     2ea:	a035                	j	316 <sw_gemm_4x4_i8i32+0x34>
    int32_t acc=0; for (int k=0;k<4;k++) acc += (int32_t)A[i][k]*(int32_t)B[k][j];
     2ec:	00e508b3          	add	a7,a0,a4
     2f0:	00080e83          	lb	t4,0(a6)
     2f4:	00088883          	lb	a7,0(a7)
     2f8:	0705                	add	a4,a4,1 # ffeb0001 <__crt0_ram_last+0x7feae002>
     2fa:	0811                	add	a6,a6,4
     2fc:	03d888b3          	mul	a7,a7,t4
     300:	96c6                	add	a3,a3,a7
     302:	ffc715e3          	bne	a4,t3,2ec <sw_gemm_4x4_i8i32+0xa>
    C[i][j]=acc;
     306:	00279813          	sll	a6,a5,0x2
     30a:	9832                	add	a6,a6,a2
     30c:	00d82023          	sw	a3,0(a6)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
     310:	0785                	add	a5,a5,1
     312:	00e78763          	beq	a5,a4,320 <sw_gemm_4x4_i8i32+0x3e>
    int32_t acc=0; for (int k=0;k<4;k++) acc += (int32_t)A[i][k]*(int32_t)B[k][j];
     316:	00f58833          	add	a6,a1,a5
     31a:	4701                	li	a4,0
     31c:	4681                	li	a3,0
     31e:	b7f9                	j	2ec <sw_gemm_4x4_i8i32+0xa>
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
     320:	0641                	add	a2,a2,16
     322:	0511                	add	a0,a0,4
     324:	fcc312e3          	bne	t1,a2,2e8 <sw_gemm_4x4_i8i32+0x6>
  }
}
     328:	8082                	ret

0000032a <cmp_idx>:

        Can be used by mergesort.
*/
ee_s32 cmp_idx(list_data *a, list_data *b, core_results *res)
{
    if (res == NULL)
     32a:	e60d                	bnez	a2,354 <cmp_idx+0x2a>
    {
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     32c:	00051783          	lh	a5,0(a0)
     330:	f007f713          	and	a4,a5,-256
     334:	07c2                	sll	a5,a5,0x10
     336:	83c1                	srl	a5,a5,0x10
     338:	83a1                	srl	a5,a5,0x8
     33a:	8fd9                	or	a5,a5,a4
     33c:	00f51023          	sh	a5,0(a0)
        b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
     340:	00059783          	lh	a5,0(a1)
     344:	f007f713          	and	a4,a5,-256
     348:	07c2                	sll	a5,a5,0x10
     34a:	83c1                	srl	a5,a5,0x10
     34c:	83a1                	srl	a5,a5,0x8
     34e:	8fd9                	or	a5,a5,a4
     350:	00f59023          	sh	a5,0(a1)
    }
    return a->idx - b->idx;
     354:	00251503          	lh	a0,2(a0)
     358:	00259783          	lh	a5,2(a1)
}
     35c:	8d1d                	sub	a0,a0,a5
     35e:	8082                	ret

00000360 <core_list_find>:
/* Function: core_list_find
        Find an item in the list
*/
list_head *core_list_find(list_head *list, list_data *info)
{
    if (info->idx >= 0)
     360:	00259783          	lh	a5,2(a1)
     364:	0007dc63          	bgez	a5,37c <core_list_find+0x1c>
     368:	00059703          	lh	a4,0(a1)
            list = list->next;
        return list;
    }
    else
    {
        while (list && ((list->info->data16 & 0xff) != info->data16))
     36c:	c511                	beqz	a0,378 <core_list_find+0x18>
     36e:	415c                	lw	a5,4(a0)
     370:	0007c783          	lbu	a5,0(a5)
     374:	00f71b63          	bne	a4,a5,38a <core_list_find+0x2a>
            list = list->next;
        return list;
    }
}
     378:	8082                	ret
            list = list->next;
     37a:	4108                	lw	a0,0(a0)
        while (list && (list->info->idx != info->idx))
     37c:	dd75                	beqz	a0,378 <core_list_find+0x18>
     37e:	4158                	lw	a4,4(a0)
     380:	00271703          	lh	a4,2(a4)
     384:	fef71be3          	bne	a4,a5,37a <core_list_find+0x1a>
     388:	8082                	ret
            list = list->next;
     38a:	4108                	lw	a0,0(a0)
     38c:	b7c5                	j	36c <core_list_find+0xc>

0000038e <core_list_mergesort>:

/* Function: core_list_mergesort
        Sort the list in place without recursion.
*/
list_head *core_list_mergesort(list_head *list, list_cmp cmp, core_results *res)
{
     38e:	7179                	add	sp,sp,-48
     390:	ce4e                	sw	s3,28(sp)
     392:	ca56                	sw	s5,20(sp)
     394:	c65e                	sw	s7,12(sp)
     396:	c462                	sw	s8,8(sp)
     398:	c06a                	sw	s10,0(sp)
     39a:	d606                	sw	ra,44(sp)
     39c:	d422                	sw	s0,40(sp)
     39e:	d226                	sw	s1,36(sp)
     3a0:	d04a                	sw	s2,32(sp)
     3a2:	cc52                	sw	s4,24(sp)
     3a4:	c85a                	sw	s6,16(sp)
     3a6:	c266                	sw	s9,4(sp)
     3a8:	8bae                	mv	s7,a1
     3aa:	8c32                	mv	s8,a2
     3ac:	89aa                	mv	s3,a0
    list_head *p, *q, *e, *tail;
    ee_s32     insize, nmerges, psize, qsize, i;

    insize = 1;
     3ae:	4a85                	li	s5,1
        }

        tail->next = NULL;

        /* If we have done only one merge, we're finished. */
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     3b0:	4d05                	li	s10,1
        p    = list;
     3b2:	84ce                	mv	s1,s3
        while (p)
     3b4:	4c81                	li	s9,0
        tail = NULL;
     3b6:	4b01                	li	s6,0
        list = NULL;
     3b8:	4981                	li	s3,0
        while (p)
     3ba:	e499                	bnez	s1,3c8 <core_list_mergesort+0x3a>
        tail->next = NULL;
     3bc:	000b2023          	sw	zero,0(s6)
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     3c0:	059d5f63          	bge	s10,s9,41e <core_list_mergesort+0x90>
            return list;

        /* Otherwise repeat, merging lists twice the size */
        insize *= 2;
     3c4:	0a86                	sll	s5,s5,0x1
        p    = list;
     3c6:	b7f5                	j	3b2 <core_list_mergesort+0x24>
            nmerges++; /* there exists a merge to be done */
     3c8:	0c85                	add	s9,s9,1
            q     = p;
     3ca:	8426                	mv	s0,s1
            psize = 0;
     3cc:	4901                	li	s2,0
            for (i = 0; i < insize; i++)
     3ce:	01595563          	bge	s2,s5,3d8 <core_list_mergesort+0x4a>
                q = q->next;
     3d2:	4000                	lw	s0,0(s0)
                psize++;
     3d4:	0905                	add	s2,s2,1
                if (!q) break;
     3d6:	fc65                	bnez	s0,3ce <core_list_mergesort+0x40>
                else      list = e;
     3d8:	8a56                	mv	s4,s5
            while (psize > 0 || (qsize > 0 && q))
     3da:	01204d63          	bgtz	s2,3f4 <core_list_mergesort+0x66>
     3de:	01405363          	blez	s4,3e4 <core_list_mergesort+0x56>
     3e2:	e019                	bnez	s0,3e8 <core_list_mergesort+0x5a>
                else      list = e;
     3e4:	84a2                	mv	s1,s0
     3e6:	bfd1                	j	3ba <core_list_mergesort+0x2c>
                if (psize == 0)
     3e8:	02091263          	bnez	s2,40c <core_list_mergesort+0x7e>
                    e = q; q = q->next; qsize--;
     3ec:	87a2                	mv	a5,s0
     3ee:	1a7d                	add	s4,s4,-1
     3f0:	4000                	lw	s0,0(s0)
     3f2:	a039                	j	400 <core_list_mergesort+0x72>
                else if (qsize == 0 || !q)
     3f4:	000a0363          	beqz	s4,3fa <core_list_mergesort+0x6c>
     3f8:	e811                	bnez	s0,40c <core_list_mergesort+0x7e>
                    e = p; p = p->next; psize--;
     3fa:	87a6                	mv	a5,s1
     3fc:	4084                	lw	s1,0(s1)
     3fe:	197d                	add	s2,s2,-1
                if (tail) tail->next = e;
     400:	000b0d63          	beqz	s6,41a <core_list_mergesort+0x8c>
     404:	00fb2023          	sw	a5,0(s6)
                else      list = e;
     408:	8b3e                	mv	s6,a5
     40a:	bfc1                	j	3da <core_list_mergesort+0x4c>
                else if (cmp(p->info, q->info, res) <= 0)
     40c:	404c                	lw	a1,4(s0)
     40e:	40c8                	lw	a0,4(s1)
     410:	8662                	mv	a2,s8
     412:	9b82                	jalr	s7
     414:	fca04ce3          	bgtz	a0,3ec <core_list_mergesort+0x5e>
     418:	b7cd                	j	3fa <core_list_mergesort+0x6c>
                else      list = e;
     41a:	89be                	mv	s3,a5
     41c:	b7f5                	j	408 <core_list_mergesort+0x7a>
    }
#if COMPILER_REQUIRES_SORT_RETURN
    return list;
#endif
}
     41e:	50b2                	lw	ra,44(sp)
     420:	5422                	lw	s0,40(sp)
     422:	5492                	lw	s1,36(sp)
     424:	5902                	lw	s2,32(sp)
     426:	4a62                	lw	s4,24(sp)
     428:	4ad2                	lw	s5,20(sp)
     42a:	4b42                	lw	s6,16(sp)
     42c:	4bb2                	lw	s7,12(sp)
     42e:	4c22                	lw	s8,8(sp)
     430:	4c92                	lw	s9,4(sp)
     432:	4d02                	lw	s10,0(sp)
     434:	854e                	mv	a0,s3
     436:	49f2                	lw	s3,28(sp)
     438:	6145                	add	sp,sp,48
     43a:	8082                	ret

0000043c <neorv32_rte_core>:
 * executed in machine mode).
 **************************************************************************/
void __attribute__((__naked__,aligned(4))) neorv32_rte_core(void) {

  // save context
  asm volatile (
     43c:	34011073          	csrw	mscratch,sp
     440:	7119                	add	sp,sp,-128
     442:	c002                	sw	zero,0(sp)
     444:	c206                	sw	ra,4(sp)
     446:	340110f3          	csrrw	ra,mscratch,sp
     44a:	c406                	sw	ra,8(sp)
     44c:	c60e                	sw	gp,12(sp)
     44e:	c812                	sw	tp,16(sp)
     450:	ca16                	sw	t0,20(sp)
     452:	cc1a                	sw	t1,24(sp)
     454:	ce1e                	sw	t2,28(sp)
     456:	d022                	sw	s0,32(sp)
     458:	d226                	sw	s1,36(sp)
     45a:	d42a                	sw	a0,40(sp)
     45c:	d62e                	sw	a1,44(sp)
     45e:	d832                	sw	a2,48(sp)
     460:	da36                	sw	a3,52(sp)
     462:	dc3a                	sw	a4,56(sp)
     464:	de3e                	sw	a5,60(sp)
     466:	c0c2                	sw	a6,64(sp)
     468:	c2c6                	sw	a7,68(sp)
     46a:	c4ca                	sw	s2,72(sp)
     46c:	c6ce                	sw	s3,76(sp)
     46e:	c8d2                	sw	s4,80(sp)
     470:	cad6                	sw	s5,84(sp)
     472:	ccda                	sw	s6,88(sp)
     474:	cede                	sw	s7,92(sp)
     476:	d0e2                	sw	s8,96(sp)
     478:	d2e6                	sw	s9,100(sp)
     47a:	d4ea                	sw	s10,104(sp)
     47c:	d6ee                	sw	s11,108(sp)
     47e:	d8f2                	sw	t3,112(sp)
     480:	daf6                	sw	t4,116(sp)
     482:	dcfa                	sw	t5,120(sp)
     484:	defe                	sw	t6,124(sp)
#endif
  );

  // flush context (stack frame) to main memory
  // reload trap table from main memory
  asm volatile ("fence");
     486:	0ff0000f          	fence
 * @return Read data (uint32_t).
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     48a:	342027f3          	csrr	a5,mcause

  // find according trap handler base address
  uint32_t handler_base = 0;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
     48e:	472d                	li	a4,11
     490:	02f76063          	bltu	a4,a5,4b0 <neorv32_rte_core+0x74>
     494:	670d                	lui	a4,0x3
     496:	078a                	sll	a5,a5,0x2
     498:	b1870713          	add	a4,a4,-1256 # 2b18 <__fini_array_end>
     49c:	97ba                	add	a5,a5,a4
     49e:	439c                	lw	a5,0(a5)
     4a0:	8782                	jr	a5
     4a2:	670d                	lui	a4,0x3
     4a4:	078a                	sll	a5,a5,0x2
     4a6:	b4870713          	add	a4,a4,-1208 # 2b48 <__fini_array_end+0x30>
     4aa:	97ba                	add	a5,a5,a4
     4ac:	439c                	lw	a5,0(a5)
     4ae:	8782                	jr	a5
     4b0:	80000737          	lui	a4,0x80000
     4b4:	1775                	add	a4,a4,-3 # 7ffffffd <neorv32_uart.c.2d4a2ccb+0x7fff8b6f>
     4b6:	97ba                	add	a5,a5,a4
     4b8:	4771                	li	a4,28
     4ba:	fef774e3          	bgeu	a4,a5,4a2 <neorv32_rte_core+0x66>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    default:                     handler_base = (uint32_t)(&neorv32_rte_debug_handler);          break;
     4be:	6785                	lui	a5,0x1
     4c0:	f4678793          	add	a5,a5,-186 # f46 <neorv32_rte_debug_handler>

  // call handler
  if (handler_base != 0) {
    typedef void handler_t();
    handler_t* handler = (handler_t*)handler_base;
    handler();
     4c4:	9782                	jalr	a5
     4c6:	a031                	j	4d2 <neorv32_rte_core+0x96>
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
     4c8:	800007b7          	lui	a5,0x80000
     4cc:	56c7a783          	lw	a5,1388(a5) # 8000056c <__neorv32_rte_vector_lut>
  if (handler_base != 0) {
     4d0:	fbf5                	bnez	a5,4c4 <neorv32_rte_core+0x88>
     4d2:	342027f3          	csrr	a5,mcause
  }

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if (((cause >> 31) == 0) && (cause != TRAP_CODE_I_ACCESS)) {
     4d6:	0207c763          	bltz	a5,504 <neorv32_rte_core+0xc8>
     4da:	4705                	li	a4,1
     4dc:	02e78463          	beq	a5,a4,504 <neorv32_rte_core+0xc8>
     4e0:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
     4e4:	00468713          	add	a4,a3,4
     4e8:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
     4ec:	8b91                	and	a5,a5,4
     4ee:	cb89                	beqz	a5,500 <neorv32_rte_core+0xc4>
     4f0:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
     4f4:	460d                	li	a2,3
     4f6:	8b8d                	and	a5,a5,3
     4f8:	00c78463          	beq	a5,a2,500 <neorv32_rte_core+0xc4>
        rte_mepc -= 2;
     4fc:	00268713          	add	a4,a3,2
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     500:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
     504:	4092                	lw	ra,4(sp)
     506:	41b2                	lw	gp,12(sp)
     508:	4242                	lw	tp,16(sp)
     50a:	42d2                	lw	t0,20(sp)
     50c:	4362                	lw	t1,24(sp)
     50e:	43f2                	lw	t2,28(sp)
     510:	5402                	lw	s0,32(sp)
     512:	5492                	lw	s1,36(sp)
     514:	5522                	lw	a0,40(sp)
     516:	55b2                	lw	a1,44(sp)
     518:	5642                	lw	a2,48(sp)
     51a:	56d2                	lw	a3,52(sp)
     51c:	5762                	lw	a4,56(sp)
     51e:	57f2                	lw	a5,60(sp)
     520:	4806                	lw	a6,64(sp)
     522:	4896                	lw	a7,68(sp)
     524:	4926                	lw	s2,72(sp)
     526:	49b6                	lw	s3,76(sp)
     528:	4a46                	lw	s4,80(sp)
     52a:	4ad6                	lw	s5,84(sp)
     52c:	4b66                	lw	s6,88(sp)
     52e:	4bf6                	lw	s7,92(sp)
     530:	5c06                	lw	s8,96(sp)
     532:	5c96                	lw	s9,100(sp)
     534:	5d26                	lw	s10,104(sp)
     536:	5db6                	lw	s11,108(sp)
     538:	5e46                	lw	t3,112(sp)
     53a:	5ed6                	lw	t4,116(sp)
     53c:	5f66                	lw	t5,120(sp)
     53e:	5ff6                	lw	t6,124(sp)
     540:	4122                	lw	sp,8(sp)
     542:	30200073          	mret
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
     546:	800007b7          	lui	a5,0x80000
     54a:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     54e:	43dc                	lw	a5,4(a5)
     550:	b741                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
     552:	800007b7          	lui	a5,0x80000
     556:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     55a:	479c                	lw	a5,8(a5)
     55c:	bf95                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
     55e:	800007b7          	lui	a5,0x80000
     562:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     566:	47dc                	lw	a5,12(a5)
     568:	b7a5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
     56a:	800007b7          	lui	a5,0x80000
     56e:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     572:	4b9c                	lw	a5,16(a5)
     574:	bfb1                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
     576:	800007b7          	lui	a5,0x80000
     57a:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     57e:	4bdc                	lw	a5,20(a5)
     580:	bf81                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
     582:	800007b7          	lui	a5,0x80000
     586:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     58a:	4f9c                	lw	a5,24(a5)
     58c:	b791                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
     58e:	800007b7          	lui	a5,0x80000
     592:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     596:	4fdc                	lw	a5,28(a5)
     598:	bf25                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
     59a:	800007b7          	lui	a5,0x80000
     59e:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5a2:	539c                	lw	a5,32(a5)
     5a4:	b735                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
     5a6:	800007b7          	lui	a5,0x80000
     5aa:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5ae:	53dc                	lw	a5,36(a5)
     5b0:	b705                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
     5b2:	800007b7          	lui	a5,0x80000
     5b6:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5ba:	579c                	lw	a5,40(a5)
     5bc:	bf11                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
     5be:	800007b7          	lui	a5,0x80000
     5c2:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5c6:	57dc                	lw	a5,44(a5)
     5c8:	b721                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
     5ca:	800007b7          	lui	a5,0x80000
     5ce:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5d2:	5b9c                	lw	a5,48(a5)
     5d4:	bdf5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
     5d6:	800007b7          	lui	a5,0x80000
     5da:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5de:	5bdc                	lw	a5,52(a5)
     5e0:	bdc5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
     5e2:	800007b7          	lui	a5,0x80000
     5e6:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5ea:	5f9c                	lw	a5,56(a5)
     5ec:	b5d5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
     5ee:	800007b7          	lui	a5,0x80000
     5f2:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     5f6:	5fdc                	lw	a5,60(a5)
     5f8:	bde1                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
     5fa:	800007b7          	lui	a5,0x80000
     5fe:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     602:	43bc                	lw	a5,64(a5)
     604:	b5f1                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
     606:	800007b7          	lui	a5,0x80000
     60a:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     60e:	43fc                	lw	a5,68(a5)
     610:	b5c1                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
     612:	800007b7          	lui	a5,0x80000
     616:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     61a:	47bc                	lw	a5,72(a5)
     61c:	bd55                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
     61e:	800007b7          	lui	a5,0x80000
     622:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     626:	47fc                	lw	a5,76(a5)
     628:	b565                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
     62a:	800007b7          	lui	a5,0x80000
     62e:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     632:	4bbc                	lw	a5,80(a5)
     634:	bd71                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
     636:	800007b7          	lui	a5,0x80000
     63a:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     63e:	4bfc                	lw	a5,84(a5)
     640:	bd41                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
     642:	800007b7          	lui	a5,0x80000
     646:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     64a:	4fbc                	lw	a5,88(a5)
     64c:	b551                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
     64e:	800007b7          	lui	a5,0x80000
     652:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     656:	4ffc                	lw	a5,92(a5)
     658:	bda5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
     65a:	800007b7          	lui	a5,0x80000
     65e:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     662:	53bc                	lw	a5,96(a5)
     664:	b5b5                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
     666:	800007b7          	lui	a5,0x80000
     66a:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     66e:	53fc                	lw	a5,100(a5)
     670:	b585                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
     672:	800007b7          	lui	a5,0x80000
     676:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     67a:	57bc                	lw	a5,104(a5)
     67c:	bd91                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
     67e:	800007b7          	lui	a5,0x80000
     682:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     686:	57fc                	lw	a5,108(a5)
     688:	b5a1                	j	4d0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
     68a:	800007b7          	lui	a5,0x80000
     68e:	56c78793          	add	a5,a5,1388 # 8000056c <__neorv32_rte_vector_lut>
     692:	5bbc                	lw	a5,112(a5)
     694:	bd35                	j	4d0 <neorv32_rte_core+0x94>
     696:	0000                	unimp

00000698 <matrix_sum>:
#endif
  return N;
}

/* Function: matrix_sum */
ee_s16 matrix_sum(ee_u32 N, MATRES *C, MATDAT clipval) {
     698:	86aa                	mv	a3,a0
  MATRES tmp = 0, prev = 0, cur = 0;
  ee_s16 ret = 0;
  ee_u32 i, j;

  for (i = 0; i < N; i++) {
     69a:	4e01                	li	t3,0
     69c:	4e81                	li	t4,0
  ee_s16 ret = 0;
     69e:	4501                	li	a0,0
  MATRES tmp = 0, prev = 0, cur = 0;
     6a0:	4881                	li	a7,0
     6a2:	4801                	li	a6,0
  for (i = 0; i < N; i++) {
     6a4:	04de8263          	beq	t4,a3,6e8 <matrix_sum+0x50>
    for (j = 0; j < N; j++) {
     6a8:	002e1713          	sll	a4,t3,0x2
     6ac:	972e                	add	a4,a4,a1
     6ae:	4301                	li	t1,0
      cur = C[i * N + j];
     6b0:	8f46                	mv	t5,a7
     6b2:	00072883          	lw	a7,0(a4)
      tmp += cur;
      if (tmp > clipval) { ret += 10; tmp = 0; }
     6b6:	01051793          	sll	a5,a0,0x10
     6ba:	83c1                	srl	a5,a5,0x10
      tmp += cur;
     6bc:	9846                	add	a6,a6,a7
      if (tmp > clipval) { ret += 10; tmp = 0; }
     6be:	01065e63          	bge	a2,a6,6da <matrix_sum+0x42>
     6c2:	07a9                	add	a5,a5,10
     6c4:	01079513          	sll	a0,a5,0x10
     6c8:	8541                	sra	a0,a0,0x10
     6ca:	4801                	li	a6,0
    for (j = 0; j < N; j++) {
     6cc:	0305                	add	t1,t1,1
     6ce:	0711                	add	a4,a4,4
     6d0:	fe6690e3          	bne	a3,t1,6b0 <matrix_sum+0x18>
  for (i = 0; i < N; i++) {
     6d4:	0e85                	add	t4,t4,1
     6d6:	9e36                	add	t3,t3,a3
     6d8:	b7f1                	j	6a4 <matrix_sum+0xc>
      else               { ret += (cur > prev) ? 1 : 0; }
     6da:	011f2f33          	slt	t5,t5,a7
     6de:	97fa                	add	a5,a5,t5
     6e0:	01079513          	sll	a0,a5,0x10
     6e4:	8541                	sra	a0,a0,0x10
     6e6:	b7dd                	j	6cc <matrix_sum+0x34>
      prev = cur;
    }
  }
  return ret;
}
     6e8:	8082                	ret

000006ea <matrix_add_const>:
}

/* Function: matrix_add_const */
void matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val) {
  ee_u32 i, j;
  for (i = 0; i < N; i++) {
     6ea:	4681                	li	a3,0
     6ec:	4701                	li	a4,0
     6ee:	00a71363          	bne	a4,a0,6f4 <matrix_add_const+0xa>
    for (j = 0; j < N; j++) {
      A[i * N + j] += val;
    }
  }
}
     6f2:	8082                	ret
     6f4:	00169793          	sll	a5,a3,0x1
     6f8:	97ae                	add	a5,a5,a1
    for (j = 0; j < N; j++) {
     6fa:	4801                	li	a6,0
      A[i * N + j] += val;
     6fc:	0007d883          	lhu	a7,0(a5)
    for (j = 0; j < N; j++) {
     700:	0805                	add	a6,a6,1
     702:	0789                	add	a5,a5,2
      A[i * N + j] += val;
     704:	98b2                	add	a7,a7,a2
     706:	ff179f23          	sh	a7,-2(a5)
    for (j = 0; j < N; j++) {
     70a:	ff0519e3          	bne	a0,a6,6fc <matrix_add_const+0x12>
  for (i = 0; i < N; i++) {
     70e:	0705                	add	a4,a4,1
     710:	96aa                	add	a3,a3,a0
     712:	bff1                	j	6ee <matrix_add_const+0x4>

00000714 <start_time>:
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     714:	c8002773          	rdcycleh	a4
     718:	c00026f3          	rdcycle	a3
     71c:	c80027f3          	rdcycleh	a5
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     720:	fef71ae3          	bne	a4,a5,714 <start_time>
  /* Not used by CoreMark when SAMPLE_TIME_IMPLEMENTATION is set; keep stub. */
  return 1;
}

void start_time(void) {
  GETMYTIME(&start_time_val);
     724:	800007b7          	lui	a5,0x80000
     728:	54d7a423          	sw	a3,1352(a5) # 80000548 <start_time_val>
     72c:	54e7a623          	sw	a4,1356(a5)
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     730:	4781                	li	a5,0
     732:	32079073          	csrw	mcountinhibit,a5
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, 0); /* start all counters */
}
     736:	8082                	ret

00000738 <stop_time>:
     738:	57fd                	li	a5,-1
     73a:	32079073          	csrw	mcountinhibit,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     73e:	c8002773          	rdcycleh	a4
     742:	c00026f3          	rdcycle	a3
     746:	c80027f3          	rdcycleh	a5
     74a:	fef71ae3          	bne	a4,a5,73e <stop_time+0x6>

void stop_time(void) {
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1); /* stop all counters */
  GETMYTIME(&stop_time_val);
     74e:	800007b7          	lui	a5,0x80000
     752:	54d7a823          	sw	a3,1360(a5) # 80000550 <stop_time_val>
     756:	54e7aa23          	sw	a4,1364(a5)
}
     75a:	8082                	ret

0000075c <core_state_transition>:
        if (NEXT_SYMBOL == ',') /* end of this input */
        {
            str++;
            break;
        }
        switch (state)
     75c:	660d                	lui	a2,0x3
    ee_u8 *         str = *instr;
     75e:	4118                	lw	a4,0(a0)
{
     760:	86aa                	mv	a3,a0
    for (; *str && state != CORE_INVALID; str++)
     762:	4305                	li	t1,1
    enum CORE_STATE state = CORE_START;
     764:	4501                	li	a0,0
        if (NEXT_SYMBOL == ',') /* end of this input */
     766:	02c00e13          	li	t3,44
        switch (state)
     76a:	4e9d                	li	t4,7
     76c:	bbc60613          	add	a2,a2,-1092 # 2bbc <__fini_array_end+0xa4>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     770:	4825                	li	a6,9
                    state = CORE_INVALID;
                    transition_count[CORE_INT]++;
                }
                break;
            case CORE_FLOAT:
                if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
     772:	04500f13          	li	t5,69
                if (NEXT_SYMBOL == '.')
     776:	02e00893          	li	a7,46
    for (; *str && state != CORE_INVALID; str++)
     77a:	00074783          	lbu	a5,0(a4)
     77e:	c399                	beqz	a5,784 <core_state_transition+0x28>
     780:	00651463          	bne	a0,t1,788 <core_state_transition+0x2c>
                break;
            default:
                break;
        }
    }
    *instr = str;
     784:	c298                	sw	a4,0(a3)
    return state;
}
     786:	8082                	ret
        if (NEXT_SYMBOL == ',') /* end of this input */
     788:	0705                	add	a4,a4,1
     78a:	ffc78de3          	beq	a5,t3,784 <core_state_transition+0x28>
        switch (state)
     78e:	feaee6e3          	bltu	t4,a0,77a <core_state_transition+0x1e>
     792:	00251f93          	sll	t6,a0,0x2
     796:	9fb2                	add	t6,t6,a2
     798:	000faf83          	lw	t6,0(t6)
     79c:	8f82                	jr	t6
     79e:	4515                	li	a0,5
     7a0:	01178a63          	beq	a5,a7,7b4 <core_state_transition+0x58>
     7a4:	00f8ec63          	bltu	a7,a5,7bc <core_state_transition+0x60>
     7a8:	fd578793          	add	a5,a5,-43
     7ac:	0fd7f793          	and	a5,a5,253
     7b0:	4509                	li	a0,2
     7b2:	ef89                	bnez	a5,7cc <core_state_transition+0x70>
                transition_count[CORE_START]++;
     7b4:	419c                	lw	a5,0(a1)
     7b6:	0785                	add	a5,a5,1
     7b8:	c19c                	sw	a5,0(a1)
                break;
     7ba:	b7c1                	j	77a <core_state_transition+0x1e>
     7bc:	fd078793          	add	a5,a5,-48
     7c0:	0ff7f793          	zext.b	a5,a5
     7c4:	4fa5                	li	t6,9
        switch (state)
     7c6:	4511                	li	a0,4
     7c8:	fefff6e3          	bgeu	t6,a5,7b4 <core_state_transition+0x58>
                    transition_count[CORE_INVALID]++;
     7cc:	41dc                	lw	a5,4(a1)
                    state = CORE_INVALID;
     7ce:	4505                	li	a0,1
                    transition_count[CORE_INVALID]++;
     7d0:	0785                	add	a5,a5,1
     7d2:	c1dc                	sw	a5,4(a1)
     7d4:	b7c5                	j	7b4 <core_state_transition+0x58>
                    transition_count[CORE_S1]++;
     7d6:	4588                	lw	a0,8(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     7d8:	fd078f93          	add	t6,a5,-48
     7dc:	0fffff93          	zext.b	t6,t6
                    transition_count[CORE_S1]++;
     7e0:	0505                	add	a0,a0,1
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     7e2:	01f87963          	bgeu	a6,t6,7f4 <core_state_transition+0x98>
                else if (NEXT_SYMBOL == '.')
     7e6:	02e00f93          	li	t6,46
     7ea:	01f79863          	bne	a5,t6,7fa <core_state_transition+0x9e>
                    transition_count[CORE_S1]++;
     7ee:	c588                	sw	a0,8(a1)
                    state = CORE_FLOAT;
     7f0:	4515                	li	a0,5
     7f2:	b761                	j	77a <core_state_transition+0x1e>
                    transition_count[CORE_S1]++;
     7f4:	c588                	sw	a0,8(a1)
                    state = CORE_FLOAT;
     7f6:	4511                	li	a0,4
     7f8:	b749                	j	77a <core_state_transition+0x1e>
                    transition_count[CORE_S1]++;
     7fa:	c588                	sw	a0,8(a1)
                    state = CORE_INVALID;
     7fc:	4505                	li	a0,1
     7fe:	bfb5                	j	77a <core_state_transition+0x1e>
                if (NEXT_SYMBOL == '.')
     800:	01179663          	bne	a5,a7,80c <core_state_transition+0xb0>
                    transition_count[CORE_INT]++;
     804:	499c                	lw	a5,16(a1)
     806:	0785                	add	a5,a5,1
     808:	c99c                	sw	a5,16(a1)
     80a:	b7dd                	j	7f0 <core_state_transition+0x94>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     80c:	fd078793          	add	a5,a5,-48
     810:	0ff7f793          	zext.b	a5,a5
     814:	4525                	li	a0,9
     816:	fef570e3          	bgeu	a0,a5,7f6 <core_state_transition+0x9a>
                    transition_count[CORE_INT]++;
     81a:	499c                	lw	a5,16(a1)
     81c:	0785                	add	a5,a5,1
     81e:	c99c                	sw	a5,16(a1)
     820:	bff1                	j	7fc <core_state_transition+0xa0>
                if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
     822:	0df7f513          	and	a0,a5,223
     826:	01e51763          	bne	a0,t5,834 <core_state_transition+0xd8>
                    transition_count[CORE_FLOAT]++;
     82a:	49dc                	lw	a5,20(a1)
                    state = CORE_S2;
     82c:	450d                	li	a0,3
                    transition_count[CORE_FLOAT]++;
     82e:	0785                	add	a5,a5,1
     830:	c9dc                	sw	a5,20(a1)
     832:	b7a1                	j	77a <core_state_transition+0x1e>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     834:	fd078793          	add	a5,a5,-48
     838:	0ff7f793          	zext.b	a5,a5
     83c:	4525                	li	a0,9
     83e:	faf579e3          	bgeu	a0,a5,7f0 <core_state_transition+0x94>
                    transition_count[CORE_FLOAT]++;
     842:	49dc                	lw	a5,20(a1)
     844:	0785                	add	a5,a5,1
     846:	c9dc                	sw	a5,20(a1)
     848:	bf55                	j	7fc <core_state_transition+0xa0>
                    transition_count[CORE_S2]++;
     84a:	45c8                	lw	a0,12(a1)
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
     84c:	fd578793          	add	a5,a5,-43
     850:	0fd7f793          	and	a5,a5,253
                    transition_count[CORE_S2]++;
     854:	0505                	add	a0,a0,1
     856:	c5c8                	sw	a0,12(a1)
                    state = CORE_EXPONENT;
     858:	4519                	li	a0,6
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
     85a:	f3cd                	bnez	a5,7fc <core_state_transition+0xa0>
     85c:	bf39                	j	77a <core_state_transition+0x1e>
                    transition_count[CORE_EXPONENT]++;
     85e:	4d88                	lw	a0,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     860:	fd078793          	add	a5,a5,-48
     864:	0ff7f793          	zext.b	a5,a5
                    transition_count[CORE_EXPONENT]++;
     868:	0505                	add	a0,a0,1
                    transition_count[CORE_EXPONENT]++;
     86a:	cd88                	sw	a0,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     86c:	f8f868e3          	bltu	a6,a5,7fc <core_state_transition+0xa0>
                    state = CORE_SCIENTIFIC;
     870:	451d                	li	a0,7
     872:	b721                	j	77a <core_state_transition+0x1e>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
     874:	fd078793          	add	a5,a5,-48
     878:	0ff7f793          	zext.b	a5,a5
     87c:	fef87ae3          	bgeu	a6,a5,870 <core_state_transition+0x114>
                    transition_count[CORE_INVALID]++;
     880:	41dc                	lw	a5,4(a1)
     882:	0785                	add	a5,a5,1
     884:	c1dc                	sw	a5,4(a1)
     886:	bf9d                	j	7fc <core_state_transition+0xa0>

00000888 <crcu8>:
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
        data >>= 1;

        if (x16 == 1)
        {
            crc ^= 0x4002;
     888:	6611                	lui	a2,0x4
{
     88a:	86aa                	mv	a3,a0
     88c:	4721                	li	a4,8
     88e:	852e                	mv	a0,a1
            crc ^= 0x4002;
     890:	0609                	add	a2,a2,2 # 4002 <__neorv32_rom_size+0x2>
            carry = 1;
        }
        else
            carry = 0;
        crc >>= 1;
        if (carry)
     892:	7861                	lui	a6,0xffff8
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
     894:	00a6c7b3          	xor	a5,a3,a0
     898:	8b85                	and	a5,a5,1
        data >>= 1;
     89a:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
     89c:	c391                	beqz	a5,8a0 <crcu8+0x18>
            crc ^= 0x4002;
     89e:	8d31                	xor	a0,a0,a2
        if (carry)
     8a0:	40f007b3          	neg	a5,a5
        crc >>= 1;
     8a4:	00155593          	srl	a1,a0,0x1
        if (carry)
     8a8:	0107f7b3          	and	a5,a5,a6
     8ac:	8fcd                	or	a5,a5,a1
    for (i = 0; i < 8; i++)
     8ae:	177d                	add	a4,a4,-1
        if (carry)
     8b0:	01079513          	sll	a0,a5,0x10
    for (i = 0; i < 8; i++)
     8b4:	0ff77713          	zext.b	a4,a4
        if (carry)
     8b8:	8141                	srl	a0,a0,0x10
    for (i = 0; i < 8; i++)
     8ba:	ff69                	bnez	a4,894 <crcu8+0xc>
            crc |= 0x8000;
        else
            crc &= 0x7fff;
    }
    return crc;
}
     8bc:	8082                	ret

000008be <crcu16>:
ee_u16
crcu16(ee_u16 newval, ee_u16 crc)
{
     8be:	1141                	add	sp,sp,-16
     8c0:	c422                	sw	s0,8(sp)
     8c2:	842a                	mv	s0,a0
    crc = crcu8((ee_u8)(newval), crc);
     8c4:	0ff57513          	zext.b	a0,a0
{
     8c8:	c606                	sw	ra,12(sp)
    crc = crcu8((ee_u8)(newval), crc);
     8ca:	3f7d                	jal	888 <crcu8>
     8cc:	85aa                	mv	a1,a0
    crc = crcu8((ee_u8)((newval) >> 8), crc);
     8ce:	00845513          	srl	a0,s0,0x8
    return crc;
}
     8d2:	4422                	lw	s0,8(sp)
     8d4:	40b2                	lw	ra,12(sp)
     8d6:	0141                	add	sp,sp,16
    crc = crcu8((ee_u8)((newval) >> 8), crc);
     8d8:	bf45                	j	888 <crcu8>

000008da <calc_func>:
{
     8da:	7175                	add	sp,sp,-144
     8dc:	dece                	sw	s3,124(sp)
    ee_s16 data = *pdata;
     8de:	00051983          	lh	s3,0(a0)
{
     8e2:	c706                	sw	ra,140(sp)
     8e4:	c522                	sw	s0,136(sp)
    ee_u8  optype = (data >> 7) & 1;  /* bit 7 indicates if the function result has been cached */
     8e6:	4079d793          	sra	a5,s3,0x7
{
     8ea:	c326                	sw	s1,132(sp)
     8ec:	c14a                	sw	s2,128(sp)
     8ee:	dcd2                	sw	s4,120(sp)
     8f0:	dad6                	sw	s5,116(sp)
     8f2:	d8da                	sw	s6,112(sp)
     8f4:	d6de                	sw	s7,108(sp)
     8f6:	d4e2                	sw	s8,104(sp)
     8f8:	d2e6                	sw	s9,100(sp)
     8fa:	d0ea                	sw	s10,96(sp)
     8fc:	ceee                	sw	s11,92(sp)
    if (optype) /* if cached, use cache */
     8fe:	8b85                	and	a5,a5,1
     900:	c395                	beqz	a5,924 <calc_func+0x4a>
        return (data & 0x007f);
     902:	07f9f513          	and	a0,s3,127
}
     906:	40ba                	lw	ra,140(sp)
     908:	442a                	lw	s0,136(sp)
     90a:	449a                	lw	s1,132(sp)
     90c:	490a                	lw	s2,128(sp)
     90e:	59f6                	lw	s3,124(sp)
     910:	5a66                	lw	s4,120(sp)
     912:	5ad6                	lw	s5,116(sp)
     914:	5b46                	lw	s6,112(sp)
     916:	5bb6                	lw	s7,108(sp)
     918:	5c26                	lw	s8,104(sp)
     91a:	5c96                	lw	s9,100(sp)
     91c:	5d06                	lw	s10,96(sp)
     91e:	4df6                	lw	s11,92(sp)
     920:	6149                	add	sp,sp,144
     922:	8082                	ret
        ee_s16 dtype = ((data >> 3) & 0xf);       /* bits 3-6 is specific data for the operation */
     924:	4039da93          	sra	s5,s3,0x3
     928:	00fafa93          	and	s5,s5,15
     92c:	4745                	li	a4,17
     92e:	02ea8ab3          	mul	s5,s5,a4
        ee_s16 flag  = data & 0x7; /* bits 0-2 is type of function to perform */
     932:	0079f793          	and	a5,s3,7
                retval = core_bench_state(res->size,
     936:	0385d403          	lhu	s0,56(a1)
     93a:	8a2a                	mv	s4,a0
     93c:	892e                	mv	s2,a1
        dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
     93e:	010a9c93          	sll	s9,s5,0x10
     942:	410cdc93          	sra	s9,s9,0x10
        switch (flag)
     946:	cb85                	beqz	a5,976 <calc_func+0x9c>
     948:	4705                	li	a4,1
     94a:	12e78c63          	beq	a5,a4,a82 <calc_func+0x1a8>
     94e:	844e                	mv	s0,s3
        res->crc = crcu16(retval, res->crc);
     950:	03895583          	lhu	a1,56(s2)
     954:	01041513          	sll	a0,s0,0x10
     958:	8141                	srl	a0,a0,0x10
     95a:	3795                	jal	8be <crcu16>
     95c:	02a91c23          	sh	a0,56(s2)
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     960:	f009f993          	and	s3,s3,-256
        retval &= 0x007f;
     964:	07f47513          	and	a0,s0,127
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     968:	013569b3          	or	s3,a0,s3
     96c:	0809e993          	or	s3,s3,128
     970:	013a1023          	sh	s3,0(s4)
        return retval;
     974:	bf49                	j	906 <calc_func+0x2c>
                if (dtype < 0x22) /* set min period for bit corruption */
     976:	02100793          	li	a5,33
     97a:	0157e463          	bltu	a5,s5,982 <calc_func+0xa8>
                    dtype = 0x22;
     97e:	02200c93          	li	s9,34
                                          res->memblock[3],
     982:	01492483          	lw	s1,20(s2)
        final_counts[i] = track_counts[i] = 0;
     986:	02000613          	li	a2,32
     98a:	4581                	li	a1,0
     98c:	1808                	add	a0,sp,48
                retval = core_bench_state(res->size,
     98e:	01892b03          	lw	s6,24(s2)
     992:	00091b83          	lh	s7,0(s2)
     996:	00291a83          	lh	s5,2(s2)
    ee_u8 *p = memblock;
     99a:	c626                	sw	s1,12(sp)
        final_counts[i] = track_counts[i] = 0;
     99c:	3c9010ef          	jal	2564 <memset>
     9a0:	02000613          	li	a2,32
     9a4:	4581                	li	a1,0
     9a6:	0808                	add	a0,sp,16
     9a8:	3bd010ef          	jal	2564 <memset>
    while (*p != 0)
     9ac:	47b2                	lw	a5,12(sp)
     9ae:	0007c783          	lbu	a5,0(a5)
     9b2:	eba5                	bnez	a5,a22 <calc_func+0x148>
    p = memblock;
     9b4:	c626                	sw	s1,12(sp)
    while (p < (memblock + blksize))
     9b6:	87a6                	mv	a5,s1
     9b8:	9b26                	add	s6,s6,s1
        if (*p != ',')
     9ba:	02c00693          	li	a3,44
    while (p < (memblock + blksize))
     9be:	0967e063          	bltu	a5,s6,a3e <calc_func+0x164>
    while (*p != 0)
     9c2:	47b2                	lw	a5,12(sp)
     9c4:	0007c783          	lbu	a5,0(a5)
     9c8:	e7c9                	bnez	a5,a52 <calc_func+0x178>
        if (*p != ',')
     9ca:	02c00713          	li	a4,44
    while (p < (memblock + blksize))
     9ce:	0b64e063          	bltu	s1,s6,a6e <calc_func+0x194>
     9d2:	4481                	li	s1,0
    for (i = 0; i < NUM_CORE_STATES; i++)
     9d4:	02000b13          	li	s6,32
        crc = crcu32(final_counts[i], crc);
     9d8:	081c                	add	a5,sp,16
     9da:	97a6                	add	a5,a5,s1
     9dc:	0007aa83          	lw	s5,0(a5)
    return crc;
}
ee_u16
crc16(ee_s16 newval, ee_u16 crc)
{
    return crcu16((ee_u16)newval, crc);
     9e0:	85a2                	mv	a1,s0
     9e2:	010a9513          	sll	a0,s5,0x10
     9e6:	8141                	srl	a0,a0,0x10
     9e8:	3dd9                	jal	8be <crcu16>
     9ea:	85aa                	mv	a1,a0
     9ec:	010ad513          	srl	a0,s5,0x10
     9f0:	35f9                	jal	8be <crcu16>
        crc = crcu32(track_counts[i], crc);
     9f2:	181c                	add	a5,sp,48
     9f4:	97a6                	add	a5,a5,s1
     9f6:	4380                	lw	s0,0(a5)
     9f8:	85aa                	mv	a1,a0
    for (i = 0; i < NUM_CORE_STATES; i++)
     9fa:	0491                	add	s1,s1,4
     9fc:	01041513          	sll	a0,s0,0x10
     a00:	8141                	srl	a0,a0,0x10
     a02:	3d75                	jal	8be <crcu16>
     a04:	85aa                	mv	a1,a0
     a06:	01045513          	srl	a0,s0,0x10
     a0a:	3d55                	jal	8be <crcu16>
     a0c:	842a                	mv	s0,a0
     a0e:	fd6495e3          	bne	s1,s6,9d8 <calc_func+0xfe>
                if (res->crcstate == 0)
     a12:	03e95783          	lhu	a5,62(s2)
     a16:	e399                	bnez	a5,a1c <calc_func+0x142>
                    res->crcstate = retval;
     a18:	02a91f23          	sh	a0,62(s2)
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     a1c:	0442                	sll	s0,s0,0x10
     a1e:	8441                	sra	s0,s0,0x10
     a20:	bf05                	j	950 <calc_func+0x76>
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
     a22:	180c                	add	a1,sp,48
     a24:	0068                	add	a0,sp,12
     a26:	3b1d                	jal	75c <core_state_transition>
        final_counts[fstate]++;
     a28:	050a                	sll	a0,a0,0x2
     a2a:	05050793          	add	a5,a0,80
     a2e:	00278533          	add	a0,a5,sp
     a32:	fc052783          	lw	a5,-64(a0)
     a36:	0785                	add	a5,a5,1
     a38:	fcf52023          	sw	a5,-64(a0)
     a3c:	bf85                	j	9ac <calc_func+0xd2>
        if (*p != ',')
     a3e:	0007c703          	lbu	a4,0(a5)
     a42:	00d70663          	beq	a4,a3,a4e <calc_func+0x174>
            *p ^= (ee_u8)seed1;
     a46:	01774733          	xor	a4,a4,s7
     a4a:	00e78023          	sb	a4,0(a5)
        p += step;
     a4e:	97e6                	add	a5,a5,s9
     a50:	b7bd                	j	9be <calc_func+0xe4>
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
     a52:	180c                	add	a1,sp,48
     a54:	0068                	add	a0,sp,12
     a56:	3319                	jal	75c <core_state_transition>
        final_counts[fstate]++;
     a58:	050a                	sll	a0,a0,0x2
     a5a:	05050793          	add	a5,a0,80
     a5e:	00278533          	add	a0,a5,sp
     a62:	fc052783          	lw	a5,-64(a0)
     a66:	0785                	add	a5,a5,1
     a68:	fcf52023          	sw	a5,-64(a0)
     a6c:	bf99                	j	9c2 <calc_func+0xe8>
        if (*p != ',')
     a6e:	0004c783          	lbu	a5,0(s1)
     a72:	00e78663          	beq	a5,a4,a7e <calc_func+0x1a4>
            *p ^= (ee_u8)seed2;
     a76:	0157c7b3          	xor	a5,a5,s5
     a7a:	00f48023          	sb	a5,0(s1)
        p += step;
     a7e:	94e6                	add	s1,s1,s9
     a80:	b7b9                	j	9ce <calc_func+0xf4>
  ee_u32  N   = p->N;
     a82:	5584                	lw	s1,40(a1)
  MATDAT *A   = p->A;
     a84:	02c5ab83          	lw	s7,44(a1)
  MATRES *C   = p->C;
     a88:	0345ab03          	lw	s6,52(a1)
  MATDAT *B   = p->B;
     a8c:	0305ad03          	lw	s10,48(a1)
  matrix_add_const(N, A, val);
     a90:	8666                	mv	a2,s9
     a92:	85de                	mv	a1,s7
     a94:	8526                	mv	a0,s1
     a96:	3991                	jal	6ea <matrix_add_const>
  MATDAT clipval = matrix_big(val);
     a98:	7c7d                	lui	s8,0xfffff
     a9a:	018aec33          	or	s8,s5,s8
  matrix_add_const(N, A, val);
     a9e:	4681                	li	a3,0
  for (i = 0; i < N; i++) {
     aa0:	4601                	li	a2,0
     aa2:	04c49663          	bne	s1,a2,aee <calc_func+0x214>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     aa6:	8662                	mv	a2,s8
     aa8:	85da                	mv	a1,s6
     aaa:	8526                	mv	a0,s1
     aac:	36f5                	jal	698 <matrix_sum>
     aae:	0542                	sll	a0,a0,0x10
     ab0:	4581                	li	a1,0
     ab2:	8141                	srl	a0,a0,0x10
     ab4:	3529                	jal	8be <crcu16>
     ab6:	8caa                	mv	s9,a0

/* Function: matrix_mul_vect */
void matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
  ee_u32 i, j;
  for (i = 0; i < N; i++) {
     ab8:	00149d93          	sll	s11,s1,0x1
     abc:	4681                	li	a3,0
     abe:	4701                	li	a4,0
     ac0:	04e49b63          	bne	s1,a4,b16 <calc_func+0x23c>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     ac4:	8662                	mv	a2,s8
     ac6:	85da                	mv	a1,s6
     ac8:	8526                	mv	a0,s1
     aca:	36f9                	jal	698 <matrix_sum>
     acc:	0542                	sll	a0,a0,0x10
     ace:	85e6                	mv	a1,s9
     ad0:	8141                	srl	a0,a0,0x10
     ad2:	33f5                	jal	8be <crcu16>
     ad4:	8caa                	mv	s9,a0
     ad6:	4601                	li	a2,0
}

/* Function: matrix_mul_matrix */
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
  ee_u32 i, j, k;
  for (i = 0; i < N; i++) {
     ad8:	4801                	li	a6,0
     ada:	0b048763          	beq	s1,a6,b88 <calc_func+0x2ae>
     ade:	00261793          	sll	a5,a2,0x2
     ae2:	00161513          	sll	a0,a2,0x1
     ae6:	97da                	add	a5,a5,s6
     ae8:	955e                	add	a0,a0,s7
    for (j = 0; j < N; j++) {
     aea:	4681                	li	a3,0
     aec:	a061                	j	b74 <calc_func+0x29a>
     aee:	00169713          	sll	a4,a3,0x1
     af2:	00269793          	sll	a5,a3,0x2
     af6:	975e                	add	a4,a4,s7
     af8:	97da                	add	a5,a5,s6
    for (j = 0; j < N; j++) {
     afa:	4581                	li	a1,0
      C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
     afc:	00071503          	lh	a0,0(a4)
    for (j = 0; j < N; j++) {
     b00:	0585                	add	a1,a1,1
     b02:	0709                	add	a4,a4,2
      C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
     b04:	03550533          	mul	a0,a0,s5
     b08:	c388                	sw	a0,0(a5)
    for (j = 0; j < N; j++) {
     b0a:	0791                	add	a5,a5,4
     b0c:	feb498e3          	bne	s1,a1,afc <calc_func+0x222>
  for (i = 0; i < N; i++) {
     b10:	0605                	add	a2,a2,1
     b12:	96a6                	add	a3,a3,s1
     b14:	b779                	j	aa2 <calc_func+0x1c8>
     b16:	00169513          	sll	a0,a3,0x1
     b1a:	955e                	add	a0,a0,s7
  for (i = 0; i < N; i++) {
     b1c:	4781                	li	a5,0
    int32_t acc = 0;
     b1e:	4601                	li	a2,0
      acc += (MATRES)A[i * N + j] * (MATRES)B[j];
     b20:	00f505b3          	add	a1,a0,a5
     b24:	00fd0833          	add	a6,s10,a5
     b28:	00059583          	lh	a1,0(a1)
     b2c:	00081803          	lh	a6,0(a6) # ffff8000 <__crt0_ram_last+0x7fff6001>
    for (j = 0; j < N; j++) {
     b30:	0789                	add	a5,a5,2
      acc += (MATRES)A[i * N + j] * (MATRES)B[j];
     b32:	030585b3          	mul	a1,a1,a6
     b36:	962e                	add	a2,a2,a1
    for (j = 0; j < N; j++) {
     b38:	fefd94e3          	bne	s11,a5,b20 <calc_func+0x246>
    C[i] = (MATRES)acc;
     b3c:	00271793          	sll	a5,a4,0x2
     b40:	97da                	add	a5,a5,s6
     b42:	c390                	sw	a2,0(a5)
  for (i = 0; i < N; i++) {
     b44:	0705                	add	a4,a4,1
     b46:	96a6                	add	a3,a3,s1
     b48:	bfa5                	j	ac0 <calc_func+0x1e6>
      int32_t acc = 0;
      for (k = 0; k < N; k++) {
#ifdef USE_CFU
        acc += cfu_mul32((int32_t)A[i * N + k], (int32_t)B[k * N + j]);
#else
        acc += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
     b4a:	00031e03          	lh	t3,0(t1)
     b4e:	00071e83          	lh	t4,0(a4)
      for (k = 0; k < N; k++) {
     b52:	0309                	add	t1,t1,2
     b54:	976e                	add	a4,a4,s11
        acc += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
     b56:	03de0e33          	mul	t3,t3,t4
     b5a:	98f2                	add	a7,a7,t3
      for (k = 0; k < N; k++) {
     b5c:	8e2e                	mv	t3,a1
     b5e:	0585                	add	a1,a1,1
     b60:	feb495e3          	bne	s1,a1,b4a <calc_func+0x270>
#endif
      }
      C[i * N + j] = (MATRES)acc;
     b64:	0117a023          	sw	a7,0(a5)
    for (j = 0; j < N; j++) {
     b68:	00168713          	add	a4,a3,1
     b6c:	0791                	add	a5,a5,4
     b6e:	01c68a63          	beq	a3,t3,b82 <calc_func+0x2a8>
     b72:	86ba                	mv	a3,a4
      for (k = 0; k < N; k++) {
     b74:	00169713          	sll	a4,a3,0x1
     b78:	976a                	add	a4,a4,s10
  for (i = 0; i < N; i++) {
     b7a:	832a                	mv	t1,a0
      int32_t acc = 0;
     b7c:	4881                	li	a7,0
      for (k = 0; k < N; k++) {
     b7e:	4581                	li	a1,0
     b80:	b7e9                	j	b4a <calc_func+0x270>
  for (i = 0; i < N; i++) {
     b82:	0805                	add	a6,a6,1
     b84:	9626                	add	a2,a2,s1
     b86:	bf91                	j	ada <calc_func+0x200>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     b88:	8662                	mv	a2,s8
     b8a:	85da                	mv	a1,s6
     b8c:	8526                	mv	a0,s1
     b8e:	3629                	jal	698 <matrix_sum>
     b90:	0542                	sll	a0,a0,0x10
     b92:	85e6                	mv	a1,s9
     b94:	8141                	srl	a0,a0,0x10
     b96:	3325                	jal	8be <crcu16>
     b98:	8caa                	mv	s9,a0
     b9a:	4801                	li	a6,0
}

/* Function: matrix_mul_matrix_bitextract */
void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
  ee_u32 i, j, k;
  for (i = 0; i < N; i++) {
     b9c:	4881                	li	a7,0
     b9e:	07148263          	beq	s1,a7,c02 <calc_func+0x328>
     ba2:	00281713          	sll	a4,a6,0x2
     ba6:	00181793          	sll	a5,a6,0x1
     baa:	975a                	add	a4,a4,s6
     bac:	00fb8e33          	add	t3,s7,a5
    for (j = 0; j < N; j++) {
     bb0:	4301                	li	t1,0
     bb2:	a835                	j	bee <calc_func+0x314>
      int32_t acc = 0;
      for (k = 0; k < N; k++) {
#ifdef USE_CFU
        int32_t tmp = cfu_mul32((int32_t)A[i * N + k], (int32_t)B[k * N + j]);
#else
        int32_t tmp = (int32_t)((MATRES)A[i * N + k] * (MATRES)B[k * N + j]);
     bb4:	00069603          	lh	a2,0(a3)
     bb8:	00051783          	lh	a5,0(a0)
      for (k = 0; k < N; k++) {
     bbc:	96ee                	add	a3,a3,s11
     bbe:	0509                	add	a0,a0,2
        int32_t tmp = (int32_t)((MATRES)A[i * N + k] * (MATRES)B[k * N + j]);
     bc0:	02c787b3          	mul	a5,a5,a2
#endif
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     bc4:	0027d613          	srl	a2,a5,0x2
                        * bit_extract((uint32_t)tmp, 5, 7) );
     bc8:	8395                	srl	a5,a5,0x5
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     bca:	8a3d                	and	a2,a2,15
                        * bit_extract((uint32_t)tmp, 5, 7) );
     bcc:	07f7f793          	and	a5,a5,127
     bd0:	02f607b3          	mul	a5,a2,a5
     bd4:	862e                	mv	a2,a1
      for (k = 0; k < N; k++) {
     bd6:	0585                	add	a1,a1,1
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     bd8:	9ebe                	add	t4,t4,a5
      for (k = 0; k < N; k++) {
     bda:	fcb49de3          	bne	s1,a1,bb4 <calc_func+0x2da>
      }
      C[i * N + j] = (MATRES)acc;
     bde:	01d72023          	sw	t4,0(a4)
    for (j = 0; j < N; j++) {
     be2:	00130793          	add	a5,t1,1
     be6:	0711                	add	a4,a4,4
     be8:	00660a63          	beq	a2,t1,bfc <calc_func+0x322>
     bec:	833e                	mv	t1,a5
      for (k = 0; k < N; k++) {
     bee:	00131693          	sll	a3,t1,0x1
     bf2:	96ea                	add	a3,a3,s10
  for (i = 0; i < N; i++) {
     bf4:	8572                	mv	a0,t3
      int32_t acc = 0;
     bf6:	4e81                	li	t4,0
      for (k = 0; k < N; k++) {
     bf8:	4581                	li	a1,0
     bfa:	bf6d                	j	bb4 <calc_func+0x2da>
  for (i = 0; i < N; i++) {
     bfc:	0885                	add	a7,a7,1
     bfe:	9826                	add	a6,a6,s1
     c00:	bf79                	j	b9e <calc_func+0x2c4>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     c02:	8662                	mv	a2,s8
     c04:	85da                	mv	a1,s6
     c06:	8526                	mv	a0,s1
     c08:	3c41                	jal	698 <matrix_sum>
     c0a:	0542                	sll	a0,a0,0x10
     c0c:	85e6                	mv	a1,s9
     c0e:	8141                	srl	a0,a0,0x10
     c10:	317d                	jal	8be <crcu16>
     c12:	8b2a                	mv	s6,a0
  matrix_add_const(N, A, -val);
     c14:	41500633          	neg	a2,s5
     c18:	85de                	mv	a1,s7
     c1a:	8526                	mv	a0,s1
     c1c:	34f9                	jal	6ea <matrix_add_const>
     c1e:	85a2                	mv	a1,s0
     c20:	855a                	mv	a0,s6
     c22:	3971                	jal	8be <crcu16>
                if (res->crcmatrix == 0)
     c24:	03c95783          	lhu	a5,60(s2)
     c28:	842a                	mv	s0,a0
     c2a:	de0799e3          	bnez	a5,a1c <calc_func+0x142>
                    res->crcmatrix = retval;
     c2e:	02a91e23          	sh	a0,60(s2)
     c32:	b3ed                	j	a1c <calc_func+0x142>

00000c34 <cmp_complex>:
{
     c34:	1101                	add	sp,sp,-32
     c36:	ca26                	sw	s1,20(sp)
     c38:	84ae                	mv	s1,a1
     c3a:	85b2                	mv	a1,a2
     c3c:	ce06                	sw	ra,28(sp)
     c3e:	cc22                	sw	s0,24(sp)
    ee_s16 val1 = calc_func(&(a->data16), res);
     c40:	c632                	sw	a2,12(sp)
     c42:	3961                	jal	8da <calc_func>
    ee_s16 val2 = calc_func(&(b->data16), res);
     c44:	45b2                	lw	a1,12(sp)
    ee_s16 val1 = calc_func(&(a->data16), res);
     c46:	842a                	mv	s0,a0
    ee_s16 val2 = calc_func(&(b->data16), res);
     c48:	8526                	mv	a0,s1
     c4a:	3941                	jal	8da <calc_func>
}
     c4c:	40f2                	lw	ra,28(sp)
     c4e:	40a40533          	sub	a0,s0,a0
     c52:	4462                	lw	s0,24(sp)
     c54:	44d2                	lw	s1,20(sp)
     c56:	6105                	add	sp,sp,32
     c58:	8082                	ret

00000c5a <core_bench_list>:
{
     c5a:	7139                	add	sp,sp,-64
     c5c:	da26                	sw	s1,52(sp)
     c5e:	d05a                	sw	s6,32(sp)
    list_head *list     = res->list;
     c60:	5144                	lw	s1,36(a0)
    ee_s16     find_num = res->seed3;
     c62:	00451b03          	lh	s6,4(a0)
{
     c66:	dc22                	sw	s0,56(sp)
     c68:	d84a                	sw	s2,48(sp)
     c6a:	d64e                	sw	s3,44(sp)
     c6c:	d452                	sw	s4,40(sp)
     c6e:	d256                	sw	s5,36(sp)
     c70:	de06                	sw	ra,60(sp)
     c72:	862a                	mv	a2,a0
     c74:	89ae                	mv	s3,a1
    info.data16 = 0;
     c76:	00011e23          	sh	zero,28(sp)
    info.idx = finder_idx;
     c7a:	00b11f23          	sh	a1,30(sp)
    for (i = 0; i < find_num; i++)
     c7e:	4a01                	li	s4,0
    ee_u16     found = 0, missed = 0;
     c80:	4a81                	li	s5,0
     c82:	4901                	li	s2,0
    ee_u16     retval = 0;
     c84:	4401                	li	s0,0
    for (i = 0; i < find_num; i++)
     c86:	096a4c63          	blt	s4,s6,d1e <core_bench_list+0xc4>
    retval += found * 4 - missed;
     c8a:	090a                	sll	s2,s2,0x2
     c8c:	41590933          	sub	s2,s2,s5
     c90:	944a                	add	s0,s0,s2
     c92:	0442                	sll	s0,s0,0x10
    if (finder_idx > 0)
     c94:	4785                	li	a5,1
    retval += found * 4 - missed;
     c96:	8041                	srl	s0,s0,0x10
    if (finder_idx > 0)
     c98:	00f99963          	bne	s3,a5,caa <core_bench_list+0x50>
        list = core_list_mergesort(list, cmp_complex, res);
     c9c:	6585                	lui	a1,0x1
     c9e:	8526                	mv	a0,s1
     ca0:	c3458593          	add	a1,a1,-972 # c34 <cmp_complex>
     ca4:	eeaff0ef          	jal	38e <core_list_mergesort>
     ca8:	84aa                	mv	s1,a0
    remover = core_list_remove(list->next);
     caa:	409c                	lw	a5,0(s1)
    finder = core_list_find(list, &info);
     cac:	086c                	add	a1,sp,28
     cae:	8526                	mv	a0,s1
    list_head *ret = item->next;
     cb0:	0007a903          	lw	s2,0(a5)
    tmp        = item->info;
     cb4:	0047aa03          	lw	s4,4(a5)
    item->info = ret->info;
     cb8:	00492703          	lw	a4,4(s2)
     cbc:	c3d8                	sw	a4,4(a5)
    item->next = item->next->next;
     cbe:	00092703          	lw	a4,0(s2)
    ret->info  = tmp;
     cc2:	01492223          	sw	s4,4(s2)
    item->next = item->next->next;
     cc6:	c398                	sw	a4,0(a5)
    ret->next  = NULL;
     cc8:	00092023          	sw	zero,0(s2)
    finder = core_list_find(list, &info);
     ccc:	e94ff0ef          	jal	360 <core_list_find>
     cd0:	89aa                	mv	s3,a0
    if (!finder)
     cd2:	e979                	bnez	a0,da8 <core_bench_list+0x14e>
        finder = list->next;
     cd4:	0004a983          	lw	s3,0(s1)
    while (finder)
     cd8:	0c099863          	bnez	s3,da8 <core_bench_list+0x14e>
    remover = core_list_undo_remove(remover, list->next);
     cdc:	409c                	lw	a5,0(s1)
    list = core_list_mergesort(list, cmp_idx, NULL);
     cde:	8526                	mv	a0,s1
    item_removed->info  = item_modified->info;
     ce0:	43d8                	lw	a4,4(a5)
    list = core_list_mergesort(list, cmp_idx, NULL);
     ce2:	4601                	li	a2,0
     ce4:	32a00593          	li	a1,810
    item_removed->info  = item_modified->info;
     ce8:	00e92223          	sw	a4,4(s2)
    item_removed->next  = item_modified->next;
     cec:	4398                	lw	a4,0(a5)
    item_modified->info = tmp;
     cee:	0147a223          	sw	s4,4(a5)
    item_removed->next  = item_modified->next;
     cf2:	00e92023          	sw	a4,0(s2)
    item_modified->next = item_removed;
     cf6:	0127a023          	sw	s2,0(a5)
    list = core_list_mergesort(list, cmp_idx, NULL);
     cfa:	e94ff0ef          	jal	38e <core_list_mergesort>
    finder = list->next;
     cfe:	00052903          	lw	s2,0(a0)
    list = core_list_mergesort(list, cmp_idx, NULL);
     d02:	84aa                	mv	s1,a0
    while (finder)
     d04:	0a091b63          	bnez	s2,dba <core_bench_list+0x160>
}
     d08:	50f2                	lw	ra,60(sp)
     d0a:	8522                	mv	a0,s0
     d0c:	5462                	lw	s0,56(sp)
     d0e:	54d2                	lw	s1,52(sp)
     d10:	5942                	lw	s2,48(sp)
     d12:	59b2                	lw	s3,44(sp)
     d14:	5a22                	lw	s4,40(sp)
     d16:	5a92                	lw	s5,36(sp)
     d18:	5b02                	lw	s6,32(sp)
     d1a:	6121                	add	sp,sp,64
     d1c:	8082                	ret
        info.data16 = (i & 0xff);
     d1e:	0ffa7793          	zext.b	a5,s4
        this_find   = core_list_find(list, &info);
     d22:	086c                	add	a1,sp,28
     d24:	8526                	mv	a0,s1
     d26:	c632                	sw	a2,12(sp)
        info.data16 = (i & 0xff);
     d28:	00f11e23          	sh	a5,28(sp)
        this_find   = core_list_find(list, &info);
     d2c:	e34ff0ef          	jal	360 <core_list_find>
    while (list)
     d30:	4632                	lw	a2,12(sp)
    list_head *next = NULL, *tmp;
     d32:	4701                	li	a4,0
    while (list)
     d34:	ec8d                	bnez	s1,d6e <core_bench_list+0x114>
        if (this_find == NULL)
     d36:	e129                	bnez	a0,d78 <core_bench_list+0x11e>
            retval += (list->next->info->data16 >> 8) & 1;
     d38:	431c                	lw	a5,0(a4)
            missed++;
     d3a:	0a85                	add	s5,s5,1
     d3c:	0ac2                	sll	s5,s5,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     d3e:	43dc                	lw	a5,4(a5)
            missed++;
     d40:	010ada93          	srl	s5,s5,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     d44:	00178783          	lb	a5,1(a5)
     d48:	8b85                	and	a5,a5,1
     d4a:	943e                	add	s0,s0,a5
     d4c:	0442                	sll	s0,s0,0x10
     d4e:	8041                	srl	s0,s0,0x10
        if (info.idx >= 0)
     d50:	01e11783          	lh	a5,30(sp)
     d54:	0007c563          	bltz	a5,d5e <core_bench_list+0x104>
            info.idx++;
     d58:	0785                	add	a5,a5,1
     d5a:	00f11f23          	sh	a5,30(sp)
    for (i = 0; i < find_num; i++)
     d5e:	001a0793          	add	a5,s4,1
     d62:	01079a13          	sll	s4,a5,0x10
     d66:	410a5a13          	sra	s4,s4,0x10
        list        = core_list_reverse(list);
     d6a:	84ba                	mv	s1,a4
     d6c:	bf29                	j	c86 <core_bench_list+0x2c>
        tmp        = list->next;
     d6e:	409c                	lw	a5,0(s1)
        list->next = next;
     d70:	c098                	sw	a4,0(s1)
        next       = list;
     d72:	8726                	mv	a4,s1
        list       = tmp;
     d74:	84be                	mv	s1,a5
     d76:	bf7d                	j	d34 <core_bench_list+0xda>
            if (this_find->info->data16 & 0x1) /* use found value */
     d78:	415c                	lw	a5,4(a0)
     d7a:	00079783          	lh	a5,0(a5)
     d7e:	0017f693          	and	a3,a5,1
     d82:	c699                	beqz	a3,d90 <core_bench_list+0x136>
                retval += (this_find->info->data16 >> 9) & 1;
     d84:	87a5                	sra	a5,a5,0x9
     d86:	8b85                	and	a5,a5,1
     d88:	97a2                	add	a5,a5,s0
     d8a:	01079413          	sll	s0,a5,0x10
     d8e:	8041                	srl	s0,s0,0x10
            if (this_find->next != NULL)
     d90:	411c                	lw	a5,0(a0)
     d92:	c791                	beqz	a5,d9e <core_bench_list+0x144>
                this_find->next = finder->next;
     d94:	4394                	lw	a3,0(a5)
     d96:	c114                	sw	a3,0(a0)
                finder->next    = list->next;
     d98:	4314                	lw	a3,0(a4)
     d9a:	c394                	sw	a3,0(a5)
                list->next      = finder;
     d9c:	c31c                	sw	a5,0(a4)
            found++;
     d9e:	0905                	add	s2,s2,1
     da0:	0942                	sll	s2,s2,0x10
     da2:	01095913          	srl	s2,s2,0x10
     da6:	b76d                	j	d50 <core_bench_list+0xf6>
        retval = crc16(list->info->data16, retval);
     da8:	40dc                	lw	a5,4(s1)
     daa:	85a2                	mv	a1,s0
     dac:	0007d503          	lhu	a0,0(a5)
     db0:	3639                	jal	8be <crcu16>
     db2:	842a                	mv	s0,a0
        finder = finder->next;
     db4:	0009a983          	lw	s3,0(s3)
     db8:	b705                	j	cd8 <core_bench_list+0x7e>
        retval = crc16(list->info->data16, retval);
     dba:	40dc                	lw	a5,4(s1)
     dbc:	85a2                	mv	a1,s0
     dbe:	0007d503          	lhu	a0,0(a5)
     dc2:	3cf5                	jal	8be <crcu16>
     dc4:	842a                	mv	s0,a0
        finder = finder->next;
     dc6:	00092903          	lw	s2,0(s2)
     dca:	bf2d                	j	d04 <core_bench_list+0xaa>

00000dcc <put_ch>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     dcc:	fff507b7          	lui	a5,0xfff50
     dd0:	4398                	lw	a4,0(a5)
     dd2:	00a71693          	sll	a3,a4,0xa
     dd6:	fe06dde3          	bgez	a3,dd0 <put_ch+0x4>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     dda:	c3c8                	sw	a0,4(a5)

#include <stdarg.h>
#include <stdint.h>
#include "neorv32.h"   // UART0

static inline void put_ch(char c) { neorv32_uart0_putc((uint8_t)c); }
     ddc:	8082                	ret

00000dde <put_str>:

static void put_str(const char *s) {
     dde:	1141                	add	sp,sp,-16
     de0:	c422                	sw	s0,8(sp)
     de2:	c606                	sw	ra,12(sp)
     de4:	842a                	mv	s0,a0
  if (!s) s = "(null)";
     de6:	e501                	bnez	a0,dee <put_str+0x10>
     de8:	640d                	lui	s0,0x3
     dea:	bdc40413          	add	s0,s0,-1060 # 2bdc <__fini_array_end+0xc4>
  while (*s) put_ch(*s++);
     dee:	00044503          	lbu	a0,0(s0)
     df2:	e509                	bnez	a0,dfc <put_str+0x1e>
}
     df4:	40b2                	lw	ra,12(sp)
     df6:	4422                	lw	s0,8(sp)
     df8:	0141                	add	sp,sp,16
     dfa:	8082                	ret
  while (*s) put_ch(*s++);
     dfc:	0405                	add	s0,s0,1
     dfe:	37f9                	jal	dcc <put_ch>
     e00:	b7fd                	j	dee <put_str+0x10>

00000e02 <put_u>:

static void put_u(unsigned long v, unsigned base, int width, int pad_zero) {
     e02:	7179                	add	sp,sp,-48
     e04:	880a                	mv	a6,sp
     e06:	d226                	sw	s1,36(sp)
     e08:	d606                	sw	ra,44(sp)
     e0a:	d422                	sw	s0,40(sp)
     e0c:	d04a                	sw	s2,32(sp)
     e0e:	4781                	li	a5,0
     e10:	84c2                	mv	s1,a6
  char buf[32];
  int i = 0;
  if (base < 2) base = 10;
  do {
    unsigned d = (unsigned)(v % base);
    buf[i++] = (char)(d < 10 ? '0' + d : 'a' + (d - 10));
     e12:	4e25                	li	t3,9
    v /= base;
  } while (v && i < (int)sizeof(buf));
     e14:	02000313          	li	t1,32
    unsigned d = (unsigned)(v % base);
     e18:	02b578b3          	remu	a7,a0,a1
    buf[i++] = (char)(d < 10 ? '0' + d : 'a' + (d - 10));
     e1c:	0ff8f713          	zext.b	a4,a7
     e20:	051e6863          	bltu	t3,a7,e70 <put_u+0x6e>
     e24:	03070713          	add	a4,a4,48
     e28:	0ff77713          	zext.b	a4,a4
     e2c:	00e80023          	sb	a4,0(a6)
     e30:	0785                	add	a5,a5,1 # fff50001 <__crt0_ram_last+0x7ff4e002>
    v /= base;
     e32:	02b55733          	divu	a4,a0,a1
  } while (v && i < (int)sizeof(buf));
     e36:	04b57063          	bgeu	a0,a1,e76 <put_u+0x74>
     e3a:	8a85                	and	a3,a3,1
     e3c:	02000713          	li	a4,32
     e40:	c299                	beqz	a3,e46 <put_u+0x44>
     e42:	03000713          	li	a4,48
  while (i < width && i < (int)sizeof(buf)) buf[i++] = pad_zero ? '0' : ' ';
     e46:	02000693          	li	a3,32
     e4a:	02c7cb63          	blt	a5,a2,e80 <put_u+0x7e>
  while (i--) put_ch(buf[i]);
     e4e:	fff78413          	add	s0,a5,-1
     e52:	597d                	li	s2,-1
     e54:	008487b3          	add	a5,s1,s0
     e58:	0007c503          	lbu	a0,0(a5)
     e5c:	147d                	add	s0,s0,-1
     e5e:	37bd                	jal	dcc <put_ch>
     e60:	ff241ae3          	bne	s0,s2,e54 <put_u+0x52>
}
     e64:	50b2                	lw	ra,44(sp)
     e66:	5422                	lw	s0,40(sp)
     e68:	5492                	lw	s1,36(sp)
     e6a:	5902                	lw	s2,32(sp)
     e6c:	6145                	add	sp,sp,48
     e6e:	8082                	ret
    buf[i++] = (char)(d < 10 ? '0' + d : 'a' + (d - 10));
     e70:	05770713          	add	a4,a4,87
     e74:	bf55                	j	e28 <put_u+0x26>
  } while (v && i < (int)sizeof(buf));
     e76:	0805                	add	a6,a6,1
     e78:	fc6781e3          	beq	a5,t1,e3a <put_u+0x38>
    v /= base;
     e7c:	853a                	mv	a0,a4
     e7e:	bf69                	j	e18 <put_u+0x16>
  while (i < width && i < (int)sizeof(buf)) buf[i++] = pad_zero ? '0' : ' ';
     e80:	fcd787e3          	beq	a5,a3,e4e <put_u+0x4c>
     e84:	00f485b3          	add	a1,s1,a5
     e88:	00e58023          	sb	a4,0(a1)
     e8c:	0785                	add	a5,a5,1
     e8e:	bf75                	j	e4a <put_u+0x48>

00000e90 <__neorv32_rte_print_hex>:
 *
 * @param[in] num Number to print as hexadecimal via UART0.
 *
 * @param[in] digits Number of hexadecimal digits to print (0..8).
 **************************************************************************/
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     e90:	7179                	add	sp,sp,-48
     e92:	d226                	sw	s1,36(sp)
     e94:	84ae                	mv	s1,a1

  int i = 0;
  const char hex_symbols[] = "0123456789ABCDEF";
     e96:	658d                	lui	a1,0x3
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     e98:	d422                	sw	s0,40(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     e9a:	4645                	li	a2,17
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     e9c:	842a                	mv	s0,a0
  const char hex_symbols[] = "0123456789ABCDEF";
     e9e:	be458593          	add	a1,a1,-1052 # 2be4 <__fini_array_end+0xcc>
     ea2:	0068                	add	a0,sp,12
void __neorv32_rte_print_hex(uint32_t num, int digits) {
     ea4:	d606                	sw	ra,44(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
     ea6:	782010ef          	jal	2628 <memcpy>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     eaa:	7781                	lui	a5,0xfffe0
     eac:	479c                	lw	a5,8(a5)

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
     eae:	00e79713          	sll	a4,a5,0xe
     eb2:	04075d63          	bgez	a4,f0c <__neorv32_rte_print_hex+0x7c>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     eb6:	fff507b7          	lui	a5,0xfff50
     eba:	4398                	lw	a4,0(a5)
     ebc:	00a71693          	sll	a3,a4,0xa
     ec0:	fe06dde3          	bgez	a3,eba <__neorv32_rte_print_hex+0x2a>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     ec4:	03000713          	li	a4,48
     ec8:	c3d8                	sw	a4,4(a5)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     eca:	fff507b7          	lui	a5,0xfff50
     ece:	4398                	lw	a4,0(a5)
     ed0:	00a71693          	sll	a3,a4,0xa
     ed4:	fe06dde3          	bgez	a3,ece <__neorv32_rte_print_hex+0x3e>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     ed8:	45bd                	li	a1,15
     eda:	07800713          	li	a4,120
     ede:	8d85                	sub	a1,a1,s1
     ee0:	c3d8                	sw	a4,4(a5)
    neorv32_uart0_putc('0');
    neorv32_uart0_putc('x');

    for (i=(digits-8); i<8; i++) {
     ee2:	058a                	sll	a1,a1,0x2
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     ee4:	fff50737          	lui	a4,0xfff50
     ee8:	56f1                	li	a3,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
     eea:	00b457b3          	srl	a5,s0,a1
     eee:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
     ef0:	02078793          	add	a5,a5,32 # fff50020 <__crt0_ram_last+0x7ff4e021>
     ef4:	978a                	add	a5,a5,sp
     ef6:	fec7c783          	lbu	a5,-20(a5)
     efa:	4310                	lw	a2,0(a4)
     efc:	00a61513          	sll	a0,a2,0xa
     f00:	fe055de3          	bgez	a0,efa <__neorv32_rte_print_hex+0x6a>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     f04:	c35c                	sw	a5,4(a4)
    for (i=(digits-8); i<8; i++) {
     f06:	15f1                	add	a1,a1,-4
     f08:	fed591e3          	bne	a1,a3,eea <__neorv32_rte_print_hex+0x5a>
    }
  }
}
     f0c:	50b2                	lw	ra,44(sp)
     f0e:	5422                	lw	s0,40(sp)
     f10:	5492                	lw	s1,36(sp)
     f12:	6145                	add	sp,sp,48
     f14:	8082                	ret

00000f16 <neorv32_uart_puts.constprop.0>:
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
     f16:	46a9                	li	a3,10
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     f18:	fff507b7          	lui	a5,0xfff50
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     f1c:	4635                	li	a2,13
  while ((c = *s++)) {
     f1e:	00054703          	lbu	a4,0(a0)
     f22:	0505                	add	a0,a0,1
     f24:	e311                	bnez	a4,f28 <neorv32_uart_puts.constprop.0+0x12>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
     f26:	8082                	ret
    if (c == '\n') {
     f28:	00d71863          	bne	a4,a3,f38 <neorv32_uart_puts.constprop.0+0x22>
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     f2c:	438c                	lw	a1,0(a5)
     f2e:	00a59813          	sll	a6,a1,0xa
     f32:	fe085de3          	bgez	a6,f2c <neorv32_uart_puts.constprop.0+0x16>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     f36:	c3d0                	sw	a2,4(a5)
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     f38:	438c                	lw	a1,0(a5)
     f3a:	00a59813          	sll	a6,a1,0xa
     f3e:	fe085de3          	bgez	a6,f38 <neorv32_uart_puts.constprop.0+0x22>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     f42:	c3d8                	sw	a4,4(a5)
}
     f44:	bfe9                	j	f1e <neorv32_uart_puts.constprop.0+0x8>

00000f46 <neorv32_rte_debug_handler>:
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     f46:	7781                	lui	a5,0xfffe0
     f48:	479c                	lw	a5,8(a5)
  if (neorv32_uart0_available() == 0) {
     f4a:	00e79713          	sll	a4,a5,0xe
     f4e:	18075163          	bgez	a4,10d0 <neorv32_rte_debug_handler+0x18a>
  neorv32_uart0_puts("<NEORV32-RTE> ");
     f52:	650d                	lui	a0,0x3
void neorv32_rte_debug_handler(void) {
     f54:	1141                	add	sp,sp,-16
  neorv32_uart0_puts("<NEORV32-RTE> ");
     f56:	bf850513          	add	a0,a0,-1032 # 2bf8 <__fini_array_end+0xe0>
void neorv32_rte_debug_handler(void) {
     f5a:	c606                	sw	ra,12(sp)
     f5c:	c422                	sw	s0,8(sp)
  neorv32_uart0_puts("<NEORV32-RTE> ");
     f5e:	3f65                	jal	f16 <neorv32_uart_puts.constprop.0>
     f60:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) & 1) {
     f64:	8b85                	and	a5,a5,1
     f66:	cf85                	beqz	a5,f9e <neorv32_rte_debug_handler+0x58>
    neorv32_uart0_puts("[cpu1|");
     f68:	650d                	lui	a0,0x3
     f6a:	c0850513          	add	a0,a0,-1016 # 2c08 <__fini_array_end+0xf0>
    neorv32_uart0_puts("[cpu0|");
     f6e:	3765                	jal	f16 <neorv32_uart_puts.constprop.0>
     f70:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
     f74:	00b7d713          	srl	a4,a5,0xb
     f78:	8b0d                	and	a4,a4,3
     f7a:	c715                	beqz	a4,fa6 <neorv32_rte_debug_handler+0x60>
    neorv32_uart0_puts("M] "); // machine-mode
     f7c:	650d                	lui	a0,0x3
     f7e:	c1850513          	add	a0,a0,-1000 # 2c18 <__fini_array_end+0x100>
    neorv32_uart0_puts("U] "); // user-mode
     f82:	3f51                	jal	f16 <neorv32_uart_puts.constprop.0>
     f84:	34202473          	csrr	s0,mcause
  switch (trap_cause) {
     f88:	47ad                	li	a5,11
     f8a:	0287e263          	bltu	a5,s0,fae <neorv32_rte_debug_handler+0x68>
     f8e:	670d                	lui	a4,0x3
     f90:	00241793          	sll	a5,s0,0x2
     f94:	1c870713          	add	a4,a4,456 # 31c8 <__fini_array_end+0x6b0>
     f98:	97ba                	add	a5,a5,a4
     f9a:	439c                	lw	a5,0(a5)
     f9c:	8782                	jr	a5
    neorv32_uart0_puts("[cpu0|");
     f9e:	650d                	lui	a0,0x3
     fa0:	c1050513          	add	a0,a0,-1008 # 2c10 <__fini_array_end+0xf8>
     fa4:	b7e9                	j	f6e <neorv32_rte_debug_handler+0x28>
    neorv32_uart0_puts("U] "); // user-mode
     fa6:	650d                	lui	a0,0x3
     fa8:	c1c50513          	add	a0,a0,-996 # 2c1c <__fini_array_end+0x104>
     fac:	bfd9                	j	f82 <neorv32_rte_debug_handler+0x3c>
  switch (trap_cause) {
     fae:	800007b7          	lui	a5,0x80000
     fb2:	07ad                	add	a5,a5,11 # 8000000b <_impure_data+0xb>
     fb4:	0ef40d63          	beq	s0,a5,10ae <neorv32_rte_debug_handler+0x168>
     fb8:	0287e263          	bltu	a5,s0,fdc <neorv32_rte_debug_handler+0x96>
     fbc:	800007b7          	lui	a5,0x80000
     fc0:	078d                	add	a5,a5,3 # 80000003 <_impure_data+0x3>
     fc2:	0cf40e63          	beq	s0,a5,109e <neorv32_rte_debug_handler+0x158>
     fc6:	800007b7          	lui	a5,0x80000
     fca:	079d                	add	a5,a5,7 # 80000007 <_impure_data+0x7>
     fcc:	0cf40d63          	beq	s0,a5,10a6 <neorv32_rte_debug_handler+0x160>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     fd0:	650d                	lui	a0,0x3
     fd2:	d7450513          	add	a0,a0,-652 # 2d74 <__fini_array_end+0x25c>
     fd6:	3781                	jal	f16 <neorv32_uart_puts.constprop.0>
     fd8:	45a1                	li	a1,8
     fda:	a829                	j	ff4 <neorv32_rte_debug_handler+0xae>
  switch (trap_cause) {
     fdc:	800007b7          	lui	a5,0x80000
     fe0:	17c1                	add	a5,a5,-16 # 7ffffff0 <neorv32_uart.c.2d4a2ccb+0x7fff8b62>
     fe2:	97a2                	add	a5,a5,s0
     fe4:	473d                	li	a4,15
     fe6:	fef765e3          	bltu	a4,a5,fd0 <neorv32_rte_debug_handler+0x8a>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
     fea:	650d                	lui	a0,0x3
     fec:	d6850513          	add	a0,a0,-664 # 2d68 <__fini_array_end+0x250>
     ff0:	371d                	jal	f16 <neorv32_uart_puts.constprop.0>
     ff2:	4585                	li	a1,1
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
     ff4:	8522                	mv	a0,s0
     ff6:	3d69                	jal	e90 <__neorv32_rte_print_hex>
     ff8:	a029                	j	1002 <neorv32_rte_debug_handler+0xbc>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
     ffa:	650d                	lui	a0,0x3
     ffc:	c2050513          	add	a0,a0,-992 # 2c20 <__fini_array_end+0x108>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
    1000:	3f19                	jal	f16 <neorv32_uart_puts.constprop.0>
  neorv32_uart0_puts(" @ PC=");
    1002:	650d                	lui	a0,0x3
    1004:	d8850513          	add	a0,a0,-632 # 2d88 <__fini_array_end+0x270>
    1008:	3739                	jal	f16 <neorv32_uart_puts.constprop.0>
    100a:	34102573          	csrr	a0,mepc
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MEPC), 8);
    100e:	45a1                	li	a1,8
    1010:	3541                	jal	e90 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTINST=");
    1012:	650d                	lui	a0,0x3
    1014:	d9050513          	add	a0,a0,-624 # 2d90 <__fini_array_end+0x278>
    1018:	3dfd                	jal	f16 <neorv32_uart_puts.constprop.0>
    101a:	34a02573          	csrr	a0,0x34a
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTINST), 8);
    101e:	45a1                	li	a1,8
    1020:	3d85                	jal	e90 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTVAL=");
    1022:	650d                	lui	a0,0x3
    1024:	d9c50513          	add	a0,a0,-612 # 2d9c <__fini_array_end+0x284>
    1028:	35fd                	jal	f16 <neorv32_uart_puts.constprop.0>
    102a:	34302573          	csrr	a0,mtval
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTVAL), 8);
    102e:	45a1                	li	a1,8
    1030:	3585                	jal	e90 <__neorv32_rte_print_hex>
  if (((int32_t)trap_cause) < 0) { // is interrupt
    1032:	08045263          	bgez	s0,10b6 <neorv32_rte_debug_handler+0x170>
    neorv32_uart0_puts(" Disabling IRQ source");
    1036:	650d                	lui	a0,0x3
    1038:	da850513          	add	a0,a0,-600 # 2da8 <__fini_array_end+0x290>
    103c:	3de9                	jal	f16 <neorv32_uart_puts.constprop.0>
    neorv32_cpu_csr_clr(CSR_MIE, 1 << (trap_cause & 0x1f));
    103e:	4785                	li	a5,1
    1040:	008797b3          	sll	a5,a5,s0
 * @param[in] mask Bit mask (high-active) to clear bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrc %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    1044:	3047b073          	csrc	mie,a5
}
    1048:	4422                	lw	s0,8(sp)
    104a:	40b2                	lw	ra,12(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    104c:	650d                	lui	a0,0x3
    104e:	de050513          	add	a0,a0,-544 # 2de0 <__fini_array_end+0x2c8>
}
    1052:	0141                	add	sp,sp,16
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    1054:	b5c9                	j	f16 <neorv32_uart_puts.constprop.0>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
    1056:	650d                	lui	a0,0x3
    1058:	c3c50513          	add	a0,a0,-964 # 2c3c <__fini_array_end+0x124>
    105c:	b755                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
    105e:	650d                	lui	a0,0x3
    1060:	c5050513          	add	a0,a0,-944 # 2c50 <__fini_array_end+0x138>
    1064:	bf71                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Environment breakpoint"); break;
    1066:	650d                	lui	a0,0x3
    1068:	c7050513          	add	a0,a0,-912 # 2c70 <__fini_array_end+0x158>
    106c:	bf51                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
    106e:	650d                	lui	a0,0x3
    1070:	c8850513          	add	a0,a0,-888 # 2c88 <__fini_array_end+0x170>
    1074:	b771                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
    1076:	650d                	lui	a0,0x3
    1078:	ca050513          	add	a0,a0,-864 # 2ca0 <__fini_array_end+0x188>
    107c:	b751                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
    107e:	650d                	lui	a0,0x3
    1080:	cb450513          	add	a0,a0,-844 # 2cb4 <__fini_array_end+0x19c>
    1084:	bfb5                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
    1086:	650d                	lui	a0,0x3
    1088:	cd050513          	add	a0,a0,-816 # 2cd0 <__fini_array_end+0x1b8>
    108c:	bf95                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
    108e:	650d                	lui	a0,0x3
    1090:	ce450513          	add	a0,a0,-796 # 2ce4 <__fini_array_end+0x1cc>
    1094:	b7b5                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
    1096:	650d                	lui	a0,0x3
    1098:	d0450513          	add	a0,a0,-764 # 2d04 <__fini_array_end+0x1ec>
    109c:	b795                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
    109e:	650d                	lui	a0,0x3
    10a0:	d2450513          	add	a0,a0,-732 # 2d24 <__fini_array_end+0x20c>
    10a4:	bfb1                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
    10a6:	650d                	lui	a0,0x3
    10a8:	d3c50513          	add	a0,a0,-708 # 2d3c <__fini_array_end+0x224>
    10ac:	bf91                	j	1000 <neorv32_rte_debug_handler+0xba>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
    10ae:	650d                	lui	a0,0x3
    10b0:	d5050513          	add	a0,a0,-688 # 2d50 <__fini_array_end+0x238>
    10b4:	b7b1                	j	1000 <neorv32_rte_debug_handler+0xba>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
    10b6:	4785                	li	a5,1
    10b8:	f887e8e3          	bltu	a5,s0,1048 <neorv32_rte_debug_handler+0x102>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU </NEORV32-RTE>\n");
    10bc:	650d                	lui	a0,0x3
    10be:	dc050513          	add	a0,a0,-576 # 2dc0 <__fini_array_end+0x2a8>
    10c2:	3d91                	jal	f16 <neorv32_uart_puts.constprop.0>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    10c4:	4781                	li	a5,0
    10c6:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
    10ca:	10500073          	wfi
    while(1) {
    10ce:	bff5                	j	10ca <neorv32_rte_debug_handler+0x184>
    10d0:	8082                	ret

000010d2 <printf>:
  int r = vprint_uart(fmt, ap);
  va_end(ap);
  return r;
}

int printf(const char *fmt, ...) {
    10d2:	7159                	add	sp,sp,-112
    10d4:	c4a2                	sw	s0,72(sp)
  va_list ap; va_start(ap, fmt);
    10d6:	08c0                	add	s0,sp,84
int printf(const char *fmt, ...) {
    10d8:	de4e                	sw	s3,60(sp)
    10da:	dc52                	sw	s4,56(sp)
    10dc:	da56                	sw	s5,52(sp)
    10de:	d85a                	sw	s6,48(sp)
    10e0:	d65e                	sw	s7,44(sp)
    10e2:	d462                	sw	s8,40(sp)
    10e4:	d266                	sw	s9,36(sp)
    10e6:	c686                	sw	ra,76(sp)
    10e8:	c2a6                	sw	s1,68(sp)
    10ea:	c0ca                	sw	s2,64(sp)
    10ec:	d06a                	sw	s10,32(sp)
    10ee:	832a                	mv	t1,a0
    10f0:	caae                	sw	a1,84(sp)
    10f2:	ccb2                	sw	a2,88(sp)
    10f4:	ceb6                	sw	a3,92(sp)
    10f6:	d0ba                	sw	a4,96(sp)
    10f8:	d2be                	sw	a5,100(sp)
    10fa:	d4c2                	sw	a6,104(sp)
    10fc:	d6c6                	sw	a7,108(sp)
  va_list ap; va_start(ap, fmt);
    10fe:	ce22                	sw	s0,28(sp)
  int cnt = 0;
    1100:	4981                	li	s3,0
    if (*fmt != '%') { put_ch(*fmt++); cnt++; continue; }
    1102:	02500a93          	li	s5,37
    if (*fmt == '0') { pad_zero = 1; fmt++; }
    1106:	03000b13          	li	s6,48
    while (*fmt >= '0' && *fmt <= '9') { width = width*10 + (*fmt - '0'); fmt++; }
    110a:	4ba5                	li	s7,9
    110c:	4c29                	li	s8,10
    switch (*fmt) {
    110e:	06c00a13          	li	s4,108
    1112:	07500c93          	li	s9,117
  while (*fmt) {
    1116:	00034503          	lbu	a0,0(t1)
    111a:	e105                	bnez	a0,113a <printf+0x68>
  int r = vprint_uart(fmt, ap);
  va_end(ap);
  return r;
}
    111c:	40b6                	lw	ra,76(sp)
    111e:	4426                	lw	s0,72(sp)
    1120:	4496                	lw	s1,68(sp)
    1122:	4906                	lw	s2,64(sp)
    1124:	5a62                	lw	s4,56(sp)
    1126:	5ad2                	lw	s5,52(sp)
    1128:	5b42                	lw	s6,48(sp)
    112a:	5bb2                	lw	s7,44(sp)
    112c:	5c22                	lw	s8,40(sp)
    112e:	5c92                	lw	s9,36(sp)
    1130:	5d02                	lw	s10,32(sp)
    1132:	854e                	mv	a0,s3
    1134:	59f2                	lw	s3,60(sp)
    1136:	6165                	add	sp,sp,112
    1138:	8082                	ret
    if (*fmt != '%') { put_ch(*fmt++); cnt++; continue; }
    113a:	00130493          	add	s1,t1,1
    113e:	01550663          	beq	a0,s5,114a <printf+0x78>
    1142:	3169                	jal	dcc <put_ch>
    1144:	0985                	add	s3,s3,1
    fmt++;
    1146:	8326                	mv	t1,s1
    1148:	b7f9                	j	1116 <printf+0x44>
    if (*fmt == '0') { pad_zero = 1; fmt++; }
    114a:	00134783          	lbu	a5,1(t1)
    int pad_zero = 0, width = 0;
    114e:	4681                	li	a3,0
    if (*fmt == '0') { pad_zero = 1; fmt++; }
    1150:	01679563          	bne	a5,s6,115a <printf+0x88>
    1154:	00230493          	add	s1,t1,2
    1158:	4685                	li	a3,1
    while (*fmt >= '0' && *fmt <= '9') { width = width*10 + (*fmt - '0'); fmt++; }
    115a:	4601                	li	a2,0
    115c:	a029                	j	1166 <printf+0x94>
    115e:	03860633          	mul	a2,a2,s8
    1162:	84ea                	mv	s1,s10
    1164:	963a                	add	a2,a2,a4
    1166:	0004c783          	lbu	a5,0(s1)
    116a:	00148d13          	add	s10,s1,1
    116e:	fd078713          	add	a4,a5,-48
    1172:	0ff77593          	zext.b	a1,a4
    1176:	febbf4e3          	bgeu	s7,a1,115e <printf+0x8c>
    switch (*fmt) {
    117a:	0b478363          	beq	a5,s4,1220 <printf+0x14e>
    117e:	02fa6563          	bltu	s4,a5,11a8 <printf+0xd6>
    1182:	06300713          	li	a4,99
    1186:	04e78663          	beq	a5,a4,11d2 <printf+0x100>
    118a:	06400713          	li	a4,100
    118e:	04e78b63          	beq	a5,a4,11e4 <printf+0x112>
    1192:	02500713          	li	a4,37
    1196:	02e78863          	beq	a5,a4,11c6 <printf+0xf4>
        put_ch('%'); put_ch(*fmt); break;
    119a:	02500513          	li	a0,37
    119e:	313d                	jal	dcc <put_ch>
    11a0:	0004c503          	lbu	a0,0(s1)
    11a4:	3125                	jal	dcc <put_ch>
    11a6:	a025                	j	11ce <printf+0xfc>
    switch (*fmt) {
    11a8:	07978363          	beq	a5,s9,120e <printf+0x13c>
    11ac:	07800713          	li	a4,120
    11b0:	06e78463          	beq	a5,a4,1218 <printf+0x146>
    11b4:	07300713          	li	a4,115
    11b8:	fee791e3          	bne	a5,a4,119a <printf+0xc8>
      case 's': { const char *s = va_arg(ap, const char*); put_str(s); } break;
    11bc:	4008                	lw	a0,0(s0)
    11be:	00440913          	add	s2,s0,4
    11c2:	3931                	jal	dde <put_str>
    11c4:	a829                	j	11de <printf+0x10c>
      case '%': put_ch('%'); cnt++; break;
    11c6:	02500513          	li	a0,37
    11ca:	3109                	jal	dcc <put_ch>
    11cc:	0985                	add	s3,s3,1
        put_ch('%'); put_ch(*fmt); break;
    11ce:	8922                	mv	s2,s0
    11d0:	a039                	j	11de <printf+0x10c>
      case 'c': { int c = va_arg(ap, int); put_ch((char)c); cnt++; } break;
    11d2:	00044503          	lbu	a0,0(s0)
    11d6:	00440913          	add	s2,s0,4
    11da:	0985                	add	s3,s3,1
    11dc:	3ec5                	jal	dcc <put_ch>
    fmt++;
    11de:	0485                	add	s1,s1,1
    11e0:	844a                	mv	s0,s2
    11e2:	b795                	j	1146 <printf+0x74>
      case 'd': { int v = va_arg(ap, int); put_s((long)v, width, pad_zero); } break;
    11e4:	401c                	lw	a5,0(s0)
    11e6:	00440913          	add	s2,s0,4
  unsigned long u = (val < 0) ? (unsigned long)(-val) : (unsigned long)val;
    11ea:	41f7d713          	sra	a4,a5,0x1f
    11ee:	00f74433          	xor	s0,a4,a5
    11f2:	8c19                	sub	s0,s0,a4
  if (val < 0) put_ch('-');
    11f4:	0007d963          	bgez	a5,1206 <printf+0x134>
    11f8:	02d00513          	li	a0,45
    11fc:	c636                	sw	a3,12(sp)
    11fe:	c432                	sw	a2,8(sp)
    1200:	36f1                	jal	dcc <put_ch>
    1202:	46b2                	lw	a3,12(sp)
    1204:	4622                	lw	a2,8(sp)
  put_u(u, 10, width, pad_zero);
    1206:	45a9                	li	a1,10
    1208:	8522                	mv	a0,s0
      case 'x': { unsigned v = va_arg(ap, unsigned); put_u(v, 16, width, pad_zero); } break;
    120a:	3ee5                	jal	e02 <put_u>
    120c:	bfc9                	j	11de <printf+0x10c>
      case 'u': { unsigned v = va_arg(ap, unsigned); put_u(v, 10, width, pad_zero); } break;
    120e:	00440913          	add	s2,s0,4
    1212:	45a9                	li	a1,10
      case 'x': { unsigned v = va_arg(ap, unsigned); put_u(v, 16, width, pad_zero); } break;
    1214:	4008                	lw	a0,0(s0)
    1216:	bfd5                	j	120a <printf+0x138>
    1218:	00440913          	add	s2,s0,4
    121c:	45c1                	li	a1,16
    121e:	bfdd                	j	1214 <printf+0x142>
        if (*fmt == 'u')       put_u(v, 10, width, pad_zero);
    1220:	0014c783          	lbu	a5,1(s1)
    1224:	07500713          	li	a4,117
        unsigned long v = va_arg(ap, unsigned long);
    1228:	4008                	lw	a0,0(s0)
    122a:	00440913          	add	s2,s0,4
        if (*fmt == 'u')       put_u(v, 10, width, pad_zero);
    122e:	45a9                	li	a1,10
    1230:	00e78863          	beq	a5,a4,1240 <printf+0x16e>
        else if (*fmt == 'x')  put_u(v, 16, width, pad_zero);
    1234:	07800713          	li	a4,120
        else { /* fallback */  put_u(v, 10, width, pad_zero); fmt--; }
    1238:	45a9                	li	a1,10
        else if (*fmt == 'x')  put_u(v, 16, width, pad_zero);
    123a:	fce798e3          	bne	a5,a4,120a <printf+0x138>
    123e:	45c1                	li	a1,16
    1240:	36c9                	jal	e02 <put_u>
        fmt++;
    1242:	84ea                	mv	s1,s10
    1244:	bf69                	j	11de <printf+0x10c>

00001246 <puts>:

// Optional: tiny puts to keep some libraries happy (no trailing newline added).
int puts(const char *s) { put_str(s); put_ch('\n'); return 0; }
    1246:	1141                	add	sp,sp,-16
    1248:	c606                	sw	ra,12(sp)
    124a:	3e51                	jal	dde <put_str>
    124c:	4529                	li	a0,10
    124e:	3ebd                	jal	dcc <put_ch>
    1250:	40b2                	lw	ra,12(sp)
    1252:	4501                	li	a0,0
    1254:	0141                	add	sp,sp,16
    1256:	8082                	ret

00001258 <main>:
    1258:	4701                	li	a4,0
    125a:	30471073          	csrw	mie,a4
    125e:	6789                	lui	a5,0x2
    1260:	80078793          	add	a5,a5,-2048 # 1800 <main+0x5a8>
    1264:	30079073          	csrw	mstatus,a5
    1268:	43c00793          	li	a5,1084
    126c:	30579073          	csrw	mtvec,a5
    1270:	30471073          	csrw	mie,a4
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    1274:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) == 0) {
    1278:	e395                	bnez	a5,129c <main+0x44>
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    127a:	6685                	lui	a3,0x1
    127c:	80000637          	lui	a2,0x80000
    1280:	f4668693          	add	a3,a3,-186 # f46 <neorv32_rte_debug_handler>
    1284:	56c60613          	add	a2,a2,1388 # 8000056c <__neorv32_rte_vector_lut>
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    1288:	45f5                	li	a1,29
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    128a:	00279713          	sll	a4,a5,0x2
    128e:	9732                	add	a4,a4,a2
    1290:	c314                	sw	a3,0(a4)
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    1292:	0785                	add	a5,a5,1
    1294:	feb79be3          	bne	a5,a1,128a <main+0x32>
    asm volatile ("fence"); // flush handler table to main memory
    1298:	0ff0000f          	fence
  UARTx->CTRL = 0;
    129c:	fff507b7          	lui	a5,0xfff50
    12a0:	0007a023          	sw	zero,0(a5) # fff50000 <__crt0_ram_last+0x7ff4e001>
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
    12a4:	7781                	lui	a5,0xfffe0
    12a6:	439c                	lw	a5,0(a5)
  baud_div = clock / (2*baudrate);
    12a8:	6725                	lui	a4,0x9
    12aa:	60070713          	add	a4,a4,1536 # 9600 <neorv32_uart.c.2d4a2ccb+0x2172>
    12ae:	02e7d7b3          	divu	a5,a5,a4
  while (baud_div >= 0x3ffU) {
    12b2:	3fe00613          	li	a2,1022
  uint32_t prsc_sel = 0;
    12b6:	4701                	li	a4,0
  while (baud_div >= 0x3ffU) {
    12b8:	02f66663          	bltu	a2,a5,12e4 <main+0x8c>
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    12bc:	17fd                	add	a5,a5,-1 # fffdffff <__crt0_ram_last+0x7ffde000>
    12be:	66c1                	lui	a3,0x10
    12c0:	fc068693          	add	a3,a3,-64 # ffc0 <neorv32_uart.c.2d4a2ccb+0x8b32>
    12c4:	079a                	sll	a5,a5,0x6
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    12c6:	070e                	sll	a4,a4,0x3
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    12c8:	8ff5                	and	a5,a5,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    12ca:	8b61                	and	a4,a4,24
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    12cc:	8fd9                	or	a5,a5,a4
    12ce:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
    12d2:	fff50737          	lui	a4,0xfff50
    12d6:	c31c                	sw	a5,0(a4)
    12d8:	fc0027f3          	csrr	a5,0xfc0
  neorv32_cpu_csr_write(CSR_MIE, 0);      /* disable global irq */
  neorv32_rte_setup();                    /* trap handler */
  neorv32_uart0_setup(BAUD_RATE, 0);      /* UART init */

  /* Ensure Zicntr exists (mcycle/minstret baseline) */
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1u << CSR_MXISA_ZICNTR)) == 0) {
    12dc:	0807f793          	and	a5,a5,128
    12e0:	eb99                	bnez	a5,12f6 <main+0x9e>
    12e2:	a001                	j	12e2 <main+0x8a>
    if ((prsc_sel == 2) || (prsc_sel == 4))
    12e4:	ffe70693          	add	a3,a4,-2 # fff4fffe <__crt0_ram_last+0x7ff4dfff>
    12e8:	9af5                	and	a3,a3,-3
    12ea:	e681                	bnez	a3,12f2 <main+0x9a>
      baud_div >>= 3;
    12ec:	838d                	srl	a5,a5,0x3
    prsc_sel++;
    12ee:	0705                	add	a4,a4,1
    12f0:	b7e1                	j	12b8 <main+0x60>
      baud_div >>= 1;
    12f2:	8385                	srl	a5,a5,0x1
    12f4:	bfed                	j	12ee <main+0x96>

#if MAIN_HAS_NOARGC
MAIN_RETURN_TYPE main(void) {
  int argc = 0; char *argv[1];
#else
MAIN_RETURN_TYPE main(int argc, char *argv[]) {
    12f6:	7149                	add	sp,sp,-368
    12f8:	16112623          	sw	ra,364(sp)
    12fc:	16812423          	sw	s0,360(sp)
    1300:	16912223          	sw	s1,356(sp)
    1304:	17212023          	sw	s2,352(sp)
    1308:	15312e23          	sw	s3,348(sp)
    130c:	15412c23          	sw	s4,344(sp)
    1310:	15512a23          	sw	s5,340(sp)
    1314:	15612823          	sw	s6,336(sp)
    1318:	15712623          	sw	s7,332(sp)
    131c:	15812423          	sw	s8,328(sp)
    1320:	15912223          	sw	s9,324(sp)
    1324:	fc0027f3          	csrr	a5,0xfc0
 * @return Returns number of available HPM counters.
 **************************************************************************/
uint32_t neorv32_cpu_hpm_get_num_counters(void) {

  // HPMs implemented at all?
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1<<CSR_MXISA_ZIHPM)) == 0) {
    1328:	2007f793          	and	a5,a5,512
    132c:	c7c9                	beqz	a5,13b6 <main+0x15e>
  asm volatile ("csrs %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    132e:	57e1                	li	a5,-8
    1330:	3207a073          	csrs	mcountinhibit,a5
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    1334:	4785                	li	a5,1
    1336:	b0379073          	csrw	mhpmcounter3,a5
    133a:	b0479073          	csrw	mhpmcounter4,a5
    133e:	b0579073          	csrw	mhpmcounter5,a5
    1342:	b0679073          	csrw	mhpmcounter6,a5
    1346:	b0779073          	csrw	mhpmcounter7,a5
    134a:	b0879073          	csrw	mhpmcounter8,a5
    134e:	b0979073          	csrw	mhpmcounter9,a5
    1352:	b0a79073          	csrw	mhpmcounter10,a5
    1356:	b0b79073          	csrw	mhpmcounter11,a5
    135a:	b0c79073          	csrw	mhpmcounter12,a5
    135e:	b0d79073          	csrw	mhpmcounter13,a5
    1362:	b0e79073          	csrw	mhpmcounter14,a5
    1366:	b0f79073          	csrw	mhpmcounter15,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    136a:	b03027f3          	csrr	a5,mhpmcounter3
    136e:	b0402773          	csrr	a4,mhpmcounter4
  neorv32_cpu_csr_write(CSR_MHPMCOUNTER15, 1);

  // sum-up all actually set HPMs
  uint32_t num_hpm = 0;
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER3);
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER4);
    1372:	97ba                	add	a5,a5,a4
    1374:	b0502773          	csrr	a4,mhpmcounter5
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER5);
    1378:	97ba                	add	a5,a5,a4
    137a:	b0602773          	csrr	a4,mhpmcounter6
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER6);
    137e:	97ba                	add	a5,a5,a4
    1380:	b0702773          	csrr	a4,mhpmcounter7
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER7);
    1384:	97ba                	add	a5,a5,a4
    1386:	b0802773          	csrr	a4,mhpmcounter8
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER8);
    138a:	97ba                	add	a5,a5,a4
    138c:	b0902773          	csrr	a4,mhpmcounter9
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER9);
    1390:	97ba                	add	a5,a5,a4
    1392:	b0a02773          	csrr	a4,mhpmcounter10
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER10);
    1396:	97ba                	add	a5,a5,a4
    1398:	b0b02773          	csrr	a4,mhpmcounter11
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER11);
    139c:	97ba                	add	a5,a5,a4
    139e:	b0c02773          	csrr	a4,mhpmcounter12
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER12);
    13a2:	97ba                	add	a5,a5,a4
    13a4:	b0d02773          	csrr	a4,mhpmcounter13
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER13);
    13a8:	97ba                	add	a5,a5,a4
    13aa:	b0e02773          	csrr	a4,mhpmcounter14
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER14);
    13ae:	97ba                	add	a5,a5,a4
    13b0:	b0f02773          	csrr	a4,mhpmcounter15
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER15);
    13b4:	97ba                	add	a5,a5,a4
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    13b6:	577d                	li	a4,-1
    13b8:	32071073          	csrw	mcountinhibit,a4
    13bc:	4701                	li	a4,0
    13be:	b0071073          	csrw	mcycle,a4
    13c2:	b0271073          	csrw	minstret,a4
  /* zero base counters */
  neorv32_cpu_csr_write(CSR_MCYCLE, 0);
  neorv32_cpu_csr_write(CSR_MINSTRET, 0);

  /* set up a few HPMs if available (low words only) */
  if (num_hpm_cnts_global > 0)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER3,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT3,  1 << HPMCNT_EVENT_COMPR);    }
    13c6:	cfc9                	beqz	a5,1460 <main+0x208>
    13c8:	b0371073          	csrw	mhpmcounter3,a4
    13cc:	46a1                	li	a3,8
    13ce:	32369073          	csrw	mhpmevent3,a3
  if (num_hpm_cnts_global > 1)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER4,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT4,  1 << HPMCNT_EVENT_WAIT_DIS); }
    13d2:	4605                	li	a2,1
    13d4:	08c78663          	beq	a5,a2,1460 <main+0x208>
    13d8:	b0471073          	csrw	mhpmcounter4,a4
    13dc:	4641                	li	a2,16
    13de:	32461073          	csrw	mhpmevent4,a2
  if (num_hpm_cnts_global > 2)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER5,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT5,  1 << HPMCNT_EVENT_WAIT_ALU); }
    13e2:	4609                	li	a2,2
    13e4:	06c78e63          	beq	a5,a2,1460 <main+0x208>
    13e8:	b0571073          	csrw	mhpmcounter5,a4
    13ec:	02000613          	li	a2,32
    13f0:	32561073          	csrw	mhpmevent5,a2
  if (num_hpm_cnts_global > 3)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER6,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT6,  1 << HPMCNT_EVENT_BRANCH);   }
    13f4:	460d                	li	a2,3
    13f6:	06c78563          	beq	a5,a2,1460 <main+0x208>
    13fa:	b0671073          	csrw	mhpmcounter6,a4
    13fe:	04000613          	li	a2,64
    1402:	32661073          	csrw	mhpmevent6,a2
  if (num_hpm_cnts_global > 4)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER7,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT7,  1 << HPMCNT_EVENT_BRANCHED); }
    1406:	4611                	li	a2,4
    1408:	04c78c63          	beq	a5,a2,1460 <main+0x208>
    140c:	b0771073          	csrw	mhpmcounter7,a4
    1410:	08000613          	li	a2,128
    1414:	32761073          	csrw	mhpmevent7,a2
  if (num_hpm_cnts_global > 5)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER8,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT8,  1 << HPMCNT_EVENT_LOAD);     }
    1418:	4615                	li	a2,5
    141a:	04c78363          	beq	a5,a2,1460 <main+0x208>
    141e:	b0871073          	csrw	mhpmcounter8,a4
    1422:	10000613          	li	a2,256
    1426:	32861073          	csrw	mhpmevent8,a2
  if (num_hpm_cnts_global > 6)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER9,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT9,  1 << HPMCNT_EVENT_STORE);    }
    142a:	4619                	li	a2,6
    142c:	02c78a63          	beq	a5,a2,1460 <main+0x208>
    1430:	b0971073          	csrw	mhpmcounter9,a4
    1434:	20000613          	li	a2,512
    1438:	32961073          	csrw	mhpmevent9,a2
  if (num_hpm_cnts_global > 7)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER10, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT10, 1 << HPMCNT_EVENT_WAIT_LSU); }
    143c:	461d                	li	a2,7
    143e:	02c78163          	beq	a5,a2,1460 <main+0x208>
    1442:	b0a71073          	csrw	mhpmcounter10,a4
    1446:	40000613          	li	a2,1024
    144a:	32a61073          	csrw	mhpmevent10,a2
  if (num_hpm_cnts_global > 8)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER11, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT11, 1 << HPMCNT_EVENT_TRAP);     }
    144e:	00d78963          	beq	a5,a3,1460 <main+0x208>
    1452:	b0b71073          	csrw	mhpmcounter11,a4
    1456:	6785                	lui	a5,0x1
    1458:	80078793          	add	a5,a5,-2048 # 800 <core_state_transition+0xa4>
    145c:	32b79073          	csrw	mhpmevent11,a5
#if COREMARK_MINIMAL_PRINT == 0
    ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
#endif
  }

  p->portable_id = 1;
    1460:	4785                	li	a5,1
    1462:	0870                	add	a2,sp,28
    1464:	1074                	add	a3,sp,44
    1466:	12f10f23          	sb	a5,318(sp)
    146a:	470d                	li	a4,3
    146c:	0fa00793          	li	a5,250
    1470:	8a32                	mv	s4,a2
    1472:	8ab6                	mv	s5,a3
static int diff_4x4(const int32_t X[4][4], const int32_t Y[4][4]) {
  int m=0; for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (X[i][j]!=Y[i][j]) m++; return m;
}

static void fill_test(int8_t A[4][4], int8_t B[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    1474:	4599                	li	a1,6
    A[i][j] = (int8_t)((i*3 + j*5) - 6);
    1476:	00578513          	add	a0,a5,5
    147a:	00a600a3          	sb	a0,1(a2)
    B[i][j] = (int8_t)((i*7 - j*2) + 3);
    147e:	ffe70513          	add	a0,a4,-2
    1482:	00a680a3          	sb	a0,1(a3)
    A[i][j] = (int8_t)((i*3 + j*5) - 6);
    1486:	00a78513          	add	a0,a5,10
    148a:	00a60123          	sb	a0,2(a2)
    B[i][j] = (int8_t)((i*7 - j*2) + 3);
    148e:	ffc70513          	add	a0,a4,-4
    1492:	00a68123          	sb	a0,2(a3)
    A[i][j] = (int8_t)((i*3 + j*5) - 6);
    1496:	00f78513          	add	a0,a5,15
    149a:	00f60023          	sb	a5,0(a2)
    149e:	00a601a3          	sb	a0,3(a2)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    14a2:	078d                	add	a5,a5,3
    B[i][j] = (int8_t)((i*7 - j*2) + 3);
    14a4:	ffa70513          	add	a0,a4,-6
    14a8:	00e68023          	sb	a4,0(a3)
    14ac:	00a681a3          	sb	a0,3(a3)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    14b0:	071d                	add	a4,a4,7
    14b2:	0ff7f793          	zext.b	a5,a5
    14b6:	0611                	add	a2,a2,4
    14b8:	0ff77713          	zext.b	a4,a4
    14bc:	0691                	add	a3,a3,4
    14be:	fab79ce3          	bne	a5,a1,1476 <main+0x21e>
            (unsigned long)CFS_BASE, (unsigned long)cfs_id());
#endif

  /* Prepare inputs & reference */
  fill_test(A,B);
  sw_gemm_4x4_i8i32(A,B,Cref);
    14c2:	1870                	add	a2,sp,60
    14c4:	85d6                	mv	a1,s5
    14c6:	8552                	mv	a0,s4
    14c8:	e1bfe0ef          	jal	2e2 <sw_gemm_4x4_i8i32>

  /* Hardware tile once for correctness */
  cfs_gemm4x4_i8_run(A,B,Chw);
    14cc:	18f0                	add	a2,sp,124
    14ce:	85d6                	mv	a1,s5
    14d0:	8552                	mv	a0,s4
    14d2:	cd7fe0ef          	jal	1a8 <cfs_gemm4x4_i8_run>
    14d6:	4701                	li	a4,0
  int m=0; for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (X[i][j]!=Y[i][j]) m++; return m;
    14d8:	4481                	li	s1,0
    14da:	4841                	li	a6,16
    14dc:	04000893          	li	a7,64
    14e0:	18fc                	add	a5,sp,124
    14e2:	00e78533          	add	a0,a5,a4
    14e6:	187c                	add	a5,sp,60
    14e8:	00e785b3          	add	a1,a5,a4
    14ec:	4781                	li	a5,0
    14ee:	00f50633          	add	a2,a0,a5
    14f2:	00f586b3          	add	a3,a1,a5
    14f6:	4210                	lw	a2,0(a2)
    14f8:	4294                	lw	a3,0(a3)
    14fa:	00d60363          	beq	a2,a3,1500 <main+0x2a8>
    14fe:	0485                	add	s1,s1,1
    1500:	0791                	add	a5,a5,4
    1502:	ff0796e3          	bne	a5,a6,14ee <main+0x296>
    1506:	0741                	add	a4,a4,16
    1508:	fd171ce3          	bne	a4,a7,14e0 <main+0x288>
  if (diff_4x4(Chw, Cref)) { ee_printf("CFS: VERIFY FAIL (mismatch)\n"); return -1; }
    150c:	c0d9                	beqz	s1,1592 <main+0x33a>
    150e:	650d                	lui	a0,0x3
    1510:	df450513          	add	a0,a0,-524 # 2df4 <__fini_array_end+0x2dc>
    1514:	3b0d                	jal	1246 <puts>
    1516:	54fd                	li	s1,-1
            retval = seed1_volatile;
    1518:	800007b7          	lui	a5,0x80000
    151c:	5407a783          	lw	a5,1344(a5) # 80000540 <seed1_volatile>

  /* Seeds & config */
  results[0].seed1      = get_seed(1);
  results[0].seed2      = get_seed(2);
  results[0].seed3      = get_seed(3);
  results[0].iterations = 2000;             /* keep small, deterministic */
    1520:	7d000713          	li	a4,2000
    1524:	10e12c23          	sw	a4,280(sp)
  results[0].seed1      = get_seed(1);
    1528:	0ef11e23          	sh	a5,252(sp)
            retval = seed2_volatile;
    152c:	800007b7          	lui	a5,0x80000
    1530:	53c7a783          	lw	a5,1340(a5) # 8000053c <seed2_volatile>
#if CORE_DEBUG
  results[0].iterations = 1;
#endif

  /* IMPORTANT: enable all algos so list’s calc_func() has proper state/matrix */
  results[0].execs = (ID_LIST | ID_MATRIX | ID_STATE);
    1534:	471d                	li	a4,7
    1536:	10e12e23          	sw	a4,284(sp)
  results[0].seed2      = get_seed(2);
    153a:	0ef11f23          	sh	a5,254(sp)
            retval = seed3_volatile;
    153e:	800007b7          	lui	a5,0x80000
    1542:	5287a783          	lw	a5,1320(a5) # 80000528 <seed3_volatile>

  /* Default sets (unchanged) */
  if ((results[0].seed1 == 0) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
    1546:	577e                	lw	a4,252(sp)
  results[0].seed3      = get_seed(3);
    1548:	07c2                	sll	a5,a5,0x10
    154a:	87c1                	sra	a5,a5,0x10
    154c:	10f11023          	sh	a5,256(sp)
  if ((results[0].seed1 == 0) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
    1550:	e711                	bnez	a4,155c <main+0x304>
    1552:	e785                	bnez	a5,157a <main+0x322>
    results[0].seed1 = 0; results[0].seed2 = 0; results[0].seed3 = 0x66; /* performance */
    1554:	06600793          	li	a5,102
    1558:	10f11023          	sh	a5,256(sp)
  }
  if ((results[0].seed1 == 1) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
    155c:	4785                	li	a5,1
    155e:	00f71e63          	bne	a4,a5,157a <main+0x322>
    1562:	10011783          	lh	a5,256(sp)
    1566:	eb91                	bnez	a5,157a <main+0x322>
    results[0].seed1 = 0x3415; results[0].seed2 = 0x3415; results[0].seed3 = 0x66; /* validation */
    1568:	341537b7          	lui	a5,0x34153
    156c:	41578793          	add	a5,a5,1045 # 34153415 <neorv32_uart.c.2d4a2ccb+0x3414bf87>
    1570:	dfbe                	sw	a5,252(sp)
    1572:	06600793          	li	a5,102
    1576:	10f11023          	sh	a5,256(sp)
#if (MEM_METHOD == MEM_STATIC)
  results[0].memblock[0] = (void *)static_memblk;
  results[0].size        = TOTAL_DATA_SIZE;
  results[0].err         = 0;
#elif (MEM_METHOD == MEM_MALLOC)
  results[0].size        = TOTAL_DATA_SIZE;
    157a:	7d000793          	li	a5,2000
/* --------------------------------------------------------------------------
 * Memory management
 * -------------------------------------------------------------------------- */

void *portable_malloc(size_t size) {
  void *pnt = malloc(size);
    157e:	7d000513          	li	a0,2000
    1582:	10f12a23          	sw	a5,276(sp)
    1586:	086010ef          	jal	260c <malloc>
  if (pnt <= 0) {
    158a:	18051963          	bnez	a0,171c <main+0x4c4>
#if COREMARK_MINIMAL_PRINT == 0
    neorv32_uart0_printf("Malloc failed!\n");
#endif
    asm volatile ("ebreak");
    158e:	9002                	ebreak
    1590:	a001                	j	1590 <main+0x338>
#if !COREMARK_MINIMAL_PRINT
  ee_printf("CFS: VERIFY PASS\n");
#else
  ee_printf("CFS: PASS\n");
    1592:	650d                	lui	a0,0x3
    1594:	e1050513          	add	a0,a0,-496 # 2e10 <__fini_array_end+0x2f8>
    1598:	317d                	jal	1246 <puts>
    159a:	02000413          	li	s0,32
#endif

  /* Warm-ups (not timed) */
  for (int t=0; t<32; t++) { cfs_gemm4x4_i8_run(A,B,Chw); sw_gemm_4x4_i8i32(A,B,Ctmp); }
    159e:	18f0                	add	a2,sp,124
    15a0:	85d6                	mv	a1,s5
    15a2:	8552                	mv	a0,s4
    15a4:	c05fe0ef          	jal	1a8 <cfs_gemm4x4_i8_run>
    15a8:	1970                	add	a2,sp,188
    15aa:	85d6                	mv	a1,s5
    15ac:	8552                	mv	a0,s4
    15ae:	147d                	add	s0,s0,-1
    15b0:	d33fe0ef          	jal	2e2 <sw_gemm_4x4_i8i32>
    15b4:	f46d                	bnez	s0,159e <main+0x346>
    15b6:	4931                	li	s2,12

  /* ---- Measure CFS: scale tiles until we see >0 ticks ---- */
  int tiles_cfs = 256;
    15b8:	10000993          	li	s3,256
  return (CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
    15bc:	80000b37          	lui	s6,0x80000
    15c0:	80000bb7          	lui	s7,0x80000
  start_time();
    15c4:	950ff0ef          	jal	714 <start_time>
  for (int t=0; t<tiles; t++) cfs_gemm4x4_i8_run(A,B,C);
    15c8:	4c01                	li	s8,0
    15ca:	133c4b63          	blt	s8,s3,1700 <main+0x4a8>
  stop_time();
    15ce:	96aff0ef          	jal	738 <stop_time>
    15d2:	550b2783          	lw	a5,1360(s6) # 80000550 <stop_time_val>
    15d6:	548ba703          	lw	a4,1352(s7) # 80000548 <start_time_val>
    15da:	554b2583          	lw	a1,1364(s6)
    15de:	54cba683          	lw	a3,1356(s7)
    15e2:	40e78733          	sub	a4,a5,a4
    15e6:	00e7b7b3          	sltu	a5,a5,a4
    15ea:	8d95                	sub	a1,a1,a3
    15ec:	8d9d                	sub	a1,a1,a5
  CORE_TICKS tk_cfs = 0;
  for (int tries = 0; tries < 12; tries++) {
    tk_cfs = run_cfs_tiles_get_ticks(tiles_cfs, A, B, Chw);
    if (tk_cfs > 0) break;
    15ee:	00b767b3          	or	a5,a4,a1
    15f2:	e789                	bnez	a5,15fc <main+0x3a4>
  for (int tries = 0; tries < 12; tries++) {
    15f4:	197d                	add	s2,s2,-1
    tiles_cfs <<= 1;
    15f6:	0986                	sll	s3,s3,0x1
  for (int tries = 0; tries < 12; tries++) {
    15f8:	fc0916e3          	bnez	s2,15c4 <main+0x36c>
  }
  uint32_t cfs_cyc_per_tile = (tiles_cfs > 0) ? (uint32_t)((uint64_t)tk_cfs / (uint64_t)tiles_cfs) : 0u;
    15fc:	4901                	li	s2,0
    15fe:	01305b63          	blez	s3,1614 <main+0x3bc>
    1602:	853a                	mv	a0,a4
    1604:	864e                	mv	a2,s3
    1606:	41f9d693          	sra	a3,s3,0x1f
    160a:	c63a                	sw	a4,12(sp)
    160c:	162010ef          	jal	276e <__udivdi3>
    1610:	4732                	lw	a4,12(sp)
    1612:	892a                	mv	s2,a0
  uint32_t cfs_cyc_per_step = cfs_cyc_per_tile / 10u; /* 10 systolic steps per tile */

  ee_printf("CFS: %lu cycles/tile  (~%lu cycles/step)  [tiles=%d, ticks=%lu]\n",
    1614:	4629                	li	a2,10
    1616:	02c95633          	divu	a2,s2,a2
    161a:	650d                	lui	a0,0x3
    161c:	86ce                	mv	a3,s3
    161e:	85ca                	mv	a1,s2
    1620:	e1c50513          	add	a0,a0,-484 # 2e1c <__fini_array_end+0x304>
    1624:	4c31                	li	s8,12
            (unsigned long)cfs_cyc_per_tile,
            (unsigned long)cfs_cyc_per_step,
            tiles_cfs, (unsigned long)tk_cfs);

  /* ---- Measure SW (vanilla CPU): same method ---- */
  int tiles_sw = 256;
    1626:	10000993          	li	s3,256
  ee_printf("CFS: %lu cycles/tile  (~%lu cycles/step)  [tiles=%d, ticks=%lu]\n",
    162a:	3465                	jal	10d2 <printf>
  start_time();
    162c:	8e8ff0ef          	jal	714 <start_time>
  for (int t=0; t<tiles; t++) sw_gemm_4x4_i8i32(A,B,C);
    1630:	4c81                	li	s9,0
    1632:	0d3cce63          	blt	s9,s3,170e <main+0x4b6>
  stop_time();
    1636:	902ff0ef          	jal	738 <stop_time>
    163a:	550b2783          	lw	a5,1360(s6)
    163e:	548ba703          	lw	a4,1352(s7)
    1642:	554b2583          	lw	a1,1364(s6)
    1646:	54cba683          	lw	a3,1356(s7)
    164a:	40e78733          	sub	a4,a5,a4
    164e:	00e7b7b3          	sltu	a5,a5,a4
    1652:	8d95                	sub	a1,a1,a3
    1654:	8d9d                	sub	a1,a1,a5
  CORE_TICKS tk_sw = 0;
  for (int tries = 0; tries < 12; tries++) {
    tk_sw = run_sw_tiles_get_ticks(tiles_sw, A, B, Ctmp);
    if (tk_sw > 0) break;
    1656:	00b767b3          	or	a5,a4,a1
    165a:	e789                	bnez	a5,1664 <main+0x40c>
  for (int tries = 0; tries < 12; tries++) {
    165c:	1c7d                	add	s8,s8,-1 # ffffefff <__crt0_ram_last+0x7fffd000>
    tiles_sw <<= 1;
    165e:	0986                	sll	s3,s3,0x1
  for (int tries = 0; tries < 12; tries++) {
    1660:	fc0c16e3          	bnez	s8,162c <main+0x3d4>
  }
  uint32_t sw_cyc_per_tile = (tiles_sw > 0) ? (uint32_t)((uint64_t)tk_sw / (uint64_t)tiles_sw) : 0u;
    1664:	01305b63          	blez	s3,167a <main+0x422>
    1668:	853a                	mv	a0,a4
    166a:	864e                	mv	a2,s3
    166c:	41f9d693          	sra	a3,s3,0x1f
    1670:	c63a                	sw	a4,12(sp)
    1672:	0fc010ef          	jal	276e <__udivdi3>
    1676:	4732                	lw	a4,12(sp)
    1678:	842a                	mv	s0,a0
  uint32_t sw_cyc_per_mac  = sw_cyc_per_tile / 64u; /* 64 MACs per tile */

  ee_printf("SW : %lu cycles/tile  (~%lu cycles/MAC)  [tiles=%d, ticks=%lu]\n",
    167a:	650d                	lui	a0,0x3
    167c:	86ce                	mv	a3,s3
    167e:	00645613          	srl	a2,s0,0x6
    1682:	85a2                	mv	a1,s0
    1684:	e6050513          	add	a0,a0,-416 # 2e60 <__fini_array_end+0x348>
    1688:	34a9                	jal	10d2 <printf>
            (unsigned long)sw_cyc_per_tile,
            (unsigned long)sw_cyc_per_mac,
            tiles_sw, (unsigned long)tk_sw);

  /* ---- Speedup (SW/CFS) as fixed-point x10 (no floats) ---- */
  if (cfs_cyc_per_tile > 0) {
    168a:	04090663          	beqz	s2,16d6 <main+0x47e>
    uint32_t x10 = (uint32_t)(( (uint64_t)sw_cyc_per_tile * 10ull ) / (uint64_t)cfs_cyc_per_tile);
    168e:	49a9                	li	s3,10
    1690:	033435b3          	mulhu	a1,s0,s3
    1694:	864a                	mv	a2,s2
    1696:	4681                	li	a3,0
    1698:	03340533          	mul	a0,s0,s3
    169c:	0d2010ef          	jal	276e <__udivdi3>
    ee_printf("Speedup (SW/CFS) : %lu.%lux\n", (unsigned long)(x10/10), (unsigned long)(x10%10));
    16a0:	03357633          	remu	a2,a0,s3
    16a4:	033555b3          	divu	a1,a0,s3
    16a8:	650d                	lui	a0,0x3
    16aa:	ea050513          	add	a0,a0,-352 # 2ea0 <__fini_array_end+0x388>
    16ae:	a25ff0ef          	jal	10d2 <printf>
  }

#ifdef CFS_CPU_HZ
  /* Optional: Throughput (MMAC/s), integer only, using known CPU clock */
  if (cfs_cyc_per_tile > 0) {
    uint32_t tiles_per_sec_cfs = (uint32_t)((uint64_t)CFS_CPU_HZ / (uint64_t)cfs_cyc_per_tile);
    16b2:	05f5e637          	lui	a2,0x5f5e
    16b6:	10060613          	add	a2,a2,256 # 5f5e100 <neorv32_uart.c.2d4a2ccb+0x5f56c72>
    16ba:	03265933          	divu	s2,a2,s2
    uint32_t mmacs_cfs = (tiles_per_sec_cfs * 64u) / 1000000u;
    16be:	000f45b7          	lui	a1,0xf4
    16c2:	24058593          	add	a1,a1,576 # f4240 <neorv32_uart.c.2d4a2ccb+0xecdb2>
    ee_printf("CFS throughput   : %lu MMAC/s @ %lu Hz\n",
    16c6:	650d                	lui	a0,0x3
    16c8:	ec050513          	add	a0,a0,-320 # 2ec0 <__fini_array_end+0x3a8>
    uint32_t mmacs_cfs = (tiles_per_sec_cfs * 64u) / 1000000u;
    16cc:	091a                	sll	s2,s2,0x6
    ee_printf("CFS throughput   : %lu MMAC/s @ %lu Hz\n",
    16ce:	02b955b3          	divu	a1,s2,a1
    16d2:	a01ff0ef          	jal	10d2 <printf>
              (unsigned long)mmacs_cfs, (unsigned long)CFS_CPU_HZ);
  }
  if (sw_cyc_per_tile > 0) {
    16d6:	e40401e3          	beqz	s0,1518 <main+0x2c0>
    uint32_t tiles_per_sec_sw = (uint32_t)((uint64_t)CFS_CPU_HZ / (uint64_t)sw_cyc_per_tile);
    16da:	05f5e637          	lui	a2,0x5f5e
    16de:	10060613          	add	a2,a2,256 # 5f5e100 <neorv32_uart.c.2d4a2ccb+0x5f56c72>
    16e2:	02865433          	divu	s0,a2,s0
    uint32_t mmacs_sw = (tiles_per_sec_sw * 64u) / 1000000u;
    16e6:	000f45b7          	lui	a1,0xf4
    16ea:	24058593          	add	a1,a1,576 # f4240 <neorv32_uart.c.2d4a2ccb+0xecdb2>
    ee_printf("SW  throughput   : %lu MMAC/s @ %lu Hz\n",
    16ee:	650d                	lui	a0,0x3
    16f0:	ee850513          	add	a0,a0,-280 # 2ee8 <__fini_array_end+0x3d0>
    uint32_t mmacs_sw = (tiles_per_sec_sw * 64u) / 1000000u;
    16f4:	041a                	sll	s0,s0,0x6
    ee_printf("SW  throughput   : %lu MMAC/s @ %lu Hz\n",
    16f6:	02b455b3          	divu	a1,s0,a1
    16fa:	9d9ff0ef          	jal	10d2 <printf>
    16fe:	bd29                	j	1518 <main+0x2c0>
  for (int t=0; t<tiles; t++) cfs_gemm4x4_i8_run(A,B,C);
    1700:	18f0                	add	a2,sp,124
    1702:	85d6                	mv	a1,s5
    1704:	8552                	mv	a0,s4
    1706:	aa3fe0ef          	jal	1a8 <cfs_gemm4x4_i8_run>
    170a:	0c05                	add	s8,s8,1
    170c:	bd7d                	j	15ca <main+0x372>
  for (int t=0; t<tiles; t++) sw_gemm_4x4_i8i32(A,B,C);
    170e:	1970                	add	a2,sp,188
    1710:	85d6                	mv	a1,s5
    1712:	8552                	mv	a0,s4
    1714:	bcffe0ef          	jal	2e2 <sw_gemm_4x4_i8i32>
    1718:	0c85                	add	s9,s9,1
    171a:	bf21                	j	1632 <main+0x3da>

  /* Split memory across enabled algorithms (LIST, MATRIX, STATE) */
  for (i = 0; i < NUM_ALGORITHMS; i++) {
    if ((1u << (ee_u32)i) & results[0].execs) num_algorithms++;
  }
  for (i = 0; i < MULTITHREAD; i++) results[i].size = results[i].size / num_algorithms;
    171c:	29a00793          	li	a5,666
    results[i].seed2       = results[0].seed2;
    results[i].seed3       = results[0].seed3;
    results[i].iterations  = results[0].iterations;
    results[i].execs       = results[0].execs;
    /* LIST */
    if (results[i].execs & ID_LIST) {
    1720:	11c12883          	lw	a7,284(sp)
  for (i = 0; i < MULTITHREAD; i++) results[i].size = results[i].size / num_algorithms;
    1724:	10f12a23          	sw	a5,276(sp)
        results[ctx].memblock[i + 1] = (char *)(results[ctx].memblock[0]) + results[0].size * j;
    1728:	29a50793          	add	a5,a0,666
    172c:	10f12623          	sw	a5,268(sp)
    1730:	53450793          	add	a5,a0,1332
  results[0].memblock[0] = portable_malloc(results[0].size);
    1734:	10a12223          	sw	a0,260(sp)
  results[0].err         = 0;
    1738:	12011e23          	sh	zero,316(sp)
        results[ctx].memblock[i + 1] = (char *)(results[ctx].memblock[0]) + results[0].size * j;
    173c:	10a12423          	sw	a0,264(sp)
    1740:	10f12823          	sw	a5,272(sp)
    if (results[i].execs & ID_LIST) {
    1744:	0018f893          	and	a7,a7,1
    1748:	08088163          	beqz	a7,17ca <main+0x572>
    list_head *memblock_end  = memblock + size;
    174c:	0f850693          	add	a3,a0,248
    results[i].seed1       = results[0].seed1;
    1750:	0fc11e03          	lh	t3,252(sp)
    list->info         = datablock;
    1754:	c154                	sw	a3,4(a0)
    list->next         = NULL;
    1756:	00052023          	sw	zero,0(a0)
    list->info->data16 = (ee_s16)0x8080;
    175a:	77e1                	lui	a5,0xffff8
    175c:	08078793          	add	a5,a5,128 # ffff8080 <__crt0_ram_last+0x7fff6081>
    list->info->idx    = 0x0000;
    1760:	00069123          	sh	zero,2(a3)
    list->info->data16 = (ee_s16)0x8080;
    1764:	0ef51c23          	sh	a5,248(a0)
    if ((*memblock + 1) >= memblock_end)  return NULL;
    1768:	01050613          	add	a2,a0,16
    ee_u32 size     = (blksize / per_item) - 2; /* see CoreMark note */
    176c:	42fd                	li	t0,31
    list_data *datablock_end = datablock + size;
    176e:	17450e93          	add	t4,a0,372
    memblock++;
    1772:	00850793          	add	a5,a0,8
    datablock++;
    1776:	0fc50713          	add	a4,a0,252
    if ((*memblock + 1) >= memblock_end)  return NULL;
    177a:	02d67463          	bgeu	a2,a3,17a2 <main+0x54a>
    if ((*datablock + 1) >= datablock_end) return NULL;
    177e:	10050593          	add	a1,a0,256
    1782:	03d5f063          	bgeu	a1,t4,17a2 <main+0x54a>
    insert_point->next = newitem;
    1786:	c11c                	sw	a5,0(a0)
    newitem->info = *datablock;
    1788:	c558                	sw	a4,12(a0)
    newitem->next      = insert_point->next;
    178a:	00052423          	sw	zero,8(a0)
    to->data16 = from->data16;
    178e:	57fd                	li	a5,-1
    1790:	00f69223          	sh	a5,4(a3)
    to->idx    = from->idx;
    1794:	77e1                	lui	a5,0xffff8
    1796:	fff7c793          	not	a5,a5
    179a:	00f69323          	sh	a5,6(a3)
    (*datablock)++;
    179e:	872e                	mv	a4,a1
    (*memblock)++;
    17a0:	87b2                	mv	a5,a2
    to->idx    = from->idx;
    17a2:	7361                	lui	t1,0xffff8
    (*memblock)++;
    17a4:	4801                	li	a6,0
        info.data16   = (dat << 8) | dat;          /* fill the data and rebuild value */
    17a6:	10100393          	li	t2,257
    to->idx    = from->idx;
    17aa:	fff34313          	not	t1,t1
    newitem->next      = insert_point->next;
    17ae:	410c                	lw	a1,0(a0)
    for (i = 0; i < size; i++)
    17b0:	04586163          	bltu	a6,t0,17f2 <main+0x59a>
            finder->info->idx = 0x3fff & (((i & 0x07) << 8) | pat);
    17b4:	6691                	lui	a3,0x4
        if (i < size / 5) /* first 20% of the list in order */
    17b6:	4819                	li	a6,6
            finder->info->idx = 0x3fff & (((i & 0x07) << 8) | pat);
    17b8:	16fd                	add	a3,a3,-1 # 3fff <core_main.c.e300a4bf+0x41>
    while (finder->next != NULL)
    17ba:	4190                	lw	a2,0(a1)
    17bc:	ea35                	bnez	a2,1830 <main+0x5d8>
    list = core_list_mergesort(list, cmp_idx, NULL);
    17be:	32a00593          	li	a1,810
    17c2:	bcdfe0ef          	jal	38e <core_list_mergesort>
      results[i].list = core_list_init(results[0].size, results[i].memblock[1], results[i].seed1);
    17c6:	12a12023          	sw	a0,288(sp)
    }
    /* MATRIX (needed for calc_func inside list mergesort) */
    if (results[i].execs & ID_MATRIX) {
    17ca:	11c12e03          	lw	t3,284(sp)
    17ce:	002e7793          	and	a5,t3,2
    17d2:	cbf1                	beqz	a5,18a6 <main+0x64e>
      core_init_matrix(results[0].size,
                       results[i].memblock[2],
                       (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16),
    17d4:	0fe11683          	lh	a3,254(sp)
    17d8:	0fc11783          	lh	a5,252(sp)
      core_init_matrix(results[0].size,
    17dc:	11412583          	lw	a1,276(sp)
                       (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16),
    17e0:	06c2                	sll	a3,a3,0x10
      core_init_matrix(results[0].size,
    17e2:	8edd                	or	a3,a3,a5
    17e4:	10c12603          	lw	a2,268(sp)
  if (seed == 0) seed = 1;
    17e8:	30068663          	beqz	a3,1af4 <main+0x89c>
    17ec:	4701                	li	a4,0
    17ee:	4781                	li	a5,0
    17f0:	a8a5                	j	1868 <main+0x610>
    if ((*memblock + 1) >= memblock_end)  return NULL;
    17f2:	00878f13          	add	t5,a5,8 # ffff8008 <__crt0_ram_last+0x7fff6009>
    17f6:	02df7b63          	bgeu	t5,a3,182c <main+0x5d4>
    if ((*datablock + 1) >= datablock_end) return NULL;
    17fa:	00470f93          	add	t6,a4,4
    17fe:	03dff763          	bgeu	t6,t4,182c <main+0x5d4>
    newitem->next      = insert_point->next;
    1802:	c38c                	sw	a1,0(a5)
    1804:	01081613          	sll	a2,a6,0x10
    insert_point->next = newitem;
    1808:	c11c                	sw	a5,0(a0)
    180a:	8241                	srl	a2,a2,0x10
    newitem->info = *datablock;
    180c:	c3d8                	sw	a4,4(a5)
        ee_u16 datpat = ((ee_u16)(seed ^ i) & 0xf);
    180e:	01c647b3          	xor	a5,a2,t3
        ee_u16 dat    = (datpat << 3) | (i & 0x7); /* alternate between algorithms */
    1812:	078e                	sll	a5,a5,0x3
    1814:	0787f793          	and	a5,a5,120
    1818:	8a1d                	and	a2,a2,7
    181a:	8fd1                	or	a5,a5,a2
        info.data16   = (dat << 8) | dat;          /* fill the data and rebuild value */
    181c:	027787b3          	mul	a5,a5,t2
    to->idx    = from->idx;
    1820:	00671123          	sh	t1,2(a4)
    to->data16 = from->data16;
    1824:	00f71023          	sh	a5,0(a4)
    (*datablock)++;
    1828:	877e                	mv	a4,t6
    (*memblock)++;
    182a:	87fa                	mv	a5,t5
    for (i = 0; i < size; i++)
    182c:	0805                	add	a6,a6,1
    182e:	b741                	j	17ae <main+0x556>
            finder->info->idx = i++;
    1830:	41cc                	lw	a1,4(a1)
    1832:	01089793          	sll	a5,a7,0x10
        if (i < size / 5) /* first 20% of the list in order */
    1836:	0108ef63          	bltu	a7,a6,1854 <main+0x5fc>
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
    183a:	01089713          	sll	a4,a7,0x10
    183e:	8341                	srl	a4,a4,0x10
            finder->info->idx = 0x3fff & (((i & 0x07) << 8) | pat);
    1840:	00170793          	add	a5,a4,1
    1844:	07a2                	sll	a5,a5,0x8
    1846:	7007f793          	and	a5,a5,1792
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
    184a:	01c74733          	xor	a4,a4,t3
            finder->info->idx = 0x3fff & (((i & 0x07) << 8) | pat);
    184e:	8fd9                	or	a5,a5,a4
    1850:	8ff5                	and	a5,a5,a3
    1852:	07c2                	sll	a5,a5,0x10
    1854:	87c1                	sra	a5,a5,0x10
    1856:	00f59123          	sh	a5,2(a1)
    185a:	0885                	add	a7,a7,1
    185c:	85b2                	mv	a1,a2
    185e:	bfb1                	j	17ba <main+0x562>
  while (j < blksize) { i++; j = i * i * 2 * 4; }
    1860:	0785                	add	a5,a5,1
    1862:	02f78733          	mul	a4,a5,a5
    1866:	070e                	sll	a4,a4,0x3
    1868:	feb76ce3          	bltu	a4,a1,1860 <main+0x608>
  N = i - 1;
    186c:	17fd                	add	a5,a5,-1
  B = A + N * N;
    186e:	02f788b3          	mul	a7,a5,a5
  A = (MATDAT *)align_mem(memblk);
    1872:	167d                	add	a2,a2,-1
    1874:	9a71                	and	a2,a2,-4
    1876:	0611                	add	a2,a2,4
  for (i = 0; i < N; i++) {
    1878:	4f81                	li	t6,0
    187a:	4f01                	li	t5,0
  ee_s32  order = 1;
    187c:	4585                	li	a1,1
      seed         = ((order * seed) % 65536);
    187e:	62c1                	lui	t0,0x10
  B = A + N * N;
    1880:	0886                	sll	a7,a7,0x1
    1882:	01160733          	add	a4,a2,a7
      A[i * N + j] = val;
    1886:	411003b3          	neg	t2,a7
  for (i = 0; i < N; i++) {
    188a:	26ff6763          	bltu	t5,a5,1af8 <main+0x8a0>
  p->B = B;
    188e:	12e12623          	sw	a4,300(sp)
  p->C = (MATRES *)align_mem(B + N * N);
    1892:	9746                	add	a4,a4,a7
    1894:	177d                	add	a4,a4,-1
    1896:	9b71                	and	a4,a4,-4
    1898:	0711                	add	a4,a4,4
  p->A = A;
    189a:	12c12423          	sw	a2,296(sp)
  p->C = (MATRES *)align_mem(B + N * N);
    189e:	12e12823          	sw	a4,304(sp)
  p->N = N;
    18a2:	12f12223          	sw	a5,292(sp)
                       &(results[i].mat));
    }
    /* STATE (also needed for calc_func) */
    if (results[i].execs & ID_STATE) {
    18a6:	004e7e13          	and	t3,t3,4
    18aa:	060e0063          	beqz	t3,190a <main+0x6b2>
      core_init_state(results[0].size, results[i].seed1, results[i].memblock[3]);
    18ae:	0fc15603          	lhu	a2,252(sp)
    18b2:	11412883          	lw	a7,276(sp)
    18b6:	11012803          	lw	a6,272(sp)
    size--;
    18ba:	0605                	add	a2,a2,1
    18bc:	0642                	sll	a2,a2,0x10
                buf  = errpat[(seed >> 3) & 0x3];
    18be:	630d                	lui	t1,0x3
                buf  = scipat[(seed >> 3) & 0x3];
    18c0:	6e0d                	lui	t3,0x3
                buf  = floatpat[(seed >> 3) & 0x3];
    18c2:	6e8d                	lui	t4,0x3
                buf  = intpat[(seed >> 3) & 0x3];
    18c4:	6f0d                	lui	t5,0x3
    size--;
    18c6:	fff88f93          	add	t6,a7,-1
    while ((total + next + 1) < size)
    18ca:	8241                	srl	a2,a2,0x10
    ee_u8 *buf = 0;
    18cc:	4701                	li	a4,0
    next = 0;
    18ce:	4781                	li	a5,0
    ee_u32 total = 0, next = 0, i;
    18d0:	4501                	li	a0,0
            *(p + total + i) = ',';
    18d2:	02c00293          	li	t0,44
        switch (seed & 0x7)
    18d6:	439d                	li	t2,7
                buf  = errpat[(seed >> 3) & 0x3];
    18d8:	1f830313          	add	t1,t1,504 # 31f8 <errpat>
        switch (seed & 0x7)
    18dc:	4411                	li	s0,4
                buf  = scipat[(seed >> 3) & 0x3];
    18de:	208e0e13          	add	t3,t3,520 # 3208 <scipat>
        switch (seed & 0x7)
    18e2:	4905                	li	s2,1
                buf  = floatpat[(seed >> 3) & 0x3];
    18e4:	218e8e93          	add	t4,t4,536 # 3218 <floatpat>
                buf  = intpat[(seed >> 3) & 0x3];
    18e8:	228f0f13          	add	t5,t5,552 # 3228 <intpat>
    while ((total + next + 1) < size)
    18ec:	00a785b3          	add	a1,a5,a0
    18f0:	00158a13          	add	s4,a1,1
    18f4:	25fa6563          	bltu	s4,t6,1b3e <main+0x8e6>
        *(p + total) = 0;
    18f8:	4601                	li	a2,0
    18fa:	00a8e463          	bltu	a7,a0,1902 <main+0x6aa>
    18fe:	40a88633          	sub	a2,a7,a0
    1902:	4581                	li	a1,0
    1904:	9542                	add	a0,a0,a6
    1906:	45f000ef          	jal	2564 <memset>
    }
  }

  /* Run: LIST only (our iterate() ignores exec mask and only runs list) */
  start_time();
    190a:	e0bfe0ef          	jal	714 <start_time>
  ee_u32 iterations = res->iterations;
    190e:	11812903          	lw	s2,280(sp)
  res->crc = 0; res->crclist = 0; res->crcmatrix = 0; res->crcstate = 0;
    1912:	12012a23          	sw	zero,308(sp)
    1916:	12012c23          	sw	zero,312(sp)
  for (ee_u32 i = 0; i < iterations; i++) {
    191a:	4401                	li	s0,0
    191c:	28891063          	bne	s2,s0,1b9c <main+0x944>
  for (i = 0; i < default_num_contexts; i++) core_start_parallel(&results[i]);
  for (i = 0; i < default_num_contexts; i++) core_stop_parallel(&results[i]);
#else
  iterate(&results[0]);
#endif
  stop_time();
    1920:	e19fe0ef          	jal	738 <stop_time>
    1924:	800006b7          	lui	a3,0x80000
    1928:	80000737          	lui	a4,0x80000
    192c:	5506a783          	lw	a5,1360(a3) # 80000550 <stop_time_val>
    1930:	54872903          	lw	s2,1352(a4) # 80000548 <start_time_val>
    1934:	5546a403          	lw	s0,1364(a3)
    1938:	54c72703          	lw	a4,1356(a4)
    return crcu16((ee_u16)newval, crc);
    193c:	0fc15503          	lhu	a0,252(sp)
    1940:	41278933          	sub	s2,a5,s2
    1944:	0127b7b3          	sltu	a5,a5,s2
    1948:	8c19                	sub	s0,s0,a4
    194a:	4581                	li	a1,0
    194c:	8c1d                	sub	s0,s0,a5
    194e:	f71fe0ef          	jal	8be <crcu16>
    1952:	85aa                	mv	a1,a0
    1954:	0fe15503          	lhu	a0,254(sp)
    1958:	f67fe0ef          	jal	8be <crcu16>
    195c:	85aa                	mv	a1,a0
    195e:	10015503          	lhu	a0,256(sp)
    1962:	f5dfe0ef          	jal	8be <crcu16>

  /* Seed CRC (unchanged) */
  seedcrc = crc16(results[0].seed1, seedcrc);
  seedcrc = crc16(results[0].seed2, seedcrc);
  seedcrc = crc16(results[0].seed3, seedcrc);
  seedcrc = crc16(results[0].size,  seedcrc);
    1966:	11412a83          	lw	s5,276(sp)
    196a:	85aa                	mv	a1,a0
    196c:	010a9513          	sll	a0,s5,0x10
    1970:	8141                	srl	a0,a0,0x10
    1972:	f4dfe0ef          	jal	8be <crcu16>

  switch (seedcrc) {
    1976:	67a1                	lui	a5,0x8
    1978:	b0578793          	add	a5,a5,-1275 # 7b05 <neorv32_uart.c.2d4a2ccb+0x677>
    197c:	89aa                	mv	s3,a0
    197e:	26f50563          	beq	a0,a5,1be8 <main+0x990>
    1982:	24a7e663          	bltu	a5,a0,1bce <main+0x976>
    1986:	6789                	lui	a5,0x2
    1988:	8f278793          	add	a5,a5,-1806 # 18f2 <main+0x69a>
    198c:	26f50063          	beq	a0,a5,1bec <main+0x994>
    1990:	6715                	lui	a4,0x5
    1992:	eaf70713          	add	a4,a4,-337 # 4eaf <core_portme.c.0e0558c4+0x449>
    case 0x8a02: known_id = 0; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k performance run parameters for coremark.\n"); break;
    case 0x7b05: known_id = 1; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k validation run parameters for coremark.\n"); break;
    case 0x4eaf: known_id = 2; if (!COREMARK_MINIMAL_PRINT) ee_printf("Profile generation run parameters for coremark.\n"); break;
    1996:	4789                	li	a5,2
  switch (seedcrc) {
    1998:	5a7d                	li	s4,-1
    199a:	02e51863          	bne	a0,a4,19ca <main+0x772>

  /* Validate LIST CRC only (matrix/state omitted to save ROM) */
  if (known_id >= 0) {
    for (i = 0; i < MULTITHREAD; i++) {
      results[i].err = 0;
      if ((results[i].execs & ID_LIST) && (results[i].crclist != list_known_crc[known_id])) {
    199e:	11c12703          	lw	a4,284(sp)
      results[i].err = 0;
    19a2:	12011e23          	sh	zero,316(sp)
      if ((results[i].execs & ID_LIST) && (results[i].crclist != list_known_crc[known_id])) {
    19a6:	8b05                	and	a4,a4,1
    19a8:	cf19                	beqz	a4,19c6 <main+0x76e>
    19aa:	670d                	lui	a4,0x3
    19ac:	23870713          	add	a4,a4,568 # 3238 <list_known_crc>
    19b0:	0786                	sll	a5,a5,0x1
    19b2:	97ba                	add	a5,a5,a4
    19b4:	0007d783          	lhu	a5,0(a5)
    19b8:	13615703          	lhu	a4,310(sp)
    19bc:	00f70563          	beq	a4,a5,19c6 <main+0x76e>
        if (!COREMARK_MINIMAL_PRINT)
          ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",
                    i, results[i].crclist, list_known_crc[known_id]);
        results[i].err++;
    19c0:	4785                	li	a5,1
    19c2:	12f11e23          	sh	a5,316(sp)
      }
      total_errors += results[i].err;
    19c6:	13c11a03          	lh	s4,316(sp)
    }
  }

  /* Count CFS demo failure as a CoreMark error so final line reflects it */
  if (cfs_rc != 0) {
    19ca:	c489                	beqz	s1,19d4 <main+0x77c>
    total_errors++;
    19cc:	0a05                	add	s4,s4,1
    19ce:	0a42                	sll	s4,s4,0x10
    19d0:	410a5a13          	sra	s4,s4,0x10
  }

  /* Minimal report */
  ee_printf("CoreMark Size    : %lu\n", (unsigned long)results[0].size);
    19d4:	650d                	lui	a0,0x3
    19d6:	85d6                	mv	a1,s5
    19d8:	f1050513          	add	a0,a0,-240 # 2f10 <__fini_array_end+0x3f8>
    19dc:	ef6ff0ef          	jal	10d2 <printf>
  ee_printf("Total ticks      : %lu k\n", (unsigned long)(total_time / 1000));
    19e0:	3e800613          	li	a2,1000
    19e4:	4681                	li	a3,0
    19e6:	854a                	mv	a0,s2
    19e8:	85a2                	mv	a1,s0
    19ea:	585000ef          	jal	276e <__udivdi3>
    19ee:	85aa                	mv	a1,a0
    19f0:	650d                	lui	a0,0x3
    19f2:	f2850513          	add	a0,a0,-216 # 2f28 <__fini_array_end+0x410>
    19f6:	edcff0ef          	jal	10d2 <printf>
    19fa:	7481                	lui	s1,0xfffe0
    19fc:	4090                	lw	a2,0(s1)
  secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
    19fe:	4681                	li	a3,0
    1a00:	854a                	mv	a0,s2
    1a02:	85a2                	mv	a1,s0
    1a04:	56b000ef          	jal	276e <__udivdi3>
    1a08:	85aa                	mv	a1,a0
  ee_printf("Total time (secs): %f\n", time_in_secs(total_time));
  if (time_in_secs(total_time) > 0)
    ee_printf("Iterations/Sec   : %f\n",
      default_num_contexts * results[0].iterations / time_in_secs(total_time));
#else
  ee_printf("Total time (secs): %lu\n", (unsigned long)time_in_secs(total_time));
    1a0a:	650d                	lui	a0,0x3
    1a0c:	f4450513          	add	a0,a0,-188 # 2f44 <__fini_array_end+0x42c>
    1a10:	ec2ff0ef          	jal	10d2 <printf>
    1a14:	4090                	lw	a2,0(s1)
    1a16:	4681                	li	a3,0
    1a18:	854a                	mv	a0,s2
    1a1a:	85a2                	mv	a1,s0
    1a1c:	553000ef          	jal	276e <__udivdi3>
  if (time_in_secs(total_time) > 0)
    1a20:	c105                	beqz	a0,1a40 <main+0x7e8>
    1a22:	4090                	lw	a2,0(s1)
    1a24:	4681                	li	a3,0
    1a26:	854a                	mv	a0,s2
    1a28:	85a2                	mv	a1,s0
    1a2a:	545000ef          	jal	276e <__udivdi3>
    ee_printf("Iterations/Sec   : %lu\n",
    1a2e:	11812583          	lw	a1,280(sp)
    1a32:	02a5d5b3          	divu	a1,a1,a0
    1a36:	650d                	lui	a0,0x3
    1a38:	f5c50513          	add	a0,a0,-164 # 2f5c <__fini_array_end+0x444>
    1a3c:	e96ff0ef          	jal	10d2 <printf>
      (unsigned long)(default_num_contexts * results[0].iterations / time_in_secs(total_time)));
#endif
  ee_printf("Iterations       : %lu\n", (unsigned long)(default_num_contexts * results[0].iterations));
    1a40:	11812583          	lw	a1,280(sp)
    1a44:	650d                	lui	a0,0x3
    1a46:	f7450513          	add	a0,a0,-140 # 2f74 <__fini_array_end+0x45c>
    1a4a:	e88ff0ef          	jal	10d2 <printf>
  ee_printf("Compiler version : %s\n", COMPILER_VERSION);
    1a4e:	658d                	lui	a1,0x3
    1a50:	650d                	lui	a0,0x3
    1a52:	f8c58593          	add	a1,a1,-116 # 2f8c <__fini_array_end+0x474>
    1a56:	f9850513          	add	a0,a0,-104 # 2f98 <__fini_array_end+0x480>
    1a5a:	e78ff0ef          	jal	10d2 <printf>
  ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
    1a5e:	658d                	lui	a1,0x3
    1a60:	650d                	lui	a0,0x3
    1a62:	fb058593          	add	a1,a1,-80 # 2fb0 <__fini_array_end+0x498>
    1a66:	fc050513          	add	a0,a0,-64 # 2fc0 <__fini_array_end+0x4a8>
    1a6a:	e68ff0ef          	jal	10d2 <printf>
  ee_printf("Memory location  : %s\n", MEM_LOCATION);
    1a6e:	658d                	lui	a1,0x3
    1a70:	650d                	lui	a0,0x3
    1a72:	fd858593          	add	a1,a1,-40 # 2fd8 <__fini_array_end+0x4c0>
    1a76:	fe050513          	add	a0,a0,-32 # 2fe0 <__fini_array_end+0x4c8>
    1a7a:	e58ff0ef          	jal	10d2 <printf>
#if defined(USE_CFU)
  ee_printf("Acceleration      : CFU (custom-0 MUL32 used in matrix kernels)\n");
#else
  ee_printf("Acceleration      : OFF (vanilla CoreMark)\n");
    1a7e:	650d                	lui	a0,0x3
    1a80:	ff850513          	add	a0,a0,-8 # 2ff8 <__fini_array_end+0x4e0>
    1a84:	fc2ff0ef          	jal	1246 <puts>
#endif
  ee_printf("seedcrc          : 0x%04x\n", seedcrc);
    1a88:	650d                	lui	a0,0x3
    1a8a:	85ce                	mv	a1,s3
    1a8c:	02450513          	add	a0,a0,36 # 3024 <__fini_array_end+0x50c>
    1a90:	e42ff0ef          	jal	10d2 <printf>
  if (results[0].execs & ID_LIST)
    1a94:	11c12783          	lw	a5,284(sp)
    1a98:	8b85                	and	a5,a5,1
    1a9a:	cb89                	beqz	a5,1aac <main+0x854>
    for (i = 0; i < default_num_contexts; i++)
      ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
    1a9c:	13615603          	lhu	a2,310(sp)
    1aa0:	650d                	lui	a0,0x3
    1aa2:	4581                	li	a1,0
    1aa4:	04050513          	add	a0,a0,64 # 3040 <__fini_array_end+0x528>
    1aa8:	e2aff0ef          	jal	10d2 <printf>

  if (total_errors == 0) {
    1aac:	140a1463          	bnez	s4,1bf4 <main+0x99c>
    ee_printf("Correct operation validated. See README.md for run and reporting rules.\n");
    1ab0:	650d                	lui	a0,0x3
    1ab2:	05c50513          	add	a0,a0,92 # 305c <__fini_array_end+0x544>
  } else if (total_errors > 0) {
    ee_printf("Errors detected\n");
  } else {
    ee_printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
    1ab6:	f90ff0ef          	jal	1246 <puts>
  }
  return pnt;
}

void portable_free(void *p) {
  free(p);
    1aba:	10412503          	lw	a0,260(sp)
    1abe:	35d000ef          	jal	261a <free>
#if (MEM_METHOD == MEM_MALLOC)
  portable_free(results[0].memblock[0]);
#endif
  portable_fini(&(results[0].port));
  return MAIN_RETURN_VAL;
}
    1ac2:	16c12083          	lw	ra,364(sp)
    1ac6:	16812403          	lw	s0,360(sp)
    1aca:	16412483          	lw	s1,356(sp)
    1ace:	16012903          	lw	s2,352(sp)
    1ad2:	15c12983          	lw	s3,348(sp)
    1ad6:	15812a03          	lw	s4,344(sp)
    1ada:	15412a83          	lw	s5,340(sp)
    1ade:	15012b03          	lw	s6,336(sp)
    1ae2:	14c12b83          	lw	s7,332(sp)
    1ae6:	14812c03          	lw	s8,328(sp)
    1aea:	14412c83          	lw	s9,324(sp)
    1aee:	4501                	li	a0,0
    1af0:	6175                	add	sp,sp,368
    1af2:	8082                	ret
  if (seed == 0) seed = 1;
    1af4:	4685                	li	a3,1
    1af6:	b9dd                	j	17ec <main+0x594>
    1af8:	001f9513          	sll	a0,t6,0x1
    1afc:	953a                	add	a0,a0,a4
    for (j = 0; j < N; j++) {
    1afe:	00f58333          	add	t1,a1,a5
      seed         = ((order * seed) % 65536);
    1b02:	02b686b3          	mul	a3,a3,a1
    1b06:	01059813          	sll	a6,a1,0x10
    1b0a:	01085813          	srl	a6,a6,0x10
      A[i * N + j] = val;
    1b0e:	00a38433          	add	s0,t2,a0
      order++;
    1b12:	0585                	add	a1,a1,1
    for (j = 0; j < N; j++) {
    1b14:	0509                	add	a0,a0,2
      seed         = ((order * seed) % 65536);
    1b16:	0256e6b3          	rem	a3,a3,t0
      val          = (seed + order);
    1b1a:	00d80eb3          	add	t4,a6,a3
    1b1e:	0ec2                	sll	t4,t4,0x10
    1b20:	010ede93          	srl	t4,t4,0x10
      val          = (val + order);
    1b24:	9876                	add	a6,a6,t4
      B[i * N + j] = val;
    1b26:	ffd51f23          	sh	t4,-2(a0)
      val          = matrix_clip(val, 1);
    1b2a:	0ff87813          	zext.b	a6,a6
      A[i * N + j] = val;
    1b2e:	01041023          	sh	a6,0(s0)
    for (j = 0; j < N; j++) {
    1b32:	fcb318e3          	bne	t1,a1,1b02 <main+0x8aa>
  for (i = 0; i < N; i++) {
    1b36:	0f05                	add	t5,t5,1
    1b38:	9fbe                	add	t6,t6,a5
    1b3a:	859a                	mv	a1,t1
    1b3c:	b3b9                	j	188a <main+0x632>
        if (next > 0)
    1b3e:	c395                	beqz	a5,1b62 <main+0x90a>
            for (i = 0; i < next; i++)
    1b40:	4681                	li	a3,0
                *(p + total + i) = buf[i];
    1b42:	00d709b3          	add	s3,a4,a3
    1b46:	0009ca83          	lbu	s5,0(s3)
    1b4a:	00a689b3          	add	s3,a3,a0
    1b4e:	99c2                	add	s3,s3,a6
    1b50:	01598023          	sb	s5,0(s3)
            for (i = 0; i < next; i++)
    1b54:	0685                	add	a3,a3,1
    1b56:	fed796e3          	bne	a5,a3,1b42 <main+0x8ea>
            *(p + total + i) = ',';
    1b5a:	95c2                	add	a1,a1,a6
    1b5c:	00558023          	sb	t0,0(a1)
            total += next + 1;
    1b60:	8552                	mv	a0,s4
                buf  = intpat[(seed >> 3) & 0x3];
    1b62:	00165793          	srl	a5,a2,0x1
    1b66:	00767713          	and	a4,a2,7
    1b6a:	8bb1                	and	a5,a5,12
        switch (seed & 0x7)
    1b6c:	02770663          	beq	a4,t2,1b98 <main+0x940>
    1b70:	02e46263          	bltu	s0,a4,1b94 <main+0x93c>
    1b74:	1775                	add	a4,a4,-3
    1b76:	0742                	sll	a4,a4,0x10
    1b78:	8341                	srl	a4,a4,0x10
    1b7a:	00e97963          	bgeu	s2,a4,1b8c <main+0x934>
                buf  = intpat[(seed >> 3) & 0x3];
    1b7e:	97fa                	add	a5,a5,t5
    1b80:	4398                	lw	a4,0(a5)
                next = 4;
    1b82:	4791                	li	a5,4
    1b84:	0605                	add	a2,a2,1
    1b86:	0642                	sll	a2,a2,0x10
    1b88:	8241                	srl	a2,a2,0x10
    1b8a:	b38d                	j	18ec <main+0x694>
                buf  = floatpat[(seed >> 3) & 0x3];
    1b8c:	97f6                	add	a5,a5,t4
                buf  = errpat[(seed >> 3) & 0x3];
    1b8e:	4398                	lw	a4,0(a5)
                next = 8;
    1b90:	47a1                	li	a5,8
                break;
    1b92:	bfcd                	j	1b84 <main+0x92c>
                buf  = scipat[(seed >> 3) & 0x3];
    1b94:	97f2                	add	a5,a5,t3
    1b96:	bfe5                	j	1b8e <main+0x936>
                buf  = errpat[(seed >> 3) & 0x3];
    1b98:	979a                	add	a5,a5,t1
    1b9a:	bfd5                	j	1b8e <main+0x936>
    crc      = core_bench_list(res,  1);
    1b9c:	4585                	li	a1,1
    1b9e:	19e8                	add	a0,sp,252
    1ba0:	8baff0ef          	jal	c5a <core_bench_list>
    res->crc = crcu16(crc, res->crc);
    1ba4:	13415583          	lhu	a1,308(sp)
    1ba8:	d17fe0ef          	jal	8be <crcu16>
    1bac:	12a11a23          	sh	a0,308(sp)
    crc      = core_bench_list(res, -1);
    1bb0:	55fd                	li	a1,-1
    1bb2:	19e8                	add	a0,sp,252
    1bb4:	8a6ff0ef          	jal	c5a <core_bench_list>
    res->crc = crcu16(crc, res->crc);
    1bb8:	13415583          	lhu	a1,308(sp)
    1bbc:	d03fe0ef          	jal	8be <crcu16>
    1bc0:	12a11a23          	sh	a0,308(sp)
    if (i == 0) res->crclist = res->crc;
    1bc4:	e019                	bnez	s0,1bca <main+0x972>
    1bc6:	12a11b23          	sh	a0,310(sp)
  for (ee_u32 i = 0; i < iterations; i++) {
    1bca:	0405                	add	s0,s0,1
    1bcc:	bb81                	j	191c <main+0x6c4>
  switch (seedcrc) {
    1bce:	67a5                	lui	a5,0x9
    1bd0:	a0278793          	add	a5,a5,-1534 # 8a02 <neorv32_uart.c.2d4a2ccb+0x1574>
    1bd4:	00f50e63          	beq	a0,a5,1bf0 <main+0x998>
    1bd8:	67bd                	lui	a5,0xf
    1bda:	9f578793          	add	a5,a5,-1547 # e9f5 <neorv32_uart.c.2d4a2ccb+0x7567>
    1bde:	5a7d                	li	s4,-1
    1be0:	def515e3          	bne	a0,a5,19ca <main+0x772>
    case 0xe9f5: known_id = 3; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K performance run parameters for coremark.\n"); break;
    1be4:	478d                	li	a5,3
    1be6:	bb65                	j	199e <main+0x746>
  switch (seedcrc) {
    1be8:	4785                	li	a5,1
    1bea:	bb55                	j	199e <main+0x746>
    case 0x18f2: known_id = 4; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K validation run parameters for coremark.\n"); break;
    1bec:	4791                	li	a5,4
    1bee:	bb45                	j	199e <main+0x746>
    case 0x8a02: known_id = 0; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k performance run parameters for coremark.\n"); break;
    1bf0:	4781                	li	a5,0
    1bf2:	b375                	j	199e <main+0x746>
  } else if (total_errors > 0) {
    1bf4:	01405663          	blez	s4,1c00 <main+0x9a8>
    ee_printf("Errors detected\n");
    1bf8:	650d                	lui	a0,0x3
    1bfa:	0a450513          	add	a0,a0,164 # 30a4 <__fini_array_end+0x58c>
    1bfe:	bd65                	j	1ab6 <main+0x85e>
    ee_printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
    1c00:	650d                	lui	a0,0x3
    1c02:	0b450513          	add	a0,a0,180 # 30b4 <__fini_array_end+0x59c>
    1c06:	bd45                	j	1ab6 <main+0x85e>

00001c08 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
    1c08:	80000737          	lui	a4,0x80000
    1c0c:	53872683          	lw	a3,1336(a4) # 80000538 <curr_heap.0>
    1c10:	80000637          	lui	a2,0x80000
void *_sbrk(int incr) {
    1c14:	87aa                	mv	a5,a0
    1c16:	74060613          	add	a2,a2,1856 # 80000740 <__crt0_bss_end>
  if (curr_heap == NULL) {
    1c1a:	e299                	bnez	a3,1c20 <_sbrk+0x18>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
    1c1c:	52c72c23          	sw	a2,1336(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
    1c20:	800006b7          	lui	a3,0x80000
    1c24:	74068693          	add	a3,a3,1856 # 80000740 <__crt0_bss_end>
    1c28:	00c69963          	bne	a3,a2,1c3a <_sbrk+0x32>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
    1c2c:	800007b7          	lui	a5,0x80000
    1c30:	4731                	li	a4,12
    1c32:	54e7ac23          	sw	a4,1368(a5) # 80000558 <errno>
    return (void*)-1; // error - no more memory
    1c36:	557d                	li	a0,-1
    1c38:	8082                	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
    1c3a:	53872503          	lw	a0,1336(a4)
    1c3e:	97aa                	add	a5,a5,a0
    1c40:	fed7f6e3          	bgeu	a5,a3,1c2c <_sbrk+0x24>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
    1c44:	52f72c23          	sw	a5,1336(a4)

  return (void*)prev_heap;
}
    1c48:	8082                	ret

00001c4a <_malloc_trim_r>:
    1c4a:	1101                	add	sp,sp,-32
    1c4c:	cc22                	sw	s0,24(sp)
    1c4e:	ca26                	sw	s1,20(sp)
    1c50:	c84a                	sw	s2,16(sp)
    1c52:	c64e                	sw	s3,12(sp)
    1c54:	c452                	sw	s4,8(sp)
    1c56:	89ae                	mv	s3,a1
    1c58:	ce06                	sw	ra,28(sp)
    1c5a:	892a                	mv	s2,a0
    1c5c:	7fffea17          	auipc	s4,0x7fffe
    1c60:	4c4a0a13          	add	s4,s4,1220 # 80000120 <__malloc_av_>
    1c64:	0b1000ef          	jal	2514 <__malloc_lock>
    1c68:	008a2703          	lw	a4,8(s4)
    1c6c:	6785                	lui	a5,0x1
    1c6e:	17bd                	add	a5,a5,-17 # fef <neorv32_rte_debug_handler+0xa9>
    1c70:	4344                	lw	s1,4(a4)
    1c72:	6705                	lui	a4,0x1
    1c74:	98f1                	and	s1,s1,-4
    1c76:	00f48433          	add	s0,s1,a5
    1c7a:	41340433          	sub	s0,s0,s3
    1c7e:	8031                	srl	s0,s0,0xc
    1c80:	147d                	add	s0,s0,-1
    1c82:	0432                	sll	s0,s0,0xc
    1c84:	00e44b63          	blt	s0,a4,1c9a <_malloc_trim_r+0x50>
    1c88:	4581                	li	a1,0
    1c8a:	854a                	mv	a0,s2
    1c8c:	09d000ef          	jal	2528 <_sbrk_r>
    1c90:	008a2783          	lw	a5,8(s4)
    1c94:	97a6                	add	a5,a5,s1
    1c96:	00f50e63          	beq	a0,a5,1cb2 <_malloc_trim_r+0x68>
    1c9a:	854a                	mv	a0,s2
    1c9c:	083000ef          	jal	251e <__malloc_unlock>
    1ca0:	40f2                	lw	ra,28(sp)
    1ca2:	4462                	lw	s0,24(sp)
    1ca4:	44d2                	lw	s1,20(sp)
    1ca6:	4942                	lw	s2,16(sp)
    1ca8:	49b2                	lw	s3,12(sp)
    1caa:	4a22                	lw	s4,8(sp)
    1cac:	4501                	li	a0,0
    1cae:	6105                	add	sp,sp,32
    1cb0:	8082                	ret
    1cb2:	408005b3          	neg	a1,s0
    1cb6:	854a                	mv	a0,s2
    1cb8:	071000ef          	jal	2528 <_sbrk_r>
    1cbc:	57fd                	li	a5,-1
    1cbe:	02f50b63          	beq	a0,a5,1cf4 <_malloc_trim_r+0xaa>
    1cc2:	7ffff717          	auipc	a4,0x7ffff
    1cc6:	91e70713          	add	a4,a4,-1762 # 800005e0 <__malloc_current_mallinfo>
    1cca:	431c                	lw	a5,0(a4)
    1ccc:	008a2683          	lw	a3,8(s4)
    1cd0:	8c81                	sub	s1,s1,s0
    1cd2:	0014e493          	or	s1,s1,1
    1cd6:	8f81                	sub	a5,a5,s0
    1cd8:	854a                	mv	a0,s2
    1cda:	c2c4                	sw	s1,4(a3)
    1cdc:	c31c                	sw	a5,0(a4)
    1cde:	041000ef          	jal	251e <__malloc_unlock>
    1ce2:	40f2                	lw	ra,28(sp)
    1ce4:	4462                	lw	s0,24(sp)
    1ce6:	44d2                	lw	s1,20(sp)
    1ce8:	4942                	lw	s2,16(sp)
    1cea:	49b2                	lw	s3,12(sp)
    1cec:	4a22                	lw	s4,8(sp)
    1cee:	4505                	li	a0,1
    1cf0:	6105                	add	sp,sp,32
    1cf2:	8082                	ret
    1cf4:	4581                	li	a1,0
    1cf6:	854a                	mv	a0,s2
    1cf8:	031000ef          	jal	2528 <_sbrk_r>
    1cfc:	008a2703          	lw	a4,8(s4)
    1d00:	46bd                	li	a3,15
    1d02:	40e507b3          	sub	a5,a0,a4
    1d06:	f8f6dae3          	bge	a3,a5,1c9a <_malloc_trim_r+0x50>
    1d0a:	7ffff697          	auipc	a3,0x7ffff
    1d0e:	8266a683          	lw	a3,-2010(a3) # 80000530 <__malloc_sbrk_base>
    1d12:	8d15                	sub	a0,a0,a3
    1d14:	0017e793          	or	a5,a5,1
    1d18:	7ffff697          	auipc	a3,0x7ffff
    1d1c:	8ca6a423          	sw	a0,-1848(a3) # 800005e0 <__malloc_current_mallinfo>
    1d20:	c35c                	sw	a5,4(a4)
    1d22:	bfa5                	j	1c9a <_malloc_trim_r+0x50>

00001d24 <_free_r>:
    1d24:	10058b63          	beqz	a1,1e3a <_free_r+0x116>
    1d28:	1141                	add	sp,sp,-16
    1d2a:	c422                	sw	s0,8(sp)
    1d2c:	c226                	sw	s1,4(sp)
    1d2e:	842e                	mv	s0,a1
    1d30:	84aa                	mv	s1,a0
    1d32:	c606                	sw	ra,12(sp)
    1d34:	7e0000ef          	jal	2514 <__malloc_lock>
    1d38:	ffc42583          	lw	a1,-4(s0)
    1d3c:	ff840713          	add	a4,s0,-8
    1d40:	7fffe517          	auipc	a0,0x7fffe
    1d44:	3e050513          	add	a0,a0,992 # 80000120 <__malloc_av_>
    1d48:	ffe5f793          	and	a5,a1,-2
    1d4c:	00f70633          	add	a2,a4,a5
    1d50:	4254                	lw	a3,4(a2)
    1d52:	00852803          	lw	a6,8(a0)
    1d56:	9af1                	and	a3,a3,-4
    1d58:	12c80363          	beq	a6,a2,1e7e <_free_r+0x15a>
    1d5c:	c254                	sw	a3,4(a2)
    1d5e:	8985                	and	a1,a1,1
    1d60:	00d60833          	add	a6,a2,a3
    1d64:	e9b5                	bnez	a1,1dd8 <_free_r+0xb4>
    1d66:	ff842303          	lw	t1,-8(s0)
    1d6a:	00482583          	lw	a1,4(a6)
    1d6e:	7fffe897          	auipc	a7,0x7fffe
    1d72:	3ba88893          	add	a7,a7,954 # 80000128 <__malloc_av_+0x8>
    1d76:	40670733          	sub	a4,a4,t1
    1d7a:	00872803          	lw	a6,8(a4)
    1d7e:	979a                	add	a5,a5,t1
    1d80:	8985                	and	a1,a1,1
    1d82:	0f180263          	beq	a6,a7,1e66 <_free_r+0x142>
    1d86:	00c72303          	lw	t1,12(a4)
    1d8a:	00682623          	sw	t1,12(a6)
    1d8e:	01032423          	sw	a6,8(t1)
    1d92:	12058263          	beqz	a1,1eb6 <_free_r+0x192>
    1d96:	0017e693          	or	a3,a5,1
    1d9a:	c354                	sw	a3,4(a4)
    1d9c:	c21c                	sw	a5,0(a2)
    1d9e:	1ff00693          	li	a3,511
    1da2:	04f6e863          	bltu	a3,a5,1df2 <_free_r+0xce>
    1da6:	ff87f693          	and	a3,a5,-8
    1daa:	06a1                	add	a3,a3,8
    1dac:	414c                	lw	a1,4(a0)
    1dae:	96aa                	add	a3,a3,a0
    1db0:	4290                	lw	a2,0(a3)
    1db2:	0057d813          	srl	a6,a5,0x5
    1db6:	4785                	li	a5,1
    1db8:	010797b3          	sll	a5,a5,a6
    1dbc:	8fcd                	or	a5,a5,a1
    1dbe:	ff868593          	add	a1,a3,-8
    1dc2:	c74c                	sw	a1,12(a4)
    1dc4:	c710                	sw	a2,8(a4)
    1dc6:	c15c                	sw	a5,4(a0)
    1dc8:	c298                	sw	a4,0(a3)
    1dca:	c658                	sw	a4,12(a2)
    1dcc:	4422                	lw	s0,8(sp)
    1dce:	40b2                	lw	ra,12(sp)
    1dd0:	8526                	mv	a0,s1
    1dd2:	4492                	lw	s1,4(sp)
    1dd4:	0141                	add	sp,sp,16
    1dd6:	a7a1                	j	251e <__malloc_unlock>
    1dd8:	00482583          	lw	a1,4(a6)
    1ddc:	8985                	and	a1,a1,1
    1dde:	cdb9                	beqz	a1,1e3c <_free_r+0x118>
    1de0:	0017e693          	or	a3,a5,1
    1de4:	fed42e23          	sw	a3,-4(s0)
    1de8:	c21c                	sw	a5,0(a2)
    1dea:	1ff00693          	li	a3,511
    1dee:	faf6fce3          	bgeu	a3,a5,1da6 <_free_r+0x82>
    1df2:	0097d693          	srl	a3,a5,0x9
    1df6:	4611                	li	a2,4
    1df8:	0cd66163          	bltu	a2,a3,1eba <_free_r+0x196>
    1dfc:	0067d693          	srl	a3,a5,0x6
    1e00:	03968593          	add	a1,a3,57
    1e04:	03868613          	add	a2,a3,56
    1e08:	058e                	sll	a1,a1,0x3
    1e0a:	95aa                	add	a1,a1,a0
    1e0c:	4194                	lw	a3,0(a1)
    1e0e:	15e1                	add	a1,a1,-8
    1e10:	00d59663          	bne	a1,a3,1e1c <_free_r+0xf8>
    1e14:	a0e5                	j	1efc <_free_r+0x1d8>
    1e16:	4694                	lw	a3,8(a3)
    1e18:	00d58663          	beq	a1,a3,1e24 <_free_r+0x100>
    1e1c:	42d0                	lw	a2,4(a3)
    1e1e:	9a71                	and	a2,a2,-4
    1e20:	fec7ebe3          	bltu	a5,a2,1e16 <_free_r+0xf2>
    1e24:	46cc                	lw	a1,12(a3)
    1e26:	c74c                	sw	a1,12(a4)
    1e28:	c714                	sw	a3,8(a4)
    1e2a:	4422                	lw	s0,8(sp)
    1e2c:	40b2                	lw	ra,12(sp)
    1e2e:	c598                	sw	a4,8(a1)
    1e30:	8526                	mv	a0,s1
    1e32:	4492                	lw	s1,4(sp)
    1e34:	c6d8                	sw	a4,12(a3)
    1e36:	0141                	add	sp,sp,16
    1e38:	a5dd                	j	251e <__malloc_unlock>
    1e3a:	8082                	ret
    1e3c:	97b6                	add	a5,a5,a3
    1e3e:	7fffe897          	auipc	a7,0x7fffe
    1e42:	2ea88893          	add	a7,a7,746 # 80000128 <__malloc_av_+0x8>
    1e46:	4614                	lw	a3,8(a2)
    1e48:	09168e63          	beq	a3,a7,1ee4 <_free_r+0x1c0>
    1e4c:	00c62803          	lw	a6,12(a2)
    1e50:	0017e593          	or	a1,a5,1
    1e54:	00f70633          	add	a2,a4,a5
    1e58:	0106a623          	sw	a6,12(a3)
    1e5c:	00d82423          	sw	a3,8(a6)
    1e60:	c34c                	sw	a1,4(a4)
    1e62:	c21c                	sw	a5,0(a2)
    1e64:	bf2d                	j	1d9e <_free_r+0x7a>
    1e66:	e1f5                	bnez	a1,1f4a <_free_r+0x226>
    1e68:	460c                	lw	a1,8(a2)
    1e6a:	4650                	lw	a2,12(a2)
    1e6c:	96be                	add	a3,a3,a5
    1e6e:	0016e793          	or	a5,a3,1
    1e72:	c5d0                	sw	a2,12(a1)
    1e74:	c60c                	sw	a1,8(a2)
    1e76:	c35c                	sw	a5,4(a4)
    1e78:	9736                	add	a4,a4,a3
    1e7a:	c314                	sw	a3,0(a4)
    1e7c:	bf81                	j	1dcc <_free_r+0xa8>
    1e7e:	8985                	and	a1,a1,1
    1e80:	96be                	add	a3,a3,a5
    1e82:	e989                	bnez	a1,1e94 <_free_r+0x170>
    1e84:	ff842583          	lw	a1,-8(s0)
    1e88:	8f0d                	sub	a4,a4,a1
    1e8a:	475c                	lw	a5,12(a4)
    1e8c:	4710                	lw	a2,8(a4)
    1e8e:	96ae                	add	a3,a3,a1
    1e90:	c65c                	sw	a5,12(a2)
    1e92:	c790                	sw	a2,8(a5)
    1e94:	0016e793          	or	a5,a3,1
    1e98:	c35c                	sw	a5,4(a4)
    1e9a:	c518                	sw	a4,8(a0)
    1e9c:	7fffe797          	auipc	a5,0x7fffe
    1ea0:	6987a783          	lw	a5,1688(a5) # 80000534 <__malloc_trim_threshold>
    1ea4:	f2f6e4e3          	bltu	a3,a5,1dcc <_free_r+0xa8>
    1ea8:	7fffe597          	auipc	a1,0x7fffe
    1eac:	6bc5a583          	lw	a1,1724(a1) # 80000564 <__malloc_top_pad>
    1eb0:	8526                	mv	a0,s1
    1eb2:	3b61                	jal	1c4a <_malloc_trim_r>
    1eb4:	bf21                	j	1dcc <_free_r+0xa8>
    1eb6:	97b6                	add	a5,a5,a3
    1eb8:	b779                	j	1e46 <_free_r+0x122>
    1eba:	4651                	li	a2,20
    1ebc:	00d67e63          	bgeu	a2,a3,1ed8 <_free_r+0x1b4>
    1ec0:	05400613          	li	a2,84
    1ec4:	04d66663          	bltu	a2,a3,1f10 <_free_r+0x1ec>
    1ec8:	00c7d693          	srl	a3,a5,0xc
    1ecc:	06f68593          	add	a1,a3,111
    1ed0:	06e68613          	add	a2,a3,110
    1ed4:	058e                	sll	a1,a1,0x3
    1ed6:	bf15                	j	1e0a <_free_r+0xe6>
    1ed8:	05c68593          	add	a1,a3,92
    1edc:	05b68613          	add	a2,a3,91
    1ee0:	058e                	sll	a1,a1,0x3
    1ee2:	b725                	j	1e0a <_free_r+0xe6>
    1ee4:	c958                	sw	a4,20(a0)
    1ee6:	c918                	sw	a4,16(a0)
    1ee8:	0017e693          	or	a3,a5,1
    1eec:	01172623          	sw	a7,12(a4)
    1ef0:	01172423          	sw	a7,8(a4)
    1ef4:	c354                	sw	a3,4(a4)
    1ef6:	973e                	add	a4,a4,a5
    1ef8:	c31c                	sw	a5,0(a4)
    1efa:	bdc9                	j	1dcc <_free_r+0xa8>
    1efc:	00452803          	lw	a6,4(a0)
    1f00:	8609                	sra	a2,a2,0x2
    1f02:	4785                	li	a5,1
    1f04:	00c797b3          	sll	a5,a5,a2
    1f08:	0107e7b3          	or	a5,a5,a6
    1f0c:	c15c                	sw	a5,4(a0)
    1f0e:	bf21                	j	1e26 <_free_r+0x102>
    1f10:	15400613          	li	a2,340
    1f14:	00d66a63          	bltu	a2,a3,1f28 <_free_r+0x204>
    1f18:	00f7d693          	srl	a3,a5,0xf
    1f1c:	07868593          	add	a1,a3,120
    1f20:	07768613          	add	a2,a3,119
    1f24:	058e                	sll	a1,a1,0x3
    1f26:	b5d5                	j	1e0a <_free_r+0xe6>
    1f28:	55400613          	li	a2,1364
    1f2c:	00d66a63          	bltu	a2,a3,1f40 <_free_r+0x21c>
    1f30:	0127d693          	srl	a3,a5,0x12
    1f34:	07d68593          	add	a1,a3,125
    1f38:	07c68613          	add	a2,a3,124
    1f3c:	058e                	sll	a1,a1,0x3
    1f3e:	b5f1                	j	1e0a <_free_r+0xe6>
    1f40:	3f800593          	li	a1,1016
    1f44:	07e00613          	li	a2,126
    1f48:	b5c9                	j	1e0a <_free_r+0xe6>
    1f4a:	0017e693          	or	a3,a5,1
    1f4e:	c354                	sw	a3,4(a4)
    1f50:	c21c                	sw	a5,0(a2)
    1f52:	bdad                	j	1dcc <_free_r+0xa8>

00001f54 <_malloc_r>:
    1f54:	7179                	add	sp,sp,-48
    1f56:	d04a                	sw	s2,32(sp)
    1f58:	d606                	sw	ra,44(sp)
    1f5a:	d422                	sw	s0,40(sp)
    1f5c:	d226                	sw	s1,36(sp)
    1f5e:	ce4e                	sw	s3,28(sp)
    1f60:	00b58793          	add	a5,a1,11
    1f64:	4759                	li	a4,22
    1f66:	892a                	mv	s2,a0
    1f68:	04f76963          	bltu	a4,a5,1fba <_malloc_r+0x66>
    1f6c:	47c1                	li	a5,16
    1f6e:	16b7eb63          	bltu	a5,a1,20e4 <__neorv32_ram_size+0xe4>
    1f72:	234d                	jal	2514 <__malloc_lock>
    1f74:	47e1                	li	a5,24
    1f76:	4589                	li	a1,2
    1f78:	44c1                	li	s1,16
    1f7a:	7fffe997          	auipc	s3,0x7fffe
    1f7e:	1a698993          	add	s3,s3,422 # 80000120 <__malloc_av_>
    1f82:	97ce                	add	a5,a5,s3
    1f84:	43c0                	lw	s0,4(a5)
    1f86:	ff878713          	add	a4,a5,-8
    1f8a:	26e40a63          	beq	s0,a4,21fe <__neorv32_ram_size+0x1fe>
    1f8e:	405c                	lw	a5,4(s0)
    1f90:	4454                	lw	a3,12(s0)
    1f92:	4410                	lw	a2,8(s0)
    1f94:	9bf1                	and	a5,a5,-4
    1f96:	97a2                	add	a5,a5,s0
    1f98:	43d8                	lw	a4,4(a5)
    1f9a:	c654                	sw	a3,12(a2)
    1f9c:	c690                	sw	a2,8(a3)
    1f9e:	00176713          	or	a4,a4,1
    1fa2:	854a                	mv	a0,s2
    1fa4:	c3d8                	sw	a4,4(a5)
    1fa6:	2ba5                	jal	251e <__malloc_unlock>
    1fa8:	00840513          	add	a0,s0,8
    1fac:	50b2                	lw	ra,44(sp)
    1fae:	5422                	lw	s0,40(sp)
    1fb0:	5492                	lw	s1,36(sp)
    1fb2:	5902                	lw	s2,32(sp)
    1fb4:	49f2                	lw	s3,28(sp)
    1fb6:	6145                	add	sp,sp,48
    1fb8:	8082                	ret
    1fba:	ff87f493          	and	s1,a5,-8
    1fbe:	1207c363          	bltz	a5,20e4 <__neorv32_ram_size+0xe4>
    1fc2:	12b4e163          	bltu	s1,a1,20e4 <__neorv32_ram_size+0xe4>
    1fc6:	23b9                	jal	2514 <__malloc_lock>
    1fc8:	1f700793          	li	a5,503
    1fcc:	2e97f863          	bgeu	a5,s1,22bc <__neorv32_ram_size+0x2bc>
    1fd0:	0094d793          	srl	a5,s1,0x9
    1fd4:	10078d63          	beqz	a5,20ee <__neorv32_ram_size+0xee>
    1fd8:	4711                	li	a4,4
    1fda:	26f76763          	bltu	a4,a5,2248 <__neorv32_ram_size+0x248>
    1fde:	0064d793          	srl	a5,s1,0x6
    1fe2:	03978593          	add	a1,a5,57
    1fe6:	03878813          	add	a6,a5,56
    1fea:	00359613          	sll	a2,a1,0x3
    1fee:	7fffe997          	auipc	s3,0x7fffe
    1ff2:	13298993          	add	s3,s3,306 # 80000120 <__malloc_av_>
    1ff6:	964e                	add	a2,a2,s3
    1ff8:	4240                	lw	s0,4(a2)
    1ffa:	1661                	add	a2,a2,-8
    1ffc:	02860163          	beq	a2,s0,201e <__neorv32_ram_size+0x1e>
    2000:	453d                	li	a0,15
    2002:	a039                	j	2010 <__neorv32_ram_size+0x10>
    2004:	4454                	lw	a3,12(s0)
    2006:	1e075a63          	bgez	a4,21fa <__neorv32_ram_size+0x1fa>
    200a:	00d60a63          	beq	a2,a3,201e <__neorv32_ram_size+0x1e>
    200e:	8436                	mv	s0,a3
    2010:	405c                	lw	a5,4(s0)
    2012:	9bf1                	and	a5,a5,-4
    2014:	40978733          	sub	a4,a5,s1
    2018:	fee556e3          	bge	a0,a4,2004 <__neorv32_ram_size+0x4>
    201c:	85c2                	mv	a1,a6
    201e:	0109a403          	lw	s0,16(s3)
    2022:	7fffe897          	auipc	a7,0x7fffe
    2026:	10688893          	add	a7,a7,262 # 80000128 <__malloc_av_+0x8>
    202a:	1d140563          	beq	s0,a7,21f4 <__neorv32_ram_size+0x1f4>
    202e:	405c                	lw	a5,4(s0)
    2030:	46bd                	li	a3,15
    2032:	9bf1                	and	a5,a5,-4
    2034:	40978733          	sub	a4,a5,s1
    2038:	28e6c763          	blt	a3,a4,22c6 <__neorv32_ram_size+0x2c6>
    203c:	0119aa23          	sw	a7,20(s3)
    2040:	0119a823          	sw	a7,16(s3)
    2044:	26075263          	bgez	a4,22a8 <__neorv32_ram_size+0x2a8>
    2048:	1ff00713          	li	a4,511
    204c:	0049a503          	lw	a0,4(s3)
    2050:	1af76c63          	bltu	a4,a5,2208 <__neorv32_ram_size+0x208>
    2054:	ff87f713          	and	a4,a5,-8
    2058:	0721                	add	a4,a4,8
    205a:	974e                	add	a4,a4,s3
    205c:	4314                	lw	a3,0(a4)
    205e:	0057d613          	srl	a2,a5,0x5
    2062:	4785                	li	a5,1
    2064:	00c797b3          	sll	a5,a5,a2
    2068:	8d5d                	or	a0,a0,a5
    206a:	ff870793          	add	a5,a4,-8
    206e:	c45c                	sw	a5,12(s0)
    2070:	c414                	sw	a3,8(s0)
    2072:	00a9a223          	sw	a0,4(s3)
    2076:	c300                	sw	s0,0(a4)
    2078:	c6c0                	sw	s0,12(a3)
    207a:	4025d793          	sra	a5,a1,0x2
    207e:	4605                	li	a2,1
    2080:	00f61633          	sll	a2,a2,a5
    2084:	06c56c63          	bltu	a0,a2,20fc <__neorv32_ram_size+0xfc>
    2088:	00a677b3          	and	a5,a2,a0
    208c:	ef81                	bnez	a5,20a4 <__neorv32_ram_size+0xa4>
    208e:	0606                	sll	a2,a2,0x1
    2090:	99f1                	and	a1,a1,-4
    2092:	00a677b3          	and	a5,a2,a0
    2096:	0591                	add	a1,a1,4
    2098:	e791                	bnez	a5,20a4 <__neorv32_ram_size+0xa4>
    209a:	0606                	sll	a2,a2,0x1
    209c:	00a677b3          	and	a5,a2,a0
    20a0:	0591                	add	a1,a1,4
    20a2:	dfe5                	beqz	a5,209a <__neorv32_ram_size+0x9a>
    20a4:	483d                	li	a6,15
    20a6:	00359313          	sll	t1,a1,0x3
    20aa:	934e                	add	t1,t1,s3
    20ac:	851a                	mv	a0,t1
    20ae:	455c                	lw	a5,12(a0)
    20b0:	8e2e                	mv	t3,a1
    20b2:	1af50b63          	beq	a0,a5,2268 <__neorv32_ram_size+0x268>
    20b6:	43d8                	lw	a4,4(a5)
    20b8:	843e                	mv	s0,a5
    20ba:	47dc                	lw	a5,12(a5)
    20bc:	9b71                	and	a4,a4,-4
    20be:	409706b3          	sub	a3,a4,s1
    20c2:	1ad84a63          	blt	a6,a3,2276 <__neorv32_ram_size+0x276>
    20c6:	fe06c6e3          	bltz	a3,20b2 <__neorv32_ram_size+0xb2>
    20ca:	9722                	add	a4,a4,s0
    20cc:	4354                	lw	a3,4(a4)
    20ce:	4410                	lw	a2,8(s0)
    20d0:	854a                	mv	a0,s2
    20d2:	0016e693          	or	a3,a3,1
    20d6:	c354                	sw	a3,4(a4)
    20d8:	c65c                	sw	a5,12(a2)
    20da:	c790                	sw	a2,8(a5)
    20dc:	2189                	jal	251e <__malloc_unlock>
    20de:	00840513          	add	a0,s0,8
    20e2:	b5e9                	j	1fac <_malloc_r+0x58>
    20e4:	47b1                	li	a5,12
    20e6:	00f92023          	sw	a5,0(s2)
    20ea:	4501                	li	a0,0
    20ec:	b5c1                	j	1fac <_malloc_r+0x58>
    20ee:	20000613          	li	a2,512
    20f2:	04000593          	li	a1,64
    20f6:	03f00813          	li	a6,63
    20fa:	bdd5                	j	1fee <_malloc_r+0x9a>
    20fc:	0089a403          	lw	s0,8(s3)
    2100:	c85a                	sw	s6,16(sp)
    2102:	405c                	lw	a5,4(s0)
    2104:	ffc7fb13          	and	s6,a5,-4
    2108:	009b6763          	bltu	s6,s1,2116 <__neorv32_ram_size+0x116>
    210c:	409b0733          	sub	a4,s6,s1
    2110:	47bd                	li	a5,15
    2112:	0ae7cc63          	blt	a5,a4,21ca <__neorv32_ram_size+0x1ca>
    2116:	c266                	sw	s9,4(sp)
    2118:	7fffec97          	auipc	s9,0x7fffe
    211c:	418c8c93          	add	s9,s9,1048 # 80000530 <__malloc_sbrk_base>
    2120:	000ca703          	lw	a4,0(s9)
    2124:	cc52                	sw	s4,24(sp)
    2126:	ca56                	sw	s5,20(sp)
    2128:	c65e                	sw	s7,12(sp)
    212a:	7fffea97          	auipc	s5,0x7fffe
    212e:	43aaaa83          	lw	s5,1082(s5) # 80000564 <__malloc_top_pad>
    2132:	57fd                	li	a5,-1
    2134:	01640a33          	add	s4,s0,s6
    2138:	9aa6                	add	s5,s5,s1
    213a:	2cf70d63          	beq	a4,a5,2414 <__neorv32_ram_size+0x414>
    213e:	6785                	lui	a5,0x1
    2140:	07bd                	add	a5,a5,15 # 100f <neorv32_rte_debug_handler+0xc9>
    2142:	9abe                	add	s5,s5,a5
    2144:	77fd                	lui	a5,0xfffff
    2146:	00fafab3          	and	s5,s5,a5
    214a:	85d6                	mv	a1,s5
    214c:	854a                	mv	a0,s2
    214e:	2ee9                	jal	2528 <_sbrk_r>
    2150:	57fd                	li	a5,-1
    2152:	8baa                	mv	s7,a0
    2154:	32f50f63          	beq	a0,a5,2492 <__neorv32_ram_size+0x492>
    2158:	c462                	sw	s8,8(sp)
    215a:	1b456463          	bltu	a0,s4,2302 <__neorv32_ram_size+0x302>
    215e:	7fffec17          	auipc	s8,0x7fffe
    2162:	482c0c13          	add	s8,s8,1154 # 800005e0 <__malloc_current_mallinfo>
    2166:	000c2583          	lw	a1,0(s8)
    216a:	95d6                	add	a1,a1,s5
    216c:	00bc2023          	sw	a1,0(s8)
    2170:	872e                	mv	a4,a1
    2172:	1eaa1e63          	bne	s4,a0,236e <__neorv32_ram_size+0x36e>
    2176:	01451793          	sll	a5,a0,0x14
    217a:	1e079a63          	bnez	a5,236e <__neorv32_ram_size+0x36e>
    217e:	0089ab83          	lw	s7,8(s3)
    2182:	015b07b3          	add	a5,s6,s5
    2186:	0017e793          	or	a5,a5,1
    218a:	00fba223          	sw	a5,4(s7)
    218e:	7fffe717          	auipc	a4,0x7fffe
    2192:	3d270713          	add	a4,a4,978 # 80000560 <__malloc_max_sbrked_mem>
    2196:	4314                	lw	a3,0(a4)
    2198:	00b6f363          	bgeu	a3,a1,219e <__neorv32_ram_size+0x19e>
    219c:	c30c                	sw	a1,0(a4)
    219e:	7fffe717          	auipc	a4,0x7fffe
    21a2:	3be70713          	add	a4,a4,958 # 8000055c <__malloc_max_total_mem>
    21a6:	4314                	lw	a3,0(a4)
    21a8:	00b6f363          	bgeu	a3,a1,21ae <__neorv32_ram_size+0x1ae>
    21ac:	c30c                	sw	a1,0(a4)
    21ae:	4c22                	lw	s8,8(sp)
    21b0:	845e                	mv	s0,s7
    21b2:	9bf1                	and	a5,a5,-4
    21b4:	40978733          	sub	a4,a5,s1
    21b8:	2897eb63          	bltu	a5,s1,244e <__neorv32_ram_size+0x44e>
    21bc:	47bd                	li	a5,15
    21be:	28e7d863          	bge	a5,a4,244e <__neorv32_ram_size+0x44e>
    21c2:	4a62                	lw	s4,24(sp)
    21c4:	4ad2                	lw	s5,20(sp)
    21c6:	4bb2                	lw	s7,12(sp)
    21c8:	4c92                	lw	s9,4(sp)
    21ca:	0014e793          	or	a5,s1,1
    21ce:	c05c                	sw	a5,4(s0)
    21d0:	94a2                	add	s1,s1,s0
    21d2:	0099a423          	sw	s1,8(s3)
    21d6:	00176713          	or	a4,a4,1
    21da:	854a                	mv	a0,s2
    21dc:	c0d8                	sw	a4,4(s1)
    21de:	2681                	jal	251e <__malloc_unlock>
    21e0:	50b2                	lw	ra,44(sp)
    21e2:	00840513          	add	a0,s0,8
    21e6:	5422                	lw	s0,40(sp)
    21e8:	4b42                	lw	s6,16(sp)
    21ea:	5492                	lw	s1,36(sp)
    21ec:	5902                	lw	s2,32(sp)
    21ee:	49f2                	lw	s3,28(sp)
    21f0:	6145                	add	sp,sp,48
    21f2:	8082                	ret
    21f4:	0049a503          	lw	a0,4(s3)
    21f8:	b549                	j	207a <__neorv32_ram_size+0x7a>
    21fa:	4410                	lw	a2,8(s0)
    21fc:	bb69                	j	1f96 <_malloc_r+0x42>
    21fe:	47c0                	lw	s0,12(a5)
    2200:	0589                	add	a1,a1,2
    2202:	e0878ee3          	beq	a5,s0,201e <__neorv32_ram_size+0x1e>
    2206:	b361                	j	1f8e <_malloc_r+0x3a>
    2208:	0097d713          	srl	a4,a5,0x9
    220c:	4691                	li	a3,4
    220e:	0ee6f263          	bgeu	a3,a4,22f2 <__neorv32_ram_size+0x2f2>
    2212:	46d1                	li	a3,20
    2214:	24e6e663          	bltu	a3,a4,2460 <__neorv32_ram_size+0x460>
    2218:	05c70613          	add	a2,a4,92
    221c:	05b70693          	add	a3,a4,91
    2220:	060e                	sll	a2,a2,0x3
    2222:	964e                	add	a2,a2,s3
    2224:	4218                	lw	a4,0(a2)
    2226:	1661                	add	a2,a2,-8
    2228:	00e61663          	bne	a2,a4,2234 <__neorv32_ram_size+0x234>
    222c:	a2f5                	j	2418 <__neorv32_ram_size+0x418>
    222e:	4718                	lw	a4,8(a4)
    2230:	00e60663          	beq	a2,a4,223c <__neorv32_ram_size+0x23c>
    2234:	4354                	lw	a3,4(a4)
    2236:	9af1                	and	a3,a3,-4
    2238:	fed7ebe3          	bltu	a5,a3,222e <__neorv32_ram_size+0x22e>
    223c:	4750                	lw	a2,12(a4)
    223e:	c450                	sw	a2,12(s0)
    2240:	c418                	sw	a4,8(s0)
    2242:	c600                	sw	s0,8(a2)
    2244:	c740                	sw	s0,12(a4)
    2246:	bd15                	j	207a <__neorv32_ram_size+0x7a>
    2248:	4751                	li	a4,20
    224a:	0cf77363          	bgeu	a4,a5,2310 <__neorv32_ram_size+0x310>
    224e:	05400713          	li	a4,84
    2252:	22f76363          	bltu	a4,a5,2478 <__neorv32_ram_size+0x478>
    2256:	00c4d793          	srl	a5,s1,0xc
    225a:	06f78593          	add	a1,a5,111 # fffff06f <__crt0_ram_last+0x7fffd070>
    225e:	06e78813          	add	a6,a5,110
    2262:	00359613          	sll	a2,a1,0x3
    2266:	b361                	j	1fee <_malloc_r+0x9a>
    2268:	0e05                	add	t3,t3,1
    226a:	003e7793          	and	a5,t3,3
    226e:	0521                	add	a0,a0,8
    2270:	cfc5                	beqz	a5,2328 <__neorv32_ram_size+0x328>
    2272:	455c                	lw	a5,12(a0)
    2274:	bd3d                	j	20b2 <__neorv32_ram_size+0xb2>
    2276:	4410                	lw	a2,8(s0)
    2278:	0014e593          	or	a1,s1,1
    227c:	c04c                	sw	a1,4(s0)
    227e:	c65c                	sw	a5,12(a2)
    2280:	c790                	sw	a2,8(a5)
    2282:	94a2                	add	s1,s1,s0
    2284:	0099aa23          	sw	s1,20(s3)
    2288:	0099a823          	sw	s1,16(s3)
    228c:	0016e793          	or	a5,a3,1
    2290:	0114a623          	sw	a7,12(s1) # fffe000c <__crt0_ram_last+0x7ffde00d>
    2294:	0114a423          	sw	a7,8(s1)
    2298:	c0dc                	sw	a5,4(s1)
    229a:	9722                	add	a4,a4,s0
    229c:	854a                	mv	a0,s2
    229e:	c314                	sw	a3,0(a4)
    22a0:	2cbd                	jal	251e <__malloc_unlock>
    22a2:	00840513          	add	a0,s0,8
    22a6:	b319                	j	1fac <_malloc_r+0x58>
    22a8:	97a2                	add	a5,a5,s0
    22aa:	43d8                	lw	a4,4(a5)
    22ac:	854a                	mv	a0,s2
    22ae:	00176713          	or	a4,a4,1
    22b2:	c3d8                	sw	a4,4(a5)
    22b4:	24ad                	jal	251e <__malloc_unlock>
    22b6:	00840513          	add	a0,s0,8
    22ba:	b9cd                	j	1fac <_malloc_r+0x58>
    22bc:	0034d593          	srl	a1,s1,0x3
    22c0:	00848793          	add	a5,s1,8
    22c4:	b95d                	j	1f7a <_malloc_r+0x26>
    22c6:	0014e693          	or	a3,s1,1
    22ca:	c054                	sw	a3,4(s0)
    22cc:	94a2                	add	s1,s1,s0
    22ce:	0099aa23          	sw	s1,20(s3)
    22d2:	0099a823          	sw	s1,16(s3)
    22d6:	00176693          	or	a3,a4,1
    22da:	0114a623          	sw	a7,12(s1)
    22de:	0114a423          	sw	a7,8(s1)
    22e2:	c0d4                	sw	a3,4(s1)
    22e4:	97a2                	add	a5,a5,s0
    22e6:	854a                	mv	a0,s2
    22e8:	c398                	sw	a4,0(a5)
    22ea:	2c15                	jal	251e <__malloc_unlock>
    22ec:	00840513          	add	a0,s0,8
    22f0:	b975                	j	1fac <_malloc_r+0x58>
    22f2:	0067d713          	srl	a4,a5,0x6
    22f6:	03970613          	add	a2,a4,57
    22fa:	03870693          	add	a3,a4,56
    22fe:	060e                	sll	a2,a2,0x3
    2300:	b70d                	j	2222 <__neorv32_ram_size+0x222>
    2302:	05340d63          	beq	s0,s3,235c <__neorv32_ram_size+0x35c>
    2306:	0089a403          	lw	s0,8(s3)
    230a:	4c22                	lw	s8,8(sp)
    230c:	405c                	lw	a5,4(s0)
    230e:	b555                	j	21b2 <__neorv32_ram_size+0x1b2>
    2310:	05c78593          	add	a1,a5,92
    2314:	05b78813          	add	a6,a5,91
    2318:	00359613          	sll	a2,a1,0x3
    231c:	b9c9                	j	1fee <_malloc_r+0x9a>
    231e:	00832783          	lw	a5,8(t1)
    2322:	15fd                	add	a1,a1,-1
    2324:	1e679563          	bne	a5,t1,250e <__neorv32_ram_size+0x50e>
    2328:	0035f793          	and	a5,a1,3
    232c:	1361                	add	t1,t1,-8
    232e:	fbe5                	bnez	a5,231e <__neorv32_ram_size+0x31e>
    2330:	0049a703          	lw	a4,4(s3)
    2334:	fff64793          	not	a5,a2
    2338:	8ff9                	and	a5,a5,a4
    233a:	00f9a223          	sw	a5,4(s3)
    233e:	0606                	sll	a2,a2,0x1
    2340:	dac7eee3          	bltu	a5,a2,20fc <__neorv32_ram_size+0xfc>
    2344:	da060ce3          	beqz	a2,20fc <__neorv32_ram_size+0xfc>
    2348:	00f67733          	and	a4,a2,a5
    234c:	e711                	bnez	a4,2358 <__neorv32_ram_size+0x358>
    234e:	0606                	sll	a2,a2,0x1
    2350:	00f67733          	and	a4,a2,a5
    2354:	0e11                	add	t3,t3,4
    2356:	df65                	beqz	a4,234e <__neorv32_ram_size+0x34e>
    2358:	85f2                	mv	a1,t3
    235a:	b3b1                	j	20a6 <__neorv32_ram_size+0xa6>
    235c:	7fffec17          	auipc	s8,0x7fffe
    2360:	284c0c13          	add	s8,s8,644 # 800005e0 <__malloc_current_mallinfo>
    2364:	000c2703          	lw	a4,0(s8)
    2368:	9756                	add	a4,a4,s5
    236a:	00ec2023          	sw	a4,0(s8)
    236e:	000ca683          	lw	a3,0(s9)
    2372:	57fd                	li	a5,-1
    2374:	12f68363          	beq	a3,a5,249a <__neorv32_ram_size+0x49a>
    2378:	414b87b3          	sub	a5,s7,s4
    237c:	97ba                	add	a5,a5,a4
    237e:	00fc2023          	sw	a5,0(s8)
    2382:	007bfc93          	and	s9,s7,7
    2386:	0a0c8163          	beqz	s9,2428 <__neorv32_ram_size+0x428>
    238a:	419b8bb3          	sub	s7,s7,s9
    238e:	6785                	lui	a5,0x1
    2390:	07a1                	add	a5,a5,8 # 1008 <neorv32_rte_debug_handler+0xc2>
    2392:	0ba1                	add	s7,s7,8
    2394:	419785b3          	sub	a1,a5,s9
    2398:	9ade                	add	s5,s5,s7
    239a:	415585b3          	sub	a1,a1,s5
    239e:	05d2                	sll	a1,a1,0x14
    23a0:	0145da13          	srl	s4,a1,0x14
    23a4:	85d2                	mv	a1,s4
    23a6:	854a                	mv	a0,s2
    23a8:	2241                	jal	2528 <_sbrk_r>
    23aa:	57fd                	li	a5,-1
    23ac:	12f50363          	beq	a0,a5,24d2 <__neorv32_ram_size+0x4d2>
    23b0:	41750533          	sub	a0,a0,s7
    23b4:	01450ab3          	add	s5,a0,s4
    23b8:	000c2703          	lw	a4,0(s8)
    23bc:	0179a423          	sw	s7,8(s3)
    23c0:	001ae793          	or	a5,s5,1
    23c4:	00ea05b3          	add	a1,s4,a4
    23c8:	00bc2023          	sw	a1,0(s8)
    23cc:	00fba223          	sw	a5,4(s7)
    23d0:	db340fe3          	beq	s0,s3,218e <__neorv32_ram_size+0x18e>
    23d4:	46bd                	li	a3,15
    23d6:	0766f863          	bgeu	a3,s6,2446 <__neorv32_ram_size+0x446>
    23da:	4058                	lw	a4,4(s0)
    23dc:	ff4b0793          	add	a5,s6,-12
    23e0:	9be1                	and	a5,a5,-8
    23e2:	8b05                	and	a4,a4,1
    23e4:	8f5d                	or	a4,a4,a5
    23e6:	c058                	sw	a4,4(s0)
    23e8:	4615                	li	a2,5
    23ea:	00f40733          	add	a4,s0,a5
    23ee:	c350                	sw	a2,4(a4)
    23f0:	c710                	sw	a2,8(a4)
    23f2:	00f6e563          	bltu	a3,a5,23fc <__neorv32_ram_size+0x3fc>
    23f6:	004ba783          	lw	a5,4(s7)
    23fa:	bb51                	j	218e <__neorv32_ram_size+0x18e>
    23fc:	00840593          	add	a1,s0,8
    2400:	854a                	mv	a0,s2
    2402:	923ff0ef          	jal	1d24 <_free_r>
    2406:	0089ab83          	lw	s7,8(s3)
    240a:	000c2583          	lw	a1,0(s8)
    240e:	004ba783          	lw	a5,4(s7)
    2412:	bbb5                	j	218e <__neorv32_ram_size+0x18e>
    2414:	0ac1                	add	s5,s5,16
    2416:	bb15                	j	214a <__neorv32_ram_size+0x14a>
    2418:	8689                	sra	a3,a3,0x2
    241a:	4785                	li	a5,1
    241c:	00d797b3          	sll	a5,a5,a3
    2420:	8d5d                	or	a0,a0,a5
    2422:	00a9a223          	sw	a0,4(s3)
    2426:	bd21                	j	223e <__neorv32_ram_size+0x23e>
    2428:	015b85b3          	add	a1,s7,s5
    242c:	40b005b3          	neg	a1,a1
    2430:	05d2                	sll	a1,a1,0x14
    2432:	0145da13          	srl	s4,a1,0x14
    2436:	85d2                	mv	a1,s4
    2438:	854a                	mv	a0,s2
    243a:	20fd                	jal	2528 <_sbrk_r>
    243c:	57fd                	li	a5,-1
    243e:	f6f519e3          	bne	a0,a5,23b0 <__neorv32_ram_size+0x3b0>
    2442:	4a01                	li	s4,0
    2444:	bf95                	j	23b8 <__neorv32_ram_size+0x3b8>
    2446:	4c22                	lw	s8,8(sp)
    2448:	4785                	li	a5,1
    244a:	00fba223          	sw	a5,4(s7)
    244e:	854a                	mv	a0,s2
    2450:	20f9                	jal	251e <__malloc_unlock>
    2452:	4501                	li	a0,0
    2454:	4a62                	lw	s4,24(sp)
    2456:	4ad2                	lw	s5,20(sp)
    2458:	4b42                	lw	s6,16(sp)
    245a:	4bb2                	lw	s7,12(sp)
    245c:	4c92                	lw	s9,4(sp)
    245e:	b6b9                	j	1fac <_malloc_r+0x58>
    2460:	05400693          	li	a3,84
    2464:	02e6ee63          	bltu	a3,a4,24a0 <__neorv32_ram_size+0x4a0>
    2468:	00c7d713          	srl	a4,a5,0xc
    246c:	06f70613          	add	a2,a4,111
    2470:	06e70693          	add	a3,a4,110
    2474:	060e                	sll	a2,a2,0x3
    2476:	b375                	j	2222 <__neorv32_ram_size+0x222>
    2478:	15400713          	li	a4,340
    247c:	02f76e63          	bltu	a4,a5,24b8 <__neorv32_ram_size+0x4b8>
    2480:	00f4d793          	srl	a5,s1,0xf
    2484:	07878593          	add	a1,a5,120
    2488:	07778813          	add	a6,a5,119
    248c:	00359613          	sll	a2,a1,0x3
    2490:	beb9                	j	1fee <_malloc_r+0x9a>
    2492:	0089a403          	lw	s0,8(s3)
    2496:	405c                	lw	a5,4(s0)
    2498:	bb29                	j	21b2 <__neorv32_ram_size+0x1b2>
    249a:	017ca023          	sw	s7,0(s9)
    249e:	b5d5                	j	2382 <__neorv32_ram_size+0x382>
    24a0:	15400693          	li	a3,340
    24a4:	02e6ed63          	bltu	a3,a4,24de <__neorv32_ram_size+0x4de>
    24a8:	00f7d713          	srl	a4,a5,0xf
    24ac:	07870613          	add	a2,a4,120
    24b0:	07770693          	add	a3,a4,119
    24b4:	060e                	sll	a2,a2,0x3
    24b6:	b3b5                	j	2222 <__neorv32_ram_size+0x222>
    24b8:	55400713          	li	a4,1364
    24bc:	02f76d63          	bltu	a4,a5,24f6 <__neorv32_ram_size+0x4f6>
    24c0:	0124d793          	srl	a5,s1,0x12
    24c4:	07d78593          	add	a1,a5,125
    24c8:	07c78813          	add	a6,a5,124
    24cc:	00359613          	sll	a2,a1,0x3
    24d0:	be39                	j	1fee <_malloc_r+0x9a>
    24d2:	1ce1                	add	s9,s9,-8
    24d4:	9ae6                	add	s5,s5,s9
    24d6:	417a8ab3          	sub	s5,s5,s7
    24da:	4a01                	li	s4,0
    24dc:	bdf1                	j	23b8 <__neorv32_ram_size+0x3b8>
    24de:	55400693          	li	a3,1364
    24e2:	02e6e163          	bltu	a3,a4,2504 <__neorv32_ram_size+0x504>
    24e6:	0127d713          	srl	a4,a5,0x12
    24ea:	07d70613          	add	a2,a4,125
    24ee:	07c70693          	add	a3,a4,124
    24f2:	060e                	sll	a2,a2,0x3
    24f4:	b33d                	j	2222 <__neorv32_ram_size+0x222>
    24f6:	3f800613          	li	a2,1016
    24fa:	07f00593          	li	a1,127
    24fe:	07e00813          	li	a6,126
    2502:	b4f5                	j	1fee <_malloc_r+0x9a>
    2504:	3f800613          	li	a2,1016
    2508:	07e00693          	li	a3,126
    250c:	bb19                	j	2222 <__neorv32_ram_size+0x222>
    250e:	0049a783          	lw	a5,4(s3)
    2512:	b535                	j	233e <__neorv32_ram_size+0x33e>

00002514 <__malloc_lock>:
    2514:	7fffe517          	auipc	a0,0x7fffe
    2518:	05450513          	add	a0,a0,84 # 80000568 <__lock___malloc_recursive_mutex>
    251c:	a091                	j	2560 <__retarget_lock_acquire_recursive>

0000251e <__malloc_unlock>:
    251e:	7fffe517          	auipc	a0,0x7fffe
    2522:	04a50513          	add	a0,a0,74 # 80000568 <__lock___malloc_recursive_mutex>
    2526:	a835                	j	2562 <__retarget_lock_release_recursive>

00002528 <_sbrk_r>:
    2528:	1141                	add	sp,sp,-16
    252a:	c422                	sw	s0,8(sp)
    252c:	842a                	mv	s0,a0
    252e:	852e                	mv	a0,a1
    2530:	7fffe797          	auipc	a5,0x7fffe
    2534:	0207a423          	sw	zero,40(a5) # 80000558 <errno>
    2538:	c606                	sw	ra,12(sp)
    253a:	eceff0ef          	jal	1c08 <_sbrk>
    253e:	57fd                	li	a5,-1
    2540:	00f50663          	beq	a0,a5,254c <_sbrk_r+0x24>
    2544:	40b2                	lw	ra,12(sp)
    2546:	4422                	lw	s0,8(sp)
    2548:	0141                	add	sp,sp,16
    254a:	8082                	ret
    254c:	7fffe797          	auipc	a5,0x7fffe
    2550:	00c7a783          	lw	a5,12(a5) # 80000558 <errno>
    2554:	dbe5                	beqz	a5,2544 <_sbrk_r+0x1c>
    2556:	40b2                	lw	ra,12(sp)
    2558:	c01c                	sw	a5,0(s0)
    255a:	4422                	lw	s0,8(sp)
    255c:	0141                	add	sp,sp,16
    255e:	8082                	ret

00002560 <__retarget_lock_acquire_recursive>:
    2560:	8082                	ret

00002562 <__retarget_lock_release_recursive>:
    2562:	8082                	ret

00002564 <memset>:
    2564:	433d                	li	t1,15
    2566:	872a                	mv	a4,a0
    2568:	02c37363          	bgeu	t1,a2,258e <memset+0x2a>
    256c:	00f77793          	and	a5,a4,15
    2570:	efbd                	bnez	a5,25ee <memset+0x8a>
    2572:	e5ad                	bnez	a1,25dc <memset+0x78>
    2574:	ff067693          	and	a3,a2,-16
    2578:	8a3d                	and	a2,a2,15
    257a:	96ba                	add	a3,a3,a4
    257c:	c30c                	sw	a1,0(a4)
    257e:	c34c                	sw	a1,4(a4)
    2580:	c70c                	sw	a1,8(a4)
    2582:	c74c                	sw	a1,12(a4)
    2584:	0741                	add	a4,a4,16
    2586:	fed76be3          	bltu	a4,a3,257c <memset+0x18>
    258a:	e211                	bnez	a2,258e <memset+0x2a>
    258c:	8082                	ret
    258e:	40c306b3          	sub	a3,t1,a2
    2592:	068a                	sll	a3,a3,0x2
    2594:	00000297          	auipc	t0,0x0
    2598:	9696                	add	a3,a3,t0
    259a:	00a68067          	jr	10(a3)
    259e:	00b70723          	sb	a1,14(a4)
    25a2:	00b706a3          	sb	a1,13(a4)
    25a6:	00b70623          	sb	a1,12(a4)
    25aa:	00b705a3          	sb	a1,11(a4)
    25ae:	00b70523          	sb	a1,10(a4)
    25b2:	00b704a3          	sb	a1,9(a4)
    25b6:	00b70423          	sb	a1,8(a4)
    25ba:	00b703a3          	sb	a1,7(a4)
    25be:	00b70323          	sb	a1,6(a4)
    25c2:	00b702a3          	sb	a1,5(a4)
    25c6:	00b70223          	sb	a1,4(a4)
    25ca:	00b701a3          	sb	a1,3(a4)
    25ce:	00b70123          	sb	a1,2(a4)
    25d2:	00b700a3          	sb	a1,1(a4)
    25d6:	00b70023          	sb	a1,0(a4)
    25da:	8082                	ret
    25dc:	0ff5f593          	zext.b	a1,a1
    25e0:	00859693          	sll	a3,a1,0x8
    25e4:	8dd5                	or	a1,a1,a3
    25e6:	01059693          	sll	a3,a1,0x10
    25ea:	8dd5                	or	a1,a1,a3
    25ec:	b761                	j	2574 <memset+0x10>
    25ee:	00279693          	sll	a3,a5,0x2
    25f2:	00000297          	auipc	t0,0x0
    25f6:	9696                	add	a3,a3,t0
    25f8:	8286                	mv	t0,ra
    25fa:	fa8680e7          	jalr	-88(a3)
    25fe:	8096                	mv	ra,t0
    2600:	17c1                	add	a5,a5,-16
    2602:	8f1d                	sub	a4,a4,a5
    2604:	963e                	add	a2,a2,a5
    2606:	f8c374e3          	bgeu	t1,a2,258e <memset+0x2a>
    260a:	b7a5                	j	2572 <memset+0xe>

0000260c <malloc>:
    260c:	85aa                	mv	a1,a0
    260e:	7fffe517          	auipc	a0,0x7fffe
    2612:	f1e52503          	lw	a0,-226(a0) # 8000052c <_impure_ptr>
    2616:	93fff06f          	j	1f54 <_malloc_r>

0000261a <free>:
    261a:	85aa                	mv	a1,a0
    261c:	7fffe517          	auipc	a0,0x7fffe
    2620:	f1052503          	lw	a0,-240(a0) # 8000052c <_impure_ptr>
    2624:	f00ff06f          	j	1d24 <_free_r>

00002628 <memcpy>:
    2628:	00a5c7b3          	xor	a5,a1,a0
    262c:	8b8d                	and	a5,a5,3
    262e:	00c508b3          	add	a7,a0,a2
    2632:	e7b1                	bnez	a5,267e <memcpy+0x56>
    2634:	478d                	li	a5,3
    2636:	04c7f463          	bgeu	a5,a2,267e <memcpy+0x56>
    263a:	00357793          	and	a5,a0,3
    263e:	872a                	mv	a4,a0
    2640:	ebb9                	bnez	a5,2696 <memcpy+0x6e>
    2642:	ffc8f613          	and	a2,a7,-4
    2646:	40e606b3          	sub	a3,a2,a4
    264a:	02000793          	li	a5,32
    264e:	06d7c863          	blt	a5,a3,26be <memcpy+0x96>
    2652:	86ae                	mv	a3,a1
    2654:	87ba                	mv	a5,a4
    2656:	02c77163          	bgeu	a4,a2,2678 <memcpy+0x50>
    265a:	0006a803          	lw	a6,0(a3)
    265e:	0791                	add	a5,a5,4
    2660:	0691                	add	a3,a3,4
    2662:	ff07ae23          	sw	a6,-4(a5)
    2666:	fec7eae3          	bltu	a5,a2,265a <memcpy+0x32>
    266a:	fff60793          	add	a5,a2,-1
    266e:	8f99                	sub	a5,a5,a4
    2670:	9bf1                	and	a5,a5,-4
    2672:	0791                	add	a5,a5,4
    2674:	973e                	add	a4,a4,a5
    2676:	95be                	add	a1,a1,a5
    2678:	01176663          	bltu	a4,a7,2684 <memcpy+0x5c>
    267c:	8082                	ret
    267e:	872a                	mv	a4,a0
    2680:	03157e63          	bgeu	a0,a7,26bc <memcpy+0x94>
    2684:	0005c783          	lbu	a5,0(a1)
    2688:	0705                	add	a4,a4,1
    268a:	0585                	add	a1,a1,1
    268c:	fef70fa3          	sb	a5,-1(a4)
    2690:	fee89ae3          	bne	a7,a4,2684 <memcpy+0x5c>
    2694:	8082                	ret
    2696:	0005c683          	lbu	a3,0(a1)
    269a:	0705                	add	a4,a4,1
    269c:	00377793          	and	a5,a4,3
    26a0:	fed70fa3          	sb	a3,-1(a4)
    26a4:	0585                	add	a1,a1,1
    26a6:	dfd1                	beqz	a5,2642 <memcpy+0x1a>
    26a8:	0005c683          	lbu	a3,0(a1)
    26ac:	0705                	add	a4,a4,1
    26ae:	00377793          	and	a5,a4,3
    26b2:	fed70fa3          	sb	a3,-1(a4)
    26b6:	0585                	add	a1,a1,1
    26b8:	fff9                	bnez	a5,2696 <memcpy+0x6e>
    26ba:	b761                	j	2642 <memcpy+0x1a>
    26bc:	8082                	ret
    26be:	1141                	add	sp,sp,-16
    26c0:	c622                	sw	s0,12(sp)
    26c2:	02000413          	li	s0,32
    26c6:	0005a383          	lw	t2,0(a1)
    26ca:	0045a283          	lw	t0,4(a1)
    26ce:	0085af83          	lw	t6,8(a1)
    26d2:	00c5af03          	lw	t5,12(a1)
    26d6:	0105ae83          	lw	t4,16(a1)
    26da:	0145ae03          	lw	t3,20(a1)
    26de:	0185a303          	lw	t1,24(a1)
    26e2:	01c5a803          	lw	a6,28(a1)
    26e6:	5194                	lw	a3,32(a1)
    26e8:	02470713          	add	a4,a4,36
    26ec:	40e607b3          	sub	a5,a2,a4
    26f0:	fc772e23          	sw	t2,-36(a4)
    26f4:	fe572023          	sw	t0,-32(a4)
    26f8:	fff72223          	sw	t6,-28(a4)
    26fc:	ffe72423          	sw	t5,-24(a4)
    2700:	ffd72623          	sw	t4,-20(a4)
    2704:	ffc72823          	sw	t3,-16(a4)
    2708:	fe672a23          	sw	t1,-12(a4)
    270c:	ff072c23          	sw	a6,-8(a4)
    2710:	fed72e23          	sw	a3,-4(a4)
    2714:	02458593          	add	a1,a1,36
    2718:	faf447e3          	blt	s0,a5,26c6 <memcpy+0x9e>
    271c:	86ae                	mv	a3,a1
    271e:	87ba                	mv	a5,a4
    2720:	02c77163          	bgeu	a4,a2,2742 <memcpy+0x11a>
    2724:	0006a803          	lw	a6,0(a3)
    2728:	0791                	add	a5,a5,4
    272a:	0691                	add	a3,a3,4
    272c:	ff07ae23          	sw	a6,-4(a5)
    2730:	fec7eae3          	bltu	a5,a2,2724 <memcpy+0xfc>
    2734:	fff60793          	add	a5,a2,-1
    2738:	8f99                	sub	a5,a5,a4
    273a:	9bf1                	and	a5,a5,-4
    273c:	0791                	add	a5,a5,4
    273e:	973e                	add	a4,a4,a5
    2740:	95be                	add	a1,a1,a5
    2742:	01176563          	bltu	a4,a7,274c <memcpy+0x124>
    2746:	4432                	lw	s0,12(sp)
    2748:	0141                	add	sp,sp,16
    274a:	8082                	ret
    274c:	0005c783          	lbu	a5,0(a1)
    2750:	0705                	add	a4,a4,1
    2752:	0585                	add	a1,a1,1
    2754:	fef70fa3          	sb	a5,-1(a4)
    2758:	fee887e3          	beq	a7,a4,2746 <memcpy+0x11e>
    275c:	0005c783          	lbu	a5,0(a1)
    2760:	0705                	add	a4,a4,1
    2762:	0585                	add	a1,a1,1
    2764:	fef70fa3          	sb	a5,-1(a4)
    2768:	fee892e3          	bne	a7,a4,274c <memcpy+0x124>
    276c:	bfe9                	j	2746 <memcpy+0x11e>

0000276e <__udivdi3>:
    276e:	8832                	mv	a6,a2
    2770:	88aa                	mv	a7,a0
    2772:	872e                	mv	a4,a1
    2774:	ead5                	bnez	a3,2828 <__udivdi3+0xba>
    2776:	0ec5ff63          	bgeu	a1,a2,2874 <__udivdi3+0x106>
    277a:	67c1                	lui	a5,0x10
    277c:	18f66c63          	bltu	a2,a5,2914 <__udivdi3+0x1a6>
    2780:	010007b7          	lui	a5,0x1000
    2784:	46e1                	li	a3,24
    2786:	00f67363          	bgeu	a2,a5,278c <__udivdi3+0x1e>
    278a:	46c1                	li	a3,16
    278c:	00d65333          	srl	t1,a2,a3
    2790:	00001797          	auipc	a5,0x1
    2794:	ab478793          	add	a5,a5,-1356 # 3244 <__clz_tab>
    2798:	979a                	add	a5,a5,t1
    279a:	0007c783          	lbu	a5,0(a5)
    279e:	02000313          	li	t1,32
    27a2:	97b6                	add	a5,a5,a3
    27a4:	40f306b3          	sub	a3,t1,a5
    27a8:	00f30b63          	beq	t1,a5,27be <__udivdi3+0x50>
    27ac:	00d59733          	sll	a4,a1,a3
    27b0:	00f557b3          	srl	a5,a0,a5
    27b4:	00d61833          	sll	a6,a2,a3
    27b8:	8f5d                	or	a4,a4,a5
    27ba:	00d518b3          	sll	a7,a0,a3
    27be:	01085613          	srl	a2,a6,0x10
    27c2:	02c75533          	divu	a0,a4,a2
    27c6:	01081693          	sll	a3,a6,0x10
    27ca:	82c1                	srl	a3,a3,0x10
    27cc:	0108d793          	srl	a5,a7,0x10
    27d0:	02c77733          	remu	a4,a4,a2
    27d4:	02a685b3          	mul	a1,a3,a0
    27d8:	0742                	sll	a4,a4,0x10
    27da:	8fd9                	or	a5,a5,a4
    27dc:	00b7fa63          	bgeu	a5,a1,27f0 <__udivdi3+0x82>
    27e0:	97c2                	add	a5,a5,a6
    27e2:	fff50713          	add	a4,a0,-1
    27e6:	0107e463          	bltu	a5,a6,27ee <__udivdi3+0x80>
    27ea:	30b7ef63          	bltu	a5,a1,2b08 <__udivdi3+0x39a>
    27ee:	853a                	mv	a0,a4
    27f0:	8f8d                	sub	a5,a5,a1
    27f2:	02c7d733          	divu	a4,a5,a2
    27f6:	08c2                	sll	a7,a7,0x10
    27f8:	0108d893          	srl	a7,a7,0x10
    27fc:	02c7f7b3          	remu	a5,a5,a2
    2800:	02e686b3          	mul	a3,a3,a4
    2804:	07c2                	sll	a5,a5,0x10
    2806:	00f8e8b3          	or	a7,a7,a5
    280a:	00d8fb63          	bgeu	a7,a3,2820 <__udivdi3+0xb2>
    280e:	98c2                	add	a7,a7,a6
    2810:	fff70793          	add	a5,a4,-1
    2814:	0108e563          	bltu	a7,a6,281e <__udivdi3+0xb0>
    2818:	1779                	add	a4,a4,-2
    281a:	00d8e363          	bltu	a7,a3,2820 <__udivdi3+0xb2>
    281e:	873e                	mv	a4,a5
    2820:	0542                	sll	a0,a0,0x10
    2822:	8d59                	or	a0,a0,a4
    2824:	4581                	li	a1,0
    2826:	8082                	ret
    2828:	00d5f563          	bgeu	a1,a3,2832 <__udivdi3+0xc4>
    282c:	4581                	li	a1,0
    282e:	4501                	li	a0,0
    2830:	8082                	ret
    2832:	67c1                	lui	a5,0x10
    2834:	18f6e863          	bltu	a3,a5,29c4 <__udivdi3+0x256>
    2838:	01000737          	lui	a4,0x1000
    283c:	47e1                	li	a5,24
    283e:	00e6f363          	bgeu	a3,a4,2844 <__udivdi3+0xd6>
    2842:	47c1                	li	a5,16
    2844:	00f6d833          	srl	a6,a3,a5
    2848:	00001717          	auipc	a4,0x1
    284c:	9fc70713          	add	a4,a4,-1540 # 3244 <__clz_tab>
    2850:	9742                	add	a4,a4,a6
    2852:	00074703          	lbu	a4,0(a4)
    2856:	02000893          	li	a7,32
    285a:	973e                	add	a4,a4,a5
    285c:	40e88833          	sub	a6,a7,a4
    2860:	18e89763          	bne	a7,a4,29ee <__udivdi3+0x280>
    2864:	28b6e463          	bltu	a3,a1,2aec <__udivdi3+0x37e>
    2868:	00c53533          	sltu	a0,a0,a2
    286c:	00153513          	seqz	a0,a0
    2870:	4581                	li	a1,0
    2872:	8082                	ret
    2874:	c655                	beqz	a2,2920 <__udivdi3+0x1b2>
    2876:	67c1                	lui	a5,0x10
    2878:	26f67263          	bgeu	a2,a5,2adc <__udivdi3+0x36e>
    287c:	10063713          	sltiu	a4,a2,256
    2880:	00173713          	seqz	a4,a4
    2884:	070e                	sll	a4,a4,0x3
    2886:	00e656b3          	srl	a3,a2,a4
    288a:	00001797          	auipc	a5,0x1
    288e:	9ba78793          	add	a5,a5,-1606 # 3244 <__clz_tab>
    2892:	97b6                	add	a5,a5,a3
    2894:	0007c783          	lbu	a5,0(a5)
    2898:	02000693          	li	a3,32
    289c:	97ba                	add	a5,a5,a4
    289e:	40f68eb3          	sub	t4,a3,a5
    28a2:	08f69f63          	bne	a3,a5,2940 <__udivdi3+0x1d2>
    28a6:	40c587b3          	sub	a5,a1,a2
    28aa:	01065693          	srl	a3,a2,0x10
    28ae:	0642                	sll	a2,a2,0x10
    28b0:	8241                	srl	a2,a2,0x10
    28b2:	4585                	li	a1,1
    28b4:	02d7d533          	divu	a0,a5,a3
    28b8:	0108d713          	srl	a4,a7,0x10
    28bc:	02d7f7b3          	remu	a5,a5,a3
    28c0:	02c50333          	mul	t1,a0,a2
    28c4:	07c2                	sll	a5,a5,0x10
    28c6:	8fd9                	or	a5,a5,a4
    28c8:	0067fa63          	bgeu	a5,t1,28dc <__udivdi3+0x16e>
    28cc:	97c2                	add	a5,a5,a6
    28ce:	fff50713          	add	a4,a0,-1
    28d2:	0107e463          	bltu	a5,a6,28da <__udivdi3+0x16c>
    28d6:	2267e663          	bltu	a5,t1,2b02 <__udivdi3+0x394>
    28da:	853a                	mv	a0,a4
    28dc:	406787b3          	sub	a5,a5,t1
    28e0:	02d7d733          	divu	a4,a5,a3
    28e4:	08c2                	sll	a7,a7,0x10
    28e6:	0108d893          	srl	a7,a7,0x10
    28ea:	02d7f7b3          	remu	a5,a5,a3
    28ee:	02c70633          	mul	a2,a4,a2
    28f2:	07c2                	sll	a5,a5,0x10
    28f4:	00f8e8b3          	or	a7,a7,a5
    28f8:	00c8fb63          	bgeu	a7,a2,290e <__udivdi3+0x1a0>
    28fc:	98c2                	add	a7,a7,a6
    28fe:	fff70793          	add	a5,a4,-1
    2902:	0108e563          	bltu	a7,a6,290c <__udivdi3+0x19e>
    2906:	1779                	add	a4,a4,-2
    2908:	00c8e363          	bltu	a7,a2,290e <__udivdi3+0x1a0>
    290c:	873e                	mv	a4,a5
    290e:	0542                	sll	a0,a0,0x10
    2910:	8d59                	or	a0,a0,a4
    2912:	8082                	ret
    2914:	10063693          	sltiu	a3,a2,256
    2918:	0016b693          	seqz	a3,a3
    291c:	068e                	sll	a3,a3,0x3
    291e:	b5bd                	j	278c <__udivdi3+0x1e>
    2920:	4681                	li	a3,0
    2922:	00001797          	auipc	a5,0x1
    2926:	92278793          	add	a5,a5,-1758 # 3244 <__clz_tab>
    292a:	97b6                	add	a5,a5,a3
    292c:	0007c783          	lbu	a5,0(a5)
    2930:	4701                	li	a4,0
    2932:	02000693          	li	a3,32
    2936:	97ba                	add	a5,a5,a4
    2938:	40f68eb3          	sub	t4,a3,a5
    293c:	f6f685e3          	beq	a3,a5,28a6 <__udivdi3+0x138>
    2940:	01d61833          	sll	a6,a2,t4
    2944:	00f5d333          	srl	t1,a1,a5
    2948:	01085693          	srl	a3,a6,0x10
    294c:	02d35e33          	divu	t3,t1,a3
    2950:	01081613          	sll	a2,a6,0x10
    2954:	01d595b3          	sll	a1,a1,t4
    2958:	8241                	srl	a2,a2,0x10
    295a:	00f557b3          	srl	a5,a0,a5
    295e:	8fcd                	or	a5,a5,a1
    2960:	0107d713          	srl	a4,a5,0x10
    2964:	01d518b3          	sll	a7,a0,t4
    2968:	02d37333          	remu	t1,t1,a3
    296c:	03c605b3          	mul	a1,a2,t3
    2970:	0342                	sll	t1,t1,0x10
    2972:	00676733          	or	a4,a4,t1
    2976:	00b77b63          	bgeu	a4,a1,298c <__udivdi3+0x21e>
    297a:	9742                	add	a4,a4,a6
    297c:	fffe0513          	add	a0,t3,-1
    2980:	17076d63          	bltu	a4,a6,2afa <__udivdi3+0x38c>
    2984:	16b77b63          	bgeu	a4,a1,2afa <__udivdi3+0x38c>
    2988:	1e79                	add	t3,t3,-2
    298a:	9742                	add	a4,a4,a6
    298c:	8f0d                	sub	a4,a4,a1
    298e:	02d75533          	divu	a0,a4,a3
    2992:	07c2                	sll	a5,a5,0x10
    2994:	83c1                	srl	a5,a5,0x10
    2996:	02d77733          	remu	a4,a4,a3
    299a:	02a60333          	mul	t1,a2,a0
    299e:	0742                	sll	a4,a4,0x10
    29a0:	8fd9                	or	a5,a5,a4
    29a2:	0067fb63          	bgeu	a5,t1,29b8 <__udivdi3+0x24a>
    29a6:	97c2                	add	a5,a5,a6
    29a8:	fff50713          	add	a4,a0,-1
    29ac:	1507e363          	bltu	a5,a6,2af2 <__udivdi3+0x384>
    29b0:	1467f163          	bgeu	a5,t1,2af2 <__udivdi3+0x384>
    29b4:	1579                	add	a0,a0,-2
    29b6:	97c2                	add	a5,a5,a6
    29b8:	010e1593          	sll	a1,t3,0x10
    29bc:	406787b3          	sub	a5,a5,t1
    29c0:	8dc9                	or	a1,a1,a0
    29c2:	bdcd                	j	28b4 <__udivdi3+0x146>
    29c4:	1006b793          	sltiu	a5,a3,256
    29c8:	0017b793          	seqz	a5,a5
    29cc:	078e                	sll	a5,a5,0x3
    29ce:	00f6d833          	srl	a6,a3,a5
    29d2:	00001717          	auipc	a4,0x1
    29d6:	87270713          	add	a4,a4,-1934 # 3244 <__clz_tab>
    29da:	9742                	add	a4,a4,a6
    29dc:	00074703          	lbu	a4,0(a4)
    29e0:	02000893          	li	a7,32
    29e4:	973e                	add	a4,a4,a5
    29e6:	40e88833          	sub	a6,a7,a4
    29ea:	e6e88de3          	beq	a7,a4,2864 <__udivdi3+0xf6>
    29ee:	00e65e33          	srl	t3,a2,a4
    29f2:	010696b3          	sll	a3,a3,a6
    29f6:	00de6e33          	or	t3,t3,a3
    29fa:	00e5d8b3          	srl	a7,a1,a4
    29fe:	010e5e93          	srl	t4,t3,0x10
    2a02:	03d8d7b3          	divu	a5,a7,t4
    2a06:	010e1313          	sll	t1,t3,0x10
    2a0a:	010595b3          	sll	a1,a1,a6
    2a0e:	01035313          	srl	t1,t1,0x10
    2a12:	00e55733          	srl	a4,a0,a4
    2a16:	8f4d                	or	a4,a4,a1
    2a18:	01075693          	srl	a3,a4,0x10
    2a1c:	01061633          	sll	a2,a2,a6
    2a20:	03d8f8b3          	remu	a7,a7,t4
    2a24:	02f305b3          	mul	a1,t1,a5
    2a28:	08c2                	sll	a7,a7,0x10
    2a2a:	0116e6b3          	or	a3,a3,a7
    2a2e:	00b6fb63          	bgeu	a3,a1,2a44 <__udivdi3+0x2d6>
    2a32:	96f2                	add	a3,a3,t3
    2a34:	fff78893          	add	a7,a5,-1
    2a38:	0dc6e363          	bltu	a3,t3,2afe <__udivdi3+0x390>
    2a3c:	0cb6f163          	bgeu	a3,a1,2afe <__udivdi3+0x390>
    2a40:	17f9                	add	a5,a5,-2
    2a42:	96f2                	add	a3,a3,t3
    2a44:	8e8d                	sub	a3,a3,a1
    2a46:	03d6d5b3          	divu	a1,a3,t4
    2a4a:	0742                	sll	a4,a4,0x10
    2a4c:	8341                	srl	a4,a4,0x10
    2a4e:	03d6f6b3          	remu	a3,a3,t4
    2a52:	02b308b3          	mul	a7,t1,a1
    2a56:	06c2                	sll	a3,a3,0x10
    2a58:	8f55                	or	a4,a4,a3
    2a5a:	01177b63          	bgeu	a4,a7,2a70 <__udivdi3+0x302>
    2a5e:	9772                	add	a4,a4,t3
    2a60:	fff58693          	add	a3,a1,-1
    2a64:	09c76963          	bltu	a4,t3,2af6 <__udivdi3+0x388>
    2a68:	09177763          	bgeu	a4,a7,2af6 <__udivdi3+0x388>
    2a6c:	15f9                	add	a1,a1,-2
    2a6e:	9772                	add	a4,a4,t3
    2a70:	07c2                	sll	a5,a5,0x10
    2a72:	6ec1                	lui	t4,0x10
    2a74:	8fcd                	or	a5,a5,a1
    2a76:	fffe8693          	add	a3,t4,-1 # ffff <neorv32_uart.c.2d4a2ccb+0x8b71>
    2a7a:	00d7f5b3          	and	a1,a5,a3
    2a7e:	0107d313          	srl	t1,a5,0x10
    2a82:	8ef1                	and	a3,a3,a2
    2a84:	8241                	srl	a2,a2,0x10
    2a86:	02d58e33          	mul	t3,a1,a3
    2a8a:	41170733          	sub	a4,a4,a7
    2a8e:	02d306b3          	mul	a3,t1,a3
    2a92:	010e5893          	srl	a7,t3,0x10
    2a96:	02c585b3          	mul	a1,a1,a2
    2a9a:	95b6                	add	a1,a1,a3
    2a9c:	95c6                	add	a1,a1,a7
    2a9e:	02c30333          	mul	t1,t1,a2
    2aa2:	00d5f363          	bgeu	a1,a3,2aa8 <__udivdi3+0x33a>
    2aa6:	9376                	add	t1,t1,t4
    2aa8:	0105d693          	srl	a3,a1,0x10
    2aac:	969a                	add	a3,a3,t1
    2aae:	02d76363          	bltu	a4,a3,2ad4 <__udivdi3+0x366>
    2ab2:	00d70563          	beq	a4,a3,2abc <__udivdi3+0x34e>
    2ab6:	853e                	mv	a0,a5
    2ab8:	4581                	li	a1,0
    2aba:	8082                	ret
    2abc:	66c1                	lui	a3,0x10
    2abe:	16fd                	add	a3,a3,-1 # ffff <neorv32_uart.c.2d4a2ccb+0x8b71>
    2ac0:	00d5f733          	and	a4,a1,a3
    2ac4:	0742                	sll	a4,a4,0x10
    2ac6:	00de7e33          	and	t3,t3,a3
    2aca:	01051533          	sll	a0,a0,a6
    2ace:	9772                	add	a4,a4,t3
    2ad0:	fee573e3          	bgeu	a0,a4,2ab6 <__udivdi3+0x348>
    2ad4:	fff78513          	add	a0,a5,-1
    2ad8:	4581                	li	a1,0
    2ada:	8082                	ret
    2adc:	010007b7          	lui	a5,0x1000
    2ae0:	02f67763          	bgeu	a2,a5,2b0e <__udivdi3+0x3a0>
    2ae4:	01065693          	srl	a3,a2,0x10
    2ae8:	4741                	li	a4,16
    2aea:	b345                	j	288a <__udivdi3+0x11c>
    2aec:	4581                	li	a1,0
    2aee:	4505                	li	a0,1
    2af0:	8082                	ret
    2af2:	853a                	mv	a0,a4
    2af4:	b5d1                	j	29b8 <__udivdi3+0x24a>
    2af6:	85b6                	mv	a1,a3
    2af8:	bfa5                	j	2a70 <__udivdi3+0x302>
    2afa:	8e2a                	mv	t3,a0
    2afc:	bd41                	j	298c <__udivdi3+0x21e>
    2afe:	87c6                	mv	a5,a7
    2b00:	b791                	j	2a44 <__udivdi3+0x2d6>
    2b02:	1579                	add	a0,a0,-2
    2b04:	97c2                	add	a5,a5,a6
    2b06:	bbd9                	j	28dc <__udivdi3+0x16e>
    2b08:	1579                	add	a0,a0,-2
    2b0a:	97c2                	add	a5,a5,a6
    2b0c:	b1d5                	j	27f0 <__udivdi3+0x82>
    2b0e:	01865693          	srl	a3,a2,0x18
    2b12:	4761                	li	a4,24
    2b14:	bb9d                	j	288a <__udivdi3+0x11c>
    2b16:	0000                	unimp
