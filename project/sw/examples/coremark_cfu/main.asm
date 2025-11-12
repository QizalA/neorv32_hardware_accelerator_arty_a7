
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
      1a:	80028293          	add	t0,t0,-2048 # 1800 <printf+0x27a>
      1e:	30029073          	csrw	mstatus,t0
      22:	00000317          	auipc	t1,0x0
      26:	13630313          	add	t1,t1,310 # 158 <__crt0_trap>
      2a:	30531073          	csrw	mtvec,t1
      2e:	30401073          	csrw	mie,zero
      32:	00005397          	auipc	t2,0x5
      36:	cea38393          	add	t2,t2,-790 # 4d1c <__crt0_copy_data_src_begin>
      3a:	80000417          	auipc	s0,0x80000
      3e:	fc640413          	add	s0,s0,-58 # 80000000 <__malloc_av_>
      42:	80000497          	auipc	s1,0x80000
      46:	50a48493          	add	s1,s1,1290 # 8000054c <__crt0_copy_data_dst_end>
      4a:	80000517          	auipc	a0,0x80000
      4e:	50650513          	add	a0,a0,1286 # 80000550 <num_hpm_cnts_global>
      52:	80001597          	auipc	a1,0x80001
      56:	ee658593          	add	a1,a1,-282 # 80000f38 <__crt0_bss_end>
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
      d0:	00004417          	auipc	s0,0x4
      d4:	3f440413          	add	s0,s0,1012 # 44c4 <__fini_array_end>
      d8:	00004497          	auipc	s1,0x4
      dc:	3ec48493          	add	s1,s1,1004 # 44c4 <__fini_array_end>

000000e0 <__crt0_constructors>:
      e0:	00945863          	bge	s0,s1,f0 <__crt0_constructors_end>
      e4:	00042083          	lw	ra,0(s0)
      e8:	000080e7          	jalr	ra
      ec:	0411                	add	s0,s0,4
      ee:	bfcd                	j	e0 <__crt0_constructors>

000000f0 <__crt0_constructors_end>:
      f0:	00000617          	auipc	a2,0x0
      f4:	5ae60613          	add	a2,a2,1454 # 69e <main>

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
     12e:	00004417          	auipc	s0,0x4
     132:	39640413          	add	s0,s0,918 # 44c4 <__fini_array_end>
     136:	00004497          	auipc	s1,0x4
     13a:	38e48493          	add	s1,s1,910 # 44c4 <__fini_array_end>

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

0000018a <cmp_idx>:
        Can be used by mergesort.
*/
ee_s32
cmp_idx(list_data *a, list_data *b, core_results *res)
{
    if (res == NULL)
     18a:	e60d                	bnez	a2,1b4 <cmp_idx+0x2a>
    {
        a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
     18c:	00051783          	lh	a5,0(a0)
     190:	f007f713          	and	a4,a5,-256
     194:	07c2                	sll	a5,a5,0x10
     196:	83c1                	srl	a5,a5,0x10
     198:	83a1                	srl	a5,a5,0x8
     19a:	8fd9                	or	a5,a5,a4
     19c:	00f51023          	sh	a5,0(a0)
        b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
     1a0:	00059783          	lh	a5,0(a1)
     1a4:	f007f713          	and	a4,a5,-256
     1a8:	07c2                	sll	a5,a5,0x10
     1aa:	83c1                	srl	a5,a5,0x10
     1ac:	83a1                	srl	a5,a5,0x8
     1ae:	8fd9                	or	a5,a5,a4
     1b0:	00f59023          	sh	a5,0(a1)
    }
    return a->idx - b->idx;
     1b4:	00251503          	lh	a0,2(a0)
     1b8:	00259783          	lh	a5,2(a1)
}
     1bc:	8d1d                	sub	a0,a0,a5
     1be:	8082                	ret

000001c0 <calc_func>:
{
     1c0:	1101                	add	sp,sp,-32
     1c2:	ca26                	sw	s1,20(sp)
    ee_s16 data = *pdata;
     1c4:	00051483          	lh	s1,0(a0)
{
     1c8:	ce06                	sw	ra,28(sp)
     1ca:	cc22                	sw	s0,24(sp)
          & 1;  /* bit 7 indicates if the function result has been cached */
     1cc:	4074d793          	sra	a5,s1,0x7
{
     1d0:	c84a                	sw	s2,16(sp)
     1d2:	c64e                	sw	s3,12(sp)
    if (optype) /* if cached, use cache */
     1d4:	8b85                	and	a5,a5,1
     1d6:	cb91                	beqz	a5,1ea <calc_func+0x2a>
        return (data & 0x007f);
     1d8:	07f4f513          	and	a0,s1,127
}
     1dc:	40f2                	lw	ra,28(sp)
     1de:	4462                	lw	s0,24(sp)
     1e0:	44d2                	lw	s1,20(sp)
     1e2:	4942                	lw	s2,16(sp)
     1e4:	49b2                	lw	s3,12(sp)
     1e6:	6105                	add	sp,sp,32
     1e8:	8082                	ret
               & 0xf);       /* bits 3-6 is specific data for the operation */
     1ea:	4034d693          	sra	a3,s1,0x3
     1ee:	47c5                	li	a5,17
        ee_s16 dtype
     1f0:	8abd                	and	a3,a3,15
     1f2:	02f686b3          	mul	a3,a3,a5
        ee_s16 flag = data & 0x7; /* bits 0-2 is type of function to perform */
     1f6:	0074f613          	and	a2,s1,7
                retval = core_bench_state(res->size,
     1fa:	0385d783          	lhu	a5,56(a1)
     1fe:	89aa                	mv	s3,a0
     200:	842e                	mv	s0,a1
        dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
     202:	01069713          	sll	a4,a3,0x10
     206:	8741                	sra	a4,a4,0x10
        switch (flag)
     208:	c60d                	beqz	a2,232 <calc_func+0x72>
     20a:	4685                	li	a3,1
     20c:	8926                	mv	s2,s1
     20e:	04d61963          	bne	a2,a3,260 <calc_func+0xa0>
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     212:	863e                	mv	a2,a5
     214:	85ba                	mv	a1,a4
     216:	02840513          	add	a0,s0,40
     21a:	451000ef          	jal	e6a <core_bench_matrix>
                if (res->crcmatrix == 0)
     21e:	03c45783          	lhu	a5,60(s0)
                retval = core_bench_matrix(&(res->mat), dtype, res->crc);
     222:	01051913          	sll	s2,a0,0x10
     226:	41095913          	sra	s2,s2,0x10
                if (res->crcmatrix == 0)
     22a:	eb9d                	bnez	a5,260 <calc_func+0xa0>
                    res->crcmatrix = retval;
     22c:	02a41e23          	sh	a0,60(s0)
     230:	a805                	j	260 <calc_func+0xa0>
                if (dtype < 0x22) /* set min period for bit corruption */
     232:	02100613          	li	a2,33
     236:	00d66463          	bltu	a2,a3,23e <calc_func+0x7e>
                    dtype = 0x22;
     23a:	02200713          	li	a4,34
                retval = core_bench_state(res->size,
     23e:	00241683          	lh	a3,2(s0)
     242:	00041603          	lh	a2,0(s0)
     246:	484c                	lw	a1,20(s0)
     248:	4c08                	lw	a0,24(s0)
     24a:	7ad000ef          	jal	11f6 <core_bench_state>
                if (res->crcstate == 0)
     24e:	03e45783          	lhu	a5,62(s0)
                retval = core_bench_state(res->size,
     252:	01051913          	sll	s2,a0,0x10
     256:	41095913          	sra	s2,s2,0x10
                if (res->crcstate == 0)
     25a:	e399                	bnez	a5,260 <calc_func+0xa0>
                    res->crcstate = retval;
     25c:	02a41f23          	sh	a0,62(s0)
        res->crc = crcu16(retval, res->crc);
     260:	03845583          	lhu	a1,56(s0)
     264:	01091513          	sll	a0,s2,0x10
     268:	8141                	srl	a0,a0,0x10
     26a:	0fe010ef          	jal	1368 <crcu16>
     26e:	02a41c23          	sh	a0,56(s0)
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     272:	f004f493          	and	s1,s1,-256
        retval &= 0x007f;
     276:	07f97513          	and	a0,s2,127
        *pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
     27a:	8cc9                	or	s1,s1,a0
     27c:	0804e493          	or	s1,s1,128
     280:	00999023          	sh	s1,0(s3)
        return retval;
     284:	bfa1                	j	1dc <calc_func+0x1c>

00000286 <cmp_complex>:
{
     286:	1101                	add	sp,sp,-32
     288:	ca26                	sw	s1,20(sp)
     28a:	84ae                	mv	s1,a1
     28c:	85b2                	mv	a1,a2
     28e:	ce06                	sw	ra,28(sp)
     290:	cc22                	sw	s0,24(sp)
    ee_s16 val1 = calc_func(&(a->data16), res);
     292:	c632                	sw	a2,12(sp)
     294:	3735                	jal	1c0 <calc_func>
    ee_s16 val2 = calc_func(&(b->data16), res);
     296:	45b2                	lw	a1,12(sp)
    ee_s16 val1 = calc_func(&(a->data16), res);
     298:	842a                	mv	s0,a0
    ee_s16 val2 = calc_func(&(b->data16), res);
     29a:	8526                	mv	a0,s1
     29c:	3715                	jal	1c0 <calc_func>
}
     29e:	40f2                	lw	ra,28(sp)
     2a0:	40a40533          	sub	a0,s0,a0
     2a4:	4462                	lw	s0,24(sp)
     2a6:	44d2                	lw	s1,20(sp)
     2a8:	6105                	add	sp,sp,32
     2aa:	8082                	ret

000002ac <core_list_insert_new>:
                     list_data * info,
                     list_head **memblock,
                     list_data **datablock,
                     list_head * memblock_end,
                     list_data * datablock_end)
{
     2ac:	882a                	mv	a6,a0
    list_head *newitem;

    if ((*memblock + 1) >= memblock_end)
     2ae:	4208                	lw	a0,0(a2)
     2b0:	00850893          	add	a7,a0,8
     2b4:	02e8fc63          	bgeu	a7,a4,2ec <core_list_insert_new+0x40>
        return NULL;
    if ((*datablock + 1) >= datablock_end)
     2b8:	4298                	lw	a4,0(a3)
     2ba:	00470313          	add	t1,a4,4
     2be:	02f37763          	bgeu	t1,a5,2ec <core_list_insert_new+0x40>
        return NULL;

    newitem = *memblock;
    (*memblock)++;
     2c2:	01162023          	sw	a7,0(a2)
    newitem->next      = insert_point->next;
     2c6:	00082783          	lw	a5,0(a6)
     2ca:	c11c                	sw	a5,0(a0)
    insert_point->next = newitem;
     2cc:	00a82023          	sw	a0,0(a6)

    newitem->info = *datablock;
     2d0:	c158                	sw	a4,4(a0)
    (*datablock)++;
     2d2:	429c                	lw	a5,0(a3)
    to->data16 = from->data16;
     2d4:	00059703          	lh	a4,0(a1)
    (*datablock)++;
     2d8:	0791                	add	a5,a5,4
     2da:	c29c                	sw	a5,0(a3)
    copy_info(newitem->info, info);
     2dc:	415c                	lw	a5,4(a0)
    to->data16 = from->data16;
     2de:	00e79023          	sh	a4,0(a5)
    to->idx    = from->idx;
     2e2:	00259703          	lh	a4,2(a1)
     2e6:	00e79123          	sh	a4,2(a5)

    return newitem;
     2ea:	8082                	ret
        return NULL;
     2ec:	4501                	li	a0,0
}
     2ee:	8082                	ret

000002f0 <core_list_remove>:
        Returns:
        Removed item.
*/
list_head *
core_list_remove(list_head *item)
{
     2f0:	87aa                	mv	a5,a0
    list_data *tmp;
    list_head *ret = item->next;
     2f2:	4108                	lw	a0,0(a0)
    /* swap data pointers */
    tmp        = item->info;
     2f4:	43d8                	lw	a4,4(a5)
    item->info = ret->info;
     2f6:	4154                	lw	a3,4(a0)
     2f8:	c3d4                	sw	a3,4(a5)
    ret->info  = tmp;
     2fa:	c158                	sw	a4,4(a0)
    /* and eliminate item */
    item->next = item->next->next;
     2fc:	4118                	lw	a4,0(a0)
     2fe:	c398                	sw	a4,0(a5)
    ret->next  = NULL;
     300:	00052023          	sw	zero,0(a0)
    return ret;
}
     304:	8082                	ret

00000306 <core_list_find>:
        Found item, or NULL if not found.
*/
list_head *
core_list_find(list_head *list, list_data *info)
{
    if (info->idx >= 0)
     306:	00259783          	lh	a5,2(a1)
     30a:	0007dc63          	bgez	a5,322 <core_list_find+0x1c>
            list = list->next;
        return list;
    }
    else
    {
        while (list && ((list->info->data16 & 0xff) != info->data16))
     30e:	c901                	beqz	a0,31e <core_list_find+0x18>
     310:	415c                	lw	a5,4(a0)
     312:	00059703          	lh	a4,0(a1)
     316:	0007c783          	lbu	a5,0(a5)
     31a:	00f71b63          	bne	a4,a5,330 <core_list_find+0x2a>
            list = list->next;
        return list;
    }
}
     31e:	8082                	ret
            list = list->next;
     320:	4108                	lw	a0,0(a0)
        while (list && (list->info->idx != info->idx))
     322:	dd75                	beqz	a0,31e <core_list_find+0x18>
     324:	4158                	lw	a4,4(a0)
     326:	00271703          	lh	a4,2(a4)
     32a:	fef71be3          	bne	a4,a5,320 <core_list_find+0x1a>
     32e:	8082                	ret
            list = list->next;
     330:	4108                	lw	a0,0(a0)
     332:	bff1                	j	30e <core_list_find+0x8>

00000334 <core_list_reverse>:
        Found item, or NULL if not found.
*/

list_head *
core_list_reverse(list_head *list)
{
     334:	87aa                	mv	a5,a0
    list_head *next = NULL, *tmp;
     336:	4501                	li	a0,0
    while (list)
     338:	e391                	bnez	a5,33c <core_list_reverse+0x8>
        list->next = next;
        next       = list;
        list       = tmp;
    }
    return next;
}
     33a:	8082                	ret
        tmp        = list->next;
     33c:	4398                	lw	a4,0(a5)
        list->next = next;
     33e:	c388                	sw	a0,0(a5)
        next       = list;
     340:	853e                	mv	a0,a5
        list       = tmp;
     342:	87ba                	mv	a5,a4
     344:	bfd5                	j	338 <core_list_reverse+0x4>

00000346 <core_list_mergesort>:
        but the algorithm could theoretically modify where the list starts.

 */
list_head *
core_list_mergesort(list_head *list, list_cmp cmp, core_results *res)
{
     346:	7179                	add	sp,sp,-48
     348:	ce4e                	sw	s3,28(sp)
     34a:	ca56                	sw	s5,20(sp)
     34c:	c65e                	sw	s7,12(sp)
     34e:	c462                	sw	s8,8(sp)
     350:	c06a                	sw	s10,0(sp)
     352:	d606                	sw	ra,44(sp)
     354:	d422                	sw	s0,40(sp)
     356:	d226                	sw	s1,36(sp)
     358:	d04a                	sw	s2,32(sp)
     35a:	cc52                	sw	s4,24(sp)
     35c:	c85a                	sw	s6,16(sp)
     35e:	c266                	sw	s9,4(sp)
     360:	8bae                	mv	s7,a1
     362:	8c32                	mv	s8,a2
     364:	89aa                	mv	s3,a0
    list_head *p, *q, *e, *tail;
    ee_s32     insize, nmerges, psize, qsize, i;

    insize = 1;
     366:	4a85                	li	s5,1
        }

        tail->next = NULL;

        /* If we have done only one merge, we're finished. */
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     368:	4d05                	li	s10,1
        p    = list;
     36a:	84ce                	mv	s1,s3
        while (p)
     36c:	4c81                	li	s9,0
        tail = NULL;
     36e:	4b01                	li	s6,0
        list = NULL;
     370:	4981                	li	s3,0
        while (p)
     372:	e499                	bnez	s1,380 <core_list_mergesort+0x3a>
        tail->next = NULL;
     374:	000b2023          	sw	zero,0(s6)
        if (nmerges <= 1) /* allow for nmerges==0, the empty list case */
     378:	059d5f63          	bge	s10,s9,3d6 <core_list_mergesort+0x90>
            return list;

        /* Otherwise repeat, merging lists twice the size */
        insize *= 2;
     37c:	0a86                	sll	s5,s5,0x1
        p    = list;
     37e:	b7f5                	j	36a <core_list_mergesort+0x24>
            nmerges++; /* there exists a merge to be done */
     380:	0c85                	add	s9,s9,1
            q     = p;
     382:	8426                	mv	s0,s1
            psize = 0;
     384:	4901                	li	s2,0
            for (i = 0; i < insize; i++)
     386:	01595563          	bge	s2,s5,390 <core_list_mergesort+0x4a>
                q = q->next;
     38a:	4000                	lw	s0,0(s0)
                psize++;
     38c:	0905                	add	s2,s2,1
                if (!q)
     38e:	fc65                	bnez	s0,386 <core_list_mergesort+0x40>
                    list = e;
     390:	8a56                	mv	s4,s5
            while (psize > 0 || (qsize > 0 && q))
     392:	01204d63          	bgtz	s2,3ac <core_list_mergesort+0x66>
     396:	01405363          	blez	s4,39c <core_list_mergesort+0x56>
     39a:	e019                	bnez	s0,3a0 <core_list_mergesort+0x5a>
                    list = e;
     39c:	84a2                	mv	s1,s0
     39e:	bfd1                	j	372 <core_list_mergesort+0x2c>
                if (psize == 0)
     3a0:	02091263          	bnez	s2,3c4 <core_list_mergesort+0x7e>
                    e = q;
     3a4:	87a2                	mv	a5,s0
                    qsize--;
     3a6:	1a7d                	add	s4,s4,-1
                    q = q->next;
     3a8:	4000                	lw	s0,0(s0)
     3aa:	a039                	j	3b8 <core_list_mergesort+0x72>
                else if (qsize == 0 || !q)
     3ac:	000a0363          	beqz	s4,3b2 <core_list_mergesort+0x6c>
     3b0:	e811                	bnez	s0,3c4 <core_list_mergesort+0x7e>
                    e = p;
     3b2:	87a6                	mv	a5,s1
                    p = p->next;
     3b4:	4084                	lw	s1,0(s1)
                    psize--;
     3b6:	197d                	add	s2,s2,-1
                if (tail)
     3b8:	000b0d63          	beqz	s6,3d2 <core_list_mergesort+0x8c>
                    tail->next = e;
     3bc:	00fb2023          	sw	a5,0(s6)
                    list = e;
     3c0:	8b3e                	mv	s6,a5
     3c2:	bfc1                	j	392 <core_list_mergesort+0x4c>
                else if (cmp(p->info, q->info, res) <= 0)
     3c4:	404c                	lw	a1,4(s0)
     3c6:	40c8                	lw	a0,4(s1)
     3c8:	8662                	mv	a2,s8
     3ca:	9b82                	jalr	s7
     3cc:	fca04ce3          	bgtz	a0,3a4 <core_list_mergesort+0x5e>
     3d0:	b7cd                	j	3b2 <core_list_mergesort+0x6c>
                    list = e;
     3d2:	89be                	mv	s3,a5
     3d4:	b7f5                	j	3c0 <core_list_mergesort+0x7a>
    }
#if COMPILER_REQUIRES_SORT_RETURN
    return list;
#endif
}
     3d6:	50b2                	lw	ra,44(sp)
     3d8:	5422                	lw	s0,40(sp)
     3da:	5492                	lw	s1,36(sp)
     3dc:	5902                	lw	s2,32(sp)
     3de:	4a62                	lw	s4,24(sp)
     3e0:	4ad2                	lw	s5,20(sp)
     3e2:	4b42                	lw	s6,16(sp)
     3e4:	4bb2                	lw	s7,12(sp)
     3e6:	4c22                	lw	s8,8(sp)
     3e8:	4c92                	lw	s9,4(sp)
     3ea:	4d02                	lw	s10,0(sp)
     3ec:	854e                	mv	a0,s3
     3ee:	49f2                	lw	s3,28(sp)
     3f0:	6145                	add	sp,sp,48
     3f2:	8082                	ret

000003f4 <core_bench_list>:
{
     3f4:	715d                	add	sp,sp,-80
     3f6:	c4a2                	sw	s0,72(sp)
     3f8:	d65e                	sw	s7,44(sp)
    list_head *list     = res->list;
     3fa:	5140                	lw	s0,36(a0)
    ee_s16     find_num = res->seed3;
     3fc:	00451b83          	lh	s7,4(a0)
{
     400:	c2a6                	sw	s1,68(sp)
     402:	c0ca                	sw	s2,64(sp)
     404:	dc52                	sw	s4,56(sp)
     406:	da56                	sw	s5,52(sp)
     408:	d85a                	sw	s6,48(sp)
     40a:	c686                	sw	ra,76(sp)
     40c:	de4e                	sw	s3,60(sp)
     40e:	862a                	mv	a2,a0
     410:	8b2e                	mv	s6,a1
    info.idx = finder_idx;
     412:	00b11f23          	sh	a1,30(sp)
    for (i = 0; i < find_num; i++)
     416:	4a01                	li	s4,0
    ee_u16     found = 0, missed = 0;
     418:	4a81                	li	s5,0
     41a:	4901                	li	s2,0
    ee_u16     retval = 0;
     41c:	4481                	li	s1,0
    for (i = 0; i < find_num; i++)
     41e:	077a4d63          	blt	s4,s7,498 <core_bench_list+0xa4>
    retval += found * 4 - missed;
     422:	090a                	sll	s2,s2,0x2
     424:	41590933          	sub	s2,s2,s5
     428:	94ca                	add	s1,s1,s2
     42a:	04c2                	sll	s1,s1,0x10
     42c:	80c1                	srl	s1,s1,0x10
    if (finder_idx > 0)
     42e:	01605763          	blez	s6,43c <core_bench_list+0x48>
        list = core_list_mergesort(list, cmp_complex, res);
     432:	8522                	mv	a0,s0
     434:	28600593          	li	a1,646
     438:	3739                	jal	346 <core_list_mergesort>
     43a:	842a                	mv	s0,a0
    remover = core_list_remove(list->next);
     43c:	4008                	lw	a0,0(s0)
     43e:	3d4d                	jal	2f0 <core_list_remove>
     440:	89aa                	mv	s3,a0
    finder = core_list_find(list, &info);
     442:	086c                	add	a1,sp,28
     444:	8522                	mv	a0,s0
     446:	35c1                	jal	306 <core_list_find>
     448:	892a                	mv	s2,a0
    if (!finder)
     44a:	e979                	bnez	a0,520 <core_bench_list+0x12c>
        finder = list->next;
     44c:	00042903          	lw	s2,0(s0)
    while (finder)
     450:	0c091863          	bnez	s2,520 <core_bench_list+0x12c>
    remover = core_list_undo_remove(remover, list->next);
     454:	401c                	lw	a5,0(s0)
    tmp                 = item_removed->info;
     456:	0049a703          	lw	a4,4(s3)
    item_removed->info  = item_modified->info;
     45a:	43d4                	lw	a3,4(a5)
    list = core_list_mergesort(list, cmp_idx, NULL);
     45c:	8522                	mv	a0,s0
     45e:	4601                	li	a2,0
    item_removed->info  = item_modified->info;
     460:	00d9a223          	sw	a3,4(s3)
    item_modified->info = tmp;
     464:	c3d8                	sw	a4,4(a5)
    item_removed->next  = item_modified->next;
     466:	4398                	lw	a4,0(a5)
    list = core_list_mergesort(list, cmp_idx, NULL);
     468:	18a00593          	li	a1,394
    item_removed->next  = item_modified->next;
     46c:	00e9a023          	sw	a4,0(s3)
    item_modified->next = item_removed;
     470:	0137a023          	sw	s3,0(a5)
    list = core_list_mergesort(list, cmp_idx, NULL);
     474:	3dc9                	jal	346 <core_list_mergesort>
    finder = list->next;
     476:	00052903          	lw	s2,0(a0)
    list = core_list_mergesort(list, cmp_idx, NULL);
     47a:	842a                	mv	s0,a0
    while (finder)
     47c:	0a091c63          	bnez	s2,534 <core_bench_list+0x140>
}
     480:	40b6                	lw	ra,76(sp)
     482:	4426                	lw	s0,72(sp)
     484:	4906                	lw	s2,64(sp)
     486:	59f2                	lw	s3,60(sp)
     488:	5a62                	lw	s4,56(sp)
     48a:	5ad2                	lw	s5,52(sp)
     48c:	5b42                	lw	s6,48(sp)
     48e:	5bb2                	lw	s7,44(sp)
     490:	8526                	mv	a0,s1
     492:	4496                	lw	s1,68(sp)
     494:	6161                	add	sp,sp,80
     496:	8082                	ret
        info.data16 = (i & 0xff);
     498:	0ffa7793          	zext.b	a5,s4
        this_find   = core_list_find(list, &info);
     49c:	086c                	add	a1,sp,28
     49e:	8522                	mv	a0,s0
     4a0:	c632                	sw	a2,12(sp)
        info.data16 = (i & 0xff);
     4a2:	00f11e23          	sh	a5,28(sp)
        this_find   = core_list_find(list, &info);
     4a6:	3585                	jal	306 <core_list_find>
     4a8:	89aa                	mv	s3,a0
        list        = core_list_reverse(list);
     4aa:	8522                	mv	a0,s0
     4ac:	3561                	jal	334 <core_list_reverse>
        if (this_find == NULL)
     4ae:	4632                	lw	a2,12(sp)
        list        = core_list_reverse(list);
     4b0:	842a                	mv	s0,a0
        if (this_find == NULL)
     4b2:	02099c63          	bnez	s3,4ea <core_bench_list+0xf6>
            retval += (list->next->info->data16 >> 8) & 1;
     4b6:	411c                	lw	a5,0(a0)
            missed++;
     4b8:	0a85                	add	s5,s5,1
     4ba:	0ac2                	sll	s5,s5,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     4bc:	43dc                	lw	a5,4(a5)
            missed++;
     4be:	010ada93          	srl	s5,s5,0x10
            retval += (list->next->info->data16 >> 8) & 1;
     4c2:	00178783          	lb	a5,1(a5)
     4c6:	8b85                	and	a5,a5,1
     4c8:	94be                	add	s1,s1,a5
     4ca:	04c2                	sll	s1,s1,0x10
     4cc:	80c1                	srl	s1,s1,0x10
        if (info.idx >= 0)
     4ce:	01e11783          	lh	a5,30(sp)
     4d2:	0007c563          	bltz	a5,4dc <core_bench_list+0xe8>
            info.idx++;
     4d6:	0785                	add	a5,a5,1
     4d8:	00f11f23          	sh	a5,30(sp)
    for (i = 0; i < find_num; i++)
     4dc:	001a0793          	add	a5,s4,1
     4e0:	01079a13          	sll	s4,a5,0x10
     4e4:	410a5a13          	sra	s4,s4,0x10
     4e8:	bf1d                	j	41e <core_bench_list+0x2a>
            if (this_find->info->data16 & 0x1) /* use found value */
     4ea:	0049a783          	lw	a5,4(s3)
     4ee:	00079783          	lh	a5,0(a5)
     4f2:	0017f713          	and	a4,a5,1
     4f6:	c719                	beqz	a4,504 <core_bench_list+0x110>
                retval += (this_find->info->data16 >> 9) & 1;
     4f8:	87a5                	sra	a5,a5,0x9
     4fa:	8b85                	and	a5,a5,1
     4fc:	97a6                	add	a5,a5,s1
     4fe:	01079493          	sll	s1,a5,0x10
     502:	80c1                	srl	s1,s1,0x10
            if (this_find->next != NULL)
     504:	0009a783          	lw	a5,0(s3)
     508:	c799                	beqz	a5,516 <core_bench_list+0x122>
                this_find->next = finder->next;
     50a:	4398                	lw	a4,0(a5)
     50c:	00e9a023          	sw	a4,0(s3)
                finder->next    = list->next;
     510:	4018                	lw	a4,0(s0)
     512:	c398                	sw	a4,0(a5)
                list->next      = finder;
     514:	c01c                	sw	a5,0(s0)
            found++;
     516:	0905                	add	s2,s2,1
     518:	0942                	sll	s2,s2,0x10
     51a:	01095913          	srl	s2,s2,0x10
     51e:	bf45                	j	4ce <core_bench_list+0xda>
        retval = crc16(list->info->data16, retval);
     520:	405c                	lw	a5,4(s0)
     522:	85a6                	mv	a1,s1
     524:	00079503          	lh	a0,0(a5)
     528:	679000ef          	jal	13a0 <crc16>
     52c:	84aa                	mv	s1,a0
        finder = finder->next;
     52e:	00092903          	lw	s2,0(s2)
     532:	bf39                	j	450 <core_bench_list+0x5c>
        retval = crc16(list->info->data16, retval);
     534:	405c                	lw	a5,4(s0)
     536:	85a6                	mv	a1,s1
     538:	00079503          	lh	a0,0(a5)
     53c:	665000ef          	jal	13a0 <crc16>
     540:	84aa                	mv	s1,a0
        finder = finder->next;
     542:	00092903          	lw	s2,0(s2)
     546:	bf1d                	j	47c <core_bench_list+0x88>

00000548 <core_list_init>:
    ee_u32 size     = (blksize / per_item)
     548:	47d1                	li	a5,20
     54a:	02f55533          	divu	a0,a0,a5
{
     54e:	7139                	add	sp,sp,-64
     550:	da26                	sw	s1,52(sp)
     552:	d84a                	sw	s2,48(sp)
     554:	dc22                	sw	s0,56(sp)
     556:	d64e                	sw	s3,44(sp)
     558:	d452                	sw	s4,40(sp)
     55a:	d256                	sw	s5,36(sp)
     55c:	d05a                	sw	s6,32(sp)
     55e:	de06                	sw	ra,60(sp)
    list->info->data16 = (ee_s16)0x8080;
     560:	77e1                	lui	a5,0xffff8
    list->next         = NULL;
     562:	0005a023          	sw	zero,0(a1)
    list->info->data16 = (ee_s16)0x8080;
     566:	08078793          	add	a5,a5,128 # ffff8080 <__crt0_ram_last+0x7fff6081>
    list_head *memblock_end  = memblock + size;
     56a:	842e                	mv	s0,a1
{
     56c:	89b2                	mv	s3,a2
    core_list_insert_new(
     56e:	0834                	add	a3,sp,24
     570:	0070                	add	a2,sp,12
    for (i = 0; i < size; i++)
     572:	4a01                	li	s4,0
        info.data16 = (dat << 8) | dat;  /* fill the data with actual data and
     574:	10100b13          	li	s6,257
    ee_u32 size     = (blksize / per_item)
     578:	ffe50493          	add	s1,a0,-2
    list_head *memblock_end  = memblock + size;
     57c:	00349913          	sll	s2,s1,0x3
     580:	992e                	add	s2,s2,a1
    list->info         = datablock;
     582:	0125a223          	sw	s2,4(a1)
    list->info->data16 = (ee_s16)0x8080;
     586:	00f91023          	sh	a5,0(s2)
    memblock++;
     58a:	00858793          	add	a5,a1,8
     58e:	c63e                	sw	a5,12(sp)
    datablock++;
     590:	00490793          	add	a5,s2,4
     594:	cc3e                	sw	a5,24(sp)
    list_data *datablock_end = datablock + size;
     596:	00249a93          	sll	s5,s1,0x2
    info.data16 = (ee_s16)0xffff;
     59a:	800007b7          	lui	a5,0x80000
     59e:	17fd                	add	a5,a5,-1 # 7fffffff <__neorv32_rom_size+0x7ffdffff>
    list_data *datablock_end = datablock + size;
     5a0:	9aca                	add	s5,s5,s2
    info.data16 = (ee_s16)0xffff;
     5a2:	ce3e                	sw	a5,28(sp)
    list->info->idx    = 0x0000;
     5a4:	00091123          	sh	zero,2(s2)
    core_list_insert_new(
     5a8:	87d6                	mv	a5,s5
     5aa:	874a                	mv	a4,s2
     5ac:	086c                	add	a1,sp,28
     5ae:	8522                	mv	a0,s0
     5b0:	39f5                	jal	2ac <core_list_insert_new>
    for (i = 0; i < size; i++)
     5b2:	029a6a63          	bltu	s4,s1,5e6 <core_list_init+0x9e>
    finder = list->next;
     5b6:	401c                	lw	a5,0(s0)
        if (i < size / 5) /* first 20% of the list in order */
     5b8:	4715                	li	a4,5
                                & (((i & 0x07) << 8)
     5ba:	6611                	lui	a2,0x4
        if (i < size / 5) /* first 20% of the list in order */
     5bc:	02e4d4b3          	divu	s1,s1,a4
                                & (((i & 0x07) << 8)
     5c0:	167d                	add	a2,a2,-1 # 3fff <__smakebuf_r+0x63>
    while (finder->next != NULL)
     5c2:	4705                	li	a4,1
     5c4:	438c                	lw	a1,0(a5)
     5c6:	e5b9                	bnez	a1,614 <core_list_init+0xcc>
    list = core_list_mergesort(list, cmp_idx, NULL);
     5c8:	8522                	mv	a0,s0
     5ca:	4601                	li	a2,0
     5cc:	18a00593          	li	a1,394
     5d0:	3b9d                	jal	346 <core_list_mergesort>
}
     5d2:	50f2                	lw	ra,60(sp)
     5d4:	5462                	lw	s0,56(sp)
     5d6:	54d2                	lw	s1,52(sp)
     5d8:	5942                	lw	s2,48(sp)
     5da:	59b2                	lw	s3,44(sp)
     5dc:	5a22                	lw	s4,40(sp)
     5de:	5a92                	lw	s5,36(sp)
     5e0:	5b02                	lw	s6,32(sp)
     5e2:	6121                	add	sp,sp,64
     5e4:	8082                	ret
        ee_u16 datpat = ((ee_u16)(seed ^ i) & 0xf);
     5e6:	010a1793          	sll	a5,s4,0x10
     5ea:	83c1                	srl	a5,a5,0x10
     5ec:	0137c733          	xor	a4,a5,s3
            = (datpat << 3) | (i & 0x7); /* alternate between algorithms */
     5f0:	070e                	sll	a4,a4,0x3
     5f2:	8b9d                	and	a5,a5,7
     5f4:	07877713          	and	a4,a4,120
        ee_u16 dat
     5f8:	8f5d                	or	a4,a4,a5
        info.data16 = (dat << 8) | dat;  /* fill the data with actual data and
     5fa:	03670733          	mul	a4,a4,s6
        core_list_insert_new(
     5fe:	87d6                	mv	a5,s5
     600:	0834                	add	a3,sp,24
     602:	0070                	add	a2,sp,12
     604:	086c                	add	a1,sp,28
     606:	8522                	mv	a0,s0
    for (i = 0; i < size; i++)
     608:	0a05                	add	s4,s4,1
        info.data16 = (dat << 8) | dat;  /* fill the data with actual data and
     60a:	00e11e23          	sh	a4,28(sp)
        core_list_insert_new(
     60e:	874a                	mv	a4,s2
     610:	3971                	jal	2ac <core_list_insert_new>
    for (i = 0; i < size; i++)
     612:	b745                	j	5b2 <core_list_init+0x6a>
            finder->info->idx = i++;
     614:	43c8                	lw	a0,4(a5)
     616:	01071793          	sll	a5,a4,0x10
        if (i < size / 5) /* first 20% of the list in order */
     61a:	00976f63          	bltu	a4,s1,638 <core_list_init+0xf0>
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
     61e:	01071693          	sll	a3,a4,0x10
     622:	82c1                	srl	a3,a3,0x10
                                & (((i & 0x07) << 8)
     624:	00168793          	add	a5,a3,1
     628:	07a2                	sll	a5,a5,0x8
     62a:	7007f793          	and	a5,a5,1792
            ee_u16 pat = (ee_u16)(i++ ^ seed); /* get a pseudo random number */
     62e:	0136c6b3          	xor	a3,a3,s3
                                   | pat); /* make sure the mixed items end up
     632:	8fd5                	or	a5,a5,a3
                                & (((i & 0x07) << 8)
     634:	8ff1                	and	a5,a5,a2
     636:	07c2                	sll	a5,a5,0x10
     638:	87c1                	sra	a5,a5,0x10
            finder->info->idx = i++;
     63a:	00f51123          	sh	a5,2(a0)
     63e:	0705                	add	a4,a4,1
     640:	87ae                	mv	a5,a1
     642:	b749                	j	5c4 <core_list_init+0x7c>

00000644 <iterate>:
static ee_u16 list_known_crc[]   = { (ee_u16)0xd4b0,(ee_u16)0x3340,(ee_u16)0x6a79,(ee_u16)0xe714,(ee_u16)0xe3c1 };
static ee_u16 matrix_known_crc[] = { (ee_u16)0xbe52,(ee_u16)0x1199,(ee_u16)0x5608,(ee_u16)0x1fd7,(ee_u16)0x0747 };
static ee_u16 state_known_crc[]  = { (ee_u16)0x5e47,(ee_u16)0x39bf,(ee_u16)0xe5a4,(ee_u16)0x8e3a,(ee_u16)0x8d84 };

/* iterate() from CoreMark (list kernel only here; others run via execs mask) */
void *iterate(void *pres) {
     644:	1141                	add	sp,sp,-16
     646:	c04a                	sw	s2,0(sp)
  ee_u32 i;
  ee_u16 crc;
  core_results *res = (core_results *)pres;
  ee_u32 iterations = res->iterations;
     648:	01c52903          	lw	s2,28(a0)
void *iterate(void *pres) {
     64c:	c422                	sw	s0,8(sp)
     64e:	c226                	sw	s1,4(sp)
     650:	c606                	sw	ra,12(sp)
     652:	842a                	mv	s0,a0

  res->crc = 0; res->crclist = 0; res->crcmatrix = 0; res->crcstate = 0;
     654:	02052c23          	sw	zero,56(a0)
     658:	02052e23          	sw	zero,60(a0)

  for (i = 0; i < iterations; i++) {
     65c:	4481                	li	s1,0
     65e:	01249963          	bne	s1,s2,670 <iterate+0x2c>
    crc      = core_bench_list(res, -1);
    res->crc = crcu16(crc, res->crc);
    if (i == 0) res->crclist = res->crc;
  }
  return NULL;
}
     662:	40b2                	lw	ra,12(sp)
     664:	4422                	lw	s0,8(sp)
     666:	4492                	lw	s1,4(sp)
     668:	4902                	lw	s2,0(sp)
     66a:	4501                	li	a0,0
     66c:	0141                	add	sp,sp,16
     66e:	8082                	ret
    crc      = core_bench_list(res,  1);
     670:	4585                	li	a1,1
     672:	8522                	mv	a0,s0
     674:	3341                	jal	3f4 <core_bench_list>
    res->crc = crcu16(crc, res->crc);
     676:	03845583          	lhu	a1,56(s0)
     67a:	4ef000ef          	jal	1368 <crcu16>
     67e:	02a41c23          	sh	a0,56(s0)
    crc      = core_bench_list(res, -1);
     682:	55fd                	li	a1,-1
     684:	8522                	mv	a0,s0
     686:	33bd                	jal	3f4 <core_bench_list>
    res->crc = crcu16(crc, res->crc);
     688:	03845583          	lhu	a1,56(s0)
     68c:	4dd000ef          	jal	1368 <crcu16>
     690:	02a41c23          	sh	a0,56(s0)
    if (i == 0) res->crclist = res->crc;
     694:	e099                	bnez	s1,69a <iterate+0x56>
     696:	02a41d23          	sh	a0,58(s0)
  for (i = 0; i < iterations; i++) {
     69a:	0485                	add	s1,s1,1
     69c:	b7c9                	j	65e <iterate+0x1a>

0000069e <main>:

#if MAIN_HAS_NOARGC
MAIN_RETURN_TYPE main(void) {
  int argc = 0; char *argv[1];
#else
MAIN_RETURN_TYPE main(int argc, char *argv[]) {
     69e:	7119                	add	sp,sp,-128
     6a0:	862e                	mv	a2,a1
     6a2:	c62a                	sw	a0,12(sp)
#if (MEM_METHOD == MEM_STACK)
  ee_u8 stack_memblock[TOTAL_DATA_SIZE * MULTITHREAD];
#endif

  /* Target init */
  portable_init(&(results[0].port), &argc, argv);
     6a4:	006c                	add	a1,sp,12
     6a6:	05e10513          	add	a0,sp,94
MAIN_RETURN_TYPE main(int argc, char *argv[]) {
     6aa:	de86                	sw	ra,124(sp)
     6ac:	dca2                	sw	s0,120(sp)
     6ae:	daa6                	sw	s1,116(sp)
     6b0:	d8ca                	sw	s2,112(sp)
     6b2:	d6ce                	sw	s3,108(sp)
     6b4:	d4d2                	sw	s4,104(sp)
     6b6:	d2d6                	sw	s5,100(sp)
  portable_init(&(results[0].port), &argc, argv);
     6b8:	04b000ef          	jal	f02 <portable_init>
    ee_printf("list_head structure too big for comparable data!\n");
    return MAIN_RETURN_VAL;
  }

  /* Seeds & config */
  results[0].seed1      = get_seed(1);
     6bc:	4505                	li	a0,1
     6be:	429000ef          	jal	12e6 <get_seed_32>
     6c2:	00a11e23          	sh	a0,28(sp)
  results[0].seed2      = get_seed(2);
     6c6:	4509                	li	a0,2
     6c8:	41f000ef          	jal	12e6 <get_seed_32>
     6cc:	00a11f23          	sh	a0,30(sp)
  results[0].seed3      = get_seed(3);
     6d0:	450d                	li	a0,3
     6d2:	415000ef          	jal	12e6 <get_seed_32>
     6d6:	02a11023          	sh	a0,32(sp)
  results[0].iterations = get_seed_32(4);
     6da:	4511                	li	a0,4
     6dc:	40b000ef          	jal	12e6 <get_seed_32>
     6e0:	dc2a                	sw	a0,56(sp)
#if CORE_DEBUG
  results[0].iterations = 1;
#endif
  results[0].execs = get_seed_32(5);
     6e2:	4515                	li	a0,5
     6e4:	403000ef          	jal	12e6 <get_seed_32>
  if (results[0].execs == 0) results[0].execs = ALL_ALGORITHMS_MASK;
     6e8:	e111                	bnez	a0,6ec <main+0x4e>
     6ea:	451d                	li	a0,7

  /* Default sets */
  if ((results[0].seed1 == 0) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
     6ec:	47f2                	lw	a5,28(sp)
     6ee:	de2a                	sw	a0,60(sp)
     6f0:	eb81                	bnez	a5,700 <main+0x62>
     6f2:	02011703          	lh	a4,32(sp)
     6f6:	e705                	bnez	a4,71e <main+0x80>
    results[0].seed1 = 0; results[0].seed2 = 0; results[0].seed3 = 0x66; /* performance */
     6f8:	06600713          	li	a4,102
     6fc:	02e11023          	sh	a4,32(sp)
  }
  if ((results[0].seed1 == 1) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
     700:	4705                	li	a4,1
     702:	00e79e63          	bne	a5,a4,71e <main+0x80>
     706:	02011783          	lh	a5,32(sp)
     70a:	eb91                	bnez	a5,71e <main+0x80>
    results[0].seed1 = 0x3415; results[0].seed2 = 0x3415; results[0].seed3 = 0x66; /* validation */
     70c:	341537b7          	lui	a5,0x34153
     710:	41578793          	add	a5,a5,1045 # 34153415 <__neorv32_rom_size+0x34133415>
     714:	ce3e                	sw	a5,28(sp)
     716:	06600793          	li	a5,102
     71a:	02f11023          	sh	a5,32(sp)
  }

  /* Memory provisioning */
#if (MEM_METHOD == MEM_STATIC)
  results[0].memblock[0] = (void *)static_memblk;
     71e:	80000737          	lui	a4,0x80000
     722:	59470793          	add	a5,a4,1428 # 80000594 <static_memblk>
     726:	d23e                	sw	a5,36(sp)
  results[0].size        = TOTAL_DATA_SIZE;
  results[0].err         = 0;
     728:	04011e23          	sh	zero,92(sp)
#error "Please define a way to initialize a memory block."
#endif

  /* Split memory across enabled algorithms */
  for (i = 0; i < NUM_ALGORITHMS; i++) {
    if ((1u << (ee_u32)i) & results[0].execs) num_algorithms++;
     72c:	00257693          	and	a3,a0,2
     730:	00157793          	and	a5,a0,1
     734:	59470593          	add	a1,a4,1428
     738:	c291                	beqz	a3,73c <main+0x9e>
     73a:	0785                	add	a5,a5,1
     73c:	00457713          	and	a4,a0,4
     740:	c701                	beqz	a4,748 <main+0xaa>
     742:	0785                	add	a5,a5,1
     744:	07c2                	sll	a5,a5,0x10
     746:	83c1                	srl	a5,a5,0x10
  }
  for (i = 0; i < MULTITHREAD; i++) results[i].size = results[i].size / num_algorithms;
     748:	7d000613          	li	a2,2000
     74c:	02f65633          	divu	a2,a2,a5
     750:	0874                	add	a3,sp,28
     752:	4701                	li	a4,0
  ee_u16 i, j = 0, num_algorithms = 0;
     754:	4781                	li	a5,0
     756:	84b6                	mv	s1,a3

  /* Assign algorithm sub-blocks */
  for (i = 0; i < NUM_ALGORITHMS; i++) {
    ee_u32 ctx;
    if ((1u << (ee_u32)i) & results[0].execs) {
     758:	4305                	li	t1,1
  for (i = 0; i < NUM_ALGORITHMS; i++) {
     75a:	488d                	li	a7,3
  for (i = 0; i < MULTITHREAD; i++) results[i].size = results[i].size / num_algorithms;
     75c:	da32                	sw	a2,52(sp)
    if ((1u << (ee_u32)i) & results[0].execs) {
     75e:	00e31833          	sll	a6,t1,a4
     762:	00a87833          	and	a6,a6,a0
     766:	00080a63          	beqz	a6,77a <main+0xdc>
      for (ctx = 0; ctx < MULTITHREAD; ctx++)
        results[ctx].memblock[i + 1] = (char *)(results[ctx].memblock[0]) + results[0].size * j;
     76a:	02c78833          	mul	a6,a5,a2
      j++;
     76e:	0785                	add	a5,a5,1
     770:	07c2                	sll	a5,a5,0x10
     772:	83c1                	srl	a5,a5,0x10
        results[ctx].memblock[i + 1] = (char *)(results[ctx].memblock[0]) + results[0].size * j;
     774:	982e                	add	a6,a6,a1
     776:	0106a623          	sw	a6,12(a3)
  for (i = 0; i < NUM_ALGORITHMS; i++) {
     77a:	0705                	add	a4,a4,1
     77c:	0691                	add	a3,a3,4
     77e:	ff1710e3          	bne	a4,a7,75e <main+0xc0>
    }
  }

  /* Algorithm inits */
  for (i = 0; i < MULTITHREAD; i++) {
    if (results[i].execs & ID_LIST) {
     782:	57f2                	lw	a5,60(sp)
     784:	8b85                	and	a5,a5,1
     786:	c799                	beqz	a5,794 <main+0xf6>
      results[i].list = core_list_init(results[0].size, results[i].memblock[1], results[i].seed1);
     788:	01c11603          	lh	a2,28(sp)
     78c:	55a2                	lw	a1,40(sp)
     78e:	5552                	lw	a0,52(sp)
     790:	3b65                	jal	548 <core_list_init>
     792:	c0aa                	sw	a0,64(sp)
    }
    if (results[i].execs & ID_MATRIX) {
     794:	57f2                	lw	a5,60(sp)
     796:	8b89                	and	a5,a5,2
     798:	cb99                	beqz	a5,7ae <main+0x110>
      core_init_matrix(results[0].size,
                       results[i].memblock[2],
                       (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16),
     79a:	01e11783          	lh	a5,30(sp)
     79e:	01c11603          	lh	a2,28(sp)
      core_init_matrix(results[0].size,
     7a2:	55b2                	lw	a1,44(sp)
     7a4:	5552                	lw	a0,52(sp)
                       (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16),
     7a6:	07c2                	sll	a5,a5,0x10
      core_init_matrix(results[0].size,
     7a8:	00d4                	add	a3,sp,68
     7aa:	8e5d                	or	a2,a2,a5
     7ac:	2ebd                	jal	b2a <core_init_matrix>
                       &(results[i].mat));
    }
    if (results[i].execs & ID_STATE) {
     7ae:	57f2                	lw	a5,60(sp)
     7b0:	8b91                	and	a5,a5,4
     7b2:	c799                	beqz	a5,7c0 <main+0x122>
      core_init_state(results[0].size, results[i].seed1, results[i].memblock[3]);
     7b4:	5642                	lw	a2,48(sp)
     7b6:	01c11583          	lh	a1,28(sp)
     7ba:	5552                	lw	a0,52(sp)
     7bc:	043000ef          	jal	ffe <core_init_state>
    }
  }

  /* Auto-iterations if not set */
  if (results[0].iterations == 0) {
     7c0:	57e2                	lw	a5,56(sp)
     7c2:	eb85                	bnez	a5,7f2 <main+0x154>
    secs_ret secs_passed = 0;
    ee_u32 divisor;
    results[0].iterations = 1;
     7c4:	4785                	li	a5,1
     7c6:	dc3e                	sw	a5,56(sp)
    while (secs_passed < (secs_ret)1) {
      results[0].iterations *= 10;
     7c8:	4429                	li	s0,10
     7ca:	57e2                	lw	a5,56(sp)
     7cc:	028787b3          	mul	a5,a5,s0
     7d0:	dc3e                	sw	a5,56(sp)
      start_time(); iterate(&results[0]); stop_time();
     7d2:	2d5d                	jal	e88 <start_time>
     7d4:	8526                	mv	a0,s1
     7d6:	35bd                	jal	644 <iterate>
     7d8:	2dc1                	jal	ea8 <stop_time>
      secs_passed = time_in_secs(get_time());
     7da:	6ee000ef          	jal	ec8 <get_time>
     7de:	710000ef          	jal	eee <time_in_secs>
    while (secs_passed < (secs_ret)1) {
     7e2:	d565                	beqz	a0,7ca <main+0x12c>
    }
    divisor = (ee_u32)secs_passed; if (divisor == 0) divisor = 1;
    results[0].iterations *= 1 + 10 / divisor;
     7e4:	02a45433          	divu	s0,s0,a0
     7e8:	57e2                	lw	a5,56(sp)
     7ea:	0405                	add	s0,s0,1
     7ec:	028787b3          	mul	a5,a5,s0
     7f0:	dc3e                	sw	a5,56(sp)
  }

  /* Run */
  start_time();
     7f2:	2d59                	jal	e88 <start_time>
    results[i].execs      = results[0].execs;
    core_start_parallel(&results[i]);
  }
  for (i = 0; i < default_num_contexts; i++) core_stop_parallel(&results[i]);
#else
  iterate(&results[0]);
     7f4:	8526                	mv	a0,s1
     7f6:	35b9                	jal	644 <iterate>
#endif
  stop_time();
     7f8:	2d45                	jal	ea8 <stop_time>
  total_time = get_time();
     7fa:	25f9                	jal	ec8 <get_time>
     7fc:	8a2a                	mv	s4,a0

  /* Seed CRC */
  seedcrc = crc16(results[0].seed1, seedcrc);
     7fe:	01c11503          	lh	a0,28(sp)
  total_time = get_time();
     802:	89ae                	mv	s3,a1
  seedcrc = crc16(results[0].seed1, seedcrc);
     804:	4581                	li	a1,0
     806:	39b000ef          	jal	13a0 <crc16>
     80a:	85aa                	mv	a1,a0
  seedcrc = crc16(results[0].seed2, seedcrc);
     80c:	01e11503          	lh	a0,30(sp)
     810:	80000937          	lui	s2,0x80000
     814:	38d000ef          	jal	13a0 <crc16>
     818:	85aa                	mv	a1,a0
  seedcrc = crc16(results[0].seed3, seedcrc);
     81a:	02011503          	lh	a0,32(sp)
     81e:	383000ef          	jal	13a0 <crc16>
     822:	85aa                	mv	a1,a0
  seedcrc = crc16(results[0].size,  seedcrc);
     824:	03411503          	lh	a0,52(sp)
     828:	379000ef          	jal	13a0 <crc16>

  switch (seedcrc) {
     82c:	67a1                	lui	a5,0x8
     82e:	b0578793          	add	a5,a5,-1275 # 7b05 <__crt0_copy_data_src_begin+0x2de9>
  seedcrc = crc16(results[0].size,  seedcrc);
     832:	84aa                	mv	s1,a0
  switch (seedcrc) {
     834:	18f50763          	beq	a0,a5,9c2 <main+0x324>
     838:	16a7e863          	bltu	a5,a0,9a8 <main+0x30a>
     83c:	6789                	lui	a5,0x2
     83e:	8f278793          	add	a5,a5,-1806 # 18f2 <printf+0x36c>
     842:	18f50263          	beq	a0,a5,9c6 <main+0x328>
     846:	6715                	lui	a4,0x5
     848:	eaf70713          	add	a4,a4,-337 # 4eaf <__crt0_copy_data_src_begin+0x193>
    case 0x8a02: known_id = 0; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k performance run parameters for coremark.\n"); break;
    case 0x7b05: known_id = 1; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k validation run parameters for coremark.\n"); break;
    case 0x4eaf: known_id = 2; if (!COREMARK_MINIMAL_PRINT) ee_printf("Profile generation run parameters for coremark.\n"); break;
     84c:	4789                	li	a5,2
  switch (seedcrc) {
     84e:	547d                	li	s0,-1
     850:	02e51863          	bne	a0,a4,880 <main+0x1e2>
  }

  if (known_id >= 0) {
    for (i = 0; i < default_num_contexts; i++) {
      results[i].err = 0;
      if ((results[i].execs & ID_LIST)   && (results[i].crclist   != list_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",   i, results[i].crclist,   list_known_crc[known_id]);   results[i].err++; }
     854:	6595                	lui	a1,0x5
      if ((results[i].execs & ID_MATRIX) && (results[i].crcmatrix != matrix_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n", i, results[i].crcmatrix, matrix_known_crc[known_id]); results[i].err++; }
     856:	6515                	lui	a0,0x5
      if ((results[i].execs & ID_STATE)  && (results[i].crcstate  != state_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",  i, results[i].crcstate,  state_known_crc[known_id]);  results[i].err++; }
     858:	6715                	lui	a4,0x5
    for (i = 0; i < default_num_contexts; i++) {
     85a:	53492303          	lw	t1,1332(s2) # 80000534 <default_num_contexts>
      if ((results[i].execs & ID_LIST)   && (results[i].crclist   != list_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",   i, results[i].crclist,   list_known_crc[known_id]);   results[i].err++; }
     85e:	0786                	sll	a5,a5,0x1
     860:	a6858593          	add	a1,a1,-1432 # 4a68 <list_known_crc>
      if ((results[i].execs & ID_MATRIX) && (results[i].crcmatrix != matrix_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n", i, results[i].crcmatrix, matrix_known_crc[known_id]); results[i].err++; }
     864:	a5c50513          	add	a0,a0,-1444 # 4a5c <matrix_known_crc>
      if ((results[i].execs & ID_STATE)  && (results[i].crcstate  != state_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",  i, results[i].crcstate,  state_known_crc[known_id]);  results[i].err++; }
     868:	a5070713          	add	a4,a4,-1456 # 4a50 <state_known_crc>
    for (i = 0; i < default_num_contexts; i++) {
     86c:	4401                	li	s0,0
     86e:	4601                	li	a2,0
      results[i].err = 0;
     870:	04400813          	li	a6,68
      if ((results[i].execs & ID_LIST)   && (results[i].crclist   != list_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",   i, results[i].crclist,   list_known_crc[known_id]);   results[i].err++; }
     874:	95be                	add	a1,a1,a5
     876:	4e05                	li	t3,1
      if ((results[i].execs & ID_MATRIX) && (results[i].crcmatrix != matrix_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n", i, results[i].crcmatrix, matrix_known_crc[known_id]); results[i].err++; }
     878:	953e                	add	a0,a0,a5
      if ((results[i].execs & ID_STATE)  && (results[i].crcstate  != state_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",  i, results[i].crcstate,  state_known_crc[known_id]);  results[i].err++; }
     87a:	973e                	add	a4,a4,a5
    for (i = 0; i < default_num_contexts; i++) {
     87c:	14664963          	blt	a2,t1,9ce <main+0x330>
      total_errors += results[i].err;
    }
  }

  total_errors += check_data_types();
     880:	327000ef          	jal	13a6 <check_data_types>

  /* Report */
  ee_printf("CoreMark Size    : %lu\n", (unsigned long)results[0].size);
     884:	55d2                	lw	a1,52(sp)
  total_errors += check_data_types();
     886:	942a                	add	s0,s0,a0
  ee_printf("CoreMark Size    : %lu\n", (unsigned long)results[0].size);
     888:	6511                	lui	a0,0x4
     88a:	4c450513          	add	a0,a0,1220 # 44c4 <__fini_array_end>
     88e:	4f9000ef          	jal	1586 <printf>
  ee_printf("Total ticks      : %lu k\n", (unsigned long)(total_time / 1000));
     892:	3e800613          	li	a2,1000
     896:	4681                	li	a3,0
     898:	8552                	mv	a0,s4
     89a:	85ce                	mv	a1,s3
     89c:	081030ef          	jal	411c <__udivdi3>
     8a0:	85aa                	mv	a1,a0
     8a2:	6511                	lui	a0,0x4
     8a4:	4dc50513          	add	a0,a0,1244 # 44dc <__fini_array_end+0x18>
     8a8:	4df000ef          	jal	1586 <printf>
  ee_printf("Total time (secs): %f\n", time_in_secs(total_time));
  if (time_in_secs(total_time) > 0)
    ee_printf("Iterations/Sec   : %f\n",
      default_num_contexts * results[0].iterations / time_in_secs(total_time));
#else
  ee_printf("Total time (secs): %lu\n", (unsigned long)time_in_secs(total_time));
     8ac:	85ce                	mv	a1,s3
     8ae:	8552                	mv	a0,s4
     8b0:	2d3d                	jal	eee <time_in_secs>
     8b2:	85aa                	mv	a1,a0
     8b4:	6511                	lui	a0,0x4
     8b6:	4f850513          	add	a0,a0,1272 # 44f8 <__fini_array_end+0x34>
     8ba:	4cd000ef          	jal	1586 <printf>
  total_errors += check_data_types();
     8be:	0442                	sll	s0,s0,0x10
  if (time_in_secs(total_time) > 0)
     8c0:	8552                	mv	a0,s4
     8c2:	85ce                	mv	a1,s3
  total_errors += check_data_types();
     8c4:	8041                	srl	s0,s0,0x10
  if (time_in_secs(total_time) > 0)
     8c6:	2525                	jal	eee <time_in_secs>
     8c8:	c105                	beqz	a0,8e8 <main+0x24a>
    ee_printf("Iterations/Sec   : %lu\n",
      (unsigned long)(default_num_contexts * results[0].iterations
     8ca:	53492783          	lw	a5,1332(s2)
     8ce:	5ae2                	lw	s5,56(sp)
        / time_in_secs(total_time)));
     8d0:	85ce                	mv	a1,s3
     8d2:	8552                	mv	a0,s4
      (unsigned long)(default_num_contexts * results[0].iterations
     8d4:	02fa8ab3          	mul	s5,s5,a5
        / time_in_secs(total_time)));
     8d8:	2d19                	jal	eee <time_in_secs>
    ee_printf("Iterations/Sec   : %lu\n",
     8da:	02aad5b3          	divu	a1,s5,a0
     8de:	6511                	lui	a0,0x4
     8e0:	51050513          	add	a0,a0,1296 # 4510 <__fini_array_end+0x4c>
     8e4:	4a3000ef          	jal	1586 <printf>
#endif

  if (time_in_secs(total_time) < 10) {
     8e8:	8552                	mv	a0,s4
     8ea:	85ce                	mv	a1,s3
     8ec:	2509                	jal	eee <time_in_secs>
     8ee:	47a5                	li	a5,9
     8f0:	00a7e563          	bltu	a5,a0,8fa <main+0x25c>
    if (!COREMARK_MINIMAL_PRINT) ee_printf("ERROR! Must execute for at least 10 secs for a valid result!\n");
    total_errors++;
     8f4:	0405                	add	s0,s0,1
     8f6:	0442                	sll	s0,s0,0x10
     8f8:	8041                	srl	s0,s0,0x10
  }

  ee_printf("Iterations       : %lu\n",
     8fa:	53492783          	lw	a5,1332(s2)
     8fe:	55e2                	lw	a1,56(sp)
     900:	6511                	lui	a0,0x4
     902:	52850513          	add	a0,a0,1320 # 4528 <__fini_array_end+0x64>
     906:	02f585b3          	mul	a1,a1,a5
     90a:	0442                	sll	s0,s0,0x10
     90c:	8441                	sra	s0,s0,0x10
     90e:	479000ef          	jal	1586 <printf>
            (unsigned long)(default_num_contexts * results[0].iterations));
  ee_printf("Compiler version : %s\n", COMPILER_VERSION);
     912:	6591                	lui	a1,0x4
     914:	6511                	lui	a0,0x4
     916:	54058593          	add	a1,a1,1344 # 4540 <__fini_array_end+0x7c>
     91a:	54c50513          	add	a0,a0,1356 # 454c <__fini_array_end+0x88>
     91e:	469000ef          	jal	1586 <printf>
  ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
     922:	6591                	lui	a1,0x4
     924:	6511                	lui	a0,0x4
     926:	56458593          	add	a1,a1,1380 # 4564 <__fini_array_end+0xa0>
     92a:	57450513          	add	a0,a0,1396 # 4574 <__fini_array_end+0xb0>
     92e:	459000ef          	jal	1586 <printf>
#if (MULTITHREAD > 1)
  ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts);
#endif
  ee_printf("Memory location  : %s\n", MEM_LOCATION);
     932:	6591                	lui	a1,0x4
     934:	6511                	lui	a0,0x4
     936:	58c58593          	add	a1,a1,1420 # 458c <__fini_array_end+0xc8>
     93a:	59450513          	add	a0,a0,1428 # 4594 <__fini_array_end+0xd0>
     93e:	449000ef          	jal	1586 <printf>

#if defined(USE_CFU)
  ee_printf("Acceleration      : CFU (custom-0 MUL32 used in matrix kernels)\n");
     942:	6511                	lui	a0,0x4
     944:	5ac50513          	add	a0,a0,1452 # 45ac <__fini_array_end+0xe8>
     948:	7f5010ef          	jal	293c <puts>
#else
  ee_printf("Acceleration      : OFF (vanilla CoreMark)\n");
#endif

  ee_printf("seedcrc          : 0x%04x\n", seedcrc);
     94c:	6511                	lui	a0,0x4
     94e:	85a6                	mv	a1,s1
     950:	5ec50513          	add	a0,a0,1516 # 45ec <__fini_array_end+0x128>
     954:	433000ef          	jal	1586 <printf>
  if (results[0].execs & ID_LIST)   for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
     958:	57f2                	lw	a5,60(sp)
     95a:	8b85                	and	a5,a5,1
     95c:	12079663          	bnez	a5,a88 <main+0x3ea>
  if (results[0].execs & ID_MATRIX) for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
     960:	57f2                	lw	a5,60(sp)
     962:	8b89                	and	a5,a5,2
     964:	14079b63          	bnez	a5,aba <main+0x41c>
  if (results[0].execs & ID_STATE)  for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
     968:	57f2                	lw	a5,60(sp)
     96a:	8b91                	and	a5,a5,4
     96c:	18079063          	bnez	a5,aec <main+0x44e>
     970:	4481                	li	s1,0
  for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
     972:	04400993          	li	s3,68
     976:	6a11                	lui	s4,0x4
     978:	53492783          	lw	a5,1332(s2)
     97c:	16f4cd63          	blt	s1,a5,af6 <main+0x458>

  if (total_errors == 0) {
     980:	18041b63          	bnez	s0,b16 <main+0x478>
    ee_printf("Correct operation validated. See README.md for run and reporting rules.\n");
     984:	6511                	lui	a0,0x4
     986:	67850513          	add	a0,a0,1656 # 4678 <__fini_array_end+0x1b4>
    }
#endif
  } else if (total_errors > 0) {
    ee_printf("Errors detected\n");
  } else {
    ee_printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
     98a:	7b3010ef          	jal	293c <puts>

#if (MEM_METHOD == MEM_MALLOC)
  for (i = 0; i < MULTITHREAD; i++) portable_free(results[i].memblock[0]);
#endif

  portable_fini(&(results[0].port));
     98e:	05e10513          	add	a0,sp,94
     992:	259d                	jal	ff8 <portable_fini>
  return MAIN_RETURN_VAL;
}
     994:	50f6                	lw	ra,124(sp)
     996:	5466                	lw	s0,120(sp)
     998:	54d6                	lw	s1,116(sp)
     99a:	5946                	lw	s2,112(sp)
     99c:	59b6                	lw	s3,108(sp)
     99e:	5a26                	lw	s4,104(sp)
     9a0:	5a96                	lw	s5,100(sp)
     9a2:	4501                	li	a0,0
     9a4:	6109                	add	sp,sp,128
     9a6:	8082                	ret
  switch (seedcrc) {
     9a8:	67a5                	lui	a5,0x9
     9aa:	a0278793          	add	a5,a5,-1534 # 8a02 <__crt0_copy_data_src_begin+0x3ce6>
     9ae:	00f50e63          	beq	a0,a5,9ca <main+0x32c>
     9b2:	67bd                	lui	a5,0xf
     9b4:	9f578793          	add	a5,a5,-1547 # e9f5 <__crt0_copy_data_src_begin+0x9cd9>
     9b8:	547d                	li	s0,-1
     9ba:	ecf513e3          	bne	a0,a5,880 <main+0x1e2>
    case 0xe9f5: known_id = 3; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K performance run parameters for coremark.\n"); break;
     9be:	478d                	li	a5,3
     9c0:	bd51                	j	854 <main+0x1b6>
  switch (seedcrc) {
     9c2:	4785                	li	a5,1
     9c4:	bd41                	j	854 <main+0x1b6>
    case 0x18f2: known_id = 4; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K validation run parameters for coremark.\n"); break;
     9c6:	4791                	li	a5,4
     9c8:	b571                	j	854 <main+0x1b6>
    case 0x8a02: known_id = 0; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k performance run parameters for coremark.\n"); break;
     9ca:	4781                	li	a5,0
     9cc:	b561                	j	854 <main+0x1b6>
      results[i].err = 0;
     9ce:	030607b3          	mul	a5,a2,a6
     9d2:	06078793          	add	a5,a5,96
     9d6:	978a                	add	a5,a5,sp
      if ((results[i].execs & ID_LIST)   && (results[i].crclist   != list_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",   i, results[i].crclist,   list_known_crc[known_id]);   results[i].err++; }
     9d8:	fdc7a683          	lw	a3,-36(a5)
      results[i].err = 0;
     9dc:	fe079e23          	sh	zero,-4(a5)
      if ((results[i].execs & ID_LIST)   && (results[i].crclist   != list_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",   i, results[i].crclist,   list_known_crc[known_id]);   results[i].err++; }
     9e0:	0016f893          	and	a7,a3,1
     9e4:	00088a63          	beqz	a7,9f8 <main+0x35a>
     9e8:	ff67de83          	lhu	t4,-10(a5)
     9ec:	0005d883          	lhu	a7,0(a1)
     9f0:	011e8463          	beq	t4,a7,9f8 <main+0x35a>
     9f4:	ffc79e23          	sh	t3,-4(a5)
      if ((results[i].execs & ID_MATRIX) && (results[i].crcmatrix != matrix_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n", i, results[i].crcmatrix, matrix_known_crc[known_id]); results[i].err++; }
     9f8:	0026f793          	and	a5,a3,2
     9fc:	c38d                	beqz	a5,a1e <main+0x380>
     9fe:	030607b3          	mul	a5,a2,a6
     a02:	00055883          	lhu	a7,0(a0)
     a06:	06078793          	add	a5,a5,96
     a0a:	978a                	add	a5,a5,sp
     a0c:	ff87de83          	lhu	t4,-8(a5)
     a10:	011e8763          	beq	t4,a7,a1e <main+0x380>
     a14:	ffc7d883          	lhu	a7,-4(a5)
     a18:	0885                	add	a7,a7,1
     a1a:	ff179e23          	sh	a7,-4(a5)
      if ((results[i].execs & ID_STATE)  && (results[i].crcstate  != state_known_crc[known_id])) { if (!COREMARK_MINIMAL_PRINT) ee_printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",  i, results[i].crcstate,  state_known_crc[known_id]);  results[i].err++; }
     a1e:	8a91                	and	a3,a3,4
     a20:	c28d                	beqz	a3,a42 <main+0x3a4>
     a22:	030607b3          	mul	a5,a2,a6
     a26:	00075683          	lhu	a3,0(a4)
     a2a:	06078793          	add	a5,a5,96
     a2e:	978a                	add	a5,a5,sp
     a30:	ffa7d883          	lhu	a7,-6(a5)
     a34:	00d88763          	beq	a7,a3,a42 <main+0x3a4>
     a38:	ffc7d683          	lhu	a3,-4(a5)
     a3c:	0685                	add	a3,a3,1
     a3e:	fed79e23          	sh	a3,-4(a5)
      total_errors += results[i].err;
     a42:	030607b3          	mul	a5,a2,a6
    for (i = 0; i < default_num_contexts; i++) {
     a46:	0605                	add	a2,a2,1
     a48:	0642                	sll	a2,a2,0x10
     a4a:	8241                	srl	a2,a2,0x10
      total_errors += results[i].err;
     a4c:	06078793          	add	a5,a5,96
     a50:	978a                	add	a5,a5,sp
     a52:	ffc7d783          	lhu	a5,-4(a5)
     a56:	97a2                	add	a5,a5,s0
     a58:	01079413          	sll	s0,a5,0x10
     a5c:	8441                	sra	s0,s0,0x10
    for (i = 0; i < default_num_contexts; i++) {
     a5e:	bd39                	j	87c <main+0x1de>
  if (results[0].execs & ID_LIST)   for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
     a60:	033487b3          	mul	a5,s1,s3
     a64:	85a6                	mv	a1,s1
     a66:	0485                	add	s1,s1,1
     a68:	608a0513          	add	a0,s4,1544 # 4608 <__fini_array_end+0x144>
     a6c:	04c2                	sll	s1,s1,0x10
     a6e:	80c1                	srl	s1,s1,0x10
     a70:	06078793          	add	a5,a5,96
     a74:	978a                	add	a5,a5,sp
     a76:	ff67d603          	lhu	a2,-10(a5)
     a7a:	30d000ef          	jal	1586 <printf>
     a7e:	53492783          	lw	a5,1332(s2)
     a82:	fcf4cfe3          	blt	s1,a5,a60 <main+0x3c2>
     a86:	bde9                	j	960 <main+0x2c2>
     a88:	4481                	li	s1,0
     a8a:	04400993          	li	s3,68
     a8e:	6a11                	lui	s4,0x4
     a90:	b7fd                	j	a7e <main+0x3e0>
  if (results[0].execs & ID_MATRIX) for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
     a92:	033487b3          	mul	a5,s1,s3
     a96:	85a6                	mv	a1,s1
     a98:	0485                	add	s1,s1,1
     a9a:	624a0513          	add	a0,s4,1572 # 4624 <__fini_array_end+0x160>
     a9e:	04c2                	sll	s1,s1,0x10
     aa0:	80c1                	srl	s1,s1,0x10
     aa2:	06078793          	add	a5,a5,96
     aa6:	978a                	add	a5,a5,sp
     aa8:	ff87d603          	lhu	a2,-8(a5)
     aac:	2db000ef          	jal	1586 <printf>
     ab0:	53492783          	lw	a5,1332(s2)
     ab4:	fcf4cfe3          	blt	s1,a5,a92 <main+0x3f4>
     ab8:	bd45                	j	968 <main+0x2ca>
     aba:	4481                	li	s1,0
     abc:	04400993          	li	s3,68
     ac0:	6a11                	lui	s4,0x4
     ac2:	b7fd                	j	ab0 <main+0x412>
  if (results[0].execs & ID_STATE)  for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
     ac4:	033487b3          	mul	a5,s1,s3
     ac8:	85a6                	mv	a1,s1
     aca:	0485                	add	s1,s1,1
     acc:	640a0513          	add	a0,s4,1600 # 4640 <__fini_array_end+0x17c>
     ad0:	04c2                	sll	s1,s1,0x10
     ad2:	80c1                	srl	s1,s1,0x10
     ad4:	06078793          	add	a5,a5,96
     ad8:	978a                	add	a5,a5,sp
     ada:	ffa7d603          	lhu	a2,-6(a5)
     ade:	2a9000ef          	jal	1586 <printf>
     ae2:	53492783          	lw	a5,1332(s2)
     ae6:	fcf4cfe3          	blt	s1,a5,ac4 <main+0x426>
     aea:	b559                	j	970 <main+0x2d2>
     aec:	4481                	li	s1,0
     aee:	04400993          	li	s3,68
     af2:	6a11                	lui	s4,0x4
     af4:	b7fd                	j	ae2 <main+0x444>
  for (i = 0; i < default_num_contexts; i++) ee_printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
     af6:	033487b3          	mul	a5,s1,s3
     afa:	85a6                	mv	a1,s1
     afc:	0485                	add	s1,s1,1
     afe:	65ca0513          	add	a0,s4,1628 # 465c <__fini_array_end+0x198>
     b02:	04c2                	sll	s1,s1,0x10
     b04:	80c1                	srl	s1,s1,0x10
     b06:	06078793          	add	a5,a5,96
     b0a:	978a                	add	a5,a5,sp
     b0c:	ff47d603          	lhu	a2,-12(a5)
     b10:	277000ef          	jal	1586 <printf>
     b14:	b595                	j	978 <main+0x2da>
  } else if (total_errors > 0) {
     b16:	00805663          	blez	s0,b22 <main+0x484>
    ee_printf("Errors detected\n");
     b1a:	6511                	lui	a0,0x4
     b1c:	6c050513          	add	a0,a0,1728 # 46c0 <__fini_array_end+0x1fc>
     b20:	b5ad                	j	98a <main+0x2ec>
    ee_printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
     b22:	6511                	lui	a0,0x4
     b24:	6d050513          	add	a0,a0,1744 # 46d0 <__fini_array_end+0x20c>
     b28:	b58d                	j	98a <main+0x2ec>

00000b2a <core_init_matrix>:
  MATDAT *B;
  ee_s32  order = 1;
  MATDAT  val;
  ee_u32  i = 0, j = 0;

  if (seed == 0) seed = 1;
     b2a:	c631                	beqz	a2,b76 <core_init_matrix+0x4c>
     b2c:	4701                	li	a4,0
     b2e:	4781                	li	a5,0
     b30:	a029                	j	b3a <core_init_matrix+0x10>
  while (j < blksize) { i++; j = i * i * 2 * 4; }
     b32:	0785                	add	a5,a5,1
     b34:	02f78733          	mul	a4,a5,a5
     b38:	070e                	sll	a4,a4,0x3
     b3a:	fea76ce3          	bltu	a4,a0,b32 <core_init_matrix+0x8>
  N = i - 1;
     b3e:	fff78513          	add	a0,a5,-1

  A = (MATDAT *)align_mem(memblk);
  B = A + N * N;
     b42:	02a50333          	mul	t1,a0,a0
  A = (MATDAT *)align_mem(memblk);
     b46:	fff58713          	add	a4,a1,-1
     b4a:	9b71                	and	a4,a4,-4
     b4c:	0711                	add	a4,a4,4

  for (i = 0; i < N; i++) {
     b4e:	4e81                	li	t4,0
     b50:	4e01                	li	t3,0
  ee_s32  order = 1;
     b52:	4585                	li	a1,1
    for (j = 0; j < N; j++) {
      seed         = ((order * seed) % 65536);
     b54:	62c1                	lui	t0,0x10
  B = A + N * N;
     b56:	0306                	sll	t1,t1,0x1
     b58:	006707b3          	add	a5,a4,t1
      val          = (seed + order);
      val          = matrix_clip(val, 0);
      B[i * N + j] = val;
      val          = (val + order);
      val          = matrix_clip(val, 1);
      A[i * N + j] = val;
     b5c:	406003b3          	neg	t2,t1
  for (i = 0; i < N; i++) {
     b60:	06aeed63          	bltu	t4,a0,bda <core_init_matrix+0xb0>
      order++;
    }
  }

  p->A = A;
  p->B = B;
     b64:	c69c                	sw	a5,8(a3)
  p->C = (MATRES *)align_mem(B + N * N);
     b66:	979a                	add	a5,a5,t1
     b68:	17fd                	add	a5,a5,-1
     b6a:	9bf1                	and	a5,a5,-4
     b6c:	0791                	add	a5,a5,4
  p->A = A;
     b6e:	c2d8                	sw	a4,4(a3)
  p->C = (MATRES *)align_mem(B + N * N);
     b70:	c6dc                	sw	a5,12(a3)
  p->N = N;
     b72:	c288                	sw	a0,0(a3)
#if CORE_DEBUG
  printmat(A, N, "A");
  printmat(B, N, "B");
#endif
  return N;
}
     b74:	8082                	ret
  if (seed == 0) seed = 1;
     b76:	4605                	li	a2,1
     b78:	bf55                	j	b2c <core_init_matrix+0x2>
      seed         = ((order * seed) % 65536);
     b7a:	02b60633          	mul	a2,a2,a1
     b7e:	01059f93          	sll	t6,a1,0x10
     b82:	010fdf93          	srl	t6,t6,0x10
      A[i * N + j] = val;
     b86:	01138433          	add	s0,t2,a7
      order++;
     b8a:	0585                	add	a1,a1,1
    for (j = 0; j < N; j++) {
     b8c:	0889                	add	a7,a7,2
      seed         = ((order * seed) % 65536);
     b8e:	02566633          	rem	a2,a2,t0
      val          = (seed + order);
     b92:	00cf8833          	add	a6,t6,a2
     b96:	0842                	sll	a6,a6,0x10
     b98:	01085813          	srl	a6,a6,0x10
      B[i * N + j] = val;
     b9c:	ff089f23          	sh	a6,-2(a7)
      val          = (val + order);
     ba0:	987e                	add	a6,a6,t6
      val          = matrix_clip(val, 1);
     ba2:	0ff87813          	zext.b	a6,a6
      A[i * N + j] = val;
     ba6:	01041023          	sh	a6,0(s0)
    for (j = 0; j < N; j++) {
     baa:	fcbf18e3          	bne	t5,a1,b7a <core_init_matrix+0x50>
  for (i = 0; i < N; i++) {
     bae:	0e85                	add	t4,t4,1
     bb0:	9e2a                	add	t3,t3,a0
     bb2:	85fa                	mv	a1,t5
     bb4:	00aef863          	bgeu	t4,a0,bc4 <core_init_matrix+0x9a>
    for (j = 0; j < N; j++) {
     bb8:	001e1893          	sll	a7,t3,0x1
     bbc:	98be                	add	a7,a7,a5
     bbe:	00a58f33          	add	t5,a1,a0
     bc2:	bf65                	j	b7a <core_init_matrix+0x50>
  p->B = B;
     bc4:	c69c                	sw	a5,8(a3)
  p->C = (MATRES *)align_mem(B + N * N);
     bc6:	979a                	add	a5,a5,t1
     bc8:	17fd                	add	a5,a5,-1
}
     bca:	4432                	lw	s0,12(sp)
  p->C = (MATRES *)align_mem(B + N * N);
     bcc:	9bf1                	and	a5,a5,-4
     bce:	0791                	add	a5,a5,4
  p->A = A;
     bd0:	c2d8                	sw	a4,4(a3)
  p->C = (MATRES *)align_mem(B + N * N);
     bd2:	c6dc                	sw	a5,12(a3)
  p->N = N;
     bd4:	c288                	sw	a0,0(a3)
}
     bd6:	0141                	add	sp,sp,16
     bd8:	8082                	ret
ee_u32 core_init_matrix(ee_u32 blksize, void *memblk, ee_s32 seed, mat_params *p) {
     bda:	1141                	add	sp,sp,-16
     bdc:	c622                	sw	s0,12(sp)
     bde:	bfe9                	j	bb8 <core_init_matrix+0x8e>

00000be0 <matrix_sum>:

/* Function: matrix_sum */
ee_s16 matrix_sum(ee_u32 N, MATRES *C, MATDAT clipval) {
     be0:	86aa                	mv	a3,a0
  MATRES tmp = 0, prev = 0, cur = 0;
  ee_s16 ret = 0;
  ee_u32 i, j;

  for (i = 0; i < N; i++) {
     be2:	4e01                	li	t3,0
     be4:	4e81                	li	t4,0
  ee_s16 ret = 0;
     be6:	4501                	li	a0,0
  MATRES tmp = 0, prev = 0, cur = 0;
     be8:	4881                	li	a7,0
     bea:	4801                	li	a6,0
  for (i = 0; i < N; i++) {
     bec:	04de8263          	beq	t4,a3,c30 <matrix_sum+0x50>
    for (j = 0; j < N; j++) {
     bf0:	002e1713          	sll	a4,t3,0x2
     bf4:	972e                	add	a4,a4,a1
     bf6:	4301                	li	t1,0
      cur = C[i * N + j];
     bf8:	8f46                	mv	t5,a7
     bfa:	00072883          	lw	a7,0(a4)
      tmp += cur;
      if (tmp > clipval) { ret += 10; tmp = 0; }
     bfe:	01051793          	sll	a5,a0,0x10
     c02:	83c1                	srl	a5,a5,0x10
      tmp += cur;
     c04:	9846                	add	a6,a6,a7
      if (tmp > clipval) { ret += 10; tmp = 0; }
     c06:	01065e63          	bge	a2,a6,c22 <matrix_sum+0x42>
     c0a:	07a9                	add	a5,a5,10
     c0c:	01079513          	sll	a0,a5,0x10
     c10:	8541                	sra	a0,a0,0x10
     c12:	4801                	li	a6,0
    for (j = 0; j < N; j++) {
     c14:	0305                	add	t1,t1,1
     c16:	0711                	add	a4,a4,4
     c18:	fe6690e3          	bne	a3,t1,bf8 <matrix_sum+0x18>
  for (i = 0; i < N; i++) {
     c1c:	0e85                	add	t4,t4,1
     c1e:	9e36                	add	t3,t3,a3
     c20:	b7f1                	j	bec <matrix_sum+0xc>
      else               { ret += (cur > prev) ? 1 : 0; }
     c22:	011f2f33          	slt	t5,t5,a7
     c26:	97fa                	add	a5,a5,t5
     c28:	01079513          	sll	a0,a5,0x10
     c2c:	8541                	sra	a0,a0,0x10
     c2e:	b7dd                	j	c14 <matrix_sum+0x34>
      prev = cur;
    }
  }
  return ret;
}
     c30:	8082                	ret

00000c32 <matrix_mul_const>:

/* Function: matrix_mul_const */
void matrix_mul_const(ee_u32 N, MATRES *C, MATDAT *A, MATDAT val) {
     c32:	83b6                	mv	t2,a3
  ee_u32 i, j;
  for (i = 0; i < N; i++) {
     c34:	4801                	li	a6,0
     c36:	4881                	li	a7,0
     c38:	00a89363          	bne	a7,a0,c3e <matrix_mul_const+0xc>
#else
      C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
#endif
    }
  }
}
     c3c:	8082                	ret
     c3e:	00181713          	sll	a4,a6,0x1
     c42:	00281793          	sll	a5,a6,0x2
     c46:	9732                	add	a4,a4,a2
     c48:	97ae                	add	a5,a5,a1
    for (j = 0; j < N; j++) {
     c4a:	4681                	li	a3,0
      C[i * N + j] = (MATRES) cfu_mul32((int32_t)A[i * N + j], (int32_t)val);
     c4c:	00071303          	lh	t1,0(a4)
  register int32_t _rd  asm("t0");     /* x5 */
     c50:	0073028b          	.word	0x0073028b
      C[i * N + j] = (MATRES) cfu_mul32((int32_t)A[i * N + j], (int32_t)val);
     c54:	0057a023          	sw	t0,0(a5)
    for (j = 0; j < N; j++) {
     c58:	0685                	add	a3,a3,1
     c5a:	0709                	add	a4,a4,2
     c5c:	0791                	add	a5,a5,4
     c5e:	fed517e3          	bne	a0,a3,c4c <matrix_mul_const+0x1a>
  for (i = 0; i < N; i++) {
     c62:	0885                	add	a7,a7,1
     c64:	982a                	add	a6,a6,a0
     c66:	bfc9                	j	c38 <matrix_mul_const+0x6>

00000c68 <matrix_add_const>:

/* Function: matrix_add_const */
void matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val) {
  ee_u32 i, j;
  for (i = 0; i < N; i++) {
     c68:	4681                	li	a3,0
     c6a:	4701                	li	a4,0
     c6c:	00a71363          	bne	a4,a0,c72 <matrix_add_const+0xa>
    for (j = 0; j < N; j++) {
      A[i * N + j] += val;
    }
  }
}
     c70:	8082                	ret
     c72:	00169793          	sll	a5,a3,0x1
     c76:	97ae                	add	a5,a5,a1
    for (j = 0; j < N; j++) {
     c78:	4801                	li	a6,0
      A[i * N + j] += val;
     c7a:	0007d883          	lhu	a7,0(a5)
    for (j = 0; j < N; j++) {
     c7e:	0805                	add	a6,a6,1
     c80:	0789                	add	a5,a5,2
      A[i * N + j] += val;
     c82:	98b2                	add	a7,a7,a2
     c84:	ff179f23          	sh	a7,-2(a5)
    for (j = 0; j < N; j++) {
     c88:	ff0519e3          	bne	a0,a6,c7a <matrix_add_const+0x12>
  for (i = 0; i < N; i++) {
     c8c:	0705                	add	a4,a4,1
     c8e:	96aa                	add	a3,a3,a0
     c90:	bff1                	j	c6c <matrix_add_const+0x4>

00000c92 <matrix_mul_vect>:

/* Function: matrix_mul_vect */
void matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
  ee_u32 i, j;
  for (i = 0; i < N; i++) {
     c92:	4881                	li	a7,0
     c94:	4701                	li	a4,0
     c96:	00a71363          	bne	a4,a0,c9c <matrix_mul_vect+0xa>
      acc += (MATRES)A[i * N + j] * (MATRES)B[j];
#endif
    }
    C[i] = (MATRES)acc;
  }
}
     c9a:	8082                	ret
     c9c:	00189793          	sll	a5,a7,0x1
     ca0:	97b2                	add	a5,a5,a2
    int32_t acc = 0;
     ca2:	4e01                	li	t3,0
    for (j = 0; j < N; j++) {
     ca4:	4801                	li	a6,0
      acc += cfu_mul32((int32_t)A[i * N + j], (int32_t)B[j]);
     ca6:	00181e93          	sll	t4,a6,0x1
     caa:	9eb6                	add	t4,t4,a3
     cac:	00079303          	lh	t1,0(a5)
  register int32_t _rs2 asm("t2") = b; /* x7 */
     cb0:	000e9383          	lh	t2,0(t4)
  register int32_t _rd  asm("t0");     /* x5 */
     cb4:	0073028b          	.word	0x0073028b
    for (j = 0; j < N; j++) {
     cb8:	0805                	add	a6,a6,1
      acc += cfu_mul32((int32_t)A[i * N + j], (int32_t)B[j]);
     cba:	9e16                	add	t3,t3,t0
    for (j = 0; j < N; j++) {
     cbc:	0789                	add	a5,a5,2
     cbe:	ff0514e3          	bne	a0,a6,ca6 <matrix_mul_vect+0x14>
    C[i] = (MATRES)acc;
     cc2:	00271793          	sll	a5,a4,0x2
     cc6:	97ae                	add	a5,a5,a1
     cc8:	01c7a023          	sw	t3,0(a5)
  for (i = 0; i < N; i++) {
     ccc:	0705                	add	a4,a4,1
     cce:	98aa                	add	a7,a7,a0
     cd0:	b7d9                	j	c96 <matrix_mul_vect+0x4>

00000cd2 <matrix_mul_matrix>:

/* Function: matrix_mul_matrix */
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
     cd2:	1141                	add	sp,sp,-16
     cd4:	c426                	sw	s1,8(sp)
     cd6:	c622                	sw	s0,12(sp)
     cd8:	00151493          	sll	s1,a0,0x1
  ee_u32 i, j, k;
  for (i = 0; i < N; i++) {
     cdc:	4881                	li	a7,0
     cde:	4f01                	li	t5,0
     ce0:	04af0963          	beq	t5,a0,d32 <matrix_mul_matrix+0x60>
     ce4:	00289793          	sll	a5,a7,0x2
     ce8:	00189e93          	sll	t4,a7,0x1
     cec:	97ae                	add	a5,a5,a1
     cee:	9eb2                	add	t4,t4,a2
    for (j = 0; j < N; j++) {
     cf0:	4801                	li	a6,0
     cf2:	a035                	j	d1e <matrix_mul_matrix+0x4c>
      int32_t acc = 0;
      for (k = 0; k < N; k++) {
#ifdef USE_CFU
        acc += cfu_mul32((int32_t)A[i * N + k], (int32_t)B[k * N + j]);
     cf4:	00041303          	lh	t1,0(s0)
  register int32_t _rs2 asm("t2") = b; /* x7 */
     cf8:	00071383          	lh	t2,0(a4)
  register int32_t _rd  asm("t0");     /* x5 */
     cfc:	0073028b          	.word	0x0073028b
  return _rd;
     d00:	8372                	mv	t1,t3
      for (k = 0; k < N; k++) {
     d02:	0e05                	add	t3,t3,1
        acc += cfu_mul32((int32_t)A[i * N + k], (int32_t)B[k * N + j]);
     d04:	9f96                	add	t6,t6,t0
      for (k = 0; k < N; k++) {
     d06:	0409                	add	s0,s0,2
     d08:	9726                	add	a4,a4,s1
     d0a:	ffc515e3          	bne	a0,t3,cf4 <matrix_mul_matrix+0x22>
#else
        acc += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
#endif
      }
      C[i * N + j] = (MATRES)acc;
     d0e:	01f7a023          	sw	t6,0(a5)
    for (j = 0; j < N; j++) {
     d12:	00180713          	add	a4,a6,1
     d16:	0791                	add	a5,a5,4
     d18:	00680a63          	beq	a6,t1,d2c <matrix_mul_matrix+0x5a>
     d1c:	883a                	mv	a6,a4
      for (k = 0; k < N; k++) {
     d1e:	00181713          	sll	a4,a6,0x1
     d22:	9736                	add	a4,a4,a3
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
     d24:	8476                	mv	s0,t4
      int32_t acc = 0;
     d26:	4f81                	li	t6,0
      for (k = 0; k < N; k++) {
     d28:	4e01                	li	t3,0
     d2a:	b7e9                	j	cf4 <matrix_mul_matrix+0x22>
  for (i = 0; i < N; i++) {
     d2c:	0f05                	add	t5,t5,1
     d2e:	98aa                	add	a7,a7,a0
     d30:	bf45                	j	ce0 <matrix_mul_matrix+0xe>
    }
  }
}
     d32:	4432                	lw	s0,12(sp)
     d34:	44a2                	lw	s1,8(sp)
     d36:	0141                	add	sp,sp,16
     d38:	8082                	ret

00000d3a <matrix_mul_matrix_bitextract>:

/* Function: matrix_mul_matrix_bitextract */
void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
     d3a:	1141                	add	sp,sp,-16
     d3c:	c622                	sw	s0,12(sp)
     d3e:	c426                	sw	s1,8(sp)
     d40:	c24a                	sw	s2,4(sp)
  ee_u32 i, j, k;
  for (i = 0; i < N; i++) {
     d42:	4401                	li	s0,0
     d44:	00151913          	sll	s2,a0,0x1
     d48:	4481                	li	s1,0
     d4a:	06a48363          	beq	s1,a0,db0 <matrix_mul_matrix_bitextract+0x76>
     d4e:	00241793          	sll	a5,s0,0x2
     d52:	00141e93          	sll	t4,s0,0x1
     d56:	97ae                	add	a5,a5,a1
     d58:	9eb2                	add	t4,t4,a2
    for (j = 0; j < N; j++) {
     d5a:	4881                	li	a7,0
     d5c:	a081                	j	d9c <matrix_mul_matrix_bitextract+0x62>
      int32_t acc = 0;
      for (k = 0; k < N; k++) {
#ifdef USE_CFU
        int32_t tmp = cfu_mul32((int32_t)A[i * N + k], (int32_t)B[k * N + j]);
     d5e:	000f9303          	lh	t1,0(t6)
  register int32_t _rs2 asm("t2") = b; /* x7 */
     d62:	00071383          	lh	t2,0(a4)
  register int32_t _rd  asm("t0");     /* x5 */
     d66:	0073028b          	.word	0x0073028b
#else
        int32_t tmp = (int32_t)((MATRES)A[i * N + k] * (MATRES)B[k * N + j]);
#endif
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     d6a:	0022d813          	srl	a6,t0,0x2
                        * bit_extract((uint32_t)tmp, 5, 7) );
     d6e:	0052d293          	srl	t0,t0,0x5
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     d72:	00f87813          	and	a6,a6,15
                        * bit_extract((uint32_t)tmp, 5, 7) );
     d76:	07f2f293          	and	t0,t0,127
     d7a:	02580833          	mul	a6,a6,t0
      for (k = 0; k < N; k++) {
     d7e:	0f89                	add	t6,t6,2
     d80:	974a                	add	a4,a4,s2
        acc += (int32_t)( bit_extract((uint32_t)tmp, 2, 4)
     d82:	9f42                	add	t5,t5,a6
      for (k = 0; k < N; k++) {
     d84:	8872                	mv	a6,t3
     d86:	0e05                	add	t3,t3,1
     d88:	fdc51be3          	bne	a0,t3,d5e <matrix_mul_matrix_bitextract+0x24>
      }
      C[i * N + j] = (MATRES)acc;
     d8c:	01e7a023          	sw	t5,0(a5)
    for (j = 0; j < N; j++) {
     d90:	00188713          	add	a4,a7,1
     d94:	0791                	add	a5,a5,4
     d96:	01088a63          	beq	a7,a6,daa <matrix_mul_matrix_bitextract+0x70>
     d9a:	88ba                	mv	a7,a4
      for (k = 0; k < N; k++) {
     d9c:	00189713          	sll	a4,a7,0x1
     da0:	9736                	add	a4,a4,a3
void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
     da2:	8ff6                	mv	t6,t4
      int32_t acc = 0;
     da4:	4f01                	li	t5,0
      for (k = 0; k < N; k++) {
     da6:	4e01                	li	t3,0
     da8:	bf5d                	j	d5e <matrix_mul_matrix_bitextract+0x24>
  for (i = 0; i < N; i++) {
     daa:	0485                	add	s1,s1,1
     dac:	942a                	add	s0,s0,a0
     dae:	bf71                	j	d4a <matrix_mul_matrix_bitextract+0x10>
    }
  }
}
     db0:	4432                	lw	s0,12(sp)
     db2:	44a2                	lw	s1,8(sp)
     db4:	4912                	lw	s2,4(sp)
     db6:	0141                	add	sp,sp,16
     db8:	8082                	ret

00000dba <matrix_test>:
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val) {
     dba:	1101                	add	sp,sp,-32
     dbc:	c84a                	sw	s2,16(sp)
     dbe:	8932                	mv	s2,a2
     dc0:	ca26                	sw	s1,20(sp)
  matrix_add_const(N, A, val);
     dc2:	863a                	mv	a2,a4
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val) {
     dc4:	c452                	sw	s4,8(sp)
     dc6:	84ae                	mv	s1,a1
  MATDAT clipval = matrix_big(val);
     dc8:	7a7d                	lui	s4,0xfffff
  matrix_add_const(N, A, val);
     dca:	85ca                	mv	a1,s2
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val) {
     dcc:	ce06                	sw	ra,28(sp)
  MATDAT clipval = matrix_big(val);
     dce:	01476a33          	or	s4,a4,s4
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val) {
     dd2:	cc22                	sw	s0,24(sp)
     dd4:	c64e                	sw	s3,12(sp)
     dd6:	c256                	sw	s5,4(sp)
     dd8:	89ba                	mv	s3,a4
     dda:	c05a                	sw	s6,0(sp)
     ddc:	842a                	mv	s0,a0
     dde:	8ab6                	mv	s5,a3
  matrix_add_const(N, A, val);
     de0:	3561                	jal	c68 <matrix_add_const>
  matrix_mul_const(N, C, A, val);
     de2:	86ce                	mv	a3,s3
     de4:	864a                	mv	a2,s2
     de6:	85a6                	mv	a1,s1
     de8:	8522                	mv	a0,s0
     dea:	35a1                	jal	c32 <matrix_mul_const>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     dec:	8652                	mv	a2,s4
     dee:	85a6                	mv	a1,s1
     df0:	8522                	mv	a0,s0
     df2:	33fd                	jal	be0 <matrix_sum>
     df4:	4581                	li	a1,0
     df6:	236d                	jal	13a0 <crc16>
  matrix_mul_vect(N, C, A, B);
     df8:	86d6                	mv	a3,s5
  crc = crc16(matrix_sum(N, C, clipval), crc);
     dfa:	8b2a                	mv	s6,a0
  matrix_mul_vect(N, C, A, B);
     dfc:	864a                	mv	a2,s2
     dfe:	85a6                	mv	a1,s1
     e00:	8522                	mv	a0,s0
     e02:	3d41                	jal	c92 <matrix_mul_vect>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e04:	8652                	mv	a2,s4
     e06:	85a6                	mv	a1,s1
     e08:	8522                	mv	a0,s0
     e0a:	3bd9                	jal	be0 <matrix_sum>
     e0c:	85da                	mv	a1,s6
     e0e:	2b49                	jal	13a0 <crc16>
  matrix_mul_matrix(N, C, A, B);
     e10:	86d6                	mv	a3,s5
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e12:	8b2a                	mv	s6,a0
  matrix_mul_matrix(N, C, A, B);
     e14:	864a                	mv	a2,s2
     e16:	85a6                	mv	a1,s1
     e18:	8522                	mv	a0,s0
     e1a:	3d65                	jal	cd2 <matrix_mul_matrix>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e1c:	8652                	mv	a2,s4
     e1e:	85a6                	mv	a1,s1
     e20:	8522                	mv	a0,s0
     e22:	3b7d                	jal	be0 <matrix_sum>
     e24:	85da                	mv	a1,s6
     e26:	2bad                	jal	13a0 <crc16>
  matrix_mul_matrix_bitextract(N, C, A, B);
     e28:	86d6                	mv	a3,s5
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e2a:	8b2a                	mv	s6,a0
  matrix_mul_matrix_bitextract(N, C, A, B);
     e2c:	864a                	mv	a2,s2
     e2e:	85a6                	mv	a1,s1
     e30:	8522                	mv	a0,s0
     e32:	3721                	jal	d3a <matrix_mul_matrix_bitextract>
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e34:	8652                	mv	a2,s4
     e36:	85a6                	mv	a1,s1
     e38:	8522                	mv	a0,s0
     e3a:	335d                	jal	be0 <matrix_sum>
     e3c:	85da                	mv	a1,s6
     e3e:	238d                	jal	13a0 <crc16>
  matrix_add_const(N, A, -val);
     e40:	41300633          	neg	a2,s3
     e44:	0642                	sll	a2,a2,0x10
  crc = crc16(matrix_sum(N, C, clipval), crc);
     e46:	84aa                	mv	s1,a0
  matrix_add_const(N, A, -val);
     e48:	85ca                	mv	a1,s2
     e4a:	8522                	mv	a0,s0
     e4c:	8641                	sra	a2,a2,0x10
     e4e:	3d29                	jal	c68 <matrix_add_const>
}
     e50:	40f2                	lw	ra,28(sp)
     e52:	4462                	lw	s0,24(sp)
     e54:	01049513          	sll	a0,s1,0x10
     e58:	4942                	lw	s2,16(sp)
     e5a:	44d2                	lw	s1,20(sp)
     e5c:	49b2                	lw	s3,12(sp)
     e5e:	4a22                	lw	s4,8(sp)
     e60:	4a92                	lw	s5,4(sp)
     e62:	4b02                	lw	s6,0(sp)
     e64:	8541                	sra	a0,a0,0x10
     e66:	6105                	add	sp,sp,32
     e68:	8082                	ret

00000e6a <core_bench_matrix>:
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
     e6a:	1141                	add	sp,sp,-16
     e6c:	c422                	sw	s0,8(sp)
  crc = crc16(matrix_test(N, C, A, B, val), crc);
     e6e:	4514                	lw	a3,8(a0)
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
     e70:	8432                	mv	s0,a2
     e72:	872e                	mv	a4,a1
  crc = crc16(matrix_test(N, C, A, B, val), crc);
     e74:	4150                	lw	a2,4(a0)
     e76:	454c                	lw	a1,12(a0)
     e78:	4108                	lw	a0,0(a0)
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
     e7a:	c606                	sw	ra,12(sp)
  crc = crc16(matrix_test(N, C, A, B, val), crc);
     e7c:	3f3d                	jal	dba <matrix_test>
     e7e:	85a2                	mv	a1,s0
}
     e80:	4422                	lw	s0,8(sp)
     e82:	40b2                	lw	ra,12(sp)
     e84:	0141                	add	sp,sp,16
  crc = crc16(matrix_test(N, C, A, B, val), crc);
     e86:	ab29                	j	13a0 <crc16>

00000e88 <start_time>:
CORETIMETYPE barebones_clock(void) {
  /* Not used by CoreMark when SAMPLE_TIME_IMPLEMENTATION is set; keep stub. */
  return 1;
}

void start_time(void) {
     e88:	1141                	add	sp,sp,-16
     e8a:	c606                	sw	ra,12(sp)
  GETMYTIME(&start_time_val);
     e8c:	497000ef          	jal	1b22 <neorv32_cpu_get_cycle>
     e90:	800007b7          	lui	a5,0x80000
     e94:	56a7a023          	sw	a0,1376(a5) # 80000560 <start_time_val>
     e98:	56b7a223          	sw	a1,1380(a5)
 * @param[in] data Data to write (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     e9c:	4781                	li	a5,0
     e9e:	32079073          	csrw	mcountinhibit,a5
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, 0); /* start all counters */
}
     ea2:	40b2                	lw	ra,12(sp)
     ea4:	0141                	add	sp,sp,16
     ea6:	8082                	ret

00000ea8 <stop_time>:

void stop_time(void) {
     ea8:	1141                	add	sp,sp,-16
     eaa:	c606                	sw	ra,12(sp)
     eac:	57fd                	li	a5,-1
     eae:	32079073          	csrw	mcountinhibit,a5
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1); /* stop all counters */
  GETMYTIME(&stop_time_val);
     eb2:	471000ef          	jal	1b22 <neorv32_cpu_get_cycle>
}
     eb6:	40b2                	lw	ra,12(sp)
  GETMYTIME(&stop_time_val);
     eb8:	800007b7          	lui	a5,0x80000
     ebc:	54a7ac23          	sw	a0,1368(a5) # 80000558 <stop_time_val>
     ec0:	54b7ae23          	sw	a1,1372(a5)
}
     ec4:	0141                	add	sp,sp,16
     ec6:	8082                	ret

00000ec8 <get_time>:

CORE_TICKS get_time(void) {
  return (CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
     ec8:	800006b7          	lui	a3,0x80000
     ecc:	80000737          	lui	a4,0x80000
     ed0:	5586a783          	lw	a5,1368(a3) # 80000558 <stop_time_val>
     ed4:	56072503          	lw	a0,1376(a4) # 80000560 <start_time_val>
     ed8:	55c6a583          	lw	a1,1372(a3)
     edc:	56472703          	lw	a4,1380(a4)
     ee0:	40a78533          	sub	a0,a5,a0
     ee4:	00a7b7b3          	sltu	a5,a5,a0
     ee8:	8d99                	sub	a1,a1,a4
}
     eea:	8d9d                	sub	a1,a1,a5
     eec:	8082                	ret

00000eee <time_in_secs>:
/**********************************************************************//**
 * Get current processor clock frequency.
 * @return Clock frequency in Hz.
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_sysinfo_get_clk(void) {
  return NEORV32_SYSINFO->CLK;
     eee:	7781                	lui	a5,0xfffe0
     ef0:	4390                	lw	a2,0(a5)

secs_ret time_in_secs(CORE_TICKS ticks) {
     ef2:	1141                	add	sp,sp,-16
  /* seconds = cycles / f_clk */
  secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
     ef4:	4681                	li	a3,0
secs_ret time_in_secs(CORE_TICKS ticks) {
     ef6:	c606                	sw	ra,12(sp)
  secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
     ef8:	224030ef          	jal	411c <__udivdi3>
  return retval;
}
     efc:	40b2                	lw	ra,12(sp)
     efe:	0141                	add	sp,sp,16
     f00:	8082                	ret

00000f02 <portable_init>:

/* --------------------------------------------------------------------------
 * Port hooks
 * -------------------------------------------------------------------------- */

void portable_init(core_portable *p, int *argc, char *argv[]) {
     f02:	1141                	add	sp,sp,-16
     f04:	c422                	sw	s0,8(sp)
     f06:	c226                	sw	s1,4(sp)
     f08:	c606                	sw	ra,12(sp)
     f0a:	84aa                	mv	s1,a0
     f0c:	4401                	li	s0,0
     f0e:	30441073          	csrw	mie,s0

  /* minimal runtime setup */
  neorv32_cpu_csr_write(CSR_MIE, 0);      /* disable global irq */
  neorv32_rte_setup();                    /* trap handler */
     f12:	290010ef          	jal	21a2 <neorv32_rte_setup>
  neorv32_uart0_setup(BAUD_RATE, 0);      /* UART init */
     f16:	6595                	lui	a1,0x5
     f18:	4601                	li	a2,0
     f1a:	b0058593          	add	a1,a1,-1280 # 4b00 <intpat+0x3c>
     f1e:	fff50537          	lui	a0,0xfff50
     f22:	2ee010ef          	jal	2210 <neorv32_uart_setup>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
     f26:	fc0027f3          	csrr	a5,0xfc0

  /* Ensure Zicntr exists (mcycle/minstret baseline) */
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1u << CSR_MXISA_ZICNTR)) == 0) {
     f2a:	0807f793          	and	a5,a5,128
     f2e:	e391                	bnez	a5,f32 <portable_init+0x30>
#if COREMARK_MINIMAL_PRINT == 0
    neorv32_uart0_printf("ERROR! No CPU base counters available (Zicntr)!\n");
#endif
    while (1) { /* halt */ }
     f30:	a001                	j	f30 <portable_init+0x2e>
  }

  /* Discover number of HPM counters */
  num_hpm_cnts_global = neorv32_cpu_hpm_get_num_counters();
     f32:	403000ef          	jal	1b34 <neorv32_cpu_hpm_get_num_counters>
     f36:	800007b7          	lui	a5,0x80000
     f3a:	54a7a823          	sw	a0,1360(a5) # 80000550 <num_hpm_cnts_global>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
     f3e:	57fd                	li	a5,-1
     f40:	32079073          	csrw	mcountinhibit,a5
     f44:	b0041073          	csrw	mcycle,s0
     f48:	b0241073          	csrw	minstret,s0
  /* zero base counters */
  neorv32_cpu_csr_write(CSR_MCYCLE, 0);
  neorv32_cpu_csr_write(CSR_MINSTRET, 0);

  /* set up a few HPMs if available (low words only) */
  if (num_hpm_cnts_global > 0)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER3,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT3,  1 << HPMCNT_EVENT_COMPR);    }
     f4c:	cd51                	beqz	a0,fe8 <portable_init+0xe6>
     f4e:	b0341073          	csrw	mhpmcounter3,s0
     f52:	47a1                	li	a5,8
     f54:	32379073          	csrw	mhpmevent3,a5
  if (num_hpm_cnts_global > 1)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER4,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT4,  1 << HPMCNT_EVENT_WAIT_DIS); }
     f58:	4705                	li	a4,1
     f5a:	08e50763          	beq	a0,a4,fe8 <portable_init+0xe6>
     f5e:	b0441073          	csrw	mhpmcounter4,s0
     f62:	4741                	li	a4,16
     f64:	32471073          	csrw	mhpmevent4,a4
  if (num_hpm_cnts_global > 2)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER5,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT5,  1 << HPMCNT_EVENT_WAIT_ALU); }
     f68:	4709                	li	a4,2
     f6a:	06e50f63          	beq	a0,a4,fe8 <portable_init+0xe6>
     f6e:	b0541073          	csrw	mhpmcounter5,s0
     f72:	02000713          	li	a4,32
     f76:	32571073          	csrw	mhpmevent5,a4
  if (num_hpm_cnts_global > 3)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER6,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT6,  1 << HPMCNT_EVENT_BRANCH);   }
     f7a:	470d                	li	a4,3
     f7c:	06e50663          	beq	a0,a4,fe8 <portable_init+0xe6>
     f80:	b0641073          	csrw	mhpmcounter6,s0
     f84:	04000713          	li	a4,64
     f88:	32671073          	csrw	mhpmevent6,a4
  if (num_hpm_cnts_global > 4)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER7,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT7,  1 << HPMCNT_EVENT_BRANCHED); }
     f8c:	4711                	li	a4,4
     f8e:	04e50d63          	beq	a0,a4,fe8 <portable_init+0xe6>
     f92:	b0741073          	csrw	mhpmcounter7,s0
     f96:	08000713          	li	a4,128
     f9a:	32771073          	csrw	mhpmevent7,a4
  if (num_hpm_cnts_global > 5)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER8,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT8,  1 << HPMCNT_EVENT_LOAD);     }
     f9e:	4715                	li	a4,5
     fa0:	04e50463          	beq	a0,a4,fe8 <portable_init+0xe6>
     fa4:	b0841073          	csrw	mhpmcounter8,s0
     fa8:	10000713          	li	a4,256
     fac:	32871073          	csrw	mhpmevent8,a4
  if (num_hpm_cnts_global > 6)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER9,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT9,  1 << HPMCNT_EVENT_STORE);    }
     fb0:	4719                	li	a4,6
     fb2:	02e50b63          	beq	a0,a4,fe8 <portable_init+0xe6>
     fb6:	b0941073          	csrw	mhpmcounter9,s0
     fba:	20000713          	li	a4,512
     fbe:	32971073          	csrw	mhpmevent9,a4
  if (num_hpm_cnts_global > 7)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER10, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT10, 1 << HPMCNT_EVENT_WAIT_LSU); }
     fc2:	471d                	li	a4,7
     fc4:	02e50263          	beq	a0,a4,fe8 <portable_init+0xe6>
     fc8:	b0a41073          	csrw	mhpmcounter10,s0
     fcc:	40000713          	li	a4,1024
     fd0:	32a71073          	csrw	mhpmevent10,a4
  if (num_hpm_cnts_global > 8)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER11, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT11, 1 << HPMCNT_EVENT_TRAP);     }
     fd4:	00f50a63          	beq	a0,a5,fe8 <portable_init+0xe6>
     fd8:	4781                	li	a5,0
     fda:	b0b79073          	csrw	mhpmcounter11,a5
     fde:	6785                	lui	a5,0x1
     fe0:	80078793          	add	a5,a5,-2048 # 800 <main+0x162>
     fe4:	32b79073          	csrw	mhpmevent11,a5
#if COREMARK_MINIMAL_PRINT == 0
    ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
#endif
  }

  p->portable_id = 1;
     fe8:	4785                	li	a5,1
     fea:	00f48023          	sb	a5,0(s1)
}
     fee:	40b2                	lw	ra,12(sp)
     ff0:	4422                	lw	s0,8(sp)
     ff2:	4492                	lw	s1,4(sp)
     ff4:	0141                	add	sp,sp,16
     ff6:	8082                	ret

00000ff8 <portable_fini>:

void portable_fini(core_portable *p) {
  p->portable_id = 0;
     ff8:	00050023          	sb	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
    if (num_hpm_cnts_global > 7)  neorv32_uart0_printf(" > Load/store wait cycles      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER10));
    if (num_hpm_cnts_global > 8)  neorv32_uart0_printf(" > Entered traps               : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER11));
  }
  neorv32_uart0_printf("\n");
#endif
}
     ffc:	8082                	ret

00000ffe <core_init_state>:
    ee_u8 *buf = 0;
#if CORE_DEBUG
    ee_u8 *start = p;
    ee_printf("State: %d,%d\n", size, seed);
#endif
    size--;
     ffe:	00158713          	add	a4,a1,1
{
    1002:	1101                	add	sp,sp,-32
    1004:	0742                	sll	a4,a4,0x10
            case 6: /* scientific */
                buf  = scipat[(seed >> 3) & 0x3];
                next = 8;
                break;
            case 7: /* invalid */
                buf  = errpat[(seed >> 3) & 0x3];
    1006:	6315                	lui	t1,0x5
                buf  = scipat[(seed >> 3) & 0x3];
    1008:	6e15                	lui	t3,0x5
                buf  = floatpat[(seed >> 3) & 0x3];
    100a:	6e95                	lui	t4,0x5
                buf  = intpat[(seed >> 3) & 0x3];
    100c:	6f15                	lui	t5,0x5
{
    100e:	ce22                	sw	s0,28(sp)
    1010:	cc26                	sw	s1,24(sp)
    1012:	ca4a                	sw	s2,20(sp)
    1014:	c84e                	sw	s3,16(sp)
    1016:	c652                	sw	s4,12(sp)
    1018:	88b2                	mv	a7,a2
    size--;
    101a:	fff50f93          	add	t6,a0,-1
    while ((total + next + 1) < size)
    101e:	8341                	srl	a4,a4,0x10
    ee_u8 *buf = 0;
    1020:	4681                	li	a3,0
    next = 0;
    1022:	4781                	li	a5,0
    ee_u32 total = 0, next = 0, i;
    1024:	4801                	li	a6,0
            *(p + total + i) = ',';
    1026:	02c00293          	li	t0,44
        switch (seed & 0x7)
    102a:	439d                	li	t2,7
                buf  = errpat[(seed >> 3) & 0x3];
    102c:	a9430313          	add	t1,t1,-1388 # 4a94 <errpat>
        switch (seed & 0x7)
    1030:	4411                	li	s0,4
                buf  = scipat[(seed >> 3) & 0x3];
    1032:	aa4e0e13          	add	t3,t3,-1372 # 4aa4 <scipat>
        switch (seed & 0x7)
    1036:	4485                	li	s1,1
                buf  = floatpat[(seed >> 3) & 0x3];
    1038:	ab4e8e93          	add	t4,t4,-1356 # 4ab4 <floatpat>
                buf  = intpat[(seed >> 3) & 0x3];
    103c:	ac4f0f13          	add	t5,t5,-1340 # 4ac4 <intpat>
    while ((total + next + 1) < size)
    1040:	00f805b3          	add	a1,a6,a5
    1044:	00158993          	add	s3,a1,1
    1048:	03f9e263          	bltu	s3,t6,106c <core_init_state+0x6e>
        }
    }
    size++;
    while (total < size)
    { /* fill the rest with 0 */
        *(p + total) = 0;
    104c:	4601                	li	a2,0
    104e:	01056463          	bltu	a0,a6,1056 <core_init_state+0x58>
    1052:	41050633          	sub	a2,a0,a6
        total++;
    }
#if CORE_DEBUG
    ee_printf("State Input: %s\n", start);
#endif
}
    1056:	4472                	lw	s0,28(sp)
    1058:	44e2                	lw	s1,24(sp)
    105a:	4952                	lw	s2,20(sp)
    105c:	49c2                	lw	s3,16(sp)
    105e:	4a32                	lw	s4,12(sp)
        *(p + total) = 0;
    1060:	4581                	li	a1,0
    1062:	01088533          	add	a0,a7,a6
}
    1066:	6105                	add	sp,sp,32
        *(p + total) = 0;
    1068:	1210106f          	j	2988 <memset>
        if (next > 0)
    106c:	c395                	beqz	a5,1090 <core_init_state+0x92>
            for (i = 0; i < next; i++)
    106e:	4601                	li	a2,0
                *(p + total + i) = buf[i];
    1070:	00c68933          	add	s2,a3,a2
    1074:	00094a03          	lbu	s4,0(s2)
    1078:	00c80933          	add	s2,a6,a2
    107c:	9946                	add	s2,s2,a7
    107e:	01490023          	sb	s4,0(s2)
            for (i = 0; i < next; i++)
    1082:	0605                	add	a2,a2,1
    1084:	fec796e3          	bne	a5,a2,1070 <core_init_state+0x72>
            *(p + total + i) = ',';
    1088:	95c6                	add	a1,a1,a7
    108a:	00558023          	sb	t0,0(a1)
            total += next + 1;
    108e:	884e                	mv	a6,s3
                buf  = intpat[(seed >> 3) & 0x3];
    1090:	00175793          	srl	a5,a4,0x1
    1094:	00777693          	and	a3,a4,7
    1098:	8bb1                	and	a5,a5,12
        switch (seed & 0x7)
    109a:	02768663          	beq	a3,t2,10c6 <core_init_state+0xc8>
    109e:	02d46263          	bltu	s0,a3,10c2 <core_init_state+0xc4>
    10a2:	16f5                	add	a3,a3,-3
    10a4:	06c2                	sll	a3,a3,0x10
    10a6:	82c1                	srl	a3,a3,0x10
    10a8:	00d4f963          	bgeu	s1,a3,10ba <core_init_state+0xbc>
                buf  = intpat[(seed >> 3) & 0x3];
    10ac:	97fa                	add	a5,a5,t5
    10ae:	4394                	lw	a3,0(a5)
                next = 4;
    10b0:	4791                	li	a5,4
    10b2:	0705                	add	a4,a4,1
    10b4:	0742                	sll	a4,a4,0x10
    10b6:	8341                	srl	a4,a4,0x10
    10b8:	b761                	j	1040 <core_init_state+0x42>
                buf  = floatpat[(seed >> 3) & 0x3];
    10ba:	97f6                	add	a5,a5,t4
                buf  = errpat[(seed >> 3) & 0x3];
    10bc:	4394                	lw	a3,0(a5)
                next = 8;
    10be:	47a1                	li	a5,8
                break;
    10c0:	bfcd                	j	10b2 <core_init_state+0xb4>
                buf  = scipat[(seed >> 3) & 0x3];
    10c2:	97f2                	add	a5,a5,t3
    10c4:	bfe5                	j	10bc <core_init_state+0xbe>
                buf  = errpat[(seed >> 3) & 0x3];
    10c6:	979a                	add	a5,a5,t1
    10c8:	bfd5                	j	10bc <core_init_state+0xbe>

000010ca <core_state_transition>:
        if (NEXT_SYMBOL == ',') /* end of this input */
        {
            str++;
            break;
        }
        switch (state)
    10ca:	6615                	lui	a2,0x5
    ee_u8 *         str = *instr;
    10cc:	4118                	lw	a4,0(a0)
{
    10ce:	86aa                	mv	a3,a0
    for (; *str && state != CORE_INVALID; str++)
    10d0:	4305                	li	t1,1
    enum CORE_STATE state = CORE_START;
    10d2:	4501                	li	a0,0
        if (NEXT_SYMBOL == ',') /* end of this input */
    10d4:	02c00e13          	li	t3,44
        switch (state)
    10d8:	4e9d                	li	t4,7
    10da:	a7460613          	add	a2,a2,-1420 # 4a74 <list_known_crc+0xc>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    10de:	4825                	li	a6,9
                    state = CORE_INVALID;
                    transition_count[CORE_INT]++;
                }
                break;
            case CORE_FLOAT:
                if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
    10e0:	04500f13          	li	t5,69
                if (NEXT_SYMBOL == '.')
    10e4:	02e00893          	li	a7,46
    for (; *str && state != CORE_INVALID; str++)
    10e8:	00074783          	lbu	a5,0(a4)
    10ec:	c399                	beqz	a5,10f2 <core_state_transition+0x28>
    10ee:	00651463          	bne	a0,t1,10f6 <core_state_transition+0x2c>
                break;
            default:
                break;
        }
    }
    *instr = str;
    10f2:	c298                	sw	a4,0(a3)
    return state;
}
    10f4:	8082                	ret
        if (NEXT_SYMBOL == ',') /* end of this input */
    10f6:	0705                	add	a4,a4,1
    10f8:	ffc78de3          	beq	a5,t3,10f2 <core_state_transition+0x28>
        switch (state)
    10fc:	feaee6e3          	bltu	t4,a0,10e8 <core_state_transition+0x1e>
    1100:	00251f93          	sll	t6,a0,0x2
    1104:	9fb2                	add	t6,t6,a2
    1106:	000faf83          	lw	t6,0(t6)
    110a:	8f82                	jr	t6
    110c:	4515                	li	a0,5
    110e:	01178a63          	beq	a5,a7,1122 <core_state_transition+0x58>
    1112:	00f8ec63          	bltu	a7,a5,112a <core_state_transition+0x60>
    1116:	fd578793          	add	a5,a5,-43
    111a:	0fd7f793          	and	a5,a5,253
    111e:	4509                	li	a0,2
    1120:	ef89                	bnez	a5,113a <core_state_transition+0x70>
                transition_count[CORE_START]++;
    1122:	419c                	lw	a5,0(a1)
    1124:	0785                	add	a5,a5,1
    1126:	c19c                	sw	a5,0(a1)
                break;
    1128:	b7c1                	j	10e8 <core_state_transition+0x1e>
    112a:	fd078793          	add	a5,a5,-48
    112e:	0ff7f793          	zext.b	a5,a5
    1132:	4fa5                	li	t6,9
        switch (state)
    1134:	4511                	li	a0,4
    1136:	fefff6e3          	bgeu	t6,a5,1122 <core_state_transition+0x58>
                    transition_count[CORE_INVALID]++;
    113a:	41dc                	lw	a5,4(a1)
                    state = CORE_INVALID;
    113c:	4505                	li	a0,1
                    transition_count[CORE_INVALID]++;
    113e:	0785                	add	a5,a5,1
    1140:	c1dc                	sw	a5,4(a1)
    1142:	b7c5                	j	1122 <core_state_transition+0x58>
                    transition_count[CORE_S1]++;
    1144:	4588                	lw	a0,8(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    1146:	fd078f93          	add	t6,a5,-48
    114a:	0fffff93          	zext.b	t6,t6
                    transition_count[CORE_S1]++;
    114e:	0505                	add	a0,a0,1
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    1150:	01f87963          	bgeu	a6,t6,1162 <core_state_transition+0x98>
                else if (NEXT_SYMBOL == '.')
    1154:	02e00f93          	li	t6,46
    1158:	01f79863          	bne	a5,t6,1168 <core_state_transition+0x9e>
                    transition_count[CORE_S1]++;
    115c:	c588                	sw	a0,8(a1)
                    state = CORE_FLOAT;
    115e:	4515                	li	a0,5
    1160:	b761                	j	10e8 <core_state_transition+0x1e>
                    transition_count[CORE_S1]++;
    1162:	c588                	sw	a0,8(a1)
                    state = CORE_FLOAT;
    1164:	4511                	li	a0,4
    1166:	b749                	j	10e8 <core_state_transition+0x1e>
                    transition_count[CORE_S1]++;
    1168:	c588                	sw	a0,8(a1)
                    state = CORE_INVALID;
    116a:	4505                	li	a0,1
    116c:	bfb5                	j	10e8 <core_state_transition+0x1e>
                if (NEXT_SYMBOL == '.')
    116e:	01179663          	bne	a5,a7,117a <core_state_transition+0xb0>
                    transition_count[CORE_INT]++;
    1172:	499c                	lw	a5,16(a1)
    1174:	0785                	add	a5,a5,1
    1176:	c99c                	sw	a5,16(a1)
    1178:	b7dd                	j	115e <core_state_transition+0x94>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    117a:	fd078793          	add	a5,a5,-48
    117e:	0ff7f793          	zext.b	a5,a5
    1182:	4525                	li	a0,9
    1184:	fef570e3          	bgeu	a0,a5,1164 <core_state_transition+0x9a>
                    transition_count[CORE_INT]++;
    1188:	499c                	lw	a5,16(a1)
    118a:	0785                	add	a5,a5,1
    118c:	c99c                	sw	a5,16(a1)
    118e:	bff1                	j	116a <core_state_transition+0xa0>
                if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
    1190:	0df7f513          	and	a0,a5,223
    1194:	01e51763          	bne	a0,t5,11a2 <core_state_transition+0xd8>
                    transition_count[CORE_FLOAT]++;
    1198:	49dc                	lw	a5,20(a1)
                    state = CORE_S2;
    119a:	450d                	li	a0,3
                    transition_count[CORE_FLOAT]++;
    119c:	0785                	add	a5,a5,1
    119e:	c9dc                	sw	a5,20(a1)
    11a0:	b7a1                	j	10e8 <core_state_transition+0x1e>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    11a2:	fd078793          	add	a5,a5,-48
    11a6:	0ff7f793          	zext.b	a5,a5
    11aa:	4525                	li	a0,9
    11ac:	faf579e3          	bgeu	a0,a5,115e <core_state_transition+0x94>
                    transition_count[CORE_FLOAT]++;
    11b0:	49dc                	lw	a5,20(a1)
    11b2:	0785                	add	a5,a5,1
    11b4:	c9dc                	sw	a5,20(a1)
    11b6:	bf55                	j	116a <core_state_transition+0xa0>
                    transition_count[CORE_S2]++;
    11b8:	45c8                	lw	a0,12(a1)
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    11ba:	fd578793          	add	a5,a5,-43
    11be:	0fd7f793          	and	a5,a5,253
                    transition_count[CORE_S2]++;
    11c2:	0505                	add	a0,a0,1
    11c4:	c5c8                	sw	a0,12(a1)
                    state = CORE_EXPONENT;
    11c6:	4519                	li	a0,6
                if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    11c8:	f3cd                	bnez	a5,116a <core_state_transition+0xa0>
    11ca:	bf39                	j	10e8 <core_state_transition+0x1e>
                    transition_count[CORE_EXPONENT]++;
    11cc:	4d88                	lw	a0,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    11ce:	fd078793          	add	a5,a5,-48
    11d2:	0ff7f793          	zext.b	a5,a5
                    transition_count[CORE_EXPONENT]++;
    11d6:	0505                	add	a0,a0,1
                    transition_count[CORE_EXPONENT]++;
    11d8:	cd88                	sw	a0,24(a1)
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    11da:	f8f868e3          	bltu	a6,a5,116a <core_state_transition+0xa0>
                    state = CORE_SCIENTIFIC;
    11de:	451d                	li	a0,7
    11e0:	b721                	j	10e8 <core_state_transition+0x1e>
    retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
    11e2:	fd078793          	add	a5,a5,-48
    11e6:	0ff7f793          	zext.b	a5,a5
    11ea:	fef87ae3          	bgeu	a6,a5,11de <core_state_transition+0x114>
                    transition_count[CORE_INVALID]++;
    11ee:	41dc                	lw	a5,4(a1)
    11f0:	0785                	add	a5,a5,1
    11f2:	c1dc                	sw	a5,4(a1)
    11f4:	bf9d                	j	116a <core_state_transition+0xa0>

000011f6 <core_bench_state>:
{
    11f6:	7159                	add	sp,sp,-112
    11f8:	d4a2                	sw	s0,104(sp)
    11fa:	ccd2                	sw	s4,88(sp)
    11fc:	cad6                	sw	s5,84(sp)
    ee_u8 *p = memblock;
    11fe:	c62e                	sw	a1,12(sp)
{
    1200:	8a2a                	mv	s4,a0
    1202:	842e                	mv	s0,a1
    1204:	8ab2                	mv	s5,a2
        final_counts[i] = track_counts[i] = 0;
    1206:	4581                	li	a1,0
    1208:	02000613          	li	a2,32
    120c:	1808                	add	a0,sp,48
{
    120e:	d2a6                	sw	s1,100(sp)
    1210:	d0ca                	sw	s2,96(sp)
    1212:	cece                	sw	s3,92(sp)
    1214:	d686                	sw	ra,108(sp)
    1216:	89b6                	mv	s3,a3
    1218:	893a                	mv	s2,a4
    121a:	84be                	mv	s1,a5
        final_counts[i] = track_counts[i] = 0;
    121c:	76c010ef          	jal	2988 <memset>
    1220:	02000613          	li	a2,32
    1224:	4581                	li	a1,0
    1226:	0808                	add	a0,sp,16
    1228:	760010ef          	jal	2988 <memset>
    while (*p != 0)
    122c:	47b2                	lw	a5,12(sp)
    122e:	0007c783          	lbu	a5,0(a5)
    1232:	ebb1                	bnez	a5,1286 <core_bench_state+0x90>
    p = memblock;
    1234:	c622                	sw	s0,12(sp)
    while (p < (memblock + blksize))
    1236:	87a2                	mv	a5,s0
    1238:	9a22                	add	s4,s4,s0
        if (*p != ',')
    123a:	02c00693          	li	a3,44
    while (p < (memblock + blksize))
    123e:	0747e263          	bltu	a5,s4,12a2 <core_bench_state+0xac>
    while (*p != 0)
    1242:	47b2                	lw	a5,12(sp)
    1244:	0007c783          	lbu	a5,0(a5)
    1248:	e7bd                	bnez	a5,12b6 <core_bench_state+0xc0>
        if (*p != ',')
    124a:	02c00713          	li	a4,44
    while (p < (memblock + blksize))
    124e:	09446263          	bltu	s0,s4,12d2 <core_bench_state+0xdc>
    1252:	4401                	li	s0,0
    for (i = 0; i < NUM_CORE_STATES; i++)
    1254:	02000913          	li	s2,32
        crc = crcu32(final_counts[i], crc);
    1258:	081c                	add	a5,sp,16
    125a:	97a2                	add	a5,a5,s0
    125c:	4388                	lw	a0,0(a5)
    125e:	85a6                	mv	a1,s1
    1260:	2215                	jal	1384 <crcu32>
        crc = crcu32(track_counts[i], crc);
    1262:	181c                	add	a5,sp,48
    1264:	97a2                	add	a5,a5,s0
        crc = crcu32(final_counts[i], crc);
    1266:	85aa                	mv	a1,a0
        crc = crcu32(track_counts[i], crc);
    1268:	4388                	lw	a0,0(a5)
    for (i = 0; i < NUM_CORE_STATES; i++)
    126a:	0411                	add	s0,s0,4
        crc = crcu32(track_counts[i], crc);
    126c:	2a21                	jal	1384 <crcu32>
    126e:	84aa                	mv	s1,a0
    for (i = 0; i < NUM_CORE_STATES; i++)
    1270:	ff2414e3          	bne	s0,s2,1258 <core_bench_state+0x62>
}
    1274:	50b6                	lw	ra,108(sp)
    1276:	5426                	lw	s0,104(sp)
    1278:	5496                	lw	s1,100(sp)
    127a:	5906                	lw	s2,96(sp)
    127c:	49f6                	lw	s3,92(sp)
    127e:	4a66                	lw	s4,88(sp)
    1280:	4ad6                	lw	s5,84(sp)
    1282:	6165                	add	sp,sp,112
    1284:	8082                	ret
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    1286:	180c                	add	a1,sp,48
    1288:	0068                	add	a0,sp,12
    128a:	3581                	jal	10ca <core_state_transition>
        final_counts[fstate]++;
    128c:	00251793          	sll	a5,a0,0x2
    1290:	05078793          	add	a5,a5,80
    1294:	978a                	add	a5,a5,sp
    1296:	fc07a703          	lw	a4,-64(a5)
    129a:	0705                	add	a4,a4,1
    129c:	fce7a023          	sw	a4,-64(a5)
    12a0:	b771                	j	122c <core_bench_state+0x36>
        if (*p != ',')
    12a2:	0007c703          	lbu	a4,0(a5)
    12a6:	00d70663          	beq	a4,a3,12b2 <core_bench_state+0xbc>
            *p ^= (ee_u8)seed1;
    12aa:	01574733          	xor	a4,a4,s5
    12ae:	00e78023          	sb	a4,0(a5)
        p += step;
    12b2:	97ca                	add	a5,a5,s2
    12b4:	b769                	j	123e <core_bench_state+0x48>
        enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    12b6:	180c                	add	a1,sp,48
    12b8:	0068                	add	a0,sp,12
    12ba:	3d01                	jal	10ca <core_state_transition>
        final_counts[fstate]++;
    12bc:	00251793          	sll	a5,a0,0x2
    12c0:	05078793          	add	a5,a5,80
    12c4:	978a                	add	a5,a5,sp
    12c6:	fc07a703          	lw	a4,-64(a5)
    12ca:	0705                	add	a4,a4,1
    12cc:	fce7a023          	sw	a4,-64(a5)
    12d0:	bf8d                	j	1242 <core_bench_state+0x4c>
        if (*p != ',')
    12d2:	00044783          	lbu	a5,0(s0)
    12d6:	00e78663          	beq	a5,a4,12e2 <core_bench_state+0xec>
            *p ^= (ee_u8)seed2;
    12da:	0137c7b3          	xor	a5,a5,s3
    12de:	00f40023          	sb	a5,0(s0)
        p += step;
    12e2:	944a                	add	s0,s0,s2
    12e4:	b7ad                	j	124e <core_bench_state+0x58>

000012e6 <get_seed_32>:
extern volatile ee_s32 seed5_volatile;
ee_s32
get_seed_32(int i)
{
    ee_s32 retval;
    switch (i)
    12e6:	157d                	add	a0,a0,-1
    12e8:	4791                	li	a5,4
    12ea:	04a7e263          	bltu	a5,a0,132e <get_seed_32+0x48>
    12ee:	6795                	lui	a5,0x5
    12f0:	ad478793          	add	a5,a5,-1324 # 4ad4 <intpat+0x10>
    12f4:	050a                	sll	a0,a0,0x2
    12f6:	953e                	add	a0,a0,a5
    12f8:	411c                	lw	a5,0(a0)
    12fa:	8782                	jr	a5
    {
        case 1:
            retval = seed1_volatile;
    12fc:	800007b7          	lui	a5,0x80000
    1300:	5707a503          	lw	a0,1392(a5) # 80000570 <seed1_volatile>
            break;
    1304:	8082                	ret
        case 2:
            retval = seed2_volatile;
    1306:	800007b7          	lui	a5,0x80000
    130a:	56c7a503          	lw	a0,1388(a5) # 8000056c <seed2_volatile>
            break;
    130e:	8082                	ret
        case 3:
            retval = seed3_volatile;
    1310:	800007b7          	lui	a5,0x80000
    1314:	53c7a503          	lw	a0,1340(a5) # 8000053c <seed3_volatile>
            break;
    1318:	8082                	ret
        case 4:
            retval = seed4_volatile;
    131a:	800007b7          	lui	a5,0x80000
    131e:	5387a503          	lw	a0,1336(a5) # 80000538 <seed4_volatile>
            break;
    1322:	8082                	ret
        case 5:
            retval = seed5_volatile;
    1324:	800007b7          	lui	a5,0x80000
    1328:	5687a503          	lw	a0,1384(a5) # 80000568 <seed5_volatile>
            break;
    132c:	8082                	ret
    switch (i)
    132e:	4501                	li	a0,0
        default:
            retval = 0;
            break;
    }
    return retval;
}
    1330:	8082                	ret

00001332 <crcu8>:
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
        data >>= 1;

        if (x16 == 1)
        {
            crc ^= 0x4002;
    1332:	6611                	lui	a2,0x4
{
    1334:	86aa                	mv	a3,a0
    1336:	4721                	li	a4,8
    1338:	852e                	mv	a0,a1
            crc ^= 0x4002;
    133a:	0609                	add	a2,a2,2 # 4002 <__smakebuf_r+0x66>
            carry = 1;
        }
        else
            carry = 0;
        crc >>= 1;
        if (carry)
    133c:	7861                	lui	a6,0xffff8
        x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    133e:	00a6c7b3          	xor	a5,a3,a0
    1342:	8b85                	and	a5,a5,1
        data >>= 1;
    1344:	8285                	srl	a3,a3,0x1
        if (x16 == 1)
    1346:	c391                	beqz	a5,134a <crcu8+0x18>
            crc ^= 0x4002;
    1348:	8d31                	xor	a0,a0,a2
        if (carry)
    134a:	40f007b3          	neg	a5,a5
        crc >>= 1;
    134e:	00155593          	srl	a1,a0,0x1
        if (carry)
    1352:	0107f7b3          	and	a5,a5,a6
    1356:	8fcd                	or	a5,a5,a1
    for (i = 0; i < 8; i++)
    1358:	177d                	add	a4,a4,-1
        if (carry)
    135a:	01079513          	sll	a0,a5,0x10
    for (i = 0; i < 8; i++)
    135e:	0ff77713          	zext.b	a4,a4
        if (carry)
    1362:	8141                	srl	a0,a0,0x10
    for (i = 0; i < 8; i++)
    1364:	ff69                	bnez	a4,133e <crcu8+0xc>
            crc |= 0x8000;
        else
            crc &= 0x7fff;
    }
    return crc;
}
    1366:	8082                	ret

00001368 <crcu16>:
ee_u16
crcu16(ee_u16 newval, ee_u16 crc)
{
    1368:	1141                	add	sp,sp,-16
    136a:	c422                	sw	s0,8(sp)
    136c:	842a                	mv	s0,a0
    crc = crcu8((ee_u8)(newval), crc);
    136e:	0ff57513          	zext.b	a0,a0
{
    1372:	c606                	sw	ra,12(sp)
    crc = crcu8((ee_u8)(newval), crc);
    1374:	3f7d                	jal	1332 <crcu8>
    1376:	85aa                	mv	a1,a0
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    1378:	00845513          	srl	a0,s0,0x8
    return crc;
}
    137c:	4422                	lw	s0,8(sp)
    137e:	40b2                	lw	ra,12(sp)
    1380:	0141                	add	sp,sp,16
    crc = crcu8((ee_u8)((newval) >> 8), crc);
    1382:	bf45                	j	1332 <crcu8>

00001384 <crcu32>:
ee_u16
crcu32(ee_u32 newval, ee_u16 crc)
{
    1384:	1141                	add	sp,sp,-16
    1386:	c422                	sw	s0,8(sp)
    1388:	842a                	mv	s0,a0
    return crc;
}
ee_u16
crc16(ee_s16 newval, ee_u16 crc)
{
    return crcu16((ee_u16)newval, crc);
    138a:	0542                	sll	a0,a0,0x10
    138c:	8141                	srl	a0,a0,0x10
{
    138e:	c606                	sw	ra,12(sp)
    return crcu16((ee_u16)newval, crc);
    1390:	3fe1                	jal	1368 <crcu16>
    1392:	85aa                	mv	a1,a0
    1394:	01045513          	srl	a0,s0,0x10
}
    1398:	4422                	lw	s0,8(sp)
    139a:	40b2                	lw	ra,12(sp)
    139c:	0141                	add	sp,sp,16
    return crcu16((ee_u16)newval, crc);
    139e:	b7e9                	j	1368 <crcu16>

000013a0 <crc16>:
    13a0:	0542                	sll	a0,a0,0x10
    13a2:	8141                	srl	a0,a0,0x10
    13a4:	b7d1                	j	1368 <crcu16>

000013a6 <check_data_types>:
    if (retval > 0)
    {
        ee_printf("ERROR: Please modify the datatypes in core_portme.h!\n");
    }
    return retval;
}
    13a6:	4501                	li	a0,0
    13a8:	8082                	ret

000013aa <number>:
    return i;
}

static char *
number(char *str, long num, int base, int size, int precision, int type)
{
    13aa:	7119                	add	sp,sp,-128
    13ac:	d8ca                	sw	s2,112(sp)
    13ae:	de86                	sw	ra,124(sp)
    13b0:	8932                	mv	s2,a2
    13b2:	dca2                	sw	s0,120(sp)
    13b4:	daa6                	sw	s1,116(sp)
    13b6:	d6ce                	sw	s3,108(sp)
    13b8:	d4d2                	sw	s4,104(sp)
    13ba:	d2d6                	sw	s5,100(sp)
    13bc:	d0da                	sw	s6,96(sp)
    13be:	cede                	sw	s7,92(sp)
    13c0:	cce2                	sw	s8,88(sp)
    char  c, sign, tmp[66];
    char *dig = digits;
    int   i;

    if (type & UPPERCASE)
    13c2:	0407f613          	and	a2,a5,64
{
    13c6:	882a                	mv	a6,a0
    if (type & UPPERCASE)
    13c8:	10061463          	bnez	a2,14d0 <number+0x126>
    char *dig = digits;
    13cc:	6611                	lui	a2,0x4
    13ce:	7e460613          	add	a2,a2,2020 # 47e4 <__fini_array_end+0x320>
        dig = upper_digits;
    if (type & LEFT)
    13d2:	0107fb93          	and	s7,a5,16
    13d6:	100b8163          	beqz	s7,14d8 <number+0x12e>
        type &= ~ZEROPAD;
    13da:	9bf9                	and	a5,a5,-2
    if (base < 2 || base > 36)
        return 0;

    c    = (type & ZEROPAD) ? '0' : ' ';
    13dc:	02000b13          	li	s6,32
    sign = 0;
    if (type & SIGN)
    13e0:	0027f513          	and	a0,a5,2
    sign = 0;
    13e4:	4a01                	li	s4,0
    if (type & SIGN)
    13e6:	c901                	beqz	a0,13f6 <number+0x4c>
    {
        if (num < 0)
    13e8:	1005d163          	bgez	a1,14ea <number+0x140>
        {
            sign = '-';
            num  = -num;
    13ec:	40b005b3          	neg	a1,a1
            size--;
    13f0:	16fd                	add	a3,a3,-1
            sign = '-';
    13f2:	02d00a13          	li	s4,45
            sign = ' ';
            size--;
        }
    }

    if (type & HEX_PREP)
    13f6:	0207fc13          	and	s8,a5,32
    13fa:	000c0663          	beqz	s8,1406 <number+0x5c>
    {
        if (base == 16)
    13fe:	4541                	li	a0,16
    1400:	10a91463          	bne	s2,a0,1508 <number+0x15e>
            size -= 2;
    1404:	16f9                	add	a3,a3,-2
            size--;
    }

    i = 0;

    if (num == 0)
    1406:	10059663          	bnez	a1,1512 <number+0x168>
        tmp[i++] = '0';
    140a:	03000613          	li	a2,48
    140e:	00c10623          	sb	a2,12(sp)
    1412:	4485                	li	s1,1
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
            num      = ((unsigned long)num) / (unsigned)base;
        }
    }

    if (i > precision)
    1414:	89a6                	mv	s3,s1
    1416:	00e4d363          	bge	s1,a4,141c <number+0x72>
    141a:	89ba                	mv	s3,a4
        precision = i;
    size -= precision;
    if (!(type & (ZEROPAD | LEFT)))
    141c:	8bc5                	and	a5,a5,17
    size -= precision;
    141e:	41368433          	sub	s0,a3,s3
    if (!(type & (ZEROPAD | LEFT)))
    1422:	e38d                	bnez	a5,1444 <number+0x9a>
        while (size-- > 0)
            *str++ = ' ';
    1424:	8aa2                	mv	s5,s0
    1426:	00045363          	bgez	s0,142c <number+0x82>
    142a:	4a81                	li	s5,0
    142c:	8542                	mv	a0,a6
    142e:	8656                	mv	a2,s5
    1430:	02000593          	li	a1,32
    1434:	554010ef          	jal	2988 <memset>
    1438:	fff40693          	add	a3,s0,-1
    143c:	01550833          	add	a6,a0,s5
    1440:	41568433          	sub	s0,a3,s5
    if (sign)
    1444:	000a0563          	beqz	s4,144e <number+0xa4>
        *str++ = sign;
    1448:	01480023          	sb	s4,0(a6) # ffff8000 <__crt0_ram_last+0x7fff6001>
    144c:	0805                	add	a6,a6,1

    if (type & HEX_PREP)
    144e:	000c0a63          	beqz	s8,1462 <number+0xb8>
    {
        if (base == 8)
    1452:	47a1                	li	a5,8
    1454:	0ef91063          	bne	s2,a5,1534 <number+0x18a>
            *str++ = '0';
    1458:	03000793          	li	a5,48
    145c:	00f80023          	sb	a5,0(a6)
    1460:	0805                	add	a6,a6,1
            *str++ = '0';
            *str++ = digits[33];
        }
    }

    if (!(type & LEFT))
    1462:	020b9163          	bnez	s7,1484 <number+0xda>
        while (size-- > 0)
            *str++ = c;
    1466:	8922                	mv	s2,s0
    1468:	00045363          	bgez	s0,146e <number+0xc4>
    146c:	4901                	li	s2,0
    146e:	8542                	mv	a0,a6
    1470:	864a                	mv	a2,s2
    1472:	85da                	mv	a1,s6
    1474:	514010ef          	jal	2988 <memset>
    1478:	fff40693          	add	a3,s0,-1
    147c:	01250833          	add	a6,a0,s2
    1480:	41268433          	sub	s0,a3,s2
    while (i < precision--)
        *str++ = '0';
    1484:	40998933          	sub	s2,s3,s1
    1488:	864a                	mv	a2,s2
    148a:	8542                	mv	a0,a6
    148c:	03000593          	li	a1,48
    1490:	4f8010ef          	jal	2988 <memset>
    1494:	882a                	mv	a6,a0
    1496:	01250633          	add	a2,a0,s2
    while (i-- > 0)
    149a:	57fd                	li	a5,-1
    149c:	14fd                	add	s1,s1,-1
    149e:	0af49863          	bne	s1,a5,154e <number+0x1a4>
    14a2:	984e                	add	a6,a6,s3
        *str++ = tmp[i];
    while (size-- > 0)
        *str++ = ' ';
    14a4:	00045363          	bgez	s0,14aa <number+0x100>
    14a8:	4401                	li	s0,0
    14aa:	8622                	mv	a2,s0
    14ac:	02000593          	li	a1,32
    14b0:	8542                	mv	a0,a6
    14b2:	4d6010ef          	jal	2988 <memset>

    return str;
}
    14b6:	50f6                	lw	ra,124(sp)
    14b8:	9522                	add	a0,a0,s0
    14ba:	5466                	lw	s0,120(sp)
    14bc:	54d6                	lw	s1,116(sp)
    14be:	5946                	lw	s2,112(sp)
    14c0:	59b6                	lw	s3,108(sp)
    14c2:	5a26                	lw	s4,104(sp)
    14c4:	5a96                	lw	s5,100(sp)
    14c6:	5b06                	lw	s6,96(sp)
    14c8:	4bf6                	lw	s7,92(sp)
    14ca:	4c66                	lw	s8,88(sp)
    14cc:	6109                	add	sp,sp,128
    14ce:	8082                	ret
        dig = upper_digits;
    14d0:	6615                	lui	a2,0x5
    14d2:	80c60613          	add	a2,a2,-2036 # 480c <__fini_array_end+0x348>
    14d6:	bdf5                	j	13d2 <number+0x28>
    c    = (type & ZEROPAD) ? '0' : ' ';
    14d8:	0017f513          	and	a0,a5,1
    14dc:	02000b13          	li	s6,32
    14e0:	f00500e3          	beqz	a0,13e0 <number+0x36>
    14e4:	03000b13          	li	s6,48
    14e8:	bde5                	j	13e0 <number+0x36>
        else if (type & PLUS)
    14ea:	0047f513          	and	a0,a5,4
    14ee:	c509                	beqz	a0,14f8 <number+0x14e>
            size--;
    14f0:	16fd                	add	a3,a3,-1
            sign = '+';
    14f2:	02b00a13          	li	s4,43
    14f6:	b701                	j	13f6 <number+0x4c>
        else if (type & SPACE)
    14f8:	0087f513          	and	a0,a5,8
    14fc:	ee050de3          	beqz	a0,13f6 <number+0x4c>
            size--;
    1500:	16fd                	add	a3,a3,-1
            sign = ' ';
    1502:	02000a13          	li	s4,32
    1506:	bdc5                	j	13f6 <number+0x4c>
        else if (base == 8)
    1508:	4521                	li	a0,8
    150a:	eea91ee3          	bne	s2,a0,1406 <number+0x5c>
            size--;
    150e:	16fd                	add	a3,a3,-1
    1510:	bddd                	j	1406 <number+0x5c>
    1512:	0068                	add	a0,sp,12
    i = 0;
    1514:	4481                	li	s1,0
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
    1516:	0325f8b3          	remu	a7,a1,s2
    151a:	832e                	mv	t1,a1
    151c:	0485                	add	s1,s1,1
        while (num != 0)
    151e:	0505                	add	a0,a0,1
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
    1520:	98b2                	add	a7,a7,a2
    1522:	0008c883          	lbu	a7,0(a7)
            num      = ((unsigned long)num) / (unsigned)base;
    1526:	0325d5b3          	divu	a1,a1,s2
            tmp[i++] = dig[((unsigned long)num) % (unsigned)base];
    152a:	ff150fa3          	sb	a7,-1(a0)
        while (num != 0)
    152e:	ff2374e3          	bgeu	t1,s2,1516 <number+0x16c>
    1532:	b5cd                	j	1414 <number+0x6a>
        else if (base == 16)
    1534:	47c1                	li	a5,16
    1536:	f2f916e3          	bne	s2,a5,1462 <number+0xb8>
            *str++ = '0';
    153a:	03000793          	li	a5,48
    153e:	00f80023          	sb	a5,0(a6)
            *str++ = digits[33];
    1542:	07800793          	li	a5,120
    1546:	00f800a3          	sb	a5,1(a6)
    154a:	0809                	add	a6,a6,2
    154c:	bf19                	j	1462 <number+0xb8>
        *str++ = tmp[i];
    154e:	0078                	add	a4,sp,12
    1550:	9726                	add	a4,a4,s1
    1552:	00074703          	lbu	a4,0(a4)
    1556:	0605                	add	a2,a2,1
    1558:	fee60fa3          	sb	a4,-1(a2)
    155c:	b781                	j	149c <number+0xf2>

0000155e <uart_send_char>:
    return str - buf;
}

void
uart_send_char(char c)
{
    155e:	1141                	add	sp,sp,-16
    1560:	c422                	sw	s0,8(sp)
    1562:	c606                	sw	ra,12(sp)
            Check the UART sample code on your platform or the board
       documentation.
    */

  /* NEORV32-specific */
  if (c == '\n') {
    1564:	47a9                	li	a5,10
{
    1566:	842a                	mv	s0,a0
  if (c == '\n') {
    1568:	00f51763          	bne	a0,a5,1576 <uart_send_char+0x18>
    neorv32_uart0_putc('\r');
    156c:	45b5                	li	a1,13
    156e:	fff50537          	lui	a0,0xfff50
    1572:	4eb000ef          	jal	225c <neorv32_uart_putc>
  }
  neorv32_uart0_putc(c);
    1576:	85a2                	mv	a1,s0
}
    1578:	4422                	lw	s0,8(sp)
    157a:	40b2                	lw	ra,12(sp)
  neorv32_uart0_putc(c);
    157c:	fff50537          	lui	a0,0xfff50
}
    1580:	0141                	add	sp,sp,16
  neorv32_uart0_putc(c);
    1582:	4db0006f          	j	225c <neorv32_uart_putc>

00001586 <printf>:

int
ee_printf(const char *fmt, ...)
{
    1586:	7165                	add	sp,sp,-400
    1588:	16912223          	sw	s1,356(sp)
    158c:	15412c23          	sw	s4,344(sp)
    1590:	19012423          	sw	a6,392(sp)
    char    buf[256], *p;
    va_list args;
    int     n = 0;

    va_start(args, fmt);
    1594:	1ac4                	add	s1,sp,372
    for (str = buf; *fmt; fmt++)
    1596:	03010813          	add	a6,sp,48
        switch (*fmt)
    159a:	6a15                	lui	s4,0x5
{
    159c:	15512a23          	sw	s5,340(sp)
    15a0:	15612823          	sw	s6,336(sp)
    15a4:	15712623          	sw	s7,332(sp)
    15a8:	15812423          	sw	s8,328(sp)
    15ac:	16112623          	sw	ra,364(sp)
    15b0:	16812423          	sw	s0,360(sp)
    15b4:	17212023          	sw	s2,352(sp)
    15b8:	15312e23          	sw	s3,348(sp)
    15bc:	15912223          	sw	s9,324(sp)
    15c0:	15a12023          	sw	s10,320(sp)
    15c4:	13b12e23          	sw	s11,316(sp)
    15c8:	16b12a23          	sw	a1,372(sp)
    15cc:	16c12c23          	sw	a2,376(sp)
    15d0:	16d12e23          	sw	a3,380(sp)
    15d4:	18e12023          	sw	a4,384(sp)
    15d8:	18f12223          	sw	a5,388(sp)
    15dc:	19112623          	sw	a7,396(sp)
    va_start(args, fmt);
    15e0:	ca26                	sw	s1,20(sp)
    for (str = buf; *fmt; fmt++)
    15e2:	8ac2                	mv	s5,a6
        switch (*fmt)
    15e4:	02d00b13          	li	s6,45
    15e8:	03000b93          	li	s7,48
    15ec:	02000c13          	li	s8,32
        switch (*fmt)
    15f0:	ae8a0a13          	add	s4,s4,-1304 # 4ae8 <intpat+0x24>
    for (str = buf; *fmt; fmt++)
    15f4:	00054783          	lbu	a5,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
    15f8:	e7b9                	bnez	a5,1646 <printf+0xc0>
    *str = '\0';
    15fa:	00080023          	sb	zero,0(a6)
    int     n = 0;
    15fe:	4401                	li	s0,0
    ee_vsprintf(buf, fmt, args);
    va_end(args);
    p = buf;
    while (*p)
    1600:	008a87b3          	add	a5,s5,s0
    1604:	0007c503          	lbu	a0,0(a5)
    1608:	50051563          	bnez	a0,1b12 <printf+0x58c>
        n++;
        p++;
    }

    return n;
}
    160c:	16c12083          	lw	ra,364(sp)
    1610:	8522                	mv	a0,s0
    1612:	16812403          	lw	s0,360(sp)
    1616:	16412483          	lw	s1,356(sp)
    161a:	16012903          	lw	s2,352(sp)
    161e:	15c12983          	lw	s3,348(sp)
    1622:	15812a03          	lw	s4,344(sp)
    1626:	15412a83          	lw	s5,340(sp)
    162a:	15012b03          	lw	s6,336(sp)
    162e:	14c12b83          	lw	s7,332(sp)
    1632:	14812c03          	lw	s8,328(sp)
    1636:	14412c83          	lw	s9,324(sp)
    163a:	14012d03          	lw	s10,320(sp)
    163e:	13c12d83          	lw	s11,316(sp)
    1642:	6159                	add	sp,sp,400
    1644:	8082                	ret
        if (*fmt != '%')
    1646:	02500713          	li	a4,37
    164a:	00e78863          	beq	a5,a4,165a <printf+0xd4>
            *str++ = *fmt;
    164e:	00f80023          	sb	a5,0(a6)
            continue;
    1652:	89a6                	mv	s3,s1
    1654:	892a                	mv	s2,a0
                    *str++ = *fmt;
    1656:	0805                	add	a6,a6,1
    1658:	aac1                	j	1828 <printf+0x2a2>
        flags = 0;
    165a:	4781                	li	a5,0
        switch (*fmt)
    165c:	02b00693          	li	a3,43
    1660:	02300613          	li	a2,35
    1664:	a8b9                	j	16c2 <printf+0x13c>
    1666:	05670b63          	beq	a4,s6,16bc <printf+0x136>
    166a:	0b770163          	beq	a4,s7,170c <printf+0x186>
        if (is_digit(*fmt))
    166e:	fd070693          	add	a3,a4,-48
    1672:	0ff6f693          	zext.b	a3,a3
    1676:	4625                	li	a2,9
    int i = 0;
    1678:	4401                	li	s0,0
        i = i * 10 + *((*s)++) - '0';
    167a:	45a9                	li	a1,10
        if (is_digit(*fmt))
    167c:	04d66f63          	bltu	a2,a3,16da <printf+0x154>
    while (is_digit(**s))
    1680:	00094683          	lbu	a3,0(s2)
    1684:	fd068713          	add	a4,a3,-48
    1688:	0ff77713          	zext.b	a4,a4
    168c:	08e67363          	bgeu	a2,a4,1712 <printf+0x18c>
        if (*fmt == '.')
    1690:	00094603          	lbu	a2,0(s2)
    1694:	02e00693          	li	a3,46
        precision = -1;
    1698:	577d                	li	a4,-1
        if (*fmt == '.')
    169a:	0ad61563          	bne	a2,a3,1744 <printf+0x1be>
            if (is_digit(*fmt))
    169e:	00194603          	lbu	a2,1(s2)
    16a2:	45a5                	li	a1,9
            ++fmt;
    16a4:	00190693          	add	a3,s2,1
            if (is_digit(*fmt))
    16a8:	fd060713          	add	a4,a2,-48
    16ac:	0ff77713          	zext.b	a4,a4
    16b0:	0ee5ea63          	bltu	a1,a4,17a4 <printf+0x21e>
    int i = 0;
    16b4:	4701                	li	a4,0
    while (is_digit(**s))
    16b6:	4525                	li	a0,9
        i = i * 10 + *((*s)++) - '0';
    16b8:	48a9                	li	a7,10
    16ba:	a88d                	j	172c <printf+0x1a6>
                flags |= LEFT;
    16bc:	0107e793          	or	a5,a5,16
{
    16c0:	854a                	mv	a0,s2
        switch (*fmt)
    16c2:	00154703          	lbu	a4,1(a0)
        fmt++; // This also skips first '%'
    16c6:	00150913          	add	s2,a0,1
        switch (*fmt)
    16ca:	02d70863          	beq	a4,a3,16fa <printf+0x174>
    16ce:	f8e6ece3          	bltu	a3,a4,1666 <printf+0xe0>
    16d2:	03870763          	beq	a4,s8,1700 <printf+0x17a>
    16d6:	02c70863          	beq	a4,a2,1706 <printf+0x180>
        else if (*fmt == '*')
    16da:	02a00693          	li	a3,42
        field_width = -1;
    16de:	547d                	li	s0,-1
        else if (*fmt == '*')
    16e0:	fad718e3          	bne	a4,a3,1690 <printf+0x10a>
            field_width = va_arg(args, int);
    16e4:	4080                	lw	s0,0(s1)
            fmt++;
    16e6:	00250913          	add	s2,a0,2
            field_width = va_arg(args, int);
    16ea:	0491                	add	s1,s1,4
            if (field_width < 0)
    16ec:	fa0452e3          	bgez	s0,1690 <printf+0x10a>
                field_width = -field_width;
    16f0:	40800433          	neg	s0,s0
                flags |= LEFT;
    16f4:	0107e793          	or	a5,a5,16
    16f8:	bf61                	j	1690 <printf+0x10a>
                flags |= PLUS;
    16fa:	0047e793          	or	a5,a5,4
                goto repeat;
    16fe:	b7c9                	j	16c0 <printf+0x13a>
                flags |= SPACE;
    1700:	0087e793          	or	a5,a5,8
                goto repeat;
    1704:	bf75                	j	16c0 <printf+0x13a>
                flags |= HEX_PREP;
    1706:	0207e793          	or	a5,a5,32
                goto repeat;
    170a:	bf5d                	j	16c0 <printf+0x13a>
                flags |= ZEROPAD;
    170c:	0017e793          	or	a5,a5,1
                goto repeat;
    1710:	bf45                	j	16c0 <printf+0x13a>
        i = i * 10 + *((*s)++) - '0';
    1712:	02b40433          	mul	s0,s0,a1
    1716:	0905                	add	s2,s2,1
    1718:	9436                	add	s0,s0,a3
    171a:	fd040413          	add	s0,s0,-48
    171e:	b78d                	j	1680 <printf+0xfa>
    1720:	03170733          	mul	a4,a4,a7
    1724:	0685                	add	a3,a3,1
    1726:	972e                	add	a4,a4,a1
    1728:	fd070713          	add	a4,a4,-48
    while (is_digit(**s))
    172c:	0006c583          	lbu	a1,0(a3)
    1730:	fd058613          	add	a2,a1,-48
    1734:	0ff67613          	zext.b	a2,a2
    1738:	fec574e3          	bgeu	a0,a2,1720 <printf+0x19a>
            if (precision < 0)
    173c:	00075363          	bgez	a4,1742 <printf+0x1bc>
    1740:	4701                	li	a4,0
    1742:	8936                	mv	s2,a3
        if (*fmt == 'l' || *fmt == 'L')
    1744:	00094683          	lbu	a3,0(s2)
    1748:	04c00613          	li	a2,76
        qualifier = -1;
    174c:	55fd                	li	a1,-1
        if (*fmt == 'l' || *fmt == 'L')
    174e:	0df6f513          	and	a0,a3,223
    1752:	00c51463          	bne	a0,a2,175a <printf+0x1d4>
            qualifier = *fmt;
    1756:	85b6                	mv	a1,a3
            fmt++;
    1758:	0905                	add	s2,s2,1
        switch (*fmt)
    175a:	00094603          	lbu	a2,0(s2)
    175e:	07800693          	li	a3,120
    1762:	02c6e463          	bltu	a3,a2,178a <printf+0x204>
    1766:	06000693          	li	a3,96
    176a:	04c6e963          	bltu	a3,a2,17bc <printf+0x236>
    176e:	04100693          	li	a3,65
    1772:	16d60d63          	beq	a2,a3,18ec <printf+0x366>
    1776:	05800693          	li	a3,88
                flags |= UPPERCASE;
    177a:	0407e793          	or	a5,a5,64
        switch (*fmt)
    177e:	38d60e63          	beq	a2,a3,1b1a <printf+0x594>
                if (*fmt != '%')
    1782:	02500793          	li	a5,37
    1786:	00f60763          	beq	a2,a5,1794 <printf+0x20e>
                    *str++ = '%';
    178a:	02500793          	li	a5,37
    178e:	00f80023          	sb	a5,0(a6)
    1792:	0805                	add	a6,a6,1
                if (*fmt)
    1794:	00094783          	lbu	a5,0(s2)
    1798:	36078363          	beqz	a5,1afe <printf+0x578>
                    *str++ = *fmt;
    179c:	00f80023          	sb	a5,0(a6)
    17a0:	89a6                	mv	s3,s1
    17a2:	bd55                	j	1656 <printf+0xd0>
            else if (*fmt == '*')
    17a4:	02a00713          	li	a4,42
    17a8:	00e61763          	bne	a2,a4,17b6 <printf+0x230>
                precision = va_arg(args, int);
    17ac:	4098                	lw	a4,0(s1)
                ++fmt;
    17ae:	00290693          	add	a3,s2,2
                precision = va_arg(args, int);
    17b2:	0491                	add	s1,s1,4
    17b4:	b761                	j	173c <printf+0x1b6>
            ++fmt;
    17b6:	8936                	mv	s2,a3
                precision = 0;
    17b8:	4701                	li	a4,0
    17ba:	b769                	j	1744 <printf+0x1be>
        switch (*fmt)
    17bc:	f9f60693          	add	a3,a2,-97
    17c0:	0ff6f693          	zext.b	a3,a3
    17c4:	455d                	li	a0,23
    17c6:	fad56ee3          	bltu	a0,a3,1782 <printf+0x1fc>
    17ca:	068a                	sll	a3,a3,0x2
    17cc:	96d2                	add	a3,a3,s4
    17ce:	4294                	lw	a3,0(a3)
    17d0:	8682                	jr	a3
                if (!(flags & LEFT))
    17d2:	8bc1                	and	a5,a5,16
    17d4:	e795                	bnez	a5,1800 <printf+0x27a>
                        *str++ = ' ';
    17d6:	fff40993          	add	s3,s0,-1
    17da:	4c81                	li	s9,0
    17dc:	00805363          	blez	s0,17e2 <printf+0x25c>
    17e0:	8cce                	mv	s9,s3
    17e2:	8542                	mv	a0,a6
    17e4:	8666                	mv	a2,s9
    17e6:	02000593          	li	a1,32
    17ea:	19e010ef          	jal	2988 <memset>
    17ee:	01950833          	add	a6,a0,s9
    17f2:	00804363          	bgtz	s0,17f8 <printf+0x272>
    17f6:	4405                	li	s0,1
    17f8:	408989b3          	sub	s3,s3,s0
    17fc:	00198413          	add	s0,s3,1
                *str++ = (unsigned char)va_arg(args, int);
    1800:	4098                	lw	a4,0(s1)
    1802:	00448993          	add	s3,s1,4
    1806:	00180793          	add	a5,a6,1
    180a:	00e80023          	sb	a4,0(a6)
                    *str++ = ' ';
    180e:	4481                	li	s1,0
    1810:	00805463          	blez	s0,1818 <printf+0x292>
    1814:	fff40493          	add	s1,s0,-1
    1818:	8626                	mv	a2,s1
    181a:	02000593          	li	a1,32
    181e:	853e                	mv	a0,a5
    1820:	168010ef          	jal	2988 <memset>
    1824:	00950833          	add	a6,a0,s1
    for (str = buf; *fmt; fmt++)
    1828:	00190513          	add	a0,s2,1
    182c:	84ce                	mv	s1,s3
    182e:	b3d9                	j	15f4 <printf+0x6e>
                s = va_arg(args, char *);
    1830:	0004ac83          	lw	s9,0(s1)
    1834:	00448993          	add	s3,s1,4
                if (!s)
    1838:	000c9563          	bnez	s9,1842 <printf+0x2bc>
                    s = "<NULL>";
    183c:	6c95                	lui	s9,0x5
    183e:	834c8c93          	add	s9,s9,-1996 # 4834 <__fini_array_end+0x370>
    for (sc = s; *sc != '\0' && count--; ++sc)
    1842:	9766                	add	a4,a4,s9
    1844:	84e6                	mv	s1,s9
    1846:	0004c683          	lbu	a3,0(s1)
    184a:	c299                	beqz	a3,1850 <printf+0x2ca>
    184c:	06e49563          	bne	s1,a4,18b6 <printf+0x330>
                if (!(flags & LEFT))
    1850:	8bc1                	and	a5,a5,16
    return sc - s;
    1852:	419484b3          	sub	s1,s1,s9
                if (!(flags & LEFT))
    1856:	eb95                	bnez	a5,188a <printf+0x304>
                        *str++ = ' ';
    1858:	009427b3          	slt	a5,s0,s1
    185c:	0017c713          	xor	a4,a5,1
    1860:	40940db3          	sub	s11,s0,s1
    1864:	4d01                	li	s10,0
    1866:	e391                	bnez	a5,186a <printf+0x2e4>
    1868:	8d6e                	mv	s10,s11
    186a:	8542                	mv	a0,a6
    186c:	866a                	mv	a2,s10
    186e:	02000593          	li	a1,32
    1872:	c63a                	sw	a4,12(sp)
    1874:	114010ef          	jal	2988 <memset>
    1878:	4732                	lw	a4,12(sp)
    187a:	01a50833          	add	a6,a0,s10
    187e:	147d                	add	s0,s0,-1
    1880:	4781                	li	a5,0
    1882:	c319                	beqz	a4,1888 <printf+0x302>
    1884:	41b007b3          	neg	a5,s11
    1888:	943e                	add	s0,s0,a5
                for (i = 0; i < len; ++i)
    188a:	4781                	li	a5,0
    188c:	0297c763          	blt	a5,s1,18ba <printf+0x334>
    1890:	87a6                	mv	a5,s1
    1892:	0004d363          	bgez	s1,1898 <printf+0x312>
    1896:	4781                	li	a5,0
    1898:	983e                	add	a6,a6,a5
                    *str++ = ' ';
    189a:	4c81                	li	s9,0
    189c:	00944463          	blt	s0,s1,18a4 <printf+0x31e>
    18a0:	40940cb3          	sub	s9,s0,s1
    18a4:	8542                	mv	a0,a6
    18a6:	8666                	mv	a2,s9
    18a8:	02000593          	li	a1,32
    18ac:	0dc010ef          	jal	2988 <memset>
    18b0:	01950833          	add	a6,a0,s9
    18b4:	bf95                	j	1828 <printf+0x2a2>
    for (sc = s; *sc != '\0' && count--; ++sc)
    18b6:	0485                	add	s1,s1,1
    18b8:	b779                	j	1846 <printf+0x2c0>
                    *str++ = *s++;
    18ba:	00fc8733          	add	a4,s9,a5
    18be:	00074683          	lbu	a3,0(a4)
    18c2:	00f80733          	add	a4,a6,a5
                for (i = 0; i < len; ++i)
    18c6:	0785                	add	a5,a5,1
                    *str++ = *s++;
    18c8:	00d70023          	sb	a3,0(a4)
                for (i = 0; i < len; ++i)
    18cc:	b7c1                	j	188c <printf+0x306>
                if (field_width == -1)
    18ce:	56fd                	li	a3,-1
    18d0:	00d41563          	bne	s0,a3,18da <printf+0x354>
                    flags |= ZEROPAD;
    18d4:	0017e793          	or	a5,a5,1
                    field_width = 2 * sizeof(void *);
    18d8:	4421                	li	s0,8
                str = number(str,
    18da:	408c                	lw	a1,0(s1)
                             (unsigned long)va_arg(args, void *),
    18dc:	00448993          	add	s3,s1,4
                str = number(str,
    18e0:	86a2                	mv	a3,s0
    18e2:	4641                	li	a2,16
        str = number(str, num, base, field_width, precision, flags);
    18e4:	8542                	mv	a0,a6
    18e6:	34d1                	jal	13aa <number>
    18e8:	882a                	mv	a6,a0
    18ea:	bf3d                	j	1828 <printf+0x2a2>
                flags |= UPPERCASE;
    18ec:	0407e793          	or	a5,a5,64
                if (qualifier == 'l')
    18f0:	06c00713          	li	a4,108
                s = va_arg(args, char *);
    18f4:	0004a883          	lw	a7,0(s1)
                *str++ = (unsigned char)va_arg(args, int);
    18f8:	00448993          	add	s3,s1,4
                if (qualifier == 'l')
    18fc:	0ce59263          	bne	a1,a4,19c0 <printf+0x43a>
    if (type & UPPERCASE)
    1900:	0407f713          	and	a4,a5,64
    1904:	eb31                	bnez	a4,1958 <printf+0x3d2>
    char *dig = digits;
    1906:	6711                	lui	a4,0x4
    1908:	7e470713          	add	a4,a4,2020 # 47e4 <__fini_array_end+0x320>
        if (i != 0)
    190c:	4581                	li	a1,0
    190e:	4601                	li	a2,0
    for (i = 0; i < 6; i++)
    1910:	4e99                	li	t4,6
            tmp[len++] = ':';
    1912:	03a00e13          	li	t3,58
        tmp[len++] = dig[addr[i] >> 4];
    1916:	00b886b3          	add	a3,a7,a1
    191a:	0006c683          	lbu	a3,0(a3)
    191e:	0804                	add	s1,sp,16
    for (i = 0; i < 6; i++)
    1920:	0585                	add	a1,a1,1
        tmp[len++] = dig[addr[i] >> 4];
    1922:	0046d513          	srl	a0,a3,0x4
        tmp[len++] = dig[addr[i] & 0x0F];
    1926:	8abd                	and	a3,a3,15
        tmp[len++] = dig[addr[i] >> 4];
    1928:	953a                	add	a0,a0,a4
        tmp[len++] = dig[addr[i] & 0x0F];
    192a:	96ba                	add	a3,a3,a4
        tmp[len++] = dig[addr[i] >> 4];
    192c:	00054303          	lbu	t1,0(a0)
        tmp[len++] = dig[addr[i] & 0x0F];
    1930:	0006c683          	lbu	a3,0(a3)
        tmp[len++] = dig[addr[i] >> 4];
    1934:	12060513          	add	a0,a2,288
    1938:	9526                	add	a0,a0,s1
    193a:	ee650423          	sb	t1,-280(a0)
        tmp[len++] = dig[addr[i] & 0x0F];
    193e:	eed504a3          	sb	a3,-279(a0)
    1942:	00260313          	add	t1,a2,2
    for (i = 0; i < 6; i++)
    1946:	01d58d63          	beq	a1,t4,1960 <printf+0x3da>
            tmp[len++] = ':';
    194a:	12030693          	add	a3,t1,288
    194e:	96a6                	add	a3,a3,s1
    1950:	060d                	add	a2,a2,3
    1952:	efc68423          	sb	t3,-280(a3)
    1956:	b7c1                	j	1916 <printf+0x390>
        dig = upper_digits;
    1958:	6715                	lui	a4,0x5
    195a:	80c70713          	add	a4,a4,-2036 # 480c <__fini_array_end+0x348>
    195e:	b77d                	j	190c <printf+0x386>
    if (!(type & LEFT))
    1960:	8bc1                	and	a5,a5,16
    1962:	eb8d                	bnez	a5,1994 <printf+0x40e>
            *str++ = ' ';
    1964:	01142793          	slti	a5,s0,17
    1968:	0017cd13          	xor	s10,a5,1
    196c:	fef40c93          	add	s9,s0,-17
    1970:	4481                	li	s1,0
    1972:	e391                	bnez	a5,1976 <printf+0x3f0>
    1974:	84e6                	mv	s1,s9
    1976:	8542                	mv	a0,a6
    1978:	8626                	mv	a2,s1
    197a:	02000593          	li	a1,32
    197e:	00a010ef          	jal	2988 <memset>
    1982:	00950833          	add	a6,a0,s1
    1986:	4781                	li	a5,0
    1988:	000d0463          	beqz	s10,1990 <printf+0x40a>
    198c:	419007b3          	neg	a5,s9
    1990:	147d                	add	s0,s0,-1
    1992:	943e                	add	s0,s0,a5
        *str++ = tmp[i];
    1994:	8542                	mv	a0,a6
    1996:	4645                	li	a2,17
    1998:	082c                	add	a1,sp,24
    199a:	096010ef          	jal	2a30 <memcpy>
        *str++ = ' ';
    199e:	01142793          	slti	a5,s0,17
    19a2:	01150813          	add	a6,a0,17
    19a6:	4481                	li	s1,0
    19a8:	e399                	bnez	a5,19ae <printf+0x428>
    19aa:	fef40493          	add	s1,s0,-17
    19ae:	8542                	mv	a0,a6
    19b0:	8626                	mv	a2,s1
    19b2:	02000593          	li	a1,32
    19b6:	7d3000ef          	jal	2988 <memset>
    19ba:	00950833          	add	a6,a0,s1
    return str;
    19be:	b5ad                	j	1828 <printf+0x2a2>
    19c0:	6611                	lui	a2,0x4
    19c2:	4581                	li	a1,0
    19c4:	4281                	li	t0,0
            if (n >= 100)
    19c6:	06300f13          	li	t5,99
    19ca:	7e460613          	add	a2,a2,2020 # 47e4 <__fini_array_end+0x320>
            tmp[len++] = digits[0];
    19ce:	03000f93          	li	t6,48
    for (i = 0; i < 4; i++)
    19d2:	4e91                	li	t4,4
            tmp[len++] = '.';
    19d4:	02e00e13          	li	t3,46
        n = addr[i];
    19d8:	00b88733          	add	a4,a7,a1
    19dc:	00074703          	lbu	a4,0(a4)
        if (n == 0)
    19e0:	12028693          	add	a3,t0,288 # 10120 <__crt0_copy_data_src_begin+0xb404>
    19e4:	0808                	add	a0,sp,16
            tmp[len++] = digits[0];
    19e6:	00128493          	add	s1,t0,1
    19ea:	9536                	add	a0,a0,a3
        if (n == 0)
    19ec:	e305                	bnez	a4,1a0c <printf+0x486>
            tmp[len++] = digits[0];
    19ee:	eff50423          	sb	t6,-280(a0)
    for (i = 0; i < 4; i++)
    19f2:	0585                	add	a1,a1,1
    19f4:	09d58563          	beq	a1,t4,1a7e <printf+0x4f8>
            tmp[len++] = '.';
    19f8:	12048713          	add	a4,s1,288
    19fc:	0814                	add	a3,sp,16
    19fe:	00148293          	add	t0,s1,1
    1a02:	00d704b3          	add	s1,a4,a3
    1a06:	efc48423          	sb	t3,-280(s1)
    1a0a:	b7f9                	j	19d8 <printf+0x452>
            if (n >= 100)
    1a0c:	04ef5a63          	bge	t5,a4,1a60 <printf+0x4da>
                tmp[len++] = digits[n / 100];
    1a10:	06400693          	li	a3,100
    1a14:	02d74333          	div	t1,a4,a3
                tmp[len++] = digits[n / 10];
    1a18:	0289                	add	t0,t0,2
                n          = n % 100;
    1a1a:	02d766b3          	rem	a3,a4,a3
                tmp[len++] = digits[n / 100];
    1a1e:	9332                	add	t1,t1,a2
    1a20:	00034303          	lbu	t1,0(t1)
                tmp[len++] = digits[n / 10];
    1a24:	12048713          	add	a4,s1,288
                tmp[len++] = digits[n / 100];
    1a28:	ee650423          	sb	t1,-280(a0)
                tmp[len++] = digits[n / 10];
    1a2c:	0808                	add	a0,sp,16
    1a2e:	00a704b3          	add	s1,a4,a0
    1a32:	4729                	li	a4,10
    1a34:	02e6c533          	div	a0,a3,a4
                n          = n % 10;
    1a38:	02e6e733          	rem	a4,a3,a4
                tmp[len++] = digits[n / 10];
    1a3c:	9532                	add	a0,a0,a2
    1a3e:	00054503          	lbu	a0,0(a0)
    1a42:	eea48423          	sb	a0,-280(s1)
            tmp[len++] = digits[n];
    1a46:	9732                	add	a4,a4,a2
    1a48:	00074703          	lbu	a4,0(a4)
    1a4c:	12028693          	add	a3,t0,288
    1a50:	0808                	add	a0,sp,16
    1a52:	00128493          	add	s1,t0,1
    1a56:	00a682b3          	add	t0,a3,a0
    1a5a:	eee28423          	sb	a4,-280(t0)
    1a5e:	bf51                	j	19f2 <printf+0x46c>
            else if (n >= 10)
    1a60:	46a5                	li	a3,9
    1a62:	fee6d2e3          	bge	a3,a4,1a46 <printf+0x4c0>
                tmp[len++] = digits[n / 10];
    1a66:	4329                	li	t1,10
    1a68:	026746b3          	div	a3,a4,t1
    1a6c:	82a6                	mv	t0,s1
    1a6e:	96b2                	add	a3,a3,a2
    1a70:	0006c683          	lbu	a3,0(a3)
                n          = n % 10;
    1a74:	02676733          	rem	a4,a4,t1
                tmp[len++] = digits[n / 10];
    1a78:	eed50423          	sb	a3,-280(a0)
                n          = n % 10;
    1a7c:	b7e9                	j	1a46 <printf+0x4c0>
    if (!(type & LEFT))
    1a7e:	8bc1                	and	a5,a5,16
    1a80:	eb8d                	bnez	a5,1ab2 <printf+0x52c>
            *str++ = ' ';
    1a82:	009427b3          	slt	a5,s0,s1
    1a86:	0017cd93          	xor	s11,a5,1
    1a8a:	40940d33          	sub	s10,s0,s1
    1a8e:	4c81                	li	s9,0
    1a90:	e391                	bnez	a5,1a94 <printf+0x50e>
    1a92:	8cea                	mv	s9,s10
    1a94:	8542                	mv	a0,a6
    1a96:	8666                	mv	a2,s9
    1a98:	02000593          	li	a1,32
    1a9c:	6ed000ef          	jal	2988 <memset>
    1aa0:	01950833          	add	a6,a0,s9
    1aa4:	4781                	li	a5,0
    1aa6:	000d8463          	beqz	s11,1aae <printf+0x528>
    1aaa:	41a007b3          	neg	a5,s10
    1aae:	147d                	add	s0,s0,-1
    1ab0:	943e                	add	s0,s0,a5
        *str++ = tmp[i];
    1ab2:	8ca6                	mv	s9,s1
    1ab4:	0004d363          	bgez	s1,1aba <printf+0x534>
    1ab8:	4c81                	li	s9,0
    1aba:	8542                	mv	a0,a6
    1abc:	8666                	mv	a2,s9
    1abe:	082c                	add	a1,sp,24
    1ac0:	771000ef          	jal	2a30 <memcpy>
    1ac4:	01950833          	add	a6,a0,s9
        *str++ = ' ';
    1ac8:	4d01                	li	s10,0
    1aca:	00944463          	blt	s0,s1,1ad2 <printf+0x54c>
    1ace:	40940d33          	sub	s10,s0,s1
    1ad2:	8542                	mv	a0,a6
    1ad4:	866a                	mv	a2,s10
    1ad6:	02000593          	li	a1,32
    1ada:	6af000ef          	jal	2988 <memset>
    1ade:	01a50833          	add	a6,a0,s10
    return str;
    1ae2:	b399                	j	1828 <printf+0x2a2>
                flags |= SIGN;
    1ae4:	0027e793          	or	a5,a5,2
        if (qualifier == 'l')
    1ae8:	06c00693          	li	a3,108
                *str++ = (unsigned char)va_arg(args, int);
    1aec:	00448993          	add	s3,s1,4
        if (qualifier == 'l')
    1af0:	00d59a63          	bne	a1,a3,1b04 <printf+0x57e>
    1af4:	4629                	li	a2,10
            num = va_arg(args, unsigned int);
    1af6:	408c                	lw	a1,0(s1)
    1af8:	00448993          	add	s3,s1,4
    1afc:	a809                	j	1b0e <printf+0x588>
                    --fmt;
    1afe:	197d                	add	s2,s2,-1
    1b00:	89a6                	mv	s3,s1
    1b02:	b31d                	j	1828 <printf+0x2a2>
        else if (flags & SIGN)
    1b04:	0027f693          	and	a3,a5,2
    1b08:	d6f5                	beqz	a3,1af4 <printf+0x56e>
            num = va_arg(args, int);
    1b0a:	408c                	lw	a1,0(s1)
    1b0c:	4629                	li	a2,10
        str = number(str, num, base, field_width, precision, flags);
    1b0e:	86a2                	mv	a3,s0
    1b10:	bbd1                	j	18e4 <printf+0x35e>
        uart_send_char(*p);
    1b12:	a4dff0ef          	jal	155e <uart_send_char>
        n++;
    1b16:	0405                	add	s0,s0,1
        p++;
    1b18:	b4e5                	j	1600 <printf+0x7a>
                base = 16;
    1b1a:	4641                	li	a2,16
    1b1c:	bfe9                	j	1af6 <printf+0x570>
        switch (*fmt)
    1b1e:	4621                	li	a2,8
        if (qualifier == 'l')
    1b20:	bfd9                	j	1af6 <printf+0x570>

00001b22 <neorv32_cpu_get_cycle>:
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    1b22:	c80027f3          	rdcycleh	a5
    1b26:	c0002573          	rdcycle	a0
    1b2a:	c80025f3          	rdcycleh	a1
  uint32_t tmp1 = 0, tmp2 = 0, tmp3 = 0;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
    1b2e:	fef59ae3          	bne	a1,a5,1b22 <neorv32_cpu_get_cycle>
  subwords64_t cycles;
  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
    1b32:	8082                	ret

00001b34 <neorv32_cpu_hpm_get_num_counters>:
    1b34:	fc002573          	csrr	a0,0xfc0
 * @return Returns number of available HPM counters.
 **************************************************************************/
uint32_t neorv32_cpu_hpm_get_num_counters(void) {

  // HPMs implemented at all?
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1<<CSR_MXISA_ZIHPM)) == 0) {
    1b38:	20057513          	and	a0,a0,512
    1b3c:	c549                	beqz	a0,1bc6 <neorv32_cpu_hpm_get_num_counters+0x92>
 * @param[in] mask Bit mask (high-active) to set bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_set(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrs %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    1b3e:	57e1                	li	a5,-8
    1b40:	3207a073          	csrs	mcountinhibit,a5
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    1b44:	4785                	li	a5,1
    1b46:	b0379073          	csrw	mhpmcounter3,a5
    1b4a:	b0479073          	csrw	mhpmcounter4,a5
    1b4e:	b0579073          	csrw	mhpmcounter5,a5
    1b52:	b0679073          	csrw	mhpmcounter6,a5
    1b56:	b0779073          	csrw	mhpmcounter7,a5
    1b5a:	b0879073          	csrw	mhpmcounter8,a5
    1b5e:	b0979073          	csrw	mhpmcounter9,a5
    1b62:	b0a79073          	csrw	mhpmcounter10,a5
    1b66:	b0b79073          	csrw	mhpmcounter11,a5
    1b6a:	b0c79073          	csrw	mhpmcounter12,a5
    1b6e:	b0d79073          	csrw	mhpmcounter13,a5
    1b72:	b0e79073          	csrw	mhpmcounter14,a5
    1b76:	b0f79073          	csrw	mhpmcounter15,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    1b7a:	b03027f3          	csrr	a5,mhpmcounter3
    1b7e:	b0402573          	csrr	a0,mhpmcounter4
  neorv32_cpu_csr_write(CSR_MHPMCOUNTER15, 1);

  // sum-up all actually set HPMs
  uint32_t num_hpm = 0;
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER3);
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER4);
    1b82:	953e                	add	a0,a0,a5
    1b84:	b05027f3          	csrr	a5,mhpmcounter5
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER5);
    1b88:	953e                	add	a0,a0,a5
    1b8a:	b06027f3          	csrr	a5,mhpmcounter6
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER6);
    1b8e:	953e                	add	a0,a0,a5
    1b90:	b07027f3          	csrr	a5,mhpmcounter7
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER7);
    1b94:	953e                	add	a0,a0,a5
    1b96:	b08027f3          	csrr	a5,mhpmcounter8
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER8);
    1b9a:	953e                	add	a0,a0,a5
    1b9c:	b09027f3          	csrr	a5,mhpmcounter9
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER9);
    1ba0:	953e                	add	a0,a0,a5
    1ba2:	b0a027f3          	csrr	a5,mhpmcounter10
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER10);
    1ba6:	953e                	add	a0,a0,a5
    1ba8:	b0b027f3          	csrr	a5,mhpmcounter11
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER11);
    1bac:	953e                	add	a0,a0,a5
    1bae:	b0c027f3          	csrr	a5,mhpmcounter12
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER12);
    1bb2:	953e                	add	a0,a0,a5
    1bb4:	b0d027f3          	csrr	a5,mhpmcounter13
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER13);
    1bb8:	953e                	add	a0,a0,a5
    1bba:	b0e027f3          	csrr	a5,mhpmcounter14
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER14);
    1bbe:	953e                	add	a0,a0,a5
    1bc0:	b0f027f3          	csrr	a5,mhpmcounter15
  num_hpm += neorv32_cpu_csr_read(CSR_MHPMCOUNTER15);
    1bc4:	953e                	add	a0,a0,a5

  return num_hpm;
}
    1bc6:	8082                	ret

00001bc8 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
    1bc8:	557d                	li	a0,-1
    1bca:	8082                	ret

00001bcc <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
    1bcc:	6789                	lui	a5,0x2
    1bce:	c1dc                	sw	a5,4(a1)
  return 0;
}
    1bd0:	4501                	li	a0,0
    1bd2:	8082                	ret

00001bd4 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
    1bd4:	4505                	li	a0,1
    1bd6:	8082                	ret

00001bd8 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
    1bd8:	4501                	li	a0,0
    1bda:	8082                	ret

00001bdc <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
    1bdc:	1101                	add	sp,sp,-32
    1bde:	ca26                	sw	s1,20(sp)
    1be0:	c84a                	sw	s2,16(sp)
    1be2:	ce06                	sw	ra,28(sp)
    1be4:	cc22                	sw	s0,24(sp)
    1be6:	c64e                	sw	s3,12(sp)
    1be8:	c452                	sw	s4,8(sp)
    1bea:	892e                	mv	s2,a1
    1bec:	84b2                	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
    1bee:	e129                	bnez	a0,1c30 <_read+0x54>
    1bf0:	842a                	mv	s0,a0
    1bf2:	fff50537          	lui	a0,0xfff50
    1bf6:	2bc5                	jal	21e6 <neorv32_uart_available>
    1bf8:	cd05                	beqz	a0,1c30 <_read+0x54>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1bfa:	49a9                	li	s3,10
    1bfc:	4a35                	li	s4,13
    while (len--) {
    1bfe:	00941463          	bne	s0,s1,1c06 <_read+0x2a>
        return read_cnt;
      }
    }
    return read_cnt;
    1c02:	8426                	mv	s0,s1
    1c04:	a829                	j	1c1e <_read+0x42>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
    1c06:	fff50537          	lui	a0,0xfff50
    1c0a:	2585                	jal	226a <neorv32_uart_getc>
      *ptr++ = c;
    1c0c:	008907b3          	add	a5,s2,s0
    1c10:	00a78023          	sb	a0,0(a5) # 2000 <__neorv32_ram_size>
      read_cnt++;
    1c14:	0405                	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1c16:	01350463          	beq	a0,s3,1c1e <_read+0x42>
    1c1a:	ff4512e3          	bne	a0,s4,1bfe <_read+0x22>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    1c1e:	40f2                	lw	ra,28(sp)
    1c20:	8522                	mv	a0,s0
    1c22:	4462                	lw	s0,24(sp)
    1c24:	44d2                	lw	s1,20(sp)
    1c26:	4942                	lw	s2,16(sp)
    1c28:	49b2                	lw	s3,12(sp)
    1c2a:	4a22                	lw	s4,8(sp)
    1c2c:	6105                	add	sp,sp,32
    1c2e:	8082                	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1c30:	fff60537          	lui	a0,0xfff60
    1c34:	2b4d                	jal	21e6 <neorv32_uart_available>
  int read_cnt = 0;
    1c36:	4401                	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1c38:	c115                	beqz	a0,1c5c <_read+0x80>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1c3a:	49a9                	li	s3,10
    1c3c:	4a35                	li	s4,13
    while (len--) {
    1c3e:	fc9402e3          	beq	s0,s1,1c02 <_read+0x26>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
    1c42:	fff60537          	lui	a0,0xfff60
    1c46:	2515                	jal	226a <neorv32_uart_getc>
      *ptr++ = c;
    1c48:	008907b3          	add	a5,s2,s0
    1c4c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
    1c50:	0405                	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1c52:	fd3506e3          	beq	a0,s3,1c1e <_read+0x42>
    1c56:	ff4514e3          	bne	a0,s4,1c3e <_read+0x62>
    1c5a:	b7d1                	j	1c1e <_read+0x42>
    errno = ENOSYS;
    1c5c:	800007b7          	lui	a5,0x80000
    1c60:	05800713          	li	a4,88
    1c64:	58e7a223          	sw	a4,1412(a5) # 80000584 <errno>
    return -1;
    1c68:	547d                	li	s0,-1
    1c6a:	bf55                	j	1c1e <_read+0x42>

00001c6c <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
    1c6c:	1141                	add	sp,sp,-16
    1c6e:	c422                	sw	s0,8(sp)
    1c70:	c226                	sw	s1,4(sp)
    1c72:	c606                	sw	ra,12(sp)
    1c74:	c04a                	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1c76:	157d                	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7ff5e000>
    1c78:	4785                	li	a5,1
int _write(int file, char *ptr, int len) {
    1c7a:	842e                	mv	s0,a1
    1c7c:	84b2                	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1c7e:	02a7ef63          	bltu	a5,a0,1cbc <_write+0x50>
    if (neorv32_uart_available(NEORV32_UART0)) {
    1c82:	fff50537          	lui	a0,0xfff50
    1c86:	2385                	jal	21e6 <neorv32_uart_available>
    1c88:	00940933          	add	s2,s0,s1
    1c8c:	ed19                	bnez	a0,1caa <_write+0x3e>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
    1c8e:	800007b7          	lui	a5,0x80000
    1c92:	05800713          	li	a4,88
    1c96:	58e7a223          	sw	a4,1412(a5) # 80000584 <errno>
      return -1;
    1c9a:	54fd                	li	s1,-1
    1c9c:	a809                	j	1cae <_write+0x42>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
    1c9e:	00044583          	lbu	a1,0(s0)
    1ca2:	fff50537          	lui	a0,0xfff50
    1ca6:	0405                	add	s0,s0,1
    1ca8:	2b55                	jal	225c <neorv32_uart_putc>
      while (len--) {
    1caa:	fe891ae3          	bne	s2,s0,1c9e <_write+0x32>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    1cae:	40b2                	lw	ra,12(sp)
    1cb0:	4422                	lw	s0,8(sp)
    1cb2:	4902                	lw	s2,0(sp)
    1cb4:	8526                	mv	a0,s1
    1cb6:	4492                	lw	s1,4(sp)
    1cb8:	0141                	add	sp,sp,16
    1cba:	8082                	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
    1cbc:	fff60537          	lui	a0,0xfff60
    1cc0:	231d                	jal	21e6 <neorv32_uart_available>
    1cc2:	00940933          	add	s2,s0,s1
    1cc6:	d561                	beqz	a0,1c8e <_write+0x22>
    while (len--) {
    1cc8:	ff2403e3          	beq	s0,s2,1cae <_write+0x42>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
    1ccc:	00044583          	lbu	a1,0(s0)
    1cd0:	fff60537          	lui	a0,0xfff60
    1cd4:	0405                	add	s0,s0,1
    1cd6:	2359                	jal	225c <neorv32_uart_putc>
      write_cnt++;
    1cd8:	bfc5                	j	1cc8 <_write+0x5c>

00001cda <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
    1cda:	80000737          	lui	a4,0x80000
    1cde:	57472683          	lw	a3,1396(a4) # 80000574 <curr_heap.0>
    1ce2:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
    1ce6:	87aa                	mv	a5,a0
    1ce8:	f3860613          	add	a2,a2,-200 # 80000f38 <__crt0_bss_end>
  if (curr_heap == NULL) {
    1cec:	e299                	bnez	a3,1cf2 <_sbrk+0x18>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
    1cee:	56c72a23          	sw	a2,1396(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
    1cf2:	800016b7          	lui	a3,0x80001
    1cf6:	f3868693          	add	a3,a3,-200 # 80000f38 <__crt0_bss_end>
    1cfa:	00c69963          	bne	a3,a2,1d0c <_sbrk+0x32>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
    1cfe:	800007b7          	lui	a5,0x80000
    1d02:	4731                	li	a4,12
    1d04:	58e7a223          	sw	a4,1412(a5) # 80000584 <errno>
    return (void*)-1; // error - no more memory
    1d08:	557d                	li	a0,-1
    1d0a:	8082                	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
    1d0c:	57472503          	lw	a0,1396(a4)
    1d10:	97aa                	add	a5,a5,a0
    1d12:	fed7f6e3          	bgeu	a5,a3,1cfe <_sbrk+0x24>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
    1d16:	56f72a23          	sw	a5,1396(a4)

  return (void*)prev_heap;
}
    1d1a:	8082                	ret

00001d1c <neorv32_rte_core>:
 * executed in machine mode).
 **************************************************************************/
void __attribute__((__naked__,aligned(4))) neorv32_rte_core(void) {

  // save context
  asm volatile (
    1d1c:	34011073          	csrw	mscratch,sp
    1d20:	7119                	add	sp,sp,-128
    1d22:	c002                	sw	zero,0(sp)
    1d24:	c206                	sw	ra,4(sp)
    1d26:	340110f3          	csrrw	ra,mscratch,sp
    1d2a:	c406                	sw	ra,8(sp)
    1d2c:	c60e                	sw	gp,12(sp)
    1d2e:	c812                	sw	tp,16(sp)
    1d30:	ca16                	sw	t0,20(sp)
    1d32:	cc1a                	sw	t1,24(sp)
    1d34:	ce1e                	sw	t2,28(sp)
    1d36:	d022                	sw	s0,32(sp)
    1d38:	d226                	sw	s1,36(sp)
    1d3a:	d42a                	sw	a0,40(sp)
    1d3c:	d62e                	sw	a1,44(sp)
    1d3e:	d832                	sw	a2,48(sp)
    1d40:	da36                	sw	a3,52(sp)
    1d42:	dc3a                	sw	a4,56(sp)
    1d44:	de3e                	sw	a5,60(sp)
    1d46:	c0c2                	sw	a6,64(sp)
    1d48:	c2c6                	sw	a7,68(sp)
    1d4a:	c4ca                	sw	s2,72(sp)
    1d4c:	c6ce                	sw	s3,76(sp)
    1d4e:	c8d2                	sw	s4,80(sp)
    1d50:	cad6                	sw	s5,84(sp)
    1d52:	ccda                	sw	s6,88(sp)
    1d54:	cede                	sw	s7,92(sp)
    1d56:	d0e2                	sw	s8,96(sp)
    1d58:	d2e6                	sw	s9,100(sp)
    1d5a:	d4ea                	sw	s10,104(sp)
    1d5c:	d6ee                	sw	s11,108(sp)
    1d5e:	d8f2                	sw	t3,112(sp)
    1d60:	daf6                	sw	t4,116(sp)
    1d62:	dcfa                	sw	t5,120(sp)
    1d64:	defe                	sw	t6,124(sp)
#endif
  );

  // flush context (stack frame) to main memory
  // reload trap table from main memory
  asm volatile ("fence");
    1d66:	0ff0000f          	fence
    1d6a:	342027f3          	csrr	a5,mcause

  // find according trap handler base address
  uint32_t handler_base = 0;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
    1d6e:	472d                	li	a4,11
    1d70:	02f76063          	bltu	a4,a5,1d90 <neorv32_rte_core+0x74>
    1d74:	6715                	lui	a4,0x5
    1d76:	078a                	sll	a5,a5,0x2
    1d78:	b4870713          	add	a4,a4,-1208 # 4b48 <intpat+0x84>
    1d7c:	97ba                	add	a5,a5,a4
    1d7e:	439c                	lw	a5,0(a5)
    1d80:	8782                	jr	a5
    1d82:	6715                	lui	a4,0x5
    1d84:	078a                	sll	a5,a5,0x2
    1d86:	b7870713          	add	a4,a4,-1160 # 4b78 <intpat+0xb4>
    1d8a:	97ba                	add	a5,a5,a4
    1d8c:	439c                	lw	a5,0(a5)
    1d8e:	8782                	jr	a5
    1d90:	80000737          	lui	a4,0x80000
    1d94:	1775                	add	a4,a4,-3 # 7ffffffd <__neorv32_rom_size+0x7ffdfffd>
    1d96:	97ba                	add	a5,a5,a4
    1d98:	4771                	li	a4,28
    1d9a:	fef774e3          	bgeu	a4,a5,1d82 <neorv32_rte_core+0x66>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    default:                     handler_base = (uint32_t)(&neorv32_rte_debug_handler);          break;
    1d9e:	6789                	lui	a5,0x2
    1da0:	fe278793          	add	a5,a5,-30 # 1fe2 <neorv32_rte_debug_handler>

  // call handler
  if (handler_base != 0) {
    typedef void handler_t();
    handler_t* handler = (handler_t*)handler_base;
    handler();
    1da4:	9782                	jalr	a5
    1da6:	a031                	j	1db2 <neorv32_rte_core+0x96>
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
    1da8:	800017b7          	lui	a5,0x80001
    1dac:	d647a783          	lw	a5,-668(a5) # 80000d64 <__neorv32_rte_vector_lut>
  if (handler_base != 0) {
    1db0:	fbf5                	bnez	a5,1da4 <neorv32_rte_core+0x88>
    1db2:	342027f3          	csrr	a5,mcause
  }

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if (((cause >> 31) == 0) && (cause != TRAP_CODE_I_ACCESS)) {
    1db6:	0207c763          	bltz	a5,1de4 <neorv32_rte_core+0xc8>
    1dba:	4705                	li	a4,1
    1dbc:	02e78463          	beq	a5,a4,1de4 <neorv32_rte_core+0xc8>
    1dc0:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
    1dc4:	00468713          	add	a4,a3,4
    1dc8:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
    1dcc:	8b91                	and	a5,a5,4
    1dce:	cb89                	beqz	a5,1de0 <neorv32_rte_core+0xc4>
    1dd0:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
    1dd4:	460d                	li	a2,3
    1dd6:	8b8d                	and	a5,a5,3
    1dd8:	00c78463          	beq	a5,a2,1de0 <neorv32_rte_core+0xc4>
        rte_mepc -= 2;
    1ddc:	00268713          	add	a4,a3,2
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    1de0:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
    1de4:	4092                	lw	ra,4(sp)
    1de6:	41b2                	lw	gp,12(sp)
    1de8:	4242                	lw	tp,16(sp)
    1dea:	42d2                	lw	t0,20(sp)
    1dec:	4362                	lw	t1,24(sp)
    1dee:	43f2                	lw	t2,28(sp)
    1df0:	5402                	lw	s0,32(sp)
    1df2:	5492                	lw	s1,36(sp)
    1df4:	5522                	lw	a0,40(sp)
    1df6:	55b2                	lw	a1,44(sp)
    1df8:	5642                	lw	a2,48(sp)
    1dfa:	56d2                	lw	a3,52(sp)
    1dfc:	5762                	lw	a4,56(sp)
    1dfe:	57f2                	lw	a5,60(sp)
    1e00:	4806                	lw	a6,64(sp)
    1e02:	4896                	lw	a7,68(sp)
    1e04:	4926                	lw	s2,72(sp)
    1e06:	49b6                	lw	s3,76(sp)
    1e08:	4a46                	lw	s4,80(sp)
    1e0a:	4ad6                	lw	s5,84(sp)
    1e0c:	4b66                	lw	s6,88(sp)
    1e0e:	4bf6                	lw	s7,92(sp)
    1e10:	5c06                	lw	s8,96(sp)
    1e12:	5c96                	lw	s9,100(sp)
    1e14:	5d26                	lw	s10,104(sp)
    1e16:	5db6                	lw	s11,108(sp)
    1e18:	5e46                	lw	t3,112(sp)
    1e1a:	5ed6                	lw	t4,116(sp)
    1e1c:	5f66                	lw	t5,120(sp)
    1e1e:	5ff6                	lw	t6,124(sp)
    1e20:	4122                	lw	sp,8(sp)
    1e22:	30200073          	mret
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
    1e26:	800017b7          	lui	a5,0x80001
    1e2a:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e2e:	43dc                	lw	a5,4(a5)
    1e30:	b741                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
    1e32:	800017b7          	lui	a5,0x80001
    1e36:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e3a:	479c                	lw	a5,8(a5)
    1e3c:	bf95                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
    1e3e:	800017b7          	lui	a5,0x80001
    1e42:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e46:	47dc                	lw	a5,12(a5)
    1e48:	b7a5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
    1e4a:	800017b7          	lui	a5,0x80001
    1e4e:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e52:	4b9c                	lw	a5,16(a5)
    1e54:	bfb1                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
    1e56:	800017b7          	lui	a5,0x80001
    1e5a:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e5e:	4bdc                	lw	a5,20(a5)
    1e60:	bf81                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
    1e62:	800017b7          	lui	a5,0x80001
    1e66:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e6a:	4f9c                	lw	a5,24(a5)
    1e6c:	b791                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
    1e6e:	800017b7          	lui	a5,0x80001
    1e72:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e76:	4fdc                	lw	a5,28(a5)
    1e78:	bf25                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
    1e7a:	800017b7          	lui	a5,0x80001
    1e7e:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e82:	539c                	lw	a5,32(a5)
    1e84:	b735                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
    1e86:	800017b7          	lui	a5,0x80001
    1e8a:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e8e:	53dc                	lw	a5,36(a5)
    1e90:	b705                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
    1e92:	800017b7          	lui	a5,0x80001
    1e96:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1e9a:	579c                	lw	a5,40(a5)
    1e9c:	bf11                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
    1e9e:	800017b7          	lui	a5,0x80001
    1ea2:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1ea6:	57dc                	lw	a5,44(a5)
    1ea8:	b721                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
    1eaa:	800017b7          	lui	a5,0x80001
    1eae:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1eb2:	5b9c                	lw	a5,48(a5)
    1eb4:	bdf5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
    1eb6:	800017b7          	lui	a5,0x80001
    1eba:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1ebe:	5bdc                	lw	a5,52(a5)
    1ec0:	bdc5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
    1ec2:	800017b7          	lui	a5,0x80001
    1ec6:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1eca:	5f9c                	lw	a5,56(a5)
    1ecc:	b5d5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
    1ece:	800017b7          	lui	a5,0x80001
    1ed2:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1ed6:	5fdc                	lw	a5,60(a5)
    1ed8:	bde1                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
    1eda:	800017b7          	lui	a5,0x80001
    1ede:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1ee2:	43bc                	lw	a5,64(a5)
    1ee4:	b5f1                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
    1ee6:	800017b7          	lui	a5,0x80001
    1eea:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1eee:	43fc                	lw	a5,68(a5)
    1ef0:	b5c1                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
    1ef2:	800017b7          	lui	a5,0x80001
    1ef6:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1efa:	47bc                	lw	a5,72(a5)
    1efc:	bd55                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
    1efe:	800017b7          	lui	a5,0x80001
    1f02:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f06:	47fc                	lw	a5,76(a5)
    1f08:	b565                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
    1f0a:	800017b7          	lui	a5,0x80001
    1f0e:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f12:	4bbc                	lw	a5,80(a5)
    1f14:	bd71                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
    1f16:	800017b7          	lui	a5,0x80001
    1f1a:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f1e:	4bfc                	lw	a5,84(a5)
    1f20:	bd41                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
    1f22:	800017b7          	lui	a5,0x80001
    1f26:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f2a:	4fbc                	lw	a5,88(a5)
    1f2c:	b551                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
    1f2e:	800017b7          	lui	a5,0x80001
    1f32:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f36:	4ffc                	lw	a5,92(a5)
    1f38:	bda5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    1f3a:	800017b7          	lui	a5,0x80001
    1f3e:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f42:	53bc                	lw	a5,96(a5)
    1f44:	b5b5                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    1f46:	800017b7          	lui	a5,0x80001
    1f4a:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f4e:	53fc                	lw	a5,100(a5)
    1f50:	b585                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    1f52:	800017b7          	lui	a5,0x80001
    1f56:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f5a:	57bc                	lw	a5,104(a5)
    1f5c:	bd91                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    1f5e:	800017b7          	lui	a5,0x80001
    1f62:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f66:	57fc                	lw	a5,108(a5)
    1f68:	b5a1                	j	1db0 <neorv32_rte_core+0x94>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    1f6a:	800017b7          	lui	a5,0x80001
    1f6e:	d6478793          	add	a5,a5,-668 # 80000d64 <__neorv32_rte_vector_lut>
    1f72:	5bbc                	lw	a5,112(a5)
    1f74:	bd35                	j	1db0 <neorv32_rte_core+0x94>
    1f76:	0000                	unimp

00001f78 <__neorv32_rte_print_hex>:
 *
 * @param[in] num Number to print as hexadecimal via UART0.
 *
 * @param[in] digits Number of hexadecimal digits to print (0..8).
 **************************************************************************/
void __neorv32_rte_print_hex(uint32_t num, int digits) {
    1f78:	7179                	add	sp,sp,-48
    1f7a:	d04a                	sw	s2,32(sp)
    1f7c:	892e                	mv	s2,a1

  int i = 0;
  const char hex_symbols[] = "0123456789ABCDEF";
    1f7e:	6595                	lui	a1,0x5
void __neorv32_rte_print_hex(uint32_t num, int digits) {
    1f80:	d226                	sw	s1,36(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
    1f82:	4645                	li	a2,17
void __neorv32_rte_print_hex(uint32_t num, int digits) {
    1f84:	84aa                	mv	s1,a0
  const char hex_symbols[] = "0123456789ABCDEF";
    1f86:	83c58593          	add	a1,a1,-1988 # 483c <__fini_array_end+0x378>
    1f8a:	0068                	add	a0,sp,12
void __neorv32_rte_print_hex(uint32_t num, int digits) {
    1f8c:	d606                	sw	ra,44(sp)
    1f8e:	d422                	sw	s0,40(sp)
  const char hex_symbols[] = "0123456789ABCDEF";
    1f90:	2a1000ef          	jal	2a30 <memcpy>

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
    1f94:	fff50537          	lui	a0,0xfff50
    1f98:	24b9                	jal	21e6 <neorv32_uart_available>
    1f9a:	cd15                	beqz	a0,1fd6 <__neorv32_rte_print_hex+0x5e>
    neorv32_uart0_putc('0');
    1f9c:	03000593          	li	a1,48
    1fa0:	fff50537          	lui	a0,0xfff50
    1fa4:	2c65                	jal	225c <neorv32_uart_putc>
    neorv32_uart0_putc('x');
    1fa6:	443d                	li	s0,15
    1fa8:	41240433          	sub	s0,s0,s2
    1fac:	07800593          	li	a1,120
    1fb0:	fff50537          	lui	a0,0xfff50
    1fb4:	2465                	jal	225c <neorv32_uart_putc>

    for (i=(digits-8); i<8; i++) {
    1fb6:	040a                	sll	s0,s0,0x2
    1fb8:	5971                	li	s2,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
    1fba:	0084d7b3          	srl	a5,s1,s0
    1fbe:	8bbd                	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
    1fc0:	02078793          	add	a5,a5,32
    1fc4:	978a                	add	a5,a5,sp
    1fc6:	fec7c583          	lbu	a1,-20(a5)
    1fca:	fff50537          	lui	a0,0xfff50
    for (i=(digits-8); i<8; i++) {
    1fce:	1471                	add	s0,s0,-4
      neorv32_uart0_putc(hex_symbols[index]);
    1fd0:	2471                	jal	225c <neorv32_uart_putc>
    for (i=(digits-8); i<8; i++) {
    1fd2:	ff2414e3          	bne	s0,s2,1fba <__neorv32_rte_print_hex+0x42>
    }
  }
}
    1fd6:	50b2                	lw	ra,44(sp)
    1fd8:	5422                	lw	s0,40(sp)
    1fda:	5492                	lw	s1,36(sp)
    1fdc:	5902                	lw	s2,32(sp)
    1fde:	6145                	add	sp,sp,48
    1fe0:	8082                	ret

00001fe2 <neorv32_rte_debug_handler>:
void neorv32_rte_debug_handler(void) {
    1fe2:	1141                	add	sp,sp,-16
  if (neorv32_uart0_available() == 0) {
    1fe4:	fff50537          	lui	a0,0xfff50
void neorv32_rte_debug_handler(void) {
    1fe8:	c606                	sw	ra,12(sp)
    1fea:	c422                	sw	s0,8(sp)
  if (neorv32_uart0_available() == 0) {
    1fec:	2aed                	jal	21e6 <neorv32_uart_available>
    1fee:	1a050663          	beqz	a0,219a <__neorv32_ram_size+0x19a>
  neorv32_uart0_puts("<NEORV32-RTE> ");
    1ff2:	6595                	lui	a1,0x5
    1ff4:	85058593          	add	a1,a1,-1968 # 4850 <__fini_array_end+0x38c>
    1ff8:	fff50537          	lui	a0,0xfff50
    1ffc:	2441                	jal	227c <neorv32_uart_puts>
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    1ffe:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) & 1) {
    2002:	8b85                	and	a5,a5,1
    2004:	c3a1                	beqz	a5,2044 <__neorv32_ram_size+0x44>
    neorv32_uart0_puts("[cpu1|");
    2006:	6595                	lui	a1,0x5
    2008:	86058593          	add	a1,a1,-1952 # 4860 <__fini_array_end+0x39c>
    neorv32_uart0_puts("[cpu0|");
    200c:	fff50537          	lui	a0,0xfff50
    2010:	24b5                	jal	227c <neorv32_uart_puts>
    2012:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
    2016:	00b7d713          	srl	a4,a5,0xb
    201a:	8b0d                	and	a4,a4,3
    201c:	cb05                	beqz	a4,204c <__neorv32_ram_size+0x4c>
    neorv32_uart0_puts("M] "); // machine-mode
    201e:	6595                	lui	a1,0x5
    2020:	87058593          	add	a1,a1,-1936 # 4870 <__fini_array_end+0x3ac>
    neorv32_uart0_puts("U] "); // user-mode
    2024:	fff50537          	lui	a0,0xfff50
    2028:	2c91                	jal	227c <neorv32_uart_puts>
    202a:	34202473          	csrr	s0,mcause
  switch (trap_cause) {
    202e:	47ad                	li	a5,11
    2030:	0287e263          	bltu	a5,s0,2054 <__neorv32_ram_size+0x54>
    2034:	6715                	lui	a4,0x5
    2036:	00241793          	sll	a5,s0,0x2
    203a:	bec70713          	add	a4,a4,-1044 # 4bec <intpat+0x128>
    203e:	97ba                	add	a5,a5,a4
    2040:	439c                	lw	a5,0(a5)
    2042:	8782                	jr	a5
    neorv32_uart0_puts("[cpu0|");
    2044:	6595                	lui	a1,0x5
    2046:	86858593          	add	a1,a1,-1944 # 4868 <__fini_array_end+0x3a4>
    204a:	b7c9                	j	200c <__neorv32_ram_size+0xc>
    neorv32_uart0_puts("U] "); // user-mode
    204c:	6595                	lui	a1,0x5
    204e:	87458593          	add	a1,a1,-1932 # 4874 <__fini_array_end+0x3b0>
    2052:	bfc9                	j	2024 <__neorv32_ram_size+0x24>
  switch (trap_cause) {
    2054:	800007b7          	lui	a5,0x80000
    2058:	07ad                	add	a5,a5,11 # 8000000b <__malloc_av_+0xb>
    205a:	10f40d63          	beq	s0,a5,2174 <__neorv32_ram_size+0x174>
    205e:	0287e463          	bltu	a5,s0,2086 <__neorv32_ram_size+0x86>
    2062:	800007b7          	lui	a5,0x80000
    2066:	078d                	add	a5,a5,3 # 80000003 <__malloc_av_+0x3>
    2068:	0ef40e63          	beq	s0,a5,2164 <__neorv32_ram_size+0x164>
    206c:	800007b7          	lui	a5,0x80000
    2070:	079d                	add	a5,a5,7 # 80000007 <__malloc_av_+0x7>
    2072:	0ef40d63          	beq	s0,a5,216c <__neorv32_ram_size+0x16c>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
    2076:	6595                	lui	a1,0x5
    2078:	9cc58593          	add	a1,a1,-1588 # 49cc <__fini_array_end+0x508>
    207c:	fff50537          	lui	a0,0xfff50
    2080:	2af5                	jal	227c <neorv32_uart_puts>
    2082:	45a1                	li	a1,8
    2084:	a839                	j	20a2 <__neorv32_ram_size+0xa2>
  switch (trap_cause) {
    2086:	800007b7          	lui	a5,0x80000
    208a:	17c1                	add	a5,a5,-16 # 7ffffff0 <__neorv32_rom_size+0x7ffdfff0>
    208c:	97a2                	add	a5,a5,s0
    208e:	473d                	li	a4,15
    2090:	fef763e3          	bltu	a4,a5,2076 <__neorv32_ram_size+0x76>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex(trap_cause, 1); break;
    2094:	6595                	lui	a1,0x5
    2096:	9c058593          	add	a1,a1,-1600 # 49c0 <__fini_array_end+0x4fc>
    209a:	fff50537          	lui	a0,0xfff50
    209e:	2af9                	jal	227c <neorv32_uart_puts>
    20a0:	4585                	li	a1,1
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex(trap_cause, 8); break;
    20a2:	8522                	mv	a0,s0
    20a4:	3dd1                	jal	1f78 <__neorv32_rte_print_hex>
    20a6:	a039                	j	20b4 <__neorv32_ram_size+0xb4>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
    20a8:	6595                	lui	a1,0x5
    20aa:	87858593          	add	a1,a1,-1928 # 4878 <__fini_array_end+0x3b4>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
    20ae:	fff50537          	lui	a0,0xfff50
    20b2:	22e9                	jal	227c <neorv32_uart_puts>
  neorv32_uart0_puts(" @ PC=");
    20b4:	6595                	lui	a1,0x5
    20b6:	9e058593          	add	a1,a1,-1568 # 49e0 <__fini_array_end+0x51c>
    20ba:	fff50537          	lui	a0,0xfff50
    20be:	2a7d                	jal	227c <neorv32_uart_puts>
    20c0:	34102573          	csrr	a0,mepc
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MEPC), 8);
    20c4:	45a1                	li	a1,8
    20c6:	3d4d                	jal	1f78 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTINST=");
    20c8:	6595                	lui	a1,0x5
    20ca:	9e858593          	add	a1,a1,-1560 # 49e8 <__fini_array_end+0x524>
    20ce:	fff50537          	lui	a0,0xfff50
    20d2:	226d                	jal	227c <neorv32_uart_puts>
    20d4:	34a02573          	csrr	a0,0x34a
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTINST), 8);
    20d8:	45a1                	li	a1,8
    20da:	3d79                	jal	1f78 <__neorv32_rte_print_hex>
  neorv32_uart0_puts(", MTVAL=");
    20dc:	6595                	lui	a1,0x5
    20de:	9f458593          	add	a1,a1,-1548 # 49f4 <__fini_array_end+0x530>
    20e2:	fff50537          	lui	a0,0xfff50
    20e6:	2a59                	jal	227c <neorv32_uart_puts>
    20e8:	34302573          	csrr	a0,mtval
  __neorv32_rte_print_hex(neorv32_cpu_csr_read(CSR_MTVAL), 8);
    20ec:	45a1                	li	a1,8
    20ee:	3569                	jal	1f78 <__neorv32_rte_print_hex>
  if (((int32_t)trap_cause) < 0) { // is interrupt
    20f0:	08045663          	bgez	s0,217c <__neorv32_ram_size+0x17c>
    neorv32_uart0_puts(" Disabling IRQ source");
    20f4:	6595                	lui	a1,0x5
    20f6:	a0058593          	add	a1,a1,-1536 # 4a00 <__fini_array_end+0x53c>
    20fa:	fff50537          	lui	a0,0xfff50
    20fe:	2abd                	jal	227c <neorv32_uart_puts>
    neorv32_cpu_csr_clr(CSR_MIE, 1 << (trap_cause & 0x1f));
    2100:	4785                	li	a5,1
    2102:	008797b3          	sll	a5,a5,s0
 * @param[in] mask Bit mask (high-active) to clear bits (uint32_t).
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;
  asm volatile ("csrc %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    2106:	3047b073          	csrc	mie,a5
}
    210a:	4422                	lw	s0,8(sp)
    210c:	40b2                	lw	ra,12(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    210e:	6595                	lui	a1,0x5
    2110:	a3858593          	add	a1,a1,-1480 # 4a38 <__fini_array_end+0x574>
    2114:	fff50537          	lui	a0,0xfff50
}
    2118:	0141                	add	sp,sp,16
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
    211a:	a28d                	j	227c <neorv32_uart_puts>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
    211c:	6595                	lui	a1,0x5
    211e:	89458593          	add	a1,a1,-1900 # 4894 <__fini_array_end+0x3d0>
    2122:	b771                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
    2124:	6595                	lui	a1,0x5
    2126:	8a858593          	add	a1,a1,-1880 # 48a8 <__fini_array_end+0x3e4>
    212a:	b751                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Environment breakpoint"); break;
    212c:	6595                	lui	a1,0x5
    212e:	8c858593          	add	a1,a1,-1848 # 48c8 <__fini_array_end+0x404>
    2132:	bfb5                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
    2134:	6595                	lui	a1,0x5
    2136:	8e058593          	add	a1,a1,-1824 # 48e0 <__fini_array_end+0x41c>
    213a:	bf95                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
    213c:	6595                	lui	a1,0x5
    213e:	8f858593          	add	a1,a1,-1800 # 48f8 <__fini_array_end+0x434>
    2142:	b7b5                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
    2144:	6595                	lui	a1,0x5
    2146:	90c58593          	add	a1,a1,-1780 # 490c <__fini_array_end+0x448>
    214a:	b795                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
    214c:	6595                	lui	a1,0x5
    214e:	92858593          	add	a1,a1,-1752 # 4928 <__fini_array_end+0x464>
    2152:	bfb1                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
    2154:	6595                	lui	a1,0x5
    2156:	93c58593          	add	a1,a1,-1732 # 493c <__fini_array_end+0x478>
    215a:	bf91                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
    215c:	6595                	lui	a1,0x5
    215e:	95c58593          	add	a1,a1,-1700 # 495c <__fini_array_end+0x498>
    2162:	b7b1                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
    2164:	6595                	lui	a1,0x5
    2166:	97c58593          	add	a1,a1,-1668 # 497c <__fini_array_end+0x4b8>
    216a:	b791                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
    216c:	6595                	lui	a1,0x5
    216e:	99458593          	add	a1,a1,-1644 # 4994 <__fini_array_end+0x4d0>
    2172:	bf35                	j	20ae <__neorv32_ram_size+0xae>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
    2174:	6595                	lui	a1,0x5
    2176:	9a858593          	add	a1,a1,-1624 # 49a8 <__fini_array_end+0x4e4>
    217a:	bf15                	j	20ae <__neorv32_ram_size+0xae>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
    217c:	4785                	li	a5,1
    217e:	f887e6e3          	bltu	a5,s0,210a <__neorv32_ram_size+0x10a>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU </NEORV32-RTE>\n");
    2182:	6595                	lui	a1,0x5
    2184:	a1858593          	add	a1,a1,-1512 # 4a18 <__fini_array_end+0x554>
    2188:	fff50537          	lui	a0,0xfff50
    218c:	28c5                	jal	227c <neorv32_uart_puts>
  asm volatile ("csrw %[id], %[src]" :  : [id] "i" (csr_id), [src] "r" (csr_data));
    218e:	4781                	li	a5,0
    2190:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
    2194:	10500073          	wfi
    while(1) {
    2198:	bff5                	j	2194 <__neorv32_ram_size+0x194>
}
    219a:	40b2                	lw	ra,12(sp)
    219c:	4422                	lw	s0,8(sp)
    219e:	0141                	add	sp,sp,16
    21a0:	8082                	ret

000021a2 <neorv32_rte_setup>:
    21a2:	6789                	lui	a5,0x2
    21a4:	80078793          	add	a5,a5,-2048 # 1800 <printf+0x27a>
    21a8:	30079073          	csrw	mstatus,a5
    21ac:	6789                	lui	a5,0x2
    21ae:	d1c78793          	add	a5,a5,-740 # 1d1c <neorv32_rte_core>
    21b2:	30579073          	csrw	mtvec,a5
    21b6:	4781                	li	a5,0
    21b8:	30479073          	csrw	mie,a5
  asm volatile ("csrr %[dst], %[id]" : [dst] "=r" (csr_data) : [id] "i" (csr_id));
    21bc:	f14027f3          	csrr	a5,mhartid
  if (neorv32_cpu_csr_read(CSR_MHARTID) == 0) {
    21c0:	e395                	bnez	a5,21e4 <neorv32_rte_setup+0x42>
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    21c2:	6689                	lui	a3,0x2
    21c4:	80001637          	lui	a2,0x80001
    21c8:	fe268693          	add	a3,a3,-30 # 1fe2 <neorv32_rte_debug_handler>
    21cc:	d6460613          	add	a2,a2,-668 # 80000d64 <__neorv32_rte_vector_lut>
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    21d0:	45f5                	li	a1,29
      __neorv32_rte_vector_lut[index] = (uint32_t)(&neorv32_rte_debug_handler);
    21d2:	00279713          	sll	a4,a5,0x2
    21d6:	9732                	add	a4,a4,a2
    21d8:	c314                	sw	a3,0(a4)
    for (index = 0; index < ((int)NEORV32_RTE_NUM_TRAPS); index++) {
    21da:	0785                	add	a5,a5,1
    21dc:	feb79be3          	bne	a5,a1,21d2 <neorv32_rte_setup+0x30>
    asm volatile ("fence"); // flush handler table to main memory
    21e0:	0ff0000f          	fence
}
    21e4:	8082                	ret

000021e6 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
    21e6:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
    21ea:	87aa                	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
    21ec:	00e51863          	bne	a0,a4,21fc <neorv32_uart_available+0x16>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
    21f0:	7781                	lui	a5,0xfffe0
    21f2:	4788                	lw	a0,8(a5)
    21f4:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    21f8:	8d7d                	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
    21fa:	8082                	ret
  else if (UARTx == NEORV32_UART1) {
    21fc:	fff60737          	lui	a4,0xfff60
    return 0;
    2200:	4501                	li	a0,0
  else if (UARTx == NEORV32_UART1) {
    2202:	fee79ce3          	bne	a5,a4,21fa <neorv32_uart_available+0x14>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    2206:	7781                	lui	a5,0xfffe0
    2208:	4788                	lw	a0,8(a5)
    220a:	020007b7          	lui	a5,0x2000
    220e:	b7ed                	j	21f8 <neorv32_uart_available+0x12>

00002210 <neorv32_uart_setup>:

  uint32_t prsc_sel = 0;
  uint32_t baud_div = 0;

  // reset
  UARTx->CTRL = 0;
    2210:	00052023          	sw	zero,0(a0) # fff50000 <__crt0_ram_last+0x7ff4e001>
    2214:	7781                	lui	a5,0xfffe0
    2216:	439c                	lw	a5,0(a5)

  // raw clock prescaler
  uint32_t clock = neorv32_sysinfo_get_clk(); // system clock in Hz
#ifndef MAKE_BOOTLOADER // use div instructions / library functions
  baud_div = clock / (2*baudrate);
    2218:	0586                	sll	a1,a1,0x1
  uint32_t prsc_sel = 0;
    221a:	4701                	li	a4,0
  baud_div = clock / (2*baudrate);
    221c:	02b7d7b3          	divu	a5,a5,a1
    baud_div++;
  }
#endif

  // find baud prescaler (10-bit wide))
  while (baud_div >= 0x3ffU) {
    2220:	3fe00593          	li	a1,1022
    2224:	02f5e363          	bltu	a1,a5,224a <neorv32_uart_setup+0x3a>
  }

  uint32_t tmp = 0;
  tmp |= (uint32_t)(1              & 1U)     << UART_CTRL_EN;
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
    2228:	17fd                	add	a5,a5,-1 # fffdffff <__crt0_ram_last+0x7ffde000>
    222a:	66c1                	lui	a3,0x10
    222c:	fc068693          	add	a3,a3,-64 # ffc0 <__crt0_copy_data_src_begin+0xb2a4>
    2230:	079a                	sll	a5,a5,0x6
    2232:	8ff5                	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    2234:	07c006b7          	lui	a3,0x7c00
    2238:	8e75                	and	a2,a2,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    223a:	070e                	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    223c:	8fd1                	or	a5,a5,a2
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
    223e:	8b61                	and	a4,a4,24
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
    2240:	8fd9                	or	a5,a5,a4
    2242:	0017e793          	or	a5,a5,1
  if (((uint32_t)UARTx) == NEORV32_UART1_BASE) {
    tmp |= 1U << UART_CTRL_SIM_MODE;
  }
#endif

  UARTx->CTRL = tmp;
    2246:	c11c                	sw	a5,0(a0)
}
    2248:	8082                	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
    224a:	ffe70693          	add	a3,a4,-2 # fff5fffe <__crt0_ram_last+0x7ff5dfff>
    224e:	9af5                	and	a3,a3,-3
    2250:	e681                	bnez	a3,2258 <neorv32_uart_setup+0x48>
      baud_div >>= 3;
    2252:	838d                	srl	a5,a5,0x3
    prsc_sel++;
    2254:	0705                	add	a4,a4,1
    2256:	b7f9                	j	2224 <neorv32_uart_setup+0x14>
      baud_div >>= 1;
    2258:	8385                	srl	a5,a5,0x1
    225a:	bfed                	j	2254 <neorv32_uart_setup+0x44>

0000225c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    225c:	411c                	lw	a5,0(a0)
    225e:	00a79713          	sll	a4,a5,0xa
    2262:	fe075de3          	bgez	a4,225c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    2266:	c14c                	sw	a1,4(a0)
}
    2268:	8082                	ret

0000226a <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
    226a:	411c                	lw	a5,0(a0)
    226c:	00f79713          	sll	a4,a5,0xf
    2270:	fe075de3          	bgez	a4,226a <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
    2274:	4148                	lw	a0,4(a0)
}
    2276:	0ff57513          	zext.b	a0,a0
    227a:	8082                	ret

0000227c <neorv32_uart_puts>:
 * @warning "/n" line breaks are automatically converted to "/r/n".
 *
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] s Pointer to string.
 **************************************************************************/
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
    227c:	1101                	add	sp,sp,-32
    227e:	cc22                	sw	s0,24(sp)
    2280:	ca26                	sw	s1,20(sp)
    2282:	c64e                	sw	s3,12(sp)
    2284:	ce06                	sw	ra,28(sp)
    2286:	c84a                	sw	s2,16(sp)
    2288:	84aa                	mv	s1,a0
    228a:	842e                	mv	s0,a1

  char c = 0;
  while ((c = *s++)) {
    if (c == '\n') {
    228c:	49a9                	li	s3,10
  while ((c = *s++)) {
    228e:	00044903          	lbu	s2,0(s0)
    2292:	0405                	add	s0,s0,1
    2294:	00091963          	bnez	s2,22a6 <neorv32_uart_puts+0x2a>
      neorv32_uart_putc(UARTx, '\r');
    }
    neorv32_uart_putc(UARTx, c);
  }
}
    2298:	40f2                	lw	ra,28(sp)
    229a:	4462                	lw	s0,24(sp)
    229c:	44d2                	lw	s1,20(sp)
    229e:	4942                	lw	s2,16(sp)
    22a0:	49b2                	lw	s3,12(sp)
    22a2:	6105                	add	sp,sp,32
    22a4:	8082                	ret
    if (c == '\n') {
    22a6:	01391563          	bne	s2,s3,22b0 <neorv32_uart_puts+0x34>
      neorv32_uart_putc(UARTx, '\r');
    22aa:	45b5                	li	a1,13
    22ac:	8526                	mv	a0,s1
    22ae:	377d                	jal	225c <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
    22b0:	85ca                	mv	a1,s2
    22b2:	8526                	mv	a0,s1
    22b4:	3765                	jal	225c <neorv32_uart_putc>
    22b6:	bfe1                	j	228e <neorv32_uart_puts+0x12>

000022b8 <_malloc_r>:
    22b8:	7179                	add	sp,sp,-48
    22ba:	d04a                	sw	s2,32(sp)
    22bc:	d606                	sw	ra,44(sp)
    22be:	d422                	sw	s0,40(sp)
    22c0:	d226                	sw	s1,36(sp)
    22c2:	ce4e                	sw	s3,28(sp)
    22c4:	00b58793          	add	a5,a1,11
    22c8:	4759                	li	a4,22
    22ca:	892a                	mv	s2,a0
    22cc:	04f76963          	bltu	a4,a5,231e <_malloc_r+0x66>
    22d0:	47c1                	li	a5,16
    22d2:	16b7eb63          	bltu	a5,a1,2448 <_malloc_r+0x190>
    22d6:	2345                	jal	2876 <__malloc_lock>
    22d8:	47e1                	li	a5,24
    22da:	4589                	li	a1,2
    22dc:	44c1                	li	s1,16
    22de:	7fffe997          	auipc	s3,0x7fffe
    22e2:	d2298993          	add	s3,s3,-734 # 80000000 <__malloc_av_>
    22e6:	97ce                	add	a5,a5,s3
    22e8:	43c0                	lw	s0,4(a5)
    22ea:	ff878713          	add	a4,a5,-8
    22ee:	26e40a63          	beq	s0,a4,2562 <_malloc_r+0x2aa>
    22f2:	405c                	lw	a5,4(s0)
    22f4:	4454                	lw	a3,12(s0)
    22f6:	4410                	lw	a2,8(s0)
    22f8:	9bf1                	and	a5,a5,-4
    22fa:	97a2                	add	a5,a5,s0
    22fc:	43d8                	lw	a4,4(a5)
    22fe:	c654                	sw	a3,12(a2)
    2300:	c690                	sw	a2,8(a3)
    2302:	00176713          	or	a4,a4,1
    2306:	854a                	mv	a0,s2
    2308:	c3d8                	sw	a4,4(a5)
    230a:	2b9d                	jal	2880 <__malloc_unlock>
    230c:	00840513          	add	a0,s0,8
    2310:	50b2                	lw	ra,44(sp)
    2312:	5422                	lw	s0,40(sp)
    2314:	5492                	lw	s1,36(sp)
    2316:	5902                	lw	s2,32(sp)
    2318:	49f2                	lw	s3,28(sp)
    231a:	6145                	add	sp,sp,48
    231c:	8082                	ret
    231e:	ff87f493          	and	s1,a5,-8
    2322:	1207c363          	bltz	a5,2448 <_malloc_r+0x190>
    2326:	12b4e163          	bltu	s1,a1,2448 <_malloc_r+0x190>
    232a:	23b1                	jal	2876 <__malloc_lock>
    232c:	1f700793          	li	a5,503
    2330:	2e97f863          	bgeu	a5,s1,2620 <_malloc_r+0x368>
    2334:	0094d793          	srl	a5,s1,0x9
    2338:	10078d63          	beqz	a5,2452 <_malloc_r+0x19a>
    233c:	4711                	li	a4,4
    233e:	26f76763          	bltu	a4,a5,25ac <_malloc_r+0x2f4>
    2342:	0064d793          	srl	a5,s1,0x6
    2346:	03978593          	add	a1,a5,57
    234a:	03878813          	add	a6,a5,56
    234e:	00359613          	sll	a2,a1,0x3
    2352:	7fffe997          	auipc	s3,0x7fffe
    2356:	cae98993          	add	s3,s3,-850 # 80000000 <__malloc_av_>
    235a:	964e                	add	a2,a2,s3
    235c:	4240                	lw	s0,4(a2)
    235e:	1661                	add	a2,a2,-8
    2360:	02860163          	beq	a2,s0,2382 <_malloc_r+0xca>
    2364:	453d                	li	a0,15
    2366:	a039                	j	2374 <_malloc_r+0xbc>
    2368:	4454                	lw	a3,12(s0)
    236a:	1e075a63          	bgez	a4,255e <_malloc_r+0x2a6>
    236e:	00d60a63          	beq	a2,a3,2382 <_malloc_r+0xca>
    2372:	8436                	mv	s0,a3
    2374:	405c                	lw	a5,4(s0)
    2376:	9bf1                	and	a5,a5,-4
    2378:	40978733          	sub	a4,a5,s1
    237c:	fee556e3          	bge	a0,a4,2368 <_malloc_r+0xb0>
    2380:	85c2                	mv	a1,a6
    2382:	0109a403          	lw	s0,16(s3)
    2386:	7fffe897          	auipc	a7,0x7fffe
    238a:	c8288893          	add	a7,a7,-894 # 80000008 <__malloc_av_+0x8>
    238e:	1d140563          	beq	s0,a7,2558 <_malloc_r+0x2a0>
    2392:	405c                	lw	a5,4(s0)
    2394:	46bd                	li	a3,15
    2396:	9bf1                	and	a5,a5,-4
    2398:	40978733          	sub	a4,a5,s1
    239c:	28e6c763          	blt	a3,a4,262a <_malloc_r+0x372>
    23a0:	0119aa23          	sw	a7,20(s3)
    23a4:	0119a823          	sw	a7,16(s3)
    23a8:	26075263          	bgez	a4,260c <_malloc_r+0x354>
    23ac:	1ff00713          	li	a4,511
    23b0:	0049a503          	lw	a0,4(s3)
    23b4:	1af76c63          	bltu	a4,a5,256c <_malloc_r+0x2b4>
    23b8:	ff87f713          	and	a4,a5,-8
    23bc:	0721                	add	a4,a4,8
    23be:	974e                	add	a4,a4,s3
    23c0:	4314                	lw	a3,0(a4)
    23c2:	0057d613          	srl	a2,a5,0x5
    23c6:	4785                	li	a5,1
    23c8:	00c797b3          	sll	a5,a5,a2
    23cc:	8d5d                	or	a0,a0,a5
    23ce:	ff870793          	add	a5,a4,-8
    23d2:	c45c                	sw	a5,12(s0)
    23d4:	c414                	sw	a3,8(s0)
    23d6:	00a9a223          	sw	a0,4(s3)
    23da:	c300                	sw	s0,0(a4)
    23dc:	c6c0                	sw	s0,12(a3)
    23de:	4025d793          	sra	a5,a1,0x2
    23e2:	4605                	li	a2,1
    23e4:	00f61633          	sll	a2,a2,a5
    23e8:	06c56c63          	bltu	a0,a2,2460 <_malloc_r+0x1a8>
    23ec:	00a677b3          	and	a5,a2,a0
    23f0:	ef81                	bnez	a5,2408 <_malloc_r+0x150>
    23f2:	0606                	sll	a2,a2,0x1
    23f4:	99f1                	and	a1,a1,-4
    23f6:	00a677b3          	and	a5,a2,a0
    23fa:	0591                	add	a1,a1,4
    23fc:	e791                	bnez	a5,2408 <_malloc_r+0x150>
    23fe:	0606                	sll	a2,a2,0x1
    2400:	00a677b3          	and	a5,a2,a0
    2404:	0591                	add	a1,a1,4
    2406:	dfe5                	beqz	a5,23fe <_malloc_r+0x146>
    2408:	483d                	li	a6,15
    240a:	00359313          	sll	t1,a1,0x3
    240e:	934e                	add	t1,t1,s3
    2410:	851a                	mv	a0,t1
    2412:	455c                	lw	a5,12(a0)
    2414:	8e2e                	mv	t3,a1
    2416:	1af50b63          	beq	a0,a5,25cc <_malloc_r+0x314>
    241a:	43d8                	lw	a4,4(a5)
    241c:	843e                	mv	s0,a5
    241e:	47dc                	lw	a5,12(a5)
    2420:	9b71                	and	a4,a4,-4
    2422:	409706b3          	sub	a3,a4,s1
    2426:	1ad84a63          	blt	a6,a3,25da <_malloc_r+0x322>
    242a:	fe06c6e3          	bltz	a3,2416 <_malloc_r+0x15e>
    242e:	9722                	add	a4,a4,s0
    2430:	4354                	lw	a3,4(a4)
    2432:	4410                	lw	a2,8(s0)
    2434:	854a                	mv	a0,s2
    2436:	0016e693          	or	a3,a3,1
    243a:	c354                	sw	a3,4(a4)
    243c:	c65c                	sw	a5,12(a2)
    243e:	c790                	sw	a2,8(a5)
    2440:	2181                	jal	2880 <__malloc_unlock>
    2442:	00840513          	add	a0,s0,8
    2446:	b5e9                	j	2310 <_malloc_r+0x58>
    2448:	47b1                	li	a5,12
    244a:	00f92023          	sw	a5,0(s2)
    244e:	4501                	li	a0,0
    2450:	b5c1                	j	2310 <_malloc_r+0x58>
    2452:	20000613          	li	a2,512
    2456:	04000593          	li	a1,64
    245a:	03f00813          	li	a6,63
    245e:	bdd5                	j	2352 <_malloc_r+0x9a>
    2460:	0089a403          	lw	s0,8(s3)
    2464:	c85a                	sw	s6,16(sp)
    2466:	405c                	lw	a5,4(s0)
    2468:	ffc7fb13          	and	s6,a5,-4
    246c:	009b6763          	bltu	s6,s1,247a <_malloc_r+0x1c2>
    2470:	409b0733          	sub	a4,s6,s1
    2474:	47bd                	li	a5,15
    2476:	0ae7cc63          	blt	a5,a4,252e <_malloc_r+0x276>
    247a:	c266                	sw	s9,4(sp)
    247c:	7fffec97          	auipc	s9,0x7fffe
    2480:	0c4c8c93          	add	s9,s9,196 # 80000540 <__malloc_sbrk_base>
    2484:	000ca703          	lw	a4,0(s9)
    2488:	cc52                	sw	s4,24(sp)
    248a:	ca56                	sw	s5,20(sp)
    248c:	c65e                	sw	s7,12(sp)
    248e:	7fffea97          	auipc	s5,0x7fffe
    2492:	0f2aaa83          	lw	s5,242(s5) # 80000580 <__malloc_top_pad>
    2496:	57fd                	li	a5,-1
    2498:	01640a33          	add	s4,s0,s6
    249c:	9aa6                	add	s5,s5,s1
    249e:	2cf70c63          	beq	a4,a5,2776 <_malloc_r+0x4be>
    24a2:	6785                	lui	a5,0x1
    24a4:	07bd                	add	a5,a5,15 # 100f <core_init_state+0x11>
    24a6:	9abe                	add	s5,s5,a5
    24a8:	77fd                	lui	a5,0xfffff
    24aa:	00fafab3          	and	s5,s5,a5
    24ae:	85d6                	mv	a1,s5
    24b0:	854a                	mv	a0,s2
    24b2:	2959                	jal	2948 <_sbrk_r>
    24b4:	57fd                	li	a5,-1
    24b6:	8baa                	mv	s7,a0
    24b8:	32f50e63          	beq	a0,a5,27f4 <_malloc_r+0x53c>
    24bc:	c462                	sw	s8,8(sp)
    24be:	1b456463          	bltu	a0,s4,2666 <_malloc_r+0x3ae>
    24c2:	7ffffc17          	auipc	s8,0x7ffff
    24c6:	916c0c13          	add	s8,s8,-1770 # 80000dd8 <__malloc_current_mallinfo>
    24ca:	000c2583          	lw	a1,0(s8)
    24ce:	95d6                	add	a1,a1,s5
    24d0:	00bc2023          	sw	a1,0(s8)
    24d4:	872e                	mv	a4,a1
    24d6:	1eaa1e63          	bne	s4,a0,26d2 <_malloc_r+0x41a>
    24da:	01451793          	sll	a5,a0,0x14
    24de:	1e079a63          	bnez	a5,26d2 <_malloc_r+0x41a>
    24e2:	0089ab83          	lw	s7,8(s3)
    24e6:	015b07b3          	add	a5,s6,s5
    24ea:	0017e793          	or	a5,a5,1
    24ee:	00fba223          	sw	a5,4(s7)
    24f2:	7fffe717          	auipc	a4,0x7fffe
    24f6:	08a70713          	add	a4,a4,138 # 8000057c <__malloc_max_sbrked_mem>
    24fa:	4314                	lw	a3,0(a4)
    24fc:	00b6f363          	bgeu	a3,a1,2502 <_malloc_r+0x24a>
    2500:	c30c                	sw	a1,0(a4)
    2502:	7fffe717          	auipc	a4,0x7fffe
    2506:	07670713          	add	a4,a4,118 # 80000578 <__malloc_max_total_mem>
    250a:	4314                	lw	a3,0(a4)
    250c:	00b6f363          	bgeu	a3,a1,2512 <_malloc_r+0x25a>
    2510:	c30c                	sw	a1,0(a4)
    2512:	4c22                	lw	s8,8(sp)
    2514:	845e                	mv	s0,s7
    2516:	9bf1                	and	a5,a5,-4
    2518:	40978733          	sub	a4,a5,s1
    251c:	2897ea63          	bltu	a5,s1,27b0 <_malloc_r+0x4f8>
    2520:	47bd                	li	a5,15
    2522:	28e7d763          	bge	a5,a4,27b0 <_malloc_r+0x4f8>
    2526:	4a62                	lw	s4,24(sp)
    2528:	4ad2                	lw	s5,20(sp)
    252a:	4bb2                	lw	s7,12(sp)
    252c:	4c92                	lw	s9,4(sp)
    252e:	0014e793          	or	a5,s1,1
    2532:	c05c                	sw	a5,4(s0)
    2534:	94a2                	add	s1,s1,s0
    2536:	0099a423          	sw	s1,8(s3)
    253a:	00176713          	or	a4,a4,1
    253e:	854a                	mv	a0,s2
    2540:	c0d8                	sw	a4,4(s1)
    2542:	2e3d                	jal	2880 <__malloc_unlock>
    2544:	50b2                	lw	ra,44(sp)
    2546:	00840513          	add	a0,s0,8
    254a:	5422                	lw	s0,40(sp)
    254c:	4b42                	lw	s6,16(sp)
    254e:	5492                	lw	s1,36(sp)
    2550:	5902                	lw	s2,32(sp)
    2552:	49f2                	lw	s3,28(sp)
    2554:	6145                	add	sp,sp,48
    2556:	8082                	ret
    2558:	0049a503          	lw	a0,4(s3)
    255c:	b549                	j	23de <_malloc_r+0x126>
    255e:	4410                	lw	a2,8(s0)
    2560:	bb69                	j	22fa <_malloc_r+0x42>
    2562:	47c0                	lw	s0,12(a5)
    2564:	0589                	add	a1,a1,2
    2566:	e0878ee3          	beq	a5,s0,2382 <_malloc_r+0xca>
    256a:	b361                	j	22f2 <_malloc_r+0x3a>
    256c:	0097d713          	srl	a4,a5,0x9
    2570:	4691                	li	a3,4
    2572:	0ee6f263          	bgeu	a3,a4,2656 <_malloc_r+0x39e>
    2576:	46d1                	li	a3,20
    2578:	24e6e563          	bltu	a3,a4,27c2 <_malloc_r+0x50a>
    257c:	05c70613          	add	a2,a4,92
    2580:	05b70693          	add	a3,a4,91
    2584:	060e                	sll	a2,a2,0x3
    2586:	964e                	add	a2,a2,s3
    2588:	4218                	lw	a4,0(a2)
    258a:	1661                	add	a2,a2,-8
    258c:	00e61663          	bne	a2,a4,2598 <_malloc_r+0x2e0>
    2590:	a2ed                	j	277a <_malloc_r+0x4c2>
    2592:	4718                	lw	a4,8(a4)
    2594:	00e60663          	beq	a2,a4,25a0 <_malloc_r+0x2e8>
    2598:	4354                	lw	a3,4(a4)
    259a:	9af1                	and	a3,a3,-4
    259c:	fed7ebe3          	bltu	a5,a3,2592 <_malloc_r+0x2da>
    25a0:	4750                	lw	a2,12(a4)
    25a2:	c450                	sw	a2,12(s0)
    25a4:	c418                	sw	a4,8(s0)
    25a6:	c600                	sw	s0,8(a2)
    25a8:	c740                	sw	s0,12(a4)
    25aa:	bd15                	j	23de <_malloc_r+0x126>
    25ac:	4751                	li	a4,20
    25ae:	0cf77363          	bgeu	a4,a5,2674 <_malloc_r+0x3bc>
    25b2:	05400713          	li	a4,84
    25b6:	22f76263          	bltu	a4,a5,27da <_malloc_r+0x522>
    25ba:	00c4d793          	srl	a5,s1,0xc
    25be:	06f78593          	add	a1,a5,111 # fffff06f <__crt0_ram_last+0x7fffd070>
    25c2:	06e78813          	add	a6,a5,110
    25c6:	00359613          	sll	a2,a1,0x3
    25ca:	b361                	j	2352 <_malloc_r+0x9a>
    25cc:	0e05                	add	t3,t3,1
    25ce:	003e7793          	and	a5,t3,3
    25d2:	0521                	add	a0,a0,8
    25d4:	cfc5                	beqz	a5,268c <_malloc_r+0x3d4>
    25d6:	455c                	lw	a5,12(a0)
    25d8:	bd3d                	j	2416 <_malloc_r+0x15e>
    25da:	4410                	lw	a2,8(s0)
    25dc:	0014e593          	or	a1,s1,1
    25e0:	c04c                	sw	a1,4(s0)
    25e2:	c65c                	sw	a5,12(a2)
    25e4:	c790                	sw	a2,8(a5)
    25e6:	94a2                	add	s1,s1,s0
    25e8:	0099aa23          	sw	s1,20(s3)
    25ec:	0099a823          	sw	s1,16(s3)
    25f0:	0016e793          	or	a5,a3,1
    25f4:	0114a623          	sw	a7,12(s1)
    25f8:	0114a423          	sw	a7,8(s1)
    25fc:	c0dc                	sw	a5,4(s1)
    25fe:	9722                	add	a4,a4,s0
    2600:	854a                	mv	a0,s2
    2602:	c314                	sw	a3,0(a4)
    2604:	2cb5                	jal	2880 <__malloc_unlock>
    2606:	00840513          	add	a0,s0,8
    260a:	b319                	j	2310 <_malloc_r+0x58>
    260c:	97a2                	add	a5,a5,s0
    260e:	43d8                	lw	a4,4(a5)
    2610:	854a                	mv	a0,s2
    2612:	00176713          	or	a4,a4,1
    2616:	c3d8                	sw	a4,4(a5)
    2618:	24a5                	jal	2880 <__malloc_unlock>
    261a:	00840513          	add	a0,s0,8
    261e:	b9cd                	j	2310 <_malloc_r+0x58>
    2620:	0034d593          	srl	a1,s1,0x3
    2624:	00848793          	add	a5,s1,8
    2628:	b95d                	j	22de <_malloc_r+0x26>
    262a:	0014e693          	or	a3,s1,1
    262e:	c054                	sw	a3,4(s0)
    2630:	94a2                	add	s1,s1,s0
    2632:	0099aa23          	sw	s1,20(s3)
    2636:	0099a823          	sw	s1,16(s3)
    263a:	00176693          	or	a3,a4,1
    263e:	0114a623          	sw	a7,12(s1)
    2642:	0114a423          	sw	a7,8(s1)
    2646:	c0d4                	sw	a3,4(s1)
    2648:	97a2                	add	a5,a5,s0
    264a:	854a                	mv	a0,s2
    264c:	c398                	sw	a4,0(a5)
    264e:	2c0d                	jal	2880 <__malloc_unlock>
    2650:	00840513          	add	a0,s0,8
    2654:	b975                	j	2310 <_malloc_r+0x58>
    2656:	0067d713          	srl	a4,a5,0x6
    265a:	03970613          	add	a2,a4,57
    265e:	03870693          	add	a3,a4,56
    2662:	060e                	sll	a2,a2,0x3
    2664:	b70d                	j	2586 <_malloc_r+0x2ce>
    2666:	05340d63          	beq	s0,s3,26c0 <_malloc_r+0x408>
    266a:	0089a403          	lw	s0,8(s3)
    266e:	4c22                	lw	s8,8(sp)
    2670:	405c                	lw	a5,4(s0)
    2672:	b555                	j	2516 <_malloc_r+0x25e>
    2674:	05c78593          	add	a1,a5,92
    2678:	05b78813          	add	a6,a5,91
    267c:	00359613          	sll	a2,a1,0x3
    2680:	b9c9                	j	2352 <_malloc_r+0x9a>
    2682:	00832783          	lw	a5,8(t1)
    2686:	15fd                	add	a1,a1,-1
    2688:	1e679463          	bne	a5,t1,2870 <_malloc_r+0x5b8>
    268c:	0035f793          	and	a5,a1,3
    2690:	1361                	add	t1,t1,-8
    2692:	fbe5                	bnez	a5,2682 <_malloc_r+0x3ca>
    2694:	0049a703          	lw	a4,4(s3)
    2698:	fff64793          	not	a5,a2
    269c:	8ff9                	and	a5,a5,a4
    269e:	00f9a223          	sw	a5,4(s3)
    26a2:	0606                	sll	a2,a2,0x1
    26a4:	dac7eee3          	bltu	a5,a2,2460 <_malloc_r+0x1a8>
    26a8:	da060ce3          	beqz	a2,2460 <_malloc_r+0x1a8>
    26ac:	00f67733          	and	a4,a2,a5
    26b0:	e711                	bnez	a4,26bc <_malloc_r+0x404>
    26b2:	0606                	sll	a2,a2,0x1
    26b4:	00f67733          	and	a4,a2,a5
    26b8:	0e11                	add	t3,t3,4
    26ba:	df65                	beqz	a4,26b2 <_malloc_r+0x3fa>
    26bc:	85f2                	mv	a1,t3
    26be:	b3b1                	j	240a <_malloc_r+0x152>
    26c0:	7fffec17          	auipc	s8,0x7fffe
    26c4:	718c0c13          	add	s8,s8,1816 # 80000dd8 <__malloc_current_mallinfo>
    26c8:	000c2703          	lw	a4,0(s8)
    26cc:	9756                	add	a4,a4,s5
    26ce:	00ec2023          	sw	a4,0(s8)
    26d2:	000ca683          	lw	a3,0(s9)
    26d6:	57fd                	li	a5,-1
    26d8:	12f68263          	beq	a3,a5,27fc <_malloc_r+0x544>
    26dc:	414b87b3          	sub	a5,s7,s4
    26e0:	97ba                	add	a5,a5,a4
    26e2:	00fc2023          	sw	a5,0(s8)
    26e6:	007bfc93          	and	s9,s7,7
    26ea:	0a0c8063          	beqz	s9,278a <_malloc_r+0x4d2>
    26ee:	419b8bb3          	sub	s7,s7,s9
    26f2:	6785                	lui	a5,0x1
    26f4:	07a1                	add	a5,a5,8 # 1008 <core_init_state+0xa>
    26f6:	0ba1                	add	s7,s7,8
    26f8:	419785b3          	sub	a1,a5,s9
    26fc:	9ade                	add	s5,s5,s7
    26fe:	415585b3          	sub	a1,a1,s5
    2702:	05d2                	sll	a1,a1,0x14
    2704:	0145da13          	srl	s4,a1,0x14
    2708:	85d2                	mv	a1,s4
    270a:	854a                	mv	a0,s2
    270c:	2c35                	jal	2948 <_sbrk_r>
    270e:	57fd                	li	a5,-1
    2710:	12f50263          	beq	a0,a5,2834 <_malloc_r+0x57c>
    2714:	41750533          	sub	a0,a0,s7
    2718:	01450ab3          	add	s5,a0,s4
    271c:	000c2703          	lw	a4,0(s8)
    2720:	0179a423          	sw	s7,8(s3)
    2724:	001ae793          	or	a5,s5,1
    2728:	00ea05b3          	add	a1,s4,a4
    272c:	00bc2023          	sw	a1,0(s8)
    2730:	00fba223          	sw	a5,4(s7)
    2734:	db340fe3          	beq	s0,s3,24f2 <_malloc_r+0x23a>
    2738:	46bd                	li	a3,15
    273a:	0766f763          	bgeu	a3,s6,27a8 <_malloc_r+0x4f0>
    273e:	4058                	lw	a4,4(s0)
    2740:	ff4b0793          	add	a5,s6,-12
    2744:	9be1                	and	a5,a5,-8
    2746:	8b05                	and	a4,a4,1
    2748:	8f5d                	or	a4,a4,a5
    274a:	c058                	sw	a4,4(s0)
    274c:	4615                	li	a2,5
    274e:	00f40733          	add	a4,s0,a5
    2752:	c350                	sw	a2,4(a4)
    2754:	c710                	sw	a2,8(a4)
    2756:	00f6e563          	bltu	a3,a5,2760 <_malloc_r+0x4a8>
    275a:	004ba783          	lw	a5,4(s7)
    275e:	bb51                	j	24f2 <_malloc_r+0x23a>
    2760:	00840593          	add	a1,s0,8
    2764:	854a                	mv	a0,s2
    2766:	2391                	jal	2caa <_free_r>
    2768:	0089ab83          	lw	s7,8(s3)
    276c:	000c2583          	lw	a1,0(s8)
    2770:	004ba783          	lw	a5,4(s7)
    2774:	bbbd                	j	24f2 <_malloc_r+0x23a>
    2776:	0ac1                	add	s5,s5,16
    2778:	bb1d                	j	24ae <_malloc_r+0x1f6>
    277a:	8689                	sra	a3,a3,0x2
    277c:	4785                	li	a5,1
    277e:	00d797b3          	sll	a5,a5,a3
    2782:	8d5d                	or	a0,a0,a5
    2784:	00a9a223          	sw	a0,4(s3)
    2788:	bd29                	j	25a2 <_malloc_r+0x2ea>
    278a:	015b85b3          	add	a1,s7,s5
    278e:	40b005b3          	neg	a1,a1
    2792:	05d2                	sll	a1,a1,0x14
    2794:	0145da13          	srl	s4,a1,0x14
    2798:	85d2                	mv	a1,s4
    279a:	854a                	mv	a0,s2
    279c:	2275                	jal	2948 <_sbrk_r>
    279e:	57fd                	li	a5,-1
    27a0:	f6f51ae3          	bne	a0,a5,2714 <_malloc_r+0x45c>
    27a4:	4a01                	li	s4,0
    27a6:	bf9d                	j	271c <_malloc_r+0x464>
    27a8:	4c22                	lw	s8,8(sp)
    27aa:	4785                	li	a5,1
    27ac:	00fba223          	sw	a5,4(s7)
    27b0:	854a                	mv	a0,s2
    27b2:	20f9                	jal	2880 <__malloc_unlock>
    27b4:	4501                	li	a0,0
    27b6:	4a62                	lw	s4,24(sp)
    27b8:	4ad2                	lw	s5,20(sp)
    27ba:	4b42                	lw	s6,16(sp)
    27bc:	4bb2                	lw	s7,12(sp)
    27be:	4c92                	lw	s9,4(sp)
    27c0:	be81                	j	2310 <_malloc_r+0x58>
    27c2:	05400693          	li	a3,84
    27c6:	02e6ee63          	bltu	a3,a4,2802 <_malloc_r+0x54a>
    27ca:	00c7d713          	srl	a4,a5,0xc
    27ce:	06f70613          	add	a2,a4,111
    27d2:	06e70693          	add	a3,a4,110
    27d6:	060e                	sll	a2,a2,0x3
    27d8:	b37d                	j	2586 <_malloc_r+0x2ce>
    27da:	15400713          	li	a4,340
    27de:	02f76e63          	bltu	a4,a5,281a <_malloc_r+0x562>
    27e2:	00f4d793          	srl	a5,s1,0xf
    27e6:	07878593          	add	a1,a5,120
    27ea:	07778813          	add	a6,a5,119
    27ee:	00359613          	sll	a2,a1,0x3
    27f2:	b685                	j	2352 <_malloc_r+0x9a>
    27f4:	0089a403          	lw	s0,8(s3)
    27f8:	405c                	lw	a5,4(s0)
    27fa:	bb31                	j	2516 <_malloc_r+0x25e>
    27fc:	017ca023          	sw	s7,0(s9)
    2800:	b5dd                	j	26e6 <_malloc_r+0x42e>
    2802:	15400693          	li	a3,340
    2806:	02e6ed63          	bltu	a3,a4,2840 <_malloc_r+0x588>
    280a:	00f7d713          	srl	a4,a5,0xf
    280e:	07870613          	add	a2,a4,120
    2812:	07770693          	add	a3,a4,119
    2816:	060e                	sll	a2,a2,0x3
    2818:	b3bd                	j	2586 <_malloc_r+0x2ce>
    281a:	55400713          	li	a4,1364
    281e:	02f76d63          	bltu	a4,a5,2858 <_malloc_r+0x5a0>
    2822:	0124d793          	srl	a5,s1,0x12
    2826:	07d78593          	add	a1,a5,125
    282a:	07c78813          	add	a6,a5,124
    282e:	00359613          	sll	a2,a1,0x3
    2832:	b605                	j	2352 <_malloc_r+0x9a>
    2834:	1ce1                	add	s9,s9,-8
    2836:	9ae6                	add	s5,s5,s9
    2838:	417a8ab3          	sub	s5,s5,s7
    283c:	4a01                	li	s4,0
    283e:	bdf9                	j	271c <_malloc_r+0x464>
    2840:	55400693          	li	a3,1364
    2844:	02e6e163          	bltu	a3,a4,2866 <_malloc_r+0x5ae>
    2848:	0127d713          	srl	a4,a5,0x12
    284c:	07d70613          	add	a2,a4,125
    2850:	07c70693          	add	a3,a4,124
    2854:	060e                	sll	a2,a2,0x3
    2856:	bb05                	j	2586 <_malloc_r+0x2ce>
    2858:	3f800613          	li	a2,1016
    285c:	07f00593          	li	a1,127
    2860:	07e00813          	li	a6,126
    2864:	b4fd                	j	2352 <_malloc_r+0x9a>
    2866:	3f800613          	li	a2,1016
    286a:	07e00693          	li	a3,126
    286e:	bb21                	j	2586 <_malloc_r+0x2ce>
    2870:	0049a783          	lw	a5,4(s3)
    2874:	b53d                	j	26a2 <_malloc_r+0x3ea>

00002876 <__malloc_lock>:
    2876:	7fffe517          	auipc	a0,0x7fffe
    287a:	d1250513          	add	a0,a0,-750 # 80000588 <__lock___malloc_recursive_mutex>
    287e:	a219                	j	2984 <__retarget_lock_acquire_recursive>

00002880 <__malloc_unlock>:
    2880:	7fffe517          	auipc	a0,0x7fffe
    2884:	d0850513          	add	a0,a0,-760 # 80000588 <__lock___malloc_recursive_mutex>
    2888:	a8fd                	j	2986 <__retarget_lock_release_recursive>

0000288a <_puts_r>:
    288a:	7179                	add	sp,sp,-48
    288c:	d422                	sw	s0,40(sp)
    288e:	842a                	mv	s0,a0
    2890:	852e                	mv	a0,a1
    2892:	d226                	sw	s1,36(sp)
    2894:	d606                	sw	ra,44(sp)
    2896:	84ae                	mv	s1,a1
    2898:	2cf9                	jal	2b76 <strlen>
    289a:	00150713          	add	a4,a0,1
    289e:	00002697          	auipc	a3,0x2
    28a2:	1ae68693          	add	a3,a3,430 # 4a4c <__fini_array_end+0x588>
    28a6:	c63a                	sw	a4,12(sp)
    28a8:	585c                	lw	a5,52(s0)
    28aa:	0818                	add	a4,sp,16
    28ac:	cc36                	sw	a3,24(sp)
    28ae:	c23a                	sw	a4,4(sp)
    28b0:	4685                	li	a3,1
    28b2:	4709                	li	a4,2
    28b4:	c826                	sw	s1,16(sp)
    28b6:	ca2a                	sw	a0,20(sp)
    28b8:	ce36                	sw	a3,28(sp)
    28ba:	c43a                	sw	a4,8(sp)
    28bc:	4404                	lw	s1,8(s0)
    28be:	cfa5                	beqz	a5,2936 <_puts_r+0xac>
    28c0:	50f8                	lw	a4,100(s1)
    28c2:	00c49783          	lh	a5,12(s1)
    28c6:	8b05                	and	a4,a4,1
    28c8:	e701                	bnez	a4,28d0 <_puts_r+0x46>
    28ca:	2007f713          	and	a4,a5,512
    28ce:	cf39                	beqz	a4,292c <_puts_r+0xa2>
    28d0:	01279713          	sll	a4,a5,0x12
    28d4:	00074b63          	bltz	a4,28ea <_puts_r+0x60>
    28d8:	50f8                	lw	a4,100(s1)
    28da:	76f9                	lui	a3,0xffffe
    28dc:	16fd                	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7fffc000>
    28de:	6609                	lui	a2,0x2
    28e0:	8fd1                	or	a5,a5,a2
    28e2:	8f75                	and	a4,a4,a3
    28e4:	00f49623          	sh	a5,12(s1)
    28e8:	d0f8                	sw	a4,100(s1)
    28ea:	8522                	mv	a0,s0
    28ec:	0050                	add	a2,sp,4
    28ee:	85a6                	mv	a1,s1
    28f0:	01b000ef          	jal	310a <__sfvwrite_r>
    28f4:	50fc                	lw	a5,100(s1)
    28f6:	00153413          	seqz	s0,a0
    28fa:	40800433          	neg	s0,s0
    28fe:	882d                	and	s0,s0,11
    2900:	8b85                	and	a5,a5,1
    2902:	147d                	add	s0,s0,-1
    2904:	e791                	bnez	a5,2910 <_puts_r+0x86>
    2906:	00c4d783          	lhu	a5,12(s1)
    290a:	2007f793          	and	a5,a5,512
    290e:	c799                	beqz	a5,291c <_puts_r+0x92>
    2910:	50b2                	lw	ra,44(sp)
    2912:	8522                	mv	a0,s0
    2914:	5422                	lw	s0,40(sp)
    2916:	5492                	lw	s1,36(sp)
    2918:	6145                	add	sp,sp,48
    291a:	8082                	ret
    291c:	4ca8                	lw	a0,88(s1)
    291e:	20a5                	jal	2986 <__retarget_lock_release_recursive>
    2920:	50b2                	lw	ra,44(sp)
    2922:	8522                	mv	a0,s0
    2924:	5422                	lw	s0,40(sp)
    2926:	5492                	lw	s1,36(sp)
    2928:	6145                	add	sp,sp,48
    292a:	8082                	ret
    292c:	4ca8                	lw	a0,88(s1)
    292e:	2899                	jal	2984 <__retarget_lock_acquire_recursive>
    2930:	00c49783          	lh	a5,12(s1)
    2934:	bf71                	j	28d0 <_puts_r+0x46>
    2936:	8522                	mv	a0,s0
    2938:	27a5                	jal	30a0 <__sinit>
    293a:	b759                	j	28c0 <_puts_r+0x36>

0000293c <puts>:
    293c:	85aa                	mv	a1,a0
    293e:	7fffe517          	auipc	a0,0x7fffe
    2942:	c0a52503          	lw	a0,-1014(a0) # 80000548 <_impure_ptr>
    2946:	b791                	j	288a <_puts_r>

00002948 <_sbrk_r>:
    2948:	1141                	add	sp,sp,-16
    294a:	c422                	sw	s0,8(sp)
    294c:	842a                	mv	s0,a0
    294e:	852e                	mv	a0,a1
    2950:	7fffe797          	auipc	a5,0x7fffe
    2954:	c207aa23          	sw	zero,-972(a5) # 80000584 <errno>
    2958:	c606                	sw	ra,12(sp)
    295a:	b80ff0ef          	jal	1cda <_sbrk>
    295e:	57fd                	li	a5,-1
    2960:	00f50663          	beq	a0,a5,296c <_sbrk_r+0x24>
    2964:	40b2                	lw	ra,12(sp)
    2966:	4422                	lw	s0,8(sp)
    2968:	0141                	add	sp,sp,16
    296a:	8082                	ret
    296c:	7fffe797          	auipc	a5,0x7fffe
    2970:	c187a783          	lw	a5,-1000(a5) # 80000584 <errno>
    2974:	dbe5                	beqz	a5,2964 <_sbrk_r+0x1c>
    2976:	40b2                	lw	ra,12(sp)
    2978:	c01c                	sw	a5,0(s0)
    297a:	4422                	lw	s0,8(sp)
    297c:	0141                	add	sp,sp,16
    297e:	8082                	ret

00002980 <__retarget_lock_init_recursive>:
    2980:	8082                	ret

00002982 <__retarget_lock_close_recursive>:
    2982:	8082                	ret

00002984 <__retarget_lock_acquire_recursive>:
    2984:	8082                	ret

00002986 <__retarget_lock_release_recursive>:
    2986:	8082                	ret

00002988 <memset>:
    2988:	433d                	li	t1,15
    298a:	872a                	mv	a4,a0
    298c:	02c37363          	bgeu	t1,a2,29b2 <memset+0x2a>
    2990:	00f77793          	and	a5,a4,15
    2994:	efbd                	bnez	a5,2a12 <memset+0x8a>
    2996:	e5ad                	bnez	a1,2a00 <memset+0x78>
    2998:	ff067693          	and	a3,a2,-16
    299c:	8a3d                	and	a2,a2,15
    299e:	96ba                	add	a3,a3,a4
    29a0:	c30c                	sw	a1,0(a4)
    29a2:	c34c                	sw	a1,4(a4)
    29a4:	c70c                	sw	a1,8(a4)
    29a6:	c74c                	sw	a1,12(a4)
    29a8:	0741                	add	a4,a4,16
    29aa:	fed76be3          	bltu	a4,a3,29a0 <memset+0x18>
    29ae:	e211                	bnez	a2,29b2 <memset+0x2a>
    29b0:	8082                	ret
    29b2:	40c306b3          	sub	a3,t1,a2
    29b6:	068a                	sll	a3,a3,0x2
    29b8:	00000297          	auipc	t0,0x0
    29bc:	9696                	add	a3,a3,t0
    29be:	00a68067          	jr	10(a3)
    29c2:	00b70723          	sb	a1,14(a4)
    29c6:	00b706a3          	sb	a1,13(a4)
    29ca:	00b70623          	sb	a1,12(a4)
    29ce:	00b705a3          	sb	a1,11(a4)
    29d2:	00b70523          	sb	a1,10(a4)
    29d6:	00b704a3          	sb	a1,9(a4)
    29da:	00b70423          	sb	a1,8(a4)
    29de:	00b703a3          	sb	a1,7(a4)
    29e2:	00b70323          	sb	a1,6(a4)
    29e6:	00b702a3          	sb	a1,5(a4)
    29ea:	00b70223          	sb	a1,4(a4)
    29ee:	00b701a3          	sb	a1,3(a4)
    29f2:	00b70123          	sb	a1,2(a4)
    29f6:	00b700a3          	sb	a1,1(a4)
    29fa:	00b70023          	sb	a1,0(a4)
    29fe:	8082                	ret
    2a00:	0ff5f593          	zext.b	a1,a1
    2a04:	00859693          	sll	a3,a1,0x8
    2a08:	8dd5                	or	a1,a1,a3
    2a0a:	01059693          	sll	a3,a1,0x10
    2a0e:	8dd5                	or	a1,a1,a3
    2a10:	b761                	j	2998 <memset+0x10>
    2a12:	00279693          	sll	a3,a5,0x2
    2a16:	00000297          	auipc	t0,0x0
    2a1a:	9696                	add	a3,a3,t0
    2a1c:	8286                	mv	t0,ra
    2a1e:	fa8680e7          	jalr	-88(a3)
    2a22:	8096                	mv	ra,t0
    2a24:	17c1                	add	a5,a5,-16
    2a26:	8f1d                	sub	a4,a4,a5
    2a28:	963e                	add	a2,a2,a5
    2a2a:	f8c374e3          	bgeu	t1,a2,29b2 <memset+0x2a>
    2a2e:	b7a5                	j	2996 <memset+0xe>

00002a30 <memcpy>:
    2a30:	00a5c7b3          	xor	a5,a1,a0
    2a34:	8b8d                	and	a5,a5,3
    2a36:	00c508b3          	add	a7,a0,a2
    2a3a:	e7b1                	bnez	a5,2a86 <memcpy+0x56>
    2a3c:	478d                	li	a5,3
    2a3e:	04c7f463          	bgeu	a5,a2,2a86 <memcpy+0x56>
    2a42:	00357793          	and	a5,a0,3
    2a46:	872a                	mv	a4,a0
    2a48:	ebb9                	bnez	a5,2a9e <memcpy+0x6e>
    2a4a:	ffc8f613          	and	a2,a7,-4
    2a4e:	40e606b3          	sub	a3,a2,a4
    2a52:	02000793          	li	a5,32
    2a56:	06d7c863          	blt	a5,a3,2ac6 <memcpy+0x96>
    2a5a:	86ae                	mv	a3,a1
    2a5c:	87ba                	mv	a5,a4
    2a5e:	02c77163          	bgeu	a4,a2,2a80 <memcpy+0x50>
    2a62:	0006a803          	lw	a6,0(a3)
    2a66:	0791                	add	a5,a5,4
    2a68:	0691                	add	a3,a3,4
    2a6a:	ff07ae23          	sw	a6,-4(a5)
    2a6e:	fec7eae3          	bltu	a5,a2,2a62 <memcpy+0x32>
    2a72:	fff60793          	add	a5,a2,-1 # 1fff <neorv32_rte_debug_handler+0x1d>
    2a76:	8f99                	sub	a5,a5,a4
    2a78:	9bf1                	and	a5,a5,-4
    2a7a:	0791                	add	a5,a5,4
    2a7c:	973e                	add	a4,a4,a5
    2a7e:	95be                	add	a1,a1,a5
    2a80:	01176663          	bltu	a4,a7,2a8c <memcpy+0x5c>
    2a84:	8082                	ret
    2a86:	872a                	mv	a4,a0
    2a88:	03157e63          	bgeu	a0,a7,2ac4 <memcpy+0x94>
    2a8c:	0005c783          	lbu	a5,0(a1)
    2a90:	0705                	add	a4,a4,1
    2a92:	0585                	add	a1,a1,1
    2a94:	fef70fa3          	sb	a5,-1(a4)
    2a98:	fee89ae3          	bne	a7,a4,2a8c <memcpy+0x5c>
    2a9c:	8082                	ret
    2a9e:	0005c683          	lbu	a3,0(a1)
    2aa2:	0705                	add	a4,a4,1
    2aa4:	00377793          	and	a5,a4,3
    2aa8:	fed70fa3          	sb	a3,-1(a4)
    2aac:	0585                	add	a1,a1,1
    2aae:	dfd1                	beqz	a5,2a4a <memcpy+0x1a>
    2ab0:	0005c683          	lbu	a3,0(a1)
    2ab4:	0705                	add	a4,a4,1
    2ab6:	00377793          	and	a5,a4,3
    2aba:	fed70fa3          	sb	a3,-1(a4)
    2abe:	0585                	add	a1,a1,1
    2ac0:	fff9                	bnez	a5,2a9e <memcpy+0x6e>
    2ac2:	b761                	j	2a4a <memcpy+0x1a>
    2ac4:	8082                	ret
    2ac6:	1141                	add	sp,sp,-16
    2ac8:	c622                	sw	s0,12(sp)
    2aca:	02000413          	li	s0,32
    2ace:	0005a383          	lw	t2,0(a1)
    2ad2:	0045a283          	lw	t0,4(a1)
    2ad6:	0085af83          	lw	t6,8(a1)
    2ada:	00c5af03          	lw	t5,12(a1)
    2ade:	0105ae83          	lw	t4,16(a1)
    2ae2:	0145ae03          	lw	t3,20(a1)
    2ae6:	0185a303          	lw	t1,24(a1)
    2aea:	01c5a803          	lw	a6,28(a1)
    2aee:	5194                	lw	a3,32(a1)
    2af0:	02470713          	add	a4,a4,36
    2af4:	40e607b3          	sub	a5,a2,a4
    2af8:	fc772e23          	sw	t2,-36(a4)
    2afc:	fe572023          	sw	t0,-32(a4)
    2b00:	fff72223          	sw	t6,-28(a4)
    2b04:	ffe72423          	sw	t5,-24(a4)
    2b08:	ffd72623          	sw	t4,-20(a4)
    2b0c:	ffc72823          	sw	t3,-16(a4)
    2b10:	fe672a23          	sw	t1,-12(a4)
    2b14:	ff072c23          	sw	a6,-8(a4)
    2b18:	fed72e23          	sw	a3,-4(a4)
    2b1c:	02458593          	add	a1,a1,36
    2b20:	faf447e3          	blt	s0,a5,2ace <memcpy+0x9e>
    2b24:	86ae                	mv	a3,a1
    2b26:	87ba                	mv	a5,a4
    2b28:	02c77163          	bgeu	a4,a2,2b4a <memcpy+0x11a>
    2b2c:	0006a803          	lw	a6,0(a3)
    2b30:	0791                	add	a5,a5,4
    2b32:	0691                	add	a3,a3,4
    2b34:	ff07ae23          	sw	a6,-4(a5)
    2b38:	fec7eae3          	bltu	a5,a2,2b2c <memcpy+0xfc>
    2b3c:	fff60793          	add	a5,a2,-1
    2b40:	8f99                	sub	a5,a5,a4
    2b42:	9bf1                	and	a5,a5,-4
    2b44:	0791                	add	a5,a5,4
    2b46:	973e                	add	a4,a4,a5
    2b48:	95be                	add	a1,a1,a5
    2b4a:	01176563          	bltu	a4,a7,2b54 <memcpy+0x124>
    2b4e:	4432                	lw	s0,12(sp)
    2b50:	0141                	add	sp,sp,16
    2b52:	8082                	ret
    2b54:	0005c783          	lbu	a5,0(a1)
    2b58:	0705                	add	a4,a4,1
    2b5a:	0585                	add	a1,a1,1
    2b5c:	fef70fa3          	sb	a5,-1(a4)
    2b60:	fee887e3          	beq	a7,a4,2b4e <memcpy+0x11e>
    2b64:	0005c783          	lbu	a5,0(a1)
    2b68:	0705                	add	a4,a4,1
    2b6a:	0585                	add	a1,a1,1
    2b6c:	fef70fa3          	sb	a5,-1(a4)
    2b70:	fee892e3          	bne	a7,a4,2b54 <memcpy+0x124>
    2b74:	bfe9                	j	2b4e <memcpy+0x11e>

00002b76 <strlen>:
    2b76:	00357793          	and	a5,a0,3
    2b7a:	872a                	mv	a4,a0
    2b7c:	ef9d                	bnez	a5,2bba <strlen+0x44>
    2b7e:	7f7f86b7          	lui	a3,0x7f7f8
    2b82:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_rom_size+0x7f7d7f7f>
    2b86:	55fd                	li	a1,-1
    2b88:	4310                	lw	a2,0(a4)
    2b8a:	0711                	add	a4,a4,4
    2b8c:	00d677b3          	and	a5,a2,a3
    2b90:	97b6                	add	a5,a5,a3
    2b92:	8fd1                	or	a5,a5,a2
    2b94:	8fd5                	or	a5,a5,a3
    2b96:	feb789e3          	beq	a5,a1,2b88 <strlen+0x12>
    2b9a:	ffc74683          	lbu	a3,-4(a4)
    2b9e:	40a707b3          	sub	a5,a4,a0
    2ba2:	ca8d                	beqz	a3,2bd4 <strlen+0x5e>
    2ba4:	ffd74683          	lbu	a3,-3(a4)
    2ba8:	c29d                	beqz	a3,2bce <strlen+0x58>
    2baa:	ffe74503          	lbu	a0,-2(a4)
    2bae:	00a03533          	snez	a0,a0
    2bb2:	953e                	add	a0,a0,a5
    2bb4:	1579                	add	a0,a0,-2
    2bb6:	8082                	ret
    2bb8:	d2f9                	beqz	a3,2b7e <strlen+0x8>
    2bba:	00074783          	lbu	a5,0(a4)
    2bbe:	0705                	add	a4,a4,1
    2bc0:	00377693          	and	a3,a4,3
    2bc4:	fbf5                	bnez	a5,2bb8 <strlen+0x42>
    2bc6:	8f09                	sub	a4,a4,a0
    2bc8:	fff70513          	add	a0,a4,-1
    2bcc:	8082                	ret
    2bce:	ffd78513          	add	a0,a5,-3
    2bd2:	8082                	ret
    2bd4:	ffc78513          	add	a0,a5,-4
    2bd8:	8082                	ret

00002bda <_malloc_trim_r>:
    2bda:	1101                	add	sp,sp,-32
    2bdc:	cc22                	sw	s0,24(sp)
    2bde:	ca26                	sw	s1,20(sp)
    2be0:	c84a                	sw	s2,16(sp)
    2be2:	c64e                	sw	s3,12(sp)
    2be4:	c452                	sw	s4,8(sp)
    2be6:	89ae                	mv	s3,a1
    2be8:	ce06                	sw	ra,28(sp)
    2bea:	892a                	mv	s2,a0
    2bec:	7fffda17          	auipc	s4,0x7fffd
    2bf0:	414a0a13          	add	s4,s4,1044 # 80000000 <__malloc_av_>
    2bf4:	3149                	jal	2876 <__malloc_lock>
    2bf6:	008a2703          	lw	a4,8(s4)
    2bfa:	6785                	lui	a5,0x1
    2bfc:	17bd                	add	a5,a5,-17 # fef <portable_init+0xed>
    2bfe:	4344                	lw	s1,4(a4)
    2c00:	6705                	lui	a4,0x1
    2c02:	98f1                	and	s1,s1,-4
    2c04:	00f48433          	add	s0,s1,a5
    2c08:	41340433          	sub	s0,s0,s3
    2c0c:	8031                	srl	s0,s0,0xc
    2c0e:	147d                	add	s0,s0,-1
    2c10:	0432                	sll	s0,s0,0xc
    2c12:	00e44a63          	blt	s0,a4,2c26 <_malloc_trim_r+0x4c>
    2c16:	4581                	li	a1,0
    2c18:	854a                	mv	a0,s2
    2c1a:	333d                	jal	2948 <_sbrk_r>
    2c1c:	008a2783          	lw	a5,8(s4)
    2c20:	97a6                	add	a5,a5,s1
    2c22:	00f50d63          	beq	a0,a5,2c3c <_malloc_trim_r+0x62>
    2c26:	854a                	mv	a0,s2
    2c28:	39a1                	jal	2880 <__malloc_unlock>
    2c2a:	40f2                	lw	ra,28(sp)
    2c2c:	4462                	lw	s0,24(sp)
    2c2e:	44d2                	lw	s1,20(sp)
    2c30:	4942                	lw	s2,16(sp)
    2c32:	49b2                	lw	s3,12(sp)
    2c34:	4a22                	lw	s4,8(sp)
    2c36:	4501                	li	a0,0
    2c38:	6105                	add	sp,sp,32
    2c3a:	8082                	ret
    2c3c:	408005b3          	neg	a1,s0
    2c40:	854a                	mv	a0,s2
    2c42:	3319                	jal	2948 <_sbrk_r>
    2c44:	57fd                	li	a5,-1
    2c46:	02f50b63          	beq	a0,a5,2c7c <_malloc_trim_r+0xa2>
    2c4a:	7fffe717          	auipc	a4,0x7fffe
    2c4e:	18e70713          	add	a4,a4,398 # 80000dd8 <__malloc_current_mallinfo>
    2c52:	431c                	lw	a5,0(a4)
    2c54:	008a2683          	lw	a3,8(s4)
    2c58:	8c81                	sub	s1,s1,s0
    2c5a:	0014e493          	or	s1,s1,1
    2c5e:	8f81                	sub	a5,a5,s0
    2c60:	854a                	mv	a0,s2
    2c62:	c2c4                	sw	s1,4(a3)
    2c64:	c31c                	sw	a5,0(a4)
    2c66:	c1bff0ef          	jal	2880 <__malloc_unlock>
    2c6a:	40f2                	lw	ra,28(sp)
    2c6c:	4462                	lw	s0,24(sp)
    2c6e:	44d2                	lw	s1,20(sp)
    2c70:	4942                	lw	s2,16(sp)
    2c72:	49b2                	lw	s3,12(sp)
    2c74:	4a22                	lw	s4,8(sp)
    2c76:	4505                	li	a0,1
    2c78:	6105                	add	sp,sp,32
    2c7a:	8082                	ret
    2c7c:	4581                	li	a1,0
    2c7e:	854a                	mv	a0,s2
    2c80:	31e1                	jal	2948 <_sbrk_r>
    2c82:	008a2703          	lw	a4,8(s4)
    2c86:	46bd                	li	a3,15
    2c88:	40e507b3          	sub	a5,a0,a4
    2c8c:	f8f6dde3          	bge	a3,a5,2c26 <_malloc_trim_r+0x4c>
    2c90:	7fffe697          	auipc	a3,0x7fffe
    2c94:	8b06a683          	lw	a3,-1872(a3) # 80000540 <__malloc_sbrk_base>
    2c98:	8d15                	sub	a0,a0,a3
    2c9a:	0017e793          	or	a5,a5,1
    2c9e:	7fffe697          	auipc	a3,0x7fffe
    2ca2:	12a6ad23          	sw	a0,314(a3) # 80000dd8 <__malloc_current_mallinfo>
    2ca6:	c35c                	sw	a5,4(a4)
    2ca8:	bfbd                	j	2c26 <_malloc_trim_r+0x4c>

00002caa <_free_r>:
    2caa:	10058d63          	beqz	a1,2dc4 <_free_r+0x11a>
    2cae:	1141                	add	sp,sp,-16
    2cb0:	c422                	sw	s0,8(sp)
    2cb2:	c226                	sw	s1,4(sp)
    2cb4:	842e                	mv	s0,a1
    2cb6:	84aa                	mv	s1,a0
    2cb8:	c606                	sw	ra,12(sp)
    2cba:	bbdff0ef          	jal	2876 <__malloc_lock>
    2cbe:	ffc42583          	lw	a1,-4(s0)
    2cc2:	ff840713          	add	a4,s0,-8
    2cc6:	7fffd517          	auipc	a0,0x7fffd
    2cca:	33a50513          	add	a0,a0,826 # 80000000 <__malloc_av_>
    2cce:	ffe5f793          	and	a5,a1,-2
    2cd2:	00f70633          	add	a2,a4,a5
    2cd6:	4254                	lw	a3,4(a2)
    2cd8:	00852803          	lw	a6,8(a0)
    2cdc:	9af1                	and	a3,a3,-4
    2cde:	12c80563          	beq	a6,a2,2e08 <_free_r+0x15e>
    2ce2:	c254                	sw	a3,4(a2)
    2ce4:	8985                	and	a1,a1,1
    2ce6:	00d60833          	add	a6,a2,a3
    2cea:	e9bd                	bnez	a1,2d60 <_free_r+0xb6>
    2cec:	ff842303          	lw	t1,-8(s0)
    2cf0:	00482583          	lw	a1,4(a6)
    2cf4:	7fffd897          	auipc	a7,0x7fffd
    2cf8:	31488893          	add	a7,a7,788 # 80000008 <__malloc_av_+0x8>
    2cfc:	40670733          	sub	a4,a4,t1
    2d00:	00872803          	lw	a6,8(a4)
    2d04:	979a                	add	a5,a5,t1
    2d06:	8985                	and	a1,a1,1
    2d08:	0f180463          	beq	a6,a7,2df0 <_free_r+0x146>
    2d0c:	00c72303          	lw	t1,12(a4)
    2d10:	00682623          	sw	t1,12(a6)
    2d14:	01032423          	sw	a6,8(t1)
    2d18:	12058463          	beqz	a1,2e40 <_free_r+0x196>
    2d1c:	0017e693          	or	a3,a5,1
    2d20:	c354                	sw	a3,4(a4)
    2d22:	c21c                	sw	a5,0(a2)
    2d24:	1ff00693          	li	a3,511
    2d28:	04f6e963          	bltu	a3,a5,2d7a <_free_r+0xd0>
    2d2c:	ff87f693          	and	a3,a5,-8
    2d30:	06a1                	add	a3,a3,8
    2d32:	414c                	lw	a1,4(a0)
    2d34:	96aa                	add	a3,a3,a0
    2d36:	4290                	lw	a2,0(a3)
    2d38:	0057d813          	srl	a6,a5,0x5
    2d3c:	4785                	li	a5,1
    2d3e:	010797b3          	sll	a5,a5,a6
    2d42:	8fcd                	or	a5,a5,a1
    2d44:	ff868593          	add	a1,a3,-8
    2d48:	c74c                	sw	a1,12(a4)
    2d4a:	c710                	sw	a2,8(a4)
    2d4c:	c15c                	sw	a5,4(a0)
    2d4e:	c298                	sw	a4,0(a3)
    2d50:	c658                	sw	a4,12(a2)
    2d52:	4422                	lw	s0,8(sp)
    2d54:	40b2                	lw	ra,12(sp)
    2d56:	8526                	mv	a0,s1
    2d58:	4492                	lw	s1,4(sp)
    2d5a:	0141                	add	sp,sp,16
    2d5c:	b25ff06f          	j	2880 <__malloc_unlock>
    2d60:	00482583          	lw	a1,4(a6)
    2d64:	8985                	and	a1,a1,1
    2d66:	c1a5                	beqz	a1,2dc6 <_free_r+0x11c>
    2d68:	0017e693          	or	a3,a5,1
    2d6c:	fed42e23          	sw	a3,-4(s0)
    2d70:	c21c                	sw	a5,0(a2)
    2d72:	1ff00693          	li	a3,511
    2d76:	faf6fbe3          	bgeu	a3,a5,2d2c <_free_r+0x82>
    2d7a:	0097d693          	srl	a3,a5,0x9
    2d7e:	4611                	li	a2,4
    2d80:	0cd66263          	bltu	a2,a3,2e44 <_free_r+0x19a>
    2d84:	0067d693          	srl	a3,a5,0x6
    2d88:	03968593          	add	a1,a3,57
    2d8c:	03868613          	add	a2,a3,56
    2d90:	058e                	sll	a1,a1,0x3
    2d92:	95aa                	add	a1,a1,a0
    2d94:	4194                	lw	a3,0(a1)
    2d96:	15e1                	add	a1,a1,-8
    2d98:	00d59663          	bne	a1,a3,2da4 <_free_r+0xfa>
    2d9c:	a0ed                	j	2e86 <_free_r+0x1dc>
    2d9e:	4694                	lw	a3,8(a3)
    2da0:	00d58663          	beq	a1,a3,2dac <_free_r+0x102>
    2da4:	42d0                	lw	a2,4(a3)
    2da6:	9a71                	and	a2,a2,-4
    2da8:	fec7ebe3          	bltu	a5,a2,2d9e <_free_r+0xf4>
    2dac:	46cc                	lw	a1,12(a3)
    2dae:	c74c                	sw	a1,12(a4)
    2db0:	c714                	sw	a3,8(a4)
    2db2:	4422                	lw	s0,8(sp)
    2db4:	40b2                	lw	ra,12(sp)
    2db6:	c598                	sw	a4,8(a1)
    2db8:	8526                	mv	a0,s1
    2dba:	4492                	lw	s1,4(sp)
    2dbc:	c6d8                	sw	a4,12(a3)
    2dbe:	0141                	add	sp,sp,16
    2dc0:	ac1ff06f          	j	2880 <__malloc_unlock>
    2dc4:	8082                	ret
    2dc6:	97b6                	add	a5,a5,a3
    2dc8:	7fffd897          	auipc	a7,0x7fffd
    2dcc:	24088893          	add	a7,a7,576 # 80000008 <__malloc_av_+0x8>
    2dd0:	4614                	lw	a3,8(a2)
    2dd2:	09168e63          	beq	a3,a7,2e6e <_free_r+0x1c4>
    2dd6:	00c62803          	lw	a6,12(a2)
    2dda:	0017e593          	or	a1,a5,1
    2dde:	00f70633          	add	a2,a4,a5
    2de2:	0106a623          	sw	a6,12(a3)
    2de6:	00d82423          	sw	a3,8(a6)
    2dea:	c34c                	sw	a1,4(a4)
    2dec:	c21c                	sw	a5,0(a2)
    2dee:	bf1d                	j	2d24 <_free_r+0x7a>
    2df0:	e1f5                	bnez	a1,2ed4 <_free_r+0x22a>
    2df2:	460c                	lw	a1,8(a2)
    2df4:	4650                	lw	a2,12(a2)
    2df6:	96be                	add	a3,a3,a5
    2df8:	0016e793          	or	a5,a3,1
    2dfc:	c5d0                	sw	a2,12(a1)
    2dfe:	c60c                	sw	a1,8(a2)
    2e00:	c35c                	sw	a5,4(a4)
    2e02:	9736                	add	a4,a4,a3
    2e04:	c314                	sw	a3,0(a4)
    2e06:	b7b1                	j	2d52 <_free_r+0xa8>
    2e08:	8985                	and	a1,a1,1
    2e0a:	96be                	add	a3,a3,a5
    2e0c:	e989                	bnez	a1,2e1e <_free_r+0x174>
    2e0e:	ff842583          	lw	a1,-8(s0)
    2e12:	8f0d                	sub	a4,a4,a1
    2e14:	475c                	lw	a5,12(a4)
    2e16:	4710                	lw	a2,8(a4)
    2e18:	96ae                	add	a3,a3,a1
    2e1a:	c65c                	sw	a5,12(a2)
    2e1c:	c790                	sw	a2,8(a5)
    2e1e:	0016e793          	or	a5,a3,1
    2e22:	c35c                	sw	a5,4(a4)
    2e24:	c518                	sw	a4,8(a0)
    2e26:	7fffd797          	auipc	a5,0x7fffd
    2e2a:	71e7a783          	lw	a5,1822(a5) # 80000544 <__malloc_trim_threshold>
    2e2e:	f2f6e2e3          	bltu	a3,a5,2d52 <_free_r+0xa8>
    2e32:	7fffd597          	auipc	a1,0x7fffd
    2e36:	74e5a583          	lw	a1,1870(a1) # 80000580 <__malloc_top_pad>
    2e3a:	8526                	mv	a0,s1
    2e3c:	3b79                	jal	2bda <_malloc_trim_r>
    2e3e:	bf11                	j	2d52 <_free_r+0xa8>
    2e40:	97b6                	add	a5,a5,a3
    2e42:	b779                	j	2dd0 <_free_r+0x126>
    2e44:	4651                	li	a2,20
    2e46:	00d67e63          	bgeu	a2,a3,2e62 <_free_r+0x1b8>
    2e4a:	05400613          	li	a2,84
    2e4e:	04d66663          	bltu	a2,a3,2e9a <_free_r+0x1f0>
    2e52:	00c7d693          	srl	a3,a5,0xc
    2e56:	06f68593          	add	a1,a3,111
    2e5a:	06e68613          	add	a2,a3,110
    2e5e:	058e                	sll	a1,a1,0x3
    2e60:	bf0d                	j	2d92 <_free_r+0xe8>
    2e62:	05c68593          	add	a1,a3,92
    2e66:	05b68613          	add	a2,a3,91
    2e6a:	058e                	sll	a1,a1,0x3
    2e6c:	b71d                	j	2d92 <_free_r+0xe8>
    2e6e:	c958                	sw	a4,20(a0)
    2e70:	c918                	sw	a4,16(a0)
    2e72:	0017e693          	or	a3,a5,1
    2e76:	01172623          	sw	a7,12(a4)
    2e7a:	01172423          	sw	a7,8(a4)
    2e7e:	c354                	sw	a3,4(a4)
    2e80:	973e                	add	a4,a4,a5
    2e82:	c31c                	sw	a5,0(a4)
    2e84:	b5f9                	j	2d52 <_free_r+0xa8>
    2e86:	00452803          	lw	a6,4(a0)
    2e8a:	8609                	sra	a2,a2,0x2
    2e8c:	4785                	li	a5,1
    2e8e:	00c797b3          	sll	a5,a5,a2
    2e92:	0107e7b3          	or	a5,a5,a6
    2e96:	c15c                	sw	a5,4(a0)
    2e98:	bf19                	j	2dae <_free_r+0x104>
    2e9a:	15400613          	li	a2,340
    2e9e:	00d66a63          	bltu	a2,a3,2eb2 <_free_r+0x208>
    2ea2:	00f7d693          	srl	a3,a5,0xf
    2ea6:	07868593          	add	a1,a3,120
    2eaa:	07768613          	add	a2,a3,119
    2eae:	058e                	sll	a1,a1,0x3
    2eb0:	b5cd                	j	2d92 <_free_r+0xe8>
    2eb2:	55400613          	li	a2,1364
    2eb6:	00d66a63          	bltu	a2,a3,2eca <_free_r+0x220>
    2eba:	0127d693          	srl	a3,a5,0x12
    2ebe:	07d68593          	add	a1,a3,125
    2ec2:	07c68613          	add	a2,a3,124
    2ec6:	058e                	sll	a1,a1,0x3
    2ec8:	b5e9                	j	2d92 <_free_r+0xe8>
    2eca:	3f800593          	li	a1,1016
    2ece:	07e00613          	li	a2,126
    2ed2:	b5c1                	j	2d92 <_free_r+0xe8>
    2ed4:	0017e693          	or	a3,a5,1
    2ed8:	c354                	sw	a3,4(a4)
    2eda:	c21c                	sw	a5,0(a2)
    2edc:	bd9d                	j	2d52 <_free_r+0xa8>

00002ede <stdio_exit_handler>:
    2ede:	7fffd617          	auipc	a2,0x7fffd
    2ee2:	64a60613          	add	a2,a2,1610 # 80000528 <__sglue>
    2ee6:	00001597          	auipc	a1,0x1
    2eea:	dbe58593          	add	a1,a1,-578 # 3ca4 <_fclose_r>
    2eee:	7fffd517          	auipc	a0,0x7fffd
    2ef2:	51a50513          	add	a0,a0,1306 # 80000408 <_impure_data>
    2ef6:	a38d                	j	3458 <_fwalk_sglue>

00002ef8 <cleanup_stdio>:
    2ef8:	414c                	lw	a1,4(a0)
    2efa:	1141                	add	sp,sp,-16
    2efc:	c422                	sw	s0,8(sp)
    2efe:	c606                	sw	ra,12(sp)
    2f00:	7fffe797          	auipc	a5,0x7fffe
    2f04:	f0078793          	add	a5,a5,-256 # 80000e00 <__sf>
    2f08:	842a                	mv	s0,a0
    2f0a:	00f58463          	beq	a1,a5,2f12 <cleanup_stdio+0x1a>
    2f0e:	597000ef          	jal	3ca4 <_fclose_r>
    2f12:	440c                	lw	a1,8(s0)
    2f14:	7fffe797          	auipc	a5,0x7fffe
    2f18:	f5478793          	add	a5,a5,-172 # 80000e68 <__sf+0x68>
    2f1c:	00f58563          	beq	a1,a5,2f26 <cleanup_stdio+0x2e>
    2f20:	8522                	mv	a0,s0
    2f22:	583000ef          	jal	3ca4 <_fclose_r>
    2f26:	444c                	lw	a1,12(s0)
    2f28:	7fffe797          	auipc	a5,0x7fffe
    2f2c:	fa878793          	add	a5,a5,-88 # 80000ed0 <__sf+0xd0>
    2f30:	00f58863          	beq	a1,a5,2f40 <cleanup_stdio+0x48>
    2f34:	8522                	mv	a0,s0
    2f36:	4422                	lw	s0,8(sp)
    2f38:	40b2                	lw	ra,12(sp)
    2f3a:	0141                	add	sp,sp,16
    2f3c:	5690006f          	j	3ca4 <_fclose_r>
    2f40:	40b2                	lw	ra,12(sp)
    2f42:	4422                	lw	s0,8(sp)
    2f44:	0141                	add	sp,sp,16
    2f46:	8082                	ret

00002f48 <global_stdio_init.part.0>:
    2f48:	1101                	add	sp,sp,-32
    2f4a:	00000797          	auipc	a5,0x0
    2f4e:	f9478793          	add	a5,a5,-108 # 2ede <stdio_exit_handler>
    2f52:	ce06                	sw	ra,28(sp)
    2f54:	cc22                	sw	s0,24(sp)
    2f56:	ca26                	sw	s1,20(sp)
    2f58:	7fffe417          	auipc	s0,0x7fffe
    2f5c:	ea840413          	add	s0,s0,-344 # 80000e00 <__sf>
    2f60:	c84a                	sw	s2,16(sp)
    2f62:	c64e                	sw	s3,12(sp)
    2f64:	c452                	sw	s4,8(sp)
    2f66:	4621                	li	a2,8
    2f68:	4581                	li	a1,0
    2f6a:	7fffd717          	auipc	a4,0x7fffd
    2f6e:	62f72323          	sw	a5,1574(a4) # 80000590 <__stdio_exit_handler>
    2f72:	7fffe517          	auipc	a0,0x7fffe
    2f76:	eea50513          	add	a0,a0,-278 # 80000e5c <__sf+0x5c>
    2f7a:	4791                	li	a5,4
    2f7c:	c45c                	sw	a5,12(s0)
    2f7e:	00042023          	sw	zero,0(s0)
    2f82:	00042223          	sw	zero,4(s0)
    2f86:	00042423          	sw	zero,8(s0)
    2f8a:	06042223          	sw	zero,100(s0)
    2f8e:	00042823          	sw	zero,16(s0)
    2f92:	00042a23          	sw	zero,20(s0)
    2f96:	00042c23          	sw	zero,24(s0)
    2f9a:	9efff0ef          	jal	2988 <memset>
    2f9e:	00000a17          	auipc	s4,0x0
    2fa2:	52ca0a13          	add	s4,s4,1324 # 34ca <__sread>
    2fa6:	00000997          	auipc	s3,0x0
    2faa:	55a98993          	add	s3,s3,1370 # 3500 <__swrite>
    2fae:	00000917          	auipc	s2,0x0
    2fb2:	5a290913          	add	s2,s2,1442 # 3550 <__sseek>
    2fb6:	00000497          	auipc	s1,0x0
    2fba:	5e248493          	add	s1,s1,1506 # 3598 <__sclose>
    2fbe:	7fffe517          	auipc	a0,0x7fffe
    2fc2:	e9a50513          	add	a0,a0,-358 # 80000e58 <__sf+0x58>
    2fc6:	03442023          	sw	s4,32(s0)
    2fca:	03342223          	sw	s3,36(s0)
    2fce:	03242423          	sw	s2,40(s0)
    2fd2:	d444                	sw	s1,44(s0)
    2fd4:	cc40                	sw	s0,28(s0)
    2fd6:	9abff0ef          	jal	2980 <__retarget_lock_init_recursive>
    2fda:	67c1                	lui	a5,0x10
    2fdc:	07a5                	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0xb2ed>
    2fde:	4621                	li	a2,8
    2fe0:	4581                	li	a1,0
    2fe2:	7fffe517          	auipc	a0,0x7fffe
    2fe6:	ee250513          	add	a0,a0,-286 # 80000ec4 <__sf+0xc4>
    2fea:	d87c                	sw	a5,116(s0)
    2fec:	06042423          	sw	zero,104(s0)
    2ff0:	06042623          	sw	zero,108(s0)
    2ff4:	06042823          	sw	zero,112(s0)
    2ff8:	0c042623          	sw	zero,204(s0)
    2ffc:	06042c23          	sw	zero,120(s0)
    3000:	06042e23          	sw	zero,124(s0)
    3004:	08042023          	sw	zero,128(s0)
    3008:	981ff0ef          	jal	2988 <memset>
    300c:	7fffe797          	auipc	a5,0x7fffe
    3010:	e5c78793          	add	a5,a5,-420 # 80000e68 <__sf+0x68>
    3014:	7fffe517          	auipc	a0,0x7fffe
    3018:	eac50513          	add	a0,a0,-340 # 80000ec0 <__sf+0xc0>
    301c:	08f42223          	sw	a5,132(s0)
    3020:	09442423          	sw	s4,136(s0)
    3024:	09342623          	sw	s3,140(s0)
    3028:	09242823          	sw	s2,144(s0)
    302c:	08942a23          	sw	s1,148(s0)
    3030:	951ff0ef          	jal	2980 <__retarget_lock_init_recursive>
    3034:	000207b7          	lui	a5,0x20
    3038:	07c9                	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    303a:	4621                	li	a2,8
    303c:	4581                	li	a1,0
    303e:	7fffe517          	auipc	a0,0x7fffe
    3042:	eee50513          	add	a0,a0,-274 # 80000f2c <__sf+0x12c>
    3046:	0cf42e23          	sw	a5,220(s0)
    304a:	0c042823          	sw	zero,208(s0)
    304e:	0c042a23          	sw	zero,212(s0)
    3052:	0c042c23          	sw	zero,216(s0)
    3056:	12042a23          	sw	zero,308(s0)
    305a:	0e042023          	sw	zero,224(s0)
    305e:	0e042223          	sw	zero,228(s0)
    3062:	0e042423          	sw	zero,232(s0)
    3066:	923ff0ef          	jal	2988 <memset>
    306a:	7fffe797          	auipc	a5,0x7fffe
    306e:	e6678793          	add	a5,a5,-410 # 80000ed0 <__sf+0xd0>
    3072:	0f442823          	sw	s4,240(s0)
    3076:	0f342a23          	sw	s3,244(s0)
    307a:	0f242c23          	sw	s2,248(s0)
    307e:	0e942e23          	sw	s1,252(s0)
    3082:	0ef42623          	sw	a5,236(s0)
    3086:	4462                	lw	s0,24(sp)
    3088:	40f2                	lw	ra,28(sp)
    308a:	44d2                	lw	s1,20(sp)
    308c:	4942                	lw	s2,16(sp)
    308e:	49b2                	lw	s3,12(sp)
    3090:	4a22                	lw	s4,8(sp)
    3092:	7fffe517          	auipc	a0,0x7fffe
    3096:	e9650513          	add	a0,a0,-362 # 80000f28 <__sf+0x128>
    309a:	6105                	add	sp,sp,32
    309c:	8e5ff06f          	j	2980 <__retarget_lock_init_recursive>

000030a0 <__sinit>:
    30a0:	1141                	add	sp,sp,-16
    30a2:	c422                	sw	s0,8(sp)
    30a4:	842a                	mv	s0,a0
    30a6:	7fffd517          	auipc	a0,0x7fffd
    30aa:	4e650513          	add	a0,a0,1254 # 8000058c <__lock___sfp_recursive_mutex>
    30ae:	c606                	sw	ra,12(sp)
    30b0:	8d5ff0ef          	jal	2984 <__retarget_lock_acquire_recursive>
    30b4:	585c                	lw	a5,52(s0)
    30b6:	eb99                	bnez	a5,30cc <__sinit+0x2c>
    30b8:	00000797          	auipc	a5,0x0
    30bc:	e4078793          	add	a5,a5,-448 # 2ef8 <cleanup_stdio>
    30c0:	d85c                	sw	a5,52(s0)
    30c2:	7fffd797          	auipc	a5,0x7fffd
    30c6:	4ce7a783          	lw	a5,1230(a5) # 80000590 <__stdio_exit_handler>
    30ca:	cb91                	beqz	a5,30de <__sinit+0x3e>
    30cc:	4422                	lw	s0,8(sp)
    30ce:	40b2                	lw	ra,12(sp)
    30d0:	7fffd517          	auipc	a0,0x7fffd
    30d4:	4bc50513          	add	a0,a0,1212 # 8000058c <__lock___sfp_recursive_mutex>
    30d8:	0141                	add	sp,sp,16
    30da:	8adff06f          	j	2986 <__retarget_lock_release_recursive>
    30de:	35ad                	jal	2f48 <global_stdio_init.part.0>
    30e0:	4422                	lw	s0,8(sp)
    30e2:	40b2                	lw	ra,12(sp)
    30e4:	7fffd517          	auipc	a0,0x7fffd
    30e8:	4a850513          	add	a0,a0,1192 # 8000058c <__lock___sfp_recursive_mutex>
    30ec:	0141                	add	sp,sp,16
    30ee:	899ff06f          	j	2986 <__retarget_lock_release_recursive>

000030f2 <__sfp_lock_acquire>:
    30f2:	7fffd517          	auipc	a0,0x7fffd
    30f6:	49a50513          	add	a0,a0,1178 # 8000058c <__lock___sfp_recursive_mutex>
    30fa:	88bff06f          	j	2984 <__retarget_lock_acquire_recursive>

000030fe <__sfp_lock_release>:
    30fe:	7fffd517          	auipc	a0,0x7fffd
    3102:	48e50513          	add	a0,a0,1166 # 8000058c <__lock___sfp_recursive_mutex>
    3106:	881ff06f          	j	2986 <__retarget_lock_release_recursive>

0000310a <__sfvwrite_r>:
    310a:	461c                	lw	a5,8(a2)
    310c:	1c078e63          	beqz	a5,32e8 <__sfvwrite_r+0x1de>
    3110:	00c59683          	lh	a3,12(a1)
    3114:	7179                	add	sp,sp,-48
    3116:	d422                	sw	s0,40(sp)
    3118:	cc52                	sw	s4,24(sp)
    311a:	c85a                	sw	s6,16(sp)
    311c:	d606                	sw	ra,44(sp)
    311e:	0086f793          	and	a5,a3,8
    3122:	8b32                	mv	s6,a2
    3124:	8a2a                	mv	s4,a0
    3126:	842e                	mv	s0,a1
    3128:	c7ad                	beqz	a5,3192 <__sfvwrite_r+0x88>
    312a:	499c                	lw	a5,16(a1)
    312c:	c3bd                	beqz	a5,3192 <__sfvwrite_r+0x88>
    312e:	d226                	sw	s1,36(sp)
    3130:	d04a                	sw	s2,32(sp)
    3132:	ce4e                	sw	s3,28(sp)
    3134:	ca56                	sw	s5,20(sp)
    3136:	0026f793          	and	a5,a3,2
    313a:	000b2483          	lw	s1,0(s6)
    313e:	cbb5                	beqz	a5,31b2 <__sfvwrite_r+0xa8>
    3140:	505c                	lw	a5,36(s0)
    3142:	4c4c                	lw	a1,28(s0)
    3144:	80000ab7          	lui	s5,0x80000
    3148:	4981                	li	s3,0
    314a:	4901                	li	s2,0
    314c:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_rom_size+0x7ffdfc00>
    3150:	864e                	mv	a2,s3
    3152:	8552                	mv	a0,s4
    3154:	02090963          	beqz	s2,3186 <__sfvwrite_r+0x7c>
    3158:	86ca                	mv	a3,s2
    315a:	012af363          	bgeu	s5,s2,3160 <__sfvwrite_r+0x56>
    315e:	86d6                	mv	a3,s5
    3160:	9782                	jalr	a5
    3162:	2ca05f63          	blez	a0,3440 <__sfvwrite_r+0x336>
    3166:	008b2783          	lw	a5,8(s6)
    316a:	99aa                	add	s3,s3,a0
    316c:	40a90933          	sub	s2,s2,a0
    3170:	8f89                	sub	a5,a5,a0
    3172:	00fb2423          	sw	a5,8(s6)
    3176:	12078663          	beqz	a5,32a2 <__sfvwrite_r+0x198>
    317a:	505c                	lw	a5,36(s0)
    317c:	4c4c                	lw	a1,28(s0)
    317e:	864e                	mv	a2,s3
    3180:	8552                	mv	a0,s4
    3182:	fc091be3          	bnez	s2,3158 <__sfvwrite_r+0x4e>
    3186:	0004a983          	lw	s3,0(s1)
    318a:	0044a903          	lw	s2,4(s1)
    318e:	04a1                	add	s1,s1,8
    3190:	b7c1                	j	3150 <__sfvwrite_r+0x46>
    3192:	85a2                	mv	a1,s0
    3194:	8552                	mv	a0,s4
    3196:	2121                	jal	359e <__swsetup_r>
    3198:	14051163          	bnez	a0,32da <__sfvwrite_r+0x1d0>
    319c:	00c41683          	lh	a3,12(s0)
    31a0:	d226                	sw	s1,36(sp)
    31a2:	d04a                	sw	s2,32(sp)
    31a4:	ce4e                	sw	s3,28(sp)
    31a6:	ca56                	sw	s5,20(sp)
    31a8:	0026f793          	and	a5,a3,2
    31ac:	000b2483          	lw	s1,0(s6)
    31b0:	fbc1                	bnez	a5,3140 <__sfvwrite_r+0x36>
    31b2:	c65e                	sw	s7,12(sp)
    31b4:	c462                	sw	s8,8(sp)
    31b6:	0016f793          	and	a5,a3,1
    31ba:	12079963          	bnez	a5,32ec <__sfvwrite_r+0x1e2>
    31be:	401c                	lw	a5,0(s0)
    31c0:	4418                	lw	a4,8(s0)
    31c2:	80000ab7          	lui	s5,0x80000
    31c6:	c266                	sw	s9,4(sp)
    31c8:	4b81                	li	s7,0
    31ca:	4981                	li	s3,0
    31cc:	1afd                	add	s5,s5,-1 # 7fffffff <__neorv32_rom_size+0x7ffdffff>
    31ce:	853e                	mv	a0,a5
    31d0:	8c3a                	mv	s8,a4
    31d2:	0a098f63          	beqz	s3,3290 <__sfvwrite_r+0x186>
    31d6:	2006f613          	and	a2,a3,512
    31da:	1a060863          	beqz	a2,338a <__sfvwrite_r+0x280>
    31de:	8cba                	mv	s9,a4
    31e0:	20e9e963          	bltu	s3,a4,33f2 <__sfvwrite_r+0x2e8>
    31e4:	4806f713          	and	a4,a3,1152
    31e8:	cb25                	beqz	a4,3258 <__sfvwrite_r+0x14e>
    31ea:	4850                	lw	a2,20(s0)
    31ec:	480c                	lw	a1,16(s0)
    31ee:	00161713          	sll	a4,a2,0x1
    31f2:	9732                	add	a4,a4,a2
    31f4:	40b78933          	sub	s2,a5,a1
    31f8:	01f75c13          	srl	s8,a4,0x1f
    31fc:	9c3a                	add	s8,s8,a4
    31fe:	00190793          	add	a5,s2,1
    3202:	401c5c13          	sra	s8,s8,0x1
    3206:	97ce                	add	a5,a5,s3
    3208:	8662                	mv	a2,s8
    320a:	00fc7463          	bgeu	s8,a5,3212 <__sfvwrite_r+0x108>
    320e:	8c3e                	mv	s8,a5
    3210:	863e                	mv	a2,a5
    3212:	4006f693          	and	a3,a3,1024
    3216:	1e068d63          	beqz	a3,3410 <__sfvwrite_r+0x306>
    321a:	85b2                	mv	a1,a2
    321c:	8552                	mv	a0,s4
    321e:	89aff0ef          	jal	22b8 <_malloc_r>
    3222:	8caa                	mv	s9,a0
    3224:	22050163          	beqz	a0,3446 <__sfvwrite_r+0x33c>
    3228:	480c                	lw	a1,16(s0)
    322a:	864a                	mv	a2,s2
    322c:	805ff0ef          	jal	2a30 <memcpy>
    3230:	00c45783          	lhu	a5,12(s0)
    3234:	b7f7f793          	and	a5,a5,-1153
    3238:	0807e793          	or	a5,a5,128
    323c:	00f41623          	sh	a5,12(s0)
    3240:	012c8533          	add	a0,s9,s2
    3244:	412c07b3          	sub	a5,s8,s2
    3248:	01942823          	sw	s9,16(s0)
    324c:	01842a23          	sw	s8,20(s0)
    3250:	c008                	sw	a0,0(s0)
    3252:	8c4e                	mv	s8,s3
    3254:	c41c                	sw	a5,8(s0)
    3256:	8cce                	mv	s9,s3
    3258:	8666                	mv	a2,s9
    325a:	85de                	mv	a1,s7
    325c:	2345                	jal	37fc <memmove>
    325e:	4418                	lw	a4,8(s0)
    3260:	401c                	lw	a5,0(s0)
    3262:	894e                	mv	s2,s3
    3264:	41870733          	sub	a4,a4,s8
    3268:	97e6                	add	a5,a5,s9
    326a:	c418                	sw	a4,8(s0)
    326c:	c01c                	sw	a5,0(s0)
    326e:	4981                	li	s3,0
    3270:	008b2783          	lw	a5,8(s6)
    3274:	9bca                	add	s7,s7,s2
    3276:	412787b3          	sub	a5,a5,s2
    327a:	00fb2423          	sw	a5,8(s6)
    327e:	cf99                	beqz	a5,329c <__sfvwrite_r+0x192>
    3280:	401c                	lw	a5,0(s0)
    3282:	4418                	lw	a4,8(s0)
    3284:	00c41683          	lh	a3,12(s0)
    3288:	853e                	mv	a0,a5
    328a:	8c3a                	mv	s8,a4
    328c:	f40995e3          	bnez	s3,31d6 <__sfvwrite_r+0xcc>
    3290:	0004ab83          	lw	s7,0(s1)
    3294:	0044a983          	lw	s3,4(s1)
    3298:	04a1                	add	s1,s1,8
    329a:	bf15                	j	31ce <__sfvwrite_r+0xc4>
    329c:	4bb2                	lw	s7,12(sp)
    329e:	4c22                	lw	s8,8(sp)
    32a0:	4c92                	lw	s9,4(sp)
    32a2:	50b2                	lw	ra,44(sp)
    32a4:	5422                	lw	s0,40(sp)
    32a6:	5492                	lw	s1,36(sp)
    32a8:	5902                	lw	s2,32(sp)
    32aa:	49f2                	lw	s3,28(sp)
    32ac:	4ad2                	lw	s5,20(sp)
    32ae:	4a62                	lw	s4,24(sp)
    32b0:	4b42                	lw	s6,16(sp)
    32b2:	4501                	li	a0,0
    32b4:	6145                	add	sp,sp,48
    32b6:	8082                	ret
    32b8:	85a2                	mv	a1,s0
    32ba:	8552                	mv	a0,s4
    32bc:	463000ef          	jal	3f1e <_fflush_r>
    32c0:	c93d                	beqz	a0,3336 <__sfvwrite_r+0x22c>
    32c2:	00c41783          	lh	a5,12(s0)
    32c6:	4bb2                	lw	s7,12(sp)
    32c8:	4c22                	lw	s8,8(sp)
    32ca:	5492                	lw	s1,36(sp)
    32cc:	5902                	lw	s2,32(sp)
    32ce:	49f2                	lw	s3,28(sp)
    32d0:	4ad2                	lw	s5,20(sp)
    32d2:	0407e793          	or	a5,a5,64
    32d6:	00f41623          	sh	a5,12(s0)
    32da:	50b2                	lw	ra,44(sp)
    32dc:	5422                	lw	s0,40(sp)
    32de:	4a62                	lw	s4,24(sp)
    32e0:	4b42                	lw	s6,16(sp)
    32e2:	557d                	li	a0,-1
    32e4:	6145                	add	sp,sp,48
    32e6:	8082                	ret
    32e8:	4501                	li	a0,0
    32ea:	8082                	ret
    32ec:	4a81                	li	s5,0
    32ee:	4501                	li	a0,0
    32f0:	4c01                	li	s8,0
    32f2:	4981                	li	s3,0
    32f4:	04098e63          	beqz	s3,3350 <__sfvwrite_r+0x246>
    32f8:	c525                	beqz	a0,3360 <__sfvwrite_r+0x256>
    32fa:	87d6                	mv	a5,s5
    32fc:	8bce                	mv	s7,s3
    32fe:	0137f363          	bgeu	a5,s3,3304 <__sfvwrite_r+0x1fa>
    3302:	8bbe                	mv	s7,a5
    3304:	4008                	lw	a0,0(s0)
    3306:	481c                	lw	a5,16(s0)
    3308:	00842903          	lw	s2,8(s0)
    330c:	4854                	lw	a3,20(s0)
    330e:	00a7f563          	bgeu	a5,a0,3318 <__sfvwrite_r+0x20e>
    3312:	9936                	add	s2,s2,a3
    3314:	05794f63          	blt	s2,s7,3372 <__sfvwrite_r+0x268>
    3318:	0edbc063          	blt	s7,a3,33f8 <__sfvwrite_r+0x2ee>
    331c:	505c                	lw	a5,36(s0)
    331e:	4c4c                	lw	a1,28(s0)
    3320:	8662                	mv	a2,s8
    3322:	8552                	mv	a0,s4
    3324:	9782                	jalr	a5
    3326:	892a                	mv	s2,a0
    3328:	f8a05de3          	blez	a0,32c2 <__sfvwrite_r+0x1b8>
    332c:	412a8ab3          	sub	s5,s5,s2
    3330:	4505                	li	a0,1
    3332:	f80a83e3          	beqz	s5,32b8 <__sfvwrite_r+0x1ae>
    3336:	008b2783          	lw	a5,8(s6)
    333a:	9c4a                	add	s8,s8,s2
    333c:	412989b3          	sub	s3,s3,s2
    3340:	412787b3          	sub	a5,a5,s2
    3344:	00fb2423          	sw	a5,8(s6)
    3348:	f7d5                	bnez	a5,32f4 <__sfvwrite_r+0x1ea>
    334a:	4bb2                	lw	s7,12(sp)
    334c:	4c22                	lw	s8,8(sp)
    334e:	bf91                	j	32a2 <__sfvwrite_r+0x198>
    3350:	0044a983          	lw	s3,4(s1)
    3354:	87a6                	mv	a5,s1
    3356:	04a1                	add	s1,s1,8
    3358:	fe098ce3          	beqz	s3,3350 <__sfvwrite_r+0x246>
    335c:	0007ac03          	lw	s8,0(a5)
    3360:	864e                	mv	a2,s3
    3362:	45a9                	li	a1,10
    3364:	8562                	mv	a0,s8
    3366:	2e19                	jal	367c <memchr>
    3368:	c961                	beqz	a0,3438 <__sfvwrite_r+0x32e>
    336a:	0505                	add	a0,a0,1
    336c:	41850ab3          	sub	s5,a0,s8
    3370:	b769                	j	32fa <__sfvwrite_r+0x1f0>
    3372:	85e2                	mv	a1,s8
    3374:	864a                	mv	a2,s2
    3376:	2159                	jal	37fc <memmove>
    3378:	401c                	lw	a5,0(s0)
    337a:	85a2                	mv	a1,s0
    337c:	8552                	mv	a0,s4
    337e:	97ca                	add	a5,a5,s2
    3380:	c01c                	sw	a5,0(s0)
    3382:	39d000ef          	jal	3f1e <_fflush_r>
    3386:	d15d                	beqz	a0,332c <__sfvwrite_r+0x222>
    3388:	bf2d                	j	32c2 <__sfvwrite_r+0x1b8>
    338a:	4814                	lw	a3,16(s0)
    338c:	02f6e863          	bltu	a3,a5,33bc <__sfvwrite_r+0x2b2>
    3390:	4850                	lw	a2,20(s0)
    3392:	02c9e563          	bltu	s3,a2,33bc <__sfvwrite_r+0x2b2>
    3396:	87ce                	mv	a5,s3
    3398:	013af363          	bgeu	s5,s3,339e <__sfvwrite_r+0x294>
    339c:	87d6                	mv	a5,s5
    339e:	02c7e6b3          	rem	a3,a5,a2
    33a2:	5058                	lw	a4,36(s0)
    33a4:	4c4c                	lw	a1,28(s0)
    33a6:	865e                	mv	a2,s7
    33a8:	8552                	mv	a0,s4
    33aa:	40d786b3          	sub	a3,a5,a3
    33ae:	9702                	jalr	a4
    33b0:	892a                	mv	s2,a0
    33b2:	02a05a63          	blez	a0,33e6 <__sfvwrite_r+0x2dc>
    33b6:	412989b3          	sub	s3,s3,s2
    33ba:	bd5d                	j	3270 <__sfvwrite_r+0x166>
    33bc:	893a                	mv	s2,a4
    33be:	00e9f363          	bgeu	s3,a4,33c4 <__sfvwrite_r+0x2ba>
    33c2:	894e                	mv	s2,s3
    33c4:	853e                	mv	a0,a5
    33c6:	864a                	mv	a2,s2
    33c8:	85de                	mv	a1,s7
    33ca:	290d                	jal	37fc <memmove>
    33cc:	4418                	lw	a4,8(s0)
    33ce:	401c                	lw	a5,0(s0)
    33d0:	41270733          	sub	a4,a4,s2
    33d4:	97ca                	add	a5,a5,s2
    33d6:	c418                	sw	a4,8(s0)
    33d8:	c01c                	sw	a5,0(s0)
    33da:	ff71                	bnez	a4,33b6 <__sfvwrite_r+0x2ac>
    33dc:	85a2                	mv	a1,s0
    33de:	8552                	mv	a0,s4
    33e0:	33f000ef          	jal	3f1e <_fflush_r>
    33e4:	d969                	beqz	a0,33b6 <__sfvwrite_r+0x2ac>
    33e6:	00c41783          	lh	a5,12(s0)
    33ea:	4bb2                	lw	s7,12(sp)
    33ec:	4c22                	lw	s8,8(sp)
    33ee:	4c92                	lw	s9,4(sp)
    33f0:	bde9                	j	32ca <__sfvwrite_r+0x1c0>
    33f2:	8c4e                	mv	s8,s3
    33f4:	8cce                	mv	s9,s3
    33f6:	b58d                	j	3258 <__sfvwrite_r+0x14e>
    33f8:	865e                	mv	a2,s7
    33fa:	85e2                	mv	a1,s8
    33fc:	2101                	jal	37fc <memmove>
    33fe:	4418                	lw	a4,8(s0)
    3400:	401c                	lw	a5,0(s0)
    3402:	895e                	mv	s2,s7
    3404:	41770733          	sub	a4,a4,s7
    3408:	97de                	add	a5,a5,s7
    340a:	c418                	sw	a4,8(s0)
    340c:	c01c                	sw	a5,0(s0)
    340e:	bf39                	j	332c <__sfvwrite_r+0x222>
    3410:	8552                	mv	a0,s4
    3412:	295d                	jal	38c8 <_realloc_r>
    3414:	8caa                	mv	s9,a0
    3416:	e20515e3          	bnez	a0,3240 <__sfvwrite_r+0x136>
    341a:	480c                	lw	a1,16(s0)
    341c:	8552                	mv	a0,s4
    341e:	88dff0ef          	jal	2caa <_free_r>
    3422:	00c41783          	lh	a5,12(s0)
    3426:	4731                	li	a4,12
    3428:	4bb2                	lw	s7,12(sp)
    342a:	4c22                	lw	s8,8(sp)
    342c:	4c92                	lw	s9,4(sp)
    342e:	00ea2023          	sw	a4,0(s4)
    3432:	f7f7f793          	and	a5,a5,-129
    3436:	bd51                	j	32ca <__sfvwrite_r+0x1c0>
    3438:	00198793          	add	a5,s3,1
    343c:	8abe                	mv	s5,a5
    343e:	bd7d                	j	32fc <__sfvwrite_r+0x1f2>
    3440:	00c41783          	lh	a5,12(s0)
    3444:	b559                	j	32ca <__sfvwrite_r+0x1c0>
    3446:	4731                	li	a4,12
    3448:	00c41783          	lh	a5,12(s0)
    344c:	4bb2                	lw	s7,12(sp)
    344e:	4c22                	lw	s8,8(sp)
    3450:	4c92                	lw	s9,4(sp)
    3452:	00ea2023          	sw	a4,0(s4)
    3456:	bd95                	j	32ca <__sfvwrite_r+0x1c0>

00003458 <_fwalk_sglue>:
    3458:	7179                	add	sp,sp,-48
    345a:	d04a                	sw	s2,32(sp)
    345c:	ce4e                	sw	s3,28(sp)
    345e:	cc52                	sw	s4,24(sp)
    3460:	ca56                	sw	s5,20(sp)
    3462:	c85a                	sw	s6,16(sp)
    3464:	c65e                	sw	s7,12(sp)
    3466:	d606                	sw	ra,44(sp)
    3468:	d422                	sw	s0,40(sp)
    346a:	d226                	sw	s1,36(sp)
    346c:	8b2a                	mv	s6,a0
    346e:	8bae                	mv	s7,a1
    3470:	8ab2                	mv	s5,a2
    3472:	4a01                	li	s4,0
    3474:	4985                	li	s3,1
    3476:	597d                	li	s2,-1
    3478:	004aa483          	lw	s1,4(s5)
    347c:	008aa403          	lw	s0,8(s5)
    3480:	14fd                	add	s1,s1,-1
    3482:	0204c463          	bltz	s1,34aa <_fwalk_sglue+0x52>
    3486:	00c45783          	lhu	a5,12(s0)
    348a:	00f9fb63          	bgeu	s3,a5,34a0 <_fwalk_sglue+0x48>
    348e:	00e41783          	lh	a5,14(s0)
    3492:	85a2                	mv	a1,s0
    3494:	855a                	mv	a0,s6
    3496:	01278563          	beq	a5,s2,34a0 <_fwalk_sglue+0x48>
    349a:	9b82                	jalr	s7
    349c:	00aa6a33          	or	s4,s4,a0
    34a0:	14fd                	add	s1,s1,-1
    34a2:	06840413          	add	s0,s0,104
    34a6:	ff2490e3          	bne	s1,s2,3486 <_fwalk_sglue+0x2e>
    34aa:	000aaa83          	lw	s5,0(s5)
    34ae:	fc0a95e3          	bnez	s5,3478 <_fwalk_sglue+0x20>
    34b2:	50b2                	lw	ra,44(sp)
    34b4:	5422                	lw	s0,40(sp)
    34b6:	5492                	lw	s1,36(sp)
    34b8:	5902                	lw	s2,32(sp)
    34ba:	49f2                	lw	s3,28(sp)
    34bc:	4ad2                	lw	s5,20(sp)
    34be:	4b42                	lw	s6,16(sp)
    34c0:	4bb2                	lw	s7,12(sp)
    34c2:	8552                	mv	a0,s4
    34c4:	4a62                	lw	s4,24(sp)
    34c6:	6145                	add	sp,sp,48
    34c8:	8082                	ret

000034ca <__sread>:
    34ca:	1141                	add	sp,sp,-16
    34cc:	c422                	sw	s0,8(sp)
    34ce:	842e                	mv	s0,a1
    34d0:	00e59583          	lh	a1,14(a1)
    34d4:	c606                	sw	ra,12(sp)
    34d6:	246d                	jal	3780 <_read_r>
    34d8:	00054963          	bltz	a0,34ea <__sread+0x20>
    34dc:	483c                	lw	a5,80(s0)
    34de:	40b2                	lw	ra,12(sp)
    34e0:	97aa                	add	a5,a5,a0
    34e2:	c83c                	sw	a5,80(s0)
    34e4:	4422                	lw	s0,8(sp)
    34e6:	0141                	add	sp,sp,16
    34e8:	8082                	ret
    34ea:	00c45783          	lhu	a5,12(s0)
    34ee:	777d                	lui	a4,0xfffff
    34f0:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffd000>
    34f2:	8ff9                	and	a5,a5,a4
    34f4:	40b2                	lw	ra,12(sp)
    34f6:	00f41623          	sh	a5,12(s0)
    34fa:	4422                	lw	s0,8(sp)
    34fc:	0141                	add	sp,sp,16
    34fe:	8082                	ret

00003500 <__swrite>:
    3500:	00c59783          	lh	a5,12(a1)
    3504:	1101                	add	sp,sp,-32
    3506:	cc22                	sw	s0,24(sp)
    3508:	ca26                	sw	s1,20(sp)
    350a:	c84a                	sw	s2,16(sp)
    350c:	c64e                	sw	s3,12(sp)
    350e:	ce06                	sw	ra,28(sp)
    3510:	1007f713          	and	a4,a5,256
    3514:	842e                	mv	s0,a1
    3516:	84aa                	mv	s1,a0
    3518:	8932                	mv	s2,a2
    351a:	89b6                	mv	s3,a3
    351c:	e315                	bnez	a4,3540 <__swrite+0x40>
    351e:	777d                	lui	a4,0xfffff
    3520:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffd000>
    3522:	8ff9                	and	a5,a5,a4
    3524:	00e41583          	lh	a1,14(s0)
    3528:	00f41623          	sh	a5,12(s0)
    352c:	4462                	lw	s0,24(sp)
    352e:	40f2                	lw	ra,28(sp)
    3530:	86ce                	mv	a3,s3
    3532:	864a                	mv	a2,s2
    3534:	49b2                	lw	s3,12(sp)
    3536:	4942                	lw	s2,16(sp)
    3538:	8526                	mv	a0,s1
    353a:	44d2                	lw	s1,20(sp)
    353c:	6105                	add	sp,sp,32
    353e:	a441                	j	37be <_write_r>
    3540:	00e59583          	lh	a1,14(a1)
    3544:	4689                	li	a3,2
    3546:	4601                	li	a2,0
    3548:	2aed                	jal	3742 <_lseek_r>
    354a:	00c41783          	lh	a5,12(s0)
    354e:	bfc1                	j	351e <__swrite+0x1e>

00003550 <__sseek>:
    3550:	1141                	add	sp,sp,-16
    3552:	c422                	sw	s0,8(sp)
    3554:	842e                	mv	s0,a1
    3556:	00e59583          	lh	a1,14(a1)
    355a:	c606                	sw	ra,12(sp)
    355c:	22dd                	jal	3742 <_lseek_r>
    355e:	57fd                	li	a5,-1
    3560:	00f50f63          	beq	a0,a5,357e <__sseek+0x2e>
    3564:	00c45783          	lhu	a5,12(s0)
    3568:	6705                	lui	a4,0x1
    356a:	40b2                	lw	ra,12(sp)
    356c:	8fd9                	or	a5,a5,a4
    356e:	07c2                	sll	a5,a5,0x10
    3570:	87c1                	sra	a5,a5,0x10
    3572:	c828                	sw	a0,80(s0)
    3574:	00f41623          	sh	a5,12(s0)
    3578:	4422                	lw	s0,8(sp)
    357a:	0141                	add	sp,sp,16
    357c:	8082                	ret
    357e:	00c45783          	lhu	a5,12(s0)
    3582:	777d                	lui	a4,0xfffff
    3584:	177d                	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7fffd000>
    3586:	8ff9                	and	a5,a5,a4
    3588:	07c2                	sll	a5,a5,0x10
    358a:	87c1                	sra	a5,a5,0x10
    358c:	40b2                	lw	ra,12(sp)
    358e:	00f41623          	sh	a5,12(s0)
    3592:	4422                	lw	s0,8(sp)
    3594:	0141                	add	sp,sp,16
    3596:	8082                	ret

00003598 <__sclose>:
    3598:	00e59583          	lh	a1,14(a1)
    359c:	a2bd                	j	370a <_close_r>

0000359e <__swsetup_r>:
    359e:	1141                	add	sp,sp,-16
    35a0:	c422                	sw	s0,8(sp)
    35a2:	c226                	sw	s1,4(sp)
    35a4:	c606                	sw	ra,12(sp)
    35a6:	7fffd797          	auipc	a5,0x7fffd
    35aa:	fa27a783          	lw	a5,-94(a5) # 80000548 <_impure_ptr>
    35ae:	84aa                	mv	s1,a0
    35b0:	842e                	mv	s0,a1
    35b2:	c399                	beqz	a5,35b8 <__swsetup_r+0x1a>
    35b4:	5bd8                	lw	a4,52(a5)
    35b6:	c75d                	beqz	a4,3664 <__swsetup_r+0xc6>
    35b8:	00c41783          	lh	a5,12(s0)
    35bc:	0087f713          	and	a4,a5,8
    35c0:	c721                	beqz	a4,3608 <__swsetup_r+0x6a>
    35c2:	4818                	lw	a4,16(s0)
    35c4:	cf31                	beqz	a4,3620 <__swsetup_r+0x82>
    35c6:	0017f693          	and	a3,a5,1
    35ca:	ce91                	beqz	a3,35e6 <__swsetup_r+0x48>
    35cc:	4854                	lw	a3,20(s0)
    35ce:	00042423          	sw	zero,8(s0)
    35d2:	4501                	li	a0,0
    35d4:	40d006b3          	neg	a3,a3
    35d8:	cc14                	sw	a3,24(s0)
    35da:	cf11                	beqz	a4,35f6 <__swsetup_r+0x58>
    35dc:	40b2                	lw	ra,12(sp)
    35de:	4422                	lw	s0,8(sp)
    35e0:	4492                	lw	s1,4(sp)
    35e2:	0141                	add	sp,sp,16
    35e4:	8082                	ret
    35e6:	0027f693          	and	a3,a5,2
    35ea:	4601                	li	a2,0
    35ec:	e291                	bnez	a3,35f0 <__swsetup_r+0x52>
    35ee:	4850                	lw	a2,20(s0)
    35f0:	c410                	sw	a2,8(s0)
    35f2:	4501                	li	a0,0
    35f4:	f765                	bnez	a4,35dc <__swsetup_r+0x3e>
    35f6:	0807f713          	and	a4,a5,128
    35fa:	d36d                	beqz	a4,35dc <__swsetup_r+0x3e>
    35fc:	0407e793          	or	a5,a5,64
    3600:	00f41623          	sh	a5,12(s0)
    3604:	557d                	li	a0,-1
    3606:	bfd9                	j	35dc <__swsetup_r+0x3e>
    3608:	0107f713          	and	a4,a5,16
    360c:	c325                	beqz	a4,366c <__swsetup_r+0xce>
    360e:	0047f713          	and	a4,a5,4
    3612:	e70d                	bnez	a4,363c <__swsetup_r+0x9e>
    3614:	4818                	lw	a4,16(s0)
    3616:	0087e793          	or	a5,a5,8
    361a:	00f41623          	sh	a5,12(s0)
    361e:	f745                	bnez	a4,35c6 <__swsetup_r+0x28>
    3620:	2807f693          	and	a3,a5,640
    3624:	20000613          	li	a2,512
    3628:	f8c68fe3          	beq	a3,a2,35c6 <__swsetup_r+0x28>
    362c:	85a2                	mv	a1,s0
    362e:	8526                	mv	a0,s1
    3630:	16d000ef          	jal	3f9c <__smakebuf_r>
    3634:	00c41783          	lh	a5,12(s0)
    3638:	4818                	lw	a4,16(s0)
    363a:	b771                	j	35c6 <__swsetup_r+0x28>
    363c:	580c                	lw	a1,48(s0)
    363e:	cd81                	beqz	a1,3656 <__swsetup_r+0xb8>
    3640:	04040713          	add	a4,s0,64
    3644:	00e58763          	beq	a1,a4,3652 <__swsetup_r+0xb4>
    3648:	8526                	mv	a0,s1
    364a:	e60ff0ef          	jal	2caa <_free_r>
    364e:	00c41783          	lh	a5,12(s0)
    3652:	02042823          	sw	zero,48(s0)
    3656:	4818                	lw	a4,16(s0)
    3658:	fdb7f793          	and	a5,a5,-37
    365c:	00042223          	sw	zero,4(s0)
    3660:	c018                	sw	a4,0(s0)
    3662:	bf55                	j	3616 <__swsetup_r+0x78>
    3664:	853e                	mv	a0,a5
    3666:	a3bff0ef          	jal	30a0 <__sinit>
    366a:	b7b9                	j	35b8 <__swsetup_r+0x1a>
    366c:	4725                	li	a4,9
    366e:	c098                	sw	a4,0(s1)
    3670:	0407e793          	or	a5,a5,64
    3674:	00f41623          	sh	a5,12(s0)
    3678:	557d                	li	a0,-1
    367a:	b78d                	j	35dc <__swsetup_r+0x3e>

0000367c <memchr>:
    367c:	00357793          	and	a5,a0,3
    3680:	0ff5f693          	zext.b	a3,a1
    3684:	c395                	beqz	a5,36a8 <memchr+0x2c>
    3686:	fff60793          	add	a5,a2,-1
    368a:	c605                	beqz	a2,36b2 <memchr+0x36>
    368c:	567d                	li	a2,-1
    368e:	a801                	j	369e <memchr+0x22>
    3690:	0505                	add	a0,a0,1
    3692:	00357713          	and	a4,a0,3
    3696:	cb11                	beqz	a4,36aa <memchr+0x2e>
    3698:	17fd                	add	a5,a5,-1
    369a:	00c78c63          	beq	a5,a2,36b2 <memchr+0x36>
    369e:	00054703          	lbu	a4,0(a0)
    36a2:	fed717e3          	bne	a4,a3,3690 <memchr+0x14>
    36a6:	8082                	ret
    36a8:	87b2                	mv	a5,a2
    36aa:	470d                	li	a4,3
    36ac:	00f76563          	bltu	a4,a5,36b6 <memchr+0x3a>
    36b0:	e3b9                	bnez	a5,36f6 <memchr+0x7a>
    36b2:	4501                	li	a0,0
    36b4:	8082                	ret
    36b6:	0ff5f593          	zext.b	a1,a1
    36ba:	00859713          	sll	a4,a1,0x8
    36be:	95ba                	add	a1,a1,a4
    36c0:	01059713          	sll	a4,a1,0x10
    36c4:	feff08b7          	lui	a7,0xfeff0
    36c8:	80808837          	lui	a6,0x80808
    36cc:	95ba                	add	a1,a1,a4
    36ce:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7efedf00>
    36d2:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x806081>
    36d6:	430d                	li	t1,3
    36d8:	a029                	j	36e2 <memchr+0x66>
    36da:	17f1                	add	a5,a5,-4
    36dc:	0511                	add	a0,a0,4
    36de:	fcf379e3          	bgeu	t1,a5,36b0 <memchr+0x34>
    36e2:	4118                	lw	a4,0(a0)
    36e4:	8f2d                	xor	a4,a4,a1
    36e6:	01170633          	add	a2,a4,a7
    36ea:	fff74713          	not	a4,a4
    36ee:	8f71                	and	a4,a4,a2
    36f0:	01077733          	and	a4,a4,a6
    36f4:	d37d                	beqz	a4,36da <memchr+0x5e>
    36f6:	97aa                	add	a5,a5,a0
    36f8:	a021                	j	3700 <memchr+0x84>
    36fa:	0505                	add	a0,a0,1
    36fc:	faa78be3          	beq	a5,a0,36b2 <memchr+0x36>
    3700:	00054703          	lbu	a4,0(a0)
    3704:	fed71be3          	bne	a4,a3,36fa <memchr+0x7e>
    3708:	8082                	ret

0000370a <_close_r>:
    370a:	1141                	add	sp,sp,-16
    370c:	c422                	sw	s0,8(sp)
    370e:	842a                	mv	s0,a0
    3710:	852e                	mv	a0,a1
    3712:	7fffd797          	auipc	a5,0x7fffd
    3716:	e607a923          	sw	zero,-398(a5) # 80000584 <errno>
    371a:	c606                	sw	ra,12(sp)
    371c:	cacfe0ef          	jal	1bc8 <_close>
    3720:	57fd                	li	a5,-1
    3722:	00f50663          	beq	a0,a5,372e <_close_r+0x24>
    3726:	40b2                	lw	ra,12(sp)
    3728:	4422                	lw	s0,8(sp)
    372a:	0141                	add	sp,sp,16
    372c:	8082                	ret
    372e:	7fffd797          	auipc	a5,0x7fffd
    3732:	e567a783          	lw	a5,-426(a5) # 80000584 <errno>
    3736:	dbe5                	beqz	a5,3726 <_close_r+0x1c>
    3738:	40b2                	lw	ra,12(sp)
    373a:	c01c                	sw	a5,0(s0)
    373c:	4422                	lw	s0,8(sp)
    373e:	0141                	add	sp,sp,16
    3740:	8082                	ret

00003742 <_lseek_r>:
    3742:	1141                	add	sp,sp,-16
    3744:	872e                	mv	a4,a1
    3746:	c422                	sw	s0,8(sp)
    3748:	85b2                	mv	a1,a2
    374a:	842a                	mv	s0,a0
    374c:	8636                	mv	a2,a3
    374e:	853a                	mv	a0,a4
    3750:	7fffd797          	auipc	a5,0x7fffd
    3754:	e207aa23          	sw	zero,-460(a5) # 80000584 <errno>
    3758:	c606                	sw	ra,12(sp)
    375a:	c7efe0ef          	jal	1bd8 <_lseek>
    375e:	57fd                	li	a5,-1
    3760:	00f50663          	beq	a0,a5,376c <_lseek_r+0x2a>
    3764:	40b2                	lw	ra,12(sp)
    3766:	4422                	lw	s0,8(sp)
    3768:	0141                	add	sp,sp,16
    376a:	8082                	ret
    376c:	7fffd797          	auipc	a5,0x7fffd
    3770:	e187a783          	lw	a5,-488(a5) # 80000584 <errno>
    3774:	dbe5                	beqz	a5,3764 <_lseek_r+0x22>
    3776:	40b2                	lw	ra,12(sp)
    3778:	c01c                	sw	a5,0(s0)
    377a:	4422                	lw	s0,8(sp)
    377c:	0141                	add	sp,sp,16
    377e:	8082                	ret

00003780 <_read_r>:
    3780:	1141                	add	sp,sp,-16
    3782:	872e                	mv	a4,a1
    3784:	c422                	sw	s0,8(sp)
    3786:	85b2                	mv	a1,a2
    3788:	842a                	mv	s0,a0
    378a:	8636                	mv	a2,a3
    378c:	853a                	mv	a0,a4
    378e:	7fffd797          	auipc	a5,0x7fffd
    3792:	de07ab23          	sw	zero,-522(a5) # 80000584 <errno>
    3796:	c606                	sw	ra,12(sp)
    3798:	c44fe0ef          	jal	1bdc <_read>
    379c:	57fd                	li	a5,-1
    379e:	00f50663          	beq	a0,a5,37aa <_read_r+0x2a>
    37a2:	40b2                	lw	ra,12(sp)
    37a4:	4422                	lw	s0,8(sp)
    37a6:	0141                	add	sp,sp,16
    37a8:	8082                	ret
    37aa:	7fffd797          	auipc	a5,0x7fffd
    37ae:	dda7a783          	lw	a5,-550(a5) # 80000584 <errno>
    37b2:	dbe5                	beqz	a5,37a2 <_read_r+0x22>
    37b4:	40b2                	lw	ra,12(sp)
    37b6:	c01c                	sw	a5,0(s0)
    37b8:	4422                	lw	s0,8(sp)
    37ba:	0141                	add	sp,sp,16
    37bc:	8082                	ret

000037be <_write_r>:
    37be:	1141                	add	sp,sp,-16
    37c0:	872e                	mv	a4,a1
    37c2:	c422                	sw	s0,8(sp)
    37c4:	85b2                	mv	a1,a2
    37c6:	842a                	mv	s0,a0
    37c8:	8636                	mv	a2,a3
    37ca:	853a                	mv	a0,a4
    37cc:	7fffd797          	auipc	a5,0x7fffd
    37d0:	da07ac23          	sw	zero,-584(a5) # 80000584 <errno>
    37d4:	c606                	sw	ra,12(sp)
    37d6:	c96fe0ef          	jal	1c6c <_write>
    37da:	57fd                	li	a5,-1
    37dc:	00f50663          	beq	a0,a5,37e8 <_write_r+0x2a>
    37e0:	40b2                	lw	ra,12(sp)
    37e2:	4422                	lw	s0,8(sp)
    37e4:	0141                	add	sp,sp,16
    37e6:	8082                	ret
    37e8:	7fffd797          	auipc	a5,0x7fffd
    37ec:	d9c7a783          	lw	a5,-612(a5) # 80000584 <errno>
    37f0:	dbe5                	beqz	a5,37e0 <_write_r+0x22>
    37f2:	40b2                	lw	ra,12(sp)
    37f4:	c01c                	sw	a5,0(s0)
    37f6:	4422                	lw	s0,8(sp)
    37f8:	0141                	add	sp,sp,16
    37fa:	8082                	ret

000037fc <memmove>:
    37fc:	02a5f263          	bgeu	a1,a0,3820 <memmove+0x24>
    3800:	00c58733          	add	a4,a1,a2
    3804:	00e57e63          	bgeu	a0,a4,3820 <memmove+0x24>
    3808:	00c507b3          	add	a5,a0,a2
    380c:	ca1d                	beqz	a2,3842 <memmove+0x46>
    380e:	fff74683          	lbu	a3,-1(a4)
    3812:	17fd                	add	a5,a5,-1
    3814:	177d                	add	a4,a4,-1
    3816:	00d78023          	sb	a3,0(a5)
    381a:	fef51ae3          	bne	a0,a5,380e <memmove+0x12>
    381e:	8082                	ret
    3820:	47bd                	li	a5,15
    3822:	02c7e163          	bltu	a5,a2,3844 <memmove+0x48>
    3826:	87aa                	mv	a5,a0
    3828:	fff60693          	add	a3,a2,-1
    382c:	ca59                	beqz	a2,38c2 <memmove+0xc6>
    382e:	0685                	add	a3,a3,1
    3830:	96be                	add	a3,a3,a5
    3832:	0005c703          	lbu	a4,0(a1)
    3836:	0785                	add	a5,a5,1
    3838:	0585                	add	a1,a1,1
    383a:	fee78fa3          	sb	a4,-1(a5)
    383e:	fed79ae3          	bne	a5,a3,3832 <memmove+0x36>
    3842:	8082                	ret
    3844:	00b567b3          	or	a5,a0,a1
    3848:	8b8d                	and	a5,a5,3
    384a:	eba5                	bnez	a5,38ba <memmove+0xbe>
    384c:	ff060893          	add	a7,a2,-16
    3850:	ff08f893          	and	a7,a7,-16
    3854:	08c1                	add	a7,a7,16
    3856:	011506b3          	add	a3,a0,a7
    385a:	872e                	mv	a4,a1
    385c:	87aa                	mv	a5,a0
    385e:	00072803          	lw	a6,0(a4)
    3862:	0741                	add	a4,a4,16
    3864:	07c1                	add	a5,a5,16
    3866:	ff07a823          	sw	a6,-16(a5)
    386a:	ff472803          	lw	a6,-12(a4)
    386e:	ff07aa23          	sw	a6,-12(a5)
    3872:	ff872803          	lw	a6,-8(a4)
    3876:	ff07ac23          	sw	a6,-8(a5)
    387a:	ffc72803          	lw	a6,-4(a4)
    387e:	ff07ae23          	sw	a6,-4(a5)
    3882:	fcd79ee3          	bne	a5,a3,385e <memmove+0x62>
    3886:	00c67813          	and	a6,a2,12
    388a:	95c6                	add	a1,a1,a7
    388c:	00f67713          	and	a4,a2,15
    3890:	02080a63          	beqz	a6,38c4 <memmove+0xc8>
    3894:	ffc70813          	add	a6,a4,-4
    3898:	ffc87813          	and	a6,a6,-4
    389c:	0811                	add	a6,a6,4
    389e:	010687b3          	add	a5,a3,a6
    38a2:	872e                	mv	a4,a1
    38a4:	00072883          	lw	a7,0(a4)
    38a8:	0691                	add	a3,a3,4
    38aa:	0711                	add	a4,a4,4
    38ac:	ff16ae23          	sw	a7,-4(a3)
    38b0:	fef69ae3          	bne	a3,a5,38a4 <memmove+0xa8>
    38b4:	8a0d                	and	a2,a2,3
    38b6:	95c2                	add	a1,a1,a6
    38b8:	bf85                	j	3828 <memmove+0x2c>
    38ba:	fff60693          	add	a3,a2,-1
    38be:	87aa                	mv	a5,a0
    38c0:	b7bd                	j	382e <memmove+0x32>
    38c2:	8082                	ret
    38c4:	863a                	mv	a2,a4
    38c6:	b78d                	j	3828 <memmove+0x2c>

000038c8 <_realloc_r>:
    38c8:	7179                	add	sp,sp,-48
    38ca:	d226                	sw	s1,36(sp)
    38cc:	d606                	sw	ra,44(sp)
    38ce:	84b2                	mv	s1,a2
    38d0:	14058e63          	beqz	a1,3a2c <_realloc_r+0x164>
    38d4:	d422                	sw	s0,40(sp)
    38d6:	d04a                	sw	s2,32(sp)
    38d8:	842e                	mv	s0,a1
    38da:	ce4e                	sw	s3,28(sp)
    38dc:	ca56                	sw	s5,20(sp)
    38de:	cc52                	sw	s4,24(sp)
    38e0:	892a                	mv	s2,a0
    38e2:	f95fe0ef          	jal	2876 <__malloc_lock>
    38e6:	ffc42703          	lw	a4,-4(s0)
    38ea:	00b48793          	add	a5,s1,11
    38ee:	46d9                	li	a3,22
    38f0:	ff840a93          	add	s5,s0,-8
    38f4:	ffc77993          	and	s3,a4,-4
    38f8:	0cf6f063          	bgeu	a3,a5,39b8 <_realloc_r+0xf0>
    38fc:	ff87fa13          	and	s4,a5,-8
    3900:	0a07cf63          	bltz	a5,39be <_realloc_r+0xf6>
    3904:	0a9a6d63          	bltu	s4,s1,39be <_realloc_r+0xf6>
    3908:	0d49d663          	bge	s3,s4,39d4 <_realloc_r+0x10c>
    390c:	c462                	sw	s8,8(sp)
    390e:	7fffcc17          	auipc	s8,0x7fffc
    3912:	6f2c0c13          	add	s8,s8,1778 # 80000000 <__malloc_av_>
    3916:	008c2603          	lw	a2,8(s8)
    391a:	013a86b3          	add	a3,s5,s3
    391e:	42dc                	lw	a5,4(a3)
    3920:	12d60e63          	beq	a2,a3,3a5c <_realloc_r+0x194>
    3924:	ffe7f613          	and	a2,a5,-2
    3928:	9636                	add	a2,a2,a3
    392a:	4250                	lw	a2,4(a2)
    392c:	8a05                	and	a2,a2,1
    392e:	e27d                	bnez	a2,3a14 <_realloc_r+0x14c>
    3930:	9bf1                	and	a5,a5,-4
    3932:	00f98633          	add	a2,s3,a5
    3936:	09465963          	bge	a2,s4,39c8 <_realloc_r+0x100>
    393a:	8b05                	and	a4,a4,1
    393c:	e70d                	bnez	a4,3966 <_realloc_r+0x9e>
    393e:	c65e                	sw	s7,12(sp)
    3940:	ff842b83          	lw	s7,-8(s0)
    3944:	c85a                	sw	s6,16(sp)
    3946:	417a8bb3          	sub	s7,s5,s7
    394a:	004ba703          	lw	a4,4(s7)
    394e:	9b71                	and	a4,a4,-4
    3950:	97ba                	add	a5,a5,a4
    3952:	01378b33          	add	s6,a5,s3
    3956:	234b5f63          	bge	s6,s4,3b94 <_realloc_r+0x2cc>
    395a:	00e98b33          	add	s6,s3,a4
    395e:	1d4b5463          	bge	s6,s4,3b26 <_realloc_r+0x25e>
    3962:	4b42                	lw	s6,16(sp)
    3964:	4bb2                	lw	s7,12(sp)
    3966:	85a6                	mv	a1,s1
    3968:	854a                	mv	a0,s2
    396a:	94ffe0ef          	jal	22b8 <_malloc_r>
    396e:	84aa                	mv	s1,a0
    3970:	2e050063          	beqz	a0,3c50 <_realloc_r+0x388>
    3974:	ffc42783          	lw	a5,-4(s0)
    3978:	ff850713          	add	a4,a0,-8
    397c:	9bf9                	and	a5,a5,-2
    397e:	97d6                	add	a5,a5,s5
    3980:	18e78d63          	beq	a5,a4,3b1a <_realloc_r+0x252>
    3984:	ffc98613          	add	a2,s3,-4
    3988:	02400793          	li	a5,36
    398c:	20c7e063          	bltu	a5,a2,3b8c <_realloc_r+0x2c4>
    3990:	474d                	li	a4,19
    3992:	16c76863          	bltu	a4,a2,3b02 <_realloc_r+0x23a>
    3996:	87aa                	mv	a5,a0
    3998:	8722                	mv	a4,s0
    399a:	4314                	lw	a3,0(a4)
    399c:	c394                	sw	a3,0(a5)
    399e:	4354                	lw	a3,4(a4)
    39a0:	c3d4                	sw	a3,4(a5)
    39a2:	4718                	lw	a4,8(a4)
    39a4:	c798                	sw	a4,8(a5)
    39a6:	85a2                	mv	a1,s0
    39a8:	854a                	mv	a0,s2
    39aa:	b00ff0ef          	jal	2caa <_free_r>
    39ae:	854a                	mv	a0,s2
    39b0:	ed1fe0ef          	jal	2880 <__malloc_unlock>
    39b4:	4c22                	lw	s8,8(sp)
    39b6:	a0a9                	j	3a00 <_realloc_r+0x138>
    39b8:	4a41                	li	s4,16
    39ba:	f49a77e3          	bgeu	s4,s1,3908 <_realloc_r+0x40>
    39be:	47b1                	li	a5,12
    39c0:	00f92023          	sw	a5,0(s2)
    39c4:	4481                	li	s1,0
    39c6:	a82d                	j	3a00 <_realloc_r+0x138>
    39c8:	46dc                	lw	a5,12(a3)
    39ca:	4698                	lw	a4,8(a3)
    39cc:	4c22                	lw	s8,8(sp)
    39ce:	89b2                	mv	s3,a2
    39d0:	c75c                	sw	a5,12(a4)
    39d2:	c798                	sw	a4,8(a5)
    39d4:	004aa783          	lw	a5,4(s5)
    39d8:	414986b3          	sub	a3,s3,s4
    39dc:	463d                	li	a2,15
    39de:	8b85                	and	a5,a5,1
    39e0:	013a8733          	add	a4,s5,s3
    39e4:	04d66a63          	bltu	a2,a3,3a38 <_realloc_r+0x170>
    39e8:	0137e7b3          	or	a5,a5,s3
    39ec:	00faa223          	sw	a5,4(s5)
    39f0:	435c                	lw	a5,4(a4)
    39f2:	0017e793          	or	a5,a5,1
    39f6:	c35c                	sw	a5,4(a4)
    39f8:	854a                	mv	a0,s2
    39fa:	e87fe0ef          	jal	2880 <__malloc_unlock>
    39fe:	84a2                	mv	s1,s0
    3a00:	5422                	lw	s0,40(sp)
    3a02:	50b2                	lw	ra,44(sp)
    3a04:	5902                	lw	s2,32(sp)
    3a06:	49f2                	lw	s3,28(sp)
    3a08:	4a62                	lw	s4,24(sp)
    3a0a:	4ad2                	lw	s5,20(sp)
    3a0c:	8526                	mv	a0,s1
    3a0e:	5492                	lw	s1,36(sp)
    3a10:	6145                	add	sp,sp,48
    3a12:	8082                	ret
    3a14:	8b05                	and	a4,a4,1
    3a16:	fb21                	bnez	a4,3966 <_realloc_r+0x9e>
    3a18:	c65e                	sw	s7,12(sp)
    3a1a:	ff842b83          	lw	s7,-8(s0)
    3a1e:	c85a                	sw	s6,16(sp)
    3a20:	417a8bb3          	sub	s7,s5,s7
    3a24:	004ba703          	lw	a4,4(s7)
    3a28:	9b71                	and	a4,a4,-4
    3a2a:	bf05                	j	395a <_realloc_r+0x92>
    3a2c:	50b2                	lw	ra,44(sp)
    3a2e:	5492                	lw	s1,36(sp)
    3a30:	85b2                	mv	a1,a2
    3a32:	6145                	add	sp,sp,48
    3a34:	885fe06f          	j	22b8 <_malloc_r>
    3a38:	0147e7b3          	or	a5,a5,s4
    3a3c:	00faa223          	sw	a5,4(s5)
    3a40:	014a85b3          	add	a1,s5,s4
    3a44:	0016e693          	or	a3,a3,1
    3a48:	c1d4                	sw	a3,4(a1)
    3a4a:	435c                	lw	a5,4(a4)
    3a4c:	05a1                	add	a1,a1,8
    3a4e:	854a                	mv	a0,s2
    3a50:	0017e793          	or	a5,a5,1
    3a54:	c35c                	sw	a5,4(a4)
    3a56:	a54ff0ef          	jal	2caa <_free_r>
    3a5a:	bf79                	j	39f8 <_realloc_r+0x130>
    3a5c:	9bf1                	and	a5,a5,-4
    3a5e:	013786b3          	add	a3,a5,s3
    3a62:	010a0613          	add	a2,s4,16
    3a66:	1ac6db63          	bge	a3,a2,3c1c <_realloc_r+0x354>
    3a6a:	8b05                	and	a4,a4,1
    3a6c:	ee071de3          	bnez	a4,3966 <_realloc_r+0x9e>
    3a70:	c65e                	sw	s7,12(sp)
    3a72:	ff842b83          	lw	s7,-8(s0)
    3a76:	c85a                	sw	s6,16(sp)
    3a78:	417a8bb3          	sub	s7,s5,s7
    3a7c:	004ba703          	lw	a4,4(s7)
    3a80:	9b71                	and	a4,a4,-4
    3a82:	97ba                	add	a5,a5,a4
    3a84:	01378b33          	add	s6,a5,s3
    3a88:	eccb49e3          	blt	s6,a2,395a <_realloc_r+0x92>
    3a8c:	00cba783          	lw	a5,12(s7)
    3a90:	008ba703          	lw	a4,8(s7)
    3a94:	ffc98613          	add	a2,s3,-4
    3a98:	02400693          	li	a3,36
    3a9c:	c75c                	sw	a5,12(a4)
    3a9e:	c798                	sw	a4,8(a5)
    3aa0:	008b8493          	add	s1,s7,8
    3aa4:	1cc6e563          	bltu	a3,a2,3c6e <_realloc_r+0x3a6>
    3aa8:	474d                	li	a4,19
    3aaa:	87a6                	mv	a5,s1
    3aac:	00c77e63          	bgeu	a4,a2,3ac8 <_realloc_r+0x200>
    3ab0:	4018                	lw	a4,0(s0)
    3ab2:	47ed                	li	a5,27
    3ab4:	00eba423          	sw	a4,8(s7)
    3ab8:	4058                	lw	a4,4(s0)
    3aba:	00eba623          	sw	a4,12(s7)
    3abe:	1ac7ed63          	bltu	a5,a2,3c78 <_realloc_r+0x3b0>
    3ac2:	0421                	add	s0,s0,8
    3ac4:	010b8793          	add	a5,s7,16
    3ac8:	4018                	lw	a4,0(s0)
    3aca:	c398                	sw	a4,0(a5)
    3acc:	4058                	lw	a4,4(s0)
    3ace:	c3d8                	sw	a4,4(a5)
    3ad0:	4418                	lw	a4,8(s0)
    3ad2:	c798                	sw	a4,8(a5)
    3ad4:	014b8733          	add	a4,s7,s4
    3ad8:	414b07b3          	sub	a5,s6,s4
    3adc:	00ec2423          	sw	a4,8(s8)
    3ae0:	0017e793          	or	a5,a5,1
    3ae4:	c35c                	sw	a5,4(a4)
    3ae6:	004ba783          	lw	a5,4(s7)
    3aea:	854a                	mv	a0,s2
    3aec:	8b85                	and	a5,a5,1
    3aee:	0147e7b3          	or	a5,a5,s4
    3af2:	00fba223          	sw	a5,4(s7)
    3af6:	d8bfe0ef          	jal	2880 <__malloc_unlock>
    3afa:	4b42                	lw	s6,16(sp)
    3afc:	4bb2                	lw	s7,12(sp)
    3afe:	4c22                	lw	s8,8(sp)
    3b00:	b701                	j	3a00 <_realloc_r+0x138>
    3b02:	4014                	lw	a3,0(s0)
    3b04:	476d                	li	a4,27
    3b06:	c114                	sw	a3,0(a0)
    3b08:	4054                	lw	a3,4(s0)
    3b0a:	c154                	sw	a3,4(a0)
    3b0c:	0ec76d63          	bltu	a4,a2,3c06 <_realloc_r+0x33e>
    3b10:	00840713          	add	a4,s0,8
    3b14:	00850793          	add	a5,a0,8
    3b18:	b549                	j	399a <_realloc_r+0xd2>
    3b1a:	ffc52783          	lw	a5,-4(a0)
    3b1e:	4c22                	lw	s8,8(sp)
    3b20:	9bf1                	and	a5,a5,-4
    3b22:	99be                	add	s3,s3,a5
    3b24:	bd45                	j	39d4 <_realloc_r+0x10c>
    3b26:	00cba783          	lw	a5,12(s7)
    3b2a:	008ba703          	lw	a4,8(s7)
    3b2e:	ffc98613          	add	a2,s3,-4
    3b32:	02400693          	li	a3,36
    3b36:	c75c                	sw	a5,12(a4)
    3b38:	c798                	sw	a4,8(a5)
    3b3a:	008b8493          	add	s1,s7,8
    3b3e:	0ac6ef63          	bltu	a3,a2,3bfc <_realloc_r+0x334>
    3b42:	474d                	li	a4,19
    3b44:	87a6                	mv	a5,s1
    3b46:	02c77663          	bgeu	a4,a2,3b72 <_realloc_r+0x2aa>
    3b4a:	4018                	lw	a4,0(s0)
    3b4c:	47ed                	li	a5,27
    3b4e:	00eba423          	sw	a4,8(s7)
    3b52:	4058                	lw	a4,4(s0)
    3b54:	00eba623          	sw	a4,12(s7)
    3b58:	0ec7f863          	bgeu	a5,a2,3c48 <_realloc_r+0x380>
    3b5c:	441c                	lw	a5,8(s0)
    3b5e:	00fba823          	sw	a5,16(s7)
    3b62:	445c                	lw	a5,12(s0)
    3b64:	00fbaa23          	sw	a5,20(s7)
    3b68:	06d60f63          	beq	a2,a3,3be6 <_realloc_r+0x31e>
    3b6c:	0441                	add	s0,s0,16
    3b6e:	018b8793          	add	a5,s7,24
    3b72:	4018                	lw	a4,0(s0)
    3b74:	c398                	sw	a4,0(a5)
    3b76:	4058                	lw	a4,4(s0)
    3b78:	c3d8                	sw	a4,4(a5)
    3b7a:	4418                	lw	a4,8(s0)
    3b7c:	c798                	sw	a4,8(a5)
    3b7e:	89da                	mv	s3,s6
    3b80:	8ade                	mv	s5,s7
    3b82:	4b42                	lw	s6,16(sp)
    3b84:	4bb2                	lw	s7,12(sp)
    3b86:	4c22                	lw	s8,8(sp)
    3b88:	8426                	mv	s0,s1
    3b8a:	b5a9                	j	39d4 <_realloc_r+0x10c>
    3b8c:	85a2                	mv	a1,s0
    3b8e:	c6fff0ef          	jal	37fc <memmove>
    3b92:	bd11                	j	39a6 <_realloc_r+0xde>
    3b94:	46dc                	lw	a5,12(a3)
    3b96:	4698                	lw	a4,8(a3)
    3b98:	ffc98613          	add	a2,s3,-4
    3b9c:	02400693          	li	a3,36
    3ba0:	c75c                	sw	a5,12(a4)
    3ba2:	c798                	sw	a4,8(a5)
    3ba4:	008ba703          	lw	a4,8(s7)
    3ba8:	00cba783          	lw	a5,12(s7)
    3bac:	008b8493          	add	s1,s7,8
    3bb0:	c75c                	sw	a5,12(a4)
    3bb2:	c798                	sw	a4,8(a5)
    3bb4:	04c6e463          	bltu	a3,a2,3bfc <_realloc_r+0x334>
    3bb8:	474d                	li	a4,19
    3bba:	87a6                	mv	a5,s1
    3bbc:	fac77be3          	bgeu	a4,a2,3b72 <_realloc_r+0x2aa>
    3bc0:	4018                	lw	a4,0(s0)
    3bc2:	47ed                	li	a5,27
    3bc4:	00eba423          	sw	a4,8(s7)
    3bc8:	4058                	lw	a4,4(s0)
    3bca:	00eba623          	sw	a4,12(s7)
    3bce:	06c7fd63          	bgeu	a5,a2,3c48 <_realloc_r+0x380>
    3bd2:	4418                	lw	a4,8(s0)
    3bd4:	02400793          	li	a5,36
    3bd8:	00eba823          	sw	a4,16(s7)
    3bdc:	4458                	lw	a4,12(s0)
    3bde:	00ebaa23          	sw	a4,20(s7)
    3be2:	f8f615e3          	bne	a2,a5,3b6c <_realloc_r+0x2a4>
    3be6:	4818                	lw	a4,16(s0)
    3be8:	020b8793          	add	a5,s7,32
    3bec:	0461                	add	s0,s0,24
    3bee:	00ebac23          	sw	a4,24(s7)
    3bf2:	ffc42703          	lw	a4,-4(s0)
    3bf6:	00ebae23          	sw	a4,28(s7)
    3bfa:	bfa5                	j	3b72 <_realloc_r+0x2aa>
    3bfc:	85a2                	mv	a1,s0
    3bfe:	8526                	mv	a0,s1
    3c00:	bfdff0ef          	jal	37fc <memmove>
    3c04:	bfad                	j	3b7e <_realloc_r+0x2b6>
    3c06:	4418                	lw	a4,8(s0)
    3c08:	c518                	sw	a4,8(a0)
    3c0a:	4458                	lw	a4,12(s0)
    3c0c:	c558                	sw	a4,12(a0)
    3c0e:	04f60763          	beq	a2,a5,3c5c <_realloc_r+0x394>
    3c12:	01040713          	add	a4,s0,16
    3c16:	01050793          	add	a5,a0,16
    3c1a:	b341                	j	399a <_realloc_r+0xd2>
    3c1c:	9ad2                	add	s5,s5,s4
    3c1e:	414687b3          	sub	a5,a3,s4
    3c22:	015c2423          	sw	s5,8(s8)
    3c26:	0017e793          	or	a5,a5,1
    3c2a:	00faa223          	sw	a5,4(s5)
    3c2e:	ffc42783          	lw	a5,-4(s0)
    3c32:	854a                	mv	a0,s2
    3c34:	84a2                	mv	s1,s0
    3c36:	8b85                	and	a5,a5,1
    3c38:	0147e7b3          	or	a5,a5,s4
    3c3c:	fef42e23          	sw	a5,-4(s0)
    3c40:	c41fe0ef          	jal	2880 <__malloc_unlock>
    3c44:	4c22                	lw	s8,8(sp)
    3c46:	bb6d                	j	3a00 <_realloc_r+0x138>
    3c48:	0421                	add	s0,s0,8
    3c4a:	010b8793          	add	a5,s7,16
    3c4e:	b715                	j	3b72 <_realloc_r+0x2aa>
    3c50:	854a                	mv	a0,s2
    3c52:	c2ffe0ef          	jal	2880 <__malloc_unlock>
    3c56:	4481                	li	s1,0
    3c58:	4c22                	lw	s8,8(sp)
    3c5a:	b35d                	j	3a00 <_realloc_r+0x138>
    3c5c:	4814                	lw	a3,16(s0)
    3c5e:	01840713          	add	a4,s0,24
    3c62:	01850793          	add	a5,a0,24
    3c66:	c914                	sw	a3,16(a0)
    3c68:	4854                	lw	a3,20(s0)
    3c6a:	c954                	sw	a3,20(a0)
    3c6c:	b33d                	j	399a <_realloc_r+0xd2>
    3c6e:	85a2                	mv	a1,s0
    3c70:	8526                	mv	a0,s1
    3c72:	b8bff0ef          	jal	37fc <memmove>
    3c76:	bdb9                	j	3ad4 <_realloc_r+0x20c>
    3c78:	441c                	lw	a5,8(s0)
    3c7a:	00fba823          	sw	a5,16(s7)
    3c7e:	445c                	lw	a5,12(s0)
    3c80:	00fbaa23          	sw	a5,20(s7)
    3c84:	00d60663          	beq	a2,a3,3c90 <_realloc_r+0x3c8>
    3c88:	0441                	add	s0,s0,16
    3c8a:	018b8793          	add	a5,s7,24
    3c8e:	bd2d                	j	3ac8 <_realloc_r+0x200>
    3c90:	4818                	lw	a4,16(s0)
    3c92:	020b8793          	add	a5,s7,32
    3c96:	00ebac23          	sw	a4,24(s7)
    3c9a:	4858                	lw	a4,20(s0)
    3c9c:	0461                	add	s0,s0,24
    3c9e:	00ebae23          	sw	a4,28(s7)
    3ca2:	b51d                	j	3ac8 <_realloc_r+0x200>

00003ca4 <_fclose_r>:
    3ca4:	1141                	add	sp,sp,-16
    3ca6:	c606                	sw	ra,12(sp)
    3ca8:	c04a                	sw	s2,0(sp)
    3caa:	c9c1                	beqz	a1,3d3a <_fclose_r+0x96>
    3cac:	c422                	sw	s0,8(sp)
    3cae:	c226                	sw	s1,4(sp)
    3cb0:	842e                	mv	s0,a1
    3cb2:	84aa                	mv	s1,a0
    3cb4:	c119                	beqz	a0,3cba <_fclose_r+0x16>
    3cb6:	595c                	lw	a5,52(a0)
    3cb8:	c3d5                	beqz	a5,3d5c <_fclose_r+0xb8>
    3cba:	507c                	lw	a5,100(s0)
    3cbc:	00c41703          	lh	a4,12(s0)
    3cc0:	8b85                	and	a5,a5,1
    3cc2:	ebad                	bnez	a5,3d34 <_fclose_r+0x90>
    3cc4:	20077713          	and	a4,a4,512
    3cc8:	cf49                	beqz	a4,3d62 <_fclose_r+0xbe>
    3cca:	85a2                	mv	a1,s0
    3ccc:	8526                	mv	a0,s1
    3cce:	2875                	jal	3d8a <__sflush_r>
    3cd0:	545c                	lw	a5,44(s0)
    3cd2:	892a                	mv	s2,a0
    3cd4:	c791                	beqz	a5,3ce0 <_fclose_r+0x3c>
    3cd6:	4c4c                	lw	a1,28(s0)
    3cd8:	8526                	mv	a0,s1
    3cda:	9782                	jalr	a5
    3cdc:	06054563          	bltz	a0,3d46 <_fclose_r+0xa2>
    3ce0:	00c45783          	lhu	a5,12(s0)
    3ce4:	0807f793          	and	a5,a5,128
    3ce8:	e7ad                	bnez	a5,3d52 <_fclose_r+0xae>
    3cea:	580c                	lw	a1,48(s0)
    3cec:	c991                	beqz	a1,3d00 <_fclose_r+0x5c>
    3cee:	04040793          	add	a5,s0,64
    3cf2:	00f58563          	beq	a1,a5,3cfc <_fclose_r+0x58>
    3cf6:	8526                	mv	a0,s1
    3cf8:	fb3fe0ef          	jal	2caa <_free_r>
    3cfc:	02042823          	sw	zero,48(s0)
    3d00:	406c                	lw	a1,68(s0)
    3d02:	c591                	beqz	a1,3d0e <_fclose_r+0x6a>
    3d04:	8526                	mv	a0,s1
    3d06:	fa5fe0ef          	jal	2caa <_free_r>
    3d0a:	04042223          	sw	zero,68(s0)
    3d0e:	be4ff0ef          	jal	30f2 <__sfp_lock_acquire>
    3d12:	507c                	lw	a5,100(s0)
    3d14:	00041623          	sh	zero,12(s0)
    3d18:	8b85                	and	a5,a5,1
    3d1a:	c7a5                	beqz	a5,3d82 <_fclose_r+0xde>
    3d1c:	4c28                	lw	a0,88(s0)
    3d1e:	c65fe0ef          	jal	2982 <__retarget_lock_close_recursive>
    3d22:	bdcff0ef          	jal	30fe <__sfp_lock_release>
    3d26:	40b2                	lw	ra,12(sp)
    3d28:	4422                	lw	s0,8(sp)
    3d2a:	4492                	lw	s1,4(sp)
    3d2c:	854a                	mv	a0,s2
    3d2e:	4902                	lw	s2,0(sp)
    3d30:	0141                	add	sp,sp,16
    3d32:	8082                	ret
    3d34:	fb59                	bnez	a4,3cca <_fclose_r+0x26>
    3d36:	4422                	lw	s0,8(sp)
    3d38:	4492                	lw	s1,4(sp)
    3d3a:	4901                	li	s2,0
    3d3c:	40b2                	lw	ra,12(sp)
    3d3e:	854a                	mv	a0,s2
    3d40:	4902                	lw	s2,0(sp)
    3d42:	0141                	add	sp,sp,16
    3d44:	8082                	ret
    3d46:	00c45783          	lhu	a5,12(s0)
    3d4a:	597d                	li	s2,-1
    3d4c:	0807f793          	and	a5,a5,128
    3d50:	dfc9                	beqz	a5,3cea <_fclose_r+0x46>
    3d52:	480c                	lw	a1,16(s0)
    3d54:	8526                	mv	a0,s1
    3d56:	f55fe0ef          	jal	2caa <_free_r>
    3d5a:	bf41                	j	3cea <_fclose_r+0x46>
    3d5c:	b44ff0ef          	jal	30a0 <__sinit>
    3d60:	bfa9                	j	3cba <_fclose_r+0x16>
    3d62:	4c28                	lw	a0,88(s0)
    3d64:	c21fe0ef          	jal	2984 <__retarget_lock_acquire_recursive>
    3d68:	00c41783          	lh	a5,12(s0)
    3d6c:	ffb9                	bnez	a5,3cca <_fclose_r+0x26>
    3d6e:	507c                	lw	a5,100(s0)
    3d70:	8b85                	and	a5,a5,1
    3d72:	f3f1                	bnez	a5,3d36 <_fclose_r+0x92>
    3d74:	4c28                	lw	a0,88(s0)
    3d76:	4901                	li	s2,0
    3d78:	c0ffe0ef          	jal	2986 <__retarget_lock_release_recursive>
    3d7c:	4422                	lw	s0,8(sp)
    3d7e:	4492                	lw	s1,4(sp)
    3d80:	bf75                	j	3d3c <_fclose_r+0x98>
    3d82:	4c28                	lw	a0,88(s0)
    3d84:	c03fe0ef          	jal	2986 <__retarget_lock_release_recursive>
    3d88:	bf51                	j	3d1c <_fclose_r+0x78>

00003d8a <__sflush_r>:
    3d8a:	00c59703          	lh	a4,12(a1)
    3d8e:	1101                	add	sp,sp,-32
    3d90:	cc22                	sw	s0,24(sp)
    3d92:	c64e                	sw	s3,12(sp)
    3d94:	ce06                	sw	ra,28(sp)
    3d96:	00877793          	and	a5,a4,8
    3d9a:	842e                	mv	s0,a1
    3d9c:	89aa                	mv	s3,a0
    3d9e:	e7e1                	bnez	a5,3e66 <__sflush_r+0xdc>
    3da0:	6785                	lui	a5,0x1
    3da2:	80078793          	add	a5,a5,-2048 # 800 <main+0x162>
    3da6:	41d4                	lw	a3,4(a1)
    3da8:	8fd9                	or	a5,a5,a4
    3daa:	00f59623          	sh	a5,12(a1)
    3dae:	10d05563          	blez	a3,3eb8 <__sflush_r+0x12e>
    3db2:	02842803          	lw	a6,40(s0)
    3db6:	0a080263          	beqz	a6,3e5a <__sflush_r+0xd0>
    3dba:	ca26                	sw	s1,20(sp)
    3dbc:	01371693          	sll	a3,a4,0x13
    3dc0:	0009a483          	lw	s1,0(s3)
    3dc4:	0009a023          	sw	zero,0(s3)
    3dc8:	4c4c                	lw	a1,28(s0)
    3dca:	0e06ce63          	bltz	a3,3ec6 <__sflush_r+0x13c>
    3dce:	4601                	li	a2,0
    3dd0:	4685                	li	a3,1
    3dd2:	854e                	mv	a0,s3
    3dd4:	9802                	jalr	a6
    3dd6:	57fd                	li	a5,-1
    3dd8:	862a                	mv	a2,a0
    3dda:	10f50f63          	beq	a0,a5,3ef8 <__sflush_r+0x16e>
    3dde:	00c41783          	lh	a5,12(s0)
    3de2:	02842803          	lw	a6,40(s0)
    3de6:	4c4c                	lw	a1,28(s0)
    3de8:	8b91                	and	a5,a5,4
    3dea:	c799                	beqz	a5,3df8 <__sflush_r+0x6e>
    3dec:	4058                	lw	a4,4(s0)
    3dee:	581c                	lw	a5,48(s0)
    3df0:	8e19                	sub	a2,a2,a4
    3df2:	c399                	beqz	a5,3df8 <__sflush_r+0x6e>
    3df4:	5c5c                	lw	a5,60(s0)
    3df6:	8e1d                	sub	a2,a2,a5
    3df8:	4681                	li	a3,0
    3dfa:	854e                	mv	a0,s3
    3dfc:	9802                	jalr	a6
    3dfe:	57fd                	li	a5,-1
    3e00:	0cf51563          	bne	a0,a5,3eca <__sflush_r+0x140>
    3e04:	0009a683          	lw	a3,0(s3)
    3e08:	47f5                	li	a5,29
    3e0a:	00c41703          	lh	a4,12(s0)
    3e0e:	10d7e163          	bltu	a5,a3,3f10 <__sflush_r+0x186>
    3e12:	204007b7          	lui	a5,0x20400
    3e16:	0785                	add	a5,a5,1 # 20400001 <__neorv32_rom_size+0x203e0001>
    3e18:	00d7d7b3          	srl	a5,a5,a3
    3e1c:	8b85                	and	a5,a5,1
    3e1e:	cbed                	beqz	a5,3f10 <__sflush_r+0x186>
    3e20:	4810                	lw	a2,16(s0)
    3e22:	77fd                	lui	a5,0xfffff
    3e24:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7fffd800>
    3e28:	8ff9                	and	a5,a5,a4
    3e2a:	00f41623          	sh	a5,12(s0)
    3e2e:	00042223          	sw	zero,4(s0)
    3e32:	c010                	sw	a2,0(s0)
    3e34:	01371793          	sll	a5,a4,0x13
    3e38:	0007d363          	bgez	a5,3e3e <__sflush_r+0xb4>
    3e3c:	c6dd                	beqz	a3,3eea <__sflush_r+0x160>
    3e3e:	580c                	lw	a1,48(s0)
    3e40:	0099a023          	sw	s1,0(s3)
    3e44:	c9c5                	beqz	a1,3ef4 <__sflush_r+0x16a>
    3e46:	04040793          	add	a5,s0,64
    3e4a:	00f58563          	beq	a1,a5,3e54 <__sflush_r+0xca>
    3e4e:	854e                	mv	a0,s3
    3e50:	e5bfe0ef          	jal	2caa <_free_r>
    3e54:	44d2                	lw	s1,20(sp)
    3e56:	02042823          	sw	zero,48(s0)
    3e5a:	4501                	li	a0,0
    3e5c:	40f2                	lw	ra,28(sp)
    3e5e:	4462                	lw	s0,24(sp)
    3e60:	49b2                	lw	s3,12(sp)
    3e62:	6105                	add	sp,sp,32
    3e64:	8082                	ret
    3e66:	c84a                	sw	s2,16(sp)
    3e68:	0105a903          	lw	s2,16(a1)
    3e6c:	04090b63          	beqz	s2,3ec2 <__sflush_r+0x138>
    3e70:	ca26                	sw	s1,20(sp)
    3e72:	4184                	lw	s1,0(a1)
    3e74:	8b0d                	and	a4,a4,3
    3e76:	0125a023          	sw	s2,0(a1)
    3e7a:	412484b3          	sub	s1,s1,s2
    3e7e:	4781                	li	a5,0
    3e80:	e311                	bnez	a4,3e84 <__sflush_r+0xfa>
    3e82:	49dc                	lw	a5,20(a1)
    3e84:	c41c                	sw	a5,8(s0)
    3e86:	00904663          	bgtz	s1,3e92 <__sflush_r+0x108>
    3e8a:	a81d                	j	3ec0 <__sflush_r+0x136>
    3e8c:	992a                	add	s2,s2,a0
    3e8e:	02905963          	blez	s1,3ec0 <__sflush_r+0x136>
    3e92:	505c                	lw	a5,36(s0)
    3e94:	4c4c                	lw	a1,28(s0)
    3e96:	86a6                	mv	a3,s1
    3e98:	864a                	mv	a2,s2
    3e9a:	854e                	mv	a0,s3
    3e9c:	9782                	jalr	a5
    3e9e:	8c89                	sub	s1,s1,a0
    3ea0:	fea046e3          	bgtz	a0,3e8c <__sflush_r+0x102>
    3ea4:	00c41703          	lh	a4,12(s0)
    3ea8:	4942                	lw	s2,16(sp)
    3eaa:	04076713          	or	a4,a4,64
    3eae:	44d2                	lw	s1,20(sp)
    3eb0:	00e41623          	sh	a4,12(s0)
    3eb4:	557d                	li	a0,-1
    3eb6:	b75d                	j	3e5c <__sflush_r+0xd2>
    3eb8:	5dd4                	lw	a3,60(a1)
    3eba:	eed04ce3          	bgtz	a3,3db2 <__sflush_r+0x28>
    3ebe:	bf71                	j	3e5a <__sflush_r+0xd0>
    3ec0:	44d2                	lw	s1,20(sp)
    3ec2:	4942                	lw	s2,16(sp)
    3ec4:	bf59                	j	3e5a <__sflush_r+0xd0>
    3ec6:	4830                	lw	a2,80(s0)
    3ec8:	b705                	j	3de8 <__sflush_r+0x5e>
    3eca:	00c41703          	lh	a4,12(s0)
    3ece:	4814                	lw	a3,16(s0)
    3ed0:	77fd                	lui	a5,0xfffff
    3ed2:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7fffd800>
    3ed6:	8ff9                	and	a5,a5,a4
    3ed8:	00f41623          	sh	a5,12(s0)
    3edc:	00042223          	sw	zero,4(s0)
    3ee0:	c014                	sw	a3,0(s0)
    3ee2:	01371793          	sll	a5,a4,0x13
    3ee6:	f407dce3          	bgez	a5,3e3e <__sflush_r+0xb4>
    3eea:	580c                	lw	a1,48(s0)
    3eec:	c828                	sw	a0,80(s0)
    3eee:	0099a023          	sw	s1,0(s3)
    3ef2:	f9b1                	bnez	a1,3e46 <__sflush_r+0xbc>
    3ef4:	44d2                	lw	s1,20(sp)
    3ef6:	b795                	j	3e5a <__sflush_r+0xd0>
    3ef8:	0009a783          	lw	a5,0(s3)
    3efc:	ee0781e3          	beqz	a5,3dde <__sflush_r+0x54>
    3f00:	4775                	li	a4,29
    3f02:	00e78a63          	beq	a5,a4,3f16 <__sflush_r+0x18c>
    3f06:	4759                	li	a4,22
    3f08:	00e78763          	beq	a5,a4,3f16 <__sflush_r+0x18c>
    3f0c:	00c41703          	lh	a4,12(s0)
    3f10:	04076713          	or	a4,a4,64
    3f14:	bf69                	j	3eae <__sflush_r+0x124>
    3f16:	0099a023          	sw	s1,0(s3)
    3f1a:	44d2                	lw	s1,20(sp)
    3f1c:	bf3d                	j	3e5a <__sflush_r+0xd0>

00003f1e <_fflush_r>:
    3f1e:	1141                	add	sp,sp,-16
    3f20:	c422                	sw	s0,8(sp)
    3f22:	c226                	sw	s1,4(sp)
    3f24:	c606                	sw	ra,12(sp)
    3f26:	c04a                	sw	s2,0(sp)
    3f28:	84aa                	mv	s1,a0
    3f2a:	842e                	mv	s0,a1
    3f2c:	c119                	beqz	a0,3f32 <_fflush_r+0x14>
    3f2e:	595c                	lw	a5,52(a0)
    3f30:	c3bd                	beqz	a5,3f96 <_fflush_r+0x78>
    3f32:	00c41783          	lh	a5,12(s0)
    3f36:	4901                	li	s2,0
    3f38:	c39d                	beqz	a5,3f5e <_fflush_r+0x40>
    3f3a:	5078                	lw	a4,100(s0)
    3f3c:	8b05                	and	a4,a4,1
    3f3e:	e701                	bnez	a4,3f46 <_fflush_r+0x28>
    3f40:	2007f793          	and	a5,a5,512
    3f44:	c785                	beqz	a5,3f6c <_fflush_r+0x4e>
    3f46:	85a2                	mv	a1,s0
    3f48:	8526                	mv	a0,s1
    3f4a:	3581                	jal	3d8a <__sflush_r>
    3f4c:	507c                	lw	a5,100(s0)
    3f4e:	892a                	mv	s2,a0
    3f50:	8b85                	and	a5,a5,1
    3f52:	e791                	bnez	a5,3f5e <_fflush_r+0x40>
    3f54:	00c45783          	lhu	a5,12(s0)
    3f58:	2007f793          	and	a5,a5,512
    3f5c:	c39d                	beqz	a5,3f82 <_fflush_r+0x64>
    3f5e:	40b2                	lw	ra,12(sp)
    3f60:	4422                	lw	s0,8(sp)
    3f62:	4492                	lw	s1,4(sp)
    3f64:	854a                	mv	a0,s2
    3f66:	4902                	lw	s2,0(sp)
    3f68:	0141                	add	sp,sp,16
    3f6a:	8082                	ret
    3f6c:	4c28                	lw	a0,88(s0)
    3f6e:	a17fe0ef          	jal	2984 <__retarget_lock_acquire_recursive>
    3f72:	85a2                	mv	a1,s0
    3f74:	8526                	mv	a0,s1
    3f76:	3d11                	jal	3d8a <__sflush_r>
    3f78:	507c                	lw	a5,100(s0)
    3f7a:	892a                	mv	s2,a0
    3f7c:	8b85                	and	a5,a5,1
    3f7e:	f3e5                	bnez	a5,3f5e <_fflush_r+0x40>
    3f80:	bfd1                	j	3f54 <_fflush_r+0x36>
    3f82:	4c28                	lw	a0,88(s0)
    3f84:	a03fe0ef          	jal	2986 <__retarget_lock_release_recursive>
    3f88:	40b2                	lw	ra,12(sp)
    3f8a:	4422                	lw	s0,8(sp)
    3f8c:	4492                	lw	s1,4(sp)
    3f8e:	854a                	mv	a0,s2
    3f90:	4902                	lw	s2,0(sp)
    3f92:	0141                	add	sp,sp,16
    3f94:	8082                	ret
    3f96:	90aff0ef          	jal	30a0 <__sinit>
    3f9a:	bf61                	j	3f32 <_fflush_r+0x14>

00003f9c <__smakebuf_r>:
    3f9c:	00c59783          	lh	a5,12(a1)
    3fa0:	7119                	add	sp,sp,-128
    3fa2:	dca2                	sw	s0,120(sp)
    3fa4:	de86                	sw	ra,124(sp)
    3fa6:	0027f713          	and	a4,a5,2
    3faa:	842e                	mv	s0,a1
    3fac:	cb19                	beqz	a4,3fc2 <__smakebuf_r+0x26>
    3fae:	04358793          	add	a5,a1,67
    3fb2:	c19c                	sw	a5,0(a1)
    3fb4:	c99c                	sw	a5,16(a1)
    3fb6:	4785                	li	a5,1
    3fb8:	c9dc                	sw	a5,20(a1)
    3fba:	50f6                	lw	ra,124(sp)
    3fbc:	5466                	lw	s0,120(sp)
    3fbe:	6109                	add	sp,sp,128
    3fc0:	8082                	ret
    3fc2:	00e59583          	lh	a1,14(a1)
    3fc6:	daa6                	sw	s1,116(sp)
    3fc8:	d8ca                	sw	s2,112(sp)
    3fca:	d6ce                	sw	s3,108(sp)
    3fcc:	d4d2                	sw	s4,104(sp)
    3fce:	84aa                	mv	s1,a0
    3fd0:	0605c263          	bltz	a1,4034 <__smakebuf_r+0x98>
    3fd4:	0030                	add	a2,sp,8
    3fd6:	28c9                	jal	40a8 <_fstat_r>
    3fd8:	04054c63          	bltz	a0,4030 <__smakebuf_r+0x94>
    3fdc:	47b2                	lw	a5,12(sp)
    3fde:	693d                	lui	s2,0xf
    3fe0:	6985                	lui	s3,0x1
    3fe2:	00f97933          	and	s2,s2,a5
    3fe6:	77f9                	lui	a5,0xffffe
    3fe8:	993e                	add	s2,s2,a5
    3fea:	00193913          	seqz	s2,s2
    3fee:	40000a13          	li	s4,1024
    3ff2:	80098993          	add	s3,s3,-2048 # 800 <main+0x162>
    3ff6:	85d2                	mv	a1,s4
    3ff8:	8526                	mv	a0,s1
    3ffa:	abefe0ef          	jal	22b8 <_malloc_r>
    3ffe:	00c41783          	lh	a5,12(s0)
    4002:	c539                	beqz	a0,4050 <__smakebuf_r+0xb4>
    4004:	0807e793          	or	a5,a5,128
    4008:	c008                	sw	a0,0(s0)
    400a:	c808                	sw	a0,16(s0)
    400c:	00f41623          	sh	a5,12(s0)
    4010:	01442a23          	sw	s4,20(s0)
    4014:	06091563          	bnez	s2,407e <__smakebuf_r+0xe2>
    4018:	0137e7b3          	or	a5,a5,s3
    401c:	50f6                	lw	ra,124(sp)
    401e:	00f41623          	sh	a5,12(s0)
    4022:	5466                	lw	s0,120(sp)
    4024:	54d6                	lw	s1,116(sp)
    4026:	5946                	lw	s2,112(sp)
    4028:	59b6                	lw	s3,108(sp)
    402a:	5a26                	lw	s4,104(sp)
    402c:	6109                	add	sp,sp,128
    402e:	8082                	ret
    4030:	00c41783          	lh	a5,12(s0)
    4034:	0807f793          	and	a5,a5,128
    4038:	4901                	li	s2,0
    403a:	cf95                	beqz	a5,4076 <__smakebuf_r+0xda>
    403c:	04000a13          	li	s4,64
    4040:	85d2                	mv	a1,s4
    4042:	8526                	mv	a0,s1
    4044:	a74fe0ef          	jal	22b8 <_malloc_r>
    4048:	00c41783          	lh	a5,12(s0)
    404c:	4981                	li	s3,0
    404e:	f95d                	bnez	a0,4004 <__smakebuf_r+0x68>
    4050:	2007f713          	and	a4,a5,512
    4054:	ef0d                	bnez	a4,408e <__smakebuf_r+0xf2>
    4056:	9bf1                	and	a5,a5,-4
    4058:	0027e793          	or	a5,a5,2
    405c:	04340713          	add	a4,s0,67
    4060:	00f41623          	sh	a5,12(s0)
    4064:	4785                	li	a5,1
    4066:	54d6                	lw	s1,116(sp)
    4068:	5946                	lw	s2,112(sp)
    406a:	59b6                	lw	s3,108(sp)
    406c:	5a26                	lw	s4,104(sp)
    406e:	c018                	sw	a4,0(s0)
    4070:	c818                	sw	a4,16(s0)
    4072:	c85c                	sw	a5,20(s0)
    4074:	b799                	j	3fba <__smakebuf_r+0x1e>
    4076:	40000a13          	li	s4,1024
    407a:	4981                	li	s3,0
    407c:	bfad                	j	3ff6 <__smakebuf_r+0x5a>
    407e:	00e41583          	lh	a1,14(s0)
    4082:	8526                	mv	a0,s1
    4084:	2085                	jal	40e4 <_isatty_r>
    4086:	e909                	bnez	a0,4098 <__smakebuf_r+0xfc>
    4088:	00c41783          	lh	a5,12(s0)
    408c:	b771                	j	4018 <__smakebuf_r+0x7c>
    408e:	54d6                	lw	s1,116(sp)
    4090:	5946                	lw	s2,112(sp)
    4092:	59b6                	lw	s3,108(sp)
    4094:	5a26                	lw	s4,104(sp)
    4096:	b715                	j	3fba <__smakebuf_r+0x1e>
    4098:	00c45783          	lhu	a5,12(s0)
    409c:	9bf1                	and	a5,a5,-4
    409e:	0017e793          	or	a5,a5,1
    40a2:	07c2                	sll	a5,a5,0x10
    40a4:	87c1                	sra	a5,a5,0x10
    40a6:	bf8d                	j	4018 <__smakebuf_r+0x7c>

000040a8 <_fstat_r>:
    40a8:	1141                	add	sp,sp,-16
    40aa:	872e                	mv	a4,a1
    40ac:	c422                	sw	s0,8(sp)
    40ae:	85b2                	mv	a1,a2
    40b0:	842a                	mv	s0,a0
    40b2:	853a                	mv	a0,a4
    40b4:	7fffc797          	auipc	a5,0x7fffc
    40b8:	4c07a823          	sw	zero,1232(a5) # 80000584 <errno>
    40bc:	c606                	sw	ra,12(sp)
    40be:	b0ffd0ef          	jal	1bcc <_fstat>
    40c2:	57fd                	li	a5,-1
    40c4:	00f50663          	beq	a0,a5,40d0 <_fstat_r+0x28>
    40c8:	40b2                	lw	ra,12(sp)
    40ca:	4422                	lw	s0,8(sp)
    40cc:	0141                	add	sp,sp,16
    40ce:	8082                	ret
    40d0:	7fffc797          	auipc	a5,0x7fffc
    40d4:	4b47a783          	lw	a5,1204(a5) # 80000584 <errno>
    40d8:	dbe5                	beqz	a5,40c8 <_fstat_r+0x20>
    40da:	40b2                	lw	ra,12(sp)
    40dc:	c01c                	sw	a5,0(s0)
    40de:	4422                	lw	s0,8(sp)
    40e0:	0141                	add	sp,sp,16
    40e2:	8082                	ret

000040e4 <_isatty_r>:
    40e4:	1141                	add	sp,sp,-16
    40e6:	c422                	sw	s0,8(sp)
    40e8:	842a                	mv	s0,a0
    40ea:	852e                	mv	a0,a1
    40ec:	7fffc797          	auipc	a5,0x7fffc
    40f0:	4807ac23          	sw	zero,1176(a5) # 80000584 <errno>
    40f4:	c606                	sw	ra,12(sp)
    40f6:	adffd0ef          	jal	1bd4 <_isatty>
    40fa:	57fd                	li	a5,-1
    40fc:	00f50663          	beq	a0,a5,4108 <_isatty_r+0x24>
    4100:	40b2                	lw	ra,12(sp)
    4102:	4422                	lw	s0,8(sp)
    4104:	0141                	add	sp,sp,16
    4106:	8082                	ret
    4108:	7fffc797          	auipc	a5,0x7fffc
    410c:	47c7a783          	lw	a5,1148(a5) # 80000584 <errno>
    4110:	dbe5                	beqz	a5,4100 <_isatty_r+0x1c>
    4112:	40b2                	lw	ra,12(sp)
    4114:	c01c                	sw	a5,0(s0)
    4116:	4422                	lw	s0,8(sp)
    4118:	0141                	add	sp,sp,16
    411a:	8082                	ret

0000411c <__udivdi3>:
    411c:	8832                	mv	a6,a2
    411e:	88aa                	mv	a7,a0
    4120:	872e                	mv	a4,a1
    4122:	ead5                	bnez	a3,41d6 <__udivdi3+0xba>
    4124:	0ec5ff63          	bgeu	a1,a2,4222 <__udivdi3+0x106>
    4128:	67c1                	lui	a5,0x10
    412a:	18f66c63          	bltu	a2,a5,42c2 <__udivdi3+0x1a6>
    412e:	010007b7          	lui	a5,0x1000
    4132:	46e1                	li	a3,24
    4134:	00f67363          	bgeu	a2,a5,413a <__udivdi3+0x1e>
    4138:	46c1                	li	a3,16
    413a:	00d65333          	srl	t1,a2,a3
    413e:	00001797          	auipc	a5,0x1
    4142:	ade78793          	add	a5,a5,-1314 # 4c1c <__clz_tab>
    4146:	979a                	add	a5,a5,t1
    4148:	0007c783          	lbu	a5,0(a5)
    414c:	02000313          	li	t1,32
    4150:	97b6                	add	a5,a5,a3
    4152:	40f306b3          	sub	a3,t1,a5
    4156:	00f30b63          	beq	t1,a5,416c <__udivdi3+0x50>
    415a:	00d59733          	sll	a4,a1,a3
    415e:	00f557b3          	srl	a5,a0,a5
    4162:	00d61833          	sll	a6,a2,a3
    4166:	8f5d                	or	a4,a4,a5
    4168:	00d518b3          	sll	a7,a0,a3
    416c:	01085613          	srl	a2,a6,0x10
    4170:	02c75533          	divu	a0,a4,a2
    4174:	01081693          	sll	a3,a6,0x10
    4178:	82c1                	srl	a3,a3,0x10
    417a:	0108d793          	srl	a5,a7,0x10
    417e:	02c77733          	remu	a4,a4,a2
    4182:	02a685b3          	mul	a1,a3,a0
    4186:	0742                	sll	a4,a4,0x10
    4188:	8fd9                	or	a5,a5,a4
    418a:	00b7fa63          	bgeu	a5,a1,419e <__udivdi3+0x82>
    418e:	97c2                	add	a5,a5,a6
    4190:	fff50713          	add	a4,a0,-1
    4194:	0107e463          	bltu	a5,a6,419c <__udivdi3+0x80>
    4198:	30b7ef63          	bltu	a5,a1,44b6 <__udivdi3+0x39a>
    419c:	853a                	mv	a0,a4
    419e:	8f8d                	sub	a5,a5,a1
    41a0:	02c7d733          	divu	a4,a5,a2
    41a4:	08c2                	sll	a7,a7,0x10
    41a6:	0108d893          	srl	a7,a7,0x10
    41aa:	02c7f7b3          	remu	a5,a5,a2
    41ae:	02e686b3          	mul	a3,a3,a4
    41b2:	07c2                	sll	a5,a5,0x10
    41b4:	00f8e8b3          	or	a7,a7,a5
    41b8:	00d8fb63          	bgeu	a7,a3,41ce <__udivdi3+0xb2>
    41bc:	98c2                	add	a7,a7,a6
    41be:	fff70793          	add	a5,a4,-1
    41c2:	0108e563          	bltu	a7,a6,41cc <__udivdi3+0xb0>
    41c6:	1779                	add	a4,a4,-2
    41c8:	00d8e363          	bltu	a7,a3,41ce <__udivdi3+0xb2>
    41cc:	873e                	mv	a4,a5
    41ce:	0542                	sll	a0,a0,0x10
    41d0:	8d59                	or	a0,a0,a4
    41d2:	4581                	li	a1,0
    41d4:	8082                	ret
    41d6:	00d5f563          	bgeu	a1,a3,41e0 <__udivdi3+0xc4>
    41da:	4581                	li	a1,0
    41dc:	4501                	li	a0,0
    41de:	8082                	ret
    41e0:	67c1                	lui	a5,0x10
    41e2:	18f6e863          	bltu	a3,a5,4372 <__udivdi3+0x256>
    41e6:	01000737          	lui	a4,0x1000
    41ea:	47e1                	li	a5,24
    41ec:	00e6f363          	bgeu	a3,a4,41f2 <__udivdi3+0xd6>
    41f0:	47c1                	li	a5,16
    41f2:	00f6d833          	srl	a6,a3,a5
    41f6:	00001717          	auipc	a4,0x1
    41fa:	a2670713          	add	a4,a4,-1498 # 4c1c <__clz_tab>
    41fe:	9742                	add	a4,a4,a6
    4200:	00074703          	lbu	a4,0(a4)
    4204:	02000893          	li	a7,32
    4208:	973e                	add	a4,a4,a5
    420a:	40e88833          	sub	a6,a7,a4
    420e:	18e89763          	bne	a7,a4,439c <__udivdi3+0x280>
    4212:	28b6e463          	bltu	a3,a1,449a <__udivdi3+0x37e>
    4216:	00c53533          	sltu	a0,a0,a2
    421a:	00153513          	seqz	a0,a0
    421e:	4581                	li	a1,0
    4220:	8082                	ret
    4222:	c655                	beqz	a2,42ce <__udivdi3+0x1b2>
    4224:	67c1                	lui	a5,0x10
    4226:	26f67263          	bgeu	a2,a5,448a <__udivdi3+0x36e>
    422a:	10063713          	sltiu	a4,a2,256
    422e:	00173713          	seqz	a4,a4
    4232:	070e                	sll	a4,a4,0x3
    4234:	00e656b3          	srl	a3,a2,a4
    4238:	00001797          	auipc	a5,0x1
    423c:	9e478793          	add	a5,a5,-1564 # 4c1c <__clz_tab>
    4240:	97b6                	add	a5,a5,a3
    4242:	0007c783          	lbu	a5,0(a5)
    4246:	02000693          	li	a3,32
    424a:	97ba                	add	a5,a5,a4
    424c:	40f68eb3          	sub	t4,a3,a5
    4250:	08f69f63          	bne	a3,a5,42ee <__udivdi3+0x1d2>
    4254:	40c587b3          	sub	a5,a1,a2
    4258:	01065693          	srl	a3,a2,0x10
    425c:	0642                	sll	a2,a2,0x10
    425e:	8241                	srl	a2,a2,0x10
    4260:	4585                	li	a1,1
    4262:	02d7d533          	divu	a0,a5,a3
    4266:	0108d713          	srl	a4,a7,0x10
    426a:	02d7f7b3          	remu	a5,a5,a3
    426e:	02c50333          	mul	t1,a0,a2
    4272:	07c2                	sll	a5,a5,0x10
    4274:	8fd9                	or	a5,a5,a4
    4276:	0067fa63          	bgeu	a5,t1,428a <__udivdi3+0x16e>
    427a:	97c2                	add	a5,a5,a6
    427c:	fff50713          	add	a4,a0,-1
    4280:	0107e463          	bltu	a5,a6,4288 <__udivdi3+0x16c>
    4284:	2267e663          	bltu	a5,t1,44b0 <__udivdi3+0x394>
    4288:	853a                	mv	a0,a4
    428a:	406787b3          	sub	a5,a5,t1
    428e:	02d7d733          	divu	a4,a5,a3
    4292:	08c2                	sll	a7,a7,0x10
    4294:	0108d893          	srl	a7,a7,0x10
    4298:	02d7f7b3          	remu	a5,a5,a3
    429c:	02c70633          	mul	a2,a4,a2
    42a0:	07c2                	sll	a5,a5,0x10
    42a2:	00f8e8b3          	or	a7,a7,a5
    42a6:	00c8fb63          	bgeu	a7,a2,42bc <__udivdi3+0x1a0>
    42aa:	98c2                	add	a7,a7,a6
    42ac:	fff70793          	add	a5,a4,-1
    42b0:	0108e563          	bltu	a7,a6,42ba <__udivdi3+0x19e>
    42b4:	1779                	add	a4,a4,-2
    42b6:	00c8e363          	bltu	a7,a2,42bc <__udivdi3+0x1a0>
    42ba:	873e                	mv	a4,a5
    42bc:	0542                	sll	a0,a0,0x10
    42be:	8d59                	or	a0,a0,a4
    42c0:	8082                	ret
    42c2:	10063693          	sltiu	a3,a2,256
    42c6:	0016b693          	seqz	a3,a3
    42ca:	068e                	sll	a3,a3,0x3
    42cc:	b5bd                	j	413a <__udivdi3+0x1e>
    42ce:	4681                	li	a3,0
    42d0:	00001797          	auipc	a5,0x1
    42d4:	94c78793          	add	a5,a5,-1716 # 4c1c <__clz_tab>
    42d8:	97b6                	add	a5,a5,a3
    42da:	0007c783          	lbu	a5,0(a5)
    42de:	4701                	li	a4,0
    42e0:	02000693          	li	a3,32
    42e4:	97ba                	add	a5,a5,a4
    42e6:	40f68eb3          	sub	t4,a3,a5
    42ea:	f6f685e3          	beq	a3,a5,4254 <__udivdi3+0x138>
    42ee:	01d61833          	sll	a6,a2,t4
    42f2:	00f5d333          	srl	t1,a1,a5
    42f6:	01085693          	srl	a3,a6,0x10
    42fa:	02d35e33          	divu	t3,t1,a3
    42fe:	01081613          	sll	a2,a6,0x10
    4302:	01d595b3          	sll	a1,a1,t4
    4306:	8241                	srl	a2,a2,0x10
    4308:	00f557b3          	srl	a5,a0,a5
    430c:	8fcd                	or	a5,a5,a1
    430e:	0107d713          	srl	a4,a5,0x10
    4312:	01d518b3          	sll	a7,a0,t4
    4316:	02d37333          	remu	t1,t1,a3
    431a:	03c605b3          	mul	a1,a2,t3
    431e:	0342                	sll	t1,t1,0x10
    4320:	00676733          	or	a4,a4,t1
    4324:	00b77b63          	bgeu	a4,a1,433a <__udivdi3+0x21e>
    4328:	9742                	add	a4,a4,a6
    432a:	fffe0513          	add	a0,t3,-1
    432e:	17076d63          	bltu	a4,a6,44a8 <__udivdi3+0x38c>
    4332:	16b77b63          	bgeu	a4,a1,44a8 <__udivdi3+0x38c>
    4336:	1e79                	add	t3,t3,-2
    4338:	9742                	add	a4,a4,a6
    433a:	8f0d                	sub	a4,a4,a1
    433c:	02d75533          	divu	a0,a4,a3
    4340:	07c2                	sll	a5,a5,0x10
    4342:	83c1                	srl	a5,a5,0x10
    4344:	02d77733          	remu	a4,a4,a3
    4348:	02a60333          	mul	t1,a2,a0
    434c:	0742                	sll	a4,a4,0x10
    434e:	8fd9                	or	a5,a5,a4
    4350:	0067fb63          	bgeu	a5,t1,4366 <__udivdi3+0x24a>
    4354:	97c2                	add	a5,a5,a6
    4356:	fff50713          	add	a4,a0,-1
    435a:	1507e363          	bltu	a5,a6,44a0 <__udivdi3+0x384>
    435e:	1467f163          	bgeu	a5,t1,44a0 <__udivdi3+0x384>
    4362:	1579                	add	a0,a0,-2
    4364:	97c2                	add	a5,a5,a6
    4366:	010e1593          	sll	a1,t3,0x10
    436a:	406787b3          	sub	a5,a5,t1
    436e:	8dc9                	or	a1,a1,a0
    4370:	bdcd                	j	4262 <__udivdi3+0x146>
    4372:	1006b793          	sltiu	a5,a3,256
    4376:	0017b793          	seqz	a5,a5
    437a:	078e                	sll	a5,a5,0x3
    437c:	00f6d833          	srl	a6,a3,a5
    4380:	00001717          	auipc	a4,0x1
    4384:	89c70713          	add	a4,a4,-1892 # 4c1c <__clz_tab>
    4388:	9742                	add	a4,a4,a6
    438a:	00074703          	lbu	a4,0(a4)
    438e:	02000893          	li	a7,32
    4392:	973e                	add	a4,a4,a5
    4394:	40e88833          	sub	a6,a7,a4
    4398:	e6e88de3          	beq	a7,a4,4212 <__udivdi3+0xf6>
    439c:	00e65e33          	srl	t3,a2,a4
    43a0:	010696b3          	sll	a3,a3,a6
    43a4:	00de6e33          	or	t3,t3,a3
    43a8:	00e5d8b3          	srl	a7,a1,a4
    43ac:	010e5e93          	srl	t4,t3,0x10
    43b0:	03d8d7b3          	divu	a5,a7,t4
    43b4:	010e1313          	sll	t1,t3,0x10
    43b8:	010595b3          	sll	a1,a1,a6
    43bc:	01035313          	srl	t1,t1,0x10
    43c0:	00e55733          	srl	a4,a0,a4
    43c4:	8f4d                	or	a4,a4,a1
    43c6:	01075693          	srl	a3,a4,0x10
    43ca:	01061633          	sll	a2,a2,a6
    43ce:	03d8f8b3          	remu	a7,a7,t4
    43d2:	02f305b3          	mul	a1,t1,a5
    43d6:	08c2                	sll	a7,a7,0x10
    43d8:	0116e6b3          	or	a3,a3,a7
    43dc:	00b6fb63          	bgeu	a3,a1,43f2 <__udivdi3+0x2d6>
    43e0:	96f2                	add	a3,a3,t3
    43e2:	fff78893          	add	a7,a5,-1
    43e6:	0dc6e363          	bltu	a3,t3,44ac <__udivdi3+0x390>
    43ea:	0cb6f163          	bgeu	a3,a1,44ac <__udivdi3+0x390>
    43ee:	17f9                	add	a5,a5,-2
    43f0:	96f2                	add	a3,a3,t3
    43f2:	8e8d                	sub	a3,a3,a1
    43f4:	03d6d5b3          	divu	a1,a3,t4
    43f8:	0742                	sll	a4,a4,0x10
    43fa:	8341                	srl	a4,a4,0x10
    43fc:	03d6f6b3          	remu	a3,a3,t4
    4400:	02b308b3          	mul	a7,t1,a1
    4404:	06c2                	sll	a3,a3,0x10
    4406:	8f55                	or	a4,a4,a3
    4408:	01177b63          	bgeu	a4,a7,441e <__udivdi3+0x302>
    440c:	9772                	add	a4,a4,t3
    440e:	fff58693          	add	a3,a1,-1
    4412:	09c76963          	bltu	a4,t3,44a4 <__udivdi3+0x388>
    4416:	09177763          	bgeu	a4,a7,44a4 <__udivdi3+0x388>
    441a:	15f9                	add	a1,a1,-2
    441c:	9772                	add	a4,a4,t3
    441e:	07c2                	sll	a5,a5,0x10
    4420:	6ec1                	lui	t4,0x10
    4422:	8fcd                	or	a5,a5,a1
    4424:	fffe8693          	add	a3,t4,-1 # ffff <__crt0_copy_data_src_begin+0xb2e3>
    4428:	00d7f5b3          	and	a1,a5,a3
    442c:	0107d313          	srl	t1,a5,0x10
    4430:	8ef1                	and	a3,a3,a2
    4432:	8241                	srl	a2,a2,0x10
    4434:	02d58e33          	mul	t3,a1,a3
    4438:	41170733          	sub	a4,a4,a7
    443c:	02d306b3          	mul	a3,t1,a3
    4440:	010e5893          	srl	a7,t3,0x10
    4444:	02c585b3          	mul	a1,a1,a2
    4448:	95b6                	add	a1,a1,a3
    444a:	95c6                	add	a1,a1,a7
    444c:	02c30333          	mul	t1,t1,a2
    4450:	00d5f363          	bgeu	a1,a3,4456 <__udivdi3+0x33a>
    4454:	9376                	add	t1,t1,t4
    4456:	0105d693          	srl	a3,a1,0x10
    445a:	969a                	add	a3,a3,t1
    445c:	02d76363          	bltu	a4,a3,4482 <__udivdi3+0x366>
    4460:	00d70563          	beq	a4,a3,446a <__udivdi3+0x34e>
    4464:	853e                	mv	a0,a5
    4466:	4581                	li	a1,0
    4468:	8082                	ret
    446a:	66c1                	lui	a3,0x10
    446c:	16fd                	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0xb2e3>
    446e:	00d5f733          	and	a4,a1,a3
    4472:	0742                	sll	a4,a4,0x10
    4474:	00de7e33          	and	t3,t3,a3
    4478:	01051533          	sll	a0,a0,a6
    447c:	9772                	add	a4,a4,t3
    447e:	fee573e3          	bgeu	a0,a4,4464 <__udivdi3+0x348>
    4482:	fff78513          	add	a0,a5,-1
    4486:	4581                	li	a1,0
    4488:	8082                	ret
    448a:	010007b7          	lui	a5,0x1000
    448e:	02f67763          	bgeu	a2,a5,44bc <__udivdi3+0x3a0>
    4492:	01065693          	srl	a3,a2,0x10
    4496:	4741                	li	a4,16
    4498:	b345                	j	4238 <__udivdi3+0x11c>
    449a:	4581                	li	a1,0
    449c:	4505                	li	a0,1
    449e:	8082                	ret
    44a0:	853a                	mv	a0,a4
    44a2:	b5d1                	j	4366 <__udivdi3+0x24a>
    44a4:	85b6                	mv	a1,a3
    44a6:	bfa5                	j	441e <__udivdi3+0x302>
    44a8:	8e2a                	mv	t3,a0
    44aa:	bd41                	j	433a <__udivdi3+0x21e>
    44ac:	87c6                	mv	a5,a7
    44ae:	b791                	j	43f2 <__udivdi3+0x2d6>
    44b0:	1579                	add	a0,a0,-2
    44b2:	97c2                	add	a5,a5,a6
    44b4:	bbd9                	j	428a <__udivdi3+0x16e>
    44b6:	1579                	add	a0,a0,-2
    44b8:	97c2                	add	a5,a5,a6
    44ba:	b1d5                	j	419e <__udivdi3+0x82>
    44bc:	01865693          	srl	a3,a2,0x18
    44c0:	4761                	li	a4,24
    44c2:	bb9d                	j	4238 <__udivdi3+0x11c>
